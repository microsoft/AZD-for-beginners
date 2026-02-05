# دليل اختيار SKU - اختيار مستويات الخدمة المناسبة في Azure

**تنقل الفصول:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل السادس - التحقق والتخطيط قبل النشر
- **⬅️ السابق**: [تخطيط السعة](capacity-planning.md)
- **➡️ التالي**: [التحقق المسبق](preflight-checks.md)
- **🚀 الفصل التالي**: [الفصل السابع: استكشاف الأخطاء وإصلاحها](../troubleshooting/common-issues.md)

## المقدمة

يساعدك هذا الدليل الشامل في اختيار أفضل وحدات SKU (وحدات حفظ المخزون) لخدمات Azure لمختلف البيئات وأعباء العمل والمتطلبات. تعلم كيفية تحليل احتياجات الأداء، اعتبارات التكلفة، ومتطلبات التوسع لاختيار مستويات الخدمة الأنسب لنشرات Azure Developer CLI.

## أهداف التعلم

عند إكمال هذا الدليل، ستتمكن من:
- فهم مفاهيم SKU في Azure، نماذج التسعير، والفروقات في الميزات
- إتقان استراتيجيات اختيار SKU الخاصة بالبيئة للتطوير، الاختبار، والإنتاج
- تحليل متطلبات أعباء العمل ومطابقتها مع مستويات الخدمة المناسبة
- تنفيذ استراتيجيات تحسين التكلفة من خلال اختيار SKU الذكي
- تطبيق تقنيات اختبار الأداء والتحقق من اختيارات SKU
- إعداد توصيات SKU الآلية وأدوات المراقبة

## نتائج التعلم

عند الانتهاء، ستكون قادرًا على:
- اختيار وحدات SKU المناسبة لخدمات Azure بناءً على متطلبات أعباء العمل والقيود
- تصميم بنى متعددة البيئات فعالة من حيث التكلفة مع اختيار المستويات المناسبة
- تنفيذ اختبارات الأداء والتحقق من اختيارات SKU
- إنشاء أدوات آلية لتوصيات SKU وتحسين التكلفة
- التخطيط لعمليات نقل SKU واستراتيجيات التوسع لتلبية المتطلبات المتغيرة
- تطبيق مبادئ إطار العمل المعماري الجيد لـ Azure في اختيار مستويات الخدمة

## جدول المحتويات

- [فهم وحدات SKU](../../../../docs/pre-deployment)
- [اختيار بناءً على البيئة](../../../../docs/pre-deployment)
- [إرشادات خاصة بالخدمة](../../../../docs/pre-deployment)
- [استراتيجيات تحسين التكلفة](../../../../docs/pre-deployment)
- [اعتبارات الأداء](../../../../docs/pre-deployment)
- [جداول مرجعية سريعة](../../../../docs/pre-deployment)
- [أدوات التحقق](../../../../docs/pre-deployment)

---

## فهم وحدات SKU

### ما هي وحدات SKU؟

تمثل وحدات SKU (وحدات حفظ المخزون) مستويات الخدمة المختلفة ومستويات الأداء لموارد Azure. كل SKU تقدم خصائص مختلفة:

- **خصائص الأداء** (وحدة المعالجة المركزية، الذاكرة، معدل النقل)
- **توفر الميزات** (خيارات التوسع، مستويات اتفاقية مستوى الخدمة)
- **نماذج التسعير** (حسب الاستهلاك، السعة المحجوزة)
- **التوفر الإقليمي** (ليست كل وحدات SKU متوفرة في جميع المناطق)

### العوامل الرئيسية في اختيار SKU

1. **متطلبات أعباء العمل**
   - أنماط حركة المرور/التحميل المتوقعة
   - متطلبات الأداء (وحدة المعالجة المركزية، الذاكرة، الإدخال/الإخراج)
   - احتياجات التخزين وأنماط الوصول

2. **نوع البيئة**
   - التطوير/الاختبار مقابل الإنتاج
   - متطلبات التوفر
   - احتياجات الأمان والامتثال

3. **قيود الميزانية**
   - التكاليف الأولية مقابل التكاليف التشغيلية
   - خصومات السعة المحجوزة
   - آثار التكلفة للتوسع التلقائي

4. **توقعات النمو**
   - متطلبات التوسع
   - احتياجات الميزات المستقبلية
   - تعقيد النقل

---

## اختيار بناءً على البيئة

### بيئة التطوير

**الأولويات**: تحسين التكلفة، الوظائف الأساسية، سهولة التوفير/الإلغاء

#### وحدات SKU الموصى بها
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
- **خدمة التطبيقات**: F1 (مجانية) أو B1 (أساسية) للاختبار البسيط
- **قواعد البيانات**: المستوى الأساسي مع موارد قليلة
- **التخزين**: قياسي مع تكرار محلي فقط
- **الحوسبة**: موارد مشتركة مقبولة
- **الشبكات**: تكوينات أساسية

### بيئة الاختبار/التجريب

**الأولويات**: تكوين مشابه للإنتاج، توازن التكلفة، قدرة اختبار الأداء

#### وحدات SKU الموصى بها
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
- **الميزات**: تمكين معظم ميزات الإنتاج
- **التكرار**: بعض التكرار الجغرافي
- **التوسع**: توسع تلقائي محدود للاختبار
- **المراقبة**: مجموعة مراقبة كاملة

### بيئة الإنتاج

**الأولويات**: الأداء، التوفر، الأمان، الامتثال، التوسع

#### وحدات SKU الموصى بها
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
- **التوفر العالي**: متطلبات اتفاقية مستوى الخدمة بنسبة 99.9%+
- **الأداء**: موارد مخصصة، معدل نقل عالي
- **الأمان**: ميزات أمان متميزة
- **التوسع**: قدرات توسع تلقائي كاملة
- **المراقبة**: مراقبة شاملة

---

## إرشادات خاصة بالخدمة

### خدمة التطبيقات في Azure

#### مصفوفة اتخاذ القرار لـ SKU

| حالة الاستخدام | SKU الموصى بها | السبب |
|----------------|----------------|-------|
| التطوير/الاختبار | F1 (مجانية) أو B1 (أساسية) | فعالة من حيث التكلفة، كافية للاختبار |
| التطبيقات الإنتاجية الصغيرة | S1 (قياسية) | نطاقات مخصصة، SSL، توسع تلقائي |
| التطبيقات الإنتاجية المتوسطة | P1V3 (متميزة V3) | أداء أفضل، ميزات أكثر |
| التطبيقات ذات الحركة العالية | P2V3 أو P3V3 | موارد مخصصة، أداء عالي |
| التطبيقات الحرجة | I1V2 (معزولة V2) | عزل الشبكة، أجهزة مخصصة |

#### أمثلة التكوين

**التطوير**
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

**الإنتاج**
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

### قاعدة بيانات SQL في Azure

#### إطار اختيار SKU

1. **القائم على DTU (وحدات معاملات قاعدة البيانات)**
   - **أساسي**: 5 DTU - للتطوير/الاختبار
   - **قياسي**: S0-S12 (10-3000 DTU) - للأغراض العامة
   - **متميز**: P1-P15 (125-4000 DTU) - للأداء الحرج

2. **القائم على vCore** (موصى به للإنتاج)
   - **الغرض العام**: توازن بين الحوسبة والتخزين
   - **الأعمال الحرجة**: زمن استجابة منخفض، معدل إدخال/إخراج عالي
   - **التوسع الفائق**: تخزين قابل للتوسع بشكل كبير (حتى 100TB)

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

### تطبيقات الحاويات في Azure

#### أنواع البيئة

1. **القائم على الاستهلاك**
   - تسعير حسب الاستخدام
   - مناسب للتطوير وأعباء العمل المتغيرة
   - بنية تحتية مشتركة

2. **مخصص (ملفات تعريف أعباء العمل)**
   - موارد حوسبة مخصصة
   - أداء متوقع
   - أفضل لأعباء العمل الإنتاجية

#### أمثلة التكوين

**التطوير (القائم على الاستهلاك)**
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

**الإنتاج (مخصص)**
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

### قاعدة بيانات Cosmos DB في Azure

#### نماذج معدل النقل

1. **معدل النقل المخصص يدويًا**
   - أداء متوقع
   - خصومات السعة المحجوزة
   - الأفضل لأعباء العمل المستقرة

2. **معدل النقل المخصص تلقائيًا**
   - توسع تلقائي بناءً على الاستخدام
   - الدفع مقابل الاستخدام (مع الحد الأدنى)
   - جيد لأعباء العمل المتغيرة

3. **الخادم بدون إدارة**
   - الدفع لكل طلب
   - لا يوجد معدل نقل مخصص
   - مثالي للتطوير وأعباء العمل المتقطعة

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

### حساب التخزين في Azure

#### أنواع حسابات التخزين

1. **Standard_LRS** - للتطوير، البيانات غير الحرجة
2. **Standard_GRS** - للإنتاج، الحاجة إلى التكرار الجغرافي
3. **Premium_LRS** - للتطبيقات عالية الأداء
4. **Premium_ZRS** - توفر عالي مع تكرار المناطق

#### مستويات الأداء

- **قياسي**: للأغراض العامة، فعال من حيث التكلفة
- **متميز**: للأداء العالي، سيناريوهات زمن استجابة منخفض

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
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. التحديد الصحيح للحجم

ابدأ بوحدات SKU صغيرة وقم بالتوسع بناءً على الاستخدام الفعلي:

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

قم بتنفيذ التوسع الذكي لتحسين التكاليف:

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

قلل الحجم خلال ساعات الخمول:

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

اختبر وحدات SKU المختلفة للتحقق من الأداء:

```bash
# Azure Load Testing service
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

### مرجع سريع لوحدات SKU لخدمة التطبيقات

| SKU | المستوى | vCPU | RAM | التخزين | نطاق السعر | حالة الاستخدام |
|-----|---------|------|-----|---------|------------|----------------|
| F1 | مجاني | مشترك | 1GB | 1GB | مجاني | التطوير |
| B1 | أساسي | 1 | 1.75GB | 10GB | $ | التطبيقات الصغيرة |
| S1 | قياسي | 1 | 1.75GB | 50GB | $$ | الإنتاج |
| P1V3 | متميز V3 | 2 | 8GB | 250GB | $$$ | الأداء العالي |
| I1V2 | معزول V2 | 2 | 8GB | 1TB | $$$$ | المؤسسات |

### مرجع سريع لوحدات SKU لقاعدة بيانات SQL

| SKU | المستوى | DTU/vCore | التخزين | نطاق السعر | حالة الاستخدام |
|-----|---------|-----------|---------|------------|----------------|
| أساسي | أساسي | 5 DTU | 2GB | $ | التطوير |
| S2 | قياسي | 50 DTU | 250GB | $$ | الإنتاج الصغير |
| P2 | متميز | 250 DTU | 1TB | $$$ | الأداء العالي |
| GP_Gen5_4 | الغرض العام | 4 vCore | 4TB | $$$ | متوازن |
| BC_Gen5_8 | الأعمال الحرجة | 8 vCore | 4TB | $$$$ | حرج |

### مرجع سريع لوحدات SKU لتطبيقات الحاويات

| النموذج | التسعير | وحدة المعالجة المركزية/الذاكرة | حالة الاستخدام |
|---------|---------|-------------------------------|----------------|
| استهلاك | الدفع حسب الاستخدام | 0.25-2 vCPU | التطوير، الحمل المتغير |
| مخصص D4 | محجوز | 4 vCPU، 16GB | الإنتاج |
| مخصص D8 | محجوز | 8 vCPU، 32GB | الأداء العالي |

---

## أدوات التحقق

### أداة التحقق من توفر SKU

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

### نص تقدير التكلفة

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
2. **استخدم وحدات SKU مختلفة للبيئات المختلفة**
3. **راقب الأداء والتكاليف باستمرار**
4. **استفد من السعة المحجوزة لأعباء العمل الإنتاجية**
5. **قم بتنفيذ التوسع التلقائي حيثما كان مناسبًا**
6. **اختبر الأداء باستخدام أعباء عمل واقعية**
7. **خطط للنمو ولكن تجنب الإفراط في التوفير**
8. **استخدم المستويات المجانية للتطوير عندما يكون ذلك ممكنًا**

### ما يجب تجنبه

1. **لا تستخدم وحدات SKU الإنتاجية للتطوير**
2. **لا تتجاهل توفر SKU الإقليمي**
3. **لا تنس تكاليف نقل البيانات**
4. **لا تفرط في التوفير دون مبرر**
5. **لا تتجاهل تأثير التبعيات**
6. **لا تحدد حدود التوسع التلقائي بشكل مرتفع جدًا**
7. **لا تنس متطلبات الامتثال**
8. **لا تتخذ قرارات بناءً على السعر فقط**

---

**نصيحة احترافية**: استخدم إدارة تكاليف Azure ومستشار Azure للحصول على توصيات مخصصة لتحسين اختيارات SKU بناءً على أنماط الاستخدام الفعلية.

---

**التنقل**
- **الدرس السابق**: [تخطيط السعة](capacity-planning.md)
- **الدرس التالي**: [التحقق المسبق](preflight-checks.md)

---

**إخلاء المسؤولية**:  
تم ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي. للحصول على معلومات حاسمة، يُوصى بالترجمة البشرية الاحترافية. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة تنشأ عن استخدام هذه الترجمة.