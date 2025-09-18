<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c8ab8fd8ed338b3ec17484b453dcda68",
  "translation_date": "2025-09-18T08:59:49+00:00",
  "source_file": "docs/troubleshooting/ai-troubleshooting.md",
  "language_code": "sw"
}
-->
# Mwongozo wa Kutatua Matatizo ya AI

**Ukurasa wa Sehemu:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Kompyuta](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 7 - Kutatua Matatizo & Ufuatiliaji wa Hitilafu
- **⬅️ Iliyopita**: [Mwongozo wa Ufuatiliaji wa Hitilafu](debugging.md)
- **➡️ Sura Inayofuata**: [Sura ya 8: Mifumo ya Uzalishaji & Biashara](../ai-foundry/production-ai-practices.md)
- **🤖 Inayohusiana**: [Sura ya 2: Maendeleo ya AI Kwanza](../ai-foundry/azure-ai-foundry-integration.md)

**Iliyopita:** [Mazoea ya AI ya Uzalishaji](../ai-foundry/production-ai-practices.md) | **Inayofuata:** [Kuanza na AZD](../getting-started/README.md)

Mwongozo huu wa kina wa kutatua matatizo unashughulikia changamoto za kawaida wakati wa kupeleka suluhisho za AI kwa kutumia AZD, ukitoa suluhisho na mbinu za ufuatiliaji wa hitilafu zinazohusiana na huduma za Azure AI.

## Jedwali la Maudhui

- [Masuala ya Huduma ya Azure OpenAI](../../../../docs/troubleshooting)
- [Changamoto za Azure AI Search](../../../../docs/troubleshooting)
- [Masuala ya Upelekaji wa Programu za Kontena](../../../../docs/troubleshooting)
- [Hitilafu za Uthibitishaji na Ruhusa](../../../../docs/troubleshooting)
- [Kushindwa kwa Upelekaji wa Modeli](../../../../docs/troubleshooting)
- [Masuala ya Utendaji na Upanuzi](../../../../docs/troubleshooting)
- [Usimamizi wa Gharama na Kiwango](../../../../docs/troubleshooting)
- [Zana na Mbinu za Ufuatiliaji wa Hitilafu](../../../../docs/troubleshooting)

## Masuala ya Huduma ya Azure OpenAI

### Tatizo: Huduma ya OpenAI Haipatikani Katika Eneo

**Dalili:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Sababu:**
- Azure OpenAI haipatikani katika eneo lililochaguliwa
- Kiwango cha matumizi kimezidi katika maeneo yanayopendelewa
- Vikwazo vya uwezo wa eneo

**Suluhisho:**

1. **Angalia Upatikanaji wa Eneo:**
```bash
# List available regions for OpenAI
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

3. **Tumia Maeneo Mbadala:**
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

### Tatizo: Kiwango cha Upelekaji wa Modeli Kimezidi

**Dalili:**
```
Error: Deployment failed due to insufficient quota
```

**Suluhisho:**

1. **Angalia Kiwango cha Sasa:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Omba Kuongezwa kwa Kiwango:**
```bash
# Submit quota increase request
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Boresha Uwezo wa Modeli:**
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

### Tatizo: Toleo la API Halitumiki

**Dalili:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Suluhisho:**

1. **Tumia Toleo la API Linaloungwa Mkono:**
```python
# Use latest supported version
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Angalia Ulinganifu wa Toleo la API:**
```bash
# List supported API versions
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Changamoto za Azure AI Search

### Tatizo: Kiwango cha Bei ya Huduma ya Search Hakitoshi

**Dalili:**
```
Error: Semantic search requires Basic tier or higher
```

**Suluhisho:**

1. **Boresha Kiwango cha Bei:**
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

2. **Zima Semantic Search (Maendeleo):**
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

1. **Thibitisha Funguo za Huduma ya Search:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Angalia Schema ya Index:**
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

3. **Tumia Utambulisho Ulio Simamiwa:**
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

## Masuala ya Upelekaji wa Programu za Kontena

### Tatizo: Kushindwa Kujenga Kontena

**Dalili:**
```
Error: Failed to build container image
```

**Suluhisho:**

1. **Angalia Sintaksia ya Dockerfile:**
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

2. **Thibitisha Vitegemezi:**
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
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Tatizo: Kushindwa Kuanza Programu ya Kontena

**Dalili:**
```
Error: Container failed to start within timeout period
```

**Suluhisho:**

1. **Ongeza Muda wa Kuanza:**
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

2. **Boresha Upakiaji wa Modeli:**
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

## Hitilafu za Uthibitishaji na Ruhusa

### Tatizo: Ruhusa ya Utambulisho Ulio Simamiwa Imekataliwa

**Dalili:**
```
Error: Authentication failed for Azure OpenAI Service
```

**Suluhisho:**

1. **Thibitisha Uteuzi wa Majukumu:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Peana Majukumu Yanayohitajika:**
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

### Tatizo: Ufikiaji wa Key Vault Umekataliwa

**Dalili:**
```
Error: The user, group or application does not have secrets get permission
```

**Suluhisho:**

1. **Peana Ruhusa za Key Vault:**
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

## Kushindwa kwa Upelekaji wa Modeli

### Tatizo: Toleo la Modeli Halipatikani

**Dalili:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Suluhisho:**

1. **Angalia Modeli Zinazopatikana:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Tumia Modeli Mbadala:**
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

3. **Thibitisha Modeli Kabla ya Upelekaji:**
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

## Masuala ya Utendaji na Upanuzi

### Tatizo: Majibu ya Muda Mrefu Sana

**Dalili:**
- Muda wa majibu > sekunde 30
- Hitilafu za muda wa kutolewa
- Uzoefu duni wa mtumiaji

**Suluhisho:**

1. **Tekeleza Muda wa Ombi:**
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

2. **Ongeza Uwekaji wa Akiba wa Majibu:**
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

3. **Sanidi Upanuzi wa Kiotomatiki:**
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

### Tatizo: Hitilafu za Kumbukumbu Kuisha

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

## Usimamizi wa Gharama na Kiwango

### Tatizo: Gharama za Juu Zisizotarajiwa

**Dalili:**
- Ankara ya Azure juu kuliko ilivyotarajiwa
- Matumizi ya tokeni yanazidi makadirio
- Arifa za bajeti zinawashwa

**Suluhisho:**

1. **Tekeleza Udhibiti wa Gharama:**
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

2. **Sanidi Arifa za Gharama:**
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

3. **Boresha Uchaguzi wa Modeli:**
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

## Zana na Mbinu za Ufuatiliaji wa Hitilafu

### Amri za Ufuatiliaji wa AZD

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

### Ufuatiliaji wa Programu

1. **Kumbukumbu Zilizopangwa:**
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

2. **Vituo vya Ukaguzi wa Afya:**
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

## Nambari za Hitilafu za Kawaida na Suluhisho

| Nambari ya Hitilafu | Maelezo | Suluhisho |
|---------------------|----------|-----------|
| 401 | Haijathibitishwa | Angalia funguo za API na usanidi wa utambulisho ulio simamiwa |
| 403 | Imekataliwa | Thibitisha uteuzi wa majukumu ya RBAC |
| 429 | Kiwango Kimezidi | Tekeleza mantiki ya kurudia na kurudi nyuma kwa kasi |
| 500 | Hitilafu ya Ndani ya Seva | Angalia hali ya upelekaji wa modeli na kumbukumbu |
| 503 | Huduma Haipatikani | Thibitisha afya ya huduma na upatikanaji wa eneo |

## Hatua Zifuatazo

1. **Pitia [Mwongozo wa Upelekaji wa Modeli ya AI](ai-model-deployment.md)** kwa mazoea bora ya upelekaji
2. **Kamilisha [Mazoea ya AI ya Uzalishaji](production-ai-practices.md)** kwa suluhisho tayari kwa biashara
3. **Jiunge na [Azure AI Foundry Discord](https://aka.ms/foundry/discord)** kwa msaada wa jamii
4. **Wasilisha masuala** kwenye [hifadhi ya GitHub ya AZD](https://github.com/Azure/azure-dev) kwa matatizo maalum ya AZD

## Rasilimali

- [Kutatua Matatizo ya Huduma ya Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Kutatua Matatizo ya Programu za Kontena](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Kutatua Matatizo ya Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**Ukurasa wa Sehemu:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Kompyuta](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 7 - Kutatua Matatizo & Ufuatiliaji wa Hitilafu
- **⬅️ Iliyopita**: [Mwongozo wa Ufuatiliaji wa Hitilafu](debugging.md)
- **➡️ Sura Inayofuata**: [Sura ya 8: Mifumo ya Uzalishaji & Biashara](../ai-foundry/production-ai-practices.md)
- **🤖 Inayohusiana**: [Sura ya 2: Maendeleo ya AI Kwanza](../ai-foundry/azure-ai-foundry-integration.md)
- [Kutatua Matatizo ya Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya kutafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.