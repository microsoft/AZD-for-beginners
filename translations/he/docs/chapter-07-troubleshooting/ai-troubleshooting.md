# מדריך פתרון בעיות ייעודי לבינה מלאכותית

**ניווט בפרק:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 7 - פתרון תקלות וניפוי שגיאות
- **⬅️ קודם**: [מדריך לניפוי שגיאות](debugging.md)
- **➡️ פרק הבא**: [פרק 8: דפוסי ייצור וארגוניים](../chapter-08-production/production-ai-practices.md)
- **🤖 קשור**: [פרק 2: פיתוח מבוסס בינה מלאכותית](../chapter-02-ai-development/microsoft-foundry-integration.md)

מדריך כולל זה לפתרון תקלות מטפל בבעיות נפוצות בהטמעת פתרונות בינה מלאכותית עם AZD, ומספק פתרונות וטכניקות ניפוי שגיאות ייחודיות לשירותי בינה מלאכותית של Azure.

> **היקף:** הפקודות משתמשות בשמות משאבים לדוגמה; החליפו אותם ובחרו את המנוי הנכון. בלוקי Bicep הם קטעים להוספה לתבנית קיימת, לא פריסות עצמאיות. קטעי Python דורשים את ה-SDKים והגדרות האפליקציה המצוינים. לא בוצעה פריסת Azure חיה לסקירה זו.

## תוכן עניינים

- [בעיות בשירות Microsoft Foundry Models](#microsoft-foundry-models-service-issues)
- [בעיות בחיפוש ב-Azure AI](#azure-ai-search-problems)
- [בעיות בפריסת אפליקציות מכולות](#container-apps-deployment-issues)
- [שגיאות אימות והרשאות](#authentication-and-permission-errors)
- [כישלונות בפריסת מודלים](#model-deployment-failures)
- [בעיות ביצועים והקנה מידה](#performance-and-scaling-issues)
- [ניהול עלויות ומכסים](#cost-and-quota-management)
- [כלי וטכניקות ניפוי שגיאות](#debugging-tools-and-techniques)

## בעיות בשירות Microsoft Foundry Models

### בעיה: שירות OpenAI אינו זמין באזור

**תסמינים:**
```
Error: The requested resource type is not available in the location 'westus'
```

**סיבות:**
- שירות Microsoft Foundry Models אינו זמין באזור הנבחר
- מכסת משאבים אזלה באזורים המועדפים
- מגבלות קיבולת אזוריות

**פתרונות:**

1. **בדיקת זמינות אזור:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **עדכון תצורת AZD:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **שימוש באזורים חלופיים:**
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

### בעיה: חריגה במכסת פריסת מודל

**תסמינים:**
```
Error: Deployment failed due to insufficient quota
```

**פתרונות:**

1. **בדיקת מכסה נוכחית:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **בקשת הגדלת מכסה:**
השתמשו בתהליך ניהול המכסים בפורטל Foundry עבור המנוי, האזור, המודל וסוג הפריסה המושפעים. ראו את [הנחיות המכסה הרשמיות](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). בקשת מכסת VM אינה מגדילה את מכסת המודל.

3. **אופטימיזציה של קיבולת המודל:**
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

### בעיה: גרסת API שגויה

**תסמינים:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**פתרונות:**

1. **שימוש בגרסת API נתמכת:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **בדיקת תאימות גרסת API:**
בדוק את [הפנייה למחזור החיים של Azure OpenAI API](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). גרסאות API של ספקי משאבים ARM **אינן** כוללות גרסאות API של מישורי אינפרנס/נתונים. לקוחות חדשים מגרסת v1 משתמשים ב-`/openai/v1/` ללא `api-version` מתוארך; אין לערבב בין שתי תצורות הלקוח.

## בעיות בחיפוש AI של Azure

### בעיה: רמת תמחור של שירות החיפוש לא מספקת

**תסמינים:**
```
Error: Semantic search requires Basic tier or higher
```

**פתרונות:**

1. **השתמש ברמת תמחור שנתמכת:**

המדרג הסמנטי דורש Basic או גבוה יותר. מעבר מ-Free/Basic לרמה אחרת עשוי לדרוש יצירת שירות חיפוש חדש ובניית אינדקסים מחדש; עריכת SKU אינה שדרוג מובטח במקום.
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

**תסמינים:**
```
Error: Cannot create index, insufficient permissions
```

**פתרונות:**

1. **וודא את מפתחות שירות החיפוש:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **בדוק את סכמת האינדקס:**
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

3. **השתמש בזהות מנוהלת:**
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

## בעיות בפריסת Container Apps

### בעיה: כישלונות בבנייה של המכולה

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

3. **הוסף בדיקת בריאות:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### בעיה: כישלונות באתחול אפליקציית המכולה

**תסמינים:**
```
Error: Container failed to start within timeout period
```

**פתרונות:**

1. **העלה את חביון האתחול:**
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

2. **אופטימיזציה של טעינת המודל:**
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

## שגיאות אימות והרשאות

### בעיה: סירוב הרשאות זהות מנוהלת

**תסמינים:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**פתרונות:**

1. **וודא הקצאות תפקיד:**
```bash
# Check current role assignments
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

3. **בדוק אימות:**
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

רכישת אסימון מוכיחה אימות, לא הרשאה להפעיל מודל. בדוק את הפעולה המתוכננת בנפרד. מקומית, `DefaultAzureCredential` עשוי להשתמש באישורי מפתח; ב-Azure, ודא שהזהות המנוהלת המתאימה נבחרה.

### בעיה: סירוב גישה ל-Key Vault

**תסמינים:**
```
Error: The user, group or application does not have secrets get permission
```

**פתרונות:**

1. **הענק הרשאות ל-Key Vault:**

השתמש בקטע מדיניות הגישה הבא רק עבור כספת עם `enableRbacAuthorization: false`. עבור כספה עם RBAC מופעל, השתמש באפשרות 2; הוספת מדיניות גישה אינה מעניקה גישה למישור הנתונים במצב RBAC.
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

הכספה חייבת לכלול `enableRbacAuthorization: true`; שינוי מודלי הרשאות דורש תכנון הגירה של גישת המשתמשים הקיימים.
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

## כישלונות פריסת מודלים

### בעיה: גרסת מודל לא זמינה

**תסמינים:**
```
Error: Model version 'gpt-4-32k' is not available
```

**פתרונות:**

1. **בדוק דגמים זמינים:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **בחר במפורש מודל זמין:**
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

3. **אמת את המודל לפני פריסה:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## בעיות ביצועים והרחבה

### בעיה: תגובות עם זמן השהייה גבוה

**תסמינים:**
- זמני תגובה > 30 שניות
- שגיאות חביון
- חוויית משתמש ירודה

**פתרונות:**

1. **הגדר חביוני בקשות:**
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

2. **הוסף מטמון תגובה:**
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

3. **כונן הרחבה אוטומטית:**
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

### בעיה: שגיאות זיכרון מלא

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

## ניהול עלויות ומקצבים

### בעיה: עלויות גבוהות בלתי צפויות

**תסמינים:**
- חשבון Azure גבוה מהצפוי
- שימוש באסימונים חורג מהערכות
- התראות תקציב הופעלו

**פתרונות:**

1. **ממש בקרות עלויות:**
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

מונה בזיכרון זה הוא להמחשה בלבד, אינו שליטה על הוצאה חודשית: הוא מאופס בהפעלה מחדש, אינו משותף בין שכפולים, ובודק שימוש רק לאחר קריאה. גבול אמיתי דורש רישום עמיד, שמירת הזמנות בטוחות מפני גישה בו-זמנית לפני בקשות, ומדיניות איפוס חודשית. מדדי זיכרון של מכולות חייבים גם להתחשב במגבלות cgroup; `psutil.virtual_memory()` אינו מדד אמין למגבלת מכולה, ואיסוף פסולת אינו מאכף הגבלת זיכרון.

2. **הגדר התראות עלויות:**
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

הכרז את `budgetStartDate` ו-`budgetEndDate` בתבנית שלך. תקציבים מודיעים; הם לא עוצרים משאבים או מכתיבים גבול הוצאה קשיח.

3. **אופטימיזציה בבחירת מודלים:**
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

## כלי וטכניקות דיבאג

### פקודות דיבאג של AZD

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

### פקודות הרחבת AZD AI לאבחון

אם פרסת סוכנים באמצעות `azd ai agent init`, כלים נוספים אלו זמינים:

```bash
# Ensure the agents extension is installed
azd extension install azure.ai.agents

# Check project storage permissions and agent configuration
azd ai agent doctor

# Inspect the deployed endpoint
azd ai agent endpoint show

# Use the MCP server to let AI tools query project state
azd mcp start

# Generate infrastructure files for review and audit
azd infra generate
```

> **טיפ:** השתמש ב-`azd infra generate` כדי לכתוב IaC לדיסק כדי שתוכל לבדוק בדיוק אילו משאבים הוקצו. זה יקר ערך בעת איתור בעיות תצורת משאבים. ראה את [הפנייה ל-AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) לפרטים מלאים.

**אבחון מודע שחרור (4-11-2026):** סוכנים ב-`1.0.0-beta.23` דורשים `azd >= 1.37.0`; לשדרג את ממשק הפקודה המרכזי לפני הרחבות לא תואמות. שחרור סוכן זה שומר על אזהרות RBAC של מפתחי תוכנה בפלט פריסת הסוף ומזהה את גרסת הכשלונות/חביונים. חביון לא מבסס כישלון פריסה: בדוק את הגרסה שניסית לפני ניסיון חוזר. משפר גם קריאות A2A 0.3 המראות הודעות מחזור חיים במקום תשובות שלמות. ליבת `azd 1.37.1` מתקנת הפצת ביטול בין הרחבות; `1.37.2` משפר אישורי פריסה קריטיים וטיפול בביטולים.

אם פקודת הערכה של מדריך ישן מדפיסה רק הנחיות הגירה, התקן את `azure.ai.evaluations` (`1.0.0-beta.2` דורש `azd >= 1.33.0`) והשתמש ב-`azd ai eval init`, `generate` ו-`run start`. קובצי הערכת אופטימיזציה ב-`--config` אינם תומכים עוד בקבצי הערכה ישנים. ראה [הגירת הערכה](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) ו-[הגירת אופטימיזציה](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### דיבאג אפליקציה

1. **רישום מובנה:**
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

2. **נקודות קצה של בדיקת בריאות:**
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

## קודי שגיאה ופתרונות נפוצים

| קוד שגיאה | תאור | פתרון |
|------------|-------------|----------|
| 401 | ללא הרשאה | בדוק מפתחות API ותצורת זהות מנוהלת |
| 403 | אסור | אמת הקצאות תפקיד RBAC |
| 429 | מוגבל בקצב | יישם לוגיקת ניסיון חוזר עם תגמול מעריכי |
| 500 | שגיאת שרת פנימית | בדוק סטטוס פריסת מודל ורשומות |
| 503 | שירות לא זמין | אמת בריאות שירות וזמינות אזורית |

## השלבים הבאים

1. **סקור את [מדריך פריסת מודל AI](../chapter-02-ai-development/ai-model-deployment.md)** לפרקטיקות פריסה מיטביות
2. **השלים את [פרקטיקות AI לייצור](../chapter-08-production/production-ai-practices.md)** לפתרונות מוכנים לארגון
3. **הצטרף ל-[Microsoft Foundry Discord](https://aka.ms/foundry/discord)** לתמיכה קהילתית
4. **דווח על בעיות** במאגר [AZD GitHub](https://github.com/Azure/azure-dev) לבעיות ספציפיות ל-AZD

## משאבים

- [פתרון בעיות מקצבים ומגבלות Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [פתרון בעיות Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [פתרון בעיות Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**מיומנות סוכן אבחון Azure**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - התקן מיומנויות פתרון בעיות Azure בעורך שלך: `npx skills add microsoft/github-copilot-for-azure`

---

**ניווט פרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 7 - פתרון בעיות ודיבאג
- **⬅️ הקודם**: [מדריך דיבאג](debugging.md)
- **➡️ הפרק הבא**: [פרק 8: תבניות לייצור וארגון](../chapter-08-production/production-ai-practices.md)
- **🤖 קשור**: [פרק 2: פיתוח AI ראשון](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 הפנייה**: [פתרון בעיות Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->