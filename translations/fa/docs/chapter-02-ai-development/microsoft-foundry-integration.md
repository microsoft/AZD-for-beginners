# ادغام Microsoft Foundry با AZD

**ناوبری فصل:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: فصل ۲ - توسعه با اولویت هوش مصنوعی
- **⬅️ Previous Chapter**: [فصل ۱: اولین پروژه شما](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [استقرار مدل‌های هوش مصنوعی](ai-model-deployment.md)
- **🚀 Next Chapter**: [فصل ۳: پیکربندی](../chapter-03-configuration/configuration.md)

## مرور کلی

این راهنما نشان می‌دهد چگونه خدمات Microsoft Foundry را با Azure Developer CLI (AZD) برای استقرارهای ساده‌تر برنامه‌های هوش مصنوعی یکپارچه کنید. Microsoft Foundry پلتفرمی جامع برای ساخت، استقرار و مدیریت برنامه‌های هوش مصنوعی فراهم می‌کند، در حالی که AZD فرایند زیرساخت و استقرار را ساده می‌کند.

## Microsoft Foundry چیست؟

Microsoft Foundry پلتفرم یکپارچه مایکروسافت برای توسعه هوش مصنوعی است که شامل موارد زیر می‌شود:

- **Model Catalog**: دسترسی به مدل‌های پیشرفته هوش مصنوعی
- **Prompt Flow**: طراحی‌کننده بصری برای جریان‌های کاری هوش مصنوعی
- **AI Foundry Portal**: محیط توسعه یکپارچه برای برنامه‌های هوش مصنوعی
- **Deployment Options**: گزینه‌های میزبانی و مقیاس‌دهی متعدد
- **Safety and Security**: ویژگی‌های مسئولیت‌پذیر هوش مصنوعی به‌صورت داخلی

## AZD + Microsoft Foundry: بهتر با هم

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | استقرارهای خودکار و قابل تکرار |
| **Infrastructure** | Click-through provisioning | زیرساخت به‌عنوان کد (Bicep) |
| **Environment Management** | Single environment focus | محیط‌های چندگانه (dev/staging/prod) |
| **CI/CD Integration** | Limited | پشتیبانی بومی از GitHub Actions |
| **Cost Management** | Basic monitoring | بهینه‌سازی هزینه مخصوص هر محیط |

## پیش‌نیازها

- اشتراک Azure با مجوزهای مناسب
- نصب Azure Developer CLI
- دسترسی به خدمات Azure OpenAI
- آشنایی پایه با Microsoft Foundry

## الگوهای اصلی ادغام

### الگو ۱: ادغام Azure OpenAI

**مورد استفاده**: استقرار برنامه‌های گفت‌وگو با مدل‌های Azure OpenAI

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

### الگو ۲: ادغام AI Search + RAG

**مورد استفاده**: استقرار برنامه‌های تولید تکمیلی بازیابی‌شده (RAG)

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

### الگو ۳: ادغام Document Intelligence

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

# پیکربندی‌های مدل
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

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

## گردش‌های کاری استقرار

### استقرار با یک فرمان

```bash
# همه چیز را با یک دستور مستقر کنید
azd up

# یا به‌صورت تدریجی مستقر کنید
azd provision  # فقط زیرساخت
azd deploy     # فقط برنامه
```

### استقرارهای مخصوص محیط

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

## پایش و قابلیت مشاهده

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

## رفع اشکال مسائل رایج

### مشکل ۱: عبور از سهمیه OpenAI

**نشانه‌ها:**
- استقرار با خطاهای سهمیه شکست می‌خورد
- خطاهای 429 در لاگ‌های برنامه

**راه‌حل‌ها:**
```bash
# بررسی استفاده فعلی از سهمیه
az cognitiveservices usage list --location eastus

# استفاده از منطقه‌ای دیگر
azd env set AZURE_LOCATION westus2
azd up

# کاهش موقت ظرفیت
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### مشکل ۲: خطاهای احراز هویت

**نشانه‌ها:**
- خطاهای 401/403 هنگام فراخوانی سرویس‌های هوش مصنوعی
- پیام‌های «Access denied»

**راه‌حل‌ها:**
```bash
# تأیید تخصیص نقش‌ها
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# بررسی پیکربندی هویت مدیریت‌شده
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# اعتبارسنجی دسترسی به خزانهٔ کلید
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### مشکل ۳: مسائل استقرار مدل

**نشانه‌ها:**
- مدل‌ها در استقرار در دسترس نیستند
- نسخه‌های مشخصی از مدل‌ها خطا می‌دهند

**راه‌حل‌ها:**
```bash
# فهرست مدل‌های موجود بر اساس منطقه
az cognitiveservices model list --location eastus

# به‌روزرسانی نسخه مدل در قالب bicep
# بررسی نیازمندی‌های ظرفیت مدل
```

## قالب‌های نمونه

### برنامه گفت‌وگوی پایه

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**خدمات**: Azure OpenAI + Cognitive Search + App Service

**شروع سریع**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### خط لوله پردازش اسناد

**Repository**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**خدمات**: Document Intelligence + Storage + Functions

**شروع سریع**:
```bash
azd init --template ai-document-processing
azd up
```

### گفت‌وگوی سازمانی با RAG

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**خدمات**: Azure OpenAI + Search + Container Apps + Cosmos DB

**شروع سریع**:
```bash
azd init --template contoso-chat
azd up
```

## گام‌های بعدی

1. **نمونه‌ها را امتحان کنید**: با یک قالب آماده که با مورد استفاده شما مطابقت دارد شروع کنید
2. **برای نیازهای خود سفارشی کنید**: زیرساخت و کد برنامه را اصلاح کنید
3. **پایش را اضافه کنید**: قابلیت مشاهده جامع را پیاده‌سازی کنید
4. **هزینه‌ها را بهینه کنید**: پیکربندی‌ها را برای بودجه خود تنظیم کنید
5. **استقرار خود را امن کنید**: الگوهای امنیتی سازمانی را پیاده‌سازی کنید
6. **به تولید مقیاس دهید**: ویژگی‌های چندمنطقه‌ای و در دسترس‌پذیری بالا را اضافه کنید

## 🎯 تمرین‌های عملی

### تمرین ۱: استقرار برنامه گفت‌وگوی Azure OpenAI (۳۰ دقیقه)
**هدف**: استقرار و آزمایش یک برنامه گفت‌وگوی آماده برای تولید

```bash
# قالب را مقداردهی اولیه کنید
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# متغیرهای محیطی را تنظیم کنید
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# مستقر کنید
azd up

# برنامه را آزمایش کنید
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# بر عملیات هوش مصنوعی نظارت کنید
azd monitor

# پاکسازی کنید
azd down --force --purge
```

**معیارهای موفقیت:**
- [ ] استقرار بدون خطاهای سهمیه تکمیل می‌شود
- [ ] امکان دسترسی به رابط گفت‌وگو در مرورگر وجود دارد
- [ ] می‌توان سوال پرسید و پاسخ‌های تقویت‌شده توسط هوش مصنوعی دریافت کرد
- [ ] Application Insights داده‌های تله‌متری را نشان می‌دهد
- [ ] منابع با موفقیت پاک‌سازی شده‌اند

**هزینه تخمینی**: ۵–۱۰ دلار برای ۳۰ دقیقه آزمایش

### تمرین ۲: پیکربندی استقرار چندمدلی (۴۵ دقیقه)
**هدف**: استقرار چندین مدل هوش مصنوعی با پیکربندی‌های مختلف

```bash
# پیکربندی سفارشی Bicep را ایجاد کنید
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

# استقرار دهید و بررسی کنید
azd provision
azd show
```

**معیارهای موفقیت:**
- [ ] چندین مدل با موفقیت مستقر شده‌اند
- [ ] تنظیمات ظرفیت متفاوت اعمال شده‌اند
- [ ] مدل‌ها از طریق API در دسترس هستند
- [ ] می‌توان از هر دو مدل از طریق برنامه فراخوانی کرد

### تمرین ۳: پیاده‌سازی پایش هزینه (۲۰ دقیقه)
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

# بررسی هزینه‌های فعلی
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**معیارهای موفقیت:**
- [ ] هشدار بودجه در Azure ایجاد شده است
- [ ] اعلان‌های ایمیلی پیکربندی شده‌اند
- [ ] می‌توان داده‌های هزینه را در Azure Portal مشاهده کرد
- [ ] آستانه‌های بودجه به‌طور مناسبی تنظیم شده‌اند

## 💡 سوالات متداول

<details>
<summary><strong>چگونه هزینه‌های Azure OpenAI را در طول توسعه کاهش دهم؟</strong></summary>

1. **از لایه رایگان استفاده کنید**: Azure OpenAI تا 50,000 توکن در ماه به‌صورت رایگان ارائه می‌دهد
2. **ظرفیت را کاهش دهید**: برای توسعه ظرفیت را روی 10 TPM به‌جای 30+ تنظیم کنید
3. **از azd down استفاده کنید**: زمانی که فعالانه توسعه نمی‌دهید منابع را آزاد کنید
4. **پاسخ‌ها را کش کنید**: از Redis برای کش نتایج پرس‌وجوهای تکراری استفاده کنید
5. **از مهندسی پرامپت استفاده کنید**: با پرامپت‌های کارآمد استفاده از توکن را کاهش دهید

```bash
# پیکربندی توسعه
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>تفاوت Azure OpenAI و OpenAI API چیست؟</strong></summary>

**Azure OpenAI**:
- امنیت سازمانی و تطابق
- یکپارچه‌سازی شبکه خصوصی
- تضمین‌های SLA
- احراز هویت با Managed Identity
- سهمیه‌های بالاتر در دسترس

**OpenAI API**:
- دسترسی سریع‌تر به مدل‌های جدید
- راه‌اندازی ساده‌تر
- مانع ورود کمتر
- تنها اینترنت عمومی

برای برنامه‌های تولیدی، **Azure OpenAI توصیه می‌شود**.
</details>

<details>
<summary><strong>چگونه با خطاهای عبور از سهمیه Azure OpenAI برخورد کنم؟</strong></summary>

```bash
# سهمیه فعلی را بررسی کنید
az cognitiveservices usage list --location eastus2

# منطقهٔ دیگری را امتحان کنید
azd env set AZURE_LOCATION westus2
azd up

# ظرفیت را موقتاً کاهش دهید
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# درخواست افزایش سهمیه دهید
# به پورتال Azure بروید > سهمیه‌ها > درخواست افزایش
```
</details>

<details>
<summary><strong>آیا می‌توانم از داده‌های خودم با Azure OpenAI استفاده کنم؟</strong></summary>

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

See the [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) template.
</details>

<details>
<summary><strong>چگونه نقاط انتهایی مدل‌های هوش مصنوعی را امن کنم؟</strong></summary>

**بهترین شیوه‌ها**:
1. از Managed Identity استفاده کنید (بدون کلید API)
2. Private Endpoints را فعال کنید
3. گروه‌های امنیتی شبکه را پیکربندی کنید
4. محدودیت نرخ را پیاده‌سازی کنید
5. برای مخفی‌سازی اسرار از Azure Key Vault استفاده کنید

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
- **Microsoft Learn**: [Official documentation](https://learn.microsoft.com/azure/ai-studio/)

---

**ناوبری فصل:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: فصل ۲ - توسعه با اولویت هوش مصنوعی
- **⬅️ Previous Chapter**: [فصل ۱: اولین پروژه شما](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [استقرار مدل‌های هوش مصنوعی](ai-model-deployment.md)
- **🚀 Next Chapter**: [فصل ۳: پیکربندی](../chapter-03-configuration/configuration.md)

**نیاز به کمک؟** به بحث‌های جامعه ما بپیوندید یا یک issue در مخزن باز کنید. جامعه Azure AI + AZD اینجاست تا به موفقیت شما کمک کند!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
سلب مسئولیت:
این سند با استفاده از سرویس ترجمه مبتنی بر هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. هرچند ما در تلاش برای دقت هستیم، لطفاً به این نکته توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. نسخهٔ اصلی سند به زبان مبداء باید به‌عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس یا حیاتی، ترجمهٔ حرفه‌ای توسط انسان توصیه می‌شود. ما در قبال هرگونه سوءتفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->