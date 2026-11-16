# آزمایشگاه کارگاه هوش مصنوعی: تبدیل راه‌حل‌های هوش مصنوعی شما به قابل استقرار با AZD

**ناوبری فصل:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل ۲ - توسعه مبتنی بر هوش مصنوعی
- **⬅️ قبلی**: [استقرار مدل هوش مصنوعی](ai-model-deployment.md)
- **➡️ بعدی**: [بهترین روش‌های تولیدی هوش مصنوعی](../chapter-08-production/production-ai-practices.md)
- **🚀 فصل بعدی**: [فصل ۳: پیکربندی](../chapter-03-configuration/configuration.md)

## مرور کارگاه

این آزمایشگاه عملی برنامه‌نویسان را از روند استفاده از یک قالب هوش مصنوعی موجود و استقرار آن با استفاده از Azure Developer CLI (AZD) راهنمایی می‌کند. الگوهای ضروری برای استقرارهای تولیدی هوش مصنوعی با استفاده از سرویس‌های Microsoft Foundry را خواهید آموخت.

> **بازبینی نسخه (2026-11-04):** راهنمای دستورات AZD و نام‌های نمونه پیکربندی با نسخه `azd` `1.37.2` و پیکربندی کنونی نمونه پیوند داده شده بررسی شد. این بازبینی مستندات است و اعتبارسنجی استقرار زنده نیست. آزمایشگاه RAG به افزونه عامل نیاز ندارد؛ برای ارزیابی عامل، از افزونه جداگانه `azure.ai.evaluations` و [روند ارزیابی فعلی](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) استفاده کنید، نه دستورات ارزیابی عامل قدیمی.

**مدت زمان:** ۲-۳ ساعت  
**سطح:** متوسط  
**پیش‌نیازها:** دانش پایه Azure، آشنایی با مفاهیم هوش مصنوعی/یادگیری ماشین

## 🎓 اهداف یادگیری

تا پایان این کارگاه، خواهید توانست:
- ✅ یک قالب هوش مصنوعی AZD موجود را بررسی و تبدیل برنامه خود را برنامه‌ریزی کنید
- ✅ سرویس‌های Microsoft Foundry را با AZD پیکربندی کنید
- ✅ مدیریت امن مدارک برای سرویس‌های هوش مصنوعی پیاده‌سازی کنید
- ✅ یک برنامه مرجع هوش مصنوعی را با نظارت مستقر کنید
- ✅ مشکلات رایج استقرار هوش مصنوعی را رفع کنید

## پیش‌نیازها

### ابزارهای مورد نیاز
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) نصب شده
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) نصب شده
- [Git](https://git-scm.com/) نصب شده
- ویرایشگر کد (پیشنهاد شده VS Code)

این بلوک‌های فرمان از دستورهای Bash (شامل ادامه خط و `grep`) استفاده می‌کنند. در ویندوز، از Git Bash/WSL استفاده کنید یا آن‌ها را به PowerShell ترجمه کنید. همچنین زبان، مدیر بسته و ابزارهای کانتینر ذکر شده در [تنظیم محیط محلی نمونه](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment) را نصب کنید.

### منابع Azure
- اشتراک Azure با مجوزهای تأمین منابع و انتساب نقش (تنها نقش Contributor نمی‌تواند انتساب‌های RBAC ایجاد کند؛ از یک مدیر نقش مجاز یا معادل مستند شده نمونه استفاده کنید)
- دسترسی به سرویس‌های Microsoft Foundry Models (یا امکان درخواست دسترسی)
- مجوزهای ایجاد گروه منابع

### پیش‌نیازهای دانشی
- درک پایه از سرویس‌های Azure
- آشنایی با رابط‌های خط فرمان
- مفاهیم پایه AI/ML (APIها، مدل‌ها، پرامپت‌ها)

## راه‌اندازی آزمایشگاه

### گام ۱: آماده‌سازی محیط

1. **تأیید نصب ابزارها:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
az login
```

اگر در چند تانت کار می‌کنید یا اشتراک شما به‌طور خودکار شناسایی نشد، با `azd auth login --tenant-id <tenant-id>` مجدداً تلاش کنید.

2. **کلون کردن مخزن کارگاه:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## ماژول ۱: درک ساختار AZD برای برنامه‌های هوش مصنوعی

### آناتومی یک قالب AI AZD

فایل‌های کلیدی در یک قالب AZD آماده AI را بررسی کنید:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

نمونه بررسی شده می‌تواند تغییر کند؛ `.azure/` پس از مقداردهی محیط ظاهر می‌شود و لزوماً در یک کلون تازه نیست. به جای ایجاد دایرکتوری‌های گمشده برای تطبیق این نمودار، موجودیت واقعی بررسی شده را بازبینی کنید.

### **تمرین آزمایشگاهی ۱.۱: بررسی پیکربندی**

1. **فایل azure.yaml را بررسی کنید:**
```bash
cat azure.yaml
```

**موارد قابل توجه:**
- تعریف سرویس برای اجزای هوش مصنوعی
- نگاشت متغیرهای محیطی
- پیکربندی میزبان‌ها

2. **زیرساخت main.bicep را بررسی کنید:**
```bash
cat infra/main.bicep
```

**الگوهای کلیدی AI برای شناسایی:**
- تأمین سرویس Microsoft Foundry Models
- یکپارچه‌سازی Azure AI Search
- مدیریت کلید امن
- پیکربندی امنیت شبکه

### **نقطه بحث:** چرا این الگوها برای هوش مصنوعی مهم هستند

- **وابستگی‌های سرویس:** برنامه‌های هوش مصنوعی اغلب به چند سرویس هماهنگ شده نیاز دارند
- **امنیت:** کلیدها و نقاط پایانی API باید مدیریت امنی داشته باشند
- **قابلیت مقیاس:** بارهای کار هوش مصنوعی نیازمندی‌های مقیاس‌پذیری ویژه‌ای دارند
- **مدیریت هزینه:** سرویس‌های هوش مصنوعی در صورت پیکربندی نادرست می‌توانند پرهزینه باشند

## ماژول ۲: استقرار اولین برنامه هوش مصنوعی خود

### گام ۲.۱: مقداردهی محیط

1. **ایجاد یک محیط جدید AZD:**
```bash
azd env new myai-workshop
```

2. **تنظیم پارامترهای مورد نیاز:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### گام ۲.۲: استقرار زیرساخت و برنامه

1. **استقرار با AZD:**
```bash
azd up
```

**چه اتفاقی در طول `azd up` می‌افتد:**
- ✅ تأمین سرویس Microsoft Foundry Models
- ✅ ایجاد سرویس Azure AI Search
- ✅ راه‌اندازی Azure Container Apps برای بک‌اند و فرانت‌اند بسته‌بندی‌شده (پیش‌فرض نمونه فعلی)
- ✅ پیکربندی شبکه و امنیت
- ✅ استقرار کد برنامه
- ✅ پیکربندی نظارت و ثبت رویدادها

2. **پیشرفت استقرار را نظارت کنید** و منابع ایجادشده را یادداشت کنید.

### گام ۲.۳: صحت‌سنجی استقرار

1. **منابع مستقر شده را بررسی کنید:**
```bash
azd show
```

2. **برنامه مستقر شده را باز کنید:**
```bash
azd show
```

نقطه انتهایی وب نمایش داده شده در خروجی `azd show` را باز کنید.

3. **عملکرد هوش مصنوعی را آزمایش کنید:**
   - به برنامه وب بروید
   - سوالات نمونه را امتحان کنید
   - صحت پاسخ‌های هوش مصنوعی را بررسی کنید

### **تمرین آزمایشگاهی ۲.۱: تمرین عیب‌یابی**

**سناریو:** استقرار شما موفق بود اما هوش مصنوعی پاسخ نمی‌دهد.

**مشکلات رایج برای بررسی:**
1. **احراز هویت:** هویت مدیریت شده و انتساب‌های نقش را تأیید کنید؛ فقط در صورت فعال بودن عمداً احراز هویت مبتنی بر کلید، کلیدهای API را بررسی کنید
2. **در دسترس بودن مدل:** بررسی کنید آیا منطقه شما مدل را پشتیبانی می‌کند
3. **اتصال شبکه:** اطمینان حاصل کنید سرویس‌ها می‌توانند ارتباط برقرار کنند
4. **مجوزهای RBAC:** بررسی کنید برنامه می‌تواند به OpenAI دسترسی داشته باشد

**دستورات عیب‌یابی:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## ماژول ۳: سفارشی‌سازی برنامه‌های هوش مصنوعی برای نیازهای شما

### گام ۳.۱: تغییر پیکربندی هوش مصنوعی

1. **به‌روزرسانی مدل OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **افزودن سرویس‌های هوش مصنوعی اضافی:**

فایل `infra/main.bicep` را برای افزودن Document Intelligence ویرایش کنید:

بخش زیر یک بخش نمونه است، نه قالب کامل. ممکن است نمونه هم‌اکنون سرویس‌های پردازش اسناد را تأمین کند: قبل از افزودن منابع تکراری زیرساخت فعلی آن را بررسی کنید. افزودنی‌های سفارشی نیاز به اتصال خروجی‌ها، هویت‌ها و پیکربندی برنامه دارند.

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

### گام ۳.۲: پیکربندی‌های اختصاصی محیط

**بهترین روش:** پیکربندی‌های متفاوت برای توسعه و تولید.

1. **ایجاد محیط تولید:**
```bash
azd env new myai-production
```

2. **تنظیم پارامترهای مخصوص محیط تولید:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

این نام‌ها از [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json) نمونه می‌آیند. `azd env set` مقداری ذخیره می‌کند اما یک متغیر دلخواه را فعال نمی‌کند: قالب باید آن را مصرف کند. قبل از غیرفعال کردن دسترسی عمومی، راهنمای [جداسازی شبکه](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) نمونه را مرور کنید و از `azd up` برای اعمال تغییرات زیرساخت استفاده کنید. SKU اپن‌ای‌آی `S0` به تنهایی توان مدل را تعیین نمی‌کند؛ نوع استقرار و ظرفیت هم مهم است.

### **تمرین آزمایشگاهی ۳.۱: بهینه‌سازی هزینه**

**چالش:** قالب را برای توسعه مقرون‌به‌صرفه پیکربندی کنید.

**کارها:**
1. محیط آزمایش کارگاه دورریز را انتخاب کنید: `azd env select myai-workshop`.
2. SKU جستجو و ظرفیت مدل فعلی را از `infra/main.parameters.json` و محیط انتخاب‌شده یادداشت کنید.
3. ورودی‌های پشتیبانی شده زیر را پس از تأیید سهمیه مدل/ناحیه استفاده کنید:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. SKU جستجو و ظرفیت استقرار را در پورتال بررسی کنید و تفاوت را با ماشین حساب قیمت برآورد کنید. انتظار نداشته باشید داده‌های صورتحساب بلافاصله به‌روزرسانی شوند.

**معیار موفقیت:** جستجو از Basic استفاده می‌کند، استقرار چت ظرفیت پشتیبانی شده درخواست شده را دارد، و برنامه همچنان به یک سوال نمونه پاسخ می‌دهد. ظرفیت `10` تخصیص محدودیت نرخ است، تخفیف قیمت توکن نیست. تغییرات سطح جستجو ممکن است محدود یا نیازمند بازسازی باشند؛ روی منابع تولیدی آزمایش نکنید. F0 خاص خدمات است و SKU مدل Azure OpenAI نیست.

## ماژول ۴: امنیت و بهترین روش‌های تولید

### گام ۴.۱: مدیریت امن مدارک

**چالش کنونی**: بسیاری از برنامه‌های هوش مصنوعی کلیدهای API را کدگذاری می‌کنند یا از ذخیره‌سازی ناامن استفاده می‌کنند.

**راهکار AZD**: هویت مدیریت شده + ادغام Key Vault.

1. **پیکربندی امنیتی قالب خود را بررسی کنید:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **تأیید کنید که Managed Identity کار می‌کند:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### گام ۴.۲: امنیت شبکه

1. **نقاط انتهایی خصوصی را با استفاده از پیکربندی شبکه پشتیبانی‌شده نمونه فعال کنید (اگر قبلاً پیکربندی نشده است).**

برای قالب خودتان، این بخش نمونه پیوند نقطه انتهایی OpenAI را نشان می‌دهد. همچنین به VNet، پیکربندی DNS خصوصی، و اتصال برنامه نیاز دارد؛ آن را بدون تغییر در نمونه جایگذاری نکنید که قبلاً ماژول‌های نقاط انتهایی خصوصی دارد:
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

### گام ۴.۳: نظارت و مشاهده‌پذیری

1. **پیکربندی Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **ادغام Application Insights نمونه را فعال کنید:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

ابزار نمونه تلمتری ارسال می‌کند؛ تنظیمات دلخواه `OPENAI_MONITOR_ENABLED` معیارهای هوش مصنوعی را فعال نمی‌کند. ردگیری‌ها را برای فراخوانی‌های مدل، تأخیر، شکست‌ها و مصرف توکن بررسی کنید و از ضبط پرامپت‌ها یا پاسخ‌های حساس خودداری کنید.

### **تمرین آزمایشگاهی ۴.۱: حسابرسی امنیتی**

**کار:** استقرار خود را برای بهترین روش‌های امنیتی بررسی کنید.

**چک‌لیست:**
- [ ] عدم وجود اسرار سخت‌کد شده در کد یا پیکربندی
- [ ] استفاده از Managed Identity برای احراز هویت سرویس به سرویس
- [ ] ذخیره پیکربندی حساس در Key Vault
- [ ] محدودیت مناسب دسترسی شبکه
- [ ] فعال‌سازی نظارت و ثبت رویدادها

## ماژول ۵: تبدیل برنامه هوش مصنوعی خود

### گام ۵.۱: برگه ارزیابی

**قبل از تبدیل برنامه خود، به این سوالات پاسخ دهید:**

1. **معماری برنامه:**
   - برنامه شما از چه سرویس‌های هوش مصنوعی استفاده می‌کند؟
   - به چه منابع محاسباتی نیاز دارد؟
   - آیا به پایگاه داده نیاز دارد؟
   - وابستگی بین سرویس‌ها چیست؟

2. **نیازمندی‌های امنیتی:**
   - برنامه شما با چه داده‌های حساسی کار می‌کند؟
   - چه ملزومات انطباق دارید؟
   - آیا به شبکه خصوصی نیاز دارید؟

3. **نیازمندی‌های مقیاس‌بندی:**
   - بار کاری مورد انتظار شما چقدر است؟
   - آیا به مقیاس‌گذاری خودکار نیاز دارید؟
   - آیا ملزومات منطقه‌ای وجود دارد؟

### گام ۵.۲: ساخت قالب AZD شما

**از این الگو برای تبدیل برنامه خود پیروی کنید:**

**فقط اسکافولد:** این بخش سورس API/برنامه وب، زیرساخت میزبان، استقرار مدل‌ها، هویت/RBAC یا یک `main.parameters.json` تمام‌شده را فراهم نمی‌کند. Bicep در حوزه گروه منابع ماژول را نشان می‌دهد؛ نقطه ورودی معمولی AZD در حوزه اشتراک باید گروه منابع ایجاد کند و آن را در همان حوزه فراخوانی کند. انتظار نداشته باشید `azd up` پس از کپی فقط این بخش‌ها یک برنامه کامل مستقر کند. برای یک پایه قابل اجرا، همچنان از قالب RAG ماژول ۱ استفاده کنید.

1. **ساختار پایه ایجاد کنید:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
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
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **تمرین آزمایشگاهی ۵.۱: چالش ساخت قالب**

**چالش:** ایجاد قالب AZD برای برنامه هوش مصنوعی پردازش اسناد.

**نیازمندی‌ها:**
- Microsoft Foundry Models برای تحلیل محتوا
- Document Intelligence برای OCR
- حساب ذخیره‌سازی برای بارگذاری اسناد
- برنامه Function برای منطق پردازش
- برنامه وب برای رابط کاربری

**امتیازهای تکمیلی:**
- افزودن مدیریت خطا مناسب
- شامل برآورد هزینه
- ایجاد داشبوردهای نظارتی

## ماژول ۶: رفع مشکلات رایج

### مشکلات رایج در استقرار

#### مشکل ۱: تجاوز سهمیه سرویس OpenAI
**علائم:** استقرار با خطای سهمیه شکست می‌خورد
**راه‌حل‌ها:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### مشکل ۲: عدم دسترسی مدل در منطقه
**علائم:** پاسخ‌های هوش مصنوعی شکست می‌خورند یا خطا در استقرار مدل رخ می‌دهد
**راه‌حل‌ها:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### مشکل ۳: مشکلات مجوز
**علائم:** خطاهای ۴۰۳ ممنوع هنگام فراخوانی سرویس‌های هوش مصنوعی
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
**گام‌های بررسی:**
1. بررسی معیارهای عملکرد در Application Insights
2. مرور معیارهای سرویس OpenAI در پرتال Azure
3. تأیید اتصال شبکه و تأخیر

**راه‌حل‌ها:**
- پیاده‌سازی کش برای پرسش‌های رایج
- استفاده از مدل OpenAI مناسب برای مورد استفاده شما
- مقیاس‌گذاری نمونه‌های برنامه فقط پس از بررسی محدودیت‌های RPM/TPM مدل؛ استقرارهای Azure OpenAI تنظیم «نسخه خواندنی» عمومی پایگاه داده را نشان نمی‌دهند

### **تمرین آزمایشگاهی ۶.۱: چالش عیب‌یابی**

**سناریو:** استقرار شما موفق بود، اما برنامه خطاهای ۵۰۰ بازمی‌گرداند.

**وظایف عیب‌یابی:**
1. بررسی لاگ‌های برنامه
2. تأیید اتصال سرویس
۳. آزمایش احراز هویت
۴. بررسی پیکربندی

**ابزارهای مورد استفاده:**
- `azd show` برای مرور کلی استقرار
- پرتال Azure برای گزارش‌های دقیق سرویس
- Application Insights برای تله‌متری برنامه

## ماژول ۷: پایش و بهینه‌سازی

### گام ۷.۱: راه‌اندازی پایش جامع

۱. **ساخت داشبوردهای سفارشی:**

به پرتال Azure مراجعه کرده و یک داشبورد با موارد زیر ایجاد کنید:
- تعداد درخواست‌های OpenAI و زمان پاسخ
- نرخ خطاهای برنامه
- استفاده منابع
- پیگیری هزینه‌ها

۲. **راه‌اندازی هشدارها:**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

اطمینان حاصل کنید که مؤلفه تله‌متری درخواست‌ها را ارسال می‌کند و اگر نیاز به اعلان است، یک گروه عملیاتی اضافه کنید. این معیار شمارش است، نه درصد شکست؛ هشدار نرخ به یک پرسش مناسب و مخرج نیاز دارد.

### گام ۷.۲: بهینه‌سازی هزینه

۱. **تحلیل هزینه‌های فعلی:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

مکان‌نماهای تاریخ را جایگزین کنید. پشتیبانی API مصرف بر اساس قراردادهای صورتحساب متفاوت است؛ اگر جزئیات مصرف در دسترس نیست، از Cost Management در پرتال استفاده کنید. هزینه‌ها با تأخیر نمایش داده می‌شوند و آزمایشی بلادرنگ نیستند.

۲. **اجرای کنترل‌های هزینه:**
- تنظیم هشدارهای بودجه
- استفاده از سیاست‌های مقیاس خودکار
- پیاده‌سازی کشینگ درخواست‌ها
- نظارت بر مصرف توکن‌های OpenAI

### **تمرین آزمایشگاه ۷.۱: بهینه‌سازی عملکرد**

**وظیفه**: برنامه هوش مصنوعی خود را هم از نظر عملکرد و هم هزینه بهینه کنید.

**معیارهای بهبود:**
- کاهش میانگین زمان پاسخ تا ۲۰٪
- کاهش هزینه ماهانه تا ۱۵٪
- تعریف SLA در دسترس بودن ۹۹.۹٪ و یک بازه اندازه‌گیری (یک آزمایشگاه کوتاه نمی‌تواند زمان آپ‌تایم ماهانه را نشان دهد)

**استراتژی‌های پیشنهادی:**
- اجرای کشینگ پاسخ‌ها
- بهینه‌سازی پرسش‌ها برای کارایی توکن
- استفاده از SKUs مناسب محاسباتی
- راه‌اندازی مقیاس خودکار مناسب

## چالش نهایی: پیاده‌سازی از ابتدا تا انتها

### سناریوی چالش

این یک **چالش معماری/طراحی اختیاری** است، نه یک تمرین اجرایی آماده یا گواهینامه تولید. یک چت‌بات خدمات مشتری مبتنی بر هوش مصنوعی پیشنهاد دهید و مستند کنید که کدام نیازمندی‌ها نیاز به پیاده‌سازی بیشتر و شواهد دارند:

**نیازمندی‌های عملکردی:**
- رابط وب برای تعاملات مشتری
- ادغام با مدل‌های Microsoft Foundry برای پاسخ‌ها
- قابلیت جستجوی اسناد با استفاده از Azure AI Search
- ادغام با پایگاه‌داده مشتری موجود
- پشتیبانی چندزبانه

**نیازمندی‌های غیرعملکردی:**
- مدیریت ۱۰۰۰ کاربر همزمان
- SLA زمان فعالیت ۹۹.۹٪
- انطباق با SOC 2
- هزینه زیر ۵۰۰ دلار در ماه
- استقرار در محیط‌های متعدد (توسعه، تست، تولید)

این محدودیت‌ها فرضی هستند و همزمان تضمین شده نیستند. نرخ درخواست، اندازه پرسش/پاسخ و مدت جلسه را قبل از برآورد هزینه‌ها تعریف کنید؛ ۱۰۰۰ کاربر همزمان به خودی خود بار کاری یا امکان بودجه ۵۰۰ دلاری را اثبات نمی‌کند. SOC 2 نتیجه یک ممیزی سازمانی است و سوئیچ فعال شده توسط قالب AZD نیست. تبادل‌ها را شناسایی کرده و محدودیت‌های غیرقابل اجرا را با شواهد رد کنید.

### مراحل پیاده‌سازی

۱. **طراحی معماری**
۲. **ایجاد قالب AZD**
۳. **اجرای تدابیر امنیتی**
۴. **راه‌اندازی پایش و هشداردهی**
۵. **ایجاد خطوط لوله استقرار**
۶. **مستندسازی راه‌حل**

### معیارهای ارزیابی

- ✅ **عملکرد**: آیا قابلیت‌های پیاده‌شده نمایش داده شده و شکاف‌های باقی‌مانده مشخص هستند؟
- ✅ **امنیت**: آیا بهترین شیوه‌ها اجرا شده‌اند؟
- ✅ **مقیاس‌پذیری**: آیا می‌تواند بار را مدیریت کند؟
- ✅ **قابلیت نگهداشت**: آیا کد و زیرساخت سازمان‌یافته است؟
- ✅ **هزینه**: آیا در بودجه باقی می‌ماند؟

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

## 🎓 نقطه‌ی بررسی تکمیل

تبریک می‌گوییم! شما کارگاه آزمایشگاه هوش مصنوعی را به پایان رسانده‌اید. اکنون باید بتوانید:

- ✅ توضیح دهید چگونه یک برنامه هوش مصنوعی موجود را به قالب AZD تطبیق دهید
- ✅ یک برنامه مرجع هوش مصنوعی را استقرار و آزمایش کنید
- ✅ بهترین شیوه‌های امنیتی برای بار کاری هوش مصنوعی را اجرا کنید
- ✅ عملکرد برنامه هوش مصنوعی را پایش و بهینه‌سازی کنید
- ✅ مشکلات رایج استقرار را عیب‌یابی کنید

**پاک‌سازی:** فرمان `azd env list` را اجرا کنید، هر محیط موقتی ایجاد شده در این آزمایشگاه (`myai-workshop`، و اگر مستقر شده باشد `myai-production`/`myai-quota-test`) را انتخاب کنید، و فرمان `azd down` را در هر یک اجرا نمایید. برنامه حذف را مرور کنید؛ حذف فقط پیکربندی محلی یک محیط منجر به حذف منابع Azure نمی‌شود. از `--purge` اجتناب کنید مگر اینکه با حذف غیرقابل بازگشت منابع نرم‌حذف شده آشنا باشید.

### مراحل بعدی
1. این الگوها را در پروژه‌های AI خود به کار ببرید
2. قالب‌ها را به جامعه بازگردانید
3. به سرور Discord Microsoft Foundry برای پشتیبانی مداوم بپیوندید
4. موضوعات پیشرفته مانند استقرار در چند منطقه را بررسی کنید

---

**بازخورد ورک‌شاپ**: با به اشتراک گذاشتن تجربه خود در [کانال #Azure دیسکورد Microsoft Foundry](https://discord.gg/microsoft-azure) به ما کمک کنید این ورک‌شاپ را بهبود بخشیم.

---

**مسیر فصل:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل ۲ - توسعه مبتنی بر هوش مصنوعی
- **⬅️ قبلی**: [استقرار مدل هوش مصنوعی](ai-model-deployment.md)
- **➡️ بعدی**: [بهترین شیوه‌های هوش مصنوعی تولیدی](../chapter-08-production/production-ai-practices.md)
- **🚀 فصل بعدی**: [فصل ۳: پیکربندی](../chapter-03-configuration/configuration.md)

**نیاز به کمک دارید؟** برای پشتیبانی و بحث درباره AZD و استقرار هوش مصنوعی به جامعه ما بپیوندید.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->