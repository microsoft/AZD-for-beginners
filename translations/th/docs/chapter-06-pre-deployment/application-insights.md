# Application Insights Integration with AZD

⏱️ **เวลาที่คาดไว้**: 40-50 นาที | 💰 **ผลกระทบด้านต้นทุน**: ~$5-15/เดือน | ⭐ **ความซับซ้อน**: ปานกลาง

**📚 เส้นทางการเรียนรู้:**
- ← ก่อนหน้า: [ตรวจสอบก่อนการปรับใช้](preflight-checks.md) - การตรวจสอบก่อนการปรับใช้
- 🎯 **คุณอยู่ที่นี่**: การรวม Application Insights (การมอนิเตอร์, เทเลเมทริก, การดีบัก)
- → ถัดไป: [คู่มือการปรับใช้](../chapter-04-infrastructure/deployment-guide.md) - ปรับใช้ไปยัง Azure
- 🏠 [หน้าแรกคอร์ส](../../README.md)

---

## สิ่งที่คุณจะได้เรียนรู้

โดยการทำบทเรียนนี้ให้เสร็จ คุณจะ:
- รวม **Application Insights** เข้ากับโปรเจกต์ AZD โดยอัตโนมัติ
- กำหนดค่า **distributed tracing** สำหรับไมโครเซอร์วิส
- ใช้งาน **เทเลเมทริกที่กำหนดเอง** (metrics, events, dependencies)
- ตั้งค่า **live metrics** สำหรับการมอนิเตอร์แบบเรียลไทม์
- สร้าง **การแจ้งเตือนและแดชบอร์ด** จากการปรับใช้ AZD
- ดีบักปัญหาใน production ด้วย **คำสืบค้นเทเลเมทริก**
- ปรับแต่ง **ต้นทุนและกลยุทธ์การสุ่มตัวอย่าง**
- มอนิเตอร์ **แอป AI/LLM** (tokens, ความหน่วง, ต้นทุน)

## ทำไม Application Insights กับ AZD จึงสำคัญ

### ความท้าทาย: การสังเกตได้ในสภาพแวดล้อมการผลิต

**หากไม่มี Application Insights:**
```
❌ No visibility into production behavior
❌ Manual log aggregation across services
❌ Reactive debugging (wait for customer complaints)
❌ No performance metrics
❌ Cannot trace requests across services
❌ Unknown failure rates and bottlenecks
```

**ด้วย Application Insights + AZD:**
```
✅ Automatic telemetry collection
✅ Centralized logs from all services
✅ Proactive issue detection
✅ End-to-end request tracing
✅ Performance metrics and insights
✅ Real-time dashboards
✅ AZD provisions everything automatically
```

**อนาล็อก**: Application Insights เหมือนกับการมี "กล่องดำ" เครื่องบันทึกการบิน + แผงควบคุมห้องนักบินสำหรับแอปของคุณ คุณเห็นทุกอย่างที่เกิดขึ้นแบบเรียลไทม์และสามารถเล่นซ้ำเหตุการณ์ใด ๆ ได้

---

## ภาพรวมสถาปัตยกรรม

### Application Insights ในสถาปัตยกรรม AZD

```mermaid
graph TB
    User[ผู้ใช้/ไคลเอนต์]
    App1[แอปคอนเทนเนอร์ 1<br/>เกตเวย์ API]
    App2[แอปคอนเทนเนอร์ 2<br/>บริการผลิตภัณฑ์]
    App3[แอปคอนเทนเนอร์ 3<br/>บริการคำสั่งซื้อ]
    
    AppInsights[Application Insights<br/>ศูนย์เทเลเมทรี]
    LogAnalytics[(Log Analytics<br/>เวิร์กสเปซ)]
    
    Portal[Azure Portal<br/>แดชบอร์ด & การแจ้งเตือน]
    Query[Kusto Queries<br/>การวิเคราะห์ที่กำหนดเอง]
    
    User --> App1
    App1 --> App2
    App2 --> App3
    
    App1 -.->|การติดตั้งอัตโนมัติ| AppInsights
    App2 -.->|การติดตั้งอัตโนมัติ| AppInsights
    App3 -.->|การติดตั้งอัตโนมัติ| AppInsights
    
    AppInsights --> LogAnalytics
    LogAnalytics --> Portal
    LogAnalytics --> Query
    
    style AppInsights fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
    style LogAnalytics fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
```
### สิ่งที่ถูกมอนิเตอร์โดยอัตโนมัติ

| ประเภทเทเลเมทริก | สิ่งที่บันทึก | กรณีการใช้งาน |
|----------------|------------------|----------|
| **คำขอ** | คำขอ HTTP, รหัสสถานะ, ระยะเวลา | การมอนิเตอร์ประสิทธิภาพ API |
| **การเรียกใช้งานภายนอก (Dependencies)** | การเรียกภายนอก (DB, APIs, storage) | ระบุคอขวด |
| **ข้อยกเว้น** | ข้อผิดพลาดที่ไม่ได้จัดการพร้อม stack traces | ดีบักความล้มเหลว |
| **เหตุการณ์ที่กำหนดเอง** | เหตุการณ์ทางธุรกิจ (สมัคร, ซื้อ) | การวิเคราะห์และ funnel |
| **เมตริก** | เคาน์เตอร์ประสิทธิภาพ, เมตริกที่กำหนดเอง | การวางแผนความจุ |
| **ทเรซ** | ข้อความล็อกพร้อมระดับความรุนแรง | ดีบักและตรวจสอบ |
| **ความพร้อมใช้งาน** | การทดสอบความพร้อมใช้งานและเวลาในการตอบสนอง | การมอนิเตอร์ SLA |

---

## ข้อกำหนดเบื้องต้น

### เครื่องมือที่ต้องมี

```bash
# ตรวจสอบ Azure Developer CLI
azd version
# ✅ คาดว่า: azd เวอร์ชัน 1.0.0 ขึ้นไป

# ตรวจสอบ Azure CLI
az --version
# ✅ คาดว่า: azure-cli เวอร์ชัน 2.50.0 ขึ้นไป
```

### ข้อกำหนดของ Azure

- มีการสมัครใช้งาน Azure ที่ใช้งานอยู่
- สิทธิ์ในการสร้าง:
  - ทรัพยากร Application Insights
  - Log Analytics workspaces
  - Container Apps
  - Resource groups

### ความรู้พื้นฐานที่ต้องมี

คุณควรจะได้ทำเสร็จ:
- [AZD Basics](../chapter-01-foundation/azd-basics.md) - แนวคิดหลักของ AZD
- [Configuration](../chapter-03-configuration/configuration.md) - การตั้งค่าสภาพแวดล้อม
- [First Project](../chapter-01-foundation/first-project.md) - การปรับใช้พื้นฐาน

---

## บทเรียน 1: Application Insights อัตโนมัติด้วย AZD

### AZD จัดเตรียม Application Insights อย่างไร

AZD จะสร้างและกำหนดค่า Application Insights โดยอัตโนมัติเมื่อคุณปรับใช้ มาดูกันว่าเป็นอย่างไร

### โครงสร้างโปรเจกต์

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

### ขั้นตอนที่ 1: กำหนดค่า AZD (azure.yaml)

**ไฟล์: `azure.yaml`**

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

**แค่นี้เอง!** AZD จะสร้าง Application Insights โดยค่าเริ่มต้น ไม่ต้องการการกำหนดค่าเพิ่มสำหรับการมอนิเตอร์พื้นฐาน

---

### ขั้นตอนที่ 2: โครงสร้างพื้นฐานสำหรับมอนิเตอร์ (Bicep)

**ไฟล์: `infra/core/monitoring.bicep`**

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

### ขั้นตอนที่ 3: เชื่อม Container App กับ Application Insights

**ไฟล์: `infra/app/api.bicep`**

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

### ขั้นตอนที่ 4: โค้ดแอปพลิเคชันพร้อมเทเลเมทริก

**ไฟล์: `src/app.py`**

```python
from flask import Flask, request, jsonify
from opencensus.ext.azure.log_exporter import AzureLogHandler
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.ext.flask.flask_middleware import FlaskMiddleware
from opencensus.trace.samplers import ProbabilitySampler
import logging
import os

app = Flask(__name__)

# รับสตริงการเชื่อมต่อของ Application Insights
connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

if connection_string:
    # กำหนดค่าการติดตามแบบกระจาย
    middleware = FlaskMiddleware(
        app,
        exporter=AzureExporter(connection_string=connection_string),
        sampler=ProbabilitySampler(rate=1.0)  # การสุ่มตัวอย่าง 100% สำหรับการพัฒนา
    )
    
    # กำหนดค่าการบันทึก
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
    
    # จำลองการเรียกฐานข้อมูล (จะถูกติดตามเป็นการพึ่งพาโดยอัตโนมัติ)
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
    time.sleep(3)  # จำลองการดำเนินการที่ช้า
    logger.warning('Endpoint took 3 seconds to respond')
    return jsonify({'message': 'Slow operation completed'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
```

**ไฟล์: `src/requirements.txt`**

```txt
Flask==3.0.0
opencensus-ext-azure==1.1.13
opencensus-ext-flask==0.8.1
gunicorn==21.2.0
```

---

### ขั้นตอนที่ 5: ปรับใช้งานและตรวจสอบ

```bash
# เริ่มต้น AZD
azd init

# ปรับใช้ (จัดเตรียม Application Insights โดยอัตโนมัติ)
azd up

# รับ URL ของแอป
APP_URL=$(azd env get-values | grep API_URL | cut -d '=' -f2 | tr -d '"')

# สร้างข้อมูลเทเลเมทรี
curl $APP_URL/health
curl $APP_URL/api/products
curl $APP_URL/api/error-test
curl $APP_URL/api/slow
```

**✅ ผลลัพธ์ที่คาดหวัง:**
```json
{
  "status": "healthy",
  "monitoring": "enabled"
}
```

---

### ขั้นตอนที่ 6: ดูเทเลเมทริกใน Azure Portal

```bash
# รับรายละเอียดของ Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# เปิดใน Azure Portal
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"') \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"') \
  --query "appId" -o tsv
```

**ไปที่ Azure Portal → Application Insights → Transaction Search**

คุณควรจะเห็น:
- ✅ คำขอ HTTP พร้อมรหัสสถานะ
- ✅ ระยะเวลาคำขอ (มากกว่า 3 วินาที สำหรับ `/api/slow`)
- ✅ รายละเอียดข้อยกเว้นจาก `/api/error-test`
- ✅ ข้อความล็อกที่กำหนดเอง

---

## บทเรียน 2: เทเลเมทริกและเหตุการณ์ที่กำหนดเอง

### ติดตามเหตุการณ์ทางธุรกิจ

มาสร้างเทเลเมทริกที่กำหนดเองสำหรับเหตุการณ์สำคัญทางธุรกิจ

**ไฟล์: `src/telemetry.py`**

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
        
        # ตั้งค่าระบบบันทึก
        self.logger = logging.getLogger(__name__)
        self.logger.addHandler(AzureLogHandler(connection_string=self.connection_string))
        self.logger.setLevel(logging.INFO)
        
        # ตั้งค่าตัวส่งออกเมตริก
        self.stats = stats_module.stats
        self.view_manager = self.stats.view_manager
        self.stats_recorder = self.stats.stats_recorder
        
        exporter = metrics_exporter.new_metrics_exporter(
            connection_string=self.connection_string
        )
        self.view_manager.register_exporter(exporter)
        
        # ตั้งค่าตัวติดตาม
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

# ไคลเอนต์เทเลเมทรีระดับโลก
telemetry = TelemetryClient()
```

### อัปเดตแอปด้วยเหตุการณ์ที่กำหนดเอง

**ไฟล์: `src/app.py` (ปรับปรุง)**

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
    
    # ติดตามเหตุการณ์ทางธุรกิจ
    telemetry.track_event('Purchase', {
        'product_id': product_id,
        'quantity': quantity,
        'total_amount': price * quantity,
        'user_id': request.headers.get('X-User-Id', 'anonymous')
    })
    
    # ติดตามตัวชี้วัดรายได้
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
    
    # จำลองการค้นหา (จริงๆ จะเป็นการสืบค้นฐานข้อมูล)
    results = [{'id': 1, 'name': f'Result for {query}'}]
    
    duration = (time.time() - start_time) * 1000  # แปลงเป็นมิลลิวินาที
    
    # ติดตามเหตุการณ์การค้นหา
    telemetry.track_event('Search', {
        'query': query,
        'results_count': len(results),
        'duration_ms': duration
    })
    
    # ติดตามตัวชี้วัดประสิทธิภาพการค้นหา
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
        # จำลองการเรียกใช้งาน API ภายนอก
        response = requests.get('https://api.example.com/data', timeout=5)
        result = response.json()
    except Exception as e:
        success = False
        result = {'error': str(e)}
    
    duration = (time.time() - start_time) * 1000
    
    # ติดตามการพึ่งพา
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

### ทดสอบเทเลเมทริกที่กำหนดเอง

```bash
# ติดตามเหตุการณ์การซื้อ
curl -X POST $APP_URL/api/purchase \
  -H "Content-Type: application/json" \
  -H "X-User-Id: user123" \
  -d '{"product_id": 1, "quantity": 2, "price": 29.99}'

# ติดตามเหตุการณ์การค้นหา
curl "$APP_URL/api/search?q=laptop"

# ติดตามการพึ่งพาภายนอก
curl $APP_URL/api/external-call
```

**ดูใน Azure Portal:**

ไปที่ Application Insights → Logs แล้วรัน:

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

## บทเรียน 3: การติดตามแบบกระจายสำหรับไมโครเซอร์วิส

### เปิดการติดตามข้ามเซอร์วิส

สำหรับไมโครเซอร์วิส Application Insights จะเชื่อมโยงคำขอข้ามบริการโดยอัตโนมัติ

**ไฟล์: `infra/main.bicep`**

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

### ดูธุรกรรมแบบปลายต่อปลาย

```mermaid
sequenceDiagram
    participant User
    participant Gateway as เกตเวย์ API<br/>(รหัส Trace: abc123)
    participant Product as บริการสินค้า<br/>(รหัสต้นทาง: abc123)
    participant Order as บริการคำสั่งซื้อ<br/>(รหัสต้นทาง: abc123)
    participant AppInsights as Application Insights
    
    User->>Gateway: POST /api/checkout
    Note over Gateway: เริ่มการติดตาม: abc123
    Gateway->>AppInsights: บันทึกคำขอ (รหัส Trace: abc123)
    
    Gateway->>Product: GET /products/123
    Note over Product: รหัสต้นทาง: abc123
    Product->>AppInsights: บันทึกการเรียก dependency
    Product-->>Gateway: รายละเอียดสินค้า
    
    Gateway->>Order: POST /orders
    Note over Order: รหัสต้นทาง: abc123
    Order->>AppInsights: บันทึกการเรียก dependency
    Order-->>Gateway: สร้างคำสั่งซื้อแล้ว
    
    Gateway-->>User: การชำระเงินเสร็จสมบูรณ์
    Gateway->>AppInsights: บันทึกการตอบกลับ (ระยะเวลา: 450ms)
    
    Note over AppInsights: การเชื่อมโยงตามรหัส Trace
```
**สอบถามการติดตามแบบปลายต่อปลาย:**

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

## บทเรียน 4: เมตริกสดและการมอนิเตอร์แบบเรียลไทม์

### เปิด Live Metrics Stream

Live Metrics ให้เทเลเมทริกแบบเรียลไทม์ด้วยความหน่วง <1 วินาที

**เข้าถึง Live Metrics:**

```bash
# ดึงทรัพยากร Application Insights
APPI_NAME=$(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"')

# ดึงกลุ่มทรัพยากร
RG_NAME=$(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"')

echo "Navigate to: Azure Portal → Resource Groups → $RG_NAME → $APPI_NAME → Live Metrics"
```

**สิ่งที่คุณจะเห็นแบบเรียลไทม์:**
- ✅ อัตราคำขอเข้ามา (requests/sec)
- ✅ การเรียก dependency ที่ออกไป
- ✅ จำนวนข้อยกเว้น
- ✅ การใช้งาน CPU และหน่วยความจำ
- ✅ จำนวนเซิร์ฟเวอร์ที่ใช้งานอยู่
- ✅ ตัวอย่างเทเลเมทริก

### สร้างโหลดสำหรับการทดสอบ

```bash
# สร้างภาระงานเพื่อดูเมตริกแบบเรียลไทม์
for i in {1..100}; do
  curl $APP_URL/api/products &
  curl $APP_URL/api/search?q=test$i &
done

# ดูเมตริกแบบเรียลไทม์ในพอร์ทัล Azure
# คุณควรจะเห็นอัตราการร้องขอพุ่งขึ้น
```

---

## แบบฝึกหัดเชิงปฏิบัติ

### แบบฝึกหัด 1: ตั้งค่าการแจ้งเตือน ⭐⭐ (ระดับกลาง)

**เป้าหมาย**: สร้างการแจ้งเตือนสำหรับอัตราข้อผิดพลาดสูงและการตอบสนองที่ช้า

**ขั้นตอน:**

1. **สร้างการแจ้งเตือนสำหรับอัตราข้อผิดพลาด:**

```bash
# รับรหัสทรัพยากรของ Application Insights
APPI_ID=$(az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "id" -o tsv)

# สร้างการแจ้งเตือนเมตริกสำหรับคำขอที่ล้มเหลว
az monitor metrics alert create \
  --name "High-Error-Rate" \
  --resource-group $RG_NAME \
  --scopes $APPI_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "Alert when error rate exceeds 10 per 5 minutes"
```

2. **สร้างการแจ้งเตือนสำหรับการตอบสนองที่ช้า:**

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

3. **สร้างการแจ้งเตือนผ่าน Bicep (แนะนำสำหรับ AZD):**

**ไฟล์: `infra/core/alerts.bicep`**

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

4. **ทดสอบการแจ้งเตือน:**

```bash
# สร้างข้อผิดพลาด
for i in {1..20}; do
  curl $APP_URL/api/error-test
done

# สร้างการตอบสนองที่ช้า
for i in {1..10}; do
  curl $APP_URL/api/slow
done

# ตรวจสอบสถานะการแจ้งเตือน (รอ 5-10 นาที)
az monitor metrics alert list \
  --resource-group $RG_NAME \
  --query "[].{Name:name, Enabled:enabled, State:properties.enabled}" \
  --output table
```

**✅ เกณฑ์ความสำเร็จ:**
- ✅ การแจ้งเตือนถูกสร้างเรียบร้อย
- ✅ การแจ้งเตือนทำงานเมื่อเกินเกณฑ์
- ✅ สามารถดูประวัติการแจ้งเตือนได้ใน Azure Portal
- ✅ ผนวกรวมกับการปรับใช้ AZD

**เวลา**: 20-25 นาที

---

### แบบฝึกหัด 2: สร้างแดชบอร์ดที่กำหนดเอง ⭐⭐ (ระดับกลาง)

**เป้าหมาย**: สร้างแดชบอร์ดที่แสดงเมตริกหลักของแอป

**ขั้นตอน:**

1. **สร้างแดชบอร์ดผ่าน Azure Portal:**

ไปที่: Azure Portal → Dashboards → New Dashboard

2. **เพิ่มไทล์สำหรับเมตริกสำคัญ:**

- จำนวนคำขอ (24 ชั่วโมงล่าสุด)
- เวลาเฉลี่ยในการตอบสนอง
- อัตราข้อผิดพลาด
- 5 งานที่ช้าที่สุด
- การกระจายทางภูมิศาสตร์ของผู้ใช้

3. **สร้างแดชบอร์ดผ่าน Bicep:**

**ไฟล์: `infra/core/dashboard.bicep`**

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

4. **ปรับใช้แดชบอร์ด:**

```bash
# เพิ่มไปยัง main.bicep
module dashboard './core/dashboard.bicep' = {
  name: 'dashboard'
  scope: rg
  params: {
    dashboardName: 'dashboard-${environmentName}'
    applicationInsightsId: monitoring.outputs.applicationInsightsId
    location: location
  }
}

# ปรับใช้
azd up
```

**✅ เกณฑ์ความสำเร็จ:**
- ✅ แดชบอร์ดแสดงเมตริกสำคัญ
- ✅ สามารถปักหมุดไปที่หน้าแรกของ Azure Portal
- ✅ อัปเดตแบบเรียลไทม์
- ✅ ปรับใช้ผ่าน AZD ได้

**เวลา**: 25-30 นาที

---

### แบบฝึกหัด 3: มอนิเตอร์แอป AI/LLM ⭐⭐⭐ (ระดับสูง)

**เป้าหมาย**: ติดตามการใช้งาน Azure OpenAI (tokens, ต้นทุน, ความหน่วง)

**ขั้นตอน:**

1. **สร้าง wrapper สำหรับมอนิเตอร์ AI:**

**ไฟล์: `src/ai_telemetry.py`**

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
            # เรียกใช้ Azure OpenAI
            response = self.client.chat.completions.create(
                model=model,
                messages=messages,
                **kwargs
            )
            
            duration = (time.time() - start_time) * 1000  # มิลลิวินาที
            
            # ดึงการใช้งาน
            usage = response.usage
            prompt_tokens = usage.prompt_tokens
            completion_tokens = usage.completion_tokens
            total_tokens = usage.total_tokens
            
            # คำนวณค่าใช้จ่าย (ราคา GPT-4)
            prompt_cost = (prompt_tokens / 1000) * 0.03  # $0.03 ต่อ 1K โทเค็น
            completion_cost = (completion_tokens / 1000) * 0.06  # $0.06 ต่อ 1K โทเค็น
            total_cost = prompt_cost + completion_cost
            
            # ติดตามเหตุการณ์ที่กำหนดเอง
            telemetry.track_event('OpenAI_Request', {
                'model': model,
                'prompt_tokens': prompt_tokens,
                'completion_tokens': completion_tokens,
                'total_tokens': total_tokens,
                'duration_ms': duration,
                'cost_usd': total_cost,
                'success': True
            })
            
            # ติดตามตัวชี้วัด
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

2. **ใช้ไคลเอนต์ที่ถูกมอนิเตอร์:**

```python
from flask import Flask, request, jsonify
from ai_telemetry import MonitoredAzureOpenAI
import os

app = Flask(__name__)

# เริ่มต้นไคลเอนต์ OpenAI ที่มีการตรวจสอบ
openai_client = MonitoredAzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

@app.route('/api/chat', methods=['POST'])
def chat():
    data = request.json
    user_message = data.get('message')
    
    # เรียกใช้งานพร้อมการตรวจสอบโดยอัตโนมัติ
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

3. **สืบค้นเมตริก AI:**

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

**✅ เกณฑ์ความสำเร็จ:**
- ✅ การเรียก OpenAI ทุกครั้งถูกติดตามโดยอัตโนมัติ
- ✅ การใช้งานโทเค็นและต้นทุนมองเห็นได้
- ✅ ความหน่วงถูกมอนิเตอร์
- ✅ สามารถตั้งการแจ้งเตือนงบประมาณได้

**เวลา**: 35-45 นาที

---

## การปรับแต่งต้นทุน

### กลยุทธ์การสุ่มตัวอย่าง

ควบคุมค่าใช้จ่ายโดยการสุ่มตัวอย่างเทเลเมทริก:

```python
from opencensus.trace.samplers import ProbabilitySampler

# การพัฒนา: การสุ่มตัวอย่าง 100%
sampler = ProbabilitySampler(rate=1.0)

# การใช้งานจริง: การสุ่มตัวอย่าง 10% (ลดค่าใช้จ่ายลง 90%)
sampler = ProbabilitySampler(rate=0.1)

# การสุ่มตัวอย่างแบบปรับตัว (ปรับโดยอัตโนมัติ)
from opencensus.trace.samplers import AdaptiveSampler
sampler = AdaptiveSampler()
```

**ใน Bicep:**

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  properties: {
    SamplingPercentage: 10  // 10% sampling
  }
}
```

### การเก็บรักษาข้อมูล

```bicep
resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: logAnalyticsName
  properties: {
    retentionInDays: 30  // Minimum (cheapest)
    // Options: 30, 31, 60, 90, 120, 180, 270, 365, 550, 730
  }
}
```

### ประมาณการค่าใช้จ่ายรายเดือน

| ปริมาณข้อมูล | การเก็บรักษา | ต้นทุนรายเดือน |
|-------------|-----------|--------------|
| 1 GB/เดือน | 30 วัน | ~$2-5 |
| 5 GB/เดือน | 30 วัน | ~$10-15 |
| 10 GB/เดือน | 90 วัน | ~$25-40 |
| 50 GB/เดือน | 90 วัน | ~$100-150 |

**แผนฟรี**: รวม 5 GB/เดือน

---

## จุดตรวจความรู้

### 1. การรวมพื้นฐาน ✓

ทดสอบความเข้าใจของคุณ:

- [ ] **Q1**: AZD จัดเตรียม Application Insights อย่างไร?
  - **A**: โดยอัตโนมัติผ่านเทมเพลต Bicep ใน `infra/core/monitoring.bicep`

- [ ] **Q2**: ตัวแปรสภาพแวดล้อมใดที่เปิดใช้งาน Application Insights?
  - **A**: `APPLICATIONINSIGHTS_CONNECTION_STRING`

- [ ] **Q3**: เทเลเมทริกหลักสามประเภทคืออะไร?
  - **A**: คำขอ (HTTP calls), Dependencies (การเรียกภายนอก), ข้อยกเว้น (errors)

**การตรวจสอบแบบปฏิบัติ:**
```bash
# ตรวจสอบว่า Application Insights ได้รับการกำหนดค่าหรือไม่
azd env get-values | grep APPLICATIONINSIGHTS

# ยืนยันว่าเทเลเมทรีกำลังไหล
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "requests/count"
```

---

### 2. เทเลเมทริกที่กำหนดเอง ✓

ทดสอบความเข้าใจของคุณ:

- [ ] **Q1**: คุณติดตามเหตุการณ์ทางธุรกิจที่กำหนดเองได้อย่างไร?
  - **A**: ใช้ logger พร้อม `custom_dimensions` หรือ `TelemetryClient.track_event()`

- [ ] **Q2**: ความแตกต่างระหว่าง events และ metrics คืออะไร?
  - **A**: Events เป็นเหตุการณ์ที่เกิดขึ้นเป็นครั้งคราว ส่วน metrics เป็นการวัดเชิงตัวเลข

- [ ] **Q3**: คุณเชื่อมโยงเทเลเมทริกระหว่างบริการได้อย่างไร?
  - **A**: Application Insights จะใช้ `operation_Id` โดยอัตโนมัติสำหรับการเชื่อมโยง

**การตรวจสอบแบบปฏิบัติ:**
```kusto
// Verify custom events
traces
| where customDimensions.event_name != ""
| summarize count() by tostring(customDimensions.event_name)
```

---

### 3. การมอนิเตอร์ในสภาพแวดล้อมการผลิต ✓

ทดสอบความเข้าใจของคุณ:

- [ ] **Q1**: การสุ่มตัวอย่างคืออะไรและทำไมต้องใช้?
  - **A**: การสุ่มตัวอย่างลดปริมาณข้อมูล (และต้นทุน) โดยจับเฉพาะเปอร์เซ็นต์ของเทเลเมทริก

- [ ] **Q2**: คุณตั้งค่าการแจ้งเตือนได้อย่างไร?
  - **A**: ใช้ metric alerts ใน Bicep หรือ Azure Portal โดยอิงจากเมตริกของ Application Insights

- [ ] **Q3**: ความแตกต่างระหว่าง Log Analytics กับ Application Insights คืออะไร?
  - **A**: Application Insights เก็บข้อมูลใน Log Analytics workspace; App Insights ให้มุมมองเฉพาะแอปพลิเคชัน

**การตรวจสอบแบบปฏิบัติ:**
```bash
# ตรวจสอบการกำหนดค่าการสุ่มตัวอย่าง
az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "properties.SamplingPercentage"
```

---

## แนวปฏิบัติที่ดีที่สุด

### ✅ ควรทำ:

1. **ใช้รหัสการเชื่อมโยง (correlation IDs)**
   ```python
   logger.info('Processing order', extra={
       'custom_dimensions': {
           'order_id': order_id,
           'user_id': user_id
       }
   })
   ```

2. **ตั้งค่าการแจ้งเตือนสำหรับเมตริกสำคัญ**
   ```bicep
   // Error rate, slow responses, availability
   ```

3. **ใช้การล็อกแบบมีโครงสร้าง**
   ```python
   # ✅ ดี: มีโครงสร้าง
   logger.info('User signup', extra={'custom_dimensions': {'user_id': 123}})
   
   # ❌ ไม่ดี: ไม่มีโครงสร้าง
   logger.info(f'User 123 signed up')
   ```

4. **มอนิเตอร์การเรียก dependency**
   ```python
   # ติดตามการเรียกฐานข้อมูล การร้องขอ HTTP ฯลฯ โดยอัตโนมัติ
   ```

5. **ใช้ Live Metrics ในระหว่างการปรับใช้**

### ❌ ห้ามทำ:

1. **อย่าล็อกข้อมูลที่ละเอียดอ่อน**
   ```python
   # ❌ แย่
   logger.info(f'Login: {username}:{password}')
   
   # ✅ ดี
   logger.info('Login attempt', extra={'custom_dimensions': {'username': username}})
   ```

2. **อย่าใช้การสุ่มตัวอย่าง 100% ใน production**
   ```python
   # ❌ แพง
   sampler = ProbabilitySampler(rate=1.0)
   
   # ✅ คุ้มค่า
   sampler = ProbabilitySampler(rate=0.1)
   ```

3. **อย่ามองข้าม dead letter queues**

4. **อย่าลืมตั้งขีดจำกัดการเก็บรักษาข้อมูล**

---

## การแก้ปัญหา

### ปัญหา: ไม่มีเทเลเมทริกปรากฏ

**การวินิจฉัย:**
```bash
# ตรวจสอบว่าสตริงการเชื่อมต่อถูกตั้งค่าแล้ว
azd env get-values | grep APPLICATIONINSIGHTS

# ตรวจสอบบันทึกของแอปพลิเคชันผ่าน Azure Monitor
azd monitor --logs

# หรือใช้ Azure CLI สำหรับ Container Apps:
az containerapp logs show --name $APP_NAME --resource-group $RG_NAME --tail 50
```

**วิธีแก้:**
```bash
# ตรวจสอบสตริงการเชื่อมต่อใน Container App
az containerapp show \
  --name $APP_NAME \
  --resource-group $RG_NAME \
  --query "properties.template.containers[0].env" \
  | grep -i applicationinsights
```

---

### ปัญหา: ต้นทุนสูง

**การวินิจฉัย:**
```bash
# ตรวจสอบการนำเข้าข้อมูล
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "availabilityResults/count"
```

**วิธีแก้:**
- ลดอัตราการสุ่มตัวอย่าง
- ลดระยะเวลาการเก็บรักษา
- ลบการล็อกที่มีความละเอียดมากเกินไป

---

## เรียนรู้เพิ่มเติม

### เอกสารอย่างเป็นทางการ
- [Application Insights Overview](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Application Insights for Python](https://learn.microsoft.com/azure/azure-monitor/app/opencensus-python)
- [Kusto Query Language](https://learn.microsoft.com/azure/data-explorer/kusto/query/)
- [AZD Monitoring](https://learn.microsoft.com/azure/developer/azure-developer-cli/monitor-your-app)

### ขั้นตอนถัดไปในคอร์สนี้
- ← ก่อนหน้า: [ตรวจสอบก่อนการปรับใช้](preflight-checks.md)
- → ถัดไป: [คู่มือการปรับใช้](../chapter-04-infrastructure/deployment-guide.md)
- 🏠 [หน้าแรกคอร์ส](../../README.md)

### ตัวอย่างที่เกี่ยวข้อง
- [Azure OpenAI Example](../../../../examples/azure-openai-chat) - เทเลเมทริก AI
- [Microservices Example](../../../../examples/microservices) - การติดตามแบบกระจาย

---

## สรุป

**คุณได้เรียนรู้:**
- ✅ การจัดเตรียม Application Insights อัตโนมัติด้วย AZD
- ✅ เทเลเมทริกที่กำหนดเอง (events, metrics, dependencies)
- ✅ การติดตามแบบกระจายข้ามไมโครเซอร์วิส
- ✅ เมตริกแบบเรียลไทม์และการตรวจสอบแบบเรียลไทม์
- ✅ การแจ้งเตือนและแดชบอร์ด
- ✅ การตรวจสอบแอปพลิเคชัน AI/LLM
- ✅ กลยุทธ์การเพิ่มประสิทธิภาพค่าใช้จ่าย

**ข้อสรุปสำคัญ:**
1. **AZD จัดเตรียมการตรวจสอบโดยอัตโนมัติ** - ไม่ต้องตั้งค่าด้วยตนเอง
2. **ใช้การบันทึกแบบมีโครงสร้าง** - ทำให้การสืบค้นง่ายขึ้น
3. **ติดตามเหตุการณ์ทางธุรกิจ** - ไม่ใช่แค่เมตริกเชิงเทคนิค
4. **ตรวจสอบค่าใช้จ่ายของ AI** - ติดตามโทเค็นและการใช้จ่าย
5. **ตั้งค่าการแจ้งเตือน** - เป็นเชิงรุก ไม่ใช่รอให้เกิดปัญหา
6. **ปรับให้ต้นทุนเหมาะสม** - ใช้การสุ่มตัวอย่างและการจำกัดการเก็บรักษา

**ขั้นตอนถัดไป:**
1. ทำแบบฝึกหัดภาคปฏิบัติให้เสร็จ
2. เพิ่ม Application Insights ในโปรเจกต์ AZD ของคุณ
3. สร้างแดชบอร์ดแบบกำหนดเองสำหรับทีมของคุณ
4. ศึกษา [คู่มือการปรับใช้](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ข้อจำกัดความรับผิด:
เอกสารฉบับนี้ได้รับการแปลโดยใช้บริการแปลด้วยปัญญาประดิษฐ์ [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่แม่นยำ เอกสารต้นฉบับในภาษาต้นทางควรถูกถือเป็นแหล่งข้อมูลหลักที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้การแปลโดยนักแปลมืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดใด ๆ ที่เกิดจากการใช้การแปลฉบับนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->