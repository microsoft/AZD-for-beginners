# SKU انتخاب گائیڈ - صحیح Azure سروس ٹیئرز کا انتخاب

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD برائے مبتدی](../../README.md)
- **📖 موجودہ باب**: باب 6 - پریڈیپلائمنٹ ویلیڈیشن اور منصوبہ بندی
- **⬅️ پچھلا**: [کپیسیٹی پلاننگ](capacity-planning.md)
- **➡️ اگلا**: [پری فلائٹ چیکس](preflight-checks.md)
- **🚀 اگلا باب**: [باب 7: ٹربل شوٹنگ](../chapter-07-troubleshooting/common-issues.md)

## تعارف

یہ جامع گائیڈ آپ کی مدد کرتا ہے کہ مختلف ماحول، ورکلوڈز، اور ضروریات کے لیے بہترین Azure سروس SKUs (اسٹاک کیپنگ یونٹس) منتخب کریں۔ پرفارمنس ضروریات، لاگت کے پہلوؤں، اور توسیع کی ضروریات کا تجزیہ کرنا سیکھیں تاکہ آپ کے Azure Developer CLI ڈپلائمنٹس کے لیے سب سے مناسب سروس ٹیئرز کا انتخاب کیا جا سکے۔

## سیکھنے کے اہداف

اس گائیڈ کو مکمل کرنے کے بعد، آپ:
- Azure SKU کے تصورات، قیمتوں کے ماڈلز، اور فیچر کے اختلافات کو سمجھیں گے
- ترقی، اسٹیجنگ، اور پروڈکشن کے لیے ماحول کے لحاظ سے SKU انتخاب کی حکمت عملیوں میں مہارت حاصل کریں گے
- ورکلوڈ کی ضروریات کا تجزیہ کریں گے اور انہیں مناسب سروس ٹیئرز سے ملائیں گے
- ذہین SKU انتخاب کے ذریعے لاگت کی اصلاح کی حکمت عملی نافذ کریں گے
- SKU انتخاب کے لیے کارکردگی کی جانچ اور تصدیقی تکنیکیں اپنائیں گے
- خودکار SKU سفارشات اور مانیٹرنگ کو ترتیب دیں گے

## سیکھنے کے نتائج

مکمل کرنے کے بعد، آپ قادر ہوں گے کہ:
- ورکلوڈ کی ضروریات اور حدود کی بنیاد پر مناسب Azure سروس SKUs منتخب کریں
- متعدد ماحول کے لیے لاگت مؤثر آرکیٹیکچرز ڈیزائن کریں جس میں مناسب ٹیئر انتخاب ہو
- SKU انتخاب کے لیے کارکردگی کی بنچ مارکنگ اور ویلیڈیشن نافذ کریں
- SKU سفارش اور لاگت کی اصلاح کے لیے خودکار آلات بنائیں
- بدلتی ضروریات کے لیے SKU مائگریشن اور اسکیلنگ حکمت عملیوں کی منصوبہ بندی کریں
- سروس ٹیئر انتخاب میں Azure Well-Architected Framework کے اصول اپنائیں

## مواد کی میز

- [SKU کی سمجھ](#understanding-skus)
- [ماحول کی بنیاد پر انتخاب](#environment-based-selection)
- [سروس-مخصوص ہدایات](#service-specific-guidelines)
- [لاگت کی اصلاح کی حکمت عملی](#cost-optimization-strategies)
- [کارکردگی کے پہلو](#performance-considerations)
- [فوری حوالہ جدول](#quick-reference-tables)
- [ویلیڈیشن ٹولز](#validation-tools)

---

## SKU کی سمجھ

> **مثال دائرہ:** YAML SKU میپس اور نیچے دی گئی کارکردگی کی ترتیبات ڈیزائن نوٹس ہیں، کوئی `azure.yaml` اسکیمہ یا لوڈ ٹول کی ترتیب نہیں۔ بائسک بلاکس متبادل/ٹکڑے ہیں: ان کے پیرامیٹرز اور پیرنٹ وسائل کا اعلان کریں، جب انھیں ملائیں تو منفرد علامتی نام استعمال کریں، اور ماڈیولوں کو کام کرنے والے پروجیکٹ میں مربوط کریں۔ قیمتیں، حدود، اور علاقائی/SKU کی دستیابی کو اپنے سبسکرپشن کے لیے تعیناتی سے پہلے چیک کرنا ضروری ہے۔

### SKUs کیا ہیں؟

SKUs (اسٹاک کیپنگ یونٹس) Azure وسائل کے مختلف سروس ٹیئرز اور کارکردگی کی سطحوں کی نمائندگی کرتے ہیں۔ ہر SKU مختلف پیش کرتا ہے:

- **کارکردگی کی خصوصیات** (CPU، میموری، تھروپٹ)
- **خصوصیت کی دستیابی** (اسکیلنگ کے اختیارات، SLA کی سطحیں)
- **قیمتوں کے ماڈلز** (مصرف کی بنیاد پر، مخصوص گنجائش)
- **علاقائی دستیابی** (تمام SKUs ہر علاقے میں دستیاب نہیں ہوتے)

### SKU انتخاب میں کلیدی عوامل

1. **ورکلوڈ کی ضروریات**
   - متوقع ٹریفک/لوڈ پیٹرن
   - کارکردگی کی ضروریات (CPU، میموری، I/O)
   - اسٹوریج کی ضروریات اور رسائی کے انداز

2. **ماحول کی قسم**
   - ترقی/ٹیسٹنگ بمقابلہ پروڈکشن
   - دستیابی کی ضروریات
   - سیکیورٹی اور تعمیل کی ضروریات

3. **بجٹ کی حدود**
   - ابتدائی لاگت بمقابلہ عملیاتی لاگت
   - مخصوص گنجائش پر رعایتیں
   - آٹو-اسکیلنگ کے لاگت کے اثرات

4. **ترقی کے تخمینے**
   - اسکیل ایبلٹی کی ضروریات
   - مستقبل کی خصوصیات کی ضروریات
   - مائگریشن کی پیچیدگی

---

## ماحول کی بنیاد پر انتخاب

### ترقیاتی ماحول

**ترجیحات**: لاگت کی اصلاح، بنیادی فعالیت، آسان فراہمی/منسوخی

#### تجویز کردہ SKUs
```yaml
# Development environment configuration
environment: development
skus:
  app_service: "F1"          # Free tier
  sql_database: "Basic"       # Basic tier, 5 DTU
  storage: "Standard_LRS"     # Locally redundant
  cosmos_db: "Standard"      # Free tier is an account opt-in, not a SKU
  key_vault: "Standard"      # Standard pricing tier
  application_insights: "workspace-based" # Consumption billing; no Free SKU
```

#### خصوصیات
- **ایپ سروس**: سادہ ٹیسٹنگ کے لیے F1 (فری) یا B1 (بیسک)
- **ڈیٹا بیسز**: کم سے کم وسائل کے ساتھ بنیادی ٹیئر
- **اسٹوریج**: صرف مقامی ردونظمی کے ساتھ معیاری
- **کمپیوٹ**: مشترکہ وسائل قابل قبول ہیں
- **نیٹ ورکنگ**: بنیادی ترتیبات

### اسٹیجنگ/ٹیسٹنگ ماحول

**ترجیحات**: پروڈکشن جیسی ترتیب، لاگت کا توازن، کارکردگی کی جانچ کی صلاحیت

#### تجویز کردہ SKUs
```yaml
# Staging environment configuration
environment: staging
skus:
  app_service: "S1"          # Standard tier
  sql_database: "S2"         # Standard tier, 50 DTU
  storage: "Standard_GRS"    # Geo-redundant
  cosmos_db: "Standard"      # 400 RU/s provisioned
  container_apps: "Consumption" # Pay-per-use
```

#### خصوصیات
- **کارکردگی**: پروڈکشن صلاحیت کا 70-80%
- **خصوصیات**: زیادہ تر پروڈکشن خصوصیات فعال
- **ردونظمی**: کچھ جغرافیائی ردونظمی
- **اسکیلنگ**: جانچ کے لیے محدود آٹو اسکیلنگ
- **مانیٹرنگ**: مکمل مانیٹرنگ سٹیک

### پروڈکشن ماحول

**ترجیحات**: کارکردگی، دستیابی، سیکیورٹی، تعمیل، توسیع پذیری

#### تجویز کردہ SKUs
```yaml
# Production environment configuration
environment: production
skus:
  app_service: "P1V3"        # Premium v3 tier
  sql_database: "P2"         # Premium tier, 250 DTU
  storage: "Standard_GRS"    # Geo-redundant; Premium_GRS is not a storage SKU
  cosmos_db: "Provisioned"   # Dedicated throughput
  container_apps: "Dedicated" # Dedicated environment
  key_vault: "Premium"       # Premium with HSM
```

#### خصوصیات
- **اعلی دستیابی**: 99.9%+ SLA کی ضروریات
- **کارکردگی**: مخصوص وسائل، اعلی تھروپٹ
- **سیکیورٹی**: پریمیم سیکیورٹی خصوصیات
- **اسکیلنگ**: مکمل آٹو اسکیلنگ صلاحیتیں
- **مانیٹرنگ**: جامع مشاہدہ کاری

---

## سروس-مخصوص ہدایات

### Azure App Service

#### SKU فیصلہ میٹرکس

| استعمال کا کیس | تجویز کردہ SKU | وجہ |
|----------|----------------|-----------|
| ترقی/ٹیسٹنگ | F1 (فری) یا B1 (بیسک) | لاگت مؤثر، ٹیسٹنگ کے لیے کافی |
| چھوٹے پروڈکشن ایپس | S1 (معیاری) | کسٹم ڈومینز، SSL، آٹو اسکیلنگ |
| درمیانے درجے کے پروڈکشن ایپس | P1V3 (پریمیم V3) | بہتر کارکردگی، زیادہ خصوصیات |
| زیادہ ٹریفک والی ایپس | P2V3 یا P3V3 | مخصوص وسائل، اعلی کارکردگی |
| مشن-کریٹیکل ایپس | I1V2 (آئیسولیٹڈ V2) | نیٹ ورک آئسولیشن، مخصوص ہارڈویئر |

#### ترتیب کی مثالیں

**ترقی**
```bicep
resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'asp-${environmentName}-dev'
  location: location
  sku: {
    name: 'F1'
    tier: 'Free'
    capacity: 1
  }
  properties: {
    reserved: false
  }
}
```

**پروڈکشن**
```bicep
resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'asp-${environmentName}-prod'
  location: location
  sku: {
    name: 'P1V3'
    tier: 'PremiumV3'
    capacity: 3
  }
  properties: {
    reserved: false
  }
}
```

### Azure SQL Database

#### SKU انتخاب فریم ورک

1. **ڈی ٹی یو (DTU) پر مبنی (ڈیٹا بیس ٹرانزیکشن یونٹس)**
   - **بیسک**: 5 DTU - ترقی/ٹیسٹنگ
   - **معیاری**: S0-S12 (10-3000 DTU) - عمومی مقصد
   - **پریمیم**: P1-P15 (125-4000 DTU) - کارکردگی کے لحاظ سے اہم

2. **vCore پر مبنی** (پروڈکشن کے لیے تجویز کردہ)
   - **جنرل پرپز**: متوازن کمپیوٹ اور اسٹوریج
   - **بزنس کریٹیکل**: کم تاخیر، اعلی IOPS
   - **ہائپر اسکیل**: بہت زیادہ توسیع پذیر اسٹوریج؛ موجودہ سائز کی حدود اور علاقائی حمایت کی تصدیق کریں

#### ترتیب کی مثالیں

```bicep
// Development
resource sqlDatabase 'Microsoft.Sql/servers/databases@2022-05-01-preview' = {
  name: 'db-${environmentName}-dev'
  parent: sqlServer
  location: location
  sku: {
    name: 'Basic'
    tier: 'Basic'
    capacity: 5
  }
  properties: {
    maxSizeBytes: 2147483648 // 2GB
  }
}

// Production
resource sqlDatabase 'Microsoft.Sql/servers/databases@2022-05-01-preview' = {
  name: 'db-${environmentName}-prod'
  parent: sqlServer
  location: location
  sku: {
    name: 'GP_Gen5'
    tier: 'GeneralPurpose'
    family: 'Gen5'
    capacity: 4
  }
  properties: {
    maxSizeBytes: 536870912000 // 500GB
  }
}
```

### Azure Container Apps

#### ماحول کی اقسام

1. **مصرفی بنیاد پر**
   - استعمال کے حساب سے ادائیگی
   - ترقی اور متغیر ورکلوڈز کے لیے موزوں
   - مشترکہ انفراسٹرکچر

2. **مخصوص (ورکلوڈ پروفائلز)**
   - مخصوص کمپیوٹ وسائل
   - متوقع کارکردگی
   - پروڈکشن ورکلوڈز کے لیے بہتر

#### ترتیب کی مثالیں

**ترقی (مصرفی)**
```bicep
resource containerAppEnvironment 'Microsoft.App/managedEnvironments@2022-10-01' = {
  name: 'cae-${environmentName}-dev'
  location: location
  properties: {
    zoneRedundant: false
  }
}

resource containerApp 'Microsoft.App/containerApps@2022-10-01' = {
  name: 'ca-${environmentName}-dev'
  location: location
  properties: {
    managedEnvironmentId: containerAppEnvironment.id
    configuration: {
      ingress: {
        external: true
        targetPort: 80 // nginx listens on 80 by default
      }
    }
    template: {
      containers: [{
        name: 'main'
        image: 'nginx:latest'
        resources: {
          cpu: json('0.25')
          memory: '0.5Gi'
        }
      }]
      scale: {
        minReplicas: 0
        maxReplicas: 1
      }
    }
  }
}
```

**پروڈکشن (مخصوص)**
```bicep
resource containerAppEnvironment 'Microsoft.App/managedEnvironments@2024-03-01' = {
  name: 'cae-${environmentName}-prod'
  location: location
  properties: {
    zoneRedundant: true
    workloadProfiles: [{
      name: 'production-profile'
      workloadProfileType: 'D4'
      minimumCount: 3
      maximumCount: 10
    }]
  }
}
```

زون ردونظمی کے لیے سپورٹڈ ایریا انفراسٹرکچر اور مناسب VNet/سب نیٹ کنفیگریشن بھی درکار ہے جو یہاں شامل نہیں کی گئی۔ یہ مثال تین مخصوص نوڈز کا بجٹ رکھتی ہے؛ کم از کم دو ایپ ریپلیکس کو کراس زون تقسیم کے لیے کنفیگر کریں اور دونوں ریپلیکس اور نوڈز کو زون فیل ہونے کے لیے مناسب سائز دیں۔ دیکھیں [کنٹینر ایپس ریلی ایبلٹی گائیڈنس](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps)۔ اس پروفائل پر ایپ رکھنے کے لیے اس کی `workloadProfileName: 'production-profile'` سیٹ کریں؛ صرف پروفائل بنانا ایپس کو اس پر منتقل نہیں کرتا۔

### Azure Cosmos DB

#### تھروپٹ ماڈلز

1. **مینول پروویژنڈ تھروپٹ**
   - متوقع کارکردگی
   - مخصوص گنجائش پر رعایتیں
   - مستحکم ورکلوڈز کے لیے بہترین

2. **آٹوسکیل پروویژنڈ تھروپٹ**
   - استعمال کی بنیاد پر خودکار اسکیلنگ
   - جو آپ استعمال کریں اس کی ادائیگی (کم از کم کے ساتھ)
   - متغیر ورکلوڈز کے لیے اچھا

3. **سرورلیس**
   - درخواست کے ہر استعمال پر ادائیگی
   - کوئی مخصوص تھروپٹ نہیں
   - ترقی اور وقفے وقفے سے ورکلوڈز کے لیے مثالی

#### SKU مثالیں

```bicep
// Development - Serverless
resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
  name: 'cosmos-${environmentName}-dev'
  location: location
  properties: {
    databaseAccountOfferType: 'Standard'
    locations: [{
      locationName: location
    }]
    capabilities: [{
      name: 'EnableServerless'
    }]
  }
}

// Production - Provisioned with Autoscale
resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
  name: 'cosmos-${environmentName}-prod'
  location: location
  properties: {
    databaseAccountOfferType: 'Standard'
    locations: [
      {
        locationName: location
        failoverPriority: 0
      }
      {
        locationName: secondaryLocation
        failoverPriority: 1
      }
    ]
    enableAutomaticFailover: true
    enableMultipleWriteLocations: false
  }
}

resource cosmosDatabase 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases@2023-04-15' = {
  name: 'main'
  parent: cosmosAccount
  properties: {
    resource: {
      id: 'main'
    }
    options: {
      autoscaleSettings: {
        maxThroughput: 4000
      }
    }
  }
}
```

### Azure Storage Account

#### اسٹوریج اکاؤنٹ کی اقسام

1. **Standard_LRS** - ترقی، غیر اہم ڈیٹا
2. **Standard_GRS** - پروڈکشن، جغرافیائی ردونظمی درکار
3. **Premium_LRS** - اعلی کارکردگی والی ایپس
4. **Premium_ZRS** - زون ردونظمی کے ساتھ اعلی دستیابی

#### کارکردگی کے ٹیئرز

- **معیاری**: عمومی مقصد، لاگت مؤثر
- **پریمیم**: اعلی کارکردگی، کم تاخیر کے منظرنامے

```bicep
// Development
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'sa${uniqueString(resourceGroup().id)}dev'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
    minimumTlsVersion: 'TLS1_2'
  }
}

// Production
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'sa${uniqueString(resourceGroup().id)}prod'
  location: location
  sku: {
    name: 'Standard_GRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
    minimumTlsVersion: 'TLS1_2'
    networkAcls: {
      defaultAction: 'Deny'
      virtualNetworkRules: []
      ipRules: []
    }
  }
}
```

---

## لاگت کی اصلاح کی حکمت عملی

### 1. مخصوص گنجائش

1-3 سال کے لیے وسائل مخصوص کریں تاکہ بڑی رعایتیں حاصل ہوں:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

مخصوص پیشکشیں اور اہل وسائل کی اقسام مختلف ہو سکتی ہیں؛ کیٹلاگ اور خریداری کی شرائط کا معائنہ کریں بجائے اس کے کہ فرض کریں ہر سروس/SKU مخصوص گنجائش کی حمایت کرتا ہے۔

### 2. مناسب سائز کا تعین

چھوٹے SKUs سے شروع کریں اور اصل استعمال کی بنیاد پر اسکیل اپ کریں:

```yaml
# Progressive scaling approach
development:
  app_service: "F1"    # Free tier
testing:
  app_service: "B1"    # Basic tier  
staging:
  app_service: "S1"    # Standard tier
production:
  app_service: "P1V3"  # Premium tier
```

### 3. آٹو-اسکیلنگ کنفیگریشن

لاگت کو بہتر بنانے کے لیے ذہین اسکیلنگ نافذ کریں:

```bicep
resource autoScaleSettings 'Microsoft.Insights/autoscalesettings@2022-10-01' = {
  name: 'autoscale-${appServicePlan.name}'
  location: location
  properties: {
    profiles: [{
      name: 'default'
      capacity: {
        minimum: '1'
        maximum: '10'
        default: '2'
      }
      rules: [
        {
          metricTrigger: {
            statistic: 'Average'
            metricName: 'CpuPercentage'
            metricResourceUri: appServicePlan.id
            operator: 'GreaterThan'
            threshold: 70
            timeAggregation: 'Average'
            timeGrain: 'PT1M'
            timeWindow: 'PT5M'
          }
          scaleAction: {
            direction: 'Increase'
            type: 'ChangeCount'
            value: '1'
            cooldown: 'PT5M'
          }
        }
        {
          metricTrigger: {
            statistic: 'Average'
            metricName: 'CpuPercentage'
            metricResourceUri: appServicePlan.id
            operator: 'LessThan'
            threshold: 30
            timeAggregation: 'Average'
            timeGrain: 'PT1M'
            timeWindow: 'PT5M'
          }
          scaleAction: {
            direction: 'Decrease'
            type: 'ChangeCount'
            value: '1'
            cooldown: 'PT5M'
          }
        }
      ]
    }]
    enabled: true
    targetResourceUri: appServicePlan.id
  }
}
```

### 4. شیڈول شدہ اسکیلنگ

آف آورز کے دوران اسکیل ڈاؤن کریں:

```json
{
  "profiles": [
    {
      "name": "business-hours",
      "capacity": {
        "minimum": "2",
        "maximum": "10", 
        "default": "3"
      },
      "recurrence": {
        "frequency": "Week",
        "schedule": {
          "timeZone": "Pacific Standard Time",
          "days": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
          "hours": [8],
          "minutes": [0]
        }
      }
    },
    {
      "name": "off-hours",
      "capacity": {
        "minimum": "1",
        "maximum": "2",
        "default": "1"
      },
      "recurrence": {
        "frequency": "Week", 
        "schedule": {
          "timeZone": "Pacific Standard Time",
          "days": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
          "hours": [18],
          "minutes": [0]
        }
      }
    }
  ]
}
```

---

## کارکردگی کے پہلو

### بنیادی کارکردگی کی ضروریات

SKU انتخاب سے پہلے واضح کارکردگی کی ضروریات متعین کریں:

```yaml
performance_requirements:
  response_time:
    p95: "< 500ms"
    p99: "< 1000ms"
  throughput:
    requests_per_second: 1000
    concurrent_users: 500
  availability:
    uptime: "99.9%"
    rpo: "15 minutes"
    rto: "30 minutes"
```

### لوڈ ٹیسٹنگ

مختلف SKUs کی جانچ کریں تاکہ کارکردگی کی تصدیق ہو سکے:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### مانیٹرنگ اور اصلاح

جامع مانیٹرنگ سیٹ اپ کریں:

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: 'ai-${environmentName}'
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
    IngestionMode: 'LogAnalytics'
  }
}

resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: 'law-${environmentName}'
  location: location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
  }
}
```

---

## فوری حوالہ جدول

### ایپ سروس SKU فوری حوالہ

| SKU | ٹیئر | vCPU | RAM | اسٹوریج | قیمت کی حد | استعمال کا کیس |
|-----|------|------|-----|---------|-------------|----------|
| F1 | فری | مشترکہ | 1GB | 1GB | مفت | ترقی |
| B1 | بیسک | 1 | 1.75GB | 10GB | $ | چھوٹے ایپس |
| S1 | معیاری | 1 | 1.75GB | 50GB | $$ | پروڈکشن |
| P1V3 | پریمیم V3 | 2 | 8GB | 250GB | $$$ | اعلی کارکردگی |
| I1V2 | آئسولیٹڈ V2 | 2 | 8GB | 1TB | $$$$ | انٹرپرائز |

### SQL ڈیٹا بیس SKU فوری حوالہ

| SKU | ٹیئر | DTU/vCore | اسٹوریج | قیمت کی حد | استعمال کا کیس |
|-----|------|-----------|---------|-------------|----------|
| بیسک | بیسک | 5 DTU | 2GB | $ | ترقی |
| S2 | معیاری | 50 DTU | 250GB | $$ | چھوٹے پروڈکشن |
| P2 | پریمیم | 250 DTU | 1TB | $$$ | اعلی کارکردگی |
| GP_Gen5_4 | جنرل پرپز | 4 vCore | 4TB | $$$ | متوازن |
| BC_Gen5_8 | بزنس کریٹیکل | 8 vCore | 4TB | $$$$ | مشن کریٹیکل |

### کنٹینر ایپس SKU فوری حوالہ

| ماڈل | قیمت گذاری | CPU/میموری | استعمال کا کیس |
|-------|---------|------------|----------|
| مصرفی | استعمال کے حساب سے ادائیگی | ماحول/پروفائل پر منحصر CPU/میموری کے امتزاج کی حمایت | ترقی یا پروڈکشن، متغیر لوڈ |
| مخصوص D4 | مخصوص نوڈ بلنگ | 4 vCPU, 16GiB فی نوڈ | مستقل لوڈ/آئسولیشن کی ضرورتیں |
| مخصوص D8 | مخصوص نوڈ بلنگ | 8 vCPU, 32GiB فی نوڈ | زیادہ مستقل لوڈ |

---

## ویلیڈیشن ٹولز

### SKU دستیابی چیکر

```bash
#!/bin/bash
# Check SKU availability in target region

check_sku_availability() {
    local region=$1
    local resource_type=$2
    local sku=$3
    
    echo "Checking $sku availability for $resource_type in $region..."
    
    case $resource_type in
        "app-service")
            az appservice list-locations --sku $sku --output table
            ;;
        "sql-database")
            az sql db list-editions --location $region --output table
            ;;
        "storage")
            # Name availability is not SKU availability.
            az storage sku list --query "[?name=='$sku'].{name:name,locations:locations,restrictions:restrictions}" --output json
            ;;
        *)
            echo "Resource type not supported"
            ;;
    esac
}

# Usage
check_sku_availability "eastus" "app-service" "P1V3"
```

### لاگت کا تخمینہ اسکرپٹ

**صرف سیوڈو کوڈ:** `Get-ResourceCost` نیچے ایک پروجیکٹ مخصوص فنکشن ہے جسے آپ کو موجودہ علاقائی/معاہدے کی قیمتوں اور استعمال کے اندازے کے مطابق عملدرآمد کرنا ہوگا۔ یہ کسی PowerShell یا Azure cmdlet کا حصہ نہیں ہے۔

```powershell
# PowerShell script for cost estimation
function Get-AzureCostEstimate {
    param(
        [string]$SubscriptionId,
        [string]$ResourceGroup,
        [hashtable]$Resources
    )
    
    $totalCost = 0
    
    foreach ($resource in $Resources.GetEnumerator()) {
        $resourceType = $resource.Key
        $sku = $resource.Value
        
        # Use Azure Pricing API or calculator
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Usage
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### کارکردگی کی تصدیق

ذیل میں YAML ایک ضروریات کا خاکہ ہے، **کوئی** Azure لوڈ ٹیسٹنگ، JMeter، Locust، یا k6 ان پٹ اسکیمہ نہیں۔ اسے اپنے منتخب ٹول کی حقیقی ترتیب میں تبدیل کریں اس سے پہلے کہ اوپر دیا گیا لوڈ-ٹیسٹ کمانڈ استعمال کریں۔

```yaml
# Load test configuration for SKU validation
test_configuration:
  duration: "10m"
  users:
    spawn_rate: 10
    max_users: 100
  
  scenarios:
    - name: "sku_performance_test"
      requests:
        - url: "https://myapp.azurewebsites.net/api/health"
          method: "GET"
          expect:
            - status_code: 200
            - response_time_ms: 500
        
        - url: "https://myapp.azurewebsites.net/api/data"
          method: "POST"
          expect:
            - status_code: 201
            - response_time_ms: 1000

  thresholds:
    http_req_duration:
      - "p(95)<500"  # 95% of requests under 500ms
      - "p(99)<1000" # 99% of requests under 1s
    http_req_failed:
      - "rate<0.1"   # Less than 10% failure rate
```

---

## بہترین عملی خلاصہ

### کرنے کے کام

1. **چھوٹے سے شروع کریں اور اصل استعمال کی بنیاد پر بڑھائیں**
2. **مختلف ماحول کے لیے مختلف SKUs استعمال کریں**
3. **کارکردگی اور لاگت کا مسلسل جائزہ لیں**
4. **پروڈکشن کے ورکلوڈز کے لیے مخصوص گنجائش کا فائدہ اٹھائیں**
5. **جہاں مناسب ہو، آٹو اسکیلنگ نافذ کریں**
6. **حقیقی ورکلوڈز سے کارکردگی کی جانچ کریں**
7. **ترقی کی منصوبہ بندی کریں لیکن ضرورت سے زیادہ فراہمی سے گریز کریں**
8. **جب ممکن ہو ترقی کے لیے مفت ٹیئرز استعمال کریں**

### نہ کرنے کے کام

1. **ترقی کے لیے پروڈکشن SKUs استعمال نہ کریں**
2. **علاقائی SKU دستیابی کو نظرانداز نہ کریں**
3. **ڈیٹا ٹرانسفر کی لاگت کو نہ بھولیں**
4. **بغیر جواز کے ضرورت سے زیادہ فراہمی نہ کریں**
5. **انحصارات کے اثرات کو نظرانداز نہ کریں**
6. **آٹو اسکیلنگ کی حدود بہت زیادہ مقرر نہ کریں**
7. **تعمیل کی ضروریات کو نہ بھولیں**
8. **صرف قیمت کی بنیاد پر فیصلے نہ کریں**

---

**پروفیشنل ٹپ**: Azure Cost Management اور Advisor استعمال کریں تاکہ آپ کے SKU انتخاب کی اصلاح کے لیے آپ کی اصل استعمال کی نمونوں کی بنیاد پر ذاتی سفارشات حاصل کی جا سکیں۔

---

**نیویگیشن**
- **پچھلا سبق**: [کپیسیٹی پلاننگ](capacity-planning.md)
- **اگلا سبق**: [پری فلائٹ چیکس](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->