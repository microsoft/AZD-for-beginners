<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2e61bc7db9c28647211ab64e03045882",
  "translation_date": "2025-11-20T11:03:33+00:00",
  "source_file": "docs/microsoft-foundry/microsoft-foundry-integration.md",
  "language_code": "ur"
}
-->
# مائیکروسافٹ فاؤنڈری کا AZD کے ساتھ انضمام

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD ابتدائی افراد کے لیے](../../README.md)
- **📖 موجودہ باب**: باب 2 - AI-فرسٹ ڈیولپمنٹ
- **⬅️ پچھلا باب**: [باب 1: آپ کا پہلا پروجیکٹ](../getting-started/first-project.md)
- **➡️ اگلا**: [AI ماڈل کی تعیناتی](ai-model-deployment.md)
- **🚀 اگلا باب**: [باب 3: کنفیگریشن](../getting-started/configuration.md)

## جائزہ

یہ گائیڈ مائیکروسافٹ فاؤنڈری سروسز کو Azure Developer CLI (AZD) کے ساتھ مربوط کرنے کا طریقہ دکھاتا ہے تاکہ AI ایپلیکیشنز کی تعیناتی کو آسان بنایا جا سکے۔ مائیکروسافٹ فاؤنڈری AI ایپلیکیشنز بنانے، تعینات کرنے، اور ان کا انتظام کرنے کے لیے ایک جامع پلیٹ فارم فراہم کرتا ہے، جبکہ AZD انفراسٹرکچر اور تعیناتی کے عمل کو آسان بناتا ہے۔

## مائیکروسافٹ فاؤنڈری کیا ہے؟

مائیکروسافٹ فاؤنڈری AI ڈیولپمنٹ کے لیے مائیکروسافٹ کا متحد پلیٹ فارم ہے، جس میں شامل ہیں:

- **ماڈل کیٹلاگ**: جدید ترین AI ماڈلز تک رسائی
- **پرومپٹ فلو**: AI ورک فلو کے لیے بصری ڈیزائنر
- **AI فاؤنڈری پورٹل**: AI ایپلیکیشنز کے لیے مربوط ترقیاتی ماحول
- **تعیناتی کے اختیارات**: متعدد ہوسٹنگ اور اسکیلنگ کے اختیارات
- **حفاظت اور سیکیورٹی**: ذمہ دار AI کی خصوصیات شامل ہیں

## AZD + مائیکروسافٹ فاؤنڈری: ایک ساتھ بہتر

| خصوصیت | مائیکروسافٹ فاؤنڈری | AZD انضمام کا فائدہ |
|---------|-----------------|------------------------|
| **ماڈل کی تعیناتی** | دستی پورٹل تعیناتی | خودکار، قابل تکرار تعیناتیاں |
| **انفراسٹرکچر** | کلک تھرو پروویژننگ | انفراسٹرکچر بطور کوڈ (Bicep) |
| **ماحول کا انتظام** | واحد ماحول پر توجہ | متعدد ماحول (dev/staging/prod) |
| **CI/CD انضمام** | محدود | نیٹو GitHub Actions سپورٹ |
| **لاگت کا انتظام** | بنیادی نگرانی | ماحول کے لحاظ سے لاگت کی اصلاح |

## ضروریات

- Azure سبسکرپشن مناسب اجازتوں کے ساتھ
- Azure Developer CLI انسٹال شدہ
- Azure OpenAI سروسز تک رسائی
- مائیکروسافٹ فاؤنڈری کی بنیادی واقفیت

## بنیادی انضمام کے پیٹرنز

### پیٹرن 1: Azure OpenAI انضمام

**استعمال کا کیس**: Azure OpenAI ماڈلز کے ساتھ چیٹ ایپلیکیشنز کی تعیناتی

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

**انفراسٹرکچر (main.bicep):**
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

### پیٹرن 2: AI سرچ + RAG انضمام

**استعمال کا کیس**: ریٹریول-اگمینٹڈ جنریشن (RAG) ایپلیکیشنز کی تعیناتی

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

### پیٹرن 3: دستاویزاتی ذہانت کا انضمام

**استعمال کا کیس**: دستاویزات کی پروسیسنگ اور تجزیاتی ورک فلو

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

## 🔧 کنفیگریشن کے پیٹرنز

### ماحول کے متغیرات کی ترتیب

**پروڈکشن کنفیگریشن:**
```bash
# بنیادی اے آئی خدمات
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# ماڈل کی تشکیل
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# کارکردگی کی ترتیبات
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**ڈیولپمنٹ کنفیگریشن:**
```bash
# ترقی کے لیے لاگت کے لحاظ سے بہتر ترتیبات
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # مفت درجے
```

### Key Vault کے ساتھ محفوظ کنفیگریشن

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

## تعیناتی کے ورک فلو

### سنگل کمانڈ تعیناتی

```bash
# ہر چیز کو ایک کمانڈ کے ساتھ تعینات کریں
azd up

# یا بتدریج تعینات کریں
azd provision  # صرف بنیادی ڈھانچہ
azd deploy     # صرف درخواست
```

### ماحول کے لحاظ سے تعیناتیاں

```bash
# ترقیاتی ماحول
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# پیداواری ماحول
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## نگرانی اور مشاہدہ

### ایپلیکیشن انسائٹس انضمام

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

### لاگت کی نگرانی

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

## 🔐 سیکیورٹی کے بہترین طریقے

### منیجڈ شناخت کی ترتیب

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

### نیٹ ورک سیکیورٹی

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

## کارکردگی کی اصلاح

### کیشنگ کی حکمت عملی

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

### آٹو اسکیلنگ کی ترتیب

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

## عام مسائل کا حل

### مسئلہ 1: OpenAI کوٹہ ختم ہو گیا

**علامات:**
- تعیناتی کوٹہ کی غلطیوں کے ساتھ ناکام ہو جاتی ہے
- ایپلیکیشن لاگز میں 429 غلطیاں

**حل:**
```bash
# موجودہ کوٹہ استعمال کی جانچ کریں
az cognitiveservices usage list --location eastus

# مختلف علاقہ آزمائیں
azd env set AZURE_LOCATION westus2
azd up

# عارضی طور پر صلاحیت کم کریں
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### مسئلہ 2: تصدیق کی ناکامی

**علامات:**
- AI سروسز کو کال کرتے وقت 401/403 غلطیاں
- "رسائی مسترد" کے پیغامات

**حل:**
```bash
# کردار کی تفویضات کی تصدیق کریں
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# منظم شناخت کی تشکیل کی جانچ کریں
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# کلیدی والٹ تک رسائی کی تصدیق کریں
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### مسئلہ 3: ماڈل کی تعیناتی کے مسائل

**علامات:**
- تعیناتی میں ماڈلز دستیاب نہیں
- مخصوص ماڈل ورژنز ناکام ہو رہے ہیں

**حل:**
```bash
# دستیاب ماڈلز کو علاقے کے لحاظ سے فہرست کریں
az cognitiveservices model list --location eastus

# بائسپ ٹیمپلیٹ میں ماڈل ورژن کو اپ ڈیٹ کریں
# ماڈل کی صلاحیت کی ضروریات کو چیک کریں
```

## مثال کے ٹیمپلیٹس

### بنیادی چیٹ ایپلیکیشن

**ریپوزٹری**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**سروسز**: Azure OpenAI + Cognitive Search + App Service

**فوری آغاز**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### دستاویزاتی پروسیسنگ پائپ لائن

**ریپوزٹری**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**سروسز**: Document Intelligence + Storage + Functions

**فوری آغاز**:
```bash
azd init --template ai-document-processing
azd up
```

### انٹرپرائز چیٹ RAG کے ساتھ

**ریپوزٹری**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**سروسز**: Azure OpenAI + Search + Container Apps + Cosmos DB

**فوری آغاز**:
```bash
azd init --template contoso-chat
azd up
```

## اگلے اقدامات

1. **مثالیں آزمائیں**: اپنے استعمال کے کیس سے ملنے والے پہلے سے تیار کردہ ٹیمپلیٹ سے آغاز کریں
2. **اپنی ضروریات کے مطابق بنائیں**: انفراسٹرکچر اور ایپلیکیشن کوڈ میں ترمیم کریں
3. **نگرانی شامل کریں**: جامع مشاہدہ نافذ کریں
4. **لاگت کو بہتر بنائیں**: اپنے بجٹ کے لیے کنفیگریشنز کو بہتر بنائیں
5. **اپنی تعیناتی کو محفوظ بنائیں**: انٹرپرائز سیکیورٹی کے پیٹرنز نافذ کریں
6. **پروڈکشن تک اسکیل کریں**: ملٹی ریجن اور ہائی ایویلیبیلیٹی کی خصوصیات شامل کریں

## 🎯 عملی مشقیں

### مشق 1: Azure OpenAI چیٹ ایپ تعینات کریں (30 منٹ)
**مقصد**: پروڈکشن کے لیے تیار AI چیٹ ایپلیکیشن کو تعینات کریں اور ٹیسٹ کریں

```bash
# سانچہ شروع کریں
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# ماحول کے متغیرات سیٹ کریں
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# تعینات کریں
azd up

# درخواست کی جانچ کریں
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# اے آئی آپریشنز کی نگرانی کریں
azd monitor

# صفائی کریں
azd down --force --purge
```

**کامیابی کے معیار:**
- [ ] تعیناتی کوٹہ کی غلطیوں کے بغیر مکمل ہو جاتی ہے
- [ ] براؤزر میں چیٹ انٹرفیس تک رسائی حاصل کر سکتے ہیں
- [ ] سوالات پوچھ سکتے ہیں اور AI سے جوابات حاصل کر سکتے ہیں
- [ ] ایپلیکیشن انسائٹس ٹیلیمیٹری ڈیٹا دکھاتا ہے
- [ ] وسائل کو کامیابی سے صاف کیا گیا

**اندازاً لاگت**: $5-10 30 منٹ کے ٹیسٹنگ کے لیے

### مشق 2: ملٹی ماڈل تعیناتی ترتیب دیں (45 منٹ)
**مقصد**: مختلف کنفیگریشنز کے ساتھ متعدد AI ماڈلز تعینات کریں

```bash
# حسب ضرورت Bicep ترتیب بنائیں
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

# تعینات کریں اور تصدیق کریں
azd provision
azd show
```

**کامیابی کے معیار:**
- [ ] متعدد ماڈلز کامیابی سے تعینات کیے گئے
- [ ] مختلف صلاحیت کی ترتیبات لاگو کی گئیں
- [ ] ماڈلز API کے ذریعے قابل رسائی ہیں
- [ ] ایپلیکیشن سے دونوں ماڈلز کو کال کر سکتے ہیں

### مشق 3: لاگت کی نگرانی نافذ کریں (20 منٹ)
**مقصد**: بجٹ الرٹس اور لاگت کی ٹریکنگ ترتیب دیں

```bash
# بجٹ الرٹ کو بائیسپ میں شامل کریں
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

# بجٹ الرٹ کو نافذ کریں
azd provision

# موجودہ اخراجات چیک کریں
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**کامیابی کے معیار:**
- [ ] Azure میں بجٹ الرٹ بنایا گیا
- [ ] ای میل نوٹیفکیشنز ترتیب دی گئیں
- [ ] Azure پورٹل میں لاگت کا ڈیٹا دیکھ سکتے ہیں
- [ ] بجٹ کی حدیں مناسب طریقے سے مقرر کی گئیں

## 💡 اکثر پوچھے گئے سوالات

<details>
<summary><strong>ڈیولپمنٹ کے دوران Azure OpenAI کی لاگت کو کیسے کم کریں؟</strong></summary>

1. **مفت ٹائر استعمال کریں**: Azure OpenAI 50,000 ٹوکن/ماہ مفت فراہم کرتا ہے
2. **صلاحیت کو کم کریں**: ڈیولپمنٹ کے لیے 10 TPM کی صلاحیت مقرر کریں بجائے 30+ کے
3. **azd down استعمال کریں**: فعال طور پر ڈیولپمنٹ نہ کرنے پر وسائل کو ڈیلوکیٹ کریں
4. **جوابات کو کیش کریں**: بار بار کے سوالات کے لیے Redis کیش نافذ کریں
5. **پرومپٹ انجینئرنگ استعمال کریں**: مؤثر پرومپٹس کے ساتھ ٹوکن کے استعمال کو کم کریں

```bash
# ترقی کی تشکیل
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Azure OpenAI اور OpenAI API میں کیا فرق ہے؟</strong></summary>

**Azure OpenAI**:
- انٹرپرائز سیکیورٹی اور تعمیل
- پرائیویٹ نیٹ ورک انضمام
- SLA گارنٹیز
- منیجڈ شناخت کی تصدیق
- زیادہ کوٹہ دستیاب

**OpenAI API**:
- نئے ماڈلز تک تیز رسائی
- آسان سیٹ اپ
- کم رکاوٹ
- صرف عوامی انٹرنیٹ

پروڈکشن ایپلیکیشنز کے لیے، **Azure OpenAI کی سفارش کی جاتی ہے**۔
</details>

<details>
<summary><strong>Azure OpenAI کوٹہ ختم ہونے کی غلطیوں کو کیسے ہینڈل کریں؟</strong></summary>

```bash
# موجودہ کوٹہ چیک کریں
az cognitiveservices usage list --location eastus2

# مختلف علاقہ آزمائیں
azd env set AZURE_LOCATION westus2
azd up

# عارضی طور پر صلاحیت کم کریں
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# کوٹہ بڑھانے کی درخواست کریں
# Azure پورٹل پر جائیں > کوٹہ > اضافہ کی درخواست کریں
```
</details>

<details>
<summary><strong>کیا میں Azure OpenAI کے ساتھ اپنا ڈیٹا استعمال کر سکتا ہوں؟</strong></summary>

جی ہاں! **Azure AI Search** کو RAG (Retrieval Augmented Generation) کے لیے استعمال کریں:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

دیکھیں [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) ٹیمپلیٹ۔
</details>

<details>
<summary><strong>AI ماڈل کے اینڈپوائنٹس کو کیسے محفوظ کریں؟</strong></summary>

**بہترین طریقے**:
1. منیجڈ شناخت استعمال کریں (کوئی API کیز نہیں)
2. پرائیویٹ اینڈپوائنٹس کو فعال کریں
3. نیٹ ورک سیکیورٹی گروپس کو ترتیب دیں
4. ریٹ لمٹنگ نافذ کریں
5. رازوں کے لیے Azure Key Vault استعمال کریں

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

## کمیونٹی اور سپورٹ

- **مائیکروسافٹ فاؤنڈری ڈسکارڈ**: [#Azure چینل](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [مسائل اور مباحثے](https://github.com/Azure/azure-dev)
- **مائیکروسافٹ لرن**: [سرکاری دستاویزات](https://learn.microsoft.com/azure/ai-studio/)

---

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD ابتدائی افراد کے لیے](../../README.md)
- **📖 موجودہ باب**: باب 2 - AI-فرسٹ ڈیولپمنٹ
- **⬅️ پچھلا باب**: [باب 1: آپ کا پہلا پروجیکٹ](../getting-started/first-project.md)
- **➡️ اگلا**: [AI ماڈل کی تعیناتی](ai-model-deployment.md)
- **🚀 اگلا باب**: [باب 3: کنفیگریشن](../getting-started/configuration.md)

**مدد چاہیے؟** ہماری کمیونٹی مباحثوں میں شامل ہوں یا ریپوزٹری میں مسئلہ کھولیں۔ Azure AI + AZD کمیونٹی آپ کی کامیابی کے لیے یہاں موجود ہے!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈسکلیمر**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ ہم درستگی کے لیے کوشش کرتے ہیں، لیکن براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا غیر درستیاں ہو سکتی ہیں۔ اصل دستاویز کو اس کی اصل زبان میں مستند ذریعہ سمجھا جانا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->