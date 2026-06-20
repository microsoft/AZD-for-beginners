# برگه تقلب فرمان‌ها - دستورات اساسی AZD

**مرجع سریع برای تمام فصل‌ها**
- **📚 صفحه دوره**: [AZD برای مبتدیان](../README.md)
- **📖 شروع سریع**: [فصل 1: پایه و شروع سریع](../README.md#-chapter-1-foundation--quick-start)
- **🤖 دستورات AI**: [فصل 2: توسعه مبتنی بر AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 پیشرفته**: [فصل 4: زیرساخت به‌عنوان کد](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## معرفی

این برگه تقلب جامع، مرجع سریعی برای پرکاربردترین دستورات Azure Developer CLI فراهم می‌کند که بر اساس دسته‌بندی همراه با مثال‌های عملی سازمان‌دهی شده‌اند. مناسب برای جستجوی سریع در طول توسعه، عیب‌یابی و عملیات روزانه با پروژه‌های azd.

## اهداف آموزشی

با استفاده از این برگه تقلب، شما:
- دسترسی فوری به دستورات و نحوهای اساسی Azure Developer CLI خواهید داشت
- سازمان‌دهی دستورات را بر اساس دسته‌های عملکردی و موارد استفاده درک خواهید کرد
- به مثال‌های عملی برای سناریوهای رایج توسعه و استقرار مراجعه خواهید کرد
- به دستورات عیب‌یابی برای حل سریع مسائل دسترسی خواهید داشت
- گزینه‌های پیکربندی و سفارشی‌سازی پیشرفته را به‌طور کارآمد پیدا خواهید کرد
- دستورات مدیریت محیط و جریان‌های کاری چندمحیطی را مکان‌یابی خواهید کرد

## نتایج یادگیری

با مراجعه منظم به این برگه تقلب، شما قادر خواهید بود:
- دستورات azd را با اطمینان اجرا کنید بدون اینکه به مستندات کامل مراجعه کنید
- با استفاده از دستورات تشخیصی مناسب، مسائل رایج را سریع حل کنید
- چندین محیط و سناریوهای استقرار را به‌طور مؤثر مدیریت کنید
- در صورت نیاز، از ویژگی‌ها و گزینه‌های پیکربندی پیشرفته azd استفاده کنید
- مشکلات استقرار را با استفاده از توالی‌های دستوری سیستماتیک عیب‌یابی کنید
- جریان‌های کاری را از طریق استفاده مؤثر از میانبرها و گزینه‌های azd بهینه کنید

## دستورات شروع

### احراز هویت
```bash
# ورود به Azure از طریق AZD
azd auth login

# ورود به Azure CLI (AZD در پس‌زمینه از این استفاده می‌کند)
az login

# بررسی حساب فعلی
az account show

# تنظیم اشتراک پیش‌فرض
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# خروج از AZD
azd auth logout

# خروج از Azure CLI
az logout
```

### راه‌اندازی پروژه
```bash
# قالب‌های موجود را مرور کنید
azd template list

# از قالب مقداردهی اولیه کنید
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# در پوشهٔ جاری مقداردهی اولیه کنید
azd init .

# با نام دلخواه مقداردهی اولیه کنید
azd init --template todo-nodejs-mongo my-awesome-app
```

## دستورات اصلی استقرار

### جریان کار کامل استقرار
```bash
# همه چیز را مستقر کنید (تأمین منابع + استقرار)
azd up

# استقرار با غیرفعال بودن پیام‌های تأیید
azd up --confirm-with-no-prompt

# استقرار در محیط مشخص
azd up --environment production

# استقرار با پارامترهای سفارشی
azd up --parameter location=westus2
```

### فقط زیرساخت
```bash
# فراهم‌سازی منابع Azure
azd provision

# 🧪 پیش‌نمایش تغییرات زیرساخت
azd provision --preview
# نمایشی از اجرای آزمایشی که نشان می‌دهد چه منابعی ایجاد/تغییر/حذف خواهند شد
# مشابه 'terraform plan' یا 'bicep what-if' — ایمن برای اجرا، هیچ تغییری اعمال نمی‌شود
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
# بازگرداندن (دانلود) وابستگی‌های برنامه
azd restore

# بازگرداندن یک سرویس مشخص
azd restore --service api

# ساخت یک آرتیفکت قابل استقرار بدون انجام استقرار
azd package

# ساخت یک سرویس مشخص
azd package --service api
```

> **`azd restore`** وابستگی‌های برنامه شما را دانلود می‌کند (npm, pip, NuGet, Maven، و غیره). این دستور به‌صورت خودکار هنگام اجرای `azd package` و `azd deploy` اجرا می‌شود، بنابراین به‌ندرت به‌صورت مستقیم آن را فراخوانی می‌کنید — آن را به‌صورت دستی اجرا کنید تا وابستگی‌ها را از پیش دریافت کنید (برای مثال، برای گرم کردن کش CI یا کار به‌صورت آفلاین پس از آن).

> **`azd package`** یک آرشیو قابل استقرار (تصویر کانتینر یا zip) را **بدون** ارسال آن به Azure می‌سازد. به‌تنهایی از آن استفاده کنید تا مطمئن شوید ساخت موفق است، خروجی را بررسی کنید، یا آرشیویی تولید کنید که فرآیند دیگری بعداً آن را مستقر کند. `azd deploy` به‌طور خودکار بسته‌بندی می‌کند، بنابراین تنها زمانی به `azd package` نیاز دارید که بخواهید آرشیو را بدون استقرار داشته باشید.


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
# تمام پیکربندی‌ها را فهرست کن
azd config show

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

# دریافت نقاط پایانی سرویس
azd show --output json
```

## 📊 نظارت و تشخیص

### داشبورد نظارت
```bash
# باز کردن داشبورد مانیتورینگ پورتال Azure
azd monitor

# باز کردن متریک‌های زنده Application Insights
azd monitor --live

# باز کردن بلید لاگ‌های Application Insights
azd monitor --logs

# باز کردن نمای کلی Application Insights
azd monitor --overview
```

### مشاهده لاگ‌های کانتینر
```bash
# مشاهده لاگ‌ها از طریق Azure CLI (برای Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# دنبال کردن لاگ‌ها به‌صورت زنده
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# مشاهده لاگ‌ها از طریق Azure Portal
azd monitor --logs
```

### کوئری‌های Log Analytics
```bash
# دسترسی به Log Analytics از طریق پرتال Azure
azd monitor --logs

# پرس‌وجوی لاگ‌ها با استفاده از Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ دستورات نگهداری

### پاک‌سازی
```bash
# تمام منابع Azure را حذف کنید
azd down

# حذف اجباری بدون تأیید
azd down --force

# پاکسازی منابع حذف‌شده به‌صورت موقت
azd down --purge

# پاکسازی کامل
azd down --force --purge
```

### به‌روزرسانی‌ها
```bash
# بررسی به‌روزرسانی‌های azd
azd version

# دریافت نسخهٔ فعلی
azd version

# مشاهدهٔ پیکربندی فعلی
azd config show
```

## 🔧 دستورات پیشرفته

### خط لوله و CI/CD
```bash
# GitHub Actions را پیکربندی کنید
azd pipeline config

# Azure DevOps را پیکربندی کنید
azd pipeline config --provider azdo

# پیکربندی خط لوله را نمایش دهید
azd pipeline show
```

### مدیریت زیرساخت
```bash
# تولید قالب‌های زیرساخت
azd infra generate

# 🧪 پیش‌نمایش و برنامه‌ریزی زیرساخت‌ها
azd provision --preview
# شبیه‌سازی فراهم‌آوری زیرساخت بدون انجام استقرار
# قالب‌های Bicep/Terraform را تحلیل کرده و نشان می‌دهد:
# - منابعی که اضافه خواهند شد (سبز +)
# - منابعی که تغییر خواهند کرد (زرد ~)
# - منابعی که حذف خواهند شد (قرمز -)
# اجرای ایمن - هیچ تغییر واقعی در محیط Azure اعمال نمی‌شود

# ساخت زیرساخت از فایل azure.yaml
azd infra synth
```

### اطلاعات پروژه
```bash
# نمایش وضعیت پروژه و نقاط پایانی
azd show

# نمایش اطلاعات دقیق پروژه به‌صورت JSON
azd show --output json

# دریافت نقاط پایانی سرویس
azd show --output json | jq '.services'
```

## 🤖 دستورات AI و افزونه‌ها

### افزونه‌های AZD
```bash
# تمام افزونه‌های موجود را فهرست کن (شامل هوش مصنوعی)
azd extension list

# افزونه‌ی Foundry agents را نصب کن
azd extension install azure.ai.agents

# افزونه‌ی agent skills را نصب کن (پیش‌نمایش)
azd extension install azure.ai.skills

# افزونه‌ی Foundry connections را نصب کن (پیش‌نمایش)
azd extension install azure.ai.connections

# افزونه‌ی fine-tuning را نصب کن
azd extension install azure.ai.finetune

# افزونه‌ی custom models را نصب کن
azd extension install azure.ai.models

# تمام افزونه‌های نصب‌شده را به‌روز کن
azd extension upgrade --all
```

### دستورات عامل AI
```bash
# یک پروژهٔ عامل را از یک مانیفست مقداردهی اولیه کنید
azd ai agent init -m <manifest-path-or-uri>

# یک پروژهٔ مشخص Foundry را هدف قرار دهید
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# دایرکتوری منبع عامل را مشخص کنید
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# یک هدف میزبانی را انتخاب کنید
azd ai agent init -m agent-manifest.yaml --host containerapp

# یک عامل مستقر را آزمایش کنید (زمان تأخیر و زمان تا اولین بایت را چاپ می‌کند)
azd ai agent invoke

# پیکربندی نقطهٔ پایانی زنده را نمایش دهید
azd ai agent endpoint show

# یک مجموعه‌دادهٔ ارزیابی تولید کنید، سپس عامل را بهینه کنید
azd ai agent eval generate
azd ai agent optimize

# منبع مستقر یک عامل میزبانی‌شده مبتنی بر کد را دانلود کنید
azd ai agent code download

# یک عامل میزبانی‌شده و همهٔ نسخه‌های آن را حذف کنید (--force جلسات فعال را خاتمه می‌دهد)
azd ai agent delete --force
```

### سرور MCP (آلفا)
```bash
# سرور MCP را برای پروژهٔ خود راه‌اندازی کنید
azd mcp start

# مجوز ابزار برای عملیات MCP را مدیریت کنید
azd copilot consent list
```

### تولید زیرساخت
```bash
# فایل‌های زیرساخت به‌عنوانِ کد (IaC) را از تعریف پروژه‌تان تولید کنید
azd infra generate

# زیرساخت را از فایل azure.yaml سنتز کنید
azd infra synth
```

---

## 🎯 جریان‌های کاری سریع

### جریان کاری توسعه
```bash
# شروع پروژهٔ جدید
azd init --template todo-nodejs-mongo
cd my-project

# استقرار در محیط توسعه
azd env new dev
azd up

# تغییرات را اعمال کنید و مجدداً استقرار دهید
azd deploy

# داشبورد پایش را باز کنید
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

# آزمون و ارتقاء به محیط پیش‌تولید
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

## 🔍 دستورات دیباگ

### اطلاعات دیباگ
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

### دیباگ قالب‌ها
```bash
# فهرست الگوهای موجود همراه با جزئیات
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

# به ریشهٔ پروژهٔ azd بروید
cd $(azd root)

# نمایش دایرکتوری پیکربندی azd
echo $AZD_CONFIG_DIR  # معمولاً ~/.azd
```

## 🎨 فرمت‌بندی خروجی

### خروجی JSON
```bash
# خروجی JSON را برای اسکریپت‌نویسی دریافت کنید
azd show --output json
azd env list --output json
azd config show --output json

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

## 🔧 ترکیب‌های رایج دستوری

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
# مقایسه محیط‌ها
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

### اصلاحات سریع
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

# فقط بازتأمین زیرساخت‌ها
azd provision

# فقط استقرار مجدد برنامه
azd deploy
```

## 💡 نکات حرفه‌ای

### مستعارها برای سرعت بخشیدن به جریان کار
```bash
# به فایل .bashrc یا .zshrc خود اضافه کنید
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### میانبرهای تابع
```bash
# تعویض سریع محیط
azd-env() {
    azd env select $1 && azd show
}

# استقرار سریع همراه با مانیتورینگ
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

## 📖 کمک و مستندات

### دریافت کمک
```bash
# راهنمای عمومی
azd --help
azd help

# راهنمای مربوط به دستور
azd up --help
azd env --help
azd config --help

# نمایش نسخه و اطلاعات ساخت
azd version
azd version --output json
```

### پیوندهای مستندات
```bash
# مستندات را در مرورگر باز کنید
azd docs

# مستندات قالب را نمایش دهید
azd template show <template-name> --docs
```

---

**نکته**: این برگه تقلب را نشانک (Bookmark) کنید و از `Ctrl+F` برای پیدا کردن سریع دستورات مورد نیازتان استفاده کنید!

---

**ناوبری**
- **درس قبلی**: [چک‌های پیش‌استقرار](../docs/pre-deployment/preflight-checks.md)
- **درس بعدی**: [واژه‌نامه](glossary.md)

---

> **💡 آیا کمک دستورات Azure را در ویرایشگر خود می‌خواهید؟** [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) را با `npx skills add microsoft/github-copilot-for-azure` نصب کنید — 37 مهارت برای AI، Foundry، استقرار، تشخیص خطا و موارد بیشتر.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->