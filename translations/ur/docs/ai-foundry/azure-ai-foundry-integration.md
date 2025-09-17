<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "894be87a84e7f669a164d4f67545c8ac",
  "translation_date": "2025-09-17T18:37:27+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "ur"
}
-->
# Azure AI Foundry کے ساتھ AZD کا انضمام

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD ابتدائیوں کے لیے](../../README.md)
- **📖 موجودہ باب**: باب 2 - AI-فرسٹ ڈیولپمنٹ
- **⬅️ پچھلا باب**: [باب 1: آپ کا پہلا پروجیکٹ](../getting-started/first-project.md)
- **➡️ اگلا**: [AI ماڈل کی تعیناتی](ai-model-deployment.md)
- **🚀 اگلا باب**: [باب 3: کنفیگریشن](../getting-started/configuration.md)

## جائزہ

یہ گائیڈ Azure AI Foundry سروسز کو Azure Developer CLI (AZD) کے ساتھ مربوط کرنے کا طریقہ دکھاتی ہے تاکہ AI ایپلیکیشنز کی تعیناتی کو آسان بنایا جا سکے۔ Azure AI Foundry ایک جامع پلیٹ فارم فراہم کرتا ہے جو AI ایپلیکیشنز کی تعمیر، تعیناتی، اور انتظام کے لیے ہے، جبکہ AZD انفراسٹرکچر اور تعیناتی کے عمل کو آسان بناتا ہے۔

## Azure AI Foundry کیا ہے؟

Azure AI Foundry مائیکروسافٹ کا متحد پلیٹ فارم ہے جو AI ڈیولپمنٹ کے لیے شامل کرتا ہے:

- **ماڈل کیٹلاگ**: جدید ترین AI ماڈلز تک رسائی
- **پرومپٹ فلو**: AI ورک فلو کے لیے بصری ڈیزائنر
- **AI Foundry پورٹل**: AI ایپلیکیشنز کے لیے مربوط ترقیاتی ماحول
- **تعیناتی کے اختیارات**: متعدد ہوسٹنگ اور اسکیلنگ کے اختیارات
- **حفاظت اور سیکیورٹی**: ذمہ دار AI خصوصیات کے ساتھ

## AZD + Azure AI Foundry: ایک ساتھ بہتر

| خصوصیت | Azure AI Foundry | AZD انضمام کا فائدہ |
|---------|-----------------|------------------------|
| **ماڈل کی تعیناتی** | پورٹل کے ذریعے دستی تعیناتی | خودکار، قابل تکرار تعیناتی |
| **انفراسٹرکچر** | کلک کے ذریعے پروویژننگ | انفراسٹرکچر بطور کوڈ (Bicep) |
| **ماحول کا انتظام** | ایک ماحول پر توجہ | متعدد ماحول (ڈویلپمنٹ/اسٹیجنگ/پروڈکشن) |
| **CI/CD انضمام** | محدود | نیٹو GitHub Actions سپورٹ |
| **لاگت کا انتظام** | بنیادی مانیٹرنگ | ماحول کے لحاظ سے لاگت کی اصلاح |

## ضروریات

- Azure سبسکرپشن مناسب اجازتوں کے ساتھ
- Azure Developer CLI انسٹال شدہ
- Azure OpenAI سروسز تک رسائی
- Azure AI Foundry کی بنیادی واقفیت

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

**ڈویلپمنٹ کنفیگریشن:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
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
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### ماحول کے لحاظ سے تعیناتی

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

## مانیٹرنگ اور مشاہدہ

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

### لاگت کی مانیٹرنگ

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

### آٹو اسکیلنگ کنفیگریشن

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
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try different region
azd env set AZURE_LOCATION westus2
azd up

# Reduce capacity temporarily
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### مسئلہ 2: تصدیق کی ناکامیاں

**علامات:**
- AI سروسز کو کال کرتے وقت 401/403 غلطیاں
- "رسائی مسترد" کے پیغامات

**حل:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### مسئلہ 3: ماڈل کی تعیناتی کے مسائل

**علامات:**
- تعیناتی میں ماڈلز دستیاب نہیں
- مخصوص ماڈل ورژنز ناکام ہو رہے ہیں

**حل:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
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

### RAG کے ساتھ انٹرپرائز چیٹ

**ریپوزٹری**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**سروسز**: Azure OpenAI + Search + Container Apps + Cosmos DB

**فوری آغاز**:
```bash
azd init --template contoso-chat
azd up
```

## اگلے مراحل

1. **مثالیں آزمائیں**: پہلے سے تیار کردہ ٹیمپلیٹ کے ساتھ شروع کریں جو آپ کے استعمال کے کیس سے میل کھاتا ہو
2. **اپنی ضروریات کے لیے حسب ضرورت بنائیں**: انفراسٹرکچر اور ایپلیکیشن کوڈ میں ترمیم کریں
3. **مانیٹرنگ شامل کریں**: جامع مشاہدہ نافذ کریں
4. **لاگت کو بہتر بنائیں**: اپنے بجٹ کے لیے کنفیگریشنز کو بہتر بنائیں
5. **اپنی تعیناتی کو محفوظ بنائیں**: انٹرپرائز سیکیورٹی کے پیٹرنز نافذ کریں
6. **پروڈکشن تک اسکیل کریں**: ملٹی ریجن اور ہائی ایویلیبیلیٹی فیچرز شامل کریں

## کمیونٹی اور سپورٹ

- **Azure AI Foundry Discord**: [#Azure چینل](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [مسائل اور مباحثے](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [سرکاری دستاویزات](https://learn.microsoft.com/azure/ai-studio/)

---

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD ابتدائیوں کے لیے](../../README.md)
- **📖 موجودہ باب**: باب 2 - AI-فرسٹ ڈیولپمنٹ
- **⬅️ پچھلا باب**: [باب 1: آپ کا پہلا پروجیکٹ](../getting-started/first-project.md)
- **➡️ اگلا**: [AI ماڈل کی تعیناتی](ai-model-deployment.md)
- **🚀 اگلا باب**: [باب 3: کنفیگریشن](../getting-started/configuration.md)

**مدد چاہیے؟** ہماری کمیونٹی مباحثوں میں شامل ہوں یا ریپوزٹری میں مسئلہ کھولیں۔ Azure AI + AZD کمیونٹی آپ کی کامیابی کے لیے یہاں موجود ہے!

---

**ڈسکلیمر**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ ہم درستگی کے لیے کوشش کرتے ہیں، لیکن براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا غیر درستیاں ہو سکتی ہیں۔ اصل دستاویز کو اس کی اصل زبان میں مستند ذریعہ سمجھا جانا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے ذمہ دار نہیں ہیں۔