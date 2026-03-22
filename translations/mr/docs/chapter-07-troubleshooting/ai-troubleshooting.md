# AI-विशिष्ट समस्या निवारण मार्गदर्शक

**प्रकरण नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान प्रकरण**: प्रकरण 7 - समस्या निवारण आणि डीबगिंग
- **⬅️ मागील**: [डीबगिंग मार्गदर्शक](debugging.md)
- **➡️ पुढील प्रकरण**: [प्रकरण 8: प्रॉडक्शन आणि एंटरप्राइज पॅटर्न्स](../chapter-08-production/production-ai-practices.md)
- **🤖 संबंधित**: [प्रकरण 2: AI-फर्स्ट डेव्हलपमेंट](../chapter-02-ai-development/microsoft-foundry-integration.md)

हा सर्वसमावेशक समस्या निवारण मार्गदर्शक AZD सह AI सोल्युशन्स तैनात करताना येणाऱ्या सामान्य अडचणींना उद्देशून आहे, ज्यामध्ये Azure AI सेवा संबंधित विशिष्ट उपाय आणि डीबगिंग तंत्रे दिलेली आहेत.

## आकृती सूची

- [Microsoft Foundry Models सेवा समस्या](../../../../docs/chapter-07-troubleshooting)
- [Azure AI सर्च समस्या](../../../../docs/chapter-07-troubleshooting)
- [कंटेनर अॅप्स तैनाती समस्या](../../../../docs/chapter-07-troubleshooting)
- [प्रमाणीकरण आणि परवानगी त्रुटी](../../../../docs/chapter-07-troubleshooting)
- [मॉडेल तैनात करण्यात अपयश](../../../../docs/chapter-07-troubleshooting)
- [कार्यक्षमता आणि स्केलिंग समस्या](../../../../docs/chapter-07-troubleshooting)
- [खर्च आणि कोटा व्यवस्थापन](../../../../docs/chapter-07-troubleshooting)
- [डीबगिंग साधने आणि तंत्रे](../../../../docs/chapter-07-troubleshooting)

## Microsoft Foundry Models सेवा समस्या

### समस्या: OpenAI सेवा क्षेत्रात उपलब्ध नाही

**लक्षणे:**
```
Error: The requested resource type is not available in the location 'westus'
```

**कारणे:**
- निवडलेल्या क्षेत्रात Microsoft Foundry Models उपलब्ध नाहीत
- प्राधान्यकृत क्षेत्रांतील कोटा संपुष्टात आला आहे
- क्षेत्रीय क्षमता मर्यादा

**उपाय:**

1. **क्षेत्र उपलब्धता तपासा:**
```bash
# OpenAI साठी उपलब्ध प्रदेशांची यादी करा
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **AZD कॉन्फिगरेशन अद्ययावत करा:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **पर्यायी क्षेत्रांचा वापर करा:**
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

### समस्या: मॉडेल तैनाती कोटा ओलांडले

**लक्षणे:**
```
Error: Deployment failed due to insufficient quota
```

**उपाय:**

1. **सध्याचा कोटा तपासा:**
```bash
# कोटा वापर तपासा
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **कोटा वाढीची विनंती करा:**
```bash
# कोटा वाढीची विनंती सादर करा
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **मॉडेल क्षमता ऑप्टिमाइझ करा:**
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

### समस्या: अमान्य API आवृत्ती

**लक्षणे:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**उपाय:**

1. **समर्थित API आवृत्ती वापरा:**
```python
# नवीनतम समर्थित आवृत्ती वापरा
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API आवृत्ती सुसंगतता तपासा:**
```bash
# समर्थित API आवृत्त्यांची यादी करा
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI सर्च समस्या

### समस्या: सर्च सेवा किंमत स्तर अपुरे

**लक्षणे:**
```
Error: Semantic search requires Basic tier or higher
```

**उपाय:**

1. **किंमत स्तर अपडेट करा:**
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

2. **सेमँटिक सर्च अक्षम करा (डेव्हलपमेंट):**
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

### समस्या: इंडेक्स तयार करण्यात अपयश

**लक्षणे:**
```
Error: Cannot create index, insufficient permissions
```

**उपाय:**

1. **सर्च सेवा कीज तपासा:**
```bash
# शोध सेवा प्रशासकीय कळ मिळवा
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **इंडेक्स स्कीमा तपासा:**
```python
# निर्देशांक योजना तपासा
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

3. **मॅनेज्ड आयडेंटिटी वापरा:**
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

## कंटेनर अॅप्स तैनाती समस्या

### समस्या: कंटेनर बिल्ड फेल्युअर्स

**लक्षणे:**
```
Error: Failed to build container image
```

**उपाय:**

1. **Dockerfile सिंटॅक्स तपासा:**
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

2. **आश्रितता वैध करा:**
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

3. **हेल्थ चेक जोडा:**
```python
# main.py - हेल्थ चेक एंडपॉइंट जोडा
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### समस्या: कंटेनर अॅप सुरू होण्यात अपयश

**लक्षणे:**
```
Error: Container failed to start within timeout period
```

**उपाय:**

1. **सुरूवात टाइमआउट वाढवा:**
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

2. **मॉडेल लोडिंग ऑप्टिमाइझ करा:**
```python
# प्रारंभ वेळ कमी करण्यासाठी मॉडेल्स मोकळ्या लोड करा
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
        # येथे AI क्लाएंट सुरू करा
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # प्रारंभ
    app.state.model_manager = ModelManager()
    yield
    # बंद करा
    pass

app = FastAPI(lifespan=lifespan)
```

## प्रमाणीकरण आणि परवानगी त्रुटी

### समस्या: मॅनेज्ड आयडेंटिटीला परवानगी नाकारली

**लक्षणे:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**उपाय:**

1. **भूमिका नियुक्तis तपासा:**
```bash
# वर्तमान भूमिका नियुक्त्या तपासा
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **आवश्यक भूमिका नियुक्त करा:**
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

3. **प्रमाणीकरण चाचणी करा:**
```python
# व्यवस्थापित ओळख प्रमाणीकरणाची चाचणी करा
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

### समस्या: की वॉल्ट प्रवेश नाकारला

**लक्षणे:**
```
Error: The user, group or application does not have secrets get permission
```

**उपाय:**

1. **की वॉल्ट परवानग्या द्या:**
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

2. **ऍक्सेस पॉलिसीऐवजी RBAC वापरा:**
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

## मॉडेल तैनाती अयशस्वी

### समस्या: मॉडेल आवृत्ती उपलब्ध नाही

**लक्षणे:**
```
Error: Model version 'gpt-4-32k' is not available
```

**उपाय:**

1. **उपलब्ध मॉडेल तपासा:**
```bash
# उपलब्ध मॉडेल्सची यादी करा
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **मॉडेल फॉलबॅक वापरा:**
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

3. **तैनातीपूर्वी मॉडेल वैध करा:**
```python
# तैनातीपूर्व मॉडेल सत्यापन
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

## कार्यक्षमता आणि स्केलिंग समस्या

### समस्या: उच्च विलंब प्रतिसाद

**लक्षणे:**
- प्रतिसाद वेळ > 30 सेकंद
- टाइमआउट त्रुटी
- खराब वापरकर्ता अनुभव

**उपाय:**

1. **विनंती टाइमआउट लागू करा:**
```python
# योग्य टाइमआउट सेट करा
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

2. **प्रतिसाद कॅशिंग जोडा:**
```python
# प्रतिसादांसाठी रेडिस कॅशे
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

3. **ऑटो-स्केलिंग कॉन्फिगर करा:**
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

### समस्या: मेमरी कमतर त्रुटी

**लक्षणे:**
```
Error: Container killed due to memory limit exceeded
```

**उपाय:**

1. **मेमरी वाटप वाढवा:**
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

2. **मेमरी वापर ऑप्टिमाइझ करा:**
```python
# स्मृती-कार्यक्षम मॉडेल हाताळणी
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # प्रक्रिया सुरू करण्यापूर्वी स्मृती वापर तपासा
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # जबरदस्तीने कचरापेटी संकलन करा
            
        result = await self._process_ai_request(request)
        
        # प्रक्रियेनंतर साफसफाई करा
        gc.collect()
        return result
```

## खर्च आणि कोटा व्यवस्थापन

### समस्या: अनपेक्षित उच्च खर्च

**लक्षणे:**
- अपेक्षा पेक्षा जास्त Azure बिल
- टोकन वापर अंदाजांपेक्षा जास्त
- बजेट सूचना सक्रिय

**उपाय:**

1. **खर्च नियंत्रण लागू करा:**
```python
# टोकन वापर ट्रॅकिंग
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

2. **खर्च सूचना सेट करा:**
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

3. **मॉडेल निवड ऑप्टिमाइझ करा:**
```python
# खर्च-जागरूक मॉडेल निवड
MODEL_COSTS = {
    'gpt-4.1-mini': 0.00015,  # प्रति 1K टोकन्स
    'gpt-4.1': 0.03,          # प्रति 1K टोकन्स
    'gpt-35-turbo': 0.0015  # प्रति 1K टोकन्स
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

## डीबगिंग साधने आणि तंत्रे

### AZD डीबगिंग कमांड्स

```bash
# तपशीलवार लॉगिंग सक्षम करा
azd up --debug

# तैनाती स्थिती तपासा
azd show

# अनुप्रयोग लॉग पहा (निरीक्षण डॅशबोर्ड उघडते)
azd monitor --logs

# थेट मेट्रिक्स पहा
azd monitor --live

# पर्यावरण चल तपासा
azd env get-values
```

### AZD AI विस्तार कमांड्स डायग्नोस्टिक्ससाठी

जर तुम्ही `azd ai agent init` वापरून एजंट्स तैनात केले असतील, तर हे अतिरिक्त साधने उपलब्ध आहेत:

```bash
# एजंटचा विस्तार स्थापित करणे सुनिश्चित करा
azd extension install azure.ai.agents

# मॅनिफेस्टमधून एजंट पुन्हा सुरू करा किंवा अपडेट करा
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# AI साधनांना प्रकल्प स्थिती क्वेरी करण्यासाठी MCP सर्व्हर वापरा
azd mcp start

# पुनरावलोकन आणि लेखापरीक्षणासाठी पायाभूत सुविधा फायली तयार करा
azd infra generate
```

> **टीप:** `azd infra generate` वापरा जेणेकरून तुम्ही IaC डिस्कवर लिहू शकता आणि कोणते संसाधने प्राव्हिजन केले आहेत हे तपासू शकता. हे संसाधन कॉन्फिगरेशन समस्या डीबग करताना अमूल्य आहे. संपूर्ण तपशीलांसाठी पहा [AZD AI CLI संदर्भ](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions).

### अनुप्रयोग डीबगिंग

1. **स्ट्रक्चर्ड लॉगिंग:**
```python
import logging
import json

# AI अनुप्रयोगांसाठी संरचित लॉगिंग कॉन्फिगर करा
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
    
    # OpenAI कनेक्टिव्हिटी तपासा
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # शोध सेवा तपासा
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

3. **कार्यक्षमता मॉनिटरिंग:**
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

## सामान्य त्रुटी कोड्स आणि उपाय

| त्रुटी कोड | वर्णन | उपाय |
|------------|-------------|----------|
| 401 | अनधिकृत | API कीज आणि मॅनेज्ड आयडेंटिटी कॉन्फिगरेशन तपासा |
| 403 | निषिद्ध | RBAC भूमिका नियुक्तis तपासा |
| 429 | दर मर्यादित | पुनर्प्रयत्न लॉजिक सह एक्स्पोनेंशियल बॅकऑफ अंमलात आणा |
| 500 | आंतरिक सर्व्हर त्रुटी | मॉडेल तैनात स्थिती आणि लॉग्स तपासा |
| 503 | सेवा उपलब्ध नाही | सेवा आरोग्य आणि क्षेत्रीय उपलब्धता तपासा |

## पुढील पावले

1. **[AI मॉडेल तैनात मार्गदर्शक](../chapter-02-ai-development/ai-model-deployment.md)** परीक्षणासाठी सर्वोत्तम सरावांसाठी
2. **[प्रॉडक्शन AI व्यवहारांची पूर्णता करा](../chapter-08-production/production-ai-practices.md)** एंटरप्राइज-सज्ज सोल्युशन्ससाठी
3. **संघटना समर्थनासाठी [Microsoft Foundry Discord](https://aka.ms/foundry/discord) मध्ये सामील व्हा**
4. **AZD-विशिष्ट समस्या सादर करा [AZD GitHub संग्रहालय](https://github.com/Azure/azure-dev)**

## संदर्भ

- [Microsoft Foundry Models सेवा समस्या निवारण](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [कंटेनर अॅप्स समस्या निवारण](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI सर्च समस्या निवारण](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure डायग्नोस्टिक्स एजंट कौशल्य**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - तुमच्या एडिटरमध्ये Azure समस्या निवारण कौशल्ये इंस्टॉल करा: `npx skills add microsoft/github-copilot-for-azure`

---

**प्रकरण नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान प्रकरण**: प्रकरण 7 - समस्या निवारण आणि डीबगिंग
- **⬅️ मागील**: [डीबगिंग मार्गदर्शक](debugging.md)
- **➡️ पुढील प्रकरण**: [प्रकरण 8: प्रॉडक्शन आणि एंटरप्राइज पॅटर्न्स](../chapter-08-production/production-ai-practices.md)
- **🤖 संबंधित**: [प्रकरण 2: AI-फर्स्ट डेव्हलपमेंट](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 संदर्भ**: [Azure Developer CLI समस्या निवारण](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून भाषांतरित केला आहे. आम्ही अचूकतेसाठी प्रयत्न करतो परंतु कृपया लक्षात घ्या की स्वयंचलित भाषांतरणांमध्ये त्रुटी किंवा अचूकतेत कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला जावा. अत्यंत महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी भाषांतर शिफारसीय आहे. या भाषांतराचा वापर करून होणाऱ्या कोणत्याही गैरसमजुती किंवा चुकीच्या अर्थलागी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->