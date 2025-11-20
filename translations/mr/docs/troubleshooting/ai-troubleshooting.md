<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b5ae13b6a245ab3a2e6dae923aab65bd",
  "translation_date": "2025-11-20T13:08:40+00:00",
  "source_file": "docs/troubleshooting/ai-troubleshooting.md",
  "language_code": "mr"
}
-->
# एआय-विशिष्ट समस्या निवारण मार्गदर्शक

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD फॉर बिगिनर्स](../../README.md)
- **📖 चालू अध्याय**: अध्याय 7 - समस्या निवारण आणि डीबगिंग
- **⬅️ मागील**: [डीबगिंग मार्गदर्शक](debugging.md)
- **➡️ पुढील अध्याय**: [अध्याय 8: उत्पादन आणि एंटरप्राइझ पॅटर्न्स](../microsoft-foundry/production-ai-practices.md)
- **🤖 संबंधित**: [अध्याय 2: एआय-फर्स्ट डेव्हलपमेंट](../microsoft-foundry/microsoft-foundry-integration.md)

**मागील:** [उत्पादन एआय पद्धती](../microsoft-foundry/production-ai-practices.md) | **पुढील:** [AZD सह सुरुवात करा](../getting-started/README.md)

ही सविस्तर समस्या निवारण मार्गदर्शिका AZD सह एआय सोल्यूशन्स तैनात करताना येणाऱ्या सामान्य समस्यांचे निराकरण करते, ज्यामध्ये Azure AI सेवांसाठी विशिष्ट उपाय आणि डीबगिंग तंत्रे दिली आहेत.

## विषय सूची

- [Azure OpenAI सेवा समस्या](../../../../docs/troubleshooting)
- [Azure AI शोध समस्या](../../../../docs/troubleshooting)
- [कंटेनर अॅप्स तैनाती समस्या](../../../../docs/troubleshooting)
- [प्रमाणीकरण आणि परवानगी त्रुटी](../../../../docs/troubleshooting)
- [मॉडेल तैनाती अयशस्वी](../../../../docs/troubleshooting)
- [कामगिरी आणि स्केलिंग समस्या](../../../../docs/troubleshooting)
- [खर्च आणि कोटा व्यवस्थापन](../../../../docs/troubleshooting)
- [डीबगिंग साधने आणि तंत्रे](../../../../docs/troubleshooting)

## Azure OpenAI सेवा समस्या

### समस्या: OpenAI सेवा क्षेत्रात उपलब्ध नाही

**लक्षणे:**
```
Error: The requested resource type is not available in the location 'westus'
```

**कारणे:**
- निवडलेल्या क्षेत्रात Azure OpenAI उपलब्ध नाही
- प्राधान्य क्षेत्रांमध्ये कोटा संपला आहे
- प्रादेशिक क्षमता मर्यादा

**उपाय:**

1. **क्षेत्र उपलब्धता तपासा:**
```bash
# OpenAI साठी उपलब्ध प्रदेशांची यादी
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **AZD कॉन्फिगरेशन अपडेट करा:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **पर्यायी क्षेत्रे वापरा:**
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

### समस्या: मॉडेल तैनाती कोटा ओलांडला

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

2. **कोटा वाढविण्यासाठी विनंती करा:**
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

### समस्या: अवैध API आवृत्ती

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
# समर्थित API आवृत्त्या सूचीबद्ध करा
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI शोध समस्या

### समस्या: शोध सेवा किंमत श्रेणी अपुरी

**लक्षणे:**
```
Error: Semantic search requires Basic tier or higher
```

**उपाय:**

1. **किंमत श्रेणी अपग्रेड करा:**
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

2. **सामान्य शोध अक्षम करा (विकासासाठी):**
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

### समस्या: अनुक्रमणिका निर्मिती अयशस्वी

**लक्षणे:**
```
Error: Cannot create index, insufficient permissions
```

**उपाय:**

1. **शोध सेवा कीज सत्यापित करा:**
```bash
# शोध सेवा प्रशासक की मिळवा
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **अनुक्रमणिका योजना तपासा:**
```python
# अनुक्रमणिका योजना सत्यापित करा
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

### समस्या: कंटेनर बिल्ड अयशस्वी

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

2. **आवश्यकता सत्यापित करा:**
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
# main.py - आरोग्य तपासणी एंडपॉइंट जोडा
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### समस्या: कंटेनर अॅप स्टार्टअप अयशस्वी

**लक्षणे:**
```
Error: Container failed to start within timeout period
```

**उपाय:**

1. **स्टार्टअप टाइमआउट वाढवा:**
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
# प्रारंभ वेळ कमी करण्यासाठी मॉडेल्सला आळशी लोड करा
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
        # येथे AI क्लायंट प्रारंभ करा
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

### समस्या: मॅनेज्ड आयडेंटिटी परवानगी नाकारली

**लक्षणे:**
```
Error: Authentication failed for Azure OpenAI Service
```

**उपाय:**

1. **भूमिका असाइनमेंट सत्यापित करा:**
```bash
# वर्तमान भूमिका नियुक्त्या तपासा
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **आवश्यक भूमिका असाइन करा:**
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

### समस्या: की व्हॉल्ट प्रवेश नाकारला

**लक्षणे:**
```
Error: The user, group or application does not have secrets get permission
```

**उपाय:**

1. **की व्हॉल्ट परवानग्या द्या:**
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

2. **RBAC चा वापर करा, प्रवेश धोरणाऐवजी:**
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
# उपलब्ध मॉडेल्सची यादी
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

3. **तैनातीपूर्वी मॉडेल सत्यापित करा:**
```python
# पूर्व-तैनाती मॉडेल सत्यापन
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

## कामगिरी आणि स्केलिंग समस्या

### समस्या: उच्च विलंब प्रतिसाद

**लक्षणे:**
- प्रतिसाद वेळ > 30 सेकंद
- टाइमआउट त्रुटी
- खराब वापरकर्ता अनुभव

**उपाय:**

1. **विनंती टाइमआउट लागू करा:**
```python
# योग्य टाइमआउट्स कॉन्फिगर करा
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
# प्रतिसादांसाठी Redis कॅशे
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

### समस्या: मेमरी आउट ऑफ त्रुटी

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
# मेमरी-कार्यक्षम मॉडेल हाताळणी
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # प्रक्रिया करण्यापूर्वी मेमरी वापर तपासा
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # गार्बेज कलेक्शन सक्तीने करा
            
        result = await self._process_ai_request(request)
        
        # प्रक्रिया पूर्ण झाल्यानंतर साफसफाई करा
        gc.collect()
        return result
```

## खर्च आणि कोटा व्यवस्थापन

### समस्या: अनपेक्षित उच्च खर्च

**लक्षणे:**
- Azure बिल अपेक्षेपेक्षा जास्त
- टोकन वापर अंदाज ओलांडतो
- बजेट अलर्ट ट्रिगर झाले

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

2. **खर्च अलर्ट सेट करा:**
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
# खर्च-जाणीव असलेली मॉडेल निवड
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # प्रति 1K टोकन्स
    'gpt-4': 0.03,          # प्रति 1K टोकन्स
    'gpt-35-turbo': 0.0015  # प्रति 1K टोकन्स
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

## डीबगिंग साधने आणि तंत्रे

### AZD डीबगिंग कमांड्स

```bash
# विस्तृत लॉगिंग सक्षम करा
azd up --debug

# उपयोजन स्थिती तपासा
azd show

# उपयोजन लॉग पहा
azd logs --follow

# पर्यावरणीय चल तपासा
azd env get-values
```

### अनुप्रयोग डीबगिंग

1. **संरचित लॉगिंग:**
```python
import logging
import json

# एआय अनुप्रयोगांसाठी संरचित लॉगिंग कॉन्फिगर करा
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

3. **कामगिरी निरीक्षण:**
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

## सामान्य त्रुटी कोड आणि उपाय

| त्रुटी कोड | वर्णन | उपाय |
|------------|-------------|----------|
| 401 | अनधिकृत | API कीज आणि मॅनेज्ड आयडेंटिटी कॉन्फिगरेशन तपासा |
| 403 | प्रतिबंधित | RBAC भूमिका असाइनमेंट सत्यापित करा |
| 429 | दर मर्यादित | एक्स्पोनेंशियल बॅकऑफसह पुनर्प्रयत्न लॉजिक लागू करा |
| 500 | अंतर्गत सर्व्हर त्रुटी | मॉडेल तैनाती स्थिती आणि लॉग तपासा |
| 503 | सेवा अनुपलब्ध | सेवा आरोग्य आणि प्रादेशिक उपलब्धता सत्यापित करा |

## पुढील पावले

1. **[एआय मॉडेल तैनाती मार्गदर्शक](ai-model-deployment.md)** पुनरावलोकन करा तैनातीसाठी सर्वोत्तम पद्धतींसाठी
2. **[उत्पादन एआय पद्धती](production-ai-practices.md)** पूर्ण करा एंटरप्राइझ-रेडी सोल्यूशन्ससाठी
3. **[Microsoft Foundry Discord](https://aka.ms/foundry/discord)** मध्ये सामील व्हा समुदाय समर्थनासाठी
4. **समस्या सबमिट करा** [AZD GitHub रिपॉझिटरी](https://github.com/Azure/azure-dev) वर AZD-विशिष्ट समस्यांसाठी

## संसाधने

- [Azure OpenAI सेवा समस्या निवारण](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [कंटेनर अॅप्स समस्या निवारण](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI शोध समस्या निवारण](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD फॉर बिगिनर्स](../../README.md)
- **📖 चालू अध्याय**: अध्याय 7 - समस्या निवारण आणि डीबगिंग
- **⬅️ मागील**: [डीबगिंग मार्गदर्शक](debugging.md)
- **➡️ पुढील अध्याय**: [अध्याय 8: उत्पादन आणि एंटरप्राइझ पॅटर्न्स](../microsoft-foundry/production-ai-practices.md)
- **🤖 संबंधित**: [अध्याय 2: एआय-फर्स्ट डेव्हलपमेंट](../microsoft-foundry/microsoft-foundry-integration.md)
- [Azure Developer CLI समस्या निवारण](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून भाषांतरित करण्यात आला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी कृपया लक्षात ठेवा की स्वयंचलित भाषांतरे त्रुटी किंवा अचूकतेच्या अभावाने युक्त असू शकतात. मूळ भाषेतील दस्तऐवज हा अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराचा वापर करून उद्भवलेल्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थासाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->