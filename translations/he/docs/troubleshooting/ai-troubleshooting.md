<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c8ab8fd8ed338b3ec17484b453dcda68",
  "translation_date": "2025-09-18T07:12:32+00:00",
  "source_file": "docs/troubleshooting/ai-troubleshooting.md",
  "language_code": "he"
}
-->
# מדריך פתרון בעיות ספציפי ל-AI

**ניווט בין פרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 7 - פתרון בעיות וניפוי שגיאות
- **⬅️ קודם**: [מדריך ניפוי שגיאות](debugging.md)
- **➡️ פרק הבא**: [פרק 8: דפוסי ייצור וארגונים](../ai-foundry/production-ai-practices.md)
- **🤖 קשור**: [פרק 2: פיתוח מבוסס AI](../ai-foundry/azure-ai-foundry-integration.md)

**קודם:** [דפוסי AI בייצור](../ai-foundry/production-ai-practices.md) | **הבא:** [התחלת עבודה עם AZD](../getting-started/README.md)

מדריך פתרון בעיות מקיף זה מתמקד בבעיות נפוצות בעת פריסת פתרונות AI עם AZD, ומספק פתרונות וטכניקות ניפוי שגיאות ספציפיות לשירותי Azure AI.

## תוכן עניינים

- [בעיות בשירות Azure OpenAI](../../../../docs/troubleshooting)
- [בעיות בחיפוש Azure AI](../../../../docs/troubleshooting)
- [בעיות בפריסת אפליקציות קונטיינר](../../../../docs/troubleshooting)
- [שגיאות אימות והרשאות](../../../../docs/troubleshooting)
- [כשלי פריסת מודלים](../../../../docs/troubleshooting)
- [בעיות ביצועים וסקיילינג](../../../../docs/troubleshooting)
- [ניהול עלויות ומכסה](../../../../docs/troubleshooting)
- [כלי וטכניקות ניפוי שגיאות](../../../../docs/troubleshooting)

## בעיות בשירות Azure OpenAI

### בעיה: שירות OpenAI אינו זמין באזור

**תסמינים:**
```
Error: The requested resource type is not available in the location 'westus'
```

**גורמים:**
- שירות Azure OpenAI אינו זמין באזור שנבחר
- מכסה אזורית מוצתה
- מגבלות קיבולת אזורית

**פתרונות:**

1. **בדיקת זמינות אזורית:**
```bash
# List available regions for OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **עדכון הגדרות AZD:**
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

### בעיה: מכסת פריסת מודלים מוצתה

**תסמינים:**
```
Error: Deployment failed due to insufficient quota
```

**פתרונות:**

1. **בדיקת מכסה נוכחית:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **בקשת הגדלת מכסה:**
```bash
# Submit quota increase request
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **אופטימיזציה של קיבולת מודלים:**
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
# Use latest supported version
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **בדיקת תאימות גרסת API:**
```bash
# List supported API versions
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## בעיות בחיפוש Azure AI

### בעיה: רמת תמחור שירות החיפוש אינה מספקת

**תסמינים:**
```
Error: Semantic search requires Basic tier or higher
```

**פתרונות:**

1. **שדרוג רמת תמחור:**
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
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **בדיקת סכמת אינדקס:**
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
# main.py - Add health check endpoint
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

1. **הגדלת זמן אתחול:**
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

## שגיאות אימות והרשאות

### בעיה: הרשאת זהות מנוהלת נדחתה

**תסמינים:**
```
Error: Authentication failed for Azure OpenAI Service
```

**פתרונות:**

1. **אימות הקצאות תפקידים:**
```bash
# Check current role assignments
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

### בעיה: גישה ל-Key Vault נדחתה

**תסמינים:**
```
Error: The user, group or application does not have secrets get permission
```

**פתרונות:**

1. **מתן הרשאות ל-Key Vault:**
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
# List available models
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

## בעיות ביצועים וסקיילינג

### בעיה: תגובות עם זמן אחזור גבוה

**תסמינים:**
- זמני תגובה > 30 שניות
- שגיאות זמן קצוב
- חוויית משתמש ירודה

**פתרונות:**

1. **יישום מגבלות זמן לבקשות:**
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

2. **הוספת מטמון תגובות:**
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

3. **הגדרת סקיילינג אוטומטי:**
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

### בעיה: שגיאות זיכרון

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

## ניהול עלויות ומכסה

### בעיה: עלויות גבוהות מהצפוי

**תסמינים:**
- חשבון Azure גבוה מהצפוי
- שימוש בטוקנים עולה על הערכות
- התראות תקציב מופעלות

**פתרונות:**

1. **יישום בקרות עלויות:**
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

2. **הגדרת התראות עלויות:**
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

## כלי וטכניקות ניפוי שגיאות

### פקודות ניפוי שגיאות של AZD

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

### ניפוי שגיאות באפליקציות

1. **לוגים מובנים:**
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

2. **נקודות בדיקת בריאות:**
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
|-----------|--------|-------|
| 401 | לא מורשה | בדיקת מפתחות API והגדרות זהות מנוהלת |
| 403 | אסור | אימות הקצאות תפקידים ב-RBAC |
| 429 | מגבלת קצב | יישום לוגיקת ניסיונות חוזרים עם backoff אקספוננציאלי |
| 500 | שגיאת שרת פנימית | בדיקת סטטוס פריסת מודל ולוגים |
| 503 | שירות לא זמין | אימות בריאות השירות וזמינות אזורית |

## צעדים הבאים

1. **סקירת [מדריך פריסת מודלים AI](ai-model-deployment.md)** עבור שיטות עבודה מומלצות לפריסה
2. **השלמת [דפוסי AI בייצור](production-ai-practices.md)** עבור פתרונות מוכנים לארגונים
3. **הצטרפות ל-[Discord של Azure AI Foundry](https://aka.ms/foundry/discord)** לקבלת תמיכה קהילתית
4. **הגשת בעיות** ל-[מאגר GitHub של AZD](https://github.com/Azure/azure-dev) עבור בעיות ספציפיות ל-AZD

## משאבים

- [פתרון בעיות בשירות Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [פתרון בעיות באפליקציות קונטיינר](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [פתרון בעיות בחיפוש Azure AI](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**ניווט בין פרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 7 - פתרון בעיות וניפוי שגיאות
- **⬅️ קודם**: [מדריך ניפוי שגיאות](debugging.md)
- **➡️ פרק הבא**: [פרק 8: דפוסי ייצור וארגונים](../ai-foundry/production-ai-practices.md)
- **🤖 קשור**: [פרק 2: פיתוח מבוסס AI](../ai-foundry/azure-ai-foundry-integration.md)
- [פתרון בעיות CLI של Azure Developer](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי על ידי אדם. איננו נושאים באחריות לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.