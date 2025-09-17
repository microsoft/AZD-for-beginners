<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "952ed5af7f5db069c53a6840717e1801",
  "translation_date": "2025-09-17T16:26:46+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "fa"
}
-->
# راهنمای انتخاب SKU - انتخاب سطوح خدمات مناسب Azure

**فهرست فصل‌ها:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل فعلی**: فصل ۶ - اعتبارسنجی و برنامه‌ریزی پیش از استقرار
- **⬅️ قبلی**: [برنامه‌ریزی ظرفیت](capacity-planning.md)
- **➡️ بعدی**: [بررسی‌های پیش از اجرا](preflight-checks.md)
- **🚀 فصل بعدی**: [فصل ۷: رفع اشکال](../troubleshooting/common-issues.md)

## مقدمه

این راهنمای جامع به شما کمک می‌کند تا SKUهای خدمات Azure (واحدهای نگهداری موجودی) مناسب برای محیط‌ها، بارهای کاری و نیازهای مختلف را انتخاب کنید. با تحلیل نیازهای عملکردی، ملاحظات هزینه و الزامات مقیاس‌پذیری، بهترین سطوح خدمات را برای استقرارهای Azure Developer CLI انتخاب کنید.

## اهداف یادگیری

با تکمیل این راهنما، شما:
- مفاهیم SKUهای Azure، مدل‌های قیمت‌گذاری و تفاوت‌های ویژگی‌ها را درک خواهید کرد
- استراتژی‌های انتخاب SKU مخصوص محیط‌های توسعه، آزمایش و تولید را یاد خواهید گرفت
- نیازهای بار کاری را تحلیل کرده و آنها را با سطوح خدمات مناسب تطبیق خواهید داد
- استراتژی‌های بهینه‌سازی هزینه را از طریق انتخاب هوشمندانه SKU پیاده‌سازی خواهید کرد
- تکنیک‌های آزمایش عملکرد و اعتبارسنجی برای انتخاب SKU را اعمال خواهید کرد
- توصیه‌ها و نظارت خودکار SKU را پیکربندی خواهید کرد

## نتایج یادگیری

پس از تکمیل، شما قادر خواهید بود:
- SKUهای خدمات Azure مناسب را بر اساس نیازها و محدودیت‌های بار کاری انتخاب کنید
- معماری‌های چند محیطی مقرون‌به‌صرفه با انتخاب صحیح سطوح طراحی کنید
- معیارهای عملکرد و اعتبارسنجی برای انتخاب SKU را پیاده‌سازی کنید
- ابزارهای خودکار برای توصیه SKU و بهینه‌سازی هزینه ایجاد کنید
- برنامه‌ریزی مهاجرت SKU و استراتژی‌های مقیاس‌پذیری برای نیازهای در حال تغییر را انجام دهید
- اصول چارچوب معماری خوب Azure را در انتخاب سطوح خدمات اعمال کنید

## فهرست مطالب

- [درک SKUها](../../../../docs/pre-deployment)
- [انتخاب بر اساس محیط](../../../../docs/pre-deployment)
- [راهنمایی‌های مخصوص خدمات](../../../../docs/pre-deployment)
- [استراتژی‌های بهینه‌سازی هزینه](../../../../docs/pre-deployment)
- [ملاحظات عملکرد](../../../../docs/pre-deployment)
- [جدول‌های مرجع سریع](../../../../docs/pre-deployment)
- [ابزارهای اعتبارسنجی](../../../../docs/pre-deployment)

---

## درک SKUها

### SKUها چیستند؟

SKUها (واحدهای نگهداری موجودی) سطوح خدمات و عملکرد مختلف برای منابع Azure را نشان می‌دهند. هر SKU ویژگی‌های متفاوتی ارائه می‌دهد:

- **ویژگی‌های عملکردی** (CPU، حافظه، توان عملیاتی)
- **دسترسی به ویژگی‌ها** (گزینه‌های مقیاس‌پذیری، سطوح SLA)
- **مدل‌های قیمت‌گذاری** (بر اساس مصرف، ظرفیت رزرو شده)
- **دسترسی منطقه‌ای** (همه SKUها در همه مناطق موجود نیستند)

### عوامل کلیدی در انتخاب SKU

1. **نیازهای بار کاری**
   - الگوهای ترافیک/بار مورد انتظار
   - نیازهای عملکردی (CPU، حافظه، I/O)
   - نیازهای ذخیره‌سازی و الگوهای دسترسی

2. **نوع محیط**
   - توسعه/آزمایش در مقابل تولید
   - نیازهای دسترسی
   - نیازهای امنیتی و انطباق

3. **محدودیت‌های بودجه**
   - هزینه‌های اولیه در مقابل هزینه‌های عملیاتی
   - تخفیف‌های ظرفیت رزرو شده
   - پیامدهای هزینه مقیاس‌پذیری خودکار

4. **پیش‌بینی رشد**
   - الزامات مقیاس‌پذیری
   - نیازهای ویژگی‌های آینده
   - پیچیدگی مهاجرت

---

## انتخاب بر اساس محیط

### محیط توسعه

**اولویت‌ها**: بهینه‌سازی هزینه، عملکرد پایه، فراهم‌سازی/حذف آسان

#### SKUهای پیشنهادی
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

#### ویژگی‌ها
- **App Service**: F1 (رایگان) یا B1 (پایه) برای آزمایش ساده
- **پایگاه داده‌ها**: سطح پایه با منابع حداقلی
- **ذخیره‌سازی**: استاندارد با افزونگی محلی فقط
- **محاسبات**: منابع مشترک قابل قبول
- **شبکه**: تنظیمات پایه

### محیط آزمایش/تست

**اولویت‌ها**: پیکربندی مشابه تولید، تعادل هزینه، قابلیت آزمایش عملکرد

#### SKUهای پیشنهادی
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

#### ویژگی‌ها
- **عملکرد**: ۷۰-۸۰٪ ظرفیت تولید
- **ویژگی‌ها**: بیشتر ویژگی‌های تولید فعال
- **افزونگی**: مقداری افزونگی جغرافیایی
- **مقیاس‌پذیری**: مقیاس‌پذیری محدود برای آزمایش
- **نظارت**: پشته نظارت کامل

### محیط تولید

**اولویت‌ها**: عملکرد، دسترسی، امنیت، انطباق، مقیاس‌پذیری

#### SKUهای پیشنهادی
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

#### ویژگی‌ها
- **دسترسی بالا**: الزامات SLA 99.9٪+
- **عملکرد**: منابع اختصاصی، توان عملیاتی بالا
- **امنیت**: ویژگی‌های امنیتی پیشرفته
- **مقیاس‌پذیری**: قابلیت‌های مقیاس‌پذیری کامل
- **نظارت**: مشاهده‌پذیری جامع

---

## راهنمایی‌های مخصوص خدمات

### Azure App Service

#### ماتریس تصمیم‌گیری SKU

| مورد استفاده | SKU پیشنهادی | دلیل |
|--------------|--------------|------|
| توسعه/آزمایش | F1 (رایگان) یا B1 (پایه) | مقرون‌به‌صرفه، کافی برای آزمایش |
| اپلیکیشن‌های تولید کوچک | S1 (استاندارد) | دامنه‌های سفارشی، SSL، مقیاس‌پذیری خودکار |
| اپلیکیشن‌های تولید متوسط | P1V3 (پریمیوم V3) | عملکرد بهتر، ویژگی‌های بیشتر |
| اپلیکیشن‌های پرترافیک | P2V3 یا P3V3 | منابع اختصاصی، عملکرد بالا |
| اپلیکیشن‌های حیاتی | I1V2 (ایزوله V2) | ایزوله شبکه، سخت‌افزار اختصاصی |

#### مثال‌های پیکربندی

**توسعه**
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

**تولید**
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

#### چارچوب انتخاب SKU

1. **بر اساس DTU (واحدهای تراکنش پایگاه داده)**
   - **پایه**: ۵ DTU - توسعه/آزمایش
   - **استاندارد**: S0-S12 (۱۰-۳۰۰۰ DTU) - عمومی
   - **پریمیوم**: P1-P15 (۱۲۵-۴۰۰۰ DTU) - عملکرد حیاتی

2. **بر اساس vCore** (پیشنهادی برای تولید)
   - **عمومی**: تعادل بین محاسبات و ذخیره‌سازی
   - **حیاتی برای کسب‌وکار**: تأخیر کم، IOPS بالا
   - **Hyperscale**: ذخیره‌سازی بسیار مقیاس‌پذیر (تا ۱۰۰ ترابایت)

#### مثال‌های پیکربندی

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

#### انواع محیط

1. **بر اساس مصرف**
   - قیمت‌گذاری بر اساس استفاده
   - مناسب برای توسعه و بارهای کاری متغیر
   - زیرساخت مشترک

2. **اختصاصی (پروفایل‌های بار کاری)**
   - منابع محاسباتی اختصاصی
   - عملکرد قابل پیش‌بینی
   - مناسب برای بارهای کاری تولید

#### مثال‌های پیکربندی

**توسعه (مصرف)**
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

**تولید (اختصاصی)**
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

#### مدل‌های توان عملیاتی

1. **توان عملیاتی دستی**
   - عملکرد قابل پیش‌بینی
   - تخفیف‌های ظرفیت رزرو شده
   - بهترین برای بارهای کاری ثابت

2. **توان عملیاتی خودکار**
   - مقیاس‌پذیری خودکار بر اساس استفاده
   - پرداخت بر اساس استفاده (با حداقل)
   - مناسب برای بارهای کاری متغیر

3. **بدون سرور**
   - پرداخت بر اساس درخواست
   - بدون توان عملیاتی رزرو شده
   - ایده‌آل برای توسعه و بارهای کاری متناوب

#### مثال‌های SKU

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

#### انواع حساب ذخیره‌سازی

1. **Standard_LRS** - توسعه، داده‌های غیر حیاتی
2. **Standard_GRS** - تولید، نیاز به افزونگی جغرافیایی
3. **Premium_LRS** - اپلیکیشن‌های با عملکرد بالا
4. **Premium_ZRS** - دسترسی بالا با افزونگی منطقه‌ای

#### سطوح عملکرد

- **استاندارد**: عمومی، مقرون‌به‌صرفه
- **پریمیوم**: عملکرد بالا، سناریوهای تأخیر کم

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

## استراتژی‌های بهینه‌سازی هزینه

### ۱. ظرفیت رزرو شده

منابع را برای ۱-۳ سال رزرو کنید تا تخفیف‌های قابل توجه دریافت کنید:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### ۲. اندازه‌گیری صحیح

با SKUهای کوچک‌تر شروع کنید و بر اساس استفاده واقعی مقیاس‌پذیری کنید:

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

### ۳. پیکربندی مقیاس‌پذیری خودکار

مقیاس‌پذیری هوشمند را برای بهینه‌سازی هزینه پیاده‌سازی کنید:

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

### ۴. مقیاس‌پذیری زمان‌بندی شده

در ساعات غیرکاری مقیاس را کاهش دهید:

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

## ملاحظات عملکرد

### الزامات عملکرد پایه

نیازهای عملکردی واضح را قبل از انتخاب SKU تعریف کنید:

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

### آزمایش بار

SKUهای مختلف را برای اعتبارسنجی عملکرد آزمایش کنید:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### نظارت و بهینه‌سازی

نظارت جامع را تنظیم کنید:

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

## جدول‌های مرجع سریع

### مرجع سریع SKUهای App Service

| SKU | سطح | vCPU | RAM | ذخیره‌سازی | محدوده قیمت | مورد استفاده |
|-----|-----|------|-----|------------|-------------|--------------|
| F1 | رایگان | مشترک | ۱GB | ۱GB | رایگان | توسعه |
| B1 | پایه | ۱ | ۱.۷۵GB | ۱۰GB | $ | اپلیکیشن‌های کوچک |
| S1 | استاندارد | ۱ | ۱.۷۵GB | ۵۰GB | $$ | تولید |
| P1V3 | پریمیوم V3 | ۲ | ۸GB | ۲۵۰GB | $$$ | عملکرد بالا |
| I1V2 | ایزوله V2 | ۲ | ۸GB | ۱TB | $$$$ | سازمانی |

### مرجع سریع SKUهای SQL Database

| SKU | سطح | DTU/vCore | ذخیره‌سازی | محدوده قیمت | مورد استفاده |
|-----|-----|-----------|------------|-------------|--------------|
| پایه | پایه | ۵ DTU | ۲GB | $ | توسعه |
| S2 | استاندارد | ۵۰ DTU | ۲۵۰GB | $$ | تولید کوچک |
| P2 | پریمیوم | ۲۵۰ DTU | ۱TB | $$$ | عملکرد بالا |
| GP_Gen5_4 | عمومی | ۴ vCore | ۴TB | $$$ | متعادل |
| BC_Gen5_8 | حیاتی برای کسب‌وکار | ۸ vCore | ۴TB | $$$$ | حیاتی |

### مرجع سریع SKUهای Container Apps

| مدل | قیمت‌گذاری | CPU/حافظه | مورد استفاده |
|-----|------------|-----------|--------------|
| مصرف | پرداخت بر اساس استفاده | ۰.۲۵-۲ vCPU | توسعه، بار متغیر |
| اختصاصی D4 | رزرو شده | ۴ vCPU، ۱۶GB | تولید |
| اختصاصی D8 | رزرو شده | ۸ vCPU، ۳۲GB | عملکرد بالا |

---

## ابزارهای اعتبارسنجی

### بررسی‌کننده دسترسی SKU

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

### اسکریپت تخمین هزینه

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

### اعتبارسنجی عملکرد

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

## خلاصه بهترین شیوه‌ها

### بایدها

1. **کوچک شروع کنید و بر اساس استفاده واقعی مقیاس‌پذیری کنید**
2. **از SKUهای مختلف برای محیط‌های مختلف استفاده کنید**
3. **عملکرد و هزینه‌ها را به طور مداوم نظارت کنید**
4. **برای بارهای کاری تولید از ظرفیت رزرو شده استفاده کنید**
5. **در صورت لزوم مقیاس‌پذیری خودکار را پیاده‌سازی کنید**
6. **عملکرد را با بارهای کاری واقعی آزمایش کنید**
7. **برای رشد برنامه‌ریزی کنید اما از بیش‌ازحد فراهم کردن اجتناب کنید**
8. **در صورت امکان از سطوح رایگان برای توسعه استفاده کنید**

### نبایدها

1. **از SKUهای تولید برای توسعه استفاده نکنید**
2. **دسترسی منطقه‌ای SKUها را نادیده نگیرید**
3. **هزینه‌های انتقال داده را فراموش نکنید**
4. **بدون توجیه بیش‌ازحد فراهم نکنید**
5. **تأثیر وابستگی‌ها را نادیده نگیرید**
6. **محدودیت‌های مقیاس‌پذیری خودکار را بیش‌ازحد بالا تنظیم نکنید**
7. **نیازهای انطباق را فراموش نکنید**
8. **تصمیمات را فقط بر اساس قیمت نگیرید**

---

**نکته حرفه‌ای**: از Azure Cost Management و Advisor برای دریافت توصیه‌های شخصی‌سازی شده جهت بهینه‌سازی انتخاب SKU بر اساس الگوهای استفاده واقعی استفاده کنید.

---

**ناوبری**
- **درس قبلی**: [برنامه‌ریزی ظرفیت](capacity-planning.md)
- **درس بعدی**: [بررسی‌های پیش از اجرا](preflight-checks.md)

---

**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما تلاش می‌کنیم دقت را حفظ کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌ها باشند. سند اصلی به زبان اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس، توصیه می‌شود از ترجمه حرفه‌ای انسانی استفاده کنید. ما مسئولیتی در قبال سوء تفاهم‌ها یا تفسیرهای نادرست ناشی از استفاده از این ترجمه نداریم.