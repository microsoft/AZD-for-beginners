# AI-നിര്ദിഷ്ടമായ പ്രശ്നപരിഹാരമാർഗ്ഗദർശി

**അധ്യായം നാവിഗേഷൻ:**
- **📚 കോഴ്സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 ഇപ്പോഴത്തെ അധ്യായം**: Chapter 7 - Troubleshooting & Debugging
- **⬅️ മുമ്പത്തെ**: [Debugging Guide](debugging.md)
- **➡️ അടുത്ത അധ്യായം**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 ബന്ധപ്പെട്ടത്**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

AZD ഉപയോഗിച്ച് AI പരിഹാരങ്ങൾ വിന്യസിക്കുമ്പോൾ പൊതുവെ അനുഭവപ്പെടുന്ന പ്രശ്നങ്ങൾക്ക് ഈ സമ്പൂർണമായ പ്രശ്നപരിഹാര മാർഗ്ഗദർശി പരിഹാരങ്ങളും ഡീബഗ്ഗിംഗ് സാങ്കേതിക പണികളും നൽകുന്നു, പ്രത്യേകിച്ച് Azure AI സേവനങ്ങൾക്ക്.

## ഉള്ളടക്കക്കുറിപ്പ്

- [Microsoft Foundry Models Service പ്രശ്നങ്ങൾ](#azure-openai-service-issues)
- [Azure AI Search പ്രശ്നങ്ങൾ](#azure-ai-search-പ്രശ്നങ്ങൾ)
- [Container Apps Deployment പ്രശ്നങ്ങൾ](#container-apps-deployment-പ്രശ്നങ്ങൾ)
- [Authentication and Permission Errors](#authentication-and-permission-errors)
- [Model Deployment Failures](#model-deployment-failures)
- [Performance and Scaling Issues](#performance-and-scaling-issues)
- [Cost and Quota Management](#ചെലവ്-മാനേജ്മെന്റ്-ക്വോട്ട)
- [Debugging Tools and Techniques](#debugging-tools-and-techniques)

## Microsoft Foundry Models Service പ്രശ്നങ്ങൾ

### പ്രശ്നം: OpenAI സേവനം മേഖലയിൽ ലഭ്യമല്ല

**അഭിപ്രായങ്ങൾ:**
```
Error: The requested resource type is not available in the location 'westus'
```

**കാരണങ്ങൾ:**
- Microsoft Foundry Models തിരഞ്ഞെടുക്കപ്പെട്ട മേഖലയിൽ ലഭ്യമല്ല
- പ്രീഫർ ചെയ്ത മേഖലകളിൽ കോട്ടാ തീർന്നു
- മേഖല സമർത്ഥത നിയന്ത്രണങ്ങൾ

**പരിഹാരങ്ങൾ:**

1. **മേഖല ലഭ്യത ചെക്ക് ചെയ്യുക:**
```bash
# OpenAI-ക്കായുള്ള ലഭ്യമായ പ്രദേശങ്ങളുടെ പട്ടിക
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

3. **വൈകല്പിക മേഖലകൾ ഉപയോഗിക്കുക:**
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

### പ്രശ്നം: മോഡൽ വിന്യസിക്കൽ കോട്ട് ഇത് കടന്നു

**അഭിപ്രായങ്ങൾ:**
```
Error: Deployment failed due to insufficient quota
```

**പരിഹാരങ്ങൾ:**

1. **ഇപ്പോഴുള്ള കോട്ട് പരിശോധിക്കുക:**
```bash
# കോട്ടാ ഉപയോഗം പരിശോധിക്കുക
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **കോട്ട് വർധിപ്പിക്കൽ അഭ്യർത്ഥിക്കുക:**
```bash
# ക്വോട്ട വർധനവിന്റെ അപേക്ഷ സമർപ്പിക്കുക
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

### പ്രശ്നം: ചുരുക്കപ്പെട്ട API പതിപ്പ്

**അഭിപ്രായങ്ങൾ:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**പരിഹാരങ്ങൾ:**

1. **സ്‌പോർട്ട് ചെയ്ത API പതിപ്പ് ഉപയോഗിക്കുക:**
```python
# ഏറ്റവും പുതിയ പിന്തുണയ്‌ക് ലഭ്യമാകുന്ന പതിപ്പ് ഉപയോഗിക്കുക
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API പതിപ്പ് സാമർഥ്യം പരിശോധിക്കുക:**
```bash
# പിന്തുണയ്ക്കുന്ന API പതിപ്പുകളുടെ പട്ടിക
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search പ്രശ്നങ്ങൾ

### പ്രശ്നം: Search Service വിലയിരുത്തൽ പടി അനുയോജ്യം അല്ല

**അഭിപ്രായങ്ങൾ:**
```
Error: Semantic search requires Basic tier or higher
```

**പരിഹാരങ്ങൾ:**

1. **വിലയിരുത്തൽ പടി അപ്ഡേറ്റ് ചെയ്യുക:**
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

2. **Semantic Search ഓഫാക്കുക (വികസനം):**
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

### പ്രശ്നം: ഇൻഡക്സ് സൃഷ്ടിക്കാൻ പരാജയം

**അഭിപ്രായങ്ങൾ:**
```
Error: Cannot create index, insufficient permissions
```

**പരിഹാരങ്ങൾ:**

1. **Search Service കീകൾ പരിശോധിക്കുക:**
```bash
# സേർച്ച് സർവിസ് അഡ്മിൻ കീ എടുക്കുക
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **ഇൻഡക്സ് സ്കീമ പരിശോധിക്കുക:**
```python
# ഇൻഡക്സ് സ്കീമ ശാസ്ത്രീയമായി പരിശോധിക്കുക
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

## Container Apps Deployment പ്രശ്നങ്ങൾ

### പ്രശ്നം: കൺറ്റൈനർ നിർമ്മാണ പരാജയങ്ങൾ

**അഭിപ്രായങ്ങൾ:**
```
Error: Failed to build container image
```

**പരിഹാരങ്ങൾ:**

1. **Dockerfile വാക്യരചന പരിശോധിക്കുക:**
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

2. **ഡിപ്പൻഡൻസികൾ പരിശോദിക്കുക:**
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
# main.py - ഹെൽത്ത് ചെക്ക് എൻഡ്‌പോയിന്റ് ചേർക്കുക
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### പ്രശ്നം: കൺറ്റൈനർ ആപ്പ് സ്റ്റാർട്ട് പരാജയം

**അഭിപ്രായങ്ങൾ:**
```
Error: Container failed to start within timeout period
```

**പരിഹാരങ്ങൾ:**

1. **സ്റ്റാർട്ട് ടൈംഔട്ട് വർധിപ്പിക്കുക:**
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
# സ്റ്റാർട്ട്‌അപ്പ് സമയം കുറയ്ക്കാൻ മodelുകൾ ലെയ്‌സി ലോഡ് ചെയ്യുക
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
        # ഇവിടെ AI ക്ലയന്റ് ആരംഭിക്കുക
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # ആരംഭിക്കുക
    app.state.model_manager = ModelManager()
    yield
    # ഷട്ട്‌ഡൗൺ
    pass

app = FastAPI(lifespan=lifespan)
```

## Authentication and Permission Errors

### പ്രശ്നം: Managed Identity അനുമതി നിരസിച്ചു

**അഭിപ്രായങ്ങൾ:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**പരിഹാരങ്ങൾ:**

1. **റോൾ അസൈൻമെന്റുകൾ പരിശോധിക്കുക:**
```bash
# നിലവിലുള്ള വേഷ നിയോഗങ്ങൾ പരിശോധിക്കുക
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **ആവശ്യമായ റോളുകൾ അനുവദിക്കുക:**
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

3. **Authentication ടെസ്റ്റ് ചെയ്യുക:**
```python
# മാനേജ് ചെയ്ത അ_identityenty അംഗീകാര പരിശോധന
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

### പ്രശ്നം: Key Vault ആക്സസ് നിരസിച്ചു

**അഭിപ്രായങ്ങൾ:**
```
Error: The user, group or application does not have secrets get permission
```

**പരിഹാരങ്ങൾ:**

1. **Key Vault അനുമതികൾ അനുവദിക്കുക:**
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

**അഭിപ്രായങ്ങൾ:**
```
Error: Model version 'gpt-4-32k' is not available
```

**പരിഹാരങ്ങൾ:**

1. **ലഭ്യമായ മോഡലുകൾ പരിശോധിക്കുക:**
```bash
# ലഭ്യമായ മോഡലുകൾ പട്ടികപ്പെടുത്തുക
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **മോഡൽ ഫാൾബാക്കുകൾ ഉപയോഗിക്കുക:**
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

3. **വിന്യാസത്തിനു മുമ്പ് മോഡൽ സ്ഥിരീകരിക്കുക:**
```python
# മുമ്പ്-പ്രവർത്തന മോഡൽ പരിശോധന
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

### പ്രശ്നം: ഉയർന്ന വൈകീർണം പ്രതികരണങ്ങൾ

**അഭിപ്രായങ്ങൾ:**
- പ്രതികരണ സമയങ്ങൾ > 30 സെക്കൻഡ്
- ടൈംഔട്ട് പിശകുകൾ
- ഉപയോക്തൃ അനുഭവം മോശം

**പരിഹാരങ്ങൾ:**

1. **അഭ്യർത്ഥന ടൈംഔട്ട് നടപ്പിലാക്കുക:**
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

2. **പ്രതികരണ കാഷിംഗ് ചേർക്കുക:**
```python
# പ്രതികരണങ്ങൾക്ക് വേണ്ടി Redis കാഷെ
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

3. **ഓട്ടോ-സ്കെയ്ലിംഗ് ക്രമീകരിക്കുക:**
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

### പ്രശ്നം: മെമറി ഔട്ട് ഓഫ് എറേഴ്സ്

**അഭിപ്രായങ്ങൾ:**
```
Error: Container killed due to memory limit exceeded
```

**പരിഹാരങ്ങൾ:**

1. **മെമറി വിന്യസനം വർധിപ്പിക്കുക:**
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

2. **മെമറി ഉപയോഗം മെച്ചപ്പെടുത്തുക:**
```python
# മെമ്മറി-ക്ഷമമായ മോഡൽ കൈകാര്യം ചെയ്യൽ
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # പ്രോസസ്സിംഗ് മുൻപ് മെമ്മറി ഉപയോഗം പരിശോധിക്കുക
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # ഗാർബേജ് കോളക്ഷൻ നിർബന്ധിക്കൂ
            
        result = await self._process_ai_request(request)
        
        # പ്രോസസ്സിംഗ് കഴിഞ്ഞു തദവധി ശുദ്ധീകരിക്കുക
        gc.collect()
        return result
```

## ചെലവ് മാനേജ്മെന്റ് & ക്വോട്ട

### പ്രശ്നം: അന്യമായ ഉയർന്ന ചെലവുകൾ

**അഭിപ്രായങ്ങൾ:**
- പ്രതീക്ഷിക്കുന്നതിൽ കൂടുതലായ Azure ബിൽ
- ടോക്കൺ ഉപയോഗം മുതലായ കണക്കുകൾ മറികടക്കുന്നു
- ബഡ്ജറ്റ് അലർട്ടുകൾ പ്രവർത്തിക്കുന്നു

**പരിഹാരങ്ങൾ:**

1. **ചെലവ് നിയന്ത്രണങ്ങൾ നടപ്പാക്കുക:**
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

2. **ചെലവ് അലർട്ടുകൾ സജ്ജീകരിക്കുക:**
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
# ചെലവു പരിഗണിച്ച മോഡൽ തിരഞ്ഞെടുപ്പ്
MODEL_COSTS = {
    'gpt-4.1-mini': 0.00015,  # ഓരോ 1K ടോക്കണുകൾക്ക്
    'gpt-4.1': 0.03,          # ഓരോ 1K ടോക്കണുകൾക്ക്
    'gpt-35-turbo': 0.0015  # ഓരോ 1K ടോക്കണുകൾക്ക്
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

### AZD ഡീബഗ്ഗിംഗ് കമാൻഡുകൾ

```bash
# വിശദമായ ലോഗിംഗ് സജീവമാക്കുക
azd up --debug

# വിന്യാസത്തിന്റെ നില പരിശോധിക്കുക
azd show

# അപ്ലിക്കേഷൻ ലോഗുകൾ കാണുക (ഓപ്പൺ‌സ് മോണിറ്ററിംഗ് ഡാഷ്ബോർഡ്)
azd monitor --logs

# ലൈв് മെട്രിക്സ് കാണുക
azd monitor --live

# പരിസരവും മാറ്റ്റ്റുകളും പരിശോധിക്കുക
azd env get-values
```

### AZD AI എക്സ്റ്റൻഷൻ ഡയഗ്നോസ്റ്റിക് കമാൻഡുകൾ

`azd ai agent init` ഉപയോഗിച്ച് ഏജന്റുകളെ വിന്യസിച്ചിരിക്കുകയാണെങ്കിൽ, ഈ അധിക ഉപകരണങ്ങൾ ലഭ്യമാണ്:

```bash
# ഏജന്റിന്റെ എക്സ്റ്റൻഷൻ ഇൻസ്റ്റാൾ ചെയ്തിട്ടുണ്ടെന്ന് ഉറപ്പാക്കുക
azd extension install azure.ai.agents

# ഒരു മാനിഫെസ്റ്റ് നിന്ന് ഏജന്റ് പുനഃആരഭിക്കുക അല്ലെങ്കിൽ അപ്‌ഡേറ്റ് ചെയ്യുക
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# പ്രോജക്ട് നില അറിയാൻ AI ഉപകരണങ്ങൾക്ക് MCP സെർവർ ഉപയോഗിക്കുക
azd mcp start

# പരിശോധനക്കും ഓഡിറ്റിനും വേണ്ടി ഘടനാ ഫയലുകൾ സൃഷ്ടിക്കുക
azd infra generate
```

> **അറിയിപ്പ്:** `azd infra generate` ഉപയോഗിച്ച് IaC ഡിസ്‌കിലേക്ക് എഴുതുക, അതിലൂടെ പ്രൊവൈഷൻ ചെയ്ത സ്രോതസ്സുകൾ എങ്ങനെ ഉണ്ടാകുന്നതെന്ന് സാരാസ്ത്യത്തിൽ പരിശോധിക്കാം. ഇത് റിസോഴ്സ് കോൺഫിഗറേഷൻ പ്രശ്നങ്ങൾ ഡീബഗ് ചെയ്യുമ്പോൾ അതീവ മൂല്യമുള്ളതാണ്. പൂർണ്ണാംശങ്ങൾക്കായി [AZD AI CLI റഫറൻസ്](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) കാണുക.

### ആപ്ലിക്കേഷൻ ഡീബഗ്ഗിംഗ്

1. **സංരചിത ലോഗ്ഗിങ്:**
```python
import logging
import json

# AI അപ്ലിക്കേഷനുകൾക്കായി ഘടനാപരമായ ലോഗിംഗ് ക്രമീകരിക്കുക
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

2. **ഹെൽത്ത് ചെക്ക് എൻഡ്‌പോയിന്റുകൾ:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # OpenAI ബന്ധം പരിശോധിക്കുക
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # തിരയൽ സേവനം പരിശോധിക്കുക
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

3. **പ്രകടനം നിരീക്ഷണം:**
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

## പൊതുവായ പിശക് കോഡുകൾ ಮತ್ತು പരിഹാരങ്ങൾ

| പിശക് കോഡ് | വിവരണം | പരിഹാരം |
|------------|-------------|----------|
| 401 | അനുമതിയില്ല | API കീകളും Managed Identity കോൺഫിഗറേഷനും പരിശോധിക്കുക |
| 403 | നിരോധനം | RBAC റോളുകൾ പരിശോധിക്കുക |
| 429 | നിരക്ക് പരിമിതപ്പെടുത്തിയിട്ടുണ്ട് | എക്സ്പൊണൻഷ്യൽ ബാക്ക്ഓഫ് ഉപയോഗിച്ച് റെട്രൈ ലജിക് നടപ്പാക്കുക |
| 500 | അകത്ത് സർവർ പിശക് | മോഡൽ വിന്യാസ സ്ഥിതി, ലോഗുകൾ പരിശോധിക്കുക |
| 503 | സേവനം ലഭ്യമല്ല | സേവന ആരോഗ്യവും പ്രദേശിക ലഭ്യതയും പരിശോധിക്കുക |

## തുടർന്ന് ചെയ്യേണ്ട കാര്യങ്ങൾ

1. **[AI Model Deployment Guide](../chapter-02-ai-development/ai-model-deployment.md)** അരാലോചിച്ച് വിന്യാസത്തിനുള്ള മികച്ച രീതി മനസ്സിലാക്കുക
2. **[Production AI Practices](../chapter-08-production/production-ai-practices.md)**Enterprise-യ്ക്കായി പൂർണ്ണമായ പരിഹാരങ്ങൾ പഠിക്കുക
3. **[Microsoft Foundry Discord](https://aka.ms/foundry/discord)**-ൽ ചേരുക, സമൂഹ സഹായത്തിനായി
4. AZD-ക്ക് നിഷ്ചിതമായ പ്രശ്നങ്ങൾക്കായി [AZD GitHub റിപ്പോസിറ്ററി](https://github.com/Azure/azure-dev) ലേക്ക് പ്രശ്നങ്ങൾ സമർപ്പിക്കുക

## വിഭവങ്ങൾ

- [Microsoft Foundry Models Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - നിങ്ങളുടെ എഡിറ്ററിലേക്ക് Azure പ്രശ്നപരിഹാര കഴിവുകൾ ഇൻസ്റ്റാൾ ചെയ്യുക: `npx skills add microsoft/github-copilot-for-azure`

---

**അധ്യായം നാവിഗേഷൻ:**
- **📚 കോഴ്സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 ഇപ്പോഴത്തെ അധ്യായം**: Chapter 7 - Troubleshooting & Debugging
- **⬅️ മുമ്പത്തെ**: [Debugging Guide](debugging.md)
- **➡️ അടുത്ത അധ്യായം**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 ബന്ധപ്പെട്ടത്**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 റഫറൻസ്**: [Azure Developer CLI Troubleshooting](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അസമ്മതി**:  
ഈ ഡോക്യുമെന്റ് AI പരിഭാഷാ സേവനമായ [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവർത്തനം ചെയ്തതാണ്. നാം കൃത്യതക്ക് പരിശ്രമിച്ചാലും, യാന്ത്രിക വിവർത്തനങ്ങളിൽ പിശകുകൾ അല്ലെങ്കിൽ അജ്ഞാതതകൾ ഉണ്ടാകാംെന്നത് ദയവായി ശ്രദ്ധിക്കുക. പ്രാഥമികകമായ ഭാഷയിലെ യഥാർത്ഥ ഡോക്യുമെന്റ് അവകാശ പ്രമാണമെന്ന് കരുതണം. നിർണായകമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ ശുപാർശ ചെയ്യുന്നു. ഈ വിവർത്തനത്തിന്റെ ഉപയോഗത്തിൽ ഉണ്ടായുള്ള ആരായോ തെറ്റിദ്ധാരണകളോ സംബന്ധിച്ച് ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->