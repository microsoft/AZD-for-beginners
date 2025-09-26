<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3df05e83c2307e92452bd7c3307ae849",
  "translation_date": "2025-09-24T10:29:32+00:00",
  "source_file": "README.md",
  "language_code": "fa"
}
-->
# AZD برای مبتدیان: یک مسیر یادگیری ساختاریافته

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.fa.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

## شروع به کار با این دوره

برای آغاز مسیر یادگیری AZD خود، مراحل زیر را دنبال کنید:

1. **مخزن را فورک کنید**: کلیک کنید [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **مخزن را کلون کنید**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **به جامعه بپیوندید**: [جامعه‌های دیسکورد Azure](https://discord.com/invite/ByRwuEEgH4) برای دریافت پشتیبانی از کارشناسان
4. **مسیر یادگیری خود را انتخاب کنید**: یک فصل زیر را که با سطح تجربه شما مطابقت دارد انتخاب کنید

### پشتیبانی چندزبانه

#### ترجمه‌های خودکار (همیشه به‌روز)

[فرانسوی](../fr/README.md) | [اسپانیایی](../es/README.md) | [آلمانی](../de/README.md) | [روسی](../ru/README.md) | [عربی](../ar/README.md) | [فارسی](./README.md) | [اردو](../ur/README.md) | [چینی (ساده‌شده)](../zh/README.md) | [چینی (سنتی، ماکائو)](../mo/README.md) | [چینی (سنتی، هنگ‌کنگ)](../hk/README.md) | [چینی (سنتی، تایوان)](../tw/README.md) | [ژاپنی](../ja/README.md) | [کره‌ای](../ko/README.md) | [هندی](../hi/README.md) | [بنگالی](../bn/README.md) | [مراتی](../mr/README.md) | [نپالی](../ne/README.md) | [پنجابی (گورموخی)](../pa/README.md) | [پرتغالی (پرتغال)](../pt/README.md) | [پرتغالی (برزیل)](../br/README.md) | [ایتالیایی](../it/README.md) | [لهستانی](../pl/README.md) | [ترکی](../tr/README.md) | [یونانی](../el/README.md) | [تایلندی](../th/README.md) | [سوئدی](../sv/README.md) | [دانمارکی](../da/README.md) | [نروژی](../no/README.md) | [فنلاندی](../fi/README.md) | [هلندی](../nl/README.md) | [عبری](../he/README.md) | [ویتنامی](../vi/README.md) | [اندونزیایی](../id/README.md) | [مالایی](../ms/README.md) | [تاگالوگ (فیلیپینی)](../tl/README.md) | [سواحیلی](../sw/README.md) | [مجاری](../hu/README.md) | [چکی](../cs/README.md) | [اسلواکی](../sk/README.md) | [رومانیایی](../ro/README.md) | [بلغاری](../bg/README.md) | [صربی (سیریلیک)](../sr/README.md) | [کرواتی](../hr/README.md) | [اسلوونیایی](../sl/README.md) | [اوکراینی](../uk/README.md) | [برمه‌ای (میانمار)](../my/README.md)

## مرور کلی دوره

با استفاده از فصل‌های ساختاریافته، CLI توسعه‌دهنده Azure (azd) را به صورت گام‌به‌گام یاد بگیرید. **تمرکز ویژه بر استقرار برنامه‌های هوش مصنوعی با ادغام Azure AI Foundry.**

### چرا این دوره برای توسعه‌دهندگان مدرن ضروری است؟

بر اساس بینش‌های جامعه دیسکورد Azure AI Foundry، **۴۵٪ از توسعه‌دهندگان می‌خواهند از AZD برای بارهای کاری هوش مصنوعی استفاده کنند** اما با چالش‌های زیر مواجه می‌شوند:
- معماری‌های پیچیده چندسرویسی هوش مصنوعی
- بهترین شیوه‌های استقرار هوش مصنوعی در محیط تولید
- ادغام و پیکربندی خدمات Azure AI
- بهینه‌سازی هزینه برای بارهای کاری هوش مصنوعی
- رفع مشکلات خاص استقرار هوش مصنوعی

### اهداف یادگیری

با تکمیل این دوره ساختاریافته، شما:
- **مفاهیم پایه AZD را یاد می‌گیرید**: مفاهیم اصلی، نصب و پیکربندی
- **برنامه‌های هوش مصنوعی را مستقر می‌کنید**: استفاده از AZD با خدمات Azure AI Foundry
- **زیرساخت به عنوان کد را پیاده‌سازی می‌کنید**: مدیریت منابع Azure با قالب‌های Bicep
- **استقرارها را عیب‌یابی می‌کنید**: مشکلات رایج را حل کرده و اشکالات را برطرف می‌کنید
- **برای تولید بهینه‌سازی می‌کنید**: امنیت، مقیاس‌پذیری، نظارت و مدیریت هزینه
- **راه‌حل‌های چندعاملی می‌سازید**: معماری‌های پیچیده هوش مصنوعی را مستقر می‌کنید

## 📚 فصل‌های یادگیری

*مسیر یادگیری خود را بر اساس سطح تجربه و اهداف انتخاب کنید*

### 🚀 فصل ۱: مبانی و شروع سریع
**پیش‌نیازها**: اشتراک Azure، دانش پایه خط فرمان  
**مدت زمان**: ۳۰-۴۵ دقیقه  
**پیچیدگی**: ⭐

#### آنچه یاد خواهید گرفت
- درک مبانی CLI توسعه‌دهنده Azure
- نصب AZD بر روی پلتفرم شما
- اولین استقرار موفقیت‌آمیز شما

#### منابع یادگیری
- **🎯 از اینجا شروع کنید**: [Azure Developer CLI چیست؟](../..)
- **📖 تئوری**: [مبانی AZD](docs/getting-started/azd-basics.md) - مفاهیم و اصطلاحات اصلی
- **⚙️ راه‌اندازی**: [نصب و راه‌اندازی](docs/getting-started/installation.md) - راهنماهای پلتفرم خاص
- **🛠️ عملی**: [اولین پروژه شما](docs/getting-started/first-project.md) - آموزش گام‌به‌گام
- **📋 مرجع سریع**: [برگه تقلب دستورات](resources/cheat-sheet.md)

#### تمرین‌های عملی
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 نتیجه فصل**: استقرار موفقیت‌آمیز یک برنامه وب ساده در Azure با استفاده از AZD

---

### 🤖 فصل ۲: توسعه مبتنی بر هوش مصنوعی (پیشنهاد شده برای توسعه‌دهندگان هوش مصنوعی)
**پیش‌نیازها**: تکمیل فصل ۱  
**مدت زمان**: ۱-۲ ساعت  
**پیچیدگی**: ⭐⭐

#### آنچه یاد خواهید گرفت
- ادغام Azure AI Foundry با AZD
- استقرار برنامه‌های مبتنی بر هوش مصنوعی
- درک پیکربندی خدمات هوش مصنوعی

#### منابع یادگیری
- **🎯 از اینجا شروع کنید**: [ادغام Azure AI Foundry](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 الگوها**: [استقرار مدل هوش مصنوعی](docs/ai-foundry/ai-model-deployment.md) - استقرار و مدیریت مدل‌های هوش مصنوعی
- **🛠️ کارگاه**: [آزمایشگاه کارگاه هوش مصنوعی](docs/ai-foundry/ai-workshop-lab.md) - آماده‌سازی راه‌حل‌های هوش مصنوعی برای AZD
- **🎥 راهنمای تعاملی**: [مواد کارگاه](workshop/README.md) - یادگیری مبتنی بر مرورگر با MkDocs * محیط DevContainer
- **📋 قالب‌ها**: [قالب‌های Azure AI Foundry](../..)

#### تمرین‌های عملی
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 نتیجه فصل**: استقرار و پیکربندی یک برنامه چت مبتنی بر هوش مصنوعی با قابلیت‌های RAG

---

### ⚙️ فصل ۳: پیکربندی و احراز هویت
**پیش‌نیازها**: تکمیل فصل ۱  
**مدت زمان**: ۴۵-۶۰ دقیقه  
**پیچیدگی**: ⭐⭐

#### آنچه یاد خواهید گرفت
- مدیریت و پیکربندی محیط‌ها
- بهترین شیوه‌های احراز هویت و امنیت
- نام‌گذاری و سازماندهی منابع

#### منابع یادگیری
- **📖 پیکربندی**: [راهنمای پیکربندی](docs/getting-started/configuration.md) - تنظیم محیط
- **🔐 امنیت**: الگوهای احراز هویت و هویت مدیریت‌شده
- **📝 مثال‌ها**: [مثال برنامه پایگاه داده](../../examples/database-app) - الگوهای پیکربندی

#### تمرین‌های عملی
- پیکربندی چندین محیط (توسعه، آزمایشی، تولید)
- راه‌اندازی احراز هویت هویت مدیریت‌شده
- پیاده‌سازی پیکربندی‌های خاص محیط

**💡 نتیجه فصل**: مدیریت چندین محیط با احراز هویت و امنیت مناسب

---

### 🏗️ فصل ۴: زیرساخت به عنوان کد و استقرار
**پیش‌نیازها**: تکمیل فصل‌های ۱-۳  
**مدت زمان**: ۱-۱.۵ ساعت  
**پیچیدگی**: ⭐⭐⭐

#### آنچه یاد خواهید گرفت
- الگوهای پیشرفته استقرار
- زیرساخت به عنوان کد با Bicep
- استراتژی‌های تأمین منابع

#### منابع یادگیری
- **📖 استقرار**: [راهنمای استقرار](docs/deployment/deployment-guide.md) - جریان‌های کاری کامل
- **🏗️ تأمین منابع**: [تأمین منابع](docs/deployment/provisioning.md) - مدیریت منابع Azure
- **📝 مثال‌ها**: [مثال برنامه کانتینری](../../examples/container-app) - استقرارهای کانتینری‌شده

#### تمرین‌های عملی
- ایجاد قالب‌های سفارشی Bicep
- استقرار برنامه‌های چندسرویسی
- پیاده‌سازی استراتژی‌های استقرار آبی-سبز

**💡 نتیجه فصل**: استقرار برنامه‌های پیچیده چندسرویسی با استفاده از قالب‌های زیرساخت سفارشی

---

### 🎯 فصل ۵: راه‌حل‌های هوش مصنوعی چندعاملی (پیشرفته)
**پیش‌نیازها**: تکمیل فصل‌های ۱-۲  
**مدت زمان**: ۲-۳ ساعت  
**پیچیدگی**: ⭐⭐⭐⭐

#### آنچه یاد خواهید گرفت
- الگوهای معماری چندعاملی
- هماهنگی و مدیریت عامل‌ها
- استقرارهای آماده تولید هوش مصنوعی

#### منابع یادگیری
- **🤖 پروژه ویژه**: [راه‌حل چندعاملی خرده‌فروشی](examples/retail-scenario.md) - پیاده‌سازی کامل
- **🛠️ قالب‌های ARM**: [بسته قالب ARM](../../examples/retail-multiagent-arm-template) - استقرار با یک کلیک
- **📖 معماری**: الگوهای هماهنگی چندعاملی

#### تمرین‌های عملی
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 نتیجه فصل**: استقرار و مدیریت یک راه‌حل هوش مصنوعی چندعاملی آماده تولید با عامل‌های مشتری و موجودی

---

### 🔍 فصل ۶: اعتبارسنجی و برنامه‌ریزی پیش از استقرار
**پیش‌نیازها**: تکمیل فصل ۴  
**مدت زمان**: ۱ ساعت  
**پیچیدگی**: ⭐⭐

#### آنچه یاد خواهید گرفت
- برنامه‌ریزی ظرفیت و اعتبارسنجی منابع
- استراتژی‌های انتخاب SKU
- بررسی‌های پیش از استقرار و خودکارسازی

#### منابع یادگیری
- **📊 برنامه‌ریزی**: [برنامه‌ریزی ظرفیت](docs/pre-deployment/capacity-planning.md) - اعتبارسنجی منابع
- **💰 انتخاب**: [انتخاب SKU](docs/pre-deployment/sku-selection.md) - انتخاب‌های مقرون‌به‌صرفه
- **✅ اعتبارسنجی**: [بررسی‌های پیش از استقرار](docs/pre-deployment/preflight-checks.md) - اسکریپت‌های خودکار

#### تمرین‌های عملی
- اجرای اسکریپت‌های اعتبارسنجی ظرفیت
- بهینه‌سازی انتخاب‌های SKU برای هزینه
- پیاده‌سازی بررسی‌های خودکار پیش از استقرار

**💡 نتیجه فصل**: اعتبارسنجی و بهینه‌سازی استقرارها پیش از اجرا

---

### 🚨 فصل ۷: عیب‌یابی و اشکال‌زدایی
**پیش‌نیازها**: تکمیل هر فصل استقرار  
**مدت زمان**: ۱-۱.۵ ساعت  
**پیچیدگی**: ⭐⭐

#### آنچه یاد خواهید گرفت
- رویکردهای سیستماتیک عیب‌یابی
- مشکلات رایج و راه‌حل‌ها
- عیب‌یابی خاص هوش مصنوعی

#### منابع یادگیری
- **🔧 مشکلات رایج**: [مشکلات رایج](docs/troubleshooting/common-issues.md) - پرسش‌های متداول و راه‌حل‌ها
- **🕵️ اشکال‌زدایی**: [راهنمای اشکال‌زدایی](docs/troubleshooting/debugging.md) - استراتژی‌های گام‌به‌گام
- **🤖 مشکلات هوش مصنوعی**: [عیب‌یابی خاص هوش مصنوعی](docs/troubleshooting/ai-troubleshooting.md) - مشکلات خدمات هوش مصنوعی

#### تمرین‌های عملی
- تشخیص شکست‌های استقرار
- حل مشکلات احراز هویت
- اشکال‌زدایی اتصال خدمات هوش مصنوعی

**💡 نتیجه فصل**: تشخیص و حل مستقل مشکلات رایج استقرار

---

### 🏢 فصل ۸: الگوهای تولید و سازمانی
**پیش‌نیازها**: تکمیل فصل‌های ۱-۴  
**مدت زمان**: ۲-۳ ساعت  
**پیچیدگی**: ⭐⭐⭐⭐

#### آنچه یاد خواهید گرفت
- استراتژی‌های استقرار تولید
- الگوهای امنیت سازمانی
- نظارت و بهینه‌سازی هزینه

#### منابع یادگیری
- **🏭 تولید**: [بهترین شیوه‌های هوش مصنوعی تولیدی](docs/ai-foundry/production-ai-practices.md) - الگوهای سازمانی
- **📝 مثال‌ها**: [مثال میکروسرویس‌ها](../../examples/microservices) - معماری‌های پیچیده  
- **📊 نظارت**: یکپارچه‌سازی با Application Insights  

#### تمرین‌های عملی  
- پیاده‌سازی الگوهای امنیتی سازمانی  
- راه‌اندازی نظارت جامع  
- استقرار در محیط تولید با حاکمیت مناسب  

**💡 نتیجه فصل**: استقرار برنامه‌های آماده برای سازمان با قابلیت‌های کامل تولید  

---

## 🎓 مرور کارگاه: تجربه یادگیری عملی  

### مواد آموزشی کارگاه تعاملی  
**یادگیری عملی جامع با ابزارهای مبتنی بر مرورگر و تمرین‌های راهنما**  

مواد آموزشی کارگاه ما تجربه یادگیری ساختاریافته و تعاملی را ارائه می‌دهد که مکمل برنامه درسی فصل‌بندی شده بالا است. این کارگاه برای یادگیری خودمحور و جلسات تحت هدایت مربی طراحی شده است.  

#### 🛠️ ویژگی‌های کارگاه  
- **رابط مبتنی بر مرورگر**: کارگاه کامل با MkDocs با قابلیت جستجو، کپی و ویژگی‌های تم  
- **یکپارچه‌سازی با GitHub Codespaces**: راه‌اندازی محیط توسعه با یک کلیک  
- **مسیر یادگیری ساختاریافته**: ۷ مرحله تمرین راهنما (مجموعاً ۳.۵ ساعت)  
- **کشف → استقرار → سفارشی‌سازی**: روش‌شناسی پیش‌رونده  
- **محیط تعاملی DevContainer**: ابزارها و وابستگی‌های از پیش پیکربندی‌شده  

#### 📚 ساختار کارگاه  
این کارگاه از روش‌شناسی **کشف → استقرار → سفارشی‌سازی** پیروی می‌کند:  

1. **مرحله کشف** (۴۵ دقیقه)  
   - بررسی قالب‌ها و خدمات Azure AI Foundry  
   - درک الگوهای معماری چندعاملی  
   - مرور الزامات و پیش‌نیازهای استقرار  

2. **مرحله استقرار** (۲ ساعت)  
   - استقرار عملی برنامه‌های AI با AZD  
   - پیکربندی خدمات و نقاط انتهایی Azure AI  
   - پیاده‌سازی الگوهای امنیتی و احراز هویت  

3. **مرحله سفارشی‌سازی** (۴۵ دقیقه)  
   - اصلاح برنامه‌ها برای موارد استفاده خاص  
   - بهینه‌سازی برای استقرار در محیط تولید  
   - پیاده‌سازی نظارت و مدیریت هزینه  

#### 🚀 شروع کار با کارگاه  
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```
  
#### 🎯 نتایج یادگیری کارگاه  
با تکمیل کارگاه، شرکت‌کنندگان قادر خواهند بود:  
- **استقرار برنامه‌های AI تولیدی**: استفاده از AZD با خدمات Azure AI Foundry  
- **تسلط بر معماری‌های چندعاملی**: پیاده‌سازی راه‌حل‌های هماهنگ عامل‌های AI  
- **پیاده‌سازی بهترین شیوه‌های امنیتی**: پیکربندی احراز هویت و کنترل دسترسی  
- **بهینه‌سازی برای مقیاس‌پذیری**: طراحی استقرارهای مقرون‌به‌صرفه و کارآمد  
- **رفع مشکلات استقرار**: حل مسائل رایج به‌صورت مستقل  

#### 📖 منابع کارگاه  
- **🎥 راهنمای تعاملی**: [مواد کارگاه](workshop/README.md) - محیط یادگیری مبتنی بر مرورگر  
- **📋 دستورالعمل‌های گام‌به‌گام**: [تمرین‌های راهنما](../../workshop/docs/instructions) - راهنمایی‌های دقیق  
- **🛠️ آزمایشگاه کارگاه AI**: [آزمایشگاه کارگاه AI](docs/ai-foundry/ai-workshop-lab.md) - تمرین‌های متمرکز بر AI  
- **💡 شروع سریع**: [راهنمای راه‌اندازی کارگاه](workshop/README.md#quick-start) - پیکربندی محیط  

**مناسب برای**: آموزش شرکتی، دوره‌های دانشگاهی، یادگیری خودمحور و بوت‌کمپ‌های توسعه‌دهندگان.  

---

## 📖 Azure Developer CLI چیست؟  

Azure Developer CLI (azd) یک رابط خط فرمان متمرکز بر توسعه‌دهنده است که فرآیند ساخت و استقرار برنامه‌ها در Azure را تسریع می‌کند. این ابزار امکانات زیر را ارائه می‌دهد:  

- **استقرارهای مبتنی بر قالب** - استفاده از قالب‌های از پیش ساخته‌شده برای الگوهای رایج برنامه  
- **زیرساخت به‌عنوان کد** - مدیریت منابع Azure با استفاده از Bicep یا Terraform  
- **جریان‌های کاری یکپارچه** - تهیه، استقرار و نظارت بر برنامه‌ها به‌صورت یکپارچه  
- **مناسب برای توسعه‌دهندگان** - بهینه‌سازی شده برای بهره‌وری و تجربه توسعه‌دهنده  

### **AZD + Azure AI Foundry: مناسب برای استقرارهای AI**  

**چرا AZD برای راه‌حل‌های AI؟** AZD به چالش‌های اصلی توسعه‌دهندگان AI پاسخ می‌دهد:  

- **قالب‌های آماده AI** - قالب‌های از پیش پیکربندی‌شده برای Azure OpenAI، خدمات شناختی و بارهای کاری ML  
- **استقرارهای امن AI** - الگوهای امنیتی داخلی برای خدمات AI، کلیدهای API و نقاط انتهایی مدل  
- **الگوهای AI تولیدی** - بهترین شیوه‌ها برای استقرار برنامه‌های AI مقیاس‌پذیر و مقرون‌به‌صرفه  
- **جریان‌های کاری انتها به انتها AI** - از توسعه مدل تا استقرار تولید با نظارت مناسب  
- **بهینه‌سازی هزینه** - استراتژی‌های تخصیص منابع هوشمند و مقیاس‌پذیری برای بارهای کاری AI  
- **یکپارچگی با Azure AI Foundry** - اتصال یکپارچه به کاتالوگ مدل و نقاط انتهایی AI Foundry  

---

## 🎯 کتابخانه قالب‌ها و مثال‌ها  

### ویژه: قالب‌های Azure AI Foundry  
**از اینجا شروع کنید اگر برنامه‌های AI را مستقر می‌کنید!**  

| قالب | فصل | پیچیدگی | خدمات |  
|----------|---------|------------|----------|  
| [**شروع با چت AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | فصل ۲ | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |  
| [**شروع با عامل‌های AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | فصل ۲ | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|  
| [**اتوماسیون جریان کار چندعاملی**](https://github.com/Azure-Samples/get-started-with-ai-chat) | فصل ۵ | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|  
| [**تولید اسناد از داده‌های شما**](https://github.com/Azure-Samples/get-started-with-ai-chat) | فصل ۴ | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|  
| [**بهبود جلسات مشتری با عامل‌ها**](https://github.com/Azure-Samples/get-started-with-ai-chat) | فصل ۵ | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |  
| [**مدرن‌سازی کد شما با عامل‌ها**](https://github.com/Azure-Samples/get-started-with-ai-chat) | فصل ۵ | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|  
| [**ساخت عامل مکالمه‌ای خود**](https://github.com/Azure-Samples/get-started-with-ai-chat) | فصل ۴ | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|  
| [**باز کردن بینش‌ها از داده‌های مکالمه‌ای**](https://github.com/Azure-Samples/get-started-with-ai-chat) | فصل ۸ | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|  
| [**پردازش محتوای چندوجهی**](https://github.com/Azure-Samples/get-started-with-ai-chat) | فصل ۸ | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|  

### ویژه: سناریوهای یادگیری کامل  
**قالب‌های برنامه آماده تولید که به فصل‌های یادگیری نگاشت شده‌اند**  

| قالب | فصل یادگیری | پیچیدگی | کلید یادگیری |  
|----------|------------------|------------|--------------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | فصل ۲ | ⭐ | الگوهای استقرار AI پایه |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | فصل ۲ | ⭐⭐ | پیاده‌سازی RAG با Azure AI Search |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | فصل ۴ | ⭐⭐ | یکپارچگی هوش اسنادی |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | فصل ۵ | ⭐⭐⭐ | چارچوب عامل و فراخوانی توابع |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | فصل ۸ | ⭐⭐⭐ | هماهنگی AI سازمانی |  
| [**راه‌حل چندعاملی خرده‌فروشی**](examples/retail-scenario.md) | فصل ۵ | ⭐⭐⭐⭐ | معماری چندعاملی با عامل‌های مشتری و موجودی |  

### یادگیری بر اساس نوع مثال  

#### برنامه‌های ساده (فصل‌های ۱-۲)  
- [برنامه وب ساده](../../examples/simple-web-app) - الگوهای استقرار پایه  
- [وب‌سایت استاتیک](../../examples/static-site) - استقرار محتوای استاتیک  
- [API پایه](../../examples/basic-api) - استقرار REST API  

#### یکپارچگی پایگاه داده (فصل ۳-۴)  
- [برنامه پایگاه داده](../../examples/database-app) - الگوهای اتصال پایگاه داده  
- [پردازش داده‌ها](../../examples/data-processing) - استقرار جریان کاری ETL  

#### الگوهای پیشرفته (فصل‌های ۴-۸)  
- [برنامه‌های کانتینری](../../examples/container-app) - استقرارهای کانتینری‌شده  
- [میکروسرویس‌ها](../../examples/microservices) - معماری‌های چندخدمتی  
- [راه‌حل‌های سازمانی](../../examples/enterprise) - الگوهای آماده تولید  

### مجموعه قالب‌های خارجی  
- [**قالب‌های AZD Azure-Samples**](https://github.com/Azure-Samples/azd-templates) - نمونه‌های رسمی مایکروسافت  
- [**گالری Awesome AZD**](https://azure.github.io/awesome-azd/) - قالب‌های ارائه‌شده توسط جامعه  
- [**دایرکتوری مثال‌ها**](examples/README.md) - مثال‌های یادگیری محلی با توضیحات دقیق  

---

## 📚 منابع یادگیری و مراجع  

### مراجع سریع  
- [**برگه تقلب دستورات**](resources/cheat-sheet.md) - دستورات ضروری azd بر اساس فصل  
- [**واژه‌نامه**](resources/glossary.md) - اصطلاحات Azure و azd  
- [**پرسش‌های متداول**](resources/faq.md) - سوالات رایج بر اساس فصل یادگیری  
- [**راهنمای مطالعه**](resources/study-guide.md) - تمرین‌های جامع  

### کارگاه‌های عملی  
- [**آزمایشگاه کارگاه AI**](docs/ai-foundry/ai-workshop-lab.md) - راه‌حل‌های AI خود را قابل استقرار با AZD کنید (۲-۳ ساعت)  
- [**راهنمای تعاملی کارگاه**](workshop/README.md) - کارگاه مبتنی بر مرورگر با MkDocs و محیط DevContainer  
- [**مسیر یادگیری ساختاریافته**](../../workshop/docs/instructions) - ۷ مرحله تمرین راهنما (کشف → استقرار → سفارشی‌سازی)  
- [**کارگاه AZD برای مبتدیان**](workshop/README.md) - مواد کامل کارگاه عملی با یکپارچگی GitHub Codespaces  

### منابع یادگیری خارجی  
- [مستندات Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [مرکز معماری Azure](https://learn.microsoft.com/en-us/azure/architecture/)  
- [ماشین حساب قیمت‌گذاری Azure](https://azure.microsoft.com/pricing/calculator/)  
- [وضعیت Azure](https://status.azure.com/)  

---

## 🎓 تکمیل دوره و گواهینامه  

### پیگیری پیشرفت  
پیشرفت یادگیری خود را از طریق هر فصل پیگیری کنید:  

- [ ] **فصل ۱**: مبانی و شروع سریع ✅  
- [ ] **فصل ۲**: توسعه AI-محور ✅  
- [ ] **فصل ۳**: پیکربندی و احراز هویت ✅  
- [ ] **فصل ۴**: زیرساخت به‌عنوان کد و استقرار ✅  
- [ ] **فصل ۵**: راه‌حل‌های AI چندعاملی ✅  
- [ ] **فصل ۶**: اعتبارسنجی و برنامه‌ریزی پیش از استقرار ✅  
- [ ] **فصل ۷**: رفع اشکال و عیب‌یابی ✅  
- [ ] **فصل ۸**: الگوهای تولید و سازمانی ✅  

### تأیید یادگیری  
پس از تکمیل هر فصل، دانش خود را تأیید کنید:  
1. **تمرین عملی**: استقرار عملی فصل را کامل کنید  
2. **بررسی دانش**: بخش پرسش‌های متداول فصل خود را مرور کنید  
3. **بحث جامعه**: تجربه خود را در Discord Azure به اشتراک بگذارید  
4. **فصل بعدی**: به سطح پیچیدگی بعدی بروید  

### مزایای تکمیل دوره  
با تکمیل تمام فصل‌ها، شما:  
- **تجربه تولیدی**: برنامه‌های واقعی AI را در Azure مستقر کرده‌اید  
- **مهارت‌های حرفه‌ای**: قابلیت‌های استقرار آماده سازمانی  
- **شناخت جامعه**: عضو فعال جامعه توسعه‌دهندگان Azure  
- **پیشرفت شغلی**: تخصص مورد تقاضای AZD و استقرار AI  

---

## 🤝 جامعه و پشتیبانی  

### دریافت کمک و پشتیبانی  
- **مشکلات فنی**: [گزارش اشکالات و درخواست ویژگی‌ها](https://github.com/microsoft/azd-for-beginners/issues)  
- **سوالات یادگیری**: [جامعه Discord مایکروسافت Azure](https://discord.gg/microsoft-azure)  
- **کمک خاص AI**: به کانال [#Azure](https://discord.gg/microsoft-azure) برای بحث‌های AZD + AI Foundry بپیوندید  
- **مستندات**: [مستندات رسمی Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

### بینش‌های جامعه از Discord Azure AI Foundry  

**نتایج نظرسنجی اخیر از کانال #Azure:**  
- **۴۵٪** از توسعه‌دهندگان می‌خواهند از AZD برای بارهای کاری AI استفاده کنند  
- **چالش‌های اصلی**: استقرارهای چندخدمتی، مدیریت اعتبارنامه، آمادگی تولید  
- **بیشترین درخواست‌ها**: قالب‌های خاص AI، راهنماهای رفع اشکال، بهترین شیوه‌ها  

**به جامعه ما بپیوندید تا:**  
- تجربیات AZD + AI خود را به اشتراک بگذارید و کمک بگیرید  
- به پیش‌نمایش‌های اولیه قالب‌های جدید AI دسترسی پیدا کنید  
- به بهترین شیوه‌های استقرار AI کمک کنید  
- بر توسعه ویژگی‌های آینده AI + AZD تأثیر بگذارید  

### مشارکت در دوره  
ما از مشارکت‌ها استقبال می‌کنیم! لطفاً راهنمای [مشارکت](CONTRIBUTING.md) ما را برای جزئیات بخوانید:  
- **بهبود محتوا**: فصل‌ها و مثال‌های موجود را ارتقا دهید  
- **مثال‌های جدید**: سناریوها و قالب‌های واقعی اضافه کنید  
- **ترجمه**: به حفظ پشتیبانی چندزبانه کمک کنید  
- **گزارش اشکالات**: دقت و وضوح را بهبود دهید  
- **استانداردهای جامعه**: از دستورالعمل‌های جامعه فراگیر ما پیروی کنید  

---

## 📄 اطلاعات دوره  

### مجوز  
این پروژه تحت مجوز MIT منتشر شده است - برای جزئیات به فایل [LICENSE](../../LICENSE) مراجعه کنید.  
### منابع مرتبط با یادگیری مایکروسافت

تیم ما دوره‌های جامع دیگری نیز تولید کرده است:

- [پروتکل مدل کانتکست (MCP) برای مبتدیان](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [عامل‌های هوش مصنوعی برای مبتدیان](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [هوش مصنوعی مولد برای مبتدیان با استفاده از .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [هوش مصنوعی مولد برای مبتدیان](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [هوش مصنوعی مولد برای مبتدیان با استفاده از جاوا](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [یادگیری ماشین برای مبتدیان](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [علم داده برای مبتدیان](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [هوش مصنوعی برای مبتدیان](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [امنیت سایبری برای مبتدیان](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [توسعه وب برای مبتدیان](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [اینترنت اشیا برای مبتدیان](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [توسعه XR برای مبتدیان](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [تسلط بر GitHub Copilot برای برنامه‌نویسی جفتی هوش مصنوعی](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [تسلط بر GitHub Copilot برای توسعه‌دهندگان C#/.NET](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [ماجراجویی Copilot خود را انتخاب کنید](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

## 🗺️ ناوبری دوره

**🚀 آماده یادگیری هستید؟**

**مبتدیان**: با [فصل ۱: مبانی و شروع سریع](../..) شروع کنید  
**توسعه‌دهندگان هوش مصنوعی**: به [فصل ۲: توسعه مبتنی بر هوش مصنوعی](../..) بروید  
**توسعه‌دهندگان باتجربه**: با [فصل ۳: پیکربندی و احراز هویت](../..) شروع کنید

**گام‌های بعدی**: [شروع فصل ۱ - اصول AZD](docs/getting-started/azd-basics.md) →

---

