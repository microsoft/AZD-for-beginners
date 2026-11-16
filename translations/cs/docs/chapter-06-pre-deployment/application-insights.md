# Integrace Application Insights s AZD

⏱️ **Odhadovaný čas**: 40-50 minut | 💰 **Dopad na náklady**: ~$5-15/měsíc | ⭐ **Složitost**: Střední

**📚 Vzdělávací cesta:**
- ← Předchozí: [Preflight Checky](preflight-checks.md) - Před nasazením validace
- 🎯 **Jste zde**: Integrace Application Insights (monitorování, telemetrie, ladění)
- → Další: [Průvodce nasazením](../chapter-04-infrastructure/deployment-guide.md) - Nasazení do Azure
- 🏠 [Domovská stránka kurzu](../../README.md)

---

## Co se naučíte

Dokončením této lekce:
- Deklarujete **Application Insights** v infrastruktuře AZD a nakonfigurujete SDK instrumentaci
- Nastavíte **distribuované trasování** pro mikroservisy
- Implementujete **vlastní telemetrii** (metriky, události, závislosti)
- Nastavíte **live metriky** pro monitorování v reálném čase
- Vytvoříte **alerty a dashboardy** z nasazení přes AZD
- Ladíte produkční problémy pomocí **telemetrických dotazů**
- Optimalizujete **náklady a strategie vzorkování**
- Sledujete **AI/LLM aplikace** (tokeny, latence, náklady)

## Proč je Application Insights s AZD důležité

### Výzva: Produkční pozorovatelnost

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

**Analogie**: Application Insights je jako mít „černou skříňku“ a přístrojový panel kokpitu pro vaši aplikaci. Vidíte vše, co se děje v reálném čase a můžete si přehrát jakoukoli událost.

---

## Přehled architektury

### Application Insights v architektuře AZD

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

### Co se monitoruje automaticky

Podporovaná automatická instrumentace zachycuje požadavky/závislosti pro instrumentované knihovny. Vlastní události a metriky vyžadují aplikační kód; testy dostupnosti musí být nastaveny samostatně. Není shromažďováno vše níže jen proto, že existuje zdroj.

| Typ telemetrie | Co zachytává | Použití |
|----------------|--------------|---------|
| **Požadavky** | HTTP požadavky, status kódy, doba trvání | Monitorování výkonu API |
| **Závislosti** | Vnější volání (DB, API, úložiště) | Identifikace úzkých míst |
| **Výjimky** | Nezachycené chyby s trasami zásobníku | Ladění chyb |
| **Vlastní události** | Obchodní události (registrace, nákup) | Analýzy a funnelky |
| **Metriky** | Výkonnostní ukazatele, vlastní metriky | Plánování kapacity |
| **Záznamy (Traces)** | Zprávy s úrovní závažnosti | Ladění a audit |
| **Dostupnost** | Testy provozuschopnosti a doby odezvy | Monitorování SLA |

---

## Předpoklady

### Požadované nástroje

```bash
# Verify Azure Developer CLI
azd version
# Command reference baseline: azd 1.37.2

# Verify Azure CLI
az --version
# ✅ Expected: azure-cli 2.50.0 or higher
```

### Požadavky Azure

- Aktivní předplatné Azure
- Oprávnění k vytvoření:
  - Resource Application Insights
  - Pracovní prostory Log Analytics
  - Container Apps
  - Skupiny prostředků

### Znalostní předpoklady

Měli byste mít dokončeno:
- [Základy AZD](../chapter-01-foundation/azd-basics.md) - Základní koncepty AZD
- [Konfigurace](../chapter-03-configuration/configuration.md) - Nastavení prostředí
- [První projekt](../chapter-01-foundation/first-project.md) - Základní nasazení

---

## Lekce 1: Automatické Application Insights s AZD

### Jak AZD zajišťuje Application Insights

AZD zajišťuje Application Insights **pouze pokud je to ve struktuře projektu deklarováno**. `azure.yaml` samo o sobě nevytváří monitorování ani neinstrumentuje aplikační kód.

> **Příklad rozsahu:** Tato lekce obsahuje integrační útržky, nikoli kompletní `monitored-app` projekt v tomto repozitáři. Dodržte hlavní šablonu a mapování parametrů, prostředí Container Apps, konfiguraci registru/obrazu a identity, Dockerfile a tagy služby před nasazením. Pozdější lekce ukazují alternativní/rozšířené útržky, nikoli soubory, které všechny lze bez úprav vložit dohromady. Začněte s funkčním [příklad mikroservis](../../../../examples/microservices), pokud potřebujete spustitelnou základnu.

### Struktura projektu

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

### Krok 1: Konfigurace AZD (azure.yaml)

**Soubor: `azure.yaml`**

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

Tento deklaruje nasaditelnou službu. Následující konfigurace Bicep a SDK zajišťují monitorování; azd je implicitně nepřidává.

---

### Krok 2: Monitorovací infrastruktura (Bicep)

**Soubor: `infra/core/monitoring.bicep`**

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

### Krok 3: Připojení Container App k Application Insights

**Soubor: `infra/app/api.bicep`**

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

### Krok 4: Aplikační kód s telemetrií

**Soubor: `src/app.py`**

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

**Soubor: `src/requirements.txt`**

```txt
Flask
azure-monitor-opentelemetry
gunicorn
requests
openai
```

Vyřešte tyto závislosti ve svém projektu, otestujte je společně a zamkněte výsledné verze. Nové projekty by měly používat Azure Monitor OpenTelemetry, ne již nepodporované OpenCensus Python exportéry.

---

### Krok 5: Nasazení a ověření

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

**✅ Očekávaný výstup:**
```json
{
  "status": "healthy",
  "monitoring": "enabled"
}
```

---

### Krok 6: Zobrazení telemetrie v Azure Portal

```bash
# Get Application Insights details
azd env get-values | grep APPLICATIONINSIGHTS

# Open in Azure Portal
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"') \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"') \
  --query "appId" -o tsv
```

**Přejděte do Azure Portal → Application Insights → Transaction Search**

Měli byste vidět:
- ✅ HTTP požadavky s status kódy
- ✅ Délku požadavku (3+ sekundy pro `/api/slow`)
- ✅ Podrobnosti o výjimkách z `/api/error-test`
- ✅ Vlastní logovací zprávy

---

## Lekce 2: Vlastní telemetrie a události

### Sledování obchodních událostí

Přidáme vlastní telemetrii pro obchodně důležité události.

**Soubor: `src/telemetry.py`**

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

### Aktualizace aplikace s vlastními událostmi

**Soubor: `src/app.py` (vylepšený)**

Přidejte tyto routy do existující aplikace Flask, zachovejte dřívější routy pro zdraví/test. Kratší blok níže ukazuje samostatnou aplikaci pro přehlednost. Inicializace telemetrie nyní probíhá v `telemetry.py`—nevytvářejte exportéry dvakrát.

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

### Testování vlastní telemetrie

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

**Zobrazit v Azure Portal:**

Přejděte na Application Insights → Logs, poté spusťte:

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

## Lekce 3: Distribuované trasování pro mikroservisy

### Povolení mezi službového trasování

S kompatibilní instrumentací a propagací W3C trace-context, Application Insights koreluje požadavky přes služby. Pouhé sdílení connection stringu nezřizuje parent-child spany. Následující architektonický útržek odkazuje na moduly, které musíte implementovat.

**Soubor: `infra/main.bicep`**

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

### Zobrazení end-to-end transakce

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

**Dotaz na end-to-end trace:**

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

## Lekce 4: Live metriky a monitorování v reálném čase

### Povolení proudu live metrik

Live Metrics poskytují téměř reálnou telemetrii, pokud je podporována a povolena SDK. Nejedná se o SLA na latenci. Nastavení Python OpenTelemetry výše je zapnuto přes `enable_live_metrics=True`.

**Přístup k Live Metrics:**

```bash
# Get Application Insights resource
APPI_NAME=$(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"')

# Get resource group
RG_NAME=$(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"')

echo "Navigate to: Azure Portal → Resource Groups → $RG_NAME → $APPI_NAME → Live Metrics"
```

**Co vidíte v reálném čase:**
- ✅ Rychlost příchozích požadavků (požadavky/sekundu)
- ✅ Odchozí volání závislostí
- ✅ Počet výjimek
- ✅ Využití CPU a paměti
- ✅ Počet aktivních serverů
- ✅ Výběrová telemetrie

### Generování zátěže pro testování

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

## Praktická cvičení

### Cvičení 1: Nastavení alertů ⭐⭐ (Střední)

**Cíl**: Vytvořit alerty na vysokou chybovost a pomalé odpovědi.

**Kroky:**

1. **Vytvořit alert pro chybovost:**

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

2. **Vytvořit alert pro pomalé odpovědi:**

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

3. **Vytvořit alert přes Bicep (preferováno pro AZD):**

**Soubor: `infra/core/alerts.bicep`**

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

4. **Testovat alerty:**

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

**✅ Kritéria úspěchu:**
- ✅ Alerty byly úspěšně vytvořeny
- ✅ Alerty se spustí, když jsou překročeny prahy
- ✅ Historii alertů lze zobrazit v Azure Portal
- ✅ Integrace s nasazením AZD

**Čas**: 20-25 minut

---

### Cvičení 2: Vytvoření vlastního dashboardu ⭐⭐ (Střední)

**Cíl**: Vytvořit dashboard zobrazující klíčové metriky aplikace.

**Kroky:**

1. **Vytvořit dashboard přes Azure Portal:**

Přejděte na: Azure Portal → Dashboardy → Nový dashboard

2. **Přidat dlaždice pro klíčové metriky:**

- Počet požadavků (za posledních 24 hodin)
- Průměrná doba odezvy
- Míra chybovosti
- Top 5 nejpomalejších operací
- Geografické rozložení uživatelů

3. **Vytvořit dashboard přes Bicep:**

**Soubor: `infra/core/dashboard.bicep`**

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

4. **Nasadit dashboard:**

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

**✅ Kritéria úspěchu:**
- ✅ Dashboard zobrazuje klíčové metriky
- ✅ Lze připnout na úvodní stránku Azure Portal
- ✅ Aktualizace probíhají v reálném čase
- ✅ Nasaditelný přes AZD

**Čas**: 25-30 minut

---

### Cvičení 3: Monitorování AI/LLM aplikace ⭐⭐⭐ (Pokročilé)

**Cíl**: Sledovat využití Microsoft Foundry modelů (tokeny, náklady, latence).

**Kroky:**

1. **Vytvořit wrapper pro monitorování AI:**

**Soubor: `src/ai_telemetry.py`**

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

2. **Použít monitorovaného klienta:**

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

3. **Dotazovat AI metriky:**

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

**✅ Kritéria úspěchu:**
- ✅ Každé volání OpenAI je automaticky sledováno
- ✅ Využití tokenů a náklady jsou viditelné
- ✅ Latence je sledována
- ✅ Lze nastavit upozornění na rozpočet

**Čas**: 35-45 minut

---

## Optimalizace nákladů

### Vzorkovací strategie

Ovládejte náklady vzorkováním telemetrie:

```python
import os

# Configure before the one configure_azure_monitor() call in your process.
os.environ["OTEL_TRACES_SAMPLER"] = "microsoft.fixed_percentage"
os.environ["OTEL_TRACES_SAMPLER_ARG"] = "0.1" # 10% trace sampling
```

Vzorkování trace nesnižuje každou kategorii telemetrie o 90 %. Metriky a nezávisle vydávané záznamy potřebují svoji vlastní regulaci objemu. Vyberte míru podle potřeb pozorovatelnosti, ne podle plošného prohibice v produkci.

Explicitně nastavte vzorkování v SDK; vlastnost komponenty `SamplingPercentage` není náhradou konfigurace sampleru Python OpenTelemetry.

### Uchovávání dat

```bicep
resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: logAnalyticsName
  properties: {
    retentionInDays: 30  // Minimum (cheapest)
    // Options: 30, 31, 60, 90, 120, 180, 270, 365, 550, 730
  }
}
```

### Měsíční odhady nákladů

| Objem dat | Uchovávání | Měsíční náklady |
|-----------|-----------|----------------|
| 1 GB/měsíc | 30 dní | ~$2-5 |
| 5 GB/měsíc | 30 dní | ~$10-15 |
| 10 GB/měsíc | 90 dní | ~$25-40 |
| 50 GB/měsíc | 90 dní | ~$100-150 |

Tyto údaje jsou ilustrativní, ne nabídky. Ověřte cenu za ingestování, uchovávání, alerty a testování ve své oblasti a ve své smlouvě; bezplatné limity jsou sdílené/omezované podle cen Azure Monitor, ne garantovanou bezplatnou SKU na Application Insights resource.

---

## Kontrolní znalostní bod

### 1. Základní integrace ✓

Otestujte své znalosti:

- [ ] **Otázka 1**: Jak AZD zajišťuje Application Insights?
  - **Odpověď**: Nasazuje monitorovací zdroje explicitně deklarované Bicep/Terraform šablonami projektu.

- [ ] **Otázka 2**: Jaká proměnná prostředí povoluje Application Insights?
  - **Odpověď**: `APPLICATIONINSIGHTS_CONNECTION_STRING`

- [ ] **Otázka 3**: Jaké jsou tři hlavní typy telemetrie?
  - **Odpověď**: Požadavky (HTTP volání), Závislosti (vnější volání), Výjimky (chyby)

**Praktické ověření:**
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

### 2. Vlastní telemetrie ✓

Otestujte své znalosti:

- [ ] **Otázka 1**: Jak sledujete vlastní obchodní události?
  - **Odpověď**: Wrapper této lekce zapisuje strukturované OTel logy s atributy `event_name`, které lze dotazovat v `traces`; tyto se automaticky nezapisují `customEvents`.

- [ ] **Otázka 2**: Jaký je rozdíl mezi událostmi a metrikami?
  - **Odpověď**: Události jsou jednotlivé případy, metriky jsou číselná měření

- [ ] **Otázka 3**: Jak se koreluje telemetrie mezi službami?
  - **Odpověď**: Application Insights automaticky používá `operation_Id` pro korelaci

**Praktické ověření:**
```kusto
// Verify custom events
traces
| where customDimensions.event_name != ""
| summarize count() by tostring(customDimensions.event_name)
```

---

### 3. Produkční monitorování ✓

Otestujte své znalosti:

- [ ] **Otázka 1**: Co je vzorkování a proč jej používat?
  - **Odpověď**: Vzorkování snižuje objem dat (a náklady) tím, že zachycuje jen část telemetrie

- [ ] **Otázka 2**: Jak nastavovat alerty?
  - **Odpověď**: Použijte metrické alerty v Bicep nebo v Azure Portal na základě metrik Application Insights

- [ ] **Otázka 3**: Jaký je rozdíl mezi Log Analytics a Application Insights?
  - **Odpověď**: Application Insights ukládá data v Log Analytics workspace; App Insights poskytuje aplikační specifické pohledy

**Praktické ověření:**
```bash
# Check the sampler configured for the running application, not only the ARM component.
az containerapp show --name "$APP_NAME" --resource-group "$RG_NAME" \
  --query "properties.template.containers[].env[?starts_with(name, 'OTEL_TRACES_SAMPLER')]"
```

---

## Nejlepší postupy

### ✅ DĚLEJTE:

1. **Používejte korelační ID**
   ```python
   logger.info('Processing order', extra={
           'order_id': order_id,
           'user_id': user_id
   })
   ```

2. **Nastavujte alerty pro kritické metriky**
   ```bicep
   // Error rate, slow responses, availability
   ```

3. **Používejte strukturované logování**
   ```python
   # ✅ GOOD: Structured
   logger.info('User signup', extra={'user_id': 'pseudonymous-id'})
   
   # ❌ BAD: Unstructured
   logger.info(f'User 123 signed up')
   ```

4. **Monitorujte závislosti**
   ```python
   # Automatically track database calls, HTTP requests, etc.
   ```

5. **Používejte Live Metrics během nasazení**

### ❌ NEDĚLEJTE:

1. **Nezaznamenávejte citlivá data**
   ```python
   # ❌ BAD
   logger.info(f'Login: {username}:{password}')
   
   # ✅ GOOD
   logger.info('Login attempt', extra={'result': 'failed'})
   ```

2. **Nevyberte vzorkování bez měření objemu a diagnostických potřeb**
   ```python
   # ❌ Expensive
   # 100% traces may be appropriate for a small workload or investigation.
   
   # ✅ Cost-effective
   # A lower trace rate reduces visibility; validate coverage before enabling.
   ```

3. **Nerušte fronty mrtvých zpráv**

4. **Nezapomeňte nastavit limity uchovávání dat**

---

## Řešení problémů

### Problém: Nezobrazuje se telemetrie

**Diagnóza:**
```bash
# Check connection string is set
azd env get-values | grep APPLICATIONINSIGHTS

# Check application logs via Azure Monitor
azd monitor --logs

# Or use Azure CLI for Container Apps:
az containerapp logs show --name $APP_NAME --resource-group $RG_NAME --tail 50
```

**Řešení:**
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

**Řešení:**
- Snižte míru vzorkování
- Zkraťte dobu uchovávání
- Odstraňte podrobné protokolování

---

## Další informace

### Oficiální dokumentace
- [Přehled Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Nastavení Azure Monitor OpenTelemetry](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python)
- [Kusto Query Language](https://learn.microsoft.com/azure/data-explorer/kusto/query/)
- [Monitorování AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/monitor-your-app)

### Další kroky v tomto kurzu
- ← Předchozí: [Kontroly před letem](preflight-checks.md)
- → Další: [Průvodce nasazením](../chapter-04-infrastructure/deployment-guide.md)
- 🏠 [Domovská stránka kurzu](../../README.md)

### Související příklady
- [Příklad Microsoft Foundry Models](../../../../examples/azure-openai-chat) - AI telemetrie
- [Příklad mikroslužeb](../../../../examples/microservices) - Distribuované trasování

---

## Shrnutí

**Naučili jste se:**
- ✅ Automatické zřizování Application Insights pomocí AZD
- ✅ Vlastní telemetrii (události, metriky, závislosti)
- ✅ Distribuované trasování napříč mikroslužbami
- ✅ Živé metriky a monitorování v reálném čase
- ✅ Upozornění a dashboardy
- ✅ Monitorování AI/LLM aplikací
- ✅ Strategie optimalizace nákladů

**Klíčová poznání:**
1. **Výslovně deklarujte monitorování** - AZD nasazuje vaše šablony; SDK instrumentace odesílá telemetrii
2. **Používejte strukturované protokolování** - Usnadňuje dotazování
3. **Sledujte obchodní události** - Nejen technické metriky
4. **Monitorujte náklady na AI** - Sledujte tokeny a výdaje
5. **Nastavte upozornění** - Buďte proaktivní, ne reaktivní
6. **Optimalizujte náklady** - Používejte vzorkování a limity uchovávání

**Další kroky:**
1. Dokončete praktická cvičení
2. Přidejte Application Insights do svých projektů AZD
3. Vytvořte vlastní dashboardy pro svůj tým
4. Naučte se [Průvodce nasazením](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->