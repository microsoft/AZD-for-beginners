# Uunganishaji wa Application Insights na AZD

⏱️ **Muda Unakadiriwa**: 40-50 dakika | 💰 **Athari ya Gharama**: ~$5-15/mwezi | ⭐ **Ugumu**: Wastani

**📚 Njia ya Kujifunza:**
- ← Iliyopita: [Preflight Checks](preflight-checks.md) - Uthibitishaji kabla ya uwasilishaji
- 🎯 **Uko Hapa**: Uunganishaji wa Application Insights (Ufuatiliaji, telemetri, utatuzi wa matatizo)
- → Ifuatayo: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Tekeleza kwenye Azure
- 🏠 [Course Home](../../README.md)

---

## Utakachojifunza

Kwa kukamilisha somo hili, utajifunza:
- Uunganisha **Application Insights** kwenye miradi ya AZD kiotomatiki
- Kusanidi **ufuatiliaji uliosambazwa** kwa microservices
- Kutekeleza **telemetri ya desturi** (metrik, matukio, utegemezi)
- Kuweka **metrik za papo hapo** kwa ufuatiliaji wa wakati halisi
- Kuunda **arifa na dashibodi** kutoka kwa utekelezaji wa AZD
- Kutatua matatizo ya uzalishaji kwa **maswali ya telemetri**
- Kuboresha **gharama na mikakati ya sampuli**
- Kufuatilia **programu za AI/LLM** (tokens, ucheleweshaji, gharama)

## Kwa Nini Application Insights na AZD Ni Muhimu

### Changamoto: Uwezo wa Kuonekana katika Uzalishaji

**Bila Application Insights:**
```
❌ No visibility into production behavior
❌ Manual log aggregation across services
❌ Reactive debugging (wait for customer complaints)
❌ No performance metrics
❌ Cannot trace requests across services
❌ Unknown failure rates and bottlenecks
```

**Kwa Application Insights + AZD:**
```
✅ Automatic telemetry collection
✅ Centralized logs from all services
✅ Proactive issue detection
✅ End-to-end request tracing
✅ Performance metrics and insights
✅ Real-time dashboards
✅ AZD provisions everything automatically
```

**Analojia**: Application Insights ni kama kuwa na rekoda ya ndege "black box" + dashibodi ya kokpiti kwa programu yako. Unaona kila kitu kinachotokea kwa wakati halisi na unaweza kuirudia tukio lolote.

---

## Muhtasari wa Usanifu

### Application Insights katika Usanifu wa AZD

```mermaid
graph TB
    User[Mtumiaji/Mteja]
    App1[Programu ya Kontena 1<br/>Mlango wa API]
    App2[Programu ya Kontena 2<br/>Huduma ya Bidhaa]
    App3[Programu ya Kontena 3<br/>Huduma ya Maagizo]
    
    AppInsights[Application Insights<br/>Kituo cha Telemetri]
    LogAnalytics[(Log Analytics<br/>Eneo la Kazi)]
    
    Portal[Azure Portal<br/>Dashibodi & Tahadhari]
    Query[Maswali ya Kusto<br/>Uchambuzi Maalum]
    
    User --> App1
    App1 --> App2
    App2 --> App3
    
    App1 -.->|Uwekaji otomatiki| AppInsights
    App2 -.->|Uwekaji otomatiki| AppInsights
    App3 -.->|Uwekaji otomatiki| AppInsights
    
    AppInsights --> LogAnalytics
    LogAnalytics --> Portal
    LogAnalytics --> Query
    
    style AppInsights fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
    style LogAnalytics fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
```
### Nini Kinachofuatiliwa Kiotomatiki

| Aina ya Telemetri | Kinachokamatwa | Matumizi |
|----------------|------------------|----------|
| **Requests** | maombi ya HTTP, nambari za hali, muda | ufuatiliaji wa utendaji wa API |
| **Dependencies** | miito ya nje (DB, APIs, uhifadhi) | tambua vikwazo |
| **Exceptions** | makosa yasiyotendwa na stack traces | utatuzi wa kushindwa |
| **Custom Events** | matukio ya kibiashara (signup, purchase) | uchambuzi na mafunneli |
| **Metrics** | counters za utendaji, metrik za desturi | upangaji wa uwezo |
| **Traces** | ujumbe za logi zenye uzito | utatuzi na ukaguzi |
| **Availability** | vipimo vya uptime na wakati wa majibu | ufuatiliaji wa SLA |

---

## Mahitaji ya Awali

### Zana Zinazohitajika

```bash
# Thibitisha Azure Developer CLI
azd version
# ✅ Inatarajiwa: azd toleo 1.0.0 au zaidi

# Thibitisha Azure CLI
az --version
# ✅ Inatarajiwa: azure-cli 2.50.0 au zaidi
```

### Mahitaji ya Azure

- Usajili wa Azure unaofanya kazi
- Ruhusa za kuunda:
  - Application Insights resources
  - Log Analytics workspaces
  - Container Apps
  - Resource groups

### Maarifa Yanayohitajika

Unapaswa kuwa umekamilisha:
- [AZD Basics](../chapter-01-foundation/azd-basics.md) - Ma dhana za msingi za AZD
- [Configuration](../chapter-03-configuration/configuration.md) - Usanidi wa mazingira
- [First Project](../chapter-01-foundation/first-project.md) - Utekelezaji wa msingi

---

## Somo 1: Application Insights ya Kiotomatiki na AZD

### Jinsi AZD Inavyotoa Application Insights

AZD huunda na kusanidi Application Insights kiotomatiki unapotekeleza. Hebu tazame jinsi inavyofanya kazi.

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

**Hivyo ndivyo!** AZD itaunda Application Insights kwa chaguo-msingi. Hakuna usanidi wa ziada unaohitajika kwa ufuatiliaji wa msingi.

---

### Hatua 2: Miundombinu ya Ufuatiliaji (Bicep)

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

### Hatua 3: Unganisha Container App na Application Insights

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

### Hatua 4: Msimbo wa Programu na Telemetri

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

# Pata mnyororo wa muunganisho wa Application Insights
connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

if connection_string:
    # Sanidi ufuatiliaji uliosambazwa
    middleware = FlaskMiddleware(
        app,
        exporter=AzureExporter(connection_string=connection_string),
        sampler=ProbabilitySampler(rate=1.0)  # Sampuli 100% kwa maendeleo
    )
    
    # Sanidi uandishi wa kumbukumbu
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
    
    # Kuigiza wito la hifadhidata (unafuatiliwa kiotomatiki kama utegemezi)
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
    time.sleep(3)  # Kuigiza operesheni ya taratibu
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

### Hatua 5: Tekeleza na Thibitisha

```bash
# Anzisha AZD
azd init

# Sambaza (huandaa Application Insights kiotomatiki)
azd up

# Pata URL ya programu
APP_URL=$(azd env get-values | grep API_URL | cut -d '=' -f2 | tr -d '"')

# Zalisha telemetri
curl $APP_URL/health
curl $APP_URL/api/products
curl $APP_URL/api/error-test
curl $APP_URL/api/slow
```

**✅ Matokeo yanayotarajiwa:**
```json
{
  "status": "healthy",
  "monitoring": "enabled"
}
```

---

### Hatua 6: Tazama Telemetri kwenye Azure Portal

```bash
# Pata maelezo ya Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Fungua kwenye Portal ya Azure
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"') \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"') \
  --query "appId" -o tsv
```

**Nenda kwenye Azure Portal → Application Insights → Transaction Search**

Unapaswa kuona:
- ✅ Maombi ya HTTP na nambari za hali
- ✅ Muda wa ombi (3+ sekunde kwa `/api/slow`)
- ✅ Maelezo ya makosa kutoka `/api/error-test`
- ✅ Ujumbe wa logi za desturi

---

## Somo 2: Telemetri ya Desturi na Matukio

### Fuata Matukio ya Kibiashara

Hebu tuongeze telemetri ya desturi kwa matukio muhimu ya kibiashara.

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

### Sasisha Programu kwa Matukio ya Desturi

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
    
    # Kuiga utafutaji (ingekuwa ombi halisi la hifadhidata)
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
        # Kuiga wito wa API ya nje
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

### Jaribu Telemetri ya Desturi

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

**Tazama kwenye Azure Portal:**

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

## Somo 3: Ufuatiliaji Uliosambazwa kwa Microservices

### Weka Ufuatiliaji wa Msalaba-Services

Kwa microservices, Application Insights huoanisha kiotomatiki maombi katika huduma mbalimbali.

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

### Tazama Muamala Kuanzia Mwisho-Mwisho

```mermaid
sequenceDiagram
    participant User
    participant Gateway as Mlango la API<br/>(Kitambulisho cha Ufuatiliaji: abc123)
    participant Product as Huduma ya Bidhaa<br/>(ID Mzazi: abc123)
    participant Order as Huduma ya Oda<br/>(ID Mzazi: abc123)
    participant AppInsights as Uchambuzi wa Programu
    
    User->>Gateway: POST /api/checkout
    Note over Gateway: Anza Ufuatiliaji: abc123
    Gateway->>AppInsights: Rekodi ombi (Kitambulisho cha Ufuatiliaji: abc123)
    
    Gateway->>Product: GET /products/123
    Note over Product: ID Mzazi: abc123
    Product->>AppInsights: Rekodi wito wa utegemezi
    Product-->>Gateway: Maelezo ya bidhaa
    
    Gateway->>Order: POST /orders
    Note over Order: ID Mzazi: abc123
    Order->>AppInsights: Rekodi wito wa utegemezi
    Order-->>Gateway: Oda imeundwa
    
    Gateway-->>User: Malipo yamekamilika
    Gateway->>AppInsights: Rekodi majibu (Muda: 450ms)
    
    Note over AppInsights: Ulinganifu kwa Kitambulisho cha Ufuatiliaji
```
**Uliza ufuatiliaji wa mwisho-mwisho:**

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

## Somo 4: Metriki za Moja kwa Moja na Ufuatiliaji wa Wakati Halisi

### Weka Mtiririko wa Metriki za Moja kwa Moja

Metriki za Moja kwa Moja zinatoa telemetri ya wakati halisi kwa ucheleweshaji <1 sekunde.

**Pata Metriki za Moja kwa Moja:**

```bash
# Pata rasilimali ya Application Insights
APPI_NAME=$(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"')

# Pata kundi la rasilimali
RG_NAME=$(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"')

echo "Navigate to: Azure Portal → Resource Groups → $RG_NAME → $APPI_NAME → Live Metrics"
```

**Unachokuona kwa wakati halisi:**
- ✅ Kiwango cha maombi yanayoingia (requests/sec)
- ✅ Miito ya utegemezi inayoenda nje
- ✅ Idadi ya makosa
- ✅ Matumizi ya CPU na memory
- ✅ Idadi ya server zilizo hai
- ✅ Sampuli ya telemetri

### Tengeneza Mzigo kwa Ajili ya Upimaji

```bash
# Unda mzigo ili kuona vipimo hai
for i in {1..100}; do
  curl $APP_URL/api/products &
  curl $APP_URL/api/search?q=test$i &
done

# Tazama vipimo hai katika Azure Portal
# Unapaswa kuona kiwango cha maombi kikiongezeka ghafla
```

---

## Mazoezi ya Vitendo

### Zoezi 1: Weka Arifa ⭐⭐ (Wastani)

**Lengo**: Tengeneza arifa kwa viwango vya makosa ya juu na majibu polepole.

**Hatua:**

1. **Tengeneza arifa kwa kiwango cha makosa:**

```bash
# Pata ID ya rasilimali ya Application Insights
APPI_ID=$(az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "id" -o tsv)

# Unda tahadhari ya kipimo kwa maombi yaliyoshindwa
az monitor metrics alert create \
  --name "High-Error-Rate" \
  --resource-group $RG_NAME \
  --scopes $APPI_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "Alert when error rate exceeds 10 per 5 minutes"
```

2. **Tengeneza arifa kwa majibu polepole:**

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

3. **Tengeneza arifa kupitia Bicep (inadokezwa kwa AZD):**

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

4. **Jaribu arifa:**

```bash
# Zalisha makosa
for i in {1..20}; do
  curl $APP_URL/api/error-test
done

# Zalisha majibu polepole
for i in {1..10}; do
  curl $APP_URL/api/slow
done

# Kagua hali ya arifa (subiri dakika 5-10)
az monitor metrics alert list \
  --resource-group $RG_NAME \
  --query "[].{Name:name, Enabled:enabled, State:properties.enabled}" \
  --output table
```

**✅ Vigezo vya Mafanikio:**
- ✅ Arifa zimeundwa kwa mafanikio
- ✅ Arifa zinaanza kufanya kazi wakati vigezo vinavuka
- ✅ Unaweza kuona historia ya arifa katika Azure Portal
- ✅ Zimeunganishwa na utekelezaji wa AZD

**Muda**: 20-25 dakika

---

### Zoezi 2: Tengeneza Dashibodi ya Desturi ⭐⭐ (Wastani)

**Lengo**: Jenga dashibodi inayonyesha metrik za msingi za programu.

**Hatua:**

1. **Tengeneza dashibodi kupitia Azure Portal:**

Nenda kwa: Azure Portal → Dashboards → New Dashboard

2. **Ongeza tiles kwa metrik kuu:**

- Idadi ya maombi (saa 24 zilizopita)
- Muda wa wastani wa majibu
- Kiwango cha makosa
- Operesheni 5 zenye polepole zaidi
- Usambazaji wa kijiografia wa watumiaji

3. **Tengeneza dashibodi kupitia Bicep:**

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

4. **Tekeleza dashibodi:**

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

# Tekeleza
azd up
```

**✅ Vigezo vya Mafanikio:**
- ✅ Dashibodi inaonyesha metrik kuu
- ✅ Inaweza kupigwa pini kwenye ukurasa kuu wa Azure Portal
- ✅ Inasasishwa kwa wakati halisi
- ✅ Inatekelezwa kupitia AZD

**Muda**: 25-30 dakika

---

### Zoezi 3: Fuatilia Programu ya AI/LLM ⭐⭐⭐ (Kiwango cha Juu)

**Lengo**: Fuatilia matumizi ya Microsoft Foundry Models (tokens, gharama, ucheleweshaji).

**Hatua:**

1. **Unda kifuniko cha ufuatiliaji wa AI:**

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
            # Iita mifano ya Microsoft Foundry
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
            
            # Hesabu gharama (bei ya gpt-4.1)
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

2. **Tumia mteja aliyefuatiliwa:**

```python
from flask import Flask, request, jsonify
from ai_telemetry import MonitoredAzureOpenAI
import os

app = Flask(__name__)

# Anzisha mteja wa OpenAI uliosimamiwa
openai_client = MonitoredAzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

@app.route('/api/chat', methods=['POST'])
def chat():
    data = request.json
    user_message = data.get('message')
    
    # Ita kwa ufuatiliaji wa kiotomatiki
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

3. **Uliza metrik za AI:**

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
- ✅ Kila antisho la OpenAI linafuatiliwa kiotomatiki
- ✅ Matumizi ya tokeni na gharama zinaonekana
- ✅ Ucheleweshaji unafuatiliwa
- ✅ Inawezekana kuweka arifa za bajeti

**Muda**: 35-45 dakika

---

## Uboreshaji wa Gharama

### Mikakati ya Sampuli

Dhibiti gharama kwa kutumia sampuli ya telemetri:

```python
from opencensus.trace.samplers import ProbabilitySampler

# Maendeleo: uchukuaji wa sampuli 100%
sampler = ProbabilitySampler(rate=1.0)

# Uzalishaji: uchukuaji wa sampuli 10% (punguza gharama kwa 90%)
sampler = ProbabilitySampler(rate=0.1)

# Uchukuaji wa sampuli unaobadilika (hujirekebisha kiotomatiki)
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

### Makadirio ya Gharama za Mwezi

| Kiasi cha Data | Uhifadhi | Gharama za Mwezi |
|-------------|-----------|--------------|
| 1 GB/month | 30 days | ~$2-5 |
| 5 GB/month | 30 days | ~$10-15 |
| 10 GB/month | 90 days | ~$25-40 |
| 50 GB/month | 90 days | ~$100-150 |

**Ngazi ya bure**: 5 GB/mwezi inajumuishwa

---

## Kiashiria cha Maarifa

### 1. Muunganisho Msingi ✓

Jaribu ufahamu wako:

- [ ] **Q1**: Jinsi gani AZD inatoa Application Insights?
  - **A**: Kiotomatiki kupitia templates za Bicep katika `infra/core/monitoring.bicep`

- [ ] **Q2**: Ni variable gani ya mazingira inayowezesha Application Insights?
  - **A**: `APPLICATIONINSIGHTS_CONNECTION_STRING`

- [ ] **Q3**: Ni aina gani tatu kuu za telemetri?
  - **A**: Requests (miito ya HTTP), Dependencies (miito ya nje), Exceptions (makosa)

**Uthibitisho wa Vitendo:**
```bash
# Angalia ikiwa Application Insights imewekwa
azd env get-values | grep APPLICATIONINSIGHTS

# Thibitisha kuwa telemetri inatiririka
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "requests/count"
```

---

### 2. Telemetri ya Desturi ✓

Jaribu ufahamu wako:

- [ ] **Q1**: Jinsi gani unafuata matukio ya kibiashara?
  - **A**: Tumia logger na `custom_dimensions` au `TelemetryClient.track_event()`

- [ ] **Q2**: Tofauti gani kati ya matukio na metrik?
  - **A**: Matukio ni matukio ya pekee, metrik ni vipimo vya nambari

- [ ] **Q3**: Jinsi gani unachanisha telemetri katika huduma mbalimbali?
  - **A**: Application Insights hutumia kiotomatiki `operation_Id` kwa ulinganishaji

**Uthibitisho wa Vitendo:**
```kusto
// Verify custom events
traces
| where customDimensions.event_name != ""
| summarize count() by tostring(customDimensions.event_name)
```

---

### 3. Ufuatiliaji wa Uzalishaji ✓

Jaribu ufahamu wako:

- [ ] **Q1**: Je, sampuli ni nini na kwa nini kuitumia?
  - **A**: Sampuli hupunguza kiasi cha data (na gharama) kwa kukamata asilimia tu ya telemetri

- [ ] **Q2**: Jinsi gani unaweka arifa?
  - **A**: Tumia metric alerts katika Bicep au Azure Portal kulingana na metrik za Application Insights

- [ ] **Q3**: Tofauti gani kati ya Log Analytics na Application Insights?
  - **A**: Application Insights inahifadhi data katika Log Analytics workspace; App Insights hutoa mitazamo maalum ya programu

**Uthibitisho wa Vitendo:**
```bash
# Angalia usanidi wa sampuli
az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "properties.SamplingPercentage"
```

---

## Mbinu Bora

### ✅ FANYA:

1. **Tumia correlation IDs**
   ```python
   logger.info('Processing order', extra={
       'custom_dimensions': {
           'order_id': order_id,
           'user_id': user_id
       }
   })
   ```

2. **Sanidi arifa kwa metrik muhimu**
   ```bicep
   // Error rate, slow responses, availability
   ```

3. **Tumia logging yenye muundo**
   ```python
   # ✅ BORA: Iliyopangwa
   logger.info('User signup', extra={'custom_dimensions': {'user_id': 123}})
   
   # ❌ BAYA: Isiyo na muundo
   logger.info(f'User 123 signed up')
   ```

4. **Fuatilia utegemezi**
   ```python
   # Fuatilia kwa otomatiki miito ya hifadhidata, maombi ya HTTP, n.k.
   ```

5. **Tumia Live Metrics wakati wa utekelezaji**

### ❌ USIFANYE:

1. **Usirekodi data nyeti**
   ```python
   # ❌ MBAYA
   logger.info(f'Login: {username}:{password}')
   
   # ✅ NZURI
   logger.info('Login attempt', extra={'custom_dimensions': {'username': username}})
   ```

2. **Usitumie 100% sampuli katika uzalishaji**
   ```python
   # ❌ Ghali
   sampler = ProbabilitySampler(rate=1.0)
   
   # ✅ Inafaa kiuchumi
   sampler = ProbabilitySampler(rate=0.1)
   ```

3. **Usiache queues za barua walioonekana kuwa "dead letter"**

4. **Usisahau kuweka mipaka ya uhifadhi wa data**

---

## Utatuzi wa Matatizo

### Tatizo: Hakuna telemetri inayoonekana

**Uchunguzi:**
```bash
# Hakikisha mnyororo wa muunganisho umewekwa
azd env get-values | grep APPLICATIONINSIGHTS

# Angalia kumbukumbu za programu kupitia Azure Monitor
azd monitor --logs

# Au tumia Azure CLI kwa Container Apps:
az containerapp logs show --name $APP_NAME --resource-group $RG_NAME --tail 50
```

**Suluhisho:**
```bash
# Thibitisha mstari wa muunganisho katika programu ya kontena
az containerapp show \
  --name $APP_NAME \
  --resource-group $RG_NAME \
  --query "properties.template.containers[0].env" \
  | grep -i applicationinsights
```

---

### Tatizo: Gharama za juu

**Uchunguzi:**
```bash
# Kagua upokeaji wa data
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "availabilityResults/count"
```

**Suluhisho:**
- Punguza kiwango cha sampuli
- Punguza kipindi cha uhifadhi
- Ondoa kurekodi kwa maelezo mengi

---

## Jifunze Zaidi

### Nyaraka Rasmi
- [Application Insights Overview](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Application Insights for Python](https://learn.microsoft.com/azure/azure-monitor/app/opencensus-python)
- [Kusto Query Language](https://learn.microsoft.com/azure/data-explorer/kusto/query/)
- [AZD Monitoring](https://learn.microsoft.com/azure/developer/azure-developer-cli/monitor-your-app)

### Hatua Ifuatayo Katika Kozi Hii
- ← Iliyopita: [Preflight Checks](preflight-checks.md)
- → Ifuatayo: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- 🏠 [Course Home](../../README.md)

### Mifano Inayohusiana
- [Microsoft Foundry Models Example](../../../../examples/azure-openai-chat) - telemetri ya AI
- [Microservices Example](../../../../examples/microservices) - ufuatiliaji uliosambazwa

---

## Muhtasari

**Umejifunza:**
- ✅ Uundaji wa Application Insights kiotomatiki na AZD
- ✅ Telemetri ya desturi (matukio, metrik, utegemezi)
- ✅ Ufuatiliaji uliosambazwa kwa microservices
- ✅ Metriki za papo hapo na ufuatiliaji wa wakati halisi
- ✅ Arifa na dashibodi
- ✅ Ufuatiliaji wa programu za AI/LLM
- ✅ Mikakati ya kuboresha gharama

**Mambo Muhimu:**
1. **AZD huweka ufuatiliaji kiotomatiki** - Hakuna usanidi wa mkono
2. **Tumia uandishi wa kumbukumbu uliopangwa** - Hufanya uchunguzi kuwa rahisi
3. **Fuata matukio ya biashara** - Sio tu vipimo vya kiufundi
4. **Fuatilia gharama za AI** - Fuata tokeni na matumizi
5. **Weka arifu** - Chukua hatua mapema, usisubiri
6. **Boresha gharama** - Tumia sampuli na mipaka ya uhifadhi

**Hatua Zifuatazo:**
1. Kamilisha mazoezi ya vitendo
2. Ongeza Application Insights kwenye miradi yako ya AZD
3. Tengeneza dashibodi maalum kwa timu yako
4. Jifunze [Mwongozo wa Utekelezaji](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tamko la kutokuhusika**:
Dokumenti hii imetafsiriwa kwa kutumia huduma ya utafsiri wa AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuwa sahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au ukosefu wa usahihi. Nyaraka ya asili katika lugha yake ya asili inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, inashauriwa kutafsiriwa na mtafsiri mtaalamu wa binadamu. Hatutawajibika kwa uelewa mbaya au tafsiri potofu zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->