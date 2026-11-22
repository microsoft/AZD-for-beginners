# دليل استكشاف الأخطاء وإصلاحها الخاص بالذكاء الاصطناعي

**تنقل الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 7 - استكشاف الأخطاء وإصلاحها وتصحيحها
- **⬅️ السابق**: [دليل التصحيح](debugging.md)
- **➡️ الفصل التالي**: [الفصل 8: أنماط الإنتاج والمؤسسات](../chapter-08-production/production-ai-practices.md)
- **🤖 ذات صلة**: [الفصل 2: تطوير الذكاء الاصطناعي أولاً](../chapter-02-ai-development/microsoft-foundry-integration.md)

يغطي هذا الدليل الشامل لاستكشاف الأخطاء وإصلاحها المشكلات الشائعة عند نشر حلول الذكاء الاصطناعي باستخدام AZD، موفرًا حلولًا وتقنيات تصحيح خاصة بخدمات Azure AI.

> **النطاق:** تستخدم الأوامر أسماء موارد نموذجية؛ استبدلها واختر الاشتراك الصحيح. كتل Bicep هي شظايا لدمجها في قالب موجود، وليست نشرات مستقلة. مقاطع Python تتطلب SDKs المذكورة وتكوين التطبيق. لم يتم تنفيذ نشر Azure مباشر لهذه المراجعة.

## جدول المحتويات

- [مشكلات خدمة نماذج Microsoft Foundry](#microsoft-foundry-models-service-issues)
- [مشكلات Azure AI Search](#azure-ai-search-problems)
- [مشكلات نشر تطبيقات الحاويات](#container-apps-deployment-issues)
- [أخطاء المصادقة والأذونات](#authentication-and-permission-errors)
- [فشل نشر النموذج](#model-deployment-failures)
- [مشكلات الأداء والتوسع](#performance-and-scaling-issues)
- [إدارة التكلفة والحصص](#cost-and-quota-management)
- [أدوات وتقنيات التصحيح](#debugging-tools-and-techniques)

## مشكلات خدمة نماذج Microsoft Foundry

### المشكلة: خدمة OpenAI غير متاحة في المنطقة

**الأعراض:**
```
Error: The requested resource type is not available in the location 'westus'
```

**الأسباب:**
- نماذج Microsoft Foundry غير متوفرة في المنطقة المختارة
- نفاد الحصة في المناطق المفضلة
- قيود في سعة المنطقة

**الحلول:**

1. **تحقق من توفر المنطقة:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **قم بتحديث تكوين AZD:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **استخدم مناطق بديلة:**
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

### المشكلة: تجاوز حصة نشر النموذج

**الأعراض:**
```
Error: Deployment failed due to insufficient quota
```

**الحلول:**

1. **تحقق من الحصة الحالية:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **اطلب زيادة الحصة:**
استخدم سير عمل إدارة الحصص في بوابة Foundry للاشتراك والمنطقة والنموذج ونوع النشر المتأثر. راجع [الإرشادات الرسمية للحصة](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). طلب زيادة حصة VM لا يزيد حصة النموذج.

3. **حسن سعة النموذج:**
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

### المشكلة: إصدار API غير صالح

**الأعراض:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**الحلول:**

1. **استخدم إصدار API مدعوم:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **تحقق من توافق إصدار API:**
تحقق من [مرجع دورة حياة API لـ Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). إصدارات API لمزود موارد ARM **لا** تسرد إصدارات API لطائرة الاستدلال/البيانات. يستخدم عملاء v1 الجدد `/openai/v1/` بدون `api-version` بتاريخ؛ لا تخلط بين تكوينات العميلين.

## مشاكل البحث في Azure AI

### المشكلة: مستوى تسعير خدمة البحث غير كافٍ

**الأعراض:**
```
Error: Semantic search requires Basic tier or higher
```

**الحلول:**

1. **استخدم مستوى تسعير مدعوم:**

يتطلب المصنف الدلالي مستوى Basic أو أعلى. قد يتطلب الانتقال من Free/Basic إلى مستوى آخر إنشاء خدمة بحث جديدة وإعادة بناء الفهارس؛ تعديل SKU ليس ترقية مضمونة في المكان.
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

2. **تعطيل البحث الدلالي (للتطوير):**
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
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **تحقق من مخطط الفهرس:**
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

3. **استخدم الهوية المدارة:**
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

## مشاكل نشر تطبيقات الحاويات

### المشكلة: فشل بناء الحاوية

**الأعراض:**
```
Error: Failed to build container image
```

**الحلول:**

1. **تحقق من صياغة Dockerfile:**
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

3. **أضف فحص صحة:**
```python
# main.py - Add health check endpoint
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

1. **زيادة مهلة بدء التشغيل:**
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

2. **تحسين تحميل النموذج:**
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

## أخطاء المصادقة والأذونات

### المشكلة: رفض إذن الهوية المدارة

**الأعراض:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**الحلول:**

1. **تحقق من تعيينات الأدوار:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **عيّن الأدوار المطلوبة:**
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

اكتساب رمز الوصول يثبت المصادقة، وليس الإذن لاستدعاء نموذج. اختبر العملية المقصودة بشكل منفصل. محليًا، قد يستخدم `DefaultAzureCredential` بيانات اعتماد المطور؛ في Azure، تحقق من اختيار الهوية المدارة المقصودة.

### المشكلة: رفض الوصول إلى Key Vault

**الأعراض:**
```
Error: The user, group or application does not have secrets get permission
```

**الحلول:**

1. **منح أذونات Key Vault:**

استخدم جزء سياسة الوصول التالي فقط للخزانة التي بها `enableRbacAuthorization: false`. لخزانة مفعلة بنموذج RBAC، استخدم الخيار 2؛ إضافة سياسة وصول لا تمنح وصولًا لطائرة البيانات في وضع RBAC.
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

يجب أن تكون الخزانة بها `enableRbacAuthorization: true`؛ يتطلب تغيير نموذج الأذونات هجرة مخططة للوصول الحالي.
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

## فشل نشر النموذج

### المشكلة: نسخة النموذج غير متاحة

**الأعراض:**
```
Error: Model version 'gpt-4-32k' is not available
```

**الحلول:**

1. **تحقق من النماذج المتاحة:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **اختر نموذجًا متاحًا صراحةً:**
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

3. **تحقق من النموذج قبل النشر:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## مشاكل الأداء والتوسع

### المشكلة: استجابات ذات زمن تأخير مرتفع

**الأعراض:**
- أوقات الاستجابة > 30 ثانية
- أخطاء انتهاء المهلة
- تجربة مستخدم ضعيفة

**الحلول:**

1. **تنفيذ مهلات الطلب:**
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

2. **إضافة تخزين مؤقت للاستجابة:**
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

3. **تكوين التوسيع التلقائي:**
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

1. **زيادة تخصيص الذاكرة:**
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

2. **تحسين استخدام الذاكرة:**
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

## إدارة التكاليف والحصص

### المشكلة: تكاليف مرتفعة غير متوقعة

**الأعراض:**
- فاتورة Azure أعلى من المتوقع
- استخدام الرموز يتجاوز التقديرات
- تنبيهات الميزانية مفعلة

**الحلول:**

1. **تنفيذ ضوابط التكاليف:**
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

هذا العداد في الذاكرة توضيحي، وليس ضابطًا للإنفاق الشهري: يتم إعادة تعيينه عند إعادة التشغيل، ولا يُشارك عبر النسخ، ويفحص الاستخدام فقط بعد الطلب. العداد الحقيقي يحتاج إلى محاسبة دائمة، واحتجازات متزامنة قبل الطلبات، وسياسة إعادة تعيين شهرية. يجب أن تأخذ مقاييس ذاكرة الحاوية أيضًا في الاعتبار حدود cgroup؛ `psutil.virtual_memory()` ليست قياسًا موثوقًا لحدود الحاوية، وجمع القمامة لا يفرض حدًا للذاكرة.

2. **إعداد تنبيهات التكاليف:**
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

أعلِن `budgetStartDate` و `budgetEndDate` في قالبك. الميزانيات تُبلّغ فقط؛ لا توقف الموارد أو تفرض حدًا صارمًا للإنفاق.

3. **تحسين اختيار النموذج:**
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

## أدوات وتقنيات التصحيح

### أوامر تصحيح AZD

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

### أوامر ملحق AZD AI للتشخيص

إذا نشرت الوكلاء باستخدام `azd ai agent init`، هذه الأدوات الإضافية متاحة:

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

> **نصيحة:** استخدم `azd infra generate` لكتابة IaC على القرص حتى تتمكن من فحص الموارد التي تم توفيرها بالضبط. هذا ضروري جدًا عند تصحيح مشكلات تكوين الموارد. راجع [مرجع سطر أوامر AZD AI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) للتفاصيل الكاملة.

**تشخيص سير العمل GA (2026-11-09):** تحقق من أن `azd version` لا يقل عن 1.37.0 وافحص `azd ext list --installed`. قم بتحديث CLI الأساسي أولًا باستخدام `azd update` أو مثبته، ثم حدث الحزمة باستخدام `azd ext upgrade microsoft.foundry`. للحالات المحلية، تحقق من uv الحالي، وبايثون 3.13+ للعينة الأساسية، و `PYTHONNOUSERSITE: "1"` في تكوين الخدمة الخاص به، وبيانات اعتماد Azure المستخدمة بواسطة `DefaultAzureCredential`. احتفظ بـ `azd ai agent run` شغالًا أثناء استدعاء `--local` من نافذة طرفية ثانية في دليل المشروع.

نجاح التوفير لا يثبت أن المطور لديه وصول إلى مستوى بيانات الطائرة. راجع تحذيرات RBAC ومصفوفة أذونات الوكيل المستضاف [hosted-agent permission matrix](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions). انتهاء المهلة لا يعني فشل النشر: تحقق من الإصدار والمحاولات والسجلات قبل المحاولة مجددًا. الوكلاء الأقدم beta.23 حسّنوا هذه التحذيرات ومخرجات A2A؛ تلك التصحيحات التاريخية موضحة في [ملاحظات الإصدار](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes)، وليست شرطًا لتثبيت ذلك النسخة التجريبية.

إذا لم يكن `azd ai eval` متوفرًا، فقم بتثبيت `azure.ai.evaluations` بشكل منفصل؛ حزمة GA لا تتضمنه. إذا كان أمر تقييم الوكيل في الدليل الأقدم يطبع إرشادات الترحيل فقط، فاستخدم سير العمل المنفصل `azd ai eval`. لم يعد `--config` الخاص بالتحسين يقبل ملفات التقييم القديمة. راجع [ترحيل التقييم](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) و[ترحيل التحسين](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### تصحيح تطبيقات البرمجيات

1. **التسجيل المهيكل:**
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

2. **نقاط فحص الصحة:**
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

## رموز الأخطاء الشائعة وحلولها

| رمز الخطأ | الوصف | الحل |
|------------|-------------|----------|
| 401 | غير مصرح | تحقق من مفاتيح API وتكوين الهوية المُدارة |
| 403 | ممنوع | تحقق من تعيينات الأدوار في RBAC |
| 429 | تم تقييد المعدل | نفذ منطق إعادة المحاولة مع تراجع أسي |
| 500 | خطأ داخلي في الخادم | تحقق من حالة نشر النموذج والسجلات |
| 503 | الخدمة غير متاحة | تحقق من صحة الخدمة وتوافرها الإقليمي |

## الخطوات التالية

1. **راجع [دليل نشر نموذج الذكاء الاصطناعي](../chapter-02-ai-development/ai-model-deployment.md)** لأفضل ممارسات النشر
2. **أكمل [ممارسات الذكاء الاصطناعي للإنتاج](../chapter-08-production/production-ai-practices.md)** للحلول الجاهزة للمؤسسات
3. **انضم إلى [خادم مايكروسوفت فاوندري على ديسكورد](https://aka.ms/foundry/discord)** للدعم المجتمعي
4. **قم بإرسال القضايا** إلى [مستودع AZD على GitHub](https://github.com/Azure/azure-dev) لمشاكل AZD المحددة

## الموارد

- [استكشاف مشاكل الحصة والحد من سرعة استعمال Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [استكشاف مشاكل تطبيقات الحاويات](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [استكشاف مشاكل Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**مهارة وكيل تشخيصات Azure**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - ثبّت مهارات استكشاف مشاكل Azure في محررك: `npx skills add microsoft/github-copilot-for-azure`

---

**تنقل الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 7 - استكشاف الأخطاء وتصحيحها
- **⬅️ السابق**: [دليل التصحيح](debugging.md)
- **➡️ الفصل التالي**: [الفصل 8: نماذج الإنتاج والمؤسسات](../chapter-08-production/production-ai-practices.md)
- **🤖 ذات صلة**: [الفصل 2: تطوير يركز على الذكاء الاصطناعي](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 مرجع**: [استكشاف أخطاء وميزات Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->