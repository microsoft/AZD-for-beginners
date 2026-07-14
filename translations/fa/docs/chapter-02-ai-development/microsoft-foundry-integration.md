# یکپارچه‌سازی Microsoft Foundry با AZD

**هدایت فصل:**
- **📚 خانه دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل ۲ - توسعه محور هوش مصنوعی
- **⬅️ فصل قبل**: [فصل ۱: اولین پروژه شما](../chapter-01-foundation/first-project.md)
- **➡️ بعدی**: [استقرار مدل هوش مصنوعی](ai-model-deployment.md)
- **🚀 فصل بعدی**: [فصل ۳: پیکربندی](../chapter-03-configuration/configuration.md)

## نمای کلی

این راهنما نشان می‌دهد چگونه خدمات Microsoft Foundry را با Azure Developer CLI (AZD) برای استقرارهای ساده‌تر برنامه‌های هوش مصنوعی ادغام کنیم. Microsoft Foundry یک پلتفرم جامع برای ساخت، استقرار و مدیریت برنامه‌های هوش مصنوعی ارائه می‌دهد، در حالی که AZD فرایند زیرساخت و استقرار را ساده‌تر می‌کند.

## Microsoft Foundry چیست؟

Microsoft Foundry پلتفرم یکپارچه مایکروسافت برای توسعه هوش مصنوعی است که شامل موارد زیر می‌باشد:

- **فهرست مدل‌ها**: دسترسی به مدل‌های پیشرفته هوش مصنوعی
- **جریان درخواست**: طراح بصری برای جریان‌های کاری هوش مصنوعی
- **پورتال Microsoft Foundry**: محیط توسعه یکپارچه برای برنامه‌های هوش مصنوعی
- **گزینه‌های استقرار**: گزینه‌های متعدد میزبانی و مقیاس‌بندی
- **ایمنی و امنیت**: ویژگی‌های مسئولیت‌پذیر هوش مصنوعی تعبیه شده

## AZD + Microsoft Foundry: بهتر با هم

| ویژگی | Microsoft Foundry | مزیت یکپارچه‌سازی AZD |
|---------|-----------------|------------------------|
| **استقرار مدل** | استقرار دستی در پورتال | استقرارهای خودکار و تکرارپذیر |
| **زیرساخت** | تهیه کلیکی | زیرساخت به عنوان کد (Bicep) |
| **مدیریت محیط** | تمرکز بر یک محیط | چند محیط (توسعه/آزمایش/تولید) |
| **یکپارچه‌سازی CI/CD** | محدود | پشتیبانی بومی از GitHub Actions |
| **مدیریت هزینه** | نظارت پایه | بهینه‌سازی هزینه به ازای هر محیط |

## پیش‌نیازها

- اشتراک Azure با مجوزهای مناسب
- نصب Azure Developer CLI
- دسترسی به خدمات مدل‌های Microsoft Foundry
- آشنایی پایه با Microsoft Foundry

> **نسخه پایه AZD فعلی:** این مثال‌ها با `azd` نسخه `1.27.1` بررسی شده‌اند. برای جریان کاری عامل هوش مصنوعی، از نسخه پیش‌نمایش فعلی افزونه استفاده کنید و قبل از شروع نسخه نصب شده خود را بررسی نمایید.

## الگوهای اصلی یکپارچه‌سازی

### الگو ۱: یکپارچه‌سازی مدل‌های Microsoft Foundry

**کاربرد:** استقرار برنامه‌های گفتگویی با مدل‌های Microsoft Foundry

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

### الگو ۲: یکپارچه‌سازی جستجوی هوش مصنوعی + RAG

**کاربرد:** استقرار برنامه‌های بازیابی افزایش‌یافته تولید محتوا (RAG)

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

### الگو ۳: یکپارچه‌سازی هوش سند

**کاربرد:** جریان‌های کاری پردازش و تحلیل اسناد

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
# تنظیمات بهینه شده از نظر هزینه برای توسعه
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # لایه رایگان
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

### افزونه‌های AZD برای Foundry

AZD افزونه‌هایی ارائه می‌دهد که قابلیت‌های خاص هوش مصنوعی برای کار با خدمات Microsoft Foundry اضافه می‌کنند:

```bash
# نصب افزونه نمایندگان Foundry
azd extension install azure.ai.agents

# نصب افزونه تنظیم دقیق
azd extension install azure.ai.finetune

# نصب افزونه مدل‌های سفارشی
azd extension install azure.ai.models

# فهرست افزونه‌های نصب شده
azd extension list --installed

# بررسی نسخه افزونه نماینده نصب شده در حال حاضر
azd extension show azure.ai.agents
```

افزونه‌های هوش مصنوعی هنوز در پیش‌نمایش سریع پیش می‌روند. اگر یک فرمان رفتار متفاوتی نسبت به نشان داده شده دارد، قبل از عیب‌یابی پروژه، افزونه مربوطه را به‌روزرسانی کنید.

### استقرار با اولویت عامل با `azd ai`

اگر یک مانیفست عامل دارید، از `azd ai agent init` برای راه‌اندازی پروژه‌ای متصل به سرویس عامل Foundry استفاده کنید:

```bash
# مقداردهی اولیه از یک مانیفست عامل
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# استقرار در آزور
azd up
```

نسخه‌های اخیر پیش‌نمایش `azure.ai.agents` نیز پشتیبانی از مقداردهی اولیه بر اساس قالب‌ها را برای `azd ai agent init` اضافه کرده‌اند. اگر نمونه‌های جدیدتر عامل را دنبال می‌کنید، راهنمای افزونه را برای پرچم‌های دقیق در نسخه نصب شده خود بررسی کنید.

برای مرجع کامل فرمان‌ها و پرچم‌ها به [دستورات AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) مراجعه کنید.

### استقرار با یک فرمان واحد

```bash
# همه چیز را با یک فرمان مستقر کنید
azd up

# یا به صورت مرحله‌ای مستقر کنید
azd provision  # فقط زیرساخت
azd deploy     # فقط برنامه

# برای استقرار برنامه‌های هوش مصنوعی بلندمدت در azd 1.23.11+
azd deploy --timeout 1800
```

### استقرارهای مختص محیط

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

## نظارت و رصدپذیری

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

### پیکربندی هویت مدیریت شده

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

### پیکربندی مقیاس خودکار

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

### مشکل ۱: تجاوز سهمیه OpenAI

**علائم:**
- استقرار با خطاهای سهمیه مواجه می‌شود
- خطاهای ۴۲۹ در لاگ‌های برنامه

**راه‌حل‌ها:**
```bash
# بررسی میزان استفاده کنونی از سهمیه
az cognitiveservices usage list --location eastus

# تلاش در منطقه‌ی دیگر
azd env set AZURE_LOCATION westus2
azd up

# کاهش موقت ظرفیت
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### مشکل ۲: خطاهای احراز هویت

**علائم:**
- خطاهای ۴۰۱/۴۰۳ هنگام فراخوانی خدمات هوش مصنوعی
- پیام‌های "دسترسی ممنوع"

**راه‌حل‌ها:**
```bash
# تأیید تخصیص نقش‌ها
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# بررسی پیکربندی هویت مدیریت‌شده
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# اعتبارسنجی دسترسی به کلید مخزن
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### مشکل ۳: مشکلات در استقرار مدل

**علائم:**
- مدل‌ها در استقرار در دسترس نیستند
- نسخه‌های خاص مدل‌ها با خطا مواجه می‌شوند

**راه‌حل‌ها:**
```bash
# فهرست مدل‌های موجود بر اساس منطقه
az cognitiveservices model list --location eastus

# به‌روزرسانی نسخه مدل در قالب بایسپ
# بررسی نیازمندی‌های ظرفیت مدل
```

## قالب‌های نمونه

### برنامه چت RAG (پایتون)

**مخزن**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**خدمات**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**توضیحات**: محبوب‌ترین نمونه Azure AI — یک برنامه چت RAG آماده تولید که به شما امکان می‌دهد سوالات خود را روی اسناد خود بپرسید. از GPT-4.1-mini برای چت، text-embedding-3-large برای تعبیه‌ها، و Azure AI Search برای بازیابی استفاده می‌کند. از اسناد چندرسانه‌ای، ورودی/خروجی گفتار، احراز هویت Microsoft Entra، و ردیابی Application Insights پشتیبانی می‌کند.

**شروع سریع**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### برنامه چت RAG (.NET)

**مخزن**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**خدمات**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**توضیحات**: معادل .NET/C# نمونه چت RAG پایتون. ساخته شده با ASP.NET Core Minimal API و فرانت‌اند Blazor WebAssembly. شامل چت صوتی، پشتیبانی دیداری GPT-4o-mini و مشتری دسکتاپ/موبایل Blazor Hybrid مبتنی بر .NET MAUI.

**شروع سریع**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### برنامه چت RAG (جاوا)

**مخزن**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**خدمات**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**توضیحات**: نسخه جاوا نمونه چت RAG با استفاده از Langchain4J برای هماهنگی هوش مصنوعی. از معماری رویدادمحور میکروسرویس، چند استراتژی جستجو (متن، بردار، ترکیبی)، آپلود سند با Azure Document Intelligence، و استقرار در Azure Container Apps یا Azure Kubernetes Service پشتیبانی می‌کند.

**شروع سریع**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### همراه خرده‌فروشی سازمانی با Microsoft Foundry

**مخزن**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**خدمات**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**توضیحات**: همراه RAG خرده‌فروشی نقطه به نقطه با استفاده از Microsoft Foundry و Prompty. چت‌بات فروشگاه Contoso Outdoor که پاسخ‌ها را بر اساس کاتالوگ محصول و داده‌های سفارش مشتری پایه‌گذاری می‌کند. جریان کامل GenAIOps را نشان می‌دهد — نمونه اولیه با Prompty، ارزیابی با ارزیاب‌های هوش مصنوعی، و استقرار با AZD به Container Apps.

**شروع سریع**:
```bash
azd init --template contoso-chat
azd up
```

### برنامه چندعامله نویسندگی خلاقانه

**مخزن**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**خدمات**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**توضیحات**: نمونه چندعامله که هماهنگی عامل هوش مصنوعی با Prompty را نشان می‌دهد. از یک عامل تحقیق (Bing Grounding در Azure AI Agent Service)، یک عامل محصول (Azure AI Search)، یک عامل نویسنده، و یک عامل ویراستار برای تولید مقالات خوب پژوهش شده به صورت تعاملی استفاده می‌کند. شامل CI/CD با ارزیابی در GitHub Actions است.

**شروع سریع**:
```bash
azd init --template contoso-creative-writer
azd up
```

### چت بدون سرور RAG (JavaScript/TypeScript)

**مخزن**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**خدمات**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB برای NoSQL + LangChain.js

**توضیحات**: چت‌بات کاملاً بدون‌سرور RAG با استفاده از LangChain.js و Azure Functions برای API و Azure Static Web Apps برای میزبانی. از Azure Cosmos DB به عنوان فروشگاه برداری و پایگاه داده تاریخچه چت استفاده می‌کند. از توسعه محلی با Ollama برای آزمایش بدون هزینه پشتیبانی می‌کند.

**شروع سریع**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### تسریع‌کننده راه‌حل چت با داده‌های شما

**مخزن**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**خدمات**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**توضیحات**: تسریع‌کننده راه‌حل RAG در سطح سازمانی با پورتال مدیریت/بارگذاری اسناد، گزینه‌های مختلف هماهنگ‌کننده (Semantic Kernel، LangChain، Prompt Flow)، تبدیل گفتار به متن، یکپارچه‌سازی Microsoft Teams، و انتخاب پایگاه داده PostgreSQL یا Cosmos DB. به عنوان یک نقطه شروع قابل تنظیم برای سناریوهای تولید RAG طراحی شده است.

**شروع سریع**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### عوامل سفر هوش مصنوعی — هماهنگی چندعامله MCP

**مخزن**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**خدمات**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + سرورهای MCP (.NET, Python, Java, TypeScript)

**توضیحات**: برنامه مرجع برای هماهنگی چندعامله هوش مصنوعی با استفاده از سه چارچوب (LangChain.js، LlamaIndex.TS، و Microsoft Agent Framework). دارای سرورهای MCP (پروتکل زمینه مدل) به چهار زبان که به صورت سرویس بدون سرور در Azure Container Apps با نظارت OpenTelemetry مستقر شده‌اند.

**شروع سریع**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### شروع‌کننده Azure AI

**مخزن**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**خدمات**: خدمات Azure AI + Azure OpenAI

**توضیحات**: قالب Bicep حداقلی که خدمات Azure AI را با مدل‌های یادگیری ماشین پیکربندی شده مستقر می‌کند. نقطه شروع سبک وزنی وقتی فقط نیاز به تامین زیرساخت Azure AI دارید بدون پشته کامل برنامه.

**شروع سریع**:
```bash
azd init --template azd-ai-starter
azd up
```

> **بازدید از قالب‌های بیشتر**: به [گالری قالب‌های عالی AZD AI](https://azure.github.io/awesome-azd/?tags=ai) با بیش از ۸۰ قالب اختصاصی AZD برای هوش مصنوعی در زبان‌ها و سناریوهای مختلف مراجعه کنید.

## گام‌های بعدی

۱. **امتحان کردن مثال‌ها**: با قالب پیش‌ساخته‌ای شروع کنید که با مورد استفاده شما هم‌خوانی دارد
۲. **سفارشی‌سازی برای نیازهای خود**: زیرساخت و کد برنامه را تغییر دهید
۳. **افزودن نظارت**: مشاهده‌پذیری جامع را پیاده کنید
۴. **بهینه‌سازی هزینه‌ها**: پیکربندی‌ها را با بودجه خود بهینه کنید
۵. **امن‌سازی استقرار خود**: الگوهای امنیتی سازمانی را پیاده کنید
۶. **مقیاس‌گذاری برای تولید**: ویژگی‌های چندمنطقه‌ای و پایداری بالا را اضافه کنید

## 🎯 تمرین‌های عملی

### تمرین ۱: استقرار برنامه چت مدل‌های Microsoft Foundry (۳۰ دقیقه)
**هدف**: استقرار و آزمایش برنامه چت هوش مصنوعی آماده تولید

```bash
# مقداردهی اولیه الگو
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# تنظیم متغیرهای محیطی
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# استقرار
azd up

# آزمایش برنامه
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# نظارت بر عملیات هوش مصنوعی
azd monitor

# پاکسازی
azd down --force --purge
```

**معیارهای موفقیت:**
- [ ] استقرار بدون خطاهای سهمیه کامل شود
- [ ] دسترسی به رابط چت در مرورگر ممکن باشد
- [ ] بتوان سوال پرسید و پاسخ‌های هوش مصنوعی دریافت کرد
- [ ] Application Insights داده‌های تله‌متری را نشان دهد
- [ ] منابع با موفقیت پاک‌سازی شوند

**هزینه تخمینی**: ۵ تا ۱۰ دلار برای ۳۰ دقیقه آزمایش

### تمرین ۲: پیکربندی استقرار چندمدلی (۴۵ دقیقه)
**هدف**: استقرار چند مدل هوش مصنوعی با پیکربندی‌های متفاوت

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

# استقرار و تأیید صحت
azd provision
azd show
```

**معیارهای موفقیت:**
- [ ] چند مدل با موفقیت استقرار یافته‌اند
- [ ] تنظیمات ظرفیت مختلف اعمال شده است
- [ ] مدل‌ها از طریق API قابل دسترسی‌اند
- [ ] می‌توان هر دو مدل را از برنامه فراخوانی کرد

### تمرین ۳: پیاده‌سازی نظارت هزینه (۲۰ دقیقه)
**هدف**: راه‌اندازی هشدارهای بودجه و رصد هزینه

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

# راه‌اندازی هشدار بودجه
azd provision

# بررسی هزینه‌های جاری
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**معیارهای موفقیت:**
- [ ] هشدار بودجه در Azure ایجاد شده باشد
- [ ] اعلان‌های ایمیلی پیکربندی شده باشند
- [ ] بتوان داده‌های هزینه را در پرتال Azure مشاهده کرد
- [ ] آستانه‌های بودجه به‌درستی تنظیم شده باشند

## 💡 سوالات متداول

<details>
<summary><strong>چگونه هزینه مدل‌های Microsoft Foundry را در طول توسعه کاهش دهم؟</strong></summary>

۱. **استفاده از لایه رایگان**: Microsoft Foundry Models ماهانه ۵۰,۰۰۰ توکن رایگان ارائه می‌دهد
۲. **کاهش ظرفیت**: ظرفیت را به ۱۰ TPM به جای بیش از ۳۰ برای توسعه تنظیم کنید
۳. **استفاده از azd down**: منابع را زمانی که به طور فعال توسعه نمی‌دهید آزاد کنید
۴. **کَش پاسخ‌ها**: استفاده از کش Redis برای پرسش‌های تکراری را پیاده کنید
۵. **استفاده از مهندسی درخواست**: با درخواست‌های بهینه شده مصرف توکن را کاهش دهید


```bash
# پیکربندی توسعه
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>تفاوت بین Microsoft Foundry Models و OpenAI API چیست؟</strong></summary>

**Microsoft Foundry Models**:
- امنیت و رعایت قوانین سازمانی
- ادغام شبکه خصوصی
- تضمین‌های SLA
- احراز هویت هویت مدیریت شده
- سهمیه‌های بالاتر موجود است

**OpenAI API**:
- دسترسی سریع‌تر به مدل‌های جدید
- راه‌اندازی ساده‌تر
- مانع ورود پایین‌تر
- فقط اینترنت عمومی

برای برنامه‌های تولیدی، **Microsoft Foundry Models توصیه می‌شود**.
</details>

<details>
<summary><strong>چگونه خطاهای تجاوز از سهمیه Microsoft Foundry Models را مدیریت کنم؟</strong></summary>

```bash
# بررسی سهمیه فعلی
az cognitiveservices usage list --location eastus2

# تلاش در منطقه متفاوت
azd env set AZURE_LOCATION westus2
azd up

# کاهش موقتی ظرفیت
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# درخواست افزایش سهمیه
# به پرتال آزور > سهمیه‌ها > درخواست افزایش بروید
```
</details>

<details>
<summary><strong>آیا می‌توانم از داده‌های خودم با Microsoft Foundry Models استفاده کنم؟</strong></summary>

بله! از **Azure AI Search** برای RAG (تولید تقویت شده بازیابی شده) استفاده کنید:

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
<summary><strong>چگونه نقاط پایان مدل هوش مصنوعی را امن کنم؟</strong></summary>

**بهترین شیوه‌ها**:
1. استفاده از Managed Identity (بدون کلیدهای API)
2. فعال کردن Private Endpoints
3. پیکربندی گروه‌های امنیتی شبکه
4. اعمال محدودیت نرخ
5. استفاده از Azure Key Vault برای اسرار

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

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [مستندات رسمی](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [مهارت Microsoft Foundry در skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - نصب مهارت‌های عامل Azure + Foundry در ویرایشگر خود با `npx skills add microsoft/github-copilot-for-azure`

---

**ناوبری فصل:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل ۲ - توسعه هوش مصنوعی محور
- **⬅️ فصل قبلی**: [فصل ۱: اولین پروژه شما](../chapter-01-foundation/first-project.md)
- **➡️ بعدی**: [استقرار مدل هوش مصنوعی](ai-model-deployment.md)
- **🚀 فصل بعدی**: [فصل ۳: پیکربندی](../chapter-03-configuration/configuration.md)

**نیاز به کمک دارید؟** در بحث‌های جامعه ما شرکت کنید یا یک مسئله در مخزن باز کنید. انجمن Azure AI + AZD اینجا است تا به موفقیت شما کمک کند!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->