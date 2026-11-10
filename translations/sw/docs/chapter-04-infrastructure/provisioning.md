# Ugawaji wa Rasilimali za Azure kwa kutumia AZD

**Mwongozo wa Sura:**
- **📚 Kuu ya Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 4 - Miundombinu kama Msimbo na Ueneaji
- **⬅️ Iliyotangulia**: [Mwongozo wa Ueneaji](deployment-guide.md)
- **➡️ Sura Ifuatayo**: [Sura ya 5: Suluhisho za AI za Wakala Wengi](../../examples/retail-scenario.md)
- **🔧 Zinazohusiana**: [Sura ya 6: Uhakikisho Kabla ya Ueneaji](../chapter-06-pre-deployment/capacity-planning.md)

## Utangulizi

Mwongozo huu unahusu ugawaji na usimamizi wa rasilimali za Azure kwa kutumia Azure Developer CLI na watoa huduma wake waliojumuishwa wa Bicep na Terraform.

> Umepitiwa dhidi ya `azd 1.37.2` (Novemba 2026). Ikiwa haijatajwa vinginevyo, mifano ya Bicep, Terraform, na za skripti ni **vidonge vya mfano**, si kiolezo kamili. Viyungwe pamoja kwenye mradi unaotoa vigezo, moduli, utambulisho, mtandao, na msimbo wa programu unaorejelewa. Ugawaji wa Azure haukufanyika katika ukaguzi huu.

## Malengo ya Kujifunza

Kwa kumaliza mwongozo huu, utaweza:
- Kujifunza kanuni za Miundombinu kama Msimbo na ugawaji wa rasilimali za Azure
- Kuelewa watoa huduma wengi wa IaC wanaoungwa mkono na Azure Developer CLI
- Kubuni na kutekeleza violezo vya Bicep kwa miundo ya kawaida ya programu
- Kusanidi vigezo vya rasilimali, vigeuzi, na mipangilio maalum ya mazingira
- Kutekeleza mifumo ya hali ya juu ya miundombinu ikiwemo mitandao na usalama
- Kusimamia mzunguko wa maisha wa rasilimali, masasisho, na utatuzi wa utegemezi

## Matokeo ya Kujifunza

Baada ya kumaliza, utaweza:
- Kubuni na kugawa miundombinu ya Azure kwa kutumia violezo vya Bicep na ARM
- Kusanidi miundo changamano ya huduma nyingi na utegemezi sahihi wa rasilimali
- Kutekeleza violezo vilivyo na vigezo kwa mazingira na usanidi mbalimbali
- Kutatua matatizo ya ugawaji wa miundombinu na kufanikisha kushindwa kwa ueneaji
- Kutumia kanuni za Azure Well-Architected Framework katika muundo wa miundombinu
- Kusimamia masasisho ya miundombinu na kutekeleza mikakati ya matoleo ya miundombinu

## Muhtasari wa Ugawaji wa Miundombinu

Azure Developer CLI inaunga mkono watoa huduma mbalimbali wa Miundombinu kama Msimbo (IaC):
- **Bicep** (inapendekezwa) - lugha maalum ya Azure
- **Violezo vya ARM** - Bicep hugeuza kuwa ARM; JSON halisi ya ARM si sehemu iliyojumuishwa tofauti `infra.provider`
- **Terraform** - zana ya miundombinu ya wingu nyingi
- **Watoa huduma za ziada** - Zinahitaji kiendelezi cha mtoaji kilichosakinishwa kando na usanidi wake uliodokumentishwa; usitake umri wowote wa mtoa huduma kuungwa mkono

## Kuelewa Rasilimali za Azure

### Kiasi cha Rasilimali
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Huduma za Azure za Kawaida kwa Programu
- **Kuhesabu**: App Service, Container Apps, Functions, Mashine Halisi za Virtual
- **Uhifadhi**: Akaunti ya Uhifadhi, Cosmos DB, Hifadhidata ya SQL, PostgreSQL
- **Mtandao**: Mtandao Halisi, Application Gateway, CDN
- **Usalama**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Huduma za Azure AI, Azure OpenAI, Azure Machine Learning

## Violezo vya Miundombinu vya Bicep

### Muundo Msingi wa Kiolezo cha Bicep
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

Kwa mradi kamili wa azd, ita module hii kutoka kwa `infra/main.bicep` iliyo na wigo wa usajili ambayo huunda kundi la rasilimali lenye lebo na hupitisha wigo wake. Linganisha `environmentName`/`location` katika `main.parameters.json`. Lebo ya `azd-service-name: web` inaunganisha rasilimali na `services.web`; majina ya matokeo tu haysanidi kugundua huduma.

### Mifumo ya Hali ya Juu ya Bicep

#### Miundombinu ya Moduli
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

Bicep ni chaguo-msingi cha azd, lakini azd pia inaunga mkono **Terraform**—inayofaa ikiwa timu yako tayari inatumia au unasimamia miundombinu ya wingu nyingi. Mchakato wa azd (`azd up`, `azd provision`, `azd down`) ni sawa; tu lugha ya miundombinu na mpangilio wa folda hubadilika.

### Waambie azd kutumia Terraform

Ongeza sehemu ya `infra` kwenye `azure.yaml` inayorejelea mtoa huduma wa Terraform:

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

### Mpangilio wa folda ya Terraform

Kwa mtoa huduma wa Terraform, folda yako ya `infra/` hutumia faili za `.tf` badala ya Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Kido kidogo cha `main.tf`

Hii huunda kundi la rasilimali na mpango tu, si huduma inayoweza kuenezwa. Lazima pia ueleze vigezo vya kuingiza, mtoa huduma wa `azurerm` anayefaa, programu ya wavuti, na ramani ya lebo/jina la rasilimali la huduma.

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

azd husoma **matokeo** ya Terraform kama thamani za mazingira. Sehemu hii inadhani umefafanua `azurerm_linux_web_app.web`; ugunduo wa huduma bado unahitaji jina la rasilimali linalolingana au lebo ya `azd-service-name`:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **Muhimu:** azd hutumia lebo ya `azd-env-name` na matokeo ya `AZURE_*` kufuatilia rasilimali kwa kila mazingira. Daima weka lebo ya kundi lako la rasilimali kwa `"azd-env-name" = var.environment_name` ili `azd down` iweze kupata na kuondoa kila kitu.

### Tengeneza na Terraform

Amri ni sawa kabisa na zile za Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **Sharti:** Terraform lazima iwe imewekwa na katika `PATH` yako. azd husimamia *mchakato* wa Terraform lakini haisakinishi Terraform kwa niaba yako. Kwa hali yake, azd huchagua hali ya ndani; kwa timu, sanidi backend ya mbali (kwa mfano, backend ya Azure Storage) katika `provider.tf`.

Kwa wanaoanza wa kitaalamu wa msingi wa Terraform, tafuta kwenye [Hifadhi ya AZD Bora](https://azure.github.io/awesome-azd/) na chuja kwa Terraform, au ona [nyaraka rasmi za azd Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Zana Nyingine za Miundombinu

Pulumi si mtoa huduma aliyojumuishwa wa azd 1.37.2. Kuweka tu `infra.provider: pulumi` hakutengenezi muingiliano unaofanya kazi, na `azd env new` haitaunda/chagua stack ya Pulumi moja kwa moja. Ikiwa unatumia zana nyingine ya IaC, fuata nyaraka za kiendelezi cha mtoa huduma uliothibitishwa au simamia mzunguko wake wazi katika mchakato wako. Kozi hii haisambazi au kuthibitisha mtoa huduma wa Pulumi.

## 🎯 Kuchagua Mjiji wa Huduma Yako

Uwanja wa `host` katika `azure.yaml` huchagua wapi msimbo wako unaendesha. azd inaunga mkono wajiji kadhaa—kuchagua mzuri ni jambo muhimu zaidi kuliko lugha ya miundombinu. Hapa kuna kulinganisha rafiki kwa waanzilishi:

| Thamani ya `host` | Bora kwa | Kwa nini |
|--------------|----------|-----|
| `appservice` | Programu za wavuti za jadi na API | PaaS rahisi; haina makontena yanayohitajika |
| `staticwebapp` | SPAs za mbele (React, Vue, Angular) | CDN ya dunia + SSL bure, msaada wa API uliokusanyika |
| `function` | Kazi zinazosababishwa na matukio na zisizo na seva | Kiwango cha sifuri, lipa kwa utekelezaji |
| `containerapp` | Huduma ndogo zilizo na makontena | Makontena yasiyo na seva, kiwango cha sifuri, ingizo lililojumuishwa |
| `aks` | Mahitaji ya kupanga tata | Udhibiti kamili wa Kubernetes unapohitaji kweli |
| `springapp` | Ueneaji wa Azure Spring Apps uliopo | Lengo la urithi; huduma itaanza kustaafu Machi 31, 2028 na imefungwa kwa wateja wapya |

### Wakati wa kufikia AKS

**Huduma ya Azure Kubernetes (`host: aks`)** inakupa nguvu kamili ya Kubernetes—vidhibiti maalum, mibai ya huduma, mtandao mgumu, na upangaji wa kina. Nguvu hiyo inakuja na mzigo wa operesheni: unasimamia mizunguko ya node, masasisho, na mtandao wa kundi.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Anza kwa urahisi ikiwa unaweza.** Kwa huduma ndogo nyingi, **Container Apps** inakupa makontena, kiwango cha moja kwa moja, na kiwango cha sifuri bila kusimamia kundi. Chagua AKS tu unapohitaji vipengele maalum vya Kubernetes.

### Wakati wa kutumia Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** ni runtime inayosimamiwa iliyojengwa mahsusi kwa Spring Boot. Inasimamia kugundua huduma, seva ya usanidi, na ueneaji wa blue-green ili timu za Java zisisimamie miundombinu yao wenyewe.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Usichague Azure Spring Apps kwa mradi wa mwanzo mpya: imefungwa kwa wateja wapya na [itastaafu Machi 31, 2028](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). Tubuni mbadala zinazoungwa mkono kama Container Apps na panga uhamisho wa ueneaji uliopo.

## 🗃️ Ugawaji wa Hifadhidata

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
**Mahitaji ya kidonge:** fafanua `@secure() param databasePassword string` na tumia thamani thabiti inayotolewa. Chagua upatikanaji wa umma **au** uingize subnet iliyohamishiwa / DNS binafsi hapo chini; vipande viwili havijiunganishi moja kwa moja.

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

Kanuni ya `0.0.0.0` inaruhusu muunganisho kutoka huduma za Azure zaidi ya usajili wako mwenyewe. Hii si mtandao binafsi; pendekeza muundo wa mtandao uliozuiwa kwa kazi halisi.

## 🔒 Usimamizi wa Usalama na Siri

### Mwangiliano wa Key Vault
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

### Usanidi wa Utambulisho ulio Simamiwa
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

Kwa utambulisho uliopeanwa na mfumo, usiweka `AZURE_CLIENT_ID` kuwa ID yake ya mkuu. Utambulisho uliopeanwa na mtumiaji hutumia **ID ya mteja**, si ID ya kitu/mkuu. Marejeleo ya Key Vault yanahitaji pia mgawo wa jukumu la hifadhi ya utambulisho wa programu na ufikiaji wa mtandao.

## 🌍 Mtandao na Uunganisho

### Usanidi wa Mtandao Halisi
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
**Kidonge cha muundo usio kamilifu, si lango linaloweza kuenezwa:** ongeza `gateway-subnet` maalum kwa VNet pamoja na mabwawa ya nyuma, mipangilio ya HTTP, wasikilizaji, sheria za njia na vipaumbele, na cheti cha TLS (au marejeleo ya Key Vault yaliyoidhinishwa). Kufungua mlango 443 pekee hakusanidi HTTPS.

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

## 📊 Ufuatiliaji na Uangalizi

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

### Vipimo Maalum na Tahadhari
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

## 🔧 Mipangilio Maalum ya Mazingira

### Faili za Vigezo kwa Mazingira Mbalimbali
Faili mbili hapa chini ni **mifano mbadala ya faili ya vigezo**. azd haisanii kuchagua `main.parameters.dev.json` au `main.parameters.prod.json` kwa jina la mazingira. Tumia `main.parameters.json` halisi na mabadiliko ya mazingira (kwa mfano `${APP_SERVICE_SKU=B1}`), na fafanua/tumia kila kigezo katika Bicep.

Mifano ya maudhui kwa `infra/main.parameters.dev.json`:

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

Mifano ya maudhui kwa `infra/main.parameters.prod.json`:

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

### Ugawaji wa Rasilimali kwa Masharti
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

## 🚀 Mifumo ya Ugawaji wa Hali ya Juu

### Ueneaji wa Mabara ya Mbalimbali
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

### Ukaguzi wa Miundombinu
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

Ugawaji wa miundombinu hauenezwi msimbo wa programu yako. Endesha ukaguzi wa programu tu baada ya `azd deploy`/`azd up`, na tumia `/health` tu ikiwa programu yako inaiweka. Skripti za ueneaji za ARM huunda rasilimali za Azure na zinahitaji utambulisho wa ziada, toleo la runtime linaloungwa mkono, na ruhusa; si majaribio ya kitengo cha ndani.

## 🧪 Mapitio & Uhakiki wa Miundombinu (MPYA)

### Angalia Mabadiliko ya Miundombinu Kabla ya Ueneaji

Kipengele cha `azd provision --preview` hukuruhusu **kuigiza ugawaji wa miundombinu** kabla ya kugawa rasilimali halisi. Ni sawa na mawazo ya `terraform plan` au `bicep what-if`, yakikupa **muonekano wa mtihani** wa mabadiliko yangetokea kwa mazingira yako ya Azure.

#### 🛠️ Kinachofanya
- **Huchambua violezo vyako vya IaC** (Bicep au Terraform)
- **Inaonyesha mapitio ya mabadiliko ya rasilimali**: nyongeza, ufutaji, masasisho
- **Haitumii mabadiliko ya miundombinu yanayopendekezwa na mtoaji** — angalia kwanza hook za mradi; skripti zinaweza kuwa na athari za upande na mapitio bado yanahitaji ruhusa za Azure

#### Matumizi
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

Amri hii hukusaidia:
- **Thibitisha mabadiliko ya miundombinu** kabla ya kutoa rasilimali
- **Gundua makosa mapema** katika mzunguko wa maendeleo
- **Shirikiana kwa usalama** katika mazingira ya timu
- **Hakikisha utoaji unaoelekezwa kwa uhalali mdogo** bila mshangao

Inafaa hasa wakati:
- Unapotumia mazingira changamano ya huduma nyingi
- Kufanya mabadiliko kwa miundombinu ya uzalishaji
- Kuthibitisha marekebisho ya kiolezo kabla ya idhini ya PR
- Kufunza wanachama wapya wa timu kuhusu mifumo ya miundombinu

### Mfano wa Matokeo ya Mapitio
Matokeo halisi ya mapitio hutofautiana kwa mtoa huduma na muundo wa mradi, lakini matokeo yanapaswa kuonyesha kwa uwazi mabadiliko yaliyopendekezwa kabla ya kutekelezwa.

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

## �🔄 Masasisho na Uhamisho wa Rasilimali

### Masasisho Salama ya Rasilimali
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

### Uhamishaji wa Hifadhidata
**Mfumo usio kamili wa skripti ya ueneaji:** unahitaji utambulisho uliopeanwa na mtumiaji uliosanikishwa mahali panapohitajika, runtime ya Azure CLI inayoungwa mkono, zana za uhamishaji zinazopatikana, saraka/usanii wa uhamisho uliotolewa, na uunganisho wa hifadhidata. Hii si executable kwa kubandika rasilimali hii moja kwa moja kwenye kiolezo.

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

## 🎯 Mbinu Bora

### 1. Kanuni za Kuitwa Rasilimali
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. Mkakati wa Kuweka Lebo
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

### 3. Uhakiki wa Vigezo
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

- [Mipango Kabla ya Ueneaji](../chapter-06-pre-deployment/capacity-planning.md) - Thibitisha upatikanaji wa rasilimali
- [Matatizo ya Kawaida](../chapter-07-troubleshooting/common-issues.md) - Tatua matatizo ya miundombinu
- [Mwongozo wa Kurekebisha Hitilafu](../chapter-07-troubleshooting/debugging.md) - Rekebisha matatizo ya upatikanaji
- [Uchaguzi wa SKU](../chapter-06-pre-deployment/sku-selection.md) - Chagua ngazi za huduma zinazofaa

## Rasilimali Zaidi

- [Nyaraka za Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Violezo vya Meneja Rasilimali wa Azure](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Kituo cha Mimaribinu ya Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Mfumo Bora wa Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Uelekezaji**
- **Somo Lililopita**: [Mwongozo wa Utekelezaji](deployment-guide.md)
- **Somo Linalofuata**: [Mipango ya Uwezo](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->