# אינטגרציה של Microsoft Foundry עם AZD

**ניווט בפרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 2 - פיתוח ראשוני ב-AI
- **⬅️ הפרק הקודם**: [פרק 1: הפרויקט הראשון שלך](../chapter-01-foundation/first-project.md)
- **➡️ הבא**: [פריסת מודל AI](ai-model-deployment.md)
- **🚀 הפרק הבא**: [פרק 3: הגדרות](../chapter-03-configuration/configuration.md)

## סקירה

מדריך זה מדגים כיצד לשלב את שירותי Microsoft Foundry עם Azure Developer CLI (AZD) לפריסות יישומי AI פשוטות ויעילות. Microsoft Foundry מספקת פלטפורמה מקיפה לבניית, פריסה וניהול יישומי AI, בעוד AZD מפשטת את התהליך התשתיתי והפריסה.

## מהו Microsoft Foundry?

Microsoft Foundry היא הפלטפורמה המאוחדת של מיקרוסופט לפיתוח AI שכוללת:

- **קטלוג מודלים**: גישה למודלים חכמים ועדכניים של AI
- **Prompt Flow**: מעצב וויזואלי של תהליכי עבודה של AI
- **פורטל Microsoft Foundry**: סביבת פיתוח משולבת ליישומי AI
- **אפשרויות פריסה**: אפשרויות אירוח וקנה מידה רבות
- **בטיחות ואבטחה**: תכונות AI אחראיות מובנות

## AZD + Microsoft Foundry: טובים יחד

| תכונה | Microsoft Foundry | יתרון האינטגרציה עם AZD |
|---------|-----------------|------------------------|
| **פריסת מודל** | פריסה ידנית דרך הפורטל | פריסות אוטומטיות וחוזרות |
| **תשתית** | פרוביזיה דרך לחיצות | תשתית בקוד (Bicep) |
| **ניהול סביבות** | התמקדות בסביבה יחידה | סביבות מרובות (פיתוח/בדיקות/פרוד) |
| **אינטגרציה CI/CD** | מוגבלת | תמיכה מקורית ב-GitHub Actions |
| **ניהול עלויות** | ניטור בסיסי | אופטימיזציית עלויות לפי סביבה |

## דרישות מוקדמות

- מנוי Azure עם הרשאות מתאימות
- התקנת Azure Developer CLI
- גישה לשירותי Microsoft Foundry Models
- היכרות בסיסית עם Microsoft Foundry

## דפוסי אינטגרציה מרכזיים

### דפוס 1: אינטגרציה עם Microsoft Foundry Models

**מקרה שימוש**: פריסת יישומי צ'אט עם דגמי Microsoft Foundry Models

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
  name: 'gpt-35-turbo'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-35-turbo'
      version: '0613'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}
```

### דפוס 2: אינטגרציה AI Search + RAG

**מקרה שימוש**: פריסת יישומי ייצור מבוסס שליפה (RAG)

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

**מקרה שימוש**: תהליכי עיבוד וניתוח מסמכים

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

**תצורת פרודקשן:**
```bash
# שירותי בינה מלאכותית מרכזיים
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# קונפיגורציות מודל
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# הגדרות ביצועים
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**תצורת פיתוח:**
```bash
# הגדרות מותאמות לעלות לפיתוח
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # שכבת חינם
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

## תהליכי פריסה

### הרחבות AZD עבור Foundry

AZD מספקת הרחבות שמוסיפות יכולות AI ייעודיות לעבודה עם שירותי Microsoft Foundry:

```bash
# התקן את התוסף סוכני Foundry
azd extension install azure.ai.agents

# התקן את תוסף האימון המדויק
azd extension install azure.ai.finetune

# התקן את תוסף המודלים המותאמים אישית
azd extension install azure.ai.models

# רשום את התוספים המותקנים
azd extension list
```

### פריסת Agent-First עם `azd ai`

אם יש לך מניו את ה-agent, השתמש ב-`azd ai agent init` כדי לבנות פרויקט מחובר ל-Foundry Agent Service:

```bash
# לאתחל ממסמך סוכן
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# לפרוס ל-Azure
azd up
```

ראה את [פקודות AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) לקבלת הפניה מלאה לפקודות ודגלים.

### פריסה בפקודה בודדת

```bash
# לפרוס הכל עם פקודה אחת
azd up

# או לפרוס בהדרגה
azd provision  # תשתית בלבד
azd deploy     # אפליקציה בלבד
```

### פריסות מותאמות לסביבה

```bash
# סביבת פיתוח
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# סביבת הפקה
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

## 🔐 פרקטיקות אבטחה מומלצות

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

**תסמינים:**
- פריסה נכשלה עם שגיאות מכסה
- שגיאות 429 ביומני היישום

**פתרונות:**
```bash
# בדוק את השימוש הנוכחי במכסה
az cognitiveservices usage list --location eastus

# נסה איזור שונה
azd env set AZURE_LOCATION westus2
azd up

# הפחת את הקיבולת זמנית
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### בעיה 2: כשל באימות

**תסמינים:**
- שגיאות 401/403 בעת קריאה לשירותי AI
- הודעות "גישה נדחתה"

**פתרונות:**
```bash
# אמת הקצאות תפקידים
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# בדוק תצורת זהות מנוהלת
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# אמת גישה למאגר המפתחות
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### בעיה 3: בעיות בפריסת מודל

**תסמינים:**
- מודלים לא זמינים בפריסה
- גרסאות מודל מסוימות נכשלות

**פתרונות:**
```bash
# רשום את הדגמים הזמינים לפי אזור
az cognitiveservices model list --location eastus

# עדכן את גרסת הדגם בתבנית בייספ
# בדוק את דרישות הקיבולת של הדגם
```

## דוגמאות תבניות

### אפליקציית צ'אט RAG (פייתון)

**מאגר:** [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**שירותים:** Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**תיאור:** דוגמת Azure AI הפופולרית ביותר — אפליקציית צ'אט RAG מוכנה לפרודקשן המאפשרת לשאול שאלות על מסמכים משלך. משתמשת ב-GPT-4.1-mini לצ'אט, text-embedding-ada-002 להטמעה, ו-Azure AI Search לשליפה. תומכת במסמכים מולטימודליים, קלט/פלט דיבור, אימות Microsoft Entra ומעקב באמצעות Application Insights.

**התחלה מהירה**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### אפליקציית צ'אט RAG (.NET)

**מאגר:** [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**שירותים:** Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**תיאור:** המקבילה ב-.NET/C# לדוגמת צ'אט RAG בפייתון. בנוי עם ASP.NET Core Minimal API ו-Frontend ב-Blazor WebAssembly. כולל צ'אט קולי, תמיכה ב-GPT-4o-mini vision, וקליינט שולחן עבודה/נייד היברידי ב-.NET MAUI Blazor.

**התחלה מהירה**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### אפליקציית צ'אט RAG (Java)

**מאגר:** [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**שירותים:** Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**תיאור:** גרסת Java לדוגמת צ'אט RAG המשתמשת ב-Langchain4J לתזמור AI. תומכת בארכיטקטורת מיקרוסרוויס מבוססת אירועים, אסטרטגיות חיפוש מרובות (טקסט, וקטור, היברידי), העלאת מסמכים עם Azure Document Intelligence, ופריסה ב-Azure Container Apps או Azure Kubernetes Service.

**התחלה מהירה**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot עם Azure AI Foundry

**מאגר:** [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**שירותים:** Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**תיאור:** עוזר קופלוט קמעונאי RAG מקצה לקצה עם Azure AI Foundry ו-Prompty. צ'אטבוט לקמעונאי חיצוני של Contoso המבסס תשובות על קטלוג מוצרים ונתוני הזמנות לקוחות. מדגים את תהליך GenAIOps המלא — פרוטוטייפ עם Prompty, הערכה עם מעריכים מונחי AI, ופריסה דרך AZD ל-Container Apps.

**התחלה מהירה**:
```bash
azd init --template contoso-chat
azd up
```

### אפליקציית Multi-Agent לכתיבה יצירתית

**מאגר:** [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**שירותים:** Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**תיאור:** דוגמת multi-agent המדגימה תזמור סוכני AI עם Prompty. משתמש בסוכן מחקר (Bing Grounding בשירות Azure AI Agent), סוכן מוצר (Azure AI Search), סוכן כותב, וסוכן עורך ליצירת מאמרים מחקריים שיתופיים. כולל CI/CD עם הערכות ב-GitHub Actions.

**התחלה מהירה**:
```bash
azd init --template contoso-creative-writer
azd up
```

### צ'אט RAG ללא שרת (JavaScript/TypeScript)

**מאגר:** [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**שירותים:** Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB ל-NoSQL + LangChain.js

**תיאור:** צ'אטבוט RAG ללא שרת המשתמש ב-LangChain.js עם Azure Functions ל-API ו-Azure Static Web Apps לאירוח. משתמש ב-Azure Cosmos DB כמאגר וקטורים ומאגר היסטוריית צ'אט. תומך בפיתוח מקומי עם Ollama לבדיקות ללא עלות.

**התחלה מהירה**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### מאיץ פתרון צ'אט עם הנתונים שלך

**מאגר:** [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**שירותים:** Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**תיאור:** מאיץ פתרון RAG ברמת ארגון עם פורטל ניהול להעלאת וניהול מסמכים, אפשרויות ייעול מרובות (Semantic Kernel, LangChain, Prompt Flow), דיבור לטקסט, אינטגרציה עם Microsoft Teams, ובחירת בסיס נתונים PostgreSQL או Cosmos DB. מיועד כנקודת התחלה מותאמת לתרחישי RAG בפרודקשן.

**התחלה מהירה**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### סוכני נסיעות AI — תזמור Multi-Agent MCP

**מאגר:** [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**שירותים:** Azure OpenAI + Azure AI Foundry + Azure Container Apps + שרתי MCP (.NET, Python, Java, TypeScript)

**תיאור:** אפליקציית הפניה לתזמור סוכני AI רב-סוכניים באמצעות שלוש פלטפורמות (LangChain.js, LlamaIndex.TS, Microsoft Agent Framework). כולל שרתי MCP (Model Context Protocol) בארבע שפות, פרוסים כ-Azure Container Apps ללא שרת עם ניטור OpenTelemetry.

**התחלה מהירה**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**מאגר:** [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**שירותים:** שירותי Azure AI + Azure OpenAI

**תיאור:** תבנית Bicep מינימלית המפריסה שירותי Azure AI עם מודלי למידת מכונה מוגדרים. נקודת התחלה קלה כאשר דרושה רק תשתית Azure AI מזורזת ללא ערימת יישום מלאה.

**התחלה מהירה**:
```bash
azd init --template azd-ai-starter
azd up
```

> **עיין בעוד תבניות**: בקר ב-[גלריית תבניות AZD AI Awesome](https://azure.github.io/awesome-azd/?tags=ai) עם מעל 80 תבניות AI ייעודיות למגוון שפות ותסריטים.

## צעדים הבאים

1. **נסה את הדוגמאות**: התחל מתבנית מוכנה שמתאימה למקרה השימוש שלך
2. **התאם לצרכים שלך**: שנה את התשתית וקוד היישום
3. **הוסף ניטור**: יישם תצפית מקיפה
4. **אופטימיזציית עלויות**: כוונן תצורות לפי התקציב שלך
5. **אבטח את הפריסה שלך**: יישם דפוסי אבטחה ארגוניים
6. **קנה מידה לפרודקשן**: הוסף תכונות מולטי-אזור ועם זמינות גבוהה

## 🎯 תרגילים מעשיים

### תרגיל 1: פריסת אפליקציית צ'אט Microsoft Foundry Models (30 דקות)
**מטרה**: לפרוס ולבדוק אפליקציית צ'אט AI מוכנה לפרודקשן

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

# נטר פעולות בינה מלאכותית
azd monitor

# נקה
azd down --force --purge
```

**קריטריוני הצלחה:**
- [ ] הפריסה הושלמה ללא שגיאות מכסה
- [ ] ניתן לגשת לממשק הצ'אט בדפדפן
- [ ] ניתן לשאול שאלות ולקבל תגובות מונעות AI
- [ ] Application Insights מראה נתוני טלמטריה
- [ ] משאבים ניטרלו בהצלחה

**עלות משוערת**: 5-10 דולר עבור 30 דקות בדיקה

### תרגיל 2: פריסת מודלים מרובים (45 דקות)
**מטרה**: לפרוס מודלים מרובים עם תצורות שונות

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
  name: 'text-embedding-ada-002'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-ada-002'
      version: '2'
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
- [ ] מספר מודלים פורסו בהצלחה
- [ ] יישום הגדרות קיבולת שונות
- [ ] מודלים נגישים דרך API
- [ ] ניתן לקרוא לשני המודלים מהיישום

### תרגיל 3: יישום ניטור עלויות (20 דקות)
**מטרה**: להגדיר אזעקות תקציב ומעקב עלויות

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
- [ ] אזעקת תקציב נוצרה ב-Azure
- [ ] התראות בדוא"ל הוגדרו
- [ ] ניתן לצפות בנתוני עלות בפורטל Azure
- [ ] ספי התקציב הוגדרו כראוי

## 💡 שאלות נפוצות

<details>
<summary><strong>כיצד להפחית עלויות של Microsoft Foundry Models במהלך פיתוח?</strong></summary>

1. **השתמש בשכבת חינם**: Microsoft Foundry Models מציע 50,000 טוקנים בחודש ללא עלות
2. **הפחת קיבולת**: הגדר קיבולת ל-10 TPM במקום 30+ לפיתוח
3. **השתמש ב-azd down**: שחרר משאבים כשאינך מפתח באופן פעיל
4. **מטמון תגובות**: יישם מטמון Redis לשאילתות חוזרות
5. **השתמש בהנדסת פקודות**: הפחת שימוש בטוקנים עם פקודות יעילות

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
- אימות באמצעות זהות מנוהלת
- מכסות גבוהות זמינות

**OpenAI API**:
- גישה מהירה למודלים חדשים
- התקנה פשוטה
- מחסום כניסה נמוך
- רק אינטרנט ציבורי

ליישומי פרודקשן, **מומלץ להשתמש ב-Microsoft Foundry Models**.
</details>

<details>
<summary><strong>איך מטפלים בשגיאות של חריגה ממכסת Microsoft Foundry Models?</strong></summary>

```bash
# בדוק את המכסה הנוכחית
az cognitiveservices usage list --location eastus2

# נסה אזור שונה
azd env set AZURE_LOCATION westus2
azd up

# הפחת את הקיבולת באופן זמני
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# בקש הגדלת מכסה
# עבור לפורטל Azure > מכסות > בקש הגדלה
```
</details>

<details>
<summary><strong>האם ניתן להשתמש בנתונים שלי עם Microsoft Foundry Models?</strong></summary>

כן! השתמש ב-**Azure AI Search** עבור RAG (הפקה מונעת שליפה):

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
<summary><strong>כיצד לאבטח נקודות קצה של מודלים מבוססי AI?</strong></summary>

**שיטות מומלצות**:
1. השתמש ב-Managed Identity (ללא מפתחות API)
2. הפעל Private Endpoints
3. קבע קבוצות אבטחת רשת
4. יישם הגבלת קצב
5. השתמש ב-Azure Key Vault לסודות

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
- **AZD GitHub**: [בעיות ודיונים](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [תיעוד רשמי](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [מיומנות Microsoft Foundry באתרים skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - התקן כישורי סוכן Azure + Foundry בעורך שלך עם `npx skills add microsoft/github-copilot-for-azure`

---

**ניווט בפרקים:**
- **📚 עמוד הקורס הראשי**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 2 - פיתוח המונחה AI
- **⬅️ הפרק הקודם**: [פרק 1: הפרויקט הראשון שלך](../chapter-01-foundation/first-project.md)
- **➡️ הבא**: [פריסת מודל AI](ai-model-deployment.md)
- **🚀 הפרק הבא**: [פרק 3: קונפיגורציה](../chapter-03-configuration/configuration.md)

**צריך עזרה?** הצטרף לדיונים בקהילה שלנו או פתח בעיה במחסן. קהילת Azure AI + AZD כאן כדי לעזור לך להצליח!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). בעוד שאנו שואפים לדיוק, יש לקחת בחשבון כי תרגומים אוטומטיים עשויים להכיל שגיאות או אי-דיוקים. המסמך המקורי בשפת המקור שלו ייחשב כמקור הסמכות. למידע קריטי מומלץ להשתמש בשירותי תרגום מקצועיים של בני אדם. איננו אחראים לכל אי הבנה או פרשנות שגויה הנובעת מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->