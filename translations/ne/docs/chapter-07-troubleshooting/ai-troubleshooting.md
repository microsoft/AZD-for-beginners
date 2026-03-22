# AI-विशिष्ट समस्या निवारण मार्गदर्शिका

**Chapter Navigation:**
- **📚 Course Home**: [AZD शुरुआतीहरूका लागि](../../README.md)
- **📖 Current Chapter**: अध्याय 7 - समस्या निवारण र डिबगिङ
- **⬅️ Previous**: [डिबगिङ मार्गदर्शिका](debugging.md)
- **➡️ Next Chapter**: [अध्याय 8: उत्पादन र उद्यम नमुनाहरू](../chapter-08-production/production-ai-practices.md)
- **🤖 Related**: [अध्याय 2: AI-प्रथम विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)

यो विस्तृत समस्या निवारण मार्गदर्शिकाले AZD सँग AI समाधान तैनाथ गर्दा देखिने सामान्य समस्याहरू सम्बोधन गर्दछ, र Azure AI सेवाहरूका लागि विशिष्ट समाधान र डिबगिङ प्राविधिहरू प्रदान गर्दछ।

## विषय सूची

- [Microsoft Foundry Models Service Issues](../../../../docs/chapter-07-troubleshooting)
- [Azure AI Search Problems](../../../../docs/chapter-07-troubleshooting)
- [Container Apps Deployment Issues](../../../../docs/chapter-07-troubleshooting)
- [Authentication and Permission Errors](../../../../docs/chapter-07-troubleshooting)
- [Model Deployment Failures](../../../../docs/chapter-07-troubleshooting)
- [Performance and Scaling Issues](../../../../docs/chapter-07-troubleshooting)
- [Cost and Quota Management](../../../../docs/chapter-07-troubleshooting)
- [Debugging Tools and Techniques](../../../../docs/chapter-07-troubleshooting)

## Microsoft Foundry Models Service Issues

### Issue: OpenAI Service Unavailable in Region

**Symptoms:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Causes:**
- चयन गरिएको क्षेत्रमा Microsoft Foundry Models उपलब्ध छैन
- प्राथमिक क्षेत्रहरूमा कोटा समाप्त भएको छ
- क्षेत्रीय क्षमता सीमाहरू

**Solutions:**

1. **चयन.Region उपलब्धता जाँच गर्नुहोस्:**
```bash
# OpenAI का उपलब्ध क्षेत्रहरू सूचीबद्ध गर्नुहोस्
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **AZD कन्फिगरेसन अपडेट गर्नुहोस्:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **वैकल्पिक क्षेत्रहरू प्रयोग गर्नुहोस्:**
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

### Issue: Model Deployment Quota Exceeded

**Symptoms:**
```
Error: Deployment failed due to insufficient quota
```

**Solutions:**

1. **वर्तमान कोटा जाँच गर्नुहोस्:**
```bash
# क्वोटा प्रयोग जाँच गर्नुहोस्
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **कोटा वृद्धि अनुरोध गर्नुहोस्:**
```bash
# क्वोटा वृद्धि अनुरोध पेश गर्नुहोस्
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **मोडेल क्षमता अनुकूलन गर्नुहोस्:**
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

### Issue: Invalid API Version

**Symptoms:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Solutions:**

1. **समर्थित API संस्करण प्रयोग गर्नुहोस्:**
```python
# नवीनतम समर्थित संस्करण प्रयोग गर्नुहोस्
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API संस्करण अनुकूलता जाँच गर्नुहोस्:**
```bash
# समर्थित API संस्करणहरू सूचीबद्ध गर्नुहोस्
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search Problems

### Issue: Search Service Pricing Tier Insufficient

**Symptoms:**
```
Error: Semantic search requires Basic tier or higher
```

**Solutions:**

1. **प्राइसिङ टियर अपग्रेड गर्नुहोस्:**
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

2. **सिमेन्टिक सर्च अक्षम गर्नुहोस् (विकासका लागि):**
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

### Issue: Index Creation Failures

**Symptoms:**
```
Error: Cannot create index, insufficient permissions
```

**Solutions:**

1. **Search सेवा कुञ्जीहरू प्रमाणित गर्नुहोस्:**
```bash
# खोज सेवा प्रशासक कुञ्जी प्राप्त गर्नुहोस्
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **इन्डेक्स स्किमा जाँच गर्नुहोस्:**
```python
# इन्डेक्स स्कीमालाई सत्यापित गर्नुहोस्
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

3. **Managed Identity प्रयोग गर्नुहोस्:**
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

### Issue: Container Build Failures

**Symptoms:**
```
Error: Failed to build container image
```

**Solutions:**

1. **Dockerfile सिन्ट्याक्स जाँच गर्नुहोस्:**
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

2. **आवश्यकताहरू प्रमाणित गर्नुहोस्:**
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

3. **हेल्थ चेक थप्नुहोस्:**
```python
# स्वास्थ्य जाँच एन्डपोइन्ट थप्नुहोस्
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Issue: Container App Startup Failures

**Symptoms:**
```
Error: Container failed to start within timeout period
```

**Solutions:**

1. **स्टार्टअप टाइमआउट बढाउनुहोस्:**
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

2. **मोडेल लोडिङ अनुकूलन गर्नुहोस्:**
```python
# सुरु हुने समय घटाउन मोडेलहरू ढिलो लोड गर्नुहोस्
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
        # यहाँ AI क्लाइन्ट प्रारम्भ गर्नुहोस्
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # प्रारम्भ
    app.state.model_manager = ModelManager()
    yield
    # बन्द
    pass

app = FastAPI(lifespan=lifespan)
```

## Authentication and Permission Errors

### Issue: Managed Identity Permission Denied

**Symptoms:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Solutions:**

1. **भूमिका असाइनमेन्टहरू प्रमाणित गर्नुहोस्:**
```bash
# वर्तमान भूमिका तोकाइहरू जाँच गर्नुहोस्
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **आवश्यक भूमिकाहरू असाइन गर्नुहोस्:**
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

3. **प्रमाणीकरण परीक्षण गर्नुहोस्:**
```python
# प्रबन्धित पहिचान प्रमाणीकरण परीक्षण
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

### Issue: Key Vault Access Denied

**Symptoms:**
```
Error: The user, group or application does not have secrets get permission
```

**Solutions:**

1. **Key Vault अनुमति दिनुहोस्:**
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

2. **Access Policies को सट्टा RBAC प्रयोग गर्नुहोस्:**
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

## Model Deployment Failures

### Issue: Model Version Not Available

**Symptoms:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Solutions:**

1. **उपलब्ध मोडेलहरू जाँच गर्नुहोस्:**
```bash
# उपलब्ध मोडेलहरू सूचीबद्ध गर्नुहोस्
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **मोडेल फलब्याकहरू प्रयोग गर्नुहोस्:**
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

3. **तैनाथ गर्नु अघि मोडेल प्रमाणीकरण गर्नुहोस्:**
```python
# तैनाथीकरणपूर्व मोडेलको मान्यकरण
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

## Performance and Scaling Issues

### Issue: High Latency Responses

**Symptoms:**
- प्रतिक्रिया समयहरू > 30 सेकेन्ड
- टाइमआउट त्रुटिहरू
- खराब प्रयोगकर्ता अनुभव

**Solutions:**

1. **अनुरोध टाइमआउटहरू लागू गर्नुहोस्:**
```python
# उपयुक्त टाइमआउटहरू कन्फिगर गर्नुहोस्
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

2. **प्रतिक्रिया क्यासिङ थप्नुहोस्:**
```python
# प्रतिक्रियाहरूका लागि Redis क्यास
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

3. **Auto-scaling कन्फिगर गर्नुहोस्:**
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

### Issue: Memory Out of Errors

**Symptoms:**
```
Error: Container killed due to memory limit exceeded
```

**Solutions:**

1. **मेमोरी आवंटन बढाउनुहोस्:**
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

2. **मेमोरी प्रयोग अनुकूलन गर्नुहोस्:**
```python
# स्मृति-कुशल मोडेल व्यवस्थापन
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # प्रक्रिया अघि स्मृतिको प्रयोग जाँच्नुहोस्
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # अनावश्यक स्मृति सङ्कलन जबर्जस्ती चलाउनुहोस्
            
        result = await self._process_ai_request(request)
        
        # प्रक्रिया पछि सफा गर्नुहोस्
        gc.collect()
        return result
```

## Cost and Quota Management

### Issue: Unexpected High Costs

**Symptoms:**
- Azure बिल अपेक्षाभन्दा बढी
- टोकन प्रयोग अनुमानभन्दा बढी
- बजेट अलर्टहरू ट्रिगर भएका

**Solutions:**

1. **लागत नियन्त्रणहरू लागू गर्नुहोस्:**
```python
# टोकन प्रयोग अनुगमन
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

2. **लागत अलर्टहरू सेटअप गर्नुहोस्:**
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

3. **मोडेल छनोट अनुकूलन गर्नुहोस्:**
```python
# लागत-सचेत मोडेल छनोट
MODEL_COSTS = {
    'gpt-4.1-mini': 0.00015,  # प्रति 1 हजार टोकन
    'gpt-4.1': 0.03,          # प्रति 1 हजार टोकन
    'gpt-35-turbo': 0.0015  # प्रति 1 हजार टोकन
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

## Debugging Tools and Techniques

### AZD Debugging Commands

```bash
# विस्तृत लगिङ सक्षम गर्नुहोस्
azd up --debug

# परिनियोजन स्थिति जाँच गर्नुहोस्
azd show

# अनुप्रयोग लगहरू हेर्नुहोस् (अनुगमन ड्यासबोर्ड खोल्छ)
azd monitor --logs

# प्रत्यक्ष मेट्रिक्स हेर्नुहोस्
azd monitor --live

# वातावरण चरहरू जाँच गर्नुहोस्
azd env get-values
```

### AZD AI Extension Commands for Diagnostics

यदि तपाईंले `azd ai agent init` प्रयोग गरी एजेन्टहरू तैनाथ गर्नुभयो भने, यी अतिरिक्त उपकरणहरू उपलब्ध हुन्छन्:

```bash
# सुनिश्चित गर्नुहोस् कि एजेण्ट्स एक्सटेन्सन इन्स्टल गरिएको छ
azd extension install azure.ai.agents

# म्यानिफेस्टबाट एजेण्टलाई पुनः आरम्भ वा अद्यावधिक गर्नुहोस्
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# एआई उपकरणहरूले परियोजनाको अवस्था क्वेरी गर्न MCP सर्भर प्रयोग गर्नुहोस्
azd mcp start

# समीक्षा र अडिटका लागि पूर्वाधार फाइलहरू सिर्जना गर्नुहोस्
azd infra generate
```

> **सुझाव:** `azd infra generate` प्रयोग गरी IaC लाई डिस्कमा लेख्नुहोस् ताकि तपाईंले कुन स्रोतहरू प्रावधान गरिएको थियो ठ्याक्कै निरीक्षण गर्न सकून्। स्रोत कन्फिगरेसन सम्बन्धी समस्याहरू डिबग गर्दा यो अमूल्य हुनेछ। पूर्ण विवरणका लागि [AZD AI CLI reference](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) हेर्नुहोस्।

### Application Debugging

1. **स्ट्रक्चर्ड लगिङ:**
```python
import logging
import json

# AI अनुप्रयोगहरूको लागि संरचित लगिङ कन्फिगर गर्नुहोस्
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

2. **हेल्थ चेक एन्डपोइन्टहरू:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # OpenAI जडान जाँच गर्नुहोस्
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # खोज सेवा जाँच गर्नुहोस्
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

3. **प्रदर्शन अनुगमन:**
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

## Common Error Codes and Solutions

| Error Code | Description | Solution |
|------------|-------------|----------|
| 401 | Unauthorized | API कुञ्जीहरू र managed identity कन्फिगरेसन जाँच गर्नुहोस् |
| 403 | Forbidden | RBAC भूमिका असाइनमेन्टहरू प्रमाणित गर्नुहोस् |
| 429 | Rate Limited | exponential backoff सहित retry logic लागू गर्नुहोस् |
| 500 | Internal Server Error | मोडेल तैनाथी स्थिति र लगहरू जाँच गर्नुहोस् |
| 503 | Service Unavailable | सेवा स्वास्थ्य र क्षेत्रीय उपलब्धता प्रमाणित गर्नुहोस् |

## Next Steps

1. **[AI Model Deployment Guide](../chapter-02-ai-development/ai-model-deployment.md)** मा तैनाथीका उत्कृष्ट अभ्यासहरू समीक्षा गर्नुहोस्
2. **[Production AI Practices](../chapter-08-production/production-ai-practices.md)** पूरा गर्नुहोस् उद्यम-तयार समाधानहरूका लागि
3. **[Microsoft Foundry Discord](https://aka.ms/foundry/discord)** मा सामुदायिक समर्थनको लागि सामेल हुनुहोस्
4. **समस्याहरू पठाउनुहोस्** [AZD GitHub repository](https://github.com/Azure/azure-dev) मा AZD-विशिष्ट समस्याहरूका लागि

## Resources

- [Microsoft Foundry Models Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - तपाइँको सम्पादकमा Azure समस्या निवारण स्किलहरू स्थापना गर्नुहोस्: `npx skills add microsoft/github-copilot-for-azure`

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD शुरुआतीहरूका लागि](../../README.md)
- **📖 Current Chapter**: अध्याय 7 - समस्या निवारण र डिबगिङ
- **⬅️ Previous**: [डिबगिङ मार्गदर्शिका](debugging.md)
- **➡️ Next Chapter**: [अध्याय 8: उत्पादन र उद्यम नमुनाहरू](../chapter-08-production/production-ai-practices.md)
- **🤖 Related**: [अध्याय 2: AI-प्रथम विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Reference**: [Azure Developer CLI Troubleshooting](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यस दस्तावेजलाई AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुनसक्छ। मूल दस्तावेजलाई यसको मूल भाषामा नै अधिकारिक स्रोत मानिनु पर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलतफहमी वा दुरबोधका लागि हामी उत्तरदायी छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->