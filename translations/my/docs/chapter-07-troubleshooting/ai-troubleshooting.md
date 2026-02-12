# AI အထူးပြဿနာဖြေရှင်း လမ်းညွှန်

**အခန်း လမ်းညွှန်:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD အတွက် အခြေခံများ](../../README.md)
- **📖 ယခု အခန်း**: အခန်း 7 - ပြဿနာဖြေရှင်းခြင်းနှင့် အမှားရှာဖွေခြင်း
- **⬅️ ယခင်**: [ဒေဘာင် လမ်းညွှန်](debugging.md)
- **➡️ နောက်တစ်ခန်း**: [အခန်း 8: ထုတ်လုပ်မှုနှင့် လုပ်ငန်းပုံစံများ](../chapter-08-production/production-ai-practices.md)
- **🤖 ဆက်နွယ်**: [အခန်း 2: AI-ဦးစွာ ဖွံ့ဖြိုးရေး](../chapter-02-ai-development/microsoft-foundry-integration.md)

**ယခင်:** [ထုတ်လုပ်ရေး AI လေ့လာမှုများ](../chapter-08-production/production-ai-practices.md) | **နောက်တစ်ခု:** [AZD အခြေခံများ](../chapter-01-foundation/azd-basics.md)

ဒီ စုံလင်သော ပြဿနာဖြေရှင်း လမ်းညွှန်သည် AZD ဖြင့် AI ဖြေရှင်းချက်များကို တပ်ဆင်ရာတွင် တွေ့ကြုံနိုင်သည့် ပုံမှန် ပြဿနာများကို ဖြေရှင်းရန် နည်းလမ်းများနှင့် Azure AI ဝန်ဆောင်မှုများအတွက် သီးသန့် အမှားရှာဖွေခြင်း နည်းများကို ပေးပါသည်။

## အကြောင်းအရာ စာရင်း

- [Azure OpenAI Service ပြဿနာများ](../../../../docs/chapter-07-troubleshooting)
- [Azure AI Search ပြဿနာများ](../../../../docs/chapter-07-troubleshooting)
- [Container Apps တပ်ဆင်ရာ ပြဿနာများ](../../../../docs/chapter-07-troubleshooting)
- [အတည်ပြုခြင်းနှင့် ခွင့်ပြုချက် အမှားများ](../../../../docs/chapter-07-troubleshooting)
- [မော်ဒယ် တပ်ဆင်မှု မအောင်မြင်ခြင်းများ](../../../../docs/chapter-07-troubleshooting)
- [စွမ်းဆောင်ရည်နှင့် တိုးချဲ့ခြင်း ပြဿနာများ](../../../../docs/chapter-07-troubleshooting)
- [စရိတ်နှင့် Quota စီမံခန့်ခွဲမှု](../../../../docs/chapter-07-troubleshooting)
- [အမှားရှာဖွေခြင်း ကိရိယာများနှင့် နည်းပညာများ](../../../../docs/chapter-07-troubleshooting)

## Azure OpenAI Service Issues

### ပြဿနာ: ဒေသတွင် OpenAI ဝန်ဆောင်မှု မရရှိနိုင်ခြင်း

**လက္ခဏာများ:**
```
Error: The requested resource type is not available in the location 'westus'
```

**အကြောင်းရင်းများ:**
- Azure OpenAI သတ်မှတ်ထားသော ဒေသတွင် မရရှိနိုင်ခြင်း
- ရွေးချယ်ထားသော ဒေသများတွင် Quota သုံးစွဲပြီးဆုံးခြင်း
- ဒေသဆိုင်ရာ စွမ်းဆောင်နိုင်မှု ကန့်သတ်ချက်များ

**ဖြေရှင်းနည်းများ:**

1. **ဒေသ ရရှိနိုင်မှု စစ်ဆေးပါ:**
```bash
# OpenAI အတွက် ရရှိနိုင်သော ဒေသများကို စာရင်းပြပါ
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **AZD ဖော်ပြချက်ကို အပ်ဒိတ်လုပ်ပါ:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **အခြား ဒေသများကို အသုံးပြုပါ:**
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

### ပြဿနာ: မော်ဒယ် တပ်ဆင်မှုအတွက် Quota ကျော်လွန်ခြင်း

**လက္ခဏာများ:**
```
Error: Deployment failed due to insufficient quota
```

**ဖြေရှင်းနည်းများ:**

1. **လက်ရှိ Quota ကို စစ်ဆေးပါ:**
```bash
# ကွိုတာအသုံးပြုမှုကို စစ်ဆေးပါ
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Quota တိုးမြှင့်ရန် တောင်းဆိုပါ:**
```bash
# ခွင့်အကန့်အသတ် တိုးရန် တောင်းဆိုချက် တင်သွင်းပါ
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **မော်ဒယ်စွမ်းရည် ကို တိကျစွာ ထိန်းသိမ်းပါ:**
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

### ပြဿနာ: မမှန်ကန်သော API ဗားရှင်း

**လက္ခဏာများ:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**ဖြေရှင်းနည်းများ:**

1. **ထောက်ပံ့ထားသော API ဗားရှင်းကို အသုံးပြုပါ:**
```python
# လက်ရှိထောက်ပံ့ပေးသော နောက်ဆုံးဗားရှင်းကို အသုံးပြုပါ
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API ဗားရှင်း ကို ကိုက်ညီမှုအတွက် စစ်ဆေးပါ:**
```bash
# ထောက်ခံထားသော API ဗားရှင်းများကို စာရင်းပြပါ
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search ပြဿနာများ

### ပြဿနာ: Search ဝန်ဆောင်မှု စျေးနှုန်း အဆင့် မလုံလောက်ခြင်း

**လက္ခဏာများ:**
```
Error: Semantic search requires Basic tier or higher
```

**ဖြေရှင်းနည်းများ:**

1. **စျေးနှုန်း အဆင့်ကို အထက်တင်ပါ:**
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

2. **Semantic Search ကို (ဖွံ့ဖြိုးမှုအတွက်) ပိတ်ပါ:**
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

### ပြဿနာ: Index ဖန်တီးမှု မအောင်မြင်ခြင်း

**လက္ခဏာများ:**
```
Error: Cannot create index, insufficient permissions
```

**ဖြေရှင်းနည်းများ:**

1. **Search ဝန်ဆောင်မှု Key များကို စစ်ဆေးပါ:**
```bash
# ရှာဖွေရေး ဝန်ဆောင်မှု အုပ်ချုပ်သူ ကီးကို ရယူပါ
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Index schema ကို စစ်ဆေးပါ:**
```python
# အချိုးအဆက် အညွှန်း ဖွဲ့စည်းပုံကို စစ်ဆေးပါ
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

## Container Apps တပ်ဆင်ရာ ပြဿနာများ

### ပြဿနာ: Container ဆောက်လုပ်မှု မအောင်မြင်ခြင်း

**လက္ခဏာများ:**
```
Error: Failed to build container image
```

**ဖြေရှင်းနည်းများ:**

1. **Dockerfile စာလုံးပေါင်းနှင့် စက်တင်ကို စစ်ဆေးပါ:**
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

2. **လိုအပ်သည့် Dependencies များကို စစ်ဆေးပါ:**
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

3. **Health Check ကို ထည့်ပါ:**
```python
# main.py - health check endpoint ကို ထည့်ပါ
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### ပြဿနာ: Container App စတင်မှု မအောင်မြင်ခြင်း

**လက္ခဏာများ:**
```
Error: Container failed to start within timeout period
```

**ဖြေရှင်းနည်းများ:**

1. **စတင်ချိန်အတွက် Timeout ကို တိုးပါ:**
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

2. **မော်ဒယ် load လုပ်မှုကို တိုးတက်အောင် ပြင်ဆင်ပါ:**
```python
# မော်ဒယ်များကို လိုအပ်သည့်အချိန်တွင်သာ တင်ဆောင်၍ စတင်ချိန်ကို လျော့ချပပါ
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
        # ဒီမှာ AI client ကို စတင်အစပြုပါ
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

## အတည်ပြုခြင်းနှင့် ခွင့်ပြုချက် အမှားများ

### ပြဿနာ: Managed Identity အတွက် ခွင့်ပြုချက် ငြင်းပယ်ခြင်း

**လက္ခဏာများ:**
```
Error: Authentication failed for Azure OpenAI Service
```

**ဖြေရှင်းနည်းများ:**

1. **Role သတ်မှတ်ချက်များကို စစ်ဆေးပါ:**
```bash
# လက်ရှိ အခန်းကဏ္ဍ ခန့်အပ်မှုများကို စစ်ဆေးပါ
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **လိုအပ်သော Role များကို ပေးအပ်ပါ:**
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

3. **အတည်ပြုချက်ကို စမ်းသပ်ပါ:**
```python
# စီမံထားသော identity အတည်ပြုမှုကို စမ်းသပ်ပါ
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

### ပြဿနာ: Key Vault သို့ ဝင်ခွင့် မရရှိခြင်း

**လက္ခဏာများ:**
```
Error: The user, group or application does not have secrets get permission
```

**ဖြေရှင်းနည်းများ:**

1. **Key Vault ခွင့်ပြုချက်များကို ပေးပါ:**
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

## မော်ဒယ် တပ်ဆင်မှု မအောင်မြင်ခြင်းများ

### ပြဿနာ: မော်ဒယ် ဗားရှင်း မရရှိနိုင်ခြင်း

**လက္ခဏာများ:**
```
Error: Model version 'gpt-4-32k' is not available
```

**ဖြေရှင်းနည်းများ:**

1. **ရရှိနိုင်သည့် မော်ဒယ်များကို စစ်ဆေးပါ:**
```bash
# ရနိုင်သည့် မော်ဒယ်များကို စာရင်းပြပါ
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **မော်ဒယ် မရရှိပါက Fallback များကို အသုံးပြုပါ:**
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

3. **တပ်ဆင်မလုပ်ခင် မော်ဒယ်ကို သေချာ စစ်ဆေးပါ:**
```python
# တပ်ဆင်မှုမပြုမီ မော်ဒယ် အတည်ပြုခြင်း
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

## စွမ်းဆောင်ရည်နှင့် တိုးချဲ့ခြင်း ပြဿနာများ

### ပြဿနာ: ကြာမြင့်သော တုံ့ပြန်ချိန်များ

**လက္ခဏာများ:**
- တုံ့ပြန်ချိန်များ > 30 စက္ကန့်
- Timeout အမှားများ
- အသုံးပြုသူ အတွေ့အကြုံ မကောင်းမှု

**ဖြေရှင်းနည်းများ:**

1. **တောင်းဆိုမှုများအတွက် Timeout မိမိသတ်မှတ်ပါ:**
```python
# သင့်တော်သော အချိန်ကန့်သတ်များကို သတ်မှတ်ပါ
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

2. **တုံ့ပြန်မှုကို Caching ထည့်ပါ:**
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

### ပြဿနာ: မှတ်ဉာဏ် ဆုံးရှုံးမှု အမှားများ

**လက္ခဏာများ:**
```
Error: Container killed due to memory limit exceeded
```

**ဖြေရှင်းနည်းများ:**

1. **မှတ်ဉာဏ် ခန့်မှန်းချက်ကို တိုးပါ:**
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

2. **မှတ်ဉာဏ် အသုံးပြုမှုကို တိုးတက်အောင် ပြင်ဆင်ပါ:**
```python
# မှတ်ဉာဏ်ထိရောက်စွာ အသုံးပြုနိုင်သည့် မော်ဒယ်ကို ကိုင်တွယ်ခြင်း
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # လုပ်ဆောင်မီ မှတ်ဉာဏ်အသုံးပြုမှုကို စစ်ဆေးပါ
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # မလိုအပ်သော အရာများ ဖယ်ရှားရန် မှတ်ဉာဏ်သန့်ရှင်းရေးကို အတင်းအကျပ် ဆောင်ရွက်ပါ
            
        result = await self._process_ai_request(request)
        
        # လုပ်ဆောင်ပြီးနောက် သန့်ရှင်းရေး ပြုလုပ်ပါ
        gc.collect()
        return result
```

## စရိတ်နှင့် Quota စီမံခန့်ခွဲမှု

### ပြဿနာ: မမျှော်လင့်ထားသော အထွက်ချေးမြင့်သော စရိတ်

**လက္ခဏာများ:**
- Azure ဘီလ် များ မမျှော်လင့်ထားသလို မြင့်တက်ခြင်း
- Token သုံးစွဲမှု ခန့်မှန်းချက်ကျော်လွန်ခြင်း
- ဘတ်ဂျက် သတိပေးချက်များ တက်ခြင်း

**ဖြေရှင်းနည်းများ:**

1. **ကုန်ကျစရိတ် ထိန်းချုပ်မှုများ ထည့်သွင်းပါ:**
```python
# တိုကင် အသုံးပြုမှု စောင့်ကြည့်ခြင်း
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

2. **ကုန်ကျစရိတ် သတိပေးချက်များ ဆက်တင်ပါ:**
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

3. **မော်ဒယ် ရွေးချယ်မှုကို တိုးတက်အောင် ပြင်ဆင်ပါ:**
```python
# ကုန်ကျစရိတ်ကို သတိပြု၍ မော်ဒယ် ရွေးချယ်ခြင်း
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # တစ်ထောင် token လျှင်
    'gpt-4': 0.03,          # တစ်ထောင် token လျှင်
    'gpt-35-turbo': 0.0015  # တစ်ထောင် token လျှင်
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

## အမှားရှာဖွေခြင်း ကိရိယာများနှင့် နည်းပညာများ

### AZD အမှားရှာဖွေ အမိန့်များ

```bash
# အသေးစိတ် လော့ဂ်ထုတ်ခြင်းကို ဖွင့်ပါ
azd up --debug

# တပ်ဆင်မှု အခြေအနေကို စစ်ဆေးပါ
azd show

# အက်ပလီကေးရှင်း လော့ဂ်များကို ကြည့်ပါ (စောင့်ကြည့်ရေး ဒက်ရှ်ဘုတ်ကို ဖွင့်သည်)
azd monitor --logs

# တိုက်ရိုက် မက်ထရစ်များကို ကြည့်ပါ
azd monitor --live

# ပတ်ဝန်းကျင် ဗယ်ရီယာဘယ်များကို စစ်ဆေးပါ
azd env get-values
```

### လျှောက်လွှာ အမှားရှာဖွေခြင်း

1. **စနစ်တကျ မှတ်တမ်းတင်ခြင်း (Structured Logging):**
```python
import logging
import json

# AI အက်ပ်များအတွက် ဖွဲ့စည်းထားသော လော့ဂ်ကို ချိန်ညှိပါ
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

2. **ကျန်းမာရေး စစ်ဆေးရေး Endpoints:**
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
    
    # ရှာဖွေရေး ဝန်ဆောင်မှုကို စစ်ဆေးပါ
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

3. **စွမ်းဆောင်ရည် ကြည့်ရှုစစ်ဆေးခြင်း:**
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

| အမှား ကုဒ် | ဖော်ပြချက် | ဖြေရှင်းနည်း |
|------------|-------------|----------|
| 401 | ခွင့်ပြုချက် မရှိပါ | API keys နှင့် managed identity ဖော်ပြချက်ကို စစ်ဆေးပါ |
| 403 | တားမြစ်ထားသည် | RBAC အခန်းကဏ္ဍ သတ်မှတ်ချက်များကို အတည်ပြုပါ |
| 429 | Rate ကို ကန့်သတ်ထားသည် | exponential backoff ဖြင့် retry logic ကို အကောင်အထည်ဖော်ပါ |
| 500 | ဆာဗာ အတွင်း အမှား | မော်ဒယ် တပ်ဆင်မှု အခြေအနေနှင့် logs များကို စစ်ဆေးပါ |
| 503 | ဝန်ဆောင်မှု မရရှိနိုင်ခြင်း | ဝန်ဆောင်မှု အခြေအနေ (health) နှင့် ဒေသအရ ရရှိနိုင်မှုကို စစ်ဆေးပါ |

## နောက်ဆက်တွဲ လုပ်ဆောင်ရန်

1. **ပြန်လည်သုံးသပ်ပါ [AI မော်ဒယ် တပ်ဆင်ခြင်း လမ်းညွှန်](../chapter-02-ai-development/ai-model-deployment.md)** တပ်ဆင်မှု အကောင်းဆုံး လေ့ကျင့်နည်းများအတွက်
2. **[ထုတ်လုပ်ရေး AI လေ့လာမှုများ](../chapter-08-production/production-ai-practices.md) ကို ပြီးစီးပါ** စီးပွားရေးအသင့်ဖြစ်သော ဖြေရှင်းချက်များအတွက်
3. **[Microsoft Foundry Discord](https://aka.ms/foundry/discord) တွင် ပါဝင်ဆောင်ရွက်ပါ** အသိုင်းအဝိုင်း အထောက်အပံ့အတွက်
4. **ပြဿနာများ တင်ဆက်ပါ** ကို [AZD GitHub repository](https://github.com/Azure/azure-dev) တွင် AZD သက်ဆိုင်ရာ ပြဿနာများအတွက်

## ရင်းမြစ်များ

- [Azure OpenAI ဝန်ဆောင်မှု ပြဿနာဖြေရှင်းခြင်း](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps ပြဿနာဖြေရှင်းခြင်း](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search ပြဿနာဖြေရှင်းခြင်း](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**အခန်း လမ်းညွှန်:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD အတွက် အခြေခံများ](../../README.md)
- **📖 ယခု အခန်း**: အခန်း 7 - ပြဿနာဖြေရှင်းခြင်းနှင့် အမှားရှာဖွေခြင်း
- **⬅️ ယခင်**: [ဒေဘာင် လမ်းညွှန်](debugging.md)
- **➡️ နောက်တစ်ခန်း**: [အခန်း 8: ထုတ်လုပ်မှုနှင့် လုပ်ငန်းပုံစံများ](../chapter-08-production/production-ai-practices.md)
- **🤖 ဆက်နွယ်**: [အခန်း 2: AI-ဦးစွာ ဖွံ့ဖြိုးရေး](../chapter-02-ai-development/microsoft-foundry-integration.md)
- [Azure Developer CLI ပြဿနာဖြေရှင်းခြင်း](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ပယ်ချခံချက်：
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်တော်တို့သည် တိကျမှန်ကန်စေရန် ကြိုးစားပါသော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်သည်ကို ကျေးဇူးပြု၍ သတိပြုပါ။ မူလစာတမ်း (မူလဘာသာ) ကို အာဏာသိမ်းသော အရင်းအမြစ်အဖြစ် သတ်မှတ်စဉ်းစားရမည်ဖြစ်သည်။ အရေးကြီးသော အချက်အလက်များအတွက် သက်ဆိုင်ရာ ပရော်ဖက်ရှင်နယ် လူဘာသာပြန်သူ၏ ဘာသာပြန်ချက်ကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်အသုံးပြုမှုကြောင့် ဖြစ်ပေါ်လာနိုင်သည့် နားလည်မှုမှားယွင်းခြင်းများ သို့မဟုတ် အဓိပ္ပာယ်မမှန်ကန်မှုများအတွက် ကျွန်ုပ်တို့မှာ တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->