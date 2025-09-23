<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22e9deee2d82e70fc841c60f97627916",
  "translation_date": "2025-09-23T14:00:53+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "fa"
}
-->
# کارگاه عملی هوش مصنوعی: آماده‌سازی راه‌حل‌های هوش مصنوعی برای استقرار با AZD

**فهرست فصل‌ها:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل فعلی**: فصل ۲ - توسعه مبتنی بر هوش مصنوعی
- **⬅️ قبلی**: [استقرار مدل هوش مصنوعی](ai-model-deployment.md)
- **➡️ بعدی**: [بهترین شیوه‌های تولید هوش مصنوعی](production-ai-practices.md)
- **🚀 فصل بعدی**: [فصل ۳: پیکربندی](../getting-started/configuration.md)

## نمای کلی کارگاه

این کارگاه عملی، توسعه‌دهندگان را در فرآیند استفاده از یک قالب هوش مصنوعی موجود و استقرار آن با استفاده از Azure Developer CLI (AZD) راهنمایی می‌کند. شما الگوهای ضروری برای استقرار هوش مصنوعی در محیط تولید با استفاده از خدمات Azure AI Foundry را خواهید آموخت.

**مدت زمان:** ۲-۳ ساعت  
**سطح:** متوسط  
**پیش‌نیازها:** دانش پایه‌ای از Azure، آشنایی با مفاهیم هوش مصنوعی/یادگیری ماشین

## 🎓 اهداف آموزشی

در پایان این کارگاه، شما قادر خواهید بود:
- ✅ تبدیل یک برنامه هوش مصنوعی موجود به استفاده از قالب‌های AZD
- ✅ پیکربندی خدمات Azure AI Foundry با AZD
- ✅ پیاده‌سازی مدیریت امن اعتبارنامه‌ها برای خدمات هوش مصنوعی
- ✅ استقرار برنامه‌های هوش مصنوعی آماده تولید با نظارت
- ✅ رفع مشکلات رایج در استقرار هوش مصنوعی

## پیش‌نیازها

### ابزارهای مورد نیاز
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) نصب شده
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) نصب شده
- [Git](https://git-scm.com/) نصب شده
- ویرایشگر کد (VS Code توصیه می‌شود)

### منابع Azure
- اشتراک Azure با دسترسی Contributor
- دسترسی به خدمات Azure OpenAI (یا توانایی درخواست دسترسی)
- مجوزهای ایجاد گروه منابع

### دانش مورد نیاز
- درک پایه‌ای از خدمات Azure
- آشنایی با رابط‌های خط فرمان
- مفاهیم پایه‌ای هوش مصنوعی/یادگیری ماشین (API‌ها، مدل‌ها، پرامپت‌ها)

## تنظیم کارگاه

### مرحله ۱: آماده‌سازی محیط

1. **بررسی نصب ابزارها:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **کلون کردن مخزن کارگاه:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```


## ماژول ۱: درک ساختار AZD برای برنامه‌های هوش مصنوعی

### ساختار یک قالب AZD آماده هوش مصنوعی

بررسی فایل‌های کلیدی در یک قالب AZD آماده هوش مصنوعی:

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

1. **بررسی فایل azure.yaml:**
```bash
cat azure.yaml
```

**مواردی که باید بررسی شوند:**
- تعریف خدمات برای اجزای هوش مصنوعی
- نگاشت متغیرهای محیطی
- پیکربندی میزبان

2. **بررسی زیرساخت اصلی main.bicep:**
```bash
cat infra/main.bicep
```

**الگوهای کلیدی هوش مصنوعی که باید شناسایی شوند:**
- تهیه خدمات Azure OpenAI
- یکپارچه‌سازی جستجوی شناختی
- مدیریت امن کلیدها
- پیکربندی امنیت شبکه

### **نقطه بحث:** چرا این الگوها برای هوش مصنوعی مهم هستند

- **وابستگی‌های خدمات:** برنامه‌های هوش مصنوعی اغلب به خدمات هماهنگ متعددی نیاز دارند
- **امنیت:** کلیدهای API و نقاط پایانی نیاز به مدیریت امن دارند
- **مقیاس‌پذیری:** بارهای کاری هوش مصنوعی نیازهای مقیاس‌پذیری منحصر به فردی دارند
- **مدیریت هزینه:** خدمات هوش مصنوعی می‌توانند در صورت عدم پیکربندی مناسب گران باشند

## ماژول ۲: استقرار اولین برنامه هوش مصنوعی شما

### مرحله ۲.۱: راه‌اندازی محیط

1. **ایجاد یک محیط جدید AZD:**
```bash
azd env new myai-workshop
```

2. **تنظیم پارامترهای مورد نیاز:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```


### مرحله ۲.۲: استقرار زیرساخت و برنامه

1. **استقرار با AZD:**
```bash
azd up
```

**اتفاقاتی که در طول `azd up` رخ می‌دهد:**
- ✅ تهیه خدمات Azure OpenAI
- ✅ ایجاد خدمات جستجوی شناختی
- ✅ راه‌اندازی App Service برای برنامه وب
- ✅ پیکربندی شبکه و امنیت
- ✅ استقرار کد برنامه
- ✅ راه‌اندازی نظارت و ثبت وقایع

2. **نظارت بر پیشرفت استقرار** و یادداشت منابع ایجاد شده.

### مرحله ۲.۳: بررسی استقرار شما

1. **بررسی منابع مستقر شده:**
```bash
azd show
```

2. **باز کردن برنامه مستقر شده:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **آزمایش عملکرد هوش مصنوعی:**
   - به برنامه وب مراجعه کنید
   - پرسش‌های نمونه را امتحان کنید
   - بررسی کنید که پاسخ‌های هوش مصنوعی کار می‌کنند

### **تمرین آزمایشگاهی ۲.۱: تمرین رفع اشکال**

**سناریو:** استقرار شما موفقیت‌آمیز بوده اما هوش مصنوعی پاسخ نمی‌دهد.

**مشکلات رایج برای بررسی:**
1. **کلیدهای API OpenAI:** بررسی کنید که به درستی تنظیم شده‌اند
2. **دسترسی مدل:** بررسی کنید که آیا منطقه شما از مدل پشتیبانی می‌کند
3. **اتصال شبکه:** اطمینان حاصل کنید که خدمات می‌توانند ارتباط برقرار کنند
4. **مجوزهای RBAC:** بررسی کنید که برنامه می‌تواند به OpenAI دسترسی داشته باشد

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

1. **به‌روزرسانی مدل OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **افزودن خدمات هوش مصنوعی اضافی:**

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

**بهترین شیوه:** پیکربندی‌های متفاوت برای توسعه و تولید.

1. **ایجاد یک محیط تولید:**
```bash
azd env new myai-production
```

2. **تنظیم پارامترهای خاص تولید:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```


### **تمرین آزمایشگاهی ۳.۱: بهینه‌سازی هزینه**

**چالش:** قالب را برای توسعه کم‌هزینه پیکربندی کنید.

**وظایف:**
1. شناسایی SKUهایی که می‌توانند به سطوح رایگان/پایه تنظیم شوند
2. پیکربندی متغیرهای محیطی برای هزینه‌های حداقلی
3. استقرار و مقایسه هزینه‌ها با پیکربندی تولید

**راهنمایی‌های حل:**
- استفاده از سطح F0 (رایگان) برای خدمات شناختی در صورت امکان
- استفاده از سطح Basic برای خدمات جستجو در توسعه
- در نظر گرفتن استفاده از برنامه Consumption برای Functions

## ماژول ۴: امنیت و بهترین شیوه‌های تولید

### مرحله ۴.۱: مدیریت امن اعتبارنامه‌ها

**چالش فعلی:** بسیاری از برنامه‌های هوش مصنوعی کلیدهای API را به صورت سخت‌کد شده یا در ذخیره‌سازی ناامن استفاده می‌کنند.

**راه‌حل AZD:** یکپارچه‌سازی Managed Identity + Key Vault.

1. **بررسی پیکربندی امنیتی در قالب خود:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **تأیید عملکرد Managed Identity:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```


### مرحله ۴.۲: امنیت شبکه

1. **فعال‌سازی نقاط پایانی خصوصی** (در صورت عدم پیکربندی):

افزودن به قالب bicep:
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

1. **پیکربندی Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **راه‌اندازی نظارت خاص هوش مصنوعی:**

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

**وظیفه:** استقرار خود را برای بهترین شیوه‌های امنیتی بررسی کنید.

**چک‌لیست:**
- [ ] هیچ راز سخت‌کد شده‌ای در کد یا پیکربندی وجود ندارد
- [ ] Managed Identity برای احراز هویت سرویس به سرویس استفاده شده است
- [ ] Key Vault تنظیمات حساس را ذخیره می‌کند
- [ ] دسترسی شبکه به درستی محدود شده است
- [ ] نظارت و ثبت وقایع فعال شده است

## ماژول ۵: تبدیل برنامه هوش مصنوعی خود

### مرحله ۵.۱: برگه ارزیابی

**قبل از تبدیل برنامه خود**، به این سوالات پاسخ دهید:

1. **معماری برنامه:**
   - برنامه شما از چه خدمات هوش مصنوعی استفاده می‌کند؟
   - به چه منابع محاسباتی نیاز دارد؟
   - آیا به پایگاه داده نیاز دارد؟
   - وابستگی‌های بین خدمات چیست؟

2. **نیازهای امنیتی:**
   - برنامه شما چه داده‌های حساسی را مدیریت می‌کند؟
   - چه الزامات انطباقی دارید؟
   - آیا به شبکه خصوصی نیاز دارید؟

3. **نیازهای مقیاس‌پذیری:**
   - بار مورد انتظار شما چیست؟
   - آیا به مقیاس‌پذیری خودکار نیاز دارید؟
   - آیا الزامات منطقه‌ای وجود دارد؟

### مرحله ۵.۲: ایجاد قالب AZD خود

**برای تبدیل برنامه خود از این الگو پیروی کنید:**

1. **ایجاد ساختار پایه:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
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


### **تمرین آزمایشگاهی ۵.۱: چالش ایجاد قالب**

**چالش:** ایجاد یک قالب AZD برای یک برنامه پردازش اسناد هوش مصنوعی.

**نیازمندی‌ها:**
- Azure OpenAI برای تحلیل محتوا
- Document Intelligence برای OCR
- Storage Account برای آپلود اسناد
- Function App برای منطق پردازش
- برنامه وب برای رابط کاربری

**امتیاز اضافی:**
- افزودن مدیریت خطا مناسب
- شامل تخمین هزینه
- راه‌اندازی داشبوردهای نظارت

## ماژول ۶: رفع مشکلات رایج

### مشکلات رایج استقرار

#### مشکل ۱: سهمیه خدمات OpenAI تمام شده است
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
**علائم:** خطاهای 403 Forbidden هنگام فراخوانی خدمات هوش مصنوعی  
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
1. بررسی معیارهای عملکرد در Application Insights
2. بررسی معیارهای خدمات OpenAI در پورتال Azure
3. تأیید اتصال شبکه و تأخیر

**راه‌حل‌ها:**
- پیاده‌سازی کش برای پرسش‌های رایج
- استفاده از مدل OpenAI مناسب برای مورد استفاده شما
- در نظر گرفتن نسخه‌های خواندنی برای سناریوهای بار بالا

### **تمرین آزمایشگاهی ۶.۱: چالش رفع اشکال**

**سناریو:** استقرار شما موفقیت‌آمیز بوده، اما برنامه خطاهای 500 بازمی‌گرداند.

**وظایف رفع اشکال:**
1. بررسی لاگ‌های برنامه
2. تأیید اتصال خدمات
3. آزمایش احراز هویت
4. بررسی پیکربندی

**ابزارهایی که باید استفاده شوند:**
- `azd show` برای نمای کلی استقرار
- پورتال Azure برای لاگ‌های دقیق خدمات
- Application Insights برای تله‌متری برنامه

## ماژول ۷: نظارت و بهینه‌سازی

### مرحله ۷.۱: راه‌اندازی نظارت جامع

1. **ایجاد داشبوردهای سفارشی:**

به پورتال Azure بروید و داشبوردی با موارد زیر ایجاد کنید:
- تعداد درخواست‌های OpenAI و تأخیر
- نرخ خطاهای برنامه
- استفاده از منابع
- ردیابی هزینه

2. **راه‌اندازی هشدارها:**
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

1. **تحلیل هزینه‌های فعلی:**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **اجرای کنترل‌های هزینه:**
- تنظیم هشدارهای بودجه
- استفاده از سیاست‌های مقیاس‌پذیری خودکار
- پیاده‌سازی کش درخواست‌ها
- نظارت بر استفاده از توکن برای OpenAI

### **تمرین آزمایشگاهی ۷.۱: بهینه‌سازی عملکرد**

**وظیفه:** برنامه هوش مصنوعی خود را برای عملکرد و هزینه بهینه کنید.

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

وظیفه شما ایجاد یک چت‌بات خدمات مشتری مبتنی بر هوش مصنوعی آماده تولید با این نیازمندی‌ها است:

**نیازمندی‌های عملکردی:**
- رابط وب برای تعاملات مشتری
- یکپارچه‌سازی با Azure OpenAI برای پاسخ‌ها
- قابلیت جستجوی اسناد با استفاده از Cognitive Search
- یکپارچه‌سازی با پایگاه داده مشتری موجود
- پشتیبانی چندزبانه

**نیازمندی‌های غیرعملکردی:**
- مدیریت ۱۰۰۰ کاربر همزمان
- SLA آپتایم ۹۹.۹٪
- انطباق با SOC 2
- هزینه کمتر از ۵۰۰ دلار در ماه
- استقرار در محیط‌های متعدد (توسعه، آزمایشی، تولید)

### مراحل پیاده‌سازی

1. **طراحی معماری**
2. **ایجاد قالب AZD**
3. **اجرای اقدامات امنیتی**
4. **راه‌اندازی نظارت و هشدارها**
5. **ایجاد خطوط لوله استقرار**
6. **مستندسازی راه‌حل**

### معیارهای ارزیابی

- ✅ **عملکرد:** آیا تمام نیازمندی‌ها را برآورده می‌کند؟
- ✅ **امنیت:** آیا بهترین شیوه‌ها اجرا شده‌اند؟
- ✅ **مقیاس‌پذیری:** آیا می‌تواند بار را مدیریت کند؟
- ✅ **نگهداری‌پذیری:** آیا کد و زیرساخت به خوبی سازماندهی شده‌اند؟
- ✅ **هزینه:** آیا در محدوده بودجه باقی می‌ماند؟

## منابع اضافی

### مستندات مایکروسافت
- [مستندات Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [مستندات خدمات Azure OpenAI](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [مستندات Azure AI Foundry](https://learn.microsoft.com/azure/ai-studio/)

### قالب‌های نمونه
- [برنامه چت Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)
- [شروع سریع برنامه چت OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [چت Contoso](https://github.com/Azure-Samples/contoso-chat)

### منابع جامعه
- [Discord Azure AI Foundry](https://discord.gg/microsoft-azure)
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [قالب‌های عالی AZD](https://azure.github.io/awesome-azd/)

## 🎓 گواهی تکمیل
تبریک می‌گوییم! شما کارگاه آموزشی هوش مصنوعی را به پایان رساندید. اکنون باید بتوانید:

- ✅ تبدیل برنامه‌های هوش مصنوعی موجود به قالب‌های AZD
- ✅ استقرار برنامه‌های هوش مصنوعی آماده برای تولید
- ✅ پیاده‌سازی بهترین روش‌های امنیتی برای بارهای کاری هوش مصنوعی
- ✅ نظارت و بهینه‌سازی عملکرد برنامه‌های هوش مصنوعی
- ✅ رفع مشکلات رایج در استقرار

### مراحل بعدی
1. این الگوها را در پروژه‌های هوش مصنوعی خود اعمال کنید
2. قالب‌ها را به جامعه بازگردانید
3. به دیسکورد Azure AI Foundry بپیوندید برای پشتیبانی مداوم
4. موضوعات پیشرفته مانند استقرار چند منطقه‌ای را بررسی کنید

---

**بازخورد کارگاه**: به ما کمک کنید این کارگاه را با به اشتراک گذاشتن تجربه خود در [کانال #Azure دیسکورد Azure AI Foundry](https://discord.gg/microsoft-azure) بهبود دهیم.

---

**ناوبری فصل‌ها:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل فعلی**: فصل ۲ - توسعه مبتنی بر هوش مصنوعی
- **⬅️ قبلی**: [استقرار مدل هوش مصنوعی](ai-model-deployment.md)
- **➡️ بعدی**: [بهترین روش‌های هوش مصنوعی تولیدی](production-ai-practices.md)
- **🚀 فصل بعدی**: [فصل ۳: پیکربندی](../getting-started/configuration.md)

**نیاز به کمک دارید؟** به جامعه ما بپیوندید برای پشتیبانی و بحث درباره AZD و استقرارهای هوش مصنوعی.

---

