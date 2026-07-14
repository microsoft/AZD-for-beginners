# آزمایشگاه کارگاه هوش مصنوعی: سازگار کردن راه‌حل‌های هوش مصنوعی شما با استقرار AZD

**ناوبری فصل:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل فعلی**: فصل ۲ - توسعه هوش مصنوعی محور
- **⬅️ قبلی**: [استقرار مدل هوش مصنوعی](ai-model-deployment.md)
- **➡️ بعدی**: [بهترین روش‌های هوش مصنوعی در تولید](production-ai-practices.md)
- **🚀 فصل بعدی**: [فصل ۳: پیکربندی](../chapter-03-configuration/configuration.md)

## مرور کلی کارگاه

این آزمایشگاه عملی توسعه‌دهندگان را از روند برداشتن یک قالب هوش مصنوعی موجود و استقرار آن با استفاده از Azure Developer CLI (AZD) راهنمایی می‌کند. شما الگوهای ضروری برای استقرار هوش مصنوعی در محیط تولید با استفاده از سرویس‌های Microsoft Foundry را خواهید آموخت.

> **یادداشت اعتبارسنجی (۱۳-۰۷-۲۰۲۶):** این کارگاه بر اساس نسخه `azd` `1.27.1` بررسی شده است. اگر نصب محلی شما قدیمی‌تر است، قبل از شروع AZD را به‌روزرسانی کنید تا روند احراز هویت، قالب و استقرار مطابق مراحل زیر باشد.

**مدت زمان:** ۲-۳ ساعت  
**سطح:** متوسط  
**پیش‌نیازها:** دانش پایه Azure، آشنایی با مفاهیم هوش مصنوعی/یادگیری ماشینی  

## 🎓 اهداف آموزشی

در پایان این کارگاه، شما قادر خواهید بود:
- ✅ تبدیل یک برنامه هوش مصنوعی موجود برای استفاده از قالب‌های AZD
- ✅ پیکربندی سرویس‌های Microsoft Foundry با AZD
- ✅ پیاده‌سازی مدیریت امن مدارک برای سرویس‌های هوش مصنوعی
- ✅ استقرار برنامه‌های هوش مصنوعی آماده تولید با مانیتورینگ
- ✅ عیب‌یابی مشکلات رایج استقرار هوش مصنوعی

## پیش‌نیازها

### ابزارهای موردنیاز
- نصب [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- نصب [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- نصب [Git](https://git-scm.com/)
- ویرایشگر کد (توصیه شده VS Code)

### منابع Azure
- اشتراک Azure با دسترسی نقش مشارکت‌کننده
- دسترسی به سرویس‌های Microsoft Foundry Models (یا توانایی درخواست دسترسی)
- مجوزهای ایجاد گروه منابع

### دانش پیش‌زمینه
- درک پایه‌ای از خدمات Azure
- آشنایی با رابط‌های خط فرمان
- مفاهیم پایه AI/ML (APIها، مدل‌ها، درخواست‌ها)

## راه‌اندازی آزمایشگاه

### گام ۱: آماده‌سازی محیط

1. **بررسی نصب ابزارها:**
```bash
# نصب AZD را بررسی کنید
azd version

# Azure CLI را بررسی کنید
az --version

# برای گردش‌کارهای AZD وارد Azure شوید
azd auth login

# فقط اگر قصد دارید در طول عیب‌یابی دستورهای az را اجرا کنید، وارد Azure CLI شوید
az login
```

اگر در چند مستأجر کار می‌کنید یا اشتراک شما به صورت خودکار شناسایی نشد، با `azd auth login --tenant-id <tenant-id>` دوباره تلاش کنید.

2. **کلون کردن مخزن کارگاه:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## ماژول ۱: درک ساختار AZD برای برنامه‌های هوش مصنوعی

### آناتومی یک قالب AZD هوش مصنوعی

فایل‌های کلیدی در یک قالب AZD آماده برای هوش مصنوعی را بررسی کنید:

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

### **تمرین آزمایشگاهی ۱.۱: کاوش پیکربندی**

1. **فایل azure.yaml را بررسی کنید:**
```bash
cat azure.yaml
```

**موارد مورد توجه:**
- تعریف سرویس‌ها برای مؤلفه‌های هوش مصنوعی
- نگاشت متغیرهای محیطی
- پیکربندی میزبان

2. **زیرساخت main.bicep را مرور کنید:**
```bash
cat infra/main.bicep
```

**الگوهای کلیدی هوش مصنوعی برای شناسایی:**
- فراهم‌سازی سرویس Microsoft Foundry Models
- ادغام جستجوی Azure AI
- مدیریت کلید امن
- پیکربندی امنیت شبکه

### **نکته‌ی بحث:** اهمیت این الگوها برای هوش مصنوعی

- **وابستگی سرویس‌ها**: برنامه‌های هوش مصنوعی اغلب نیاز به چند سرویس هماهنگ دارند
- **امنیت**: کلیدها و نقاط پایانی API نیازمند مدیریت امن هستند
- **مقیاس‌پذیری**: بارهای کاری هوش مصنوعی نیازهای خاص مقیاس‌پذیری دارند
- **مدیریت هزینه**: سرویس‌های هوش مصنوعی اگر درست پیکربندی نشوند می‌توانند هزینه‌بر باشند

## ماژول ۲: استقرار اولین برنامه هوش مصنوعی شما

### گام ۲.۱: راه‌اندازی محیط

1. **ایجاد یک محیط جدید AZD:**
```bash
azd env new myai-workshop
```

2. **تنظیم پارامترهای موردنیاز:**
```bash
# منطقه مورد علاقه خود در Azure را تنظیم کنید
azd env set AZURE_LOCATION eastus

# اختیاری: مدل خاص OpenAI را تنظیم کنید
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### گام ۲.۲: استقرار زیرساخت و برنامه

1. **استقرار با AZD:**
```bash
azd up
```

**در حین اجرای `azd up` چه اتفاقی می‌افتد:**
- ✅ فراهم‌سازی سرویس Microsoft Foundry Models
- ✅ ایجاد سرویس Azure AI Search
- ✅ راه‌اندازی App Service برای برنامه وب
- ✅ پیکربندی شبکه و امنیت
- ✅ استقرار کد برنامه
- ✅ راه‌اندازی مانیتورینگ و لاگ‌برداری

2. **مانیتورینگ پیشرفت استقرار** و توجه به منابع در حال ایجاد.

### گام ۲.۳: تایید استقرار شما

1. **بررسی منابع مستقر شده:**
```bash
azd show
```

2. **باز کردن برنامه مستقر شده:**
```bash
azd show
```

نقطه انتهای وب نشان داده شده در خروجی `azd show` را باز کنید.

3. **آزمایش عملکرد هوش مصنوعی:**
   - به برنامه وب بروید
   - پرسش‌های نمونه را امتحان کنید
   - تایید کنید پاسخ‌های هوش مصنوعی به درستی کار می‌کنند

### **تمرین آزمایشگاهی ۲.۱: تمرین عیب‌یابی**

**سناریو**: استقرار شما موفق بود اما هوش مصنوعی پاسخ نمی‌دهد.

**مسائل رایج برای بررسی:**
1. **کلیدهای API OpenAI**: بررسی کنید که به درستی تنظیم شده‌اند
2. **دسترس‌پذیری مدل**: بررسی کنید منطقه شما مدل را پشتیبانی می‌کند یا خیر
3. **اتصال شبکه**: اطمینان حاصل کنید سرویس‌ها می‌توانند ارتباط برقرار کنند
4. **مجوزهای RBAC**: اطمینان از اینکه برنامه به OpenAI دسترسی دارد

**دستورات اشکال‌زدایی:**
```bash
# بررسی متغیرهای محیطی
azd env get-values

# مشاهده گزارش‌های استقرار
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# بررسی وضعیت استقرار OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## ماژول ۳: شخصی‌سازی برنامه‌های هوش مصنوعی برای نیازهای شما

### گام ۳.۱: تغییر پیکربندی هوش مصنوعی

1. **به‌روزرسانی مدل OpenAI:**
```bash
# تغییر به مدل دیگر (در صورت موجود بودن در منطقه شما)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# استقرار مجدد با پیکربندی جدید
azd deploy
```

2. **افزودن سرویس‌های هوش مصنوعی اضافی:**

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

### گام ۳.۲: پیکربندی‌های خاص محیط

**بهترین روش:** پیکربندی‌های متفاوت برای توسعه و تولید.

1. **ایجاد محیط تولید:**
```bash
azd env new myai-production
```

2. **تنظیم پارامترهای مخصوص تولید:**
```bash
# تولید معمولاً از شناسه‌های کالا (SKU) بالاتر استفاده می‌کند
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# فعال‌سازی امکانات امنیتی اضافی
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **تمرین آزمایشگاهی ۳.۱: بهینه‌سازی هزینه**

**چالش:** قالب را به گونه‌ای پیکربندی کنید که توسعه کم‌هزینه باشد.

**وظایف:**
1. تعیین کنید کدام SKUها می‌توانند در رده آزاد/پایه تنظیم شوند
2. پیکربندی متغیرهای محیطی برای حداقل هزینه
3. استقرار و مقایسه هزینه‌ها با پیکربندی تولید

**راهنمایی‌های راه‌حل:**
- استفاده از رده F0 (رایگان) برای سرویس‌های Azure AI در صورت امکان
- استفاده از رده پایه برای سرویس جستجو در توسعه
- در نظر گرفتن برنامه مصرف برای Functions

## ماژول ۴: امنیت و بهترین روش‌های تولید

### گام ۴.۱: مدیریت امن مدارک

**چالش فعلی:** بسیاری از برنامه‌های هوش مصنوعی کلیدهای API را به صورت کد سخت‌افزاری یا در ذخیره‌سازی ناامن استفاده می‌کنند.

**راه‌حل AZD:** شناسه مدیریت شده + ادغام Key Vault.

1. **بررسی پیکربندی امنیتی در قالب خود:**
```bash
# به دنبال پیکربندی مخزن کلید و هویت مدیریت شده باشید
grep -r "keyVault\|managedIdentity" infra/
```

2. **تأیید عملکرد شناسه مدیریت شده:**
```bash
# بررسی کنید که برنامه وب دارای پیکربندی هویت صحیح باشد
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### گام ۴.۲: امنیت شبکه

1. **فعال‌سازی نقاط پایانی خصوصی** (اگر قبلاً پیکربندی نشده است):

افزودن به قالب بایسپ خود:
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

### گام ۴.۳: مانیتورینگ و قابل مشاهده بودن

1. **پیکربندی Application Insights:**
```bash
# باید Application Insights به‌طور خودکار پیکربندی شود
# پیکربندی را بررسی کنید:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **راه‌اندازی مانیتورینگ مخصوص هوش مصنوعی:**

افزودن معیارهای سفارشی برای عملیات هوش مصنوعی:
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

### **تمرین آزمایشگاهی ۴.۱: ممیزی امنیتی**

**وظیفه:** استقرار خود را از حیث بهترین روش‌های امنیتی بازبینی کنید.

**چک‌لیست:**
- [ ] بدون رازهای کدگذاری شده در کد یا پیکربندی
- [ ] استفاده از شناسه مدیریت شده برای احراز هویت سرویس به سرویس
- [ ] ذخیره داده‌های حساس در Key Vault
- [ ] محدودیت درست دسترسی شبکه
- [ ] فعال بودن مانیتورینگ و لاگ‌برداری

## ماژول ۵: تبدیل برنامه هوش مصنوعی خودتان

### گام ۵.۱: برگه ارزیابی

**قبل از تبدیل برنامه‌تان**، به این سوالات پاسخ دهید:

1. **معماری برنامه:**
   - برنامه شما از کدام سرویس‌های هوش مصنوعی استفاده می‌کند؟
   - به چه منابع محاسباتی نیاز دارد؟
   - آیا نیاز به پایگاه داده دارد؟
   - وابستگی بین سرویس‌ها چیست؟

2. **نیازهای امنیتی:**
   - برنامه شما با چه داده‌های حساسی سروکار دارد؟
   - چه الزامات تطبیقی دارید؟
   - آیا نیاز به شبکه خصوصی دارید؟

3. **نیازهای مقیاس‌پذیری:**
   - بار مورد انتظار شما چقدر است؟
   - آیا نیاز به مقیاس‌پذیری خودکار دارید؟
   - الزامات منطقه‌ای دارد؟

### گام ۵.۲: ایجاد قالب AZD خودتان

**الگوی زیر را برای تبدیل برنامه‌تان دنبال کنید:**

1. **ساختار پایه را ایجاد کنید:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# مقداردهی اولیه قالب AZD
azd init --template minimal
```

2. **azure.yaml را ایجاد کنید:**
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

3. **قالب‌های زیرساخت را ایجاد کنید:**

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

### **تمرین آزمایشگاهی ۵.۱: چالش ساخت قالب**

**چالش:** یک قالب AZD برای برنامه هوش مصنوعی پردازش اسناد بسازید.

**الزامات:**
- Microsoft Foundry Models برای تحلیل محتوا
- Document Intelligence برای OCR
- حساب ذخیره‌سازی برای آپلود اسناد
- برنامه Function برای منطق پردازش
- برنامه وب برای رابط کاربری

**امتیازهای اضافی:**
- افزودن مدیریت خطا مناسب
- شامل برآورد هزینه
- راه‌اندازی داشبوردهای مانیتورینگ

## ماژول ۶: عیب‌یابی مسائل رایج

### مشکلات رایج در استقرار

#### مشکل ۱: فراتر رفتن سهمیه سرویس OpenAI
**علائم:** استقرار با خطای سهمیه مواجه می‌شود
**راه‌حل‌ها:**
```bash
# بررسی سهمیه‌های فعلی
az cognitiveservices usage list --location eastus

# درخواست افزایش سهمیه یا امتحان منطقه‌ای دیگر
azd env set AZURE_LOCATION westus2
azd up
```

#### مشکل ۲: مدل در منطقه در دسترس نیست
**علائم:** پاسخ‌های هوش مصنوعی شکست می‌خورند یا خطاهای استقرار مدل
**راه‌حل‌ها:**
```bash
# بررسی در دسترس بودن مدل بر اساس منطقه
az cognitiveservices model list --location eastus

# به‌روزرسانی به مدل در دسترس
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### مشکل ۳: مسائل مجوزی
**علائم:** خطاهای ۴۰۳ ممنوع هنگام فراخوانی سرویس‌های هوش مصنوعی
**راه‌حل‌ها:**
```bash
# بررسی انتساب نقش‌ها
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# افزودن نقش‌های مفقود شده
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### مشکلات عملکرد

#### مشکل ۴: پاسخ‌های کند هوش مصنوعی
**گام‌های بررسی:**
1. بررسی معیارهای عملکرد در Application Insights
2. مرور معیارهای سرویس OpenAI در پورتال Azure
3. تأیید اتصال شبکه و تأخیر

**راه‌حل‌ها:**
- پیاده‌سازی کش برای پرسش‌های رایج
- استفاده از مدل مناسب OpenAI برای مورد استفاده خود
- در نظر گرفتن نسخه‌های خواندن برای شرایط بار بالا

### **تمرین آزمایشگاهی ۶.۱: چالش اشکال‌زدایی**

**سناریو:** استقرار موفق بود، اما برنامه خطاهای ۵۰۰ برمی‌گرداند.

**وظایف اشکال‌زدایی:**
1. بررسی لاگ‌های برنامه
2. تأیید اتصال به سرویس‌ها
3. آزمایش احراز هویت
4. بررسی پیکربندی

**ابزارهای مورد استفاده:**
- `azd show` برای مرور استقرار
- پورتال Azure برای لاگ‌های جزئی سرویس
- Application Insights برای تله‌متری برنامه

## ماژول ۷: مانیتورینگ و بهینه‌سازی

### گام ۷.۱: راه‌اندازی مانیتورینگ جامع

1. **ایجاد داشبوردهای سفارشی:**

به پورتال Azure بروید و یک داشبورد با موارد زیر ایجاد کنید:
- تعداد درخواست‌ها و تأخیر OpenAI
- نرخ خطاهای برنامه
- استفاده منابع
- پیگیری هزینه

2. **راه‌اندازی هشدارها:**
```bash
# هشدار برای نرخ بالای خطا
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### گام ۷.۲: بهینه‌سازی هزینه

1. **تحلیل هزینه‌های جاری:**
```bash
# استفاده از Azure CLI برای دریافت داده‌های هزینه
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **اجرای کنترل‌های هزینه:**
- راه‌اندازی هشدارهای بودجه
- استفاده از سیاست‌های مقیاس‌پذیری خودکار
- پیاده‌سازی کش درخواست‌ها
- مانیتورینگ مصرف توکن برای OpenAI

### **تمرین آزمایشگاهی ۷.۱: بهینه‌سازی عملکرد**

**وظیفه:** برنامه هوش مصنوعی خود را برای عملکرد و هزینه بهینه کنید.

**معیارهای بهبود:**
- کاهش میانگین زمان پاسخ ۲۰٪
- کاهش هزینه ماهانه ۱۵٪
- حفظ زمان آپ‌تایم ۹۹.۹٪

**استراتژی‌های پیشنهادی:**
- پیاده‌سازی کش پاسخ‌ها
- بهینه‌سازی درخواست‌ها برای کارایی توکن
- استفاده از SKUهای محاسباتی مناسب
- راه‌اندازی مقیاس‌پذیری خودکار درست

## چالش نهایی: پیاده‌سازی از ابتدا تا انتها

### سناریوی چالش

مأموریت دارید یک چت‌بات خدمات مشتری هوش مصنوعی آماده تولید با این الزامات بسازید:

**الزامات عملکردی:**
- رابط وب برای تعامل با مشتریان
- ادغام با Microsoft Foundry Models برای پاسخ‌ها
- قابلیت جستجوی اسناد با استفاده از Azure AI Search
- ادغام با پایگاه داده مشتری موجود
- پشتیبانی چندزبانه

**الزامات غیر عملکردی:**
- مدیریت ۱۰۰۰ کاربر همزمان
- SLA با آپ‌تایم ۹۹.۹٪
- تطابق با SOC 2
- هزینه ماهانه زیر ۵۰۰ دلار
- استقرار در چند محیط (توسعه، آزمایشی، تولید)

### مراحل پیاده‌سازی

1. **طراحی معماری**
2. **ایجاد قالب AZD**
3. **اجرای تدابیر امنیتی**
4. **راه‌اندازی مانیتورینگ و هشدار**
5. **ایجاد خط لوله‌های استقرار**
6. **مستندسازی راه‌حل**

### معیارهای ارزیابی

- ✅ **عملکرد**: آیا تمام الزامات را دارد؟
- ✅ **امنیت**: آیا بهترین روش‌ها پیاده شده‌اند؟
- ✅ **مقیاس‌پذیری**: آیا می‌تواند بار را مدیریت کند؟
- ✅ **نگهداری‌پذیری**: آیا کد و زیرساخت به خوبی سازماندهی شده‌اند؟
- ✅ **هزینه**: آیا در بودجه باقی می‌ماند؟

## منابع اضافی

### مستندات مایکروسافت
- [مستندات Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [مستندات سرویس Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [مستندات Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### قالب‌های نمونه
- [برنامه چت Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)
- [شروع سریع برنامه چت OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [گفتگوی Contoso](https://github.com/Azure-Samples/contoso-chat)

### منابع جامعه
- [Discord مایکروسافت Foundry](https://discord.gg/microsoft-azure)
- [GitHub ابزار خط فرمان توسعه‌دهنده Azure](https://github.com/Azure/azure-dev)
- [قالب‌های عالی AZD](https://azure.github.io/awesome-azd/)

## 🎓 گواهی اتمام

تبریک! شما کارگاه هوش مصنوعی را به پایان رسانده‌اید. اکنون باید بتوانید:

- ✅ تبدیل برنامه‌های موجود هوش مصنوعی به قالب‌های AZD
- ✅ استقرار برنامه‌های هوش مصنوعی آماده برای تولید
- ✅ اجرای بهترین روش‌های امنیتی برای بارهای کاری هوش مصنوعی
- ✅ نظارت و بهینه‌سازی عملکرد برنامه‌های هوش مصنوعی
- ✅ رفع مشکلات رایج استقرار

### مراحل بعدی
1. این الگوها را در پروژه‌های هوش مصنوعی خود اعمال کنید
2. قالب‌ها را به جامعه بازگردانید
3. به Discord مایکروسافت Foundry برای حمایت‌های مداوم بپیوندید
4. موضوعات پیشرفته‌ای مانند استقرار در چند منطقه را بررسی کنید

---

**بازخورد کارگاه**: با به اشتراک گذاشتن تجربه خود در [کانال Azure در Discord مایکروسافت Foundry](https://discord.gg/microsoft-azure) به ما کمک کنید این کارگاه را بهبود بخشیم.

---

**ناوبری فصل:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل فعلی**: فصل ۲ - توسعه اول هوش مصنوعی
- **⬅️ قبلی**: [استقرار مدل هوش مصنوعی](ai-model-deployment.md)
- **➡️ بعدی**: [بهترین روش‌های هوش مصنوعی برای تولید](production-ai-practices.md)
- **🚀 فصل بعدی**: [فصل ۳: پیکربندی](../chapter-03-configuration/configuration.md)

**نیاز به کمک؟** به جامعه ما بپیوندید برای حمایت و بحث درباره استقرار AZD و هوش مصنوعی.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->