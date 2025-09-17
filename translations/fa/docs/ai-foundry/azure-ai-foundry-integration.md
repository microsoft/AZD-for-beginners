<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "894be87a84e7f669a164d4f67545c8ac",
  "translation_date": "2025-09-17T16:22:01+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "fa"
}
-->
# ادغام Azure AI Foundry با AZD

**فهرست فصل‌ها:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل فعلی**: فصل ۲ - توسعه مبتنی بر هوش مصنوعی
- **⬅️ فصل قبلی**: [فصل ۱: اولین پروژه شما](../getting-started/first-project.md)
- **➡️ بعدی**: [استقرار مدل هوش مصنوعی](ai-model-deployment.md)
- **🚀 فصل بعدی**: [فصل ۳: پیکربندی](../getting-started/configuration.md)

## نمای کلی

این راهنما نحوه ادغام خدمات Azure AI Foundry با Azure Developer CLI (AZD) را برای استقرار ساده‌تر برنامه‌های هوش مصنوعی نشان می‌دهد. Azure AI Foundry یک پلتفرم جامع برای ساخت، استقرار و مدیریت برنامه‌های هوش مصنوعی ارائه می‌دهد، در حالی که AZD فرآیند زیرساخت و استقرار را ساده می‌کند.

## Azure AI Foundry چیست؟

Azure AI Foundry پلتفرم یکپارچه مایکروسافت برای توسعه هوش مصنوعی است که شامل موارد زیر می‌شود:

- **کاتالوگ مدل**: دسترسی به مدل‌های پیشرفته هوش مصنوعی
- **Prompt Flow**: طراح بصری برای جریان‌های کاری هوش مصنوعی
- **پورتال AI Foundry**: محیط توسعه یکپارچه برای برنامه‌های هوش مصنوعی
- **گزینه‌های استقرار**: گزینه‌های مختلف میزبانی و مقیاس‌پذیری
- **ایمنی و امنیت**: ویژگی‌های مسئولیت‌پذیری هوش مصنوعی داخلی

## AZD + Azure AI Foundry: بهتر با هم

| ویژگی | Azure AI Foundry | مزیت ادغام با AZD |
|-------|------------------|-------------------|
| **استقرار مدل** | استقرار دستی از طریق پورتال | استقرار خودکار و قابل تکرار |
| **زیرساخت** | تهیه زیرساخت با کلیک | زیرساخت به عنوان کد (Bicep) |
| **مدیریت محیط** | تمرکز بر یک محیط | چند محیط (توسعه/آزمایشی/تولید) |
| **ادغام CI/CD** | محدود | پشتیبانی بومی از GitHub Actions |
| **مدیریت هزینه** | نظارت پایه | بهینه‌سازی هزینه بر اساس محیط |

## پیش‌نیازها

- اشتراک Azure با مجوزهای مناسب
- نصب Azure Developer CLI
- دسترسی به خدمات Azure OpenAI
- آشنایی اولیه با Azure AI Foundry

## الگوهای اصلی ادغام

### الگو ۱: ادغام Azure OpenAI

**موارد استفاده**: استقرار برنامه‌های چت با مدل‌های Azure OpenAI

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

**زیرساخت (main.bicep):**
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

### الگو ۲: ادغام جستجوی هوش مصنوعی + RAG

**موارد استفاده**: استقرار برنامه‌های تولید مبتنی بر بازیابی (RAG)

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

### الگو ۳: ادغام هوش اسنادی

**موارد استفاده**: جریان‌های کاری پردازش و تحلیل اسناد

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

## 🔧 الگوهای پیکربندی

### تنظیم متغیرهای محیطی

**پیکربندی تولید:**
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

**پیکربندی توسعه:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### پیکربندی امن با Key Vault

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

## جریان‌های کاری استقرار

### استقرار با یک فرمان

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### استقرار بر اساس محیط

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

## نظارت و مشاهده‌پذیری

### ادغام Application Insights

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

### نظارت بر هزینه‌ها

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

## 🔐 بهترین شیوه‌های امنیتی

### پیکربندی Managed Identity

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

### امنیت شبکه

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

## بهینه‌سازی عملکرد

### استراتژی‌های کشینگ

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

### پیکربندی مقیاس‌پذیری خودکار

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

## رفع مشکلات رایج

### مشکل ۱: تجاوز از سهمیه OpenAI

**علائم:**
- استقرار با خطاهای سهمیه شکست می‌خورد
- خطاهای 429 در گزارش‌های برنامه

**راه‌حل‌ها:**
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

### مشکل ۲: شکست در احراز هویت

**علائم:**
- خطاهای 401/403 هنگام فراخوانی خدمات هوش مصنوعی
- پیام‌های "دسترسی ممنوع"

**راه‌حل‌ها:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### مشکل ۳: مشکلات استقرار مدل

**علائم:**
- مدل‌ها در استقرار در دسترس نیستند
- نسخه‌های خاص مدل شکست می‌خورند

**راه‌حل‌ها:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## قالب‌های نمونه

### برنامه چت ساده

**مخزن**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**خدمات**: Azure OpenAI + جستجوی شناختی + سرویس برنامه

**شروع سریع**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### خط پردازش اسناد

**مخزن**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**خدمات**: هوش اسنادی + ذخیره‌سازی + توابع

**شروع سریع**:
```bash
azd init --template ai-document-processing
azd up
```

### چت سازمانی با RAG

**مخزن**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**خدمات**: Azure OpenAI + جستجو + برنامه‌های کانتینری + Cosmos DB

**شروع سریع**:
```bash
azd init --template contoso-chat
azd up
```

## مراحل بعدی

1. **نمونه‌ها را امتحان کنید**: با یک قالب آماده که با موارد استفاده شما مطابقت دارد شروع کنید
2. **برای نیازهای خود سفارشی کنید**: زیرساخت و کد برنامه را تغییر دهید
3. **نظارت اضافه کنید**: مشاهده‌پذیری جامع را پیاده‌سازی کنید
4. **هزینه‌ها را بهینه کنید**: تنظیمات را برای بودجه خود بهینه کنید
5. **استقرار خود را ایمن کنید**: الگوهای امنیتی سازمانی را پیاده‌سازی کنید
6. **به تولید مقیاس دهید**: ویژگی‌های چند منطقه‌ای و دسترسی بالا اضافه کنید

## جامعه و پشتیبانی

- **Discord Azure AI Foundry**: [کانال #Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [مشکلات و بحث‌ها](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [مستندات رسمی](https://learn.microsoft.com/azure/ai-studio/)

---

**فهرست فصل‌ها:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل فعلی**: فصل ۲ - توسعه مبتنی بر هوش مصنوعی
- **⬅️ فصل قبلی**: [فصل ۱: اولین پروژه شما](../getting-started/first-project.md)
- **➡️ بعدی**: [استقرار مدل هوش مصنوعی](ai-model-deployment.md)
- **🚀 فصل بعدی**: [فصل ۳: پیکربندی](../getting-started/configuration.md)

**نیاز به کمک دارید؟** به بحث‌های جامعه ما بپیوندید یا یک مشکل در مخزن باز کنید. جامعه Azure AI + AZD اینجاست تا به موفقیت شما کمک کند!

---

**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما تلاش می‌کنیم دقت را حفظ کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌ها باشند. سند اصلی به زبان اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس، توصیه می‌شود از ترجمه حرفه‌ای انسانی استفاده کنید. ما مسئولیتی در قبال سوء تفاهم‌ها یا تفسیرهای نادرست ناشی از استفاده از این ترجمه نداریم.