<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c8ab8fd8ed338b3ec17484b453dcda68",
  "translation_date": "2025-09-18T08:32:52+00:00",
  "source_file": "docs/troubleshooting/ai-troubleshooting.md",
  "language_code": "tl"
}
-->
# Gabay sa Pag-aayos ng Problema para sa AI

**Pag-navigate sa Kabanata:**
- **📚 Course Home**: [AZD Para sa Mga Baguhan](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 7 - Pag-aayos at Pag-debug
- **⬅️ Nakaraan**: [Gabay sa Pag-debug](debugging.md)
- **➡️ Susunod na Kabanata**: [Kabanata 8: Mga Pattern para sa Produksyon at Enterprise](../ai-foundry/production-ai-practices.md)
- **🤖 Kaugnay**: [Kabanata 2: AI-First Development](../ai-foundry/azure-ai-foundry-integration.md)

**Nakaraan:** [Mga Praktika sa Produksyon ng AI](../ai-foundry/production-ai-practices.md) | **Susunod:** [Pagsisimula sa AZD](../getting-started/README.md)

Ang komprehensibong gabay na ito ay tumutugon sa mga karaniwang isyu sa pag-deploy ng mga solusyon sa AI gamit ang AZD, at nagbibigay ng mga solusyon at teknik sa pag-debug na partikular para sa mga serbisyo ng Azure AI.

## Talaan ng Nilalaman

- [Mga Isyu sa Azure OpenAI Service](../../../../docs/troubleshooting)
- [Mga Problema sa Azure AI Search](../../../../docs/troubleshooting)
- [Mga Isyu sa Pag-deploy ng Container Apps](../../../../docs/troubleshooting)
- [Mga Error sa Authentication at Pahintulot](../../../../docs/troubleshooting)
- [Mga Pagkabigo sa Pag-deploy ng Modelo](../../../../docs/troubleshooting)
- [Mga Isyu sa Performance at Scaling](../../../../docs/troubleshooting)
- [Pamamahala sa Gastos at Quota](../../../../docs/troubleshooting)
- [Mga Kasangkapan at Teknik sa Pag-debug](../../../../docs/troubleshooting)

## Mga Isyu sa Azure OpenAI Service

### Isyu: Hindi Magamit ang OpenAI Service sa Rehiyon

**Sintomas:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Mga Sanhi:**
- Hindi magagamit ang Azure OpenAI sa napiling rehiyon
- Naubos ang quota sa mga gustong rehiyon
- Mga limitasyon sa kapasidad ng rehiyon

**Mga Solusyon:**

1. **Suriin ang Availability ng Rehiyon:**
```bash
# List available regions for OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **I-update ang Konpigurasyon ng AZD:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Gumamit ng Alternatibong Rehiyon:**
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

### Isyu: Lumampas sa Quota ng Pag-deploy ng Modelo

**Sintomas:**
```
Error: Deployment failed due to insufficient quota
```

**Mga Solusyon:**

1. **Suriin ang Kasalukuyang Quota:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Humiling ng Pagtaas ng Quota:**
```bash
# Submit quota increase request
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **I-optimize ang Kapasidad ng Modelo:**
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

### Isyu: Hindi Wastong Bersyon ng API

**Sintomas:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Mga Solusyon:**

1. **Gumamit ng Sinusuportahang Bersyon ng API:**
```python
# Use latest supported version
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Suriin ang Compatibility ng Bersyon ng API:**
```bash
# List supported API versions
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Mga Problema sa Azure AI Search

### Isyu: Hindi Sapat ang Pricing Tier ng Search Service

**Sintomas:**
```
Error: Semantic search requires Basic tier or higher
```

**Mga Solusyon:**

1. **I-upgrade ang Pricing Tier:**
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

2. **I-disable ang Semantic Search (Para sa Development):**
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

### Isyu: Mga Pagkabigo sa Paglikha ng Index

**Sintomas:**
```
Error: Cannot create index, insufficient permissions
```

**Mga Solusyon:**

1. **I-verify ang Search Service Keys:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Suriin ang Index Schema:**
```python
# Validate index schema
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

3. **Gumamit ng Managed Identity:**
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

## Mga Isyu sa Pag-deploy ng Container Apps

### Isyu: Mga Pagkabigo sa Pag-build ng Container

**Sintomas:**
```
Error: Failed to build container image
```

**Mga Solusyon:**

1. **Suriin ang Syntax ng Dockerfile:**
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

2. **I-validate ang Mga Dependency:**
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

3. **Magdagdag ng Health Check:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Isyu: Mga Pagkabigo sa Startup ng Container App

**Sintomas:**
```
Error: Container failed to start within timeout period
```

**Mga Solusyon:**

1. **Dagdagan ang Startup Timeout:**
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

2. **I-optimize ang Pag-load ng Modelo:**
```python
# Lazy load models to reduce startup time
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

## Mga Error sa Authentication at Pahintulot

### Isyu: Tinanggihan ang Pahintulot ng Managed Identity

**Sintomas:**
```
Error: Authentication failed for Azure OpenAI Service
```

**Mga Solusyon:**

1. **I-verify ang Mga Role Assignment:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Mag-assign ng Kinakailangang Mga Role:**
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

3. **Subukan ang Authentication:**
```python
# Test managed identity authentication
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

### Isyu: Tinanggihan ang Access sa Key Vault

**Sintomas:**
```
Error: The user, group or application does not have secrets get permission
```

**Mga Solusyon:**

1. **Magbigay ng Mga Pahintulot sa Key Vault:**
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

2. **Gumamit ng RBAC sa Halip na Access Policies:**
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

## Mga Pagkabigo sa Pag-deploy ng Modelo

### Isyu: Hindi Magagamit ang Bersyon ng Modelo

**Sintomas:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Mga Solusyon:**

1. **Suriin ang Mga Magagamit na Modelo:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Gumamit ng Mga Model Fallback:**
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

3. **I-validate ang Modelo Bago ang Pag-deploy:**
```python
# Pre-deployment model validation
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

## Mga Isyu sa Performance at Scaling

### Isyu: Mataas na Latency ng Tugon

**Sintomas:**
- Mga oras ng tugon > 30 segundo
- Mga error sa timeout
- Hindi magandang karanasan ng user

**Mga Solusyon:**

1. **Magpatupad ng Request Timeouts:**
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

2. **Magdagdag ng Response Caching:**
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

3. **I-configure ang Auto-scaling:**
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

### Isyu: Mga Error sa Memory Out

**Sintomas:**
```
Error: Container killed due to memory limit exceeded
```

**Mga Solusyon:**

1. **Dagdagan ang Memory Allocation:**
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

2. **I-optimize ang Paggamit ng Memory:**
```python
# Memory-efficient model handling
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
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

## Pamamahala sa Gastos at Quota

### Isyu: Hindi Inaasahang Mataas na Gastos

**Sintomas:**
- Mas mataas ang Azure bill kaysa inaasahan
- Lumampas ang paggamit ng token sa mga pagtatantya
- Na-trigger ang mga alerto sa badyet

**Mga Solusyon:**

1. **Magpatupad ng Mga Kontrol sa Gastos:**
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

2. **Mag-set up ng Mga Alerto sa Gastos:**
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

3. **I-optimize ang Pagpili ng Modelo:**
```python
# Cost-aware model selection
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # per 1K tokens
    'gpt-4': 0.03,          # per 1K tokens
    'gpt-35-turbo': 0.0015  # per 1K tokens
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

## Mga Kasangkapan at Teknik sa Pag-debug

### Mga Command sa Pag-debug ng AZD

```bash
# Enable verbose logging
azd up --debug

# Check deployment status
azd show

# View deployment logs
azd logs --follow

# Check environment variables
azd env get-values
```

### Pag-debug ng Aplikasyon

1. **Structured Logging:**
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

2. **Health Check Endpoints:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Check OpenAI connectivity
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Check Search service
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

3. **Performance Monitoring:**
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

## Mga Karaniwang Error Code at Solusyon

| Error Code | Paglalarawan | Solusyon |
|------------|-------------|----------|
| 401 | Unauthorized | Suriin ang API keys at managed identity configuration |
| 403 | Forbidden | I-verify ang RBAC role assignments |
| 429 | Rate Limited | Magpatupad ng retry logic na may exponential backoff |
| 500 | Internal Server Error | Suriin ang status ng pag-deploy ng modelo at mga log |
| 503 | Service Unavailable | I-verify ang kalusugan ng serbisyo at availability ng rehiyon |

## Mga Susunod na Hakbang

1. **Suriin ang [Gabay sa Pag-deploy ng AI Model](ai-model-deployment.md)** para sa mga pinakamahusay na praktika sa pag-deploy
2. **Kumpletuhin ang [Mga Praktika sa Produksyon ng AI](production-ai-practices.md)** para sa mga solusyong handa sa enterprise
3. **Sumali sa [Azure AI Foundry Discord](https://aka.ms/foundry/discord)** para sa suporta ng komunidad
4. **Mag-submit ng mga isyu** sa [AZD GitHub repository](https://github.com/Azure/azure-dev) para sa mga partikular na problema sa AZD

## Mga Mapagkukunan

- [Azure OpenAI Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**Pag-navigate sa Kabanata:**
- **📚 Course Home**: [AZD Para sa Mga Baguhan](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 7 - Pag-aayos at Pag-debug
- **⬅️ Nakaraan**: [Gabay sa Pag-debug](debugging.md)
- **➡️ Susunod na Kabanata**: [Kabanata 8: Mga Pattern para sa Produksyon at Enterprise](../ai-foundry/production-ai-practices.md)
- **🤖 Kaugnay**: [Kabanata 2: AI-First Development](../ai-foundry/azure-ai-foundry-integration.md)
- [Azure Developer CLI Troubleshooting](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa kanyang katutubong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.