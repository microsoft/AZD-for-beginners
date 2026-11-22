# AZD کے ساتھ ایزور وسائل کی فراہمی

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [نئے شروع کرنے والوں کے لیے AZD](../../README.md)
- **📖 موجودہ باب**: باب 4 - کوڈ کے طور پر انفراسٹرکچر اور تعیناتی
- **⬅️ پچھلا**: [تعیناتی گائیڈ](deployment-guide.md)
- **➡️ اگلا باب**: [باب 5: ملٹی ایجنٹ AI حل](../../examples/retail-scenario.md)
- **🔧 متعلقہ**: [باب 6: پیشگی تعیناتی کی تصدیق](../chapter-06-pre-deployment/capacity-planning.md)

## تعارف

یہ گائیڈ ایزور ڈویلپر CLI کے ساتھ اس میں شامل بائیسپ اور ٹیرافارم فراہم کنندگان کا استعمال کرتے ہوئے ایزور وسائل کی فراہمی اور انتظام کا احاطہ کرتی ہے۔

> کا جائزہ لیا گیا `azd 1.37.2` (نومبر 2026) کے مطابق۔ جب تک بصراحت بیان نہ کیا جائے، بائسک، ٹیریفارم، اور اسکرپٹ کی مثالیں **تشریحی ٹکڑے** ہیں، مکمل ٹیمپلیٹ نہیں۔ انہیں اس پروجیکٹ میں ضم کریں جو حوالے دیے گئے پیرامیٹرز، ماڈیولز، شناختیں، نیٹ ورکنگ، اور ایپلیکیشن کوڈ فراہم کرتا ہے۔ اس جائزے میں Azure کی فراہمی عملدرآمد نہیں کی گئی۔

## تعلیمی مقاصد

اس رہنما کو مکمل کرکے، آپ مندرجہ ذیل حاصل کریں گے:
- انفرسٹرکچر از کوڈ کے اصولوں میں مہارت اور Azure ریسورس کی فراہمی
- Azure Developer CLI کی طرف سے سپورٹ کیے گئے متعدد IaC فراہم کنندگان کو سمجھیں
- عام ایپلیکیشن آرکیٹیکچرز کے لیے بائسک ٹیمپلیٹس کو ڈیزائن اور نافذ کریں
- ریسورس پیرامیٹرز، متغیرات، اور ماحولیاتی مخصوص ترتیبات کو تشکیل دیں
- نیٹ ورکنگ اور سیکیورٹی سمیت جدید انفراسٹرکچر کے نمونے نافذ کریں
- ریسورس لائف سائیکل، اپ ڈیٹس، اور انحصار حل کرنے کا انتظام کریں

## تعلیمی نتائج

مکمل کرنے پر، آپ کر سکیں گے:
- بائسک اور ARM ٹیمپلیٹس کا استعمال کرتے ہوئے Azure کی انفراسٹرکچر کو ڈیزائن اور فراہم کریں
- مناسب ریسورس انحصاریوں کے ساتھ پیچیدہ ملٹی سروس آرکیٹیکچرز کو تشکیل دیں
- متعدد ماحولیاتی نظام اور ترتیب کے لیے پیرامیٹرائزڈ ٹیمپلیٹس نافذ کریں
- انفراسٹرکچر کی فراہمی کے مسائل کو حل کریں اور تعیناتی کی ناکامیوں کو رفع کریں
- انفراسٹرکچر کے ڈیزائن میں Azure Well-Architected Framework کے اصولوں کو نافذ کریں
- انفراسٹرکچر اپ ڈیٹس کا انتظام اور انفراسٹرکچر ورژننگ حکمت عملیوں کو نافذ کریں

## انفراسٹرکچر کی فراہمی کا جائزہ

Azure Developer CLI متعدد Infrastructure as Code (IaC) فراہم کنندگان کو سپورٹ کرتا ہے:
- **بائسک** (تجویز کردہ) - Azure کی ڈومین مخصوص زبان
- **ARM ٹیمپلیٹس** - بائسک کو ARM میں مرتب کیا جاتا ہے؛ خام ARM JSON کوئی الگ بلٹ ان `infra.provider` نہیں ہے
- **Terraform** - ملٹی کلاؤڈ انفراسٹرکچر کا آلہ
- **ایکسٹینشن فراہم کنندگان** - الگ انسٹال کردہ فراہم کنندہ ایکسٹینشن اور اس کی دستاویزی ترتیب کی ضرورت ہوتی ہے؛ کسی بھی فراہم کنندہ سٹرنگ کو سپورٹ کیا جائے گا، یہ فرض نہ کریں

## Azure ریسورسز کو سمجھنا

### ریسورس ہائیرارکی
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### ایپلیکیشنز کے لیے عام Azure سروسز
- **کمپیوٹ**: ایپ سروس، کنٹینر ایپس، فنکشنز، ورچوئل مشینیں
- **اسٹوریج**: اسٹوریج اکاؤنٹ، کاسموس ڈی بی، SQL ڈیٹابیس، پوسٹگری ایس کیو ایل
- **نیٹ ورکنگ**: ورچوئل نیٹ ورک، ایپلیکیشن گیٹ وے، CDN
- **سیکیورٹی**: کی ویالٹ، ایپلیکیشن انسائٹس، لاگ اینالٹکس
- **AI/ML**: Azure AI سروسز، Azure OpenAI، Azure مشین لرننگ

## بائسک انفراسٹرکچر ٹیمپلیٹس

### بنیادی بائسک ٹیمپلیٹ کی ساخت
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

مکمل azd پروجیکٹ کے لیے، اس ماڈیول کو سبسکرپشن-اسکوپڈ `infra/main.bicep` سے کال کریں جو ایک ٹیگ شدہ ریسورس گروپ بنائے اور اس کا اسکوپ پاس کرے۔ `environmentName`/`location` کو `main.parameters.json` میں میچ کریں۔ `azd-service-name: web` ٹیگ ریسورس کو `services.web` کے ساتھ جوڑتا ہے؛ محض من مانی آؤٹ پٹ نام سروس ڈسکوری کو تشکیل نہیں دیتے۔

### جدید بائسک پیٹرنز

#### ماڈیولر انفراسٹرکچر
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

#### مشروط ریسورس کی تخلیق
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

## 🌐 azd کے ساتھ Terraform کا استعمال

بائسک azd کا ڈیفالٹ ہے، لیکن azd **Terraform** کو بھی سپورٹ کرتا ہے—یہ مفید ہے اگر آپ کی ٹیم پہلے ہی اس کو معیاری کرے یا آپ متعدد کلاؤڈ انفراسٹرکچر کا انتظام کرتے ہوں۔ azd ورک فلو (`azd up`, `azd provision`, `azd down`) یکساں ہے؛ صرف انفراسٹرکچر زبان اور فولڈر لے آؤٹ بدلتی ہے۔

### azd کو Terraform استعمال کرنے کے لیے کہیں

Terraform فراہم کنندہ کی طرف اشارہ کرتے ہوئے `infra` سیکشن کو `azure.yaml` میں شامل کریں:

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

### Terraform فولڈر کی ترتیب

Terraform فراہم کنندہ کے ساتھ، آپ کا `infra/` فولڈر Bicep کے بجائے `.tf` فائلیں استعمال کرتا ہے:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### ایک `main.tf` ٹکڑا

یہ صرف ایک resource group اور پلان بناتا ہے، ایک deployable سروس نہیں۔ آپ کو ان پٹ متغیرات، ایک موافق `azurerm` فراہم کنندہ، ویب ایپ، اور اس کے سروس ٹیگ/ resource-نام کا میپنگ بھی بیان کرنا ہوگی۔

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

### azd کیسے آپ کے Terraform آؤٹ پٹ سے جڑتا ہے

azd Terraform **outputs** کو ماحول کی قدروں میں پڑھتا ہے۔ یہ ٹکڑا فرض کرتا ہے کہ آپ نے `azurerm_linux_web_app.web` تعریف کر رکھی ہے؛ سروس کی دریافت ابھی بھی ایک مماثل resource name یا `azd-service-name` ٹیگ کا تقاضا کرتی ہے:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **اہم:** azd وسائل کو ماحول کے مطابق ٹریک کرنے کے لیے `azd-env-name` ٹیگ اور `AZURE_*` آؤٹ پٹس استعمال کرتا ہے۔ ہمیشہ اپنے resource group کو `"azd-env-name" = var.environment_name` سے ٹیگ کریں تاکہ `azd down` سب کچھ تلاش کر کے ہٹا سکے۔

### Terraform کے ساتھ تعیناتی کریں

کمانڈز بالکل Bicep کے جیسے ہی ہیں:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **پیشگی شرط:** Terraform انسٹال ہونا چاہیے اور آپ کے `PATH` پر ہونا چاہیے۔ azd Terraform *workflow* کو سنبھالتا ہے لیکن Terraform آپ کے لیے انسٹال نہیں کرتا۔ ریاست کے لیے، azd مقامی ریاست کو بطور ڈیفالٹ استعمال کرتا ہے؛ ٹیموں کے لیے، ایک remote backend (مثلاً Azure Storage backend) کو `provider.tf` میں ترتیب دیں۔

مکمل، چلانے کے قابل Terraform پر مبنی اسٹارٹرز کے لیے، [Awesome AZD gallery](https://azure.github.io/awesome-azd/) دیکھیں اور Terraform کے لیے فلٹر کریں، یا سرکاری [azd Terraform documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd) ملاحظہ کریں۔

## 🧩 دیگر انفراسٹرکچر ٹولز

Pulumi azd 1.37.2 کا بلٹ-ان provisioning فراہم کنندہ نہیں ہے۔ صرف `infra.provider: pulumi` سیٹ کرنے سے کام کرنے والا انضمام قائم نہیں ہوتا، اور `azd env new` خود بخود Pulumi stack نہیں بناتا/منتخب کرتا۔ اگر آپ کوئی اور IaC ٹول استعمال کرتے ہیں، تو توثیق شدہ فراہم کنندہ توسیع کی دستاویزات پر عمل کریں یا اپنی ورک فلو میں اس کا لائف سائیکل واضح طور پر منظم کریں۔ یہ کورس Pulumi فراہم کنندہ نہیں فراہم کرتا اور نہ اس کی تصدیق کرتا ہے۔

## 🎯 اپنی سروس کے لیے ہوسٹ کا انتخاب

`host` فیلڈ `azure.yaml` میں فیصلہ کرتی ہے کہ آپ کا کوڈ کہاں چلتا ہے۔ azd کئی ہوسٹ کی حمایت کرتا ہے — صحیح انتخاب انفراسٹرکچر زبان سے زیادہ اہم ہے۔ یہاں ایک شروعاتی دوستانہ موازنہ ہے:

| `host` ویلیو | بہترین برائے | کیوں |
|--------------|----------|-----|
| `appservice` | روایتی ویب ایپس اور APIs | سب سے آسان PaaS؛ کسی کنٹینر کی ضرورت نہیں |
| `staticwebapp` | فرنٹ اینڈ SPAs (React, Vue, Angular) | عالمی CDN + مفت SSL، بلٹ-ان API سپورٹ |
| `function` | ایونٹ پر مبنی اور سرورلیس ورک لوڈز | صفر تک اسکیل، ادائیگی فی عمل درآمد |
| `containerapp` | کنٹینرائزڈ مائیکروسروسز | سرورلیس کنٹینرز، صفر تک اسکیل، بلٹ-ان انگریس |
| `aks` | پیچیدہ آرکیسٹریشن کی ضروریات | جب واقعی ضرورت ہو مکمل Kubernetes کنٹرول |
| `springapp` | موجودہ Azure Spring Apps تعیناتیاں | پرانا ہدف؛ سروس 31 مارچ 2028 کو بند ہو جائے گی اور نئے صارفین کے لیے دستیاب نہیں ہوگی |

### AKS تک کب پہنچنا چاہیے

**ایژور کوبرنیٹس سروس (`host: aks`)** آپ کو کوبرنیٹس کی مکمل طاقت فراہم کرتی ہے—کسٹم کنٹرولرز، سروس میشز، پیچیدہ نیٹ ورکنگ، اور باریک بینی سے شیڈولنگ۔ یہ طاقت آپریشنل اضافی کام کے ساتھ آتی ہے: آپ نوڈ پولز، اپگریڈز، اور کلسٹر نیٹ ورکنگ کا انتظام کرتے ہیں۔

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **اگر ممکن ہو تو آسان طریقے سے شروع کریں۔** زیادہ تر مائیکرو سروسز کے لیے، **کنٹینر ایپس** آپ کو کنٹینرز، آٹو اسکیلنگ، اور صفر تک اسکیل کرنے کی سہولت دیتی ہے بغیر کلسٹر کو منظم کیے۔ AKS کا انتخاب صرف تب کریں جب آپ کو کوبرنیٹس کی مخصوص خصوصیات کی ضرورت ہو۔

### ایژور اسپرنگ ایپس کب استعمال کریں

**ایژور اسپرنگ ایپس (`host: springapp`)** ایک مینیجڈ رن ٹائم ہے جو خاص طور پر اسپرنگ بوٹ کے لیے بنایا گیا ہے۔ یہ سروس ڈسکوری، کنفیگ سرور، اور بلیو-گرین ڈیپلائمنٹ کو ہینڈل کرتا ہے تاکہ جاوا ٹیمیں اپنی انفراسٹرکچر کو خود نہ چلائیں۔

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> نئے ابتدائی منصوبے کے لیے ایژور اسپرنگ ایپس کو منتخب نہ کریں: یہ نئے صارفین کے لیے بند ہے اور [31 مارچ 2028 کو ریٹائر ہو جائے گا](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). ترجیح دیں سپورٹڈ متبادل جیسے کنٹینر ایپس اور موجودہ ڈپلائرز کے لیے مائیگریشن کی منصوبہ بندی کریں۔

## 🗃️ ڈیٹا بیس پروویژننگ

### کوسموس ڈی بی
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

### پوسٹگری ایس کیو ایل
**فراگمنٹ کے لیے ضروریات:** `@secure() param databasePassword string` کا اعلان کریں اور ایک مضبوط فراہم کردہ ویلیو استعمال کریں۔ یا تو پبلک رسائی منتخب کریں **یا** نیچے دیے گئے ڈیلیگیٹڈ سب نیٹ/پرائیوٹ DNS کو مربوط کریں؛ یہ دونوں اسنیپٹس خود بخود آپس میں کنیکٹ نہیں ہوتے۔

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

`0.0.0.0` رول ایژور سروسز سے آپ کی اپنی سبسکرپشن سے باہر تعلقات کی اجازت دیتا ہے۔ یہ پرائیوٹ نیٹ ورکنگ نہیں ہے؛ اصلی ورک لوڈز کے لیے محدود شدہ نیٹ ورک ڈیزائن کو ترجیح دیں۔

## 🔒 سیکیورٹی اور سیکریٹس مینجمنٹ

### کی ولٹ انٹیگریشن
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

### مینیجڈ شناخت کی تشکیل
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

سسٹم-اسائنڈ شناخت کے لیے، `AZURE_CLIENT_ID` کو اس کے پرنسپل ID پر سیٹ نہ کریں۔ یوزر-اسائنڈ شناخت اس کا **کلائنٹ ID** استعمال کرتی ہے، نا کہ آئیڈینٹیٹی/پرنسپل ID۔ کی ولٹ ریفرنس کو بھی ایپ کی شناخت کے والٹ رول اسائنمنٹ اور نیٹ ورک رسائی کی ضرورت ہوتی ہے۔

## 🌍 نیٹ ورکنگ اور کنیکٹوٹی

### ورچوئل نیٹ ورک کی تشکیل
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

### ایپلیکیشن گیٹ وے بذریعہ SSL
**نامکمل آرکیٹیکچر فراگمنٹ، تعینات کرنے کے قابل گیٹ وے نہیں:** VNet میں مخصوص `gateway-subnet`، بیک اینڈ پولز، HTTP سیٹنگز، لسنرز، ترجیحات کے ساتھ راؤٹنگ رولز، اور TLS سرٹیفیکیٹ (یا مجاز کی ولٹ ریفرنس) شامل کریں۔ صرف پورٹ 443 کھولنے سے HTTPS مرتب نہیں ہوتا۔

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

## 📊 مانیٹرنگ اور مشاہدہ کاری

### ایپلیکیشن انسائٹس
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

### کسٹم میٹرکس اور الرٹس
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

## 🔧 ماحول مخصوص ترتیبات

### مختلف ماحول کے لیے پیرامیٹر فائلیں
نیچے دی گئی دو فائلیں **متبادل پیرامیٹر-فائل مثالیں** ہیں۔ azd خود بخود `main.parameters.dev.json` یا `main.parameters.prod.json` کو ماحول کے نام سے منتخب نہیں کرتا۔ حقیقی `main.parameters.json` استعمال کریں ماحول کی تبدیلیوں کے ساتھ (مثال کے طور پر `${APP_SERVICE_SKU=B1}`)، اور ہر پیرامیٹر کو بائسک میں اعلان/استعمال کریں۔

`infra/main.parameters.dev.json` کے لیے مثال مواد:

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

`infra/main.parameters.prod.json` کے لیے مثال مواد:

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

### مشروط وسائل کی فراہمی
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

## 🚀 جدید پروویژننگ کے نمونے

### کثیرالخطہ تعیناتی
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

### انفراسٹرکچر ٹیسٹنگ
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

بنیادی ڈھانچہ فراہم کرنا آپ کے ایپلیکیشن کوڈ کو تعینات نہیں کرتا۔ ایپلیکیشن چیکس کو صرف `azd deploy`/`azd up` کے بعد چلائیں، اور `/health` کا استعمال صرف اس وقت کریں اگر آپ کی ایپ اسے نافذ کرتی ہے۔ ARM تعیناتی اسکرپٹ Azure وسائل بناتے ہیں اور اضافی شناخت، معاون رن ٹائم ورژنز، اور اجازتوں کی ضرورت ہوتی ہے؛ یہ مقامی یونٹ ٹیسٹ نہیں ہیں۔

## 🧪 بنیادی ڈھانچہ کا پیش نظارہ اور تصدیق (نیا)

### تعیناتی سے پہلے بنیادی ڈھانچے کی تبدیلیوں کا پیش نظارہ کریں

`azd provision --preview` خصوصیت آپ کو **بنیادی ڈھانچہ کی فراہمی کی نقالی کرنے** دیتی ہے اس سے پہلے کہ وسائل حقیقت میں تعینات کیے جائیں۔ یہ `terraform plan` یا `bicep what-if` کے جذبے جیسا ہے، آپ کو Azure ماحول میں کی جانے والی تبدیلیوں کا **خاکہ پیش نظارہ** فراہم کرتا ہے۔

#### 🛠️ یہ کیا کرتا ہے
- **آپ کے IaC سانچوں کا تجزیہ کرتا ہے** (Bicep یا Terraform)
- **وسائل کی تبدیلیوں کا پیش نظارہ دکھاتا ہے**: اضافہ، حذف، اپ ڈیٹ
- **پروائیڈر کی تجویز کردہ بنیادی ڈھانچے کی تبدیلیوں کو لاگو نہیں کرتا** — پہلے منصوبے کے ہکس کا معائنہ کریں؛ اسکرپٹ کے ضمنی اثرات ہو سکتے ہیں اور پیش نظارہ اب بھی Azure اجازتوں کا متقاضی ہے

#### استعمال کے کیسز
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

یہ کمانڈ آپ کی مدد کرتا ہے:
- **وسائل کو عملی جامہ پہنانے سے پہلے بنیادی ڈھانچے کی تبدیلیوں کی تصدیق کریں**
- **ترقیاتی مرحلے میں غلط کنفیگریشنز کو جلد پکڑیں**
- **ٹیم کے ماحول میں محفوظ تعاون کریں**
- **کم از کم مراعات کے ساتھ تعیناتیاں یقینی بنائیں بغیر حیرانی کے**

یہ خاص طور پر مفید ہے جب:
- پیچیدہ کثیر الخدمی ماحول کے ساتھ کام کرنا
- پیداوار کے بنیادی ڈھانچے میں تبدیلیاں کرنا
- PR منظوری سے پہلے سانچے کی ترامیم کی تصدیق کرنا
- نئے ٹیم ممبران کو بنیادی ڈھانچے کے اندازوں کی تربیت دینا

### پیش نظارہ کی مثال والی آؤٹ پٹ
بالکل پیش نظارہ آؤٹ پٹ پروائیڈر اور منصوبے کی ساخت کے مطابق مختلف ہو سکتی ہے، لیکن نتیجہ واضح طور پر مجوزہ تبدیلیوں کی نشاندہی کرنی چاہیے اس سے پہلے کہ کچھ بھی لاگو کیا جائے۔

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

## �🔄 وسائل کی اپ ڈیٹس اور مائیگریشنز

### محفوظ وسائل کی اپ ڈیٹس
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

### ڈیٹا بیس کی مائیگریشنز
**نامکمل تعیناتی اسکرپٹ کا نمونہ:** جہاں ضرورت ہو وہاں ایک تشکیل شدہ صارف تفویض کردہ شناخت، معاون Azure CLI رن ٹائم، دستیاب مائیگریشن آلات، فراہم کردہ مائیگریشن ڈائریکٹری/ترتیب، اور ڈیٹا بیس رابطہ کی ضرورت ہے۔ اسے صرف اس وسائل کو سانچے میں چسپاں کرکے قابل عمل نہیں بنایا جا سکتا۔

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

## 🎯 بہترین طریقے

### 1. وسائل کے نام رکھنے کے اصول
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. ٹیگنگ حکمت عملی
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

### 3. پیرامیٹر کی تصدیق
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

### 4. نتائج کی تنظیم
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

## اگلے اقدامات

- [Pre-deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - وسائل کی دستیابی کی تصدیق کریں
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - بنیادی ڈھانچے کے مسائل کو حل کریں
- [خرابی دور کرنے کی گائیڈ](../chapter-07-troubleshooting/debugging.md) - پروویژننگ کے مسائل کو حل کریں
- [SKU کا انتخاب](../chapter-06-pre-deployment/sku-selection.md) - مناسب سروس سطحیں منتخب کریں

## اضافی وسائل

- [Azure Bicep دستاویزات](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager ٹیمپلیٹس](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure آرکیٹیکچر سینٹر](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure بہترین آرکیٹیکچر کا فریم ورک](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**نیویگیشن**
- **پچھلا سبق**: [تعییناتی گائیڈ](deployment-guide.md)
- **اگلا سبق**: [صلاحیت کی منصوبہ بندی](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->