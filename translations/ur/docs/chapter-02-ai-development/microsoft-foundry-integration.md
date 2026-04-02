# مائیکروسافٹ فاؤنڈری کا AZD کے ساتھ انضمام

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD مبتدیوں کے لیے](../../README.md)
- **📖 موجودہ باب**: باب 2 - AI-فرسٹ ڈیولپمنٹ
- **⬅️ سابقہ باب**: [باب 1: آپ کا پہلا پروجیکٹ](../chapter-01-foundation/first-project.md)
- **➡️ اگلا**: [AI ماڈل کی تعیناتی](ai-model-deployment.md)
- **🚀 اگلا باب**: [باب 3: کنفیگریشن](../chapter-03-configuration/configuration.md)

## جائزہ

یہ رہنمائی دکھاتی ہے کہ مائیکروسافٹ فاؤنڈری خدمات کو Azure Developer CLI (AZD) کے ساتھ کس طرح مربوط کیا جائے تاکہ AI ایپلیکیشنز کی ڈیپلائمنٹس کو آسان بنایا جا سکے۔ مائیکروسافٹ فاؤنڈری AI ایپلیکیشنز کی تعمیر، تعیناتی، اور انتظام کے لیے ایک جامع پلیٹ فارم فراہم کرتا ہے، جبکہ AZD انفراسٹرکچر اور تعیناتی کے عمل کو سادہ بناتا ہے۔

## مائیکروسافٹ فاؤنڈری کیا ہے؟

مائیکروسافٹ فاؤنڈری مائیکروسافٹ کا متحد پلیٹ فارم ہے جو AI ڈویلپمنٹ کے لیے ہے اور اس میں شامل ہیں:

- **ماڈل کیٹلاگ**: جدید ترین AI ماڈلز تک رسائی
- **پرومپٹ فلو**: AI ورک فلو کے لیے بصری ڈیزائنر
- **مائیکروسافٹ فاؤنڈری پورٹل**: AI ایپلیکیشنز کے لیے مربوط ڈیولپمنٹ ماحول
- **تعیناتی کے اختیارات**: متعدد ہوسٹنگ اور اسکیلنگ آپشنز
- **حفاظت اور سیکیورٹی**: ذمہ دار AI خصوصیات بنائی گئی ہیں

## AZD + مائیکروسافٹ فاؤنڈری: اکٹھے بہتر

| فیچر | مائیکروسافٹ فاؤنڈری | AZD انضمامی فائدہ |
|---------|-----------------|------------------------|
| **ماڈل کی تعیناتی** | دستی پورٹل تعیناتی | خودکار، بار بار کی جانے والی تعیناتیاں |
| **انفراسٹرکچر** | کلک کے ذریعے پروویژننگ | انفرسٹرکچر بطور کوڈ (بائسِپ) |
| **ماحول کا انتظام** | واحد ماحول پر توجہ | متعدد ماحول (ڈیولپ/اسٹیجنگ/پروڈ) |
| **CI/CD انضمام** | محدود | نیٹیو GitHub ایکشنز کی حمایت |
| **اخراجات کا انتظام** | بنیادی نگرانی | مخصوص ماحول کے لیے لاگت کی بہتری |

## پیشگی شرائط

- مناسب اجازتوں کے ساتھ Azure سبسکرپشن
- Azure Developer CLI انسٹال شدہ
- مائیکروسافٹ فاؤنڈری ماڈلز سروسز تک رسائی
- مائیکروسافٹ فاؤنڈری کی بنیادی واقفیت

> **موجودہ AZD بیس لائن:** ان مثالوں کا معائنہ `azd` `1.23.12` ورژن کے خلاف کیا گیا ہے۔ AI ایجنٹ ورک فلو کے لیے، موجودہ پریویو ایکسٹینشن ریلیز استعمال کریں اور شروع کرنے سے پہلے اپنا انسٹال شدہ ورژن چیک کریں۔

## بنیادی انضمامی نمونے

### نمونہ 1: مائیکروسافٹ فاؤنڈری ماڈلز انضمام

**استعمال کا کیس**: مائیکروسافٹ فاؤنڈری ماڈلز کے ساتھ چیٹ ایپلیکیشنز کی تعیناتی

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

### نمونہ 2: AI سرچ + RAG انضمام

**استعمال کا کیس**: رٹریول آگمینٹڈ جنریشن (RAG) ایپلیکیشنز کی تعیناتی

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

### نمونہ 3: دستاویز ذہانت کا انضمام

**استعمال کا کیس**: دستاویزات کی پروسیسنگ اور تجزیہ کے ورک فلو

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

## 🔧 کنفیگریشن کے نمونے

### ماحولیاتی متغیرات کی ترتیب

**پروڈکشن کنفیگریشن:**
```bash
# بنیادی AI خدمات
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# ماڈل کنفیگریشنز
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# کارکردگی کی ترتیبات
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**ڈیولپمنٹ کنفیگریشن:**
```bash
# ترقی کے لئے لاگت کے لحاظ سے بہتر سیٹنگز
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # مفت سطح
```

### کی والٹ کے ساتھ محفوظ کنفیگریشن

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

### فاؤنڈری کے لیے AZD ایکسٹینشنز

AZD ایکسٹینشنز فراہم کرتا ہے جو مائیکروسافٹ فاؤنڈری خدمات کے ساتھ کام کرنے کے لیے AI-مخصوص صلاحیتیں شامل کرتے ہیں:

```bash
# فنڈری ایجنٹس کی توسیع انسٹال کریں
azd extension install azure.ai.agents

# فائن ٹیوننگ کی توسیع انسٹال کریں
azd extension install azure.ai.finetune

# کسٹم ماڈلز کی توسیع انسٹال کریں
azd extension install azure.ai.models

# نصب شدہ توسیعات کی فہرست بنائیں
azd extension list --installed

# موجودہ نصب ایجنٹ توسیع کا ورژن چیک کریں
azd extension show azure.ai.agents
```

AI ایکسٹینشنز ابھی بھی تیزی سے پریویو میں تبدیلی کر رہی ہیں۔ اگر کوئی کمانڈ یہاں دکھائی گئی جیسی طرح کا رویہ نہیں رکھتی، تو متعلقہ ایکسٹینشن کو اپ گریڈ کریں قبل اس کے کہ پروجیکٹ کی خرابی تلاش کریں۔

### `azd ai` کے ساتھ ایجنٹ-فرسٹ تعیناتی

اگر آپ کے پاس ایجنٹ مینیفیسٹ ہو، تو `azd ai agent init` استعمال کریں تاکہ فاؤنڈری ایجنٹ سروس سے مربوط پروجیکٹ تیار کیا جا سکے:

```bash
# ایک ایجنٹ مینیفیسٹ سے آغاز کریں
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure پر تعینات کریں
azd up
```

حال ہی میں پریویو ریلیزز `azure.ai.agents` نے `azd ai agent init` کے لیے ٹیمپلیٹ پر مبنی ابتدائی مدد بھی شامل کی ہے۔ اگر آپ نئے ایجنٹ نمونوں کی پیروی کر رہے ہیں، تو اپنے انسٹال شدہ ورژن میں دستیاب فلگز کے لیے ایکسٹینشن ہیلپ چیک کریں۔

مکمل کمانڈ ریفرنس اور فلگز کے لیے دیکھیں [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)۔

### سنگل کمانڈ تعیناتی

```bash
# سب کچھ ایک کمانڈ سے تعینات کریں
azd up

# یا بتدریج تعینات کریں
azd provision  # صرف انفراسٹرکچر
azd deploy     # صرف ایپلیکیشن

# azd 1.23.11+ میں لمبے عرصے تک چلنے والی AI ایپ کی تعیناتی کے لیے
azd deploy --timeout 1800
```

### ماحول مخصوص تعیناتیاں

```bash
# ترقی کا ماحول
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

## 🔐 سیکیورٹی کی بہترین عملی اقدامات

### مینیجڈ شناخت کی ترتیب

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

### نیٹ ورک کی حفاظت

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

## کارکردگی کی بہتری

### کیش اسٹریٹیجیز

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

### خودکار اسکیلنگ کنفیگریشن

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

## عام مسائل کی خرابی تلاش

### مسئلہ 1: OpenAI کوٹا تجاوز شدہ

**علامات:**
- کوٹا کی غلطیوں کے ساتھ تعیناتی ناکام
- ایپلیکیشن لاگز میں 429 کی غلطیاں

**حل:**
```bash
# موجودہ کوٹہ کے استعمال کی جانچ کریں
az cognitiveservices usage list --location eastus

# مختلف خطے کی کوشش کریں
azd env set AZURE_LOCATION westus2
azd up

# عارضی طور پر صلاحیت کم کریں
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### مسئلہ 2: تصدیقی ناکامیاں

**علامات:**
- AI خدمات کال کرنے پر 401/403 کی غلطیاں
- "رسائی سے انکار" کے پیغامات

**حل:**
```bash
# کردار تفویضات کی تصدیق کریں
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# مینیجڈ شناخت کی تشکیل چیک کریں
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# کی ویلت تک رسائی کی توثیق کریں
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### مسئلہ 3: ماڈل تعیناتی کے مسائل

**علامات:**
- تعیناتی میں ماڈلز دستیاب نہیں
- مخصوص ماڈل ورژنز ناکام ہو رہے ہیں

**حل:**
```bash
# دستیاب ماڈلز کی فہرست بنائیں علاقے کے لحاظ سے
az cognitiveservices model list --location eastus

# بائسِپ ٹیمپلیٹ میں ماڈل ورژن کو اپ ڈیٹ کریں
# ماڈل کی گنجائش کی ضروریات چیک کریں
```

## مثال کے ٹیمپلیٹس

### RAG چیٹ ایپلیکیشن (پائتھون)

**ریپوزیٹری**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**خدمات**: Azure OpenAI + Azure AI سرچ + Azure کنٹینر ایپس + Azure بلاک اسٹوریج

**تفصیل**: سب سے مقبول Azure AI نمونہ — ایک پروڈکشن ریڈی RAG چیٹ ایپ جو آپ کو اپنے دستاویزات پر سوالات کرنے دیتی ہے۔ چیٹ کے لیے GPT-4.1-mini، ایمبیڈنگز کے لیے text-embedding-3-large، اور retrieval کے لیے Azure AI سرچ استعمال کرتا ہے۔ ملٹی موڈل دستاویزات، اسپیش ان پٹ/آؤٹ پٹ، مائیکروسافٹ انٹرا تصدیق، اور ایپلیکیشن انسائٹس ٹریسنگ کی حمایت کرتا ہے۔

**فوری آغاز**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG چیٹ ایپلیکیشن (.NET)

**ریپوزیٹری**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**خدمات**: Azure OpenAI + Azure AI سرچ + Azure کنٹینر ایپس + سیمینٹک کرنل

**تفصیل**: پائتھون RAG چیٹ نمونہ کا .NET/C# مساوی۔ ASP.NET کور مینمل API اور بلیزر ویب اسمبلی فرنٹ اینڈ کے ساتھ بنایا گیا۔ وائس چیٹ، GPT-4o-mini وژن سپورٹ، اور .NET MAUI بلیزر ہائبریڈ ڈیسک ٹاپ/موبائل کلائنٹ شامل ہیں۔

**فوری آغاز**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG چیٹ ایپلیکیشن (جاوا)

**ریپوزیٹری**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**خدمات**: Azure OpenAI + Azure AI سرچ + Azure کنٹینر ایپس / AKS + Langchain4J + Azure Cosmos DB

**تفصیل**: RAG چیٹ نمونے کا جاوا ورژن Langchain4J کے ساتھ AI آرکسٹریشن کے لیے۔ مائیکرو سروس ایونٹ ڈرائیون آرکیٹیکچر، متعدد سرچ حکمت عملیاں (متن، ویکٹر، ہائبریڈ)، دستاویز اپ لوڈ Azure Document Intelligence کے ساتھ، اور تعیناتی یا تو Azure کنٹینر ایپس یا Azure Kubernetes سروس پر۔

**فوری آغاز**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### انٹرپرائز ریٹیل کوپائلٹ Azure AI فاؤنڈری کے ساتھ

**ریپوزیٹری**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**خدمات**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI سرچ + Azure کنٹینر ایپس + Azure Cosmos DB

**تفصیل**: Azure AI Foundry اور Prompty کے ساتھ اینڈ ٹو اینڈ ریٹیل RAG کوپائلٹ۔ کنٹوسو آؤٹ ڈور ریٹیلر چیٹ بوٹ جو جوابوں کو پروڈکٹ کیٹلاگ اور کسٹمر آرڈر ڈیٹا پر مبنی کرتا ہے۔ مکمل GenAIOps ورک فلو دکھاتا ہے — Prompty کے ساتھ پروٹوٹائپ، AI معاون ایویلویٹرز کے ساتھ جائزہ، اور AZD کے ذریعے کنٹینر ایپس پر تعیناتی۔

**فوری آغاز**:
```bash
azd init --template contoso-chat
azd up
```

### تخلیقی تحریر کا ملٹی ایجنٹ ایپلیکیشن

**ریپوزیٹری**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**خدمات**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI سرچ + Azure کنٹینر ایپس

**تفصیل**: ملٹی ایجنٹ نمونہ جو AI ایجنٹ آرکسٹریشن کو Prompty کے ساتھ دکھاتا ہے۔ ریسرچ ایجنٹ (Bing Grounding in Azure AI Agent Service)، پروڈکٹ ایجنٹ (Azure AI سرچ)، رائٹر ایجنٹ، اور ایڈیٹر ایجنٹ کا استعمال کرتے ہوئے باہمی تعاون سے تحقیقی مضامین تیار کرتا ہے۔ GitHub Actions میں ایویلویشن کے ساتھ CI/CD شامل ہے۔

**فوری آغاز**:
```bash
azd init --template contoso-creative-writer
azd up
```

### سرورلیس RAG چیٹ (جاوا اسکرپٹ/ٹائپ اسکرپٹ)

**ریپوزیٹری**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**خدمات**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**تفصیل**: مکمل سرورلیس RAG چیٹ بوٹ LangChain.js کے ساتھ، API کے لیے Azure Functions، اور ہوسٹنگ کے لیے Azure Static Web Apps استعمال کرتا ہے۔ Azure Cosmos DB کو ویکٹر اسٹور اور چیٹ ہسٹری ڈیٹا بیس دونوں کے طور پر استعمال کرتا ہے۔ لوکل ڈیولپمنٹ کے لیے Ollama کے ساتھ زیرو-کوسٹ ٹیسٹنگ کو سپورٹ کرتا ہے۔

**فوری آغاز**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### اپنے ڈیٹا کے ساتھ چیٹ سولوشن ایکسلریٹر

**ریپوزیٹری**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**خدمات**: Azure OpenAI + Azure AI سرچ + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**تفصیل**: انٹرپرائز گریڈ RAG سولوشن ایکسلریٹر انتظامی پورٹل کے ساتھ دستاویزات اپ لوڈ/انتظام، متعدد آرکسٹریٹر آپشنز (سیمینٹک کرنل، LangChain، Prompt Flow)، اسپیش ٹو ٹیکسٹ، مائیکروسافٹ ٹیمز انٹیگریشن، اور PostgreSQL یا Cosmos DB بیک اینڈ کا انتخاب۔ پروڈکشن RAG مناظر کے لیے حسب ضرورت آغاز نقطہ کے طور پر ڈیزائن کیا گیا۔

**فوری آغاز**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI ٹریول ایجنٹس — ملٹی ایجنٹ MCP آرکسٹریشن

**ریپوزیٹری**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**خدمات**: Azure OpenAI + Azure AI Foundry + Azure کنٹینر ایپس + MCP سرورز (.NET, Python, Java, TypeScript)

**تفصیل**: تین فریم ورک (LangChain.js، LlamaIndex.TS، اور Microsoft Agent Framework) کے ساتھ ملٹی ایجنٹ AI آرکسٹریشن کے لیے ریفرنس ایپلیکیشن۔ چار زبانوں میں MCP (Model Context Protocol) سرورز کو بطور سرورلیس Azure کنٹینر ایپس تعینات کرتا ہے اور OpenTelemetry نگرانی فراہم کرتا ہے۔

**فوری آغاز**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI اسٹارٹر

**ریپوزیٹری**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**خدمات**: Azure AI سروسز + Azure OpenAI

**تفصیل**: انتہائی کم Bicep ٹیمپلیٹ جو Azure AI سروسز کو مشین لرننگ ماڈلز کے ساتھ ترتیب دے کر تعینات کرتا ہے۔ ایک ہلکا پھلکا آغاز نقطہ جب آپ کو صرف Azure AI انفراسٹرکچر کی ضرورت ہو بغیر مکمل ایپلیکیشن اسٹیک کے۔

**فوری آغاز**:
```bash
azd init --template azd-ai-starter
azd up
```

> **مزید ٹیمپلیٹس دیکھیں**: 80+ AI-مخصوص AZD ٹیمپلیٹس کے لیے [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) کا دورہ کریں، مختلف زبانوں اور مناظروں میں۔

## اگلے اقدامات

1. **مثالیں آزمائیں**: ایک پہلے سے بنایا گیا ٹیمپلیٹ انتخاب کریں جو آپ کے استعمال کے کیس سے میل کھاتا ہے
2. **اپنی ضروریات کے مطابق بنائیں**: انفراسٹرکچر اور ایپلیکیشن کوڈ میں ترمیم کریں
3. **نگرانی شامل کریں**: جامع مشاہدہ کاری نافذ کریں
4. **لاگت بہتر بنائیں**: بجٹ کے مطابق ترتیبات کو بہتر بنائیں
5. **اپنی تعیناتی محفوظ کریں**: انٹرپرائز سیکیورٹی نمونے نافذ کریں
6. **پروڈکشن کے لیے اسکیل کریں**: ملٹی ریجن اور ہائی ایویلبیلیٹی خصوصیات شامل کریں

## 🎯 عملی مشقیں

### مشق 1: مائیکروسافٹ فاؤنڈری ماڈلز چیٹ ایپ کی تعیناتی (30 منٹ)
**مقصد**: پروڈکشن ریڈی AI چیٹ ایپلیکیشن کی تعیناتی اور جانچ

```bash
# ٹیمپلیٹ کو شروع کریں
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# ماحولیاتی متغیرات سیٹ کریں
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# تعینات کریں
azd up

# ایپلیکیشن کا ٹیسٹ کریں
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# AI آپریشنز کی نگرانی کریں
azd monitor

# صفائی کریں
azd down --force --purge
```

**کامیابی کے معیارات:**
- [ ] کوٹا کی غلطیوں کے بغیر تعیناتی مکمل ہو
- [ ] براؤزر میں چیٹ انٹرفیس تک رسائی ممکن ہو
- [ ] سوالات پوچھے جا سکیں اور AI سے جوابات حاصل ہوں
- [ ] ایپلیکیشن انسائٹس ٹیلی میٹری ڈیٹا دکھائے
- [ ] وسائل کامیابی کے ساتھ صفائی کریں

**تخمینی لاگت**: 30 منٹ کی جانچ کے لیے $5-10

### مشق 2: ملٹی ماڈل تعیناتی کی ترتیب (45 منٹ)
**مقصد**: مختلف کنفیگریشن کے ساتھ متعدد AI ماڈلز کی تعیناتی

```bash
# حسب ضرورت بائسف کنفیگریشن بنائیں
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

# تعینات کریں اور تصدیق کریں
azd provision
azd show
```

**کامیابی کے معیارات:**
- [ ] متعدد ماڈلز کامیابی سے تعینات ہوں
- [ ] مختلف صلاحیت کی ترتیبیں لاگو ہوں
- [ ] ماڈلز API کے ذریعے قابل رسائی ہوں
- [ ] ایپلیکیشن سے دونوں ماڈلز کو کال کیا جا سکے

### مشق 3: لاگت کی نگرانی کا نفاذ (20 منٹ)
**مقصد**: بجٹ الرٹس اور لاگت کی ٹریکنگ قائم کرنا

```bash
# بجٹ الرٹ کو بائسپ میں شامل کریں
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

**کامیابی کے معیارات:**
- [ ] Azure میں بجٹ الرٹ بنایا گیا ہو
- [ ] ای میل اطلاعات ترتیب دی گئی ہوں
- [ ] Azure پورٹل میں لاگت کے ڈیٹا کا معائنہ کیا جا سکے
- [ ] بجٹ کی حد مناسب طریقے سے مقرر کی گئی ہو

## 💡 اکثر پوچھے جانے والے سوالات

<details>
<summary><strong>میں ترقی کے دوران مائیکروسافٹ فاؤنڈری ماڈلز کی لاگت کیسے کم کر سکتا ہوں؟</strong></summary>

1. **فری ٹیئر استعمال کریں**: مائیکروسافٹ فاؤنڈری ماڈلز ماہانہ 50,000 ٹوکن مفت فراہم کرتا ہے
2. **صلاحیت کم کریں**: ترقی کے لیے 30+ کی بجائے 10 TPM کی صلاحیت مقرر کریں
3. **azd down استعمال کریں**: جب فعال طور پر ڈیولپنگ نہ کر رہے ہوں تو وسائل کو ڈی آلوکیٹ کریں
4. **ردیس کیش کا استعمال کریں**: دہرائے جانے والے سوالات کے لیے Redis کیش نافذ کریں
5. **پرومپٹ انجینئرنگ کا استعمال**: مؤثر پرومپٹس کے ذریعے ٹوکن کے استعمال کو کم کریں
```bash
# ترقی کی ترتیب
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry ماڈلز اور OpenAI API میں کیا فرق ہے؟</strong></summary>

**Microsoft Foundry ماڈلز**:
- انٹرپرائز سیکیورٹی اور تعمیل
- پرائیویٹ نیٹ ورک انٹیگریشن
- SLA کی ضمانتیں
- مینیجڈ شناختی تصدیق
- اعلیٰ کوٹہ دستیاب

**OpenAI API**:
- نئے ماڈلز تک تیز رسائی
- آسان سیٹ اپ
- داخلے کی کم رکاوٹ
- صرف عوامی انٹرنیٹ

پیداوار کے ایپس کے لئے، **Microsoft Foundry ماڈلز کی سفارش کی جاتی ہے**۔
</details>

<details>
<summary><strong>Microsoft Foundry ماڈلز میں کوٹہ سے تجاوز کی غلطیوں کو کیسے سنبھالیں؟</strong></summary>

```bash
# موجودہ کوٹا چیک کریں
az cognitiveservices usage list --location eastus2

# مختلف علاقے کی کوشش کریں
azd env set AZURE_LOCATION westus2
azd up

# عارضی طور پر صلاحیت کم کریں
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# کوٹا میں اضافہ کی درخواست کریں
# Azure پورٹل > کوٹاز > اضافہ کی درخواست کریں پر جائیں
```
</details>

<details>
<summary><strong>کیا میں Microsoft Foundry ماڈلز کے ساتھ اپنا ڈیٹا استعمال کر سکتا ہوں؟</strong></summary>

جی ہاں! RAG (Retrieval Augmented Generation) کے لیے **Azure AI Search** استعمال کریں:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

[azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) ٹیمپلیٹ دیکھیں۔
</details>

<details>
<summary><strong>میں AI ماڈل اینڈ پوائنٹس کو کیسے محفوظ کروں؟</strong></summary>

**بہترین طریقے**:
1. مینیجڈ شناختی استعمال کریں (کوئی API کیز نہیں)
2. پرائیویٹ اینڈ پوائنٹس کو فعال کریں
3. نیٹ ورک سیکیورٹی گروپس کو ترتیب دیں
4. ریٹ لمٹنگ نافذ کریں
5. خفیہ معلومات کے لیے Azure Key Vault استعمال کریں

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

- **Microsoft Foundry Discord**: [#Azure چینل](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [مسائل اور مباحثے](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [سرکاری دستاویزات](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [skills.sh پر Microsoft Foundry skill](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - اپنے ایڈیٹر میں Azure + Foundry ایجنٹ اسکلز `npx skills add microsoft/github-copilot-for-azure` کے ذریعے انسٹال کریں

---

**باب نیویگیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 2 - AI-فرسٹ ڈیولپمنٹ
- **⬅️ پچھلا باب**: [باب 1: آپ کا پہلا پروجیکٹ](../chapter-01-foundation/first-project.md)
- **➡️ اگلا**: [AI ماڈل ڈپلائمنٹ](ai-model-deployment.md)
- **🚀 اگلا باب**: [باب 3: کنفیگریشن](../chapter-03-configuration/configuration.md)

**مدد چاہیے؟** ہماری کمیونٹی مباحثوں میں شامل ہوں یا ریپوزیٹری میں مسئلہ کھولیں۔ Azure AI + AZD کمیونٹی آپ کی کامیابی کے لیے یہاں موجود ہے!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تردیدی بیان**:
اس دستاویز کا ترجمہ اے آئی ترجمہ خدمت [Co-op Translator](https://github.com/Azure/co-op-translator) استعمال کرتے ہوئے کیا گیا ہے۔ اگرچہ ہم درستگی کے لئے کوشاں ہیں، براہ کرم آگاہ رہیں کہ خودکار ترجموں میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھا جانا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریحات کے لئے ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->