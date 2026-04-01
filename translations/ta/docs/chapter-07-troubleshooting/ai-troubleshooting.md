# AI-சார்ந்த பிழைத் தீர்வு வழிகாட்டி

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD தொடக்கம்](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 7 - பிரச்சனை தீர்வு மற்றும் பிழை நீக்குதல்
- **⬅️ முந்தையது**: [பிழை நீக்க வழிகாட்டி](debugging.md)
- **➡️ அடுத்த அத்தியாயம்**: [அத்தியாயம் 8: உற்பத்தி மற்றும் நிறுவன வடிவங்கள்](../chapter-08-production/production-ai-practices.md)
- **🤖 தொடர்புடையது**: [அத்தியாயம் 2: AI-முதன்மை அபிவிருத்தி](../chapter-02-ai-development/microsoft-foundry-integration.md)

இந்த விரிவான பிழைத் தீர்க்கும் வழிகாட்டி AZD மூலம் AI தீர்வுகளை அமைக்கும் போது ஏற்படும் பொதுவான பிரச்சனைகளை அணுகுகிறது, மேலும் Azure AI சேவைகளுக்கு தொடர்புடைய தீர்வுகள் மற்றும் பிழை நீக்க தொழில்நுட்பங்களை வழங்குகிறது.

## உள்ளடக்க அட்டவணை

- [Microsoft Foundry மாதிரிகள் சேவை பிரச்சனைகள்](#azure-openai-service-issues)
- [Azure AI தேடல் பிரச்சனைகள்](#azure-ai-தேடல்-பிரச்சனைகள்)
- [கண்டெய்னர் பயன்பாடுகள் (Container Apps) раз் ஆய்வு பிரச்சனைகள்](#container-apps-deployment-issues)
- [அங்கீகாரம் மற்றும் அனுமதி பிழைகள்](#அங்கீகாரம்-மற்றும்-அனுமதி-பிழைகள்)
- [மாதிரி அமர்வு (Model) தோல்விகள்](#மாதிரி-அமர்வு-தோல்விகள்)
- [நிறைவு மற்றும் அளவீட்டு பிரச்சனைகள்](#செயல்திறன்-மற்றும்-அளவீட்டு-பிரச்சனைகள்)
- [செலவுகள் மற்றும் கோட்டா நிர்வாகம்](#செலவுகள்-மற்றும்-கோட்டா-நிர்வாகம்)
- [பிழைத் தடுப்பு கருவிகள் மற்றும் தொழில்நுட்பங்கள்](#பிழைத்-தடுப்பு-கருவிகள்-மற்றும்-தொழில்நுட்பங்கள்)

## Microsoft Foundry மாதிரிகள் சேவை பிரச்சனைகள்

### பிரச்சினை: தேர்ந்தெடுக்கப்பட்ட பிராந்தியத்தில் OpenAI சேவை கிடைக்கவில்லை

**அறிகுறிகள்:**
```
Error: The requested resource type is not available in the location 'westus'
```

**காரணங்கள்:**
- தேர்ந்தெடுக்கப்பட்ட பிராந்தியத்தில் Microsoft Foundry மாதிரிகள் கிடைக்கவில்லை
- முன்னுரிமைப்பட்ட பிராந்தியங்களில் கோட்டா முழுமையாக பயன்படுத்தப்பட்டுள்ளது
- பிராந்திய திறன் கட்டுப்பாடுகள்

**தீர்வுகள்:**

1. **பிராந்திய கிடைமையை சரிபார்க்கவும்:**
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

### பிரச்சினை: மாதிரி அமர்வு கோட்டா மீறப்பட்டது

**அறிகுறிகள்:**
```
Error: Deployment failed due to insufficient quota
```

**தீர்வுகள்:**

1. **தற்போதைய கோட்டாவை சரிபார்க்கவும்:**
```bash
# கோட்டா பயன்பாட்டை சரிபார்க்கவும்
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **கோட்டா அதிகரிப்பை கோரவும்:**
```bash
# குவோட்டா உயர்விற்கு கோரிக்கை சமர்ப்பிக்கவும்
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **மாதிரி திறன் ஒழுங்கு செய்யவும்:**
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

1. **ஆதரிக்கப்படும் API பதிப்பை பயன்படுத்தவும்:**
```python
# சமீபத்திய ஆதரிக்கப்பட்ட பதிப்பை பயன்படுத்தவும்
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API பதிப்பு பொருத்தத்தைக் சரிபார்க்கவும்:**
```bash
# ஆதரிக்கப்படும் API பதிப்புகளை பட்டியலிடவும்
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI தேடல் பிரச்சனைகள்

### பிரச்சினை: தேடல் சேவையின் விலை நிலை போதுமானதாக இல்லை

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

2. **விளக்க மேம்பாடு (Semantic Search) ஐ (வளர்ச்சிக்காலத்தில்) முடக்கு:**
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

### பிரச்சினை: குறியீடு (Index) உருவாக்க தோல்விகள்

**அறிகுறிகள்:**
```
Error: Cannot create index, insufficient permissions
```

**தீர்வுகள்:**

1. **Search சேவை விசைகளை சரிபார்க்கவும்:**
```bash
# தேடல் சேவையின் நிர்வாக விசையைப் பெறவும்
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **IndexSchema ஐச் சரிபார்க்கவும்:**
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

## Container Apps Deployment Issues

### பிரச்சினை: கட்டெய்னர் கட்டமைப்பு தோல்விகள்

**அறிகுறிகள்:**
```
Error: Failed to build container image
```

**தீர்வுகள்:**

1. **Dockerfile இலக்கணம் சரிபார்க்கவும்:**
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

2. **நிரம்புதல் (Dependencies) சரிபார்:**
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

3. **நலம் சோதனைச் சோகத்தை சேர்க்கவும்:**
```python
# main.py - சேவையின் நிலையைச் சரிபார்க்கும் எண்ட்பாயிண்டை சேர்க்கவும்
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### பிரச்சினை: Container App துவக்கம் தோல்விகள்

**அறிகுறிகள்:**
```
Error: Container failed to start within timeout period
```

**தீர்வுகள்:**

1. **துவக்க நேர எல்லையை அதிகரிக்கவும்:**
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
# தொடக்க நேரத்தை குறைக்க மாடல்களை தாமதமாக ஏற்றவும்
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
        # இங்கே AI கிளையன்டை ஆரம்பிக்கவும்
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # தொடக்கம்
    app.state.model_manager = ModelManager()
    yield
    # மூடுதல்
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

1. **பங்கு நியமனங்களை சரிபார்க்கவும்:**
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

3. **அங்கீகாரம் சோதனை செய்யவும்:**
```python
# மேலாண்மை அடையாளத்தின் அங்கீகாரத்தை சோதிக்க
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

2. **Access Policies இற்கு பதிலாக RBAC ஐப் பயன்படுத்தவும்:**
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

## மாதிரி அமர்வு தோல்விகள்

### பிரச்சினை: மாதிரி பதிப்பு கிடைக்காது

**அறிகுறிகள்:**
```
Error: Model version 'gpt-4-32k' is not available
```

**தீர்வுகள்:**

1. **கிடைக்கும் மாதிரிகளை சரிபார்க்கவும்:**
```bash
# கிடைக்கக்கூடிய மாதிரிகளை பட்டியலிடு
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **மாதிரிகளுக்கானFallback-ஐப் பயன்படுத்தவும்:**
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

3. **அமர்வுக்கு முன் மாதிரியை சரிபார்க்கவும்:**
```python
# வெளியீட்டிற்கு முன் மாதிரி சரிபார்ப்பு
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

## செயல்திறன் மற்றும் அளவீட்டு பிரச்சனைகள்

### பிரச்சினை: உயர்ந்த இடைவெளி (High Latency) பதில்கள்

**அறிகுறிகள்:**
- பதில் நேரங்கள் > 30 இரண்டுகள்
- காலஅவகாச பிழைகள்
- மோசமான பயனர் அனுபவம்

**தீர்வுகள்:**

1. **கோரிக்கை காலஅவகாசங்களை அமல்படுத்தவும்:**
```python
# சரியான கால அவுட்களை அமைக்கவும்
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

2. **பதில் கேச் செய்யுதல் சேர்க்கவும்:**
```python
# பதில்களுக்கான Redis கேச்
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

3. **தானாக அளவை மாற்றுமுறை (Auto-scaling) கட்டமைக்கவும்:**
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

### பிரச்சினை: நினைவக வெளியேறல் பிழைகள் (Memory Out of Errors)

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

2. **நினைவக பயன்பாட்டை ஒழுங்கு செய்யவும்:**
```python
# நினைவகத்தை சிறப்பாக பயன்படுத்தும் மாதிரி நிர்வகித்தல்
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # செயலாக்கத்திற்கு முன் நினைவக பயன்பாட்டைச் சரிபார்க்கவும்
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # கழிவுப் பொருள் சேகரிப்பை கட்டாயப்படுத்தவும்
            
        result = await self._process_ai_request(request)
        
        # செயலாக்கத்தின் பின் சுத்திகரிக்கவும்
        gc.collect()
        return result
```

## செலவுகள் மற்றும் கோட்டா நிர்வாகம்

### பிரச்சினை: எதிர்பாராத உயர்ந்த செலவுகள்

**அறிகுறிகள்:**
- Azureார் பில் எதிர்பார்த்ததைவிட அதிகமாக உள்ளது
- டோக்கன் பயன்பாடு மதிப்பீடுகளைத் தாண்டுகிறது
- பட்ஜெட் எச்சரிக்கைகள் உருவாகின்றன

**தீர்வுகள்:**

1. **செலவு கட்டுப்பாடுகளை அமல்படுத்தவும்:**
```python
# டோக்கன் பயன்பாடு கண்காணிப்பு
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
# செலவை கருத்தில் கொண்டு மாதிரி தேர்வு
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

## பிழைத் தடுப்பு கருவிகள் மற்றும் தொழில்நுட்பங்கள்

### AZD பிழை நீக்க கட்டளைகள்

```bash
# விரிவான பதிவு செயல்படுத்தவும்
azd up --debug

# டெப்ளாய்மெண்ட் நிலையை சரிபார்க்கவும்
azd show

# பயன்பாட்டின் பதிவுகளைப் பார்க்கவும் (கண்காணிப்புத் தாள்(டாஷ் போர்டை) திறக்கிறது)
azd monitor --logs

# நேரடி அளவுகோல்களைப் பார்க்கவும்
azd monitor --live

# சூழல் மாறிலிகளை சரிபார்க்கவும்
azd env get-values
```

### AZD AI நீட்சிக் கமாண்டுகள் (Diagnostics) க்கு

நீங்கள் `azd ai agent init` பயன்படுத்தி ஏஜண்டுகள் (agents) நிறுவினீர்களானால், இந்த கூடுதல் கருவிகள் கிடைக்கும்:

```bash
# agents விரிவாக்கம் நிறுவப்பட்டுள்ளதை உறுதி செய்யவும்
azd extension install azure.ai.agents

# manifest இலிருந்து ஒரு agent ஐ மறுஆரம்பிக்க அல்லது புதுப்பிக்கவும்
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# MCP சர்வரை பயன்படுத்தி ஏஐ கருவிகள் திட்டத்தின் நிலையைக் கேட்க அனுமதிக்கவும்
azd mcp start

# பரிசீலனை மற்றும் ஆடிட் பார்வைக்காக அடிப்படை கட்டமைப்பு கோப்புகளை உருவாக்கவும்
azd infra generate
```

> **குறிப்பு:** IaC ஐ டிஸ்க்கில் எழுத `azd infra generate` ஐ பயன்படுத்துங்கள், இதன்மூலம் எந்த வளங்கள் துல்லியமாக ஒதுக்கப்பட்டன என்பதை நீங்கள் சுலபமாக பரிசீலிக்கலாம். வளக் கட்டமைப்பு பிரச்சனைகளைக் குறைக்கும்போது இது மிகவும் பயனுள்ளது. முழு விவரங்களுக்கு [AZD AI CLI குறிப்புகளை](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) பார்க்கவும்.

### பயன்பாட்டு பிழை நீக்குதல்

1. **ஒழுங்கமைக்கப்பட்ட பதிவு (Structured Logging):**
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

2. **ஆரோக்கிய சோதனை எண்ட்பாயின்ட்கள் (Health Check Endpoints):**
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

3. **செயல்திறன் கண்காணிப்பு (Performance Monitoring):**
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
| 401 | அனுமதி இல்லை | API திறவுகோல்கள் மற்றும் Managed Identity கட்டமைப்புகளை சரிபார்க்கவும் |
| 403 | தடைக்கப்பட்டது | RBAC பங்கு நியமனங்களை சரிபார்க்கவும் |
| 429 | விகித வரம்பு விதிக்கப்பட்டது | மீண்டும் முயற்சி செய்யும் போது எக்ஸ்போனென்ஷியல் பாக்ஓப் முறையை பயன் படுத்தி retry லாஜிக் செயல்படுத்தவும் |
| 500 | உள்ளக சேவையாளர் பிழை | மாதிரி அமர்வு நிலை மற்றும் பதிவுகளை சரிபார்க்கவும் |
| 503 | சேவை கிடைக்கவில்லை | சேவை நலம் மற்றும் பிராந்திய கிடைப்பினைப் பரிசோதிக்கவும் |

## அடுத்த படிகள்

1. **மீண்டும் ஆய்வு செய்யவும் [AI மாதிரி வழங்கல் வழிகாட்டி](../chapter-02-ai-development/ai-model-deployment.md)** வழங்கலுக்கான சிறந்த நடைமுறைகளுக்காக
2. **முடிக்கவும் [உற்பத்தி AI நடைமுறைகள்](../chapter-08-production/production-ai-practices.md)** நிறுவனத்தகுந்த தீர்வுகளுக்காக
3. **சேரவும் [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** சமுதாய ஆதர்வுக்கு
4. **பிரச்சனைகளை சமர்ப்பிக்கவும்** AZD-குறித்த பிரச்சனைகளுக்கு [AZD GitHub சேமிப்பகத்திற்கு](https://github.com/Azure/azure-dev)

## வளங்கள்

- [Microsoft Foundry Models Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - உங்கள் எடிட்டரில் Azure பிழைத் தீர்க்கும் திறன்களை நிறுவ: `npx skills add microsoft/github-copilot-for-azure`

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD தொடக்கம்](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 7 - பிரச்சனை தீர்வு மற்றும் பிழை நீக்குதல்
- **⬅️ முந்தையது**: [பிழை நீக்க வழிகாட்டி](debugging.md)
- **➡️ அடுத்த அத்தியாயம்**: [அத்தியாயம் 8: உற்பத்தி மற்றும் நிறுவன வடிவங்கள்](../chapter-08-production/production-ai-practices.md)
- **🤖 தொடர்புடையது**: [அத்தியாயம் 2: AI-முதன்மை அபிவிருத்தி](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 குறிப்பூட்டு**: [Azure Developer CLI Troubleshooting](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவையான [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்த்துள்ளது. நாங்கள் துல்லியத்திற்காக முயலுகிறோம் என்றாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கக்கூடும் என்பதை தயவுசெய்து கவனத்தில் கொள்ளுங்கள். அசல் ஆவணம் அதன் சொந்த மொழியில் அதிகாரப்பூர்வ மூலமாகக் கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்ப்பை பரிந்துரைக்கிறோம். இந்த மொழிபெயர்ப்பின் பயன்பாட்டினால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கங்களுக்கும் நாங்கள் பொறுப்பேற்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->