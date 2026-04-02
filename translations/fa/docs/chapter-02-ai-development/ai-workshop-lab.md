# آزمایشگاه کارگاهی هوش مصنوعی: قابل استقرار کردن راه‌حل‌های هوش مصنوعی شما با AZD

**Chapter Navigation:**
- **📚 صفحه دوره**: [AZD For Beginners](../../README.md)
- **📖 فصل جاری**: فصل ۲ - توسعهٔ هوش‌مصنوعی‌محور
- **⬅️ قبلی**: [استقرار مدل‌های هوش‌مصنوعی](ai-model-deployment.md)
- **➡️ بعدی**: [بهترین روش‌های تولیدی هوش‌مصنوعی](production-ai-practices.md)
- **🚀 فصل بعدی**: [فصل ۳: پیکربندی](../chapter-03-configuration/configuration.md)

## نمای کلی کارگاه

این آزمایشگاه عملی توسعه‌دهندگان را در فرایند گرفتن یک قالب موجود هوش مصنوعی و استقرار آن با استفاده از Azure Developer CLI (AZD) راهنمایی می‌کند. شما الگوهای ضروری برای استقرارهای تولیدی هوش مصنوعی با استفاده از خدمات Microsoft Foundry را خواهید آموخت.

> **یادداشت تأیید (2026-03-25):** این کارگاه در برابر `azd` `1.23.12` بررسی شده است. اگر نصب محلی شما قدیمی‌تر است، قبل از شروع AZD را به‌روزرسانی کنید تا فرایند تأیید هویت، قالب و گردش کار استقرار با مراحل زیر مطابقت داشته باشد.

**مدت زمان:** 2-3 ساعت  
**سطح:** متوسط  
**پیش‌نیازها:** دانش پایه‌ای از Azure، آشنایی با مفاهیم AI/ML

## 🎓 اهداف آموزشی

تا پایان این کارگاه، قادر خواهید بود:
- ✅ تبدیل یک برنامه هوش مصنوعی موجود برای استفاده از قالب‌های AZD
- ✅ پیکربندی خدمات Microsoft Foundry با AZD
- ✅ پیاده‌سازی مدیریت امن اعتبارنامه‌ها برای سرویس‌های هوش مصنوعی
- ✅ استقرار برنامه‌های هوش مصنوعی آماده تولید با نظارت
- ✅ عیب‌یابی مسائل متداول استقرار هوش مصنوعی

## پیش‌نیازها

### ابزارهای مورد نیاز
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) نصب‌شده
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) نصب‌شده
- [Git](https://git-scm.com/) نصب‌شده
- ویرایشگر کد (پیشنهاد شده: VS Code)

### منابع Azure
- اشتراک Azure با دسترسی contributor
- دسترسی به خدمات Microsoft Foundry Models (یا امکان درخواست دسترسی)
- مجوزهای ایجاد resource group

### پیش‌نیازهای دانشی
- درک پایه‌ای از خدمات Azure
- آشنایی با رابط‌های خط فرمان
- مفاهیم پایه‌ای AI/ML (APIها، مدل‌ها، پرامپت‌ها)

## تنظیمات آزمایشگاه

### مرحله 1: آماده‌سازی محیط

1. **تأیید نصب ابزارها:**
```bash
# بررسی نصب AZD
azd version

# بررسی نصب Azure CLI
az --version

# ورود به Azure برای گردش‌کارهای AZD
azd auth login

# فقط در صورتی به Azure CLI وارد شوید که قصد دارید در حین عیب‌یابی دستورات az را اجرا کنید.
az login
```

اگر در چندین tenant کار می‌کنید یا اشتراک شما به‌طور خودکار شناسایی نمی‌شود، دوباره تلاش کنید با `azd auth login --tenant-id <tenant-id>`.

2. **کلون کردن مخزن کارگاه:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## ماژول 1: درک ساختار AZD برای برنامه‌های هوش مصنوعی

### آناتومی یک قالب AZD آماده برای هوش مصنوعی

فایل‌های کلیدی در یک قالب AZD آماده برای هوش مصنوعی را بررسی کنید:

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

### **تمرین آزمایشگاهی 1.1: بررسی پیکربندی**

1. **فایل azure.yaml را بررسی کنید:**
```bash
cat azure.yaml
```

**چه چیزهایی را بررسی کنید:**
- تعاریف سرویس برای مؤلفه‌های هوش مصنوعی
- نگاشت متغیرهای محیطی
- پیکربندی‌های میزبان

2. **زیرساخت main.bicep را مرور کنید:**
```bash
cat infra/main.bicep
```

**الگوهای کلیدی AI برای شناسایی:**
- تأمین سرویس Microsoft Foundry Models
- یکپارچه‌سازی Cognitive Search
- مدیریت امن کلیدها
- پیکربندی‌های امنیت شبکه

### **نکته بحث:** چرا این الگوها برای هوش مصنوعی اهمیت دارند

- **وابستگی سرویس‌ها**: برنامه‌های هوش مصنوعی معمولاً به چندین سرویس هماهنگ‌شده نیاز دارند
- **امنیت**: کلیدهای API و نقاط انتهایی نیاز به مدیریت امن دارند
- **قابلیت مقیاس‌پذیری**: بارهای کاری هوش مصنوعی نیازهای مقیاس خاصی دارند
- **مدیریت هزینه**: خدمات هوش مصنوعی می‌توانند گران باشند اگر به‌درستی پیکربندی نشوند

## ماژول 2: استقرار اولین برنامه هوش مصنوعی شما

### مرحله 2.1: راه‌اندازی محیط

1. **ایجاد یک محیط AZD جدید:**
```bash
azd env new myai-workshop
```

2. **تنظیم پارامترهای مورد نیاز:**
```bash
# منطقهٔ Azure مورد علاقهٔ خود را تنظیم کنید
azd env set AZURE_LOCATION eastus

# اختیاری: مدل مشخص OpenAI را تنظیم کنید
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### مرحله 2.2: استقرار زیرساخت و برنامه

1. **استقرار با AZD:**
```bash
azd up
```

**چه چیزهایی هنگام اجرای `azd up` رخ می‌دهد:**
- ✅ تأمین سرویس Microsoft Foundry Models
- ✅ ایجاد سرویس Cognitive Search
- ✅ راه‌اندازی App Service برای برنامه وب
- ✅ پیکربندی شبکه و امنیت
- ✅ استقرار کد برنامه
- ✅ راه‌اندازی نظارت و لاگ‌گیری

2. **پیشروی استقرار را مانیتور کنید** و منابعی که ایجاد می‌شوند را یادداشت کنید.

### مرحله 2.3: تأیید استقرار شما

1. **بررسی منابع مستقر شده:**
```bash
azd show
```

2. **باز کردن برنامه مستقر شده:**
```bash
azd show
```

نقطه انتهایی وب نمایش‌داده‌شده در خروجی `azd show` را باز کنید.

3. **آزمایش عملکرد هوش مصنوعی:**
   - به برنامه وب مراجعه کنید
   - پرسش‌های نمونه را امتحان کنید
   - تأیید کنید پاسخ‌های هوش مصنوعی کار می‌کنند

### **تمرین آزمایشگاهی 2.1: تمرین عیب‌یابی**

**سناریو**: استقرار شما موفق بود اما هوش مصنوعی پاسخ نمی‌دهد.

**مسائل متداول برای بررسی:**
1. **کلیدهای API OpenAI**: بررسی کنید که به‌درستی تنظیم شده باشند
2. **دسترس‌پذیری مدل**: بررسی کنید آیا منطقه شما از مدل پشتیبانی می‌کند
3. **اتصال شبکه**: اطمینان حاصل کنید سرویس‌ها می‌توانند ارتباط برقرار کنند
4. **مجوزهای RBAC**: بررسی کنید برنامه بتواند به OpenAI دسترسی داشته باشد

**دستورات عیب‌یابی:**
```bash
# متغیرهای محیطی را بررسی کنید
azd env get-values

# لاگ‌های استقرار را مشاهده کنید
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# وضعیت استقرار OpenAI را بررسی کنید
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## ماژول 3: سفارشی‌سازی برنامه‌های هوش مصنوعی برای نیازهای شما

### مرحله 3.1: تغییر پیکربندی هوش مصنوعی

1. **به‌روزرسانی مدل OpenAI:**
```bash
# به مدل دیگری تغییر دهید (اگر در منطقه شما موجود باشد)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# با پیکربندی جدید مجدداً مستقر کنید
azd deploy
```

2. **افزودن سرویس‌های اضافی هوش مصنوعی:**

فایل `infra/main.bicep` را ویرایش کنید تا Document Intelligence را اضافه کنید:

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

### مرحله 3.2: پیکربندی‌های خاص محیط

**بهترین عمل**: پیکربندی‌های متفاوت برای توسعه در برابر تولید.

1. **ایجاد یک محیط production:**
```bash
azd env new myai-production
```

2. **تنظیم پارامترهای مخصوص production:**
```bash
# در محیط تولید معمولاً از SKUهای بالاتر استفاده می‌شود
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# ویژگی‌های امنیتی اضافی را فعال کنید
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **تمرین آزمایشگاهی 3.1: بهینه‌سازی هزینه**

**چالش**: قالب را برای توسعه با هزینه مؤثر پیکربندی کنید.

**وظایف:**
1. تعیین کنید کدام SKUs را می‌توان روی سطوح free/basic قرار داد
2. متغیرهای محیطی را برای حداقل هزینه پیکربندی کنید
3. استقرار دهید و هزینه‌ها را با پیکربندی production مقایسه کنید

**راهنمای حل:**
- در صورت امکان از tier F0 (free) برای Cognitive Services استفاده کنید
- در محیط توسعه از tier Basic برای سرویس Search استفاده کنید
- در نظر بگیرید از طرح Consumption برای Functions استفاده کنید

## ماژول 4: امنیت و بهترین روش‌های تولید

### مرحله 4.1: مدیریت امن اعتبارنامه‌ها

**چالش فعلی**: بسیاری از برنامه‌های هوش مصنوعی کلیدهای API را در کد قرار می‌دهند یا از ذخیره‌سازی ناامن استفاده می‌کنند.

**راهکار AZD**: Managed Identity + ادغام Key Vault.

1. **پیکربندی امنیتی در قالب خود را مرور کنید:**
```bash
# به‌دنبال پیکربندی انبار کلید و هویت مدیریت‌شده بگردید.
grep -r "keyVault\|managedIdentity" infra/
```

2. **تأیید کنید Managed Identity کار می‌کند:**
```bash
# بررسی کنید که برنامه وب پیکربندی هویت صحیحی دارد
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### مرحله 4.2: امنیت شبکه

1. **فعال کردن private endpoints** (اگر از قبل پیکربندی نشده است):

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

### مرحله 4.3: نظارت و قابلیت مشاهده

1. **پیکربندی Application Insights:**
```bash
# Application Insights باید به‌صورت خودکار پیکربندی شود
# پیکربندی را بررسی کنید:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **راه‌اندازی نظارت مخصوص هوش مصنوعی:**

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

### **تمرین آزمایشگاهی 4.1: ممیزی امنیتی**

**وظیفه**: استقرار خود را برای بهترین روش‌های امنیتی بررسی کنید.

**چک‌لیست:**
- [ ] هیچ راز سخت‌کد شده‌ای در کد یا پیکربندی وجود نداشته باشد
- [ ] از Managed Identity برای احراز هویت سرویس‌به‌سرویس استفاده شده باشد
- [ ] Key Vault تنظیمات حساس را ذخیره کند
- [ ] دسترسی شبکه به‌درستی محدود شده باشد
- [ ] نظارت و لاگ‌گیری فعال باشد

## ماژول 5: تبدیل برنامه هوش مصنوعی خود

### مرحله 5.1: برگه ارزیابی

**قبل از تبدیل برنامه خود**، به این سوالات پاسخ دهید:

1. **معماری برنامه:**
   - برنامه شما از چه سرویس‌های هوش مصنوعی استفاده می‌کند؟
   - به چه منابع محاسباتی نیاز دارد؟
   - آیا به یک پایگاه داده نیاز دارد؟
   - وابستگی‌ها بین سرویس‌ها چیست؟

2. **نیازمندی‌های امنیتی:**
   - برنامه شما با چه داده‌های حساس سروکار دارد؟
   - چه الزامات انطباقی دارید؟
   - آیا به شبکه خصوصی نیاز دارید؟

3. **نیازمندی‌های مقیاس‌پذیری:**
   - بار مورد انتظار شما چقدر است؟
   - آیا به auto-scaling نیاز دارید؟
   - آیا نیازمندی‌های منطقه‌ای وجود دارد؟

### مرحله 5.2: ایجاد قالب AZD خود

**از این الگو پیروی کنید تا برنامه خود را تبدیل کنید:**

1. **ایجاد ساختار پایه:**
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

### **تمرین آزمایشگاهی 5.1: چالش ایجاد قالب**

**چالش**: یک قالب AZD برای یک برنامه پردازش اسناد مبتنی بر هوش مصنوعی ایجاد کنید.

**نیازمندی‌ها:**
- Microsoft Foundry Models برای تحلیل محتوا
- Document Intelligence برای OCR
- Storage Account برای آپلود اسناد
- Function App برای منطق پردازش
- Web app برای رابط کاربری

**امتیاز اضافه:**
- افزودن مدیریت خطای مناسب
- شامل برآورد هزینه
- راه‌اندازی داشبوردهای مانیتورینگ

## ماژول 6: عیب‌یابی مسائل متداول

### مسائل متداول استقرار

#### مسئله 1: سهمیه سرویس OpenAI تمام شده است
**علائم:** استقرار با خطای سهمیه متوقف می‌شود
**راه‌حل‌ها:**
```bash
# سهمیه‌های فعلی را بررسی کنید
az cognitiveservices usage list --location eastus

# درخواست افزایش سهمیه دهید یا منطقه‌ای دیگر را امتحان کنید
azd env set AZURE_LOCATION westus2
azd up
```

#### مسئله 2: مدل در منطقه در دسترس نیست
**علائم:** پاسخ‌های هوش مصنوعی خطا می‌دهند یا استقرار مدل ناموفق است
**راه‌حل‌ها:**
```bash
# در دسترس بودن مدل را بر اساس منطقه بررسی کنید
az cognitiveservices model list --location eastus

# به مدل موجود به‌روزرسانی کنید
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### مسئله 3: مشکلات مجوز
**علائم:** خطاهای 403 Forbidden هنگام فراخوانی سرویس‌های هوش مصنوعی
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

### مسائل عملکرد

#### مسئله 4: پاسخ‌های هوش مصنوعی کند
**گام‌های بررسی:**
1. متریک‌های عملکرد را در Application Insights بررسی کنید
2. متریک‌های سرویس OpenAI را در پورتال Azure مرور کنید
3. اتصال شبکه و تأخیر را بررسی کنید

**راه‌حل‌ها:**
- برای پرسش‌های رایج، کشینگ پیاده‌سازی کنید
- از مدل OpenAI مناسب برای مورد استفاده خود بهره ببرید
- در شرایط بار بالا از read replicaها استفاده کنید

### **تمرین آزمایشگاهی 6.1: چالش دیباگ**

**سناریو**: استقرار شما موفق بود، اما برنامه خطاهای 500 برمی‌گرداند.

**وظایف دیباگ:**
1. لاگ‌های برنامه را بررسی کنید
2. اتصال سرویس‌ها را تأیید کنید
3. احراز هویت را تست کنید
4. پیکربندی را بازبینی کنید

**ابزارهای مورد استفاده:**
- `azd show` برای نمای کلی استقرار
- پورتال Azure برای لاگ‌های دقیق سرویس
- Application Insights برای تله‌متری برنامه

## ماژول 7: نظارت و بهینه‌سازی

### مرحله 7.1: راه‌اندازی نظارت جامع

1. **ایجاد داشبوردهای سفارشی:**

به پورتال Azure بروید و داشبوردی ایجاد کنید شامل:
- شمار درخواست‌های OpenAI و تأخیر
- نرخ خطاهای برنامه
- استفاده از منابع
- پیگیری هزینه

2. **تنظیم هشدارها:**
```bash
# هشدار در مورد نرخ بالای خطا
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### مرحله 7.2: بهینه‌سازی هزینه

1. **تحلیل هزینه‌های فعلی:**
```bash
# از Azure CLI برای دریافت داده‌های هزینه استفاده کنید
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **اجرای کنترل‌های هزینه:**
- تنظیم هشدارهای بودجه
- استفاده از سیاست‌های autoscaling
- پیاده‌سازی کشینگ درخواست‌ها
- پیگیری مصرف توکن برای OpenAI

### **تمرین آزمایشگاهی 7.1: بهینه‌سازی عملکرد**

**وظیفه**: برنامه هوش مصنوعی خود را برای عملکرد و هزینه بهینه کنید.

**معیارهای قابل بهبود:**
- کاهش میانگین زمان پاسخ به میزان 20%
- کاهش هزینه ماهانه به میزان 15%
- حفظ 99.9% زمان در دسترس بودن

**استراتژی‌های پیشنهادی:**
- پیاده‌سازی کشینگ پاسخ‌ها
- بهینه کردن پرامپت‌ها برای کارایی توکن
- استفاده از SKUs محاسباتی مناسب
- راه‌اندازی autoscaling مناسب

## چالش نهایی: پیاده‌سازی انتها‌به‌انتها

### سناریوی چالش

شما مسئول ایجاد یک چت‌بات خدمات مشتری مبتنی بر هوش مصنوعی آماده تولید هستید با نیازمندی‌های زیر:

**نیازمندی‌های عملکردی:**
- رابط وب برای تعامل با مشتریان
- یکپارچه‌سازی با Microsoft Foundry Models برای پاسخ‌ها
- قابلیت جستجوی اسناد با استفاده از Cognitive Search
- یکپارچه‌سازی با پایگاه داده مشتری موجود
- پشتیبانی چندزبانه

**نیازمندی‌های غیرعملکردی:**
- پشتیبانی از 1000 کاربر همزمان
- SLA با 99.9% زمان در دسترس بودن
- انطباق SOC 2
- هزینه کمتر از $500/ماه
- استقرار در چند محیط (dev, staging, prod)

### مراحل پیاده‌سازی

1. **طراحی معماری**
2. **ایجاد قالب AZD**
3. **اجرای تدابیر امنیتی**
4. **راه‌اندازی نظارت و هشداردهی**
5. **ایجاد خطوط لوله استقرار**
6. **مستند کردن راه‌حل**

### معیارهای ارزیابی

- ✅ **عملکرد**: آیا تمام نیازمندی‌ها را برآورده می‌کند؟
- ✅ **امنیت**: آیا بهترین روش‌ها پیاده شده‌اند؟
- ✅ **مقیاس‌پذیری**: آیا می‌تواند بار را تحمل کند؟
- ✅ **قابلیت نگهداری**: آیا کد و زیرساخت منظم هستند؟
- ✅ **هزینه**: آیا در محدوده بودجه باقی می‌ماند؟

## منابع اضافی

### مستندات مایکروسافت
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### قالب‌های نمونه
- [برنامه چت مدل‌های Microsoft Foundry](https://github.com/Azure-Samples/azure-search-openai-demo)
- [شروع سریع اپلیکیشن چت OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [چت Contoso](https://github.com/Azure-Samples/contoso-chat)

### منابع جامعه
- [Discord مایکروسافت Foundry](https://discord.gg/microsoft-azure)
- [Azure Developer CLI در GitHub](https://github.com/Azure/azure-dev)
- [قالب‌های عالی AZD](https://azure.github.io/awesome-azd/)

## 🎓 گواهی اتمام

تبریک! شما آزمایشگاه کارگاه هوش مصنوعی را به پایان رساندید. اکنون باید بتوانید:

- ✅ تبدیل برنامه‌های موجود هوش مصنوعی به قالب‌های AZD
- ✅ استقرار برنامه‌های هوش مصنوعی آماده تولید
- ✅ پیاده‌سازی بهترین شیوه‌های امنیتی برای بارهای کاری هوش مصنوعی
- ✅ نظارت و بهینه‌سازی عملکرد برنامه‌های هوش مصنوعی
- ✅ رفع عیوب مسائل رایج در استقرار

### گام‌های بعدی
1. این الگوها را در پروژه‌های هوش مصنوعی خود به کار ببرید
2. قالب‌ها را به جامعه بازگردانید
3. برای پشتیبانی مستمر به Discord مایکروسافت Foundry بپیوندید
4. موضوعات پیشرفته مانند استقرار چندمنطقه‌ای را بررسی کنید

---

**بازخورد کارگاه**: با به‌اشتراک‌گذاری تجربهٔ خود در [کانال #Azure در Microsoft Foundry Discord](https://discord.gg/microsoft-azure) به ما در بهبود این کارگاه کمک کنید.

---

**ناوبری فصل:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل 2 - توسعه مبتنی بر هوش مصنوعی
- **⬅️ قبلی**: [استقرار مدل‌های هوش مصنوعی](ai-model-deployment.md)
- **➡️ بعدی**: [بهترین شیوه‌های هوش مصنوعی برای تولید](production-ai-practices.md)
- **🚀 فصل بعدی**: [فصل ۳: پیکربندی](../chapter-03-configuration/configuration.md)

**نیاز به کمک؟** به جامعه‌مان بپیوندید برای پشتیبانی و بحث در مورد استقرارهای AZD و هوش مصنوعی.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
این سند با استفاده از سرویس ترجمهٔ هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری آن باید به‌عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمهٔ حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوءتفاهم یا تفسیر نادرست ناشی از استفاده از این ترجمه مسئول نیستیم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->