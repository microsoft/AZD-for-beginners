# AZD와 Application Insights 통합

⏱️ **예상 시간**: 40-50분 | 💰 **비용 영향**: ~$5-15/월 | ⭐ **복잡도**: 중간

**📚 학습 경로:**
- ← 이전: [사전 점검](preflight-checks.md) - 배포 전 검증
- 🎯 **현재 위치**: Application Insights 통합 (모니터링, 텔레메트리, 디버깅)
- → 다음: [배포 가이드](../chapter-04-infrastructure/deployment-guide.md) - Azure에 배포
- 🏠 [코스 홈](../../README.md)

---

## 이 수업에서 배우게 될 내용

이 수업을 완료하면 다음을 할 수 있습니다:
- AZD 프로젝트에 **Application Insights**를 자동으로 통합
- 마이크로서비스용 **분산 추적** 구성
- **맞춤 텔레메트리** 구현(메트릭, 이벤트, 종속성)
- 실시간 모니터링을 위한 **라이브 메트릭** 설정
- AZD 배포에서 **알림 및 대시보드** 생성
- **텔레메트리 쿼리**로 프로덕션 문제 디버깅
- **비용 및 샘플링** 전략 최적화
- **AI/LLM 애플리케이션** 모니터링(토큰, 지연, 비용)

## AZD와 함께하는 Application Insights가 중요한 이유

### 문제: 프로덕션 가시성

**Application Insights가 없을 때:**
```
❌ No visibility into production behavior
❌ Manual log aggregation across services
❌ Reactive debugging (wait for customer complaints)
❌ No performance metrics
❌ Cannot trace requests across services
❌ Unknown failure rates and bottlenecks
```

**Application Insights + AZD 사용 시:**
```
✅ Automatic telemetry collection
✅ Centralized logs from all services
✅ Proactive issue detection
✅ End-to-end request tracing
✅ Performance metrics and insights
✅ Real-time dashboards
✅ AZD provisions everything automatically
```

**비유**: Application Insights는 애플리케이션용 "블랙박스" 비행 기록기와 조종석 대시보드를 갖춘 것과 같습니다. 실시간으로 발생하는 모든 것을 볼 수 있고 어떤 사고든 재생할 수 있습니다.

---

## 아키텍처 개요

### AZD 아키텍처 내의 Application Insights

```mermaid
graph TB
    User[사용자/클라이언트]
    App1[컨테이너 앱 1<br/>API 게이트웨이]
    App2[컨테이너 앱 2<br/>제품 서비스]
    App3[컨테이너 앱 3<br/>주문 서비스]
    
    AppInsights[Application Insights<br/>텔레메트리 허브]
    LogAnalytics[(로그 분석<br/>작업 영역)]
    
    Portal[Azure 포털<br/>대시보드 및 경고]
    Query[Kusto 쿼리<br/>맞춤 분석]
    
    User --> App1
    App1 --> App2
    App2 --> App3
    
    App1 -.->|자동 계측| AppInsights
    App2 -.->|자동 계측| AppInsights
    App3 -.->|자동 계측| AppInsights
    
    AppInsights --> LogAnalytics
    LogAnalytics --> Portal
    LogAnalytics --> Query
    
    style AppInsights fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
    style LogAnalytics fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
```
### 자동으로 모니터링되는 항목

| 텔레메트리 유형 | 수집 항목 | 사용 사례 |
|----------------|------------------|----------|
| **요청** | HTTP 요청, 상태 코드, 지속 시간 | API 성능 모니터링 |
| **종속성** | 외부 호출(DB, API, 스토리지) | 병목 식별 |
| **예외** | 스택 추적이 있는 처리되지 않은 오류 | 장애 디버깅 |
| **맞춤 이벤트** | 비즈니스 이벤트(가입, 구매) | 분석 및 퍼널 |
| **메트릭** | 성능 카운터, 사용자 정의 메트릭 | 용량 계획 |
| **트레이스** | 심각도 포함 로그 메시지 | 디버깅 및 감사 |
| **가용성** | 가동 시간 및 응답 시간 테스트 | SLA 모니터링 |

---

## 전제 조건

### 필요 도구

```bash
# Azure 개발자 CLI 확인
azd version
# ✅ 예상: azd 버전 1.0.0 이상

# Azure CLI 확인
az --version
# ✅ 예상: azure-cli 2.50.0 이상
```

### Azure 요구 사항

- 활성 Azure 구독
- 생성 권한:
  - Application Insights 리소스
  - Log Analytics 작업 영역
  - Container Apps
  - 리소스 그룹

### 지식 전제 조건

다음 항목을 완료했어야 합니다:
- [AZD 기본](../chapter-01-foundation/azd-basics.md) - AZD 핵심 개념
- [구성](../chapter-03-configuration/configuration.md) - 환경 설정
- [첫 번째 프로젝트](../chapter-01-foundation/first-project.md) - 기본 배포

---

## 레슨 1: AZD로 Application Insights 자동 구성

### AZD가 Application Insights를 프로비저닝하는 방법

AZD는 배포 시 Application Insights를 자동으로 생성하고 구성합니다. 작동 방식을 살펴보겠습니다.

### 프로젝트 구조

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

### 단계 1: AZD 구성 (azure.yaml)

**파일: `azure.yaml`**

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

**그게 전부입니다!** AZD는 기본적으로 Application Insights를 생성합니다. 기본 모니터링을 위해 추가 구성은 필요하지 않습니다.

---

### 단계 2: 모니터링 인프라 (Bicep)

**파일: `infra/core/monitoring.bicep`**

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

### 단계 3: Container App를 Application Insights에 연결

**파일: `infra/app/api.bicep`**

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

### 단계 4: 텔레메트리가 포함된 애플리케이션 코드

**파일: `src/app.py`**

```python
from flask import Flask, request, jsonify
from opencensus.ext.azure.log_exporter import AzureLogHandler
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.ext.flask.flask_middleware import FlaskMiddleware
from opencensus.trace.samplers import ProbabilitySampler
import logging
import os

app = Flask(__name__)

# Application Insights 연결 문자열 가져오기
connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

if connection_string:
    # 분산 추적 구성
    middleware = FlaskMiddleware(
        app,
        exporter=AzureExporter(connection_string=connection_string),
        sampler=ProbabilitySampler(rate=1.0)  # 개발용 100% 샘플링
    )
    
    # 로깅 구성
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
    
    # 데이터베이스 호출 시뮬레이션 (자동으로 종속성으로 추적됨)
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
    time.sleep(3)  # 느린 작업 시뮬레이션
    logger.warning('Endpoint took 3 seconds to respond')
    return jsonify({'message': 'Slow operation completed'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
```

**파일: `src/requirements.txt`**

```txt
Flask==3.0.0
opencensus-ext-azure==1.1.13
opencensus-ext-flask==0.8.1
gunicorn==21.2.0
```

---

### 단계 5: 배포 및 검증

```bash
# AZD 초기화
azd init

# 배포(자동으로 Application Insights를 프로비저닝함)
azd up

# 앱 URL 가져오기
APP_URL=$(azd env get-values | grep API_URL | cut -d '=' -f2 | tr -d '"')

# 텔레메트리 생성
curl $APP_URL/health
curl $APP_URL/api/products
curl $APP_URL/api/error-test
curl $APP_URL/api/slow
```

**✅ 예상 출력:**
```json
{
  "status": "healthy",
  "monitoring": "enabled"
}
```

---

### 단계 6: Azure 포털에서 텔레메트리 보기

```bash
# Application Insights 세부 정보 가져오기
azd env get-values | grep APPLICATIONINSIGHTS

# Azure 포털에서 열기
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"') \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"') \
  --query "appId" -o tsv
```

**Azure 포털 → Application Insights → Transaction Search로 이동**

다음 항목을 확인할 수 있습니다:
- ✅ 상태 코드가 포함된 HTTP 요청
- ✅ 요청 지속 시간 (`/api/slow`의 경우 3초 이상)
- ✅ `/api/error-test`에서 발생한 예외 세부 정보
- ✅ 사용자 정의 로그 메시지

---

## 레슨 2: 맞춤 텔레메트리 및 이벤트

### 비즈니스 이벤트 추적

비즈니스에 중요한 이벤트에 대해 맞춤 텔레메트리를 추가해봅시다.

**파일: `src/telemetry.py`**

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
        
        # 로거 설정
        self.logger = logging.getLogger(__name__)
        self.logger.addHandler(AzureLogHandler(connection_string=self.connection_string))
        self.logger.setLevel(logging.INFO)
        
        # 메트릭 익스포터 설정
        self.stats = stats_module.stats
        self.view_manager = self.stats.view_manager
        self.stats_recorder = self.stats.stats_recorder
        
        exporter = metrics_exporter.new_metrics_exporter(
            connection_string=self.connection_string
        )
        self.view_manager.register_exporter(exporter)
        
        # 트레이서 설정
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

# 전역 텔레메트리 클라이언트
telemetry = TelemetryClient()
```

### 맞춤 이벤트로 애플리케이션 업데이트

**파일: `src/app.py` (확장됨)**

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
    
    # 비즈니스 이벤트 추적
    telemetry.track_event('Purchase', {
        'product_id': product_id,
        'quantity': quantity,
        'total_amount': price * quantity,
        'user_id': request.headers.get('X-User-Id', 'anonymous')
    })
    
    # 수익 지표 추적
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
    
    # 검색 시뮬레이션(실제로는 데이터베이스 쿼리일 것)
    results = [{'id': 1, 'name': f'Result for {query}'}]
    
    duration = (time.time() - start_time) * 1000  # 밀리초로 변환
    
    # 검색 이벤트 추적
    telemetry.track_event('Search', {
        'query': query,
        'results_count': len(results),
        'duration_ms': duration
    })
    
    # 검색 성능 지표 추적
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
        # 외부 API 호출 시뮬레이션
        response = requests.get('https://api.example.com/data', timeout=5)
        result = response.json()
    except Exception as e:
        success = False
        result = {'error': str(e)}
    
    duration = (time.time() - start_time) * 1000
    
    # 의존성 추적
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

### 맞춤 텔레메트리 테스트

```bash
# 구매 이벤트 추적
curl -X POST $APP_URL/api/purchase \
  -H "Content-Type: application/json" \
  -H "X-User-Id: user123" \
  -d '{"product_id": 1, "quantity": 2, "price": 29.99}'

# 검색 이벤트 추적
curl "$APP_URL/api/search?q=laptop"

# 외부 종속성 추적
curl $APP_URL/api/external-call
```

**Azure 포털에서 보기:**

Application Insights → Logs로 이동한 다음 실행:

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

## 레슨 3: 마이크로서비스용 분산 추적

### 서비스 간 추적 활성화

마이크로서비스의 경우 Application Insights는 서비스 간의 요청을 자동으로 연관시킵니다.

**파일: `infra/main.bicep`**

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

### 엔드투엔드 트랜잭션 보기

```mermaid
sequenceDiagram
    participant User as 사용자
    participant Gateway as API Gateway<br/>(추적 ID: abc123)
    participant Product as 제품 서비스<br/>(부모 ID: abc123)
    participant Order as 주문 서비스<br/>(부모 ID: abc123)
    participant AppInsights as 애플리케이션 인사이트
    
    User->>Gateway: POST /api/checkout
    Note over Gateway: 추적 시작: abc123
    Gateway->>AppInsights: 요청 기록 (추적 ID: abc123)
    
    Gateway->>Product: GET /products/123
    Note over Product: 부모 ID: abc123
    Product->>AppInsights: 종속성 호출 기록
    Product-->>Gateway: 제품 세부 정보
    
    Gateway->>Order: POST /orders
    Note over Order: 부모 ID: abc123
    Order->>AppInsights: 종속성 호출 기록
    Order-->>Gateway: 주문 생성됨
    
    Gateway-->>User: 체크아웃 완료
    Gateway->>AppInsights: 응답 기록 (소요 시간: 450ms)
    
    Note over AppInsights: 추적 ID로 연관
```
**엔드투엔드 트레이스 쿼리:**

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

## 레슨 4: 라이브 메트릭 및 실시간 모니터링

### 라이브 메트릭 스트림 활성화

라이브 메트릭은 1초 미만의 지연으로 실시간 텔레메트리를 제공합니다.

**라이브 메트릭에 접근:**

```bash
# Application Insights 리소스 가져오기
APPI_NAME=$(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"')

# 리소스 그룹 가져오기
RG_NAME=$(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"')

echo "Navigate to: Azure Portal → Resource Groups → $RG_NAME → $APPI_NAME → Live Metrics"
```

**실시간으로 볼 수 있는 항목:**
- ✅ 들어오는 요청 비율(요청/초)
- ✅ 나가는 종속성 호출
- ✅ 예외 수
- ✅ CPU 및 메모리 사용량
- ✅ 활성 서버 수
- ✅ 샘플 텔레메트리

### 테스트용 부하 생성

```bash
# 실시간 메트릭을 보기 위해 부하를 생성하세요
for i in {1..100}; do
  curl $APP_URL/api/products &
  curl $APP_URL/api/search?q=test$i &
done

# Azure 포털에서 실시간 메트릭을 확인하세요
# 요청률이 급증하는 것을 확인할 수 있어야 합니다
```

---

## 실습 과제

### 연습 1: 알림 설정 ⭐⭐ (중간)

**목표**: 높은 오류율 및 느린 응답에 대한 알림 생성

**단계:**

1. **오류율에 대한 알림 생성:**

```bash
# Application Insights 리소스 ID 가져오기
APPI_ID=$(az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "id" -o tsv)

# 실패한 요청에 대한 메트릭 경고 생성
az monitor metrics alert create \
  --name "High-Error-Rate" \
  --resource-group $RG_NAME \
  --scopes $APPI_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "Alert when error rate exceeds 10 per 5 minutes"
```

2. **느린 응답에 대한 알림 생성:**

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

3. **Bicep을 통한 알림 생성( AZD 권장):**

**파일: `infra/core/alerts.bicep`**

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

4. **알림 테스트:**

```bash
# 오류 생성
for i in {1..20}; do
  curl $APP_URL/api/error-test
done

# 느린 응답 생성
for i in {1..10}; do
  curl $APP_URL/api/slow
done

# 알림 상태 확인 (5-10분 대기)
az monitor metrics alert list \
  --resource-group $RG_NAME \
  --query "[].{Name:name, Enabled:enabled, State:properties.enabled}" \
  --output table
```

**✅ 성공 기준:**
- ✅ 알림이 성공적으로 생성됨
- ✅ 임계값 초과 시 알림이 발생함
- ✅ Azure 포털에서 알림 기록을 확인할 수 있음
- ✅ AZD 배포와 통합됨

**소요 시간**: 20-25분

---

### 연습 2: 맞춤 대시보드 생성 ⭐⭐ (중간)

**목표**: 주요 애플리케이션 메트릭을 보여주는 대시보드 구축

**단계:**

1. **Azure 포털을 통해 대시보드 생성:**

다음으로 이동: Azure 포털 → 대시보드 → 새 대시보드

2. **핵심 메트릭용 타일 추가:**

- 요청 수(최근 24시간)
- 평균 응답 시간
- 오류율
- 가장 느린 상위 5개 작업
- 사용자 지리적 분포

3. **Bicep로 대시보드 생성:**

**파일: `infra/core/dashboard.bicep`**

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

4. **대시보드 배포:**

```bash
# main.bicep에 추가
module dashboard './core/dashboard.bicep' = {
  name: 'dashboard'
  scope: rg
  params: {
    dashboardName: 'dashboard-${environmentName}'
    applicationInsightsId: monitoring.outputs.applicationInsightsId
    location: location
  }
}

# 배포
azd up
```

**✅ 성공 기준:**
- ✅ 대시보드가 핵심 메트릭을 표시함
- ✅ Azure 포털 홈에 고정할 수 있음
- ✅ 실시간으로 업데이트됨
- ✅ AZD를 통해 배포 가능

**소요 시간**: 25-30분

---

### 연습 3: AI/LLM 애플리케이션 모니터링 ⭐⭐⭐ (고급)

**목표**: Azure OpenAI 사용량 추적(토큰, 비용, 지연)

**단계:**

1. **AI 모니터링 래퍼 생성:**

**파일: `src/ai_telemetry.py`**

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
            # Azure OpenAI 호출
            response = self.client.chat.completions.create(
                model=model,
                messages=messages,
                **kwargs
            )
            
            duration = (time.time() - start_time) * 1000  # 밀리초
            
            # 사용량 추출
            usage = response.usage
            prompt_tokens = usage.prompt_tokens
            completion_tokens = usage.completion_tokens
            total_tokens = usage.total_tokens
            
            # 비용 계산 (GPT-4 가격 책정)
            prompt_cost = (prompt_tokens / 1000) * 0.03  # 1K 토큰당 $0.03
            completion_cost = (completion_tokens / 1000) * 0.06  # 1K 토큰당 $0.06
            total_cost = prompt_cost + completion_cost
            
            # 사용자 정의 이벤트 추적
            telemetry.track_event('OpenAI_Request', {
                'model': model,
                'prompt_tokens': prompt_tokens,
                'completion_tokens': completion_tokens,
                'total_tokens': total_tokens,
                'duration_ms': duration,
                'cost_usd': total_cost,
                'success': True
            })
            
            # 지표 추적
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

2. **모니터링된 클라이언트 사용:**

```python
from flask import Flask, request, jsonify
from ai_telemetry import MonitoredAzureOpenAI
import os

app = Flask(__name__)

# 모니터링되는 OpenAI 클라이언트 초기화
openai_client = MonitoredAzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

@app.route('/api/chat', methods=['POST'])
def chat():
    data = request.json
    user_message = data.get('message')
    
    # 자동 모니터링을 사용하여 호출
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

3. **AI 메트릭 쿼리:**

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

**✅ 성공 기준:**
- ✅ 모든 OpenAI 호출이 자동으로 추적됨
- ✅ 토큰 사용량 및 비용이 표시됨
- ✅ 지연 시간 모니터링
- ✅ 예산 알림 설정 가능

**소요 시간**: 35-45분

---

## 비용 최적화

### 샘플링 전략

텔레메트리를 샘플링하여 비용 제어:

```python
from opencensus.trace.samplers import ProbabilitySampler

# 개발: 100% 샘플링
sampler = ProbabilitySampler(rate=1.0)

# 프로덕션: 10% 샘플링 (비용을 90% 절감)
sampler = ProbabilitySampler(rate=0.1)

# 적응형 샘플링 (자동으로 조정됨)
from opencensus.trace.samplers import AdaptiveSampler
sampler = AdaptiveSampler()
```

**Bicep에서:**

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  properties: {
    SamplingPercentage: 10  // 10% sampling
  }
}
```

### 데이터 보존 기간

```bicep
resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: logAnalyticsName
  properties: {
    retentionInDays: 30  // Minimum (cheapest)
    // Options: 30, 31, 60, 90, 120, 180, 270, 365, 550, 730
  }
}
```

### 월별 비용 추정

| 데이터량 | 보존 기간 | 월별 비용 |
|-------------|-----------|--------------|
| 1 GB/월 | 30일 | ~$2-5 |
| 5 GB/월 | 30일 | ~$10-15 |
| 10 GB/월 | 90일 | ~$25-40 |
| 50 GB/월 | 90일 | ~$100-150 |

**무료 등급**: 5 GB/월 포함

---

## 이해 점검

### 1. 기본 통합 ✓

이해도를 테스트하세요:

- [ ] **Q1**: AZD는 어떻게 Application Insights를 프로비저닝합니까?
  - **A**: Bicep 템플릿인 `infra/core/monitoring.bicep`를 통해 자동으로

- [ ] **Q2**: Application Insights를 활성화하는 환경 변수는 무엇입니까?
  - **A**: `APPLICATIONINSIGHTS_CONNECTION_STRING`

- [ ] **Q3**: 세 가지 주요 텔레메트리 유형은 무엇입니까?
  - **A**: 요청(HTTP 호출), 종속성(외부 호출), 예외(오류)

**실습 검증:**
```bash
# Application Insights가 구성되었는지 확인
azd env get-values | grep APPLICATIONINSIGHTS

# 텔레메트리가 흐르는지 확인
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "requests/count"
```

---

### 2. 맞춤 텔레메트리 ✓

이해도를 테스트하세요:

- [ ] **Q1**: 맞춤 비즈니스 이벤트는 어떻게 추적합니까?
  - **A**: `custom_dimensions`가 포함된 로거 사용 또는 `TelemetryClient.track_event()`

- [ ] **Q2**: 이벤트와 메트릭의 차이는 무엇입니까?
  - **A**: 이벤트는 개별 발생(사건)이고, 메트릭은 수치적 측정값입니다

- [ ] **Q3**: 서비스 간 텔레메트리를 어떻게 연관시키나요?
  - **A**: Application Insights는 자동으로 상호 연관을 위해 `operation_Id`를 사용합니다

**실습 검증:**
```kusto
// Verify custom events
traces
| where customDimensions.event_name != ""
| summarize count() by tostring(customDimensions.event_name)
```

---

### 3. 프로덕션 모니터링 ✓

이해도를 테스트하세요:

- [ ] **Q1**: 샘플링이 무엇이며 왜 사용합니까?
  - **A**: 샘플링은 텔레메트리 중 일부만 수집하여 데이터 양(및 비용)을 줄이는 방법입니다

- [ ] **Q2**: 알림은 어떻게 설정합니까?
  - **A**: Application Insights 메트릭을 기반으로 Bicep 또는 Azure 포털에서 메트릭 알림을 사용

- [ ] **Q3**: Log Analytics와 Application Insights의 차이는 무엇입니까?
  - **A**: Application Insights는 데이터를 Log Analytics 작업 영역에 저장하며, App Insights는 애플리케이션에 특화된 뷰를 제공합니다

**실습 검증:**
```bash
# 샘플링 구성 확인
az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "properties.SamplingPercentage"
```

---

## 모범 사례

### ✅ 권장 사항:

1. **상관 ID 사용**
   ```python
   logger.info('Processing order', extra={
       'custom_dimensions': {
           'order_id': order_id,
           'user_id': user_id
       }
   })
   ```

2. **중요 메트릭에 대한 알림 설정**
   ```bicep
   // Error rate, slow responses, availability
   ```

3. **구조화된 로깅 사용**
   ```python
   # ✅ 좋음: 구조화됨
   logger.info('User signup', extra={'custom_dimensions': {'user_id': 123}})
   
   # ❌ 나쁨: 구조화되지 않음
   logger.info(f'User 123 signed up')
   ```

4. **종속성 모니터링**
   ```python
   # 데이터베이스 호출, HTTP 요청 등을 자동으로 추적합니다.
   ```

5. **배포 중에 라이브 메트릭 사용**

### ❌ 하지 말아야 할 것:

1. **민감한 데이터는 로깅하지 마세요**
   ```python
   # ❌ 나쁨
   logger.info(f'Login: {username}:{password}')
   
   # ✅ 좋음
   logger.info('Login attempt', extra={'custom_dimensions': {'username': username}})
   ```

2. **프로덕션에서 100% 샘플링 사용 금지**
   ```python
   # ❌ 비쌈
   sampler = ProbabilitySampler(rate=1.0)
   
   # ✅ 비용 효율적
   sampler = ProbabilitySampler(rate=0.1)
   ```

3. **데드레터 큐를 무시하지 마세요**

4. **데이터 보존 한도를 설정하는 것을 잊지 마세요**

---

## 문제 해결

### 문제: 텔레메트리가 표시되지 않음

**진단:**
```bash
# 연결 문자열이 설정되어 있는지 확인하세요
azd env get-values | grep APPLICATIONINSIGHTS

# Azure Monitor를 통해 애플리케이션 로그를 확인하세요
azd monitor --logs

# 또는 Container Apps용 Azure CLI를 사용하세요:
az containerapp logs show --name $APP_NAME --resource-group $RG_NAME --tail 50
```

**해결 방법:**
```bash
# 컨테이너 앱에서 연결 문자열을 확인하세요
az containerapp show \
  --name $APP_NAME \
  --resource-group $RG_NAME \
  --query "properties.template.containers[0].env" \
  | grep -i applicationinsights
```

---

### 문제: 높은 비용

**진단:**
```bash
# 데이터 수집 확인
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "availabilityResults/count"
```

**해결 방법:**
- 샘플링 비율 감소
- 보존 기간 단축
- 상세 로깅 제거

---

## 더 알아보기

### 공식 문서
- [Application Insights 개요](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Python용 Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/opencensus-python)
- [Kusto 쿼리 언어](https://learn.microsoft.com/azure/data-explorer/kusto/query/)
- [AZD 모니터링](https://learn.microsoft.com/azure/developer/azure-developer-cli/monitor-your-app)

### 이 코스의 다음 단계
- ← 이전: [사전 점검](preflight-checks.md)
- → 다음: [배포 가이드](../chapter-04-infrastructure/deployment-guide.md)
- 🏠 [코스 홈](../../README.md)

### 관련 예제
- [Azure OpenAI 예제](../../../../examples/azure-openai-chat) - AI 텔레메트리
- [마이크로서비스 예제](../../../../examples/microservices) - 분산 추적

---

## 요약

**배운 내용:**
- ✅ AZD를 통한 Application Insights 자동 프로비저닝
- ✅ 맞춤 텔레메트리(이벤트, 메트릭, 종속성)
- ✅ 마이크로서비스 전반의 분산 추적
- ✅ 실시간 메트릭 및 모니터링
- ✅ 알림 및 대시보드
- ✅ AI/LLM 애플리케이션 모니터링
- ✅ 비용 최적화 전략

**핵심 요약:**
1. **AZD는 모니터링을 자동으로 제공합니다** - 수동 설정 불필요
2. **구조화된 로깅 사용** - 쿼리하기가 더 쉬워집니다
3. **비즈니스 이벤트 추적** - 기술적 메트릭뿐만 아니라
4. **AI 비용 모니터링** - 토큰 및 지출 추적
5. **알림 설정** - 반응적이지 말고 선제적으로 대응
6. **비용 최적화** - 샘플링 및 보관 기간 제한 사용

**다음 단계:**
1. 실습 과제를 완료하세요
2. AZD 프로젝트에 Application Insights를 추가하세요
3. 팀을 위한 맞춤 대시보드를 만드세요
4. 자세히 알아보기 [배포 가이드](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
면책 고지:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있으나 자동 번역에는 오류나 부정확성이 있을 수 있습니다. 원문(원어) 문서를 권위 있는 출처로 간주하시기 바랍니다. 중요한 정보의 경우 전문적인 인간 번역(전문 번역가)에 의한 번역을 권장합니다. 본 번역의 사용으로 인해 발생하는 모든 오해나 잘못된 해석에 대해서는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->