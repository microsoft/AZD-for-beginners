# AI-विशिष्ट समस्या निवारण गाइड

**अध्याय नेविगेशन:**
- **📚 पाठ्यक्रम होम**: [AZD शुरुआती के लिए](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 7 - समस्या निवारण और डिबगिंग
- **⬅️ पिछला**: [डिबगिंग गाइड](debugging.md)
- **➡️ अगला अध्याय**: [अध्याय 8: प्रोडक्शन और एंटरप्राइज पैटर्न](../chapter-08-production/production-ai-practices.md)
- **🤖 संबंधित**: [अध्याय 2: AI-प्रथम विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)

यह व्यापक समस्या निवारण गाइड AZD के साथ AI समाधान तैनात करते समय सामान्य समस्याओं को संबोधित करता है, और Azure AI सेवाओं के लिए विशिष्ट समाधान और डिबगिंग तकनीकें प्रदान करता है।

## सामग्री सूची

- [Microsoft Foundry Models Service समस्याएँ](#azure-openai-service-issues)
- [Azure AI Search समस्याएँ](#azure-ai-search-समस्याएँ)
- [कंटेनर ऐप्स डिप्लॉयमेंट समस्याएँ](#कंटेनर-ऐप्स-डिप्लॉयमेंट-समस्याएँ)
- [प्रमाणीकरण और अनुमति त्रुटियाँ](#प्रमाणीकरण-और-अनुमति-त्रुटियाँ)
- [मॉडल तैनाती विफलताएँ](#मॉडल-तैनाती-विफलताएँ)
- [प्रदर्शन और स्केलिंग समस्याएँ](#प्रदर्शन-और-स्केलिंग-समस्याएँ)
- [लागत और कोटा प्रबंधन](#लागत-और-कोटा-प्रबंधन)
- [डिबगिंग टूल्स और तकनीकें](#डिबगिंग-टूल्स-और-तकनीकें)

## Microsoft Foundry Models Service समस्याएँ

### समस्या: क्षेत्र में OpenAI सेवा अनुपलब्ध

**लक्षण:**
```
Error: The requested resource type is not available in the location 'westus'
```

**कारण:**
- चयनित क्षेत्र में Microsoft Foundry Models उपलब्ध नहीं
- पसंदीदा क्षेत्रों में कोटा समाप्त
- क्षेत्रीय क्षमता सीमाएँ

**समाधान:**

1. **क्षेत्र उपलब्धता जांचें:**
```bash
# OpenAI के लिए उपलब्ध क्षेत्रों की सूची बनाएं
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **AZD कॉन्फ़िगरेशन अपडेट करें:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **वैकल्पिक क्षेत्रों का उपयोग करें:**
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

### समस्या: मॉडल तैनाती कोटा से अधिक

**लक्षण:**
```
Error: Deployment failed due to insufficient quota
```

**समाधान:**

1. **वर्तमान कोटा जांचें:**
```bash
# कोटा उपयोग की जांच करें
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **कोटा वृद्धि का अनुरोध करें:**
```bash
# कोटा वृद्धि अनुरोध सबमिट करें
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **मॉडल क्षमता का अनुकूलन करें:**
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

**लक्षण:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**समाधान:**

1. **समर्थित API संस्करण का उपयोग करें:**
```python
# नवीनतम समर्थित संस्करण का उपयोग करें
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API संस्करण संगतता जांचें:**
```bash
# समर्थित API संस्करणों की सूची बनाएँ
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search समस्याएँ

### समस्या: खोज सेवा मूल्य निर्धारण स्तर अपर्याप्त

**लक्षण:**
```
Error: Semantic search requires Basic tier or higher
```

**समाधान:**

1. **मूल्य निर्धारण स्तर को अपग्रेड करें:**
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

2. **सेमेन्टिक खोज अक्षम करें (विकास):**
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

### समस्या: इंडेक्स निर्माण विफलताएँ

**लक्षण:**
```
Error: Cannot create index, insufficient permissions
```

**समाधान:**

1. **खोज सेवा कुंजियाँ सत्यापित करें:**
```bash
# खोज सेवा व्यवस्थापक कुंजी प्राप्त करें
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **इंडेक्स स्कीमा जांचें:**
```python
# सूचकांक योजना को सत्यापित करें
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

3. **प्रबंधित पहचान का उपयोग करें:**
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

## कंटेनर ऐप्स डिप्लॉयमेंट समस्याएँ

### समस्या: कंटेनर निर्माण विफलताएँ

**लक्षण:**
```
Error: Failed to build container image
```

**समाधान:**

1. **Dockerfile सिंटैक्स जांचें:**
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

2. **निर्भरता मान्य करें:**
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

3. **हेल्थ चेक जोड़ें:**
```python
# main.py - हेल्थ चेक एंडपॉइंट जोड़ें
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### समस्या: कंटेनर ऐप स्टार्टअप विफलताएँ

**लक्षण:**
```
Error: Container failed to start within timeout period
```

**समाधान:**

1. **स्टार्टअप टाइमआउट बढ़ाएँ:**
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

2. **मॉडल लोडिंग को अनुकूलित करें:**
```python
# प्रारंभिक समय कम करने के लिए मॉडल्स को लेजी लोड करें
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
        # यहां AI क्लाइंट को प्रारंभ करें
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # प्रारंभ
    app.state.model_manager = ModelManager()
    yield
    # बंद करें
    pass

app = FastAPI(lifespan=lifespan)
```

## प्रमाणीकरण और अनुमति त्रुटियाँ

### समस्या: प्रबंधित पहचान अनुमति अस्वीकृत

**लक्षण:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**समाधान:**

1. **भूमिका असाइनमेंट सत्यापित करें:**
```bash
# वर्तमान भूमिका असाइनमेंट की जाँच करें
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **आवश्यक भूमिकाएँ असाइन करें:**
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

3. **प्रमाणीकरण का परीक्षण करें:**
```python
# प्रबंधित पहचान प्रमाणीकरण का परीक्षण करें
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

### समस्या: कुंजी वॉल्ट एक्सेस अस्वीकृत

**लक्षण:**
```
Error: The user, group or application does not have secrets get permission
```

**समाधान:**

1. **कुंजी वॉल्ट अनुमतियाँ दें:**
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

2. **एक्सेस नीतियों के बजाय RBAC का उपयोग करें:**
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

## मॉडल तैनाती विफलताएँ

### समस्या: मॉडल संस्करण उपलब्ध नहीं

**लक्षण:**
```
Error: Model version 'gpt-4-32k' is not available
```

**समाधान:**

1. **उपलब्ध मॉडल जांचें:**
```bash
# उपलब्ध मॉडल सूचीबद्ध करें
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **मॉडल फॉलैबैक का उपयोग करें:**
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

3. **तैनाती से पहले मॉडल सत्यापित करें:**
```python
# पूर्व-डिप्लॉयमेंट मॉडल सत्यापन
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

## प्रदर्शन और स्केलिंग समस्याएँ

### समस्या: उच्च विलंब प्रतिक्रिया

**लक्षण:**
- प्रतिक्रिया समय > 30 सेकंड
- टाइमआउट त्रुटियाँ
- खराब उपयोगकर्ता अनुभव

**समाधान:**

1. **रिक्वेस्ट टाइमआउट लागू करें:**
```python
# उचित टाइमआउट सेट करें
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

2. **प्रतिक्रिया कैशिंग जोड़ें:**
```python
# प्रतिक्रियाओं के लिए Redis कैश
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

3. **ऑटो-स्केलिंग कॉन्फ़िगर करें:**
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

### समस्या: मेमोरी आउट ऑफ त्रुटियाँ

**लक्षण:**
```
Error: Container killed due to memory limit exceeded
```

**समाधान:**

1. **मेमोरी आवंटन बढ़ाएँ:**
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

2. **मेमोरी उपयोग अनुकूलित करें:**
```python
# मेमोरी-कुशल मॉडल हैंडलिंग
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # प्रोसेसिंग से पहले मेमोरी उपयोग जांचें
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # जबरदस्ती गार्बेज कलेक्शन करें
            
        result = await self._process_ai_request(request)
        
        # प्रोसेसिंग के बाद साफ-सफाई करें
        gc.collect()
        return result
```

## लागत और कोटा प्रबंधन

### समस्या: अप्रत्याशित उच्च लागतें

**लक्षण:**
- अपेक्षा से अधिक Azure बिल
- अनुमान से अधिक टोकन उपयोग
- बजट अलर्ट ट्रिगर

**समाधान:**

1. **लागत नियंत्रण लागू करें:**
```python
# टोकन उपयोग ट्रैकिंग
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

2. **लागत अलर्ट सेट करें:**
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

3. **मॉडल चयन का अनुकूलन करें:**
```python
# लागत-सचेत मॉडल चयन
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

## डिबगिंग टूल्स और तकनीकें

### AZD डिबगिंग कमांड्स

```bash
# विस्तृत लॉगिंग सक्षम करें
azd up --debug

# डिप्लॉयमेंट स्थिति जांचें
azd show

# एप्लिकेशन लॉग देखें (मॉनिटरिंग डैशबोर्ड खोलता है)
azd monitor --logs

# लाइव मेट्रिक्स देखें
azd monitor --live

# पर्यावरण चर जांचें
azd env get-values
```

### AZD AI एक्सटेंशन कमांड्स डायग्नोस्टिक्स के लिए

यदि आपने `azd ai agent init` का उपयोग करके एजेंट तैनात किए हैं, तो ये अतिरिक्त टूल उपलब्ध हैं:

```bash
# सुनिश्चित करें कि एजेंट्स एक्सटेंशन इंस्टॉल है
azd extension install azure.ai.agents

# एक एजेंट को मेनिफेस्ट से पुनः आरंभ या अपडेट करें
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# परियोजना स्थिति पूछने के लिए AI उपकरणों को MCP सर्वर का उपयोग करने दें
azd mcp start

# समीक्षा और ऑडिट के लिए इन्फ्रास्ट्रक्चर फाइलें उत्पन्न करें
azd infra generate
```

> **टिप:** `azd infra generate` का उपयोग करें ताकि IaC को डिस्क पर लिखा जा सके ताकि आप ठीक से निरीक्षण कर सकें कि कौन से संसाधन प्रदत्त किए गए थे। यह संसाधन कॉन्फ़िगरेशन समस्याओं को डिबग करते समय अमूल्य है। पूर्ण विवरण के लिए देखें [AZD AI CLI संदर्भ](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)।

### एप्लिकेशन डिबगिंग

1. **संरचित लॉगिंग:**
```python
import logging
import json

# एआई अनुप्रयोगों के लिए संरचित लॉगिंग कॉन्फ़िगर करें
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

2. **हेल्थ चेक एंडपॉइंट्स:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # OpenAI कनेक्टिविटी जांचें
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # सर्च सेवा जांचें
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

## सामान्य त्रुटि कोड और समाधान

| त्रुटि कोड | विवरण | समाधान |
|------------|--------|--------|
| 401 | अनधिकृत | API कुंजियाँ और प्रबंधित पहचान कॉन्फ़िगरेशन जांचें |
| 403 | प्रतिबंधित | RBAC भूमिका असाइनमेंट सत्यापित करें |
| 429 | रेट लिमिटेड | अनुमानित रीट्राई लॉजिक लागू करें exponential backoff के साथ |
| 500 | आंतरिक सर्वर त्रुटि | मॉडल तैनाती स्थिति और लॉग जांचें |
| 503 | सेवा अनुपलब्ध | सेवा स्वास्थ्य और क्षेत्रीय उपलब्धता सत्यापित करें |

## अगले कदम

1. **[AI मॉडल तैनाती गाइड](../chapter-02-ai-development/ai-model-deployment.md)** को तैनाती सर्वोत्तम प्रथाओं के लिए समीक्षा करें
2. **[प्रोडक्शन AI प्रथाएँ](../chapter-08-production/production-ai-practices.md)** पूरी करें एंटरप्राइज-तैयार समाधानों के लिए
3. **[Microsoft Foundry Discord](https://aka.ms/foundry/discord)** में शामिल हों समुदाय समर्थन के लिए
4. **समस्याएँ प्रस्तुत करें** [AZD GitHub रिपोजिटरी](https://github.com/Azure/azure-dev) में AZD-विशिष्ट समस्याओं के लिए

## संसाधन

- [Microsoft Foundry Models सेवा समस्या निवारण](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [कंटेनर ऐप्स समस्या निवारण](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search समस्या निवारण](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - अपने संपादक में Azure समस्या निवारण कौशल इंस्टॉल करें: `npx skills add microsoft/github-copilot-for-azure`

---

**अध्याय नेविगेशन:**
- **📚 पाठ्यक्रम होम**: [AZD शुरुआती के लिए](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 7 - समस्या निवारण और डिबगिंग
- **⬅️ पिछला**: [डिबगिंग गाइड](debugging.md)
- **➡️ अगला अध्याय**: [अध्याय 8: प्रोडक्शन और एंटरप्राइज पैटर्न](../chapter-08-production/production-ai-practices.md)
- **🤖 संबंधित**: [अध्याय 2: AI-प्रथम विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 संदर्भ**: [Azure Developer CLI समस्या निवारण](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयासरत हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियाँ या असंगतताएँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में आधिकारिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सलाह दी जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम जिम्मेदार नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->