# AZD দিয়ে Azure রিসোর্স প্রভিশনিং

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [শিখুন AZD ফর বিগিনার্স](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ৪ - ইনফ্রাস্ট্রাকচার অ্যাজ কোড & ডিপ্লয়মেন্ট
- **⬅️ পূর্ববর্তী**: [ডিপ্লয়মেন্ট গাইড](deployment-guide.md)
- **➡️ পরবর্তী অধ্যায়**: [অধ্যায় ৫: মাল্টি-এজেন্ট এআই সলিউশন](../../examples/retail-scenario.md)
- **🔧 সম্পর্কিত**: [অধ্যায় ৬: প্রি-ডিপ্লয়মেন্ট ভ্যালিডেশন](../chapter-06-pre-deployment/capacity-planning.md)

## পরিচিতি

এই গাইডটি Azure Developer CLI ব্যবহার করে Azure রিসোর্স প্রভিশনিং এবং ম্যানেজমেন্ট কভার করে, যার সাথে অন্তর্নির্মিত Bicep এবং Terraform প্রোভাইডার রয়েছে।

> `azd 1.37.2` এর বিরুদ্ধে পর্যালোচিত (নভেম্বর ২০২৬)। যদি অন্যথা উল্লেখ না করা হয়, তাহলে Bicep, Terraform, এবং স্ক্রিপ্ট উদাহরণগুলি **চিত্রনাট্যের টুকরো**, পূর্ণাঙ্গ টেমপ্লেট নয়। সেগুলোকে এমন একটি প্রকল্পে একত্রিত করুন যা উল্লেখিত প্যারামিটার, মডিউল, পরিচয়, নেটওয়ার্কিং, এবং অ্যাপ্লিকেশন কোড সরবরাহ করে। এই পর্যালোচনায় Azure প্রোভিশনিং কার্যকর করা হয়নি।

## শেখার লক্ষ্য

এই গাইডটি সম্পূর্ণ করার মাধ্যমে, আপনি:
- ইনফ্রাসট্রাকচার অ্যাজ কোড নীতিমালা এবং Azure রিসোর্স প্রোভিশনিং_master_ করবেন
- Azure Developer CLI দ্বারা সমর্থিত একাধিক IaC প্রদানকারী বুঝতে পারবেন
- সাধারণ অ্যাপ্লিকেশন আর্কিটেকচারের জন্য Bicep টেমপ্লেট ডিজাইন এবং বাস্তবায়ন করবেন
- রিসোর্স প্যারামিটার, ভেরিয়েবল এবং পরিবেশ-নির্দিষ্ট সেটিংস কনফিগার করবেন
- নেটওয়ার্কিং এবং সুরক্ষাসহ উন্নত ইনফ্রাসট্রাকচার প্যাটার্ন বাস্তবায়ন করবেন
- রিসোর্স লাইফসাইকেল, আপডেট এবং নির্ভরতা সমাধান পরিচালনা করবেন

## শেখার ফলাফল

সমাপ্তির পরে, আপনি সক্ষম হবেন:
- Bicep এবং ARM টেমপ্লেট ব্যবহার করে Azure অবকাঠামো ডিজাইন এবং প্রদান করা
- সঠিক রিসোর্স নির্ভরতার সাথে জটিল বহু-সার্ভিস স্থাপত্য কনফিগার করা
- একাধিক পরিবেশ এবং কনফিগারেশনের জন্য প্যারামিটারযুক্ত টেমপ্লেট বাস্তবায়ন করা
- অবকাঠামো প্রদান সমস্যাগুলি ডিবাগ করা এবং ডিপ্লয়মেন্ট ব্যর্থতা সমাধান করা
- অবকাঠামো ডিজাইনের জন্য Azure Well-Architected Framework নীতিগুলি প্রয়োগ করা
- অবকাঠামো আপডেট পরিচালনা করা এবং অবকাঠামো সংস্করণকরণ কৌশল বাস্তবায়ন করা

## অবকাঠামো প্রদান সংক্ষিপ্ত বিবরণ

Azure Developer CLI একাধিক Infrastructure as Code (IaC) প্রদানকারী সমর্থন করে:
- **Bicep** (প্রস্তাবিত) - Azure এর ডোমেন-স্পেসিফিক ভাষা
- **ARM Templates** - Bicep, ARM এ কম্পাইল করে; কাঁচা ARM JSON আলাদা বিল্ট-ইন নয় `infra.provider`
- **Terraform** - বহু-ক্লাউড অবকাঠামো সরঞ্জাম
- **Extension providers** - আলাদা ইনস্টল করা provider extension এবং এর ডকুমেন্টেড কনফিগারেশন প্রয়োজন; কোনো provider string সমর্থিত ধরা হয় না

## Azure রিসোর্স বুঝা

### রিসোর্স শ্রেণিবিন্যাস
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### অ্যাপ্লিকেশনগুলির জন্য সাধারণ Azure পরিষেবা
- **কম্পিউট**: অ্যাপ সার্ভিস, কন্টেইনার অ্যাপস, ফাংশনস, ভার্চুয়াল মেশিনস
- **স্টোরেজ**: স্টোরেজ অ্যাকাউন্ট, কোসমস ডিবি, SQL ডাটাবেস, পোস্টগ্রেসকিউএল
- **নেটওয়ার্কিং**: ভার্চুয়াল নেটওয়ার্ক, অ্যাপ্লিকেশন গেটওয়ে, CDN
- **সিকিউরিটি**: কী ভল্ট, অ্যাপ্লিকেশন ইনসাইটস, লগ অ্যানালিটিকস
- **AI/ML**: আজ়ুর AI সার্ভিসেস, আজ়ুর ওপেনAI, আজ়ুর মেশিন লার্নিং

## Bicep অবকাঠামো টেমপ্লেটসমূহ

### বেসিক Bicep টেমপ্লেট স্ট্রাকচার
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

সম্পূর্ণ azd প্রকল্পের জন্য, এই মডিউলটিকে একটি সাবস্ক্রিপশন-স্কোপড `infra/main.bicep` থেকে কল করুন যা একটি ট্যাগকৃত রিসোর্স গ্রুপ তৈরি করে এবং তার স্কোপ পাস করে। মিলান করুন `environmentName`/`location` কে `main.parameters.json`-এ। `azd-service-name: web` ট্যাগ রিসোর্সটিকে `services.web`-এর সাথে যুক্ত করে; কেবল্চেই এলোমেলো আউটপুট নাম দিয়ে সার্ভিস ডিসকভারি কনফিগার হয় না।

### উন্নত Bicep প্যাটার্নসমূহ

#### মডুলার অবকাঠামো
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

#### শর্তসাপেক্ষ রিসোর্স সৃষ্টি
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

## 🌐 azd এর সাথে Terraform ব্যবহার

Bicep হল azd এর ডিফল্ট, তবে azd **Terraform**-কেও সমর্থন করে — যদি আপনার দল ইতিমধ্যেই এটিতে মানদণ্ড নির্ধারণ করে বা আপনি মাল্টি-ক্লাউড অন্তর্গত অবকাঠামো পরিচালনা করেন তবে এটি উপযোগী। azd ওয়ার্কফ্লো (`azd up`, `azd provision`, `azd down`) একই রকম; কেবল অবকাঠামো ভাষা এবং ফোল্ডার বিন্যাস পরিবর্তিত হয়।

### azd কে Terraform ব্যবহারের নির্দেশ দিন

Terraform প্রদানকারী নির্দেশ করতে `infra` অংশটি `azure.yaml` তে যুক্ত করুন:

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

### Terraform ফোল্ডার বিন্যাস

Terraform প্রদানকারীর সাথে, আপনার `infra/` ফোল্ডার Bicep এর পরিবর্তে `.tf` ফাইল ব্যবহার করে:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### একটি `main.tf` অংশ

এটি কেবল একটি রিসোর্স গ্রুপ এবং পরিকল্পনা তৈরি করে, একটি ডিপ্লয়যোগ্য পরিষেবা নয়। আপনাকে ইনপুট ভেরিয়েবল, একটি সামঞ্জস্যপূর্ণ `azurerm` প্রদানকারী, ওয়েব অ্যাপ এবং তার পরিষেবা ট্যাগ/রিসোর্স-নাম ম্যাপিংও ঘোষণা করতে হবে।

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

### কিভাবে azd আপনার Terraform আউটপুট সংযোগ করে

azd Terraform **outputs** পরিবেশ মূল্যগুলিতে পড়ে। এই অংশটি ধরে নিচ্ছে আপনি `azurerm_linux_web_app.web` সংজ্ঞায়িত করেছেন; সার্ভিস ডিসকভারি এখনও একটি মিল থাকা রিসোর্স নাম বা `azd-service-name` ট্যাগ প্রয়োজন:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **গুরুত্বপূর্ণ:** azd প্রতিটি পরিবেশের জন্য রিসোর্স ট্র্যাক করার জন্য `azd-env-name` ট্যাগ এবং `AZURE_*` আউটপুট ব্যবহার করে। আপনার রিসোর্স গ্রুপ সর্বদা `"azd-env-name" = var.environment_name` দিয়ে ট্যাগ করুন যাতে `azd down` সবকিছু খুঁজে পেয়ে সরিয়ে দিতে পারে।

### Terraform দিয়ে ডিপ্লয় করুন

কমান্ডগুলি Bicep এর মতই:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **প্রয়োজনীয়তা:** Terraform ইনস্টল থাকতে হবে এবং আপনার `PATH`-এ থাকতে হবে। azd Terraform *workflow* পরিচালনা করে কিন্তু আপনার জন্য Terraform ইনস্টল করে না। স্টেটের জন্য, azd স্থানীয় স্টেট ডিফল্ট করে; দলের জন্য, একটি রিমোট ব্যাকএন্ড (উদাহরণস্বরূপ, একটি Azure Storage ব্যাকএন্ড) `provider.tf`-এ কনফিগার করুন।

সম্পূর্ণ, রানযোগ্য Terraform-ভিত্তিক স্টার্টারগুলির জন্য, [Awesome AZD গ্যালারি](https://azure.github.io/awesome-azd/) ব্রাউজ করুন এবং Terraform ফিল্টার করুন, অথবা অফিসিয়াল [azd Terraform ডকুমেন্টেশন](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd) দেখুন।

## 🧩 অন্যান্য অবকাঠামো সরঞ্জামসমূহ

Pulumi azd 1.37.2 তে বিল্ট-ইন প্রোভাইডার নয়। শুধুমাত্র `infra.provider: pulumi` সেট করা কাজের ইন্টিগ্রেশন প্রতিষ্ঠা করে না, এবং `azd env new` স্বয়ংক্রিয়ভাবে একটি Pulumi স্ট্যাক তৈরি/নির্বাচন করে না। আপনি যদি অন্য IaC টুল ব্যবহার করেন, যাচাইকৃত প্রোভাইডার এক্সটেনশনের ডকুমেন্টেশন অনুসরণ করুন অথবা আপনার নিজস্ব ওয়ার্কফ্লোতে এর লাইফসাইকেল স্পষ্টভাবে পরিচালনা করুন। এই কোর্সটি Pulumi প্রোভাইডার সরবরাহ করে না বা যাচাই করে না।

## 🎯 আপনার পরিষেবার জন্য একটি হোস্ট নির্বাচন করা

`host` ক্ষেত্রটি `azure.yaml` এ নির্ধারণ করে আপনার কোড কোথায় চলে। azd কয়েকটি হোস্ট সমর্থন করে—সঠিকটি বাছাই করা অবকাঠামো ভাষার চেয়ে আরও গুরুত্বপূর্ণ। এখানে একজন শিক্ষানবিশের জন্য তুলনামূলক বিবরণ:

| `host` মান | শ্রেষ্ঠ জন্য | কেন |
|--------------|----------|-----|
| `appservice` | প্রচলিত ওয়েব অ্যাপ এবং API | সবচেয়ে সহজ PaaS; কোন কন্টেইনার প্রয়োজন নয় |
| `staticwebapp` | ফ্রন্ট-এন্ড SPA (React, Vue, Angular) | গ্লোবাল CDN + বিনামূল্যে SSL, বিল্ট-ইন API সমর্থন |
| `function` | ইভেন্ট-চালিত এবং সার্ভারলেস ওয়ার্কলোড | শূন্য-মাত্রা স্কেল, প্রতি-নিষ্পাদন পেমেন্ট |
| `containerapp` | কন্টেইনারাইজড মাইক্রোসার্ভিস | সার্ভারলেস কন্টেইনার, শূন্য-মাত্রা স্কেল, বিল্ট-ইন ইনগ্রেস |
| `aks` | জটিল অর্কেস্ট্রেশন প্রয়োজন | প্রকৃত প্রয়োজন হলে সম্পূর্ণ Kubernetes নিয়ন্ত্রণ |
| `springapp` | বিদ্যমান Azure Spring Apps ডিপ্লয়মেন্ট | পুরোনো লক্ষ্য; পরিষেবাটি ৩১ মার্চ, ২০২৮ এ অবসর নিতে যাচ্ছে এবং নতুন গ্রাহকদের জন্য বন্ধ |

### কখন AKS এ পৌঁছাবেন

**Azure Kubernetes Service (`host: aks`)** আপনাকে কুবেরনেটিসের পূর্ণ শক্তি দেয়—কাস্টম কন্ট্রোলার, সার্ভিস মেশ, জটিল নেটওয়ার্কিং, এবং সূক্ষ্ম স্তরের সময়সূচী। সেই শক্তির সাথে অপারেশনাল ওভারহেড আসে: আপনি নোড পুল, আপগ্রেড এবং ক্লাস্টার নেটওয়ার্কিং পরিচালনা করেন।

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **যদি পারেন সহজে শুরু করুন।** অধিকাংশ মাইক্রোসার্ভিসের জন্য, **Container Apps** আপনাকে কন্টেইনার, অটোস্কেলিং, এবং স্কেল-টু-জিরো দেয় ক্লাস্টার ম্যানেজ না করেই। শুধুমাত্র তখনই AKS চয়ন করুন যখন আপনি কুবেরনেটিস-নির্দিষ্ট বৈশিষ্ট্য প্রয়োজন।

### কখন Azure Spring Apps ব্যবহার করবেন

**Azure Spring Apps (`host: springapp`)** একটি পরিচালিত রানটাইম যা বিশেষভাবে Spring Boot-এর জন্য তৈরি। এটি সার্ভিস ডিসকভারি, কনফিগারেশন সার্ভার, এবং ব্লু-গ্রিন ডেপ্লয়মেন্ট পরিচালনা করে যাতে জাভা টিমরা তাদের নিজস্ব অবকাঠামো চালাতে না হয়।

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> নতুন শিক্ষানবিশ প্রকল্পের জন্য Azure Spring Apps নির্বাচন করবেন না: এটি নতুন গ্রাহকদের জন্য বন্ধ এবং [31 মার্চ, 2028 তারিখে অবসর নিচ্ছে](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement)। সমর্থিত বিকল্প যেমন Container Apps পছন্দ করুন এবং বিদ্যমান ডেপ্লয়মেন্টের জন্য স্থানান্তরের পরিকল্পনা করুন।

## 🗃️ ডাটাবেস প্রোভিশনিং

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
**ফ্র্যাগমেন্টের পূর্বশর্ত:** `@secure() param databasePassword string` ঘোষণা করুন এবং একটি শক্তিশালী সরবরাহকৃত মান ব্যবহার করুন। পাবলিক অ্যাক্সেস **অথবা** নিম্নের প্রতিনিধিত্বকৃত সাবনেট/প্রাইভেট DNS একীভূত করুন; দুটি স্নিপেট স্বয়ংক্রিয়ভাবে একে অপরকে সংযুক্ত করে না।

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

`0.0.0.0` নিয়মটি আপনার নিজের সাবস্ক্রিপশনের বাইরের Azure পরিষেবাগুলির সংযোগের অনুমতি দেয়। এটি ব্যক্তিগত নেটওয়ার্কিং নয়; বাস্তব কাজের জন্য একটি সীমিত নেটওয়ার্ক নকশা বেছে নিন।

## 🔒 নিরাপত্তা এবং সিক্রেটস ব্যবস্থাপনা

### কী বল্ট ইন্টিগ্রেশন
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

### ম্যানেজড আইডেন্টিটি কনফিগারেশন
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

একটি সিস্টেম-অ্যাসাইনড আইডেন্টিটির জন্য, `AZURE_CLIENT_ID` সেট করবেন না তার প্রিন্সিপাল আইডিতে। একটি ইউজার-অ্যাসাইনড আইডেন্টিটি তার **ক্লায়েন্ট আইডি**, না যে অবজেক্ট/প্রিন্সিপাল আইডি। কী বল্ট রেফারেন্সের জন্য অ্যাপ আইডেন্টিটির ভল্ট রোল অ্যাসাইনমেন্ট এবং নেটওয়ার্ক অ্যাক্সেসও প্রয়োজন।

## 🌍 নেটওয়ার্কিং এবং সংযোগ

### ভার্চুয়াল নেটওয়ার্ক কনফিগারেশন
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

### SSL সহ অ্যাপ্লিকেশন গেটওয়ে
**অপূর্ণ আর্কিটেকচার ফ্র্যাগমেন্ট, যা স্থাপিত গেটওয়ে নয়:** একটি নিবেদিত `gateway-subnet` যুক্ত করুন VNet-এ প্লাস ব্যাকএন্ড পুল, HTTP সেটিংস, লিসনার, রাউটিং নিয়ম প্রাধান্যসহ, এবং একটি TLS সার্টিফিকেট (অথবা অনুমোদিত কী বল্ট রেফারেন্স)। শুধুমাত্র পোর্ট ৪৪৩ খোলা HTTPS কনফিগার করে না।

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

## 📊 পর্যবেক্ষণ এবং অবজার্ভেবিলিটি

### অ্যাপ্লিকেশন ইনসাইটস
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

### কাস্টম মেট্রিক্স এবং অ্যালার্ট
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

## 🔧 পরিবেশ-নির্দিষ্ট কনফিগারেশন

### বিভিন্ন পরিবেশের জন্য প্যারামিটার ফাইল
নীচের দুটি ফাইল **বিকল্প প্যারামিটার-ফাইল উদাহরণ**। azd স্বয়ংক্রিয়ভাবে পরিবেশের নামে `main.parameters.dev.json` বা `main.parameters.prod.json` নির্বাচন করে না। প্রকৃত `main.parameters.json` পরিবেশের স্থানধারকসহ ব্যবহার করুন (যেমন `${APP_SERVICE_SKU=B1}`), এবং প্রতিটি প্যারামিটার Bicep-এ ঘোষণা/ব্যবহার করুন।

`infra/main.parameters.dev.json` এর উদাহরণ বিষয়বস্তু:

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

`infra/main.parameters.prod.json` এর উদাহরণ বিষয়বস্তু:

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

### শর্তাধীন রিসোর্স প্রোভিশনিং
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

## 🚀 উন্নত প্রোভিশনিং প্যাটার্ন

### মাল্টি-রিজিয়ন ডেপ্লয়মেন্ট
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

### ইনফ্রাস্ট্রাকচার টেস্টিং
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

পরিকাঠামো প্রদান আপনার অ্যাপ্লিকেশন কোড বাস্তবায়ন করে না। শুধু `azd deploy`/`azd up` চালানোর পর অ্যাপ্লিকেশন পরীক্ষা চালান, এবং আপনার অ্যাপ এটি বাস্তবায়ন করলে মাত্র `/health` ব্যবহার করুন। ARM বাস্তবায়ন স্ক্রিপ্টগুলি Azure সম্পদ তৈরি করে এবং অতিরিক্ত পরিচয়, সমর্থিত রানটাইম সংস্করণ এবং অনুমতির প্রয়োজন; এগুলি স্থানীয় ইউনিট টেস্ট নয়।

## 🧪 পরিকাঠামো প্রিভিউ এবং ভ্যালিডেশন (নতুন)

### বাস্তবায়নের আগে পরিকাঠামো পরিবর্তন প্রিভিউ করুন

`azd provision --preview` ফিচারটি আপনাকে **পুনর্ব্যবহারযোগ্য পরিকাঠামো প্রভিশনিংয়ের সিমুলেশন** করতে দেয়, প্রকৃত সম্পদ বাস্তবায়নের আগে। এটি `terraform plan` বা `bicep what-if` এর অনুরূপ, যা আপনাকে একটি **ড্রাই-রান ভিউ** দেয় যে আপনার Azure পরিবেশে কি পরিবর্তন হবে।

#### 🛠️ এটি কী করে
- **আপনার IaC টেমপ্লেটগুলি বিশ্লেষণ করে** (Bicep বা Terraform)
- **সম্পদ পরিবর্তনের একটি প্রিভিউ দেখায়**: সংযোজন, মোছা, আপডেট
- **প্রোভাইডারের প্রস্তাবিত পরিকাঠামো পরিবর্তন প্রয়োগ করে না** — প্রথমে প্রজেক্ট হুক পরীক্ষা করুন; স্ক্রিপ্টগুলির পার্শ্বপ্রতিক্রিয়া থাকতে পারে এবং প্রিভিউ তবুও Azure অনুমতি প্রয়োজন

#### ব্যবহার কেস
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

এই কমান্ডটি আপনাকে সাহায্য করে:
- **পরিবর্তনগুলি নিশ্চিত করা** আগে সম্পদ চূড়ান্ত করার
- **অসঙ্গতি চিহ্নিত করা আগেই** উন্নয়ন চক্রের মধ্যে
- **টীম পরিবেশে সুরক্ষিত সহযোগিতা করা**
- **সর্বনিম্ন প্রিভিলেজ বাস্তবায়ন নিশ্চিত করা** বুক্কupunct

এটি বিশেষত উপকারী যখন:
- জটিল বহু-সেবা পরিবেশে কাজ করছেন
- প্রোডাকশন পরিকাঠামো পরিবর্তন করছেন
- PR অনুমোদনের আগে টেমপ্লেট পরিবর্তন যাচাই করছেন
- নতুন টীম সদস্যদের পরিকাঠামো প্যাটার্ন প্রশিক্ষিত করছেন

### উদাহরণ প্রিভিউ আউটপুট
সঠিক প্রিভিউ আউটপুট প্রোভাইডার এবং প্রজেক্ট গঠন অনুসারে আলাদা হতে পারে, তবে ফলাফল অবশ্য পরিষ্কারভাবে প্রস্তাবিত পরিবর্তনগুলি চিহ্নিত করবে প্রয়োগের আগে।

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

## 🔄 সম্পদ আপডেট এবং মাইগ্রেশন

### সুরক্ষিত সম্পদ আপডেট
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

### ডাটাবেস মাইগ্রেশন
**অসম্পূর্ণ ডিপ্লয়মেন্ট-স্ক্রিপ্ট প্যাটার্ন:** প্রয়োজন যেখানে কনফিগারকৃত ইউজার-অ্যাসাইনড পরিচয়, সমর্থিত Azure CLI রানটাইম, উপলব্ধ মাইগ্রেশন টুল, প্রদত্ত মাইগ্রেশন ডিরেক্টরি/কনফিগারেশন এবং ডাটাবেস সংযোগ। এটি শুধুমাত্র এই সম্পদটি টেমপ্লেটে পেস্ট করে চালানো যায় না।

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

## 🎯 সেরা অনুশীলনসমূহ

### ১. সম্পদ নামকরণ রূপনীতি
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### ২. ট্যাগিং কৌশল
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

### ৩. প্যারামিটার যাচাই
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

### ৪. আউটপুট সংগঠন
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

## পরবর্তী পদক্ষেপ

- [পূর্ব-বাস্তবায়ন পরিকল্পনা](../chapter-06-pre-deployment/capacity-planning.md) - সম্পদ উপলব্ধতা যাচাই
- [সাধারণ সমস্যা](../chapter-07-troubleshooting/common-issues.md) - পরিকাঠামোর সমস্যা নির্ণয়
- [ডিবাগিং গাইড](../chapter-07-troubleshooting/debugging.md) - প্রভিশনিং সমস্যাগুলো ডিবাগ করুন
- [SKU নির্বাচন](../chapter-06-pre-deployment/sku-selection.md) - উপযুক্ত সার্ভিস টিয়ার নির্বাচন করুন

## অতিরিক্ত সম্পদসমূহ

- [আজুর বিসেপ ডকুমেন্টেশন](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [আজুর রিসোর্স ম্যানেজার টেমপ্লেটসমূহ](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [আজুর আর্কিটেকচার সেন্টার](https://learn.microsoft.com/en-us/azure/architecture/)
- [আজুর ওয়েল-আর্কিটেকটেড ফ্রেমওয়ার্ক](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**নেভিগেশন**
- **পূর্ববর্তী পাঠ**: [ডিপ্লয়মেন্ট গাইড](deployment-guide.md)
- **পরবর্তী পাঠ**: [ক্যাপাসিটি প্ল্যানিং](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->