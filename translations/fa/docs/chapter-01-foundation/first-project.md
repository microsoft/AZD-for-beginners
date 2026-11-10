# پروژه اول شما - آموزش عملی

**ناوبری فصل:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل 1 - بنیاد و شروع سریع
- **⬅️ قبلی**: [نصب و راه‌اندازی](installation.md)
- **➡️ بعدی**: [برنامه خودت را بیاور](bring-your-own-app.md)
- **🚀 فصل بعدی**: [فصل 2: توسعه با محوریت هوش مصنوعی](../chapter-02-ai-development/microsoft-foundry-integration.md)

## مقدمه

به اولین پروژه Azure Developer CLI خود خوش آمدید! شما یک برنامه todo با فرانت‌اند React، API با Node.js و پایگاه داده Azure Cosmos DB را مستقر خواهید کرد. قالب به نام تاریخی `todo-nodejs-mongo` وفادار مانده است؛ زیرساخت فعلی آن از Cosmos DB برای NoSQL استفاده می‌کند، بنابراین به جای استنباط API پایگاه داده از نام، فایل README دانلود شده و `infra/` را بررسی کنید.

> مرور شده در نوامبر 2026 بر اساس `azd 1.37.2` و قالب عمومی. نمونه‌های زیر از Bash استفاده می‌کنند؛ استخراج JSON نیز به `jq` نیاز دارد. مستقرسازی‌های Azure هزینه‌بر است و در این مرور اجرا نشده‌اند.

## اهداف یادگیری

با تکمیل این آموزش، شما قادر خواهید بود:
- تسلط بر جریان کاری مقداردهی اولیه پروژه azd با استفاده از قالب‌ها
- درک ساختار پروژه Azure Developer CLI و فایل‌های پیکربندی
- اجرای کامل مستقرسازی برنامه به Azure با تأمین زیرساخت
- پیاده‌سازی به‌روزرسانی‌ها و استراتژی‌های مستقرسازی مجدد برنامه
- مدیریت چندین محیط برای توسعه و مراحل آماده‌سازی
- اعمال روش‌های پاکسازی منابع و مدیریت هزینه‌ها

## نتایج یادگیری

پس از اتمام، شما می‌توانید:
- پروژه‌های azd را به‌صورت مستقل از قالب‌ها مقداردهی و پیکربندی کنید
- ساختارهای پروژه azd را به‌طور مؤثر کاوش و اصلاح کنید
- برنامه‌های کامل را با یک فرمان به Azure مستقر کنید
- مشکلات رایج مستقرسازی و احراز هویت را رفع کنید
- چند محیط Azure را برای مراحل مختلف استقرار مدیریت کنید
- گردش‌های کاری مستقرسازی مداوم برای به‌روزرسانی برنامه‌ها پیاده‌سازی کنید

## شروع به کار

### فهرست پیش‌نیازها
- ✅ نصب Azure Developer CLI ([راهنمای نصب](installation.md))
- ✅ احراز هویت AZD با `azd auth login` تکمیل شده
- ✅ نصب Git در سیستم شما
- ✅ Node.js نسخه 22 LTS (یا نسخه‌ای که قالب دانلود شده پشتیبانی می‌کند)
- ✅ Visual Studio Code (توصیه‌شده)

قبل از ادامه، اعتبارسنج راه‌اندازی را از ریشه مخزن اجرا کنید:

**ویندوز:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### اعتبارسنجی راه‌اندازی شما
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### اعتبارسنجی احراز هویت اختیاری Azure CLI

```bash
az account show
```

### بررسی نسخه Node.js
```bash
node --version
```

## گام 1: انتخاب و مقداردهی اولیه یک قالب

بیایید با یک قالب محبوب برنامه todo شروع کنیم که یک فرانت‌اند React و یک بک‌اند API با Node.js دارد.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### چه اتفاقی افتاد؟
- کد قالب به دایرکتوری محلی شما دانلود شد
- یک فایل `azure.yaml` با تعاریف سرویس‌ها ایجاد شد
- کد زیرساخت در دایرکتوری `infra/` تنظیم شد
- یک پیکربندی محیط ساخته شد

## گام 2: بررسی ساختار پروژه

بیایید ببینیم azd چه ساختاری برای ما ایجاد کرده است:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

باید موارد زیر را ببینید:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### فایل‌های کلیدی برای درک

**azure.yaml** - قلب پروژه azd شما:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - تعریف زیرساخت:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## گام 3: سفارشی‌سازی پروژه (اختیاری)

قبل از استقرار، می‌توانید برنامه را سفارشی کنید:

### اصلاح فرانت‌اند
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

یک تغییر ساده ایجاد کنید:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### پیکربندی متغیرهای محیطی
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

این دو مقدار سفارشی فقط ذخیره محلی را نشان می‌دهند. قالب موجود از `WEBSITE_TITLE` یا `API_VERSION` استفاده نمی‌کند، بنابراین برنامه تغییر نمی‌کند. ویرایش منبع صریح بالا عنوان نمایش داده شده را تغییر می‌دهد.

## گام 4: استقرار به Azure

حالا به قسمت هیجان‌انگیز می‌رسیم - همه چیز را به Azure مستقر کنید!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### در حین استقرار چه اتفاقی می‌افتد؟

جریان کاری زیرساخت را فراهم می‌کند و کد را بسته‌بندی/مستقر می‌کند. ترتیب دقیق از طریق `workflows.up` در `azure.yaml` قابل تنظیم است؛ این قالب «فراهم‌سازی» و سپس «مستقرسازی» را مشخص می‌کند. به ترتیب یکسان برای همه قالب‌ها تکیه نکنید.

### خروجی مورد انتظار
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## گام 5: آزمایش برنامه خود

### دسترسی به برنامه شما
روی URL ارائه شده در خروجی استقرار کلیک کنید، یا هر زمان آن را دریافت کنید:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### آزمایش برنامهTodo
۱. **افزودن یک مورد todo** - روی «افزودن Todo» کلیک کنید و یک کار وارد کنید
۲. **علامت‌گذاری به‌عنوان انجام شده** - موارد انجام شده را علامت بزنید
۳. **حذف موارد** - تو‌دوی‌هایی که دیگر لازم ندارید را حذف کنید

### نظارت بر برنامه شما
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ تأیید استقرار شما

قبل از ادامه، این چک‌لیست سریع را برای تأیید عملکرد واقعاً همه چیز اجرا کنید—فرض نکنید «استقرار موفق بود» یعنی «برنامه کار می‌کند»:

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**استقرار وقتی تأیید می‌شود که:**
- ✅ `azd show` یک URL نقطه دسترسی قابل دسترس فهرست می‌کند
- ✅ URL در مرورگر بدون خطا باز می‌شود
- ✅ ویژگی‌های اصلی کار می‌کنند (افزودن/تکمیل/حذف یک todo)
- ✅ `azd monitor --logs` درخواست‌ها را بدون خطاهای غیرمنتظره نشان می‌دهد

اگر هر بررسی شکست خورد، به [فصل 7: رفع مشکل](../chapter-07-troubleshooting/README.md) بروید.

## گام 6: ایجاد تغییرات و استقرار مجدد

بیایید یک تغییر ایجاد کنیم و ببینیم به‌روزرسانی چقدر آسان است:

### اصلاح API
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

افزودن هدر پاسخ سفارشی:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### فقط تغییرات کد را مستقر کنید
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## گام 7: مدیریت چند محیط

یک محیط staging ایجاد کنید تا تغییرات قبل از تولید آزمایش شوند:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### مقایسه محیط‌ها
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## گام 8: پاکسازی منابع

وقتی آزمایشتان تمام شد، برای جلوگیری از شارژهای مکرر پاکسازی کنید:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## برنامه کلاسیک در مقابل برنامه هوش مصنوعی: همان جریان کاری

شما به‌تازگی یک برنامه وب سنتی مستقر کرده‌اید. اما اگر می‌خواستید یک برنامه مبتنی بر هوش مصنوعی، مثلاً یک برنامه چت با پشتیبانی مدل‌های Microsoft Foundry، مستقر کنید چه؟

خبر خوب: **جریان کاری یکسان است.**

| گام | برنامه کلاسیک Todo | برنامه چت هوش مصنوعی |
|------|-----------------|-------------|
| مقداردهی اولیه (دایرکتوری خالی) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| احراز هویت | `azd auth login` | `azd auth login` |
| استقرار | `azd up` | `azd up` |
| نظارت | `azd monitor` | `azd monitor` |
| پاکسازی | `azd down --force --purge` | `azd down --force --purge` |

دستورات چرخه حیات یکسان است، اما پیش‌نیازها متفاوت‌اند. یک قالب هوش مصنوعی ممکن است به دسترسی مدل، سهمیه منطقه‌ای، ورود داده و پیکربندی اضافی نیاز داشته باشد. قبل از استقرار README آن را بخوانید؛ `azd up` نمی‌تواند مجوزها یا سهمیه‌های از دست رفته را تأمین کند.

این اصل اصلی azd است: **یک جریان کاری، هر بار کاری.** مهارت‌هایی که در این آموزش تمرین کردید—مقداردهی اولیه، استقرار، نظارت، استقرار مجدد و پاکسازی—به همان اندازه برای برنامه‌های هوش مصنوعی و عوامل نیز کاربرد دارد.

---

## آنچه آموختید

تبریک! شما با موفقیت:
- ✅ یک پروژه azd را از قالب مقداردهی اولیه کردید
- ✅ ساختار پروژه و فایل‌های کلیدی را بررسی کردید
- ✅ یک برنامه فول-استک را به Azure مستقر کردید
- ✅ تغییرات کد را ایجاد کرده و مجدداً مستقر کردید
- ✅ چند محیط را مدیریت کردید
- ✅ منابع را پاکسازی کردید

## 🎯 تمرین‌های اعتبارسنجی مهارت

### تمرین 1: استقرار یک قالب متفاوت (۱۵ دقیقه)
**هدف**: اثبات تسلط بر پرورش azd init و جریان کاری استقرار

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**معیارهای موفقیت:**
- [ ] برنامه بدون خطا مستقر شود
- [ ] به URL برنامه در مرورگر دسترسی داشته باشد
- [ ] برنامه به‌درستی کار کند (افزودن/حذف todo)
- [ ] تمام منابع با موفقیت پاکسازی شوند

### تمرین 2: سفارشی سازی پیکربندی (۲۰ دقیقه)
**هدف**: تمرین ذخیره مقادیر محیط محلی بدون اشتباه گرفتن آن با پیکربندی زمان اجرا

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**معیارهای موفقیت:**
- [ ] محیط سفارشی با موفقیت ایجاد شده باشد
- [ ] متغیرهای محیطی تنظیم شده و قابل بازیابی باشند
- [ ] `azd env get-value APP_TITLE` چاپ می‌کند `My Custom Todo App`
- [ ] می‌تواند توضیح دهد چرا این مقادیر تغییری در برنامه استوک ایجاد نمی‌کنند مگر اینکه کد/زیرساخت از آن‌ها استفاده کند

### تمرین ۳: جریان کاری چند محیطی (۲۵ دقیقه)
**هدف**: تسلط بر مدیریت محیط و استراتژی‌های استقرار

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**معیارهای موفقیت:**
- [ ] دو محیط با پیکربندی‌های مختلف ایجاد شده‌اند
- [ ] هر دو محیط با موفقیت مستقر شده‌اند
- [ ] قابلیت تغییر بین محیط‌ها با استفاده از `azd env select`
- [ ] متغیرهای محیطی در بین محیط‌ها متفاوت است
- [ ] پاک‌سازی موفق هر دو محیط انجام شد

## 📊 پیشرفت شما

**زمان صرف‌شده**: حدود ۶۰-۹۰ دقیقه  
**مهارت‌های کسب‌شده**:
- ✅ شروع پروژه مبتنی بر قالب
- ✅ تخصیص منابع Azure
- ✅ روندهای استقرار برنامه
- ✅ مدیریت محیط
- ✅ مدیریت پیکربندی
- ✅ پاک‌سازی منابع و مدیریت هزینه

**مرحله بعدی**: شما آماده [راهنمای پیکربندی](../chapter-03-configuration/configuration.md) هستید تا الگوهای پیشرفته پیکربندی را بیاموزید!

## رفع اشکال مشکلات رایج

### خطاهای احراز هویت
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### شکست‌های استقرار
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### تداخل در نام منابع
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### مشکلات پورت/شبکه
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## گام‌های بعدی

اکنون که پروژه اول خود را کامل کرده‌اید، این موضوعات پیشرفته را بررسی کنید:

### ۱. سفارشی‌سازی زیرساخت
- [زیرساخت به عنوان کد](../chapter-04-infrastructure/provisioning.md)
- [افزودن زیرساخت پایگاه داده](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### ۲. راه‌اندازی CI/CD
- [راهنمای استقرار](../chapter-04-infrastructure/deployment-guide.md) - روندهای کامل CI/CD
- [مستندات Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - پیکربندی خط لوله

### ۳. بهترین روش‌های تولید
- [راهنمای استقرار](../chapter-04-infrastructure/deployment-guide.md) - امنیت، عملکرد و مانیتورینگ

### ۴. اکتشاف قالب‌های بیشتر
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## منابع اضافی

### مطالب آموزشی
- [مستندات Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [مرکز معماری Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [چارچوب خوب-معماری شده Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

### جامعه و پشتیبانی
- [گیت‌هاب Azure Developer CLI](https://github.com/Azure/azure-dev)
- [جامعه توسعه‌دهندگان Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### قالب‌ها و نمونه‌ها
- [گالری قالب رسمی](https://azure.github.io/awesome-azd/)
- [مشارکت‌های قالب جامعه](https://github.com/Azure/awesome-azd)
- [منبع قالب Todo](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**تبریک به خاطر تکمیل اولین پروژه azd خود!** اکنون شما آماده‌اید تا برنامه‌های شگفت‌انگیز را با اطمینان در Azure بسازید و مستقر کنید.

---

**راهنمای فصل:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل ۱ - بنیاد و شروع سریع
- **⬅️ قبلی**: [نصب و راه‌اندازی](installation.md)
- **➡️ بعدی**: [آوردن برنامه شخصی](bring-your-own-app.md)
- **🚀 فصل بعدی**: [فصل ۲: توسعه هوش مصنوعی‌محور](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->