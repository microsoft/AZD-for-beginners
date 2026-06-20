# Provisionering av Azure-resurser med AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD för nybörjare](../../README.md)
- **📖 Aktuellt kapitel**: Kapitel 4 - Infrastruktur som kod & distribution
- **⬅️ Previous**: [Deployment Guide](deployment-guide.md)
- **➡️ Next Chapter**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)
- **🔧 Related**: [Chapter 6: Pre-Deployment Validation](../chapter-06-pre-deployment/capacity-planning.md)

## Introduktion

Denna omfattande guide täcker allt du behöver veta om att provisionera och hantera Azure-resurser med Azure Developer CLI. Lär dig att implementera mönster för Infrastruktur som Kod (IaC) från grundläggande resurskapande till avancerade infrastrukturlösningar i företagsklass med Bicep, ARM-mallar, Terraform och Pulumi.

## Lärandemål

Genom att slutföra denna guide kommer du att:
- Bemästra principerna för Infrastruktur som Kod och provisionering av Azure-resurser
- Förstå flera IaC-leverantörer som stöds av Azure Developer CLI
- Designa och implementera Bicep-mallar för vanliga applikationsarkitekturer
- Konfigurera resursparametrar, variabler och miljöspecifika inställningar
- Implementera avancerade infrastrukturmönster inklusive nätverk och säkerhet
- Hantera resurslivscykel, uppdateringar och beroendeupplösning

## Läranderesultat

Efter slutförandet kommer du att kunna:
- Designa och provisionera Azure-infrastruktur med Bicep och ARM-mallar
- Konfigurera komplexa multi-tjänstarkitekturer med korrekta resursberoenden
- Implementera parameteriserade mallar för flera miljöer och konfigurationer
- Felsöka problem med infrastrukturprovisionering och åtgärda fel i distributioner
- Tillämpa principer från Azure Well-Architected Framework i infrastrukturell design
- Hantera infrastrukturuppdateringar och implementera strategier för versionshantering av infrastruktur

## Översikt över infrastrukturprovisionering

Azure Developer CLI stöder flera Infrastructure as Code (IaC)-leverantörer:
- **Bicep** (rekommenderat) - Azures domänspecifika språk
- **ARM Templates** - JSON-baserade Azure Resource Manager-mallar
- **Terraform** - Verktyg för multi-cloud-infrastruktur
- **Pulumi** - Modern infrastruktur som kod med programmeringsspråk

## Förstå Azure-resurser

### Resurshierarki
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Vanliga Azure-tjänster för applikationer
- **Beräkning**: App Service, Container Apps, Functions, Virtual Machines
- **Lagring**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Nätverk**: Virtual Network, Application Gateway, CDN
- **Säkerhet**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep-infrastrukturmallar

### Grundläggande Bicep-mallstruktur
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

### Avancerade Bicep-mönster

#### Modulär infrastruktur
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

#### Villkorlig resurskapande
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

## 🌐 Använda Terraform med azd

Bicep är azd:s standard, men azd stöder också **Terraform**—användbart om ditt team redan standardiserar på det eller om du hanterar multi-cloud-infrastruktur. azd-arbetsflödet (`azd up`, `azd provision`, `azd down`) är identiskt; endast infrastrukturnspråket och mappstrukturen ändras.

### Säg åt azd att använda Terraform

Lägg till en `infra`-sektion i `azure.yaml` som pekar på Terraform-leverantören:

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

### Terraform-mappstruktur

Med Terraform-leverantören använder din `infra/`-mapp `.tf`-filer istället för Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Ett minimalt `main.tf`

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

### Hur azd kopplar till dina Terraform-utdata

azd läser Terraform **outputs** för att lära sig dina endpoints och för att lyfta miljövärden tillbaka in i din app. Utdata-namnen är viktiga—azd letar efter specifika sådana:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **Viktigt:** azd använder taggen `azd-env-name` och `AZURE_*`-utdata för att spåra resurser per miljö. Tagga alltid din resursgrupp med `"azd-env-name" = var.environment_name` så att `azd down` kan hitta och ta bort allt.

### Distribuera med Terraform

Kommandona är exakt desamma som för Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd kör 'terraform plan' under huven
azd up                    # provisionering + driftsättning
azd down --force          # tar bort de resurser som hanteras av Terraform
```

> **Förutsättning:** Terraform måste vara installerat och finnas i din `PATH`. azd hanterar Terraform-*arbetsflödet* men installerar inte Terraform åt dig. För state använder azd som standard lokalt state; för team, konfigurera en fjärr-backend (till exempel en Azure Storage-backend) i `provider.tf`.

För kompletta, körbara starter baserade på Terraform, bläddra i [Awesome AZD gallery](https://azure.github.io/awesome-azd/) och filtrera på Terraform, eller se den officiella [azd Terraform-dokumentationen](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Använda Pulumi med azd

Om ditt team skriver infrastruktur i ett allmänt programspråk (TypeScript, Python, Go eller C#) istället för ett DSL, stöder azd också **Pulumi**. Precis som med Terraform är `azd up` / `azd provision` / `azd down` arbetsflödet oförändrat—endast infrastrukturoch mappverktygen skiljer sig åt.

### Säg åt azd att använda Pulumi

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

### Pulumi-mappstruktur

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### Ett minimalt `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// Tagga varje resurs så att azd kan spåra och rensa upp dem
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd läser tillbaka dessa utdata in i din miljö
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### Stacks kartläggs till azd-miljöer

Pulumi organiserar distributioner i **stacks**, och azd mappar varje azd-miljö till en Pulumi-stack med samma namn. När du kör `azd env new staging`, väljer azd (eller skapar) Pulumi-stacken `staging`. Samma `azd-env-name`-taggning och `AZURE_*`-utdata-regler gäller, så att `azd down` kan hitta och ta bort allt.

### Distribuera med Pulumi

```bash
azd auth login
azd env new dev
azd provision --preview   # azd kör 'pulumi preview' i bakgrunden
azd up                    # provisionera + driftsätta
azd down --force          # kör 'pulumi destroy'
```

> **Förutsättning:** Pulumi måste vara installerat och finnas i din `PATH`, och du behöver en state-backend (Pulumi Cloud eller en självadministrerad backend som Azure Blob Storage). azd hanterar Pulumi-*arbetsflödet*, inte installationen. Se den officiella [azd Pulumi-dokumentationen](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd).

## 🎯 Välja en värd för din tjänst

Fältet `host` i `azure.yaml` bestämmer var din kod körs. azd stöder flera värdar—att välja rätt är viktigare än infrastrukturspråket. Här är en nybörjarvänlig jämförelse:

| `host` value | Bäst för | Varför |
|--------------|----------|-----|
| `appservice` | Traditionella webbappar och API:er | Enkelt PaaS; inga containrar krävs |
| `staticwebapp` | Front-end SPA:er (React, Vue, Angular) | Global CDN + gratis SSL, inbyggt API-stöd |
| `function` | Eventdrivna och serverlösa arbetsbelastningar | Skalar till noll, betala per körning |
| `containerapp` | Containeriserade mikrotjänster | Serverlösa containrar, skalar till noll, inbyggd ingress |
| `aks` | Komplexa orkestreringsbehov | Full kontroll över Kubernetes när du verkligen behöver det |
| `springapp` | Java Spring Boot-appar | Hanterad Azure Spring Apps-runtime optimerad för Spring |

### När du bör välja AKS

**Azure Kubernetes Service (`host: aks`)** ger dig full kraften i Kubernetes—egna controllers, service meshes, komplex nätverkshantering och finmaskig schemaläggning. Den kraften kommer med driftmässig overhead: du ansvarar för node pools, uppgraderingar och klusternätverk.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Börja enklare om du kan.** För de flesta mikrotjänster ger **Container Apps** containrar, autoskalning och skala-till-noll utan att du behöver hantera ett kluster. Välj AKS bara när du behöver Kubernetes-specifika funktioner.

### När du ska använda Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** är en hanterad runtime byggd för Spring Boot. Den hanterar service discovery, config server och blue-green-distribution så att Java-team inte behöver drifta egen infrastruktur.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Använd `springapp` när du har befintliga Spring Boot-appar och vill ha en runtime optimerad för dem. För nya containeriserade Java-appar utan Spring-specifika krav är `containerapp` ofta det enklare valet.

## 🗃️ Databasprovisionering

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

## 🔒 Säkerhet och hantering av hemligheter

### Key Vault-integration
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

### Konfiguration av hanterade identiteter
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

## 🌍 Nätverk och anslutning

### Virtual Network-konfiguration
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

### Application Gateway med SSL
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

## 📊 Övervakning och observerbarhet

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

### Egna mätvärden och aviseringar
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

## 🔧 Miljöspecifika konfigurationer

### Parameterfiler för olika miljöer
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

### Villkorlig resursprovisionering
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

## 🚀 Avancerade provisionsmönster

### Distribuering över flera regioner
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

### Infrastrukturtestning
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

## 🧪 Förhandsgranskning och validering av infrastruktur (NYTT)

### Förhandsgranska infrastruktursändringar innan distribution

Funktionen `azd provision --preview` låter dig **simulera infrastrukturprovisionering** innan du faktiskt distribuerar resurser. Det liknar i andemeningen `terraform plan` eller `bicep what-if` och ger dig en **dry-run-översikt** över vilka ändringar som skulle göras i din Azure-miljö.

#### 🛠️ Vad den gör
- **Analyserar dina IaC-mallar** (Bicep eller Terraform)
- **Visar en förhandsgranskning av resursändringar**: tillägg, borttagningar, uppdateringar
- **Utför inga ändringar** — det är skrivskyddat och säkert att köra

#### Användningsfall
```bash
# Förhandsgranska infrastruktursändringar innan distribution
azd provision --preview

# Förhandsgranskning för en specifik miljö
azd provision --preview -e production
```

Detta kommando hjälper dig att:
- **Validera infrastruktursändringar** innan du gör ändringar i resurser
- **Fånga felkonfigurationer tidigt** i utvecklingscykeln
- **Samarbeta säkert** i teammiljöer
- **Säkerställa minst privilegium vid distributioner** utan överraskningar

Det är särskilt användbart när:
- Du arbetar med komplexa multi-tjänstmiljöer
- Du gör förändringar i produktionsinfrastruktur
- Du validerar malländringar innan PR-godkännande
- Du utbildar nya teammedlemmar i infrastrukturmönster

### Exempel på förhandsgranskningsutdata
Exakt förhandsgranskningsutdata varierar beroende på leverantör och projektstruktur, men resultatet bör tydligt identifiera föreslagna ändringar innan något tillämpas.

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

## �🔄 Resursuppdateringar och migreringar

### Säkra resursuppdateringar
```bash
# Förhandsgranska infrastrukturändringar först (REKOMMENDERAS)
azd provision --preview

# Tillämpa ändringarna efter bekräftad förhandsgranskning
azd provision --confirm-with-no-prompt

# För återställning, använd Git för att återställa infrastrukturändringar:
git revert HEAD  # Ångra senaste commit för infrastrukturen
azd provision    # Tillämpa tidigare infrastrukturtillstånd
```

### Databasmigreringar
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

## 🎯 Bästa praxis

### 1. Namngivningskonventioner för resurser
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. Taggningsstrategi
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

### 3. Parametervalidering
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

### 4. Organisering av utdata
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

## Nästa steg

- [Pre-deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - Validera resurstillgänglighet
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - Felsök infrastrukturella problem
- [Debugging Guide](../chapter-07-troubleshooting/debugging.md) - Felsök provisioning-problem
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Välj lämpliga servicetier

## Ytterligare resurser

- [Azure Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigation**
- **Previous Lesson**: [Deployment Guide](deployment-guide.md)
- **Next Lesson**: [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->