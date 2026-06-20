# Provisionering af Azure-ressourcer med AZD

**Kapitelnavigation:**
- **📚 Kursushjem**: [AZD For Beginners](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 4 - Infrastruktur som kode & udrulning
- **⬅️ Forrige**: [Deployment Guide](deployment-guide.md)
- **➡️ Næste kapitel**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)
- **🔧 Relateret**: [Chapter 6: Pre-Deployment Validation](../chapter-06-pre-deployment/capacity-planning.md)

## Introduktion

Denne omfattende guide dækker alt, du skal vide om at provisionere og administrere Azure-ressourcer ved hjælp af Azure Developer CLI. Lær at implementere Infrastructure as Code (IaC) mønstre fra grundlæggende ressourceoprettelse til avancerede enterprise-infrastrukturer ved hjælp af Bicep, ARM-skabeloner, Terraform og Pulumi.

## Læringsmål

Ved at gennemføre denne guide vil du:
- Mestre principperne for Infrastructure as Code og provisioning af Azure-ressourcer
- Forstå de flere IaC-udbydere, som Azure Developer CLI understøtter
- Designe og implementere Bicep-skabeloner til almindelige applikationsarkitekturer
- Konfigurere ressourceparametre, variabler og miljøspecifikke indstillinger
- Implementere avancerede infrastrukturmønstre inklusive netværk og sikkerhed
- Administrere ressourcelivscyklus, opdateringer og afhængighedsopløsning

## Læringsudbytte

Efter gennemførelse vil du være i stand til at:
- Designe og provisionere Azure-infrastruktur ved hjælp af Bicep og ARM-skabeloner
- Konfigurere komplekse multi-service arkitekturer med korrekte ressourceafhængigheder
- Implementere parameteriserede skabeloner til flere miljøer og konfigurationer
- Fejlsøge problemer med infrastrukturprovisionering og løse udrulningsfejl
- Anvende Azure Well-Architected Framework-principper til infrastrukturdesign
- Administrere infrastrukturopdateringer og implementere strategier for versionsstyring af infrastruktur

## Oversigt over provisioning af infrastruktur

Azure Developer CLI understøtter flere Infrastructure as Code (IaC) udbydere:
- **Bicep** (anbefalet) - Azure's domænespecifikke sprog
- **ARM Templates** - JSON-baserede Azure Resource Manager-skabeloner
- **Terraform** - Multi-cloud infrastrukturværktøj
- **Pulumi** - Moderne infrastructure as code med programmeringssprog

## Forstå Azure-ressourcer

### Ressourcehierarki
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Almindelige Azure-tjenester for applikationer
- **Compute**: App Service, Container Apps, Functions, Virtual Machines
- **Storage**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Networking**: Virtual Network, Application Gateway, CDN
- **Security**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep-infrastrukturskabeloner

### Grundlæggende Bicep-skabelonstruktur
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

### Avancerede Bicep-mønstre

#### Modulær infrastruktur
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

#### Betinget ressourceoprettelse
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

## 🌐 Brug af Terraform med azd

Bicep er azd's standard, men azd understøtter også **Terraform**—nyttigt hvis dit team allerede standardiserer på det, eller hvis du håndterer multi-cloud infrastruktur. azd-workflowet (`azd up`, `azd provision`, `azd down`) er identisk; kun infrastrukturen sproget og mappestrukturen ændres.

### Fortæl azd at bruge Terraform

Tilføj en `infra` sektion til `azure.yaml` som peger på Terraform-provider:

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

### Terraform-mappelayout

Med Terraform-provideren bruger din `infra/`-mappe `.tf`-filer i stedet for Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### En minimal `main.tf`

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

### Hvordan azd forbinder til dine Terraform-outputs

azd læser Terraform **outputs** for at lære dine endpoints og for at koble miljøværdier tilbage ind i din app. Output-navnene betyder noget—azd leder efter bestemte navne:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **Vigtigt:** azd bruger `azd-env-name` tagget og `AZURE_*` outputs til at spore ressourcer pr. miljø. Tag altid din ressourcegruppe med "azd-env-name" = var.environment_name så `azd down` kan finde og fjerne alt.

### Udrul med Terraform

Kommandoerne er præcis de samme som for Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd kører 'terraform plan' bag kulisserne
azd up                    # provisionering + udrulning
azd down --force          # sletter de af Terraform administrerede ressourcer
```

> **Forudsætning:** Terraform skal være installeret og være på din `PATH`. azd håndterer Terraform *workflow'et*, men installerer ikke Terraform for dig. Til state bruger azd som standard lokal state; for teams skal du konfigurere en fjern-backend (fx en Azure Storage-backend) i `provider.tf`.

For komplette, kørende Terraform-baserede starters, gennemse [Awesome AZD gallery](https://azure.github.io/awesome-azd/) og filtrer efter Terraform, eller se den officielle [azd Terraform documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Brug af Pulumi med azd

Hvis dit team skriver infrastruktur i et generelt sprog (TypeScript, Python, Go eller C#) i stedet for et DSL, understøtter azd også **Pulumi**. Som med Terraform er `azd up` / `azd provision` / `azd down` workflowet uændret—kun infrastrukturværktøjerne og mappestrukturen er forskellige.

### Fortæl azd at bruge Pulumi

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

### Pulumi-mappelayout

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### En minimal `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// Mærk hver ressource, så azd kan spore dem og rydde dem op
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd læser disse uddata tilbage ind i dit miljø
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### Stacks svarer til azd-miljøer

Pulumi organiserer udrulninger i **stacks**, og azd mapper hvert azd-miljø til en Pulumi-stack med samme navn. Når du kører `azd env new staging`, vælger azd (eller opretter) Pulumi-stacket `staging`. De samme `azd-env-name` tagging- og `AZURE_*` output-regler gælder, så `azd down` kan finde og fjerne alt.

### Udrul med Pulumi

```bash
azd auth login
azd env new dev
azd provision --preview   # azd kører 'pulumi preview' bag kulisserne
azd up                    # provisionering + udrulning
azd down --force          # kører 'pulumi destroy'
```

> **Forudsætning:** Pulumi skal være installeret og være på din `PATH`, og du får brug for en state-backend (Pulumi Cloud eller en selvstyret backend såsom Azure Blob Storage). azd håndterer Pulumi *workflow'et*, ikke installationen. Se den officielle [azd Pulumi documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd).

## 🎯 Valg af vært til din tjeneste

Feltet `host` i `azure.yaml` afgør, hvor din kode kører. azd understøtter flere værter—at vælge den rigtige er vigtigere end infrastruktur-sproget. Her er en begynder-venlig sammenligning:

| `host` value | Bedst til | Hvorfor |
|--------------|----------|-----|
| `appservice` | Traditionelle webapps og API'er | Simpleste PaaS; ingen containere kræves |
| `staticwebapp` | Front-end SPA'er (React, Vue, Angular) | Global CDN + gratis SSL, indbygget API-understøttelse |
| `function` | Event-drevne og serverløse workloads | Scale-to-zero, betaling pr. eksekvering |
| `containerapp` | Containeriserede mikrotjenester | Serverløse containere, scale-to-zero, indbygget ingress |
| `aks` | Kompleks orkestrering | Fuld Kubernetes-kontrol når du virkelig har brug for det |
| `springapp` | Java Spring Boot apps | Managed Azure Spring Apps runtime optimeret til Spring |

### Hvornår man skal vælge AKS

**Azure Kubernetes Service (`host: aks`)** giver dig fuld kraft fra Kubernetes—custom controllere, service meshes, kompleks netværk og finmasket scheduling. Den kraft kommer med operationelt overhead: du administrerer node pools, opgraderinger og cluster-netværk.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Start enklere hvis du kan.** For de fleste mikrotjenester giver **Container Apps** dig containere, autoscaling og scale-to-zero uden at skulle administrere et cluster. Vælg AKS kun når du har brug for Kubernetes-specifikke funktioner.

### Hvornår man skal bruge Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** er en managed runtime bygget til Spring Boot. Den håndterer service discovery, config server og blue-green deployment, så Java-teams ikke skal køre deres egen infrastruktur.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Brug `springapp` når du har eksisterende Spring Boot-apps og ønsker en runtime optimeret til dem. For nye containeriserede Java-apps uden Spring-specifikke behov er `containerapp` ofte det enklere valg.

## 🗃️ Database-provisionering

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

## 🔒 Sikkerhed og håndtering af hemmeligheder

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

### Konfiguration af Managed Identity
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

## 🌍 Netværk og forbindelighed

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

## 📊 Overvågning og observabilitet

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

### Brugerdefinerede metrics og alarmer
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

## 🔧 Miljøspecifikke konfigurationer

### Parameterfiler til forskellige miljøer
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

### Betinget ressourceprovisionering
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

## 🚀 Avancerede provisioningmønstre

### Multi-region udrulning
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

### Infrastrukturtest
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

## 🧪 Infrastrukturforhåndsvisning & validering (NY)

### Forhåndsvis infrastrukturændringer før udrulning

Funktionen `azd provision --preview` lader dig **simulere infrastrukturprovisionering** før du rent faktisk udruller ressourcer. Den svarer i ånden til `terraform plan` eller `bicep what-if`, og giver dig et **dry-run overblik** over hvilke ændringer der ville blive foretaget i dit Azure-miljø.

#### 🛠️ Hvad det gør
- **Analyserer dine IaC-skabeloner** (Bicep eller Terraform)
- **Viser en forhåndsvisning af ressourceskift**: tilføjelser, sletninger, opdateringer
- **Anvender ikke ændringer** — det er skrivebeskyttet og sikkert at køre

#### Brugstilfælde
```bash
# Forhåndsvis ændringer i infrastrukturen før udrulning
azd provision --preview

# Forhåndsvis for et specifikt miljø
azd provision --preview -e production
```

Denne kommando hjælper dig med at:
- **Validere infrastrukturændringer** før du committer ressourcer
- **Fange fejlkonstruktioner tidligt** i udviklingscyklussen
- **Samarbejde sikkert** i teammiljøer
- **Sikre least-privilege deployment** uden overraskelser

Den er især nyttig når du:
- Arbejder med komplekse multi-service miljøer
- Ændrer produktionsinfrastruktur
- Validerer skabelonændringer før PR-godkendelse
- Træner nye teammedlemmer i infrastrukturmønstre

### Eksempel på forhåndsvisningsoutput
Det præcise preview-output varierer efter udbyder og projektstruktur, men resultatet bør klart identificere foreslåede ændringer før noget bliver anvendt.

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

## �🔄 Ressourceopdateringer og migrationer

### Sikre opdateringer af ressourcer
```bash
# Forhåndsvis infrastrukturændringer først (ANBEFALET)
azd provision --preview

# Anvend ændringer efter bekræftelse af forhåndsvisningen
azd provision --confirm-with-no-prompt

# Ved rollback, brug Git til at rulle infrastrukturændringer tilbage:
git revert HEAD  # Fortryd sidste infrastrukturcommit
azd provision    # Anvend tidligere infrastrukturtilstand
```

### Database-migrationer
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

## 🎯 Bedste praksis

### 1. Navnekonventioner for ressourcer
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. Tagging-strategi
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

### 4. Organisering af outputs
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

## Næste skridt

- [Pre-deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - Valider resource-tilgængelighed
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - Fejlsøg infrastrukturproblemer
- [Debugging Guide](../chapter-07-troubleshooting/debugging.md) - Debug provisioning-problemer
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Vælg passende servicetiers

## Yderligere ressourcer

- [Azure Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigation**
- **Forrige lektion**: [Deployment Guide](deployment-guide.md)
- **Næste lektion**: [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->