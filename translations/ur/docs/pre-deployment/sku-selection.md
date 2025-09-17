<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "952ed5af7f5db069c53a6840717e1801",
  "translation_date": "2025-09-17T18:42:49+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "ur"
}
-->
# ایس کے یو انتخاب گائیڈ - صحیح ایزور سروس ٹائرز کا انتخاب

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 6 - پری ڈپلائمنٹ ویلیڈیشن اور پلاننگ
- **⬅️ پچھلا**: [Capacity Planning](capacity-planning.md)
- **➡️ اگلا**: [Pre-flight Checks](preflight-checks.md)
- **🚀 اگلا باب**: [باب 7: Troubleshooting](../troubleshooting/common-issues.md)

## تعارف

یہ جامع گائیڈ آپ کو مختلف ماحول، ورک لوڈز، اور ضروریات کے لیے بہترین ایزور سروس ایس کے یوز (Stock Keeping Units) منتخب کرنے میں مدد فراہم کرتی ہے۔ کارکردگی کی ضروریات، لاگت کے پہلوؤں، اور اسکیل ایبلٹی کی ضروریات کا تجزیہ کرنا سیکھیں تاکہ ایزور ڈیولپر CLI ڈپلائمنٹس کے لیے سب سے موزوں سروس ٹائرز کا انتخاب کیا جا سکے۔

## سیکھنے کے اہداف

اس گائیڈ کو مکمل کرنے کے بعد، آپ:
- ایزور ایس کے یو کے تصورات، قیمتوں کے ماڈلز، اور فیچر کے فرق کو سمجھ سکیں گے
- ترقی، اسٹیجنگ، اور پروڈکشن کے لیے ماحول کے مطابق ایس کے یو انتخاب کی حکمت عملیوں میں مہارت حاصل کریں گے
- ورک لوڈ کی ضروریات کا تجزیہ کریں گے اور انہیں مناسب سروس ٹائرز سے ملائیں گے
- ذہین ایس کے یو انتخاب کے ذریعے لاگت کی اصلاح کی حکمت عملیوں کو نافذ کریں گے
- ایس کے یو انتخاب کے لیے کارکردگی کی جانچ اور توثیق کی تکنیکوں کو اپلائی کریں گے
- خودکار ایس کے یو سفارشات اور مانیٹرنگ کو ترتیب دیں گے

## سیکھنے کے نتائج

گائیڈ مکمل کرنے کے بعد، آپ:
- ورک لوڈ کی ضروریات اور پابندیوں کی بنیاد پر مناسب ایزور سروس ایس کے یوز منتخب کر سکیں گے
- مناسب ٹائر انتخاب کے ساتھ لاگت مؤثر ملٹی ماحول آرکیٹیکچرز ڈیزائن کریں گے
- ایس کے یو انتخاب کے لیے کارکردگی کی بینچ مارکنگ اور توثیق کو نافذ کریں گے
- ایس کے یو سفارشات اور لاگت کی اصلاح کے لیے خودکار ٹولز بنائیں گے
- بدلتی ہوئی ضروریات کے لیے ایس کے یو مائیگریشن اور اسکیلنگ کی حکمت عملیوں کی منصوبہ بندی کریں گے
- ایزور ویل آرکیٹیکٹڈ فریم ورک کے اصولوں کو سروس ٹائر انتخاب میں اپلائی کریں گے

## مواد کی فہرست

- [ایس کے یوز کو سمجھنا](../../../../docs/pre-deployment)
- [ماحول پر مبنی انتخاب](../../../../docs/pre-deployment)
- [سروس مخصوص رہنما اصول](../../../../docs/pre-deployment)
- [لاگت کی اصلاح کی حکمت عملی](../../../../docs/pre-deployment)
- [کارکردگی کے پہلو](../../../../docs/pre-deployment)
- [فوری حوالہ جات ٹیبلز](../../../../docs/pre-deployment)
- [توثیق کے ٹولز](../../../../docs/pre-deployment)

---

## ایس کے یوز کو سمجھنا

### ایس کے یوز کیا ہیں؟

ایس کے یوز (Stock Keeping Units) ایزور وسائل کے مختلف سروس ٹائرز اور کارکردگی کی سطحوں کی نمائندگی کرتے ہیں۔ ہر ایس کے یو مختلف پیش کرتا ہے:

- **کارکردگی کی خصوصیات** (CPU، میموری، تھروپٹ)
- **فیچر کی دستیابی** (اسکیلنگ کے اختیارات، SLA لیولز)
- **قیمتوں کے ماڈلز** (استعمال پر مبنی، محفوظ صلاحیت)
- **علاقائی دستیابی** (تمام ایس کے یوز ہر علاقے میں دستیاب نہیں ہیں)

### ایس کے یو انتخاب میں کلیدی عوامل

1. **ورک لوڈ کی ضروریات**
   - متوقع ٹریفک/لوڈ کے پیٹرنز
   - کارکردگی کی ضروریات (CPU، میموری، I/O)
   - اسٹوریج کی ضروریات اور رسائی کے پیٹرنز

2. **ماحول کی قسم**
   - ترقی/ٹیسٹنگ بمقابلہ پروڈکشن
   - دستیابی کی ضروریات
   - سیکیورٹی اور کمپلائنس کی ضروریات

3. **بجٹ کی پابندیاں**
   - ابتدائی لاگت بمقابلہ آپریشنل لاگت
   - محفوظ صلاحیت کی رعایتیں
   - آٹو اسکیلنگ کی لاگت کے اثرات

4. **ترقی کی پیش گوئیاں**
   - اسکیل ایبلٹی کی ضروریات
   - مستقبل کی فیچر کی ضروریات
   - مائیگریشن کی پیچیدگی

---

## ماحول پر مبنی انتخاب

### ترقی کا ماحول

**ترجیحات**: لاگت کی اصلاح، بنیادی فعالیت، آسان پروویژننگ/ڈی پروویژننگ

#### تجویز کردہ ایس کے یوز
```yaml
# Development environment configuration
environment: development
skus:
  app_service: "F1"          # Free tier
  sql_database: "Basic"       # Basic tier, 5 DTU
  storage: "Standard_LRS"     # Locally redundant
  cosmos_db: "Free"          # Free tier (400 RU/s)
  key_vault: "Standard"      # Standard pricing tier
  application_insights: "Free" # First 5GB free
```

#### خصوصیات
- **ایپ سروس**: F1 (مفت) یا B1 (بنیادی) سادہ ٹیسٹنگ کے لیے
- **ڈیٹا بیسز**: کم سے کم وسائل کے ساتھ بنیادی ٹائر
- **اسٹوریج**: صرف مقامی ریڈنڈنسی کے ساتھ معیاری
- **کمپیوٹ**: مشترکہ وسائل قابل قبول
- **نیٹ ورکنگ**: بنیادی کنفیگریشنز

### اسٹیجنگ/ٹیسٹنگ ماحول

**ترجیحات**: پروڈکشن جیسی کنفیگریشن، لاگت کا توازن، کارکردگی کی جانچ کی صلاحیت

#### تجویز کردہ ایس کے یوز
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
- **کارکردگی**: پروڈکشن کی صلاحیت کا 70-80%
- **فیچرز**: زیادہ تر پروڈکشن فیچرز فعال
- **ریڈنڈنسی**: کچھ جغرافیائی ریڈنڈنسی
- **اسکیلنگ**: ٹیسٹنگ کے لیے محدود آٹو اسکیلنگ
- **مانیٹرنگ**: مکمل مانیٹرنگ اسٹیک

### پروڈکشن ماحول

**ترجیحات**: کارکردگی، دستیابی، سیکیورٹی، کمپلائنس، اسکیل ایبلٹی

#### تجویز کردہ ایس کے یوز
```yaml
# Production environment configuration
environment: production
skus:
  app_service: "P1V3"        # Premium v3 tier
  sql_database: "P2"         # Premium tier, 250 DTU
  storage: "Premium_GRS"     # Premium geo-redundant
  cosmos_db: "Provisioned"   # Dedicated throughput
  container_apps: "Dedicated" # Dedicated environment
  key_vault: "Premium"       # Premium with HSM
```

#### خصوصیات
- **اعلی دستیابی**: 99.9%+ SLA کی ضروریات
- **کارکردگی**: وقف شدہ وسائل، اعلی تھروپٹ
- **سیکیورٹی**: پریمیم سیکیورٹی فیچرز
- **اسکیلنگ**: مکمل آٹو اسکیلنگ کی صلاحیتیں
- **مانیٹرنگ**: جامع مشاہدہ

---

## سروس مخصوص رہنما اصول

### ایزور ایپ سروس

#### ایس کے یو فیصلہ میٹرکس

| استعمال کا کیس | تجویز کردہ ایس کے یو | وجہ |
|---------------|---------------------|-----|
| ترقی/ٹیسٹنگ | F1 (مفت) یا B1 (بنیادی) | لاگت مؤثر، ٹیسٹنگ کے لیے کافی |
| چھوٹے پروڈکشن ایپس | S1 (معیاری) | کسٹم ڈومینز، SSL، آٹو اسکیلنگ |
| درمیانے پروڈکشن ایپس | P1V3 (پریمیم V3) | بہتر کارکردگی، زیادہ فیچرز |
| زیادہ ٹریفک ایپس | P2V3 یا P3V3 | وقف شدہ وسائل، اعلی کارکردگی |
| مشن-کریٹیکل ایپس | I1V2 (آئسولیٹڈ V2) | نیٹ ورک آئسولیشن، وقف شدہ ہارڈویئر |

#### کنفیگریشن کی مثالیں

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

### ایزور SQL ڈیٹا بیس

#### ایس کے یو انتخاب کا فریم ورک

1. **DTU پر مبنی (ڈیٹا بیس ٹرانزیکشن یونٹس)**
   - **بنیادی**: 5 DTU - ترقی/ٹیسٹنگ
   - **معیاری**: S0-S12 (10-3000 DTU) - عمومی مقصد
   - **پریمیم**: P1-P15 (125-4000 DTU) - کارکردگی کے لیے اہم

2. **vCore پر مبنی** (پروڈکشن کے لیے تجویز کردہ)
   - **جنرل پرپز**: متوازن کمپیوٹ اور اسٹوریج
   - **بزنس کریٹیکل**: کم لیٹنسی، اعلی IOPS
   - **ہائپر اسکیل**: انتہائی اسکیل ایبل اسٹوریج (100TB تک)

#### کنفیگریشن کی مثالیں

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

### ایزور کنٹینر ایپس

#### ماحول کی اقسام

1. **استعمال پر مبنی**
   - استعمال کے مطابق ادائیگی
   - ترقی اور متغیر ورک لوڈز کے لیے موزوں
   - مشترکہ انفراسٹرکچر

2. **وقف شدہ (ورک لوڈ پروفائلز)**
   - وقف شدہ کمپیوٹ وسائل
   - پیش گوئی کی کارکردگی
   - پروڈکشن ورک لوڈز کے لیے بہتر

#### کنفیگریشن کی مثالیں

**ترقی (استعمال پر مبنی)**
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
        targetPort: 3000
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

**پروڈکشن (وقف شدہ)**
```bicep
resource containerAppEnvironment 'Microsoft.App/managedEnvironments@2022-10-01' = {
  name: 'cae-${environmentName}-prod'
  location: location
  properties: {
    zoneRedundant: true
    workloadProfiles: [{
      name: 'production-profile'
      workloadProfileType: 'D4'
      minimumCount: 2
      maximumCount: 10
    }]
  }
}
```

### ایزور کاسماس ڈی بی

#### تھروپٹ ماڈلز

1. **دستی طور پر فراہم کردہ تھروپٹ**
   - پیش گوئی کی کارکردگی
   - محفوظ صلاحیت کی رعایتیں
   - مستحکم ورک لوڈز کے لیے بہترین

2. **آٹو اسکیل فراہم کردہ تھروپٹ**
   - استعمال کے مطابق خودکار اسکیلنگ
   - جو استعمال کریں اس کی ادائیگی (کم از کم کے ساتھ)
   - متغیر ورک لوڈز کے لیے اچھا

3. **سرور لیس**
   - درخواست کے مطابق ادائیگی
   - کوئی فراہم کردہ تھروپٹ نہیں
   - ترقی اور وقفے وقفے سے ورک لوڈز کے لیے مثالی

#### ایس کے یو کی مثالیں

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

### ایزور اسٹوریج اکاؤنٹ

#### اسٹوریج اکاؤنٹ کی اقسام

1. **Standard_LRS** - ترقی، غیر اہم ڈیٹا
2. **Standard_GRS** - پروڈکشن، جغرافیائی ریڈنڈنسی کی ضرورت
3. **Premium_LRS** - اعلی کارکردگی کی ایپلیکیشنز
4. **Premium_ZRS** - زون ریڈنڈنسی کے ساتھ اعلی دستیابی

#### کارکردگی کے ٹائرز

- **معیاری**: عمومی مقصد، لاگت مؤثر
- **پریمیم**: اعلی کارکردگی، کم لیٹنسی کے منظرنامے

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

### 1. محفوظ صلاحیت

1-3 سال کے لیے وسائل محفوظ کریں تاکہ نمایاں رعایتیں حاصل ہوں:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. صحیح سائزنگ

چھوٹے ایس کے یوز سے شروع کریں اور اصل استعمال کی بنیاد پر اسکیل اپ کریں:

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

### 3. آٹو اسکیلنگ کنفیگریشن

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

### 4. شیڈولڈ اسکیلنگ

آف اوقات کے دوران اسکیل ڈاؤن کریں:

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

ایس کے یو انتخاب سے پہلے واضح کارکردگی کی ضروریات کی وضاحت کریں:

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

مختلف ایس کے یوز کی جانچ کریں تاکہ کارکردگی کی توثیق ہو سکے:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### مانیٹرنگ اور اصلاح

جامع مانیٹرنگ ترتیب دیں:

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: 'ai-${environmentName}'
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    RetentionInDays: 90
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

## فوری حوالہ جات ٹیبلز

### ایپ سروس ایس کے یو فوری حوالہ

| ایس کے یو | ٹائر | vCPU | RAM | اسٹوریج | قیمت کی حد | استعمال کا کیس |
|----------|------|------|-----|---------|-------------|----------------|
| F1 | مفت | مشترکہ | 1GB | 1GB | مفت | ترقی |
| B1 | بنیادی | 1 | 1.75GB | 10GB | $ | چھوٹے ایپس |
| S1 | معیاری | 1 | 1.75GB | 50GB | $$ | پروڈکشن |
| P1V3 | پریمیم V3 | 2 | 8GB | 250GB | $$$ | اعلی کارکردگی |
| I1V2 | آئسولیٹڈ V2 | 2 | 8GB | 1TB | $$$$ | انٹرپرائز |

### SQL ڈیٹا بیس ایس کے یو فوری حوالہ

| ایس کے یو | ٹائر | DTU/vCore | اسٹوریج | قیمت کی حد | استعمال کا کیس |
|----------|------|-----------|---------|-------------|----------------|
| بنیادی | بنیادی | 5 DTU | 2GB | $ | ترقی |
| S2 | معیاری | 50 DTU | 250GB | $$ | چھوٹا پروڈکشن |
| P2 | پریمیم | 250 DTU | 1TB | $$$ | اعلی کارکردگی |
| GP_Gen5_4 | جنرل پرپز | 4 vCore | 4TB | $$$ | متوازن |
| BC_Gen5_8 | بزنس کریٹیکل | 8 vCore | 4TB | $$$$ | مشن کریٹیکل |

### کنٹینر ایپس ایس کے یو فوری حوالہ

| ماڈل | قیمت | CPU/میموری | استعمال کا کیس |
|------|------|------------|----------------|
| استعمال پر مبنی | استعمال کے مطابق ادائیگی | 0.25-2 vCPU | ترقی، متغیر لوڈ |
| وقف شدہ D4 | محفوظ | 4 vCPU، 16GB | پروڈکشن |
| وقف شدہ D8 | محفوظ | 8 vCPU، 32GB | اعلی کارکردگی |

---

## توثیق کے ٹولز

### ایس کے یو دستیابی چیکر

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
            az storage account check-name --name "test" --output table
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

### کارکردگی کی توثیق

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

## بہترین طریقوں کا خلاصہ

### کرنے کے کام

1. **چھوٹے سے شروع کریں اور اصل استعمال کی بنیاد پر اسکیل اپ کریں**
2. **مختلف ماحول کے لیے مختلف ایس کے یوز استعمال کریں**
3. **کارکردگی اور لاگت کو مسلسل مانیٹر کریں**
4. **پروڈکشن ورک لوڈز کے لیے محفوظ صلاحیت کا فائدہ اٹھائیں**
5. **جہاں مناسب ہو آٹو اسکیلنگ نافذ کریں**
6. **حقیقی ورک لوڈز کے ساتھ کارکردگی کی جانچ کریں**
7. **ترقی کی منصوبہ بندی کریں لیکن زیادہ پروویژننگ سے گریز کریں**
8. **ترقی کے لیے مفت ٹائرز استعمال کریں جب ممکن ہو**

### نہ کرنے کے کام

1. **ترقی کے لیے پروڈکشن ایس کے یوز استعمال نہ کریں**
2. **علاقائی ایس کے یو دستیابی کو نظر انداز نہ کریں**
3. **ڈیٹا ٹرانسفر کی لاگت کو نظر انداز نہ کریں**
4. **بغیر جواز کے زیادہ پروویژننگ نہ کریں**
5. **انحصار کے اثرات کو نظر انداز نہ کریں**
6. **آٹو اسکیلنگ کی حدیں بہت زیادہ نہ رکھیں**
7. **کمپلائنس کی ضروریات کو نظر انداز نہ کریں**
8. **صرف قیمت کی بنیاد پر فیصلے نہ کریں**

---

**پرو ٹپ**: ایزور کاسٹ مینجمنٹ اور ایڈوائزر کا استعمال کریں تاکہ آپ کے اصل استعمال کے پیٹرنز کی بنیاد پر ایس کے یو انتخاب کو بہتر بنانے کے لیے ذاتی نوعیت کی سفارشات حاصل کی جا سکیں۔

---

**نیویگیشن**
- **پچھلا سبق**: [Capacity Planning](capacity-planning.md)
- **اگلا سبق**: [Preflight Checks](preflight-checks.md)

---

**ڈسکلیمر**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ ہم درستگی کے لیے کوشش کرتے ہیں، لیکن براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا غیر درستیاں ہو سکتی ہیں۔ اصل دستاویز کو اس کی اصل زبان میں مستند ذریعہ سمجھا جانا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے ذمہ دار نہیں ہیں۔