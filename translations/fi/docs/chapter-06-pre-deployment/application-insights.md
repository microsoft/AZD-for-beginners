# Application Insights -integrointi AZD:hen

⏱️ **Arvioitu aika**: 40-50 minuuttia | 💰 **Kustannusvaikutus**: ~$5-15/month | ⭐ **Monimutkaisuus**: Keskitaso

**📚 Oppimispolku:**
- ← Previous: [Esitarkastukset](preflight-checks.md) - Ennen julkaisemista tehtävä varmennus
- 🎯 **Olet tässä**: Application Insights -integrointi (Valvonta, telemetria, virheenkorjaus)
- → Next: [Julkaisu-opas](../chapter-04-infrastructure/deployment-guide.md) - Julkaise Azureen
- 🏠 [Kurssin etusivu](../../README.md)

---

## Mitä opit

Suorittamalla tämän oppitunnin osaat:
- Integroi Application Insights automaattisesti AZD-projekteihin
- Konfiguroi hajautetun jäljityksen mikropalveluille
- Ota käyttöön mukautettu telemetria (mittarit, tapahtumat, riippuvuudet)
- Ota käyttöön live-mittarit reaaliaikaiseen valvontaan
- Luo hälytyksiä ja kojelautoja AZD-julkaisuista
- Vianmääritys tuotannon ongelmiin telemetriahakujen avulla
- Optimoi kustannuksia ja otantastrategioita
- Valvo AI/LLM-sovelluksia (tokenit, latenssi, kustannukset)

## Miksi Application Insights AZD:n kanssa on tärkeää

### Haaste: tuotannon havaittavuus

**Ilman Application Insightsia:**
```
❌ No visibility into production behavior
❌ Manual log aggregation across services
❌ Reactive debugging (wait for customer complaints)
❌ No performance metrics
❌ Cannot trace requests across services
❌ Unknown failure rates and bottlenecks
```

**Application Insights + AZD -yhdistelmä:**
```
✅ Automatic telemetry collection
✅ Centralized logs from all services
✅ Proactive issue detection
✅ End-to-end request tracing
✅ Performance metrics and insights
✅ Real-time dashboards
✅ AZD provisions everything automatically
```

**Analogiana**: Application Insights on kuin sovelluksesi "musta laatikko" -lentotallennin + ohjaamon kojelauta. Näet kaiken, mitä tapahtuu reaaliajassa, ja voit toistaa minkä tahansa tapauksen.

---

## Arkkitehtuurin yleiskatsaus

### Application Insights AZD-arkkitehtuurissa

```mermaid
graph TB
    User[Käyttäjä/Asiakas]
    App1[Konttisovellus 1<br/>API-väylä]
    App2[Konttisovellus 2<br/>Tuotepalvelu]
    App3[Konttisovellus 3<br/>Tilauspalvelu]
    
    AppInsights[Application Insights<br/>Telemetriakeskus]
    LogAnalytics[(Log Analytics<br/>Työtila)]
    
    Portal[Azure-portaali<br/>Koontinäytöt ja hälytykset]
    Query[Kusto-kyselyt<br/>Mukautettu analyysi]
    
    User --> App1
    App1 --> App2
    App2 --> App3
    
    App1 -.->|Automaattinen instrumentointi| AppInsights
    App2 -.->|Automaattinen instrumentointi| AppInsights
    App3 -.->|Automaattinen instrumentointi| AppInsights
    
    AppInsights --> LogAnalytics
    LogAnalytics --> Portal
    LogAnalytics --> Query
    
    style AppInsights fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
    style LogAnalytics fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
```
### Mitä valvotaan automaattisesti

| Telemetriatyyppi | Mitä se tallentaa | Käyttötapaus |
|------------------|-------------------|--------------|
| **Pyynnöt** | HTTP-pyynnöt, tilakoodit, kesto | API-suorituskyvyn valvonta |
| **Riippuvuudet** | Ulkoiset kutsut (tietokanta, API:t, tallennustila) | Pullonkaulojen tunnistaminen |
| **Poikkeukset** | Käsittelemättömät virheet pinon jäljityksineen | Virheiden vianmääritys |
| **Mukautetut tapahtumat** | Liiketoimintatapahtumat (rekisteröityminen, ostos) | Analytiikka ja putket |
| **Mittarit** | Suorituskykylaskurit, mukautetut mittarit | Kapasiteettisuunnittelu |
| **Jäljitykset** | Lokiviestit vakavuustasoineen | Vianmääritys ja auditointi |
| **Saatavuus** | Käytettävyys ja vasteaikatestit | SLA-valvonta |

---

## Edellytykset

### Vaaditut työkalut

```bash
# Tarkista Azure Developer CLI
azd version
# ✅ Odotettu: azd versio 1.0.0 tai uudempi

# Tarkista Azure CLI
az --version
# ✅ Odotettu: azure-cli 2.50.0 tai uudempi
```

### Azure-vaatimukset

- Aktiivinen Azure-tilaus
- Oikeudet luoda:
  - Application Insights -resursseja
  - Log Analytics -työtiloja
  - Container Apps -sovelluksia
  - Resurssiryhmiä

### Tiedolliset edellytykset

Sinun tulisi olla suorittanut:
- [AZD:n perusteet](../chapter-01-foundation/azd-basics.md) - AZD:n keskeiset käsitteet
- [Konfigurointi](../chapter-03-configuration/configuration.md) - Ympäristön asetukset
- [Ensimmäinen projekti](../chapter-01-foundation/first-project.md) - Perusjulkaisu

---

## Oppitunti 1: Automaattinen Application Insights -integrointi AZD:ssä

### Kuinka AZD luo Application Insightsin

AZD luo ja konfiguroi Application Insightsin automaattisesti, kun julkaiset. Katsotaan, miten se toimii.

### Projektin rakenne

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

### Vaihe 1: Konfiguroi AZD (azure.yaml)

**Tiedosto: `azure.yaml`**

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

**Siinä se!** AZD luo Application Insightsin oletuksena. Perusvalvontaan ei tarvita lisäkonfiguraatiota.

---

### Vaihe 2: Valvonta-infrastruktuuri (Bicep)

**Tiedosto: `infra/core/monitoring.bicep`**

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

### Vaihe 3: Yhdistä Container App Application Insightsiin

**Tiedosto: `infra/app/api.bicep`**

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

### Vaihe 4: Sovelluskoodi telemetrialla

**Tiedosto: `src/app.py`**

```python
from flask import Flask, request, jsonify
from opencensus.ext.azure.log_exporter import AzureLogHandler
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.ext.flask.flask_middleware import FlaskMiddleware
from opencensus.trace.samplers import ProbabilitySampler
import logging
import os

app = Flask(__name__)

# Hae Application Insights -yhteysmerkkijono
connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

if connection_string:
    # Määritä hajautettu jäljitys
    middleware = FlaskMiddleware(
        app,
        exporter=AzureExporter(connection_string=connection_string),
        sampler=ProbabilitySampler(rate=1.0)  # 100% näytteenotto kehitystä varten
    )
    
    # Määritä lokitus
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
    
    # Simuloi tietokantakutsua (seurataan automaattisesti riippuvuutena)
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
    time.sleep(3)  # Simuloi hidasta toimintoa
    logger.warning('Endpoint took 3 seconds to respond')
    return jsonify({'message': 'Slow operation completed'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
```

**Tiedosto: `src/requirements.txt`**

```txt
Flask==3.0.0
opencensus-ext-azure==1.1.13
opencensus-ext-flask==0.8.1
gunicorn==21.2.0
```

---

### Vaihe 5: Julkaise ja varmista

```bash
# Alusta AZD
azd init

# Ota käyttöön (luo Application Insights -resurssin automaattisesti)
azd up

# Hae sovelluksen URL-osoite
APP_URL=$(azd env get-values | grep API_URL | cut -d '=' -f2 | tr -d '"')

# Tuota telemetriaa
curl $APP_URL/health
curl $APP_URL/api/products
curl $APP_URL/api/error-test
curl $APP_URL/api/slow
```

**✅ Odotettu tulos:**
```json
{
  "status": "healthy",
  "monitoring": "enabled"
}
```

---

### Vaihe 6: Katso telemetriaa Azure-portaalissa

```bash
# Hae Application Insightsin tiedot
azd env get-values | grep APPLICATIONINSIGHTS

# Avaa Azure-portaalissa
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"') \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"') \
  --query "appId" -o tsv
```

**Siirry Azure-portaaliin → Application Insights → Transaktiohaku**

Näet:
- ✅ HTTP-pyynnöt tilakoodeineen
- ✅ Pyynnön kesto (3+ sekuntia kohdassa `/api/slow`)
- ✅ Poikkeustiedot polusta `/api/error-test`
- ✅ Mukautetut lokiviestit

---

## Oppitunti 2: Mukautettu telemetria ja tapahtumat

### Seuraa liiketoimintatapahtumia

Lisätään mukautettua telemetriaa liiketoiminnan kannalta kriittisille tapahtumille.

**Tiedosto: `src/telemetry.py`**

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
        
        # Määritä lokitin
        self.logger = logging.getLogger(__name__)
        self.logger.addHandler(AzureLogHandler(connection_string=self.connection_string))
        self.logger.setLevel(logging.INFO)
        
        # Määritä metriikkaviejä
        self.stats = stats_module.stats
        self.view_manager = self.stats.view_manager
        self.stats_recorder = self.stats.stats_recorder
        
        exporter = metrics_exporter.new_metrics_exporter(
            connection_string=self.connection_string
        )
        self.view_manager.register_exporter(exporter)
        
        # Määritä jäljitin
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

# Globaali telemetria-asiakas
telemetry = TelemetryClient()
```

### Päivitä sovellus mukautetuilla tapahtumilla

**Tiedosto: `src/app.py` (parannettu)**

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
    
    # Seuraa liiketoimintatapahtumaa
    telemetry.track_event('Purchase', {
        'product_id': product_id,
        'quantity': quantity,
        'total_amount': price * quantity,
        'user_id': request.headers.get('X-User-Id', 'anonymous')
    })
    
    # Seuraa tuottomittausta
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
    
    # Simuloi hakua (olisi oikea tietokantakysely)
    results = [{'id': 1, 'name': f'Result for {query}'}]
    
    duration = (time.time() - start_time) * 1000  # Muunna millisekunneiksi
    
    # Seuraa hakutapahtumaa
    telemetry.track_event('Search', {
        'query': query,
        'results_count': len(results),
        'duration_ms': duration
    })
    
    # Seuraa haun suorituskykymittaria
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
        # Simuloi ulkoista API-kutsua
        response = requests.get('https://api.example.com/data', timeout=5)
        result = response.json()
    except Exception as e:
        success = False
        result = {'error': str(e)}
    
    duration = (time.time() - start_time) * 1000
    
    # Seuraa riippuvuutta
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

### Testaa mukautettu telemetria

```bash
# Seuraa ostotapahtumaa
curl -X POST $APP_URL/api/purchase \
  -H "Content-Type: application/json" \
  -H "X-User-Id: user123" \
  -d '{"product_id": 1, "quantity": 2, "price": 29.99}'

# Seuraa hakutapahtumaa
curl "$APP_URL/api/search?q=laptop"

# Seuraa ulkoista riippuvuutta
curl $APP_URL/api/external-call
```

**Näytä Azure-portaalissa:**

Siirry Application Insights → Lokit, ja suorita sitten:

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

## Oppitunti 3: Hajautettu jäljitys mikropalveluille

### Ota käyttöön palveluiden välinen jäljitys

Mikropalveluille Application Insights korreloi pyynnöt automaattisesti palveluiden välillä.

**Tiedosto: `infra/main.bicep`**

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

### Näytä päästä päähän tapahtuma

```mermaid
sequenceDiagram
    participant User
    participant Gateway as API-väylä<br/>(Seuranta-ID: abc123)
    participant Product as Tuotepalvelu<br/>(Vanhemman ID: abc123)
    participant Order as Tilauspalvelu<br/>(Vanhemman ID: abc123)
    participant AppInsights as Application Insights
    
    User->>Gateway: POST /api/checkout
    Note over Gateway: Aloita seuranta: abc123
    Gateway->>AppInsights: Kirjaa pyyntö (Seuranta-ID: abc123)
    
    Gateway->>Product: GET /products/123
    Note over Product: Vanhemman ID: abc123
    Product->>AppInsights: Kirjaa riippuvuuskutsu
    Product-->>Gateway: Tuotetiedot
    
    Gateway->>Order: POST /orders
    Note over Order: Vanhemman ID: abc123
    Order->>AppInsights: Kirjaa riippuvuuskutsu
    Order-->>Gateway: Tilaus luotu
    
    Gateway-->>User: Kassa valmis
    Gateway->>AppInsights: Kirjaa vastaus (Kesto: 450ms)
    
    Note over AppInsights: Korrelointi Seuranta-ID:n perusteella
```
**Kysely päästä päähän jäljityksestä:**

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

## Oppitunti 4: Live-mittarit ja reaaliaikainen valvonta

### Ota Live Metrics -virta käyttöön

Live Metrics tarjoaa reaaliaikaista telemetriaa alle 1 sekunnin latenssilla.

**Pääsy Live Metricsiin:**

```bash
# Hae Application Insights -resurssi
APPI_NAME=$(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"')

# Hae resurssiryhmä
RG_NAME=$(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"')

echo "Navigate to: Azure Portal → Resource Groups → $RG_NAME → $APPI_NAME → Live Metrics"
```

**Mitä näet reaaliajassa:**
- ✅ Saapuvien pyyntöjen määrä (pyyntöjä/s)
- ✅ Lähtevät riippuvuuskutsut
- ✅ Poikkeusten määrä
- ✅ CPU- ja muistin käyttö
- ✅ Aktiivisten palvelinten määrä
- ✅ Otantatelemetria

### Generoi kuormitusta testausta varten

```bash
# Luo kuormitusta nähdäksesi reaaliaikaiset mittarit
for i in {1..100}; do
  curl $APP_URL/api/products &
  curl $APP_URL/api/search?q=test$i &
done

# Seuraa reaaliaikaisia mittareita Azure-portaalissa
# Sinun pitäisi nähdä pyyntöjen määrän piikki
```

---

## Käytännön harjoitukset

### Harjoitus 1: Aseta hälytykset ⭐⭐ (Keskitaso)

**Tavoite**: Luo hälytykset korkeille virhetiloille ja hitaille vastauksille.

**Vaiheet:**

1. **Luo hälytys virheprosentille:**

```bash
# Hae Application Insights -resurssin tunnus
APPI_ID=$(az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "id" -o tsv)

# Luo mittarihälytys epäonnistuneille pyynnöille
az monitor metrics alert create \
  --name "High-Error-Rate" \
  --resource-group $RG_NAME \
  --scopes $APPI_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "Alert when error rate exceeds 10 per 5 minutes"
```

2. **Luo hälytys hitaista vastauksista:**

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

3. **Luo hälytys Bicepillä (suositeltavaa AZD:lle):**

**Tiedosto: `infra/core/alerts.bicep`**

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

4. **Testaa hälytykset:**

```bash
# Luo virheitä
for i in {1..20}; do
  curl $APP_URL/api/error-test
done

# Luo hitaita vastauksia
for i in {1..10}; do
  curl $APP_URL/api/slow
done

# Tarkista hälytyksen tila (odota 5-10 minuuttia)
az monitor metrics alert list \
  --resource-group $RG_NAME \
  --query "[].{Name:name, Enabled:enabled, State:properties.enabled}" \
  --output table
```

**✅ Onnistumiskriteerit:**
- ✅ Hälytykset luotu onnistuneesti
- ✅ Hälytykset laukeavat kynnysten ylittyessä
- ✅ Voit tarkastella hälytyshistoriaa Azure-portaalissa
- ✅ Integroitu AZD-julkaisuun

**Aika**: 20-25 minuuttia

---

### Harjoitus 2: Luo mukautettu kojelauta ⭐⭐ (Keskitaso)

**Tavoite**: Rakenna kojelauta, joka näyttää keskeiset sovelluksen mittarit.

**Vaiheet:**

1. **Luo kojelauta Azure-portaalin kautta:**

Siirry kohtaan: Azure-portaali → Kojelaudat → Uusi kojelauta

2. **Lisää laattoja keskeisille mittareille:**

- Pyyntöjen määrä (viimeiset 24 tuntia)
- Keskimääräinen vasteaika
- Virheprosentti
- Top 5 hitainta toimintoa
- Käyttäjien maantieteellinen jakautuminen

3. **Luo kojelauta Bicepillä:**

**Tiedosto: `infra/core/dashboard.bicep`**

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

4. **Julkaise kojelauta:**

```bash
# Lisää main.bicep-tiedostoon
module dashboard './core/dashboard.bicep' = {
  name: 'dashboard'
  scope: rg
  params: {
    dashboardName: 'dashboard-${environmentName}'
    applicationInsightsId: monitoring.outputs.applicationInsightsId
    location: location
  }
}

# Ota käyttöön
azd up
```

**✅ Onnistumiskriteerit:**
- ✅ Kojelauta näyttää keskeiset mittarit
- ✅ Voit kiinnittää sen Azure-portaalin etusivulle
- ✅ Päivittyy reaaliajassa
- ✅ Julkaistavissa AZD:llä

**Aika**: 25-30 minuuttia

---

### Harjoitus 3: Valvo AI/LLM-sovellusta ⭐⭐⭐ (Edistynyt)

**Tavoite**: Seuraa Azure OpenAI -käyttöä (tokenit, kustannukset, latenssi).

**Vaiheet:**

1. **Luo AI-valvontakääre:**

**Tiedosto: `src/ai_telemetry.py`**

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
            # Kutsu Azure OpenAI
            response = self.client.chat.completions.create(
                model=model,
                messages=messages,
                **kwargs
            )
            
            duration = (time.time() - start_time) * 1000  # ms
            
            # Nouda käytön tiedot
            usage = response.usage
            prompt_tokens = usage.prompt_tokens
            completion_tokens = usage.completion_tokens
            total_tokens = usage.total_tokens
            
            # Laske kustannus (GPT-4-hinnoittelu)
            prompt_cost = (prompt_tokens / 1000) * 0.03  # $0,03 jokaista 1 000 tokenia kohden
            completion_cost = (completion_tokens / 1000) * 0.06  # $0,06 jokaista 1 000 tokenia kohden
            total_cost = prompt_cost + completion_cost
            
            # Seuraa mukautettua tapahtumaa
            telemetry.track_event('OpenAI_Request', {
                'model': model,
                'prompt_tokens': prompt_tokens,
                'completion_tokens': completion_tokens,
                'total_tokens': total_tokens,
                'duration_ms': duration,
                'cost_usd': total_cost,
                'success': True
            })
            
            # Seuraa mittareita
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

2. **Käytä valvottua asiakasta:**

```python
from flask import Flask, request, jsonify
from ai_telemetry import MonitoredAzureOpenAI
import os

app = Flask(__name__)

# Alusta valvottu OpenAI-asiakas
openai_client = MonitoredAzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

@app.route('/api/chat', methods=['POST'])
def chat():
    data = request.json
    user_message = data.get('message')
    
    # Kutsu automaattisella valvonnalla
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

3. **Kysy AI-mittareita:**

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

**✅ Onnistumiskriteerit:**
- ✅ Jokainen OpenAI-kutsu seurataan automaattisesti
- ✅ Tokenien käyttö ja kustannukset näkyvissä
- ✅ Latenssi valvottu
- ✅ Voit asettaa budjettihälytyksiä

**Aika**: 35-45 minuuttia

---

## Kustannusten optimointi

### Otantastrategiat

Hallinnoi kustannuksia ottamalla näytteitä telemetriasta:

```python
from opencensus.trace.samplers import ProbabilitySampler

# Kehitys: 100 % otanta
sampler = ProbabilitySampler(rate=1.0)

# Tuotanto: 10 % otanta (vähentää kustannuksia 90 %)
sampler = ProbabilitySampler(rate=0.1)

# Mukautuva otanta (säätyy automaattisesti)
from opencensus.trace.samplers import AdaptiveSampler
sampler = AdaptiveSampler()
```

**Bicepissä:**

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  properties: {
    SamplingPercentage: 10  // 10% sampling
  }
}
```

### Tietojen säilytys

```bicep
resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: logAnalyticsName
  properties: {
    retentionInDays: 30  // Minimum (cheapest)
    // Options: 30, 31, 60, 90, 120, 180, 270, 365, 550, 730
  }
}
```

### Kuukausittaiset kustannusarviot

| Datan määrä | Säilytys | Kuukausikustannus |
|-------------|----------|-------------------|
| 1 GB/kuukausi | 30 päivää | ~$2-5 |
| 5 GB/kuukausi | 30 päivää | ~$10-15 |
| 10 GB/kuukausi | 90 päivää | ~$25-40 |
| 50 GB/kuukausi | 90 päivää | ~$100-150 |

**Ilmainen taso**: 5 GB/kk sisältyy

---

## Tiedon tarkistus

### 1. Perusintegrointi ✓

Testaa ymmärrystäsi:

- [ ] **Q1**: Kuinka AZD luo Application Insightsin?
  - **A**: Automaattisesti Bicep-mallien kautta tiedostossa `infra/core/monitoring.bicep`

- [ ] **Q2**: Mikä ympäristömuuttuja mahdollistaa Application Insightsin?
  - **A**: `APPLICATIONINSIGHTS_CONNECTION_STRING`

- [ ] **Q3**: Mitkä ovat kolme päätelemetriatyyppiä?
  - **A**: Pyynnöt (HTTP-kutsut), Riippuvuudet (ulkoiset kutsut), Poikkeukset (virheet)

**Käytännön varmennus:**
```bash
# Tarkista, onko Application Insights määritetty
azd env get-values | grep APPLICATIONINSIGHTS

# Varmista, että telemetria virtaa
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "requests/count"
```

---

### 2. Mukautettu telemetria ✓

Testaa ymmärrystäsi:

- [ ] **Q1**: Miten seuraat mukautettuja liiketoimintatapahtumia?
  - **A**: Käytä loggeria `custom_dimensions`-kentän kanssa tai `TelemetryClient.track_event()`

- [ ] **Q2**: Mikä on ero tapahtumien ja mittarien välillä?
  - **A**: Tapahtumat ovat erillisiä ilmentymiä, mittarit ovat numeerisia mittauksia

- [ ] **Q3**: Miten yhdistät telemetrian palveluiden välillä?
  - **A**: Application Insights käyttää automaattisesti `operation_Id`-kenttää korrelaatioon

**Käytännön varmennus:**
```kusto
// Verify custom events
traces
| where customDimensions.event_name != ""
| summarize count() by tostring(customDimensions.event_name)
```

---

### 3. Tuotannon valvonta ✓

Testaa ymmärrystäsi:

- [ ] **Q1**: Mitä on otanta ja miksi sitä käytetään?
  - **A**: Otanta vähentää datamäärää (ja kustannuksia) keräämällä vain prosenttiosuuden telemetriasta

- [ ] **Q2**: Miten asetat hälytykset?
  - **A**: Käytä metriikkahälytyksiä Bicepillä tai Azure-portaalissa Application Insights -mittareihin perustuen

- [ ] **Q3**: Mikä on ero Log Analyticsin ja Application Insightsin välillä?
  - **A**: Application Insights tallentaa tiedot Log Analytics -työtilaan; App Insights tarjoaa sovelluskohtaiset näkymät

**Käytännön varmennus:**
```bash
# Tarkista otannan asetukset
az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "properties.SamplingPercentage"
```

---

## Parhaat käytännöt

### ✅ TEHDÄ:

1. **Käytä korrelaatio-ID:itä**
   ```python
   logger.info('Processing order', extra={
       'custom_dimensions': {
           'order_id': order_id,
           'user_id': user_id
       }
   })
   ```

2. **Aseta hälytykset kriittisille mittareille**
   ```bicep
   // Error rate, slow responses, availability
   ```

3. **Käytä rakenteellista lokitusta**
   ```python
   # ✅ HYVÄ: Jäsennelty
   logger.info('User signup', extra={'custom_dimensions': {'user_id': 123}})
   
   # ❌ HUONO: Jäsentämätön
   logger.info(f'User 123 signed up')
   ```

4. **Valvo riippuvuuksia**
   ```python
   # Seuraa automaattisesti tietokantakutsuja, HTTP-pyyntöjä jne.
   ```

5. **Käytä Live Metricsia käyttöönottojen aikana**

### ❌ ÄLÄ:

1. **Älä kirjaa luottamuksellisia tietoja**
   ```python
   # ❌ HUONO
   logger.info(f'Login: {username}:{password}')
   
   # ✅ HYVÄ
   logger.info('Login attempt', extra={'custom_dimensions': {'username': username}})
   ```

2. **Älä käytä 100% otantaa tuotannossa**
   ```python
   # ❌ Kallis
   sampler = ProbabilitySampler(rate=1.0)
   
   # ✅ Kustannustehokas
   sampler = ProbabilitySampler(rate=0.1)
   ```

3. **Älä jätä huomioimatta dead letter -jonoja**

4. **Älä unohda asettaa tietojen säilytysrajoja**

---

## Vianetsintä

### Ongelma: Telemetriaa ei näy

**Diagnoosi:**
```bash
# Tarkista, että yhteysmerkkijono on asetettu
azd env get-values | grep APPLICATIONINSIGHTS

# Tarkista sovelluksen lokit Azure Monitorin kautta
azd monitor --logs

# Tai käytä Azure CLI:tä Container Appsia varten:
az containerapp logs show --name $APP_NAME --resource-group $RG_NAME --tail 50
```

**Ratkaisu:**
```bash
# Varmista yhteysmerkkijono Container Appissa
az containerapp show \
  --name $APP_NAME \
  --resource-group $RG_NAME \
  --query "properties.template.containers[0].env" \
  | grep -i applicationinsights
```

---

### Ongelma: Korkeat kustannukset

**Diagnoosi:**
```bash
# Tarkista tietojen tuonti
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "availabilityResults/count"
```

**Ratkaisu:**
- Alenna otantaprosenttia
- Lyhennä säilytysaikaa
- Poista laaja lokitus

---

## Lue lisää

### Virallinen dokumentaatio
- [Application Insights -yleiskatsaus](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Application Insights Pythonille](https://learn.microsoft.com/azure/azure-monitor/app/opencensus-python)
- [Kusto-kyselykieli](https://learn.microsoft.com/azure/data-explorer/kusto/query/)
- [AZD-valvonta](https://learn.microsoft.com/azure/developer/azure-developer-cli/monitor-your-app)

### Seuraavat askeleet tässä kurssissa
- ← Previous: [Esitarkastukset](preflight-checks.md)
- → Next: [Julkaisu-opas](../chapter-04-infrastructure/deployment-guide.md)
- 🏠 [Kurssin etusivu](../../README.md)

### Liittyvät esimerkit
- [Azure OpenAI -esimerkki](../../../../examples/azure-openai-chat) - AI-telemetria
- [Mikropalveluesimerkki](../../../../examples/microservices) - Hajautettu jäljitys

---

## Yhteenveto

**Olet oppinut:**
- ✅ Automaattinen Application Insights -provisiointi AZD:llä
- ✅ Mukautettu telemetria (tapahtumat, mittarit, riippuvuudet)
- ✅ Hajautettu jäljitys mikropalveluissa
- ✅ Live-mittarit ja reaaliaikainen seuranta
- ✅ Hälytykset ja kojelaudat
- ✅ AI/LLM-sovellusten seuranta
- ✅ Kustannusten optimointistrategiat

**Keskeiset opit:**
1. **AZD ottaa valvonnan käyttöön automaattisesti** - Ei manuaalista määritystä
2. **Käytä rakenteista lokitusta** - Helpottaa kyselyjä
3. **Seuraa liiketoimintatapahtumia** - Ei pelkästään teknisiä mittareita
4. **Seuraa AI-kustannuksia** - Seuraa tokenien käyttöä ja kuluja
5. **Ota hälytykset käyttöön** - Toimi ennakoivasti, älä reaktiivisesti
6. **Optimoi kustannuksia** - Käytä otantaa ja säilytysrajoja

**Seuraavat askeleet:**
1. Suorita käytännön harjoitukset
2. Lisää Application Insights AZD-projekteihisi
3. Luo mukautetut kojelaudat tiimillesi
4. Tutustu [Ota käyttöön -opas](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastuuvapauslauseke:
Tämä asiakirja on käännetty tekoälykäännöspalvelulla [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, automatisoidut käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä on pidettävä määräävänä lähteenä. Tärkeiden tietojen osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä mahdollisesti aiheutuvista väärinymmärryksistä tai virheellisistä tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->