# AI-சிறப்பு பிரச்சனை தீர்க்கும் வழிகாட்டி

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD ஆரம்பக்காரர்களுக்காக](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 7 - பிரச்சனை தீர்க்குதல் மற்றும் பிழைதிருத்தம்
- **⬅️ முந்தையது**: [பிழைதிருத்த வழிகாட்டி](debugging.md)
- **➡️ அடுத்த அத்தியாயம்**: [அத்தியாயம் 8: உற்பத்தி மற்றும் நிறுவன வடிவங்கள்](../microsoft-foundry/production-ai-practices.md)
- **🤖 தொடர்புடையது**: [அத்தியாயம் 2: AI-முதலில் மேம்பாடு](../microsoft-foundry/microsoft-foundry-integration.md)

**முந்தையது:** [உற்பத்தி AI நடைமுறைகள்](../microsoft-foundry/production-ai-practices.md) | **அடுத்தது:** [AZD உடன் தொடங்குதல்](../getting-started/README.md)

AZD உடன் AI தீர்வுகளை வெளியிடும்போது ஏற்படும் பொதுவான பிரச்சனைகளை இந்த விரிவான வழிகாட்டி கையாளுகிறது, Azure AI சேவைகளுக்கான தீர்வுகள் மற்றும் பிழைதிருத்த நுட்பங்களை வழங்குகிறது.

## உள்ளடக்க அட்டவணை

- [Azure OpenAI சேவை பிரச்சனைகள்](../../../../docs/troubleshooting)
- [Azure AI தேடல் சிக்கல்கள்](../../../../docs/troubleshooting)
- [கண்டெய்னர் பயன்பாடுகள் வெளியீட்டு சிக்கல்கள்](../../../../docs/troubleshooting)
- [அங்கீகாரம் மற்றும் அனுமதி பிழைகள்](../../../../docs/troubleshooting)
- [மாதிரி வெளியீட்டு தோல்விகள்](../../../../docs/troubleshooting)
- [செயல்திறன் மற்றும் அளவீட்டு சிக்கல்கள்](../../../../docs/troubleshooting)
- [செலவு மற்றும் ஒதுக்கீடு மேலாண்மை](../../../../docs/troubleshooting)
- [பிழைதிருத்த கருவிகள் மற்றும் நுட்பங்கள்](../../../../docs/troubleshooting)

## Azure OpenAI சேவை பிரச்சனைகள்

### பிரச்சனை: OpenAI சேவை பிராந்தியத்தில் கிடைக்கவில்லை

**அறிகுறிகள்:**
```
Error: The requested resource type is not available in the location 'westus'
```

**காரணங்கள்:**
- தேர்ந்தெடுக்கப்பட்ட பிராந்தியத்தில் Azure OpenAI கிடைக்கவில்லை
- விருப்பமான பிராந்தியங்களில் ஒதுக்கீடு முடிந்தது
- பிராந்திய திறன் கட்டுப்பாடுகள்

**தீர்வுகள்:**

1. **பிராந்திய கிடைப்பை சரிபார்க்கவும்:**
```bash
# OpenAI க்கான கிடைக்கக்கூடிய பகுதிகளை பட்டியலிடவும்
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **AZD கட்டமைப்பை புதுப்பிக்கவும்:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **மாற்று பிராந்தியங்களை பயன்படுத்தவும்:**
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

### பிரச்சனை: மாதிரி வெளியீட்டு ஒதுக்கீடு மீறப்பட்டது

**அறிகுறிகள்:**
```
Error: Deployment failed due to insufficient quota
```

**தீர்வுகள்:**

1. **தற்போதைய ஒதுக்கீட்டை சரிபார்க்கவும்:**
```bash
# கோட்டா பயன்பாட்டை சரிபார்க்கவும்
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **ஒதுக்கீடு அதிகரிக்க கோரிக்கை விடுக்கவும்:**
```bash
# ஒதுக்கீடு அதிகரிப்பு கோரிக்கையை சமர்ப்பிக்கவும்
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **மாதிரி திறனை மேம்படுத்தவும்:**
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

### பிரச்சனை: தவறான API பதிப்பு

**அறிகுறிகள்:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**தீர்வுகள்:**

1. **ஆதரிக்கப்படும் API பதிப்பைப் பயன்படுத்தவும்:**
```python
# சமீபத்திய ஆதரிக்கப்படும் பதிப்பைப் பயன்படுத்தவும்
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API பதிப்பு இணக்கத்தன்மையை சரிபார்க்கவும்:**
```bash
# ஆதரிக்கப்படும் API பதிப்புகளை பட்டியலிடவும்
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI தேடல் சிக்கல்கள்

### பிரச்சனை: தேடல் சேவை விலை நிலை போதவில்லை

**அறிகுறிகள்:**
```
Error: Semantic search requires Basic tier or higher
```

**தீர்வுகள்:**

1. **விலை நிலையை மேம்படுத்தவும்:**
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

2. **Semantic தேடலை முடக்கவும் (மேம்பாடு):**
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

### பிரச்சனை: குறியீடு உருவாக்க தோல்விகள்

**அறிகுறிகள்:**
```
Error: Cannot create index, insufficient permissions
```

**தீர்வுகள்:**

1. **தேடல் சேவை விசைகளை சரிபார்க்கவும்:**
```bash
# தேடல் சேவை நிர்வாக விசையை பெறவும்
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **குறியீடு திட்டத்தை சரிபார்க்கவும்:**
```python
# குறியீட்டு திட்டத்தை சரிபார்க்கவும்
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

3. **மேலாண்மை அடையாளத்தை பயன்படுத்தவும்:**
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

## கண்டெய்னர் பயன்பாடுகள் வெளியீட்டு சிக்கல்கள்

### பிரச்சனை: கண்டெய்னர் கட்டமைப்பு தோல்விகள்

**அறிகுறிகள்:**
```
Error: Failed to build container image
```

**தீர்வுகள்:**

1. **Dockerfile இலக்கணத்தை சரிபார்க்கவும்:**
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

2. **சார்புகளை சரிபார்க்கவும்:**
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

3. **ஆரோக்கிய சோதனை சேர்க்கவும்:**
```python
# main.py - ஆரோக்கிய சோதனை இறுக்குமுகத்தைச் சேர்க்கவும்
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### பிரச்சனை: கண்டெய்னர் பயன்பாடு தொடக்க தோல்விகள்

**அறிகுறிகள்:**
```
Error: Container failed to start within timeout period
```

**தீர்வுகள்:**

1. **தொடக்க நேரத்தை அதிகரிக்கவும்:**
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

2. **மாதிரி ஏற்றலை மேம்படுத்தவும்:**
```python
# மாடல்களை சோம்பேறி ஏற்றவும், தொடக்க நேரத்தை குறைக்கவும்
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
        # இங்கே AI கிளையண்டை துவக்கவும்
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # தொடக்கம்
    app.state.model_manager = ModelManager()
    yield
    # நிறுத்தம்
    pass

app = FastAPI(lifespan=lifespan)
```

## அங்கீகாரம் மற்றும் அனுமதி பிழைகள்

### பிரச்சனை: மேலாண்மை அடையாள அனுமதி மறுக்கப்பட்டது

**அறிகுறிகள்:**
```
Error: Authentication failed for Azure OpenAI Service
```

**தீர்வுகள்:**

1. **பங்கு ஒதுக்கீடுகளை சரிபார்க்கவும்:**
```bash
# தற்போதைய பங்கு ஒதுக்கீடுகளை சரிபார்க்கவும்
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **தேவையான பங்குகளை ஒதுக்கவும்:**
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

3. **அங்கீகாரத்தை சோதிக்கவும்:**
```python
# மேலாண்மை அடையாள அங்கீகாரத்தை சோதிக்கவும்
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

### பிரச்சனை: Key Vault அணுகல் மறுக்கப்பட்டது

**அறிகுறிகள்:**
```
Error: The user, group or application does not have secrets get permission
```

**தீர்வுகள்:**

1. **Key Vault அனுமதிகளை வழங்கவும்:**
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

2. **அணுகல் கொள்கைகளுக்கு பதிலாக RBAC ஐ பயன்படுத்தவும்:**
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

## மாதிரி வெளியீட்டு தோல்விகள்

### பிரச்சனை: மாதிரி பதிப்பு கிடைக்கவில்லை

**அறிகுறிகள்:**
```
Error: Model version 'gpt-4-32k' is not available
```

**தீர்வுகள்:**

1. **கிடைக்கும் மாதிரிகளை சரிபார்க்கவும்:**
```bash
# கிடைக்கக்கூடிய மாதிரிகளை பட்டியலிடவும்
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **மாதிரி மாற்றங்களை பயன்படுத்தவும்:**
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

3. **வெளியீட்டத்திற்கு முன் மாதிரியை சரிபார்க்கவும்:**
```python
# முன்-வினியோக மாடல் சரிபார்ப்பு
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

## செயல்திறன் மற்றும் அளவீட்டு சிக்கல்கள்

### பிரச்சனை: அதிக தாமதமான பதில்கள்

**அறிகுறிகள்:**
- பதில் நேரம் > 30 விநாடிகள்
- நேரம் முடிவடைந்த பிழைகள்
- மோசமான பயனர் அனுபவம்

**தீர்வுகள்:**

1. **கோரிக்கை நேர முடிவுகளை செயல்படுத்தவும்:**
```python
# சரியான நேர முடிவுகளை அமைக்கவும்
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

2. **பதில் சேமிப்பைச் சேர்க்கவும்:**
```python
# பதில்களுக்கு Redis கேஷ்
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

3. **தானியங்க அளவீட்டை அமைக்கவும்:**
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

### பிரச்சனை: நினைவக பிழைகள்

**அறிகுறிகள்:**
```
Error: Container killed due to memory limit exceeded
```

**தீர்வுகள்:**

1. **நினைவக ஒதுக்கீட்டை அதிகரிக்கவும்:**
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

2. **நினைவக பயன்பாட்டை மேம்படுத்தவும்:**
```python
# நினைவக திறன் மிக்க மாதிரி கையாளுதல்
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # செயலாக்கத்திற்கு முன் நினைவக பயன்பாட்டை சரிபார்க்கவும்
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # குப்பை சேகரிப்பை கட்டாயமாக்கவும்
            
        result = await self._process_ai_request(request)
        
        # செயலாக்கத்திற்கு பின் சுத்தம் செய்யவும்
        gc.collect()
        return result
```

## செலவு மற்றும் ஒதுக்கீடு மேலாண்மை

### பிரச்சனை: எதிர்பாராத அதிக செலவுகள்

**அறிகுறிகள்:**
- Azure பில் எதிர்பார்த்ததை விட அதிகம்
- டோக்கன் பயன்பாடு மதிப்பீடுகளை மீறுகிறது
- பட்ஜெட் எச்சரிக்கைகள் இயக்கப்பட்டன

**தீர்வுகள்:**

1. **செலவு கட்டுப்பாடுகளை செயல்படுத்தவும்:**
```python
# டோக்கன் பயன்பாட்டு கண்காணிப்பு
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

2. **செலவு எச்சரிக்கைகளை அமைக்கவும்:**
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

3. **மாதிரி தேர்வை மேம்படுத்தவும்:**
```python
# செலவினத்தை கருத்தில் கொண்டு மாதிரி தேர்வு
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # 1K டோக்கன்களுக்கு
    'gpt-4': 0.03,          # 1K டோக்கன்களுக்கு
    'gpt-35-turbo': 0.0015  # 1K டோக்கன்களுக்கு
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

## பிழைதிருத்த கருவிகள் மற்றும் நுட்பங்கள்

### AZD பிழைதிருத்த கட்டளைகள்

```bash
# விரிவான பதிவு செயல்படுத்தவும்
azd up --debug

# பிரசார நிலையை சரிபார்க்கவும்
azd show

# பிரசார பதிவுகளைப் பார்க்கவும்
azd logs --follow

# சூழல் மாறிகளை சரிபார்க்கவும்
azd env get-values
```

### பயன்பாட்டு பிழைதிருத்தம்

1. **கட்டமைக்கப்பட்ட பதிவு:**
```python
import logging
import json

# AI பயன்பாடுகளுக்கான கட்டமைக்கப்பட்ட பதிவு அமைக்கவும்
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

2. **ஆரோக்கிய சோதனை முடுக்கங்கள்:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # OpenAI இணைப்பை சரிபார்க்கவும்
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # தேடல் சேவையை சரிபார்க்கவும்
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

3. **செயல்திறன் கண்காணிப்பு:**
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

## பொதுவான பிழை குறியீடுகள் மற்றும் தீர்வுகள்

| பிழை குறியீடு | விளக்கம் | தீர்வு |
|------------|-------------|----------|
| 401 | அங்கீகாரம் செய்யப்படவில்லை | API விசைகள் மற்றும் மேலாண்மை அடையாள அமைப்பைச் சரிபார்க்கவும் |
| 403 | தடைசெய்யப்பட்டது | RBAC பங்கு ஒதுக்கீடுகளைச் சரிபார்க்கவும் |
| 429 | விகிதம் வரையறுக்கப்பட்டது | பரவலான பின்னோக்கத்துடன் மீண்டும் முயற்சி செய்யும் நுட்பத்தை செயல்படுத்தவும் |
| 500 | உள் சேவை பிழை | மாதிரி வெளியீட்டு நிலை மற்றும் பதிவுகளைச் சரிபார்க்கவும் |
| 503 | சேவை கிடைக்கவில்லை | சேவை ஆரோக்கியம் மற்றும் பிராந்திய கிடைப்பைச் சரிபார்க்கவும் |

## அடுத்த படிகள்

1. **[AI மாதிரி வெளியீட்டு வழிகாட்டி](ai-model-deployment.md)** ஐ ஆய்வு செய்யவும்
2. **[உற்பத்தி AI நடைமுறைகள்](production-ai-practices.md)** ஐ முடிக்கவும்
3. **[Microsoft Foundry Discord](https://aka.ms/foundry/discord)** இல் சமூக ஆதரவைச் சேரவும்
4. **பிரச்சனைகளை சமர்ப்பிக்கவும்** [AZD GitHub repository](https://github.com/Azure/azure-dev) இல் AZD-சிறப்பு பிரச்சனைகளுக்கு

## வளங்கள்

- [Azure OpenAI சேவை பிழைதிருத்தம்](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [கண்டெய்னர் பயன்பாடுகள் பிழைதிருத்தம்](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI தேடல் பிழைதிருத்தம்](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD ஆரம்பக்காரர்களுக்காக](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 7 - பிரச்சனை தீர்க்குதல் மற்றும் பிழைதிருத்தம்
- **⬅️ முந்தையது**: [பிழைதிருத்த வழிகாட்டி](debugging.md)
- **➡️ அடுத்த அத்தியாயம்**: [அத்தியாயம் 8: உற்பத்தி மற்றும் நிறுவன வடிவங்கள்](../microsoft-foundry/production-ai-practices.md)
- **🤖 தொடர்புடையது**: [அத்தியாயம் 2: AI-முதலில் மேம்பாடு](../microsoft-foundry/microsoft-foundry-integration.md)
- [Azure Developer CLI பிழைதிருத்தம்](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**அறிவிப்பு**:  
இந்த ஆவணம் [Co-op Translator](https://github.com/Azure/co-op-translator) என்ற AI மொழிபெயர்ப்பு சேவையை பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சிக்கிறோம், ஆனால் தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கக்கூடும் என்பதை தயவுசெய்து கவனத்தில் கொள்ளவும். அதன் சொந்த மொழியில் உள்ள மூல ஆவணம் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்களுக்கும் அல்லது தவறான விளக்கங்களுக்கும் நாங்கள் பொறுப்பல்ல.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->