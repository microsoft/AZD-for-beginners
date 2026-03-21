# Integrácia Application Insights s AZD

⏱️ **Odhadovaný čas**: 40-50 minút | 💰 **Dopad na náklady**: ~$5-15/mesiac | ⭐ **Zložitosť**: Stredne náročné

**📚 Vzdelávacia cesta:**
- ← Predošlé: [Kontroly pred nasadením](preflight-checks.md) - Prednasadzovacie overenie
- 🎯 **Tu ste**: Integrácia Application Insights (monitoring, telemetria, ladenie)
- → Ďalej: [Príručka nasadenia](../chapter-04-infrastructure/deployment-guide.md) - Nasadiť do Azure
- 🏠 [Domov kurzu](../../README.md)

---

## Čo sa naučíte

Po dokončení tejto lekcie budete:
- Integrovať **Application Insights** do projektov AZD automaticky
- Konfigurovať **distribuované trasovanie** pre mikroslužby
- Implementovať **vlastnú telemetriu** (metry, udalosti, závislosti)
- Nastaviť **live metrics** pre monitorovanie v reálnom čase
- Vytvárať **upozornenia a panely** z nasadení AZD
- Ladiť problémy v produkcii pomocou **telemetrických dotazov**
- Optimalizovať **náklady a stratégie vzorkovania**
- Monitorovať **AI/LLM aplikácie** (tokeny, latencia, náklady)

## Prečo je Application Insights s AZD dôležitý

### Výzva: Observabilita v produkcii

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
✅ AZD provisions everything automatically
```

**Analógia**: Application Insights je ako mať „čiernu skrinku“ leteckého záznamníka + kokpitový panel pre vašu aplikáciu. Vidíte všetko, čo sa deje v reálnom čase, a môžete si prehrávať akýkoľvek incident.

---

## Prehľad architektúry

### Application Insights v architektúre AZD

```mermaid
graph TB
    User[Používateľ/Klient]
    App1[Kontajnerová aplikácia 1<br/>API brána]
    App2[Kontajnerová aplikácia 2<br/>Služba produktov]
    App3[Kontajnerová aplikácia 3<br/>Služba objednávok]
    
    AppInsights[Application Insights<br/>Telemetrické centrum]
    LogAnalytics[(Log Analytics<br/>Pracovný priestor)]
    
    Portal[Portál Azure<br/>Dashboardy a upozornenia]
    Query[Kusto dotazy<br/>Vlastná analýza]
    
    User --> App1
    App1 --> App2
    App2 --> App3
    
    App1 -.->|Automatická instrumentácia| AppInsights
    App2 -.->|Automatická instrumentácia| AppInsights
    App3 -.->|Automatická instrumentácia| AppInsights
    
    AppInsights --> LogAnalytics
    LogAnalytics --> Portal
    LogAnalytics --> Query
    
    style AppInsights fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
    style LogAnalytics fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
```
### Čo sa monitoruje automaticky

| Typ telemetrie | Čo zachytáva | Použitie |
|----------------|--------------|---------|
| **Requests** | HTTP požiadavky, status kódy, trvanie | Monitorovanie výkonu API |
| **Dependencies** | Externé volania (DB, API, úložisko) | Identifikácia úzkych miest |
| **Exceptions** | Nezachytené chyby s stack trace | Ladenie zlyhaní |
| **Custom Events** | Biznis udalosti (registrácia, nákup) | Analytika a konverzné kanály |
| **Metrics** | Výkonnostné počítadlá, vlastné metriky | Kapacitné plánovanie |
| **Traces** | Log správy s úrovňou závažnosti | Ladenie a audit |
| **Availability** | Testy dostupnosti a času odozvy | Monitorovanie SLA |

---

## Požiadavky

### Požadované nástroje

```bash
# Overiť Azure Developer CLI
azd version
# ✅ Očakávané: azd verzia 1.0.0 alebo vyššia

# Overiť Azure CLI
az --version
# ✅ Očakávané: azure-cli 2.50.0 alebo vyššia
```

### Požiadavky v Azure

- Aktívne predplatné Azure
- Povolenia na vytváranie:
  - Application Insights zdrojov
  - Log Analytics workspace
  - Container Apps
  - Resource groups

### Predchádzajúce znalosti

Mali by ste mať dokončené:
- [AZD základy](../chapter-01-foundation/azd-basics.md) - Základné koncepty AZD
- [Konfigurácia](../chapter-03-configuration/configuration.md) - Nastavenie prostredia
- [Prvý projekt](../chapter-01-foundation/first-project.md) - Základné nasadenie

---

## Lekcia 1: Automatické Application Insights s AZD

### Ako AZD poskytuje Application Insights

AZD automaticky vytvára a konfiguruje Application Insights pri nasadení. Pozrime sa, ako to funguje.

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

### Krok 1: Konfigurujte AZD (azure.yaml)

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

# AZD automatically provisions monitoring!
```

**To je všetko!** AZD vytvorí Application Insights predvolene. Pre základné monitorovanie nie je potrebná žiadna ďalšia konfigurácia.

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
```

---

### Krok 3: Pripojte Container App k Application Insights

**Súbor: `infra/app/api.bicep`**

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

### Krok 4: Aplikačný kód s telemetriou

**Súbor: `src/app.py`**

```python
from flask import Flask, request, jsonify
from opencensus.ext.azure.log_exporter import AzureLogHandler
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.ext.flask.flask_middleware import FlaskMiddleware
from opencensus.trace.samplers import ProbabilitySampler
import logging
import os

app = Flask(__name__)

# Získať reťazec pripojenia Application Insights
connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

if connection_string:
    # Konfigurovať distribuované trasovanie
    middleware = FlaskMiddleware(
        app,
        exporter=AzureExporter(connection_string=connection_string),
        sampler=ProbabilitySampler(rate=1.0)  # 100% vzorkovanie pre vývoj
    )
    
    # Konfigurovať logovanie
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
    
    # Simulovať volanie databázy (automaticky sledované ako závislosť)
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
    time.sleep(3)  # Simulovať pomalú operáciu
    logger.warning('Endpoint took 3 seconds to respond')
    return jsonify({'message': 'Slow operation completed'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
```

**Súbor: `src/requirements.txt`**

```txt
Flask==3.0.0
opencensus-ext-azure==1.1.13
opencensus-ext-flask==0.8.1
gunicorn==21.2.0
```

---

### Krok 5: Nasadiť a overiť

```bash
# Inicializovať AZD
azd init

# Nasadiť (automaticky zriaďuje Application Insights)
azd up

# Získať URL aplikácie
APP_URL=$(azd env get-values | grep API_URL | cut -d '=' -f2 | tr -d '"')

# Vygenerovať telemetriu
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

### Krok 6: Zobraziť telemetriu v Azure Porte

```bash
# Získať podrobnosti o Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Otvoriť v portáli Azure
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"') \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"') \
  --query "appId" -o tsv
```

**Prejdite do Azure Portal → Application Insights → Transaction Search**

Mali by ste vidieť:
- ✅ HTTP požiadavky so status kódmi
- ✅ Trvanie požiadavky (3+ sekundy pre `/api/slow`)
- ✅ Detaily výnimiek z `/api/error-test`
- ✅ Vlastné log správy

---

## Lekcia 2: Vlastná telemetria a udalosti

### Sledovanie biznis udalostí

Pridajme vlastnú telemetriu pre biznis-kritické udalosti.

**Súbor: `src/telemetry.py`**

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
        
        # Nastavenie loggera
        self.logger = logging.getLogger(__name__)
        self.logger.addHandler(AzureLogHandler(connection_string=self.connection_string))
        self.logger.setLevel(logging.INFO)
        
        # Nastavenie exportéra metrík
        self.stats = stats_module.stats
        self.view_manager = self.stats.view_manager
        self.stats_recorder = self.stats.stats_recorder
        
        exporter = metrics_exporter.new_metrics_exporter(
            connection_string=self.connection_string
        )
        self.view_manager.register_exporter(exporter)
        
        # Nastavenie traceru
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

# Globálny telemetrický klient
telemetry = TelemetryClient()
```

### Aktualizovať aplikáciu s vlastnými udalosťami

**Súbor: `src/app.py` (rozšírené)**

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
    
    # Sledovať obchodnú udalosť
    telemetry.track_event('Purchase', {
        'product_id': product_id,
        'quantity': quantity,
        'total_amount': price * quantity,
        'user_id': request.headers.get('X-User-Id', 'anonymous')
    })
    
    # Sledovať metriku príjmov
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
    
    # Simulovať vyhľadávanie (bol by to skutočný dotaz do databázy)
    results = [{'id': 1, 'name': f'Result for {query}'}]
    
    duration = (time.time() - start_time) * 1000  # Previesť na ms
    
    # Sledovať udalosť vyhľadávania
    telemetry.track_event('Search', {
        'query': query,
        'results_count': len(results),
        'duration_ms': duration
    })
    
    # Sledovať metriku výkonu vyhľadávania
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
        # Simulovať volanie externého API
        response = requests.get('https://api.example.com/data', timeout=5)
        result = response.json()
    except Exception as e:
        success = False
        result = {'error': str(e)}
    
    duration = (time.time() - start_time) * 1000
    
    # Sledovať závislosť
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

### Testovanie vlastnej telemetrie

```bash
# Sledovať udalosť nákupu
curl -X POST $APP_URL/api/purchase \
  -H "Content-Type: application/json" \
  -H "X-User-Id: user123" \
  -d '{"product_id": 1, "quantity": 2, "price": 29.99}'

# Sledovať udalosť vyhľadávania
curl "$APP_URL/api/search?q=laptop"

# Sledovať externú závislosť
curl $APP_URL/api/external-call
```

**Zobraziť v Azure Porte:**

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

## Lekcia 3: Distribuované trasovanie pre mikroslužby

### Povoliť trasovanie cez služby

Pre mikroslužby Application Insights automaticky koreluje požiadavky naprieč službami.

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
    participant Gateway as API brána<br/>(ID trasovania: abc123)
    participant Product as Služba produktov<br/>(Rodičovské ID: abc123)
    participant Order as Služba objednávok<br/>(Rodičovské ID: abc123)
    participant AppInsights as Application Insights
    
    User->>Gateway: POST /api/checkout
    Note over Gateway: Začiatok trasovania: abc123
    Gateway->>AppInsights: Zaznamenať požiadavku (ID trasovania: abc123)
    
    Gateway->>Product: GET /products/123
    Note over Product: Rodičovské ID: abc123
    Product->>AppInsights: Zaznamenať volanie závislosti
    Product-->>Gateway: Detaily produktu
    
    Gateway->>Order: POST /orders
    Note over Order: Rodičovské ID: abc123
    Order->>AppInsights: Zaznamenať volanie závislosti
    Order-->>Gateway: Objednávka vytvorená
    
    Gateway-->>User: Dokončenie nákupu
    Gateway->>AppInsights: Zaznamenať odpoveď (Trvanie: 450ms)
    
    Note over AppInsights: Korelácia podľa ID trasovania
```
**Dotaz na end-to-end trasu:**

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

## Lekcia 4: Live Metrics a monitorovanie v reálnom čase

### Povoliť Live Metrics Stream

Live Metrics poskytuje telemetriu v reálnom čase s latenciou <1 sekundy.

**Prístup k Live Metrics:**

```bash
# Získať zdroj Application Insights
APPI_NAME=$(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"')

# Získať skupinu prostriedkov
RG_NAME=$(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"')

echo "Navigate to: Azure Portal → Resource Groups → $RG_NAME → $APPI_NAME → Live Metrics"
```

**Čo uvidíte v reálnom čase:**
- ✅ Rýchlosť prichádzajúcich požiadaviek (requests/sec)
- ✅ Odchádzajúce závislosti volaní
- ✅ Počet výnimiek
- ✅ Využitie CPU a pamäte
- ✅ Počet aktívnych serverov
- ✅ Vzorkovanú telemetriu

### Generovať záťaž na testovanie

```bash
# Vygenerujte záťaž, aby ste videli živé metriky
for i in {1..100}; do
  curl $APP_URL/api/products &
  curl $APP_URL/api/search?q=test$i &
done

# Sledujte živé metriky v Azure portáli
# Mali by ste vidieť nárast miery požiadaviek
```

---

## Praktické cvičenia

### Cvičenie 1: Nastaviť upozornenia ⭐⭐ (Stredne)

**Cieľ**: Vytvoriť upozornenia na vysokú mieru chýb a pomalé odpovede.

**Kroky:**

1. **Vytvorte upozornenie pre mieru chýb:**

```bash
# Získajte ID prostriedku Application Insights
APPI_ID=$(az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "id" -o tsv)

# Vytvorte metrické upozornenie pre neúspešné požiadavky
az monitor metrics alert create \
  --name "High-Error-Rate" \
  --resource-group $RG_NAME \
  --scopes $APPI_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "Alert when error rate exceeds 10 per 5 minutes"
```

2. **Vytvorte upozornenie pre pomalé odpovede:**

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

3. **Vytvorte upozornenie cez Bicep (preferované pre AZD):**

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

4. **Otestujte upozornenia:**

```bash
# Generovať chyby
for i in {1..20}; do
  curl $APP_URL/api/error-test
done

# Generovať pomalé odpovede
for i in {1..10}; do
  curl $APP_URL/api/slow
done

# Skontrolovať stav upozornenia (počkajte 5–10 minút)
az monitor metrics alert list \
  --resource-group $RG_NAME \
  --query "[].{Name:name, Enabled:enabled, State:properties.enabled}" \
  --output table
```

**✅ Kritériá úspechu:**
- ✅ Upozornenia úspešne vytvorené
- ✅ Upozornenia sa spustia pri prekročení prahov
- ✅ Je možné zobraziť históriu upozornení v Azure Porte
- ✅ Integrované s nasadením AZD

**Čas**: 20-25 minút

---

### Cvičenie 2: Vytvoriť vlastný dashboard ⭐⭐ (Stredne)

**Cieľ**: Vytvoriť dashboard zobrazujúci kľúčové metriky aplikácie.

**Kroky:**

1. **Vytvorte dashboard cez Azure Portal:**

Prejdite na: Azure Portal → Dashboards → New Dashboard

2. **Pridať dlaždice pre kľúčové metriky:**

- Počet požiadaviek (za posledných 24 hodín)
- Priemerný čas odpovede
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

4. **Nasadiť dashboard:**

```bash
# Pridať do main.bicep
module dashboard './core/dashboard.bicep' = {
  name: 'dashboard'
  scope: rg
  params: {
    dashboardName: 'dashboard-${environmentName}'
    applicationInsightsId: monitoring.outputs.applicationInsightsId
    location: location
  }
}

# Nasadiť
azd up
```

**✅ Kritériá úspechu:**
- ✅ Dashboard zobrazuje kľúčové metriky
- ✅ Možnosť pripnúť na domovskú stránku Azure Portal
- ✅ Aktualizuje sa v reálnom čase
- ✅ Nasaditeľné cez AZD

**Čas**: 25-30 minút

---

### Cvičenie 3: Monitorovať AI/LLM aplikáciu ⭐⭐⭐ (Pokročilé)

**Cieľ**: Sledovať používanie Microsoft Foundry Models (tokeny, náklady, latencia).

**Kroky:**

1. **Vytvorte AI monitorovací wrapper:**

**Súbor: `src/ai_telemetry.py`**

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
            # Volanie Microsoft Foundry modelov
            response = self.client.chat.completions.create(
                model=model,
                messages=messages,
                **kwargs
            )
            
            duration = (time.time() - start_time) * 1000  # ms
            
            # Extrahovať využitie
            usage = response.usage
            prompt_tokens = usage.prompt_tokens
            completion_tokens = usage.completion_tokens
            total_tokens = usage.total_tokens
            
            # Vypočítať náklady (ceny gpt-4.1)
            prompt_cost = (prompt_tokens / 1000) * 0.03  # $0,03 za 1K tokenov
            completion_cost = (completion_tokens / 1000) * 0.06  # $0,06 za 1K tokenov
            total_cost = prompt_cost + completion_cost
            
            # Sledovať vlastnú udalosť
            telemetry.track_event('OpenAI_Request', {
                'model': model,
                'prompt_tokens': prompt_tokens,
                'completion_tokens': completion_tokens,
                'total_tokens': total_tokens,
                'duration_ms': duration,
                'cost_usd': total_cost,
                'success': True
            })
            
            # Sledovať metriky
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

# Inicializovať monitorovaného klienta OpenAI
openai_client = MonitoredAzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

@app.route('/api/chat', methods=['POST'])
def chat():
    data = request.json
    user_message = data.get('message')
    
    # Zavolať s automatickým monitorovaním
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

3. **Dotazovať AI metriky:**

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

**✅ Kritériá úspechu:**
- ✅ Každé OpenAI volanie je sledované automaticky
- ✅ Používanie tokenov a náklady sú viditeľné
- ✅ Latencia je monitorovaná
- ✅ Možnosť nastaviť rozpočtové upozornenia

**Čas**: 35-45 minút

---

## Optimalizácia nákladov

### Stratégie vzorkovania

Ovládajte náklady pomocou vzorkovania telemetrie:

```python
from opencensus.trace.samplers import ProbabilitySampler

# Vývoj: 100% vzorkovanie
sampler = ProbabilitySampler(rate=1.0)

# Produkcia: 10% vzorkovanie (znižuje náklady o 90%)
sampler = ProbabilitySampler(rate=0.1)

# Adaptívne vzorkovanie (automaticky sa prispôsobuje)
from opencensus.trace.samplers import AdaptiveSampler
sampler = AdaptiveSampler()
```

**V Bicep:**

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  properties: {
    SamplingPercentage: 10  // 10% sampling
  }
}
```

### Ukladanie dát

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

| Objem dát | Retencia | Mesačné náklady |
|-----------|----------|-----------------|
| 1 GB/mesiac | 30 dní | ~$2-5 |
| 5 GB/mesiac | 30 dní | ~$10-15 |
| 10 GB/mesiac | 90 dní | ~$25-40 |
| 50 GB/mesiac | 90 dní | ~$100-150 |

**Bezplatná úroveň**: 5 GB/mesiac zahrnuté

---

## Kontrolný bod vedomostí

### 1. Základná integrácia ✓

Otestujte svoje pochopenie:

- [ ] **Q1**: Ako AZD poskytuje Application Insights?
  - **A**: Automaticky cez Bicep šablóny v `infra/core/monitoring.bicep`

- [ ] **Q2**: Ktorá premenná prostredia povoľuje Application Insights?
  - **A**: `APPLICATIONINSIGHTS_CONNECTION_STRING`

- [ ] **Q3**: Aké sú tri hlavné typy telemetrie?
  - **A**: Requests (HTTP volania), Dependencies (externé volania), Exceptions (chyby)

**Overenie prakticky:**
```bash
# Skontrolujte, či je Application Insights nakonfigurovaný
azd env get-values | grep APPLICATIONINSIGHTS

# Overte, či telemetria prúdi
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "requests/count"
```

---

### 2. Vlastná telemetria ✓

Otestujte svoje pochopenie:

- [ ] **Q1**: Ako sledovať vlastné biznis udalosti?
  - **A**: Použiť logger s `custom_dimensions` alebo `TelemetryClient.track_event()`

- [ ] **Q2**: Aký je rozdiel medzi udalosťami a metrikami?
  - **A**: Udalosti sú diskrétne udalosti, metriky sú číselné merania

- [ ] **Q3**: Ako korelovať telemetriu naprieč službami?
  - **A**: Application Insights automaticky používa `operation_Id` pre koreláciu

**Overenie prakticky:**
```kusto
// Verify custom events
traces
| where customDimensions.event_name != ""
| summarize count() by tostring(customDimensions.event_name)
```

---

### 3. Produkčné monitorovanie ✓

Otestujte svoje pochopenie:

- [ ] **Q1**: Čo je vzorkovanie a prečo ho používať?
  - **A**: Vzorkovanie znižuje objem dát (a náklady) tým, že zachytí len percento telemetrie

- [ ] **Q2**: Ako nastaviť upozornenia?
  - **A**: Použiť metrické upozornenia v Bicep alebo Azure Portal na základe metrik Application Insights

- [ ] **Q3**: Aký je rozdiel medzi Log Analytics a Application Insights?
  - **A**: Application Insights ukladá dáta do Log Analytics workspace; App Insights poskytuje pohľady špecifické pre aplikácie

**Overenie prakticky:**
```bash
# Skontrolujte konfiguráciu vzorkovania
az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "properties.SamplingPercentage"
```

---

## Najlepšie postupy

### ✅ ROBIŤ:

1. **Používať korelačné ID**
   ```python
   logger.info('Processing order', extra={
       'custom_dimensions': {
           'order_id': order_id,
           'user_id': user_id
       }
   })
   ```

2. **Nastaviť upozornenia pre kritické metriky**
   ```bicep
   // Error rate, slow responses, availability
   ```

3. **Používať štruktúrované logovanie**
   ```python
   # ✅ DOBRÉ: Štruktúrované
   logger.info('User signup', extra={'custom_dimensions': {'user_id': 123}})
   
   # ❌ ZLÉ: Neštruktúrované
   logger.info(f'User 123 signed up')
   ```

4. **Monitorovať závislosti**
   ```python
   # Automaticky sledujte volania do databázy, HTTP požiadavky atď.
   ```

5. **Používať Live Metrics počas nasadení**

### ❌ NEROBIŤ:

1. **Nezaznamenávať citlivé údaje**
   ```python
   # ❌ ZLÉ
   logger.info(f'Login: {username}:{password}')
   
   # ✅ DOBRÉ
   logger.info('Login attempt', extra={'custom_dimensions': {'username': username}})
   ```

2. **Nepoužívať 100% vzorkovanie v produkcii**
   ```python
   # ❌ Drahé
   sampler = ProbabilitySampler(rate=1.0)
   
   # ✅ Nákladovo efektívne
   sampler = ProbabilitySampler(rate=0.1)
   ```

3. **Neignorovať dead letter queues**

4. **Nezabudnúť nastaviť limity retencie dát**

---

## Riešenie problémov

### Problém: Nezobrazuje sa žiadna telemetria

**Diagnóza:**
```bash
# Skontrolujte, či je reťazec pripojenia nastavený
azd env get-values | grep APPLICATIONINSIGHTS

# Skontrolujte protokoly aplikácie pomocou Azure Monitoru
azd monitor --logs

# Alebo použite Azure CLI pre Container Apps:
az containerapp logs show --name $APP_NAME --resource-group $RG_NAME --tail 50
```

**Riešenie:**
```bash
# Skontrolujte reťazec pripojenia v kontajnerovej aplikácii
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
# Skontrolovať príjem údajov
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "availabilityResults/count"
```

**Riešenie:**
- Znížiť mieru vzorkovania
- Skrátiť obdobie retencie
- Odstrániť detailné logovanie

---

## Zistiť viac

### Oficiálna dokumentácia
- [Application Insights Overview](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Application Insights for Python](https://learn.microsoft.com/azure/azure-monitor/app/opencensus-python)
- [Kusto Query Language](https://learn.microsoft.com/azure/data-explorer/kusto/query/)
- [AZD Monitoring](https://learn.microsoft.com/azure/developer/azure-developer-cli/monitor-your-app)

### Ďalšie kroky v tomto kurze
- ← Predošlé: [Kontroly pred nasadením](preflight-checks.md)
- → Ďalej: [Príručka nasadenia](../chapter-04-infrastructure/deployment-guide.md)
- 🏠 [Domov kurzu](../../README.md)

### Súvisiace príklady
- [Microsoft Foundry Models Example](../../../../examples/azure-openai-chat) - AI telemetria
- [Microservices Example](../../../../examples/microservices) - Distribuované trasovanie

---

## Zhrnutie

**Naučili ste sa:**
- ✅ Automatické poskytovanie Application Insights s AZD
- ✅ Vlastná telemetria (udalosti, metriky, závislosti)
- ✅ Distribuované trasovanie naprieč mikroslužbami
- ✅ Live metrics a monitorovanie v reálnom čase
- ✅ Upozornenia a panely
- ✅ Monitorovanie AI/LLM aplikácií
- ✅ Stratégie optimalizácie nákladov

**Kľúčové zhrnutia:**
1. **AZD poskytuje monitoring automaticky** - Žiadne manuálne nastavenie
2. **Použite štruktúrované logovanie** - Uľahčuje dotazovanie
3. **Sledujte obchodné udalosti** - Nielen technické metriky
4. **Sledujte náklady na AI** - Sledujte tokeny a výdavky
5. **Nastavte upozornenia** - Buďte proaktívni, nie reaktívni
6. **Optimalizujte náklady** - Použite vzorkovanie a limity uchovávania

**Ďalšie kroky:**
1. Dokončite praktické cvičenia
2. Pridajte Application Insights do vašich AZD projektov
3. Vytvorte vlastné dashboardy pre váš tím
4. Prečítajte si [Sprievodcu nasadením](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vylúčenie zodpovednosti**:
Tento dokument bol preložený pomocou služby automatického prekladu založenej na umelej inteligencii [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, majte prosím na pamäti, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho originálnom jazyku by sa mal považovať za záväzný zdroj. Pre kritické informácie sa odporúča profesionálny preklad vykonaný človekom. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->