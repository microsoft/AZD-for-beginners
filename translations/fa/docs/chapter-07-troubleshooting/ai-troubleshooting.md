# راهنمای عیب‌یابی ویژه هوش مصنوعی

**ناوبری فصل:**
- **📚 صفحه دوره**: [AZD For Beginners](../../README.md)
- **📖 فصل جاری**: فصل 7 - عیب‌یابی و رفع اشکال
- **⬅️ قبلی**: [Debugging Guide](debugging.md)
- **➡️ فصل بعد**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 مرتبط**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

این راهنمای جامع عیب‌یابی به مسائل رایج هنگام استقرار راه‌حل‌های هوش مصنوعی با AZD می‌پردازد و راه‌حل‌ها و تکنیک‌های رفع اشکال خاص سرویس‌های Azure AI را ارائه می‌دهد.

## فهرست مطالب

- [مشکلات سرویس مدل‌های Microsoft Foundry](#azure-openai-service-issues)
- [مشکلات Azure AI Search](#azure-ai-search-problems)
- [مشکلات استقرار Container Apps](#container-apps-deployment-issues)
- [خطاهای احراز هویت و دسترسی](#authentication-and-permission-errors)
- [شکست‌های استقرار مدل](#model-deployment-failures)
- [مشکلات عملکرد و مقیاس‌پذیری](#performance-and-scaling-issues)
- [مدیریت هزینه و سهمیه](#cost-and-quota-management)
- [ابزارها و تکنیک‌های اشکال‌زدایی](#debugging-tools-and-techniques)

## Microsoft Foundry Models Service Issues

### Issue: OpenAI Service Unavailable in Region

**نشانه‌ها:**
```
Error: The requested resource type is not available in the location 'westus'
```

**علت‌ها:**
- مدل‌های Microsoft Foundry در منطقه انتخاب‌شده در دسترس نیستند
- سهمیه در مناطق مورد نظر تمام شده است
- محدودیت‌های ظرفیت منطقه‌ای

**راه‌حل‌ها:**

1. **بررسی در دسترس‌بودن منطقه:**
```bash
# فهرست مناطق در دسترس برای OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **به‌روزرسانی پیکربندی AZD:**
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

### Issue: Model Deployment Quota Exceeded

**نشانه‌ها:**
```
Error: Deployment failed due to insufficient quota
```

**راه‌حل‌ها:**

1. **بررسی سهمیه کنونی:**
```bash
# میزان استفاده از سهمیه را بررسی کنید
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **درخواست افزایش سهمیه:**
```bash
# ارسال درخواست افزایش سهمیه
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

**نشانه‌ها:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**راه‌حل‌ها:**

1. **استفاده از نسخه API پشتیبانی‌شده:**
```python
# از آخرین نسخهٔ پشتیبانی‌شده استفاده کنید
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **بررسی سازگاری نسخه API:**
```bash
# نسخه‌های API پشتیبانی‌شده را فهرست کنید
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search Problems

### Issue: Search Service Pricing Tier Insufficient

**نشانه‌ها:**
```
Error: Semantic search requires Basic tier or higher
```

**راه‌حل‌ها:**

1. **ارتقای لایه قیمتی:**
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

2. **غیرفعال‌سازی جستجوی معنایی (توسعه):**
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

**نشانه‌ها:**
```
Error: Cannot create index, insufficient permissions
```

**راه‌حل‌ها:**

1. **تأیید کلیدهای سرویس جستجو:**
```bash
# کلید ادمین سرویس جستجو را دریافت کنید
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **بررسی اسکیمای ایندکس:**
```python
# اعتبارسنجی طرح‌وارهٔ ایندکس
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

3. **استفاده از Managed Identity:**
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

**نشانه‌ها:**
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
# main.py - افزودن نقطهٔ بررسی سلامت
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Issue: Container App Startup Failures

**نشانه‌ها:**
```
Error: Container failed to start within timeout period
```

**راه‌حل‌ها:**

1. **افزایش تایم‌اوت راه‌اندازی:**
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
# مدل‌ها را به‌صورت تنبل بارگذاری کنید تا زمان راه‌اندازی کاهش یابد
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
        # در اینجا کلاینت هوش مصنوعی را مقداردهی اولیه کنید
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # راه‌اندازی
    app.state.model_manager = ModelManager()
    yield
    # خاموش‌سازی
    pass

app = FastAPI(lifespan=lifespan)
```

## Authentication and Permission Errors

### Issue: Managed Identity Permission Denied

**نشانه‌ها:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**راه‌حل‌ها:**

1. **تأیید انتساب‌های نقش:**
```bash
# تخصیص‌های نقش فعلی را بررسی کنید
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **اختصاص نقش‌های مورد نیاز:**
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

3. **آزمون احراز هویت:**
```python
# تست احراز هویت با شناسه مدیریت‌شده
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

**نشانه‌ها:**
```
Error: The user, group or application does not have secrets get permission
```

**راه‌حل‌ها:**

1. **دادن مجوزهای Key Vault:**
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

2. **استفاده از RBAC به‌جای سیاست‌های دسترسی:**
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

**نشانه‌ها:**
```
Error: Model version 'gpt-4-32k' is not available
```

**راه‌حل‌ها:**

1. **بررسی مدل‌های در دسترس:**
```bash
# فهرست مدل‌های موجود
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **استفاده از مدل‌های پشتیبان (Fallbacks):**
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

3. **اعتبارسنجی مدل قبل از استقرار:**
```python
# اعتبارسنجی مدل پیش از استقرار
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

**نشانه‌ها:**
- زمان پاسخ > 30 ثانیه
- خطاهای تایم‌اوت
- تجربه کاربری ضعیف

**راه‌حل‌ها:**

1. **پیاده‌سازی تایم‌اوت برای درخواست‌ها:**
```python
# پیکربندی تایم‌اوت‌های مناسب
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
# کش Redis برای پاسخ‌ها
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

3. **پیکربندی مقیاس خودکار:**
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

**نشانه‌ها:**
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
# مدیریت مدل با صرفه‌جویی در حافظه
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # قبل از پردازش میزان استفاده از حافظه را بررسی کنید
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # اجرای اجباری جمع‌آوری زباله
            
        result = await self._process_ai_request(request)
        
        # پاک‌سازی پس از پردازش
        gc.collect()
        return result
```

## Cost and Quota Management

### Issue: Unexpected High Costs

**نشانه‌ها:**
- صورتحساب Azure بالاتر از حد انتظار
- مصرف توکن بیشتر از برآوردها
- هشدارهای بودجه فعال شده

**راه‌حل‌ها:**

1. **اجرای کنترل‌های هزینه:**
```python
# پیگیری مصرف توکن
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

2. **راه‌اندازی هشدارهای هزینه:**
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
# انتخاب مدل با توجه به هزینه
MODEL_COSTS = {
    'gpt-4.1-mini': 0.00015,  # به‌ازای هر ۱۰۰۰ توکن
    'gpt-4.1': 0.03,          # به‌ازای هر ۱۰۰۰ توکن
    'gpt-35-turbo': 0.0015  # به‌ازای هر ۱۰۰۰ توکن
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
# گزارش‌گیری مفصل را فعال کنید
azd up --debug

# وضعیت استقرار را بررسی کنید
azd show

# مشاهده لاگ‌های برنامه (داشبورد مانیتورینگ را باز می‌کند)
azd monitor --logs

# مشاهده معیارهای زنده
azd monitor --live

# متغیرهای محیطی را بررسی کنید
azd env get-values
```

### AZD AI Extension Commands for Diagnostics

اگر عامل‌ها را با استفاده از `azd ai agent init` مستقر کردید، این ابزارهای اضافی در دسترس هستند:

```bash
# اطمینان حاصل کنید که افزونهٔ عامل‌ها نصب شده است
azd extension install azure.ai.agents

# عامل را از مانیفست مجدداً مقداردهی اولیه یا به‌روزرسانی کنید
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# از سرور MCP استفاده کنید تا ابزارهای هوش مصنوعی بتوانند وضعیت پروژه را پرس‌وجو کنند
azd mcp start

# فایل‌های زیرساخت را برای بازبینی و حسابرسی تولید کنید
azd infra generate
```

> **نکته:** از `azd infra generate` استفاده کنید تا IaC را روی دیسک بنویسید تا بتوانید دقیقاً بررسی کنید چه منابعی فراهم شده‌اند. این مورد هنگام رفع اشکالات پیکربندی منابع بسیار ارزشمند است. برای جزئیات کامل به [مرجع AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) مراجعه کنید.

### اشکال‌زدایی برنامه

1. **لاگ‌نویسی ساخت‌یافته:**
```python
import logging
import json

# پیکربندی لاگ‌نویسی ساخت‌یافته برای برنامه‌های هوش مصنوعی
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

2. **نقاط انتهایی بررسی سلامت:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # بررسی اتصال به OpenAI
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # بررسی سرویس جستجو
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

3. **پایش عملکرد:**
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

| Error Code | Description | Solution |
|------------|-------------|----------|
| 401 | احراز هویت نشده | کلیدهای API و پیکربندی Managed Identity را بررسی کنید |
| 403 | ممنوع | انتساب‌های نقش RBAC را بررسی کنید |
| 429 | محدودیت نرخ | منطق تکرار با تاخیر تصاعدی را پیاده‌سازی کنید |
| 500 | خطای داخلی سرور | وضعیت استقرار مدل و لاگ‌ها را بررسی کنید |
| 503 | سرویس در دسترس نیست | سلامت سرویس و دسترسی منطقه‌ای را بررسی کنید |

## مراحل بعدی

1. **مرور [AI Model Deployment Guide](../chapter-02-ai-development/ai-model-deployment.md)** برای بهترین شیوه‌های استقرار
2. **تکمیل [Production AI Practices](../chapter-08-production/production-ai-practices.md)** برای راه‌حل‌های آماده سازمانی
3. **پیوستن به [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** برای پشتیبانی جامعه
4. **ارسال اشکالات** به [مخزن GitHub AZD](https://github.com/Azure/azure-dev) برای مسائل مربوط به AZD

## منابع

- [Microsoft Foundry Models Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - نصب مهارت‌های عیب‌یابی Azure در ویرایشگر شما: `npx skills add microsoft/github-copilot-for-azure`

---

**ناوبری فصل:**
- **📚 صفحه دوره**: [AZD For Beginners](../../README.md)
- **📖 فصل جاری**: فصل 7 - عیب‌یابی و رفع اشکال
- **⬅️ قبلی**: [Debugging Guide](debugging.md)
- **➡️ فصل بعد**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 مرتبط**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 مرجع**: [Azure Developer CLI Troubleshooting](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه‌ی هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما برای دقت تلاش می‌کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطاها یا نادرستی‌هایی باشند. نسخهٔ اصلی سند به زبان مادری آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمهٔ حرفه‌ای انسانی توصیه می‌شود. ما در برابر هرگونه سوءتفاهم یا تفسیر نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->