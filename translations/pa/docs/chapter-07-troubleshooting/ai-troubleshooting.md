# AI-ਖਾਸ ਟਰਬਲਸ਼ੂਟਿੰਗ ਗਾਈਡ

**ਅਧਿਆਇ ਨੇਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਸ਼ੁਰੂਆਤੀਆਂ ਲਈ](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 7 - ਸਮੱਸਿਆ ਨਿਵਾਰਣ ਅਤੇ ਡੀਬੱਗਿੰਗ
- **⬅️ ਪਿਛਲਾ**: [ਡੀਬੱਗਿੰਗ ਗਾਈਡ](debugging.md)
- **➡️ ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 8: ਪ੍ਰੋਡਕਸ਼ਨ ਅਤੇ ਐਨਟਰਪ੍ਰਾਈਜ਼ ਪੈਟਰਨ](../chapter-08-production/production-ai-practices.md)
- **🤖 ਸੰਬੰਧਿਤ**: [ਅਧਿਆਇ 2: AI-ਫਰਸਟ ਵਿਕਾਸ](../chapter-02-ai-development/microsoft-foundry-integration.md)

**ਪਿਛਲਾ:** [Production AI Practices](../chapter-08-production/production-ai-practices.md) | **ਅਗਲਾ:** [AZD ਬੁਨਿਆਦੀਆਂ](../chapter-01-foundation/azd-basics.md)

ਇਹ ਵਿਸਤ੍ਰਿਤ ਟਰਬਲਸ਼ੂਟਿੰਗ ਗਾਈਡ AZD ਨਾਲ AI ਸਮਾਧਾਨਾਂ ਨੂੰ ਡਿਪਲੋਏ ਕਰਨ ਸਮੇਂ ਆਉਣ ਵਾਲੀਆਂ ਆਮ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਨਿਪਟਾਉਂਦਾ ਹੈ, ਅਤੇ Azure AI ਸੇਵਾਵਾਂ ਨਾਲ ਸੰਬੰਧਿਤ ਖਾਸ ਹੱਲ ਅਤੇ ਡੀਬੱਗਿੰਗ ਤਕਨੀਕਾਂ ਦਿੰਦਾ ਹੈ।

## ਸਮੱਗਰੀ ਸੂਚੀ

- [Azure OpenAI ਸੇਵਾ ਸਮੱਸਿਆਵਾਂ](../../../../docs/chapter-07-troubleshooting)
- [Azure AI ਖੋਜ ਸਮੱਸਿਆਵਾਂ](../../../../docs/chapter-07-troubleshooting)
- [Container Apps ਡਿਪਲੋਏਮੈਂਟ ਸਮੱਸਿਆਵਾਂ](../../../../docs/chapter-07-troubleshooting)
- [ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਅਧਿਕਾਰ ਦੀਆਂ ਗਲਤੀਆਂ](../../../../docs/chapter-07-troubleshooting)
- [ਮਾਡਲ ਡਿਪਲੋਏਮੈਂਟ ਫੇਲਿਅਰ](../../../../docs/chapter-07-troubleshooting)
- [ਪ੍ਰਦਰਸ਼ਨ ਅਤੇ ਸਕੇਲਿੰਗ ਸਮੱਸਿਆਵਾਂ](../../../../docs/chapter-07-troubleshooting)
- [ਲਾਗਤ ਅਤੇ ਕੋਟਾ ਪ੍ਰਬੰਧਨ](../../../../docs/chapter-07-troubleshooting)
- [ਡੀਬੱਗਿੰਗ ਟੂਲ ਅਤੇ ਤਕਨੀਕਾਂ](../../../../docs/chapter-07-troubleshooting)

## Azure OpenAI ਸੇਵਾ ਸਮੱਸਿਆਵਾਂ

### ਸਮੱਸਿਆ: ਚੋਣ ਕੀਤੇ ਖੇਤਰ ਵਿੱਚ OpenAI ਸੇਵਾ ਉਪਲਬਧ ਨਹੀਂ

**ਲੱਛਣ:**
```
Error: The requested resource type is not available in the location 'westus'
```

**ਕਾਰਨ:**
- ਚੁਣੇ ਖੇਤਰ ਵਿੱਚ Azure OpenAI ਉਪਲਬਧ ਨਹੀਂ
- ਪਸੰਦੀਦਾ ਖੇਤਰਾਂ ਵਿੱਚ ਕੋਟਾ ਖਤਮ ਹੋ ਗਿਆ
- ਖੇਤਰੀ ਸਮਰੱਥਾ ਸੀਮਾਵਾਂ

**ਸਮਾਧਾਨ:**

1. **ਖੇਤਰ ਉਪਲਬਧਤਾ ਜਾਂਚੋ:**
```bash
# OpenAI ਲਈ ਉਪਲਬਧ ਖੇਤਰਾਂ ਦੀ ਸੂਚੀ
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **AZD ਸੰਰਚਨਾ ਅਪਡੇਟ ਕਰੋ:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **ਬਦਲੀਆਂ ਖੇਤਰਾਂ ਦੀ ਵਰਤੋਂ ਕਰੋ:**
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

### ਸਮੱਸਿਆ: ਮਾਡਲ ਡਿਪਲੋਏਮੈਂਟ ਕੋਟਾ ਪਾਰ ਹੋ ਗਿਆ

**ਲੱਛਣ:**
```
Error: Deployment failed due to insufficient quota
```

**ਸਮਾਧਾਨ:**

1. **ਮੌਜੂਦਾ ਕੋਟਾ ਚੈੱਕ ਕਰੋ:**
```bash
# ਕੋਟਾ ਦੀ ਵਰਤੋਂ ਚੈੱਕ ਕਰੋ
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **ਕੋਟਾ ਵੱਧਾਉਣ ਦੀ ਬੇਨਤੀ ਕਰੋ:**
```bash
# ਕੋਟਾ ਵਾਧੇ ਦੀ ਬੇਨਤੀ ਦਾਖਲ ਕਰੋ
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **ਮਾਡਲ ਸਮਰੱਥਾ ਨੂੰ ਅਪਟੀਮਾਈਜ਼ ਕਰੋ:**
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

### ਸਮੱਸਿਆ: ਅਵੈਧ API ਵਰਜ਼ਨ

**ਲੱਛਣ:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**ਸਮਾਧਾਨ:**

1. **ਸਮਰਥਿਤ API ਵਰਜ਼ਨ ਦੀ ਵਰਤੋਂ ਕਰੋ:**
```python
# ਸਭ ਤੋਂ ਨਵਾਂ ਸਮਰਥਿਤ ਵਰਜ਼ਨ ਵਰਤੋ
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API ਵਰਜ਼ਨ ਅਨੁਕੂਲਤਾ ਚੈੱਕ ਕਰੋ:**
```bash
# ਸਮਰਥਿਤ API ਵਰਜਨਾਂ ਦੀ ਸੂਚੀ
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI ਖੋਜ ਸਮੱਸਿਆਵਾਂ

### ਸਮੱਸਿਆ: ਖੋਜ ਸੇਵਾ ਦਾ ਪ੍ਰਾਇਸਿੰਗ ਟੀਅਰ ਅਪਰਯਾਪਤ ਹੈ

**ਲੱਛਣ:**
```
Error: Semantic search requires Basic tier or higher
```

**ਸਮਾਧਾਨ:**

1. **ਪ੍ਰਾਇਸਿੰਗ ਟੀਅਰ ਅਪਗ੍ਰੇਡ ਕਰੋ:**
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

2. **ਸੈਮੈਂਟਿਕ ਖੋਜ (ਡਿਵੈਲਪਮੈਂਟ) ਨੂੰ ਅਣਚਾਲੂ/ਬੰਦ ਕਰੋ:**
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

### ਸਮੱਸਿਆ: ਇੰਡੈਕਸ ਬਣਾਉਣ ਵਿੱਚ ਅਸਫਲਤਾ

**ਲੱਛਣ:**
```
Error: Cannot create index, insufficient permissions
```

**ਸਮਾਧਾਨ:**

1. **Search Service ਦੀਆਂ ਕੁੰਜੀਆਂ ਦੀ ਜਾਂਚ ਕਰੋ:**
```bash
# ਖੋਜ ਸੇਵਾ ਦੀ ਪ੍ਰਸ਼ਾਸਕੀ ਕੁੰਜੀ ਪ੍ਰਾਪਤ ਕਰੋ
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **ਇੰਡੈਕਸ ਸਕੀਮਾ ਚੈੱਕ ਕਰੋ:**
```python
# ਇੰਡੈਕਸ ਸਕੀਮਾ ਦੀ ਜਾਂچ ਕਰੋ
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

## Container Apps ਡਿਪਲੋਏਮੈਂਟ ਸਮੱਸਿਆਵਾਂ

### ਸਮੱਸਿਆ: ਕੰਟੇਨਰ ਬਿਲਡ ਫੇਲਿਅਰ

**ਲੱਛਣ:**
```
Error: Failed to build container image
```

**ਸਮਾਧਾਨ:**

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

2. **ਨਿਰਭਰਤਾਵਾਂ ਦੀ ਜਾਂਚ ਕਰੋ:**
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

3. **ਹੈਲਥ ਚੈੱਕ ਸ਼ਾਮਲ ਕਰੋ:**
```python
# main.py - ਸਿਹਤ ਜਾਂਚ ਐਂਡਪੋਇੰਟ ਜੋੜੋ
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### ਸਮੱਸਿਆ: ਕੰਟੇਨਰ ਐਪ ਸਟਾਰਟਅੱਪ ਫੇਲਿਅਰ

**ਲੱਛਣ:**
```
Error: Container failed to start within timeout period
```

**ਸਮਾਧਾਨ:**

1. **ਸਟਾਰਟਅੱਪ ਟਾਈਮਆਉਟ ਵਧਾਓ:**
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

2. **ਮਾਡਲ ਲੋਡਿੰਗ ਨੂੰ ਅਪਟੀਮਾਈਜ਼ ਕਰੋ:**
```python
# ਸ਼ੁਰੂਆਤੀ ਸਮਾਂ ਘਟਾਉਣ ਲਈ ਮਾਡਲਾਂ ਨੂੰ ਆਲਸੀ ਤਰੀਕੇ ਨਾਲ ਲੋਡ ਕਰੋ
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
        # ਇੱਥੇ AI ਕਲਾਇਂਟ ਨੂੰ ਆਰੰਭ ਕਰੋ
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # ਸ਼ੁਰੂਆਤ
    app.state.model_manager = ModelManager()
    yield
    # ਬੰਦ ਕਰਨਾ
    pass

app = FastAPI(lifespan=lifespan)
```

## ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਅਧਿਕਾਰ ਦੀਆਂ ਗਲਤੀਆਂ

### ਸਮੱਸਿਆ: Managed Identity ਅਨੁਮਤੀ ਇਨਕਾਰ

**ਲੱਛਣ:**
```
Error: Authentication failed for Azure OpenAI Service
```

**ਸਮਾਧਾਨ:**

1. **ਰੋਲ ਅਸਾਈਨਮੈਂਟਸ ਦੀ ਜਾਂਚ ਕਰੋ:**
```bash
# ਮੌਜੂਦਾ ਭੂਮਿਕਾ ਨਿਯੁਕਤੀਆਂ ਦੀ ਜਾਂਚ ਕਰੋ
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **ਲਾਜ਼ਮੀ ਰੋਲ ਅਸਾਈਨ ਕਰੋ:**
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

3. **ਪ੍ਰਮਾਣਿਕਤਾ ਦੀ ਜਾਂਚ ਕਰੋ:**
```python
# ਪ੍ਰਬੰਧਿਤ ਪਛਾਣ ਪ੍ਰਮਾਣੀਕਰਨ ਦੀ ਜਾਂਚ
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

### ਸਮੱਸਿਆ: Key Vault ਪਹੁੰਚ ਅਸਵੀਕਾਰ

**ਲੱਛਣ:**
```
Error: The user, group or application does not have secrets get permission
```

**ਸਮਾਧਾਨ:**

1. **Key Vault ਨੂੰ ਅਨੁਮਤੀਆਂ ਦਿਓ:**
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

2. **Access Policies ਦੀ ਬਜਾਏ RBAC ਦੀ ਵਰਤੋਂ ਕਰੋ:**
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

## ਮਾਡਲ ਡਿਪਲੋਏਮੈਂਟ ਫੇਲਿਅਰ

### ਸਮੱਸਿਆ: ਮਾਡਲ ਵਰਜ਼ਨ ਉਪਲਬਧ ਨਹੀਂ ਹੈ

**ਲੱਛਣ:**
```
Error: Model version 'gpt-4-32k' is not available
```

**ਸਮਾਧਾਨ:**

1. **ਉਪਲਬਧ ਮਾਡਲਾਂ ਦੀ ਜਾਂਚ ਕਰੋ:**
```bash
# ਉਪਲਬਧ ਮਾਡਲਾਂ ਦੀ ਸੂਚੀ
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **ਮਾਡਲ ਫਾਲਬੈਕਸ ਦੀ ਵਰਤੋਂ ਕਰੋ:**
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

3. **ਡਿਪਲੋਏਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਮਾਡਲ ਨੂੰ ਵੈਧ ਕਰੋ:**
```python
# ਤਾਇਨਾਤੀ ਤੋਂ ਪਹਿਲਾਂ ਮਾਡਲ ਦਾ ਪ੍ਰਮਾਣੀਕਰਨ
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

## ਪ੍ਰਦਰਸ਼ਨ ਅਤੇ ਸਕੇਲਿੰਗ ਸਮੱਸਿਆਵਾਂ

### ਸਮੱਸਿਆ: ਉੱਚ ਲੇਟੈਂਸੀ ਜਵਾਬ

**ਲੱਛਣ:**
- ਜਵਾਬ ਦਾ ਸਮਾਂ > 30 ਸਕਿੰਟ
- ਟਾਈਮਆਉਟ ਐਰਰ
- ਘੱਟ ਉਪਭੋਗਤਾ ਅਨੁਭਵ

**ਸਮਾਧਾਨ:**

1. **ਰਿਕੁਏਸਟ ਟਾਈਮਆਉਟ ਲਾਗੂ ਕਰੋ:**
```python
# ਸਹੀ ਟਾਈਮਆਊਟਸ ਸੰਰਚਿਤ ਕਰੋ
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

2. **ਜਵਾਬ ਕੈਸ਼ਿੰਗ ਸ਼ਾਮਲ ਕਰੋ:**
```python
# ਜਵਾਬਾਂ ਲਈ Redis ਕੈਸ਼
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

3. **ਆਟੋ-ਸਕੇਲਿੰਗ ਸੰਰਚਨਾ ਕਰੋ:**
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

### ਸਮੱਸਿਆ: ਮੈਮੋਰੀ ਖਤਮ ਹੋਣ ਦੇ ਐਰਰ

**ਲੱਛਣ:**
```
Error: Container killed due to memory limit exceeded
```

**ਸਮਾਧਾਨ:**

1. **ਮੈਮੋਰੀ ਅਲੋਕੇਸ਼ਨ ਵਧਾਓ:**
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

2. **ਮੈਮੋਰੀ ਵਰਤੋਂ ਨੂੰ ਅਪਟੀਮਾਈਜ਼ ਕਰੋ:**
```python
# ਮੈਮੋਰੀ-ਕੁਸ਼ਲ ਮਾਡਲ ਸੰਭਾਲ
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # ਪ੍ਰਕਿਰਿਆ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਮੈਮੋਰੀ ਦੀ ਵਰਤੋਂ ਜਾਂਚੋ
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # ਗਾਰਬੇਜ ਕਲੇਕਸ਼ਨ ਨੂੰ ਜ਼ਬਰਦਸਤੀ ਚਲਾਓ
            
        result = await self._process_ai_request(request)
        
        # ਪ੍ਰਕਿਰਿਆ ਤੋਂ ਬਾਅਦ ਸਾਫ਼-ਸਫਾਈ ਕਰੋ
        gc.collect()
        return result
```

## ਲਾਗਤ ਅਤੇ ਕੋਟਾ ਪ੍ਰਬੰਧਨ

### ਸਮੱਸਿਆ: ਅਚਾਨਕ ਉੱਚ ਲਾਗਤ

**ਲੱਛਣ:**
- Azure ਬਿੱਲ ਉਮੀਦ ਤੋਂ ਵੱਧ
- ਟੋਕਨ ਵਰਤੋਂ ਅਨੁਮਾਨਾਂ ਨੂੰ ਵੱਧ ਰਹੀ ਹੈ
- ਬਜਟ ਅਲਰਟ ਟ੍ਰਿਗਰ ਹੋਏ

**ਸਮਾਧਾਨ:**

1. **ਲਾਗਤ ਨਿਯੰਤਰਣ ਲਾਗੂ ਕਰੋ:**
```python
# ਟੋਕਨ ਵਰਤੋਂ ਦੀ ਨਿਗਰਾਨੀ
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

2. **ਲਾਗਤ ਅਲਰਟ ਸੈਟ ਕਰੋ:**
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

3. **ਮਾਡਲ ਚੋਣ ਨੂੰ ਅਪਟੀਮਾਈਜ਼ ਕਰੋ:**
```python
# ਲਾਗਤ-ਜਾਗਰੂਕ ਮਾਡਲ ਚੋਣ
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # ਪ੍ਰਤੀ 1K ਟੋਕਨ
    'gpt-4': 0.03,          # ਪ੍ਰਤੀ 1K ਟੋਕਨ
    'gpt-35-turbo': 0.0015  # ਪ੍ਰਤੀ 1K ਟੋਕਨ
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

## ਡੀਬੱਗਿੰਗ ਟੂਲ ਅਤੇ ਤਕਨੀਕਾਂ

### AZD ਡੀਬੱਗਿੰਗ ਕਮਾਂਡਜ਼

```bash
# ਵਿਸਥਾਰਕ ਲੌਗਿੰਗ ਚਾਲੂ ਕਰੋ
azd up --debug

# ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਸਥਿਤੀ ਜਾਂਚੋ
azd show

# ਐਪਲੀਕੇਸ਼ਨ ਲੌਗਾਂ ਵੇਖੋ (ਮਾਨੀਟਰਿੰਗ ਡੈਸ਼ਬੋਰਡ ਖੁਲਦਾ ਹੈ)
azd monitor --logs

# ਲਾਈਵ ਮੈਟ੍ਰਿਕਸ ਵੇਖੋ
azd monitor --live

# ਇਨਵਾਇਰਨਮੈਂਟ ਵੇਰੀਏਬਲ ਜਾਂਚੋ
azd env get-values
```

### ਐਪਲੀਕੇਸ਼ਨ ਡੀਬੱਗਿੰਗ

1. **ਸੰਰਚਿਤ ਲੌਗਿੰਗ:**
```python
import logging
import json

# ਕ੍ਰਿਤਿਮ ਬੁੱਧੀ ਐਪਲੀਕੇਸ਼ਨਾਂ ਲਈ ਸੰਰਚਿਤ ਲੌਗਿੰਗ ਦੀ ਸੰਰਚਨਾ ਕਰੋ
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

2. **ਹੈਲਥ ਚੈਕ ਐਂਡਪോയੰਟਸ:**
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

3. **ਪ੍ਰਦਰਸ਼ਨ ਮੋਨੀਟਰਨਿੰਗ:**
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

## ਆਮ ਐਰਰ ਕੋਡ ਅਤੇ ਉਨ੍ਹਾਂ ਦੇ ਸਮਾਧਾਨ

| ਐਰਰ ਕੋਡ | ਵੇਰਵਾ | ਸਮਾਧਾਨ |
|------------|-------------|----------|
| 401 | ਅਣਅਧਿਕ੍ਰਿਤ | API ਕੁੰਜੀਆਂ ਅਤੇ managed identity ਸੰਰਚਨਾ ਚੈੱਕ ਕਰੋ |
| 403 | ਪ੍ਰਤੀਬੰਧਿਤ | RBAC ਰੋਲ ਅਸਾਈਨਮੈਂਟਸ ਦੀ ਜਾਂਚ ਕਰੋ |
| 429 | ਰੇਟ ਸੀਮਿਤ | ਇੱਕਸਪੋਨੈਂਸ਼ਲ ਬੈਕਆਫ਼ ਨਾਲ ਰੀਟ੍ਰਾਈ ਲੌਜਿਕ ਲਾਗੂ ਕਰੋ |
| 500 | ਅੰਦਰੂਨੀ ਸਰਵਰ ਐਰਰ | ਮਾਡਲ ਡਿਪਲੋਏਮੈਂਟ ਦੀ ਹਾਲਤ ਅਤੇ ਲੌਗਜ਼ ਜਾਂਚੋ |
| 503 | ਸੇਵਾ ਉਪਲਬਧ ਨਹੀਂ | ਸੇਵਾ ਸਿਹਤ ਅਤੇ ਖੇਤਰੀ ਉਪਲਬਧਤਾ ਦੀ ਜਾਂਚ ਕਰੋ |

## ਅਗਲੇ ਕਦਮ

1. **ਡਿਪਲੋਏਮੈਂਟ ਲਈ ਸਰਵੋਤਮ ਅਭਿਆਸਾਂ ਲਈ [AI ਮਾਡਲ ਡਿਪਲੋਏਮੈਂਟ ਗਾਈਡ](../chapter-02-ai-development/ai-model-deployment.md) ਦੀ ਸਮੀਖਿਆ ਕਰੋ**
2. **ਇੰਟਰਪ੍ਰਾਈਜ਼-ਤਿਆਰ ਸਮਾਧਾਨਾਂ ਲਈ [Production AI Practices](../chapter-08-production/production-ai-practices.md) ਨੂੰ ਪੂਰਾ ਕਰੋ**
3. **ਕਮਿਊਨਿਟੀ ਸਹਾਇਤਾ ਲਈ [Microsoft Foundry Discord](https://aka.ms/foundry/discord) ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ**
4. **AZD-ਖਾਸ ਸਮੱਸਿਆਵਾਂ ਲਈ [AZD GitHub repository](https://github.com/Azure/azure-dev) 'ਤੇ ਇਸ਼ੂਜ਼ ਸਬਮਿਟ ਕਰੋ**

## ਸਰੋਤ

- [Azure OpenAI Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**ਅਧਿਆਇ ਨੇਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਸ਼ੁਰੂਆਤੀਆਂ ਲਈ](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 7 - ਸਮੱਸਿਆ ਨਿਵਾਰਣ ਅਤੇ ਡੀਬੱਗਿੰਗ
- **⬅️ ਪਿਛਲਾ**: [ਡੀਬੱਗਿੰਗ ਗਾਈਡ](debugging.md)
- **➡️ ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 8: ਪ੍ਰੋਡਕਸ਼ਨ ਅਤੇ ਐਨਟਰਪ੍ਰਾਈਜ਼ ਪੈਟਰਨ](../chapter-08-production/production-ai-practices.md)
- **🤖 ਸੰਬੰਧਿਤ**: [ਅਧਿਆਇ 2: AI-ਫਰਸਟ ਵਿਕਾਸ](../chapter-02-ai-development/microsoft-foundry-integration.md)
- [Azure Developer CLI ਟਰਬਲਸ਼ੂਟਿੰਗ](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ਅਸਵੀਕਾਰਨ:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਨਾਲ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਯਤਨ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਆਟੋਮੈਟਿਕ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਪਸ਼ਟਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਹੀ ਅਧਿਕਾਰੀ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਨਾਜ਼ੁਕ ਜਾਂ ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਕਾਰਨ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਮੀ ਜਾਂ ਭ੍ਰਮ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->