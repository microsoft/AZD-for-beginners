<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8943fe4b13e5c61c3cdc16c2d78a6724",
  "translation_date": "2025-09-12T17:46:03+00:00",
  "source_file": "docs/troubleshooting/ai-troubleshooting.md",
  "language_code": "fa"
}
-->
# راهنمای رفع مشکلات هوش مصنوعی برای Azure Developer CLI

**قبلی:** [روش‌های تولید هوش مصنوعی](../ai-foundry/production-ai-practices.md) | **بعدی:** [شروع کار با AZD](../getting-started/README.md)

این راهنمای جامع به مشکلات رایج در هنگام استقرار راه‌حل‌های هوش مصنوعی با AZD پرداخته و راه‌حل‌ها و تکنیک‌های دیباگینگ خاص خدمات هوش مصنوعی Azure را ارائه می‌دهد.

## فهرست مطالب

- [مشکلات سرویس Azure OpenAI](../../../../docs/troubleshooting)
- [مشکلات جستجوی هوش مصنوعی Azure](../../../../docs/troubleshooting)
- [مشکلات استقرار برنامه‌های کانتینری](../../../../docs/troubleshooting)
- [خطاهای احراز هویت و مجوز](../../../../docs/troubleshooting)
- [شکست‌های استقرار مدل](../../../../docs/troubleshooting)
- [مشکلات عملکرد و مقیاس‌پذیری](../../../../docs/troubleshooting)
- [مدیریت هزینه و سهمیه](../../../../docs/troubleshooting)
- [ابزارها و تکنیک‌های دیباگینگ](../../../../docs/troubleshooting)

## مشکلات سرویس Azure OpenAI

### مشکل: سرویس OpenAI در منطقه در دسترس نیست

**علائم:**
```
Error: The requested resource type is not available in the location 'westus'
```

**دلایل:**
- سرویس Azure OpenAI در منطقه انتخابی موجود نیست
- سهمیه در مناطق ترجیحی تمام شده است
- محدودیت‌های ظرفیت منطقه‌ای

**راه‌حل‌ها:**

1. **بررسی دسترسی منطقه:**
```bash
# List available regions for OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **به‌روزرسانی تنظیمات AZD:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **استفاده از مناطق جایگزین:**
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

### مشکل: سهمیه استقرار مدل تمام شده است

**علائم:**
```
Error: Deployment failed due to insufficient quota
```

**راه‌حل‌ها:**

1. **بررسی سهمیه فعلی:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **درخواست افزایش سهمیه:**
```bash
# Submit quota increase request
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **بهینه‌سازی ظرفیت مدل:**
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

### مشکل: نسخه API نامعتبر

**علائم:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**راه‌حل‌ها:**

1. **استفاده از نسخه API پشتیبانی‌شده:**
```python
# Use latest supported version
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **بررسی سازگاری نسخه API:**
```bash
# List supported API versions
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## مشکلات جستجوی هوش مصنوعی Azure

### مشکل: سطح قیمت‌گذاری سرویس جستجو کافی نیست

**علائم:**
```
Error: Semantic search requires Basic tier or higher
```

**راه‌حل‌ها:**

1. **ارتقاء سطح قیمت‌گذاری:**
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

2. **غیرفعال کردن جستجوی معنایی (برای توسعه):**
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

### مشکل: شکست در ایجاد ایندکس

**علائم:**
```
Error: Cannot create index, insufficient permissions
```

**راه‌حل‌ها:**

1. **بررسی کلیدهای سرویس جستجو:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **بررسی طرح ایندکس:**
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

3. **استفاده از هویت مدیریت‌شده:**
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

## مشکلات استقرار برنامه‌های کانتینری

### مشکل: شکست در ساخت کانتینر

**علائم:**
```
Error: Failed to build container image
```

**راه‌حل‌ها:**

1. **بررسی سینتکس Dockerfile:**
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

2. **اعتبارسنجی وابستگی‌ها:**
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

3. **افزودن بررسی سلامت:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### مشکل: شکست در راه‌اندازی برنامه کانتینری

**علائم:**
```
Error: Container failed to start within timeout period
```

**راه‌حل‌ها:**

1. **افزایش زمان انتظار راه‌اندازی:**
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

2. **بهینه‌سازی بارگذاری مدل:**
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

## خطاهای احراز هویت و مجوز

### مشکل: مجوز هویت مدیریت‌شده رد شد

**علائم:**
```
Error: Authentication failed for Azure OpenAI Service
```

**راه‌حل‌ها:**

1. **بررسی تخصیص نقش‌ها:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **تخصیص نقش‌های مورد نیاز:**
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

3. **تست احراز هویت:**
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

### مشکل: دسترسی به Key Vault رد شد

**علائم:**
```
Error: The user, group or application does not have secrets get permission
```

**راه‌حل‌ها:**

1. **اعطای مجوزهای Key Vault:**
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

2. **استفاده از RBAC به جای سیاست‌های دسترسی:**
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

## شکست‌های استقرار مدل

### مشکل: نسخه مدل در دسترس نیست

**علائم:**
```
Error: Model version 'gpt-4-32k' is not available
```

**راه‌حل‌ها:**

1. **بررسی مدل‌های موجود:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **استفاده از مدل‌های جایگزین:**
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

3. **اعتبارسنجی مدل قبل از استقرار:**
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

## مشکلات عملکرد و مقیاس‌پذیری

### مشکل: پاسخ‌های با تأخیر بالا

**علائم:**
- زمان پاسخ > ۳۰ ثانیه
- خطاهای زمان انتظار
- تجربه کاربری ضعیف

**راه‌حل‌ها:**

1. **پیاده‌سازی زمان انتظار درخواست‌ها:**
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

2. **افزودن کش پاسخ‌ها:**
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

3. **پیکربندی مقیاس‌گذاری خودکار:**
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

### مشکل: خطاهای کمبود حافظه

**علائم:**
```
Error: Container killed due to memory limit exceeded
```

**راه‌حل‌ها:**

1. **افزایش تخصیص حافظه:**
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

2. **بهینه‌سازی استفاده از حافظه:**
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

## مدیریت هزینه و سهمیه

### مشکل: هزینه‌های غیرمنتظره بالا

**علائم:**
- صورتحساب Azure بیشتر از حد انتظار
- استفاده از توکن‌ها بیشتر از تخمین‌ها
- هشدارهای بودجه فعال شده

**راه‌حل‌ها:**

1. **پیاده‌سازی کنترل‌های هزینه:**
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

2. **تنظیم هشدارهای هزینه:**
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

3. **بهینه‌سازی انتخاب مدل:**
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

## ابزارها و تکنیک‌های دیباگینگ

### دستورات دیباگینگ AZD

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

### دیباگینگ برنامه

1. **لاگ‌گذاری ساختاریافته:**
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

2. **نقاط پایانی بررسی سلامت:**
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

3. **مانیتورینگ عملکرد:**
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

## کدهای خطای رایج و راه‌حل‌ها

| کد خطا | توضیحات | راه‌حل |
|--------|---------|--------|
| 401 | غیرمجاز | بررسی کلیدهای API و تنظیمات هویت مدیریت‌شده |
| 403 | ممنوع | بررسی تخصیص نقش‌های RBAC |
| 429 | محدودیت نرخ | پیاده‌سازی منطق تلاش مجدد با بک‌آف نمایی |
| 500 | خطای داخلی سرور | بررسی وضعیت استقرار مدل و لاگ‌ها |
| 503 | سرویس در دسترس نیست | بررسی سلامت سرویس و دسترسی منطقه‌ای |

## مراحل بعدی

1. **بررسی [راهنمای استقرار مدل هوش مصنوعی](ai-model-deployment.md)** برای بهترین روش‌های استقرار
2. **تکمیل [روش‌های تولید هوش مصنوعی](production-ai-practices.md)** برای راه‌حل‌های آماده برای سازمان
3. **عضویت در [دیسکورد Azure AI Foundry](https://aka.ms/foundry/discord)** برای پشتیبانی جامعه
4. **ارسال مشکلات** به [مخزن GitHub AZD](https://github.com/Azure/azure-dev) برای مشکلات خاص AZD

## منابع

- [رفع مشکلات سرویس Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [رفع مشکلات برنامه‌های کانتینری](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [رفع مشکلات جستجوی هوش مصنوعی Azure](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**قبلی:** [روش‌های تولید هوش مصنوعی](../ai-foundry/production-ai-practices.md) | **بعدی:** [کارگاه](../../workshop/README.md)
- [رفع مشکلات Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما تلاش می‌کنیم دقت را حفظ کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌ها باشند. سند اصلی به زبان اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس، توصیه می‌شود از ترجمه حرفه‌ای انسانی استفاده کنید. ما مسئولیتی در قبال سوء تفاهم‌ها یا تفسیرهای نادرست ناشی از استفاده از این ترجمه نداریم.