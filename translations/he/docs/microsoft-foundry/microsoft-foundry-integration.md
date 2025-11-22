<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2e61bc7db9c28647211ab64e03045882",
  "translation_date": "2025-11-21T19:24:53+00:00",
  "source_file": "docs/microsoft-foundry/microsoft-foundry-integration.md",
  "language_code": "he"
}
-->
# אינטגרציה של Microsoft Foundry עם AZD

**ניווט פרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 2 - פיתוח מבוסס AI
- **⬅️ פרק קודם**: [פרק 1: הפרויקט הראשון שלך](../getting-started/first-project.md)
- **➡️ הבא**: [פריסת מודל AI](ai-model-deployment.md)
- **🚀 פרק הבא**: [פרק 3: תצורה](../getting-started/configuration.md)

## סקירה כללית

מדריך זה מציג כיצד לשלב את שירותי Microsoft Foundry עם Azure Developer CLI (AZD) לפריסות יישומי AI יעילות. Microsoft Foundry מספקת פלטפורמה מקיפה לבנייה, פריסה וניהול של יישומי AI, בעוד AZD מפשט את תהליך התשתית והפריסה.

## מהו Microsoft Foundry?

Microsoft Foundry היא פלטפורמה מאוחדת של מיקרוסופט לפיתוח AI הכוללת:

- **קטלוג מודלים**: גישה למודלים AI מתקדמים
- **Prompt Flow**: מעצב חזותי לזרימות עבודה של AI
- **AI Foundry Portal**: סביבת פיתוח משולבת ליישומי AI
- **אפשרויות פריסה**: אפשרויות אירוח והרחבה מגוונות
- **בטיחות ואבטחה**: תכונות מובנות של AI אחראי

## AZD + Microsoft Foundry: טובים יותר יחד

| תכונה | Microsoft Foundry | יתרון אינטגרציה עם AZD |
|-------|-------------------|------------------------|
| **פריסת מודלים** | פריסה ידנית בפורטל | פריסות אוטומטיות וחוזרות |
| **תשתית** | הקצאה בלחיצת כפתור | תשתית כקוד (Bicep) |
| **ניהול סביבות** | מיקוד בסביבה אחת | סביבות מרובות (פיתוח/בדיקות/ייצור) |
| **אינטגרציה עם CI/CD** | מוגבלת | תמיכה מובנית ב-GitHub Actions |
| **ניהול עלויות** | ניטור בסיסי | אופטימיזציה לפי סביבה |

## דרישות מקדימות

- מנוי Azure עם הרשאות מתאימות
- התקנת Azure Developer CLI
- גישה לשירותי Azure OpenAI
- היכרות בסיסית עם Microsoft Foundry

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

**שימוש**: פריסת יישומים מבוססי RAG (הפקת תשובות משופרת)

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

### דפוס 3: אינטגרציה של אינטליגנציה מסמכים

**שימוש**: זרימות עבודה לעיבוד וניתוח מסמכים

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
# שירותי AI מרכזיים
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

**תצורת פיתוח:**
```bash
# הגדרות אופטימליות לעלות לפיתוח
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # שכבה חינמית
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

### פריסה בפקודה אחת

```bash
# פרוס הכל עם פקודה אחת
azd up

# או פרוס בהדרגה
azd provision  # תשתית בלבד
azd deploy     # יישום בלבד
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

### בעיה 1: חריגת מכסת OpenAI

**תסמינים:**
- פריסה נכשלת עם שגיאות מכסה
- שגיאות 429 ביומני היישום

**פתרונות:**
```bash
# בדוק את השימוש הנוכחי במכסה
az cognitiveservices usage list --location eastus

# נסה אזור אחר
azd env set AZURE_LOCATION westus2
azd up

# הפחת את הקיבולת באופן זמני
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### בעיה 2: כשלים באימות

**תסמינים:**
- שגיאות 401/403 בעת קריאה לשירותי AI
- הודעות "Access denied"

**פתרונות:**
```bash
# אמת הקצאות תפקידים
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# בדוק תצורת זהות מנוהלת
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# אמת גישה ל-Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### בעיה 3: בעיות בפריסת מודלים

**תסמינים:**
- מודלים אינם זמינים בפריסה
- גרסאות מודלים ספציפיות נכשלות

**פתרונות:**
```bash
# רשימת דגמים זמינים לפי אזור
az cognitiveservices model list --location eastus

# עדכון גרסת דגם בתבנית bicep
# בדיקת דרישות קיבולת דגם
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
4. **אופטימיזציה לעלויות**: כווננו תצורות בהתאם לתקציב שלכם
5. **אבטחו את הפריסה שלכם**: יישמו דפוסי אבטחה ארגוניים
6. **הרחיבו לייצור**: הוסיפו תכונות רב-אזוריות וזמינות גבוהה

## 🎯 תרגילים מעשיים

### תרגיל 1: פריסת יישום צ'אט Azure OpenAI (30 דקות)
**מטרה**: לפרוס ולבדוק יישום צ'אט AI מוכן לייצור

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

# עקוב אחר פעולות AI
azd monitor

# נקה
azd down --force --purge
```

**קריטריונים להצלחה:**
- [ ] הפריסה מסתיימת ללא שגיאות מכסה
- [ ] ניתן לגשת לממשק הצ'אט בדפדפן
- [ ] ניתן לשאול שאלות ולקבל תשובות מבוססות AI
- [ ] Application Insights מציג נתוני טלמטריה
- [ ] משאבים נוקו בהצלחה

**עלות משוערת**: $5-10 עבור 30 דקות של בדיקה

### תרגיל 2: הגדרת פריסת מודלים מרובים (45 דקות)
**מטרה**: לפרוס מספר מודלים AI עם תצורות שונות

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

**קריטריונים להצלחה:**
- [ ] מספר מודלים נפרסו בהצלחה
- [ ] יושמו הגדרות קיבולת שונות
- [ ] מודלים נגישים דרך API
- [ ] ניתן לקרוא לשני המודלים מהיישום

### תרגיל 3: יישום ניטור עלויות (20 דקות)
**מטרה**: להגדיר התראות תקציב ומעקב עלויות

```bash
# הוסף התראה תקציבית ל-Bicep
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

# פרוס התראה תקציבית
azd provision

# בדוק עלויות נוכחיות
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**קריטריונים להצלחה:**
- [ ] התראת תקציב נוצרה ב-Azure
- [ ] הודעות דוא"ל הוגדרו
- [ ] ניתן לצפות בנתוני עלויות בפורטל Azure
- [ ] ספי תקציב הוגדרו כראוי

## 💡 שאלות נפוצות

<details>
<summary><strong>איך אני מפחית עלויות Azure OpenAI במהלך הפיתוח?</strong></summary>

1. **השתמשו במדרגת חינם**: Azure OpenAI מציע 50,000 אסימונים/חודש בחינם
2. **הפחיתו קיבולת**: הגדירו קיבולת ל-10 TPM במקום 30+ לפיתוח
3. **השתמשו ב-azd down**: שחררו משאבים כשלא מפתחים באופן פעיל
4. **מטמון תגובות**: יישמו Redis למטמון שאילתות חוזרות
5. **הנדסת הנחיות**: הפחיתו שימוש באסימונים עם הנחיות יעילות

```bash
# תצורת פיתוח
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>מה ההבדל בין Azure OpenAI ל-OpenAI API?</strong></summary>

**Azure OpenAI**:
- אבטחה ותאימות ארגונית
- אינטגרציה עם רשת פרטית
- הבטחות SLA
- אימות זהות מנוהלת
- מכסות גבוהות יותר זמינות

**OpenAI API**:
- גישה מהירה יותר למודלים חדשים
- הגדרה פשוטה יותר
- חסם כניסה נמוך יותר
- אינטרנט ציבורי בלבד

ליישומים בייצור, **Azure OpenAI מומלץ**.
</details>

<details>
<summary><strong>איך אני מתמודד עם שגיאות חריגת מכסת Azure OpenAI?</strong></summary>

```bash
# בדוק את המכסה הנוכחית
az cognitiveservices usage list --location eastus2

# נסה אזור אחר
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
<summary><strong>האם אני יכול להשתמש בנתונים שלי עם Azure OpenAI?</strong></summary>

כן! השתמשו ב-**Azure AI Search** עבור RAG (הפקת תשובות משופרת):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

ראו את תבנית [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>איך אני מאבטח נקודות קצה של מודלים AI?</strong></summary>

**שיטות מומלצות**:
1. השתמשו בזהות מנוהלת (ללא מפתחות API)
2. הפעילו נקודות קצה פרטיות
3. הגדירו קבוצות אבטחת רשת
4. יישמו הגבלת קצב
5. השתמשו ב-Azure Key Vault עבור סודות

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
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 2 - פיתוח מבוסס AI
- **⬅️ פרק קודם**: [פרק 1: הפרויקט הראשון שלך](../getting-started/first-project.md)
- **➡️ הבא**: [פריסת מודל AI](ai-model-deployment.md)
- **🚀 פרק הבא**: [פרק 3: תצורה](../getting-started/configuration.md)

**זקוקים לעזרה?** הצטרפו לדיוני הקהילה או פתחו בעיה במאגר. קהילת Azure AI + AZD כאן כדי לעזור לכם להצליח!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום AI [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי אנושי. איננו אחראים לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->