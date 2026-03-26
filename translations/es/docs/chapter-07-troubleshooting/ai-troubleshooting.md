# Guía de Solución de Problemas Específica para IA

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 7 - Solución de Problemas y Depuración
- **⬅️ Anterior**: [Guía de Depuración](debugging.md)
- **➡️ Próximo Capítulo**: [Capítulo 8: Patrones de Producción y Empresariales](../chapter-08-production/production-ai-practices.md)
- **🤖 Relacionado**: [Capítulo 2: Desarrollo AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

Esta guía integral de solución de problemas aborda problemas comunes al implementar soluciones de IA con AZD, proporcionando soluciones y técnicas de depuración específicas para servicios de IA de Azure.

## Tabla de Contenidos

- [Problemas con el Servicio de Modelos Microsoft Foundry](../../../../docs/chapter-07-troubleshooting)
- [Problemas con Azure AI Search](../../../../docs/chapter-07-troubleshooting)
- [Problemas de Despliegue en Container Apps](../../../../docs/chapter-07-troubleshooting)
- [Errores de Autenticación y Permisos](../../../../docs/chapter-07-troubleshooting)
- [Fallos en el Despliegue de Modelos](../../../../docs/chapter-07-troubleshooting)
- [Problemas de Rendimiento y Escalado](../../../../docs/chapter-07-troubleshooting)
- [Gestión de Costos y Cuotas](../../../../docs/chapter-07-troubleshooting)
- [Herramientas y Técnicas de Depuración](../../../../docs/chapter-07-troubleshooting)

## Problemas con el Servicio de Modelos Microsoft Foundry

### Problema: Servicio OpenAI No Disponible en la Región

**Síntomas:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Causas:**
- Modelos Microsoft Foundry no disponibles en la región seleccionada
- Cuota agotada en regiones preferidas
- Restricciones de capacidad regional

**Soluciones:**

1. **Verificar Disponibilidad en la Región:**
```bash
# Lista de regiones disponibles para OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Actualizar la Configuración de AZD:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Usar Regiones Alternativas:**
```bicep
// infra/main.bicep - Multi-region fallback
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

1. **Verificar Cuota Actual:**
```bash
# Verificar el uso de la cuota
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Solicitar Incremento de Cuota:**
```bash
# Enviar solicitud de aumento de cuota
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Optimizar Capacidad del Modelo:**
```bicep
// Reduce initial capacity
resource deployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2024-07-18'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 1  // Start with minimal capacity
  }
}
```

### Problema: Versión de API Inválida

**Síntomas:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Soluciones:**

1. **Usar Versión de API Soportada:**
```python
# Usa la versión soportada más reciente
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Verificar Compatibilidad de la Versión de API:**
```bash
# Lista las versiones de API soportadas
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Problemas con Azure AI Search

### Problema: Nivel de Precio del Servicio de Búsqueda Insuficiente

**Síntomas:**
```
Error: Semantic search requires Basic tier or higher
```

**Soluciones:**

1. **Actualizar el Nivel de Precio:**
```bicep
// infra/main.bicep - Use Basic tier
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
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

### Problema: Fallos en la Creación de Índices

**Síntomas:**
```
Error: Cannot create index, insufficient permissions
```

**Soluciones:**

1. **Verificar Claves del Servicio de Búsqueda:**
```bash
# Obtener la clave de administrador del servicio de búsqueda
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Revisar Esquema del Índice:**
```python
# Validar el esquema del índice
from azure.search.documents.indexes import SearchIndexClient
from azure.search.documents.indexes.models import SearchIndex

def validate_index_schema(index_definition):
    """Validate index schema before creation."""
    required_fields = ['id', 'content']
    field_names = [field.name for field in index_definition.fields]
    
    for required in required_fields:
        if required not in field_names:
            raise ValueError(f"Missing required field: {required}")
```

3. **Usar Identidad Administrada:**
```bicep
// Grant search permissions to managed identity
resource searchContributor 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: searchService
  name: guid(searchService.id, containerApp.id, searchIndexDataContributorRole)
  properties: {
    principalId: containerApp.identity.principalId
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '8ebe5a00-799e-43f5-93ac-243d3dce84a7')
    principalType: 'ServicePrincipal'
  }
}
```

## Problemas de Despliegue en Container Apps

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
# requirements.txt - Pin versions for stability
fastapi==0.104.1
uvicorn==0.24.0
openai==1.3.7
azure-identity==1.14.1
azure-keyvault-secrets==4.7.0
azure-search-documents==11.4.0
azure-cosmos==4.5.1
```

3. **Agregar Verificación de Estado (Health Check):**
```python
# main.py - Agregar punto final de verificación de salud
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Problema: Fallos al Iniciar la Aplicación en el Contenedor

**Síntomas:**
```
Error: Container failed to start within timeout period
```

**Soluciones:**

1. **Incrementar Tiempo de Espera para Inicio:**
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
              type: 'startup'
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

2. **Optimizar la Carga del Modelo:**
```python
# Cargar modelos perezosamente para reducir el tiempo de inicio
import asyncio
from contextlib import asynccontextmanager

class ModelManager:
    def __init__(self):
        self._client = None
        
    async def get_client(self):
        if self._client is None:
            self._client = await self._initialize_client()
        return self._client
        
    async def _initialize_client(self):
        # Inicializar el cliente de IA aquí
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Inicio
    app.state.model_manager = ModelManager()
    yield
    # Apagado
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

1. **Verificar Asignaciones de Roles:**
```bash
# Verificar asignaciones de roles actuales
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
# Probar la autenticación de identidad administrada
from azure.identity import DefaultAzureCredential
from azure.core.exceptions import ClientAuthenticationError

async def test_authentication():
    try:
        credential = DefaultAzureCredential()
        token = await credential.get_token("https://cognitiveservices.azure.com/.default")
        print(f"Authentication successful: {token.token[:10]}...")
    except ClientAuthenticationError as e:
        print(f"Authentication failed: {e}")
```

### Problema: Acceso Denegado al Key Vault

**Síntomas:**
```
Error: The user, group or application does not have secrets get permission
```

**Soluciones:**

1. **Conceder Permisos en Key Vault:**
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
# Listar modelos disponibles
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Usar Modelos de Reserva (Fallbacks):**
```bicep
// Model deployment with fallback
@description('Primary model configuration')
param primaryModel object = {
  name: 'gpt-4.1-mini'
  version: '2024-07-18'
}

@description('Fallback model configuration')
param fallbackModel object = {
  name: 'gpt-35-turbo'
  version: '0125'
}

// Try primary model first, fallback if unavailable
resource primaryDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'chat-model'
  properties: {
    model: primaryModel
  }
  sku: {
    name: 'Standard'
    capacity: 10
  }
}
```

3. **Validar Modelo Antes del Despliegue:**
```python
# Validación del modelo antes del despliegue
import httpx

async def validate_model_availability(model_name: str, version: str) -> bool:
    """Check if model is available before deployment."""
    try:
        async with httpx.AsyncClient() as client:
            response = await client.get(
                f"{AZURE_OPENAI_ENDPOINT}/openai/models",
                headers={"api-key": AZURE_OPENAI_API_KEY}
            )
            models = response.json()
            return any(
                model["id"] == f"{model_name}-{version}"
                for model in models.get("data", [])
            )
    except Exception:
        return False
```

## Problemas de Rendimiento y Escalado

### Problema: Respuestas con Latencia Alta

**Síntomas:**
- Tiempos de respuesta > 30 segundos
- Errores de tiempo de espera
- Mala experiencia de usuario

**Soluciones:**

1. **Implementar Tiempos de Espera en Solicitudes:**
```python
# Configurar los tiempos de espera adecuados
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
# Caché Redis para respuestas
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

### Problema: Errores por Memoria Insuficiente

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
# Manejo de modelo eficiente en memoria
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Verificar uso de memoria antes de procesar
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Forzar recolección de basura
            
        result = await self._process_ai_request(request)
        
        # Limpiar después de procesar
        gc.collect()
        return result
```

## Gestión de Costos y Cuotas

### Problema: Costos Altos Inesperados

**Síntomas:**
- Factura de Azure más alta de lo esperado
- Uso de tokens excediendo estimaciones
- Alertas de presupuesto activadas

**Soluciones:**

1. **Implementar Controles de Costos:**
```python
# Seguimiento del uso de tokens
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

2. **Configurar Alertas de Costos:**
```bicep
resource budgetAlert 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-workload-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
    }
    timeGrain: 'Monthly'
    amount: 500  // $500 monthly limit
    category: 'Cost'
    notifications: {
      Actual_GreaterThan_80_Percent: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: ['admin@company.com']
        contactRoles: ['Owner']
      }
    }
  }
}
```

3. **Optimizar Selección de Modelos:**
```python
# Selección de modelo consciente del costo
MODEL_COSTS = {
    'gpt-4.1-mini': 0.00015,  # por cada 1K tokens
    'gpt-4.1': 0.03,          # por cada 1K tokens
    'gpt-35-turbo': 0.0015  # por cada 1K tokens
}

def select_model_by_cost(complexity: str, budget_remaining: float) -> str:
    """Select model based on complexity and budget."""
    if complexity == 'simple' or budget_remaining < 10:
        return 'gpt-4.1-mini'
    elif complexity == 'medium':
        return 'gpt-35-turbo'
    else:
        return 'gpt-4.1'
```

## Herramientas y Técnicas de Depuración

### Comandos de Depuración de AZD

```bash
# Habilitar registro detallado
azd up --debug

# Verificar el estado del despliegue
azd show

# Ver registros de la aplicación (abre el panel de monitoreo)
azd monitor --logs

# Ver métricas en tiempo real
azd monitor --live

# Verificar las variables de entorno
azd env get-values
```

### Comandos de Extensión AZD AI para Diagnóstico

Si desplegaste agentes usando `azd ai agent init`, estas herramientas adicionales están disponibles:

```bash
# Asegúrese de que la extensión de agentes esté instalada
azd extension install azure.ai.agents

# Re-inicializar o actualizar un agente desde un manifiesto
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Utilice el servidor MCP para permitir que las herramientas de IA consulten el estado del proyecto
azd mcp start

# Generar archivos de infraestructura para revisión y auditoría
azd infra generate
```

> **Consejo:** Usa `azd infra generate` para escribir IaC en disco y poder inspeccionar exactamente qué recursos se aprovisionaron. Esto es invaluable al depurar problemas de configuración de recursos. Consulta la [referencia AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para detalles completos.

### Depuración de Aplicaciones

1. **Registro Estructurado:**
```python
import logging
import json

# Configurar el registro estructurado para aplicaciones de IA
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

2. **Puntos de Verificación de Estado (Health Check Endpoints):**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Verificar conectividad con OpenAI
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Verificar servicio de búsqueda
    try:
        search_client = SearchIndexClient(
            endpoint=AZURE_SEARCH_ENDPOINT,
            credential=DefaultAzureCredential()
        )
        indexes = await search_client.list_index_names()
        checks['search'] = {'status': 'healthy', 'indexes': list(indexes)}
    except Exception as e:
        checks['search'] = {'status': 'unhealthy', 'error': str(e)}
    
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
|-----------------|-------------|----------|
| 401 | No autorizado | Verificar claves de API y configuración de identidad administrada |
| 403 | Prohibido | Verificar asignaciones de roles RBAC |
| 429 | Límite de tasa alcanzado | Implementar lógica de reintentos con retroceso exponencial |
| 500 | Error Interno del Servidor | Verificar estado del despliegue del modelo y registros |
| 503 | Servicio No Disponible | Verificar estado del servicio y disponibilidad regional |

## Próximos Pasos

1. **Revisar la [Guía de Despliegue de Modelos de IA](../chapter-02-ai-development/ai-model-deployment.md)** para mejores prácticas de despliegue
2. **Completar [Prácticas de IA en Producción](../chapter-08-production/production-ai-practices.md)** para soluciones listas para empresa
3. **Unirse al [Discord de Microsoft Foundry](https://aka.ms/foundry/discord)** para soporte comunitario
4. **Reportar problemas** en el [repositorio GitHub de AZD](https://github.com/Azure/azure-dev) para problemas específicos de AZD

## Recursos

- [Solución de Problemas del Servicio de Modelos Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Solución de Problemas en Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Solución de Problemas en Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Instala habilidades de solución de problemas de Azure en tu editor: `npx skills add microsoft/github-copilot-for-azure`

---

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 7 - Solución de Problemas y Depuración
- **⬅️ Anterior**: [Guía de Depuración](debugging.md)
- **➡️ Próximo Capítulo**: [Capítulo 8: Patrones de Producción y Empresariales](../chapter-08-production/production-ai-practices.md)
- **🤖 Relacionado**: [Capítulo 2: Desarrollo AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Referencia**: [Solución de Problemas del Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso legal**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por alcanzar la precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. Se debe considerar el documento original en su idioma nativo como la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por un humano. No nos hacemos responsables de ningún malentendido o interpretación errónea derivada del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->