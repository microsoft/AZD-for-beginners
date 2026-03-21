# Microsoft Foundry کا AZD کے ساتھ انضمام

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 2 - AI-First Development
- **⬅️ پچھلا باب**: [باب 1: آپ کا پہلا پروجیکٹ](../chapter-01-foundation/first-project.md)
- **➡️ اگلا**: [AI ماڈل کی تعیناتی](ai-model-deployment.md)
- **🚀 اگلا باب**: [باب 3: ترتیب](../chapter-03-configuration/configuration.md)

## جائزہ

یہ رہنمائی دکھاتی ہے کہ Microsoft Foundry خدمات کو Azure Developer CLI (AZD) کے ساتھ کس طرح شامل کیا جائے تاکہ AI ایپلیکیشنز کی تعیناتی کو آسان بنایا جا سکے۔ Microsoft Foundry ایک مکمل پلیٹ فارم مہیا کرتا ہے AI ایپلیکیشنز کی تعمیر، تعیناتی، اور انتظام کے لیے، جبکہ AZD انفراسٹرکچر اور تعیناتی کے عمل کو آسان بناتا ہے۔

## Microsoft Foundry کیا ہے؟

Microsoft Foundry مائیکروسافٹ کا متحد پلیٹ فارم ہے AI ترقی کے لیے جس میں شامل ہیں:

- **ماڈل کیٹلاگ**: جدید AI ماڈلز تک رسائی
- **پرومپٹ فلو**: AI ورک فلو کے لیے بصری ڈیزائنر
- **Microsoft Foundry پورٹل**: AI ایپلیکیشنز کے لیے مربوط ترقیاتی ماحول
- **تعیناتی کے اختیارات**: مختلف ہوسٹنگ اور اسکیلنگ کے انتخاب
- **حفاظت اور سیکیورٹی**: ذمہ دار AI خصوصیات

## AZD + Microsoft Foundry: بہتر مل کر

| خصوصیت | Microsoft Foundry | AZD انضمام کا فائدہ |
|---------|-----------------|------------------------|
| **ماڈل کی تعیناتی** | دستی پورٹل تعیناتی | خودکار، دہرائے جانے والی تعیناتیاں |
| **انفراسٹرکچر** | کلک کے ذریعے پروویژننگ | Infrastructure as Code (Bicep) |
| **ماحول کا انتظام** | واحد ماحول پر توجہ | کثیر ماحول (dev/staging/prod) |
| **CI/CD انضمام** | محدود | نیٹیو GitHub Actions کی حمایت |
| **لاگت کا انتظام** | بنیادی مانیٹرنگ | ماحول مخصوص لاگت کی اصلاح |

## پیشگی ضروریات

- مناسب اجازتوں کے ساتھ Azure سبسکرپشن
- Azure Developer CLI انسٹال کیا ہوا
- Microsoft Foundry ماڈلز خدمات تک رسائی
- Microsoft Foundry کی بنیادی واقفیت

## بنیادی انضمامی اندازات

### اندازہ 1: Microsoft Foundry ماڈلز انضمام

**استعمال کا کیس**: Microsoft Foundry ماڈلز کے ماڈلز کے ساتھ چیٹ ایپلیکیشنز کی تعیناتی

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

### اندازہ 2: AI تلاش + RAG انضمام

**استعمال کا کیس**: بازیافت سے بڑھائی گئی نسل (RAG) ایپلیکیشنز کی تعیناتی

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

### اندازہ 3: دستاویز ذہانت انضمام

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

## 🔧 ترتیب کے انداز

### ماحولیاتی متغیرات کی ترتیب

**پروڈکشن ترتیب:**
```bash
# بنیادی AI خدمات
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

**ترقیاتی ترتیب:**
```bash
# ترقی کے لیے قیمت میں بہتری والے سیٹنگز
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # مفت سطح
```

### کی والٹ کے ساتھ محفوظ ترتیب

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

### Foundry کے لیے AZD ایکسٹینشنز

AZD ایکسٹینشنز فراہم کرتا ہے جو Microsoft Foundry خدمات کے لیے AI مخصوص صلاحیتیں شامل کرتے ہیں:

```bash
# فاؤنڈری ایجنٹس توسیع نصب کریں
azd extension install azure.ai.agents

# فائن ٹیوننگ توسیع نصب کریں
azd extension install azure.ai.finetune

# کسٹم ماڈلز توسیع نصب کریں
azd extension install azure.ai.models

# نصب شدہ توسیعات کی فہرست بنائیں
azd extension list
```

### `azd ai` کے ساتھ ایجنٹ-فرسٹ تعیناتی

اگر آپ کے پاس ایجنٹ مینی فیسٹ موجود ہے تو `azd ai agent init` استعمال کریں تاکہ Foundry Agent Service سے منسلک پروجیکٹ تیار کیا جا سکے:

```bash
# ایک ایجنٹ مینیفیسٹ سے آغاز کریں
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# آذور پر اسائن کریں
azd up
```

مکمل کمانڈ ریفرنس اور فلیگز کے لیے [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) دیکھیں۔

### سنگل کمانڈ تعیناتی

```bash
# سب کچھ ایک کمانڈ کے ساتھ تعینات کریں
azd up

# یا آہستہ آہستہ تعینات کریں
azd provision  # صرف بنیادی ڈھانچہ
azd deploy     # صرف درخواست
```

### ماحول-مخصوص تعیناتیاں

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

### کیشنگ حکمت عملی

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

### خودکار اسکیلنگ کی ترتیب

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

## عام مسائل کی ٹربل شوٹنگ

### مسئلہ 1: OpenAI کوٹا تجاوز

**علامات:**
- تعیناتی کوٹا کی خرابیوں کے ساتھ ناکام ہوتی ہے
- ایپلیکیشن لاگز میں 429 کی غلطیاں

**حل:**
```bash
# موجودہ کوٹا استعمال چیک کریں
az cognitiveservices usage list --location eastus

# مختلف خطہ کوشش کریں
azd env set AZURE_LOCATION westus2
azd up

# عارضی طور پر صلاحیت کم کریں
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### مسئلہ 2: تصدیقی ناکامیاں

**علامات:**
- AI خدمات کو کال کرنے پر 401/403 کی غلطیاں
- "رسائی سے انکار" کے پیغامات

**حل:**
```bash
# رول اسائنمنٹس کی تصدیق کریں
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# منیجڈ آئیڈینٹٹی کی تشکیل چیک کریں
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# کی والت کے رسائی کی تصدیق کریں
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### مسئلہ 3: ماڈل تعیناتی کے مسائل

**علامات:**
- تعیناتی میں ماڈلز دستیاب نہیں
- مخصوص ماڈل ورژنز ناکام ہو رہے ہیں

**حل:**
```bash
# خطہ کی بنیاد پر دستیاب ماڈلز کی فہرست بنائیں
az cognitiveservices model list --location eastus

# بائیسیپ ٹیمپلیٹ میں ماڈل ورژن کو اپ ڈیٹ کریں
# ماڈل کی گنجائش کی ضروریات کی جانچ کریں
```

## مثال کے ٹیمپلیٹس

### RAG چیٹ ایپلیکیشن (پائتھن)

**ذخیرہ**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**خدمات**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**تفصیل**: سب سے زیادہ مقبول Azure AI نمونہ — ایک پروڈکشن رڈی RAG چیٹ ایپ جو آپ کو اپنے دستاویزات پر سوالات کرنے دیتی ہے۔ چیٹ کے لیے GPT-4.1-mini، امبیڈنگ کے لیے text-embedding-ada-002، اور بازیافت کے لیے Azure AI Search استعمال کرتا ہے۔ کثیر الاجہتی دستاویزات، تقریر ان پٹ/آؤٹ پٹ، Microsoft Entra توثیق، اور Application Insights ٹریسنگ کی حمایت کرتا ہے۔

**فوری آغاز**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG چیٹ ایپلیکیشن (.NET)

**ذخیرہ**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**خدمات**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**تفصیل**: پائتھن RAG چیٹ نمونہ کا .NET/C# مساوی۔ ASP.NET Core Minimal API اور Blazor WebAssembly فرنٹ اینڈ کے ساتھ بنایا گیا۔ وائس چیٹ، GPT-4o-mini ویژن کی حمایت، اور ایک ساتھ کام کرنے والے .NET MAUI Blazor ہائبرڈ ڈیسک ٹاپ/موبائل کلائنٹ شامل ہیں۔

**فوری آغاز**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG چیٹ ایپلیکیشن (جاوا)

**ذخیرہ**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**خدمات**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**تفصیل**: RAG چیٹ نمونے کا جاوا ورژن جو Langchain4J کو AI آراستگی کے لیے استعمال کرتا ہے۔ مائیکروسروس ایونٹ پر مبنی آرکیٹیکچر، متعدد تلاش کی حکمت عملیوں (متن، ویکٹر، ہائبرڈ)، دستاویز اپ لوڈ Azure Document Intelligence کے ساتھ، اور Azure Container Apps یا Azure Kubernetes Service پر تعیناتی کی حمایت کرتا ہے۔

**فوری آغاز**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Azure AI Foundry کے ساتھ انٹرپرائز ریٹیل کوپائلٹ

**ذخیرہ**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**خدمات**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**تفصیل**: Azure AI Foundry اور Prompty استعمال کرتے ہوئے اختتامی سے اختتامی ریٹیل RAG کوپائلٹ۔ Contoso Outdoor ریٹیلر چیٹ بوٹ جو پروڈکٹ کیٹلاگ اور کسٹمر کا آرڈر ڈیٹا پر مبنی جوابات فراہم کرتا ہے۔ GenAIOps ورک فلو کی مکمل جھلک — Prompty کے ساتھ پروٹوٹائپ، AI مدد یافتہ ایویلیویٹرز سے تشخیص، اور AZD کے ذریعے Container Apps میں تعیناتی۔

**فوری آغاز**:
```bash
azd init --template contoso-chat
azd up
```

### تخلیقی تحریر کا ملٹی ایجنٹ ایپلیکیشن

**ذخیرہ**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**خدمات**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**تفصیل**: ملٹی ایجنٹ نمونہ جو Prompty کے ساتھ AI ایجنٹ آراستگی دکھاتا ہے۔ ایک تحقیقاتی ایجنٹ (Bing Grounding in Azure AI Agent Service)، ایک مصنوعات ایجنٹ (Azure AI Search)، ایک مصنف ایجنٹ، اور ایک مدیر ایجنٹ مل کر اچھی تحقیق شدہ مضامین تخلیق کرتے ہیں۔ GitHub Actions میں ایویلیوشن کے ساتھ CI/CD شامل ہے۔

**فوری آغاز**:
```bash
azd init --template contoso-creative-writer
azd up
```

### سرور لیس RAG چیٹ (جاوا اسکرپٹ/ٹائپ اسکرپٹ)

**ذخیرہ**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**خدمات**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**تفصیل**: مکمل سرور لیس RAG چیٹ بوٹ LangChain.js کے ساتھ جو Azure Functions کو API کے لیے استعمال کرتا ہے اور Azure Static Web Apps کو ہوسٹنگ کے لیے۔ Azure Cosmos DB کو ویکٹر اسٹور اور چیٹ ہسٹری ڈیٹا بیس دونوں کے طور پر استعمال کرتا ہے۔ نو لاگت ٹیسٹنگ کے لیے Ollama کے ساتھ مقامی ترقی کی حمایت کرتا ہے۔

**فوری آغاز**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### اپنے ڈیٹا کے ساتھ چیٹ سلوشن ایکسیلیریٹر

**ذخیرہ**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**خدمات**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**تفصیل**: اینٹرپرائز گریڈ RAG سلوشن ایکسیلیریٹر جو دستاویز اپ لوڈ/انتظام کے لیے ایڈمن پورٹل، متعدد آرکیسٹریٹر آپشنز (Semantic Kernel, LangChain, Prompt Flow)، تقریر سے متن، Microsoft Teams انضمام، اور PostgreSQL یا Cosmos DB بیک اینڈ کا انتخاب فراہم کرتا ہے۔ پروڈکشن RAG منظرناموں کے لیے حسب ضرورت نقطہ آغاز کے طور پر ڈیزائن کیا گیا۔

**فوری آغاز**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI سفری ایجنٹس — ملٹی ایجنٹ MCP آرکیسٹریشن

**ذخیرہ**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**خدمات**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**تفصیل**: تین فریم ورکس (LangChain.js, LlamaIndex.TS, اور Microsoft Agent Framework) استعمال کرتے ہوئے ملٹی ایجنٹ AI آرکیسٹریشن کے لیے حوالہ ایپلیکیشن۔ چار زبانوں میں MCP (Model Context Protocol) سرورز جو سرور لیس Azure Container Apps کے طور پر تعینات ہیں اور OpenTelemetry مانیٹرنگ کی خصوصیت رکھتے ہیں۔

**فوری آغاز**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**ذخیرہ**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**خدمات**: Azure AI Services + Azure OpenAI

**تفصیل**: ایک سادہ Bicep ٹیمپلیٹ جو Azure AI خدمات کو ترتیب دیے ہوئے مشین لرننگ ماڈلز کے ساتھ تعینات کرتا ہے۔ جب آپ کو صرف Azure AI انفراسٹرکچر کی ضرورت ہو بغیر مکمل ایپلیکیشن اسٹیک کے تو یہ ایک ہلکا پھلکا نقطہ آغاز ہے۔

**فوری آغاز**:
```bash
azd init --template azd-ai-starter
azd up
```

> **مزید ٹیمپلیٹس دیکھیں**: زبانوں اور منظرناموں میں 80+ AI مخصوص AZD ٹیمپلیٹس کے لیے [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) ملاحظہ کریں۔

## اگلے اقدامات

1. **مثالیں آزمائیں**: ایک پہلے سے تیار کردہ ٹیمپلیٹ سے شروع کریں جو آپ کے استعمال کے کیس سے میل کھاتا ہو
2. **اپنی ضروریات کے مطابق ترمیم کریں**: انفراسٹرکچر اور ایپلیکیشن کوڈ میں تبدیلی کریں
3. **نگرانی شامل کریں**: جامع مشاہدہ لاگو کریں
4. **لاگت کی اصلاح کریں**: اپنے بجٹ کے مطابق ترتیبات کو بہتر بنائیں
5. **اپنی تعیناتی محفوظ کریں**: انٹرپرائز سیکیورٹی پیٹرنز نافذ کریں
6. **پروڈکشن کے لیے اسکیل کریں**: کثیر خطوں اور اعلی دستیابی کی خصوصیات شامل کریں

## 🎯 عملی مشقیں

### مشق 1: Microsoft Foundry ماڈلز چیٹ ایپ تعینات کریں (30 منٹ)
**مقصد**: پروڈکشن کے قابل AI چیٹ ایپلیکیشن کی تعیناتی اور جانچ

```bash
# ٹیمپلیٹ کو شروع کریں
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# ماحولیاتی متغیرات کو سیٹ کریں
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# تعینات کریں
azd up

# ایپلیکیشن کا ٹیسٹ کریں
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# اے آئی آپریشنز کی نگرانی کریں
azd monitor

# صفائی کریں
azd down --force --purge
```

**کامیابی کے معیار:**
- [ ] تعیناتی بغیر کوٹا غلطیوں کے مکمل ہو
- [ ] براؤزر میں چیٹ انٹرفیس تک رسائی ہو
- [ ] سوالات کر کے AI سے جوابات حاصل کیے جا سکیں
- [ ] Application Insights میں ٹیلمیٹری ڈیٹا ظاہر ہو
- [ ] وسائل کو کامیابی سے صاف کیا گیا ہو

**تخمینہ لاگت**: 30 منٹ کی جانچ کے لیے $5-10

### مشق 2: کثیر ماڈل تعیناتی کی ترتیب دیں (45 منٹ)
**مقصد**: مختلف ترتیبات کے ساتھ متعدد AI ماڈلز کی تعیناتی

```bash
# حسب ضرورت بائسِپ ترتیب بنائیں
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

# تعینات کریں اور تصدیق کریں
azd provision
azd show
```

**کامیابی کے معیار:**
- [ ] متعدد ماڈل کامیابی سے تعینات ہوں
- [ ] مختلف صلاحیت کی ترتیبات لاگو ہوں
- [ ] ماڈلز API کے ذریعے قابل رسائی ہوں
- [ ] دونوں ماڈلز کو ایپلیکیشن سے کال کیا جا سکے

### مشق 3: لاگت کی نگرانی نافذ کریں (20 منٹ)
**مقصد**: بجٹ الرٹس اور لاگت کی ٹریکنگ قائم کریں

```bash
# بجٹ الرٹ کو بائسِپ میں شامل کریں
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
- [ ] Azure میں بجٹ الرٹ بنایا گیا ہو
- [ ] ای میل اطلاع کی تشکیل کی گئی ہو
- [ ] Azure پورٹل میں لاگت کا ڈیٹا دیکھا جا سکے
- [ ] بجٹ کی حدیں مناسب طریقے سے سیٹ کی گئی ہوں

## 💡 اکثر پوچھے جانے والے سوالات

<details>
<summary><strong>ترقی کے دوران Microsoft Foundry ماڈلز کی لاگت کیسے کم کروں؟</strong></summary>

1. **مفت سطح استعمال کریں**: Microsoft Foundry ماڈلز 50,000 ٹوکنز/ماہ مفت پیش کرتا ہے
2. **صلاحیت کم کریں**: 30+ کے بجائے ترقی کے لیے 10 TPM سیٹ کریں
3. **azd down استعمال کریں**: جب فعال ترقی نہ کر رہے ہوں تو وسائل کو نیچے لے آئیں
4. **جوابات کا کیش کریں**: دہرائے جانے والے سوالات کے لیے Redis کیش نافذ کریں
5. **پرومپٹ انجینئرنگ استعمال کریں**: مؤثر پرومپٹس کے ساتھ ٹوکن کے استعمال کو کم کریں

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
- نجی نیٹ ورک انضمام
- SLA کی ضمانتیں
- منیجڈ شناخت کی تصدیق
- زیادہ کوٹے دستیاب

**OpenAI API**:
- نئے ماڈلز تک تیز رسائی
- آسان سیٹ اپ
- کم رکاوٹ برائے آغاز
- صرف عوامی انٹرنیٹ

پروڈکشن ایپس کے لیے، **Microsoft Foundry ماڈلز کی سفارش کی جاتی ہے**۔
</details>

<details>
<summary><strong>میں Microsoft Foundry Models quota exceeded کی غلطیوں کو کیسے سنبھالوں؟</strong></summary>

```bash
# موجودہ کوٹا چیک کریں
az cognitiveservices usage list --location eastus2

# مختلف خطہ آزمائیں
azd env set AZURE_LOCATION westus2
azd up

# عارضی طور پر صلاحیت کم کریں
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# کوٹا میں اضافہ کی درخواست کریں
# ایزور پورٹل > کوٹاز > اضافہ کی درخواست کریں پر جائیں
```
</details>

<details>
<summary><strong>کیا میں Microsoft Foundry Models کے ساتھ اپنا ڈیٹا استعمال کر سکتا ہوں؟</strong></summary>

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
<summary><strong>میں AI ماڈل کے اینڈ پوائنٹس کو کیسے محفوظ بناؤں؟</strong></summary>

**بہترین طریقے**:
1. Managed Identity استعمال کریں (کوئی API کیز نہیں)
2. پرائیویٹ اینڈ پوائنٹس کو فعال کریں
3. نیٹ ورک سیکیورٹی گروپس کو ترتیب دیں
4. ریٹ لمٹنگ نافذ کریں
5. سیکریٹس کے لیے Azure Key Vault استعمال کریں

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
- **ایجنٹ اسکلز**: [skills.sh پر Microsoft Foundry کا اسکل](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - اپنے ایڈیٹر میں Azure + Foundry ایجنٹ اسکلز کو `npx skills add microsoft/github-copilot-for-azure` کے ساتھ انسٹال کریں۔

---

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 2 - AI-First Development
- **⬅️ پچھلا باب**: [باب 1: آپ کا پہلا پروجیکٹ](../chapter-01-foundation/first-project.md)
- **➡️ اگلا**: [AI ماڈل کی تعیناتی](ai-model-deployment.md)
- **🚀 اگلا باب**: [باب 3: کنفیگریشن](../chapter-03-configuration/configuration.md)

**مدد چاہیے؟** ہماری کمیونٹی مباحثوں میں شامل ہوں یا ریپوزیٹری میں مسئلہ کھولیں۔ Azure AI + AZD کمیونٹی آپ کی کامیابی کے لیے حاضر ہے!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ اگرچہ ہم درستگی کے لیے کوشش کرتے ہیں، براہ کرم ذہن میں رکھیں کہ خودکار تراجم میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنی مادری زبان میں مستند ذریعہ سمجھی جانی چاہیے۔ اہم معلومات کے لیے پیشہ ورانہ انسان ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والے کسی بھی غلط فہمی یا غلط تشریحات کے لیے ہم ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->