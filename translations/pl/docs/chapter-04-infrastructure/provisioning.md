# Provisioning zasobów Azure za pomocą AZD

**Nawigacja po rozdziale:**
- **📚 Strona kursu głównego**: [AZD dla początkujących](../../README.md)
- **📖 Obecny rozdział**: Rozdział 4 - Infrastrukturę jako kod i wdrożenie
- **⬅️ Poprzedni**: [Przewodnik wdrożenia](deployment-guide.md)
- **➡️ Następny rozdział**: [Rozdział 5: Wieloagentowe rozwiązania AI](../../examples/retail-scenario.md)
- **🔧 Powiązane**: [Rozdział 6: Walidacja przed wdrożeniem](../chapter-06-pre-deployment/capacity-planning.md)

## Wprowadzenie

Ten przewodnik omawia provisionowanie i zarządzanie zasobami Azure za pomocą Azure Developer CLI z wbudowanymi providerami Bicep i Terraform.

> Przejrzane względem `azd 1.37.2` (listopad 2026). Jeśli nie zaznaczono inaczej, przykłady Bicep, Terraform i skryptów są **fragmentami ilustracyjnymi**, a nie kompletnym szablonem. Scal je w projekt dostarczający odwołane parametry, moduły, tożsamości, sieci i kod aplikacji. Provisionowanie Azure nie zostało wykonane w tej recenzji.

## Cele nauki

Po ukończeniu tego przewodnika:
- Opanujesz zasady Infrastructure as Code oraz provisionowanie zasobów Azure
- Zrozumiesz wielu dostawców IaC wspieranych przez Azure Developer CLI
- Zaprojektujesz i wdrożysz szablony Bicep dla popularnych architektur aplikacji
- Skonfigurujesz parametry zasobów, zmienne i ustawienia dla różnych środowisk
- Wdrożysz zaawansowane wzorce infrastruktury, w tym sieci i zabezpieczenia
- Zarządzisz cyklem życia zasobów, aktualizacjami i rozwiązywaniem zależności

## Wyniki nauki

Po ukończeniu tego kursu będziesz potrafił:
- Projektować i provisionować infrastrukturę Azure za pomocą szablonów Bicep i ARM
- Konfigurować skomplikowane architektury wielu usług z poprawnymi zależnościami zasobów
- Wdrożyć szablony parametryzowane dla wielu środowisk i konfiguracji
- Rozwiązywać problemy z provisionowaniem infrastruktury i naprawiać błędy wdrożenia
- Zastosować zasady Azure Well-Architected Framework podczas projektowania infrastruktury
- Zarządzać aktualizacjami infrastruktury i wdrażać strategie wersjonowania infrastruktury

## Przegląd provisionowania infrastruktury

Azure Developer CLI wspiera wielu dostawców Infrastructure as Code (IaC):
- **Bicep** (zalecany) - specyficzny język domenowy Azure
- **Szablony ARM** - Bicep kompiluje do ARM; surowy ARM JSON nie jest oddzielnym wbudowanym `infra.provider`
- **Terraform** - narzędzie do infrastruktury multi-cloud
- **Providerzy rozszerzeń** - wymagają osobno zainstalowanego rozszerzenia providera i jego dokumentowanej konfiguracji; nie zakładaj wsparcia dla dowolnego ciągu providera

## Zrozumienie zasobów Azure

### Hierarchia zasobów
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Popularne usługi Azure dla aplikacji
- **Obliczenia**: App Service, Container Apps, Functions, Maszyny Wirtualne
- **Przechowywanie**: Konto storage, Cosmos DB, baza danych SQL, PostgreSQL
- **Sieć**: Wirtualna sieć, Application Gateway, CDN
- **Bezpieczeństwo**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Szablony infrastruktury Bicep

### Podstawowa struktura szablonu Bicep
```bicep
// infra/modules/web.bicep - resource-group-scoped module fragment
targetScope = 'resourceGroup'
@description('The name of the environment')
param environmentName string

@description('The location for all resources')
param location string = resourceGroup().location

@description('The name of the application')
param applicationName string = 'myapp'

// Variables
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
var tags = {
  'azd-env-name': environmentName
  'azd-app': applicationName
}

// App Service Plan
resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: '${applicationName}-${environmentName}-plan'
  location: location
  tags: tags
  sku: {
    name: 'B1'
    capacity: 1
  }
  properties: {
    reserved: true // Linux App Service Plan
  }
}

// Web App
resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: '${applicationName}-web-${resourceToken}'
  location: location
  tags: union(tags, { 'azd-service-name': 'web' })
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'NODE|22-lts'
      alwaysOn: true
      ftpsState: 'Disabled'
      minTlsVersion: '1.2'
      appSettings: [
        {
          name: 'WEBSITES_ENABLE_APP_SERVICE_STORAGE'
          value: 'false'
        }
        {
          name: 'NODE_ENV'
          value: 'production'
        }
      ]
    }
    httpsOnly: true
  }
}

// Output values for azd
output WEB_URL string = 'https://${webApp.properties.defaultHostName}'
output WEB_NAME string = webApp.name
```

Dla kompletnego projektu azd wywołaj ten moduł z zakresu subskrypcji `infra/main.bicep`, który tworzy oznaczoną grupę zasobów i przekazuje jej zakres. Dopasuj `environmentName`/`location` w `main.parameters.json`. Etykieta `azd-service-name: web` kojarzy zasób z `services.web`; same dowolne nazwy wyjść nie konfigurują odkrywania usług.

### Zaawansowane wzorce Bicep

#### Modularna infrastruktura
```bicep
// infra/modules/app-service.bicep
@description('App Service configuration')
param name string
param location string
param planId string
param appSettings array = []

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: name
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: planId
    siteConfig: {
      appSettings: appSettings
      linuxFxVersion: 'NODE|22-lts'
      alwaysOn: true
    }
    httpsOnly: true
  }
}

output hostname string = webApp.properties.defaultHostName
output principalId string = webApp.identity.principalId
```

```bicep
// infra/main.bicep - Using modules
module webAppModule 'modules/app-service.bicep' = {
  name: 'webApp'
  params: {
    name: '${applicationName}-web-${resourceToken}'
    location: location
    planId: appServicePlan.id
    appSettings: [
      {
        name: 'API_URL'
        value: apiModule.outputs.endpoint
      }
      {
        name: 'DATABASE_URL'
        value: '@Microsoft.KeyVault(VaultName=${keyVault.name};SecretName=database-url)'
      }
    ]
  }
}
```

#### Warunkowe tworzenie zasobów
```bicep
@description('Whether to create a database')
param createDatabase bool = true

@description('Database SKU')
param databaseSku string = 'Basic'

resource database 'Microsoft.Sql/servers/databases@2021-11-01' = if (createDatabase) {
  name: '${sqlServer.name}/${applicationName}-db'
  location: location
  sku: {
    name: databaseSku
    tier: databaseSku == 'Basic' ? 'Basic' : 'Standard'
  }
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
  }
}
```

## 🌐 Używanie Terraform z azd

Bicep jest domyślny dla azd, ale azd wspiera także **Terraform** — przydatne, jeśli Twój zespół już go standaryzuje lub zarządzasz infrastrukturą multi-cloud. Przebieg pracy azd (`azd up`, `azd provision`, `azd down`) jest identyczny; zmienia się tylko język infrastruktury i układ folderów.

### Powiedz azd, żeby używał Terraform

Dodaj sekcję `infra` do `azure.yaml` wskazującą providera Terraform:

```yaml
# azure.yaml
name: my-terraform-app
infra:
  provider: terraform   # default is "bicep"
  path: infra           # folder containing your .tf files
services:
  web:
    project: ./src
    language: js
    host: containerapp
```

### Układ folderów Terraform

Z providera Terraform Twój folder `infra/` używa plików `.tf` zamiast Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Fragment `main.tf`

Tworzy on tylko grupę zasobów i plan, nie usługę gotową do wdrożenia. Musisz także zadeklarować zmienne wejściowe, kompatybilnego providera `azurerm`, aplikację webową oraz mapowanie tagów/nazw zasobów usługi.

```hcl
# infra/main.tf
resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.environment_name}"
  location = var.location
  tags     = { "azd-env-name" = var.environment_name }
}

resource "azurerm_service_plan" "plan" {
  name                = "plan-${var.environment_name}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "B1"
}
```

### Jak azd łączy się z Twoimi wyjściami Terraform

azd odczytuje **outputs** Terraform jako wartości środowiskowe. Ten fragment zakłada, że zdefiniowałeś `azurerm_linux_web_app.web`; odkrywanie usług nadal wymaga dopasowanej nazwy zasobu lub etykiety `azd-service-name`:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **Ważne:** azd używa etykiety `azd-env-name` i wyjść `AZURE_*` do śledzenia zasobów na środowisko. Zawsze oznacz swoją grupę zasobów `"azd-env-name" = var.environment_name`, aby `azd down` mógł znaleźć i usunąć wszystko.

### Deployment z Terraform

Polecenia są dokładnie takie same jak dla Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **Wymagania wstępne:** Terraform musi być zainstalowany i dostępny w `PATH`. azd zarządza *przebiegiem pracy* Terraform, ale nie instaluje Terraform dla Ciebie. Dla stanu, azd domyślnie używa stanu lokalnego; dla zespołów skonfiguruj remote backend (na przykład Azure Storage backend) w `provider.tf`.

Dla kompletnych, gotowych do uruchomienia starterów opartych na Terraform przeglądaj [Awesome AZD gallery](https://azure.github.io/awesome-azd/) i filtruj po Terraform lub zobacz oficjalną [dokumentację azd Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Inne narzędzia infrastruktury

Pulumi nie jest wbudowanym dostawcą provisioningowym azd 1.37.2. Samo ustawienie `infra.provider: pulumi` nie ustanawia działającej integracji, a `azd env new` nie tworzy/wybiera automatycznie stosu Pulumi. Jeśli używasz innego narzędzia IaC, postępuj zgodnie z dokumentacją zweryfikowanego rozszerzenia providera lub zarządzaj jego cyklem życia explicite w swoim workflow. Ten kurs nie dostarcza ani nie weryfikuje providera Pulumi.

## 🎯 Wybór hosta dla Twojej usługi

Pole `host` w `azure.yaml` decyduje, gdzie działa Twój kod. azd wspiera kilka hostów — wybór właściwego jest ważniejszy niż język infrastruktury. Oto przyjazne dla początkujących porównanie:

| Wartość `host` | Najlepsze dla | Dlaczego |
|--------------|----------|-----|
| `appservice` | Tradycyjne aplikacje webowe i API | Najprostszy PaaS; nie wymaga kontenerów |
| `staticwebapp` | Front-end SPAs (React, Vue, Angular) | Globalny CDN + darmowy SSL, wbudowane wsparcie API |
| `function` | Przetwarzanie zdarzeniowe i serverless | Skalowanie do zera, płatność za wykonanie |
| `containerapp` | Kontenerowe mikrousługi | Kontenery serverless, skalowanie do zera, wbudowany ingress |
| `aks` | Złożone potrzeby orkiestracji | Pełna kontrola Kubernetes, gdy naprawdę jej potrzebujesz |
| `springapp` | Istniejące wdrożenia Azure Spring Apps | Starszy target; usługa zamknięta dla nowych klientów od 31 marca 2028 |

### Kiedy sięgnąć po AKS

**Azure Kubernetes Service (`host: aks`)** daje pełną moc Kubernetes — własne kontrolery, service meshes, złożoną sieć i precyzyjne harmonogramowanie. Ta moc wiąże się z operacyjnym nakładem: zarządzasz pula węzłów, aktualizacjami i siecią klastra.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Zacznij od prostszego, jeśli możesz.** Dla większości mikrousług **Container Apps** daje kontenery, autoskalowanie i skalowanie do zera bez zarządzania klastrem. Wybierz AKS tylko wtedy, gdy potrzebujesz funkcji specyficznych dla Kubernetes.

### Kiedy użyć Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** to zarządzane środowisko uruchomieniowe stworzone specjalnie dla Spring Boot. Obsługuje service discovery, serwer konfiguracji i blue-green deployment, więc zespoły Java nie muszą uruchamiać własnej infrastruktury.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Nie wybieraj Azure Spring Apps dla nowego projektu dla początkujących: jest zamknięty dla nowych klientów i [zostanie wycofany 31 marca 2028](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). Preferuj wspierane alternatywy, takie jak Container Apps, i planuj migrację istniejących wdrożeń.

## 🗃️ Provisionowanie bazy danych

### Cosmos DB
```bicep
resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
  name: '${applicationName}-cosmos-${resourceToken}'
  location: location
  tags: tags
  kind: 'GlobalDocumentDB'
  properties: {
    databaseAccountOfferType: 'Standard'
    locations: [
      {
        locationName: location
        failoverPriority: 0
        isZoneRedundant: false
      }
    ]
    capabilities: [
      {
        name: 'EnableServerless'
      }
    ]
  }
}

resource cosmosDatabase 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases@2023-04-15' = {
  parent: cosmosAccount
  name: '${applicationName}db'
  properties: {
    resource: {
      id: '${applicationName}db'
    }
  }
}

resource todoContainer 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers@2023-04-15' = {
  parent: cosmosDatabase
  name: 'todos'
  properties: {
    resource: {
      id: 'todos'
      partitionKey: {
        paths: ['/userId']
        kind: 'Hash'
      }
    }
  }
}
```

### PostgreSQL
**Wymagania fragmentu:** zadeklaruj `@secure() param databasePassword string` i użyj mocnej wartości dostarczonej. Wybierz dostęp publiczny **lub** zintegruj delegowaną podsieć/ prywatny DNS poniżej; dwa fragmenty nie łączą się automatycznie.

```bicep
resource postgresServer 'Microsoft.DBforPostgreSQL/flexibleServers@2022-12-01' = {
  name: '${applicationName}-postgres-${resourceToken}'
  location: location
  tags: tags
  sku: {
    name: 'Standard_B1ms'
    tier: 'Burstable'
  }
  properties: {
    version: '14'
    administratorLogin: 'dbadmin'
    administratorLoginPassword: databasePassword
    storage: {
      storageSizeGB: 32
    }
    backup: {
      backupRetentionDays: 7
      geoRedundantBackup: 'Disabled'
    }
    highAvailability: {
      mode: 'Disabled'
    }
  }
}

resource postgresDatabase 'Microsoft.DBforPostgreSQL/flexibleServers/databases@2022-12-01' = {
  parent: postgresServer
  name: '${applicationName}db'
  properties: {
    charset: 'utf8'
    collation: 'en_US.utf8'
  }
}

// Allow Azure services to connect
resource firewallRule 'Microsoft.DBforPostgreSQL/flexibleServers/firewallRules@2022-12-01' = {
  parent: postgresServer
  name: 'AllowAzureServices'
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '0.0.0.0'
  }
}
```

Reguła `0.0.0.0` pozwala na połączenia z usług Azure poza własną subskrypcją. To nie jest prywatna sieć; preferuj ograniczony projekt sieci dla prawdziwych obciążeń.

## 🔒 Zarządzanie bezpieczeństwem i sekretami

### Integracja z Key Vault
```bicep
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: '${applicationName}-kv-${resourceToken}'
  location: location
  tags: tags
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    enableRbacAuthorization: true
    enableSoftDelete: true
    softDeleteRetentionInDays: 7
  }
}

// Grant Key Vault access to the web app
resource webAppKeyVaultAccess 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(keyVault.id, webApp.id, 'Key Vault Secrets User')
  scope: keyVault
  properties: {
    roleDefinitionId: subscriptionResourceId(
      'Microsoft.Authorization/roleDefinitions',
      '4633458b-17de-408a-b874-0445c86b69e6' // Key Vault Secrets User
    )
    principalId: webApp.identity.principalId
    principalType: 'ServicePrincipal'
  }
}

// Store database connection string in Key Vault
resource databaseConnectionSecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'database-connection-string'
  properties: {
    value: 'Server=${postgresServer.properties.fullyQualifiedDomainName};Database=${postgresDatabase.name};Port=5432;User Id=${postgresServer.properties.administratorLogin};Password=${databasePassword};'
  }
}
```

### Konfiguracja Managed Identity
```bicep
resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: '${applicationName}-web-${resourceToken}'
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      appSettings: [
        {
          name: 'DATABASE_CONNECTION_STRING'
          value: '@Microsoft.KeyVault(VaultName=${keyVault.name};SecretName=database-connection-string)'
        }
        {
          name: 'NODE_ENV'
          value: 'production'
        }
      ]
    }
  }
}
```

Dla tożsamości przypisanej systemowo nie ustawiaj `AZURE_CLIENT_ID` na jej ID główne. Tożsamość przypisana użytkownikowi używa **client ID**, nie obiektu/ID głównego. Odniesienie do Key Vault wymaga także przypisania roli vault oraz dostępu sieciowego tożsamości aplikacji.

## 🌍 Sieć i łączność

### Konfiguracja wirtualnej sieci
```bicep
resource vnet 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: '${applicationName}-vnet-${resourceToken}'
  location: location
  tags: tags
  properties: {
    addressSpace: {
      addressPrefixes: ['10.0.0.0/16']
    }
    subnets: [
      {
        name: 'app-subnet'
        properties: {
          addressPrefix: '10.0.1.0/24'
          serviceEndpoints: [
            {
              service: 'Microsoft.Storage'
            }
            {
              service: 'Microsoft.KeyVault'
            }
          ]
        }
      }
      {
        name: 'db-subnet'
        properties: {
          addressPrefix: '10.0.2.0/24'
          delegations: [
            {
              name: 'postgres-delegation'
              properties: {
                serviceName: 'Microsoft.DBforPostgreSQL/flexibleServers'
              }
            }
          ]
        }
      }
    ]
  }
}

// Private DNS Zone for PostgreSQL
resource privateDnsZone 'Microsoft.Network/privateDnsZones@2020-06-01' = {
  name: '${applicationName}.postgres.database.azure.com'
  location: 'global'
  tags: tags
}

resource privateDnsZoneLink 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = {
  parent: privateDnsZone
  name: '${applicationName}-dns-link'
  location: 'global'
  properties: {
    registrationEnabled: false
    virtualNetwork: {
      id: vnet.id
    }
  }
}
```

### Application Gateway z SSL
**Niekompletny fragment architektury, nie nadaje się do wdrożenia:** dodaj dedykowany `gateway-subnet` do VNet oraz puli backendów, ustawienia HTTP, nasłuchiwacze, reguły routingu z priorytetami oraz certyfikat TLS (lub autoryzowane odniesienie Key Vault). Samo otwarcie portu 443 nie konfiguruje HTTPS.

```bicep
resource publicIP 'Microsoft.Network/publicIPAddresses@2023-04-01' = {
  name: '${applicationName}-agw-pip-${resourceToken}'
  location: location
  tags: tags
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

resource applicationGateway 'Microsoft.Network/applicationGateways@2023-04-01' = {
  name: '${applicationName}-agw-${resourceToken}'
  location: location
  tags: tags
  properties: {
    sku: {
      name: 'Standard_v2'
      tier: 'Standard_v2'
      capacity: 1
    }
    gatewayIPConfigurations: [
      {
        name: 'appGatewayIpConfig'
        properties: {
          subnet: {
            id: '${vnet.id}/subnets/gateway-subnet'
          }
        }
      }
    ]
    frontendIPConfigurations: [
      {
        name: 'appGatewayFrontendIP'
        properties: {
          publicIPAddress: {
            id: publicIP.id
          }
        }
      }
    ]
    frontendPorts: [
      {
        name: 'port80'
        properties: {
          port: 80
        }
      }
      {
        name: 'port443'
        properties: {
          port: 443
        }
      }
    ]
  }
}
```

## 📊 Monitoring i obserwowalność

### Application Insights
```bicep
resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: '${applicationName}-logs-${resourceToken}'
  location: location
  tags: tags
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
  }
}

resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: '${applicationName}-ai-${resourceToken}'
  location: location
  tags: tags
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalytics.id
  }
}

// Output connection string for applications
output APPLICATION_INSIGHTS_CONNECTION_STRING string = applicationInsights.properties.ConnectionString
```

### Własne metryki i alerty
```bicep
resource cpuAlert 'Microsoft.Insights/metricAlerts@2018-03-01' = {
  name: '${applicationName}-cpu-alert'
  location: 'global'
  tags: tags
  properties: {
    description: 'Alert when CPU usage is high'
    severity: 2
    enabled: true
    scopes: [appServicePlan.id]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    criteria: {
      'odata.type': 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
      allOf: [
        {
          name: 'CPU Usage'
          metricName: 'CpuPercentage'
          metricNamespace: 'Microsoft.Web/serverfarms'
          operator: 'GreaterThan'
          threshold: 80
          timeAggregation: 'Average'
        }
      ]
    }
    actions: [
      {
        actionGroupId: actionGroup.id
      }
    ]
  }
}
```

## 🔧 Konfiguracje specyficzne dla środowiska

### Pliki parametrów dla różnych środowisk
Poniższe dwa pliki są **alternatywnymi przykładami plików parametrów**. azd nie wybiera automatycznie `main.parameters.dev.json` lub `main.parameters.prod.json` według nazwy środowiska. Użyj rzeczywistego `main.parameters.json` z substytucjami środowiska (na przykład `${APP_SERVICE_SKU=B1}`) i deklaruj/konsumuj każdy parametr w Bicep.

Przykładowa zawartość dla `infra/main.parameters.dev.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSku": {
      "value": "B1"
    },
    "databaseSku": {
      "value": "Standard_B1ms"
    },
    "enableBackup": {
      "value": false
    }
  }
}
```

Przykładowa zawartość dla `infra/main.parameters.prod.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSku": {
      "value": "P1v3"
    },
    "databaseSku": {
      "value": "Standard_D2s_v3"
    },
    "enableBackup": {
      "value": true
    },
    "replicaCount": {
      "value": 3
    }
  }
}
```

### Warunkowe provisionowanie zasobów
```bicep
@description('Environment type (dev, staging, prod)')
@allowed(['dev', 'staging', 'prod'])
param environmentType string = 'dev'

// Development resources
resource devStorage 'Microsoft.Storage/storageAccounts@2023-01-01' = if (environmentType == 'dev') {
  name: 'stdev${resourceToken}'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

// Production resources with geo-redundancy
resource prodStorage 'Microsoft.Storage/storageAccounts@2023-01-01' = if (environmentType == 'prod') {
  name: 'stprod${resourceToken}'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_GRS'
  }
  properties: {
    accessTier: 'Hot'
    supportsHttpsTrafficOnly: true
    minimumTlsVersion: 'TLS1_2'
  }
}
```

## 🚀 Zaawansowane wzorce provisionowania

### Wdrożenie wieloregionalne
```bicep
@description('Primary region')
param primaryLocation string = 'eastus2'

@description('Secondary region')
param secondaryLocation string = 'westus2'

// Primary region resources
module primaryRegion 'modules/region.bicep' = {
  name: 'primary-region'
  params: {
    location: primaryLocation
    isPrimary: true
    applicationName: applicationName
    environmentName: environmentName
  }
}

// Secondary region resources
module secondaryRegion 'modules/region.bicep' = {
  name: 'secondary-region'
  params: {
    location: secondaryLocation
    isPrimary: false
    applicationName: applicationName
    environmentName: environmentName
  }
}

// Traffic Manager for global load balancing
resource trafficManager 'Microsoft.Network/trafficmanagerprofiles@2022-04-01' = {
  name: '${applicationName}-tm-${resourceToken}'
  location: 'global'
  properties: {
    profileStatus: 'Enabled'
    trafficRoutingMethod: 'Priority'
    dnsConfig: {
      relativeName: '${applicationName}-${environmentName}'
      ttl: 30
    }
    monitorConfig: {
      protocol: 'HTTPS'
      port: 443
      path: '/health'
    }
    endpoints: [
      {
        name: 'primary-endpoint'
        type: 'Microsoft.Network/trafficManagerProfiles/azureEndpoints'
        properties: {
          targetResourceId: primaryRegion.outputs.webAppId
          priority: 1
        }
      }
      {
        name: 'secondary-endpoint'
        type: 'Microsoft.Network/trafficManagerProfiles/azureEndpoints'
        properties: {
          targetResourceId: secondaryRegion.outputs.webAppId
          priority: 2
        }
      }
    ]
  }
}
```

### Testowanie infrastruktury
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

Provisionowanie infrastruktury nie wdraża Twojego kodu aplikacji. Uruchamiaj testy aplikacji tylko po `azd deploy`/`azd up` i używaj `/health` tylko jeśli Twoja aplikacja ją implementuje. Skrypty wdrożeniowe ARM tworzą zasoby Azure i wymagają dodatkowej tożsamości, wspieranych wersji środowiska uruchomieniowego i uprawnień; nie są lokalnymi testami jednostkowymi.

## 🧪 Podgląd i walidacja infrastruktury (NOWOŚĆ)

### Podejrzyj zmiany infrastruktury przed wdrożeniem

Funkcja `azd provision --preview` pozwala Ci **symulować provisionowanie infrastruktury** przed faktycznym wdrożeniem zasobów. Jest podobna duchem do `terraform plan` lub `bicep what-if`, dając **suchy podgląd** zmian, które zostałyby wprowadzone w środowisku Azure.

#### 🛠️ Co robi
- **Analizuje twoje szablony IaC** (Bicep lub Terraform)
- **Pokazuje podgląd zmian zasobów**: dodania, usunięcia, aktualizacje
- **Nie stosuje proponowanych zmian przez providera** — najpierw sprawdź hooki projektu; skrypty mogą mieć skutki uboczne i podgląd nadal wymaga uprawnień Azure

#### Przypadki użycia
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

To polecenie pomaga Ci:
- **Zweryfikować zmiany infrastruktury** przed zaangażowaniem zasobów
- **Wcześnie wykryć błędy konfiguracji** podczas cyklu rozwoju
- **Bezpiecznie współpracować** w środowisku zespołowym
- **Zapewnić wdrożenia na zasadzie najmniejszych uprawnień** bez niespodzianek

Jest szczególnie przydatne, gdy:
- Pracujesz ze złożonymi środowiskami wielu usług
- Wprowadzasz zmiany do infrastruktury produkcyjnej
- Weryfikujesz modyfikacje szablonów przed zatwierdzeniem PR
- Szkolisz nowych członków zespołu w wzorcach infrastruktury

### Przykładowe wyjście podglądu
Dokładny podgląd różni się w zależności od providera i struktury projektu, ale wynik powinien wyraźnie identyfikować proponowane zmiany przed ich zastosowaniem.

```text
$ azd provision --preview

🔍 Previewing infrastructure changes...

The following resources will be created:
  + azurerm_resource_group.rg
  + azurerm_app_service_plan.plan
  + azurerm_linux_web_app.web
  + azurerm_cosmosdb_account.cosmos

The following resources will be modified:
  ~ azurerm_key_vault.kv
    ~ access_policy (forces replacement)

The following resources will be destroyed:
  - azurerm_storage_account.old_storage

⚠️  Warning: 1 resource will be replaced

✅ Preview completed successfully!
```

## �🔄 Aktualizacje i migracje zasobów

### Bezpieczne aktualizacje zasobów
```bash
# Preview infrastructure changes first (RECOMMENDED)
azd provision --preview

# Apply changes after preview confirmation
azd provision
# In automation, --no-prompt uses known values and fails on unresolved decisions;
# it is not an approval bypass.

# For rollback, use Git to revert infrastructure changes:
git revert HEAD  # Revert last infrastructure commit
azd provision    # Apply previous infrastructure state
```

### Migracje bazy danych
**Niekompletny wzór skryptu wdrożeniowego:** wymaga skonfigurowanej tożsamości przypisanej użytkownikowi tam, gdzie potrzeba, wspieranego środowiska Azure CLI, dostępnych narzędzi migracji, dostarczonego katalogu/konfiguracji migracji oraz łączności z bazą danych. Nie jest wykonywalny wyłącznie przez wklejenie tego zasobu do szablonu.

```bicep
resource migrationScript 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
  name: 'database-migration'
  location: location
  kind: 'AzureCLI'
  properties: {
    azCliVersion: '2.40.0'
    scriptContent: '''
      # Install database migration tools
      npm install -g db-migrate db-migrate-pg
      
      # Run migrations
      db-migrate up --config database.json --env production
      
      echo "Database migration completed successfully"
    '''
    environmentVariables: [
      {
        name: 'DATABASE_URL'
        secureValue: databaseConnectionString
      }
    ]
    timeout: 'PT30M'
    cleanupPreference: 'OnSuccess'
    retentionInterval: 'P1D'
  }
}
```

## 🎯 Najlepsze praktyki

### 1. Konwencje nazewnictwa zasobów
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. Strategia oznaczania (tagowania)
```bicep
// utcNow is only allowed in a parameter default, not directly in a variable.
param deploymentDate string = utcNow('yyyy-MM-dd')

var commonTags = {
  'azd-env-name': environmentName
  'azd-app': applicationName
  'environment': environmentName
  'cost-center': 'engineering'
  'owner': 'platform-team'
  'project': applicationName
  'deployment-date': deploymentDate
}
```

### 3. Walidacja parametrów
```bicep
@description('Environment name')
@minLength(3)
@maxLength(20)
param environmentName string

@description('Location for resources')
@allowed(['eastus2', 'westus2', 'centralus'])
param location string

@description('App Service SKU')
@allowed(['B1', 'B2', 'S1', 'S2', 'P1v3', 'P2v3'])
param appServiceSku string = 'B1'
```

### 4. Organizacja wyjść
```bicep
// Service endpoints
output WEB_URL string = 'https://${webApp.properties.defaultHostName}'
output API_URL string = 'https://${apiApp.properties.defaultHostName}'

// Resource identifiers
output WEB_APP_NAME string = webApp.name
output API_APP_NAME string = apiApp.name
output DATABASE_NAME string = database.name

// Connection strings (for secure reference)
output DATABASE_CONNECTION_STRING_KEY string = '@Microsoft.KeyVault(VaultName=${keyVault.name};SecretName=database-connection-string)'
```

## Kolejne kroki

- [Planowanie przed wdrożeniem](../chapter-06-pre-deployment/capacity-planning.md) - Weryfikacja dostępności zasobów
- [Typowe problemy](../chapter-07-troubleshooting/common-issues.md) - Rozwiązywanie problemów z infrastrukturą
- [Przewodnik po debugowaniu](../chapter-07-troubleshooting/debugging.md) - Rozwiązywanie problemów z provisioningiem
- [Wybór SKU](../chapter-06-pre-deployment/sku-selection.md) - Wybierz odpowiednie poziomy usług

## Dodatkowe zasoby

- [Dokumentacja Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Szablony Azure Resource Manager](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Centrum architektury Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Nawigacja**
- **Poprzednia lekcja**: [Przewodnik wdrażania](deployment-guide.md)
- **Następna lekcja**: [Planowanie pojemności](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->