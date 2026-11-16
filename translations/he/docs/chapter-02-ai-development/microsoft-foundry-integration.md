# אינטגרציה של Microsoft Foundry עם AZD

**ניווט בפרקים:**
- **📚 דף הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 2 - פיתוח AI-ראשון
- **⬅️ פרק קודם**: [פרק 1: הפרויקט הראשון שלך](../chapter-01-foundation/first-project.md)
- **➡️ הבא**: [סוכני AI](agents.md)
- **🚀 הפרק הבא**: [פרק 3: קונפיגורציה](../chapter-03-configuration/configuration.md)

## סקירה כללית

מדריך זה מדגים כיצד לשלב את שירותי Microsoft Foundry עם Azure Developer CLI (AZD) לפריסות יישומי AI זריזות. Microsoft Foundry מספקת פלטפורמה מקיפה לבניית, פריסה וניהול של יישומי AI, בעוד ש-AZD מפשטת את תהליך התשתית והפריסה.

## מה זה Microsoft Foundry?

Microsoft Foundry היא הפלטפורמה המאוחדת של מיקרוסופט לפיתוח AI הכוללת:

- **קטלוג מודלים**: גישה למודלים המתקדמים ביותר של AI
- **Prompt Flow**: מעצב חזותי לזרימות עבודה של AI
- **פורטל Microsoft Foundry**: סביבת פיתוח משולבת ליישומי AI
- **אפשרויות פריסה**: אפשרויות אירוח והתאמת גודל מרובות
- **בטיחות ואבטחה**: תכונות AI אחראיות משולבות

## AZD + Microsoft Foundry: טובים ביחד

| תכונה | Microsoft Foundry | יתרון האינטגרציה עם AZD |
|---------|-----------------|------------------------|
| **פריסת מודל** | פריסה ידנית דרך הפורטל | פריסות אוטומטיות וניתנות לחזרה |
| **תשתית** | פרוביז'ן בלחיצת כפתור | תשתית כקוד (Bicep) |
| **ניהול סביבה** | מיקוד בסביבה יחידה | סביבות מרובות (פיתוח/בדיקה/פרוד) |
| **אינטגרציית CI/CD** | מוגבל | תמיכה מקורית ב-GitHub Actions |
| **ניהול עלויות** | ניטור בסיסי | אופטימיזציית עלויות לפי סביבה |

## דרישות מוקדמות

- מנוי Azure עם הרשאות מתאימות
- Azure Developer CLI מותקן
- גישה לשירותי Microsoft Foundry Models
- היכרות בסיסית עם Microsoft Foundry

> **סקירת גרסה (2026-11-04):** ההנחיות של AI CLI נבדקו מול התיעוד/המקור של `azd` `1.37.2`, סוכנים `1.0.0-beta.23`, והערכות `1.0.0-beta.2`. השתמש ב-`azd >= 1.37.0` לזרימת העבודה המשולבת. ראה [שינויים ותיקונים בגרסה](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); סקירה זו אינה מאשרת כל תבנית או דוגמה ב-SDK ביחס לפריסה חיה.

## תבניות אינטגרציה עיקריות

**תחום הדוגמאות:** קובץ ה-Bicep למטה כולל קטעי משאבים להמחשה, לא תבנית מלאה לפריסה. התבנית הכוללת חייבת להגדיר שמות, `location`, משאבים שנעשה בהם שימוש, זהויות, פלטים ואירוח היישום. השתמש בדוגמא מקושרת כנקודת התחלה להפעלה. דוגמאות Bash דורשות אימות ב-Azure CLI בנפרד מ-`azd auth login`.

### תבנית 1: אינטגרציית מודלים של Microsoft Foundry

**מקרה שימוש**: פריסת יישומי צ'אט עם מודלים של Azure OpenAI ב-Microsoft Foundry

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

**תשתית (main.bicep):**
```bicep
// Microsoft Foundry Models Account
resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAIAccountName
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: openAIAccountName
    disableLocalAuth: true
  }
}

// Deploy GPT model
resource gptDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAIAccount
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30 // 30,000 TPM for this text-model deployment type
  }
}
```

למתקשר נדרשת זהות מנוהלת מצורפת ו-`Cognitive Services OpenAI User` ברמת חשבון; השבתת מפתחות אינה מעניקה גישה. אמת זמינות אזור/מודל/SKU וכן מכסה לפני פריסה.

### תבנית 2: אינטגרציית חיפוש AI + RAG

**מקרה שימוש**: פריסת יישומי יצירה מובנים בהשלמת שליפה (RAG)

```bicep
// Azure AI Search
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
  sku: {
    name: 'basic'
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
  }
}

```

אין משאב ARM מסוג `Microsoft.Search/searchServices/dataConnections` לאינטגרציה זו. הגדר אינדקס חיפוש, מקור נתונים, אינדקסר/מערך מיומנויות או וקטורייזר דרך ממשקי ה-API של Search data-plane הנתמכים. אם Search קורא למודל הטמעה, הפעל את זהות המנוהלת שלו, הענק את תפקיד המודל הרלוונטי והגדר את מיומנות ההטמעה/וקטורייזר שלו. ראה [וקטוריזציה משולבת](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### תבנית 3: אינטגרציית בינה מסמכים

**מקרה שימוש**: זרימות עבודה לעיבוד וניתוח מסמכים

```bicep
// Document Intelligence service
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: documentIntelligenceName
  }
}

// Storage for document processing
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
  }
}
```

## 🔧 תבניות קונפיגורציה

### הגדרת משתני סביבה

למעט הגדרות AZD מתועדות כגון `AZURE_LOCATION`, אלה הן **שמות קלט מותאמים-תבנית**. אין להם השפעה אלא אם כן התבנית/היישום משתמש בהן דרך מיפוי פרמטרים וסביבת מארח. ל-`azure-search-openai-demo`, השתמש בשמות האמיתיים שלו כמו `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` ו-`AZURE_SEARCH_SERVICE_SKU` במקום זאת. קיבולת המודל אינה SKU של החשבון.

**קונפיגורציית פרודקשן:**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**קונפיגורציית פיתוח:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### קונפיגורציה מאובטחת עם Key Vault

העדף Entra ID עם אימות מקומי למפתחות מושבת. הבא הוא רק **אלטרנטיבה ישנה לאימות מפתח** עבור יישומים שדורשים מפתחות: נדרש חשבון עם אימות מפתח מופעל, זהות היישום מצורפת למארח שלו וגישה/רשת פעילה ל-Key Vault. אל תשלב אחזור מפתחות עם `disableLocalAuth: true` ותחכה לקריאות מפתח לעבוד.

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    enableRbacAuthorization: false // This fragment deliberately uses access policies
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: [
      {
        tenantId: tenant().tenantId
        objectId: webAppIdentity.properties.principalId
        permissions: {
          secrets: ['get']
        }
      }
    ]
  }
}

// Store OpenAI key securely
resource openAIKeySecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'openai-api-key'
  properties: {
    value: openAIAccount.listKeys().key1
  }
}
```

## זרימות עבודה לפריסה

### תוספים ל-AZD עבור Foundry

AZD מספק תוספים המוסיפים יכולות ייחודיות ל-AI לעבודה עם שירותי Microsoft Foundry:

```bash
# Install the Foundry agents extension
azd extension install azure.ai.agents

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# List installed extensions
azd extension list --installed

# Inspect the currently installed agent extension version
azd extension show azure.ai.agents
```

תוספי AI עדיין מתפתחים במהירות בגרסת התצוגה המקדימה. אם פקודה מתנהגת שונה מהמאור כאן, שדרג את התוסף המתאים לפני פתרון בעיות בפרויקט עצמו.

### פריסת סוכן-ראשון עם `azd ai`

השתמש ב-`azd ai agent init` באופן אינטראקטיבי, או אימץ תבנית פרויקט סוכן `azure.yaml` עדכנית מקושרת ל-Foundry Agent Service:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` מחליף את איות הישן `--manifest`/`-m`; עדיין נדרשת הגירת מני-פסט ותצורת סוכן מקוננת ישנה. הערך סוכנים עם `azd ai eval` מ-`azure.ai.evaluations`, לא את זרימת העבודה הישנה שנמחקה. ראה [הגירת הערכה](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) להקמה, ביצוע ותוצאות.

ראה [פקודות AI CLI של AZD](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) לקבלת הפנייה מלאה לדגלים ופקודות.

### פריסה בפקודה יחידה

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### פריסות ספציפיות לסביבה

```bash
# Development environment
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Production environment
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## ניטור ותצפית

### אינטגרציית Application Insights

```bicep
// Application Insights for AI application monitoring
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

// Custom metrics for AI operations
```

זה מגדיר משאב Insights, לא אימות טלמטריה. ברגע שהאפליקציה שלך מפיקה ריצות קריאה למודל, הרץ את השאילתה המדגימה הזאת בלוגים של Application Insights (התאם את המסנן לשמות הריצות האמיתיים שלך):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### ניטור עלויות

```bicep
// Supply the first day of the current UTC month, e.g. 2026-11-01T00:00:00Z.
param budgetStartDate string

// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
    }
    timeGrain: 'Monthly'
    amount: 500
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@company.com'
        ]
      }
    }
  }
}
```

השתמש בנמען אמיתי ואמת הרשאות תחום חיוב. תקציב שולח התראות; אינו מגבלת הוצאה.

## 🔐 מיטב פרקטיקות אבטחה

### הגדרת זהות מנוהלת

```bicep
// Managed identity for the web application
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: '${appName}-identity'
  location: location
}

// Assign OpenAI User role
resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id, 'Cognitive Services OpenAI User')
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
    principalType: 'ServicePrincipal'
  }
}
```

### אבטחת רשת

קטע נקודת הקצה גם דורש אזור/קבוצה פרטית ב-DNS, קישורי VNet, חיבוריות יישום ל-VNet, ומדיניות גישה ציבורית מפורשת. יצירת נקודת קצה פרטית בלבד אינה מבטלת גישה לציבור.

```bicep
// Private endpoints for AI services
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: '${openAIAccountName}-pe'
  location: location
  properties: {
    subnet: {
      id: virtualNetwork.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

## אופטימיזציית ביצועים

### אסטרטגיות מטמון

```yaml
# azure.yaml - Redis cache integration
services:
  api:
    project: ./api
    host: containerapp
    env:
      REDIS_CONNECTION_STRING: ${REDIS_CONNECTION_STRING}
      CACHE_TTL: "3600"
```

```bicep
// Existing Azure Cache for Redis example; use Azure Managed Redis for new designs.
resource redisCache 'Microsoft.Cache/redis@2023-04-01' = {
  name: redisCacheName
  location: location
  properties: {
    sku: {
      name: 'Basic'
      family: 'C'
      capacity: 1
    }
    enableNonSslPort: false
    minimumTlsVersion: '1.2'
  }
}
```

Azure Cache for Redis Basic/Standard/Premium נמצא ב-[תהליך פרישה](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); השתמש ב-Azure Managed Redis לפריסות חדשות ופעל לפי הנחיות התבנית/אימות העדכניות שלו. הגבל תוצאות AI שמורות לפי הרשאות, מודל/הוראות וגרסת נתונים, עם תוקף; אל תשתף תוצאות פרטיות בלבד עם טקסט השאילתה.

### קונפיגורציית התאמת גודל אוטומטית

**משאב חלקי:** שלב הגדרות אלה למדרג/כניסה לאפליקציית מכולה מלאה עם סביבה מנוהלת, תמונת מכולה ומגבלות משאבים. שכפולים נוספים אינם מגדילים מכסת מודל.

```bicep
// Container App with auto-scaling
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: containerAppName
  location: location
  properties: {
    configuration: {
      ingress: {
        external: true
        targetPort: 8000
      }
    }
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-scaling'
            http: {
              metadata: {
                concurrentRequests: '30'
              }
            }
          }
        ]
      }
    }
  }
}
```

## פתרון בעיות נפוצות

### בעיה 1: חריגה ממכסת OpenAI

**תסמינים:**
- הפריסה נכשלת עם שגיאות מכסה
- שגיאות 429 בלוג האפליקציה

**פתרונות:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try a different region in a NEW disposable environment, not by moving resources
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the ORIGINAL environment before reducing its capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision
```

משתנה הקיבולת מעלה חל רק על תבנית מותאמת שמשתמשת בו. עבור הדוגמה RAG, השתמש ב-`AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. אל תשנה את `AZURE_LOCATION` להזזת משאבים קיימים; צור סביבה נפרדת לאזור חדש ותכנן הגירה/ניקוי.

### בעיה 2: כשלים באימות

**תסמינים:**
- שגיאות 401/403 בעת קריאת שירותי AI
- הודעות "Access denied"

**פתרונות:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### בעיה 3: בעיות בפריסת מודל

**תסמינים:**
- מודלים לא זמינים בפריסה
- גרסאות מודל ספציפיות נכשלות

**פתרונות:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## תבניות דוגמא

אלו חלופות, לא פקודות עוקבות. התחל כל אחת בתיקיה ריקה נפרדת. היעד המפורש `.` שומר את האתחול בתיקייה הנוכחית שלך; אחרת AZD הנוכחי יכול ליצור תת-תיקיה בשם תבנית ללא שינוי תיקיית העבודה שלך בטרמינל.

### יישום צ'אט RAG (Python)

**מאגר**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**שירותים**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**תיאור**: יישום התייחסות צ'אט RAG לשאלות על המסמכים שלך, עם שליפת Azure AI Search. בדוק את המודלים הנתמכים בדוגמה הנוכחית, תכונות אופציונליות, הנחיות עלות, והקשחה לפרודקשן לפני שימוש; פריסת דוגמה אינה הופכת יישום למוכן פרודקשן.

**התחלה מהירה**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### יישום צ'אט RAG (.NET)

**מאגר**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**שירותים**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**תיאור**: המקבילה .NET/C# לדוגמת צ'אט RAG ב-Python. בנוי עם ASP.NET Core Minimal API ו-Frontend Blazor WebAssembly. כולל צ'אט קולי, תמיכה ב-GPT-4o-mini vision, ולקוח שולחן עבודה/נייד היברידי .NET MAUI Blazor.

**התחלה מהירה**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### יישום צ'אט RAG (Java)

**מאגר**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**שירותים**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**תיאור**: גרסת Java של דוגמת צ'אט RAG עם Langchain4J לאורקסטרציה של AI. תומך בארכיטקטורת מיקרו-שירותים מונעי אירועים, מספר אסטרטגיות חיפוש (טקסט, וקטור, היברידי), העלאת מסמכים עם Azure Document Intelligence, ופריסה ב-Azure Container Apps או Azure Kubernetes Service.

**התחלה מהירה**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### עוזר קופיילוט קמעונאי ארגוני עם Microsoft Foundry

**מאגר**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**שירותים**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**תיאור**: עוזר קופיילוט RAG קמעונאי מקצה לקצה באמצעות Microsoft Foundry ו-Prompty. צ'אטבוט של חנות הקמפינג Contoso מתבסס על קטלוג מוצר ונתוני הזמנות לקוח. ממחיש את זרימת העבודה המלאה של GenAIOps — אבטיפוס עם Prompty, הערכה עם מעריכי AI מסייעים ופריסה דרך AZD ל-Container Apps.

**התחלה מהירה**:
```bash
azd init --template contoso-chat .
azd up
```

### יישום כתיבה יצירתית עם סוכנים מרובי-סוכנים

**מאגר**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**שירותים**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**תיאור**: דוגמה מרובת סוכנים המדגימה אורקסטרציה של סוכני AI עם Prompty. משתמש במחקר סוכן (Bing Grounding בשירות הסוכנים של Azure AI), סוכן מוצר (Azure AI Search), סוכן כותב וסוכן עורך לשיתוף פעולה ביצירת מאמרים מחקריים. כולל CI/CD עם הערכה ב-GitHub Actions.

**התחלה מהירה**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### צ'אט RAG ללא שרת (JavaScript/TypeScript)

**מאגר**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**שירותים**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB עבור NoSQL + LangChain.js

**תיאור**: צ'אטבוט RAG ללא שרת מלא עם LangChain.js, Azure Functions עבור ה-API ו-Azure Static Web Apps לאירוח. משתמש ב-Azure Cosmos DB כמאגר וקטורים וכמאגר היסטוריית צ'אט. תומך בפיתוח מקומי עם Ollama לבדיקות ללא עלות.

**התחלה מהירה**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### מאיץ פתרון צ'אט עם הנתונים שלך

**מאגר**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**שירותים**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search עם Cosmos DB, או PostgreSQL עם pgvector

**תיאור**: מאיץ צ'אט מבוסס מסמכים עם הפניות. הדוגמה הנוכחית מארחת Frontend React, Backend FastAPI והעובד Functions לטיפול בנתונים על Container Apps; אפשרויות האורקסטרציה הן Agent Framework ו-LangGraph. אפשרויות מסד הנתונים/השליפה נבחרות בעת הפריסה. זה נקודת התחלה, לא מערכת הפקה מובנת; אל תניח שגרסאות ישנות של App Service, Semantic Kernel או Prompt Flow מתארות את ברירת המחדל העדכנית.

**התחלה מהירה**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### סוכני נסיעות AI — אורקסטרציה מרובת סוכנים MCP

**מאגר**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**שירותים**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + שרתי MCP (.NET, Python, Java, TypeScript)

**תיאור**: יישום התייחסות לארכיטקטורת AI מרובה סוכנים באמצעות שלוש מסגרות (LangChain.js, LlamaIndex.TS, ו-Microsoft Agent Framework). כולל שרתי MCP (Model Context Protocol) בארבעה שפות שהופעלו כאפליקציות Azure Container ללא שרת עם ניטור OpenTelemetry.

**התחלה מהירה**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **גלה תבניות נוספות**: בקר בגלריית התבניות המעולה של AZD AI [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) עבור תבניות זמינות כעת בשפות ותסריטים שונים. כל דוגמה מקושרת היא מאגר חיצוני, לא דוגמה מקומית שמסופקת על ידי הקורס; בדוק את הדרישות והמדריך לפרודוקציה הנוכחיים לפני פריסה.

## שלבים הבאים

1. **נסה את הדוגמאות**: התחל עם תבנית מוכנה מראש שמתאימה למקרה השימוש שלך
2. **התאם לצרכיך**: שנה את תשתית הקוד ויישום האפליקציה
3. **הוסף ניטור**: הטמע יכולות תצפית מקיפות
4. **אופטימיזציה של עלויות**: כוונן תצורות לפי התקציב שלך
5. **אבטח את הפריסה שלך**: הטמע דפוסי אבטחה ארגוניים
6. **הרחב לפרודוקציה**: הוסף יכולות מרובות-אזוריות וזמינות גבוהה

## 🎯 תרגילים מעשיים

### תרגיל 1: פריסת אפליקציית שיחה של Microsoft Foundry Models (30 דקות)
**מטרה**: פריסה ובדיקה של יישום שיחת AI לדוגמה

```bash
# Initialize template
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo .

# Set environment variables
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 30

# Deploy
azd up

# Test the application
azd show
# Open the web endpoint shown; do not assume a service name/JSON shape.

# Monitor AI operations
azd monitor

# Clean up
azd down --force --purge
```

**קריטריוני הצלחה:**
- [ ] הפריסה מושלמת ללא שגיאות הקצאה
- [ ] ניתן לגשת לממשק השיחה בדפדפן
- [ ] ניתן לשאול שאלות ולקבל תגובות מונעות AI
- [ ] Application Insights מציג נתוני טלמטריה
- [ ] משאבים נוקו בהצלחה

**עלות:** סקור את מדריך העלויות הנוכחי ואת ה-SKU שנבחרו לדוגמה לפני הפריסה. החיוב נמשך עד שמוחקים משאבים; אין הערכת זמן קבועה של 30 דקות לכל תצורה.

### תרגיל 2: תצורת פריסה מרובת מודלים (45 דקות)
**מטרה**: פריסת מספר מודלי AI עם תצורות שונות

**נקודת התחלה:** חשבון Azure OpenAI קיים ומודול resource-group של AZD שיכול לקרוא לקובץ זה. צור `infra/ai-models.bicep` עם התוכן הבא באמצעות העורך שלך. לא מתבצעת פריסה אוטומטית רק כי הוא תחת `infra/`.

```bicep
param openAiAccountName string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// gpt-4.1-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30
  }
}

// Text embedding for search
resource embedding 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'text-embedding-3-large'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 50
  }
  dependsOn: [gpt4omini]
}
```

מתוך מודול מנוהל ברמת resource-group השייך לחשבון, הוסף קריאת מודול (התאם את שם הסמל לחשבון האמיתי שלך):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

אין להכריז על אותן פריסות בשני המודולים. אם נקודת הכניסה של AZD היא ברמת המנוי, קרא לזה מתוך מודול המשנה ברמת resource-group והתאם את הנתיב היחסי. בנה את המודול המכיל עם `az bicep build --file <path-to-containing-module>`, ואז:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**קריטריוני הצלחה:**
- [ ] מספר מודלים הוצבו בהצלחה
- [ ] הוחלו הגדרות קיבולת שונות
- [ ] המודלים נגישים דרך ה-API
- [ ] ניתן לקרוא לשני המודלים מתוך האפליקציה

### תרגיל 3: יישום ניטור עלויות (20 דקות)
**מטרה**: הגדרת התראות תקציב ומעקב עלויות

**נקודת התחלה:** דפוס התקציב למעלה ומודול תשתית ברמת resource-group. הוסף משאב זה באמצעות העורך שלך; העבר `budgetStartDate` מהמיפוי הפרמטרים שלך (אל תכפיל את הפרמטר אם הוכרז בעבר). החלף את הנמען ואשר שיש לך גישה לכתיבת תקציב.

```bicep
param budgetStartDate string
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
    }
    timeGrain: 'Monthly'
    amount: 200
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: ['your-email@example.com']
      }
      notification2: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 100
        contactEmails: ['your-email@example.com']
      }
    }
  }
}
```

```bash
# Deploy budget alert
azd provision

# Verify the budget at its resource-group scope
az rest --method get \
  --url "https://management.azure.com/subscriptions/YOUR_SUB/resourceGroups/YOUR_RG/providers/Microsoft.Consumption/budgets/ai-monthly-budget?api-version=2024-08-01"
```

צפוי: התגובה מכילה את `amount: 200`, שני הספים, ואת הנמען שלך. בדוק את Cost Management בפורטל עבור חיובים בפועל; נתוני עלות מתעכבים ולכן לא בהכרח תופעל התראה בתרגיל קצר.

**קריטריוני הצלחה:**
- [ ] התראת תקציב נוצרה ב-Azure
- [ ] הודעות דואר אלקטרוני הוגדרו
- [ ] ניתן לצפות בנתוני העלות בפורטל Azure
- [ ] הספים של התקציב הוגדרו כראוי

## 💡 שאלות נפוצות

<details>
<summary><strong>איך אני מפחית עלויות של Microsoft Foundry Models במהלך הפיתוח?</strong></summary>

1. **בדוק תמחור**: אין קצבת חינם חודשית אוניברסלית של 50,000 טוקנים עבור מודלים ב-Azure OpenAI
2. **התאם קיבולת לגודל הנכון**: הקיבולת ב-`10` מייצגת בדרך כלל 10,000 TPM למודלים האלו מסוג טקסט סטנדרטי, לא 10 TPM. הפחתת מגבלת קצב זו לא מפחיתה את המחיר לטוקן
3. **השתמש ב'azd down'**: מחק משאבים מתכלים כשאינך מפתח באופן פעיל (זו לא שחרור משאבים)
4. **מטמיע מטמון תגובות**: הטמע מטמון Redis לשאלות חוזרות
5. **השתמש בהנדסת פקודות**: צמצם את השימוש בטוקנים באמצעות פקודות יעילות

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>מה ההבדל בין Microsoft Foundry Models ל-OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- אבטחה וציות ברמה ארגונית
- אינטגרציה עם רשת פרטית
- התחייבויות SLA
- אימות זהות מנוהל
- מכסות גבוהות יותר זמינות

**OpenAI API**: ספק / API נפרד עם זמינות מודלים, תמחור, אימות ואפשרויות קישור ארגוניות משלו. השווה את ההצעות הנוכחיות במקום להניח שזה רק באינטרנט ציבורי או ששולחים תמיד מודלים ראשונים.

בחר בהתאם לדרישות הארגון שלך; דוגמאות לזהות מנוהלת ספציפיות ל-Azure וקישור פרטי בקורס זה חלות על שירותי Azure בלבד, לא על כל מודל/ספק בספריית Foundry.
</details>

<details>
<summary><strong>איך אני מטפל בשגיאות חריגת מכסת Microsoft Foundry Models?</strong></summary>

```bash
# Check current quota
az cognitiveservices usage list --location eastus2

# Try different region
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the original environment before reducing capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Request quota increase
# Go to Azure Portal > Quotas > Request increase
```
</details>

<details>
<summary><strong>האם אני יכול להשתמש בנתונים שלי עם Microsoft Foundry Models?</strong></summary>

כן! השתמש ב-**Azure AI Search** עבור RAG (יצירה משופרת בהבאה):

```yaml
# azure.yaml
services:
  ai:
    project: ./api
    host: containerapp
    env:
      AZURE_SEARCH_ENDPOINT: ${AZURE_SEARCH_ENDPOINT}
      AZURE_SEARCH_INDEX: ${AZURE_SEARCH_INDEX}
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

ראה את התבנית [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>איך אני מאבטח נקודות קצה של מודלי AI?</strong></summary>

**המלצות הטובות ביותר**:
1. השתמש בזהות מנוהלת (ללא מפתחות API)
2. הפעל נקודות קצה פרטיות
3. הגדר קבוצות אבטחת רשת
4. יישם הגבלה על קצב
5. השתמש ב-Azure Key Vault לסודיות

```bicep
// Managed Identity authentication
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'web-identity'
  location: location
}

resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id)
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
  }
}
```
</details>

## קהילה ותמיכה

- **Microsoft Foundry Discord**: [ערוץ #Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [נושאים ודיונים](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [תיעוד רשמי](https://learn.microsoft.com/azure/ai-studio/)
- **כישורי סוכנים**: [כישורי Microsoft Foundry ב-skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - התקן כישורי סוכנים של Azure + Foundry בעורך שלך עם `npx skills add microsoft/github-copilot-for-azure`

---

**ניווט פרק:**
- **📚 דף הבית לקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 2 - פיתוח מבוסס AI
- **⬅️ פרק קודם**: [פרק 1: הפרויקט הראשון שלך](../chapter-01-foundation/first-project.md)
- **➡️ הבא**: [סוכני AI](agents.md)
- **🚀 פרק הבא**: [פרק 3: תצורה](../chapter-03-configuration/configuration.md)

**צריך עזרה?** הצטרף לדיוני הקהילה שלנו או פתח נושא במאגר. קהילת Azure AI + AZD כאן כדי לעזור לך להצליח!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->