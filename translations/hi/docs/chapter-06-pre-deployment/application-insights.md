# Application Insights Integration with AZD

⏱️ **अनुमानित समय**: 40-50 मिनट | 💰 **लागत प्रभाव**: ~$5-15/month | ⭐ **जटिलता**: Intermediate

**📚 लर्निंग पाथ:**
- ← Previous: [Preflight Checks](preflight-checks.md) - प्री-डिप्लॉयमेंट सत्यापन
- 🎯 **You Are Here**: Application Insights Integration (मॉनिटरिंग, टेलीमेट्री, डिबगिंग)
- → Next: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Azure पर डिप्लॉय करें
- 🏠 [Course Home](../../README.md)

---

## आप क्या सीखेंगे

इस पाठ को पूरा करके, आप:
- AZD प्रोजेक्ट्स में स्वचालित रूप से **Application Insights** इंटीग्रेट कर सकेंगे
- माइक्रोसर्विसेज के लिए **डिस्ट्रीब्यूटेड ट्रेसिंग** कॉन्फ़िगर कर सकेंगे
- **कस्टम टेलीमेट्री** (मेट्रिक्स, इवेंट्स, dependencies) लागू कर सकेंगे
- रीयल-टाइम मॉनिटरिंग के लिए **लाइव मेट्रिक्स** सेट अप कर सकेंगे
- AZD डिप्लॉयमेंट्स से **अलर्ट्स और डैशबोर्ड** बना सकेंगे
- **टेलीमेट्री क्वेरीज** के साथ प्रोडक्शन मुद्दों को डिबग कर सकेंगे
- **लागत और सैंपलिंग** रणनीतियाँ अनुकूलित कर सकेंगे
- **AI/LLM अनुप्रयोगों** (टोकन, लेटेंसी, लागत) की निगरानी कर सकेंगे

## क्यों Application Insights + AZD महत्वपूर्ण है

### चुनौती: प्रोडक्शन ऑब्ज़र्वेबिलिटी

**Application Insights के बिना:**
```
❌ No visibility into production behavior
❌ Manual log aggregation across services
❌ Reactive debugging (wait for customer complaints)
❌ No performance metrics
❌ Cannot trace requests across services
❌ Unknown failure rates and bottlenecks
```

**Application Insights + AZD के साथ:**
```
✅ Automatic telemetry collection
✅ Centralized logs from all services
✅ Proactive issue detection
✅ End-to-end request tracing
✅ Performance metrics and insights
✅ Real-time dashboards
✅ AZD provisions everything automatically
```

**उपमा**: Application Insights आपके एप्लिकेशन के लिए "ब्लैक बॉक्स" फ्लाइट रिकॉर्डर + कॉकपिट डैशबोर्ड की तरह है। आप वास्तविक समय में सब कुछ देख सकते हैं और किसी भी घटना को फिर से प्ले कर सकते हैं।

---

## आर्किटेक्चर का अवलोकन

### AZD आर्किटेक्चर में Application Insights

```mermaid
graph TB
    User[उपयोगकर्ता/क्लाइंट]
    App1[कंटेनर ऐप 1<br/>API गेटवे]
    App2[कंटेनर ऐप 2<br/>उत्पाद सेवा]
    App3[कंटेनर ऐप 3<br/>ऑर्डर सेवा]
    
    AppInsights[एप्लिकेशन इनसाइट्स<br/>टेलीमेट्री हब]
    LogAnalytics[(लॉग एनालिटिक्स<br/>वर्कस्पेस)]
    
    Portal[Azure पोर्टल<br/>डैशबोर्ड और अलर्ट]
    Query[Kusto क्वेरीज<br/>कस्टम विश्लेषण]
    
    User --> App1
    App1 --> App2
    App2 --> App3
    
    App1 -.->|ऑटो-इंस्ट्रुमेंटेशन| AppInsights
    App2 -.->|ऑटो-इंस्ट्रुमेंटेशन| AppInsights
    App3 -.->|ऑटो-इंस्ट्रुमेंटेशन| AppInsights
    
    AppInsights --> LogAnalytics
    LogAnalytics --> Portal
    LogAnalytics --> Query
    
    style AppInsights fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
    style LogAnalytics fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
```
### क्या स्वतः मॉनिटर होता है

| Telemetry Type | What It Captures | Use Case |
|----------------|------------------|----------|
| **Requests** | HTTP requests, status codes, duration | API प्रदर्शन मॉनिटरिंग |
| **Dependencies** | External calls (DB, APIs, storage) | बॉटलनेक पहचानना |
| **Exceptions** | Unhandled errors with stack traces | फेलियर डिबगिंग |
| **Custom Events** | Business events (signup, purchase) | एनालिटिक्स और फ़नल्स |
| **Metrics** | Performance counters, custom metrics | क्षमता योजना |
| **Traces** | Log messages with severity | डिबगिंग और ऑडिटिंग |
| **Availability** | Uptime and response time tests | SLA मॉनिटरिंग |

---

## आवश्यक शर्तें

### आवश्यक उपकरण

```bash
# Azure Developer CLI सत्यापित करें
azd version
# ✅ अपेक्षित: azd संस्करण 1.0.0 या उससे ऊपर

# Azure CLI सत्यापित करें
az --version
# ✅ अपेक्षित: azure-cli 2.50.0 या उससे ऊपर
```

### Azure आवश्यकताएँ

- सक्रिय Azure subscription
- निम्न बनाने की अनुमतियाँ:
  - Application Insights resources
  - Log Analytics workspaces
  - Container Apps
  - Resource groups

### ज्ञान संबंधी पूर्वापेक्षितताएँ

आपको निम्न पूरा कर लेना चाहिए:
- [AZD Basics](../chapter-01-foundation/azd-basics.md) - AZD के मूल तत्व
- [Configuration](../chapter-03-configuration/configuration.md) - पर्यावरण सेटअप
- [First Project](../chapter-01-foundation/first-project.md) - बुनियादी डिप्लॉयमेंट

---

## पाठ 1: AZD के साथ स्वतः Application Insights

### AZD किस तरह Application Insights प्रोविजन करता है

AZD आपके डिप्लॉय के समय स्वतः Application Insights बनाता और कॉन्फ़िगर करता है। आइए देखें यह कैसे काम करता है।

### प्रोजेक्ट संरचना

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

### चरण 1: AZD कॉन्फ़िगर करें (azure.yaml)

**File: `azure.yaml`**

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

**बस इतना ही!** AZD डिफ़ॉल्ट रूप से Application Insights बनाएगा। बुनियादी मॉनिटरिंग के लिए कोई अतिरिक्त कॉन्फ़िगरेशन आवश्यक नहीं है।

---

### चरण 2: मॉनिटरिंग इन्फ्रास्ट्रक्चर (Bicep)

**File: `infra/core/monitoring.bicep`**

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

### चरण 3: Container App को Application Insights से कनेक्ट करें

**File: `infra/app/api.bicep`**

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

### चरण 4: एप्लिकेशन कोड में टेलीमेट्री

**File: `src/app.py`**

```python
from flask import Flask, request, jsonify
from opencensus.ext.azure.log_exporter import AzureLogHandler
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.ext.flask.flask_middleware import FlaskMiddleware
from opencensus.trace.samplers import ProbabilitySampler
import logging
import os

app = Flask(__name__)

# Application Insights कनेक्शन स्ट्रिंग प्राप्त करें
connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

if connection_string:
    # वितरित ट्रेसिंग कॉन्फ़िगर करें
    middleware = FlaskMiddleware(
        app,
        exporter=AzureExporter(connection_string=connection_string),
        sampler=ProbabilitySampler(rate=1.0)  # डेवलपमेंट के लिए 100% सैम्पलिंग
    )
    
    # लॉगिंग कॉन्फ़िगर करें
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
    
    # डेटाबेस कॉल का अनुकरण करें (स्वचालित रूप से निर्भरता के रूप में ट्रैक किया जाता है)
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
    time.sleep(3)  # धीमी ऑपरेशन का अनुकरण करें
    logger.warning('Endpoint took 3 seconds to respond')
    return jsonify({'message': 'Slow operation completed'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
```

**File: `src/requirements.txt`**

```txt
Flask==3.0.0
opencensus-ext-azure==1.1.13
opencensus-ext-flask==0.8.1
gunicorn==21.2.0
```

---

### चरण 5: डिप्लॉय और सत्यापन

```bash
# AZD को आरंभ करें
azd init

# तैनात करें (Application Insights की व्यवस्था स्वचालित रूप से करता है)
azd up

# ऐप का URL प्राप्त करें
APP_URL=$(azd env get-values | grep API_URL | cut -d '=' -f2 | tr -d '"')

# टेलीमेट्री उत्पन्न करें
curl $APP_URL/health
curl $APP_URL/api/products
curl $APP_URL/api/error-test
curl $APP_URL/api/slow
```

**✅ अपेक्षित आउटपुट:**
```json
{
  "status": "healthy",
  "monitoring": "enabled"
}
```

---

### चरण 6: Azure पोर्टल में टेलीमेट्री देखें

```bash
# Application Insights का विवरण प्राप्त करें
azd env get-values | grep APPLICATIONINSIGHTS

# Azure पोर्टल में खोलें
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"') \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"') \
  --query "appId" -o tsv
```

**Azure Portal → Application Insights → Transaction Search पर नेविगेट करें**

आपको दिखाई देना चाहिए:
- ✅ HTTP requests with status codes
- ✅ अनुरोध की अवधि ( `/api/slow` के लिए 3+ सेकंड)
- ✅ `/api/error-test` से Exception विवरण
- ✅ कस्टम लॉग संदेश

---

## पाठ 2: कस्टम टेलीमेट्री और इवेंट्स

### बिजनेस इवेंट्स ट्रैक करें

हम कस्टम टेलीमेट्री बिजनेस-क्रिटिकल इवेंट्स के लिए जोड़ते हैं।

**File: `src/telemetry.py`**

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
        
        # लॉगर सेट करें
        self.logger = logging.getLogger(__name__)
        self.logger.addHandler(AzureLogHandler(connection_string=self.connection_string))
        self.logger.setLevel(logging.INFO)
        
        # मेट्रिक्स एक्सपोर्टर सेट करें
        self.stats = stats_module.stats
        self.view_manager = self.stats.view_manager
        self.stats_recorder = self.stats.stats_recorder
        
        exporter = metrics_exporter.new_metrics_exporter(
            connection_string=self.connection_string
        )
        self.view_manager.register_exporter(exporter)
        
        # ट्रेसर सेट करें
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

# वैश्विक टेलीमेट्री क्लाइंट
telemetry = TelemetryClient()
```

### कस्टम इवेंट्स के साथ एप्लिकेशन अपडेट करें

**File: `src/app.py` (enhanced)**

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
    
    # व्यवसायिक घटना को ट्रैक करें
    telemetry.track_event('Purchase', {
        'product_id': product_id,
        'quantity': quantity,
        'total_amount': price * quantity,
        'user_id': request.headers.get('X-User-Id', 'anonymous')
    })
    
    # राजस्व मीट्रिक को ट्रैक करें
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
    
    # खोज का अनुकरण करें (वास्तविक रूप में डेटाबेस क्वेरी होगी)
    results = [{'id': 1, 'name': f'Result for {query}'}]
    
    duration = (time.time() - start_time) * 1000  # मिलीसेकंड में बदलें
    
    # खोज घटना को ट्रैक करें
    telemetry.track_event('Search', {
        'query': query,
        'results_count': len(results),
        'duration_ms': duration
    })
    
    # खोज प्रदर्शन मीट्रिक को ट्रैक करें
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
        # बाहरी API कॉल का अनुकरण करें
        response = requests.get('https://api.example.com/data', timeout=5)
        result = response.json()
    except Exception as e:
        success = False
        result = {'error': str(e)}
    
    duration = (time.time() - start_time) * 1000
    
    # निर्भरता को ट्रैक करें
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

### कस्टम टेलीमेट्री का परीक्षण करें

```bash
# खरीदारी घटना को ट्रैक करें
curl -X POST $APP_URL/api/purchase \
  -H "Content-Type: application/json" \
  -H "X-User-Id: user123" \
  -d '{"product_id": 1, "quantity": 2, "price": 29.99}'

# खोज घटना को ट्रैक करें
curl "$APP_URL/api/search?q=laptop"

# बाहरी निर्भरता को ट्रैक करें
curl $APP_URL/api/external-call
```

**Azure Portal में देखें:**

Application Insights → Logs पर नेविगेट करें, फिर चलाएँ:

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

## पाठ 3: माइक्रोसर्विसेज के लिए डिस्ट्रीब्यूटेड ट्रेसिंग

### क्रॉस-सर्विस ट्रेसिंग सक्षम करें

माइक्रोसर्विसेज के लिए, Application Insights स्वतः सेवाओं के बीच अनुरोधों का कोरिलेशन करता है।

**File: `infra/main.bicep`**

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

### एंड-टू-एंड ट्रांज़ैक्शन देखें

```mermaid
sequenceDiagram
    participant User
    participant Gateway as API गेटवे<br/>(ट्रेस आईडी: abc123)
    participant Product as उत्पाद सेवा<br/>(पैरेंट आईडी: abc123)
    participant Order as ऑर्डर सेवा<br/>(पैरेंट आईडी: abc123)
    participant AppInsights as एप्लिकेशन इनसाइट्स
    
    User->>Gateway: POST /api/checkout
    Note over Gateway: ट्रेस प्रारम्भ: abc123
    Gateway->>AppInsights: अनुरोध लॉग करें (ट्रेस आईडी: abc123)
    
    Gateway->>Product: GET /products/123
    Note over Product: पैरेंट आईडी: abc123
    Product->>AppInsights: डिपेंडेंसी कॉल लॉग करें
    Product-->>Gateway: उत्पाद विवरण
    
    Gateway->>Order: POST /orders
    Note over Order: पैरेंट आईडी: abc123
    Order->>AppInsights: डिपेंडेंसी कॉल लॉग करें
    Order-->>Gateway: ऑर्डर बनाया गया
    
    Gateway-->>User: चेकआउट पूरा
    Gateway->>AppInsights: प्रतिक्रिया लॉग करें (अवधि: 450ms)
    
    Note over AppInsights: ट्रेस आईडी द्वारा सहसंबंध
```
**एंड-टू-एंड ट्रेस क्वेरी करें:**

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

## पाठ 4: लाइव मेट्रिक्स और रीयल-टाइम मॉनिटरिंग

### लाइव मेट्रिक्स स्ट्रीम सक्षम करें

लाइव मेट्रिक्स <1 सेकंड लेटेंसी के साथ रीयल-टाइम टेलीमेट्री देती है।

**लाइव मेट्रिक्स तक पहुँचें:**

```bash
# Application Insights संसाधन प्राप्त करें
APPI_NAME=$(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"')

# संसाधन समूह प्राप्त करें
RG_NAME=$(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"')

echo "Navigate to: Azure Portal → Resource Groups → $RG_NAME → $APPI_NAME → Live Metrics"
```

**रीयल-टाइम में आप क्या देखते हैं:**
- ✅ इनकमिंग request rate (requests/sec)
- ✅ आउटगोइंग dependency कॉल्स
- ✅ Exception count
- ✅ CPU और memory उपयोग
- ✅ सक्रिय सर्वर की संख्या
- ✅ सैंपल टेलीमेट्री

### परीक्षण के लिए लोड जनरेट करें

```bash
# लाइव मेट्रिक्स देखने के लिए लोड जनरेट करें
for i in {1..100}; do
  curl $APP_URL/api/products &
  curl $APP_URL/api/search?q=test$i &
done

# Azure पोर्टल में लाइव मेट्रिक्स देखें
# आपको अनुरोध दर में उछाल दिखाई देना चाहिए
```

---

## प्रैक्टिकल अभ्यास

### अभ्यास 1: अलर्ट सेट अप करें ⭐⭐ (मध्यम)

**लक्ष्य**: उच्च एरर रेट और धीमी प्रतिक्रियाओं के लिए अलर्ट बनाएं।

**कदम:**

1. **एरर रेट के लिए अलर्ट बनाएँ:**

```bash
# Application Insights संसाधन ID प्राप्त करें
APPI_ID=$(az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "id" -o tsv)

# असफल अनुरोधों के लिए मैट्रिक अलर्ट बनाएं
az monitor metrics alert create \
  --name "High-Error-Rate" \
  --resource-group $RG_NAME \
  --scopes $APPI_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "Alert when error rate exceeds 10 per 5 minutes"
```

2. **धीमी प्रतिक्रियाओं के लिए अलर्ट बनाएँ:**

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

3. **Bicep के माध्यम से अलर्ट बनाएं (AZD के लिए प्राथमिक):**

**File: `infra/core/alerts.bicep`**

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

4. **अलर्ट्स का परीक्षण करें:**

```bash
# त्रुटियाँ उत्पन्न करें
for i in {1..20}; do
  curl $APP_URL/api/error-test
done

# धीमी प्रतिक्रियाएँ उत्पन्न करें
for i in {1..10}; do
  curl $APP_URL/api/slow
done

# अलर्ट स्थिति जांचें (5-10 मिनट प्रतीक्षा करें)
az monitor metrics alert list \
  --resource-group $RG_NAME \
  --query "[].{Name:name, Enabled:enabled, State:properties.enabled}" \
  --output table
```

**✅ सफलता मानदंड:**
- ✅ अलर्ट्स सफलतापूर्वक बनाए गए
- ✅ थ्रेशहोल्ड पार होने पर अलर्ट्स ट्रिगर होते हैं
- ✅ Azure Portal में अलर्ट इतिहास देखा जा सकता है
- ✅ AZD डिप्लॉयमेंट के साथ इंटिग्रेटेड

**समय**: 20-25 मिनट

---

### अभ्यास 2: कस्टम डैशबोर्ड बनाएं ⭐⭐ (मध्यम)

**लक्ष्य**: प्रमुख एप्लिकेशन मेट्रिक्स दिखाने वाला डैशबोर्ड बनाना।

**कदम:**

1. **Azure Portal के माध्यम से डैशबोर्ड बनाएं:**

Navigate to: Azure Portal → Dashboards → New Dashboard

2. **प्रमुख मेट्रिक्स के लिए टाइल्स जोड़ें:**

- Request count (last 24 hours)
- Average response time
- Error rate
- Top 5 slowest operations
- Geographic distribution of users

3. **Bicep के माध्यम से डैशबोर्ड बनाएं:**

**File: `infra/core/dashboard.bicep`**

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

4. **डैशबोर्ड डिप्लॉय करें:**

```bash
# main.bicep में जोड़ें
module dashboard './core/dashboard.bicep' = {
  name: 'dashboard'
  scope: rg
  params: {
    dashboardName: 'dashboard-${environmentName}'
    applicationInsightsId: monitoring.outputs.applicationInsightsId
    location: location
  }
}

# तैनात करें
azd up
```

**✅ सफलता मानदंड:**
- ✅ डैशबोर्ड प्रमुख मेट्रिक्स दिखाता है
- ✅ Azure Portal होम पर पिन किया जा सकता है
- ✅ रीयल-टाइम में अपडेट होता है
- ✅ AZD के माध्यम से डिप्लॉयेबल

**समय**: 25-30 मिनट

---

### अभ्यास 3: AI/LLM एप्लिकेशन की निगरानी ⭐⭐⭐ (उन्नत)

**लक्ष्य**: Microsoft Foundry Models उपयोग (टोकन, लागत, लेटेंसी) ट्रैक करें।

**कदम:**

1. **AI मॉनिटरिंग रैपर बनाएं:**

**File: `src/ai_telemetry.py`**

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
            # Microsoft Foundry मॉडलों को कॉल करें
            response = self.client.chat.completions.create(
                model=model,
                messages=messages,
                **kwargs
            )
            
            duration = (time.time() - start_time) * 1000  # ms
            
            # उपयोग निकालें
            usage = response.usage
            prompt_tokens = usage.prompt_tokens
            completion_tokens = usage.completion_tokens
            total_tokens = usage.total_tokens
            
            # लागत की गणना करें (gpt-4.1 मूल्य निर्धारण)
            prompt_cost = (prompt_tokens / 1000) * 0.03  # $0.03 प्रति 1K टोकन
            completion_cost = (completion_tokens / 1000) * 0.06  # $0.06 प्रति 1K टोकन
            total_cost = prompt_cost + completion_cost
            
            # कस्टम इवेंट को ट्रैक करें
            telemetry.track_event('OpenAI_Request', {
                'model': model,
                'prompt_tokens': prompt_tokens,
                'completion_tokens': completion_tokens,
                'total_tokens': total_tokens,
                'duration_ms': duration,
                'cost_usd': total_cost,
                'success': True
            })
            
            # मेट्रिक्स को ट्रैक करें
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

2. **मॉनिटर किए हुए क्लाइंट का उपयोग करें:**

```python
from flask import Flask, request, jsonify
from ai_telemetry import MonitoredAzureOpenAI
import os

app = Flask(__name__)

# निगرानी किए गए OpenAI क्लाइंट को प्रारंभ करें
openai_client = MonitoredAzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

@app.route('/api/chat', methods=['POST'])
def chat():
    data = request.json
    user_message = data.get('message')
    
    # स्वचालित निगरानी के साथ कॉल करें
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

3. **AI मेट्रिक्स क्वेरी करें:**

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

**✅ सफलता मानदंड:**
- ✅ हर OpenAI कॉल स्वचालित रूप से ट्रैक होता है
- ✅ टोकन उपयोग और लागत दिखाई देती है
- ✅ लेटेंसी मॉनिटर की जाती है
- ✅ बजट अलर्ट सेट कर सकते हैं

**समय**: 35-45 मिनट

---

## लागत अनुकूलन

### सैंपलिंग रणनीतियाँ

टेलीमेट्री सैंपल करके लागत नियंत्रित करें:

```python
from opencensus.trace.samplers import ProbabilitySampler

# विकास: 100% नमूनाकरण
sampler = ProbabilitySampler(rate=1.0)

# उत्पादन: 10% नमूनाकरण (लागत को 90% तक कम करता है)
sampler = ProbabilitySampler(rate=0.1)

# अनुकूली नमूनाकरण (स्वतः समायोजित होता है)
from opencensus.trace.samplers import AdaptiveSampler
sampler = AdaptiveSampler()
```

**Bicep में:**

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  properties: {
    SamplingPercentage: 10  // 10% sampling
  }
}
```

### डेटा रिटेंशन

```bicep
resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: logAnalyticsName
  properties: {
    retentionInDays: 30  // Minimum (cheapest)
    // Options: 30, 31, 60, 90, 120, 180, 270, 365, 550, 730
  }
}
```

### मासिक लागत अनुमान

| Data Volume | Retention | Monthly Cost |
|-------------|-----------|--------------|
| 1 GB/month | 30 days | ~$2-5 |
| 5 GB/month | 30 days | ~$10-15 |
| 10 GB/month | 90 days | ~$25-40 |
| 50 GB/month | 90 days | ~$100-150 |

**फ्री टियर**: 5 GB/month शामिल

---

## ज्ञान जाँच बिंदु

### 1. बुनियादी इंटीग्रेशन ✓

अपनी समझ जांचें:

- [ ] **Q1**: AZD किस तरह Application Insights प्रोविजन करता है?
  - **A**: Automatically via Bicep templates in `infra/core/monitoring.bicep`

- [ ] **Q2**: कौन सा environment variable Application Insights सक्षम करता है?
  - **A**: `APPLICATIONINSIGHTS_CONNECTION_STRING`

- [ ] **Q3**: तीन मुख्य टेलीमेट्री प्रकार कौन से हैं?
  - **A**: Requests (HTTP calls), Dependencies (external calls), Exceptions (errors)

**Hands-On Verification:**
```bash
# जाँचें कि Application Insights कॉन्फ़िगर किया गया है या नहीं
azd env get-values | grep APPLICATIONINSIGHTS

# सत्यापित करें कि टेलीमेट्री प्रवाहित हो रही है
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "requests/count"
```

---

### 2. कस्टम टेलीमेट्री ✓

अपनी समझ जांचें:

- [ ] **Q1**: आप कस्टम बिजनेस इवेंट्स कैसे ट्रैक करते हैं?
  - **A**: `custom_dimensions` के साथ logger या `TelemetryClient.track_event()` का उपयोग करके

- [ ] **Q2**: इवेंट्स और मेट्रिक्स में क्या अंतर है?
  - **A**: इवेंट्स डिस्क्रीट घटनाएँ हैं, मेट्रिक्स संख्यात्मक माप हैं

- [ ] **Q3**: आप सेवाओं के बीच टेलीमेट्री को कैसे कोरिलेट करते हैं?
  - **A**: Application Insights स्वतः `operation_Id` का उपयोग करके कोरिलेशन करता है

**Hands-On Verification:**
```kusto
// Verify custom events
traces
| where customDimensions.event_name != ""
| summarize count() by tostring(customDimensions.event_name)
```

---

### 3. प्रोडक्शन मॉनिटरिंग ✓

अपनी समझ जांचें:

- [ ] **Q1**: सैंपलिंग क्या है और क्यों उपयोग करें?
  - **A**: सैंपलिंग डेटा वॉल्यूम (और लागत) घटाने के लिए टेलीमेट्री का केवल एक प्रतिशत कैप्चर करती है

- [ ] **Q2**: आप अलर्ट कैसे सेट करते हैं?
  - **A**: Application Insights मेट्रिक्स के आधार पर Bicep या Azure Portal में मेट्रिक अलर्ट का उपयोग करके

- [ ] **Q3**: Log Analytics और Application Insights में क्या अंतर है?
  - **A**: Application Insights डेटा को Log Analytics workspace में स्टोर करता है; App Insights एप्लिकेशन-विशिष्ट दृश्य प्रदान करता है

**Hands-On Verification:**
```bash
# सैम्पलिंग कॉन्फ़िगरेशन की जाँच करें
az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "properties.SamplingPercentage"
```

---

## सर्वश्रेष्ठ प्रथाएँ

### ✅ करें:

1. **Correlation IDs का उपयोग करें**
   ```python
   logger.info('Processing order', extra={
       'custom_dimensions': {
           'order_id': order_id,
           'user_id': user_id
       }
   })
   ```

2. **महत्वपूर्ण मेट्रिक्स के लिए अलर्ट सेट करें**
   ```bicep
   // Error rate, slow responses, availability
   ```

3. **स्ट्रक्चर्ड लॉगिंग का उपयोग करें**
   ```python
   # ✅ अच्छा: संरचित
   logger.info('User signup', extra={'custom_dimensions': {'user_id': 123}})
   
   # ❌ बुरा: असंरचित
   logger.info(f'User 123 signed up')
   ```

4. **Dependencies की निगरानी करें**
   ```python
   # डेटाबेस कॉल, HTTP अनुरोध आदि को स्वचालित रूप से ट्रैक करें।
   ```

5. **डिप्लॉयमेंट के दौरान Live Metrics का उपयोग करें**

### ❌ न करें:

1. **संवेदनशील डेटा लॉग न करें**
   ```python
   # ❌ खराब
   logger.info(f'Login: {username}:{password}')
   
   # ✅ अच्छा
   logger.info('Login attempt', extra={'custom_dimensions': {'username': username}})
   ```

2. **प्रोडक्शन में 100% सैंपलिंग का उपयोग न करें**
   ```python
   # ❌ महंगा
   sampler = ProbabilitySampler(rate=1.0)
   
   # ✅ किफायती
   sampler = ProbabilitySampler(rate=0.1)
   ```

3. **डेड लेटर क्यूज़ को अनदेखा न करें**

4. **डेटा रिटेंशन लिमिट्स सेट करना न भूलें**

---

## Troubleshooting

### समस्या: कोई टेलीमेट्री दिखाई नहीं दे रही

**डायग्नोसिस:**
```bash
# जांचें कि कनेक्शन स्ट्रिंग सेट है
azd env get-values | grep APPLICATIONINSIGHTS

# Azure Monitor के माध्यम से एप्लिकेशन लॉग्स जांचें
azd monitor --logs

# या Container Apps के लिए Azure CLI का उपयोग करें:
az containerapp logs show --name $APP_NAME --resource-group $RG_NAME --tail 50
```

**समाधान:**
```bash
# Container App में कनेक्शन स्ट्रिंग सत्यापित करें
az containerapp show \
  --name $APP_NAME \
  --resource-group $RG_NAME \
  --query "properties.template.containers[0].env" \
  | grep -i applicationinsights
```

---

### समस्या: उच्च लागत

**डायग्नोसिस:**
```bash
# डेटा इनजेशन की जाँच करें
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "availabilityResults/count"
```

**समाधान:**
- सैंपलिंग रेट घटाएँ
- रिटेंशन अवधि घटाएँ
- वर्बोज़ लॉगिंग हटाएँ

---

## और जानें

### आधिकारिक दस्तावेज़
- [Application Insights Overview](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Application Insights for Python](https://learn.microsoft.com/azure/azure-monitor/app/opencensus-python)
- [Kusto Query Language](https://learn.microsoft.com/azure/data-explorer/kusto/query/)
- [AZD Monitoring](https://learn.microsoft.com/azure/developer/azure-developer-cli/monitor-your-app)

### इस कोर्स में अगले कदम
- ← Previous: [Preflight Checks](preflight-checks.md)
- → Next: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- 🏠 [Course Home](../../README.md)

### संबंधित उदाहरण
- [Microsoft Foundry Models Example](../../../../examples/azure-openai-chat) - AI टेलीमेट्री
- [Microservices Example](../../../../examples/microservices) - डिस्ट्रीब्यूटेड ट्रेसिंग

---

## सारांश

**आपने सीखा:**
- ✅ AZD के साथ Automatic Application Insights प्रोविजनिंग
- ✅ कस्टम टेलीमेट्री (इवेंट्स, मेट्रिक्स, dependencies)
- ✅ माइक्रोसर्विसेज में डिस्ट्रीब्यूटेड ट्रेसिंग
- ✅ लाइव मेट्रिक्स और रीयल-टाइम मॉनिटरिंग
- ✅ अलर्ट्स और डैशबोर्ड्स
- ✅ AI/LLM एप्लिकेशन की निगरानी
- ✅ लागत अनुकूलन रणनीतियाँ

**मुख्य निष्कर्ष:**
1. **AZD स्वचालित रूप से मॉनिटरिंग प्रदान करता है** - कोई मैन्युअल सेटअप नहीं
2. **संरचित लॉगिंग का उपयोग करें** - क्वेरी करना आसान बनाता है
3. **व्यावसायिक घटनाओं को ट्रैक करें** - केवल तकनीकी मेट्रिक्स ही नहीं
4. **AI लागत की निगरानी करें** - टोकन और खर्च को ट्रैक करें
5. **अलर्ट सेट करें** - सक्रिय रहें, प्रतिक्रियाशील नहीं
6. **लागत को अनुकूलित करें** - सैंपलिंग और प्रतिधारण सीमाओं का उपयोग करें

**अगले कदम:**
1. व्यावहारिक अभ्यास पूरा करें
2. अपने AZD प्रोजेक्ट्स में Application Insights जोड़ें
3. अपनी टीम के लिए कस्टम डैशबोर्ड बनाएं
4. जानें [डिप्लॉयमेंट गाइड](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
यह दस्तावेज़ एआई अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता के लिए प्रयासरत हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या असंगतियाँ हो सकती हैं। मूल भाषा में उपलब्ध मूल दस्तावेज़ को अधिकारिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की अनुशंसा की जाती है। हम इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->