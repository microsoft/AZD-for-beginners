# پروژه اول شما - آموزش عملی

**ناوبری فصل:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل 1 - بنیاد و شروع سریع
- **⬅️ قبلی**: [نصب و راه‌اندازی](installation.md)
- **➡️ بعدی**: [پیکربندی](configuration.md)
- **🚀 فصل بعدی**: [فصل 2: توسعه مبتنی بر هوش مصنوعی](../chapter-02-ai-development/microsoft-foundry-integration.md)

## مقدمه

به پروژه اول خود با Azure Developer CLI خوش آمدید! این آموزش عملی جامع، راهنمای کامل ساخت، استقرار و مدیریت یک برنامه فول‌استک روی Azure با استفاده از azd را ارائه می‌دهد. شما با یک برنامه واقعی todo کار خواهید کرد که شامل فرانت‌اند React، بک‌اند API با Node.js و پایگاه داده MongoDB است.

## اهداف یادگیری

با تکمیل این آموزش، شما:
- بر جریان راه‌اندازی پروژه azd با استفاده از قالب‌ها مسلط خواهید شد
- ساختار پروژه و فایل‌های پیکربندی Azure Developer CLI را درک خواهید کرد
- استقرار کامل برنامه به Azure همراه با فراهم‌آوری زیرساخت‌ها را اجرا خواهید کرد
- استراتژی‌های به‌روزرسانی برنامه و دوباره‌استقرار را پیاده‌سازی خواهید کرد
- چند محیط برای توسعه و staging را مدیریت خواهید کرد
- رویه‌های پاک‌سازی منابع و مدیریت هزینه را اعمال خواهید کرد

## نتایج یادگیری

پس از اتمام، شما قادر خواهید بود:
- پروژه‌های azd را از قالب‌ها به‌صورت مستقل مقداردهی اولیه و پیکربندی کنید
- ساختارهای پروژه azd را به‌طور مؤثر پیمایش و تغییر دهید
- برنامه‌های فول‌استک را با دستورات واحد به Azure مستقر کنید
- مسائل رایج استقرار و مشکلات احراز هویت را رفع اشکال کنید
- چند محیط Azure را برای مراحل مختلف استقرار مدیریت کنید
- جریان‌های استقرار پیوسته برای به‌روزرسانی‌های برنامه را پیاده‌سازی کنید

## شروع کار

### فهرست پیش‌نیازها
- ✅ Azure Developer CLI نصب شده ([راهنمای نصب](installation.md))
- ✅ احراز هویت AZD با `azd auth login` تکمیل شده
- ✅ Git روی سیستم شما نصب است
- ✅ Node.js 16+ (برای این آموزش)
- ✅ Visual Studio Code (توصیه‌شده)

قبل از ادامه، از ریشه مخزن اعتبارسنج راه‌اندازی را اجرا کنید:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### تأیید راه‌اندازی شما
```bash
# نصب azd را بررسی کنید
azd version

# احراز هویت AZD را بررسی کنید
azd auth login --check-status
```

### تأیید اختیاری احراز هویت Azure CLI

```bash
az account show
```

### بررسی نسخه Node.js
```bash
node --version
```

## گام 1: انتخاب و مقداردهی اولیه یک قالب

بیایید با یک قالب محبوب برنامه todo شروع کنیم که شامل فرانت‌اند React و بک‌اند API با Node.js است.

```bash
# قالب‌های موجود را مرور کنید
azd template list

# قالب برنامهٔ todo را مقداردهی اولیه کنید
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# دستورالعمل‌ها را دنبال کنید:
# - نام محیط را وارد کنید: "dev"
# - یک اشتراک را انتخاب کنید (اگر بیش از یکی دارید)
# - یک منطقه را انتخاب کنید: "East US 2" (یا منطقهٔ مورد علاقهٔ شما)
```

### چه اتفاقی افتاد؟
- قالب کد به شاخه محلی شما دانلود شد
- یک فایل `azure.yaml` با تعاریف سرویس ایجاد شد
- کد زیرساخت در دایرکتوری `infra/` تنظیم شد
- یک پیکربندی محیط ایجاد شد

## گام 2: بررسی ساختار پروژه

بیایید ببینیم azd برای ما چه چیزی ساخته است:

```bash
# مشاهده ساختار پروژه
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

**azure.yaml** - قلب پروژه azd شما:
```bash
# مشاهده پیکربندی پروژه
cat azure.yaml
```

**infra/main.bicep** - تعریف زیرساخت:
```bash
# کد زیرساخت را مشاهده کنید
head -30 infra/main.bicep
```

## گام 3: سفارشی‌سازی پروژه (اختیاری)

قبل از استقرار، می‌توانید برنامه را سفارشی کنید:

### تغییر فرانت‌اند
```bash
# کامپوننت برنامه React را باز کنید
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
# مشاهده همه متغیرهای محیطی
azd env get-values
```

## گام 4: استقرار در Azure

حالا به بخش هیجان‌انگیز می‌رسیم — همه چیز را به Azure مستقر کنید!

```bash
# استقرار زیرساخت و برنامه
azd up

# این دستور موارد زیر را انجام می‌دهد:
# 1. تأمین منابع Azure (App Service، Cosmos DB و غیره)
# 2. ساخت برنامه‌ی شما
# 3. استقرار روی منابع تأمین‌شده
# 4. نمایش آدرس URL برنامه
```

### در طول استقرار چه اتفاقی می‌افتد؟

دستور `azd up` این مراحل را انجام می‌دهد:
1. **Provision** (`azd provision`) - منابع Azure را ایجاد می‌کند
2. **Package** - کد برنامه شما را می‌سازد
3. **Deploy** (`azd deploy`) - کد را به منابع Azure مستقر می‌کند

### خروجی مورد انتظار
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## گام 5: آزمایش برنامه شما

### دسترسی به برنامه شما
روی URL ارائه‌شده در خروجی استقرار کلیک کنید، یا هر زمان آن را دریافت کنید:
```bash
# نقاط پایانی برنامه را دریافت کنید
azd show

# برنامه را در مرورگر خود باز کنید
azd show --output json | jq -r '.services.web.endpoint'
```

### برنامه Todo را آزمایش کنید
1. **افزودن یک مورد todo** - روی "Add Todo" کلیک کنید و یک کار وارد کنید
2. **علامت‌گذاری به‌عنوان کامل** - آیتم‌های تکمیل‌شده را علامت بزنید
3. **حذف آیتم‌ها** - todoهایی که دیگر نیاز ندارید را حذف کنید

### نظارت بر برنامه شما
```bash
# پورتال Azure را برای منابع خود باز کنید
azd monitor

# مشاهده لاگ‌های برنامه
azd monitor --logs

# مشاهده متریک‌های زنده
azd monitor --live
```

### ✅ تایید استقرار شما

قبل از ادامه، این چک‌لیست سریع را برای اطمینان از عملکرد واقعی همه چیز اجرا کنید — فرض نکنید «استقرار موفق» به‌معنای «برنامه کار می‌کند» است:

```bash
# 1. تأیید کنید که نقطهٔ پایانی وجود دارد و قابل دسترسی است
azd show

# 2. تست سریع (smoke-test) نقطهٔ پایانی (انتظار پاسخ HTTP 200)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. اگر برنامهٔ شما یک نقطهٔ سلامت (health endpoint) ارائه می‌دهد، آن را بررسی کنید
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**استقرار زمانی تأیید می‌شود که:**
- ✅ `azd show` یک URL نقطه پایان قابل دسترس را فهرست کند
- ✅ URL بدون خطا در مرورگر شما باز شود
- ✅ ویژگی‌های اصلی کار کنند (افزودن/تکمیل/حذف یک todo)
- ✅ `azd monitor --logs` نشان دهد که درخواست‌ها می‌رسند بدون خطاهای غیرمنتظره

اگر هر بررسی‌ای ناموفق بود، به [فصل 7: رفع اشکال](../chapter-07-troubleshooting/README.md) بروید.

## گام 6: ایجاد تغییر و دوباره‌استقرار

بیایید یک تغییر ایجاد کنیم و ببینیم به‌روزرسانی چقدر ساده است:

### تغییر API
```bash
# کد API را ویرایش کنید
code src/api/src/routes/lists.js
```

یک هدر پاسخ سفارشی اضافه کنید:
```javascript
// یک هندلر مسیر پیدا کنید و اضافه کنید:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### تنها تغییرات کد را مستقر کنید
```bash
# فقط کد برنامه را مستقر کنید (زیرساخت را نادیده بگیرید)
azd deploy

# این بسیار سریع‌تر از 'azd up' است زیرا زیرساخت از قبل وجود دارد
```

## گام 7: مدیریت چند محیط

یک محیط staging ایجاد کنید تا قبل از تولید تغییرات را آزمایش کنید:

```bash
# ایجاد یک محیط مرحله‌بندی جدید
azd env new staging

# استقرار در محیط مرحله‌بندی
azd up

# بازگشت به محیط توسعه
azd env select dev

# فهرست همهٔ محیط‌ها
azd env list
```

### مقایسه محیط‌ها
```bash
# مشاهده محیط توسعه
azd env select dev
azd show

# مشاهده محیط آزمایشی
azd env select staging
azd show
```

## گام 8: پاک‌سازی منابع

وقتی از آزمایش کردن خسته شدید، برای جلوگیری از هزینه‌های مداوم پاک‌سازی کنید:

```bash
# حذف تمام منابع Azure برای محیط فعلی
azd down

# حذف اجباری بدون تأیید و پاک‌سازی منابع حذف‌شده به‌صورت نرم
azd down --force --purge

# حذف محیط مشخص
azd env select staging
azd down --force --purge
```

## برنامه کلاسیک در مقابل برنامه مبتنی بر هوش مصنوعی: همان روند کاری

شما همین الان یک برنامه وب سنتی مستقر کردید. اما اگر می‌خواستید به‌جای آن یک برنامه مبتنی بر هوش مصنوعی مستقر کنید — مثلاً یک برنامه چت پشتیبانی‌شده توسط Microsoft Foundry Models — چه؟

خبر خوب: **روند کاری یکسان است.**

| Step | Classic Todo App | AI Chat App |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

تنها تفاوت، **قالب**ی است که از آن شروع می‌کنید. یک قالب هوش مصنوعی شامل زیرساخت‌های اضافی (مانند یک منبع Microsoft Foundry Models یا یک ایندکس AI Search) است، اما azd همه این‌ها را برای شما مدیریت می‌کند. نیازی به یادگیری دستورات جدید، استفاده از ابزار متفاوت یا تغییر در نحوه تفکر درباره استقرار ندارید.

این اصل اصلی azd است: **یک روند کاری، هر نوع بار کاری.** مهارت‌هایی که در این آموزش تمرین کردید — مقداردهی اولیه، استقرار، نظارت، دوباره‌استقرار و پاک‌سازی — به‌طور یکسان برای برنامه‌ها و عوامل مبتنی بر هوش مصنوعی کاربرد دارند.

---

## آنچه آموختید

تبریک! شما با موفقیت:
- ✅ یک پروژه azd را از قالب مقداردهی اولیه کردید
- ✅ ساختار پروژه و فایل‌های کلیدی را بررسی کردید
- ✅ یک برنامه فول‌استک را در Azure مستقر کردید
- ✅ تغییرات کد ایجاد کردید و دوباره مستقر کردید
- ✅ چند محیط را مدیریت کردید
- ✅ منابع را پاک‌سازی کردید

## 🎯 تمرین‌های اعتبارسنجی مهارت

### تمرین 1: استقرار یک قالب متفاوت (15 دقیقه)
**هدف**: نمایش تسلط بر azd init و جریان کاری استقرار

```bash
# پشتهٔ پایتون و MongoDB را امتحان کنید
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# استقرار را تأیید کنید
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# پاک‌سازی کنید
azd down --force --purge
```

**معیارهای موفقیت:**
- [ ] برنامه بدون خطا مستقر می‌شود
- [ ] می‌توان URL برنامه را در مرورگر باز کرد
- [ ] برنامه به‌درستی کار می‌کند (افزودن/حذف todo)
- [ ] تمام منابع با موفقیت پاک‌سازی شدند

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

# اعتبارسنجی متغیرها
azd env get-values | grep APP_TITLE

# استقرار با پیکربندی سفارشی
azd up
```

**معیارهای موفقیت:**
- [ ] محیط سفارشی با موفقیت ایجاد شد
- [ ] متغیرهای محیطی تنظیم و قابل بازیابی هستند
- [ ] برنامه با پیکربندی سفارشی مستقر می‌شود
- [ ] می‌توان تنظیمات سفارشی را در برنامه مستقر بررسی کرد

### تمرین 3: جریان کاری چند محیطی (25 دقیقه)
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
- [ ] دو محیط با پیکربندی‌های متفاوت ایجاد شدند
- [ ] هر دو محیط با موفقیت مستقر شدند
- [ ] می‌توان با `azd env select` بین محیط‌ها جابجا شد
- [ ] متغیرهای محیطی بین محیط‌ها متفاوت هستند
- [ ] هر دو محیط با موفقیت پاک‌سازی شدند

## 📊 پیشرفت شما

**زمان صرف‌شده**: ~60-90 دقیقه  
**مهارت‌های کسب‌شده**:
- ✅ مقداردهی اولیه پروژه مبتنی بر قالب
- ✅ فراهم‌آوری منابع Azure
- ✅ جریان‌های کاری استقرار برنامه
- ✅ مدیریت محیط‌ها
- ✅ مدیریت پیکربندی
- ✅ پاک‌سازی منابع و مدیریت هزینه

**مرحله بعدی**: شما آماده هستید برای [راهنمای پیکربندی](configuration.md) تا الگوهای پیشرفته پیکربندی را بیاموزید!

## رفع اشکال مسائل رایج

### خطاهای احراز هویت
```bash
# احراز هویت مجدد با Azure
az login

# دسترسی به اشتراک را بررسی کنید
az account show
```

### شکست‌های استقرار
```bash
# فعال کردن ثبت گزارش‌های اشکال‌زدایی
export AZD_DEBUG=true
azd up --debug

# مشاهده لاگ‌های برنامه در Azure
azd monitor --logs

# برای Container Apps، از Azure CLI استفاده کنید:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### تداخل نام منابع
```bash
# از یک نام محیطی منحصر به فرد استفاده کنید
azd env new dev-$(whoami)-$(date +%s)
```

### مشکلات پورت/شبکه
```bash
# بررسی کنید آیا پورت‌ها در دسترس هستند
netstat -an | grep :3000
netstat -an | grep :3100
```

## مراحل بعدی

حالا که پروژه اول خود را کامل کردید، این موضوعات پیشرفته را کاوش کنید:

### 1. سفارشی‌سازی زیرساخت
- [زیرساخت به‌عنوان کد](../chapter-04-infrastructure/provisioning.md)
- [افزودن دیتابیس‌ها، حافظه و خدمات دیگر](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. راه‌اندازی CI/CD
- [راهنمای استقرار](../chapter-04-infrastructure/deployment-guide.md) - جریان‌های کامل CI/CD
- [مستندات Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - پیکربندی pipeline

### 3. بهترین شیوه‌های تولید
- [راهنمای استقرار](../chapter-04-infrastructure/deployment-guide.md) - امنیت، عملکرد و نظارت

### 4. کاوش قالب‌های بیشتر
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
- [مستندات Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [مرکز معماری Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [چارچوب Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### جامعه و پشتیبانی
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [جامعه توسعه‌دهندگان Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### قالب‌ها و نمونه‌ها
- [گالری رسمی قالب‌ها](https://azure.github.io/awesome-azd/)
- [قالب‌های جامعه](https://github.com/Azure-Samples/azd-templates)
- [الگوهای سازمانی](https://github.com/Azure/azure-dev/tree/main/templates)

---

**تبریک برای اتمام اولین پروژه azd شما!** شما اکنون آماده‌اید تا با اطمینان برنامه‌های شگفت‌انگیز را روی Azure بسازید و مستقر کنید.

---

**ناوبری فصل:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل 1 - بنیاد و شروع سریع
- **⬅️ قبلی**: [نصب و راه‌اندازی](installation.md)
- **➡️ بعدی**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 فصل بعدی**: [فصل 2: توسعه مبتنی بر هوش مصنوعی](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->