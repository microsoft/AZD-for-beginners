<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c8ab8fd8ed338b3ec17484b453dcda68",
  "translation_date": "2025-10-11T16:01:47+00:00",
  "source_file": "docs/troubleshooting/ai-troubleshooting.md",
  "language_code": "ta"
}
-->
# AI-சிறப்பு பிழைத்திருத்த வழிகாட்டி

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 நடப்பு அத்தியாயம்**: அத்தியாயம் 7 - பிழைத்திருத்தம் & பிழை கண்டறிதல்
- **⬅️ முந்தையது**: [பிழை கண்டறிதல் வழிகாட்டி](debugging.md)
- **➡️ அடுத்த அத்தியாயம்**: [அத்தியாயம் 8: உற்பத்தி & நிறுவன முறைகள்](../ai-foundry/production-ai-practices.md)
- **🤖 தொடர்புடையது**: [அத்தியாயம் 2: AI-முதலில் மேம்பாடு](../ai-foundry/azure-ai-foundry-integration.md)

**முந்தையது:** [Production AI Practices](../ai-foundry/production-ai-practices.md) | **அடுத்தது:** [AZD உடன் தொடங்குதல்](../getting-started/README.md)

AZD உடன் AI தீர்வுகளை செயல்படுத்தும்போது ஏற்படும் பொதுவான சிக்கல்களை இந்த விரிவான பிழைத்திருத்த வழிகாட்டி விளக்குகிறது, மேலும் Azure AI சேவைகளுக்கே உரிய தீர்வுகள் மற்றும் பிழை கண்டறிதல் நுட்பங்களை வழங்குகிறது.

## உள்ளடக்க அட்டவணை

- [Azure OpenAI சேவை சிக்கல்கள்](../../../../docs/troubleshooting)
- [Azure AI தேடல் பிரச்சினைகள்](../../../../docs/troubleshooting)
- [கண்டெய்னர் பயன்பாடுகள் செயல்படுத்தும் சிக்கல்கள்](../../../../docs/troubleshooting)
- [அங்கீகாரம் மற்றும் அனுமதி பிழைகள்](../../../../docs/troubleshooting)
- [மாதிரி செயல்படுத்தல் தோல்விகள்](../../../../docs/troubleshooting)
- [செயல்திறன் மற்றும் அளவீட்டு சிக்கல்கள்](../../../../docs/troubleshooting)
- [செலவு மற்றும் ஒதுக்கீடு மேலாண்மை](../../../../docs/troubleshooting)
- [பிழை கண்டறிதல் கருவிகள் மற்றும் நுட்பங்கள்](../../../../docs/troubleshooting)

## Azure OpenAI சேவை சிக்கல்கள்

### சிக்கல்: OpenAI சேவை பிராந்தியத்தில் கிடைக்கவில்லை

**அறிகுறிகள்:**
```
Error: The requested resource type is not available in the location 'westus'
```

**காரணங்கள்:**
- தேர்ந்தெடுக்கப்பட்ட பிராந்தியத்தில் Azure OpenAI கிடைக்கவில்லை
- விருப்பமான பிராந்தியங்களில் ஒதுக்கீடு முடிந்துவிட்டது
- பிராந்திய திறன் கட்டுப்பாடுகள்

**தீர்வுகள்:**

1. **பிராந்திய கிடைப்பை சரிபார்க்கவும்:**
```bash
# List available regions for OpenAI
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

### சிக்கல்: மாதிரி செயல்படுத்தல் ஒதுக்கீடு மீறப்பட்டது

**அறிகுறிகள்:**
```
Error: Deployment failed due to insufficient quota
```

**தீர்வுகள்:**

1. **தற்போதைய ஒதுக்கீட்டை சரிபார்க்கவும்:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **ஒதுக்கீடு அதிகரிக்க கோரிக்கை விடுக்கவும்:**
```bash
# Submit quota increase request
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

### சிக்கல்: தவறான API பதிப்பு

**அறிகுறிகள்:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**தீர்வுகள்:**

1. **ஆதரிக்கப்படும் API பதிப்பைப் பயன்படுத்தவும்:**
```python
# Use latest supported version
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API பதிப்பு இணக்கத்தன்மையை சரிபார்க்கவும்:**
```bash
# List supported API versions
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI தேடல் பிரச்சினைகள்

### சிக்கல்: தேடல் சேவை விலை நிலை போதுமானதாக இல்லை

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

2. **செமாண்டிக் தேடலை முடக்கு (மேம்பாடு):**
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

### சிக்கல்: குறியீடு உருவாக்கல் தோல்விகள்

**அறிகுறிகள்:**
```
Error: Cannot create index, insufficient permissions
```

**தீர்வுகள்:**

1. **தேடல் சேவை விசைகளை சரிபார்க்கவும்:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **குறியீட்டு அமைப்பை சரிபார்க்கவும்:**
```python
# Validate index schema
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

## கண்டெய்னர் பயன்பாடுகள் செயல்படுத்தும் சிக்கல்கள்

### சிக்கல்: கண்டெய்னர் கட்டுமான தோல்விகள்

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

2. **இணைப்பு தேவைகளை சரிபார்க்கவும்:**
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

3. **சுகாதார சோதனையைச் சேர்க்கவும்:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### சிக்கல்: கண்டெய்னர் பயன்பாடு தொடக்க தோல்விகள்

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

2. **மாதிரி ஏற்றுதலை மேம்படுத்தவும்:**
```python
# Lazy load models to reduce startup time
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
        # Initialize AI client here
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Startup
    app.state.model_manager = ModelManager()
    yield
    # Shutdown
    pass

app = FastAPI(lifespan=lifespan)
```

## அங்கீகாரம் மற்றும் அனுமதி பிழைகள்

### சிக்கல்: மேலாண்மை அடையாள அனுமதி மறுக்கப்பட்டது

**அறிகுறிகள்:**
```
Error: Authentication failed for Azure OpenAI Service
```

**தீர்வுகள்:**

1. **பங்கு ஒதுக்கீடுகளை சரிபார்க்கவும்:**
```bash
# Check current role assignments
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
# Test managed identity authentication
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

### சிக்கல்: கீ வால்ட் அணுகல் மறுக்கப்பட்டது

**அறிகுறிகள்:**
```
Error: The user, group or application does not have secrets get permission
```

**தீர்வுகள்:**

1. **கீ வால்ட் அனுமதிகளை வழங்கவும்:**
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

## மாதிரி செயல்படுத்தல் தோல்விகள்

### சிக்கல்: மாதிரி பதிப்பு கிடைக்கவில்லை

**அறிகுறிகள்:**
```
Error: Model version 'gpt-4-32k' is not available
```

**தீர்வுகள்:**

1. **கிடைக்கும் மாதிரிகளை சரிபார்க்கவும்:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **மாதிரி மாற்றங்களைப் பயன்படுத்தவும்:**
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

3. **செயல்படுத்துவதற்கு முன் மாதிரியை சரிபார்க்கவும்:**
```python
# Pre-deployment model validation
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

### சிக்கல்: அதிக தாமதமான பதில்கள்

**அறிகுறிகள்:**
- பதில் நேரம் > 30 விநாடிகள்
- டைம்அவுட் பிழைகள்
- மோசமான பயனர் அனுபவம்

**தீர்வுகள்:**

1. **கோரிக்கை டைம்அவுட்களை செயல்படுத்தவும்:**
```python
# Configure proper timeouts
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

2. **பதில் காட்சிப்படுத்தலைச் சேர்க்கவும்:**
```python
# Redis cache for responses
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

3. **தானியங்கி அளவீட்டை அமைக்கவும்:**
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

### சிக்கல்: நினைவக குறைவின் பிழைகள்

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
# Memory-efficient model handling
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Check memory usage before processing
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Force garbage collection
            
        result = await self._process_ai_request(request)
        
        # Clean up after processing
        gc.collect()
        return result
```

## செலவு மற்றும் ஒதுக்கீடு மேலாண்மை

### சிக்கல்: எதிர்பாராத அதிக செலவுகள்

**அறிகுறிகள்:**
- Azure பில் எதிர்பார்த்ததை விட அதிகமாக உள்ளது
- டோக்கன் பயன்பாடு மதிப்பீடுகளை மீறுகிறது
- பட்ஜெட் எச்சரிக்கைகள் இயக்கப்பட்டுள்ளன

**தீர்வுகள்:**

1. **செலவுக் கட்டுப்பாடுகளை செயல்படுத்தவும்:**
```python
# Token usage tracking
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

2. **செலவுக் எச்சரிக்கைகளை அமைக்கவும்:**
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
# Cost-aware model selection
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # per 1K tokens
    'gpt-4': 0.03,          # per 1K tokens
    'gpt-35-turbo': 0.0015  # per 1K tokens
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

## பிழை கண்டறிதல் கருவிகள் மற்றும் நுட்பங்கள்

### AZD பிழை கண்டறிதல் கட்டளைகள்

```bash
# Enable verbose logging
azd up --debug

# Check deployment status
azd show

# View deployment logs
azd logs --follow

# Check environment variables
azd env get-values
```

### பயன்பாட்டு பிழை கண்டறிதல்

1. **கட்டமைக்கப்பட்ட பதிவு:**
```python
import logging
import json

# Configure structured logging for AI applications
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

2. **சுகாதார சோதனை முடிவுகள்:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Check OpenAI connectivity
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Check Search service
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
| 401 | அங்கீகாரம் செய்யப்படவில்லை | API விசைகள் மற்றும் மேலாண்மை அடையாள அமைப்பை சரிபார்க்கவும் |
| 403 | தடைசெய்யப்பட்டது | RBAC பங்கு ஒதுக்கீடுகளை சரிபார்க்கவும் |
| 429 | வீத வரம்பு | பரிமாற்றம் மீண்டும் முயற்சிக்க மடங்கல் பின்னடைவுடன் செயல்படுத்தவும் |
| 500 | உள் சேவை பிழை | மாதிரி செயல்படுத்தல் நிலை மற்றும் பதிவுகளை சரிபார்க்கவும் |
| 503 | சேவை கிடைக்கவில்லை | சேவை ஆரோக்கியம் மற்றும் பிராந்திய கிடைப்பை சரிபார்க்கவும் |

## அடுத்த படிகள்

1. **[AI மாதிரி செயல்படுத்தல் வழிகாட்டி](ai-model-deployment.md)**யை ஆய்வு செய்யவும்
2. **[Production AI Practices](production-ai-practices.md)**யை முடிக்கவும் நிறுவனத்திற்கேற்ப தீர்வுகளுக்காக
3. **[Azure AI Foundry Discord](https://aka.ms/foundry/discord)**யில் சமூக ஆதரவைப் பெற சேரவும்
4. **சிக்கல்களை சமர்ப்பிக்கவும்** [AZD GitHub repository](https://github.com/Azure/azure-dev)க்கு AZD-சிறப்பு பிரச்சினைகளுக்காக

## வளங்கள்

- [Azure OpenAI சேவை பிழைத்திருத்தம்](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [கண்டெய்னர் பயன்பாடுகள் பிழைத்திருத்தம்](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI தேடல் பிழைத்திருத்தம்](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 நடப்பு அத்தியாயம்**: அத்தியாயம் 7 - Troubleshooting & Debugging
- **⬅️ முந்தையது**: [Debugging Guide](debugging.md)
- **➡️ அடுத்த அத்தியாயம்**: [Chapter 8: Production & Enterprise Patterns](../ai-foundry/production-ai-practices.md)
- **🤖 தொடர்புடையது**: [Chapter 2: AI-First Development](../ai-foundry/azure-ai-foundry-integration.md)
- [Azure Developer CLI Troubleshooting](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

**குறிப்பு**:  
இந்த ஆவணம் [Co-op Translator](https://github.com/Azure/co-op-translator) என்ற AI மொழிபெயர்ப்பு சேவையைப் பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சிக்கிறோம், ஆனால் தானியக்க மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான தகவல்கள் இருக்கக்கூடும் என்பதை தயவுசெய்து கவனத்தில் கொள்ளுங்கள். அதன் தாய்மொழியில் உள்ள மூல ஆவணம் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கங்களுக்கு நாங்கள் பொறுப்பல்ல.