# AI-নির্দিষ্ট ত্রুটিসন্ধান গাইড

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD নবীনদের জন্য](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ৭ - ত্রুটিসন্ধান ও ডিবাগিং
- **⬅️ পূর্ববর্তী**: [ডিবাগিং গাইড](debugging.md)
- **➡️ পরবর্তী অধ্যায়**: [অধ্যায় ৮: প্রোডাকশন ও এন্টারপ্রাইজ প্যাটার্ন](../chapter-08-production/production-ai-practices.md)
- **🤖 সম্পর্কিত**: [অধ্যায় ২: AI-প্রথম ডেভেলপমেন্ট](../chapter-02-ai-development/microsoft-foundry-integration.md)

এই বিস্তৃত ত্রুটিসন্ধান গাইডটি AZD দিয়ে AI সমাধান ডিপ্লয় করার সময় সাধারণ সমস্যা সমাধান করে, এবং Azure AI সার্ভিসগুলোর জন্য নির্দিষ্ট সমাধান ও ডিবাগিং কৌশল প্রদান করে।

## বিষয়বস্তু

- [Microsoft Foundry Models Service Issues](../../../../docs/chapter-07-troubleshooting)
- [Azure AI Search Problems](../../../../docs/chapter-07-troubleshooting)
- [Container Apps Deployment Issues](../../../../docs/chapter-07-troubleshooting)
- [Authentication and Permission Errors](../../../../docs/chapter-07-troubleshooting)
- [Model Deployment Failures](../../../../docs/chapter-07-troubleshooting)
- [Performance and Scaling Issues](../../../../docs/chapter-07-troubleshooting)
- [Cost and Quota Management](../../../../docs/chapter-07-troubleshooting)
- [Debugging Tools and Techniques](../../../../docs/chapter-07-troubleshooting)

## Microsoft Foundry Models Service Issues

### Issue: OpenAI Service Unavailable in Region

**লক্ষণসমূহ:**
```
Error: The requested resource type is not available in the location 'westus'
```

**কারণসমূহ:**
- নির্বাচিত রিজিয়নে Microsoft Foundry Models উপলব্ধ নয়
- পছন্দসই রিজিয়নে কোটা শেষ হয়ে গেছে
- আঞ্চলিক ক্ষমতার সীমাবদ্ধতা

**সমাধানসমূহ:**

1. **রিজিয়ন উপলব্ধতা পরীক্ষা করুন:**
```bash
# OpenAI-এর জন্য উপলব্ধ অঞ্চলগুলো তালিকা করুন
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

3. **বিকল্প রিজিয়ন ব্যবহার করুন:**
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

### Issue: Model Deployment Quota Exceeded

**লক্ষণসমূহ:**
```
Error: Deployment failed due to insufficient quota
```

**সমাধানসমূহ:**

1. **বর্তমান কোটা পরীক্ষা করুন:**
```bash
# কোটা ব্যবহারের অবস্থা পরীক্ষা করুন
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **কোটা বৃদ্ধি অনুরোধ করুন:**
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

### Issue: Invalid API Version

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

2. **API সংস্করণ সামঞ্জস্য পরীক্ষা করুন:**
```bash
# সমর্থিত API সংস্করণগুলি তালিকাভুক্ত করুন
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search Problems

### Issue: Search Service Pricing Tier Insufficient

**লক্ষণসমূহ:**
```
Error: Semantic search requires Basic tier or higher
```

**সমাধানসমূহ:**

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

2. **সেমান্টিক সার্চ বন্ধ করুন (ডেভেলপমেন্ট):**
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

### Issue: Index Creation Failures

**লক্ষণসমূহ:**
```
Error: Cannot create index, insufficient permissions
```

**সমাধানসমূহ:**

1. **Search সার্ভিস কি যাচাই করুন:**
```bash
# সার্চ সার্ভিসের অ্যাডমিন কী পান
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **ইন্ডেক্স স্কিমা পরীক্ষা করুন:**
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

3. **Managed Identity ব্যবহার করুন:**
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

## Container Apps Deployment Issues

### Issue: Container Build Failures

**লক্ষণসমূহ:**
```
Error: Failed to build container image
```

**সমাধানসমূহ:**

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

2. **নির্ভরশীলতা যাচাই করুন:**
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

### Issue: Container App Startup Failures

**লক্ষণসমূহ:**
```
Error: Container failed to start within timeout period
```

**সমাধানসমূহ:**

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
# স্টার্টআপ সময় কমাতে মডেলগুলো প্রয়োজনমতো লোড করুন
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
    # শুরু
    app.state.model_manager = ModelManager()
    yield
    # বন্ধ
    pass

app = FastAPI(lifespan=lifespan)
```

## Authentication and Permission Errors

### Issue: Managed Identity Permission Denied

**লক্ষণসমূহ:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**সমাধানসমূহ:**

1. **রোল অ্যাসাইনমেন্ট যাচাই করুন:**
```bash
# বর্তমান ভূমিকা বরাদ্দ পরীক্ষা করুন
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **প্রয়োজনীয় রোলগুলি অ্যাসাইন করুন:**
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

### Issue: Key Vault Access Denied

**লক্ষণসমূহ:**
```
Error: The user, group or application does not have secrets get permission
```

**সমাধানসমূহ:**

1. **Key Vault অনুমতি প্রদান করুন:**
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

## Model Deployment Failures

### Issue: Model Version Not Available

**লক্ষণসমূহ:**
```
Error: Model version 'gpt-4-32k' is not available
```

**সমাধানসমূহ:**

1. **উপলব্ধ মডেলগুলি পরীক্ষা করুন:**
```bash
# উপলব্ধ মডেলগুলির তালিকা দেখান
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **মডেল ফালব্যাক ব্যবহার করুন:**
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

3. **ডিপ্লয়ের আগে মডেল যাচাই করুন:**
```python
# ডিপ্লয়মেন্টের পূর্বে মডেল যাচাই
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

## Performance and Scaling Issues

### Issue: High Latency Responses

**লক্ষণসমূহ:**
- প্রতিক্রিয়া সময় > 30 সেকেন্ড
- টাইমআউট ত্রুটি
- দুর্বল ব্যবহারকারীর অভিজ্ঞতা

**সমাধানসমূহ:**

1. **অনুরোধ টাইমআউট বাস্তবায়ন করুন:**
```python
# উপযুক্ত টাইমআউটগুলো কনফিগার করুন
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
# প্রতিক্রিয়াগুলির জন্য Redis ক্যাশ
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

3. **অটো-স্কেল কনফিগার করুন:**
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

### Issue: Memory Out of Errors

**লক্ষণসমূহ:**
```
Error: Container killed due to memory limit exceeded
```

**সমাধানসমূহ:**

1. **মেমরির বরাদ্দ বাড়ান:**
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
        # প্রক্রিয়াকরণের আগে মেমরি ব্যবহার পরীক্ষা করুন
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # জোরপূর্বক গার্বেজ কালেকশন চালান
            
        result = await self._process_ai_request(request)
        
        # প্রক্রিয়াকরণ শেষে পরিষ্কার করুন
        gc.collect()
        return result
```

## Cost and Quota Management

### Issue: Unexpected High Costs

**লক্ষণসমূহ:**
- Azure বিল প্রত্যাশিত থেকেও বেশি
- টোকেন ব্যবহার অনুমান ছাড়িয়ে গেছে
- বাজেট সতর্কতা চালু হয়েছে

**সমাধানসমূহ:**

1. **কস্ট কন্ট্রোলস বাস্তবায়ন করুন:**
```python
# টোকেন ব্যবহারের নিরীক্ষণ
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

2. **কস্ট অ্যালার্ট সেট করুন:**
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
    'gpt-4.1-mini': 0.00015,  # প্রতি ১ হাজার টোকেন
    'gpt-4.1': 0.03,          # প্রতি ১ হাজার টোকেন
    'gpt-35-turbo': 0.0015  # প্রতি ১ হাজার টোকেন
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

## Debugging Tools and Techniques

### AZD Debugging Commands

```bash
# বিস্তারিত লগিং সক্রিয় করুন
azd up --debug

# ডিপ্লয়মেন্টের স্থিতি পরীক্ষা করুন
azd show

# অ্যাপ্লিকেশনের লগ দেখুন (মনিটরিং ড্যাশবোর্ড খুলবে)
azd monitor --logs

# লাইভ মেট্রিক্স দেখুন
azd monitor --live

# পরিবেশ ভেরিয়েবলগুলো পরীক্ষা করুন
azd env get-values
```

### AZD AI Extension Commands for Diagnostics

If you deployed agents using `azd ai agent init`, these additional tools are available:

```bash
# এজেন্ট এক্সটেনশনটি ইনস্টল করা আছে তা নিশ্চিত করুন
azd extension install azure.ai.agents

# ম্যানিফেস্ট থেকে একটি এজেন্ট পুনরায় ইনিশিয়ালাইজ বা আপডেট করুন
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# এআই টুলগুলোকে প্রকল্পের অবস্থা জিজ্ঞাসা করতে MCP সার্ভার ব্যবহার করুন
azd mcp start

# পর্যালোচনা ও অডিটের জন্য ইনফ্রাস্ট্রাকচার ফাইল তৈরি করুন
azd infra generate
```

> **টিপ:** Use `azd infra generate` to write IaC to disk so you can inspect exactly what resources were provisioned. This is invaluable when debugging resource configuration issues. See the [AZD AI CLI reference](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) for full details.

### Application Debugging

1. **স্ট্রাকচার্ড লগিং:**
```python
import logging
import json

# AI অ্যাপ্লিকেশনের জন্য কাঠামোগত লগিং কনফিগার করুন
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
    
    # অনুসন্ধান পরিষেবা পরীক্ষা করুন
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

## Common Error Codes and Solutions

| Error Code | Description | Solution |
|------------|-------------|----------|
| 401 | অননুমোদিত | API কী এবং managed identity কনফিগারেশন পরীক্ষা করুন |
| 403 | নিষিদ্ধ | RBAC রোল অ্যাসাইনমেন্ট যাচাই করুন |
| 429 | হার সীমিত | এক্সপোনেনশিয়াল ব্যাকঅফসহ পুনরায় চেষ্টা করার লজিক বাস্তবায়ন করুন |
| 500 | সার্ভারের অভ্যন্তরীণ ত্রুটি | মডেল ডিপ্লয়মেন্ট স্থিতি এবং লগ পরীক্ষা করুন |
| 503 | পরিষেবা অনুপলব্ধ | সার্ভিসের স্বাস্থ্য এবং আঞ্চলিক উপলব্ধতা যাচাই করুন |

## Next Steps

1. **Review [AI Model Deployment Guide](../chapter-02-ai-development/ai-model-deployment.md)** for deployment best practices
2. **Complete [Production AI Practices](../chapter-08-production/production-ai-practices.md)** for enterprise-ready solutions
3. **Join the [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** for community support
4. **Submit issues** to the [AZD GitHub repository](https://github.com/Azure/azure-dev) for AZD-specific problems

## Resources

- [Microsoft Foundry Models Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Install Azure troubleshooting skills in your editor: `npx skills add microsoft/github-copilot-for-azure`

---

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD নবীনদের জন্য](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ৭ - ত্রুটিসন্ধান ও ডিবাগিং
- **⬅️ পূর্ববর্তী**: [ডিবাগিং গাইড](debugging.md)
- **➡️ পরবর্তী অধ্যায়**: [অধ্যায় ৮: প্রোডাকশন ও এন্টারপ্রাইজ প্যাটার্ন](../chapter-08-production/production-ai-practices.md)
- **🤖 সম্পর্কিত**: [অধ্যায় ২: AI-প্রথম ডেভেলপমেন্ট](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 রেফারেন্স**: [Azure Developer CLI Troubleshooting](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
অস্বীকৃতি:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। যদিও আমরা সঠিকতার দিকে যত্নবান, তবুও দয়া করে মনে রাখুন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অশুদ্ধতা থাকতে পারে। মূল নথিটিকে তার মূল ভাষায়ই কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে উদ্ভূত কোনো ভুলবোঝা বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->