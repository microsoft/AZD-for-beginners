<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8943fe4b13e5c61c3cdc16c2d78a6724",
  "translation_date": "2025-09-12T23:27:33+00:00",
  "source_file": "docs/troubleshooting/ai-troubleshooting.md",
  "language_code": "my"
}
-->
# Azure Developer CLI အတွက် AI ပြဿနာဖြေရှင်းလမ်းညွှန်

**အရင်:** [Production AI Practices](../ai-foundry/production-ai-practices.md) | **နောက်တစ်ခု:** [Getting Started with AZD](../getting-started/README.md)

AZD ကို အသုံးပြု၍ AI ဖြေရှင်းချက်များကို တင်သွင်းရာတွင် ကြုံတွေ့ရသော ပြဿနာများကို ဖြေရှင်းရန်၊ Azure AI ဝန်ဆောင်မှုများနှင့် သက်ဆိုင်သော debugging နည်းလမ်းများနှင့်အတူ လမ်းညွှန်ချက်များကို ပေးထားသည်။

## အကြောင်းအရာများ

- [Azure OpenAI Service ပြဿနာများ](../../../../docs/troubleshooting)
- [Azure AI Search ပြဿနာများ](../../../../docs/troubleshooting)
- [Container Apps Deployment ပြဿနာများ](../../../../docs/troubleshooting)
- [Authentication နှင့် Permission အမှားများ](../../../../docs/troubleshooting)
- [Model Deployment မအောင်မြင်မှုများ](../../../../docs/troubleshooting)
- [စွမ်းဆောင်ရည်နှင့် Scaling ပြဿနာများ](../../../../docs/troubleshooting)
- [ကုန်ကျစရိတ်နှင့် Quota စီမံခန့်ခွဲမှု](../../../../docs/troubleshooting)
- [Debugging Tools နှင့် နည်းလမ်းများ](../../../../docs/troubleshooting)

## Azure OpenAI Service ပြဿနာများ

### ပြဿနာ: OpenAI Service ကို ရွေးချယ်ထားသော Region တွင် မရရှိနိုင်

**လက္ခဏာများ:**
```
Error: The requested resource type is not available in the location 'westus'
```

**အကြောင်းရင်းများ:**
- Azure OpenAI ကို ရွေးချယ်ထားသော Region တွင် မရရှိနိုင်
- ရွေးချယ်ထားသော Region များတွင် Quota ကုန်ဆုံးနေသည်
- Region အတွင်း Capacity ကန့်သတ်ချက်များ

**ဖြေရှင်းနည်းများ:**

1. **Region ရရှိနိုင်မှုကို စစ်ဆေးပါ:**
```bash
# List available regions for OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **AZD Configuration ကို Update လုပ်ပါ:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **အခြား Region များကို အသုံးပြုပါ:**
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

### ပြဿနာ: Model Deployment Quota ကျော်လွန်နေသည်

**လက္ခဏာများ:**
```
Error: Deployment failed due to insufficient quota
```

**ဖြေရှင်းနည်းများ:**

1. **လက်ရှိ Quota ကို စစ်ဆေးပါ:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Quota တိုးမြှင့်ရန် တောင်းဆိုပါ:**
```bash
# Submit quota increase request
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Model Capacity ကို Optimize လုပ်ပါ:**
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

### ပြဿနာ: API Version မမှန်ကန်

**လက္ခဏာများ:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**ဖြေရှင်းနည်းများ:**

1. **ထောက်ခံထားသော API Version ကို အသုံးပြုပါ:**
```python
# Use latest supported version
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API Version Compatibility ကို စစ်ဆေးပါ:**
```bash
# List supported API versions
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search ပြဿနာများ

### ပြဿနာ: Search Service Pricing Tier မလုံလောက်

**လက္ခဏာများ:**
```
Error: Semantic search requires Basic tier or higher
```

**ဖြေရှင်းနည်းများ:**

1. **Pricing Tier ကို Upgrade လုပ်ပါ:**
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

2. **Semantic Search ကို ပိတ်ထားပါ (Development အတွက်):**
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

### ပြဿနာ: Index ဖန်တီးမှု မအောင်မြင်

**လက္ခဏာများ:**
```
Error: Cannot create index, insufficient permissions
```

**ဖြေရှင်းနည်းများ:**

1. **Search Service Keys ကို စစ်ဆေးပါ:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Index Schema ကို စစ်ဆေးပါ:**
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

3. **Managed Identity ကို အသုံးပြုပါ:**
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

## Container Apps Deployment ပြဿနာများ

### ပြဿနာ: Container Build မအောင်မြင်

**လက္ခဏာများ:**
```
Error: Failed to build container image
```

**ဖြေရှင်းနည်းများ:**

1. **Dockerfile Syntax ကို စစ်ဆေးပါ:**
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

2. **Dependencies ကို Validate လုပ်ပါ:**
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

3. **Health Check ထည့်သွင်းပါ:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### ပြဿနာ: Container App Startup မအောင်မြင်

**လက္ခဏာများ:**
```
Error: Container failed to start within timeout period
```

**ဖြေရှင်းနည်းများ:**

1. **Startup Timeout ကို တိုးမြှင့်ပါ:**
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

2. **Model Loading ကို Optimize လုပ်ပါ:**
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

## Authentication နှင့် Permission အမှားများ

### ပြဿနာ: Managed Identity Permission ပိတ်ထားသည်

**လက္ခဏာများ:**
```
Error: Authentication failed for Azure OpenAI Service
```

**ဖြေရှင်းနည်းများ:**

1. **Role Assignments ကို စစ်ဆေးပါ:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **လိုအပ်သော Roles ကို Assign လုပ်ပါ:**
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

3. **Authentication ကို စမ်းသပ်ပါ:**
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

### ပြဿနာ: Key Vault Access ပိတ်ထားသည်

**လက္ခဏာများ:**
```
Error: The user, group or application does not have secrets get permission
```

**ဖြေရှင်းနည်းများ:**

1. **Key Vault Permissions ကို ပေးပါ:**
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

2. **RBAC ကို Access Policies အစား အသုံးပြုပါ:**
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

## Model Deployment မအောင်မြင်မှုများ

### ပြဿနာ: Model Version မရရှိနိုင်

**လက္ခဏာများ:**
```
Error: Model version 'gpt-4-32k' is not available
```

**ဖြေရှင်းနည်းများ:**

1. **ရရှိနိုင်သော Models ကို စစ်ဆေးပါ:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Model Fallbacks ကို အသုံးပြုပါ:**
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

3. **Deployment မပြုမီ Model ကို Validate လုပ်ပါ:**
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

## စွမ်းဆောင်ရည်နှင့် Scaling ပြဿနာများ

### ပြဿနာ: Latency မြင့်မားသော Response

**လက္ခဏာများ:**
- Response time > 30 စက္ကန့်
- Timeout အမှားများ
- အသုံးပြုသူအတွေ့အကြုံ အနည်းငယ်

**ဖြေရှင်းနည်းများ:**

1. **Request Timeouts ကို အကောင်အထည်ဖော်ပါ:**
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

2. **Response Caching ကို ထည့်သွင်းပါ:**
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

3. **Auto-scaling ကို Configure လုပ်ပါ:**
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

### ပြဿနာ: Memory ကုန်ဆုံးမှု အမှားများ

**လက္ခဏာများ:**
```
Error: Container killed due to memory limit exceeded
```

**ဖြေရှင်းနည်းများ:**

1. **Memory Allocation ကို တိုးမြှင့်ပါ:**
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

2. **Memory Usage ကို Optimize လုပ်ပါ:**
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

## ကုန်ကျစရိတ်နှင့် Quota စီမံခန့်ခွဲမှု

### ပြဿနာ: မမျှော်လင့်ထားသော ကုန်ကျစရိတ် မြင့်မားမှု

**လက္ခဏာများ:**
- Azure ဘီလ် မျှော်လင့်ထားသည်ထက် မြင့်မားနေသည်
- Token အသုံးပြုမှု အကဲဖြတ်ချက်များ ကျော်လွန်နေသည်
- Budget alerts များ Trigger ဖြစ်နေသည်

**ဖြေရှင်းနည်းများ:**

1. **Cost Controls ကို အကောင်အထည်ဖော်ပါ:**
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

2. **Cost Alerts ကို Set လုပ်ပါ:**
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

3. **Model Selection ကို Optimize လုပ်ပါ:**
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

## Debugging Tools နှင့် နည်းလမ်းများ

### AZD Debugging Commands

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

### Application Debugging

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

## Error Codes နှင့် ဖြေရှင်းနည်းများ

| Error Code | ဖော်ပြချက် | ဖြေရှင်းနည်း |
|------------|-------------|----------|
| 401 | Unauthorized | API keys နှင့် managed identity configuration ကို စစ်ဆေးပါ |
| 403 | Forbidden | RBAC role assignments ကို စစ်ဆေးပါ |
| 429 | Rate Limited | Exponential backoff ဖြင့် retry logic ကို အကောင်အထည်ဖော်ပါ |
| 500 | Internal Server Error | Model deployment status နှင့် logs ကို စစ်ဆေးပါ |
| 503 | Service Unavailable | Service health နှင့် regional availability ကို စစ်ဆေးပါ |

## နောက်တစ်ဆင့်များ

1. **[AI Model Deployment Guide](ai-model-deployment.md)** ကို Review လုပ်ပါ
2. **[Production AI Practices](production-ai-practices.md)** ကို ပြီးမြောက်ပါ
3. **[Azure AI Foundry Discord](https://aka.ms/foundry/discord)** ကို Join လုပ်ပြီး community support ရယူပါ
4. **ပြဿနာများကို Submit လုပ်ပါ** [AZD GitHub repository](https://github.com/Azure/azure-dev) တွင် AZD-specific ပြဿနာများအတွက်

## Resources

- [Azure OpenAI Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**အရင်:** [Production AI Practices](../ai-foundry/production-ai-practices.md) | **နောက်တစ်ခု:** [Workshop](../../workshop/README.md)
- [Azure Developer CLI Troubleshooting](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်ခြင်းတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းစာရွက်စာတမ်းကို ၎င်း၏ မူရင်းဘာသာစကားဖြင့် အာဏာတရားရှိသော အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်ခြင်းကို အကြံပြုပါသည်။ ဤဘာသာပြန်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွတ်များ သို့မဟုတ် အနားယူမှုမှားများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။