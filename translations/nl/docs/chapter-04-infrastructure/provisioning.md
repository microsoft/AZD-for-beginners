# Provisioning Azure Resources with AZD

**Hoofdstuknavigatie:**
- **📚 Cursus Home**: [AZD For Beginners](../../README.md)
- **📖 Huidig hoofdstuk**: Hoofdstuk 4 - Infrastructuur als Code & Implementatie
- **⬅️ Vorige**: [Deployment Guide](deployment-guide.md)
- **➡️ Volgend hoofdstuk**: [Hoofdstuk 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)
- **🔧 Gerelateerd**: [Hoofdstuk 6: Pre-Deployment Validatie](../chapter-06-pre-deployment/capacity-planning.md)

## Introductie

Deze uitgebreide gids behandelt alles wat je moet weten over het provisionen en beheren van Azure-resources met de Azure Developer CLI. Leer hoe je Infrastructure as Code (IaC)-patronen implementeert, van basisresourcecreatie tot geavanceerde infrastructuurarchitecturen op ondernemingsniveau met Bicep, ARM-sjablonen, Terraform en Pulumi.

## Leerdoelen

Na het voltooien van deze gids zal je:
- De principes van Infrastructure as Code beheersen en Azure-resources kunnen provisionen
- Meer inzicht hebben in de verschillende IaC-providers die door Azure Developer CLI worden ondersteund
- Bicep-sjablonen ontwerpen en implementeren voor veelvoorkomende applicatiearchitecturen
- Resourceparameters, variabelen en omgevingsspecifieke instellingen configureren
- Geavanceerde infrastructuurpatronen implementeren, inclusief netwerken en beveiliging
- De levenscyclus van resources beheren, updates uitvoeren en afhankelijkheidsresolutie toepassen

## Leerresultaten

Na voltooiing zul je in staat zijn om:
- Azure-infrastructuur te ontwerpen en provisionen met Bicep en ARM-sjablonen
- Complexe multi-service architecturen te configureren met de juiste resource-afhankelijkheden
- Gepersonaliseerde sjablonen te implementeren voor meerdere omgevingen en configuraties
- Problemen met infrastructure provisioning op te lossen en implementatiefouten te verhelpen
- Azure Well-Architected Framework-principes toe te passen op infrastructuurontwerp
- Infrastructuurupdates te beheren en strategieën voor versiebeheer van infrastructuur te implementeren

## Overzicht van infrastructuurprovisioning

Azure Developer CLI ondersteunt meerdere Infrastructure as Code (IaC)-providers:
- **Bicep** (aanbevolen) - Azure's domeinspecifieke taal
- **ARM Templates** - JSON-gebaseerde Azure Resource Manager-sjablonen
- **Terraform** - Multi-cloud infrastructuurtool
- **Pulumi** - Moderne infrastructure as code met programmeertalen

## Azure-resources begrijpen

### Resource-hiërarchie
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Veelvoorkomende Azure-diensten voor applicaties
- **Compute**: App Service, Container Apps, Functions, Virtual Machines
- **Storage**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Networking**: Virtual Network, Application Gateway, CDN
- **Security**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep-infrastructuursjablonen

### Basisstructuur van een Bicep-sjabloon
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

### Geavanceerde Bicep-patronen

#### Modulaire infrastructuur
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

#### Voorwaardelijke resource-creatie
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

## 🌐 Terraform gebruiken met azd

Bicep is de standaard van azd, maar azd ondersteunt ook **Terraform**—handig als je team daar al op gestandaardiseerd is of als je multi-cloud infrastructuur beheert. De azd-workflow (`azd up`, `azd provision`, `azd down`) is identiek; alleen de infrastructuurtaal en mapindeling veranderen.

### Zeg tegen azd dat het Terraform moet gebruiken

Voeg een `infra`-sectie toe aan `azure.yaml` die naar de Terraform-provider wijst:

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

### Terraform-mapindeling

Met de Terraform-provider gebruikt je `infra/`-map `.tf`-bestanden in plaats van Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Een minimale `main.tf`

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

### Hoe azd verbinding maakt met je Terraform-outputs

azd leest Terraform **outputs** om je endpoints te kennen en om omgevingswaarden terug in je app te koppelen. De namen van outputs zijn belangrijk—azd zoekt naar specifieke namen:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **Belangrijk:** azd gebruikt de `azd-env-name` tag en `AZURE_*` outputs om resources per omgeving bij te houden. Tag altijd je resourcegroep met `"azd-env-name" = var.environment_name` zodat `azd down` alles kan vinden en verwijderen.

### Implementeren met Terraform

De opdrachten zijn exact hetzelfde als bij Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd voert 'terraform plan' onder de motorkap uit
azd up                    # inrichten + uitrollen
azd down --force          # verwijdert de door Terraform beheerde resources
```

> **Vereiste:** Terraform moet geïnstalleerd zijn en in je `PATH` staan. azd beheert de Terraform *workflow* maar installeert Terraform niet voor je. Voor state gebruikt azd standaard lokale state; voor teams configureer je een remote backend (bijvoorbeeld een Azure Storage backend) in `provider.tf`.

Voor volledige, uitvoerbare Terraform-starters, blader door de [Awesome AZD gallery](https://azure.github.io/awesome-azd/) en filter op Terraform, of zie de officiële [azd Terraform-documentatie](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Pulumi gebruiken met azd

Als je team infrastructuur schrijft in een algemene programmeertaal (TypeScript, Python, Go of C#) in plaats van een DSL, ondersteunt azd ook **Pulumi**. Net als bij Terraform blijft de `azd up` / `azd provision` / `azd down` workflow ongewijzigd—alleen de infrastructuurtooling en mapindeling verschillen.

### Zeg tegen azd dat het Pulumi moet gebruiken

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

### Pulumi-mapindeling

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### Een minimale `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// Tag elke resource zodat azd ze kan bijhouden en opruimen
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd leest deze uitvoer terug in je omgeving
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### Stacks corresponderen met azd-omgevingen

Pulumi organiseert implementaties in **stacks**, en azd mappt elke azd-omgeving naar een Pulumi-stack met dezelfde naam. Wanneer je `azd env new staging` uitvoert, selecteert (of maakt) azd de `staging` Pulumi-stack. Dezelfde `azd-env-name` tagging en `AZURE_*` outputregels gelden, zodat `azd down` alles kan vinden en verwijderen.

### Implementeren met Pulumi

```bash
azd auth login
azd env new dev
azd provision --preview   # azd voert 'pulumi preview' onder de motorkap uit
azd up                    # voorziening + uitrol
azd down --force          # voert 'pulumi destroy' uit
```

> **Vereiste:** Pulumi moet geïnstalleerd zijn en in je `PATH` staan, en je hebt een state-backend nodig (Pulumi Cloud of een zelfbeheerd backend zoals Azure Blob Storage). azd beheert de Pulumi *workflow*, niet de installatie. Zie de officiële [azd Pulumi-documentatie](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd).

## 🎯 Een host kiezen voor je service

Het `host`-veld in `azure.yaml` bepaalt waar je code wordt uitgevoerd. azd ondersteunt meerdere hosts—de juiste kiezen is vaak belangrijker dan de infrastructuurtaal. Hier is een voor beginners geschikte vergelijking:

| `host` value | Best for | Why |
|--------------|----------|-----|
| `appservice` | Traditionele web-apps en API's | Simpelste PaaS; geen containers nodig |
| `staticwebapp` | Front-end SPA's (React, Vue, Angular) | Wereldwijde CDN + gratis SSL, ingebouwde API-ondersteuning |
| `function` | Evenementgestuurde en serverloze workloads | Schaalt naar nul, betalen per uitvoering |
| `containerapp` | Gecontaineriseerde microservices | Serverless-containers, schaalt naar nul, ingebouwde ingress |
| `aks` | Complexe orkestratiebehoeften | Volledige Kubernetes-controle wanneer je het echt nodig hebt |
| `springapp` | Java Spring Boot-apps | Beheerde Azure Spring Apps-runtime afgestemd op Spring |

### Wanneer je voor AKS moet kiezen

**Azure Kubernetes Service (`host: aks`)** geeft je de volledige kracht van Kubernetes—aangepaste controllers, service meshes, complexe netwerken en fijnmazige scheduling. Die kracht brengt operationele overhead met zich mee: je beheert nodepools, upgrades en clusternetwerken.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Begin eenvoudiger als het kan.** Voor de meeste microservices biedt **Container Apps** containers, autoscaling en scale-to-zero zonder dat je een cluster hoeft te beheren. Kies AKS alleen wanneer je Kubernetes-specifieke functies echt nodig hebt.

### Wanneer je Azure Spring Apps moet gebruiken

**Azure Spring Apps (`host: springapp`)** is een beheerde runtime die speciaal is gebouwd voor Spring Boot. Het handelt service discovery, config server en blue-green deployments af, zodat Java-teams hun eigen infrastructuur niet hoeven te draaien.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Gebruik `springapp` wanneer je bestaande Spring Boot-apps hebt en een runtime wilt die daarvoor is geoptimaliseerd. Voor nieuwe gecontaineriseerde Java-apps zonder Spring-specifieke behoeften is `containerapp` vaak de eenvoudigere keuze.

## 🗃️ Databaseprovisioning

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

## 🔒 Beveiliging en geheimenbeheer

### Key Vault-integratie
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

### Managed Identity-configuratie
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

## 🌍 Netwerken en connectiviteit

### Virtual Network-configuratie
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

### Application Gateway met SSL
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

## 📊 Monitoring en observability

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

### Aangepaste metrics en alerts
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

## 🔧 Omgevingsspecifieke configuraties

### Parameterbestanden voor verschillende omgevingen
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

### Voorwaardelijke resource-provisioning
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

## 🚀 Geavanceerde provisioningpatronen

### Multi-region implementatie
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

### Infrastructure testing
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

## 🧪 Infrastructure Preview & Validatie (NIEUW)

### Voorbeeld van infrastructuurwijzigingen vóór implementatie

De `azd provision --preview`-functie laat je **infrastructuurprovisioning simuleren** voordat je daadwerkelijk resources implementeert. Het is vergelijkbaar met `terraform plan` of `bicep what-if` en biedt een **dry-run weergave** van welke wijzigingen in je Azure-omgeving zouden worden aangebracht.

#### 🛠️ Wat het doet
- **Analyseert je IaC-sjablonen** (Bicep of Terraform)
- **Toont een preview van resourcewijzigingen**: toevoegingen, verwijderingen, updates
- **Past geen wijzigingen toe** — het is alleen-lezen en veilig om uit te voeren

#### Gebruiksscenario's
```bash
# Bekijk infrastructuurwijzigingen vóór implementatie
azd provision --preview

# Voorvertoning voor een specifieke omgeving
azd provision --preview -e production
```

Dit commando helpt je:
- **Infrastructuurwijzigingen valideren** voordat je resources inzet
- **Misconfiguraties vroegtijdig detecteren** in de ontwikkelingscyclus
- **Veilig samenwerken** in teamomgevingen
- **Zorgen voor least-privilege-implementaties** zonder verrassingen

Het is vooral nuttig wanneer je:
- Werkt met complexe multi-service omgevingen
- Wijzigingen aanbrengt in productie-infrastructuur
- Sjabloonwijzigingen valideert voordat een PR wordt goedgekeurd
- Nieuwe teamleden traint in infrastructuurpatronen

### Voorbeeld van preview-output
De exacte preview-output varieert per provider en projectstructuur, maar het resultaat moet duidelijk de voorgestelde wijzigingen identificeren voordat er iets wordt toegepast.

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

## �🔄 Resource-updates en migraties

### Veilige resource-updates
```bash
# Bekijk infrastructuurwijzigingen eerst (AANBEVOLEN)
azd provision --preview

# Voer wijzigingen uit na bevestiging van de voorvertoning
azd provision --confirm-with-no-prompt

# Voor terugdraaien, gebruik Git om infrastructuurwijzigingen terug te draaien:
git revert HEAD  # Draai de laatste infrastructuurcommit terug
azd provision    # Pas de vorige infrastructuurstatus toe
```

### Databasemigraties
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

## 🎯 Best practices

### 1. Naamgevingsconventies voor resources
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. Tagging-strategie
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

### 3. Parametervalidatie
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

### 4. Outputorganisatie
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

## Volgende stappen

- [Pre-deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - Valideer resourcebeschikbaarheid
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - Los infrastructuurproblemen op
- [Debugging Guide](../chapter-07-troubleshooting/debugging.md) - Debug provisioningproblemen
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Kies geschikte servicetiers

## Aanvullende bronnen

- [Azure Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigatie**
- **Vorige les**: [Deployment Guide](deployment-guide.md)
- **Volgende les**: [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->