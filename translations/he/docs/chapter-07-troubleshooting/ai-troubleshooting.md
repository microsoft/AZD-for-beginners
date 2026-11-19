# מדריך פתרון בעיות ספציפי ל-AI

**ניווט בפרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 7 - פתרון בעיות וניפוי שגיאות
- **⬅️ קודם**: [מדריך לניפוי שגיאות](debugging.md)
- **➡️ הפרק הבא**: [פרק 8: תבניות ייצור וארגוניות](../chapter-08-production/production-ai-practices.md)
- **🤖 קשור**: [פרק 2: פיתוח במיקוד AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

מדריך פתרון הבעיות המקיף הזה מתמודד עם בעיות נפוצות בפריסת פתרונות AI עם AZD, ומספק פתרונות וטכניקות ניפוי שגיאות ספציפיות לשירותי Azure AI.

> **היקף:** הפקודות משתמשות בשמות משאבים לדוגמה; החלף אותם ובחר את המנוי הנכון. קטעי Bicep הם פרגמנטים למיזוג לתבנית קיימת, לא פריסות עצמאיות. קטעי פייתון דורשים את ה-SDKים שהוזכרו ואת תצורת האפליקציה. לא בוצעה פריסת Azure חיה לסקירה זו.

## תוכן העניינים

- [בעיות שירות Microsoft Foundry Models](#microsoft-foundry-models-service-issues)
- [בעיות חיפוש Azure AI](#azure-ai-search-problems)
- [בעיות פריסת Container Apps](#container-apps-deployment-issues)
- [שגיאות אימות והרשאה](#authentication-and-permission-errors)
- [כשלונות פריסת מודל](#model-deployment-failures)
- [בעיות ביצועים וקנה מידה](#performance-and-scaling-issues)
- [ניהול עלות ומכסה](#cost-and-quota-management)
- [כלי וטכניקות ניפוי שגיאות](#debugging-tools-and-techniques)

## בעיות שירות Microsoft Foundry Models

### בעיה: שירות OpenAI לא זמין באזור

**תסמינים:**
```
Error: The requested resource type is not available in the location 'westus'
```

**גורמים:**
- שירות Microsoft Foundry Models לא זמין באזור שנבחר
- מכסת שימוש אזורית מנוצלת
- מגבלות קיבולת אזוריות

**פתרונות:**

1. **בדוק זמינות האזור:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **עדכן את תצורת AZD:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **השתמש באזורים חלופיים:**
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

### בעיה: חריגת מכסת פריסת מודל

**תסמינים:**
```
Error: Deployment failed due to insufficient quota
```

**פתרונות:**

1. **בדוק את המכסה הנוכחית:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **בקשת הגדלת מכסה:**
השתמש בזרימת העבודה לניהול מכסות בפורטל Foundry עבור המנוי, האזור, המודל וסוג הפריסה המושפעים. ראה את [ההנחיות הרשמיות למכסה](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). בקשת מכסת VM אינה מגדילה את מכסת המודל.

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

### בעיה: גרסת API לא חוקית

**תסמינים:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**פתרונות:**

1. **השתמש בגרסת API נתמכת:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **בדוק תאימות גרסת API:**
בדוק את [הפניות למחזור חיי Azure OpenAI API](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). גרסאות API של ספק המשאבים ARM **אינן** מציגות גרסאות של API למישור ההסקה/הנתונים. לקוחות v1 חדשים משתמשים ב-`/openai/v1/` ללא `api-version` מתוארך; אל תערבב בין שתי הגדרות הלקוח.

## בעיות בחיפוש של Azure AI

### בעיה: שכבת תמחור של שירות החיפוש אינה מספקת

**תסמינים:**
```
Error: Semantic search requires Basic tier or higher
```

**פתרונות:**

1. **השתמש בשכבת תמחור הנתמכת:**

ראנק Semantic דורש Basic או יותר. מעבר מ-Free/Basic לשכבה אחרת עשוי לדרוש יצירת שירות חיפוש חדש ובניית אינדקסים מחדש; עריכת SKU אינה שדרוג מובטח במקום.
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

2. **השבת חיפוש סמנטי (פיתוח):**
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

## בעיות בפריסת אפליקציות מכולות

### בעיה: כישלונות בבניית המכולה

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

2. **אמת את התלויות:**
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

### בעיה: כישלונות בהפעלת אפליקציית המכולה

**תסמינים:**
```
Error: Container failed to start within timeout period
```

**פתרונות:**

1. **הגדל את זמן ההמתנה להפעלה:**
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

2. **אופטימיזציה לטעינת מודל:**
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

### בעיה: הרשאת זהות מנוהלת נדחתה

**תסמינים:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**פתרונות:**

1. **אמת את הקצאת התפקידים:**
```bash
# Check current role assignments
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

רכישת אסימון מוכיחה אימות, לא הרשאה להפעיל מודל. בדוק את הפעולה המיועדת בנפרד. מקומית, `DefaultAzureCredential` עשוי להשתמש באישורי מפתח; ב-Azure, אמת שהזיהוי המנוהל המיועד נבחר.

### בעיה: גישה לארנק מפתחות נדחית

**תסמינים:**
```
Error: The user, group or application does not have secrets get permission
```

**פתרונות:**

1. **הענק הרשאות לארנק מפתחות:**

השתמש בקטע מדיניות הגישה הבא רק עבור ארנק עם `enableRbacAuthorization: false`. עבור ארנק המופעל ב-RBAC, השתמש באופציה 2; הוספת מדיניות גישה אינה מעניקה גישה למישור הנתונים במצב RBAC.
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

הארנק חייב להיות עם `enableRbacAuthorization: true`; שינוי מודלי הרשאות מחייב תכנון מעבר של גישה קיימת.
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

## כישלונות בפריסת מודלים

### בעיה: גרסת מודל לא זמינה

**תסמינים:**
```
Error: Model version 'gpt-4-32k' is not available
```

**פתרונות:**

1. **בדוק את המודלים הזמינים:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **בחר מפורש מודל זמין:**
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

3. **אמת את המודל לפני הפריסה:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## בעיות ביצועים והרחבה

### בעיה: תגובות עם השהייה גבוהה

**תסמינים:**
- זמני תגובה מעל 30 שניות
- שגיאות Timeout
- חוויית משתמש לקויה

**פתרונות:**

1. **יישום הגבלת זמן לבקשות:**
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

### בעיה: שגיאות Out of Memory

**תסמינים:**
```
Error: Container killed due to memory limit exceeded
```

**פתרונות:**

1. **הגדלת הקצאת הזיכרון:**
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

## ניהול עלויות ומנות

### בעיה: עלויות גבוהות בלתי צפויות

**תסמינים:**
- חשבון Azure גבוה מהצפוי
- שימוש בטוקנים העולה על ההערכות
- מפעילי התקני תקציב הופעלו

**פתרונות:**

1. **יישום בקרות עלות:**
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

מונה בזיכרון זה הוא להמחשה בלבד, לא בקרת הוצאה חודשית: הוא מאופס באתחול, אינו משותף בין שכפולים, ובודק שימוש רק לאחר קריאה. הגבלה אמיתית דורשת הנהלת חשבונות עמידה, הזמנות בטוחות מול תחרות לפני בקשות, ומדיניות איפוס חודשית. מדדי זיכרון מכולות חייבים גם להתחשב במגבלות cgroup; `psutil.virtual_memory()` אינו מדידה אמינה של מגבלת מכולה, ואיסוף זבל אינו אוכף גבול זיכרון.

2. **הגדרת התראות על עלויות:**
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

הכרז על `budgetStartDate` ו-`budgetEndDate` בתבנית שלך. תקציבים מודיעים; הם אינם עוצרים משאבים או מטילים גבול הוצאה קשיח.

3. **אופטימיזציה של בחירת מודל:**
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

## כלים וטכניקות לניפוי שגיאות

### פקודות ניפוי שגיאות של AZD

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

אם פרסת סוכנים באמצעות `azd ai agent init`, כלים נוספים אלה זמינים:

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

> **טיפ:** השתמש ב-`azd infra generate` כדי לכתוב IaC לדיסק כדי שתוכל לבדוק בדיוק אילו משאבים הופעלו. זה יקר ערך כאשר מתבצעת ניפוי שגיאות בהגדרת המשאבים. ראה את [הפניות AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) לפרטים מלאים.

**אבחון של זרימת GA (2026-11-09):** ודא ש-`azd version` הוא לפחות 1.37.0 ובדוק את `azd ext list --installed`. עדכן תחילה את ה-CLI הראשי עם `azd update` או המתאם שלו, ואז עדכן את החבילה עם `azd ext upgrade microsoft.foundry`. עבור כשלונות מקומיים, בדוק את uv הנוכחי, Python 3.13+ לדוגמה הבסיסית, `PYTHONNOUSERSITE: "1"` בקונפיגורציית השירות שלו, ואת האישורים של Azure בהם משתמש `DefaultAzureCredential`. השאר את `azd ai agent run` פועל בעת הפעלת `--local` מטרמינל שני בתיקיית הפרויקט.

הצלחת פריסה אינה מוכיחה שלמפתח יש גישה למישור הנתונים. בדוק אזהרות RBAC ואת [מטריצת ההרשאות של הסוכן המאוחסן](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions). Timeout אינו מעיד על כישלון פריסה: בדוק את הגרסה שניסו והרשומות לפני ניסיון חוזר. סוכנים מוקדמים beta.23 שיפרו את האזהרות האלה ואת פלט ה-A2A; תיקונים היסטוריים אלו מתוארים ב[הערות השחרור](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes), ואינם חובה להתקנת הבטא.

אם `azd ai eval` אינו זמין, התקן את `azure.ai.evaluations` בנפרד; חבילת GA אינה כוללת אותו. אם הפקודה agent-evaluation של מדריך ישן רק מציגה הנחיות למעבר, השתמש בזרימת העבודה הנפרדת `azd ai eval`. `--config` של האופטימיזציה כבר אינו מקבל קבצי הערכה ישנים. ראה [המרת הערכה](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) ו[המרת אופטימיזציה](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### איתור באגים באפליקציה

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

2. **נקודות בדיקת בריאות:**
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

## קודי שגיאה נפוצים ופתרונות

| קוד שגיאה | תיאור | פתרון |
|------------|-------------|----------|
| 401 | לא מורשה | בדוק את מפתחות ה-API ותצורת הזיהוי המנהל |
| 403 | אסור | אמת את הקצאות התפקידים ב-RBAC |
| 429 | מוגבל קצב | מיישם לוגיקת ניסיון חוזר עם תגבור אקספוננציאלי |
| 500 | שגיאת שרת פנימית | בדוק את מצב פריסת המודל ואת היומנים |
| 503 | שירות לא זמין | אמת את בריאות השירות וזמינות איזורית |

## השלבים הבאים

1. **סקור את [מדריך פריסת מודל AI](../chapter-02-ai-development/ai-model-deployment.md)** לפרקטיקות פריסה מיטביות
2. **השלם את [פרקטיקות AI לייצור](../chapter-08-production/production-ai-practices.md)** לפתרונות מוכנים לארגון
3. **הצטרף ל[Microsoft Foundry Discord](https://aka.ms/foundry/discord)** לתמיכה קהילתית
4. **הגש בעיות** ל[מאגר GitHub של AZD](https://github.com/Azure/azure-dev) לבעיות ספציפיות ל-AZD

## משאבים

- [פתרון בעיות הקצאות והגבלת קצב ב-Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [פתרון בעיות Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [פתרון בעיות Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - התקן מיומנויות פתרון בעיות של Azure בעורך שלך: `npx skills add microsoft/github-copilot-for-azure`

---

**ניווט בפרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 7 - פתרון בעיות ואיתור באגים
- **⬅️ קודם**: [מדריך איתור באגים](debugging.md)
- **➡️ פרק הבא**: [פרק 8: דפוסי ייצור וארגון](../chapter-08-production/production-ai-practices.md)
- **🤖 קשור**: [פרק 2: פיתוח תוך התמקדות ב-AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 הפניה**: [פתרון בעיות Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->