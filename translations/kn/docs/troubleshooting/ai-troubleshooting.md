<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b5ae13b6a245ab3a2e6dae923aab65bd",
  "translation_date": "2025-11-24T23:57:33+00:00",
  "source_file": "docs/troubleshooting/ai-troubleshooting.md",
  "language_code": "kn"
}
-->
# AI-ನಿರ್ದಿಷ್ಟ ತೊಂದರೆ ಪರಿಹಾರ ಮಾರ್ಗದರ್ಶಿ

**ಅಧ್ಯಾಯ ನಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD ಪ್ರಾರಂಭಿಕರಿಗಾಗಿ](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 7 - ತೊಂದರೆ ಪರಿಹಾರ ಮತ್ತು ಡಿಬಗಿಂಗ್
- **⬅️ ಹಿಂದಿನದು**: [ಡಿಬಗಿಂಗ್ ಮಾರ್ಗದರ್ಶಿ](debugging.md)
- **➡️ ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 8: ಉತ್ಪಾದನೆ ಮತ್ತು ಎಂಟರ್‌ಪ್ರೈಸ್ ಮಾದರಿಗಳು](../microsoft-foundry/production-ai-practices.md)
- **🤖 ಸಂಬಂಧಿತ**: [ಅಧ್ಯಾಯ 2: AI-ಪ್ರಥಮ ಅಭಿವೃದ್ಧಿ](../microsoft-foundry/microsoft-foundry-integration.md)

**ಹಿಂದಿನದು:** [ಉತ್ಪಾದನಾ AI ಅಭ್ಯಾಸಗಳು](../microsoft-foundry/production-ai-practices.md) | **ಮುಂದಿನದು:** [AZD ಪ್ರಾರಂಭಿಸುವುದು](../getting-started/README.md)

ಈ ಸಮಗ್ರ ತೊಂದರೆ ಪರಿಹಾರ ಮಾರ್ಗದರ್ಶಿ AZD ಬಳಸಿ AI ಪರಿಹಾರಗಳನ್ನು ನಿಯೋಜಿಸುವಾಗ ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳನ್ನು ಪರಿಹರಿಸಲು ಪರಿಹಾರಗಳು ಮತ್ತು ಡಿಬಗಿಂಗ್ ತಂತ್ರಗಳನ್ನು ಒದಗಿಸುತ್ತದೆ.

## ವಿಷಯ ಸೂಚಿ

- [Azure OpenAI ಸೇವಾ ಸಮಸ್ಯೆಗಳು](../../../../docs/troubleshooting)
- [Azure AI ಶೋಧ ಸಮಸ್ಯೆಗಳು](../../../../docs/troubleshooting)
- [ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆ ಸಮಸ್ಯೆಗಳು](../../../../docs/troubleshooting)
- [ಪ್ರಮಾಣೀಕರಣ ಮತ್ತು ಅನುಮತಿ ದೋಷಗಳು](../../../../docs/troubleshooting)
- [ಮಾದರಿ ನಿಯೋಜನೆ ವೈಫಲ್ಯಗಳು](../../../../docs/troubleshooting)
- [ಪ್ರದರ್ಶನ ಮತ್ತು ಮಾಪನ ಸಮಸ್ಯೆಗಳು](../../../../docs/troubleshooting)
- [ವೆಚ್ಚ ಮತ್ತು ಕೋಟಾ ನಿರ್ವಹಣೆ](../../../../docs/troubleshooting)
- [ಡಿಬಗಿಂಗ್ ಸಾಧನಗಳು ಮತ್ತು ತಂತ್ರಗಳು](../../../../docs/troubleshooting)

## Azure OpenAI ಸೇವಾ ಸಮಸ್ಯೆಗಳು

### ಸಮಸ್ಯೆ: OpenAI ಸೇವೆ ಪ್ರದೇಶದಲ್ಲಿ ಲಭ್ಯವಿಲ್ಲ

**ಲಕ್ಷಣಗಳು:**
```
Error: The requested resource type is not available in the location 'westus'
```

**ಕಾರಣಗಳು:**
- ಆಯ್ಕೆ ಮಾಡಿದ ಪ್ರದೇಶದಲ್ಲಿ Azure OpenAI ಲಭ್ಯವಿಲ್ಲ
- ಆದ್ಯತೆಯ ಪ್ರದೇಶಗಳಲ್ಲಿ ಕೋಟಾ ಮುಗಿದಿದೆ
- ಪ್ರದೇಶೀಯ ಸಾಮರ್ಥ್ಯ ನಿರ್ಬಂಧಗಳು

**ಪರಿಹಾರಗಳು:**

1. **ಪ್ರದೇಶ ಲಭ್ಯತೆ ಪರಿಶೀಲಿಸಿ:**
```bash
# OpenAI ಗೆ ಲಭ್ಯವಿರುವ ಪ್ರದೇಶಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **AZD ಸಂರಚನೆ ನವೀಕರಿಸಿ:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **ಪರ್ಯಾಯ ಪ್ರದೇಶಗಳನ್ನು ಬಳಸಿ:**
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

### ಸಮಸ್ಯೆ: ಮಾದರಿ ನಿಯೋಜನೆ ಕೋಟಾ ಮೀರಿಸಲಾಗಿದೆ

**ಲಕ್ಷಣಗಳು:**
```
Error: Deployment failed due to insufficient quota
```

**ಪರಿಹಾರಗಳು:**

1. **ಪ್ರಸ್ತುತ ಕೋಟಾ ಪರಿಶೀಲಿಸಿ:**
```bash
# ಕೋಟಾ ಬಳಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **ಕೋಟಾ ಹೆಚ್ಚಳಕ್ಕಾಗಿ ವಿನಂತಿ ಮಾಡಿ:**
```bash
# ಕೋಟಾ ಹೆಚ್ಚಳ ವಿನಂತಿಯನ್ನು ಸಲ್ಲಿಸಿ
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **ಮಾದರಿ ಸಾಮರ್ಥ್ಯವನ್ನು ಆಪ್ಟಿಮೈಸ್ ಮಾಡಿ:**
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

### ಸಮಸ್ಯೆ: ಅಮಾನ್ಯ API ಆವೃತ್ತಿ

**ಲಕ್ಷಣಗಳು:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**ಪರಿಹಾರಗಳು:**

1. **ಬೆಂಬಲಿತ API ಆವೃತ್ತಿಯನ್ನು ಬಳಸಿ:**
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

## Azure AI ಶೋಧ ಸಮಸ್ಯೆಗಳು

### ಸಮಸ್ಯೆ: ಶೋಧ ಸೇವಾ ಬೆಲೆಗಟ್ಟುವಿಕೆ ಹಂತ ಅಸಮರ್ಪಕವಾಗಿದೆ

**ಲಕ್ಷಣಗಳು:**
```
Error: Semantic search requires Basic tier or higher
```

**ಪರಿಹಾರಗಳು:**

1. **ಬೆಲೆಗಟ್ಟುವಿಕೆ ಹಂತವನ್ನು ನವೀಕರಿಸಿ:**
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

2. **ಸಾಮಾನ್ಯ ಶೋಧವನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ (ಅಭಿವೃದ್ಧಿ ಹಂತದಲ್ಲಿ):**
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

### ಸಮಸ್ಯೆ: ಸೂಚಿ ರಚನೆ ವೈಫಲ್ಯಗಳು

**ಲಕ್ಷಣಗಳು:**
```
Error: Cannot create index, insufficient permissions
```

**ಪರಿಹಾರಗಳು:**

1. **ಶೋಧ ಸೇವಾ ಕೀಗಳನ್ನು ಪರಿಶೀಲಿಸಿ:**
```bash
# ಹುಡುಕಾಟ ಸೇವೆಯ ಆಡಳಿತ ಕೀ ಪಡೆಯಿರಿ
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **ಸೂಚಿ ಸ್ಕೀಮಾವನ್ನು ಪರಿಶೀಲಿಸಿ:**
```python
# ಸೂಚ್ಯಂಕ ಸ್ಕೀಮಾವನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ
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

3. **ನಿರ್ವಹಿತ ಗುರುತನ್ನು ಬಳಸಿ:**
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

## ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆ ಸಮಸ್ಯೆಗಳು

### ಸಮಸ್ಯೆ: ಕಂಟೈನರ್ ನಿರ್ಮಾಣ ವೈಫಲ್ಯಗಳು

**ಲಕ್ಷಣಗಳು:**
```
Error: Failed to build container image
```

**ಪರಿಹಾರಗಳು:**

1. **Dockerfile ಶ್ರುತಿಲಿಪಿಯನ್ನು ಪರಿಶೀಲಿಸಿ:**
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

2. **ಆಧಾರಗಳನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ:**
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

3. **ಆರೋಗ್ಯ ತಪಾಸಣೆ ಸೇರಿಸಿ:**
```python
# ಮುಖ್ಯ.py - ಆರೋಗ್ಯ ತಪಾಸಣೆ ಎಂಡ್ಪಾಯಿಂಟ್ ಸೇರಿಸಿ
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### ಸಮಸ್ಯೆ: ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್ ಪ್ರಾರಂಭ ವೈಫಲ್ಯಗಳು

**ಲಕ್ಷಣಗಳು:**
```
Error: Container failed to start within timeout period
```

**ಪರಿಹಾರಗಳು:**

1. **ಪ್ರಾರಂಭ ಸಮಯ ಮಿತಿಯನ್ನು ಹೆಚ್ಚಿಸಿ:**
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
# ಮಾದರಿಗಳನ್ನು ಆಲಸ್ಯದಿಂದ ಲೋಡ್ ಮಾಡಿ ಪ್ರಾರಂಭ ಸಮಯವನ್ನು ಕಡಿಮೆ ಮಾಡಿ
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
    # ಶಟ್ಡೌನ್
    pass

app = FastAPI(lifespan=lifespan)
```

## ಪ್ರಮಾಣೀಕರಣ ಮತ್ತು ಅನುಮತಿ ದೋಷಗಳು

### ಸಮಸ್ಯೆ: ನಿರ್ವಹಿತ ಗುರುತಿಗೆ ಅನುಮತಿ ನಿರಾಕರಿಸಲಾಗಿದೆ

**ಲಕ್ಷಣಗಳು:**
```
Error: Authentication failed for Azure OpenAI Service
```

**ಪರಿಹಾರಗಳು:**

1. **ಪಾತ್ರ ನಿಯೋಜನೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ:**
```bash
# ಪ್ರಸ್ತುತ ಪಾತ್ರ ನಿಯೋಜನೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **ಅಗತ್ಯವಾದ ಪಾತ್ರಗಳನ್ನು ನಿಯೋಜಿಸಿ:**
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

3. **ಪ್ರಮಾಣೀಕರಣವನ್ನು ಪರೀಕ್ಷಿಸಿ:**
```python
# ನಿರ್ವಹಿತ ಗುರುತಿನ ಪ್ರಾಮಾಣೀಕರಣವನ್ನು ಪರೀಕ್ಷಿಸಿ
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

### ಸಮಸ್ಯೆ: ಕೀ ವಾಲ್ಟ್ ಪ್ರವೇಶ ನಿರಾಕರಿಸಲಾಗಿದೆ

**ಲಕ್ಷಣಗಳು:**
```
Error: The user, group or application does not have secrets get permission
```

**ಪರಿಹಾರಗಳು:**

1. **ಕೀ ವಾಲ್ಟ್ ಅನುಮತಿಗಳನ್ನು ನೀಡಿ:**
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

2. **RBAC ಅನ್ನು ಪ್ರವೇಶ ನೀತಿಗಳ ಬದಲು ಬಳಸಿ:**
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

## ಮಾದರಿ ನಿಯೋಜನೆ ವೈಫಲ್ಯಗಳು

### ಸಮಸ್ಯೆ: ಮಾದರಿ ಆವೃತ್ತಿ ಲಭ್ಯವಿಲ್ಲ

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

2. **ಮಾದರಿ ಬದಲಾವಣೆಗಳನ್ನು ಬಳಸಿ:**
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

3. **ನಿಯೋಜನೆಗೆ ಮೊದಲು ಮಾದರಿಯನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ:**
```python
# ಪೂರ್ವ ನಿಯೋಜನೆ ಮಾದರಿ ಮಾನ್ಯತೆ
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

## ಪ್ರದರ್ಶನ ಮತ್ತು ಮಾಪನ ಸಮಸ್ಯೆಗಳು

### ಸಮಸ್ಯೆ: ಹೆಚ್ಚಿನ ವಿಳಂಬ ಪ್ರತಿಕ್ರಿಯೆಗಳು

**ಲಕ್ಷಣಗಳು:**
- ಪ್ರತಿಕ್ರಿಯಾ ಸಮಯ > 30 ಸೆಕೆಂಡುಗಳು
- ಟೈಮ್‌ಔಟ್ ದೋಷಗಳು
- ದುರ್ಬಲ ಬಳಕೆದಾರ ಅನುಭವ

**ಪರಿಹಾರಗಳು:**

1. **ವಿನಂತಿ ಟೈಮ್‌ಔಟ್ ಅನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ:**
```python
# ಸರಿಯಾದ ಟೈಮೌಟ್‌ಗಳನ್ನು ಸಂರಚಿಸಿ
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

2. **ಪ್ರತಿಕ್ರಿಯಾ ಕ್ಯಾಶಿಂಗ್ ಸೇರಿಸಿ:**
```python
# ಪ್ರತಿಕ್ರಿಯೆಗಳಿಗಾಗಿ ರೆಡಿಸ್ ಕ್ಯಾಶ್
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

3. **ಸ್ವಯಂ-ಮಾಪನವನ್ನು ಸಂರಚಿಸಿ:**
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

### ಸಮಸ್ಯೆ: ಮೆಮೊರಿ ಔಟ್ ಆಫ್ ದೋಷಗಳು

**ಲಕ್ಷಣಗಳು:**
```
Error: Container killed due to memory limit exceeded
```

**ಪರಿಹಾರಗಳು:**

1. **ಮೆಮೊರಿ ಹಂಚಿಕೆಯನ್ನು ಹೆಚ್ಚಿಸಿ:**
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

2. **ಮೆಮೊರಿ ಬಳಕೆಯನ್ನು ಆಪ್ಟಿಮೈಸ್ ಮಾಡಿ:**
```python
# ಮೆಮೊರಿ-ಕಾರ್ಯಕ್ಷಮ ಮಾದರಿ ಹ್ಯಾಂಡ್ಲಿಂಗ್
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # ಪ್ರಕ್ರಿಯೆಗಿಂತ ಮೊದಲು ಮೆಮೊರಿ ಬಳಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # ಗಾರ್ಬೇಜ್ ಸಂಗ್ರಹಣೆಯನ್ನು ಬಲವಂತಪಡಿಸಿ
            
        result = await self._process_ai_request(request)
        
        # ಪ್ರಕ್ರಿಯೆ ನಂತರ ಸ್ವಚ್ಛಗೊಳಿಸಿ
        gc.collect()
        return result
```

## ವೆಚ್ಚ ಮತ್ತು ಕೋಟಾ ನಿರ್ವಹಣೆ

### ಸಮಸ್ಯೆ: ನಿರೀಕ್ಷಿತಕ್ಕಿಂತ ಹೆಚ್ಚಿನ ವೆಚ್ಚ

**ಲಕ್ಷಣಗಳು:**
- Azure ಬಿಲ್ ನಿರೀಕ್ಷೆಗಿಂತ ಹೆಚ್ಚು
- ಟೋಕನ್ ಬಳಕೆ ಅಂದಾಜುಗಳನ್ನು ಮೀರಿಸುತ್ತದೆ
- ಬಜೆಟ್ ಎಚ್ಚರಿಕೆಗಳು ಸೃಷ್ಟಿಯಾಗಿವೆ

**ಪರಿಹಾರಗಳು:**

1. **ವೆಚ್ಚ ನಿಯಂತ್ರಣಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ:**
```python
# ಟೋಕನ್ ಬಳಕೆ ಹಾದಿ ಟ್ರ್ಯಾಕಿಂಗ್
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

2. **ವೆಚ್ಚ ಎಚ್ಚರಿಕೆಗಳನ್ನು ಹೊಂದಿಸಿ:**
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

3. **ಮಾದರಿ ಆಯ್ಕೆಯನ್ನು ಆಪ್ಟಿಮೈಸ್ ಮಾಡಿ:**
```python
# ವೆಚ್ಚ-ಜಾಗರೂಕ ಮಾದರಿ ಆಯ್ಕೆ
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # 1K ಟೋಕನ್‌ಗಳಿಗೆ
    'gpt-4': 0.03,          # 1K ಟೋಕನ್‌ಗಳಿಗೆ
    'gpt-35-turbo': 0.0015  # 1K ಟೋಕನ್‌ಗಳಿಗೆ
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

## ಡಿಬಗಿಂಗ್ ಸಾಧನಗಳು ಮತ್ತು ತಂತ್ರಗಳು

### AZD ಡಿಬಗಿಂಗ್ ಆಜ್ಞೆಗಳು

```bash
# ವಿವರವಾದ ಲಾಗಿಂಗ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
azd up --debug

# ನಿಯೋಜನೆ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd show

# ನಿಯೋಜನೆ ಲಾಗ್ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd logs --follow

# ಪರಿಸರ ಚರಾಂಶಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
azd env get-values
```

### ಅಪ್ಲಿಕೇಶನ್ ಡಿಬಗಿಂಗ್

1. **ಸಂರಚಿತ ಲಾಗಿಂಗ್:**
```python
import logging
import json

# AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗಾಗಿ ಸಂರಚಿತ ಲಾಗಿಂಗ್ ಅನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಿ
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

2. **ಆರೋಗ್ಯ ತಪಾಸಣೆ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳು:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # ಓಪನ್‌ಎಐ ಸಂಪರ್ಕವನ್ನು ಪರಿಶೀಲಿಸಿ
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # ಹುಡುಕಾಟ ಸೇವೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
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

3. **ಪ್ರದರ್ಶನ ಮೇಲ್ವಿಚಾರಣೆ:**
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

## ಸಾಮಾನ್ಯ ದೋಷ ಕೋಡ್‌ಗಳು ಮತ್ತು ಪರಿಹಾರಗಳು

| ದೋಷ ಕೋಡ್ | ವಿವರಣೆ | ಪರಿಹಾರ |
|------------|-------------|----------|
| 401 | ಅನಧಿಕೃತ | API ಕೀಗಳು ಮತ್ತು ನಿರ್ವಹಿತ ಗುರುತಿನ ಸಂರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ |
| 403 | ನಿಷೇಧಿತ | RBAC ಪಾತ್ರ ನಿಯೋಜನೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ |
| 429 | ದರ ಮಿತಿಗೊಳಿಸಲಾಗಿದೆ | ವಿಸ್ತಾರಿಕ ಬ್ಯಾಕ್‌ಆಫ್‌ನೊಂದಿಗೆ ಪುನಃ ಪ್ರಯತ್ನ ತಂತ್ರವನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ |
| 500 | ಆಂತರಿಕ ಸರ್ವರ್ ದೋಷ | ಮಾದರಿ ನಿಯೋಜನೆ ಸ್ಥಿತಿ ಮತ್ತು ಲಾಗ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ |
| 503 | ಸೇವೆ ಲಭ್ಯವಿಲ್ಲ | ಸೇವಾ ಆರೋಗ್ಯ ಮತ್ತು ಪ್ರದೇಶ ಲಭ್ಯತೆಯನ್ನು ಪರಿಶೀಲಿಸಿ |

## ಮುಂದಿನ ಹಂತಗಳು

1. **[AI ಮಾದರಿ ನಿಯೋಜನೆ ಮಾರ್ಗದರ್ಶಿ](ai-model-deployment.md)** ಅನ್ನು ಪರಿಶೀಲಿಸಿ ನಿಯೋಜನೆ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳಿಗಾಗಿ
2. **[ಉತ್ಪಾದನಾ AI ಅಭ್ಯಾಸಗಳು](production-ai-practices.md)** ಅನ್ನು ಪೂರ್ಣಗೊಳಿಸಿ ಎಂಟರ್‌ಪ್ರೈಸ್-ಸಿದ್ಧ ಪರಿಹಾರಗಳಿಗಾಗಿ
3. **[Microsoft Foundry Discord](https://aka.ms/foundry/discord)** ಗೆ ಸೇರಿ ಸಮುದಾಯ ಬೆಂಬಲಕ್ಕಾಗಿ
4. **ಸಮಸ್ಯೆಗಳನ್ನು ಸಲ್ಲಿಸಿ** [AZD GitHub ರೆಪೊಸಿಟರಿ](https://github.com/Azure/azure-dev) ಗೆ AZD-ನಿರ್ದಿಷ್ಟ ಸಮಸ್ಯೆಗಳಿಗೆ

## ಸಂಪತ್ತುಗಳು

- [Azure OpenAI ಸೇವಾ ತೊಂದರೆ ಪರಿಹಾರ](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್ ತೊಂದರೆ ಪರಿಹಾರ](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI ಶೋಧ ತೊಂದರೆ ಪರಿಹಾರ](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**ಅಧ್ಯಾಯ ನಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD ಪ್ರಾರಂಭಿಕರಿಗಾಗಿ](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 7 - ತೊಂದರೆ ಪರಿಹಾರ ಮತ್ತು ಡಿಬಗಿಂಗ್
- **⬅️ ಹಿಂದಿನದು**: [ಡಿಬಗಿಂಗ್ ಮಾರ್ಗದರ್ಶಿ](debugging.md)
- **➡️ ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 8: ಉತ್ಪಾದನೆ ಮತ್ತು ಎಂಟರ್‌ಪ್ರೈಸ್ ಮಾದರಿಗಳು](../microsoft-foundry/production-ai-practices.md)
- **🤖 ಸಂಬಂಧಿತ**: [ಅಧ್ಯಾಯ 2: AI-ಪ್ರಥಮ ಅಭಿವೃದ್ಧಿ](../microsoft-foundry/microsoft-foundry-integration.md)
- [Azure Developer CLI ತೊಂದರೆ ಪರಿಹಾರ](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕಾರ**:  
ಈ ದಸ್ತಾವೇಜನ್ನು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯಿಗಾಗಿ ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಡ್ಡೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಮಹತ್ವದ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->