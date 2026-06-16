# توفير موارد Azure باستخدام AZD

**تنقّل الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 4 - البنية التحتية كرمز والنشر
- **⬅️ السابق**: [دليل النشر](deployment-guide.md)
- **➡️ الفصل التالي**: [الفصل 5: حلول الذكاء الاصطناعي متعددة الوكلاء](../../examples/retail-scenario.md)
- **🔧 ذي صلة**: [الفصل 6: التحقق قبل النشر](../chapter-06-pre-deployment/capacity-planning.md)

## المقدمة

يغطي هذا الدليل الشامل كل ما تحتاج لمعرفته حول توفير وإدارة موارد Azure باستخدام Azure Developer CLI. تعلّم كيفية تنفيذ أنماط البنية التحتية كرمز (IaC) بدءًا من إنشاء الموارد الأساسية وحتى هياكل البنية التحتية المتقدمة على مستوى المؤسسات باستخدام Bicep وARM templates وTerraform وPulumi.

## أهداف التعلم

من خلال إكمال هذا الدليل، ستتمكن من:
- إتقان مبادئ البنية التحتية كرمز وتوفير موارد Azure
- فهم مُزودي IaC المتعدّدين المدعومين من Azure Developer CLI
- تصميم وتنفيذ قوالب Bicep لهياكل التطبيقات الشائعة
- تكوين معلمات الموارد والمتغيرات والإعدادات الخاصة بالبيئات
- تنفيذ أنماط بنية تحتية متقدمة بما في ذلك الشبكات والأمان
- إدارة دورة حياة الموارد والتحديثات وحل الاعتمادات

## مخرجات التعلم

عند الانتهاء، ستتمكن من:
- تصميم وتوفير بنية Azure باستخدام Bicep وARM templates
- تكوين هندسات متعددة الخدمات المعقدة مع الاعتمادات الصحيحة للموارد
- تنفيذ قوالب قابلة للتمرير بالمعلمات لعدة بيئات وتكوينات
- استكشاف مشكلات توفير البنية التحتية وحل فشل النشر
- تطبيق مبادئ إطار عمل Azure للهندسة الجيدة على تصميم البنية التحتية
- إدارة تحديثات البنية التحتية وتنفيذ استراتيجيات إصدار البنية التحتية

## نظرة عامة على توفير البنية التحتية

يدعم Azure Developer CLI عدة مُزودين للبنية التحتية كرمز (IaC):
- **Bicep** (الموصى به) - لغة مخصصة لمجال Azure
- **ARM Templates** - قوالب Azure Resource Manager المبنية على JSON
- **Terraform** - أداة بنية تحتية متعددة السحابات
- **Pulumi** - البنية التحتية كرمز الحديثة باستخدام لغات البرمجة

## فهم موارد Azure

### التسلسل الهرمي للموارد
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### خدمات Azure الشائعة للتطبيقات
- **الحوسبة**: App Service, Container Apps, Functions, Virtual Machines
- **التخزين**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **الشبكات**: Virtual Network, Application Gateway, CDN
- **الأمان**: Key Vault, Application Insights, Log Analytics
- **الذكاء الاصطناعي/التعلم الآلي**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## قوالب البنية التحتية باستخدام Bicep

### بنية قالب Bicep الأساسية
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

### أنماط Bicep المتقدمة

#### بنية تحتية معيارية
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

#### إنشاء موارد شرطية
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

## 🌐 استخدام Terraform مع azd

Bicep هو الإعداد الافتراضي لـ azd، لكن azd يدعم أيضًا **Terraform** — مفيد إذا كان فريقك يعتمد عليه بالفعل أو إذا كنت تدير بنية تحتية متعددة السحابات. سير عمل azd (`azd up`, `azd provision`, `azd down`) متطابق؛ يتغير فقط لغة البنية التحتية وهيكل المجلدات.

### أخبر azd باستخدام Terraform

أضف قسم `infra` إلى `azure.yaml` يشير إلى موفر Terraform:

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

### بنية مجلد Terraform

مع موفر Terraform، يستخدم مجلد `infra/` ملفات `.tf` بدلًا من Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### ملف `main.tf` مصغر

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

### كيف يتصل azd بمخرجات Terraform الخاصة بك

azd يقرأ مخرجات Terraform **outputs** للتعرّف على نقاط النهاية وربط قيم البيئة بتطبيقك. أسماء المخرجات مهمة — يبحث azd عن أسماء محددة:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **مهم:** azd يستخدم وسم `azd-env-name` ومخرجات `AZURE_*` لتعقّب الموارد لكل بيئة. دائمًا أَوْسِم مجموعة الموارد الخاصة بك بـ `"azd-env-name" = var.environment_name` حتى يتمكن `azd down` من العثور على كل شيء وإزالته.

### النشر باستخدام Terraform

الأوامر هي نفسها تمامًا كما في Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd يقوم بتشغيل 'terraform plan' تحت الغطاء
azd up                    # تهيئة + نشر
azd down --force          # يدمر الموارد المُدارة بواسطة Terraform
```

> **المتطلبات المسبقة:** يجب تثبيت Terraform وأن يكون في `PATH` الخاص بك. يدير azd *سير عمل* Terraform ولكنه لا يثبت Terraform نيابةً عنك. بالنسبة للحالة، يعتمد azd افتراضيًا على الحالة المحلية؛ بالنسبة للفرق، قم بتكوين خلفية بعيدة (على سبيل المثال، خلفية Azure Storage) في `provider.tf`.

للحصول على مشاريع بدء تشغيل كاملة وقابلة للتشغيل تعتمد على Terraform، تصفح معرض [Awesome AZD gallery](https://azure.github.io/awesome-azd/) وقم بتصفية النتائج لـ Terraform، أو راجع [وثائق azd الخاصة بـ Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 استخدام Pulumi مع azd

إذا كان فريقك يكتب البنية التحتية بلغة عامة الغرض (TypeScript, Python, Go, أو C#) بدلاً من DSL، فإن azd يدعم أيضًا **Pulumi**. كما هو الحال مع Terraform، تظل سير عمل `azd up` / `azd provision` / `azd down` دون تغيير — يتغير فقط أدوات البنية التحتية وهيكل المجلدات.

### أخبر azd باستخدام Pulumi

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

### بنية مجلد Pulumi

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### ملف `index.ts` مصغر

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// وسم كل مورد حتى تتمكن azd من تتبعه وتنظيفه
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd يعيد قراءة هذه المخرجات إلى بيئتك
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### تتطابق Stacks مع بيئات azd

Pulumi ينظم النشر إلى **stacks**، ويقوم azd بمطابقة كل بيئة azd مع Pulumi stack بنفس الاسم. عند تشغيل `azd env new staging`، يختار azd (أو ينشئ) stack Pulumi باسم `staging`. تنطبق نفس قواعد الوسم `azd-env-name` ومخرجات `AZURE_*`، لذا يمكن لـ `azd down` العثور على كل شيء وإزالته.

### النشر باستخدام Pulumi

```bash
azd auth login
azd env new dev
azd provision --preview   # azd يقوم بتشغيل 'pulumi preview' خلف الكواليس
azd up                    # تهيئة + نشر
azd down --force          # يقوم بتشغيل 'pulumi destroy'
```

> **المتطلبات المسبقة:** يجب تثبيت Pulumi وأن يكون في `PATH` الخاص بك، وستحتاج إلى بنية خلفية للحالة (Pulumi Cloud أو خلفية تُدار ذاتيًا مثل Azure Blob Storage). يدير azd *سير عمل* Pulumi وليس التثبيت. راجع [وثائق azd الخاصة بـ Pulumi](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd).

## 🎯 اختيار مضيف لخدمتك

حقل `host` في `azure.yaml` يحدد مكان تشغيل التعليمات البرمجية الخاصة بك. يدعم azd عدة مستضيفين — اختيار الخيار الصحيح أهم من لغة البنية التحتية. فيما يلي مقارنة مناسبة للمبتدئين:

| `host` value | الأفضل لـ | السبب |
|--------------|----------|-----|
| `appservice` | تطبيقات الويب التقليدية وواجهات برمجة التطبيقات | أبسط منصة كخدمة؛ لا تتطلب حاويات |
| `staticwebapp` | واجهات المستخدم الأحادية (SPAs) للواجهة الأمامية (React, Vue, Angular) | شبكة CDN عالمية + SSL مجاني، ودعم API مدمج |
| `function` | أحمال العمل المعتمدة على الأحداث ودون خوادم | قابلية التحجيم للصفر، ودفع مقابل كل تنفيذ |
| `containerapp` | خدمات مصغرة محمولة في حاويات | حاويات بدون خوادم، قابلية التحجيم للصفر، ودعم دخول مدمج |
| `aks` | حالات الحاجة لتنسيق معقد | تحكم كامل في Kubernetes عندما تحتاج لذلك فعلاً |
| `springapp` | تطبيقات Java Spring Boot | بيئة تشغيل مُدارة لـ Azure Spring Apps مُحسّنة لـ Spring |

### متى تختار AKS

خدمة Azure Kubernetes (`host: aks`) تمنحك القوة الكاملة لـ Kubernetes — وحدات تحكم مخصصة، شبكات خدمة، شبكات معقدة، وجدولة دقيقة الحبيبات. تأتي هذه القوة مع عبء تشغيلي: أنت من يدير تجمعات العقد، والترقيات، وشبكات العنقود.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **ابدأ ببساطة إذا استطعت.** لمعظم الخدمات المصغرة، تمنحك **Container Apps** الحاويات، والتحجيم التلقائي، وقابلية التحجيم للصفر دون إدارة عنقود. اختر AKS فقط عندما تحتاج ميزات مخصصة لـ Kubernetes.

### متى تستخدم Azure Spring Apps

تعد **Azure Spring Apps (`host: springapp`)** بيئة تشغيل مُدارة مصممة خصيصًا لـ Spring Boot. تتعامل مع اكتشاف الخدمات، وخادم التكوين، والنشر الأزرق-الأخضر حتى لا يحتاج فرق Java إلى تشغيل بنيتهم التحتية الخاصة.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> استخدم `springapp` عندما تكون لديك تطبيقات Spring Boot موجودة وتريد بيئة تشغيل مخصّصة لها. بالنسبة لتطبيقات Java الحاوية الجديدة دون احتياجات خاصة بـ Spring، غالبًا ما يكون `containerapp` الخيار الأبسط.

## 🗃️ توفير قواعد البيانات

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

## 🔒 إدارة الأمان والأسرار

### تكامل Key Vault
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

### تكوين الهوية المُدارة
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

## 🌍 الشبكات والاتصال

### تكوين الشبكة الافتراضية
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

### Application Gateway مع SSL
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

## 📊 المراقبة وقابلية الملاحظة

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

### المقاييس والتنبيهات المخصصة
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

## 🔧 التكوينات الخاصة بكل بيئة

### ملفات المعلمات لبيئات مختلفة
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

### توفير الموارد الشرطي
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

## 🚀 أنماط توفير متقدمة

### نشر متعدد المناطق
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

### اختبار البنية التحتية
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

## 🧪 معاينة البنية التحتية والتحقق (NEW)

### معاينة تغييرات البنية التحتية قبل النشر

تتيح لك ميزة `azd provision --preview` **محاكاة توفير البنية التحتية** قبل نشر الموارد فعليًا. هي شبيهة بروح `terraform plan` أو `bicep what-if`، وتمنحك **عرضًا تجريبيًا** لما سيُغيّر في بيئة Azure الخاصة بك.

#### 🛠️ ما الذي يفعله
- **يحلل قوالب IaC الخاصة بك** (Bicep أو Terraform)
- **يعرض معاينة لتغييرات الموارد**: الإضافات، الحذف، التحديثات
- **لا يُطبّق التغييرات** — إنه للقراءة فقط وآمن للتشغيل

#### حالات الاستخدام
```bash
# معاينة تغييرات البنية التحتية قبل النشر
azd provision --preview

# معاينة لبيئة محددة
azd provision --preview -e production
```

يساعدك هذا الأمر على:
- **التحقق من تغييرات البنية التحتية** قبل الالتزام بالموارد
- **التقاط الأخطاء في التكوين مبكرًا** في دورة التطوير
- **التعاون بأمان** في بيئات الفريق
- **ضمان نشر بأدنى الامتيازات** دون مفاجآت

يكون ذلك مفيدًا بشكل خاص عندما:
- العمل مع بيئات متعددة الخدمات المعقدة
- إجراء تغييرات على البنية التحتية الإنتاجية
- التحقق من تعديلات القوالب قبل الموافقة على طلب السحب (PR)
- تدريب أعضاء الفريق الجدد على أنماط البنية التحتية

### مثال على مخرجات المعاينة
تختلف مخرجات المعاينة الدقيقة حسب الموفر وبنية المشروع، لكن يجب أن تحدّد النتيجة بوضوح التغييرات المقترحة قبل تطبيق أي شيء.

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

## �🔄 تحديثات الموارد والترحيلات

### تحديثات آمنة للموارد
```bash
# عاين تغييرات البنية التحتية أولاً (مُوصى به)
azd provision --preview

# قم بتطبيق التغييرات بعد تأكيد المعاينة
azd provision --confirm-with-no-prompt

# للتراجع، استخدم Git لإرجاع تغييرات البنية التحتية:
git revert HEAD  # التراجع عن آخر التزام للبنية التحتية
azd provision    # تطبيق حالة البنية التحتية السابقة
```

### ترحيلات قاعدة البيانات
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

## 🎯 أفضل الممارسات

### 1. قواعد تسمية الموارد
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. استراتيجية الوسوم
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

### 3. التحقق من المعلمات
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

### 4. تنظيم المخرجات
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

## الخطوات التالية

- [التخطيط قبل النشر](../chapter-06-pre-deployment/capacity-planning.md) - التحقق من توفر الموارد
- [المشكلات الشائعة](../chapter-07-troubleshooting/common-issues.md) - استكشاف مشكلات البنية التحتية وحلها
- [دليل التصحيح](../chapter-07-troubleshooting/debugging.md) - تصحيح مشكلات التوفير
- [اختيار SKU](../chapter-06-pre-deployment/sku-selection.md) - اختر طبقات الخدمة المناسبة

## مصادر إضافية

- [وثائق Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [قوالب Azure Resource Manager](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [مركز هندسة Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [إطار عمل Azure للهندسة الجيدة](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**التنقّل**
- **الدرس السابق**: [دليل النشر](deployment-guide.md)
- **الدرس التالي**: [التخطيط قبل النشر](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->