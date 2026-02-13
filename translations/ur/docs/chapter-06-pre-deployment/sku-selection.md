‮# SKU Selection Guide - Choosing the Right Azure Service Tiers

**Chapter Navigation:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 6 - پیش از تعیناتی توثیق اور منصوبہ بندی
- **⬅️ پچھلا**: [Capacity Planning](capacity-planning.md)
- **➡️ اگلا**: [Pre-flight Checks](preflight-checks.md)
- **🚀 اگلا باب**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/common-issues.md)

## تعارف

یہ جامع رہنما آپ کو مختلف ماحول، ورکس لوڈز، اور ضروریات کے لیے موزوں Azure سروس SKUs (Stock Keeping Units) منتخب کرنے میں مدد دیتی ہے۔ کارکردگی کی ضروریات، لاگت کے پہلوؤں، اور قابل توسیع کے تقاضوں کا تجزیہ کرنا سیکھیں تاکہ Azure Developer CLI تعیناتیوں کے لیے مناسب سروس ٹائر منتخب کیے جا سکیں۔

## سیکھنے کے مقاصد

اس رہنما کو مکمل کرنے کے بعد آپ:
- Azure SKU تصورات، قیمت گذاری ماڈلز، اور خصوصیت کے فرق کو سمجھیں گے
- ترقی، اسٹیجنگ، اور پروڈکشن کے لیے ماحول مخصوص SKU انتخاب کی حکمت عملیاں اختیار کریں گے
- ورکس لوڈ کی ضروریات کا تجزیہ کریں گے اور انہیں مناسب سروس ٹائر سے ملا پائیں گے
- ذہین SKU انتخاب کے ذریعے لاگت کی بہتر کاری کی حکمت عملیاں نافذ کریں گے
- SKU انتخاب کے لیے کارکردگی ٹیسٹنگ اور توثیق کی تکنیکیں اپنائیں گے
- خودکار SKU سفارشات اور مانیٹرنگ ترتیب دیں گے

## سیکھنے کے نتائج

مکمل کرنے پر، آپ قابل ہو جائیں گے:
- ورکس لوڈ کی ضروریات اور پابندیوں کی بنیاد پر مناسب Azure سروس SKUs کا انتخاب کرنا
- مناسب ٹائر انتخاب کے ساتھ کثیر ماحولی لاگت موثر آرکیٹیکچر ڈیزائن کرنا
- SKU انتخاب کے لیے کارکردگی بینچ مارکنگ اور توثیق نافذ کرنا
- SKU سفارش اور لاگت کی بہتر کاری کے لیے خودکار اوزار بنانا
- بدلتی ضروریات کے لیے SKU مائیگریشن اور اسکیلنگ حکمت عملیاں منصوبہ بنانا
- سروس ٹائر کے انتخاب میں Azure Well-Architected Framework اصول نافذ کرنا

## فہرست مضامین

- [SKU کو سمجھنا](../../../../docs/chapter-06-pre-deployment)
- [ماحول کی بنیاد پر انتخاب](../../../../docs/chapter-06-pre-deployment)
- [سروس مخصوص رہنما اصول](../../../../docs/chapter-06-pre-deployment)
- [لاگت بہتر کاری کی حکمت عملیاں](../../../../docs/chapter-06-pre-deployment)
- [کارکردگی کے پہلو](../../../../docs/chapter-06-pre-deployment)
- [جلدی حوالہ جدولیں](../../../../docs/chapter-06-pre-deployment)
- [توثیقی اوزار](../../../../docs/chapter-06-pre-deployment)

---

## SKU کو سمجھنا

### SKU کیا ہیں؟

SKU (Stock Keeping Units) Azure وسائل کے مختلف سروس ٹائر اور کارکردگی سطحوں کی نمائندگی کرتے ہیں۔ ہر SKU مختلف پیشکش کرتا ہے:

- **کارکردگی خصوصیات** (CPU، میموری، تھرو پٹ)
- **خصوصیت دستیابی** (اسکیلنگ اختیارات، SLA سطحیں)
- **قیمت گذاری ماڈلز** (مصرف پر مبنی، محفوظ شدہ صلاحیت)
- **علاقائی دستیابی** (ہر SKU ہر علاقے میں دستیاب نہیں ہوتا)

### SKU انتخاب میں اہم عوامل

1. **ورکس لوڈ کی ضروریات**
   - متوقع ٹریفک/لوڈ کے پیٹرن
   - کارکردگی کی ضروریات (CPU، میموری، I/O)
   - اسٹوریج ضروریات اور رسائی کے پیٹرن

2. **ماحول کی قسم**
   - ترقی/ٹیسٹنگ بمقابلہ پروڈکشن
   - دستیابی کی ضروریات
   - سیکیورٹی اور تعمیل کی ضروریات

3. **بجٹ کی پابندیاں**
   - ابتدائی اخراجات بمقابلہ آپریشنل اخراجات
   - محفوظ شدہ صلاحیت کی چھوٹ
   - آٹو-اسکیلنگ کے لاگتی اثرات

4. **نشوونما کے تخمینے**
   - قابل اسکیل ہونے کی ضروریات
   - مستقبل میں خصوصیات کی ضرورت
   - مائیگریشن کی پیچیدگی

---

## ماحول کی بنیاد پر انتخاب

### ترقیاتی ماحول

**اہم ترجیحات**: لاگت کی بہتر کاری، بنیادی فعالیت، آسان پروویژننگ/ڈی پروویژننگ

#### تجویز کردہ SKUs
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
- **App Service**: سادہ ٹیسٹنگ کے لیے F1 (Free) یا B1 (Basic)
- **ڈیٹابیسز**: کم از کم وسائل کے ساتھ Basic ٹائر
- **اسٹوریج**: صرف مقامی redundancy کے ساتھ Standard
- **کمپیوٹ**: مشترکہ وسائل قابل قبول
- **نیٹ ورکنگ**: بنیادی کنفیگریشنز

### اسٹیجنگ/ٹیسٹنگ ماحول

**اہم ترجیحات**: پروڈکشن نما کنفیگریشن، لاگت کا توازن، کارکردگی ٹیسٹنگ کی صلاحیت

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
- **کارکردگی**: پروڈکشن صلاحیت کے 70-80%
- **خصوصیات**: زیادہ تر پروڈکشن خصوصیات فعال
- **ریڈنڈنسی**: کچھ جغرافیائی redundancy
- **اسکیلنگ**: ٹیسٹنگ کے لیے محدود آٹو-اسکیلنگ
- **مانیٹرنگ**: مکمل مانیٹرنگ اسٹیک

### پروڈکشن ماحول

**اہم ترجیحات**: کارکردگی، دستیابی، سیکیورٹی، تعمیل، اسکیل ایبلیٹی

#### تجویز کردہ SKUs
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
- **اعلی دستیابی**: 99.9%+ SLA ضروریات
- **کارکردگی**: وقف شدہ وسائل، اعلی تھروپٹ
- **سیکیورٹی**: پریمیئم سیکیورٹی خصوصیات
- **اسکیلنگ**: مکمل آٹو-اسکیلنگ صلاحیتیں
- **مانیٹرنگ**: جامع آبزرویبلٹی

---

## سروس مخصوص رہنما اصول

### Azure App Service

#### SKU فیصلہ میٹرکس

| Use Case | Recommended SKU | Rationale |
|----------|----------------|-----------|
| Development/Testing | F1 (Free) or B1 (Basic) | لاگت مؤثر، ٹیسٹنگ کے لیے کافی |
| Small production apps | S1 (Standard) | کسٹم ڈومینز، SSL، آٹو-اسکیلنگ |
| Medium production apps | P1V3 (Premium V3) | بہتر کارکردگی، زیادہ خصوصیات |
| High-traffic apps | P2V3 or P3V3 | وقف شدہ وسائل، اعلی کارکردگی |
| Mission-critical apps | I1V2 (Isolated V2) | نیٹ ورک آئسولیشن، وقف ہارڈویئر |

#### کنفیگریشن مثالیں

**Development**
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

**Production**
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

#### SKU انتخاب کا فریم ورک

1. **DTU-based (Database Transaction Units)**
   - **Basic**: 5 DTU - ترقی/ٹیسٹنگ
   - **Standard**: S0-S12 (10-3000 DTU) - عام مقصد
   - **Premium**: P1-P15 (125-4000 DTU) - کارکردگی حساس

2. **vCore-based** (پروڈکشن کے لیے تجویز کردہ)
   - **General Purpose**: متوازن کمپیوٹ اور اسٹوریج
   - **Business Critical**: کم لیٹنسی، زیادہ IOPS
   - **Hyperscale**: بہت زیادہ اسکیلیبل اسٹوریج (upto 100TB)

#### مثال کنفیگریشنز

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

1. **Consumption-based**
   - Pay-per-use قیمت گذاری
   - ترقی اور متغیر ورکس لوڈز کے لیے مناسب
   - مشترکہ انفراسٹرکچر

2. **Dedicated (Workload Profiles)**
   - وقف شدہ کمپیوٹ وسائل
   - متوقع کارکردگی
   - پروڈکشن ورکس لوڈز کے لیے بہتر

#### کنفیگریشن مثالیں

**Development (Consumption)**
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

**Production (Dedicated)**
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

### Azure Cosmos DB

#### تھروپٹ ماڈلز

1. **Manual Provisioned Throughput**
   - پیش بینی کے قابل کارکردگی
   - محفوظ شدہ صلاحیت کی چھوٹ
   - مستحکم ورکس لوڈز کے لیے بہترین

2. **Autoscale Provisioned Throughput**
   - استعمال کی بنیاد پر خودکار اسکالنگ
   - جس کے لیے آپ استعمال کریں اس کا معاوضہ دیں (کم از کم کے ساتھ)
   - متغیر ورکس لوڈز کے لیے اچھا

3. **Serverless**
   - درخواست کے مطابق ادائیگی
   - کوئی provisioned throughput نہیں
   - ترقی اور وقف وقتی ورکس لوڈز کے لیے مثالی

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
2. **Standard_GRS** - پروڈکشن، جیو-ریڈنڈنسی جب ضروری ہو
3. **Premium_LRS** - ہائی پرفارمنس ایپلیکیشنز
4. **Premium_ZRS** - زون ریڈنڈنسی کے ساتھ اعلی دستیابی

#### کارکردگی ٹائرز

- **Standard**: عام مقصد، لاگت مؤثر
- **Premium**: ہائی پرفارمنس، کم لیٹنسی کے منظرنامے

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

## لاگت بہتر کاری کی حکمت عملیاں

### 1. محفوظ شدہ صلاحیت (Reserved Capacity)

1-3 سال کے لیے وسائل محفوظ کریں تاکہ نمایاں چھوٹ ملے:

```bash
# ریزرویشن کے اختیارات چیک کریں
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. صحیح سائز کا انتخاب (Right-Sizing)

شروع میں چھوٹے SKUs کے ساتھ آغاز کریں اور حقیقی استعمال کی بنیاد پر اوپر اسکیل کریں:

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

لاگت بہتر کرنے کے لیے ذہین اسکیلنگ نافذ کریں:

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

بند اوقات کے دوران سکِل ڈاؤن کریں:

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

SKU منتخب کرنے سے پہلے واضح کارکردگی کی ضروریات متعین کریں:

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

مختلف SKUs کو ٹیسٹ کریں تاکہ کارکردگی کی توثیق ہو سکے:

```bash
# ایزور لوڈ ٹیسٹنگ سروس
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### مانیٹرنگ اور بہتر کاری

جامع مانیٹرنگ قائم کریں:

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

## جلدی حوالہ جدولیں

### App Service SKU فوری حوالہ

| SKU | Tier | vCPU | RAM | Storage | Price Range | Use Case |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | ترقی |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | چھوٹی ایپس |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | پروڈکشن |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | ہائی پرفارمنس |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | انٹرپرائز |

### SQL Database SKU فوری حوالہ

| SKU | Tier | DTU/vCore | Storage | Price Range | Use Case |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | ترقی |
| S2 | Standard | 50 DTU | 250GB | $$ | چھوٹا پروڈکشن |
| P2 | Premium | 250 DTU | 1TB | $$$ | ہائی پرفارمنس |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | متوازن |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | مشن کریٹیکل |

### Container Apps SKU فوری حوالہ

| Model | Pricing | CPU/Memory | Use Case |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | ترقی، متغیر لوڈ |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | پروڈکشن |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | ہائی پرفارمنس |

---

## توثیقی اوزار

### SKU Availability Checker

```bash
#!/bin/bash
# ہدفی خطے میں SKU کی دستیابی چیک کریں

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

# استعمال
check_sku_availability "eastus" "app-service" "P1V3"
```

### Cost Estimation Script

```powershell
# لاگت کے تخمینے کے لیے PowerShell اسکرپٹ
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
        
        # Azure کی قیمتوں کا API یا کیلکولیٹر استعمال کریں
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# استعمال
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### Performance Validation

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

### کرنے والے نکات

1. **چھوٹے سے شروع کریں اور استعمال کی بنیاد پر اوپر اسکیل کریں**
2. **مختلف ماحول کے لیے مختلف SKUs استعمال کریں**
3. **کارکردگی اور اخراجات کو مسلسل مانیٹر کریں**
4. **پروڈکشن ورکس لوڈز کے لیے محفوظ شدہ صلاحیت کا فائدہ اٹھائیں**
5. **جہاں مناسب ہو آٹو-اسکیلنگ نافذ کریں**
6. **حقیقی ورکس لوڈز کے ساتھ کارکردگی ٹیسٹ کریں**
7. **نشوونما کی منصوبہ بندی کریں لیکن ضرورت سے زائد پرووژنزنگ سے گریز کریں**
8. **جب ممکن ہو ترقی کے لیے فری ٹائرز استعمال کریں**

### نہ کرنے والے نکات

1. **ترقی کے لیے پروڈکشن SKUs استعمال نہ کریں**
2. **علاقائی SKU دستیابی کو نظر انداز نہ کریں**
3. **ڈیٹا ٹرانسفر کے اخراجات کو بھولیں نہیں**
4. **بغیر جواز کے اوور-پروویژن نہ کریں**
5. **انحصارات کے اثر کو نظر انداز نہ کریں**
6. **آٹو-اسکیلنگ کی حدیں بہت زیادہ مقرر نہ کریں**
7. **تعمیل کی ضروریات کو مت بھولیں**
8. **صرف قیمت کی بنیاد پر فیصلے نہ کریں**

---

**Pro Tip**: Azure Cost Management اور Advisor استعمال کریں تاکہ حقیقی استعمال کے پیٹرن کی بنیاد پر آپ کے SKU انتخاب کو بہتر کرنے کے لیے ذاتی نوعیت کی سفارشات حاصل ہوں۔

---

**Navigation**
- **پچھلا سبق**: [Capacity Planning](capacity-planning.md)
- **اگلا سبق**: [Preflight Checks](preflight-checks.md)‮

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ردِ ذمہ داری:
اس دستاویز کا ترجمہ AI ترجمہ سروس Co-op Translator (https://github.com/Azure/co-op-translator) کے ذریعے کیا گیا ہے۔ اگرچہ ہم درستگی کے لیے کوشاں ہیں، براہِ کرم نوٹ کریں کہ خودکار تراجم میں غلطیاں یا عدمِ درستیاں ہوسکتی ہیں۔ اصل دستاویز اپنی مادری زبان میں معتبر ماخذ شمار کی جانی چاہیے۔ اہم معلومات کے لیے پیشہ ور انسانی ترجمانی کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تعبیر کے لیے ہم ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->