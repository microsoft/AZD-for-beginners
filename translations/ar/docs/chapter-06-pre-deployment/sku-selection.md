# دليل اختيار SKU - اختيار مستويات خدمة Azure المناسبة

**تنقل الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD For Beginners](../../README.md)
- **📖 الفصل الحالي**: الفصل 6 - التحقق والتخطيط قبل النشر
- **⬅️ السابق**: [Capacity Planning](capacity-planning.md)
- **➡️ التالي**: [Pre-flight Checks](preflight-checks.md)
- **🚀 الفصل التالي**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/common-issues.md)

## المقدمة

هذا الدليل الشامل يساعدك على اختيار SKUs المناسبة لخدمات Azure لمختلف البيئات، والأحمال، والمتطلبات. تعلّم كيفية تحليل احتياجات الأداء، واعتبارات التكلفة، ومتطلبات القابلية للتوسع لاختيار مستويات الخدمة الأنسب لنشر Azure Developer CLI الخاص بك.

## أهداف التعلم

بإكمال هذا الدليل، سوف:
- تفهم مفاهيم SKU ونماذج التسعير والفروقات في الميزات في Azure
- تتقن استراتيجيات اختيار SKU المخصصة لكل بيئة للتطوير والمرحلة الوسيطة والإنتاج
- تحلل متطلبات الأحمال وتطابقها مع مستويات الخدمة المناسبة
- تطبق استراتيجيات تحسين التكلفة من خلال اختيار SKU ذكي
- تطبق تقنيات اختبار الأداء والتحقق لخيارات SKU
- تكوّن إعدادات التوصية التلقائية لـ SKU والمراقبة

## مخرجات التعلم

عند الإكمال، ستتمكن من:
- اختيار SKUs المناسبة لخدمات Azure بناءً على متطلبات وحواجز الأحمال
- تصميم بنى متعددة البيئات فعّالة من حيث التكلفة مع اختيار المستويات الملائمة
- تنفيذ قياس الأداء والتحقق لخيارات SKU
- إنشاء أدوات آلية لتوصية SKU وتحسين التكلفة
- التخطيط لعمليات ترحيل وتوسيع SKU لمتطلبات متغيرة
- تطبيق مبادئ إطار عمل Azure Well-Architected في اختيار مستويات الخدمة

## جدول المحتويات

- [Understanding SKUs](../../../../docs/chapter-06-pre-deployment)
- [Environment-Based Selection](../../../../docs/chapter-06-pre-deployment)
- [Service-Specific Guidelines](../../../../docs/chapter-06-pre-deployment)
- [Cost Optimization Strategies](../../../../docs/chapter-06-pre-deployment)
- [Performance Considerations](../../../../docs/chapter-06-pre-deployment)
- [Quick Reference Tables](../../../../docs/chapter-06-pre-deployment)
- [Validation Tools](../../../../docs/chapter-06-pre-deployment)

---

## Understanding SKUs

### What are SKUs?

تمثل SKUs (وحدات حفظ المخزون Stock Keeping Units) مستويات خدمة ومستويات أداء مختلفة لموارد Azure. كل SKU يقدم اختلافات في:

- **خصائص الأداء** (وحدة المعالجة المركزية، الذاكرة، معدل النقل)
- **توفر الميزات** (خيارات التوسيع، مستويات SLA)
- **نماذج التسعير** (قائم على الاستهلاك، السعة المحجوزة)
- **التوفر الإقليمي** (ليست كل SKUs متاحة في كل المناطق)

### العوامل الرئيسية في اختيار SKU

1. **متطلبات الحمل**
   - أنماط الحركة/التحميل المتوقعة
   - متطلبات الأداء (CPU، الذاكرة، I/O)
   - احتياجات التخزين وأنماط الوصول

2. **نوع البيئة**
   - تطوير/اختبار مقابل الإنتاج
   - متطلبات التوافر
   - احتياجات الأمان والامتثال

3. **قيود الميزانية**
   - التكاليف الأولية مقابل التكاليف التشغيلية
   - خصومات السعة المحجوزة
   - تأثيرات تكلفة التوسع التلقائي

4. **توقعات النمو**
   - متطلبات القابلية للتوسع
   - احتياجات الميزات المستقبلية
   - تعقيد الترحيل

---

## Environment-Based Selection

### Development Environment

**الأولويات**: تحسين التكلفة، الوظائف الأساسية، التزويد/إلغاء التزويد السهل

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

#### الخصائص
- **App Service**: F1 (Free) or B1 (Basic) for simple testing
- **Databases**: مستوى Basic مع موارد بسيطة
- **Storage**: Standard مع تكرار محلي فقط
- **Compute**: موارد مشتركة مقبولة
- **Networking**: تكوينات أساسية

### Staging/Testing Environment

**الأولويات**: تكوين شبيه بالإنتاج، توازن التكلفة، قدرة اختبار الأداء

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

#### الخصائص
- **الأداء**: 70-80% من سعة الإنتاج
- **الميزات**: تفعيل معظم ميزات الإنتاج
- **التكرار**: بعض التكرار الجغرافي
- **التوسع**: توسيع تلقائي محدود للاختبار
- **المراقبة**: مجموعة مراقبة كاملة

### Production Environment

**الأولويات**: الأداء، التوافر، الأمان، الامتثال، القابلية للتوسع

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

#### الخصائص
- **التوافر العالي**: متطلبات SLA بنسبة 99.9%+
- **الأداء**: موارد مخصصة، معدل نقل عالي
- **الأمان**: ميزات أمان متميزة
- **التوسع**: إمكانيات التوسع التلقائي الكاملة
- **المراقبة**: مراقبة شاملة

---

## Service-Specific Guidelines

### Azure App Service

#### مصفوفة قرار SKU

| Use Case | Recommended SKU | Rationale |
|----------|----------------|-----------|
| Development/Testing | F1 (Free) or B1 (Basic) | Cost-effective, sufficient for testing |
| Small production apps | S1 (Standard) | Custom domains, SSL, auto-scaling |
| Medium production apps | P1V3 (Premium V3) | Better performance, more features |
| High-traffic apps | P2V3 or P3V3 | Dedicated resources, high performance |
| Mission-critical apps | I1V2 (Isolated V2) | Network isolation, dedicated hardware |

#### أمثلة التكوين

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

#### إطار اختيار SKU

1. **معتمد على DTU (وحدات معاملات قاعدة البيانات)**
   - **Basic**: 5 DTU - تطوير/اختبار
   - **Standard**: S0-S12 (10-3000 DTU) - أغراض عامة
   - **Premium**: P1-P15 (125-4000 DTU) - أداء حاسم

2. **معتمد على vCore** (موصى به للإنتاج)
   - **General Purpose**: توازن بين الحوسبة والتخزين
   - **Business Critical**: زمن استجابة منخفض، IOPS عالية
   - **Hyperscale**: تخزين قابل للتوسع بشكل كبير (حتى 100TB)

#### أمثلة التكوين

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

#### أنواع البيئات

1. **قائم على الاستهلاك**
   - تسعير بالدفع حسب الاستخدام
   - مناسب للتطوير والأحمال المتغيرة
   - بنية تحتية مشتركة

2. **مخصص (ملفات تعريف الأحمال)**
   - موارد حوسبة مخصصة
   - أداء متوقع
   - أفضل لأحمال الإنتاج

#### أمثلة التكوين

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

#### نماذج معدل النقل (Throughput)

1. **معدل نقل مخصص يدويًا**
   - أداء متوقع
   - خصومات السعة المحجوزة
   - الأفضل للأحمال المستقرة

2. **معدل نقل تلقائي (Autoscale)**
   - توسيع تلقائي بناءً على الاستخدام
   - ادفع مقابل ما تستخدمه (مع حد أدنى)
   - جيد للأحمال المتغيرة

3. **Serverless**
   - الدفع حسب الطلب
   - لا يوجد معدل نقل مخصص
   - مثالي للتطوير والأحمال المتقطعة

#### أمثلة SKU

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

#### أنواع حسابات التخزين

1. **Standard_LRS** - التطوير، البيانات غير الحرجة
2. **Standard_GRS** - الإنتاج، الحاجة لتكرار جغرافي
3. **Premium_LRS** - تطبيقات عالية الأداء
4. **Premium_ZRS** - توافر عالي مع تكرار المناطق

#### مستويات الأداء

- **Standard**: عام، فعال من حيث التكلفة
- **Premium**: أداء عالٍ، حالات زمن استجابة منخفض

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

## استراتيجيات تحسين التكلفة

### 1. السعة المحجوزة

احجز الموارد لمدة 1-3 سنوات للحصول على خصومات كبيرة:

```bash
# تحقق من خيارات الحجز
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. التهيئة المناسبة للحجم (Right-Sizing)

ابدأ بـ SKUs أصغر وقم بالترقية بناءً على الاستخدام الفعلي:

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

### 3. تكوين التوسع التلقائي

نفّذ توسعًا ذكيًا لتحسين التكلفة:

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

### 4. التوسع المجدول

خفض الحجم خلال ساعات الخمول:

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

## اعتبارات الأداء

### متطلبات الأداء الأساسية

حدد متطلبات الأداء بوضوح قبل اختيار SKU:

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

### اختبار التحميل

اختبر SKUs مختلفة للتحقق من الأداء:

```bash
# خدمة اختبار التحميل من أزور
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### المراقبة والتحسين

قم بإعداد مراقبة شاملة:

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

## جداول مرجعية سريعة

### ملخص سريع لـ App Service SKU

| SKU | Tier | vCPU | RAM | Storage | Price Range | Use Case |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | Development |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Small apps |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Production |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | High performance |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Enterprise |

### ملخص سريع لـ SQL Database SKU

| SKU | Tier | DTU/vCore | Storage | Price Range | Use Case |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Development |
| S2 | Standard | 50 DTU | 250GB | $$ | Small production |
| P2 | Premium | 250 DTU | 1TB | $$$ | High performance |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Balanced |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Mission critical |

### ملخص سريع لـ Container Apps SKU

| Model | Pricing | CPU/Memory | Use Case |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | Development, variable load |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | Production |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | High performance |

---

## أدوات التحقق

### مدقق توافر SKU

```bash
#!/bin/bash
# التحقق من توفر SKU في المنطقة المستهدفة

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

# الاستخدام
check_sku_availability "eastus" "app-service" "P1V3"
```

### سكربت تقدير التكلفة

```powershell
# نص برمجي PowerShell لتقدير التكلفة
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
        
        # استخدم واجهة برمجة تطبيقات التسعير في Azure أو الحاسبة
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# الاستخدام
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### التحقق من الأداء

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

## ملخص أفضل الممارسات

### ما يجب فعله

1. **ابدأ صغيرًا وقم بالتوسع** بناءً على الاستخدام الفعلي
2. **استخدم SKUs مختلفة للبيئات المختلفة**
3. **راقب الأداء والتكاليف باستمرار**
4. **استفد من السعة المحجوزة لأحمال الإنتاج**
5. **نفّذ التوسع التلقائي حيثما كان مناسبًا**
6. **اختبر الأداء بأحمال واقعية**
7. **خطط للنمو لكن تجنّب الإفراط في التخصيص**
8. **استخدم الطبقات المجانية للتطوير عند الإمكان**

### ما لا يجب فعله

1. **لا تستخدم SKUs الإنتاجية للتطوير**
2. **لا تتجاهل توافر SKU الإقليمي**
3. **لا تنس تكاليف نقل البيانات**
4. **لا تقم بالإفراط في التخصيص بدون مبرر**
5. **لا تتجاهل تأثير التبعية**
6. **لا تحدد حدود التوسع التلقائي عالية جدًا**
7. **لا تنس متطلبات الامتثال**
8. **لا تتخذ قرارات بناءً على السعر فقط**

---

**نصيحة احترافية**: استخدم Azure Cost Management وAdvisor للحصول على توصيات مخصصة لتحسين اختيارات SKU بناءً على أنماط الاستخدام الفعلية.

---

**التنقل**
- **الدرس السابق**: [Capacity Planning](capacity-planning.md)
- **الدرس التالي**: [Preflight Checks](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
إخلاء المسؤولية:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة الآلية Co-op Translator (https://github.com/Azure/co-op-translator). بينما نسعى إلى تحقيق الدقة، يُرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقّة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر المعتمد. للمعلومات الحرجة، يُنصح بالاستعانة بترجمة بشرية محترفة. لا نتحمّل أي مسؤولية عن أي سوء فهم أو تفسير خاطئ ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->