# Tiyak na Gabay sa Pag-troubleshoot ng AI

**Pag-navigate ng Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 7 - Pag-troubleshoot at Pag-debug
- **⬅️ Nakaraan**: [Gabay sa Pag-debug](debugging.md)
- **➡️ Susunod na Kabanata**: [Kabanata 8: Mga Pattern sa Produksyon at Enterprise](../chapter-08-production/production-ai-practices.md)
- **🤖 Mga Kaugnay**: [Kabanata 2: Pag-unlad na Nakatuon sa AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

Ang komprehensibong gabay na ito sa pag-troubleshoot ay tumatalakay sa mga karaniwang isyu kapag nag-deploy ng mga solusyon na AI gamit ang AZD, nagbibigay ng mga solusyon at mga teknik sa pag-debug na partikular sa mga serbisyo ng Azure AI.

## Talaan ng Nilalaman

- [Microsoft Foundry Models Service Issues](#azure-openai-service-issues)
- [Azure AI Search Problems](#mga-problema-sa-azure-ai-search)
- [Container Apps Deployment Issues](#mga-isyu-sa-pag-deploy-ng-container-apps)
- [Authentication and Permission Errors](#mga-error-sa-pag-auntentika-at-mga-pahintulot)
- [Model Deployment Failures](#mga-pagkabigo-sa-pag-deploy-ng-modelo)
- [Performance and Scaling Issues](#mga-isyu-sa-performance-at-scaling)
- [Cost and Quota Management](#pamamahala-ng-gastos-at-quota)
- [Debugging Tools and Techniques](#mga-tool-at-teknik-sa-pag-debug)

## Mga Isyu sa Microsoft Foundry Models Service

### Isyu: Serbisyo ng OpenAI Hindi Magagamit sa Rehiyon

**Sintomas:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Mga Sanhi:**
- Hindi magagamit ang Microsoft Foundry Models sa napiling rehiyon
- Naubos ang quota sa mga napiling rehiyon
- Mga limitasyon sa kapasidad ng rehiyon

**Mga Solusyon:**

1. **Suriin kung available ang rehiyon:**
```bash
# Ilista ang mga magagamit na rehiyon para sa OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **I-update ang Konfigurasyon ng AZD:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Gumamit ng Ibang Rehiyon:**
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

### Isyu: Lampas ang Quota sa Pag-deploy ng Modelo

**Sintomas:**
```
Error: Deployment failed due to insufficient quota
```

**Mga Solusyon:**

1. **Suriin ang Kasalukuyang Quota:**
```bash
# Suriin ang paggamit ng quota
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Hilingin ang Pagtaas ng Quota:**
```bash
# Isumite ang kahilingan para sa pagtaas ng quota
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

### Isyu: Hindi Wastong Bersyon ng API

**Sintomas:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Mga Solusyon:**

1. **Gumamit ng Sinusuportahang Bersyon ng API:**
```python
# Gamitin ang pinakabagong sinusuportahang bersyon
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Suriin ang Kompatibilidad ng Bersyon ng API:**
```bash
# Ilista ang mga suportadong bersyon ng API
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Mga Problema sa Azure AI Search

### Isyu: Hindi Sapat ang Antas ng Pagpepresyo ng Search Service

**Sintomas:**
```
Error: Semantic search requires Basic tier or higher
```

**Mga Solusyon:**

1. **I-upgrade ang Antas ng Pagpepresyo:**
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

### Isyu: Nabigo ang Paglikha ng Index

**Sintomas:**
```
Error: Cannot create index, insufficient permissions
```

**Mga Solusyon:**

1. **I-verify ang mga Key ng Search Service:**
```bash
# Kunin ang admin key ng search service
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Suriin ang Index Schema:**
```python
# I-validate ang schema ng index
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

### Isyu: Nabigong Pag-build ng Container

**Sintomas:**
```
Error: Failed to build container image
```

**Mga Solusyon:**

1. **Suriin ang Sintaks ng Dockerfile:**
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

2. **I-validate ang mga dependency:**
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
# main.py - Magdagdag ng endpoint para sa pagsusuri ng katayuan
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Isyu: Nabigong Pag-start ng Container App

**Sintomas:**
```
Error: Container failed to start within timeout period
```

**Mga Solusyon:**

1. **Palawigin ang Startup Timeout:**
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

2. **I-optimize ang Paglo-load ng Modelo:**
```python
# Mag-lazy-load ng mga modelo upang bawasan ang oras ng pagsisimula
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
        # I-initialize ang kliyente ng AI dito
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Pagsisimula
    app.state.model_manager = ModelManager()
    yield
    # Pagsasara
    pass

app = FastAPI(lifespan=lifespan)
```

## Mga Error sa Pag-auntentika at mga Pahintulot

### Isyu: Tinatanggihan ang Pahintulot ng Managed Identity

**Sintomas:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Mga Solusyon:**

1. **Suriin ang mga Role na Itinalaga:**
```bash
# Suriin ang kasalukuyang mga pagtatalaga ng tungkulin
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Italaga ang Kinakailangang Mga Role:**
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

3. **Subukan ang Pag-auntentika:**
```python
# Subukan ang pagpapatunay ng pinamamahalaang identidad
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

1. **Ibigay ang Mga Pahintulot sa Key Vault:**
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

2. **Gamitin ang RBAC sa halip na Access Policies:**
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
# Ilista ang mga magagamit na modelo
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Gumamit ng Model Fallbacks:**
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

3. **I-validate ang Modelo Bago ang Pag-deploy:**
```python
# Pagpapatunay ng modelo bago i-deploy
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

### Isyu: Mataas na Latency ng Mga Tugon

**Sintomas:**
- Oras ng tugon > 30 segundo
- Mga error sa timeout
- Mahinang karanasan ng gumagamit

**Mga Solusyon:**

1. **Magpatupad ng Timeout para sa Mga Request:**
```python
# I-configure ang tamang mga timeout
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

2. **Magdagdag ng Caching para sa Mga Tugon:**
```python
# Redis cache para sa mga tugon
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

### Isyu: Mga Error na Nauubos ang Memorya

**Sintomas:**
```
Error: Container killed due to memory limit exceeded
```

**Mga Solusyon:**

1. **Dagdagan ang Alokasyon ng Memorya:**
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

2. **I-optimize ang Paggamit ng Memorya:**
```python
# Pamamahala ng modelo na matipid sa memorya
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Suriin ang paggamit ng memorya bago magproseso
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Pilitin ang garbage collection
            
        result = await self._process_ai_request(request)
        
        # Linisin pagkatapos ng pagproseso
        gc.collect()
        return result
```

## Pamamahala ng Gastos at Quota

### Isyu: Di-inaasahang Mataas na Gastos

**Sintomas:**
- Mas mataas ang bill ng Azure kaysa inaasahan
- Paggamit ng token na lumalampas sa mga tantya
- Na-trigger ang mga alerto sa badyet

**Mga Solusyon:**

1. **Magpatupad ng Mga Kontrol sa Gastos:**
```python
# Pagsubaybay sa paggamit ng token
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

2. **Magtakda ng Mga Alerto sa Gastos:**
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
# Pagpili ng modelo na isinasaalang-alang ang gastos
MODEL_COSTS = {
    'gpt-4.1-mini': 0.00015,  # kada 1K token
    'gpt-4.1': 0.03,          # kada 1K token
    'gpt-35-turbo': 0.0015  # kada 1K token
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

## Mga Tool at Teknik sa Pag-debug

### Mga AZD Command para sa Pag-debug

```bash
# Paganahin ang detalyadong pag-log
azd up --debug

# Suriin ang katayuan ng deployment
azd show

# Tingnan ang mga log ng aplikasyon (nagbubukas ng dashboard ng pagmamanman)
azd monitor --logs

# Tingnan ang mga real-time na metriko
azd monitor --live

# Suriin ang mga variable ng kapaligiran
azd env get-values
```

### Mga AZD AI Extension Command para sa Diagnostics

Kung nag-deploy ka ng mga agent gamit ang `azd ai agent init`, ang mga karagdagang kasangkapang ito ay magagamit:

```bash
# Tiyaking naka-install ang extension ng mga agent
azd extension install azure.ai.agents

# Muling i-initialize o i-update ang isang agent mula sa manifest
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Gamitin ang MCP server upang payagan ang mga AI tool na i-query ang estado ng proyekto
azd mcp start

# Gumawa ng mga file ng imprastruktura para sa pagsusuri at pag-audit
azd infra generate
```

> **Tip:** Gamitin ang `azd infra generate` upang isulat ang IaC sa disk upang masuri nang eksakto kung ano ang mga resource na na-provision. Napakahalaga nito kapag nag-de-debug ng mga isyu sa konfigurasyon ng resource. Tingnan ang [AZD AI CLI reference](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para sa buong detalye.

### Pag-debug ng Aplikasyon

1. **Istrakturadong Pag-log:**
```python
import logging
import json

# Isaayos ang istrukturadong pag-log para sa mga aplikasyon ng AI
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

2. **Mga Endpoint ng Health Check:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Suriin ang koneksyon sa OpenAI
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Suriin ang serbisyo ng paghahanap
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

3. **Pagsubaybay sa Performance:**
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

## Mga Karaniwang Error Code at Mga Solusyon

| Error Code | Paglalarawan | Solusyon |
|------------|-------------|----------|
| 401 | Hindi Awtorisado | Suriin ang mga API key at konfigurasyon ng managed identity |
| 403 | Ipinagbabawal | Suriin ang mga itinalagang role ng RBAC |
| 429 | Naka-rate limit | Magpatupad ng retry logic na may exponential backoff |
| 500 | Panloob na Error ng Server | Suriin ang status ng pag-deploy ng modelo at mga log |
| 503 | Serbisyo Hindi Magagamit | Suriin ang kalusugan ng serbisyo at availability sa rehiyon |

## Mga Susunod na Hakbang

1. **Suriin ang [Gabay sa Pag-deploy ng Modelong AI](../chapter-02-ai-development/ai-model-deployment.md)** para sa mga pinakamahusay na kasanayan sa pag-deploy
2. **Kumpletuhin ang [Mga Praktis sa Produksyon ng AI](../chapter-08-production/production-ai-practices.md)** para sa mga solusyong handa para sa enterprise
3. **Sumali sa [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** para sa suporta ng komunidad
4. **Mag-submit ng mga isyu** sa [AZD GitHub repository](https://github.com/Azure/azure-dev) para sa mga problemang partikular sa AZD

## Mga Mapagkukunan

- [Pag-troubleshoot ng Microsoft Foundry Models Service](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Pag-troubleshoot ng Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Pag-troubleshoot ng Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Kasanayan sa Azure Diagnostics Agent**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - I-install ang mga kasanayan sa pag-troubleshoot ng Azure sa iyong editor: `npx skills add microsoft/github-copilot-for-azure`

---

**Pag-navigate ng Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 7 - Pag-troubleshoot at Pag-debug
- **⬅️ Nakaraan**: [Gabay sa Pag-debug](debugging.md)
- **➡️ Susunod na Kabanata**: [Kabanata 8: Mga Pattern sa Produksyon at Enterprise](../chapter-08-production/production-ai-practices.md)
- **🤖 Mga Kaugnay**: [Kabanata 2: Pag-unlad na Nakatuon sa AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Sanggunian**: [Pag-troubleshoot ng Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:
Ang dokumentong ito ay isinalin gamit ang AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman sinisikap naming maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatumpak. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na awtoritatibong pinagmulan. Para sa mga kritikal na impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmumula sa paggamit ng salin na ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->