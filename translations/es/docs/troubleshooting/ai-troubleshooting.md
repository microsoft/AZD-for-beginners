<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b5ae13b6a245ab3a2e6dae923aab65bd",
  "translation_date": "2025-11-19T20:33:20+00:00",
  "source_file": "docs/troubleshooting/ai-troubleshooting.md",
  "language_code": "es"
}
-->
# Guía de Solución de Problemas Específica de IA

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 7 - Solución de Problemas y Depuración
- **⬅️ Anterior**: [Guía de Depuración](debugging.md)
- **➡️ Próximo Capítulo**: [Capítulo 8: Patrones de Producción y Empresariales](../microsoft-foundry/production-ai-practices.md)
- **🤖 Relacionado**: [Capítulo 2: Desarrollo con IA como Prioridad](../microsoft-foundry/microsoft-foundry-integration.md)

**Anterior:** [Prácticas de Producción con IA](../microsoft-foundry/production-ai-practices.md) | **Próximo:** [Introducción a AZD](../getting-started/README.md)

Esta guía integral de solución de problemas aborda los problemas comunes al implementar soluciones de IA con AZD, proporcionando soluciones y técnicas de depuración específicas para los servicios de Azure AI.

## Tabla de Contenidos

- [Problemas con el Servicio Azure OpenAI](../../../../docs/troubleshooting)
- [Problemas con Azure AI Search](../../../../docs/troubleshooting)
- [Problemas de Implementación de Aplicaciones en Contenedores](../../../../docs/troubleshooting)
- [Errores de Autenticación y Permisos](../../../../docs/troubleshooting)
- [Fallos en la Implementación de Modelos](../../../../docs/troubleshooting)
- [Problemas de Rendimiento y Escalabilidad](../../../../docs/troubleshooting)
- [Gestión de Costos y Cuotas](../../../../docs/troubleshooting)
- [Herramientas y Técnicas de Depuración](../../../../docs/troubleshooting)

## Problemas con el Servicio Azure OpenAI

### Problema: Servicio OpenAI No Disponible en la Región

**Síntomas:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Causas:**
- Azure OpenAI no está disponible en la región seleccionada
- Cuota agotada en las regiones preferidas
- Restricciones de capacidad regional

**Soluciones:**

1. **Verificar Disponibilidad Regional:**
```bash
# Enumerar las regiones disponibles para OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Actualizar Configuración de AZD:**
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

### Problema: Cuota de Implementación de Modelos Excedida

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

3. **Optimizar la Capacidad del Modelo:**
```bicep
// Reduce initial capacity
resource deployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
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

1. **Usar una Versión de API Compatible:**
```python
# Usar la última versión compatible
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Verificar Compatibilidad de la Versión de API:**
```bash
# Enumerar las versiones de API compatibles
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Problemas con Azure AI Search

### Problema: Nivel de Precios del Servicio de Búsqueda Insuficiente

**Síntomas:**
```
Error: Semantic search requires Basic tier or higher
```

**Soluciones:**

1. **Actualizar el Nivel de Precios:**
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

2. **Desactivar Búsqueda Semántica (Desarrollo):**
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

1. **Verificar las Claves del Servicio de Búsqueda:**
```bash
# Obtener la clave de administrador del servicio de búsqueda
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Revisar el Esquema del Índice:**
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

## Problemas de Implementación de Aplicaciones en Contenedores

### Problema: Fallos en la Construcción del Contenedor

**Síntomas:**
```
Error: Failed to build container image
```

**Soluciones:**

1. **Revisar la Sintaxis del Dockerfile:**
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

3. **Agregar Verificación de Salud:**
```python
# main.py - Agregar punto final de verificación de salud
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

1. **Aumentar el Tiempo de Espera de Inicio:**
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
# Cargar modelos de forma diferida para reducir el tiempo de inicio
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
Error: Authentication failed for Azure OpenAI Service
```

**Soluciones:**

1. **Verificar Asignaciones de Roles:**
```bash
# Verificar las asignaciones de roles actuales
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

### Problema: Acceso Denegado a Key Vault

**Síntomas:**
```
Error: The user, group or application does not have secrets get permission
```

**Soluciones:**

1. **Conceder Permisos de Key Vault:**
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

## Fallos en la Implementación de Modelos

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

2. **Usar Modelos Alternativos:**
```bicep
// Model deployment with fallback
@description('Primary model configuration')
param primaryModel object = {
  name: 'gpt-4o-mini'
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

3. **Validar el Modelo Antes de Implementarlo:**
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

## Problemas de Rendimiento y Escalabilidad

### Problema: Respuestas con Alta Latencia

**Síntomas:**
- Tiempos de respuesta > 30 segundos
- Errores de tiempo de espera
- Mala experiencia del usuario

**Soluciones:**

1. **Implementar Tiempos de Espera en las Solicitudes:**
```python
# Configurar tiempos de espera adecuados
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
# Caché de Redis para respuestas
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

### Problema: Errores de Memoria Insuficiente

**Síntomas:**
```
Error: Container killed due to memory limit exceeded
```

**Soluciones:**

1. **Aumentar la Asignación de Memoria:**
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

2. **Optimizar el Uso de Memoria:**
```python
# Manejo eficiente de memoria del modelo
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Verificar el uso de memoria antes de procesar
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Forzar la recolección de basura
            
        result = await self._process_ai_request(request)
        
        # Limpiar después de procesar
        gc.collect()
        return result
```

## Gestión de Costos y Cuotas

### Problema: Costos Altos Inesperados

**Síntomas:**
- Factura de Azure más alta de lo esperado
- Uso de tokens excediendo las estimaciones
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

3. **Optimizar la Selección de Modelos:**
```python
# Selección de modelo consciente del costo
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # por 1K tokens
    'gpt-4': 0.03,          # por 1K tokens
    'gpt-35-turbo': 0.0015  # por 1K tokens
}

def select_model_by_cost(complexity: str, budget_remaining: float) -> str:
    """Select model based on complexity and budget."""
    if complexity == 'simple' or budget_remaining < 10:
        return 'gpt-4o-mini'
    elif complexity == 'medium':
        return 'gpt-35-turbo'
    else:
        return 'gpt-4'
```

## Herramientas y Técnicas de Depuración

### Comandos de Depuración de AZD

```bash
# Habilitar registro detallado
azd up --debug

# Verificar el estado de la implementación
azd show

# Ver los registros de la implementación
azd logs --follow

# Verificar las variables de entorno
azd env get-values
```

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

2. **Puntos de Verificación de Salud:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Comprobar la conectividad de OpenAI
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Comprobar el servicio de búsqueda
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
| 401 | No Autorizado | Verificar claves de API y configuración de identidad administrada |
| 403 | Prohibido | Verificar asignaciones de roles RBAC |
| 429 | Límite de Tasa | Implementar lógica de reintento con retroceso exponencial |
| 500 | Error Interno del Servidor | Verificar estado de implementación del modelo y registros |
| 503 | Servicio No Disponible | Verificar estado del servicio y disponibilidad regional |

## Próximos Pasos

1. **Revisar [Guía de Implementación de Modelos de IA](ai-model-deployment.md)** para mejores prácticas de implementación
2. **Completar [Prácticas de Producción con IA](production-ai-practices.md)** para soluciones listas para empresas
3. **Unirse al [Discord de Microsoft Foundry](https://aka.ms/foundry/discord)** para soporte comunitario
4. **Enviar problemas** al [repositorio de GitHub de AZD](https://github.com/Azure/azure-dev) para problemas específicos de AZD

## Recursos

- [Solución de Problemas del Servicio Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Solución de Problemas de Aplicaciones en Contenedores](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Solución de Problemas de Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 7 - Solución de Problemas y Depuración
- **⬅️ Anterior**: [Guía de Depuración](debugging.md)
- **➡️ Próximo Capítulo**: [Capítulo 8: Patrones de Producción y Empresariales](../microsoft-foundry/production-ai-practices.md)
- **🤖 Relacionado**: [Capítulo 2: Desarrollo con IA como Prioridad](../microsoft-foundry/microsoft-foundry-integration.md)
- [Solución de Problemas de Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por lograr precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que surjan del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->