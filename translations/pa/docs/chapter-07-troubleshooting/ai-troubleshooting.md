# ਏআই-ਖਾਸ Troubleshooting Guide

**ਅਧਿਆਇ ਦਿਸ਼ਾ-ਨਿਰਦੇਸ਼:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD For Beginners](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 7 - Troubleshooting & Debugging
- **⬅️ ਪਿਛਲਾ**: [Debugging Guide](debugging.md)
- **➡️ ਅਗਲਾ ਅਧਿਆਇ**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 ਸੰਬੰਧਤ**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

ਇਹ ਵਿਸਤ੍ਰਿਤ ਟਰਬਲਸ਼ੂਟਿੰਗ ਗਾਈਡ AZD ਨਾਲ AI ਹੱਲਾਂ ਨੂੰ ਡਿਪਲੋਇ ਕਰਨ ਵੇਲੇ ਆਮ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਅਤੇ Azure AI ਸੇਵਾਵਾਂ ਨੂੰ ਵਿਸ਼ੇਸ਼ ਤੌਰ 'ਤੇ ਹੱਲ ਕਰਨ ਅਤੇ ਡਿਬੱਗ ਕਰਨ ਦੀਆਂ ਤਕਨੀਕਾਂ ਦਿੰਦੀ ਹੈ।

## ਸਮੱਗਰੀ ਸੂਚੀ

- [Microsoft Foundry Models Service Issues](#azure-openai-service-issues)
- [Azure AI Search Problems](#azure-ai-search-problems)
- [Container Apps Deployment Issues](#container-apps-deployment-issues)
- [Authentication and Permission Errors](#authentication-and-permission-errors)
- [Model Deployment Failures](#model-deployment-failures)
- [Performance and Scaling Issues](#performance-and-scaling-issues)
- [Cost and Quota Management](#cost-and-quota-management)
- [Debugging Tools and Techniques](#debugging-tools-and-techniques)

## Microsoft Foundry Models Service Issues

### ਸਮੱਸਿਆ: OpenAI Service ਰੀਜਨ ਵਿੱਚ ਉਪਲਬਧ ਨਹੀਂ

**ਲੱਛਣ:**
```
Error: The requested resource type is not available in the location 'westus'
```

**ਕਾਰਨ:**
- Microsoft Foundry Models ਚੁਣੀ ਹੋਈ ਰੀਜਨ ਵਿੱਚ ਉਪਲਬਧ ਨਹੀਂ
- ਪਸੰਦੀਦਾ ਰੀਜਨਾਂ ਵਿੱਚ ਕੋਟਾ ਖਤਮ ਹੋ ਗਿਆ
- ਖੇਤਰੀ ਸਮਰੱਥਾ ਦੀਆਂ ਪਾਬੰਦੀਆਂ

**ਹੱਲ:**

1. **ਰੀਜਨ ਉਪਲਬਧਤਾ ਜਾਂਚੋ:**
```bash
# OpenAI ਲਈ ਉਪਲਬਧ ਖੇਤਰਾਂ ਦੀ ਸੂਚੀ
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **AZD ਵਿਨ్యਾਸ ਅਪਡੇਟ ਕਰੋ:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **ਵਿਕਲਪਿਕ ਰੀਜਨਾਂ ਦੀ ਵਰਤੋਂ ਕਰੋ:**
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

### ਸਮੱਸਿਆ: ਮਾਡਲ ਡਿਪਲੋਇਮੈਂਟ ਕੋਟਾ ਪਾਰ ਹੋ ਗਿਆ

**ਲੱਛਣ:**
```
Error: Deployment failed due to insufficient quota
```

**ਹੱਲ:**

1. **ਮੌਜੂਦਾ ਕੋਟਾ ਜਾਂਚੋ:**
```bash
# ਕੋਟਾ ਦੀ ਵਰਤੋਂ ਦੀ ਜਾਂਚ ਕਰੋ
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **ਕੋਟਾ ਵਾਧੇ ਦੀ ਮੰਗ ਕਰੋ:**
```bash
# ਕੋਟਾ ਵਾਧੇ ਲਈ ਬੇਨਤੀ ਦਾਖ਼ਲ ਕਰੋ
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **ਮਾਡਲ ਸਮਰੱਥਾ ਨੂੰ ਢੰਗ ਨਾਲ ਵਰਤੋਂ ਕਰੋ:**
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

### ਸਮੱਸਿਆ: ਗਲਤ API ਵਰਜ਼ਨ

**ਲੱਛਣ:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**ਹੱਲ:**

1. **ਸਮਰਥਿਤ API ਵਰਜ਼ਨ ਦੀ ਵਰਤੋਂ ਕਰੋ:**
```python
# ਸਭ ਤੋਂ ਨਵਾਂ ਸਮਰਥਿਤ ਵਰਜਨ ਵਰਤੋ
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API ਵਰਜ਼ਨ ਅਨੁਕੂਲਤਾ ਦੀ ਜਾਂਚ ਕਰੋ:**
```bash
# ਸਮਰਥਿਤ API ਵਰਜ਼ਨਾਂ ਦੀ ਸੂਚੀ
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search Problems

### ਸਮੱਸਿਆ: Search Service ਦੀ ਪ੍ਰਾਈਸਿੰਗ ਟੀਅਰ ਅਪਰ्यਾਪਤ

**ਲੱਛਣ:**
```
Error: Semantic search requires Basic tier or higher
```

**ਹੱਲ:**

1. **ਪ੍ਰਾਈਸਿੰਗ ਟੀਅਰ ਅਪਗਰੇਡ ਕਰੋ:**
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

2. **Semantic Search ਨੂੰ ਵਿਕਾਸ ਦੌਰਾਨ ਬੰਦ ਕਰੋ:**
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

### ਸਮੱਸਿਆ: ਇੰਡੈਕਸ ਬਣਾਉਣ ਵਿੱਚ ਨਾਕਾਮੀ

**ਲੱਛਣ:**
```
Error: Cannot create index, insufficient permissions
```

**ਹੱਲ:**

1. **Search Service ਕੀਜ਼ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ:**
```bash
# ਖੋਜ ਸੇਵਾ ਦੀ ਪ੍ਰਸ਼ਾਸਕੀ ਕੁੰਜੀ ਪ੍ਰਾਪਤ ਕਰੋ
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **ਇੰਡੈਕਸ ਸਕੀਮਾ ਜਾਂਚੋ:**
```python
# ਇੰਡੈਕਸ ਸਕੀਮਾ ਦੀ ਜਾਂਚ ਕਰੋ
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

3. **Managed Identity ਦੀ ਵਰਤੋਂ ਕਰੋ:**
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

### ਸਮੱਸਿਆ: ਕੰਟੇਨਰ ਬਿਲਡ ਫੇਲ੍ਹ ਹੋਣਾ

**ਲੱਛਣ:**
```
Error: Failed to build container image
```

**ਹੱਲ:**

1. **Dockerfile ਸਿੰਟੈਕਸ ਜਾਂਚੋ:**
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

2. **ਡਿਪੈਂਡੇੰਸੀਜ਼ ਦੀ ਵੇਰੀਫਿਕੇਸ਼ਨ ਕਰੋ:**
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

3. **ਹੈਲਥ ਚੈਕ ਸ਼ਾਮِل ਕਰੋ:**
```python
# main.py - ਸਿਹਤ ਜਾਂਚ ਐਂਡਪਾਇੰਟ ਜੋੜੋ
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### ਸਮੱਸਿਆ: ਕੰਟੇਨਰ ਐਪ ਸਟਾਰਟਅਪ ਫੇਲ੍ਹ ਹੋਣਾ

**ਲੱਛਣ:**
```
Error: Container failed to start within timeout period
```

**ਹੱਲ:**

1. **ਸਟਾਰਟਅਪ ਟਾਈਮਆਉਟ ਵਧਾਓ:**
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

2. **ਮਾਡਲ ਲੋਡਿੰਗ ਨੂੰ ਅਪਟਿਮਾਈਜ਼ ਕਰੋ:**
```python
# ਸ਼ੁਰੂਆਤੀ ਸਮਾਂ ਘਟਾਉਣ ਲਈ ਮਾਡਲਾਂ ਨੂੰ ਲੇਜ਼ੀ ਲੋਡ ਕਰੋ
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
        # ਇੱਥੇ AI ਕਲਾਇੰਟ ਨੂੰ ਸ਼ੁਰੂ ਕਰੋ
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # ਸ਼ੁਰੂਆਤ
    app.state.model_manager = ModelManager()
    yield
    # ਬੰਦ
    pass

app = FastAPI(lifespan=lifespan)
```

## Authentication and Permission Errors

### ਸਮੱਸਿਆ: Managed Identity ਪੁਰਮਿਸ਼ਨ ਡਿਨਾਇਡ

**ਲੱਛਣ:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**ਹੱਲ:**

1. **ਰੋਲ ਅਸਾਇਨਮੈਂਟ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ:**
```bash
# ਮੌਜੂਦਾ ਭੂਮਿਕਾ ਸੌਂਪਣਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **ਜ਼ਰੂਰੀ ਰੋਲ ਅਸਾਇਨ ਕਰੋ:**
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

3. **Authentication ਟੈਸਟ ਕਰੋ:**
```python
# ਮੈਨੇਜਡ ਆਈਡੈਂਟਿਟੀ ਦੀ ਪ੍ਰਮਾਣਿਕਤਾ ਦੀ ਜਾਂਚ ਕਰੋ
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

### ਸਮੱਸਿਆ: Key Vault ਐਕਸੈਸ ਡਿਨਾਇਡ

**ਲੱਛਣ:**
```
Error: The user, group or application does not have secrets get permission
```

**ਹੱਲ:**

1. **Key Vault ਪਰਮਿਸ਼ਨ ਦਿਓ:**
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

2. **Access Policies ਦੀ ਥਾਂ RBAC ਦੀ ਵਰਤੋਂ ਕਰੋ:**
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

### ਸਮੱਸਿਆ: ਮਾਡਲ ਵਰਜ਼ਨ ਉਪਲਬਧ ਨਹੀਂ

**ਲੱਛਣ:**
```
Error: Model version 'gpt-4-32k' is not available
```

**ਹੱਲ:**

1. **ਉਪਲਬਧ ਮਾਡਲਾਂ ਦੀ ਜਾਂچ ਕਰੋ:**
```bash
# ਉਪਲਬਧ ਮਾਡਲਾਂ ਦੀ ਸੂਚੀ
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **ਮਾਡਲ ਫਾਲਬੈਕ ਦੀ ਵਰਤੋਂ ਕਰੋ:**
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

3. **ਡਿਪਲੋਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਮਾਡਲ ਦਾ ਵੈਰੀਫਿਕੇਸ਼ਨ ਕਰੋ:**
```python
# ਤੈਨਾਤ ਤੋਂ ਪਹਿਲਾਂ ਮਾਡਲ ਦੀ ਜਾਂਚ
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

### ਸਮੱਸਿਆ: ਉੱਚ ਲੇਟੈਂਸੀ ਰਿਸਪਾਂਸ

**ਲੱਛਣ:**
- ਰਿਸਪਾਂਸ ਸਮਾਂ > 30 ਸਕਿੰਟ
- ਟਾਈਮਆਉਟ ਤਰੁੱਟੀਆਂ
- ਗ਼ਲਤ ਉਪਭੋਗਤਾ ਅਨੁਭਵ

**ਹੱਲ:**

1. **ਰਿਕਵੇਸਟ ਟਾਈਮਆਉਟ ਲਗਾਓ:**
```python
# ਉਚਿਤ ਸਮਾਂ-ਸੀਮਾਵਾਂ ਸੰਰਚਿਤ ਕਰੋ
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

2. **ਰਿਸਪਾਂਸ ਕੈਸ਼ਿੰਗ ਸ਼ਾਮِل ਕਰੋ:**
```python
# ਜਵਾਬਾਂ ਲਈ Redis ਕੈਸ਼
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

3. **ਆਟੋ-ਸਕੇਲਿੰਗ ਕੰਫਿਗਰ ਕਰੋ:**
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

### ਸਮੱਸਿਆ: ਮੈਮੋਰੀ ਆਉਟ ਆਫ ਐਰਰਜ਼

**ਲੱਛਣ:**
```
Error: Container killed due to memory limit exceeded
```

**ਹੱਲ:**

1. **ਮੈਮੋਰੀ ਮੰਗ ਵਧਾਓ:**
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

2. **ਮੈਮੋਰੀ ਵਰਤੋਂ ਨੂੰ ਅਪਟਿਮਾਈਜ਼ ਕਰੋ:**
```python
# ਮੈਮੋਰੀ-ਕੁਸ਼ਲ ਮਾਡਲ ਸੰਭਾਲ
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # ਪ੍ਰੋਸੈਸਿੰਗ ਤੋਂ ਪਹਿਲਾਂ ਮੈਮੋਰੀ ਵਰਤੋਂ ਦੀ ਜਾਂਚ ਕਰੋ
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # ਗਾਰਬੇਜ ਕਲੈਕਸ਼ਨ ਨੂੰ ਜ਼ਬਰਦਸਤੀ ਚਲਾਓ
            
        result = await self._process_ai_request(request)
        
        # ਪ੍ਰੋਸੈਸਿੰਗ ਤੋਂ ਬਾਅਦ ਸਾਫ਼-ਸਫਾਈ ਕਰੋ
        gc.collect()
        return result
```

## Cost and Quota Management

### ਸਮੱਸਿਆ: ਅਣਉਮੀਦਤ ਤੌਰ 'ਤੇ ਉੱਚ ਖਰਚੇ

**ਲੱਛਣ:**
- Azure ਦਾ ਬਿੱਲ ਉਮੀਦ ਤੋਂ ਵੱਧ
- ਟੋਕਨ ਵਰਤੋਂ ਅੰਦਾਜ਼ਿਆਂ ਤੋਂ ਵੱਧ
- ਬਜਟ ਅਲਰਟ ਟ੍ਰਿਗਰ ਹੋਏ

**ਹੱਲ:**

1. **ਖਰਚ ਨਿਯੰਤ੍ਰਣ ਲਗਾਓ:**
```python
# ਟੋਕਨ ਦੀ ਵਰਤੋਂ ਦੀ ਨਿਗਰਾਨੀ
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

2. **ਖਰਚ ਅਲਰਟ ਸੈੱਟ ਕਰੋ:**
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

3. **ਮਾਡਲ ਚੋਣ ਨੂੰ ਅਪਟਿਮਾਈਜ਼ ਕਰੋ:**
```python
# ਲਾਗਤ-ਸਚੇਤ ਮਾਡਲ ਚੋਣ
MODEL_COSTS = {
    'gpt-4.1-mini': 0.00015,  # ਹਰ 1K ਟੋਕਨ ਲਈ
    'gpt-4.1': 0.03,          # ਹਰ 1K ਟੋਕਨ ਲਈ
    'gpt-35-turbo': 0.0015  # ਹਰ 1K ਟੋਕਨ ਲਈ
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

### AZD ਡਿਬੱਗਿੰਗ ਕਮਾਂਡਜ਼

```bash
# ਵਿਸਤ੍ਰਿਤ ਲੌਗਿੰਗ ਚਾਲੂ ਕਰੋ
azd up --debug

# ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਸਥਿਤੀ ਜਾਂਚੋ
azd show

# ਐਪਲੀਕੇਸ਼ਨ ਦੇ ਲੌਗ ਵੇਖੋ (ਮੋਨੀਟਰਿੰਗ ਡੈਸ਼ਬੋਰਡ ਖੁਲਦਾ ਹੈ)
azd monitor --logs

# ਲਾਈਵ ਮੈਟ੍ਰਿਕਸ ਵੇਖੋ
azd monitor --live

# ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
azd env get-values
```

### AZD AI ਐਕਸਟੇੰਸ਼ਨ ਕਮਾਂਡਜ਼ ਡਾਇਗਨੋਸਟਿਕਸ ਲਈ

ਜੇ ਤੁਸੀਂ `azd ai agent init` ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਏਜੰਟ ਡਿਪਲੋਇ ਕੀਤੇ ਹਨ, ਤਾਂ ਇਹ ਹੋਰ ਟੂਲ ਉਪਲਬਧ ਹਨ:

```bash
# ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਏਜੰਟਸ ਐਕਸਟੈਂਸ਼ਨ ਇੰਸਟਾਲ ਹੋਈ ਹੈ
azd extension install azure.ai.agents

# ਮੈਨੀਫੈਸਟ ਤੋਂ ਏਜੰਟ ਨੂੰ ਮੁੜ-ਆਰੰਭ ਕਰੋ ਜਾਂ ਅਪਡੇਟ ਕਰੋ
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# MCP ਸਰਵਰ ਦੀ ਵਰਤੋਂ ਕਰੋ ਤਾਂ ਜੋ AI ਟੂਲ ਪ੍ਰੋਜੈਕਟ ਦੀ ਸਥਿਤੀ ਪੁੱਛ ਸਕਣ
azd mcp start

# ਸਮੀਖਿਆ ਅਤੇ ਆਡਿਟ ਲਈ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਫਾਇਲਾਂ ਤਿਆਰ ਕਰੋ
azd infra generate
```

> **ਟਿੱਪ:** Use `azd infra generate` to write IaC to disk so you can inspect exactly what resources were provisioned. ਇਹ ਰਿਸੋਰਸ ਕੰਫਿਗਰੇਸ਼ਨ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਡਿਬੱਗ ਕਰਨ ਵੇਲੇ ਬੇਹੱਦ ਮੁੱਲਵਾਨ ਹੈ। ਪੂਰੀ ਜਾਣਕਾਰੀ ਲਈ ਵੇਖੋ [AZD AI CLI reference](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)।

### ਐਪਲੀਕੇਸ਼ਨ ਡਿਬੱਗਿੰਗ

1. **ਸੰਰਚਿਤ ਲੌਗਿੰਗ:**
```python
import logging
import json

# ਐਆਈ ਐਪਲੀਕੇਸ਼ਨਾਂ ਲਈ ਸੰਰਚਿਤ ਲੌਗਿੰਗ ਸੈੱਟ ਕਰੋ
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

2. **ਹੈਲਥ ਚੈਕ ਐਂਡਪਾਇੰਟਸ:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # OpenAI ਨਾਲ ਕਨੈਕਟਿਵਿਟੀ ਦੀ ਜਾਂਚ ਕਰੋ
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # ਖੋਜ ਸੇਵਾ ਦੀ ਜਾਂਚ ਕਰੋ
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

3. **ਪਰਫਾਰਮੈਂਸ ਮਾਨੀਟਰਿੰਗ:**
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

## ਆਮ ਐਰਰ ਕੋਡ ਅਤੇ ਹੱਲ

| Error Code | Description | Solution |
|------------|-------------|----------|
| 401 | ਅਣਅਧਿਕ੍ਰਿਤ | API ਕੀਜ਼ ਅਤੇ managed identity ਵਿਨਯਾਸ ਚੈੱਕ ਕਰੋ |
| 403 | ਮਨਾਹੀ | RBAC ਰੋਲ ਅਸਾਇਨਮੈਂਟ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ |
| 429 | ਰੇਟ ਲਿਮਿਟ | exponential backoff ਨਾਲ retry logic ਲਾਗੂ ਕਰੋ |
| 500 | ਇੰਟਰਨਲ ਸਰਵਰ ਐਰਰ | ਮਾਡਲ ਡਿਪਲੋਇਮੈਂਟ ਸਥਿਤੀ ਅਤੇ ਲੌਗ ਚੈੱਕ ਕਰੋ |
| 503 | ਸਰਵਿਸ ਉਪਲਬਧ ਨਹੀਂ | ਸਰਵਿਸ ਹੈਲਥ ਅਤੇ ਖੇਤਰੀ ਉਪਲਬਧਤਾ ਦੀ ਜਾਂਚ ਕਰੋ |

## ਅਗਲੇ ਕਦਮ

1. **[AI Model Deployment Guide](../chapter-02-ai-development/ai-model-deployment.md)** ਨੂੰ ਡਿਪਲੋਇਮੈਂਟ ਲਈ ਬਿਹਤਰ ਅਭਿਆਸਾਂ ਲਈ ਰਿਵਿਊ ਕਰੋ
2. **[Production AI Practices](../chapter-08-production/production-ai-practices.md)** ਨੂੰ ਏਨਟਰਪ੍ਰਾਈਜ਼-ਰੇਡੀ ਹੱਲਾਂ ਲਈ ਪੂਰਾ ਕਰੋ
3. **[Microsoft Foundry Discord](https://aka.ms/foundry/discord)** ਵਿੱਚ ਕਮਿਊਨਿਟੀ ਸਹਾਇਤਾ ਲਈ ਜੁੜੋ
4. **ਮੁੱਦੇ ਸਬਮਿਟ ਕਰੋ** AZD-ਖਾਸ ਸਮੱਸਿਆਵਾਂ ਲਈ [AZD GitHub repository](https://github.com/Azure/azure-dev) 'ਤੇ

## ਸਰੋਤ

- [Microsoft Foundry Models Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - ਆਪਣੇ ਐਡੀਟਰ ਵਿੱਚ Azure ਟਰਬਲਸ਼ੂਟਿੰਗ ਸਕਿਲਸ ਇੰਸਟਾਲ ਕਰੋ: `npx skills add microsoft/github-copilot-for-azure`

---

**ਅਧਿਆਇ ਦਿਸ਼ਾ-ਨਿਰਦੇਸ਼:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD For Beginners](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 7 - Troubleshooting & Debugging
- **⬅️ ਪਿਛਲਾ**: [Debugging Guide](debugging.md)
- **➡️ ਅਗਲਾ ਅਧਿਆਇ**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 ਸੰਬੰਧਤ**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 ਸੰਦਰਭ**: [Azure Developer CLI Troubleshooting](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਹਾਲਾਂਕਿ ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਤ੍ਰੁੱਟੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->