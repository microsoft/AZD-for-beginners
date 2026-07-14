# אינטגרציה של Microsoft Foundry עם AZD

**ניווט בפרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 2 - פיתוח שממוקד ב-AI
- **⬅️ הפרק הקודם**: [פרק 1: הפרויקט הראשון שלך](../chapter-01-foundation/first-project.md)
- **➡️ הבא**: [פריסת דגמי AI](ai-model-deployment.md)
- **🚀 הפרק הבא**: [פרק 3: קונפיגורציה](../chapter-03-configuration/configuration.md)

## סקירה כללית

מדריך זה מדגים כיצד לשלב שירותי Microsoft Foundry עם Azure Developer CLI (AZD) לפריסות יישומי AI חלקות. Microsoft Foundry מספק פלטפורמה מקיפה לבניית, פריסה וניהול יישומי AI, בעוד ש-AZD מפשט את תהליך התשתית והפריסה.

## מה זה Microsoft Foundry?

Microsoft Foundry היא פלטפורמת האחד של מיקרוסופט לפיתוח AI הכוללת:

- **קטלוג דגמים**: גישה לדגמי AI חדשניים
- **Prompt Flow**: מעצב חזותי לזרמי עבודה של AI
- **פורטל Microsoft Foundry**: סביבת פיתוח משולבת ליישומי AI
- **אפשרויות פריסה**: אופציות אירוח וקנה מידה רבות
- **בטיחות ואבטחה**: תכונות AI אחראיות מובנות

## AZD + Microsoft Foundry: טובים יחד

| תכונה | Microsoft Foundry | יתרון האינטגרציה עם AZD |
|---------|-----------------|------------------------|
| **פריסת מודל** | פריסה ידנית דרך הפורטל | פריסות אוטומטיות ונשנות |
| **תשתית** | אספקה בהקלקה | תשתית כקוד (Bicep) |
| **ניהול סביבה** | מיקוד בסביבה אחת | רב-סביבתי (פיתוח/בדיקה/ייצור) |
| **אינטגרציית CI/CD** | מוגבלת | תמיכה טבעית ב-GitHub Actions |
| **ניהול עלויות** | ניטור בסיסי | אופטימיזציית עלויות מותאמת לסביבה |

## דרישות מוקדמות

- מנוי Azure עם הרשאות מתאימות
- התקנת Azure Developer CLI
- גישה לשירותי Microsoft Foundry Models
- היכרות בסיסית עם Microsoft Foundry

> **גרסת הבסיס הנוכחית של AZD:** דוגמאות אלו נבדקו עם `azd` `1.27.1`. עבור זרימת העבודה של סוכן ה-AI, השתמשו בגרסת התוסף המוקדמת הנוכחית ובדקו את הגרסה המותקנת לפני תחילת העבודה.

## דפוסי אינטגרציה עיקריים

### דפוס 1: אינטגרציה עם דגמי Microsoft Foundry

**מקרה שימוש**: פריסת אפליקציות צ'אט עם דגמי Microsoft Foundry Models

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      - AZURE_OPENAI_ENDPOINT
      - AZURE_OPENAI_API_KEY
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
    disableLocalAuth: false
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
      version: '2024-07-18'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}
```

### דפוס 2: אינטגרציה של AI Search + RAG

**מקרה שימוש**: פריסת אפליקציות הפקה מועשרת על ידי אחזור (RAG)

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

// Connect Search with OpenAI
resource searchConnection 'Microsoft.Search/searchServices/dataConnections@2023-11-01' = {
  parent: searchService
  name: 'openai-connection'
  properties: {
    targetResourceId: openAIAccount.id
    authenticationMethod: 'managedIdentity'
  }
}
```

### דפוס 3: אינטגרציה של בינה לתהליכי מסמכים

**מקרה שימוש**: זרמי עבודה לעיבוד וניתוח מסמכים

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

## 🔧 דפוסי קונפיגורציה

### הגדרת משתני סביבה

**קונפיגורציית ייצור:**
```bash
# שירותי AI מרכזיים
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# תצורות מודל
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# הגדרות ביצועים
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**קונפיגורציית פיתוח:**
```bash
# הגדרות מותאמות לחיסכון בעלויות עבור פיתוח
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # שכבת חינם
```

### קונפיגורציה מאובטחת עם Key Vault

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
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

### תוספי AZD עבור Foundry

AZD מספק תוספים שמוסיפים יכולות AI ספציפיות לעבודה עם שירותי Microsoft Foundry:

```bash
# התקן את תוסף סוכני Foundry
azd extension install azure.ai.agents

# התקן את תוסף ההתאמה המדויקת
azd extension install azure.ai.finetune

# התקן את תוסף המודלים המותאמים אישית
azd extension install azure.ai.models

# רשום תוספים מותקנים
azd extension list --installed

# בדוק את גרסת התוסף של הסוכן המותקן כרגע
azd extension show azure.ai.agents
```

תוספי ה-AI עדיין מתפתחים במהירות במצב תצוגה מוקדמת. אם פקודה מתנהגת שונה מהדגים כאן, שדרגו את התוסף הרלוונטי לפני שתתחילו לפתור בעיות בפרויקט עצמו.

### פריסה שממוקדת בסוכן עם `azd ai`

אם יש לך מניפסט סוכן, השתמש ב-`azd ai agent init` כדי ליצור פרויקט מחובר לשירות סוכני Foundry:

```bash
# אתחול ממניפסט של סוכן
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# פריסה ל-Azure
azd up
```

גרסאות תצוגה מוקדמת עדכניות של `azure.ai.agents` הוסיפו גם תמיכה בהתחלה מבוססת תבניות עבור `azd ai agent init`. אם אתם עוקבים אחר דוגמאות סוכנים חדשות יותר, בדקו את העזרה של התוסף עבור הדגלים המדויקים הזמינים בגרסה המותקנת שלכם.

ראה [פקודות AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) לעיון מלא במערכת הפקודות והדגלים.

### פריסת פקודה אחת

```bash
# לפרוס הכל עם פקודה אחת
azd up

# או לפרוס בהדרגה
azd provision  # רק תשתית
azd deploy     # רק אפליקציה

# לפריסות אפליקציות AI הפועלות זמן רב ב-azd 1.23.11+
azd deploy --timeout 1800
```

### פריסות מותאמות לסביבה

```bash
# סביבת פיתוח
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# סביבת ייצור
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## ניטור ותצפית

### אינטגרציה עם Application Insights

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
resource customMetrics 'Microsoft.Insights/components/analyticsItems@2015-05-01' = {
  parent: applicationInsights
  name: 'AI-Metrics'
  properties: {
    name: 'AI Operations Metrics'
    content: '''
      requests
      | where name contains "openai"
      | summarize 
          RequestCount = count(),
          AvgDuration = avg(duration),
          SuccessRate = countif(success == true) * 100.0 / count()
      by bin(timestamp, 5m)
    '''
  }
}
```

### ניטור עלויות

```bicep
// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
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

## 🔐 שיטות אבטחה מומלצות

### קונפיגורציית זהות מנוהלת

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
      - REDIS_CONNECTION_STRING
      - CACHE_TTL=3600
```

```bicep
// Redis cache for AI responses
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

### קונפיגורציית סקיילינג אוטומטי

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

### בעיה 1: חריגות מכסת OpenAI

**תסמינים:**
- הפריסה נכשלת עם שגיאות מכסה
- 429 שגיאות ביומני האפליקציה

**פתרונות:**
```bash
# בדוק את השימוש הנוכחי במכסה
az cognitiveservices usage list --location eastus

# נסה אזור שונה
azd env set AZURE_LOCATION westus2
azd up

# הפחת את הקיבולת זמנית
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### בעיה 2: כשלות אימות

**תסמינים:**
- שגיאות 401/403 בעת קריאה לשירותי AI
- הודעות "הגישה נדחתה"

**פתרונות:**
```bash
# אימות הקצאות תפקידים
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# בדוק תצורת זהות מנוהלת
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# ואלדציה של גישה למפתח כספת
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### בעיה 3: בעיות בפריסת מודל

**תסמינים:**
- דגמים לא זמינים בפריסה
- גרסאות דגם ספציפיות נכשלות

**פתרונות:**
```bash
# רשום דגמים זמינים לפי אזור
az cognitiveservices model list --location eastus

# עדכן את גרסת הדגם בתבנית בייסיק
# בדוק דרישות קיבולת הדגם
```

## תבניות לדוגמה

### אפליקציית צ'אט RAG (Python)

**מאגר קוד**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**שירותים**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**תיאור**: הדוגמה הפופולרית ביותר של Azure AI — אפליקציית צ'אט RAG מוכנה לייצור שמאפשרת לך לשאול שאלות על המסמכים שלך. משתמש ב-GPT-4.1-mini לצ'אט, ב-text-embedding-3-large להטמעות, ו-Azure AI Search לאחזור. תומך במסמכים מרובי אמצעים, קלט/פלט דיבור, אימות Microsoft Entra, ומעקב Application Insights.

**התחלה מהירה**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### אפליקציית צ'אט RAG (.NET)

**מאגר קוד**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**שירותים**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**תיאור**: מקבילה ב-.NET/C# לדוגמת צ'אט RAG בפייתון. בנויה עם ASP.NET Core Minimal API ו-Blazor WebAssembly בחזית. כוללת צ'אט קולי, תמיכה בראייה ב-GPT-4o-mini, וקליינט .NET MAUI Blazor Hybrid לשולחן עבודה/נייד.

**התחלה מהירה**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### אפליקציית צ'אט RAG (Java)

**מאגר קוד**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**שירותים**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**תיאור**: גרסת Java לדוגמת צ'אט RAG שמשתמשת ב-Langchain4J לתזמור AI. תומך בארכיטקטורת מיקרו-שירותים מונעת ארועים, אסטרטגיות חיפוש מרובות (טקסט, וקטור, היברידי), העלאת מסמכים עם Azure Document Intelligence, ופריסה על Azure Container Apps או Azure Kubernetes Service.

**התחלה מהירה**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### עוזר קמעונאות ארגוני עם Microsoft Foundry

**מאגר קוד**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**שירותים**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**תיאור**: עוזר קמעונאות RAG מקצה לקצה שמשתמש ב-Microsoft Foundry וב-Prompty. צ'אטבוט לקמעונאי Contoso Outdoor שמבסס תגובות על קטלוג מוצר ונתוני הזמנות לקוחות. מדגים את זרימת העבודה המלאה של GenAIOps — אב-טיפוס עם Prompty, הערכה עם מעריכים בסיוע AI, ופריסה דרך AZD לאפליקציות מכולה.

**התחלה מהירה**:
```bash
azd init --template contoso-chat
azd up
```

### אפליקציית סוכנים מרובי יצירתית

**מאגר קוד**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**שירותים**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**תיאור**: דוגמת סוכנים מרובים שמדגימה תזמור AI עם Prompty. משתמשת בסוכן מחקר (Bing Grounding ב-Azure AI Agent Service), סוכן מוצר (Azure AI Search), סוכן כותב, וסוכן עורך ליצירת מאמרים מתומצתים היטב. כוללת CI/CD עם הערכה ב-GitHub Actions.

**התחלה מהירה**:
```bash
azd init --template contoso-creative-writer
azd up
```

### צ'אט RAG ללא שרת (JavaScript/TypeScript)

**מאגר קוד**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**שירותים**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB ל-NoSQL + LangChain.js

**תיאור**: צ'אטבוט RAG מלא ללא שרת המשתמש ב-LangChain.js עם Azure Functions עבור ה-API ו-Azure Static Web Apps לאירוח. משתמש ב-Azure Cosmos DB כמאגר וקטורים ומסד נתונים להיסטוריית צ'אט. תומך בפיתוח מקומי עם Ollama לטסט ללא עלות.

**התחלה מהירה**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### מאיץ פתרונות צ'אט עם הנתונים שלך

**מאגר קוד**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**שירותים**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**תיאור**: מאיץ פתרונות רמת ארגון RAG עם פורטל ניהול להעלאת/ניהול מסמכים, אפשרויות תזמור רבות (Semantic Kernel, LangChain, Prompt Flow), דיבור לטקסט, אינטגרציית Microsoft Teams, ובחירת PostgreSQL או Cosmos DB כרקע. מיועד כנקודת התחלה מותאמת אישית לתרחישי RAG בייצור.

**התחלה מהירה**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### סוכני נסיעות AI — תזמור מרובה סוכנים MCP

**מאגר קוד**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**שירותים**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + שרתי MCP (.NET, Python, Java, TypeScript)

**תיאור**: יישום התייחסות לתזמור AI מרובה סוכנים המשתמש בשלוש מסגרות (LangChain.js, LlamaIndex.TS, ו-Microsoft Agent Framework). כולל שרתי MCP (Model Context Protocol) בארבע שפות שמופעלים כאפליקציות מכולה ללא שרת עם ניטור OpenTelemetry.

**התחלה מהירה**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**מאגר קוד**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**שירותים**: Azure AI Services + Azure OpenAI

**תיאור**: תבנית Bicep מינימלית שמפריסה שירותי Azure AI עם דגמי למידת מכונה מוגדרים. נקודת התחלה קלה כאשר אתם צריכים רק את תשתית Azure AI מבלי לערום מחסנית אפליקציה מלאה.

**התחלה מהירה**:
```bash
azd init --template azd-ai-starter
azd up
```

> **עיינו בתבניות נוספות**: בקרו ב-[גלריית תבניות AZD AI המדהימה](https://azure.github.io/awesome-azd/?tags=ai) ל-80+ תבניות AZD ספציפיות ל-AI במגוון שפות ותסריטים.

## השלבים הבאים

1. **נסו את הדוגמאות**: התחל עם תבנית מוכנה שמתאימה למקרה השימוש שלך
2. **התאימו לצרכים שלכם**: שנו את התשתית וקוד האפליקציה
3. **הוסיפו ניטור**: יישמו תצפית מקיפה
4. **אופטימיזציית עלויות**: כיול קונפיגורציות לפי התקציב
5. **אבטחו את הפריסה שלכם**: יישמו דפוסי אבטחה ארגוניים
6. **הרחיבו לייצור**: הוסיפו תכונות רב-אזוריות ובעלות זמינות גבוהה

## 🎯 תרגולים מעשיים

### תרגיל 1: פריסת אפליקציית צ'אט עם דגמי Microsoft Foundry (30 דקות)
**מטרה**: פריסה ובדיקה של אפליקציית צ'אט AI מוכנה לייצור

```bash
# אתחל תבנית
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# הגדר משתני סביבה
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# פרוס
azd up

# בדוק את היישום
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# פקח על פעולות בינה מלאכותית
azd monitor

# נקה
azd down --force --purge
```

**קריטריוני הצלחה:**
- [ ] הפריסה מסתיימת ללא שגיאות מכסה
- [ ] גישה לממשק הצ'אט בדפדפן
- [ ] ניתן לשאול שאלות ולקבל תגובות מונעות AI
- [ ] Application Insights מציגה נתוני טלמטריה
- [ ] משאבים נוצלו בהצלחה

**עלות מוערכת**: 5-10 דולר עבור 30 דקות בדיקה

### תרגיל 2: קונפיגורציית פריסת מודלים מרובים (45 דקות)
**מטרה**: פריסת מספר דגמי AI עם קונפיגורציות שונות

```bash
# צור תצורת Bicep מותאמת אישית
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

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
      version: '2024-07-18'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
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
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 50
    }
  }
  dependsOn: [gpt4omini]
}
EOF

# פרוס ואמת
azd provision
azd show
```

**קריטריוני הצלחה:**
- [ ] מספר דגמים פונו בהצלחה
- [ ] הוחלו הגדרות קיבולת שונות
- [ ] דגמים נגישים דרך API
- [ ] ניתן לקרוא לשני הדגמים מהאפליקציה

### תרגיל 3: יישום ניטור עלויות (20 דקות)
**מטרה**: הקמת התראות תקציב ומעקב עלויות

```bash
# הוסף התראה לתקציב ל-Bicep
cat >> infra/main.bicep << 'EOF'

resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2025-12-31'
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
EOF

# פרוס התראת תקציב
azd provision

# בדוק עלויות נוכחיות
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**קריטריוני הצלחה:**
- [ ] התראת תקציב נוצרה ב-Azure
- [ ] התראות בדואר אלקטרוני הוגדרו
- [ ] ניתן לצפות בנתוני עלויות בפורטל Azure
- [ ] סף התקציב נקבע כראוי

## 💡 שאלות נפוצות

<details>
<summary><strong>איך אני מפחית עלויות של Microsoft Foundry Models במהלך פיתוח?</strong></summary>

1. **השתמש בשכבת חינם**: Microsoft Foundry Models מציעה 50,000 טוקנים חינם לחודש
2. **הפחת קיבולת**: קבע קיבולת של 10 TPM במקום 30+ עבור פיתוח
3. **השתמש ב-azd down**: שחרר משאבים כשאינך מפתח פעיל
4. **מטמון תגובות**: יישם מטמון Redis לשאילתות שחוזרות
5. **השתמש בהנדסת פקודות**: הפחת שימוש בטוקנים עם פקודות יעילות


```bash
# תצורת פיתוח
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>מה ההבדל בין דגמי Microsoft Foundry ל-OpenAI API?</strong></summary>

**דגמי Microsoft Foundry**:
- אבטחה ועמידה בדרישות ארגוניות
- אינטגרציה לרשת פרטית
- הבטחות SLA
- אימות זהות מנוהל
- זמינות של מכסות גבוהות יותר

**OpenAI API**:
- גישה מהירה יותר לדגמים חדשים
- הגדרה פשוטה יותר
- חסם כניסה נמוך יותר
- רק אינטרנט ציבורי

לאפליקציות פרודקשן, **מומלץ להשתמש בדגמי Microsoft Foundry**.
</details>

<details>
<summary><strong>איך מטפלים בשגיאות של חריגה מהמכסה בדגמי Microsoft Foundry?</strong></summary>

```bash
# בדוק את המניין הנוכחי
az cognitiveservices usage list --location eastus2

# נסה אזור שונה
azd env set AZURE_LOCATION westus2
azd up

# הפחת את הקיבולת באופן זמני
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# בקש הגדלת מניין
# עבור לפורטל Azure > מניינים > בקש הגדלה
```
</details>

<details>
<summary><strong>האם אפשר להשתמש בנתונים שלי עם דגמי Microsoft Foundry?</strong></summary>

כן! השתמש ב-**Azure AI Search** ל-RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

ראה את התבנית [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>איך מאבטחים נקודות קצה של דגמי AI?</strong></summary>

**שיטות מומלצות**:
1. השתמש בזהות מנוהלת (ללא מפתחות API)
2. אפשר נקודות קצה פרטיות
3. הגדר קבוצות אבטחת רשת
4. יישם הגבלת קצב
5. השתמש ב-Azure Key Vault לאחסון סודות

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

- **Microsoft Foundry Discord**: [#ערוץ Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [נושאים ודיונים](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [תיעוד רשמי](https://learn.microsoft.com/azure/ai-studio/)
- **כישורי סוכן**: [כישורי Microsoft Foundry ב-skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - התקן כישורי Azure + Foundry בעורך שלך עם `npx skills add microsoft/github-copilot-for-azure`

---

**ניווט בפרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 2 - פיתוח עם AI ראשון
- **⬅️ פרק קודם**: [פרק 1: הפרויקט הראשון שלך](../chapter-01-foundation/first-project.md)
- **➡️ הבא**: [פריסת דגם AI](ai-model-deployment.md)
- **🚀 הפרק הבא**: [פרק 3: תצורה](../chapter-03-configuration/configuration.md)

**צריך עזרה?** הצטרף לדיונים בקהילה שלנו או פתח נושא במאגר. קהילת Azure AI + AZD כאן כדי לעזור לך להצליח!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->