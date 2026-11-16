# دليل اختيار SKU - اختيار مستويات خدمة Azure المناسبة

**تنقل الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 6 - التحقق والتخطيط قبل النشر
- **⬅️ السابق**: [تخطيط السعة](capacity-planning.md)
- **➡️ التالي**: [فحوصات ما قبل الإقلاع](preflight-checks.md)
- **🚀 الفصل التالي**: [الفصل 7: استكشاف الأخطاء وإصلاحها](../chapter-07-troubleshooting/common-issues.md)

## المقدمة

هذا الدليل الشامل يساعدك على اختيار وحدات حفظ المخزون (SKU) المثلى لخدمات Azure لمختلف البيئات والأحمال والمتطلبات. تعلّم كيفية تحليل متطلبات الأداء، واعتبارات التكلفة، ومتطلبات التوسع لاختيار المستويات الخدمية الأنسب لنشر Azure Developer CLI.

## أهداف التعلم

عند إكمال هذا الدليل، ستتمكن من:
- فهم مفاهيم SKU في Azure، ونماذج التسعير، والفروقات في الميزات
- إتقان استراتيجيات اختيار SKU حسب البيئة مثل التطوير والاختبار والإنتاج
- تحليل متطلبات الأحمال ومطابقتها مع المستويات الخدمية المناسبة
- تنفيذ استراتيجيات تحسين التكلفة من خلال اختيار SKU الذكي
- تطبيق تقنيات اختبار الأداء والتحقق لاختيارات SKU
- تكوين توصيات SKU مؤتمتة والمراقبة

## نواتج التعلم

بعد الانتهاء، ستكون قادرًا على:
- اختيار وحدات SKU لخدمات Azure المناسبة بناءً على متطلبات وقيود الأحمال
- تصميم بنى تحتية متعددة البيئات فعالة من حيث التكلفة مع اختيار المستوى المناسب
- تنفيذ قياس الأداء والتحقق لاختيارات SKU
- إنشاء أدوات مؤتمتة لتوصية SKU وتحسين التكلفة
- تخطيط هجرات واستراتيجيات التوسع لوحدات SKU لتلبية المتطلبات المتغيرة
- تطبيق مبادئ إطار العمل Azure Well-Architected لاختيار المستوى الخدمي

## جدول المحتويات

- [فهم وحدات SKU](#understanding-skus)
- [الاختيار بناءً على البيئة](#environment-based-selection)
- [إرشادات خاصة بالخدمة](#service-specific-guidelines)
- [استراتيجيات تحسين التكلفة](#cost-optimization-strategies)
- [اعتبارات الأداء](#performance-considerations)
- [جداول مرجعية سريعة](#quick-reference-tables)
- [أدوات التحقق](#validation-tools)

---

## فهم وحدات SKU

> **نطاق المثال:** خرائط YAML لوحدات SKU وتكوينات الأداء أدناه هي ملاحظات تصميم، وليست مخطط `azure.yaml` أو تكوين أداة تحميل. كتل Bicep هي بدائل/مقاطع: يجب إعلان معلماتها ومصادرها الأصلية، واستخدام أسماء رمزية فريدة عند دمجها، وربط الوحدات لمشروع عملي. يجب التحقق من الأسعار والحدود وتوفر المنطقة/SKU الخاصة باشتراكك قبل النشر.

### ما هي وحدات SKU؟

وحدات SKU (وحدات حفظ المخزون) تمثل مستويات وخيارات أداء مختلفة لموارد Azure. كل وحدة SKU تقدم:

- **خصائص الأداء** (المعالج، الذاكرة، الإنتاجية)
- **توفر الميزات** (خيارات التوسع، مستويات اتفاقية مستوى الخدمة)
- **نماذج التسعير** (حسب الاستهلاك، السعة المحجوزة)
- **التوفر الإقليمي** (ليست كل الوحدات متوفرة في كل المناطق)

### العوامل الرئيسية في اختيار وحدة SKU

1. **متطلبات الأحمال**
   - أنماط حركة البيانات/التحميل المتوقعة
   - متطلبات الأداء (المعالج، الذاكرة، الإدخال/الإخراج)
   - حاجات التخزين وأنماط الوصول

2. **نوع البيئة**
   - تطوير/اختبار مقابل الإنتاج
   - متطلبات التوفر
   - حاجات الأمان والامتثال

3. **قيود الميزانية**
   - التكاليف الأولية مقابل التشغيلية
   - خصومات السعة المحجوزة
   - تأثير تكلفة التوسع التلقائي

4. **توقعات النمو**
   - متطلبات القابلية للتوسع
   - حاجات الميزات المستقبلية
   - تعقيد الهجرة

---

## الاختيار بناءً على البيئة

### بيئة التطوير

**الأولويات**: تحسين التكلفة، الوظائف الأساسية، التوفير/إلغاء التوفير السهل

#### وحدات SKU الموصى بها
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

#### الخصائص
- **خدمة التطبيقات**: F1 (مجاني) أو B1 (أساسي) للاختبار البسيط
- **قواعد البيانات**: المستوى الأساسي مع موارد محدودة
- **التخزين**: قياسي مع تكرار محلي فقط
- **الحوسبة**: موارد مشتركة مقبولة
- **الشبكات**: تكوينات أساسية

### بيئة الاستعداد/الاختبار

**الأولويات**: تكوين مشابه للإنتاج، توازن التكلفة، إمكانية اختبار الأداء

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
- **الأداء**: 70-80% من طاقة الإنتاج
- **الميزات**: تمكين أغلب ميزات الإنتاج
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
  storage: "Standard_GRS"    # Geo-redundant; Premium_GRS is not a storage SKU
  cosmos_db: "Provisioned"   # Dedicated throughput
  container_apps: "Dedicated" # Dedicated environment
  key_vault: "Premium"       # Premium with HSM
```

#### الخصائص
- **التوفر العالي**: متطلبات SLA 99.9%+
- **الأداء**: موارد مخصصة، إنتاجية عالية
- **الأمان**: ميزات أمان متقدمة
- **التوسع**: قدرات التوسع التلقائي الكاملة
- **المراقبة**: مراقبة شاملة للرصد

---

## إرشادات خاصة بالخدمة

### خدمة تطبيقات Azure

#### مصفوفة قرار اختيار SKU

| حالة الاستخدام | وحدة SKU الموصى بها | المبرر |
|----------|----------------|-----------|
| تطوير/اختبار | F1 (مجاني) أو B1 (أساسي) | فعال من حيث التكلفة، كافٍ للاختبار |
| تطبيقات إنتاج صغيرة | S1 (قياسي) | نطاقات مخصصة، SSL، توسع تلقائي |
| تطبيقات إنتاج متوسطة | P1V3 (متميز V3) | أداء أفضل، مزيد من الميزات |
| تطبيقات عالية الحركة | P2V3 أو P3V3 | موارد مخصصة، أداء عالٍ |
| تطبيقات حرجة للمهمة | I1V2 (معزول V2) | عزل الشبكة، أجهزة مخصصة |

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

### قاعدة بيانات Azure SQL

#### إطار اختيار SKU

1. **مستند إلى وحدات معاملة قاعدة البيانات (DTU)**
   - **أساسي**: 5 DTU - تطوير/اختبار
   - **قياسي**: S0-S12 (10-3000 DTU) - عام
   - **متميز**: P1-P15 (125-4000 DTU) - مهم للأداء

2. **مستند إلى vCore** (موصى به للإنتاج)
   - **عام**: توازن بين الحوسبة والتخزين
   - **حرج للأعمال**: زمن استجابة منخفض، عمليات إدخال/إخراج عالية
   - **هايبرسكيل**: تخزين عالي القابلية للتوسع؛ تحقق من حدود الحجم والدعم الإقليمي الحالي

#### أمثلة التكوينات

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

### تطبيقات الحاويات Azure

#### أنواع البيئة

1. **حسب الاستهلاك**
   - تسعير حسب الاستخدام
   - مناسب للتطوير والأحمال المتغيرة
   - بنية تحتية مشتركة

2. **مخصص (ملفات تعريف الأحمال)**
   - موارد حوسبة مخصصة
   - أداء متوقع
   - أفضل لأحمال الإنتاج

#### أمثلة التكوين

**التطوير (استهلاك)**
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

**الإنتاج (مخصص)**
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

يتطلب التكرار عبر المناطق أيضًا بنية تحتية مدعومة في المناطق وتكوين VNet/subnet مناسب، ولم يتم تضمينه هنا. المثال هذا يخصص ثلاث عقد مخصصة؛ قم بتكوين ما لا يقل عن نسختين من التطبيق لتوزيع عبر المناطق وحجم النسخ والعقد لتغطية فشل المنطقة. راجع [إرشادات موثوقية تطبيقات الحاويات](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). لنقل تطبيق إلى هذا الملف الشخصي، اضبط `workloadProfileName: 'production-profile'`؛ إنشاء الملف الشخصي فقط لا ينقل التطبيقات إليه.

### قاعدة بيانات Azure Cosmos

#### نماذج الإنتاجية

1. **الإنتاجية المحجوزة يدويًا**
   - أداء متوقع
   - خصومات السعة المحجوزة
   - مثالي للأحمال المستقرة

2. **الإنتاجية المحجوزة بالتوسع التلقائي**
   - توسع تلقائي بناءً على الاستخدام
   - تدفع مقابل ما تستخدم (مع حد أدنى)
   - جيد للأحمال المتغيرة

3. **خالي من الخوادم (Serverless)**
   - الدفع لكل طلب
   - بدون إنتاجية محجوزة
   - مثالي للتطوير والأحمال المتقطعة

#### أمثلة وحدات SKU

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

### حساب تخزين Azure

#### أنواع حسابات التخزين

1. **Standard_LRS** - التطوير، البيانات غير الحرجة
2. **Standard_GRS** - الإنتاج، الحاجة إلى التكرار الجغرافي
3. **Premium_LRS** - التطبيقات العالية الأداء
4. **Premium_ZRS** - توفر عالي مع تكرار عبر المناطق

#### مستويات الأداء

- **قياسي**: عام، فعال من حيث التكلفة
- **متميز**: عالي الأداء، سيناريوهات منخفضة الكمون

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
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

تختلف العروض ومرات المورد المؤهلة؛ تحقق من الكتالوج وشروط الشراء بدلًا من افتراض دعم كل خدمة/SKU للحجز.

### 2. التناسب الصحيح للحجم

ابدأ بوحدات SKU أصغر ثم توسع بناءً على الاستخدام الفعلي:

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

نفذ التوسع الذكي لتحسين التكاليف:

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

### 4. التوسع المجدول

قلل السعة خلال أوقات عدم الذروة:

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

عرّف متطلبات أداء واضحة قبل اختيار وحدة SKU:

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

### اختبار الأحمال

اختبر وحدات SKU المختلفة للتحقق من الأداء:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### الرصد والتحسين

قم بإعداد رصد شامل:

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

## جداول مرجعية سريعة

### مرجع سريع لوحدات SKU لخدمة التطبيقات

| SKU | المستوى | vCPU | RAM | التخزين | نطاق السعر | حالة الاستخدام |
|-----|---------|------|-----|----------|------------|--------------|
| F1 | مجاني | مشترك | 1GB | 1GB | مجاني | التطوير |
| B1 | أساسي | 1 | 1.75GB | 10GB | $ | التطبيقات الصغيرة |
| S1 | قياسي | 1 | 1.75GB | 50GB | $$ | الإنتاج |
| P1V3 | متميز V3 | 2 | 8GB | 250GB | $$$ | أداء عالي |
| I1V2 | معزول V2 | 2 | 8GB | 1TB | $$$$ | المؤسسات |

### مرجع سريع لوحدات SKU لقاعدة بيانات SQL

| SKU | المستوى | DTU/vCore | التخزين | نطاق السعر | حالة الاستخدام |
|-----|---------|-----------|---------|------------|--------------|
| Basic | أساسي | 5 DTU | 2GB | $ | التطوير |
| S2 | قياسي | 50 DTU | 250GB | $$ | إنتاج صغير |
| P2 | متميز | 250 DTU | 1TB | $$$ | أداء عالي |
| GP_Gen5_4 | هدف عام | 4 vCore | 4TB | $$$ | متوازن |
| BC_Gen5_8 | حرج للأعمال | 8 vCore | 4TB | $$$$ | تطبيقات حرجة |

### مرجع سريع لوحدات SKU لتطبيقات الحاويات

| النموذج | التسعير | المعالج/الذاكرة | حالة الاستخدام |
|--------|---------|----------------|--------------|
| الاستهلاك | الدفع حسب الاستخدام | مجموعات CPU/ذاكرة المدعومة تعتمد على البيئة/الملف الشخصي | التطوير أو الإنتاج، حمل متغير |
| مخصص D4 | فوترة العقدة المخصصة | 4 vCPU، 16GiB لكل عقدة | حمل مستمر/حاجة للعزل |
| مخصص D8 | فوترة العقدة المخصصة | 8 vCPU، 32GiB لكل عقدة | حمل مستمر أعلى |

---

## أدوات التحقق

### مدقق توفر وحدات SKU

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

### نص تقدير التكلفة

**شيفرة كاذبة فقط:** `Get-ResourceCost` أدناه هو دالة محددة للمشروع يجب عليك تنفيذها باستخدام التسعير والعقدة الإقليمية الحالية وافتراضات الاستخدام. ليست PowerShell أو cmdlet لـ Azure.

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

### تحقق من الأداء

الـ YAML التالي هو مسودة متطلبات، **ليس** مخطط إدخال أداة اختبار تحميل Azure، JMeter، Locust، أو k6. قم بترجمته إلى التكوين الحقيقي للأداة المختارة قبل استخدام أمر اختبار التحميل أعلاه.

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

### الأمور المطلوبة

1. **ابدأ صغيرًا وتوسع بناءً على الاستخدام الفعلي**
2. **استخدم وحدات SKU مختلفة لبيئات مختلفة**
3. **راقب الأداء والتكاليف باستمرار**
4. **استفد من السعة المحجوزة للأحمال الإنتاجية**
5. **نفذ التوسع التلقائي حيثما كان مناسبًا**
6. **اختبر الأداء بأحمال واقعية**
7. **خطط للنمو ولكن تجنب الإفراط في التزويد**
8. **استخدم المستويات المجانية للتطوير حيثما أمكن**

### الأمور التي يجب تجنبها

1. **لا تستخدم وحدات SKU الإنتاجية للتطوير**
2. **لا تتجاهل توفر وحدات SKU الإقليمي**
3. **لا تنسى تكاليف نقل البيانات**
4. **لا تفرط في التزويد بدون مبرر**
5. **لا تتجاهل تأثير التبعيات**
6. **لا تضبط حدود التوسع التلقائي مرتفعة جدًا**
7. **لا تنسى متطلبات الامتثال**
8. **لا تتخذ قرارات بناءً على السعر فقط**

---

**نصيحة محترف**: استخدم إدارة تكلفة Azure والمستشار للحصول على توصيات شخصية لتحسين اختيارات وحدة SKU بناءً على أنماط الاستخدام الفعلية.

---

**التنقل**
- **الدرس السابق**: [تخطيط السعة](capacity-planning.md)
- **الدرس التالي**: [فحوصات ما قبل الإقلاع](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->