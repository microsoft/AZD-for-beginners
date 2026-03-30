# AI-ನಿರ್ದಿಷ್ಟ ಸಮಸ್ಯೆ ಪರಿಹಾರ ಮಾರ್ಗದರ್ಶಿ

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD ಆರಂಭಿಕರಿಗೆ](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 7 - ಸಮಸ್ಯೆ ಪರಿಹಾರ ಮತ್ತು ಡಿಬಗಿಂಗ್
- **⬅️ ಹಿಂದಿನ**: [ಡಿಬಗಿಂಗ್ ಮಾರ್ಗದರ್ಶಿ](debugging.md)
- **➡️ ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 8: ಉತ್ಪಾದನೆ ಮತ್ತು ಎಂಟರ್‌ಪ್ರೈಸ್ ಮಾದರಿಗಳು](../chapter-08-production/production-ai-practices.md)
- **🤖 ಸಂಬಂಧಿಸಿದ**: [ಅಧ್ಯಾಯ 2: AI-ಪ್ರಥಮ ಅಭಿವೃದ್ಧಿ](../chapter-02-ai-development/microsoft-foundry-integration.md)

ಈ ಸಮಗ್ರ ಸಮಸ್ಯೆ ಪರಿಹಾರ ಮಾರ್ಗದರ್ಶಿ AZD ಬಳಸಿ AI ಪರಿಹಾರಗಳನ್ನು ನಿಯೋಜಿಸುವಾಗ ಎದುರಾಗುವ ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳನ್ನು ಕ್ರೋಢೀಕರಿಸಿ, Azure AI ಸೇವೆಗಳಿಗೆ ನಿರ್ದಿಷ್ಟವಾದ ಪರಿಹಾರಗಳು ಮತ್ತು ಡಿಬಗಿಂಗ್ ತಂತ್ರಗಳನ್ನು ಒದಗಿಸುತ್ತದೆ.

## ವಿಷಯ ಸೂಚಿ

- [Microsoft Foundry ಮಾದರಿ ಸೇವೆಯ ಸಮಸ್ಯೆಗಳು](#azure-openai-service-issues)
- [Azure AI ಹುಡುಕಾಟ ಸಮಸ್ಯೆಗಳು](#azure-ai-ಹುಡುಕಾಟ-ಸಮಸ್ಯೆಗಳು)
- [ಕಂಟೈನರ್ ಅಪ್ಸ್ ನಿಯೋಜನೆ ಸಮಸ್ಯೆಗಳು](#ಕಂಟೈನರ್-ಅಪ್ಸ್-ನಿಯೋಜನೆ-ಸಮಸ್ಯೆಗಳು)
- [ಪ್ರಾಮಾಣೀಕರಣ ಮತ್ತು ಅನುಮತಿ ದೋಷಗಳು](#ಪ್ರಾಮಾಣೀಕರಣ-ಮತ್ತು-ಅನುಮತಿ-ದೋಷಗಳು)
- [ಮಾದರಿ ನಿಯೋಜನೆ ವಿಫಲತೆಗಳು](#ಮಾದರಿ-ನಿಯೋಜನೆ-ವಿಫಲತೆಗಳು)
- [ಕಾರ್ಯಕ್ಷಮತೆ ಮತ್ತು ಸ್ಕೇಲಿಂಗ್ ಸಮಸ್ಯೆಗಳು](#ಕಾರ್ಯಕ್ಷಮತೆ-ಮತ್ತು-ಸ್ಕೇಲಿಂಗ್-ಸಮಸ್ಯೆಗಳು)
- [ಖರ್ಚು ಮತ್ತು ಕೊಟಾ ನಿರ್ವಹಣೆ](#ಖರ್ಚು-ಮತ್ತು-ಕೊಟಾ-ನಿರ್ವಹಣೆ)
- [ಡಿಬಗಿಂಗ್ ಸಾಧನಗಳು ಮತ್ತು ತಂತ್ರಗಳು](#ಡಿಬಗಿಂಗ್-ಸಾಧನಗಳು-ಮತ್ತು-ತಂತ್ರಗಳು)

## Microsoft Foundry ಮಾದರಿ ಸೇವೆಯ ಸಮಸ್ಯೆಗಳು

### ಸಮಸ್ಯೆ: OpenAI ಸೇವೆ ಪ್ರದೇಶದಲ್ಲಿ ಲಭ್ಯವಿಲ್ಲ

**ಲಕ್ಷಣಗಳು:**
```
Error: The requested resource type is not available in the location 'westus'
```

**ಕಾರಣಗಳು:**
- ಆಯ್ಕೆ ಮಾಡಲಾದ ಪ್ರದೇಶದಲ್ಲಿ Microsoft Foundry Models ಲಭ್ಯವಿಲ್ಲ
- ಆಯ್ಕೆಮಾಡಿದ ಪ್ರದೇಶಗಳಲ್ಲಿ ಕೊಟಾ ಮುಗಿದಿದೆ
- ಪ್ರಾದೇಶಿಕ ಸಾಮರ್ಥ್ಯದ ನಿರ್ಬಂಧಗಳು

**ಉಪಾಯಗಳು:**

1. **ಪ್ರದೇಶ ಲಭ್ಯತೆ ಪರಿಶೀಲಿಸಿ:**
```bash
# OpenAI ಗೆ ಲಭ್ಯವಿರುವ ಪ್ರದೇಶಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **AZD ಸಂರಚನೆಯನ್ನು ನವೀಕರಿಸಿ:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **ಭಿನ್ನ ಪ್ರದೇಶಗಳನ್ನು ಬಳಸಿ:**
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

### ಸಮಸ್ಯೆ: ಮಾದರಿ ನಿಯೋಜನೆ ಕೊಟಾ ಮೀರಿದೆ

**ಲಕ್ಷಣಗಳು:**
```
Error: Deployment failed due to insufficient quota
```

**ಉಪಾಯಗಳು:**

1. **ಪ್ರಸ್ತುತ ಕೊಟಾ ಪರಿಶೀಲಿಸಿ:**
```bash
# ಕೊಟಾ ಬಳಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **ಕೊಟಾ ವೃದ್ಧಿಯನ್ನು ವಿನಂತಿಸಿ:**
```bash
# ಕ್ವೋಟಾ ಹೆಚ್ಚಳಕ್ಕಾಗಿ ವಿನಂತಿಯನ್ನು ಸಲ್ಲಿಸಿ
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **ಮಾದರಿ ಸಾಮರ್ಥ್ಯವನ್ನು ಉನ್ನತಗೊಳಿಸಿ:**
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

### ಸಮಸ್ಯೆ: ಅಮಾನ್ಯ API ಆವೃತ್ತಿ

**ಲಕ್ಷಣಗಳು:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**ಉಪಾಯಗಳು:**

1. **ಬೆಂಬಲಿತ API ಆವೃತ್ತಿಯನ್ನು ಬಳಸಿರಿ:**
```python
# ಇತ್ತೀಚಿನ ಬೆಂಬಲಿತ ಆವೃತ್ತಿಯನ್ನು ಬಳಸಿ
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API ಆವೃತ್ತಿ ಹೊಂದಿಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ:**
```bash
# ಬೆಂಬಲಿಸಲಾದ API ಆವೃತ್ತಿಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI ಹುಡುಕಾಟ ಸಮಸ್ಯೆಗಳು

### ಸಮಸ್ಯೆ: ಸರ್ಚ್ ಸೇವೆಯ ಬೆಲೆಯ ಮಟ್ಟ ಅಸಮರ್ಪಕವಾಗಿದೆ

**ಲಕ್ಷಣಗಳು:**
```
Error: Semantic search requires Basic tier or higher
```

**ಉಪಾಯಗಳು:**

1. **ಬೆಲೆಯ ಮಟ್ಟವನ್ನು ಅಪ್‌ಗ್ರೇಡ್ ಮಾಡಿ:**
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

2. **ಸಾಮ್ಯಾಂಟಿಕ್ ಹುಡುಕಾಟ ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ (ವಿಕಸನ):**
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

**ಉಪಾಯಗಳು:**

1. **ಸರ್ಚ್ ಸೇವೆಯ ಕೀಲಿಗಳನ್ನು ಪರಿಶೀಲಿಸಿ:**
```bash
# ಶೋಧನಾ ಸೇವೆಯ ಆಡಳಿತ ಕೀಲಿಯನ್ನು ಪಡೆಯಿರಿ
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **ಇಂಡೆಕ್ಸ್ ಸ್ಕೆಮಾ ಪರಿಶೀಲಿಸಿ:**
```python
# ಸೂಚ್ಯಕ ಸ್ಕೀಮಾವನ್ನು ಪರಿಶೀಲಿಸಿ
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

## ಕಂಟೈನರ್ ಅಪ್ಸ್ ನಿಯೋಜನೆ ಸಮಸ್ಯೆಗಳು

### ಸಮಸ್ಯೆ: ಕಂಟೈನರ್ ಬಿಲ್ಡ್ ವಿಫಲತೆಗಳು

**ಲಕ್ಷಣಗಳು:**
```
Error: Failed to build container image
```

**ಉಪಾಯಗಳು:**

1. **Dockerfile ವ್ಯಾಕರಣ ಪರಿಶೀಲಿಸಿ:**
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

2. **ಆಶ್ರಿತತಗಳನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ:**
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
# main.py - ಆರೋಗ್ಯ ಪರಿಶೀಲನಾ ಎಂಡ್ಪಾಯಿಂಟ್ ಸೇರಿಸಿ
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### ಸಮಸ್ಯೆ: ಕಂಟೈನರ್ ಅಪ್ ಆರಂಭ ವೈಫಲ್ಯಗಳು

**ಲಕ್ಷಣಗಳು:**
```
Error: Container failed to start within timeout period
```

**ಉಪಾಯಗಳು:**

1. **ಆರಂಭಿಕ ಟೈಮೌಟ್ ಹೆಚ್ಚಿಸಿ:**
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

2. **ಮಾದರಿ ಲೋಡಿಂಗ್ ಅನ್ನು.optಿಮೈಸ್ ಮಾಡಿ:**
```python
# ಪ್ರಾರಂಭ ಸಮಯವನ್ನು ಕಡಿಮೆ ಮಾಡಲು ಮಾದರಿಗಳನ್ನು ಆಲಸ್ಯವಾಗಿ ಲೋಡ್ ಮಾಡಿ
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
        # ಇಲ್ಲಿ ಎಐ ಕ್ಲೈಂಟ್ ಅನ್ನು ಪ್ರಾರಂಭಿಸಿ
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

## ಪ್ರಾಮಾಣೀಕರಣ ಮತ್ತು ಅನುಮತಿ ದೋಷಗಳು

### ಸಮಸ್ಯೆ: Managed Identity ಅನುಮತಿ ನಿರಾಕರಿಸಲಾಗಿದೆ

**ಲಕ್ಷಣಗಳು:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**ಉಪಾಯಗಳು:**

1. **ಪಾತ್ರ ನಿಯೋಜನೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ:**
```bash
# ಪ್ರಸ್ತುೕತ ಪಾತ್ರ ನಿಯೋಜನೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **ಅವಶ್ಯಕ ಪಾತ್ರಗಳನ್ನು ನಿಯೋಜಿಸಿ:**
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
# ನಿರ್ವಹಿತ ಐಡೆಂಟಿಟಿ ಪ್ರಮಾಣೀಕರಣವನ್ನು ಪರೀಕ್ಷಿಸಿ
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

### ಸಮಸ್ಯೆ: Key Vault ಪ್ರವೇಶ ನಿರಾಕರಿಸಲಾಗಿದೆ

**ಲಕ್ಷಣಗಳು:**
```
Error: The user, group or application does not have secrets get permission
```

**ಉಪಾಯಗಳು:**

1. **Key Vault ಅನುಮತಿಗಳನ್ನು ಮಂಜೂರು ಮಾಡಿ:**
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

2. **Access Policies ಬದಲು RBAC ಬಳಸಿ:**
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

**ಉಪಾಯಗಳು:**

1. **ಲಭ್ಯವಿರುವ ಮಾದರಿಗಳನ್ನು ಪರಿಶೀಲಿಸಿ:**
```bash
# ಲಭ್ಯವಿರುವ ಮಾದರಿಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **ಮಾದರಿFallbacks ಬಳಸಿರಿ:**
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

3. **ನಿಯೋಜನೆಯ ಮೊದಲು ಮಾದರಿಯನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ:**
```python
# ವಿತರಣೆಗೆ ಮೊದಲು ಮಾದರಿಯ ಮಾನ್ಯತೆ
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

## ಕಾರ್ಯಕ್ಷಮತೆ ಮತ್ತು ಸ್ಕೇಲಿಂಗ್ ಸಮಸ್ಯೆಗಳು

### ಸಮಸ್ಯೆ: ಉನ್ನತ ವಿಳಂಬದ ಪ್ರತಿಕ್ರಿಯೆಗಳು

**ಲಕ್ಷಣಗಳು:**
- ಪ್ರತಿಕ್ರಿಯೆ ಸಮಯಗಳು > 30 ಸೆಕೆಂಡುಗಳು
- ಟೈಮ್‌ಔಟ್ ದೋಷಗಳು
- ಕೆಟ್ಟ ಬಳಕೆದಾರ ಅನುಭವ

**ಉಪಾಯಗಳು:**

1. **ವಿನಂತಿ ಟೈಮ್‌ಔಟ್‌ಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ:**
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

2. **ಪ್ರತಿಕ್ರಿಯೆ ಕ್ಯಾಶಿಂಗ್ ಸೇರಿಸಿ:**
```python
# ಪ್ರತ್ಯುತ್ತರಗಳಿಗೆ Redis ಕ್ಯಾಶೆ
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

3. **ಆಟೋ-ಸ್ಕೇಲಿಂಗ್ ಸಂರಚಿಸಿ:**
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

### ಸಮಸ್ಯೆ: ಮೆಮೊರಿ ಮುಗಿಯುವ ದೋಷಗಳು

**ಲಕ್ಷಣಗಳು:**
```
Error: Container killed due to memory limit exceeded
```

**ಉಪಾಯಗಳು:**

1. **ಮೆಮೊರಿ ಪಡಿತ ಹೆಚ್ಚಿಸಿ:**
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

2. **ಮೆಮೊರಿ ಬಳಕೆಯನ್ನು ಉನ್ನತಗೊಳಿಸಿ:**
```python
# ಸ್ಮೃತಿ ಕಾರ್ಯಕ್ಷಮ ಮಾದರಿ ನಿರ್ವಹಣೆ
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # ಪ್ರಕ್ರಿಯೆ ಪ್ರಾರಂಭಿಸುವ ಮೊದಲು ಸ್ಮೃತಿ ಬಳಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # ಗಾರ್ಬೇಜ್ ಕಲೆಕ್ಷನ್ ಅನ್ನು ಬಲವಂತವಾಗಿ ನಡೆಸಿ
            
        result = await self._process_ai_request(request)
        
        # ಪ್ರಕ್ರಿಯೆಯ ನಂತರ ಸ್ವಚ್ಛಗೊಳಿಸಿ
        gc.collect()
        return result
```

## ಖರ್ಚು ಮತ್ತು ಕೊಟಾ ನಿರ್ವಹಣೆ

### ಸಮಸ್ಯೆ: ಅನಿರೀಕ್ಷಿತ ಹೆಚ್ಚಿನ ವೆಚ್ಚಗಳು

**ಲಕ್ಷಣಗಳು:**
- ನಿರೀಕ್ಷೆಗಿಂತ ಹೆಚ್ಚಾದ Azure ಬಿಲ್
- ಟೋಕನ್ ಬಳಕೆ ಅಂದಾಜಿಗಿಂತ ಹೆಚ್ಚಾಗಿದೆ
- ಬಜೆಟ್ ಎಚ್ಚರಿಕೆಗಳು ಚಾಲನೆಯಲ್ಲಿವೆ

**ಉಪಾಯಗಳು:**

1. **ಖರ್ಚು ನಿಯಂತ್ರಣಗಳನ್ನು ಜಾರಿಗೆ ತರುವುದನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ:**
```python
# ಟೋಕನ್ ಬಳಕೆ ಅನುಸರಣೆ
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

2. **ಖರ್ಚು ಎಚ್ಚರಿಕೆಗಳನ್ನು ಹೊಂದಿಸಿ:**
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

3. **ಮಾದರಿ ಆಯ್ಕೆಗಳನ್ನು ಉನ್ನತಗೊಳಿಸಿ:**
```python
# ಖರ್ಚನ್ನು ಗಮನಿಸುವ ಮಾದರಿ ಆಯ್ಕೆ
MODEL_COSTS = {
    'gpt-4.1-mini': 0.00015,  # ಪ್ರತಿ 1K ಟೋಕನ್ಗಳಿಗೆ
    'gpt-4.1': 0.03,          # ಪ್ರತಿ 1K ಟೋಕನ್ಗಳಿಗೆ
    'gpt-35-turbo': 0.0015  # ಪ್ರತಿ 1K ಟೋಕನ್ಗಳಿಗೆ
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

## ಡಿಬಗಿಂಗ್ ಸಾಧನಗಳು ಮತ್ತು ತಂತ್ರಗಳು

### AZD ಡಿಬಗಿಂಗ್ ಆಜ್ಞೆಗಳು

```bash
# ವಿಸ್ತೃತ ಲಾಗಿಂಗ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
azd up --debug

# ಡಿಪ್ಲಾಯ್ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd show

# ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ (ನಿರೀಕ್ಷಣಾ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ ತೆರೆಯುತ್ತದೆ)
azd monitor --logs

# ಲೈವ್ ಮೆಟ್ರಿಕ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd monitor --live

# ಪರಿಸರ ಚರಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
azd env get-values
```

### AZD AI ವಿಸ್ತರಣೆ ಆಜ್ಞೆಗಳು ಡಯಾಗ್ನೋಸ್ಟಿಕ್ಸ್ ಗಾಗಿ

ನೀವು `azd ai agent init` ಬಳಸಿ ಏಜೆಂಟ್‌ಗಳನ್ನು ನಿಯೋಜಿಸಿದರೆ, ಈ ಹೆಚ್ಚುವರಿ ಸಾಧನಗಳು ಲಭ್ಯವಿರುತ್ತವೆ:

```bash
# ಏಜೆಂಟ್ಸ್ ವಿಸ್ತರಣೆ ಸ್ಥಾಪಿಸಲಾಗಿದೆ ಎಂದು ಖಚಿತಪಡಿಸಿಕೊಳ್ಳಿ
azd extension install azure.ai.agents

# ಮ್ಯಾನಿಫೆಸ್ಟ್‌ನಿಂದ ಏಜೆಂಟನ್ನು ಮರುಆರಂಭಿಸಿ ಅಥವಾ ನವೀಕರಿಸಿ
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ಎಐ ಉಪಕರಣಗಳಿಗೆ ಪ್ರಾಜೆಕ್ಟಿನ ಸ್ಥಿತಿಯನ್ನು ವಿಚಾರಿಸಲು MCP ಸರ್ವರ್ ಅನ್ನು ಬಳಸಿ
azd mcp start

# ಪರಿಶೀಲನೆ ಮತ್ತು ಲೆಕ್ಕಪರಿಶೀಲನೆಗಾಗಿ ಮೂಲಸೌಕರ್ಯ ಕಡತಗಳನ್ನು ರಚಿಸಿ
azd infra generate
```

> **ಸಲಹೆ:** `azd infra generate` ಅನ್ನು ಬಳಸಿ IaC ಅನ್ನು ಡಿಸ್ಕ್‌ಗೆ ಬರೆಯಿರಿ যাতে ನೀವು ನಿಖರವಾಗಿ ಯಾವ ಸಂಪನ್ಮೂಲಗಳು provision ಮಾಡಲ್ಪಟ್ಟವೆಂದು ಪರಿಶೀಲಿಸಬಹುದು. ಇದು ಸಂಪನ್ಮೂಲ ಸಂರಚನೆ ಸಮಸ್ಯೆಗಳನ್ನು ಡಿಬಗ್ ಮಾಡುವಾಗ ಅಮೂಲ್ಯವಾಗಿದೆ. ಸಂಪೂರ್ಣ ವಿವರಗಳಿಗೆ [AZD AI CLI ರೆಫರೆನ್ಸ್](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) ನೋಡಿ.

### ಅಪ್ಲಿಕೇಶನ್ ಡಿಬಗಿಂಗ್

1. **ಸಂರಚಿತ ಲಾಗಿಂಗ್:**
```python
import logging
import json

# AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗಾಗಿ ಸಂರಚಿತ ಲಾಗಿಂಗ್ ಅನ್ನು ಸಂರಚಿಸಿ
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

2. **ಆರೋಗ್ಯ ಪರಿಶೀಲನಾ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳು:**
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

3. **ಕಾರ್ಯಕ್ಷಮತೆ ಮೇಲ್ವಿಚಾರಣೆ:**
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
| 401 | ಅನಧಿಕೃತ | API ಕೀಗಳು ಮತ್ತು Managed Identity ಸಂರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ |
| 403 | ನಿರ್ಬಂಧಿಸಲಾಗಿದೆ | RBAC ಪಾತ್ರ ನಿಯೋಜನೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ |
| 429 | ರೇಟ್ ಮಿತಿಗೊಳಿಸಿದೆ | ಮರುಪ್ರಯತ್ನ ಲಾಜಿಕ್ ಅನ್ನು ಏರಿಹೋಗುವ ಹಿಂತಿರುಗುವ (exponential backoff) ಮೂಲಕ ಅನುಷ್ಠಾನಗೊಳಿಸಿ |
| 500 | ಇಂಟರ್ನಲ್ ಸರ್ವರ್ ದೋಷ | ಮಾದರಿ ನಿಯೋಜನೆ ಸ್ಥಿತಿಯನ್ನು ಮತ್ತು ಲಾಗ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ |
| 503 | ಸೇವೆ ಲಭ್ಯವಿಲ್ಲ | ಸೇವೆಯ ಆರೋಗ್ಯ ಮತ್ತು ಪ್ರಾದೇಶಿಕ ಲಭ್ಯತೆಯನ್ನು ಪರಿಶೀಲಿಸಿ |

## ಮುಂದಿನ ಕ್ರಮಗಳು

1. **ನಿಯೋಜನೆ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳಿಗಾಗಿ [AI ಮಾದರಿ ನಿಯೋಜನೆ ಮಾರ್ಗದರ್ಶಿ](../chapter-02-ai-development/ai-model-deployment.md) ಪರಿಶೀಲಿಸಿ**
2. **ಎಂಟರ್‌ಪ್ರೈಸ್-ಸಿದ್ಧ ಪರಿಹಾರಗಳಿಗೆ [ಉತ್ಪಾದನಾ AI ಅಭ್ಯಾಸಗಳು](../chapter-08-production/production-ai-practices.md) ಪೂರ್ಣಗೊಳಿಸಿ**
3. **ಸಮುದಾಯ ಬೆಂಬಲಕ್ಕಾಗಿ [Microsoft Foundry Discord](https://aka.ms/foundry/discord) ಸೇರಿ**
4. **AZD-ಸಂಬಂಧಿತ ಸಮಸ್ಯೆಗಳಿಗೆ ಸಮಸ್ಯೆಗಳನ್ನು ಸಲ್ಲಿಸಲು [AZD GitHub repository](https://github.com/Azure/azure-dev) ಬಳಸಿ**

## ಸಂಪನ್ಮೂಲಗಳು

- [Microsoft Foundry ಮಾದರಿ ಸೇವೆ ಸಮಸ್ಯೆಗಳ ಪರಿಹಾರ](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps ಸಮಸ್ಯೆ ಪರಿಹಾರ](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI ಹುಡುಕಾಟ ಸಮಸ್ಯೆ ಪರಿಹಾರ](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - ನಿಮ್ಮ ಸಂಪಾದಕದಲ್ಲಿ Azure ಸಮಸ್ಯೆ ಪರಿಹಾರ ಕೌಶಲ್ಯಗಳನ್ನು ಸ್ಥಾಪಿಸಿ: `npx skills add microsoft/github-copilot-for-azure`

---

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD ಆರಂಭಿಕರಿಗೆ](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 7 - ಸಮಸ್ಯೆ ಪರಿಹಾರ ಮತ್ತು ಡಿಬಗಿಂಗ್
- **⬅️ ಹಿಂದಿನ**: [ಡಿಬಗಿಂಗ್ ಮಾರ್ಗದರ್ಶಿ](debugging.md)
- **➡️ ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 8: ಉತ್ಪಾದನೆ ಮತ್ತು ಎಂಟರ್‌ಪ್ರೈಸ್ ಮಾದರಿಗಳು](../chapter-08-production/production-ai-practices.md)
- **🤖 ಸಂಬಂಧಿಸಿದ**: [ಅಧ್ಯಾಯ 2: AI-ಪ್ರಥಮ ಅಭಿವೃದ್ಧಿ](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 ಸಂದರ್ಭ**: [Azure Developer CLI Troubleshooting](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ನಿರಾಕರಣೆ**:
ಈ ದಸ್ತಾವೇಜನ್ನು AI ಭಾಷಾಂತರ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿಕೊಂಡು ಭಾಷಾಂತರಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸಿದರೂ, ಸ್ವಯಂಚಾಲಿತ ಭಾಷಾಂತರಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸೂಕ್ತತೆಗಳು ಇರಬಹುದೆಂದು ದಯವಿಟ್ಟು ಗಮನಿಸಿ. ಮೂಲದ ಭಾಷೆಯಲ್ಲಿ ಇರುವ ಮೂಲ ದಸ್ತಾವೇಜನ್ನು ಅಧಿಕೃತ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಗಂಭೀರ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಭಾಷಾಂತರವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಭಾಷಾಂತರದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗರ್ಭಿತತೆಗಳು ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳಿಗೆ ನಾವು ಜವಾಬ್ದಾರಿಯಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->