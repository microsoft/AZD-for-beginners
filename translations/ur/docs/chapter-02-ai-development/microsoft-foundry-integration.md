# مائیکروسافٹ فاؤنڈری انٹیگریشن وِد AZD

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD فار بیگنرز](../../README.md)
- **📖 موجودہ باب**: باب 2 - AI-فرسٹ ڈیولپمنٹ
- **⬅️ پچھلا باب**: [باب 1: آپ کا پہلا پروجیکٹ](../chapter-01-foundation/first-project.md)
- **➡️ اگلا**: [AI ماڈل ڈیپلائمنٹ](ai-model-deployment.md)
- **🚀 اگلا باب**: [باب 3: کنفیگریشن](../chapter-03-configuration/configuration.md)

## جائزہ

یہ رہنمائی مائیکروسافٹ فاؤنڈری سروسز کو Azure Developer CLI (AZD) کے ساتھ مربوط کرنے کا طریقہ دکھاتی ہے تاکہ AI ایپلیکیشنز کی تعیناتی آسان اور مؤثر بنائی جا سکے۔ مائیکروسافٹ فاؤنڈری AI ایپلیکیشنز کی تعمیر، تعیناتی، اور انتظام کے لیے ایک جامع پلیٹ فارم فراہم کرتا ہے، جبکہ AZD بنیادی ڈھانچے اور تعیناتی کے عمل کو آسان بناتا ہے۔

## مائیکروسافٹ فاؤنڈری کیا ہے؟

مائیکروسافٹ فاؤنڈری مائیکروسافٹ کا متحد پلیٹ فارم ہے جو AI ترقی کے لیے درج ذیل خصوصیات پر مشتمل ہے:

- **ماڈل کیٹلاگ**: جدید AI ماڈلز تک رسائی
- **پرومپٹ فلو**: AI ورک فلو کے لیے بصری ڈیزائنر
- **مائیکروسافٹ فاؤنڈری پورٹل**: AI ایپلیکیشنز کے لیے مربوط ترقیاتی ماحول
- **تعیناتی کے اختیارات**: مختلف ہوسٹنگ اور اسکیلنگ اختیارات
- **حفاظت اور سیکورٹی**: ذمہ دار AI کی بلٹ ان خصوصیات

## AZD + مائیکروسافٹ فاؤنڈری: بہتر تعمیل

| خصوصیت | مائیکروسافٹ فاؤنڈری | AZD انٹیگریشن فائدہ |
|---------|-----------------|------------------------|
| **ماڈل کی تعیناتی** | دستی پورٹل تعیناتی | خودکار، دہرائے جانے والی تعیناتیاں |
| **انفراسٹرکچر** | کلک تھرو پروویژنینگ | کوڈ کے طور پر انفراسٹرکچر (بِسِپ) |
| **ماحول کا انتظام** | واحد ماحول پر توجہ | ملٹی-محیط (ڈیولپمنٹ/اسٹیجنگ/پروڈ) |
| **CI/CD انٹیگریشن** | محدود | نیٹیو گٹ ہب ایکشنز کی حمایت |
| **لاکت کا انتظام** | بنیادی مانیٹرنگ | مخصوص ماحول کے لیے لاگت کی اصلاح |

## پیشگی شرائط

- Azure سبسکرپشن مناسب اجازتوں کے ساتھ
- Azure Developer CLI انسٹال شدہ
- مائیکروسافٹ فاؤنڈری ماڈلز سروسز تک رسائی
- مائیکروسافٹ فاؤنڈری سے بنیادی واقفیت

> **موجودہ AZD بیس لائن:** یہ مثالیں `azd` `1.23.12` کے خلاف جائزہ لی گئی ہیں۔ AI ایجنٹ ورک فلو کے لیے، موجودہ پری ویو ایکسٹینشن ریلیز استعمال کریں اور شروع کرنے سے پہلے اپنے نصب شدہ ورژن کو چیک کریں۔

## بنیادی انٹیگریشن پیٹرنز

### پیٹرن 1: مائیکروسافٹ فاؤنڈری ماڈلز انٹیگریشن

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

### پیٹرن 2: AI سرچ + RAG انٹیگریشن

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

### پیٹرن 3: ڈاکیومنٹ انٹیلی جنس انٹیگریشن

**استعمال کا کیس**: ڈاکیومنٹ پروسیسنگ اور تجزیہ ورک فلو

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

### ماحول کی متغیرات کی سیٹ اپ

**پروڈکشن کنفیگریشن:**
```bash
# بنیادی AI خدمات
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# ماڈل کی ترتیب
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# کارکردگی کی ترتیبات
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**ڈیولپمنٹ کنفیگریشن:**
```bash
# ترقی کے لیے لاگت کی بچت والی ترتیبات
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # مفت طبقہ
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

AZD وہ ایکسٹینشنز فراہم کرتا ہے جو مائیکروسافٹ فاؤنڈری سروسز کے ساتھ کام کرنے کے لیے AI مخصوص صلاحیتیں شامل کرتے ہیں:

```bash
# فاؤنڈری ایجنٹس ایکسٹینشن انسٹال کریں
azd extension install azure.ai.agents

# فائن ٹیوننگ ایکسٹینشن انسٹال کریں
azd extension install azure.ai.finetune

# کسٹم ماڈلز ایکسٹینشن انسٹال کریں
azd extension install azure.ai.models

# انسٹال شدہ ایکسٹینشنز کی فہرست بنائیں
azd extension list --installed

# فی الحال انسٹال شدہ ایجنٹ ایکسٹینشن کا ورژن دیکھیں
azd extension show azure.ai.agents
```

AI ایکسٹینشنز ابھی پریویو میں تیزی سے ترقی کر رہی ہیں۔ اگر کوئی کمانڈ یہاں دکھائی گئی مثال سے مختلف کام کرتی ہے، تو پروجیکٹ میں دشواری حل کرنے سے پہلے متعلقہ ایکسٹینشن کو اپ گریڈ کریں۔

### `azd ai` کے ساتھ ایجنٹ-فرسٹ تعیناتی

اگر آپ کے پاس ایجنٹ مینیفیسٹ موجود ہے، تو `azd ai agent init` استعمال کریں تاکہ فاؤنڈری ایجنٹ سروس سے جڑا ہوا پروجیکٹ سکافولڈ کیا جا سکے:

```bash
# ایجنٹ مینیفیسٹ سے آغاز کریں
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure پر تعینات کریں
azd up
```

`azure.ai.agents` کے حالیہ پریویو ریلیزز نے `azd ai agent init` کے لیے ٹیمپلیٹ بیسڈ انیشیالائزیشن سپورٹ بھی شامل کی ہے۔ اگر آپ نئے ایجنٹ نمونوں کی پیروی کر رہے ہیں، تو اپنی نصب شدہ ورژن میں دستیاب مخصوص فلیگز کے لیے ایکسٹینشن کی مدد ضرور دیکھیں۔

مکمل کمانڈ ریفرنس اور فلیگز کے لیے [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) دیکھیں۔

### سادہ کمانڈ تعیناتی

```bash
# سب کچھ ایک کمانڈ سے تعینات کریں
azd up

# یا بتدریج تعینات کریں
azd provision  # صرف انفراسٹرکچر
azd deploy     # صرف ایپلیکیشن

# azd 1.23.11+ میں طویل مدتی AI ایپ کی تعیناتی کے لیے
azd deploy --timeout 1800
```

### مخصوص ماحول کے لیے تعیناتیاں

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

## مانیٹرنگ اور مشاہدہ

### اپلیکیشن انسائٹس انٹیگریشن

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

## 🔐 حفاظتی بہترین طریقے

### مینیجڈ شناخت کنفیگریشن

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

## پرفارمنس کی اصلاح

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

### آٹو-اسکیلنگ کنفیگریشن

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

### مسئلہ 1: OpenAI کوٹہ سے تجاوز

**علامات:**
- تعیناتی کوٹہ کی غلطیوں کے ساتھ ناکام ہوتی ہے
- ایپلیکیشن لاگز میں 429 کی غلطیاں

**حل:**
```bash
# موجودہ کوٹا استعمال چیک کریں
az cognitiveservices usage list --location eastus

# مختلف علاقہ آزماؤ
azd env set AZURE_LOCATION westus2
azd up

# عارضی طور پر گنجائش کم کریں
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### مسئلہ 2: توثیق کی ناکامیاں

**علامات:**
- AI سروسز کو کال کرنے پر 401/403 کی غلطیاں
- "Access denied" کے پیغامات

**حل:**
```bash
# کردار تفویض کی جانچ کریں
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# منیجڈ شناخت کی تشکیل چیک کریں
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# کی والٹ تک رسائی کو تصدیق کریں
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### مسئلہ 3: ماڈل کی تعیناتی کے مسائل

**علامات:**
- تعیناتی میں ماڈلز دستیاب نہیں
- مخصوص ماڈل ورژنز ناکام ہو رہے ہیں

**حل:**
```bash
# علاقوں کے لحاظ سے دستیاب ماڈلز کی فہرست بنائیں
az cognitiveservices model list --location eastus

# بائسپس ٹیمپلیٹ میں ماڈل کا ورژن اپ ڈیٹ کریں
# ماڈل کی صلاحیت کی ضروریات چیک کریں
```

## مثال کے ٹیمپلیٹس

### RAG چیٹ ایپلیکیشن (پائتھن)

**ریپازیٹری**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**سروسز**: Azure OpenAI + Azure AI سرچ + Azure کنٹینر ایپس + Azure بلاک اسٹوریج

**تفصیل**: سب سے مقبول Azure AI نمونہ — ایک پروڈکشن ریڈی RAG چیٹ ایپ جو آپ کو اپنے دستاویزات پر سوالات کرنے دیتی ہے۔ چیٹ کے لیے GPT-4.1-mini، ایمبیڈنگ کے لیے text-embedding-3-large، اور رٹریول کے لیے Azure AI سرچ استعمال کرتی ہے۔ ملٹی موڈل دستاویزات، سپیچ ان پٹ/آؤٹ پٹ، مائیکروسافٹ اینٹرا توثیق، اور اپلیکیشن انسائٹس ٹریسنگ کی حمایت کرتی ہے۔

**فوری آغاز**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG چیٹ ایپلیکیشن (.NET)

**ریپازیٹری**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**سروسز**: Azure OpenAI + Azure AI سرچ + Azure کنٹینر ایپس + سیمانٹک کرنل

**تفصیل**: پائتھن RAG چیٹ نمونے کا .NET/C# متبادل۔ ASP.NET Core Minimal API اور Blazor WebAssembly فرنٹ اینڈ کے ساتھ تعمیر شدہ۔ وائس چیٹ، GPT-4o-mini وژن سپورٹ، اور اک ساتھی .NET MAUI Blazor ہائبریڈ ڈیسک ٹاپ/موبائل کلائنٹ شامل ہیں۔

**فوری آغاز**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG چیٹ ایپلیکیشن (جاوا)

**ریپازیٹری**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**سروسز**: Azure OpenAI + Azure AI سرچ + Azure کنٹینر ایپس / AKS + Langchain4J + Azure Cosmos DB

**تفصیل**: Langchain4J کے ساتھ AI آرکسٹریشن کا جاوا ورژن۔ مائیکروسروس ایونٹ ڈریون آرکیٹیکچر، متعدد سرچ حکمت عملیاں (ٹیکسٹ، ویکٹر، ہائبرڈ)، Azure Document Intelligence کے ساتھ ڈاکیومنٹ اپ لوڈ، اور Azure کنٹینر ایپس یا Azure Kubernetes سروس پر تعیناتی کی حمایت کرتا ہے۔

**فوری آغاز**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### انٹرپرائز ریٹیل کوپائلٹ مائیکروسافٹ فاؤنڈری کے ساتھ

**ریپازیٹری**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**سروسز**: Azure OpenAI + مائیکروسافٹ فاؤنڈری + پرومپٹی + Azure AI سرچ + Azure کنٹینر ایپس + Azure Cosmos DB

**تفصیل**: مائیکروسافٹ فاؤنڈری اور پرومپٹی کے ذریعے ایک مکمل ریٹیل RAG کوپائلٹ۔ ایک Contoso آؤٹ ڈور ریٹیلر چیٹ بوٹ جو جوابات کو پروڈکٹ کیٹلاگ اور کسٹمر آرڈر ڈیٹا سے متعلق کرتا ہے۔ مکمل GenAIOps ورک فلو دکھاتا ہے — پرومپٹی کے ساتھ پروٹو ٹائپ بنائیں، AI اسسٹڈ ایویلیو ایٹرز کے ساتھ جائزہ لیں، اور AZD کے ذریعے کنٹینر ایپس پر تعینات کریں۔

**فوری آغاز**:
```bash
azd init --template contoso-chat
azd up
```

### تخلیقی تحریر کثیر ایجنٹ ایپلیکیشن

**ریپازیٹری**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**سروسز**: Azure OpenAI + Azure AI ایجنٹ سروس + Bing Grounding + Azure AI سرچ + Azure کنٹینر ایپس

**تفصیل**: ملٹی ایجنٹ نمونہ جو AI ایجنٹ آرکسٹریشن کو پرومپٹی کے ساتھ ظاہر کرتا ہے۔ ایک ریسرچ ایجنٹ (Bing Grounding Azure AI Agent Service میں)، ایک پروڈکٹ ایجنٹ (Azure AI سرچ)، ایک رائٹر ایجنٹ، اور ایک ایڈیٹر ایجنٹ کو متعاون طریقے سے تحقیق شدہ مضامین تیار کرنے کے لیے استعمال کرتا ہے۔ CI/CD GitHub Actions میں evaluation کے ساتھ شامل ہے۔

**فوری آغاز**:
```bash
azd init --template contoso-creative-writer
azd up
```

### سرورلیس RAG چیٹ (جاوااسکرپٹ/ٹائپ اسکرپٹ)

**ریپازیٹری**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**سروسز**: Azure OpenAI + Azure فنکشنز + Azure Static Web Apps + Azure Cosmos DB برائے NoSQL + LangChain.js

**تفصیل**: LangChain.js استعمال کرتے ہوئے مکمل سرورلیس RAG چیٹ بوٹ، Azure Functions API کے لیے، اور Azure Static Web Apps ہوسٹنگ کے لیے۔ Azure Cosmos DB ویکٹر اسٹور اور چیٹ ہسٹری ڈیٹابیس کے طور پر استعمال ہوتا ہے۔ زيرو-کوسٹ ٹیسٹنگ کے لیے Ollama کے ساتھ لوکل ڈیولپمنٹ کی حمایت کرتا ہے۔

**فوری آغاز**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### اپنے ڈیٹا کے ساتھ چیٹ سلوشن ایکسیلیریٹر

**ریپازیٹری**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**سروسز**: Azure OpenAI + Azure AI سرچ + Azure ایپ سروس + Azure Document Intelligence + Azure فنکشنز + Azure Cosmos DB / PostgreSQL

**تفصیل**: انٹرپرائز گریڈ RAG سلوشن ایکسیلیریٹر جس میں دستاویزات اپ لوڈ/مینجمنٹ کے لیے ایڈمن پورٹل، متعدد آرکسٹریٹر آپشنز (سیمانٹک کرنل، لینگ چین، پرومپٹ فلو)، اسپیچ ٹو ٹیکسٹ، مائیکروسافٹ ٹیمز انٹیگریشن، اور PostgreSQL یا Cosmos DB بیک اینڈ کا انتخاب شامل ہے۔ پروڈکشن RAG صورتوں کے لیے حسب ضرورت نقطہ آغاز کے طور پر ڈیزائن کیا گیا ہے۔

**فوری آغاز**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI ٹریول ایجنٹس — کثیر ایجنٹ MCP آرکسٹریشن

**ریپازیٹری**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**سروسز**: Azure OpenAI + مائیکروسافٹ فاؤنڈری + Azure کنٹینر ایپس + MCP سروسز (.NET, Python, Java, TypeScript)

**تفصیل**: تین فریم ورکس (LangChain.js، LlamaIndex.TS، اور مائیکروسافٹ ایجنٹ فریم ورک) کے ساتھ کثیر ایجنٹ AI آرکسٹریشن کا ریفرنس ایپلیکیشن۔ چار زبانوں میں MCP (ماڈل کانٹیکسٹ پروٹوکول) سروسز فیچر کرتا ہے، جو بغیر سرور کے Azure کنٹینر ایپس کے طور پر تعینات ہیں اور OpenTelemetry مانیٹرنگ کے ساتھ۔

**فوری آغاز**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI اسٹارٹر

**ریپازیٹری**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**سروسز**: Azure AI سروسز + Azure OpenAI

**تفصیل**: ایک آسان بِسپ ٹیمپلیٹ جو Azure AI سروسز کو مشین لرننگ ماڈلز کے ساتھ ترتیب دے کر تعینات کرتا ہے۔ ایک ہلکا پھلکا نقطہ آغاز جب آپ کو صرف Azure AI انفراسٹرکچر درکار ہو بغیر مکمل ایپلیکیشن اسٹیک کے۔

**فوری آغاز**:
```bash
azd init --template azd-ai-starter
azd up
```

> **مزید ٹیمپلیٹس دیکھیں**: [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) کا دورہ کریں جہاں زبانوں اور منظرناموں کے ساتھ 80+ AI مخصوص AZD ٹیمپلیٹس دستیاب ہیں۔

## اگلے اقدامات

1. **مثالوں کو آزمائیں**: اپنے استعمال کے کیس سے میل کھانے والا پہلے سے بنایا گیا ٹیمپلیٹ شروع کریں
2. **اپنی ضروریات کے مطابق تخصیص کریں**: بنیادی ڈھانچہ اور ایپلیکیشن کوڈ ترمیم کریں
3. **مانیٹرنگ شامل کریں**: مکمل مشاہدہ نافذ کریں
4. **لاگت کی اصلاح کریں**: اپنے بجٹ کے مطابق کنفیگریشنز بہتر بنائیں
5. **اپنی تعیناتی کی حفاظت کریں**: انٹرپرائز سیکیورٹی پیٹرنز نافذ کریں
6. **پروڈکشن میں اسکیل کریں**: ملٹی ریجن اور ہائی ایویلیبیلٹی خصوصیات شامل کریں

## 🎯 ہینڈز آن مشقیں

### مشق 1: مائیکروسافٹ فاؤنڈری ماڈلز چیٹ ایپ تعینات کریں (30 منٹ)
**مقصد**: پروڈکشن ریڈی AI چیٹ ایپلیکیشن تعینات اور جانچیں

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

# اے آئی کے اعمال کی نگرانی کریں
azd monitor

# صفائی کریں
azd down --force --purge
```

**کامیابی کے معیارات:**
- [ ] تعیناتی بغیر کوٹہ کی غلطیوں کے مکمل ہو
- [ ] براؤزر میں چیٹ انٹرفیس تک رسائی ممکن ہو
- [ ] سوالات پوچھ کر AI سے جوابات حاصل کیے جا سکیں
- [ ] اپلیکیشن انسائٹس ٹیلی میٹری ڈیٹا دکھائے
- [ ] کامیابی سے وسائل کلین اپ کیے جائیں

**تخمینی لاگت**: 30 منٹ کی جانچ کے لیے $5-10

### مشق 2: ملٹی-ماڈل تعیناتی ترتیب دیں (45 منٹ)
**مقصد**: مختلف کنفیگریشنز کے ساتھ متعدد AI ماڈلز کی تعیناتی

```bash
# ذاتی بائسپس کنفیگریشن بنائیں
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
- [ ] متعدد ماڈلز کامیابی سے تعینات ہو گئے
- [ ] مختلف صلاحیت کی ترتیبات لاگو کی گئیں
- [ ] ماڈلز API کے ذریعے قابل رسائی ہوں
- [ ] ایپلیکیشن سے دونوں ماڈلز کو کال کیا جا سکے

### مشق 3: لاگت کی مانیٹرنگ نافذ کریں (20 منٹ)
**مقصد**: بجٹ الارٹس اور لاگت کی ٹریکنگ قائم کریں

```bash
# بجٹ الرٹ کو بائسک میں شامل کریں
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

# بجٹ الرٹ تفویض کریں
azd provision

# موجودہ اخراجات چیک کریں
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**کامیابی کے معیارات:**
- [ ] Azure میں بجٹ الارٹ بنایا گیا
- [ ] ای میل نوٹیفیکیشنز ترتیب دی گئیں
- [ ] Azure پورٹل میں لاگت کا ڈیٹا دیکھا جا سکے
- [ ] بجٹ کی حدیں مناسب طور پر سیٹ کی گئیں

## 💡 اکثر پوچھے جانے والے سوالات

<details>
<summary><strong>میں ترقی کے دوران مائیکروسافٹ فاؤنڈری ماڈلز کی لاگت کیسے کم کر سکتا ہوں؟</strong></summary>

1. **فری ٹیر استعمال کریں**: مائیکروسافٹ فاؤنڈری ماڈلز 50,000 ٹوکنز/ماہ مفت فراہم کرتا ہے
2. **صلاحیت کم کریں**: ترقی کے لیے 30+ کے بجائے 10 TPM سیٹ کریں
3. **azd down کا استعمال کریں**: جب فعال طور پر ڈیولپمنٹ نہ کر رہے ہوں تو وسائل ڈی allocate کریں
4. **ریسپانسز کو کیش کریں**: دہرائے جانے والے سوالات کے لیے Redis کیش نافذ کریں
5. **پرومپٹ انجینئرنگ کا استعمال کریں**: مؤثر پرومپٹس کے ساتھ ٹوکن کی کھپت کم کریں
```bash
# ترقی کی ترتیب
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>مائیکروسافٹ فاؤنڈری ماڈلز اور اوپن اے آئی API میں کیا فرق ہے؟</strong></summary>

**مائیکروسافٹ فاؤنڈری ماڈلز**:
- انٹرپرائز سیکیورٹی اور تعمیل
- پرائیویٹ نیٹ ورک انٹیگریشن
- SLA کی ضمانتیں
- مینیجڈ شناخت کی تصدیق
- زیادہ کوٹہ دستیاب

**اوپن AI API**:
- نئے ماڈلز تک تیز رسائی
- آسان سیٹ اپ
- کم داخلی رکاوٹ
- صرف عوامی انٹرنیٹ

پیداوار ایپس کے لیے، **مائیکروسافٹ فاؤنڈری ماڈلز کی سفارش کی جاتی ہے**۔
</details>

<details>
<summary><strong>میں مائیکروسافٹ فاؤنڈری ماڈلز کے کوٹہ تجاوز کی غلطیوں کو کیسے ہینڈل کروں؟</strong></summary>

```bash
# موجودہ کوٹا چیک کریں
az cognitiveservices usage list --location eastus2

# مختلف خطہ آزما کر دیکھیں
azd env set AZURE_LOCATION westus2
azd up

# عارضی طور پر صلاحیت کم کریں
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# کوٹا میں اضافہ کی درخواست کریں
# Azure پورٹل > کوٹہ > اضافہ کی درخواست پر جائیں
```
</details>

<details>
<summary><strong>کیا میں اپنے ڈیٹا کو مائیکروسافٹ فاؤنڈری ماڈلز کے ساتھ استعمال کر سکتا ہوں؟</strong></summary>

جی ہاں! RAG (ریٹریول آگمینٹڈ جنریشن) کے لیے **Azure AI Search** استعمال کریں:

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
<summary><strong>میں AI ماڈل اینڈپوائنٹس کو کیسے محفوظ کروں؟</strong></summary>

**بہترین طریقے**:
1. مینیجڈ شناخت استعمال کریں (کوئی API کیز نہیں)
2. پرائیویٹ اینڈپوائنٹس فعال کریں
3. نیٹ ورک سیکیورٹی گروپس کی تشکیل کریں
4. ریٹ لمٹ نافذ کریں
5. راز کے لیے Azure Key Vault استعمال کریں

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
- **ایجنٹ اسکلز**: [skills.sh پر مائیکروسافٹ فاؤنڈری اسکل](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - اپنے ایڈیٹر میں Azure + Foundry ایجنٹ اسکلز ایسی انسٹال کریں `npx skills add microsoft/github-copilot-for-azure`

---

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD برائے ابتدائیان](../../README.md)
- **📖 موجودہ باب**: باب 2 - AI-پہلا ترقی
- **⬅️ پچھلا باب**: [باب 1: آپ کا پہلا پروجیکٹ](../chapter-01-foundation/first-project.md)
- **➡️ اگلا**: [AI ماڈل کی تعیناتی](ai-model-deployment.md)
- **🚀 اگلا باب**: [باب 3: کنفیگریشن](../chapter-03-configuration/configuration.md)

**مدد چاہیے؟** ہماری کمیونٹی مباحثوں میں شامل ہوں یا ریپوزٹری میں مسئلہ کھولیں۔ Azure AI + AZD کمیونٹی آپ کی کامیابی کے لیے یہاں موجود ہے!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->