# فهرست سریع فرمان‌ها - دستورات ضروری AZD

**مرجع سریع برای همه فصل‌ها**
- **📚 صفحه دوره**: [AZD برای مبتدیان](../README.md)
- **📖 شروع سریع**: [فصل 1: بنیان و شروع سریع](../README.md#-chapter-1-foundation--quick-start)
- **🤖 دستورات هوش مصنوعی**: [فصل 2: توسعه مبتنی بر هوش مصنوعی](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 پیشرفته**: [فصل 4: زیرساخت به‌عنوان کد](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## مقدمه

این چیت‌شیت جامع مرجعی سریع برای پرکاربردترین دستورات Azure Developer CLI فراهم می‌کند، سازماندهی‌شده بر اساس دسته‌بندی با مثال‌های عملی. ایده‌آل برای جستجوی سریع هنگام توسعه، عیب‌یابی، و عملیات روزمره با پروژه‌های azd.

## اهداف یادگیری

با استفاده از این چیت‌شیت، شما:
- دسترسی فوری به دستورات و نحوهای ضروری Azure Developer CLI خواهید داشت
- سازماندهی دستورات بر اساس دسته‌های عملکردی و موارد استفاده را درک خواهید کرد
- به مثال‌های عملی برای سناریوهای رایج توسعه و استقرار مراجعه خواهید کرد
- به دستورات عیب‌یابی برای حل سریع مشکلات دسترسی خواهید داشت
- گزینه‌های پیکربندی و سفارشی‌سازی پیشرفته را به‌طور مؤثر خواهید یافت
- دستورات مدیریت محیط و جریان کاری چندمحیطی را پیدا خواهید کرد

## نتایج یادگیری

با مراجعه منظم به این چیت‌شیت، شما قادر خواهید بود:
- دستورات azd را با اطمینان اجرا کنید بدون نیاز به ارجاع به مستندات کامل
- مسائل رایج را به‌سرعت با استفاده از دستورات تشخیصی مناسب حل کنید
- چندین محیط و سناریوهای استقرار را به‌طور کارآمد مدیریت کنید
- از قابلیت‌ها و گزینه‌های پیکربندی پیشرفته azd استفاده کنید
- مشکلات استقرار را با استفاده از توالی دستورات سیستماتیک عیب‌یابی کنید
- جریان‌های کاری را از طریق استفاده مؤثر از میانبرها و گزینه‌های azd بهینه کنید

## دستورات شروع به کار

### احراز هویت
```bash
# از طریق AZD وارد Azure شوید
azd auth login

# با Azure CLI وارد شوید (AZD از آن در پس‌زمینه استفاده می‌کند)
az login

# حساب فعلی را بررسی کنید
az account show

# اشتراک پیش‌فرض را تنظیم کنید
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# از AZD خارج شوید
azd auth logout

# از Azure CLI خارج شوید
az logout
```

### مقداردهی اولیه پروژه
```bash
# قالب‌های موجود را مرور کنید
azd template list

# از قالب مقداردهی اولیه کنید
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# در پوشهٔ فعلی مقداردهی اولیه کنید
azd init .

# با نام دلخواه مقداردهی اولیه کنید
azd init --template todo-nodejs-mongo my-awesome-app
```

## دستورات اصلی استقرار

### جریان کاری کامل استقرار
```bash
# استقرار همه‌چیز (تأمین منابع + استقرار)
azd up

# استقرار با غیرفعال‌سازی درخواست‌های تأیید
azd up --confirm-with-no-prompt

# استقرار در محیط مشخص
azd up --environment production

# استقرار با پارامترهای سفارشی
azd up --parameter location=westus2
```

### فقط زیرساخت
```bash
# تأمین منابع Azure
azd provision

# پیش‌نمایش تغییرات زیرساخت 🧪
azd provision --preview
# نمایش اجرای آزمایشی از اینکه چه منابعی ایجاد/تغییر/حذف خواهند شد
# مشابه 'terraform plan' یا 'bicep what-if' - ایمن برای اجرا، هیچ تغییری اعمال نمی‌شود
```

### فقط برنامه
```bash
# استقرار کد برنامه
azd deploy

# استقرار سرویس مشخص
azd deploy --service web
azd deploy --service api

# استقرار همه سرویس‌ها
azd deploy --all
```

### ساخت و بسته‌بندی
```bash
# ساخت برنامه‌ها
azd package

# ساخت سرویس خاص
azd package --service api
```

## 🌍 مدیریت محیط

### عملیات محیط
```bash
# فهرست همهٔ محیط‌ها
azd env list

# ایجاد محیط جدید
azd env new development
azd env new staging --location westus2

# انتخاب محیط
azd env select production

# نمایش محیط‌های موجود
azd env list

# به‌روزرسانی وضعیت محیط
azd env refresh
```

### متغیرهای محیطی
```bash
# تنظیم متغیر محیطی
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# دریافت متغیر محیطی
azd env get API_KEY

# فهرست تمام متغیرهای محیطی
azd env get-values

# حذف متغیر محیطی
azd env unset DEBUG
```

## ⚙️ دستورات پیکربندی

### پیکربندی سراسری
```bash
# فهرست همهٔ پیکربندی‌ها
azd config show

# تنظیم مقادیر پیش‌فرض سراسری
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# حذف پیکربندی
azd config unset defaults.location

# بازنشانی تمام پیکربندی‌ها
azd config reset
```

### پیکربندی پروژه
```bash
# اعتبارسنجی فایل azure.yaml
azd config validate

# نمایش اطلاعات پروژه
azd show

# دریافت نقاط پایانی سرویس
azd show --output json
```

## 📊 مانیتورینگ و تشخیص

### داشبورد مانیتورینگ
```bash
# داشبورد مانیتورینگ پورتال Azure را باز کنید
azd monitor

# متریک‌های زنده Application Insights را باز کنید
azd monitor --live

# پنل لاگ‌های Application Insights را باز کنید
azd monitor --logs

# نمای کلی Application Insights را باز کنید
azd monitor --overview
```

### مشاهده لاگ‌های کانتینر
```bash
# نمایش لاگ‌ها از طریق Azure CLI (برای Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# مشاهدهٔ لاگ‌ها به‌صورت زنده
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# مشاهدهٔ لاگ‌ها از طریق پورتال Azure
azd monitor --logs
```

### کوئری‌های Log Analytics
```bash
# دسترسی به سرویس Log Analytics از طریق پرتال آژور
azd monitor --logs

# استعلام لاگ‌ها با استفاده از Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ دستورات نگهداری

### پاک‌سازی
```bash
# حذف تمام منابع Azure
azd down

# حذف اجباری بدون تأیید
azd down --force

# پاک‌سازی منابع حذف‌شده به‌صورت نرم
azd down --purge

# پاک‌سازی کامل
azd down --force --purge
```

### بروزرسانی‌ها
```bash
# بررسی به‌روزرسانی‌های azd
azd version

# دریافت نسخه فعلی
azd version

# مشاهده پیکربندی فعلی
azd config show
```

## 🔧 دستورات پیشرفته

### پایپلاین و CI/CD
```bash
# پیکربندی GitHub Actions
azd pipeline config

# پیکربندی Azure DevOps
azd pipeline config --provider azdo

# نمایش پیکربندی خط لوله
azd pipeline show
```

### مدیریت زیرساخت
```bash
# تولید قالب‌های زیرساخت
azd infra generate

# 🧪 پیش‌نمایش و برنامه‌ریزی زیرساخت
azd provision --preview
# فرآیند تأمین زیرساخت را بدون استقرار شبیه‌سازی می‌کند
# قالب‌های Bicep/Terraform را تحلیل می‌کند و نشان می‌دهد:
# - منابعی که اضافه خواهند شد (سبز +)
# - منابعی که تغییر خواهند کرد (زرد ~)
# - منابعی که حذف خواهند شد (قرمز -)
# اجرای امن - هیچ تغییری واقعی در محیط Azure ایجاد نمی‌شود

# تولید زیرساخت از azure.yaml
azd infra synth
```

### اطلاعات پروژه
```bash
# نمایش وضعیت پروژه و نقاط پایانی
azd show

# نمایش اطلاعات دقیق پروژه به صورت JSON
azd show --output json

# دریافت نقاط پایانی سرویس
azd show --output json | jq '.services'
```

## 🤖 دستورات AI و افزونه‌ها

### افزونه‌های AZD
```bash
# تمام افزونه‌های موجود را فهرست کنید (از جمله هوش مصنوعی)
azd extension list

# افزونه Foundry Agents را نصب کنید
azd extension install azure.ai.agents

# افزونه تنظیم دقیق را نصب کنید
azd extension install azure.ai.finetune

# افزونه مدل‌های سفارشی را نصب کنید
azd extension install azure.ai.models

# تمام افزونه‌های نصب‌شده را به‌روزرسانی کنید
azd extension upgrade --all
```

### دستورات عامل هوش مصنوعی
```bash
# یک پروژهٔ عامل را از مانیفست مقداردهی اولیه کنید
azd ai agent init -m <manifest-path-or-uri>

# یک پروژهٔ مشخص Foundry را هدف قرار دهید
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# دایرکتوری منبع عامل را مشخص کنید
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# یک هدف میزبانی را انتخاب کنید
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### سرور MCP (آلفا)
```bash
# سرور MCP را برای پروژهٔ خود راه‌اندازی کنید
azd mcp start

# مجوز ابزار را برای عملیات MCP مدیریت کنید
azd copilot consent list
```

### تولید زیرساخت
```bash
# فایل‌های IaC را از تعریف پروژهٔ خود تولید کنید
azd infra generate

# زیرساخت را از azure.yaml سنتز کنید
azd infra synth
```

---

## 🎯 جریان‌های کاری سریع

### جریان کاری توسعه
```bash
# شروع پروژه جدید
azd init --template todo-nodejs-mongo
cd my-project

# استقرار در محیط توسعه
azd env new dev
azd up

# اعمال تغییرات و استقرار مجدد
azd deploy

# باز کردن داشبورد مانیتورینگ
azd monitor --live
```

### جریان کاری چندمحیطی
```bash
# راه‌اندازی محیط‌ها
azd env new dev
azd env new staging  
azd env new production

# استقرار در محیط توسعه
azd env select dev
azd up

# تست و ارتقا به محیط پیش‌تولید
azd env select staging
azd up

# استقرار در محیط تولید
azd env select production
azd up
```

### جریان کاری عیب‌یابی
```bash
# فعال‌سازی حالت اشکال‌زدایی
export AZD_DEBUG=true

# بررسی وضعیت استقرار
azd show

# اعتبارسنجی پیکربندی
azd config show

# باز کردن داشبورد مانیتورینگ برای لاگ‌ها
azd monitor --logs

# بررسی وضعیت منابع
azd show --output json
```

## 🔍 دستورات اشکال‌زدایی

### اطلاعات اشکال‌زدایی
```bash
# خروجی اشکال‌زدایی را فعال کنید
export AZD_DEBUG=true
azd <command> --debug

# برای خروجی تمیزتر، تله‌متری را غیرفعال کنید
export AZD_DISABLE_TELEMETRY=true

# پیکربندی فعلی را بررسی کنید
azd config show

# وضعیت احراز هویت را بررسی کنید
az account show
```

### اشکال‌زدایی قالب
```bash
# فهرست قالب‌های موجود به همراه جزئیات
azd template list --output json

# نمایش اطلاعات قالب
azd template show <template-name>

# اعتبارسنجی قالب قبل از مقداردهی اولیه
azd template validate <template-name>
```

## 📁 دستورات فایل و دایرکتوری

### ساختار پروژه
```bash
# نمایش ساختار دایرکتوری جاری
tree /f  # ویندوز
find . -type f  # لینوکس/مک‌اواس

# به ریشهٔ پروژه azd بروید
cd $(azd root)

# نمایش دایرکتوری پیکربندی azd
echo $AZD_CONFIG_DIR  # معمولاً ~/.azd
```

## 🎨 قالب‌بندی خروجی

### خروجی JSON
```bash
# خروجی JSON را برای اسکریپت‌نویسی بگیرید
azd show --output json
azd env list --output json
azd config show --output json

# با jq تجزیه کنید
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### خروجی جدول
```bash
# قالب‌بندی به صورت جدول
azd env list --output table

# مشاهده سرویس‌های مستقر
azd show --output json | jq '.services | keys'
```

## 🔧 ترکیب‌های متداول دستورات

### اسکریپت بررسی سلامت
```bash
#!/bin/bash
# بررسی سریع سلامت
azd show
azd env get-values
azd monitor --logs
```

### اعتبارسنجی استقرار
```bash
#!/bin/bash
# اعتبارسنجی پیش از استقرار
azd show
azd provision --preview  # پیش‌نمایش تغییرات قبل از استقرار
az account show
```

### مقایسه محیط‌ها
```bash
#!/bin/bash
# محیط‌ها را مقایسه کنید
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### اسکریپت پاکسازی منابع
```bash
#!/bin/bash
# پاک‌سازی محیط‌های قدیمی
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 متغیرهای محیطی

### متغیرهای محیطی رایج
```bash
# پیکربندی آزور
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# پیکربندی AZD
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# پیکربندی برنامه
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 دستورات اضطراری

### اصلاحات سریع
```bash
# بازنشانی احراز هویت
az account clear
az login

# تازه‌سازی اجباری محیط
azd env refresh

# استقرار مجدد تمام سرویس‌ها
azd deploy

# بررسی وضعیت استقرار
azd show --output json
```

### دستورات بازیابی
```bash
# بازیابی از استقرار ناموفق - پاک‌سازی و استقرار مجدد
azd down --force --purge
azd up

# فقط بازپیکربندی زیرساخت
azd provision

# فقط استقرار مجدد برنامه
azd deploy
```

## 💡 نکات حرفه‌ای

### نام مستعارها برای جریان کاری سریع‌تر
```bash
# به فایل .bashrc یا .zshrc خود اضافه کنید
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### میانبرهای توابع
```bash
# تعویض سریع محیط
azd-env() {
    azd env select $1 && azd show
}

# استقرار سریع همراه با پایش
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# وضعیت محیط
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 راهنما و مستندات

### دریافت کمک
```bash
# راهنمای عمومی
azd --help
azd help

# راهنمای مخصوص فرمان
azd up --help
azd env --help
azd config --help

# نمایش اطلاعات نسخه و ساخت
azd version
azd version --output json
```

### لینک‌های مستندات
```bash
# مستندات را در مرورگر باز کنید
azd docs

# مستندات قالب را نمایش دهید
azd template show <template-name> --docs
```

---

**نکته**: این چیت‌شیت را نشانک کنید و از `Ctrl+F` برای پیدا کردن سریع دستورات مورد نیازتان استفاده کنید!

---

**ناوبری**
- **درس قبلی**: [چک‌های پیش‌پرواز](../docs/pre-deployment/preflight-checks.md)
- **درس بعدی**: [واژگان](glossary.md)

---

> **💡 آیا می‌خواهید کمک برای دستورات Azure را در ویرایشگر خود داشته باشید؟** نصب کنید [مهارت‌های عامل Microsoft Azure](https://skills.sh/microsoft/github-copilot-for-azure) با `npx skills add microsoft/github-copilot-for-azure` — 37 مهارت برای هوش مصنوعی، Foundry، استقرار، تشخیص و بیشتر.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمهٔ هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. هرچند ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مبدأ باید به‌عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمهٔ حرفه‌ای توسط انسان توصیه می‌شود. ما در قبال هرگونه سوءتفاهم یا تفسیر نادرستی که از استفاده از این ترجمه ناشی شود، مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->