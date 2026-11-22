# راهنمای عیب‌یابی مخصوص هوش مصنوعی

**هدایت فصل:**
- **📚 صفحه اصلی دوره**: [آموزش AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل ۷ - عیب‌یابی و اشکال‌زدایی
- **⬅️ قبلی**: [راهنمای اشکال‌زدایی](debugging.md)
- **➡️ فصل بعدی**: [فصل ۸: الگوهای تولید و سازمانی](../chapter-08-production/production-ai-practices.md)
- **🤖 مرتبط**: [فصل ۲: توسعه هوش مصنوعی محور](../chapter-02-ai-development/microsoft-foundry-integration.md)

این راهنمای جامع عیب‌یابی به مشکلات رایج هنگام پیاده‌سازی راه‌حل‌های هوش مصنوعی با AZD می‌پردازد و راه‌حل‌ها و تکنیک‌های اشکال‌زدایی خاص سرویس‌های هوش مصنوعی Azure را ارائه می‌دهد.

> **دامنه:** دستورات از نام‌های نمونه منابع استفاده می‌کنند؛ آن‌ها را جایگزین کرده و اشتراک مناسب را انتخاب کنید. بلوک‌های Bicep قطعاتی برای ادغام در قالب موجود هستند، نه استقرارهای مستقل. قطعات پایتون نیازمند SDKها و پیکربندی برنامه اعلام‌شده هستند. این بازبینی با استقرار زنده Azure انجام نشده است.

## فهرست مطالب

- [مشکلات سرویس مدل‌های Microsoft Foundry](#microsoft-foundry-models-service-issues)
- [مشکلات جستجوی Azure AI](#azure-ai-search-problems)
- [مشکلات استقرار برنامه‌های کانتینری](#container-apps-deployment-issues)
- [خطاهای احراز هویت و مجوز](#authentication-and-permission-errors)
- [شکست‌های استقرار مدل](#model-deployment-failures)
- [مشکلات عملکرد و مقیاس‌پذیری](#performance-and-scaling-issues)
- [مدیریت هزینه و سهمیه](#cost-and-quota-management)
- [ابزارها و تکنیک‌های اشکال‌زدایی](#debugging-tools-and-techniques)

## مشکلات سرویس مدل‌های Microsoft Foundry

### مشکل: سرویس OpenAI در منطقه قابل دسترس نیست

**نشانه‌ها:**
```
Error: The requested resource type is not available in the location 'westus'
```

**علل:**
- مدل‌های Microsoft Foundry در منطقه انتخاب شده در دسترس نیستند
- سهمیه در مناطق ترجیحی تمام شده است
- محدودیت‌های ظرفیت منطقه‌ای

**راه‌حل‌ها:**

1. **بررسی در دسترس بودن منطقه:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **به‌روزرسانی پیکربندی AZD:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **استفاده از مناطق جایگزین:**
```bicep
// infra/main.bicep - Explicit location selection, NOT automatic fallback
@allowed([
  'eastus2'
  'francecentral'
  'canadaeast'
  'swedencentral'
])
param openAiLocation string = 'eastus2'
```

### مشکل: سهمیه استقرار مدل تمام شده است

**نشانه‌ها:**
```
Error: Deployment failed due to insufficient quota
```

**راه‌حل‌ها:**

1. **بررسی سهمیه فعلی:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **درخواست افزایش سهمیه:**
از روند مدیریت سهمیه پرتال Foundry برای اشتراک، منطقه، مدل و نوع استقرار آسیب‌دیده استفاده کنید. راهنمای رسمی سهمیه را ببینید [راهنمای رسمی سهمیه](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). درخواست سهمیه VM سهمیه مدل را افزایش نمی‌دهد.

3. **بهینه‌سازی ظرفیت مدل:**
```bicep
// Reduce initial capacity
resource deployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi // Existing account resource declared in your template
  name: 'chat-model'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'GlobalStandard' // Verify this model/version/type in the target region
    capacity: 1  // Capacity units are model/deployment-type specific
  }
}
```

### مشکل: نسخه API نامعتبر

**نشانه‌ها:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**راه‌حل‌ها:**

1. **استفاده از نسخه API پشتیبانی‌شده:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **بررسی سازگاری نسخه API:**
مستندات [چرخه عمر API Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle) را بررسی کنید. نسخه‌های API ARM ارائه‌دهنده منابع نسخه‌های API استنتاج/plane داده را **شامل نمی‌شوند**. کلاینت‌های جدید v1 از `/openai/v1/` بدون تاریخ `api-version` استفاده می‌کنند؛ دو پیکربندی کلاینت را ترکیب نکنید.

## مشکلات جستجوی Azure AI

### مشکل: سطح قیمت‌گذاری سرویس جستجو ناکافی است

**نشانه‌ها:**
```
Error: Semantic search requires Basic tier or higher
```

**راه‌حل‌ها:**

1. **استفاده از سطح قیمت‌گذاری پشتیبانی‌شده:**

رنکر معنایی نیاز به سطح Basic یا بالاتر دارد. تغییر از Free/Basic به سطح دیگر ممکن است نیازمند ایجاد سرویس جستجوی جدید و بازسازی ایندکس‌ها باشد؛ ویرایش SKU تضمین ارتقاء درجا نیست.
```bicep
// infra/main.bicep - Use Basic tier
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
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

### مشکل: شکست ایجاد ایندکس

**نشانه‌ها:**
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
    # These are this application's requirements, not universal Search fields.
    required_fields = ['id', 'content']
    field_names = [field.name for field in index_definition.fields]
    
    for required in required_fields:
        if required not in field_names:
            raise ValueError(f"Missing required field: {required}")
```

3. **استفاده از هویت مدیریت‌شده:**
```bicep
// Grant index-definition management permissions to the managed identity.
// Search Index Data Contributor manages documents, not index definitions.
resource searchContributor 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: searchService
  name: guid(searchService.id, containerApp.id, 'Search Service Contributor')
  properties: {
    principalId: containerApp.identity.principalId
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '7ca78c08-252a-4471-8644-bb5ff32d4ba0')
    principalType: 'ServicePrincipal'
  }
}
```

## مشکلات استقرار برنامه‌های کانتینری

### مشکل: شکست‌های ساخت کانتینر

**نشانه‌ها:**
```
Error: Failed to build container image
```

**راه‌حل‌ها:**

1. **بررسی نحو Dockerfile:**
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
# Dependency names for these snippets. Resolve supported versions in your
# project's environment, test together, then commit a lock/pinned requirements file.
fastapi
uvicorn
openai
azure-identity
azure-keyvault-secrets
azure-search-documents
azure-cosmos
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

### مشکل: شکست‌های راه‌اندازی برنامه کانتینری

**نشانه‌ها:**
```
Error: Container failed to start within timeout period
```

**راه‌حل‌ها:**

1. **افزایش زمان تایم‌اوت راه‌اندازی:**
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
              type: 'Startup'
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
# Illustrative skeleton: implement _initialize_client and synchronize concurrent
# initialization before using this pattern in an application.
import asyncio
from contextlib import asynccontextmanager
from fastapi import FastAPI

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

**نشانه‌ها:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**راه‌حل‌ها:**

1. **بررسی تخصیص نقش‌ها:**
```bash
# Check current role assignments
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

3. **آزمایش احراز هویت:**
```python
# Test managed identity authentication
from azure.identity import DefaultAzureCredential
from azure.core.exceptions import ClientAuthenticationError

def test_authentication():
    try:
        with DefaultAzureCredential() as credential:
            token = credential.get_token("https://cognitiveservices.azure.com/.default")
            print(f"Token acquired; expires at Unix time {token.expires_on}")
    except ClientAuthenticationError as e:
        print(f"Authentication failed: {e}")

test_authentication()
```

دریافت توکن اثبات احراز هویت است، نه مجوز فراخوانی مدل. عملیات مورد نظر را جداگانه تست کنید. به صورت محلی، `DefaultAzureCredential` ممکن است از اعتبارنامه‌های توسعه‌دهنده استفاده کند؛ در Azure، بررسی کنید هویت مدیریت‌شده مورد نظر انتخاب شده باشد.

### مشکل: دسترسی به گنجینه کلید رد شد

**نشانه‌ها:**
```
Error: The user, group or application does not have secrets get permission
```

**راه‌حل‌ها:**

1. **اعطای مجوزهای گنجینه کلید:**

فقط برای گنجینه‌ای با `enableRbacAuthorization: false` از قطعه سیاست دسترسی زیر استفاده کنید. برای گنجینه‌ای با RBAC، گزینه 2 را استفاده کنید؛ افزودن سیاست دسترسی در حالت RBAC دسترسی لایه داده را نمی‌دهد.
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

گنجینه باید `enableRbacAuthorization: true` داشته باشد؛ تغییر مدل‌های مجوز نیازمند برنامه‌ریزی مهاجرت مجوزهای موجود است.
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

**نشانه‌ها:**
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
  --query "[].{name:name, version:version}" \
  --output table
```

2. **انتخاب صریح مدل موجود:**
```bicep
// Example model selection; verify version and deployment type in the catalog.
@description('Primary model configuration')
param primaryModel object = {
  name: 'gpt-4.1-mini'
  version: '2025-04-14'
}

// Bicep does not catch provisioning failures and retry a fallback model.
resource primaryDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'chat-model'
  properties: {
    model: {
      format: 'OpenAI'
      name: primaryModel.name
      version: primaryModel.version
    }
  }
  sku: {
    name: 'GlobalStandard'
    capacity: 10
  }
}
```

3. **اعتبارسنجی مدل پیش از استقرار:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## مشکلات عملکرد و مقیاس‌پذیری

### مشکل: تأخیر بالا در پاسخ‌ها

**نشانه‌ها:**
- زمان پاسخ > ۳۰ ثانیه
- خطاهای تایم‌اوت
- تجربه کاربری ضعیف

**راه‌حل‌ها:**

1. **اجرای تایم‌اوت درخواست:**
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

2. **افزودن کش پاسخ:**
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

3. **پیکربندی مقیاس‌بندی خودکار:**
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
# Memory-efficient model handling
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def _process_ai_request(self, request):
        raise NotImplementedError("Supply the application's AI operation")

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

### مشکل: هزینه‌های غیرمنتظره زیاد

**نشانه‌ها:**
- صورتحساب Azure بالاتر از حد انتظار
- استفاده از توکن‌ها بیش از برآوردها
- هشدارهای بودجه فعال شده

**راه‌حل‌ها:**

1. **اجرای کنترل‌های هزینه:**
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

این شمارنده درون حافظه‌ای توصیفی است و کنترل ماهانه هزینه نیست: با راه‌اندازی مجدد ریست می‌شود، میان نمونه‌ها به اشتراک گذاشته نیست و فقط پس از فراخوانی استفاده را بررسی می‌کند. محدودیت واقعی به حسابداری پایدار، رزروهای امن همزمان قبل از درخواست‌ها و سیاست ریست ماهانه نیاز دارد. معیارهای حافظه کانتینر باید محدودیت‌های cgroup را لحاظ کنند؛ `psutil.virtual_memory()` اندازه‌گیری قابل اعتمادی برای محدودیت کانتینر نیست و جمع‌آوری زباله محدودیت حافظه اعمال نمی‌کند.

2. **راه‌اندازی هشدارهای هزینه:**
```bicep
resource budgetAlert 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-workload-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate // Parameter: first day of a supported budget period
      endDate: budgetEndDate     // Parameter: a future date
    }
    timeGrain: 'Monthly'
    amount: 500  // Notification threshold in the subscription's billing currency
    category: 'Cost'
    notifications: {
      Actual_GreaterThan_80_Percent: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        thresholdType: 'Actual'
        contactEmails: ['admin@company.com']
        contactRoles: ['Owner']
      }
    }
  }
}
```

در قالب خود `budgetStartDate` و `budgetEndDate` را اعلام کنید. بودجه‌ها اطلاع‌رسانی می‌کنند، منابع را متوقف نمی‌کنند و محدودیت سخت هزینه اعمال نمی‌کنند.

3. **بهینه‌سازی انتخاب مدل:**
```python
# Cost-aware model selection
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

## ابزارها و تکنیک‌های اشکال‌زدایی

### دستورات اشکال‌زدایی AZD

```bash
# Enable verbose logging
azd up --debug

# Check deployment status
azd show

# View application logs (opens monitoring dashboard)
azd monitor --logs

# View live metrics
azd monitor --live

# Check environment variables
azd env get-values
```

### دستورات افزونه AZD AI برای تشخیص خطا

اگر با استفاده از `azd ai agent init` عوامل را مستقر کرده‌اید، این ابزارهای اضافی در دسترس‌اند:

```bash
# Install the GA Foundry bundle (requires azd >= 1.37.0)
azd ext install microsoft.foundry

# Check project storage permissions and agent configuration
azd ai agent doctor

# Inspect the deployed endpoint
azd ai agent endpoint show

# Stream hosted-agent logs
azd ai agent monitor --follow

# Use the MCP server to let AI tools query project state
azd mcp start

# Generate infrastructure files for review and audit
azd infra generate
```

> **نکته:** از `azd infra generate` برای نوشتن کد زیرساخت به صورت IaC روی دیسک استفاده کنید تا دقیقاً بررسی کنید کدام منابع پیاده‌سازی شده‌اند. این هنگام اشکال‌زدایی پیکربندی منابع بسیار ارزشمند است. برای جزئیات کامل به [مرجع AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) مراجعه کنید.

**تشخیص خطای روند GA (۲۰۲۶-۱۱-۰۹):** مطمئن شوید `azd version` حداقل نسخه 1.37.0 است و `azd ext list --installed` را بررسی کنید. ابتدا CLI اصلی را با `azd update` یا نصب‌کننده آن به‌روزرسانی کنید و سپس بسته را با `azd ext upgrade microsoft.foundry` به‌روزرسانی نمایید. برای خطاهای محلی، uv کنونی، پایتون 3.13+ نمونه پایه، `PYTHONNOUSERSITE: "1"` در پیکربندی سرویس آن و اعتبارنامه‌های Azure استفاده شده توسط `DefaultAzureCredential` را بررسی کنید. `azd ai agent run` را در حال اجرا نگه دارید و `--local` را از ترمینال دوم در دایرکتوری پروژه اجرا کنید.

پیروزی در فراهم‌آوری به معنی دسترسی به لایه داده نیست. هشدارهای RBAC و [ماتریس مجوز host-agent](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions) را مرور کنید. تایم‌اوت به معنای شکست استقرار نیست: نسخه و لاگ‌های تلاش شده را بررسی کنید و سپس دوباره تلاش کنید. عوامل نسخه بتا ۲۳ این هشدارها و خروجی A2A را بهبود داده‌اند؛ این اصلاحات تاریخی در [یادداشت‌های انتشار](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes) توضیح داده شده‌اند و نصب آن نسخه لازم نیست.

اگر `azd ai eval` در دسترس نیست، جداگانه `azure.ai.evaluations` را نصب کنید؛ بسته GA آن را شامل نمی‌شود. اگر دستور agent-evaluation در آموزش قدیمی فقط راهنمای مهاجرت چاپ می‌کند، از روند جداگانه `azd ai eval` استفاده کنید. `--config` بهینه‌سازی دیگر فایل‌های ارزیابی قدیمی را قبول نمی‌کند. جزئیات در [مهاجرت ارزیابی](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) و [مهاجرت بهینه‌سازی](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration) آورده شده است.

### اشکال‌زدایی برنامه

1. **ثبت ساختاریافته:**
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
# Integration fragment: add to an existing FastAPI app, protect this diagnostic
# endpoint, and configure AZURE_SEARCH_ENDPOINT. This tests Search index-list
# authorization, not Azure OpenAI inference.
import os
from azure.identity.aio import DefaultAzureCredential
from azure.search.documents.indexes.aio import SearchIndexClient
from fastapi import Response

@app.get("/debug/health")
async def detailed_health_check(response: Response):
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Check Search service
    try:
        async with DefaultAzureCredential() as credential:
            async with SearchIndexClient(
                endpoint=os.environ['AZURE_SEARCH_ENDPOINT'],
                credential=credential
            ) as search_client:
                # AsyncItemPaged is iterated asynchronously, not awaited as a list.
                async for _ in search_client.list_index_names():
                    break
        checks['search'] = {'status': 'healthy'}
    except Exception:
        response.status_code = 503
        checks['search'] = {'status': 'unhealthy'}
    
    return checks
```

3. **نظارت بر عملکرد:**
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

| کد خطا | توضیح | راه‌حل |
|------------|-------------|----------|
| 401 | غیرمجاز | کلیدهای API و پیکربندی هویت مدیریت‌شده را بررسی کنید |
| 403 | ممنوع | تخصیص نقش‌های RBAC را بررسی کنید |
| 429 | محدودیت نرخ | منطق تلاش مجدد با بک‌آف نمایی پیاده کنید |
| 500 | خطای داخلی سرور | وضعیت استقرار مدل و لاگ‌ها را بررسی کنید |
| 503 | سرویس در دسترس نیست | سلامت سرویس و در دسترس بودن منطقه را تأیید کنید |

## گام‌های بعدی

1. **مرور [راهنمای استقرار مدل هوش مصنوعی](../chapter-02-ai-development/ai-model-deployment.md)** برای بهترین روش‌های استقرار
2. **تکمیل [عملیات تولید هوش مصنوعی](../chapter-08-production/production-ai-practices.md)** برای راه‌حل‌های آماده سازمانی
3. **عضویت در [دیسکورد Microsoft Foundry](https://aka.ms/foundry/discord)** برای پشتیبانی جامعه
4. **ثبت مشکلات** به مخزن [AZD GitHub](https://github.com/Azure/azure-dev) برای مشکلات مخصوص AZD

## منابع

- [عیب‌یابی سهمیه و محدودیت Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [عیب‌یابی برنامه‌های کانتینری](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [عیب‌یابی جستجوی Azure AI](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**مهارت عامل تشخیص Azure**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - مهارت‌های عیب‌یابی Azure را در ویرایشگر خود نصب کنید: `npx skills add microsoft/github-copilot-for-azure`

---

**هدایت فصل:**
- **📚 صفحه اصلی دوره**: [آموزش AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل ۷ - عیب‌یابی و اشکال‌زدایی
- **⬅️ قبلی**: [راهنمای اشکال‌زدایی](debugging.md)
- **➡️ فصل بعدی**: [فصل ۸: الگوهای تولید و سازمانی](../chapter-08-production/production-ai-practices.md)
- **🤖 مرتبط**: [فصل ۲: توسعه هوش مصنوعی محور](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 مرجع**: [عیب‌یابی CLI توسعه‌دهنده Azure](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->