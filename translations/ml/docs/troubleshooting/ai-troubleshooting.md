<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b5ae13b6a245ab3a2e6dae923aab65bd",
  "translation_date": "2025-11-24T23:55:25+00:00",
  "source_file": "docs/troubleshooting/ai-troubleshooting.md",
  "language_code": "ml"
}
-->
# AI-നിർമ്മിത Troubleshooting ഗൈഡ്

**അധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: Chapter 7 - Troubleshooting & Debugging
- **⬅️ മുൻപത്തെ**: [Debugging Guide](debugging.md)
- **➡️ അടുത്ത അധ്യായം**: [Chapter 8: Production & Enterprise Patterns](../microsoft-foundry/production-ai-practices.md)
- **🤖 ബന്ധപ്പെട്ട**: [Chapter 2: AI-First Development](../microsoft-foundry/microsoft-foundry-integration.md)

**മുൻപത്തെ:** [Production AI Practices](../microsoft-foundry/production-ai-practices.md) | **അടുത്തത്:** [Getting Started with AZD](../getting-started/README.md)

AZD ഉപയോഗിച്ച് AI പരിഹാരങ്ങൾ വിന്യസിക്കുന്നതിനിടയിൽ സാധാരണയായി നേരിടുന്ന പ്രശ്നങ്ങൾ പരിഹരിക്കുന്നതിനുള്ള സമഗ്ര Troubleshooting ഗൈഡ്, Azure AI സേവനങ്ങൾക്ക് പ്രത്യേകമായ പരിഹാരങ്ങളും ഡീബഗിംഗ് സാങ്കേതികതകളും നൽകുന്നു.

## ഉള്ളടക്ക പട്ടിക

- [Azure OpenAI Service Issues](../../../../docs/troubleshooting)
- [Azure AI Search Problems](../../../../docs/troubleshooting)
- [Container Apps Deployment Issues](../../../../docs/troubleshooting)
- [Authentication and Permission Errors](../../../../docs/troubleshooting)
- [Model Deployment Failures](../../../../docs/troubleshooting)
- [Performance and Scaling Issues](../../../../docs/troubleshooting)
- [Cost and Quota Management](../../../../docs/troubleshooting)
- [Debugging Tools and Techniques](../../../../docs/troubleshooting)

## Azure OpenAI Service Issues

### പ്രശ്നം: OpenAI സേവനം പ്രദേശത്ത് ലഭ്യമല്ല

**ലക്ഷണങ്ങൾ:**
```
Error: The requested resource type is not available in the location 'westus'
```

**കാരണങ്ങൾ:**
- Azure OpenAI തിരഞ്ഞെടുക്കുന്ന പ്രദേശത്ത് ലഭ്യമല്ല
- ഇഷ്ടപ്രദേശങ്ങളിൽ ക്വോട്ടാ തീർന്നിരിക്കുന്നു
- പ്രദേശത്തെ ശേഷി പരിമിതികൾ

**പരിഹാരങ്ങൾ:**

1. **പ്രദേശത്തിന്റെ ലഭ്യത പരിശോധിക്കുക:**
```bash
# OpenAI-ക്കുള്ള ലഭ്യമായ പ്രദേശങ്ങൾ പട്ടികയിടുക
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **AZD കോൺഫിഗറേഷൻ അപ്ഡേറ്റ് ചെയ്യുക:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **മാറ്റം വരുന്ന പ്രദേശങ്ങൾ ഉപയോഗിക്കുക:**
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

### പ്രശ്നം: മോഡൽ വിന്യാസ ക്വോട്ടാ മിച്ചം

**ലക്ഷണങ്ങൾ:**
```
Error: Deployment failed due to insufficient quota
```

**പരിഹാരങ്ങൾ:**

1. **നിലവിലെ ക്വോട്ടാ പരിശോധിക്കുക:**
```bash
# ക്വോട്ട ഉപയോഗം പരിശോധിക്കുക
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **ക്വോട്ടാ വർധനവിനായി അപേക്ഷിക്കുക:**
```bash
# ക്വോട്ടാ വർദ്ധനവിനുള്ള അഭ്യർത്ഥന സമർപ്പിക്കുക
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **മോഡൽ ശേഷി മെച്ചപ്പെടുത്തുക:**
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

### പ്രശ്നം: അസാധുവായ API പതിപ്പ്

**ലക്ഷണങ്ങൾ:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**പരിഹാരങ്ങൾ:**

1. **പിന്തുണയുള്ള API പതിപ്പ് ഉപയോഗിക്കുക:**
```python
# ഏറ്റവും പുതിയ പിന്തുണയുള്ള പതിപ്പ് ഉപയോഗിക്കുക
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API പതിപ്പിന്റെ അനുയോജ്യത പരിശോധിക്കുക:**
```bash
# പിന്തുണയുള്ള API പതിപ്പുകളുടെ പട്ടിക
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search Problems

### പ്രശ്നം: Search Service വില നിരക്ക് അപര്യാപ്തം

**ലക്ഷണങ്ങൾ:**
```
Error: Semantic search requires Basic tier or higher
```

**പരിഹാരങ്ങൾ:**

1. **വില നിരക്ക് അപ്ഗ്രേഡ് ചെയ്യുക:**
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

2. **Semantic Search (Development) അപ്രാപ്തമാക്കുക:**
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

### പ്രശ്നം: Index സൃഷ്ടി പരാജയങ്ങൾ

**ലക്ഷണങ്ങൾ:**
```
Error: Cannot create index, insufficient permissions
```

**പരിഹാരങ്ങൾ:**

1. **Search Service കീകൾ പരിശോധിക്കുക:**
```bash
# തിരയൽ സേവന അഡ്മിൻ കീ നേടുക
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Index Schema പരിശോധിക്കുക:**
```python
# സൂചിക സ്കീമാ സാധൂകരിക്കുക
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

3. **Managed Identity ഉപയോഗിക്കുക:**
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

### പ്രശ്നം: Container Build പരാജയങ്ങൾ

**ലക്ഷണങ്ങൾ:**
```
Error: Failed to build container image
```

**പരിഹാരങ്ങൾ:**

1. **Dockerfile Syntax പരിശോധിക്കുക:**
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

2. **Dependencyകൾ സാധൂകരിക്കുക:**
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

3. **Health Check ചേർക്കുക:**
```python
# main.py - ആരോഗ്യ പരിശോധന എൻഡ്പോയിന്റ് ചേർക്കുക
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### പ്രശ്നം: Container App സ്റ്റാർട്ടപ്പ് പരാജയങ്ങൾ

**ലക്ഷണങ്ങൾ:**
```
Error: Container failed to start within timeout period
```

**പരിഹാരങ്ങൾ:**

1. **Startup Timeout വർധിപ്പിക്കുക:**
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

2. **മോഡൽ ലോഡിംഗ് മെച്ചപ്പെടുത്തുക:**
```python
# മോഡലുകൾ സ്റ്റാർട്ടപ്പ് സമയം കുറയ്ക്കാൻ ലേസി ലോഡ് ചെയ്യുക
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
        # AI ക്ലയന്റ് ഇവിടെ ഇൻഷിയലൈസ് ചെയ്യുക
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # സ്റ്റാർട്ടപ്പ്
    app.state.model_manager = ModelManager()
    yield
    # ഷട്ട്ഡൗൺ
    pass

app = FastAPI(lifespan=lifespan)
```

## Authentication and Permission Errors

### പ്രശ്നം: Managed Identity Permission നിഷേധിച്ചു

**ലക്ഷണങ്ങൾ:**
```
Error: Authentication failed for Azure OpenAI Service
```

**പരിഹാരങ്ങൾ:**

1. **Role Assignments പരിശോധിക്കുക:**
```bash
# നിലവിലെ റോളിന്റെ നിയോഗങ്ങൾ പരിശോധിക്കുക
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **ആവശ്യമായ Roles നൽകുക:**
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

3. **Authentication പരീക്ഷിക്കുക:**
```python
# മാനേജുചെയ്യുന്ന ഐഡന്റിറ്റി പ്രാമാണീകരണം പരീക്ഷിക്കുക
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

### പ്രശ്നം: Key Vault Access നിഷേധിച്ചു

**ലക്ഷണങ്ങൾ:**
```
Error: The user, group or application does not have secrets get permission
```

**പരിഹാരങ്ങൾ:**

1. **Key Vault Permissions നൽകുക:**
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

2. **Access Policies പകരം RBAC ഉപയോഗിക്കുക:**
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

### പ്രശ്നം: മോഡൽ പതിപ്പ് ലഭ്യമല്ല

**ലക്ഷണങ്ങൾ:**
```
Error: Model version 'gpt-4-32k' is not available
```

**പരിഹാരങ്ങൾ:**

1. **ലഭ്യമായ മോഡലുകൾ പരിശോധിക്കുക:**
```bash
# ലഭ്യമായ മോഡലുകൾ പട്ടികയിടുക
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **മോഡൽ Fallbacks ഉപയോഗിക്കുക:**
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

3. **വിന്യാസത്തിന് മുമ്പ് മോഡൽ സാധൂകരിക്കുക:**
```python
# പ്രീ-ഡിപ്ലോയ്മെന്റ് മോഡൽ സാധൂകരണം
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

### പ്രശ്നം: ഉയർന്ന Latency പ്രതികരണങ്ങൾ

**ലക്ഷണങ്ങൾ:**
- പ്രതികരണ സമയം > 30 സെക്കൻഡ്
- Timeout പിഴവുകൾ
- മോശം ഉപയോക്തൃ അനുഭവം

**പരിഹാരങ്ങൾ:**

1. **Request Timeouts നടപ്പിലാക്കുക:**
```python
# ശരിയായ ടൈംഔട്ടുകൾ ക്രമീകരിക്കുക
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

2. **Response Caching ചേർക്കുക:**
```python
# പ്രതികരണങ്ങൾക്കുള്ള റെഡിസ് കാഷ്
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

3. **Auto-scaling കോൺഫിഗർ ചെയ്യുക:**
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

### പ്രശ്നം: Memory Out of Errors

**ലക്ഷണങ്ങൾ:**
```
Error: Container killed due to memory limit exceeded
```

**പരിഹാരങ്ങൾ:**

1. **Memory Allocation വർധിപ്പിക്കുക:**
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

2. **Memory ഉപയോഗം മെച്ചപ്പെടുത്തുക:**
```python
# മെമ്മറി-ക്ഷമയുള്ള മോഡൽ കൈകാര്യം ചെയ്യൽ
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # പ്രോസസ്സ് ചെയ്യുന്നതിന് മുമ്പ് മെമ്മറി ഉപയോഗം പരിശോധിക്കുക
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # ഗാർബേജ് ശേഖരണം നിർബന്ധിതമാക്കുക
            
        result = await self._process_ai_request(request)
        
        # പ്രോസസ്സ് ചെയ്തതിന് ശേഷം ശുചീകരിക്കുക
        gc.collect()
        return result
```

## Cost and Quota Management

### പ്രശ്നം: അനിയന്ത്രിതമായ ഉയർന്ന ചെലവുകൾ

**ലക്ഷണങ്ങൾ:**
- Azure ബിൽ പ്രതീക്ഷിച്ചതിനേക്കാൾ ഉയർന്നത്
- Token ഉപയോഗം കണക്കുകൾ മിച്ചം
- ബജറ്റ് അലർട്ടുകൾ സജീവമാക്കുക

**പരിഹാരങ്ങൾ:**

1. **Cost Controls നടപ്പിലാക്കുക:**
```python
# ടോക്കൺ ഉപയോഗം ട്രാക്കിംഗ്
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

2. **Cost Alerts സജ്ജമാക്കുക:**
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

3. **മോഡൽ തിരഞ്ഞെടുപ്പ് മെച്ചപ്പെടുത്തുക:**
```python
# ചെലവു പരിഗണിക്കുന്ന മോഡൽ തിരഞ്ഞെടുപ്പ്
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # 1K ടോക്കണുകൾക്ക്
    'gpt-4': 0.03,          # 1K ടോക്കണുകൾക്ക്
    'gpt-35-turbo': 0.0015  # 1K ടോക്കണുകൾക്ക്
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

## Debugging Tools and Techniques

### AZD Debugging Commands

```bash
# വിശദമായ ലോഗിംഗ് പ്രാപ്തമാക്കുക
azd up --debug

# വിന്യാസത്തിന്റെ നില പരിശോധിക്കുക
azd show

# വിന്യാസ ലോഗുകൾ കാണുക
azd logs --follow

# പരിസ്ഥിതി ചാരങ്ങൾ പരിശോധിക്കുക
azd env get-values
```

### Application Debugging

1. **Structured Logging:**
```python
import logging
import json

# AI പ്രയോഗങ്ങൾക്കായി ഘടനാപരമായ ലോഗിംഗ് ക്രമീകരിക്കുക
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
    
    # OpenAI കണക്റ്റിവിറ്റി പരിശോധിക്കുക
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # സെർച്ച് സേവനം പരിശോധിക്കുക
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

## Common Error Codes and Solutions

| Error Code | വിവരണം | പരിഹാരം |
|------------|-------------|----------|
| 401 | Unauthorized | API കീകൾ, Managed Identity കോൺഫിഗറേഷൻ പരിശോധിക്കുക |
| 403 | Forbidden | RBAC Role Assignments സാധൂകരിക്കുക |
| 429 | Rate Limited | Exponential Backoff ഉപയോഗിച്ച് Retry Logic നടപ്പിലാക്കുക |
| 500 | Internal Server Error | മോഡൽ വിന്യാസ നിലയും ലോഗുകളും പരിശോധിക്കുക |
| 503 | Service Unavailable | സേവന ആരോഗ്യവും പ്രദേശത്തെ ലഭ്യതയും പരിശോധിക്കുക |

## അടുത്ത ഘട്ടങ്ങൾ

1. **[AI Model Deployment Guide](ai-model-deployment.md)** പരിശോധിച്ച് വിന്യാസ മികച്ച രീതികൾ പഠിക്കുക
2. **[Production AI Practices](production-ai-practices.md)** പൂർത്തിയാക്കി എന്റർപ്രൈസ്-റെഡി പരിഹാരങ്ങൾ നേടുക
3. **[Microsoft Foundry Discord](https://aka.ms/foundry/discord)** ചേരുക, കമ്മ്യൂണിറ്റി പിന്തുണയ്ക്കായി
4. **പ്രശ്നങ്ങൾ സമർപ്പിക്കുക** [AZD GitHub repository](https://github.com/Azure/azure-dev) AZD-നു പ്രത്യേകമായ പ്രശ്നങ്ങൾക്കായി

## Resources

- [Azure OpenAI Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**അധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: Chapter 7 - Troubleshooting & Debugging
- **⬅️ മുൻപത്തെ**: [Debugging Guide](debugging.md)
- **➡️ അടുത്ത അധ്യായം**: [Chapter 8: Production & Enterprise Patterns](../microsoft-foundry/production-ai-practices.md)
- **🤖 ബന്ധപ്പെട്ട**: [Chapter 2: AI-First Development](../microsoft-foundry/microsoft-foundry-integration.md)
- [Azure Developer CLI Troubleshooting](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അറിയിപ്പ്**:  
ഈ പ്രമാണം AI വിവർത്തന സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവർത്തനം ചെയ്തതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി ശ്രമിക്കുന്നുവെങ്കിലും, സ്വയം പ്രവർത്തിക്കുന്ന വിവർത്തനങ്ങളിൽ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റായ വിവരങ്ങൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ട്. അതിന്റെ സ്വാഭാവിക ഭാഷയിലുള്ള അസൽ പ്രമാണം പ്രാമാണികമായ ഉറവിടമായി പരിഗണിക്കണം. നിർണായകമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ വിവർത്തനം ശുപാർശ ചെയ്യുന്നു. ഈ വിവർത്തനം ഉപയോഗിച്ച് ഉണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾക്കോ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കോ ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->