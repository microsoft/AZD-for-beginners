# Інтеграція Application Insights з AZD

⏱️ **Очікуваний час**: 40-50 хвилин | 💰 **Вплив на вартість**: ~$5-15/місяць | ⭐ **Складність**: Середній рівень

**📚 Навчальний шлях:**
- ← Попередній: [Перевірки перед запуском](preflight-checks.md) - Перевірка перед розгортанням
- 🎯 **Ви тут**: Інтеграція Application Insights (Моніторинг, телеметрія, відлагодження)
- → Наступний: [Посібник з розгортання](../chapter-04-infrastructure/deployment-guide.md) - Розгортання в Azure
- 🏠 [Головна сторінка курсу](../../README.md)

---

## Чого ви навчитеся

Після проходження цього уроку ви:
- Інтегруєте **Application Insights** в проекти AZD автоматично
- Налаштуєте **розподілене трасування** для мікросервісів
- Реалізуєте **кастомну телеметрію** (метрики, події, залежності)
- Налаштуєте **живі метрики** для моніторингу в реальному часі
- Створите **оповіщення та панелі** з розгортань AZD
- Відлагодите проблеми в продакшені за допомогою **запитів телеметрії**
- Оптимізуєте **витрати та стратегії вибірки**
- Моніторите **додатки AI/LLM** (токени, затримки, витрати)

## Чому Application Insights із AZD важливий

### Виклик: Виробнича видимість

**Без Application Insights:**
```
❌ No visibility into production behavior
❌ Manual log aggregation across services
❌ Reactive debugging (wait for customer complaints)
❌ No performance metrics
❌ Cannot trace requests across services
❌ Unknown failure rates and bottlenecks
```

**З Application Insights + AZD:**
```
✅ Automatic telemetry collection
✅ Centralized logs from all services
✅ Proactive issue detection
✅ End-to-end request tracing
✅ Performance metrics and insights
✅ Real-time dashboards
✅ AZD provisions everything automatically
```

**Аналогія**: Application Insights — це як "чорна скринька" та панель приладів у кабіні пілота для вашого застосунку. Ви бачите все, що відбувається в реальному часі, і можете відтворити будь-який інцидент.

---

## Огляд архітектури

### Application Insights в архітектурі AZD

```mermaid
graph TB
    User[Користувач/Клієнт]
    App1[Контейнерний додаток 1<br/>API шлюз]
    App2[Контейнерний додаток 2<br/>Служба продуктів]
    App3[Контейнерний додаток 3<br/>Служба замовлень]
    
    AppInsights[Application Insights<br/>Телекомунікаційний хаб]
    LogAnalytics[(Log Analytics<br/>Робочий простір)]
    
    Portal[Портал Azure<br/>Панелі приладів і сповіщення]
    Query[Kusto-запити<br/>Користувальницький аналіз]
    
    User --> App1
    App1 --> App2
    App2 --> App3
    
    App1 -.->|Автоматичне інструментування| AppInsights
    App2 -.->|Автоматичне інструментування| AppInsights
    App3 -.->|Автоматичне інструментування| AppInsights
    
    AppInsights --> LogAnalytics
    LogAnalytics --> Portal
    LogAnalytics --> Query
    
    style AppInsights fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
    style LogAnalytics fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
```
### Що моніториться автоматично

| Тип телеметрії | Що фіксується | Використання |
|----------------|---------------|--------------|
| **Запити** | HTTP-запити, коди стану, тривалість | Моніторинг продуктивності API |
| **Залежності** | Зовнішні виклики (БД, API, сховище) | Виявлення вузьких місць |
| **Виключення** | Невловлені помилки зі стеком | Відлагодження збоїв |
| **Користувацькі події** | Бізнес-події (реєстрація, покупка) | Аналітика та конверсії |
| **Метрики** | Лічильники продуктивності, кастомні метрики | Планування ресурсів |
| **Трейси** | Повідомлення журналу з рівнем серйозності | Відлагодження та аудит |
| **Доступність** | Тести часу роботи та відгуку | Моніторинг SLA |

---

## Передумови

### Необхідні інструменти

```bash
# Перевірити Azure Developer CLI
azd version
# ✅ Очікувано: azd версія 1.0.0 або вище

# Перевірити Azure CLI
az --version
# ✅ Очікувано: azure-cli 2.50.0 або вище
```

### Вимоги Azure

- Активна підписка Azure
- Права для створення:
  - ресурсів Application Insights
  - робочих областей Log Analytics
  - Container Apps
  - груп ресурсів

### Попередні знання

Вам слід мати пройдені:
- [Основи AZD](../chapter-01-foundation/azd-basics.md) - Ключові поняття AZD
- [Налаштування](../chapter-03-configuration/configuration.md) - Налаштування середовища
- [Перший проєкт](../chapter-01-foundation/first-project.md) - Базове розгортання

---

## Урок 1: Автоматичний Application Insights з AZD

### Як AZD створює Application Insights

AZD автоматично створює і налаштовує Application Insights під час розгортання. Подивимося, як це працює.

### Структура проекту

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

### Крок 1: Налаштування AZD (azure.yaml)

**Файл: `azure.yaml`**

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

**От і все!** AZD за замовчуванням створить Application Insights. Для базового моніторингу додаткових налаштувань не потрібно.

---

### Крок 2: Інфраструктура моніторингу (Bicep)

**Файл: `infra/core/monitoring.bicep`**

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

### Крок 3: Підключення Container App до Application Insights

**Файл: `infra/app/api.bicep`**

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

### Крок 4: Код додатку з телеметрією

**Файл: `src/app.py`**

```python
from flask import Flask, request, jsonify
from opencensus.ext.azure.log_exporter import AzureLogHandler
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.ext.flask.flask_middleware import FlaskMiddleware
from opencensus.trace.samplers import ProbabilitySampler
import logging
import os

app = Flask(__name__)

# Отримати рядок підключення Application Insights
connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

if connection_string:
    # Налаштувати розподілене трасування
    middleware = FlaskMiddleware(
        app,
        exporter=AzureExporter(connection_string=connection_string),
        sampler=ProbabilitySampler(rate=1.0)  # 100% вибірка для розробки
    )
    
    # Налаштувати логування
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
    
    # Імітувати виклик бази даних (автоматично відслідковується як залежність)
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
    time.sleep(3)  # Імітувати повільну операцію
    logger.warning('Endpoint took 3 seconds to respond')
    return jsonify({'message': 'Slow operation completed'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
```

**Файл: `src/requirements.txt`**

```txt
Flask==3.0.0
opencensus-ext-azure==1.1.13
opencensus-ext-flask==0.8.1
gunicorn==21.2.0
```

---

### Крок 5: Розгортання і перевірка

```bash
# Ініціалізувати AZD
azd init

# Розгорнути (автоматично налаштовує Application Insights)
azd up

# Отримати URL додатка
APP_URL=$(azd env get-values | grep API_URL | cut -d '=' -f2 | tr -d '"')

# Генерувати телеметрію
curl $APP_URL/health
curl $APP_URL/api/products
curl $APP_URL/api/error-test
curl $APP_URL/api/slow
```

**✅ Очікуваний результат:**
```json
{
  "status": "healthy",
  "monitoring": "enabled"
}
```

---

### Крок 6: Перегляд телеметрії в Azure Portal

```bash
# Отримати відомості про Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Відкрити в порталі Azure
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"') \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"') \
  --query "appId" -o tsv
```

**Перейдіть в Azure Portal → Application Insights → Transaction Search**

Ви побачите:
- ✅ HTTP-запити з кодами статусу
- ✅ Тривалість запитів (3+ секунди для `/api/slow`)
- ✅ Деталі виключень із `/api/error-test`
- ✅ Користувацькі повідомлення журналу

---

## Урок 2: Кастомна телеметрія та події

### Відстеження бізнес-подій

Додамо кастомну телеметрію для бізнес-критичних подій.

**Файл: `src/telemetry.py`**

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
        
        # Налаштування логера
        self.logger = logging.getLogger(__name__)
        self.logger.addHandler(AzureLogHandler(connection_string=self.connection_string))
        self.logger.setLevel(logging.INFO)
        
        # Налаштування експортера метрик
        self.stats = stats_module.stats
        self.view_manager = self.stats.view_manager
        self.stats_recorder = self.stats.stats_recorder
        
        exporter = metrics_exporter.new_metrics_exporter(
            connection_string=self.connection_string
        )
        self.view_manager.register_exporter(exporter)
        
        # Налаштування трасувальника
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

# Глобальний клієнт телеметрії
telemetry = TelemetryClient()
```

### Оновлення додатку з кастомними подіями

**Файл: `src/app.py` (розширений)**

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
    
    # Відстежити бізнес-подію
    telemetry.track_event('Purchase', {
        'product_id': product_id,
        'quantity': quantity,
        'total_amount': price * quantity,
        'user_id': request.headers.get('X-User-Id', 'anonymous')
    })
    
    # Відстежити показник доходу
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
    
    # Імітувати пошук (була б реальним запитом до бази даних)
    results = [{'id': 1, 'name': f'Result for {query}'}]
    
    duration = (time.time() - start_time) * 1000  # Конвертувати в мс
    
    # Відстежити подію пошуку
    telemetry.track_event('Search', {
        'query': query,
        'results_count': len(results),
        'duration_ms': duration
    })
    
    # Відстежити показник продуктивності пошуку
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
        # Імітувати зовнішній виклик API
        response = requests.get('https://api.example.com/data', timeout=5)
        result = response.json()
    except Exception as e:
        success = False
        result = {'error': str(e)}
    
    duration = (time.time() - start_time) * 1000
    
    # Відстежити залежність
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

### Тестування кастомної телеметрії

```bash
# Відстежити подію покупки
curl -X POST $APP_URL/api/purchase \
  -H "Content-Type: application/json" \
  -H "X-User-Id: user123" \
  -d '{"product_id": 1, "quantity": 2, "price": 29.99}'

# Відстежити подію пошуку
curl "$APP_URL/api/search?q=laptop"

# Відстежити зовнішню залежність
curl $APP_URL/api/external-call
```

**Перегляд в Azure Portal:**

Перейдіть у Application Insights → Logs, потім виконайте:

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

## Урок 3: Розподілене трасування для мікросервісів

### Увімкнення трасування між сервісами

Для мікросервісів Application Insights автоматично корелює запити між сервісами.

**Файл: `infra/main.bicep`**

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

### Перегляд транзакції від початку до кінця

```mermaid
sequenceDiagram
    participant User
    participant Gateway as API Gateway<br/>(Ідентифікатор трасування: abc123)
    participant Product as Сервіс продуктів<br/>(Батьківський ID: abc123)
    participant Order as Сервіс замовлень<br/>(Батьківський ID: abc123)
    participant AppInsights as Application Insights
    
    User->>Gateway: POST /api/checkout
    Note over Gateway: Початок трасування: abc123
    Gateway->>AppInsights: Лог запиту (Ідентифікатор трасування: abc123)
    
    Gateway->>Product: GET /products/123
    Note over Product: Батьківський ID: abc123
    Product->>AppInsights: Лог виклику залежності
    Product-->>Gateway: Деталі продукту
    
    Gateway->>Order: POST /orders
    Note over Order: Батьківський ID: abc123
    Order->>AppInsights: Лог виклику залежності
    Order-->>Gateway: Замовлення створено
    
    Gateway-->>User: Оформлення завершено
    Gateway->>AppInsights: Лог відповіді (Тривалість: 450ms)
    
    Note over AppInsights: Кореляція за ідентифікатором трасування
```
**Запит на відстеження транзакції:**

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

## Урок 4: Живі метрики та моніторинг у реальному часі

### Увімкнення потокових живих метрик

Live Metrics надає телеметрію майже в реальному часі з затримкою <1 секунди.

**Доступ до Live Metrics:**

```bash
# Отримати ресурс Application Insights
APPI_NAME=$(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"')

# Отримати групу ресурсів
RG_NAME=$(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"')

echo "Navigate to: Azure Portal → Resource Groups → $RG_NAME → $APPI_NAME → Live Metrics"
```

**Що ви бачите в реальному часі:**
- ✅ Кількість вхідних запитів (запитів/сек)
- ✅ Вихідні дзвінки залежностей
- ✅ Кількість виключень
- ✅ Використання CPU і пам’яті
- ✅ Кількість активних серверів
- ✅ Вибіркові дані телеметрії

### Генерація навантаження для тестування

```bash
# Генеруйте навантаження, щоб побачити живі метрики
for i in {1..100}; do
  curl $APP_URL/api/products &
  curl $APP_URL/api/search?q=test$i &
done

# Спостерігайте живі метрики в Azure Portal
# Ви повинні побачити різке збільшення кількості запитів
```

---

## Практичні вправи

### Вправа 1: Налаштування оповіщень ⭐⭐ (Середній рівень)

**Мета**: Створити оповіщення для високого рівня помилок і повільних відповідей.

**Кроки:**

1. **Створити оповіщення за рівнем помилок:**

```bash
# Отримати ідентифікатор ресурсу Application Insights
APPI_ID=$(az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "id" -o tsv)

# Створити метрику сповіщення для невдалих запитів
az monitor metrics alert create \
  --name "High-Error-Rate" \
  --resource-group $RG_NAME \
  --scopes $APPI_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "Alert when error rate exceeds 10 per 5 minutes"
```

2. **Створити оповіщення за повільними відповідями:**

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

3. **Створити оповіщення через Bicep (рекомендовано для AZD):**

**Файл: `infra/core/alerts.bicep`**

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

4. **Перевірити оповіщення:**

```bash
# Генерувати помилки
for i in {1..20}; do
  curl $APP_URL/api/error-test
done

# Генерувати повільні відповіді
for i in {1..10}; do
  curl $APP_URL/api/slow
done

# Перевірити стан сповіщення (очікувати 5-10 хвилин)
az monitor metrics alert list \
  --resource-group $RG_NAME \
  --query "[].{Name:name, Enabled:enabled, State:properties.enabled}" \
  --output table
```

**✅ Критерії успіху:**
- ✅ Оповіщення успішно створені
- ✅ Оповіщення спрацьовують при перевищенні порогів
- ✅ Можна переглянути історію оповіщень в Azure Portal
- ✅ Інтеграція з розгортаннями AZD

**Час:** 20-25 хвилин

---

### Вправа 2: Створення кастомної панелі ⭐⭐ (Середній рівень)

**Мета**: Зібрати панель із ключовими метриками застосунку.

**Кроки:**

1. **Створити панель через Azure Portal:**

Перейдіть: Azure Portal → Dashboards → New Dashboard

2. **Додати віджети з ключовими метриками:**

- Кількість запитів (за останні 24 години)
- Середній час відповіді
- Рівень помилок
- Топ-5 найповільніших операцій
- Географічний розподіл користувачів

3. **Створити панель через Bicep:**

**Файл: `infra/core/dashboard.bicep`**

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

4. **Розгорнути панель:**

```bash
# Додайте до main.bicep
module dashboard './core/dashboard.bicep' = {
  name: 'dashboard'
  scope: rg
  params: {
    dashboardName: 'dashboard-${environmentName}'
    applicationInsightsId: monitoring.outputs.applicationInsightsId
    location: location
  }
}

# Розгорнути
azd up
```

**✅ Критерії успіху:**
- ✅ Панель відображає ключові метрики
- ✅ Можна закріпити на головній сторінці Azure Portal
- ✅ Дані оновлюються в реальному часі
- ✅ Можна розгортати через AZD

**Час:** 25-30 хвилин

---

### Вправа 3: Моніторинг AI/LLM-застосунку ⭐⭐⭐ (Розширений рівень)

**Мета**: Відстежувати використання моделей Microsoft Foundry (токени, витрати, затримки).

**Кроки:**

1. **Створити обгортку для моніторингу AI:**

**Файл: `src/ai_telemetry.py`**

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
            # Виклик моделей Microsoft Foundry
            response = self.client.chat.completions.create(
                model=model,
                messages=messages,
                **kwargs
            )
            
            duration = (time.time() - start_time) * 1000  # ms
            
            # Витяг використання
            usage = response.usage
            prompt_tokens = usage.prompt_tokens
            completion_tokens = usage.completion_tokens
            total_tokens = usage.total_tokens
            
            # Розрахувати вартість (ціноутворення gpt-4.1)
            prompt_cost = (prompt_tokens / 1000) * 0.03  # $0.03 за 1 тис. токенів
            completion_cost = (completion_tokens / 1000) * 0.06  # $0.06 за 1 тис. токенів
            total_cost = prompt_cost + completion_cost
            
            # Відстежувати користувацьку подію
            telemetry.track_event('OpenAI_Request', {
                'model': model,
                'prompt_tokens': prompt_tokens,
                'completion_tokens': completion_tokens,
                'total_tokens': total_tokens,
                'duration_ms': duration,
                'cost_usd': total_cost,
                'success': True
            })
            
            # Відстежувати метрики
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

2. **Використовувати клієнт з моніторингом:**

```python
from flask import Flask, request, jsonify
from ai_telemetry import MonitoredAzureOpenAI
import os

app = Flask(__name__)

# Ініціалізувати контрольований клієнт OpenAI
openai_client = MonitoredAzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

@app.route('/api/chat', methods=['POST'])
def chat():
    data = request.json
    user_message = data.get('message')
    
    # Виклик з автоматичним моніторингом
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

3. **Запити метрик AI:**

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

**✅ Критерії успіху:**
- ✅ Кожен виклик OpenAI відстежується автоматично
- ✅ Відображення використання токенів і витрат
- ✅ Моніторинг затримок
- ✅ Можливість налаштування бюджетних оповіщень

**Час:** 35-45 хвилин

---

## Оптимізація витрат

### Стратегії вибірки

Контролюйте витрати за допомогою вибірки телеметрії:

```python
from opencensus.trace.samplers import ProbabilitySampler

# Розробка: 100% вибірка
sampler = ProbabilitySampler(rate=1.0)

# Виробництво: 10% вибірка (зменшити витрати на 90%)
sampler = ProbabilitySampler(rate=0.1)

# Адаптивна вибірка (автоматично налаштовується)
from opencensus.trace.samplers import AdaptiveSampler
sampler = AdaptiveSampler()
```

**У Bicep:**

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  properties: {
    SamplingPercentage: 10  // 10% sampling
  }
}
```

### Збереження даних

```bicep
resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: logAnalyticsName
  properties: {
    retentionInDays: 30  // Minimum (cheapest)
    // Options: 30, 31, 60, 90, 120, 180, 270, 365, 550, 730
  }
}
```

### Місячні оцінки вартості

| Обсяг даних | Збереження | Місячна вартість |
|-------------|------------|------------------|
| 1 ГБ/місяць | 30 днів | ~$2-5 |
| 5 ГБ/місяць | 30 днів | ~$10-15 |
| 10 ГБ/місяць | 90 днів | ~$25-40 |
| 50 ГБ/місяць | 90 днів | ~$100-150 |

**Безкоштовний рівень**: включено 5 ГБ/місяць

---

## Перевірка знань

### 1. Базова інтеграція ✓

Перевірте свої знання:

- [ ] **П1**: Як AZD створює Application Insights?
  - **В**: Автоматично через шаблони Bicep у `infra/core/monitoring.bicep`

- [ ] **П2**: Яка змінна середовища активує Application Insights?
  - **В**: `APPLICATIONINSIGHTS_CONNECTION_STRING`

- [ ] **П3**: Які три головні типи телеметрії?
  - **В**: Запити (HTTP-виклики), Залежності (зовнішні виклики), Виключення (помилки)

**Перевірка на практиці:**
```bash
# Перевірте, чи налаштовано Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Переконайтеся, що телеметрія надходить
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "requests/count"
```

---

### 2. Кастомна телеметрія ✓

Перевірте свої знання:

- [ ] **П1**: Як відслідковувати кастомні бізнес-події?
  - **В**: Використовуйте логер з `custom_dimensions` або `TelemetryClient.track_event()`

- [ ] **П2**: В чому різниця між подіями і метриками?
  - **В**: Події — дискретні випадки, метрики — числові вимірювання

- [ ] **П3**: Як корелювати телеметрію між сервісами?
  - **В**: Application Insights автоматично використовує `operation_Id` для кореляції

**Перевірка на практиці:**
```kusto
// Verify custom events
traces
| where customDimensions.event_name != ""
| summarize count() by tostring(customDimensions.event_name)
```

---

### 3. Виробничий моніторинг ✓

Перевірте свої знання:

- [ ] **П1**: Що таке вибірка і для чого її використовують?
  - **В**: Вибірка зменшує обсяг даних (і витрати), фіксуючи лише частину телеметрії

- [ ] **П2**: Як налаштувати оповіщення?
  - **В**: Використовуйте оповіщення за метриками в Bicep або Azure Portal на основі метрик Application Insights

- [ ] **П3**: В чому різниця між Log Analytics та Application Insights?
  - **В**: Application Insights зберігає дані в Log Analytics, а App Insights надає специфічні для застосунку подання

**Перевірка на практиці:**
```bash
# Перевірте конфігурацію вибірки
az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "properties.SamplingPercentage"
```

---

## Найкращі практики

### ✅ РОБИТИ:

1. **Використовуйте correlation IDs**
   ```python
   logger.info('Processing order', extra={
       'custom_dimensions': {
           'order_id': order_id,
           'user_id': user_id
       }
   })
   ```

2. **Налаштовуйте оповіщення за критичними метриками**
   ```bicep
   // Error rate, slow responses, availability
   ```

3. **Використовуйте структуроване логування**
   ```python
   # ✅ ДОБРЕ: Структуровано
   logger.info('User signup', extra={'custom_dimensions': {'user_id': 123}})
   
   # ❌ ПОГАНЕ: Неструктуровано
   logger.info(f'User 123 signed up')
   ```

4. **Моніторте залежності**
   ```python
   # Автоматично відстежувати виклики бази даних, HTTP-запити тощо.
   ```

5. **Використовуйте Live Metrics під час розгортання**

### ❌ НЕ РОБИТИ:

1. **Не логувати чутливі дані**
   ```python
   # ❌ ПОГАНО
   logger.info(f'Login: {username}:{password}')
   
   # ✅ ДОБРЕ
   logger.info('Login attempt', extra={'custom_dimensions': {'username': username}})
   ```

2. **Не використовувати 100% вибірку в продакшені**
   ```python
   # ❌ Дорого
   sampler = ProbabilitySampler(rate=1.0)
   
   # ✅ Економічно вигідно
   sampler = ProbabilitySampler(rate=0.1)
   ```

3. **Не ігноруйте черги відмов**

4. **Не забувайте встановлювати ліміти збереження даних**

---

## Усунення несправностей

### Проблема: Телеметрія не зʼявляється

**Діагностика:**
```bash
# Перевірте, чи встановлено рядок підключення
azd env get-values | grep APPLICATIONINSIGHTS

# Перевірте журнали програми через Azure Monitor
azd monitor --logs

# Або використовуйте Azure CLI для Container Apps:
az containerapp logs show --name $APP_NAME --resource-group $RG_NAME --tail 50
```

**Рішення:**
```bash
# Перевірте рядок підключення в Container App
az containerapp show \
  --name $APP_NAME \
  --resource-group $RG_NAME \
  --query "properties.template.containers[0].env" \
  | grep -i applicationinsights
```

---

### Проблема: Високі витрати

**Діагностика:**
```bash
# Перевірте отримання даних
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "availabilityResults/count"
```

**Рішення:**
- Зменшити частоту вибірки
- Скоротити період збереження даних
- Видалити детальне логування

---

## Дізнатись більше

### Офіційна документація
- [Огляд Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Application Insights для Python](https://learn.microsoft.com/azure/azure-monitor/app/opencensus-python)
- [Мова запитів Kusto](https://learn.microsoft.com/azure/data-explorer/kusto/query/)
- [Моніторинг AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/monitor-your-app)

### Наступні кроки в цьому курсі
- ← Попередній: [Перевірки перед запуском](preflight-checks.md)
- → Наступний: [Посібник з розгортання](../chapter-04-infrastructure/deployment-guide.md)
- 🏠 [Головна сторінка курсу](../../README.md)

### Пов’язані приклади
- [Приклад Microsoft Foundry Models](../../../../examples/azure-openai-chat) - AI телеметрія
- [Приклад мікросервісів](../../../../examples/microservices) - Розподілене трасування

---

## Резюме

**Ви навчилися:**
- ✅ Автоматичному створенню Application Insights за допомогою AZD
- ✅ Кастомній телеметрії (події, метрики, залежності)
- ✅ Розподіленому трасуванню між мікросервісами
- ✅ Живим метрикам і моніторингу в реальному часі
- ✅ Оповіщенням і панелям
- ✅ Моніторингу AI/LLM-застосунків
- ✅ Стратегіям оптимізації витрат

**Головні висновки:**
1. **AZD забезпечує автоматичний моніторинг** - Без ручного налаштування  
2. **Використовуйте структуроване логування** - Полегшує запити  
3. **Відстежуйте бізнес-події** - Не лише технічні метрики  
4. **Моніторинг витрат на ШІ** - Відстежуйте токени та витрати  
5. **Налаштуйте сповіщення** - Будьте проактивними, а не реактивними  
6. **Оптимізуйте витрати** - Використовуйте вибірку та обмеження зберігання  

**Наступні кроки:**  
1. Завершіть практичні вправи  
2. Додайте Application Insights до ваших проектів AZD  
3. Створіть власні панелі для вашої команди  
4. Вивчіть [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу автоматичного перекладу на основі ШІ [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли в результаті використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->