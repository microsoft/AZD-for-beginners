# Application Insights интеграција са AZD

⏱️ **Процењено време**: 40-50 минута | 💰 **Утицај на трошкове**: ~$5-15/месечно | ⭐ **Комплексност**: Средњи

**📚 Пут учења:**
- ← Претходно: [Провере пре лета](preflight-checks.md) - Валидација пре деплоyмента
- 🎯 **Налазите се овде**: Application Insights интеграција (Надгледање, телеметрија, дебаговање)
- → Следеће: [Водич за деплоyмент](../chapter-04-infrastructure/deployment-guide.md) - Деплоy на Azure
- 🏠 [Почетна курса](../../README.md)

---

## Шта ћете научити

Завршетком ове лекције, научићете:
- Интегрисати **Application Insights** у AZD пројекте аутоматски
- Конфигурисати **дистрибутовано трасирање** за микросервисе
- Имплементирати **прилагођену телеметрију** (метрике, догађаје, зависности)
- Подесити **Live Metrics** за праћење у реалном времену
- Креирати **аларме и контролне табле** из AZD деплоyмента
- Дебаговати проблеме у продукцији помоћу **телеметријских упита**
- Оптимизовати **трошкове и стратегије узорковања**
- Надгледати **AI/LLM апликације** (токени, латенција, трошкови)

## Зашто је Application Insights са AZD важан

### Изазов: Посматрање у продукцији

**Без Application Insights:**
```
❌ No visibility into production behavior
❌ Manual log aggregation across services
❌ Reactive debugging (wait for customer complaints)
❌ No performance metrics
❌ Cannot trace requests across services
❌ Unknown failure rates and bottlenecks
```

**С Application Insights + AZD:**
```
✅ Automatic telemetry collection
✅ Centralized logs from all services
✅ Proactive issue detection
✅ End-to-end request tracing
✅ Performance metrics and insights
✅ Real-time dashboards
✅ AZD provisions everything automatically
```

**Аналогија**: Application Insights је као црна кутија летачког сниматеља + инструмент табла у кокпиту за вашу апликацију. Видите све што се дешава у реалном времену и можете репродуковати било који инцидент.

---

## Преглед архитектуре

### Application Insights у AZD архитектури

```mermaid
graph TB
    User[Корисник/Клијент]
    App1[Апликација у контејнеру 1<br/>API гејтвеј]
    App2[Апликација у контејнеру 2<br/>Сервис производа]
    App3[Апликација у контејнеру 3<br/>Сервис поруџбина]
    
    AppInsights[Апликациони увиди<br/>Телеметријски хаб]
    LogAnalytics[(Лог аналитика<br/>Радни простор)]
    
    Portal[Azure портал<br/>Контролне табле & Упозорења]
    Query[Kusto упити<br/>Прилагођена анализа]
    
    User --> App1
    App1 --> App2
    App2 --> App3
    
    App1 -.->|Аутоматска инструментација| AppInsights
    App2 -.->|Аутоматска инструментација| AppInsights
    App3 -.->|Аутоматска инструментација| AppInsights
    
    AppInsights --> LogAnalytics
    LogAnalytics --> Portal
    LogAnalytics --> Query
    
    style AppInsights fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
    style LogAnalytics fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
```
### Шта се аутоматски прати

| Тип телеметрије | Шта бележи | Примена |
|----------------|------------------|----------|
| **Requests** | HTTP захтеви, статусни кодови, трајање | Праћење перформанси API-ја |
| **Dependencies** | Спољашњи позиви (DB, API-ји, складиште) | Идентфиковање юрњака |
| **Exceptions** | Нехендловане грешке са stack трасама | Дебаговање неуспеха |
| **Custom Events** | Бизнис догађаји (регистрација, куповина) | Аналитика и фанови |
| **Metrics** | Перформансни бројаћи, прилагођене метрике | Планирање капацитета |
| **Traces** | Поруке дневника са тежином | Дебаговање и ревизија |
| **Availability** | Тестови доступности и времена одговора | Праћење SLA-а |

---

## Предуслови

### Потребни алати

```bash
# Проверите Azure Developer CLI
azd version
# ✅ Очекује се: azd верзија 1.0.0 или новија

# Проверите Azure CLI
az --version
# ✅ Очекује се: azure-cli 2.50.0 или новија
```

### Захтеви за Azure

- Активна Azure претплата
- Дозволе за креирање:
  - Application Insights ресурса
  - Log Analytics радних простора
  - Container Apps
  - Resource група

### Предусловно знање

Требало би да сте завршили:
- [AZD основе](../chapter-01-foundation/azd-basics.md) - Основни AZD појмови
- [Конфигурација](../chapter-03-configuration/configuration.md) - Подешавање окружења
- [Први пројекат](../chapter-01-foundation/first-project.md) - Основни деплоyмент

---

## Лекција 1: Аутоматски Application Insights са AZD

### Како AZD провизионише Application Insights

AZD аутоматски креира и конфигурише Application Insights када деплоy-ујете. Хајде да видимо како то ради.

### Структура пројекта

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

### Корак 1: Конфигуришите AZD (azure.yaml)

**Фајл: `azure.yaml`**

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

**То је то!** AZD ће по дефолту креирати Application Insights. Није потребна додатна конфигурација за основно надгледање.

---

### Корак 2: Инфраструктура за надгледање (Bicep)

**Фајл: `infra/core/monitoring.bicep`**

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

### Корак 3: Повежите Container App са Application Insights

**Фајл: `infra/app/api.bicep`**

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

### Корак 4: Апликациони код са телеметријом

**Фајл: `src/app.py`**

```python
from flask import Flask, request, jsonify
from opencensus.ext.azure.log_exporter import AzureLogHandler
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.ext.flask.flask_middleware import FlaskMiddleware
from opencensus.trace.samplers import ProbabilitySampler
import logging
import os

app = Flask(__name__)

# Добијте Application Insights низ за повезивање
connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

if connection_string:
    # Конфигуришите расподељено праћење
    middleware = FlaskMiddleware(
        app,
        exporter=AzureExporter(connection_string=connection_string),
        sampler=ProbabilitySampler(rate=1.0)  # 100% узорковање за развој
    )
    
    # Конфигуришите логовање
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
    
    # Симулирајте позив базе података (аутоматски праћено као зависност)
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
    time.sleep(3)  # Симулирајте спору операцију
    logger.warning('Endpoint took 3 seconds to respond')
    return jsonify({'message': 'Slow operation completed'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
```

**Фајл: `src/requirements.txt`**

```txt
Flask==3.0.0
opencensus-ext-azure==1.1.13
opencensus-ext-flask==0.8.1
gunicorn==21.2.0
```

---

### Корак 5: Деплоy и верификација

```bash
# Иницијализуј AZD
azd init

# Размешти (аутоматски обезбеђује Application Insights)
azd up

# Добиј URL апликације
APP_URL=$(azd env get-values | grep API_URL | cut -d '=' -f2 | tr -d '"')

# Генериши телеметрију
curl $APP_URL/health
curl $APP_URL/api/products
curl $APP_URL/api/error-test
curl $APP_URL/api/slow
```

**✅ Очекивани излаз:**
```json
{
  "status": "healthy",
  "monitoring": "enabled"
}
```

---

### Корак 6: Погледајте телеметрију у Azure порталу

```bash
# Добијте детаље о Application Insights-у
azd env get-values | grep APPLICATIONINSIGHTS

# Отворите у Azure порталу
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"') \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"') \
  --query "appId" -o tsv
```

**Навигирајте до Azure Portal → Application Insights → Transaction Search**

Требало би да видите:
- ✅ HTTP захтеве са статусним кодовима
- ✅ Трајање захтева (3+ секунде за `/api/slow`)
- ✅ Детаље о изузецима са `/api/error-test`
- ✅ Прилагођене поруке дневника

---

## Лекција 2: Прилагођена телеметрија и догађаји

### Праћење бизнис догађаја

Додајмо прилагођену телеметрију за бизнис-критичне догађаје.

**Фајл: `src/telemetry.py`**

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
        
        # Подешавање логера
        self.logger = logging.getLogger(__name__)
        self.logger.addHandler(AzureLogHandler(connection_string=self.connection_string))
        self.logger.setLevel(logging.INFO)
        
        # Подешавање экспортера метрика
        self.stats = stats_module.stats
        self.view_manager = self.stats.view_manager
        self.stats_recorder = self.stats.stats_recorder
        
        exporter = metrics_exporter.new_metrics_exporter(
            connection_string=self.connection_string
        )
        self.view_manager.register_exporter(exporter)
        
        # Подешавање трацера
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

# Глобални клијент телеметрије
telemetry = TelemetryClient()
```

### Ажурирајте апликацију са прилагођеним догађајима

**Фајл: `src/app.py` (побољшан)**

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
    
    # Пратите пословни догађај
    telemetry.track_event('Purchase', {
        'product_id': product_id,
        'quantity': quantity,
        'total_amount': price * quantity,
        'user_id': request.headers.get('X-User-Id', 'anonymous')
    })
    
    # Пратите метрику прихода
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
    
    # Симулирајте претрагу (ово би био прави упит у базу података)
    results = [{'id': 1, 'name': f'Result for {query}'}]
    
    duration = (time.time() - start_time) * 1000  # Конвертујте у мс
    
    # Пратите догађај претраге
    telemetry.track_event('Search', {
        'query': query,
        'results_count': len(results),
        'duration_ms': duration
    })
    
    # Пратите метрику перформанси претраге
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
        # Симулирајте позив спољашњег АПИ-ја
        response = requests.get('https://api.example.com/data', timeout=5)
        result = response.json()
    except Exception as e:
        success = False
        result = {'error': str(e)}
    
    duration = (time.time() - start_time) * 1000
    
    # Пратите зависност
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

### Тестирајте прилагођену телеметрију

```bash
# Прати догађај куповине
curl -X POST $APP_URL/api/purchase \
  -H "Content-Type: application/json" \
  -H "X-User-Id: user123" \
  -d '{"product_id": 1, "quantity": 2, "price": 29.99}'

# Прати догађај претраге
curl "$APP_URL/api/search?q=laptop"

# Прати спољну зависност
curl $APP_URL/api/external-call
```

**Поглед у Azure порталу:**

Навигирајте до Application Insights → Logs, затим покрените:

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

## Лекција 3: Дистрибутовано трасирање за микросервисе

### Омогућите трасирање преко сервиса

За микросервисе, Application Insights аутоматски корелира захтеве између сервиса.

**Фајл: `infra/main.bicep`**

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

### Погледајте крај-до-краја транзакцију

```mermaid
sequenceDiagram
    participant User
    participant Gateway as API гејтвеј<br/>(ID трага: abc123)
    participant Product as Сервис производа<br/>(ID родитеља: abc123)
    participant Order as Сервис наруџбина<br/>(ID родитеља: abc123)
    participant AppInsights as Апликациони увид
    
    User->>Gateway: POST /api/checkout
    Note over Gateway: Почетак трага: abc123
    Gateway->>AppInsights: Запиши захтев (ID трага: abc123)
    
    Gateway->>Product: GET /products/123
    Note over Product: ID родитеља: abc123
    Product->>AppInsights: Запиши позив зависности
    Product-->>Gateway: Детаљи производа
    
    Gateway->>Order: POST /orders
    Note over Order: ID родитеља: abc123
    Order->>AppInsights: Запиши позив зависности
    Order-->>Gateway: Наруџбина креирана
    
    Gateway-->>User: Наплата завршена
    Gateway->>AppInsights: Запиши одговор (Трајање: 450ms)
    
    Note over AppInsights: Корелација по ID трага
```
**Упит за крај-до-краја трасу:**

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

## Лекција 4: Live Metrics и праћење у реалном времену

### Омогућите Live Metrics Stream

Live Metrics пружа телеметрију у реалном времену са латенцијом <1 секунде.

**Приступ Live Metrics:**

```bash
# Добијте ресурс Application Insights
APPI_NAME=$(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"')

# Добијте групу ресурса
RG_NAME=$(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"')

echo "Navigate to: Azure Portal → Resource Groups → $RG_NAME → $APPI_NAME → Live Metrics"
```

**Шта видите у реалном времену:**
- ✅ Стопа улазећих захтева (requests/sec)
- ✅ Одлазећи позиви зависности
- ✅ Број изузетака
- ✅ Кориšћење CPU-а и меморије
- ✅ Број активних сервера
- ✅ Примерци телеметрије

### Генеришите оптерећење за тестирање

```bash
# Генеришите оптерећење да бисте видели метрике уживо
for i in {1..100}; do
  curl $APP_URL/api/products &
  curl $APP_URL/api/search?q=test$i &
done

# Пратите метрике уживо у Azure порталу
# Требало би да видите скок стопе захтева
```

---

## Практични задаци

### Задатак 1: Подесите аларме ⭐⭐ (Средњи)

**Циљ**: Креирати аларме за високе стопе грешака и споре одговоре.

**Кораци:**

1. **Креирајте аларм за стопу грешака:**

```bash
# Добијте ID ресурса Application Insights
APPI_ID=$(az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "id" -o tsv)

# Креирајте метрички аларм за неуспеле захтеве
az monitor metrics alert create \
  --name "High-Error-Rate" \
  --resource-group $RG_NAME \
  --scopes $APPI_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "Alert when error rate exceeds 10 per 5 minutes"
```

2. **Креирајте аларм за споре одговоре:**

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

3. **Креирајте аларм преко Bicep-а (препоручено за AZD):**

**Фајл: `infra/core/alerts.bicep`**

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

4. **Тестирајте аларме:**

```bash
# Генериши грешке
for i in {1..20}; do
  curl $APP_URL/api/error-test
done

# Генериши споре одговоре
for i in {1..10}; do
  curl $APP_URL/api/slow
done

# Провери статус упозорења (сачекај 5-10 минута)
az monitor metrics alert list \
  --resource-group $RG_NAME \
  --query "[].{Name:name, Enabled:enabled, State:properties.enabled}" \
  --output table
```

**✅ Критеријуми успешности:**
- ✅ Аларми успешно креирани
- ✅ Аларми се активирају када се прекораче прагови
- ✅ Можете видети историју аларма у Azure порталу
- ✅ Интегрисано са AZD деплоyментом

**Време**: 20-25 минута

---

### Задатак 2: Креирајте прилагођену контролну таблу ⭐⭐ (Средњи)

**Циљ**: Направити таблу која приказује кључне метрике апликације.

**Кораци:**

1. **Креирајте контролну таблу преко Azure портала:**

Навигирајте до: Azure Portal → Dashboards → New Dashboard

2. **Додајте плочице за кључне метрике:**

- Број захтева (последњих 24 сата)
- Просечно време одговора
- Стопа грешака
- Топ 5 најспоријих операција
- Географска расподела корисника

3. **Креирајте контролну таблу преко Bicep-а:**

**Фајл: `infra/core/dashboard.bicep`**

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

4. **Деплоy контролну таблу:**

```bash
# Додајте у main.bicep
module dashboard './core/dashboard.bicep' = {
  name: 'dashboard'
  scope: rg
  params: {
    dashboardName: 'dashboard-${environmentName}'
    applicationInsightsId: monitoring.outputs.applicationInsightsId
    location: location
  }
}

# Разместите
azd up
```

**✅ Критеријуми успешности:**
- ✅ Контролна табла приказује кључне метрике
- ✅ Може се причврстити на почетну страну Azure портала
- ✅ Ажурира се у реалном времену
- ✅ Деплоy-ује се преко AZD

**Време**: 25-30 минута

---

### Задатак 3: Надгледање AI/LLM апликације ⭐⭐⭐ (Напредни)

**Циљ**: Пратити коришћење Microsoft Foundry модела (токени, трошкови, латенција).

**Кораци:**

1. **Креирајте AI мониторинг омотач:**

**Фајл: `src/ai_telemetry.py`**

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
            # Позови Microsoft Foundry моделе
            response = self.client.chat.completions.create(
                model=model,
                messages=messages,
                **kwargs
            )
            
            duration = (time.time() - start_time) * 1000  # мс
            
            # Извучи коришћење
            usage = response.usage
            prompt_tokens = usage.prompt_tokens
            completion_tokens = usage.completion_tokens
            total_tokens = usage.total_tokens
            
            # Израчунај трошкове (цена gpt-4.1)
            prompt_cost = (prompt_tokens / 1000) * 0.03  # $0.03 по 1K токена
            completion_cost = (completion_tokens / 1000) * 0.06  # $0.06 по 1K токена
            total_cost = prompt_cost + completion_cost
            
            # Прати прилагођени догађај
            telemetry.track_event('OpenAI_Request', {
                'model': model,
                'prompt_tokens': prompt_tokens,
                'completion_tokens': completion_tokens,
                'total_tokens': total_tokens,
                'duration_ms': duration,
                'cost_usd': total_cost,
                'success': True
            })
            
            # Прати метрике
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

2. **Користите надгледани клијент:**

```python
from flask import Flask, request, jsonify
from ai_telemetry import MonitoredAzureOpenAI
import os

app = Flask(__name__)

# Иницијализуј надгледаног OpenAI клијента
openai_client = MonitoredAzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

@app.route('/api/chat', methods=['POST'])
def chat():
    data = request.json
    user_message = data.get('message')
    
    # Позив са аутоматским праћењем
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

3. **Упити AI метрике:**

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

**✅ Критеријуми успешности:**
- ✅ Сваки OpenAI позив праћен аутоматски
- ✅ Потрошња токена и трошкови видљиви
- ✅ Латенција праћена
- ✅ Могуће подесити аларме за буџет

**Време**: 35-45 минута

---

## Оптимизација трошкова

### Стратегије узорковања

Контролишите трошкове узорковањем телеметрије:

```python
from opencensus.trace.samplers import ProbabilitySampler

# Развој: узорковање 100%
sampler = ProbabilitySampler(rate=1.0)

# Производња: узорковање 10% (смањити трошкове за 90%)
sampler = ProbabilitySampler(rate=0.1)

# Адаптивно узорковање (аутоматски се прилагођава)
from opencensus.trace.samplers import AdaptiveSampler
sampler = AdaptiveSampler()
```

**У Bicep-у:**

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  properties: {
    SamplingPercentage: 10  // 10% sampling
  }
}
```

### Чување података

```bicep
resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: logAnalyticsName
  properties: {
    retentionInDays: 30  // Minimum (cheapest)
    // Options: 30, 31, 60, 90, 120, 180, 270, 365, 550, 730
  }
}
```

### Месечне процене трошкова

| Обим података | Задржавање | Месечни трошак |
|-------------|-----------|--------------|
| 1 GB/месечно | 30 дана | ~$2-5 |
| 5 GB/месечно | 30 дана | ~$10-15 |
| 10 GB/месечно | 90 дана | ~$25-40 |
| 50 GB/месечно | 90 дана | ~$100-150 |

**Бесплатни ниво**: 5 GB/месечно укључено

---

## Контролна тачка знања

### 1. Основна интеграција ✓

Тестирајте своје разумевање:

- [ ] **Q1**: Како AZD провизионише Application Insights?
  - **A**: Аутоматски преко Bicep шаблона у `infra/core/monitoring.bicep`

- [ ] **Q2**: Која средина променљива омогућава Application Insights?
  - **A**: `APPLICATIONINSIGHTS_CONNECTION_STRING`

- [ ] **Q3**: Која су три главна типа телеметрије?
  - **A**: Requests (HTTP позиви), Dependencies (спољни позиви), Exceptions (грешке)

**Практична верификација:**
```bash
# Проверите да ли је Application Insights конфигурисан
azd env get-values | grep APPLICATIONINSIGHTS

# Проверите да ли телеметрија стиже
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "requests/count"
```

---

### 2. Прилагођена телеметрија ✓

Тестирајте своје разумевање:

- [ ] **Q1**: Како пратите прилагођене бизнис догађаје?
  - **A**: Користите логер са `custom_dimensions` или `TelemetryClient.track_event()`

- [ ] **Q2**: Која је разлика између догађаја и метрика?
  - **A**: Догађаји су појединачни настанци, метрике су нумеричка мерења

- [ ] **Q3**: Како корелирате телеметрију између сервиса?
  - **A**: Application Insights аутоматски користи `operation_Id` за корелацију

**Практична верификација:**
```kusto
// Verify custom events
traces
| where customDimensions.event_name != ""
| summarize count() by tostring(customDimensions.event_name)
```

---

### 3. Праћење у продукцији ✓

Тестирајте своје разумевање:

- [ ] **Q1**: Шта је узорковање и зашто га користити?
  - **A**: Узорковање смањује обим података (и трошкове) тако што бележи само проценат телеметрије

- [ ] **Q2**: Како подесити аларме?
  - **A**: Користите метричке аларме у Bicep-у или Azure порталу на основу Application Insights метрика

- [ ] **Q3**: Која је разлика између Log Analytics и Application Insights?
  - **A**: Application Insights чува податке у Log Analytics радном простору; App Insights пружа апликационо-специфичне приказе

**Практична верификација:**
```bash
# Проверите конфигурацију узорковања
az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "properties.SamplingPercentage"
```

---

## Најбоље праксе

### ✅ РАДИТЕ ОВО:

1. **Користите идентификатор корелације**
   ```python
   logger.info('Processing order', extra={
       'custom_dimensions': {
           'order_id': order_id,
           'user_id': user_id
       }
   })
   ```

2. **Подесите аларме за критичне метрике**
   ```bicep
   // Error rate, slow responses, availability
   ```

3. **Користите структурирано логовање**
   ```python
   # ✅ ДОБРО: Структурисано
   logger.info('User signup', extra={'custom_dimensions': {'user_id': 123}})
   
   # ❌ ЛОШЕ: Неструктурисано
   logger.info(f'User 123 signed up')
   ```

4. **Надгледајте зависности**
   ```python
   # Аутоматски прати позиве базе података, HTTP захтеве и слично.
   ```

5. **Користите Live Metrics током деплоyмента**

### ❌ НЕ РАДИТЕ ОВО:

1. **Не логовујте осетљиве податке**
   ```python
   # ❌ ЛОШЕ
   logger.info(f'Login: {username}:{password}')
   
   # ✅ ДОБРО
   logger.info('Login attempt', extra={'custom_dimensions': {'username': username}})
   ```

2. **Не користите 100% узорковање у продукцији**
   ```python
   # ❌ Скуп
   sampler = ProbabilitySampler(rate=1.0)
   
   # ✅ Исплативо
   sampler = ProbabilitySampler(rate=0.1)
   ```

3. **Не игноришите dead letter редове**

4. **Не заборавите да подесите лимите за задржавање података**

---

## Решавање проблема

### Проблем: Нема појављене телеметрије

**Дијагноза:**
```bash
# Проверите да ли је конекцијски низ подешен
azd env get-values | grep APPLICATIONINSIGHTS

# Проверите логове апликације преко Azure Monitor-а
azd monitor --logs

# Или користите Azure CLI за Container Apps:
az containerapp logs show --name $APP_NAME --resource-group $RG_NAME --tail 50
```

**Решење:**
```bash
# Проверите конекциони низ у Container App
az containerapp show \
  --name $APP_NAME \
  --resource-group $RG_NAME \
  --query "properties.template.containers[0].env" \
  | grep -i applicationinsights
```

---

### Проблем: Високи трошкови

**Дијагноза:**
```bash
# Провери пријем података
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "availabilityResults/count"
```

**Решење:**
- Смањите стопу узорковања
- Скраћите период задржавања
- Уклоните детаљно логовање

---

## Сазнајте више

### Званична документација
- [Application Insights Overview](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Application Insights for Python](https://learn.microsoft.com/azure/azure-monitor/app/opencensus-python)
- [Kusto Query Language](https://learn.microsoft.com/azure/data-explorer/kusto/query/)
- [AZD Monitoring](https://learn.microsoft.com/azure/developer/azure-developer-cli/monitor-your-app)

### Следећи кораци у овом курсу
- ← Претходно: [Провере пре лета](preflight-checks.md)
- → Следеће: [Водич за деплоyмент](../chapter-04-infrastructure/deployment-guide.md)
- 🏠 [Почетна курса](../../README.md)

### Повезани примери
- [Microsoft Foundry Models Example](../../../../examples/azure-openai-chat) - AI телеметрија
- [Microservices Example](../../../../examples/microservices) - Дистрибутовано трасирање

---

## Резиме

**Науčili сте:**
- ✅ Аутоматско провизионовање Application Insights-а са AZD
- ✅ Прилагођена телеметрија (догађаји, метрике, зависности)
- ✅ Дистрибутовано трасирање кроз микросервисе
- ✅ Live Metrics и праћење у реалном времену
- ✅ Аларми и контролне табле
- ✅ Надгледање AI/LLM апликација
- ✅ Стратегије оптимизације трошкова

**Кључне поуке:**
1. **AZD аутоматски обезбеђује мониторинг** - Без ручног подешавања
2. **Користите структурисано логовање** - Олакшава извођење упита
3. **Пратите пословне догађаје** - Не само техничке метрике
4. **Пратите трошкове AI** - Пратите токене и потрошњу
5. **Подесите упозорења** - Будите проактивни, не реактивни
6. **Оптимизујте трошкове** - Користите узорковање и ограничења задржавања

**Следећи кораци:**
1. Завршите практичне вежбе
2. Додајте Application Insights у ваше AZD пројекте
3. Креирајте прилагођене контролне табле за ваш тим
4. Погледајте [Водич за постављање](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ограничење одговорности**:
Овај документ је преведен помоћу сервиса за превођење базираног на вештачкој интелигенцији [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да обезбедимо тачност, имајте у виду да аутоматизовани преводи могу садржати грешке или нетачности. Оригинални документ на свом изворном језику треба сматрати меродавним извором. За критичне информације препоручује се професионални превод обављен од стране људског преводиоца. Не сносимо одговорност за било какве неспоразуме или погрешна тумачења која произилазе из употребе овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->