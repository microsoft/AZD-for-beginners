<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "894be87a84e7f669a164d4f67545c8ac",
  "translation_date": "2025-09-18T07:08:03+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "he"
}
-->
# אינטגרציה של Azure AI Foundry עם AZD

**ניווט פרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 2 - פיתוח מבוסס AI
- **⬅️ פרק קודם**: [פרק 1: הפרויקט הראשון שלך](../getting-started/first-project.md)
- **➡️ הבא**: [פריסת מודל AI](ai-model-deployment.md)
- **🚀 פרק הבא**: [פרק 3: תצורה](../getting-started/configuration.md)

## סקירה כללית

מדריך זה מציג כיצד לשלב את שירותי Azure AI Foundry עם Azure Developer CLI (AZD) כדי לייעל את תהליכי הפריסה של יישומי AI. Azure AI Foundry מספק פלטפורמה מקיפה לבנייה, פריסה וניהול של יישומי AI, בעוד ש-AZD מפשט את תהליכי התשתית והפריסה.

## מהו Azure AI Foundry?

Azure AI Foundry הוא פלטפורמה מאוחדת של מיקרוסופט לפיתוח AI הכוללת:

- **קטלוג מודלים**: גישה למודלים מתקדמים של AI
- **Prompt Flow**: מעצב חזותי לזרימות עבודה של AI
- **AI Foundry Portal**: סביבת פיתוח משולבת ליישומי AI
- **אפשרויות פריסה**: מגוון אפשרויות אירוח והרחבה
- **בטיחות ואבטחה**: תכונות מובנות של AI אחראי

## AZD + Azure AI Foundry: טובים יותר יחד

| תכונה | Azure AI Foundry | יתרון אינטגרציה עם AZD |
|-------|------------------|------------------------|
| **פריסת מודלים** | פריסה ידנית דרך הפורטל | פריסות אוטומטיות וחוזרות |
| **תשתית** | הקצאה דרך ממשק משתמש | תשתית כקוד (Bicep) |
| **ניהול סביבות** | מיקוד בסביבה אחת | ריבוי סביבות (פיתוח/בדיקות/ייצור) |
| **אינטגרציה עם CI/CD** | מוגבלת | תמיכה מובנית ב-GitHub Actions |
| **ניהול עלויות** | ניטור בסיסי | אופטימיזציה לפי סביבה |

## דרישות מקדימות

- מנוי Azure עם הרשאות מתאימות
- התקנת Azure Developer CLI
- גישה לשירותי Azure OpenAI
- היכרות בסיסית עם Azure AI Foundry

## דפוסי אינטגרציה מרכזיים

### דפוס 1: אינטגרציה עם Azure OpenAI

**שימוש**: פריסת יישומי צ'אט עם מודלים של Azure OpenAI

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
// Azure OpenAI Account
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

### דפוס 2: חיפוש AI + אינטגרציה עם RAG

**שימוש**: פריסת יישומים מבוססי חיפוש מוגבר (RAG)

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

### דפוס 3: אינטגרציה של ניתוח מסמכים

**שימוש**: תהליכי עיבוד וניתוח מסמכים

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
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**תצורת פיתוח:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
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

### פריסה בפקודה אחת

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### פריסות לפי סביבה

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

## ניטור ותצפיות

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

## אופטימיזציה לביצועים

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

### תצורת הרחבה אוטומטית

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
- פריסה נכשלת עם שגיאות מכסה
- שגיאות 429 ביומני היישום

**פתרונות:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try different region
azd env set AZURE_LOCATION westus2
azd up

# Reduce capacity temporarily
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### בעיה 2: כשלי אימות

**תסמינים:**
- שגיאות 401/403 בעת קריאה לשירותי AI
- הודעות "Access denied"

**פתרונות:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### בעיה 3: בעיות בפריסת מודלים

**תסמינים:**
- מודלים אינם זמינים בפריסה
- גרסאות ספציפיות של מודלים נכשלות

**פתרונות:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## תבניות לדוגמה

### יישום צ'אט בסיסי

**מאגר**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**שירותים**: Azure OpenAI + Cognitive Search + App Service

**התחלה מהירה**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### צינור עיבוד מסמכים

**מאגר**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**שירותים**: Document Intelligence + Storage + Functions

**התחלה מהירה**:
```bash
azd init --template ai-document-processing
azd up
```

### צ'אט ארגוני עם RAG

**מאגר**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**שירותים**: Azure OpenAI + Search + Container Apps + Cosmos DB

**התחלה מהירה**:
```bash
azd init --template contoso-chat
azd up
```

## צעדים הבאים

1. **נסו את הדוגמאות**: התחילו עם תבנית מוכנה שמתאימה לצרכים שלכם
2. **התאימו לצרכים שלכם**: שנו את התשתית וקוד היישום
3. **הוסיפו ניטור**: יישמו תצפיות מקיפות
4. **אופטימיזציה לעלויות**: כווננו את התצורות בהתאם לתקציב שלכם
5. **אבטחו את הפריסה שלכם**: יישמו דפוסי אבטחה ארגוניים
6. **הרחיבו לייצור**: הוסיפו תכונות של ריבוי אזורים וזמינות גבוהה

## קהילה ותמיכה

- **Azure AI Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [תיעוד רשמי](https://learn.microsoft.com/azure/ai-studio/)

---

**ניווט פרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 2 - פיתוח מבוסס AI
- **⬅️ פרק קודם**: [פרק 1: הפרויקט הראשון שלך](../getting-started/first-project.md)
- **➡️ הבא**: [פריסת מודל AI](ai-model-deployment.md)
- **🚀 פרק הבא**: [פרק 3: תצורה](../getting-started/configuration.md)

**זקוקים לעזרה?** הצטרפו לדיוני הקהילה או פתחו בעיה במאגר. קהילת Azure AI + AZD כאן כדי לעזור לכם להצליח!

---

**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי על ידי אדם. איננו נושאים באחריות לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.