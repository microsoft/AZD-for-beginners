# एआई-विशेष समस्या समाधान मार्गदर्शिका

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD सुरुवातका लागि](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय ७ - समस्या समाधान र डिबगिङ
- **⬅️ अघिल्लो**: [डिबगिङ मार्गदर्शिका](debugging.md)
- **➡️ अर्को अध्याय**: [अध्याय ८: उत्पादन र उद्यम ढाँचा](../microsoft-foundry/production-ai-practices.md)
- **🤖 सम्बन्धित**: [अध्याय २: एआई-प्रथम विकास](../microsoft-foundry/microsoft-foundry-integration.md)

**अघिल्लो:** [उत्पादन एआई अभ्यासहरू](../microsoft-foundry/production-ai-practices.md) | **अर्को:** [AZD सुरु गर्ने](../getting-started/README.md)

यो व्यापक समस्या समाधान मार्गदर्शिकाले AZD प्रयोग गरेर एआई समाधानहरू तैनाथ गर्दा देखा पर्ने सामान्य समस्याहरूलाई सम्बोधन गर्दछ, Azure AI सेवाहरूका लागि समाधान र डिबगिङ प्रविधिहरू प्रदान गर्दछ।

## सामग्री तालिका

- [Azure OpenAI सेवा समस्याहरू](../../../../docs/troubleshooting)
- [Azure AI खोज समस्याहरू](../../../../docs/troubleshooting)
- [कन्टेनर एप्स तैनाथ समस्याहरू](../../../../docs/troubleshooting)
- [प्रमाणीकरण र अनुमति त्रुटिहरू](../../../../docs/troubleshooting)
- [मोडेल तैनाथ असफलता](../../../../docs/troubleshooting)
- [प्रदर्शन र स्केलिङ समस्याहरू](../../../../docs/troubleshooting)
- [खर्च र कोटा व्यवस्थापन](../../../../docs/troubleshooting)
- [डिबगिङ उपकरणहरू र प्रविधिहरू](../../../../docs/troubleshooting)

## Azure OpenAI सेवा समस्याहरू

### समस्या: क्षेत्रमा OpenAI सेवा उपलब्ध छैन

**लक्षणहरू:**
```
Error: The requested resource type is not available in the location 'westus'
```

**कारणहरू:**
- चयन गरिएको क्षेत्रमा Azure OpenAI उपलब्ध छैन
- प्राथमिक क्षेत्रहरूमा कोटा समाप्त
- क्षेत्रीय क्षमता सीमाहरू

**समाधानहरू:**

1. **क्षेत्र उपलब्धता जाँच गर्नुहोस्:**
```bash
# OpenAI का लागि उपलब्ध क्षेत्रहरूको सूची
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

### समस्या: मोडेल तैनाथ कोटा समाप्त

**लक्षणहरू:**
```
Error: Deployment failed due to insufficient quota
```

**समाधानहरू:**

1. **वर्तमान कोटा जाँच गर्नुहोस्:**
```bash
# कोटा प्रयोग जाँच गर्नुहोस्
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **कोटा वृद्धि अनुरोध गर्नुहोस्:**
```bash
# कोटा वृद्धि अनुरोध पेश गर्नुहोस्
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

### समस्या: अमान्य API संस्करण

**लक्षणहरू:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**समाधानहरू:**

1. **समर्थित API संस्करण प्रयोग गर्नुहोस्:**
```python
# पछिल्लो समर्थित संस्करण प्रयोग गर्नुहोस्
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API संस्करण अनुकूलता जाँच गर्नुहोस्:**
```bash
# समर्थित API संस्करणहरूको सूची
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI खोज समस्याहरू

### समस्या: खोज सेवा मूल्य निर्धारण स्तर अपर्याप्त

**लक्षणहरू:**
```
Error: Semantic search requires Basic tier or higher
```

**समाधानहरू:**

1. **मूल्य निर्धारण स्तर अपग्रेड गर्नुहोस्:**
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

2. **सेम्यान्टिक खोज अक्षम गर्नुहोस् (विकास):**
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

### समस्या: सूचकांक सिर्जना असफलता

**लक्षणहरू:**
```
Error: Cannot create index, insufficient permissions
```

**समाधानहरू:**

1. **खोज सेवा कुञ्जीहरू प्रमाणित गर्नुहोस्:**
```bash
# खोज सेवा प्रशासक कुञ्जी प्राप्त गर्नुहोस्
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **सूचकांक स्कीमा जाँच गर्नुहोस्:**
```python
# अनुक्रमणिका स्कीमा प्रमाणित गर्नुहोस्
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

3. **प्रबन्धित पहिचान प्रयोग गर्नुहोस्:**
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

## कन्टेनर एप्स तैनाथ समस्याहरू

### समस्या: कन्टेनर निर्माण असफलता

**लक्षणहरू:**
```
Error: Failed to build container image
```

**समाधानहरू:**

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

2. **निर्भरता प्रमाणित गर्नुहोस्:**
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

3. **स्वास्थ्य जाँच थप्नुहोस्:**
```python
# मुख्य.py - स्वास्थ्य जाँच अन्त बिन्दु थप्नुहोस्
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### समस्या: कन्टेनर एप्स सुरु असफलता

**लक्षणहरू:**
```
Error: Container failed to start within timeout period
```

**समाधानहरू:**

1. **सुरु समयसीमा बढाउनुहोस्:**
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
# मोडेलहरूलाई सुस्त लोड गर्नुहोस् ताकि सुरु गर्ने समय कम होस्
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
        # यहाँ एआई क्लाइन्टलाई सुरु गर्नुहोस्
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # सुरु
    app.state.model_manager = ModelManager()
    yield
    # बन्द गर्नुहोस्
    pass

app = FastAPI(lifespan=lifespan)
```

## प्रमाणीकरण र अनुमति त्रुटिहरू

### समस्या: प्रबन्धित पहिचान अनुमति अस्वीकृत

**लक्षणहरू:**
```
Error: Authentication failed for Azure OpenAI Service
```

**समाधानहरू:**

1. **भूमिका असाइनमेन्टहरू प्रमाणित गर्नुहोस्:**
```bash
# वर्तमान भूमिका असाइनमेन्टहरू जाँच गर्नुहोस्
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
# व्यवस्थापित पहिचान प्रमाणीकरण परीक्षण गर्नुहोस्
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

### समस्या: कुञ्जी भण्डार पहुँच अस्वीकृत

**लक्षणहरू:**
```
Error: The user, group or application does not have secrets get permission
```

**समाधानहरू:**

1. **कुञ्जी भण्डार अनुमति प्रदान गर्नुहोस्:**
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

2. **RBAC प्रयोग गर्नुहोस् पहुँच नीतिहरूको सट्टा:**
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

## मोडेल तैनाथ असफलता

### समस्या: मोडेल संस्करण उपलब्ध छैन

**लक्षणहरू:**
```
Error: Model version 'gpt-4-32k' is not available
```

**समाधानहरू:**

1. **उपलब्ध मोडेलहरू जाँच गर्नुहोस्:**
```bash
# उपलब्ध मोडेलहरूको सूची
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **मोडेल फलब्याक्स प्रयोग गर्नुहोस्:**
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

3. **तैनाथ अघि मोडेल प्रमाणित गर्नुहोस्:**
```python
# पूर्व-प्रक्षेपण मोडेल मान्यता
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

## प्रदर्शन र स्केलिङ समस्याहरू

### समस्या: उच्च विलम्ब प्रतिक्रिया

**लक्षणहरू:**
- प्रतिक्रिया समय > ३० सेकेन्ड
- समयसीमा त्रुटिहरू
- खराब प्रयोगकर्ता अनुभव

**समाधानहरू:**

1. **अनुरोध समयसीमा लागू गर्नुहोस्:**
```python
# उचित टाइमआउटहरू कन्फिगर गर्नुहोस्
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
# प्रतिक्रियाहरूको लागि रेडिस क्यास
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

3. **स्वतः स्केलिङ कन्फिगर गर्नुहोस्:**
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

### समस्या: मेमोरी समाप्त त्रुटिहरू

**लक्षणहरू:**
```
Error: Container killed due to memory limit exceeded
```

**समाधानहरू:**

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
# मेमोरी-कुशल मोडेल ह्यान्डलिङ
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # प्रशोधन अघि मेमोरी प्रयोग जाँच गर्नुहोस्
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # जबरजस्ती गार्बेज सङ्कलन गर्नुहोस्
            
        result = await self._process_ai_request(request)
        
        # प्रशोधन पछि सफा गर्नुहोस्
        gc.collect()
        return result
```

## खर्च र कोटा व्यवस्थापन

### समस्या: अप्रत्याशित उच्च खर्च

**लक्षणहरू:**
- Azure बिल अपेक्षाभन्दा उच्च
- टोकन प्रयोग अनुमानभन्दा बढी
- बजेट अलर्ट ट्रिगर

**समाधानहरू:**

1. **खर्च नियन्त्रण लागू गर्नुहोस्:**
```python
# टोकन प्रयोग ट्र्याकिङ
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

2. **खर्च अलर्ट सेट गर्नुहोस्:**
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

3. **मोडेल चयन अनुकूलन गर्नुहोस्:**
```python
# लागत-सचेत मोडेल चयन
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # प्रति 1K टोकन
    'gpt-4': 0.03,          # प्रति 1K टोकन
    'gpt-35-turbo': 0.0015  # प्रति 1K टोकन
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

## डिबगिङ उपकरणहरू र प्रविधिहरू

### AZD डिबगिङ कमाण्डहरू

```bash
# विस्तृत लगिङ्ग सक्षम गर्नुहोस्
azd up --debug

# परिनियोजन स्थिति जाँच गर्नुहोस्
azd show

# परिनियोजन लगहरू हेर्नुहोस्
azd logs --follow

# वातावरण चरहरू जाँच गर्नुहोस्
azd env get-values
```

### एप्लिकेशन डिबगिङ

1. **संरचित लगिङ:**
```python
import logging
import json

# एआई अनुप्रयोगहरूको लागि संरचित लगिङ कन्फिगर गर्नुहोस्
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

2. **स्वास्थ्य जाँच अन्त बिन्दुहरू:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # OpenAI कनेक्टिभिटी जाँच गर्नुहोस्
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

3. **प्रदर्शन निगरानी:**
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

## सामान्य त्रुटि कोडहरू र समाधानहरू

| त्रुटि कोड | विवरण | समाधान |
|------------|-------------|----------|
| 401 | अनधिकृत | API कुञ्जीहरू र प्रबन्धित पहिचान कन्फिगरेसन जाँच गर्नुहोस् |
| 403 | निषेधित | RBAC भूमिका असाइनमेन्ट प्रमाणित गर्नुहोस् |
| 429 | दर सीमित | एक्सपोनेंशियल ब्याकअफको साथ पुन: प्रयास तर्क लागू गर्नुहोस् |
| 500 | आन्तरिक सर्भर त्रुटि | मोडेल तैनाथ स्थिति र लगहरू जाँच गर्नुहोस् |
| 503 | सेवा उपलब्ध छैन | सेवा स्वास्थ्य र क्षेत्रीय उपलब्धता प्रमाणित गर्नुहोस् |

## आगामी कदमहरू

1. **[एआई मोडेल तैनाथ मार्गदर्शिका](ai-model-deployment.md)** समीक्षा गर्नुहोस् तैनाथको लागि उत्कृष्ट अभ्यासहरूका लागि
2. **[उत्पादन एआई अभ्यासहरू](production-ai-practices.md)** पूरा गर्नुहोस् उद्यम-तयार समाधानहरूको लागि
3. **[Microsoft Foundry Discord](https://aka.ms/foundry/discord)** मा सामुदायिक समर्थनका लागि सामेल हुनुहोस्
4. **समस्या पेश गर्नुहोस्** [AZD GitHub रिपोजिटरी](https://github.com/Azure/azure-dev) मा AZD-विशेष समस्याहरूका लागि

## स्रोतहरू

- [Azure OpenAI सेवा समस्या समाधान](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [कन्टेनर एप्स समस्या समाधान](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI खोज समस्या समाधान](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD सुरुवातका लागि](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय ७ - समस्या समाधान र डिबगिङ
- **⬅️ अघिल्लो**: [डिबगिङ मार्गदर्शिका](debugging.md)
- **➡️ अर्को अध्याय**: [अध्याय ८: उत्पादन र उद्यम ढाँचा](../microsoft-foundry/production-ai-practices.md)
- **🤖 सम्बन्धित**: [अध्याय २: एआई-प्रथम विकास](../microsoft-foundry/microsoft-foundry-integration.md)
- [Azure Developer CLI समस्या समाधान](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको छ। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादहरूमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छ। यसको मूल भाषामा रहेको मूल दस्तावेज़लाई आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार हुनेछैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->