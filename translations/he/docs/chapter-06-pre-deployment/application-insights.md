# אינטגרציה של Application Insights עם AZD

⏱️ **זמן משוער**: 40-50 דקות | 💰 **השפעת עלות**: ~5-15$/חודש | ⭐ **מורכבות**: בינוני

**📚 מסלול למידה:**
- ← קודם: [בדיקות טרום טיסה](preflight-checks.md) - אימות לפני פריסה
- 🎯 **אתה כאן**: אינטגרציה של Application Insights (ניטור, טלמטריה, איתור שגיאות)
- → הבא: [מדריך פריסה](../chapter-04-infrastructure/deployment-guide.md) - פריסה לאזור Azure
- 🏠 [בית הקורס](../../README.md)

---

## מה תלמד

עם סיום השיעור הזה תוכל:
- לשלב **Application Insights** בפרויקטים של AZD באופן אוטומטי
- להגדיר **מעקב מבוזר** עבור מיקרוסרוויסים
- ליישם **טלמטריה מותאמת אישית** (מדדים, אירועים, תלותים)
- להגדיר **מדדים חיים** לניטור בזמן אמת
- ליצור **התראות ולוחות בקרה** מפריסות AZD
- לתקן בעיות בפרודקשן עם **שאילתות טלמטריה**
- לאפשר **אופטימיזציה של עלויות ואסטרטגיות דגימה**
- לנטר **יישומי AI/LLM** (אסימונים, זמן השהייה, עלויות)

## מדוע Application Insights עם AZD חשוב

### האתגר: נראות בייצור

**בלי Application Insights:**
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
✅ AZD provisions everything automatically
```

**אנלוגיה**: Application Insights הוא כמו "קופסת שחורה" לטיסה + לוח מחוונים לתא טייס של האפליקציה שלך. אתה רואה כל מה שקורה בזמן אמת ויכול לשחק מחדש כל תקרית.

---

## סקירת הארכיטקטורה

### Application Insights בארכיטקטורת AZD

```mermaid
graph TB
    User[משתמש/לקוח]
    App1[אפליקציית מכולה 1<br/>שער API]
    App2[אפליקציית מכולה 2<br/>שירות מוצר]
    App3[אפליקציית מכולה 3<br/>שירות הזמנות]
    
    AppInsights[תובנות יישום<br/>מרכז טלמטריה]
    LogAnalytics[(אנליטיקת לוג<br/>חלל עבודה)]
    
    Portal[פורטל אזור<br/>לוחות מחוונים והתראות]
    Query[שאילתות קוסטו<br/>ניתוח מותאם אישית]
    
    User --> App1
    App1 --> App2
    App2 --> App3
    
    App1 -.->|אוטומציה| AppInsights
    App2 -.->|אוטומציה| AppInsights
    App3 -.->|אוטומציה| AppInsights
    
    AppInsights --> LogAnalytics
    LogAnalytics --> Portal
    LogAnalytics --> Query
    
    style AppInsights fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
    style LogAnalytics fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
```
### מה מתעדכן אוטומטית

| סוג טלמטריה | מה הוא תופס | מקרה שימוש |
|----------------|------------------|----------|
| **בקשות** | בקשות HTTP, קודי סטטוס, משך זמן | ניטור ביצועי API |
| **תלותים** | קריאות חיצוניות (DB, APIs, אחסון) | זיהוי צווארי בקבוק |
| **חריגות** | שגיאות לא מטופלות עם עקבות מחסנית | איתור תקלות |
| **אירועים מותאמים** | אירועים עסקיים (הרשמה, רכישה) | אנליטיקה ומשפכי המרה |
| **מדדים** | מוני ביצועים, מדדים מותאמים | תכנון קיבולת |
| **מעקבים** | הודעות לוג עם חומרה | איתור תקלות וביקורת |
| **זמינות** | בדיקות זמן פעולה וזמן תגובה | ניטור SLA |

---

## דרישות מוקדמות

### כלים נדרשים

```bash
# אמת את ממשק שורת הפקודה למפתחים של אז'ור
azd version
# ✅ צפוי: azd גרסה 1.0.0 או גבוהה יותר

# אמת את ממשק שורת הפקודה של אז'ור
az --version
# ✅ צפוי: azure-cli גרסה 2.50.0 או גבוהה יותר
```

### דרישות Azure

- מנוי Azure פעיל
- הרשאות ליצירה של:
  - משאבי Application Insights
  - אזורי Log Analytics
  - אפליקציות מכולה (Container Apps)
  - קבוצות משאבים

### ידע מוקדם

יש להשלים:
- [יסודות AZD](../chapter-01-foundation/azd-basics.md) - מושגי ליבה של AZD
- [קונפיגורציה](../chapter-03-configuration/configuration.md) - הכנת סביבה
- [פרויקט ראשון](../chapter-01-foundation/first-project.md) - פריסה בסיסית

---

## שיעור 1: Application Insights אוטומטי עם AZD

### איך AZD מספק Application Insights

AZD יוצר ומגדיר את Application Insights אוטומטית בזמן פריסה. הבה נראה איך.

### מבנה הפרויקט

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

# AZD automatically provisions monitoring!
```

**זה הכל!** AZD ייצור Application Insights כברירת מחדל. אין צורך בהגדרות נוספות למעקב בסיסי.

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
```

---

### שלב 3: חיבור אפליקציית מכולה ל-Application Insights

**קובץ: `infra/app/api.bicep`**

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

### שלב 4: קוד אפליקציה עם טלמטריה

**קובץ: `src/app.py`**

```python
from flask import Flask, request, jsonify
from opencensus.ext.azure.log_exporter import AzureLogHandler
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.ext.flask.flask_middleware import FlaskMiddleware
from opencensus.trace.samplers import ProbabilitySampler
import logging
import os

app = Flask(__name__)

# קבל מחרוזת חיבור של Application Insights
connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

if connection_string:
    # הגדר מעקב מבוזר
    middleware = FlaskMiddleware(
        app,
        exporter=AzureExporter(connection_string=connection_string),
        sampler=ProbabilitySampler(rate=1.0)  # דגימה של 100% עבור פיתוח
    )
    
    # הגדר רישום
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
    
    # הדמה של קריאת מסד נתונים (נעקבת אוטומטית כתלות)
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
    time.sleep(3)  # הדמה של פעולה איטית
    logger.warning('Endpoint took 3 seconds to respond')
    return jsonify({'message': 'Slow operation completed'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
```

**קובץ: `src/requirements.txt`**

```txt
Flask==3.0.0
opencensus-ext-azure==1.1.13
opencensus-ext-flask==0.8.1
gunicorn==21.2.0
```

---

### שלב 5: פריסה ואימות

```bash
# אתחל AZD
azd init

# פרוס (מספק את Application Insights אוטומטית)
azd up

# קבל את כתובת ה-URL של האפליקציה
APP_URL=$(azd env get-values | grep API_URL | cut -d '=' -f2 | tr -d '"')

# הפק טלמטריה
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
# קבל פרטים של Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# פתח בפורטל Azure
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"') \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"') \
  --query "appId" -o tsv
```

**נווט לפורטל Azure → Application Insights → חיפוש עסקאות**

צריכה להופיע:
- ✅ בקשות HTTP עם קודי סטטוס
- ✅ משך בקשה (3+ שניות עבור `/api/slow`)
- ✅ פרטי חריגות מ-`/api/error-test`
- ✅ הודעות לוג מותאמות

---

## שיעור 2: טלמטריה ואירועים מותאמים אישית

### מעקב אחר אירועים עסקיים

נוסיף טלמטריה מותאמת לאירועים עסקיים קריטיים.

**קובץ: `src/telemetry.py`**

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
        
        # הגדר מעקב יומנים
        self.logger = logging.getLogger(__name__)
        self.logger.addHandler(AzureLogHandler(connection_string=self.connection_string))
        self.logger.setLevel(logging.INFO)
        
        # הגדר מייצא מדדים
        self.stats = stats_module.stats
        self.view_manager = self.stats.view_manager
        self.stats_recorder = self.stats.stats_recorder
        
        exporter = metrics_exporter.new_metrics_exporter(
            connection_string=self.connection_string
        )
        self.view_manager.register_exporter(exporter)
        
        # הגדר מעקב
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

# לקוח טלמטריה עולמי
telemetry = TelemetryClient()
```

### עדכון אפליקציה עם אירועים מותאמים

**קובץ: `src/app.py` (מוגבר)**

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
    
    # מעקב אחר אירוע עסקי
    telemetry.track_event('Purchase', {
        'product_id': product_id,
        'quantity': quantity,
        'total_amount': price * quantity,
        'user_id': request.headers.get('X-User-Id', 'anonymous')
    })
    
    # מעקב אחר מדד הכנסות
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
    
    # הדמיית חיפוש (יהיה שאילתא אמיתית במסד הנתונים)
    results = [{'id': 1, 'name': f'Result for {query}'}]
    
    duration = (time.time() - start_time) * 1000  # להמיר למילישניות
    
    # מעקב אחר אירוע חיפוש
    telemetry.track_event('Search', {
        'query': query,
        'results_count': len(results),
        'duration_ms': duration
    })
    
    # מעקב אחר מדד ביצועי חיפוש
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
        # הדמיית קריאת API חיצונית
        response = requests.get('https://api.example.com/data', timeout=5)
        result = response.json()
    except Exception as e:
        success = False
        result = {'error': str(e)}
    
    duration = (time.time() - start_time) * 1000
    
    # מעקב אחר תלות
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

### בדיקת טלמטריה מותאמת

```bash
# לעקוב אחר אירוע רכישה
curl -X POST $APP_URL/api/purchase \
  -H "Content-Type: application/json" \
  -H "X-User-Id: user123" \
  -d '{"product_id": 1, "quantity": 2, "price": 29.99}'

# לעקוב אחר אירוע חיפוש
curl "$APP_URL/api/search?q=laptop"

# לעקוב אחר תלות חיצונית
curl $APP_URL/api/external-call
```

**צפה בפורטל Azure:**

נווט ל-Application Insights → יומנים, ואז הרץ:

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

## שיעור 3: מעקב מבוזר למיקרוסרוויסים

### הפעלת מעקב בין שירותים

עבור מיקרוסרוויסים, Application Insights מקשר אוטומטית בקשות בין שירותים.

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

### צפייה בעסקה מקצה לקצה

```mermaid
sequenceDiagram
    participant User
    participant Gateway as שער API<br/>(מזהה מעקב: abc123)
    participant Product as שירות מוצר<br/>(מזהה אב: abc123)
    participant Order as שירות הזמנות<br/>(מזהה אב: abc123)
    participant AppInsights as תובנות יישומים
    
    User->>Gateway: POST /api/checkout
    Note over Gateway: התחלת מעקב: abc123
    Gateway->>AppInsights: רישום בקשה (מזהה מעקב: abc123)
    
    Gateway->>Product: GET /products/123
    Note over Product: מזהה אב: abc123
    Product->>AppInsights: רישום קריאת תלות
    Product-->>Gateway: פרטי מוצר
    
    Gateway->>Order: POST /orders
    Note over Order: מזהה אב: abc123
    Order->>AppInsights: רישום קריאת תלות
    Order-->>Gateway: הזמנה נוצרה
    
    Gateway-->>User: תהליך התשלום הושלם
    Gateway->>AppInsights: רישום תגובה (משך זמן: 450ms)
    
    Note over AppInsights: קורלציה לפי מזהה מעקב
```
**שאילתה למעקב מקצה לקצה:**

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

## שיעור 4: מדדים חיים וניטור בזמן אמת

### הפעלת זרם מדדים חיים

מדדי חיים מספקים טלמטריה בזמן אמת עם השהייה פחות מ-1 שניה.

**גישה למדדים חיים:**

```bash
# קבלת משאב Application Insights
APPI_NAME=$(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"')

# קבלת קבוצת משאבים
RG_NAME=$(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"')

echo "Navigate to: Azure Portal → Resource Groups → $RG_NAME → $APPI_NAME → Live Metrics"
```

**מה תראה בזמן אמת:**
- ✅ קצב בקשות נכנסות (בקשות לשניה)
- ✅ קריאות תלות יוצאות
- ✅ ספירת חריגות
- ✅ שימוש CPU וזיכרון
- ✅ מספר שרתים פעילים
- ✅ דגימות טלמטריה

### יצירת עומס לבדיקה

```bash
# הפעל עומס כדי לראות מדדים חיים
for i in {1..100}; do
  curl $APP_URL/api/products &
  curl $APP_URL/api/search?q=test$i &
done

# צפה במדדים חיים בפורטל Azure
# עליך לראות קפיצת שיעור הבקשות
```

---

## תרגילים מעשיים

### תרגיל 1: הגדרת התראות ⭐⭐ (בינוני)

**מטרה**: ליצור התראות על שיעורי שגיאה גבוהים ותגובות איטיות.

**שלבים:**

1. **יצירת התראה לשיעור שגיאות:**

```bash
# קבל מזהה משאב של Application Insights
APPI_ID=$(az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "id" -o tsv)

# צור התראת מדד עבור בקשות שנכשלו
az monitor metrics alert create \
  --name "High-Error-Rate" \
  --resource-group $RG_NAME \
  --scopes $APPI_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "Alert when error rate exceeds 10 per 5 minutes"
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

3. **יצירת התראה דרך Bicep (מומלץ ל-AZD):**

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

4. **בדיקת התראות:**

```bash
# יצירת שגיאות
for i in {1..20}; do
  curl $APP_URL/api/error-test
done

# יצירת תגובות איטיות
for i in {1..10}; do
  curl $APP_URL/api/slow
done

# בדוק מצב התראה (המתן 5-10 דקות)
az monitor metrics alert list \
  --resource-group $RG_NAME \
  --query "[].{Name:name, Enabled:enabled, State:properties.enabled}" \
  --output table
```

**✅ קריטריוני הצלחה:**
- ✅ התראות נוצרו בהצלחה
- ✅ התראות מופעלות כאשר הגבולות עוברים
- ✅ ניתן לצפות בהיסטוריית התראות בפורטל Azure
- ✅ משולב בפריסות AZD

**זמן**: 20-25 דקות

---

### תרגיל 2: יצירת לוח בקרה מותאם ⭐⭐ (בינוני)

**מטרה**: לבנות לוח בקרה המציג מדדי מפתח של האפליקציה.

**שלבים:**

1. **יצירת לוח בקרה דרך פורטל Azure:**

נווט ל: פורטל Azure → לוחות בקרה → לוח בקרה חדש

2. **הוספת יחידות למדדים מרכזיים:**

- ספירת בקשות (24 שעות אחרונות)
- זמן תגובה ממוצע
- שיעור שגיאות
- 5 פעולות האיטיות ביותר
- הפצה גיאוגרפית של המשתמשים

3. **יצירת לוח בקרה דרך Bicep:**

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

4. **פריסת לוח הבקרה:**

```bash
# הוסף אל main.bicep
module dashboard './core/dashboard.bicep' = {
  name: 'dashboard'
  scope: rg
  params: {
    dashboardName: 'dashboard-${environmentName}'
    applicationInsightsId: monitoring.outputs.applicationInsightsId
    location: location
  }
}

# פרוס
azd up
```

**✅ קריטריוני הצלחה:**
- ✅ לוח הבקרה מציג מדדים מרכזיים
- ✅ ניתן להוסיף דשבורד לבית פורטל Azure
- ✅ מתעדכן בזמן אמת
- ✅ ניתן לפרוס דרך AZD

**זמן**: 25-30 דקות

---

### תרגיל 3: ניטור יישום AI/LLM ⭐⭐⭐ (מתקדם)

**מטרה**: לעקוב אחרי שימוש במודלים Microsoft Foundry (אסימונים, עלויות, זמן השהייה).

**שלבים:**

1. **יצירת עטיפה לניטור AI:**

**קובץ: `src/ai_telemetry.py`**

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
            # קריאה למודלים של Microsoft Foundry
            response = self.client.chat.completions.create(
                model=model,
                messages=messages,
                **kwargs
            )
            
            duration = (time.time() - start_time) * 1000  # מיקרוסופט
            
            # הפקת שימוש
            usage = response.usage
            prompt_tokens = usage.prompt_tokens
            completion_tokens = usage.completion_tokens
            total_tokens = usage.total_tokens
            
            # חישוב עלות (תמחור gpt-4.1)
            prompt_cost = (prompt_tokens / 1000) * 0.03  # 0.03$ לכל 1000 טוקנים
            completion_cost = (completion_tokens / 1000) * 0.06  # 0.06$ לכל 1000 טוקנים
            total_cost = prompt_cost + completion_cost
            
            # מעקב אחרי אירוע מותאם אישית
            telemetry.track_event('OpenAI_Request', {
                'model': model,
                'prompt_tokens': prompt_tokens,
                'completion_tokens': completion_tokens,
                'total_tokens': total_tokens,
                'duration_ms': duration,
                'cost_usd': total_cost,
                'success': True
            })
            
            # מעקב אחרי מדדים
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

2. **שימוש בלקוח מנוטר:**

```python
from flask import Flask, request, jsonify
from ai_telemetry import MonitoredAzureOpenAI
import os

app = Flask(__name__)

# לאתחל לקוח OpenAI במעקב
openai_client = MonitoredAzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

@app.route('/api/chat', methods=['POST'])
def chat():
    data = request.json
    user_message = data.get('message')
    
    # קריאה עם מעקב אוטומטי
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

3. **שאילתות מדדי AI:**

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

**✅ קריטריוני הצלחה:**
- ✅ כל קריאת OpenAI מתועדת אוטומטית
- ✅ שימוש באסימונים ועלויות זמינים
- ✅ זמן השהייה מנוטר
- ✅ ניתן להגדיר התראות תקציב

**זמן**: 35-45 דקות

---

## אופטימיזציה של עלויות

### אסטרטגיות דגימה

שלוט בעלויות על ידי דגימת הטלמטריה:

```python
from opencensus.trace.samplers import ProbabilitySampler

# פיתוח: דגימה של 100%
sampler = ProbabilitySampler(rate=1.0)

# ייצור: דגימה של 10% (הפחתת עלויות ב-90%)
sampler = ProbabilitySampler(rate=0.1)

# דגימה אדפטיבית (מתאימה אוטומטית)
from opencensus.trace.samplers import AdaptiveSampler
sampler = AdaptiveSampler()
```

**בקוד Bicep:**

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  properties: {
    SamplingPercentage: 10  // 10% sampling
  }
}
```

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

### הערכות עלות חודשיות

| נפח נתונים | שמירה | עלות חודשית |
|-------------|-----------|--------------|
| 1 GB/חודש | 30 ימים | ~2-5$ |
| 5 GB/חודש | 30 ימים | ~10-15$ |
| 10 GB/חודש | 90 ימים | ~25-40$ |
| 50 GB/חודש | 90 ימים | ~100-150$ |

**שכבת חינם**: 5 GB/חודש כלול

---

## נקודת בדיקה לידע

### 1. אינטגרציה בסיסית ✓

בדוק את הבנתך:

- [ ] **שאלה 1**: איך AZD מספק Application Insights?
  - **תשובה**: אוטומטית דרך תבניות Bicep ב-`infra/core/monitoring.bicep`

- [ ] **שאלה 2**: איזו משתנה סביבה מפעיל Application Insights?
  - **תשובה**: `APPLICATIONINSIGHTS_CONNECTION_STRING`

- [ ] **שאלה 3**: מהם שלושת סוגי הטלמטריה העיקריים?
  - **תשובה**: בקשות (HTTP), תלותים (קריאות חיצוניות), חריגות (שגיאות)

**אימות מעשי:**
```bash
# בדוק אם Application Insights מוגדר
azd env get-values | grep APPLICATIONINSIGHTS

# אמת שהטלמטריה זורמת
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "requests/count"
```

---

### 2. טלמטריה מותאמת ✓

בדוק את הבנתך:

- [ ] **שאלה 1**: איך מעקב אחר אירועים עסקיים מותאמים?
  - **תשובה**: שימוש ב-logger עם `custom_dimensions` או `TelemetryClient.track_event()`

- [ ] **שאלה 2**: מה ההבדל בין אירועים ומדדים?
  - **תשובה**: אירועים הם הופעות ממוקדות, מדדים הם מדידות מספריות

- [ ] **שאלה 3**: איך מחברים טלמטריה בין שירותים?
  - **תשובה**: Application Insights משתמש אוטומטית ב-`operation_Id` לקישור בין קריאות

**אימות מעשי:**
```kusto
// Verify custom events
traces
| where customDimensions.event_name != ""
| summarize count() by tostring(customDimensions.event_name)
```

---

### 3. ניטור בפרודקשן ✓

בדוק את הבנתך:

- [ ] **שאלה 1**: מהי דגימה ומדוע משתמשים בה?
  - **תשובה**: דגימה מפחיתה נפח נתונים (והעלות) על ידי תיעוד אחוז מהטלמטריה בלבד

- [ ] **שאלה 2**: איך מגדירים התראות?
  - **תשובה**: משתמשים בהתראות מדדים ב-Bicep או בפורטל Azure בהתבסס על מדדי Application Insights

- [ ] **שאלה 3**: מה ההבדל בין Log Analytics ל-Application Insights?
  - **תשובה**: Application Insights מאחסן נתונים ב-Log Analytics; App Insights נותן תצוגות ייעודיות לאפליקציה

**אימות מעשי:**
```bash
# בדוק את תצורת הדגימה
az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "properties.SamplingPercentage"
```

---

## הנחיות טובות

### ✅ עשו:

1. **השתמשו במזהי קורלציה**
   ```python
   logger.info('Processing order', extra={
       'custom_dimensions': {
           'order_id': order_id,
           'user_id': user_id
       }
   })
   ```

2. **הגדירו התראות למדדים קריטיים**
   ```bicep
   // Error rate, slow responses, availability
   ```

3. **השתמשו בלוגים מובנים**
   ```python
   # ✅ טוב: מובנה
   logger.info('User signup', extra={'custom_dimensions': {'user_id': 123}})
   
   # ❌ רע: ללא מבנה
   logger.info(f'User 123 signed up')
   ```

4. **נטרו תלותים**
   ```python
   # מעקב אוטומטי אחר קריאות לבסיס נתונים, בקשות HTTP ועוד.
   ```

5. **השתמשו במדדים חיים בזמן פריסה**

### ❌ אל תעשו:

1. **אל תרשמו נתונים רגישים**
   ```python
   # ❌ רע
   logger.info(f'Login: {username}:{password}')
   
   # ✅ טוב
   logger.info('Login attempt', extra={'custom_dimensions': {'username': username}})
   ```

2. **אל תשתמשו בדגימה של 100% בפרודקשן**
   ```python
   # ❌ יקר
   sampler = ProbabilitySampler(rate=1.0)
   
   # ✅ חסכוני במחיר
   sampler = ProbabilitySampler(rate=0.1)
   ```

3. **אל תתעלמו מתורי מכתבים מתים**

4. **אל תשכחו להגדיר מגבלות שמירת נתונים**

---

## פתרון תקלות

### בעיה: אין טלמטריה שמופיעה

**אבחון:**
```bash
# בדוק שהמחרוזת קישור מוגדרת
azd env get-values | grep APPLICATIONINSIGHTS

# בדוק יומני יישום דרך Azure Monitor
azd monitor --logs

# או השתמש ב-Azure CLI לאפליקציות מכולה:
az containerapp logs show --name $APP_NAME --resource-group $RG_NAME --tail 50
```

**פתרון:**
```bash
# אמת מחרוזת חיבור באפליקציית מכולה
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
# בדוק הכנסת נתונים
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "availabilityResults/count"
```

**פתרון:**
- הפחתת שיעור דגימה
- הקטנת תקופת השמירה
- הסרת לוגים מפורטים מדי

---

## למידה נוספת

### תיעוד רשמי
- [סקירת Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Application Insights לפייתון](https://learn.microsoft.com/azure/azure-monitor/app/opencensus-python)
- [שפת שאילתות Kusto](https://learn.microsoft.com/azure/data-explorer/kusto/query/)
- [ניטור ב-AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/monitor-your-app)

### שלבים הבאים בקורס
- ← קודם: [בדיקות טרום טיסה](preflight-checks.md)
- → הבא: [מדריך פריסה](../chapter-04-infrastructure/deployment-guide.md)
- 🏠 [בית הקורס](../../README.md)

### דוגמאות קשורות
- [דוגמה למודלי Microsoft Foundry](../../../../examples/azure-openai-chat) - טלמטריה AI
- [דוגמה למיקרוסרוויסים](../../../../examples/microservices) - מעקב מבוזר

---

## סיכום

**למדת:**
- ✅ אספקת Application Insights אוטומטית עם AZD
- ✅ טלמטריה מותאמת (אירועים, מדדים, תלותים)
- ✅ מעקב מבוזר בין מיקרוסרוויסים
- ✅ מדדים חיים וניטור בזמן אמת
- ✅ התראות ולוחות בקרה
- ✅ ניטור יישומי AI/LLM
- ✅ אסטרטגיות לאופטימיזציית עלויות

**נקודות מרכזיות:**
1. **ניטור תנאי AZD באופן אוטומטי** - ללא הגדרה ידנית  
2. **השתמש ביומנים מובנים** - מקל על שאילתות  
3. **עקוב אחרי אירועי עסק** - לא רק מדדים טכניים  
4. **נטר עלויות AI** - עקוב אחרי טוקנים והוצאות  
5. **הגדר תראות** - היה יזום, לא תגובתי  
6. **אופטימיזציה של עלויות** - השתמש במדגם ומגבלות שמירה  

**שלבים הבאים:**  
1. סיים את התרגילים המעשיים  
2. הוסף Application Insights לפרויקטי AZD שלך  
3. צור לוחות מחוונים מותאמים אישית לצוות שלך  
4. למד את [מדריך פריסה](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו עושים מאמצים לדייק, יש לקחת בחשבון כי תרגומים אוטומטיים עשויים להכיל שגיאות או אי-דיוקים. המסמך המקורי בשפתו הוא המקור הסמכותי. למידע קריטי מומלץ להשתמש בתרגום מקצועי אנושי. איננו אחראים לאי-הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->