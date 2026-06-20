# Zriaďovanie zdrojov Azure pomocou AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD pre začiatočníkov](../../README.md)
- **📖 Current Chapter**: Kapitola 4 - Infrastruktúra ako kód a nasadenie
- **⬅️ Previous**: [Sprievodca nasadením](deployment-guide.md)
- **➡️ Next Chapter**: [Kapitola 5: Riešenia AI s viacerými agentmi](../../examples/retail-scenario.md)
- **🔧 Related**: [Kapitola 6: Prednasadzovacia validácia](../chapter-06-pre-deployment/capacity-planning.md)

## Úvod

Tento komplexný sprievodca pokrýva všetko, čo potrebujete vedieť o zriaďovaní a správe zdrojov Azure pomocou Azure Developer CLI. Naučíte sa implementovať vzory Infrastruktúry ako kód (IaC) od základného vytvárania zdrojov až po pokročilé podnikové infraštruktúry pomocou Bicep, ARM šablón, Terraformu a Pulumi.

## Ciele učenia

Po dokončení tohto sprievodcu budete:
- Ovládať princípy Infrastruktúry ako kód a zriaďovanie zdrojov Azure
- Rozumieť viacerým poskytovateľom IaC podporovaným Azure Developer CLI
- Navrhovať a implementovať Bicep šablóny pre bežné architektúry aplikácií
- Konfigurovať parametre zdrojov, premenné a nastavenia špecifické pre prostredie
- Implementovať pokročilé infraštruktúrne vzory vrátane sieťovania a zabezpečenia
- Spravovať životný cyklus zdrojov, aktualizácie a riešenie závislostí

## Výsledky učenia

Po dokončení budete schopní:
- Navrhnúť a zriaďovať infraštruktúru Azure pomocou Bicep a ARM šablón
- Konfigurovať komplexné viacslužbové architektúry s vhodnými závislosťami zdrojov
- Implementovať parameterizované šablóny pre viaceré prostredia a konfigurácie
- Riešiť problémy so zriaďovaním infraštruktúry a odstraňovať zlyhania nasadenia
- Aplikovať princípy Azure Well-Architected Framework pri navrhovaní infraštruktúry
- Spravovať aktualizácie infraštruktúry a implementovať stratégie verzovania infraštruktúry

## Prehľad zriaďovania infraštruktúry

Azure Developer CLI podporuje viacerých poskytovateľov Infrastruktúry ako kód (IaC):
- **Bicep** (odporúčané) - doménovo špecifický jazyk Azure
- **ARM Templates** - šablóny Azure Resource Manager založené na JSON
- **Terraform** - nástroj pre infraštruktúru naprieč viacerými cloudmi
- **Pulumi** - moderná infraštruktúra ako kód s použitím programovacích jazykov

## Porozumenie zdrojom Azure

### Hierarchia zdrojov
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Bežné služby Azure pre aplikácie
- **Výpočtové**: App Service, Container Apps, Functions, Virtual Machines
- **Úložisko**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Sieťovanie**: Virtual Network, Application Gateway, CDN
- **Zabezpečenie**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep šablóny infraštruktúry

### Základná štruktúra Bicep šablóny
```bicep
// infra/main.bicep
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

// Resource Group (created automatically by azd)
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' existing = {
  name: '${applicationName}-${environmentName}-rg'
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
  tags: tags
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'NODE|18-lts'
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

### Pokročilé vzory Bicep

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
  properties: {
    serverFarmId: planId
    siteConfig: {
      appSettings: appSettings
      linuxFxVersion: 'NODE|18-lts'
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

## 🌐 Používanie Terraformu s azd

Bicep je predvolený pre azd, ale azd tiež podporuje **Terraform** — užitočné, ak váš tím už štandardizuje na ňom alebo ak spravujete infraštruktúru naprieč viacerými cloudmi. Azd workflow (`azd up`, `azd provision`, `azd down`) je identický; mení sa iba infraštruktúrny jazyk a usporiadanie priečinkov.

### Nastavte azd na používanie Terraformu

Pridajte sekciu `infra` do `azure.yaml`, ktorá odkazuje na poskytovateľa Terraform:

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

### Štruktúra priečinka Terraform

Pri poskytovateľovi Terraform používa váš priečinok `infra/` súbory `.tf` namiesto Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Minimálny `main.tf`

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

### Ako azd číta výstupy Terraformu

azd číta Terraform **outputs**, aby zistil vaše koncové body a prepojil hodnoty prostredia späť do vašej aplikácie. Názvy výstupov sú dôležité — azd hľadá konkrétne:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **Dôležité:** azd používa tag `azd-env-name` a výstupy `AZURE_*` na sledovanie zdrojov podľa prostredia. Vždy označte svoju resource group s `"azd-env-name" = var.environment_name`, aby `azd down` mohol nájsť a odstrániť všetko.

### Nasadenie s Terraformom

Príkazy sú presne rovnaké ako pri Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd spúšťa 'terraform plan' na pozadí
azd up                    # zabezpečenie zdrojov + nasadenie
azd down --force          # odstraňuje zdroje spravované Terraformom
```

> **Predpoklad:** Terraform musí byť nainštalovaný a dostupný vo vašom `PATH`. azd spravuje Terraform *workflow*, ale neinštaluje Terraform za vás. Pre stav azd predvolí lokálny stav; pre tímy nakonfigurujte vzdialený backend (napríklad Azure Storage backend) v `provider.tf`.

Pre kompletné, spustiteľné štartovacie projekty založené na Terreforme prezrite [Galériu Awesome AZD](https://azure.github.io/awesome-azd/) a filtrovať podľa Terraformu, alebo si prečítajte oficiálnu [dokumentáciu azd pre Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Používanie Pulumi s azd

Ak váš tím píše infraštruktúru v všeobecnom programovacom jazyku (TypeScript, Python, Go alebo C#) namiesto DSL, azd tiež podporuje **Pulumi**. Rovnako ako pri Terraforme zostáva workflow `azd up` / `azd provision` / `azd down` nezmenený — mení sa len infraštruktúrne tooling a štruktúra priečinkov.

### Nastavte azd na používanie Pulumi

```yaml
# azure.yaml
name: my-pulumi-app
infra:
  provider: pulumi      # default is "bicep"
  path: infra           # folder containing your Pulumi program
services:
  web:
    project: ./src
    language: js
    host: containerapp
```

### Štruktúra priečinka Pulumi

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### Minimálny `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// Označte všetky prostriedky, aby ich azd mohol sledovať a odstrániť
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd načíta tieto výstupy späť do vášho prostredia
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### Stacks zodpovedajú prostrediam azd

Pulumi organizuje nasadenia do **stacks**, a azd mapuje každé azd prostredie na Pulumi stack s rovnakým názvom. Keď spustíte `azd env new staging`, azd vyberie (alebo vytvorí) Pulumi stack `staging`. Platí rovnaké tagovanie `azd-env-name` a pravidlá výstupov `AZURE_*`, aby `azd down` mohol nájsť a odstrániť všetko.

### Nasadenie s Pulumi

```bash
azd auth login
azd env new dev
azd provision --preview   # azd spúšťa 'pulumi preview' na pozadí
azd up                    # zabezpečenie + nasadenie
azd down --force          # spúšťa 'pulumi destroy'
```

> **Predpoklad:** Pulumi musí byť nainštalované a dostupné vo vašom `PATH`, a budete potrebovať backend pre stav (Pulumi Cloud alebo vlastný backend, napríklad Azure Blob Storage). azd spravuje Pulumi *workflow*, nie inštaláciu. Pozrite si oficiálnu [dokumentáciu azd pre Pulumi](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd).

## 🎯 Výber hostiteľa pre vašu službu

Pole `host` v `azure.yaml` rozhoduje, kde váš kód beží. azd podporuje niekoľko hostiteľov — výber správneho je dôležitejší než infraštruktúrny jazyk. Tu je priateľské porovnanie pre začiatočníkov:

| `host` value | Najlepšie pre | Prečo |
|--------------|---------------|-------|
| `appservice` | Tradičné webové aplikácie a API | Najjednoduchšie PaaS; nie sú potrebné kontajnery |
| `staticwebapp` | Front-end SPA (React, Vue, Angular) | Globálne CDN + bezplatný SSL, vstavaná podpora API |
| `function` | Udalostne riadené a bezserverové zaťaženia | Škálovanie na nulu, platba za vykonanie |
| `containerapp` | Kontajnerizované mikroservisy | Serverless kontajnery, škálovanie na nulu, vstavaný ingress |
| `aks` | Potreba komplexnej orchestrácie | Plná kontrola nad Kubernetes, keď ju skutočne potrebujete |
| `springapp` | Java Spring Boot aplikácie | Spravované runtime Azure Spring Apps optimalizované pre Spring |

### Kedy siahnuť po AKS

**Azure Kubernetes Service (`host: aks`)** vám dáva plnú silu Kubernetes — vlastné controllery, service meshe, komplexné sieťovanie a jemnozrnné plánovanie. Táto sila prináša prevádzkové nároky: spravujete node pooly, upgrady a sieťovanie klastrov.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Začnite jednoduchšie, ak môžete.** Pre väčšinu mikroservisov poskytujú **Container Apps** kontajnery, automatické škálovanie a škálovanie na nulu bez správy klastra. Vyberte AKS iba keď potrebujete funkcie špecifické pre Kubernetes.

### Kedy používať Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** je spravované runtime špeciálne pre Spring Boot. Rieši service discovery, config server a blue-green nasadenie, takže Java tímy nemusia prevádzkovať vlastnú infraštruktúru.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Použite `springapp`, ak máte existujúce Spring Boot aplikácie a chcete runtime optimalizovaný pre ne. Pre nové kontajnerizované Java aplikácie bez Spring-špecifických požiadaviek je často jednoduchšou voľbou `containerapp`.

## 🗃️ Zriaďovanie databáz

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

## 🔒 Zabezpečenie a správa tajomstiev

### Integrácia s Key Vault
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
          name: 'AZURE_CLIENT_ID'
          value: webApp.identity.principalId
        }
      ]
    }
  }
}
```

## 🌍 Sieťovanie a konektivita

### Konfigurácia Virtual Network
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

## 📊 Monitorovanie a pozorovateľnosť

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
    scopes: [webApp.id]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    criteria: {
      'odata.type': 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
      allOf: [
        {
          name: 'CPU Usage'
          metricName: 'CpuPercentage'
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

### Súbory parametrov pre rôzne prostredia
```json
// infra/main.parameters.dev.json
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

```json
// infra/main.parameters.prod.json
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

### Podmienené zriaďovanie zdrojov
```bicep
@description('Environment type (dev, staging, prod)')
@allowed(['dev', 'staging', 'prod'])
param environmentType string = 'dev'

// Development resources
resource devStorage 'Microsoft.Storage/storageAccounts@2023-01-01' = if (environmentType == 'dev') {
  name: '${applicationName}devstorage${resourceToken}'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

// Production resources with geo-redundancy
resource prodStorage 'Microsoft.Storage/storageAccounts@2023-01-01' = if (environmentType == 'prod') {
  name: '${applicationName}prodstorage${resourceToken}'
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

## 🚀 Pokročilé vzory zriaďovania

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
```bicep
// infra/test/main.test.bicep
param location string = resourceGroup().location

module mainTemplate '../main.bicep' = {
  name: 'main-template-test'
  params: {
    environmentName: 'test'
    location: location
    applicationName: 'testapp'
  }
}

// Test assertions
resource testScript 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
  name: 'test-deployment'
  location: location
  kind: 'AzurePowerShell'
  properties: {
    azPowerShellVersion: '8.0'
    scriptContent: '''
      $webAppName = "${mainTemplate.outputs.WEB_NAME}"
      $response = Invoke-WebRequest -Uri "https://${mainTemplate.outputs.WEB_URL}/health" -UseBasicParsing
      if ($response.StatusCode -ne 200) {
        throw "Health check failed"
      }
      Write-Output "All tests passed!"
    '''
    timeout: 'PT10M'
    cleanupPreference: 'OnSuccess'
    retentionInterval: 'P1D'
  }
}
```

## 🧪 Náhľad a validácia infraštruktúry (NOVÉ)

### Náhľad zmien infraštruktúry pred nasadením

Funkcia `azd provision --preview` vám umožňuje **simulovať zriaďovanie infraštruktúry** pred skutočným nasadením zdrojov. Je podobná `terraform plan` alebo `bicep what-if` a poskytuje vám **suchý beh (dry-run)**, ktorý ukazuje, aké zmeny by boli vykonané vo vašom prostredí Azure.

#### 🛠️ Čo to robí
- **Analyzuje vaše IaC šablóny** (Bicep alebo Terraform)
- **Zobrazuje náhľad zmien zdrojov**: pridania, odstránenia, aktualizácie
- **Neaplikuje žiadne zmeny** — je to len na čítanie a bezpečné spustenie

#### Prípady použitia
```bash
# Náhľad zmien infraštruktúry pred nasadením
azd provision --preview

# Náhľad pre konkrétne prostredie
azd provision --preview -e production
```

Tento príkaz vám pomôže:
- **Overiť zmeny infraštruktúry** pred nasadením zdrojov
- **Zachytiť nesprávne konfigurácie včas** v rámci vývojového cyklu
- **Spolupracovať bezpečne** v tímovom prostredí
- **Zabezpečiť nasadenia s najmenšími oprávneniami** bez prekvapení

Je to obzvlášť užitočné, keď:
- Pracujete s komplexnými viacslužbovými prostrediami
- Vykonávate zmeny v produkčnej infraštruktúre
- Overujete zmeny šablón pred schválením PR
- Školíte nových členov tímu na infraštruktúrnych vzoroch

### Príklad výstupu náhľadu
Presný výstup náhľadu sa líši podľa poskytovateľa a štruktúry projektu, ale výsledok by mal jasne identifikovať navrhované zmeny predtým, než sa čokoľvek aplikuje.

```bash
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

## �🔄 Aktualizácie a migrácie zdrojov

### Bezpečné aktualizácie zdrojov
```bash
# Najskôr si prezrite zmeny infraštruktúry (ODPORÚČANÉ)
azd provision --preview

# Aplikujte zmeny po potvrdení náhľadu
azd provision --confirm-with-no-prompt

# Pre rollback použite Git na vrátenie zmien infraštruktúry:
git revert HEAD  # Vráťte posledný commit infraštruktúry
azd provision    # Aplikujte predchádzajúci stav infraštruktúry
```

### Migrácie databáz
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
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. Stratégia označovania
```bicep
var commonTags = {
  'azd-env-name': environmentName
  'azd-app': applicationName
  'environment': environmentName
  'cost-center': 'engineering'
  'owner': 'platform-team'
  'project': applicationName
  'created-date': utcNow('yyyy-MM-dd')
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

- [Plánovanie pred nasadením](../chapter-06-pre-deployment/capacity-planning.md) - Overte dostupnosť zdrojov
- [Bežné problémy](../chapter-07-troubleshooting/common-issues.md) - Riešte problémy s infraštruktúrou
- [Sprievodca ladením](../chapter-07-troubleshooting/debugging.md) - Ladenie problémov so zriaďovaním
- [Výber SKU](../chapter-06-pre-deployment/sku-selection.md) - Vyberte vhodné úrovne služieb

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