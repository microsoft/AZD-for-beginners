<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b5ae13b6a245ab3a2e6dae923aab65bd",
  "translation_date": "2025-11-20T12:08:13+00:00",
  "source_file": "docs/troubleshooting/ai-troubleshooting.md",
  "language_code": "bn"
}
-->
# এআই-নির্দিষ্ট সমস্যা সমাধানের গাইড

**অধ্যায়ের নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ৭ - সমস্যা সমাধান ও ডিবাগিং
- **⬅️ পূর্ববর্তী**: [ডিবাগিং গাইড](debugging.md)
- **➡️ পরবর্তী অধ্যায়**: [অধ্যায় ৮: প্রোডাকশন ও এন্টারপ্রাইজ প্যাটার্ন](../microsoft-foundry/production-ai-practices.md)
- **🤖 সম্পর্কিত**: [অধ্যায় ২: এআই-প্রথম উন্নয়ন](../microsoft-foundry/microsoft-foundry-integration.md)

**পূর্ববর্তী:** [Production AI Practices](../microsoft-foundry/production-ai-practices.md) | **পরবর্তী:** [AZD দিয়ে শুরু করা](../getting-started/README.md)

এই বিস্তৃত সমস্যা সমাধানের গাইডটি AZD দিয়ে এআই সমাধান ডিপ্লয় করার সময় সাধারণ সমস্যাগুলো সমাধান এবং ডিবাগিং কৌশল সরবরাহ করে, যা Azure AI পরিষেবাগুলোর জন্য নির্দিষ্ট।

## সূচিপত্র

- [Azure OpenAI পরিষেবার সমস্যা](../../../../docs/troubleshooting)
- [Azure AI সার্চ সমস্যাগুলো](../../../../docs/troubleshooting)
- [কন্টেইনার অ্যাপ ডিপ্লয়মেন্ট সমস্যা](../../../../docs/troubleshooting)
- [অথেনটিকেশন এবং অনুমতি ত্রুটি](../../../../docs/troubleshooting)
- [মডেল ডিপ্লয়মেন্ট ব্যর্থতা](../../../../docs/troubleshooting)
- [পারফরম্যান্স এবং স্কেলিং সমস্যা](../../../../docs/troubleshooting)
- [খরচ এবং কোটার ব্যবস্থাপনা](../../../../docs/troubleshooting)
- [ডিবাগিং টুলস এবং কৌশল](../../../../docs/troubleshooting)

## Azure OpenAI পরিষেবার সমস্যা

### সমস্যা: OpenAI পরিষেবা অঞ্চলে উপলব্ধ নয়

**লক্ষণ:**
```
Error: The requested resource type is not available in the location 'westus'
```

**কারণ:**
- নির্বাচিত অঞ্চলে Azure OpenAI উপলব্ধ নয়
- পছন্দের অঞ্চলে কোটার সীমা শেষ
- আঞ্চলিক ক্ষমতার সীমাবদ্ধতা

**সমাধান:**

1. **অঞ্চল উপলব্ধতা পরীক্ষা করুন:**
```bash
# ওপেনএআই এর জন্য উপলব্ধ অঞ্চলগুলির তালিকা করুন
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **AZD কনফিগারেশন আপডেট করুন:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **বিকল্প অঞ্চল ব্যবহার করুন:**
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

### সমস্যা: মডেল ডিপ্লয়মেন্ট কোটার সীমা অতিক্রম

**লক্ষণ:**
```
Error: Deployment failed due to insufficient quota
```

**সমাধান:**

1. **বর্তমান কোটার অবস্থা পরীক্ষা করুন:**
```bash
# কোটার ব্যবহার পরীক্ষা করুন
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **কোটা বৃদ্ধির জন্য অনুরোধ করুন:**
```bash
# কোটা বৃদ্ধি অনুরোধ জমা দিন
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **মডেলের ক্ষমতা অপ্টিমাইজ করুন:**
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

### সমস্যা: অবৈধ API সংস্করণ

**লক্ষণ:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**সমাধান:**

1. **সমর্থিত API সংস্করণ ব্যবহার করুন:**
```python
# সর্বশেষ সমর্থিত সংস্করণ ব্যবহার করুন
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API সংস্করণের সামঞ্জস্য পরীক্ষা করুন:**
```bash
# সমর্থিত API সংস্করণগুলির তালিকা
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI সার্চ সমস্যাগুলো

### সমস্যা: সার্চ সার্ভিসের প্রাইসিং টিয়ার অপর্যাপ্ত

**লক্ষণ:**
```
Error: Semantic search requires Basic tier or higher
```

**সমাধান:**

1. **প্রাইসিং টিয়ার আপগ্রেড করুন:**
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

2. **সেমান্টিক সার্চ নিষ্ক্রিয় করুন (ডেভেলপমেন্ট):**
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

### সমস্যা: ইনডেক্স তৈরির ব্যর্থতা

**লক্ষণ:**
```
Error: Cannot create index, insufficient permissions
```

**সমাধান:**

1. **সার্চ সার্ভিসের কী যাচাই করুন:**
```bash
# অনুসন্ধান পরিষেবা প্রশাসক কী পান
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **ইনডেক্স স্কিমা পরীক্ষা করুন:**
```python
# সূচকের স্কিমা যাচাই করুন
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

3. **ম্যানেজড আইডেন্টিটি ব্যবহার করুন:**
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

## কন্টেইনার অ্যাপ ডিপ্লয়মেন্ট সমস্যা

### সমস্যা: কন্টেইনার বিল্ড ব্যর্থতা

**লক্ষণ:**
```
Error: Failed to build container image
```

**সমাধান:**

1. **Dockerfile সিনট্যাক্স পরীক্ষা করুন:**
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

2. **ডিপেনডেন্সি যাচাই করুন:**
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

3. **হেলথ চেক যোগ করুন:**
```python
# main.py - স্বাস্থ্য পরীক্ষা এন্ডপয়েন্ট যোগ করুন
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### সমস্যা: কন্টেইনার অ্যাপ স্টার্টআপ ব্যর্থতা

**লক্ষণ:**
```
Error: Container failed to start within timeout period
```

**সমাধান:**

1. **স্টার্টআপ টাইমআউট বৃদ্ধি করুন:**
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

2. **মডেল লোডিং অপ্টিমাইজ করুন:**
```python
# স্টার্টআপ সময় কমানোর জন্য মডেলগুলি লেজি লোড করুন
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
        # এখানে এআই ক্লায়েন্ট ইনিশিয়ালাইজ করুন
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # স্টার্টআপ
    app.state.model_manager = ModelManager()
    yield
    # শাটডাউন
    pass

app = FastAPI(lifespan=lifespan)
```

## অথেনটিকেশন এবং অনুমতি ত্রুটি

### সমস্যা: ম্যানেজড আইডেন্টিটির অনুমতি অস্বীকৃত

**লক্ষণ:**
```
Error: Authentication failed for Azure OpenAI Service
```

**সমাধান:**

1. **রোল অ্যাসাইনমেন্ট যাচাই করুন:**
```bash
# বর্তমান ভূমিকা বরাদ্দগুলি পরীক্ষা করুন
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **প্রয়োজনীয় রোল অ্যাসাইন করুন:**
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

3. **অথেনটিকেশন পরীক্ষা করুন:**
```python
# পরীক্ষিত পরিচালিত পরিচয় প্রমাণীকরণ
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

### সমস্যা: কী ভল্ট অ্যাক্সেস অস্বীকৃত

**লক্ষণ:**
```
Error: The user, group or application does not have secrets get permission
```

**সমাধান:**

1. **কী ভল্ট অনুমতি প্রদান করুন:**
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

2. **RBAC ব্যবহার করুন অ্যাক্সেস পলিসির পরিবর্তে:**
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

## মডেল ডিপ্লয়মেন্ট ব্যর্থতা

### সমস্যা: মডেল সংস্করণ উপলব্ধ নয়

**লক্ষণ:**
```
Error: Model version 'gpt-4-32k' is not available
```

**সমাধান:**

1. **উপলব্ধ মডেল পরীক্ষা করুন:**
```bash
# উপলব্ধ মডেলগুলির তালিকা
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **মডেল ফলোব্যাক ব্যবহার করুন:**
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

3. **ডিপ্লয়মেন্টের আগে মডেল যাচাই করুন:**
```python
# পূর্ব-প্রকাশ মডেল যাচাইকরণ
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

## পারফরম্যান্স এবং স্কেলিং সমস্যা

### সমস্যা: উচ্চ লেটেন্সি প্রতিক্রিয়া

**লক্ষণ:**
- প্রতিক্রিয়া সময় > ৩০ সেকেন্ড
- টাইমআউট ত্রুটি
- দুর্বল ব্যবহারকারীর অভিজ্ঞতা

**সমাধান:**

1. **রিকোয়েস্ট টাইমআউট প্রয়োগ করুন:**
```python
# সঠিক টাইমআউট কনফিগার করুন
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

2. **রেসপন্স ক্যাশিং যোগ করুন:**
```python
# প্রতিক্রিয়ার জন্য রেডিস ক্যাশ
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

3. **অটো-স্কেলিং কনফিগার করুন:**
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

### সমস্যা: মেমোরি আউট অফ ত্রুটি

**লক্ষণ:**
```
Error: Container killed due to memory limit exceeded
```

**সমাধান:**

1. **মেমোরি বরাদ্দ বৃদ্ধি করুন:**
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

2. **মেমোরি ব্যবহারের অপ্টিমাইজ করুন:**
```python
# মেমরি-দক্ষ মডেল পরিচালনা
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # প্রক্রিয়াকরণের আগে মেমরি ব্যবহার পরীক্ষা করুন
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # গার্বেজ সংগ্রহ বাধ্য করুন
            
        result = await self._process_ai_request(request)
        
        # প্রক্রিয়াকরণের পরে পরিষ্কার করুন
        gc.collect()
        return result
```

## খরচ এবং কোটার ব্যবস্থাপনা

### সমস্যা: অপ্রত্যাশিত উচ্চ খরচ

**লক্ষণ:**
- Azure বিল প্রত্যাশার চেয়ে বেশি
- টোকেন ব্যবহারের অনুমান অতিক্রম
- বাজেট অ্যালার্ট সক্রিয়

**সমাধান:**

1. **খরচ নিয়ন্ত্রণ প্রয়োগ করুন:**
```python
# টোকেন ব্যবহারের ট্র্যাকিং
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

2. **খরচ অ্যালার্ট সেট করুন:**
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

3. **মডেল নির্বাচন অপ্টিমাইজ করুন:**
```python
# খরচ-সচেতন মডেল নির্বাচন
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # প্রতি ১কে টোকেন
    'gpt-4': 0.03,          # প্রতি ১কে টোকেন
    'gpt-35-turbo': 0.0015  # প্রতি ১কে টোকেন
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

## ডিবাগিং টুলস এবং কৌশল

### AZD ডিবাগিং কমান্ড

```bash
# বিস্তারিত লগিং সক্রিয় করুন
azd up --debug

# ডিপ্লয়মেন্ট স্ট্যাটাস পরীক্ষা করুন
azd show

# ডিপ্লয়মেন্ট লগ দেখুন
azd logs --follow

# পরিবেশ ভেরিয়েবল পরীক্ষা করুন
azd env get-values
```

### অ্যাপ্লিকেশন ডিবাগিং

1. **স্ট্রাকচার্ড লগিং:**
```python
import logging
import json

# এআই অ্যাপ্লিকেশনের জন্য কাঠামোগত লগিং কনফিগার করুন
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

2. **হেলথ চেক এন্ডপয়েন্ট:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # ওপেনএআই সংযোগ পরীক্ষা করুন
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # সার্চ পরিষেবা পরীক্ষা করুন
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

3. **পারফরম্যান্স মনিটরিং:**
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

## সাধারণ ত্রুটি কোড এবং সমাধান

| ত্রুটি কোড | বর্ণনা | সমাধান |
|------------|-------------|----------|
| 401 | অনুমোদিত নয় | API কী এবং ম্যানেজড আইডেন্টিটি কনফিগারেশন পরীক্ষা করুন |
| 403 | নিষিদ্ধ | RBAC রোল অ্যাসাইনমেন্ট যাচাই করুন |
| 429 | রেট সীমিত | এক্সপোনেনশিয়াল ব্যাকঅফ সহ রিট্রাই লজিক প্রয়োগ করুন |
| 500 | অভ্যন্তরীণ সার্ভার ত্রুটি | মডেল ডিপ্লয়মেন্ট স্ট্যাটাস এবং লগ পরীক্ষা করুন |
| 503 | পরিষেবা অপ্রাপ্য | পরিষেবার স্বাস্থ্য এবং আঞ্চলিক উপলব্ধতা যাচাই করুন |

## পরবর্তী পদক্ষেপ

1. **[AI মডেল ডিপ্লয়মেন্ট গাইড](ai-model-deployment.md)** পর্যালোচনা করুন ডিপ্লয়মেন্টের সেরা অনুশীলনের জন্য
2. **[Production AI Practices](production-ai-practices.md)** সম্পূর্ণ করুন এন্টারপ্রাইজ-প্রস্তুত সমাধানের জন্য
3. **[Microsoft Foundry Discord](https://aka.ms/foundry/discord)**-এ যোগ দিন কমিউনিটি সাপোর্টের জন্য
4. **সমস্যা জমা দিন** [AZD GitHub রিপোজিটরিতে](https://github.com/Azure/azure-dev) AZD-নির্দিষ্ট সমস্যার জন্য

## রিসোর্স

- [Azure OpenAI পরিষেবা সমস্যা সমাধান](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [কন্টেইনার অ্যাপ সমস্যা সমাধান](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI সার্চ সমস্যা সমাধান](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**অধ্যায়ের নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ৭ - সমস্যা সমাধান ও ডিবাগিং
- **⬅️ পূর্ববর্তী**: [ডিবাগিং গাইড](debugging.md)
- **➡️ পরবর্তী অধ্যায়**: [অধ্যায় ৮: প্রোডাকশন ও এন্টারপ্রাইজ প্যাটার্ন](../microsoft-foundry/production-ai-practices.md)
- [Azure Developer CLI সমস্যা সমাধান](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:  
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতার জন্য চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিটিকে প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যা হলে আমরা দায়বদ্ধ থাকব না।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->