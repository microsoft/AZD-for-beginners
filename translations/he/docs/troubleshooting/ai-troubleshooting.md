<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b5ae13b6a245ab3a2e6dae923aab65bd",
  "translation_date": "2025-11-21T17:31:42+00:00",
  "source_file": "docs/troubleshooting/ai-troubleshooting.md",
  "language_code": "he"
}
-->
# מדריך פתרון תקלות ייעודי ל-AI

**ניווט פרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 7 - פתרון תקלות וניפוי באגים
- **⬅️ קודם**: [מדריך ניפוי באגים](debugging.md)
- **➡️ פרק הבא**: [פרק 8: דפוסי ייצור וארגונים](../microsoft-foundry/production-ai-practices.md)
- **🤖 קשור**: [פרק 2: פיתוח מונחה AI](../microsoft-foundry/microsoft-foundry-integration.md)

**קודם:** [דפוסי AI בייצור](../microsoft-foundry/production-ai-practices.md) | **הבא:** [התחלה עם AZD](../getting-started/README.md)

מדריך פתרון תקלות מקיף זה מתמקד בבעיות נפוצות בעת פריסת פתרונות AI עם AZD, ומספק פתרונות וטכניקות ניפוי באגים ייחודיות לשירותי Azure AI.

## תוכן עניינים

- [בעיות בשירות Azure OpenAI](../../../../docs/troubleshooting)
- [בעיות בחיפוש Azure AI](../../../../docs/troubleshooting)
- [בעיות בפריסת אפליקציות קונטיינר](../../../../docs/troubleshooting)
- [שגיאות אימות והרשאות](../../../../docs/troubleshooting)
- [כשלי פריסת מודלים](../../../../docs/troubleshooting)
- [בעיות ביצועים וסקלביליות](../../../../docs/troubleshooting)
- [ניהול עלויות ומכסה](../../../../docs/troubleshooting)
- [כלי וטכניקות ניפוי באגים](../../../../docs/troubleshooting)

## בעיות בשירות Azure OpenAI

### בעיה: שירות OpenAI אינו זמין באזור

**תסמינים:**
```
Error: The requested resource type is not available in the location 'westus'
```

**גורמים:**
- שירות Azure OpenAI אינו זמין באזור שנבחר
- מכסה אזלה באזורים מועדפים
- מגבלות קיבולת אזורית

**פתרונות:**

1. **בדיקת זמינות אזורית:**
```bash
# רשימת אזורים זמינים עבור OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **עדכון תצורת AZD:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **שימוש באזורים חלופיים:**
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

### בעיה: מכסת פריסת מודלים חרגה

**תסמינים:**
```
Error: Deployment failed due to insufficient quota
```

**פתרונות:**

1. **בדיקת מכסה נוכחית:**
```bash
# בדוק את השימוש במכסה
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **בקשת הגדלת מכסה:**
```bash
# שלח בקשה להגדלת מכסה
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **אופטימיזציה של קיבולת המודל:**
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

### בעיה: גרסת API לא תקינה

**תסמינים:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**פתרונות:**

1. **שימוש בגרסת API נתמכת:**
```python
# השתמש בגרסה הנתמכת האחרונה
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **בדיקת תאימות גרסת API:**
```bash
# רשימת גרסאות API נתמכות
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## בעיות בחיפוש Azure AI

### בעיה: רמת תמחור של שירות החיפוש אינה מספקת

**תסמינים:**
```
Error: Semantic search requires Basic tier or higher
```

**פתרונות:**

1. **שדרוג רמת התמחור:**
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

2. **השבתת חיפוש סמנטי (למטרות פיתוח):**
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

### בעיה: כשל ביצירת אינדקס

**תסמינים:**
```
Error: Cannot create index, insufficient permissions
```

**פתרונות:**

1. **אימות מפתחות שירות החיפוש:**
```bash
# קבל מפתח מנהל שירות חיפוש
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **בדיקת סכמת האינדקס:**
```python
# אימות סכמת אינדקס
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

3. **שימוש בזהות מנוהלת:**
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

## בעיות בפריסת אפליקציות קונטיינר

### בעיה: כשל בבניית קונטיינר

**תסמינים:**
```
Error: Failed to build container image
```

**פתרונות:**

1. **בדיקת תחביר Dockerfile:**
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

2. **אימות תלות:**
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

3. **הוספת בדיקת בריאות:**
```python
# main.py - הוסף נקודת קצה לבדיקת בריאות
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### בעיה: כשל באתחול אפליקציית קונטיינר

**תסמינים:**
```
Error: Container failed to start within timeout period
```

**פתרונות:**

1. **הגדלת זמן האתחול:**
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

2. **אופטימיזציה של טעינת מודלים:**
```python
# טען מודלים באופן עצל כדי להפחית את זמן ההפעלה
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
        # אתחל את לקוח הבינה המלאכותית כאן
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # הפעלה
    app.state.model_manager = ModelManager()
    yield
    # כיבוי
    pass

app = FastAPI(lifespan=lifespan)
```

## שגיאות אימות והרשאות

### בעיה: הרשאת זהות מנוהלת נדחתה

**תסמינים:**
```
Error: Authentication failed for Azure OpenAI Service
```

**פתרונות:**

1. **אימות הקצאות תפקידים:**
```bash
# בדוק את הקצאות התפקיד הנוכחיות
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **הקצאת תפקידים נדרשים:**
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

3. **בדיקת אימות:**
```python
# בדוק אימות זהות מנוהלת
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

### בעיה: גישה ל-Key Vault נדחתה

**תסמינים:**
```
Error: The user, group or application does not have secrets get permission
```

**פתרונות:**

1. **הענקת הרשאות ל-Key Vault:**
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

2. **שימוש ב-RBAC במקום מדיניות גישה:**
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

## כשלי פריסת מודלים

### בעיה: גרסת מודל אינה זמינה

**תסמינים:**
```
Error: Model version 'gpt-4-32k' is not available
```

**פתרונות:**

1. **בדיקת מודלים זמינים:**
```bash
# רשימת מודלים זמינים
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **שימוש במודלים חלופיים:**
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

3. **אימות מודל לפני פריסה:**
```python
# אימות מודל לפני פריסה
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

## בעיות ביצועים וסקלביליות

### בעיה: זמני תגובה גבוהים

**תסמינים:**
- זמני תגובה > 30 שניות
- שגיאות Timeout
- חוויית משתמש ירודה

**פתרונות:**

1. **יישום מגבלות זמן לבקשות:**
```python
# הגדר פסקי זמן מתאימים
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

2. **הוספת שמירת תגובות במטמון:**
```python
# מטמון Redis לתגובות
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

3. **הגדרת סקלביליות אוטומטית:**
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

### בעיה: שגיאות זיכרון אזל

**תסמינים:**
```
Error: Container killed due to memory limit exceeded
```

**פתרונות:**

1. **הגדלת הקצאת זיכרון:**
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

2. **אופטימיזציה של שימוש בזיכרון:**
```python
# טיפול יעיל בזיכרון במודל
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # בדוק שימוש בזיכרון לפני עיבוד
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # הכרח איסוף זבל
            
        result = await self._process_ai_request(request)
        
        # נקה לאחר עיבוד
        gc.collect()
        return result
```

## ניהול עלויות ומכסה

### בעיה: עלויות גבוהות מהצפוי

**תסמינים:**
- חשבון Azure גבוה מהצפוי
- שימוש בטוקנים חורג מהערכות
- התראות תקציב מופעלות

**פתרונות:**

1. **יישום בקרות עלות:**
```python
# מעקב אחר שימוש באסימונים
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

2. **הגדרת התראות עלות:**
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

3. **אופטימיזציה של בחירת מודלים:**
```python
# בחירת מודל מודעת לעלות
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # לכל 1K טוקנים
    'gpt-4': 0.03,          # לכל 1K טוקנים
    'gpt-35-turbo': 0.0015  # לכל 1K טוקנים
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

## כלי וטכניקות ניפוי באגים

### פקודות ניפוי באגים של AZD

```bash
# הפעל רישום מפורט
azd up --debug

# בדוק את מצב הפריסה
azd show

# הצג יומני פריסה
azd logs --follow

# בדוק משתני סביבה
azd env get-values
```

### ניפוי באגים באפליקציות

1. **רישום מובנה:**
```python
import logging
import json

# הגדר יומן מובנה עבור יישומי AI
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

2. **נקודות קצה לבדיקת בריאות:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # בדוק את חיבור OpenAI
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # בדוק את שירות החיפוש
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

3. **מעקב ביצועים:**
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

## קודי שגיאה נפוצים ופתרונות

| קוד שגיאה | תיאור | פתרון |
|------------|-------------|----------|
| 401 | לא מורשה | בדיקת מפתחות API ותצורת זהות מנוהלת |
| 403 | אסור | אימות הקצאות תפקידים ב-RBAC |
| 429 | מגבלת קצב | יישום לוגיקת ניסיונות חוזרים עם backoff אקספוננציאלי |
| 500 | שגיאת שרת פנימית | בדיקת סטטוס פריסת מודל ורישומים |
| 503 | שירות אינו זמין | אימות בריאות השירות וזמינות אזורית |

## שלבים הבאים

1. **עיון ב-[מדריך פריסת מודלים של AI](ai-model-deployment.md)** להנחיות פריסה מיטביות
2. **השלמת [דפוסי AI בייצור](production-ai-practices.md)** לפתרונות מוכנים לארגונים
3. **הצטרפות ל-[Discord של Microsoft Foundry](https://aka.ms/foundry/discord)** לתמיכה קהילתית
4. **הגשת בעיות** ל-[מאגר GitHub של AZD](https://github.com/Azure/azure-dev) לבעיות ייחודיות ל-AZD

## משאבים

- [פתרון תקלות בשירות Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [פתרון תקלות באפליקציות קונטיינר](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [פתרון תקלות בחיפוש Azure AI](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**ניווט פרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 7 - פתרון תקלות וניפוי באגים
- **⬅️ קודם**: [מדריך ניפוי באגים](debugging.md)
- **➡️ פרק הבא**: [פרק 8: דפוסי ייצור וארגונים](../microsoft-foundry/production-ai-practices.md)
- **🤖 קשור**: [פרק 2: פיתוח מונחה AI](../microsoft-foundry/microsoft-foundry-integration.md)
- [פתרון תקלות ב-Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**הצהרת אחריות**:  
מסמך זה תורגם באמצעות שירות תרגום AI [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש להיות מודעים לכך שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי אנושי. אנו לא נושאים באחריות לכל אי הבנות או פרשנויות שגויות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->