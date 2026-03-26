# AI-சார்ந்த பிழைத் தீர்வு கையேடு

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடத்திற்கான முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 7 - பிழைத் தீர்வு மற்றும் டீபக்கிங்
- **⬅️ முந்தையது**: [டீபக்கிங் வழிகாட்டி](debugging.md)
- **➡️ அடுத்த அத்தியாயம்**: [அத்தியாயம் 8: தயாரிப்பு மற்றும் நிறுவன மாதிரிகள்](../chapter-08-production/production-ai-practices.md)
- **🤖 தொடர்புடையது**: [அத்தியாயம் 2: AI-முதன்மை அபிவிருத்தி](../chapter-02-ai-development/microsoft-foundry-integration.md)

AZD உபயோகித்து AI தீர்வுகளை வெளியிடும்போது ஏற்படும் பொதுவான சிக்கல்களை இந்த விரிவான பிழைத் தீர்வு கையேடு கையாள்கிறது, மேலும் Azure AI சேவைகளுக்கு சார்ந்த தீர்வுகள் மற்றும் டீபக்கிங் நுட்பங்களை வழங்குகிறது.

## உள்ளடக்க அட்டவணை

- [Microsoft Foundry மாதிரிகள் சேவை பிரச்சினைகள்](../../../../docs/chapter-07-troubleshooting)
- [Azure AI தேடல் பிரச்சினைகள்](../../../../docs/chapter-07-troubleshooting)
- [Container Apps வெளியீட்டு பிரச்சினைகள்](../../../../docs/chapter-07-troubleshooting)
- [அங்கீகாரம் மற்றும் அனுமதி பிழைகள்](../../../../docs/chapter-07-troubleshooting)
- [மாதிரி வெளியீட்டு தோல்விகள்](../../../../docs/chapter-07-troubleshooting)
- [செயற்பாடு மற்றும் ஸ்கேலிங் பிரச்சினைகள்](../../../../docs/chapter-07-troubleshooting)
- [செலவு மற்றும் குவோட்டா மேலாண்மை](../../../../docs/chapter-07-troubleshooting)
- [டீபக்கிங் கருவிகள் மற்றும் தொழில்நுட்பங்கள்](../../../../docs/chapter-07-troubleshooting)

## Microsoft Foundry மாதிரிகள் சேவை பிரச்சினைகள்

### பிரச்சினை: OpenAI சேவை பிரதேசத்தில் கிடையாது

**அறிகுறிகள்:**
```
Error: The requested resource type is not available in the location 'westus'
```

**காரணங்கள்:**
- Microsoft Foundry மாதிரிகள் தேர்ந்தெடுக்கப்பட்ட பிராந்தியத்தில் கிடைக்கவில்லை
- விருப்ப பிராந்தியங்களில் குவோட்டா முடிந்துவிட்டது
- பிராந்திய திறன் வரம்புகள்

**தீர்வுகள்:**

1. **பிராந்திய கிடைக்கும் நிலையைச் சரிபார்:**
```bash
# OpenAI-க்கு கிடைக்கக்கூடிய பிரதேசங்களை பட்டியலிடு
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

3. **மாற்று பிராந்தியங்களைப் பயன்படுத்தவும்:**
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

### பிரச்சினை: மாதிரி வெளியீட்டு குவோட்டா மீறப்பட்டுள்ளது

**அறிகுறிகள்:**
```
Error: Deployment failed due to insufficient quota
```

**தீர்வுகள்:**

1. **நடப்பு குவோட்டாவைச் சரிபார்:**
```bash
# கோட்டா பயன்பாட்டை சரிபார்க்கவும்
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **குவோட்டா உயர்வுக்கு கோரிக்கை விடுங்கள்:**
```bash
# கோட்டா உயர்வு கோரிக்கையை சமர்ப்பிக்கவும்
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **மாதிரி திறனைக் மேம்படுத்தவும்:**
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

### பிரச்சினை: தவறான API பதிப்பு

**அறிகுறிகள்:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**தீர்வுகள்:**

1. **ஆதரிக்கப்பட்ட API பதிப்பைப் பயன்படுத்தவும்:**
```python
# சமீபத்திய ஆதரிக்கப்பட்ட பதிப்பைப் பயன்படுத்தவும்
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API பதிப்பு பொருந்துதலினைச் சரிபார்:**
```bash
# ஆதரிக்கப்படும் API பதிப்புகளை பட்டியலிடுக
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI தேடல் பிரச்சினைகள்

### பிரச்சினை: தேடல் சேவை விலைத் தரம் போதாதது

**அறிகுறிகள்:**
```
Error: Semantic search requires Basic tier or higher
```

**தீர்வுகள்:**

1. **விலைத் தரத்தை மேம்படுத்தவும்:**
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

2. **Semantic Search ஐ (அபிவிருத்தி) தற்காலிகமாக முடக்கவும்:**
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

### பிரச்சினை: Index உருவாக்க தோல்விகள்

**அறிகுறிகள்:**
```
Error: Cannot create index, insufficient permissions
```

**தீர்வுகள்:**

1. **Search சேவை கீகளை சரிபார்க்கவும்:**
```bash
# தேடல் சேவையின் நிர்வாக விசையைப் பெறவும்
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Index வடிவமைப்பைச் சரிபார்:**
```python
# இன்டெக்ஸ் ஸ்கீமாவை சரிபார்க்கவும்
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

3. **Managed Identity ஐ பயன்படுத்தவும்:**
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

## Container Apps வெளியீட்டு பிரச்சினைகள்

### பிரச்சினை: Container கட்டமைப்பு தோல்விகள்

**அறிகுறிகள்:**
```
Error: Failed to build container image
```

**தீர்வுகள்:**

1. **Dockerfile சொற்றுறை அமைப்பைச் சரிபார்க்கவும்:**
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

2. **இணைநிலைகளை சரிபார்க்கவும்:**
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

3. **Health Check ஐ சேர்க்கவும்:**
```python
# main.py - ஹெல்த் செக் எண்ட்பாயிண்ட் சேர்க்கவும்
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### பிரச்சினை: Container App துவக்கத் தோல்விகள்

**அறிகுறிகள்:**
```
Error: Container failed to start within timeout period
```

**தீர்வுகள்:**

1. **துவக்க கால அவகாசத்தை அதிகரிக்கவும்:**
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

2. **மாதிரி ஏற்றத்தை செயல்திறனாகச் சரிசெய்யவும்:**
```python
# தொடக்க நேரத்தை குறைக்க மாதிரிகளை தேவையான போது ஏற்றவும்
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
        # இங்கே AI கிளையண்டை ஆரம்பிக்கவும்
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # தொடக்கம்
    app.state.model_manager = ModelManager()
    yield
    # நிறுத்தல்
    pass

app = FastAPI(lifespan=lifespan)
```

## அங்கீகாரம் மற்றும் அனுமதி பிழைகள்

### பிரச்சினை: Managed Identity அனுமதி மறுக்கப்பட்டது

**அறிகுறிகள்:**
```
Error: Authentication failed for Microsoft Foundry Models Service
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
# மேனேஜ் செய்யப்பட்ட அடையாளத்தின் அங்கீகாரத்தை சோதிக்கவும்
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

### பிரச்சினை: Key Vault அணுகல் மறுக்கப்பட்டது

**அறிகுறிகள்:**
```
Error: The user, group or application does not have secrets get permission
```

**தீர்வுகள்:**

1. **Key Vault அனுமதிகள் வழங்கவும்:**
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

2. **Access Policies மாறாக RBAC ஐ பயன்படுத்தவும்:**
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

### பிரச்சினை: மாதிரி பதிப்பு கிடைக்கவில்லை

**அறிகுறிகள்:**
```
Error: Model version 'gpt-4-32k' is not available
```

**தீர்வுகள்:**

1. **கிடைக்கும் மாதிரிகளைச் சரிபார்க்கவும்:**
```bash
# கிடைக்கும் மாதிரிகளை பட்டியலிடவும்
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **மாற்று மாதிரிகளைப் பயன்படுத்தவும்:**
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

3. **வெளியீட்டிற்கு முன்பு மாதிரியை சரிபார்க்கவும்:**
```python
# நிறுவுவதற்கு முன் மாடல் சரிபார்ப்பு
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

## செயல்திறன் மற்றும் அளவீட்டு பிரச்சினைகள்

### பிரச்சினை: பதில்களின் உயர் தாமதம்

**அறிகுறிகள்:**
- பதில் நேரம் > 30 வினாடிகள்
- டைம்அவுட் பிழைகள்
- பயனர் அனுபவம் மோசம்

**தீர்வுகள்:**

1. **கோரிக்கை காலஅவகாசங்களை அமல்படுத்தவும்:**
```python
# சரியான காலாவதிகளை அமைக்கவும்
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

2. **பதில்கள் கேஷிங் சேர்க்கவும்:**
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

3. **தானியங்கி அளவீட்டை கட்டமைக்கவும்:**
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

### பிரச்சினை: Out of Memory (நினைவக முடிவு) பிழைகள்

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
# நினைவுத் திறன் கொண்ட மாடல் கையாளுதல்
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # செயலாக்கம் முன்னதாக நினைவு பயன்பாட்டைச் சரிபார்க்கவும்
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # கார்பேஜ் கலெக்ஷனை கட்டாயமாக இயக்கவும்
            
        result = await self._process_ai_request(request)
        
        # செயலாக்கம் முடிந்தவுடன் சுத்தப்படுத்தவும்
        gc.collect()
        return result
```

## செலவு மற்றும் குவோட்டா மேலாண்மை

### பிரச்சினை: எதிர்பாராத உயர்ந்த செலவுகள்

**அறிகுறிகள்:**
- Azure பில் எதிர்பார்த்ததைவிட அதிகம் உள்ளது
- டோக்கன் பயன்பாடு மதிப்பீடுகளை மீறுகிறது
- பட்ஜெட் அலெர்ட்கள் செயல்பட்டுள்ளன

**தீர்வுகள்:**

1. **செலவுக் கட்டுப்பாடுகளை அமல்படுத்தவும்:**
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

2. **செலவு அலெர்ட்களை அமைக்கவும்:**
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

3. **மாதிரி தேர்வை சிறப்பாக ஒழுங்குப்படுத்தவும்:**
```python
# செலவைக் கருத்தில் கொண்டு மாடல் தேர்வு
MODEL_COSTS = {
    'gpt-4.1-mini': 0.00015,  # ஒவ்வொரு 1K டோக்கனுக்கும்
    'gpt-4.1': 0.03,          # ஒவ்வொரு 1K டோக்கனுக்கும்
    'gpt-35-turbo': 0.0015  # ஒவ்வொரு 1K டோக்கனுக்கும்
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

## டீபக்கிங் கருவிகள் மற்றும் தொழில்நுட்பங்கள்

### AZD டீபக்கிங் கட்டளைகள்

```bash
# விரிவான பதிவு செயல்பாட்டை இயக்கவும்
azd up --debug

# வெளியீட்டு நிலையை சரிபார்க்கவும்
azd show

# விண்ணப்ப பதிவுகளைப் பார்க்கவும் (கண்காணிப்பு டாஷ்போர்டை திறக்கிறது)
azd monitor --logs

# நேரடி அளவுகோல்களைப் பார்க்கவும்
azd monitor --live

# சூழல் மாறிலிகளை சரிபார்க்கவும்
azd env get-values
```

### AZD AI ஈக்ஸ்டென்ஷன் கண்டறிதலுக்கான கட்டளைகள்

If you deployed agents using `azd ai agent init`, these additional tools are available:

```bash
# ஏஜென்ட்ஸ் விரிவாக்கம் நிறுவப்பட்டிருக்கிறது என்பதை உறுதி செய்யவும்
azd extension install azure.ai.agents

# மெனிபெஸ்ட் மூலம் ஒரு ஏஜெண்டை மீண்டும் தொடக்கவும் அல்லது புதுப்பிக்கவும்
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# MCP சேவையகத்தை பயன்படுத்தி AI கருவிகள் திட்டத்தின் நிலையை விசாரிக்க அனுமதிக்கவும்
azd mcp start

# மீளாய்வு மற்றும் தணிக்கைக்காக இன்ப்ராஸ்ட்ரக்சர் கோப்புகளை உருவாக்கவும்
azd infra generate
```

> **குறிப்பு:** `azd infra generate` ஐப் பயன்படுத்தி IaC ஐ டிஸ்க்கிற்கு எழுதுங்கள், ஆகவே எந்த வளங்கள் வழங்கப்பட்டன என்பதை நீங்கள் துல்லியமாக ஆய்வு செய்ய முடியும். வளக் கட்டமைப்பு சிக்கல்களை டீபக் செய்யும் போது இதை பயன்படுத்துவது மிகவும் மதிப்புமிக்கது. முழு விவரங்களுக்கு [AZD AI CLI குறிப்புரை](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) ஐப் பார்க்கவும்.

### பயன்பாடு டீபக்கிங்

1. **வடிவமைக்கப்பட்ட பதிவு:**
```python
import logging
import json

# AI பயன்பாடுகளுக்கான கட்டமைக்கப்பட்ட பதிவை அமைக்கவும்
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

2. **ஆரோக்கியச் சோதனை Endpoints:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # OpenAI இணைப்பைச் சோதிக்கவும்
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # தேடல் சேவையைச் சோதிக்கவும்
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

3. **செயற்பாடு கண்காணிப்பு:**
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

## வழக்கமான பிழை குறியீடுகள் மற்றும் தீர்வுகள்

| பிழை குறியீடு | விளக்கம் | தீர்வு |
|------------|-------------|----------|
| 401 | அனுமதி இல்லை | API விசைகள் மற்றும் managed identity கட்டமைப்பினை சரிபார்க்கவும் |
| 403 | தடை செய்யப்பட்டு உள்ளது | RBAC பங்கு ஒதுக்கீடுகளை சரிபார்க்கவும் |
| 429 | வரம்பு மீறப்பட்டது | எக்ஸ்போனென்ஷியல் பேக்க்ஆபுடன் மீண்டும் முயற்சி செய்யும் நெறிமுறையை அமல்படுத்தவும் |
| 500 | உள் சேவையகம் பிழை | மாதிரி வெளியீட்டு நிலையும் பதிவுகளையும் சரிபார்க்கவும் |
| 503 | சேவை கிடைக்கவில்லை | சேவை நிலை மற்றும் பிராந்திய கிடைக்கும் நிலையை சரிபார்க்கவும் |

## அடுத்த படிகள்

1. **பரிசீலனை செய்யவும் [AI மாதிரி வெளியீட்டு கையேடு](../chapter-02-ai-development/ai-model-deployment.md)** வெளியீட்டு சிறந்த நடைமுறைகளுக்காக
2. **[தயாரிப்பு AI நடைமுறைகள்](../chapter-08-production/production-ai-practices.md) ஐ முடிக்கவும்** நிறுவனத் தயாரான தீர்வுகளுக்காக
3. **[Microsoft Foundry Discord](https://aka.ms/foundry/discord) இல் இணைக** சமூக ஆதரவுக்காக
4. **பிழைகளை சமர்ப்பிக்கவும்** AZD-சார்ந்த பிரச்சினைகள் தொடர்பாக [AZD GitHub repository](https://github.com/Azure/azure-dev)

## வளங்கள்

- [Microsoft Foundry மாதிரிகள் சேவை பிழைத் தீர்வு](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps பிழைத் தீர்வு](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI தேடல் பிழைத் தீர்வு](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - உங்கள் எடிட்டரில் Azure பிழைத் தீர்வு திறன்களை நிறுவுங்கள்: `npx skills add microsoft/github-copilot-for-azure`

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடத்திற்கான முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 7 - பிழைத் தீர்வு மற்றும் டீபக்கிங்
- **⬅️ முந்தையது**: [டீபக்கிங் வழிகாட்டி](debugging.md)
- **➡️ அடுத்த அத்தியாயம்**: [அத்தியாயம் 8: தயாரிப்பு மற்றும் நிறுவன மாதிரிகள்](../chapter-08-production/production-ai-practices.md)
- **🤖 தொடர்புடையது**: [அத்தியாயம் 2: AI-முதன்மை அபிவிருத்தி](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 குறிப்புரை**: [Azure Developer CLI பிழைத் தீர்வு](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
மறுப்புக் குறிப்பு:
இந்த ஆவணம் AI மொழி மொழிபெயர்ப்பு சேவையான [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயல்வினாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுதல்கள் இருக்கலாம் என்பதை தயவுசெய்து கவனத்தில் கொள்ளவும். அசல் ஆவணம் அதன் தாய்மொழியில் அதிகாரபூர்வ மூலமாகக் கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பை பயன்படுத்த பரிந்துரைக்கப்படுகிறோம். இந்த மொழிபெயர்ப்பின் 사용த்தினால் ஏற்படும் எந்த புரிதல் பிழைகள் அல்லது தவறான விளக்கங்களுக்கும் நாங்கள் பொறுப்பேற்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->