# Integration von Application Insights mit AZD

⏱️ **Geschätzte Zeit**: 40-50 Minuten | 💰 **Kostenaufwand**: ~\$5-15/Monat | ⭐ **Komplexität**: Mittel

**📚 Lernpfad:**
- ← Vorherige: [Vorabprüfungen](preflight-checks.md) - Validierung vor der Bereitstellung
- 🎯 **Sie sind hier**: Application Insights-Integration (Überwachung, Telemetrie, Debugging)
- → Nächste: [Bereitstellungsanleitung](../chapter-04-infrastructure/deployment-guide.md) - Bereitstellung in Azure
- 🏠 [Kurs-Startseite](../../README.md)

---

## Was Sie lernen werden

Durch den Abschluss dieser Lektion werden Sie:
- Integrieren Sie **Application Insights** automatisch in AZD-Projekte
- Konfigurieren Sie **verteiltes Tracing** für Microservices
- Implementieren Sie **benutzerdefinierte Telemetrie** (Metriken, Ereignisse, Abhängigkeiten)
- Richten Sie **Live-Metriken** für die Echtzeitüberwachung ein
- Erstellen Sie **Warnungen und Dashboards** aus AZD-Bereitstellungen
- Debuggen Sie Produktionsprobleme mit **Telemetrieabfragen**
- Optimieren Sie **Kosten- und Sampling-Strategien**
- Überwachen Sie **KI/LLM-Anwendungen** (Tokens, Latenz, Kosten)

## Warum Application Insights mit AZD wichtig ist

### Die Herausforderung: Produktionsbeobachtbarkeit

**Ohne Application Insights:**
```
❌ No visibility into production behavior
❌ Manual log aggregation across services
❌ Reactive debugging (wait for customer complaints)
❌ No performance metrics
❌ Cannot trace requests across services
❌ Unknown failure rates and bottlenecks
```

**Mit Application Insights + AZD:**
```
✅ Automatic telemetry collection
✅ Centralized logs from all services
✅ Proactive issue detection
✅ End-to-end request tracing
✅ Performance metrics and insights
✅ Real-time dashboards
✅ AZD provisions everything automatically
```

**Analogie**: Application Insights ist wie ein "Black-Box"-Flugschreiber plus Cockpit-Armaturenbrett für Ihre Anwendung. Sie sehen alles, was in Echtzeit passiert, und können jeden Vorfall wiedergeben.

---

## Architekturübersicht

### Application Insights in der AZD-Architektur

```mermaid
graph TB
    User[Benutzer/Client]
    App1[Container-App 1<br/>API-Gateway]
    App2[Container-App 2<br/>Produktdienst]
    App3[Container-App 3<br/>Bestellservice]
    
    AppInsights[Application Insights<br/>Telemetrie-Hub]
    LogAnalytics[(Log Analytics<br/>Arbeitsbereich)]
    
    Portal[Azure Portal<br/>Dashboards & Warnungen]
    Query[Kusto-Abfragen<br/>Benutzerdefinierte Analyse]
    
    User --> App1
    App1 --> App2
    App2 --> App3
    
    App1 -.->|Automatische Instrumentierung| AppInsights
    App2 -.->|Automatische Instrumentierung| AppInsights
    App3 -.->|Automatische Instrumentierung| AppInsights
    
    AppInsights --> LogAnalytics
    LogAnalytics --> Portal
    LogAnalytics --> Query
    
    style AppInsights fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
    style LogAnalytics fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
```
### Was automatisch überwacht wird

| Telemetrie-Typ | Erfasste Daten | Anwendungsfall |
|----------------|------------------|----------|
| **Requests** | HTTP-Anfragen, Statuscodes, Dauer | Überwachung der API-Leistung |
| **Dependencies** | Externe Aufrufe (DB, APIs, Speicher) | Engpässe identifizieren |
| **Exceptions** | Unbehandelte Fehler mit Stacktraces | Debugging von Fehlern |
| **Custom Events** | Geschäftliche Ereignisse (Registrierung, Kauf) | Analysen und Funnels |
| **Metrics** | Leistungszähler, benutzerdefinierte Metriken | Kapazitätsplanung |
| **Traces** | Protokollnachrichten mit Schweregrad | Debugging und Audit |
| **Availability** | Verfügbarkeits- und Antwortzeitprüfungen | SLA-Überwachung |

---

## Voraussetzungen

### Benötigte Tools

```bash
# Azure Developer CLI überprüfen
azd version
# ✅ Erwartet: azd version 1.0.0 oder höher

# Azure CLI überprüfen
az --version
# ✅ Erwartet: azure-cli 2.50.0 oder höher
```

### Azure-Anforderungen

- Aktives Azure-Abonnement
- Berechtigungen zum Erstellen von:
  - Application Insights-Ressourcen
  - Log Analytics-Arbeitsbereichen
  - Container Apps
  - Ressourcengruppen

### Vorkenntnisse

Sie sollten abgeschlossen haben:
- [AZD-Grundlagen](../chapter-01-foundation/azd-basics.md) - Kernkonzepte von AZD
- [Konfiguration](../chapter-03-configuration/configuration.md) - Umgebungseinrichtung
- [Erstes Projekt](../chapter-01-foundation/first-project.md) - Grundlegende Bereitstellung

---

## Lektion 1: Automatische Application Insights-Integration mit AZD

### Wie AZD Application Insights bereitstellt

AZD erstellt und konfiguriert Application Insights automatisch, wenn Sie bereitstellen. Schauen wir uns an, wie es funktioniert.

### Projektstruktur

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

### Schritt 1: AZD konfigurieren (azure.yaml)

**Datei: `azure.yaml`**

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

**Das war's!** AZD erstellt standardmäßig Application Insights. Keine zusätzliche Konfiguration für grundlegendes Monitoring erforderlich.

---

### Schritt 2: Monitoring-Infrastruktur (Bicep)

**Datei: `infra/core/monitoring.bicep`**

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

### Schritt 3: Container App mit Application Insights verbinden

**Datei: `infra/app/api.bicep`**

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

### Schritt 4: Anwendungs-Code mit Telemetrie

**Datei: `src/app.py`**

```python
from flask import Flask, request, jsonify
from opencensus.ext.azure.log_exporter import AzureLogHandler
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.ext.flask.flask_middleware import FlaskMiddleware
from opencensus.trace.samplers import ProbabilitySampler
import logging
import os

app = Flask(__name__)

# Application Insights-Verbindungszeichenfolge abrufen
connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

if connection_string:
    # Verteiltes Tracing konfigurieren
    middleware = FlaskMiddleware(
        app,
        exporter=AzureExporter(connection_string=connection_string),
        sampler=ProbabilitySampler(rate=1.0)  # 100%-Sampling für die Entwicklung
    )
    
    # Logging konfigurieren
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
    
    # Datenbankaufruf simulieren (wird automatisch als Abhängigkeit erfasst)
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
    time.sleep(3)  # Langsame Operation simulieren
    logger.warning('Endpoint took 3 seconds to respond')
    return jsonify({'message': 'Slow operation completed'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
```

**Datei: `src/requirements.txt`**

```txt
Flask==3.0.0
opencensus-ext-azure==1.1.13
opencensus-ext-flask==0.8.1
gunicorn==21.2.0
```

---

### Schritt 5: Bereitstellen und Überprüfen

```bash
# AZD initialisieren
azd init

# Bereitstellen (richtet Application Insights automatisch ein)
azd up

# App-URL abrufen
APP_URL=$(azd env get-values | grep API_URL | cut -d '=' -f2 | tr -d '"')

# Telemetrie generieren
curl $APP_URL/health
curl $APP_URL/api/products
curl $APP_URL/api/error-test
curl $APP_URL/api/slow
```

**✅ Erwartete Ausgabe:**
```json
{
  "status": "healthy",
  "monitoring": "enabled"
}
```

---

### Schritt 6: Telemetrie im Azure-Portal anzeigen

```bash
# Application Insights-Details abrufen
azd env get-values | grep APPLICATIONINSIGHTS

# Im Azure-Portal öffnen
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"') \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"') \
  --query "appId" -o tsv
```

**Navigieren Sie im Azure-Portal → Application Insights → Transaktionssuche**

Sie sollten Folgendes sehen:
- ✅ HTTP-Anfragen mit Statuscodes
- ✅ Anfrage-Dauer (3+ Sekunden für `/api/slow`)
- ✅ Ausnahme-Details von `/api/error-test`
- ✅ Benutzerdefinierte Protokollmeldungen

---

## Lektion 2: Benutzerdefinierte Telemetrie und Ereignisse

### Geschäftsereignisse verfolgen

Fügen wir benutzerdefinierte Telemetrie für geschäftskritische Ereignisse hinzu.

**Datei: `src/telemetry.py`**

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
        
        # Logger einrichten
        self.logger = logging.getLogger(__name__)
        self.logger.addHandler(AzureLogHandler(connection_string=self.connection_string))
        self.logger.setLevel(logging.INFO)
        
        # Metrik-Exporter einrichten
        self.stats = stats_module.stats
        self.view_manager = self.stats.view_manager
        self.stats_recorder = self.stats.stats_recorder
        
        exporter = metrics_exporter.new_metrics_exporter(
            connection_string=self.connection_string
        )
        self.view_manager.register_exporter(exporter)
        
        # Tracer einrichten
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

# Globaler Telemetrie-Client
telemetry = TelemetryClient()
```

### Anwendung mit benutzerdefinierten Ereignissen aktualisieren

**Datei: `src/app.py` (erweitert)**

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
    
    # Geschäftsereignis protokollieren
    telemetry.track_event('Purchase', {
        'product_id': product_id,
        'quantity': quantity,
        'total_amount': price * quantity,
        'user_id': request.headers.get('X-User-Id', 'anonymous')
    })
    
    # Umsatzmetrik protokollieren
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
    
    # Suche simulieren (wäre eine echte Datenbankabfrage)
    results = [{'id': 1, 'name': f'Result for {query}'}]
    
    duration = (time.time() - start_time) * 1000  # In ms umrechnen
    
    # Suchereignis protokollieren
    telemetry.track_event('Search', {
        'query': query,
        'results_count': len(results),
        'duration_ms': duration
    })
    
    # Suchleistungsmetrik protokollieren
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
        # Externen API-Aufruf simulieren
        response = requests.get('https://api.example.com/data', timeout=5)
        result = response.json()
    except Exception as e:
        success = False
        result = {'error': str(e)}
    
    duration = (time.time() - start_time) * 1000
    
    # Abhängigkeit protokollieren
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

### Benutzerdefinierte Telemetrie testen

```bash
# Kaufereignis verfolgen
curl -X POST $APP_URL/api/purchase \
  -H "Content-Type: application/json" \
  -H "X-User-Id: user123" \
  -d '{"product_id": 1, "quantity": 2, "price": 29.99}'

# Suchereignis verfolgen
curl "$APP_URL/api/search?q=laptop"

# Externe Abhängigkeit verfolgen
curl $APP_URL/api/external-call
```

**Im Azure-Portal anzeigen:**

Navigieren Sie zu Application Insights → Protokolle, und führen Sie dann aus:

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

## Lektion 3: Verteiltes Tracing für Microservices

### Dienstübergreifendes Tracing aktivieren

Bei Microservices korreliert Application Insights Anfragen automatisch über Services hinweg.

**Datei: `infra/main.bicep`**

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

### End-to-End-Transaktion anzeigen

```mermaid
sequenceDiagram
    participant User as Benutzer
    participant Gateway as API-Gateway<br/>(Trace-ID: abc123)
    participant Product as Produktservice<br/>(Übergeordnete ID: abc123)
    participant Order as Bestellservice<br/>(Übergeordnete ID: abc123)
    participant AppInsights as Anwendungs-Insights
    
    User->>Gateway: POST /api/checkout
    Note over Gateway: Trace starten: abc123
    Gateway->>AppInsights: Anfrage protokollieren (Trace-ID: abc123)
    
    Gateway->>Product: GET /products/123
    Note over Product: Übergeordnete ID: abc123
    Product->>AppInsights: Abhängigkeitsaufruf protokollieren
    Product-->>Gateway: Produktdetails
    
    Gateway->>Order: POST /orders
    Note over Order: Übergeordnete ID: abc123
    Order->>AppInsights: Abhängigkeitsaufruf protokollieren
    Order-->>Gateway: Bestellung erstellt
    
    Gateway-->>User: Checkout abgeschlossen
    Gateway->>AppInsights: Antwort protokollieren (Dauer: 450ms)
    
    Note over AppInsights: Korrelation durch Trace-ID
```
**End-to-End-Trace abfragen:**

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

## Lektion 4: Live-Metriken und Echtzeitüberwachung

### Live-Metrik-Stream aktivieren

Live-Metriken liefern Telemetrie in Echtzeit mit <1 Sekunde Latenz.

**Auf Live-Metriken zugreifen:**

```bash
# Application Insights-Ressource abrufen
APPI_NAME=$(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"')

# Ressourcengruppe abrufen
RG_NAME=$(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"')

echo "Navigate to: Azure Portal → Resource Groups → $RG_NAME → $APPI_NAME → Live Metrics"
```

**Was Sie in Echtzeit sehen:**
- ✅ Eingehende Anforderungsrate (Anfragen/Sekunde)
- ✅ Ausgehende Abhängigkeitsaufrufe
- ✅ Anzahl von Ausnahmen
- ✅ CPU- und Speicherauslastung
- ✅ Anzahl aktiver Server
- ✅ Stichproben-Telemetrie

### Last zum Testen erzeugen

```bash
# Erzeuge Last, um Live-Metriken zu sehen
for i in {1..100}; do
  curl $APP_URL/api/products &
  curl $APP_URL/api/search?q=test$i &
done

# Beobachte Live-Metriken im Azure-Portal
# Sie sollten einen starken Anstieg der Anforderungsrate sehen
```

---

## Praktische Übungen

### Übung 1: Warnungen einrichten ⭐⭐ (Mittel)

**Ziel**: Warnungen für hohe Fehlerquoten und langsame Antworten erstellen.

**Schritte:**

1. **Warnung für Fehlerquote erstellen:**

```bash
# Application Insights-Ressourcen-ID abrufen
APPI_ID=$(az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "id" -o tsv)

# Metrikwarnung für fehlgeschlagene Anfragen erstellen
az monitor metrics alert create \
  --name "High-Error-Rate" \
  --resource-group $RG_NAME \
  --scopes $APPI_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "Alert when error rate exceeds 10 per 5 minutes"
```

2. **Warnung für langsame Antworten erstellen:**

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

3. **Warnung mittels Bicep erstellen (vorzugsweise für AZD):**

**Datei: `infra/core/alerts.bicep`**

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

4. **Warnungen testen:**

```bash
# Fehler erzeugen
for i in {1..20}; do
  curl $APP_URL/api/error-test
done

# Langsame Antworten erzeugen
for i in {1..10}; do
  curl $APP_URL/api/slow
done

# Alarmstatus prüfen (5-10 Minuten warten)
az monitor metrics alert list \
  --resource-group $RG_NAME \
  --query "[].{Name:name, Enabled:enabled, State:properties.enabled}" \
  --output table
```

**✅ Erfolgskriterien:**
- ✅ Warnungen erfolgreich erstellt
- ✅ Warnungen lösen aus, wenn Schwellenwerte überschritten werden
- ✅ Warnverlauf im Azure-Portal einsehbar
- ✅ In AZD-Bereitstellung integriert

**Zeit**: 20-25 Minuten

---

### Übung 2: Eigenes Dashboard erstellen ⭐⭐ (Mittel)

**Ziel**: Ein Dashboard erstellen, das wichtige Anwendungsmetriken anzeigt.

**Schritte:**

1. **Dashboard über das Azure-Portal erstellen:**

Navigieren zu: Azure-Portal → Dashboards → Neues Dashboard

2. **Kacheln für wichtige Kennzahlen hinzufügen:**

- Anzahl der Anfragen (letzte 24 Stunden)
- Durchschnittliche Antwortzeit
- Fehlerquote
- Top 5 langsamste Operationen
- Geografische Verteilung der Benutzer

3. **Dashboard per Bicep erstellen:**

**Datei: `infra/core/dashboard.bicep`**

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

4. **Dashboard bereitstellen:**

```bash
# Zu main.bicep hinzufügen
module dashboard './core/dashboard.bicep' = {
  name: 'dashboard'
  scope: rg
  params: {
    dashboardName: 'dashboard-${environmentName}'
    applicationInsightsId: monitoring.outputs.applicationInsightsId
    location: location
  }
}

# Bereitstellen
azd up
```

**✅ Erfolgskriterien:**
- ✅ Dashboard zeigt wichtige Kennzahlen an
- ✅ Kann im Azure-Portal angeheftet werden
- ✅ Aktualisiert sich in Echtzeit
- ✅ Über AZD bereitstellbar

**Zeit**: 25-30 Minuten

---

### Übung 3: KI/LLM-Anwendung überwachen ⭐⭐⭐ (Fortgeschritten)

**Ziel**: Nutzung von Microsoft Foundry-Modellen verfolgen (Tokens, Kosten, Latenz).

**Schritte:**

1. **Überwachungs-Wrapper für KI erstellen:**

**Datei: `src/ai_telemetry.py`**

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
            # Microsoft Foundry-Modelle aufrufen
            response = self.client.chat.completions.create(
                model=model,
                messages=messages,
                **kwargs
            )
            
            duration = (time.time() - start_time) * 1000  # ms
            
            # Nutzungsdaten extrahieren
            usage = response.usage
            prompt_tokens = usage.prompt_tokens
            completion_tokens = usage.completion_tokens
            total_tokens = usage.total_tokens
            
            # Kosten berechnen (gpt-4.1-Preise)
            prompt_cost = (prompt_tokens / 1000) * 0.03  # $0,03 pro 1.000 Token
            completion_cost = (completion_tokens / 1000) * 0.06  # $0,06 pro 1.000 Token
            total_cost = prompt_cost + completion_cost
            
            # Benutzerdefiniertes Ereignis verfolgen
            telemetry.track_event('OpenAI_Request', {
                'model': model,
                'prompt_tokens': prompt_tokens,
                'completion_tokens': completion_tokens,
                'total_tokens': total_tokens,
                'duration_ms': duration,
                'cost_usd': total_cost,
                'success': True
            })
            
            # Metriken verfolgen
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

2. **Überwachten Client verwenden:**

```python
from flask import Flask, request, jsonify
from ai_telemetry import MonitoredAzureOpenAI
import os

app = Flask(__name__)

# Überwachten OpenAI-Client initialisieren
openai_client = MonitoredAzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

@app.route('/api/chat', methods=['POST'])
def chat():
    data = request.json
    user_message = data.get('message')
    
    # Aufruf mit automatischer Überwachung
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

3. **KI-Metriken abfragen:**

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

**✅ Erfolgskriterien:**
- ✅ Jeder OpenAI-Aufruf wird automatisch verfolgt
- ✅ Tokenverbrauch und Kosten sichtbar
- ✅ Latenz überwacht
- ✅ Budget-Warnungen konfigurierbar

**Zeit**: 35-45 Minuten

---

## Kostenoptimierung

### Sampling-Strategien

Kontrollieren Sie Kosten durch Sampling der Telemetrie:

```python
from opencensus.trace.samplers import ProbabilitySampler

# Entwicklung: 100 % Sampling
sampler = ProbabilitySampler(rate=1.0)

# Produktion: 10 % Sampling (reduziert die Kosten um 90 %)
sampler = ProbabilitySampler(rate=0.1)

# Adaptives Sampling (passt sich automatisch an)
from opencensus.trace.samplers import AdaptiveSampler
sampler = AdaptiveSampler()
```

**In Bicep:**

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  properties: {
    SamplingPercentage: 10  // 10% sampling
  }
}
```

### Datenaufbewahrung

```bicep
resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: logAnalyticsName
  properties: {
    retentionInDays: 30  // Minimum (cheapest)
    // Options: 30, 31, 60, 90, 120, 180, 270, 365, 550, 730
  }
}
```

### Monatliche Kostenschätzungen

| Datenvolumen | Aufbewahrung | Monatliche Kosten |
|-------------|-----------|--------------|
| 1 GB/Monat | 30 Tage | ~\$2-5 |
| 5 GB/Monat | 30 Tage | ~\$10-15 |
| 10 GB/Monat | 90 Tage | ~\$25-40 |
| 50 GB/Monat | 90 Tage | ~\$100-150 |

**Kostenlose Stufe**: 5 GB/Monat inklusive

---

## Wissensüberprüfung

### 1. Grundlegende Integration ✓

Überprüfen Sie Ihr Verständnis:

- [ ] **Q1**: Wie stellt AZD Application Insights bereit?
  - **A**: Automatisch über Bicep-Vorlagen in `infra/core/monitoring.bicep`

- [ ] **Q2**: Welche Umgebungsvariable aktiviert Application Insights?
  - **A**: `APPLICATIONINSIGHTS_CONNECTION_STRING`

- [ ] **Q3**: Welche drei Haupt-Telemetriearten gibt es?
  - **A**: Requests (HTTP-Aufrufe), Dependencies (externe Aufrufe), Exceptions (Fehler)

**Praktische Überprüfung:**
```bash
# Überprüfen, ob Application Insights konfiguriert ist
azd env get-values | grep APPLICATIONINSIGHTS

# Überprüfen, ob Telemetrie fließt
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "requests/count"
```

---

### 2. Benutzerdefinierte Telemetrie ✓

Überprüfen Sie Ihr Verständnis:

- [ ] **Q1**: Wie verfolgen Sie benutzerdefinierte Geschäftsvorfälle?
  - **A**: Verwenden Sie den Logger mit `custom_dimensions` oder `TelemetryClient.track_event()`

- [ ] **Q2**: Was ist der Unterschied zwischen Ereignissen und Metriken?
  - **A**: Ereignisse sind diskrete Vorkommnisse, Metriken sind numerische Messwerte

- [ ] **Q3**: Wie korrelieren Sie Telemetrie über Services hinweg?
  - **A**: Application Insights verwendet automatisch `operation_Id` zur Korrelation

**Praktische Überprüfung:**
```kusto
// Verify custom events
traces
| where customDimensions.event_name != ""
| summarize count() by tostring(customDimensions.event_name)
```

---

### 3. Produktionsüberwachung ✓

Überprüfen Sie Ihr Verständnis:

- [ ] **Q1**: Was ist Sampling und warum verwendet man es?
  - **A**: Sampling reduziert das Datenvolumen (und die Kosten), indem nur ein Prozentsatz der Telemetrie erfasst wird

- [ ] **Q2**: Wie richten Sie Warnungen ein?
  - **A**: Verwenden Sie Metrik-Warnungen in Bicep oder im Azure-Portal basierend auf Application Insights-Metriken

- [ ] **Q3**: Was ist der Unterschied zwischen Log Analytics und Application Insights?
  - **A**: Application Insights speichert Daten im Log Analytics-Arbeitsbereich; App Insights bietet anwendungsspezifische Ansichten

**Praktische Überprüfung:**
```bash
# Sampling-Konfiguration prüfen
az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "properties.SamplingPercentage"
```

---

## Bewährte Vorgehensweisen

### ✅ TUN SIE:

1. **Verwenden Sie Korrelations-IDs**
   ```python
   logger.info('Processing order', extra={
       'custom_dimensions': {
           'order_id': order_id,
           'user_id': user_id
       }
   })
   ```

2. **Richten Sie Warnungen für kritische Metriken ein**
   ```bicep
   // Error rate, slow responses, availability
   ```

3. **Verwenden Sie strukturiertes Logging**
   ```python
   # ✅ GUT: Strukturiert
   logger.info('User signup', extra={'custom_dimensions': {'user_id': 123}})
   
   # ❌ SCHLECHT: Unstrukturiert
   logger.info(f'User 123 signed up')
   ```

4. **Überwachen Sie Abhängigkeiten**
   ```python
   # Datenbankaufrufe, HTTP-Anfragen usw. automatisch verfolgen.
   ```

5. **Verwenden Sie Live-Metriken während der Bereitstellung**

### ❌ NICHT TUN:

1. **Protokollieren Sie keine sensiblen Daten**
   ```python
   # ❌ SCHLECHT
   logger.info(f'Login: {username}:{password}')
   
   # ✅ GUT
   logger.info('Login attempt', extra={'custom_dimensions': {'username': username}})
   ```

2. **Verwenden Sie in der Produktion kein 100%-Sampling**
   ```python
   # ❌ Teuer
   sampler = ProbabilitySampler(rate=1.0)
   
   # ✅ Kosteneffizient
   sampler = ProbabilitySampler(rate=0.1)
   ```

3. **Ignorieren Sie keine Dead-Letter-Queues**

4. **Vergessen Sie nicht, Aufbewahrungsgrenzen festzulegen**

---

## Fehlerbehebung

### Problem: Keine Telemetrie sichtbar

**Diagnose:**
```bash
# Überprüfen Sie, ob die Verbindungszeichenfolge gesetzt ist
azd env get-values | grep APPLICATIONINSIGHTS

# Überprüfen Sie die Anwendungsprotokolle über Azure Monitor
azd monitor --logs

# Oder verwenden Sie die Azure CLI für Container-Apps:
az containerapp logs show --name $APP_NAME --resource-group $RG_NAME --tail 50
```

**Lösung:**
```bash
# Überprüfen Sie die Verbindungszeichenfolge in der Container-App
az containerapp show \
  --name $APP_NAME \
  --resource-group $RG_NAME \
  --query "properties.template.containers[0].env" \
  | grep -i applicationinsights
```

---

### Problem: Hohe Kosten

**Diagnose:**
```bash
# Datenaufnahme prüfen
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "availabilityResults/count"
```

**Lösung:**
- Sampling-Rate reduzieren
- Aufbewahrungszeitraum verringern
- Ausführliches Logging entfernen

---

## Mehr erfahren

### Offizielle Dokumentation
- [Application Insights Overview](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Application Insights for Python](https://learn.microsoft.com/azure/azure-monitor/app/opencensus-python)
- [Kusto Query Language](https://learn.microsoft.com/azure/data-explorer/kusto/query/)
- [AZD Monitoring](https://learn.microsoft.com/azure/developer/azure-developer-cli/monitor-your-app)

### Nächste Schritte in diesem Kurs
- ← Vorherige: [Vorabprüfungen](preflight-checks.md)
- → Nächste: [Bereitstellungsanleitung](../chapter-04-infrastructure/deployment-guide.md)
- 🏠 [Kurs-Startseite](../../README.md)

### Verwandte Beispiele
- [Microsoft Foundry Models Example](../../../../examples/azure-openai-chat) - KI-Telemetrie
- [Microservices Example](../../../../examples/microservices) - Verteiltes Tracing

---

## Zusammenfassung

**Sie haben gelernt:**
- ✅ Automatische Bereitstellung von Application Insights mit AZD
- ✅ Benutzerdefinierte Telemetrie (Ereignisse, Metriken, Abhängigkeiten)
- ✅ Verteiltes Tracing über Microservices
- ✅ Live-Metriken und Echtzeitüberwachung
- ✅ Warnungen und Dashboards
- ✅ Überwachung von KI/LLM-Anwendungen
- ✅ Strategien zur Kostenoptimierung

**Wichtigste Erkenntnisse:**
1. **AZD stellt Monitoring automatisch bereit** - Keine manuelle Einrichtung
2. **Verwende strukturiertes Logging** - Macht Abfragen einfacher
3. **Verfolge Geschäftsereignisse** - Nicht nur technische Metriken
4. **Überwache KI-Kosten** - Verfolge Token und Ausgaben
5. **Richte Alarme ein** - Sei proaktiv, nicht reaktiv
6. **Optimiere Kosten** - Verwende Stichproben und Aufbewahrungsgrenzen

**Nächste Schritte:**
1. Schließe die praktischen Übungen ab
2. Füge Application Insights zu deinen AZD-Projekten hinzu
3. Erstelle benutzerdefinierte Dashboards für dein Team
4. Lerne [Bereitstellungsanleitung](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Haftungsausschluss:
Dieses Dokument wurde mithilfe des KI-Übersetzungsdienstes Co‑op Translator (https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ausgangssprache ist als maßgebliche Quelle zu betrachten. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Nutzung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->