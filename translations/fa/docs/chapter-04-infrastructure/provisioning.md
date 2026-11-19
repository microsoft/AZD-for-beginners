# تامین منابع Azure با AZD

**ناوبری فصل:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل ۴ - زیرساخت به عنوان کد و استقرار
- **⬅️ قبلی**: [راهنمای استقرار](deployment-guide.md)
- **➡️ فصل بعدی**: [فصل ۵: راهکارهای هوش مصنوعی چندعامل](../../examples/retail-scenario.md)
- **🔧 مرتبط**: [فصل ۶: اعتبارسنجی پیش از استقرار](../chapter-06-pre-deployment/capacity-planning.md)

## معرفی

این راهنما به تامین و مدیریت منابع Azure با استفاده از Azure Developer CLI و فراهم‌کننده‌های داخلی Bicep و Terraform می‌پردازد.

> بررسی شده با نسخه `azd 1.37.2` (نوامبر ۲۰۲۶). مگر اینکه خلاف آن ذکر شود، نمونه‌های Bicep، Terraform و اسکریپت‌ها **قطعات نمایشی** هستند و قالب کامل نیستند. آن‌ها را در پروژه‌ای ادغام کنید که پارامترها، ماژول‌ها، هویت‌ها، شبکه و کد برنامه ارجاع‌شده را فراهم می‌کند. تامین منابع Azure در این بررسی اجرا نشده است.

## اهداف یادگیری

با تکمیل این راهنما، شما:
- اصول زیرساخت به عنوان کد و تامین منابع Azure را مسلط می‌شوید
- با چندین فراهم‌کننده IaC که توسط Azure Developer CLI پشتیبانی می‌شوند آشنا می‌شوید
- قالب‌های Bicep برای معماری‌های معمول برنامه را طراحی و پیاده‌سازی می‌کنید
- پارامترهای منابع، متغیرها و تنظیمات خاص محیط را پیکربندی می‌کنید
- الگوهای پیشرفته زیرساخت شامل شبکه و امنیت را پیاده می‌کنید
- چرخه عمر منابع، به‌روزرسانی‌ها و حل وابستگی‌ها را مدیریت می‌کنید

## نتایج یادگیری

پس از اتمام، قادر خواهید بود:
- زیرساخت Azure را با استفاده از قالب‌های Bicep و ARM طراحی و تامین کنید
- معماری‌های پیچیده چندسرویسی با وابستگی‌های صحیح منابع را پیکربندی کنید
- قالب‌های پارامتری برای چندین محیط و پیکربندی پیاده کنید
- مشکلات تامین زیرساخت را عیب‌یابی و خطاهای استقرار را رفع کنید
- اصول چارچوب Azure Well-Architected را در طراحی زیرساخت به کار ببرید
- به‌روزرسانی‌های زیرساخت را مدیریت و استراتژی‌های نسخه‌بندی زیرساخت را پیاده کنید

## مرور کلی تامین زیرساخت

Azure Developer CLI از چندین فراهم‌کننده زیرساخت به عنوان کد (IaC) پشتیبانی می‌کند:
- **Bicep** (توصیه شده) - زبان دامنه مخصوص Azure
- **قالب‌های ARM** - Bicep به ARM کمپایل می‌شود؛ JSON خام ARM یک `infra.provider` جداگانه داخلی نیست
- **Terraform** - ابزار زیرساخت چندابری
- **فراهم‌کننده‌های افزونه‌ای** - نیازمند نصب جداگانه افزونه فراهم‌کننده و پیکربندی مستند آن؛ فرض نکنید هر رشته فراهم‌کننده‌ای پشتیبانی می‌شود

## درک منابع Azure

### سلسله مراتب منابع
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### خدمات معمول Azure برای برنامه‌ها
- **محاسبات**: App Service، Container Apps، Functions، ماشین‌های مجازی
- **حافظه**: Storage Account، Cosmos DB، پایگاه داده SQL، PostgreSQL
- **شبکه**: Virtual Network، Application Gateway، CDN
- **امنیت**: Key Vault، Application Insights، Log Analytics
- **هوش مصنوعی/یادگیری ماشین**: خدمات AI Azure، Azure OpenAI، Azure Machine Learning

## قالب‌های زیرساخت Bicep

### ساختار قالب پایه Bicep
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

برای یک پروژه کامل azd، این ماژول را از یک `infra/main.bicep` دامنه‌شده به اشتراک‌گذاری که یک Resource Group برچسب‌خورده ایجاد می‌کند و دامنه آن را می‌فرستد، فراخوانی کنید. مطابق `environmentName`/`location` در `main.parameters.json` باشید. برچسب `azd-service-name: web` منبع را با `services.web` پیوند می‌دهد؛ تنها نام‌های خروجی دلخواه سرویس کشف را پیکربندی نمی‌کنند.

### الگوهای پیشرفته Bicep

#### زیرساخت مدولار
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

#### ایجاد منابع شرطی
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

## 🌐 استفاده از Terraform با azd

Bicep پیش‌فرض azd است، اما azd همچنین از **Terraform** پشتیبانی می‌کند — مفید اگر تیم شما قبلاً آن را استاندارد کرده یا زیرساخت چندابری را مدیریت می‌کنید. روند کاری azd (`azd up`, `azd provision`, `azd down`) یکسان است؛ فقط زبان زیرساخت و ساختار پوشه تغییر می‌کند.

### به azd بگویید از Terraform استفاده کند

یک بخش `infra` به `azure.yaml` اضافه کنید که به فراهم‌کننده Terraform اشاره کند:

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

### ساختار پوشه Terraform

با فراهم‌کننده Terraform، پوشه `infra/` شما به جای Bicep از فایل‌های `.tf` استفاده می‌کند:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### یک قطعه `main.tf`

این فقط یک Resource Group و برنامه ایجاد می‌کند و سرویس قابل استقرار نیست. همچنین باید متغیرهای ورودی، یک فراهم‌کننده سازگار `azurerm`، برنامه وب و نگاشت برچسب سرویس/نام منبع آن را اعلام کنید.

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

### چگونه azd به خروجی‌های Terraform شما متصل می‌شود

azd مقدارهای **خروجی** Terraform را به مقادیر محیط می‌خواند. این قطعه فرض می‌کند که شما `azurerm_linux_web_app.web` را تعریف کرده‌اید؛ کشف سرویس هنوز نیاز به نام منبع مطابقت‌دهنده یا برچسب `azd-service-name` دارد:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **مهم:** azd از برچسب `azd-env-name` و خروجی‌های `AZURE_*` برای ردیابی منابع در هر محیط استفاده می‌کند. همیشه گروه منبع خود را با `"azd-env-name" = var.environment_name` برچسب‌گذاری کنید تا `azd down` بتواند همه چیز را پیدا و حذف کند.

### استقرار با Terraform

دستورات دقیقاً مانند Bicep هستند:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **پیش‌نیاز:** باید Terraform نصب شده و روی `PATH` شما باشد. azd *روند کاری* Terraform را مدیریت می‌کند اما Terraform را برای شما نصب نمی‌کند. برای وضعیت، azd به طور پیش‌فرض از حالت محلی استفاده می‌کند؛ برای تیم‌ها، یک backend راه دور (برای مثال، یک backend ذخیره‌سازی Azure) را در `provider.tf` پیکربندی کنید.

برای استارترهای کامل و قابل اجرا مبتنی بر Terraform، به [گالری عالی AZD](https://azure.github.io/awesome-azd/) مراجعه کنید و فیلتر را روی Terraform تنظیم کنید، یا مستندات رسمی [azd Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd) را ببینید.

## 🧩 ابزارهای دیگر زیرساخت

Pulumi یک تامین‌کننده تعبیه‌شده در azd 1.37.2 نیست. فقط تنظیم `infra.provider: pulumi` به تنهایی یک یکپارچه‌سازی کاری ایجاد نمی‌کند و `azd env new` به‌طور خودکار یک پشته Pulumi ایجاد/انتخاب نمی‌کند. اگر از ابزار IaC دیگری استفاده می‌کنید، مستندات یک افزونه تامین‌کننده تایید شده را دنبال کنید یا چرخه عمر آن را به طور صریح در روند کاری خود مدیریت کنید. این دوره تامین‌کننده Pulumi را ارائه یا تایید نمی‌کند.

## 🎯 انتخاب میزبان برای سرویس شما

فیلد `host` در `azure.yaml` تعیین می‌کند کد شما کجا اجرا می‌شود. azd چندین میزبان را پشتیبانی می‌کند — انتخاب میزبان مناسب مهم‌تر از زبان زیرساخت است. در اینجا یک مقایسه مبتدی‌پسند است:

| مقدار `host` | بهترین برای | چرا |
|--------------|----------|-----|
| `appservice` | برنامه‌های وب و APIهای سنتی | ساده‌ترین PaaS؛ نیاز به کانتینر ندارد |
| `staticwebapp` | برنامه‌های SPA فرانت‌اند (React, Vue, Angular) | CDN جهانی + SSL رایگان، پشتیبانی داخلی از API |
| `function` | بارهای کاری رویدادمحور و بدون سرور | مقیاس به صفر، پرداخت به ازای اجرا |
| `containerapp` | میکروسرویس‌های کانتینری | کانتینرهای بدون سرور، مقیاس به صفر، ورود داخلی |
| `aks` | نیازهای ارکستراسیون پیچیده | کنترل کامل Kubernetes وقتی واقعاً نیاز دارید |
| `springapp` | استقرارهای موجود Azure Spring Apps | هدف قدیمی؛ سرویس در ۳۱ مارس ۲۰۲۸ بازنشسته می‌شود و برای مشتریان جدید بسته است |

### چه زمانی به سراغ AKS برویم

**Azure Kubernetes Service (`host: aks`)** قدرت کامل Kubernetes را به شما می‌دهد—کنترلرهای سفارشی، مش‌های سرویس، شبکه‌بندی پیچیده و زمان‌بندی دقیق. این قدرت با هزینه عملیاتی همراه است: شما استخرهای نود، به‌روزرسانی‌ها و شبکه‌بندی کلاستر را مدیریت می‌کنید.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **اگر می‌توانید ساده‌تر شروع کنید.** برای اکثر میکروسرویس‌ها، **Container Apps** کانتینر، مقیاس‌گذاری خودکار و مقیاس به صفر را بدون نیاز به مدیریت کلاستر به شما می‌دهد. فقط وقتی ویژگی‌های خاص Kubernetes نیاز دارید از AKS استفاده کنید.

### چه زمانی از Azure Spring Apps استفاده کنیم

**Azure Spring Apps (`host: springapp`)** یک زمان اجرای مدیریت‌شده است که به طور خاص برای Spring Boot ساخته شده است. کشف سرویس، سرور پیکربندی و استقرار آبی-سبز را مدیریت می‌کند تا تیم‌های Java نیازی به اجرای زیرساخت خود نداشته باشند.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> برای پروژه جدید مبتدی Azure Spring Apps را انتخاب نکنید: این سرویس برای مشتریان جدید بسته است و [در ۳۱ مارس ۲۰۲۸ بازنشسته می‌شود](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). ترجیح دهید از جایگزین‌های پشتیبانی‌شده مانند Container Apps استفاده کنید و برای استقرارهای موجود برنامه مهاجرت داشته باشید.

## 🗃️ تامین پایگاه داده

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
**پیش‌نیازهای تکه:** `@secure() param databasePassword string` را اعلام کنید و یک مقدار قوی ارائه‌شده استفاده کنید. دسترسی عمومی را انتخاب کنید **یا** زیرشبکه تفویض‌شده/DNS خصوصی زیر را ادغام کنید؛ این دو قطعه به طور خودکار خودشان را متصل نمی‌کنند.

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

قانون `0.0.0.0` اجازه می‌دهد اتصالات از سرویس‌های Azure فراتر از اشتراک خودتان برقرار شود. این شبکه خصوصی نیست؛ برای بارهای کاری واقعی طراحی شبکه محدود ترجیح داده می‌شود.

## 🔒 امنیت و مدیریت اسرار

### ادغام Key Vault
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

### پیکربندی Managed Identity
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

برای هویت تعیین‌شده توسط سیستم، `AZURE_CLIENT_ID` را روی شناسه اصلی آن تنظیم نکنید. یک هویت تعیین‌شده توسط کاربر از **شناسه کلاینت** خود استفاده می‌کند، نه شناسه شیء/اصلی. مرجع Key Vault همچنین به نقش اختصاص‌یافته به هویت برنامه در مخزن و دسترسی شبکه نیاز دارد.

## 🌍 شبکه و اتصال

### پیکربندی شبکه مجازی
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

### Application Gateway با SSL
**قطعه معماری ناقص، دروازه قابل استقرار نیست:** یک `gateway-subnet` اختصاصی به VNet اضافه کنید به همراه استخرهای پشتیبان، تنظیمات HTTP، شنونده‌ها، قوانین مسیریابی با اولویت‌ها و گواهینامه TLS (یا مرجع مجاز Key Vault). فقط باز کردن پورت ۴۴۳ HTTPS را پیکربندی نمی‌کند.

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

## 📊 پایش و مشاهده‌پذیری

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

### معیارهای سفارشی و هشدارها
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

## 🔧 پیکربندی مخصوص محیط

### فایل‌های پارامتر برای محیط‌های مختلف
دو فایل زیر **مثال‌های فایل پارامتر جایگزین** هستند. azd به طور خودکار `main.parameters.dev.json` یا `main.parameters.prod.json` را بر اساس نام محیط انتخاب نمی‌کند. از `main.parameters.json` واقعی با جایگزینی محیط (برای مثال `${APP_SERVICE_SKU=B1}`) استفاده کنید و هر پارامتر را در Bicep اعلام و مصرف کنید.

محتویات نمونه برای `infra/main.parameters.dev.json`:

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

محتویات نمونه برای `infra/main.parameters.prod.json`:

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

### تأمین شرطی منابع
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

## 🚀 الگوهای پیشرفته تامین منابع

### استقرار چند منطقه‌ای
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

### تست زیرساخت
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

تامین زیرساخت کد برنامه شما را مستقر نمی‌کند. فقط پس از `azd deploy`/`azd up` بررسی‌های برنامه را اجرا کنید و فقط در صورتی که برنامه شما آن را پیاده‌سازی کرده است از `/health` استفاده کنید. اسکریپت‌های استقرار ARM منابع Azure را ایجاد می‌کنند و نیاز به هویت اضافی، نسخه‌های زمان اجرای پشتیبانی‌شده و مجوزها دارند؛ آنها تست واحد محلی نیستند.

## 🧪 پیش‌نمایش و اعتبارسنجی زیرساخت (جدید)

### پیش‌نمایش تغییرات زیرساخت قبل از استقرار

ویژگی `azd provision --preview` به شما اجازه می‌دهد **تامین زیرساخت را شبیه‌سازی کنید** قبل از اینکه واقعاً منابع را مستقر کنید. این به نوعی شبیه به `terraform plan` یا `bicep what-if` است که یک **نمای اجرای خشک** از تغییراتی که در محیط Azure شما ایجاد می‌شوند را می‌دهد.

#### 🛠️ کاری که انجام می‌دهد
- **الگوهای IaC شما را تحلیل می‌کند** (Bicep یا Terraform)
- **یک پیش‌نمایش از تغییرات منابع نشان می‌دهد**: افزودن، حذف، به‌روزرسانی‌ها
- **تغییرات زیرساخت پیشنهادی تامین‌کننده را اعمال نمی‌کند** — ابتدا قلاب‌های پروژه را بررسی کنید؛ اسکریپت‌ها می‌توانند اثرات جانبی داشته باشند و پیش‌نمایش هنوز نیاز به مجوزهای Azure دارد

#### موارد استفاده
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

این فرمان به شما کمک می‌کند:
- **تغییرات زیرساخت را قبل از تعهد منابع اعتبارسنجی کنید**
- **خطاهای پیکربندی را در چرخه توسعه به‌موقع شناسایی کنید**
- **به طور ایمن در محیط‌های تیمی همکاری کنید**
- **اطمینان از استقرارهای حداقل دسترسی بدون شگفتی**

این ویژگی زمانی بسیار مفید است که:
- کار با محیط‌های چندخدمت پیچیده
- ایجاد تغییرات در زیرساخت تولید
- اعتبارسنجی تغییرات الگو قبل از تایید PR
- آموزش اعضای جدید تیم درباره الگوهای زیرساخت

### مثال خروجی پیش‌نمایش
خروجی دقیق پیش‌نمایش بر اساس تامین‌کننده و ساختار پروژه متفاوت است، اما نتیجه باید به طور واضح تغییرات پیشنهادی را قبل از اعمال هر چیزی مشخص کند.

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

## 🔄 به‌روزرسانی‌ها و مهاجرت منابع

### به‌روزرسانی ایمن منابع
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

### مهاجرت پایگاه داده
**الگوی اسکریپت استقرار ناقص:** نیاز به هویت تعیین‌شده توسط کاربر تنظیم‌شده دارد، زمان اجرای پشتیبانی‌شده Azure CLI، ابزارهای مهاجرت موجود، دایرکتوری/پیکربندی مهاجرت تامین‌شده و اتصال به پایگاه داده. این تنها با جایگذاری این منبع در یک الگو اجرایی نیست.

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

## 🎯 بهترین شیوه‌ها

### ۱. قرارداد نام‌گذاری منابع
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### ۲. استراتژی برچسب‌گذاری
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

### ۳. اعتبارسنجی پارامترها
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

### ۴. سازماندهی خروجی‌ها
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

## مراحل بعدی

- [برنامه‌ریزی پیش از استقرار](../chapter-06-pre-deployment/capacity-planning.md) - اعتبارسنجی دسترسی منابع
- [مشکلات رایج](../chapter-07-troubleshooting/common-issues.md) - رفع مشکلات زیرساخت
- [راهنمای اشکال‌زدایی](../chapter-07-troubleshooting/debugging.md) - اشکال‌زدایی مسائل فراهم‌سازی
- [انتخاب SKU](../chapter-06-pre-deployment/sku-selection.md) - انتخاب Tierهای خدمات مناسب

## منابع اضافی

- [مستندات Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [الگوهای Azure Resource Manager](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [مرکز معماری Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [چارچوب مهندسی خوب Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**ناوبری**
- **درس قبلی**: [راهنمای استقرار](deployment-guide.md)
- **درس بعدی**: [برنامه‌ریزی ظرفیت](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->