# راهنمای انتخاب SKU - انتخاب سطح مناسب سرویس‌های Azure

**ناوبری فصل:**
- **📚 صفحه دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل 6 - اعتبارسنجی و برنامه‌ریزی پیش از استقرار
- **⬅️ قبلی**: [برنامه‌ریزی ظرفیت](capacity-planning.md)
- **➡️ بعدی**: [بررسی‌های پیش‌پرواز](preflight-checks.md)
- **🚀 فصل بعد**: [فصل 7: رفع اشکال](../chapter-07-troubleshooting/common-issues.md)

## مقدمه

این راهنمای جامع به شما کمک می‌کند تا SKUهای سرویس Azure مناسب را برای محیط‌ها، بارهای کاری و نیازمندی‌های مختلف انتخاب کنید. یاد بگیرید چگونه نیازهای عملکرد، ملاحظات هزینه و نیازهای مقیاس‌پذیری را تحلیل کرده و مناسب‌ترین سطح سرویس را برای استقرارهای Azure Developer CLI خود انتخاب کنید.

## اهداف یادگیری

با تکمیل این راهنما، شما خواهید:
- مفاهیم SKU در Azure، مدل‌های قیمت‌گذاری و تفاوت‌های ویژگی‌ها را درک کنید
- استراتژی‌های انتخاب SKU ویژه محیط‌های توسعه، استیج و تولید را فرا بگیرید
- نیازمندی‌های بار کاری را تحلیل کرده و آن‌ها را با سطوح سرویس مناسب مطابقت دهید
- استراتژی‌های بهینه‌سازی هزینه را از طریق انتخاب هوشمندانه SKU پیاده‌سازی کنید
- تکنیک‌های تست عملکرد و اعتبارسنجی را برای انتخاب SKU اعمال کنید
- توصیه‌ها و نظارت خودکار برای SKUها را پیکربندی کنید

## نتایج یادگیری

با اتمام این راهنما، شما قادر خواهید بود:
- SKUهای سرویس Azure مناسب را بر اساس نیازها و محدودیت‌های بار کاری انتخاب کنید
- معماری‌های چند محیطی هزینه-موثر را با انتخاب مناسب سطوح طراحی کنید
- معیارسنجی عملکرد و اعتبارسنجی را برای انتخاب SKUها پیاده‌سازی کنید
- ابزارهای خودکار برای توصیه SKU و بهینه‌سازی هزینه ایجاد کنید
- برنامه‌های مهاجرت و مقیاس‌دهی SKU را برای نیازهای در حال تغییر برنامه‌ریزی کنید
- اصول چارچوب Well-Architected Azure را در انتخاب سطح سرویس اعمال کنید

## فهرست مطالب

- [درک SKUها](../../../../docs/chapter-06-pre-deployment)
- [انتخاب بر اساس محیط](../../../../docs/chapter-06-pre-deployment)
- [راهنمایی‌های مربوط به سرویس‌ها](../../../../docs/chapter-06-pre-deployment)
- [استراتژی‌های بهینه‌سازی هزینه](../../../../docs/chapter-06-pre-deployment)
- [ملاحظات عملکرد](../../../../docs/chapter-06-pre-deployment)
- [جداول مرجع سریع](../../../../docs/chapter-06-pre-deployment)
- [ابزارهای اعتبارسنجی](../../../../docs/chapter-06-pre-deployment)

---

## درک SKUها

### SKUها چه هستند؟

SKUها (Stock Keeping Units) نماینده سطح‌های سرویس و سطوح عملکرد متفاوت برای منابع Azure هستند. هر SKU ویژگی‌های متفاوتی ارائه می‌دهد:

- **ویژگی‌های عملکردی** (CPU، حافظه، توان عملیاتی)
- **دسترسی به ویژگی‌ها** (گزینه‌های مقیاس‌دهی، سطوح SLA)
- **مدل‌های قیمت‌گذاری** (پایه مصرفی، ظرفیت رزرو شده)
- **دسترسی منطقه‌ای** (تمام SKUها در همه مناطق در دسترس نیستند)

### عوامل کلیدی در انتخاب SKU

1. **نیازمندی‌های بار کاری**
   - الگوهای ترافیک/بار مورد انتظار
   - نیازمندی‌های عملکرد (CPU، حافظه، I/O)
   - نیازهای ذخیره‌سازی و الگوهای دسترسی

2. **نوع محیط**
   - توسعه/آزمایش در مقابل تولید
   - نیازمندی‌های دسترسی
   - نیازمندی‌های امنیتی و انطباق

3. **محدودیت‌های بودجه**
   - هزینه‌های اولیه در مقابل هزینه‌های عملیاتی
   - تخفیف‌های ظرفیت رزرو شده
   - پیامدهای هزینه مقیاس‌بندی خودکار

4. **پیش‌بینی رشد**
   - نیازمندی‌های مقیاس‌پذیری
   - نیازهای ویژگی آینده
   - پیچیدگی مهاجرت

---

## انتخاب بر اساس محیط

### محیط توسعه

**اولویت‌ها**: بهینه‌سازی هزینه، قابلیت پایه‌ای، تهیه/لغو تهیه آسان

#### Recommended SKUs
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

#### مشخصات
- **App Service**: F1 (Free) یا B1 (Basic) برای تست‌های ساده
- **دیتابیس‌ها**: سطح Basic با حداقل منابع
- **ذخیره‌سازی**: Standard با افزونگی محلی فقط
- **محاسبات**: منابع مشترک قابل قبول
- **شبکه**: پیکربندی‌های پایه

### محیط استیج/آزمایش

**اولویت‌ها**: پیکربندی مشابه تولید، تعادل هزینه، قابلیت تست عملکرد

#### Recommended SKUs
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

#### مشخصات
- **عملکرد**: 70-80% از ظرفیت تولید
- **ویژگی‌ها**: اکثر ویژگی‌های تولید فعال
- **افزونگی**: مقداری افزونگی جغرافیایی
- **مقیاس‌دهی**: مقیاس‌دهی خودکار محدود برای تست
- **نظارت**: پشته کامل نظارتی

### محیط تولید

**اولویت‌ها**: عملکرد، دسترسی، امنیت، انطباق، مقیاس‌پذیری

#### Recommended SKUs
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

#### مشخصات
- **دسترس‌پذیری بالا**: نیازمندی‌های SLA برابر یا بالاتر از 99.9%+
- **عملکرد**: منابع اختصاصی، توان عملیاتی بالا
- **امنیت**: ویژگی‌های امنیتی پریمیوم
- **مقیاس‌دهی**: قابلیت‌های مقیاس‌دهی خودکار کامل
- **نظارت**: قابل مشاهده‌سازی جامع

---

## راهنمایی‌های مربوط به سرویس‌ها

### Azure App Service

#### ماتریس تصمیم‌گیری SKU

| Use Case | Recommended SKU | Rationale |
|----------|----------------|-----------|
| Development/Testing | F1 (Free) or B1 (Basic) | اقتصادی، کافی برای تست |
| Small production apps | S1 (Standard) | دامنه‌های سفارشی، SSL، مقیاس‌دهی خودکار |
| Medium production apps | P1V3 (Premium V3) | عملکرد بهتر، ویژگی‌های بیشتر |
| High-traffic apps | P2V3 or P3V3 | منابع اختصاصی، عملکرد بالا |
| Mission-critical apps | I1V2 (Isolated V2) | جداسازی شبکه، سخت‌افزار اختصاصی |

#### نمونه‌های پیکربندی

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

#### چارچوب انتخاب SKU

1. **بر پایه DTU (Database Transaction Units)**
   - **Basic**: 5 DTU - توسعه/تست
   - **Standard**: S0-S12 (10-3000 DTU) - عمومی
   - **Premium**: P1-P15 (125-4000 DTU) - عملکرد بحرانی

2. **بر پایه vCore** (توصیه‌شده برای تولید)
   - **General Purpose**: تعادل بین محاسبه و ذخیره‌سازی
   - **Business Critical**: تاخیر کم، IOPS بالا
   - **Hyperscale**: ذخیره‌سازی بسیار مقیاس‌پذیر (تا 100TB)

#### نمونه‌های پیکربندی

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

1. **بر پایه مصرف (Consumption-based)**
   - قیمت‌گذاری به‌ازای مصرف
   - مناسب برای توسعه و بارهای کاری متغیر
   - زیرساخت مشترک

2. **اختصاصی (پروفایل‌های بار کاری)**
   - منابع محاسباتی اختصاصی
   - عملکرد قابل پیش‌بینی
   - مناسب‌تر برای بارهای تولید

#### نمونه‌های پیکربندی

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

#### مدل‌های توان عملیاتی

1. **توان عملیاتی تامین‌شده دستی**
   - عملکرد قابل پیش‌بینی
   - تخفیف‌های ظرفیت رزرو شده
   - بهترین برای بارهای کاری پایدار

2. **توان عملیاتی تامین‌شده با مقیاس خودکار**
   - مقیاس خودکار بر اساس استفاده
   - پرداخت بر اساس آنچه استفاده می‌کنید (با حداقل)
   - مناسب برای بارهای متغیر

3. **سرورلس**
   - پرداخت به ازای درخواست
   - بدون توان عملیاتی تامین‌شده
   - ایده‌آل برای توسعه و بارهای متناوب

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

1. **Standard_LRS** - توسعه، داده‌های غیر بحرانی
2. **Standard_GRS** - تولید، نیاز به افزونگی جغرافیایی
3. **Premium_LRS** - برنامه‌های با عملکرد بالا
4. **Premium_ZRS** - دسترس‌پذیری بالا با افزونگی ناحیه‌ای

#### سطوح عملکرد

- **Standard**: چندمنظوره، اقتصادی
- **Premium**: عملکرد بالا، سناریوهای با تاخیر کم

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

منابع را برای 1-3 سال رزرو کنید برای دریافت تخفیف‌های قابل توجه:

```bash
# گزینه‌های رزرو را بررسی کنید
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. اندازه مناسب (Right-Sizing)

با SKUهای کوچک‌تر شروع کنید و بر اساس استفاده واقعی بزرگ‌تر شوید:

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

### 3. پیکربندی مقیاس‌بندی خودکار

مقیاس‌دهی هوشمند را برای بهینه‌سازی هزینه پیاده‌سازی کنید:

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

### 4. مقیاس‌بندی زمان‌بندی‌شده

در ساعات کم‌کاری، مقیاس را کاهش دهید:

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

### نیازمندی‌های عملکرد پایه

قبل از انتخاب SKU، نیازمندی‌های عملکرد را به‌وضوح تعریف کنید:

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

### تست بار

SKUهای مختلف را برای اعتبارسنجی عملکرد آزمایش کنید:

```bash
# سرویس تست بارگذاری آژور
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### نظارت و بهینه‌سازی

نظارت جامع را راه‌اندازی کنید:

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

## جداول مرجع سریع

### مرجع سریع SKUهای App Service

| SKU | Tier | vCPU | RAM | Storage | Price Range | Use Case |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | Development |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Small apps |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Production |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | High performance |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Enterprise |

### مرجع سریع SKUهای SQL Database

| SKU | Tier | DTU/vCore | Storage | Price Range | Use Case |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Development |
| S2 | Standard | 50 DTU | 250GB | $$ | Small production |
| P2 | Premium | 250 DTU | 1TB | $$$ | High performance |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Balanced |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Mission critical |

### مرجع سریع SKUهای Container Apps

| Model | Pricing | CPU/Memory | Use Case |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | Development, variable load |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | Production |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | High performance |

---

## ابزارهای اعتبارسنجی

### بررسی‌کننده دسترسی SKU

```bash
#!/bin/bash
# بررسی در دسترس بودن SKU در منطقه هدف

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

# نحوه استفاده
check_sku_availability "eastus" "app-service" "P1V3"
```

### اسکریپت برآورد هزینه

```powershell
# اسکریپت PowerShell برای برآورد هزینه
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
        
        # از API قیمت‌گذاری Azure یا ماشین‌حساب آن استفاده کنید
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# نحوه استفاده
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

1. **با کوچک شروع کنید و بر اساس استفاده واقعی مقیاس دهید**
2. **برای محیط‌های مختلف از SKUهای متفاوت استفاده کنید**
3. **عملکرد و هزینه‌ها را به‌طور مستمر نظارت کنید**
4. **برای بارهای تولید از ظرفیت رزرو شده استفاده کنید**
5. **در مواقع مناسب مقیاس‌بندی خودکار را پیاده‌سازی کنید**
6. **عملکرد را با بارهای کاری واقع‌گرایانه تست کنید**
7. **برای رشد برنامه‌ریزی کنید ولی از تخصیص بیش از حد اجتناب کنید**
8. **در توسعه تا حد امکان از سطوح رایگان استفاده کنید**

### نبایدها

1. **از SKUهای تولید در محیط توسعه استفاده نکنید**
2. **در دسترس بودن منطقه‌ای SKUها را نادیده نگیرید**
3. **هزینه‌های انتقال داده را فراموش نکنید**
4. **بدون توجیه بیش از حد تخصیص نکنید**
5. **تاثیر وابستگی‌ها را نادیده نگیرید**
6. **محدودیت‌های مقیاس‌بندی خودکار را خیلی بالا تنظیم نکنید**
7. **نیازمندی‌های انطباق را فراموش نکنید**
8. **فقط بر اساس قیمت تصمیم‌گیری نکنید**

---

**نکته حرفه‌ای**: از Azure Cost Management و Advisor برای دریافت توصیه‌های شخصی‌سازی‌شده برای بهینه‌سازی انتخاب‌های SKU بر اساس الگوهای استفاده واقعی استفاده کنید.

---

**ناوبری**
- **درس قبلی**: [برنامه‌ریزی ظرفیت](capacity-planning.md)
- **درس بعدی**: [بررسی‌های پیش‌پرواز](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
سلب مسئولیت:
این سند با استفاده از سرویس ترجمهٔ هوش مصنوعی Co-op Translator (https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما برای دقت تلاش می‌کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطاها یا نادرستی‌هایی باشند. نسخهٔ اصلی سند به زبان مبدأ باید به‌عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس یا حیاتی، ترجمهٔ حرفه‌ای توسط انسان توصیه می‌شود. ما در قبال هرگونه سوءتفاهم یا تفسیر نادرستی که از استفاده از این ترجمه ناشی شود، مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->