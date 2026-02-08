# Microsoft Foundry کا AZD کے ساتھ انضمام

**Chapter Navigation:**
- **📚 کورس ہوم**: [AZD برائے مبتدی](../../README.md)
- **📖 موجودہ باب**: باب 2 - AI-First Development
- **⬅️ پچھلا باب**: [باب 1: آپ کا پہلا پروجیکٹ](../chapter-01-foundation/first-project.md)
- **➡️ اگلا**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 اگلا باب**: [باب 3: Configuration](../chapter-03-configuration/configuration.md)

## جائزہ

یہ رہنما بتاتی ہے کہ Microsoft Foundry سروسز کو Azure Developer CLI (AZD) کے ساتھ کس طرح جوڑا جائے تاکہ AI ایپلیکیشن کی تعیناتی کو سادہ بنایا جا سکے۔ Microsoft Foundry AI ایپلیکیشنز بنانے، تعینات کرنے، اور منظم کرنے کے لیے ایک جامع پلیٹ فارم فراہم کرتا ہے، جبکہ AZD انفراسٹرکچر اور تعیناتی کے عمل کو آسان بناتا ہے۔

## Microsoft Foundry کیا ہے؟

Microsoft Foundry مائیکروسافٹ کا متحدہ پلیٹ فارم ہے جو AI ترقی کے لیے درج ذیل شامل کرتا ہے:

- **Model Catalog**: جدید ترین AI ماڈلز تک رسائی
- **Prompt Flow**: AI ورک فلو کے لیے بصری ڈیزائنر
- **AI Foundry Portal**: AI ایپلیکیشنز کے لیے مربوط ترقیاتی ماحول
- **Deployment Options**: متعدد ہوسٹنگ اور اسکیلنگ آپشنز
- **Safety and Security**: ذمہ دار AI خصوصیات اندرونی طور پر

## AZD + Microsoft Foundry: بہتر ساتھ

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | خودکار، دہرائے جانے والے تعیناتیاں |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | کثیر محیطی (dev/staging/prod) |
| **CI/CD Integration** | Limited | مقامی GitHub Actions کی حمایت |
| **Cost Management** | Basic monitoring | ماحول کے حساب سے لاگت کی اصلاح |

## درکار چیزیں

- مناسب اجازتوں کے ساتھ Azure سبسکرپشن
- Azure Developer CLI نصب
- Azure OpenAI خدمات تک رسائی
- Microsoft Foundry کی بنیادی واقفیت

## بنیادی انضمام کے نمونے

### پیٹرن 1: Azure OpenAI انضمام

**استعمال کا معاملہ**: Azure OpenAI ماڈلز کے ساتھ چیٹ ایپلیکیشنز تعینات کریں

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

**Infrastructure (main.bicep):**
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

### پیٹرن 2: AI Search + RAG انضمام

**استعمال کا معاملہ**: retrieval-augmented generation (RAG) ایپلیکیشنز تعینات کریں

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

### پیٹرن 3: Document Intelligence انضمام

**استعمال کا معاملہ**: دستاویزات کی پروسیسنگ اور تجزیہ کے ورک فلو

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

## 🔧 تشکیل کے نمونے

### ماحول کی متغیرات کی ترتیب

**پروڈکشن کنفیگریشن:**
```bash
# مصنوعی ذہانت کی بنیادی خدمات
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# ماڈل کی ترتیبات
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# کارکردگی کی ترتیبات
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**ڈیویلپمنٹ کنفیگریشن:**
```bash
# ڈیولپمنٹ کے لیے لاگت کے لحاظ سے بہتر کردہ ترتیبات
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # مفت سطح
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

## تعیناتی ورک فلو

### ایک کمانڈ تعیناتی

```bash
# ایک کمانڈ سے سب کچھ تعینات کریں
azd up

# یا بتدریج تعینات کریں
azd provision  # صرف بنیادی ڈھانچہ
azd deploy     # صرف ایپلیکیشن
```

### ماحول مخصوص تعیناتیاں

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

## مانیٹرنگ اور مشاہدت

### Application Insights انضمام

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

## 🔐 سیکیورٹی کی بہترین مشقیں

### Managed Identity کنفیگریشن

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

### کیشنگ کی حکمتِ عملیاں

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

### آٹو سکیلنگ کنفیگریشن

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

### مسئلہ 1: OpenAI کوٹا سے تجاوز

**علامات:**
- تعیناتی کوٹا غلطیوں کے ساتھ ناکام ہو جاتی ہے
- ایپلیکیشن لاگز میں 429 غلطیاں

**حل:**
```bash
# موجودہ کوٹہ کے استعمال کو چیک کریں
az cognitiveservices usage list --location eastus

# مختلف خطہ آزمائیں
azd env set AZURE_LOCATION westus2
azd up

# عارضی طور پر صلاحیت کم کریں
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### مسئلہ 2: توثیق کی ناکامیاں

**علامات:**
- AI خدمات کو کال کرتے وقت 401/403 غلطیاں
- "Access denied" پیغامات

**حل:**
```bash
# نقشوں کی تفویضات کی تصدیق کریں
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# منظم شدہ شناخت کی ترتیب چیک کریں
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Key Vault تک رسائی کی تصدیق کریں
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### مسئلہ 3: ماڈل کی تعیناتی کے مسائل

**علامات:**
- تعیناتی میں ماڈلز دستیاب نہیں
- مخصوص ماڈل ورژنز ناکام ہو رہے ہیں

**حل:**
```bash
# علاقے کے مطابق دستیاب ماڈلز کی فہرست
az cognitiveservices model list --location eastus

# bicep ٹیمپلیٹ میں ماڈل کا ورژن اپ ڈیٹ کریں
# ماڈل کی گنجائش کی ضروریات چیک کریں
```

## مثال ٹیمپلیٹس

### بنیادی چیٹ ایپلیکیشن

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Cognitive Search + App Service

**فوری آغاز**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### دستاویز پروسیسنگ پائپ لائن

**Repository**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Services**: Document Intelligence + Storage + Functions

**فوری آغاز**:
```bash
azd init --template ai-document-processing
azd up
```

### RAG کے ساتھ انٹرپرائز چیٹ

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Search + Container Apps + Cosmos DB

**فوری آغاز**:
```bash
azd init --template contoso-chat
azd up
```

## اگلے اقدامات

1. **مثالیں آزمائیں**: اپنے استعمال کے کیس سے میل کھانے والا پہلے سے بنا ہوا ٹیمپلیٹ شروع کریں
2. **اپنی ضروریات کے مطابق تخصیص کریں**: انفراسٹرکچر اور ایپلیکیشن کوڈ میں ترمیم کریں
3. **مانیٹرنگ شامل کریں**: جامع مشاہدت نافذ کریں
4. **لاگتوں کو بہتر بنائیں**: اپنے بجٹ کے لیے کنفیگریشنز کو بہتر بنائیں
5. **اپنی تعیناتی کو محفوظ کریں**: انٹرپرائز سیکیورٹی پیٹرنز نافذ کریں
6. **پروڈکشن تک توسیع کریں**: ملٹی-ریجن اور ہائی-اویلیبیلٹی خصوصیات شامل کریں

## 🎯 ہینڈز آن مشقیں

### مشق 1: Azure OpenAI چیٹ ایپ تعینات کریں (30 منٹ)
**مقصد**: ایک پروڈکشن کے قابل AI چیٹ ایپلیکیشن تعینات اور جانچ کریں

```bash
# ٹیمپلیٹ کو ابتدائی ترتیب دیں
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# ماحولیاتی متغیرات سیٹ کریں
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# تعینات کریں
azd up

# درخواست کو آزمائیں
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# مصنوعی ذہانت کی کارروائیوں کی نگرانی کریں
azd monitor

# صفائی کریں
azd down --force --purge
```

**کامیابی کے معیار:**
- [ ] تعیناتی بغیر کوٹا غلطیوں کے مکمل ہو
- [ ] براؤزر میں چیٹ انٹرفیس تک رسائی ممکن ہو
- [ ] سوالات پوچھے جا سکیں اور AI کی مدد سے جوابات ملیں
- [ ] Application Insights میں ٹیلی میٹری ڈیٹا دکھائی دے
- [ ] وسائل کو کامیابی سے صاف کیا گیا ہو

**تخمینی لاگت**: $5-10 برائے 30 منٹ کی جانچ

### مشق 2: ملٹی-ماڈل تعیناتی ترتیب دیں (45 منٹ)
**مقصد**: مختلف کنفیگریشنز کے ساتھ متعدد AI ماڈلز تعینات کریں

```bash
# حسبِ ضرورت Bicep کنفیگریشن بنائیں
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
- [ ] متعدد ماڈلز کامیابی کے ساتھ تعینات ہوں
- [ ] مختلف صلاحیت سیٹنگز لاگو ہوں
- [ ] ماڈلز API کے ذریعے قابلِ رسائی ہوں
- [ ] ایپلیکیشن سے دونوں ماڈلز کو کال کیا جا سکے

### مشق 3: لاگت کی نگرانی نافذ کریں (20 منٹ)
**مقصد**: بجٹ الرٹس اور لاگت ٹریکنگ قائم کریں

```bash
# Bicep میں بجٹ الرٹ شامل کریں
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

# بجٹ الرٹ تعینات کریں
azd provision

# موجودہ اخراجات چیک کریں
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**کامیابی کے معیار:**
- [ ] Azure میں بجٹ الرٹ بنائی گئی ہو
- [ ] ای میل نوٹیفیکیشنز ترتیب دی گئی ہوں
- [ ] Azure Portal میں لاگت کا ڈیٹا دیکھا جا سکے
- [ ] بجٹ کی حدیں مناسب طریقے سے سیٹ کی گئی ہوں

## 💡 اکثر پوچھے جانے والے سوالات

<details>
<summary><strong>ترقی کے دوران Azure OpenAI کی لاگت کس طرح کم کروں؟</strong></summary>

1. **Free Tier استعمال کریں**: Azure OpenAI ماہانہ 50,000 ٹوکن مفت پیش کرتا ہے
2. **صلاحیت کم کریں**: ڈویلپ کے لیے 30+ کے بجائے 10 TPM پر صلاحیت سیٹ کریں
3. **azd down استعمال کریں**: جب فعال طور پر ترقی نہ کر رہے ہوں تو وسائل کو ڈی الاکیٹ کریں
4. **جوابات کو کیش کریں**: دہرائے جانے والے سوالات کے لیے Redis کیش نافذ کریں
5. **Prompt Engineering استعمال کریں**: موثر پرامپٹس کے ذریعے ٹوکن کے استعمال کو کم کریں

```bash
# ترقیاتی ترتیب
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Azure OpenAI اور OpenAI API میں کیا فرق ہے؟</strong></summary>

**Azure OpenAI**:
- انٹرپرائز سیکیورٹی اور کمپلائنس
- پرائیویٹ نیٹ ورک انضمام
- SLA کی گارنٹیز
- Managed identity توثیق
- اعلیٰ کوٹے دستیاب

**OpenAI API**:
- نئے ماڈلز تک تیز تر رسائی
- سیدھا سادہ سیٹ اپ
- داخلے کی کم رکاوٹ
- صرف پبلک انٹرنیٹ

پروڈکشن ایپس کے لیے، **Azure OpenAI کی سفارش کی جاتی ہے**۔
</details>

<details>
<summary><strong>Azure OpenAI کوٹا تجاوز کی غلطیوں سے کیسے نمٹوں؟</strong></summary>

```bash
# موجودہ کوٹہ چیک کریں
az cognitiveservices usage list --location eastus2

# کسی مختلف خطے کو آزما کر دیکھیں
azd env set AZURE_LOCATION westus2
azd up

# گنجائش کو عارضی طور پر کم کریں
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# کوٹہ بڑھانے کی درخواست کریں
# Azure پورٹل پر جائیں > کوٹے > اضافہ کی درخواست
```
</details>

<details>
<summary><strong>کیا میں اپنا ڈیٹا Azure OpenAI کے ساتھ استعمال کر سکتا ہوں؟</strong></summary>

ہاں! RAG (Retrieval Augmented Generation) کے لیے **Azure AI Search** استعمال کریں:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

See the [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) template.
</details>

<details>
<summary><strong>میں AI ماڈل اینڈ پوائنٹس کو کیسے محفوظ کروں؟</strong></summary>

**بہترین مشقیں**:
1. Managed Identity استعمال کریں (API keys نہ استعمال کریں)
2. Private Endpoints کو فعال کریں
3. نیٹ ورک سیکیورٹی گروپس ترتیب دیں
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

## کمیونٹی اور مدد

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Official documentation](https://learn.microsoft.com/azure/ai-studio/)

---

**Chapter Navigation:**
- **📚 کورس ہوم**: [AZD برائے مبتدی](../../README.md)
- **📖 موجودہ باب**: باب 2 - AI-First Development
- **⬅️ پچھلا باب**: [باب 1: آپ کا پہلا پروجیکٹ](../chapter-01-foundation/first-project.md)
- **➡️ اگلا**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 اگلا باب**: [باب 3: Configuration](../chapter-03-configuration/configuration.md)

**مدد چاہیے؟** ہماری کمیونٹی مباحثوں میں شامل ہوں یا مخزن میں ایک مسئلہ کھولیں۔ Azure AI + AZD کمیونٹی آپ کی کامیابی میں مدد کے لیے موجود ہے!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
اعلانِ عدم ذمہ داری:
اس دستاویز کا ترجمہ AI ترجمہ سروس Co-op Translator (https://github.com/Azure/co-op-translator) استعمال کرتے ہوئے کیا گیا ہے۔ اگرچہ ہم درستگی کے لیے کوشاں ہیں، براہِ کرم نوٹ کریں کہ خودکار تراجم میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنی مادری زبان میں ہی مستند ماخذ سمجھی جانی چاہیے۔ اہم معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی قسم کی غلط فہمی یا غلط تعبیر کے لیے ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->