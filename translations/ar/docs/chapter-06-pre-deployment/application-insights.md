# تكامل Application Insights مع AZD

⏱️ **الوقت المقدر**: 40-50 دقيقة | 💰 **تأثير التكلفة**: ~$5-15/شهر | ⭐ **التعقيد**: متوسط

**📚 مسار التعلم:**
- ← السابق: [فحوصات ما قبل النشر](preflight-checks.md) - التحقق قبل النشر
- 🎯 **أنت هنا**: تكامل Application Insights (المراقبة، القياسات عن بُعد، تصحيح الأخطاء)
- → التالي: [دليل النشر](../chapter-04-infrastructure/deployment-guide.md) - النشر إلى Azure
- 🏠 [الصفحة الرئيسية للدورة](../../README.md)

---

## ما الذي ستتعلمه

من خلال إكمال هذا الدرس، ستتمكن من:
- دمج **Application Insights** في مشاريع AZD تلقائيًا
- تكوين **التتبّع الموزّع** للخدمات المصغّرة
- تنفيذ **تليمتري مخصص** (مقاييس، أحداث، تبعيات)
- إعداد **مقاييس حية** للمراقبة في الوقت الفعلي
- إنشاء **تنبيهات ولوحات معلومات** من نشرات AZD
- تصحيح مشكلات الإنتاج باستخدام **استعلامات القياسات**
- تحسين **التكاليف واستراتيجيات أخذ العينات**
- مراقبة **تطبيقات الذكاء الاصطناعي/نماذج اللغة الكبيرة** (الرموز، الكمون، التكاليف)

## لماذا يعد Application Insights مع AZD مهمًا

### التحدي: مراقبة الإنتاج

**بدون Application Insights:**
```
❌ No visibility into production behavior
❌ Manual log aggregation across services
❌ Reactive debugging (wait for customer complaints)
❌ No performance metrics
❌ Cannot trace requests across services
❌ Unknown failure rates and bottlenecks
```

**مع Application Insights + AZD:**
```
✅ Automatic telemetry collection
✅ Centralized logs from all services
✅ Proactive issue detection
✅ End-to-end request tracing
✅ Performance metrics and insights
✅ Real-time dashboards
✅ AZD provisions everything automatically
```

**التشبيه**: Application Insights مثل وجود مسجل طيران "الصندوق الأسود" + لوحة قيادة قمرة القيادة لتطبيقك. ترى كل ما يحدث في الوقت الحقيقي ويمكنك إعادة تشغيل أي حادث.

---

## نظرة عامة على البنية

### Application Insights في معمارية AZD

```mermaid
graph TB
    User[المستخدم/العميل]
    App1[تطبيق الحاوية 1<br/>بوابة واجهة برمجة التطبيقات]
    App2[تطبيق الحاوية 2<br/>خدمة المنتج]
    App3[تطبيق الحاوية 3<br/>خدمة الطلبات]
    
    AppInsights[رؤى التطبيقات<br/>مركز القياسات]
    LogAnalytics[(تحليلات السجلات<br/>مساحة عمل)]
    
    Portal[بوابة أزور<br/>لوحات المعلومات والتنبيهات]
    Query[استعلامات كاستو<br/>تحليل مخصص]
    
    User --> App1
    App1 --> App2
    App2 --> App3
    
    App1 -.->|القياس التلقائي| AppInsights
    App2 -.->|القياس التلقائي| AppInsights
    App3 -.->|القياس التلقائي| AppInsights
    
    AppInsights --> LogAnalytics
    LogAnalytics --> Portal
    LogAnalytics --> Query
    
    style AppInsights fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
    style LogAnalytics fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
```
### ما الذي يتم مراقبته تلقائيًا

| نوع التليمتري | ما يتم التقاطه | حالة الاستخدام |
|----------------|------------------|----------|
| **الطلبات** | طلبات HTTP، رموز الحالة، المدة | مراقبة أداء واجهة برمجة التطبيقات |
| **التبعيات** | استدعاءات خارجية (قاعدة بيانات، واجهات برمجة التطبيقات، التخزين) | تحديد نقاط الاختناق |
| **الاستثناءات** | أخطاء غير معالجة مع تتبعات المكدس | تصحيح الأعطال |
| **الأحداث المخصصة** | أحداث الأعمال (تسجيل، شراء) | التحليلات ومسارات التحويل |
| **المقاييس** | عدادات الأداء، مقاييس مخصصة | تخطيط السعة |
| **التتبّعات** | رسائل السجل مع مستوى الشدة | التصحيح والتدقيق |
| **التوافر** | اختبارات وقت التشغيل ووقت الاستجابة | مراقبة اتفاقية مستوى الخدمة |

---

## المتطلبات المسبقة

### الأدوات المطلوبة

```bash
# تحقق من Azure Developer CLI
azd version
# ✅ المتوقع: azd الإصدار 1.0.0 أو أعلى

# تحقق من Azure CLI
az --version
# ✅ المتوقع: azure-cli الإصدار 2.50.0 أو أعلى
```

### متطلبات Azure

- اشتراك Azure نشط
- أذونات لإنشاء:
  - Application Insights resources
  - Log Analytics workspaces
  - Container Apps
  - مجموعات الموارد

### المعارف المطلوبة

يجب أن تكون قد أكملت:
- [أساسيات AZD](../chapter-01-foundation/azd-basics.md) - مفاهيم AZD الأساسية
- [التكوين](../chapter-03-configuration/configuration.md) - إعداد البيئة
- [المشروع الأول](../chapter-01-foundation/first-project.md) - النشر الأساسي

---

## الدرس 1: توفير Application Insights تلقائيًا مع AZD

### كيف يقوم AZD بتوفير Application Insights

يقوم AZD تلقائيًا بإنشاء وتكوين Application Insights عند النشر. لنرَ كيف يعمل.

### هيكل المشروع

```
monitored-app/
├── azure.yaml                     # AZD configuration
├── infra/
│   ├── main.bicep                # Main infrastructure
│   ├── core/
│   │   └── monitoring.bicep      # Application Insights + Log Analytics
│   └── app/
│       └── api.bicep             # Container App with monitoring
└── src/
    ├── app.py                    # Application with telemetry
    ├── requirements.txt
    └── Dockerfile
```

---

### الخطوة 1: تكوين AZD (azure.yaml)

**الملف: `azure.yaml`**

```yaml
name: monitored-app
metadata:
  template: monitored-app@1.0.0

services:
  api:
    project: ./src
    language: python
    host: containerapp

# AZD automatically provisions monitoring!
```

**هذا كل شيء!** سيقوم AZD بإنشاء Application Insights بشكل افتراضي. لا حاجة إلى تكوين إضافي للمراقبة الأساسية.

---

### الخطوة 2: بنية المراقبة (Bicep)

**الملف: `infra/core/monitoring.bicep`**

```bicep
param logAnalyticsName string
param applicationInsightsName string
param location string = resourceGroup().location
param tags object = {}

// Log Analytics Workspace (required for Application Insights)
resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: logAnalyticsName
  location: location
  tags: tags
  properties: {
    sku: {
      name: 'PerGB2018'  // Pay-as-you-go pricing
    }
    retentionInDays: 30  // Keep logs for 30 days
    features: {
      enableLogAccessUsingOnlyResourcePermissions: true
    }
  }
}

// Application Insights
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  tags: tags
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalytics.id
    IngestionMode: 'LogAnalytics'
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
  }
}

// Outputs for Container Apps
output logAnalyticsWorkspaceId string = logAnalytics.id
output logAnalyticsWorkspaceName string = logAnalytics.name
output applicationInsightsConnectionString string = applicationInsights.properties.ConnectionString
output applicationInsightsInstrumentationKey string = applicationInsights.properties.InstrumentationKey
output applicationInsightsName string = applicationInsights.name
```

---

### الخطوة 3: ربط تطبيق الحاوية بـ Application Insights

**الملف: `infra/app/api.bicep`**

```bicep
param name string
param location string
param tags object = {}
param containerAppsEnvironmentName string
param applicationInsightsConnectionString string

resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: name
  location: location
  tags: tags
  properties: {
    configuration: {
      ingress: {
        external: true
        targetPort: 8000
      }
      secrets: [
        {
          name: 'appinsights-connection-string'
          value: applicationInsightsConnectionString
        }
      ]
    }
    template: {
      containers: [
        {
          name: 'api'
          image: 'myregistry.azurecr.io/api:latest'
          resources: {
            cpu: json('0.5')
            memory: '1Gi'
          }
          env: [
            {
              name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
              secretRef: 'appinsights-connection-string'
            }
            {
              name: 'APPLICATIONINSIGHTS_ENABLED'
              value: 'true'
            }
          ]
        }
      ]
    }
  }
}

output uri string = 'https://${containerApp.properties.configuration.ingress.fqdn}'
```

---

### الخطوة 4: كود التطبيق مع القياسات

**الملف: `src/app.py`**

```python
from flask import Flask, request, jsonify
from opencensus.ext.azure.log_exporter import AzureLogHandler
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.ext.flask.flask_middleware import FlaskMiddleware
from opencensus.trace.samplers import ProbabilitySampler
import logging
import os

app = Flask(__name__)

# احصل على سلسلة اتصال Application Insights
connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

if connection_string:
    # تكوين التتبع الموزع
    middleware = FlaskMiddleware(
        app,
        exporter=AzureExporter(connection_string=connection_string),
        sampler=ProbabilitySampler(rate=1.0)  # أخذ عينات بنسبة 100% أثناء التطوير
    )
    
    # تكوين التسجيل
    logger = logging.getLogger(__name__)
    logger.addHandler(AzureLogHandler(connection_string=connection_string))
    logger.setLevel(logging.INFO)
    
    print("✅ Application Insights enabled")
else:
    logger = logging.getLogger(__name__)
    logger.setLevel(logging.INFO)
    print("⚠️ Application Insights not configured")

@app.route('/health')
def health():
    logger.info('Health check endpoint called')
    return jsonify({'status': 'healthy', 'monitoring': 'enabled'})

@app.route('/api/products')
def get_products():
    logger.info('Fetching products')
    
    # محاكاة استدعاء قاعدة بيانات (يتم تتبعه تلقائيًا كاعتماد)
    products = [
        {'id': 1, 'name': 'Laptop', 'price': 999.99},
        {'id': 2, 'name': 'Mouse', 'price': 29.99},
        {'id': 3, 'name': 'Keyboard', 'price': 79.99}
    ]
    
    logger.info(f'Returned {len(products)} products')
    return jsonify(products)

@app.route('/api/error-test')
def error_test():
    """Test error tracking"""
    logger.error('Testing error tracking')
    try:
        raise ValueError('This is a test exception')
    except Exception as e:
        logger.exception('Exception occurred in error-test endpoint')
        return jsonify({'error': str(e)}), 500

@app.route('/api/slow')
def slow_endpoint():
    """Test performance tracking"""
    import time
    logger.info('Slow endpoint called')
    time.sleep(3)  # محاكاة عملية بطيئة
    logger.warning('Endpoint took 3 seconds to respond')
    return jsonify({'message': 'Slow operation completed'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
```

**الملف: `src/requirements.txt`**

```txt
Flask==3.0.0
opencensus-ext-azure==1.1.13
opencensus-ext-flask==0.8.1
gunicorn==21.2.0
```

---

### الخطوة 5: النشر والتحقق

```bash
# تهيئة AZD
azd init

# نشر (يهيئ Application Insights تلقائيًا)
azd up

# الحصول على عنوان URL للتطبيق
APP_URL=$(azd env get-values | grep API_URL | cut -d '=' -f2 | tr -d '"')

# توليد بيانات القياس عن بُعد
curl $APP_URL/health
curl $APP_URL/api/products
curl $APP_URL/api/error-test
curl $APP_URL/api/slow
```

**✅ المخرجات المتوقعة:**
```json
{
  "status": "healthy",
  "monitoring": "enabled"
}
```

---

### الخطوة 6: عرض القياسات في بوابة Azure

```bash
# احصل على تفاصيل Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# افتح في بوابة Azure
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"') \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"') \
  --query "appId" -o tsv
```

**انتقل إلى بوابة Azure → Application Insights → بحث المعاملات**

ينبغي أن ترى:
- ✅ طلبات HTTP مع رموز الحالة
- ✅ مدة الطلب (أكثر من 3 ثوانٍ لـ `/api/slow`)
- ✅ تفاصيل الاستثناء من `/api/error-test`
- ✅ رسائل السجل المخصصة

---

## الدرس 2: التليمتري المخصص والأحداث

### تتبع أحداث الأعمال

دعنا نضيف تليمتري مخصص للأحداث الحيوية للأعمال.

**الملف: `src/telemetry.py`**

```python
from opencensus.ext.azure import metrics_exporter
from opencensus.stats import aggregation as aggregation_module
from opencensus.stats import measure as measure_module
from opencensus.stats import stats as stats_module
from opencensus.stats import view as view_module
from opencensus.tags import tag_map as tag_map_module
from opencensus.ext.azure.log_exporter import AzureLogHandler
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.trace import tracer as tracer_module
import logging
import os

class TelemetryClient:
    """Custom telemetry client for Application Insights"""
    
    def __init__(self, connection_string=None):
        self.connection_string = connection_string or os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')
        
        if not self.connection_string:
            print("⚠️ Application Insights connection string not found")
            return
        
        # إعداد المسجل
        self.logger = logging.getLogger(__name__)
        self.logger.addHandler(AzureLogHandler(connection_string=self.connection_string))
        self.logger.setLevel(logging.INFO)
        
        # إعداد مصدّر المقاييس
        self.stats = stats_module.stats
        self.view_manager = self.stats.view_manager
        self.stats_recorder = self.stats.stats_recorder
        
        exporter = metrics_exporter.new_metrics_exporter(
            connection_string=self.connection_string
        )
        self.view_manager.register_exporter(exporter)
        
        # إعداد المتتبع
        self.tracer = tracer_module.Tracer(
            exporter=AzureExporter(connection_string=self.connection_string)
        )
        
        print("✅ Custom telemetry client initialized")
    
    def track_event(self, event_name: str, properties: dict = None):
        """Track custom business event"""
        properties = properties or {}
        self.logger.info(
            f"CustomEvent: {event_name}",
            extra={
                'custom_dimensions': {
                    'event_name': event_name,
                    **properties
                }
            }
        )
    
    def track_metric(self, metric_name: str, value: float, properties: dict = None):
        """Track custom metric"""
        properties = properties or {}
        self.logger.info(
            f"CustomMetric: {metric_name} = {value}",
            extra={
                'custom_dimensions': {
                    'metric_name': metric_name,
                    'value': value,
                    **properties
                }
            }
        )
    
    def track_dependency(self, name: str, dependency_type: str, duration: float, success: bool):
        """Track external dependency call"""
        with self.tracer.span(name=name) as span:
            span.add_attribute('dependency.type', dependency_type)
            span.add_attribute('duration', duration)
            span.add_attribute('success', success)

# عميل القياس عن بعد العالمي
telemetry = TelemetryClient()
```

### تحديث التطبيق بالأحداث المخصصة

**الملف: `src/app.py` (المحسّن)**

```python
from flask import Flask, request, jsonify
from telemetry import telemetry
import time
import random

app = Flask(__name__)

@app.route('/api/purchase', methods=['POST'])
def purchase():
    """Track purchase event with custom telemetry"""
    data = request.json
    product_id = data.get('product_id')
    quantity = data.get('quantity', 1)
    price = data.get('price', 0)
    
    # تتبع حدث تجاري
    telemetry.track_event('Purchase', {
        'product_id': product_id,
        'quantity': quantity,
        'total_amount': price * quantity,
        'user_id': request.headers.get('X-User-Id', 'anonymous')
    })
    
    # تتبع مقياس الإيرادات
    telemetry.track_metric('Revenue', price * quantity, {
        'product_id': product_id,
        'currency': 'USD'
    })
    
    return jsonify({
        'order_id': f'ORD-{random.randint(1000, 9999)}',
        'status': 'confirmed',
        'total': price * quantity
    })

@app.route('/api/search')
def search():
    """Track search queries"""
    query = request.args.get('q', '')
    
    start_time = time.time()
    
    # محاكاة البحث (سيكون استعلام قاعدة بيانات حقيقي)
    results = [{'id': 1, 'name': f'Result for {query}'}]
    
    duration = (time.time() - start_time) * 1000  # تحويل إلى مللي ثانية
    
    # تتبع حدث البحث
    telemetry.track_event('Search', {
        'query': query,
        'results_count': len(results),
        'duration_ms': duration
    })
    
    # تتبع مقياس أداء البحث
    telemetry.track_metric('SearchDuration', duration, {
        'query_length': len(query)
    })
    
    return jsonify({'results': results, 'count': len(results)})

@app.route('/api/external-call')
def external_call():
    """Track external API dependency"""
    import requests
    
    start_time = time.time()
    success = True
    
    try:
        # محاكاة استدعاء واجهة برمجة تطبيقات خارجية
        response = requests.get('https://api.example.com/data', timeout=5)
        result = response.json()
    except Exception as e:
        success = False
        result = {'error': str(e)}
    
    duration = (time.time() - start_time) * 1000
    
    # تتبع التبعية
    telemetry.track_dependency(
        name='ExternalAPI',
        dependency_type='HTTP',
        duration=duration,
        success=success
    )
    
    return jsonify(result)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
```

### اختبار التليمتري المخصص

```bash
# تتبع حدث الشراء
curl -X POST $APP_URL/api/purchase \
  -H "Content-Type: application/json" \
  -H "X-User-Id: user123" \
  -d '{"product_id": 1, "quantity": 2, "price": 29.99}'

# تتبع حدث البحث
curl "$APP_URL/api/search?q=laptop"

# تتبع اعتماد خارجي
curl $APP_URL/api/external-call
```

**عرض في بوابة Azure:**

انتقل إلى Application Insights → Logs، ثم نفّذ:

```kusto
// View purchase events
traces
| where customDimensions.event_name == "Purchase"
| project 
    timestamp,
    product_id = tostring(customDimensions.product_id),
    total_amount = todouble(customDimensions.total_amount),
    user_id = tostring(customDimensions.user_id)
| order by timestamp desc

// View revenue metrics
traces
| where customDimensions.metric_name == "Revenue"
| summarize TotalRevenue = sum(todouble(customDimensions.value)) by bin(timestamp, 1h)
| render timechart

// View search performance
traces
| where customDimensions.event_name == "Search"
| summarize 
    AvgDuration = avg(todouble(customDimensions.duration_ms)),
    SearchCount = count()
  by bin(timestamp, 5m)
| render timechart
```

---

## الدرس 3: التتبّع الموزّع للخدمات المصغّرة

### تفعيل التتبّع عبر الخدمات

بالنسبة للخدمات المصغّرة، يقوم Application Insights تلقائيًا بالربط بين الطلبات عبر الخدمات.

**الملف: `infra/main.bicep`**

```bicep
targetScope = 'subscription'

param environmentName string
param location string = 'eastus'

var tags = { 'azd-env-name': environmentName }

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${environmentName}'
  location: location
  tags: tags
}

// Monitoring (shared by all services)
module monitoring './core/monitoring.bicep' = {
  name: 'monitoring'
  scope: rg
  params: {
    logAnalyticsName: 'log-${environmentName}'
    applicationInsightsName: 'appi-${environmentName}'
    location: location
    tags: tags
  }
}

// API Gateway
module apiGateway './app/api-gateway.bicep' = {
  name: 'api-gateway'
  scope: rg
  params: {
    name: 'ca-gateway-${environmentName}'
    location: location
    tags: union(tags, { 'azd-service-name': 'gateway' })
    applicationInsightsConnectionString: monitoring.outputs.applicationInsightsConnectionString
  }
}

// Product Service
module productService './app/product-service.bicep' = {
  name: 'product-service'
  scope: rg
  params: {
    name: 'ca-products-${environmentName}'
    location: location
    tags: union(tags, { 'azd-service-name': 'products' })
    applicationInsightsConnectionString: monitoring.outputs.applicationInsightsConnectionString
  }
}

// Order Service
module orderService './app/order-service.bicep' = {
  name: 'order-service'
  scope: rg
  params: {
    name: 'ca-orders-${environmentName}'
    location: location
    tags: union(tags, { 'azd-service-name': 'orders' })
    applicationInsightsConnectionString: monitoring.outputs.applicationInsightsConnectionString
  }
}

output APPLICATIONINSIGHTS_CONNECTION_STRING string = monitoring.outputs.applicationInsightsConnectionString
output GATEWAY_URL string = apiGateway.outputs.uri
```

### عرض المعاملة من البداية إلى النهاية

```mermaid
sequenceDiagram
    participant User
    participant Gateway as بوابة API<br/>(معرّف التتبع: abc123)
    participant Product as خدمة المنتج<br/>(معرّف الأصل: abc123)
    participant Order as خدمة الطلب<br/>(معرّف الأصل: abc123)
    participant AppInsights as رؤى التطبيق
    
    User->>Gateway: POST /api/checkout
    Note over Gateway: بدء التتبع: abc123
    Gateway->>AppInsights: تسجيل الطلب (معرّف التتبع: abc123)
    
    Gateway->>Product: GET /products/123
    Note over Product: معرّف الأصل: abc123
    Product->>AppInsights: تسجيل استدعاء التبعية
    Product-->>Gateway: تفاصيل المنتج
    
    Gateway->>Order: POST /orders
    Note over Order: معرّف الأصل: abc123
    Order->>AppInsights: تسجيل استدعاء التبعية
    Order-->>Gateway: تم إنشاء الطلب
    
    Gateway-->>User: اكتملت عملية الشراء
    Gateway->>AppInsights: تسجيل الاستجابة (الزمن المستغرق: 450ms)
    
    Note over AppInsights: الارتباط حسب معرّف التتبع
```
**استعلام التتبّع من البداية للنهاية:**

```kusto
// Find complete request flow
let traceId = "abc123...";  // Get from response header
dependencies
| union requests
| where operation_Id == traceId
| project 
    timestamp,
    type = itemType,
    name,
    duration,
    success,
    cloud_RoleName
| order by timestamp asc
```

---

## الدرس 4: المقاييس الحية والمراقبة في الوقت الفعلي

### تفعيل بث المقاييس الحية

توفّر المقاييس الحية تليمتري في الوقت الحقيقي بزمن تأخير أقل من ثانية واحدة.

**الوصول إلى المقاييس الحية:**

```bash
# الحصول على مورد Application Insights
APPI_NAME=$(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"')

# الحصول على مجموعة الموارد
RG_NAME=$(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"')

echo "Navigate to: Azure Portal → Resource Groups → $RG_NAME → $APPI_NAME → Live Metrics"
```

**ما تراه في الوقت الفعلي:**
- ✅ معدل الطلبات الواردة (طلبات/ثانية)
- ✅ استدعاءات التبعيات الخارجة
- ✅ عدد الاستثناءات
- ✅ استخدام وحدة المعالجة المركزية والذاكرة
- ✅ عدد الخوادم النشطة
- ✅ عينات التليمتري

### توليد حمل للاختبار

```bash
# توليد حمل لمشاهدة المقاييس المباشرة
for i in {1..100}; do
  curl $APP_URL/api/products &
  curl $APP_URL/api/search?q=test$i &
done

# شاهد المقاييس المباشرة في بوابة Azure
# يجب أن ترى ارتفاعًا في معدل الطلبات
```

---

## تمارين عملية

### التمرين 1: إعداد التنبيهات ⭐⭐ (متوسط)

**الهدف**: إنشاء تنبيهات لمعدلات أخطاء مرتفعة واستجابات بطيئة.

**الخطوات:**

1. **إنشاء تنبيه لمعدل الأخطاء:**

```bash
# الحصول على معرّف مورد Application Insights
APPI_ID=$(az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "id" -o tsv)

# إنشاء تنبيه استنادًا إلى المقاييس للطلبات الفاشلة
az monitor metrics alert create \
  --name "High-Error-Rate" \
  --resource-group $RG_NAME \
  --scopes $APPI_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "Alert when error rate exceeds 10 per 5 minutes"
```

2. **إنشاء تنبيه للاستجابات البطيئة:**

```bash
az monitor metrics alert create \
  --name "Slow-Responses" \
  --resource-group $RG_NAME \
  --scopes $APPI_ID \
  --condition "avg requests/duration > 3000" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "Alert when average response time exceeds 3 seconds"
```

3. **إنشاء التنبيه عبر Bicep (مفضّل لـ AZD):**

**الملف: `infra/core/alerts.bicep`**

```bicep
param applicationInsightsId string
param actionGroupId string = ''
param location string = resourceGroup().location

// High error rate alert
resource errorRateAlert 'Microsoft.Insights/metricAlerts@2018-03-01' = {
  name: 'high-error-rate'
  location: 'global'
  properties: {
    description: 'Alert when error rate exceeds threshold'
    severity: 2
    enabled: true
    scopes: [
      applicationInsightsId
    ]
    evaluationFrequency: 'PT1M'
    windowSize: 'PT5M'
    criteria: {
      'odata.type': 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
      allOf: [
        {
          name: 'Error rate'
          metricName: 'requests/failed'
          operator: 'GreaterThan'
          threshold: 10
          timeAggregation: 'Count'
        }
      ]
    }
    actions: actionGroupId != '' ? [
      {
        actionGroupId: actionGroupId
      }
    ] : []
  }
}

// Slow response alert
resource slowResponseAlert 'Microsoft.Insights/metricAlerts@2018-03-01' = {
  name: 'slow-responses'
  location: 'global'
  properties: {
    description: 'Alert when response time is too high'
    severity: 3
    enabled: true
    scopes: [
      applicationInsightsId
    ]
    evaluationFrequency: 'PT1M'
    windowSize: 'PT5M'
    criteria: {
      'odata.type': 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
      allOf: [
        {
          name: 'Response duration'
          metricName: 'requests/duration'
          operator: 'GreaterThan'
          threshold: 3000
          timeAggregation: 'Average'
        }
      ]
    }
  }
}

output errorAlertId string = errorRateAlert.id
output slowResponseAlertId string = slowResponseAlert.id
```

4. **اختبار التنبيهات:**

```bash
# توليد أخطاء
for i in {1..20}; do
  curl $APP_URL/api/error-test
done

# توليد استجابات بطيئة
for i in {1..10}; do
  curl $APP_URL/api/slow
done

# تحقق من حالة التنبيه (انتظر ٥-١٠ دقائق)
az monitor metrics alert list \
  --resource-group $RG_NAME \
  --query "[].{Name:name, Enabled:enabled, State:properties.enabled}" \
  --output table
```

**✅ معايير النجاح:**
- ✅ تم إنشاء التنبيهات بنجاح
- ✅ تُطلق التنبيهات عند تجاوز العتبات
- ✅ يمكن عرض سجل التنبيهات في بوابة Azure
- ✅ مدمجة مع نشر AZD

**الوقت**: 20-25 دقيقة

---

### التمرين 2: إنشاء لوحة معلومات مخصصة ⭐⭐ (متوسط)

**الهدف**: بناء لوحة تعرض المقاييس الرئيسية للتطبيق.

**الخطوات:**

1. **إنشاء لوحة عبر بوابة Azure:**

انتقل إلى: بوابة Azure → لوحات المعلومات → لوحة جديدة

2. **إضافة عناصر لعرض المقاييس الرئيسية:**

- عدد الطلبات (آخر 24 ساعة)
- متوسط زمن الاستجابة
- معدل الأخطاء
- أبطأ 5 عمليات
- التوزيع الجغرافي للمستخدمين

3. **إنشاء لوحة عبر Bicep:**

**الملف: `infra/core/dashboard.bicep`**

```bicep
param dashboardName string
param applicationInsightsId string
param location string = resourceGroup().location

resource dashboard 'Microsoft.Portal/dashboards@2020-09-01-preview' = {
  name: dashboardName
  location: location
  properties: {
    lenses: [
      {
        order: 0
        parts: [
          // Request count
          {
            position: { x: 0, y: 0, rowSpan: 4, colSpan: 6 }
            metadata: {
              type: 'Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart'
              inputs: [
                {
                  name: 'resourceId'
                  value: applicationInsightsId
                }
                {
                  name: 'query'
                  value: '''
                    requests
                    | summarize RequestCount = count() by bin(timestamp, 1h)
                    | render timechart
                  '''
                }
              ]
            }
          }
          // Error rate
          {
            position: { x: 6, y: 0, rowSpan: 4, colSpan: 6 }
            metadata: {
              type: 'Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart'
              inputs: [
                {
                  name: 'resourceId'
                  value: applicationInsightsId
                }
                {
                  name: 'query'
                  value: '''
                    requests
                    | summarize 
                        Total = count(),
                        Failed = countif(success == false)
                    | extend ErrorRate = (Failed * 100.0) / Total
                    | project ErrorRate
                  '''
                }
              ]
            }
          }
        ]
      }
    ]
  }
}

output dashboardId string = dashboard.id
```

4. **نشر اللوحة:**

```bash
# أضف إلى main.bicep
module dashboard './core/dashboard.bicep' = {
  name: 'dashboard'
  scope: rg
  params: {
    dashboardName: 'dashboard-${environmentName}'
    applicationInsightsId: monitoring.outputs.applicationInsightsId
    location: location
  }
}

# نشر
azd up
```

**✅ معايير النجاح:**
- ✅ تعرض اللوحة المقاييس الرئيسية
- ✅ يمكن تثبيتها في صفحة بوابة Azure الرئيسية
- ✅ تتحدّث في الوقت الحقيقي
- ✅ قابلة للنشر عبر AZD

**الوقت**: 25-30 دقيقة

---

### التمرين 3: مراقبة تطبيقات الذكاء الاصطناعي/نماذج اللغة الكبيرة ⭐⭐⭐ (متقدم)

**الهدف**: تتبع استخدام نماذج Microsoft Foundry (الرموز tokens، التكاليف، الكمون).

**الخطوات:**

1. **إنشاء غلاف لمراقبة الذكاء الاصطناعي:**

**الملف: `src/ai_telemetry.py`**

```python
from telemetry import telemetry
from openai import AzureOpenAI
import time

class MonitoredAzureOpenAI:
    """Microsoft Foundry Models client with automatic telemetry"""
    
    def __init__(self, api_key, endpoint, api_version="2024-02-01"):
        self.client = AzureOpenAI(
            api_key=api_key,
            api_version=api_version,
            azure_endpoint=endpoint
        )
    
    def chat_completion(self, model: str, messages: list, **kwargs):
        """Track chat completion with telemetry"""
        start_time = time.time()
        
        try:
            # استدعاء نماذج Microsoft Foundry
            response = self.client.chat.completions.create(
                model=model,
                messages=messages,
                **kwargs
            )
            
            duration = (time.time() - start_time) * 1000  # مايكروسوفت
            
            # استخراج الاستخدام
            usage = response.usage
            prompt_tokens = usage.prompt_tokens
            completion_tokens = usage.completion_tokens
            total_tokens = usage.total_tokens
            
            # حساب التكلفة (تسعير gpt-4.1)
            prompt_cost = (prompt_tokens / 1000) * 0.03  # $0.03 لكل 1K من الرموز
            completion_cost = (completion_tokens / 1000) * 0.06  # $0.06 لكل 1K من الرموز
            total_cost = prompt_cost + completion_cost
            
            # تتبع حدث مخصص
            telemetry.track_event('OpenAI_Request', {
                'model': model,
                'prompt_tokens': prompt_tokens,
                'completion_tokens': completion_tokens,
                'total_tokens': total_tokens,
                'duration_ms': duration,
                'cost_usd': total_cost,
                'success': True
            })
            
            # تتبع المقاييس
            telemetry.track_metric('OpenAI_Tokens', total_tokens, {
                'model': model,
                'type': 'total'
            })
            
            telemetry.track_metric('OpenAI_Cost', total_cost, {
                'model': model,
                'currency': 'USD'
            })
            
            telemetry.track_metric('OpenAI_Duration', duration, {
                'model': model
            })
            
            return response
            
        except Exception as e:
            duration = (time.time() - start_time) * 1000
            
            telemetry.track_event('OpenAI_Request', {
                'model': model,
                'duration_ms': duration,
                'success': False,
                'error': str(e)
            })
            
            raise
```

2. **استخدام عميل مراقَب:**

```python
from flask import Flask, request, jsonify
from ai_telemetry import MonitoredAzureOpenAI
import os

app = Flask(__name__)

# تهيئة عميل OpenAI المراقَب
openai_client = MonitoredAzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

@app.route('/api/chat', methods=['POST'])
def chat():
    data = request.json
    user_message = data.get('message')
    
    # استدعاء مع المراقبة التلقائية
    response = openai_client.chat_completion(
        model='gpt-4.1',
        messages=[
            {'role': 'user', 'content': user_message}
        ]
    )
    
    return jsonify({
        'response': response.choices[0].message.content,
        'tokens': response.usage.total_tokens
    })
```

3. **استعلام مقاييس الذكاء الاصطناعي:**

```kusto
// Total AI spend over time
traces
| where customDimensions.event_name == "OpenAI_Request"
| where customDimensions.success == "True"
| summarize TotalCost = sum(todouble(customDimensions.cost_usd)) by bin(timestamp, 1h)
| render timechart

// Token usage by model
traces
| where customDimensions.event_name == "OpenAI_Request"
| summarize 
    TotalTokens = sum(toint(customDimensions.total_tokens)),
    RequestCount = count()
  by Model = tostring(customDimensions.model)

// Average latency
traces
| where customDimensions.event_name == "OpenAI_Request"
| summarize AvgDuration = avg(todouble(customDimensions.duration_ms))
| project AvgDurationSeconds = AvgDuration / 1000

// Cost per request
traces
| where customDimensions.event_name == "OpenAI_Request"
| extend Cost = todouble(customDimensions.cost_usd)
| summarize 
    TotalCost = sum(Cost),
    RequestCount = count(),
    AvgCostPerRequest = avg(Cost)
```

**✅ معايير النجاح:**
- ✅ يتم تتبع كل استدعاء لـ OpenAI تلقائيًا
- ✅ يمكن رؤية استخدام الرموز والتكاليف
- ✅ يتم مراقبة الكمون
- ✅ يمكن تعيين تنبيهات الميزانية

**الوقت**: 35-45 دقيقة

---

## تحسين التكلفة

### استراتيجيات أخذ العينات

تحكم في التكاليف عبر أخذ عينات من التليمتري:

```python
from opencensus.trace.samplers import ProbabilitySampler

# بيئة التطوير: أخذ عينات بنسبة 100٪
sampler = ProbabilitySampler(rate=1.0)

# بيئة الإنتاج: أخذ عينات بنسبة 10٪ (تقليل التكاليف بنسبة 90٪)
sampler = ProbabilitySampler(rate=0.1)

# أخذ العينات التكيفية (يتكيف تلقائيًا)
from opencensus.trace.samplers import AdaptiveSampler
sampler = AdaptiveSampler()
```

**في Bicep:**

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  properties: {
    SamplingPercentage: 10  // 10% sampling
  }
}
```

### الاحتفاظ بالبيانات

```bicep
resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: logAnalyticsName
  properties: {
    retentionInDays: 30  // Minimum (cheapest)
    // Options: 30, 31, 60, 90, 120, 180, 270, 365, 550, 730
  }
}
```

### تقديرات التكلفة الشهرية

| حجم البيانات | مدة الاحتفاظ | التكلفة الشهرية |
|-------------|-----------|--------------|
| 1 GB/شهر | 30 يومًا | ~$2-5 |
| 5 GB/شهر | 30 يومًا | ~$10-15 |
| 10 GB/شهر | 90 يومًا | ~$25-40 |
| 50 GB/شهر | 90 يومًا | ~$100-150 |

**الفئة المجانية**: 5 GB/شهر مشمولة

---

## نقطة تحقق المعرفة

### 1. التكامل الأساسي ✓

اختبر فهمك:

- [ ] **Q1**: كيف يقوم AZD بتوفير Application Insights؟
  - **الإجابة**: تلقائيًا عبر قوالب Bicep في `infra/core/monitoring.bicep`

- [ ] **Q2**: ما متغير البيئة الذي يتيح Application Insights؟
  - **الإجابة**: `APPLICATIONINSIGHTS_CONNECTION_STRING`

- [ ] **Q3**: ما هي أنواع التليمتري الثلاثة الرئيسية؟
  - **الإجابة**: الطلبات (استدعاءات HTTP)، التبعيات (استدعاءات خارجية)، الاستثناءات (أخطاء)

**التحقق العملي:**
```bash
# تحقق مما إذا كان Application Insights مُكوَّنًا
azd env get-values | grep APPLICATIONINSIGHTS

# تحقق من تدفق بيانات القياس عن بُعد
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "requests/count"
```

---

### 2. التليمتري المخصص ✓

اختبر فهمك:

- [ ] **Q1**: كيف تتعقب أحداث الأعمال المخصصة؟
  - **الإجابة**: استخدم logger مع `custom_dimensions` أو `TelemetryClient.track_event()`

- [ ] **Q2**: ما الفرق بين الأحداث والمقاييس؟
  - **الإجابة**: الأحداث هي حوادث منفصلة، والمقاييس هي قياسات رقمية

- [ ] **Q3**: كيف تربط التليمتري عبر الخدمات؟
  - **الإجابة**: يستخدم Application Insights تلقائيًا `operation_Id` للربط

**التحقق العملي:**
```kusto
// Verify custom events
traces
| where customDimensions.event_name != ""
| summarize count() by tostring(customDimensions.event_name)
```

---

### 3. مراقبة الإنتاج ✓

اختبر فهمك:

- [ ] **Q1**: ما هي العيننة ولماذا تستخدمها؟
  - **الإجابة**: أخذ العينات يقلل من حجم البيانات (والتكلفة) عن طريق التقاط نسبة مئوية فقط من التليمتري

- [ ] **Q2**: كيف تقوم بإعداد التنبيهات؟
  - **الإجابة**: استخدم تنبيهات المقاييس في Bicep أو بوابة Azure بناءً على مقاييس Application Insights

- [ ] **Q3**: ما الفرق بين Log Analytics وApplication Insights؟
  - **الإجابة**: يقوم Application Insights بتخزين البيانات في مساحة عمل Log Analytics؛ يوفر Application Insights عروضًا مخصّصة للتطبيق

**التحقق العملي:**
```bash
# تحقق من إعدادات أخذ العينات
az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "properties.SamplingPercentage"
```

---

## أفضل الممارسات

### ✅ نفّذ:

1. **استخدم معرفات الارتباط**
   ```python
   logger.info('Processing order', extra={
       'custom_dimensions': {
           'order_id': order_id,
           'user_id': user_id
       }
   })
   ```

2. **قم بإعداد تنبيهات للمقاييس الحرجة**
   ```bicep
   // Error rate, slow responses, availability
   ```

3. **استخدم السجلات المهيكلة**
   ```python
   # ✅ جيد: منظم
   logger.info('User signup', extra={'custom_dimensions': {'user_id': 123}})
   
   # ❌ سيئ: غير منظم
   logger.info(f'User 123 signed up')
   ```

4. **راقب التبعيات**
   ```python
   # تتبع تلقائيًا استدعاءات قاعدة البيانات، طلبات HTTP، إلخ.
   ```

5. **استخدم المقاييس الحية أثناء عمليات النشر**

### ❌ لا تفعل:

1. **لا تسجل بيانات حساسة**
   ```python
   # ❌ سيئ
   logger.info(f'Login: {username}:{password}')
   
   # ✅ جيد
   logger.info('Login attempt', extra={'custom_dimensions': {'username': username}})
   ```

2. **لا تستخدم أخذ عينات بنسبة 100% في الإنتاج**
   ```python
   # ❌ مكلف
   sampler = ProbabilitySampler(rate=1.0)
   
   # ✅ فعال من حيث التكلفة
   sampler = ProbabilitySampler(rate=0.1)
   ```

3. **لا تتجاهل قوائم الرسائل الميتة (dead letter queues)**

4. **لا تنس تعيين حدود الاحتفاظ بالبيانات**

---

## استكشاف الأخطاء وإصلاحها

### المشكلة: عدم ظهور بيانات التليمتري

**التشخيص:**
```bash
# تحقق من تعيين سلسلة الاتصال
azd env get-values | grep APPLICATIONINSIGHTS

# تحقق من سجلات التطبيق عبر Azure Monitor
azd monitor --logs

# أو استخدم واجهة سطر أوامر Azure لتطبيقات الحاويات:
az containerapp logs show --name $APP_NAME --resource-group $RG_NAME --tail 50
```

**الحل:**
```bash
# تحقق من سلسلة الاتصال في تطبيق الحاوية
az containerapp show \
  --name $APP_NAME \
  --resource-group $RG_NAME \
  --query "properties.template.containers[0].env" \
  | grep -i applicationinsights
```

---

### المشكلة: ارتفاع التكاليف

**التشخيص:**
```bash
# تحقق من عملية إدخال البيانات
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "availabilityResults/count"
```

**الحل:**
- خفض معدل أخذ العينات
- تقليل فترة الاحتفاظ
- إزالة السجلات التفصيلية

---

## تعلّم المزيد

### الوثائق الرسمية
- [نظرة عامة على Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Application Insights لبايثون](https://learn.microsoft.com/azure/azure-monitor/app/opencensus-python)
- [لغة استعلام Kusto](https://learn.microsoft.com/azure/data-explorer/kusto/query/)
- [مراقبة AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/monitor-your-app)

### الخطوات التالية في هذه الدورة
- ← السابق: [فحوصات ما قبل النشر](preflight-checks.md)
- → التالي: [دليل النشر](../chapter-04-infrastructure/deployment-guide.md)
- 🏠 [الصفحة الرئيسية للدورة](../../README.md)

### أمثلة ذات صلة
- [مثال نماذج Microsoft Foundry](../../../../examples/azure-openai-chat) - تليمتري الذكاء الاصطناعي
- [مثال الخدمات المصغرة](../../../../examples/microservices) - التتبّع الموزّع

---

## الملخص

**ما تعلمته:**
- ✅ توفير Application Insights تلقائيًا مع AZD
- ✅ تليمتري مخصص (أحداث، مقاييس، تبعيات)
- ✅ التتبّع الموزّع عبر الخدمات المصغرة
- ✅ المقاييس الحية والمراقبة في الوقت الحقيقي
- ✅ التنبيهات ولوحات المعلومات
- ✅ مراقبة تطبيقات الذكاء الاصطناعي/نماذج اللغة الكبيرة
- ✅ استراتيجيات تحسين التكلفة

**النقاط الرئيسية المستخلصة:**
1. **AZD يوفر المراقبة تلقائيًا** - لا حاجة لإعداد يدوي
2. **استخدم السجلات المهيكلة** - يجعل الاستعلام أسهل
3. **تتبع أحداث الأعمال** - ليس مجرد مقاييس تقنية
4. **راقب تكاليف الذكاء الاصطناعي** - تتبع التوكنات والإنفاق
5. **قم بإعداد التنبيهات** - كن استباقيًا، لا تفاعليًا
6. **حسّن التكاليف** - استخدم العينات وحدود الاحتفاظ

**الخطوات التالية:**
1. أكمل التمارين العملية
2. أضف Application Insights إلى مشاريع AZD الخاصة بك
3. قم بإنشاء لوحات معلومات مخصصة لفريقك
4. تعرف على [دليل النشر](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**إخلاء المسؤولية**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة الآلية [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى ملاحظة أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الموثوق. للمعلومات الحرجة، يُنصَح بالاستعانة بترجمة بشرية احترافية. نحن لا نتحمل أي مسؤولية عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->