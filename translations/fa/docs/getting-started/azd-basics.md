<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "88986b920b82d096f82d6583f5e0a6e6",
  "translation_date": "2025-09-17T16:24:06+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "fa"
}
-->
# اصول اولیه AZD - درک Azure Developer CLI

# اصول اولیه AZD - مفاهیم اصلی و پایه

**راهنمای فصل:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل فعلی**: فصل ۱ - مبانی و شروع سریع
- **⬅️ قبلی**: [نمای کلی دوره](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ بعدی**: [نصب و راه‌اندازی](installation.md)
- **🚀 فصل بعدی**: [فصل ۲: توسعه مبتنی بر هوش مصنوعی](../ai-foundry/azure-ai-foundry-integration.md)

## مقدمه

این درس شما را با Azure Developer CLI (azd) آشنا می‌کند، یک ابزار قدرتمند خط فرمان که فرآیند توسعه محلی تا استقرار در Azure را تسریع می‌کند. شما مفاهیم اصلی، ویژگی‌های کلیدی و نحوه ساده‌سازی استقرار برنامه‌های ابری توسط azd را خواهید آموخت.

## اهداف یادگیری

در پایان این درس، شما:
- درک خواهید کرد که Azure Developer CLI چیست و هدف اصلی آن چیست
- با مفاهیم اصلی مانند قالب‌ها، محیط‌ها و سرویس‌ها آشنا خواهید شد
- ویژگی‌های کلیدی مانند توسعه مبتنی بر قالب و زیرساخت به عنوان کد را بررسی خواهید کرد
- ساختار پروژه azd و جریان کاری آن را خواهید فهمید
- آماده نصب و پیکربندی azd برای محیط توسعه خود خواهید بود

## نتایج یادگیری

پس از تکمیل این درس، شما قادر خواهید بود:
- نقش azd در جریان‌های کاری توسعه ابری مدرن را توضیح دهید
- اجزای ساختار پروژه azd را شناسایی کنید
- نحوه همکاری قالب‌ها، محیط‌ها و سرویس‌ها را شرح دهید
- مزایای زیرساخت به عنوان کد با azd را درک کنید
- دستورات مختلف azd و اهداف آن‌ها را بشناسید

## Azure Developer CLI (azd) چیست؟

Azure Developer CLI (azd) یک ابزار خط فرمان است که برای تسریع فرآیند توسعه محلی تا استقرار در Azure طراحی شده است. این ابزار فرآیند ساخت، استقرار و مدیریت برنامه‌های ابری در Azure را ساده می‌کند.

## مفاهیم اصلی

### قالب‌ها
قالب‌ها پایه و اساس azd هستند. آن‌ها شامل موارد زیر هستند:
- **کد برنامه** - کد منبع و وابستگی‌های شما
- **تعاریف زیرساخت** - منابع Azure تعریف‌شده در Bicep یا Terraform
- **فایل‌های پیکربندی** - تنظیمات و متغیرهای محیطی
- **اسکریپت‌های استقرار** - جریان‌های کاری استقرار خودکار

### محیط‌ها
محیط‌ها نمایانگر اهداف مختلف استقرار هستند:
- **توسعه** - برای آزمایش و توسعه
- **آزمایشی** - محیط پیش‌تولید
- **تولید** - محیط تولید زنده

هر محیط شامل موارد زیر است:
- گروه منابع Azure
- تنظیمات پیکربندی
- وضعیت استقرار

### سرویس‌ها
سرویس‌ها اجزای سازنده برنامه شما هستند:
- **فرانت‌اند** - برنامه‌های وب، SPAs
- **بک‌اند** - APIها، میکروسرویس‌ها
- **پایگاه داده** - راه‌حل‌های ذخیره‌سازی داده
- **ذخیره‌سازی** - ذخیره‌سازی فایل و blob

## ویژگی‌های کلیدی

### ۱. توسعه مبتنی بر قالب
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### ۲. زیرساخت به عنوان کد
- **Bicep** - زبان خاص دامنه Azure
- **Terraform** - ابزار زیرساخت چند ابری
- **ARM Templates** - قالب‌های Azure Resource Manager

### ۳. جریان‌های کاری یکپارچه
```bash
# Complete deployment workflow
azd up            # Provision + Deploy this is hands off for first time setup
azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
azd down          # Clean up resources
```

### ۴. مدیریت محیط‌ها
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 ساختار پروژه

یک ساختار معمولی پروژه azd:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 فایل‌های پیکربندی

### azure.yaml
فایل اصلی پیکربندی پروژه:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
پیکربندی مخصوص محیط:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 جریان‌های کاری رایج

### شروع یک پروژه جدید
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### چرخه توسعه
```bash
# Set up development environment
azd auth login
azd env new dev
azd env select dev

# Deploy everything
azd up

# Make changes and redeploy
azd deploy

# Clean up when done
azd down --force --purge # command in the Azure Developer CLI is a **hard reset** for your environment—especially useful when you're troubleshooting failed deployments, cleaning up orphaned resources, or prepping for a fresh redeploy.
```

## درک `azd down --force --purge`
دستور `azd down --force --purge` یک روش قدرتمند برای حذف کامل محیط azd و تمام منابع مرتبط است. در اینجا توضیحی از هر پرچم ارائه شده است:
```
--force
```
- از درخواست‌های تأیید صرف‌نظر می‌کند.
- برای اتوماسیون یا اسکریپت‌نویسی که ورودی دستی امکان‌پذیر نیست، مفید است.
- تضمین می‌کند که فرآیند حذف بدون وقفه ادامه یابد، حتی اگر CLI ناسازگاری‌هایی را تشخیص دهد.

```
--purge
```
حذف **تمام متادیتای مرتبط**، شامل:
وضعیت محیط
پوشه محلی `.azure`
اطلاعات استقرار ذخیره‌شده
از "به خاطر سپردن" استقرارهای قبلی توسط azd جلوگیری می‌کند، که می‌تواند مشکلاتی مانند گروه‌های منابع ناسازگار یا ارجاعات قدیمی به رجیستری ایجاد کند.

### چرا از هر دو استفاده کنیم؟
وقتی با `azd up` به دلیل وضعیت باقی‌مانده یا استقرارهای جزئی به مشکل برخوردید، این ترکیب یک **شروع تازه** را تضمین می‌کند.

این روش به‌ویژه پس از حذف دستی منابع در پورتال Azure یا هنگام تغییر قالب‌ها، محیط‌ها یا کنوانسیون‌های نام‌گذاری گروه منابع مفید است.

### مدیریت چندین محیط
```bash
# Create staging environment
azd env new staging
azd env select staging
azd up

# Switch back to dev
azd env select dev

# Compare environments
azd env list
```

## 🧭 دستورات ناوبری

### کشف
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### مدیریت پروژه
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### نظارت
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## بهترین روش‌ها

### ۱. استفاده از نام‌های معنادار
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### ۲. استفاده از قالب‌ها
- با قالب‌های موجود شروع کنید
- برای نیازهای خود سفارشی‌سازی کنید
- قالب‌های قابل استفاده مجدد برای سازمان خود ایجاد کنید

### ۳. جداسازی محیط‌ها
- از محیط‌های جداگانه برای توسعه/آزمایشی/تولید استفاده کنید
- هرگز مستقیماً از ماشین محلی به تولید استقرار ندهید
- از خطوط CI/CD برای استقرارهای تولید استفاده کنید

### ۴. مدیریت پیکربندی
- از متغیرهای محیطی برای داده‌های حساس استفاده کنید
- پیکربندی را در کنترل نسخه نگه دارید
- تنظیمات مخصوص محیط را مستند کنید

## پیشرفت یادگیری

### مبتدی (هفته ۱-۲)
۱. نصب azd و احراز هویت
۲. استقرار یک قالب ساده
۳. درک ساختار پروژه
۴. یادگیری دستورات پایه (up، down، deploy)

### متوسط (هفته ۳-۴)
۱. سفارشی‌سازی قالب‌ها
۲. مدیریت چندین محیط
۳. درک کد زیرساخت
۴. راه‌اندازی خطوط CI/CD

### پیشرفته (هفته ۵+)
۱. ایجاد قالب‌های سفارشی
۲. الگوهای زیرساخت پیشرفته
۳. استقرارهای چند منطقه‌ای
۴. پیکربندی‌های سطح سازمانی

## مراحل بعدی

**📖 ادامه یادگیری فصل ۱:**
- [نصب و راه‌اندازی](installation.md) - نصب و پیکربندی azd
- [اولین پروژه شما](first-project.md) - تکمیل آموزش عملی
- [راهنمای پیکربندی](configuration.md) - گزینه‌های پیشرفته پیکربندی

**🎯 آماده برای فصل بعدی؟**
- [فصل ۲: توسعه مبتنی بر هوش مصنوعی](../ai-foundry/azure-ai-foundry-integration.md) - شروع به ساخت برنامه‌های هوش مصنوعی

## منابع اضافی

- [مروری بر Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [گالری قالب‌ها](https://azure.github.io/awesome-azd/)
- [نمونه‌های جامعه](https://github.com/Azure-Samples)

---

**راهنمای فصل:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل فعلی**: فصل ۱ - مبانی و شروع سریع  
- **⬅️ قبلی**: [نمای کلی دوره](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ بعدی**: [نصب و راه‌اندازی](installation.md)
- **🚀 فصل بعدی**: [فصل ۲: توسعه مبتنی بر هوش مصنوعی](../ai-foundry/azure-ai-foundry-integration.md)

---

**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما تلاش می‌کنیم دقت را حفظ کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌ها باشند. سند اصلی به زبان اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس، توصیه می‌شود از ترجمه حرفه‌ای انسانی استفاده کنید. ما مسئولیتی در قبال سوء تفاهم‌ها یا تفسیرهای نادرست ناشی از استفاده از این ترجمه نداریم.