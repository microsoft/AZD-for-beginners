# AI-സവിശേഷ തകരാറുകൾ പരിഹരിക്കൽ ഗൈഡ്

**അധ്യായം നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: അധ്യായം 7 - തകരാറുകൾ പരിഹരിക്കൽ & ഡീബഗ്ഗിംഗ്
- **⬅️ മുൻപത്തെ**: [Debugging Guide](debugging.md)
- **➡️ അടുത്ത അധ്യായം**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 ബന്ധപ്പെട്ടത്**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

AZD ഉപയോഗിച്ച് AI പരിഹാരങ്ങൾ വിന്യസിക്കുമ്പോഴുണ്ടാകുന്ന സാധാരണ പ്രശ്നങ്ങൾ അഭിമുഖീകരിക്കുന്ന ഈ സമഗ്ര തകരാറുകൾ പരിഹരിക്കൽ ഗൈഡ്, Azure AI സർവീസുകളുമായി ബന്ധപ്പെട്ട പ്രത്യേക പരിഹാരങ്ങളും ഡീബഗ്ഗിംഗ് സാങ്കേതിക വിദ്യകളും നൽകുന്നു.

## ഉള്ളടക്ക പട്ടിക

- [Microsoft Foundry Models Service പ്രശ്നങ്ങൾ](#azure-openai-service-issues)
- [Azure AI Search പ്രശ്നങ്ങൾ](#azure-ai-search-പ്രശ്നങ്ങൾ)
- [Container Apps വിന്യാസ പ്രശ്നങ്ങൾ](#container-apps-വിന്യാസ-പ്രശ്നങ്ങൾ)
- [പ്രാമാണീകരണവും അനുവാദ പിശകുകളും](#പ്രാമാണീകരണവും-അനുവാദ-പിശകുകളും)
- [മോഡൽ വിന്യാസ പരാജയങ്ങൾ](#മോഡൽ-വിന്യാസ-പരാജയങ്ങൾ)
- [പ്രവർത്തനക്ഷമതയും സ്കെയ്‌ലിംഗും പ്രശ്നങ്ങൾ](#പ്രവർത്തനക്ഷമതയും-സ്കെയ്‌ലിംഗും-പ്രശ്നങ്ങൾ)
- [ചെലവും കോറ്റാ മാനേജുമെന്റും](#ചെലവും-കോറ്റാ-മാനേജുമെന്റും)
- [ഡീബഗ്ഗിംഗ് ഉപകരണങ്ങളും സാങ്കേതിക വിദ്യകളും](#ഡീബഗ്ഗിംഗ്-ഉപകരണങ്ങളും-സാങ്കേതിക-വിദ്യകളും)

## Microsoft Foundry Models Service പ്രശ്നങ്ങൾ

### പ്രശ്നം: OpenAI സർവീസ് പ്രദേശത്ത് ലഭ്യമല്ല

**രോഗലക്ഷണങ്ങൾ:**
```
Error: The requested resource type is not available in the location 'westus'
```

**കാരണങ്ങൾ:**
- Microsoft Foundry Models തിരഞ്ഞെടുത്ത പ്രദേശത്ത് ലഭ്യമല്ല
- മുൻഗണന നൽകിയ പ്രദേശങ്ങളിൽ കോറ്റാ അഴിച്ചിരിക്കുന്നു
- പ്രദേശിക ശേഷി പരിമിതികൾ

**പരിഹാരങ്ങൾ:**

1. **പ്രദേശ ലഭ്യത പരിശോധിക്കുക:**
```bash
# OpenAI-ക്ക് ലഭ്യമായ പ്രദേശങ്ങൾ പട്ടികപ്പെടുത്തുക
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

3. **മറ്റു പ്രദേശങ്ങൾ ഉപയോഗിക്കുക:**
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

### പ്രശ്നം: മോഡൽ വിന്യാസ കോറ്റാ മികവുകൾ

**രോഗലക്ഷണങ്ങൾ:**
```
Error: Deployment failed due to insufficient quota
```

**പരിഹാരങ്ങൾ:**

1. **നിലവിലുള്ള കോറ്റാ പരിശോധിക്കുക:**
```bash
# ക്വോട്ട ഉപയോഗം പരിശോധിക്കുക
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **കോറ്റാ വർദ്ധിപ്പിക്കാൻ അഭ്യർഥിക്കുക:**
```bash
# കൊട്ടസ്ഥാനങ്ങളില്‍ വര്‍ധനവിനുള്ള അപേക്ഷ സമര്‍പ്പിക്കുക
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

### പ്രശ്നം: അസാധുവായ API പതിപ്പ്

**രോഗലക്ഷണങ്ങൾ:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**പരിഹാരങ്ങൾ:**

1. **അനുവദിച്ച API പതിപ്പ് ഉപയോഗിക്കുക:**
```python
# ഏറ്റവും പുതിയ പിന്തുണയുള്ള പതിപ്പ് ഉപയോഗിക്കുക
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API പതിപ്പുകളുടെ പൊരുത്തം പരിശോധിക്കുക:**
```bash
# പിന്തുണയ്ക്കുന്ന API വേർഷനുകളുടെ പട്ടിക
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search പ്രശ്നങ്ങൾ

### പ്രശ്നം: Search സർവീസ് വിലയിരുത്തൽ നില അപര്യാപ്തം

**രോഗലക്ഷണങ്ങൾ:**
```
Error: Semantic search requires Basic tier or higher
```

**പരിഹാരങ്ങൾ:**

1. **വിലയിരുത്തൽ നില അപ്‌ഡേറ്റുചെയ്യുക:**
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

2. **സെമാന്റിക് സെർച്ച് നിശ്ചലമാക്കുക (വികസനത്തിനായി):**
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

### പ്രശ്നം: ഇൻഡക്സ് സൃഷ്ടിക്കൽ പരാജയം

**രോഗലക്ഷണങ്ങൾ:**
```
Error: Cannot create index, insufficient permissions
```

**പരിഹാരങ്ങൾ:**

1. **Search സർവീസ് കീകൾ സ്ഥിരീകരിക്കുക:**
```bash
# സെർച്ച് സർവീസ് അഡ്മിൻ കീ ലഭിക്കുക
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **ഇൻഡക്സ് സ്കീമ പരിശോധിക്കുക:**
```python
# സൂചിക സ്കീമ പരിശോദിക്കുക
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

## Container Apps വിന്യാസ പ്രശ്നങ്ങൾ

### പ്രശ്നം: കണ്ടെയ്‌നർ ബിൽഡ് പരാജയം

**രോഗലക്ഷണങ്ങൾ:**
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

2. **അവലംബങ്ങൾ സ്ഥിരീകരിക്കുക:**
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

### പ്രശ്നം: കണ്ടെയ്‌നർ ആപ്പ് സ്റ്റാർട്ട് അപരാജയം

**രോഗലക്ഷണങ്ങൾ:**
```
Error: Container failed to start within timeout period
```

**പരിഹാരങ്ങൾ:**

1. **സ്റ്റാർട്ട് അപ്പ് ടൈംഔട്ട് വർദ്ധിപ്പിക്കുക:**
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
# സ്റ്റാർട്ടപ്പ് സമയമു കുറയ്ക്കാൻ മodelുകൾ ലേസി ലോഡ് ചെയ്യുക
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
        # ഇവിടെ AI ക്ലയന്റ് ഇൻഷിയലൈസ് ചെയ്യുക
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

## പ്രാമാണീകരണവും അനുവാദ പിശകുകളും

### പ്രശ്നം: Managed Identity അവകാശം നിരാകരിച്ചത്

**രോഗലക്ഷണങ്ങൾ:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**പരിഹാരങ്ങൾ:**

1. **റോൾ നിയോഗങ്ങൾ പരിശോധിക്കുക:**
```bash
# നിലവിലെ റോൾ നിയമനങ്ങൾ പരിശോധിക്കുക
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **ആവശ്യമായ റോളുകൾ നിയോഗിക്കുക:**
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

3. **പ്രാമാണീകരണം പരിശോധിക്കുക:**
```python
# മാനേജ്ഡ് ഐഡന്റിറ്റി അവലോകനം പരിശോധന നടത്തുക
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

### പ്രശ്നം: കീ വോൾട്ട് ആക്‌സസ് നിരാകരണം

**രോഗലക്ഷണങ്ങൾ:**
```
Error: The user, group or application does not have secrets get permission
```

**പരിഹാരങ്ങൾ:**

1. **കീ വോൾട്ട് അധികാരങ്ങൾ അനുവദിക്കുക:**
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

2. **ആക്‌സസ് നയങ്ങൾ പകരം RBAC ഉപയോഗിക്കുക:**
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

## മോഡൽ വിന്യാസ പരാജയങ്ങൾ

### പ്രശ്നം: മോഡൽ പതിപ്പ് ലഭ്യമല്ല

**രോഗലക്ഷണങ്ങൾ:**
```
Error: Model version 'gpt-4-32k' is not available
```

**പരിഹാരങ്ങൾ:**

1. **ലഭ്യമായ മോഡലുകൾ പരിശോധിക്കുക:**
```bash
# ലഭ്യമായ മോഡലുകളുടെ പട്ടിക
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **മോഡൽ ഫാള്ബാക്കുകൾ ഉപയോഗിക്കുക:**
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

3. **വിന്യാസം മുമ്പ് മോഡൽ പരിശോധിക്കുക:**
```python
# പ്രീ-ഡിപ്ലോയ്മെന്റ് മോഡൽ വാലിഡേഷൻ
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

## പ്രവർത്തനക്ഷമതയും സ്കെയ്‌ലിംഗും പ്രശ്നങ്ങൾ

### പ്രശ്നം: ഉയർന്ന ലേറ്റൻസി പ്രതികരണങ്ങൾ

**രോഗലക്ഷണങ്ങൾ:**
- പ്രതികരണ സമയങ്ങൾ > 30 സെക്കൻഡ്
- ടൈംഔട്ട് പിശകുകൾ
- മോശം ഉപയോക്തൃ അനുഭവം

**പരിഹാരങ്ങൾ:**

1. **റിക്വസ്റ്റ് ടൈംഔട്ട് നടപ്പിലാക്കുക:**
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

2. **പ്രതികരണം കാഷ് ചെയ്യുക:**
```python
# പ്രതികരണങ്ങള്‍ക്കുള്ള Redis കാഷെ
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

3. **ഓട്ടോ-സ്കെയ്‌ലിംഗ് ക്രമീകരിക്കുക:**
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

### പ്രശ്നം: മെമ്മറി ഔട്ട്ഒഫ് പിശകുകൾ

**രോഗലക്ഷണങ്ങൾ:**
```
Error: Container killed due to memory limit exceeded
```

**പരിഹാരങ്ങൾ:**

1. **മെമ്മറി അലോക്കേഷൻ വർദ്ധിപ്പിക്കുക:**
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

2. **മെമ്മറി ഉപയോഗം മെച്ചപ്പെടുത്തുക:**
```python
# മെമ്മറി-ക്ഷമതയുള്ള മോഡൽ കൈകാര്യം ചെയ്യൽ
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # പ്രോസസ്സിംഗ് തുടങ്ങുന്നതിന് മുമ്പ് മെമ്മറി ഉപയോഗം പരിശോധിക്കുക
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # ഗാർബേജ് ശേഖരണം ബലംപ്രയോഗിക്കുക
            
        result = await self._process_ai_request(request)
        
        # പ്രോസസ്സിംഗ് കഴിഞ്ഞ് ശുചീകരിക്കുക
        gc.collect()
        return result
```

## ചെലവും കോറ്റാ മാനേജുമെന്റും

### പ്രശ്നം: അനിയന്ത്രിതമായ ഉയർന്ന ചിലവുകൾ

**രോഗലക്ഷണങ്ങൾ:**
- Azure ബിൽ പ്രതീക്ഷിച്ചതിന്റെ മേൽ
- ടോക്കൺ ഉപയോഗം കണക്കുകളിൽ കൂടുതലായി
- ബഡ്ജറ്റ് അലർട്ടുകൾ സജീവമാക്കപ്പെട്ടത്

**പരിഹാരങ്ങൾ:**

1. **ചെലവ് നിയന്ത്രണങ്ങൾ നടപ്പിലാക്കുക:**
```python
# ടോക്കൺ ഉപയോഗം നിരീക്ഷിക്കുന്നു
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

2. **ചെലവ് അലർട്ടുകൾ സജ്ജമാക്കുക:**
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
# ചെലവിനു അനുസരിച്ചുള്ള മോഡൽ തിരഞ്ഞെടുപ്പ്
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

## ഡീബഗ്ഗിംഗ് ഉപകരണങ്ങളും സാങ്കേതിക വിദ്യകളും

### AZD ഡീബഗ്ഗിംഗ് കമാൻഡുകൾ

```bash
# വിസ്തൃതമായ ലോഗിംഗ് സജ്ജമാക്കുക
azd up --debug

# വിന്യാസത്തിന്റെ നില പരിശോധിക്കുക
azd show

# അപ്ലിക്കേഷൻ ലോഗുകൾ കാണുക (മോണിറ്ററിംഗ് ഡാഷ്‌ബോർഡ് തുറക്കും)
azd monitor --logs

# ഒരു നിമിഷം ഫലങ്ങൾ കാണുക
azd monitor --live

# പരിസ്ഥിതി വേരിയബിൾസ് പരിശോധിക്കുക
azd env get-values
```

### AZD AI എക്സ്റ്റെൻഷൻ ഡയഗ്നോസ്റ്റിക് കമാൻഡുകൾ

`azd ai agent init` ഉപയോഗിച്ച് നിങ്ങൾ ഏജന്റുകൾ വിന്യസിച്ചിട്ടുണ്ടെങ്കിൽ, ഈ അധിക ഉപകരണങ്ങൾ ലഭ്യമാണ്:

```bash
# ഏജന്റിന്റെ വിപുലീകരണം ഇൻസ്റ്റാൾ ചെയ്തിട്ടുണ്ടെന്ന് ഉറപ്പാക്കുക
azd extension install azure.ai.agents

# ഒരു മാനിഫെസ്റ്റിൽ നിന്ന് ഏജന്റിനെ വീണ്ടും പ്രാരംഭമാക്കുക അല്ലെങ്കിൽ അപ്‌ഡേറ്റ് ചെയ്യുക
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# പ്രോജക്ട് സ്റ്റേറ്റ് ചോദിക്കാൻ എഐ ടൂളുകൾക്ക് MCP സെർവറെ ഉപയോഗിക്കുക
azd mcp start

# അവലോകനത്തിനും აუსിറ്റിനും വേണ്ടി ഇൻഫ്രാസ്ട്രക്ചർ ഫയലുകൾ സൃഷ്‌ടിക്കുക
azd infra generate
```

> **അത് പോലെ:** `azd infra generate` ഉപയോഗിച്ച് IaC ഡിസ്കിൽ എഴുതുക, വാസ്തവത്തിൽ ഏത് റിസോഴ്‌സുകൾ വിന്യസിച്ചുവെന്ന് പരിശോധിക്കാം. റിസോഴ്‌സ് കോൺഫിഗറേഷൻ പ്രശ്നങ്ങൾ ഡീബഗ്ഗിൽ ഇതു വളരെ സഹായകരമാണ്. മുഴുവൻ വിവരങ്ങൾക്ക് [AZD AI CLI reference](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) കാണുക.

### അപ്ലിക്കേഷൻ ഡീബഗ്ഗിംഗ്

1. **സംരചിത ലോക്കിംഗ്:**
```python
import logging
import json

# AI അപ്ലിക്കേഷനുകൾക്ക് ഘടനയാക്കിയ ലോഗിംഗ് കോൺഫിഗർ ചെയ്യുക
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

2. **ഹെൽത്ത് ചെക്ക് എന്റ്പോയിന്റുകൾ:**
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
    
    # സേർച്ച് സേവനം പരിശോധിക്കുക
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

3. **പ്രവർത്തനക്ഷമത നിരീക്ഷണം:**
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

## സാധാരണ പിശക് കോഡുകളും പരിഹാരങ്ങളും

| പിശക് കോഡ് | വിവരണം | പരിഹാരം |
|------------|-------------|----------|
| 401 | അനധികൃതം | API കീകൾയും മാനേജ്ഡ് ഐഡന്റിറ്റി കോൺഫിഗറേഷനും പരിശോധിക്കുക |
| 403 | നിരോധനം | RBAC റോൾ നിയോഗങ്ങൾ സ്ഥിരീകരിക്കുക |
| 429 | നിരക്ക് പരിമിതപ്പെടുത്തി | വളരുന്ന പിന്മാറ്റത്തോടെ പുനരായിപ്പിനുള്ള ലોજിക് നടപ്പിലാക്കുക |
| 500 | ഉൾങ്ങൽ സർവർ പിശക് | മോഡൽ വിന്യാസ നിലയും ലോഗുകളും പരിശോധിക്കുക |
| 503 | സർവീസ് ലഭ്യമല്ല | സർവീസ് ഹെൽത്ത്, പ്രദേശിക ലഭ്യത പരിശോധിക്കുക |

## അടുത്ത നടപടി മാനങ്ങൾ

1. **[AI Model Deployment Guide](../chapter-02-ai-development/ai-model-deployment.md)** deployment മികച്ച അനുഭവത്തിനായി അവലോകനം ചെയ്യുക
2. **[Production AI Practices](../chapter-08-production/production-ai-practices.md)** എന്നത് സമ്പൂർണമായ എന്റർപ്രൈസ് പരിഹാരങ്ങൾക്കായി പൂർത്തിയാക്കുക
3. **[Microsoft Foundry Discord](https://aka.ms/foundry/discord)** - കമ്മ്യൂണിറ്റി പിന്തുണക്കായി ചേരുക
4. **പിശകുകൾ സമർപ്പിക്കുക** [AZD GitHub repository](https://github.com/Azure/azure-dev) - AZD-സംബന്ധിയായ പ്രശ്നങ്ങൾക്ക്

## സ്രോതസ്സുകൾ

- [Microsoft Foundry Models Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - നിങ്ങളുടെ എഡിറ്ററിൽ Azure തകരാറുകൾ പരിഹരിക്കുന്ന സ്കിൽസുകൾ ഇൻസ്റ്റാൾ ചെയ്യാൻ: `npx skills add microsoft/github-copilot-for-azure`

---

**അധ്യായം നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: അധ്യായം 7 - തകരാറുകൾ പരിഹരിക്കൽ & ഡീബഗ്ഗിംഗ്
- **⬅️ മുൻപത്തെ**: [Debugging Guide](debugging.md)
- **➡️ അടുത്ത അധ്യായം**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 ബന്ധപ്പെട്ടത്**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 സൂചിക**: [Azure Developer CLI Troubleshooting](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**പരിശോധനാ കുറിപ്പ്**:  
ഈ രേഖ AI വിവര്‍ത്തന സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവര്‍ത്തനം ചെയ്തതാണ്. നാം കൃത്യതയ്ക്ക് ശ്രമിക്കുമ്പോഴും, സ്വയമേധയാ വിവര്‍ത്തനങ്ങളില്‍ പിശകുകൾ അല്ലെങ്കിൽ അപാകതകൾ ഉണ്ടാകാമെന്ന് ദയവായി മനസ്സിലാക്കുക. മാതൃഭാഷകളിലെ യഥാർത്ഥ documento പ്രാധാന്യമുള്ള ഉറവിടമായി കണക്കാക്കണം. നിർണായകമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മാനവ വിവര്‍ത്തനം ശുപാർശ ചെയ്യപ്പെടുന്നു. ഈ വിവർത്തനത്തിന്റെ ഉപയോഗത്തിൽ നിന്നുണ്ടാകുന്ന തെറ്റിദ്ധാരണകളും തിരിച്ചറിയലുകളും үшін ഞങ്ങൾ ഉത്തരവാദിത്തം ഏറ്റെടുക്കുന്നില്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->