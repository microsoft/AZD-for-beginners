# Azure-resources provisioneren met AZD

**Navigatie door hoofdstukken:**
- **📚 Cursusstartpagina**: [AZD voor Beginners](../../README.md)
- **📖 Huidig hoofdstuk**: Hoofdstuk 4 - Infrastructure as Code & Deployment
- **⬅️ Vorig**: [Deploygids](deployment-guide.md)
- **➡️ Volgend hoofdstuk**: [Hoofdstuk 5: Multi-Agent AI-oplossingen](../../examples/retail-scenario.md)
- **🔧 Verwant**: [Hoofdstuk 6: Validatie vóór deployment](../chapter-06-pre-deployment/capacity-planning.md)

## Introductie

Deze gids behandelt het provisioneren en beheren van Azure-resources met Azure Developer CLI en de ingebouwde Bicep- en Terraform-providers.

> Gecontroleerd aan de hand van `azd 1.37.2` (november 2026). Tenzij anders vermeld, zijn Bicep-, Terraform- en scriptexamples **illustratieve fragmenten**, geen complete templates. Voeg ze samen in een project dat de genoemde parameters, modules, identiteiten, netwerken en applicatiecode levert. Azure-provisioning is tijdens deze review niet uitgevoerd.

## Leerdoelen

Door deze gids te voltooien, leer je:
- Meesterschap in Infrastructure as Code-principes en Azure-resource provisioning
- Inzicht in diverse IaC-providers die Azure Developer CLI ondersteunt
- Bicep-templates ontwerpen en implementeren voor veelvoorkomende applicatie-architecturen
- Resourceparameters, variabelen en omgevingsspecifieke instellingen configureren
- Geavanceerde infrastructuurpatronen toepassen, inclusief netwerken en beveiliging
- Resource lifecycle, updates en afhankelijkheidsresolutie beheren

## Leerresultaten

Na afronding kun je:
- Azure-infrastructuur ontwerpen en provisioneren met Bicep- en ARM-templates
- Complexe multi-service architecturen configureren met correcte resource-afhankelijkheden
- Gepersonaliseerde templates implementeren voor meerdere omgevingen en configuraties
- Problemen met infrastructure provisioning oplossen en deployment-fouten herstellen
- Azure Well-Architected Framework-principes op infrastructuurontwerp toepassen
- Infrastructuurupdates beheren en versiebeheerstrategieën toepassen

## Overzicht van Infrastructure Provisioning

Azure Developer CLI ondersteunt meerdere Infrastructure as Code (IaC) providers:
- **Bicep** (aanbevolen) - de domeinspecifieke taal van Azure
- **ARM-templates** - Bicep compileert naar ARM; ruwe ARM JSON is geen aparte ingebouwde `infra.provider`
- **Terraform** - Multi-cloud infrastructuurtool
- **Extension providers** - vereisen een apart geïnstalleerde providerextensie en de gedocumenteerde configuratie; ga er niet vanuit dat een willekeurige providerstring wordt ondersteund

## Azure Resources begrijpen

### Resource-hiërarchie
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Veelvoorkomende Azure-diensten voor applicaties
- **Compute**: App Service, Container Apps, Functions, Virtuele Machines
- **Opslag**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Netwerken**: Virtual Network, Application Gateway, CDN
- **Beveiliging**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep Infrastructure Templates

### Basisstructuur van een Bicep-template
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

Voor een compleet azd-project roep je deze module aan vanuit een abonnement-gescopeerde `infra/main.bicep` die een getagde resource group aanmaakt en de scope doorgeeft. Laat `environmentName`/`location` overeenkomen met `main.parameters.json`. De `azd-service-name: web`-tag koppelt de resource aan `services.web`; willekeurige output-namen configureren alleen geen servicediscovery.

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

#### Voorwaardelijke resource creatie
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

Bicep is standaard in azd, maar azd ondersteunt ook **Terraform** — handig als je team dit al gebruikt of multi-cloud infrastructuur beheert. De azd-workflow (`azd up`, `azd provision`, `azd down`) is identiek; alleen de infrastructuurtaal en mappenstructuur veranderen.

### azd vertellen Terraform te gebruiken

Voeg een `infra`-sectie toe aan `azure.yaml` die verwijst naar de Terraform-provider:

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

### Terraform mappenstructuur

Bij de Terraform-provider bevat je `infra/`-map `.tf` bestanden in plaats van Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Een `main.tf`-fragment

Dit maakt alleen een resource group en plan aan, geen deploybare service. Je moet ook input-variabelen, een compatibele `azurerm` provider, de web-app en de mapping van servicetag/resource-naam declareren.

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

azd leest Terraform **outputs** in als omgevingswaarden. Dit fragment gaat ervan uit dat je `azurerm_linux_web_app.web` hebt gedefinieerd; servicediscovery vereist nog steeds een overeenkomende resource-naam of `azd-service-name`-tag:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **Belangrijk:** azd gebruikt de `azd-env-name`-tag en `AZURE_*` outputs om resources per omgeving te volgen. Tag altijd je resourcegroep met `"azd-env-name" = var.environment_name` zodat `azd down` alles kan vinden en verwijderen.

### Deploy met Terraform

De commando's zijn exact hetzelfde als met Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **Vereiste:** Terraform moet geïnstalleerd zijn en in je `PATH` staan. azd beheert de Terraform *workflow* maar installeert Terraform niet voor je. Voor state gebruikt azd standaard lokale state; voor teams configureer een remote backend (bijvoorbeeld een Azure Storage backend) in `provider.tf`.

Voor complete, uitvoerbare Terraform-starters, bekijk de [Awesome AZD gallery](https://azure.github.io/awesome-azd/) en filter op Terraform, of zie de officiële [azd Terraform-documentatie](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Andere infrastructuurtools

Pulumi is geen ingebouwde azd 1.37.2 provisioning-provider. Alleen `infra.provider: pulumi` instellen creëert geen werkende integratie, en `azd env new` creëert/selecteert niet automatisch een Pulumi-stack. Gebruik je een andere IaC-tool, volg dan de documentatie van een geverifieerde providerextension of beheer de lifecycle expliciet in je eigen workflow. Deze cursus levert of valideert geen Pulumi-provider.

## 🎯 Een host kiezen voor je service

Het `host`-veld in `azure.yaml` bepaalt waar je code draait. azd ondersteunt verschillende hosts — de juiste keuze is belangrijker dan de infrastructuurtaal. Hier een vergelijking voor beginners:

| `host` waarde | Geschikt voor | Waarom |
|--------------|----------|-----|
| `appservice` | Traditionele webapps en API's | Eenvoudige PaaS, geen containers nodig |
| `staticwebapp` | Front-end SPAs (React, Vue, Angular) | Globale CDN + gratis SSL, ingebouwde API-ondersteuning |
| `function` | Event-gedreven en serverloze workloads | Schaal tot nul, betalen per uitvoering |
| `containerapp` | Gecontaineriseerde microservices | Serverless containers, schaal tot nul, ingebouwde ingress |
| `aks` | Complexe orkestratiebehoeften | Volledige Kubernetes controle wanneer echt nodig |
| `springapp` | Bestaande Azure Spring Apps deployments | Legacy doel; service stopt op 31 maart 2028 en is gesloten voor nieuwe klanten |

### Wanneer AKS gebruiken

**Azure Kubernetes Service (`host: aks`)** biedt je de volledige kracht van Kubernetes — aangepaste controllers, service meshes, complexe netwerken en fijnmazige scheduling. Dit gaat gepaard met operationele overhead: je beheert node pools, upgrades en clusternetwerken.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Begin eenvoudiger als het kan.** Voor de meeste microservices biedt **Container Apps** containers, autoscaling en schaal tot nul, zonder dat je een cluster hoeft te beheren. Kies AKS alleen als je specifieke Kubernetes-functionaliteit nodig hebt.

### Wanneer Azure Spring Apps gebruiken

**Azure Spring Apps (`host: springapp`)** is een beheerde runtime speciaal voor Spring Boot. Het regelt servicediscovery, configserver en blue-green deployment zodat Java-teams hun eigen infrastructuur niet hoeven beheren.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Selecteer Azure Spring Apps niet voor een nieuw beginnerproject: het is gesloten voor nieuwe klanten en [stopt op 31 maart 2028](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). Geef de voorkeur aan ondersteunde alternatieven zoals Container Apps en plan migratie voor bestaande deployments.

## 🗃️ Database provisioning

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
**Fragmentvereisten:** declareer `@secure() param databasePassword string` en gebruik een sterke meegeleverde waarde. Kies publieke toegang **of** integreer het gedelegeerde subnet/private DNS hieronder; de twee snippets verbinden zichzelf niet automatisch.

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

De `0.0.0.0` regel staat verbindingen toe van Azure-diensten buiten je eigen abonnement. Het is geen privé-netwerk; geef bij echte workloads de voorkeur aan een restrictief netwerkontwerp.

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
          name: 'NODE_ENV'
          value: 'production'
        }
      ]
    }
  }
}
```

Voor een system-assigned identity stel `AZURE_CLIENT_ID` niet in op het principal ID. Een user-assigned identity gebruikt haar **client ID**, niet het object-/principal ID. De Key Vault-referentie vereist ook dat de app-identity de vault roltoewijzing en netwerktoegang heeft.

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
**Onvolledig architectuurfragment, geen deploybare gateway:** voeg een dedicated `gateway-subnet` toe aan de VNet plus backendpools, HTTP-instellingen, listeners, routeringsregels met prioriteiten en een TLS-certificaat (of geautoriseerde Key Vault-referentie). Alleen poort 443 openen configureert geen HTTPS.

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

## 📊 Monitoring en observeerbaarheid

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

### Aangepaste metrics en waarschuwingen
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

## 🔧 Omgevingsspecifieke configuraties

### Parameterbestanden voor verschillende omgevingen
De twee bestanden hieronder zijn **alternatieve parameterbestand-examples**. azd selecteert niet automatisch `main.parameters.dev.json` of `main.parameters.prod.json` op omgevingsnaam. Gebruik het daadwerkelijke `main.parameters.json` met omgevingssubstituties (bijvoorbeeld `${APP_SERVICE_SKU=B1}`), en declareer/gebruik elke parameter in Bicep.

Voorbeeldinhoud voor `infra/main.parameters.dev.json`:

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

Voorbeeldinhoud voor `infra/main.parameters.prod.json`:

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

### Voorwaardelijke resource provisioning
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

## 🚀 Geavanceerde provisioning-patronen

### Multi-region deployment
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

### Infrastructuurtesten
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

Provisioning van infrastructuur implementeert je applicatiecode niet. Voer applicatiecontroles alleen uit na `azd deploy`/`azd up`, en gebruik `/health` alleen als je app het ondersteunt. ARM deployment-scripts maken Azure-resources aan en hebben extra identiteit, ondersteunde runtimeversies en permissies nodig; het zijn geen lokale unittests.

## 🧪 Infrastructuur preview & validatie (NIEUW)

### Preview van infrastructuurwijzigingen vóór deployment

De `azd provision --preview`-functie laat je **infrastructuur provisioning simuleren** voordat je daadwerkelijk resources uitrolt. Het lijkt op `terraform plan` of `bicep what-if`, en geeft je een **dry-run-overzicht** van welke wijzigingen aan je Azure-omgeving zouden worden gedaan.

#### 🛠️ Wat het doet
- **Analyseert je IaC-templates** (Bicep of Terraform)
- **Toont een preview van resourcewijzigingen**: toevoegingen, verwijderingen, updates
- **Voert de voorgestelde infrastructuurwijzigingen van de provider niet uit** — inspecteer projecthooks eerst; scripts kunnen bijwerkingen hebben en preview vereist nog steeds Azure-rechten

#### Gebruiksscenario's
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

Dit commando helpt je om:
- **Validatie van infrastructuurwijzigingen** vóór het inzetten van resources
- **Miskonfiguraties vroegtijdig op te sporen** in de ontwikkelingscyclus
- **Veilig samen te werken** in teamomgevingen
- **Least-privilege deployments te garanderen** zonder verrassingen

Het is vooral nuttig wanneer:
- Je werkt met complexe multi-service omgevingen
- Je wijzigingen aan productie-infrastructuur doorvoert
- Je template-wijzigingen valideert vóór PR-goedkeuring
- Je nieuwe teamleden traint in infrastructuurpatronen

### Voorbeeld preview-uitvoer
Exacte preview-uitvoer varieert per provider en projectstructuur, maar het resultaat moet duidelijk de voorgestelde wijzigingen tonen voordat er iets wordt doorgevoerd.

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

## �🔄 Resource-updates en migraties

### Veilige resource-updates
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

### Database-migraties
**Onvolledig deployment-scriptpatroon:** vereist een geconfigureerde user-assigned identity waar nodig, ondersteunde Azure CLI-runtime, beschikbare migratietools, een meegeleverd migratiedirectory/configuratie en databaseconnectiviteit. Dit is niet uitvoerbaar door alleen deze resource in een template te plakken.

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

## 🎯 Beste praktijken

### 1. Conventies voor resource-namen
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. Tagging-strategie
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

### 3. Parameter-validatie
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

### 4. Output-organisatie
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

- [Planning vóór deployment](../chapter-06-pre-deployment/capacity-planning.md) - Validatie van resourcebeschikbaarheid
- [Veelvoorkomende problemen](../chapter-07-troubleshooting/common-issues.md) - Problemen met infrastructuur oplossen
- [Debuggids](../chapter-07-troubleshooting/debugging.md) - Fouten oplossen bij provisioning
- [SKU Selectie](../chapter-06-pre-deployment/sku-selection.md) - Kies geschikte servicetiers

## Aanvullende bronnen

- [Azure Bicep Documentatie](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architectuur Centrum](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigatie**
- **Vorige Les**: [Implementatie Gids](deployment-guide.md)
- **Volgende Les**: [Capaciteitsplanning](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->