# ادغام Microsoft Foundry با AZD

**هدایت فصل:**
- **📚 صفحه دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل ۲ - توسعه با اولویت هوش مصنوعی
- **⬅️ فصل قبلی**: [فصل ۱: اولین پروژه شما](../chapter-01-foundation/first-project.md)
- **➡️ بعدی**: [استقرار مدل‌های هوش مصنوعی](ai-model-deployment.md)
- **🚀 فصل بعدی**: [فصل ۳: پیکربندی](../chapter-03-configuration/configuration.md)

## نمای کلی

این راهنما نشان می‌دهد چگونه سرویس‌های Microsoft Foundry را با Azure Developer CLI (AZD) برای استقرارهای ساده‌تر برنامه‌های هوش مصنوعی یکپارچه کنید. Microsoft Foundry یک پلتفرم جامع برای ساخت، استقرار و مدیریت برنامه‌های هوش مصنوعی فراهم می‌کند، در حالی که AZD فرآیند زیرساخت و استقرار را ساده می‌سازد.

## Microsoft Foundry چیست؟

Microsoft Foundry پلتفرم یکپارچه مایکروسافت برای توسعه هوش مصنوعی است که شامل موارد زیر است:

- **فهرست مدل‌ها**: دسترسی به مدل‌های پیشرفته هوش مصنوعی
- **Prompt Flow**: طراح تصویری برای جریان‌های کاری هوش مصنوعی
- **پرتال Microsoft Foundry**: محیط توسعه یکپارچه برای برنامه‌های هوش مصنوعی
- **گزینه‌های استقرار**: چندین گزینه میزبانی و مقیاس‌دهی
- **ایمنی و امنیت**: ویژگی‌های مسئولانه AI به‌صورت داخلی

## AZD + Microsoft Foundry: بهتر با هم

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | استقرار دستی از طریق پرتال | استقرارهای خودکار و تکرارپذیر |
| **Infrastructure** | ایجاد منابع با کلیک | زیرساخت به‌عنوان کد (Bicep) |
| **Environment Management** | تمرکز روی یک محیط | چند محیطی (dev/staging/prod) |
| **CI/CD Integration** | محدود | پشتیبانی بومی از GitHub Actions |
| **Cost Management** | نظارت پایه | بهینه‌سازی هزینه بر اساس محیط |

## پیش‌نیازها

- اشتراک Azure با مجوزهای مناسب
- Azure Developer CLI نصب‌شده
- دسترسی به سرویس‌های Microsoft Foundry Models
- آشنایی پایه با Microsoft Foundry

> **خط مبنای فعلی AZD:** این مثال‌ها بر اساس `azd` `1.23.12` بررسی شده‌اند. برای جریان کاری عامل هوش مصنوعی، از نسخه پیش‌نمایش فعلی افزونه استفاده کنید و قبل از شروع نسخه نصب‌شده خود را بررسی کنید.

## الگوهای اصلی یکپارچه‌سازی

### الگوی ۱: یکپارچه‌سازی مدل‌های Microsoft Foundry

**مورد استفاده**: استقرار برنامه‌های چت با مدل‌های Microsoft Foundry

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

### الگوی ۲: جستجوی هوش مصنوعی + یکپارچه‌سازی RAG

**مورد استفاده**: استقرار برنامه‌های تولید افزوده‌شده با بازیابی (RAG)

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

### الگوی ۳: یکپارچه‌سازی Document Intelligence

**مورد استفاده**: جریان‌های کاری پردازش و تحلیل اسناد

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

**پیکربندی محیط تولید:**
```bash
# خدمات اصلی هوش مصنوعی
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# پیکربندی‌های مدل
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# تنظیمات عملکرد
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**پیکربندی توسعه:**
```bash
# تنظیمات بهینه‌شده از نظر هزینه برای توسعه
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # سطح رایگان
```

### پیکربندی ایمن با Key Vault

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

### افزونه‌های AZD برای Foundry

AZD افزونه‌هایی ارائه می‌دهد که قابلیت‌های مخصوص هوش مصنوعی را برای کار با سرویس‌های Microsoft Foundry اضافه می‌کنند:

```bash
# افزونهٔ Foundry agents را نصب کنید
azd extension install azure.ai.agents

# افزونهٔ تنظیم دقیق را نصب کنید
azd extension install azure.ai.finetune

# افزونهٔ مدل‌های سفارشی را نصب کنید
azd extension install azure.ai.models

# فهرست افزونه‌های نصب‌شده
azd extension list --installed

# نسخهٔ افزونهٔ عامل نصب‌شدهٔ کنونی را بررسی کنید
azd extension show azure.ai.agents
```

افزونه‌های AI هنوز در پیش‌نمایش به‌سرعت در حال تکامل هستند. اگر یک دستور رفتار متفاوتی نسبت به آنچه اینجا نشان داده شده دارد، پیش از عیب‌یابی پروژه، افزونه مربوطه را به‌روزرسانی کنید.

### استقرار با رویکرد عامل‌محور با `azd ai`

اگر یک manifest عامل دارید، از `azd ai agent init` برای اسکافولد کردن یک پروژه متصل به Foundry Agent Service استفاده کنید:

```bash
# مقداردهی اولیه از مانیفست عامل
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# استقرار در Azure
azd up
```

نسخه‌های پیش‌نمایش اخیر `azure.ai.agents` همچنین پشتیبانی از مقداردهی اولیه مبتنی بر قالب را برای `azd ai agent init` اضافه کرده‌اند. اگر از نمونه‌های عامل جدیدتر پیروی می‌کنید، برای مشاهده فلگ‌های دقیق موجود در نسخه نصب‌شده خود، راهنمای افزونه را بررسی کنید.

برای مرجع کامل دستورات و فلگ‌ها به [دستورات AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) مراجعه کنید.

### استقرار با یک فرمان

```bash
# همه چیز را با یک دستور مستقر کنید
azd up

# یا به‌صورت مرحله‌ای مستقر کنید
azd provision  # فقط زیرساخت‌ها
azd deploy     # فقط برنامهٔ کاربردی

# برای استقرار برنامه‌های هوش مصنوعی بلندمدت در azd 1.23.11+
azd deploy --timeout 1800
```

### استقرارهای خاص هر محیط

```bash
# محیط توسعه
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# محیط تولید
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## نظارت و قابلیت مشاهده

### یکپارچه‌سازی Application Insights

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

### نظارت هزینه

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

### استراتژی‌های کش

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

## رفع اشکال مشکلات رایج

### مشکل ۱: سهمیه OpenAI تمام شده

**نشانه‌ها:**
- استقرار با خطاهای سهمیه شکست می‌خورد
- خطاهای ۴۲۹ در لاگ‌های برنامه

**راه‌حل‌ها:**
```bash
# استفاده فعلی از سهمیه را بررسی کنید
az cognitiveservices usage list --location eastus

# منطقهٔ دیگری را امتحان کنید
azd env set AZURE_LOCATION westus2
azd up

# ظرفیت را به‌طور موقت کاهش دهید
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### مشکل ۲: خطاهای احراز هویت

**نشانه‌ها:**
- خطاهای ۴۰۱/۴۰۳ در هنگام فراخوانی سرویس‌های هوش مصنوعی
- پیام‌های "Access denied"

**راه‌حل‌ها:**
```bash
# تأیید تخصیص نقش‌ها
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# بررسی پیکربندی هویت مدیریت‌شده
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# تأیید دسترسی به Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### مشکل ۳: مشکلات استقرار مدل

**نشانه‌ها:**
- مدل‌ها در استقرار در دسترس نیستند
- نسخه‌های خاص مدل با خطا روبرو می‌شوند

**راه‌حل‌ها:**
```bash
# فهرست مدل‌های در دسترس بر اساس منطقه
az cognitiveservices model list --location eastus

# نسخه مدل را در قالب Bicep به‌روز کنید
# نیازمندی‌های ظرفیت مدل را بررسی کنید
```

## قالب‌های نمونه

### برنامه چت RAG (پایتون)

**مخزن**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**سرویس‌ها**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**توضیحات**: محبوب‌ترین نمونه Azure AI — یک اپ چت RAG آماده برای تولید که به شما اجازه می‌دهد سوالات خود را درباره اسناد خود بپرسید. از GPT-4.1-mini برای چت، text-embedding-3-large برای امبدینگ‌ها، و Azure AI Search برای بازیابی استفاده می‌کند. از اسناد چندمدیال، ورودی/خروجی صوتی، احراز هویت Microsoft Entra و ردیابی Application Insights پشتیبانی می‌کند.

**شروع سریع**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### برنامه چت RAG (.NET)

**مخزن**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**سرویس‌ها**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**توضیحات**: معادل .NET/C# نمونه چت RAG پایتون. ساخته‌شده با ASP.NET Core Minimal API و رابط کاربری Blazor WebAssembly. شامل چت صوتی، پشتیبانی از بینایی GPT-4o-mini و یک کلاینت دسکتاپ/موبایل ترکیبی .NET MAUI Blazor همراه است.

**شروع سریع**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### برنامه چت RAG (جاوا)

**مخزن**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**سرویس‌ها**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**توضیحات**: نسخه جاوا از نمونه چت RAG که از Langchain4J برای ارکستراسیون AI استفاده می‌کند. از معماری میکروسرویس رویدادمحور، استراتژی‌های جستجوی متعدد (متنی، برداری، هیبرید)، آپلود اسناد با Azure Document Intelligence و استقرار روی Azure Container Apps یا Azure Kubernetes Service پشتیبانی می‌کند.

**شروع سریع**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Copilot خرده‌فروشی سازمانی با Azure AI Foundry

**مخزن**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**سرویس‌ها**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**توضیحات**: یک Copilot کامل خرده‌فروشی با استفاده از Azure AI Foundry و Prompty. یک چت‌بات فروشگاه Contoso Outdoor که پاسخ‌ها را بر اساس کاتالوگ محصولات و داده‌های سفارش مشتری پایه‌گذاری می‌کند. جریان کاری کامل GenAIOps را نشان می‌دهد — نمونه‌سازی با Prompty، ارزیابی با ارزیاب‌های کمکی AI، و استقرار از طریق AZD به Container Apps.

**شروع سریع**:
```bash
azd init --template contoso-chat
azd up
```

### برنامه چندعاملۀ نوشتن خلاقانه

**مخزن**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**سرویس‌ها**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**توضیحات**: نمونه چندعامله که ارکستراسیون عامل‌های AI را با Prompty نشان می‌دهد. از یک عامل تحقیق (Bing Grounding در Azure AI Agent Service)، یک عامل محصول (Azure AI Search)، یک عامل نویسنده و یک عامل ویراستار برای تولید مقالات خوب تحقیق‌شده به‌صورت همکاری استفاده می‌کند. شامل CI/CD با ارزیابی در GitHub Actions است.

**شروع سریع**:
```bash
azd init --template contoso-creative-writer
azd up
```

### RAG چت بدون سرور (JavaScript/TypeScript)

**مخزن**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**سرویس‌ها**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**توضیحات**: ربات چت RAG کاملاً بدون سرور که از LangChain.js با Azure Functions برای API و Azure Static Web Apps برای میزبانی استفاده می‌کند. از Azure Cosmos DB هم به‌عنوان مخزن برداری و هم به‌عنوان پایگاه تاریخچه چت استفاده می‌کند. از توسعه محلی با Ollama برای تست بدون هزینه پشتیبانی می‌کند.

**شروع سریع**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### شتاب‌دهنده راه‌حل Chat with Your Data

**مخزن**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**سرویس‌ها**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**توضیحات**: شتاب‌دهنده راه‌حل RAG در سطح سازمانی با پرتال مدیریت برای آپلود/مدیریت اسناد، چند گزینه ارکستراتور (Semantic Kernel, LangChain, Prompt Flow)، تبدیل گفتار به متن، یکپارچه‌سازی Microsoft Teams، و انتخاب پایگاه داده PostgreSQL یا Cosmos DB به‌عنوان بک‌اند. به‌عنوان نقطه شروع قابل سفارشی برای سناریوهای RAG در تولید طراحی شده است.

**شروع سریع**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### عوامل مسافرتی هوش مصنوعی — ارکستراسیون چندعامل MCP

**مخزن**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**سرویس‌ها**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**توضیحات**: برنامه مرجع برای ارکستراسیون چندعامل AI با استفاده از سه فریم‌ورک (LangChain.js, LlamaIndex.TS و Microsoft Agent Framework). شامل سرورهای MCP (Model Context Protocol) به چهار زبان است که به‌صورت سرورلس در Azure Container Apps مستقر شده و با مانیتورینگ OpenTelemetry همراه هستند.

**شروع سریع**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### شروع‌کننده Azure AI

**مخزن**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**سرویس‌ها**: Azure AI Services + Azure OpenAI

**توضیحات**: قالب Bicep مینیمال که سرویس‌های Azure AI را با مدل‌های یادگیری ماشین پیکربندی‌شده مستقر می‌کند. نقطه شروع سبک وزنی است وقتی فقط نیاز به تامین زیرساخت Azure AI دارید بدون پشته برنامه کامل.

**شروع سریع**:
```bash
azd init --template azd-ai-starter
azd up
```

> **مرور قالب‌های بیشتر**: بازدید از [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) برای بیش از ۸۰ قالب AZD مخصوص AI در زبان‌ها و سناریوهای مختلف.

## گام‌های بعدی

1. **نمونه‌ها را اجرا کنید**: با یک قالب از پیش ساخته که با مورد استفاده شما مطابقت دارد شروع کنید
2. **برای نیازهای خود سفارشی کنید**: زیرساخت و کد برنامه را تغییر دهید
3. **نظارت اضافه کنید**: قابلیت مشاهده جامع را پیاده‌سازی کنید
4. **هزینه‌ها را بهینه کنید**: پیکربندی‌ها را برای بودجه خود تنظیم کنید
5. **استقرار را امن کنید**: الگوهای امنیتی سازمانی را پیاده‌سازی کنید
6. **به تولید مقیاس دهید**: ویژگی‌های چندمنطقه‌ای و دسترسی بالا را اضافه کنید

## 🎯 تمرین‌های عملی

### تمرین ۱: استقرار اپ چت با مدل‌های Microsoft Foundry (۳۰ دقیقه)
**هدف**: استقرار و آزمایش یک برنامه چت AI آماده برای تولید

```bash
# مقداردهی اولیه قالب
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# تنظیم متغیرهای محیطی
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# استقرار
azd up

# تست برنامه
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# نظارت بر عملیات هوش مصنوعی
azd monitor

# پاک‌سازی
azd down --force --purge
```

**معیارهای موفقیت:**
- [ ] استقرار بدون خطاهای سهمیه تکمیل شود
- [ ] بتوان به رابط چت از طریق مرورگر دسترسی داشت
- [ ] بتوان سوال پرسید و پاسخ‌های مبتنی بر AI دریافت کرد
- [ ] Application Insights داده‌های تله‌متری را نشان دهد
- [ ] منابع با موفقیت پاک‌سازی شده باشند

**هزینه تقریبی**: $5-10 برای ۳۰ دقیقه تست

### تمرین ۲: پیکربندی استقرار چندمدلی (۴۵ دقیقه)
**هدف**: استقرار چندین مدل AI با پیکربندی‌های مختلف

```bash
# ایجاد پیکربندی سفارشی Bicep
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

# استقرار و تأیید
azd provision
azd show
```

**معیارهای موفقیت:**
- [ ] چندین مدل با موفقیت مستقر شده‌اند
- [ ] تنظیمات ظرفیت مختلف اعمال شده‌اند
- [ ] مدل‌ها از طریق API در دسترس هستند
- [ ] بتوان هر دو مدل را از برنامه فراخوانی کرد

### تمرین ۳: پیاده‌سازی نظارت هزینه (۲۰ دقیقه)
**هدف**: راه‌اندازی هشدارهای بودجه و ردیابی هزینه

```bash
# افزودن هشدار بودجه به Bicep
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

# استقرار هشدار بودجه
azd provision

# بررسی هزینه‌های کنونی
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**معیارهای موفقیت:**
- [ ] هشدار بودجه در Azure ایجاد شده است
- [ ] اعلان‌های ایمیلی پیکربندی شده‌اند
- [ ] می‌توان داده‌های هزینه را در Azure Portal مشاهده کرد
- [ ] آستانه‌های بودجه به‌صورت مناسب تنظیم شده‌اند

## 💡 پرسش‌های متداول

<details>
<summary><strong>چطور هزینه‌های Microsoft Foundry Models را در طول توسعه کاهش دهم؟</strong></summary>

1. **از سطح رایگان استفاده کنید**: Microsoft Foundry Models ماهانه 50,000 توکن رایگان ارائه می‌دهد
2. **ظرفیت را کاهش دهید**: برای توسعه ظرفیت را روی 10 TPM به‌جای 30+ تنظیم کنید
3. **از azd down استفاده کنید**: وقتی فعالانه توسعه نمی‌کنید منابع را آزاد کنید
4. **پاسخ‌ها را کش کنید**: برای پرس‌وجوهای تکراری از کش Redis استفاده کنید
5. **از مهندسی پرامپت استفاده کنید**: با پرامپت‌های کارآمد مصرف توکن را کاهش دهید


```bash
# پیکربندی توسعه
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>تفاوت بین Microsoft Foundry Models و OpenAI API چیست؟</strong></summary>

**Microsoft Foundry Models**:
- امنیت سازمانی و تطابق با مقررات
- یکپارچه‌سازی با شبکه خصوصی
- تضمین‌های SLA
- احراز هویت با Managed Identity
- سهمیه‌های بالاتر در دسترس

**OpenAI API**:
- دسترسی سریع‌تر به مدل‌های جدید
- راه‌اندازی ساده‌تر
- موانع ورود کمتر
- فقط از طریق اینترنت عمومی

برای برنامه‌های تولیدی، **استفاده از Microsoft Foundry Models توصیه می‌شود**.
</details>

<details>
<summary><strong>چگونه خطاهای اتمام سهمیه Microsoft Foundry Models را مدیریت کنم؟</strong></summary>

```bash
# سهمیه فعلی را بررسی کنید
az cognitiveservices usage list --location eastus2

# منطقه‌ای متفاوت را امتحان کنید
azd env set AZURE_LOCATION westus2
azd up

# ظرفیت را موقتاً کاهش دهید
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# درخواست افزایش سهمیه را ثبت کنید
# به پورتال Azure > سهمیه‌ها > درخواست افزایش بروید
```
</details>

<details>
<summary><strong>آیا می‌توانم از داده‌های خودم با Microsoft Foundry Models استفاده کنم؟</strong></summary>

بله! از **Azure AI Search** برای RAG (Retrieval Augmented Generation) استفاده کنید:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

قالب [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) را ببینید.
</details>

<details>
<summary><strong>چگونه نقاط پایان مدل‌های هوش مصنوعی را ایمن کنم؟</strong></summary>

**بهترین روش‌ها**:
1. از Managed Identity استفاده کنید (بدون کلیدهای API)
2. فعال‌سازی Private Endpoints
3. پیکربندی گروه‌های امنیتی شبکه
4. اجرای محدودیت نرخ
5. از Azure Key Vault برای نگهداری اسرار استفاده کنید

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

## جامعه و پشتیبانی

- **Microsoft Foundry Discord**: [#کانال Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [مسائل و بحث‌ها](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [مستندات رسمی](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - مهارت‌های عامل Azure + Foundry را در ویرایشگر خود با `npx skills add microsoft/github-copilot-for-azure` نصب کنید

---

**ناوبری فصل:**
- **📚 صفحه دوره**: [AZD For Beginners](../../README.md)
- **📖 فصل فعلی**: فصل 2 - توسعه‌ی مبتنی بر هوش‌مصنوعی
- **⬅️ فصل قبلی**: [فصل 1: اولین پروژه شما](../chapter-01-foundation/first-project.md)
- **➡️ بعدی**: [استقرار مدل هوش مصنوعی](ai-model-deployment.md)
- **🚀 فصل بعدی**: [فصل 3: پیکربندی](../chapter-03-configuration/configuration.md)

**نیاز به کمک دارید؟** در بحث‌های جامعه ما شرکت کنید یا یک issue در مخزن باز کنید. جامعه Azure AI + AZD اینجا هست تا به موفقیت شما کمک کند!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
این سند با استفاده از سرویس ترجمهٔ هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما برای دستیابی به دقت تلاش می‌کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است دارای خطاها یا نادرستی‌هایی باشند. نسخهٔ اصلی سند به زبان مادری آن باید به‌عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمهٔ حرفه‌ای انسانی توصیه می‌شود. ما در قبال هر گونه سوءتفاهم یا تفسیر نادرست ناشی از استفاده از این ترجمه مسئول نیستیم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->