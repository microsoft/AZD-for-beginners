<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ed84aca3294b926341ef9e0a5a78059e",
  "translation_date": "2025-09-17T16:21:06+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "fa"
}
-->
# کارگاه آزمایشگاهی هوش مصنوعی: آماده‌سازی راه‌حل‌های هوش مصنوعی برای استقرار با AZD

**فهرست فصل‌ها:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل فعلی**: فصل ۲ - توسعه مبتنی بر هوش مصنوعی
- **⬅️ قبلی**: [استقرار مدل هوش مصنوعی](ai-model-deployment.md)
- **➡️ بعدی**: [بهترین روش‌های تولید هوش مصنوعی](production-ai-practices.md)
- **🚀 فصل بعدی**: [فصل ۳: پیکربندی](../getting-started/configuration.md)

## نمای کلی کارگاه

این آزمایشگاه عملی، توسعه‌دهندگان را در فرآیند تبدیل یک برنامه هوش مصنوعی موجود به برنامه‌ای که قابل استقرار با استفاده از Azure Developer CLI (AZD) باشد، راهنمایی می‌کند. شما الگوهای ضروری برای استقرار هوش مصنوعی در محیط تولید با استفاده از خدمات Azure AI Foundry را یاد خواهید گرفت.

**مدت زمان:** ۲-۳ ساعت  
**سطح:** متوسط  
**پیش‌نیازها:** دانش پایه‌ای از Azure، آشنایی با مفاهیم هوش مصنوعی/یادگیری ماشین

## 🎓 اهداف آموزشی

در پایان این کارگاه، شما قادر خواهید بود:
- ✅ تبدیل یک برنامه هوش مصنوعی موجود به استفاده از الگوهای AZD
- ✅ پیکربندی خدمات Azure AI Foundry با AZD
- ✅ پیاده‌سازی مدیریت امن اعتبارنامه برای خدمات هوش مصنوعی
- ✅ استقرار برنامه‌های هوش مصنوعی آماده تولید با نظارت
- ✅ رفع مشکلات رایج در استقرار هوش مصنوعی

## پیش‌نیازها

### ابزارهای مورد نیاز
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) نصب شده
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) نصب شده
- [Git](https://git-scm.com/) نصب شده
- ویرایشگر کد (VS Code توصیه می‌شود)

### منابع Azure
- اشتراک Azure با دسترسی مشارکت‌کننده
- دسترسی به خدمات Azure OpenAI (یا توانایی درخواست دسترسی)
- مجوزهای ایجاد گروه منابع

### دانش مورد نیاز
- درک پایه‌ای از خدمات Azure
- آشنایی با رابط‌های خط فرمان
- مفاهیم پایه‌ای هوش مصنوعی/یادگیری ماشین (API‌ها، مدل‌ها، پرامپت‌ها)

## تنظیم آزمایشگاه

### مرحله ۱: آماده‌سازی محیط

۱. **بررسی نصب ابزارها:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

۲. **کلون کردن مخزن کارگاه:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## ماژول ۱: درک ساختار AZD برای برنامه‌های هوش مصنوعی

### ساختار یک الگوی AZD آماده هوش مصنوعی

بررسی فایل‌های کلیدی در یک الگوی AZD آماده هوش مصنوعی:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **تمرین آزمایشگاهی ۱.۱: بررسی پیکربندی**

۱. **بررسی فایل azure.yaml:**
```bash
cat azure.yaml
```

**مواردی که باید بررسی کنید:**
- تعریف خدمات برای اجزای هوش مصنوعی
- نگاشت متغیرهای محیطی
- پیکربندی میزبان

۲. **بررسی زیرساخت main.bicep:**
```bash
cat infra/main.bicep
```

**الگوهای کلیدی هوش مصنوعی که باید شناسایی شوند:**
- ایجاد خدمات Azure OpenAI
- یکپارچه‌سازی جستجوی شناختی
- مدیریت امن کلیدها
- پیکربندی امنیت شبکه

### **نقطه بحث:** چرا این الگوها برای هوش مصنوعی مهم هستند

- **وابستگی‌های خدمات**: برنامه‌های هوش مصنوعی اغلب به خدمات هماهنگ متعددی نیاز دارند
- **امنیت**: کلیدهای API و نقاط پایانی نیاز به مدیریت امن دارند
- **مقیاس‌پذیری**: بارهای کاری هوش مصنوعی نیازهای مقیاس‌پذیری منحصر به فردی دارند
- **مدیریت هزینه**: خدمات هوش مصنوعی می‌توانند گران باشند اگر به درستی پیکربندی نشوند

## ماژول ۲: استقرار اولین برنامه هوش مصنوعی شما

### مرحله ۲.۱: راه‌اندازی محیط

۱. **ایجاد یک محیط جدید AZD:**
```bash
azd env new myai-workshop
```

۲. **تنظیم پارامترهای مورد نیاز:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### مرحله ۲.۲: استقرار زیرساخت و برنامه

۱. **استقرار با AZD:**
```bash
azd up
```

**آنچه در طول `azd up` اتفاق می‌افتد:**
- ✅ ایجاد خدمات Azure OpenAI
- ✅ ایجاد خدمات جستجوی شناختی
- ✅ تنظیم App Service برای برنامه وب
- ✅ پیکربندی شبکه و امنیت
- ✅ استقرار کد برنامه
- ✅ تنظیم نظارت و ثبت وقایع

۲. **نظارت بر پیشرفت استقرار** و یادداشت منابع ایجاد شده.

### مرحله ۲.۳: بررسی استقرار شما

۱. **بررسی منابع مستقر شده:**
```bash
azd show
```

۲. **باز کردن برنامه مستقر شده:**
```bash
azd show --output json | grep "webAppUrl"
```

۳. **آزمایش عملکرد هوش مصنوعی:**
   - به برنامه وب مراجعه کنید
   - پرسش‌های نمونه را امتحان کنید
   - بررسی کنید که پاسخ‌های هوش مصنوعی کار می‌کنند

### **تمرین آزمایشگاهی ۲.۱: تمرین رفع اشکال**

**سناریو**: استقرار شما موفقیت‌آمیز بوده اما هوش مصنوعی پاسخ نمی‌دهد.

**مشکلات رایج برای بررسی:**
۱. **کلیدهای API OpenAI**: بررسی کنید که به درستی تنظیم شده‌اند
۲. **دسترسی مدل**: بررسی کنید که آیا منطقه شما از مدل پشتیبانی می‌کند
۳. **اتصال شبکه**: اطمینان حاصل کنید که خدمات می‌توانند ارتباط برقرار کنند
۴. **مجوزهای RBAC**: بررسی کنید که برنامه می‌تواند به OpenAI دسترسی داشته باشد

**دستورات رفع اشکال:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## ماژول ۳: سفارشی‌سازی برنامه‌های هوش مصنوعی برای نیازهای شما

### مرحله ۳.۱: تغییر پیکربندی هوش مصنوعی

۱. **به‌روزرسانی مدل OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

۲. **افزودن خدمات هوش مصنوعی اضافی:**

ویرایش `infra/main.bicep` برای افزودن Document Intelligence:

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

### مرحله ۳.۲: پیکربندی‌های خاص محیط

**بهترین روش**: پیکربندی‌های متفاوت برای توسعه و تولید.

۱. **ایجاد یک محیط تولید:**
```bash
azd env new myai-production
```

۲. **تنظیم پارامترهای خاص تولید:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **تمرین آزمایشگاهی ۳.۱: بهینه‌سازی هزینه**

**چالش**: پیکربندی الگو برای توسعه با هزینه کم.

**وظایف:**
۱. شناسایی SKUهایی که می‌توانند به سطوح رایگان/پایه تنظیم شوند
۲. پیکربندی متغیرهای محیطی برای هزینه کم
۳. استقرار و مقایسه هزینه‌ها با پیکربندی تولید

**راهنمایی‌های حل:**
- استفاده از سطح F0 (رایگان) برای خدمات شناختی در صورت امکان
- استفاده از سطح Basic برای خدمات جستجو در توسعه
- در نظر گرفتن استفاده از برنامه مصرفی برای Functions

## ماژول ۴: امنیت و بهترین روش‌های تولید

### مرحله ۴.۱: مدیریت امن اعتبارنامه‌ها

**چالش فعلی**: بسیاری از برنامه‌های هوش مصنوعی کلیدهای API را به صورت سخت‌کد شده یا در ذخیره‌سازی ناامن استفاده می‌کنند.

**راه‌حل AZD**: یکپارچه‌سازی Managed Identity + Key Vault.

۱. **بررسی پیکربندی امنیتی در الگوی خود:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

۲. **بررسی عملکرد Managed Identity:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### مرحله ۴.۲: امنیت شبکه

۱. **فعال‌سازی نقاط پایانی خصوصی** (در صورت عدم پیکربندی):

افزودن به الگوی bicep:
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

### مرحله ۴.۳: نظارت و مشاهده‌پذیری

۱. **پیکربندی Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

۲. **تنظیم نظارت خاص هوش مصنوعی:**

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

**وظیفه**: بررسی استقرار خود برای بهترین روش‌های امنیتی.

**چک‌لیست:**
- [ ] هیچ راز سخت‌کد شده‌ای در کد یا پیکربندی وجود ندارد
- [ ] Managed Identity برای احراز هویت سرویس به سرویس استفاده شده است
- [ ] Key Vault تنظیمات حساس را ذخیره می‌کند
- [ ] دسترسی شبکه به درستی محدود شده است
- [ ] نظارت و ثبت وقایع فعال شده است

## ماژول ۵: تبدیل برنامه هوش مصنوعی خود

### مرحله ۵.۱: برگه ارزیابی

**قبل از تبدیل برنامه خود**، به این سوالات پاسخ دهید:

۱. **معماری برنامه:**
   - برنامه شما از چه خدمات هوش مصنوعی استفاده می‌کند؟
   - به چه منابع محاسباتی نیاز دارد؟
   - آیا به پایگاه داده نیاز دارد؟
   - وابستگی‌های بین خدمات چیست؟

۲. **نیازهای امنیتی:**
   - برنامه شما چه داده‌های حساسی را مدیریت می‌کند؟
   - چه الزامات انطباقی دارید؟
   - آیا به شبکه خصوصی نیاز دارید؟

۳. **نیازهای مقیاس‌پذیری:**
   - بار مورد انتظار شما چیست؟
   - آیا به مقیاس‌پذیری خودکار نیاز دارید؟
   - آیا الزامات منطقه‌ای وجود دارد؟

### مرحله ۵.۲: ایجاد الگوی AZD خود

**برای تبدیل برنامه خود از این الگو پیروی کنید:**

۱. **ایجاد ساختار پایه:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal
```

۲. **ایجاد azure.yaml:**
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

۳. **ایجاد الگوهای زیرساخت:**

**infra/main.bicep** - الگوی اصلی:
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

### **تمرین آزمایشگاهی ۵.۱: چالش ایجاد الگو**

**چالش**: ایجاد یک الگوی AZD برای یک برنامه هوش مصنوعی پردازش اسناد.

**نیازمندی‌ها:**
- Azure OpenAI برای تحلیل محتوا
- Document Intelligence برای OCR
- Storage Account برای آپلود اسناد
- Function App برای منطق پردازش
- برنامه وب برای رابط کاربری

**امتیاز اضافی:**
- افزودن مدیریت خطا مناسب
- شامل تخمین هزینه
- تنظیم داشبوردهای نظارت

## ماژول ۶: رفع مشکلات رایج

### مشکلات رایج استقرار

#### مشکل ۱: سهمیه خدمات OpenAI تمام شده
**علائم:** استقرار با خطای سهمیه شکست می‌خورد  
**راه‌حل‌ها:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### مشکل ۲: مدل در منطقه موجود نیست
**علائم:** پاسخ‌های هوش مصنوعی شکست می‌خورند یا خطاهای استقرار مدل  
**راه‌حل‌ها:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### مشکل ۳: مشکلات مجوز
**علائم:** خطاهای ۴۰۳ Forbidden هنگام فراخوانی خدمات هوش مصنوعی  
**راه‌حل‌ها:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### مشکلات عملکرد

#### مشکل ۴: پاسخ‌های کند هوش مصنوعی
**مراحل بررسی:**
۱. بررسی معیارهای عملکرد در Application Insights
۲. بررسی معیارهای خدمات OpenAI در پورتال Azure
۳. بررسی اتصال شبکه و تأخیر

**راه‌حل‌ها:**
- پیاده‌سازی کش برای پرسش‌های رایج
- استفاده از مدل OpenAI مناسب برای مورد استفاده شما
- در نظر گرفتن نسخه‌های خواندنی برای سناریوهای بار بالا

### **تمرین آزمایشگاهی ۶.۱: چالش رفع اشکال**

**سناریو**: استقرار شما موفقیت‌آمیز بوده، اما برنامه خطاهای ۵۰۰ بازمی‌گرداند.

**وظایف رفع اشکال:**
۱. بررسی لاگ‌های برنامه
۲. بررسی اتصال خدمات
۳. آزمایش احراز هویت
۴. بررسی پیکربندی

**ابزارهایی که باید استفاده کنید:**
- `azd show` برای نمای کلی استقرار
- پورتال Azure برای لاگ‌های دقیق خدمات
- Application Insights برای تله‌متری برنامه

## ماژول ۷: نظارت و بهینه‌سازی

### مرحله ۷.۱: تنظیم نظارت جامع

۱. **ایجاد داشبوردهای سفارشی:**

به پورتال Azure بروید و داشبوردی با موارد زیر ایجاد کنید:
- تعداد درخواست‌های OpenAI و تأخیر
- نرخ خطاهای برنامه
- استفاده از منابع
- ردیابی هزینه

۲. **تنظیم هشدارها:**
```bash
# Alert for high error rate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### مرحله ۷.۲: بهینه‌سازی هزینه

۱. **تحلیل هزینه‌های فعلی:**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

۲. **اجرای کنترل‌های هزینه:**
- تنظیم هشدارهای بودجه
- استفاده از سیاست‌های مقیاس‌پذیری خودکار
- پیاده‌سازی کش درخواست‌ها
- نظارت بر استفاده از توکن برای OpenAI

### **تمرین آزمایشگاهی ۷.۱: بهینه‌سازی عملکرد**

**وظیفه**: برنامه هوش مصنوعی خود را برای عملکرد و هزینه بهینه کنید.

**معیارهایی که باید بهبود یابند:**
- کاهش زمان پاسخ متوسط به میزان ۲۰٪
- کاهش هزینه‌های ماهانه به میزان ۱۵٪
- حفظ آپتایم ۹۹.۹٪

**استراتژی‌هایی که باید امتحان کنید:**
- پیاده‌سازی کش پاسخ‌ها
- بهینه‌سازی پرامپت‌ها برای کارایی توکن
- استفاده از SKUهای محاسباتی مناسب
- تنظیم مقیاس‌پذیری خودکار مناسب

## چالش نهایی: پیاده‌سازی کامل

### سناریوی چالش

وظیفه شما ایجاد یک چت‌بات خدمات مشتری مبتنی بر هوش مصنوعی آماده تولید با این نیازها است:

**نیازمندی‌های عملکردی:**
- رابط وب برای تعاملات مشتری
- یکپارچه‌سازی با Azure OpenAI برای پاسخ‌ها
- قابلیت جستجوی اسناد با استفاده از جستجوی شناختی
- یکپارچه‌سازی با پایگاه داده مشتری موجود
- پشتیبانی چندزبانه

**نیازمندی‌های غیرعملکردی:**
- مدیریت ۱۰۰۰ کاربر همزمان
- SLA آپتایم ۹۹.۹٪
- انطباق با SOC 2
- هزینه کمتر از ۵۰۰ دلار در ماه
- استقرار در محیط‌های متعدد (توسعه، آزمایش، تولید)

### مراحل پیاده‌سازی

۱. **طراحی معماری**
۲. **ایجاد الگوی AZD**
۳. **اجرای اقدامات امنیتی**
۴. **تنظیم نظارت و هشدارها**
۵. **ایجاد خطوط لوله استقرار**
۶. **مستندسازی راه‌حل**

### معیارهای ارزیابی

- ✅ **عملکرد**: آیا تمام نیازها را برآورده می‌کند؟
- ✅ **امنیت**: آیا بهترین روش‌ها اجرا شده‌اند؟
- ✅ **مقیاس‌پذیری**: آیا می‌تواند بار را مدیریت کند؟
- ✅ **نگهداری‌پذیری**: آیا کد و زیرساخت به خوبی سازماندهی شده‌اند؟
- ✅ **هزینه**: آیا در محدوده بودجه باقی می‌ماند؟

## منابع اضافی

### مستندات مایکروسافت
- [مستندات Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [مستندات خدمات Azure OpenAI](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [مستندات Azure AI Foundry](https://learn.microsoft.com/azure/ai-studio/)

### الگوهای نمونه
- [برنامه چت Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)
- [شروع سریع برنامه چت OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [چت Contoso](https://github.com/Azure-Samples/contoso-chat)

### منابع جامعه
- [Discord Azure AI Foundry](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)  
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)  

## 🎓 گواهی تکمیل دوره  

تبریک! شما کارگاه آموزشی هوش مصنوعی را به پایان رساندید. اکنون باید بتوانید:  

- ✅ تبدیل برنامه‌های هوش مصنوعی موجود به قالب‌های AZD  
- ✅ استقرار برنامه‌های هوش مصنوعی آماده تولید  
- ✅ اجرای بهترین شیوه‌های امنیتی برای بارهای کاری هوش مصنوعی  
- ✅ نظارت و بهینه‌سازی عملکرد برنامه‌های هوش مصنوعی  
- ✅ رفع مشکلات رایج در استقرار  

### مراحل بعدی  
1. این الگوها را در پروژه‌های هوش مصنوعی خود اعمال کنید  
2. قالب‌ها را به جامعه بازگردانید  
3. به دیسکورد Azure AI Foundry بپیوندید برای پشتیبانی مداوم  
4. موضوعات پیشرفته مانند استقرار چند منطقه‌ای را بررسی کنید  

---  

**بازخورد کارگاه آموزشی**: به ما کمک کنید این کارگاه را با به اشتراک گذاشتن تجربه خود در [کانال Azure دیسکورد Azure AI Foundry](https://discord.gg/microsoft-azure) بهبود دهیم.  

---  

**فهرست فصل‌ها:**  
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)  
- **📖 فصل فعلی**: فصل ۲ - توسعه مبتنی بر هوش مصنوعی  
- **⬅️ قبلی**: [استقرار مدل هوش مصنوعی](ai-model-deployment.md)  
- **➡️ بعدی**: [بهترین شیوه‌های هوش مصنوعی تولیدی](production-ai-practices.md)  
- **🚀 فصل بعدی**: [فصل ۳: پیکربندی](../getting-started/configuration.md)  

**نیاز به کمک دارید؟** به جامعه ما بپیوندید برای پشتیبانی و بحث درباره AZD و استقرارهای هوش مصنوعی.  

---

**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما تلاش می‌کنیم دقت را حفظ کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌ها باشند. سند اصلی به زبان اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس، توصیه می‌شود از ترجمه حرفه‌ای انسانی استفاده کنید. ما مسئولیتی در قبال سوءتفاهم‌ها یا تفسیرهای نادرست ناشی از استفاده از این ترجمه نداریم.