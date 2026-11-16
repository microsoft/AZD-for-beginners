# راهنمای انتخاب SKU - انتخاب لایه‌های مناسب سرویس Azure

**ناوبری فصل:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل فعلی**: فصل 6 - اعتبارسنجی و برنامه‌ریزی پیش از استقرار
- **⬅️ قبلی**: [برنامه‌ریزی ظرفیت](capacity-planning.md)
- **➡️ بعدی**: [بررسی‌های پیش‌پرواز](preflight-checks.md)
- **🚀 فصل بعدی**: [فصل 7: عیب‌یابی](../chapter-07-troubleshooting/common-issues.md)

## مقدمه

این راهنمای جامع به شما کمک می‌کند تا بهترین SKUهای سرویس Azure را برای محیط‌ها، بارهای کاری و نیازهای مختلف انتخاب کنید. بیاموزید که چگونه نیازهای عملکرد، ملاحظات هزینه و الزامات مقیاس‌پذیری را تحلیل کنید تا مناسب‌ترین لایه‌های سرویس را برای استقرارهای Azure Developer CLI خود انتخاب نمایید.

## اهداف یادگیری

با تکمیل این راهنما، شما:
- مفاهیم SKUهای Azure، مدل‌های قیمت‌گذاری و تفاوت‌های ویژگی‌ها را می‌آموزید
- استراتژی‌های انتخاب SKU مخصوص محیط‌های توسعه، مرحله‌بندی و تولید را مسلط می‌شوید
- نیازهای بار کاری را تحلیل کرده و آن‌ها را با لایه‌های مناسب سرویس تطبیق می‌دهید
- استراتژی‌های بهینه‌سازی هزینه با انتخاب هوشمند SKU را اجرا می‌کنید
- تکنیک‌های آزمون عملکرد و اعتبارسنجی انتخاب SKU را به‌کار می‌گیرید
- پیکربندی اتوماسیون توصیه‌ها و نظارت SKU را انجام می‌دهید

## نتایج یادگیری

پس از اتمام، قادر خواهید بود:
- SKUهای مناسب سرویس Azure را بر اساس نیازهای بار کاری و محدودیت‌ها انتخاب کنید
- معماری‌های چند محیطی مقرون‌به‌صرفه با انتخاب لایه مناسب طراحی نمایید
- معیارهای عملکرد و اعتبارسنجی برای انتخاب SKU اجرا کنید
- ابزارهای خودکار برای توصیه SKU و بهینه‌سازی هزینه ایجاد کنید
- برنامه‌ریزی مهاجرت و استراتژی‌های مقیاس‌گذاری SKU برای نیازهای متغیر را انجام دهید
- اصول چارچوب Azure Well-Architected را در انتخاب لایه سرویس به‌کار برید

## فهرست مطالب

- [درک SKUها](#understanding-skus)
- [انتخاب مبتنی بر محیط](#environment-based-selection)
- [راهنمایی‌های خاص سرویس](#service-specific-guidelines)
- [استراتژی‌های بهینه‌سازی هزینه](#cost-optimization-strategies)
- [ملاحظات عملکرد](#performance-considerations)
- [جداول مرجع سریع](#quick-reference-tables)
- [ابزارهای اعتبارسنجی](#validation-tools)

---

## درک SKUها

> **دامنه مثال:** نقشه‌های YAML SKU و پیکربندی‌های عملکرد زیر یادداشت‌های طراحی هستند، نه یک `azure.yaml` شمای واقعی یا پیکربندی ابزار بارگذاری. بلوک‌های Bicep جایگزین‌ها/قطعات هستند: پارامترها و منابع والد خود را اعلام کنید، هنگام ترکیب آن‌ها از نام‌های نمادین منحصربه‌فرد استفاده کنید و ماژول‌ها را به پروژه‌ای کاری وصل نمایید. قیمت‌ها، محدودیت‌ها و در دسترس بودن منطقه‌ای/SKU باید پیش از استقرار برای اشتراک شما بررسی شود.

### SKUها چیستند؟

SKUها (Stock Keeping Units) نشان‌دهنده لایه‌های سرویس و سطوح عملکرد متفاوت برای منابع Azure هستند. هر SKU ویژگی‌های متفاوتی ارائه می‌دهد:

- **ویژگی‌های عملکردی** (CPU، حافظه، توان عملیاتی)
- **دسترس‌پذیری ویژگی‌ها** (گزینه‌های مقیاس‌پذیری، سطوح SLA)
- **مدل‌های قیمت‌گذاری** (براساس مصرف، ظرفیت رزرو شده)
- **دسترس‌پذیری منطقه‌ای** (تمام SKUها در همه مناطق در دسترس نیستند)

### عوامل کلیدی در انتخاب SKU

1. **نیازهای بار کاری**
   - الگوهای ترافیک/بار مورد انتظار
   - نیازهای عملکردی (CPU، حافظه، ورودی/خروجی)
   - نیازهای ذخیره‌سازی و الگوهای دسترسی

2. **نوع محیط**
   - توسعه/آزمایش در مقابل تولید
   - نیازهای دسترس‌پذیری
   - نیازهای امنیتی و تطبیق

3. **محدودیت‌های بودجه**
   - هزینه‌های اولیه در مقابل هزینه‌های عملیاتی
   - تخفیف‌های ظرفیت رزرو شده
   - تأثیر هزینه مقیاس‌پذیری خودکار

4. **پیش‌بینی رشد**
   - نیازهای مقیاس‌پذیری
   - نیازهای ویژگی‌های آینده
   - پیچیدگی مهاجرت

---

## انتخاب مبتنی بر محیط

### محیط توسعه

**اولویت‌ها**: بهینه‌سازی هزینه، عملکرد پایه، تأمین/لغو آسان

#### SKUهای پیشنهادی
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

#### ویژگی‌ها
- **App Service**: F1 (رایگان) یا B1 (پایه) برای آزمایش ساده
- **پایگاه‌داده‌ها**: لایه پایه با منابع حداقلی
- **ذخیره‌سازی**: استاندارد با افزونگی محلی فقط
- **محاسبات**: منابع مشترک قابل قبول
- **شبکه‌بندی**: پیکربندی‌های پایه

### محیط مرحله‌بندی/آزمایش

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
- **ویژگی‌ها**: بیشتر ویژگی‌های تولید فعال است
- **افزونگی**: برخی افزونگی جغرافیایی
- **مقیاس‌گذاری**: مقیاس‌گذاری خودکار محدود برای آزمایش
- **نظارت**: مجموعه کامل نظارتی

### محیط تولید

**اولویت‌ها**: عملکرد، دسترس‌پذیری، امنیت، تطبیق، مقیاس‌پذیری

#### SKUهای پیشنهادی
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

#### ویژگی‌ها
- **دسترس‌پذیری بالا**: الزامات SLA بالای ۹۹.۹٪
- **عملکرد**: منابع اختصاصی، توان عملیاتی بالا
- **امنیت**: ویژگی‌های امنیتی پرمیوم
- **مقیاس‌گذاری**: قابلیت‌های مقیاس‌گذاری خودکار کامل
- **نظارت**: رصد جامع

---

## راهنمایی‌های خاص سرویس

### سرویس Azure App

#### ماتریس تصمیم‌گیری SKU

| مورد استفاده | SKU پیشنهادی | دلیل |
|----------|----------------|-----------|
| توسعه/آزمایش | F1 (رایگان) یا B1 (پایه) | مقرون‌به‌صرفه، مناسب برای آزمایش |
| برنامه‌های کوچک تولید | S1 (استاندارد) | دامنه‌های سفارشی، SSL، مقیاس‌گذاری خودکار |
| برنامه‌های متوسط تولید | P1V3 (پریمیوم V3) | عملکرد بهتر، ویژگی‌های بیشتر |
| برنامه‌های پر ترافیک | P2V3 یا P3V3 | منابع اختصاصی، عملکرد بالا |
| برنامه‌های حیاتی ماموریت | I1V2 (ایزوله V2) | ایزولاسیون شبکه، سخت‌افزار اختصاصی |

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

### پایگاه داده Azure SQL

#### چارچوب انتخاب SKU

1. **براساس DTU (واحدهای تراکنش پایگاه داده)**
   - **پایه**: ۵ DTU - توسعه/آزمایش
   - **استاندارد**: S0-S12 (۱۰-۳۰۰۰ DTU) - عمومی
   - **پریمیوم**: P1-P15 (۱۲۵-۴۰۰۰ DTU) - عملکرد حیاتی

2. **براساس vCore** (توصیه شده برای تولید)
   - **هدف عمومی**: توازن محاسبه و ذخیره‌سازی
   - **حیاتی کسب‌وکار**: تأخیر پایین، IOPS بالا
   - **هایپراسکیل**: ذخیره‌سازی بسیار مقیاس‌پذیر؛ محدودیت‌های فعلی اندازه و پشتیبانی منطقه‌ای را بررسی کنید

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

### برنامه‌های کانتینری Azure

#### انواع محیط

1. **براساس مصرف**
   - قیمت‌گذاری براساس استفاده
   - مناسب برای توسعه و بارهای متغیر
   - زیرساخت مشترک

2. **اختصاصی (پروفایل‌های بار کاری)**
   - منابع محاسباتی اختصاصی
   - عملکرد قابل پیش‌بینی
   - بهتر برای بارهای کاری تولید

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

**تولید (اختصاصی)**
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

افزونگی منطقه‌ای همچنین نیازمند زیرساخت منطقه پشتیبانی شده و پیکربندی مناسب VNet/subnet است که در اینجا حذف شده است. این مثال بودجه سه گره اختصاصی را می‌دهد؛ حداقل دو نسخه اپ را برای توزیع میان مناطق پیکربندی کنید و هم نسخه‌ها و هم گره‌ها را برای خرابی منطقه اندازه کنید. راهنمای [قابلیت اطمینان برنامه‌های کانتینری](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps) را ببینید. برای قرار دادن اپ روی این پروفایل، مقداردهی `workloadProfileName: 'production-profile'` آن لازم است؛ فقط ایجاد پروفایل اپ‌ها را انتقال نمی‌دهد.

### پایگاه داده Azure Cosmos

#### مدل‌های توان عملیاتی

1. **توان عملیاتی اختصاصی دستی**
   - عملکرد قابل پیش‌بینی
   - تخفیف‌های ظرفیت رزرو شده
   - بهترین گزینه برای بارهای کاری پایدار

2. **توان عملیاتی خودکار مقیاس‌شونده**
   - مقیاس‌گذاری خودکار براساس استفاده
   - پرداخت براساس مصرف (با حداقل)
   - مناسب برای بارهای متغیر

3. **بدون سرور (Serverless)**
   - پرداخت براساس درخواست
   - بدون توان عملیاتی اختصاصی
   - ایده‌آل برای توسعه و بارهای کاری گهگاهی

#### نمونه‌های SKU

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

### حساب ذخیره‌سازی Azure

#### انواع حساب ذخیره‌سازی

1. **Standard_LRS** - توسعه، داده‌های غیر حیاتی
2. **Standard_GRS** - تولید، نیاز به افزونگی جغرافیایی
3. **Premium_LRS** - برنامه‌های پر عملکرد
4. **Premium_ZRS** - دسترس‌پذیری بالا با افزونگی منطقه‌ای

#### لایه‌های عملکردی

- **استاندارد**: هدف عمومی، مقرون‌به‌صرفه
- **پریمیوم**: عملکرد بالا، سناریوهای با تأخیر پایین

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

### 1. ظرفیت رزرو شده

منابع را برای ۱ تا ۳ سال رزرو کنید تا تخفیف قابل توجهی دریافت کنید:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

گزینه‌های رزرو و انواع منابع واجد شرایط متفاوت است؛ کاتالوگ و شرایط خرید را بررسی کنید و فرض نکنید هر سرویس/SKU از رزرو پشتیبانی می‌کند.

### 2. اندازه‌گیری صحیح

با SKUهای کوچک‌تر شروع کنید و بر اساس استفاده واقعی، مقیاس کنید:

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

### 3. پیکربندی مقیاس‌گذاری خودکار

مقیاس‌گذاری هوشمند را برای بهینه‌سازی هزینه‌ها اجرا کنید:

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

### 4. مقیاس‌گذاری زمان‌بندی شده

در ساعات کم‌بار مقیاس را کاهش دهید:

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

## ملاحظات عملکردی

### نیازهای عملکرد پایه

پیش از انتخاب SKU نیازهای عملکرد را به‌وضوح تعریف کنید:

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

SKUهای مختلف را تست کنید تا عملکرد را تأیید کنید:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### نظارت و بهینه‌سازی

یک نظارت جامع راه‌اندازی کنید:

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

## جداول مرجع سریع

### مرجع سریع SKU سرویس App

| SKU | لایه | vCPU | RAM | ذخیره‌سازی | بازه قیمت | مورد استفاده |
|-----|------|------|-----|---------|-------------|----------|
| F1 | رایگان | اشتراکی | 1GB | 1GB | رایگان | توسعه |
| B1 | پایه | 1 | 1.75GB | 10GB | $ | برنامه‌های کوچک |
| S1 | استاندارد | 1 | 1.75GB | 50GB | $$ | تولید |
| P1V3 | پریمیوم V3 | 2 | 8GB | 250GB | $$$ | عملکرد بالا |
| I1V2 | ایزوله V2 | 2 | 8GB | 1TB | $$$$ | سازمانی |

### مرجع سریع SKU پایگاه داده SQL

| SKU | لایه | DTU/vCore | ذخیره‌سازی | بازه قیمت | مورد استفاده |
|-----|------|-----------|---------|-------------|----------|
| پایه | پایه | ۵ DTU | ۲GB | $ | توسعه |
| S2 | استاندارد | ۵۰ DTU | ۲۵۰GB | $$ | تولید کوچک |
| P2 | پریمیوم | ۲۵۰ DTU | ۱TB | $$$ | عملکرد بالا |
| GP_Gen5_4 | هدف عمومی | ۴ vCore | ۴TB | $$$ | متعادل |
| BC_Gen5_8 | حیاتی کسب‌وکار | ۸ vCore | ۴TB | $$$$ | حیاتی ماموریت |

### مرجع سریع SKU برنامه‌های کانتینری

| مدل | قیمت‌گذاری | CPU/حافظه | مورد استفاده |
|-------|---------|------------|----------|
| مصرف | پرداخت به ازای استفاده | ترکیب‌های CPU/حافظه پشتیبانی‌شده بسته به محیط/پروفایل | توسعه یا تولید، بار متغیر |
| اختصاصی D4 | صورت‌حساب گره اختصاصی | ۴ vCPU، ۱۶GiB به ازای هر گره | بار پایدار/نیازهای ایزولاسیون |
| اختصاصی D8 | صورت‌حساب گره اختصاصی | ۸ vCPU، ۳۲GiB به ازای هر گره | بار پایدار بالا |

---

## ابزارهای اعتبارسنجی

### بررسی دسترس‌پذیری SKU

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

### اسکریپت برآورد هزینه

**فقط شبه‌کد:** `Get-ResourceCost` زیر تابع پروژه‌محوری است که باید با استفاده از قیمت‌گذاری منطقه‌ای/قراردادی جاری و مفروضات استفاده پیاده‌سازی کنید. این یک PowerShell یا cmdlet Azure نیست.

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

YAML زیر یک طرح نیازمندی‌هاست، **نه** یک شمای ورودی Azure Load Testing، JMeter، Locust یا k6. قبل از استفاده از دستور load-test بالا، آن را به پیکربندی واقعی ابزار منتخب خود تبدیل کنید.

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

## خلاصه بهترین روش‌ها

### بایدها

1. **از کوچک شروع کنید و بر اساس استفاده واقعی مقیاس دهید**
2. **از SKUهای مختلف برای محیط‌های مختلف استفاده کنید**
3. **عملکرد و هزینه‌ها را به صورت مداوم نظارت کنید**
4. **از ظرفیت رزرو شده برای بارهای کاری تولید بهره ببرید**
5. **در صورت لزوم مقیاس‌گذاری خودکار را پیاده‌سازی کنید**
6. **عملکرد را با بارهای کاری واقعی تست کنید**
7. **برای رشد برنامه‌ریزی کنید اما از تأمین بیش از حد اجتناب کنید**
8. **تا حد امکان از لایه‌های رایگان برای توسعه استفاده کنید**

### نبایدها

1. **از SKUهای تولید برای توسعه استفاده نکنید**
2. **دسترس‌پذیری منطقه‌ای SKU را نادیده نگیرید**
3. **هزینه‌های انتقال داده را فراموش نکنید**
4. **بدون دلیل موجه تأمین بیش از حد نکنید**
5. **تأثیر وابستگی‌ها را نادیده نگیرید**
6. **محدودیت‌های مقیاس‌گذاری خودکار را بیش از حد بالا تنظیم نکنید**
7. **نیازهای تطبیق را فراموش نکنید**
8. **تصمیم‌گیری را فقط براساس قیمت انجام ندهید**

---

**نکته تخصصی**: از Azure Cost Management و Advisor برای دریافت توصیه‌های شخصی‌شده در بهینه‌سازی انتخاب SKU بر اساس الگوهای استفاده واقعی بهره بگیرید.

---

**ناوبری**
- **درس قبلی**: [برنامه‌ریزی ظرفیت](capacity-planning.md)
- **درس بعدی**: [بررسی‌های پیش‌پرواز](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->