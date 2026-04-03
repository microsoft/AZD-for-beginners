# מדריך פתרון בעיות ייעודי ל-AI

**ניווט בפרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 7 - פתרון באגים וטעויות
- **⬅️ קודם**: [מדריך פתרון באגים](debugging.md)
- **➡️ פרק הבא**: [פרק 8: דפוסי ייצור וארגוניים](../chapter-08-production/production-ai-practices.md)
- **🤖 קשור**: [פרק 2: פיתוח מונחה AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

מדריך פתרון הבעיות הנרחב הזה עוסק בבעיות נפוצות בעת פריסת פתרונות AI עם AZD, ומספק פתרונות וטכניקות איתור באגים ספציפיות לשירותי AI של Azure.

## תוכן עניינים

- [בעיות בשירות דגמי Microsoft Foundry](#azure-openai-service-issues)
- [בעיות בחיפוש של Azure AI](#בעיות-בחיפוש-של-azure-ai)
- [בעיות בפריסת Container Apps](#בעיות-בפריסת-container-apps)
- [שגיאות אימות והרשאות](#שגיאות-אימות-והרשאות)
- [כשלי פריסת מודל](#כשלי-פריסת-מודל)
- [בעיות ביצועים וקנה מידה](#בעיות-ביצועים-וקנה-מידה)
- [ניהול עלויות ומכסה](#ניהול-עלויות-ומכסה)
- [כלי וטכניקות איתור באגים](#כלי-וטכניקות-איתור-באגים)

## בעיות בשירות דגמי Microsoft Foundry

### בעיה: שירות OpenAI לא זמין באזור

**תסמינים:**
```
Error: The requested resource type is not available in the location 'westus'
```

**גורמים:**
- דגמי Microsoft Foundry אינם זמינים באזור שנבחר
- מכסת שימוש אזורית אזלה באזורים מועדפים
- מגבלות קיבולת אזוריות

**פתרונות:**

1. **בדוק זמינות האזור:**
```bash
# רשימת האזורים הזמינים ל-OpenAI
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

**תסמינים:**
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
# הגש בקשה להגדלת המכסה
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

### בעיה: גרסת API לא תקינה

**תסמינים:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**פתרונות:**

1. **השתמש בגרסת API נתמכת:**
```python
# השתמש בגירסה הנתמכת העדכנית ביותר
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **בדוק תאימות גרסת API:**
```bash
# רשימת גרסאות ה-API הנתמכות
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## בעיות בחיפוש של Azure AI

### בעיה: שכבת תמחור של שירות החיפוש אינה מספקת

**תסמינים:**
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

2. **בטל חיפוש סמנטי (בפיתוח):**
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

**תסמינים:**
```
Error: Cannot create index, insufficient permissions
```

**פתרונות:**

1. **אמת את מפתחות שירות החיפוש:**
```bash
# קבל מפתח מנהל שירות החיפוש
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **בדוק את סכמת האינדקס:**
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

3. **השתמש בזיהוי מנוהל:**
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

### בעיה: כשל בבניית מיכל

**תסמינים:**
```
Error: Failed to build container image
```

**פתרונות:**

1. **בדוק את תחביר Dockerfile:**
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

2. **אמת תלותיות:**
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
# main.py - הוסף נקודת קצה לבדיקת בריאות
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### בעיה: כשל בהפעלת Container App

**תסמינים:**
```
Error: Container failed to start within timeout period
```

**פתרונות:**

1. **הגדל את זמן ההמתנה להתחלה:**
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
# טעינת דגמים עצלה כדי להפחית את זמן ההפעלה
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
        # אתחול לקוח AI כאן
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
Error: Authentication failed for Microsoft Foundry Models Service
```

**פתרונות:**

1. **אמת הקצאת תפקידים:**
```bash
# בדוק את הקצאות התפקיד הנוכחיות
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **הקצה תפקידים נדרשים:**
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

3. **בצע בדיקת אימות:**
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

**תסמינים:**
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

2. **השתמש ב-RBAC במקום מדיניות גישה:**
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

## כשלי פריסת מודל

### בעיה: גרסת מודל לא זמינה

**תסמינים:**
```
Error: Model version 'gpt-4-32k' is not available
```

**פתרונות:**

1. **בדוק דגמים זמינים:**
```bash
# רשימת הדגמים הזמינים
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **השתמש במנגנוני נפילה אחורה למודל:**
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

3. **אמת את המודל לפני פריסה:**
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

## בעיות ביצועים וקנה מידה

### בעיה: תגובות עם השהייה גבוהה

**תסמינים:**
- זמני תגובה מעל 30 שניות
- שגיאות Timeout
- חוויית משתמש לקויה

**פתרונות:**

1. **ממש Timeouts לבקשות:**
```python
# הגדר זמני המתנה מתאימים
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

2. **הוסף מטמון לתגובות:**
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

3. **הגדר קנה מידה אוטומטי:**
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

### בעיה: שגיאות של חוסר זיכרון

**תסמינים:**
```
Error: Container killed due to memory limit exceeded
```

**פתרונות:**

1. **הגדל הקצאת זיכרון:**
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
# טיפול במודל בחיסכון בזיכרון
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # בדוק שימוש בזיכרון לפני העיבוד
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

**תסמינים:**
- חשבון Azure גבוה מהמתוכנן
- שימוש ב-Token היוצא מהערכת התקציב
- התראות תקציב הופעלו

**פתרונות:**

1. **ממש בקרות עלויות:**
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

2. **הגדר התראות עלויות:**
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

3. **אופטימיזציה של בחירת מודל:**
```python
# בחירת מודל עם מודעות לעלות
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

## כלי וטכניקות איתור באגים

### פקודות איתור באגים של AZD

```bash
# הפעל רישום מפורט
azd up --debug

# בדוק את מצב הפריסה
azd show

# הצג יומני יישום (פותח לוח בקרה של ניטור)
azd monitor --logs

# הצג מדדים חיים
azd monitor --live

# בדוק משתני סביבה
azd env get-values
```

### פקודות הרחבת AZD AI לאבחון

אם פרסת סוכנים בעזרת `azd ai agent init`, כלים נוספים אלו זמינים:

```bash
# ודא שתוסף הסוכנים מותקן
azd extension install azure.ai.agents

# אתחל מחדש או עדכן סוכן מתוך מניי
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# השתמש בשרת MCP כדי לאפשר לכלי AI לשאול את מצב הפרויקט
azd mcp start

# צור קבצי תשתית לסקירה וביקורת
azd infra generate
```

> **טיפ:** השתמש ב-`azd infra generate` לכתיבת קוד IaC לדיסק כדי שתוכל לבדוק בדיוק אילו משאבים הוקצו. זה קריטי לאיתור תקלות בתצורת משאבים. עיין ב-[מדריך הפקודות וההרחבות של AZD AI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) לפרטים מלאים.

### איתור באגים באפליקציה

1. **רישום מובנה:**
```python
import logging
import json

# הגדר רישום מובנה עבור אפליקציות AI
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

2. **נקודות בדיקת בריאות:**
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
| 401 | ללא הרשאה | בדוק מפתחות API ותצורת זהות מנוהלת |
| 403 | אסור | אמת הקצאת תפקידי RBAC |
| 429 | מגבלת שיעור | מימש לוגיקת ניסיון חוזר עם אחור רב-שלבי |
| 500 | שגיאת שרת פנימית | בדוק מצב ויומני פריסת המודל |
| 503 | שירות אינו זמין | אמת את בריאות השירות וזמינות אזורית |

## הצעדים הבאים

1. **עיין ב-[מדריך פריסת מודלים ל-AI](../chapter-02-ai-development/ai-model-deployment.md)** לפרקטיקות מיטביות בפריסה
2. **השלים את [נהלי ייצור ל-AI](../chapter-08-production/production-ai-practices.md)** לפתרונות המותאמים לארגונים
3. **הצטרף ל-[Discord של Microsoft Foundry](https://aka.ms/foundry/discord)** לתמיכה קהילתית
4. **דווח על בעיות** ב[מאגר AZD ב-GitHub](https://github.com/Azure/azure-dev) לבעיות ספציפיות ל-AZD

## משאבים

- [פתרון בעיות בשירות דגמי Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [פתרון בעיות Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [פתרון בעיות Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**כישור אבחון של Azure**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - התקן כישורי פתרון בעיות Azure בעורך שלך: `npx skills add microsoft/github-copilot-for-azure`

---

**ניווט בפרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 7 - פתרון באגים וטעויות
- **⬅️ קודם**: [מדריך פתרון באגים](debugging.md)
- **➡️ פרק הבא**: [פרק 8: דפוסי ייצור וארגוניים](../chapter-08-production/production-ai-practices.md)
- **🤖 קשור**: [פרק 2: פיתוח מונחה AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 הפניה**: [פתרון בעיות ב-Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). אף שאנו שואפים לדיוק, יש לזכור כי תרגומים אוטומטיים עשויים להכיל שגיאות או אי-דיוקים. המסמך המקורי בשפת המקור שלו הוא המקור המוסמך. למידע קריטי מומלץ להשתמש בתרגום מקצועי שנעשה על ידי אדם. אנו לא נושאים באחריות לכל אי הבנה או פרשנות שגויה הנובעת מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->