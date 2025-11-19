<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22ea3f5148517a6012d3e2771584ef87",
  "translation_date": "2025-11-19T20:56:07+00:00",
  "source_file": "examples/container-app/microservices/README.md",
  "language_code": "es"
}
-->
# Arquitectura de Microservicios - Ejemplo de Aplicación en Contenedores

⏱️ **Tiempo Estimado**: 25-35 minutos | 💰 **Costo Estimado**: ~$50-100/mes | ⭐ **Complejidad**: Avanzada

Una arquitectura de microservicios **simplificada pero funcional** desplegada en Azure Container Apps utilizando AZD CLI. Este ejemplo demuestra comunicación entre servicios, orquestación de contenedores y monitoreo con una configuración práctica de 2 servicios.

> **📚 Enfoque de Aprendizaje**: Este ejemplo comienza con una arquitectura mínima de 2 servicios (API Gateway + Servicio Backend) que puedes desplegar y aprender. Después de dominar esta base, proporcionamos orientación para expandir a un ecosistema completo de microservicios.

## Lo que Aprenderás

Al completar este ejemplo, aprenderás a:
- Desplegar múltiples contenedores en Azure Container Apps
- Implementar comunicación entre servicios con redes internas
- Configurar escalado basado en el entorno y verificaciones de salud
- Monitorear aplicaciones distribuidas con Application Insights
- Comprender patrones de despliegue de microservicios y mejores prácticas
- Aprender expansión progresiva de arquitecturas simples a complejas

## Arquitectura

### Fase 1: Lo que Estamos Construyendo (Incluido en Este Ejemplo)

```
                    ┌─────────────────────────────┐
                    │         Internet            │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTPS
                                   │
                    ┌──────────────▼──────────────┐
                    │      API Gateway            │
                    │   (Node.js Container)       │
                    │   - Routes requests         │
                    │   - Health checks           │
                    │   - Request logging         │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTP (internal)
                                   │
                    ┌──────────────▼──────────────┐
                    │    Product Service          │
                    │   (Python Container)        │
                    │   - Product CRUD            │
                    │   - In-memory data store    │
                    │   - REST API                │
                    └──────────────┬──────────────┘
                                   │
                    ┌──────────────▼──────────────┐
                    │   Application Insights      │
                    │   (Monitoring & Logs)       │
                    └─────────────────────────────┘
```

**¿Por qué Empezar Simple?**
- ✅ Desplegar y entender rápidamente (25-35 minutos)
- ✅ Aprender patrones básicos de microservicios sin complejidad
- ✅ Código funcional que puedes modificar y experimentar
- ✅ Menor costo para aprender (~$50-100/mes vs $300-1400/mes)
- ✅ Construir confianza antes de agregar bases de datos y colas de mensajes

**Analogía**: Piensa en esto como aprender a conducir. Comienzas en un estacionamiento vacío (2 servicios), dominas lo básico y luego progresas al tráfico de la ciudad (5+ servicios con bases de datos).

### Fase 2: Expansión Futura (Arquitectura de Referencia)

Una vez que domines la arquitectura de 2 servicios, puedes expandirla a:

```
Full Architecture (Not Included - For Reference)
├── API Gateway (✅ Included)
├── Product Service (✅ Included)
├── Order Service (🔜 Add next)
├── User Service (🔜 Add next)
├── Notification Service (🔜 Add last)
├── Azure Service Bus (🔜 For async communication)
├── Cosmos DB (🔜 For product persistence)
├── Azure SQL (🔜 For order management)
└── Azure Storage (🔜 For file storage)
```

Consulta la sección "Guía de Expansión" al final para instrucciones paso a paso.

## Características Incluidas

✅ **Descubrimiento de Servicios**: Descubrimiento automático basado en DNS entre contenedores  
✅ **Balanceo de Carga**: Balanceo de carga integrado entre réplicas  
✅ **Autoescalado**: Escalado independiente por servicio basado en solicitudes HTTP  
✅ **Monitoreo de Salud**: Verificaciones de liveness y readiness para ambos servicios  
✅ **Registro Distribuido**: Registro centralizado con Application Insights  
✅ **Redes Internas**: Comunicación segura entre servicios  
✅ **Orquestación de Contenedores**: Despliegue y escalado automáticos  
✅ **Actualizaciones Sin Tiempo de Inactividad**: Actualizaciones progresivas con gestión de revisiones  

## Requisitos Previos

### Herramientas Necesarias

Antes de comenzar, verifica que tienes estas herramientas instaladas:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versión 1.0.0 o superior)  
   ```bash
   azd version
   # Salida esperada: versión azd 1.0.0 o superior
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versión 2.50.0 o superior)  
   ```bash
   az --version
   # Salida esperada: azure-cli 2.50.0 o superior
   ```

3. **[Docker](https://www.docker.com/get-started)** (para desarrollo/pruebas locales - opcional)  
   ```bash
   docker --version
   # Salida esperada: versión de Docker 20.10 o superior
   ```

### Requisitos de Azure

- Una **suscripción activa de Azure** ([crear una cuenta gratuita](https://azure.microsoft.com/free/))
- Permisos para crear recursos en tu suscripción
- Rol de **Colaborador** en la suscripción o grupo de recursos

### Conocimientos Previos

Este es un ejemplo de nivel **avanzado**. Deberías tener:
- Completado el [Ejemplo Simple de API Flask](../../../../../examples/container-app/simple-flask-api) 
- Comprensión básica de la arquitectura de microservicios
- Familiaridad con APIs REST y HTTP
- Entendimiento de conceptos de contenedores

**¿Nuevo en Container Apps?** Comienza con el [Ejemplo Simple de API Flask](../../../../../examples/container-app/simple-flask-api) primero para aprender lo básico.

## Inicio Rápido (Paso a Paso)

### Paso 1: Clonar y Navegar

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Verificación de Éxito**: Verifica que ves `azure.yaml`:
```bash
ls
# Esperado: README.md, azure.yaml, infra/, src/
```

### Paso 2: Autenticarse con Azure

```bash
azd auth login
```

Esto abrirá tu navegador para la autenticación en Azure. Inicia sesión con tus credenciales de Azure.

**✓ Verificación de Éxito**: Deberías ver:
```
Logged in to Azure.
```

### Paso 3: Inicializar el Entorno

```bash
azd init
```

**Preguntas que verás**:
- **Nombre del entorno**: Ingresa un nombre corto (por ejemplo, `microservices-dev`)
- **Suscripción de Azure**: Selecciona tu suscripción
- **Ubicación de Azure**: Elige una región (por ejemplo, `eastus`, `westeurope`)

**✓ Verificación de Éxito**: Deberías ver:
```
SUCCESS: New project initialized!
```

### Paso 4: Desplegar Infraestructura y Servicios

```bash
azd up
```

**Qué sucede** (toma 8-12 minutos):
1. Crea el entorno de Container Apps
2. Crea Application Insights para monitoreo
3. Construye el contenedor del API Gateway (Node.js)
4. Construye el contenedor del Servicio de Productos (Python)
5. Despliega ambos contenedores en Azure
6. Configura redes y verificaciones de salud
7. Configura monitoreo y registro

**✓ Verificación de Éxito**: Deberías ver:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Tiempo**: 8-12 minutos

### Paso 5: Probar el Despliegue

```bash
# Obtener el endpoint del gateway
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Probar la salud del API Gateway
curl $GATEWAY_URL/health

# Salida esperada:
# {"status":"saludable","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Probar el servicio de productos a través del gateway**:
```bash
# Listar productos
curl $GATEWAY_URL/api/products

# Salida esperada:
# [
#   {"id":1,"name":"Portátil","price":999.99,"stock":50},
#   {"id":2,"name":"Ratón","price":29.99,"stock":200},
#   {"id":3,"name":"Teclado","price":79.99,"stock":150}
# ]
```

**✓ Verificación de Éxito**: Ambos endpoints devuelven datos JSON sin errores.

---

**🎉 ¡Felicidades!** Has desplegado una arquitectura de microservicios en Azure.

## Estructura del Proyecto

Todos los archivos de implementación están incluidos—este es un ejemplo completo y funcional:

```
microservices/
│
├── README.md                         # This file
├── azure.yaml                        # AZD configuration
├── .gitignore                        # Git ignore patterns
│
├── infra/                           # Infrastructure as Code (Bicep)
│   ├── main.bicep                   # Main orchestration
│   ├── abbreviations.json           # Naming conventions
│   ├── core/                        # Shared infrastructure
│   │   ├── container-apps-environment.bicep  # Container environment + registry
│   │   └── monitor.bicep            # Application Insights + Log Analytics
│   └── app/                         # Service definitions
│       ├── api-gateway.bicep        # API Gateway container app
│       └── product-service.bicep    # Product Service container app
│
└── src/                             # Application source code
    ├── api-gateway/                 # Node.js API Gateway
    │   ├── app.js                   # Express server with routing
    │   ├── package.json             # Node dependencies
    │   └── Dockerfile               # Container definition
    └── product-service/             # Python Product Service
        ├── main.py                  # Flask API with product data
        ├── requirements.txt         # Python dependencies
        └── Dockerfile               # Container definition
```

**Qué Hace Cada Componente:**

**Infraestructura (infra/)**:
- `main.bicep`: Orquesta todos los recursos de Azure y sus dependencias
- `core/container-apps-environment.bicep`: Crea el entorno de Container Apps y Azure Container Registry
- `core/monitor.bicep`: Configura Application Insights para registro distribuido
- `app/*.bicep`: Definiciones individuales de aplicaciones en contenedores con escalado y verificaciones de salud

**API Gateway (src/api-gateway/)**:
- Servicio público que enruta solicitudes a servicios backend
- Implementa registro, manejo de errores y reenvío de solicitudes
- Demuestra comunicación HTTP entre servicios

**Servicio de Productos (src/product-service/)**:
- Servicio interno con catálogo de productos (en memoria para simplicidad)
- API REST con verificaciones de salud
- Ejemplo de patrón de microservicio backend

## Resumen de Servicios

### API Gateway (Node.js/Express)

**Puerto**: 8080  
**Acceso**: Público (ingreso externo)  
**Propósito**: Enruta solicitudes entrantes a los servicios backend apropiados  

**Endpoints**:
- `GET /` - Información del servicio
- `GET /health` - Endpoint de verificación de salud
- `GET /api/products` - Reenvía al servicio de productos (listar todos)
- `GET /api/products/:id` - Reenvía al servicio de productos (obtener por ID)

**Características Clave**:
- Enrutamiento de solicitudes con axios
- Registro centralizado
- Manejo de errores y gestión de tiempos de espera
- Descubrimiento de servicios mediante variables de entorno
- Integración con Application Insights

**Destacado de Código** (`src/api-gateway/app.js`):
```javascript
// Comunicación interna del servicio
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Servicio de Productos (Python/Flask)

**Puerto**: 8000  
**Acceso**: Solo interno (sin ingreso externo)  
**Propósito**: Gestiona el catálogo de productos con datos en memoria  

**Endpoints**:
- `GET /` - Información del servicio
- `GET /health` - Endpoint de verificación de salud
- `GET /products` - Lista todos los productos
- `GET /products/<id>` - Obtiene producto por ID

**Características Clave**:
- API RESTful con Flask
- Almacenamiento de productos en memoria (simple, sin base de datos)
- Monitoreo de salud con probes
- Registro estructurado
- Integración con Application Insights

**Modelo de Datos**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**¿Por qué Solo Interno?**
El servicio de productos no está expuesto públicamente. Todas las solicitudes deben pasar por el API Gateway, que proporciona:
- Seguridad: Punto de acceso controlado
- Flexibilidad: Puede cambiar el backend sin afectar a los clientes
- Monitoreo: Registro centralizado de solicitudes

## Comprendiendo la Comunicación entre Servicios

### Cómo los Servicios se Comunican entre Sí

En este ejemplo, el API Gateway se comunica con el Servicio de Productos utilizando **llamadas HTTP internas**:

```javascript
// Puerta de enlace de API (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Realizar solicitud HTTP interna
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Puntos Clave**:

1. **Descubrimiento Basado en DNS**: Container Apps proporciona automáticamente DNS para servicios internos
   - FQDN del Servicio de Productos: `product-service.internal.<environment>.azurecontainerapps.io`
   - Simplificado como: `http://product-service` (Container Apps lo resuelve)

2. **Sin Exposición Pública**: El Servicio de Productos tiene `external: false` en Bicep
   - Solo accesible dentro del entorno de Container Apps
   - No se puede alcanzar desde internet

3. **Variables de Entorno**: Las URLs de los servicios se inyectan en el momento del despliegue
   - Bicep pasa el FQDN interno al gateway
   - No hay URLs codificadas en el código de la aplicación

**Analogía**: Piensa en esto como oficinas. El API Gateway es la recepción (cara pública), y el Servicio de Productos es una oficina interna (solo accesible desde dentro). Los visitantes deben pasar por recepción para llegar a cualquier oficina.

## Opciones de Despliegue

### Despliegue Completo (Recomendado)

```bash
# Implementar infraestructura y ambos servicios
azd up
```

Esto despliega:
1. Entorno de Container Apps
2. Application Insights
3. Container Registry
4. Contenedor del API Gateway
5. Contenedor del Servicio de Productos

**Tiempo**: 8-12 minutos

### Desplegar Servicio Individual

```bash
# Implementar solo un servicio (después de la configuración inicial de azd)
azd deploy api-gateway

# O implementar el servicio de producto
azd deploy product-service
```

**Caso de Uso**: Cuando has actualizado el código en un servicio y quieres desplegar solo ese servicio.

### Actualizar Configuración

```bash
# Cambiar los parámetros de escalado
azd env set GATEWAY_MAX_REPLICAS 30

# Reimplementar con la nueva configuración
azd up
```

## Configuración

### Configuración de Escalado

Ambos servicios están configurados con autoescalado basado en HTTP en sus archivos Bicep:

**API Gateway**:
- Réplicas mínimas: 2 (siempre al menos 2 para disponibilidad)
- Réplicas máximas: 20
- Disparador de escalado: 50 solicitudes concurrentes por réplica

**Servicio de Productos**:
- Réplicas mínimas: 1 (puede escalar a cero si es necesario)
- Réplicas máximas: 10
- Disparador de escalado: 100 solicitudes concurrentes por réplica

**Personalizar Escalado** (en `infra/app/*.bicep`):
```bicep
scale: {
  minReplicas: 1
  maxReplicas: 10
  rules: [
    {
      name: 'http-scale-rule'
      http: {
        metadata: {
          concurrentRequests: '100'  // Adjust this
        }
      }
    }
  ]
}
```

### Asignación de Recursos

**API Gateway**:
- CPU: 1.0 vCPU
- Memoria: 2 GiB
- Razón: Maneja todo el tráfico externo

**Servicio de Productos**:
- CPU: 0.5 vCPU
- Memoria: 1 GiB
- Razón: Operaciones ligeras en memoria

### Verificaciones de Salud

Ambos servicios incluyen probes de liveness y readiness:

```bicep
probes: [
  {
    type: 'Liveness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 10
    periodSeconds: 30
  }
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 5
    periodSeconds: 10
  }
]
```

**Qué Significa Esto**:
- **Liveness**: Si la verificación de salud falla, Container Apps reinicia el contenedor
- **Readiness**: Si no está listo, Container Apps detiene el enrutamiento de tráfico a esa réplica

## Monitoreo y Observabilidad

### Ver Registros de Servicios

```bash
# Transmitir registros desde API Gateway
azd logs api-gateway --follow

# Ver registros recientes del servicio de productos
azd logs product-service --tail 100

# Ver todos los registros de ambos servicios
azd logs --follow
```

**Salida Esperada**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Consultas en Application Insights

Accede a Application Insights en el Portal de Azure, luego ejecuta estas consultas:

**Encontrar Solicitudes Lentas**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Rastrear Llamadas entre Servicios**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Tasa de Errores por Servicio**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Volumen de Solicitudes a lo Largo del Tiempo**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Acceder al Panel de Monitoreo

```bash
# Obtener detalles de Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Abrir el monitoreo del portal de Azure
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Métricas en Vivo

1. Navega a Application Insights en el Portal de Azure
2. Haz clic en "Live Metrics"
3. Ve solicitudes, fallos y rendimiento en tiempo real
4. Prueba ejecutando: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Ejercicios Prácticos

[Nota: Consulta los ejercicios completos arriba en la sección "Ejercicios Prácticos" para pasos detallados incluyendo verificación de despliegue, modificación de datos, pruebas de autoescalado, manejo de errores y agregar un tercer servicio.]

## Análisis de Costos

### Costos Mensuales Estimados (Para Este Ejemplo de 2 Servicios)

| Recurso | Configuración | Costo Estimado |
|----------|--------------|----------------|
| API Gateway | 2-20 réplicas, 1 vCPU, 2GB RAM | $30-150 |
| Servicio de Productos | 1-10 réplicas, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Nivel básico | $5 |
| Application Insights | 1-2 GB/mes | $5-10 |
| Log Analytics | 1 GB/mes | $3 |
| **Total** | | **$58-243/mes** |

**Desglose de Costos por Uso**:
- **Tráfico ligero** (pruebas/aprendizaje): ~$60/mes
- **Tráfico moderado** (producción pequeña): ~$120/mes
- **Tráfico alto** (periodos ocupados): ~$240/mes

### Consejos para Optimizar Costos

1. **Escalar a Cero para Desarrollo**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Usar Plan de Consumo para Cosmos DB** (cuando lo agregues):
   - Paga solo por lo que usas
   - Sin cargo mínimo

3. **Configurar Muestreo en Application Insights**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Muestrea el 50% de las solicitudes
   ```

4. **Limpiar Cuando No Sea Necesario**:
   ```bash
   azd down
   ```

### Opciones de Nivel Gratuito
Para aprender/probar, considera:
- Usar créditos gratuitos de Azure (primeros 30 días)
- Mantener el mínimo de réplicas
- Eliminar después de probar (sin cargos continuos)

---

## Limpieza

Para evitar cargos continuos, elimina todos los recursos:

```bash
azd down --force --purge
```

**Mensaje de Confirmación**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Escribe `y` para confirmar.

**Qué se elimina**:
- Entorno de Container Apps
- Ambas Container Apps (gateway y servicio de productos)
- Registro de Contenedores
- Application Insights
- Espacio de trabajo de Log Analytics
- Grupo de recursos

**✓ Verificar Limpieza**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Debe devolver vacío.

---

## Guía de Expansión: De 2 a 5+ Servicios

Una vez que domines esta arquitectura de 2 servicios, aquí tienes cómo expandirla:

### Fase 1: Agregar Persistencia en Base de Datos (Próximo Paso)

**Agregar Cosmos DB para el Servicio de Productos**:

1. Crea `infra/core/cosmos.bicep`:
   ```bicep
   resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
     name: name
     location: location
     kind: 'GlobalDocumentDB'
     properties: {
       databaseAccountOfferType: 'Standard'
       locations: [{ locationName: location, failoverPriority: 0 }]
     }
   }
   ```

2. Actualiza el servicio de productos para usar Cosmos DB en lugar de datos en memoria.

3. Costo adicional estimado: ~$25/mes (sin servidor).

### Fase 2: Agregar un Tercer Servicio (Gestión de Pedidos)

**Crear Servicio de Pedidos**:

1. Nueva carpeta: `src/order-service/` (Python/Node.js/C#)
2. Nuevo Bicep: `infra/app/order-service.bicep`
3. Actualiza el API Gateway para enrutar `/api/orders`
4. Agrega Azure SQL Database para la persistencia de pedidos.

**La arquitectura se convierte en**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Fase 3: Agregar Comunicación Asíncrona (Service Bus)

**Implementar Arquitectura Basada en Eventos**:

1. Agrega Azure Service Bus: `infra/core/servicebus.bicep`
2. El Servicio de Productos publica eventos "ProductCreated".
3. El Servicio de Pedidos se suscribe a eventos de productos.
4. Agrega un Servicio de Notificaciones para procesar eventos.

**Patrón**: Solicitud/Respuesta (HTTP) + Basado en Eventos (Service Bus).

### Fase 4: Agregar Autenticación de Usuarios

**Implementar Servicio de Usuarios**:

1. Crea `src/user-service/` (Go/Node.js).
2. Agrega Azure AD B2C o autenticación JWT personalizada.
3. El API Gateway valida los tokens.
4. Los servicios verifican los permisos de usuario.

### Fase 5: Preparación para Producción

**Agrega Estos Componentes**:
- Azure Front Door (balanceo de carga global)
- Azure Key Vault (gestión de secretos)
- Azure Monitor Workbooks (tableros personalizados)
- Pipeline CI/CD (GitHub Actions)
- Despliegues Blue-Green
- Identidad Administrada para todos los servicios.

**Costo de Arquitectura Completa en Producción**: ~$300-1,400/mes.

---

## Aprende Más

### Documentación Relacionada
- [Documentación de Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Guía de Arquitectura de Microservicios](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights para Trazabilidad Distribuida](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Documentación de Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Próximos Pasos en Este Curso
- ← Anterior: [API Simple con Flask](../../../../../examples/container-app/simple-flask-api) - Ejemplo básico de un solo contenedor.
- → Siguiente: [Guía de Integración de IA](../../../../../examples/docs/ai-foundry) - Agregar capacidades de IA.
- 🏠 [Inicio del Curso](../../README.md)

### Comparación: Cuándo Usar Qué

**Container App Única** (Ejemplo de API Simple con Flask):
- ✅ Aplicaciones simples.
- ✅ Arquitectura monolítica.
- ✅ Rápido de desplegar.
- ❌ Escalabilidad limitada.
- **Costo**: ~$15-50/mes.

**Microservicios** (Este ejemplo):
- ✅ Aplicaciones complejas.
- ✅ Escalado independiente por servicio.
- ✅ Autonomía del equipo (diferentes servicios, diferentes equipos).
- ❌ Más complejo de gestionar.
- **Costo**: ~$60-250/mes.

**Kubernetes (AKS)**:
- ✅ Máximo control y flexibilidad.
- ✅ Portabilidad multi-nube.
- ✅ Redes avanzadas.
- ❌ Requiere experiencia en Kubernetes.
- **Costo**: ~$150-500/mes mínimo.

**Recomendación**: Comienza con Container Apps (este ejemplo), pasa a AKS solo si necesitas características específicas de Kubernetes.

---

## Preguntas Frecuentes

**P: ¿Por qué solo 2 servicios en lugar de 5+?**  
R: Progresión educativa. Domina los fundamentos (comunicación entre servicios, monitoreo, escalado) con un ejemplo simple antes de agregar complejidad. Los patrones que aprendes aquí se aplican a arquitecturas de 100 servicios.

**P: ¿Puedo agregar más servicios por mi cuenta?**  
R: ¡Por supuesto! Sigue la guía de expansión anterior. Cada nuevo servicio sigue el mismo patrón: crea la carpeta src, crea el archivo Bicep, actualiza azure.yaml, despliega.

**P: ¿Esto está listo para producción?**  
R: Es una base sólida. Para producción, agrega: identidad administrada, Key Vault, bases de datos persistentes, pipeline CI/CD, alertas de monitoreo y estrategia de respaldo.

**P: ¿Por qué no usar Dapr u otro service mesh?**  
R: Manténlo simple para aprender. Una vez que entiendas la red nativa de Container Apps, puedes agregar Dapr para escenarios avanzados.

**P: ¿Cómo depuro localmente?**  
R: Ejecuta los servicios localmente con Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**P: ¿Puedo usar diferentes lenguajes de programación?**  
R: ¡Sí! Este ejemplo muestra Node.js (gateway) + Python (servicio de productos). Puedes mezclar cualquier lenguaje que se ejecute en contenedores.

**P: ¿Qué pasa si no tengo créditos de Azure?**  
R: Usa el nivel gratuito de Azure (primeros 30 días con cuentas nuevas) o despliega por períodos cortos de prueba y elimina inmediatamente.

---

> **🎓 Resumen de la Ruta de Aprendizaje**: Has aprendido a desplegar una arquitectura de múltiples servicios con escalado automático, red interna, monitoreo centralizado y patrones listos para producción. Esta base te prepara para sistemas distribuidos complejos y arquitecturas de microservicios empresariales.

**📚 Navegación del Curso:**
- ← Anterior: [API Simple con Flask](../../../../../examples/container-app/simple-flask-api)
- → Siguiente: [Ejemplo de Integración con Base de Datos](../../../../../examples/database-app)
- 🏠 [Inicio del Curso](../../README.md)
- 📖 [Mejores Prácticas para Container Apps](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por lograr precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que surjan del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->