# AI အထူး ပြဿနာဖြေရှင်း လမ်းညွှန်

**အခန်း လမ်းညွှန်:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိ အခန်း**: Chapter 7 - Troubleshooting & Debugging
- **⬅️ နောက်ကောက်**: [Debugging Guide](debugging.md)
- **➡️ နောက်ထပ် အခန်း**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 ဆက်စပ် အရာများ**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

AZD ဖြင့် AI ဖြေရှင်းချက်များကို တပ်ဆင်သည့်အချိန် တွေ့ကြုံနိုင်သည့် ပုံမှန် ပြဿနာများကို ဖော်ပြထားသော ဤပြဿနာဖြေရှင်းလမ်းညွှန်သည် Azure AI ဝန်ဆောင်မှုများအတွက် သီးသန့် ဖြေရှင်းနည်းများနှင့် debug နည်းလမ်းများကို ပေးပါသည်။

## အကြောင်းအရာ စာရင်း

- [Microsoft Foundry Models Service Issues](#azure-openai-service-issues)
- [Azure AI Search Problems](#azure-ai-search-ပြဿနာများ)
- [Container Apps Deployment Issues](#container-apps-တပ်ဆင်မှု-ပြဿနာများ)
- [Authentication and Permission Errors](#အထောက်အထားနှင့်-ခွင့်ပြုချက်-အမှားများ)
- [Model Deployment Failures](#မော်ဒယ်-တပ်ဆင်မှု-မအောင်မြင်ခြင်း)
- [Performance and Scaling Issues](#ဆောင်ရွက်မှုနှင့်-အရွယ်ချဲ့-ပြဿနာများ)
- [Cost and Quota Management](#ကုန်ကျစရိတ်နှင့်-ကိန်းအရေအတွက်-စီမံခန့်ခွဲမှု)
- [Debugging Tools and Techniques](#ဒက်ဘတ်ချ်-ကိရိယာများနှင့်-နည်းလမ်းများ)

## Microsoft Foundry Models ဝန်ဆောင်မှု ပြဿနာများ

### ပြဿနာ: ဒေသတွင် OpenAI ဝန်ဆောင်မှု မရရှိနိုင်ခြင်း

**လက္ခဏာများ:**
```
Error: The requested resource type is not available in the location 'westus'
```

**အကြောင်းအရင်းများ:**
- Microsoft Foundry Models ကို ရွေးချယ်ထားသော ဒေသတွင် မရရှိနိုင်ခြင်း
- ကိုက်ညီသည့် ဒေသများတွင် ကိန်းအရေအတွက် သုံးစွဲပြီးဆုံးခြင်း
- ဒေသဆိုင်ရာ စွမ်းဆောင်ရည် ကန့်သတ်မှုများ

**ဖြေရှင်းနည်းများ:**

1. **ဒေသ ရရှိနိုင်မှု စစ်ဆေးပါ:**
```bash
# OpenAI အတွက် အသုံးပြုနိုင်သော ဒေသများကို စာရင်းပြပါ
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **AZD ဖော်မက်ကို အပ်ဒိတ်လုပ်ပါ:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **အခြား ဒေသများကို သုံးပါ:**
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

### ပြဿနာ: မော်ဒယ် တပ်ဆင်မှု ကိန်းအရေအတွက် ကျော်လွန်ခြင်း

**လက္ခဏာများ:**
```
Error: Deployment failed due to insufficient quota
```

**ဖြေရှင်းနည်းများ:**

1. **လက်ရှိ ကိန်းအရေအတွက် စစ်ဆေးပါ:**
```bash
# ကွိုတာ အသုံးပြုမှုကို စစ်ဆေးပါ
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **ကိန်းအရေအတွက် တိုးမြှင့်ရန် တောင်းဆိုပါ:**
```bash
# ခွင့်ပမာဏ တိုးမြှင့်ရန် တောင်းဆိုချက် တင်ပါ
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **မော်ဒယ် စွမ်းဆောင်ရည်ကို တန်ချိန်ညှိပါ:**
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

### ပြဿနာ: မမှန်ကန်သော API ဗားရှင်း

**လက္ခဏာများ:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**ဖြေရှင်းနည်းများ:**

1. **ထောက်ပံ့ပေးသော API ဗားရှင်းကို အသုံးပြုပါ:**
```python
# ပံ့ပိုးထားသော နောက်ဆုံးဗားရှင်းကို အသုံးပြုပါ
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API ဗားရှင်း ကိုက်ညီမှုကို စစ်ဆေးပါ:**
```bash
# ထောက်ပံ့ထားသည့် API ဗားရှင်းများကို စာရင်းပြပါ
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search ပြဿနာများ

### ပြဿနာ: Search ဝန်ဆောင်မှု စျေးနှုန်း အဆင့် မလုံလောက်မှု

**လက္ခဏာများ:**
```
Error: Semantic search requires Basic tier or higher
```

**ဖြေရှင်းနည်းများ:**

1. **စျေးနှုန်း အဆင့် မြှင့်တင်ပါ:**
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

### ပြဿနာ: Index ဖန်တီးမှု ပျက်ကွက်ခြင်း

**လက္ခဏာများ:**
```
Error: Cannot create index, insufficient permissions
```

**ဖြေရှင်းနည်းများ:**

1. **Search ဝန်ဆောင်မှု ကီးများကို စစ်ဆေးပါ:**
```bash
# ရှာဖွေရေး ဝန်ဆောင်မှု၏ အက်မင် key ကို ရယူပါ
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Index schema ကို စစ်ဆေးပါ:**
```python
# အညွှန်း ဖွဲ့စည်းပုံကို အတည်ပြုပါ
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

## Container Apps တပ်ဆင်မှု ပြဿနာများ

### ပြဿနာ: Container တည်ဆောက်ခြင်း မအောင်မြင်ခြင်း

**လက္ခဏာများ:**
```
Error: Failed to build container image
```

**ဖြေရှင်းနည်းများ:**

1. **Dockerfile အကောင်အထည် ဖော်ပြချက်ကို စစ်ဆေးပါ:**
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

2. **ကြိုတင်လိုအပ်သော dependency များကို အတည်ပြုပါ:**
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
# main.py - ကျန်းမာရေး စစ်ဆေးမှု endpoint ထည့်ရန်
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### ပြဿနာ: Container App စတင်တက်မှု မအောင်မြင်ခြင်း

**လက္ခဏာများ:**
```
Error: Container failed to start within timeout period
```

**ဖြေရှင်းနည်းများ:**

1. **စတင်ချိန် အချိန်ကန့်သတ်ကို တိုးပါ:**
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

2. **မော်ဒယ် လုပ်ထုံးလမ်းညွှန်များကို အပြောင်းအလဲ လုပ်ပါ:**
```python
# စတင်ချိန်ကို လျော့ချရန် မော်ဒယ်များကို နောက်ကျ၍ တင်ပါ
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

## အထောက်အထားနှင့် ခွင့်ပြုချက် အမှားများ

### ပြဿနာ: Managed Identity ခွင့်ပြုချက် ပယ်ချခံရခြင်း

**လက္ခဏာများ:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**ဖြေရှင်းနည်းများ:**

1. **Role ခန့်ပေးမှုများကို စစ်ဆေးပါ:**
```bash
# လက်ရှိ တာဝန်ပေးအပ်မှုများကို စစ်ဆေးပါ
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **လိုအပ်သော Role များကို ခန့်အပ်ပါ:**
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

3. **အထောက်အထား စမ်းသပ်ပါ:**
```python
# စီမံထားသော ကိုယ်ပိုင်အမှတ်အသား အတည်ပြုမှုကို စမ်းသပ်ပါ
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

### ပြဿနာ: Key Vault ဝင်ရောက်ခွင့် ပိတ်ပင်ခြင်း

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

## မော်ဒယ် တပ်ဆင်မှု မအောင်မြင်ခြင်း

### ပြဿနာ: မော်ဒယ် ဗားရှင်း မရှိနိုင်ခြင်း

**လက္ခဏာများ:**
```
Error: Model version 'gpt-4-32k' is not available
```

**ဖြေရှင်းနည်းများ:**

1. **ရနိုင်သော မော်ဒယ်များကို စစ်ဆေးပါ:**
```bash
# ရရှိနိုင်သည့် မော်ဒယ်များကို စာရင်းပြပါ
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **မော်ဒယ် Fallback များ ကို အသုံးပြုပါ:**
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

3. **တပ်ဆင်မခြင်းမီ မော်ဒယ်ကိုအတည်ပြုပါ:**
```python
# တင်ပို့မီ မော်ဒယ် စစ်ဆေးခြင်း
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

## ဆောင်ရွက်မှုနှင့် အရွယ်ချဲ့ ပြဿနာများ

### ပြဿနာ: တုံ့ပြန်ချိန် ကြာရှည်ခြင်း (Latency အမြင့်)

**လက္ခဏာများ:**
- တုံ့ပြန်ချိန်များ > 30 စက္ကန့်
- Timeout အမှားများ
- အသုံးပြုသူ အတွေ့အကြုံ ဆိုးရြားခြင်း

**ဖြေရှင်းနည်းများ:**

1. **တောင်းဆိုမှု အချိန်ကန့်သတ်များ ထည့်သွင်းပါ:**
```python
# မှန်ကန်သော အချိန်ကန့်သတ်များကို ဆက်တင်ပါ
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

2. **တုံ့ပြန်ချက်များကို Cache လုပ်ပါ:**
```python
# တုံ့ပြန်ချက်များအတွက် Redis ကက်ရှ်
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

3. **Auto-scaling ကို ပြင်ဆင်ပါ:**
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

### ပြဿနာ: မှတ်ဉာဏ် အ မှားများ (Out of Memory)

**လက္ခဏာများ:**
```
Error: Container killed due to memory limit exceeded
```

**ဖြေရှင်းနည်းများ:**

1. **မှတ်ဉာဏ် ချိန်ညှိပမာဏ အသေးစိတ် တိုးမြှင့်ပါ:**
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

2. **မှတ်ဉာဏ် အသုံးစရိတ် ကို အ优化 ပြုလုပ်ပါ:**
```python
# မှတ်ဉာဏ်သက်သာစွာ မော်ဒယ်ကို ကိုင်တွယ်ခြင်း
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # လုပ်ဆောင်မှုမစမီ မှတ်ဉာဏ် အသုံးပြုမှုကို စစ်ဆေးပါ
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # garbage collection ကို အတင်းအကျပ် ပြုလုပ်ပါ
            
        result = await self._process_ai_request(request)
        
        # လုပ်ဆောင်ပြီးနောက် သန့်ရှင်းရေး ပြုလုပ်ပါ
        gc.collect()
        return result
```

## ကုန်ကျစရိတ်နှင့် ကိန်းအရေအတွက် စီမံခန့်ခွဲမှု

### ပြဿနာ: မမျှော်လင့်ထားသော အကုန်ကျစရိတ် မြင့်တက်ခြင်း

**လက္ခဏာများ:**
- Azure ဘဏ်လွှာ မမျှော်လင့်ထားသလို မြင့်တက်ခြင်း
- Token အသုံးပြုမှု ခန့်မှန်းချက်ကျော်လွန်ခြင်း
- ဘတ်ဂျက် သတိပေးချက်များ ဖျက်သိမ်းခြင်း

**ဖြေရှင်းနည်းများ:**

1. **ကုန်ကျစရိတ် ထိန်းချုပ်မှုများ ထည့်သွင်းပါ:**
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

2. **ကုန်ကျစရိတ် သတိပေးချက်များ စနစ် ထူပေါက်ပါ:**
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

3. **မော်ဒယ် ရွေးချယ်မှုကို အထူးပြု၍ တန်ဖိုးသက်သာအောင် စီစဉ်ပါ:**
```python
# ကုန်ကျစရိတ်ကို ဂရုစိုက်၍ မော်ဒယ်ရွေးချယ်ခြင်း
MODEL_COSTS = {
    'gpt-4.1-mini': 0.00015,  # တစ်ထောင် (1K) token အတွက်
    'gpt-4.1': 0.03,          # တစ်ထောင် (1K) token အတွက်
    'gpt-35-turbo': 0.0015  # တစ်ထောင် (1K) token အတွက်
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

## ဒက်ဘတ်ချ် ကိရိယာများနှင့် နည်းလမ်းများ

### AZD ဒက်ဘတ်ချ် အမိန့်များ

```bash
# အသေးစိတ် လော့ဂ်မှတ်တမ်းကို ဖွင့်ပါ
azd up --debug

# တပ်ဆင်မှု အခြေအနေကို စစ်ဆေးပါ
azd show

# လျှောက်လွှာ လော့ဂ်များကို ကြည့်ပါ (စောင့်ကြည့်မှု ဒက်ရှ်ဘုတ်ကို ဖွင့်ပါ)
azd monitor --logs

# တိုက်ရိုက် အတိုင်းအတာများကို ကြည့်ပါ
azd monitor --live

# ပတ်ဝန်းကျင် ပြောင်းလဲနိုင်သည့် တန်ဖိုးများကို စစ်ဆေးပါ
azd env get-values
```

### Diagnostics အတွက် AZD AI Extension အမိန့်များ

အကယ်၍ သင်သည် `azd ai agent init` ဖြင့် agents များ တပ်ဆင်ထားခဲ့ပါက၊ ဤထပ်ဆင့် ကိရိယာများကို အသုံးပြုနိုင်ပါသည်။

```bash
# agents extension ကို ထည့်သွင်းထားခြင်းကို သေချာစေပါ
azd extension install azure.ai.agents

# manifest မှ agent ကို ပြန်စတင်လုပ်ခြင်း သို့မဟုတ် အပ်ဒိတ်လုပ်ခြင်း
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# MCP server ကို အသုံးပြုပြီး AI tools များအား project အခြေအနေကို မေးမြန်းခွင့်ပေးပါ
azd mcp start

# သုံးသပ်ခြင်းနှင့် စစ်ဆေးမှုအတွက် အခြေခံအဆောက်အအုံ ဖိုင်များကို ဖန်တီးပါ
azd infra generate
```

> **အကြံပေးချက်:** `azd infra generate` ကို အသုံးပြု၍ IaC ကို disk ပေါ်သို့ ရေးထုတ်ပါ၊ သင့်အား တပ်ဆင်ပေးထားသော resources များကို တိတိကျကျ စစ်ဆေးနိုင်စေပါသည်။ ဤနည်းလမ်းသည် resource configuration ပြဿနာများကို ဒက်ဘတ်ချ် လုပ်စဉ် အလွန်အဖိုးရှားပါသည်။ အပြည့်အစုံ အချက်အလက်များအတွက် [AZD AI CLI ကိုးကားချက်](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) ကို ကြည့်ပါ။

### အပလီကေးရှင်း ဒက်ဘတ်ချ်

1. **ဖွဲ့စည်းထားသော မှတ်တမ်းရေးခြင်း:**
```python
import logging
import json

# AI အက်ပလီကေးရှင်းများအတွက် ဖွဲ့စည်းထားသော မှတ်တမ်းတင်ခြင်းကို ပြင်ဆင်ပါ
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

2. **ကျန်းမာရေး စစ်ဆေးမှု အစိတ်အပိုင်းများ (Health Check Endpoints):**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # OpenAI ဆက်သွယ်နိုင်မှုကို စစ်ဆေးပါ
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

3. **ဆောင်ရွက်မှု စောင့်ကြည့်ခြင်း:**
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

## ပုံမှန် အမှား ကုဒ်များနှင့် ဖြေရှင်းနည်းများ

| Error Code | Description | Solution |
|------------|-------------|----------|
| 401 | မခွင့်ပြု (Unauthorized) | API keys နှင့် managed identity ဖောင်းလိပ်ချက်ကို စစ်ဆေးပါ |
| 403 | ခွင့်ပိတ်ထား 있음 (Forbidden) | RBAC role ခန့်ပေးမှုများကို အတည်ပြုပြီး စစ်ဆေးပါ |
| 429 | နှုန်းကန့်သတ်ခြင်း (Rate Limited) | exponential backoff ဖြင့် ပြန်ကြိုးစားသည့် လောဂစ်ကို အကောင်အထည်ဖော်ပါ |
| 500 | ဆာဗာ အတွင်းပိုင်း အမှား (Internal Server Error) | မော်ဒယ် တပ်ဆင်မှု အခြေအနေနှင့် logs များကို စစ်ဆေးပါ |
| 503 | ဝန်ဆောင်မှု မရရှိနိုင်ပါ (Service Unavailable) | ဝန်ဆောင်မှု ကျန်းမာရေးနှင့် ဒေသ အရရှိနိုင်မှုကို စစ်ဆေးပါ |

## နောက်ဆက်တွဲ လုပ်ဆောင်ရန်

1. **[AI မော်ဒယ် တပ်ဆင်ခြင်း လမ်းညွှန်](../chapter-02-ai-development/ai-model-deployment.md)** ကို ပြန်လည်ကြည့်ပါ
2. **[Production AI Practices](../chapter-08-production/production-ai-practices.md)** ကို ပြီးမြောက်အောင် လေ့လာပါ
3. **အသိုင်းအဝိုင်း အထောက်အပံ့ ရရှိရန် [Microsoft Foundry Discord](https://aka.ms/foundry/discord) ကို ဝင်ပါ**
4. **AZD သက်ဆိုင်ရာ ပြဿနာများအတွက် အချက်အလက်များကို [AZD GitHub repository](https://github.com/Azure/azure-dev) သို့ တင်ပြပါ**

## အရင်းအမြစ်များ

- [Microsoft Foundry Models Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - သင့် တည်းဖြတ်ပရိုဂရမ်တွင် Azure ပြဿနာဖြေရှင်းမှု skills များ ထည့်သွင်းရန်: `npx skills add microsoft/github-copilot-for-azure`

---

**အခန်း လမ်းညွှန်:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိ အခန်း**: Chapter 7 - Troubleshooting & Debugging
- **⬅️ နောက်ကောက်**: [Debugging Guide](debugging.md)
- **➡️ နောက်ထပ် အခန်း**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 ဆက်စပ် အရာများ**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 ကိုးကားချက်**: [Azure Developer CLI Troubleshooting](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းပါသည်၊ သို့သော် အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါ။ မူလစာတမ်းကို မူလဘာသာဖြင့် အာဏာပိုင် ရင်းမြစ်အဖြစ် ယူဆသင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူ့ဘာသာပြန်တစ်ဦး၏ ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းကြောင့် ဖြစ်ပေါ်နိုင်သည့် နားမလည်မှုများ သို့မဟုတ် မှားဖော်ပြချက်များအတွက် ကျွန်ုပ်တို့သည် တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->