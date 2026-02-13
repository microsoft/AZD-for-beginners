# AI-నిర్దిష్ట సమస్య పరిష్కార గైడ్

**అధ్యాయం నావిగేషన్:**
- **📚 కోర్సు హోం**: [AZD ప్రారంభికులకు](../../README.md)
- **📖 Current Chapter**: అధ్యాయం 7 - Troubleshooting & Debugging
- **⬅️ మునుపటి**: [డీబగ్గింగ్ గైడ్](debugging.md)
- **➡️ తర్వాతి అధ్యాయం**: [అధ్యాయం 8: ఉత్పత్తి & ఎంటర్‌ప్రైజ్ నమూనాలు](../chapter-08-production/production-ai-practices.md)
- **🤖 సంబంధిత**: [అధ్యాయం 2: AI-ఫస్ట్ అభివృద్ధి](../chapter-02-ai-development/microsoft-foundry-integration.md)

**Previous:** [ప్రొడక్షన్ AI ప్రాక్టీసెస్](../chapter-08-production/production-ai-practices.md) | **Next:** [AZD మౌలికాలు](../chapter-01-foundation/azd-basics.md)

ఈ విస్తృత ట్రబుల్షూటింగ్ గైడ్ AZDతో AI పరిష్కారాలను డిప్లోయ్ చేయేటప్పుడు కనిపించే సాధారణ సమస్యలను ఎదుర్కొంటుంది, మరియు Azure AI సేవలకు ప్రత్యేక పరిష్కారాలు మరియు డీబగ్గింగ్ సాంకేతికతలను అందిస్తుంది.

## విషయ సూచిక

- [Azure OpenAI Service Issues](../../../../docs/chapter-07-troubleshooting)
- [Azure AI Search Problems](../../../../docs/chapter-07-troubleshooting)
- [Container Apps Deployment Issues](../../../../docs/chapter-07-troubleshooting)
- [Authentication and Permission Errors](../../../../docs/chapter-07-troubleshooting)
- [Model Deployment Failures](../../../../docs/chapter-07-troubleshooting)
- [Performance and Scaling Issues](../../../../docs/chapter-07-troubleshooting)
- [Cost and Quota Management](../../../../docs/chapter-07-troubleshooting)
- [Debugging Tools and Techniques](../../../../docs/chapter-07-troubleshooting)

## Azure OpenAI సేవ సమస్యలు

### సమస్య: ఎంచుకున్న ప్రాంతంలో OpenAI సేవ అందుబాటులో లేదు

**లక్షణాలు:**
```
Error: The requested resource type is not available in the location 'westus'
```

**కారణాలు:**
- ఎంచుకున్న ప్రాంతంలో Azure OpenAI అందుబాటులో లేదు
- ఇష్టమైన ప్రాంతాలలో క్వోటా తీరిపోయింది
- ప్రాంతీయ సామర్థ్య పరిమితులు

**పరిష్కారాలు:**

1. **ప్రాంతం అందుబాటును తనిఖీ చేయండి:**
```bash
# OpenAI కోసం అందుబాటులో ఉన్న ప్రాంతాలను జాబితా చేయండి
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **AZD కాన్ఫిగరేషన్ ను నవీకరించండి:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **వికల్ప ప్రాంతాలను ఉపయోగించండి:**
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

### సమస్య: మోడల్ డిప్లాయ్ క్వోటా మించి పోయి ఉంది

**లక్షణాలు:**
```
Error: Deployment failed due to insufficient quota
```

**పరిష్కారాలు:**

1. **ప్రస్తుత క్వోటాను తనిఖీ చేయండి:**
```bash
# క్వోటా వినియోగాన్ని తనిఖీ చేయండి
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **క్వోటా పెంపు అభ్యర్థించండి:**
```bash
# క్వోటా పెంపు కోసం అభ్యర్థన సమర్పించండి
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **మోడల్ సామర్థ్యాన్ని ఆప్టిమైజ్ చేయండి:**
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

### సమస్య: చెల్లని API వెర్షన్

**లక్షణాలు:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**పరిష్కారాలు:**

1. **మద్దతిచ్చే API వెర్షన్ ఉపయోగించండి:**
```python
# మద్దతు పొందిన తాజా సంస్కరణను ఉపయోగించండి
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API వెర్షన్ అనుకూలతను తనిఖీ చేయండి:**
```bash
# మద్దతు ఉన్న API సంచికలను జాబితా చేయండి
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search సమస్యలు

### సమస్య: Search సేవ యొక్క ప్రైసింగ్ టియర్ తగినంత కాదు

**లక్షణాలు:**
```
Error: Semantic search requires Basic tier or higher
```

**పరిష్కారాలు:**

1. **ప్రైసింగ్ టియర్ అప్గ్రేడ్ చేయండి:**
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

2. **సెమాంటిక్ సెర్చ్‌ను నిలిపివేయండి (డెవలప్‌మెంట్):**
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

### సమస్య: ఇండెక్స్ సృష్టి విఫలమవుతుంది

**లక్షణాలు:**
```
Error: Cannot create index, insufficient permissions
```

**పరిష్కారాలు:**

1. **Search సేవ కీస్‌ను పరిశీలించండి:**
```bash
# శోధన సేవకు అడ్మిన్ కీ పొందండి
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **ఇండెక్స్ స్కీమాను తనిఖీ చేయండి:**
```python
# ఇన్డెక్స్ స్కీమాను ధృవీకరించండి
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

3. **Managed Identity ఉపయోగించండి:**
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

## Container Apps డిప్లాయ్ సమస్యలు

### సమస్య: కంటెయినర్ బిల్డ్ విఫలతలు

**లక్షణాలు:**
```
Error: Failed to build container image
```

**పరిష్కారాలు:**

1. **Dockerfile సింటాక్స్ ను తనిఖీ చేయండి:**
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

2. **డిపెండెన్సీలను సరిచూడండి:**
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

3. **హెల్త్ చెక్ జోడించండి:**
```python
# main.py - ఆరోగ్య తనిఖీ ఎండ్‌పాయింట్ జోడించండి
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### సమస్య: కంటెయినర్ యాప్ స్టార్ట్‑అప్ విఫలతలు

**లక్షణాలు:**
```
Error: Container failed to start within timeout period
```

**పరిష్కారాలు:**

1. **స్టార్టప్ టైమౌట్ పెంచండి:**
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

2. **మోడల్ లోడింగ్‌ను ఆప్టిమైజ్ చేయండి:**
```python
# ప్రారంభ సమయాన్ని తగ్గించడానికి మోడళ్లను ఆలస్యంగా లోడ్ చేయండి
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
        # ఇక్కడ AI క్లయింట్‌ను ప్రారంభించండి
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # ప్రారంభం
    app.state.model_manager = ModelManager()
    yield
    # నిలిపివేత
    pass

app = FastAPI(lifespan=lifespan)
```

## ఆథెంటికేషన్ మరియు అనుమతుల లోపాలు

### సమస్య: Managed Identityకి అనుమతి నిరాకరించబడింది

**లక్షణాలు:**
```
Error: Authentication failed for Azure OpenAI Service
```

**పరిష్కారాలు:**

1. **రోల్ నియామకాలను ధృవీకరించండి:**
```bash
# ప్రస్తుత పాత్ర కేటాయింపులను తనిఖీ చేయండి
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **అవసరమైన రోల్స్ ని కేటాయించండి:**
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

3. **ఆథెంటికేషన్ ని పరీక్షించండి:**
```python
# నిర్వహించబడిన గుర్తింపు ప్రామాణీకరణను పరీక్షించండి
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

### సమస్య: Key Vault యాక్సెస్ నిరాకరించబడింది

**లక్షణాలు:**
```
Error: The user, group or application does not have secrets get permission
```

**పరిష్కారాలు:**

1. **Key Vault అనుమతులను ఇవ్వండి:**
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

2. **Access Policies బదులు RBAC ఉపయోగించండి:**
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

## మోడల్ డిప్లాయ్ విఫలతలు

### సమస్య: మోడల్ వెర్షన్ అందుబాటులో లేదు

**లక్షణాలు:**
```
Error: Model version 'gpt-4-32k' is not available
```

**పరిష్కారాలు:**

1. **అందుబాటులో ఉన్న మోడల్స్‌ను తనిఖీ చేయండి:**
```bash
# లభ్యమయ్యే మోడల్స్‌ను జాబితా చేయండి
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **మోడల్ ఫాల్బ్యాక్స్ ఉపయోగించండి:**
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

3. **డిప్లాయ్ చేయడానికి ముందు మోడల్‌ను ధృవీకరించండి:**
```python
# డిప్లాయ్‌మెంట్‌కు ముందు మోడల్ ధృవీకరణ
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

## పనితీరు మరియు స్కేలింగ్ సమస్యలు

### సమస్య: అధిక లేటెన్సీ ప్రత్యుత్తరాలు

**లక్షణాలు:**
- ప్రత్యుత్తర సమయాలు > 30 సెకన్లు
- టైమౌట్ లోపాలు
- తగ్గిన వినియోగదారు అనుభవం

**పరిష్కారాలు:**

1. **రిక్వెస్ట్ టైమౌట్లను అమలు చేయండి:**
```python
# సరైన టైమ్‌ఔట్‌లను కాన్ఫిగర్ చేయండి
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

2. **ప్రత్యుత్తర క్యాషింగ్ జోడించండి:**
```python
# స్పందనల కోసం Redis క్యాషే
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

3. **ఆటో-స్కేలింగ్ ను కాన్ఫిగర్ చేయండి:**
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

### సమస్య: మెమరీ తీరన లోపాలు

**లక్షణాలు:**
```
Error: Container killed due to memory limit exceeded
```

**పరిష్కారాలు:**

1. **మెమరీ కేటాయింపును పెంచండి:**
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

2. **మెమరీ వినియోగాన్ని ఆప్టిమైజ్ చేయండి:**
```python
# మెమరీ-సమర్థత కలిగిన మోడల్ నిర్వహణ
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # ప్రాసెసింగ్ ప్రారంభించే ముందు మెమరీ వినియోగాన్ని తనిఖీ చేయండి
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # గార్బేజ్ కలెక్షన్‌ను బలవంతంగా అమలు చేయండి
            
        result = await self._process_ai_request(request)
        
        # ప్రాసెసింగ్ తర్వాత శుభ్రపరచండి
        gc.collect()
        return result
```

## ఖర్చు మరియు క్వోటా నిర్వహణ

### సమస్య: అనుకోని అధిక ఖర్చులు

**లక్షణాలు:**
- Azure బిల్ అంచనాకన్నా ఎక్కువగా ఉంది
- టోకెన్ వినియోగం అంచనాలను మించి ఉంది
- బడ్జెట్ అలర్ట్‌లు ట్రిగ్గర్ అవుతున్నాయి

**పరిష్కారాలు:**

1. **ఖర్చు నియంత్రణను అమలు చేయండి:**
```python
# టోకెన్ వినియోగం ట్రాకింగ్
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

2. **ఖర్చు అలర్ట్‌లు ఏర్పాటు చేయండి:**
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

3. **మోడల్ ఎంపికను ఆప్టిమైజ్ చేయండి:**
```python
# ఖర్చు-ఆధారిత మోడల్ ఎంపిక
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # ప్రతి 1K టోకెన్లకు
    'gpt-4': 0.03,          # ప్రతి 1K టోకెన్లకు
    'gpt-35-turbo': 0.0015  # ప్రతి 1K టోకెన్లకు
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

## డీబగ్గింగ్ టూల్స్ మరియు సాంకేతికతలు

### AZD డీబగ్గింగ్ కమాండ్లు

```bash
# వివరణాత్మక లాగింగ్‌ను సక్రియం చేయండి
azd up --debug

# డిప్లాయ్‌మెంట్ స్థితిని తనిఖీ చేయండి
azd show

# అప్లికేషన్ లాగ్‌లను చూడండి (మానిటరింగ్ డ్యాష్‌బోర్డ్‌ను తెరుస్తుంది)
azd monitor --logs

# లైవ్ మీట్రిక్స్‌ను చూడండి
azd monitor --live

# ఎన్‌విరాన్మెంట్ వేరియబుల్స్‌ను తనిఖీ చేయండి
azd env get-values
```

### అప్లికేషన్ డీబగ్గింగ్

1. **స్ట్రక్చర్డ్ లాగింగ్:**
```python
import logging
import json

# AI అప్లికేషన్ల కోసం నిర్మాణాత్మక లాగింగ్‌ను కాన్ఫిగర్ చేయండి
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

2. **హెల్త్ చెక్ ఎండ్‌పాయింట్స్:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # OpenAI కనెక్టివిటీని తనిఖీ చేయండి
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # శోధన సేవను తనిఖీ చేయండి
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

3. **పర్ఫార్మెన్స్ మానిటరింగ్:**
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

## సాధారణ దోష కోడ్స్ మరియు పరిష్కారాలు

| దోష కోడ్ | వివరణ | పరిష్కారం |
|------------|-------------|----------|
| 401 | అనధికారిత | API కీలు మరియు Managed Identity కాన్ఫిగరేషన్‌ను తనిఖీ చేయండి |
| 403 | నిషేధించబడింది | RBAC రోల్ నియామకాలను ధృవీకరించండి |
| 429 | రేట్ పరిమితి | ఎక్స్‌పొనెన్షియల్ బ్యాక్‌ఆఫ్‌తో రీట్రై లాజిక్ అమలు చేయండి |
| 500 | ఇంటర్నల్ సర్వర్ లోపం | మోడల్ డిప్లాయ్ స్థితి మరియు లాగ్‌లను తనిఖీ చేయండి |
| 503 | సేవ అందుబాటులో లేదు | సేవ ఆరోగ్యాన్ని మరియు ప్రాంతీయ అందుబాటుదనాన్ని తనిఖీ చేయండి |

## తదుపరి దశలు

1. **సమీక్షించండి [AI Model Deployment Guide](../chapter-02-ai-development/ai-model-deployment.md)** డిప్లాయ్ ఉత్తమ పద్ధతుల కోసం
2. **పూర్తి చేయండి [Production AI Practices](../chapter-08-production/production-ai-practices.md)** ఎంటర్‌ప్రైజ్-సిద్ధ పరిష్కారాల కోసం
3. **చేరండి [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** కమ్యూనిటీ మద్దతుకు
4. **ఇష్యూలను సమర్పించండి** [AZD GitHub repository](https://github.com/Azure/azure-dev) కు AZD-స్పెసిఫిక్ సమస్యల కోసం

## వనరులు

- [Azure OpenAI Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**అధ్యాయం నావిగేషన్:**
- **📚 కోర్సు హోం**: [AZD ప్రారంభికులకు](../../README.md)
- **📖 Current Chapter**: అధ్యాయం 7 - Troubleshooting & Debugging
- **⬅️ మునుపటి**: [డీబగ్గింగ్ గైడ్](debugging.md)
- **➡️ తర్వాతి అధ్యాయం**: [అధ్యాయం 8: ఉత్పత్తి & ఎంటర్‌ప్రైజ్ నమూనాలు](../chapter-08-production/production-ai-practices.md)
- **🤖 సంబంధిత**: [అధ్యాయం 2: AI-ఫస్ట్ అభివృద్ధి](../chapter-02-ai-development/microsoft-foundry-integration.md)
- [Azure Developer CLI Troubleshooting](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
అస్పష్టీకరణ:
ఈ పత్రాన్ని AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి యత్నించినప్పటికీ, ఆటోమేటెడ్ అనువాదాలలో తప్పులు లేదా అపసమతలు ఉండవచ్చు అని దయచేసి గమనించండి. మూలభాషలో ఉన్న మూల పత్రాన్ని అధికారికమైన మూలంగా పరిగణించాలి. కీలక సమాచారానికి వృత్తిపరులైన మానవ అనువాదం సిఫార్సు చేయబడుతుంది. ఈ అనువాదాన్ని ఉపయోగించడం వలన ఏర్పడే ఏవైనా అపార్థాలు లేదా తప్పుల కోసం మేము బాధ్యులు కుం౦డ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->