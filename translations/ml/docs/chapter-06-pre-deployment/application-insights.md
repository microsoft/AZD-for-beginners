# AZD-യോടുള്ള Application Insights ഇന്റഗ്രേഷൻ

⏱️ **Estimated Time**: 40-50 minutes | 💰 **Cost Impact**: ~$5-15/month | ⭐ **Complexity**: Intermediate

**📚 പഠന പാത:**
- ← മുൻപ്: [പ്രീഫ്ലൈറ്റ് ചെക്കുകൾ](preflight-checks.md) - ഡെപ്്ലോയ്‌മെന്റിനു മുമ്പുള്ള പരിശോദന
- 🎯 **നിങ്ങൾ ഇവിടെ**: Application Insights ഇന്റഗ്രേഷൻ (നിരീക്ഷണം, ടെലിമെട്രി, ഡീബഗ്ഗിംഗ്)
- → അടുത്തത്: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Azure-ലേക്ക് ഡെപ്്ലോയ് ചെയ്യുക
- 🏠 [കഴിശ് ഹോം](../../README.md)

---

## നിങ്ങൾക്ക് എന്താണ് പഠിക്കാൻ പോകുന്നത്

ഈ പാഠം പൂർത്തിയാക്കുന്നതിലൂടെ, നിങ്ങൾ:
- AZD പ്രോജക്ടുകളിൽ **Application Insights** സ്വയമേധയാ ഇന്റഗ്രേറ്റ് ചെയ്യുന്നതിൽ പ്രാവീണ്യം നേടും
- മൈക്രോസർוויסുകൾക്കായി **distributed tracing** കോൺഫിഗർ ചെയ്യുന്നത് പഠിക്കും
- **കസ്റ്റം ടെലിമെട്രി** (മെട്രിക്സ്, ഇവന്റുകൾ, ഡിപ്പൻഡൻസികൾ) നടപ്പാക്കും
- റിയൽ-ടൈം നിരീക്ഷണത്തിനായി **ലൈവ് മെട്രിക്കുകൾ** സജ്ജമാക്കും
- AZD ഡെപ്്ലോയ്മെന്റുകൾ നിന്ന് **അലേർട്ടുകളും ഡാഷ്‌ബോർഡുകളും** സൃഷ്ടിക്കും
- **ടെലിമെട്രി ക്വെറിയുകൾ** ഉപയോഗിച്ച് പ്രൊഡക്ഷൻ പ്രശ്നങ്ങൾ ഡീബഗ് ചെയ്യാം
- **ചെലവും സാമ്പ്ലിംഗും** സംബന്ധിച്ച തന്ത്രങ്ങൾ ആപ്റ്റിമൈസ് ചെയ്യും
- **AI/LLM ആപ്ലിക്കേഷനുകൾ** (ടോക്കൻ‌സ്, ലേറ്റൻസി, ചെലവ്) നിരീക്ഷിക്കാൻ പഠിക്കും

## AZD-യോടുള്ള Application Insights എതിെന്റെ പ്രാധാന്യം

### വെല്ലുവിളി: പ്രൊഡക്ഷൻ ഒബ്സർവബിലിറ്റി

**Application Insights ഇല്ലാതെ:**
```
❌ No visibility into production behavior
❌ Manual log aggregation across services
❌ Reactive debugging (wait for customer complaints)
❌ No performance metrics
❌ Cannot trace requests across services
❌ Unknown failure rates and bottlenecks
```

**Application Insights + AZD ഉപയോഗിച്ചാൽ:**
```
✅ Automatic telemetry collection
✅ Centralized logs from all services
✅ Proactive issue detection
✅ End-to-end request tracing
✅ Performance metrics and insights
✅ Real-time dashboards
✅ AZD provisions everything automatically
```

**ഉപമ**: Application Insights നിങ്ങളുടെ ആപ്ലിക്കേഷനിനെ 위한 "ബ്ലാക്ക് ബോക്സ്" ഫ്ലൈറ്റ് റെക്കോർഡർ + കോക്പിറ്റ് ഡാഷ്ബോർഡ് പോലെയാണ്. നിങ്ങൾ റിയൽ-ടൈത്തിലുള്ള എല്ലാം കാണുകയും ഏതൊരു സംഭവവും പുനഃപ്രspഞ്ഞനായി പ്ലേ ചെയ്യുകയും ചെയ്യാം.

---

## ആർക്കിടെക്ചർ അവലോകനം

### AZD ആർക്കിടെക്ചറിലുണ്ടാകുന്ന Application Insights

```mermaid
graph TB
    User[ഉപഭോക്താവ്/ക്ലയന്റ്]
    App1[കോണ്ടെയ്‌നർ ആപ്പ് 1<br/>API ഗേറ്റ്വേ]
    App2[കോണ്ടെയ്‌നർ ആപ്പ് 2<br/>ഉൽപ്പന്ന സേവനം]
    App3[കോണ്ടെയ്‌നർ ആപ്പ് 3<br/>ഓർഡർ സേവനം]
    
    AppInsights[അപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ്<br/>ടെലിമെട്രി ഹബ്]
    LogAnalytics[(ലോഗ് അനലിറ്റിക്സ്<br/>വർക്ക്സ്പേസ്)]
    
    Portal[Azure പോർട്ടൽ<br/>ഡാഷ്‌ബോർഡുകൾ & അലർട്ടുകൾ]
    Query[Kusto ക്വെറികൾ<br/>കസ്റ്റം വിശകലനം]
    
    User --> App1
    App1 --> App2
    App2 --> App3
    
    App1 -.->|സ്വയം ഇൻസ്ട്രുമെന്റേഷൻ| AppInsights
    App2 -.->|സ്വയം ഇൻസ്ട്രുമെന്റേഷൻ| AppInsights
    App3 -.->|സ്വയം ഇൻസ്ട്രുമെന്റേഷൻ| AppInsights
    
    AppInsights --> LogAnalytics
    LogAnalytics --> Portal
    LogAnalytics --> Query
    
    style AppInsights fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
    style LogAnalytics fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
```
### യാതൊക്കെ സ്വയം നിരീക്ഷിക്കും

| Telemetry Type | What It Captures | Use Case |
|----------------|------------------|----------|
| **Requests** | HTTP അഭ്യർഥനകൾ, സ്റ്റാറ്റസ് കോഡുകൾ, ദൈർഘ്യം | API പ്രകടന നിരീക്ഷണം |
| **Dependencies** | ബാഹ്യ കോൾകൾ (DB, APIs, സ്റ്റോറേജ്) | ബോട്ടിൽനെക്കുകൾ കണ്ടെത്താൻ |
| **Exceptions** | സ്റ്റാക് ട്രേസുകളോടെയുള്ള കൈകാര്യം ചെയ്യാഞ്ഞ പിശകുകൾ | പരാജയങ്ങളുടെ ഡീബഗ് ചെയ്യൽ |
| **Custom Events** | ബിസിനസ് ഇവന്റുകൾ (സൈൻഅപ്പ്, വാങ്ങൽ) | വിശ്ലേഷണവും ഫണലുകളും |
| **Metrics** | പ്രകടന കൗണ്ടറുകൾ, കസ്റ്റം മെട്രിക്കുകൾ | ശേഷി പദ്ധതീകരണം |
| **Traces** | തീവ്രതയുള്ള ലോഗ് സന്ദേശങ്ങൾ | ഡീബഗിംഗ് ۽ ഓഡിറ്റിംഗ് |
| **Availability** | അപ്പ്ടൈം અને പ്രതികരണ സമയം ടെസ്റ്റുകൾ | SLA നിരീക്ഷണം |

---

## മുൻകരുതലുകൾ

### ആവശ്യമായ ഉപകരണങ്ങൾ

```bash
# Azure Developer CLI പരിശോധിക്കുക
azd version
# ✅ പ്രതീക്ഷിക്കുന്നത്: azd പതിപ്പ് 1.0.0 അല്ലെങ്കിൽ അതിലധികം

# Azure CLI പരിശോധിക്കുക
az --version
# ✅ പ്രതീക്ഷിക്കുന്നത്: azure-cli പതിപ്പ് 2.50.0 അല്ലെങ്കിൽ അതിലധികം
```

### Azure ആവശ്യകതകൾ

- സജീവമായ Azure subscription
- സൃഷ്ടിക്കാൻ അനുവദനീയമായ അനുവാദങ്ങൾ:
  - Application Insights റിസോഴ്സുകൾ
  - Log Analytics workspaces
  - Container Apps
  - Resource groups

### അറിവ് ആവശ്യകതകൾ

നിങ്ങൾക്ക് താഴെ പൂർത്തിയാക്കിയിരിക്കണം:
- [AZD Basics](../chapter-01-foundation/azd-basics.md) - AZD ലെ പ്രധാന ആശയങ്ങൾ
- [Configuration](../chapter-03-configuration/configuration.md) - ഏവ_environment ക്രമീകരണം
- [First Project](../chapter-01-foundation/first-project.md) - അടിസ്ഥാന ഡെപ്്ലോയ്‌മെന്റ്

---

## പാഠം 1: AZD ഉപയോഗിച്ച് സ്വയം Application Insights

### AZD എങ്ങനെ Application Insights പ്രൊവിഷൻ ചെയ്യുന്നത്

AZD ഡെപ്്ലോയ് ചെയ്യുന്നപ്പോൾ സ്വയം Application Insights സൃഷ്ടിക്കുകയും കോൺഫിഗർ ചെയ്യുകയും ചെയ്യും. ഇത് എങ്ങനെയാണ് പ്രവർത്തിക്കുന്നത് കാണാം.

### പ്രോജക്ട് ഘടന

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

### ചുവടുവയ്പ്പ് 1: AZD ക്രമീകരിക്കുക (azure.yaml)

**ഫയൽ: `azure.yaml`**

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

**ഇതായിത്തീർന്നു!** AZD ഡീഫോൾട്ടായി Application Insights സൃഷ്ടിക്കും. അടിസ്ഥാന നിരീക്ഷണത്തിന് അധിക ക്രമീകരണമൊന്നും ആവശ്യമില്ല.

---

### ചുവടുവയ്പ്പ് 2: നിരീക്ഷണ ഇൻഫ്രാസ്ട്രക്ചർ (Bicep)

**ഫയൽ: `infra/core/monitoring.bicep`**

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

### ചുവടുവയ്പ്പ് 3: Container App-നെ Application Insights-ലോട് যুক্তിക്കുക

**ഫയൽ: `infra/app/api.bicep`**

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

### ചുവടുവയ്പ്പ് 4: ടെലിമെട്രിയോടെയുള്ള ആപ്ലിക്കേഷൻ കോഡ്

**ഫയൽ: `src/app.py`**

```python
from flask import Flask, request, jsonify
from opencensus.ext.azure.log_exporter import AzureLogHandler
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.ext.flask.flask_middleware import FlaskMiddleware
from opencensus.trace.samplers import ProbabilitySampler
import logging
import os

app = Flask(__name__)

# Application Insights കണക്ഷൻ സ്ട്രിംഗ് നേടുക
connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

if connection_string:
    # വിഭജിത ട്രേസിംഗ് ക്രമീകരിക്കുക
    middleware = FlaskMiddleware(
        app,
        exporter=AzureExporter(connection_string=connection_string),
        sampler=ProbabilitySampler(rate=1.0)  # ഡെവലപ്‌മെന്റിന് 100% സാമ്പ്ലിംഗ്
    )
    
    # ലോഗിംഗ് ക്രമീകരിക്കുക
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
    
    # ഡാറ്റാബേസ് കോൾ അനുകരിക്കുക (സ്വയം ഒരു ആശ്രിതത്വമായി ട്രാക്കുചെയ്യപ്പെടും)
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
    time.sleep(3)  # മന്ദഗതിയുള്ള പ്രവർത്തനം അനുകരിക്കുക
    logger.warning('Endpoint took 3 seconds to respond')
    return jsonify({'message': 'Slow operation completed'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
```

**ഫയൽ: `src/requirements.txt`**

```txt
Flask==3.0.0
opencensus-ext-azure==1.1.13
opencensus-ext-flask==0.8.1
gunicorn==21.2.0
```

---

### ചുവടുവയ്പ്പ് 5: ഡെപ്്ലോയ് ചെയ്ത് പരിശോധിക്കുക

```bash
# AZD ആരംഭിക്കുക
azd init

# ഡെപ്ലോയുചെയ്യുക (Application Insights സ്വയമേവ ക്രമീകരിക്കുന്നു)
azd up

# ആപ്പ് URL നേടുക
APP_URL=$(azd env get-values | grep API_URL | cut -d '=' -f2 | tr -d '"')

# ടെലിമെട്രി ജനറേറ്റ് ചെയ്യുക
curl $APP_URL/health
curl $APP_URL/api/products
curl $APP_URL/api/error-test
curl $APP_URL/api/slow
```

**✅ പ്രതീക്ഷിക്കാവുന്ന ഔട്ട്പുട്ട്:**
```json
{
  "status": "healthy",
  "monitoring": "enabled"
}
```

---

### ചുവടുവയ്പ്പ് 6: Azure പോർട്ടലിൽ ടെലിമെട്രി കാണുക

```bash
# Application Insights വിശദാംശങ്ങൾ നേടുക
azd env get-values | grep APPLICATIONINSIGHTS

# Azure പോർട്ടലിൽ തുറക്കുക
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"') \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"') \
  --query "appId" -o tsv
```

**Azure പോർട്ടൽ → Application Insights → Transaction Search** നെ നാവിഗേറ്റ് ചെയ്യുക

നിങ്ങൾക്ക് കാണണം:
- ✅ HTTP അഭ്യർഥനകൾ സ്റ്റാറ്റസ് കോഡുകളോടെ
- ✅ `/api/slow` എന്നതിന് 3+ സെക്കൻഡുകൾ dauer ഉള്ള റിക്വെസ്റ്റ് ദൈർഘ്യം
- ✅ `/api/error-test`-ൽ നിന്നുള്ള എക്സപ്ഷൻ വിശദാംശങ്ങൾ
- ✅ കസ്റ്റം ലോഗ് സന്ദേശങ്ങൾ

---

## പാഠം 2: കസ്റ്റം ടെലിമെട്രി ಮತ್ತು ഇവന്റുകൾ

### ബിസിനസ് ഇവന്റുകൾ ട്രാക്ക് ചെയ്യുക

ബിസിനസ്-നിർണ്ണായക ഇവന്റുകൾക്കായി കസ്റ്റം ടെലിമെട്രി ചേർക്കാം.

**ഫയൽ: `src/telemetry.py`**

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
        
        # ലോഗർ സജ്ജമാക്കുക
        self.logger = logging.getLogger(__name__)
        self.logger.addHandler(AzureLogHandler(connection_string=self.connection_string))
        self.logger.setLevel(logging.INFO)
        
        # മെട്രിക്‌സ് എക്സ്പോർട്ടർ സജ്ജമാക്കുക
        self.stats = stats_module.stats
        self.view_manager = self.stats.view_manager
        self.stats_recorder = self.stats.stats_recorder
        
        exporter = metrics_exporter.new_metrics_exporter(
            connection_string=self.connection_string
        )
        self.view_manager.register_exporter(exporter)
        
        # ട്രേസർ സജ്ജമാക്കുക
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

# ആഗോള ടെലമെട്രി ക്ലയന്റ്
telemetry = TelemetryClient()
```

### കസ്റ്റം ഇവന്റുകൾ ചേർത്തുകൊണ്ട് ആപ്ലിക്കേഷൻ അപ്ഡേറ്റ് ചെയ്യുക

**ഫയൽ: `src/app.py` (വികസിതം)**

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
    
    # ബിസിനസ് സംഭവത്തെ പിന്തുടരുക
    telemetry.track_event('Purchase', {
        'product_id': product_id,
        'quantity': quantity,
        'total_amount': price * quantity,
        'user_id': request.headers.get('X-User-Id', 'anonymous')
    })
    
    # ఆదായ സൂചകം പിന്തുടരുക
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
    
    # തിരയൽ അനുകരിക്കുക (യഥാർത്ഥത്തിൽ ഇത് ഒരു ഡാറ്റാബേസ് ക്വറി ആയിരിക്കും)
    results = [{'id': 1, 'name': f'Result for {query}'}]
    
    duration = (time.time() - start_time) * 1000  # മില്ലിസെക്കൻഡുകളായി മാറ്റുക
    
    # തിരയൽ സംഭവം പിന്തുടരുക
    telemetry.track_event('Search', {
        'query': query,
        'results_count': len(results),
        'duration_ms': duration
    })
    
    # തിരയൽ പ്രകടന സൂചകം പിന്തുടരുക
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
        # ബാഹ്യ API വിളി അനുകരിക്കുക
        response = requests.get('https://api.example.com/data', timeout=5)
        result = response.json()
    except Exception as e:
        success = False
        result = {'error': str(e)}
    
    duration = (time.time() - start_time) * 1000
    
    # അനുബന്ധം പിന്തുടരുക
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

### കസ്റ്റം ടെലിമെട്രി ടെസ്റ്റ് ചെയ്യുക

```bash
# വാങ്ങൽ സംഭവം ട്രാക്ക് ചെയ്യുക
curl -X POST $APP_URL/api/purchase \
  -H "Content-Type: application/json" \
  -H "X-User-Id: user123" \
  -d '{"product_id": 1, "quantity": 2, "price": 29.99}'

# തിരയൽ സംഭവം ട്രാക്ക് ചെയ്യുക
curl "$APP_URL/api/search?q=laptop"

# ബാഹ്യ ആശ്രിതത്വം ട്രാക്ക് ചെയ്യുക
curl $APP_URL/api/external-call
```

**Azure പോർട്ടലിൽ കാണുക:**

Application Insights → Logs ൽ പോയി ശേഷം റൺ ചെയ്യുക:

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

## പാഠം 3: മൈക്രോസർവീസുകൾക്കുള്ള ഡിസ്ട്രിബ്യൂട്ടഡ് ട്രേസിംഗ്

### ക്രോസ്-സർവീസ് ട്രേസിംഗ് സജീവമാക്കുക

മൈക്രോസർവീസുകൾക്കായി Application Insights സ്വയം സർവീസുകൾക്കിടയിലെ അപേക്ഷകളെ കൊറലേറ്റ് ചെയ്യുന്നു.

**ഫയൽ: `infra/main.bicep`**

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

### End-to-End ട്രാൻസക്ഷൻ കാണുക

```mermaid
sequenceDiagram
    participant User
    participant Gateway as API ഗേറ്റ്‌വേ<br/>(ട്രേസ് ID: abc123)
    participant Product as ഉൽപ്പന്ന സേവനം<br/>(പാരന്റ് ID: abc123)
    participant Order as ഓർഡർ സേവനം<br/>(പാരന്റ് ID: abc123)
    participant AppInsights as അപ്ലിക്കേഷൻ ഇൻസൈറ്റ്‌സ്
    
    User->>Gateway: POST /api/checkout
    Note over Gateway: ട്രേസ് ആരംഭിക്കുക: abc123
    Gateway->>AppInsights: അഭ്യർത്ഥനം ലോഗ് ചെയ്യുക (ട്രേസ് ID: abc123)
    
    Gateway->>Product: GET /products/123
    Note over Product: പാരന്റ് ID: abc123
    Product->>AppInsights: ഡിപ്പെൻഡൻസി കോൾ രേഖപ്പെടുത്തുക
    Product-->>Gateway: ഉൽപ്പന്ന വിശദാംശങ്ങൾ
    
    Gateway->>Order: POST /orders
    Note over Order: പാരന്റ് ID: abc123
    Order->>AppInsights: ഡിപ്പെൻഡൻസി കോൾ രേഖപ്പെടുത്തുക
    Order-->>Gateway: ഓർഡർ സൃഷ്ടിച്ചു
    
    Gateway-->>User: ചെക്കൗട്ട് പൂർത്തിയായി
    Gateway->>AppInsights: പ്രതികരണം ലോഗ് ചെയ്യുക (ദൈർഘ്യം: 450ms)
    
    Note over AppInsights: ട്രേസ് ID അനുസരിച്ച് കോറലേഷൻ
```
**End-to-End ട്രേസ് ക്വറി ചെയ്യുക:**

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

## പാഠം 4: ലൈവ് മെട്രിക്കുകൾ & റിയൽ-ടൈം നിരീക്ഷണം

### ലൈവ് മെട്രിക്ക്സ് സ്ട്രീം സജീവമാക്കുക

ലൈവ് മെട്രിക്ക്സ് <1 സെക്കൻഡ് ലാറ്റൻസിയോടെ റിയൽ-ടൈം ടെലിമെട്രി നൽകുന്നു.

**ലൈവ് മെട്രിക്ക്സ് ആക്സസ് ചെയ്യുക:**

```bash
# Application Insights റിസോഴ്‌സ് നേടുക
APPI_NAME=$(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"')

# റിസോഴ്‌സ് ഗ്രൂപ്പ് നേടുക
RG_NAME=$(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"')

echo "Navigate to: Azure Portal → Resource Groups → $RG_NAME → $APPI_NAME → Live Metrics"
```

**റിയൽ-ടൈമിൽ നിങ്ങൾ കാണുന്നത്:**
- ✅ ഇൻകਮിംഗ് റിക്വസ്റ്റ് നിരക്ക് (requests/sec)
- ✅ പുറംകാണുന്ന ഡിപ്പൻഡൻസി കോൾസ്
- ✅ എക്സപ്ഷൻകൾ കമ്പണ്ട്
- ✅ CPUയും മെമ്മറിയും ഉപയോഗം
- ✅ സജീവ സര്‍വറുകളുടെ എണ്ണം
- ✅ സാമ്പിൾ ടെലിമെട്രി

### ടെസ്റ്റിംഗിന് ലോഡ് സൃഷ്ടിക്കുക

```bash
# ലൈവ് മെട്രിക്കുകൾ കാണാൻ ലോഡ് സൃഷ്‌ടിക്കുക
for i in {1..100}; do
  curl $APP_URL/api/products &
  curl $APP_URL/api/search?q=test$i &
done

# Azure പോർട്ടലിൽ ലൈവ് മെട്രിക്കുകൾ നിരീക്ഷിക്കുക
# നിങ്ങൾ അഭ്യർത്ഥന നിരക്ക് തീവ്രമായി ഉയരുന്നത് കാണും
```

---

## പ്രായോഗിക അഭ്യാസങ്ങൾ

### അഭ്യാസം 1: അലേർട്ടുകൾ സജ്ജീകരിക്കുക ⭐⭐ (മധ്യമം)

**ലക്ഷ്യം**: ഉയർന്ന പിശക് നിരക്കും മന്ദഗതിയിലുള്ള പ്രതികരണങ്ങൾക്കുമുള്ള അലേർട്ടുകൾ സൃഷ്ടിക്കുക.

**പടികൾ:**

1. **പിശക് നിരക്കിനുള്ള അലേർട്ട് സൃഷ്ടിക്കുക:**

```bash
# Application Insights റിസോഴ്‌സ് ഐഡി നേടുക
APPI_ID=$(az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "id" -o tsv)

# പരാജയപ്പെട്ട അഭ്യർത്ഥനകൾക്കായി മെട്രിക് അലേർട്ട് സൃഷ്ടിക്കുക
az monitor metrics alert create \
  --name "High-Error-Rate" \
  --resource-group $RG_NAME \
  --scopes $APPI_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "Alert when error rate exceeds 10 per 5 minutes"
```

2. **മന്ദമായ പ്രതികരണങ്ങൾക്ക് അലേർട്ട് സൃഷ്ടിക്കുക:**

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

3. **Bicep വഴി അലേർട്ട് സൃഷ്ടിക്കുക (AZD-യ്ക്ക് ഇഷ്ടാനുസൃതം):**

**ഫയൽ: `infra/core/alerts.bicep`**

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

4. **അലേർട്ടുകൾ ടെസ്റ്റ് ചെയ്യുക:**

```bash
# പിശകുകൾ സൃഷ്ടിക്കുക
for i in {1..20}; do
  curl $APP_URL/api/error-test
done

# മന്ദമായ പ്രതികരണങ്ങൾ സൃഷ്ടിക്കുക
for i in {1..10}; do
  curl $APP_URL/api/slow
done

# അലേർട്ട് നില പരിശോധിക്കുക (5-10 നിമിഷം കാത്തിരിക്കുക)
az monitor metrics alert list \
  --resource-group $RG_NAME \
  --query "[].{Name:name, Enabled:enabled, State:properties.enabled}" \
  --output table
```

**✅ വിജയ മാനദണ്ഡങ്ങൾ:**
- ✅ അലർട്ടുകൾ വിജയകരമായി സൃഷ്ടിച്ചു
- ✅ പരിധികൾ കടക്കുമ്പോൾ അലർട്ടുകൾ ട്രിഗർ ചെയ്യുന്നു
- ✅ Azure പോർട്ടലിൽ അലേർട്ട് ചരിത്രം കാണാൻ കഴിയും
- ✅ AZD ഡെപ്്ലോയ്മെന്റുമായി ഇന്റഗ്രേറ്റ് ചെയ്യപ്പെട്ടത്

**സമയം**: 20-25 minutes

---

### അഭ്യാസം 2: കസ്റ്റം ഡാഷ്‌ബോർഡ് സൃഷ്ടിക്കുക ⭐⭐ (മധ്യമം)

**ലക്ഷ്യം**: പ്രധാന ആപ്ലിക്കേഷൻ മെട്രിക്സ് കാണിക്കുന്ന ഒരു ഡാഷ്ബോർഡ് നിർമ്മിക്കുക.

**പടികൾ:**

1. **Azure പോർട്ടലിലൂടെ ഡാഷ്ബോർഡ് സൃഷ്ടിക്കുക:**

Azure പോർട്ടൽ → Dashboards → New Dashboard

2. **പ്രധാന മെട്രിക്കുകൾക്കുള്ള ടൈൽസുകൾ ചേർക്കുക:**

- അഭ്യർഥനകളുടെ എണ്ണം (കഴിഞ്ഞ 24 മണിക്കൂർ)
- ശരാശരി പ്രതികരണ സമയം
- പിശക് നിരക്ക്
- മുകളിൽ 5 മന്ദഗതിയുള്ള ഓപ്പറേഷനുകൾ
- ഉപയോക്താക്കളുടെ ഭൗകോളിക വിതരണവിന്യാസം

3. **Bicep വഴി ഡാഷ്ബോർഡ് സൃഷ്ടിക്കുക:**

**ഫയൽ: `infra/core/dashboard.bicep`**

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

4. **ഡെപ്്ലോയ് ഡാഷ്ബോർഡ്:**

```bash
# main.bicep-ൽ ചേർക്കുക
module dashboard './core/dashboard.bicep' = {
  name: 'dashboard'
  scope: rg
  params: {
    dashboardName: 'dashboard-${environmentName}'
    applicationInsightsId: monitoring.outputs.applicationInsightsId
    location: location
  }
}

# വിന്യസിക്കുക
azd up
```

**✅ വിജയ മാനദണ്ഡങ്ങൾ:**
- ✅ ഡാഷ്ബോർഡ് പ്രധാന മെട്രിക്കുകൾ പ്രദർശിപ്പിക്കുന്നു
- ✅ Azure പോർട്ടൽ ഹോത്തിൽ പിന് ചെയ്യാൻ സാധിക്കുന്നു
- ✅ റിയൽ-ടൈമിൽ അപ്ഡേറ്റുചെയ്യുന്നു
- ✅ AZD വഴി ഡെപ്്ലോയ് ചെയ്യാവുന്നതാണ്

**സമയം**: 25-30 minutes

---

### അഭ്യാസം 3: AI/LLM ആപ്ലിക്കേഷൻ നിരീക്ഷിക്കുക ⭐⭐⭐ (അഡ്വാൻസ്ഡ്)

**ലക്ഷ്യം**: Azure OpenAI ഉപയോഗം (ടോക്കൻസ്, ചെലവ്, ലേറ്റൻസി) ട്രാക്ക് ചെയ്യുക.

**പടികൾ:**

1. **AI നിരീക്ഷണ റാപ്പർ സൃഷ്ടിക്കുക:**

**ഫയൽ: `src/ai_telemetry.py`**

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
            # Azure OpenAI വിളിക്കുക
            response = self.client.chat.completions.create(
                model=model,
                messages=messages,
                **kwargs
            )
            
            duration = (time.time() - start_time) * 1000  # മില്ലിസെക്കന്റ് (ms)
            
            # ഉപയോഗ വിവരങ്ങൾ എടുക്കുക
            usage = response.usage
            prompt_tokens = usage.prompt_tokens
            completion_tokens = usage.completion_tokens
            total_tokens = usage.total_tokens
            
            # ചെലവ് കണക്കാക്കുക (GPT-4 വിലകൾ)
            prompt_cost = (prompt_tokens / 1000) * 0.03  # $0.03 ഓരോ 1K ടോക്കണിനും
            completion_cost = (completion_tokens / 1000) * 0.06  # $0.06 ഓരോ 1K ടോക്കണിനും
            total_cost = prompt_cost + completion_cost
            
            # കസ്റ്റം ഇവന്റ് ട്രാക്ക് ചെയ്യുക
            telemetry.track_event('OpenAI_Request', {
                'model': model,
                'prompt_tokens': prompt_tokens,
                'completion_tokens': completion_tokens,
                'total_tokens': total_tokens,
                'duration_ms': duration,
                'cost_usd': total_cost,
                'success': True
            })
            
            # മെട്രിക്കുകൾ നിരീക്ഷിക്കുക
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

2. **നിരീക്ഷിച്ച ക്ലയന്റ് ഉപയോഗിക്കുക:**

```python
from flask import Flask, request, jsonify
from ai_telemetry import MonitoredAzureOpenAI
import os

app = Flask(__name__)

# മോണിറ്റർ ചെയ്യപ്പെടുന്ന OpenAI ക്ലയന്റ് ആരംഭിക്കുക
openai_client = MonitoredAzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

@app.route('/api/chat', methods=['POST'])
def chat():
    data = request.json
    user_message = data.get('message')
    
    # സ്വയംചാലിത മോണിറ്ററിംഗുമായി കോൾ ചെയ്യുക
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

3. **AI മെട്രിക്കുകൾ ക്വറി ചെയ്യുക:**

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

**✅ വിജയ മാനദണ്ഡങ്ങൾ:**
- ✅ എല്ലാ OpenAI കോളുകളും സ്വയമേവ ട്രാക്ക് ചെയ്യപ്പെടുന്നു
- ✅ ടോക്കൺ ഉപയോഗവും ചെലവും ദൃശ്യമാകുന്നു
- ✅ ലേറ്റൻസി നിരീക്ഷിക്കപ്പെടുന്നു
- ✅ ബഡ്ജറ്റ് അലേർട്ടുകൾ സജ്ജമാക്കാൻ കഴിയും

**സമയം**: 35-45 minutes

---

## ചെലവ് ആപ്റ്റിമൈസേഷൻ

### സാമ്പ്ലിംഗ് തന്ത്രങ്ങൾ

ടെലിമെട്രി സാമ്പ്ലിംഗ് നിയന്ത്രിച്ച് ചെലവ് നിയന്ത്രിക്കുക:

```python
from opencensus.trace.samplers import ProbabilitySampler

# ഡവലപ്പ്മെന്റ്: 100% സാമ്പ്ലിംഗ്
sampler = ProbabilitySampler(rate=1.0)

# പ്രൊഡക്ഷൻ: 10% സാമ്പ്ലിംഗ് (ചെലവുകൾ 90% വരെ കുറയ്ക്കുക)
sampler = ProbabilitySampler(rate=0.1)

# അഡാപ്റ്റീവ് സാമ്പ്ലിംഗ് (സ്വയം ക്രമീകരിക്കുന്നു)
from opencensus.trace.samplers import AdaptiveSampler
sampler = AdaptiveSampler()
```

**Bicep-ൽ:**

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  properties: {
    SamplingPercentage: 10  // 10% sampling
  }
}
```

### ഡാറ്റാ നിലനിർത്തൽ

```bicep
resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: logAnalyticsName
  properties: {
    retentionInDays: 30  // Minimum (cheapest)
    // Options: 30, 31, 60, 90, 120, 180, 270, 365, 550, 730
  }
}
```

### മാസവാരി ചെലവ് തീരവ്

| Data Volume | Retention | Monthly Cost |
|-------------|-----------|--------------|
| 1 GB/month | 30 days | ~$2-5 |
| 5 GB/month | 30 days | ~$10-15 |
| 10 GB/month | 90 days | ~$25-40 |
| 50 GB/month | 90 days | ~$100-150 |

**ഫ്രീ ടിയർ**: 5 GB/month ഉൾപ്പെട്ടിരിക്കുന്നു

---

## അറിവ് പരിശോധനം

### 1. അടിസ്ഥാന ഇന്റഗ്രേഷൻ ✓

നിങ്ങളുടെ മനസ്സിലാക്കൽ പരിശോദിക്കുക:

- [ ] **Q1**: AZD എങ്ങനെ Application Insights പ്രൊവിഷൻ ചെയ്യുന്നു?
  - **A**: `infra/core/monitoring.bicep` ൽ ഉള്ള Bicep ടേംപ്ലേറ്റുകൾ വഴി സ്വയമേധയാ

- [ ] **Q2**: ഏത് എൻവയറണ്മെന്റ് വെറിയബിൾ Application Insights സജീവമാക്കും?
  - **A**: `APPLICATIONINSIGHTS_CONNECTION_STRING`

- [ ] **Q3**: മൂന്നു പ്രധാന ടെലിമെട്രി തരം എന്തെല്ലാം?
  - **A**: അഭ്യർഥനകൾ (HTTP കോളുകൾ), ഡിപെൻഡൻസികൾ (ബാഹ്യ കോളുകൾ), എക്സപ്ഷൻകൾ (പിശകുകൾ)

**Hands-On Verification:**
```bash
# Application Insights ക്രമീകരിച്ചിട്ടുണ്ടോ പരിശോധിക്കുക
azd env get-values | grep APPLICATIONINSIGHTS

# ടെലിമെട്രി പ്രവഹിക്കുന്നുണ്ടെന്ന് സ്ഥിരീകരിക്കുക
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "requests/count"
```

---

### 2. കസ്റ്റം ടെലിമെട്രി ✓

നിങ്ങളുടെ മനസ്സിലാക്കൽ പരിശോദിക്കുക:

- [ ] **Q1**: ബിസിനസ് ഇവന്റുകൾ നിങ്ങൾ എങ്ങനെ ട്രാക്ക് ചെയ്യും?
  - **A**: `custom_dimensions` ഉപയോഗിച്ച് ലോഗർ അല്ലെങ്കിൽ `TelemetryClient.track_event()` ഉപയോഗിക്കുക

- [ ] **Q2**: ഇവന്റുകൾക്കും മെട്രിക്കുകൾക്കും ഇടയിൽ പ്രധാന വ്യത്യാസം എന്താണ്?
  - **A**: ഇവന്റുകൾ വ്യത്യസ്ത സംഭവങ്ങളാണ്, മെട്രിക്കുകൾ സംഖ്യാത്മക അളവുകൾ ആണ്

- [ ] **Q3**: സർവീസുകൾക്കിടയിൽ ടെലിമെട്രി എങ്ങനെ കൊറലേറ്റ് ചെയ്യും?
  - **A**: Application Insights സ്വയം `operation_Id` ഉപയോഗിച്ച് കൊറലേറ്റ് ചെയ്യും

**Hands-On Verification:**
```kusto
// Verify custom events
traces
| where customDimensions.event_name != ""
| summarize count() by tostring(customDimensions.event_name)
```

---

### 3. പ്രൊഡക്ഷൻ നിരീക്ഷണം ✓

നിങ്ങളുടെ മനസ്സിലാക്കൽ പരിശോദിക്കുക:

- [ ] **Q1**: സാമ്പ്ലിംഗ് എന്താണ്, അത് എന്തിന് ഉപയോഗിക്കുന്നത്?
  - **A**: സാമ്പ്ലിംഗ് ഡാറ്റാ വോള്യം (ഏതാനും) കുറയ്ക്കുന്നതിനും ചെലവ് നിയന്ത്രിക്കാൻ മാത്രം ചില ടെലിമെട്രി മാത്രം പിടികൂടൽ നടത്തുന്നത് ആണ്

- [ ] **Q2**: നിങ്ങൾ അലേർട്ടുകൾ എങ്ങനെ സജ്ജീകരിക്കും?
  - **A**: Application Insights മെട്രിക് അടിസ്ഥാനമാക്കി Bicep അല്ലെങ്കിൽ Azure പോർട്ടൽ വഴി മെട്രിക് അലേർട്ടുകൾ സജ്ജീകരിക്കുക

- [ ] **Q3**: Log Analytics-ക്കും Application Insights-ക്കും ഇടയിലെ വ്യത്യാസം എന്താണ്?
  - **A**: Application Insights ഡാറ്റ Log Analytics വർക്ക്സ്പേസിൽ സംഭരിക്കുന്നു; App Insights ആപ്പ്ലിക്കേഷൻ നിഷ്ടമായ näkymകൾ നൽകുന്നു

**Hands-On Verification:**
```bash
# സാമ്പിളിംഗ് ക്രമീകരണം പരിശോധിക്കുക
az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "properties.SamplingPercentage"
```

---

## മികച്ച ശീലങ്ങൾ

### ✅ ചെയ്യുക:

1. **Correlation IDs ഉപയോഗിക്കുക**
   ```python
   logger.info('Processing order', extra={
       'custom_dimensions': {
           'order_id': order_id,
           'user_id': user_id
       }
   })
   ```

2. **നിരന്തരം പ്രധാന മെട്രിക്കുകൾക്കായി അലേർട്ടുകൾ സജ്ജീകരിക്കുക**
   ```bicep
   // Error rate, slow responses, availability
   ```

3. **രൂപകൽപ്പനാബദ്ധമായ ലോഗിംഗ് ഉപയോഗിക്കുക**
   ```python
   # ✅ നല്ലത്: ഘടനാപരമായ
   logger.info('User signup', extra={'custom_dimensions': {'user_id': 123}})
   
   # ❌ മോശം: അസംഘടിതം
   logger.info(f'User 123 signed up')
   ```

4. **ഡിപെൻഡൻസികൾ നിരീക്ഷിക്കുക**
   ```python
   # ഓട്ടോമാറ്റിക്കായി ഡേറ്റാബേസ് വിളകളും, HTTP അഭ്യർത്ഥനകളും തുടങ്ങിയവ ട്രാക്കുചെയ്യുക.
   ```

5. **ഡെപ്്ലോയ്‌മെന്റുകൾ സമയത്ത് ലൈവ് മെട്രിക്ക്സ് ഉപയോഗിക്കുക**

### ❌ ചെയ്യരുത്:

1. **സെൻസിറ്റീവ് ഡാറ്റ ലോഗ് ചെയ്യരുത്**
   ```python
   # ❌ മോശം
   logger.info(f'Login: {username}:{password}')
   
   # ✅ നല്ലത്
   logger.info('Login attempt', extra={'custom_dimensions': {'username': username}})
   ```

2. **പ്രൊഡക്ഷനിൽ 100% സാമ്പ്ലിംഗ് ഉപയോഗിക്കരുത്**
   ```python
   # ❌ വില ഉയർന്ന
   sampler = ProbabilitySampler(rate=1.0)
   
   # ✅ ചിലവിൽ ഫലപ്രദം
   sampler = ProbabilitySampler(rate=0.1)
   ```

3. **ഡെഡ് ലെറ്റർ ക്യൂകൾ അവഗണിക്കരുത്**

4. **ഡാറ്റാ നിലനിർത്തൽ പരിധികൾ സജ്ജീകരിക്കാൻ മറക്കരുത്**

---

## പ്രശ്നപരിഹാരം

### പ്രശ്നം: ടെലിമെട്രി കാണപ്പെടുന്നില്ല

**കാരണ നിർണ്ണയം:**
```bash
# കണക്ഷൻ സ്ട്രിംഗ് സജ്ജമാക്കിയിട്ടുണ്ടെന്ന് പരിശോധിക്കുക
azd env get-values | grep APPLICATIONINSIGHTS

# Azure Monitor ഉപയോഗിച്ച് ആപ്ലിക്കേഷൻ ലോഗുകൾ പരിശോധിക്കുക
azd monitor --logs

# അല്ലെങ്കിൽ Container Apps-ക്കായുള്ള Azure CLI ഉപയോഗിക്കുക:
az containerapp logs show --name $APP_NAME --resource-group $RG_NAME --tail 50
```

**പരിഹാരം:**
```bash
# കൺറ്റെയ്നർ ആപ്പിൽ കണക്ഷൻ സ്ട്രിംഗ് പരിശോധിക്കുക
az containerapp show \
  --name $APP_NAME \
  --resource-group $RG_NAME \
  --query "properties.template.containers[0].env" \
  | grep -i applicationinsights
```

---

### പ്രശ്നം: ചെലവ് ഉയർന്നിരിക്കുക

**കാരണ നിർണ്ണയം:**
```bash
# ഡാറ്റ ഇൻജെഷൻ പരിശോധിക്കുക
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "availabilityResults/count"
```

**പരിഹാരം:**
- സാമ്പ്ലിംഗ് നിരക്ക് കുറക്കുക
- നിലനിർത്തൽ കാലയളവ് കുറയ്ക്കുക
-Verbose ലോഗിംഗ് നീക്കം ചെയ്യുക

---

## കൂടുതൽ പഠിക്കുക

### അധികാരിക ഡോക്യുമെന്റേഷൻ
- [Application Insights Overview](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Application Insights for Python](https://learn.microsoft.com/azure/azure-monitor/app/opencensus-python)
- [Kusto Query Language](https://learn.microsoft.com/azure/data-explorer/kusto/query/)
- [AZD Monitoring](https://learn.microsoft.com/azure/developer/azure-developer-cli/monitor-your-app)

### ഈ കോഴ്സിലെ അടുത്ത ചുവട്
- ← മുൻപ്: [പ്രീഫ്ലൈറ്റ് ചെക്കുകൾ](preflight-checks.md)
- → അടുത്തത്: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- 🏠 [കഴിശ് ഹോം](../../README.md)

### ബന്ധപ്പെട്ട ഉദാഹരണങ്ങൾ
- [Azure OpenAI Example](../../../../examples/azure-openai-chat) - AI ടെലിമെട്രി
- [Microservices Example](../../../../examples/microservices) - ഡിസ്ട്രിബ്യൂട്ടഡ് ട്രേസിംഗ്

---

## സംഗ്രഹം

**നിങ്ങൾ പഠിച്ചു:**
- ✅ AZD ഉപയോഗിച്ച് Application Insights സ്വയമേധയാ പ്രൊവിഷൻ ചെയ്യുന്നത്
- ✅ കസ്റ്റം ടെലിമെട്രി (ഇവന്റുകൾ, മെട്രിക്കുകൾ, ഡിപ്പൻഡൻസികൾ)
- ✅ മൈക്രോസർവീസുകൾക്കിടയിലെ ഡിസ്ട്രിബ്യൂട്ടഡ് ട്രേസിംഗ്
- ✅ ലൈവ് മെട്രിക്‌സും റിയൽ-ടൈം നിരീക്ഷണവും
- ✅ അലർട്ടുകളും ഡാഷ്ബോർഡുകളും
- ✅ AI/LLM അപ്ലിക്കേഷൻ നിരീക്ഷണം
- ✅ ചെലവ് ഓപ്റ്റിമൈസേഷൻ തന്ത്രങ്ങൾ

**പ്രധാന ആശയങ്ങൾ:**
1. **AZD സ്വയം നിരീക്ഷണം ഒരുക്കുന്നു** - മാനുവൽ ക്രമീകരണം ആവശ്യമില്ല
2. **സംരചിത ലോഗിംഗ് ഉപയോഗിക്കുക** - ക്വറി ചെയ്യുന്നത് എളുപ്പമാക്കുന്നു
3. **ബിസിനസ് സംഭവങ്ങൾ ട്രാക്ക് ചെയ്യുക** - വെറും സാങ്കേതിക മെട്രിക്‌സുകളിലല്ല
4. **AI ചെലവുകൾ നിരീക്ഷിക്കുക** - ടോക്കണുകളും ചിലവുകളും ട്രാക്ക് ചെയ്യുക
5. **അലർട്ടുകൾ ക്രമീകരിക്കുക** - പ്രതികരണപരമാകാതെ മുൻകരുതൽ സ്വീകരിക്കുക
6. **ചെലവുകൾ ഓപ്റ്റിമൈസ് ചെയ്യുക** - സാമ്പ്ലിംഗ് અને റീറ്റൻഷൻ പരിധികൾ ഉപയോഗിക്കുക

**അടുത്ത ചുവടുകൾ:**
1. പ്രായോഗിക അഭ്യാസങ്ങൾ പൂർത്തിയാക്കുക
2. നിങ്ങളുടെ AZD പ്രോജക്ടുകളിൽ Application Insights ചേർക്കുക
3. നിങ്ങളുടെ ടീമിനായി കസ്റ്റം ഡാഷ്ബോർഡുകൾ സൃഷ്ടിക്കുക
4. പഠിക്കുക [ഡിപ്ലോയ്മെന്റ് ഗൈഡ്](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ഡിസ്‌ക്ലെയിമർ:

ഈ രേഖ AI തർജ്ജമാ സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് തർജ്ജമ ചെയ്തതാണ്. നാം കൃത്യതയ്‌ക്കായി ശ്രമിച്ചിട്ടുണ്ടെങ്കിലും, ഓട്ടോമേറ്റഡ് തർജ്ജമകളിൽ പിഴവുകൾ അല്ലെങ്കിൽ അവ്യക്തതകൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ടെന്നത് ദയവായി ശ്രദ്ധിക്കുക. അതിന്റെ മൂലഭാഷയിലുള്ള പ്രഥമ രേഖതന്നെയാണ് അധികാരപരമായ ഉറവിടം എന്നു പരിഗണിക്കേണ്ടത് ഉചിതമാണ്. ഗൗരവമുള്ള വിവരങ്ങൾക്ക് പ്രൊഫഷണൽ മനുഷ്യ തർജ്ജമ നിർദ്ദേശിക്കുന്നു. ഈ തർജ്മയുടെ ഉപയോഗത്തിൽ നിന്നുണ്ടാകുന്ന ഏതൊരു തെറ്റായ തിരിച്ചറിവിനും അല്ലെങ്കിൽ തെറ്റായി വ്യാഖ്യാനിച്ചതിനുമുള്ള ഉത്തരവാദിത്വം ഞങ്ങൾ ഏറ്റെടുക്കുന്നില്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->