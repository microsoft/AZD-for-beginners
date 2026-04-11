# AI-নির্দিষ্ট সমস্যার সমাধান নির্দেশিকা

**চ্যাপটার নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান চ্যাপটার**: চ্যাপটার ৭ - সমস্যার সমাধান ও ডিবাগিং
- **⬅️ পূর্ববর্তী**: [ডিবাগিং গাইড](debugging.md)
- **➡️ পরবর্তী চ্যাপটার**: [চ্যাপটার ৮: প্রোডাকশন ও এন্টারপ্রাইজ প্যাটার্নস](../chapter-08-production/production-ai-practices.md)
- **🤖 সম্পর্কিত**: [চ্যাপটার ২: AI-ফার্স্ট ডেভেলপমেন্ট](../chapter-02-ai-development/microsoft-foundry-integration.md)

এই ব্যাপক সমস্যার সমাধান নির্দেশিকা AZD দিয়ে AI সমাধান ডিপ্লয় করার সময় সাধারণ সমস্যাগুলোর সমাধান এবং Azure AI সার্ভিসগুলোতে বিশেষ ডিবাগিং কৌশলগুলি প্রদান করে।

## বিষয়সূচি

- [Microsoft Foundry Models সার্ভিস সমস্যাসমূহ](#azure-openai-service-issues)
- [Azure AI সার্চ সমস্যাসমূহ](#azure-ai-সার্চ-সমস্যাসমূহ)
- [কন্টেইনার অ্যাপস ডিপ্লয়মেন্ট সমস্যা](#কন্টেইনার-অ্যাপস-ডিপ্লয়মেন্ট-সমস্যা)
- [প্রমাণীকরণ এবং অনুমতি ত্রুটি](#প্রমাণীকরণ-এবং-অনুমতি-ত্রুটি)
- [মডেল ডিপ্লয়মেন্ট ব্যর্থতা](#মডেল-ডিপ্লয়মেন্ট-ব্যর্থতা)
- [পারফরম্যান্স এবং স্কেলিং সমস্যা](#পারফরম্যান্স-এবং-স্কেলিং-সমস্যা)
- [খরচ এবং কোটা ব্যবস্থাপনা](#খরচ-এবং-কোটা-ব্যবস্থাপনা)
- [ডিবাগিং টুলস এবং কৌশল](#ডিবাগিং-টুলস-এবং-কৌশল)

## Microsoft Foundry Models সার্ভিস সমস্যাসমূহ

### সমস্যা: নির্দিষ্ট অঞ্চলে OpenAI সার্ভিস উপলব্ধ নয়

**লক্ষণসমূহ:**
```
Error: The requested resource type is not available in the location 'westus'
```
  
**কারণসমূহ:**
- Microsoft Foundry Models নির্বাচিত অঞ্চলে উপলব্ধ নয়
- পছন্দ করা অঞ্চলে কোটা শেষ হয়ে গেছে
- আঞ্চলিক ক্ষমতা সীমাবদ্ধতা

**সমাধানসমূহ:**

1. **অঞ্চল উপলব্ধতা পরীক্ষা করুন:**
```bash
# OpenAI এর জন্য উপলব্ধ অঞ্চলগুলি তালিকাভুক্ত করুন
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
  
### সমস্যা: মডেল ডিপ্লয়মেন্ট কোটা অতিক্রম

**লক্ষণসমূহ:**
```
Error: Deployment failed due to insufficient quota
```
  
**সমাধানসমূহ:**

1. **বর্তমান কোটা পরীক্ষা করুন:**
```bash
# কোটা ব্যবহারের চেক করুন
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
  
### সমস্যা: অবৈধ API সংস্করণ

**লক্ষণসমূহ:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```
  
**সমাধানসমূহ:**

1. **সমর্থিত API সংস্করণ ব্যবহার করুন:**
```python
# সর্বশেষ সমর্থিত সংস্করণ ব্যবহার করুন
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```
  
2. **API সংস্করণের কম্প্যাটিবিলিটি পরীক্ষা করুন:**
```bash
# সমর্থিত এপিআই সংস্করণসমূহ তালিকা করুন
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```
  
## Azure AI সার্চ সমস্যাসমূহ

### সমস্যা: সার্চ সার্ভিসের মূল্য পরিকল্পনা পর্যাপ্ত নয়

**লক্ষণসমূহ:**
```
Error: Semantic search requires Basic tier or higher
```
  
**সমাধানসমূহ:**

1. **মূল্য পরিকল্পনা উন্নীত করুন:**
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
  
2. **সেম্যান্টিক সার্চ নিষ্ক্রিয় করুন (ডেভেলপমেন্টে):**
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
  
### সমস্যা: ইনডেক্স তৈরি ব্যর্থ

**লক্ষণসমূহ:**
```
Error: Cannot create index, insufficient permissions
```
  
**সমাধানসমূহ:**

1. **সার্চ সার্ভিস কী যাচাই করুন:**
```bash
# সার্চ সার্ভিস অ্যাডমিন কী পান
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```
  
2. **ইনডেক্স স্কিমা পরীক্ষা করুন:**
```python
# ইনডেক্স স্কিমা যাচাই করুন
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
  
## কন্টেইনার অ্যাপস ডিপ্লয়মেন্ট সমস্যা

### সমস্যা: কন্টেইনার বিল্ড ব্যর্থ

**লক্ষণসমূহ:**
```
Error: Failed to build container image
```
  
**সমাধানসমূহ:**

1. **ডকারফাইল সিনট্যাক্স পরীক্ষা করুন:**
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
  
2. **নির্ভরশীলতাগুলো যাচাই করুন:**
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
  
### সমস্যা: কন্টেইনার অ্যাপ স্টার্টআপ ব্যর্থ

**লক্ষণসমূহ:**
```
Error: Container failed to start within timeout period
```
  
**সমাধানসমূহ:**

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
# স্টার্টআপ সময় কমানোর জন্য মডেলগুলি আলসেমি লোড করুন
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
        # এখানে AI ক্লায়েন্ট আরম্ভ করুন
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
  
## প্রমাণীকরণ এবং অনুমতি ত্রুটি

### সমস্যা: ম্যানেজড আইডেন্টিটি অনুমতি অস্বীকৃত

**লক্ষণসমূহ:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```
  
**সমাধানসমূহ:**

1. **রোল অ্যাসাইনমেন্ট যাচাই করুন:**
```bash
# বর্তমান রোল অ্যাসাইনমেন্টগুলি পরীক্ষা করুন
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```
  
2. **প্রয়োজনীয় রোল অ্যাসাইন করুন:**
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
  
3. **প্রমাণীকরণ পরীক্ষা করুন:**
```python
# পরিচালিত পরিচয় প্রমাণীকরণ পরীক্ষা করুন
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

**লক্ষণসমূহ:**
```
Error: The user, group or application does not have secrets get permission
```
  
**সমাধানসমূহ:**

1. **কী ভল্ট পারমিশন দিন:**
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
  
2. **অ্যাক্সেস পলিসির পরিবর্তে RBAC ব্যবহার করুন:**
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
  
## মডেল ডিপ্লয়মেন্ট ব্যর্থতা

### সমস্যা: মডেল সংস্করণ উপলব্ধ নয়

**লক্ষণসমূহ:**
```
Error: Model version 'gpt-4-32k' is not available
```
  
**সমাধানসমূহ:**

1. **উপলব্ধ মডেলগুলি পরীক্ষা করুন:**
```bash
# উপলব্ধ মডেল তালিকা করুন
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```
  
2. **মডেল ফেলব্যাক ব্যবহার করুন:**
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
  
3. **ডিপ্লয়মেন্টের আগে মডেল যাচাই করুন:**
```python
# প্রি-ডিপ্লয়মেন্ট মডেল যাচাই
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

### সমস্যা: উচ্চ লেটেন্সি প্রতিক্রিয়া

**লক্ষণসমূহ:**
- প্রতিক্রিয়া সময় > ৩০ সেকেন্ড
- টাইমআউট ত্রুটি
- খারাপ ব্যবহারকারীর অভিজ্ঞতা

**সমাধানসমূহ:**

1. **রিকোয়েস্ট টাইমআউট প্রয়োগ করুন:**
```python
# সঠিক টাইমআউটগুলি কনফিগার করুন
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
  
2. **প্রতিক্রিয়া ক্যাশিং যোগ করুন:**
```python
# প্রতিক্রিয়ার জন্য রেডিস ক্যাশে
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
  
### সমস্যা: মেমরি আউট অভ এরর

**লক্ষণসমূহ:**
```
Error: Container killed due to memory limit exceeded
```
  
**সমাধানসমূহ:**

1. **মেমরি বরাদ্দ বৃদ্ধি করুন:**
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
  
2. **মেমরি ব্যবহার অপ্টিমাইজ করুন:**
```python
# স্মৃতি-সাশ্রয়ী মডেল পরিচালনা
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # প্রক্রিয়াকরণের আগে স্মৃতি ব্যবহার পরীক্ষা করুন
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # জবরদস্তি গারবেজ কালেকশন
            
        result = await self._process_ai_request(request)
        
        # প্রক্রিয়াকরণের পরে পরিষ্কার করুন
        gc.collect()
        return result
```
  
## খরচ এবং কোটা ব্যবস্থাপনা

### সমস্যা: অপ্রত্যাশিত উচ্চ খরচ

**লক্ষণসমূহ:**
- প্রাপ্ত বিল প্রত্যাশার চেয়ে বেশি
- টোকেন ব্যবহার অনুমান ছাড়িয়ে গেছে
- বাজেট সতর্কতা চালু হয়েছে

**সমাধানসমূহ:**

1. **খরচ নিয়ন্ত্রণ প্রয়োগ করুন:**
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
  
2. **খরচ সতর্কতা সেট করুন:**
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
# খরচ সচেতন মডেল নির্বাচন
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
  
## ডিবাগিং টুলস এবং কৌশল

### AZD ডিবাগিং কমান্ডসমূহ

```bash
# বিস্তারিত লগিং সক্ষম করুন
azd up --debug

# স্থাপন অবস্থা পরীক্ষা করুন
azd show

# অ্যাপ্লিকেশন লগ দেখুন (পর্যবেক্ষণ ড্যাশবোর্ড খুলবে)
azd monitor --logs

# সরাসরি মাত্রা দেখুন
azd monitor --live

# পরিবেশ ভেরিয়েবল পরীক্ষা করুন
azd env get-values
```
  
### AZD AI এক্সটেনশান ডায়াগনস্টিক কমান্ডসমূহ

আপনি যদি `azd ai agent init` ব্যবহার করে এজেন্ট ডিপ্লয় করে থাকেন, তাহলে এই অতিরিক্ত টুলস উপলব্ধ:

```bash
# নিশ্চিত করুন যে এজেন্টের এক্সটেনশন ইনস্টল করা রয়েছে
azd extension install azure.ai.agents

# ম্যানিফেস্ট থেকে একটি এজেন্ট পুনরায় আরম্ভ বা আপডেট করুন
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# AI সরঞ্জামকে প্রকল্পের অবস্থা জানাতে MCP সার্ভার ব্যবহার করুন
azd mcp start

# পর্যালোচনা এবং নিরীক্ষার জন্য ইনফ্রাস্ট্রাকচার ফাইল তৈরি করুন
azd infra generate
```
  
> **টিপ:** পরিকাঠামো ডিস্কে লেখার জন্য `azd infra generate` ব্যবহার করুন যাতে আপনি ঠিক কী রিসোর্স প্রোভিশন করা হয়েছে তা পরীক্ষা করতে পারেন। এটি রিসোর্স কনফিগারেশন সমস্যা ডিবাগ করার সময় খুবই গুরুত্বপূর্ণ। পূর্ণ বিবরণের জন্য [AZD AI CLI রেফারেন্স](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) দেখুন।

### অ্যাপ্লিকেশন ডিবাগিং

1. **স্ট্রাকচার্ড লগিং:**
```python
import logging
import json

# এআই অ্যাপ্লিকেশনের জন্য কাঠামোবদ্ধ লগিং কনফিগার করুন
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
  
2. **হেলথ চেক এন্ডপয়েন্টস:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # OpenAI সংযোগ পরীক্ষা করুন
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # সার্চ সার্ভিস পরীক্ষা করুন
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
  
## সাধারণ ত্রুটি কোড এবং সমাধানসমূহ

| ত্রুটি কোড | বিবরণ | সমাধান |
|------------|-------------|----------|
| 401 | অনুমোদিত নয় | API কী এবং ম্যানেজড আইডেন্টিটি কনফিগারেশন পরীক্ষা করুন |
| 403 | নিষিদ্ধ | RBAC রোল অ্যাসাইনমেন্ট যাচাই করুন |
| 429 | রেট সীমাবদ্ধ | এক্সপোনেনশিয়াল ব্যাকঅফ সহ রিট্রাই লজিক প্রয়োগ করুন |
| 500 | অভ্যন্তরীণ সার্ভার ত্রুটি | মডেল ডিপ্লয়মেন্ট স্টেটাস এবং লগ পরীক্ষা করুন |
| 503 | সার্ভিস উপলব্ধ নয় | সার্ভিস হেলথ এবং আঞ্চলিক উপলব্ধতা যাচাই করুন |

## পরবর্তী ধাপসমূহ

1. **[AI মডেল ডিপ্লয়মেন্ট গাইড](../chapter-02-ai-development/ai-model-deployment.md)** পর্যালোচনা করুন ডিপ্লয়মেন্ট সেরা প্র্যাকটিসের জন্য  
2. **[প্রোডাকশন AI প্র্যাকটিসেস](../chapter-08-production/production-ai-practices.md)** সম্পন্ন করুন এন্টারপ্রাইজ-রেডি সমাধান জন্য  
3. **[Microsoft Foundry Discord](https://aka.ms/foundry/discord)** এ যোগ দিন কমিউনিটি সাপোর্টের জন্য  
4. **সমস্যা জমা দিন** [AZD GitHub রিপোজিটরি](https://github.com/Azure/azure-dev) এ AZD-নির্দিষ্ট সমস্যার জন্য  

## রিসোর্সসমূহ

- [Microsoft Foundry Models সার্ভিস Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)  
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)  
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)  
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - এডিটরে Azure সমস্যার সমাধানের স্কিল ইনস্টল করুন: `npx skills add microsoft/github-copilot-for-azure`

---

**চ্যাপটার নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান চ্যাপটার**: চ্যাপটার ৭ - সমস্যার সমাধান ও ডিবাগিং
- **⬅️ পূর্ববর্তী**: [ডিবাগিং গাইড](debugging.md)
- **➡️ পরবর্তী চ্যাপটার**: [চ্যাপটার ৮: প্রোডাকশন ও এন্টারপ্রাইজ প্যাটার্নস](../chapter-08-production/production-ai-practices.md)
- **🤖 সম্পর্কিত**: [চ্যাপটার ২: AI-ফার্স্ট ডেভেলপমেন্ট](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 রেফারেন্স**: [Azure Developer CLI Troubleshooting](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকারোক্তি**:  
এই ডকুমেন্টটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। যদিও আমরা সঠিকতার জন্য চেষ্টা করি, দয়া করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা ভুল থাকতে পারে। মূল ডকুমেন্টটি তার নিজস্ব ভাষায় প্রামাণিক উৎস হিসেবে ধরা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে সৃষ্ট কোনও ভুল বোঝাবুঝি বা ভুল অর্থব্যাখ্যাগুলির জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->