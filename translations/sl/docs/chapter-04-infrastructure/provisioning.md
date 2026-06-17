# Zagotavljanje Azure virov z AZD

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD For Beginners](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 4 - Infrastruktura kot koda in nameščanje
- **⬅️ Prejšnje**: [Deployment Guide](deployment-guide.md)
- **➡️ Naslednje poglavje**: [Poglavje 5: Večagentne AI rešitve](../../examples/retail-scenario.md)
- **🔧 Sorodno**: [Poglavje 6: Preverjanje pred nameščanjem](../chapter-06-pre-deployment/capacity-planning.md)

## Uvod

Ta obsežen vodnik pokriva vse, kar morate vedeti o zagotavljanju in upravljanju Azure virov z uporabo Azure Developer CLI. Naučite se izvajati vzorce Infrastrukture kot kode (IaC) od osnovnega ustvarjanja virov do naprednih infrastrukturnih arhitektur za podjetja z uporabo Bicep, ARM predlog, Terraform in Pulumi.

## Cilji učenja

S končanim temeljitim pregledom boste:
- Obvladali načela Infrastrukture kot kode in zagotavljanje Azure virov
- Razumeli več ponudnikov IaC, ki jih podpira Azure Developer CLI
- Načrtovali in implementirali Bicep predloge za običajne arhitekture aplikacij
- Konfigurirali parametre virov, spremenljivke in nastavitve specifične za okolje
- Uvedli napredne infrastrukturne vzorce vključno z omrežjem in varnostjo
- Upravljali življenjski cikel virov, posodobitve in reševanje odvisnosti

## Pričakovani rezultati učenja

Po zaključku boste sposobni:
- Načrtovati in zagotavljati Azure infrastrukturo z Bicep in ARM predlogami
- Konfigurirati kompleksne večstorivne arhitekture z ustreznimi odvisnostmi virov
- Uvesti parametrijske predloge za več okolij in konfiguracij
- Odpravljati težave pri zagotavljanju infrastrukture in reševati napake pri nameščanju
- Uporabljati načela Azure Well-Architected Framework pri načrtovanju infrastrukture
- Upravljati posodobitve infrastrukture in izvajati strategije verzioniranja infrastrukture

## Pregled zagotavljanja infrastrukture

Azure Developer CLI podpira več ponudnikov Infrastrukture kot kode (IaC):
- **Bicep** (priporočeno) - Azureov jezik, specifičen za domeno
- **ARM Templates** - JSON osnovane Azure Resource Manager predloge
- **Terraform** - Orodje za infrastrukturo za več oblakov
- **Pulumi** - Sodobna infrastruktura kot koda z uporabo programskih jezikov

## Razumevanje Azure virov

### Hierarhija virov
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Pogoste Azure storitve za aplikacije
- **Compute**: App Service, Container Apps, Functions, Virtual Machines
- **Storage**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Networking**: Virtual Network, Application Gateway, CDN
- **Security**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep infrastrukturne predloge

### Osnovna struktura Bicep predloge
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

### Napredni Bicep vzorci

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

#### Pogoje ustvarjanja virov
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

## 🌐 Uporaba Terraforma z azd

Bicep je privzeta izbira azd, vendar azd podpira tudi **Terraform**—uporabno, če vaša ekipa že standardizira na njem ali upravlja infrastrukturo v več oblakih. Potek dela azd (`azd up`, `azd provision`, `azd down`) je enak; spreminja se le jezik infrastrukture in struktura map.

### Povejte azd, naj uporablja Terraform

Dodajte razdelek `infra` v `azure.yaml`, ki kaže na ponudnika Terraform:

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

### Struktura mape za Terraform

S ponudnikom Terraform vaša mapa `infra/` uporablja `.tf` datoteke namesto Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Minimalni `main.tf`

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

### Kako se azd poveže z vašimi Terraform izhodi

azd bere Terraform **outputs**, da izve vaše končne točke in poveže vrednosti okolja nazaj v vašo aplikacijo. Imena izhodov so pomembna—azd išče določena:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **Pomembno:** azd uporablja oznako `azd-env-name` in izhode `AZURE_*` za sledenje virov po okolju. Vedno označite svojo skupino virov z `"azd-env-name" = var.environment_name`, da `azd down` lahko najde in odstrani vse.

### Nameščanje z Terraform

Ukazi so natanko enaki kot pri Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd v ozadju izvaja 'terraform plan'
azd up                    # provisioniranje + nameščanje
azd down --force          # uniči vire, ki jih upravlja Terraform
```

> **Predpogoj:** Terraform mora biti nameščen in na vaši `PATH`. azd upravlja Terraform *potek dela*, vendar Terraform ne namešča namesto vas. Za stanje azd privzeto uporablja lokalno stanje; za ekipe konfigurirajte oddaljeno skladišče stanja (na primer Azure Storage backend) v `provider.tf`.

Za popolne, izvajalne začetne projekte, ki temeljijo na Terraformu, prebrskajte [Awesome AZD gallery](https://azure.github.io/awesome-azd/) in filtrirajte za Terraform, ali si oglejte uradno [azd Terraform dokumentacijo](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Uporaba Pulumija z azd

Če vaša ekipa piše infrastrukturo v splošno-namenskih jezikih (TypeScript, Python, Go ali C#) namesto DSL, azd podpira tudi **Pulumi**. Tako kot pri Terraformu potek dela `azd up` / `azd provision` / `azd down` ostane nespremenjen—spremenijo se le orodja za infrastrukturo in struktura map.

### Povejte azd, naj uporablja Pulumi

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

### Struktura mape Pulumi

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### Minimalni `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// Označite vse vire, da jih bo azd lahko spremljal in odstranil.
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd prebere te izhode nazaj v vaše okolje.
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### Staki se preslikajo na azd okolja

Pulumi organizira nameščanja v **stacks**, azd pa preslika vsako azd okolje na Pulumi stack z enakim imenom. Ko zaženete `azd env new staging`, azd izbere (ali ustvari) Pulumi stack z imenom `staging`. Enaka pravila označevanja `azd-env-name` in izhodov `AZURE_*` veljajo, da lahko `azd down` najde in odstrani vse.

### Nameščanje z Pulumi

```bash
azd auth login
azd env new dev
azd provision --preview   # azd izvaja 'pulumi preview' v ozadju
azd up                    # zagotavljanje + razmestitev
azd down --force          # izvede 'pulumi destroy'
```

> **Predpogoj:** Pulumi mora biti nameščen in na vaši `PATH`, ter boste potrebovali backend za stanje (Pulumi Cloud ali samostojen backend, kot je Azure Blob Storage). azd upravlja Pulumi *potek dela*, ne nameščanja. Oglejte si uradno [azd Pulumi dokumentacijo](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd).

## 🎯 Izbira gostitelja za vašo storitev

Polje `host` v `azure.yaml` odloča, kje teče vaša koda. azd podpira več gostiteljev—prava izbira je pomembnejša od jezika infrastrukture. Tukaj je primerjava za začetnike:

| `host` value | Najbolj primerno za | Zakaj |
|--------------|---------------------|------|
| `appservice` | Tradicionalne spletne aplikacije in API-ji | Najpreprostejši PaaS; ni potrebnih vsebnikov |
| `staticwebapp` | Front-end SPA (React, Vue, Angular) | Globalni CDN + brezplačen SSL, vgrajena podpora API-jev |
| `function` | Dogodkovno poganjane in serverless delovne obremenitve | Skali na nič, plačilo na izvedbo |
| `containerapp` | Vsebinsko razdeljene storitve v vsebnikih | Serverless vsebniki, skaliranje na nič, vgrajen ingress |
| `aks` | Zahteve po kompleksni orkestraciji | Popoln nadzor nad Kubernetesom, ko ga res potrebujete |
| `springapp` | Java Spring Boot aplikacije | Upravljen Azure Spring Apps runtime, prilagojen za Spring |

### Kdaj izbrati AKS

**Azure Kubernetes Service (`host: aks`)** vam daje vso moč Kubernetesa—po meri ustvarjene kontrolerje, service meshe, kompleksno omrežje in natančno razporejanje. Ta moč prinaša operativno obremenitev: upravljate node poole, nadgradnje in omrežje gruče.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Začnite preprosteje, če je mogoče.** Za večino mikrostoritev **Container Apps** nudi vsebnike, samodejno skaliranje in skaliranje na nič brez upravljanja gruče. AKS izberite le, ko potrebujete Kubernetes-specifične funkcije.

### Kdaj uporabiti Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** je upravljano runtime okolje, namenjeno Spring Boot. Obravnava odkrivanje storitev, config server in blue-green nameščanje, tako da Java ekipe ne upravljajo lastne infrastrukture.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Uporabite `springapp`, ko imate obstoječe Spring Boot aplikacije in želite runtime, prilagojen zanje. Za nove kontejnerizirane Java aplikacije brez specifičnih potreb po Springu je `containerapp` pogosto preprostejša izbira.

## 🗃️ Zagotavljanje baz podatkov

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

## 🔒 Varnost in upravljanje skrivnosti

### Integracija Key Vault
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

### Konfiguracija Managed Identity
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

## 🌍 Omrežja in povezanost

### Konfiguracija Virtualnega omrežja
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

## 📊 Nadzor in opazljivost

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

### Prilagojene meritve in opozorila
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

## 🔧 Nastavitve specifične za okolje

### Datoteke parametrov za različna okolja
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

### Pogojno zagotavljanje virov
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

## 🚀 Napredni vzorci zagotavljanja

### Nameščanje v več regijah
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

### Testiranje infrastrukture
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

## 🧪 Predogled in preverjanje infrastrukture (NOVO)

### Predogled sprememb infrastrukture pred nameščanjem

Funkcija `azd provision --preview` vam omogoča, da **simulirate zagotavljanje infrastrukture** pred dejanskim nameščanjem virov. Podobna je duhu `terraform plan` ali `bicep what-if` in vam daje **suhi zagon**, kaj bi se spremenilo v vašem Azure okolju.

#### 🛠️ Kaj počne
- **Analizira vaše IaC predloge** (Bicep ali Terraform)
- **Pokaže predogled sprememb virov**: dodajanja, brisanja, posodobitve
- **Ne uporabi sprememb** — je le za ogled in varen za zagon

#### Primeri uporabe
```bash
# Predogled sprememb infrastrukture pred uvajanjem
azd provision --preview

# Predogled za določeno okolje
azd provision --preview -e production
```

Ta ukaz vam pomaga:
- **Preveriti spremembe infrastrukture** pred potrditvijo virov
- **Zajeti napačne konfiguracije zgodaj** v razvojnem ciklu
- **Varnostno sodelovati** v ekipnih okoljih
- **Zagotoviti najmanjše pravice pri nameščanju** brez nepričakovanj

Še posebej je uporaben, ko:
- Delate v kompleksnih večstoritvenih okoljih
- Spreminjate produkcijsko infrastrukturo
- Preverjate spremembe pred potrditvijo PR
- Učite nove člane ekipe o infrastrukturnih vzorcih

### Primer izhoda predogleda
Natančen izhod predogleda se razlikuje glede na ponudnika in strukturo projekta, vendar bi moral rezultat jasno identificirati predlagane spremembe, preden je karkoli uporabljeno.

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

## �🔄 Posodobitve in migracije virov

### Varne posodobitve virov
```bash
# Najprej predogled sprememb infrastrukture (PRIPOROČENO)
azd provision --preview

# Uveljavi spremembe po potrditvi predogleda
azd provision --confirm-with-no-prompt

# Za povrnitev uporabite Git za razveljavitev sprememb infrastrukture:
git revert HEAD  # Razveljavi zadnji commit infrastrukture
azd provision    # Obnovi prejšnje stanje infrastrukture
```

### Migracije baz podatkov
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

## 🎯 Najboljše prakse

### 1. Konvencije poimenovanja virov
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. Strategija označevanja (tagging)
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

### 3. Validacija parametrov
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

### 4. Organizacija izhodov
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

## Naslednji koraki

- [Pre-deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - Preverite razpoložljivost virov
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - Odpravljanje težav z infrastrukturo
- [Debugging Guide](../chapter-07-troubleshooting/debugging.md) - Odpravljanje napak pri zagotavljanju
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Izbira ustreznih stopenj storitev

## Dodatni viri

- [Azure Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigacija**
- **Prejšnja lekcija**: [Deployment Guide](deployment-guide.md)
- **Naslednja lekcija**: [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->