# אינטגרציית Application Insights עם AZD

⏱️ **זמן משוער**: 40-50 דקות | 💰 **השפעת עלות**: ~5-15$ בחודש | ⭐ **מורכבות**: בינוני

**📚 מסלול למידה:**
- ← קודם: [בדיקות מקדימות](preflight-checks.md) - אימות לפני פריסה
- 🎯 **אתה כאן**: אינטגרציית Application Insights (ניטור, טלמטריה, ניפוי שגיאות)
- → הבא: [מדריך פריסה](../chapter-04-infrastructure/deployment-guide.md) - פריסה ל-Azure
- 🏠 [בית הקורס](../../README.md)

---

## מה תלמד

בסיום השיעור תוכל:
- להכריז על **Application Insights** בתשתית AZD ולהגדיר כלי SDK
- להגדיר **מעקב מבוזר** למיקרו-שירותים
- ליישם **טלמטריה מותאמת** (מדדים, אירועים, תלות)
- להגדיר **מדדים חיים** לניטור בזמן אמת
- ליצור **התראות ולוחות מחוונים** מפריסות AZD
- לנפות תקלות בייצור עם **שאילתות טלמטריה**
- לאופטימיזציה של **עלויות ואסטרטגיות דגימה**
- לנטר **יישומי AI/LLM** (טוקנים, השהיות, עלויות)

## למה Application Insights עם AZD חשוב

### האתגר: נראות בייצור

**ללא Application Insights:**
```
❌ No visibility into production behavior
❌ Manual log aggregation across services
❌ Reactive debugging (wait for customer complaints)
❌ No performance metrics
❌ Cannot trace requests across services
❌ Unknown failure rates and bottlenecks
```

**עם Application Insights + AZD:**
```
✅ Automatic telemetry collection
✅ Centralized logs from all services
✅ Proactive issue detection
✅ End-to-end request tracing
✅ Performance metrics and insights
✅ Real-time dashboards
✅ AZD provisions the monitoring declared in your templates
```

**אנלוגיה**: Application Insights הוא כמו "קופסת שחור" של טייס + לוח מחוונים למטוס האפליקציה שלך. אתה רואה הכל בזמן אמת ויכול להשמיע מחדש כל אירוע.

---

## סקירת ארכיטקטורה

### Application Insights בארכיטקטורת AZD

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

### מה נמדד אוטומטית

כלי האוטומציה נתמכים ותופסים בקשות/תלויות לספריות עם כלי. אירועים ומדדים מותאמים דורשים קוד אפליקציה; בדיקות זמינות חייבות להיות מוגדרות בנפרד. לא נאסף כל שורה רק כי המשאבים קיימים.

| סוג טלמטריה | מה מתועד | מקרה שימוש |
|----------------|-------------------|----------|
| **בקשות** | בקשות HTTP, קודי סטטוס, משך זמן | ניטור ביצועי API |
| **תלויות** | קריאות חיצוניות (DB, APIs, אחסון) | זיהוי צווארי בקבוק |
| **חריגות** | שגיאות שלא טופלו עם עקבות מחסנית | ניפוי תקלות |
| **אירועים מותאמים** | אירועי עסק (הרשמה, רכישה) | אנליטיקה ומסלולים |
| **מדדים** | מדי ביצועים, מדדים מותאמים | תכנון קיבולת |
| **עקבות** | הודעות לוג עם חומרה | ניפוי וביקורת |
| **זמינות** | בדיקות זמינות וזמן תגובה | ניטור SLA |

---

## דרישות מוקדמות

### כלים נדרשים

```bash
# Verify Azure Developer CLI
azd version
# Command reference baseline: azd 1.37.2

# Verify Azure CLI
az --version
# ✅ Expected: azure-cli 2.50.0 or higher
```

### דרישות Azure

- מנוי Azure פעיל
- הרשאות ליצירה:
  - משאבי Application Insights
  - סביבת Log Analytics
  - Container Apps
  - קבוצות משאבים

### דרישות ידע

יש להשלים:
- [יסודות AZD](../chapter-01-foundation/azd-basics.md) - מושגי יסוד של AZD
- [הגדרות](../chapter-03-configuration/configuration.md) - הגדרת סביבה
- [פרויקט ראשון](../chapter-01-foundation/first-project.md) - פריסה בסיסית

---

## שיעור 1: Application Insights אוטומטי עם AZD

### איך AZD מספק Application Insights

AZD מספק Application Insights **רק כאשר התשתית של הפרויקט מגדירה זאת**. `azure.yaml` בלבד לא יוצר ניטור או מגדיר קוד אפליקציה.

> **דוגמת תחום:** שיעור זה כולל שקעים לאינטגרציה, לא פרויקט מלא `monitored-app` במאגר זה. ספק תבנית ראשית ומיפוי פרמטרים, סביבה ל-Container Apps, הגדרת רישום/תמונה וזהות, Dockerfile, ותוויות שירות לפני הפריסה. שיעורים מאוחרים מציגים שקעים חלופיים/הרחבות, לא קבצים שניתן להצמיד ישירות ללא שינוי. התחל עם [דוגמת מיקרו-שירותים](../../../../examples/microservices) הפועלת אם זקוק לבסיס ריצה.

### מבנה פרויקט

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

### שלב 1: הגדרת AZD (azure.yaml)

**קובץ: `azure.yaml`**

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

זה מכריז על השירות שניתן לפריסה. תצורת Bicep ו-SDK שבעקבותיו מספקת ניטור; azd אינו מוסיף אותן אוטומטית.

---

### שלב 2: תשתית ניטור (Bicep)

**קובץ: `infra/core/monitoring.bicep`**

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

### שלב 3: חיבור Container App ל-Application Insights

**קובץ: `infra/app/api.bicep`**

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

### שלב 4: קוד אפליקציה עם טלמטריה

**קובץ: `src/app.py`**

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

**קובץ: `src/requirements.txt`**

```txt
Flask
azure-monitor-opentelemetry
gunicorn
requests
openai
```

פתח תלות אלו בפרויקט שלך, בדוק אותן יחד ונעל את הגרסאות המתקבלות. פרויקטים חדשים צריכים להשתמש ב-Azure Monitor OpenTelemetry, לא ב-OpenCensus Python שהופסק.

---

### שלב 5: פרוס ואמת

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

**✅ פלט צפוי:**
```json
{
  "status": "healthy",
  "monitoring": "enabled"
}
```

---

### שלב 6: צפייה בטלמטריה בפורטל Azure

```bash
# Get Application Insights details
azd env get-values | grep APPLICATIONINSIGHTS

# Open in Azure Portal
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"') \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"') \
  --query "appId" -o tsv
```

**נווט לפורטל Azure → Application Insights → חיפוש עסקאות**

אמור להופיע:
- ✅ בקשות HTTP עם קודי סטטוס
- ✅ משך בקשות (3+ שניות ל-`/api/slow`)
- ✅ פרטי חריגות מ-`/api/error-test`
- ✅ הודעות לוג מותאמות

---

## שיעור 2: טלמטריה מותאמת ואירועים

### מעקב אחרי אירועים עסקיים

נוסיף טלמטריה מותאמת לאירועים קריטיים לעסק.

**קובץ: `src/telemetry.py`**

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

### עדכון אפליקציה עם אירועים מותאמים

**קובץ: `src/app.py` (משודרג)**

הוסף את הנתיבים האלו לאפליקציית Flask הקיימת; שמור על הנתיבים הקודמים לבריאות/בדיקות. הקטע המקוצר למטה מראה אפליקציה נפרדת להבהרה. אתחול הטלמטריה כעת ב-`telemetry.py` — אל תאתחל את המייצאים פעמיים.

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

### בדוק טלמטריה מותאמת

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

**צפה בפורטל Azure:**

נווט ל-Application Insights → רישומים, ואז הרץ:

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

## שיעור 3: מעקב מבוזר למיקרו-שירותים

### אפשר מעקב חוצה שירותים

עם כלי תואמים והפצת W3C trace-context, Application Insights מתאם בין בקשות בשירותים. שיתוף מחרוזת חיבור בלבד אינו יוצר מתחמי הורה-ילד. שקע הארכיטקטורה הבא מתייחס למודולים שעליך לממש.

**קובץ: `infra/main.bicep`**

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

### ראייה עסקית מקצה לקצה

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

**שאילתת מעקב מקצה לקצה:**

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

## שיעור 4: מדדים חיים וניטור בזמן אמת

### אפשר זרם מדדים חיים

מדדי חיים מספקים טלמטריה כמעט בזמן אמת כאשר SDK תומך ומאפשר. זה לא SLA להשהייה. הגדרת OpenTelemetry בפייתון לעיל מאפשרת זאת עם `enable_live_metrics=True`.

**גישה למדדים חיים:**

```bash
# Get Application Insights resource
APPI_NAME=$(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"')

# Get resource group
RG_NAME=$(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"')

echo "Navigate to: Azure Portal → Resource Groups → $RG_NAME → $APPI_NAME → Live Metrics"
```

**מה תראה בזמן אמת:**
- ✅ קצב בקשות נכנסות (בקשות לשנייה)
- ✅ קריאות תלות יוצאות
- ✅ ספירת חריגות
- ✅ שימוש במעבד וזיכרון
- ✅ ספירת שרתים פעילים
- ✅ טלמטריה לדוגמה

### הפעל עומס לבדיקות

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

## תרגילים מעשיים

### תרגיל 1: הגדרת התראות ⭐⭐ (בינוני)

**מטרה**: יצירת התראות לשיעורי שגיאות גבוהים ותגובות איטיות.

**שלבים:**

1. **יצירת התראה לשיעור שגיאות:**

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

2. **יצירת התראה לתגובות איטיות:**

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

3. **יצירת התראה באמצעות Bicep (מועדף ב-AZD):**

**קובץ: `infra/core/alerts.bicep`**

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

4. **בדוק התראות:**

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

**✅ קריטריוני הצלחה:**
- ✅ התראות נוצרו בהצלחה
- ✅ התראות מופעלות כאשר ערכי סף עוברים
- ✅ ניתן לצפות בהיסטוריית התראות בפורטל Azure
- ✅ משולב עם פריסות AZD

**זמן**: 20-25 דקות

---

### תרגיל 2: יצירת לוח מחוונים מותאם ⭐⭐ (בינוני)

**מטרה**: בניית לוח מחוונים המציג מדדים מרכזיים של האפליקציה.

**שלבים:**

1. **צור לוח מחוונים דרך פורטל Azure:**

נווט אל: פורטל Azure → לוחות מחוונים → לוח מחוונים חדש

2. **הוסף אריחים למדדים מרכזיים:**

- ספירת בקשות (24 השעות האחרונות)
- זמן תגובה ממוצע
- שיעור שגיאות
- חמשת האופציות האיטיות ביותר
- התפלגות גיאוגרפית של משתמשים

3. **צור לוח מחוונים דרך Bicep:**

**קובץ: `infra/core/dashboard.bicep`**

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

4. **פרוס לוח מחוונים:**

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

**✅ קריטריוני הצלחה:**
- ✅ הלוח מציג מדדים מרכזיים
- ✅ ניתן להציב כפינה ביתית בפורטל Azure
- ✅ מעודכן בזמן אמת
- ✅ ניתן לפרוס באמצעות AZD

**זמן**: 25-30 דקות

---

### תרגיל 3: ניטור יישום AI/LLM ⭐⭐⭐ (מפורט)

**מטרה**: עקוב אחרי שימוש במודלים Foundry של Microsoft (טוקנים, עלויות, השהיות).

**שלבים:**

1. **צור עטיפת ניטור AI:**

**קובץ: `src/ai_telemetry.py`**

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

2. **השתמש בלקוח עם ניטור:**

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

3. **שאילתת מדדים של AI:**

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

**✅ קריטריוני הצלחה:**
- ✅ כל קריאה ל-OpenAI מתועדת אוטומטית
- ✅ שימוש בטוקנים ועלויות גלויים
- ✅ ניטור השהיות
- ✅ ניתן להגדיר התראות תקציב

**זמן**: 35-45 דקות

---

## אופטימיזציה של עלויות

### אסטרטגיות דגימה

שלוט בעלויות באמצעות דגימת טלמטריה:

```python
import os

# Configure before the one configure_azure_monitor() call in your process.
os.environ["OTEL_TRACES_SAMPLER"] = "microsoft.fixed_percentage"
os.environ["OTEL_TRACES_SAMPLER_ARG"] = "0.1" # 10% trace sampling
```

דגימת עקבות לא מפחיתה כל קטגוריית טלמטריה ב-90%. מדדים ולוגים מפורטים זקוקים לשליטה נפרדת בנפח. בחר את שיעור הדגימה לפי צרכי נראות, לא איסור כולל בייצור.

הגדר במפורש את הדגימה ב-SDK; התכונה `SamplingPercentage` של הרכיב אינה תחליף להגדרת מדגם OpenTelemetry בפייתון.

### שמירת נתונים

```bicep
resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: logAnalyticsName
  properties: {
    retentionInDays: 30  // Minimum (cheapest)
    // Options: 30, 31, 60, 90, 120, 180, 270, 365, 550, 730
  }
}
```

### אומדני עלות חודשית

| נפח נתונים | שמירה | עלות חודשית |
|-------------|---------|--------------|
| 1 GB/חודש | 30 ימים | ~2-5$ |
| 5 GB/חודש | 30 ימים | ~10-15$ |
| 10 GB/חודש | 90 ימים | ~25-40$ |
| 50 GB/חודש | 90 ימים | ~100-150$ |

הערכים הם להמחשה, לא הצעות מחיר. אמת את עלויות האחסון, השמירה, ההתראות והבדיקות באזור ובסכם שלך; תקציבים חינמיים משותפים/מוגדרים לפי תמחור Azure Monitor, לא SKU חינמי מובטח לכל משאב Application Insights.

---

## נקודת בדיקת ידע

### 1. אינטגרציה בסיסית ✓

בדוק את הבנתך:

- [ ] **ש1**: איך AZD מספק Application Insights?
  - **תשובה**: הוא מפרוס את משאבי הניטור שהוגדרו במפורש בתבניות Bicep/Terraform של הפרויקט.

- [ ] **ש2**: מהו משתנה הסביבה שמפעיל Application Insights?
  - **תשובה**: `APPLICATIONINSIGHTS_CONNECTION_STRING`

- [ ] **ש3**: מהם שלושת סוגי הטלמטריה העיקריים?
  - **תשובה**: בקשות (קריאות HTTP), תלות (קריאות חיצוניות), חריגות (שגיאות)

**אימות מעשי:**
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

### 2. טלמטריה מותאמת ✓

בדוק את הבנתך:

- [ ] **ש1**: איך עוקבים אחרי אירועים עסקיים מותאמים?
  - **תשובה**: עטיפת השיעור כותבת לוגים מובנים ב-OTel עם תכונות `event_name`, שניתנים לשאילתה ב-`traces`; אלה אינם אוטומטיים ב-`customEvents`.

- [ ] **ש2**: מה ההבדל בין אירועים למדדים?
  - **תשובה**: אירועים הם מופעים נפרדים, מדדים הם מדידות מספריות

- [ ] **ש3**: איך מתאם טלמטריה בין שירותים?
  - **תשובה**: Application Insights משתמש אוטומטית ב-`operation_Id` לקורלציה

**אימות מעשי:**
```kusto
// Verify custom events
traces
| where customDimensions.event_name != ""
| summarize count() by tostring(customDimensions.event_name)
```

---

### 3. ניטור בייצור ✓

בדוק את הבנתך:

- [ ] **ש1**: מהי דגימה ולמה להשתמש בה?
  - **תשובה**: דגימה מפחיתה נפח נתונים (ובהתאם עלות) על ידי תיעוד רק אחוז מהטלמטריה

- [ ] **ש2**: איך מגדירים התראות?
  - **תשובה**: השתמש בהתראות מדדים ב-Bicep או בפורטל Azure בהתבסס על מדדי Application Insights

- [ ] **ש3**: מה ההבדל בין Log Analytics ל-Application Insights?
  - **תשובה**: Application Insights מאחסן נתונים במרחב עבודה של Log Analytics; App Insights מספק תצוגות מותאמות לאפליקציה

**אימות מעשי:**
```bash
# Check the sampler configured for the running application, not only the ARM component.
az containerapp show --name "$APP_NAME" --resource-group "$RG_NAME" \
  --query "properties.template.containers[].env[?starts_with(name, 'OTEL_TRACES_SAMPLER')]"
```

---

## שיטות עבודה מומלצות

### ✅ עשו:

1. **השתמשו במזהי קורלציה**
   ```python
   logger.info('Processing order', extra={
           'order_id': order_id,
           'user_id': user_id
   })
   ```

2. **הגדירו התראות למדדים קריטיים**
   ```bicep
   // Error rate, slow responses, availability
   ```

3. **השתמשו ביומן מובנה**
   ```python
   # ✅ GOOD: Structured
   logger.info('User signup', extra={'user_id': 'pseudonymous-id'})
   
   # ❌ BAD: Unstructured
   logger.info(f'User 123 signed up')
   ```

4. **נטרו תלותים**
   ```python
   # Automatically track database calls, HTTP requests, etc.
   ```

5. **השתמשו במדדים חיים במהלך פריסות**

### ❌ אל תעשו:

1. **אל תתעד נתונים רגישים**
   ```python
   # ❌ BAD
   logger.info(f'Login: {username}:{password}')
   
   # ✅ GOOD
   logger.info('Login attempt', extra={'result': 'failed'})
   ```

2. **אל תבחר דגימה ללא מדידת נפח וצרכי אבחון**
   ```python
   # ❌ Expensive
   # 100% traces may be appropriate for a small workload or investigation.
   
   # ✅ Cost-effective
   # A lower trace rate reduces visibility; validate coverage before enabling.
   ```

3. **אל תתעלם מתורי מכתבים מתים**

4. **אל תשכח להגדיר גבולות לשמירת נתונים**

---

## פתרון בעיות

### בעיה: לא מופיעה טלמטריה

**אבחון:**
```bash
# Check connection string is set
azd env get-values | grep APPLICATIONINSIGHTS

# Check application logs via Azure Monitor
azd monitor --logs

# Or use Azure CLI for Container Apps:
az containerapp logs show --name $APP_NAME --resource-group $RG_NAME --tail 50
```

**פתרון:**
```bash
# Verify connection string in Container App
az containerapp show \
  --name $APP_NAME \
  --resource-group $RG_NAME \
  --query "properties.template.containers[0].env" \
  | grep -i applicationinsights
```

---

### בעיה: עלויות גבוהות

**אבחון:**
```bash
# Query ingestion volume in the linked Log Analytics workspace.
# WORKSPACE_ID is the workspace customer ID (GUID), not its ARM resource ID.
az monitor log-analytics query --workspace "$WORKSPACE_ID" \
  --analytics-query "Usage | where TimeGenerated > ago(30d) | where IsBillable == true | summarize IngestedMB=sum(Quantity) by DataType"
```

**פתרון:**
- להפחית את קצב הדגימה
- לקצר את תקופת השמירה
- להסיר רישום מפורט מדי

---

## למדו עוד

### תיעוד רשמי
- [סקירת Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [הגדרת Azure Monitor OpenTelemetry](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python)
- [שפת שאילתות Kusto](https://learn.microsoft.com/azure/data-explorer/kusto/query/)
- [AZD ניטור](https://learn.microsoft.com/azure/developer/azure-developer-cli/monitor-your-app)

### הצעדים הבאים בקורס זה
- ← קודם: [בדיקות מקדימות](preflight-checks.md)
- → הבא: [מדריך פריסה](../chapter-04-infrastructure/deployment-guide.md)
- 🏠 [דף הבית של הקורס](../../README.md)

### דוגמאות קשורות
- [דוגמת Microsoft Foundry Models](../../../../examples/azure-openai-chat) - טלמטריית AI
- [דוגמת מיקרו-שירותים](../../../../examples/microservices) - מעקב מבוזר

---

## סיכום

**למדתם:**
- ✅ פריסת Application Insights אוטומטית עם AZD
- ✅ טלמטריה מותאמת (אירועים, מדדים, תלותים)
- ✅ מעקב מבוזר בין מיקרו-שירותים
- ✅ מדדים חיים וניטור בזמן אמת
- ✅ התראות ולוחות בקרה
- ✅ ניטור יישומים מבוססי AI/LLM
- ✅ אסטרטגיות אופטימיזציה של עלויות

**נקודות מרכזיות:**
1. **הכרז על ניטור במפורש** - AZD מפעיל את התבניות שלך; הכלי SDK שולח טלמטריה
2. **השתמש ברישום מובנה** - מקל על שאילתות
3. **עקוב אחרי אירועי עסק** - לא רק מדדים טכניים
4. **נטר עלויות AI** - עקוב אחרי טוקנים והוצאות
5. **הגדר התראות** - היה פרואקטיבי, לא ריאקטיבי
6. **אופטימיזציה של עלויות** - השתמש בדגימה ובגבולות שמירה

**הצעדים הבאים:**
1. השלם את התרגילים המעשיים
2. הוסף את Application Insights לפרויקטים שלך ב-AZD
3. צור לוחות בקרה מותאמים אישית לצוות שלך
4. למד את [מדריך הפריסה](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->