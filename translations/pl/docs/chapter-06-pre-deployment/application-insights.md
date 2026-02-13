# Integracja Application Insights z AZD

⏱️ **Szacowany czas**: 40-50 minut | 💰 **Wpływ na koszty**: ~$5-15/month | ⭐ **Złożoność**: Średni

**📚 Ścieżka nauki:**
- ← Poprzedni: [Preflight Checks](preflight-checks.md) - Weryfikacja przed wdrożeniem
- 🎯 **Jesteś tutaj**: Integracja Application Insights (monitoring, telemetria, debugowanie)
- → Następny: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Wdrażanie do Azure
- 🏠 [Strona kursu](../../README.md)

---

## Czego się nauczysz

Po ukończeniu tej lekcji będziesz potrafił:
- Zintegrować **Application Insights** z projektami AZD automatycznie
- Skonfigurować **rozproszone śledzenie** dla mikroserwisów
- Zaimplementować **niestandardową telemetrię** (metryki, zdarzenia, zależności)
- Skonfigurować **Live Metrics** do monitorowania w czasie rzeczywistym
- Tworzyć **alerty i pulpit (dashboard)** z wdrożeń AZD
- Debugować problemy produkcyjne za pomocą **zapytań telemetrii**
- Optymalizować **koszty i strategie próbkowania**
- Monitorować **aplikacje AI/LLM** (tokeny, opóźnienia, koszty)

## Dlaczego Application Insights z AZD ma znaczenie

### Wyzwanie: obserwowalność w produkcji

**Bez Application Insights:**
```
❌ No visibility into production behavior
❌ Manual log aggregation across services
❌ Reactive debugging (wait for customer complaints)
❌ No performance metrics
❌ Cannot trace requests across services
❌ Unknown failure rates and bottlenecks
```

**Z Application Insights + AZD:**
```
✅ Automatic telemetry collection
✅ Centralized logs from all services
✅ Proactive issue detection
✅ End-to-end request tracing
✅ Performance metrics and insights
✅ Real-time dashboards
✅ AZD provisions everything automatically
```

**Analogia**: Application Insights to jak posiadanie "czarnej skrzynki" + pulpitu kokpitu dla Twojej aplikacji. Widzisz wszystko, co się dzieje w czasie rzeczywistym i możesz odtworzyć każde zdarzenie.

---

## Przegląd architektury

### Application Insights w architekturze AZD

```mermaid
graph TB
    User[Użytkownik/Klient]
    App1[Aplikacja kontenerowa 1<br/>Bramka API]
    App2[Aplikacja kontenerowa 2<br/>Usługa produktów]
    App3[Aplikacja kontenerowa 3<br/>Usługa zamówień]
    
    AppInsights[Application Insights<br/>Centrum telemetrii]
    LogAnalytics[(Log Analytics<br/>Obszar roboczy)]
    
    Portal[Azure Portal<br/>Pulpity i alerty]
    Query[Zapytania Kusto<br/>Analiza niestandardowa]
    
    User --> App1
    App1 --> App2
    App2 --> App3
    
    App1 -.->|Automatyczna instrumentacja| AppInsights
    App2 -.->|Automatyczna instrumentacja| AppInsights
    App3 -.->|Automatyczna instrumentacja| AppInsights
    
    AppInsights --> LogAnalytics
    LogAnalytics --> Portal
    LogAnalytics --> Query
    
    style AppInsights fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
    style LogAnalytics fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
```
### Co jest monitorowane automatycznie

| Typ telemetrii | Co rejestruje | Przypadek użycia |
|----------------|------------------|----------|
| **Żądania** | żądania HTTP, kody statusu, czas trwania | Monitorowanie wydajności API |
| **Zależności** | wywołania zewnętrzne (DB, API, storage) | Identyfikacja wąskich gardeł |
| **Wyjątki** | nieobsłużone błędy ze stack trace | Debugowanie awarii |
| **Zdarzenia niestandardowe** | zdarzenia biznesowe (rejestracja, zakup) | Analizy i lejki konwersji |
| **Metryki** | liczniki wydajności, metryki niestandardowe | Planowanie pojemności |
| **Ślady** | komunikaty logów z poziomem ważności | Debugowanie i audyt |
| **Dostępność** | czas dostępności i testy czasu odpowiedzi | Monitorowanie SLA |

---

## Wymagania wstępne

### Wymagane narzędzia

```bash
# Zweryfikuj Azure Developer CLI
azd version
# ✅ Oczekiwane: azd w wersji 1.0.0 lub wyższej

# Zweryfikuj Azure CLI
az --version
# ✅ Oczekiwane: azure-cli w wersji 2.50.0 lub wyższej
```

### Wymagania Azure

- Aktywna subskrypcja Azure
- Uprawnienia do tworzenia:
  - zasobów Application Insights
  - obszarów roboczych Log Analytics
  - Container Apps
  - grup zasobów

### Wiedza wymagana

Powinieneś ukończyć:
- [AZD Basics](../chapter-01-foundation/azd-basics.md) - Podstawowe koncepcje AZD
- [Configuration](../chapter-03-configuration/configuration.md) - Konfiguracja środowiska
- [First Project](../chapter-01-foundation/first-project.md) - Podstawowe wdrożenie

---

## Lekcja 1: Automatyczne Application Insights w AZD

### Jak AZD tworzy Application Insights

AZD automatycznie tworzy i konfiguruje Application Insights podczas wdrożenia. Zobaczmy jak to działa.

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

### Krok 1: Konfiguracja AZD (azure.yaml)

**Plik: `azure.yaml`**

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

**To wszystko!** AZD utworzy Application Insights domyślnie. Żadna dodatkowa konfiguracja nie jest potrzebna do podstawowego monitorowania.

---

### Krok 2: Infrastruktura monitoringu (Bicep)

**Plik: `infra/core/monitoring.bicep`**

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

### Krok 3: Połącz Container App z Application Insights

**Plik: `infra/app/api.bicep`**

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

### Krok 4: Kod aplikacji z telemetrią

**Plik: `src/app.py`**

```python
from flask import Flask, request, jsonify
from opencensus.ext.azure.log_exporter import AzureLogHandler
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.ext.flask.flask_middleware import FlaskMiddleware
from opencensus.trace.samplers import ProbabilitySampler
import logging
import os

app = Flask(__name__)

# Pobierz ciąg połączenia Application Insights
connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

if connection_string:
    # Skonfiguruj śledzenie rozproszone
    middleware = FlaskMiddleware(
        app,
        exporter=AzureExporter(connection_string=connection_string),
        sampler=ProbabilitySampler(rate=1.0)  # Próbkowanie 100% dla środowiska deweloperskiego
    )
    
    # Skonfiguruj logowanie
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
    
    # Zasymuluj wywołanie bazy danych (automatycznie śledzone jako zależność)
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
    time.sleep(3)  # Zasymuluj powolną operację
    logger.warning('Endpoint took 3 seconds to respond')
    return jsonify({'message': 'Slow operation completed'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
```

**Plik: `src/requirements.txt`**

```txt
Flask==3.0.0
opencensus-ext-azure==1.1.13
opencensus-ext-flask==0.8.1
gunicorn==21.2.0
```

---

### Krok 5: Wdróż i zweryfikuj

```bash
# Zainicjalizuj AZD
azd init

# Wdróż (automatycznie tworzy Application Insights)
azd up

# Pobierz adres URL aplikacji
APP_URL=$(azd env get-values | grep API_URL | cut -d '=' -f2 | tr -d '"')

# Generuj telemetrię
curl $APP_URL/health
curl $APP_URL/api/products
curl $APP_URL/api/error-test
curl $APP_URL/api/slow
```

**✅ Oczekiwany wynik:**
```json
{
  "status": "healthy",
  "monitoring": "enabled"
}
```

---

### Krok 6: Wyświetl telemetrię w Azure Portal

```bash
# Pobierz szczegóły Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Otwórz w portalu Azure
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"') \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"') \
  --query "appId" -o tsv
```

**Przejdź do Azure Portal → Application Insights → Wyszukiwanie transakcji**

Powinieneś zobaczyć:
- ✅ Żądania HTTP z kodami statusu
- ✅ Czas trwania żądań (3+ sekundy dla `/api/slow`)
- ✅ Szczegóły wyjątków z `/api/error-test`
- ✅ Niestandardowe komunikaty logów

---

## Lekcja 2: Niestandardowa telemetria i zdarzenia

### Śledź zdarzenia biznesowe

Dodajmy niestandardową telemetrię dla krytycznych zdarzeń biznesowych.

**Plik: `src/telemetry.py`**

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
        
        # Skonfiguruj logger
        self.logger = logging.getLogger(__name__)
        self.logger.addHandler(AzureLogHandler(connection_string=self.connection_string))
        self.logger.setLevel(logging.INFO)
        
        # Skonfiguruj eksporter metryk
        self.stats = stats_module.stats
        self.view_manager = self.stats.view_manager
        self.stats_recorder = self.stats.stats_recorder
        
        exporter = metrics_exporter.new_metrics_exporter(
            connection_string=self.connection_string
        )
        self.view_manager.register_exporter(exporter)
        
        # Skonfiguruj tracer
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

# Globalny klient telemetrii
telemetry = TelemetryClient()
```

### Zaktualizuj aplikację o niestandardowe zdarzenia

**Plik: `src/app.py` (rozszerzony)**

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
    
    # Śledź zdarzenie biznesowe
    telemetry.track_event('Purchase', {
        'product_id': product_id,
        'quantity': quantity,
        'total_amount': price * quantity,
        'user_id': request.headers.get('X-User-Id', 'anonymous')
    })
    
    # Śledź metrykę przychodów
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
    
    # Symuluj wyszukiwanie (w rzeczywistości byłoby to zapytanie do bazy danych)
    results = [{'id': 1, 'name': f'Result for {query}'}]
    
    duration = (time.time() - start_time) * 1000  # Konwertuj na ms
    
    # Śledź zdarzenie wyszukiwania
    telemetry.track_event('Search', {
        'query': query,
        'results_count': len(results),
        'duration_ms': duration
    })
    
    # Śledź metrykę wydajności wyszukiwania
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
        # Symuluj wywołanie zewnętrznego API
        response = requests.get('https://api.example.com/data', timeout=5)
        result = response.json()
    except Exception as e:
        success = False
        result = {'error': str(e)}
    
    duration = (time.time() - start_time) * 1000
    
    # Śledź zależność
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

### Przetestuj niestandardową telemetrię

```bash
# Śledź zdarzenie zakupu
curl -X POST $APP_URL/api/purchase \
  -H "Content-Type: application/json" \
  -H "X-User-Id: user123" \
  -d '{"product_id": 1, "quantity": 2, "price": 29.99}'

# Śledź zdarzenie wyszukiwania
curl "$APP_URL/api/search?q=laptop"

# Śledź zewnętrzną zależność
curl $APP_URL/api/external-call
```

**Zobacz w Azure Portal:**

Przejdź do Application Insights → Logs, następnie uruchom:

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

## Lekcja 3: Śledzenie rozproszone dla mikroserwisów

### Włącz śledzenie między usługami

Dla mikroserwisów Application Insights automatycznie koryluje żądania między usługami.

**Plik: `infra/main.bicep`**

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

### Zobacz transakcję end-to-end

```mermaid
sequenceDiagram
    participant User
    participant Gateway as Brama API<br/>(Id śladu: abc123)
    participant Product as Usługa produktu<br/>(Id rodzica: abc123)
    participant Order as Usługa zamówienia<br/>(Id rodzica: abc123)
    participant AppInsights as Application Insights
    
    User->>Gateway: POST /api/checkout
    Note over Gateway: Rozpocznij śledzenie: abc123
    Gateway->>AppInsights: Zaloguj żądanie (Id śladu: abc123)
    
    Gateway->>Product: GET /products/123
    Note over Product: Id rodzica: abc123
    Product->>AppInsights: Zaloguj wywołanie zależności
    Product-->>Gateway: Szczegóły produktu
    
    Gateway->>Order: POST /orders
    Note over Order: Id rodzica: abc123
    Order->>AppInsights: Zaloguj wywołanie zależności
    Order-->>Gateway: Zamówienie utworzone
    
    Gateway-->>User: Finalizacja zamówienia zakończona
    Gateway->>AppInsights: Zaloguj odpowiedź (Czas trwania: 450ms)
    
    Note over AppInsights: Korelacja według Id śladu
```
**Zapytanie o ślad end-to-end:**

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

## Lekcja 4: Live Metrics i monitorowanie w czasie rzeczywistym

### Włącz strumień Live Metrics

Live Metrics zapewnia telemetrię w czasie rzeczywistym z opóźnieniem <1 sekundy.

**Dostęp do Live Metrics:**

```bash
# Pobierz zasób Application Insights
APPI_NAME=$(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"')

# Pobierz grupę zasobów
RG_NAME=$(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"')

echo "Navigate to: Azure Portal → Resource Groups → $RG_NAME → $APPI_NAME → Live Metrics"
```

**Co zobaczysz w czasie rzeczywistym:**
- ✅ Współczynnik przychodzących żądań (requests/sec)
- ✅ Wychodzące wywołania zależności
- ✅ Liczba wyjątków
- ✅ Wykorzystanie CPU i pamięci
- ✅ Liczba aktywnych serwerów
- ✅ Próbkowa telemetria

### Wygeneruj obciążenie do testów

```bash
# Wygeneruj obciążenie, aby zobaczyć metryki na żywo
for i in {1..100}; do
  curl $APP_URL/api/products &
  curl $APP_URL/api/search?q=test$i &
done

# Obserwuj metryki na żywo w portalu Azure
# Powinieneś zobaczyć skok liczby żądań
```

---

## Ćwiczenia praktyczne

### Ćwiczenie 1: Skonfiguruj alerty ⭐⭐ (Średnie)

**Cel**: Utwórz alerty dla wysokiego wskaźnika błędów i wolnych odpowiedzi.

**Kroki:**

1. **Utwórz alert dla wskaźnika błędów:**

```bash
# Pobierz identyfikator zasobu Application Insights
APPI_ID=$(az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "id" -o tsv)

# Utwórz alert metryczny dla nieudanych żądań
az monitor metrics alert create \
  --name "High-Error-Rate" \
  --resource-group $RG_NAME \
  --scopes $APPI_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "Alert when error rate exceeds 10 per 5 minutes"
```

2. **Utwórz alert dla wolnych odpowiedzi:**

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

3. **Utwórz alert za pomocą Bicep (preferowane dla AZD):**

**Plik: `infra/core/alerts.bicep`**

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

4. **Przetestuj alerty:**

```bash
# Generuj błędy
for i in {1..20}; do
  curl $APP_URL/api/error-test
done

# Generuj wolne odpowiedzi
for i in {1..10}; do
  curl $APP_URL/api/slow
done

# Sprawdź status alertu (poczekaj 5-10 minut)
az monitor metrics alert list \
  --resource-group $RG_NAME \
  --query "[].{Name:name, Enabled:enabled, State:properties.enabled}" \
  --output table
```

**✅ Kryteria sukcesu:**
- ✅ Alerty utworzone poprawnie
- ✅ Alerty uruchamiają się po przekroczeniu progów
- ✅ Można przeglądać historię alertów w Azure Portal
- ✅ Zintegrowane z wdrożeniem AZD

**Czas**: 20-25 minut

---

### Ćwiczenie 2: Utwórz niestandardowy pulpit ⭐⭐ (Średnie)

**Cel**: Zbuduj dashboard pokazujący kluczowe metryki aplikacji.

**Kroki:**

1. **Utwórz dashboard przez Azure Portal:**

Przejdź do: Azure Portal → Dashboards → New Dashboard

2. **Dodaj kafelki dla kluczowych metryk:**

- Liczba żądań (ostatnie 24 godziny)
- Średni czas odpowiedzi
- Wskaźnik błędów
- Top 5 najwolniejszych operacji
- Geograficzne rozkłady użytkowników

3. **Utwórz dashboard za pomocą Bicep:**

**Plik: `infra/core/dashboard.bicep`**

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

4. **Wdróż dashboard:**

```bash
# Dodaj do main.bicep
module dashboard './core/dashboard.bicep' = {
  name: 'dashboard'
  scope: rg
  params: {
    dashboardName: 'dashboard-${environmentName}'
    applicationInsightsId: monitoring.outputs.applicationInsightsId
    location: location
  }
}

# Wdróż
azd up
```

**✅ Kryteria sukcesu:**
- ✅ Dashboard wyświetla kluczowe metryki
- ✅ Można przypiąć do strony głównej Azure Portal
- ✅ Aktualizuje się w czasie rzeczywistym
- ✅ Można wdrożyć przez AZD

**Czas**: 25-30 minut

---

### Ćwiczenie 3: Monitoruj aplikację AI/LLM ⭐⭐⭐ (Zaawansowane)

**Cel**: Śledź użycie Azure OpenAI (tokeny, koszty, opóźnienia).

**Kroki:**

1. **Utwórz wrapper monitorujący AI:**

**Plik: `src/ai_telemetry.py`**

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
            # Wywołaj Azure OpenAI
            response = self.client.chat.completions.create(
                model=model,
                messages=messages,
                **kwargs
            )
            
            duration = (time.time() - start_time) * 1000  # ms
            
            # Wyodrębnij użycie
            usage = response.usage
            prompt_tokens = usage.prompt_tokens
            completion_tokens = usage.completion_tokens
            total_tokens = usage.total_tokens
            
            # Oblicz koszt (według cen GPT-4)
            prompt_cost = (prompt_tokens / 1000) * 0.03  # $0.03 za 1K tokenów
            completion_cost = (completion_tokens / 1000) * 0.06  # $0.06 za 1K tokenów
            total_cost = prompt_cost + completion_cost
            
            # Śledź niestandardowe zdarzenie
            telemetry.track_event('OpenAI_Request', {
                'model': model,
                'prompt_tokens': prompt_tokens,
                'completion_tokens': completion_tokens,
                'total_tokens': total_tokens,
                'duration_ms': duration,
                'cost_usd': total_cost,
                'success': True
            })
            
            # Śledź metryki
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

2. **Użyj monitorowanego klienta:**

```python
from flask import Flask, request, jsonify
from ai_telemetry import MonitoredAzureOpenAI
import os

app = Flask(__name__)

# Zainicjalizuj monitorowanego klienta OpenAI
openai_client = MonitoredAzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

@app.route('/api/chat', methods=['POST'])
def chat():
    data = request.json
    user_message = data.get('message')
    
    # Wywołaj z automatycznym monitorowaniem
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

3. **Zapytań metryki AI:**

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

**✅ Kryteria sukcesu:**
- ✅ Każde wywołanie OpenAI śledzone automatycznie
- ✅ Zużycie tokenów i koszty widoczne
- ✅ Opóźnienia monitorowane
- ✅ Można ustawić alerty budżetowe

**Czas**: 35-45 minut

---

## Optymalizacja kosztów

### Strategie próbkowania

Kontroluj koszty poprzez próbkowanie telemetrii:

```python
from opencensus.trace.samplers import ProbabilitySampler

# Środowisko deweloperskie: 100% próbkowania
sampler = ProbabilitySampler(rate=1.0)

# Środowisko produkcyjne: 10% próbkowania (zmniejsza koszty o 90%)
sampler = ProbabilitySampler(rate=0.1)

# Adaptacyjne próbkowanie (automatycznie dostosowuje się)
from opencensus.trace.samplers import AdaptiveSampler
sampler = AdaptiveSampler()
```

**W Bicep:**

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  properties: {
    SamplingPercentage: 10  // 10% sampling
  }
}
```

### Przechowywanie danych

```bicep
resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: logAnalyticsName
  properties: {
    retentionInDays: 30  // Minimum (cheapest)
    // Options: 30, 31, 60, 90, 120, 180, 270, 365, 550, 730
  }
}
```

### Miesięczne szacunki kosztów

| Wolumen danych | Retencja | Koszt miesięczny |
|-------------|-----------|--------------|
| 1 GB/mies. | 30 dni | ~$2-5 |
| 5 GB/mies. | 30 dni | ~$10-15 |
| 10 GB/mies. | 90 dni | ~$25-40 |
| 50 GB/mies. | 90 dni | ~$100-150 |

**Darmowy poziom**: 5 GB/mies. wliczone

---

## Sprawdzenie wiedzy

### 1. Podstawowa integracja ✓

Sprawdź swoją wiedzę:

- [ ] **Q1**: Jak AZD tworzy Application Insights?
  - **A**: Automatycznie za pomocą szablonów Bicep w `infra/core/monitoring.bicep`

- [ ] **Q2**: Która zmienna środowiskowa włącza Application Insights?
  - **A**: `APPLICATIONINSIGHTS_CONNECTION_STRING`

- [ ] **Q3**: Jakie są trzy główne typy telemetrii?
  - **A**: Żądania (wywołania HTTP), Zależności (wywołania zewnętrzne), Wyjątki (błędy)

**Weryfikacja praktyczna:**
```bash
# Sprawdź, czy Application Insights jest skonfigurowany
azd env get-values | grep APPLICATIONINSIGHTS

# Zweryfikuj, czy telemetria jest przesyłana
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "requests/count"
```

---

### 2. Niestandardowa telemetria ✓

Sprawdź swoją wiedzę:

- [ ] **Q1**: Jak śledzić niestandardowe zdarzenia biznesowe?
  - **A**: Użyj loggera z `custom_dimensions` lub `TelemetryClient.track_event()`

- [ ] **Q2**: Jaka jest różnica między zdarzeniami a metrykami?
  - **A**: Zdarzenia to pojedyncze wystąpienia, metryki to pomiar numeryczny

- [ ] **Q3**: Jak skorelować telemetrię między usługami?
  - **A**: Application Insights automatycznie używa `operation_Id` do korelacji

**Weryfikacja praktyczna:**
```kusto
// Verify custom events
traces
| where customDimensions.event_name != ""
| summarize count() by tostring(customDimensions.event_name)
```

---

### 3. Monitorowanie produkcji ✓

Sprawdź swoją wiedzę:

- [ ] **Q1**: Czym jest próbkowanie i dlaczego go używać?
  - **A**: Próbkowanie zmniejsza ilość danych (i koszty) przez rejestrowanie tylko części telemetrii

- [ ] **Q2**: Jak skonfigurować alerty?
  - **A**: Użyj alertów metryk w Bicep lub Azure Portal, bazując na metrykach Application Insights

- [ ] **Q3**: Jaka jest różnica między Log Analytics a Application Insights?
  - **A**: Application Insights przechowuje dane w obszarze roboczym Log Analytics; App Insights daje widoki specyficzne dla aplikacji

**Weryfikacja praktyczna:**
```bash
# Sprawdź konfigurację próbkowania
az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "properties.SamplingPercentage"
```

---

## Najlepsze praktyki

### ✅ ZRÓB:

1. **Używaj identyfikatorów korelacji**
   ```python
   logger.info('Processing order', extra={
       'custom_dimensions': {
           'order_id': order_id,
           'user_id': user_id
       }
   })
   ```

2. **Skonfiguruj alerty dla krytycznych metryk**
   ```bicep
   // Error rate, slow responses, availability
   ```

3. **Używaj strukturalnego logowania**
   ```python
   # ✅ DOBRE: Ustrukturyzowane
   logger.info('User signup', extra={'custom_dimensions': {'user_id': 123}})
   
   # ❌ ZŁE: Nieustrukturyzowane
   logger.info(f'User 123 signed up')
   ```

4. **Monitoruj zależności**
   ```python
   # Automatycznie śledź wywołania bazy danych, żądania HTTP itp.
   ```

5. **Używaj Live Metrics podczas wdrożeń**

### ❌ NIE RÓB:

1. **Nie loguj danych wrażliwych**
   ```python
   # ❌ ZŁE
   logger.info(f'Login: {username}:{password}')
   
   # ✅ DOBRE
   logger.info('Login attempt', extra={'custom_dimensions': {'username': username}})
   ```

2. **Nie używaj próbkowania 100% w produkcji**
   ```python
   # ❌ Drogi
   sampler = ProbabilitySampler(rate=1.0)
   
   # ✅ Opłacalny
   sampler = ProbabilitySampler(rate=0.1)
   ```

3. **Nie ignoruj kolejek dead letter**

4. **Nie zapomnij ustawić limitów retencji danych**

---

## Rozwiązywanie problemów

### Problem: Nie pojawia się telemetria

**Diagnoza:**
```bash
# Sprawdź, czy ciąg połączenia jest ustawiony
azd env get-values | grep APPLICATIONINSIGHTS

# Sprawdź logi aplikacji przez Azure Monitor
azd monitor --logs

# Lub użyj Azure CLI dla Container Apps:
az containerapp logs show --name $APP_NAME --resource-group $RG_NAME --tail 50
```

**Rozwiązanie:**
```bash
# Zweryfikuj ciąg połączenia w Container App
az containerapp show \
  --name $APP_NAME \
  --resource-group $RG_NAME \
  --query "properties.template.containers[0].env" \
  | grep -i applicationinsights
```

---

### Problem: Wysokie koszty

**Diagnoza:**
```bash
# Sprawdź wczytywanie danych
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "availabilityResults/count"
```

**Rozwiązanie:**
- Zmniejsz współczynnik próbkowania
- Skróć okres retencji
- Usuń szczegółowe logowanie

---

## Dowiedz się więcej

### Oficjalna dokumentacja
- [Przegląd Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Application Insights dla Pythona](https://learn.microsoft.com/azure/azure-monitor/app/opencensus-python)
- [Język zapytań Kusto](https://learn.microsoft.com/azure/data-explorer/kusto/query/)
- [Monitorowanie AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/monitor-your-app)

### Następne kroki w tym kursie
- ← Poprzedni: [Preflight Checks](preflight-checks.md)
- → Następny: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- 🏠 [Strona kursu](../../README.md)

### Powiązane przykłady
- [Azure OpenAI Example](../../../../examples/azure-openai-chat) - telemetria AI
- [Microservices Example](../../../../examples/microservices) - śledzenie rozproszone

---

## Podsumowanie

**Nauczyłeś się:**
- ✅ Automatyczne tworzenie Application Insights z AZD
- ✅ Niestandardowa telemetria (zdarzenia, metryki, zależności)
- ✅ Rozproszone śledzenie w mikroserwisach
- ✅ Metryki na żywo i monitorowanie w czasie rzeczywistym
- ✅ Alerty i pulpity nawigacyjne
- ✅ Monitorowanie aplikacji AI/LLM
- ✅ Strategie optymalizacji kosztów

**Kluczowe wnioski:**
1. **AZD automatycznie zapewnia monitorowanie** - Bez ręcznej konfiguracji
2. **Używaj strukturalnego logowania** - Ułatwia wykonywanie zapytań
3. **Śledź zdarzenia biznesowe** - Nie tylko metryki techniczne
4. **Monitoruj koszty AI** - Śledź tokeny i wydatki
5. **Skonfiguruj alerty** - Bądź proaktywny, nie reaktywny
6. **Optymalizuj koszty** - Użyj próbkowania i limitów retencji

**Następne kroki:**
1. Wykonaj ćwiczenia praktyczne
2. Dodaj Application Insights do swoich projektów AZD
3. Utwórz niestandardowe pulpity nawigacyjne dla swojego zespołu
4. Zapoznaj się z [Przewodnik wdrożenia](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie:**  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia opartej na sztucznej inteligencji [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do jak największej dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym należy traktować jako wersję wiążącą. W przypadku informacji o kluczowym znaczeniu zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->