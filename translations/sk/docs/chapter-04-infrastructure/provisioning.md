# Provisionovanie Azure zdrojov pomocou AZD

**Navigácia kapitolou:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 4 - Infrastructure as Code & Deployment
- **⬅️ Predchádzajúca**: [Deployment Guide](deployment-guide.md)
- **➡️ Nasledujúca kapitola**: [Kapitola 5: Multi-agentné AI riešenia](../../examples/retail-scenario.md)
- **🔧 Súvisiace**: [Kapitola 6: Pred nasadením validácie](../chapter-06-pre-deployment/capacity-planning.md)

## Úvod

Tento návod pokrýva provisioning a správu Azure zdrojov pomocou Azure Developer CLI s jeho vstavanými poskytovateľmi Bicep a Terraform.

> Revidované podľa `azd 1.37.2` (november 2026). Pokiaľ nie je uvedené inak, príklady Bicep, Terraform a skriptov sú **ilustračné fragmenty**, nie kompletný šablónový súbor. Zlúčte ich do projektu, ktorý poskytuje referencované parametre, moduly, identity, sieťovanie a aplikačný kód. Provisionovanie Azure nebolo pri tejto revízii vykonané.

## Ciele učenia

Po dokončení tohto návodu budete:
- Ovládať princípy Infrastructure as Code a provisionovanie Azure zdrojov
- Rozumieť viacerým poskytovateľom IaC podporovaným Azure Developer CLI
- Navrhovať a implementovať Bicep šablóny pre bežné aplikačné architektúry
- Konfigurovať parametre zdrojov, premenné a nastavenia špecifické pre prostredie
- Implementovať pokročilé infraštruktúrne vzory vrátane sieťovania a bezpečnosti
- Spravovať životný cyklus zdrojov, aktualizácie a riešenie závislostí

## Výsledky učenia

Po dokončení budete schopní:
- Navrhovať a provisionovať Azure infraštruktúru pomocou Bicep a ARM šablón
- Konfigurovať komplexné multi-službové architektúry so správnymi závislosťami zdrojov
- Implementovať parameterizované šablóny pre viacero prostredí a konfigurácií
- Riešiť problémy s provisionovaním infraštruktúry a opravovať zlyhania nasadenia
- Použiť princípy Azure Well-Architected Framework pri návrhu infraštruktúry
- Spravovať aktualizácie infraštruktúry a implementovať stratégie verzovania infraštruktúry

## Prehľad provisioning infraštruktúry

Azure Developer CLI podporuje viacerých poskytovateľov Infrastructure as Code (IaC):
- **Bicep** (odporúčané) - doménový špecifický jazyk pre Azure
- **ARM šablóny** - Bicep sa kompiluje do ARM; čisté ARM JSON nie je samostatný vstavaný `infra.provider`
- **Terraform** - nástroj pre multi-cloud infraštruktúru
- **Rozšírené poskytovatele** - vyžadujú samostatne inštalované rozšírenie poskytovateľa a jeho dokumentovanú konfiguráciu; nepovažujte za predpoklad, že je podporovaný akýkoľvek reťazec poskytovateľa

## Pochopenie Azure zdrojov

### Hierarchia zdrojov
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Bežné Azure služby pre aplikácie
- **Výpočtové zdroje (Compute)**: App Service, Container Apps, Functions, Virtuálne stroje
- **Úložisko (Storage)**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Sieťovanie (Networking)**: Virtuálna sieť, Application Gateway, CDN
- **Bezpečnosť (Security)**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep šablóny infraštruktúry

### Základná štruktúra Bicep šablóny
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

Pre kompletný azd projekt zavolajte tento modul z abonentovo osobitného `infra/main.bicep`, ktorý vytvára označenú skupinu zdrojov a odovzdáva jej rozsah. Zodpovedá to `environmentName`/`location` v `main.parameters.json`. Značka `azd-service-name: web` spája zdroj s `services.web`; samostatné ľubovoľné mená výstupov nekonfigurujú službu vyhľadávania.

### Pokročilé Bicep vzory

#### Modulárna infraštruktúra
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

#### Podmienené vytváranie zdrojov
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

## 🌐 Použitie Terraform s azd

Bicep je predvolený pre azd, ale azd tiež podporuje **Terraform** — užitočné, ak váš tím už štandardizuje na ňom alebo riadite multi-cloud infraštruktúru. Azd workflow (`azd up`, `azd provision`, `azd down`) je identický; mení sa len jazyk infraštruktúry a rozloženie adresárov.

### Ako povedať azd, aby používal Terraform

Pridajte sekciu `infra` do `azure.yaml` ukazujúcu na poskytovateľa Terraform:

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

### Rozloženie priečinka Terraform

S Terraform poskytovateľom váš priečinok `infra/` používa súbory `.tf` namiesto Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Fragment `main.tf`

Toto iba vytvára skupinu zdrojov a plán, nie službu pripravenú na nasadenie. Musíte tiež deklarovať vstupné premenné, kompatibilného poskytovateľa `azurerm`, webovú aplikáciu a jej mapovanie značiek/služobných mien zdrojov.

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

### Ako azd nadväzuje na vaše Terraform výstupy

Azd číta Terraform **výstupy** do hodnôt prostredia. Tento fragment predpokladá, že ste definovali `azurerm_linux_web_app.web`; služobné vyhľadávanie stále vyžaduje zodpovedajúci názov zdroja alebo značku `azd-service-name`:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **Dôležité:** azd používa značku `azd-env-name` a výstupy `AZURE_*` na sledovanie zdrojov pre prostredie. Vždy označte skupinu zdrojov značkou `"azd-env-name" = var.environment_name`, aby ju `azd down` mohol nájsť a odstrániť všetko.

### Nasadenie s Terraform

Príkazy sú úplne rovnaké ako pri Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **Predpoklad:** Terraform musí byť nainštalovaný a dostupný vo vašom `PATH`. azd spravuje Terraform *workflow*, ale Terraform za vás neinštaluje. Pre stav azd štandardne používa lokálny stav; pre tímy nakonfigurujte vzdialený backend (napríklad Azure Storage backend) v `provider.tf`.

Pre kompletné, spustiteľné Terraform-based štartéry prehliadajte [Awesome AZD galériu](https://azure.github.io/awesome-azd/) a filtrovať podľa Terraform, alebo pozrite si oficiálnu [azd Terraform dokumentáciu](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Iné nástroje na infraštruktúru

Pulumi nie je zabudovaný poskytovateľ správy infraštruktúry v azd 1.37.2. Nastavenie `infra.provider: pulumi` samotného nezabezpečuje funkčnú integráciu a `azd env new` automaticky nevytvára ani nevyberá Pulumi stack. Ak používate iný nástroj IaC, riaďte sa dokumentáciou overeného provider rozšírenia alebo explicitne spravujte jeho životný cyklus vo vašom vlastnom workflow. Tento kurz neposkytuje ani neoveruje Pulumi providera.

## 🎯 Výber hostiteľa pre vašu službu

Pole `host` v `azure.yaml` rozhoduje, kde váš kód beží. azd podporuje niekoľko hostiteľov — výber správneho je dôležitejší než infraštruktúrny jazyk. Tu je priateľské porovnanie pre začiatočníkov:

| Hodnota `host` | Najlepšie pre | Prečo |
|--------------|----------|-----|
| `appservice` | Tradičné webové aplikácie a API | Najjednoduchší PaaS; nepotrebuje kontajnery |
| `staticwebapp` | Front-end SPAs (React, Vue, Angular) | Globálne CDN + bezplatné SSL, vstavaná podpora API |
| `function` | Event-driven a serverless záťaže | Scale-to-zero, platba za vykonanie |
| `containerapp` | Kontajnerizované mikroservisy | Serverless kontajnery, scale-to-zero, vstavaný ingress |
| `aks` | Zložité orchestrácie | Plná kontrola Kubernetes, keď ju naozaj potrebujete |
| `springapp` | Existujúce nasadenia Azure Spring Apps | Legacy cieľ; služba končí 31. marca 2028 a je uzavretá pre nových zákazníkov |

### Kedy použiť AKS

**Azure Kubernetes Service (`host: aks`)** vám dáva plnú silu Kubernetes — vlastné controllery, service meshe, zložité sieťovanie a detailné plánovanie. Táto sila prichádza so správcovskou záťažou: vy spravujete node pools, upgrady a klastrové sieťovanie.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Začnite jednoducho, ak môžete.** Pre väčšinu mikroservisov vám **Container Apps** poskytujú kontajnery, automatické škálovanie a scale-to-zero bez potreby správy klastra. AKS vyberajte iba keď potrebujete špecifické Kubernetes funkcie.

### Kedy použiť Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** je spravovaná runtime špeciálne navrhnutá pre Spring Boot. Zaobchádza so service discovery, config serverom a blue-green deploymentom, takže Java tímy nemusia prevádzkovať vlastnú infraštruktúru.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Nevyberajte Azure Spring Apps pre nový projekt pre začiatočníkov: je uzavretý pre nových zákazníkov a [končí 31. marca 2028](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). Uprednostnite podporované alternatívy ako Container Apps a plánujte migráciu pre existujúce nasadenia.

## 🗃️ Provisioning databáz

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
**Podmienky fragmentu:** deklarujte `@secure() param databasePassword string` a používajte silnú dodanú hodnotu. Vyberte verejný prístup **alebo** integrujte delegovanú podsieť/súkromný DNS nižšie; tieto dva útržky sa automaticky nespoja.

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

Pravidlo `0.0.0.0` povoľuje pripojenia z Azure služieb mimo vášho predplatného. Nie je to súkromná sieť; uprednostnite obmedzený sieťový dizajn pre reálne záťaže.

## 🔒 Bezpečnosť a správa tajomstiev

### Integrácia Key Vault
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

### Konfigurácia spravovanej identity
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

Pre systémom priradenú identitu nenastavujte `AZURE_CLIENT_ID` na jej principal ID. Používateľská identita používa svoj **client ID**, nie object/principal ID. Odkaz na Key Vault tiež potrebuje priradenie role app identity vo vault a sieťový prístup.

## 🌍 Sieťovanie a konektivita

### Konfigurácia virtuálnej siete
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

### Application Gateway so SSL
**Neúplný architektonický fragment, nie je to nasaditeľná brána:** pridajte samostatný `gateway-subnet` do VNet vrátane backend poolov, HTTP nastavení, listenerov, pravidiel smerovania s prioritami a TLS certifikátu (alebo autorizovaného odkazu na Key Vault). Otvorenie portu 443 samo o sebe neinicializuje HTTPS.

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

## 📊 Monitorovanie a observabilita

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

### Vlastné metriky a upozornenia
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

## 🔧 Konfigurácie špecifické pre prostredie

### Parameter súbory pre rôzne prostredia
Nižšie sú **alternatívne príklady parameter-súborov**. azd automaticky nevyberá `main.parameters.dev.json` alebo `main.parameters.prod.json` podľa mena prostredia. Používajte skutočné `main.parameters.json` s náhradou prostredia (napr. `${APP_SERVICE_SKU=B1}`) a deklarujte/konzumujte každý parameter v Bicep.

Príklad obsahu pre `infra/main.parameters.dev.json`:

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

Príklad obsahu pre `infra/main.parameters.prod.json`:

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

### Podmienené poskytovanie zdrojov
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

## 🚀 Pokročilé vzory poskytovania

### Nasadenie do viacerých regiónov
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

### Testovanie infraštruktúry
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

Poskytovanie infraštruktúry nespravuje váš aplikačný kód. Aplikačné kontroly spúšťajte až po `azd deploy`/`azd up` a používajte `/health` iba ak to vaša aplikácia implementuje. ARM deployment skripty vytvárajú Azure zdroje a vyžadujú ďalšiu identitu, podporované runtime verzie a povolenia; nie sú to lokálne unit testy.

## 🧪 Náhľad a validácia infraštruktúry (NOVINKA)

### Prezrite si infraštruktúrne zmeny pred nasadením

Funkcia `azd provision --preview` vám umožňuje **simulovať poskytovanie infraštruktúry** pred skutočným nasadením zdrojov. Je podobná funkciám `terraform plan` alebo `bicep what-if` a poskytuje vám **náhľad suchého behu** zmien, ktoré by sa urobili vo vašom Azure prostredí.

#### 🛠️ Čo to robí
- **Analyzuje vaše IaC šablóny** (Bicep alebo Terraform)
- **Zobrazuje náhľad zmien zdrojov**: pridania, odstránenia, aktualizácie
- **Neaplikuje navrhované infraštruktúrne zmeny poskytovateľa** — najprv skontrolujte projektové hooky; skripty môžu mať vedľajšie účinky a náhľad stále vyžaduje Azure povolenia

#### Použitie
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

Tento príkaz vám pomáha:
- **Validovať infraštruktúrne zmeny** pred záväzným nasadením zdrojov
- **Včas zachytiť nesprávne konfigurácie** počas vývoja
- **Bezpečne spolupracovať** v tímových prostrediach
- **Zabezpečiť deployments podľa princípu najmenších právomocí** bez prekvapení

Jeho použitie je obzvlášť vhodné, keď:
- Pracujete so zložitými multi-službovými prostrediami
- Meníte produkčnú infraštruktúru
- Validujete zmeny šablón pred schválením PR
- Školíte nových členov tímu na infraštruktúrne vzory

### Príklad výstupu náhľadu
Presný výstup sa líši podľa poskytovateľa a štruktúry projektu, ale výsledok by mal jasne identifikovať navrhované zmeny pred ich aplikáciou.

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

## 🔄 Aktualizácie a migrácie zdrojov

### Bezpečné aktualizácie zdrojov
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

### Migračné databázy
**Neúplný vzor nasadenia skriptu:** vyžaduje nakonfigurovanú používateľskú identitu tam, kde treba, podporovaný Azure CLI runtime, dostupné migračné nástroje, dodaný adresár/migračnú konfiguráciu a databázovú konektivitu. Nie je spustiteľný len vložením tohto zdroja do šablóny.

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

## 🎯 Najlepšie postupy

### 1. Konvencie pomenovania zdrojov
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. Stratégia tagovania
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

### 3. Validácia parametrov
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

### 4. Organizácia výstupov
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

## Ďalšie kroky

- [Plánovanie pred nasadením](../chapter-06-pre-deployment/capacity-planning.md) - Overenie dostupnosti zdrojov
- [Bežné problémy](../chapter-07-troubleshooting/common-issues.md) - Riešenie problémov s infraštruktúrou
- [Sprievodca ladením](../chapter-07-troubleshooting/debugging.md) - Riešenie problémov s provisionovaním
- [Výber SKU](../chapter-06-pre-deployment/sku-selection.md) - Výber vhodných úrovní služieb

## Ďalšie zdroje

- [Dokumentácia Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Šablóny Azure Resource Manager](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Centrum architektúry Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Rámec Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigácia**
- **Predchádzajúca lekcia**: [Sprievodca nasadením](deployment-guide.md)
- **Ďalšia lekcia**: [Plánovanie kapacity](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->