# Integración de Application Insights con AZD

⏱️ **Tiempo Estimado**: 40-50 minutos | 💰 **Impacto de Costos**: ~$5-15/mes | ⭐ **Complejidad**: Intermedio

**📚 Ruta de Aprendizaje:**
- ← Anterior: [Chequeos Previos](preflight-checks.md) - Validación antes del despliegue
- 🎯 **Estás Aquí**: Integración de Application Insights (Monitoreo, telemetría, depuración)
- → Siguiente: [Guía de Despliegue](../chapter-04-infrastructure/deployment-guide.md) - Desplegar en Azure
- 🏠 [Inicio del Curso](../../README.md)

---

## Lo que Aprenderás

Al completar esta lección, podrás:
- Declarar **Application Insights** en la infraestructura AZD y configurar la instrumentación SDK
- Configurar **trazabilidad distribuida** para microservicios
- Implementar **telemetría personalizada** (métricas, eventos, dependencias)
- Configurar **métricas en vivo** para monitoreo en tiempo real
- Crear **alertas y paneles** desde despliegues AZD
- Depurar problemas en producción con **consultas de telemetría**
- Optimizar **costos y estrategias de muestreo**
- Monitorear **aplicaciones AI/LLM** (tokens, latencia, costos)

## Por Qué Importa Application Insights con AZD

### El Desafío: Observabilidad en Producción

**Sin Application Insights:**
```
❌ No visibility into production behavior
❌ Manual log aggregation across services
❌ Reactive debugging (wait for customer complaints)
❌ No performance metrics
❌ Cannot trace requests across services
❌ Unknown failure rates and bottlenecks
```

**Con Application Insights + AZD:**
```
✅ Automatic telemetry collection
✅ Centralized logs from all services
✅ Proactive issue detection
✅ End-to-end request tracing
✅ Performance metrics and insights
✅ Real-time dashboards
✅ AZD provisions the monitoring declared in your templates
```

**Analogía**: Application Insights es como tener una "caja negra" de vuelo + panel de control en cabina para tu aplicación. Ves todo lo que ocurre en tiempo real y puedes reproducir cualquier incidente.

---

## Vista General de Arquitectura

### Application Insights en la Arquitectura AZD

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

### Qué Se Monitorea Automáticamente

La auto-instrumentación soportada captura automáticamente solicitudes/dependencias para bibliotecas instrumentadas. Los eventos y métricas personalizados requieren código de aplicación; las pruebas de disponibilidad deben configurarse por separado. No recopila cada fila a continuación sólo porque el recurso exista.

| Tipo de Telemetría | Lo Que Captura | Caso de Uso |
|----------------|------------------|----------|
| **Solicitudes** | Solicitudes HTTP, códigos de estado, duración | Monitoreo de desempeño de API |
| **Dependencias** | Llamadas externas (BD, APIs, almacenamiento) | Identificar cuellos de botella |
| **Excepciones** | Errores no manejados con rastros de pila | Depuración de fallas |
| **Eventos Personalizados** | Eventos de negocio (registro, compra) | Análisis y embudos |
| **Métricas** | Contadores de rendimiento, métricas personalizadas | Planificación de capacidad |
| **Trazas** | Mensajes de registro con severidad | Depuración y auditoría |
| **Disponibilidad** | Pruebas de tiempo activo y respuesta | Monitoreo de SLA |

---

## Prerrequisitos

### Herramientas Requeridas

```bash
# Verify Azure Developer CLI
azd version
# Command reference baseline: azd 1.37.2

# Verify Azure CLI
az --version
# ✅ Expected: azure-cli 2.50.0 or higher
```

### Requisitos de Azure

- Suscripción activa de Azure
- Permisos para crear:
  - Recursos Application Insights
  - Espacios de trabajo Log Analytics
  - Aplicaciones de Contenedor
  - Grupos de recursos

### Conocimientos Previos

Debes haber completado:
- [Conceptos Básicos de AZD](../chapter-01-foundation/azd-basics.md) - Conceptos centrales de AZD
- [Configuración](../chapter-03-configuration/configuration.md) - Configuración del entorno
- [Primer Proyecto](../chapter-01-foundation/first-project.md) - Despliegue básico

---

## Lección 1: Application Insights Automático con AZD

### Cómo AZD Provisión Application Insights

AZD provisión Application Insights **sólo cuando la infraestructura del proyecto lo declara**. `azure.yaml` por sí solo no crea monitoreo ni instrumenta el código de la aplicación.

> **Alcance de ejemplo:** Esta lección contiene fragmentos de integración, no un proyecto completo `monitored-app` en este repositorio. Proporciona una plantilla principal y mapeo de parámetros, un entorno Container Apps, configuración de registro/imagen e identidad, Dockerfile y etiquetas de servicio antes de desplegar. Las lecciones posteriores muestran fragmentos alternos/extensiones, no archivos que puedan pegarse juntos sin cambios. Comienza con un [ejemplo de microservicios](../../../../examples/microservices) funcional si necesitas una base ejecutable.

### Estructura del Proyecto

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

### Paso 1: Configurar AZD (azure.yaml)

**Archivo: `azure.yaml`**

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

Esto declara el servicio desplegable. La siguiente configuración Bicep y SDK provee el monitoreo; azd no los añade implícitamente.

---

### Paso 2: Infraestructura de Monitoreo (Bicep)

**Archivo: `infra/core/monitoring.bicep`**

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

### Paso 3: Conectar la Aplicación de Contenedor a Application Insights

**Archivo: `infra/app/api.bicep`**

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

### Paso 4: Código de Aplicación con Telemetría

**Archivo: `src/app.py`**

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

**Archivo: `src/requirements.txt`**

```txt
Flask
azure-monitor-opentelemetry
gunicorn
requests
openai
```

Resuelve estas dependencias en tu proyecto, pruébalas juntas, y bloquea las versiones resultantes. Los nuevos proyectos deben usar Azure Monitor OpenTelemetry, no los exportadores OpenCensus Python retirados.

---

### Paso 5: Desplegar y Verificar

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

**✅ Salida esperada:**
```json
{
  "status": "healthy",
  "monitoring": "enabled"
}
```

---

### Paso 6: Ver Telemetría en el Portal Azure

```bash
# Get Application Insights details
azd env get-values | grep APPLICATIONINSIGHTS

# Open in Azure Portal
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"') \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"') \
  --query "appId" -o tsv
```

**Navega en el Portal Azure → Application Insights → Búsqueda de Transacciones**

Deberías ver:
- ✅ Solicitudes HTTP con códigos de estado
- ✅ Duración de las solicitudes (3+ segundos para `/api/slow`)
- ✅ Detalles de excepción de `/api/error-test`
- ✅ Mensajes de registro personalizados

---

## Lección 2: Telemetría y Eventos Personalizados

### Rastrear Eventos de Negocio

Añadamos telemetría personalizada para eventos críticos del negocio.

**Archivo: `src/telemetry.py`**

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

### Actualizar Aplicación con Eventos Personalizados

**Archivo: `src/app.py` (mejorado)**

Añade estas rutas a la aplicación Flask existente; mantén las rutas previas de salud/prueba. El bloque abreviado a continuación muestra una app separada para claridad. Ahora la inicialización de telemetría vive en `telemetry.py`—no inicialices exportadores dos veces.

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

### Probar Telemetría Personalizada

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

**Ver en el Portal Azure:**

Navega a Application Insights → Logs, luego ejecuta:

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

## Lección 3: Trazabilidad Distribuida para Microservicios

### Habilitar Trazabilidad Cross-Service

Con instrumentación compatible y propagación W3C trace-context, Application Insights correlaciona solicitudes entre servicios. Compartir sólo una cadena de conexión no establece spans padre-hijo. El fragmento de arquitectura a continuación referencia módulos que debes implementar.

**Archivo: `infra/main.bicep`**

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

### Ver Transacción de Extremo a Extremo

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

**Consulta la traza de extremo a extremo:**

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

## Lección 4: Métricas en Vivo y Monitoreo en Tiempo Real

### Habilitar Transmisión de Métricas en Vivo

Las Métricas en Vivo proveen telemetría casi en tiempo real cuando es soportada y habilitada por el SDK. No es un SLA de latencia. La configuración Python OpenTelemetry anterior opta por `enable_live_metrics=True`.

**Acceder a Métricas en Vivo:**

```bash
# Get Application Insights resource
APPI_NAME=$(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"')

# Get resource group
RG_NAME=$(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"')

echo "Navigate to: Azure Portal → Resource Groups → $RG_NAME → $APPI_NAME → Live Metrics"
```

**Lo que ves en tiempo real:**
- ✅ Tasa de solicitudes entrantes (solicitudes/seg)
- ✅ Llamadas de dependencias salientes
- ✅ Conteo de excepciones
- ✅ Uso de CPU y memoria
- ✅ Conteo de servidores activos
- ✅ Telemetría de muestra

### Generar Carga para Pruebas

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

## Ejercicios Prácticos

### Ejercicio 1: Configurar Alertas ⭐⭐ (Medio)

**Objetivo**: Crear alertas para altas tasas de error y respuestas lentas.

**Pasos:**

1. **Crear alerta para tasa de error:**

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

2. **Crear alerta para respuestas lentas:**

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

3. **Crear alerta vía Bicep (preferido para AZD):**

**Archivo: `infra/core/alerts.bicep`**

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

4. **Probar alertas:**

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

**✅ Criterios de Éxito:**
- ✅ Alertas creadas exitosamente
- ✅ Alertas se activan cuando se exceden los umbrales
- ✅ Se puede ver el historial de alertas en el Portal Azure
- ✅ Integrado con el despliegue AZD

**Tiempo**: 20-25 minutos

---

### Ejercicio 2: Crear Panel Personalizado ⭐⭐ (Medio)

**Objetivo**: Construir un panel mostrando métricas clave de la aplicación.

**Pasos:**

1. **Crear panel vía Portal Azure:**

Navega a: Portal Azure → Paneles → Nuevo Panel

2. **Agregar mosaicos para métricas clave:**

- Conteo de solicitudes (últimas 24 horas)
- Tiempo de respuesta promedio
- Tasa de error
- Top 5 operaciones más lentas
- Distribución geográfica de usuarios

3. **Crear panel vía Bicep:**

**Archivo: `infra/core/dashboard.bicep`**

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

4. **Desplegar panel:**

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

**✅ Criterios de Éxito:**
- ✅ El panel muestra métricas clave
- ✅ Se puede fijar en la página principal del Portal Azure
- ✅ Se actualiza en tiempo real
- ✅ Desplegable vía AZD

**Tiempo**: 25-30 minutos

---

### Ejercicio 3: Monitorizar Aplicación AI/LLM ⭐⭐⭐ (Avanzado)

**Objetivo**: Rastrear uso de Modelos Foundry de Microsoft (tokens, costos, latencia).

**Pasos:**

1. **Crear wrapper de monitoreo AI:**

**Archivo: `src/ai_telemetry.py`**

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

2. **Usar cliente monitoreado:**

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

3. **Consultar métricas AI:**

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

**✅ Criterios de Éxito:**
- ✅ Cada llamada OpenAI es rastreada automáticamente
- ✅ Uso y costos de tokens visibles
- ✅ Latencia monitoreada
- ✅ Se pueden establecer alertas de presupuesto

**Tiempo**: 35-45 minutos

---

## Optimización de Costos

### Estrategias de Muestreo

Controla costos muestreando la telemetría:

```python
import os

# Configure before the one configure_azure_monitor() call in your process.
os.environ["OTEL_TRACES_SAMPLER"] = "microsoft.fixed_percentage"
os.environ["OTEL_TRACES_SAMPLER_ARG"] = "0.1" # 10% trace sampling
```

El muestreo de trazas no reduce cada categoría de telemetría en un 90%. Las métricas y logs emitidos independientemente necesitan sus propios controles de volumen. Elige la tasa según las necesidades de observabilidad, no una prohibición total en producción.

Configura el muestreo explícitamente en el SDK; la propiedad `SamplingPercentage` del componente no sustituye configurar el muestreador Python OpenTelemetry.

### Retención de Datos

```bicep
resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: logAnalyticsName
  properties: {
    retentionInDays: 30  // Minimum (cheapest)
    // Options: 30, 31, 60, 90, 120, 180, 270, 365, 550, 730
  }
}
```

### Estimaciones Mensuales de Costos

| Volumen de Datos | Retención | Costo Mensual |
|-------------|-----------|--------------|
| 1 GB/mes | 30 días | ~$2-5 |
| 5 GB/mes | 30 días | ~$10-15 |
| 10 GB/mes | 90 días | ~$25-40 |
| 50 GB/mes | 90 días | ~$100-150 |

Estas cifras son ilustrativas, no cotizaciones. Verifica precios de ingestión, retención, alertas y pruebas en tu región y acuerdo; las cuotas gratuitas se comparten/definen según precios de Azure Monitor, no como SKU gratuita garantizada por recurso Application Insights.

---

## Punto de Control de Conocimiento

### 1. Integración Básica ✓

Evalúa tu entendimiento:

- [ ] **P1**: ¿Cómo provisiona AZD Application Insights?
  - **R**: Despliega los recursos de monitoreo explícitamente declarados en las plantillas Bicep/Terraform del proyecto.

- [ ] **P2**: ¿Qué variable de entorno habilita Application Insights?
  - **R**: `APPLICATIONINSIGHTS_CONNECTION_STRING`

- [ ] **P3**: ¿Cuáles son los tres principales tipos de telemetría?
  - **R**: Solicitudes (llamadas HTTP), Dependencias (llamadas externas), Excepciones (errores)

**Verificación Práctica:**
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

### 2. Telemetría Personalizada ✓

Evalúa tu entendimiento:

- [ ] **P1**: ¿Cómo se rastrean eventos de negocio personalizados?
  - **R**: El wrapper de esta lección escribe logs OTel estructurados con atributos `event_name`, consultables en `traces`; estos no son `customEvents` automáticamente.

- [ ] **P2**: ¿Cuál es la diferencia entre eventos y métricas?
  - **R**: Los eventos son ocurrencias discretas, las métricas son mediciones numéricas

- [ ] **P3**: ¿Cómo se correlaciona telemetría entre servicios?
  - **R**: Application Insights usa automáticamente `operation_Id` para correlación

**Verificación Práctica:**
```kusto
// Verify custom events
traces
| where customDimensions.event_name != ""
| summarize count() by tostring(customDimensions.event_name)
```

---

### 3. Monitoreo en Producción ✓

Evalúa tu entendimiento:

- [ ] **P1**: ¿Qué es el muestreo y por qué usarlo?
  - **R**: El muestreo reduce el volumen de datos (y costo) capturando sólo un porcentaje de la telemetría

- [ ] **P2**: ¿Cómo configuras alertas?
  - **R**: Usa alertas de métricas en Bicep o Portal Azure basadas en métricas de Application Insights

- [ ] **P3**: ¿Cuál es la diferencia entre Log Analytics y Application Insights?
  - **R**: Application Insights almacena datos en espacio de trabajo Log Analytics; App Insights provee vistas específicas de aplicación

**Verificación Práctica:**
```bash
# Check the sampler configured for the running application, not only the ARM component.
az containerapp show --name "$APP_NAME" --resource-group "$RG_NAME" \
  --query "properties.template.containers[].env[?starts_with(name, 'OTEL_TRACES_SAMPLER')]"
```

---

## Mejores Prácticas

### ✅ HAZ:

1. **Usa IDs de correlación**
   ```python
   logger.info('Processing order', extra={
           'order_id': order_id,
           'user_id': user_id
   })
   ```

2. **Configura alertas para métricas críticas**
   ```bicep
   // Error rate, slow responses, availability
   ```

3. **Usa logging estructurado**
   ```python
   # ✅ GOOD: Structured
   logger.info('User signup', extra={'user_id': 'pseudonymous-id'})
   
   # ❌ BAD: Unstructured
   logger.info(f'User 123 signed up')
   ```

4. **Monitorea dependencias**
   ```python
   # Automatically track database calls, HTTP requests, etc.
   ```

5. **Usa Métricas en Vivo durante despliegues**

### ❌ NO HAGAS:

1. **No registres datos sensibles**
   ```python
   # ❌ BAD
   logger.info(f'Login: {username}:{password}')
   
   # ✅ GOOD
   logger.info('Login attempt', extra={'result': 'failed'})
   ```

2. **No elijas muestreo sin medir el volumen y las necesidades de diagnóstico**
   ```python
   # ❌ Expensive
   # 100% traces may be appropriate for a small workload or investigation.
   
   # ✅ Cost-effective
   # A lower trace rate reduces visibility; validate coverage before enabling.
   ```

3. **No ignores las colas de letras muertas**

4. **No olvides establecer límites de retención de datos**

---

## Solución de problemas

### Problema: No aparece ninguna telemetría

**Diagnóstico:**
```bash
# Check connection string is set
azd env get-values | grep APPLICATIONINSIGHTS

# Check application logs via Azure Monitor
azd monitor --logs

# Or use Azure CLI for Container Apps:
az containerapp logs show --name $APP_NAME --resource-group $RG_NAME --tail 50
```

**Solución:**
```bash
# Verify connection string in Container App
az containerapp show \
  --name $APP_NAME \
  --resource-group $RG_NAME \
  --query "properties.template.containers[0].env" \
  | grep -i applicationinsights
```

---

### Problema: Costos altos

**Diagnóstico:**
```bash
# Query ingestion volume in the linked Log Analytics workspace.
# WORKSPACE_ID is the workspace customer ID (GUID), not its ARM resource ID.
az monitor log-analytics query --workspace "$WORKSPACE_ID" \
  --analytics-query "Usage | where TimeGenerated > ago(30d) | where IsBillable == true | summarize IngestedMB=sum(Quantity) by DataType"
```

**Solución:**
- Reduce la tasa de muestreo
- Disminuye el periodo de retención
- Elimina el registro detallado

---

## Aprende más

### Documentación oficial
- [Resumen de Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Configuración de Azure Monitor OpenTelemetry](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python)
- [Lenguaje de consulta Kusto](https://learn.microsoft.com/azure/data-explorer/kusto/query/)
- [Monitoreo AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/monitor-your-app)

### Próximos pasos en este curso
- ← Anterior: [Verificaciones previas](preflight-checks.md)
- → Siguiente: [Guía de implementación](../chapter-04-infrastructure/deployment-guide.md)
- 🏠 [Inicio del curso](../../README.md)

### Ejemplos relacionados
- [Ejemplo de modelos Microsoft Foundry](../../../../examples/azure-openai-chat) - Telemetría AI
- [Ejemplo de microservicios](../../../../examples/microservices) - Trazado distribuido

---

## Resumen

**Has aprendido:**
- ✅ Provisión automática de Application Insights con AZD
- ✅ Telemetría personalizada (eventos, métricas, dependencias)
- ✅ Trazado distribuido a través de microservicios
- ✅ Métricas en vivo y monitoreo en tiempo real
- ✅ Alertas y paneles de control
- ✅ Monitoreo de aplicaciones AI/LLM
- ✅ Estrategias de optimización de costos

**Puntos clave:**
1. **Declara el monitoreo explícitamente** - AZD implementa tus plantillas; la instrumentación SDK envía telemetría
2. **Usa registro estructurado** - Facilita las consultas
3. **Rastrea eventos de negocio** - No solo métricas técnicas
4. **Monitorea costos de AI** - Rastrea tokens y gastos
5. **Configura alertas** - Sé proactivo, no reactivo
6. **Optimiza costos** - Usa muestreo y límites de retención

**Próximos pasos:**
1. Completa los ejercicios prácticos
2. Añade Application Insights a tus proyectos AZD
3. Crea paneles de control personalizados para tu equipo
4. Aprende [Guía de implementación](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->