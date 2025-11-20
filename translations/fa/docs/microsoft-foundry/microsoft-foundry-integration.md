<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2e61bc7db9c28647211ab64e03045882",
  "translation_date": "2025-11-20T02:52:32+00:00",
  "source_file": "docs/microsoft-foundry/microsoft-foundry-integration.md",
  "language_code": "fa"
}
-->
# ادغام Microsoft Foundry با AZD

**فهرست فصل‌ها:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل فعلی**: فصل ۲ - توسعه مبتنی بر هوش مصنوعی
- **⬅️ فصل قبلی**: [فصل ۱: اولین پروژه شما](../getting-started/first-project.md)
- **➡️ بعدی**: [استقرار مدل هوش مصنوعی](ai-model-deployment.md)
- **🚀 فصل بعدی**: [فصل ۳: پیکربندی](../getting-started/configuration.md)

## مقدمه

این راهنما نحوه ادغام خدمات Microsoft Foundry با Azure Developer CLI (AZD) را برای استقرار ساده‌تر برنامه‌های هوش مصنوعی نشان می‌دهد. Microsoft Foundry یک پلتفرم جامع برای ساخت، استقرار و مدیریت برنامه‌های هوش مصنوعی ارائه می‌دهد، در حالی که AZD فرآیند زیرساخت و استقرار را ساده می‌کند.

## Microsoft Foundry چیست؟

Microsoft Foundry پلتفرم یکپارچه مایکروسافت برای توسعه هوش مصنوعی است که شامل موارد زیر می‌شود:

- **کاتالوگ مدل**: دسترسی به مدل‌های پیشرفته هوش مصنوعی
- **Prompt Flow**: طراح بصری برای جریان‌های کاری هوش مصنوعی
- **پورتال AI Foundry**: محیط توسعه یکپارچه برای برنامه‌های هوش مصنوعی
- **گزینه‌های استقرار**: گزینه‌های مختلف میزبانی و مقیاس‌پذیری
- **ایمنی و امنیت**: ویژگی‌های مسئولیت‌پذیری هوش مصنوعی داخلی

## AZD + Microsoft Foundry: بهتر با هم

| ویژگی | Microsoft Foundry | مزیت ادغام با AZD |
|-------|-------------------|-------------------|
| **استقرار مدل** | استقرار دستی از طریق پورتال | استقرار خودکار و قابل تکرار |
| **زیرساخت** | تهیه زیرساخت با کلیک | زیرساخت به عنوان کد (Bicep) |
| **مدیریت محیط** | تمرکز بر یک محیط | چند محیطی (توسعه/آزمایشی/تولید) |
| **ادغام CI/CD** | محدود | پشتیبانی بومی از GitHub Actions |
| **مدیریت هزینه** | نظارت پایه | بهینه‌سازی هزینه بر اساس محیط |

## پیش‌نیازها

- اشتراک Azure با مجوزهای مناسب
- نصب Azure Developer CLI
- دسترسی به خدمات Azure OpenAI
- آشنایی اولیه با Microsoft Foundry

## الگوهای اصلی ادغام

### الگو ۱: ادغام Azure OpenAI

**مورد استفاده**: استقرار برنامه‌های چت با مدل‌های Azure OpenAI

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

**مورد استفاده**: استقرار برنامه‌های تولید افزوده با بازیابی (RAG)

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

**پیکربندی تولید:**
```bash
# خدمات اصلی هوش مصنوعی
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# تنظیمات مدل
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# تنظیمات عملکرد
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**پیکربندی توسعه:**
```bash
# تنظیمات بهینه‌سازی هزینه برای توسعه
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # سطح رایگان
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
# همه چیز را با یک فرمان مستقر کنید
azd up

# یا به صورت تدریجی مستقر کنید
azd provision  # فقط زیرساخت
azd deploy     # فقط برنامه
```

### استقرار بر اساس محیط

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

### پیکربندی هویت مدیریت‌شده

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
- خطاهای 429 در لاگ‌های برنامه

**راه‌حل‌ها:**
```bash
# بررسی استفاده فعلی از سهمیه
az cognitiveservices usage list --location eastus

# امتحان کردن منطقه دیگر
azd env set AZURE_LOCATION westus2
azd up

# کاهش ظرفیت به طور موقت
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### مشکل ۲: شکست در احراز هویت

**علائم:**
- خطاهای 401/403 هنگام فراخوانی خدمات هوش مصنوعی
- پیام‌های "دسترسی ممنوع"

**راه‌حل‌ها:**
```bash
# بررسی تخصیص نقش‌ها
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# پیکربندی هویت مدیریت شده را بررسی کنید
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# دسترسی به Key Vault را تأیید کنید
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### مشکل ۳: مشکلات استقرار مدل

**علائم:**
- مدل‌ها در استقرار در دسترس نیستند
- نسخه‌های خاص مدل شکست می‌خورند

**راه‌حل‌ها:**
```bash
# لیست مدل‌های موجود بر اساس منطقه
az cognitiveservices model list --location eastus

# به‌روزرسانی نسخه مدل در قالب بایسپ
# بررسی نیازمندی‌های ظرفیت مدل
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

1. **نمونه‌ها را امتحان کنید**: با یک قالب آماده که با مورد استفاده شما مطابقت دارد شروع کنید
2. **برای نیازهای خود سفارشی کنید**: زیرساخت و کد برنامه را تغییر دهید
3. **نظارت اضافه کنید**: مشاهده‌پذیری جامع را پیاده‌سازی کنید
4. **هزینه‌ها را بهینه کنید**: تنظیمات را برای بودجه خود بهینه کنید
5. **استقرار خود را ایمن کنید**: الگوهای امنیتی سازمانی را پیاده‌سازی کنید
6. **به تولید مقیاس دهید**: ویژگی‌های چند منطقه‌ای و دسترسی بالا اضافه کنید

## 🎯 تمرین‌های عملی

### تمرین ۱: استقرار برنامه چت Azure OpenAI (۳۰ دقیقه)
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

# عملیات هوش مصنوعی را نظارت کنید
azd monitor

# پاکسازی کنید
azd down --force --purge
```

**معیارهای موفقیت:**
- [ ] استقرار بدون خطاهای سهمیه کامل می‌شود
- [ ] امکان دسترسی به رابط چت در مرورگر وجود دارد
- [ ] امکان پرسیدن سوالات و دریافت پاسخ‌های هوش مصنوعی وجود دارد
- [ ] Application Insights داده‌های تله‌متری را نشان می‌دهد
- [ ] منابع با موفقیت پاکسازی شده‌اند

**هزینه تخمینی**: ۵-۱۰ دلار برای ۳۰ دقیقه آزمایش

### تمرین ۲: پیکربندی استقرار چند مدل (۴۵ دقیقه)
**هدف**: استقرار چندین مدل هوش مصنوعی با تنظیمات مختلف

```bash
# ایجاد پیکربندی سفارشی Bicep
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// GPT-4o-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4o-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
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
- [ ] چندین مدل با موفقیت مستقر شده‌اند
- [ ] تنظیمات ظرفیت مختلف اعمال شده‌اند
- [ ] مدل‌ها از طریق API قابل دسترسی هستند
- [ ] امکان فراخوانی هر دو مدل از برنامه وجود دارد

### تمرین ۳: پیاده‌سازی نظارت بر هزینه‌ها (۲۰ دقیقه)
**هدف**: تنظیم هشدارهای بودجه و ردیابی هزینه‌ها

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
- [ ] اعلان‌های ایمیل پیکربندی شده‌اند
- [ ] امکان مشاهده داده‌های هزینه در پورتال Azure وجود دارد
- [ ] آستانه‌های بودجه به‌درستی تنظیم شده‌اند

## 💡 سوالات متداول

<details>
<summary><strong>چگونه می‌توانم هزینه‌های Azure OpenAI را در طول توسعه کاهش دهم؟</strong></summary>

1. **استفاده از سطح رایگان**: Azure OpenAI ماهانه ۵۰,۰۰۰ توکن رایگان ارائه می‌دهد
2. **کاهش ظرفیت**: ظرفیت را به ۱۰ TPM به جای ۳۰+ برای توسعه تنظیم کنید
3. **استفاده از azd down**: منابع را زمانی که فعالانه توسعه نمی‌دهید آزاد کنید
4. **کش کردن پاسخ‌ها**: برای پرسش‌های تکراری از کش Redis استفاده کنید
5. **مهندسی پرامپت**: با پرامپت‌های کارآمد مصرف توکن را کاهش دهید

```bash
# پیکربندی توسعه
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>تفاوت بین Azure OpenAI و OpenAI API چیست؟</strong></summary>

**Azure OpenAI**:
- امنیت و انطباق سازمانی
- ادغام شبکه خصوصی
- تضمین‌های SLA
- احراز هویت با هویت مدیریت‌شده
- سهمیه‌های بالاتر در دسترس

**OpenAI API**:
- دسترسی سریع‌تر به مدل‌های جدید
- تنظیمات ساده‌تر
- مانع ورود پایین‌تر
- فقط اینترنت عمومی

برای برنامه‌های تولیدی، **Azure OpenAI توصیه می‌شود**.
</details>

<details>
<summary><strong>چگونه می‌توانم خطاهای تجاوز از سهمیه Azure OpenAI را مدیریت کنم؟</strong></summary>

```bash
# بررسی سهمیه فعلی
az cognitiveservices usage list --location eastus2

# امتحان کردن منطقه متفاوت
azd env set AZURE_LOCATION westus2
azd up

# کاهش ظرفیت به طور موقت
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# درخواست افزایش سهمیه
# رفتن به پورتال Azure > سهمیه‌ها > درخواست افزایش
```
</details>

<details>
<summary><strong>آیا می‌توانم از داده‌های خود با Azure OpenAI استفاده کنم؟</strong></summary>

بله! از **Azure AI Search** برای RAG (تولید افزوده با بازیابی) استفاده کنید:

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
<summary><strong>چگونه می‌توانم نقاط پایانی مدل هوش مصنوعی را ایمن کنم؟</strong></summary>

**بهترین شیوه‌ها**:
1. از هویت مدیریت‌شده استفاده کنید (بدون کلید API)
2. نقاط پایانی خصوصی را فعال کنید
3. گروه‌های امنیتی شبکه را پیکربندی کنید
4. محدودیت نرخ را پیاده‌سازی کنید
5. از Azure Key Vault برای اسرار استفاده کنید

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

- **Microsoft Foundry Discord**: [کانال #Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [مشکلات و بحث‌ها](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [مستندات رسمی](https://learn.microsoft.com/azure/ai-studio/)

---

**فهرست فصل‌ها:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل فعلی**: فصل ۲ - توسعه مبتنی بر هوش مصنوعی
- **⬅️ فصل قبلی**: [فصل ۱: اولین پروژه شما](../getting-started/first-project.md)
- **➡️ بعدی**: [استقرار مدل هوش مصنوعی](ai-model-deployment.md)
- **🚀 فصل بعدی**: [فصل ۳: پیکربندی](../getting-started/configuration.md)

**نیاز به کمک دارید؟** به بحث‌های جامعه بپیوندید یا یک مشکل در مخزن باز کنید. جامعه Azure AI + AZD اینجاست تا به موفقیت شما کمک کند!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما تلاش می‌کنیم دقت را حفظ کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌ها باشند. سند اصلی به زبان اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما مسئولیتی در قبال سوء تفاهم‌ها یا تفسیرهای نادرست ناشی از استفاده از این ترجمه نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->