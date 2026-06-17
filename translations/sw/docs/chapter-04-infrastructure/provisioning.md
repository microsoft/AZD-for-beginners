# Kuweka Rasilimali za Azure kwa AZD

**Chapter Navigation:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura 4 - Miundombinu kama Msimbo & Utekelezaji
- **⬅️ Awali**: [Mwongozo wa Utekelezaji](deployment-guide.md)
- **➡️ Sura Ifuatayo**: [Sura 5: Suluhisho za AI zenye Wawakilishi Wengi](../../examples/retail-scenario.md)
- **🔧 Inayohusiana**: [Sura 6: Uthibitisho Kabla ya Utekelezaji](../chapter-06-pre-deployment/capacity-planning.md)

## Utangulizi

Mwongozo huu kamili unashughulikia kila kitu unachohitaji kujua kuhusu kuweka na kusimamia rasilimali za Azure ukitumia Azure Developer CLI. Jifunze kutekeleza mifumo ya Miundombinu kama Msimbo (IaC) kutoka uundaji wa rasilimali za msingi hadi miundo ya miundombinu ya ngazi ya biashara kwa kutumia Bicep, Templates za ARM, Terraform, na Pulumi.

## Malengo ya Kujifunza

Kwa kumaliza mwongozo huu, utakuwa umeweza:
- Kumaster kanuni za Miundombinu kama Msimbo na uwekaji wa rasilimali za Azure
- Kuelewa wazalishaji wengi wa IaC wanaoungwa mkono na Azure Developer CLI
- Kubuni na kutekeleza violezo vya Bicep kwa miundo ya kawaida ya programu
- Kusanidi vigezo vya rasilimali, vigezo vya kazi, na mipangilio maalum kwa mazingira
- Kutekeleza mifumo ya juu ya miundombinu ikijumuisha mitandao na usalama
- Kusimamia maisha ya rasilimali, masasisho, na utatuzi wa utegemezi

## Matokeo ya Kujifunza

Baada ya kumaliza, utaweza:
- Kubuni na kuweka miundombinu ya Azure kwa kutumia Bicep na Templates za ARM
- Kusanidi miundo tata ya huduma nyingi na utegemezi sahihi wa rasilimali
- Kutekeleza violezo vilivyoparameteriwa kwa mazingira na usanidi mbalimbali
- Kutatua matatizo ya uwekaji wa miundombinu na kutatua kushindwa kwa utekelezaji
- Kutumia kanuni za Azure Well-Architected Framework katika muundo wa miundombinu
- Kusimamia masasisho ya miundombinu na kutekeleza mikakati ya usanifu wa matoleo ya miundombinu

## Muhtasari wa Kuweka Miundombinu

Azure Developer CLI inaunga mkono wazalishaji mbalimbali wa Miundombinu kama Msimbo (IaC):
- **Bicep** (inayopendekezwa) - lugha maalum ya Azure
- **ARM Templates** - Templates za Azure Resource Manager zenye msingi wa JSON
- **Terraform** - chombo cha miundombinu kwa wingu nyingi
- **Pulumi** - miundombinu kama msimbo kwa lugha za programu za kisasa

## Kuelewa Rasilimali za Azure

### Hierarki ya Rasilimali
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Huduma za kawaida za Azure kwa Programu
- **Compute**: App Service, Container Apps, Functions, Virtual Machines
- **Storage**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Networking**: Virtual Network, Application Gateway, CDN
- **Security**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Violezo vya Miundombinu vya Bicep

### Muundo wa Kimsingi wa Kiolezo cha Bicep
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

### Mifumo ya Juu ya Bicep

#### Miundombinu Modular
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

#### Uundaji wa Rasilimali kwa Masharti
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

## 🌐 Kutumia Terraform na azd

Bicep ndio chaguo-msingi cha azd, lakini azd pia inaunga mkono **Terraform**—inayofaa ikiwa timu yako tayari inafanya kazi nayo au unasimamia miundombinu kwa wingu nyingi. Mwendo wa kazi wa azd (`azd up`, `azd provision`, `azd down`) ni sawa; tofauti ni lugha ya miundombinu na mpangilio wa saraka.

### Mwambie azd itumie Terraform

Ongeza sehemu ya `infra` kwenye `azure.yaml` ikielekeza kwa msambazaji wa Terraform:

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

### Muundo wa saraka ya Terraform

Kwa msambazaji wa Terraform, folda yako ya `infra/` inatumia faili `.tf` badala ya Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### `main.tf` ya msingi

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

### Jinsi azd inavyounganisha na matokeo yako ya Terraform

azd husoma **outputs** za Terraform ili kujifunza vituo vyako na kuunganisha thamani za mazingira tena katika app yako. Majina ya output ni muhimu—azd inatafuta maalum:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **Wazimu:** azd inatumia tag ya `azd-env-name` na outputs za `AZURE_*` kufuatilia rasilimali kwa kila mazingira. Leka kila wakati kikundi chako cha rasilimali na "azd-env-name" = var.environment_name ili `azd down` iweze kupata na kuondoa kila kitu.

### Tekeleza kwa Terraform

Amri ni sawa kabisa na Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd inaendesha 'terraform plan' chini ya pazia
azd up                    # kuandaa + kupeleka
azd down --force          # huharibu rasilimali zinazosimamiwa na Terraform
```

> **Mahitajio:** Terraform lazima iwe imewekwa na kuwa kwenye `PATH` yako. azd inasimamia *workflow* ya Terraform lakini haitakiwii kusakinisha Terraform kwa niaba yako. Kwa hali ya state, azd kwa msingi hutumia state ya eneo; kwa timu, sanidi backend ya mbali (kwa mfano, Azure Storage backend) katika `provider.tf`.

Kwa starters kamili, zinazoenda, msingi za Terraform, tembelea [Awesome AZD gallery](https://azure.github.io/awesome-azd/) na uchague kwa Terraform, au angalia [nyaraka rasmi za azd Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Kutumia Pulumi na azd

Ikiwa timu yako inaandika miundombinu kwa lugha za programu za kusudi la jumla (TypeScript, Python, Go, au C#) badala ya DSL, azd pia inaunga mkono **Pulumi**. Kama ilivyo kwa Terraform, mwendo wa kazi `azd up` / `azd provision` / `azd down` hautabadilika—tu zana za miundombinu na mpangilio wa saraka ndizo tofauti.

### Mwambie azd itumie Pulumi

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

### Muundo wa saraka ya Pulumi

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### `index.ts` ya msingi

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// Taga kila rasilimali ili azd iweze kuzifuatilia na kuzisafisha
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd inasoma matokeo haya na kuyaingiza tena katika mazingira yako
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### Stacks zinahusishwa na mazingira ya azd

Pulumi inaratibu utekelezaji kuwa **stacks**, na azd inaweka kila mazingira ya azd kwa Pulumi stack yenye jina moja. Unapoendesha `azd env new staging`, azd huchagua (au huunda) Pulumi stack ya `staging`. Kanuni ile ile ya ku-tag `azd-env-name` na sheria za output za `AZURE_*` zinafanya kazi, hivyo `azd down` inaweza kupata na kuondoa kila kitu.

### Tekeleza kwa Pulumi

```bash
azd auth login
azd env new dev
azd provision --preview   # azd inaendesha 'pulumi preview' ndani yake
azd up                    # kuandaa + kupeleka
azd down --force          # inaendesha 'pulumi destroy'
```

> **Mahitajio:** Pulumi lazima iwe imewekwa na kuwa kwenye `PATH` yako, na utahitaji backend ya state (Pulumi Cloud au backend uliodhibitiwa mwenyewe kama Azure Blob Storage). azd inasimamia *workflow* ya Pulumi, sio usakinishaji. Angalia [nyaraka rasmi za azd Pulumi](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd).

## 🎯 Kuchagua Mtumaji kwa Huduma Yako

Uwanja wa `host` katika `azure.yaml` huamua wapi msimbo wako utaendesha. azd inaunga mkono watumaji kadhaa—kuchagua sahihi ni muhimu zaidi kuliko lugha ya miundombinu. Hapa ni kulinganisha rafiki kwa wanaoanza:

| `host` value | Best for | Why |
|--------------|----------|-----|
| `appservice` | Programu za wavuti za jadi na API | PaaS rahisi; hakuna container zinazohitajika |
| `staticwebapp` | SPAs za upande wa mbele (React, Vue, Angular) | CDN ya ulimwengu + SSL ya bure, msaada wa API uliojengwa ndani |
| `function` | Mizigo ya kazi inayotegemea matukio na isiyo ya seva | Inakua hadi sifuri, lipa kwa kila utekelezaji |
| `containerapp` | Microservices zilizowekwa ndani ya container | Containers za serverless, inakua hadi sifuri, ingress imejengwa ndani |
| `aks` | Mahitaji ya orkestri tata | Udhibiti kamili wa Kubernetes wakati unahitaji kweli |
| `springapp` | Programu za Java Spring Boot | Muda wa uendeshaji wa Azure Spring Apps uliosimamiwa kwa ajili ya Spring |

### Wakati wa kutumia AKS

**Azure Kubernetes Service (`host: aks`)** inakupa nguvu kamili ya Kubernetes—kontrol za desturi, service meshes, mitandao tata, na upangaji wa kina. Nguvu hiyo inaambatana na mzigo wa uendeshaji: wewe unasimamia node pools, masasisho, na mitandao ya klasta.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Anza kwa rahisi iwapo unaweza.** Kwa microservices nyingi, **Container Apps** inakupa containers, autoscaling, na scale-to-zero bila kusimamia klasta. Chagua AKS tu unapohitaji vipengele maalum vya Kubernetes.

### Wakati wa kutumia Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** ni runtime iliyosimamiwa iliyoundwa mahsusi kwa Spring Boot. Inashughulikia discovery ya huduma, config server, na deployment za blue-green ili timu za Java zisisimamie miundombinu yao wenyewe.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Tumia `springapp` unapokuwa na programu za Spring Boot zilizopo na unataka runtime iliyorekebishwa kwao. Kwa programu mpya za Java zilizo kwenye container zisizo na mahitaji maalum ya Spring, `containerapp` mara nyingi ni chaguo rahisi zaidi.

## 🗃️ Utoaji wa Hifadhidata

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

## 🔒 Usalama na Usimamizi wa Siri

### Uunganisho wa Key Vault
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

### Usanidi wa Utambulisho Ulisimamiwa
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

## 🌍 Mtandao na Muunganisho

### Usanidi wa Virtual Network
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

### Application Gateway na SSL
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

## 📊 Ufuatiliaji na Uonekano

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

### Vipimo vya Kibinafsi na Tahadhari
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

## 🔧 Usanidi Maalum kwa Mazingira

### Faili za Parameta kwa Mazingira Tofauti
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

### Utoaji wa Rasilimali kwa Masharti
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

## 🚀 Mifano ya Juu ya Utoaji

### Utekelezaji katika Maeneo Mengi
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

### Kupima Miundombinu
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

## 🧪 Mapitio na Uthibitisho wa Miundombinu (MPYA)

### Angalia Mabadiliko ya Miundombinu Kabla ya Utekelezaji

Kipengele cha `azd provision --preview` kinakuwezesha **kuiga kuweka miundombinu** kabla ya kutekeleza rasilimali kwa kweli. Kinafanana kwa roho na `terraform plan` au `bicep what-if`, kikikupa mtazamo wa **ujaribu-kavu** wa mabadiliko yatakayofanywa kwenye mazingira yako ya Azure.

#### 🛠️ Inafanya Nini
- **Inachanganua violezo vyako vya IaC** (Bicep au Terraform)
- **Inaonyesha mapitio ya mabadiliko ya rasilimali**: kuongeza, kufuta, kusasisha
- **Haiweke mabadiliko** — ni kwa kusoma tu na ni salama kuendesha

#### Matumizi
```bash
# Angalia mabadiliko ya miundombinu kabla ya utekelezaji
azd provision --preview

# Mapitio kwa mazingira maalum
azd provision --preview -e production
```

Amri hii inakusaidia:
- **Kuthibitisha mabadiliko ya miundombinu** kabla ya kuapa rasilimali
- **Kugundua mipangilio isiyo sahihi mapema** katika mzunguko wa maendeleo
- **Kushirikiana kwa usalama** katika mazingira ya timu
- **Kuhakikisha utekelezaji wa haki ndogo kabisa (least-privilege)** bila mshangao

Ni hasa muhimu wakati:
- Ukifanya kazi na mazingira tata za huduma nyingi
- Kufanya mabadiliko kwenye miundombinu ya uzalishaji
- Kuthibitisha marekebisho ya kiolezo kabla ya kuidhinishwa kwenye PR
- Kufundisha wanachama wapya wa timu kuhusu mifumo ya miundombinu

### Mfano wa Matokeo ya Mapitio
Matokeo kamili ya mapitio yanatofautiana kulingana na msambazaji na muundo wa mradi, lakini matokeo yanapaswa kutambulisha kwa uwazi mabadiliko yaliyopendekezwa kabla ya lolote kutekelezwa.

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

## �🔄 Sasisho na Uhamisho wa Rasilimali

### Sasisho Salama za Rasilimali
```bash
# Angalia mabadiliko ya miundombinu kwanza (INAPENDELEWA)
azd provision --preview

# Tekeleza mabadiliko baada ya uthibitisho wa mapitio
azd provision --confirm-with-no-prompt

# Kwa kurejesha nyuma, tumia Git kurudisha mabadiliko ya miundombinu:
git revert HEAD  # Rejesha commit ya mwisho ya miundombinu
azd provision    # Tekeleza hali ya awali ya miundombinu
```

### Uhamisho wa Hifadhidata
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

## 🎯 Mbinu Bora

### 1. Kanuni za Kuitwa kwa Rasilimali
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. Mkakati wa Kuweka Lebo (Tagging)
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

### 3. Uthibitisho wa Parameta
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

### 4. Mpangilio wa Matokeo
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

## Hatua Zifuatazo

- [Mipango Kabla ya Utekelezaji](../chapter-06-pre-deployment/capacity-planning.md) - Thibitisha upatikanaji wa rasilimali
- [Masuala ya Kawaida](../chapter-07-troubleshooting/common-issues.md) - Tatua matatizo ya miundombinu
- [Mwongozo wa Urekebishaji](../chapter-07-troubleshooting/debugging.md) - Rekebisha matatizo ya kuweka rasilimali
- [Uchaguzi wa SKU](../chapter-06-pre-deployment/sku-selection.md) - Chagua ngazi zinazofaa za huduma

## Vyanzo Vya Ziada

- [Azure Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Uvinjari**
- **Somo la Awali**: [Mwongozo wa Utekelezaji](deployment-guide.md)
- **Somo Ifuatayo**: [Mipango ya Uwezo](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->