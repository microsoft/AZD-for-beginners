<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b5ae13b6a245ab3a2e6dae923aab65bd",
  "translation_date": "2025-11-23T22:48:50+00:00",
  "source_file": "docs/troubleshooting/ai-troubleshooting.md",
  "language_code": "my"
}
-->
# AI အထူး Troubleshooting လမ်းညွှန်

**အခန်းများ Navigation:**
- **📚 သင်ခန်းစာ အိမ်**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၇ - Troubleshooting & Debugging
- **⬅️ အရင်**: [Debugging Guide](debugging.md)
- **➡️ နောက်အခန်း**: [အခန်း ၈: Production & Enterprise Patterns](../microsoft-foundry/production-ai-practices.md)
- **🤖 ဆက်စပ်**: [အခန်း ၂: AI-First Development](../microsoft-foundry/microsoft-foundry-integration.md)

**အရင်**: [Production AI Practices](../microsoft-foundry/production-ai-practices.md) | **နောက်**: [Getting Started with AZD](../getting-started/README.md)

ဒီအကျယ်အဝန်းရှိ troubleshooting လမ်းညွှန်မှာ AZD နဲ့ AI ဖြေရှင်းချက်တွေကို deploy လုပ်တဲ့အခါမှာ ကြုံရတဲ့ အခက်အခဲတွေကို ဖြေရှင်းနည်းတွေ၊ Azure AI services အတွက် debugging နည်းလမ်းတွေကို ဖော်ပြထားပါတယ်။

## အကြောင်းအရာများ

- [Azure OpenAI Service အခက်အခဲများ](../../../../docs/troubleshooting)
- [Azure AI Search ပြဿနာများ](../../../../docs/troubleshooting)
- [Container Apps Deployment အခက်အခဲများ](../../../../docs/troubleshooting)
- [Authentication နှင့် Permission အမှားများ](../../../../docs/troubleshooting)
- [Model Deployment မအောင်မြင်မှုများ](../../../../docs/troubleshooting)
- [Performance နှင့် Scaling အခက်အခဲများ](../../../../docs/troubleshooting)
- [ကုန်ကျစရိတ်နှင့် Quota စီမံခန့်ခွဲမှု](../../../../docs/troubleshooting)
- [Debugging Tools နှင့် နည်းလမ်းများ](../../../../docs/troubleshooting)

## Azure OpenAI Service အခက်အခဲများ

### ပြဿနာ: OpenAI Service ကို Region မှာ မရရှိနိုင်

**လက္ခဏာများ:**
```
Error: The requested resource type is not available in the location 'westus'
```

**အကြောင်းရင်းများ:**
- Azure OpenAI ကို ရွေးချယ်ထားတဲ့ region မှာ မရရှိနိုင်ခြင်း
- ရွေးချယ်ထားတဲ့ region တွေမှာ quota ကုန်ဆုံးခြင်း
- Regional capacity အကန့်အသတ်များ

**ဖြေရှင်းနည်းများ:**

1. **Region Availability ကို စစ်ဆေးပါ:**
```bash
# OpenAI အတွက် ရရှိနိုင်သော ဒေသများစာရင်း
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

3. **Alternative Regions ကို အသုံးပြုပါ:**
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

### ပြဿနာ: Model Deployment Quota ကုန်ဆုံး

**လက္ခဏာများ:**
```
Error: Deployment failed due to insufficient quota
```

**ဖြေရှင်းနည်းများ:**

1. **လက်ရှိ Quota ကို စစ်ဆေးပါ:**
```bash
# ကွိုတာအသုံးပြုမှုကိုစစ်ဆေးပါ
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Quota တိုးမြှင့်မှု တောင်းဆိုပါ:**
```bash
# ကိုတာတိုးမြှင့်ရန်တောင်းဆိုမှုတင်သွင်းပါ
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Model Capacity ကို အကောင်းဆုံးဖြစ်အောင် ပြုလုပ်ပါ:**
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

### ပြဿနာ: API Version မမှန်

**လက္ခဏာများ:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**ဖြေရှင်းနည်းများ:**

1. **ထောက်ခံထားတဲ့ API Version ကို အသုံးပြုပါ:**
```python
# နောက်ဆုံးပံ့ပိုးထားသောဗားရှင်းကိုအသုံးပြုပါ
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API Version Compatibility ကို စစ်ဆေးပါ:**
```bash
# ပံ့ပိုးထားသော API ဗားရှင်းများစာရင်း
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

2. **Semantic Search ကို ပိတ်ထားပါ (Development):**
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
# ရှာဖွေမှုဝန်ဆောင်မှုအုပ်ချုပ်ရေးသော့ကိုရယူပါ
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Index Schema ကို စစ်ဆေးပါ:**
```python
# အညွှန်း schema ကိုအတည်ပြုပါ
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

## Container Apps Deployment အခက်အခဲများ

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

2. **Dependencies ကို အတည်ပြုပါ:**
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

3. **Health Check ထည့်ပါ:**
```python
# main.py - ကျန်းမာရေးစစ်ဆေးမှု endpoint ထည့်ပါ
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

2. **Model Loading ကို အကောင်းဆုံးဖြစ်အောင် ပြုလုပ်ပါ:**
```python
# မော်ဒယ်များကို အစပျိုးချိန်ကို လျှော့ချရန် အလေးပိုးတင်ပါ
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
        # AI client ကို ဒီမှာ စတင်ပါ
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # စတင်ခြင်း
    app.state.model_manager = ModelManager()
    yield
    # ပိတ်ခြင်း
    pass

app = FastAPI(lifespan=lifespan)
```

## Authentication နှင့် Permission အမှားများ

### ပြဿနာ: Managed Identity Permission ပိတ်ပင်ထား

**လက္ခဏာများ:**
```
Error: Authentication failed for Azure OpenAI Service
```

**ဖြေရှင်းနည်းများ:**

1. **Role Assignments ကို စစ်ဆေးပါ:**
```bash
# လက်ရှိအခန်းကဏ္ဍတာဝန်ပေးခြင်းများကို စစ်ဆေးပါ
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **လိုအပ်တဲ့ Roles တွေကို Assign လုပ်ပါ:**
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
# စီမံခန့်ခွဲထားသော အတည်ပြုမှုကို စမ်းသပ်ပါ
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

### ပြဿနာ: Key Vault Access ပိတ်ပင်ထား

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

2. **Access Policies အစား RBAC ကို အသုံးပြုပါ:**
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

1. **ရရှိနိုင်တဲ့ Models ကို စစ်ဆေးပါ:**
```bash
# ရရှိနိုင်သောမော်ဒယ်များစာရင်း
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

3. **Deploy မလုပ်ခင် Model ကို အတည်ပြုပါ:**
```python
# မော်ဒယ်ကို တင်သွင်းမည့်အခါ အတည်ပြုခြင်း
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

## Performance နှင့် Scaling အခက်အခဲများ

### ပြဿနာ: High Latency Responses

**လက္ခဏာများ:**
- Response times > 30 seconds
- Timeout errors
- အသုံးပြုသူ အတွေ့အကြုံ မကောင်း

**ဖြေရှင်းနည်းများ:**

1. **Request Timeouts ကို အသုံးပြုပါ:**
```python
# သင့်လျော်သောအချိန်ကုန်ဆုံးမှုများကိုဖွင့်လှစ်ပါ
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

2. **Response Caching ကို ထည့်ပါ:**
```python
# တုံ့ပြန်မှုများအတွက် Redis cache
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

### ပြဿနာ: Memory Out of Errors

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

2. **Memory Usage ကို အကောင်းဆုံးဖြစ်အောင် ပြုလုပ်ပါ:**
```python
# မှတ်ဉာဏ်အသုံးပြုမှုကိုထိရောက်စွာကိုင်တွယ်ခြင်း
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # အလုပ်လုပ်မီ မှတ်ဉာဏ်အသုံးပြုမှုကိုစစ်ဆေးပါ
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # အမှိုက်စုဆောင်းမှုကိုအတင်းအဓမ္မလုပ်ဆောင်ပါ
            
        result = await self._process_ai_request(request)
        
        # အလုပ်လုပ်ပြီးနောက် သန့်ရှင်းရေးလုပ်ဆောင်ပါ
        gc.collect()
        return result
```

## ကုန်ကျစရိတ်နှင့် Quota စီမံခန့်ခွဲမှု

### ပြဿနာ: မမျှော်လင့်ထားတဲ့ ကုန်ကျစရိတ်များ

**လက္ခဏာများ:**
- Azure bill က မမျှော်လင့်ထားတဲ့ အမြင့်
- Token usage က ခန့်မှန်းချက်ထက် ကျော်လွန်နေ
- Budget alerts တွေ triggered ဖြစ်

**ဖြေရှင်းနည်းများ:**

1. **Cost Controls ကို အသုံးပြုပါ:**
```python
# တိုကင်အသုံးပြုမှုကိုခြေရာခံခြင်း
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

3. **Model Selection ကို အကောင်းဆုံးဖြစ်အောင် ပြုလုပ်ပါ:**
```python
# ကုန်ကျစရိတ်ကို သိရှိထားသော မော်ဒယ်ရွေးချယ်မှု
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # ၁၀၀၀ tokens အတွက်
    'gpt-4': 0.03,          # ၁၀၀၀ tokens အတွက်
    'gpt-35-turbo': 0.0015  # ၁၀၀၀ tokens အတွက်
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
# အသေးစိတ်မှတ်တမ်းများကိုဖွင့်ပါ
azd up --debug

# တင်သွင်းမှုအခြေအနေကိုစစ်ဆေးပါ
azd show

# တင်သွင်းမှတ်တမ်းများကိုကြည့်ပါ
azd logs --follow

# ပတ်ဝန်းကျင်အပြောင်းအလဲများကိုစစ်ဆေးပါ
azd env get-values
```

### Application Debugging

1. **Structured Logging:**
```python
import logging
import json

# AI အက်ပလီကေးရှင်းများအတွက် ဖွဲ့စည်းထားသော လော့ဂ်များကို ဖွင့်လှစ်ပါ
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
    
    # OpenAI ချိတ်ဆက်မှုကို စစ်ဆေးပါ
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Search ဝန်ဆောင်မှုကို စစ်ဆေးပါ
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

## အများဆုံးတွေ့ရတဲ့ Error Codes နှင့် ဖြေရှင်းနည်းများ

| Error Code | ဖော်ပြချက် | ဖြေရှင်းနည်း |
|------------|-------------|----------|
| 401 | Unauthorized | API keys နှင့် managed identity configuration ကို စစ်ဆေးပါ |
| 403 | Forbidden | RBAC role assignments ကို စစ်ဆေးပါ |
| 429 | Rate Limited | Exponential backoff နဲ့ retry logic ကို အသုံးပြုပါ |
| 500 | Internal Server Error | Model deployment status နှင့် logs ကို စစ်ဆေးပါ |
| 503 | Service Unavailable | Service health နှင့် regional availability ကို စစ်ဆေးပါ |

## နောက်ထပ်အဆင့်များ

1. **[AI Model Deployment Guide](ai-model-deployment.md)** ကို ပြန်လည်သုံးသပ်ပါ
2. **[Production AI Practices](production-ai-practices.md)** ကို ပြီးမြောက်အောင် လုပ်ဆောင်ပါ
3. **[Microsoft Foundry Discord](https://aka.ms/foundry/discord)** ကို ဝင်ရောက်ပြီး community support ရယူပါ
4. **AZD GitHub repository** [AZD GitHub repository](https://github.com/Azure/azure-dev) မှာ AZD-specific ပြဿနာတွေကို တင်ပါ

## အရင်းအမြစ်များ

- [Azure OpenAI Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**အခန်းများ Navigation:**
- **📚 သင်ခန်းစာ အိမ်**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၇ - Troubleshooting & Debugging
- **⬅️ အရင်**: [Debugging Guide](debugging.md)
- **➡️ နောက်အခန်း**: [အခန်း ၈: Production & Enterprise Patterns](../microsoft-foundry/production-ai-practices.md)
- **🤖 ဆက်စပ်**: [အခန်း ၂: AI-First Development](../microsoft-foundry/microsoft-foundry-integration.md)
- [Azure Developer CLI Troubleshooting](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရ အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူက ဘာသာပြန်မှုကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->