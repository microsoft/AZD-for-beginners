# एआई-विशेष समस्यासङ्घर्ष मार्गदर्शन

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय ७ - समस्यासङ्घर्ष र डिबगिङ
- **⬅️ अघिल्लो**: [डिबगिङ गाइड](debugging.md)
- **➡️ अर्को अध्याय**: [अध्याय ८: उत्पादन र एंटरप्राइज ढाँचाहरू](../chapter-08-production/production-ai-practices.md)
- **🤖 सम्बन्धित**: [अध्याय २: एआई-प्रथम विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)

यस व्यापक समस्यासङ्घर्ष मार्गदर्शनले AZD सँग एआई समाधान परिनियोजन गर्दा सामान्य समस्याहरू सुल्झाउने तरिका र Azure AI सेवाहरूमा आधारित डिबगिङ प्रविधिहरू प्रदान गर्दछ।

## सामग्री सूची

- [Microsoft Foundry मोडेल सेवा समस्याहरू](#azure-openai-service-issues)
- [Azure AI खोज समस्याहरू](#azure-ai-खोज-समस्याहरू)
- [कन्टेनर एप्स परिनियोजन समस्याहरू](#कन्टेनर-एप्स-परिनियोजन-समस्याहरू)
- [प्रमाणीकरण र अनुमति त्रुटिहरू](#प्रमाणीकरण-र-अनुमति-त्रुटिहरू)
- [मोडेल परिनियोजन असफलताहरू](#मोडेल-परिनियोजन-असफलताहरू)
- [प्रदर्शन र स्केलिङ समस्याहरू](#प्रदर्शन-र-स्केलिङ-समस्याहरू)
- [खर्च र कोटा व्यवस्थापन](#खर्च-र-कोटा-व्यवस्थापन)
- [डिबगिङ उपकरण र प्रविधिहरू](#डिबगिङ-उपकरण-र-प्रविधिहरू)

## Microsoft Foundry मोडेल सेवा समस्याहरू

### समस्या: ओपनएआई सेवा क्षेत्रमा उपलब्ध छैन

**लक्षणहरू:**
```
Error: The requested resource type is not available in the location 'westus'
```
  
**कारणहरू:**  
- चयन गरिएको क्षेत्रमा Microsoft Foundry मोडेलहरू उपलब्ध छैनन्  
- रुचाइएको क्षेत्रमा कोटा सकिएको छ  
- क्षेत्रीय क्षमता सीमितताहरू  

**समाधानहरू:**

1. **क्षेत्र उपलब्धता जाँच गर्नुहोस्:**  
```bash
# OpenAI का लागि उपलब्ध क्षेत्रहरूको सूची बनाउनुहोस्
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
  
### समस्या: मोडेल परिनियोजन कोटा पार भयो

**लक्षणहरू:**  
```
Error: Deployment failed due to insufficient quota
```
  
**समाधानहरू:**

1. **वर्तमान कोटा जाँच गर्नुहोस्:**  
```bash
# कोटा प्रयोग जाँच्नुहोस्
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```
  
2. **कोटा वृद्धि अनुरोध गर्नुहोस्:**  
```bash
# कोटा वृद्धि अनुरोध बुझाउनुहोस्
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```
  
3. **मोडेल क्षमता सुधार गर्नुहोस्:**  
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
  
### समस्या: अमान्य API संस्करण

**लक्षणहरू:**  
```
Error: The API version '2023-05-15' is not available for OpenAI
```
  
**समाधानहरू:**

1. **समर्थित API संस्करण प्रयोग गर्नुहोस्:**  
```python
# सबैभन्दा नयाँ समर्थन गरिने संस्करण प्रयोग गर्नुहोस्
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```
  
2. **API संस्करण मेल खाने जाँच गर्नुहोस्:**  
```bash
# समर्थित API संस्करणहरू सूचीबद्ध गर्नुहोस्
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```
  
## Azure AI खोज समस्याहरू

### समस्या: खोज सेवा मूल्य निर्धारण स्तर अपर्याप्त छ

**लक्षणहरू:**  
```
Error: Semantic search requires Basic tier or higher
```
  
**समाधानहरू:**

1. **मूल्य निर्धारण स्तर उन्नत गर्नुहोस्:**  
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
  
2. **सामान्य खोज अवरुद्ध गर्नुहोस् (विकासमा):**  
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
  
### समस्या: अनुक्रमणिका सिर्जना असफलता

**लक्षणहरू:**  
```
Error: Cannot create index, insufficient permissions
```
  
**समाधानहरू:**

1. **खोज सेवा कुञ्जीहरू जाँच गर्नुहोस्:**  
```bash
# खोज सेवा व्यवस्थापक कुञ्जी प्राप्त गर्नुहोस्
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```
  
2. **अनुक्रमणिका स्कीमा जाँच गर्नुहोस्:**  
```python
# सूचकाङ्क योजना मान्य गर्नुहोस्
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
  
## कन्टेनर एप्स परिनियोजन समस्याहरू

### समस्या: कन्टेनर निर्माण असफलता

**लक्षणहरू:**  
```
Error: Failed to build container image
```
  
**समाधानहरू:**

1. **डोकरफाइल सिन्ट्याक्स जाँच गर्नुहोस्:**  
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
# main.py - स्वास्थ्य जाँच अन्त बिन्दु थप्नुहोस्
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```
  
### समस्या: कन्टेनर एप सुरु गर्न नसक्ने

**लक्षणहरू:**  
```
Error: Container failed to start within timeout period
```
  
**समाधानहरू:**

1. **सुरु समय सीमा बढाउनुहोस्:**  
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
  
2. **मोडेल लोडिङ अनुकूलित गर्नुहोस्:**  
```python
# सुरु हुने समय कम गर्न ढिला लोड मोडेलहरू
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
        # यहाँ AI क्लाइन्ट सुरु गर्नुहोस्
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # सुरु
    app.state.model_manager = ModelManager()
    yield
    # बन्द
    pass

app = FastAPI(lifespan=lifespan)
```
  
## प्रमाणीकरण र अनुमति त्रुटिहरू

### समस्या: प्रबन्धित पहिचान अनुमति अस्वीकृत

**लक्षणहरू:**  
```
Error: Authentication failed for Microsoft Foundry Models Service
```
  
**समाधानहरू:**

1. **भूमिका असाइनमेन्टहरू प्रमाणित गर्नुहोस्:**  
```bash
# हालको भूमिका स्थिति जाँच गर्नुहोस्
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```
  
2. **आवश्यक भूमिका असाइन गर्नुहोस्:**  
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
# प्रबन्धित पहिचान प्रमाणीकरण परीक्षण गर्नुहोस्
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
  
### समस्या: कुञ्जी भल्ट पहुँच अस्वीकृत

**लक्षणहरू:**  
```
Error: The user, group or application does not have secrets get permission
```
  
**समाधानहरू:**

1. **कुञ्जी भल्ट अनुमति दिनुहोस्:**  
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
  
2. **पहुँच नीतिहरूको सट्टा RBAC प्रयोग गर्नुहोस्:**  
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
  
## मोडेल परिनियोजन असफलताहरू

### समस्या: मोडेल संस्करण उपलब्ध छैन

**लक्षणहरू:**  
```
Error: Model version 'gpt-4-32k' is not available
```
  
**समाधानहरू:**

1. **उपलब्ध मोडेलहरू जाँच गर्नुहोस्:**  
```bash
# उपलब्ध मोडेलहरूको सूची बनाउनुहोस्
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```
  
2. **मोडेल फ्यालब्याकहरू प्रयोग गर्नुहोस्:**  
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
  
3. **परिनियोजन अघि मोडेल प्रमाणित गर्नुहोस्:**  
```python
# पूर्व-तैनाती मोडेल प्रमाणीकरण
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

### समस्या: उच्च लाटेन्सी प्रतिक्रिया

**लक्षणहरू:**  
- प्रतिक्रिया समय > ३० सेकेन्ड  
- टाइमआउट त्रुटिहरू  
- खराब प्रयोगकर्ता अनुभव  

**समाधानहरू:**

1. **अनुरोध टाइमआउट लागू गर्नुहोस्:**  
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
# प्रतिक्रियाहरूको लागि रेडिस क्यासे
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
  
3. **स्वचालित स्केलिङ कन्फिगर गर्नुहोस्:**  
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
  
### समस्या: स्मृति त्रुटिहरू

**लक्षणहरू:**  
```
Error: Container killed due to memory limit exceeded
```
  
**समाधानहरू:**

1. **स्मृति विनियोजन बढाउनुहोस्:**  
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
  
2. **स्मृति उपयोग अनुकूलित गर्नुहोस्:**  
```python
# मेमोरी-कुशल मोडेल व्यवस्थापन
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # प्रक्रिया गर्नु अघि मेमोरी प्रयोग जाँच्नुहोस्
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # जबर्जस्ती गार्बेज कलेक्सन गर्नुहोस्
            
        result = await self._process_ai_request(request)
        
        # प्रक्रिया पछि सफा गर्नुहोस्
        gc.collect()
        return result
```
  
## खर्च र कोटा व्यवस्थापन

### समस्या: अप्रत्याशित उच्च खर्च

**लक्षणहरू:**  
- Azure बिल अनुमानभन्दा बढी  
- टोकन प्रयोग अनुमान भन्दा बढी  
- बजेट सूचनाहरू ट्रिगर भएका  

**समाधानहरू:**

1. **खर्च नियन्त्रण लागू गर्नुहोस्:**  
```python
# टोकन प्रयोग ट्र्याकिङ्
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
  
2. **खर्च सूचनाहरू सेटअप गर्नुहोस्:**  
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
  
3. **मोडेल चयन अनुकूलित गर्नुहोस्:**  
```python
# लागत-सचेत मोडेल चयन
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
  
## डिबगिङ उपकरण र प्रविधिहरू

### AZD डिबगिङ आदेशहरू

```bash
# विस्तृत लगिङ सक्षम पार्नुहोस्
azd up --debug

# परिनियोजन स्थिति जाँच्नुहोस्
azd show

# अनुप्रयोग लगहरू हेर्नुहोस् (निरीक्षण ड्यासबोर्ड खोल्छ)
azd monitor --logs

# प्रत्यक्ष मेट्रिक्स हेर्नुहोस्
azd monitor --live

# वातावरण चरहरू जाँच्नुहोस्
azd env get-values
```
  
### AZD AI विस्तार आदेशहरू डायग्नोस्टिक्सका लागि

यदि तपाईंले `azd ai agent init` प्रयोग गरी एजेन्टहरू परिनियोजन गर्नुभएको छ भने, यी अतिरिक्त उपकरणहरू उपलब्ध छन्:

```bash
# एजेण्ट्स विस्तार स्थापना गरिएको सुनिश्चित गर्नुहोस्
azd extension install azure.ai.agents

# म्यानिफेस्टबाट एजेण्ट पुनःसुरु वा अद्यावधिक गर्नुहोस्
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# AI उपकरणहरुलाई परियोजना स्थितिको सोधपुछ गर्न MCP सर्भर प्रयोग गर्नुहोस्
azd mcp start

# समीक्षा र अडिटको लागि पूर्वाधार फाइलहरू उत्पादन गर्नुहोस्
azd infra generate
```
  
> **सूचना:** `azd infra generate` प्रयोग गरी IaC डिस्कमा लेख्नुहोस् ताकि तपाईंले ठ्याक्कै के स्रोतहरू प्रोभिजन गरिएका छन् जाँच गर्न सक्नुहुन्छ। स्रोत कन्फिगरेसन समस्याहरू डिबग गर्दा यो अमूल्य छ। पूर्ण विवरणका लागि [AZD AI CLI सन्दर्भ](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) हेर्नुहोस्।

### अनुप्रयोग डिबगिङ

1. **संरचित लगिङ:**  
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
  
2. **स्वास्थ्य जाँच अन्त बिन्दुहरू:**  
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # OpenAI कनेक्टिविटी जाँच्नुहोस्
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # खोज सेवा जाँच्नुहोस्
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
  
## सामान्य त्रुटि कोडहरू र समाधानहरू

| त्रुटि कोड | विवरण | समाधान |
|------------|-------------|----------|
| 401 | अनुमति छैन | API कुञ्जीहरू र प्रबन्धित पहिचान कन्फिगरेसन जाँच गर्नुहोस् |
| 403 | निषेधित | RBAC भूमिका असाइनमेन्टहरू प्रमाणित गर्नुहोस् |
| 429 | दर सीमित | पुन: प्रयास तर्क अर्किटेक्चरमा प्रयोग गर्नुहोस् |
| 500 | आन्तरिक सर्भर त्रुटि | मोडेल परिनियोजन अवस्था र लगहरू जाँच गर्नुहोस् |
| 503 | सेवा अनुपलब्ध | सेवा स्वास्थ्य र क्षेत्रीय उपलब्धता प्रमाणित गर्नुहोस् |

## अर्को कदमहरू

1. **[AI मोडेल परिनियोजन गाइड](../chapter-02-ai-development/ai-model-deployment.md)** समीक्षा गर्नुहोस् परिनियोजनका लागि उत्तम अभ्यासहरू  
2. **[उत्पादन AI अभ्यासहरू](../chapter-08-production/production-ai-practices.md)** पुरा गर्नुहोस् एंटरप्राइज-तयार समाधानका लागि  
3. **[Microsoft Foundry Discord](https://aka.ms/foundry/discord)** मा सामुदायिक समर्थनका लागि साझेदार हुनुहोस्  
4. **समस्या प्रस्तुत गर्नुहोस्** [AZD GitHub रिपोजिटरी](https://github.com/Azure/azure-dev) मा AZD-विशेष समस्याहरूको लागि  

## स्रोतहरू

- [Microsoft Foundry मोडेल सेवा समस्यासङ्घर्ष](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [कन्टेनर एप्स समस्यासङ्घर्ष](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI खोज समस्यासङ्घर्ष](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure डायग्नोस्टिक्स एजेन्ट स्किल**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - तपाईँको सम्पादकमा Azure समस्यासङ्घर्ष स्किलहरू स्थापना गर्न: `npx skills add microsoft/github-copilot-for-azure`

---

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय ७ - समस्यासङ्घर्ष र डिबगिङ
- **⬅️ अघिल्लो**: [डिबगिङ गाइड](debugging.md)
- **➡️ अर्को अध्याय**: [अध्याय ८: उत्पादन र एंटरप्राइज ढाँचाहरू](../chapter-08-production/production-ai-practices.md)
- **🤖 सम्बन्धित**: [अध्याय २: एआई-प्रथम विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 सन्दर्भ**: [Azure Developer CLI समस्यासङ्घर्ष](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
यस दस्तावेजलाई AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) द्वारा अनुवाद गरिएको छ। हामी सही अनुवादका लागि प्रयासरत छौं, तर कृपया ध्यान दिनुहोस् कि स्वतः अनुवादमा त्रुटिहरू वा असत्यताहरू हुन सक्छन्। मूल दस्तावेजको मातृ भाषामा रहेको संस्करणलाई अधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि व्यावसायिक मानव अनुवाद सिफारिश गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलतफहमी वा गलत व्याख्याहरूको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->