# ការផ្ដល់ធនធាន Azure ជាមួយ AZD

**ការរុករកជំពូក:**
- **📚 ផ្ទៃផ្ទះវគ្គសិក្សា**: [AZD សម្រាប់អ្នកចាប់ផ្ដើម](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**: ជំពូក 4 - សម្ព័ន្ធអគារជាគូដ & ការដាក់បញ្ចូល
- **⬅️ មុននេះ**: [មគ្គុទេសក៍ការដាក់បញ្ចូល](deployment-guide.md)
- **➡️ ជំពូកបន្ទាប់**: [ជំពូក 5: ដំណោះស្រាយ AI ពហុភ្នាក់ងារ](../../examples/retail-scenario.md)
- **🔧 ពាក់ព័ន្ធ**: [ជំពូក 6: ការធ្វើតេស្តមុនការដាក់បញ្ចូល](../chapter-06-pre-deployment/capacity-planning.md)

## អារម្មណ៍ទិដ្ឋភាព

មគ្គុទេសក៍នេះគ្របដណ្តប់ការផ្ដល់ធនធាន និងគ្រប់គ្រងធនធាន Azure ដោយប្រើ Azure Developer CLI ជាមួយអ្នកផ្គត់ផ្គង់ Bicep និង Terraform ដែលមានរួចមកហើយ។

> ត្រូវបានពិនិត្យវិញប្រឆាំងនឹង `azd 1.37.2` (វិច្ឆិកា 2026)។ លុះត្រាតែមានការបញ្ជាក់ផ្សេងទៀត Bicep, Terraform, និងឧទាហរណ៍ស្ក្រីបគឺជាផ្នែកដល់បង្ហាញ **ផ្នែកគំរូ** មិនមែនជាគំរូពេញលេញទេ។ បញ្ចូលពួកវាចូលក្នុងគម្រោងដែលផ្គត់ផ្គង់ប៉ារ៉ាម៉ែត្រ, ម៉ូឌុល, អត្តសញ្ញាណ, បណ្តាញ, និងកូដពាក់ព័ន្ធនឹងកម្មវិធី។ ការផ្គត់ផ្គង់ Azure មិនត្រូវបានអនុវត្តនៅក្នុងការពិនិត្យនេះឡើយ។

## គោលបំណងការសិក្សា

ដោយបញ្ចប់មគ្គុទេសក៍នេះ អ្នកនឹងអាច៖
- ច្បាស់លាស់ពីគោលការណ៍ Infrastructure as Code និងការផ្គត់ផ្គង់ធនធាន Azure
- យល់ដឹងពីអ្នកផ្គត់ផ្គង់ IaC ជាច្រើនដែលគាំទ្រដោយ Azure Developer CLI
- រចនានិងអនុវត្តគំរូ Bicep សម្រាប់ស្ថាបត្យកម្មកម្មវិធីទូទៅ
- កំណត់ប៉ារ៉ាម៉ែត្រ ឧបករណ៍បម្លែង និងការកំណត់សម្រាប់បរិយាកាសជាក់លាក់
- អនុវត្តលំនាំឧបករណ៍ជាក់ល្អ រួមមានបណ្តាញ និងសុវត្ថិភាព
- គ្រប់គ្រងជីវិតធនធាន ការអាប់ដេត និងការដោះស្រាយលក្ខខណ្ឌអាស្រ័យ

## លទ្ធផលការសិក្សា

បន្ទាប់ពីបញ្ចប់ អ្នកនឹងអាច៖
- រចនា និងផ្គត់ផ្គង់ហេដ្ឋារចនាសម្ព័ន្ធ Azure ដោយប្រើ Bicep និងគំរូ ARM
- កំណត់ស្ថាបត្យកម្មបង្ហាត់សេវាកម្មច្រើនជាមួយលក្ខខណ្ឌអាស្រ័យត្រឹមត្រូវ
- អនុវត្តគំរូដែលមានប៉ារ៉ាម៉ែត្រសម្រាប់បរិយាកាស និងការកំណត់ជាច្រើន
- ដោះស្រាយបញ្ហាក្នុងការផ្គត់ផ្គង់ហេដ្ឋារចនាសម្ព័ន្ធ និងដោះស្រាយការបរាជ័យក្នុងការបញ្ចូល
- អនុវត្តគោលការណ៍ Azure Well-Architected Framework ដល់ការរចនាហេដ្ឋារចនាសម្ព័ន្ធ
- គ្រប់គ្រងការអាប់ដេតហេដ្ឋារចនាសម្ព័ន្ធ និងអនុវត្តយុទ្ធសាស្រ្តកំណែហេដ្ឋារចនាសម្ព័ន្ធ

## ទិដ្ឋភាពទូទៅនៃការផ្គត់ផ្គង់ហេដ្ឋារចនាសម្ព័ន្ធ

Azure Developer CLI គាំទ្រអ្នកផ្គត់ផ្គង់ Infrastructure as Code (IaC) ច្រើន:
- **Bicep** (ផ្លូវបញ្ជូន) - ភាសាជំនាញផ្នែក Azure
- **ARM Templates** - Bicep រំលផ្សងទៅ ARM; ARM JSON ដើមមិនមែនជាអ្នកផ្គត់ផ្គង់បង្កើតរួចជាស្រេចនោះទេ `infra.provider`
- **Terraform** - ឧបករណ៍ហេដ្ឋារចនាសម្ព័ន្ធច្រើនពពក
- **អ្នកផ្គត់ផ្គង់បន្ថែម** - តម្រូវឲ្យដំឡើងផ្នែកបន្ថែមរបស់អ្នកផ្គត់ផ្គង់ និងការកំណត់ដែលបានឯកសារស្រាប់; កុំសន្មតពីស្ទ្រីងអ្នកផ្គត់ផ្គង់ណាមួយថាគាំទ្រ

## ការយល់ដឹងអំពីធនធាន Azure

### រៀបចំធនធាន
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### សេវាកម្ម Azure ទូទៅសម្រាប់កម្មវិធី
- **គណនា**: App Service, Container Apps, Functions, Virtual Machines
- **ការផ្ទុក**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **បណ្តាញ**: Virtual Network, Application Gateway, CDN
- **សុវត្ថិភាព**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: សេវាកម្ម Azure AI, Azure OpenAI, Azure Machine Learning

## គំរូហេដ្ឋារចនាសម្ព័ន្ធ Bicep

### រចនាសម្ព័ន្ធគំរូ Bicep មូលដ្ឋាន
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

សម្រាប់គម្រោង azd ពេញលេញ ហៅម៉ូឌុលនេះពី `infra/main.bicep` ដែលមានវិស័យសម្រាប់បង្កើតក្រុមធនធានដែលមានស្លា និងបញ្ជូនវិស័យរបស់វា។ ត្រូវគ្នា `environmentName`/`location` នៅក្នុង `main.parameters.json`។ ស្លាសះសួន `azd-service-name: web` ផ្គាប់ធនធានជាមួយ `services.web`; ឈ្មោះលទ្ធផលបញ្ចេញដោយចៃដន្យមិនបង្កើតការរកសេវាកម្មទេ។

### លំនាំ Bicep ជាច្រើនជាន់

#### ហេដ្ឋារចនាសម្ព័ន្ធម៉ូឌុល
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

#### ការបង្កើតធនធានជាបរិបទ
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

## 🌐 ការប្រើ Terraform ជាមួយ azd

Bicep គឺជាស្តង់ដារប្រើប្រាស់ឯកតារបស់ azd ប៉ុន្តែ azd ក៏គាំទ្រ **Terraform**—មានប្រយោជន៍ ប្រសិនបើក្រុមរបស់អ្នកបានធ្វើស្តង់ដារលើវា ឬអ្នកគ្រប់គ្រងហេដ្ឋារចនាសម្ព័ន្ធពហុពពក។ ប្រតិបត្តិការ azd (`azd up`, `azd provision`, `azd down`) គឺដូចគ្នា; តែភាសាហេដ្ឋារចនាសម្ព័ន្ធ និងរចនាសម្ព័ន្ធថតថែទាំផ្លាស់ប្ដូរ។

### ប្រាប់ azd អោយប្រើ Terraform

បន្ថែមផ្នែក `infra` ទៅក្នុង `azure.yaml` ដែលបង្ហាញចំពោះអ្នកផ្គត់ផ្គង់ Terraform:

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

### រចនាសម្ព័ន្ធថតបញ្ជី Terraform

ជាមួយអ្នកផ្គត់ផ្គង់ Terraform, ថត `infra/` របស់អ្នកប្រើឯកសារ `.tf` ជំនួស Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### ផ្នែក `main.tf`

នេះបង្កើតតែ ក្រុមធនធាន និងផែនការ ប៉ុណ្ណោះ មិនមែនសេវាកម្មដែលអាចចាក់ដំណើរការបាន។ អ្នកត្រូវផ្សDeclare ជាប៉ារ៉ាម៉ែត្រ ប្រាសាទ `azurerm` ត្រូវគ្នា និងគេត្រូវបង្កើតវេបសាយ និងផែនទីផ្នែកសេវាកម្ម/ឈ្មោះធនធានរបស់វា។

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

### របៀប azd ភ្ជាប់ទៅលទ្ធផល Terraform របស់អ្នក

azd អាន **outputs** ពី Terraform ទៅតម្លៃបរិយាកាស។ ផ្នែកនេះសន្មតថាអ្នកបានកំណត់ `azurerm_linux_web_app.web`; ការរកសេវាកម្មនៅតែតម្រូវឲ្យមានឈ្មោះធនធានឬស្លាសះ `azd-service-name` ត្រូវគ្នា:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **សំខាន់:** azd ប្រើស្លា `azd-env-name` និង output `AZURE_*` ដើម្បីតាមដានធនធាននីមួយៗក្នុងបរិយាកាស។ តែងតែស្លាកក្រុមធនធានរបស់អ្នកជាមួយ `"azd-env-name" = var.environment_name` ដើម្បីឲ្យ `azd down` អាចស្វែងរកនិងដកហូតអ្វីៗបាន។

### ចាក់ដំណើរការជាមួយ Terraform

ពាក្យបញ្ជាជាក់ស្តែងដូច Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **លក្ខខណ្ឌមុន:** ត្រូវតែលំអៀង Terraform និងនៅលើ `PATH` របស់អ្នក។ azd គ្រប់គ្រង *workflow* របស់ Terraform ប៉ុន្តាមិនដំឡើង Terraform សម្រាប់អ្នកទេ។ សម្រាប់ស្ថានភាព azd មិនកំណត់ស្ថានភាពក្នុងមូលដ្ឋាន; សម្រាប់ក្រុម ត្រូវកំណត់ backend ចម្ងាយ (ឧទាហរណ៍ Azure Storage backend) ក្នុង `provider.tf`។

សម្រាប់អ្នកចាប់ផ្តើមដែលមាន Terraform ពេញលេញ និងអាចអនុវត្តបាន សូមរុករកក្នុង [Awesome AZD gallery](https://azure.github.io/awesome-azd/) ហើយតម្រៀបតាម Terraform ឬមើលឯកសារ [azd Terraform ផ្លូវការ](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd)។

## 🧩 ឧបករណ៍ហេដ្ឋារចនាសម្ព័ន្ធផ្សេងទៀត

Pulumi មិនមែនជាអ្នកផ្គត់ផ្គង់ដែលដាក់បញ្ចូលរួចក្នុង azd 1.37.2 ទេ។ ការកំណត់ `infra.provider: pulumi` តែមួយនេះ មិនបង្កើតការតភ្ជាប់ធ្វើការបាន និង `azd env new` មិនបង្កើត/ជ្រើស stack Pulumi ដោយស្វ័យប្រវត្តិ។ ប្រើឧបករណ៍ IaC ផ្សេង សូមអនុវត្ដតាមឯកសារអ្នកផ្លាសំណាកដែលបានផ្ទៀងផ្ទាត់ឬគ្រប់គ្រងជីវិតវាជាក់លាក់ក្នុង workflow របស់អ្នកផ្ទាល់។ មហាសាលានេះមិនផ្គត់ផ្គង់ឬផ្ទៀងផ្ទាត់អ្នកផ្គត់ផ្គង់ Pulumi ទេ។

## 🎯 ការជ្រើសរើសម៉ាស៊ីនបម្រើសម្រាប់សេវាកម្មរបស់អ្នក

វាល `host` ក្នុង `azure.yaml` សម្រេចកន្លែងដែលកូដរបស់អ្នករត់។ azd គាំទ្រម៉ាស៊ីនបម្រើជាច្រើន—ការជ្រើសរើសត្រឹមត្រូវសំខាន់ជាងភាសាហេដ្ឋារចនាសម្ព័ន្ធ។ នេះជាការប្រែប្រាស់ងាយស្រួលសម្រាប់អ្នកចាប់ផ្តើម៖

| តម្លៃ `host` | សមស្របសម្រាប់ | ហេតុផល |
|--------------|----------|-----|
| `appservice` | កម្មវិធីវេបបែបបុរាណ និង API | PaaS ងាយស្រួលបំផុត; មិនចាំបាច់មាន containers |
| `staticwebapp` | Front-end SPA (React, Vue, Angular) | CDN អន្តរជាតិ + SSL ឥតគិតថ្លៃ, មានការគាំទ្រ API ដោយស្ថិតក្នុង |
| `function` | ធ្វើការដោយសារព្រឹត្តិការណ៍ និង serverless workloads | ពង្រីកទៅសូន្យ, បង់លើការប្រតិបត្តិ |
| `containerapp` | សេវាមីក្រូដែលមាន container | កុងតឺន័រសេរប្រាប់, ពង្រីកទៅសូន្យ, មាន ingress ដោយស្ថិតក្នុង |
| `aks` | តម្រូវការជាច្រើនសម្រាប់ការគ្រប់គ្រង | គ្រប់គ្រង Kubernetes ពេញលេញនៅពេលដែលអ្នកត្រូវការពិតប្រាកដ |
| `springapp` | ការដាក់ប្រើ Azure Spring Apps មានស្រាប់ | គោលដៅបុរាណ; សេវាកម្មនឹងបញ្ឈប់នៅថ្ងៃទី ៣១ មីនា ២០២៨ ហើយបិទចូលរួមឱ្យអតិថិជនថ្មី |

### ពេលណាដើម្បីប្រើ AKS

**Azure Kubernetes Service (`host: aks`)** ផ្តល់ឱ្យអ្នកនូវថាមពលពេញលេញនៃ Kubernetes—កុងត្រូលឡែអ៊ែរ បណ្ដាញសេវា មេស និង ការកំណត់ពេលវេលាឯកភាព។ ថាមពលនេះមានការគ្រប់គ្រងបន្ថែម៖ អ្នកគ្រប់គ្រង Node pools, ការអាប់ដេត និងបណ្ដាញក្រុម។

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **ចាប់ផ្តើមដោយសាមញ្ញប្រសិនបើអាចបាន។** សម្រាប់សេវាមីក្រូភាគច្រើន, **Container Apps** ផ្តល់ឱ្យអ្នក container, ការបញ្ជាក់ឡើងវិញដោយស្វ័យប្រវត្តិ និង ពង្រីកទៅសូន្យដោយគ្មានការគ្រប់គ្រងក្រុម។ ជ្រើស AKS តែពេលអ្នកត្រូវការមុខងារ Kubernetes ជាក់លាក់។

### ពេលណាដើម្បីប្រើ Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** ជាបរិស្ថាន runtime ដែលគ្រប់គ្រងសម្រាប់ Spring Boot។ វាកាន់កាប់ការស្វែងរកសេវា, កម្មវិធីកំណត់រៀបចំ និងការដាក់ចេញស្បៀងបៃតង-ខៀវដូច្នេះក្រុម Java មិនចាំបាច់រត់ហ្គេណេរត្រូវគ្នា។

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> កុំជ្រើស Azure Spring Apps សម្រាប់គម្រោងថ្មីអ្នកចាប់ផ្តើម៖ វាបិទចូលរួមសម្រាប់អតិថិជនថ្មី និង [នឹងបញ្ឈប់នៅថ្ងៃទី ៣១ មីនា ២០២៨](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement)។ ជ្រើសវិធីជំនួសដែលគាំទ្រ ដូចជា Container Apps ហើយប្លង់ផែនការផ្ទេរសម្រាប់ការដាក់ប្រើមានស្រាប់។

## 🗃️ ការផ្គត់ផ្គង់មូលដ្ឋានទិន្នន័យ

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
**លក្ខខណ្ឌមុនផ្នែក:** ប្រកាស `@secure() param databasePassword string` និងប្រើតម្លៃមានខ្លាំង។ ជ្រើសការចូលប្រើសាធារណៈ **ឬ** សមាសភាពបណ្ដាញផ្នែកខាងក្រោមរួមបញ្ចូល subnet / DNS ខ្ទង់ឯកជន; ស្នេញទាំងពីរនេះមិនភ្ជាប់គ្នាដោយស្វ័យប្រវត្តិទេ។

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

ច្បាប់ `0.0.0.0` អនុញ្ញាតឱ្យមានការតភ្ជាប់ពីសេវាកម្ម Azure ដែលនៅក្រៅសំណើររបស់អ្នក។ វាមានមិនមែនបណ្ដាញឯកជនទេ; សូមជ្រើសរចនាបណ្ដាញមានកំណត់សម្រាប់ការ​ធ្វើការ​ពិតប្រាកដ។

## 🔒 សុវត្ថិភាព និងការគ្រប់គ្រងជាសារសំងាត់

### ការរួមបញ្ចូល Key Vault
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

### ការកំណត់ Managed Identity
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

សម្រាប់អត្តសញ្ញាណដែលចាត់ចែងដោយប្រព័ន្ធ កុំកំណត់ `AZURE_CLIENT_ID` ទៅ ID គោលរបស់វា។ អត្តសញ្ញាណដែលចាត់ចែងដោយអ្នកប្រើ ប្រើ **client ID** មិនមែន object / principal ID ទេ។ ការបញ្ជាក់ Key Vault ក៏ត្រូវការតួនាទីក្រឡាព្រលឹងនៃអត្តសញ្ញាណកម្មវិធី និងការចូលប្រើបណ្ដាញផងដែរ។

## 🌍 បណ្ដាញ និងការតភ្ជាប់

### ការកំណត់បណ្ដាញ Virtual Network
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

### Application Gateway ជាមួយ SSL
**សំណុំបច្ចេកទេសមិនពេញលេញ មិនអាចដាក់ប្រើជាការប្រព្រឹត្ត gateway បាន:** បន្ថែម `gateway-subnet` មួយចំរូងទៅVNet រួមជាមួយ backend pools, HTTP settings, listeners, routing rules មានអាទិភាព និងវិញ្ញាបនបត្រ TLS (ឬការបញ្ជាក់ Key Vault ដែលមានអនុម័ត)។ បង្រិតផត ៤៤៣ តែប៉ុណ្ណោះមិនមែនលៃតម្រូវ HTTPS ទេ។

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

## 📊 ការតាមដាន និងការបង្កើតការយល់ដឹង

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

### គម្រប់ទិន្នន័យផ្ទាល់ខ្លួន និងការព្រមាន
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

## 🔧 ការកំណត់ជាក់លាក់ទៅបរិយាកាស

### ឯកសារពីរំពឹងបរិយាកាសផ្សេងៗ
ឯកសារ​ទាំងពីរខាងក្រោម​ជា **គំរូឯកសារ​អថេរ​ជំនួស**។ azd មិន​ជ្រើសរើស​ដោយស្វ័យប្រវត្តិ `main.parameters.dev.json` ឬ `main.parameters.prod.json` ទៅតាមឈ្មោះបរិស្ថានឡើយ។ ប្រើ `main.parameters.json` ពិតប្រាកដ​ជាមួយ​ការ​ជំនួស​បរិស្ថាន (ឧទាហរណ៍ `${APP_SERVICE_SKU=B1}`) ហើយប្រកាស/ប្រើប៉ារ៉ាម៉ែត្រ​នីមួយៗ​នៅក្នុង Bicep។

ខ្លឹមសារ​ឧទាហរណ៍​សម្រាប់ `infra/main.parameters.dev.json`៖

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

ខ្លឹមសារ​ឧទាហរណ៍​សម្រាប់ `infra/main.parameters.prod.json`៖

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

### ការផ្គត់ផ្គង់ធនធានមានលក្ខខណ្ឌ
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

## 🚀 លំនាំកម្រិតខ្ពស់នៃការផ្គត់ផ្គង់

### ការបង្ហោះក្នុងតំបន់​ច្រើន
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

### ការតេស្តរចនាសម្ព័ន្ធ
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

ការផ្គត់ផ្គង់រចនាសម្ព័ន្ធមិនបាន​ផ្ទុកកូដកម្មវិធីរបស់អ្នកទេ។ ប្រតិបត្តិការតេស្តកម្មវិធី​តែបន្ទាប់ពី `azd deploy`/`azd up` ហើយប្រើ `/health` តែបើកម្មវិធីរបស់អ្នកអនុវត្តវា។ ស្គ្រីបចាក់ផ្សាយ ARM បង្កើតធនធាន Azure ហើយត្រូវការរូបតំណាងបន្ថែម, ជំនាន់រត់បានគាំទ្រ និងសិទ្ធិ; វាមិនមែនជា​តេស្ត​ឯកត្ត​ទីកន្លែងទេ។

## 🧪 ការមើលមុននិងផ្ទៀងផ្ទាត់រចនាសម្ព័ន្ធ (ថ្មី)

### មើលមុនការផ្លាស់ប្តូររចនាសម្ព័ន្ធមុនការផ្ទុក

លក្ខណៈពិសេស `azd provision --preview` អនុញ្ញាតឱ្យអ្នក **សម្រង់ការផ្គត់ផ្គង់រចនាសម្ព័ន្ធ** មុនពេលបញ្ចេញធនធានពិតប្រាកដ។ វាទាយទាក់ទងដូចជា `terraform plan` ឬ `bicep what-if` ផ្តល់នូវ **មើលជាការសម្លឹងស្ងួត** នៃការផ្លាស់ប្តូរណាដែលនឹងធ្វើឡើងនៅក្នុងបរិស្ថាន Azure របស់អ្នក។

#### 🛠️ វាធ្វើអ្វី
- **វិភាគគំរូ IaC របស់អ្នក** (Bicep ឬ Terraform)
- **បង្ហាញមើលមុននៃការផ្លាស់ប្ដូរធនធាន**៖ ការបញ្ចូល, ការលះបង់, ការអាប់ដេត
- **មិនអនុវត្តការផ្លាស់ប្តូរទ្រព្យសម្បត្តិដែលអ្នកផ្គត់ផ្គង់បានផ្តល់អនុស្សរណៈ** — ពិនិត្យមើល hooks គម្រោងជាដំបូង; ស្គ្រីបអាចមានផលប៉ះពាល់គូរ និងការមើលជាមុននៅតែត្រូវការអាជ្ញាប័ណ្ណ Azure

#### ករណីការប្រើប្រាស់
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

ពាក្យបញ្ជានេះជួយអ្នក៖
- **ផ្ទៀងផ្ទាត់ការផ្លាស់ប្តូរទ្រព្យសម្បត្តិ** មុនពេលប្តូរប្រែវប្បធម៌
- **ចាប់យកកំហុសក្នុងការកំណត់រចនាសម្ព័ន្ធកាលពីដំបូង** ក្នុងវដ្តការអភិវឌ្ឍ
- **សហការយ៉ាងសុវត្ថិភាព** ក្នុងបរិយាកាសក្រុម
- **ធានាពិធីបញ្ចប់ដែលមានសិទ្ធិទាបបំផុត** ដោយគ្មានការភ្ញាក់ផ្អើល

វាមានប្រយោជន៍ជាពិសេសនៅពេល៖
- ការងារជាមួយបរិយាកាសសេវាកម្មច្រើនមានភាពស្មុគស្មាញ
- ការផ្លាស់ប្តូរគ្រប់គ្រងទ្រព្យសម្បត្តិបង្កើតផលិតកម្ម
- ផ្ទៀងផ្ទាត់ការផ្លាស់ប្តូររចនាសម្ព័ន្ធមុនការយល់ព្រម PR
- បណ្តុះបណ្តាលសមាជិកក្រុមថ្មីលើគំរូរចនាសម្ព័ន្ធ

### ឧទាហរណ៍លទ្ធផលមើលជាមុន
លទ្ធផលមើលជាមុនត្រឹមត្រូវខុសគ្នាតាមអ្នកផ្គត់ផ្គង់ និងរចនាសម្ព័ន្ធគម្រោង ប៉ុន្តែលទ្ធផលគួរតែបង្ហាញយ៉ាងច្បាស់ពីការផ្លាស់ប្តូរដែលបានផ្តល់អនុស្សរណៈមុនពេលអ្វីៗត្រូវបានអនុវត្ត។

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

## �🔄 ការអាប់ដេត និងការផ្លាស់ទីធនធាន

### ការអាប់ដេតធនធានដោយសុវត្ថិភាព
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

### ការផ្លាស់ទីទិន្នន័យមូលដ្ឋាន
**លំនាំស្គ្រីបបង្ហោះមិនទាន់ពេញលេញ:** តម្រូវឱ្យមានអត្តសញ្ញាណដែលបានបែងចែកដោយអ្នកប្រើដែលបានកំណត់រួចនៅកន្លែងត្រូវការ, runtime Azure CLI ដែលគាំទ្រ, ឧបករណ៍ផ្លាស់ទីមានទំនុក, ឯកសារផ្លាស់ទី/ការកំណត់រចនាសម្ព័ន្ធដែលបានផ្តល់ និងការតភ្ជាប់ទិន្នន័យមូលដ្ឋាន។ វាមិនអាចដំណើរការបានដោយផ្តិតបន្តិចធនធាននេះចូលទៅក្នុងប្លង់ទេ។

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

## 🎯 វិធីសាស្ត្រល្អបំផុត

### 1. គោលការណ៍នៃការកំណត់ឈ្មោះធនធាន
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. រម្លង់ការតាក់តែងស្លាក
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

### 3. ការផ្ទៀងផ្ទាត់ប៉ារ៉ាម៉ែត្រ
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

### 4. ការរៀបចំលទ្ធផលបញ្ចូល
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

## ជំហានបន្ទាប់

- [ការរៀបចំមុនការបង្ហោះ](../chapter-06-pre-deployment/capacity-planning.md) - ផ្ទៀងផ្ទាត់ភាពមានស្រាប់របស់ធនធាន
- [បញ្ហាធម្មតា](../chapter-07-troubleshooting/common-issues.md) - ដោះស្រាយបញ្ហាអាគាររចនា
- [មគ្គុទេសក៍ដំណោះស្រាយបញ្ហា](../chapter-07-troubleshooting/debugging.md) - ដោះស្រាយបញ្ហាការផ្គត់ផ្គង់
- [ការជ្រើសរើស SKU](../chapter-06-pre-deployment/sku-selection.md) - ជ្រើសរើសថ្នាក់សេវាកម្មដែលសមស្រប

## ឯកសារបន្ថែម

- [ឯកសារ Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [ទំព័រ Template Azure Resource Manager](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [មជ្ឈមណ្ឌលរចនាសម្ព័ន្ធ Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [ស៊ុមរចនាសម្ព័ន្ធល្អ Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigation**
- **មេរៀនមុន**: [មគ្គុទេសក៍ការតំឡើង](deployment-guide.md)
- **មេរៀនបន្ទាប់**: [ការធ្វើផែនការមានសមត្ថភាព](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->