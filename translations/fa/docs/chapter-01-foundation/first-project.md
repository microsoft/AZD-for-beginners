# پروژه اول شما - آموزش عملی

**ناوبری فصل:**
- **📚 صفحه دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل 1 - مبانی و شروع سریع
- **⬅️ قبلی**: [Installation & Setup](installation.md)
- **➡️ بعدی**: [Configuration](configuration.md)
- **🚀 فصل بعدی**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## معرفی

به اولین پروژه Azure Developer CLI خود خوش آمدید! این آموزش جامع و عملی یک راهنمای کامل برای ایجاد، استقرار و مدیریت یک برنامه فول‌استک روی Azure با استفاده از azd ارائه می‌دهد. شما با یک برنامه todo واقعی کار خواهید کرد که شامل یک فرانت‌اند React، یک بک‌اند API با Node.js و یک پایگاه داده MongoDB است.

## اهداف یادگیری

با تکمیل این آموزش، شما قادر خواهید بود:
- گردش کار راه‌اندازی پروژه azd با استفاده از قالب‌ها را مسلط شوید
- ساختار پروژه Azure Developer CLI و فایل‌های پیکربندی را درک کنید
- استقرار کامل برنامه به Azure همراه با تأمین زیرساخت را انجام دهید
- راهکارهای به‌روزرسانی برنامه و استراتژی‌های بازاستقرار را پیاده‌سازی کنید
- مدیریت چندین محیط برای توسعه و staging را انجام دهید
- شیوه‌های پاکسازی منابع و مدیریت هزینه را اعمال کنید

## نتایج یادگیری

پس از اتمام، شما قادر خواهید بود:
- به‌صورت مستقل پروژه‌های azd را از قالب‌ها مقداردهی اولیه و پیکربندی کنید
- ساختارهای پروژه azd را به‌طور مؤثر پیمایش و ویرایش کنید
- برنامه‌های فول‌استک را با دستورات واحد به Azure مستقر کنید
- مشکلات رایج استقرار و احراز هویت را عیب‌یابی کنید
- چندین محیط Azure را برای مراحل مختلف استقرار مدیریت کنید
- گردش‌های کار استقرار پیوسته برای به‌روزرسانی‌های برنامه پیاده‌سازی کنید

## شروع

### چک‌لیست پیش‌نیازها
- ✅ Azure Developer CLI نصب‌شده ([Installation Guide](installation.md))
- ✅ احراز هویت AZD با `azd auth login` تکمیل شده
- ✅ Git روی سیستم شما نصب‌شده
- ✅ Node.js نسخه 16+ (برای این آموزش)
- ✅ Visual Studio Code (توصیه‌شده)

قبل از ادامه، اعتبارسنج راه‌اندازی را از ریشه مخزن اجرا کنید:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### تأیید راه‌اندازی شما
```bash
# بررسی نصب azd
azd version

# بررسی احراز هویت AZD
azd auth login --check-status
```

### تأیید اختیاری احراز هویت Azure

```bash
az account show
```

### بررسی نسخه Node.js
```bash
node --version
```

## مرحله 1: انتخاب و مقداردهی یک قالب

بیایید با یک قالب محبوب برنامه todo که شامل فرانت‌اند React و بک‌اند Node.js است شروع کنیم.

```bash
# قالب‌های موجود را مرور کنید
azd template list

# قالب برنامهٔ todo را مقداردهی اولیه کنید
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# دستورالعمل‌ها را دنبال کنید:
# - یک نام محیط وارد کنید: "dev"
# - یک اشتراک را انتخاب کنید (اگر بیش از یک دارید)
# - یک منطقه را انتخاب کنید: "East US 2" (یا منطقهٔ دلخواه شما)
```

### چه اتفاقی افتاد؟
- کد قالب به دایرکتوری محلی شما دانلود شد
- یک فایل `azure.yaml` با تعریف سرویس‌ها ایجاد شد
- کد زیرساخت در دایرکتوری `infra/` تنظیم شد
- یک پیکربندی محیط ایجاد شد

## مرحله 2: بررسی ساختار پروژه

بیایید ببینیم azd برای ما چه ایجاد کرده است:

```bash
# نمایش ساختار پروژه
tree /f   # ویندوز
# یا
find . -type f | head -20   # مک‌اواس/لینوکس
```

شما باید ببینید:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### فایل‌های کلیدی برای درک

**azure.yaml** - هسته پروژه azd شما:
```bash
# مشاهده پیکربندی پروژه
cat azure.yaml
```

**infra/main.bicep** - تعریف زیرساخت:
```bash
# کد زیرساخت را مشاهده کنید
head -30 infra/main.bicep
```

## مرحله 3: سفارشی‌سازی پروژه شما (اختیاری)

قبل از استقرار، می‌توانید برنامه را سفارشی کنید:

### ویرایش فرانت‌اند
```bash
# کامپوننت اپلیکیشن React را باز کنید
code src/web/src/App.tsx
```

یک تغییر ساده ایجاد کنید:
```typescript
// عنوان را پیدا کنید و آن را تغییر دهید
<h1>My Awesome Todo App</h1>
```

### پیکربندی متغیرهای محیطی
```bash
# تنظیم متغیرهای محیطی سفارشی
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# مشاهده تمام متغیرهای محیطی
azd env get-values
```

## مرحله 4: استقرار به Azure

حالا بخش هیجان‌انگیز - همه چیز را به Azure مستقر کنید!

```bash
# استقرار زیرساخت و برنامه
azd up

# این دستور موارد زیر را انجام می‌دهد:
# 1. فراهم‌سازی منابع Azure (App Service، Cosmos DB و غیره)
# 2. ساخت برنامهٔ شما
# 3. استقرار روی منابع فراهم‌شده
# 4. نمایش آدرس URL برنامه
```

### چه چیزهایی در طول استقرار اتفاق می‌افتد؟

فرمان `azd up` این مراحل را اجرا می‌کند:
1. **Provision** (`azd provision`) - ایجاد منابع Azure
2. **Package** - ساخت کد برنامه شما
3. **Deploy** (`azd deploy`) - استقرار کد به منابع Azure

### خروجی مورد انتظار
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## مرحله 5: آزمایش برنامه شما

### دسترسی به برنامه شما
روی URL ارائه‌شده در خروجی استقرار کلیک کنید، یا هر زمان آن را دریافت کنید:
```bash
# نقاط پایانی برنامه را دریافت کنید
azd show

# برنامه را در مرورگر خود باز کنید
azd show --output json | jq -r '.services.web.endpoint'
```

### آزمایش برنامه Todo
1. **افزودن یک مورد todo** - روی "Add Todo" کلیک کنید و یک کار وارد کنید
2. **علامت‌گذاری به‌عنوان کامل** - آیتم‌های تکمیل‌شده را تیک بزنید
3. **حذف آیتم‌ها** - todo‌هایی را که دیگر نیاز ندارید حذف کنید

### پایش برنامه شما
```bash
# پورتال Azure را برای منابع خود باز کنید
azd monitor

# لاگ‌های برنامه را مشاهده کنید
azd monitor --logs

# متریک‌های زنده را مشاهده کنید
azd monitor --live
```

## مرحله 6: ایجاد تغییرات و بازاستقرار

بیایید تغییر کوچکی ایجاد کنیم و ببینیم به‌روزرسانی چقدر آسان است:

### ویرایش API
```bash
# کد API را ویرایش کنید
code src/api/src/routes/lists.js
```

یک هدر پاسخ سفارشی اضافه کنید:
```javascript
// ‎یک هندلر مسیر را پیدا کنید و اضافه کنید:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### فقط تغییرات کد را مستقر کنید
```bash
# فقط کد برنامه را مستقر کنید (از استقرار زیرساخت صرف‌نظر کنید)
azd deploy

# این بسیار سریع‌تر از 'azd up' است زیرا زیرساخت قبلاً وجود دارد
```

## مرحله 7: مدیریت چندین محیط

یک محیط staging ایجاد کنید تا قبل از تولید تغییرات را آزمایش کنید:

```bash
# ایجاد یک محیط استیجینگ جدید
azd env new staging

# استقرار در محیط استیجینگ
azd up

# بازگشت به محیط توسعه
azd env select dev

# فهرست همه محیط‌ها
azd env list
```

### مقایسه محیط‌ها
```bash
# مشاهده محیط توسعه
azd env select dev
azd show

# مشاهده محیط پیش‌تولید
azd env select staging
azd show
```

## مرحله 8: پاکسازی منابع

وقتی کار آزمایشی شما تمام شد، برای جلوگیری از هزینه‌های مداوم، منابع را پاک کنید:

```bash
# حذف تمام منابع Azure برای محیط فعلی
azd down

# حذف اجباری بدون تأیید و پاک‌سازی منابع حذف نرم‌شده
azd down --force --purge

# حذف محیط مشخص
azd env select staging
azd down --force --purge
```

## اپ کلاسیک در برابر اپ مجهز به هوش مصنوعی: همان گردش‌کار

شما به‌تازگی یک برنامه وب سنتی را مستقر کردید. اما اگر می‌خواستید به‌جای آن یک اپ مجهز به هوش مصنوعی مستقر کنید — مثلاً یک برنامه چت با پشتوانه مدل‌های Microsoft Foundry — چه؟

خبر خوب: **گردش‌کار یکسان است.**

| Step | Classic Todo App | AI Chat App |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

تنها تفاوت، **قالب**ی است که از آن شروع می‌کنید. یک قالب AI شامل زیرساخت‌های اضافی (مانند یک منبع Microsoft Foundry Models یا یک ایندکس AI Search) است، اما azd تمام آن‌ها را برای شما مدیریت می‌کند. نیازی به یادگیری دستورات جدید، پذیرش ابزار متفاوت یا تغییر نحوه تفکر درباره استقرار ندارید.

این اصل بنیادین azd است: **یک روند کاری واحد برای هر نوع بار کاری.** مهارت‌هایی که در این آموزش تمرین کردید — مقداردهی اولیه، استقرار، پایش، بازاستقرار و پاکسازی — به‌طور برابر برای برنامه‌ها و عوامل هوش مصنوعی قابل اعمال هستند.

---

## آنچه آموختید

تبریک! شما با موفقیت:
- ✅ یک پروژه azd را از یک قالب مقداردهی اولیه کردید
- ✅ ساختار پروژه و فایل‌های کلیدی را بررسی کردید
- ✅ یک برنامه فول‌استک را به Azure مستقر کردید
- ✅ تغییرات کد ایجاد کرده و مجدداً مستقر کردید
- ✅ چندین محیط را مدیریت کردید
- ✅ منابع را پاکسازی کردید

## 🎯 تمرین‌های تأیید مهارت

### تمرین 1: استقرار یک قالب متفاوت (15 دقیقه)
**هدف**: نمایش تسلط بر azd init و گردش‌کار استقرار

```bash
# آزمایش پشتهٔ پایتون و MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# تأیید استقرار
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# پاک‌سازی
azd down --force --purge
```

**معیارهای موفقیت:**
- [ ] برنامه بدون خطا مستقر شود
- [ ] بتوانید URL برنامه را در مرورگر باز کنید
- [ ] برنامه به‌درستی کار کند (افزودن/حذف todoها)
- [ ] تمام منابع با موفقیت پاکسازی شوند

### تمرین 2: سفارشی‌سازی پیکربندی (20 دقیقه)
**هدف**: تمرین پیکربندی متغیرهای محیطی

```bash
cd my-first-azd-app

# ایجاد محیط سفارشی
azd env new custom-config

# تنظیم متغیرهای سفارشی
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# بررسی متغیرها
azd env get-values | grep APP_TITLE

# استقرار با پیکربندی سفارشی
azd up
```

**معیارهای موفقیت:**
- [ ] محیط سفارشی با موفقیت ایجاد شده باشد
- [ ] متغیرهای محیطی تنظیم و قابل بازیابی باشند
- [ ] برنامه با پیکربندی سفارشی مستقر شود
- [ ] بتوان تنظیمات سفارشی را در برنامه مستقر تأیید کرد

### تمرین 3: گردش‌کار چندمحیطی (25 دقیقه)
**هدف**: تسلط بر مدیریت محیط و استراتژی‌های استقرار

```bash
# ایجاد محیط توسعه
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# آدرس URL محیط توسعه را یادداشت کنید
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# ایجاد محیط مرحله‌بندی
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# آدرس URL محیط مرحله‌بندی را یادداشت کنید
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# محیط‌ها را مقایسه کنید
azd env list

# هر دو محیط را آزمایش کنید
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# هر دو محیط را پاک‌سازی کنید
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**معیارهای موفقیت:**
- [ ] دو محیط با پیکربندی‌های متفاوت ایجاد شده باشند
- [ ] هر دو محیط با موفقیت مستقر شده باشند
- [ ] بتوان با `azd env select` بین محیط‌ها جابجا شد
- [ ] متغیرهای محیطی بین محیط‌ها متفاوت باشند
- [ ] هر دو محیط با موفقیت پاکسازی شده باشند

## 📊 پیشرفت شما

**زمان سرمایه‌گذاری‌شده**: ~60-90 minutes  
**مهارت‌های کسب‌شده**:
- ✅ مقداردهی اولیه پروژه مبتنی بر قالب
- ✅ تأمین منابع Azure
- ✅ گردش‌های کار استقرار برنامه
- ✅ مدیریت محیط
- ✅ مدیریت پیکربندی
- ✅ پاکسازی منابع و مدیریت هزینه

**سطح بعدی**: شما برای [Configuration Guide](configuration.md) آماده‌اید تا الگوهای پیشرفته پیکربندی را بیاموزید!

## رفع اشکال مسائل رایج

### خطاهای احراز هویت
```bash
# دوباره با Azure احراز هویت کنید
az login

# دسترسی اشتراک را تأیید کنید
az account show
```

### شکست‌های استقرار
```bash
# ثبت لاگ‌های اشکال‌زدایی را فعال کنید
export AZD_DEBUG=true
azd up --debug

# لاگ‌های برنامه را در Azure مشاهده کنید
azd monitor --logs

# برای Container Apps از Azure CLI استفاده کنید:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### تداخل نام منابع
```bash
# از یک نام محیطی منحصر به‌فرد استفاده کنید.
azd env new dev-$(whoami)-$(date +%s)
```

### مسائل پورت/شبکه
```bash
# بررسی کنید که پورت‌ها در دسترس هستند
netstat -an | grep :3000
netstat -an | grep :3100
```

## مراحل بعدی

حالا که پروژه اول خود را تکمیل کرده‌اید، این موضوعات پیشرفته را کاوش کنید:

### 1. سفارشی‌سازی زیرساخت
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add databases, storage, and other services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. راه‌اندازی CI/CD
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - گردش‌های کار کامل CI/CD
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - پیکربندی pipeline

### 3. بهترین شیوه‌های تولید
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - امنیت، عملکرد و پایش

### 4. کشف قالب‌های بیشتر
```bash
# قالب‌ها را بر اساس دسته‌بندی مرور کنید
azd template list --filter web
azd template list --filter api
azd template list --filter database

# پشته‌های فناوری مختلف را امتحان کنید
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## منابع اضافی

### مطالب آموزشی
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### جامعه و پشتیبانی
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### قالب‌ها و نمونه‌ها
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**تبریک برای تکمیل اولین پروژه azd شما!** شما اکنون آماده‌اید با اطمینان برنامه‌های شگفت‌انگیز را روی Azure بسازید و مستقر کنید.

---

**ناوبری فصل:**
- **📚 صفحه دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل 1 - مبانی و شروع سریع
- **⬅️ قبلی**: [Installation & Setup](installation.md)
- **➡️ بعدی**: [Configuration](configuration.md)
- **🚀 فصل بعدی**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **درس بعدی**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
این سند با استفاده از سرویس ترجمهٔ هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. هرچند تلاش می‌کنیم دقت را حفظ کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطاها یا نادرستی‌هایی باشند. نسخهٔ اصلی سند به زبان اصلی خود باید به‌عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی یا حساس، ترجمهٔ حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوءتفاهم یا تفسیر نادرستی که از استفاده از این ترجمه ناشی شود، مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->