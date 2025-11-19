<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e5aa37cdb6378c09099500ac31600b8c",
  "translation_date": "2025-11-19T21:50:13+00:00",
  "source_file": "docs/pre-deployment/application-insights.md",
  "language_code": "es"
}
-->
# Integración de Application Insights con AZD

⏱️ **Tiempo Estimado**: 40-50 minutos | 💰 **Impacto en Costos**: ~$5-15/mes | ⭐ **Complejidad**: Intermedia

**📚 Ruta de Aprendizaje:**
- ← Anterior: [Verificaciones Preliminares](preflight-checks.md) - Validación previa al despliegue
- 🎯 **Estás Aquí**: Integración de Application Insights (Monitoreo, telemetría, depuración)
- → Siguiente: [Guía de Despliegue](../deployment/deployment-guide.md) - Desplegar en Azure
- 🏠 [Inicio del Curso](../../README.md)

---

## Lo que Aprenderás

Al completar esta lección, podrás:
- Integrar **Application Insights** automáticamente en proyectos AZD
- Configurar **trazabilidad distribuida** para microservicios
- Implementar **telemetría personalizada** (métricas, eventos, dependencias)
- Configurar **métricas en vivo** para monitoreo en tiempo real
- Crear **alertas y paneles** desde despliegues AZD
- Depurar problemas en producción con **consultas de telemetría**
- Optimizar **costos y estrategias de muestreo**
- Monitorear aplicaciones de **IA/LLM** (tokens, latencia, costos)

## Por qué Importa Application Insights con AZD

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
✅ AZD provisions everything automatically
```

**Analogía**: Application Insights es como tener una "caja negra" de grabación de vuelo + tablero de control para tu aplicación. Puedes ver todo lo que está ocurriendo en tiempo real y reproducir cualquier incidente.

---

## Resumen de la Arquitectura

### Application Insights en la Arquitectura de AZD

```mermaid
graph TB
    User[Usuario/Cliente]
    App1[Aplicación Contenedor 1<br/>API Gateway]
    App2[Aplicación Contenedor 2<br/>Servicio de Productos]
    App3[Aplicación Contenedor 3<br/>Servicio de Pedidos]
    
    AppInsights[Application Insights<br/>Centro de Telemetría]
    LogAnalytics[(Log Analytics<br/>Espacio de Trabajo)]
    
    Portal[Portal de Azure<br/>Tableros y Alertas]
    Query[Consultas Kusto<br/>Análisis Personalizado]
    
    User --> App1
    App1 --> App2
    App2 --> App3
    
    App1 -.->|Auto-instrumentación| AppInsights
    App2 -.->|Auto-instrumentación| AppInsights
    App3 -.->|Auto-instrumentación| AppInsights
    
    AppInsights --> LogAnalytics
    LogAnalytics --> Portal
    LogAnalytics --> Query
    
    style AppInsights fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
    style LogAnalytics fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
```
### Qué se Monitorea Automáticamente

| Tipo de Telemetría | Qué Captura | Caso de Uso |
|--------------------|-------------|-------------|
| **Solicitudes** | Solicitudes HTTP, códigos de estado, duración | Monitoreo de rendimiento de API |
| **Dependencias** | Llamadas externas (BD, APIs, almacenamiento) | Identificar cuellos de botella |
| **Excepciones** | Errores no manejados con trazas de pila | Depuración de fallos |
| **Eventos Personalizados** | Eventos de negocio (registro, compra) | Análisis y embudos |
| **Métricas** | Contadores de rendimiento, métricas personalizadas | Planificación de capacidad |
| **Trazas** | Mensajes de registro con severidad | Depuración y auditoría |
| **Disponibilidad** | Pruebas de tiempo de actividad y respuesta | Monitoreo de SLA |

---

## Requisitos Previos

### Herramientas Necesarias

```bash
# Verificar Azure Developer CLI
azd version
# ✅ Esperado: azd versión 1.0.0 o superior

# Verificar Azure CLI
az --version
# ✅ Esperado: azure-cli 2.50.0 o superior
```

### Requisitos de Azure

- Suscripción activa de Azure
- Permisos para crear:
  - Recursos de Application Insights
  - Espacios de trabajo de Log Analytics
  - Aplicaciones en contenedores
  - Grupos de recursos

### Conocimientos Previos

Debes haber completado:
- [Conceptos Básicos de AZD](../getting-started/azd-basics.md) - Conceptos principales de AZD
- [Configuración](../getting-started/configuration.md) - Configuración del entorno
- [Primer Proyecto](../getting-started/first-project.md) - Despliegue básico

---

## Lección 1: Application Insights Automático con AZD

### Cómo AZD Proporciona Application Insights

AZD crea y configura automáticamente Application Insights cuando despliegas. Veamos cómo funciona.

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

# AZD automatically provisions monitoring!
```

**¡Eso es todo!** AZD creará Application Insights por defecto. No se necesita configuración adicional para monitoreo básico.

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
```

---

### Paso 3: Conectar la Aplicación en Contenedor a Application Insights

**Archivo: `infra/app/api.bicep`**

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

### Paso 4: Código de la Aplicación con Telemetría

**Archivo: `src/app.py`**

```python
from flask import Flask, request, jsonify
from opencensus.ext.azure.log_exporter import AzureLogHandler
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.ext.flask.flask_middleware import FlaskMiddleware
from opencensus.trace.samplers import ProbabilitySampler
import logging
import os

app = Flask(__name__)

# Obtener la cadena de conexión de Application Insights
connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

if connection_string:
    # Configurar el rastreo distribuido
    middleware = FlaskMiddleware(
        app,
        exporter=AzureExporter(connection_string=connection_string),
        sampler=ProbabilitySampler(rate=1.0)  # Muestreo al 100% para desarrollo
    )
    
    # Configurar el registro
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
    
    # Simular llamada a la base de datos (seguida automáticamente como dependencia)
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
    time.sleep(3)  # Simular operación lenta
    logger.warning('Endpoint took 3 seconds to respond')
    return jsonify({'message': 'Slow operation completed'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
```

**Archivo: `src/requirements.txt`**

```txt
Flask==3.0.0
opencensus-ext-azure==1.1.13
opencensus-ext-flask==0.8.1
gunicorn==21.2.0
```

---

### Paso 5: Desplegar y Verificar

```bash
# Inicializar AZD
azd init

# Desplegar (provisiona Application Insights automáticamente)
azd up

# Obtener URL de la aplicación
APP_URL=$(azd env get-values | grep API_URL | cut -d '=' -f2 | tr -d '"')

# Generar telemetría
curl $APP_URL/health
curl $APP_URL/api/products
curl $APP_URL/api/error-test
curl $APP_URL/api/slow
```

**✅ Resultado esperado:**
```json
{
  "status": "healthy",
  "monitoring": "enabled"
}
```

---

### Paso 6: Ver Telemetría en el Portal de Azure

```bash
# Obtener detalles de Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Abrir en el Portal de Azure
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"') \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"') \
  --query "appId" -o tsv
```

**Navega al Portal de Azure → Application Insights → Búsqueda de Transacciones**

Deberías ver:
- ✅ Solicitudes HTTP con códigos de estado
- ✅ Duración de solicitudes (3+ segundos para `/api/slow`)
- ✅ Detalles de excepciones de `/api/error-test`
- ✅ Mensajes de registro personalizados

---

## Lección 2: Telemetría y Eventos Personalizados

### Rastrear Eventos de Negocio

Agreguemos telemetría personalizada para eventos críticos de negocio.

**Archivo: `src/telemetry.py`**

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
        
        # Configurar el registrador
        self.logger = logging.getLogger(__name__)
        self.logger.addHandler(AzureLogHandler(connection_string=self.connection_string))
        self.logger.setLevel(logging.INFO)
        
        # Configurar el exportador de métricas
        self.stats = stats_module.stats
        self.view_manager = self.stats.view_manager
        self.stats_recorder = self.stats.stats_recorder
        
        exporter = metrics_exporter.new_metrics_exporter(
            connection_string=self.connection_string
        )
        self.view_manager.register_exporter(exporter)
        
        # Configurar el rastreador
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

# Cliente de telemetría global
telemetry = TelemetryClient()
```

### Actualizar la Aplicación con Eventos Personalizados

**Archivo: `src/app.py` (mejorado)**

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
    
    # Rastrear evento de negocio
    telemetry.track_event('Purchase', {
        'product_id': product_id,
        'quantity': quantity,
        'total_amount': price * quantity,
        'user_id': request.headers.get('X-User-Id', 'anonymous')
    })
    
    # Rastrear métrica de ingresos
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
    
    # Simular búsqueda (sería una consulta real a la base de datos)
    results = [{'id': 1, 'name': f'Result for {query}'}]
    
    duration = (time.time() - start_time) * 1000  # Convertir a ms
    
    # Rastrear evento de búsqueda
    telemetry.track_event('Search', {
        'query': query,
        'results_count': len(results),
        'duration_ms': duration
    })
    
    # Rastrear métrica de rendimiento de búsqueda
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
        # Simular llamada a API externa
        response = requests.get('https://api.example.com/data', timeout=5)
        result = response.json()
    except Exception as e:
        success = False
        result = {'error': str(e)}
    
    duration = (time.time() - start_time) * 1000
    
    # Rastrear dependencia
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

### Probar Telemetría Personalizada

```bash
# Rastrear evento de compra
curl -X POST $APP_URL/api/purchase \
  -H "Content-Type: application/json" \
  -H "X-User-Id: user123" \
  -d '{"product_id": 1, "quantity": 2, "price": 29.99}'

# Rastrear evento de búsqueda
curl "$APP_URL/api/search?q=laptop"

# Rastrear dependencia externa
curl $APP_URL/api/external-call
```

**Ver en el Portal de Azure:**

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

## Lección 3: Trazabilidad Distribuida para Microservicios

### Habilitar Trazabilidad entre Servicios

Para microservicios, Application Insights correlaciona automáticamente solicitudes entre servicios.

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
    participant Gateway as API Gateway<br/>(ID de rastreo: abc123)
    participant Product as Servicio de Productos<br/>(ID principal: abc123)
    participant Order as Servicio de Pedidos<br/>(ID principal: abc123)
    participant AppInsights as Application Insights
    
    User->>Gateway: POST /api/checkout
    Note over Gateway: Iniciar rastreo: abc123
    Gateway->>AppInsights: Registrar solicitud (ID de rastreo: abc123)
    
    Gateway->>Product: GET /products/123
    Note over Product: ID principal: abc123
    Product->>AppInsights: Registrar llamada de dependencia
    Product-->>Gateway: Detalles del producto
    
    Gateway->>Order: POST /orders
    Note over Order: ID principal: abc123
    Order->>AppInsights: Registrar llamada de dependencia
    Order-->>Gateway: Pedido creado
    
    Gateway-->>User: Pago completado
    Gateway->>AppInsights: Registrar respuesta (Duración: 450ms)
    
    Note over AppInsights: Correlación por ID de rastreo
```
**Consulta de trazabilidad de extremo a extremo:**

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

## Lección 4: Métricas en Vivo y Monitoreo en Tiempo Real

### Habilitar Stream de Métricas en Vivo

Live Metrics proporciona telemetría en tiempo real con latencia <1 segundo.

**Acceder a Métricas en Vivo:**

```bash
# Obtener el recurso de Application Insights
APPI_NAME=$(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"')

# Obtener el grupo de recursos
RG_NAME=$(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"')

echo "Navigate to: Azure Portal → Resource Groups → $RG_NAME → $APPI_NAME → Live Metrics"
```

**Lo que ves en tiempo real:**
- ✅ Tasa de solicitudes entrantes (solicitudes/segundo)
- ✅ Llamadas de dependencias salientes
- ✅ Conteo de excepciones
- ✅ Uso de CPU y memoria
- ✅ Conteo de servidores activos
- ✅ Telemetría de muestra

### Generar Carga para Pruebas

```bash
# Generar carga para ver métricas en vivo
for i in {1..100}; do
  curl $APP_URL/api/products &
  curl $APP_URL/api/search?q=test$i &
done

# Ver métricas en vivo en el Portal de Azure
# Deberías ver un pico en la tasa de solicitudes
```

---

## Ejercicios Prácticos

### Ejercicio 1: Configurar Alertas ⭐⭐ (Intermedio)

**Objetivo**: Crear alertas para tasas altas de errores y respuestas lentas.

**Pasos:**

1. **Crear alerta para tasa de errores:**

```bash
# Obtener el ID de recurso de Application Insights
APPI_ID=$(az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "id" -o tsv)

# Crear alerta de métricas para solicitudes fallidas
az monitor metrics alert create \
  --name "High-Error-Rate" \
  --resource-group $RG_NAME \
  --scopes $APPI_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "Alert when error rate exceeds 10 per 5 minutes"
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
# Generar errores
for i in {1..20}; do
  curl $APP_URL/api/error-test
done

# Generar respuestas lentas
for i in {1..10}; do
  curl $APP_URL/api/slow
done

# Verificar el estado de alerta (esperar 5-10 minutos)
az monitor metrics alert list \
  --resource-group $RG_NAME \
  --query "[].{Name:name, Enabled:enabled, State:properties.enabled}" \
  --output table
```

**✅ Criterios de éxito:**
- ✅ Alertas creadas exitosamente
- ✅ Alertas se activan cuando se exceden los umbrales
- ✅ Se puede ver el historial de alertas en el Portal de Azure
- ✅ Integrado con el despliegue AZD

**Tiempo**: 20-25 minutos

---

### Ejercicio 2: Crear Panel Personalizado ⭐⭐ (Intermedio)

**Objetivo**: Construir un panel que muestre métricas clave de la aplicación.

**Pasos:**

1. **Crear panel vía Portal de Azure:**

Navega a: Portal de Azure → Paneles → Nuevo Panel

2. **Agregar elementos para métricas clave:**

- Conteo de solicitudes (últimas 24 horas)
- Tiempo promedio de respuesta
- Tasa de errores
- Las 5 operaciones más lentas
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

4. **Desplegar panel:**

```bash
# Agregar a main.bicep
module dashboard './core/dashboard.bicep' = {
  name: 'dashboard'
  scope: rg
  params: {
    dashboardName: 'dashboard-${environmentName}'
    applicationInsightsId: monitoring.outputs.applicationInsightsId
    location: location
  }
}

# Desplegar
azd up
```

**✅ Criterios de éxito:**
- ✅ El panel muestra métricas clave
- ✅ Se puede fijar en la página principal del Portal de Azure
- ✅ Se actualiza en tiempo real
- ✅ Desplegable vía AZD

**Tiempo**: 25-30 minutos

---

### Ejercicio 3: Monitorear Aplicación de IA/LLM ⭐⭐⭐ (Avanzado)

**Objetivo**: Rastrear uso de Azure OpenAI (tokens, costos, latencia).

**Pasos:**

1. **Crear envoltorio de monitoreo para IA:**

**Archivo: `src/ai_telemetry.py`**

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
            # Llamar a Azure OpenAI
            response = self.client.chat.completions.create(
                model=model,
                messages=messages,
                **kwargs
            )
            
            duration = (time.time() - start_time) * 1000  # ms
            
            # Extraer uso
            usage = response.usage
            prompt_tokens = usage.prompt_tokens
            completion_tokens = usage.completion_tokens
            total_tokens = usage.total_tokens
            
            # Calcular costo (precios de GPT-4)
            prompt_cost = (prompt_tokens / 1000) * 0.03  # $0.03 por 1K tokens
            completion_cost = (completion_tokens / 1000) * 0.06  # $0.06 por 1K tokens
            total_cost = prompt_cost + completion_cost
            
            # Rastrear evento personalizado
            telemetry.track_event('OpenAI_Request', {
                'model': model,
                'prompt_tokens': prompt_tokens,
                'completion_tokens': completion_tokens,
                'total_tokens': total_tokens,
                'duration_ms': duration,
                'cost_usd': total_cost,
                'success': True
            })
            
            # Rastrear métricas
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

# Inicializar cliente de OpenAI monitoreado
openai_client = MonitoredAzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

@app.route('/api/chat', methods=['POST'])
def chat():
    data = request.json
    user_message = data.get('message')
    
    # Llamar con monitoreo automático
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

3. **Consultar métricas de IA:**

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

**✅ Criterios de éxito:**
- ✅ Cada llamada a OpenAI rastreada automáticamente
- ✅ Uso de tokens y costos visibles
- ✅ Latencia monitoreada
- ✅ Se pueden configurar alertas de presupuesto

**Tiempo**: 35-45 minutos

---

## Optimización de Costos

### Estrategias de Muestreo

Controla costos mediante muestreo de telemetría:

```python
from opencensus.trace.samplers import ProbabilitySampler

# Desarrollo: muestreo al 100%
sampler = ProbabilitySampler(rate=1.0)

# Producción: muestreo al 10% (reducir costos en un 90%)
sampler = ProbabilitySampler(rate=0.1)

# Muestreo adaptativo (se ajusta automáticamente)
from opencensus.trace.samplers import AdaptiveSampler
sampler = AdaptiveSampler()
```

**En Bicep:**

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  properties: {
    SamplingPercentage: 10  // 10% sampling
  }
}
```

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

### Estimaciones de Costos Mensuales

| Volumen de Datos | Retención | Costo Mensual |
|------------------|-----------|---------------|
| 1 GB/mes | 30 días | ~$2-5 |
| 5 GB/mes | 30 días | ~$10-15 |
| 10 GB/mes | 90 días | ~$25-40 |
| 50 GB/mes | 90 días | ~$100-150 |

**Nivel gratuito**: 5 GB/mes incluidos

---

## Punto de Verificación de Conocimientos

### 1. Integración Básica ✓

Pon a prueba tu comprensión:

- [ ] **P1**: ¿Cómo proporciona AZD Application Insights?
  - **R**: Automáticamente vía plantillas Bicep en `infra/core/monitoring.bicep`

- [ ] **P2**: ¿Qué variable de entorno habilita Application Insights?
  - **R**: `APPLICATIONINSIGHTS_CONNECTION_STRING`

- [ ] **P3**: ¿Cuáles son los tres tipos principales de telemetría?
  - **R**: Solicitudes (llamadas HTTP), Dependencias (llamadas externas), Excepciones (errores)

**Verificación Práctica:**
```bash
# Verificar si Application Insights está configurado
azd env get-values | grep APPLICATIONINSIGHTS

# Verificar que la telemetría esté fluyendo
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "requests/count"
```

---

### 2. Telemetría Personalizada ✓

Pon a prueba tu comprensión:

- [ ] **P1**: ¿Cómo rastreas eventos de negocio personalizados?
  - **R**: Usa logger con `custom_dimensions` o `TelemetryClient.track_event()`

- [ ] **P2**: ¿Cuál es la diferencia entre eventos y métricas?
  - **R**: Los eventos son ocurrencias discretas, las métricas son mediciones numéricas

- [ ] **P3**: ¿Cómo correlacionas telemetría entre servicios?
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

Pon a prueba tu comprensión:

- [ ] **P1**: ¿Qué es el muestreo y por qué usarlo?
  - **R**: El muestreo reduce el volumen de datos (y costos) capturando solo un porcentaje de telemetría

- [ ] **P2**: ¿Cómo configuras alertas?
  - **R**: Usa alertas de métricas en Bicep o el Portal de Azure basadas en métricas de Application Insights

- [ ] **P3**: ¿Cuál es la diferencia entre Log Analytics y Application Insights?
  - **R**: Application Insights almacena datos en el espacio de trabajo de Log Analytics; App Insights proporciona vistas específicas de la aplicación

**Verificación Práctica:**
```bash
# Verificar la configuración de muestreo
az monitor app-insights component show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --query "properties.SamplingPercentage"
```

---

## Mejores Prácticas

### ✅ HACER:

1. **Usar IDs de correlación**
   ```python
   logger.info('Processing order', extra={
       'custom_dimensions': {
           'order_id': order_id,
           'user_id': user_id
       }
   })
   ```

2. **Configurar alertas para métricas críticas**
   ```bicep
   // Error rate, slow responses, availability
   ```

3. **Usar registros estructurados**
   ```python
   # ✅ BUENO: Estructurado
   logger.info('User signup', extra={'custom_dimensions': {'user_id': 123}})
   
   # ❌ MALO: No estructurado
   logger.info(f'User 123 signed up')
   ```

4. **Monitorear dependencias**
   ```python
   # Rastrear automáticamente llamadas a la base de datos, solicitudes HTTP, etc.
   ```

5. **Usar Métricas en Vivo durante despliegues**

### ❌ NO HACER:

1. **No registrar datos sensibles**
   ```python
   # ❌ MALO
   logger.info(f'Login: {username}:{password}')
   
   # ✅ BUENO
   logger.info('Login attempt', extra={'custom_dimensions': {'username': username}})
   ```

2. **No usar muestreo al 100% en producción**
   ```python
   # ❌ Caro
   sampler = ProbabilitySampler(rate=1.0)
   
   # ✅ Rentable
   sampler = ProbabilitySampler(rate=0.1)
   ```

3. **No ignorar colas de mensajes fallidos**

4. **No olvidar establecer límites de retención de datos**

---

## Resolución de Problemas

### Problema: No aparece telemetría

**Diagnóstico:**
```bash
# Verificar que la cadena de conexión esté configurada
azd env get-values | grep APPLICATIONINSIGHTS

# Verificar los registros de la aplicación
azd logs api --tail 50
```

**Solución:**
```bash
# Verificar la cadena de conexión en la aplicación de contenedor
az containerapp show \
  --name $APP_NAME \
  --resource-group $RG_NAME \
  --query "properties.template.containers[0].env" \
  | grep -i applicationinsights
```

---

### Problema: Costos elevados

**Diagnóstico:**
```bash
# Verificar la ingesta de datos
az monitor app-insights metrics show \
  --app $APPI_NAME \
  --resource-group $RG_NAME \
  --metric "availabilityResults/count"
```

**Solución:**
- Reducir la tasa de muestreo
- Disminuir el período de retención
- Eliminar registros verbosos

---

## Aprende Más

### Documentación Oficial
- [Resumen de Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Application Insights para Python](https://learn.microsoft.com/azure/azure-monitor/app/opencensus-python)
- [Lenguaje de Consulta Kusto](https://learn.microsoft.com/azure/data-explorer/kusto/query/)
- [Monitoreo con AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/monitor-your-app)

### Próximos Pasos en Este Curso
- ← Anterior: [Verificaciones Preliminares](preflight-checks.md)
- → Siguiente: [Guía de Despliegue](../deployment/deployment-guide.md)
- 🏠 [Inicio del Curso](../../README.md)

### Ejemplos Relacionados
- [Ejemplo de Azure OpenAI](../../../../examples/azure-openai-chat) - Telemetría de IA
- [Ejemplo de Microservicios](../../../../examples/microservices) - Trazabilidad distribuida

---

## Resumen

**Has aprendido:**
- ✅ Provisión automática de Application Insights con AZD
- ✅ Telemetría personalizada (eventos, métricas, dependencias)
- ✅ Trazabilidad distribuida entre microservicios
- ✅ Métricas en vivo y monitoreo en tiempo real
- ✅ Alertas y paneles
- ✅ Monitoreo de aplicaciones AI/LLM
- ✅ Estrategias de optimización de costos

**Puntos clave:**
1. **AZD configura el monitoreo automáticamente** - No requiere configuración manual
2. **Usa registros estructurados** - Facilita las consultas
3. **Rastrea eventos de negocio** - No solo métricas técnicas
4. **Monitorea los costos de AI** - Rastrea tokens y gastos
5. **Configura alertas** - Sé proactivo, no reactivo
6. **Optimiza costos** - Usa muestreo y límites de retención

**Próximos pasos:**
1. Completa los ejercicios prácticos
2. Agrega Application Insights a tus proyectos AZD
3. Crea paneles personalizados para tu equipo
4. Aprende [Guía de Despliegue](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por lograr precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que surjan del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->