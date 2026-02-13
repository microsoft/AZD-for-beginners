# دليل استكشاف أخطاء الذكاء الاصطناعي وإصلاحها

**تصفح الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD For Beginners](../../README.md)
- **📖 الفصل الحالي**: الفصل 7 - استكشاف الأخطاء وإصلاحها والتصحيح
- **⬅️ السابق**: [دليل التصحيح](debugging.md)
- **➡️ الفصل التالي**: [الفصل 8: أنماط الإنتاج والمؤسسات](../chapter-08-production/production-ai-practices.md)
- **🤖 متعلق**: [الفصل 2: التطوير مع التركيز على الذكاء الاصطناعي](../chapter-02-ai-development/microsoft-foundry-integration.md)

**السابق:** [ممارسات الذكاء الاصطناعي في الإنتاج](../chapter-08-production/production-ai-practices.md) | **التالي:** [أساسيات AZD](../chapter-01-foundation/azd-basics.md)

يتناول دليل استكشاف الأخطاء هذا المشكلات الشائعة عند نشر حلول الذكاء الاصطناعي باستخدام AZD، ويوفر حلولًا وتقنيات تصحيح مخصصة لخدمات Azure AI.

## جدول المحتويات

- [مشاكل خدمة Azure OpenAI](../../../../docs/chapter-07-troubleshooting)
- [مشاكل Azure AI Search](../../../../docs/chapter-07-troubleshooting)
- [مشاكل نشر تطبيقات الحاويات](../../../../docs/chapter-07-troubleshooting)
- [أخطاء المصادقة والأذونات](../../../../docs/chapter-07-troubleshooting)
- [فشل نشر النماذج](../../../../docs/chapter-07-troubleshooting)
- [مشاكل الأداء والتوسع](../../../../docs/chapter-07-troubleshooting)
- [إدارة التكلفة والحصص](../../../../docs/chapter-07-troubleshooting)
- [أدوات وتقنيات التصحيح](../../../../docs/chapter-07-troubleshooting)

## مشاكل خدمة Azure OpenAI

### المشكلة: خدمة OpenAI غير متاحة في المنطقة

**الأعراض:**
```
Error: The requested resource type is not available in the location 'westus'
```

**الأسباب:**
- خدمة Azure OpenAI غير متاحة في المنطقة المحددة
- تم استنفاد الحصة في المناطق المفضلة
- قيود سعة إقليمية

**الحلول:**

1. **تحقق من توفر المنطقة:**
```bash
# قائمة المناطق المتاحة لـ OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **حدّث تكوين AZD:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **استخدم مناطق بديلة:**
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

### المشكلة: تجاوزت حصة نشر النموذج

**الأعراض:**
```
Error: Deployment failed due to insufficient quota
```

**الحلول:**

1. **تحقق من الحصة الحالية:**
```bash
# تحقق من استخدام الحصة
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **اطلب زيادة الحصة:**
```bash
# إرسال طلب زيادة الحصة
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **حسّن سعة النموذج:**
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

### المشكلة: إصدار API غير صالح

**الأعراض:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**الحلول:**

1. **استخدم إصدار API مدعوم:**
```python
# استخدم أحدث إصدار مدعوم
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **تحقق من توافق إصدار API:**
```bash
# سرد إصدارات واجهة برمجة التطبيقات المدعومة
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## مشاكل Azure AI Search

### المشكلة: مستوى تسعير خدمة البحث غير كافٍ

**الأعراض:**
```
Error: Semantic search requires Basic tier or higher
```

**الحلول:**

1. **قم بترقية مستوى التسعير:**
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

2. **قم بإيقاف البحث الدلالي (للتطوير):**
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

### المشكلة: فشل إنشاء الفهرس

**الأعراض:**
```
Error: Cannot create index, insufficient permissions
```

**الحلول:**

1. **تحقق من مفاتيح خدمة البحث:**
```bash
# احصل على مفتاح المسؤول لخدمة البحث
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **تحقق من مخطط الفهرس:**
```python
# تحقق من مخطط الفهرس
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

3. **استخدم الهوية المُدارة:**
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

## مشاكل نشر تطبيقات الحاويات

### المشكلة: فشل بناء الحاوية

**الأعراض:**
```
Error: Failed to build container image
```

**الحلول:**

1. **تحقق من بناء جملة Dockerfile:**
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

2. **تحقق من التبعيات:**
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

3. **أضف فحص حالة صحية:**
```python
# main.py - إضافة نقطة نهاية لفحص الصحة
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### المشكلة: فشل بدء تشغيل تطبيق الحاوية

**الأعراض:**
```
Error: Container failed to start within timeout period
```

**الحلول:**

1. **زد مهلة بدء التشغيل:**
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

2. **حسّن تحميل النموذج:**
```python
# تحميل النماذج عند الطلب لتقليل وقت بدء التشغيل
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
        # تهيئة عميل الذكاء الاصطناعي هنا
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # بدء التشغيل
    app.state.model_manager = ModelManager()
    yield
    # إيقاف التشغيل
    pass

app = FastAPI(lifespan=lifespan)
```

## أخطاء المصادقة والأذونات

### المشكلة: رفض إذن الهوية المُدارة

**الأعراض:**
```
Error: Authentication failed for Azure OpenAI Service
```

**الحلول:**

1. **تحقق من تعيينات الأدوار:**
```bash
# تحقق من تعيينات الأدوار الحالية
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **قم بتعيين الأدوار المطلوبة:**
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

3. **اختبر المصادقة:**
```python
# اختبار مصادقة الهوية المُدارة
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

### المشكلة: رفض الوصول إلى Key Vault

**الأعراض:**
```
Error: The user, group or application does not have secrets get permission
```

**الحلول:**

1. **امنح أذونات Key Vault:**
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

2. **استخدم RBAC بدلاً من سياسات الوصول:**
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

## فشل نشر النماذج

### المشكلة: إصدار النموذج غير متاح

**الأعراض:**
```
Error: Model version 'gpt-4-32k' is not available
```

**الحلول:**

1. **تحقق من النماذج المتاحة:**
```bash
# سرد النماذج المتاحة
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **استخدم حلولًا احتياطية للنماذج:**
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

3. **تحقق من النموذج قبل النشر:**
```python
# التحقق من النموذج قبل النشر
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

## مشاكل الأداء والتوسع

### المشكلة: استجابات ببطء عالي

**الأعراض:**
- أوقات الاستجابة > 30 ثانية
- أخطاء نفاد المهلة
- تجربة مستخدم سيئة

**الحلول:**

1. **نفّذ مهلات للطلبات:**
```python
# اضبط مهلات مناسبة
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

2. **أضف تخزينًا مؤقتًا للاستجابات:**
```python
# ذاكرة تخزين مؤقتة (Redis) للاستجابات
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

3. **هيئ التوسع التلقائي:**
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

### المشكلة: أخطاء نفاد الذاكرة

**الأعراض:**
```
Error: Container killed due to memory limit exceeded
```

**الحلول:**

1. **زد تخصيص الذاكرة:**
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

2. **حسّن استخدام الذاكرة:**
```python
# التعامل مع النموذج بكفاءة في استخدام الذاكرة
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # تحقق من استخدام الذاكرة قبل المعالجة
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # فرض جمع القمامة
            
        result = await self._process_ai_request(request)
        
        # تنظيف بعد المعالجة
        gc.collect()
        return result
```

## إدارة التكلفة والحصص

### المشكلة: تكاليف مرتفعة غير متوقعة

**الأعراض:**
- فاتورة Azure أعلى من المتوقع
- استخدام الرموز يتجاوز التقديرات
- تم تفعيل تنبيهات الميزانية

**الحلول:**

1. **نفّذ ضوابط التكلفة:**
```python
# تتبع استخدام الرموز
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

2. **أعد إعداد تنبيهات التكلفة:**
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

3. **حسّن اختيار النموذج:**
```python
# اختيار النموذج مع مراعاة التكلفة
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # لكل 1000 رمز
    'gpt-4': 0.03,          # لكل 1000 رمز
    'gpt-35-turbo': 0.0015  # لكل 1000 رمز
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

## أدوات وتقنيات التصحيح

### أوامر تصحيح AZD

```bash
# تمكين السجلات المفصلة
azd up --debug

# التحقق من حالة النشر
azd show

# عرض سجلات التطبيق (يفتح لوحة المراقبة)
azd monitor --logs

# عرض المقاييس الحية
azd monitor --live

# التحقق من متغيرات البيئة
azd env get-values
```

### تصحيح التطبيق

1. **التسجيل المنظم:**
```python
import logging
import json

# قم بتكوين السجلات المهيكلة لتطبيقات الذكاء الاصطناعي
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

2. **نقاط نهاية لفحص الصحة:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # تحقق من اتصال OpenAI
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # تحقق من خدمة البحث
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

3. **مراقبة الأداء:**
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

## أكواد الأخطاء الشائعة والحلول

| Error Code | Description | Solution |
|------------|-------------|----------|
| 401 | غير مصرح | تحقق من مفاتيح API وتكوين الهوية المُدارة |
| 403 | ممنوع | تحقق من تعيينات أدوار RBAC |
| 429 | تم تحديد المعدل | نفّذ منطق إعادة المحاولة مع تراجع أسّي |
| 500 | خطأ في الخادم الداخلي | تحقق من حالة نشر النموذج والسجلات |
| 503 | الخدمة غير متاحة | تحقق من صحة الخدمة وتوفرها إقليمياً |

## الخطوات التالية

1. **راجع [دليل نشر نماذج الذكاء الاصطناعي](../chapter-02-ai-development/ai-model-deployment.md)** لأفضل ممارسات النشر
2. **أكمل [ممارسات الذكاء الاصطناعي في الإنتاج](../chapter-08-production/production-ai-practices.md)** لحلول جاهزة للمؤسسات
3. **انضم إلى [Discord الخاص بـ Microsoft Foundry](https://aka.ms/foundry/discord)** للحصول على دعم المجتمع
4. **أرسل مشكلات** إلى [مستودع AZD على GitHub](https://github.com/Azure/azure-dev) لمشكلات متعلقة بـ AZD

## الموارد

- [استكشاف أخطاء خدمة Azure OpenAI وإصلاحها](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [استكشاف أخطاء تطبيقات الحاويات وإصلاحها](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [استكشاف أخطاء Azure AI Search وإصلاحها](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**تصفح الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD For Beginners](../../README.md)
- **📖 الفصل الحالي**: الفصل 7 - استكشاف الأخطاء وإصلاحها والتصحيح
- **⬅️ السابق**: [دليل التصحيح](debugging.md)
- **➡️ الفصل التالي**: [الفصل 8: أنماط الإنتاج والمؤسسات](../chapter-08-production/production-ai-practices.md)
- **🤖 متعلق**: [الفصل 2: التطوير مع التركيز على الذكاء الاصطناعي](../chapter-02-ai-development/microsoft-foundry-integration.md)
- [استكشاف أخطاء Azure Developer CLI وإصلاحها](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
إخلاء المسؤولية:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة الآلية [Co-op Translator](https://github.com/Azure/co-op-translator). ورغم أننا نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو معلومات غير دقيقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر المعتمد. بالنسبة للمعلومات الحساسة أو الحرجة، يُنصح بالاستعانة بترجمة بشرية احترافية. لا نتحمل أي مسؤولية عن أي سوء فهم أو تفسير خاطئ ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->