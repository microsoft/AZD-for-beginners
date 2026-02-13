# AI-নির্দিষ্ট ট্রাবলশুটিং গাইড

**অধ্যায় নেভিগেশন:**
- **📚 Course Home**: [AZD শুরুকারীদের জন্য](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় 7 - ট্রাবলশুটিং ও ডিবাগিং
- **⬅️ পূর্ববর্তী**: [ডিবাগিং গাইড](debugging.md)
- **➡️ পরবর্তী অধ্যায়**: [অধ্যায় 8: প্রোডাকশন ও এন্টারপ্রাইজ প্যাটার্নস](../chapter-08-production/production-ai-practices.md)
- **🤖 সংশ্লিষ্ট**: [অধ্যায় ২: AI-প্রথম উন্নয়ন](../chapter-02-ai-development/microsoft-foundry-integration.md)

**Previous:** [প্রোডাকশন AI অনুশীলন](../chapter-08-production/production-ai-practices.md) | **Next:** [AZD মৌলিক](../chapter-01-foundation/azd-basics.md)

এই বিস্তৃত ট্রাবলশুটিং গাইডটি AZD দিয়ে AI সমাধান স্থাপনের সময় সাধারণ সমস্যাগুলোকে সম্বোধন করে, এবং Azure AI পরিষেবাগুলোর জন্য নির্দিষ্ট সমাধান ও ডিবাগিং কৌশল প্রদান করে।

## বিষয়বস্তু

- [Azure OpenAI সার্ভিস সমস্যা](../../../../docs/chapter-07-troubleshooting)
- [Azure AI Search সমস্যা](../../../../docs/chapter-07-troubleshooting)
- [কনটেইনার অ্যাপস ডিপ্লয়মেন্ট সমস্যা](../../../../docs/chapter-07-troubleshooting)
- [অথেন্টিকেশন ও অনুমতি ত্রুটি](../../../../docs/chapter-07-troubleshooting)
- [মডেল ডিপ্লয়মেন্ট ব্যর্থতা](../../../../docs/chapter-07-troubleshooting)
- [পারফরম্যান্স ও স্কেলিং সমস্যা](../../../../docs/chapter-07-troubleshooting)
- [ব্যয় ও কোটা ব্যবস্থাপনা](../../../../docs/chapter-07-troubleshooting)
- [ডিবাগিং টুলস ও কৌশল](../../../../docs/chapter-07-troubleshooting)

## Azure OpenAI সার্ভিস সমস্যা

### সমস্যা: OpenAI সার্ভিস অঞ্চলটিতে উপলভ্য নেই

**লক্ষণসমূহ:**
```
Error: The requested resource type is not available in the location 'westus'
```

**কারণসমূহ:**
- নির্বাচিত অঞ্চলে Azure OpenAI উপলভ্য নয়
- পছন্দের অঞ্চলে কোটা শেষ হয়ে গেছে
- আঞ্চলিক ক্ষমতার সীমাবদ্ধতা

**সমাধান:**

1. **অঞ্চল উপলভ্যতা পরীক্ষা করুন:**
```bash
# OpenAI-এর জন্য উপলব্ধ অঞ্চলগুলি তালিকা করুন
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

**সমাধান:**

1. **বর্তমান কোটা পরীক্ষা করুন:**
```bash
# কোটা ব্যবহার পরীক্ষা করুন
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **কোটা বৃদ্ধির অনুরোধ করুন:**
```bash
# কোটা বৃদ্ধির অনুরোধ জমা দিন
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **মডেল ক্যাপাসিটি অপ্টিমাইজ করুন:**
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

**লক্ষণসমূহ:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**সমাধান:**

1. **সমর্থিত API সংস্করণ ব্যবহার করুন:**
```python
# সর্বশেষ সমর্থিত সংস্করণ ব্যবহার করুন
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API সংস্করণ সামঞ্জস্য পরীক্ষা করুন:**
```bash
# সমর্থিত API সংস্করণগুলির তালিকা
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search সমস্যা

### সমস্যা: সার্চ সার্ভিসের প্রাইসিং টিয়ার অপর্যাপ্ত

**লক্ষণসমূহ:**
```
Error: Semantic search requires Basic tier or higher
```

**সমাধান:**

1. **প্রাইসিং টিয়ার আপগ্রেড করুন:**
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

2. **সেমান্টিক সার্চ অক্ষম করুন (ডেভেলপমেন্ট):**
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

### সমস্যা: ইনডেক্স তৈরি ব্যর্থতা

**লক্ষণসমূহ:**
```
Error: Cannot create index, insufficient permissions
```

**সমাধান:**

1. **সার্চ সার্ভিস কী যাচাই করুন:**
```bash
# সার্চ সার্ভিসের অ্যাডমিন কী পান
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

## কনটেইনার অ্যাপস ডিপ্লয়মেন্ট সমস্যা

### সমস্যা: কনটেইনার বিল্ড ব্যর্থতা

**লক্ষণসমূহ:**
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

2. **ডিপেন্ডেন্সিগুলি যাচাই করুন:**
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
# main.py - হেলথ চেক এন্ডপয়েন্ট যোগ করুন
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### সমস্যা: কনটেইনার অ্যাপ স্টার্টআপ ব্যর্থতা

**লক্ষণসমূহ:**
```
Error: Container failed to start within timeout period
```

**সমাধান:**

1. **স্টার্টআপ টাইমআউট বাড়ান:**
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
# স্টার্টআপ সময় কমাতে মডেলগুলো প্রয়োজন অনুযায়ী লোড করুন
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
        # এখানে এআই ক্লায়েন্টটি ইনিশিয়ালাইজ করুন
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # শুরু
    app.state.model_manager = ModelManager()
    yield
    # বন্ধ
    pass

app = FastAPI(lifespan=lifespan)
```

## অথেন্টিকেশন ও অনুমতি ত্রুটি

### সমস্যা: ম্যানেজড আইডেন্টিটি অনুমতি অস্বীকৃত

**লক্ষণসমূহ:**
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

3. **অথেন্টিকেশন টেস্ট করুন:**
```python
# ম্যানেজড আইডেন্টিটি প্রমাণীকরণ পরীক্ষা
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

### সমস্যা: Key Vault অ্যাক্সেস অস্বীকৃত

**লক্ষণসমূহ:**
```
Error: The user, group or application does not have secrets get permission
```

**সমাধান:**

1. **Key Vault অনুমতিসমূহ দিন:**
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

### সমস্যা: মডেল সংস্করণ উপলভ্য নয়

**লক্ষণসমূহ:**
```
Error: Model version 'gpt-4-32k' is not available
```

**সমাধান:**

1. **উপলব্ধ মডেলগুলো পরীক্ষা করুন:**
```bash
# উপলব্ধ মডেলগুলির তালিকা
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **মডেল ফ্যালব্যাক ব্যবহার করুন:**
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

3. **ডিপ্লয়মেন্টের আগে মডেল যাচাই করুন:**
```python
# ডেপ্লয়মেন্টের আগে মডেল যাচাই
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

## পারফরম্যান্স ও স্কেলিং সমস্যা

### সমস্যা: উচ্চ লেটেন্সি রেসপন্স

**লক্ষণসমূহ:**
- রেসপন্স সময় > 30 সেকেন্ড
- টাইমআউট ত্রুটি
- দুর্বল ব্যবহারকারী অভিজ্ঞতা

**সমাধান:**

1. **রিকোয়েস্ট টাইমআউট বাস্তবায়ন করুন:**
```python
# উপযুক্ত টাইমআউট কনফিগার করুন
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
# উত্তরগুলির জন্য Redis ক্যাশ
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

### সমস্যা: মেমরি আউট অফ এরর

**লক্ষণসমূহ:**
```
Error: Container killed due to memory limit exceeded
```

**সমাধান:**

1. **মেমরি বরাদ্দ বাড়ান:**
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
# মেমরি-দক্ষ মডেল পরিচালনা
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # প্রক্রিয়াকরণের আগে মেমরি ব্যবহারের পরীক্ষা করুন
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # গারবেজ কালেকশন জোরপূর্বক চালান
            
        result = await self._process_ai_request(request)
        
        # প্রক্রিয়াকরণ শেষে পরিষ্কার করুন
        gc.collect()
        return result
```

## ব্যয় ও কোটা ব্যবস্থাপনা

### সমস্যা: অপ্রত্যাশিত উচ্চ ব্যয়

**লক্ষণসমূহ:**
- Azure বিল প্রত্যাশার চেয়ে বেশি
- টোকেন ব্যবহার অনুমান ছাড়িয়ে গেছে
- বাজেট অ্যালার্ট ট্রিগার হয়েছে

**সমাধান:**

1. **ব্যয় নিয়ন্ত্রণ বাস্তবায়ন করুন:**
```python
# টোকেন ব্যবহারের পর্যবেক্ষণ
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

2. **কস্ট অ্যালার্ট সেট আপ করুন:**
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
    'gpt-4o-mini': 0.00015,  # প্রতি 1K টোকেন
    'gpt-4': 0.03,          # প্রতি 1K টোকেন
    'gpt-35-turbo': 0.0015  # প্রতি 1K টোকেন
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

## ডিবাগিং টুলস ও কৌশল

### AZD ডিবাগিং কমান্ডসমূহ

```bash
# বিস্তারিত লগিং সক্রিয় করুন
azd up --debug

# ডিপ্লয়মেন্টের অবস্থা পরীক্ষা করুন
azd show

# অ্যাপ্লিকেশনের লগ দেখুন (মনিটরিং ড্যাশবোর্ড খুলবে)
azd monitor --logs

# লাইভ মেট্রিক্স দেখুন
azd monitor --live

# পরিবেশ ভেরিয়েবলগুলি পরীক্ষা করুন
azd env get-values
```

### অ্যাপ্লিকেশন ডিবাগিং

1. **স্ট্রাকচার্ড লগিং:**
```python
import logging
import json

# এআই অ্যাপ্লিকেশনগুলির জন্য কাঠামোবদ্ধ লগিং কনফিগার করুন
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

2. **হেলথ চেক 엔্ডপয়েন্টস:**
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
    
    # অনুসন্ধান সেবা পরীক্ষা করুন
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

## সাধারণ ত্রুটি কোড ও সমাধানসমূহ

| Error Code | Description | Solution |
|------------|-------------|----------|
| 401 | অনুমোদিত নয় | API কী এবং ম্যানেজড আইডেন্টিটি কনফিগারেশন পরীক্ষা করুন |
| 403 | বাতিল | RBAC রোল অ্যাসাইনমেন্ট যাচাই করুন |
| 429 | রেট সীমাবদ্ধ | এক্সপোনেনশিয়াল ব্যাকঅফ সহ রিট্রাই লজিক বাস্তবায়ন করুন |
| 500 | সার্ভারের অভ্যন্তরীন ত্রুটি | মডেল ডিপ্লয়মেন্ট স্ট্যাটাস এবং লগ চেক করুন |
| 503 | সার্ভিস অনুপলব্ধ | সার্ভিস হেলথ এবং আঞ্চলিক উপলভ্যতা যাচাই করুন |

## পরবর্তী ধাপসমূহ

1. **[AI Model Deployment Guide](../chapter-02-ai-development/ai-model-deployment.md)** দেখুন ডিপ্লয়মেন্টের সেরা অনুশীলনগুলোর জন্য
2. **[প্রোডাকশন AI অনুশীলন](../chapter-08-production/production-ai-practices.md)** সম্পন্ন করুন এন্টারপ্রাইজ-রেডি সমাধানের জন্য
3. **[Microsoft Foundry Discord](https://aka.ms/foundry/discord)** যোগ দিন কমিউনিটি সাপোর্টের জন্য
4. **ইস্যু সাবমিট করুন** [AZD GitHub repository](https://github.com/Azure/azure-dev)-এ AZD-নির্দিষ্ট সমস্যার জন্য

## রিসোর্সসমূহ

- [Azure OpenAI Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**অধ্যায় নেভিগেশন:**
- **📚 Course Home**: [AZD শুরুকারীদের জন্য](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় 7 - ট্রাবলশুটিং ও ডিবাগিং
- **⬅️ পূর্ববর্তী**: [ডিবাগিং গাইড](debugging.md)
- **➡️ পরবর্তী অধ্যায়**: [অধ্যায় 8: প্রোডাকশন ও এন্টারপ্রাইজ প্যাটার্নস](../chapter-08-production/production-ai-practices.md)
- **🤖 সংশ্লিষ্ট**: [অধ্যায় ২: AI-প্রথম উন্নয়ন](../chapter-02-ai-development/microsoft-foundry-integration.md)
- [Azure Developer CLI Troubleshooting](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
অস্বীকৃতি:
এই দলিলটি AI অনুবাদ সেবা Co-op Translator (https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। যদিও আমরা যথাসাধ্য নির্ভুলতার চেষ্টা করি, অনুগ্রহ করে মনে রাখুন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসামঞ্জস্য থাকতে পারে। মূল নথিটি তার নিজ ভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ গ্রহণ করার পরামর্শ দেওয়া হয়। এই অনুবাদ ব্যবহারের ফলে সৃষ্ট কোনো ভুলবোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->