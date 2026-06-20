# Provisionering av Azure-ressurser med AZD

**Kapittelnavigasjon:**
- **📚 Kursoversikt**: [AZD For Beginners](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 4 - Infrastruktur som kode og distribusjon
- **⬅️ Forrige**: [Distribusjonsveiledning](deployment-guide.md)
- **➡️ Neste kapittel**: [Kapittel 5: Multi-Agent AI-løsninger](../../examples/retail-scenario.md)
- **🔧 Relatert**: [Kapittel 6: Validering før distribusjon](../chapter-06-pre-deployment/capacity-planning.md)

## Introduksjon

Denne omfattende guiden dekker alt du trenger å vite om å provisionere og administrere Azure-ressurser ved hjelp av Azure Developer CLI. Lær å implementere Infrastructure as Code (IaC)-mønstre fra enkel ressursopprettelse til avanserte infrastrukturarkitekturer i bedriftsklasse ved bruk av Bicep, ARM-maler, Terraform og Pulumi.

## Læringsmål

Ved å fullføre denne guiden vil du:
- Mestre prinsipper for Infrastructure as Code og provisioning av Azure-ressurser
- Forstå flere IaC-leverandører som støttes av Azure Developer CLI
- Utforme og implementere Bicep-maler for vanlige applikasjonsarkitekturer
- Konfigurere ressursparametere, variabler og miljøspesifikke innstillinger
- Implementere avanserte infrastrukturmønstre inkludert nettverk og sikkerhet
- Administrere ressurslivssyklus, oppdateringer og avhengighetsløsning

## Læringsutbytte

Etter fullføring vil du kunne:
- Designe og provisionere Azure-infrastruktur ved bruk av Bicep og ARM-maler
- Konfigurere komplekse multi-tjeneste arkitekturer med korrekte ressursavhengigheter
- Implementere parameteriserte maler for flere miljøer og konfigurasjoner
- Feilsøke problemer med infrastrukturprovisionering og løse distribusjonsfeil
- Anvende Azure Well-Architected Framework-prinsipper på infrastrukturdesign
- Administrere infrastrukturoppdateringer og implementere versjonsstrategier for infrastruktur

## Oversikt over infrastrukturprovisionering

Azure Developer CLI støtter flere Infrastructure as Code (IaC)-leverandører:
- **Bicep** (anbefalt) - Azures domene-spesifikke språk
- **ARM-maler** - JSON-baserte Azure Resource Manager-maler
- **Terraform** - Infrastrukturverktøy for flere skyer
- **Pulumi** - Moderne infrastruktur som kode med programmeringsspråk

## Forstå Azure-ressurser

### Ressurshierarki
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Vanlige Azure-tjenester for applikasjoner
- **Compute**: App Service, Container Apps, Functions, Virtuelle maskiner
- **Storage**: Storage-konto, Cosmos DB, SQL Database, PostgreSQL
- **Nettverk**: Virtuelt nettverk, Application Gateway, CDN
- **Sikkerhet**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep Infrastruktursmaler

### Grunnleggende Bicep-malstruktur
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

### Avanserte Bicep-mønstre

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

#### Betinget ressursopprettelse
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

## 🌐 Bruke Terraform med azd

Bicep er standard for azd, men azd støtter også **Terraform**—nyttig hvis teamet ditt allerede standardiserer på det eller du administrerer multi-cloud infrastruktur. azd-arbeidsflyten (`azd up`, `azd provision`, `azd down`) er identisk; bare infrastrukturspråk og mappestruktur endres.

### Fortell azd å bruke Terraform

Legg til en `infra` seksjon i `azure.yaml` som peker på Terraform-leverandøren:

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

### Terraform mappestruktur

Med Terraform-leverandøren bruker `infra/`-mappen `.tf`-filer i stedet for Bicep:

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

### Hvordan azd kobler til dine Terraform-utdata

azd leser Terraform **outputs** for å lære endepunktene dine og for å føre miljøverdier tilbake til appen din. Navnene på output-verdiene er viktige—azd ser etter spesifikke navn:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **Viktig:** azd bruker `azd-env-name` taggen og `AZURE_*` outputs for å spore ressurser per miljø. Merk alltid ressursgruppen din med `"azd-env-name" = var.environment_name` slik at `azd down` kan finne og fjerne alt.

### Distribuer med Terraform

Kommandoene er helt de samme som med Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd kjører 'terraform plan' under panseret
azd up                    # tilrettelegge + distribuere
azd down --force          # ødelegger de Terraform-administrerte ressursene
```

> **Forutsetning:** Terraform må være installert og i din `PATH`. azd håndterer Terraform *arbeidsflyt* men installerer ikke Terraform for deg. For state bruker azd som standard lokal state; for team bør du konfigurere et fjernlager (for eksempel et Azure Storage-backend) i `provider.tf`.

For komplette, kjørbare Terraform-baserte startprosjekter, se gjennom [Awesome AZD-galleriet](https://azure.github.io/awesome-azd/) og filtrer på Terraform, eller se den offisielle [azd Terraform-dokumentasjonen](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Bruke Pulumi med azd

Hvis teamet ditt skriver infrastruktur i et generelt programmeringsspråk (TypeScript, Python, Go eller C#) i stedet for et DSL, støtter azd også **Pulumi**. Som med Terraform er `azd up` / `azd provision` / `azd down`-arbeidsflyten uendret—bare infrastrukturverktøyet og mappestrukturen er annerledes.

### Fortell azd å bruke Pulumi

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

### Pulumi mappestruktur

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

// Merk hver ressurs slik at azd kan spore og rydde dem opp
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd leser disse utdataene tilbake inn i miljøet ditt
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### Stacks mapped til azd-miljøer

Pulumi organiserer distribusjoner i **stacks**, og azd knytter hvert azd-miljø til en Pulumi stack med samme navn. Når du kjører `azd env new staging`, velger (eller oppretter) azd Pulumi-stacken `staging`. De samme `azd-env-name` taggene og `AZURE_*` output-reglene gjelder, slik at `azd down` kan finne og fjerne alt.

### Distribuer med Pulumi

```bash
azd auth login
azd env new dev
azd provision --preview   # azd kjører 'pulumi preview' i bakgrunnen
azd up                    # opprettelse + distribusjon
azd down --force          # kjører 'pulumi destroy'
```

> **Forutsetning:** Pulumi må være installert og på din `PATH`, og du trenger en state backend (Pulumi Cloud eller selvadministrert backend som Azure Blob Storage). azd administrerer Pulumi *arbeidsflyten*, ikke installasjonen. Se den offisielle [azd Pulumi-dokumentasjonen](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd).

## 🎯 Velge en vert for tjenesten din

`host`-feltet i `azure.yaml` bestemmer hvor koden kjøres. azd støtter flere verter—det er viktigere å velge riktig enn infrastrukturspråk. Her er en nybegynnervennlig sammenligning:

| `host` verdi | Best for | Hvorfor |
|--------------|----------|---------|
| `appservice` | Tradisjonelle webapper og API-er | Enkleste PaaS; ingen containere kreves |
| `staticwebapp` | Front-end SPAs (React, Vue, Angular) | Global CDN + gratis SSL, innebygd API-støtte |
| `function` | Hendelsesstyrte og serverløse arbeidsbelastninger | Skaler til null, betal per kjøring |
| `containerapp` | Containeriserte mikrotjenester | Serverløse containere, skaler til null, innebygd ingress |
| `aks` | Kompleks orkestrering | Full Kubernetes-kontroll når du virkelig trenger det |
| `springapp` | Java Spring Boot-apper | Administrert Azure Spring Apps runtime tilpasset Spring |

### Når bør du velge AKS

**Azure Kubernetes Service (`host: aks`)** gir deg full kraft av Kubernetes—egendefinerte kontrollere, tjenestenettverk, kompleks nettverkskonfigurasjon og detaljert planlegging. Denne kraften medfører driftsmessig overhead: du må administrere nodepools, oppgraderinger og klyngenettverk.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Start enklere hvis du kan.** For de fleste mikrotjenester gir **Container Apps** deg containere, automatisk skalering, og skaler til null uten å administrere en klynge. Velg AKS bare når du trenger Kubernetes-spesifikke funksjoner.

### Når bør du bruke Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** er en administrert runtime bygget for Spring Boot. Den håndterer tjenesteoppdagelse, config-server, og blue-green distribusjon slik at Java-team ikke må kjøre egen infrastruktur.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Bruk `springapp` når du har eksisterende Spring Boot-apper og vil ha en runtime tilpasset disse. For nye containeriserte Java-apper uten Spring-spesifikke behov er `containerapp` ofte et enklere valg.

## 🗃️ Databasetilrettelegging

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

## 🔒 Sikkerhet og hemmelighetshåndtering

### Key Vault-integrasjon
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

### Administrert identitetskonfigurasjon
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

## 🌍 Nettverk og tilkobling

### Konfigurasjon av virtuelt nettverk
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

## 📊 Overvåkning og observabilitet

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

### Egne målinger og varsler
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

## 🔧 Miljøspesifikke konfigurasjoner

### Parameterfiler for ulike miljøer
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

### Betinget ressursprovisionering
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

## 🚀 Avanserte provisioneringsmønstre

### Multi-region distribusjon
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

### Infrastrukturtesting
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

## 🧪 Infrastruktur forhåndsvisning og validering (NYTT)

### Forhåndsvis infrastrukturendringer før distribusjon

`azd provision --preview` lar deg **simulere infrastrukturprovisionering** før du faktisk deployerer ressurser. Det er likt `terraform plan` eller `bicep what-if`, og gir deg en **dry-run visning** av hvilke endringer som ville bli gjort i ditt Azure-miljø.

#### 🛠️ Hva den gjør
- **Analyserer IaC-malene dine** (Bicep eller Terraform)
- **Viser forhåndsvisning av ressursendringer**: tillegg, sletting, oppdateringer
- **Utfører ikke endringer** — den er kun for lesing og trygg å kjøre

#### Bruksområder
```bash
# Forhåndsvis infrastrukturendringer før distribusjon
azd provision --preview

# Forhåndsvisning for spesifikt miljø
azd provision --preview -e production
```

Denne kommandoen hjelper deg med å:
- **Validere infrastrukturendringer** før du bekrefter ressurser
- **Oppdage feilkonfigurasjoner tidlig** i utviklingssyklusen
- **Samarbeide trygt** i teammiljøer
- **Sikre minste privilegier ved distribusjoner** uten overraskelser

Den er spesielt nyttig når du:
- Jobber med komplekse multi-tjeneste-miljøer
- Gjør endringer i produksjonsinfrastruktur
- Validerer malendringer før PR-godkjenning
- Trener nye teammedlemmer på infrastrukturmønstre

### Eksempel på forhåndsvisningsutdata
Nøyaktig forhåndsvisning varierer etter leverandør og prosjektstruktur, men resultatet skal tydelig vise foreslåtte endringer før noe blir gjennomført.

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

## �🔄 Ressursoppdateringer og migrasjoner

### Trygge ressursoppdateringer
```bash
# Forhåndsvis infrastrukturendringer først (ANBEFALT)
azd provision --preview

# Bruk endringer etter forhåndsvisningsbekreftelse
azd provision --confirm-with-no-prompt

# For tilbakestilling, bruk Git til å angre infrastrukturendringer:
git revert HEAD  # Angre siste infrastruktur-commit
azd provision    # Bruk forrige infrastrukturtilstand
```

### Databasemigrasjoner
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

## 🎯 Beste praksis

### 1. Retningslinjer for ressursnavngivning
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

### 4. Organisering av output
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

## Neste steg

- [Planlegging før distribusjon](../chapter-06-pre-deployment/capacity-planning.md) - Validere ressursdisponibilitet
- [Vanlige problemer](../chapter-07-troubleshooting/common-issues.md) - Feilsøke infrastrukturproblemer
- [Feilsøkingsguide](../chapter-07-troubleshooting/debugging.md) - Feilsøke provisioning problemer
- [SKU-valg](../chapter-06-pre-deployment/sku-selection.md) - Velg passende servicenivåer

## Ekstra ressurser

- [Azure Bicep-dokumentasjon](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager-maler](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigasjon**
- **Forrige leksjon**: [Distribusjonsveiledning](deployment-guide.md)
- **Neste leksjon**: [Kapasitetsplanlegging](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->