# Application Insights Integration with AZD

⏱️ **Estimated Time**: 40-50 minutes | 💰 **Cost Impact**: ~$5-15/month | ⭐ **Complexity**: Intermediate

**📚 Learning Path:**
- ← Previous: [प्रिफ्लाइट जाँचहरू](preflight-checks.md) - प्रि-डिप्लोइमेन्ट मान्यकरण
- 🎯 **तपाईं यहाँ हुनुहुन्छ**: Application Insights Integration (मोनिटरिङ, टेलीमेट्री, डिबगिङ)
- → Next: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Azure मा डिप्लोइ गर्नुहोस्
- 🏠 [Course Home](../../README.md)

---

## तपाईं के सिक्नुहुनेछ

यो पाठ पूरा गर्दा तपाईंले:
- AZD प्रोजेक्टहरूमा स्वचालित रूपमा **Application Insights** एकीकृत गर्न
- माइक्रोसर्भिसहरूको लागि **distributed tracing** कन्फिगर गर्न
- **कस्टम टेलीमेट्री** (मेट्रिक्स, घटनाहरू, डिपेन्डेन्सीहरू) कार्यान्वयन गर्न
- वास्तविक-समय मोनिटरिङका लागि **live metrics** सेट अप गर्न
- AZD डिप्लोइमेन्टबाट **अलर्ट र ड्यासबोर्ड** बनाउन
- **टेलीमेट्री क्वेरीहरू** मार्फत प्रोडक्सन समस्या डिबग गर्न
- **लागत र स्याम्पलिङ** रणनीतिहरू अनुकूलतरण गर्न
- **AI/LLM अनुप्रयोगहरू** (टोकनहरू, लेटेन्सी, लागत) अनुगमन गर्न

## किन AZD सँग Application Insights महत्त्व छ

### चुनौती: प्रोडक्सन अव्जरभबिलिटी

**Application Insights बिना:**
```
❌ No visibility into production behavior
❌ Manual log aggregation across services
❌ Reactive debugging (wait for customer complaints)
❌ No performance metrics
❌ Cannot trace requests across services
❌ Unknown failure rates and bottlenecks
```

**Application Insights + AZD सँग:**
```
✅ Automatic telemetry collection
✅ Centralized logs from all services
✅ Proactive issue detection
✅ End-to-end request tracing
✅ Performance metrics and insights
✅ Real-time dashboards
✅ AZD provisions everything automatically
```

**उपमा**: Application Insights तपाईंको एप्लिकेशनको लागि "ब्ल्याक बक्स" फ्लाइट रेकर्डर + ककटपिट ड्यासबोर्ड जस्तै हो। तपाईं वास्तविक समयमा सबै कुरा हेर्न सक्नुहुन्छ र कुनै पनि घटनालाई पुन: प्ले गर्न सक्नुहुन्छ।

---

## आर्किटेक्चर अवलोकन

### AZD आर्किटेक्चरमा Application Insights

```mermaid
graph TB
    User[प्रयोगकर्ता/क्लाइन्ट]
    App1[कन्टेनर एप 1<br/>API गेटवे]
    App2[कन्टेनर एप 2<br/>उत्पादन सेवा]
    App3[कन्टेनर एप 3<br/>अर्डर सेवा]
    
    AppInsights[अनुप्रयोग अन्तर्दृष्टि<br/>टेलिमेट्री हब]
    LogAnalytics[(लॉग विश्लेषण<br/>वर्कस्पेस)]
    
    Portal[Azure पोर्टल<br/>ड्यासबोर्ड र सूचनाहरू]
    Query[Kusto क्वेरीहरू<br/>कस्टम विश्लेषण]
    
    User --> App1
    App1 --> App2
    App2 --> App3
    
    App1 -.->|स्वचालित इन्स्ट्रुमेन्टेसन| AppInsights
    App2 -.->|स्वचालित इन्स्ट्रुमेन्टेसन| AppInsights
    App3 -.->|स्वचालित इन्स्ट्रुमेन्टेसन| AppInsights
    
    AppInsights --> LogAnalytics
    LogAnalytics --> Portal
    LogAnalytics --> Query
    
    style AppInsights fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
    style LogAnalytics fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
```
### के स्वचालित रूपमा मनिटर हुन्छ

| Telemetry Type | What It Captures | Use Case |
|----------------|------------------|----------|
| **Requests** | HTTP अनुरोधहरू, स्थिति कोडहरू, अवधि | API प्रदर्शन मोनिटरिङ |
| **Dependencies** | बाह्य कलहरू (DB, APIहरू, स्टोरेज) | बोटलनेक्स पहिचान गर्न |
| **Exceptions** | स्ट्याक ट्रेससहित असम्हालिएका त्रुटिहरू | असफलताहरू डिबग गर्न |
| **Custom Events** | व्यवसायिक घटनाहरू (साइनअप, खरीद) | एनालिटिक्स र फनेलहरू |
| **Metrics** | प्रदर्शन काउन्टरहरू, कस्टम मेट्रिक्स | क्षमता योजना |
| **Traces** | गम्भीरतासहित लग सन्देशहरू | डिबगिङ र अडिटिङ |
| **Availability** | अपटाइम र प्रतिक्रिया समय परीक्षणहरू | SLA मोनिटरिङ |

---

## पूर्व-आवश्यकताहरू

### आवश्यक उपकरणहरू

```bash
# Azure Developer CLI जाँच गर्नुहोस्
azd version
# ✅ अपेक्षित: azd संस्करण 1.0.0 वा माथि

# Azure CLI जाँच गर्नुहोस्
az --version
# ✅ अपेक्षित: azure-cli 2.50.0 वा माथि
```

### Azure आवश्यकताहरू

- सक्रिय Azure subscription
- सिर्जना गर्ने अनुमति:
  - Application Insights स्रोतहरू
  - Log Analytics वर्कस्पेसहरू
  - Container Apps
  - Resource समूहहरू

### ज्ञान सम्बन्धी पूर्व-आवश्यकताहरू

तपाईंले पूरा गर्नुपर्छ:
- [AZD Basics](../chapter-01-foundation/azd-basics.md) - AZD का मुख्य अवधारणा
- [Configuration](../chapter-03-configuration/configuration.md) - वातावरण सेटअप
- [First Project](../chapter-01-foundation/first-project.md) - आधारभूत डिप्लोइमेन्ट

---

## पाठ 1: AZD सँग स्वतः Application Insights

### AZD ले Application Insights कसरी प्रोभिजन गर्छ

AZD ले तपाईंले डिप्लोय गर्दा स्वचालित रूपमा Application Insights सिर्जना र कन्फिगर गर्छ। यसले कसरी काम गर्छ भनेर हेरौं।

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

### चरण 1: AZD कन्फिगर गर्नुहोस् (azure.yaml)

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

**यत्ति!** AZDले डिफ़ल्ट रूपमा Application Insights सिर्जना गर्नेछ। आधारभूत मोनिटरिङका लागि कुनै अतिरिक्त कन्फिगरेसन आवश्यक छैन।

---

### चरण 2: मोनिटरिङ पूर्वाधार (Bicep)

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

### चरण 3: Container App लाई Application Insights संग जडान गर्नुहोस्

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

### चरण 4: टेलीमेट्री सहितको एप्लिकेशन कोड

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

# Application Insights कनेक्शन स्ट्रिङ प्राप्त गर्नुहोस्
connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

if connection_string:
    # वितरित ट्रेसिङ कन्फिगर गर्नुहोस्
    middleware = FlaskMiddleware(
        app,
        exporter=AzureExporter(connection_string=connection_string),
        sampler=ProbabilitySampler(rate=1.0)  # डेभलपमेन्टका लागि 100% स्याम्पलिङ
    )
    
    # लॉगिङ कन्फिगर गर्नुहोस्
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
    
    # डेटाबेस कलको अनुकरण गर्नुहोस् (स्वचालित रूपमा निर्भरता रूपमा ट्र्याक गरिन्छ)
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
    time.sleep(3)  # ढिलो सञ्चालन अनुकरण गर्नुहोस्
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

### चरण 5: डिप्लोय र प्रमाणित गर्नुहोस्

```bash
# AZD आरम्भ गर्नुहोस्
azd init

# परिनियोजन गर्नुहोस् (Application Insights लाई स्वचालित रूपमा प्रावधान गर्दछ)
azd up

# एपको URL प्राप्त गर्नुहोस्
APP_URL=$(azd env get-values | grep API_URL | cut -d '=' -f2 | tr -d '"')

# टेलीमेट्री उत्पन्न गर्नुहोस्
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

### चरण 6: Azure Portal मा टेलीमेट्री हेर्नुहोस्

```bash
# Application Insights का विवरणहरू प्राप्त गर्नुहोस्
azd env get-values | grep APPLICATIONINSIGHTS

# Azure पोर्टलमा खोल्नुहोस्
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"') \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"') \
  --query "appId" -o tsv
```

**Azure Portal मा जानुहोस् → Application Insights → Transaction Search**

तपाईंले देख्नुहुनेछ:
- ✅ HTTP अनुरोधहरू र स्थिति कोडहरू
- ✅ अनुरोध अवधि (`/api/slow` का लागि 3+ सेकेन्ड)
- ✅ `/api/error-test` बाट अपवाद विवरणहरू
- ✅ कस्टम लग सन्देशहरू

---

## पाठ 2: कस्टम टेलीमेट्री र घटनाहरू

### व्यवसायिक घटनाहरू ट्र्याक गर्नुहोस्

व्यवसाय-महत्वपूर्ण घटनाहरूका लागि कस्टम टेलीमेट्री थपौं।

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
        
        # लगर सेटअप गर्नुहोस्
        self.logger = logging.getLogger(__name__)
        self.logger.addHandler(AzureLogHandler(connection_string=self.connection_string))
        self.logger.setLevel(logging.INFO)
        
        # मेट्रिक्स एक्सपोर्टर सेटअप गर्नुहोस्
        self.stats = stats_module.stats
        self.view_manager = self.stats.view_manager
        self.stats_recorder = self.stats.stats_recorder
        
        exporter = metrics_exporter.new_metrics_exporter(
            connection_string=self.connection_string
        )
        self.view_manager.register_exporter(exporter)
        
        # ट्रेसर सेटअप गर्नुहोस्
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

# वैश्विक टेलिमेट्री क्लाइन्ट
telemetry = TelemetryClient()
```

### कस्टम घटनाहरू सहित एप्लिकेशन अपडेट गर्नुहोस्

**File: `src/app.py` (सुधार गरिएको)**

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
    
    # व्यापार घटना ट्र्याक गर्नुहोस्
    telemetry.track_event('Purchase', {
        'product_id': product_id,
        'quantity': quantity,
        'total_amount': price * quantity,
        'user_id': request.headers.get('X-User-Id', 'anonymous')
    })
    
    # राजस्व मेट्रिक ट्र्याक गर्नुहोस्
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
    
    # खोज अनुकरण गर्नुहोस् (वास्तविक डेटाबेस क्वेरी हुनेछ)
    results = [{'id': 1, 'name': f'Result for {query}'}]
    
    duration = (time.time() - start_time) * 1000  # मिलिसेकेन्डमा रूपान्तरण गर्नुहोस्
    
    # खोज घटना ट्र्याक गर्नुहोस्
    telemetry.track_event('Search', {
        'query': query,
        'results_count': len(results),
        'duration_ms': duration
    })
    
    # खोज प्रदर्शन मेट्रिक ट्र्याक गर्नुहोस्
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
        # बाह्य API कल अनुकरण गर्नुहोस्
        response = requests.get('https://api.example.com/data', timeout=5)
        result = response.json()
    except Exception as e:
        success = False
        result = {'error': str(e)}
    
    duration = (time.time() - start_time) * 1000
    
    # निर्भरता ट्र्याक गर्नुहोस्
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

### कस्टम टेलीमेट्री परीक्षण गर्नुहोस्

```bash
# खरिद घटनालाई ट्र्याक गर्नुहोस्
curl -X POST $APP_URL/api/purchase \
  -H "Content-Type: application/json" \
  -H "X-User-Id: user123" \
  -d '{"product_id": 1, "quantity": 2, "price": 29.99}'

# खोज घटनालाई ट्र्याक गर्नुहोस्
curl "$APP_URL/api/search?q=laptop"

# बाह्य निर्भरतालाई ट्र्याक गर्नुहोस्
curl $APP_URL/api/external-call
```

**Azure Portal मा हेर्नुहोस्:**

Application Insights → Logs मा जानुहोस्, अनि चलाउनुहोस्:

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

## पाठ 3: माइक्रोसर्भिसहरूको लागि डिस्ट्रीब्युटेड ट्रेसिङ

### क्रस-सर्भिस ट्रेसिङ सक्षम गर्नुहोस्

माइक्रोसर्भिसहरूको लागि, Application Insights स्वचालित रूपमा सेवाहरू बीच अनुरोधहरू सम्बन्धित गर्दछ।

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

### एंड-टु-एंड ट्रान्ज्याक्शन हेर्नुहोस्

```mermaid
sequenceDiagram
    participant User
    participant Gateway as API गेटवे<br/>(Trace ID: abc123)
    participant Product as उत्पादन सेवा<br/>(Parent ID: abc123)
    participant Order as अर्डर सेवा<br/>(Parent ID: abc123)
    participant AppInsights as एप्लिकेशन इन्साइट्स
    
    User->>Gateway: POST /api/checkout
    Note over Gateway: ट्रेस सुरु: abc123
    Gateway->>AppInsights: अनुरोध लग (Trace ID: abc123)
    
    Gateway->>Product: GET /products/123
    Note over Product: अभिभावक ID: abc123
    Product->>AppInsights: डिपेन्डेन्सी कल लग
    Product-->>Gateway: उत्पादन विवरण
    
    Gateway->>Order: POST /orders
    Note over Order: अभिभावक ID: abc123
    Order->>AppInsights: डिपेन्डेन्सी कल लग
    Order-->>Gateway: अर्डर सिर्जना भयो
    
    Gateway-->>User: चेकआउट पूरा भयो
    Gateway->>AppInsights: प्रतिक्रिया लग (Duration: 450ms)
    
    Note over AppInsights: ट्रेस ID द्वारा सम्बन्ध
```
**एंड-टु-एंड ट्रेस क्वेरी गर्नुहोस्:**

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

## पाठ 4: लाइव मेट्रिक्स र वास्तविक-समय मोनिटरिङ

### Live Metrics Stream सक्षम गर्नुहोस्

Live Metrics ले वास्तविक समयमा <1 सेकेन्ड विलम्बमा टेलीमेट्री प्रदान गर्छ।

**Live Metrics पहुँच:**

```bash
# Application Insights स्रोत प्राप्त गर्नुहोस्
APPI_NAME=$(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"')

# स्रोत समूह प्राप्त गर्नुहोस्
RG_NAME=$(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"')

echo "Navigate to: Azure Portal → Resource Groups → $RG_NAME → $APPI_NAME → Live Metrics"
```

**तपाईं वास्तविक समयमा के हेर्नेछ:**
- ✅ आउने अनुरोध दर (requests/sec)
- ✅ आउटगोइङ डिपेन्डेन्सी कलहरू
- ✅ अपवाद गणना
- ✅ CPU र मेमोरी प्रयोग
- ✅ सक्रिय सर्भर संख्या
- ✅ स्याम्पल गरिएको टेलीमेट्री

### परीक्षणका लागि लोड उत्पन्न गर्नुहोस्

```bash
# लाइभ मेट्रिक्स हेर्न लोड सिर्जना गर्नुहोस्
for i in {1..100}; do
  curl $APP_URL/api/products &
  curl $APP_URL/api/search?q=test$i &
done

# Azure पोर्टलमा लाइभ मेट्रिक्स हेर्नुहोस्
# तपाईंले अनुरोध दरमा तीव्र वृद्धि देख्नुहुनेछ
```

---

## प्रयोगात्मक अभ्यासहरू

### अभ्यास 1: अलर्ट सेट अप गर्नुहोस् ⭐⭐ (मध्यम)

**लक्ष्य**: उच्च त्रुटि दर र ढिला प्रतिक्रियाहरूका लागि अलर्टहरू सिर्जना गर्नुहोस्।

**कामहरूको क्रम:**

1. **त्रुटि दरका लागि अलर्ट सिर्जना गर्नुहोस्:**

```bash
# Application Insights स्रोतको ID प्राप्त गर्नुहोस्
APPI_ID=$(az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "id" -o tsv)

# असफल अनुरोधहरूको लागि मेट्रिक अलर्ट सिर्जना गर्नुहोस्
az monitor metrics alert create \
  --name "High-Error-Rate" \
  --resource-group $RG_NAME \
  --scopes $APPI_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "Alert when error rate exceeds 10 per 5 minutes"
```

2. **ढिला प्रतिक्रियाहरूका लागि अलर्ट सिर्जना गर्नुहोस्:**

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

3. **Bicep मार्फत अलर्ट सिर्जना गर्नुहोस् (AZD का लागि प्राथमिक):**

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

4. **अलर्ट परीक्षण गर्नुहोस्:**

```bash
# त्रुटिहरू उत्पन्न गर्नुहोस्
for i in {1..20}; do
  curl $APP_URL/api/error-test
done

# धीमी प्रतिक्रिया उत्पन्न गर्नुहोस्
for i in {1..10}; do
  curl $APP_URL/api/slow
done

# अलर्ट स्थिति जाँच गर्नुहोस् (5-10 मिनेट पर्खनुहोस्)
az monitor metrics alert list \
  --resource-group $RG_NAME \
  --query "[].{Name:name, Enabled:enabled, State:properties.enabled}" \
  --output table
```

**✅ सफलता मापदण्ड:**
- ✅ अलर्टहरू सफलतापूर्वक सिर्जना भए
- ✅ थ्रेशहोल्ड पार गर्दा अलर्टहरू चल्छन्
- ✅ Azure Portal मा अलर्ट इतिहास हेर्न सकिन्छ
- ✅ AZD डिप्लोइमेन्टसँग एकीकृत

**समय**: 20-25 मिनेट

---

### अभ्यास 2: कस्टम ड्यासबोर्ड बनाउनुहोस् ⭐⭐ (मध्यम)

**लक्ष्य**: प्रमुख एप्लिकेशन मेट्रिक्स देखाउने ड्यासबोर्ड बनाउनुहोस्।

**कामहरूको क्रम:**

1. **Azure Portal मार्फत ड्यासबोर्ड सिर्जना गर्नुहोस्:**

Azure Portal → Dashboards → New Dashboard मा जानुहोस्

2. **प्रमुख मेट्रिक्सका लागि टाइलहरू थप्नुहोस:**

- अनुरोध गणना (गत 24 घण्टा)
- औसत प्रतिक्रिया समय
- त्रुटि दर
- शीर्ष 5 सबैभन्दा ढिला अपरेसनहरू
- प्रयोगकर्ताहरूको भौगोलिक वितरण

3. **Bicep मार्फत ड्यासबोर्ड सिर्जना गर्नुहोस्:**

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

4. **डिप्लोय गर्नुहोस्:**

```bash
# main.bicep मा थप्नुहोस्
module dashboard './core/dashboard.bicep' = {
  name: 'dashboard'
  scope: rg
  params: {
    dashboardName: 'dashboard-${environmentName}'
    applicationInsightsId: monitoring.outputs.applicationInsightsId
    location: location
  }
}

# तैनाथ गर्नुहोस्
azd up
```

**✅ सफलता मापदण्ड:**
- ✅ ड्यासबोर्डले प्रमुख मेट्रिक्स देखाउँछ
- ✅ Azure Portal होममा पिन गर्न सकिन्छ
- ✅ वास्तविक समयमा अपडेट हुन्छ
- ✅ AZD मार्फत डिप्लोइयोग्य

**समय**: 25-30 मिनेट

---

### अभ्यास 3: AI/LLM अनुप्रयोग अनुगमन गर्नुहोस् ⭐⭐⭐ (उन्नत)

**लक्ष्य**: Microsoft Foundry Models को उपयोग (टोकन, लागत, लेटेन्सी) ट्र्याक गर्नुहोस्।

**कामहरूको क्रम:**

1. **AI मोनिटरिङ र्यापर सिर्जना गर्नुहोस्:**

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
            # Microsoft Foundry मोडेलहरू कल गर्नुहोस्
            response = self.client.chat.completions.create(
                model=model,
                messages=messages,
                **kwargs
            )
            
            duration = (time.time() - start_time) * 1000  # मिलिसेकेन्ड
            
            # प्रयोग निकाल्नुहोस्
            usage = response.usage
            prompt_tokens = usage.prompt_tokens
            completion_tokens = usage.completion_tokens
            total_tokens = usage.total_tokens
            
            # लागत गणना गर्नुहोस् (gpt-4.1 मूल्य निर्धारण)
            prompt_cost = (prompt_tokens / 1000) * 0.03  # $0.03 प्रति 1K टोकन
            completion_cost = (completion_tokens / 1000) * 0.06  # $0.06 प्रति 1K टोकन
            total_cost = prompt_cost + completion_cost
            
            # अनुकूलित घटना ट्र्याक गर्नुहोस्
            telemetry.track_event('OpenAI_Request', {
                'model': model,
                'prompt_tokens': prompt_tokens,
                'completion_tokens': completion_tokens,
                'total_tokens': total_tokens,
                'duration_ms': duration,
                'cost_usd': total_cost,
                'success': True
            })
            
            # मेट्रिकहरू ट्र्याक गर्नुहोस्
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

2. **मोनिटर गरिएको क्लाइन्ट प्रयोग गर्नुहोस्:**

```python
from flask import Flask, request, jsonify
from ai_telemetry import MonitoredAzureOpenAI
import os

app = Flask(__name__)

# निगरानी गरिएको OpenAI क्लाइन्ट आरम्भ गर्नुहोस्
openai_client = MonitoredAzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

@app.route('/api/chat', methods=['POST'])
def chat():
    data = request.json
    user_message = data.get('message')
    
    # स्वचालित निगरानी सहित कल गर्नुहोस्
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

3. **AI मेट्रिक्स क्वेरी गर्नुहोस्:**

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

**✅ सफलता मापदण्ड:**
- ✅ हरेक OpenAI कल स्वतः ट्र्याक हुन्छ
- ✅ टोकन उपयोग र लागत देख्न सकिन्छ
- ✅ लेटेन्सी मोनिटर हुन्छ
- ✅ बजेट अलर्ट सेट गर्न सकिन्छ

**समय**: 35-45 मिनेट

---

## लागत अनुकूलन

### स्याम्पलिङ रणनीतिहरू

टेलीमेट्री स्याम्पल गरेर लागत नियन्त्रण गर्नुहोस्:

```python
from opencensus.trace.samplers import ProbabilitySampler

# विकास: 100% नमूनाकरण
sampler = ProbabilitySampler(rate=1.0)

# उत्पादन: 10% नमूनाकरण (लागत 90% ले घटाउँछ)
sampler = ProbabilitySampler(rate=0.1)

# अनुकूली नमूनाकरण (स्वचालित रूपमा समायोजित हुन्छ)
from opencensus.trace.samplers import AdaptiveSampler
sampler = AdaptiveSampler()
```

**Bicep मा:**

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  properties: {
    SamplingPercentage: 10  // 10% sampling
  }
}
```

### डाटा रिटेन्सन

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

**Free tier**: 5 GB/month समावेश

---

## ज्ञान जाँच पोइन्ट

### 1. आधारभूत एकीकरण ✓

तपाईंको बुझाइ जाँच्नुहोस्:

- [ ] **Q1**: AZD ले Application Insights कसरी प्रोभिजन गर्छ?
  - **A**: `infra/core/monitoring.bicep` मा रहेका Bicep टेम्प्लेटहरू मार्फत स्वचालित रूपमा

- [ ] **Q2**: कुन वातावरण चरले Application Insights सक्षम बनाउँछ?
  - **A**: `APPLICATIONINSIGHTS_CONNECTION_STRING`

- [ ] **Q3**: तीन मुख्य टेलीमेट्री प्रकारहरू कुन-कुन हुन्?
  - **A**: Requests (HTTP कलहरू), Dependencies (बाह्य कलहरू), Exceptions (त्रुटिहरू)

**Hands-On Verification:**
```bash
# Application Insights कन्फिगर गरिएको छ कि छैन जाँच गर्नुहोस्
azd env get-values | grep APPLICATIONINSIGHTS

# टेलीमेट्री प्रवाह भइरहेको छ भनी पुष्टि गर्नुहोस्
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "requests/count"
```

---

### 2. कस्टम टेलीमेट्री ✓

तपाईंको बुझाइ जाँच्नुहोस्:

- [ ] **Q1**: कस्टम व्यवसायिक घटनाहरू कसरी ट्र्याक गर्ने?
  - **A**: `custom_dimensions` सँग logger प्रयोग गरेर वा `TelemetryClient.track_event()` प्रयोग गरेर

- [ ] **Q2**: घटनाहरू र मेट्रिक्सबीच के फरक छ?
  - **A**: घटनाहरू छुट्टै उत्पत्तिहरू हुन्, मेट्रिक्स संख्यात्मक मापनहरू हुन्

- [ ] **Q3**: सेवाहरू बीच टेलीमेट्री कसरी सम्बन्धित गर्ने?
  - **A**: Application Insights ले स्वतः `operation_Id` प्रयोग गरेर सम्बन्धित गर्दछ

**Hands-On Verification:**
```kusto
// Verify custom events
traces
| where customDimensions.event_name != ""
| summarize count() by tostring(customDimensions.event_name)
```

---

### 3. प्रोडक्सन मोनिटरिङ ✓

तपाईंको बुझाइ जाँच्नुहोस्:

- [ ] **Q1**: स्याम्पलिङ भनेको के हो र किन प्रयोग गर्ने?
  - **A**: स्याम्पलिङले टेलीमेट्री मात्र एउटा प्रतिशत कैद गरेर डाटा भोल्युम (र लागत) घटाउँछ

- [ ] **Q2**: अलर्ट कसरी सेटअप गर्ने?
  - **A**: Application Insights मेट्रिक्समा आधारमा Bicep वा Azure Portal मा मेट्रिक अलर्ट प्रयोग गरेर

- [ ] **Q3**: Log Analytics र Application Insights बीच के फरक छ?
  - **A**: Application Insights ले डाटा Log Analytics workspace मा संग्रह गर्दछ; App Insights एप्लिकेशन-विशेष भ्युहरू प्रदान गर्छ

**Hands-On Verification:**
```bash
# सैम्पलिङ विन्यास जाँच गर्नुहोस्
az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "properties.SamplingPercentage"
```

---

## राम्रो अभ्यासहरू

### ✅ गर्नुहोस्:

1. **Correlation IDs प्रयोग गर्नुहोस्**
   ```python
   logger.info('Processing order', extra={
       'custom_dimensions': {
           'order_id': order_id,
           'user_id': user_id
       }
   })
   ```

2. **महत्वपूर्ण मेट्रिक्सका लागि अलर्ट सेटअप गर्नुहोस्**
   ```bicep
   // Error rate, slow responses, availability
   ```

3. **स्ट्रक्टर्ड लगिङ प्रयोग गर्नुहोस्**
   ```python
   # ✅ राम्रो: संरचित
   logger.info('User signup', extra={'custom_dimensions': {'user_id': 123}})
   
   # ❌ खराब: असंरचित
   logger.info(f'User 123 signed up')
   ```

4. **डिपेन्डेन्सीहरू मोनिटर गर्नुहोस्**
   ```python
   # डेटाबेस कलहरू, HTTP अनुरोधहरू आदिलाई स्वचालित रूपमा ट्र्याक गर्नुहोस्।
   ```

5. **डिप्लोइमेन्टहरू गर्दा Live Metrics प्रयोग गर्नुहोस्**

### ❌ नगर्नुहोस्:

1. **संवेदनशील डाटा लग नगर्नुहोस्**
   ```python
   # ❌ नराम्रो
   logger.info(f'Login: {username}:{password}')
   
   # ✅ राम्रो
   logger.info('Login attempt', extra={'custom_dimensions': {'username': username}})
   ```

2. **प्रोडक्सनमा 100% स्याम्पलिङ प्रयोग नगर्नुहोस्**
   ```python
   # ❌ महँगो
   sampler = ProbabilitySampler(rate=1.0)
   
   # ✅ लागत-प्रभावी
   sampler = ProbabilitySampler(rate=0.1)
   ```

3. **Dead letter queues लाई बेवास्ता नगर्नुहोस्**

4. **डाटा रिटेन्सन सीमा सेट गर्न नरहने भूल नगर्नुहोस्**

---

## समस्या निवारण

### समस्या: टेलिमेट्री देखिँदैन

**निदान:**
```bash
# कनेक्शन स्ट्रिङ सेट गरिएको छ कि छैन जाँच गर्नुहोस्
azd env get-values | grep APPLICATIONINSIGHTS

# Azure Monitor मार्फत अनुप्रयोगका लगहरू जाँच गर्नुहोस्
azd monitor --logs

# वा Container Apps का लागि Azure CLI प्रयोग गर्नुहोस्:
az containerapp logs show --name $APP_NAME --resource-group $RG_NAME --tail 50
```

**समाधान:**
```bash
# Container App मा कनेक्शन स्ट्रिङ जाँच गर्नुहोस्
az containerapp show \
  --name $APP_NAME \
  --resource-group $RG_NAME \
  --query "properties.template.containers[0].env" \
  | grep -i applicationinsights
```

---

### समस्या: उच्च लागत

**निदान:**
```bash
# डेटा इन्जेस्टन जाँच गर्नुहोस्
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "availabilityResults/count"
```

**समाधान:**
- स्याम्पलिङ दर घटाउनुहोस्
- रिटेन्सन अवधि घटाउनुहोस्
- विस्तृत लगिङ हटाउनुहोस्

---

## थप जान्नुहोस्

### आधिकारिक दस्तावेज
- [Application Insights Overview](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Application Insights for Python](https://learn.microsoft.com/azure/azure-monitor/app/opencensus-python)
- [Kusto Query Language](https://learn.microsoft.com/azure/data-explorer/kusto/query/)
- [AZD Monitoring](https://learn.microsoft.com/azure/developer/azure-developer-cli/monitor-your-app)

### यस कोर्सका अर्को कदमहरू
- ← Previous: [प्रिफ्लाइट जाँचहरू](preflight-checks.md)
- → Next: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- 🏠 [Course Home](../../README.md)

### सम्बन्धित उदाहरणहरू
- [Microsoft Foundry Models Example](../../../../examples/azure-openai-chat) - AI टेलीमेट्री
- [Microservices Example](../../../../examples/microservices) - डिस्ट्रीब्युटेड ट्रेसिङ

---

## सारांश

**तपाईंले सिक्नुभयो:**
- ✅ AZD सँग स्वचालित Application Insights प्रोभिजनिङ
- ✅ कस्टम टेलीमेट्री (घटनाहरू, मेट्रिक्स, डिपेन्डेन्सीहरू)
- ✅ माइक्रोसर्भिसहरूमा डिस्ट्रीब्युटेड ट्रेसिङ
- ✅ Live Metrics र वास्तविक-समय मोनिटरिङ
- ✅ अलर्ट र ड्यासबोर्डहरू
- ✅ AI/LLM अनुप्रयोग मोनिटरिङ
- ✅ लागत अनुकूलन रणनीतिहरू

**मुख्य निष्कर्षहरू:**
1. **AZD स्वचालित रूपमा अनुगमनको व्यवस्था गर्छ** - म्यानुअल सेटअप आवश्यक छैन
2. **संरचित लगिङ प्रयोग गर्नुहोस्** - क्वेरी गर्न सजिलो हुन्छ
3. **व्यवसायिक घटनाहरू ट्र्याक गर्नुहोस्** - केवल प्राविधिक मेट्रिक्स मात्र होइन
4. **AI लागत अनुगमन गर्नुहोस्** - टोकन र खर्च ट्र्याक गर्नुहोस्
5. **अलर्ट सेटअप गर्नुहोस्** - सक्रिय हुनुहोस्, प्रतिक्रियात्मक होइन
6. **लागत अनुकूल गर्नुहोस्** - नमूनाकरण र धारण सीमाहरू प्रयोग गर्नुहोस्

**अर्को कदमहरू:**
1. व्यावहारिक अभ्यासहरू पूरा गर्नुहोस्
2. आफ्ना AZD परियोजनाहरूमा Application Insights थप्नुहोस्
3. आफ्नो टिमका लागि अनुकूलित ड्यासबोर्डहरू सिर्जना गर्नुहोस्
4. सिक्नुहोस् [परिनियोजन मार्गदर्शिका](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो कागजात AI अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) प्रयोग गरी अनुवाद गरिएको हो। हामी शुद्धताका लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादहरूमा त्रुटि वा अशुद्धता हुन सक्छ। मूल कागजातलाई यसको मूल भाषामै निर्णयात्मक स्रोत मानिनु पर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलतफहमी वा गलत व्याख्याका लागि हामी जिम्मेवार हुने छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->