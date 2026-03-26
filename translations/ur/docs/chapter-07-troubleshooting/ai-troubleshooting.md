# AI-مخصوص مسئلہ حل کرنے کی رہنمائی

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 7 - مسائل کا حل اور ڈی بگنگ
- **⬅️ پچھلا**: [ڈی بگنگ گائیڈ](debugging.md)
- **➡️ اگلا باب**: [باب 8: پروڈکشن اور انٹرپرائز پیٹرنز](../chapter-08-production/production-ai-practices.md)
- **🤖 متعلقہ**: [باب 2: AI-فرسٹ ڈیولپمنٹ](../chapter-02-ai-development/microsoft-foundry-integration.md)

یہ جامع مسئلہ حل کرنے کی رہنمائی AZD کے ساتھ AI حل نافذ کرتے وقت عام مسائل کو حل کرتی ہے، اور Azure AI خدمات کے مخصوص حل اور ڈی بگ کرنے کی تکنیک فراہم کرتی ہے۔

## مواد کی فہرست

- [Microsoft Foundry Models سروس کے مسائل](#azure-openai-service-issues)
- [Azure AI سرچ کے مسائل](#azure-ai-سرچ-کے-مسائل)
- [کنٹینر ایپس کی تعیناتی کے مسائل](#کنٹینر-ایپس-کی-تعیناتی-کے-مسائل)
- [تصدیق اور اجازت کی غلطیاں](#تصدیق-اور-اجازت-کی-غلطیاں)
- [ماڈل تعیناتی کی ناکامیاں](#ماڈل-تعیناتی-کی-ناکامیاں)
- [کارکردگی اور اسکیلنگ کے مسائل](#کارکردگی-اور-اسکیلنگ-کے-مسائل)
- [لاگت اور کوٹا مینجمنٹ](#لاگت-اور-کوٹا-مینجمنٹ)
- [ڈی بگنگ کے اوزار اور تکنیک](#ڈی-بگنگ-کے-اوزار-اور-تکنیک)

## Microsoft Foundry Models سروس کے مسائل

### مسئلہ: کسی خطے میں OpenAI سروس دستیاب نہیں

**علامات:**
```
Error: The requested resource type is not available in the location 'westus'
```

**وجوہات:**
- منتخب کردہ خطے میں Microsoft Foundry Models دستیاب نہیں
- ترجیحی خطوں میں کوٹا ختم ہو چکا ہے
- علاقائی صلاحیت کی پابندیاں

**حل:**

1. **خطے کی دستیابی چیک کریں:**
```bash
# اوپن اے آئی کے لئے دستیاب خطے کی فہرست
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

3. **متبادل خطے استعمال کریں:**
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

### مسئلہ: ماڈل تعیناتی کا کوٹا ختم ہو گیا

**علامات:**
```
Error: Deployment failed due to insufficient quota
```

**حل:**

1. **موجودہ کوٹا چیک کریں:**
```bash
# کوٹا کے استعمال کی جانچ کریں
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **کوٹا میں اضافہ کی درخواست کریں:**
```bash
# کوٹہ میں اضافہ کی درخواست جمع کروائیں
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

### مسئلہ: API ورژن نامناسب

**علامات:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**حل:**

1. **معاونت یافتہ API ورژن استعمال کریں:**
```python
# استعمال کریں تازہ ترین معاون ورژن
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API ورژن مطابقت چیک کریں:**
```bash
# حمایت یافتہ API ورژنز کی فہرست بنائیں
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI سرچ کے مسائل

### مسئلہ: سرچ سروس کا قیمت والا درجہ ناکافی ہے

**علامات:**
```
Error: Semantic search requires Basic tier or higher
```

**حل:**

1. **قیمت کا درجہ اپ گریڈ کریں:**
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

2. **سمینٹک سرچ کو غیر فعال کریں (ترقی کے دوران):**
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

1. **سرچ سروس کی چابیاں تصدیق کریں:**
```bash
# سرچ سروس ایڈمن کی حاصل کریں
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **انڈیکس کا اسکیمہ چیک کریں:**
```python
# انڈیکس اسکیمہ کی توثیق کریں
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

3. **مینجڈ آئیڈینٹی استعمال کریں:**
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

### مسئلہ: کنٹینر بلڈ میں ناکامیاں

**علامات:**
```
Error: Failed to build container image
```

**حل:**

1. **ڈوکر فائل کی ترکیب چیک کریں:**
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

2. **انحصارات کی توثیق کریں:**
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
# main.py - ہیلتھ چیک اینڈپوائنٹ شامل کریں
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### مسئلہ: کنٹینر ایپ شروع نہ ہونا

**علامات:**
```
Error: Container failed to start within timeout period
```

**حل:**

1. **اسٹارٹ اپ ٹائم آؤٹ بڑھائیں:**
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
# اسٹارٹ اپ کے وقت کو کم کرنے کے لیے ماڈلز کو سست لوڈ کریں
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
        # یہاں AI کلائنٹ کو initialize کریں
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # اسٹارٹ اپ
    app.state.model_manager = ModelManager()
    yield
    # بند کرنا
    pass

app = FastAPI(lifespan=lifespan)
```

## تصدیق اور اجازت کی غلطیاں

### مسئلہ: مینجد آئیڈینٹی کی اجازت مسترد کی گئی

**علامات:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**حل:**

1. **رول کی تفویضات کی تصدیق کریں:**
```bash
# موجودہ کردار کی تفویضات چیک کریں
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **ضروری رول تفویض کریں:**
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

3. **تصدیق کا تجربہ کریں:**
```python
# تصدیق شدہ شناخت کی جانچ کریں
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

### مسئلہ: کی والٹ تک رسائی مسترد کی گئی

**علامات:**
```
Error: The user, group or application does not have secrets get permission
```

**حل:**

1. **کی والٹ کی اجازتیں دیں:**
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

2. **ایکسس پالیسیاں کے بجائے RBAC استعمال کریں:**
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

## ماڈل تعیناتی کی ناکامیاں

### مسئلہ: ماڈل ورژن دستیاب نہیں

**علامات:**
```
Error: Model version 'gpt-4-32k' is not available
```

**حل:**

1. **دستیاب ماڈلز چیک کریں:**
```bash
# دستیاب ماڈلز کی فہرست بنائیں
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **ماڈل فال بیکس استعمال کریں:**
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

3. **تعیناتی سے پہلے ماڈل کی تصدیق کریں:**
```python
# تعیناتی سے پہلے ماڈل کی توثیق
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

### مسئلہ: جوابی وقت زیادہ ہونا

**علامات:**
- جوابی وقت > 30 سیکنڈ
- ٹائم آؤٹ کی غلطیاں
- خراب صارف تجربہ

**حل:**

1. **درخواست کے وقت کی حد لگائیں:**
```python
# مناسب ٹائم آؤٹ تشکیل دیں
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
# جوابات کے لیے ریڈیس کیش
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

3. **آٹو اسکیلنگ کو ترتیب دیں:**
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

### مسئلہ: میموری کی کمی کے ایرر

**علامات:**
```
Error: Container killed due to memory limit exceeded
```

**حل:**

1. **میموری کی تقسیم بڑھائیں:**
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
# ماڈل کی میموری کا مؤثر انتظام
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # پراسیسنگ سے پہلے میموری کے استعمال کی جانچ کریں
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # زبردستی گاربج کلیکشن کریں
            
        result = await self._process_ai_request(request)
        
        # پراسیسنگ کے بعد صفائی کریں
        gc.collect()
        return result
```

## لاگت اور کوٹا مینجمنٹ

### مسئلہ: غیر متوقع زیادہ لاگت

**علامات:**
- Azure بل متوقع سے زیادہ
- ٹوکن کا استعمال اندازوں سے زیادہ
- بجٹ کی الرٹ ٹرگر ہونا

**حل:**

1. **لاگت کنٹرول نافذ کریں:**
```python
# ٹوکن کے استعمال کی نگرانی
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

2. **لاگت کی الرٹس سیٹ کریں:**
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
# لاگت سے آگاہ ماڈل کا انتخاب
MODEL_COSTS = {
    'gpt-4.1-mini': 0.00015,  # فی 1ہزار ٹوکنز
    'gpt-4.1': 0.03,          # فی 1ہزار ٹوکنز
    'gpt-35-turbo': 0.0015  # فی 1ہزار ٹوکنز
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

## ڈی بگنگ کے اوزار اور تکنیک

### AZD ڈی بگنگ کمانڈز

```bash
# تفصیلی لاگنگ کو فعال کریں
azd up --debug

# تعیناتی کی حالت چیک کریں
azd show

# درخواست کے لاگز دیکھیں (مانیٹرنگ ڈیش بورڈ کھولتا ہے)
azd monitor --logs

# لائیو میٹرکس دیکھیں
azd monitor --live

# ماحول کے متغیرات چیک کریں
azd env get-values
```

### AZD AI ایکسٹینشن کمانڈز برائے تشخیص

اگر آپ نے `azd ai agent init` کے ذریعے ایجنٹس نصب کیے ہیں، تو یہ اضافی اوزار دستیاب ہیں:

```bash
# یقینی بنائیں کہ ایجنٹس کی توسیع انسٹال ہے
azd extension install azure.ai.agents

# مینیفیسٹ سے ایجنٹ کو دوبارہ شروع کریں یا اپ ڈیٹ کریں
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# AI آلات کو پروجیکٹ کی حالت پوچھنے کے لیے MCP سرور استعمال کریں
azd mcp start

# جائزہ اور جانچ کے لیے انفراسٹرکچر فائلیں تیار کریں
azd infra generate
```

> **مشورہ:** `azd infra generate` استعمال کریں تاکہ IaC کو ڈسک پر لکھا جا سکے اور آپ بالکل دیکھ سکیں کہ کون سے وسائل فراہم کیے گئے ہیں۔ یہ وسائل کی ترتیب کے مسائل کو ڈی بگ کرتے وقت بہت قیمتی ہے۔ مکمل تفصیلات کے لیے [AZD AI CLI حوالہ](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) دیکھیں۔

### ایپلیکیشن ڈی بگنگ

1. **مربوط لاگنگ:**
```python
import logging
import json

# AI ایپلیکیشنز کے لیے ساختہ لاگنگ کو ترتیب دیں
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
    
    # اوپن اے آئی کنیکٹوٹی چیک کریں
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # سرچ سروس چیک کریں
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

## عام ایرر کوڈز اور حل

| ایرر کوڈ | وضاحت | حل |
|------------|-------------|----------|
| 401 | غیر مجاز | API چابیاں اور مینجد آئیڈینٹی کی ترتیب چیک کریں |
| 403 | ممنوع | RBAC رول تفویضات کی تصدیق کریں |
| 429 | حد سے تجاوز | ریٹری لاجک کے ساتھ ایکسپونینشل بیک آف نافذ کریں |
| 500 | اندرونی سرور ایرر | ماڈل تعیناتی کی سکت اور لاگز چیک کریں |
| 503 | سروس دستیاب نہیں | سروس کی صحت اور علاقائی دستیابی کی تصدیق کریں |

## اگلے اقدامات

1. **[AI ماڈل تعیناتی گائیڈ](../chapter-02-ai-development/ai-model-deployment.md)** کا جائزہ لیں بہترین طریقوں کے لیے
2. **[پروڈکشن AI پریکٹسز](../chapter-08-production/production-ai-practices.md)** مکمل کریں انٹرپرائز کے لیے تیار حل کے لیے
3. **[Microsoft Foundry Discord](https://aka.ms/foundry/discord)** میں شامل ہوں کمیونٹی سپورٹ کے لیے
4. **مسائل جمع کروائیں** [AZD گٹ ہب ریپوزیٹری](https://github.com/Azure/azure-dev) میں AZD مخصوص مسائل کے لیے

## وسائل

- [Microsoft Foundry Models سروس مسئلہ حل](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [کنٹینر ایپس مسئلہ حل](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI سرچ مسئلہ حل](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - اپنے ایڈیٹر میں Azure مسئلہ حل کرنے کی مہارتیں انسٹال کریں: `npx skills add microsoft/github-copilot-for-azure`

---

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 7 - مسائل کا حل اور ڈی بگنگ
- **⬅️ پچھلا**: [ڈی بگنگ گائیڈ](debugging.md)
- **➡️ اگلا باب**: [باب 8: پروڈکشن اور انٹرپرائز پیٹرنز](../chapter-08-production/production-ai-practices.md)
- **🤖 متعلقہ**: [باب 2: AI-فرسٹ ڈیولپمنٹ](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 حوالہ**: [Azure Developer CLI مسئلہ حل](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**گزارشِ ذمہ داری**:  
اس دستاویز کا ترجمہ AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے کیا گیا ہے۔ اگرچہ ہم درستگی کے لئے کوشاں ہیں، براہ کرم آگاہ رہیں کہ خودکار تراجم میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنی مادری زبان میں ہی معتبر ذریعہ سمجھی جانی چاہیے۔ اہم معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط ترجمانی کے لیے ہم ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->