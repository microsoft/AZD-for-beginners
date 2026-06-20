# Azure ressursside provisjonimine AZD-ga

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 4 - Infrastruktuur koodina ja juurutamine
- **⬅️ Eelmine**: [Juurutusjuhend](deployment-guide.md)
- **➡️ Järgmine peatükk**: [Peatükk 5: Mitmeagendi AI lahendused](../../examples/retail-scenario.md)
- **🔧 Seotud**: [Peatükk 6: Eeljuurutuse valideerimine](../chapter-06-pre-deployment/capacity-planning.md)

## Sissejuhatus

See põhjalik juhend katab kõik, mida pead teadma Azure ressursside provisjonimisest ja haldamisest Azure Developer CLI abil. Õpi rakendama infrastruktuuri koodina (IaC) mustreid alates lihtsast ressursside loomisest kuni keerukate ettevõtte taseme infrastruktuuri arhitektuuride loomiseni Bicep, ARM mallide, Terraforma ja Pulumi abil.

## Õpieesmärgid

Selle juhendi läbimisel:
- Valdad infrastruktuuri koodina põhimõtteid ja Azure ressursside provisjonimist
- Mõistad Azure Developer CLI toetatud mitut IaC pakkujat
- Kujundad ja rakendad Bicep malle tavaliste rakenduste arhitektuuride jaoks
- Konfigureerid ressursside parameetreid, muutujaid ja keskkonnaspetsiifilisi sätteid
- Rakendad arenenud infrastruktuuri mustreid, kaasa arvatud võrgustiku ja turvalisuse
- Halad ressursside elutsüklit, uuendusi ja sõltuvuste lahendamist

## Õpitulemused

Lõpetades saad:
- Kujundada ja provisjonida Azure infrastruktuuri Bicep ja ARM mallide abil
- Konfigureerida keerukaid mitme teenuse arhitektuure õige ressursisõltuvusega
- Rakendada parameetriseeritud malle mitmele keskkonnale ja konfiguratsioonile
- Tõrkeotsingut teha infrastruktuuri provisjonimisel ja lahendada juurutuse ebaõnnestumisi
- Rakendada Azure hästi arhitektuuri raamistikku infrastruktuuri kujunduses
- Haldada infrastruktuuri uuendusi ja rakendada versioonihaldusstrateegiaid

## Infrastruktuuri provisjonimise ülevaade

Azure Developer CLI toetab mitut infrastruktuuri koodina (IaC) pakkujat:
- **Bicep** (soovitatud) - Azure domeenispetsiifiline keel
- **ARM mallid** - JSON-põhised Azure Resource Manager’i mallid
- **Terraform** - Mitme pilvega infrastruktuuritööriist
- **Pulumi** - Kaasaegne infrastruktuur koodina, kasutades programmeerimiskeeli

## Arusaamine Azure ressurssidest

### Ressursside hierarhia
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Levinumad Azure teenused rakendustele
- **Arvutamine**: App Service, Container Apps, Functions, Virtual Machines
- **Salvestus**: Salvestuskonto, Cosmos DB, SQL andmebaas, PostgreSQL
- **Võrgustik**: Virtuaalne võrk, Application Gateway, CDN
- **Turvalisus**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI teenused, Azure OpenAI, Azure Machine Learning

## Bicep infrastruktuuri mallid

### Põhiline Bicep malli struktuur
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

### Arenenud Bicep mustrid

#### Modulaarne infrastruktuur
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

#### Tingimuslik ressursside loomine
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

## 🌐 Terraformi kasutamine azd-ga

Bicep on azd vaikevariant, kuid azd toetab ka **Terraformi** – kasulik kui sinu meeskond kasutab seda juba standardina või haldad mitme pilve infrastruktuuri. Azd töövoog (`azd up`, `azd provision`, `azd down`) on identne; muutub ainult infrastruktuuri keel ja kaustade paigutus.

### Ütle azd-le, et kasutaks Terraformi

Lisa `azure.yaml` failile `infra` sektsioon, mis osutab Terraformi pakkujale:

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

### Terraformi kaustastruktuur

Terraformi pakkujaga kasutab su `infra/` kaust `.tf` faile Bicep asemel:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Minimaalne `main.tf`

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

### Kuidas azd loeb Terraformi väljundeid

azd loeb Terraformi **väljundeid**, et teada saada oma lõpp-punkte ja siduda keskkonnamuutujad rakendusega. Väljundite nimed on olulised – azd otsib konkreetseid:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **Oluline:** azd kasutab `azd-env-name` sildi ja `AZURE_*` väljundeid, et jälgida ressursse keskkonna lõikes. Märgi alati ressursside grupp sildiga `"azd-env-name" = var.environment_name`, nii suudab käsk `azd down` kõik tuvastada ja eemaldada.

### Juurutus Terraformi abil

Käsud on täpselt samad nagu Bicepi puhul:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd käivitab "terraform plan" taustal
azd up                    # varustamine + juurutamine
azd down --force          # hävitab Terraformi hallatavad ressursid
```

> **Eeltingimus:** Terraform peab olema installitud ja sinu `PATH’is`. Azd haldab Terraformi *töövoogu*, aga ei installi Terraformi. Staatuse jaoks kasutab azd vaikeväärtusena lokaalset staatust; meeskondadel soovitatakse seadistada kaugtagatis (nt Azure Storage backend) failis `provider.tf`.

Täielike ja käivitatavate Terraformi baasil alustajate näidete jaoks sirvi [Awesome AZD galeriid](https://azure.github.io/awesome-azd/) ja filtreeri Terraformi järgi või vaata ametlikku [azd Terraform dokumentatsiooni](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Pulumi kasutamine azd-ga

Kui sinu meeskond kirjutab infrastruktuuri üldotstarbelises keeles (TypeScript, Python, Go või C#) mitte DSL-is, siis azd toetab ka **Pulumi**. Nagu Terraformi puhul, jääb `azd up` / `azd provision` / `azd down` töövoog muutumatuks – infrastruktuuri tööriistad ja kaustade struktuur on ainus erinevus.

### Ütle azd-le, et kasutaks Pulumit

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

### Pulumi kaustapakett

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### Minimaalne `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// Märgi kõik ressursid, et azd saaks neid jälgida ja koristada
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd loeb need väljundid tagasi sinu keskkonda
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### Stakid seostuvad azd keskkondadega

Pulumi korraldab juurutused **stakkidesse** ja azd seob iga azd keskkonna sama nimega Pulumi stakiga. Kui käivitate `azd env new staging`, valib või loob azd `staging` Pulumi staki. Kehtivad samad `azd-env-name` märgistuse ja `AZURE_*` väljundi reeglid, nii et `azd down` leiab ja eemaldab kõik.

### Juurutus Pulumi abil

```bash
azd auth login
azd env new dev
azd provision --preview   # azd käivitab vaikimisi 'pulumi preview'
azd up                    # hankimine + juurutamine
azd down --force          # käivitab 'pulumi destroy'
```

> **Eeltingimus:** Pulumi peab olema installitud ja sinu `PATH’is`, ning vajad staatuse hoidmiseks backendit (Pulumi Cloud või ise hallatav backend nagu Azure Blob Storage). azd haldab Pulumi *töövoogu*, mitte installi. Vaata ametlikku [azd Pulumi dokumentatsiooni](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd).

## 🎯 Teenuse hosti valimine

`host` väli failis `azure.yaml` otsustab, kus su kood jookseb. azd toetab mitut hosti – õige valik on tähtsam kui infrastruktuuri keel. Siin on algajasõbralik võrdlus:

| `host` väärtus | Sobib hästi | Miks |
|--------------|----------|-----|
| `appservice` | Traditsioonilised veebirakendused ja API-d | Lihtsaim PaaS; konteinerid pole vajalikud |
| `staticwebapp` | Esiotsa SPA-d (React, Vue, Angular) | Globaalne CDN + tasuta SSL, sisseehitatud API tugi |
| `function` | Sündmuspõhised ja serverivabad tööload | Skaalub kuni nullini, maksa ainult käivitamise eest |
| `containerapp` | Konteineripõhised mikroteenused | Serverivabad konteinerid, skaala kuni nullini, sisseehitatud sissetulek |
| `aks` | Keerukad orkestreerimisvajadused | Täielik Kubernetes’i kontroll just siis, kui seda päriselt vajad |
| `springapp` | Java Spring Boot rakendused | Hallatud Azure Spring Apps runtime, mis on optimeeritud Springi jaoks |

### Millal valida AKS

**Azure Kubernetes Service (`host: aks`)** annab sulle kogu Kubernetes’i jõu – kohandatud kontrollerid, teenuse võrgustikud, keerukas võrguhaldus ja peenhäälestatud ajastamine. See võim kaasneb operatiivse koormusega: pead haldama sõlmede gruppe, uuendusi ja klastrivõrku.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Alusta lihtsamalt, kui võimalik.** Enamiku mikroteenuste puhul pakub **Container Apps** konteinerid, automaatskaala ja skaala-alla ilma klastrit haldamata. Vali AKS ainult siis, kui vajad Kubernetesile omaseid funktsioone.

### Millal kasutada Azure Spring Apps-i

**Azure Spring Apps (`host: springapp`)** on hallatud runtime, mis on spetsiaalselt loodud Spring Booti jaoks. See haldab teenuse avastust, konfiguratsiooniserverit ja sinine-roheline juurutust, nii et Java tiimid ei pea ise infrastruktuuri jooksutama.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Kasuta `springapp` juhul, kui sul on olemasolevad Spring Boot rakendused ja soovid neile optimeeritud runtime’i. Uute konteineripõhiste Java rakenduste puhul ilma Springi spetsiifiliste vajadusteta on sageli lihtsam valik `containerapp`.

## 🗃️ Andmebaasi provisjonimine

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

## 🔒 Turvalisus ja saladuste haldamine

### Key Vault integratsioon
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

### Hallatud identiteedi seadistus
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

## 🌍 Võrgustik ja ühenduvus

### Virtuaalvõrgu seadistus
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

### Application Gateway koos SSL-iga
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

## 📊 Jälgimine ja nähtavus

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

### Kohandatud mõõdikud ja häired
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

## 🔧 Keskkonnaspetsiifilised konfiguratsioonid

### Parameetrite failid erinevatele keskkondadele
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

### Tingimuslik ressursside provisjonimine
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

## 🚀 Arendatud provisjonimise mustrid

### Mitmeregiooniline juurutus
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

### Infrastruktuuri testimine
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

## 🧪 Infrastruktuuri eelvaade ja valideerimine (UUED)

### Eelvaata infrastruktuuri muudatusi enne juurutust

Funktsioon `azd provision --preview` võimaldab **simuleerida infrastruktuuri provisjonimist** enne ressursside tegelikku juurutamist. See on sarnane `terraform plan` või `bicep what-if` käskudega, pakkudes **kuivjooksu vaadet** sellele, millised muudatused su Azure keskkonnas tehtaks.

#### 🛠️ Mida see teeb
- **Analüüsib su IaC malle** (Bicep või Terraform)
- **Näitab ressursside muudatuste eelvaadet**: lisamised, kustutamised, uuendused
- **Ei rakenda muudatusi** – on ainult lugemisrežiimis ning ohutu kasutada

#### Kasutusjuhtumid
```bash
# Ehituse muutuste eelvaade enne juurutamist
azd provision --preview

# Eelvaade konkreetse keskkonna jaoks
azd provision --preview -e production
```

See käsk aitab sul:
- **Valideerida infrastruktuuri muudatusi** enne ressursside pühendumist
- **Tuvastada valesti seadistusi varajases arendusetapis**
- **Koostööd teha turvaliselt meeskonna keskkonnas**
- **Tagada minimaalsete õigustega juurutused ilma üllatusteta**

See sobib eriti hästi, kui:
- Töötad keerukate mitmes teenuses keskkondadega
- Teed muudatusi tootmisinfrastruktuuris
- Valideerid mallimuudatusi enne PR kinnitamist
- Koolitad uusi meeskonnaliikmeid infrastruktuuri mustritele

### Eelvaate väljundi näide
Täielik eelvaate väljund varieerub sõltuvalt pakkujast ja projekti struktuurist, kuid tulemus peaks selgelt näitama kavandatavaid muudatusi enne nende rakendamist.

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

## �🔄 Ressursside uuendused ja migratsioonid

### Turvalised ressursside uuendused
```bash
# Vaadake esmalt infrastruktuuri muudatused üle (SOOVITATAV)
azd provision --preview

# Rakendage muudatused pärast eelvaate kinnitust
azd provision --confirm-with-no-prompt

# Tagasikerimiseks kasutage Git'i infrastruktuuri muudatuste tagasi võtmiseks:
git revert HEAD  # Võtke tagasi viimane infrastruktuuri commit
azd provision    # Rakendage eelmine infrastruktuuri olek
```

### Andmebaasi migratsioonid
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

## 🎯 Parimad tavad

### 1. Ressursside nimetamise konventsioonid
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. Sildistamisstrateegia
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

### 3. Parameetrite valideerimine
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

### 4. Väljundi organiseerimine
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

## Järgmised sammud

- [Eeljuurutuse planeerimine](../chapter-06-pre-deployment/capacity-planning.md) - Ressursside kättesaadavuse valideerimine
- [Levinumad probleemid](../chapter-07-troubleshooting/common-issues.md) - Infrastruktuuri probleemide tõrkeotsing
- [Silumine](../chapter-07-troubleshooting/debugging.md) - Provisjonimisprobleemide silumine
- [SKU valik](../chapter-06-pre-deployment/sku-selection.md) - Sobivate teenusetasemete valimine

## Täiendavad ressursid

- [Azure Bicep dokumentatsioon](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager mallid](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure arhitektuuri keskus](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure hästi arhitektuuri raamistik](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigeerimine**
- **Eelmine õppetükk**: [Juurutusjuhend](deployment-guide.md)
- **Järgmine õppetükk**: [Võimekuse planeerimine](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->