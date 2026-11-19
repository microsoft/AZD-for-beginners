# Guía de Solución de Problemas Específica para IA

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 7 - Solución de Problemas y Depuración
- **⬅️ Anterior**: [Guía de Depuración](debugging.md)
- **➡️ Próximo Capítulo**: [Capítulo 8: Patrones de Producción y Empresariales](../chapter-08-production/production-ai-practices.md)
- **🤖 Relacionado**: [Capítulo 2: Desarrollo con IA como Prioridad](../chapter-02-ai-development/microsoft-foundry-integration.md)

Esta guía completa de solución de problemas aborda problemas comunes al desplegar soluciones de IA con AZD, proporcionando soluciones y técnicas de depuración específicas para los servicios de Azure AI.

> **Alcance:** Los comandos usan nombres de recurso de ejemplo; reemplázalos y selecciona la suscripción correcta. Los bloques Bicep son fragmentos para fusionar en una plantilla existente, no implementaciones independientes. Los fragmentos de Python requieren los SDK declarados y configuración de la aplicación. No se ejecutó ningún despliegue en vivo de Azure para esta revisión.

## Tabla de Contenidos

- [Problemas con el Servicio Microsoft Foundry Models](#microsoft-foundry-models-service-issues)
- [Problemas con Azure AI Search](#azure-ai-search-problems)
- [Problemas en el Despliegue de Aplicaciones en Contenedores](#container-apps-deployment-issues)
- [Errores de Autenticación y Permisos](#authentication-and-permission-errors)
- [Fallos en el Despliegue de Modelos](#model-deployment-failures)
- [Problemas de Rendimiento y Escalabilidad](#performance-and-scaling-issues)
- [Gestión de Costos y Cuotas](#cost-and-quota-management)
- [Herramientas y Técnicas de Depuración](#debugging-tools-and-techniques)

## Problemas con el Servicio Microsoft Foundry Models

### Problema: Servicio OpenAI No Disponible en la Región

**Síntomas:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Causas:**
- Microsoft Foundry Models no disponible en la región seleccionada
- Cuota agotada en las regiones preferidas
- Restricciones de capacidad regional

**Soluciones:**

1. **Verificar Disponibilidad de la Región:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **Actualizar Configuración de AZD:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **Utilizar Regiones Alternativas:**
```bicep
// infra/main.bicep - Explicit location selection, NOT automatic fallback
@allowed([
  'eastus2'
  'francecentral'
  'canadaeast'
  'swedencentral'
])
param openAiLocation string = 'eastus2'
```

### Problema: Cuota de Despliegue de Modelo Excedida

**Síntomas:**
```
Error: Deployment failed due to insufficient quota
```

**Soluciones:**

1. **Verificar la Cuota Actual:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **Solicitar Incremento de Cuota:**
Usa el flujo de trabajo de gestión de cuotas del portal Foundry para la suscripción, región, modelo y tipo de despliegue afectados. Consulta la [guía oficial de cuotas](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). Una solicitud de cuota de VM no aumenta la cuota del modelo.

3. **Optimizar la Capacidad del Modelo:**
```bicep
// Reduce initial capacity
resource deployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi // Existing account resource declared in your template
  name: 'chat-model'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'GlobalStandard' // Verify this model/version/type in the target region
    capacity: 1  // Capacity units are model/deployment-type specific
  }
}
```

### Problema: Versión de API Inválida

**Síntomas:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Soluciones:**

1. **Usar una Versión de API Soportada:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Verificar Compatibilidad de la Versión API:**
Consulta la [referencia del ciclo de vida de la API Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). Las versiones de API del proveedor de recursos ARM **no** listan las versiones API de inferencia/plano de datos. Los nuevos clientes v1 usan `/openai/v1/` sin una versión fechada `api-version`; no mezcles ambas configuraciones de cliente.

## Problemas con Azure AI Search

### Problema: Nivel de Precio del Servicio Search Insuficiente

**Síntomas:**
```
Error: Semantic search requires Basic tier or higher
```

**Soluciones:**

1. **Usar un Nivel de Precio Soportado:**

El ranqueador semántico requiere Basic o superior. Pasar de Free/Basic a otro nivel puede requerir crear un servicio de búsqueda nuevo y reconstruir índices; editar un SKU no garantiza una actualización en el lugar.
```bicep
// infra/main.bicep - Use Basic tier
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
  location: location
  sku: {
    name: 'basic'  // Minimum for semantic search
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
    semanticSearch: 'standard'
  }
}
```

2. **Deshabilitar Búsqueda Semántica (Desarrollo):**
```bicep
// For development environments
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  sku: {
    name: 'free'
  }
  properties: {
    semanticSearch: 'disabled'
  }
}
```

### Problema: Fallos en la Creación del Índice

**Síntomas:**
```
Error: Cannot create index, insufficient permissions
```

**Soluciones:**

1. **Verificar Claves del Servicio Search:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Revisar Esquema del Índice:**
```python
# Validate index schema
from azure.search.documents.indexes import SearchIndexClient
from azure.search.documents.indexes.models import SearchIndex

def validate_index_schema(index_definition):
    """Validate index schema before creation."""
    # These are this application's requirements, not universal Search fields.
    required_fields = ['id', 'content']
    field_names = [field.name for field in index_definition.fields]
    
    for required in required_fields:
        if required not in field_names:
            raise ValueError(f"Missing required field: {required}")
```

3. **Usar Identidad Administrada:**
```bicep
// Grant index-definition management permissions to the managed identity.
// Search Index Data Contributor manages documents, not index definitions.
resource searchContributor 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: searchService
  name: guid(searchService.id, containerApp.id, 'Search Service Contributor')
  properties: {
    principalId: containerApp.identity.principalId
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '7ca78c08-252a-4471-8644-bb5ff32d4ba0')
    principalType: 'ServicePrincipal'
  }
}
```

## Problemas en el Despliegue de Aplicaciones en Contenedores

### Problema: Fallos en la Construcción del Contenedor

**Síntomas:**
```
Error: Failed to build container image
```

**Soluciones:**

1. **Verificar Sintaxis del Dockerfile:**
```dockerfile
# Dockerfile - Python AI app example
FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for better caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
```

2. **Validar Dependencias:**
```txt
# Dependency names for these snippets. Resolve supported versions in your
# project's environment, test together, then commit a lock/pinned requirements file.
fastapi
uvicorn
openai
azure-identity
azure-keyvault-secrets
azure-search-documents
azure-cosmos
```

3. **Agregar Verificación de Salud:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Problema: Fallos en el Inicio de la Aplicación en Contenedor

**Síntomas:**
```
Error: Container failed to start within timeout period
```

**Soluciones:**

1. **Incrementar Tiempo de Espera al Inicio:**
```bicep
resource containerApp 'Microsoft.App/containerApps@2024-03-01' = {
  properties: {
    template: {
      containers: [
        {
          name: 'main'
          image: containerImage
          resources: {
            cpu: json('0.5')
            memory: '1Gi'
          }
          probes: [
            {
              type: 'Startup'
              httpGet: {
                path: '/health'
                port: 8000
              }
              initialDelaySeconds: 30
              periodSeconds: 10
              timeoutSeconds: 5
              failureThreshold: 10  // Allow more time for AI models to load
            }
          ]
        }
      ]
    }
  }
}
```

2. **Optimizar Carga del Modelo:**
```python
# Lazy load models to reduce startup time
# Illustrative skeleton: implement _initialize_client and synchronize concurrent
# initialization before using this pattern in an application.
import asyncio
from contextlib import asynccontextmanager
from fastapi import FastAPI

class ModelManager:
    def __init__(self):
        self._client = None
        
    async def get_client(self):
        if self._client is None:
            self._client = await self._initialize_client()
        return self._client
        
    async def _initialize_client(self):
        # Initialize AI client here
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Startup
    app.state.model_manager = ModelManager()
    yield
    # Shutdown
    pass

app = FastAPI(lifespan=lifespan)
```

## Errores de Autenticación y Permisos

### Problema: Permiso Denegado para Identidad Administrada

**Síntomas:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Soluciones:**

1. **Verificar Asignaciones de Rol:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Asignar Roles Requeridos:**
```bicep
// Required role assignments for AI services
var cognitiveServicesOpenAIUserRole = subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
var searchIndexDataContributorRole = subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '8ebe5a00-799e-43f5-93ac-243d3dce84a7')

resource openAiRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAi
  name: guid(openAi.id, containerApp.id, cognitiveServicesOpenAIUserRole)
  properties: {
    principalId: containerApp.identity.principalId
    roleDefinitionId: cognitiveServicesOpenAIUserRole
    principalType: 'ServicePrincipal'
  }
}
```

3. **Probar Autenticación:**
```python
# Test managed identity authentication
from azure.identity import DefaultAzureCredential
from azure.core.exceptions import ClientAuthenticationError

def test_authentication():
    try:
        with DefaultAzureCredential() as credential:
            token = credential.get_token("https://cognitiveservices.azure.com/.default")
            print(f"Token acquired; expires at Unix time {token.expires_on}")
    except ClientAuthenticationError as e:
        print(f"Authentication failed: {e}")

test_authentication()
```

La adquisición de token prueba autenticación, no permiso para invocar un modelo. Prueba la operación prevista por separado. Localmente, `DefaultAzureCredential` puede usar credenciales de desarrollador; en Azure, verifica que se seleccione la identidad administrada deseada.

### Problema: Acceso a Key Vault Denegado

**Síntomas:**
```
Error: The user, group or application does not have secrets get permission
```

**Soluciones:**

1. **Conceder Permisos en Key Vault:**

Usa el fragmento de política de acceso siguiente solo para un vault con `enableRbacAuthorization: false`. Para un vault habilitado para RBAC, usa la opción 2; añadir una política de acceso no otorga acceso al plano de datos en modo RBAC.
```bicep
resource keyVaultAccessPolicy 'Microsoft.KeyVault/vaults/accessPolicies@2023-07-01' = {
  parent: keyVault
  name: 'add'
  properties: {
    accessPolicies: [
      {
        tenantId: subscription().tenantId
        objectId: containerApp.identity.principalId
        permissions: {
          secrets: ['get', 'list']
        }
      }
    ]
  }
}
```

2. **Usar RBAC en Lugar de Políticas de Acceso:**

El vault debe tener `enableRbacAuthorization: true`; cambiar modelos de permiso requiere una migración planificada de accesos existentes.
```bicep
resource keyVaultSecretsUserRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: keyVault
  name: guid(keyVault.id, containerApp.id, 'Key Vault Secrets User')
  properties: {
    principalId: containerApp.identity.principalId
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '4633458b-17de-408a-b874-0445c86b69e6')
    principalType: 'ServicePrincipal'
  }
}
```

## Fallos en el Despliegue de Modelos

### Problema: Versión del Modelo No Disponible

**Síntomas:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Soluciones:**

1. **Verificar Modelos Disponibles:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **Seleccionar Explícitamente un Modelo Disponible:**
```bicep
// Example model selection; verify version and deployment type in the catalog.
@description('Primary model configuration')
param primaryModel object = {
  name: 'gpt-4.1-mini'
  version: '2025-04-14'
}

// Bicep does not catch provisioning failures and retry a fallback model.
resource primaryDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'chat-model'
  properties: {
    model: {
      format: 'OpenAI'
      name: primaryModel.name
      version: primaryModel.version
    }
  }
  sku: {
    name: 'GlobalStandard'
    capacity: 10
  }
}
```

3. **Validar Modelo Antes del Despliegue:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Problemas de Rendimiento y Escalabilidad

### Problema: Respuestas con Alta Latencia

**Síntomas:**
- Tiempos de respuesta > 30 segundos
- Errores de tiempo de espera
- Mala experiencia de usuario

**Soluciones:**

1. **Implementar Tiempos de Espera para Solicitudes:**
```python
# Configure proper timeouts
import httpx

client = httpx.AsyncClient(
    timeout=httpx.Timeout(
        connect=5.0,
        read=30.0,
        write=10.0,
        pool=10.0
    )
)
```

2. **Agregar Caché de Respuestas:**
```python
# Redis cache for responses
import redis.asyncio as redis
import json

class ResponseCache:
    def __init__(self, redis_url: str):
        self.redis = redis.from_url(redis_url)
        
    async def get_cached_response(self, query_hash: str) -> str | None:
        """Get cached response if available."""
        cached = await self.redis.get(f"ai_response:{query_hash}")
        return cached.decode() if cached else None
        
    async def cache_response(self, query_hash: str, response: str, ttl: int = 3600):
        """Cache AI response with TTL."""
        await self.redis.setex(f"ai_response:{query_hash}", ttl, response)
```

3. **Configurar Autoescalado:**
```bicep
resource containerApp 'Microsoft.App/containerApps@2024-03-01' = {
  properties: {
    template: {
      scale: {
        minReplicas: 2
        maxReplicas: 20
        rules: [
          {
            name: 'http-requests'
            http: {
              metadata: {
                concurrentRequests: '5'  // Scale aggressively for AI workloads
              }
            }
          }
          {
            name: 'cpu-utilization'
            custom: {
              type: 'cpu'
              metadata: {
                type: 'Utilization'
                value: '60'  // Lower threshold for AI apps
              }
            }
          }
        ]
      }
    }
  }
}
```

### Problema: Errores por Falta de Memoria

**Síntomas:**
```
Error: Container killed due to memory limit exceeded
```

**Soluciones:**

1. **Incrementar Asignación de Memoria:**
```bicep
resource containerApp 'Microsoft.App/containerApps@2024-03-01' = {
  properties: {
    template: {
      containers: [
        {
          name: 'main'
          resources: {
            cpu: json('1.0')
            memory: '2Gi'  // Increase for AI workloads
          }
        }
      ]
    }
  }
}
```

2. **Optimizar Uso de Memoria:**
```python
# Memory-efficient model handling
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def _process_ai_request(self, request):
        raise NotImplementedError("Supply the application's AI operation")

    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Check memory usage before processing
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Force garbage collection
            
        result = await self._process_ai_request(request)
        
        # Clean up after processing
        gc.collect()
        return result
```

## Gestión de Costos y Cuotas

### Problema: Costos Altos Inesperados

**Síntomas:**
- Factura de Azure más alta de lo esperado
- Uso de tokens excede estimaciones
- Alertas de presupuesto activadas

**Soluciones:**

1. **Implementar Controles de Costos:**
```python
# Token usage tracking
class TokenTracker:
    def __init__(self, monthly_limit: int = 100000):
        self.monthly_limit = monthly_limit
        self.current_usage = 0
        
    async def track_usage(self, prompt_tokens: int, completion_tokens: int):
        """Track token usage with limits."""
        total_tokens = prompt_tokens + completion_tokens
        self.current_usage += total_tokens
        
        if self.current_usage > self.monthly_limit:
            raise Exception("Monthly token limit exceeded")
            
        return total_tokens
```

Este contador en memoria es ilustrativo, no un control de gasto mensual: se reinicia al reiniciar, no se comparte entre réplicas y verifica uso solo después de una llamada. Un límite real necesita contabilidad durable, reservas seguras frente a concurrencia antes de solicitudes y una política de reinicio mensual. Las métricas de memoria de contenedor también deben considerar límites cgroup; `psutil.virtual_memory()` no es una medición confiable de límite de contenedor, y la recolección de basura no impone un límite de memoria.

2. **Configurar Alertas de Costos:**
```bicep
resource budgetAlert 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-workload-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate // Parameter: first day of a supported budget period
      endDate: budgetEndDate     // Parameter: a future date
    }
    timeGrain: 'Monthly'
    amount: 500  // Notification threshold in the subscription's billing currency
    category: 'Cost'
    notifications: {
      Actual_GreaterThan_80_Percent: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        thresholdType: 'Actual'
        contactEmails: ['admin@company.com']
        contactRoles: ['Owner']
      }
    }
  }
}
```

Declara `budgetStartDate` y `budgetEndDate` en tu plantilla. Los presupuestos notifican; no detienen recursos ni imponen un límite estricto de gasto.

3. **Optimizar Selección de Modelo:**
```python
# Cost-aware model selection
MODEL_COST_TIERS = {
  'gpt-4.1-mini': 'low',
  'gpt-4.1': 'high'
}

def select_model_by_cost(complexity: str, budget_remaining: float) -> str:
    """Select model based on complexity and budget."""
    if complexity == 'simple' or budget_remaining < 10:
        return 'gpt-4.1-mini'
    else:
        return 'gpt-4.1'
```

## Herramientas y Técnicas de Depuración

### Comandos de Depuración AZD

```bash
# Enable verbose logging
azd up --debug

# Check deployment status
azd show

# View application logs (opens monitoring dashboard)
azd monitor --logs

# View live metrics
azd monitor --live

# Check environment variables
azd env get-values
```

### Comandos de Extensión AZD AI para Diagnósticos

Si desplegaste agentes usando `azd ai agent init`, estas herramientas adicionales están disponibles:

```bash
# Install the GA Foundry bundle (requires azd >= 1.37.0)
azd ext install microsoft.foundry

# Check project storage permissions and agent configuration
azd ai agent doctor

# Inspect the deployed endpoint
azd ai agent endpoint show

# Stream hosted-agent logs
azd ai agent monitor --follow

# Use the MCP server to let AI tools query project state
azd mcp start

# Generate infrastructure files for review and audit
azd infra generate
```

> **Consejo:** Usa `azd infra generate` para escribir IaC en disco y así inspeccionar exactamente qué recursos fueron aprovisionados. Esto es invaluable al depurar configuraciones de recursos. Consulta la [referencia del CLI AI de AZD](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para detalles completos.

**Diagnósticos del flujo GA (2026-11-09):** Verifica que `azd version` sea al menos 1.37.0 e inspecciona `azd ext list --installed`. Actualiza primero el core CLI con `azd update` o su instalador, después el bundle con `azd ext upgrade microsoft.foundry`. Para fallas locales, revisa uv actual, Python 3.13+ para la muestra básica, `PYTHONNOUSERSITE: "1"` en su configuración del servicio y las credenciales de Azure usadas por `DefaultAzureCredential`. Mantén `azd ai agent run` corriendo mientras invocas `--local` desde un segundo terminal en el directorio del proyecto.

El éxito del aprovisionamiento no demuestra que el desarrollador tenga acceso al plano de datos. Revisa advertencias RBAC y la [matriz de permisos de agentes alojados](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions). Un tiempo de espera no establece una falla de despliegue: inspecciona la versión intentada y los logs antes de reintentar. Los agentes beta.23 anteriores mejoraron estas advertencias y la salida A2A; esas correcciones históricas están descritas en las [notas de lanzamiento](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes), no es obligatorio instalar esa beta.

Si `azd ai eval` no está disponible, instala `azure.ai.evaluations` por separado; el bundle GA no lo incluye. Si el comando agent-evaluation de un tutorial antiguo solo imprime guías de migración, usa el flujo separado `azd ai eval`. `--config` de optimización ya no acepta archivos de evaluación legados. Consulta [migración de evaluación](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) y [migración de optimización](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Depuración de Aplicaciones

1. **Registro Estructurado:**
```python
import logging
import json

# Configure structured logging for AI applications
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)

logger = logging.getLogger(__name__)

def log_ai_request(model: str, tokens: int, latency: float, success: bool):
    """Log AI request details."""
    logger.info(json.dumps({
        'event': 'ai_request',
        'model': model,
        'tokens': tokens,
        'latency_ms': latency,
        'success': success
    }))
```

2. **Endpoints de Verificación de Salud:**
```python
# Integration fragment: add to an existing FastAPI app, protect this diagnostic
# endpoint, and configure AZURE_SEARCH_ENDPOINT. This tests Search index-list
# authorization, not Azure OpenAI inference.
import os
from azure.identity.aio import DefaultAzureCredential
from azure.search.documents.indexes.aio import SearchIndexClient
from fastapi import Response

@app.get("/debug/health")
async def detailed_health_check(response: Response):
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Check Search service
    try:
        async with DefaultAzureCredential() as credential:
            async with SearchIndexClient(
                endpoint=os.environ['AZURE_SEARCH_ENDPOINT'],
                credential=credential
            ) as search_client:
                # AsyncItemPaged is iterated asynchronously, not awaited as a list.
                async for _ in search_client.list_index_names():
                    break
        checks['search'] = {'status': 'healthy'}
    except Exception:
        response.status_code = 503
        checks['search'] = {'status': 'unhealthy'}
    
    return checks
```

3. **Monitoreo de Rendimiento:**
```python
import time
from functools import wraps

def monitor_performance(func):
    """Decorator to monitor function performance."""
    @wraps(func)
    async def wrapper(*args, **kwargs):
        start_time = time.time()
        try:
            result = await func(*args, **kwargs)
            success = True
        except Exception as e:
            result = None
            success = False
            raise
        finally:
            end_time = time.time()
            latency = (end_time - start_time) * 1000
            
            logger.info(json.dumps({
                'function': func.__name__,
                'latency_ms': latency,
                'success': success
            }))
        
        return result
    return wrapper
```

## Códigos de Error Comunes y Soluciones

| Código de Error | Descripción | Solución |
|------------|-------------|----------|
| 401 | No Autorizado | Verificar claves API y configuración de identidad administrada |
| 403 | Prohibido | Verificar asignaciones de rol RBAC |
| 429 | Límite de Tasa | Implementar lógica de reintentos con retroceso exponencial |
| 500 | Error Interno del Servidor | Verificar estado de despliegue del modelo y logs |
| 503 | Servicio No Disponible | Verificar salud del servicio y disponibilidad regional |

## Próximos Pasos

1. **Revisar la [Guía de Despliegue de Modelos de IA](../chapter-02-ai-development/ai-model-deployment.md)** para buenas prácticas de despliegue
2. **Completar las [Prácticas de IA en Producción](../chapter-08-production/production-ai-practices.md)** para soluciones listas para empresas
3. **Unirse al [Discord de Microsoft Foundry](https://aka.ms/foundry/discord)** para soporte comunitario
4. **Reportar problemas** en el [repositorio AZD en GitHub](https://github.com/Azure/azure-dev) para problemas específicos de AZD

## Recursos

- [Solución de problemas de cuota y limitación en Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Solución de problemas en Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Solución de problemas en Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Habilidad de Diagnóstico del Agente Azure**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Instala habilidades de diagnóstico de Azure en tu editor: `npx skills add microsoft/github-copilot-for-azure`

---

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 7 - Solución de Problemas y Depuración
- **⬅️ Anterior**: [Guía de Depuración](debugging.md)
- **➡️ Próximo Capítulo**: [Capítulo 8: Patrones de Producción y Empresariales](../chapter-08-production/production-ai-practices.md)
- **🤖 Relacionado**: [Capítulo 2: Desarrollo con IA como Prioridad](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Referencia**: [Solución de Problemas del CLI de Azure Developer](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->