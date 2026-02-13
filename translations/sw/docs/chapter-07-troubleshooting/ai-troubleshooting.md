# Mwongozo wa Utatuzi wa Matatizo Maalum kwa AI

**Uabiri wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD For Beginners](../../README.md)
- **📖 Sura ya Sasa**: Chapter 7 - Troubleshooting & Debugging
- **⬅️ Iliyopita**: [Debugging Guide](debugging.md)
- **➡️ Sura Ifuatayo**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 Inayohusiana**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**Iliyopita:** [Production AI Practices](../chapter-08-production/production-ai-practices.md) | **Ifuatayo:** [AZD Basics](../chapter-01-foundation/azd-basics.md)

Mwongozo huu kamili wa utatuzi wa matatizo unashughulikia masuala ya kawaida wakati wa kutia huduma suluhisho za AI kwa kutumia AZD, na kutoa suluhisho na mbinu za kuweka doa maalum kwa huduma za Azure AI.

## Jedwali la Yaliyomo

- [Matatizo ya Huduma ya Azure OpenAI](../../../../docs/chapter-07-troubleshooting)
- [Matatizo ya Azure AI Search](../../../../docs/chapter-07-troubleshooting)
- [Matatizo ya Uenezaji wa Container Apps](../../../../docs/chapter-07-troubleshooting)
- [Makosa ya Uthibitishaji na Ruhusa](../../../../docs/chapter-07-troubleshooting)
- [Kushindwa kwa Uenezaji wa Mfano](../../../../docs/chapter-07-troubleshooting)
- [Matatizo ya Utendaji na Uenezaji](../../../../docs/chapter-07-troubleshooting)
- [Usimamizi wa Gharama na Vikomo](../../../../docs/chapter-07-troubleshooting)
- [Vifaa na Mbinu za Utatuzi](../../../../docs/chapter-07-troubleshooting)

## Matatizo ya Huduma ya Azure OpenAI

### Tatizo: Huduma ya OpenAI Haipatikani Kanda

**Dalili:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Sababu:**
- Azure OpenAI haipatikani katika kanda iliyochaguliwa
- Kikomo kimeisha katika kanda zinazopendekezwa
- Vizingiti vya uwezo vya kanda

**Suluhisho:**

1. **Angalia Upatikanaji wa Kanda:**
```bash
# Orodhesha mikoa inayopatikana kwa OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Sasisha Usanidi wa AZD:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Tumia Kanda Mbadala:**
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

### Tatizo: Kikomo cha Ueneaji wa Mfano Kimezidiwa

**Dalili:**
```
Error: Deployment failed due to insufficient quota
```

**Suluhisho:**

1. **Kagua Kikomo Kilichopo Sasa:**
```bash
# Angalia matumizi ya kiasi kilichotengwa
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Omba Kuongezwa kwa Kikomo:**
```bash
# Wasilisha ombi la ongezeko la kikomo
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Boresha Uwezo wa Mfano:**
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

### Tatizo: Toleo la API Lisilo Halali

**Dalili:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Suluhisho:**

1. **Tumia Toleo la API Linaloungwa Mkono:**
```python
# Tumia toleo la hivi karibuni linaloungwa mkono
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Angalia Ulinganifu wa Toleo la API:**
```bash
# Orodhesha matoleo za API zinazoungwa mkono
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Matatizo ya Azure AI Search

### Tatizo: Ngazi ya Bei ya Huduma ya Utafutaji Haijitoshi

**Dalili:**
```
Error: Semantic search requires Basic tier or higher
```

**Suluhisho:**

1. **Inua Ngazi ya Bei:**
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

2. **Zima Utafutaji wa Semantiki (Maendeleo):**
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

### Tatizo: Kushindwa Kuunda Index

**Dalili:**
```
Error: Cannot create index, insufficient permissions
```

**Suluhisho:**

1. **Thibitisha Vifunguo vya Huduma ya Utafutaji:**
```bash
# Pata ufunguo wa msimamizi wa huduma ya utafutaji
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Angalia Skimu ya Index:**
```python
# Thibitisha muundo wa index
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

3. **Tumia Utambulisho uliosimamiwa:**
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

## Matatizo ya Uenezaji wa Container Apps

### Tatizo: Kushindwa kwa Ujenzi wa Container

**Dalili:**
```
Error: Failed to build container image
```

**Suluhisho:**

1. **Kagua Muundo wa Dockerfile:**
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

2. **Thibitisha Tegemezi:**
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

3. **Ongeza Ukaguzi wa Afya:**
```python
# main.py - Ongeza endpoint ya ukaguzi wa afya
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Tatizo: Kushindwa Kuanzisha Container App

**Dalili:**
```
Error: Container failed to start within timeout period
```

**Suluhisho:**

1. **Ongeza Muda wa Kuanzisha (Startup Timeout):**
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

2. **Boresha Upakiaji wa Mfano:**
```python
# Pakia modeli kwa utaratibu wa kuchelewesha ili kupunguza muda wa kuanzisha
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
        # Anzisha mteja wa AI hapa
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Uanzishaji
    app.state.model_manager = ModelManager()
    yield
    # Kuzima
    pass

app = FastAPI(lifespan=lifespan)
```

## Makosa ya Uthibitishaji na Ruhusa

### Tatizo: Ruhusa ya Managed Identity Imekataliwa

**Dalili:**
```
Error: Authentication failed for Azure OpenAI Service
```

**Suluhisho:**

1. **Thibitisha Uteuzi wa Nafasi:**
```bash
# Angalia uteuzi wa majukumu wa sasa.
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Weka Nafasi Zinazohitajika:**
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

3. **Jaribu Uthibitishaji:**
```python
# Jaribu uthibitishaji wa utambulisho uliosimamiwa
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

### Tatizo: Ufikiaji wa Key Vault Umezuiwa

**Dalili:**
```
Error: The user, group or application does not have secrets get permission
```

**Suluhisho:**

1. **Toa Ruhusa za Key Vault:**
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

2. **Tumia RBAC Badala ya Sera za Ufikiaji:**
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

## Kushindwa kwa Uenezaji wa Mfano

### Tatizo: Toleo la Mfano Halipatikani

**Dalili:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Suluhisho:**

1. **Angalia Mifano Inayopatikana:**
```bash
# Orodhesha modeli zilizopo
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Tumia Mbadala za Mfano:**
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

3. **Thibitisha Mfano Kabla ya Uenezaji:**
```python
# Uthibitishaji wa modeli kabla ya uanzishaji
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

## Matatizo ya Utendaji na Uenezaji

### Tatizo: Majibu ya Ucheleweshaji Mkubwa

**Dalili:**
- Muda wa majibu > sekunde 30
- Makosa ya muda wa kumalizika (timeout)
- Uzoefu mbaya wa mtumiaji

**Suluhisho:**

1. **Tekeleza Muda wa Kumaliza Maombi:**
```python
# Sanidi muda wa kusubiri unaofaa
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

2. **Ongeza Akiba ya Majibu:**
```python
# Kache ya Redis kwa majibu
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

3. **Sanidi Kueneza Kiotomatiki (Auto-scaling):**
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

### Tatizo: Makosa ya Kuisha Kumbukumbu

**Dalili:**
```
Error: Container killed due to memory limit exceeded
```

**Suluhisho:**

1. **Ongeza Ugawaji wa Kumbukumbu:**
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

2. **Boresha Matumizi ya Kumbukumbu:**
```python
# Usimamizi wa modeli unaotumia kumbukumbu kwa ufanisi
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Kagua matumizi ya kumbukumbu kabla ya kuchakata
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Lazimisha ukusanyaji wa taka
            
        result = await self._process_ai_request(request)
        
        # Safisha baada ya kuchakata
        gc.collect()
        return result
```

## Usimamizi wa Gharama na Vikomo

### Tatizo: Gharama Isiyotarajiwa Juu

**Dalili:**
- Anuani ya Azure iko juu kuliko ilivyotarajiwa
- Matumizi ya token yanazidi makisio
- Alarm za bajeti zimewashwa

**Suluhisho:**

1. **Tekeleza Udhibiti wa Gharama:**
```python
# Ufuatiliaji wa matumizi ya tokeni
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

2. **Anzisha Tahadhari za Gharama:**
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

3. **Boresha Uchaguo wa Mfano:**
```python
# Uchaguzi wa modeli unaozingatia gharama
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # kwa kila 1K tokeni
    'gpt-4': 0.03,          # kwa kila 1K tokeni
    'gpt-35-turbo': 0.0015  # kwa kila 1K tokeni
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

## Vifaa na Mbinu za Utatuzi

### Amri za Utatuzi za AZD

```bash
# Washa uandishi wa kumbukumbu wa kina
azd up --debug

# Kagua hali ya utoaji
azd show

# Tazama kumbukumbu za programu (inafungua dashibodi ya ufuatiliaji)
azd monitor --logs

# Tazama vipimo vya moja kwa moja
azd monitor --live

# Kagua vigezo vya mazingira
azd env get-values
```

### Kurekebisha Hitilafu za Programu

1. **Uandishi wa Logi uliopangwa:**
```python
import logging
import json

# Sanidi kurekodi kumbukumbu zenye muundo kwa programu za inteligensia ya bandia
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

2. **Endpoints za Ukaguzi wa Afya:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Kagua uunganishaji wa OpenAI
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Kagua huduma ya utaftaji
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

3. **Ufuatiliaji wa Utendaji:**
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

## Msimbo wa Makosa ya Kawaida na Suluhisho

| Msimbo wa Hitilafu | Maelezo | Suluhisho |
|------------|-------------|----------|
| 401 | Hauruhusiwi | Angalia funguo za API na usanidi wa managed identity |
| 403 | Imekataliwa | Thibitisha uteuzi wa nyadhifa za RBAC |
| 429 | Kikwazo cha Kiwango | Tekeleza mantiki ya jaribio tena kwa mbinu ya exponential backoff |
| 500 | Hitilafu ya Ndani ya Seva | Kagua hali ya uenezaji wa mfano na logi |
| 503 | Huduma Haipatikani | Thibitisha afya ya huduma na upatikanaji wa kanda |

## Hatua Zifuatazo

1. **Kagua [Mwongozo wa Uenezaji wa Modeli za AI](../chapter-02-ai-development/ai-model-deployment.md)** kwa mbinu bora za uenezaji
2. **Kamilisha [Production AI Practices](../chapter-08-production/production-ai-practices.md)** kwa suluhisho za kampuni zenye uzalishaji
3. **Jiunge na [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** kwa msaada wa jamii
4. **Wasilisha masuala** kwenye [Hazina ya GitHub ya AZD](https://github.com/Azure/azure-dev) kwa matatizo maalum ya AZD

## Rasilimali

- [Utatuzi wa Matatizo wa Huduma ya Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Utatuzi wa Matatizo wa Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Utatuzi wa Matatizo wa Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**Uabiri wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD For Beginners](../../README.md)
- **📖 Sura ya Sasa**: Chapter 7 - Troubleshooting & Debugging
- **⬅️ Iliyopita**: [Debugging Guide](debugging.md)
- **➡️ Sura Ifuatayo**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 Inayohusiana**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- [Utatuzi wa Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Tamko la kutohusika:
Dokumenti hii imetatuliwa kwa kutumia huduma ya tafsiri ya AI, Co-op Translator (https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kufikia usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Nakala ya asili ya dokumenti katika lugha yake ya asili inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, tunapendekeza kutumia tafsiri ya mtaalamu wa binadamu. Hatubebei uwajibikaji kwa uelewa mbaya au tafsiri potofu zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->