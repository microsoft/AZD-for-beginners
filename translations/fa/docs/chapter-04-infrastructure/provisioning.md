# پیکربندی منابع Azure با AZD

**ناوبری فصل:**
- **📚 صفحه دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل 4 - زیرساخت به‌عنوان کد و استقرار
- **⬅️ قبلی**: [راهنمای استقرار](deployment-guide.md)
- **➡️ فصل بعد**: [فصل 5: راهکارهای چندعاملۀ هوش مصنوعی](../../examples/retail-scenario.md)
- **🔧 مرتبط**: [فصل 6: اعتبارسنجی پیش از استقرار](../chapter-06-pre-deployment/capacity-planning.md)

## معرفی

این راهنمای جامع همه چیزهایی را که برای پیکربندی و مدیریت منابع Azure با استفاده از Azure Developer CLI نیاز دارید پوشش می‌دهد. یاد بگیرید الگوهای زیرساخت به‌عنوان کد (IaC) را از ایجاد ساده منابع تا معماری‌های پیشرفته سازمانی با استفاده از Bicep، ARM templates، Terraform، و Pulumi پیاده‌سازی کنید.

## اهداف یادگیری

با تکمیل این راهنما شما قادر خواهید بود:
- تسلط بر اصول زیرساخت به‌عنوان کد و تأمین منابع Azure
- درک ارائه‌دهندگان مختلف IaC که توسط Azure Developer CLI پشتیبانی می‌شوند
- طراحی و پیاده‌سازی قالب‌های Bicep برای معماری‌های معمول برنامه‌ها
- پیکربندی پارامترها، متغیرها و تنظیمات مخصوص محیط برای منابع
- پیاده‌سازی الگوهای پیشرفته زیرساخت شامل شبکه و امنیت
- مدیریت چرخه عمر منابع، به‌روزرسانی‌ها و حل وابستگی‌ها

## نتایج یادگیری

پس از اتمام، شما خواهید توانست:
- طراحی و تأمین زیرساخت Azure با استفاده از Bicep و ARM templates
- پیکربندی معماری‌های چندسرویسی پیچیده با وابستگی منابع درست
- پیاده‌سازی قالب‌های پارامتردهی‌شده برای چند محیط و پیکربندی
- عیب‌یابی مسائل تأمین زیرساخت و حل شکست‌های استقرار
- اعمال اصول Azure Well-Architected Framework در طراحی زیرساخت
- مدیریت به‌روزرسانی‌های زیرساخت و پیاده‌سازی استراتژی‌های نسخه‌بندی زیرساخت

## مروری بر تأمین زیرساخت

Azure Developer CLI از چندین ارائه‌دهنده زیرساخت به‌عنوان کد (IaC) پشتیبانی می‌کند:
- **Bicep** (پیشنهادی) - زبان دامنه‌محور Azure
- **ARM Templates** - قالب‌های Azure Resource Manager مبتنی بر JSON
- **Terraform** - ابزار زیرساخت چندابری
- **Pulumi** - زیرساخت به‌عنوان کد مدرن با زبان‌های برنامه‌نویسی

## درک منابع Azure

### سلسله‌مراتب منابع
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### سرویس‌های رایج Azure برای برنامه‌ها
- **محاسبات**: App Service, Container Apps, Functions, Virtual Machines
- **ذخیره‌سازی**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **شبکه**: Virtual Network, Application Gateway, CDN
- **امنیت**: Key Vault, Application Insights, Log Analytics
- **هوش مصنوعی/یادگیری ماشین**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## قالب‌های زیرساختی Bicep

### ساختار پایه قالب Bicep
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

#### ایجاد شرطی منابع
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

Bicep پیش‌فرض azd است، اما azd همچنین از **Terraform** پشتیبانی می‌کند — مفید اگر تیم شما قبلاً روی آن استانداردسازی کرده یا زیرساخت چندابری را مدیریت می‌کنید. جریان کاری azd (`azd up`, `azd provision`, `azd down`) یکسان است؛ تنها زبان زیرساخت و ساختار پوشه تغییر می‌کند.

### به azd بگویید که از Terraform استفاده کند

یک بخش `infra` را به `azure.yaml` اضافه کنید که به ارائه‌دهنده Terraform اشاره کند:

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

با ارائه‌دهنده Terraform، پوشه `infra/` شما از فایل‌های `.tf` به‌جای Bicep استفاده می‌کند:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### یک `main.tf` حداقلی

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

azd خروجی‌های **خروجی‌ها**ی Terraform را می‌خواند تا نقاط انتهایی شما را بفهمد و مقادیر محیط را به برنامه شما سیم‌بندی کند. نام‌های خروجی اهمیت دارند — azd به دنبال نام‌های خاصی می‌گردد:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **مهم:** azd از برچسب `azd-env-name` و خروجی‌های `AZURE_*` برای پیگیری منابع در هر محیط استفاده می‌کند. همیشه گروه منابع خود را با "azd-env-name" = var.environment_name تگ بزنید تا `azd down` بتواند همه چیز را پیدا و حذف کند.

### استقرار با Terraform

دستورات دقیقاً همانند Bicep هستند:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd در پشت صحنه 'terraform plan' را اجرا می‌کند
azd up                    # تأمین و استقرار
azd down --force          # منابع مدیریت‌شده توسط Terraform را حذف می‌کند
```

> **پیش‌نیاز:** Terraform باید نصب شده و در `PATH` شما باشد. azd جریان کاری Terraform را مدیریت می‌کند اما Terraform را برای شما نصب نمی‌کند. برای وضعیت، azd به‌طور پیش‌فرض از وضعیت محلی استفاده می‌کند؛ برای تیم‌ها، یک backend راه دور (مثلاً Azure Storage backend) را در `provider.tf` پیکربندی کنید.

برای استارت‌های مبتنی بر Terraform که قابل اجرا هستند، گالری [Awesome AZD](https://azure.github.io/awesome-azd/) را مرور کنید و فیلتر Terraform را اعمال کنید، یا مستندات رسمی [azd Terraform documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd) را ببینید.

## 🧩 استفاده از Pulumi با azd

اگر تیم شما زیرساخت را با یک زبان عمومی (TypeScript، Python، Go، یا C#) می‌نویسد به‌جای یک DSL، azd همچنین از **Pulumi** پشتیبانی می‌کند. همانند Terraform، جریان کاری `azd up` / `azd provision` / `azd down` بدون تغییر باقی می‌ماند — تنها ابزار و ساختار پوشه متفاوت است.

### به azd بگویید که از Pulumi استفاده کند

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

### ساختار پوشه Pulumi

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### یک `index.ts` حداقلی

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// به هر منبع برچسب بزنید تا azd بتواند آن‌ها را پیگیری و پاک کند
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd این خروجی‌ها را دوباره به محیط شما می‌خواند
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### استک‌ها به محیط‌های azd نگاشت می‌شوند

Pulumi استقرارها را به **استک‌ها** سازمان‌دهی می‌کند، و azd هر محیط azd را به یک استک Pulumi با همان نام نگاشت می‌دهد. وقتی `azd env new staging` را اجرا می‌کنید، azd استک Pulumi به نام `staging` را انتخاب (یا ایجاد) می‌کند. قوانین همان برچسب‌گذاری `azd-env-name` و خروجی‌های `AZURE_*` اعمال می‌شود، بنابراین `azd down` می‌تواند همه چیز را پیدا و حذف کند.

### استقرار با Pulumi

```bash
azd auth login
azd env new dev
azd provision --preview   # azd در پشت‌صحنه 'pulumi preview' را اجرا می‌کند
azd up                    # تأمین + استقرار
azd down --force          # 'pulumi destroy' را اجرا می‌کند
```

> **پیش‌نیاز:** Pulumi باید نصب شده و در `PATH` شما باشد، و به یک backend برای وضعیت نیاز دارید (Pulumi Cloud یا یک backend خودمدیریت مانند Azure Blob Storage). azd جریان کاری Pulumi را مدیریت می‌کند، نه نصب آن را. مستندات رسمی [azd Pulumi documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd) را ببینید.

## 🎯 انتخاب میزبان برای سرویس شما

فیلد `host` در `azure.yaml` تعیین می‌کند که کد شما کجا اجرا شود. azd از چندین میزبان پشتیبانی می‌کند — انتخاب صحیح بیشتر از زبان زیرساخت اهمیت دارد. در اینجا مقایسه‌ای مناسب برای مبتدیان آمده است:

| `host` value | بهترین برای | چرا |
|--------------|----------|-----|
| `appservice` | برنامه‌های وب سنتی و APIها | ساده‌ترین PaaS؛ نیازی به کانتینر نیست |
| `staticwebapp` | SPAهای فرانت‌اند (React, Vue, Angular) | CDN جهانی + SSL رایگان، پشتیبانی API داخلی |
| `function` | بارهای کاری رویدادمحور و بدون سرور | مقیاس تا صفر، پرداخت به ازای اجرا |
| `containerapp` | میکروسرویس‌های کانتینری شده | کانتینرهای بدون‌سرور، مقیاس تا صفر، ورود داخلی |
| `aks` | نیازهای ارکستراسیون پیچیده | کنترل کامل Kubernetes وقتی واقعاً به آن نیاز دارید |
| `springapp` | برنامه‌های Java Spring Boot | runtime مدیریت‌شده Azure Spring Apps تنظیم‌شده برای Spring |

### چه زمانی به سراغ AKS برویم

**Azure Kubernetes Service (`host: aks`)** به شما قدرت کامل Kubernetes را می‌دهد — کنترلرهای سفارشی، سرویس‌مش‌ها، شبکه‌بندی پیچیده و زمان‌بندی دقیق. این قدرت با سربار عملیاتی همراه است: شما مجموعه‌های نود، ارتقاءها و شبکه‌بندی کلاستر را مدیریت می‌کنید.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **اگر می‌توانید ساده‌تر شروع کنید.** برای بیشتر میکروسرویس‌ها، **Container Apps** کانتینرها، مقیاس خودکار و مقیاس تا صفر را بدون مدیریت کلاستر ارائه می‌دهد. تنها زمانی AKS را انتخاب کنید که به ویژگی‌های ویژه Kubernetes نیاز دارید.

### چه زمانی از Azure Spring Apps استفاده کنید

**Azure Spring Apps (`host: springapp`)** یک runtime مدیریت‌شده است که مخصوص Spring Boot طراحی شده است. این سرویس کشف سرویس، config server و استقرار blue-green را مدیریت می‌کند تا تیم‌های Java مجبور به اجرای زیرساخت خود نباشند.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> از `springapp` زمانی استفاده کنید که برنامه‌های Spring Boot موجود داشته باشید و بخواهید یک runtime تنظیم‌شده برای آن‌ها داشته باشید. برای برنامه‌های جدید جاوای کانتینری‌شده بدون نیازهای خاص Spring، اغلب `containerapp` گزینه ساده‌تری است.

## 🗃️ تأمین پایگاه داده

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

## 🔒 امنیت و مدیریت اسرار

### یکپارچه‌سازی Key Vault
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
          name: 'AZURE_CLIENT_ID'
          value: webApp.identity.principalId
        }
      ]
    }
  }
}
```

## 🌍 شبکه و اتصال

### پیکربندی Virtual Network
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

## 📊 نظارت و رصدپذیری

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

### معیارها و اعلان‌های سفارشی
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

## 🔧 پیکربندی‌های خاص محیط

### فایل‌های پارامتر برای محیط‌های مختلف
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

### تأمین شرطی منابع
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

## 🚀 الگوهای پیشرفته تأمین

### استقرار چندمنطقه‌ای
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

## 🧪 پیش‌نمایش و اعتبارسنجی زیرساخت (جدید)

### پیش‌نمایش تغییرات زیرساخت قبل از استقرار

قابلیت `azd provision --preview` به شما امکان می‌دهد قبل از واقعاً استقرار منابع، **تأمین زیرساخت را شبیه‌سازی کنید**. این قابلیت از نظر هدف مشابه `terraform plan` یا `bicep what-if` است و یک **نمای آزمایشی (dry-run)** از تغییراتی که در محیط Azure شما انجام خواهد شد به شما می‌دهد.

#### 🛠️ کاری که انجام می‌دهد
- **الگوهای IaC شما را تحلیل می‌کند** (Bicep یا Terraform)
- **نمای پیش‌نمایشی از تغییرات منابع نشان می‌دهد**: افزودن، حذف، به‌روزرسانی‌ها
- **تغییرات را اعمال نمی‌کند** — حالت فقط‌خواندنی است و اجرای آن ایمن است

#### موارد استفاده
```bash
# پیش‌نمایش تغییرات زیرساخت قبل از استقرار
azd provision --preview

# پیش‌نمایش برای محیط مشخص
azd provision --preview -e production
```

این فرمان به شما کمک می‌کند:
- **تأیید تغییرات زیرساخت** پیش از اختصاص منابع
- **کشف اشکالات پیکربندی زودهنگام** در چرخه توسعه
- **همکاری امن** در محیط‌های تیمی
- **اطمینان از استقرار با کمترین دسترسی لازم** بدون غافلگیری

این ابزار به‌ویژه زمانی مفید است که:
- در محیط‌های پیچیده چندسرویسی کار می‌کنید
- در حال اعمال تغییر در زیرساخت تولید هستید
- قصد دارید تغییرات قالب را قبل از تأیید PR اعتبارسنجی کنید
- آموزش اعضای جدید تیم روی الگوهای زیرساخت

### مثال خروجی پیش‌نمایش
خروجی دقیق پیش‌نمایش بسته به ارائه‌دهنده و ساختار پروژه متفاوت است، اما نتیجه باید به‌وضوح تغییرات پیشنهادی را قبل از اعمال نشان دهد.

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

## �🔄 به‌روزرسانی‌ها و مهاجرت‌های منابع

### به‌روزرسانی‌های ایمن منابع
```bash
# ابتدا تغییرات زیرساخت را پیش‌نمایش کنید (توصیه‌شده)
azd provision --preview

# پس از تأیید پیش‌نمایش، تغییرات را اعمال کنید
azd provision --confirm-with-no-prompt

# برای بازگردانی، از Git برای برگرداندن تغییرات زیرساخت استفاده کنید:
git revert HEAD  # آخرین commit زیرساخت را برگردانید
azd provision    # وضعیت قبلی زیرساخت را اعمال کنید
```

### مهاجرت‌های پایگاه داده
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

## 🎯 بهترین شیوه‌ها

### 1. قراردادهای نام‌گذاری منابع
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. استراتژی برچسب‌گذاری
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

### 3. اعتبارسنجی پارامترها
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

### 4. سازماندهی خروجی‌ها
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

## گام‌های بعدی

- [برنامه‌ریزی پیش‌از استقرار](../chapter-06-pre-deployment/capacity-planning.md) - اعتبارسنجی در دسترس بودن منابع
- [مسائل رایج](../chapter-07-troubleshooting/common-issues.md) - عیب‌یابی مشکلات زیرساخت
- [راهنمای اشکال‌زدایی](../chapter-07-troubleshooting/debugging.md) - اشکال‌زدایی مسائل تأمین
- [انتخاب SKU](../chapter-06-pre-deployment/sku-selection.md) - انتخاب سطح سرویس مناسب

## منابع اضافی

- [مستندات Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**ناوبری**
- **درس قبلی**: [راهنمای استقرار](deployment-guide.md)
- **درس بعدی**: [برنامه‌ریزی ظرفیت](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->