# មគ្គុទេសក៍ដោះស្រាយបញ្ហា AI ជាក់លាក់

**ការរុករកជំពូក៖**
- **📚 ទំព័រដើមវគ្គសិក្សា**៖ [AZD សម្រាប់អ្នកដំណើរកំសាន្តថ្មី](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**៖ ជំពូក 7 - ការដោះស្រាយបញ្ហា និងការបញ្ចូលកូដ
- **⬅️ មុននេះ**៖ [មគ្គុទេសក៍បញ្ចូលកូដ](debugging.md)
- **➡️ ជំពូកបន្ទាប់**៖ [ជំពូក 8៖ លំនាំផលិតកម្ម និងសហគ្រាស](../chapter-08-production/production-ai-practices.md)
- **🤖 ពាក់ព័ន្ធ**៖ [ជំពូក 2៖ ការអភិវឌ្ឍ AI ជា​លើកដំបូង](../chapter-02-ai-development/microsoft-foundry-integration.md)

មគ្គុទេសក៍ដោះស្រាយបញ្ហាទាំងនេះគឺដើម្បីដោះស្រាយបញ្ហាទូទៅពេលដាក់ពាក្យប្រើបច្ចេកវិទ្យា AI ជាមួយ AZD ដោយផ្តល់ដំណោះស្រាយ និងបច្ចេកទេសបញ្ចូលកូដជាក់លាក់សម្រាប់សេវាកម្ម Azure AI។

## តារាងមាតិកា

- [បញ្ហាសេវាកម្ម Microsoft Foundry Models](#azure-openai-service-issues)
- [បញ្ហាស្វែងរក Azure AI](#បញ្ហាស្វែងរក-azure-ai)
- [បញ្ហាដាក់ពាក្យប្រើ Container Apps](#បញ្ហាដាក់ពាក្យប្រើ-container-apps)
- [បញ្ហាអត្រព័ត៌មាន និងការអនុញ្ញាត](#បញ្ហាអត្រព័ត៌មាន-និងការអនុញ្ញាត)
- [បញ្ហាដាក់ពាក្យប្រើម៉ូដែល](#បញ្ហាដាក់ពាក្យម៉ូដែល)
- [បញ្ហាការសមិទ្ធផល និងការវាស់វែង](#បញ្ហាការសមិទ្ធផល-និងការវាស់វែង)
- [ការគ្រប់គ្រងថ្លៃកម្រៃ និងកំណត់នៅ](#ការគ្រប់គ្រងថ្លៃកម្រៃ-និងកំណត់នៅ)
- [ឧបករណ៍ និង​បច្ចេកទេស​បញ្ចូលកូដ](#ឧបករណ៍-និង​បច្ចេកទេស​បញ្ចូលកូដ)

## បញ្ហាសេវាកម្ម Microsoft Foundry Models

### បញ្ហា៖ សេវា OpenAI មិនអាចប្រើប្រាស់បាននៅតំបន់

**អាការៈសញ្ញា៖**
```
Error: The requested resource type is not available in the location 'westus'
```

**មូលហេតុ៖**
- Microsoft Foundry Models មិនមាននៅតំបន់ដែលបានជ្រើស
- កំណត់ទំហំគណនាមានពេញនៅតំបន់ចូលចិត្ត
- ហានិភ័យកំណត់សមត្ថភាពតំបន់

**ដំណោះស្រាយ៖**

1. **ពិនិត្យកំហុសមាននៅតំបន់៖**
```bash
# បញ្ជីតំបន់ដែលមានសម្រាប់ OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **ធ្វើបច្ចុប្បន្នភាពកំណត់ AZD៖**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **ប្រើតំបន់ជំនួស៖**
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

### បញ្ហា៖ កំណត់សមត្ថភាពដាក់ពាក្យម៉ូដែលលើស

**អាការៈសញ្ញា៖**
```
Error: Deployment failed due to insufficient quota
```

**ដំណោះស្រាយ៖**

1. **ពិនិត្យកំណត់សមត្ថភាពបច្ចុប្បន្ន៖**
```bash
# ពិនិត្យការប្រើប្រាស់គុណតារា
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **ស្នើសុំបន្ថែមកំណត់សមត្ថភាព៖**
```bash
# ស្នើសុំបន្ថែមកំណត់បរិមាណ
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **បង្កើនសមត្ថភាពម៉ូដែល៖**
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

### បញ្ហា៖ កំណែ API មិនត្រឹមត្រូវ

**អាការៈសញ្ញា៖**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**ដំណោះស្រាយ៖**

1. **ប្រើកំណែ API ដែលគាំទ្រ៖**
```python
# ប្រើកំណែដែលបានគាំទ្រថ្មីបំផុត
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **ពិនិត្យផ្គូផ្គងកំណែ API៖**
```bash
# បញ្ជី​ចំណាត់ថ្នាក់ API ដែលគាំទ្រ
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## បញ្ហាស្វែងរក Azure AI

### បញ្ហា៖ ជំពូកតម្លៃសេវាស្វែងរកមិនគ្រប់គ្រាន់

**អាការៈសញ្ញា៖**
```
Error: Semantic search requires Basic tier or higher
```

**ដំណោះស្រាយ៖**

1. **បន្ថែមជំពូកតម្លៃ៖**
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

2. **បិទស្វែងរក Semantic (ការអភិវឌ្ឍន៍):**
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

### បញ្ហា៖ បរាជ័យបង្កើតនៅឌីនដែក្រ

**អាការៈសញ្ញា៖**
```
Error: Cannot create index, insufficient permissions
```

**ដំណោះស្រាយ៖**

1. **ផ្ទៀងផ្ទាត់កូនសោសេវាស្វែងរក៖**
```bash
# ទទួលបានកូនសោរគ្រប់គ្រងសេវាស្វែងរក
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **ពិនិត្យស្កីម៉ាស៊ីនតាបារៈឌីនដែក្រ៖**
```python
# ធ្វើការត្រួតពិនិត្យសេដ្ឋកិច្ចសន្ទស្សន៍
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

3. **ប្រើអត្តសញ្ញាណគ្រប់គ្រង៖**
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

## បញ្ហាដាក់ពាក្យប្រើ Container Apps

### បញ្ហា៖ បរាជ័យបង្កើត Container

**អាការៈសញ្ញា៖**
```
Error: Failed to build container image
```

**ដំណោះស្រាយ៖**

1. **ពិនិត្យវាក្យសម្ពន្ធ Dockerfile៖**
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

2. **ផ្ទៀងផ្ទាត់អាស្រ័យភាព៖**
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

3. **បន្ថែមការត្រួតពិនិត្យសុខភាព៖**
```python
# main.py - បន្ថែមចំណុចចូលសម្រាប់ត្រួតពិនិត្យសុខភាព
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### បញ្ហា៖ បរាជ័យចាប់ផ្តើម Container App

**អាការៈសញ្ញា៖**
```
Error: Container failed to start within timeout period
```

**ដំណោះស្រាយ៖**

1. **បន្ថែមពេលរង់ចាំចាប់ផ្តើម៖**
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

2. **បង្កើនប្រសិទ្ធភាពបញ្ចូលម៉ូដែល៖**
```python
# ដំណើរការជាលazy load ម៉ូដែល ដើម្បីកាត់បន្ថយពេលវេលាដំណើរការ
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
        # ចាប់ផ្តើមកម្មវិធី AI client នៅទីនេះ
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # ចាប់ផ្តើម
    app.state.model_manager = ModelManager()
    yield
    # ការបិទកម្មវិធី
    pass

app = FastAPI(lifespan=lifespan)
```

## បញ្ហាអត្រព័ត៌មាន និងការអនុញ្ញាត

### បញ្ហា៖ អន្ដរាយសិទ្ធិអត្តសញ្ញាណគ្រប់គ្រង

**អាការៈសញ្ញា៖**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**ដំណោះស្រាយ៖**

1. **ផ្ទៀងផ្ទាត់ការចាត់តួនាទី៖**
```bash
# ពិនិត្យការចាត់តាំងតួនាទីបច្ចុប្បន្ន
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **ផ្ដល់តួនាទីដែលត្រូវការ៖**
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

3. **សាកល្បងការផ្ទៀងផ្ទាត់៖**
```python
# សាកល្បងការផ្ទៀងផ្ទាត់អត្តសញ្ញាណគ្រប់គ្រង
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

### បញ្ហា៖ មិនអាចចូលដល់ Key Vault

**អាការៈសញ្ញា៖**
```
Error: The user, group or application does not have secrets get permission
```

**ដំណោះស្រាយ៖**

1. **ផ្ដល់សិទ្ធិក្នុង Key Vault៖**
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

2. **ប្រើ RBAC មិនមែននយោបាយចូលដំណើរការ៖**
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

## បញ្ហាដាក់ពាក្យម៉ូដែល

### បញ្ហា៖ កំណែម៉ូដែលមិនអាចប្រើបាន

**អាការៈសញ្ញា៖**
```
Error: Model version 'gpt-4-32k' is not available
```

**ដំណោះស្រាយ៖**

1. **ពិនិត្យម៉ូដែលដែលមាន៖**
```bash
# បញ្ជីម៉ូឌែលដែលមានស្រាប់
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **ប្រើម៉ូដែលជំនួស៖**
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

3. **ផ្ទៀងផ្ទាត់ម៉ូដែលមុនដាក់ពាក្យប្រើ៖**
```python
# ការផ្ទៀងផ្ទាត់ម៉ូដែលមុនការចេញផ្សាយ
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

## បញ្ហាការសមិទ្ធផល និងការវាស់វែង

### បញ្ហា៖ ពេលឆ្លើយតបយឺតខ្លាំង

**អាការៈសញ្ញា៖**
- ពេលឆ្លើយតប > ៣០ វិនាទី
- បញ្ហា Timeout
- បទពិសោធន៍អ្នកប្រើប្រាស់អន់

**ដំណោះស្រាយ៖**

1. **អនុវត្តពេលកំណត់សំណើរ៖**
```python
# កំណត់ពេលវេលាចុងក្រោយឲ្យត្រឹមត្រូវ
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

2. **បន្ថែមការផ្ទុកផ្ទុកការឆ្លើយតប៖**
```python
# ការបម្រុងទុក Redis សម្រាប់ចម្លើយ
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

3. **កំណត់ការលំនាំស្វ័យប្រវត្តិ៖**
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

### បញ្ហា៖ បរាជ័យដោយមានកំហុសចំពោះអង្គចងចាំ

**អាការៈសញ្ញា៖**
```
Error: Container killed due to memory limit exceeded
```

**ដំណោះស្រាយ៖**

1. **បន្ថែមការចំណាយអង្គចងចាំ៖**
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

2. **បង្កើនប្រសិទ្ធភាពប្រើប្រាស់អង្គចងចាំ៖**
```python
# ការគ្រប់គ្រងម៉ូដែលដែលប្រើប្រាស់អង្គចងចាំបានប្រសើរ
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # ពិនិត្យការប្រើប្រាស់អង្គចងចាំមុនពេលដំណើរការ
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # បង្ខំការប្រមូលសំរាម
            
        result = await self._process_ai_request(request)
        
        # សម្អាតបន្ទាប់ពីដំណើរការ
        gc.collect()
        return result
```

## ការគ្រប់គ្រងថ្លៃកម្រៃ និងកំណត់នៅ

### បញ្ហា៖ ថ្លៃកម្រៃខ្ពស់មិនរំពឹងទុក

**អាការៈសញ្ញា៖**
- វិញ្ញាបនប័ត្រអាជីវកម្ម Azure ខ្ពស់ជាងការរំពឹងទុក
- ការប្រើប្រាស់សញ្ញាហៅលើសការប៉ាន់ស្មាន
- សញ្ញាផ្អែកថ្មើរជើងថវិកា

**ដំណោះស្រាយ៖**

1. **អនុវត្តការគ្រប់គ្រងថ្លៃកម្រៃ៖**
```python
# ការតាមដានការប្រើប្រាស់សញ្ញា
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

2. **កំណត់សញ្ញាថ្លៃកម្រៃ៖**
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

3. **បង្កើតការជ្រើសរើសម៉ូដែលមានប្រសិទ្ធភាព៖**
```python
# ការជ្រើសរើសម៉ូឌែលដែលយកថ្លៃដើមជាជំន្
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

## ឧបករណ៍ និង​បច្ចេកទេស​បញ្ចូលកូដ

### ពាក្យបញ្ជាដោះស្រាយបញ្ហា AZD

```bash
# បើកការចុះបញ្ជីលម្អិត
azd up --debug

# ពិនិត្យสถานភាពការដាក់បញ្ចូល
azd show

# មើលកំណត់ហេតុនៃកម្មវិធី (បើកផ្ទាំងគ្រប់គ្រងការត្រួតពិនិត្យ)
azd monitor --logs

# មើលខ្សែវាស់ស្ទង់ផ្ទាល់
azd monitor --live

# ពិនិត្យអថេរបរិយាកាស
azd env get-values
```

### ពាក្យបញ្ជាពង្រីក AZD AI សម្រាប់វាស់វែង

បើអ្នកបានដាក់ពាក្យប្រើភ្នាក់ងារដោយប្រើ `azd ai agent init` ឧបករណ៍បន្ថែមទាំងនេះអាចប្រើបាន៖

```bash
# ធានាថាអ្នកបន្ថែមភ្នាក់ងារត្រូវបានដំឡើង
azd extension install azure.ai.agents

# បញ្ចូលឡើងវិញ ឬធ្វើបច្ចុប្បន្នភាពភ្នាក់ងារពីបញ្ជីបង្ហាញ
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ប្រើម៉ាស៊ីន​បម្រើ MCP ដើម្បីអនុញ្ញាតឱ្យឧបករណ៍ AI សុំស្ថានភាពគម្រោង
azd mcp start

# បង្កើតឯកសារអាគារសម្ព័ន្ធសម្រាប់ការត្រួតពិនិត្យ និងឧត្តមករ
azd infra generate
```

> **គន្លឹះ៖** ប្រើ `azd infra generate` ដើម្បីសរសេរ IaC ចូលក្នុងឯកសារ ដើម្បីអាចពិនិត្យមើលបានពិតប្រាកដថាមធ្យោបាយអ្វីខ្លះត្រូវបានផ្គុំឡើង។ វាមានតម្លៃខ្លាំងពេលបញ្ចូលកូដសម្រាប់កំណត់រចនាសម្ព័ន្ធធនធាន។ សូមមើល [យោង CLI AZD AI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) សម្រាប់ព័ត៌មានលម្អិត។

### ការបញ្ចូលកូដកម្មវិធី

1. **កំណត់កំណត់កាលបរិច្ឆេទជាស្គ្រីប៖**
```python
import logging
import json

# កំណត់កាតព្វកិច្ចកំណត់ហេតុសម្រាប់កម្មវិធី AI
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

2. **ច្រកត្រួតពិនិត្យសុខភាព៖**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # ពិនិត្យការតភ្ជាប់ OpenAI
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # ពិនិត្យសេវាកម្មស្វែងរក
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

3. **តាមដានសមត្ថភាព៖**
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

## លេខកូដកំហុសទូទៅ និងដំណោះស្រាយ

| លេខកូដកំហុស | ការពិពណ៌នា | ដំណោះស្រាយ |
|------------|-------------|----------|
| 401 | មិនទទួលស្គាល់ | ពិនិត្យកូនសោ API និងការកំណត់អត្តសញ្ញាណគ្រប់គ្រង |
| 403 | បានធ្វើការពារ | ផ្ទៀងផ្ទាត់ការចាត់តួនាទី RBAC |
| 429 | កំណត់អត្រា | អនុវត្តលីចិចការព្យាយាមឡើងវិញជាមួយការពន្យារពេលពហុសន្ទះ |
| 500 | កំហុសម៉ាស៊ីនមេនៅក្នុង | ពិនិត្យស្ថានភាពដាក់ពាក្យម៉ូដែល និងកំណត់ហេតុ |
| 503 | សេវាមិនអាចប្រើបាន | ពិនិត្យសុខភាពសេវា និងមានសមត្ថភាពតំបន់ |

## ជំហានបន្ទាប់

1. **ពិនិត្យមើល [មគ្គុទេសក៍ដាក់ពាក្យអោយម៉ូដែល AI](../chapter-02-ai-development/ai-model-deployment.md)** សម្រាប់ការអនុវត្តល្អបំផុត
2. **បញ្ចប់ [វិធីសាស្ត្រផលិតកម្ម AI](../chapter-08-production/production-ai-practices.md)** សម្រាប់ដំណោះស្រាយដែលស្រាបស្រួលសម្រាប់សហគ្រាស
3. **ចូលរួម [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** សម្រាប់ការគាំទ្រសហគមន៍
4. **ដាក់ប្រតិភូបញ្ហា** ទៅកាន់ [ឃុបកូដ AZD នៅ GitHub](https://github.com/Azure/azure-dev) សម្រាប់បញ្ហាជាក់លាក់នៃ AZD

## ធនធាន

- [ការដោះស្រាយបញ្ហាសេវាកម្ម Microsoft Foundry Models](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [ការដោះស្រាយបញ្ហា Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [ការដោះស្រាយបញ្ហា Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**ជំនាញភ្នាក់ងារ Azure Diagnostics**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - ដំឡើងជំនាញដោះស្រាយបញ្ហា Azure នៅកន្លែងកែសម្រួលរបស់អ្នក៖ `npx skills add microsoft/github-copilot-for-azure`

---

**ការរុករកជំពូក៖**
- **📚 ទំព័រដើមវគ្គសិក្សា**៖ [AZD សម្រាប់អ្នកដំណើរកំសាន្តថ្មី](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**៖ ជំពូក 7 - ការដោះស្រាយបញ្ហា និងការបញ្ចូលកូដ
- **⬅️ មុននេះ**៖ [មគ្គុទេសក៍បញ្ចូលកូដ](debugging.md)
- **➡️ ជំពូកបន្ទាប់**៖ [ជំពូក 8៖ លំនាំផលិតកម្ម និងសហគ្រាស](../chapter-08-production/production-ai-practices.md)
- **🤖 ពាក់ព័ន្ធ**៖ [ជំពូក 2៖ ការអភិវឌ្ឍ AI ជា​លើកដំបូង](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 យោង**៖ [ការដោះស្រាយបញ្ហា Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**៖  
ឯកសារនេះត្រូវបានបកប្រែដោយប្រើសេវាកម្មបកប្រែ AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះបីយើងព្យាយាមរក្សាការត្រឹមត្រូវ ក៏សូមយល់ឲ្យបានថាការបកប្រែដោយស្វ័យប្រវត្តិក្នុងខ្លះអាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមក្នុងភាសាបុរាណគួរត្រូវបានគេចាត់ទុកជាឯកសារដែលមានអំណាចផ្លូវការជាទីបំផុត។ សម្រាប់ព័ត៌មានសំខាន់ៗ ការបកប្រែដោយមនុស្សដែលមានជំនាញគឺត្រូវបានផ្តល់អនុសាសន៍។ យើងមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការជ្រៀតចូលខុសពីការប្រើប្រាស់ការបកប្រែនេះឡើយ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->