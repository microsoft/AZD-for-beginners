# Uunganisho wa Application Insights na AZD

⏱️ **Muda Unaokadiriwa**: 40-50 minutes | 💰 **Athari ya Gharama**: ~$5-15/month | ⭐ **Ugumu**: Intermediate

**📚 Njia ya Kujifunza:**
- ← Iliyotangulia: [Ukaguzi wa awali](preflight-checks.md) - Uthibitishaji kabla ya utoaji
- 🎯 **Uko Hapa**: Uunganisho wa Application Insights (Ufuatiliaji, telemetri, utambuzi makosa)
- → Ifuatayo: [Mwongozo wa Utoaji](../chapter-04-infrastructure/deployment-guide.md) - Deploy to Azure
- 🏠 [Nyumbani kwa Kozi](../../README.md)

---

## Utajifunza Nini

Kwa kumaliza somo hili, utapata:
- Kuunganisha Application Insights kwenye miradi ya AZD kwa otomatiki
- Sanidi ufuatiliaji uliogawanyika kwa microservices
- Tekeleza telemetri maalum (vipimo, matukio, utegemezi)
- Weka vipimo vya moja kwa moja kwa ufuatiliaji wa wakati halisi
- Tengeneza arifu na dashibodi kutoka kwa utoaji wa AZD
- Rekebisha matatizo ya uzalishaji kwa kutumia maswali ya telemetri
- Boresha gharama na mikakati ya sampuli
- Fuatilia programu za AI/LLM (tokens, ucheleweshaji, gharama)

## Kwa Nini Application Insights na AZD Ni Muhimu

### Changamoto: Ufuatiliaji Katika Uzalishaji

**Bila Application Insights:**
```
❌ No visibility into production behavior
❌ Manual log aggregation across services
❌ Reactive debugging (wait for customer complaints)
❌ No performance metrics
❌ Cannot trace requests across services
❌ Unknown failure rates and bottlenecks
```

**Na Application Insights + AZD:**
```
✅ Automatic telemetry collection
✅ Centralized logs from all services
✅ Proactive issue detection
✅ End-to-end request tracing
✅ Performance metrics and insights
✅ Real-time dashboards
✅ AZD provisions everything automatically
```

**Sanauli**: Application Insights ni kama kuwa na rekoda ya "black box" ya ndege + dashibodi ya kokpiti kwa programu yako. Unaona kila kitu kinachotokea kwa wakati halisi na unaweza kurudisha tukio lolote tena.

---

## Muhtasari wa Usanifu

### Application Insights katika Muundo wa AZD

```mermaid
graph TB
    User[Mtumiaji/Mteja]
    App1[Programu ya Kontena 1<br/>Mlango la API]
    App2[Programu ya Kontena 2<br/>Huduma ya Bidhaa]
    App3[Programu ya Kontena 3<br/>Huduma ya Oda]
    
    AppInsights[Uchunguzi wa Programu<br/>Kituo cha Telemetri]
    LogAnalytics[(Uchambuzi wa Logi<br/>Eneo la Kazi)]
    
    Portal[Portal ya Azure<br/>Dashibodi na Arifa]
    Query[Maswali ya Kusto<br/>Uchambuzi Maalum]
    
    User --> App1
    App1 --> App2
    App2 --> App3
    
    App1 -.->|Uwekaji wa upimaji kiotomatiki| AppInsights
    App2 -.->|Uwekaji wa upimaji kiotomatiki| AppInsights
    App3 -.->|Uwekaji wa upimaji kiotomatiki| AppInsights
    
    AppInsights --> LogAnalytics
    LogAnalytics --> Portal
    LogAnalytics --> Query
    
    style AppInsights fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
    style LogAnalytics fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
```
### Nini Kinachofuatiliwa kwa Otomatiki

| Aina ya Telemetri | Inachokamata | Matumizi |
|----------------|------------------|----------|
| **Requests** | Maombi ya HTTP, nambari za hali, muda | Ufuatiliaji wa utendaji wa API |
| **Dependencies** | Miito ya nje (DB, APIs, storage) | Tambua vikwazo |
| **Exceptions** | Makosa yasiyoshughulikiwa yenye stack trace | Kurekebisha makosa |
| **Custom Events** | Matukio ya biashara (signup, purchase) | Uchambuzi na mtiririko |
| **Metrics** | Viashiria vya utendaji, vipimo maalum | Mipango ya uwezo |
| **Traces** | Ujumbe za logi zenye uzito | Kurekebisha na ukaguzi |
| **Availability** | Vipimo vya uptime na muda wa majibu | Ufuatiliaji wa SLA |

---

## Mahitaji

### Zana Zinazohitajika

```bash
# Thibitisha Azure Developer CLI
azd version
# ✅ Inatarajiwa: toleo la azd 1.0.0 au zaidi

# Thibitisha Azure CLI
az --version
# ✅ Inatarajiwa: toleo la azure-cli 2.50.0 au zaidi
```

### Mahitaji ya Azure

- Usajili wa Azure ukiwa hai
- Ruhusa za kuunda:
  - rasilimali za Application Insights
  - Log Analytics workspaces
  - Container Apps
  - makundi ya rasilimali

### Maarifa Yanayohitajika

Unapaswa kuwa umemaliza:
- [AZD Basics](../chapter-01-foundation/azd-basics.md) - Core AZD concepts
- [Configuration](../chapter-03-configuration/configuration.md) - Environment setup
- [First Project](../chapter-01-foundation/first-project.md) - Basic deployment

---

## Somo 1: Application Insights Otomatiki na AZD

### Jinsi AZD Inavyotoa Application Insights

AZD kwa otomatiki huunda na kusanidi Application Insights unapofanya utoaji. Tuwone jinsi inavyofanya kazi.

### Muundo wa Mradi

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

### Hatua 1: Sanidi AZD (azure.yaml)

**Faili: `azure.yaml`**

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

**Hiyo ni yote!** AZD itaunda Application Insights kwa chaguo-msingi. Hakuna usanidi wa ziada unaohitajika kwa ufuatiliaji wa msingi.

---

### Hatua 2: Miundombinu ya Ufuatiliaji (Bicep)

**Faili: `infra/core/monitoring.bicep`**

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

### Hatua 3: Unganisha Container App na Application Insights

**Faili: `infra/app/api.bicep`**

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

### Hatua 4: Msimbo wa Programu na Telemetri

**Faili: `src/app.py`**

```python
from flask import Flask, request, jsonify
from opencensus.ext.azure.log_exporter import AzureLogHandler
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.ext.flask.flask_middleware import FlaskMiddleware
from opencensus.trace.samplers import ProbabilitySampler
import logging
import os

app = Flask(__name__)

# Pata msururu wa muunganisho wa Application Insights
connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

if connection_string:
    # Sanidi ufuatiliaji uliosambazwa
    middleware = FlaskMiddleware(
        app,
        exporter=AzureExporter(connection_string=connection_string),
        sampler=ProbabilitySampler(rate=1.0)  # Kusampulia 100% kwa mazingira ya maendeleo
    )
    
    # Sanidi kurekodi kumbukumbu
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
    
    # Iga wito wa hifadhidata (inafuatiliwa moja kwa moja kama utegemezi)
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
    time.sleep(3)  # Iga operesheni polepole
    logger.warning('Endpoint took 3 seconds to respond')
    return jsonify({'message': 'Slow operation completed'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
```

**Faili: `src/requirements.txt`**

```txt
Flask==3.0.0
opencensus-ext-azure==1.1.13
opencensus-ext-flask==0.8.1
gunicorn==21.2.0
```

---

### Hatua 5: Weka na Thibitisha

```bash
# Anzisha AZD
azd init

# Sambaza (hutayarisha Application Insights kiotomatiki)
azd up

# Pata URL ya programu
APP_URL=$(azd env get-values | grep API_URL | cut -d '=' -f2 | tr -d '"')

# Zalisha telemetry
curl $APP_URL/health
curl $APP_URL/api/products
curl $APP_URL/api/error-test
curl $APP_URL/api/slow
```

**✅ Matokeo Yanayotarajiwa:**
```json
{
  "status": "healthy",
  "monitoring": "enabled"
}
```

---

### Hatua 6: Tazama Telemetri katika Azure Portal

```bash
# Pata maelezo ya Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Fungua katika Azure Portal
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"') \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"') \
  --query "appId" -o tsv
```

**Nenda kwenye Azure Portal → Application Insights → Transaction Search**

Unapaswa kuona:
- ✅ Maombi ya HTTP yenye nambari za hali
- ✅ Muda wa ombi (3+ sekunde kwa `/api/slow`)
- ✅ Maelezo ya makosa kutoka `/api/error-test`
- ✅ Ujumbe maalum za logi

---

## Somo 2: Telemetri Maalum na Matukio

### Fuata Matukio ya Kibiashara

Wacha tuongeze telemetri maalum kwa matukio muhimu ya biashara.

**Faili: `src/telemetry.py`**

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
        
        # Sanidi logger
        self.logger = logging.getLogger(__name__)
        self.logger.addHandler(AzureLogHandler(connection_string=self.connection_string))
        self.logger.setLevel(logging.INFO)
        
        # Sanidi mtoaji wa vipimo
        self.stats = stats_module.stats
        self.view_manager = self.stats.view_manager
        self.stats_recorder = self.stats.stats_recorder
        
        exporter = metrics_exporter.new_metrics_exporter(
            connection_string=self.connection_string
        )
        self.view_manager.register_exporter(exporter)
        
        # Sanidi mfuatiliaji
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

# Mteja wa telemetri wa kimataifa
telemetry = TelemetryClient()
```

### Sasisha Programu na Matukio Maalum

**Faili: `src/app.py` (imeboreshwa)**

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
    
    # Fuatilia tukio la biashara
    telemetry.track_event('Purchase', {
        'product_id': product_id,
        'quantity': quantity,
        'total_amount': price * quantity,
        'user_id': request.headers.get('X-User-Id', 'anonymous')
    })
    
    # Fuatilia kipimo cha mapato
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
    
    # Iga utafutaji (ingekuwa ni swali halisi kwenye hifadhidata)
    results = [{'id': 1, 'name': f'Result for {query}'}]
    
    duration = (time.time() - start_time) * 1000  # Badilisha kuwa ms
    
    # Fuatilia tukio la utafutaji
    telemetry.track_event('Search', {
        'query': query,
        'results_count': len(results),
        'duration_ms': duration
    })
    
    # Fuatilia kipimo cha utendaji wa utafutaji
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
        # Iga wito wa API wa nje
        response = requests.get('https://api.example.com/data', timeout=5)
        result = response.json()
    except Exception as e:
        success = False
        result = {'error': str(e)}
    
    duration = (time.time() - start_time) * 1000
    
    # Fuatilia utegemezi
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

### Jaribu Telemetri Maalum

```bash
# Fuatilia tukio la ununuzi
curl -X POST $APP_URL/api/purchase \
  -H "Content-Type: application/json" \
  -H "X-User-Id: user123" \
  -d '{"product_id": 1, "quantity": 2, "price": 29.99}'

# Fuatilia tukio la utafutaji
curl "$APP_URL/api/search?q=laptop"

# Fuatilia utegemezi wa nje
curl $APP_URL/api/external-call
```

**Tazama katika Azure Portal:**

Nenda kwenye Application Insights → Logs, kisha endesha:

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

## Somo 3: Ufuatiliaji Uliogawanyika kwa Microservices

### Washa ufuatiliaji kwa huduma mbalimbali

Kwa microservices, Application Insights kwa otomatiki huunganisha maombi kati ya huduma.

**Faili: `infra/main.bicep`**

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

### Angalia Miamala Kuanzia Mwisho Hadi Mwisho

```mermaid
sequenceDiagram
    participant User
    participant Gateway as Mlango wa API<br/>(ID ya Trasi: abc123)
    participant Product as Huduma ya Bidhaa<br/>(ID ya Mzazi: abc123)
    participant Order as Huduma ya Oda<br/>(ID ya Mzazi: abc123)
    participant AppInsights as Uchambuzi wa Programu
    
    User->>Gateway: POST /api/checkout
    Note over Gateway: Anzisha Trasi: abc123
    Gateway->>AppInsights: Rekodi ombi (ID ya Trasi: abc123)
    
    Gateway->>Product: GET /products/123
    Note over Product: ID ya Mzazi: abc123
    Product->>AppInsights: Rekodi wito wa utegemezi
    Product-->>Gateway: Maelezo ya bidhaa
    
    Gateway->>Order: POST /orders
    Note over Order: ID ya Mzazi: abc123
    Order->>AppInsights: Rekodi wito wa utegemezi
    Order-->>Gateway: Oda imeundwa
    
    Gateway-->>User: Kukamilika kwa malipo
    Gateway->>AppInsights: Rekodi majibu (Muda: 450ms)
    
    Note over AppInsights: Uhusianishaji kwa ID ya Trasi
```
**Uliza ufuatiliaji kutoka mwanzo hadi mwisho:**

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

## Somo 4: Vipimo Moja kwa Moja na Ufuatiliaji wa Wakati Halisi

### Washa Mtiririko wa Vipimo Moja kwa Moja

Live Metrics hutoa telemetri ya wakati halisi yenye ucheleweshaji wa <1 second.

**Pata Live Metrics:**

```bash
# Pata rasilimali ya Application Insights
APPI_NAME=$(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"')

# Pata kikundi cha rasilimali
RG_NAME=$(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"')

echo "Navigate to: Azure Portal → Resource Groups → $RG_NAME → $APPI_NAME → Live Metrics"
```

**Unachoona kwa wakati halisi:**
- ✅ Kiwango cha maombi yanayoingia (maombi/sec)
- ✅ Miito ya utegemezi inayoondoka
- ✅ Idadi ya makosa
- ✅ Matumizi ya CPU na kumbukumbu
- ✅ Idadi ya seva zilizo hai
- ✅ Sampuli ya telemetri

### Tengeneza Mzigo kwa Upimaji

```bash
# Tengeneza mzigo ili uone takwimu za wakati halisi
for i in {1..100}; do
  curl $APP_URL/api/products &
  curl $APP_URL/api/search?q=test$i &
done

# Tazama takwimu za wakati halisi katika Portal ya Azure
# Unapaswa kuona ongezeko la ghafla la kiwango cha maombi
```

---

## Mazoezi ya Vitendo

### Shughuli 1: Sanidi Arifu ⭐⭐ (Wastani)

**Lengo**: Tengeneza arifu kwa viwango vya juu vya makosa na majibu ya polepole.

**Hatua:**

1. **Unda arifu kwa kiwango cha makosa:**

```bash
# Pata ID ya rasilimali ya Application Insights
APPI_ID=$(az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "id" -o tsv)

# Unda onyo la kipimo kwa maombi yaliyoshindwa
az monitor metrics alert create \
  --name "High-Error-Rate" \
  --resource-group $RG_NAME \
  --scopes $APPI_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "Alert when error rate exceeds 10 per 5 minutes"
```

2. **Unda arifu kwa majibu ya polepole:**

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

3. **Unda arifu kupitia Bicep (inayopendekezwa kwa AZD):**

**Faili: `infra/core/alerts.bicep`**

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

4. **Jaribu arifu:**

```bash
# Zalisha makosa
for i in {1..20}; do
  curl $APP_URL/api/error-test
done

# Zalisha majibu polepole
for i in {1..10}; do
  curl $APP_URL/api/slow
done

# Angalia hali ya tahadhari (subiri dakika 5-10)
az monitor metrics alert list \
  --resource-group $RG_NAME \
  --query "[].{Name:name, Enabled:enabled, State:properties.enabled}" \
  --output table
```

**✅ Vigezo vya Mafanikio:**
- ✅ Arifu zimeundwa kwa mafanikio
- ✅ Arifu zinaanzishwa wakati vizingiti vinapovuka
- ✅ Unaweza kuona historia ya arifu katika Azure Portal
- ✅ Imeunganishwa na utoaji wa AZD

**Muda**: 20-25 minutes

---

### Shughuli 2: Tengeneza Dashibodi Maalum ⭐⭐ (Wastani)

**Lengo**: Jenga dashibodi inayonyesha vipimo muhimu vya programu.

**Hatua:**

1. **Tengeneza dashibodi kupitia Azure Portal:**

Nenda kwa: Azure Portal → Dashboards → New Dashboard

2. **Ongeza tile za vipimo muhimu:**

- Idadi ya maombi (masaa 24 yaliyopita)
- Muda wa majibu wa wastani
- Kiwango cha makosa
- Operesheni 5 zilizo polepole zaidi
- Usambazaji wa kijiografia wa watumiaji

3. **Tengeneza dashibodi kupitia Bicep:**

**Faili: `infra/core/dashboard.bicep`**

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

4. **Weka dashibodi:**

```bash
# Ongeza kwenye main.bicep
module dashboard './core/dashboard.bicep' = {
  name: 'dashboard'
  scope: rg
  params: {
    dashboardName: 'dashboard-${environmentName}'
    applicationInsightsId: monitoring.outputs.applicationInsightsId
    location: location
  }
}

# Sambaza
azd up
```

**✅ Vigezo vya Mafanikio:**
- ✅ Dashibodi inaonyesha vipimo muhimu
- ✅ Inaweza kupigwa alama kwenye ukurasa wa nyumbani wa Azure Portal
- ✅ Inasasishwa kwa wakati halisi
- ✅ Inayoweza kuwekwa kwa kutumia AZD

**Muda**: 25-30 minutes

---

### Shughuli 3: Fuatilia Programu za AI/LLM ⭐⭐⭐ (Chenye Ujuzi wa Juu)

**Lengo**: Fuata matumizi ya Azure OpenAI (tokens, gharama, ucheleweshaji).

**Hatua:**

1. **Tengeneza wrapper ya ufuatiliaji wa AI:**

**Faili: `src/ai_telemetry.py`**

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
            # Ita Azure OpenAI
            response = self.client.chat.completions.create(
                model=model,
                messages=messages,
                **kwargs
            )
            
            duration = (time.time() - start_time) * 1000  # ms
            
            # Toa matumizi
            usage = response.usage
            prompt_tokens = usage.prompt_tokens
            completion_tokens = usage.completion_tokens
            total_tokens = usage.total_tokens
            
            # Hesabu gharama (bei ya GPT-4)
            prompt_cost = (prompt_tokens / 1000) * 0.03  # $0.03 kwa 1K tokeni
            completion_cost = (completion_tokens / 1000) * 0.06  # $0.06 kwa 1K tokeni
            total_cost = prompt_cost + completion_cost
            
            # Fuatilia tukio maalum
            telemetry.track_event('OpenAI_Request', {
                'model': model,
                'prompt_tokens': prompt_tokens,
                'completion_tokens': completion_tokens,
                'total_tokens': total_tokens,
                'duration_ms': duration,
                'cost_usd': total_cost,
                'success': True
            })
            
            # Fuatilia vipimo
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

2. **Tumia mteja mwenye ufuatiliaji:**

```python
from flask import Flask, request, jsonify
from ai_telemetry import MonitoredAzureOpenAI
import os

app = Flask(__name__)

# Anzisha mteja wa OpenAI unaofuatiliwa
openai_client = MonitoredAzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

@app.route('/api/chat', methods=['POST'])
def chat():
    data = request.json
    user_message = data.get('message')
    
    # Ita kwa ufuatiliaji wa moja kwa moja
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

3. **Uliza vipimo vya AI:**

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

**✅ Vigezo vya Mafanikio:**
- ✅ Kila mwito wa OpenAI unafuatiliwa kwa otomatiki
- ✅ Matumizi ya tokens na gharama zinaonekana
- ✅ Ucheleweshaji unaofuatiliwa
- ✅ Inawezekana kuweka arifu za bajeti

**Muda**: 35-45 minutes

---

## Uboreshaji wa Gharama

### Mikakati ya Sampuli

Dhibiti gharama kwa kusampua telemetri:

```python
from opencensus.trace.samplers import ProbabilitySampler

# Maendeleo: sampuli 100%
sampler = ProbabilitySampler(rate=1.0)

# Uzalishaji: sampuli 10% (punguza gharama kwa 90%)
sampler = ProbabilitySampler(rate=0.1)

# Usampuli unaobadilika (hujirekebisha kiotomatiki)
from opencensus.trace.samplers import AdaptiveSampler
sampler = AdaptiveSampler()
```

**Katika Bicep:**

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  properties: {
    SamplingPercentage: 10  // 10% sampling
  }
}
```

### Uhifadhi wa Data

```bicep
resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: logAnalyticsName
  properties: {
    retentionInDays: 30  // Minimum (cheapest)
    // Options: 30, 31, 60, 90, 120, 180, 270, 365, 550, 730
  }
}
```

### Makadirio ya Gharama Kila Mwezi

| Kiasi cha Data | Uhifadhi | Gharama ya Kila Mwezi |
|-------------|-----------|--------------|
| 1 GB/mwezi | siku 30 | ~$2-5 |
| 5 GB/mwezi | siku 30 | ~$10-15 |
| 10 GB/mwezi | siku 90 | ~$25-40 |
| 50 GB/mwezi | siku 90 | ~$100-150 |

**Ngazi ya bure**: 5 GB/mwezi imejumuishwa

---

## Ukaguzi wa Maarifa

### 1. Uingizaji Msingi ✓

Jaribu uelewa wako:

- [ ] **Q1**: Je, AZD inatengeneza vipi Application Insights?
  - **A**: Kwa otomatiki kupitia templates za Bicep katika `infra/core/monitoring.bicep`

- [ ] **Q2**: Ni variable gani ya mazingira inayowezesha Application Insights?
  - **A**: `APPLICATIONINSIGHTS_CONNECTION_STRING`

- [ ] **Q3**: Ni aina gani tatu kuu za telemetri?
  - **A**: Requests (HTTP calls), Dependencies (external calls), Exceptions (errors)

**Uthibitisho wa Vitendo:**
```bash
# Angalia ikiwa Application Insights imesanidiwa
azd env get-values | grep APPLICATIONINSIGHTS

# Thibitisha kuwa telemetry inatiririka
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "requests/count"
```

---

### 2. Telemetri Maalum ✓

Jaribu uelewa wako:

- [ ] **Q1**: Unafuatiliaje matukio maalum ya biashara?
  - **A**: Tumia logger pamoja na `custom_dimensions` au `TelemetryClient.track_event()`

- [ ] **Q2**: Nini tofauti kati ya matukio na vipimo?
  - **A**: Matukio ni matukio ya pekee, vipimo ni vipimo vya kihesabu

- [ ] **Q3**: Unaunganisha vipi telemetri kati ya huduma?
  - **A**: Application Insights kwa otomatiki hutumia `operation_Id` kwa ajili ya kuunganisha

**Uthibitisho wa Vitendo:**
```kusto
// Verify custom events
traces
| where customDimensions.event_name != ""
| summarize count() by tostring(customDimensions.event_name)
```

---

### 3. Ufuatiliaji wa Uzalishaji ✓

Jaribu uelewa wako:

- [ ] **Q1**: Sampling ni nini na kwanini kuitumia?
  - **A**: Sampuli hupunguza kiasi cha data (na gharama) kwa kukamata sehemu tu ya telemetri

- [ ] **Q2**: Unawezaje kuanzisha arifu?
  - **A**: Tumia arifu za metric katika Bicep au Azure Portal kwa kuzingatia vipimo vya Application Insights

- [ ] **Q3**: Nini tofauti kati ya Log Analytics na Application Insights?
  - **A**: Application Insights huhifadhi data katika workspace ya Log Analytics; App Insights hutoa mtazamo maalum wa programu

**Uthibitisho wa Vitendo:**
```bash
# Kagua usanidi wa sampuli
az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "properties.SamplingPercentage"
```

---

## Mazoea Bora

### ✅ FANYA:

1. **Tumia vitambulisho vya ulinganisho (correlation IDs)**
   ```python
   logger.info('Processing order', extra={
       'custom_dimensions': {
           'order_id': order_id,
           'user_id': user_id
       }
   })
   ```

2. **Sanidi arifu kwa vipimo muhimu**
   ```bicep
   // Error rate, slow responses, availability
   ```

3. **Tumia uandishi wa logi uliopangwa**
   ```python
   # ✅ ZURI: Iliyopangwa
   logger.info('User signup', extra={'custom_dimensions': {'user_id': 123}})
   
   # ❌ MBAYA: Isiyo na muundo
   logger.info(f'User 123 signed up')
   ```

4. **Fuatilia utegemezi**
   ```python
   # Fuatilia kwa kiotomatiki miito ya hifadhidata, maombi ya HTTP, n.k.
   ```

5. **Tumia Live Metrics wakati wa utoaji**

### ❌ USIFANYE:

1. **Usiandike data nyeti katika logi**
   ```python
   # ❌ MBAYA
   logger.info(f'Login: {username}:{password}')
   
   # ✅ BORA
   logger.info('Login attempt', extra={'custom_dimensions': {'username': username}})
   ```

2. **Usitumie sampuli ya 100% katika uzalishaji**
   ```python
   # ❌ Ghali
   sampler = ProbabilitySampler(rate=1.0)
   
   # ✅ Inafaa kiuchumi
   sampler = ProbabilitySampler(rate=0.1)
   ```

3. **Usiache kuangalia dead letter queues**

4. **Usisahau kuweka mipaka ya uhifadhi wa data**

---

## Utatuzi wa Matatizo

### Tatizo: Hakuna telemetri inayoonekana

**Uchunguzi:**
```bash
# Angalia kwamba msururu wa muunganisho umewekwa
azd env get-values | grep APPLICATIONINSIGHTS

# Angalia kumbukumbu za programu kupitia Azure Monitor
azd monitor --logs

# Au tumia Azure CLI kwa Container Apps:
az containerapp logs show --name $APP_NAME --resource-group $RG_NAME --tail 50
```

**Suluhisho:**
```bash
# Thibitisha msururu wa muunganisho katika Programu ya Kontena
az containerapp show \
  --name $APP_NAME \
  --resource-group $RG_NAME \
  --query "properties.template.containers[0].env" \
  | grep -i applicationinsights
```

---

### Tatizo: Gharama za Juu

**Uchunguzi:**
```bash
# Kagua uingizaji wa data
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "availabilityResults/count"
```

**Suluhisho:**
- Punguza kiwango cha sampuli
- Punguza kipindi cha uhifadhi
- Ondoa uandishi wa logi wenye maelezo mengi

---

## Jifunze Zaidi

### Nyaraka Rasmi
- [Muhtasari wa Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Application Insights kwa Python](https://learn.microsoft.com/azure/azure-monitor/app/opencensus-python)
- [Kusto Query Language](https://learn.microsoft.com/azure/data-explorer/kusto/query/)
- [Ufuatiliaji wa AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/monitor-your-app)

### Hatua Zifuatazo Katika Kozi Hii
- ← Iliyotangulia: [Ukaguzi wa awali](preflight-checks.md)
- → Ifuatayo: [Mwongozo wa Utoaji](../chapter-04-infrastructure/deployment-guide.md)
- 🏠 [Nyumbani kwa Kozi](../../README.md)

### Mifano Inayohusiana
- [Azure OpenAI Example](../../../../examples/azure-openai-chat) - telemetri ya AI
- [Microservices Example](../../../../examples/microservices) - Ufuatiliaji uliogawanyika

---

## Muhtasari

**Umejifunza:**
- ✅ Utoaji wa Application Insights kwa otomatiki kwa AZD
- ✅ Telemetri maalum (matukio, vipimo, utegemezi)
- ✅ Ufuatiliaji uliogawanyika katika microservices
- ✅ Metiriki za moja kwa moja na ufuatiliaji wa wakati halisi
- ✅ Arifa na dashibodi
- ✅ Ufuatiliaji wa programu za AI/LLM
- ✅ Mikakati ya uboreshaji wa gharama

**Mambo Muhimu:**
1. **AZD hutoa ufuatiliaji kiotomatiki** - Hakuna usanidi wa mikono
2. **Tumia uandishi wa kumbukumbu uliopangwa** - Hufanya utafutaji kuwa rahisi
3. **Fuata matukio ya kibiashara** - Si metriki za kiufundi pekee
4. **Fuatilia gharama za AI** - Fuata tokens na matumizi
5. **Weka arifa** - Kuwa wa kujiandaa, si wa kujibu
6. **Boresha gharama** - Tumia sampuli na mipaka ya uhifadhi

**Hatua Zifuatazo:**
1. Kamilisha mazoezi ya vitendo
2. Ongeza Application Insights kwenye miradi yako ya AZD
3. Unda dashibodi maalum kwa timu yako
4. Jifunze [Mwongozo wa Utekelezaji](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Taarifa ya kutokuwajibika:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Nyaraka ya asili katika lugha yake inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, inashauriwa kutumia tafsiri ya kitaalamu iliyofanywa na mtafsiri wa binadamu. Hatuwajibiki kwa uelewa au tafsiri isiyo sahihi itokanayo na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->