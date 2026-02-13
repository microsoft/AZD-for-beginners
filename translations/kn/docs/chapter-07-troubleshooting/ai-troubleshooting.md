# AI-ನಿರ್ದಿಷ್ಟ ಸಮಸ್ಯೆ ಪರಿಹಾರ ಮಾರ್ಗದರ್ಶಿ

**ಅಧ್ಯಾಯ ನಾವಿಗೇಷನ್:**
- **📚 ಕೋರ್ಸ್ ಮುಖ್ಯಪುಟ**: [AZD For Beginners](../../README.md)
- **📖 ವರ್ತಮಾನ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 7 - ತೊಂದರೆನಿರ್ವಹಣೆ ಮತ್ತು ಡೀಬಗಿಂಗ್
- **⬅️ ಹಿಂದಿನದು**: [Debugging Guide](debugging.md)
- **➡️ ಮುಂದಿನ ಅಧ್ಯಾಯ**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 ಸಂಬಂಧಿಸಿದದು**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**ಹಿಂದಿನದು:** [Production AI Practices](../chapter-08-production/production-ai-practices.md) | **ಮುಂದಿನದು:** [AZD Basics](../chapter-01-foundation/azd-basics.md)

ಈ ವ್ಯಾಪಕ ತೊಂದರೆ ಪರಿಹಾರ ಮಾರ್ಗದರ್ಶಿ AZD ಬಳಸಿ AI ಪರಿಹಾರಗಳನ್ನು ಅನ್ವಯಿಸುವಾಗ ಸಾಮಾನ್ಯವಾದ ಸಮಸ್ಯೆಗಳನ್ನು ಮತ್ತು Azure AI ಸೇವೆಗಳಿಗೆ ವಿಶೇಷವಾದ ಪರಿಹಾರಗಳು ಮತ್ತು ಡೀಬಗಿಂಗ್ ತಂತ್ರಗಳನ್ನು ನೀಡುತ್ತದೆ.

## ವಿಷಯಸೂಚಿ

- [Azure OpenAI Service Issues](../../../../docs/chapter-07-troubleshooting)
- [Azure AI Search Problems](../../../../docs/chapter-07-troubleshooting)
- [Container Apps Deployment Issues](../../../../docs/chapter-07-troubleshooting)
- [Authentication and Permission Errors](../../../../docs/chapter-07-troubleshooting)
- [Model Deployment Failures](../../../../docs/chapter-07-troubleshooting)
- [Performance and Scaling Issues](../../../../docs/chapter-07-troubleshooting)
- [Cost and Quota Management](../../../../docs/chapter-07-troubleshooting)
- [Debugging Tools and Techniques](../../../../docs/chapter-07-troubleshooting)

## Azure OpenAI Service Issues

### Issue: OpenAI Service Unavailable in Region

**ಲಕ್ಷಣಗಳು:**
```
Error: The requested resource type is not available in the location 'westus'
```

**ಕಾರಣಗಳು:**
- ಆಯ್ಕೆಮಾಡಿರುವ ಪ್ರಾಂತ್ಯದಲ್ಲಿ Azure OpenAI ಲಭ್ಯವಿಲ್ಲ
- ಆಯ್ಕೆಮಾಡಿದ ಪ್ರಾಂತ್ಯಗಳಲ್ಲಿ ಕೋಟಾ ಮುಗಿದಿದೆ
- ಪ್ರಾಂತ್ಯ ಮಟ್ಟದ ಸಾಮರ್ಥ್ಯ ನಿರ್ಬಂಧಗಳು

**ಪರಿಹಾರಗಳು:**

1. **ಪ್ರಾಂತ್ಯ ಲಭ್ಯತೆಯನ್ನು ಪರಿಶೀಲಿಸಿ:**
```bash
# OpenAIಗಾಗಿ ಲಭ್ಯವಿರುವ ಪ್ರದೇಶಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **AZD ಕಂಡಿಫಿಗರೇಶನ್ ನವೀಕರಿಸಿ:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **ವೈಕಲ್ಪಿಕ ಪ್ರಾಂತ್ಯಗಳನ್ನು ಬಳಸಿ:**
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

**ಲಕ್ಷಣಗಳು:**
```
Error: Deployment failed due to insufficient quota
```

**ಪರಿಹಾರಗಳು:**

1. **ಪ್ರಸ್ತುತ ಕೋಟಾವನ್ನು ಪರಿಶೀಲಿಸಿ:**
```bash
# ಕ್ವೋಟಾ ಬಳಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **ಕೋಟಾ ಹೆಚ್ಚಿಸುವಂತೆ ವಿನಂತಿ ಮಾಡಿ:**
```bash
# ಕ್ವೋಟಾ ಹೆಚ್ಚಿಸಲು ವಿನಂತಿಯನ್ನು ಸಲ್ಲಿಸಿ
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **ಮಾದರಿಯ ಸಾಮರ್ಥ್ಯವನ್ನು ಆಪ್ಟಿಮೈಸ್ ಮಾಡಿ:**
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

### Issue: Invalid API Version

**ಲಕ್ಷಣಗಳು:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**ಪರಿಹಾರಗಳು:**

1. **ಬೆಂಬಲಿಸಲ್ಪಟ್ಟ API ಆವೃತ್ತಿಯನ್ನು ಬಳಸಿ:**
```python
# ಇತ್ತೀಚಿನ ಬೆಂಬಲಿತ ಆವೃತ್ತಿಯನ್ನು ಬಳಸಿ
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API ಆವೃತ್ತಿ ಹೊಂದಾಣಿಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ:**
```bash
# ಬೆಂಬಲಿತ API ಆವೃತ್ತಿಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search Problems

### Issue: Search Service Pricing Tier Insufficient

**ಲಕ್ಷಣಗಳು:**
```
Error: Semantic search requires Basic tier or higher
```

**ಪರಿಹಾರಗಳು:**

1. **ಪ್ರೈಸಿಂಗ್ ಟಿಯರ್ ಅಪ್‌ಗ್ರೇಡ್ ಮಾಡಿ:**
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

2. **ಸಾಮಾನ್ಯಕ್ಷಮ ಶೋಧನೆಯನ್ನು (Semantic Search) ನಿರ್ವಹಣಾ/ವಿಕಾಸದ ವೇಳೆ ಅಚೇತನಗೊಳಿಸಿ:**
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

**ಲಕ್ಷಣಗಳು:**
```
Error: Cannot create index, insufficient permissions
```

**ಪರಿಹಾರಗಳು:**

1. **ಶೋಧನೆ ಸೇವೆ ಕೀಗಳನ್ನು ಪರಿಶೀಲಿಸಿ:**
```bash
# ಸರ್ಚ್ ಸೇವೆಯ ಆಡಳಿತ ಕೀ ಪಡೆಯಿರಿ
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **ಸೂಚ್ಯಾವಳಿ (Index) ಯೋಜನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ:**
```python
# ಇಂಡೆಕ್ಸ್ ಸ್ಕೀಮಾವನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ
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

3. **Managed Identity ಬಳಸಿ:**
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

**ಲಕ್ಷಣಗಳು:**
```
Error: Failed to build container image
```

**ಪರಿಹಾರಗಳು:**

1. **Dockerfile ಸಿಂಟ್ಯಾಕ್ಸನ್ನು ಪರಿಶೀಲಿಸಿ:**
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

2. **ನಿರ್ಭರತೆಗಳನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ:**
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

3. **ಹೆಲ್ತ್ ಚೆಕ್ ಸೇರಿಸಿ:**
```python
# main.py - ಆರೋಗ್ಯ ಪರಿಶೀಲನೆ ಎಂಡ್‌ಪುಯಿಂಟ್ ಸೇರಿಸಿ
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Issue: Container App Startup Failures

**ಲಕ್ಷಣಗಳು:**
```
Error: Container failed to start within timeout period
```

**ಪರಿಹಾರಗಳು:**

1. **ಸ್ಟಾರ್ಟಪ್ ಟೈಮೌಟ್ ಹೆಚ್ಚಿಸಿ:**
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

2. **ಮಾದರಿ ಲೋಡಿಂಗ್ ಅನ್ನು ಆಪ್ಟಿಮೈಸ್ ಮಾಡಿ:**
```python
# ಪ್ರಾರಂಭ ಸಮಯವನ್ನು ಕಡಿಮೆ ಮಾಡಲು ಆವಶ್ಯಕತೆಯಾದಾಗ ಮಾತ್ರ ಮಾದರಿಗಳನ್ನು ತಡವಾಗಿ ಲೋಡ್ ಮಾಡಿ
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
        # ಇಲ್ಲಿ AI ಕ್ಲೈಂಟ್ ಅನ್ನು ಪ್ರಾರಂಭಿಸಿ
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # ಪ್ರಾರಂಭ
    app.state.model_manager = ModelManager()
    yield
    # ನಿಲ್ಲಿಸುವಿಕೆ
    pass

app = FastAPI(lifespan=lifespan)
```

## Authentication and Permission Errors

### Issue: Managed Identity Permission Denied

**ಲಕ್ಷಣಗಳು:**
```
Error: Authentication failed for Azure OpenAI Service
```

**ಪರಿಹಾರಗಳು:**

1. **ರೋಲ್ ನಿಯೋಜನೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ:**
```bash
# ಪ್ರಸ್ತುತ ಪಾತ್ರ ನಿಯೋಜನೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **ಅವಶ್ಯಕ ರೋಲ್ಗಳನ್ನು ನಿಯೋಜಿಸಿ:**
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

3. **ಪ್ರಾಮಾಣೀಕರಣವನ್ನು ಪರೀಕ್ಷಿಸಿ:**
```python
# ನಿರ್ವಹಿತ ಐಡೆಂಟಿಟಿಯ ಪ್ರಮಾಣೀಕರಣವನ್ನು ಪರೀಕ್ಷಿಸಿ
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

**ಲಕ್ಷಣಗಳು:**
```
Error: The user, group or application does not have secrets get permission
```

**ಪರಿಹಾರಗಳು:**

1. **Key Vault ಅನುಮತಿಗಳನ್ನು ನೀಡಿ:**
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

2. **Access Policies ಬದಲಾಗಿ RBAC ಬಳಸಿ:**
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

**ಲಕ್ಷಣಗಳು:**
```
Error: Model version 'gpt-4-32k' is not available
```

**ಪರಿಹಾರಗಳು:**

1. **ಲಭ್ಯವಿರುವ ಮಾದರಿಗಳನ್ನು ಪರಿಶೀಲಿಸಿ:**
```bash
# ಲಭ್ಯವಿರುವ ಮಾದರಿಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **ಮಾದರಿ ಫಾಲ್ಬ್ಯಾಕ್‌ಗಳನ್ನು ಬಳಸಿ:**
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

3. **ದಾಖಲೆಗಳು ಮೊದಲು ಮಾನ್ಯಗೊಳಿಸಿ (Deploy ಮುಂಚೆ):**
```python
# ತೈನಾತಿಗೆ ಮುನ್ನಿನ ಮಾದರಿಯ ಪರಿಶೀಲನೆ
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

**ಲಕ್ಷಣಗಳು:**
- ಪ್ರತಿಕ್ರಿಯೆ ಸಮಯಗಳು > 30 ಸೆಕೆಂಡುಗಳು
- ಟೈಮೌಟ್ ದೋಷಗಳು
- ಬಳಕೆದಾರ ಅನುಭವ ದುರ್ದಶೆ

**ಪರಿಹಾರಗಳು:**

1. **ರಿಕ್ವೆಸ್ಟ್ ಟೈಮೌಟ್‌ಗಳನ್ನು అమಲಿನಲ್ಲಿ consecu:**
```python
# ಸೂಕ್ತ ಸಮಯ ಮಿತಿಗಳನ್ನು ಸಂರಚಿಸಿ
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

2. **ಪ್ರತಿಕ್ರಿಯೆ ಕ್ಯಾಶೆ ಸೇರಿಸಿ:**
```python
# ಪ್ರತ್ಯುತ್ತರಗಳಿಗಾಗಿ Redis ಕ್ಯಾಶ್
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

3. **ಆಗೋ-ಸ್ಕೇಲಿಂಗ್ ಸಂರಚಿಸಿ:**
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

**ಲಕ್ಷಣಗಳು:**
```
Error: Container killed due to memory limit exceeded
```

**ಪರಿಹಾರಗಳು:**

1. **ಮೆಮರಿ ನಿಯೋಜನೆಯನ್ನು ಹೆಚ್ಚಿಸಿ:**
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

2. **ಮೆಮರಿ ಬಳಕೆಯನ್ನು ಆಪ್ಟಿಮೈಸ್ ಮಾಡಿ:**
```python
# ಸ್ಮೃತಿ-ಕಾರ್ಯಕ್ಷಮ ಮಾದರಿ ನಿರ್ವಹಣೆ
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # ಪ್ರಕ್ರಿಯೆ ಆರಂಭಿಸುವ ಮೊದಲು ಸ್ಮೃತಿ ಬಳಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # ಗಾರ್ಬೇಜ್ ಕಲೆಕ್ಷನ್ ಅನ್ನು ಬಲವಂತವಾಗಿ ನಡೆಸಿ
            
        result = await self._process_ai_request(request)
        
        # ಪ್ರಕ್ರಿಯೆಯ ನಂತರ ಸ್ವಚ್ಛಗೊಳಿಸಿ
        gc.collect()
        return result
```

## Cost and Quota Management

### Issue: Unexpected High Costs

**ಲಕ್ಷಣಗಳು:**
- ನಿರೀಕ್ಷೆಯಿಗಿಂತ Azure ಬಿಲ್ ಹೆಚ್ಚಾಗಿದೆ
- ಟೋಕನ್ ಬಳಕೆ ಅಂದಾಜುಗಳನ್ನು ಮೀರಿದೆ
- ಬಜೆಟ್ ಎಚ್ಚರಿಕೆಗಳು ಪ್ರಭಾವಿತವಾಗಿವೆ

**ಪರಿಹಾರಗಳು:**

1. **ಖರ್ಚಿನ ನಿಯಂತ್ರಣಗಳನ್ನು ಜಾರಿ ಮಾಡಿ:**
```python
# ಟೋಕನ್ ಬಳಕೆಯ ಮೇಲ್ವಿಚಾರಣೆ
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

2. **ಖರ್ಚಿನ ಎಚ್ಚರಿಕೆಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ:**
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

3. **ಮಾದರಿ ಆಯ್ಕೆ ಆಪ್ಟಿಮೈಸ್ ಮಾಡಿ:**
```python
# ಖರ್ಚು ಅರಿತ ಮಾದರಿ ಆಯ್ಕೆ
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # ಪ್ರತಿ 1K ಟೋಕನ್‌ಗೆ
    'gpt-4': 0.03,          # ಪ್ರತಿ 1K ಟೋಕನ್‌ಗೆ
    'gpt-35-turbo': 0.0015  # ಪ್ರತಿ 1K ಟೋಕನ್‌ಗೆ
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
# ವಿಸ್ತೃತ ಲಾಗಿಂಗ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
azd up --debug

# ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd show

# ಅಪ್‌ಲಿಕೇಶನ್ ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ (ನಿರೀಕ್ಷಣಾ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ ತೆರೆಯುತ್ತದೆ)
azd monitor --logs

# ಲೈವ್ ಮೆಟ್ರಿಕ್ಸ್ ವೀಕ್ಷಿಸಿ
azd monitor --live

# ಪರಿಸರ ಚರಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
azd env get-values
```

### Application Debugging

1. **ಸಂರಚಿತ ಲಾಗಿಂಗ್:**
```python
import logging
import json

# ಕೃತಕ ಬುದ್ಧಿಮತ್ತೆ ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗಾಗಿ ಸಂರಚಿತ ಲಾಗಿಂಗ್ ಅನ್ನು ಸಂರಚಿಸಿ
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

2. **ಹೆಲ್ತ್ ಚेक್ ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳು:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # OpenAI ಸಂಪರ್ಕವನ್ನು ಪರಿಶೀಲಿಸಿ
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # ಶೋಧನಾ ಸೇವೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
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

3. **ಕಾರ್ಯಕ್ಷಮತಾ ಮಾನಿಟರಿಂಗ್:**
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
| 401 | ಅನಧಿಕೃತ | API ಕೀಸ್ ಮತ್ತು Managed Identity ಸ್ಟ್ಯೂಪ್‌ರೇಷನ್ ಪರಿಶೀಲಿಸಿ |
| 403 | ನಿರ್ಬಂಧಿತ | RBAC ರೋಲ್ ನಿಯೋಜನೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ |
| 429 | ದರ ನಿಯಂತ್ರಿತ (Rate Limited) | ಹೆಚ್ಚಾದ ಬ್ಯಾಕ್ಫಾಸ್ ಹೊಂದಿದ ರಿಟ್ರೈ ಲಾಜಿಕ್ ಜಾರಿಗೆ ಹೇಳಿ |
| 500 | اندرونی ಸರ್ವರ್ ದೋಷ | ಮಾದರಿ ಡಿಪ್ಲಾಯ್ ಸ್ಥಿತಿ ಮತ್ತು ಲಾಗ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ |
| 503 | ಸರ್ವಿಸ್ ಲಭ್ಯವಿಲ್ಲ | ಸೇವೆಯ ಆರೋಗ್ಯ ಮತ್ತು ಪ್ರಾಂತ್ವ ಲಭ್ಯತೆಯನ್ನು ಪರಿಶೀಲಿಸಿ |

## Next Steps

1. **[AI Model Deployment Guide](../chapter-02-ai-development/ai-model-deployment.md)** ಅನ್ನು ಡಿಪ್ಲಾಯ್ ಮಾಡಿಕೊಳ್ಳುವ ಅತ್ಯುತ್ತಮ ಪದ್ಧತಿಗಳಿಗಾಗಿ ಪರಿಶೀಲಿಸಿ
2. **[Production AI Practices](../chapter-08-production/production-ai-practices.md)** ಅನ್ನು ಎಂಟರಪ್ರೈಸ್ಗಾಗಿ ಸಿದ್ಧಪಡಿಸಲು ಪೂರ್ಣಗೊಳಿಸಿ
3. **ಸಮುದಾಯ ಬೆಂಬಲಕ್ಕಾಗಿ [Microsoft Foundry Discord](https://aka.ms/foundry/discord) ಸೇರಿ**
4. AZD-ನಿರ್ದಿಷ್ಟ ಸಮಸ್ಯೆಗಳಿಗಾಗಿ [AZD GitHub repository](https://github.com/Azure/azure-dev) ಗೆ issues ಸಲ್ಲಿಸಿ

## Resources

- [Azure OpenAI Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**ಅಧ್ಯಾಯ ನಾವಿಗೇಷನ್:**
- **📚 ಕೋರ್ಸ್ ಮುಖ್ಯಪುಟ**: [AZD For Beginners](../../README.md)
- **📖 ವರ್ತಮಾನ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 7 - ತೊಂದರೆನಿರ್ವಹಣೆ ಮತ್ತು ಡೀಬಗಿಂಗ್
- **⬅️ ಹಿಂದಿನದು**: [Debugging Guide](debugging.md)
- **➡️ ಮುಂದಿನ ಅಧ್ಯಾಯ**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 ಸಂಬಂಧಿಸಿದದು**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- [Azure Developer CLI Troubleshooting](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ಅಸ್ವೀಕರಣ:
ಈ ದಾಖಲೆವನ್ನು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಗೆ ಪ್ರಯತ್ನಿಸಿದರೂ, ದಯವಿಟ್ಟು ಗಮನದಲ್ಲಿಡಿ — ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ತಪ್ಪುಗಳು ಅಥವಾ ಅಶುದ್ಧತೆಗಳಿರಬಹುದೆಂದು ಸೂಚಿಸಲಾಗುತ್ತದೆ. ಮೂಲಭಾಷೆಯಲ್ಲಿನ ಮೂಲ ದಾಖಲೆವನ್ನು ಅಧಿಕೃತ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕಾಗಿದೆ. ಗಂಭೀರ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವುದರಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪುಗ್ರಹಿಕೆಗಳು ಅಥವಾ ದೋಷಪೂರ್ಣ ವ್ಯಾಖ್ಯಾನಗಳಿಗೆ ನಾವು ಜವಾಬ್ದಾರಿಯಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->