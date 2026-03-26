# מדריך פתרון בעיות ספציפי ל-AI

**ניווט בפרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 7 - פתרון תקלות וניפוי שגיאות
- **⬅️ קודם**: [מדריך לפתרון תקלות](debugging.md)
- **➡️ פרק הבא**: [פרק 8: דפוסי ייצור וארגוניים](../chapter-08-production/production-ai-practices.md)
- **🤖 קשור**: [פרק 2: פיתוח ראשוני ל-AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

מדריך פתרון התקלות המקיף הזה עוסק בבעיות נפוצות בעת פריסת פתרונות AI עם AZD, ומספק פתרונות וטכניקות לניפוי שגיאות ספציפיות לשירותי Azure AI.

## תוכן עניינים

- [בעיות בשירות דגמי Microsoft Foundry](#azure-openai-service-issues)
- [בעיות בחיפוש Azure AI](#בעיות-בחיפוש-azure-ai)
- [בעיות בפריסת Container Apps](#בעיות-בפריסת-container-apps)
- [שגיאות אימות והרשאות](#שגיאות-אימות-והרשאות)
- [כשלונות בפריסת מודלים](#כשלונות-בפריסת-מודלים)
- [בעיות ביצועים והרחבה](#בעיות-ביצועים-והרחבה)
- [ניהול עלויות ומכסה](#ניהול-עלויות-ומכסה)
- [כלי וטכניקות ניפוי שגיאות](#כלי-וטכניקות-ניפוי-שגיאות)

## בעיות בשירות דגמי Microsoft Foundry

### בעיה: שירות OpenAI לא זמין באזור

**סימפטומים:**
```
Error: The requested resource type is not available in the location 'westus'
```

**סיבות:**
- דגמי Microsoft Foundry לא זמינים באזור הנבחר
- מכסה אזורית אזלה באזורים מועדפים
- מגבלות קיבולת אזורית

**פתרונות:**

1. **בדוק זמינות אזור:**
```bash
# רשימת האזורים הזמינים עבור OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **עדכן את תצורת AZD:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **השתמש באזורים חלופיים:**
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

### בעיה: חריגה ממכסת פריסת מודל

**סימפטומים:**
```
Error: Deployment failed due to insufficient quota
```

**פתרונות:**

1. **בדוק את המכסה הנוכחית:**
```bash
# בדוק שימוש במכסה
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **בקש הגדלת מכסה:**
```bash
# הגש בקשה להגדלת מכסת השימוש
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

### בעיה: גרסת API לא חוקית

**סימפטומים:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**פתרונות:**

1. **השתמש בגרסת API נתמכת:**
```python
# השתמש בגרסה הנתמכת העדכנית ביותר
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **בדוק תאימות לגרסת ה-API:**
```bash
# רשום את גרסאות ה-API הנתמכות
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## בעיות בחיפוש Azure AI

### בעיה: שכבת תמחור של שירות החיפוש לא מספקת

**סימפטומים:**
```
Error: Semantic search requires Basic tier or higher
```

**פתרונות:**

1. **שדרג שכבת תמחור:**
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

2. **נטרל חיפוש סמנטי (פיתוח):**
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

### בעיה: כישלונות ביצירת אינדקס

**סימפטומים:**
```
Error: Cannot create index, insufficient permissions
```

**פתרונות:**

1. **אמת מפתחות שירות החיפוש:**
```bash
# לקבל מפתח מנהל שירות החיפוש
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **בדוק סכמת אינדקס:**
```python
# אמת את סכמת האינדקס
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

3. **השתמש בזהות מנוהלת:**
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

## בעיות בפריסת Container Apps

### בעיה: כשלי בניית מכולות

**סימפטומים:**
```
Error: Failed to build container image
```

**פתרונות:**

1. **בדוק תחביר Dockerfile:**
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

2. **אמת תלותים:**
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

3. **הוסף בדיקת בריאות:**
```python
# main.py - הוסף נקודת קצה לבדיקת מצב הבריאות
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### בעיה: כשלי הפעלה ב-Container App

**סימפטומים:**
```
Error: Container failed to start within timeout period
```

**פתרונות:**

1. **הגדל זמן המתנה להפעלה:**
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

2. **אופטימיזציה של טעינת מודל:**
```python
# טעינת מודלים בעצלנות כדי להפחית את זמן ההפעלה
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
        # אתחול לקוח ה-AI כאן
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # התחלה
    app.state.model_manager = ModelManager()
    yield
    # כיבוי
    pass

app = FastAPI(lifespan=lifespan)
```

## שגיאות אימות והרשאות

### בעיה: הרשאת זהות מנוהלת נדחתה

**סימפטומים:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**פתרונות:**

1. **אמת הקצאות תפקידים:**
```bash
# בדוק מיוני תפקיד נוכחיים
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **הקצה תפקידים דרושים:**
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

3. **בדוק אימות:**
```python
# בדיקת אימות זהות מנוהלת
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

**סימפטומים:**
```
Error: The user, group or application does not have secrets get permission
```

**פתרונות:**

1. **הענק הרשאות ל-Key Vault:**
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

2. **השתמש ב-RBAC במקום במדיניות גישה:**
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

## כשלונות בפריסת מודלים

### בעיה: גרסת מודל לא זמינה

**סימפטומים:**
```
Error: Model version 'gpt-4-32k' is not available
```

**פתרונות:**

1. **בדוק את המודלים הזמינים:**
```bash
# רשימת דגמים זמינים
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **השתמש בגיבויים למודל:**
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

3. **אמת את המודל לפני הפריסה:**
```python
# אימות דגם לפני פריסה
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

## בעיות ביצועים והרחבה

### בעיה: תגובות עם השהייה גבוהה

**סימפטומים:**
- זמני תגובה מעל 30 שניות
- שגיאות timeout
- חוויית משתמש לקויה

**פתרונות:**

1. **יישם זמני timeout לבקשות:**
```python
# להגדיר זמני המתנה מתאימים
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

2. **הוסף מטמון תגובות:**
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

3. **תצורה להרחבה אוטומטית:**
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

### בעיה: שגיאות מחסור בזיכרון

**סימפטומים:**
```
Error: Container killed due to memory limit exceeded
```

**פתרונות:**

1. **הגדל הקצאת הזיכרון:**
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
# טיפול יעיל בזיכרון של מודל
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # בדוק את השימוש בזיכרון לפני העיבוד
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # כפה איסוף אשפה
            
        result = await self._process_ai_request(request)
        
        # נקה לאחר העיבוד
        gc.collect()
        return result
```

## ניהול עלויות ומכסה

### בעיה: עלויות גבוהות בלתי צפויות

**סימפטומים:**
- חשבון Azure גבוה מהצפוי
- שימוש בטוקנים הגבוה מההערכות
- התראות תקציב הופעלו

**פתרונות:**

1. **יישם בקרה עלויות:**
```python
# מעקב אחר שימוש בטוקנים
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

2. **הגדר התראות עלות:**
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

3. **אופטימיזציה בבחירת מודל:**
```python
# בחירת מודל מודעת לעלות
MODEL_COSTS = {
    'gpt-4.1-mini': 0.00015,  # לכל 1,000 תווים
    'gpt-4.1': 0.03,          # לכל 1,000 תווים
    'gpt-35-turbo': 0.0015  # לכל 1,000 תווים
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

## כלי וטכניקות ניפוי שגיאות

### פקודות ניפוי שגיאות AZD

```bash
# הפעלת רישום מפורט
azd up --debug

# בדוק את מצב הפריסה
azd show

# הצג יומני יישום (פותח לוח בקרה למעקב)
azd monitor --logs

# הצג מדדים בזמן אמת
azd monitor --live

# בדוק משתני סביבה
azd env get-values
```

### פקודות הרחבת AI של AZD לאבחון

אם פרסת סוכנים באמצעות `azd ai agent init`, כלים נוספים אלה זמינים:

```bash
# ודא כי התוסף של הסוכנים מותקן
azd extension install azure.ai.agents

# אתחל מחדש או עדכן סוכן מתוך מנית
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# השתמש בשרת MCP כדי לאפשר לכלי בינה מלאכותית לשאול מצב הפרויקט
azd mcp start

# צור קבצי תשתית לעיון וביקורת
azd infra generate
```

> **טיפ:** השתמש ב-`azd infra generate` כדי לכתוב IaC לדיסק כך שתוכל לבדוק בדיוק אילו משאבים סופקו. זה בעל ערך רב בעת ניפוי תקלות בקונפיגורציית המשאבים. עיין ב-[אזכרת CLI של AZD AI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) לפרטים מלאים.

### ניפוי תקלות באפליקציה

1. **רישום מובנה:**
```python
import logging
import json

# הגדר רישום מובנה ליישומי בינה מלאכותית
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
    
    # בדוק חיבור ל-OpenAI
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # בדוק שירות חיפוש
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

3. **ניטור ביצועים:**
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
| 401 | לא מורשה | בדוק מפתחות API ותצורת הזהות המנוהלת |
| 403 | אסור | אמת הקצאות תפקידי RBAC |
| 429 | מוגבל קצב | יישם לוגיקת ניסיון חוזר עם חזרה מעריכית |
| 500 | שגיאה פנימית בשרת | בדוק את מצב הפריסת המודל והלוגים |
| 503 | שירות לא זמין | אמת בריאות השירות וזמינות אזורית |

## צעדים הבאים

1. **עיין ב-[מדריך פריסת מודל AI](../chapter-02-ai-development/ai-model-deployment.md)** לשיטות מיטביות לפריסה
2. **השלם את [שיטות ייצור AI](../chapter-08-production/production-ai-practices.md)** לפתרונות מוכנים לארגון
3. **הצטרף ל-[Discord של Microsoft Foundry](https://aka.ms/foundry/discord)** לתמיכה קהילתית
4. **דווח על בעיות** ב-[מאגר GitHub של AZD](https://github.com/Azure/azure-dev) לבעיות ספציפיות ל-AZD

## משאבים

- [פתרון תקלות שירות דגמי Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [פתרון תקלות Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [פתרון תקלות בחיפוש Azure AI](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**כישוריית אבחון Azure**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - התקן כישורי פתרון תקלות Azure בעורך שלך: `npx skills add microsoft/github-copilot-for-azure`

---

**ניווט בפרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 7 - פתרון תקלות וניפוי שגיאות
- **⬅️ קודם**: [מדריך לפתרון תקלות](debugging.md)
- **➡️ פרק הבא**: [פרק 8: דפוסי ייצור וארגוניים](../chapter-08-production/production-ai-practices.md)
- **🤖 קשור**: [פרק 2: פיתוח ראשוני ל-AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 הפניה**: [פתרון בעיות עם Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות התרגום האוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש להיות מודעים לכך שתרגומים אוטומטיים עשויים להכיל שגיאות או אי-דיוקים. יש להתייחס למסמך המקורי בשפת המקור כמקור הסמכותי. עבור מידע קריטי מומלץ לתרגום מקצועי על ידי אדם. איננו אחראים לכל אי-הבנות או פרשנויות שגויות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->