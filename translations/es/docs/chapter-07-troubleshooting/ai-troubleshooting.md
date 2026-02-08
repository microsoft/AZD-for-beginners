# Guía de solución de problemas específica para IA

**Navegación del capítulo:**
- **📚 Inicio del curso**: [AZD For Beginners](../../README.md)
- **📖 Capítulo actual**: Capítulo 7 - Solución de problemas y depuración
- **⬅️ Anterior**: [Debugging Guide](debugging.md)
- **➡️ Próximo capítulo**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 Relacionado**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**Anterior:** [Production AI Practices](../chapter-08-production/production-ai-practices.md) | **Siguiente:** [AZD Basics](../chapter-01-foundation/azd-basics.md)

Esta guía integral de solución de problemas aborda problemas comunes al desplegar soluciones de IA con AZD, proporcionando soluciones y técnicas de depuración específicas para los servicios de Azure AI.

## Tabla de contenidos

- [Problemas del servicio Azure OpenAI](../../../../docs/chapter-07-troubleshooting)
- [Problemas de Azure AI Search](../../../../docs/chapter-07-troubleshooting)
- [Problemas de despliegue de Container Apps](../../../../docs/chapter-07-troubleshooting)
- [Errores de autenticación y permisos](../../../../docs/chapter-07-troubleshooting)
- [Fallas en el despliegue de modelos](../../../../docs/chapter-07-troubleshooting)
- [Problemas de rendimiento y escalado](../../../../docs/chapter-07-troubleshooting)
- [Gestión de costes y cuotas](../../../../docs/chapter-07-troubleshooting)
- [Herramientas y técnicas de depuración](../../../../docs/chapter-07-troubleshooting)

## Azure OpenAI Service Issues

### Issue: OpenAI Service Unavailable in Region

**Síntomas:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Causas:**
- Azure OpenAI no disponible en la región seleccionada
- Cuota agotada en las regiones preferidas
- Restricciones de capacidad regional

**Soluciones:**

1. **Comprobar disponibilidad por región:**
```bash
# Enumera las regiones disponibles para OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Actualizar la configuración de AZD:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Usar regiones alternativas:**
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

### Issue: Model Deployment Quota Exceeded

**Síntomas:**
```
Error: Deployment failed due to insufficient quota
```

**Soluciones:**

1. **Comprobar la cuota actual:**
```bash
# Comprobar el uso de la cuota
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Solicitar aumento de cuota:**
```bash
# Enviar solicitud de aumento de cuota
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Optimizar la capacidad del modelo:**
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

### Issue: Invalid API Version

**Síntomas:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Soluciones:**

1. **Usar una versión de API compatible:**
```python
# Utilice la versión más reciente compatible
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Verificar la compatibilidad de la versión de la API:**
```bash
# Enumerar las versiones de la API compatibles
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search Problems

### Issue: Search Service Pricing Tier Insufficient

**Síntomas:**
```
Error: Semantic search requires Basic tier or higher
```

**Soluciones:**

1. **Actualizar el nivel de precios:**
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

### Issue: Index Creation Failures

**Síntomas:**
```
Error: Cannot create index, insufficient permissions
```

**Soluciones:**

1. **Verificar las claves del servicio de búsqueda:**
```bash
# Obtener la clave de administrador del servicio de búsqueda
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Comprobar el esquema del índice:**
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

3. **Usar Managed Identity:**
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

## Container Apps Deployment Issues

### Issue: Container Build Failures

**Síntomas:**
```
Error: Failed to build container image
```

**Soluciones:**

1. **Verificar la sintaxis del Dockerfile:**
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

2. **Validar dependencias:**
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

3. **Agregar comprobación de estado:**
```python
# main.py - Agregar endpoint de verificación de estado
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Issue: Container App Startup Failures

**Síntomas:**
```
Error: Container failed to start within timeout period
```

**Soluciones:**

1. **Aumentar el tiempo de espera de inicio:**
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

2. **Optimizar la carga del modelo:**
```python
# Cargar modelos de forma perezosa para reducir el tiempo de inicio
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

## Authentication and Permission Errors

### Issue: Managed Identity Permission Denied

**Síntomas:**
```
Error: Authentication failed for Azure OpenAI Service
```

**Soluciones:**

1. **Verificar las asignaciones de roles:**
```bash
# Comprobar las asignaciones de roles actuales
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Asignar los roles requeridos:**
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

3. **Probar la autenticación:**
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

### Issue: Key Vault Access Denied

**Síntomas:**
```
Error: The user, group or application does not have secrets get permission
```

**Soluciones:**

1. **Conceder permisos en Key Vault:**
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

2. **Usar RBAC en lugar de políticas de acceso:**
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

## Model Deployment Failures

### Issue: Model Version Not Available

**Síntomas:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Soluciones:**

1. **Comprobar los modelos disponibles:**
```bash
# Listar modelos disponibles
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Usar alternativas de modelo:**
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

3. **Validar el modelo antes del despliegue:**
```python
# Validación previa al despliegue del modelo
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

## Performance and Scaling Issues

### Issue: High Latency Responses

**Síntomas:**
- Tiempos de respuesta > 30 segundos
- Errores de tiempo de espera
- Mala experiencia de usuario

**Soluciones:**

1. **Implementar tiempos de espera para solicitudes:**
```python
# Configure tiempos de espera adecuados
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

2. **Agregar caché de respuestas:**
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

3. **Configurar escalado automático:**
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

### Issue: Memory Out of Errors

**Síntomas:**
```
Error: Container killed due to memory limit exceeded
```

**Soluciones:**

1. **Aumentar la asignación de memoria:**
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

2. **Optimizar el uso de memoria:**
```python
# Manejo de modelos eficiente en memoria
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Comprobar el uso de memoria antes de procesar
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Forzar la recolección de basura
            
        result = await self._process_ai_request(request)
        
        # Limpiar después del procesamiento
        gc.collect()
        return result
```

## Cost and Quota Management

### Issue: Unexpected High Costs

**Síntomas:**
- Factura de Azure mayor de lo esperado
- Uso de tokens superior a las estimaciones
- Alertas de presupuesto activadas

**Soluciones:**

1. **Implementar controles de costes:**
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

2. **Configurar alertas de costes:**
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

3. **Optimizar la selección de modelos:**
```python
# Selección de modelos consciente de costos
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # por cada 1K tokens
    'gpt-4': 0.03,          # por cada 1K tokens
    'gpt-35-turbo': 0.0015  # por cada 1K tokens
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

## Debugging Tools and Techniques

### AZD Debugging Commands

```bash
# Habilitar registro detallado
azd up --debug

# Comprobar estado del despliegue
azd show

# Ver registros de la aplicación (abre el panel de supervisión)
azd monitor --logs

# Ver métricas en tiempo real
azd monitor --live

# Comprobar variables de entorno
azd env get-values
```

### Application Debugging

1. **Registro estructurado:**
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

2. **Endpoints de comprobación de estado:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Comprobar la conectividad con OpenAI
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

3. **Monitorización del rendimiento:**
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

## Common Error Codes and Solutions

| Error Code | Description | Solution |
|------------|-------------|----------|
| 401 | No autorizado | Comprobar las claves de API y la configuración de Managed Identity |
| 403 | Prohibido | Verificar las asignaciones de roles RBAC |
| 429 | Demasiadas solicitudes | Implementar lógica de reintento con retroceso exponencial |
| 500 | Error interno del servidor | Comprobar el estado del despliegue del modelo y los registros |
| 503 | Servicio no disponible | Verificar la salud del servicio y la disponibilidad regional |

## Next Steps

1. **Revisar [AI Model Deployment Guide](../chapter-02-ai-development/ai-model-deployment.md)** para mejores prácticas de despliegue
2. **Completar [Production AI Practices](../chapter-08-production/production-ai-practices.md)** para soluciones listas para la empresa
3. **Unirse al [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** para soporte comunitario
4. **Enviar issues** al [repositorio de AZD en GitHub](https://github.com/Azure/azure-dev) para problemas específicos de AZD

## Resources

- [Solución de problemas del servicio Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Solución de problemas de Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Solución de problemas de Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**Navegación del capítulo:**
- **📚 Inicio del curso**: [AZD For Beginners](../../README.md)
- **📖 Capítulo actual**: Capítulo 7 - Solución de problemas y depuración
- **⬅️ Anterior**: [Debugging Guide](debugging.md)
- **➡️ Próximo capítulo**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 Relacionado**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- [Solución de problemas de Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por la exactitud, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por un traductor humano. No nos hacemos responsables de ningún malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->