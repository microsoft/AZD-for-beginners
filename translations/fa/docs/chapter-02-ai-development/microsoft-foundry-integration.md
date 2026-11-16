# ادغام Microsoft Foundry با AZD

**هدایت فصل:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل ۲ - توسعه هوش مصنوعی محور
- **⬅️ فصل قبلی**: [فصل ۱: اولین پروژه شما](../chapter-01-foundation/first-project.md)
- **➡️ بعدی**: [عامل‌های هوش مصنوعی](agents.md)
- **🚀 فصل بعدی**: [فصل ۳: پیکربندی](../chapter-03-configuration/configuration.md)

## مرور کلی

این راهنما نحوه ادغام خدمات Microsoft Foundry با Azure Developer CLI (AZD) برای استقرارهای ساده‌تر برنامه‌های هوش مصنوعی را نشان می‌دهد. Microsoft Foundry یک پلتفرم جامع برای ساخت، استقرار و مدیریت برنامه‌های هوش مصنوعی ارائه می‌دهد، در حالی که AZD فرایند زیرساخت و استقرار را ساده می‌کند.

## Microsoft Foundry چیست؟

Microsoft Foundry پلتفرم یکپارچه مایکروسافت برای توسعه هوش مصنوعی است که شامل موارد زیر می‌باشد:

- **کاتالوگ مدل**: دسترسی به مدل‌های پیشرفته هوش مصنوعی
- **Prompt Flow**: طراحی بصری جریان‌های کاری هوش مصنوعی
- **پرتال Microsoft Foundry**: محیط توسعه یکپارچه برای برنامه‌های هوش مصنوعی
- **گزینه‌های استقرار**: گزینه‌های میزبانی و مقیاس‌پذیری متعدد
- **ایمنی و امنیت**: قابلیت‌های مسئولانه هوش مصنوعی تعبیه شده

## مزایای ترکیب AZD + Microsoft Foundry

| ویژگی | Microsoft Foundry | مزیت ادغام AZD |
|---------|-----------------|------------------------|
| **استقرار مدل** | استقرار دستی از طریق پرتال | استقرار خودکار و تکرارشونده |
| **زیرساخت** | تأمین منابع با کلیک | زیرساخت به عنوان کد (Bicep) |
| **مدیریت محیط** | تمرکز بر یک محیط | چند محیطی (توسعه/آزمایش/تولید) |
| **یکپارچه‌سازی CI/CD** | محدود | پشتیبانی بومی از GitHub Actions |
| **مدیریت هزینه‌ها** | پایش پایه | بهینه‌سازی هزینه‌های محیطی |

## پیش‌نیازها

- اشتراک Azure با مجوزهای مناسب
- نصب Azure Developer CLI
- دسترسی به خدمات مدل‌های Microsoft Foundry
- آشنایی پایه با Microsoft Foundry

> **بازبینی نسخه (۲۰۲۶-۱۱-۰۴):** راهنمای CLI هوش مصنوعی با مستندات/منابع `azd` `1.37.2`، عامل‌ها `1.0.0-beta.23` و ارزیابی‌ها `1.0.0-beta.2` تطبیق داده شده است. از `azd >= 1.37.0` برای جریان کاری ترکیبی استفاده کنید. تغییرات و اصلاحات [اینجا](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes) آمده است؛ این بازبینی تضمینی برای صحت هر قالب یا نمونه SDK در برابر استقرار زنده نیست.

## الگوهای اصلی ادغام

**دامنه مثال‌ها:** فایل بایسک زیر شامل قطعات منابع نمایشی است و قالب کامل و قابل استقرار نیست. قالب اصلی باید نام‌ها، `location`، منابع ارجاع شده، شناسه‌ها، خروجی‌ها و میزبانی برنامه را تعریف کند. برای شروع از نمونه‌ای لینک شده استفاده کنید. نمونه‌های Bash نیاز به احراز هویت Azure CLI جدا از `azd auth login` دارند.

### الگو ۱: ادغام مدل‌های Microsoft Foundry

**مورد استفاده:** استقرار برنامه‌های چت با مدل‌های Azure OpenAI در Microsoft Foundry

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
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
    disableLocalAuth: true
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
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30 // 30,000 TPM for this text-model deployment type
  }
}
```

فراخوان نیازمند شناسه مدیریت متصل و `Cognitive Services OpenAI User` در سطح حساب است؛ غیرفعال‌کردن کلیدها دسترسی نمی‌دهد. قبل از استقرار منطقه/مدل/SKU و سهمیه را بررسی کنید.

### الگو ۲: ادغام جستجوی هوش مصنوعی + RAG

**مورد استفاده:** استقرار برنامه‌های نسل افزوده بازیابی (RAG)

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

```

برای این ادغام منبع ARM `Microsoft.Search/searchServices/dataConnections` وجود ندارد. ایندکس جستجو، منبع داده، ایندکسر/مجموعه مهارت‌ها یا بردار کننده را از طریق APIهای سطح داده جستجو پیکربندی کنید. اگر جستجو مدل embedding را فراخوانی کند، شناسه مدیریت آن را فعال کنید، نقش مدل مربوطه را بدهید و مهارت embedding/بردارکننده را تنظیم کنید. مشاهده کنید [بردارسازی یکپارچه](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### الگو ۳: ادغام هوش مستندات

**مورد استفاده:** جریان‌های کاری پردازش و تحلیل اسناد

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

به جز تنظیمات مستند AZD مانند `AZURE_LOCATION`، این‌ها **نام‌های ورودی قالب سفارشی** هستند. مگر اینکه قالب/برنامه این‌ها را از طریق پارامتر و نگاشت محیط میزبان مصرف کند، تأثیری ندارند. برای `azure-search-openai-demo`، از نام‌های واقعی مثل `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` و `AZURE_SEARCH_SERVICE_SKU` استفاده کنید. ظرفیت مدل SKU حساب نیست.

**پیکربندی تولید:**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

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

استفاده از Entra ID با احراز هویت کلید محلی غیرفعال شده ترجیح داده می‌شود. موارد زیر صرفاً یک **جایگزین قدیمی احراز هویت کلید** برای برنامه‌هایی است که به کلید نیاز دارند: نیازمند حساب با احراز هویت کلید فعال، شناسه برنامه متصل به میزبان و دسترسی/شبکه Key Vault فعال است. کلید را با `disableLocalAuth: true` ترکیب نکنید و انتظار نداشته باشید تماس‌های مبتنی بر کلید کار کنند.

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    enableRbacAuthorization: false // This fragment deliberately uses access policies
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

AZD افزونه‌هایی ارائه می‌دهد که قابلیت‌های خاص هوش مصنوعی برای کار با خدمات Microsoft Foundry را اضافه می‌کنند:

```bash
# Install the Foundry agents extension
azd extension install azure.ai.agents

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# List installed extensions
azd extension list --installed

# Inspect the currently installed agent extension version
azd extension show azure.ai.agents
```

افزونه‌های هوش مصنوعی هنوز در نسخه پیش‌نمایش با سرعت در حال تغییر هستند. اگر دستوری غیر از آنچه اینجا نشان داده شده رفتار کرد، قبل از عیب‌یابی پروژه، افزونه مربوطه را به‌روزرسانی کنید.

### استقرار مبتنی بر عامل با `azd ai`

به صورت تعاملی از `azd ai agent init` استفاده کنید یا قالب پروژه عامل فعلی `azure.yaml` را که به Foundry Agent Service متصل است، بپذیرید:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` جایگزین املا منسوخ شده `--manifest`/`-m` شده است؛ مانیفست قدیمی و پیکربندی تو در تو هنوز نیاز به مهاجرت دارد. عامل‌ها را با `azd ai eval` از `azure.ai.evaluations` ارزیابی کنید، نه جریان کاری قدیمی حذف شده. مشاهده کنید [مهاجرت ارزیابی](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) برای تنظیم، اجرا و نتایج.

برای مرجع کامل دستورات و پارامترها به [دستورات AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) مراجعه کنید.

### استقرار تک دستوری

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### استقرارهای خاص محیطی

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

## پایش و مشاهده‌پذیری

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
```

این یک منبع Insights فراهم می‌کند، نه ابزار اندازه‌گیری تلماتری. وقتی برنامه شما لایه‌های فراخوان مدل خروجی می‌دهد، این پرسش نمایشی را در لاگ‌های Application Insights اجرا کنید (فیلتر را برای نام‌های واقعی لایه‌ها تطبیق دهید):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### پایش هزینه‌ها

```bicep
// Supply the first day of the current UTC month, e.g. 2026-11-01T00:00:00Z.
param budgetStartDate string

// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
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

دریافت‌کننده واقعی را وارد کنید و مجوزهای دامنه صورتحساب را تایید کنید. بودجه هشدار ارسال می‌کند؛ محدودیت هزینه نیست.

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

این قطعه نقطه انتهایی نیز به ناحیه/گروه DNS خصوصی، پیوندهای VNet، اتصال برنامه به VNet و سیاست دسترسی عمومی صریح نیاز دارد. فقط ایجاد نقطه انتهایی خصوصی دسترسی عمومی را غیرفعال نمی‌کند.

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
      REDIS_CONNECTION_STRING: ${REDIS_CONNECTION_STRING}
      CACHE_TTL: "3600"
```

```bicep
// Existing Azure Cache for Redis example; use Azure Managed Redis for new designs.
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

Azure Cache for Redis Basic/Standard/Premium در حال [بازنشستگی](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq) است؛ برای استقرارهای جدید از Azure Managed Redis استفاده کنید و دستورالعمل‌های فعلی قالب/احراز هویت آن را دنبال کنید. پاسخ‌های کش شده هوش مصنوعی را بر اساس مجوز، مدل/دستورالعمل‌ها، و نسخه داده با تاریخ انقضا محدود کنید؛ پاسخ‌های خصوصی را هرگز فقط با متن پرسش به اشتراک نگذارید.

### پیکربندی مقیاس خودکار

**منبع جزئی:** این تنظیمات مقیاس و ورودی را در یک اپلیکیشن کانتینری کامل با محیط مدیریت شده، تصویر کانتینر و محدودیت‌های منابع ادغام کنید. تعداد بیشتر کپی‌ها سهمیه مدل را افزایش نمی‌دهد.

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

## رفع اشکال مسائل رایج

### مشکل ۱: تجاوز از سهمیه OpenAI

**نشانه‌ها:**
- استقرار با خطاهای سهمیه شکست می‌خورد
- خطاهای 429 در لاگ برنامه

**راه‌حل‌ها:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try a different region in a NEW disposable environment, not by moving resources
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the ORIGINAL environment before reducing its capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision
```

متغیر ظرفیت بالا فقط برای قالب سفارشی که آن را مصرف می‌کند صدق می‌کند. برای نمونه RAG از `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` استفاده کنید. `AZURE_LOCATION` را تغییر ندهید تا منابع موجود را جا به جا کنید؛ برای منطقه جدید محیط جداگانه ساخته و مهاجرت/پاکسازی را برنامه‌ریزی کنید.

### مشکل ۲: شکست‌های احراز هویت

**نشانه‌ها:**
- خطاهای 401/403 هنگام فراخوانی خدمات هوش مصنوعی
- پیام‌های "دسترسی رد شد"

**راه‌حل‌ها:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### مشکل ۳: مشکلات استقرار مدل

**نشانه‌ها:**
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

این‌ها گزینه‌های جایگزین هستند، نه دستورات متوالی. هر کدام را در یک پوشه خالی مجزا شروع کنید. مقصد صریح `.` مقداردهی اولیه را در پوشه فعلی شما نگه می‌دارد؛ در غیر این صورت AZD فعلی می‌تواند پوشه‌ای به نام قالب بسازد بدون تغییر پوشه فعلی شل.

### برنامه چت RAG (پایتون)

**مخزن**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**خدمات**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**توضیح**: برنامه مرجع چت RAG برای سوالات روی اسناد شما، با بازیابی Azure AI Search. مدل‌های پشتیبانی شده، ویژگی‌های اختیاری، راهنمای هزینه و سخت‌سازی تولید را مرور کنید؛ استقرار نمونه برنامه را آماده تولید نمی‌کند.

**شروع سریع**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### برنامه چت RAG (.NET)

**مخزن**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**خدمات**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**توضیح**: معادل پایتون برنامه چت RAG به زبان .NET/C#. ساخته شده با ASP.NET Core Minimal API و Blazor WebAssembly. شامل چت صوتی، پشتیبانی بینایی GPT-4o-mini و کلاینت دسکتاپ/موبایل Blazor Hybrid .NET MAUI همراه.

**شروع سریع**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### برنامه چت RAG (جاوا)

**مخزن**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**خدمات**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**توضیح**: نسخه جاوای نمونه چت RAG با Langchain4J برای ارکستراسیون هوش مصنوعی. پشتیبانی از معماری رویدادمحور میکروسرویس، استراتژی‌های جستجوی متعدد (متن، برداری، ترکیبی)، بارگذاری سند با Azure Document Intelligence و استقرار روی Azure Container Apps یا Azure Kubernetes Service.

**شروع سریع**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### دستیار خرده‌فروشی سازمانی با Microsoft Foundry

**مخزن**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**خدمات**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**توضیح**: دستیار خرده‌فروشی RAG کامل با Microsoft Foundry و Prompty. ربات چت فروشگاه بیرونی Contoso که پاسخ‌ها را بر اساس کاتالوگ محصولات و داده‌های سفارش مشتری پایه‌ریزی می‌کند. جریان کامل GenAIOps را نشان می‌دهد — نمونه اولیه با Prompty، ارزیابی با ارزیابان هوش مصنوعی و استقرار از طریق AZD به Container Apps.

**شروع سریع**:
```bash
azd init --template contoso-chat .
azd up
```

### برنامه چندعامله نویسندگی خلاقانه

**مخزن**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**خدمات**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**توضیح**: نمونه چندعامله که ارکستراسیون عامل هوش مصنوعی با Prompty را نشان می‌دهد. از یک عامل تحقیقاتی (Bing Grounding در Azure AI Agent Service)، یک عامل محصول (Azure AI Search)، یک عامل نویسنده و یک عامل ویراستار برای تولید مقالات تحقیق‌شده به صورت تعاملی استفاده می‌کند. شامل CI/CD با ارزیابی در GitHub Actions.

**شروع سریع**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### چت سرورلس RAG (جاوااسکریپت/تایپ‌اسکریپت)

**مخزن**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**خدمات**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB برای NoSQL + LangChain.js

**توضیح**: چت‌بات سرورلس کامل RAG با LangChain.js و Azure Functions برای API و Azure Static Web Apps برای میزبانی. از Azure Cosmos DB به‌عنوان فروشگاه بردار و پایگاه داده تاریخچه چت استفاده می‌کند. توسعه محلی با Ollama برای تست بدون هزینه پشتیبانی می‌شود.

**شروع سریع**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### شتاب‌دهنده راه‌حل چت با داده‌های شما

**مخزن**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**خدمات**: Microsoft Foundry + Azure Container Apps (وب/API/بارگذاری) + Azure AI Search با Cosmos DB، یا PostgreSQL با pgvector

**توضیح**: شتاب‌دهنده چت مبتنی بر مستندات با ارجاع‌ها. نمونه جاری فرانت‌اند React، بک‌اند FastAPI و کارگر بارگذاری Functions را روی Container Apps میزبانی می‌کند؛ گزینه‌های ارکستراسیون Agent Framework و LangGraph هستند. گزینه‌های پایگاه داده/بازیابی هنگام استقرار انتخاب می‌شوند. نقطه شروع است، نه سیستم کامل تولید؛ فرض نکنید که نسخه‌های قدیمی App Service، Semantic Kernel یا Prompt Flow پیش‌فرض فعلی را توصیف می‌کنند.

**شروع سریع**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### عوامل سفر هوش مصنوعی — ارکستراسیون چندعامله MCP

**مخزن**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**خدمات**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + سرورهای MCP (.NET, Python, Java, TypeScript)

**توضیحات**: برنامه مرجع برای ارکستراسیون هوش مصنوعی چندعامل با استفاده از سه فریم‌ورک (LangChain.js, LlamaIndex.TS, و Microsoft Agent Framework). شامل سرورهای MCP (پروتکل زمینه مدل) در چهار زبان که به صورت برنامه‌های سروریس Azure Container Apps بدون سرور با نظارت OpenTelemetry مستقر شده‌اند.

**شروع سریع**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **بازدید از قالب‌های بیشتر**: برای قالب‌های موجود در زبان‌ها و سناریوهای مختلف به [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) مراجعه کنید. هر نمونه لینک شده یک مخزن خارجی است، نه یک نمونه محلی ارائه شده توسط این دوره؛ پیش‌نیازها و راهنمای تولید فعلی آن را قبل از استقرار بررسی کنید.

## مراحل بعدی

1. **آزمایش نمونه‌ها**: با یک قالب آماده که متناسب با مورد استفاده شماست شروع کنید
2. **سفارشی‌سازی براساس نیازها**: کد زیرساخت و برنامه را تغییر دهید
3. **افزودن نظارت**: قابلیت مشاهده جامع را پیاده‌سازی کنید
4. **بهینه‌سازی هزینه‌ها**: تنظیمات را برای بودجه خود تنظیم کنید
5. **ایمن‌سازی استقرار**: الگوهای امنیت سازمانی را اجرایی کنید
6. **مقیاس به تولید**: ویژگی‌های چندمنطقه‌ای و قابلیت بالابودن دسترسی را اضافه کنید

## 🎯 تمرین‌های عملی

### تمرین 1: استقرار برنامه چت مدل‌های Microsoft Foundry (۳۰ دقیقه)
**هدف**: استقرار و آزمایش برنامه مرجع چت هوش مصنوعی

```bash
# Initialize template
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo .

# Set environment variables
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 30

# Deploy
azd up

# Test the application
azd show
# Open the web endpoint shown; do not assume a service name/JSON shape.

# Monitor AI operations
azd monitor

# Clean up
azd down --force --purge
```

**معیارهای موفقیت:**
- [ ] استقرار بدون خطاهای سهمیه‌ای کامل شود
- [ ] دسترسی به رابط چت در مرورگر ممکن باشد
- [ ] بتوان سوال پرسید و پاسخ‌های هوش مصنوعی دریافت کرد
- [ ] داده‌های تله‌متری در Application Insights نمایان باشد
- [ ] منابع با موفقیت پاکسازی شوند

**هزینه:** راهنمای هزینه نمونه فعلی و SKU های انتخاب شده را پیش از استقرار مرور کنید. هزینه صورتحساب تا حذف منابع ادامه دارد؛ زمان ثابت ۳۰ دقیقه برای هر پیکربندی صدق نمی‌کند.

### تمرین ۲: پیکربندی استقرار چندمدلی (۴۵ دقیقه)
**هدف**: استقرار مدل‌های مختلف هوش مصنوعی با پیکربندی‌های متفاوت

**نقطه شروع:** یک حساب Azure OpenAI موجود و ماژول گروه منابع AZD که بتواند این فایل را فراخوانی کند. با ویرایشگر خود `infra/ai-models.bicep` را با محتوای زیر ایجاد کنید. فقط به دلیل قرارگیری در `infra/` به صورت خودکار مستقر نمی‌شود.

```bicep
param openAiAccountName string

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
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30
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
  }
  sku: {
    name: 'Standard'
    capacity: 50
  }
  dependsOn: [gpt4omini]
}
```

از ماژول صاحب دامنه گروه منابع حساب، یک فراخوانی ماژول اضافه کنید (نام نماد را با حساب واقعی خود تغییر دهید):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

همان استقرارها را در هر دو ماژول اعلام نکنید. اگر نقطه ورود AZD به اشتراک‌گذاری اشتراک تعلق دارد، این را از ماژول فرزند دارای دامنه گروه منابع آن فراخوانی کنید و مسیر نسبی را تنظیم کنید. آن ماژول حاوی را با `az bicep build --file <path-to-containing-module>` بسازید، سپس:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**معیارهای موفقیت:**
- [ ] مدل‌های متعدد با موفقیت مستقر شده‌اند
- [ ] تنظیمات ظرفیت مختلف اعمال شده‌اند
- [ ] مدل‌ها از طریق API در دسترس هستند
- [ ] می‌توان از هر دو مدل از برنامه فراخوانی کرد

### تمرین ۳: پیاده‌سازی نظارت هزینه (۲۰ دقیقه)
**هدف**: راه‌اندازی هشدارهای بودجه و ردیابی هزینه

**نقطه شروع:** الگوی بودجه فوق و یک ماژول زیرساخت دارای دامنه گروه منابع. این منبع را با ویرایشگر خود اضافه کنید؛ `budgetStartDate` را از نگاشت پارامتری خود منتقل کنید (اگر پارامتر قبلاً اعلام شده تکراری نکنید). گیرنده را جایگزین کرده و مطمئن شوید دسترسی نوشتن بودجه را دارید.

```bicep
param budgetStartDate string
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
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
```

```bash
# Deploy budget alert
azd provision

# Verify the budget at its resource-group scope
az rest --method get \
  --url "https://management.azure.com/subscriptions/YOUR_SUB/resourceGroups/YOUR_RG/providers/Microsoft.Consumption/budgets/ai-monthly-budget?api-version=2024-08-01"
```

مورد انتظار: پاسخ شامل `amount: 200`، هر دو آستانه، و گیرنده شما باشد. برای هزینه‌های واقعی، مدیریت هزینه را در پرتال بررسی کنید؛ داده‌های هزینه با تاخیر هستند و هشدار لازم نیست در یک تمرین کوتاه فعال شود.

**معیارهای موفقیت:**
- [ ] هشدار بودجه در Azure ایجاد شده است
- [ ] اعلان‌های ایمیل تنظیم شده‌اند
- [ ] می‌توان داده‌های هزینه را در پرتال Azure مشاهده کرد
- [ ] آستانه‌های بودجه به درستی تنظیم شده‌اند

## 💡 سوالات متداول

<details>
<summary><strong>چگونه هزینه مدل‌های Microsoft Foundry را در هنگام توسعه کاهش دهم؟</strong></summary>

1. **بررسی قیمت‌گذاری**: هیچ حد مجاز رایگان ۵۰,۰۰۰ توکنی ماهانه جهانی برای مدل‌های Azure OpenAI وجود ندارد
2. **ظرفیت را به اندازه مناسب انتخاب کنید**: ظرفیت `10` معمولاً نمایانگر ۱۰,۰۰۰ TPM برای این مدل‌های متنی استاندارد است، نه ۱۰ TPM. کاهش این نرخ محدودیت قیمت هر توکن را کاهش نمی‌دهد
3. **از azd down استفاده کنید**: هنگام عدم توسعه فعال، منابع قابل حذف را حذف کنید (این برابر با آزادسازی نیست)
4. **پاسخ‌ها را کش کنید**: کش Redis را برای پرسش‌های تکراری پیاده‌سازی کنید
5. **از مهندسی پرامپت استفاده کنید**: با پرامپت‌های کارآمد استفاده توکن را کاهش دهید

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>تفاوت مدل‌های Microsoft Foundry با API OpenAI چیست؟</strong></summary>

**مدل‌های Microsoft Foundry**:
- امنیت سازمانی و تطابق
- ادغام در شبکه خصوصی
- ضمانت‌های SLA
- احراز هویت هویت مدیریت شده
- سهمیه‌های بالاتر در دسترس

**OpenAI API**: ارائه‌دهنده/API مستقل با مدل‌های خود، قیمت‌گذاری، احراز هویت و گزینه‌های اتصال به سازمان. به جای فرض عمومی بودن یا ارسال زودهنگام مدل‌ها، پیشنهادات فعلی را مقایسه کنید.

انتخاب بر اساس نیازهای سازمان شما؛ نمونه‌های هویت مدیریت شده مخصوص Azure و لینک‌های خصوصی در این دوره برای خدمات میزبانی‌شده در Azure است، نه برای همه مدل‌ها/ارائه‌دهندگان در کاتالوگ Foundry.
</details>

<details>
<summary><strong>چگونه با خطاهای تجاوز سهمیه مدل‌های Microsoft Foundry برخورد کنم؟</strong></summary>

```bash
# Check current quota
az cognitiveservices usage list --location eastus2

# Try different region
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the original environment before reducing capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Request quota increase
# Go to Azure Portal > Quotas > Request increase
```
</details>

<details>
<summary><strong>آیا می‌توانم از داده‌های خودم با مدل‌های Microsoft Foundry استفاده کنم؟</strong></summary>

بله! از **Azure AI Search** برای RAG (تولید با کمک بازیابی) استفاده کنید:

```yaml
# azure.yaml
services:
  ai:
    project: ./api
    host: containerapp
    env:
      AZURE_SEARCH_ENDPOINT: ${AZURE_SEARCH_ENDPOINT}
      AZURE_SEARCH_INDEX: ${AZURE_SEARCH_INDEX}
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

به قالب [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) مراجعه کنید.
</details>

<details>
<summary><strong>چگونه نقطه پایانی مدل‌های هوش مصنوعی را ایمن کنم؟</strong></summary>

**بهترین شیوه‌ها**:
1. استفاده از Managed Identity (بدون کلید API)
2. فعال‌سازی Private Endpoints
3. پیکربندی گروه‌های امنیت شبکه
4. پیاده‌سازی محدودیت نرخ
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

- **Discord مایکروسافت فاندری**: [کانال #Azure](https://discord.gg/microsoft-azure)
- **GitHub AZD**: [Issues و بحث‌ها](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [مستندات رسمی](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [مهارت Microsoft Foundry در skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - نصب مهارت‌های Azure + Foundry agent در ویرایشگر خود با `npx skills add microsoft/github-copilot-for-azure`

---

**ناوبری فصل:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدی‌ها](../../README.md)
- **📖 فصل جاری**: فصل 2 - توسعه با اولویت هوش مصنوعی
- **⬅️ فصل قبل**: [فصل 1: اولین پروژه شما](../chapter-01-foundation/first-project.md)
- **➡️ بعدی**: [عوامل هوش مصنوعی](agents.md)
- **🚀 فصل بعدی**: [فصل 3: پیکربندی](../chapter-03-configuration/configuration.md)

**نیاز به کمک دارید؟** به بحث‌های جامعه ما بپیوندید یا یک موضوع در مخزن باز کنید. جامعه Azure AI + AZD اینجاست تا به موفقیت شما کمک کند!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->