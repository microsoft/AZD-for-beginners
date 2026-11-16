# Integrácia Application Insights s AZD

⏱️ **Odhadovaný čas**: 40-50 minút | 💰 **Dopad na náklady**: ~$5-15/mesiac | ⭐ **Zložitosť**: Stredne pokročilá

**📚 Učiaca sa cesta:**
- ← Predchádzajúce: [Preflight Checks](preflight-checks.md) - Pred nasadením validácia
- 🎯 **Ste tu**: Integrácia Application Insights (monitorovanie, telemetria, ladenie)
- → Nasledujúce: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Nasadenie do Azure
- 🏠 [Domovská stránka kurzu](../../README.md)

---

## Čo sa naučíte

Po dokončení tejto lekcie budete vedieť:
- Deklarovať **Application Insights** v infraštruktúre AZD a konfigurovať SDK instrumentáciu
- Nastaviť **distribuované trasovanie** pre mikroservisy
- Implementovať **vlastnú telemetriu** (metriky, udalosti, závislosti)
- Nastaviť **live metriky** pre monitorovanie v reálnom čase
- Vytvoriť **upozornenia a dashboardy** z nasadení AZD
- Ladiť produkčné problémy pomocou **telemetrických dopytov**
- Optimalizovať **náklady a sampling** stratégie
- Monitorovať **AI/LLM aplikácie** (tokeny, latencia, náklady)

## Prečo záleží na Application Insights s AZD

### Výzva: Produkčná pozorovateľnosť

**Bez Application Insights:**
```
❌ No visibility into production behavior
❌ Manual log aggregation across services
❌ Reactive debugging (wait for customer complaints)
❌ No performance metrics
❌ Cannot trace requests across services
❌ Unknown failure rates and bottlenecks
```

**S Application Insights + AZD:**
```
✅ Automatic telemetry collection
✅ Centralized logs from all services
✅ Proactive issue detection
✅ End-to-end request tracing
✅ Performance metrics and insights
✅ Real-time dashboards
✅ AZD provisions the monitoring declared in your templates
```

**Analógiou**: Application Insights je ako mať "čiernu skrinku" letu + palubnú dosku pre vašu aplikáciu. Vidíte všetko, čo sa deje v reálnom čase, a môžete prehrávať akúkoľvek udalosť.

---

## Prehľad architektúry

### Application Insights v architektúre AZD

```mermaid
graph TB
    User[User/Client]
    App1[Container App 1<br/>API Gateway]
    App2[Container App 2<br/>Product Service]
    App3[Container App 3<br/>Order Service]
    
    AppInsights[Application Insights<br/>Telemetry Hub]
    LogAnalytics[(Log Analytics<br/>Workspace)]
    
    Portal[Azure Portal<br/>Dashboards & Alerts]
    Query[Kusto Queries<br/>Custom Analysis]
    
    User --> App1
    App1 --> App2
    App2 --> App3
    
    App1 -.->|Auto-instrumentation| AppInsights
    App2 -.->|Auto-instrumentation| AppInsights
    App3 -.->|Auto-instrumentation| AppInsights
    
    AppInsights --> LogAnalytics
    LogAnalytics --> Portal
    LogAnalytics --> Query
    
    style AppInsights fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
    style LogAnalytics fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
```

### Čo sa monitoruje automaticky

Podporovaná auto-instrumentácia zachytáva požiadavky/závislosti pre instrumentované knižnice. Vlastné udalosti a metriky vyžadujú kód aplikácie; testy dostupnosti musia byť konfigurované samostatne. Nezachytáva každý riadok len preto, že zdroj existuje.

| Typ telemetrie | Čo zachytáva | Použitie |
|----------------|--------------|---------|
| **Požiadavky** | HTTP požiadavky, status kódy, trvanie | Monitorovanie výkonu API |
| **Závislosti** | Externé volania (DB, API, úložisko) | Identifikácia zúžených miest |
| **Výnimky** | Nezachytené chyby so stack trace | Ladenie chýb |
| **Vlastné udalosti** | Obchodné udalosti (registrácia, nákup) | Analytika a funnel |
| **Metriky** | Výkonové ukazovatele, vlastné metriky | Kapacitné plánovanie |
| **Trasy** | Log správy s vážnosťou | Ladenie a audit |
| **Dostupnosť** | Testy času prevádzky a odpovede | Monitorovanie SLA |

---

## Predpoklady

### Vyžadované nástroje

```bash
# Verify Azure Developer CLI
azd version
# Command reference baseline: azd 1.37.2

# Verify Azure CLI
az --version
# ✅ Expected: azure-cli 2.50.0 or higher
```

### Požiadavky Azure

- Aktívne Azure predplatné
- Povolenia na vytváranie:
  - Application Insights zdrojov
  - Log Analytics pracovných priestorov
  - Container Apps
  - Resource groups

### Vedomostné predpoklady

Mali by ste mať dokončené:
- [AZD základy](../chapter-01-foundation/azd-basics.md) - Základné koncepty AZD
- [Konfigurácia](../chapter-03-configuration/configuration.md) - Nastavenie prostredia
- [Prvý projekt](../chapter-01-foundation/first-project.md) - Základné nasadenie

---

## Lekcia 1: Automatické Application Insights s AZD

### Ako AZD poskytuje Application Insights

AZD poskytuje Application Insights **len keď infraštruktúra projektu ho deklaruje**. `azure.yaml` samostatne nevytvára monitorovanie alebo neinstrumentuje aplikačný kód.

> **Príklad rozsahu:** Táto lekcia obsahuje integračné fragmenty, nie kompletný projekt `monitored-app` v tomto repozitári. Dodajte hlavný template a mapovanie parametrov, prostredie Container Apps, konfiguráciu registry/obrázku a identity, Dockerfile a značky služieb pred nasadením. Neskoršie lekcie ukazujú alternatívne/rozširujúce fragmenty, nie sú to súbory, ktoré by sa dali všetky jednoducho prilepiť bez zmien. Začnite s funkčným [príkladom mikroservisov](../../../../examples/microservices), ak potrebujete spustiteľnú základňu.

### Štruktúra projektu

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

### Krok 1: Konfigurácia AZD (azure.yaml)

**Súbor: `azure.yaml`**

```yaml
name: monitored-app
metadata:
  template: monitored-app@1.0.0

services:
  api:
    project: ./src
    language: python
    host: containerapp

# Monitoring must be declared in infra/ and enabled in application code.
```

Toto deklaruje nasaditeľnú službu. Nasledujúca Bicep a SDK konfigurácia zabezpečuje monitorovanie; azd ich nepridáva implicitne.

---

### Krok 2: Monitorovacia infraštruktúra (Bicep)

**Súbor: `infra/core/monitoring.bicep`**

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
output applicationInsightsId string = applicationInsights.id
```

---

### Krok 3: Pripojiť Container App k Application Insights

**Súbor: `infra/app/api.bicep`**

```bicep
param name string
param location string
param tags object = {}
param containerAppsEnvironmentId string
param containerImage string
param applicationInsightsConnectionString string

resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: name
  location: location
  tags: tags
  properties: {
    managedEnvironmentId: containerAppsEnvironmentId
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
          image: containerImage // Supply an accessible image and registry authentication
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

### Krok 4: Aplikačný kód s telemetriou

**Súbor: `src/app.py`**

```python
from flask import Flask, request, jsonify
from azure.monitor.opentelemetry import configure_azure_monitor
import logging
import os

app = Flask(__name__)

# Get Application Insights connection string
connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

if connection_string:
    # Azure Monitor OpenTelemetry instruments supported libraries, including Flask.
    configure_azure_monitor(
        connection_string=connection_string,
        logger_name=__name__,
        enable_live_metrics=True
    )
    logger = logging.getLogger(__name__)
    logger.setLevel(logging.INFO)
    
    print("✅ Application Insights enabled")
else:
    logger = logging.getLogger(__name__)
    logger.setLevel(logging.INFO)
    print("⚠️ Application Insights not configured")

@app.route('/health')
def health():
    logger.info('Health check endpoint called')
    return jsonify({'status': 'healthy', 'monitoring': 'enabled' if connection_string else 'disabled'})

@app.route('/api/products')
def get_products():
    logger.info('Fetching products')
    
    # In-memory fixture: this is not a database dependency call.
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
    time.sleep(3)  # Simulate slow operation
    logger.warning('Endpoint took 3 seconds to respond')
    return jsonify({'message': 'Slow operation completed'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
```

**Súbor: `src/requirements.txt`**

```txt
Flask
azure-monitor-opentelemetry
gunicorn
requests
openai
```

Riešte závislosti vo vašom projekte, testujte ich spolu a zafixujte výsledné verzie. Nové projekty by mali používať Azure Monitor OpenTelemetry, nie už ukončených OpenCensus Python exporterov.

---

### Krok 5: Nasadiť a overiť

```bash
# Deploy only after completing and wiring the infrastructure fragments above
azd up

# Get app URL
APP_URL=$(azd env get-value API_URL) # Requires this output in main.bicep

# Generate telemetry
curl $APP_URL/health
curl $APP_URL/api/products
curl $APP_URL/api/error-test
curl $APP_URL/api/slow
```

**✅ Očakávaný výstup:**
```json
{
  "status": "healthy",
  "monitoring": "enabled"
}
```

---

### Krok 6: Zobraziť Telemetriu v Azure Portáli

```bash
# Get Application Insights details
azd env get-values | grep APPLICATIONINSIGHTS

# Open in Azure Portal
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"') \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"') \
  --query "appId" -o tsv
```

**Prejdite do Azure Portál → Application Insights → Transaction Search**

Mali by ste vidieť:
- ✅ HTTP požiadavky so stavovými kódmi
- ✅ Dĺžku požiadavky (3+ sekúnd pre `/api/slow`)
- ✅ Detaily výnimiek z `/api/error-test`
- ✅ Vlastné log správy

---

## Lekcia 2: Vlastná telemetria a udalosti

### Sledovanie obchodných udalostí

Pridajme vlastnú telemetriu pre obchodne kritické udalosti.

**Súbor: `src/telemetry.py`**

```python
from contextlib import contextmanager
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import metrics, trace
from opentelemetry.trace import SpanKind
import logging
import os

class TelemetryClient:
    """Custom telemetry client for Application Insights"""
    
    def __init__(self, connection_string=None):
        self.connection_string = connection_string or os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')
        
        # Configure once per process. If app.py already calls this, keep only
        # one configure_azure_monitor call and use logger_name='telemetry'.
        if self.connection_string:
            configure_azure_monitor(
                connection_string=self.connection_string,
                logger_name=__name__,
                enable_live_metrics=True
            )
        self.logger = logging.getLogger(__name__)
        self.logger.setLevel(logging.INFO)
        self.tracer = trace.get_tracer(__name__)
        self.meter = metrics.get_meter(__name__)
        self.instruments = {}
    
    def track_event(self, event_name: str, properties: dict = None):
        """Track custom business event"""
        properties = properties or {}
        self.logger.info(
            f"CustomEvent: {event_name}",
            extra={
                # OTel log attributes become customDimensions in App Insights.
                    'event_name': event_name,
                    **properties
            }
        )
    
    def track_metric(self, metric_name: str, value: float, properties: dict = None):
        """Track custom metric"""
        properties = properties or {}
        if metric_name not in self.instruments:
            self.instruments[metric_name] = self.meter.create_histogram(metric_name)
        self.instruments[metric_name].record(value, attributes=properties)
    
    @contextmanager
    def track_dependency(self, name: str):
        """Time the real operation inside a client span; exceptions mark failure."""
        with self.tracer.start_as_current_span(name, kind=SpanKind.CLIENT) as span:
            yield span

# Global telemetry client
telemetry = TelemetryClient()
```

### Aktualizovať aplikáciu o vlastné udalosti

**Súbor: `src/app.py` (vylepšený)**

Pridajte tieto trasy do existujúcej Flask aplikácie; zachovajte predchádzajúce health/test trasy. Skrátený blok nižšie ukazuje samostatnú aplikáciu pre prehľadnosť. Inicializácia telemetrie je teraz v `telemetry.py` — neinicializujte exportéry dvakrát.

```python
from flask import Flask, request, jsonify
from telemetry import telemetry
import time
import random
import os

app = Flask(__name__)

@app.route('/api/purchase', methods=['POST'])
def purchase():
    """Track purchase event with custom telemetry"""
    data = request.get_json(silent=True) or {}
    product_id = data.get('product_id')
    quantity = data.get('quantity', 1)
    price = data.get('price', 0)
    if not isinstance(quantity, int) or quantity < 1 or \
       not isinstance(price, (int, float)) or price < 0:
        return jsonify({'error': 'quantity and price must be non-negative numbers; quantity >= 1'}), 400
    
    # Track business event
    telemetry.track_event('Purchase', {
        'product_id': product_id,
        'quantity': quantity,
        'total_amount': price * quantity,
        'user_id': request.headers.get('X-User-Id', 'anonymous')
    })
    
    # Track revenue metric
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
    
    # Simulate search (would be real database query)
    results = [{'id': 1, 'name': f'Result for {query}'}]
    
    duration = (time.time() - start_time) * 1000  # Convert to ms
    
    # Track search event
    telemetry.track_event('Search', {
        'query': query,
        'results_count': len(results),
        'duration_ms': duration
    })
    
    # Track search performance metric
    telemetry.track_metric('SearchDuration', duration, {
        'query_length': len(query)
    })
    
    return jsonify({'results': results, 'count': len(results)})

@app.route('/api/external-call')
def external_call():
    """Track external API dependency"""
    import requests
    
    try:
        # Set an actual test endpoint; api.example.com is not a working API.
        with telemetry.track_dependency('ExternalAPI'):
            response = requests.get(os.environ['EXTERNAL_API_URL'], timeout=5)
            response.raise_for_status()
            result = response.json()
    except Exception as e:
        return jsonify({'error': 'External dependency failed'}), 502
    
    return jsonify(result)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
```

### Testovanie vlastnej telemetrie

```bash
# Track purchase event
curl -X POST $APP_URL/api/purchase \
  -H "Content-Type: application/json" \
  -H "X-User-Id: user123" \
  -d '{"product_id": 1, "quantity": 2, "price": 29.99}'

# Track search event
curl "$APP_URL/api/search?q=laptop"

# Track external dependency
curl $APP_URL/api/external-call
```

**Zobraziť v Azure Portáli:**

Prejdite do Application Insights → Logs, potom spustite:

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

// Revenue recorded in Purchase events (not a billing ledger)
traces
| where customDimensions.event_name == "Purchase"
| summarize TotalRevenue = sum(todouble(customDimensions.total_amount)) by bin(timestamp, 1h)
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

## Lekcia 3: Distribuované trasovanie pre mikroservisy

### Zapnúť cross-service trasovanie

S kompatibilnou instrumentáciou a W3C trace-context propagáciou Application Insights koreluje požiadavky medzi službami. Len zdieľanie connection stringu nezabezpečuje parent-child span-y. Nasledujúci fragment architektúry odkazuje na moduly, ktoré musíte implementovať.

**Súbor: `infra/main.bicep`**

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

### Zobraziť end-to-end transakciu

```mermaid
sequenceDiagram
    participant User
    participant Gateway as API Gateway<br/>(Trace ID: abc123)
    participant Product as Product Service<br/>(Parent ID: abc123)
    participant Order as Order Service<br/>(Parent ID: abc123)
    participant AppInsights as Application Insights
    
    User->>Gateway: POST /api/checkout
    Note over Gateway: Start Trace: abc123
    Gateway->>AppInsights: Log request (Trace ID: abc123)
    
    Gateway->>Product: GET /products/123
    Note over Product: Parent ID: abc123
    Product->>AppInsights: Log dependency call
    Product-->>Gateway: Product details
    
    Gateway->>Order: POST /orders
    Note over Order: Parent ID: abc123
    Order->>AppInsights: Log dependency call
    Order-->>Gateway: Order created
    
    Gateway-->>User: Checkout complete
    Gateway->>AppInsights: Log response (Duration: 450ms)
    
    Note over AppInsights: Correlation by Trace ID
```

**Dopyt end-to-end trace:**

```kusto
// Find complete request flow
let traceId = "abc123...";  // Copy operation_Id from a request in Application Insights
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

## Lekcia 4: Live metriky a monitorovanie v reálnom čase

### Zapnúť Live Metrics Stream

Live Metrics poskytujú takmer v reálnom čase telemetriu, keď je podporovaná a SDK je aktivované. Nie je to latencia SLA. Nastavenie Python OpenTelemetry vyššie používa `enable_live_metrics=True` na zapnutie.

**Prístup k Live Metrix:**

```bash
# Get Application Insights resource
APPI_NAME=$(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"')

# Get resource group
RG_NAME=$(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"')

echo "Navigate to: Azure Portal → Resource Groups → $RG_NAME → $APPI_NAME → Live Metrics"
```

**Čo vidíte v reálnom čase:**
- ✅ Rýchlosť prichádzajúcich požiadaviek (požiadavky/sek)
- ✅ Odchádzajúce závislosti
- ✅ Počet výnimiek
- ✅ Využitie CPU a pamäte
- ✅ Počet aktívnych serverov
- ✅ Vzorky telemetrie

### Generovanie záťaže na testovanie

```bash
# Generate load to see live metrics
for i in {1..100}; do
  curl --silent --max-time 10 "$APP_URL/api/products"
  curl --silent --max-time 10 "$APP_URL/api/search?q=test$i"
done

# Watch live metrics in Azure Portal
# You should see request rate spike
```

---

## Praktické cvičenia

### Cvičenie 1: Nastaviť upozornenia ⭐⭐ (Stredne)

**Cieľ**: Vytvoriť upozornenia na vysoké chyby a pomalé odozvy.

**Kroky:**

1. **Vytvoriť upozornenie na mieru chýb:**

```bash
# Get Application Insights resource ID
APPI_ID=$(az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "id" -o tsv)

# Create metric alert for failed requests
az monitor metrics alert create \
  --name "High-Error-Rate" \
  --resource-group $RG_NAME \
  --scopes $APPI_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "Alert when failed request count exceeds 10 per 5 minutes"
```

2. **Vytvoriť upozornenie na pomalú odozvu:**

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

3. **Vytvoriť upozornenie cez Bicep (preferované pre AZD):**

**Súbor: `infra/core/alerts.bicep`**

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

4. **Testovať upozornenia:**

```bash
# Generate errors
for i in {1..20}; do
  curl $APP_URL/api/error-test
done

# Generate slow responses
for i in {1..10}; do
  curl $APP_URL/api/slow
done

# Check rule configuration (not fired/resolved alert-instance history)
az monitor metrics alert list \
  --resource-group $RG_NAME \
  --query "[].{Name:name, Enabled:enabled}" \
  --output table
```

**✅ Kritériá úspechu:**
- ✅ Upozornenia úspešne vytvorené
- ✅ Upozornenia sa spustia pri prekročení prahov
- ✅ História upozornení viditeľná v Azure Portáli
- ✅ Integrované s nasadením AZD

**Čas**: 20-25 minút

---

### Cvičenie 2: Vytvoriť vlastný dashboard ⭐⭐ (Stredne)

**Cieľ**: Vytvoriť dashboard zobrazujúci kľúčové metriky aplikácie.

**Kroky:**

1. **Vytvoriť dashboard cez Azure Portál:**

Prejdite do: Azure Portál → Dashboardy → Nový dashboard

2. **Pridať dlaždice pre kľúčové metriky:**

- Počet požiadaviek (posledných 24 hodín)
- Priemerný čas odozvy
- Miera chýb
- Top 5 najpomalších operácií
- Geografické rozloženie používateľov

3. **Vytvoriť dashboard cez Bicep:**

**Súbor: `infra/core/dashboard.bicep`**

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
            position: {
              x: 0
              y: 0
              rowSpan: 4
              colSpan: 6
            }
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
            position: {
              x: 6
              y: 0
              rowSpan: 4
              colSpan: 6
            }
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

4. **Nasadiť dashboard:**

```bicep
// Add to a subscription-scoped main.bicep with rg and monitoring declared
module dashboard './core/dashboard.bicep' = {
  name: 'dashboard'
  scope: rg
  params: {
    dashboardName: 'dashboard-${environmentName}'
    applicationInsightsId: monitoring.outputs.applicationInsightsId
    location: location
  }
}
```

```bash
# Deploy
azd up
```

**✅ Kritériá úspechu:**
- ✅ Dashboard zobrazuje kľúčové metriky
- ✅ Možné pripnúť na domovskú stránku Azure Portálu
- ✅ Aktualizácie v reálnom čase
- ✅ Nasaditeľné cez AZD

**Čas**: 25-30 minút

---

### Cvičenie 3: Monitorovanie AI/LLM aplikácie ⭐⭐⭐ (Pokročilé)

**Cieľ**: Sledovať používanie Microsoft Foundry Models (tokeny, náklady, latencia).

**Kroky:**

1. **Vytvoriť wrapper monitorujúci AI:**

**Súbor: `src/ai_telemetry.py`**

```python
from telemetry import telemetry
from openai import AzureOpenAI
import time

class MonitoredAzureOpenAI:
    """Microsoft Foundry Models client with automatic telemetry"""
    
    def __init__(self, api_key, endpoint, input_usd_per_million,
                 output_usd_per_million, api_version="2024-10-21"):
        self.client = AzureOpenAI(
            api_key=api_key,
            api_version=api_version,
            azure_endpoint=endpoint
        )
        self.input_rate = input_usd_per_million
        self.output_rate = output_usd_per_million
    
    def chat_completion(self, model: str, messages: list, **kwargs):
        """Track chat completion with telemetry"""
        start_time = time.time()
        
        try:
            # Call Microsoft Foundry Models
            response = self.client.chat.completions.create(
                model=model,
                messages=messages,
                **kwargs
            )
            
            duration = (time.time() - start_time) * 1000  # ms
            
            # Extract usage
            usage = response.usage
            prompt_tokens = usage.prompt_tokens
            completion_tokens = usage.completion_tokens
            total_tokens = usage.total_tokens
            
            # Approximation: supply actual deployment/region/contract rates.
            # Cached input, batch, provisioned and other charges need separate accounting.
            prompt_cost = (prompt_tokens / 1_000_000) * self.input_rate
            completion_cost = (completion_tokens / 1_000_000) * self.output_rate
            total_cost = prompt_cost + completion_cost
            
            # Track custom event
            telemetry.track_event('OpenAI_Request', {
                'model': model,
                'prompt_tokens': prompt_tokens,
                'completion_tokens': completion_tokens,
                'total_tokens': total_tokens,
                'duration_ms': duration,
                'cost_usd': total_cost,
                'success': True
            })
            
            # Track metrics
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

2. **Použiť monitorovaného klienta:**

```python
from flask import Flask, request, jsonify
from ai_telemetry import MonitoredAzureOpenAI
import os

app = Flask(__name__)

# Initialize monitored OpenAI client
openai_client = MonitoredAzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    endpoint=os.environ['AZURE_OPENAI_ENDPOINT'],
    input_usd_per_million=float(os.environ['INPUT_USD_PER_MILLION']),
    output_usd_per_million=float(os.environ['OUTPUT_USD_PER_MILLION'])
)

@app.route('/api/chat', methods=['POST'])
def chat():
    data = request.json
    user_message = data.get('message')
    
    # Call with automatic monitoring
    response = openai_client.chat_completion(
        model=os.environ['AZURE_OPENAI_DEPLOYMENT'], # Deployment name, not catalog ID
        messages=[
            {'role': 'user', 'content': user_message}
        ]
    )
    
    return jsonify({
        'response': response.choices[0].message.content,
        'tokens': response.usage.total_tokens
    })
```

3. **Dopytovať AI metriky:**

```kusto
// Total AI spend over time
traces
| where customDimensions.event_name == "OpenAI_Request"
| where tobool(customDimensions.success) == true
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

**✅ Kritériá úspechu:**
- ✅ Každé volanie OpenAI sledované automaticky
- ✅ Použitie tokenov a náklady viditeľné
- ✅ Latencia monitorovaná
- ✅ Možnosť nastaviť upozornenia na rozpočet

**Čas**: 35-45 minút

---

## Optimalizácia nákladov

### Sampling stratégie

Regulujte náklady pomocou sampling telemetrie:

```python
import os

# Configure before the one configure_azure_monitor() call in your process.
os.environ["OTEL_TRACES_SAMPLER"] = "microsoft.fixed_percentage"
os.environ["OTEL_TRACES_SAMPLER_ARG"] = "0.1" # 10% trace sampling
```

Sampling trace neznižuje každú telemetriu o 90 %. Metriky a samostatne emitované logy potrebujú vlastné ovládanie objemu. Vyberte mieru podľa potrieb pozorovateľnosti, nie ako všeobecnú produkčnú zákazku.

Explicitne nastavte sampling v SDK; vlastnosť komponentu `SamplingPercentage` nie je náhradou za konfiguráciu sampleru v Python OpenTelemetry.

### Uchovávanie dát

```bicep
resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: logAnalyticsName
  properties: {
    retentionInDays: 30  // Minimum (cheapest)
    // Options: 30, 31, 60, 90, 120, 180, 270, 365, 550, 730
  }
}
```

### Mesačné odhady nákladov

| Objem dát | Uchovávanie | Mesačné náklady |
|-----------|-------------|------------------|
| 1 GB/mesiac | 30 dní | ~$2-5 |
| 5 GB/mesiac | 30 dní | ~$10-15 |
| 10 GB/mesiac | 90 dní | ~$25-40 |
| 50 GB/mesiac | 90 dní | ~$100-150 |

Tieto čísla sú ilustratívne, nie cenové ponuky. Overte si príjmy, uchovávanie, upozornenia a ceny testov vo vašom regióne a zmluve; bezplatné limity sú zdieľané/obmedzené podľa ceny Azure Monitor, nie garantované SKU zdarma na každú Application Insights službu.

---

## Skúška vedomostí

### 1. Základná integrácia ✓

Otestujte svoje znalosti:

- [ ] **Otázka 1**: Ako AZD poskytuje Application Insights?
  - **Odpoveď**: Nasadzuje monitorovacie zdroje explicitne deklarované Bicep/Terraform šablónami projektu.

- [ ] **Otázka 2**: Ktorá env premenná zapína Application Insights?
  - **Odpoveď**: `APPLICATIONINSIGHTS_CONNECTION_STRING`

- [ ] **Otázka 3**: Aké sú tri hlavné typy telemetrie?
  - **Odpoveď**: Požiadavky (HTTP volania), Závislosti (externé volania), Výnimky (chyby)

**Overenie praxou:**
```bash
# Check if Application Insights is configured
azd env get-values | grep APPLICATIONINSIGHTS

# Verify telemetry is flowing
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "requests/count"
```

---

### 2. Vlastná telemetria ✓

Otestujte svoje znalosti:

- [ ] **Otázka 1**: Ako sledujete vlastné obchodné udalosti?
  - **Odpoveď**: Wrapper tejto lekcie zapisuje štruktúrované OTel logy s `event_name` atribútmi, ktoré sa dajú dopytovať v `traces`; nie sú automaticky `customEvents`.

- [ ] **Otázka 2**: Aký je rozdiel medzi udalosťami a metrikami?
  - **Odpoveď**: Udalosti sú jednotlivé výskyty, metriky sú číselné merania

- [ ] **Otázka 3**: Ako korelujete telemetriu medzi službami?
  - **Odpoveď**: Application Insights používa automaticky `operation_Id` pre koreláciu

**Overenie praxou:**
```kusto
// Verify custom events
traces
| where customDimensions.event_name != ""
| summarize count() by tostring(customDimensions.event_name)
```

---

### 3. Produkčné monitorovanie ✓

Otestujte svoje znalosti:

- [ ] **Otázka 1**: Čo je sampling a prečo ho používať?
  - **Odpoveď**: Sampling znižuje objem dát (a náklady) tým, že zachytáva len časť telemetrie

- [ ] **Otázka 2**: Ako nastavíte upozornenia?
  - **Odpoveď**: Použite metrické upozornenia v Bicep alebo Azure Portáli na metriky Application Insights

- [ ] **Otázka 3**: Aký je rozdiel medzi Log Analytics a Application Insights?
  - **Odpoveď**: Application Insights ukladá dáta do Log Analytics workspace; App Insights poskytuje pohľady špecifické pre aplikáciu

**Overenie praxou:**
```bash
# Check the sampler configured for the running application, not only the ARM component.
az containerapp show --name "$APP_NAME" --resource-group "$RG_NAME" \
  --query "properties.template.containers[].env[?starts_with(name, 'OTEL_TRACES_SAMPLER')]"
```

---

## Najlepšie postupy

### ✅ ROBIŤ:

1. **Používať korelačné ID**
   ```python
   logger.info('Processing order', extra={
           'order_id': order_id,
           'user_id': user_id
   })
   ```

2. **Nastaviť upozornenia na kritické metriky**
   ```bicep
   // Error rate, slow responses, availability
   ```

3. **Používať štruktúrované logovanie**
   ```python
   # ✅ GOOD: Structured
   logger.info('User signup', extra={'user_id': 'pseudonymous-id'})
   
   # ❌ BAD: Unstructured
   logger.info(f'User 123 signed up')
   ```

4. **Monitorovať závislosti**
   ```python
   # Automatically track database calls, HTTP requests, etc.
   ```

5. **Používať Live Metrics počas nasadení**

### ❌ NEROBIŤ:

1. **Nezaznamenávajte citlivé údaje**
   ```python
   # ❌ BAD
   logger.info(f'Login: {username}:{password}')
   
   # ✅ GOOD
   logger.info('Login attempt', extra={'result': 'failed'})
   ```

2. **Nevyberajte vzorkovanie bez merania objemu a diagnostických potrieb**
   ```python
   # ❌ Expensive
   # 100% traces may be appropriate for a small workload or investigation.
   
   # ✅ Cost-effective
   # A lower trace rate reduces visibility; validate coverage before enabling.
   ```

3. **Neprehliadajte dead letter queue (fronty mŕtvych správ)**

4. **Nezabudnite nastaviť limity uchovávania údajov**

---

## Riešenie problémov

### Problém: Žiadna telemetria sa nezobrazuje

**Diagnóza:**
```bash
# Check connection string is set
azd env get-values | grep APPLICATIONINSIGHTS

# Check application logs via Azure Monitor
azd monitor --logs

# Or use Azure CLI for Container Apps:
az containerapp logs show --name $APP_NAME --resource-group $RG_NAME --tail 50
```

**Riešenie:**
```bash
# Verify connection string in Container App
az containerapp show \
  --name $APP_NAME \
  --resource-group $RG_NAME \
  --query "properties.template.containers[0].env" \
  | grep -i applicationinsights
```

---

### Problém: Vysoké náklady

**Diagnóza:**
```bash
# Query ingestion volume in the linked Log Analytics workspace.
# WORKSPACE_ID is the workspace customer ID (GUID), not its ARM resource ID.
az monitor log-analytics query --workspace "$WORKSPACE_ID" \
  --analytics-query "Usage | where TimeGenerated > ago(30d) | where IsBillable == true | summarize IngestedMB=sum(Quantity) by DataType"
```

**Riešenie:**
- Znížte mieru vzorkovania
- Skráťte dobu uchovávania
- Odstráňte detailné logovanie

---

## Zistiť viac

### Oficiálna dokumentácia
- [Prehľad Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Nastavenie Azure Monitor OpenTelemetry](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python)
- [Jazyk Kusto Query Language](https://learn.microsoft.com/azure/data-explorer/kusto/query/)
- [Monitorovanie AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/monitor-your-app)

### Ďalšie kroky v tomto kurze
- ← Predchádzajúce: [Preflight Checks](preflight-checks.md)
- → Ďalšie: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- 🏠 [Domovská stránka kurzu](../../README.md)

### Súvisiace príklady
- [Microsoft Foundry Models Example](../../../../examples/azure-openai-chat) - AI telemetria
- [Microservices Example](../../../../examples/microservices) - Distribuované trasovanie

---

## Zhrnutie

**Naučili ste sa:**
- ✅ Automatické nastavovanie Application Insights pomocou AZD
- ✅ Vlastná telemetria (udalosti, metriky, závislosti)
- ✅ Distribuované trasovanie cez mikro-služby
- ✅ Živé metriky a monitorovanie v reálnom čase
- ✅ Upozornenia a dashboardy
- ✅ Monitorovanie AI/LLM aplikácií
- ✅ Stratégie optimalizácie nákladov

**Kľúčové body:**
1. **Explicitne deklarujte monitorovanie** - AZD nasadí vaše šablóny; SDK inštrumentácia odosiela telemetriu
2. **Používajte štruktúrované logovanie** - Uľahčuje dotazovanie
3. **Sledujte obchodné udalosti** - Nielen technické metriky
4. **Monitorujte náklady na AI** - Sledujte tokeny a výdavky
5. **Nastavte upozornenia** - Buďte proaktívni, nie reaktívni
6. **Optimalizujte náklady** - Používajte vzorkovanie a limity uchovávania

**Ďalšie kroky:**
1. Dokončite praktické cvičenia
2. Pridajte Application Insights do svojich projektov AZD
3. Vytvorte vlastné dashboardy pre svoj tím
4. Naučte sa [Príručku nasadenia](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->