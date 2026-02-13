# AI-கான குறிப்பிட்ட பிழைதிருத்த வழிகாட்டி

**அத்தியாய வழிசெலுத்தல்:**
- **📚 Course Home**: [AZD தொடக்கர்களுக்கான](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: Chapter 7 - பிழைதிருத்தம் மற்றும் டீபக்கிங்
- **⬅️ முந்தையது**: [டீபக்கிங் வழிகாட்டு](debugging.md)
- **➡️ அடுத்த அத்தியாயம்**: [அத்தியாயம் 8: உற்பத்தி மற்றும் நிறுவன முறைபாடுகள்](../chapter-08-production/production-ai-practices.md)
- **🤖 தொடர்புடையது**: [அத்தியாயம் 2: AI-முதலில் மேம்பாடு](../chapter-02-ai-development/microsoft-foundry-integration.md)

**முந்தையது:** [Production AI Practices](../chapter-08-production/production-ai-practices.md) | **அடுத்தது:** [AZD அடிப்படைகள்](../chapter-01-foundation/azd-basics.md)

இக்கட்டுப்படுத்தப்பட்ட பிழைதிருத்தக் கையேடு AZD உடன் AI தீர்வுகளை உருவாக்கும்போது கூடுதலாக ஏற்படும் பொதுவான பிரச்சனைகளை முகாம்படுத்துகிறது மற்றும் Azure AI சேவைகளுக்கான தீர்வுகள் மற்றும் பிழைதிருத்த நுட்பங்களை வழங்குகிறது.

## உள்ளடக்க அட்டவணை

- [Azure OpenAI சேவை பிரச்சனைகள்](../../../../docs/chapter-07-troubleshooting)
- [Azure AI Search பிரச்சனைகள்](../../../../docs/chapter-07-troubleshooting)
- [Container Apps டிப்பிளாய்மென்ட் பிரச்சனைகள்](../../../../docs/chapter-07-troubleshooting)
- [அங்கீகாரம் மற்றும் அனுமதி பிழைகள்](../../../../docs/chapter-07-troubleshooting)
- [மாதிரி டிப்பிளாய்மென்ட் தோல்விகள்](../../../../docs/chapter-07-troubleshooting)
- [செயல்திறன் மற்றும் பரிமாணப் பிரச்சனைகள்](../../../../docs/chapter-07-troubleshooting)
- [செலவு மற்றும் கொட்டா நிர்வாகம்](../../../../docs/chapter-07-troubleshooting)
- [பிழைதிருத்த கருவிகள் மற்றும் நுட்பங்கள்](../../../../docs/chapter-07-troubleshooting)

## Azure OpenAI சேவை பிரச்சனைகள்

### பிரச்சனை: OpenAI சேவை பிரதேசத்தில் கிடைக்கவில்லை

**அறிகுறிகள்:**
```
Error: The requested resource type is not available in the location 'westus'
```

**காரணங்கள்:**
- தேர்ந்தெடுத்த பிராந்தியத்தில் Azure OpenAI கிடைக்கவில்லை
- விருப்ப பிராந்தியங்களில் கொட்டா முடிந்தது
- பிராந்திய திறன் கட்டுபாடுகள்

**தீர்வுகள்:**

1. **பிராந்திய கிடைக்கும் இருப்பை சரிபார்:**
```bash
# OpenAIக்கான கிடைக்கும் பிரதேசங்களை பட்டியலிடவும்
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

### பிரச்சனை: மாதிரி டிப்பிளாய்மென்ட் கொட்டா கடந்து விட்டது

**அறிகுறிகள்:**
```
Error: Deployment failed due to insufficient quota
```

**தீர்வுகள்:**

1. **தற்போதைய கொட்டாவை சரிபார்:**
```bash
# கோட்டா பயன்பாட்டை சரிபார்க்கவும்
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **கொட்டா அதிகரிப்பு கோரிக்கை செய்யவும்:**
```bash
# குவோட்டாவை அதிகரிக்குமாறு கோரிக்கையை சமர்ப்பிக்கவும்
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **மாதிரி திறனை 최பயோகப்படுத்தவும்:**
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

1. **உயர்தர ஆதரவுள்ள API பதிப்பைப் பயன்படுத்தவும்:**
```python
# சமீபத்திய ஆதரிக்கப்பட்ட பதிப்பைப் பயன்படுத்தவும்
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API பதிப்பு பொருத்தத்தைக் சரிபார்:**
```bash
# ஆதரிக்கப்படும் API பதிப்புகளை பட்டியலிடவும்
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search பிரச்சனைகள்

### பிரச்சனை: Search சேவை விலை நிலை போதாது

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

2. **Semantic Search-ஐ (தகவல் உருவாக்க பொழுது) முடக்கு:**
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

### பிரச்சனை: Index உருவாக்க தோல்விகள்

**அறிகுறிகள்:**
```
Error: Cannot create index, insufficient permissions
```

**தீர்வுகள்:**

1. **Search சேவை சாவிகளை சரிபார்:**
```bash
# தேடல் சேவையின் நிர்வாக விசையைப் பெறவும்
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Index ஸ்கீமாவை சரிபார்:**
```python
# இன்டெக்ஸ் ஸ்கீமாவை சரிபார்க்க
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

3. **Managed Identity-ஐப் பயன்படுத்தவும்:**
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

## Container Apps டிப்பிளாய்மென்ட் பிரச்சனைகள்

### பிரச்சனை: Container கட்டுமானத் தோல்விகள்

**அறிகுறிகள்:**
```
Error: Failed to build container image
```

**தீர்வுகள்:**

1. **Dockerfile இலக்கணத்தை சரிபார்:**
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

2. **உறுப்புகள் மற்றும் சார்புகளை சரிபார்:**
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

3. **ஓய்வு சோதனை (Health Check) சேர்க்கவும்:**
```python
# main.py - ஆரோக்கியச் சரிபார்ப்பு எண்ட்பாயிண்டை சேர்க்கவும்
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### பிரச்சனை: Container App தொடக்க தோல்விகள்

**அறிகுறிகள்:**
```
Error: Container failed to start within timeout period
```

**தீர்வுகள்:**

1. **தொடக்க நேர எல்லையை அதிகரிக்கவும்:**
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

2. **மாதிரி ஏற்றத்தை 최பயோகப்படுத்தவும்:**
```python
# துவக்க நேரத்தை குறைக்க மாதிரிகளை சோம்பேறியாக ஏற்றவும்
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
        # இங்கு AI கிளையன்டை ஆரம்பிக்கவும்
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # துவக்கம்
    app.state.model_manager = ModelManager()
    yield
    # முடக்கம்
    pass

app = FastAPI(lifespan=lifespan)
```

## அங்கீகாரம் மற்றும் அனுமதி பிழைகள்

### பிரச்சனை: Managed Identity அனுமதி மறுக்கப்பட்டது

**அறிகுறிகள்:**
```
Error: Authentication failed for Azure OpenAI Service
```

**தீர்வுகள்:**

1. **பாத்திர ஒதுக்கீடுகளை சரிபார்:**
```bash
# தற்போது உள்ள பங்கு ஒதுக்கீடுகளைச் சரிபார்க்கவும்
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **தேவையான பத்திரங்களை ஒதுக்கவும்:**
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
# நிர்வகிக்கப்பட்ட அடையாள அங்கீகாரத்தை சோதிக்கவும்
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

2. **Access Policies-வுக்கு பதிலாக RBAC ஐப் பயன்படுத்தவும்:**
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

## மாதிரி டிப்பிளாய்மென்ட் தோல்விகள்

### பிரச்சனை: மாதிரி பதிப்பு கிடைக்கவில்லை

**அறிகுறிகள்:**
```
Error: Model version 'gpt-4-32k' is not available
```

**தீர்வுகள்:**

1. **கிடைக்கும் மாதிரிகளை சரிபார்:**
```bash
# கிடைக்கும் மாதிரிகளை பட்டியலிடவும்
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **மாதிரிFallbacks ஐப் பயன்படுத்தவும்:**
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

3. **டிப்பிளாய்மென்ட் முன் மாதிரியைச் சரிபார்:**
```python
# விடுவிப்பிற்கு முன் மாடல் சரிபார்ப்பு
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

## செயல்திறன் மற்றும் பரிமாணப் பிரச்சனைகள்

### பிரச்சனை: அதிக மந்தமான பதில்கள்

**அறிகுறிகள்:**
- பதில்களின் நேரம் > 30 நொடி
- கால அவகாச பிழைகள்
- பயன்படுத்துபவர் அனுபவத்தில் குறைவு

**தீர்வுகள்:**

1. **கோரிக்கை நேர எல்லைகளை செயல்படுத்தவும்:**
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

2. **பதில் கேட்சைச் சேர்க்கவும்:**
```python
# பதில்களுக்கு арналған Redis கேஷ்
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

3. **தானாக அளவை கூடியாக்கலை (Auto-scaling) அமைக்கவும்:**
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

### பிரச்சனை: மெமரி வெளியேறுதல் பிழைகள்

**அறிகுறிகள்:**
```
Error: Container killed due to memory limit exceeded
```

**தீர்வுகள்:**

1. **மெமரி ஒதுக்கீட்டை அதிகரிக்கவும்:**
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

2. **மெமரி பயன்பாட்டைக் 최பயோகப்படுத்தவும்:**
```python
# நினைவகச் சேமிப்பை திறம்பட பயன்படுத்தும் மாதிரி கையாளல்
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # செயலாக்கத்திற்கு முன் நினைவக பயன்பாட்டை சரிபார்
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # கழிவு சேகரிப்பை கட்டாயப்படுத்து
            
        result = await self._process_ai_request(request)
        
        # செயலாக்கத்திற்குப் பிறகு சுத்தப்படுத்து
        gc.collect()
        return result
```

## செலவு மற்றும் கொட்டா நிர்வாகம்

### பிரச்சனை: எதிர்பாராத உயர் செலவுகள்

**அறிகுறிகள்:**
- Azure பில் எதிர்பார்த்ததைவிட உயர்
- டோக்கன் பயன்பாடு மதிப்பீடுகளை மீறுகிறது
- பட்ஜெட் அறிவிப்புகள் 트ிரிகர்

**தீர்வுகள்:**

1. **செலவு கட்டுப்பாடுகளை அமல்படுத்தவும்:**
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

2. **செலவு அறிவிப்புகளை அமைக்கவும்:**
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

3. **மாதிரி தேர்வை 최பயோகப்படுத்தவும்:**
```python
# செலவைக் கருத்தில் கொள்ளும் மாடல் தேர்வு
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # ஒவ்வொரு 1K டோக்கனுக்கும்
    'gpt-4': 0.03,          # ஒவ்வொரு 1K டோக்கனுக்கும்
    'gpt-35-turbo': 0.0015  # ஒவ்வொரு 1K டோக்கனுக்கும்
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
# விரிவான பதிவுகளைச் செயல்படுத்தவும்
azd up --debug

# வெளியீட்டு நிலையை சரிபார்க்கவும்
azd show

# செயலியின் பதிவுகளைப் பார்க்கவும் (கண்காணிப்பு டாஷ்போர்டை திறக்கும்)
azd monitor --logs

# நிகழ்நேர அளவுகோல்களைப் பார்க்கவும்
azd monitor --live

# சூழல் மாறிலிகளைச் சரிபார்க்கவும்
azd env get-values
```

### பயன்பாட்டு பிழைதிருத்தம்

1. **மைமார்ந்த பதிவு (Structured Logging):**
```python
import logging
import json

# ஏஐ பயன்பாடுகளுக்கான கட்டமைக்கப்பட்ட பதிவுகளை அமைக்கவும்
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

2. **Health Check Endpoints:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # OpenAI இணைப்பைச் சரிபார்க்கவும்
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # தேடல் சேவையைச் சரிபார்க்கவும்
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

3. **செயல்திறன் ஒளிவேடிப்பு (Performance Monitoring):**
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

| Error Code | Description | Solution |
|------------|-------------|----------|
| 401 | அங்கீகாரம் இல்லை | API விசைகளையும் managed identity கட்டமைப்பையும் சரிபார் |
| 403 | தடைசெய்யப்பட்டது | RBAC பத்திரஒதுக்கீடுகளை உறுதிசெய்க |
| 429 | வீதக்குறைவு | எக்ஸ்போனென்ஷியல் பேக்க்அஃப் உடன் மீண்டும் முயற்சி லாஜிக் ஐ செயல்படுத்தவும் |
| 500 | உள்நாட்டு சர்வர் பிழை | மாதிரி டிப்ளாய்மென்ட் நிலை மற்றும் லாக்களை சரிபார் |
| 503 | சேவை கிடைக்கவில்லை | சேவை ஆரோக்கியமும் பிராந்திய கிடைக்கும் இருப்பையும் சரிபார் |

## அடுத்த படிகள்

1. **[AI Model Deployment Guide](../chapter-02-ai-development/ai-model-deployment.md)** ஐ டிப்பிளாய்மென்ட் சிறந்த நடைமுறைகளுக்காக மீட்டாய்வு செய்யவும்
2. **[Production AI Practices](../chapter-08-production/production-ai-practices.md)** ஐ நிறுவனத் தயாரான தீர்வுகளுக்காக முடிக்கவும்
3. **[Microsoft Foundry Discord](https://aka.ms/foundry/discord)** இல் சமூக ஆதரவிற்கு சேரவும்
4. **AZD-சார்ந்த பிரச்சனைகளுக்கு [AZD GitHub சேமகம்](https://github.com/Azure/azure-dev)** இல் பிரச்சனைகளை சமர்ப்பிக்கவும்

## வளங்கள்

- [Azure OpenAI Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 Course Home**: [AZD தொடக்கர்களுக்கான](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: Chapter 7 - பிழைதிருத்தம் மற்றும் டீபக்கிங்
- **⬅️ முந்தையது**: [டீபக்கிங் வழிகாட்டு](debugging.md)
- **➡️ அடுத்த அத்தியாயம்**: [அத்தியாயம் 8: உற்பத்தி மற்றும் நிறுவன முறைபாடுகள்](../chapter-08-production/production-ai-practices.md)
- **🤖 தொடர்புடையது**: [அத்தியாயம் 2: AI-முதலில் மேம்பாடு](../chapter-02-ai-development/microsoft-foundry-integration.md)
- [Azure Developer CLI Troubleshooting](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
தகவல் மறுப்பு:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவையான [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்குப் முயற்சித்தாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது துல்லியக்குறைவுகள் இருக்கலாம் என்பதை கவனிக்கவும். மூல ஆவணம் அதன் சொந்த மொழியில் அதிகாரப்பூர்வ ஆதாரமாகக் கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பை பரிந்துரைக்கிறோம். இந்த மொழிபெயர்ப்பின் பயன்பாட்டால் ஏற்படக்கூடிய எந்த தவறான புரிதல்களுக்கும் அல்லது தவறான விளக்கங்களுக்கும் நாங்கள் பொறுப்பேற்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->