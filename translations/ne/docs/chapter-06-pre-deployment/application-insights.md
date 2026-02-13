# AZD सँग Application Insights एकीकरण

⏱️ **अनुमानित समय**: 40-50 मिनेट | 💰 **लागत प्रभाव**: ~$5-15/महिना | ⭐ **जटिलता**: मध्यम

**📚 सिकाइ मार्ग:**
- ← Previous: [प्रीफ्लाइट जाँचहरू](preflight-checks.md) - पूर्व-डिप्लोयमेन्ट मान्यकरण
- 🎯 **You Are Here**: Application Insights एकीकरण (निगरानी, टेलिमेट्री, डिबगिङ)
- → Next: [डिप्लोयमेन्ट मार्गदर्शक](../chapter-04-infrastructure/deployment-guide.md) - Deploy to Azure
- 🏠 [कोर्स गृहपृष्ठ](../../README.md)

---

## तपाईं के सिक्नुहुनेछ

By completing this lesson, you will:
- AZD प्रोजेक्टहरूमा **Application Insights** स्वचालित रूपमा एकीकृत गर्नुहोस्
- माइक्रोसर्भिसहरूका लागि **वितरित ट्रेसिङ** कन्फिगर गर्नुहोस्
- अनुकूलित टेलिमेट्री लागू गर्नुहोस् (मेट्रिक्स, इभेन्टहरू, निर्भरताहरू)
- रियल-टाइम निगरानीका लागि **लाइभ मेट्रिक्स** सेट अप गर्नुहोस्
- AZD परिनियोजनहरूबाट **अलर्ट र ड्यासबोर्डहरू** सिर्जना गर्नुहोस्
- **टेलिमेट्री क्वेरीहरू** को सहायताले उत्पादन समस्याहरू डिबग गर्नुहोस्
- लागत र स्याम्पलिङ रणनीतिहरू **अनुकूलित** गर्नुहोस्
- **AI/LLM अनुप्रयोगहरू** अनुगमन गर्नुहोस् (टोकन्स, विलम्बता, लागत)

## AZD सँग Application Insights किन महत्त्वपूर्ण छ

### चुनौती: उत्पादन अवलोकन

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

**उपमा**: Application Insights तपाईंको अनुप्रयोगको लागि "ब्ल्याक बक्स" फ्लाइट रेकर्डर + ककपिट ड्यासबोर्ड जस्तो हो। तपाईं वास्तविक-समयमा सबै भइरहेको कुरा देख्नुहुन्छ र कुनै पनि घटनालाई पुन:प्रदर्शित गर्न सक्नुहुन्छ।

---

## वास्तुकला अवलोकन

### AZD वास्तुकलामा Application Insights

```mermaid
graph TB
    User[प्रयोगकर्ता/क्लाइन्ट]
    App1[कन्टेनर अनुप्रयोग 1<br/>एपीआई गेटवे]
    App2[कन्टेनर अनुप्रयोग 2<br/>उत्पादन सेवा]
    App3[कन्टेनर अनुप्रयोग 3<br/>अर्डर सेवा]
    
    AppInsights[एप्लिकेशन इनसाइट्स<br/>टेलेमेट्री हब]
    LogAnalytics[(लॉग एनालिटिक्स<br/>वर्कस्पेस)]
    
    Portal[Azure पोर्टल<br/>ड्यासबोर्ड र अलर्टहरू]
    Query[Kusto क्वेरीहरू<br/>अनुकूलित विश्लेषण]
    
    User --> App1
    App1 --> App2
    App2 --> App3
    
    App1 -.->|स्वचालित इन्स्ट्रुमेन्टेशन| AppInsights
    App2 -.->|स्वचालित इन्स्ट्रुमेन्टेशन| AppInsights
    App3 -.->|स्वचालित इन्स्ट्रुमेन्टेशन| AppInsights
    
    AppInsights --> LogAnalytics
    LogAnalytics --> Portal
    LogAnalytics --> Query
    
    style AppInsights fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
    style LogAnalytics fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
```
### स्वचालित रूपमा कुन कुराहरू अनुगमन गरिन्छ

| टेलिमेट्री प्रकार | यसले के समात्छ | प्रयोग केस |
|----------------|------------------|----------|
| **अनुरोधहरू** | HTTP अनुरोधहरू, स्टाटस कोडहरू, अवधि | API प्रदर्शन निगरानी |
| **निर्भरताहरू** | बाह्य कलहरू (DB, APIs, storage) | बोतलनेक्सहरू पहिचान गर्नुहोस् |
| **अपवादहरू** | स्ट्याक ट्रेससहितको अनह्याण्डल गरिएका त्रुटिहरू | असफलताहरू डिबग गर्नुहोस् |
| **अनुकूलित घटनाहरू** | व्यापारिक घटनाहरू (signup, purchase) | विश्लेषण र फनेलहरू |
| **मेट्रिक्स** | प्रदर्शन काउन्टरहरू, अनुकूलित मेट्रिक्स | क्षमता योजना |
| **ट्रेसहरू** | गंभीरता सहित लग सन्देशहरू | डिबगिङ र अडिटिङ |
| **उपलब्धता** | अपटाइम र प्रतिक्रिया समय परीक्षणहरू | SLA निगरानी |

---

## पूर्वशर्तहरू

### आवश्यक उपकरणहरू

```bash
# Azure Developer CLI पुष्टि गर्नुहोस्
azd version
# ✅ अपेक्षित: azd संस्करण 1.0.0 वा माथिको

# Azure CLI पुष्टि गर्नुहोस्
az --version
# ✅ अपेक्षित: azure-cli संस्करण 2.50.0 वा माथिको
```

### Azure आवश्यकताहरू

- सक्रिय Azure सदस्यता
- सिर्जना गर्ने अनुमतिहरू:
  - Application Insights स्रोतहरू
  - Log Analytics वर्कस्पेसहरू
  - Container Apps
  - स्रोत समूहहरू

### आवश्यक ज्ञान

तपाईंले पूरा गरेका हुनुपर्छ:
- [AZD आधारहरू](../chapter-01-foundation/azd-basics.md) - Core AZD concepts
- [कन्फिगरेसन](../chapter-03-configuration/configuration.md) - Environment setup
- [पहिलो परियोजना](../chapter-01-foundation/first-project.md) - Basic deployment

---

## पाठ १: AZD सँग स्वचालित Application Insights

### AZD कसरी Application Insights प्रोभिजन गर्छ

तपाईंले डिप्लोय गर्नुहुँदा AZD स्वचालित रूपमा Application Insights सिर्जना र कन्फिगर गर्छ। आउँ, यो कसरी काम गर्छ हेरौं।

### परियोजना संरचना

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

### चरण १: AZD कन्फिगर गर्नुहोस् (azure.yaml)

**फाइल: `azure.yaml`**

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

**यत्तिकै हो!** AZD ले पूर्वनिर्धारित रूपमा Application Insights सिर्जना गर्नेछ। आधारभूत निगरानीका लागि थप कन्फिगरेसन आवश्यक छैन।

---

### चरण २: निगरानी पूर्वाधार (Bicep)

**फाइल: `infra/core/monitoring.bicep`**

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

### चरण ३: Container App लाई Application Insights सँग जडान गर्नुहोस्

**फाइल: `infra/app/api.bicep`**

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

### चरण ४: टेलिमेट्री सहित एप्लिकेशन कोड

**फाइल: `src/app.py`**

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
        sampler=ProbabilitySampler(rate=1.0)  # विकासका लागि 100% स्याम्पलिङ
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
    
    # डेटाबेस कल नक्कल गर्नुहोस् (स्वचालित रूपमा निर्भरता रूपमा ट्र्याक गरिन्छ)
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
    time.sleep(3)  # ढिलो अपरेशन नक्कल गर्नुहोस्
    logger.warning('Endpoint took 3 seconds to respond')
    return jsonify({'message': 'Slow operation completed'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
```

**फाइल: `src/requirements.txt`**

```txt
Flask==3.0.0
opencensus-ext-azure==1.1.13
opencensus-ext-flask==0.8.1
gunicorn==21.2.0
```

---

### चरण ५: परिनियोजन र प्रमाणित गर्नुहोस्

```bash
# AZD प्रारम्भ गर्नुहोस्
azd init

# तैनाथ गर्नुहोस् (Application Insights स्वतः प्रावधान गर्दछ)
azd up

# एपको URL प्राप्त गर्नुहोस्
APP_URL=$(azd env get-values | grep API_URL | cut -d '=' -f2 | tr -d '"')

# टेलिमेट्री उत्पन्न गर्नुहोस्
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

### चरण ६: Azure पोर्टलमा टेलिमेट्री हेर्नुहोस्

```bash
# Application Insights को विवरणहरू प्राप्त गर्नुहोस्
azd env get-values | grep APPLICATIONINSIGHTS

# Azure पोर्टलमा खोल्नुहोस्
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"') \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"') \
  --query "appId" -o tsv
```

**Azure पोर्टल → Application Insights → Transaction Search** मा नेभिगेट गर्नुहोस्

तपाईंले देख्नु पर्नेछ:
- ✅ HTTP अनुरोधहरू र स्टाटस कोडहरू
- ✅ अनुरोध अवधि ( `/api/slow` का लागि 3+ सेकेन्ड)
- ✅ `/api/error-test` बाट अपवाद विवरण
- ✅ अनुकूलित लग सन्देशहरू

---

## पाठ २: अनुकूलित टेलिमेट्री र घटनाहरू

### व्यापारिक घटनाहरू ट्र्याक गर्नुहोस्

व्यापार-सम्बन्धी महत्त्वपूर्ण घटनाहरूका लागि अनुकूलित टेलिमेट्री थपौं।

**फाइल: `src/telemetry.py`**

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
        
        # मेट्रिक्स निर्यातकर्ता सेटअप गर्नुहोस्
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

# वैश्विक टेलिमेट्री क्लाइंट
telemetry = TelemetryClient()
```

### एप्लिकेशनलाई अनुकूलित घटनाहरूले अपडेट गर्नुहोस्

**फाइल: `src/app.py` (सुधार गरिएको)**

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
    
    # व्यवसाय घटना ट्र्याक गर्नुहोस्
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
    
    # खोज अनुकरण गर्नुहोस् (वास्तविक डेटाबेस क्वेरी हुन्थ्यो)
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

### अनुकूलित टेलिमेट्री परीक्षण गर्नुहोस्

```bash
# खरिद घटना ट्र्याक गर्नुहोस्
curl -X POST $APP_URL/api/purchase \
  -H "Content-Type: application/json" \
  -H "X-User-Id: user123" \
  -d '{"product_id": 1, "quantity": 2, "price": 29.99}'

# खोज घटना ट्र्याक गर्नुहोस्
curl "$APP_URL/api/search?q=laptop"

# बाह्य निर्भरता ट्र्याक गर्नुहोस्
curl $APP_URL/api/external-call
```

**Azure पोर्टलमा हेर्नुहोस्:**

Application Insights → Logs मा जानुहोस्, त्यसपछि चलाउनुहोस्:

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

## पाठ ३: माइक्रोसर्भिसहरूको लागि वितरित ट्रेसिङ

### क्रस-सर्भिस ट्रेसिङ सक्षम गर्नुहोस्

माइक्रोसर्भिसहरूको लागि, Application Insights ले स्वचालित रूपमा सर्भिसहरू बीचका अनुरोधहरूलाई सम्बन्धित बनाउँछ।

**फाइल: `infra/main.bicep`**

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

### अन्त्य-देखि-अन्त्य ट्रान्ज्याक्सन हेर्नुहोस्

```mermaid
sequenceDiagram
    participant User
    participant Gateway as API Gateway<br/>(ट्रेस ID: abc123)
    participant Product as उत्पादन सेवा<br/>(अभिभावक ID: abc123)
    participant Order as Order सेवा<br/>(अभिभावक ID: abc123)
    participant AppInsights as अनुप्रयोग अन्तर्दृष्टि
    
    User->>Gateway: POST /api/checkout
    Note over Gateway: ट्रेस सुरु: abc123
    Gateway->>AppInsights: अनुरोध लग गर्नुहोस् (ट्रेस ID: abc123)
    
    Gateway->>Product: GET /products/123
    Note over Product: अभिभावक ID: abc123
    Product->>AppInsights: निर्भरता कल लगाउनुहोस्
    Product-->>Gateway: उत्पादन विवरण
    
    Gateway->>Order: POST /orders
    Note over Order: अभिभावक ID: abc123
    Order->>AppInsights: निर्भरता कल लगाउनुहोस्
    Order-->>Gateway: अर्डर सिर्जना भयो
    
    Gateway-->>User: चेकआउट पूरा भयो
    Gateway->>AppInsights: प्रतिक्रिया लग गर्नुहोस् (अवधि: 450ms)
    
    Note over AppInsights: ट्रेस ID द्वारा सहसम्बन्ध
```
**अन्त्य-देखि-अन्त्य ट्रेस क्वेरी गर्नुहोस्:**

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

## पाठ ४: लाइभ मेट्रिक्स र वास्तविक-समय निगरानी

### लाइभ मेट्रिक्स स्ट्रिम सक्षम गर्नुहोस्

लाइभ मेट्रिक्सले <1 सेकेन्ड विलम्बता सहित वास्तविक-समय टेलिमेट्री प्रदान गर्छ।

### लाइभ मेट्रिक्स पहुँच:

```bash
# Application Insights स्रोत प्राप्त गर्नुहोस्
APPI_NAME=$(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"')

# स्रोत समूह प्राप्त गर्नुहोस्
RG_NAME=$(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"')

echo "Navigate to: Azure Portal → Resource Groups → $RG_NAME → $APPI_NAME → Live Metrics"
```

**तपाईंले वास्तविक-समयमा जे देख्नुहुन्छ:**
- ✅ आउने अनुरोध दर (अनुरोध/सेक)
- ✅ बाहिर जाने निर्भरता कलहरू
- ✅ अपवाद गणना
- ✅ CPU र मेमोरी प्रयोग
- ✅ सक्रिय सर्भर संख्या
- ✅ नमूना टेलिमेट्री

### परीक्षणका लागि लोड उत्पन्न गर्नुहोस्

```bash
# प्रत्यक्ष मेट्रिक्स हेर्न लोड उत्पन्न गर्नुहोस्
for i in {1..100}; do
  curl $APP_URL/api/products &
  curl $APP_URL/api/search?q=test$i &
done

# Azure Portal मा प्रत्यक्ष मेट्रिक्स हेर्नुहोस्
# तपाईंले अनुरोध दरमा तीव्र वृद्धि देख्नुपर्छ
```

---

## व्यावहारिक अभ्यासहरू

### अभ्यास १: अलर्ट सेटअप गर्नुहोस् ⭐⭐ (मध्यम)

**लक्ष्य**: उच्च त्रुटि दर र ढिला प्रतिक्रियाहरूका लागि अलर्टहरू सिर्जना गर्नु।

**चरणहरू:**

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

3. **Bicep मार्फत अलर्ट सिर्जना गर्नुहोस् (AZD का लागि रुचिकर):**

**फाइल: `infra/core/alerts.bicep`**

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

# धीमी प्रतिक्रियाहरू उत्पन्न गर्नुहोस्
for i in {1..10}; do
  curl $APP_URL/api/slow
done

# अलर्ट स्थिति जाँच्नुहोस् (5-10 मिनेट पर्खनुहोस्)
az monitor metrics alert list \
  --resource-group $RG_NAME \
  --query "[].{Name:name, Enabled:enabled, State:properties.enabled}" \
  --output table
```

**✅ सफलता मापदण्ड:**
- ✅ अलर्टहरू सफलतापूर्वक सिर्जना गरियो
- ✅ सीमाहरू उल्लंघन हुँदा अलर्टहरू ट्रिगर हुन्छन्
- ✅ Azure पोर्टलमा अलर्ट इतिहास हेर्न सकिन्छ
- ✅ AZD परिनियोजनसँग एकीकृत

**समय**: 20-25 मिनेट

---

### अभ्यास २: अनुकूलित ड्यासबोर्ड सिर्जना गर्नुहोस् ⭐⭐ (मध्यम)

**लक्ष्य**: प्रमुख अनुप्रयोग मेट्रिक्स देखाउने ड्यासबोर्ड बनाउनु।

**चरणहरू:**

1. **Azure पोर्टल मार्फत ड्यासबोर्ड सिर्जना गर्नुहोस्:**

नेभिगेट गर्नुहोस्: Azure पोर्टल → Dashboards → New Dashboard

2. **प्रमुख मेट्रिक्सका लागि टाइलहरू थप्नुहोस्:**

- अनुरोध संख्या (अघिल्लो 24 घन्टा)
- औसत प्रतिक्रिया समय
- त्रुटि दर
- शीर्ष 5 सबैभन्दा ढिलो अपरेसनहरू
- प्रयोगकर्ताहरूको भौगोलिक वितरण

3. **Bicep मार्फत ड्यासबोर्ड सिर्जना गर्नुहोस्:**

**फाइल: `infra/core/dashboard.bicep`**

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

4. **ड्यासबोर्ड परिनियोजन गर्नुहोस्:**

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
- ✅ ड्यासबोर्ड प्रमुख मेट्रिक्स प्रदर्शन गर्दछ
- ✅ Azure पोर्टल गृहपृष्ठमा पिन गर्न सकिन्छ
- ✅ वास्तविक-समयमा अपडेट हुन्छ
- ✅ AZD मार्फत परिनियोजनयोग्य छ

**समय**: 25-30 मिनेट

---

### अभ्यास ३: AI/LLM एप्लिकेशन अनुगमन गर्नुहोस् ⭐⭐⭐ (उन्नत)

**लक्ष्य**: Azure OpenAI प्रयोग ट्र्याक गर्नु (टोकन्स, लागत, विलम्बता)।

**चरणहरू:**

1. **AI अनुगमन रैपर सिर्जना गर्नुहोस्:**

**फाइल: `src/ai_telemetry.py`**

```python
from telemetry import telemetry
from openai import AzureOpenAI
import time

class MonitoredAzureOpenAI:
    """Azure OpenAI client with automatic telemetry"""
    
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
            # Azure OpenAI लाई कल गर्नुहोस्
            response = self.client.chat.completions.create(
                model=model,
                messages=messages,
                **kwargs
            )
            
            duration = (time.time() - start_time) * 1000  # मिलिसेकेन्ड
            
            # उपयोग निकाल्नुहोस्
            usage = response.usage
            prompt_tokens = usage.prompt_tokens
            completion_tokens = usage.completion_tokens
            total_tokens = usage.total_tokens
            
            # लागत गणना गर्नुहोस् (GPT-4 मूल्य निर्धारण)
            prompt_cost = (prompt_tokens / 1000) * 0.03  # $0.03 प्रति 1K टोकन
            completion_cost = (completion_tokens / 1000) * 0.06  # $0.06 प्रति 1K टोकन
            total_cost = prompt_cost + completion_cost
            
            # कस्टम घटना ट्र्याक गर्नुहोस्
            telemetry.track_event('OpenAI_Request', {
                'model': model,
                'prompt_tokens': prompt_tokens,
                'completion_tokens': completion_tokens,
                'total_tokens': total_tokens,
                'duration_ms': duration,
                'cost_usd': total_cost,
                'success': True
            })
            
            # मेट्रिक्स ट्र्याक गर्नुहोस्
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

2. **अनुगमन गरिएको क्लाइन्ट प्रयोग गर्नुहोस्:**

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
        model='gpt-4',
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
- ✅ प्रत्येक OpenAI कल स्वतः ट्र्याक हुन्छ
- ✅ टोकन प्रयोग र लागत दृश्य हुन्छ
- ✅ विलम्बता अनुगमन हुन्छ
- ✅ बजेट अलर्टहरू सेट गर्न सकिन्छ

**समय**: 35-45 मिनेट

---

## लागत अनुकूलन

### स्याम्पलिङ रणनीतिहरू

Control costs by sampling telemetry:

```python
from opencensus.trace.samplers import ProbabilitySampler

# विकास: १००% नमूना लिने
sampler = ProbabilitySampler(rate=1.0)

# उत्पादन: १०% नमूना लिने (लागत ९०% ले घट्छ)
sampler = ProbabilitySampler(rate=0.1)

# अनुकूली नमूना लिने (स्वचालित रूपमा समायोजन गर्छ)
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

### डेटा प्रतिधारण

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

| डेटा मात्रा | प्रतिधारण | मासिक लागत |
|-------------|-----------|--------------|
| 1 GB/महिना | 30 दिन | ~$2-5 |
| 5 GB/महिना | 30 दिन | ~$10-15 |
| 10 GB/महिना | 90 दिन | ~$25-40 |
| 50 GB/महिना | 90 दिन | ~$100-150 |

**निशुल्क टियर**: 5 GB/महिना समावेश

---

## ज्ञान जाँच बिंदु

### 1. आधारभूत एकीकरण ✓

आफ्नो समझ परिक्षण गर्नुहोस्:

- [ ] **Q1**: AZD ले Application Insights कसरी प्रोभिजन गर्छ?
  - **A**: स्वतः `infra/core/monitoring.bicep` मा रहेको Bicep टेम्प्लेटहरू मार्फत

- [ ] **Q2**: कुन environment variable ले Application Insights सक्षम गर्छ?
  - **A**: `APPLICATIONINSIGHTS_CONNECTION_STRING`

- [ ] **Q3**: मुख्य तीन टेलिमेट्री प्रकारहरू कुन हुन्?
  - **A**: अनुरोधहरू (HTTP कलहरू), निर्भरताहरू (बाह्य कलहरू), अपवादहरू (त्रुटिहरू)

**व्यावहारिक जाँच:**
```bash
# Application Insights कन्फिगर गरिएको छ कि छैन जाँच गर्नुहोस्
azd env get-values | grep APPLICATIONINSIGHTS

# टेलिमेट्री प्रवाह भइरहेको छ कि छैन पुष्टि गर्नुहोस्
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "requests/count"
```

---

### 2. अनुकूलित टेलिमेट्री ✓

आफ्नो समझ परिक्षण गर्नुहोस्:

- [ ] **Q1**: अनुकूलित व्यापार घटनाहरू कसरी ट्र्याक गर्नुहुन्छ?
  - **A**: `custom_dimensions` सहितको लगर प्रयोग गर्नुहोस् वा `TelemetryClient.track_event()`

- [ ] **Q2**: घटनाहरू र मेट्रिक्सबीच के फरक छ?
  - **A**: घटनाहरू छुट्टै घटना हुन्, मेट्रिक्स अंकिय मापनहरू हुन्

- [ ] **Q3**: सेवाहरू बीच टेलिमेट्री कसरी सम्बन्धित गर्नुहुन्छ?
  - **A**: Application Insights ले स्वतः सम्बन्धका लागि `operation_Id` प्रयोग गर्छ

**व्यावहारिक जाँच:**
```kusto
// Verify custom events
traces
| where customDimensions.event_name != ""
| summarize count() by tostring(customDimensions.event_name)
```

---

### 3. उत्पादन अनुगमन ✓

आफ्नो समझ परिक्षण गर्नुहोस्:

- [ ] **Q1**: स्याम्पलिङ भनेको के हो र किन प्रयोग गर्ने?
  - **A**: स्याम्पलिङले डाटा मात्रा (र लागत) घटाउँछ जसले केवल टेलिमेट्रीको प्रतिशत मात्र क्याप्चर गर्छ

- [ ] **Q2**: अलर्टहरू कसरी सेट अप गर्ने?
  - **A**: Application Insights मेट्रिक्समा आधारित मेट्रिक अलर्टहरू Bicep वा Azure पोर्टलमा प्रयोग गर्नुहोस्

- [ ] **Q3**: Log Analytics र Application Insightsबीच के फरक छ?
  - **A**: Application Insights ले डाटा Log Analytics वर्कस्पेसमा स्टोर गर्छ; App Insights अनुप्रयोग-विशिष्ट दृश्यहरू प्रदान गर्छ

**व्यावहारिक जाँच:**
```bash
# नमूना कन्फिगरेसन जाँच्नुहोस्
az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "properties.SamplingPercentage"
```

---

## उत्तम अभ्यासहरू

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

3. **संरचित लगिङ प्रयोग गर्नुहोस्**
   ```python
   # ✅ राम्रो: संरचित
   logger.info('User signup', extra={'custom_dimensions': {'user_id': 123}})
   
   # ❌ खराब: असंरचित
   logger.info(f'User 123 signed up')
   ```

4. **निर्भरता अनुगमन गर्नुहोस्**
   ```python
   # डेटाबेस कलहरू, HTTP अनुरोधहरू आदि स्वचालित रूपमा अनुगमन गर्नुहोस्.
   ```

5. **परिनियोजनहरूको समयमा लाइभ मेट्रिक्स प्रयोग गर्नुहोस्**

### ❌ नगर्नुहोस्:

1. **संवेेदनशील डेटा लग नगर्नुहोस्**
   ```python
   # ❌ खराब
   logger.info(f'Login: {username}:{password}')
   
   # ✅ राम्रो
   logger.info('Login attempt', extra={'custom_dimensions': {'username': username}})
   ```

2. **उत्पादनमा 100% स्याम्पलिङ प्रयोग नगर्नुहोस्**
   ```python
   # ❌ महँगो
   sampler = ProbabilitySampler(rate=1.0)
   
   # ✅ लागत-प्रभावी
   sampler = ProbabilitySampler(rate=0.1)
   ```

3. **डेड लेटर क्यूहरूलाई बेवास्ता नगर्नुहोस्**

4. **डेटा प्रतिधारण सीमा सेट गर्न नबिर्सनुहोस्**

---

## समस्या समाधान

### समस्या: कुनै टेलिमेट्री देखिँदैन

**निदान:**
```bash
# कनेक्शन स्ट्रिङ सेट गरिएको छ कि छैन जाँच गर्नुहोस्
azd env get-values | grep APPLICATIONINSIGHTS

# Azure Monitor मार्फत एप्लिकेशन लगहरू जाँच गर्नुहोस्
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
# डेटा इनजेस्टन जाँच गर्नुहोस्
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "availabilityResults/count"
```

**समाधान:**
- स्याम्पलिङ दर घटाउनुहोस्
- प्रतिधारण अवधि कम गर्नुहोस्
- विस्तृत लगिङ हटाउनुहोस्

---

## थप जान्नुहोस्

### आधिकारिक दस्तावेज
- [Application Insights अवलोकन](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Python का लागि Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/opencensus-python)
- [Kusto Query Language](https://learn.microsoft.com/azure/data-explorer/kusto/query/)
- [AZD निगरानी](https://learn.microsoft.com/azure/developer/azure-developer-cli/monitor-your-app)

### यस पाठ्यक्रममा अर्को कदमहरू
- ← Previous: [प्रीफ्लाइट जाँचहरू](preflight-checks.md)
- → Next: [डिप्लोयमेन्ट मार्गदर्शक](../chapter-04-infrastructure/deployment-guide.md)
- 🏠 [कोर्स गृहपृष्ठ](../../README.md)

### सम्बन्धित उदाहरणहरू
- [Azure OpenAI उदाहरण](../../../../examples/azure-openai-chat) - AI टेलिमेट्री
- [Microservices उदाहरण](../../../../examples/microservices) - वितरित ट्रेसिङ

---

## सारांश

**तपाईंले सिक्नुभयो:**
- ✅ AZD सँग स्वचालित Application Insights प्रोभिजनिङ
- ✅ अनुकूलित टेलिमेट्री (इभेन्टहरू, मेट्रिक्स, निर्भरताहरू)
- ✅ माइक्रोसर्भिसहरूमा वितरित ट्रेसिङ
- ✅ प्रत्यक्ष मेट्रिक्स र वास्तविक-समय अनुगमन
- ✅ अलर्टहरू र ड्यासबोर्डहरू
- ✅ AI/LLM अनुप्रयोग अनुगमन
- ✅ लागत अनुकूलन रणनीतिहरू

**मुख्य निष्कर्षहरू:**
1. **AZD ले अनुगमन स्वचालित रूपमा प्रदान गर्दछ** - कुनै म्यानुअल सेटअप आवश्यक छैन
2. **संरचित लगिङ प्रयोग गर्नुहोस्** - क्वेरी गर्न सजिलो बनाउँछ
3. **व्यवसायिक घटनाहरू ट्रयाक गर्नुहोस्** - केवल प्राविधिक मेट्रिक्स मात्र होइन
4. **AI लागत अनुगमन गर्नुहोस्** - टोकनहरू र खर्च ट्रयाक गर्नुहोस्
5. **अलर्टहरू सेट अप गर्नुहोस्** - प्रतिक्रियात्मक होइन, सक्रिय हुनुहोस्
6. **लागत अनुकूलन गर्नुहोस्** - नमुना र रिटेन्शन सीमाहरू प्रयोग गर्नुहोस्

**अर्को कदमहरू:**
1. व्यावहारिक अभ्यासहरू पूरा गर्नुहोस्
2. तपाईंको AZD परियोजनाहरूमा Application Insights थप्नुहोस्
3. तपाईंको टिमको लागि अनुकूलित ड्यासबोर्डहरू सिर्जना गर्नुहोस्
4. सिक्नुहोस् [परिनियोजन मार्गदर्शक](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरी अनुवाद गरिएको हो। हामी शुद्धता सुनिश्चित गर्न प्रयासरत छौँ, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुनसक्छ। मूल दस्तावेजलाई त्यसको मूल भाषामा अधिकारिक स्रोत मानिनु पर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न भएका कुनै पनि गलतफहमी वा गलत व्याख्याका लागि हामी उत्तरदायी छैनौँ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->