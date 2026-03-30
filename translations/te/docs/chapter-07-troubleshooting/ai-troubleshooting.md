# AI-స్పెసిఫిక్ సమస్య పరిష్కార మార్గదర్శి

**Chapter Navigation:**
- **📚 Course Home**: [AZD ప్రారంభికులకు](../../README.md)
- **📖 Current Chapter**: అధ్యాయం 7 - సమస్య పరిష్కారం & డీబగ్గింగ్
- **⬅️ Previous**: [డీబగ్గింగ్ గైడ్](debugging.md)
- **➡️ Next Chapter**: [అధ్యాయం 8: ఉత్పత్తి & ఎంటర్‌ప్రైజ్ నమూనాలు](../chapter-08-production/production-ai-practices.md)
- **🤖 Related**: [అధ్యాయం 2: AI-ఫస్ట్ డెవలప్‌మెంట్](../chapter-02-ai-development/microsoft-foundry-integration.md)

ఈ సమగ్ర సమస్య పరిష్కార మార్గదర్శి AZD తో AI పరిష్కారాలు డిప్లోయ్ చేయగలప్పుడు ఎదురయ్యే సాధారణ సమస్యలను పరిష్కరిస్తుంది, మరియు Azure AI సేవలకు ప్రత్యేకమైన పరిష్కారాలు మరియు డీబగ్గింగ్ సాంకేతికతలను అందిస్తుంది.

## విషయ సూచిక

- [Microsoft Foundry Models Service Issues](#azure-openai-service-issues)
- [Azure AI సెర్చ్ సమస్యలు](#azure-ai-సెర్చ్-సమస్యలు)
- [Container Apps డిప్లాయ్‌మెంట్ సమస్యలు](#container-apps-డిప్లాయ్‌మెంట్-సమస్యలు)
- [ప్రమాణీకరణ మరియు అనుమతి లోపాలు](#ప్రమాణీకరణ-మరియు-అనుమతి-లోపాలు)
- [మోడల్ డిప్లాయ్‌మెంట్ వైఫల్యాలు](#మోడల్-డిప్లాయ్‌మెంట్-వైఫల్యాలు)
- [పనితీరు మరియు స్కేలింగ్ సమస్యలు](#పనితీరు-మరియు-స్కేలింగ్-సమస్యలు)
- [ఖర్చు మరియు కోటా నిర్వహణ](#ఖర్చు-మరియు-కోటా-నిర్వహణ)
- [డీబగ్గింగ్ సాధనాలు మరియు సాంకేతికతలు](#డీబగ్గింగ్-సాధనాలు-మరియు-సాంకేతికతలు)

## Microsoft Foundry Models Service Issues

### సమస్య: ప్రాంతంలో OpenAI సేవ అందుబాటులో లేదు

**లక్షణాలు:**
```
Error: The requested resource type is not available in the location 'westus'
```

**కారణాలు:**
- ఎంపిక చేసిన ప్రాంతంలో Microsoft Foundry Models అందుబాటులో లేకపోవటం
- ప్రాధాన్య ప్రాంతాల్లో కోటా తీరిపోయి ఉండటం
- ప్రాంతీయ సామర్థ్య పరిమితులు

**పరిష్కారాలు:**

1. **రెజియన్ అందుబాటును తనిఖీ చేయండి:**  
```bash
# OpenAI కోసం అందుబాటులో ఉన్న ప్రాంతాలను జాబితా చేయండి
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **AZD కాన్ఫిగరేషన్ నవీకరించండి:**  
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **ప్రత్యామ్నాయ ప్రాంతాలను ఉపయోగించండి:**  
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

### సమస్య: మోడల్ డిప్లాయ్‌మెంట్ కోటా అధిగమించబడింది

**లక్షణాలు:**
```
Error: Deployment failed due to insufficient quota
```

**పరిష్కారాలు:**

1. **ప్రస్తుత కోటాను తనిఖీ చేయండి:**  
```bash
# క్వోటా వినియోగాన్ని తనిఖీ చేయండి
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **కోటా పెంపుకు అభ్యర్థన చేయండి:**  
```bash
# క్వోటా పెంపు అభ్యర్థన సమర్పించండి
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

### సమస్య: చెల్లని API సంస్కరణ

**లక్షణాలు:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**పరిష్కారాలు:**

1. **మద్దతు ఉన్న API సంస్కరణను ఉపయోగించండి:**  
```python
# మద్దతు పొందిన తాజా సంచికను ఉపయోగించండి
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API సంస్కరణ అనుకూలతను తనిఖీ చేయండి:**  
```bash
# మద్దతు ఉన్న API సంస్కరణలను జాబితా చేయండి
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI సెర్చ్ సమస్యలు

### సమస్య: సెర్చ్ సర్వీస్ ప్రైసింగ్ టియర్ తగినది కాదు

**లక్షణాలు:**
```
Error: Semantic search requires Basic tier or higher
```

**పరిష్కారాలు:**

1. **ధర స్థాయిని అప్‌గ్రేడ్ చేయండి:**  
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

2. **సెమాంటిక్ సెర్చ్‌ను డిసేబుల్ చేయండి (డెవలప్‌మెంట్):**  
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

1. **సెర్చ్ సర్వీస్ కీలు చెక్ చేయండి:**  
```bash
# శోధన సేవ అడ్మిన్ కీ పొందండి
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **ఇండెక్స్ స్కీమాను తనిఖీ చేయండి:**  
```python
# ఇండెక్స్ స్కీమాను ధృవీకరించండి
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

## Container Apps డిప్లాయ్‌మెంట్ సమస్యలు

### సమస్య: కంటైనర్ బిల్డ్ విఫలం

**లక్షణాలు:**
```
Error: Failed to build container image
```

**పరిష్కారాలు:**

1. **Dockerfile సింటాక్స్ తనిఖీ చేయండి:**  
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

2. **ఆధారాలను ప్రమాణీకరించండి:**  
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

### సమస్య: కంటైనర్ యాప్ స్టార్టప్ విఫలమవుతుంది

**లక్షణాలు:**
```
Error: Container failed to start within timeout period
```

**పరిష్కారాలు:**

1. **స్టార్టప్ టైమ్ఆుట్ పెంచండి:**  
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

## ప్రమాణీకరణ మరియు అనుమతి లోపాలు

### సమస్య: Managed Identity అనుమతి నిరాకరించబడింది

**లక్షణాలు:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**పరిష్కారాలు:**

1. **పాత్ర కేటాయింపులను పరిశీలించండి:**  
```bash
# ప్రస్తుత పాత్ర కేటాయింపులను తనిఖీ చేయండి
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **అవసరమైన పాత్రలను కేటాయించండి:**  
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

3. **ప్రామాణీకరణను పరీక్షించండి:**  
```python
# నిర్వహించబడిన ఐడెంటిటీ ప్రమాణీకరణను పరీక్షించండి
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

1. **Key Vault అనుమతులు ఇవ్వండి:**  
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

2. **అక్సెస్ పాలసీలకు బదులు RBAC ఉపయోగించండి:**  
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

## మోడల్ డిప్లాయ్‌మెంట్ వైఫల్యాలు

### సమస్య: మోడల్ సంస్కరణ అందుబాటులో లేదు

**లక్షణాలు:**
```
Error: Model version 'gpt-4-32k' is not available
```

**పరిష్కారాలు:**

1. **అందుబాటులో ఉన్న మోడల్స్‌ను తనిఖీ చేయండి:**  
```bash
# అందుబాటులో ఉన్న మోడల్స్‌ను జాబితా చేయండి
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **మోడల్Fallbacks ఉపయోగించండి:**  
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

3. **డిప్లాయ్‌మెంట్ ముందు మోడల్‌ను ధృవీకరించండి:**  
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

### సమస్య: ప్రతిస్పందనల్లో అధిక ఆలస్యం

**లక్షణాలు:**
- Response times > 30 seconds
- Timeout errors
- Poor user experience

**పరిష్కారాలు:**

1. **రిక్వెస్ట్ టైమ్ఆుట్‌లను అమలు చేయండి:**  
```python
# సరైన టైమ్‌ఆవుట్‌లను కాన్ఫిగర్ చేయండి
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
# ప్రతిస్పందనల కోసం Redis క్యాష్
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

3. **ఆటో-స్కేలింగ్ సెట్టు చేయండి:**  
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

### సమస్య: Out of Memory లోపాలు

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
# మెమరీ-సమర్థమైన మోడల్ నిర్వహణ
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # ప్రాసెస్ చేయడానికి ముందు మెమరీ వినియోగాన్ని తనిఖీ చేయండి
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # గార్బేజ్ కలెక్షన్‌ను బలవంతంగా అమలు చేయండి
            
        result = await self._process_ai_request(request)
        
        # ప్రాసెస్ తర్వాత శుభ్రపరచండి
        gc.collect()
        return result
```

## ఖర్చు మరియు కోటా నిర్వహణ

### సమస్య: అనూహ్యంగా అధిక ఖర్చు

**లక్షణాలు:**
- Azure బిల్ అనుకున్నంత తక్కువ లేదా ఎక్కువగా ఉంది
- టోకెన్ వినియోగం అంచనాల కంటే అధికంగా ఉంది
- బడ్జెట్ అలర్ట్‌లు ట్రిగ్గర్ అవుతున్నాయి

**పరిష్కారాలు:**

1. **ఖర్చు నియంత్రణలను అమలు చేయండి:**  
```python
# టోకెన్ వినియోగాన్ని ట్రాక్ చేయడం
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

2. **ఖర్చు అలర్ట్‌లను సెటప్ చేయండి:**  
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
# ఖర్చును పరిగణనలోకి తీసుకునే మోడల్ ఎంపిక
MODEL_COSTS = {
    'gpt-4.1-mini': 0.00015,  # ప్రతి 1K టోకన్లకు
    'gpt-4.1': 0.03,          # ప్రతి 1K టోకన్లకు
    'gpt-35-turbo': 0.0015  # ప్రతి 1K టోకన్లకు
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

## డీబగ్గింగ్ సాధనాలు మరియు సాంకేతికతలు

### AZD డీబగ్గింగ్ కమాండ్లు

```bash
# వివరణాత్మక లాగింగ్‌ను సక్రియం చేయండి
azd up --debug

# డిప్లాయ్‌మెంట్ స్థితిని తనిఖీ చేయండి
azd show

# అప్లికేషన్ లాగ్‌లను వీక్షించండి (మానిటరింగ్ డాష్‌బోర్డు తెరుస్తుంది)
azd monitor --logs

# లైవ్ మెట్రిక్స్‌ను వీక్షించండి
azd monitor --live

# పర్యావరణ వేరియబుల్స్‌ను తనిఖీ చేయండి
azd env get-values
```

### డయాగ్నోస్టిక్స్ కోసం AZD AI ఎక్స్‌టెన్షన్ కమాండ్లు

If you deployed agents using `azd ai agent init`, these additional tools are available:

```bash
# ఏజెంట్ల ఎక్స్‌టెన్షన్ ఇన్స్టాల్ అయి ఉందని నిర్ధారించండి
azd extension install azure.ai.agents

# మానిఫెస్ట్ నుండి ఏజెంట్‌ను మళ్లీ ప్రారంభించండి లేదా నవీకరించండి
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# AI టూల్స్‌కు ప్రాజెక్టు స్థితిని ప్రశ్నించడానికి MCP సర్వర్‌ను ఉపయోగించండి
azd mcp start

# సమీక్ష మరియు ఆడిట్ కోసం ఇన్ఫ్రాస్ట్రక్చర్ ఫైళ్లు సృష్టించండి
azd infra generate
```

> **సూచన:** `azd infra generate` ఉపయోగించి IaC ను డిస్క్‌కు రాయండి తద్వారా ఎక్ష్యాక్ట్గా ఏ రిసోర్సులు ప్రావిజన్ చేయబడ్డాయో మీరు తనిఖీ చేయగలుగుతారు. రిసోర్స్ కాన్ఫిగరేషన్ సమస్యలను డీబగ్గింగ్ చేస్తున్నప్పుడు ఇది అమూల్యం. పూర్తి వివరాలకు చూడండి: [AZD AI CLI సూచిక](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions).

### అప్లికేషన్ డీబగ్గింగ్

1. **సంఘటిత లాగింగ్:**  
```python
import logging
import json

# ఏఐ అప్లికేషన్ల కోసం నిర్మిత లాగింగ్‌ను ఆకృతీకరించండి
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

2. **హెల్త్ చెక్ ఎండ్పాయింట్లు:**  
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

3. **పనితీరు మానిటరింగ్:**  
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

## సాధారణ లోపం కోడ్లు మరియు పరిష్కారాలు

| లోపం కోడ్ | వివరణ | పరిష్కారం |
|------------|-------------|----------|
| 401 | అనుమతి లేదు | API కీలు మరియు managed identity కాన్ఫిగరేషన్‌ను తనిఖీ చేయండి |
| 403 | నిషేధించబడింది | RBAC పాత్ర కేటాయింపులను నిర్ధారించండి |
| 429 | రేటు పరిమితం | ఎక్స్పోనెన్షియల్ బ్యాక్ఓఫ్‌తో రీట్రై లాజిక్ అమలు చేయండి |
| 500 | అంతర్గత సర్వర్ లోపం | మోడల్ డిప్లాయ్‌మెంట్ స్థితి మరియు లాగ్‌లను తనిఖీ చేయండి |
| 503 | సర్వీస్ అందుబాటులో లేదు | సర్వీస్ ఆరోగ్యం మరియు ప్రాంతీయ అందుబాటుదీని తనిఖీ చేయండి |

## తదుపరి చర్యలు

1. **[AI మోడల్ డిప్లాయ్‌మెంట్ గైడ్](../chapter-02-ai-development/ai-model-deployment.md) ను సమీక్షించండి** డిప్లాయ్‌మెంట్ ఉత్తమ ఆచరణల కోసం
2. **[ప్రొడక్షన్ AI ఆచరణలు](../chapter-08-production/production-ai-practices.md) పూర్తి చేయండి** సంస్థ-సిద్ధ పరిష్కారాల కోసం
3. **సముదాయ మద్దతు కోసం [Microsoft Foundry Discord](https://aka.ms/foundry/discord) లో చేరండి**
4. **సమస్యలను సమర్పించండి** AZD-స్పెసిఫిక్ సమస్యల కోసం [AZD GitHub రిపోజిటరీ](https://github.com/Azure/azure-dev) కు

## వనరులు

- [Microsoft Foundry Models Service సమస్యల పరిష్కారం](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [కంటైనర్ యాప్స్ సమస్య పరిష్కారం](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI సెర్చ్ సమస్య పరిషారం](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure డయాగ్నొస్టిక్స్ ఏజెంట్ స్కిల్**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - మీ ఎడిటర్‌లో Azure సమస్య పరిష్కార స్కిల్స్ ఇన్స్టాల్ చేయండి: `npx skills add microsoft/github-copilot-for-azure`

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD ప్రారంభికులకు](../../README.md)
- **📖 Current Chapter**: అధ్యాయం 7 - సమస్య పరిష్కారం & డీబగ్గింగ్
- **⬅️ Previous**: [డీబగ్గింగ్ గైడ్](debugging.md)
- **➡️ Next Chapter**: [అధ్యాయం 8: ఉత్పత్తి & ఎంటర్‌ప్రైజ్ నమూనాలు](../chapter-08-production/production-ai-practices.md)
- **🤖 Related**: [అధ్యాయం 2: AI-ఫస్ట్ డెవలప్‌మెంట్](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 సూచన**: [Azure Developer CLI సమస్యల పరిష్కారం](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**నిరాకరణ**:
ఈ డాక్యుమెంట్‌ను AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి శ్రమించినప్పటికీ, స్వయంచాలక అనువాదాల్లో పొరపాట్లు లేదా తప్పులు ఉండవచ్చని దయచేసి గమనించండి. మూల డాక్యుమెంట్‌ను దాని స్థానిక భాషలో ఉన్నదిగా అధికారిక మూలంగా పరిగణించాలి. కీలకమైన సమాచారానికి, వృత్తిపరమైన మానవ అనువాదం చేయించుకోవడం సిఫార్సు చేయబడుతుంది. ఈ అనువాదాన్ని ఉపయోగించడం వల్ల ఏర్పడిన ఏవైనా అవగాహనా లోపాలు లేదా తప్పుగా అర్థం చేసుకోవడాలకు మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->