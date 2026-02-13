# AI-സവിശേഷ പ്രശ്നപരിഹാര മാർഗ്ദർശി

**അധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്സ് ഹോം**: [AZD ആരംഭിക്കുന്നവർക്ക്](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: അധ്യായം 7 - പ്രശ്നപരിഹാരവും ഡീബഗിംഗും
- **⬅️ മുമ്പത്തെ**: [ഡീബഗിംഗ് ഗൈഡ്](debugging.md)
- **➡️ അടുത്ത അധ്യായം**: [അധ്യായം 8: പ്രൊഡക്ഷൻ & എന്റർപ്രൈസ് മാതൃകകൾ](../chapter-08-production/production-ai-practices.md)
- **🤖 ബന്ധപ്പെട്ടത്**: [അധ്യായം 2: AI-ഫസ്റ്റ് ഡെവലപ്‌മെന്റ്](../chapter-02-ai-development/microsoft-foundry-integration.md)

**Previous:** [Production AI Practices](../chapter-08-production/production-ai-practices.md) | **Next:** [AZD Basics](../chapter-01-foundation/azd-basics.md)

ഈ സമഗ്രമായ പ്രശ്നപരിഹാര മാർഗ്ദർശി AZD ഉപയോഗിച്ച് AI പരിഹാരങ്ങൾ വിന്യസിക്കുമ്പോൾ സംഭവിക്കുന്ന സാധാരണ പ്രശ്നങ്ങൾ അഭിമുഖീകരിക്കുന്നു, Azure AI സേവനങ്ങളുമായി ബന്ധപ്പെട്ട പ്രത്യേക പരിഹാരങ്ങൾക്കും ഡീബഗിംഗ് സാങ്കേതികതകൾക്കും ഉത്തരം നൽകുന്നു.

## ഉള്ളടക്ക പട്ടിക

- [Azure OpenAI Service Issues](../../../../docs/chapter-07-troubleshooting)
- [Azure AI Search Problems](../../../../docs/chapter-07-troubleshooting)
- [Container Apps Deployment Issues](../../../../docs/chapter-07-troubleshooting)
- [Authentication and Permission Errors](../../../../docs/chapter-07-troubleshooting)
- [Model Deployment Failures](../../../../docs/chapter-07-troubleshooting)
- [Performance and Scaling Issues](../../../../docs/chapter-07-troubleshooting)
- [Cost and Quota Management](../../../../docs/chapter-07-troubleshooting)
- [Debugging Tools and Techniques](../../../../docs/chapter-07-troubleshooting)

## Azure OpenAI Service Issues

### പ്രശ്നം: തിരഞ്ഞെടുത്ത മേഖലയിൽ OpenAI സേവനം ലഭ്യമല്ല

**ലക്ഷണങ്ങൾ:**
```
Error: The requested resource type is not available in the location 'westus'
```

**കാരണങ്ങൾ:**
- തിരഞ്ഞെടുത്ത മേഖലയിൽ Azure OpenAI ലഭ്യമല്ല
- മുന്‍ഗണനയുള്ള മേഖലകളിൽ ക്വോട്ട Exhausted ആയി
- പ്രാദേശിക ശേഷി പരിധികൾ

**പരിഹാരങ്ങൾ:**

1. **മേഖല ലഭ്യത പരിശോധിക്കുക:**
```bash
# OpenAIയ്ക്ക് ലഭ്യമായ പ്രദേശങ്ങൾ പട്ടിക ചെയ്യുക
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **AZD കോൺഫിഗറേഷൻ അപ്‌ഡേറ്റ് ചെയ്യുക:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **മറ്റു മേഖലകൾ ഉപയോഗിക്കുക:**
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

### പ്രശ്നം: മോഡൽ വിന്യാസത്തിനുള്ള ക്വോട്ട മറികടന്നിരിക്കുന്നു

**ലക്ഷണങ്ങൾ:**
```
Error: Deployment failed due to insufficient quota
```

**പരിഹാരങ്ങൾ:**

1. **നിലവിലെ ക്വോട്ട പരിശോധിക്കുക:**
```bash
# ക്വോട്ടാ ഉപയോഗം പരിശോധിക്കുക
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **ക്വോട്ട വർദ്ധനവിന് അപേക്ഷിക്കുക:**
```bash
# ക്വോട്ടാ വർദ്ധനവിനുള്ള അഭ്യർത്ഥന സമർപ്പിക്കുക
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **മോഡൽ ശേഷി ഓപ്ടിമൈസ് ചെയ്യുക:**
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

### പ്രശ്നം: അസാധുവായ API വേർഷൻ

**ലക്ഷണങ്ങൾ:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**പരിഹാരങ്ങൾ:**

1. **സഹായിച്ച API വേർഷൻ ഉപയോഗിക്കുക:**
```python
# പിന്തുണ ലഭിക്കുന്ന ഏറ്റവും പുതിയ പതിപ്പ് ഉപയോഗിക്കുക.
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API വേർഷൻ совместимость പരിശോധിക്കുക:**
```bash
# പിന്തുണയുള്ള API പതിപ്പുകൾ പട്ടികപ്പെടുത്തുക
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search Problems

### പ്രശ്നം: Search സർവീസിന്റെ പ്രൈസിങ് ടയർ മതിയല്ല

**ലക്ഷണങ്ങൾ:**
```
Error: Semantic search requires Basic tier or higher
```

**പരിഹാരങ്ങൾ:**

1. **പ്രൈസിങ് ടയർ അപ്‌ഗ്രേഡ് ചെയ്യുക:**
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

2. **വികസനകാലത്തേക്ക് സെമാന്റിക് സേർച്ച် നിർജ്ജീവമാക്കുക:**
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

### പ്രശ്നം: ഇൻഡക്സ് സൃഷ്ടിയിൽ പരാജയങ്ങൾ

**ലക്ഷണങ്ങൾ:**
```
Error: Cannot create index, insufficient permissions
```

**പരിഹാരങ്ങൾ:**

1. **Search സർവീസ് കീകൾ പരിശോധിക്കുക:**
```bash
# തിരയൽ സേവനത്തിന്റെ അഡ്മിൻ കീ നേടുക
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **ഇൻഡക്സ് സ്കീമ പരിശോധിക്കുക:**
```python
# ഇൻഡെക്സ് സ്കീമയുടെ സാധുത പരിശോധിക്കുക
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

### പ്രശ്നം: കണ്ടെയ്‌നർ ബിൽഡ് പരാജയം

**ലക്ഷണങ്ങൾ:**
```
Error: Failed to build container image
```

**പരിഹാരങ്ങൾ:**

1. **Dockerfile സിന്റാക്സ് പരിശോധിക്കുക:**
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

2. **ഡിപ്പൻഡൻസികൾ സ്ഥിരീകരിക്കുക:**
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

3. **ഹെൽത്ത് ചെക്ക് ചേർക്കുക:**
```python
# main.py - ഹെൽത്ത് ചെക്ക് എൻഡ്‌പോയിന്റ് ചേർക്കുക
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### പ്രശ്നം: കണ്ടെയ്‌നർ ആപ്പ് സ്റ്റാർട്ടപ്പ് പരാജയം

**ലക്ഷണങ്ങൾ:**
```
Error: Container failed to start within timeout period
```

**പരിഹാരങ്ങൾ:**

1. **സ്റ്റാർട്ടപ്പ് ടൈംഔട്ട് വർദ്ധിപ്പിക്കുക:**
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

2. **മോഡൽ ലോഡിംഗ് ഓപ്ടിമൈസ് ചെയ്യുക:**
```python
# സ്റ്റാർട്ടപ്പ് സമയം കുറക്കാൻ മോഡലുകൾ ആവശ്യമായപ്പോൾ മാത്രം ലോഡ് ചെയ്യുക
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
        # ഇവിടെ എഐ ക്ലയന്റ് ആരംഭിക്കുക
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # ആരംഭം
    app.state.model_manager = ModelManager()
    yield
    # അടയ്ക്കൽ
    pass

app = FastAPI(lifespan=lifespan)
```

## Authentication and Permission Errors

### പ്രശ്നം: മാനേജ്ഡ് ഐഡന്റിറ്റിക്ക് അനുമതി നിഷേധിച്ചു

**ലക്ഷണങ്ങൾ:**
```
Error: Authentication failed for Azure OpenAI Service
```

**പരിഹാരങ്ങൾ:**

1. **റോൾ അസൈൻമെന്റുകൾ ശരിയായി പരിശോധിക്കുക:**
```bash
# നിലവിലെ റോൾ നിയോഗങ്ങൾ പരിശോധിക്കുക
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **ആവശ്യമായ റോളുകൾ ഏൽപ്പിക്കുക:**
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

3. **ഓതന്റിക്കേഷൻ ടെസ്റ്റ് ചെയ്യുക:**
```python
# മാനേജ്ഡ് ഐഡന്റിറ്റിയുടെ പ്രാമാണീകരണം പരിശോധിക്കുക
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

### പ്രശ്നം: കീ വാൾട്ട് ആക്‌സസ് നിഷേധിച്ചു

**ലക്ഷണങ്ങൾ:**
```
Error: The user, group or application does not have secrets get permission
```

**പരിഹാരങ്ങൾ:**

1. **കീ വാൾട്ട് അനുമതികൾ നൽകുക:**
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

2. **Access Policies ന് പകരം RBAC ഉപയോഗിക്കുക:**
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

### പ്രശ്നം: മോഡൽ വേർഷൻ ലഭ്യമല്ല

**ലക്ഷണങ്ങൾ:**
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

2. **മോഡൽ ഫോക് ബാക്കുകൾ ഉപയോഗിക്കുക:**
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

3. **വിന്യാസത്തിനു മുമ്പായി മോഡൽ സ്ഥിരീകരിക്കുക:**
```python
# ഡെപ്ലോയ്‌മെന്റിന് മുമ്പ് മോഡൽ സാധൂകരണത്
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

### പ്രശ്നം: ഉയർന്ന ലേറ്റ്ൻസി പ്രതികരണങ്ങൾ

**ലക്ഷണങ്ങൾ:**
- പ്രതികരണ സമയങ്ങൾ > 30 സെക്കൻഡ്
- ടൈംഔട്ട് പിശകുകൾ
- ഉപയോക്തൃ അനുഭവം മോശം

**പരിഹാരങ്ങൾ:**

1. **റിക്വസ്റ്റ് ടൈംഔട്ടുകൾ നടപ്പിലാക്കുക:**
```python
# ഉചിതമായ ടൈംഔട്ടുകൾ ക്രമീകരിക്കുക
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

2. **പ്രതികരണം കാഷേ ചെയ്യുക:**
```python
# പ്രതികരണങ്ങൾക്ക് Redis കാഷെ
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

3. **ഓട്ടോ-സ്കെയിലിംഗ് കോൺഫിഗർ ചെയ്യുക:**
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

### പ്രശ്നം: Out of Memory പിശകുകൾ

**ലക്ഷണങ്ങൾ:**
```
Error: Container killed due to memory limit exceeded
```

**പരിഹാരങ്ങൾ:**

1. **മെമ്മറി അലൊക്കേഷൻ വർദ്ധിപ്പിക്കുക:**
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

2. **മെമ്മറി ഉപയോഗം ഓപ്ടിമൈസ് ചെയ്യുക:**
```python
# മെമ്മറി കാര്യക്ഷമമായ മോഡൽ കൈകാര്യം ചെയ്യൽ
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # പ്രോസസ് ചെയ്യുന്നതിന് മുമ്പ് മെമ്മറി ഉപയോഗം പരിശോധിക്കുക
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # ഗാർബേജ് ശേഖരണം നിർബന്ധിക്കുക
            
        result = await self._process_ai_request(request)
        
        # പ്രോസസ് കഴിഞ്ഞതിനു ശേഷം ശുചീകരണം നടത്തുക
        gc.collect()
        return result
```

## Cost and Quota Management

### പ്രശ്നം: അപ്രതീക്ഷിതമായി ഉയർന്ന ചെലവുകൾ

**ലക്ഷണങ്ങൾ:**
- പ്രതീക്ഷയിലും ഉയർന്ന Azure ബിൽ
- ടോക്കൺ ഉപയോഗം കണക്കുകൂട്ടലിനെ മറികടക്കുന്നു
- ബജറ്റ് അലേർട്ടുകൾ ട്രിഗർ ചെയ്തത്

**പരിഹാരങ്ങൾ:**

1. **ചെലവ് നിയന്ത്രണങ്ങൾ നടപ്പിലാക്കുക:**
```python
# ടോക്കൺ ഉപയോഗം നിരീക്ഷിക്കൽ
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

2. **ചെലവ് അലേർട്ടുകൾ സജ്ജമാക്കുക:**
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

3. **മോഡൽ തിരഞ്ഞെടുപ്പ് ഓപ്ടിമൈസ് ചെയ്യുക:**
```python
# ചെലവ് പരിഗണിച്ചുള്ള മോഡൽ തിരഞ്ഞെടുപ്പ്
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # പ്രതി 1K ടോക്കണുകൾക്ക്
    'gpt-4': 0.03,          # പ്രതി 1K ടോക്കണുകൾക്ക്
    'gpt-35-turbo': 0.0015  # പ്രതി 1K ടോക്കണുകൾക്ക്
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

### AZD ഡീബഗിംഗ് കമാൻഡുകൾ

```bash
# വിവരപരമായ ലോഗിംഗ് സജീവമാക്കുക
azd up --debug

# ഡിപ്ലോയ്മെന്റ് നില പരിശോധിക്കുക
azd show

# അപ്ലിക്കേഷൻ ലോഗുകൾ കാണുക (മോണിറ്ററിംഗ് ഡാഷ്ബോർഡ് തുറക്കും)
azd monitor --logs

# തത്സമയം മീട്രിക്കുകൾ കാണുക
azd monitor --live

# പരിസ്ഥിതി വേരിയബിളുകൾ പരിശോധിക്കുക
azd env get-values
```

### ആപ്ലിക്കേഷൻ ഡീബഗിംഗ്

1. **സംഘടിത ലോഗിംഗ്:**
```python
import logging
import json

# എഐ ആപ്ലിക്കേഷനുകൾക്കുള്ള ഘടനാബദ്ധമായ ലോഗിംഗ് ക്രമീകരിക്കുക
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
    
    # OpenAI കണക്ഷൻ പരിശോധിക്കുക
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

## സ്വഭാവം സാധാരണമായ പിശക് കോഡുകളും പരിഹാരങ്ങളും

| Error Code | Description | Solution |
|------------|-------------|----------|
| 401 | അനധികൃതം | API കീകളും മാനേജ്ഡ് ഐഡന്റിറ്റി കോൺഫിഗറേഷൻ പരിശോധിക്കുക |
| 403 | നിഷേധിച്ചു | RBAC റോളുകൾ ശരിയായി ഏൽപ്പിച്ചിട്ടുണ്ടോ എന്നു സ്ഥിരീകരിക്കുക |
| 429 | എണ്ണഭ الرحيم? | റീട്രൈ ലജിക് എക്സ്പൊണൻഷ്യൽ ബാക്കോഫ് ഉപയോഗിച്ച് നടപ്പിലാക്കുക |
| 500 | اندرനൽ സർവർ പിശക് | മോഡൽ വിന്യാസ സ്ഥിതി மற்றும் ലോഗുകൾ പരിശോധിക്കുക |
| 503 | സേവനം ലഭ്യമല്ല | സേവനത്തിന്‍റെ ഹെൽത്ത്യും പ്രാദേശിക ലഭ്യതയും പരിശോധിക്കുക |

## Next Steps

1. **വിന്യാസ മികച്ച രീതികൾക്കായി [AI Model Deployment Guide](../chapter-02-ai-development/ai-model-deployment.md) സംശോധിക്കൂ**
2. **സംരംഭ-തയ്യാറായ പരിഹാരങ്ങൾക്ക് [Production AI Practices](../chapter-08-production/production-ai-practices.md) പൂർത്തിയാക്കുക**
3. **സമൂഹ സഹായത്തിനായി [Microsoft Foundry Discord](https://aka.ms/foundry/discord) ചേരുക**
4. **AZD-സംബന്ധപ്പെട്ട പ്രശ്നങ്ങൾക്ക് [AZD GitHub റിപോസിറ്ററി](https://github.com/Azure/azure-dev) ൽ ഇഷ്യുകൾ സമർപ്പിക്കുക**

## വിഭവങ്ങൾ

- [Azure OpenAI Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**അധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്സ് ഹോം**: [AZD ആരംഭിക്കുന്നവർക്ക്](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: അധ്യായം 7 - പ്രശ്നപരിഹാരവും ഡീബഗിംഗും
- **⬅️ മുൻപത്തെ**: [ഡീബഗിംഗ് ഗൈഡ്](debugging.md)
- **➡️ അടുത്ത അധ്യായം**: [അധ്യായം 8: പ്രൊഡക്ഷൻ & എന്റർപ്രൈസ് മാതൃകകൾ](../chapter-08-production/production-ai-practices.md)
- **🤖 ബന്ധപ്പെട്ടത്**: [അധ്യായം 2: AI-ഫസ്റ്റ് ഡെവലപ്‌മെന്റ്](../chapter-02-ai-development/microsoft-foundry-integration.md)
- [Azure Developer CLI Troubleshooting](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ഡിസ്ക്ലെയിമർ:
ഈ രേഖ AI പരിഭാഷാ സേവനം Co-op Translator (https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവർത്തനം ചെയ്തതാണ്. ഞങ്ങൾ പരമാവധിയിൽ കൃത്യത ഉറപ്പാക്കാൻ ശ്രമിച്ചിരുന്നാലും, യന്ത്രം ചെയ്ത പരിഭാഷകളിൽ പിശകുകൾ അല്ലെങ്കിൽ തെറ്റായ വിവരങ്ങൾ ഉണ്ടാകാം എന്ന് ദയവായി ശ്രദ്ധിക്കുക. മൂലഭാഷയിലുള്ള യഥാർത്ഥ ദസ്താവ് പ്രാമാണിക ഉറവിടമായി കരുതപ്പെടണം. നിർണായകമായ വിവരങ്ങൾക്കായി പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ നിർദേശിച്ചിരിക്കുന്നു. ഈ വിവർത്തനത്തിന്റെ ഉപയോഗത്തിൽ നിന്ന് ഉണ്ടായ任何 തെറ്റിദ്ധാരണങ്ങൾക്കോ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കോ ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->