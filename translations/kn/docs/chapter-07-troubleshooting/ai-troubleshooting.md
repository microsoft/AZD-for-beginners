# AI-ನಿರ್ದಿಷ್ಟ ಸಮಸ್ಯೆ ಪತ್ತೆ ಮಾರ್ಗದರ್ಶಿ

**ಅಧ್ಯಾಯ ನಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [ಆಜಡ್ ಶುರುವಾತಿಗಾಗಿ](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 7 - ಸಮಸ್ಯೆ ಪತ್ತೆ ಹಾಗೂ ಡಿಬಗಿನಿಂಗ್
- **⬅️ ಹಿಂದಿನದು**: [ಡಿಬಗಿನಿಂಗ್ ಮಾರ್ಗದರ್ಶಿ](debugging.md)
- **➡️ ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 8: ಉತ್ಪಾದನೆ ಮತ್ತು ಸಂಸ್ಥೆ ಮಾದರಿಗಳು](../chapter-08-production/production-ai-practices.md)
- **🤖 ಸಂಬಂಧಿತ**: [ಅಧ್ಯಾಯ 2: AI-ಪ್ರಥಮ ಅಭಿವೃದ್ಧಿ](../chapter-02-ai-development/microsoft-foundry-integration.md)

ಈ ವ್ಯಾಪಕ ಸಮಸ್ಯೆ ಪತ್ತೆ ಮಾರ್ಗದರ್ಶಿ ಆಜಡ್‌ ಬಳಸಿ AI ಪರಿಹಾರಗಳನ್ನು ನಿಯೋಜಿಸುವಾಗ ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳಿಗೆAzure AI ಸೇವೆಗಳಿಗೆ ನಿರ್ದಿಷ್ಟ ಪರಿಹಾರಗಳು ಮತ್ತು ಡಿಬಗಿನಿಂಗ್ ತಂತ್ರಗಳನ್ನು ಒದಗಿಸುತ್ತದೆ.

## ವಿಷಯಗಳ ಪಟ್ಟಿಗೆ

- [Microsoft Foundry ಮಾದರಿಗಳು ಸೇವೆ ಸಮಸ್ಯೆಗಳು](#azure-openai-service-issues)
- [Azure AI ಹುಡುಕಾಟ ಸಮಸ್ಯೆಗಳು](#azure-ai-ಹುಡುಕಾಟ-ಸಮಸ್ಯೆಗಳು)
- [ಕಂಟೈನರ್ ಅಪ್ಸ್ ನಿಯೋಜನೆ ಸಮಸ್ಯೆಗಳು](#ಕಂಟೈನರ್-ಅಪ್ಸ್-ನಿಯೋಜನೆ-ಸಮಸ್ಯೆಗಳು)
- [ಪ್ರಮಾಣೀಕರಣ ಮತ್ತು ಅನುಮತಿ ದೋಷಗಳು](#ಪ್ರಮಾಣೀಕರಣ-ಮತ್ತು-ಅನುಮತಿ-ದೋಷಗಳು)
- [ಮಾದರಿ ನಿಯೋಜನೆ ವಿಫಲತೆಗಳು](#ಮಾದರಿ-ನಿಯೋಜನೆ-ವಿಫಲತೆಗಳು)
- [ಕಾರ್ಯಕ್ಷಮತೆ ಮತ್ತು масш್ಜ್ ಸಮಸ್ಯೆಗಳು](#ಕಾರ್ಯಕ್ಷಮತೆ-ಮತ್ತು-масшಡ್-ಸಮಸ್ಯೆಗಳು)
- [ಖರ್ಚು ಮತ್ತು ಅರ್ಹತಾ ನಿರ್ವಹಣೆ](#ಖರ್ಚು-ಮತ್ತು-ಅರ್ಹತಾ-ನಿರ್ವಹಣೆ)
- [ಡಿಬಗಿನಿಂಗ್ ಸಾಧನಗಳು ಮತ್ತು ತಂತ್ರಗಳು](#ಡಿಬಗಿನಿಂಗ್-ಸಾಧನಗಳು-ಮತ್ತು-ತಂತ್ರಗಳು)

## Microsoft Foundry ಮಾದರಿಗಳು ಸೇವೆ ಸಮಸ್ಯೆಗಳು

### ಸಮಸ್ಯೆ: OpenAI ಸೇವೆ ಪ್ರಾಂತ್ಯದಲ್ಲಿ ಲಭ್ಯವಿಲ್ಲ

**ಲಕ್ಷಣಗಳು:**
```
Error: The requested resource type is not available in the location 'westus'
```

**ಕಾರಣಗಳು:**
- Microsoft Foundry ಮಾದರಿಗಳು ಆಯ್ದ ಪ್ರದೇಶದಲ್ಲಿ ಲಭ್ಯವಿಲ್ಲ
- ಇಚ್ಛಿತ ಪ್ರದೇಶಗಳಲ್ಲಿ ಅರ್ಹತಾ ಮಿತಿ ಮುಗಿದಿದೆ
- ಪ್ರಾದೇಶಿಕ ಸಾಮರ್ಥ್ಯ ಮಿತಿ

**ಪರಿಹಾರಗಳು:**

1. **ಪ್ರಾಂತ್ಯ ಲಭ್ಯತೆ ಪರಿಶೀಲಿಸಿ:**
```bash
# OpenAI ಗೆ ಲಭ್ಯವಿರುವ ಪ್ರಾಂತ್ಯಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **ಆಜಡ್ ಸಂರಚನೆಯನ್ನು ನವೀಕರಿಸಿ:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **ವೈಕಲ್ಪಿಕ ಪ್ರದೇಶಗಳನ್ನು ಬಳಸಿ:**
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

### ಸಮಸ್ಯೆ: ಮಾದರಿ ನಿಯೋಜನೆ ಅರ್ಹತಾ ಮಿತಿ ಮೀರಿ ಹೋದಿದೆ

**ಲಕ್ಷಣಗಳು:**
```
Error: Deployment failed due to insufficient quota
```

**ಪರಿಹಾರಗಳು:**

1. **ಪ್ರಸ್ತುತ ಅರ್ಹತಾ ಮಿತಿ ಪರಿಶೀಲಿಸಿ:**
```bash
# ಕೊಟಾ ಬಳಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **ಅರ್ಹತಾ ಮಿತಿ ಹೆಚ್ಚಿಸುವಂತೆ ವಿನಂತಿಸಿ:**
```bash
# ಕೊಟಾ ವೃದ್ಧಿ ವಿನಂತಿಯನ್ನು ಸಲ್ಲಿಸಿ
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **ಮಾದರಿ ಸಾಮರ್ಥ್ಯವನ್ನು ಪರಿಪೋಷಿಸಿ:**
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

### ಸಮಸ್ಯೆ: ಅನಾವಶ್ಯಕ API ಆವೃತ್ತಿ

**ಲક્ષણಗಳು:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**ಪರಿಹಾರಗಳು:**

1. **ಬೆಂಬಲಿತ API ಆವೃತ್ತಿ ಬಳಸಿ:**
```python
# ಇತ್ತೀಚಿನ ಬೆಂಬಲಿತ ಆವೃತ್ತಿಯನ್ನು ಬಳಸಿ
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API ಆವೃತ್ತಿ ಹೊಂದಾಣಿಕೆ ಪರಿಶೀಲಿಸಿ:**
```bash
# ಬೆಂಬಲಿತ API ಆವೃತ್ತಿಗಳ ಪಟ್ಟಿಗಳನ್ನು ತೋರಿಸಿ
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI ಹುಡುಕಾಟ ಸಮಸ್ಯೆಗಳು

### ಸಮಸ್ಯೆ: ಹುಡುಕಾಟ ಸೇವೆ ಬೆಲೆಮಟ್ಟ ಅಪರ್ಯಾಪ್ತವಾಗಿದೆ

**ಲಕ್ಷಣಗಳು:**
```
Error: Semantic search requires Basic tier or higher
```

**ಪರಿಹಾರಗಳು:**

1. **ಬೆಲೆಮಟ್ಟವನ್ನು ಹೆಚ್ಚಿಸಿ:**
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

2. **ಅರ್ಥ ಸSenseರ್ಚి (Semantic Search) ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ (ಅಭಿವೃದ್ಧಿಗಾಗಿ):**
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

### ಸಮಸ್ಯೆ: ಇಂಡೆಕ್ಸ್ ರಚನೆ ವಿಫಲತೆಗಳು

**ಲಕ್ಷಣಗಳು:**
```
Error: Cannot create index, insufficient permissions
```

**ಪರಿಹಾರಗಳು:**

1. **ಹುಡುಕಾಟ ಸೇವೆ ಕೀಗಳನ್ನು ಪರಿಶೀಲಿಸಿ:**
```bash
# ಹುಡುಕಿ ಸೇವೆಯ ಆಡಳಿತ ಕೀ ಅನ್ನು ಪಡೆಯಿರಿ
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **ಇಂಡೆಕ್ಸ್ ಸೂತ್ರರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ:**
```python
# ಸೂಚ್ಯಂಕ ಮಾದರಿಯನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ
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

## ಕಂಟೈನರ್ ಅಪ್ಸ್ ನಿಯೋಜನೆ ಸಮಸ್ಯೆಗಳು

### ಸಮಸ್ಯೆ: ಕಾಂಟೈನರ್ ನಿರ್ಮಾಣ ವಿಫಲತೆಗಳು

**ಲಕ್ಷಣಗಳು:**
```
Error: Failed to build container image
```

**ಪರಿಹಾರಗಳು:**

1. **ಡೊಕರ್‌ಫೈಲ್ ವ್ಯಾಕರಣ ಪರಿಶೀಲಿಸಿ:**
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

2. **ಆಶ್ರಿತತೆಗಳನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ:**
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

3. **ಆರೋಗ್ಯ ಪರಿಶೀಲನೆ ಸೇರಿಸಿ:**
```python
# main.py - ಆರೋಗ್ಯ ಪರಿಶೀಲನೆ ಎಂಡ್ಪಾಯಿಂಟ್ ಸೇರಿಸಿ
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### ಸಮಸ್ಯೆ: ಕಾಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್ ಪ್ರಾರಂಭ ವಿಫಲತೆಗಳು

**ಲಕ್ಷಣಗಳು:**
```
Error: Container failed to start within timeout period
```

**ಪರಿಹಾರಗಳು:**

1. **ಪ್ರಾರಂಭ ಕಾಲಾವಧಿ ಹೆಚ್ಚಿಸಿ:**
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

2. **ಮಾದರಿ ಲೋಡಿಂಗ್ ಅನ್ನು ಪರಿಪೋಷಿಸಿ:**
```python
# ಪ್ರಾರಂಭ ಸಮಯವನ್ನು ಕಡಿಮೆ ಮಾಡಲು ಆಲಸಿ ಲೋಡ್ ಮಾದರಿಗಳನ್ನು
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
        # ಇಲ್ಲಿ AI ಕ್ಲೈಯಂಟ್ ಅನ್ನು ಪ್ರಾರಂಭಿಸಿ
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # ಪ್ರಾರಂಭಿಕೆ
    app.state.model_manager = ModelManager()
    yield
    # ನಿಲ್ಲಿಕೆ
    pass

app = FastAPI(lifespan=lifespan)
```

## ಪ್ರಮಾಣೀಕರಣ ಮತ್ತು ಅನುಮತಿ ದೋಷಗಳು

### ಸಮಸ್ಯೆ: ನಿರ್ವಹಿತ ಗುರುತಿಗೆ ಅನುಮತಿ ನಿರಾಕರಿಸಲಾಗಿದೆ

**ಲಕ್ಷಣಗಳು:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**ಪರಿಹಾರಗಳು:**

1. **ಪಾತ್ರ ನಿಯೋಜನೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ:**
```bash
# ಪ್ರಸ್ತುತ ಪಾತ್ರ ಹಂಚಿಕೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **ಅಗತ್ಯ ಪಾತ್ರಗಳನ್ನು ನಿಯೋಜಿಸಿ:**
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

3. **ಪ್ರಮಾಣೀಕರಣ ತಪಾಸಣೆ ಮಾಡಿ:**
```python
# ನಿರ್ವಹಿತ ಗುರುತಿನ ದೃಢೀಕರಣವನ್ನು ಪರೀಕ್ಷಿಸಿ
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

1. **ಕೀ ವಾಲ್ಟ್ ಅನುಮತಿಗಳನ್ನು ನೀಡಿರಿ:**
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

2. **ಪ್ರವೇಶ ನೀತಿಗಳ ಬದಲು RBAC ಬಳಸಿ:**
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

## ಮಾದರಿ ನಿಯೋಜನೆ ವಿಫಲತೆಗಳು

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

2. **ಮಾದರಿ ಫಾಲ್ಬ್ಯಾಕ್‌ಗಳನ್ನು ಬಳಸಿ:**
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

3. **ನಿಯೋಜನೆಯ ಮೊದಲು ಮಾದರಿಯನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ:**
```python
# ನಿಯೋಜನೆಯ ಮುಂಚಿನ ಮಾದರಿ ಪರಿಶೀಲನೆ
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

## ಕಾರ್ಯಕ್ಷಮತೆ ಮತ್ತು масшಡ್ ಸಮಸ್ಯೆಗಳು

### ಸಮಸ್ಯೆ: ಹೆಚ್ಚಿನ ವಿಳಂಬ ಪ್ರತಿಕ್ರಿಯೆಗಳು

**ಲಕ್ಷಣಗಳು:**
- ಪ್ರತಿಕ್ರಿಯೆ ಸಮಯ > 30 ಸೆಕೆಂಡುಗಳು
- ಕಾಲಹರಣ ದೋಷಗಳು
- ದುರ್ಬಲ ಬಳಕೆದಾರ ಅನುಭವ

**ಪರಿಹಾರಗಳು:**

1. **ವಿನಂತಿ ಕಾಲಹರಣವನ್ನು ಅಳವಡಿಸಿ:**
```python
# ಸೂಕ್ತ ಸಮಯ ಮೀರಿದ ಸಮಯಗಳನ್ನು ಸಂರಚಿಸಿ
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

2. **ಪ್ರತಿಕ್ರಿಯೆ ಕ್ಯಾಶಿಂಗ್ ಸೇರಿಸಿ:**
```python
# ಪ್ರತಿಕ್ರಿಯೆಗಳಿಗೆ Redis ಕ್ಯಾಚೆ
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

3. **ಸ್ವಯಂ-ಮಾಪನ ಅನ್ನು ಸಂರಚಿಸಿ:**
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

### ಸಮಸ್ಯೆ: ಮೆಮೊರಿ ಹೊರದೋಷಗಳು

**ಲಕ್ಷಣಗಳು:**
```
Error: Container killed due to memory limit exceeded
```

**ಪರಿಹಾರಗಳು:**

1. **ಮೆಮೊರಿ ಮಂಜೂರು ಹೆಚ್ಚಿಸಿ:**
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

2. **ಮೆಮೊರಿ ಬಳಸಿಕೆಯನ್ನು ಪರಿಪೋಷಿಸಿ:**
```python
# ಸ್ಮೃತಿ-ಕಾರ್ಯಕ್ಷಮ ಮಾದರಿ ನಿರ್ವಹಣೆ
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # ಪ್ರಕ್ರಿಯೆಗೊಳಿಸುವ ಮೊದಲು ಸ್ಮೃತಿ ಬಳಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # ಕಸ ಸಂಗ್ರಹಣೆಯನ್ನು ಬಲವಂತರೂಪದಲ್ಲಿ ಕರೆಸುವುದು
            
        result = await self._process_ai_request(request)
        
        # ಪ್ರಕ್ರಿಯೆಯ ನಂತರ ಸ್ವಚ್ಛಗೊಳಿಸಿ
        gc.collect()
        return result
```

## ಖರ್ಚು ಮತ್ತು ಅರ್ಹತಾ ನಿರ್ವಹಣೆ

### ಸಮಸ್ಯೆ: ಕನಸಿನಷ್ಟು ಹೆಚ್ಚಿನ ಖರ್ಚುಗಳು

**ಲಕ್ಷಣಗಳು:**
- ನಿರೀಕ್ಷೆಗಿಂತ ಹೆಚ್ಚಿನ Azure ಬಿಲ್
- ಟೋಕನ್ ಬಳಕೆ ಅಂದಾಜು ಮೀರಿ ದಾಟಿದೆ
- ಬಜೆಟ್ ಮಾಹಿತಿ ಅಲೆಯನ್ ಸಕ್ರಿಯವಾಗಿದೆ

**ಪರಿಹಾರಗಳು:**

1. **ಖರ್ಚು ನಿಯಂತ್ರಣಗಳನ್ನು ಅಳವಡಿಸಿ:**
```python
# ಟೋಕನ್ ಬಳಕೆಯನ್ನು ಟ್ರ್ಯಾಕ್ ಮಾಡುವುದು
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

2. **ಖರ್ಚು ಸೂಚನೆಗಳನ್ನು ಹೊಂದಿಸಿ:**
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

3. **ಮಾದರಿ ಆಯ್ಕೆ ಪರಿಪೋಷಿಸಿ:**
```python
# ವೆಚ್ಚ-ಜಾಗೃತಿ ಹೊಂದಿರುವ ಮಾದರಿ ಆಯ್ಕೆ
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

## ಡಿಬಗಿನಿಂಗ್ ಸಾಧನಗಳು ಮತ್ತು ತಂತ್ರಗಳು

### AZD ಡಿಬಗಿನಿಂಗ್ ಕಮಾಂಡ್‌ಗಳು

```bash
# ವರ್ಬೋಸ್ ಲಾಗಿಂಗ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
azd up --debug

# ನಿಯೋಜನೆ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd show

# ಅನ್ವಯಿಕ ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ (ಮೌಲ್ಯಮಾಪನ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ ತೆರೆಯುತ್ತದೆ)
azd monitor --logs

# ಜೀವಂತ ಮೆಟ್ರಿಕ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd monitor --live

# ಪರಿಸರ ಚರ들을 ಪರಿಶೀಲಿಸಿ
azd env get-values
```

### AZD AI ವಿಸ್ತರಣೆ ಡಯಾಗ್ನೋಸ್ಟಿಕ್ಸ್ ಕಮಾಂಡ್‌ಗಳು

`azd ai agent init` ಬಳಸಿ ಏಜೆಂಟ್ಗಳನ್ನು ನಿಯೋಜಿಸಿದರೆ, ಈ అదನಪೂರ್ವಕ ಸಾಧನಗಳು ಲಭ್ಯವಿವೆ:

```bash
# ಏಜೆಂಟ್ಸ್ ವಿಸ್ತರಣೆಯನ್ನು ಅನುಸ್ಥಾಪಿಸಲಾಗಿರುವುದನ್ನು ಖಚಿತಪಡಿಸಿಕೊಳ್ಳಿ
azd extension install azure.ai.agents

# ಮ್ಯಾನಿಫೆಸ್ಟ್‌ನಿಂದ ಏಜೆಂಟ್ನ್ನು ಪುನರ್‌ಪ್ರಾರಂಭ ಅಥವಾ تازهಗೊಳಿಸಿ
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# AI ಉಪಕರಣಗಳು ಪ್ರಾಜೆಕ್ಟ್ ಸ್ಥಿತಿಯನ್ನು ಪ್ರಶ್ನಿಸಲು MCP ಸರ್ವರ್ ಅನ್ನು ಬಳಸಿ
azd mcp start

# ಪರಿಶೀಲನೆ ಮತ್ತು ಆಡಿಟ್‌ಗಾಗಿ ಮೂಲಸೌಕರ್ಯ ಕಡತಗಳನ್ನು ರಚಿಸಿ
azd infra generate
```

> **ಸಲಹೆ:**  `azd infra generate` ಬಳಸಿ IaC ಅನ್ನು ಡಿಸ್ಕ್‌ಗೆ ಬರೆಯಬಹುದು, ಇದರಿಂದ ನೀವು ನಿಯೋಜಿಸಲಾದ ಸಂಪನ್ಮೂಲಗಳನ್ನು ನಿಖರವಾಗಿ ಪರಿಶೀಲಿಸಬಹುದು. ಇದು ಸಂಪನ್ಮೂಲ ಸಂರಚನೆಯ ಸಮಸ್ಯೆಗಳನ್ನು ಡಿಬಗ್ ಮಾಡುವಾಗ ಅಮೂಲ್ಯವಾಗಿದೆ. ಪೂರ್ಣ ವಿವರಗಳಿಗೆ [ಆಜಡ್ AI CLI ರೆಫರೆನ್ಸ್](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) ನೋಡಿ.

### ಅಪ್ಲಿಕೇಶನ್ ಡಿಬಗಿನಿಂಗ್

1. **ಸಂರಚಿತ ಲಾಗಿಂಗ್:**
```python
import logging
import json

# AI ಅನ್ವಯಿಕೆಗಳಿಗೆ ಸಂರಚಿತ ಲಾಗಿಂಗ್ ಅನ್ನು ಕונ್ಫಿಗರ್ ಮಾಡಿ
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

2. **ಆರೋಗ್ಯ ಪರಿಶೀಲನಾ ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳು:**
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

3. **ಕಾರ್ಯಕ್ಷಮತೆ ಮಾನಿಟರಿಂಗ್:**
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
| 401 | ಅನುಮತಿಸದ | API ಕೀಗಳು ಮತ್ತು ನಿರ್ವಹಿತ ಗುರುತಿನ ಸಂರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ |
| 403 | ನಿಷೇಧಿತ | RBAC ಪಾತ್ರ ನಿಯೋಜನೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ |
| 429 | ದರ ಮಿತಿಗೊಳಿಸಲಾಗಿದೆ | ಗುಣಾಕಾರ ಹಿಂಬುತ್ತದಿ ಸಹಿತ ಮರುಪ್ರಯತ್ನ ತಂತ್ರ ಬಳಸಿ |
| 500 | ಆಂತರಿಕ ಸರ್ವರ್ ದೋಷ | ಮಾದರಿ ನಿಯೋಜನೆ ಸ್ಥಿತಿ ಮತ್ತು ಲಾಗ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ |
| 503 | ಸೇವೆ ಲಭ್ಯವಿಲ್ಲ | ಸೇವೆಯ ಆರೋಗ್ಯ ಮತ್ತು ಪ್ರಾದೇಶಿಕ ಲಭ್ಯತೆ ಪರಿಶೀಲಿಸಿ |

## ಮುಂದಿನ ಹಂತಗಳು

1. **[AI ಮಾದರಿ ನಿಯೋಜನೆ ಮಾರ್ಗದರ್ಶಿ](../chapter-02-ai-development/ai-model-deployment.md)** ಯನ್ನು ಉತ್ತಮ ಅಭ್ಯಾಸಗಳಿಗೆ ಪರಿಶೀಲಿಸಿ
2. **[ಉತ್ಪಾದನೆ AI ಅಭ್ಯಾಸಗಳು](../chapter-08-production/production-ai-practices.md)** ಅನ್ನು ಸಂಪೂರ್ಣಗೊಳಿಸಿ ಸಂಸ್ಥೆಗಳಿಗೆ ಸಿದ್ಧ ಪರಿಹಾರಗಳಿಗೆ
3. **[Microsoft Foundry Discord](https://aka.ms/foundry/discord)** ನಲ್ಲಿ ಸಮುದಾಯ ಬೆಂಬಲಕ್ಕೆ ಸೇರಿ
4. **ಸಮಸ್ಯೆಗಳು ಇದ್ದರೆ [ಆಜಡ್ GitHub ಸಂಗ್ರಹಸ್ಥಳ](https://github.com/Azure/azure-dev) ಗೆ ಕೊಡುಗೆ ನೀಡಿ**

## ಸಂಪನ್ಮೂಲಗಳು

- [Microsoft Foundry ಮಾದರಿಗಳು ಸೇವೆ ಸಮಸ್ಯೆ ಪತ್ತೆ](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [ಕಂಟೈನರ್ ಅಪ್ಸ್ ಸಮಸ್ಯೆ ಪತ್ತೆ](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI ಹುಡುಕಾಟ ಸಮಸ್ಯೆ ಪತ್ತೆ](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure ಡಯಾಗ್ನೋಸ್ಟಿಕ್ಸ್ ಏಜೆಂಟ್ ಸ್ಕಿಲ್**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - ನಿಮ್ಮ ಸಂಪಾದಕದಲ್ಲಿ Azure ಸಮಸ್ಯೆ ಪತ್ತೆ ಸ್ಕಿಲ್ಸ್ ಇನ್‌ಸ್ಟಾಲ್ ಮಾಡಲು: `npx skills add microsoft/github-copilot-for-azure`

---

**ಅಧ್ಯಾಯ ನಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [ಆಜಡ್ ಶುರುವಾತಿಗಾಗಿ](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 7 - ಸಮಸ್ಯೆ ಪತ್ತೆ ಹಾಗೂ ಡಿಬಗಿನಿಂಗ್
- **⬅️ ಹಿಂದಿನದು**: [ಡಿಬಗಿನಿಂಗ್ ಮಾರ್ಗದರ್ಶಿ](debugging.md)
- **➡️ ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 8: ಉತ್ಪಾದನೆ ಮತ್ತು ಸಂಸ್ಥೆ ಮಾದರಿಗಳು](../chapter-08-production/production-ai-practices.md)
- **🤖 ಸಂಬಂಧಿತ**: [ಅಧ್ಯಾಯ 2: AI-ಪ್ರಥಮ ಅಭಿವೃದ್ಧಿ](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 ಉಲ್ಲೇಖ**: [Azure ಡೆವಲಪರ್ CLI ಸಮಸ್ಯೆ ಪತ್ತೆ](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ಪಷ್ಟತಾ ಘೋಷಣೆ**:
ಈ ದਸਤಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವದಿಸಲಾಗಿದೆ. ನಾವು ಖಚಿತತೆಯನ್ನಾಗಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತೇವೆ, ಆದರೆ ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ತಪ್ಪುಗಳಿರಬಹುದು ಎಂಬುದನ್ನು ದಯವಿಟ್ಟು ಗಮನದಲ್ಲಿಡಿ. ಮೂಲ ದಸ್ತಾವೇಜನ್ನು ಅದರ ಸ್ವದೇಶಿ ಭಾಷೆಯಲ್ಲಿ ಪ್ರಾಮಾಣಿಕ ಸೂತ್ರವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದ ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದ ಬಳಕೆ ನಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ಅರ್ಥಪರಿವರ್ತನೆಗಳು ಅಥವಾ ತಪ್ಪು ಅರ್ಥಮಾಡಿಕೊಡುತ್ತಿರುವುದಕ್ಕೆ ನಾವು ಹೊಣೆಗಾರರಾಗಿರುವುದಿಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->