# کارگاه آزمایشی AI: قابل استقرار کردن راه‌حل‌های AI شما با AZD

**ناوبری فصل:**
- **📚 صفحه دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل 2 - توسعه مبتنی بر هوش مصنوعی
- **⬅️ قبلی**: [استقرار مدل AI](ai-model-deployment.md)
- **➡️ بعدی**: [شیوه‌های برتر تولید AI](production-ai-practices.md)
- **🚀 فصل بعدی**: [فصل 3: پیکربندی](../chapter-03-configuration/configuration.md)

## مروری بر کارگاه

این آزمایشگاه عملی توسعه‌دهندگان را در فرایند گرفتن یک قالب AI موجود و استقرار آن با استفاده از Azure Developer CLI (AZD) راهنمایی می‌کند. شما الگوهای ضروری برای استقرارهای AI در محیط تولید با استفاده از خدمات Microsoft Foundry را یاد خواهید گرفت.

> **یادداشت اعتبارسنجی (2026-03-25):** این کارگاه در مقابل `azd` `1.23.12` بازبینی شده است. اگر نصب محلی شما قدیمی‌تر است، قبل از شروع AZD را به‌روزرسانی کنید تا احراز هویت، قالب و جریان کاری استقرار مطابق مراحل زیر باشد.

**مدت زمان:** 2-3 ساعت  
**سطح:** متوسط  
**پیش‌نیازها:** دانش پایه‌ی Azure، آشنایی با مفاهیم AI/ML

## 🎓 اهداف آموزشی

تا پایان این کارگاه، قادر خواهید بود:
- ✅ تبدیل یک برنامه AI موجود به استفاده از قالب‌های AZD
- ✅ پیکربندی خدمات Microsoft Foundry با AZD
- ✅ پیاده‌سازی مدیریت امن اعتبارنامه‌ها برای سرویس‌های AI
- ✅ استقرار برنامه‌های AI آماده تولید با مانیتورینگ
- ✅ عیب‌یابی مشکلات رایج استقرار AI

## پیش‌نیازها

### ابزارهای مورد نیاز
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) نصب شده
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) نصب شده
- [Git](https://git-scm.com/) نصب شده
- ویرایشگر کد (توصیه شده: VS Code)

### منابع Azure
- اشتراک Azure با دسترسی contributor
- دسترسی به خدمات Microsoft Foundry Models (یا قابلیت درخواست دسترسی)
- مجوز ایجاد resource group

### پیش‌نیازهای دانشی
- درک پایه‌ای از خدمات Azure
- آشنایی با رابط‌های خط فرمان
- مفاهیم پایه AI/ML (APIها، مدل‌ها، پرامپت‌ها)

## راه‌اندازی آزمایشگاه

### گام 1: آماده‌سازی محیط

1. **بررسی نصب ابزارها:**
```bash
# نصب AZD را بررسی کنید
azd version

# Azure CLI را بررسی کنید
az --version

# برای گردش‌کارهای AZD به Azure وارد شوید
azd auth login

# فقط در صورتی که قصد دارید در طول عیب‌یابی دستورات az را اجرا کنید، وارد Azure CLI شوید
az login
```

اگر روی چندین tenant کار می‌کنید یا اشتراک شما به‌صورت خودکار شناسایی نمی‌شود، مجدداً با `azd auth login --tenant-id <tenant-id>` تلاش کنید.

2. **کلون کردن مخزن کارگاه:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## ماژول 1: درک ساختار AZD برای برنامه‌های AI

### کالبدشناسی یک قالب AZD مناسب AI

فایل‌های کلیدی در یک قالب AZD آماده AI را بررسی کنید:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
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

**چه مواردی را جستجو کنید:**
- تعاریف سرویس برای مؤلفه‌های AI
- نگاشت متغیرهای محیطی
- پیکربندی‌های میزبان

2. **زیرساخت main.bicep را بازبینی کنید:**
```bash
cat infra/main.bicep
```

**الگوهای کلیدی AI برای شناسایی:**
- تأمین سرویس Microsoft Foundry Models
- یکپارچه‌سازی با Azure AI Search
- مدیریت امن کلیدها
- پیکربندی‌های امنیت شبکه

### **نقطه بحث:** چرا این الگوها برای AI مهم هستند

- **وابستگی سرویس‌ها**: برنامه‌های AI اغلب به چندین سرویس هماهنگ نیاز دارند
- **امنیت**: کلیدها و نقاط پایانی API باید به‌صورت امن مدیریت شوند
- **قابلیت مقیاس‌پذیری**: بارهای کاری AI نیازمندی‌های مقیاس‌پذیری خاصی دارند
- **مدیریت هزینه**: خدمات AI می‌توانند در صورت پیکربندی نادرست پرهزینه باشند

## ماژول 2: استقرار اولین برنامه AI شما

### گام 2.1: مقداردهی اولیه محیط

1. **یک محیط جدید AZD ایجاد کنید:**
```bash
azd env new myai-workshop
```

2. **پارامترهای مورد نیاز را تنظیم کنید:**
```bash
# منطقه‌ی Azure موردنظر خود را تنظیم کنید
azd env set AZURE_LOCATION eastus

# اختیاری: مدل خاص OpenAI را مشخص کنید
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### گام 2.2: استقرار زیرساخت و برنامه

1. **استقرار با AZD:**
```bash
azd up
```

**چه اتفاقی در زمان `azd up` می‌افتد:**
- ✅ سرویس Microsoft Foundry Models را فراهم می‌کند
- ✅ سرویس Azure AI Search را ایجاد می‌کند
- ✅ App Service را برای برنامه وب راه‌اندازی می‌کند
- ✅ شبکه و امنیت را پیکربندی می‌کند
- ✅ کد برنامه را مستقر می‌کند
- ✅ مانیتورینگ و لاگینگ را راه‌اندازی می‌کند

2. **پیشرفت استقرار را نظارت کنید** و منابعی که ایجاد می‌شوند را یادداشت کنید.

### گام 2.3: صحت‌سنجی استقرار شما

1. **منابع مستقر شده را بررسی کنید:**
```bash
azd show
```

2. **برنامه مستقر شده را باز کنید:**
```bash
azd show
```

نقطه انتهایی وب نشان‌داده‌شده در خروجی `azd show` را باز کنید.

3. **عملکرد AI را تست کنید:**
   - به برنامه وب بروید
   - پرس‌و‌جوهای نمونه را امتحان کنید
   - تأیید کنید که پاسخ‌های AI درست کار می‌کنند

### **تمرین آزمایشگاه 2.1: تمرین عیب‌یابی**

**سناریو**: استقرار شما موفق بوده اما AI پاسخ نمی‌دهد.

**مسائل رایجی که باید بررسی کنید:**
1. **کلیدهای API OpenAI**: بررسی کنید که به‌درستی تنظیم شده‌اند
2. **دسترس‌پذیری مدل**: بررسی کنید آیا منطقه شما از مدل پشتیبانی می‌کند
3. **اتصال شبکه**: اطمینان حاصل کنید سرویس‌ها می‌توانند با هم ارتباط برقرار کنند
4. **مجوزهای RBAC**: تأیید کنید برنامه می‌تواند به OpenAI دسترسی یابد

**دستورات اشکال‌زدایی:**
```bash
# بررسی متغیرهای محیطی
azd env get-values

# مشاهده لاگ‌های استقرار
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# بررسی وضعیت استقرار OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## ماژول 3: سفارشی‌سازی برنامه‌های AI برای نیازهای شما

### گام 3.1: اصلاح پیکربندی AI

1. **مدل OpenAI را به‌روزرسانی کنید:**
```bash
# به مدل دیگری تغییر دهید (در صورت در دسترس بودن در منطقهٔ شما)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# با پیکربندی جدید مجدداً مستقر کنید
azd deploy
```

2. **افزودن سرویس‌های AI اضافی:**

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

### گام 3.2: پیکربندی‌های مخصوص محیط

**بهترین شیوه**: پیکربندی‌های متفاوت برای توسعه در مقابل تولید.

1. **یک محیط production ایجاد کنید:**
```bash
azd env new myai-production
```

2. **پارامترهای مخصوص production را تنظیم کنید:**
```bash
# در محیط تولید معمولاً از SKU‌های بالاتری استفاده می‌شود
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# ویژگی‌های امنیتی اضافی را فعال کنید
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **تمرین آزمایشگاه 3.1: بهینه‌سازی هزینه**

**چالش**: قالب را برای توسعه کم‌هزینه پیکربندی کنید.

**وظایف:**
1. تعیین کنید کدام SKUها می‌توانند در حالت رایگان/پایه تنظیم شوند
2. متغیرهای محیطی را برای حداقل هزینه پیکربندی کنید
3. مستقر کنید و هزینه‌ها را با پیکربندی تولید مقایسه کنید

**اشاره‌های راه‌حل:**
- در صورت امکان از tier F0 (رایگان) برای Azure AI Services استفاده کنید
- در توسعه از tier Basic برای سرویس Search استفاده کنید
- استفاده از Consumption plan برای Functions را در نظر بگیرید

## ماژول 4: امنیت و بهترین شیوه‌های تولید

### گام 4.1: مدیریت امن اعتبارنامه‌ها

**چالش کنونی**: بسیاری از برنامه‌های AI کلیدهای API را داخل کد قرار می‌دهند یا از ذخیره‌سازی ناامن استفاده می‌کنند.

**راهکار AZD**: Managed Identity + ادغام با Key Vault.

1. **پیکربندی امنیتی در قالب خود را بازبینی کنید:**
```bash
# به دنبال پیکربندی Key Vault و Managed Identity بگردید
grep -r "keyVault\|managedIdentity" infra/
```

2. **تأیید کنید Managed Identity کار می‌کند:**
```bash
# بررسی کنید که برنامه وب پیکربندی هویت صحیحی دارد
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### گام 4.2: امنیت شبکه

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

### گام 4.3: مانیتورینگ و قابلیت مشاهده

1. **پیکربندی Application Insights:**
```bash
# Application Insights باید به صورت خودکار پیکربندی شود
# پیکربندی را بررسی کنید:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **راه‌اندازی مانیتورینگ مخصوص AI:**

متریک‌های سفارشی برای عملیات AI اضافه کنید:
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

### **تمرین آزمایشگاه 4.1: ممیزی امنیتی**

**وظیفه**: استقرار خود را برای بهترین شیوه‌های امنیتی بررسی کنید.

**چک‌لیست:**
- [ ] هیچ راز سخت‌کد شده در کد یا پیکربندی وجود ندارد
- [ ] از Managed Identity برای احراز هویت سرویس به سرویس استفاده شده است
- [ ] Key Vault پیکربندی برای نگهداری تنظیمات حساس
- [ ] دسترسی شبکه به‌طور مناسب محدود شده است
- [ ] مانیتورینگ و لاگینگ فعال شده‌اند

## ماژول 5: تبدیل برنامه AI خودتان

### گام 5.1: برگه ارزیابی

**قبل از تبدیل برنامه‌تان**، به این سوالات پاسخ دهید:

1. **معماری برنامه:**
   - برنامه شما از چه سرویس‌های AI استفاده می‌کند؟
   - چه منابع محاسباتی نیاز دارد؟
   - آیا به یک پایگاه داده نیاز دارد؟
   - وابستگی‌ها بین سرویس‌ها چه هستند؟

2. **نیازمندی‌های امنیتی:**
   - برنامه شما با چه داده‌های حساسی سروکار دارد؟
   - چه نیازمندی‌های انطباق دارید؟
   - آیا به شبکه خصوصی نیاز دارید؟

3. **نیازمندی‌های مقیاس‌پذیری:**
   - بار مورد انتظار شما چقدر است؟
   - آیا نیاز به auto-scaling دارید؟
   - آیا محدودیت‌های منطقه‌ای وجود دارد؟

### گام 5.2: ایجاد قالب AZD خود

**از این الگو پیروی کنید تا برنامه‌تان را تبدیل کنید:**

1. **ساختار پایه را ایجاد کنید:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# مقداردهی اولیه الگوی AZD
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

**چالش**: یک قالب AZD برای یک برنامه پردازش اسناد مبتنی بر AI ایجاد کنید.

**نیازمندی‌ها:**
- Microsoft Foundry Models برای تحلیل محتوا
- Document Intelligence برای OCR
- Storage Account برای آپلود اسناد
- Function App برای منطق پردازش
- برنامه وب برای رابط کاربری

**امتیاز اضافی:**
- افزودن خطایابی مناسب
- شامل برآورد هزینه
- راه‌اندازی داشبوردهای مانیتورینگ

## ماژول 6: رفع عیوب مسائل رایج

### مسائل رایج استقرار

#### مسئله 1: سقف سرویس OpenAI پر شده است
**نشانه‌ها:** استقرار با خطای سقف منابع شکست می‌خورد
**راه‌حل‌ها:**
```bash
# محدودیت‌های فعلی را بررسی کنید
az cognitiveservices usage list --location eastus

# درخواست افزایش سهمیه بدهید یا منطقهٔ دیگری را امتحان کنید
azd env set AZURE_LOCATION westus2
azd up
```

#### مسئله 2: مدل در منطقه موجود نیست
**نشانه‌ها:** پاسخ‌های AI شکست می‌خورند یا خطا در استقرار مدل رخ می‌دهد
**راه‌حل‌ها:**
```bash
# بررسی در دسترس بودن مدل بر اساس منطقه
az cognitiveservices model list --location eastus

# به‌روزرسانی به مدل در دسترس
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### مسئله 3: مشکلات مجوز
**نشانه‌ها:** خطاهای 403 Forbidden هنگام فراخوانی سرویس‌های AI
**راه‌حل‌ها:**
```bash
# بررسی تخصیص نقش‌ها
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# افزودن نقش‌های مفقود
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### مسائل عملکرد

#### مسئله 4: پاسخ‌های AI کند هستند
**گام‌های بررسی:**
1. بررسی متریک‌های عملکرد در Application Insights
2. بازبینی متریک‌های سرویس OpenAI در پرتال Azure
3. تأیید اتصال شبکه و تاخیرها

**راه‌حل‌ها:**
- پیاده‌سازی caching برای پرس‌و‌جوهای پرتکرار
- استفاده از مدل OpenAI مناسب برای مورد استفاده شما
- در سناریوهای بار بالا، استفاده از read replicaها را در نظر بگیرید

### **تمرین آزمایشگاه 6.1: چالش اشکال‌زدایی**

**سناریو**: استقرار شما موفق بوده، اما برنامه خطاهای 500 بازمی‌گرداند.

**وظایف اشکال‌زدایی:**
1. لاگ‌های برنامه را بررسی کنید
2. اتصال سرویس‌ها را تأیید کنید
3. احراز هویت را تست کنید
4. پیکربندی را بازبینی کنید

**ابزارهایی برای استفاده:**
- `azd show` برای نمای کلی استقرار
- پرتال Azure برای لاگ‌های دقیق سرویس‌ها
- Application Insights برای تله‌متری برنامه

## ماژول 7: مانیتورینگ و بهینه‌سازی

### گام 7.1: راه‌اندازی مانیتورینگ جامع

1. **داشبوردهای سفارشی ایجاد کنید:**

به پرتال Azure بروید و یک داشبورد با موارد زیر ایجاد کنید:
- تعداد درخواست‌ها و تأخیر OpenAI
- نرخ خطاهای برنامه
- استفاده منابع
- پیگیری هزینه

2. **هشدارها را تنظیم کنید:**
```bash
# هشدار دربارهٔ نرخ بالای خطا
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### گام 7.2: بهینه‌سازی هزینه

1. **هزینه‌های فعلی را تحلیل کنید:**
```bash
# برای دریافت اطلاعات هزینه از Azure CLI استفاده کنید
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **کنترل‌های هزینه را پیاده‌سازی کنید:**
- هشدارهای بودجه را راه‌اندازی کنید
- از سیاست‌های autoscaling استفاده کنید
- پیاده‌سازی کش برای درخواست‌ها
- استفاده از مانیتورینگ مصرف توکن برای OpenAI

### **تمرین آزمایشگاه 7.1: بهینه‌سازی عملکرد**

**وظیفه**: برنامه AI خود را هم برای عملکرد و هم برای هزینه بهینه کنید.

**متریک‌هایی برای بهبود:**
- کاهش زمان پاسخ متوسط به میزان 20%
- کاهش هزینه‌های ماهیانه به میزان 15%
- حفظ 99.9% آپ‌تایم

**استراتژی‌هایی برای امتحان:**
- پیاده‌سازی caching پاسخ‌ها
- بهینه‌سازی پرامپت‌ها برای کارایی توکن
- استفاده از SKUهای محاسباتی مناسب
- تنظیم autoscaling مناسب

## چالش نهایی: پیاده‌سازی انتها به انتها

### سناریوی چالش

وظیفه دارید یک چت‌بات خدمات مشتری مبتنی بر AI آماده تولید ایجاد کنید با نیازهای زیر:

**نیازمندی‌های عملکردی:**
- رابط وب برای تعامل با مشتری
- یکپارچه‌سازی با Microsoft Foundry Models برای پاسخ‌ها
- قابلیت جستجوی مستندات با استفاده از Azure AI Search
- یکپارچه‌سازی با پایگاه داده مشتری موجود
- پشتیبانی چندزبانه

**نیازمندی‌های غیرفункشنال:**
- پشتیبانی از 1000 کاربر هم‌زمان
- SLA با 99.9% آپ‌تایم
- انطباق SOC 2
- هزینه کمتر از $500/ماه
- استقرار در چندین محیط (dev, staging, prod)

### گام‌های پیاده‌سازی

1. **طراحی معماری**
2. **ایجاد قالب AZD**
3. **اجرای اقدامات امنیتی**
4. **راه‌اندازی مانیتورینگ و هشداردهی**
5. **ایجاد خط‌مشی‌های استقرار (deployment pipelines)**
6. **مستندسازی راه‌حل**

### معیارهای ارزیابی

- ✅ **عملکرد**: آیا تمام نیازها را برآورده می‌کند؟
- ✅ **امنیت**: آیا بهترین شیوه‌ها پیاده شده‌اند؟
- ✅ **قابلیت مقیاس‌پذیری**: آیا توانایی تحمل بار را دارد؟
- ✅ **قابلیت نگهداری**: آیا کد و زیرساخت سازمان‌دهی شده است؟
- ✅ **هزینه**: آیا در محدوده بودجه باقی می‌ماند؟

## منابع اضافی

### مستندات مایکروسافت
- [مستندات Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [مستندات سرویس Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [مستندات Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### قالب‌های نمونه
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [چت Contoso](https://github.com/Azure-Samples/contoso-chat)

### منابع جامعه
- [دیسکورد Microsoft Foundry](https://discord.gg/microsoft-azure)
- [گیت‌هاب Azure Developer CLI](https://github.com/Azure/azure-dev)
- [الگوهای عالی AZD](https://azure.github.io/awesome-azd/)

## 🎓 گواهی اتمام

تبریک! شما کارگاه آزمایشگاهی هوش مصنوعی را به پایان رساندید. اکنون باید بتوانید:

- ✅ تبدیل برنامه‌های موجود هوش مصنوعی به قالب‌های AZD
- ✅ استقرار برنامه‌های هوش مصنوعی آماده برای تولید
- ✅ اجرای بهترین شیوه‌های امنیتی برای بارهای کاری هوش مصنوعی
- ✅ نظارت و بهینه‌سازی عملکرد برنامه‌های هوش مصنوعی
- ✅ رفع اشکال مشکلات رایج استقرار

### گام‌های بعدی
1. این الگوها را در پروژه‌های هوش مصنوعی خود اعمال کنید
2. الگوها را به جامعه بازگردانید
3. برای پشتیبانی مستمر به دیسکورد Microsoft Foundry بپیوندید
4. موضوعات پیشرفته‌ای مانند استقرار در چند منطقه را کاوش کنید

---

**بازخورد کارگاه**: به ما کمک کنید این کارگاه را با به اشتراک گذاشتن تجربه‌تان در [کانال #Azure در دیسکورد Microsoft Foundry](https://discord.gg/microsoft-azure) بهبود دهیم.

---

**ناوبری فصل:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل 2 - توسعه مبتنی بر هوش مصنوعی
- **⬅️ قبلی**: [استقرار مدل هوش مصنوعی](ai-model-deployment.md)
- **➡️ بعدی**: [بهترین شیوه‌های هوش مصنوعی در محیط تولید](production-ai-practices.md)
- **🚀 فصل بعدی**: [فصل 3: پیکربندی](../chapter-03-configuration/configuration.md)

**نیاز به کمک؟** برای پشتیبانی و بحث درباره استقرارهای AZD و هوش مصنوعی به جامعه ما بپیوندید.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->