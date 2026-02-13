# Microsoft Foundry Integration with AZD

**ניווט פרקים:**
- **📚 דף הקורס**: [AZD For Beginners](../../README.md)
- **📖 הפרק הנוכחי**: פרק 2 - פיתוח ממוקד ב-AI
- **⬅️ פרק קודם**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ הבא**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 הפרק הבא**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## מבוא

מדריך זה מראה כיצד לשלב את שירותי Microsoft Foundry עם Azure Developer CLI (AZD) לפריסת יישומי AI בצורה חלקה. Microsoft Foundry מספקת פלטפורמה מקיפה לבניית, פריסה וניהול יישומי בינה מלאכותית, בעוד ש-AZD מפשטת את התשתית ותהליך הפריסה.

## מה זה Microsoft Foundry?

Microsoft Foundry היא הפלטפורמה המאוחדת של Microsoft לפיתוח AI הכוללת:

- **Model Catalog**: גישה לדגמי AI מתקדמים
- **Prompt Flow**: מעצב חזותי לזרימות עבודה של AI
- **AI Foundry Portal**: סביבת פיתוח משולבת ליישומי AI
- **Deployment Options**: אפשרויות אירוח והתוויה מרובות
- **Safety and Security**: תכונות אחראיות לבינה מלאכותית מובנות

## AZD + Microsoft Foundry: טובים יותר ביחד

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limited | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## דרישות מקדימות

- מנוי Azure עם הרשאות מתאימות
- Azure Developer CLI מותקן
- גישה לשירותי Azure OpenAI
- היכרות בסיסית עם Microsoft Foundry

## דפוסי שילוב עיקריים

### דפוס 1: שילוב Azure OpenAI

**מקרה שימוש**: פריסת יישומי צ'אט עם דגמי Azure OpenAI

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

### דפוס 2: חיפוש AI + שילוב RAG

**מקרה שימוש**: פריסת יישומי RAG (Retrieval-Augmented Generation)

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

### דפוס 3: שילוב Document Intelligence

**מקרה שימוש**: זרימות עבודה של עיבוד וניתוח מסמכים

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

**תצורת Production:**
```bash
# שירותי בינה מלאכותית מרכזיים
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# תצורות מודל
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# הגדרות ביצועים
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**תצורת Development:**
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

### פריסה בפקודה יחידה

```bash
# פרוס הכל באמצעות פקודה אחת
azd up

# או פרוס בשלבים
azd provision  # תשתית בלבד
azd deploy     # יישום בלבד
```

### פריסות ייעודיות לסביבות

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

### שילוב עם Application Insights

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

### אסטרטגיות caching

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

### קונפיגורציית סקייל אוטומטי

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

## פתרון תקלות נפוצות

### בעיה 1: חריגה ממכסת OpenAI

**תסמינים:**
- הפריסה נכשלת עם שגיאות מכסה
- שגיאות 429 בלוגים של היישום

**פתרונות:**
```bash
# בדוק את השימוש הנוכחי במכסה
az cognitiveservices usage list --location eastus

# נסה אזור אחר
azd env set AZURE_LOCATION westus2
azd up

# הקטן את הקיבולת באופן זמני
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### בעיה 2: כשלי אימות

**תסמינים:**
- שגיאות 401/403 בעת קריאה לשירותי AI
- הודעות "Access denied"

**פתרונות:**
```bash
# אמת את הקצאות התפקידים
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# בדוק את תצורת הזהות המנוהלת
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# אמת את הגישה ל-Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### בעיה 3: בעיות בפריסת מודלים

**תסמינים:**
- מודלים לא זמינים בפריסה
- גרסאות מודל ספציפיות נכשלות

**פתרונות:**
```bash
# הצג את המודלים הזמינים לפי אזור
az cognitiveservices model list --location eastus

# עדכן את גרסת המודל בתבנית Bicep
# בדוק את דרישות הקיבולת של המודל
```

## תבניות לדוגמה

### אפליקציית צ'אט בסיסית

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

## הצעדים הבאים

1. **נסו את הדוגמאות**: התחילו בתבנית מוכנה שמתאימה למקרה השימוש שלכם
2. **התאימו לצרכים שלכם**: שנו את התשתית וקוד היישום
3. **הוסיפו ניטור**: יישמו תצפית מקיפה
4. **אופטימיזציה של עלויות**: כווננו תצורות בהתאם לתקציב
5. **אבטחו את הפריסה שלכם**: יישמו דפוסי אבטחה ארגוניים
6. **סקייל לפרודקשן**: הוסיפו אזורים מרובים ותכונות זמינות גבוהה

## 🎯 תרגילים מעשיים

### תרגיל 1: פריסת אפליקציית צ'אט Azure OpenAI (30 דקות)
**מטרה**: לפרוס ולבדוק אפליקציית צ'אט מוכנה לפרודקשן

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
- [ ] ניתן לשאול שאלות ולקבל תגובות המופעלות על ידי AI
- [ ] Application Insights מציג נתוני טלמטריה
- [ ] ניקוי המשאבים בוצע בהצלחה

**עלות משוערת**: $5-10 עבור 30 דקות של בדיקה

### תרגיל 2: קונפיגורציית פריסה עם מספר מודלים (45 דקות)
**מטרה**: לפרוס מספר דגמי AI עם קונפיגורציות שונות

```bash
# צור תצורת Bicep מותאמת אישית
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// GPT-4o-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4o-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
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
- [ ] מספר מודלים הונחו בהצלחה
- [ ] יישום הגדרות קיבולת שונות
- [ ] מודלים נגישים דרך ה-API
- [ ] ניתן לקרוא לשני המודלים מהיישום

### תרגיל 3: יישום ניטור עלויות (20 דקות)
**מטרה**: להגדיר התראות תקציב ומעקב על עלויות

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

# בדוק את העלויות הנוכחיות
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**קריטריוני הצלחה:**
- [ ] התראת תקציב נוצרה ב-Azure
- [ ] התראות בדוא"ל מוגדרות
- [ ] ניתן לצפות בנתוני עלות ב-Azure Portal
- [ ] ספי התקציב הוגדרו כראוי

## 💡 שאלות נפוצות

<details>
<summary><strong>כיצד אני מצמצם את עלויות Azure OpenAI במהלך הפיתוח?</strong></summary>

1. **השתמש ברמת חינם**: Azure OpenAI מציע 50,000 tokens/חודש בחינם  
2. **הקטן קיבולת**: קבע קיבולת ל-10 TPM במקום 30+ עבור פיתוח  
3. **השתמש ב-azd down**: שחרר משאבים כשאינך מפתח באופן פעיל  
4. **מטמון תגובות**: יישם Redis cache עבור שאילתות חוזרות  
5. **השתמש בהנדסת פרומפטים**: הקטין שימוש ב-tokens בעזרת פרומפטים יעילים

```bash
# תצורת פיתוח
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>מה ההבדל בין Azure OpenAI ל-OpenAI API?</strong></summary>

**Azure OpenAI**:
- אבטחה וציות ארגוניים
- אינטגרציה עם רשת פרטית
- התחייבויות SLA
- אימות באמצעות Managed identity
- מכסות גבוהות יותר זמינות

**OpenAI API**:
- גישה מהירה יותר לדגמים חדשים
- הגדרה פשוטה יותר
- חסם כניסה נמוך יותר
- רק אינטרנט פומבי

לאפליקציות פרודקשן, **מומלץ להשתמש ב-Azure OpenAI**.
</details>

<details>
<summary><strong>כיצד מטפלים בשגיאות של חריגה ממכסת Azure OpenAI?</strong></summary>

```bash
# בדוק את המכסה הנוכחית
az cognitiveservices usage list --location eastus2

# נסה אזור אחר
azd env set AZURE_LOCATION westus2
azd up

# הפחת את הקיבולת באופן זמני
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# בקש העלאת המכסה
# עבור לפורטל Azure > מכסות > בקש הגדלה
```
</details>

<details>
<summary><strong>האם אני יכול להשתמש בנתונים שלי עם Azure OpenAI?</strong></summary>

כן! השתמש ב-**Azure AI Search** עבור RAG (Retrieval Augmented Generation):

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
<summary><strong>כיצד מאבטחים נקודות קצה של מודלים?</strong></summary>

**שיטות מומלצות**:
1. השתמש ב-Managed Identity (ללא מפתחות API)
2. הפעל Private Endpoints
3. קבע קבוצות אבטחת רשת (NSG)
4. יישם הגבלת קצב
5. השתמש ב-Azure Key Vault לניהול סודות

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

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [תיעוד רשמי](https://learn.microsoft.com/azure/ai-studio/)

---

**ניווט פרקים:**
- **📚 דף הקורס**: [AZD For Beginners](../../README.md)
- **📖 הפרק הנוכחי**: פרק 2 - פיתוח ממוקד ב-AI
- **⬅️ פרק קודם**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ הבא**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 הפרק הבא**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**צריך עזרה?** הצטרפו לדיוני הקהילה שלנו או פתחו issue בריפוזיטורי. קהילת Azure AI + AZD כאן כדי לעזור לכם להצליח!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
כתב ויתור:
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית Co-op Translator (https://github.com/Azure/co-op-translator). אנו משתדלים לדייק, אך יש לשים לב שתרגומים אוטומטיים עשויים להכיל שגיאות או אי־דיוקים. יש להסתמך על המסמך המקורי, בגרסתו בשפה המקורית, כמקור הסמכות. עבור מידע קריטי מומלץ תרגום מקצועי על ידי מתרגם אנושי. איננו נושאים באחריות לכל אי־הבנות או פרשנויות שגויות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->