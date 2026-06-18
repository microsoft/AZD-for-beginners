# AZD দিয়ে Azure রিসোর্স প্রোভিশনিং

**Chapter Navigation:**
- **📚 কোর্স হোম**: [AZD নবীনদের জন্য](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ৪ - ইনফ্রাস্ট্রাকচার অ্যাজ কোড ও ডিপ্লয়মেন্ট
- **⬅️ পূর্ববর্তী**: [ডিপ্লয়মেন্ট গাইড](deployment-guide.md)
- **➡️ পরবর্তী অধ্যায়**: [অধ্যায় ৫: মাল্টি-এজেন্ট AI সলিউশন](../../examples/retail-scenario.md)
- **🔧 সম্পর্কিত**: [অধ্যায় ৬: প্রি-ডিপ্লয়মেন্ট ভ্যালিডেশন](../chapter-06-pre-deployment/capacity-planning.md)

## ভূমিকা

এই বিস্তৃত গাইডটি Azure Developer CLI ব্যবহার করে Azure রিসোর্স প্রোভিশনিং এবং ব্যবস্থাপনা সম্পর্কে আপনাকে যা যা জানা দরকার তা কভার করে। বেসিক রিসোর্স তৈরি থেকে শুরু করে Bicep, ARM টেমপ্লেটস, Terraform, এবং Pulumi ব্যবহার করে এন্টারপ্রাইজ-গ্রেড ইনফ্রাস্ট্রাকচার আর্কিটেকচার পর্যন্ত Infrastructure as Code (IaC) প্যাটার্ন বাস্তবায়ন শেখুন।

## শেখার লক্ষ্য

এই গাইড সম্পন্ন করে আপনি:
- Infrastructure as Code নীতিমালা এবং Azure রিসোর্স প্রোভিশনিং আয়ত্ত করবেন
- Azure Developer CLI দ্বারা সমর্থিত একাধিক IaC প্রদানকারীর বোঝাপড়া পাবেন
- সাধারণ অ্যাপ্লিকেশন আর্কিটেকচারের জন্য Bicep টেমপ্লেট ডিজাইন ও বাস্তবায়ন করবেন
- রিসোর্স প্যারামিটার, ভ্যারিয়েবল, এবং পরিবেশ-নির্দিষ্ট সেটিংস কনফিগার করবেন
- নেটওয়ার্কিং এবং সিকিউরিটি সহ উন্নত ইনফ্রাস্ট্রাকচার প্যাটার্ন বাস্তবায়ন করবেন
- রিসোর্স লাইফসাইকেল, আপডেট, এবং ডিপেন্ডেন্সি রেজলিউশন পরিচালনা করবেন

## শেখার ফলাফল

গাইডটি সম্পন্ন করার পরে, আপনি সক্ষম হবেন:
- Bicep এবং ARM টেমপ্লেট ব্যবহার করে Azure ইনফ্রাস্ট্রাকচার ডিজাইন এবং প্রোভিশন করতে
- সঠিক রিসোর্স ডিপেন্ডেন্সি সহ জটিল মাল্টি-সার্ভিস আর্কিটেকচার কনফিগার করতে
- বহু পরিবেশ এবং কনফিগারেশনের জন্য প্যারামিটারাইজড টেমপ্লেট বাস্তবায়ন করতে
- ইনফ্রাস্ট্রাকচার প্রোভিশনিং সমস্যাগুলি ট্রাবলশুট এবং ডিপ্লয়মেন্ট ব্যর্থতা সমাধান করতে
- ইনফ্রাস্ট্রাকচার ডিজাইনে Azure Well-Architected Framework নীতিমালা প্রয়োগ করতে
- ইনফ্রাস্ট্রাকচার আপডেট পরিচালনা এবং ইনফ্রাস্ট্রাকচার ভার্সনিং কৌশল বাস্তবায়ন করতে

## ইনফ্রাস্ট্রাকচার প্রোভিশনিং সারসংক্ষেপ

Azure Developer CLI একাধিক Infrastructure as Code (IaC) প্রদানকারী সমর্থন করে:
- **Bicep** (প্রস্তাব করা) - Azure-এর ডোমেইন-নির্দিষ্ট ভাষা
- **ARM Templates** - JSON-ভিত্তিক Azure Resource Manager টেমপ্লেটস
- **Terraform** - মাল্টি-ক্লাউড ইনফ্রাস্ট্রাকচার টুল
- **Pulumi** - প্রোগ্রামিং ভাষা ব্যবহার করে আধুনিক ইনফ্রাস্ট্রাকচার অ্যাজ কোড

## Azure রিসোর্স বোঝা

### রিসোর্স হায়ারারকি
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### অ্যাপ্লিকেশনের জন্য সাধারণ Azure সার্ভিসসমূহ
- **কম্পিউট**: App Service, Container Apps, Functions, Virtual Machines
- **স্টোরেজ**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **নেটওয়ার্কিং**: Virtual Network, Application Gateway, CDN
- **সিকিউরিটি**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep ইনফ্রাস্ট্রাকচার টেমপ্লেটস

### মৌলিক Bicep টেমপ্লেটের কাঠামো
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

### উন্নত Bicep প্যাটার্নসমূহ

#### মডুলার ইনফ্রাস্ট্রাকচার
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

#### শর্তসাপেক্ষ রিসোর্স তৈরি
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

## 🌐 azd-এর সাথে Terraform ব্যবহার

Bicep হলো azd-এর ডিফল্ট, কিন্তু azd **Terraform**-ও সাপোর্ট করে—যদি আপনার টিম ইতোমধ্যেই এটিকে স্ট্যান্ডার্ড করে থাকে বা আপনি মাল্টি-ক্লাউড ইনফ্রাস্ট্রাকচার ম্যানেজ করেন তাহলে এটি উপকারী। azd ওয়ার্কফ্লো (`azd up`, `azd provision`, `azd down`) একই রকম; কেবল ইনফ্রাস্ট্রাকচার ভাষা এবং ফোল্ডার বিন্যাস পরিবর্তিত হয়।

### azd-কে Terraform ব্যবহার করতে বলুন

Terraform প্রদানকারী নির্দেশ করতে `azure.yaml`-এ একটি `infra` সেকশন যোগ করুন:

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

Terraform প্রদানকারীর জন্য, আপনার `infra/` ফোল্ডার Bicep-এর পরিবর্তে `.tf` ফাইল ব্যবহার করবে:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### একটি ন্যূনতম `main.tf`

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

### azd কীভাবে আপনার Terraform আউটপুটগুলোর সাথে সংযোগ স্থাপন করে

azd আপনার এন্ডপয়েন্টগুলো জানার জন্য এবং পরিবেশ মানগুলি আপনার অ্যাপে বেতিং করার জন্য Terraform **outputs** পড়ে। আউটপুট নামগুলো গুরুত্বপূর্ণ—azd নির্দিষ্ট নামগুলো খোঁজে:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **গুরুত্বপূর্ণঃ** azd প্রতিটি পরিবেশভিত্তিক রিসোর্স ট্র্যাক করতে `azd-env-name` ট্যাগ এবং `AZURE_*` আউটপুট ব্যবহার করে। সবসময় আপনার রিসোর্স গ্রুপে `"azd-env-name" = var.environment_name` ট্যাগ করুন যাতে `azd down` সবকিছু খুঁজে পেয়ে মুছে দিতে পারে।

### Terraform দিয়ে ডিপ্লয় করুন

কমান্ডগুলো একেবারে Bicep-এর মতোই:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd পটভূমিতে 'terraform plan' চালায়
azd up                    # প্রস্তুতকরণ + স্থাপন
azd down --force          # Terraform দ্বারা পরিচালিত সম্পদগুলি ধ্বংস করে
```

> **প্রয়োজনীয় শর্ত:** Terraform আপনার মেশিনে ইনস্টল ও `PATH`-এ থাকতে হবে। azd Terraform *ওয়ার্কফ্লো* পরিচালনা করে কিন্তু Terraform আপনার জন্য ইনস্টল করে না। স্টেটের জন্য, azd ডিফল্টভাবে লোকাল স্টেট ব্যবহার করে; টিমগুলোর জন্য একটি রিমোট ব্যাকএন্ড কনফিগার করুন (উদাহরণস্বরূপ, `provider.tf`-এ একটি Azure Storage ব্যাকএন্ড)।

সম্পূর্ণ, রানযোগ্য Terraform-ভিত্তিক স্টার্টারগুলোর জন্য [Awesome AZD gallery](https://azure.github.io/awesome-azd/) ব্রাউজ করুন এবং Terraform ফিল্টার করুন, অথবা অফিসিয়াল [azd Terraform documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd) দেখুন।

## 🧩 azd-এর সাথে Pulumi ব্যবহার

আপনার টিম যদি একটি জেনেরাল-পারপস ল্যাঙ্গুয়েজ (TypeScript, Python, Go, বা C#) এ ইনফ্রাস্ট্রাকচার লেখে, DSL-এর পরিবর্তে, azd **Pulumi**-কেও সমর্থন করে। Terraform-এর মতই, `azd up` / `azd provision` / `azd down` ওয়ার্কফ্লো অপরিবর্তিত থাকে—কেবল ইনফ্রাস্ট্রাকচার টুলিং এবং ফোল্ডার বিন্যাস আলাদা।

### azd-কে Pulumi ব্যবহার করতে বলুন

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

### Pulumi ফোল্ডার বিন্যাস

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### একটি ন্যূনতম `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// প্রতিটি রিসোর্সে ট্যাগ করুন যাতে azd সেগুলোকে ট্র্যাক করে এবং পরিষ্কার করতে পারে
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd এই আউটপুটগুলোকে আপনার পরিবেশে পুনরায় অন্তর্ভুক্ত করে
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### স্ট্যাকগুলো azd পরিবেশগুলোর সাথে মিলে যায়

Pulumi ডিপ্লয়মেন্টগুলোকে **স্ট্যাক**-এ সংগঠিত করে, এবং azd প্রতিটি azd পরিবেশকে একই নামে একটি Pulumi স্ট্যাকের সাথে ম্যাপ করে। যখন আপনি `azd env new staging` চালান, azd `staging` Pulumi স্ট্যাক নির্বাচন (বা তৈরি) করে। একই `azd-env-name` ট্যাগিং এবং `AZURE_*` আউটপুট নিয়ম প্রযোজ্য, যাতে `azd down` সবকিছু খুঁজে পেয়ে মুছে দিতে পারে।

### Pulumi দিয়ে ডিপ্লয় করুন

```bash
azd auth login
azd env new dev
azd provision --preview   # azd পটভূমিতে 'pulumi preview' চালায়
azd up                    # প্রোভিশন + ডিপ্লয়
azd down --force          # 'pulumi destroy' চালায়
```

> **প্রয়োজনীয় শর্ত:** Pulumi আপনার মেশিনে ইনস্টল এবং `PATH`-এ থাকতে হবে, এবং আপনার একটি স্টেট ব্যাকএন্ড লাগবে (Pulumi Cloud বা একটি সেলফ-ম্যানেজড ব্যাকএন্ড যেমন Azure Blob Storage)। azd Pulumi *ওয়ার্কফ্লো* পরিচালনা করে, ইনস্টল নয়। অফিসিয়াল [azd Pulumi documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd) দেখুন।

## 🎯 আপনার সার্ভিসের জন্য হোস্ট নির্বাচন

`azure.yaml`-এর `host` ক্ষেত্রটি নির্ধারণ করে আপনার কোড কোথায় চলবে। azd একাধিক হোস্ট সমর্থন করে—সঠিকটি নির্বাচন করা ইনফ্রাস্ট্রাকচার ভাষার চেয়ে বেশি গুরুত্বপূর্ণ। এখানে শুরু করার জন্য একটি বন্ধুসুলভ তুলনা দেওয়া হলো:

| `host` value | Best for | Why |
|--------------|----------|-----|
| `appservice` | প্রচলিত ওয়েব অ্যাপ এবং API এর জন্য | সবথেকে সহজ PaaS; কনটেইনারের প্রয়োজন নেই |
| `staticwebapp` | ফ্রন্ট-এন্ড SPA (React, Vue, Angular) | গ্লোবাল CDN + ফ্রি SSL, বিল্ট-ইন API সাপোর্ট |
| `function` | ইভেন্ট-চালিত এবং সার্ভারলেস ওয়ার্কলোড | স্কেল-টু-জিরো, এক্সিকিউশনের ভিত্তিতে পেমেন্ট |
| `containerapp` | কনটেইনারাইজড মাইক্রোসার্ভিস | সার্ভারলেস কনটেইনার, স্কেল-টু-জিরো, বিল্ট-ইন ইনগ্রেস |
| `aks` | জটিল অর্কেস্ট্রেশন প্রয়োজন হলে | যখন সত্যিই দরকার, তখন পূর্ণ Kubernetes নিয়ন্ত্রণ |
| `springapp` | Java Spring Boot অ্যাপের জন্য | Spring-এর জন্য টিউন করা ম্যানেজড Azure Spring Apps রানটাইম |

### কখন AKS নির্বাচন করবেন

**Azure Kubernetes Service (`host: aks`)** আপনাকে Kubernetes-এর পূর্ণ শক্তি দেয়—কাস্টম কন্ট্রোলার, সার্ভিস মেশ, জটিল নেটওয়ার্কিং, এবং ফাইন-গ্রেইন্ড স্কেজুলিং। এই ক্ষমতার সাথে অপারেশনাল ওভারহেড আসে: আপনাকে নোড পুল, আপগ্রেড, এবং ক্লাস্টার নেটওয়ার্কিং পরিচালনা করতে হবে।

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **সম্ভব হলে সহজ থেকে শুরু করুন।** অধিকাংশ মাইক্রোসার্ভিসের জন্য, **Container Apps** আপনাকে কনটেইনার, অটোস্কেলিং, এবং স্কেল-টু-জিরো দেয় ক্লাস্টার ম্যানেজ না করেই। কেবল তখনই AKS নির্বাচন করুন যখন Kubernetes-নির্দিষ্ট ফিচারগুলো আপনার প্রকল্পে প্রয়োজনীয় হয়।

### কখন Azure Spring Apps ব্যবহার করবেন

**Azure Spring Apps (`host: springapp`)** হল Spring Boot-এর জন্য উদ্দেশ্যপ্রণোদিত একটি ম্যানেজড রানটাইম। এটি সার্ভিস ডিসকভারি, কনফিগ সার্ভার, এবং ব্লু-গ্রিন ডিপ্লয়মেন্ট হ্যান্ডেল করে যাতে Java টিমগুলো নিজেদের ইনফ্রাস্ট্রাকচার চালাতে না হয়।

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> `springapp` ব্যবহার করুন যখন আপনার বিদ্যমান Spring Boot অ্যাপ আছে এবং আপনি তাদের জন্য টিউন করা একটি রানটাইম চান। Spring-নির্দিষ্ট প্রয়োজন ছাড়া নতুন কনটেইনারাইজড Java অ্যাপগুলোর জন্য প্রায়ই `containerapp` হচ্ছে সহজতর পছন্দ।

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

## 🔒 সিকিউরিটি এবং সিক্রেটস ম্যানেজমেন্ট

### Key Vault Integration
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

### Managed Identity Configuration
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

## 🌍 নেটওয়ার্কিং এবং কানেকটিভিটি

### Virtual Network Configuration
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

### Application Gateway with SSL
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

## 📊 মনিটরিং এবং অবজার্ভেবিলিটি

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

## 🔧 পরিবেশ-নির্দিষ্ট কনফিগারেশনসমূহ

### বিভিন্ন পরিবেশের জন্য প্যারামিটার ফাইল
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

### শর্তসাপেক্ষ রিসোর্স প্রোভিশনিং
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

## 🚀 উন্নত প্রোভিশনিং প্যাটার্নসমূহ

### মাল্টি-রিজিওন ডিপ্লয়মেন্ট
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

## 🧪 ইনফ্রাস্ট্রাকচার প্রিভিউ ও ভ্যালিডেশন (নতুন)

### ডিপ্লয়মেন্টের আগে ইনফ্রাস্ট্রাকচার পরিবর্তনের প্রিভিউ

`azd provision --preview` ফিচারটি আপনিকে বাস্তবে রিসোর্স ডিপ্লয় করার আগে **ইনফ্রাস্ট্রাকচার প্রোভিশনিং অনুকরণ** করতে দেয়। এটি `terraform plan` বা `bicep what-if`-এর মতো একটি ড্রাই-রান ভিউ দেয়, যা দেখায় Azure পরিবেশে কী পরিবর্তন করা হবে।

#### 🛠️ এটি যা করে
- **আপনার IaC টেমপ্লেটগুলো বিশ্লেষণ করে** (Bicep বা Terraform)
- **রিসোর্স পরিবর্তনের একটি প্রিভিউ দেখায়**: যোগ, মুছা, আপডেট
- **পরিবর্তনগুলি প্রয়োগ করে না** — এটি রিড-অনলি এবং চালাতে নিরাপদ

#### ব্যবহারিক পরিস্থিতি
```bash
# ডেপ্লয়মেন্টের আগে অবকাঠামোর পরিবর্তনগুলি প্রাকদর্শন করুন
azd provision --preview

# নির্দিষ্ট পরিবেশের জন্য প্রাকদর্শন
azd provision --preview -e production
```

এই কমান্ডটি আপনাকে সাহায্য করে:
- **রিসোর্স প্রয়োগ করার আগে ইনফ্রাস্ট্রাকচার পরিবর্তন যাচাই করতে**
- **ডেভেলপমেন্ট চক্রের শুরুর ধাপে কনফিগারেশন ত্রুটি ধরতে**
- **টিম পরিবেশে নিরাপদভাবে সহযোগিতা করতে**
- **অপ্রত্যাশিত ফল ছাড়া ন্যূনতম-প্রিভিলেজ ডিপ্লয়মেন্ট নিশ্চিত করতে**

এটি বিশেষত উপকারী যখন:
- জটিল মাল্টি-সার্ভিস পরিবেশের সাথে কাজ করছেন
- প্রোডাকশনে পরিবর্তন করছেন
- PR অনুমোদনের আগে টেমপ্লেট পরিবর্তন যাচাই করছেন
- নতুন টিম সদস্যদের ইনফ্রাস্ট্রাকচার প্যাটার্ন নিয়ে প্রশিক্ষণ দিচ্ছেন

### উদাহরণ প্রিভিউ আউটপুট
নির্দিষ্ট প্রিভিউ আউটপুট প্রদানকারী এবং প্রকল্পের কাঠামোর ওপর নির্ভর করে ভিন্ন হবে, কিন্তু ফলাফলটি অবশ্যই স্পষ্টভাবে প্রস্তাবিত পরিবর্তনগুলো সনাক্ত করা উচিত ডিপ্লয় করার আগে।

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

## �🔄 রিসোর্স আপডেট এবং মাইগ্রেশন

### নিরাপদ রিসোর্স আপডেট
```bash
# প্রথমে অবকাঠামো পরিবর্তনগুলো প্রিভিউ করুন (প্রস্তাবিত)
azd provision --preview

# প্রিভিউ নিশ্চিত হওয়ার পরে পরিবর্তনগুলি প্রয়োগ করুন
azd provision --confirm-with-no-prompt

# রোলব্যাকের জন্য, অবকাঠামো পরিবর্তনগুলো পূর্বাবস্থায় ফেরাতে Git ব্যবহার করুন:
git revert HEAD  # শেষ অবকাঠামো কমিটটি পূর্বাবস্থায় ফিরিয়ে আনুন
azd provision    # পূর্ববর্তী অবকাঠামো অবস্থা প্রয়োগ করুন
```

### ডাটাবেস মাইগ্রেশন
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

## 🎯 সেরা অনুশীলনসমূহ

### 1. রিসোর্স নামকরণের কনভেনশন
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. ট্যাগিং কৌশল
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

### 3. প্যারামিটার ভ্যালিডেশন
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

### 4. আউটপুট সংগঠন
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

## পরবর্তী ধাপ

- [প্রী-ডিপ্লয়মেন্ট পরিকল্পনা](../chapter-06-pre-deployment/capacity-planning.md) - রিসোর্সের প্রাপ্যতা যাচাই করুন
- [সাধারণ সমস্যা](../chapter-07-troubleshooting/common-issues.md) - ইনফ্রাস্ট্রাকচার সমস্যাগুলো ট্রাবলশুট করুন
- [ডিবাগিং গাইড](../chapter-07-troubleshooting/debugging.md) - প্রোভিশনিং ইস্যুগুলো ডিবাগ করুন
- [SKU সিলেকশন](../chapter-06-pre-deployment/sku-selection.md) - উপযুক্ত সার্ভিস টিয়ার নির্বাচন করুন

## অতিরিক্ত সম্পদ

- [Azure Bicep ডকুমেন্টেশন](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager টেমপ্লেটস](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigation**
- **Previous Lesson**: [Deployment Guide](deployment-guide.md)
- **Next Lesson**: [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->