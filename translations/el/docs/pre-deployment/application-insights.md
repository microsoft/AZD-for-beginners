<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e5aa37cdb6378c09099500ac31600b8c",
  "translation_date": "2025-11-21T10:57:30+00:00",
  "source_file": "docs/pre-deployment/application-insights.md",
  "language_code": "el"
}
-->
# Ενσωμάτωση του Application Insights με το AZD

⏱️ **Εκτιμώμενος Χρόνος**: 40-50 λεπτά | 💰 **Επίπτωση Κόστους**: ~$5-15/μήνα | ⭐ **Πολυπλοκότητα**: Μεσαία

**📚 Διαδρομή Μάθησης:**
- ← Προηγούμενο: [Έλεγχοι Προετοιμασίας](preflight-checks.md) - Επικύρωση πριν την ανάπτυξη
- 🎯 **Είστε Εδώ**: Ενσωμάτωση του Application Insights (Παρακολούθηση, τηλεμετρία, αποσφαλμάτωση)
- → Επόμενο: [Οδηγός Ανάπτυξης](../deployment/deployment-guide.md) - Ανάπτυξη στο Azure
- 🏠 [Αρχική Σελίδα Μαθήματος](../../README.md)

---

## Τι θα Μάθετε

Ολοκληρώνοντας αυτό το μάθημα, θα:
- Ενσωματώσετε **Application Insights** σε έργα AZD αυτόματα
- Ρυθμίσετε **κατανεμημένη παρακολούθηση** για μικροϋπηρεσίες
- Υλοποιήσετε **προσαρμοσμένη τηλεμετρία** (μετρήσεις, γεγονότα, εξαρτήσεις)
- Εγκαταστήσετε **ζωντανές μετρήσεις** για παρακολούθηση σε πραγματικό χρόνο
- Δημιουργήσετε **ειδοποιήσεις και πίνακες ελέγχου** από αναπτύξεις AZD
- Αποσφαλματώσετε προβλήματα παραγωγής με **ερωτήματα τηλεμετρίας**
- Βελτιστοποιήσετε **στρατηγικές κόστους και δειγματοληψίας**
- Παρακολουθήσετε **εφαρμογές AI/LLM** (tokens, καθυστερήσεις, κόστη)

## Γιατί το Application Insights με το AZD Είναι Σημαντικό

### Η Πρόκληση: Παρατηρησιμότητα στην Παραγωγή

**Χωρίς το Application Insights:**
```
❌ No visibility into production behavior
❌ Manual log aggregation across services
❌ Reactive debugging (wait for customer complaints)
❌ No performance metrics
❌ Cannot trace requests across services
❌ Unknown failure rates and bottlenecks
```

**Με το Application Insights + AZD:**
```
✅ Automatic telemetry collection
✅ Centralized logs from all services
✅ Proactive issue detection
✅ End-to-end request tracing
✅ Performance metrics and insights
✅ Real-time dashboards
✅ AZD provisions everything automatically
```

**Παραβολή**: Το Application Insights είναι σαν να έχετε έναν "μαύρο κουτί" καταγραφής πτήσης + πίνακα ελέγχου για την εφαρμογή σας. Βλέπετε όλα όσα συμβαίνουν σε πραγματικό χρόνο και μπορείτε να αναπαράγετε οποιοδήποτε περιστατικό.

---

## Επισκόπηση Αρχιτεκτονικής

### Το Application Insights στην Αρχιτεκτονική του AZD

```mermaid
graph TB
    User[Χρήστης/Πελάτης]
    App1[Εφαρμογή Container 1<br/>Πύλη API]
    App2[Εφαρμογή Container 2<br/>Υπηρεσία Προϊόντων]
    App3[Εφαρμογή Container 3<br/>Υπηρεσία Παραγγελιών]
    
    AppInsights[Application Insights<br/>Κέντρο Τηλεμετρίας]
    LogAnalytics[(Log Analytics<br/>Χώρος Εργασίας)]
    
    Portal[Azure Portal<br/>Πίνακες Ελέγχου & Ειδοποιήσεις]
    Query[Kusto Queries<br/>Προσαρμοσμένη Ανάλυση]
    
    User --> App1
    App1 --> App2
    App2 --> App3
    
    App1 -.->|Αυτόματη Ενσωμάτωση| AppInsights
    App2 -.->|Αυτόματη Ενσωμάτωση| AppInsights
    App3 -.->|Αυτόματη Ενσωμάτωση| AppInsights
    
    AppInsights --> LogAnalytics
    LogAnalytics --> Portal
    LogAnalytics --> Query
    
    style AppInsights fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
    style LogAnalytics fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
```
### Τι Παρακολουθείται Αυτόματα

| Τύπος Τηλεμετρίας | Τι Καταγράφει | Χρήση |
|--------------------|---------------|-------|
| **Αιτήματα** | HTTP αιτήματα, κωδικοί κατάστασης, διάρκεια | Παρακολούθηση απόδοσης API |
| **Εξαρτήσεις** | Εξωτερικές κλήσεις (DB, APIs, αποθήκευση) | Εντοπισμός σημείων συμφόρησης |
| **Εξαιρέσεις** | Μη διαχειριζόμενα σφάλματα με ίχνη στοίβας | Αποσφαλμάτωση αποτυχιών |
| **Προσαρμοσμένα Γεγονότα** | Επιχειρηματικά γεγονότα (εγγραφή, αγορά) | Αναλύσεις και χωνιά |
| **Μετρήσεις** | Μετρητές απόδοσης, προσαρμοσμένες μετρήσεις | Σχεδιασμός χωρητικότητας |
| **Ίχνη** | Μηνύματα καταγραφής με σοβαρότητα | Αποσφαλμάτωση και έλεγχος |
| **Διαθεσιμότητα** | Δοκιμές χρόνου λειτουργίας και χρόνου απόκρισης | Παρακολούθηση SLA |

---

## Προαπαιτούμενα

### Απαιτούμενα Εργαλεία

```bash
# Επαλήθευση Azure Developer CLI
azd version
# ✅ Αναμενόμενο: έκδοση azd 1.0.0 ή νεότερη

# Επαλήθευση Azure CLI
az --version
# ✅ Αναμενόμενο: azure-cli 2.50.0 ή νεότερη
```

### Απαιτήσεις Azure

- Ενεργή συνδρομή Azure
- Δικαιώματα για δημιουργία:
  - Πόρων Application Insights
  - Χώρων εργασίας Log Analytics
  - Εφαρμογών Container
  - Ομάδων πόρων

### Γνώσεις Προαπαιτούμενες

Θα πρέπει να έχετε ολοκληρώσει:
- [Βασικά του AZD](../getting-started/azd-basics.md) - Βασικές έννοιες του AZD
- [Ρύθμιση](../getting-started/configuration.md) - Ρύθμιση περιβάλλοντος
- [Πρώτο Έργο](../getting-started/first-project.md) - Βασική ανάπτυξη

---

## Μάθημα 1: Αυτόματο Application Insights με το AZD

### Πώς το AZD Δημιουργεί το Application Insights

Το AZD δημιουργεί και ρυθμίζει αυτόματα το Application Insights κατά την ανάπτυξη. Ας δούμε πώς λειτουργεί.

### Δομή Έργου

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

### Βήμα 1: Ρύθμιση του AZD (azure.yaml)

**Αρχείο: `azure.yaml`**

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

**Αυτό είναι όλο!** Το AZD θα δημιουργήσει το Application Insights από προεπιλογή. Δεν απαιτείται επιπλέον ρύθμιση για βασική παρακολούθηση.

---

### Βήμα 2: Υποδομή Παρακολούθησης (Bicep)

**Αρχείο: `infra/core/monitoring.bicep`**

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

### Βήμα 3: Σύνδεση Εφαρμογής Container με το Application Insights

**Αρχείο: `infra/app/api.bicep`**

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

### Βήμα 4: Κώδικας Εφαρμογής με Τηλεμετρία

**Αρχείο: `src/app.py`**

```python
from flask import Flask, request, jsonify
from opencensus.ext.azure.log_exporter import AzureLogHandler
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.ext.flask.flask_middleware import FlaskMiddleware
from opencensus.trace.samplers import ProbabilitySampler
import logging
import os

app = Flask(__name__)

# Λάβετε τη συμβολοσειρά σύνδεσης του Application Insights
connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

if connection_string:
    # Διαμορφώστε την κατανεμημένη ανίχνευση
    middleware = FlaskMiddleware(
        app,
        exporter=AzureExporter(connection_string=connection_string),
        sampler=ProbabilitySampler(rate=1.0)  # Δειγματοληψία 100% για ανάπτυξη
    )
    
    # Διαμορφώστε την καταγραφή
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
    
    # Προσομοιώστε κλήση βάσης δεδομένων (παρακολουθείται αυτόματα ως εξάρτηση)
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
    time.sleep(3)  # Προσομοιώστε αργή λειτουργία
    logger.warning('Endpoint took 3 seconds to respond')
    return jsonify({'message': 'Slow operation completed'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
```

**Αρχείο: `src/requirements.txt`**

```txt
Flask==3.0.0
opencensus-ext-azure==1.1.13
opencensus-ext-flask==0.8.1
gunicorn==21.2.0
```

---

### Βήμα 5: Ανάπτυξη και Επαλήθευση

```bash
# Αρχικοποίηση AZD
azd init

# Ανάπτυξη (παρέχει αυτόματα το Application Insights)
azd up

# Λήψη URL εφαρμογής
APP_URL=$(azd env get-values | grep API_URL | cut -d '=' -f2 | tr -d '"')

# Δημιουργία τηλεμετρίας
curl $APP_URL/health
curl $APP_URL/api/products
curl $APP_URL/api/error-test
curl $APP_URL/api/slow
```

**✅ Αναμενόμενο αποτέλεσμα:**
```json
{
  "status": "healthy",
  "monitoring": "enabled"
}
```

---

### Βήμα 6: Προβολή Τηλεμετρίας στο Azure Portal

```bash
# Λάβετε λεπτομέρειες του Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Άνοιγμα στο Azure Portal
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"') \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"') \
  --query "appId" -o tsv
```

**Μεταβείτε στο Azure Portal → Application Insights → Αναζήτηση Συναλλαγών**

Θα πρέπει να δείτε:
- ✅ HTTP αιτήματα με κωδικούς κατάστασης
- ✅ Διάρκεια αιτήματος (3+ δευτερόλεπτα για `/api/slow`)
- ✅ Λεπτομέρειες εξαίρεσης από `/api/error-test`
- ✅ Προσαρμοσμένα μηνύματα καταγραφής

---

## Μάθημα 2: Προσαρμοσμένη Τηλεμετρία και Γεγονότα

### Παρακολούθηση Επιχειρηματικών Γεγονότων

Ας προσθέσουμε προσαρμοσμένη τηλεμετρία για κρίσιμα επιχειρηματικά γεγονότα.

**Αρχείο: `src/telemetry.py`**

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
        
        # Ρύθμιση καταγραφέα
        self.logger = logging.getLogger(__name__)
        self.logger.addHandler(AzureLogHandler(connection_string=self.connection_string))
        self.logger.setLevel(logging.INFO)
        
        # Ρύθμιση εξαγωγέα μετρήσεων
        self.stats = stats_module.stats
        self.view_manager = self.stats.view_manager
        self.stats_recorder = self.stats.stats_recorder
        
        exporter = metrics_exporter.new_metrics_exporter(
            connection_string=self.connection_string
        )
        self.view_manager.register_exporter(exporter)
        
        # Ρύθμιση ιχνηλάτη
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

# Παγκόσμιος πελάτης τηλεμετρίας
telemetry = TelemetryClient()
```

### Ενημέρωση Εφαρμογής με Προσαρμοσμένα Γεγονότα

**Αρχείο: `src/app.py` (βελτιωμένο)**

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
    
    # Παρακολούθηση επιχειρηματικού γεγονότος
    telemetry.track_event('Purchase', {
        'product_id': product_id,
        'quantity': quantity,
        'total_amount': price * quantity,
        'user_id': request.headers.get('X-User-Id', 'anonymous')
    })
    
    # Παρακολούθηση μετρικής εσόδων
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
    
    # Προσομοίωση αναζήτησης (θα ήταν πραγματικό ερώτημα βάσης δεδομένων)
    results = [{'id': 1, 'name': f'Result for {query}'}]
    
    duration = (time.time() - start_time) * 1000  # Μετατροπή σε ms
    
    # Παρακολούθηση γεγονότος αναζήτησης
    telemetry.track_event('Search', {
        'query': query,
        'results_count': len(results),
        'duration_ms': duration
    })
    
    # Παρακολούθηση μετρικής απόδοσης αναζήτησης
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
        # Προσομοίωση εξωτερικής κλήσης API
        response = requests.get('https://api.example.com/data', timeout=5)
        result = response.json()
    except Exception as e:
        success = False
        result = {'error': str(e)}
    
    duration = (time.time() - start_time) * 1000
    
    # Παρακολούθηση εξάρτησης
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

### Δοκιμή Προσαρμοσμένης Τηλεμετρίας

```bash
# Παρακολούθηση συμβάντος αγοράς
curl -X POST $APP_URL/api/purchase \
  -H "Content-Type: application/json" \
  -H "X-User-Id: user123" \
  -d '{"product_id": 1, "quantity": 2, "price": 29.99}'

# Παρακολούθηση συμβάντος αναζήτησης
curl "$APP_URL/api/search?q=laptop"

# Παρακολούθηση εξωτερικής εξάρτησης
curl $APP_URL/api/external-call
```

**Προβολή στο Azure Portal:**

Μεταβείτε στο Application Insights → Logs και εκτελέστε:

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

## Μάθημα 3: Κατανεμημένη Παρακολούθηση για Μικροϋπηρεσίες

### Ενεργοποίηση Παρακολούθησης Διασύνδεσης Υπηρεσιών

Για μικροϋπηρεσίες, το Application Insights συσχετίζει αυτόματα αιτήματα μεταξύ υπηρεσιών.

**Αρχείο: `infra/main.bicep`**

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

### Προβολή Συναλλαγής από Άκρο σε Άκρο

```mermaid
sequenceDiagram
    participant User
    participant Gateway as API Gateway<br/>(Αναγνωριστικό Ιχνηλάτησης: abc123)
    participant Product as Υπηρεσία Προϊόντων<br/>(Γονικό Αναγνωριστικό: abc123)
    participant Order as Υπηρεσία Παραγγελιών<br/>(Γονικό Αναγνωριστικό: abc123)
    participant AppInsights as Εφαρμογή Insights
    
    User->>Gateway: POST /api/checkout
    Note over Gateway: Έναρξη Ιχνηλάτησης: abc123
    Gateway->>AppInsights: Καταγραφή αιτήματος (Αναγνωριστικό Ιχνηλάτησης: abc123)
    
    Gateway->>Product: GET /products/123
    Note over Product: Γονικό Αναγνωριστικό: abc123
    Product->>AppInsights: Καταγραφή κλήσης εξάρτησης
    Product-->>Gateway: Λεπτομέρειες προϊόντος
    
    Gateway->>Order: POST /orders
    Note over Order: Γονικό Αναγνωριστικό: abc123
    Order->>AppInsights: Καταγραφή κλήσης εξάρτησης
    Order-->>Gateway: Δημιουργήθηκε παραγγελία
    
    Gateway-->>User: Ολοκλήρωση αγοράς
    Gateway->>AppInsights: Καταγραφή απόκρισης (Διάρκεια: 450ms)
    
    Note over AppInsights: Συσχέτιση με Αναγνωριστικό Ιχνηλάτησης
```
**Ερώτημα για ίχνος από άκρο σε άκρο:**

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

## Μάθημα 4: Ζωντανές Μετρήσεις και Παρακολούθηση σε Πραγματικό Χρόνο

### Ενεργοποίηση Ζωντανής Ροής Μετρήσεων

Οι Ζωντανές Μετρήσεις παρέχουν τηλεμετρία σε πραγματικό χρόνο με καθυστέρηση <1 δευτερόλεπτο.

**Πρόσβαση στις Ζωντανές Μετρήσεις:**

```bash
# Λήψη πόρου Application Insights
APPI_NAME=$(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"')

# Λήψη ομάδας πόρων
RG_NAME=$(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"')

echo "Navigate to: Azure Portal → Resource Groups → $RG_NAME → $APPI_NAME → Live Metrics"
```

**Τι βλέπετε σε πραγματικό χρόνο:**
- ✅ Ρυθμός εισερχόμενων αιτημάτων (αιτήματα/δευτερόλεπτο)
- ✅ Εξερχόμενες κλήσεις εξαρτήσεων
- ✅ Αριθμός εξαιρέσεων
- ✅ Χρήση CPU και μνήμης
- ✅ Αριθμός ενεργών διακομιστών
- ✅ Δείγματα τηλεμετρίας

### Δημιουργία Φορτίου για Δοκιμή

```bash
# Δημιουργήστε φόρτο για να δείτε ζωντανές μετρήσεις
for i in {1..100}; do
  curl $APP_URL/api/products &
  curl $APP_URL/api/search?q=test$i &
done

# Παρακολουθήστε ζωντανές μετρήσεις στο Azure Portal
# Θα πρέπει να δείτε αύξηση του ρυθμού αιτημάτων
```

---

## Πρακτικές Ασκήσεις

### Άσκηση 1: Ρύθμιση Ειδοποιήσεων ⭐⭐ (Μεσαία)

**Στόχος**: Δημιουργία ειδοποιήσεων για υψηλά ποσοστά σφαλμάτων και αργές αποκρίσεις.

**Βήματα:**

1. **Δημιουργία ειδοποίησης για ποσοστό σφαλμάτων:**

```bash
# Λάβετε το αναγνωριστικό πόρου του Application Insights
APPI_ID=$(az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "id" -o tsv)

# Δημιουργήστε ειδοποίηση μέτρησης για αποτυχημένα αιτήματα
az monitor metrics alert create \
  --name "High-Error-Rate" \
  --resource-group $RG_NAME \
  --scopes $APPI_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "Alert when error rate exceeds 10 per 5 minutes"
```

2. **Δημιουργία ειδοποίησης για αργές αποκρίσεις:**

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

3. **Δημιουργία ειδοποίησης μέσω Bicep (προτιμώμενο για AZD):**

**Αρχείο: `infra/core/alerts.bicep`**

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

4. **Δοκιμή ειδοποιήσεων:**

```bash
# Δημιουργία σφαλμάτων
for i in {1..20}; do
  curl $APP_URL/api/error-test
done

# Δημιουργία αργών αποκρίσεων
for i in {1..10}; do
  curl $APP_URL/api/slow
done

# Έλεγχος κατάστασης ειδοποίησης (περιμένετε 5-10 λεπτά)
az monitor metrics alert list \
  --resource-group $RG_NAME \
  --query "[].{Name:name, Enabled:enabled, State:properties.enabled}" \
  --output table
```

**✅ Κριτήρια Επιτυχίας:**
- ✅ Οι ειδοποιήσεις δημιουργήθηκαν επιτυχώς
- ✅ Οι ειδοποιήσεις ενεργοποιούνται όταν ξεπεραστούν τα όρια
- ✅ Μπορείτε να δείτε το ιστορικό ειδοποιήσεων στο Azure Portal
- ✅ Ενσωματωμένες με την ανάπτυξη AZD

**Χρόνος**: 20-25 λεπτά

---

### Άσκηση 2: Δημιουργία Προσαρμοσμένου Πίνακα Ελέγχου ⭐⭐ (Μεσαία)

**Στόχος**: Δημιουργία πίνακα ελέγχου που εμφανίζει βασικές μετρήσεις εφαρμογής.

**Βήματα:**

1. **Δημιουργία πίνακα ελέγχου μέσω Azure Portal:**

Μεταβείτε: Azure Portal → Dashboards → Νέος Πίνακας Ελέγχου

2. **Προσθήκη πλακιδίων για βασικές μετρήσεις:**

- Αριθμός αιτημάτων (τελευταίες 24 ώρες)
- Μέσος χρόνος απόκρισης
- Ποσοστό σφαλμάτων
- 5 πιο αργές λειτουργίες
- Γεωγραφική κατανομή χρηστών

3. **Δημιουργία πίνακα ελέγχου μέσω Bicep:**

**Αρχείο: `infra/core/dashboard.bicep`**

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

4. **Ανάπτυξη πίνακα ελέγχου:**

```bash
# Προσθήκη στο main.bicep
module dashboard './core/dashboard.bicep' = {
  name: 'dashboard'
  scope: rg
  params: {
    dashboardName: 'dashboard-${environmentName}'
    applicationInsightsId: monitoring.outputs.applicationInsightsId
    location: location
  }
}

# Ανάπτυξη
azd up
```

**✅ Κριτήρια Επιτυχίας:**
- ✅ Ο πίνακας ελέγχου εμφανίζει βασικές μετρήσεις
- ✅ Μπορεί να καρφιτσωθεί στην αρχική σελίδα του Azure Portal
- ✅ Ενημερώνεται σε πραγματικό χρόνο
- ✅ Αναπτύξιμος μέσω AZD

**Χρόνος**: 25-30 λεπτά

---

### Άσκηση 3: Παρακολούθηση Εφαρμογής AI/LLM ⭐⭐⭐ (Προχωρημένη)

**Στόχος**: Παρακολούθηση χρήσης Azure OpenAI (tokens, κόστη, καθυστερήσεις).

**Βήματα:**

1. **Δημιουργία περιτυλίγματος παρακολούθησης AI:**

**Αρχείο: `src/ai_telemetry.py`**

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
            # Κλήση Azure OpenAI
            response = self.client.chat.completions.create(
                model=model,
                messages=messages,
                **kwargs
            )
            
            duration = (time.time() - start_time) * 1000  # ms
            
            # Εξαγωγή χρήσης
            usage = response.usage
            prompt_tokens = usage.prompt_tokens
            completion_tokens = usage.completion_tokens
            total_tokens = usage.total_tokens
            
            # Υπολογισμός κόστους (τιμολόγηση GPT-4)
            prompt_cost = (prompt_tokens / 1000) * 0.03  # $0.03 ανά 1K tokens
            completion_cost = (completion_tokens / 1000) * 0.06  # $0.06 ανά 1K tokens
            total_cost = prompt_cost + completion_cost
            
            # Παρακολούθηση προσαρμοσμένου γεγονότος
            telemetry.track_event('OpenAI_Request', {
                'model': model,
                'prompt_tokens': prompt_tokens,
                'completion_tokens': completion_tokens,
                'total_tokens': total_tokens,
                'duration_ms': duration,
                'cost_usd': total_cost,
                'success': True
            })
            
            # Παρακολούθηση μετρήσεων
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

2. **Χρήση παρακολουθούμενου πελάτη:**

```python
from flask import Flask, request, jsonify
from ai_telemetry import MonitoredAzureOpenAI
import os

app = Flask(__name__)

# Αρχικοποίηση παρακολουθούμενου πελάτη OpenAI
openai_client = MonitoredAzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

@app.route('/api/chat', methods=['POST'])
def chat():
    data = request.json
    user_message = data.get('message')
    
    # Κλήση με αυτόματη παρακολούθηση
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

3. **Ερώτημα για μετρήσεις AI:**

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

**✅ Κριτήρια Επιτυχίας:**
- ✅ Κάθε κλήση OpenAI παρακολουθείται αυτόματα
- ✅ Ορατή χρήση tokens και κόστη
- ✅ Παρακολούθηση καθυστερήσεων
- ✅ Δυνατότητα δημιουργίας ειδοποιήσεων προϋπολογισμού

**Χρόνος**: 35-45 λεπτά

---

## Βελτιστοποίηση Κόστους

### Στρατηγικές Δειγματοληψίας

Ελέγξτε το κόστος δειγματοληπτών τηλεμετρίας:

```python
from opencensus.trace.samplers import ProbabilitySampler

# Ανάπτυξη: δειγματοληψία 100%
sampler = ProbabilitySampler(rate=1.0)

# Παραγωγή: δειγματοληψία 10% (μείωση κόστους κατά 90%)
sampler = ProbabilitySampler(rate=0.1)

# Προσαρμοστική δειγματοληψία (προσαρμόζεται αυτόματα)
from opencensus.trace.samplers import AdaptiveSampler
sampler = AdaptiveSampler()
```

**Στο Bicep:**

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  properties: {
    SamplingPercentage: 10  // 10% sampling
  }
}
```

### Διατήρηση Δεδομένων

```bicep
resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: logAnalyticsName
  properties: {
    retentionInDays: 30  // Minimum (cheapest)
    // Options: 30, 31, 60, 90, 120, 180, 270, 365, 550, 730
  }
}
```

### Εκτιμήσεις Μηνιαίου Κόστους

| Όγκος Δεδομένων | Διατήρηση | Μηνιαίο Κόστος |
|-----------------|-----------|----------------|
| 1 GB/μήνα | 30 ημέρες | ~$2-5 |
| 5 GB/μήνα | 30 ημέρες | ~$10-15 |
| 10 GB/μήνα | 90 ημέρες | ~$25-40 |
| 50 GB/μήνα | 90 ημέρες | ~$100-150 |

**Δωρεάν επίπεδο**: 5 GB/μήνα περιλαμβάνονται

---

## Σημείο Ελέγχου Γνώσεων

### 1. Βασική Ενσωμάτωση ✓

Δοκιμάστε την κατανόησή σας:

- [ ] **Ερ.1**: Πώς το AZD δημιουργεί το Application Insights;
  - **Α**: Αυτόματα μέσω προτύπων Bicep στο `infra/core/monitoring.bicep`

- [ ] **Ερ.2**: Ποια μεταβλητή περιβάλλοντος ενεργοποιεί το Application Insights;
  - **Α**: `APPLICATIONINSIGHTS_CONNECTION_STRING`

- [ ] **Ερ.3**: Ποιοι είναι οι τρεις κύριοι τύποι τηλεμετρίας;
  - **Α**: Αιτήματα (κλήσεις HTTP), Εξαρτήσεις (εξωτερικές κλήσεις), Εξαιρέσεις (σφάλματα)

**Επαλήθευση με Πρακτική:**
```bash
# Ελέγξτε αν το Application Insights είναι διαμορφωμένο
azd env get-values | grep APPLICATIONINSIGHTS

# Επαληθεύστε ότι η τηλεμετρία ρέει
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "requests/count"
```

---

### 2. Προσαρμοσμένη Τηλεμετρία ✓

Δοκιμάστε την κατανόησή σας:

- [ ] **Ερ.1**: Πώς παρακολουθείτε προσαρμοσμένα επιχειρηματικά γεγονότα;
  - **Α**: Χρησιμοποιήστε logger με `custom_dimensions` ή `TelemetryClient.track_event()`

- [ ] **Ερ.2**: Ποια είναι η διαφορά μεταξύ γεγονότων και μετρήσεων;
  - **Α**: Τα γεγονότα είναι διακριτές εμφανίσεις, οι μετρήσεις είναι αριθμητικές μετρήσεις

- [ ] **Ερ.3**: Πώς συσχετίζετε τηλεμετρία μεταξύ υπηρεσιών;
  - **Α**: Το Application Insights χρησιμοποιεί αυτόματα `operation_Id` για συσχέτιση

**Επαλήθευση με Πρακτική:**
```kusto
// Verify custom events
traces
| where customDimensions.event_name != ""
| summarize count() by tostring(customDimensions.event_name)
```

---

### 3. Παρακολούθηση Παραγωγής ✓

Δοκιμάστε την κατανόησή σας:

- [ ] **Ερ.1**: Τι είναι η δειγματοληψία και γιατί να τη χρησιμοποιήσετε;
  - **Α**: Η δειγματοληψία μειώνει τον όγκο δεδομένων (και το κόστος) καταγράφοντας μόνο ένα ποσοστό τηλεμετρίας

- [ ] **Ερ.2**: Πώς ρυθμίζετε ειδοποιήσεις;
  - **Α**: Χρησιμοποιήστε ειδοποιήσεις μετρικών στο Bicep ή στο Azure Portal βάσει μετρήσεων Application Insights

- [ ] **Ερ.3**: Ποια είναι η διαφορά μεταξύ Log Analytics και Application Insights;
  - **Α**: Το Application Insights αποθηκεύει δεδομένα σε χώρο εργασίας Log Analytics. Το App Insights παρέχει προβολές ειδικές για εφαρμογές.

**Επαλήθευση με Πρακτική:**
```bash
# Ελέγξτε τη διαμόρφωση δειγματοληψίας
az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "properties.SamplingPercentage"
```

---

## Βέλτιστες Πρακτικές

### ✅ ΚΑΝΤΕ:

1. **Χρησιμοποιήστε IDs συσχέτισης**
   ```python
   logger.info('Processing order', extra={
       'custom_dimensions': {
           'order_id': order_id,
           'user_id': user_id
       }
   })
   ```

2. **Ρυθμίστε ειδοποιήσεις για κρίσιμες μετρήσεις**
   ```bicep
   // Error rate, slow responses, availability
   ```

3. **Χρησιμοποιήστε δομημένη καταγραφή**
   ```python
   # ✅ ΚΑΛΟ: Δομημένο
   logger.info('User signup', extra={'custom_dimensions': {'user_id': 123}})
   
   # ❌ ΚΑΚΟ: Αδόμητο
   logger.info(f'User 123 signed up')
   ```

4. **Παρακολουθήστε εξαρτήσεις**
   ```python
   # Παρακολουθήστε αυτόματα κλήσεις βάσης δεδομένων, αιτήματα HTTP, κ.λπ.
   ```

5. **Χρησιμοποιήστε Ζωντανές Μετρήσεις κατά την ανάπτυξη**

### ❌ ΜΗΝ:

1. **Μην καταγράφετε ευαίσθητα δεδομένα**
   ```python
   # ❌ ΚΑΚΟ
   logger.info(f'Login: {username}:{password}')
   
   # ✅ ΚΑΛΟ
   logger.info('Login attempt', extra={'custom_dimensions': {'username': username}})
   ```

2.
- ✅ Παρακολούθηση εφαρμογών AI/LLM  
- ✅ Στρατηγικές βελτιστοποίησης κόστους  

**Βασικά Σημεία:**  
1. **Το AZD παρέχει αυτόματα παρακολούθηση** - Χωρίς χειροκίνητη ρύθμιση  
2. **Χρησιμοποιήστε δομημένη καταγραφή** - Διευκολύνει την αναζήτηση  
3. **Παρακολουθήστε επιχειρηματικά γεγονότα** - Όχι μόνο τεχνικούς δείκτες  
4. **Παρακολουθήστε το κόστος AI** - Ελέγξτε τα tokens και τις δαπάνες  
5. **Ρυθμίστε ειδοποιήσεις** - Να είστε προληπτικοί, όχι αντιδραστικοί  
6. **Βελτιστοποιήστε το κόστος** - Χρησιμοποιήστε δειγματοληψία και όρια διατήρησης  

**Επόμενα Βήματα:**  
1. Ολοκληρώστε τις πρακτικές ασκήσεις  
2. Προσθέστε το Application Insights στα έργα AZD σας  
3. Δημιουργήστε προσαρμοσμένους πίνακες ελέγχου για την ομάδα σας  
4. Μάθετε [Οδηγός Ανάπτυξης](../deployment/deployment-guide.md)  

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης AI [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->