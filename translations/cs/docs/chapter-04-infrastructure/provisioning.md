# Zajištění zdrojů Azure pomocí AZD

**Navigace kapitolou:**
- **📚 Domovská stránka kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 4 - Infrastruktura jako kód a nasazení
- **⬅️ Předchozí**: [Průvodce nasazením](deployment-guide.md)
- **➡️ Další kapitola**: [Kapitola 5: Víceagentní AI řešení](../../examples/retail-scenario.md)
- **🔧 Související**: [Kapitola 6: Přednasazovací ověření](../chapter-06-pre-deployment/capacity-planning.md)

## Úvod

Tento průvodce pokrývá zajištění a správu zdrojů Azure pomocí Azure Developer CLI s integrovanými poskytovateli Bicep a Terraform.

> Přezkoumáno k datu `azd 1.37.2` (listopad 2026). Pokud není uvedeno jinak, příklady Bicep, Terraform a skriptů jsou **ilustrační úryvky**, nikoli kompletní šablony. Sloučte je do projektu, který poskytuje odkázané parametry, moduly, identity, síťování a aplikační kód. V tomto přezkumu nebylo provedeno nasazení Azure.

## Cíle učení

Po dokončení tohoto průvodce budete:
- Zvládat principy infrastruktury jako kódu a provisioning zdrojů Azure
- Rozumět několika poskytovatelům IaC podporovaným Azure Developer CLI
- Navrhovat a implementovat Bicep šablony pro běžné aplikační architektury
- Konfigurovat parametry zdrojů, proměnné a nastavení specifická pro prostředí
- Implementovat pokročilé vzory infrastruktury včetně síťování a zabezpečení
- Spravovat životní cyklus zdrojů, aktualizace a řešení závislostí

## Výsledky učení

Po dokončení budete schopni:
- Navrhovat a zajistit infrastrukturu Azure pomocí Bicep a ARM šablon
- Konfigurovat složité více-službové architektury s řízenými závislostmi zdrojů
- Implementovat parametrizované šablony pro více prostředí a konfigurací
- Řešit problémy se zajištěním infrastruktury a opravovat chyby nasazení
- Aplikovat principy Azure Well-Architected Framework při návrhu infrastruktury
- Spravovat aktualizace infrastruktury a implementovat strategie verzování infrastruktury

## Přehled zajištění infrastruktury

Azure Developer CLI podporuje několik poskytovatelů infrastruktury jako kódu (IaC):
- **Bicep** (doporučeno) - doménově specifický jazyk Azure
- **ARM šablony** - Bicep se překládá do ARM; surový ARM JSON není samostatný zabudovaný `infra.provider`
- **Terraform** - nástroj pro infrastrukturu multi-cloud
- **Rozšiřující poskytovatelé** - vyžadují samostatně nainstalované rozšíření poskytovatele a jeho dokumentovanou konfiguraci; nepředpokládejte, že je podporován libovolný řetězec poskytovatele

## Pochopení zdrojů Azure

### Hierarchie zdrojů
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Běžné služby Azure pro aplikace
- **Výpočet**: App Service, Container Apps, Functions, Virtuální stroje
- **Úložiště**: Storage Account, Cosmos DB, SQL Databáze, PostgreSQL
- **Síťování**: Virtuální síť, Application Gateway, CDN
- **Zabezpečení**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Služby, Azure OpenAI, Azure Machine Learning

## Bicep infrastruktura šablony

### Základní struktura Bicep šablony
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

Pro kompletní azd projekt zavolejte tento modul z předplatitelsky omezeného `infra/main.bicep`, který vytvoří označenou skupinu zdrojů a předá její rozsah. Ujistěte se, že `environmentName`/`location` v `main.parameters.json` odpovídá. Značka `azd-service-name: web` přiřazuje zdroj k `services.web`; samotné libovolné názvy výstupů službu nenakonfigurují.

### Pokročilé Bicep vzory

#### Modulární infrastruktura
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

#### Podmíněné vytváření zdrojů
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

## 🌐 Použití Terraform s azd

Bicep je výchozí v azd, ale azd také podporuje **Terraform** – užitečné, pokud váš tým již používá Terraform nebo spravujete multi-cloud infrastrukturu. Průběh azd (`azd up`, `azd provision`, `azd down`) je stejný; mění se pouze jazyk infrastruktury a struktura složek.

### Nastavení azd pro použití Terraform

Přidejte sekci `infra` do `azure.yaml` s odkazem na Terraform poskytovatele:

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

### Struktura složek Terraform

Se Terraform poskytovatelem váš `infra/` adresář používá `.tf` soubory místo Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Fragment `main.tf`

Tento úryvek pouze vytvoří skupinu zdrojů a plán, nikoli nasaditelnou službu. Musíte také deklarovat vstupní proměnné, kompatibilního poskytovatele `azurerm`, webovou aplikaci a jejích mapování služeb a názvů zdrojů.

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

### Jak azd navazuje na Terraform výstupy

azd načítá Terraform **výstupy** jako hodnoty prostředí. Tento fragment předpokládá, že jste definovali `azurerm_linux_web_app.web`; objevování služeb stále vyžaduje odpovídající název zdroje nebo značku `azd-service-name`:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **Důležité:** azd používá značku `azd-env-name` a výstupy `AZURE_*` ke sledování zdrojů na prostředí. Vždy označte svou skupinu zdrojů `"azd-env-name" = var.environment_name`, aby `azd down` mohl vše najít a odstranit.

### Nasazení pomocí Terraform

Příkazy jsou přesně stejné jako u Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **Předpoklad:** Terraform musí být nainstalován a v cestě vašeho `PATH`. azd řídí Terraform *průběh práce*, ale Terraform za vás neinicializuje. Pro stav používá azd výchozí lokální stav; pro týmy nakonfigurujte vzdálené úložiště (například Azure Storage backend) v `provider.tf`.

Pro kompletní a spustitelné startovací šablony založené na Terraform projděte [Awesome AZD galerie](https://azure.github.io/awesome-azd/) a filtrujte podle Terraform, nebo si prohlédněte oficiální [azd Terraform dokumentaci](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Další nástroje pro infrastrukturu

Pulumi není vestavěný poskytovatel zásobování v azd 1.37.2. Pouhé nastavení `infra.provider: pulumi` nezajišťuje funkční integraci a `azd env new` automaticky nevytváří ani nevybírá Pulumi stack. Pokud používáte jiný IaC nástroj, dodržujte dokumentaci ověřeného rozšiřujícího poskytovatele nebo explicitně spravujte jeho životní cyklus ve vlastním pracovním postupu. Tento kurz neposkytuje ani neověřuje Pulumi poskytovatele.

## 🎯 Výběr hostitele pro vaši službu

Pole `host` v `azure.yaml` rozhoduje, kde váš kód poběží. azd podporuje několik hostitelů – výběr správného je důležitější než jazyk infrastruktury. Přehled přátelský pro začátečníky:

| Hodnota `host` | Nejvhodnější pro | Proč |
|--------------|----------|-----|
| `appservice` | Tradiční webové aplikace a API | Nejjednodušší PaaS; nejsou potřeba kontejnery |
| `staticwebapp` | Front-end SPA (React, Vue, Angular) | Globální CDN + bezplatný SSL, vestavěná podpora API |
| `function` | Událostmi řízené a serverless pracovní zátěže | Škálování na nulu, platba za výkon |
| `containerapp` | Kontejnerové mikroslužby | Serverless kontejnery, škálování na nulu, vestavěný přístup |
| `aks` | Složité orchestraci potřeby | Plná kontrola Kubernetes, když je opravdu potřebujete |
| `springapp` | Existující nasazení Azure Spring Apps | Zastaralý cíl; služba končí 31. března 2028 a je uzavřena novým zákazníkům |

### Kdy použít AKS

**Azure Kubernetes Service (`host: aks`)** vám poskytuje plnou sílu Kubernetes – vlastní kontroléry, service meshes, složité síťování a jemné plánování. Tato síla přináší provozní režii: spravujete node pooly, aktualizace a síťování clusteru.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Začněte jednodušeji, pokud můžete.** Pro většinu mikroslužeb nabízí **Container Apps** kontejnery, autoskalování a škálování na nulu bez správy clusteru. AKS vyberte jenom pokud potřebujete specifické funkce Kubernetes.

### Kdy použít Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** je spravovaný runtime zaměřený na Spring Boot. Zajišťuje objevování služeb, konfigurační server a blue-green deployment, takže Java týmy nemusí spravovat vlastní infrastrukturu.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Nepoužívejte Azure Spring Apps pro nový začátečnický projekt: je uzavřen pro nové zákazníky a [bude ukončen 31. března 2028](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). Upřednostňujte podporované alternativy jako Container Apps a plánujte migraci stávajících nasazení.

## 🗃️ Zajištění databáze

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
**Předpoklady fragmentu:** deklarujte `@secure() param databasePassword string` a použijte silnou dodanou hodnotu. Vyberte veřejný přístup **nebo** integrujte delegovanou podsíť/soukromý DNS níže; dva úryvky se automaticky nespojí.

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

Pravidlo `0.0.0.0` umožňuje připojení z Azure služeb mimo vaši vlastní předplatnou. Není to privátní síťování; pro reálné pracovní zátěže preferujte omezený síťový design.

## 🔒 Zabezpečení a správa tajemství

### Integrace Key Vault
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

### Konfigurace spravované identity
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

Pro systémem přiřazenou identitu nepřiřazujte `AZURE_CLIENT_ID` k jejímu ID hlavního uživatele. Uživatelem přiřazená identita používá své **ID klienta**, ne svůj objektové/principální ID. Reference Key Vault také potřebuje přiřazení role vault k identitě aplikace a síťový přístup.

## 🌍 Síťování a konektivita

### Konfigurace virtuální sítě
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

### Application Gateway s SSL
**Neúplný architektonický fragment, nikoli nasaditelný gateway:** přidejte vyhrazené `gateway-subnet` do VNet a backendové pooly, HTTP nastavení, posluchače, směrovací pravidla s prioritami a TLS certifikát (nebo autorizovanou Key Vault referenci). Pouhé otevření portu 443 nezajišťuje HTTPS.

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

## 📊 Monitorování a pozorovatelnost

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

### Vlastní metriky a upozornění
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

## 🔧 Nastavení specifická pro prostředí

### Soubory parametrů pro různá prostředí
Níže uvedené dva soubory jsou **alternativní příklady parametrických souborů**. azd automaticky nevybírá `main.parameters.dev.json` nebo `main.parameters.prod.json` podle názvu prostředí. Použijte skutečný `main.parameters.json` s náhradami prostředí (například `${APP_SERVICE_SKU=B1}`) a deklarujte/spotřebovávejte každý parametr v Bicep.

Příklad obsahu pro `infra/main.parameters.dev.json`:

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

Příklad obsahu pro `infra/main.parameters.prod.json`:

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

### Podmíněné zajištění zdrojů
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

## 🚀 Pokročilé vzory zajištění

### Více-regionální nasazení
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

### Testování infrastruktury
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

Zajištění infrastruktury nenasazuje váš aplikační kód. Kontroly aplikace provádějte až po `azd deploy`/`azd up` a používejte `/health`, jen pokud ji vaše aplikace implementuje. ARM nasazovací skripty vytváří Azure zdroje a vyžadují další identitu, podporované verze runtime a oprávnění; nejsou to lokální jednotkové testy.

## 🧪 Náhled a ověřování infrastruktury (NOVINKA)

### Náhled změn infrastruktury před nasazením

Funkce `azd provision --preview` vám umožňuje **simulovat zajištění infrastruktury** před skutečným nasazením zdrojů. Je podobná duchu `terraform plan` nebo `bicep what-if` a poskytuje **suchý test** změn ve vašem prostředí Azure.

#### 🛠️ Co dělá
- **Analyzuje vaše IaC šablony** (Bicep nebo Terraform)
- **Ukazuje náhled změn zdrojů**: přidání, odstranění, aktualizace
- **Nepoužívá navržené změny infrastruktury poskytovatelem** — nejdříve zkontrolujte háky projektu; skripty mohou mít vedlejší efekty a náhled stále vyžaduje oprávnění Azure

#### Použití
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

Tento příkaz vám pomáhá:
- **Ověřit změny infrastruktury** před přidáním zdrojů
- **Zachytit chybná nastavení brzy** v průběhu vývoje
- **Bezpečně spolupracovat** v týmových prostředích
- **Zajistit nasazení s minimálními oprávněními** bez překvapení

Je obzvlášť užitečný při:
- Práci s komplexními více-službovými prostředími
- Změnách výrobní infrastruktury
- Ověřování šablon před schválením PR
- Školení nových členů týmu na vzorech infrastruktury

### Příklad výstupu náhledu
Přesný výstup náhledu se liší podle poskytovatele a struktury projektu, ale výsledek by měl jasně identifikovat navržené změny před jejich použitím.

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

## �🔄 Aktualizace a migrace zdrojů

### Bezpečné aktualizace zdrojů
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

### Migrace databáze
**Neúplný vzor nasazovacího skriptu:** vyžaduje nakonfigurovanou uživatelsky přiřazenou identitu tam, kde je potřeba, podporované verze Azure CLI runtime, dostupné migrační nástroje, dodaný migrační adresář/konfiguraci a připojení k databázi. Není spustitelný pouze vložením tohoto zdroje do šablony.

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

## 🎯 Nejlepší postupy

### 1. Konvence pojmenování zdrojů
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. Strategie označování (tagging)
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

### 3. Validace parametrů
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

### 4. Organizace výstupů
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

## Další kroky

- [Plánování před nasazením](../chapter-06-pre-deployment/capacity-planning.md) - Ověření dostupnosti zdrojů
- [Běžné problémy](../chapter-07-troubleshooting/common-issues.md) - Řešení problémů s infrastrukturou
- [Průvodce laděním](../chapter-07-troubleshooting/debugging.md) - Řešení problémů s provisioningem
- [Výběr SKU](../chapter-06-pre-deployment/sku-selection.md) - Výběr vhodných servisních úrovní

## Další zdroje

- [Dokumentace Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Šablony Azure Resource Manager](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigace**
- **Předchozí lekce**: [Průvodce nasazením](deployment-guide.md)
- **Následující lekce**: [Plánování kapacity](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->