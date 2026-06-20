# ការផ្គត់ផ្គង់ធនធាន Azure ជាមួយ AZD

**ការកែចេញជំពូក:**
- **📚 ទំព័រដើមរបស់វគ្គ**: [AZD សម្រាប់អ្នកចាប់ផ្ដើម](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**: ជំពូក 4 - ហេដ្ឋារចនាសម្ព័ន្ធជា​កូដ និងការដាក់ពង្រីក
- **⬅️ មុនหน้า**: [មគ្គុទេសក៏ការដាក់ពង្រីក](deployment-guide.md)
- **➡️ ជំពូកបន្ទាប់**: [ជំពូក 5: ដំណោះស្រាយ AI ពហុភ្នាក់ងារ](../../examples/retail-scenario.md)
- **🔧 ទាក់ទង**: [ជំពូក 6: ការផ្ទៀងផ្ទាត់​មុនការដាក់ពង្រីក](../chapter-06-pre-deployment/capacity-planning.md)

## ការណែនាំ

មគ្គុទេសក៏ទូលំទូលាយនេះគ្របដណ្តប់លើអ្វីគ្រប់យ៉ាងដែលអ្នកត្រូវដឹងអំពីការផ្គត់ផ្គង់ និងគ្រប់គ្រងធនធាន Azure ប្រើ Azure Developer CLI។ រៀនអនុវត្តលំនាំ Infrastructure as Code (IaC) ចាប់ពីការបង្កើតធនធានមូលដ្ឋាន ដល់ស្ថាបត្យកម្មហេដ្ឋារចនាសម្ព័ន្ធកម្រិតសហគ្រាសរីកចម្រើនដោយប្រើ Bicep, ARM templates, Terraform, និង Pulumi។

## គោលបំណងសិក្សា

ដោយបញ្ចប់មគ្គុទេសក៏នេះ អ្នកនឹង:
- ជំនាញលើគោលការណ៍ Infrastructure as Code និងការផ្គត់ផ្គង់ធនធាន Azure
- យល់ដឹងពីអ្នកផ្គត់ផ្គង់ IaC ច្រើនដែល Azure Developer CLI គាំទ្រ
- រចនា និងអនុវត្តគំរូ Bicep សម្រាប់ស្ថាបត្យកម្មកម្មវិធីទូទៅ
- កំណត់ប៉ារ៉ាម៉ែត្រ វ៉ារីអាប្ល និងការកំណត់ជាក់លាក់សម្រាប់បរិដ្ឋាន
- អនុវត្តលំនាំហេដ្ឋារចនាសម្ព័ន្ធខ្ពស់ រួមទាំងបណ្តាញ និងសុវត្ថិភាព
- គ្រប់គ្រងជីវចរណ៍ធនធាន ការអាប់ដេត និងការដោះស្រាយផ្ទះស្ដាំអាស្រ័យភាព

## លទ្ធផលសិក្សា

បន្ទាប់ពីបញ្ចប់ អ្នកអាច:
- រចនា និងផ្គត់ផ្គង់ហេដ្ឋារចនាសម្ព័ន្ធ Azure ប្រើ Bicep និង ARM templates
- កំណត់ស្ថាបត្យកម្មបម្រើជាច្រើនដោយមានអាស្រ័យភាពធនធានត្រឹមត្រូវ
- អនុវត្តគំរូដែលមានប៉ារ៉ាម៉ែត្រ សម្រាប់បរិដ្ឋាន និងការកំណត់ច្រើន
- ដោះស្រាយបញ្ហាក្នុងការផ្គត់ផ្គង់ហេដ្ឋារចនាសម្ព័ន្ធ និងដោះស្រាយការបរាជ័យនៃការដាក់ពង្រីក
- អនុវត្តគោលការណ៍ Azure Well-Architected Framework លើការរចនា
- គ្រប់គ្រងការអាប់ដេតហេដ្ឋារចនាសម្ព័ន្ធ និងអនុវត្តយុទ្ធសាស្ត្រកំណត់កំណែហេដ្ឋារ

## រូបមន្តទូទៅសម្រាប់ការផ្គត់ផ្គង់ហេដ្ឋារចនាសម្ព័ន្ធ

Azure Developer CLI គាំទ្រអ្នកផ្គត់ផ្គង់ Infrastructure as Code (IaC) ច្រើន៖
- **Bicep** (ដែលបានណែនាំ) - ភាសាផ្នែកឯងរបស់ Azure
- **ARM Templates** - គំរូ Azure Resource Manager ដែលមានមូលដ្ឋានជា JSON
- **Terraform** - ឧបករណ៍ហេដ្ឋារចនាសម្ព័ន្ធ​សម្រាប់ multi-cloud
- **Pulumi** - ហេដ្ឋារចនាសម្ព័ន្ធជា​កូដសម័យទំនើបប្រើភាសាកម្មវិធី

## ការយល់ដឹងអំពីធនធាន Azure

### លំដាប់រៀងរាល់ធនធាន
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### សេវាកម្ម Azure ពេញនិយមសម្រាប់កម្មវិធី
- **Compute**: App Service, Container Apps, Functions, Virtual Machines
- **Storage**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Networking**: Virtual Network, Application Gateway, CDN
- **Security**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## គំរូហេដ្ឋារចនាសម្ព័ន្ធជា Bicep

### រចនាសម្ព័ន្ធគំរូ Bicep មូលដ្ឋាន
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

### លំនាំ Bicep ខ្ពស់

#### ហេដ្ឋារចនាសម្ព័ន្ធចែកជាផ្នែក
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

#### ការបង្កើតធនធានដោយលក្ខខណ្ឌ
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

## 🌐 ការប្រើប្រាស់ Terraform ជាមួយ azd

Bicep គឺជាធរមានលំនាំលំនាំលំនាំដើមសម្រាប់ azd ប៉ុន្តែ azd ក៏គាំទ្រ **Terraform** ផងដែរ — មានប្រយោជន៍ប្រសិនបើក្រុមរបស់អ្នកចាប់ផ្តើមប្រើវាដែលបានស្តង់ដាឬអ្នកគ្រប់គ្រងហេដ្ឋារចនាសម្ព័ន្ធច្រើនពពក។ លំនាំ azd (`azd up`, `azd provision`, `azd down`) ដូចគ្នា មួយតែភាសាហេដ្ឋារចនាសម្ព័ន្ធ និងរចនាសម្ព័ន្ធថតបញ្ជៀសបម្រាស់ប្ដូរ។

### ប្រាប់ azd ឱ្យប្រើ Terraform

បន្ថែមផ្នែក `infra` ទៅក្នុង `azure.yaml` ដែលបង្ហាញទៅកាន់អ្នកផ្គត់ផ្គង់ Terraform:

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

### រចនាសម្ព័ន្ធថត Terraform

ជាមួយអ្នកផ្គត់ផ្គង់ Terraform,ថត `infra/` របស់អ្នកប្រើឯកសារ `.tf` ជំនួស Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### ឧបករណ៍តិចតួច `main.tf`

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

### របៀប azd តភ្ជាប់ទៅនឹង Terraform outputs របស់អ្នក

azd អាន Terraform **លទ្ធផល** ដើម្បីរៀនអំពីចំណុចចេញ(Endpoints) និងដាក់តម្លៃបរិដ្ឋានត្រឡប់ទៅក្នុងកម្មវិធីរបស់អ្នក។ ឈ្មោះលទ្ធផលសំខាន់ — azd ស្វែងរកឈ្មោះពិសេសខ្លះៗ៖

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **សំខាន់៖** azd ប្រើ tag `azd-env-name` និង `AZURE_*` outputs ដើម្បីតាមដានធនធានតាមបរិស្ថាន។ តែងតែ tag ក្រុមធនធានរបស់អ្នក ជាមួយ `"azd-env-name" = var.environment_name` ដូច្នេះ `azd down` អាចស្វែងរក និងលុបអ្វីគ្រប់យ៉ាង។

### ដាក់ពង្រីកជាមួយ Terraform

ពាក្យបញ្ជាដូចគ្នានឹង Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd រត់ 'terraform plan' នៅเบื้องក្រោយ
azd up                    # រៀបចំ + ដាក់ប្រតិបត្តិ
azd down --force          # លុបធនធានដែលបានគ្រប់គ្រងដោយ Terraform
```

> **លក្ខខណ្ឌមុនការ​ចាប់ផ្តើម៖** ត្រូវតែដំឡើង Terraform និងមាននៅលើ `PATH` របស់អ្នក។ azd គ្រប់គ្រង *workflows* របស់ Terraform ប៉ុន្តែមិនដំឡើង Terraform ឲ្យអ្នកទេ។ សម្រាប់ស្ថានភាព (state), azd កំណត់តម្លៃលំនាំដើមទៅ state ពីកុំព្យូទ័រមូលដ្ឋាន; សម្រាប់ក្រុម, កំណត់ backend ទៅ remote (ឧ. Azure Storage backend) ក្នុង `provider.tf`។

សម្រាប់ starters អាចរត់បានពេញលេញដោយផ្អែកលើ Terraform, ស្វែងរកក្នុង [Awesome AZD gallery](https://azure.github.io/awesome-azd/) ហើយតម្រៀបសម្រាប់ Terraform, ឬមើល [ឯកសារ azd Terraform ផ្លូវការនៅលើ Microsoft Learn](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd)។

## 🧩 ការប្រើ Pulumi ជាមួយ azd

បើក្រុមរបស់អ្នកសរសេរ ហេដ្ឋារចនាសម្ព័ន្ធជា​ភាសាទូទៅ (TypeScript, Python, Go, ឬ C#) មិនមែន DSL, azd ក៏គាំទ្រ **Pulumi** ផងដែរ។ ដូចជាមួយ Terraform, លំនាំ `azd up` / `azd provision` / `azd down` មិនផ្លាស់ប្ដូរ — តែឧបករណ៍ហេដ្ឋារចនាសម្ព័ន្ធ និងរចនាសម្ព័ន្ធថតផ្លាស់ប្ដូរ។

### ប្រាប់ azd ឱ្យប្រើ Pulumi

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

### រចនាសម្ព័ន្ធថត Pulumi

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### ឯកសារ `index.ts` តិចតួច

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// ស្លាករាល់ធនធាន ដើម្បីឲ្យ azd អាចតាមដាន និងលុបចោលពួកវា
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd អានលទ្ធផលទាំងនេះ ហើយដាក់ចូលទៅក្នុងបរិស្ថានរបស់អ្នក
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### Stacks ត្រូវផ្គូផ្គងទៅបរិដ្ឋាន azd

Pulumi រៀបចំការដាក់ពង្រីកជាមួយ **stacks**, ហើយ azd ផ្គូផ្គងបរិដ្ឋាន azd ទៅ Pulumi stack ដែលមានឈ្មោះដូចគ្នា។ នៅពេលអ្នករត់ `azd env new staging`, azd ជ្រើស (ឬបង្កើត) Pulumi stack ឈ្មោះ `staging`។ នីតិវិធីសញ្ញា `azd-env-name` និងច្បាប់ `AZURE_*` outputs ដូចគ្នា ដូច្នេះ `azd down` អាចស្វែងរក និងលុបអ្វីគ្រប់យ៉ាង។

### ដាក់ពង្រីកជាមួយ Pulumi

```bash
azd auth login
azd env new dev
azd provision --preview   # azd រត់ 'pulumi preview' នៅខាងក្រោយ
azd up                    # បង្កើតធនធាន + ដាក់ឡើង
azd down --force          # រត់ 'pulumi destroy'
```

> **លក្ខខណ្ឌមុនការ​ចាប់ផ្តើម៖** ត្រូវតែដំឡើង Pulumi និងមាននៅលើ `PATH` របស់អ្នក, ហើយអ្នកនឹងត្រូវការត្រកូល state (Pulumi Cloud ឬ backend ដែលគ្រប់គ្រងដោយខ្លួនឯង ដូចជា Azure Blob Storage)។ azd គ្រប់គ្រង *workflow* របស់ Pulumi មិនមែនដំឡើងឲ្យទេ។ មើល [ឯកសារ azd Pulumi ផ្លូវការ](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd) សម្រាប់ព័ត៌មានលម្អិត។

## 🎯 ការជ្រើសរើសម៉ាស៊ីនផ្តល់សេវាសម្រាប់សេវាកម្មរបស់អ្នក

វាល `host` ក្នុង `azure.yaml` កំណត់ថា កូដរបស់អ្នករត់នៅកន្លែងណា។ azd គាំទ្រម៉ាស៊ីនផ្តល់សេវាច្រើន — ជ្រើសយកអ្វីដែលត្រូវតែមានសារៈសំខាន់ជាងភាសាហេដ្ឋារចនាសម្ព័ន្ធ។ ទីនេះជាការប្រៀបធៀបសម្រាប់អ្នកចាប់ផ្ដើម៖

| `host` value | ល្អសម្រាប់ | ហេតុផល |
|--------------|----------|-----|
| `appservice` | វេបកម្មវិធី និង API ប្រពៃណី | PaaS ងាយស្រួលបំផុត; មិនចាំបាច់មានកុងតឺន័រ |
| `staticwebapp` | ផ្នែកមុខ SPA (React, Vue, Angular) | CDN ខ្នាតពិភពលោក + SSL ឥតគិតថ្លៃ, មានការគាំទ្រ API នៅក្នុង |
| `function` | ការងារ event-driven និង serverless | អាច scale ដល់សូន្យ, បង់តាមការប្រតិបត្តិការ |
| `containerapp` | មីក្រូសេវាកម្មប្រើកុងតឺន័រ | កុងតឺន័រ serverless, អាច scale ដល់សូន្យ, មាន ingress នៅក្នុង |
| `aks` | តម្រូវការគ្រប់គ្រងស្មុគស្មាញ | ការគ្រប់គ្រង Kubernetes ពេញលេញនៅពេលដែលអ្នកត្រូវការពិត |
| `springapp` | កម្មវិធី Java Spring Boot | runtime Azure Spring Apps ដែលគ្រប់គ្រង និងចំណោមសម្រាប់ Spring |

### ពេលណាគួរប្រើ AKS

**Azure Kubernetes Service (`host: aks`)** ផ្តល់អំណាចពេញលេញនៃ Kubernetes — គ្រប់គ្រង controllers ពិសេស, service meshes, បណ្តាញស្មុគស្មាញ, និងកាលវិភាគលម្អិត។ អំណាចនេះមកជាមួយថ្នាក់ប្រតិបត្តិការ: អ្នកត្រូវគ្រប់គ្រង node pools, ធ្វើអាប់ដេត, និងបណ្តាញក្លាស្ទើ។

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **ចាប់ផ្តើមអោយសាមញ្ញបើអាចបាន។** សម្រាប់មីក្រូសេវាកម្មភាគច្រើន, **Container Apps** ផ្តល់ឱ្យអ្នកនូវកុងតឺន័រ, ការធ្វើ autoscale, និងការទៅដល់ scale-to-zero ដោយមិនចាំបាច់គ្រប់គ្រង cluster។ ជ្រើស AKS តែពេលដែលអ្នកត្រូវការមុខងារ​ពិសេសរបស់ Kubernetes។

### ពេលណាគួរប្រើ Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** គឺជា runtime ដែលគ្រប់គ្រង សម្រាប់ Spring Boot។ វាធ្វើការគ្រប់គ្រង service discovery, config server, និង blue-green deployment ដើម្បីឲ្យក្រុម Java មិនចាំបាច់រៀបចំហេដ្ឋារចនាសម្ព័ន្ធផ្ទាល់។

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> ប្រើ `springapp` ពេលដែលអ្នកមានកម្មវិធី Spring Boot មានស្រាប់ និងចង់បាន runtime ដែលត្រូវបានគ្រប់គ្រងសម្រាប់ពួកវា។ សម្រាប់កម្មវិធី Java កុងតឺន័រថ្មីៗដែលមិនមានតម្រូវការ Spring ជាក់លាក់, `containerapp` ជាជម្រើសសាមញ្ញជាង។

## 🗃️ ការផ្គត់ផ្គង់Database

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

## 🔒 សុវត្ថិភាព និងការគ្រប់គ្រងអាថ៌កំបាំង

### ការតភ្ជាប់ Key Vault
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
          name: 'AZURE_CLIENT_ID'
          value: webApp.identity.principalId
        }
      ]
    }
  }
}
```

## 🌍 បណ្តាញ និងការតភ្ជាប់

### ការកំណត់ Virtual Network
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

## 📊 ការត្រួតពិនិត្យ និងភាពអាចសង្កេតបាន

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

### ម៉ាទ្រីច និងការហៅដំណឹងផ្ទាល់ខ្លួន
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

## 🔧 ការកំណត់ជាក់លាក់សម្រាប់បរិដ្ឋាន

### ឯកសារប៉ារ៉ាម៉ែត្រ​សម្រាប់បរិដ្ឋានផ្សេងៗ
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

### ការផ្គត់ផ្គង់ធនធានដោយលក្ខខណ្ឌ
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

## 🚀 លំនាំផ្គត់ផ្គង់ខ្ពស់

### ការដាក់ពង្រីកច្រើនតំបន់
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

### ការធ្វើតេស្តហេដ្ឋារចនាសម្ព័ន្ធ
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

## 🧪 មើលមុន និងផ្ទៀងផ្ទាត់ហេដ្ឋារចនាសម្ព័ន្ធ (NEW)

### មើលមុនការផ្លាស់ប្ដូរហេដ្ឋារចនាសម្ព័ន្ធ មុនការដាក់ពង្រីក

មុខងារ `azd provision --preview` ឲ្យអ្នក **ចាក់ស្ទង់ការផ្គត់ផ្គង់ហេដ្ឋារចនាសម្ព័ន្ធ** មុនពេលពិតជាធ្វើការ​ដាក់ពង្រីកធនធាន។ វាស្រដៀងគ្នានឹង `terraform plan` ឬ `bicep what-if`, ផ្តល់ឱ្យអ្នកនូវ **ទិដ្ឋភាព dry-run** នៃអ្វីដែលនឹងផ្លាស់ប្ដូរទៅបរិដ្ឋាន Azure របស់អ្នក។

#### 🛠️ វាធ្វើអ្វីខ្លះ
- **វិភាគគំរូ IaC របស់អ្នក** (Bicep ឬ Terraform)
- **បង្ហាញការមើលមុននៃការផ្លាស់ប្ដូរ​ធនធាន**: ការបន្ថែម, ការលុប, ការអាប់ដេត
- **មិនអនុវត្តការផ្លាស់ប្ដូរ** — វាស៊ើបអានទេ ហើយមានសុវត្ថិភាពក្នុងការប្រើ

#### ករណីប្រើប្រាស់
```bash
# ពិនិត្យមើលការផ្លាស់ប្តូរហេដ្ឋារចនាសម្ព័ន្ធ មុនការដាក់ឲ្យដំណើរការ
azd provision --preview

# ពិនិត្យមើលសម្រាប់បរិយាកាសជាក់លាក់
azd provision --preview -e production
```

មែនទែន ពាក្យបញ្ជានេះជួយអ្នក:
- **ផ្ទៀងផ្ទាត់ការផ្លាស់ប្ដូរហេដ្ឋារចនាសម្ព័ន្ធ** មុនពេលប្តូរធនធាន
- **ចាប់កំហុសកំណត់មិនត្រឹមត្រូវពីដំបូង** ក្នុងវដ្តអភិវឌ្ឍន៍
- **សហការយ៉ាងសុវត្ថិភាព** ក្នុងបរិយាកាសក្រុម
- **ធានាការដាក់ពង្រីកដោយតិចតួចសិទ្ធិ** ដោយគ្មានឱកាសឆក់កំហុស

វាមានប្រយោជន៍ពិសេសពេល:
- កំពុងធ្វើការជាមួយបរិដ្ឋានដែលមានសេវាច្រើនហើយស្មុគស្មាញ
- កំពុងធ្វើបម្លាស់ប្ដូរនៅលើហេដ្ឋារចនាសម្ព័ន្ធផលិតកម្ម
- ផ្ទៀងផ្ទាត់ការកែសម្រួលគំរូមុនការអនុម័ត PR
- បណ្តុះបណ្តាលសមាជិកក្រុមថ្មីលើលំនាំហេដ្ឋារចនាសម្ព័ន្ធ

### ឧទាហរណ៍លទ្ធផលមើលមុន
លទ្ធផលមើលមុនពាក់ព័ន្ធអាចផ្លាស់ប្ដូរតាមអ្នកផ្គត់ផ្គង់ និងរចនាសម្ព័ន្ធគម្រោង ប៉ុន្តាលទ្ធផលគួរតែបង្ហាញយ៉ាងច្បាស់ពីការផ្លាស់ប្ដូរដែលបានស្នើមុនពេលអ្វីៗត្រូវបានអនុវត្ត។

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

## 🔄 ការអាប់ដេតធនធាន និងការផ្លាស់ទី

### ការអាប់ដេតធនធានដែលមានសុវត្ថិភាព
```bash
# ពិនិត្យមើលការផ្លាស់ប្តូររចនាសម្ព័ន្ធជាលើកដំបូង (ណែនាំ)
azd provision --preview

# អនុវត្តការផ្លាស់ប្តូរបន្ទាប់ពីបានបញ្ជាក់ពីការពិនិត្យមើល
azd provision --confirm-with-no-prompt

# សម្រាប់ការបង្វិល (rollback) ប្រើ Git ដើម្បីត្រឡប់ការផ្លាស់ប្តូររចនាសម្ព័ន្ធ:
git revert HEAD  # ត្រឡប់ commit រចនាសម្ព័ន្ធចុងក្រោយ
azd provision    # អនុវត្តស្ថានភាពរចនាសម្ព័ន្ធមុន
```

### ការផ្លាស់ទីទិន្នន័យក្នុង Database
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

## 🎯 ការអនុវត្តល្អបំផុត

### 1. កិច្ចទំនាក់ទំនងនៃការកំណត់ឈ្មោះធនធាន
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. យុទ្ធសាស្ត្រទាក់ស្លាប់ Tagging
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

### 4. ការរៀបចំ Output
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

- [Pre-deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - ផ្ទៀងផ្ទាត់ភាពអាចមាននៃធនធាន
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - ដោះស្រាយបញ្ហាហេដ្ឋារចនាសម្ព័ន្ធ
- [Debugging Guide](../chapter-07-troubleshooting/debugging.md) - ដោះស្រាយបញ្ហាក្នុងការផ្គត់ផ្គង់
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - ជ្រើសរើសកម្រិតសេវាសមរម្យ

## ប្រភពបន្ថែម

- [Azure Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**ការជ្រើសរើសទិសដៅ**
- **មេរៀនមុន**: [មគ្គុទេសក៏ការដាក់ពង្រីក](deployment-guide.md)
- **មេរៀនបន្ទាប់**: [ការធៀងទំហំ (Capacity Planning)](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->