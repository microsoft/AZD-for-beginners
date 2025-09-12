<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8943fe4b13e5c61c3cdc16c2d78a6724",
  "translation_date": "2025-09-12T19:39:42+00:00",
  "source_file": "docs/troubleshooting/ai-troubleshooting.md",
  "language_code": "ur"
}
-->
# Azure Developer CLI کے لیے AI مسائل حل کرنے کی گائیڈ

**پچھلا:** [پروڈکشن AI کے اصول](../ai-foundry/production-ai-practices.md) | **اگلا:** [AZD کے ساتھ شروعات](../getting-started/README.md)

یہ جامع گائیڈ AZD کے ذریعے AI حلوں کی تعیناتی کے دوران عام مسائل کو حل کرنے کے لیے مخصوص Azure AI سروسز کے حل اور ڈیبگنگ تکنیک فراہم کرتی ہے۔

## فہرست

- [Azure OpenAI سروس کے مسائل](../../../../docs/troubleshooting)
- [Azure AI سرچ کے مسائل](../../../../docs/troubleshooting)
- [کنٹینر ایپس کی تعیناتی کے مسائل](../../../../docs/troubleshooting)
- [تصدیق اور اجازت کی غلطیاں](../../../../docs/troubleshooting)
- [ماڈل کی تعیناتی کی ناکامیاں](../../../../docs/troubleshooting)
- [کارکردگی اور اسکیلنگ کے مسائل](../../../../docs/troubleshooting)
- [لاگت اور کوٹہ مینجمنٹ](../../../../docs/troubleshooting)
- [ڈیبگنگ کے اوزار اور تکنیک](../../../../docs/troubleshooting)

## Azure OpenAI سروس کے مسائل

### مسئلہ: OpenAI سروس علاقے میں دستیاب نہیں

**علامات:**
```
Error: The requested resource type is not available in the location 'westus'
```

**وجوہات:**
- منتخب علاقے میں Azure OpenAI دستیاب نہیں
- ترجیحی علاقوں میں کوٹہ ختم ہو گیا
- علاقائی صلاحیت کی پابندیاں

**حل:**

1. **علاقے کی دستیابی چیک کریں:**
```bash
# List available regions for OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **AZD کنفیگریشن کو اپ ڈیٹ کریں:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **متبادل علاقوں کا استعمال کریں:**
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

### مسئلہ: ماڈل تعیناتی کوٹہ ختم ہو گیا

**علامات:**
```
Error: Deployment failed due to insufficient quota
```

**حل:**

1. **موجودہ کوٹہ چیک کریں:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **کوٹہ بڑھانے کی درخواست کریں:**
```bash
# Submit quota increase request
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **ماڈل کی صلاحیت کو بہتر بنائیں:**
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

### مسئلہ: غلط API ورژن

**علامات:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**حل:**

1. **مدد یافتہ API ورژن استعمال کریں:**
```python
# Use latest supported version
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API ورژن مطابقت چیک کریں:**
```bash
# List supported API versions
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI سرچ کے مسائل

### مسئلہ: سرچ سروس کی قیمت کا درجہ ناکافی

**علامات:**
```
Error: Semantic search requires Basic tier or higher
```

**حل:**

1. **قیمت کے درجے کو اپ گریڈ کریں:**
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

2. **سمینٹک سرچ کو غیر فعال کریں (ترقی کے لیے):**
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

### مسئلہ: انڈیکس بنانے میں ناکامی

**علامات:**
```
Error: Cannot create index, insufficient permissions
```

**حل:**

1. **سرچ سروس کیز کی تصدیق کریں:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **انڈیکس اسکیمہ چیک کریں:**
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

3. **مینجڈ شناخت کا استعمال کریں:**
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

## کنٹینر ایپس کی تعیناتی کے مسائل

### مسئلہ: کنٹینر بلڈ کی ناکامی

**علامات:**
```
Error: Failed to build container image
```

**حل:**

1. **Dockerfile کی نحو چیک کریں:**
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

2. **انحصار کی تصدیق کریں:**
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

3. **ہیلتھ چیک شامل کریں:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### مسئلہ: کنٹینر ایپ کے آغاز کی ناکامی

**علامات:**
```
Error: Container failed to start within timeout period
```

**حل:**

1. **آغاز کے وقت کو بڑھائیں:**
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

2. **ماڈل لوڈنگ کو بہتر بنائیں:**
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

## تصدیق اور اجازت کی غلطیاں

### مسئلہ: منیجڈ شناخت کی اجازت مسترد

**علامات:**
```
Error: Authentication failed for Azure OpenAI Service
```

**حل:**

1. **رول اسائنمنٹس کی تصدیق کریں:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **ضروری رولز تفویض کریں:**
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

3. **تصدیق کی جانچ کریں:**
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

### مسئلہ: Key Vault تک رسائی مسترد

**علامات:**
```
Error: The user, group or application does not have secrets get permission
```

**حل:**

1. **Key Vault کی اجازت دیں:**
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

2. **RBAC کا استعمال کریں بجائے Access Policies کے:**
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

## ماڈل کی تعیناتی کی ناکامیاں

### مسئلہ: ماڈل ورژن دستیاب نہیں

**علامات:**
```
Error: Model version 'gpt-4-32k' is not available
```

**حل:**

1. **دستیاب ماڈلز چیک کریں:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **ماڈل فالبیکس استعمال کریں:**
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

3. **تعیناتی سے پہلے ماڈل کی تصدیق کریں:**
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

## کارکردگی اور اسکیلنگ کے مسائل

### مسئلہ: زیادہ تاخیر والے جوابات

**علامات:**
- جواب کا وقت > 30 سیکنڈ
- ٹائم آؤٹ کی غلطیاں
- خراب صارف تجربہ

**حل:**

1. **درخواست کے ٹائم آؤٹ نافذ کریں:**
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

2. **جواب کی کیشنگ شامل کریں:**
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

3. **آٹو اسکیلنگ کنفیگر کریں:**
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

### مسئلہ: میموری ختم ہونے کی غلطیاں

**علامات:**
```
Error: Container killed due to memory limit exceeded
```

**حل:**

1. **میموری الاٹمنٹ بڑھائیں:**
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

2. **میموری کے استعمال کو بہتر بنائیں:**
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

## لاگت اور کوٹہ مینجمنٹ

### مسئلہ: غیر متوقع زیادہ لاگت

**علامات:**
- Azure بل توقع سے زیادہ
- ٹوکن استعمال اندازوں سے زیادہ
- بجٹ الرٹس متحرک

**حل:**

1. **لاگت کنٹرول نافذ کریں:**
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

2. **لاگت کے الرٹس سیٹ کریں:**
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

3. **ماڈل کے انتخاب کو بہتر بنائیں:**
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

## ڈیبگنگ کے اوزار اور تکنیک

### AZD ڈیبگنگ کمانڈز

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

### ایپلیکیشن ڈیبگنگ

1. **ساختی لاگنگ:**
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

2. **ہیلتھ چیک اینڈپوائنٹس:**
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

3. **کارکردگی کی نگرانی:**
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

## عام غلطی کوڈز اور حل

| غلطی کوڈ | تفصیل | حل |
|------------|-------------|----------|
| 401 | غیر مجاز | API کیز اور منیجڈ شناخت کی کنفیگریشن چیک کریں |
| 403 | ممنوع | RBAC رول اسائنمنٹس کی تصدیق کریں |
| 429 | ریٹ محدود | ایکسپونینشل بیک آف کے ساتھ ریٹری لاجک نافذ کریں |
| 500 | اندرونی سرور کی غلطی | ماڈل کی تعیناتی کی حیثیت اور لاگز چیک کریں |
| 503 | سروس دستیاب نہیں | سروس کی صحت اور علاقائی دستیابی کی تصدیق کریں |

## اگلے مراحل

1. **[AI ماڈل تعیناتی گائیڈ](ai-model-deployment.md)** کا جائزہ لیں بہترین تعیناتی کے اصولوں کے لیے
2. **[پروڈکشن AI کے اصول](production-ai-practices.md)** مکمل کریں انٹرپرائز کے لیے تیار حل کے لیے
3. **[Azure AI Foundry Discord](https://aka.ms/foundry/discord)** میں شامل ہوں کمیونٹی سپورٹ کے لیے
4. **مسائل جمع کروائیں** [AZD GitHub repository](https://github.com/Azure/azure-dev) پر AZD سے متعلقہ مسائل کے لیے

## وسائل

- [Azure OpenAI سروس مسائل حل کرنا](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [کنٹینر ایپس مسائل حل کرنا](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI سرچ مسائل حل کرنا](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**پچھلا:** [پروڈکشن AI کے اصول](../ai-foundry/production-ai-practices.md) | **اگلا:** [ورکشاپ](../../workshop/README.md)
- [Azure Developer CLI مسائل حل کرنا](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

**ڈسکلیمر**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ ہم درستگی کے لیے کوشش کرتے ہیں، لیکن براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا غیر درستیاں ہو سکتی ہیں۔ اصل دستاویز کو اس کی اصل زبان میں مستند ذریعہ سمجھا جانا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے ذمہ دار نہیں ہیں۔