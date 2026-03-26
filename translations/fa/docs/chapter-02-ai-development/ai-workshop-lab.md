# کارگاه آزمایشگاهی هوش مصنوعی: قابل استقرار کردن راه‌حل‌های هوش مصنوعی شما با AZD

**ناوبری فصل:**
- **📚 صفحه دوره**: [AZD For Beginners](../../README.md)
- **📖 فصل فعلی**: فصل 2 - توسعه اول هوش مصنوعی
- **⬅️ قبلی**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ بعدی**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 فصل بعدی**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## مرور کارگاه

این آزمایشگاه عملی توسعه‌دهندگان را در روند گرفتن یک قالب هوش مصنوعی موجود و استقرار آن با استفاده از Azure Developer CLI (AZD) راهنمایی می‌کند. شما الگوهای ضروری برای استقرارهای تولیدی هوش مصنوعی با استفاده از خدمات Microsoft Foundry را یاد خواهید گرفت.

**مدت:** 2-3 ساعت  
**سطح:** متوسط  
**پیش‌نیازها:** دانش پایه Azure، آشنایی با مفاهیم AI/ML

## 🎓 اهداف یادگیری

تا پایان این کارگاه، شما قادر خواهید بود:
- ✅ تبدیل یک برنامه هوش مصنوعی موجود برای استفاده از قالب‌های AZD
- ✅ پیکربندی خدمات Microsoft Foundry با AZD
- ✅ پیاده‌سازی مدیریت امن اعتبارنامه‌ها برای خدمات هوش مصنوعی
- ✅ استقرار برنامه‌های هوش مصنوعی آماده تولید با مانیتورینگ
- ✅ عیب‌یابی مشکلات رایج استقرار هوش مصنوعی

## پیش‌نیازها

### ابزارهای مورد نیاز
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) نصب‌شده
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) نصب‌شده
- [Git](https://git-scm.com/) نصب‌شده
- ویرایشگر کد (توصیه شده: VS Code)

### منابع Azure
- اشتراک Azure با دسترسی contributor
- دسترسی به سرویس‌های Microsoft Foundry Models (یا امکان درخواست دسترسی)
- مجوزهای ایجاد resource group

### پیش‌نیازهای دانشی
- درک پایه‌ای از خدمات Azure
- آشنایی با رابط‌های خط فرمان
- مفاهیم پایه AI/ML (APIها، مدل‌ها، پرامپت‌ها)

## راه‌اندازی آزمایشگاه

### Step 1: Environment Preparation

1. **تأیید نصب ابزارها:**
```bash
# بررسی نصب AZD
azd version

# بررسی Azure CLI
az --version

# ورود به Azure
az login
azd auth login
```

2. **کلون کردن مخزن کارگاه:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### Anatomy of an AI AZD Template

کاوش در فایل‌های کلیدی در یک قالب AZD آماده برای هوش مصنوعی:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **تمرین آزمایشگاه 1.1: بررسی پیکربندی**

1. **فایل azure.yaml را بررسی کنید:**
```bash
cat azure.yaml
```

**چه چیزهایی را جستجو کنید:**
- تعریف سرویس‌ها برای مؤلفه‌های هوش مصنوعی
- نگاشت متغیرهای محیطی
- پیکربندی‌های میزبان

2. **main.bicep زیرساخت را مرور کنید:**
```bash
cat infra/main.bicep
```

**الگوهای کلیدی هوش مصنوعی برای شناسایی:**
- فراهم‌سازی سرویس Microsoft Foundry Models
- یکپارچه‌سازی Cognitive Search
- مدیریت امن کلیدها
- پیکربندی‌های امنیت شبکه

### **نکته بحث:** چرا این الگوها برای هوش مصنوعی اهمیت دارند

- **وابستگی‌های سرویس**: برنامه‌های هوش مصنوعی اغلب نیاز به چندین سرویس هماهنگ‌شده دارند
- **امنیت**: کلیدهای API و نقاط پایانی نیاز به مدیریت امن دارند
- **مقیاس‌پذیری**: بارهای کاری هوش مصنوعی نیازهای مقیاس‌پذیری خاصی دارند
- **مدیریت هزینه**: سرویس‌های هوش مصنوعی می‌توانند گران باشند اگر به‌درستی پیکربندی نشوند

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

1. **یک محیط AZD جدید ایجاد کنید:**
```bash
azd env new myai-workshop
```

2. **پارامترهای مورد نیاز را تنظیم کنید:**
```bash
# ناحیهٔ Azure موردنظر خود را تنظیم کنید
azd env set AZURE_LOCATION eastus

# اختیاری: مدل مشخص OpenAI را تنظیم کنید
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Step 2.2: Deploy the Infrastructure and Application

1. **استقرار با AZD:**
```bash
azd up
```

**چه اتفاقی در طول `azd up` می‌افتد:**
- ✅ فراهم‌سازی سرویس Microsoft Foundry Models
- ✅ ایجاد سرویس Cognitive Search
- ✅ راه‌اندازی App Service برای برنامه وب
- ✅ پیکربندی شبکه و امنیت
- ✅ استقرار کد برنامه
- ✅ راه‌اندازی مانیتورینگ و لاگ‌گیری

2. **پیشرفت استقرار را نظارت کنید** و منابع ایجادشونده را یادداشت کنید.

### Step 2.3: Verify Your Deployment

1. **منابع مستقر شده را بررسی کنید:**
```bash
azd show
```

2. **برنامه مستقر شده را باز کنید:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **قابلیت هوش مصنوعی را آزمایش کنید:**
   - به برنامه وب بروید
   - پرس‌وجوهای نمونه را امتحان کنید
   - تأیید کنید پاسخ‌های هوش مصنوعی کار می‌کنند

### **تمرین آزمایشگاه 2.1: تمرین عیب‌یابی**

**سناریو**: استقرار شما موفق بوده اما هوش مصنوعی پاسخ نمی‌دهد.

**مشکلات رایج برای بررسی:**
1. **کلیدهای API OpenAI**: تأیید کنید که به‌درستی تنظیم شده‌اند
2. **موجودیت مدل**: بررسی کنید آیا منطقه شما از مدل پشتیبانی می‌کند
3. **اتصال شبکه**: اطمینان حاصل کنید سرویس‌ها می‌توانند ارتباط برقرار کنند
4. **مجوزهای RBAC**: تأیید کنید برنامه می‌تواند به OpenAI دسترسی پیدا کند

**دستورات اشکال‌زدایی:**
```bash
# بررسی متغیرهای محیطی
azd env get-values

# مشاهده گزارش‌های استقرار
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# وضعیت استقرار OpenAI را بررسی کنید
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

1. **مدل OpenAI را به‌روزرسانی کنید:**
```bash
# به مدل دیگری تغییر دهید (اگر در منطقه شما در دسترس است)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# با پیکربندی جدید مجدداً مستقر کنید
azd deploy
```

2. **اضافه کردن سرویس‌های اضافی هوش مصنوعی:**

فایل `infra/main.bicep` را برای افزودن Document Intelligence ویرایش کنید:

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### Step 3.2: Environment-Specific Configurations

**بهترین رویه**: پیکربندی‌های متفاوت برای توسعه در مقابل تولید.

1. **یک محیط production ایجاد کنید:**
```bash
azd env new myai-production
```

2. **پارامترهای مخصوص production را تنظیم کنید:**
```bash
# در محیط تولید معمولاً از SKUهای بالاتری استفاده می‌شود
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# ویژگی‌های امنیتی اضافی را فعال کنید
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **تمرین آزمایشگاه 3.1: بهینه‌سازی هزینه**

**چالش**: قالب را برای توسعه مقرون‌به‌صرفه پیکربندی کنید.

**وظایف:**
1. تعیین کنید کدام SKUs را می‌توان روی tierهای free/basic قرار داد
2. متغیرهای محیطی را برای کمترین هزینه پیکربندی کنید
3. استقرار دهید و هزینه‌ها را با پیکربندی production مقایسه کنید

**راهنمایی‌های حل:**
- هنگام امکان از tier F0 (رایگان) برای Cognitive Services استفاده کنید
- از tier Basic برای Search Service در محیط توسعه استفاده کنید
- در نظر بگیرید از طرح Consumption برای Functions استفاده کنید

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**چالش کنونی**: بسیاری از برنامه‌های هوش مصنوعی کلیدهای API را به‌صورت سخت‌کد یا در ذخیره‌سازی ناامن نگه می‌دارند.

**راه‌حل AZD**: یکپارچه‌سازی Managed Identity + Key Vault.

1. **پیکربندی امنیتی در قالب خود را مرور کنید:**
```bash
# پیکربندی Key Vault و هویت مدیریت‌شده را بررسی کنید
grep -r "keyVault\|managedIdentity" infra/
```

2. **تأیید کنید Managed Identity کار می‌کند:**
```bash
# بررسی کنید که برنامه وب پیکربندی هویت صحیحی دارد
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **فعال‌سازی private endpoints** (اگر قبلاً پیکربندی نشده است):

به قالب bicep خود اضافه کنید:
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
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

### Step 4.3: Monitoring and Observability

1. **پیکربندی Application Insights:**
```bash
# Application Insights باید به‌طور خودکار پیکربندی شود
# پیکربندی را بررسی کنید:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **راه‌اندازی مانیتورینگ مخصوص هوش مصنوعی:**

متریک‌های سفارشی برای عملیات هوش مصنوعی اضافه کنید:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```

### **تمرین آزمایشگاه 4.1: حسابرسی امنیتی**

**وظیفه**: استقرار خود را برای بهترین شیوه‌های امنیتی بررسی کنید.

**چک‌لیست:**
- [ ] رازهای سخت‌کد‌شده در کد یا پیکربندی وجود نداشته باشد
- [ ] برای احراز هویت سرویس‌به‌سرویس از Managed Identity استفاده شده باشد
- [ ] Key Vault تنظیمات حساس را نگهداری کند
- [ ] دسترسی شبکه به‌درستی محدود شده باشد
- [ ] مانیتورینگ و لاگ‌گیری فعال شده باشند

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**قبل از تبدیل برنامه‌تان**، به این سوالات پاسخ دهید:

1. **معماری برنامه:**
   - برنامه شما از چه سرویس‌های هوش مصنوعی استفاده می‌کند؟
   - چه منابع محاسباتی نیاز دارد؟
   - آیا به دیتابیس نیاز دارد؟
   - وابستگی‌ها بین سرویس‌ها چه هستند؟

2. **نیازمندی‌های امنیتی:**
   - برنامه شما با چه داده‌های حساس سروکار دارد؟
   - نیازهای انطباق (compliance) شما چیست؟
   - آیا به شبکه خصوصی نیاز دارید؟

3. **نیازمندی‌های مقیاس‌گذاری:**
   - بار مورد انتظار شما چقدر است؟
   - آیا به auto-scaling نیاز دارید؟
   - آیا محدودیت‌های منطقه‌ای وجود دارد؟

### Step 5.2: Create Your AZD Template

**این الگو را برای تبدیل برنامه خود دنبال کنید:**

1. **ساختار پایه را ایجاد کنید:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# قالب AZD را مقداردهی اولیه کنید
azd init --template minimal
```

2. **ایجاد azure.yaml:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **ایجاد قالب‌های زیرساخت:**

**infra/main.bicep** - قالب اصلی:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - ماژول OpenAI:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **تمرین آزمایشگاه 5.1: چالش ایجاد قالب**

**چالش**: یک قالب AZD برای یک برنامه پردازش مدارک ایجاد کنید.

**نیازمندی‌ها:**
- Microsoft Foundry Models برای تحلیل محتوا
- Document Intelligence برای OCR
- Storage Account برای بارگذاری مدارک
- Function App برای منطق پردازش
- وب‌اپ برای رابط کاربری

**امتیاز اضافی:**
- افزودن هندلینگ خطای مناسب
- شامل تخمین هزینه
- راه‌اندازی داشبوردهای مانیتورینگ

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**نشانه‌ها:** استقرار با خطای سهمیه شکست می‌خورد
**راه‌حل‌ها:**
```bash
# سهمیه‌های فعلی را بررسی کنید
az cognitiveservices usage list --location eastus

# درخواست افزایش سهمیه دهید یا منطقهٔ دیگری را امتحان کنید
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**نشانه‌ها:** پاسخ‌های هوش مصنوعی ناموفق یا خطاهای استقرار مدل
**راه‌حل‌ها:**
```bash
# بررسی در دسترس بودن مدل بر اساس منطقه
az cognitiveservices model list --location eastus

# به‌روزرسانی به مدل موجود
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Issue 3: Permission Issues
**نشانه‌ها:** خطاهای 403 Forbidden هنگام فراخوانی سرویس‌های هوش مصنوعی
**راه‌حل‌ها:**
```bash
# تخصیص نقش‌ها را بررسی کنید
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# نقش‌های مفقود را اضافه کنید
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Issues

#### Issue 4: Slow AI Responses
**گام‌های بررسی:**
1. متریک‌های عملکرد را در Application Insights بررسی کنید
2. متریک‌های سرویس OpenAI را در پورتال Azure مرور کنید
3. اتصال شبکه و تأخیر را تأیید کنید

**راه‌حل‌ها:**
- برای پرس‌وجوهای رایج کش پیاده‌سازی کنید
- از مدل OpenAI مناسب برای مورد استفاده خود بهره ببرید
- برای سناریوهای بار بالا از read replicaها استفاده کنید

### **تمرین آزمایشگاه 6.1: چالش اشکال‌زدایی**

**سناریو**: استقرار شما موفق بوده اما برنامه خطای 500 برمی‌گرداند.

**وظایف اشکال‌زدایی:**
1. لاگ‌های برنامه را بررسی کنید
2. اتصال سرویس‌ها را تأیید کنید
3. احراز هویت را تست کنید
4. پیکربندی را مرور کنید

**ابزارهای قابل استفاده:**
- `azd show` برای نمای کلی استقرار
- پورتال Azure برای لاگ‌های دقیق سرویس
- Application Insights برای تله‌متری برنامه

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **ایجاد داشبوردهای سفارشی:**

به پورتال Azure بروید و یک داشبورد با موارد زیر ایجاد کنید:
- تعداد درخواست‌ها و تأخیر OpenAI
- نرخ خطاهای برنامه
- استفاده منابع
- ردیابی هزینه

2. **تنظیم هشدارها:**
```bash
# هشدار برای نرخ بالای خطا
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Step 7.2: Cost Optimization

1. **تحلیل هزینه‌های جاری:**
```bash
# از Azure CLI برای دریافت داده‌های هزینه استفاده کنید
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **اجرای کنترل‌های هزینه:**
- تنظیم هشدارهای بودجه
- استفاده از سیاست‌های autoscaling
- پیاده‌سازی کش برای درخواست‌ها
- نظارت بر مصرف توکن برای OpenAI

### **تمرین آزمایشگاه 7.1: بهینه‌سازی عملکرد**

**وظیفه**: برنامه هوش مصنوعی خود را هم از نظر عملکرد و هم هزینه بهینه کنید.

**متریک‌هایی که باید بهبود یابند:**
- کاهش زمان پاسخ متوسط به میزان 20%
- کاهش هزینه‌های ماهانه به میزان 15%
- حفظ 99.9% زمان در دسترس بودن

**استراتژی‌هایی برای امتحان کردن:**
- پیاده‌سازی کش پاسخ‌ها
- بهینه‌سازی پرامپت‌ها برای کارایی توکن
- استفاده از SKUs محاسباتی مناسب
- راه‌اندازی autoscaling صحیح

## چالش نهایی: پیاده‌سازی انتها تا انتها

### سناریوی چالش

شما مأمور ایجاد یک چت‌بات خدمات مشتری مبتنی بر هوش مصنوعی آماده تولید با نیازهای زیر هستید:

**نیازمندی‌های عملکردی:**
- رابط وب برای تعاملات مشتری
- یکپارچه‌سازی با Microsoft Foundry Models برای پاسخ‌ها
- قابلیت جستجوی اسناد با استفاده از Cognitive Search
- یکپارچه‌سازی با دیتابیس مشتری موجود
- پشتیبانی چندزبانگی

**نیازمندی‌های غیرعملکردی:**
- پشتیبانی از 1000 کاربر همزمان
- SLA با دسترسی 99.9%
- انطباق SOC 2
- هزینه کمتر از $500/ماه
- استقرار در چندین محیط (dev, staging, prod)

### گام‌های پیاده‌سازی

1. **طراحی معماری**
2. **ایجاد قالب AZD**
3. **اجرای تدابیر امنیتی**
4. **راه‌اندازی مانیتورینگ و هشدارها**
5. **ایجاد خطوط لوله استقرار**
6. **مستندسازی راه‌حل**

### معیارهای ارزیابی

- ✅ **عملکرد**: آیا تمام نیازمندی‌ها را برآورده می‌کند؟
- ✅ **امنیت**: آیا بهترین رویه‌ها پیاده‌سازی شده‌اند؟
- ✅ **مقیاس‌پذیری**: آیا می‌تواند بار را مدیریت کند؟
- ✅ **قابلیت نگهداری**: آیا کد و زیرساخت به‌خوبی سازمان‌دهی شده‌اند؟
- ✅ **هزینه**: آیا در بودجه می‌گنجد؟

## منابع اضافی

### مستندات مایکروسافت
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### قالب‌های نمونه
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### منابع جامعه
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 گواهی اتمام

تبریک می‌گوییم! شما کارگاه آزمایشگاهی هوش مصنوعی را تکمیل کرده‌اید. اکنون باید بتوانید:
- ✅ تبدیل برنامه‌های موجود هوش مصنوعی به قالب‌های AZD
- ✅ استقرار برنامه‌های هوش مصنوعی آمادهٔ تولید
- ✅ پیاده‌سازی بهترین شیوه‌های امنیتی برای بارهای کاری هوش مصنوعی
- ✅ نظارت و بهینه‌سازی عملکرد برنامه‌های هوش مصنوعی
- ✅ رفع اشکال مشکلات رایج استقرار

### مراحل بعدی
1. این الگوها را در پروژه‌های هوش مصنوعی خود اعمال کنید
2. قالب‌ها را به جامعه بازگردانید
3. برای پشتیبانی مداوم، به سرور Discord مایکروسافت فاندری بپیوندید
4. موضوعات پیشرفته‌ای مانند استقرار در چند منطقه را بررسی کنید

---

**بازخورد کارگاه**: با به اشتراک گذاشتن تجربهٔ خود در [کانال #Azure در Microsoft Foundry Discord](https://discord.gg/microsoft-azure) به ما در بهبود این کارگاه کمک کنید.

---

**ناوبری فصل:**
- **📚 صفحهٔ دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل فعلی**: فصل 2 - توسعهٔ محور هوش مصنوعی
- **⬅️ قبلی**: [استقرار مدل هوش مصنوعی](ai-model-deployment.md)
- **➡️ بعدی**: [بهترین شیوه‌های تولیدی هوش مصنوعی](production-ai-practices.md)
- **🚀 فصل بعد**: [فصل 3: پیکربندی](../chapter-03-configuration/configuration.md)

**نیاز به کمک دارید؟** برای دریافت پشتیبانی و بحث دربارهٔ استقرارهای AZD و هوش مصنوعی به جامعهٔ ما بپیوندید.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما برای دقت تلاش می‌کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مبدأ باید به‌عنوان منبع/مرجع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوءتفاهم یا تفسیر نادرست ناشی از استفاده از این ترجمه مسئول نیستیم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->