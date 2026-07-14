# Microsoft Foundry کا AZD کے ساتھ انضمام  

**باب کی نیویگیشن:**  
- **📚 کورس ہوم**: [ابتدائیوں کے لیے AZD](../../README.md)  
- **📖 موجودہ باب**: باب 2 - AI-فرسٹ ڈیولپمنٹ  
- **⬅️ پچھلا باب**: [باب 1: آپ کا پہلا پروجیکٹ](../chapter-01-foundation/first-project.md)  
- **➡️ اگلا**: [AI ماڈل کی تعیناتی](ai-model-deployment.md)  
- **🚀 اگلا باب**: [باب 3: کنفیگریشن](../chapter-03-configuration/configuration.md)  

## جائزہ  

یہ رہنما دکھاتا ہے کہ Microsoft Foundry سروسز کو Azure Developer CLI (AZD) کے ساتھ کیسے ضم کیا جائے تاکہ AI ایپلیکیشنز کی تعیناتی کو آسان بنایا جا سکے۔ Microsoft Foundry ایک جامع پلیٹ فارم فراہم کرتا ہے AI ایپلیکیشنز کی تعمیر، تعیناتی، اور انتظام کے لیے، جبکہ AZD انفراسٹرکچر اور تعیناتی کے عمل کو سادہ بناتا ہے۔  

## Microsoft Foundry کیا ہے؟  

Microsoft Foundry مائیکروسافٹ کا متحد پلیٹ فارم ہے AI ڈیولپمنٹ کے لیے جس میں شامل ہیں:  

- **ماڈل کیٹلاگ**: جدید AI ماڈلز تک رسائی  
- **پرومپٹ فلو**: AI ورک فلو کے لیے بصری ڈیزائنر  
- **Microsoft Foundry پورٹل**: AI ایپلیکیشنز کے لیے مربوط ترقیاتی ماحول  
- **تعیناتی کے اختیارات**: متعدد ہوسٹنگ اور اسکیلنگ کے اختیارات  
- **حفاظت اور سیکیورٹی**: شامل شدہ ذمہ دار AI خصوصیات  

## AZD + Microsoft Foundry: ایک ساتھ بہتر  

| خصوصیت | Microsoft Foundry | AZD انضمام کا فائدہ |  
|---------|-----------------|------------------------|  
| **ماڈل تعیناتی** | دستی پورٹل تعیناتی | خودکار، دہرائے جانے والے تعینات |  
| **انفراسٹرکچر** | کلک تھرو پروویژننگ | کوڈ کے طور پر انفراسٹرکچر (بائسِپ) |  
| **ماحول کا انتظام** | واحد ماحول کی توجہ | متعدد ماحول (ڈیولپ/اسٹیجنگ/پروڈ) |  
| **CI/CD انضمام** | محدود | نیٹیو GitHub Actions سپورٹ |  
| **لاگت کا انتظام** | بنیادی نگرانی | ماحول مخصوص لاگت کی اصلاح |  

## ضروریات  

- Azure کی رکنیت مناسب اجازتوں کے ساتھ  
- Azure Developer CLI انسٹال کیا ہوا  
- Microsoft Foundry ماڈلز سروسز تک رسائی  
- Microsoft Foundry کی بنیادی واقفیت  

> **موجودہ AZD بیس لائن:** یہ مثالیں `azd` `1.27.1` کے خلاف چیک کی گئی ہیں۔ AI ایجنٹ ورک فلو کے لیے، موجودہ پیش نظارہ توسیع ریلیز استعمال کریں اور شروع کرنے سے پہلے اپنی انسٹال شدہ ورژن چیک کریں۔  

## مرکزی انضمامی پیٹرنز  

### پیٹرن 1: Microsoft Foundry ماڈلز کا انضمام  

**استعمال کا کیس**: Microsoft Foundry ماڈلز ماڈلز کے ساتھ چیٹ ایپلیکیشنز کی تعیناتی  

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
  
### پیٹرن 2: AI سرچ + RAG انضمام  

**استعمال کا کیس**: بازیابی سے بڑھا ہوا نسل (RAG) ایپلیکیشنز کی تعیناتی  

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
  
### پیٹرن 3: دستاویز انٹیلی جنس انضمام  

**استعمال کا کیس**: دستاویز پراسیسنگ اور تجزیہ کے ورک فلو  

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
  
## 🔧 کنفیگریشن پیٹرنز  

### ماحول کے متغیرات کی سیٹنگ  

**پروڈکشن کنفیگریشن:**  
```bash
# کوئر اے آئی خدمات
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# ماڈل کی ترتیبات
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# کارکردگی کی ترتیبات
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```
  
**ڈیولپمنٹ کنفیگریشن:**  
```bash
# ترقی کے لئے لاگت کی بچت والے سیٹنگز
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # مفت سطح
```
  
### کی ویلت کے ساتھ محفوظ کنفیگریشن  

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

### Foundry کے لیے AZD توسیعات  

AZD توسیعات فراہم کرتا ہے جو Microsoft Foundry سروسز کے ساتھ کام کرنے کے لیے AI مخصوص صلاحیتیں شامل کرتی ہیں:  

```bash
# فاؤنڈری ایجنٹس ایکسٹینشن انسٹال کریں
azd extension install azure.ai.agents

# فائن ٹوننگ ایکسٹینشن انسٹال کریں
azd extension install azure.ai.finetune

# کسٹم ماڈلز ایکسٹینشن انسٹال کریں
azd extension install azure.ai.models

# انسٹال شدہ ایکسٹینشنز کی فہرست بنائیں
azd extension list --installed

# فی الحال انسٹال شدہ ایجنٹ ایکسٹینشن ورژن کا معائنہ کریں
azd extension show azure.ai.agents
```
  
AI توسیعات اب بھی پرشت نما میں تیزی سے ترقی کر رہی ہیں۔ اگر کوئی کمانڈ یہاں دکھائے گئے سے مختلف رویہ اختیار کرے، تو متعلقہ توسیع کو اپ گریڈ کریں اس سے پہلے کہ آپ خود پروجیکٹ کی خرابیوں کا جائزہ لیں۔  

### `azd ai` کے ساتھ ایجنٹ-فرسٹ تعیناتی  

اگر آپ کے پاس ایجنٹ کا مینفیست ہے، تو `azd ai agent init` استعمال کریں تاکہ Foundry Agent Service سے منسلک ایک پروجیکٹ بنایا جا سکے:  

```bash
# ایجنٹ مینیفیسٹ سے آغاز کریں
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure پر تعینات کریں
azd up
```
  
`azure.ai.agents` کے حالیہ پیش نظارہ ریلیزز نے بھی `azd ai agent init` کے لیے ٹیمپلیٹ پر مبنی initialization سپورٹ شامل کی ہے۔ اگر آپ نئے ایجنٹ کے نمونوں کی پیروی کر رہے ہیں، تو اپنی انسٹال شدہ ورژن میں دستیاب درست فلیگز کے لیے توسیع کی مدد چیک کریں۔  

مکمل کمانڈ ریفرنس اور فلیگز کے لیے [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) دیکھیں۔  

### ایک کمانڈ تعیناتی  

```bash
# سب کچھ ایک کمانڈ کے ساتھ تعینات کریں
azd up

# یا بتدریج تعینات کریں
azd provision  # صرف بنیادی ڈھانچہ
azd deploy     # صرف ایپلیکیشن

# azd 1.23.11+ میں طویل مدتی AI ایپ تعینات کرنے کے لیے
azd deploy --timeout 1800
```
  
### ماحول مخصوص تعیناتیاں  

```bash
# ترقیاتی ماحول
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# پیداوار کا ماحول
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
  
## 🔐 سیکیورٹی کی بہترین عملی تدابیر  

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
  
## عام مسائل کی خرابی دوری  

### مسئلہ 1: OpenAI کوٹہ تجاوز کر گیا  

**علامات:**  
- تعیناتی کوٹہ کی غلطیوں کی وجہ سے ناکام ہوتی ہے  
- ایپلیکیشن لاگز میں 429 کی غلطیاں  

**حل:**  
```bash
# موجودہ کوٹا استعمال چیک کریں
az cognitiveservices usage list --location eastus

# مختلف خطہ آزماؤ
azd env set AZURE_LOCATION westus2
azd up

# عارضی طور پر گنجائش کم کریں
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```
  
### مسئلہ 2: توثیق کی ناکامیاں  

**علامات:**  
- AI سروسز کو کال کرنے میں 401/403 کی غلطیاں  
- "رسائی مسترد" کے پیغامات  

**حل:**  
```bash
# رول کی تعیناتیوں کی تصدیق کریں
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# منیجڈ شناخت کی ترتیب چیک کریں
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# کی والٹ تک رسائی کی تصدیق کریں
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```
  
### مسئلہ 3: ماڈل کی تعیناتی کے مسائل  

**علامات:**  
- ماڈلز تعیناتی میں دستیاب نہیں  
- مخصوص ماڈل ورژنز ناکام ہو رہے ہیں  

**حل:**  
```bash
# دستیاب ماڈلز کو علاقے کے لحاظ سے فہرست کریں
az cognitiveservices model list --location eastus

# بائسک ٹیمپلیٹ میں ماڈل کا ورژن اپ ڈیٹ کریں
# ماڈل کی صلاحیت کی ضروریات کو چیک کریں
```
  
## مثال ٹیمپلیٹس  

### RAG چیٹ ایپلیکیشن (Python)  

**ریپوزیٹری**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)  

**سروسز**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage  

**تفصیل**: سب سے مشہور Azure AI نمونہ — ایک پروڈکشن-ریڈی RAG چیٹ ایپ جو آپ کو اپنے دستاویزات پر سوالات کرنے کی اجازت دیتی ہے۔ چیٹ کے لیے GPT-4.1-mini، embeddings کے لیے text-embedding-3-large، اور ریکوری کے لیے Azure AI Search استعمال کرتا ہے۔ ملٹی موڈل دستاویزات، سپیچ ان پٹ/آؤٹ پٹ، Microsoft Entra توثیق، اور Application Insights ٹریسنگ کی حمایت کرتا ہے۔  

**جلدی شروع کریں**:  
```bash
azd init --template azure-search-openai-demo
azd up
```
  
### RAG چیٹ ایپلیکیشن (.NET)  

**ریپوزیٹری**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)  

**سروسز**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel  

**تفصیل**: Python RAG چیٹ نمونے کا .NET/C# متبادل۔ ASP.NET Core Minimal API اور Blazor WebAssembly فرنٹ اینڈ کے ساتھ تیار کیا گیا۔ وائس چیٹ، GPT-4o-mini ویژن سپورٹ، اور ایک ساتھی .NET MAUI Blazor ہائبریڈ ڈیسک ٹاپ/موبائل کلائنٹ شامل ہیں۔  

**جلدی شروع کریں**:  
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```
  
### RAG چیٹ ایپلیکیشن (Java)  

**ریپوزیٹری**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)  

**سروسز**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB  

**تفصیل**: RAG چیٹ نمونے کا Java ورژن جو Langchain4J AI آرکسٹراشن کے لیے استعمال کرتا ہے۔ مائکرو سروس ایونٹ-ڈرائیون آرکیٹیکچر، متعدد سرچ حکمت عملیاں (متن، ویکٹر، ہائبرڈ)، Azure Document Intelligence کے ساتھ دستاویز اپلوڈ، اور Azure Container Apps یا Azure Kubernetes Service پر تعیناتی کی حمایت کرتا ہے۔  

**جلدی شروع کریں**:  
```bash
azd init --template azure-search-openai-demo-java
azd up
```
  
### Microsoft Foundry کے ساتھ انٹرپرائز ریٹیل کوپائلٹ  

**ریپوزیٹری**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)  

**سروسز**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB  

**تفصیل**: Microsoft Foundry اور Prompty کے ساتھ اینڈ-ٹو-اینڈ ریٹیل RAG کوپائلٹ۔ Contoso Outdoor ریٹیلر چیٹ بوٹ جو پروڈکٹ کیٹلاگ اور کسٹمر آرڈر ڈیٹا پر مبنی جوابات فراہم کرتا ہے۔ مکمل GenAIOps ورک فلو دکھاتا ہے — Prompty کے ساتھ پروٹو ٹائپ کریں، AI کی مدد سے جائزہ لیں، اور AZD کے ذریعے Container Apps پر تعینات کریں۔  

**جلدی شروع کریں**:  
```bash
azd init --template contoso-chat
azd up
```
  
### تخلیقی تحریر ملٹی-ایجنٹ ایپلیکیشن  

**ریپوزیٹری**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)  

**سروسز**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps  

**تفصیل**: ملٹی ایجنٹ نمونہ جو Prompty کے ساتھ AI ایجنٹ آرکسٹراشن دکھاتا ہے۔ ایک ریسرچ ایجنٹ (Bing Grounding Azure AI Agent Service میں)، پروڈکٹ ایجنٹ (Azure AI Search)، رائٹر ایجنٹ، اور ایڈیٹر ایجنٹ مل کر اچھی طرح تحقیقی مضامین تیار کرتے ہیں۔ GitHub Actions میں جائزہ کے ساتھ CI/CD شامل ہے۔  

**جلدی شروع کریں**:  
```bash
azd init --template contoso-creative-writer
azd up
```
  
### سرور لیس RAG چیٹ (JavaScript/TypeScript)  

**ریپوزیٹری**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)  

**سروسز**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js  

**تفصیل**: مکمل سرور لیس RAG چیٹ بوٹ جو LangChain.js استعمال کرتا ہے، Azure Functions API کے لیے اور Azure Static Web Apps ہوسٹنگ کے لیے۔ Azure Cosmos DB کو ویکٹر اسٹور اور چیٹ ہسٹری ڈیٹا بیس دونوں کے طور پر استعمال کرتا ہے۔ مقامی ترقی کی حمایت کرتا ہے Ollama کے ذریعے صفر-لاگت کی جانچ کے لیے۔  

**جلدی شروع کریں**:  
```bash
azd init --template serverless-chat-langchainjs
azd up
```
  
### اپنے ڈیٹا کے ساتھ چیٹ حل ایکسلریٹر  

**ریپوزیٹری**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)  

**سروسز**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL  

**تفصیل**: انٹرپرائز گریڈ RAG حل ایکسلریٹر ایڈمن پورٹل کے ساتھ دستاویز اپلوڈ/مینجمنٹ، متعدد آرکسٹریٹر اختیارات (Semantic Kernel, LangChain, Prompt Flow)، سپیچ-ٹو-ٹیکسٹ، Microsoft Teams انضمام، اور PostgreSQL یا Cosmos DB بیک اینڈ کا انتخاب۔ پیداواری RAG سیناریوز کے لیے حسب ضرورت آغاز نقطہ کے طور پر ڈیزائن کیا گیا۔  

**جلدی شروع کریں**:  
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```
  
### AI ٹریول ایجنٹس — ملٹی ایجنٹ MCP آرکسٹراشن  

**ریپوزیٹری**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)  

**سروسز**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)  

**تفصیل**: ملٹی ایجنٹ AI آرکسٹراشن کے لیے حوالہ ایپلیکیشن جو تین فریم ورکس استعمال کرتی ہے (LangChain.js، LlamaIndex.TS، اور Microsoft Agent Framework)۔ MCP (Model Context Protocol) سرورز چار زبانوں میں بطور سرور لیس Azure Container Apps میں تعینات، OpenTelemetry نگرانی کے ساتھ۔  

**جلدی شروع کریں**:  
```bash
azd init --template azure-ai-travel-agents
azd up
```
  
### Azure AI اسٹارٹر  

**ریپوزیٹری**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)  

**سروسز**: Azure AI سروسز + Azure OpenAI  

**تفصیل**: ایک معمولی بائسِپ ٹیمپلیٹ جو Azure AI سروسز تعینات کرتا ہے ترتیب شدہ مشین لرننگ ماڈلز کے ساتھ۔ ایک ہلکا پھلکا آغاز نقطہ جب آپ کو صرف Azure AI انفراسٹرکچر کی ضرورت ہو بغیر مکمل ایپلیکیشن اسٹیک کے۔  

**جلدی شروع کریں**:  
```bash
azd init --template azd-ai-starter
azd up
```
  
> **مزید ٹیمپلیٹس دیکھیں**: [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) پر جائیں جہاں 80+ AI مخصوص AZD ٹیمپلیٹس زبانوں اور سیناریوز میں دستیاب ہیں۔  

## اگلے اقدامات  

1. **مثالیں آزمایں**: اپنے استعمال کیس سے مطابقت رکھنے والا پہلے سے بنا ہوا ٹیمپلیٹ استعمال کریں  
2. **اپنی ضروریات کے مطابق تخصیص کریں**: انفراسٹرکچر اور ایپلیکیشن کوڈ میں تبدیلی کریں  
3. **نگرانی شامل کریں**: جامع مشاہدہ نافذ کریں  
4. **لاگت کی بہتر کاری کریں**: اپنی بجٹ کے مطابق ترتیب دیں  
5. **اپنی تعیناتی کو محفوظ بنائیں**: انٹرپرائز سیکیورٹی پیٹرنز نافذ کریں  
6. **پیداواری سطح پر اسکیل کریں**: ملٹی ریجن اور ہائی اویلیبلٹی خصوصیات شامل کریں  

## 🎯 ہینڈز آن مشقیں  

### مشق 1: Microsoft Foundry ماڈلز چیٹ ایپ تعینات کریں (30 منٹ)  
**مقصد**: پروڈکشن-ریڈی AI چیٹ ایپلیکیشن کی تعیناتی اور جانچ  

```bash
# ٹیمپلیٹ کی ابتدا کریں
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# ماحولیاتی متغیرات مقرر کریں
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# تقسیم کریں
azd up

# درخواست کا جائزہ لیں
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# اے آئی آپریشنز کی نگرانی کریں
azd monitor

# صفائی کریں
azd down --force --purge
```
  
**کامیابی کے معیارات:**  
- [ ] تعیناتی بغیر کوٹہ کی غلطیوں کے مکمل ہو  
- [ ] براؤزر میں چیٹ انٹرفیس تک رسائی حاصل ہو سکے  
- [ ] سوالات کر کے AI مبنی جوابات حاصل کر سکیں  
- [ ] ایپلیکیشن انسائٹس ٹیلی میٹری ڈیٹا دکھائے  
- [ ] وسائل کو کامیابی سے صاف کیا گیا  

**متوقع لاگت**: 30 منٹ کی جانچ کے لیے $5-10  

### مشق 2: متعدد ماڈلز کی تعیناتی ترتیب دیں (45 منٹ)  
**مقصد**: مختلف کنفیگریشن کے ساتھ کئی AI ماڈلز کی تعیناتی  

```bash
# اپنی مرضی کی بسپ کنفیگریشن بنائیں
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
- [ ] متعدد ماڈلز کامیابی سے تعینات ہوئے  
- [ ] مختلف صلاحیت کی ترتیبات لاگو کی گئیں  
- [ ] ماڈلز API کے ذریعے قابل رسائی ہوں  
- [ ] ایپلیکیشن سے دونوں ماڈلز کو کال کیا جا سکے  

### مشق 3: لاگت کی نگرانی نافذ کریں (20 منٹ)  
**مقصد**: بجٹ انتباہات اور لاگت کی ٹریکنگ قائم کریں  

```bash
# بجٹ الارٹ بائسپ میں شامل کریں
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

# بجٹ الارٹ تعینات کریں
azd provision

# موجودہ اخراجات چیک کریں
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```
  
**کامیابی کے معیارات:**  
- [ ] Azure میں بجٹ انتباہ تخلیق کیا گیا  
- [ ] ای میل اطلاع رسانی ترتیب دی گئی  
- [ ] Azure پورٹل میں لاگت کا ڈیٹا دیکھا جا سکتا ہے  
- [ ] بجٹ تھریش ہولڈ مناسب انداز میں سیٹ کیے گئے  

## 💡 اکثر پوچھے جانے والے سوالات  

<details>  
<summary><strong>ترقی کے دوران Microsoft Foundry ماڈلز کی لاگت کیسے کم کریں؟</strong></summary>  

1. **مفت ٹئیر استعمال کریں**: Microsoft Foundry ماڈلز ماہانہ 50,000 ٹوکن مفت فراہم کرتا ہے  
2. **صلاحیت کم کریں**: ڈیولپمنٹ کے لیے صلاحیت 30+ کی بجائے 10 TPM سیٹ کریں  
3. **azd down استعمال کریں**: جب فعال ترقی نہ کر رہے ہوں وسائل کو خارج کریں  
4. **جوابات کیش کریں**: دہرائی جانے والی پوچھ گچھ کے لیے Redis کیش نافذ کریں  
5. **پرومپٹ انجینئرنگ استعمال کریں**: مؤثر پرومپٹس کے ساتھ ٹوکن کا استعمال کم کریں  


```bash
# ترقی کی ترتیب
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry ماڈلز اور OpenAI API میں کیا فرق ہے؟</strong></summary>

**Microsoft Foundry Models**:
- انٹرپرائز سیکیورٹی اور کمپلائنس
- پرائیویٹ نیٹ ورک انٹیگریشن
- SLA گارنٹیز
- منیجڈ آئیڈینٹی آتھنٹیکیشن
- اعلی کوٹہ دستیاب

**OpenAI API**:
- نئے ماڈلز تک تیز رسائی
- سادہ سیٹ اپ
- کم داخلہ رکاوٹ
- صرف پبلک انٹرنیٹ

پروڈکشن ایپس کے لئے، **Microsoft Foundry Models کی سفارش کی جاتی ہے**۔
</details>

<details>
<summary><strong>Microsoft Foundry Models کوٹہ زیادہ ہو جانے کی غلطیوں کو کیسے سنبھالوں؟</strong></summary>

```bash
# موجودہ کوٹہ چیک کریں
az cognitiveservices usage list --location eastus2

# مختلف خطہ آزما کر دیکھیں
azd env set AZURE_LOCATION westus2
azd up

# عارضی طور پر صلاحیت کم کریں
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# کوٹہ بڑھانے کی درخواست کریں
# ایزور پورٹل > کوٹہ > اضافہ کی درخواست پر جائیں
```
</details>

<details>
<summary><strong>کیا میں Microsoft Foundry Models کے ساتھ اپنا ڈیٹا استعمال کر سکتا ہوں؟</strong></summary>

جی ہاں! RAG (Retrieval Augmented Generation) کے لئے **Azure AI Search** استعمال کریں:

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
<summary><strong>میں AI ماڈل کے اینڈپوائنٹس کو کیسے محفوظ بناؤں؟</strong></summary>

**بہترین طریقے**:
1. Managed Identity استعمال کریں (کوئی API کیز نہیں)
2. پرائیویٹ اینڈپوائنٹس فعال کریں
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

## کمیونٹی اور سپورٹ

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [مسائل اور مباحثے](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [سرکاری دستاویزات](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [skills.sh پر Microsoft Foundry مہارت](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - اپنے ایڈیٹر میں `npx skills add microsoft/github-copilot-for-azure` کے ذریعے Azure + Foundry ایجنٹ مہارتیں انسٹال کریں

---

**باب کی نیوی گیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 2 - AI-فرسٹ ڈیولپمنٹ
- **⬅️ پچھلا باب**: [باب 1: آپ کا پہلا پروجیکٹ](../chapter-01-foundation/first-project.md)
- **➡️ اگلا**: [AI ماڈل تعیناتی](ai-model-deployment.md)
- **🚀 اگلا باب**: [باب 3: ترتیب](../chapter-03-configuration/configuration.md)

**مدد چاہیے؟** ہماری کمیونٹی مباحثوں میں شامل ہوں یا ریپوزیٹری میں مسئلہ کھولیں۔ Azure AI + AZD کمیونٹی آپ کی کامیابی میں مدد کے لیے یہاں موجود ہے!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->