# Zřizování zdrojů Azure pomocí AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD pro začátečníky](../../README.md)
- **📖 Current Chapter**: Kapitola 4 - Infrastruktura jako kód & Nasazení
- **⬅️ Previous**: [Průvodce nasazením](deployment-guide.md)
- **➡️ Next Chapter**: [Kapitola 5: Víceagentní AI řešení](../../examples/retail-scenario.md)
- **🔧 Related**: [Kapitola 6: Validace před nasazením](../chapter-06-pre-deployment/capacity-planning.md)

## Úvod

Tento komplexní průvodce pokrývá vše, co potřebujete vědět o zřizování a správě zdrojů Azure pomocí Azure Developer CLI. Naučíte se implementovat vzory Infrastructure as Code (IaC) od základního vytváření zdrojů po pokročilé podnikové architektury infrastruktury pomocí Bicep, ARM šablon, Terraformu a Pulumi.

## Cíle učení

Po dokončení tohoto průvodce budete:
- Ovládat principy Infrastructure as Code a zřizování zdrojů Azure
- Rozumět různým poskytovatelům IaC podporovaným Azure Developer CLI
- Navrhovat a implementovat Bicep šablony pro běžné architektury aplikací
- Konfigurovat parametry zdrojů, proměnné a nastavení specifická pro prostředí
- Implementovat pokročilé vzory infrastruktury včetně sítí a zabezpečení
- Spravovat životní cyklus zdrojů, aktualizace a řešení závislostí

## Výsledky učení

Po dokončení budete schopni:
- Navrhovat a zřizovat infrastrukturu Azure pomocí Bicep a ARM šablon
- Konfigurovat složité více-službové architektury se správnými závislostmi zdrojů
- Implementovat parametrizované šablony pro více prostředí a konfigurací
- Řešit problémy se zřizováním infrastruktury a opravovat chyby nasazení
- Aplikovat principy Azure Well-Architected Framework při návrhu infrastruktury
- Spravovat aktualizace infrastruktury a zavést strategie verzování infrastruktury

## Přehled zřizování infrastruktury

Azure Developer CLI podporuje více poskytovatelů Infrastructure as Code (IaC):
- **Bicep** (doporučeno) - Azure doménově specifický jazyk
- **ARM Templates** - JSON založené šablony Azure Resource Manager
- **Terraform** - Nástroj pro infrastrukturu napříč cloudy
- **Pulumi** - Moderní infrastruktura jako kód v obyčejných programovacích jazycích

## Porozumění zdrojům Azure

### Hierarchie zdrojů
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Běžné služby Azure pro aplikace
- **Výpočet**: App Service, Container Apps, Functions, Virtual Machines
- **Úložiště**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Síť**: Virtual Network, Application Gateway, CDN
- **Zabezpečení**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep šablony infrastruktury

### Základní struktura šablony Bicep
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

## 🌐 Použití Terraformu s azd

Bicep je výchozí volba azd, ale azd také podporuje **Terraform** — užitečné, pokud váš tým již standardizuje na Terraformu nebo spravujete infrastrukturu napříč cloudy. Pracovní postup azd (`azd up`, `azd provision`, `azd down`) je identický; mění se pouze jazyk infrastruktury a rozložení složek.

### Řekněte azd, aby používal Terraform

Přidejte sekci `infra` do `azure.yaml`, která ukazuje na poskytovatele Terraform:

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

### Struktura složky Terraform

S poskytovatelem Terraform váš adresář `infra/` používá soubory `.tf` místo Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Minimální `main.tf`

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

### Jak se azd připojuje k vašim Terraform výstupům

azd čte Terraform **outputs**, aby zjistil vaše koncové body a zapojil hodnoty prostředí zpět do vaší aplikace. Jména výstupů jsou důležitá — azd hledá konkrétní:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **Important:** azd uses the `azd-env-name` tag and `AZURE_*` outputs to track resources per environment. Always tag your resource group with `"azd-env-name" = var.environment_name` so `azd down` can find and remove everything.

### Nasazení s Terraformem

Příkazy jsou přesně stejné jako pro Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd pod kapotou spouští 'terraform plan'
azd up                    # zřizování + nasazení
azd down --force          # zničí zdroje spravované Terraformem
```

> **Prerequisite:** Terraform must be installed and on your `PATH`. azd manages the Terraform *workflow* but does not install Terraform for you. For state, azd defaults to local state; for teams, configure a remote backend (for example, an Azure Storage backend) in `provider.tf`.

Pro kompletní spustitelné startovací projekty založené na Terraformu prozkoumejte [Awesome AZD gallery](https://azure.github.io/awesome-azd/) a filtrovat podle Terraform, nebo si přečtěte oficiální [azd Terraform documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Použití Pulumi s azd

Pokud váš tým píše infrastrukturu v obecném jazyce (TypeScript, Python, Go nebo C#) místo DSL, azd také podporuje **Pulumi**. Stejně jako u Terraformu zůstává pracovní postup `azd up` / `azd provision` / `azd down` nezměněn — liší se pouze nástroje pro infrastrukturu a struktura složek.

### Řekněte azd, aby používal Pulumi

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

### Struktura složky Pulumi

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### Minimální `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// Označte všechny zdroje, aby azd mohl sledovat jejich stav a odstranit je
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd načítá tyto výstupy zpět do vašeho prostředí
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### Stacks odpovídají prostředím azd

Pulumi organizuje nasazení do zásobníků (stacks) a azd mapuje každé azd prostředí na Pulumi stack se stejným názvem. Když spustíte `azd env new staging`, azd vybere (nebo vytvoří) Pulumi stack `staging`. Platí stejná pravidla pro tagování `azd-env-name` a výstupy `AZURE_*`, takže `azd down` může najít a odstranit vše.

### Nasazení s Pulumi

```bash
azd auth login
azd env new dev
azd provision --preview   # azd spouští 'pulumi preview' pod kapotou
azd up                    # provisionování + nasazení
azd down --force          # spouští 'pulumi destroy'
```

> **Prerequisite:** Pulumi must be installed and on your `PATH`, and you'll need a state backend (Pulumi Cloud or a self-managed backend such as Azure Blob Storage). azd manages the Pulumi *workflow*, not the install. See the official [azd Pulumi documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd).

## 🎯 Výběr hostitele pro vaši službu

Pole `host` v `azure.yaml` rozhoduje, kde váš kód poběží. azd podporuje několik hostitelů — výběr správného má větší význam než volba jazyka infrastruktury. Zde je přehled vhodný pro začátečníky:

| `host` value | Nejlepší pro | Proč |
|--------------|--------------|------|
| `appservice` | Tradiční webové aplikace a API | Nejjednodušší PaaS; kontejnery nejsou nutné |
| `staticwebapp` | Front-end SPA (React, Vue, Angular) | Globální CDN + bezplatné SSL, vestavěná podpora API |
| `function` | Událostmi řízené a serverless pracovní zátěže | Škálování na nulu, platba za vykonání |
| `containerapp` | Kontajnerizované mikroslužby | Serverless kontejnery, škálování na nulu, vestavěný ingress |
| `aks` | Potřeby složité orchestrace | Plná kontrola nad Kubernetes, když ji opravdu potřebujete |
| `springapp` | Aplikace Java Spring Boot | Spravované prostředí Azure Spring Apps optimalizované pro Spring |

### Kdy zvolit AKS

**Azure Kubernetes Service (`host: aks`)** vám dává plnou sílu Kubernetes — vlastní controllery, service meshe, složité sítě a jemné plánování. Tato síla s sebou nese provozní režii: spravujete node pooly, upgrady a síťování clusteru.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Start simpler if you can.** For most microservices, **Container Apps** gives you containers, autoscaling, and scale-to-zero without managing a cluster. Choose AKS only when you need Kubernetes-specific features.

### Kdy použít Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** je spravované runtime prostředí vytvořené pro Spring Boot. Zajišťuje service discovery, config server a blue-green nasazení, takže týmy pracující se Springem nemusí provozovat vlastní infrastrukturu.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Use `springapp` when you have existing Spring Boot apps and want a runtime tuned for them. For new containerized Java apps without Spring-specific needs, `containerapp` is often the simpler choice.

## 🗃️ Provisioning databází

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
          name: 'AZURE_CLIENT_ID'
          value: webApp.identity.principalId
        }
      ]
    }
  }
}
```

## 🌍 Síťování a konektivita

### Konfigurace Virtual Network
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

## 🔧 Konfigurace specifické pro prostředí

### Soubory parametrů pro různá prostředí
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

### Podmíněné zřizování zdrojů
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

## 🚀 Pokročilé vzory zřizování

### Nasazení do více regionů
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

## 🧪 Náhled a validace infrastruktury (NOVÉ)

### Náhled změn infrastruktury před nasazením

Funkce `azd provision --preview` vám umožní **simulovat zřizování infrastruktury** před skutečným nasazením zdrojů. Je to podobné duchu příkazům terraform plan nebo bicep what-if — poskytuje vám **suchý běh** toho, jaké změny by byly provedeny ve vašem Azure prostředí.

#### 🛠️ Co dělá
- **Analyzuje vaše IaC šablony** (Bicep nebo Terraform)
- **Ukazuje náhled změn zdrojů**: přidání, odstranění, aktualizace
- **Neaplikuje změny** — je pouze pro čtení a bezpečné spuštění

#### Použití
```bash
# Náhled změn infrastruktury před nasazením
azd provision --preview

# Náhled pro konkrétní prostředí
azd provision --preview -e production
```

Tento příkaz vám pomůže:
- **Ověřit změny infrastruktury** před tím, než nasadíte zdroje
- **Včas odhalit nesprávné konfigurace** v průběhu vývoje
- **Bezpečně spolupracovat** v týmových prostředích
- **Zajistit nasazení s nejmenšími právy** bez nepříjemných překvapení

Je zvláště užitečný když:
- Pracujete se složitými více-službovými prostředími
- Provádíte změny v produkční infrastruktuře
- Ověřujete úpravy šablon před schválením PR
- Školíte nové členy týmu v infrastrukturních vzorech

### Příklad výstupu náhledu
Přesný náhled se liší podle poskytovatele a struktury projektu, ale výsledek by měl jasně identifikovat navrhované změny dříve, než se cokoli aplikuje.

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

## �🔄 Aktualizace a migrace zdrojů

### Bezpečné aktualizace zdrojů
```bash
# Nejprve si prohlédněte změny infrastruktury (DOPORUČENO)
azd provision --preview

# Aplikujte změny po potvrzení náhledu
azd provision --confirm-with-no-prompt

# Pro obnovení stavu použijte Git k vrácení změn infrastruktury:
git revert HEAD  # Vrátit poslední commit infrastruktury
azd provision    # Aplikujte předchozí stav infrastruktury
```

### Migrace databází
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

## 🎯 Nejlepší postupy

### 1. Konvence pojmenování zdrojů
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. Strategie tagování
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

- [Plánování před nasazením](../chapter-06-pre-deployment/capacity-planning.md) - Ověřte dostupnost zdrojů
- [Běžné problémy](../chapter-07-troubleshooting/common-issues.md) - Řešení problémů s infrastrukturou
- [Průvodce laděním](../chapter-07-troubleshooting/debugging.md) - Ladění problémů se zřizováním
- [Výběr SKU](../chapter-06-pre-deployment/sku-selection.md) - Vyberte vhodné úrovně služeb

## Další zdroje

- [Dokumentace Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Šablony Azure Resource Manager](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Centrum architektury Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigation**
- **Previous Lesson**: [Průvodce nasazením](deployment-guide.md)
- **Next Lesson**: [Plánování před nasazením](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->