# Arquitectura de Microservicios - Ejemplo de Container App

⏱️ **Tiempo estimado**: 25-35 minutos | 💰 **Costo estimado**: ~$50-100/mes | ⭐ **Complejidad**: Avanzado

Una arquitectura de microservicios **simplificada pero funcional** desplegada en Azure Container Apps usando AZD CLI. Este ejemplo demuestra comunicación entre servicios, orquestación de contenedores y monitoreo con una configuración práctica de 2 servicios.

> **📚 Enfoque de aprendizaje**: Este ejemplo comienza con una arquitectura mínima de 2 servicios (API Gateway + Servicio backend) que puedes desplegar y aprender. Después de dominar esta base, ofrecemos orientación para expandir a un ecosistema completo de microservicios.

## Lo que aprenderás

Al completar este ejemplo, podrás:
- Desplegar múltiples contenedores en Azure Container Apps
- Implementar comunicación entre servicios con red interna
- Configurar escalado basado en entorno y comprobaciones de estado
- Monitorear aplicaciones distribuidas con Application Insights
- Entender patrones y mejores prácticas de despliegue de microservicios
- Aprender expansión progresiva de arquitecturas simples a complejas

## Arquitectura

### Fase 1: Lo que estamos construyendo (Incluido en este ejemplo)

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

**¿Por qué empezar simple?**
- ✅ Desplegar y entender rápidamente (25-35 minutos)
- ✅ Aprender los patrones centrales de microservicios sin complejidad
- ✅ Código funcional que puedes modificar y experimentar
- ✅ Menor costo para aprendizaje (~$50-100/mes vs $300-1400/mes)
- ✅ Generar confianza antes de añadir bases de datos y colas de mensajes

**Analogía**: Piensa en esto como aprender a conducir. Comienzas con un estacionamiento vacío (2 servicios), dominas lo básico y luego progresas al tráfico de la ciudad (5+ servicios con bases de datos).

### Fase 2: Expansión futura (Arquitectura de referencia)

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

Consulta la sección "Guía de expansión" al final para instrucciones paso a paso.

## Características incluidas

✅ **Descubrimiento de servicios**: Descubrimiento automático basado en DNS entre contenedores  
✅ **Balanceo de carga**: Balanceo de carga integrado entre réplicas  
✅ **Autoescalado**: Escalado independiente por servicio basado en solicitudes HTTP  
✅ **Comprobación de salud**: Sondeos de liveness y readiness para ambos servicios  
✅ **Registro distribuido**: Registro centralizado con Application Insights  
✅ **Red interna**: Comunicación segura entre servicios  
✅ **Orquestación de contenedores**: Despliegue y escalado automáticos  
✅ **Actualizaciones sin tiempo de inactividad**: Actualizaciones rolling con gestión de revisiones  

## Prerrequisitos

### Herramientas requeridas

Antes de comenzar, verifica que tengas estas herramientas instaladas:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versión 1.0.0 o superior)  
   ```bash
   azd version
   # Salida esperada: azd versión 1.0.0 o superior
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versión 2.50.0 o superior)  
   ```bash
   az --version
   # Salida esperada: azure-cli 2.50.0 o superior
   ```

3. **[Docker](https://www.docker.com/get-started)** (para desarrollo/pruebas locales - opcional)  
   ```bash
   docker --version
   # Salida esperada: Docker versión 20.10 o superior
   ```

### Requisitos de Azure

- Una **suscripción de Azure** activa ([crea una cuenta gratuita](https://azure.microsoft.com/free/))
- Permisos para crear recursos en tu suscripción
- Rol de **Colaborador** en la suscripción o grupo de recursos

### Conocimientos previos

Este es un ejemplo de **nivel avanzado**. Deberías haber:
- Completado el [ejemplo Simple Flask API](../../../../../examples/container-app/simple-flask-api) 
- Comprensión básica de la arquitectura de microservicios
- Familiaridad con APIs REST y HTTP
- Comprensión de conceptos de contenedores

**¿Nuevo en Container Apps?** Comienza con el [ejemplo Simple Flask API](../../../../../examples/container-app/simple-flask-api) primero para aprender lo básico.

## Inicio rápido (Paso a paso)

### Paso 1: Clonar y navegar

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Comprobación de éxito**: Verifica que veas `azure.yaml`:
```bash
ls
# Esperado: README.md, azure.yaml, infra/, src/
```

### Paso 2: Autenticarse con Azure

```bash
azd auth login
```

Esto abre tu navegador para la autenticación de Azure. Inicia sesión con tus credenciales de Azure.

**✓ Comprobación de éxito**: Deberías ver:
```
Logged in to Azure.
```

### Paso 3: Inicializar el entorno

```bash
azd init
```

**Indicaciones que verás**:
- **Environment name**: Ingresa un nombre corto (p. ej., `microservices-dev`)
- **Azure subscription**: Selecciona tu suscripción
- **Azure location**: Elige una región (p. ej., `eastus`, `westeurope`)

**✓ Comprobación de éxito**: Deberías ver:
```
SUCCESS: New project initialized!
```

### Paso 4: Desplegar infraestructura y servicios

```bash
azd up
```

**Qué sucede** (tarda 8-12 minutos):
1. Crea el entorno de Container Apps
2. Crea Application Insights para el monitoreo
3. Construye el contenedor del API Gateway (Node.js)
4. Construye el contenedor del Product Service (Python)
5. Despliega ambos contenedores en Azure
6. Configura la red y las comprobaciones de estado
7. Configura el monitoreo y el registro

**✓ Comprobación de éxito**: Deberías ver:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Tiempo**: 8-12 minutos

### Paso 5: Probar el despliegue

```bash
# Obtener el endpoint de la pasarela
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Comprobar el estado de salud del API Gateway
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

**✓ Comprobación de éxito**: Ambos endpoints devuelven datos JSON sin errores.

---

**🎉 ¡Felicidades!** ¡Has desplegado una arquitectura de microservicios en Azure!

## Estructura del proyecto

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

**Qué hace cada componente:**

**Infraestructura (infra/)**:
- `main.bicep`: Orquesta todos los recursos de Azure y sus dependencias
- `core/container-apps-environment.bicep`: Crea el entorno de Container Apps y el Azure Container Registry
- `core/monitor.bicep`: Configura Application Insights para el registro distribuido
- `app/*.bicep`: Definiciones individuales de container apps con escalado y comprobaciones de estado

**API Gateway (src/api-gateway/)**:
- Servicio público que enruta solicitudes a los servicios backend
- Implementa registro, manejo de errores y reenvío de solicitudes
- Demuestra comunicación HTTP entre servicios

**Product Service (src/product-service/)**:
- Servicio interno con catálogo de productos (en memoria para simplicidad)
- API REST con comprobaciones de estado
- Ejemplo de patrón de microservicio backend

## Resumen de servicios

### API Gateway (Node.js/Express)

**Puerto**: 8080  
**Acceso**: Público (ingreso externo)  
**Propósito**: Enruta solicitudes entrantes a los servicios backend apropiados  

**Endpoints**:
- `GET /` - Información del servicio
- `GET /health` - Punto de comprobación de estado
- `GET /api/products` - Reenvía al servicio de productos (listar todos)
- `GET /api/products/:id` - Reenvía al servicio de productos (obtener por ID)

**Características clave**:
- Enrutamiento de solicitudes con axios
- Registro centralizado
- Manejo de errores y gestión de tiempos de espera
- Descubrimiento de servicios vía variables de entorno
- Integración con Application Insights

**Fragmento de código** (`src/api-gateway/app.js`):
```javascript
// Comunicación interna del servicio
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Puerto**: 8000  
**Acceso**: Solo interno (sin ingreso externo)  
**Propósito**: Administra el catálogo de productos con datos en memoria  

**Endpoints**:
- `GET /` - Información del servicio
- `GET /health` - Punto de comprobación de estado
- `GET /products` - Listar todos los productos
- `GET /products/<id>` - Obtener producto por ID

**Características clave**:
- API RESTful con Flask
- Almacén de productos en memoria (simple, no necesita base de datos)
- Monitoreo de estado con sondas de comprobación
- Registro estructurado
- Integración con Application Insights

**Modelo de datos**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**¿Por qué solo interno?**
El servicio de productos no está expuesto públicamente. Todas las solicitudes deben pasar por el API Gateway, que proporciona:
- Seguridad: Punto de acceso controlado
- Flexibilidad: Permite cambiar el backend sin afectar a los clientes
- Monitoreo: Registro centralizado de solicitudes

## Entendiendo la comunicación entre servicios

### Cómo se comunican los servicios entre sí

En este ejemplo, el API Gateway se comunica con el Product Service usando **llamadas HTTP internas**:

```javascript
// Pasarela de API (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Realizar una solicitud HTTP interna
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Puntos clave**:

1. **Descubrimiento basado en DNS**: Container Apps proporciona automáticamente DNS para servicios internos
   - Product Service FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - Simplificado como: `http://product-service` (Container Apps lo resuelve)

2. **Sin exposición pública**: Product Service tiene `external: false` en Bicep
   - Solo accesible dentro del entorno de Container Apps
   - No puede ser alcanzado desde Internet

3. **Variables de entorno**: Las URLs de servicio se inyectan en tiempo de despliegue
   - Bicep pasa el FQDN interno al gateway
   - No hay URLs codificadas en el código de la aplicación

**Analogía**: Piensa en esto como salas de oficina. El API Gateway es la recepción (orientado al público), y el Product Service es una oficina (solo interna). Los visitantes deben pasar por recepción para llegar a cualquier oficina.

## Opciones de despliegue

### Despliegue completo (recomendado)

```bash
# Desplegar la infraestructura y ambos servicios
azd up
```

Esto despliega:
1. Entorno de Container Apps
2. Application Insights
3. Container Registry
4. Contenedor del API Gateway
5. Contenedor del Product Service

**Tiempo**: 8-12 minutos

### Desplegar servicio individual

```bash
# Desplegar solo un servicio (después del azd up inicial)
azd deploy api-gateway

# O desplegar el servicio de producto
azd deploy product-service
```

**Caso de uso**: Cuando has actualizado el código en un servicio y quieres desplegar solo ese servicio.

### Actualizar configuración

```bash
# Cambiar los parámetros de escalado
azd env set GATEWAY_MAX_REPLICAS 30

# Volver a desplegar con la nueva configuración
azd up
```

## Configuración

### Configuración de escalado

Ambos servicios están configurados con autoescalado basado en HTTP en sus archivos Bicep:

**API Gateway**:
- Réplicas mínimas: 2 (siempre al menos 2 para disponibilidad)
- Réplicas máximas: 20
- Disparador de escalado: 50 solicitudes concurrentes por réplica

**Product Service**:
- Réplicas mínimas: 1 (puede escalar a cero si es necesario)
- Réplicas máximas: 10
- Disparador de escalado: 100 solicitudes concurrentes por réplica

**Personalizar escalado** (en `infra/app/*.bicep`):
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

### Asignación de recursos

**API Gateway**:
- CPU: 1.0 vCPU
- Memoria: 2 GiB
- Motivo: Maneja todo el tráfico externo

**Product Service**:
- CPU: 0.5 vCPU
- Memoria: 1 GiB
- Motivo: Operaciones ligeras en memoria

### Comprobaciones de estado

Ambos servicios incluyen sondas de liveness y readiness:

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

**Qué significa esto**:
- **Liveness**: Si la comprobación de estado falla, Container Apps reinicia el contenedor
- **Readiness**: Si no está listo, Container Apps deja de enrutar tráfico a esa réplica



## Monitoreo y observabilidad

### Ver registros de servicios

```bash
# Ver registros con azd monitor
azd monitor --logs

# O use la CLI de Azure para Container Apps específicos:
# Transmitir registros desde API Gateway
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# Ver registros recientes del servicio de producto
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**Salida esperada**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Consultas de Application Insights

Accede a Application Insights en el Portal de Azure y luego ejecuta estas consultas:

**Encontrar solicitudes lentas**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Rastrear llamadas entre servicios**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Tasa de errores por servicio**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Volumen de solicitudes a lo largo del tiempo**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Acceder al panel de monitoreo

```bash
# Obtener detalles de Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Abrir la monitorización del Portal de Azure
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Métricas en vivo

1. Navega a Application Insights en el Portal de Azure
2. Haz clic en "Live Metrics"
3. Ve solicitudes en tiempo real, fallos y rendimiento
4. Prueba ejecutando: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Ejercicios prácticos

[Nota: Consulta los ejercicios completos arriba en la sección "Ejercicios prácticos" para ejercicios detallados paso a paso que incluyen verificación del despliegue, modificación de datos, pruebas de autoescalado, manejo de errores y añadir un tercer servicio.]

## Análisis de costos

### Costos mensuales estimados (para este ejemplo de 2 servicios)

| Recurso | Configuración | Costo estimado |
|----------|--------------|----------------|
| API Gateway | 2-20 réplicas, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 réplicas, 0.5 vCPU, 1GB RAM | $15-75 |
| Registro de contenedores | Nivel básico | $5 |
| Application Insights | 1-2 GB/mes | $5-10 |
| Log Analytics | 1 GB/mes | $3 |
| **Total** | | **$58-243/mes** |

**Desglose de costos por uso**:
- **Tráfico ligero** (pruebas/aprendizaje): ~$60/mes
- **Tráfico moderado** (pequeña producción): ~$120/mes
- **Tráfico alto** (periodos de alta carga): ~$240/mes

### Consejos para optimizar costos

1. **Escalar a cero para desarrollo**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Usar el plan de consumo para Cosmos DB** (cuando lo agregues):
   - Paga solo por lo que uses
   - Sin cargo mínimo

3. **Configurar el muestreo en Application Insights**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Muestrear el 50% de las solicitudes
   ```

4. **Limpiar cuando no sea necesario**:
   ```bash
   azd down
   ```

### Opciones de nivel gratuito
Para aprendizaje/pruebas, considere:
- Use los créditos gratuitos de Azure (primeros 30 días)
- Mantenga el número mínimo de réplicas
- Elimine después de las pruebas (sin cargos continuos)

---

## Limpieza

Para evitar cargos continuos, elimine todos los recursos:

```bash
azd down --force --purge
```

**Aviso de confirmación**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Escriba `y` para confirmar.

**Qué se elimina**:
- Entorno de Container Apps
- Ambos Container Apps (gateway & servicio de productos)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Grupo de recursos

**✓ Verificar limpieza**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Debería devolver vacío.

---

## Guía de expansión: De 2 a 5+ servicios

Una vez que haya dominado esta arquitectura de 2 servicios, así es como expandirla:

### Fase 1: Agregar persistencia de base de datos (Siguiente paso)

**Agregar Cosmos DB para el servicio de productos**:

1. Crear `infra/core/cosmos.bicep`:
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

2. Actualizar el servicio de productos para usar Cosmos DB en lugar de datos en memoria

3. Costo adicional estimado: ~$25/mes (sin servidor)

### Fase 2: Agregar un tercer servicio (Gestión de pedidos)

**Crear servicio de pedidos**:

1. Nueva carpeta: `src/order-service/` (Python/Node.js/C#)
2. Nuevo Bicep: `infra/app/order-service.bicep`
3. Actualizar el API Gateway para enrutar `/api/orders`
4. Agregar Azure SQL Database para la persistencia de pedidos

**La arquitectura queda**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Fase 3: Agregar comunicación asíncrona (Service Bus)

**Implementar arquitectura basada en eventos**:

1. Añadir Azure Service Bus: `infra/core/servicebus.bicep`
2. El servicio de productos publica eventos "ProductCreated"
3. El servicio de pedidos se suscribe a los eventos de producto
4. Agregar un servicio de notificaciones para procesar los eventos

**Patrón**: Solicitud/Respuesta (HTTP) + basado en eventos (Service Bus)

### Fase 4: Agregar autenticación de usuarios

**Implementar servicio de usuarios**:

1. Crear `src/user-service/` (Go/Node.js)
2. Agregar Azure AD B2C o autenticación JWT personalizada
3. El API Gateway valida los tokens
4. Los servicios verifican los permisos de usuario

### Fase 5: Preparación para producción

**Agregar estos componentes**:
- Azure Front Door (balanceo de carga global)
- Azure Key Vault (gestión de secretos)
- Azure Monitor Workbooks (paneles personalizados)
- Canalización CI/CD (GitHub Actions)
- Despliegues Blue-Green
- Managed Identity para todos los servicios

**Costo aproximado de la arquitectura en producción**: ~$300-1,400/mes

---

## Más información

### Documentación relacionada
- [Documentación de Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Guía de arquitectura de microservicios](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights para trazado distribuido](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Documentación de Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Próximos pasos en este curso
- ← Anterior: [API Flask simple](../../../../../examples/container-app/simple-flask-api) - Ejemplo inicial de un solo contenedor
- → Siguiente: [Guía de integración de IA](../../../../../examples/docs/ai-foundry) - Agregar capacidades de IA
- 🏠 [Inicio del curso](../../README.md)

### Comparación: Cuándo usar cada opción

**Aplicación de contenedor único** (ejemplo Simple Flask API):
- ✅ Aplicaciones simples
- ✅ Arquitectura monolítica
- ✅ Rápido de desplegar
- ❌ Escalabilidad limitada
- **Costo**: ~$15-50/mes

**Microservicios** (Este ejemplo):
- ✅ Aplicaciones complejas
- ✅ Escalado independiente por servicio
- ✅ Autonomía de equipo (servicios diferentes, equipos distintos)
- ❌ Más complejo de administrar
- **Costo**: ~$60-250/mes

**Kubernetes (AKS)**:
- ✅ Control y flexibilidad máximos
- ✅ Portabilidad multi-nube
- ✅ Redes avanzadas
- ❌ Requiere experiencia en Kubernetes
- **Costo**: ~$150-500/mes mínimo

**Recomendación**: Comience con Container Apps (este ejemplo), migre a AKS solo si necesita funciones específicas de Kubernetes.

---

## Preguntas frecuentes

**Q: ¿Por qué solo 2 servicios en lugar de 5+?**  
A: Progresión educativa. Domine los fundamentos (comunicación entre servicios, monitorización, escalado) con un ejemplo simple antes de añadir complejidad. Los patrones que aprenda aquí se aplican a arquitecturas de 100 servicios.

**Q: ¿Puedo añadir más servicios yo mismo?**  
A: ¡Absolutamente! Siga la guía de expansión arriba. Cada nuevo servicio sigue el mismo patrón: crear la carpeta src, crear el archivo Bicep, actualizar azure.yaml, desplegar.

**Q: ¿Esto está listo para producción?**  
A: Es una base sólida. Para producción, agregue: identidad administrada, Key Vault, bases de datos persistentes, canalización CI/CD, alertas de monitorización y estrategia de copias de seguridad.

**Q: ¿Por qué no usar Dapr u otro service mesh?**  
A: Manténgalo simple para el aprendizaje. Una vez que entienda la red nativa de Container Apps, puede añadir Dapr para escenarios avanzados.

**Q: ¿Cómo depuro localmente?**  
A: Ejecute los servicios localmente con Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: ¿Puedo usar diferentes lenguajes de programación?**  
A: ¡Sí! Este ejemplo muestra Node.js (gateway) + Python (servicio de productos). Puede mezclar cualquier lenguaje que se ejecute en contenedores.

**Q: ¿Qué pasa si no tengo créditos de Azure?**  
A: Use el nivel gratuito de Azure (primeros 30 días para cuentas nuevas) o despliegue para períodos cortos de prueba y elimine inmediatamente.

---

> **🎓 Resumen del camino de aprendizaje**: Ha aprendido a desplegar una arquitectura multi-servicio con escalado automático, red interna, monitorización centralizada y patrones listos para producción. Esta base le prepara para sistemas distribuidos complejos y arquitecturas de microservicios empresariales.

**📚 Navegación del curso:**
- ← Anterior: [API Flask simple](../../../../../examples/container-app/simple-flask-api)
- → Siguiente: [Ejemplo de integración de base de datos](../../../../../examples/database-app)
- 🏠 [Inicio del curso](../../../README.md)
- 📖 [Mejores prácticas de Container Apps](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Descargo de responsabilidad:
Este documento ha sido traducido utilizando el servicio de traducción automática Co‑op Translator (https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por un traductor humano. No nos hacemos responsables de ningún malentendido o mala interpretación que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->