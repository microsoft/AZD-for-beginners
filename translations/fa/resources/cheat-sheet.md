# برگه‌ی تقلب دستورات - دستورات ضروری AZD

**مرجع سریع برای همه فصل‌ها**
- **📚 صفحه‌ی دوره**: [AZD برای مبتدیان](../README.md)
- **📖 شروع سریع**: [فصل ۱: پایه و شروع سریع](../README.md#-chapter-1-foundation--quick-start)
- **🤖 دستورات هوش مصنوعی**: [فصل ۲: توسعه‌ی مبتنی بر هوش مصنوعی](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 پیشرفته**: [فصل ۴: زیرساخت به عنوان کد](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## معرفی

این برگهٔ تقلب جامع مرجعی سریع برای پرکاربردترین دستورات Azure Developer CLI فراهم می‌کند، که بر اساس دسته‌بندی با مثال‌های عملی سازمان‌دهی شده‌اند. مناسب برای جستجوی سریع در طول توسعه، رفع اشکال، و عملیات روزمره با پروژه‌های azd.

## اهداف یادگیری

با استفاده از این برگهٔ تقلب، شما:
- دسترسی فوری به دستورات و نحو ضروری Azure Developer CLI خواهید داشت
- سازماندهی دستورات را بر اساس دسته‌های عملکردی و موارد استفاده درک خواهید کرد
- به مثال‌های عملی برای سناریوهای متداول توسعه و استقرار مراجعه خواهید کرد
- به دستورات عیب‌یابی برای حل سریع مشکلات دسترسی خواهید داشت
- گزینه‌های پیکربندی و سفارشی‌سازی پیشرفته را به‌طور مؤثر پیدا خواهید کرد
- دستورات مدیریت محیط و گردش‌کار چندمحیطی را مکان‌یابی خواهید کرد

## نتایج یادگیری

با مراجعه منظم به این برگهٔ تقلب، شما قادر خواهید بود:
- دستورات azd را با اطمینان اجرا کنید بدون نیاز به مراجعه کامل به مستندات
- مشکلات رایج را به سرعت با استفاده از دستورات تشخیصی مناسب حل کنید
- چندین محیط و سناریوهای استقرار را به‌طور مؤثر مدیریت کنید
- از ویژگی‌ها و گزینه‌های پیکربندی پیشرفته azd در صورت نیاز استفاده کنید
- مشکلات استقرار را با استفاده از دنباله‌های دستوری سیستماتیک عیب‌یابی کنید
- گردش‌کارها را از طریق استفاده مؤثر از میان‌برها و گزینه‌های azd بهینه‌سازی کنید

## دستورات شروع به کار

### احراز هویت
```bash
# ورود به Azure از طریق AZD
azd auth login

# ورود به Azure CLI (AZD از آن در پس‌زمینه استفاده می‌کند)
az login

# بررسی حساب جاری
az account show

# تنظیم اشتراک پیش‌فرض
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# خروج از AZD
azd auth logout

# خروج از Azure CLI
az logout
```

### مقداردهی اولیه پروژه
```bash
# قالب‌های موجود را مرور کنید
azd template list

# از قالب مقداردهی اولیه کنید
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# در دایرکتوری جاری مقداردهی اولیه کنید
azd init .

# با نام دلخواه مقداردهی اولیه کنید
azd init --template todo-nodejs-mongo my-awesome-app
```

## دستورات اصلی استقرار

### گردش‌کار کامل استقرار
```bash
# همه چیز را مستقر کنید (تهیهٔ منابع + استقرار)
azd up

# استقرار با غیرفعال‌کردن پیام‌های تأیید
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

# 🧪 پیش‌نمایش تغییرات زیرساخت
azd provision --preview
# نمایش اجرای آزمایشی از اینکه چه منابعی ایجاد، تغییر یا حذف خواهند شد
# مشابه 'terraform plan' یا 'bicep what-if' — ایمن برای اجرا؛ هیچ تغییری اعمال نمی‌شود
```

### فقط برنامه
```bash
# استقرار کد برنامه
azd deploy

# استقرار سرویس مشخص
azd deploy --service web
azd deploy --service api

# استقرار تمام سرویس‌ها
azd deploy --all
```

### ساخت و بسته‌بندی
```bash
# ساخت برنامه‌ها
azd package

# ساخت سرویس مشخص
azd package --service api
```

## 🌍 مدیریت محیط

### عملیات محیط
```bash
# فهرست تمام محیط‌ها
azd env list

# ایجاد محیط جدید
azd env new development
azd env new staging --location westus2

# انتخاب محیط
azd env select production

# نمایش محیط فعلی
azd env show

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
# فهرست تمام پیکربندی‌ها
azd config list

# تنظیم پیش‌فرض‌های سراسری
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# حذف پیکربندی
azd config unset defaults.location

# بازنشانی تمام پیکربندی‌ها
azd config reset
```

### پیکربندی پروژه
```bash
# اعتبارسنجی azure.yaml
azd config validate

# نمایش اطلاعات پروژه
azd show

# دریافت نقاط انتهایی سرویس
azd show --output json
```

## 📊 نظارت و تشخیص

### داشبورد نظارت
```bash
# باز کردن داشبورد مانیتورینگ در پرتال Azure
azd monitor

# باز کردن متریک‌های زنده در Application Insights
azd monitor --live

# باز کردن صفحه لاگ‌ها در Application Insights
azd monitor --logs

# باز کردن نمای کلی Application Insights
azd monitor --overview
```

### مشاهده لاگ‌های کانتینر
```bash
# مشاهدهٔ لاگ‌ها از طریق Azure CLI (برای Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# دنبال کردن لاگ‌ها به‌صورت بلادرنگ
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# مشاهدهٔ لاگ‌ها از طریق پورتال Azure
azd monitor --logs
```

### پرس‌وجوهای Log Analytics
```bash
# دسترسی به Log Analytics از طریق پورتال Azure
azd monitor --logs

# جست‌وجوی لاگ‌ها با استفاده از Azure CLI
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

# پاک‌سازی منابعی که به‌صورت نرم حذف شده‌اند
azd down --purge

# پاک‌سازی کامل
azd down --force --purge
```

### به‌روزرسانی‌ها
```bash
# بررسی به‌روزرسانی‌های azd
azd version

# دریافت نسخهٔ فعلی
azd version

# مشاهدهٔ پیکربندی فعلی
azd config list
```

## 🔧 دستورات پیشرفته

### پایپلاین و CI/CD
```bash
# پیکربندی اکشن‌های گیت‌هاب
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
# فرآیند فراهم‌سازی زیرساخت را بدون استقرار شبیه‌سازی می‌کند
# الگوهای Bicep/Terraform را تحلیل کرده و نمایش می‌دهد:
# - منابعی که اضافه خواهند شد (سبز +)
# - منابعی که تغییر خواهند کرد (زرد ~)
# - منابعی که حذف خواهند شد (قرمز -)
# اجرای ایمن - هیچ تغییری واقعی در محیط Azure ایجاد نمی‌شود

# تولید زیرساخت از azure.yaml
azd infra synth
```

### اطلاعات پروژه
```bash
# نمایش وضعیت پروژه و نقاط پایانی
azd show

# نمایش اطلاعات مفصل پروژه به صورت JSON
azd show --output json

# دریافت نقاط پایانی سرویس
azd show --output json | jq '.services'
```

## 🤖 دستورات AI و افزونه‌ها

### افزونه‌های AZD
```bash
# فهرست همه افزونه‌های موجود (شامل هوش مصنوعی)
azd extension list

# افزونهٔ Foundry agents را نصب کن
azd extension install azure.ai.agents

# افزونهٔ تنظیم دقیق را نصب کن
azd extension install azure.ai.finetune

# افزونهٔ مدل‌های سفارشی را نصب کن
azd extension install azure.ai.models

# همهٔ افزونه‌های نصب‌شده را به‌روزرسانی کن
azd extension upgrade --all
```

### دستورات عامل‌های هوش مصنوعی
```bash
# یک پروژهٔ عامل را از یک مانیفست مقداردهی اولیه کن
azd ai agent init -m <manifest-path-or-uri>

# یک پروژهٔ مشخصِ Foundry را هدف قرار بده
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# دایرکتوری منبعِ عامل را مشخص کن
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# یک هدفِ میزبانی انتخاب کن
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP Server (آلفا)
```bash
# سرور MCP را برای پروژهٔ خود راه‌اندازی کنید
azd mcp start

# موافقت ابزار برای عملیات MCP را مدیریت کنید
azd mcp consent
```

### تولید زیرساخت
```bash
# فایل‌های IaC را از تعریف پروژهٔ شما تولید کنید
azd infra generate

# زیرساخت را از فایل azure.yaml تولید کنید
azd infra synth
```

---

## 🎯 گردش‌کارهای سریع

### گردش‌کار توسعه
```bash
# شروع پروژه جدید
azd init --template todo-nodejs-mongo
cd my-project

# استقرار در محیط توسعه
azd env new dev
azd up

# تغییرات را اعمال کرده و مجدداً مستقر کنید
azd deploy

# داشبورد مانیتورینگ را باز کنید
azd monitor --live
```

### گردش‌کار چندمحیطی
```bash
# راه‌اندازی محیط‌ها
azd env new dev
azd env new staging  
azd env new production

# استقرار در محیط توسعه
azd env select dev
azd up

# آزمایش و ارتقا به محیط staging
azd env select staging
azd up

# استقرار در محیط تولید
azd env select production
azd up
```

### گردش‌کار عیب‌یابی
```bash
# حالت اشکال‌زدایی را فعال کنید
export AZD_DEBUG=true

# وضعیت استقرار را بررسی کنید
azd show

# پیکربندی را اعتبارسنجی کنید
azd config list

# داشبورد مانیتورینگ را برای لاگ‌ها باز کنید
azd monitor --logs

# وضعیت منابع را بررسی کنید
azd show --output json
```

## 🔍 دستورات اشکال‌زدایی

### اطلاعات اشکال‌زدایی
```bash
# خروجی اشکال‌زدایی را فعال کنید
export AZD_DEBUG=true
azd <command> --debug

# تله‌متری را برای خروجی تمیزتر غیرفعال کنید
export AZD_DISABLE_TELEMETRY=true

# پیکربندی فعلی را بررسی کنید
azd config list

# وضعیت احراز هویت را بررسی کنید
az account show
```

### اشکال‌زدایی قالب
```bash
# فهرست قالب‌های موجود همراه با جزئیات
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

# به ریشه پروژه azd بروید
cd $(azd root)

# نمایش دایرکتوری پیکربندی azd
echo $AZD_CONFIG_DIR  # معمولاً ~/.azd
```

## 🎨 فرمت خروجی

### خروجی JSON
```bash
# دریافت خروجی JSON برای اسکریپت‌نویسی
azd show --output json
azd env list --output json
azd config list --output json

# با jq تجزیه کنید
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### خروجی جدولی
```bash
# قالب‌بندی به صورت جدول
azd env list --output table

# مشاهده سرویس‌های مستقر
azd show --output json | jq '.services | keys'
```

## 🔧 ترکیب‌های رایج دستورات

### اسکریپت بررسی سلامت
```bash
#!/bin/bash
# بررسی سریع سلامت
azd show
azd env show
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

### اسکریپت پاک‌سازی منابع
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
# پیکربندی آژور
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

### رفع سریع
```bash
# بازنشانی احراز هویت
az account clear
az login

# اجبار به تازه‌سازی محیط
azd env refresh

# استقرار مجدد همه سرویس‌ها
azd deploy

# بررسی وضعیت استقرار
azd show --output json
```

### دستورات بازیابی
```bash
# بازیابی از استقرار ناموفق - پاک‌سازی و استقرار مجدد
azd down --force --purge
azd up

# فقط بازتأمین زیرساخت
azd provision

# فقط استقرار مجدد برنامه
azd deploy
```

## 💡 نکات حرفه‌ای

### نام مستعار برای گردش‌کار سریع‌تر
```bash
# به فایل .bashrc یا .zshrc خود اضافه کنید
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### میان‌برهای توابع
```bash
# تعویض سریع محیط
azd-env() {
    azd env select $1 && azd show
}

# استقرار سریع با پایش
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# وضعیت محیط
azd-status() {
    echo "Current environment:"
    azd env show
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

# راهنمای مخصوص دستور
azd up --help
azd env --help
azd config --help

# نمایش نسخه و اطلاعات ساخت
azd version
azd version --output json
```

### لینک‌های مستندات
```bash
# باز کردن مستندات در مرورگر
azd docs

# نمایش مستندات قالب
azd template show <template-name> --docs
```

---

**نکته**: این برگهٔ تقلب را بوکمارک کنید و از `Ctrl+F` برای یافتن سریع دستورات مورد نیازتان استفاده کنید!

---

**ناوبری**
- **درس قبلی**: [بررسی‌های پیش از استقرار](../docs/pre-deployment/preflight-checks.md)
- **درس بعدی**: [واژه‌نامه](glossary.md)

---

> **💡 آیا می‌خواهید کمک دستورات Azure را در ویرایشگر خود داشته باشید؟** [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) را با `npx skills add microsoft/github-copilot-for-azure` نصب کنید — شامل 37 مهارت برای AI، Foundry، استقرار، تشخیص مشکلات و موارد بیشتر.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمهٔ مبتنی بر هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان اصلی خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس یا حیاتی، ترجمهٔ حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوءتفاهم یا تفسیر نادرستی که از استفاده از این ترجمه ناشی شود، مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->