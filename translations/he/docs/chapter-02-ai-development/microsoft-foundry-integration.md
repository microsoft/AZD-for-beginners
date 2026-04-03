# אינטגרציה בין Microsoft Foundry ל-AZD

**ניווט בפרקים:**
- **📚 בית הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 2 - פיתוח ממוקד בינה מלאכותית
- **⬅️ הפרק הקודם**: [פרק 1: הפרויקט הראשון שלך](../chapter-01-foundation/first-project.md)
- **➡️ הבא**: [פריסה של מודל AI](ai-model-deployment.md)
- **🚀 פרק הבא**: [פרק 3: קונפיגורציה](../chapter-03-configuration/configuration.md)

## סקירה כללית

מדריך זה מדגים כיצד לשלב שירותי Microsoft Foundry עם Azure Developer CLI (AZD) לפריסות אפליקציות AI חלקות. Microsoft Foundry מספק פלטפורמה מקיפה לבניית, פריסה וניהול אפליקציות AI, בעוד ש-AZD מפשט את תהליך התשתית והפריסה.

## מה זה Microsoft Foundry?

Microsoft Foundry היא הפלטפורמה המאוחדת של מיקרוסופט לפיתוח AI הכוללת:

- **קטלוג מודלים**: גישה למודלים מתקדמים של בינה מלאכותית
- **Prompt Flow**: מעצב חזותי לזרימות עבודה בינה מלאכותית
- **פורטל Microsoft Foundry**: סביבת פיתוח משולבת לאפליקציות AI
- **אפשרויות פריסה**: אפשרויות אירוח והרחבה מרובות
- **בטיחות ואבטחה**: תכונות AI אחראיות מובנות

## AZD + Microsoft Foundry: טובים ביחד

| תכונה | Microsoft Foundry | יתרון האינטגרציה עם AZD |
|---------|-----------------|------------------------|
| **פריסת מודל** | פריסה ידנית דרך הפורטל | פריסות אוטומטיות וניתנות לחזרה |
| **תשתית** | פרוביזיה בלחיצת כפתור | תשתית כקוד (Bicep) |
| **ניהול סביבות** | התמקדות בסביבה בודדת | סביבות מרובות (פיתוח/בדיקה/ייצור) |
| **אינטגרציית CI/CD** | מוגבל | תמיכה מקומית בפעולות GitHub |
| **ניהול עלויות** | ניטור בסיסי | אופטימיזציית עלויות לפי סביבה |

## דרישות מוקדמות

- מנוי Azure עם הרשאות מתאימות
- התקנת Azure Developer CLI
- גישה לשירותי Microsoft Foundry Models
- היכרות בסיסית עם Microsoft Foundry

> **קו הבסיס הנוכחי של AZD:** דוגמאות אלו נבדקו עם `azd` `1.23.12`. עבור זרימת העבודה של סוכן AI, השתמש בגרסת התוסף המקדימה הנוכחית ובדוק את הגרסה המותקנת לפני התחלת העבודה.

## דפוסי אינטגרציה מרכזיים

### דפוס 1: אינטגרציה עם Microsoft Foundry Models

**מקרה שימוש**: פריסת אפליקציות צ'אט עם מודלים של Microsoft Foundry Models

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

### דפוס 2: אינטגרציה של חיפוש AI + RAG

**מקרה שימוש**: פריסת אפליקציות היוצרות עם שיחזור משולב (RAG)

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

### דפוס 3: אינטגרציה עם אינטליגנציה למסמכים

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

## 🔧 דפוסי קונפיגורציה

### הגדרת משתני סביבה

**קונפיגורציית ייצור:**
```bash
# שירותי בינה מלאכותית מרכזיים
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
# הגדרות מותאמות לעלויות לפיתוח
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # שכבת שירות חינמית
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

### תוספי AZD ל-Foundry

AZD מספק תוספים המגבירים יכולות ספציפיות של AI לעבודה עם שירותי Microsoft Foundry:

```bash
# התקן את תוסף סוכני Foundry
azd extension install azure.ai.agents

# התקן את תוסף הכיוונון המדויק
azd extension install azure.ai.finetune

# התקן את תוסף הדגמים המותאמים אישית
azd extension install azure.ai.models

# הצג את רשימת התוספים המותקנים
azd extension list --installed

# בדוק את גרסת תוסף הסוכן המותקן כעת
azd extension show azure.ai.agents
```

תוספי ה-AI עדיין מתקדמים במהירות בגרסת התצוגה המקדימה. אם פקודה מתנהגת בצורה שונה מזו שמוצגת כאן, שדרג את התוסף הרלוונטי לפני פתרון התקלות בפרויקט עצמו.

### פריסת סוכן ראשוני עם `azd ai`

אם יש לך מאפיין סוכן, השתמש ב-`azd ai agent init` ליצירת פרויקט מקשר לשירות סוכני Foundry:

```bash
# אתחול ממניפסט סוכן
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# פרוס ל-Azure
azd up
```

גרסאות תצוגה מוקדמות של `azure.ai.agents` הוסיפו גם תמיכה באתחול מבוסס תבניות למפקודה `azd ai agent init`. אם אתה עוקב אחרי דוגמאות סוכנים חדשות, בדוק את העזרה של התוסף עבור הדגלים המדויקים בגרסה המותקנת שלך.

עיין ב-[פקודות AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) עבור הפניה מלאה לפקודות ודגלים.

### פריסה בפקודה יחידה

```bash
# לפרוס הכל עם פקודה אחת
azd up

# או לפרוס בהדרגה
azd provision  # רק תשתית
azd deploy     # רק אפליקציה

# לפרוס אפליקציות AI שמתבצעות זמן רב ב-azd 1.23.11 ומעלה
azd deploy --timeout 1800
```

### פריסות לפי סביבה

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

### קונפיגורציית Managed Identity

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

### אסטרטגיות קאשינג

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

### קונפיגורציית שכבת הרחבה אוטומטית

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

### בעיה 1: חריגה מהקווטה של OpenAI

**תסמינים:**
- כשל בפריסה עם שגיאות קווטה
- שגיאות 429 ביומני האפליקציה

**פתרונות:**
```bash
# בדוק את השימוש הנוכחי במכסה
az cognitiveservices usage list --location eastus

# נסה אזור שונה
azd env set AZURE_LOCATION westus2
azd up

# הפחת את הקיבולת באופן זמני
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### בעיה 2: כשלי אימות

**תסמינים:**
- שגיאות 401/403 בקריאת שירותי AI
- הודעות "Access denied"

**פתרונות:**
```bash
# אימות הקצאות תפקיד
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# בדוק תצורת זהות מנוהלת
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# אימות גישה למאגר מפתחות
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### בעיה 3: בעיות בפריסת מודל

**תסמינים:**
- מודלים לא זמינים בפריסה
- גרסאות מודלים ספציפיות נכשלות

**פתרונות:**
```bash
# רשום את הדגמים הזמינים לפי אזור
az cognitiveservices model list --location eastus

# עדכן את גרסת הדגם בתבנית ביספ
# בדוק את דרישות הקיבולת של הדגם
```

## תבניות לדוגמה

### אפליקציית צ'אט RAG (פייתון)

**מאגר**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**שירותים**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**תיאור**: הדוגמה הפופולרית ביותר ל-AI ב-Azure — אפליקציית צ'אט RAG מוכנה להרצה המאפשרת לשאול שאלות על מסמכים שלך. משתמשת ב-GPT-4.1-mini עבור צ'אט, text-embedding-3-large לאימבדים, ו-Azure AI Search לשחזור. תומכת במסמכים רב-מודאליים, קלט/פלט קולי, אימות Microsoft Entra, ומעקב ב-Application Insights.

**התחלה מהירה**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### אפליקציית צ'אט RAG (.NET)

**מאגר**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**שירותים**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**תיאור**: המקביל ב-.NET/C# של דוגמת הצ'אט RAG בפייתון. בנויה עם ASP.NET Core Minimal API ו-frontend ב-Blazor WebAssembly. כוללת צ'אט קולי, תמיכה ב-GPT-4o-mini Vision, ולקוח שולחני/נייד היברידי מבוסס .NET MAUI Blazor.

**התחלה מהירה**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### אפליקציית צ'אט RAG (Java)

**מאגר**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**שירותים**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**תיאור**: הגרסה ב-Java של דוגמת הצ'אט RAG עם שימוש ב-Langchain4J לתזמור AI. תומכת בארכיטקטורת מיקרו-שירותים מונעת אירועים, אסטרטגיות חיפוש מרובות (טקסט, וקטור, היברידי), העלאת מסמכים עם Azure Document Intelligence, ופריסה ב-Azure Container Apps או Azure Kubernetes Service.

**התחלה מהירה**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### עוזר קופיילוט ל-Enterprise Retail עם Azure AI Foundry

**מאגר**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**שירותים**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**תיאור**: עוזר קופיילוט ל-RAG בקמעונאות מקצה לקצה המשתמש ב-Azure AI Foundry ו-Prompty. צ'אט בוט לקמעונאות חוץ של Contoso המבסס את התגובות בקטלוג מוצרים ונתוני הזמנות לקוח. מציג את זרימת העבודה המלאה של GenAIOps — אב-טיפוס עם Prompty, הערכה עם מעריכים בעזרת AI, ופריסה דרך AZD ל-Container Apps.

**התחלה מהירה**:
```bash
azd init --template contoso-chat
azd up
```

### אפליקציית כתיבה יצירתית מרובת סוכנים

**מאגר**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**שירותים**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**תיאור**: דוגמת ריבוי סוכנים המדגימה תזמור AI עם Prompty. משתמשת בסוכן מחקר (Bing Grounding בשירות Azure AI Agent), סוכן מוצר (Azure AI Search), סוכן כותב, וסוכן עורך לכתיבת מאמרים מתוחכמים ומחקריים במשותף. כוללת CI/CD עם הערכות ב-GitHub Actions.

**התחלה מהירה**:
```bash
azd init --template contoso-creative-writer
azd up
```

### צ'אט RAG ללא שרתים (JavaScript/TypeScript)

**מאגר**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**שירותים**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**תיאור**: צ'אט בוט RAG מלא ללא שרתים המשתמש ב-LangChain.js עם Azure Functions עבור ה-API ו-Azure Static Web Apps לאירוח. משתמש ב-Azure Cosmos DB הן כמאגר וקטורים והן כמסד נתונים להיסטוריית צ'אט. תומך בפיתוח מקומי עם Ollama לבדיקות ללא עלות.

**התחלה מהירה**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### מאיץ פתרון Chat with Your Data

**מאגר**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**שירותים**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**תיאור**: מאיץ פתרון RAG ברמת ארגון הכולל פורטל ניהול להעלאת/ניהול מסמכים, אפשרויות תזמור מרובות (Semantic Kernel, LangChain, Prompt Flow), המרת דיבור לטקסט, אינטגרציה עם Microsoft Teams, ובחירה בין PostgreSQL או Cosmos DB כ-backend. מיועד כנקודת התחלה הניתנת להתאמה לתרחישי RAG במוד ייצור.

**התחלה מהירה**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### סוכני נסיעות AI — תזמור MCP מרובה סוכנים

**מאגר**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**שירותים**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + שרתי MCP (.NET, Python, Java, TypeScript)

**תיאור**: אפליקציית ייחוס לתזמור AI מרובה סוכנים המשתמשת בשלוש מסגרות (LangChain.js, LlamaIndex.TS, ומסגרת סוכנים של מיקרוסופט). כוללת שרתי MCP (פרוטוקול הקשר מודלי) בארבע שפות המופעלים כ-Azure Container Apps ללא שרתים עם ניטור OpenTelemetry.

**התחלה מהירה**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**מאגר**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**שירותים**: שירותי Azure AI + Azure OpenAI

**תיאור**: תבנית Bicep מינימלית המפריסה שירותי Azure AI עם מודלים של למידת מכונה מוגדרים. נקודת התחלה קלה כאשר נדרשת רק תשתית Azure AI ללא ערמת אפליקציות מלאה.

**התחלה מהירה**:
```bash
azd init --template azd-ai-starter
azd up
```

> **גלוש לתבניות נוספות**: בקר ב-[גלריית תבניות AZD AI מדהימות](https://azure.github.io/awesome-azd/?tags=ai) עם מעל 80 תבניות AZD ייעודיות ל-AI בשפות וסצנריואים שונים.

## שלבים הבאים

1. **נסה את הדוגמאות**: התחיל מתבנית מוכנה המתאימה למקרה השימוש שלך
2. **התאם לצרכים שלך**: שנה את התשתית וקוד האפליקציה
3. **הוסף ניטור**: הטמע תצפית מקיפה
4. **אופטימיזציה לעלויות**: כוונן קונפיגורציות בהתאם לתקציב שלך
5. **אבטח את הפריסה שלך**: הטמע דפוסי אבטחה ארגוניים
6. **הרחב לייצור**: הוסף תכונות רב-אזוריות וזמינות גבוהה

## 🎯 תרגילים מעשיים

### תרגיל 1: פריסת אפליקציית צ'אט Microsoft Foundry Models (30 דקות)
**מטרה**: לפרוס ולבדוק אפליקציית צ'אט AI מוכנה לייצור

```bash
# אתחול תבנית
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# הגדרת משתני סביבה
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# פריסה
azd up

# בדיקת האפליקציה
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# מעקב אחרי פעולות הבינה המלאכותית
azd monitor

# ניקוי
azd down --force --purge
```

**קריטריוני הצלחה:**
- [ ] הפריסה מסתיימת ללא שגיאות קווטה
- [ ] ניתן לגשת לממשק הצ'אט בדפדפן
- [ ] ניתן לשאול שאלות ולקבל תגובות מופעלות AI
- [ ] Application Insights מציג נתוני טלמטריה
- [ ] משאבים הוסרו בהצלחה בסיום

**עלות משוערת**: 5-10 דולר עבור 30 דקות בדיקה

### תרגיל 2: קונפיגורציית פריסת מודלים מרובים (45 דקות)
**מטרה**: לפרוס מספר מודלי AI עם קונפיגורציות שונות

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
- [ ] מספר מודלים פרוסים בהצלחה
- [ ] הוחלו הגדרות קיבולת שונות
- [ ] מודלים נגישים דרך API
- [ ] ניתן לקרוא לשני המודלים מהאפליקציה

### תרגיל 3: יישום ניטור עלויות (20 דקות)
**מטרה**: להגדיר התראות תקציב ומעקב עלויות

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

# פרוס התראה לתקציב
azd provision

# בדוק את העלויות הנוכחיות
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**קריטריוני הצלחה:**
- [ ] התראת תקציב נוצרה ב-Azure
- [ ] התראות בדוא"ל הוגדרו
- [ ] ניתן לצפות בנתוני עלות בפורטל Azure
- [ ] סף התקציב הוגדר כראוי

## 💡 שאלות נפוצות

<details>
<summary><strong>איך להקטין את עלויות Microsoft Foundry Models במהלך הפיתוח?</strong></summary>

1. **השתמש בשכבת חינם**: Microsoft Foundry Models מציעה 50,000 טוקנים חינם לחודש
2. **הקטן קיבולת**: הגדר קיבולת ל-10 TPM במקום 30+ לפיתוח
3. **השתמש ב-azd down**: שחרר משאבים כשאינך מפתח באופן פעיל
4. **מטמון תגובות**: הטמע מטמון Redis לשאילתות חוזרות
5. **השתמש בהנדסת פקודות (Prompt Engineering)**: הקטן שימוש בטוקנים עם פקודות יעילות
```bash
# תצורת פיתוח
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>מה ההבדל בין דגמי Microsoft Foundry לבין OpenAI API?</strong></summary>

**דגמי Microsoft Foundry**:
- אבטחה וציות ארגוני
- אינטגרציה עם רשת פרטית
- הבטחות SLA
- אימות זהות מנוהלת
- מכסות גבוהות יותר זמינות

**OpenAI API**:
- גישה מהירה יותר לדגמים חדשים
- התקנה פשוטה יותר
- מחסום כניסה נמוך יותר
- אינטרנט ציבורי בלבד

לאפליקציות ייצור, מומלץ להשתמש ב-**Microsoft Foundry Models**.
</details>

<details>
<summary><strong>כיצד אני מתמודד עם שגיאות של חריגת מכסת Microsoft Foundry Models?</strong></summary>

```bash
# בדוק את המיכסה הנוכחית
az cognitiveservices usage list --location eastus2

# נסה אזור שונה
azd env set AZURE_LOCATION westus2
azd up

# הפחת זמנית את הקיבולת
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# בקש הגדלת מיכסה
# עבור לפורטל Azure > מיכסות > בקש הגדלה
```
</details>

<details>
<summary><strong>האם אני יכול להשתמש בנתונים שלי עם דגמי Microsoft Foundry?</strong></summary>

כן! השתמש ב-**Azure AI Search** ל-RAG (שחזור המוגבר):

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
<summary><strong>כיצד אני מאבטח נקודות קצה של מודלים של AI?</strong></summary>

**הנחיות מומלצות**:
1. השתמש בזהות מנוהלת (ללא מפתחות API)
2. הפעל נקודות קצה פרטיות
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

- **דיסקורד Microsoft Foundry**: [ערוץ #Azure](https://discord.gg/microsoft-azure)
- **GitHub של AZD**: [נושאים ודיונים](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [תיעוד רשמי](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [כישורי Microsoft Foundry ב-skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - התקן כישורי סוכן Azure + Foundry בעורך שלך עם `npx skills add microsoft/github-copilot-for-azure`

---

**ניווט בפרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 2 - פיתוח עם AI-First
- **⬅️ הפרק הקודם**: [פרק 1: הפרויקט הראשון שלך](../chapter-01-foundation/first-project.md)
- **➡️ הבא**: [פריסת מודל AI](ai-model-deployment.md)
- **🚀 הפרק הבא**: [פרק 3: קונפיגורציה](../chapter-03-configuration/configuration.md)

**זקוק לעזרה?** הצטרף לדיוני הקהילה שלנו או פתח נושא במאגר. קהילת Azure AI + AZD כאן כדי לעזור לך להצליח!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). בעוד שאנו שואפים לדיוק, יש להיות מודעים לכך שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. יש להתחשב במסמך המקורי בשפתו המקורית כמקור המוסמך. עבור מידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי אדם. אנו לא אחראים לכל אי הבנות או פרשנויות שגויות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->