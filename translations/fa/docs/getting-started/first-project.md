<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e131a5271d4c8eb0d44ae82302f8fd1a",
  "translation_date": "2025-09-12T17:10:47+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "fa"
}
-->
# پروژه اول شما - آموزش عملی

**قبلی:** [پیکربندی](configuration.md) | **بعدی:** [ادغام Azure AI Foundry](../ai-foundry/azure-ai-foundry-integration.md)

## مقدمه

به اولین پروژه Azure Developer CLI خود خوش آمدید! این آموزش جامع و عملی، راهنمای کاملی برای ایجاد، استقرار و مدیریت یک برنامه فول‌استک در Azure با استفاده از azd ارائه می‌دهد. شما با یک برنامه واقعی مدیریت وظایف کار خواهید کرد که شامل یک رابط کاربری React، بک‌اند API با Node.js و پایگاه داده MongoDB است.

## اهداف یادگیری

با تکمیل این آموزش، شما:
- فرآیند اولیه‌سازی پروژه azd با استفاده از قالب‌ها را یاد خواهید گرفت
- ساختار پروژه و فایل‌های پیکربندی Azure Developer CLI را درک خواهید کرد
- استقرار کامل برنامه در Azure همراه با ایجاد زیرساخت را اجرا خواهید کرد
- استراتژی‌های به‌روزرسانی و استقرار مجدد برنامه را پیاده‌سازی خواهید کرد
- محیط‌های مختلف برای توسعه و آزمایش را مدیریت خواهید کرد
- شیوه‌های پاکسازی منابع و مدیریت هزینه‌ها را اعمال خواهید کرد

## نتایج یادگیری

پس از اتمام، شما قادر خواهید بود:
- پروژه‌های azd را به‌طور مستقل از قالب‌ها اولیه‌سازی و پیکربندی کنید
- ساختار پروژه‌های azd را به‌طور مؤثر پیمایش و تغییر دهید
- برنامه‌های فول‌استک را با استفاده از دستورات ساده در Azure مستقر کنید
- مشکلات رایج استقرار و مسائل احراز هویت را رفع کنید
- محیط‌های مختلف Azure را برای مراحل مختلف استقرار مدیریت کنید
- جریان‌های استقرار مداوم برای به‌روزرسانی برنامه‌ها را پیاده‌سازی کنید

## شروع به کار

### چک‌لیست پیش‌نیازها
- ✅ نصب Azure Developer CLI ([راهنمای نصب](installation.md))
- ✅ نصب و احراز هویت Azure CLI
- ✅ نصب Git روی سیستم شما
- ✅ Node.js نسخه 16 یا بالاتر (برای این آموزش)
- ✅ Visual Studio Code (توصیه‌شده)

### تأیید تنظیمات شما
```bash
# Check azd installation
azd version
```
### تأیید احراز هویت Azure

```bash
az account show
```

### بررسی نسخه Node.js
```bash
node --version
```

## مرحله ۱: انتخاب و اولیه‌سازی یک قالب

بیایید با یک قالب محبوب برنامه مدیریت وظایف که شامل رابط کاربری React و بک‌اند API با Node.js است شروع کنیم.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### چه اتفاقی افتاد؟
- کد قالب به دایرکتوری محلی شما دانلود شد
- یک فایل `azure.yaml` با تعریف سرویس‌ها ایجاد شد
- کد زیرساخت در دایرکتوری `infra/` تنظیم شد
- یک پیکربندی محیط ایجاد شد

## مرحله ۲: بررسی ساختار پروژه

بیایید ببینیم azd برای ما چه چیزی ایجاد کرده است:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
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
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - تعریف زیرساخت:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## مرحله ۳: سفارشی‌سازی پروژه شما (اختیاری)

قبل از استقرار، می‌توانید برنامه را سفارشی کنید:

### تغییر رابط کاربری
```bash
# Open the React app component
code src/web/src/App.tsx
```

یک تغییر ساده ایجاد کنید:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### پیکربندی متغیرهای محیطی
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## مرحله ۴: استقرار در Azure

حالا قسمت هیجان‌انگیز - همه چیز را در Azure مستقر کنید!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### چه اتفاقی در طول استقرار می‌افتد؟

دستور `azd up` این مراحل را انجام می‌دهد:
1. **ایجاد زیرساخت** (`azd provision`) - منابع Azure ایجاد می‌شوند
2. **بسته‌بندی** - کد برنامه شما ساخته می‌شود
3. **استقرار** (`azd deploy`) - کد به منابع Azure مستقر می‌شود

### خروجی مورد انتظار
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## مرحله ۵: آزمایش برنامه شما

### دسترسی به برنامه شما
روی URL ارائه‌شده در خروجی استقرار کلیک کنید، یا هر زمان آن را دریافت کنید:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### آزمایش برنامه مدیریت وظایف
1. **افزودن یک وظیفه** - روی "Add Todo" کلیک کنید و یک وظیفه وارد کنید
2. **علامت‌گذاری به‌عنوان کامل‌شده** - وظایف کامل‌شده را علامت بزنید
3. **حذف وظایف** - وظایفی که دیگر نیاز ندارید را حذف کنید

### نظارت بر برنامه شما
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## مرحله ۶: ایجاد تغییرات و استقرار مجدد

بیایید یک تغییر ایجاد کنیم و ببینیم چگونه به‌راحتی می‌توان به‌روزرسانی کرد:

### تغییر API
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

یک هدر پاسخ سفارشی اضافه کنید:
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

## مرحله ۷: مدیریت محیط‌های متعدد

یک محیط آزمایشی ایجاد کنید تا تغییرات را قبل از تولید آزمایش کنید:

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

## مرحله ۸: پاکسازی منابع

وقتی آزمایش شما تمام شد، منابع را پاک کنید تا از هزینه‌های مداوم جلوگیری کنید:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## آنچه یاد گرفته‌اید

تبریک! شما با موفقیت:
- یک پروژه azd را از قالب اولیه‌سازی کردید
- ساختار پروژه و فایل‌های کلیدی را بررسی کردید
- یک برنامه فول‌استک را در Azure مستقر کردید
- تغییرات کد ایجاد کردید و مجدداً مستقر کردید
- محیط‌های متعدد را مدیریت کردید
- منابع را پاکسازی کردید

## رفع مشکلات رایج

### خطاهای احراز هویت
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### شکست‌های استقرار
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### تضاد نام منابع
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

## مراحل بعدی

حالا که اولین پروژه خود را تکمیل کرده‌اید، این موضوعات پیشرفته را بررسی کنید:

### ۱. سفارشی‌سازی زیرساخت
- [زیرساخت به‌عنوان کد](../deployment/provisioning.md)
- [افزودن پایگاه داده‌ها، ذخیره‌سازی و خدمات دیگر](../deployment/provisioning.md#adding-services)

### ۲. تنظیم CI/CD
- [ادغام GitHub Actions](../deployment/cicd-integration.md)
- [پایپ‌لاین‌های Azure DevOps](../deployment/cicd-integration.md#azure-devops)

### ۳. بهترین شیوه‌های تولید
- [پیکربندی‌های امنیتی](../deployment/best-practices.md#security)
- [بهینه‌سازی عملکرد](../deployment/best-practices.md#performance)
- [نظارت و ثبت لاگ‌ها](../deployment/best-practices.md#monitoring)

### ۴. بررسی قالب‌های بیشتر
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## منابع اضافی

### مواد آموزشی
- [مستندات Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [مرکز معماری Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [چارچوب خوب معماری Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

### جامعه و پشتیبانی
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [جامعه توسعه‌دهندگان Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### قالب‌ها و مثال‌ها
- [گالری قالب رسمی](https://azure.github.io/awesome-azd/)
- [قالب‌های جامعه](https://github.com/Azure-Samples/azd-templates)
- [الگوهای سازمانی](https://github.com/Azure/azure-dev/tree/main/templates)

---

**تبریک بابت تکمیل اولین پروژه azd شما!** اکنون آماده هستید تا با اطمینان برنامه‌های شگفت‌انگیزی را در Azure بسازید و مستقر کنید.

---

**قبلی:** [پیکربندی](configuration.md) | **بعدی:** [ادغام Azure AI Foundry](../ai-foundry/azure-ai-foundry-integration.md)
- **درس بعدی:** [راهنمای استقرار](../deployment/deployment-guide.md)

---

**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما تلاش می‌کنیم دقت را حفظ کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌ها باشند. سند اصلی به زبان اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس، توصیه می‌شود از ترجمه حرفه‌ای انسانی استفاده کنید. ما مسئولیتی در قبال سوء تفاهم‌ها یا تفسیرهای نادرست ناشی از استفاده از این ترجمه نداریم.