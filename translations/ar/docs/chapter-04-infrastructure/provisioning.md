# توفير موارد أزور باستخدام AZD

**تنقل الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 4 - البنية التحتية كرمز والنشر
- **⬅️ السابق**: [دليل النشر](deployment-guide.md)
- **➡️ الفصل التالي**: [الفصل 5: حلول الذكاء الاصطناعي متعددة الوكلاء](../../examples/retail-scenario.md)
- **🔧 ذات صلة**: [الفصل 6: التحقق قبل النشر](../chapter-06-pre-deployment/capacity-planning.md)

## مقدمة

يغطي هذا الدليل توفير وإدارة موارد أزور باستخدام أداة Azure Developer CLI مع مزودي Bicep وTerraform المدمجين.

> تمت المراجعة مقابل `azd 1.37.2` (نوفمبر 2026). ما لم يُذكر خلاف ذلك، فإن أمثلة Bicep وTerraform والسكريبتات هي **قطع توضيحية**، وليست قالبًا كاملاً. دمجها في مشروع يوفر المعلمات، الوحدات، الهويات، الشبكات، وكود التطبيق المشار إليها. لم يتم تنفيذ توفير أزور في هذه المراجعة.

## أهداف التعلم

عند إكمال هذا الدليل، ستتمكن من:
- إتقان مبادئ البنية التحتية كرمز وتوفير موارد أزور
- فهم العديد من مزودي IaC المدعومين من Azure Developer CLI
- تصميم وتنفيذ نماذج Bicep لهياكل التطبيقات الشائعة
- تكوين معلمات الموارد والمتغيرات وإعدادات البيئة المحددة
- تنفيذ أنماط بنية تحتية متقدمة بما في ذلك الشبكات والأمان
- إدارة دورة حياة الموارد، والتحديثات، وحل التبعيات

## مخرجات التعلم

عند الانتهاء، ستكون قادرًا على:
- تصميم وتوفير بنية تحتية لأزور باستخدام نماذج Bicep وARM
- تكوين هياكل متعددة الخدمات المعقدة مع تبعيات الموارد المناسبة
- تنفيذ نماذج معلمات للبيئات والتكوينات المتعددة
- استكشاف مشكلات توفير البنية التحتية وحل فشل النشر
- تطبيق مبادئ إطار عمل Azure Well-Architected على تصميم البنية التحتية
- إدارة تحديثات البنية التحتية وتنفيذ استراتيجيات إصدار للبنية التحتية

## نظرة عامة على توفير البنية التحتية

تدعم Azure Developer CLI عدة مزودي بنية تحتية كرمز (IaC):
- **Bicep** (موصى به) - لغة مجال محددة خاصة بأزور
- **نماذج ARM** - يقوم Bicep بالترجمة إلى ARM؛ لا يعتبر JSON ARM الخام مزودًا مدمجًا منفصلًا `infra.provider`
- **Terraform** - أداة بنية تحتية متعددة السحابات
- **مزودات التمديد** - تتطلب تثبيت ملحق مزود منفصل وتكوينه كما هو موثق؛ لا تفترض دعم أي سلسلة مزود

## فهم موارد أزور

### تسلسل هرمي للموارد
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### خدمات أزور الشائعة للتطبيقات
- **الحوسبة**: خدمة التطبيقات، تطبيقات الحاويات، الدوال، الأجهزة الافتراضية
- **التخزين**: حساب التخزين، Cosmos DB، قاعدة بيانات SQL، PostgreSQL
- **الشبكات**: الشبكة الافتراضية، بوابة التطبيقات، CDN
- **الأمان**: Key Vault، Application Insights، Log Analytics
- **الذكاء الاصطناعي / تعلم الآلة**: خدمات أزور AI، أزور OpenAI، تعلم الآلة في أزور

## نماذج بنية Bicep التحتية

### هيكل نموذج Bicep الأساسي
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

للحصول على مشروع azd كامل، استدعي هذه الوحدة من `infra/main.bicep` بنطاق الاشتراك الذي ينشئ مجموعة موارد معنونة ويمرر نطاقها. طابق `environmentName`/`location` في `main.parameters.json`. الوسم `azd-service-name: web` يربط المورد بـ `services.web`؛ أسماء الإخراج العشوائية وحدها لا تكوّن اكتشاف الخدمة.

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

#### إنشاء موارد مشروطة
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

Bicep هو الافتراضي في azd، لكن azd يدعم أيضًا **Terraform** – مفيد إذا كان فريقك يستخدمه بالفعل أو تدير بنية تحتية متعددة السحابات. سير عمل azd (`azd up`، `azd provision`، `azd down`) متطابق؛ فقط لغة البنية التحتية وتخطيط المجلد تتغير.

### إخبار azd باستخدام Terraform

أضف قسم `infra` إلى `azure.yaml` يشير إلى مزود Terraform:

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

### تخطيط مجلد Terraform

مع مزود Terraform، يستخدم مجلد `infra/` ملفات `.tf` بدلاً من Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### جزء `main.tf`

هذا ينشئ فقط مجموعة موارد وخطة، وليس خدمة قابلة للنشر. يجب أيضًا إعلان متغيرات الإدخال، مزود `azurerm` المتوافق، التطبيق الويب، ورسم الخرائط بين وسم الخدمة / اسم المورد.

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

### كيف يتصل azd بمخرجات Terraform

تقوم أداة azd بقراءة **المخرجات** من Terraform وتحويلها إلى قيم بيئية. يفترض هذا الجزء أنك قد عرّفت `azurerm_linux_web_app.web`؛ لا يزال اكتشاف الخدمة يتطلب اسم مورد مطابق أو وسم `azd-service-name`:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **مهم:** تستخدم azd الوسم `azd-env-name` والمخرجات `AZURE_*` لتعقب الموارد لكل بيئة. قم دائمًا بوسم مجموعة الموارد الخاصة بك بـ `"azd-env-name" = var.environment_name` حتى يتمكن `azd down` من العثور على كل شيء وإزالته.

### النشر باستخدام Terraform

الأوامر هي نفسها بالضبط كما في Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **المتطلبات المسبقة:** يجب تثبيت Terraform ووجوده في مسار `PATH` الخاص بك. تدير azd *سير العمل* الخاص بـ Terraform لكنها لا تثبته لك. بالنسبة للحالة، تستخدم azd الحالة المحلية افتراضيًا؛ بالنسبة للفرق، قم بتكوين backend بعيد (مثل Azure Storage backend) في `provider.tf`.

للحصول على بدايات Terraform كاملة وقابلة للتشغيل، تصفح [معرض Awesome AZD](https://azure.github.io/awesome-azd/) وقم بتصفية بـ Terraform، أو انظر الوثائق الرسمية لـ [azd Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 أدوات بنية تحتية أخرى

Pulumi ليست مزود تهيئة مدمجًا مع azd 1.37.2. فقط تعيين `infra.provider: pulumi` لا يحقق تكاملًا عمليًا، و `azd env new` لا ينشئ أو يختار تلقائيًا تكديس Pulumi. إذا كنت تستخدم أداة IaC أخرى، فاتبع وثائق امتداد المزود الموثوق أو قم بإدارة دورة حياته صراحةً في سير العمل الخاص بك. لا يوفر هذا المسار مزود Pulumi أو يتحقق منه.

## 🎯 اختيار مضيف لخدمتك

يقرر الحقل `host` في `azure.yaml` مكان تشغيل الكود الخاص بك. تدعم azd عدة مضيفين — اختيار المضيف المناسب أهم من لغة البنية التحتية. إليك مقارنة مناسبة للمبتدئين:

| قيمة `host` | الأفضل لـ | السبب |
|--------------|----------|-----|
| `appservice` | تطبيقات الويب التقليدية وواجهات برمجة التطبيقات | أبسط منصة كخدمة؛ لا حاجة إلى حاويات |
| `staticwebapp` | تطبيقات الصفحة الواحدة في الواجهة الأمامية (React, Vue, Angular) | شبكة CDN عالمية + SSL مجاني، دعم API مدمج |
| `function` | أحمال العمل المدفوعة بالأحداث وعالية السيرفر | التوسع إلى الصفر، الدفع مقابل التنفيذ |
| `containerapp` | ميكروسيرفيسيز معزولة بالحاويات | حاويات بدون سيرفر، التوسع إلى الصفر، دخول مدمج |
| `aks` | احتياجات تنسيق معقدة | تحكم كامل في Kubernetes عند الحاجة الحقيقية |
| `springapp` | نشرات Azure Spring Apps الحالية | هدف قديم؛ الخدمة تُستبعد بتاريخ 31 مارس 2028 ومغلقة للعملاء الجدد |

### متى تختار AKS

**خدمة Azure Kubernetes (`host: aks`)** تمنحك القوة الكاملة لـ Kubernetes—وحدات تحكم مخصصة، شبكات خدمة، شبكات معقدة، وجدولة دقيقة. تأتي هذه القوة مع تعقيد تشغيلي: أنت تدير تجمعات العقد، التحديثات، وشبكات الكتلة.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **ابدأ أبسط ما تستطيع.** لمعظم الميكروسيرفيسيز، **تطبيقات الحاويات** توفر لك الحاويات، التوسع التلقائي، والتوسع إلى الصفر دون إدارة الكتلة. اختر AKS فقط عندما تحتاج ميزات محددة لـ Kubernetes.

### متى تستخدم Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** هي بيئة تشغيل مُدارة مُخصصة لـ Spring Boot. تدير اكتشاف الخدمة، خادم التكوين، والنشر الأزرق-الأخضر حتى لا تضطر فرق Java لتشغيل البنية التحتية الخاصة بهم.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> لا تختار Azure Spring Apps لمشروع مبتدئ جديد: فهي مغلقة للعملاء الجدد و[ستنهي العمل في 31 مارس 2028](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). فضّل البدائل المدعومة مثل تطبيقات الحاويات وخطط الهجرة للنشرات القائمة.

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
**متطلبات المقطع:** إعلان `@secure() param databasePassword string` واستخدام قيمة قوية مزودة. اختر الوصول العام **أو** دمج الشبكة الفرعية المفوضة/DNS الخاص أدناه؛ المقطعين لا يتصلان تلقائيًا.

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

قاعدة `0.0.0.0` تسمح بالاتصالات من خدمات Azure خارج اشتراكك. هذا ليس شبكة خاصة؛ يُفضل تصميم شبكة مقيد للحمل الحقيقي.

## 🔒 الأمان وإدارة الأسرار

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
          name: 'NODE_ENV'
          value: 'production'
        }
      ]
    }
  }
}
```

للهوية المُخصصة للنظام، لا تقم بتعيين `AZURE_CLIENT_ID` إلى معرف المبدأ الخاص بها. الهوية المعينة من قبل المستخدم تستخدم **معرف العميل** الخاص بها، وليس معرف الكائن/المبدأ. المرجع في Key Vault يحتاج أيضًا إلى تعيين دور خزنة للتطبيق والوصول الشبكي.

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

### بوابة التطبيق مع SSL
**مقطع هيكلي غير مكتمل، ليست بوابة قابلة للنشر:** أضف `gateway-subnet` مخصصة إلى الشبكة الافتراضية بالإضافة إلى مجمعات الخلفية، إعدادات HTTP، المستمعين، قواعد التوجيه حسب الأولويات، وشهادة TLS (أو مرجع Key Vault معتمد). فتح المنفذ 443 فقط لا يضبط HTTPS.

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

## 📊 المراقبة والرصد

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

### مقاييس وتنبيهات مخصصة
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

## 🔧 تكوينات بيئية خاصة

### ملفات المعلمات للبيئات المختلفة
الملفان أدناه هما **أمثلة بديلة لملفات المعلمات**. azd لا يختار تلقائيًا `main.parameters.dev.json` أو `main.parameters.prod.json` بحسب اسم البيئة. استخدم `main.parameters.json` الفعلي مع الاستبدالات البيئية (مثل `${APP_SERVICE_SKU=B1}`)، وأعلن/استخدم كل معلمة في Bicep.

مثال محتويات `infra/main.parameters.dev.json`:

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

مثال محتويات `infra/main.parameters.prod.json`:

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

### توفير الموارد المشروط
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
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

توفير البنية التحتية لا ينشر كود تطبيقك. شغل الفحوصات التطبيقية فقط بعد `azd deploy`/`azd up`، واستخدم `/health` فقط إذا كان تطبيقك يدعمه. سكربتات النشر ARM تنشئ موارد Azure وتحتاج إلى هوية إضافية، إصدارات بيئة تشغيل مدعومة، وأذونات؛ ليست اختبارات وحدة محلية.

## 🧪 معاينة وتحقق البنية التحتية (جديد)

### معاينة تغييرات البنية التحتية قبل النشر

ميزة `azd provision --preview` تتيح لك **محاكاة توفير البنية التحتية** قبل نشر الموارد فعليًا. هي مشابهة روحيًا لـ `terraform plan` أو `bicep what-if`، مما يمنحك **عرضًا تجريبيًا** للتغييرات التي سيتم إجراؤها على بيئة Azure الخاصة بك.

#### 🛠️ ما الذي تفعله
- **تحلل قوالب IaC الخاصة بك** (Bicep أو Terraform)
- **تعرض معاينة تغييرات الموارد**: الإضافات، الحذوفات، التحديثات
- **لا تطبق تغييرات البنية التحتية المقترحة من المزود** — تحقق أولاً من خطافات المشروع؛ قد يكون للسكريبتات تأثيرات جانبية والمعاينة لا تزال تتطلب أذونات Azure

#### حالات الاستخدام
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

هذا الأمر يساعدك على:
- **التحقق من صحة تغييرات البنية التحتية** قبل الالتزام بالموارد
- **اكتشاف الأخطاء في التكوين مبكرًا** في دورة التطوير
- **التعاون بأمان** في بيئات الفرق
- **ضمان نشرات بأقل امتيازات** بدون مفاجآت

هو مفيد بشكل خاص عندما:
- العمل مع بيئات متعددة الخدمات معقدة
- إجراء تغييرات على البنية التحتية الإنتاجية
- التحقق من صحة تعديلات القوالب قبل الموافقة على طلب السحب
- تدريب أعضاء الفريق الجدد على أنماط البنية التحتية

### مثال إخراج المعاينة
يختلف إخراج المعاينة الدقيق بين المزود وهيكل المشروع، لكن النتيجة يجب أن تحدد بوضوح التغييرات المقترحة قبل تطبيق أي شيء.

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

## �🔄 تحديثات وترحيل الموارد

### تحديثات الموارد الآمنة
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

### ترحيل قواعد البيانات
**نمط سكربت نشر غير مكتمل:** يتطلب هوية مخصصة مهيأة حيثما يلزم، بيئة Azure CLI مدعومة، أدوات ترحيل متوفرة، دليل/تهيئة ترحيل مزودة، واتصال بقاعدة البيانات. لا يمكن تنفيذه فقط بلصق المورد في القالب.

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

## 🎯 أفضل الممارسات

### 1. قواعد تسمية الموارد
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. استراتيجية الوسوم
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

### 3. التحقق من صحة المعلمات
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

- [التخطيط قبل النشر](../chapter-06-pre-deployment/capacity-planning.md) - تحقق من توفر الموارد
- [مشاكل شائعة](../chapter-07-troubleshooting/common-issues.md) - استكشاف مشكلات البنية التحتية وإصلاحها
- [دليل التصحيح](../chapter-07-troubleshooting/debugging.md) - تصحيح مشكلات التزويد
- [اختيار SKU](../chapter-06-pre-deployment/sku-selection.md) - اختيار مستويات الخدمة المناسبة

## موارد إضافية

- [توثيق Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [قوالب مدير موارد Azure](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [مركز هندسة Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [إطار عمل Azure للهندسة الجيدة](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**التنقل**
- **الدرس السابق**: [دليل النشر](deployment-guide.md)
- **الدرس التالي**: [تخطيط السعة](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->