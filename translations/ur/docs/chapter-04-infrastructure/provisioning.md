# AZD کے ساتھ Azure وسائل کی پروویژننگ

**باب کے نیویگیشن:**
- **📚 کورس ہوم**: [نوآموزوں کے لیے AZD](../../README.md)
- **📖 موجودہ باب**: باب 4 - انفرا اسٹرکچر بطور کوڈ اور تعیناتی
- **⬅️ پچھلا:** [تعیناتی رہنمائی](deployment-guide.md)
- **➡️ اگلا باب:** [باب 5: ملٹی ایجنٹ AI حل](../../examples/retail-scenario.md)
- **🔧 متعلقہ:** [باب 6: پری-ڈپلائمنٹ ویلیڈیشن](../chapter-06-pre-deployment/capacity-planning.md)

## تعارف

یہ جامع رہنما Azure ڈویلپر CLI کا استعمال کرتے ہوئے Azure وسائل کی پروویژننگ اور انتظام کے بارے میں ہر وہ چیز شامل کرتا ہے جو آپ کو جاننی چاہیے۔ بنیادی وسائل کی تخلیق سے لے کر بیسیپ، ARM ٹیمپلیٹس، ٹیریفارم، اور پولمی کے ذریعے جدید انٹرپرائز گریڈ انفراسٹرکچر آرکیٹیکچرز تک انفرا اسٹرکچر بطور کوڈ (IaC) کے پیٹرنز کو نافذ کرنا سیکھیں۔

## تعلیمی مقاصد

اس رہنما کو مکمل کر کے، آپ:
- انفرا اسٹرکچر بطور کوڈ اصولوں اور Azure وسائل کی پروویژننگ میں مہارت حاصل کریں گے
- Azure ڈویلپر CLI کی جانب سے سپورٹ کیے گئے متعدد IaC پرووائیڈرز کو سمجھیں گے
- عام اطلاقی آرکیٹیکچرز کے لیے بیسیپ ٹیمپلیٹس ڈیزائن اور نافذ کریں گے
- وسائل کے پیرامیٹرز، متغیرات، اور ماحول مخصوص سیٹنگز کو کنفیگر کریں گے
- نیٹ ورکنگ اور سیکیورٹی سمیت جدید انفرا اسٹرکچر پیٹرنز نافذ کریں گے
- وسائل کے لائف سائیکل، اپڈیٹس، اور انحصاری مسائل کو منظم کریں گے

## تعلیمی نتائج

مکمل کرنے کے بعد، آپ قابل ہوں گے:
- بیسیپ اور ARM ٹیمپلیٹس کا استعمال کرتے ہوئے Azure انفراسٹرکچر ڈیزائن اور پروویژن کریں
- مناسب وسائل کی انحصاریوں کے ساتھ پیچیدہ کثیر سروس آرکیٹیکچرز کو کنفیگر کریں
- مختلف ماحول اور کنفیگریشنز کے لیے پیرامیٹرائزڈ ٹیمپلیٹس نافذ کریں
- انفراسٹرکچر پروویژننگ کے مسائل کو تلاش اور تعیناتی کی ناکامیوں کو حل کریں
- انفراسٹرکچر ڈیزائن میں Azure ویل-آرکیٹیکٹڈ فریم ورک اصولوں کو لاگو کریں
- انفراسٹرکچر اپڈیٹس کو منظم کریں اور انفراسٹرکچر ورژننگ حکمت عملیاں نافذ کریں

## انفراسٹرکچر پروویژننگ کا جائزہ

Azure ڈویلپر CLI متعدد انفراسٹرکچر بطور کوڈ (IaC) پرووائیڈرز کی معاونت کرتا ہے:
- **بیسیپ** (تجویز شدہ) - Azure کی ڈومین-اسپیسفک لینگویج
- **ARM ٹیمپلیٹس** - JSON پر مبنی Azure ریسورس مینجر ٹیمپلیٹس
- **ٹیریفارم** - کثیر کلاؤڈ انفراسٹرکچر ٹول
- **پولمی** - پروگرامنگ لینگویجز کے ساتھ جدید انفراسٹرکچر بطور کوڈ

## Azure وسائل کو سمجھنا

### وسائل کی درجہ بندی
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### اطلاقی خدمات کے لیے عام Azure سروسز
- **کمپیوٹ:** ایپ سروس، کنٹینر ایپس، فنکشنز، ورچوئل مشینز
- **اسٹوریج:** اسٹوریج اکاؤنٹ، Cosmos DB، SQL ڈیٹابیس، PostgreSQL
- **نیٹ ورکنگ:** ورچوئل نیٹ ورک، اپلیکیشن گیٹ وے، CDN
- **سیکیورٹی:** کی والٹ، اپلیکیشن انسائٹس، لاگ انالٹکس
- **AI/ML:** Azure AI سروسز، Azure OpenAI، Azure مشین لرننگ

## بیسیپ انفراسٹرکچر ٹیمپلیٹس

### بنیادی بیسیپ ٹیمپلیٹ کی ساخت
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

### جدید بیسیپ پیٹرنز

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

#### مشروط وسائل کی تخلیق
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

## 🌐 azd کے ساتھ ٹیریفارم کا استعمال

بیسیپ azd کا ڈیفالٹ ہے، لیکن azd **ٹیریفارم** کو بھی سپورٹ کرتا ہے—یہ مفید ہے اگر آپ کی ٹیم پہلے ہی اسے معیاری بناتی ہے یا آپ ملٹی کلاؤڈ انفراسٹرکچر کو منظم کرتے ہیں۔ azd کے ورک فلو (`azd up`, `azd provision`, `azd down`) ایک جیسے ہیں؛ صرف انفراسٹرکچر زبان اور فولڈر لے آؤٹ بدلتا ہے۔

### azd کو ٹیریفارم استعمال کرنے کو کہیں

`azure.yaml` میں ایک `infra` سیکشن شامل کریں جو ٹیریفارم پرووائیڈر کی طرف اشارہ کرے:

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

### ٹیریفارم فولڈر لے آؤٹ

ٹیریفارم پرووائیڈر کے ساتھ، آپ کا `infra/` فولڈر بیسیپ کی بجائے `.tf` فائلیں استعمال کرتا ہے:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### ایک مختصر `main.tf`

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

### azd کیسے آپ کے ٹیریفارم آؤٹ پٹ سے جڑتا ہے

azd ٹیریفارم **آؤٹ پٹس** کو پڑھتا ہے تاکہ آپ کے اینڈ پوائنٹس کا پتہ چلے اور ماحول کی قدریں آپ کے ایپ میں واپس منسلک کر سکے۔ آؤٹ پٹ کے نام اہم ہیں—azd مخصوص آؤٹ پٹس تلاش کرتا ہے:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **اہم:** azd "azd-env-name" ٹیگ اور "AZURE_*" آؤٹ پٹس استعمال کرتا ہے تاکہ ہر ماحول کے لیے وسائل کو ٹریک کیا جا سکے۔ ہمیشہ اپنے ریسورس گروپ کو `"azd-env-name" = var.environment_name` کے ساتھ ٹیگ کریں تاکہ `azd down` سب کچھ تلاش کر کے ہٹا سکے۔

### ٹیریفارم کے ساتھ تعیناتی کریں

کمانڈز بیسیپ کے بالکل برابر ہیں:

```bash
azd auth login
azd env new dev
azd provision --preview   # ایزد پس منظر میں 'terraform plan' چلاتا ہے
azd up                    # فراہمی + تعیناتی
azd down --force          # ٹیرraform-منتظم وسائل کو تباہ کرتا ہے
```

> **ضروری شرط:** ٹیریفارم انسٹال ہونا چاہیے اور آپ کے `PATH` میں ہونا چاہیے۔ azd ٹیریفارم *ورک فلو* کو منظم کرتا ہے لیکن ٹیریفارم انسٹال نہیں کرتا۔ اسٹیٹ کے لیے، azd مقامی اسٹیٹ کو بطور ڈیفالٹ استعمال کرتا ہے؛ ٹیموں کے لیے، ایک ریموٹ بیک اینڈ (مثلاً Azure اسٹوریج بیک اینڈ) `provider.tf` میں کنفیگر کریں۔

مکمل اور قابل عمل ٹیریفارم پر مبنی سٹارٹرز کے لیے، [Awesome AZD گیلری](https://azure.github.io/awesome-azd/) کو براؤز کریں اور ٹیریفارم کے لیے فلٹر کریں، یا سرکاری [azd ٹیریفارم ڈاکیومینٹیشن](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd) دیکھیں۔

## 🧩 azd کے ساتھ پولمی کا استعمال

اگر آپ کی ٹیم انفراسٹرکچر کو DSL کی بجائے عمومی مقصد کی زبان (TypeScript، Python، Go، یا C#) میں لکھتی ہے، تو azd **پولمی** کو بھی سپورٹ کرتا ہے۔ جیسا کہ ٹیریفارم کے ساتھ، `azd up` / `azd provision` / `azd down` ورک فلو تبدیل نہیں ہوتا—صرف انفراسٹرکچر ٹولنگ اور فولڈر لے آؤٹ مختلف ہوتے ہیں۔

### azd کو پولمی استعمال کرنے کو کہیں

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

### پولمی فولڈر لے آؤٹ

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### ایک مختصر `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// ہر وسائل کو ٹیگ کریں تاکہ azd انہیں ٹریک کر سکے اور صاف کر سکے
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd یہ آؤٹ پٹ واپس آپ کے ماحول میں پڑھتا ہے
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### اسٹیکس کو azd ماحول کے ساتھ میپ کریں

پولمی ڈپلائمنٹس کو **اسٹیکس** میں منظم کرتا ہے، اور azd ہر azd ماحول کو اسی نام کے پولمی اسٹیک سے میپ کرتا ہے۔ جب آپ `azd env new staging` چلاتے ہیں، azd `staging` پولمی اسٹیک منتخب یا تخلیق کرتا ہے۔ ایک ہی `azd-env-name` ٹیگنگ اور `AZURE_*` آؤٹ پٹ قواعد لاگو ہوتے ہیں تاکہ `azd down` سب کچھ تلاش کر کے ہٹا سکے۔

### پولمی کے ساتھ تعیناتی کریں

```bash
azd auth login
azd env new dev
azd provision --preview   # azd اندر 'pulumi preview' چلاتا ہے
azd up                    # فراہمی + تعیناتی
azd down --force          # 'pulumi destroy' چلاتا ہے
```

> **ضروری شرط:** پولمی انسٹال ہونا چاہیے اور آپ کے `PATH` میں ہونا چاہیے، اور آپ کو اسٹیٹ بیک اینڈ چاہیے (پولمی کلاؤڈ یا خود سے منظم کردہ بیک اینڈ جیسے Azure Blob Storage)۔ azd پولمی *ورک فلو* کو منظم کرتا ہے، انسٹال نہیں۔ سرکاری [azd پولمی ڈاکیومینٹیشن](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd) دیکھیں۔

## 🎯 اپنی سروس کے لیے میزبان کا انتخاب

`azure.yaml` میں `host` فیلڈ فیصلہ کرتا ہے کہ آپ کا کوڈ کہاں چلے گا۔ azd کئی میزبانوں کی حمایت کرتا ہے—صحیح انتخاب زبان سے زیادہ اہم ہے۔ یہاں ابتدائی افراد کے لیے موازنہ:

| `host` کی قیمت | بہترین استعمال | وجہ |
|--------------|----------|-----|
| `appservice` | روایتی ویب ایپس اور APIs | سب سے آسان PaaS؛ کوئی کنٹینرز ضروری نہیں |
| `staticwebapp` | فرنٹ اینڈ SPAs (React, Vue, Angular) | عالمی CDN + مفت SSL، بلٹ ان API سپورٹ |
| `function` | ایونٹ ڈرائیون اور سرور لیس کام | صفر پر پیمائش، فی عمل ادائیگی |
| `containerapp` | کنٹینرائزڈ مائیکرو سروسز | سرورلیس کنٹینرز، صفر پیمائش، بلٹ ان انگریس |
| `aks` | پیچیدہ آرکیسٹریشن کی ضرورتیں | جب واقعی ضرورت ہو تو مکمل کوبرنیٹیز کنٹرول |
| `springapp` | جاوا اسپرنگ بوٹ ایپس | مینیجڈ Azure Spring Apps رن ٹائم جو اسپرنگ کے لیے ٹون کیا گیا ہے |

### AKS کا استعمال کب کریں

**Azure Kubernetes Service (`host: aks`)** آپ کو کوبرنیٹیز کی مکمل طاقت دیتا ہے—کسٹم کنٹرولرز، سروس میشز، پیچیدہ نیٹ ورکنگ، اور باریک بینی سے شیڈولنگ۔ یہ طاقت آپریشنل بوجھ کے ساتھ آتی ہے: آپ کو نوڈ پولز، اپگریڈز، اور کلسٹر نیٹ ورکنگ کا انتظام کرنا ہوتا ہے۔

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **اگر ممکن ہو تو آسان سے شروع کریں۔** زیادہ تر مائیکرو سروسز کے لیے، **کنٹینر ایپس** کنٹینرز، آٹوسکیلنگ، اور صفر پیمائش فراہم کرتی ہیں بغیر کسی کلسٹر کے انتظام کے۔ کوبرنیٹیز کے خصوصی فیچرز کی ضرورت ہو تو ہی AKS منتخب کریں۔

### Azure Spring Apps کا استعمال کب کریں

**Azure Spring Apps (`host: springapp`)** ایک مینیجڈ رن ٹائم ہے جو خاص طور پر اسپرنگ بوٹ کے لیے بنایا گیا ہے۔ یہ سروس ڈسکوری، کنفیگ سرور، اور بلیو-گرین تعیناتی کا انتظام کرتا ہے تاکہ جاوا ٹیمیں اپنی انفراسٹرکچر خود نہ چلائیں۔

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> `springapp` استعمال کریں جب آپ کے پاس موجودہ اسپرنگ بوٹ ایپس ہوں اور آپ ان کے لیے ٹون کیا گیا رن ٹائم چاہتے ہوں۔ نئے کنٹینرائزڈ جاوا ایپس کے لیے جنہیں اسپرنگ کی مخصوص ضرورت نہیں، `containerapp` عام طور پر آسان انتخاب ہے۔

## 🗃️ ڈیٹابیس پروویژننگ

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

## 🔒 سیکورٹی اور سیکریٹس مینجمنٹ

### کی والٹ انٹیگریشن
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

### منیجڈ شناخت کی ترتیب
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

## 🌍 نیٹ ورکنگ اور کنیکٹوٹی

### ورچوئل نیٹ ورک کنفیگریشن
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

### SSL کے ساتھ اپلیکیشن گیٹ وے
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

## 📊 مانیٹرنگ اور آبزرویبیلٹی

### اپلیکیشن انسائٹس
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

### حسب ضرورت میٹرکس اور الرٹس
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

## 🔧 ماحول مخصوص کنفیگریشنز

### مختلف ماحول کے لیے پیرامیٹر فائلیں
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

### مشروط وسائل کی پروویژننگ
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

## 🚀 جدید پروویژننگ پیٹرنز

### کثیر خطہ تعیناتی
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

## 🧪 انفراسٹرکچر پیش نظارہ اور ویلیڈیشن (نیا)

### تعیناتی سے پہلے انفراسٹرکچر تبدیلیوں کا پیش نظارہ کریں

`azd provision --preview` فیچر آپ کو وسائل کی اصل تعیناتی سے پہلے **انفراسٹرکچر پروویژننگ کی مشابہت** کرنے دیتا ہے۔ یہ `terraform plan` یا `bicep what-if` کی طرح ہے، جو آپ کو آپ کے Azure ماحول میں کیے جانے والے تبدیلیوں کا **ڈرائی رن ویو** فراہم کرتا ہے۔

#### 🛠️ یہ کیا کرتا ہے
- **آپ کے IaC ٹیمپلیٹس کا تجزیہ کرتا ہے** (بیسیپ یا ٹیریفارم)
- **وسائل کی تبدیلیوں کا پیش نظارہ دکھاتا ہے**: اضافے، حذف، اپڈیٹس
- **تبدیلیاں لاگو نہیں کرتا** — یہ صرف پڑھنے والا اور محفوظ ہے

#### استعمال کی صورتیں
```bash
# تعیناتی سے پہلے انفراسٹرکچر میں تبدیلیوں کا پیش نظارہ کریں
azd provision --preview

# مخصوص ماحول کے لیے پیش نظارہ کریں
azd provision --preview -e production
```

یہ کمانڈ آپ کی مدد کرتا ہے:
- **وسائل کی تبدیلیوں کی تصدیق** کرنے میں قبل از مہیا کرنا
- **غلط کنفیگریشنز کو جلد پکڑنا** ترقیاتی سائیکل میں
- **ٹیم ماحول میں محفوظ تعاون**
- **کم سے کم مراعات کے تعیناتیاں بغیر حیرانی کے یقینی بنانا**

یہ خاص طور پر مفید ہے جب:
- پیچیدہ کثیر سروس ماحول کے ساتھ کام کر رہے ہوں
- پیداوار انفراسٹرکچر میں تبدیلیاں کر رہے ہوں
- PR کی منظوری سے پہلے ٹیمپلیٹ میں تبدیلیوں کی تصدیق کر رہے ہوں
- نئی ٹیم ممبرز کو انفراسٹرکچر پیٹرنز کی تربیت دے رہے ہوں

### مثال پیش نظارہ آؤٹ پٹ
صحیح پیش نظارہ کا آؤٹ پٹ پرووائیڈر اور پروجیکٹ کی ساخت کے لحاظ سے مختلف ہوتا ہے، لیکن نتیجہ واضح طور پر تجویز کردہ تبدیلیوں کی نشاندہی کرے گا اس سے پہلے کہ کوئی چیز لاگو ہو۔

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

## �🔄 وسائل کی اپ ڈیٹس اور مائگریشنز

### محفوظ وسائل کی اپ ڈیٹس
```bash
# پہلے انفراسٹرکچر میں تبدیلیوں کا پیش نظارہ کریں (سفارش کی جاتی ہے)
azd provision --preview

# پیش نظارہ کی تصدیق کے بعد تبدیلیاں نافذ کریں
azd provision --confirm-with-no-prompt

# واپس لوٹنے کے لیے، انفراسٹرکچر کی تبدیلیوں کو پلٹانے کے لیے Git استعمال کریں:
git revert HEAD  # آخری انفراسٹرکچر کمیٹ کو واپس کریں
azd provision    # پچھلی انفراسٹرکچر کی حالت نافذ کریں
```

### ڈیٹابیس مائگریشنز
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

## 🎯 بہترین طریقے

### 1. وسائل کے لیے نام دینے کے ضوابط
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. ٹیگنگ کی حکمت عملی
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

### 3. پیرامیٹر ویلیڈیشن
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

### 4. آؤٹ پٹ کی تنظیم
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

- [پری-ڈپلائمنٹ پلاننگ](../chapter-06-pre-deployment/capacity-planning.md) - وسائل کی دستیابی کی تصدیق کریں
- [عام مسائل](../chapter-07-troubleshooting/common-issues.md) - انفراسٹرکچر کے مسائل کو حل کریں
- [ڈی بگنگ گائیڈ](../chapter-07-troubleshooting/debugging.md) - پروویژننگ کے مسائل کو ڈی بگ کریں
- [SKU انتخاب](../chapter-06-pre-deployment/sku-selection.md) - مناسب سروس ٹائر منتخب کریں

## اضافی وسائل

- [Azure Bicep دستاویزات](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure ریسورس مینجر ٹیمپلیٹس](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure آرکیٹیکچر سینٹر](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure ویل-آرکیٹیکٹڈ فریم ورک](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**نیویگیشن**
- **پچھلا درس:** [تعیناتی رہنمائی](deployment-guide.md)
- **اگلا درس:** [صلاحیت کی منصوبہ بندی](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->