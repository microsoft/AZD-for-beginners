# پروژه اول شما - آموزش عملی

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## مقدمه

به اولین پروژه Azure Developer CLI خود خوش آمدید! این آموزش عملی جامع یک راهنمای کامل برای ایجاد، استقرار و مدیریت یک برنامه فول‌استک در Azure با استفاده از azd فراهم می‌کند. شما با یک برنامه واقعی todo کار خواهید کرد که شامل یک فرانت‌اند React، بک‌اند Node.js و پایگاه‌داده MongoDB است.

## اهداف یادگیری

با تکمیل این آموزش، شما:
- جریان کار راه‌اندازی پروژه azd با استفاده از قالب‌ها را مسلط خواهید شد
- ساختار پروژه Azure Developer CLI و فایل‌های پیکربندی را درک خواهید کرد
- اجرای استقرار کامل برنامه در Azure همراه با فراهم‌سازی زیرساخت را خواهید آموخت
- استراتژی‌های به‌روزرسانی برنامه و استقرار مجدد را پیاده‌سازی خواهید کرد
- مدیریت چندین محیط برای توسعه و staging را انجام خواهید داد
- روش‌های پاک‌سازی منابع و مدیریت هزینه را اعمال خواهید کرد

## نتایج یادگیری

پس از تکمیل، شما قادر خواهید بود:
- پروژه‌های azd را به‌طور مستقل از قالب‌ها مقداردهی اولیه و پیکربندی کنید
- ساختارهای پروژه azd را به‌طور مؤثر مرور و تغییر دهید
- برنامه‌های فول‌استک را با استفاده از دستورات واحد به Azure مستقر کنید
- مسائل رایج استقرار و مشکلات احراز هویت را عیب‌یابی کنید
- چندین محیط Azure را برای مراحل استقرار مختلف مدیریت کنید
- جریان‌های کاری استقرار پیوسته برای به‌روزرسانی برنامه را پیاده‌سازی کنید

## شروع کار

### فهرست پیش‌نیازها
- ✅ Azure Developer CLI نصب شده است ([Installation Guide](installation.md))
- ✅ Azure CLI نصب و احراز هویت شده است
- ✅ Git روی سیستم شما نصب شده است
- ✅ Node.js نسخه 16+ (برای این آموزش)
- ✅ Visual Studio Code (توصیه‌شده)

### بررسی تنظیمات شما
```bash
# نصب azd را بررسی کنید
azd version
```
### بررسی احراز هویت Azure

```bash
az account show
```

### بررسی نسخه Node.js
```bash
node --version
```

## گام 1: انتخاب و مقداردهی اولیه یک قالب

بیایید با یک قالب محبوب برنامه todo که شامل فرانت‌اند React و بک‌اند Node.js است شروع کنیم.

```bash
# قالب‌های موجود را مرور کنید
azd template list

# قالب برنامه todo را مقداردهی اولیه کنید
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# دستورالعمل‌ها را دنبال کنید:
# - نام محیط را وارد کنید: «dev»
# - یک اشتراک را انتخاب کنید (اگر چندین مورد دارید)
# - یک منطقه را انتخاب کنید: «East US 2» (یا منطقهٔ مورد علاقه‌تان)
```

### چه اتفاقی افتاد؟
- کد قالب به دایرکتوری محلی شما دانلود شد
- یک فایل `azure.yaml` با تعریف سرویس‌ها ایجاد شد
- کد زیرساخت در دایرکتوری `infra/` راه‌اندازی شد
- یک پیکربندی محیط ساخته شد

## گام 2: مرور ساختار پروژه

بیایید ببینیم azd برای ما چه ایجاد کرده است:

```bash
# نمایش ساختار پروژه
tree /f   # ویندوز
# یا
find . -type f | head -20   # مک‌اواس/لینوکس
```

You should see:
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
# پیکربندی پروژه را مشاهده کنید
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
# کامپوننت برنامهٔ React را باز کنید
code src/web/src/App.tsx
```

یک تغییر ساده انجام دهید:
```typescript
// عنوان را پیدا کنید و آن را تغییر دهید
<h1>My Awesome Todo App</h1>
```

### پیکربندی متغیرهای محیطی
```bash
# تنظیم متغیرهای محیطی سفارشی
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# نمایش تمام متغیرهای محیطی
azd env get-values
```

## گام 4: استقرار در Azure

حالا بخش هیجان‌انگیز — همه چیز را در Azure مستقر کنید!

```bash
# استقرار زیرساخت و برنامه
azd up

# این فرمان موارد زیر را انجام می‌دهد:
# 1. ایجاد و پیکربندی منابع Azure (App Service، Cosmos DB و غیره)
# 2. برنامهٔ شما را می‌سازد
# 3. استقرار برنامه در منابع ایجادشده
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
روی URL ارائه شده در خروجی استقرار کلیک کنید، یا هر زمان آن را دریافت کنید:
```bash
# نقاط پایانی برنامه را دریافت کنید
azd show

# برنامه را در مرورگر خود باز کنید
azd show --output json | jq -r '.services.web.endpoint'
```

### آزمایش برنامه Todo
1. **Add a todo item** - روی "Add Todo" کلیک کنید و یک کار وارد کنید
2. **Mark as complete** - آیتم‌های تکمیل‌شده را علامت‌دار کنید
3. **Delete items** - آیتم‌هایی را که دیگر نیاز ندارید حذف کنید

### نظارت بر برنامه شما
```bash
# پورتال Azure را برای منابع خود باز کنید
azd monitor

# مشاهده گزارش‌های برنامه
azd monitor --logs

# مشاهده معیارهای زنده
azd monitor --live
```

## گام 6: ایجاد تغییرات و استقرار مجدد

بیایید یک تغییر ایجاد کنیم و ببینیم به‌روزرسانی چقدر آسان است:

### تغییر API
```bash
# کد API را ویرایش کنید
code src/api/src/routes/lists.js
```

یک هدر پاسخ سفارشی اضافه کنید:
```javascript
// یک کنترل‌کنندهٔ مسیر پیدا کنید و اضافه کنید:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### فقط تغییرات کد را مستقر کنید
```bash
# فقط کد برنامه را مستقر کنید (زیرساخت را نادیده بگیرید)
azd deploy

# این بسیار سریع‌تر از 'azd up' است چون زیرساخت از قبل موجود است
```

## گام 7: مدیریت چندین محیط

یک محیط staging ایجاد کنید تا تغییرات را قبل از تولید آزمایش کنید:

```bash
# یک محیط پیش‌تولید جدید ایجاد کنید
azd env new staging

# به محیط پیش‌تولید استقرار دهید
azd up

# به محیط توسعه برگردید
azd env select dev

# تمام محیط‌ها را فهرست کنید
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

## گام 8: پاک‌سازی منابع

وقتی کار آزمایشی شما تمام شد، برای جلوگیری از هزینه‌های مداوم منابع را پاک کنید:

```bash
# حذف تمام منابع Azure برای محیط فعلی
azd down

# حذف اجباری بدون تأیید و پاک‌سازی منابع حذف‌شده به‌صورت نرم
azd down --force --purge

# حذف محیط مشخص
azd env select staging
azd down --force --purge
```

## برنامه کلاسیک در مقابل برنامه مبتنی بر هوش مصنوعی: همان گردش‌کار

شما به‌تازگی یک برنامه وب سنتی را مستقر کردید. اما اگر بخواهید به‌جای آن یک برنامه مبتنی بر هوش مصنوعی مستقر کنید — مثلاً یک برنامه چت پشتیبانی‌شده توسط Microsoft Foundry Models — چه؟

خبر خوب: **گردش‌کار یکسان است.**

| Step | Classic Todo App | AI Chat App |
|------|-----------------|-------------|
| راه‌اندازی | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| احراز هویت | `azd auth login` | `azd auth login` |
| استقرار | `azd up` | `azd up` |
| نظارت | `azd monitor` | `azd monitor` |
| پاک‌سازی | `azd down --force --purge` | `azd down --force --purge` |

تنها تفاوت، **قالب**ی است که از آن شروع می‌کنید. یک قالب AI شامل زیرساخت‌های اضافی (مانند منبع Microsoft Foundry Models یا یک شاخص AI Search) است، اما azd همهٔ این‌ها را برای شما مدیریت می‌کند. نیازی نیست دستورات جدیدی یاد بگیرید، ابزار متفاوتی بپذیرید، یا نحوهٔ تفکر در مورد استقرار را تغییر دهید.

این اصل کلیدی azd است: **یک گردش‌کار، هر بار بار کاری.** مهارت‌هایی که در این آموزش تمرین کردید — مقداردهی اولیه، استقرار، نظارت، استقرار مجدد، و پاک‌سازی — به همان اندازه برای برنامه‌ها و عوامل مبتنی بر هوش مصنوعی نیز کاربرد دارند.

---

## آنچه آموخته‌اید

تبریک! شما با موفقیت:
- ✅ یک پروژه azd را از قالب مقداردهی اولیه کردید
- ✅ ساختار پروژه و فایل‌های کلیدی را مرور کردید
- ✅ یک برنامه فول‌استک را در Azure مستقر کردید
- ✅ تغییرات کد ایجاد کرده و مجدداً مستقر کردید
- ✅ چندین محیط را مدیریت کردید
- ✅ منابع را پاک‌سازی کردید

## 🎯 تمرین‌های اعتبارسنجی مهارت

### تمرین 1: استقرار یک قالب متفاوت (15 دقیقه)
**هدف**: نشان‌دادن تسلط بر azd init و جریان کار استقرار

```bash
# استک پایتون و MongoDB را امتحان کنید
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# استقرار را بررسی کنید
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# پاک‌سازی کنید
azd down --force --purge
```

**معیارهای موفقیت:**
- [ ] برنامه بدون خطا مستقر می‌شود
- [ ] می‌توان URL برنامه را در مرورگر باز کرد
- [ ] برنامه به‌درستی کار می‌کند (افزودن/حذف todos)
- [ ] همه منابع با موفقیت پاک‌سازی شدند

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

# تأیید متغیرها
azd env get-values | grep APP_TITLE

# استقرار با پیکربندی سفارشی
azd up
```

**معیارهای موفقیت:**
- [ ] محیط سفارشی با موفقیت ایجاد شد
- [ ] متغیرهای محیطی تنظیم و قابل بازیابی هستند
- [ ] برنامه با پیکربندی سفارشی مستقر می‌شود
- [ ] می‌توان تنظیمات سفارشی را در برنامه مستقر شده بررسی کرد

### تمرین 3: جریان کار چندمحیطی (25 دقیقه)
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

# مقایسه محیط‌ها
azd env list

# هر دو محیط را آزمایش کنید
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# هر دو محیط را پاکسازی کنید
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**معیارهای موفقیت:**
- [ ] دو محیط با پیکربندی‌های متفاوت ایجاد شدند
- [ ] هر دو محیط با موفقیت مستقر شدند
- [ ] می‌توان بین محیط‌ها با استفاده از `azd env select` جابجا شد
- [ ] متغیرهای محیطی بین محیط‌ها متفاوت هستند
- [ ] هر دو محیط با موفقیت پاک‌سازی شدند

## 📊 پیشرفت شما

**زمان صرف‌شده**: ~60-90 دقیقه  
**مهارت‌های کسب‌شده**:
- ✅ مقداردهی اولیه پروژه مبتنی بر قالب
- ✅ فراهم‌سازی منابع Azure
- ✅ جریان‌های کاری استقرار برنامه
- ✅ مدیریت محیط
- ✅ مدیریت پیکربندی
- ✅ پاک‌سازی منابع و مدیریت هزینه

**مرحله بعدی**: شما آماده‌اید تا [Configuration Guide](configuration.md) را برای یادگیری الگوهای پیشرفته پیکربندی مطالعه کنید!

## رفع اشکال مسائل رایج

### خطاهای احراز هویت
```bash
# دوباره با Azure احراز هویت کنید
az login

# دسترسی به اشتراک را بررسی کنید
az account show
```

### شکست‌های استقرار
```bash
# فعال‌سازی ثبت گزارش‌های اشکال‌زدایی
export AZD_DEBUG=true
azd up --debug

# مشاهده گزارش‌های برنامه در Azure
azd monitor --logs

# برای Container Apps، از Azure CLI استفاده کنید:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### تعارض نام منابع
```bash
# از یک نام یکتا برای محیط استفاده کنید
azd env new dev-$(whoami)-$(date +%s)
```

### مسائل پورت/شبکه
```bash
# بررسی کنید آیا پورت‌ها در دسترس هستند
netstat -an | grep :3000
netstat -an | grep :3100
```

## مراحل بعدی

حالا که اولین پروژه خود را تکمیل کرده‌اید، این موضوعات پیشرفته را بررسی کنید:

### 1. سفارشی‌سازی زیرساخت
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add databases, storage, and other services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. راه‌اندازی CI/CD
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - جریان‌های کاری کامل CI/CD
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - پیکربندی pipeline

### 3. بهترین روش‌ها برای تولید
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - امنیت، عملکرد و نظارت

### 4. بررسی قالب‌های بیشتر
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

### اجتماع و پشتیبانی
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### قالب‌ها و مثال‌ها
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**تبریک برای تکمیل اولین پروژه azd خود!** شما اکنون آماده‌اید تا با اطمینان برنامه‌های شگفت‌انگیزی را در Azure بسازید و مستقر کنید.

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Next Lesson**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمهٔ هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما برای دقت تلاش می‌کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری‌اش باید به‌عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمهٔ حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوءتفاهم یا تفسیر نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->