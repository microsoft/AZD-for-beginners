# Microsoft Foundry Integration with AZD

**ناوبری فصل:**
- **📚 صفحه دوره**: [AZD For Beginners](../../README.md)
- **📖 فصل جاری**: فصل 2 - توسعه محور هوش مصنوعی
- **⬅️ فصل قبلی**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ بعدی**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 فصل بعدی**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## مرور کلی

این راهنما نشان می‌دهد چگونه خدمات Microsoft Foundry را با Azure Developer CLI (AZD) برای استقرارهای ساده‌تر برنامه‌های هوش مصنوعی یکپارچه کنید. Microsoft Foundry بستری جامع برای ساخت، استقرار و مدیریت برنامه‌های هوش مصنوعی فراهم می‌کند، در حالی که AZD فرایند زیرساخت و استقرار را ساده می‌کند.

## Microsoft Foundry چیست؟

Microsoft Foundry پلتفرم یکپارچه مایکروسافت برای توسعه هوش مصنوعی است که شامل موارد زیر می‌شود:

- **کاتالوگ مدل**: دسترسی به مدل‌های پیشرفته هوش مصنوعی
- **Prompt Flow**: طراح تصویری برای گردش‌کارهای هوش مصنوعی
- **Microsoft Foundry Portal**: محیط توسعه یکپارچه برای برنامه‌های هوش مصنوعی
- **گزینه‌های استقرار**: گزینه‌های مختلف میزبانی و مقیاس‌پذیری
- **ایمنی و امنیت**: ویژگی‌های مسئولانه هوش مصنوعی ساخته‌شده

## AZD + Microsoft Foundry: بهتر با هم

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | استقرار دستی از طریق پورتال | استقرارهای خودکار و قابل تکرار |
| **Infrastructure** | تهیه منابع با کلیک | زیرساخت به عنوان کد (Bicep) |
| **Environment Management** | تمرکز روی یک محیط تکی | چند-محیطی (dev/staging/prod) |
| **CI/CD Integration** | محدود | پشتیبانی بومی از GitHub Actions |
| **Cost Management** | پایش پایه | بهینه‌سازی هزینه مخصوص هر محیط |

## پیش‌نیازها

- اشتراک Azure با دسترسی‌های مناسب
- نصب شده بودن Azure Developer CLI
- دسترسی به خدمات Microsoft Foundry Models
- آشنایی پایه با Microsoft Foundry

## الگوهای اصلی یکپارچه‌سازی

### الگو 1: یکپارچه‌سازی Microsoft Foundry Models

**مورد استفاده**: استقرار برنامه‌های چت با مدل‌های Microsoft Foundry Models

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

### الگو 2: جستجوی هوش مصنوعی + یکپارچه‌سازی RAG

**مورد استفاده**: استقرار برنامه‌های تولید تقویت‌شده با بازیابی (RAG)

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

### الگو 3: یکپارچه‌سازی Document Intelligence

**مورد استفاده**: گردش‌کارهای پردازش و تحلیل اسناد

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

**پیکربندی Production:**
```bash
# سرویس‌های اصلی هوش مصنوعی
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# پیکربندی‌های مدل
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# تنظیمات عملکرد
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**پیکربندی Development:**
```bash
# تنظیمات بهینه‌شده از نظر هزینه برای توسعه
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # لایه رایگان
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

AZD افزونه‌هایی ارائه می‌دهد که قابلیت‌های مخصوص هوش مصنوعی برای کار با خدمات Microsoft Foundry اضافه می‌کنند:

```bash
# افزونهٔ Foundry agents را نصب کنید
azd extension install azure.ai.agents

# افزونهٔ تنظیم دقیق را نصب کنید
azd extension install azure.ai.finetune

# افزونهٔ مدل‌های سفارشی را نصب کنید
azd extension install azure.ai.models

# افزونه‌های نصب‌شده را فهرست کنید
azd extension list
```

### استقرار با رویکرد Agent-First با `azd ai`

اگر یک manifest عامل دارید، از `azd ai agent init` برای اسکافولد کردن یک پروژه متصل به Foundry Agent Service استفاده کنید:

```bash
# مقداردهی اولیه از یک مانیفست عامل
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# استقرار در Azure
azd up
```

برای مرجع کامل دستورات و فلگ‌ها به [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) مراجعه کنید.

### استقرار با یک فرمان واحد

```bash
# همه‌چیز را با یک فرمان مستقر کنید
azd up

# یا به‌صورت مرحله‌ای مستقر کنید
azd provision  # فقط زیرساخت‌ها
azd deploy     # فقط برنامه
```

### استقرارهای مخصوص هر محیط

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

### ادغام با Application Insights

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

### پایش هزینه

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

### پیکربندی خودکار-مقیاس‌دهی

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

## عیب‌یابی مشکلات رایج

### مسئله 1: تجاوز از سهمیه OpenAI

**نشانه‌ها:**
- استقرار با خطاهای سهمیه شکست می‌خورد
- خطاهای 429 در لاگ‌های برنامه

**راه‌حل‌ها:**
```bash
# مصرف فعلی سهمیه را بررسی کنید
az cognitiveservices usage list --location eastus

# منطقه دیگری را امتحان کنید
azd env set AZURE_LOCATION westus2
azd up

# ظرفیت را به طور موقت کاهش دهید
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### مسئله 2: مشکل احراز هویت

**نشانه‌ها:**
- خطاهای 401/403 هنگام فراخوانی سرویس‌های هوش مصنوعی
- پیام‌های "Access denied"

**راه‌حل‌ها:**
```bash
# بررسی انتساب نقش‌ها
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# بررسی پیکربندی هویت مدیریت‌شده
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# اعتبارسنجی دسترسی به مخزن کلید
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### مسئله 3: مشکلات استقرار مدل

**نشانه‌ها:**
- مدل‌ها در استقرار در دسترس نیستند
- نسخه‌های خاص مدل شکست می‌خورند

**راه‌حل‌ها:**
```bash
# فهرست مدل‌های در دسترس بر اساس منطقه
az cognitiveservices model list --location eastus

# نسخهٔ مدل را در قالب bicep به‌روزرسانی کنید
# نیازمندی‌های ظرفیت مدل را بررسی کنید
```

## قالب‌های نمونه

### برنامه چت RAG (پایتون)

**مخزن**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**خدمات**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**توضیحات**: محبوب‌ترین نمونه Azure AI — یک برنامه چت RAG آماده‌ی تولید که به شما اجازه می‌دهد سوالات خود را درباره اسناد خود بپرسید. از GPT-4.1-mini برای چت، text-embedding-ada-002 برای امبدینگ‌ها، و Azure AI Search برای بازیابی استفاده می‌کند. از اسناد چندرسانه‌ای پشتیبانی می‌کند، ورودی/خروجی صدا، احراز هویت Microsoft Entra، و ردگیری Application Insights را داراست.

**شروع سریع**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### برنامه چت RAG (.NET)

**مخزن**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**خدمات**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**توضیحات**: معادل .NET/C# نمونه RAG پایتون. ساخته شده با ASP.NET Core Minimal API و فرانت‌اند Blazor WebAssembly. شامل چت صوتی، پشتیبانی از GPT-4o-mini vision، و یک کلاینت دسکتاپ/موبایل همراه .NET MAUI Blazor Hybrid است.

**شروع سریع**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### برنامه چت RAG (جاوا)

**مخزن**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**خدمات**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**توضیحات**: نسخه جاوا نمونه چت RAG که از Langchain4J برای ارکستراسیون هوش مصنوعی استفاده می‌کند. از معماری سرویس‌های خرد رویداد-محور، استراتژی‌های مختلف جستجو (متنی، برداری، هیبرید)، آپلود سند با Azure Document Intelligence، و استقرار روی Azure Container Apps یا Azure Kubernetes Service پشتیبانی می‌کند.

**شروع سریع**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Copilot خرده‌فروشی سازمانی با Azure AI Foundry

**مخزن**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**خدمات**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**توضیحات**: Copilot خرده‌فروشی انتها به انتها بر پایه RAG با استفاده از Azure AI Foundry و Prompty. یک چت‌بات فروشگاه Contoso Outdoor که پاسخ‌ها را بر اساس کاتالوگ محصولات و داده‌های سفارش مشتری پایه‌گذاری می‌کند. گردش‌کار کامل GenAIOps را نشان می‌دهد — نمونه‌سازی با Prompty، ارزیابی با ارزیاب‌های کمکی هوش مصنوعی، و استقرار از طریق AZD به Container Apps.

**شروع سریع**:
```bash
azd init --template contoso-chat
azd up
```

### برنامه چندعامله خلاقانه نوشتاری

**مخزن**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**خدمات**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**توضیحات**: نمونه چندعامله که ارکستراسیون عامل‌های هوش مصنوعی را با Prompty نشان می‌دهد. از یک عامل تحقیقاتی (Bing Grounding در Azure AI Agent Service)، یک عامل محصول (Azure AI Search)، یک نویسنده و یک ویراستار برای تولید مشارکتی مقالات پژوهش‌شده استفاده می‌کند. شامل CI/CD با ارزیابی در GitHub Actions است.

**شروع سریع**:
```bash
azd init --template contoso-creative-writer
azd up
```

### RAG Chat بی‌سرور (JavaScript/TypeScript)

**مخزن**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**خدمات**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB برای NoSQL + LangChain.js

**توضیحات**: چت‌بات RAG کاملاً بی‌سرور که از LangChain.js با Azure Functions برای API و Azure Static Web Apps برای میزبانی استفاده می‌کند. از Azure Cosmos DB هم به‌عنوان فروشگاه برداری و هم به‌عنوان پایگاه تاریخچه چت استفاده می‌کند. از توسعه محلی با Ollama برای تست بدون هزینه پشتیبانی می‌کند.

**شروع سریع**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### شتاب‌دهنده راه‌حل Chat with Your Data

**مخزن**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**خدمات**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**توضیحات**: شتاب‌دهنده راه‌حل RAG سازمانی با پرتال ادمین برای آپلود/مدیریت اسناد، گزینه‌های متعدد ارکستراتور (Semantic Kernel, LangChain, Prompt Flow)، تبدیل گفتار به متن، یکپارچه‌سازی با Microsoft Teams، و انتخاب PostgreSQL یا Cosmos DB به‌عنوان بک‌اند. به‌عنوان نقطه شروع قابل تنظیم برای سناریوهای تولید RAG طراحی شده است.

**شروع سریع**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### عوامل سفر هوش مصنوعی — ارکستراسیون چندعامله MCP

**مخزن**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**خدمات**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + سرورهای MCP (.NET, Python, Java, TypeScript)

**توضیحات**: برنامه مرجع برای ارکستراسیون چندعامله هوش مصنوعی که از سه فریم‌ورک (LangChain.js, LlamaIndex.TS, و Microsoft Agent Framework) استفاده می‌کند. شامل سرورهای MCP به چهار زبان است که به‌صورت Azure Container Apps بدون سرور مستقر شده‌اند و پایش OpenTelemetry را دارند.

**شروع سریع**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**مخزن**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**خدمات**: Azure AI Services + Azure OpenAI

**توضیحات**: قالب Bicep حداقلی که سرویس‌های Azure AI را با مدل‌های ماشین یادگیری پیکربندی‌شده مستقر می‌کند. نقطه شروع سبک وقتی که تنها نیاز دارید زیرساخت Azure AI پروویژن شود بدون اینکه کل پشته برنامه را داشته باشید.

**شروع سریع**:
```bash
azd init --template azd-ai-starter
azd up
```

> **مرور قالب‌های بیشتر**: به [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) برای بیش از 80 قالب مخصوص AI در AZD در زبان‌ها و سناریوهای مختلف مراجعه کنید.

## گام‌های بعدی

1. **نمونه‌ها را امتحان کنید**: با یک قالب از پیش‌ساخته که با مورد استفاده شما همخوانی دارد شروع کنید
2. **مطابق نیاز خود سفارشی کنید**: زیرساخت و کد برنامه را تغییر دهید
3. **پایش را اضافه کنید**: قابلیت مشاهده جامع را پیاده‌سازی کنید
4. **هزینه‌ها را بهینه کنید**: پیکربندی‌ها را برای بودجه خود تنظیم کنید
5. **استقرار خود را ایمن کنید**: الگوهای امنیت سازمانی را پیاده‌سازی کنید
6. **به تولید مقیاس کنید**: ویژگی‌های چندمنطقه‌ای و دسترس‌پذیری بالا را اضافه کنید

## 🎯 تمرین‌های عملی

### تمرین 1: استقرار اپ چت Microsoft Foundry Models (30 دقیقه)
**هدف**: استقرار و آزمایش یک برنامه چت هوش مصنوعی آماده تولید

```bash
# قالب را مقداردهی اولیه کنید
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# متغیرهای محیطی را تنظیم کنید
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# استقرار دهید
azd up

# برنامه را آزمایش کنید
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# بر عملیات هوش مصنوعی نظارت کنید
azd monitor

# پاک‌سازی کنید
azd down --force --purge
```

**معیارهای موفقیت:**
- [ ] استقرار بدون خطاهای سهمیه تکمیل می‌شود
- [ ] امکان دسترسی به رابط چت در مرورگر وجود دارد
- [ ] می‌توان سوال پرسید و پاسخ‌های مبتنی بر هوش مصنوعی دریافت کرد
- [ ] Application Insights داده‌های تله‌متری را نمایش می‌دهد
- [ ] منابع با موفقیت پاک‌سازی شدند

**هزینه تخمینی**: $5-10 برای 30 دقیقه تست

### تمرین 2: پیکربندی استقرار چندمدلی (45 دقیقه)
**هدف**: استقرار چندین مدل هوش مصنوعی با پیکربندی‌های مختلف

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

# استقرار و تأیید
azd provision
azd show
```

**معیارهای موفقیت:**
- [ ] چندین مدل با موفقیت مستقر شدند
- [ ] تنظیمات ظرفیت مختلف اعمال شده‌اند
- [ ] مدل‌ها از طریق API در دسترس هستند
- [ ] می‌توان هر دو مدل را از برنامه فراخوانی کرد

### تمرین 3: پیاده‌سازی پایش هزینه (20 دقیقه)
**هدف**: تنظیم هشدارهای بودجه و ردیابی هزینه

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

# بررسی هزینه‌های فعلی
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**معیارهای موفقیت:**
- [ ] هشدار بودجه در Azure ایجاد شده است
- [ ] اعلان‌های ایمیلی پیکربندی شده‌اند
- [ ] می‌توان داده‌های هزینه را در Azure Portal مشاهده کرد
- [ ] آستانه‌های بودجه به‌درستی تنظیم شده‌اند

## 💡 پرسش‌های متداول

<details>
<summary><strong>چگونه هزینه‌های Microsoft Foundry Models را در طول توسعه کاهش دهم؟</strong></summary>

1. **استفاده از لایه رایگان**: Microsoft Foundry Models ماهانه 50,000 توکن رایگان ارائه می‌دهد
2. **کاهش ظرفیت**: ظرفیت را برای توسعه روی 10 TPM به جای 30+ تنظیم کنید
3. **استفاده از azd down**: زمانی که فعالانه توسعه نمی‌دهید منابع را آزاد کنید
4. **کش کردن پاسخ‌ها**: برای پرسش‌های تکراری از کش Redis استفاده کنید
5. **استفاده از مهندسی پرامپت**: با پرامپت‌های کارآمد مصرف توکن را کاهش دهید

```bash
# پیکربندی توسعه
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>تفاوت بین Microsoft Foundry Models و OpenAI API چیست؟</strong></summary>

**Microsoft Foundry Models**:
- امنیت و انطباق سازمانی
- یکپارچه‌سازی با شبکه خصوصی
- تضمین‌های SLA
- احراز هویت با managed identity
- سهمیه‌های بالاتر در دسترس

**OpenAI API**:
- دسترسی سریع‌تر به مدل‌های جدید
- راه‌اندازی ساده‌تر
- مانع ورود کمتر
- تنها اینترنت عمومی

برای برنامه‌های تولیدی، **Microsoft Foundry Models توصیه می‌شود**.
</details>

<details>
<summary><strong>چگونه با خطاهای تجاوز از سهمیه مدل‌های Microsoft Foundry برخورد کنم؟</strong></summary>

```bash
# بررسی سهمیه فعلی
az cognitiveservices usage list --location eastus2

# استفاده از منطقه‌ای دیگر
azd env set AZURE_LOCATION westus2
azd up

# کاهش موقت ظرفیت
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# درخواست افزایش سهمیه
# به پورتال Azure بروید > سهمیه‌ها > درخواست افزایش
```
</details>

<details>
<summary><strong>آیا می‌توانم از داده‌های خودم با مدل‌های Microsoft Foundry استفاده کنم؟</strong></summary>

بله! از **Azure AI Search** برای RAG (تولید تقویت‌شده با بازیابی) استفاده کنید:

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
<summary><strong>چگونه نقاط پایانی مدل‌های هوش مصنوعی را ایمن کنم؟</strong></summary>

**بهترین روش‌ها**:
1. از Managed Identity استفاده کنید (بدون کلیدهای API)
2. نقاط انتهایی خصوصی را فعال کنید
3. گروه‌های امنیتی شبکه را پیکربندی کنید
4. محدودیت نرخ را پیاده‌سازی کنید
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

- **دیسکورد Microsoft Foundry**: [#کانال Azure](https://discord.gg/microsoft-azure)
- **GitHub AZD**: [مسائل و بحث‌ها](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [مستندات رسمی](https://learn.microsoft.com/azure/ai-studio/)
- **مهارت‌های Agent**: [مهارت Microsoft Foundry در skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - مهارت‌های Agent برای Azure و Foundry را در ویرایشگر خود با `npx skills add microsoft/github-copilot-for-azure` نصب کنید

---

**ناوبری فصل:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل 2 - توسعه‌محور هوش مصنوعی
- **⬅️ فصل قبلی**: [فصل 1: اولین پروژه شما](../chapter-01-foundation/first-project.md)
- **➡️ بعدی**: [استقرار مدل‌های هوش مصنوعی](ai-model-deployment.md)
- **🚀 فصل بعد**: [فصل 3: پیکربندی](../chapter-03-configuration/configuration.md)

**نیاز به کمک؟** به بحث‌های جامعه ما بپیوندید یا یک issue در مخزن باز کنید. جامعه Azure AI + AZD اینجا است تا به موفقیت شما کمک کند!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمهٔ هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است دارای خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مبدأ باید به‌عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس یا حیاتی، توصیه می‌شود از ترجمهٔ حرفه‌ای انسانی استفاده شود. ما در قبال هرگونه سوءتفاهم یا تفسیر نادرستی که از استفاده از این ترجمه ناشی شود، مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->