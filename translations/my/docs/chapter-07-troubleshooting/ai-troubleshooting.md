# AI-အထူး ပြဿနာဖြေရှင်းလမ်းညွှန်

**အခန်း သွားလာမှု:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 ခုနှစ်အခန်း**: အခန်း 7 - ပြဿနာဖြေရှင်းခြင်းနှင့် ဂရပ်ဘာဂ်ရှင်း
- **⬅️ မကြာသေးမီ**: [Debugging Guide](debugging.md)
- **➡️ နောက်တစ်ခန်း**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 ဆက်စပ်**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

ဤကျယ်ပြန့်သော ပြဿနာဖြေရှင်းလမ်းညွှန်သည် AZD ဖြင့် AI ဖြေရှင်းနည်းများ တပ်ဆင်ရာတွင် ဖြစ်ပေါ်လေ့ရှိသောပြဿနာများကို အခြေခံပြီး Azure AI ဝန်ဆောင်မှုများအတွက် အထူးဖြေရှင်းနည်းများနှင့် ဂရပ်ဘာဂ်ရှင်းနည်းများကို ပံ့ပိုးပေးပါသည်။

## မီနူး

- [Microsoft Foundry Models Service Issues](#azure-openai-service-issues)
- [Azure AI Search Problems](#azure-ai-search-ပြဿနာများ)
- [Container Apps Deployment Issues](#container-apps-တပ်ဆင်ရာ-ပြဿနာများ)
- [Authentication and Permission Errors](#အတည်ပြုခြင်း-နှင့်-ခွင့်ပြုချက်-အမှားများ)
- [Model Deployment Failures](#မော်ဒယ်-တပ်ဆင်မှု-မအောင်မြင်မှုများ)
- [Performance and Scaling Issues](#လုပ်ဆောင်ရမှုပြဿနာများ-နှင့်-အတိုင်းအတာ-တိုးမြှင့်မှု)
- [Cost and Quota Management](#ကုန်ကျစရိတ်-နှင့်-ကိုတာ-စီမံခန့်ခွဲမှု)
- [Debugging Tools and Techniques](#ဂရပ်ဘာဂ်ရှင်း-ကိရိယာများ-နှင့်-နည်းလမ်းများ)

## Microsoft Foundry Models Service Issues

### ပြဿနာ: OpenAI ဝန်ဆောင်မှု ကိုဒေသတွင် မရနိုင်ခြင်း

**လက္ခဏာများ:**
```
Error: The requested resource type is not available in the location 'westus'
```

**မူလ အကြောင်းရင်းများ:**
- ရွေးချယ်ထားသော ဒေသတွင် Microsoft Foundry Models မရှိခြင်း
- ဦးစားပေး ဒေသများတွင် ကိုတာ ဖြည့်ဖွယ်ကုန်ခြင်း
- ဒေသဆိုင်ရာ စွမ်းရည်ကန့်သတ်ချက်များ

**ဖြေရှင်းနည်းများ:**

1. **ဒေသ ရရှိနိုင်မှုကို စစ်ဆေးပါ:**
```bash
# OpenAI အတွက် ရနိုင်သော ဒေသများကို စာရင်းပြပါ
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **AZD ဖိုင်ပြင်ဆင်မှုကို အပ်ဒိတ်လုပ်ပါ:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **အခြားဒေသများ အသုံးပြုပါ:**
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

### ပြဿနာ: မော်ဒယ် တပ်ဆင်မှု ကိုးတာ ကျော်လွန်သွားခြင်း

**လက္ခဏာများ:**
```
Error: Deployment failed due to insufficient quota
```

**ဖြေရှင်းနည်းများ:**

1. **လက်ရှိ ကိုတာကို စစ်ဆေးပါ:**
```bash
# ကွိုတာအသုံးပြုမှုကို စစ်ဆေးပါ
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **ကိုတာ တွန်းအားတိုးရန် တောင်းဆိုပါ:**
```bash
# quota တိုးမြှင့်ရန် တောင်းဆိုချက် တင်ပြပါ
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **မော်ဒယ် စွမ်းရည်ကို ထည့်သွင်းဖြည့်တင်း ပြုပြင်ပါ:**
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

### ပြဿနာ: API ဗားရှင်း မကိုက်ညီခြင်း

**လက္ခဏာများ:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**ဖြေရှင်းနည်းများ:**

1. **ထောက်ခံထားသော API ဗားရှင်းကို အသုံးပြုပါ:**
```python
# အထောက်အပံ့ပြုထားသည့် နောက်ဆုံးဗားရှင်းကို အသုံးပြုပါ
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API ဗားရှင်း ကိုက်ညီမှုကို စစ်ဆေးပါ:**
```bash
# ထောက်ခံထားသော API ဗားရှင်းများကို စာရင်းပြပါ
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search ပြဿနာများ

### ပြဿနာ: Search ဝန်ဆောင်မှု စျေးနှုန်း အဆင့် မလုံမလောက်ခြင်း

**လက္ခဏာများ:**
```
Error: Semantic search requires Basic tier or higher
```

**ဖြေရှင်းနည်းများ:**

1. **စျေးနှုန်း အဆင့် ကို အဆင့်မြှင့်တင်ပါ:**
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

2. **Semantic Search ကို ပိတ်ထားပါ (ဖွံ့ဖြိုးရေးအတွက်):**
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

### ပြဿနာ: အညစ်အကြေး ဖန်တီးခြင်း မအောင်မြင်ခြင်း (Index Creation Failures)

**လက္ခဏာများ:**
```
Error: Cannot create index, insufficient permissions
```

**ဖြေရှင်းနည်းများ:**

1. **Search ဝန်ဆောင်မှု အတွက် အချက်အလက် ကီးများကို စစ်ဆေးပါ:**
```bash
# ရှာဖွေရေး ဝန်ဆောင်မှု၏ အက်မင် ကီးကို ရယူပါ
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Index schema ကို စစ်ဆေးပါ:**
```python
# အညွှန်းပုံစံကို စစ်ဆေးပြီး အတည်ပြုပါ
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

3. **Managed Identity ကို သုံးပါ:**
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

## Container Apps တပ်ဆင်ရာ ပြဿနာများ

### ပြဿနာ: ကွန်တိန်နာ တည်ဆောက်မှု မအောင်မြင်ခြင်း

**လက္ခဏာများ:**
```
Error: Failed to build container image
```

**ဖြေရှင်းနည်းများ:**

1. **Dockerfile သဒ္ဒါကို စစ်ဆေးပါ:**
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

2. **လိုအပ်ချက်များကို အတည်ပြုပါ:**
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
# main.py - ကျန်းမာရေး စစ်ဆေးမှုပြုရန် endpoint ထည့်ပါ
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### ပြဿနာ: Container App စတင်မရခြင်း

**လက္ခဏာများ:**
```
Error: Container failed to start within timeout period
```

**ဖြေရှင်းနည်းများ:**

1. **စတင်ချိန် အချိန်ကို တိုးမြှင့်ပါ:**
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

2. **မော်ဒယ် လုပ်ငန်းတင်ခြင်း ကို တိက်ညှိပါ:**
```python
# စတင်ချိန်ကို လျော့ချရန် မော်ဒယ်များကို နောက်ကျစွာ တင်ပါ
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
        # ဒီမှာ AI client ကို စတင်သတ်မှတ်ပါ
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # စတင်ခြင်း
    app.state.model_manager = ModelManager()
    yield
    # ပိတ်သိမ်းခြင်း
    pass

app = FastAPI(lifespan=lifespan)
```

## အတည်ပြုခြင်း နှင့် ခွင့်ပြုချက် အမှားများ

### ပြဿနာ: Managed Identity ခွင့်ပြုချက် ပယ်ချခံရခြင်း

**လက္ခဏာများ:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**ဖြေရှင်းနည်းများ:**

1. **အခန်းကဏ္ဍ သတ်မှတ်ချက်များကို အတည်ပြုပါ:**
```bash
# လက်ရှိ တာဝန်ခန့်အပ်မှုများကို စစ်ဆေးပါ
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **လိုအပ်သော အခန်းကဏ္ဍများကို မူပိုင်ပေးသတ်မှတ်ပါ:**
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

3. **အတည်ပြုခြင်း ကို စမ်းသပ်ပါ:**
```python
# စီမံထိန်းသိမ်းထားသော identity အတည်ပြုမှုကို စမ်းသပ်ပါ
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

### ပြဿနာ: Key Vault သို့ ဝင်ရောက်ခွင့် မရှိခြင်း

**လက္ခဏာများ:**
```
Error: The user, group or application does not have secrets get permission
```

**ဖြေရှင်းနည်းများ:**

1. **Key Vault ခွင့်ပြုချက်များ ပေးပါ:**
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

## မော်ဒယ် တပ်ဆင်မှု မအောင်မြင်မှုများ

### ပြဿနာ: မော်ဒယ် ဗားရှင်း မရရှိနိုင်ခြင်း

**လက္ခဏာများ:**
```
Error: Model version 'gpt-4-32k' is not available
```

**ဖြေရှင်းနည်းများ:**

1. **ရရှိနိုင်သော မော်ဒယ်များကို စစ်ဆေးပါ:**
```bash
# ရရှိနိုင်သော မော်ဒယ်များကို စာရင်းပြပါ
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **မော်ဒယ် ဖယ်လ်ဘက်(က) များကို အသုံးပြုပါ:**
```bicep
// Model deployment with fallback
@description('Primary model configuration')
param primaryModel object = {
  name: 'gpt-4.1-mini'
  version: '2024-07-18'
}

@description('Fallback model configuration')
param fallbackModel object = {
  name: 'gpt-4.1'
  version: '2024-08-06'
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

3. **တပ်ဆင်မပြုမီ မော်ဒယ်ကို အတည်ပြုပါ:**
```python
# ဖြန့်ချိမတိုင်ခင် မော်ဒယ် အတည်ပြုခြင်း
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

## လုပ်ဆောင်ရမှုပြဿနာများ နှင့် အတိုင်းအတာ တိုးမြှင့်မှု

### ပြဿနာ: တုံ့ပြန်ချိန် မြင့်တက်ခြင်း (High Latency Responses)

**လက္ခဏာများ:**
- တုံ့ပြန်ချိန် > 30 စက္ကန့်
- အချိန်ကုန်ခြင်း အမှားများ
- အသုံးပြုသူ အတွေ့အကြုံ အနည်းငယ်

**ဖြေရှင်းနည်းများ:**

1. **တောင်းဆိုမှု အချိန်ကုန် သတ်မှတ်ချက်များ ထည့်သွင်းပါ:**
```python
# မှန်ကန်သော အချိန်ကုန်သတ်မှတ်ချက်များကို သတ်မှတ်ပါ
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

2. **တုံ့ပြန်ချက် ကက်ရှ် ထည့်ပါ:**
```python
# တုံ့ပြန်ချက်များအတွက် Redis cache
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

3. **Auto-scaling ကို စီမံပါ:**
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

1. **Memory ထည့်သွင်းပမာဏ တိုးပါ:**
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

2. **Memory အသုံးများကို အကောင်းမြှင့်ပါ:**
```python
# မှတ်ဉာဏ်သက်သာစေသော မော်ဒယ်ကို ကိုင်တွယ်ခြင်း
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # လုပ်ဆောင်မှု မစမီ မှတ်ဉာဏ်အသုံးပြုမှုကို စစ်ဆေးပါ
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # အမှိုက်စုဆောင်းနှင့် ဖယ်ရှားခြင်းကို အတင်းအကြပ် ပြုလုပ်ပါ
            
        result = await self._process_ai_request(request)
        
        # လုပ်ဆောင်ချက်ပြီးနောက် သန့်ရှင်းရေး ပြုလုပ်ပါ
        gc.collect()
        return result
```

## ကုန်ကျစရိတ် နှင့် ကိုတာ စီမံခန့်ခွဲမှု

### ပြဿနာ: မမျှော်လင့်ထားသော အမြင့်တက်ကုန်ကျစရိတ်

**လက္ခဏာများ:**
- Azure ဘေလ် စရိတ် မျှော်လင့်ထားသလို မဟုတ်ပါ
- token အသုံးပြုမှု ခန့်မှန်းချက် ကျော်လွန်ခြင်း
- ဘတ်ဂျက် သတိပေးချက်များ စတင်ပြရန်

**ဖြေရှင်းနည်းများ:**

1. **စရိတ် ထိန်းချုပ်မှုများ အသုံးပြုပါ:**
```python
# Token အသုံးပြုမှု စောင့်ကြည့်ခြင်း
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

2. **စရိတ် အကြောင်း သတိပေးချက်များ ထည့်သွင်းပါ:**
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

3. **မော်ဒယ် ရွေးချယ်မှုကို အပြောင်းအလဲ လုပ်ပါ:**
```python
# ကုန်ကျစရိတ်ကို သတိထား၍ မော်ဒယ်ရွေးချယ်ခြင်း
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

## ဂရပ်ဘာဂ်ရှင်း ကိရိယာများ နှင့် နည်းလမ်းများ

### AZD ဂရပ်ဘာဂ်ရှင်း အမိန့်များ

```bash
# အသေးစိတ် မှတ်တမ်းများကို ဖွင့်ပါ
azd up --debug

# တပ်ဆင်မှု အခြေအနေကို စစ်ဆေးပါ
azd show

# အက်ပလီကေးရှင်း လော့ဂ်များကို ကြည့်ပါ (စောင့်ကြည့် ဒက်ရှ်ဘုတ်ကို ဖွင့်သည်)
azd monitor --logs

# တိုက်ရိုက် တိုင်းတာချက်များကို ကြည့်ပါ
azd monitor --live

# ပတ်ဝန်းကျင် သတ်မှတ်ချက်များကို စစ်ဆေးပါ
azd env get-values
```

### AZD AI တိုးချဲ့မှု အမိန့်များ (နည်းလမ်း စစ်ဆေးရေးအတွက်)

သင် `azd ai agent init` ဖြင့် agents များကို တပ်ဆင်ထားခဲ့ပါက၊ အောက်ပါ အပိုကိရိယာများ ရရှိနိုင်ပါသည်။

```bash
# အေဂျင့် ချဲ့ထွင်မှုကို တပ်ဆင်ထားသည်ကို သေချာစေပါ
azd extension install azure.ai.agents

# manifest ဖိုင်မှ အေဂျင့်ကို ပြန်လည်စတင်ရန် သို့မဟုတ် အပ်ဒိတ်လုပ်ရန်
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# MCP ဆာဗာကို အသုံးပြုပြီး AI ကိရိယာများအား ပရောဂျက်၏ အခြေအနေကို မေးမြန်းနိုင်စေပါ
azd mcp start

# သုံးသပ်ခြင်းနှင့် စစ်ဆေးခြင်းအတွက် အခြေခံအဆောက်အအုံဖိုင်များကို ဖန်တီးပါ
azd infra generate
```

> **အကြံပြုချက်:** `azd infra generate` ကို အသုံးပြု၍ IaC ကို disk ပေါ်သို့ ထုတ်ရေးပါ၊ ထိုကဲ့သို့ ပြုလုပ်ခြင်းဖြင့် တပ်ဆင်ထားသည့် အရင်းအမြစ်များကို တိတိကျကျ စစ်ဆေးနိုင်သည်။ resource ပြင်ဆင်မှု ပြဿနာများ ဂရပ်ဘာဂ်ရှင်းရာတွင် ၎င်းသည် အရမ်း有用 ဖြစ်သည်။ ပိုမို အသေးစိတ်အချက်အလက်များအတွက် [AZD AI CLI reference](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) ကို ကြည့်ပါ။

### အပလီကေးရှင်း ဂရပ်ဘာဂ်ရှင်း

1. **ဖွဲ့စည်းတပ်ပြီး ကိုးကားထားသော Logging (Structured Logging):**
```python
import logging
import json

# AI အက်ပလီကေးရှင်းများအတွက် ဖွဲ့စည်းထားသော မှတ်တမ်းရေးခြင်းကို သတ်မှတ်ပါ
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
    
    # ရှာဖွေမှု ဝန်ဆောင်မှုကို စစ်ဆေးပါ
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

3. **Performance မျှောမျှလုပ်ခြင်း နှင့် မော်နီတာလုပ်ခြင်း:**
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

## အထူး အမှား ကုဒ်များ နှင့် ဖြေရှင်းနည်းများ

| Error Code | Description | Solution |
|------------|-------------|----------|
| 401 | ခွင့်မပြု | API key များနှင့် managed identity ဖန်တီးမှုကို စစ်ဆေးပါ |
| 403 | ခြင်းတားမြစ်ထားသည် | RBAC အခန်းကဏ္ဍ သတ်မှတ်မှုများကို အတည်ပြုပါ |
| 429 | နှုန်းကန့်သတ်ထားသည် | exponential backoff ဖြင့် retry logic ကို တပ်ဆင်ပါ |
| 500 | ဆာဗာ အတွင်းပိုင်း အမှား | မော်ဒယ် တပ်ဆင်မှု အခြေအနေနှင့် logs များကို စစ်ဆေးပါ |
| 503 | ဝန်ဆောင်မှု မရရှိနိုင်ပါ | ဝန်ဆောင်မှု ကျန်းမာရေးနှင့် ဒေသ ရရှိနိုင်မှုကို အတည်ပြုပါ |

## နောက်ဆက်တွဲ အဆင့်များ

1. **[AI Model Deployment Guide](../chapter-02-ai-development/ai-model-deployment.md)** ကို တပ်ဆင်မှု အကောင်းဆုံးလေ့လာမှုများအတွက် ပြန်လည်ကြည့်ပါ
2. **[Production AI Practices](../chapter-08-production/production-ai-practices.md)** ကို ပြီးမြောက်အောင် လေ့လာပါ — စီးပွားရေးအသုံးပြုထိစုံသော ဖြေရှင်းနည်းများအတွက်
3. **[Microsoft Foundry Discord](https://aka.ms/foundry/discord)** တွင် ကွန်ယက်ပေါင်းစည်းမှုအတွက် ပါဝင်ဆွေးနွေးပါ
4. **ပြဿနာများကို တင်ပြရန်** [AZD GitHub repository](https://github.com/Azure/azure-dev) သို့ issues တွေ တင်ပါ

## ရင်းမြစ်များ

- [Microsoft Foundry Models Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - သင်၏ code editor တွင် Azure ပြဿနာရှာဖွေကိရိယာများ ထည့်သွင်းရန်: `npx skills add microsoft/github-copilot-for-azure`

---

**အခန်း သွားလာမှု:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 ခုနှစ်အခန်း**: အခန်း 7 - ပြဿနာဖြေရှင်းခြင်းနှင့် ဂရပ်ဘာဂ်ရှင်း
- **⬅️ မကြာသေးမီ**: [Debugging Guide](debugging.md)
- **➡️ နောက်တစ်ခန်း**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 ဆက်စပ်**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 ကိုးကားချက်**: [Azure Developer CLI Troubleshooting](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**: ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်ရေးအပေါ် ကြိုးပမ်းနေသော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း ကျေးဇူးပြု၍ သတိထားပါ။ မူလစာတမ်းကို မူလဘာသာဖြင့်သာ အာဏာရှိသော အရင်းအမြစ်အဖြစ် သတ်မှတ်စဉ်းစားရန် သင့်တော်သည်။ အရေးပါတဲ့ အချက်အလက်များအတွက် လူ့ကျွမ်းကျင် ဘာသာပြန် ဆောင်ရွက်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုမှုကြောင့် ဖြစ်ပေါ်လာသော နားမလည်မှုများ သို့မဟုတ် မှားယွင်းချက်များအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->