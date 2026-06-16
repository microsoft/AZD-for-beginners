# אינטגרציה של Microsoft Foundry עם AZD

**ניווט בפרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 2 - פיתוח במבוסס AI ראשוני
- **⬅️ הפרק הקודם**: [פרק 1: הפרויקט הראשון שלך](../chapter-01-foundation/first-project.md)
- **➡️ הבא**: [פריסת מודל AI](ai-model-deployment.md)
- **🚀 הפרק הבא**: [פרק 3: תצורה](../chapter-03-configuration/configuration.md)

## סקירה כללית

מדריך זה מדגים כיצד לשלב את שירותי Microsoft Foundry עם ממשק הפקודה של Azure Developer CLI (AZD) לפריסות יישומי AI יעילות. Microsoft Foundry מספקת פלטפורמה מקיפה לבניית, פריסה וניהול יישומי AI, בעוד ש-AZD מפשט את תהליך התשתית והפריסה.

## מה זה Microsoft Foundry?

Microsoft Foundry היא הפלטפורמה המאוחדת של מיקרוסופט לפיתוח AI הכוללת:

- **קטלוג מודלים**: גישה למודלים מתקדמים של AI  
- **Prompt Flow**: מעצב ויזואלי עבור זרימות עבודה של AI  
- **פורטל Microsoft Foundry**: סביבות פיתוח משולבת ליישומי AI  
- **אפשרויות פריסה**: מגוון אפשרויות אירוח וקנה מידה  
- **בטיחות ואבטחה**: תכונות AI אחראיות מובנות  

## AZD + Microsoft Foundry: טובים ביחד

| תכונה | Microsoft Foundry | יתרון השילוב עם AZD |
|---------|-----------------|------------------------|
| **פריסת מודל** | פריסה ידנית דרך פורטל | פריסות אוטומטיות וניתנות לחזרה |
| **תשתית** | פרוס באמצעות לחיצות | תשתית כקוד (Bicep) |
| **ניהול סביבת עבודה** | התמקדות בסביבה יחידה | סביבה מרובת שלבים (פיתוח/בדיקה/הפקה) |
| **אינטגרציה CI/CD** | מוגבלת | תמיכה מקורית ב-GitHub Actions |
| **ניהול עלויות** | ניטור בסיסי | אופטימיזציה של עלויות לפי סביבה |

## דרישות מוקדמות

- מנוי Azure עם הרשאות מתאימות  
- ממשק Azure Developer CLI מותקן  
- גישה לשירותי Microsoft Foundry Models  
- היכרות בסיסית עם Microsoft Foundry  

> **קו בסיס של AZD נוכחי:** דוגמאות אלו נבדקו מול `azd` בגרסה `1.23.12`. עבור זרימת עבודה של סוכן AI, השתמש בגרסת התוסף התצוגה המקדימה הנוכחית ובדוק את הגרסה המותקנת לפני שתתחיל.

## דפוסי אינטגרציה מרכזיים

### דפוס 1: אינטגרציה עם Microsoft Foundry Models

**מקרה שימוש**: פריסת יישומי צ'אט עם מודלים של Microsoft Foundry Models

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

**מקרה שימוש**: פריסת יישומי יצירת תוכן מוגבר-שליפה (RAG)

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

### דפוס 3: אינטגרציה עם Document Intelligence

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

## 🔧 דפוסי תצורה

### הגדרת משתני סביבה

**תצורת ייצור:**
```bash
# שירותי בינה מלאכותית בסיסיים
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

**תצורת פיתוח:**
```bash
# הגדרות מותאמות לחיסכון בעלויות לפיתוח
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # שכבת שירות חינמית
```

### תצורה מאובטחת עם Key Vault

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

### תוספי AZD ל-Foundry

AZD מספק תוספים המוסיפים יכולות AI ייעודיות לעבודה עם שירותי Microsoft Foundry:

```bash
# התקן את תוסף הסוכנים של Foundry
azd extension install azure.ai.agents

# התקן את תוסף הכיוונון המדויק
azd extension install azure.ai.finetune

# התקן את תוסף הדגמים המותאמים אישית
azd extension install azure.ai.models

# הצג את רשימת התוספים המותקנים
azd extension list --installed

# בדוק את גרסת תוסף הסוכן המותקן כרגע
azd extension show azure.ai.agents
```

תוספי ה-AI עדיין מתקדמים במהירות במסגרת התצוגה המקדימה. אם פקודה מתנהגת אחרת ממה שמוצג כאן, שדרג את התוסף הרלוונטי לפני שתתחיל בניפוי שגיאות בפרויקט עצמו.

### פריסת סוכן ראשוני עם `azd ai`

אם יש לך מניפסט סוכן, השתמש בפקודה `azd ai agent init` כדי להקים פרויקט המחובר לשירות הסוכן של Foundry:

```bash
# לאתחל ממניפסט של סוכן
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# לפרוס ל-Azure
azd up
```

גרסאות תצוגה אחרונות של `azure.ai.agents` הוסיפו גם תמיכה באתחול מבוסס תבניות ל-`azd ai agent init`. אם אתה עוקב אחרי דוגמאות סוכנים חדשות יותר, בדוק את עזרה של התוסף לסמני פקודה זמינים בגרסה שלך.

ראה את [פקודות AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) לעיון מקיף בפקודות ובסמני הפקודה.

### פריסה בפקודה יחידה

```bash
# לפרוס הכל עם פקודה אחת
azd up

# או לפרוס באופן הדרגתי
azd provision  # רק תשתית
azd deploy     # רק אפליקציה

# לפריסות יישומי AI הפועלים לאורך זמן ב-azd 1.23.11 ומעלה
azd deploy --timeout 1800
```

### פריסות לפי סביבה ספציפית

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

## ניטור ויכולת תצפית

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

## 🔐 שיטות עבודה מומלצות לאבטחה

### תצורת זהות מנוהלת

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

### תצורת קנה מידה אוטומטי

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

**סימפטומים:**
- הפריסה נכשלה בשל שגיאות מכסה  
- שגיאות 429 ביומני היישום  

**פתרונות:**
```bash
# בדוק שימוש נוכחי במכסה
az cognitiveservices usage list --location eastus

# נסה אזור שונה
azd env set AZURE_LOCATION westus2
azd up

# הפחת קיבולת זמנית
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### בעיה 2: כשל באימות

**סימפטומים:**
- שגיאות 401/403 בעת קריאה לשירותי AI  
- הודעות "הגישה נדחתה"  

**פתרונות:**
```bash
# אמת הקצאות תפקידים
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# בדוק תצורת זהות מנוהלת
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# אמת גישה למאגר מפתחות
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### בעיה 3: בעיות בפריסת מודלים

**סימפטומים:**
- מודלים לא זמינים בפריסה  
- גרסאות מודל ספציפיות נכשלות  

**פתרונות:**
```bash
# רשום דגמים זמינים לפי אזור
az cognitiveservices model list --location eastus

# עדכן את גרסת הדגם בתבנית Bicep
# בדוק דרישות קיבולת הדגם
```

## דוגמאות תבניות

### יישום צ'אט RAG (Python)

**מאגר**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**שירותים**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**תיאור**: דוגמת Azure AI הפופולרית ביותר — אפליקציית צ'אט RAG מוכנה לייצור המאפשרת לשאול שאלות על מסמכים משלך. משתמש ב-GPT-4.1-mini לצ'אט, text-embedding-3-large להטמעות, ו-Azure AI Search לשליפה. תומך במסמכים מולטימודליים, קלט/פלט קוליים, אימות Microsoft Entra, ומעקב ב-Application Insights.

**התחלה מהירה:**
```bash
azd init --template azure-search-openai-demo
azd up
```

### יישום צ'אט RAG (.NET)

**מאגר**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**שירותים**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**תיאור**: המקבילה ב-.NET/C# לדוגמת צ'אט RAG בפייתון. בנוי עם ASP.NET Core Minimal API ו-Frontend Blazor WebAssembly. כולל צ'אט קולי, תמיכה בראייה GPT-4o-mini, ולקוח דסקטופ/נייד בשילוב Blazor MAUI ב-.NET.

**התחלה מהירה:**
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### יישום צ'אט RAG (Java)

**מאגר**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**שירותים**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**תיאור**: גרסת Java של דוגמת הצ'אט RAG המשתמשת ב-Langchain4J לתזמור AI. תומך בארכיטקטורת מיקרו-שירותים מבוססת אירועים, אסטרטגיות חיפוש מרובות (טקסט, וקטור, היברידי), העלאת מסמכים עם Azure Document Intelligence, ופריסה ב-Azure Container Apps או Azure Kubernetes Service.

**התחלה מהירה:**
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### עוזר קמעונאות ארגוני עם Microsoft Foundry

**מאגר**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**שירותים**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**תיאור**: עוזר RAG קמעונאי מקצה לקצה המשתמש ב-Microsoft Foundry וב-Prompty. צ'אטבוט קמעונאי Contoso Outdoor המחובר לקטלוג מוצרים ולנתוני הזמנות לקוח. מדגים את זרימת העבודה המלאה של GenAIOps — אבטיפוס עם Prompty, הערכה עם מעריכים מסייעי AI, ופריסה דרך AZD ל-Container Apps.

**התחלה מהירה:**
```bash
azd init --template contoso-chat
azd up
```

### יישום כתיבה יצירתית רב-סוכנים

**מאגר**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**שירותים**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**תיאור**: דוגמת רב-סוכנים המדגימה תזמור סוכני AI באמצעות Prompty. משתמש בסוכן מחקר (Bing Grounding ב-Azure AI Agent Service), סוכן מוצר (Azure AI Search), סוכן כותב, וסוכן עורך לשיתוף פעולה ביצירת מאמרים מחקריים. כולל CI/CD עם הערכה ב-GitHub Actions.

**התחלה מהירה:**
```bash
azd init --template contoso-creative-writer
azd up
```

### צ'אט RAG ללא שרת (JavaScript/TypeScript)

**מאגר**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**שירותים**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**תיאור**: צ'אטבוט RAG ללא שרת המשתמש ב-LangChain.js עם Azure Functions ל-API ו-Azure Static Web Apps לאירוח. משתמש ב-Azure Cosmos DB גם כאחסון וקטורים וגם כמסד נתוני היסטוריית צ'אט. תומך בפיתוח מקומי עם Ollama לבדיקה ללא עלות.

**התחלה מהירה:**
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### מאיץ פתרון צ'אט עם הנתונים שלך

**מאגר**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**שירותים**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**תיאור**: מאיץ פתרון RAG ברמת ארגון עם פורטל ניהול להעלאה/ניהול מסמכים, אפשרויות תזמור מרובות (Semantic Kernel, LangChain, Prompt Flow), דיבור לטקסט, אינטגרציה עם Microsoft Teams, ובחירה בין מסדי נתונים PostgreSQL או Cosmos DB. מיועד כנקודת התחלה מותאמת תרחישי RAG בייצור.

**התחלה מהירה:**
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### סוכני הנסיעות AI — תזמור Multi-Agent MCP

**מאגר**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**שירותים**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + שרתי MCP (.NET, Python, Java, TypeScript)

**תיאור**: יישום רפרנס לתזמור סוכני AI מרובים המשתמש בשלושה מסגרות (LangChain.js, LlamaIndex.TS, ו-Microsoft Agent Framework). כולל שרתי MCP (Model Context Protocol) בארבעת השפות בפריסה כ-Azure Container Apps ללא שרת עם ניטור OpenTelemetry.

**התחלה מהירה:**
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**מאגר**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**שירותים**: שירותי Azure AI + Azure OpenAI

**תיאור**: תבנית Bicep מינימלית שמפריסה שירותי Azure AI עם מודלי למידת מכונה מוגדרים. נקודת התחלה קלה כאשר נדרשת רק תשתית Azure AI בלי ערמת יישומים מלאה.

**התחלה מהירה:**
```bash
azd init --template azd-ai-starter
azd up
```

> **גלוש לתבניות נוספות**: בקר ב-[גלריית התבניות המדהימה של AZD AI](https://azure.github.io/awesome-azd/?tags=ai) עם יותר מ-80 תבניות AZD ייעודיות ל-AI בשפות ותסריטים שונים.

## הצעדים הבאים

1. **נסה את הדוגמאות**: התחל בתבנית מוכנה שתואמת למקרה השימוש שלך  
2. **התאם אישית לצרכיך**: שנה את התשתית וקוד היישום  
3. **הוסף ניטור**: יישם יכולת תצפית מקיפה  
4. **ייעל עלויות**: כוונן תצורות לתקציב שלך  
5. **אבטח את הפריסה שלך**: יישם דפוסי אבטחה ארגוניים  
6. **הרחב לייצור**: הוסף תכונות רב-אזוריות ועם זמינות גבוהה  

## 🎯 תרגילים מעשיים

### תרגיל 1: פריסת אפליקציית צ'אט עם מודלים של Microsoft Foundry (30 דקות)
**מטרה**: לפרוס ולבדוק אפליקציית צ'אט AI מוכנה לייצור

```bash
# אתחול התבנית
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# הגדרת משתני סביבה
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# פריסה
azd up

# בדיקת היישום
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# ניטור פעולות ה-AI
azd monitor

# ניקוי
azd down --force --purge
```

**קריטריוני הצלחה:**
- [ ] הפריסה הושלמה ללא שגיאות מכסה  
- [ ] ניתן לגשת לממשק הצ'אט בדפדפן  
- [ ] ניתן לשאול שאלות ולקבל תגובות מופעלות AI  
- [ ] Application Insights מציג נתוני טלמטריה  
- [ ] ניקוי משאבים בוצע בהצלחה  

**עלות מוערכת**: 5-10$ עבור 30 דקות בדיקה

### תרגיל 2: תצורת פריסת מודלים מרובים (45 דקות)
**מטרה**: לפרוס מספר מודלים עם תצורות שונות

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
- [ ] מספר מודלים הושקו בהצלחה  
- [ ] יישום הגדרות קיבולת שונות  
- [ ] מודלים נגישים דרך API  
- [ ] אפשרות לקרוא לשני המודלים מהיישום  

### תרגיל 3: יישום ניטור עלויות (20 דקות)
**מטרה**: להגדיר התראות תקציב ומעקב עלויות

```bash
# הוסף התראת תקציב ל-Bicep
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
- [ ] התראות דוא"ל מוגדרות  
- [ ] ניתן לצפות בנתוני עלות בפורטל Azure  
- [ ] סף התקציב הוגדר כראוי  

## 💡 שאלות נפוצות

<details>
<summary><strong>כיצד ניתן להפחית עלויות Microsoft Foundry Models במהלך הפיתוח?</strong></summary>

1. **השתמש בשכבת חינמית**: Microsoft Foundry Models מציעה 50,000 טוקנים בחינם לחודש  
2. **הפחת קיבולת**: הגדר קיבולת ל-10 TPM במקום 30+ בסביבת פיתוח  
3. **השתמש בפקודה azd down**: שחרר משאבים כאשר לא מפתחים באופן פעיל  
4. **הטמע מטמון**: הוסף מטמון Redis עבור שאילתות חוזרות  
5. **השתמש בהנדסת פרומפטים**: הפחת שימוש בטוקנים עם פרומפטים יעילים  
```bash
# תצורת פיתוח
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>מה ההבדל בין Microsoft Foundry Models ל-OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- אבטחה וציות ארגוניים
- אינטגרציה עם רשת פרטית
- התחייבויות SLA
- אימות זהות מנוהלת
- מכסות גבוהות יותר זמינות

**OpenAI API**:
- גישה מהירה יותר לדגמים חדשים
- התקנה פשוטה יותר
- חסם כניסה נמוך יותר
- רק אינטרנט ציבורי

לעולם הייצור, **מומלץ להשתמש ב-Microsoft Foundry Models**.
</details>

<details>
<summary><strong>איך מטפלים בשגיאות של חריגת מכסת Microsoft Foundry Models?</strong></summary>

```bash
# בדוק את המניין הנוכחי
az cognitiveservices usage list --location eastus2

# נסה אזור שונה
azd env set AZURE_LOCATION westus2
azd up

# הפחת את הקיבולת זמנית
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# בקש הגדלת מכסה
# עבור לפורטל Azure > מכסות > בקש הגדלה
```
</details>

<details>
<summary><strong>האם אני יכול להשתמש בנתונים שלי עם Microsoft Foundry Models?</strong></summary>

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

ראה את תבנית [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>איך מאבטחים נקודות קצה של דגמי AI?</strong></summary>

**הנחיות מומלצות**:
1. השתמש ב-Managed Identity (ללא מפתחות API)
2. אפשר נקודות קצה פרטיות
3. קונפג קבוצות אבטחת רשת
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
- **Agent Skills**: [כישור Microsoft Foundry ב-skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - התקן כישורי סוכן Azure + Foundry בעורך שלך עם `npx skills add microsoft/github-copilot-for-azure`

---

**ניווט בפרק:**
- **📚 עמוד הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 2 - פיתוח ממוקד AI
- **⬅️ פרק קודם**: [פרק 1: הפרויקט הראשון שלך](../chapter-01-foundation/first-project.md)
- **➡️ הבא**: [פריסת דגם AI](ai-model-deployment.md)
- **🚀 פרק הבא**: [פרק 3: קונפיגורציה](../chapter-03-configuration/configuration.md)

**זקוק לעזרה?** הצטרף לדיוני הקהילה או פתח נושא במאגר. קהילת Azure AI + AZD כאן כדי לעזור לך להצליח!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->