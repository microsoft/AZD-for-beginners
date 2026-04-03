# AI-विशिष्ट त्रoubleshooting मार्गदर्शक

**अध्याय निव्वळ:**
- **📚 कोर्स मुखपृष्ठ**: [AZD For Beginners](../../README.md)
- **📖 सध्याचा अध्याय**: अध्याय 7 - Troubleshooting & Debugging
- **⬅️ मागील**: [Debugging Guide](debugging.md)
- **➡️ पुढचा अध्याय**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 संबंधित**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

हा सर्वसमावेशक त्रoubleshooting मार्गदर्शक AZD सह AI सोल्यूशन्स तैनात करताना येणाऱ्या सामान्य समस्या, त्या सोडवण्याचे मार्ग आणि Azure AI सेवांसाठी विशिष्ट डीबगिंग तंत्रे दाखवतो.

## अनुक्रमणिका

- [Microsoft Foundry Models Service Issues](#azure-openai-service-issues)
- [Azure AI Search Problems](#azure-ai-search-problems)
- [Container Apps Deployment Issues](#container-apps-deployment-issues)
- [Authentication and Permission Errors](#authentication-and-permission-errors)
- [Model Deployment Failures](#model-deployment-failures)
- [Performance and Scaling Issues](#performance-and-scaling-issues)
- [Cost and Quota Management](#cost-and-quota-management)
- [Debugging Tools and Techniques](#debugging-tools-and-techniques)

## Microsoft Foundry Models Service Issues

### Issue: OpenAI Service Unavailable in Region

**लक्षणे:**
```
Error: The requested resource type is not available in the location 'westus'
```

**कारणे:**
- निवडलेल्या प्रदेशात Microsoft Foundry Models उपलब्ध नाहीत
- आवडत्या प्रदेशांमध्ये कोटा संपला आहे
- प्रादेशिक क्षमता मर्यादा

**उपाय:**

1. **प्रदेश उपलब्धता तपासा:**
```bash
# OpenAI साठी उपलब्ध प्रदेशांची यादी करा
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

3. **पर्यायी प्रदेश वापरा:**
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

2. **कोटा वाढवण्याची विनंती करा:**
```bash
# कोटा वाढीची विनंती सादर करा
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **मॉडेल क्षमता सुधारित करा:**
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
# समर्थित API आवृत्त्यांची यादी
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search Problems

### Issue: Search Service Pricing Tier Insufficient

**लक्षणे:**
```
Error: Semantic search requires Basic tier or higher
```

**उपाय:**

1. **प्राइसिंग टियर अपग्रेड करा:**
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

2. **Semantic Search अक्षम करा (विकासाकरता):**
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

**लक्षणे:**
```
Error: Cannot create index, insufficient permissions
```

**उपाय:**

1. **Search सेवा कीज तपासा:**
```bash
# शोध सेवेसाठी प्रशासकीय की मिळवा
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **इंडेक्स स्कीमा तपासा:**
```python
# इंडेक्स स्कीमा सत्यापित करा
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

3. **Managed Identity वापरा:**
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

**लक्षणे:**
```
Error: Failed to build container image
```

**उपाय:**

1. **Dockerfile_Syntax तपासा:**
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

2. **Dependencies तपासा:**
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

3. **Health Check जोडा:**
```python
# main.py - हेल्थ चेक एंडपॉइंट जोडा
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Issue: Container App Startup Failures

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
# स्टार्टअप वेळ कमी करण्यासाठी मॉडेल्सना आलसीपणे लोड करा
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
    # बंद
    pass

app = FastAPI(lifespan=lifespan)
```

## Authentication and Permission Errors

### Issue: Managed Identity Permission Denied

**लक्षणे:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**उपाय:**

1. **Role Assignments तपासा:**
```bash
# सध्याच्या भूमिका वाटपांची तपासणी करा
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **आवश्यक रोल्स नियुक्त करा:**
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

3. **ऑथेंटिकेशन तपासा:**
```python
# व्यवस्थापित ओळख प्रमाणीकरणाची चाचणी
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

**लक्षणे:**
```
Error: The user, group or application does not have secrets get permission
```

**उपाय:**

1. **Key Vault परवानग्या द्या:**
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

2. **Access Policies ऐवजी RBAC वापरा:**
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

2. **मॉडेल फॉलबॅक्स वापरा:**
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

3. **तैनात करण्यापूर्वी मॉडेल वैधता तपासा:**
```python
# तैनातीपूर्वी मॉडेलचे सत्यापन
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

**लक्षणे:**
- प्रतिसाद वेळ > 30 सेकंद
- टाइमआउट त्रुटी
- खराब वापरकर्ता अनुभव

**उपाय:**

1. **रिक्वेस्ट टाइमआउट लागू करा:**
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

2. **रिस्पॉन्स कॅशिंग जोडा:**
```python
# प्रतिसादांसाठी Redis कॅश
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

3. **ऑटो-स्केल कॉन्फिगर करा:**
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
# स्मृती-कारक्षम मॉडेल हाताळणी
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # प्रक्रिया करण्यापूर्वी स्मृतीचा वापर तपासा
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # कचरा संकलन जबरदस्ती चालवा
            
        result = await self._process_ai_request(request)
        
        # प्रक्रिया झाल्यानंतर साफसफाई करा
        gc.collect()
        return result
```

## Cost and Quota Management

### Issue: Unexpected High Costs

**लक्षणे:**
- अपेक्षितापेक्षा जास्त Azure बिल
- टोकन वापर अंदाजपेक्षा जास्त
- बजेट अलर्ट ट्रिगर झाले

**उपाय:**

1. **खर्च नियंत्रणे लागू करा:**
```python
# टोकन वापराचा मागोवा
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
# खर्च लक्षात घेऊन मॉडेलची निवड
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

## Debugging Tools and Techniques

### AZD Debugging Commands

```bash
# विस्तृत लॉगिंग सक्षम करा
azd up --debug

# डिप्लॉयमेंट स्थिती तपासा
azd show

# अॅप्लिकेशन लॉग पहा (मॉनिटरिंग डॅशबोर्ड उघडेल)
azd monitor --logs

# लाइव्ह मेट्रिक्स पहा
azd monitor --live

# पर्यावरणीय चल तपासा
azd env get-values
```

### AZD AI Extension Commands for Diagnostics

If you deployed agents using `azd ai agent init`, these additional tools are available:

```bash
# एजंट्स एक्स्टेन्शन स्थापित आहे याची खात्री करा
azd extension install azure.ai.agents

# मॅनिफेस्टमधून एजंट पुन्हा प्रारंभ करा किंवा अद्यतनित करा
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# एआय साधनांना प्रकल्पाची स्थिती विचार करण्यासाठी MCP सर्व्हर वापरा
azd mcp start

# पुनरावलोकन आणि लेखापरीक्षणासाठी पायाभूत रचना फायली तयार करा
azd infra generate
```

> **टीप:** `azd infra generate` वापरा जेणेकरून IaC डिस्कवर लिहिले जाईल आणि तुम्ही नेमके कोणती रिसोर्सेस प्रोव्हिजन केली गेली आहेत हे तपासू शकाल. रिसोर्स कॉन्फिगरेशन समस्या डीबग करताना हे अत्यंत उपयुक्त आहे. संपूर्ण तपशीलांसाठी पहा [AZD AI CLI reference](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions).

### Application Debugging

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

3. **परफॉर्मन्स मॉनिटरिंग:**
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
| 401 | अनधिकृत | API कीज आणि managed identity कॉन्फिगरेशन तपासा |
| 403 | परवानगी नाकारली | RBAC रोल नियुक्त्या सत्यापित करा |
| 429 | रेट लिमिट | व्युत्क्रम बॅकऑफसह रीट्राय लॉजिक लागू करा |
| 500 | अंतर्गत सर्व्हर त्रुटी | मॉडेल तैनात स्थिती आणि लॉग तपासा |
| 503 | सेवा अनुपलब्ध | सेवा आरोग्य आणि प्रादेशिक उपलब्धता तपासा |

## पुढील पावले

1. **[AI Model Deployment Guide](../chapter-02-ai-development/ai-model-deployment.md)** मधील तैनाती सर्वोत्तम पद्धती पाहा
2. **[Production AI Practices](../chapter-08-production/production-ai-practices.md)** पूर्ण करा एंटरप्राइज-रेडी सोल्यूशन्ससाठी
3. **समुदाय समर्थनासाठी [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** मध्ये सामील व्हा
4. **AZD-विशिष्ट समस्यांसाठी** [AZD GitHub repository](https://github.com/Azure/azure-dev) वर issues सबमिट करा

## संसाधने

- [Microsoft Foundry Models Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - आपल्या एडिटरमध्ये Azure troubleshooting skills इन्स्टॉल करा: `npx skills add microsoft/github-copilot-for-azure`

---

**अध्याय निव्वळ:**
- **📚 कोर्स मुखपृष्ठ**: [AZD For Beginners](../../README.md)
- **📖 सध्याचा अध्याय**: अध्याय 7 - Troubleshooting & Debugging
- **⬅️ मागील**: [Debugging Guide](debugging.md)
- **➡️ पुढचा अध्याय**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 संबंधित**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 संदर्भ**: [Azure Developer CLI Troubleshooting](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
हा दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित केला गेला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, कृपया लक्षात घ्या की स्वयंचलित अनुवादांमध्ये चुका किंवा अचूकतेच्या त्रुटी असू शकतात. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत म्हणून विचारात घेतला पाहिजे. महत्वाच्या माहितीसाठी, व्यावसायिक मानवी अनुवादाची शिफारस केली जाते. या अनुवादाच्या वापरामुळे उद्भवलेल्या कोणत्याही गैरसमजुतींसाठी किंवा चुकीच्या अर्थनिर्देशांसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->