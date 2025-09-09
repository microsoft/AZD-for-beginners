<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3bd0e0644b110276e4364eb753ddcef8",
  "translation_date": "2025-09-09T16:28:15+00:00",
  "source_file": "README.md",
  "language_code": "fa"
}
-->
# AZD برای مبتدیان

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.fa.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)  
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)  
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)  

[![Azure Discord](https://dcbadge.limes.yellow/api/server/kzRShWzttr)](https://discord.gg/microsoft-azure)  
[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)  

برای شروع استفاده از این منابع، مراحل زیر را دنبال کنید:  
1. **فورک کردن مخزن**: کلیک کنید [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)  
2. **کلون کردن مخزن**: `git clone https://github.com/microsoft/azd-for-beginners.git`  
3. [**به جوامع دیسکورد Azure بپیوندید و با کارشناسان و توسعه‌دهندگان دیگر ملاقات کنید**](https://discord.com/invite/ByRwuEEgH4)  

### 🌐 پشتیبانی چندزبانه

#### پشتیبانی شده از طریق GitHub Action (خودکار و همیشه به‌روز)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](./README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)  

**اگر می‌خواهید زبان‌های ترجمه بیشتری پشتیبانی شوند، لیست زبان‌های موجود [اینجا](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md) را مشاهده کنید.**

## مقدمه

به راهنمای جامع برای Azure Developer CLI (azd) خوش آمدید. این مخزن برای کمک به توسعه‌دهندگان در همه سطوح، از دانشجویان تا توسعه‌دهندگان حرفه‌ای، طراحی شده است تا Azure Developer CLI را برای استقرارهای ابری کارآمد یاد بگیرند و تسلط پیدا کنند. این منبع آموزشی ساختارمند تجربه عملی با استقرارهای ابری Azure، رفع مشکلات رایج و اجرای بهترین روش‌ها برای استقرار قالب‌های AZD را فراهم می‌کند.

## اهداف یادگیری

با کار کردن روی این مخزن، شما:  
- اصول و مفاهیم اصلی Azure Developer CLI را یاد خواهید گرفت  
- یاد می‌گیرید که منابع Azure را با استفاده از Infrastructure as Code استقرار و فراهم کنید  
- مهارت‌های رفع مشکلات برای مسائل رایج استقرار AZD را توسعه می‌دهید  
- اعتبارسنجی پیش از استقرار و برنامه‌ریزی ظرفیت را درک می‌کنید  
- بهترین روش‌های امنیتی و استراتژی‌های بهینه‌سازی هزینه را اجرا می‌کنید  
- اعتماد به نفس در استقرار برنامه‌های آماده تولید به Azure را به دست می‌آورید  

## نتایج یادگیری

پس از تکمیل این دوره، شما قادر خواهید بود:  
- Azure Developer CLI را با موفقیت نصب، پیکربندی و استفاده کنید  
- برنامه‌ها را با استفاده از قالب‌های AZD ایجاد و استقرار دهید  
- مشکلات مربوط به احراز هویت، زیرساخت و استقرار را رفع کنید  
- بررسی‌های پیش از استقرار از جمله برنامه‌ریزی ظرفیت و انتخاب SKU را انجام دهید  
- بهترین روش‌های نظارت، امنیت و مدیریت هزینه را اجرا کنید  
- جریان‌های کاری AZD را در خطوط CI/CD ادغام کنید  

## فهرست مطالب

- [Azure Developer CLI چیست؟](../..)  
- [شروع سریع](../..)  
- [مستندات](../..)  
- [نمونه‌ها و قالب‌ها](../..)  
- [منابع](../..)  
- [مشارکت](../..)  

## Azure Developer CLI چیست؟

Azure Developer CLI (azd) یک رابط خط فرمان محور توسعه‌دهنده است که فرآیند ساخت و استقرار برنامه‌ها به Azure را تسریع می‌کند. این ابزار ارائه می‌دهد:  

- **استقرارهای مبتنی بر قالب** - استفاده از قالب‌های از پیش ساخته شده برای الگوهای رایج برنامه  
- **Infrastructure as Code** - مدیریت منابع Azure با استفاده از Bicep یا Terraform  
- **جریان‌های کاری یکپارچه** - فراهم‌سازی، استقرار و نظارت بر برنامه‌ها به صورت یکپارچه  
- **مناسب برای توسعه‌دهندگان** - بهینه شده برای بهره‌وری و تجربه توسعه‌دهنده  

## شروع سریع

### پیش‌نیازها  
- اشتراک Azure  
- نصب Azure CLI  
- Git (برای کلون کردن قالب‌ها)  

### نصب  
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```  

### اولین استقرار شما  
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```  

## مستندات

### شروع به کار  
- [**مبانی AZD**](docs/getting-started/azd-basics.md) - مفاهیم و اصطلاحات اصلی  
- [**نصب و راه‌اندازی**](docs/getting-started/installation.md) - راهنماهای نصب مخصوص پلتفرم  
- [**پیکربندی**](docs/getting-started/configuration.md) - تنظیم محیط و احراز هویت  
- [**اولین پروژه شما**](docs/getting-started/first-project.md) - آموزش گام به گام  

### استقرار و فراهم‌سازی  
- [**راهنمای استقرار**](docs/deployment/deployment-guide.md) - جریان‌های کاری کامل استقرار  
- [**فراهم‌سازی منابع**](docs/deployment/provisioning.md) - مدیریت منابع Azure  

### بررسی‌های پیش از استقرار  
- [**برنامه‌ریزی ظرفیت**](docs/pre-deployment/capacity-planning.md) - اعتبارسنجی ظرفیت منابع Azure  
- [**انتخاب SKU**](docs/pre-deployment/sku-selection.md) - انتخاب SKU‌های مناسب Azure  
- [**بررسی‌های پیش از پرواز**](docs/pre-deployment/preflight-checks.md) - اسکریپت‌های اعتبارسنجی خودکار  

### رفع مشکلات  
- [**مشکلات رایج**](docs/troubleshooting/common-issues.md) - مشکلات و راه‌حل‌های رایج  
- [**راهنمای اشکال‌زدایی**](docs/troubleshooting/debugging.md) - استراتژی‌های اشکال‌زدایی گام به گام  

## نمونه‌ها و قالب‌ها

### قالب‌های ابتدایی  
- [**برنامه وب ساده**](../../examples/simple-web-app) - استقرار برنامه وب Node.js ساده  
- [**وب‌سایت استاتیک**](../../examples/static-website) - میزبانی وب‌سایت استاتیک در Azure Storage  
- [**برنامه کانتینری**](../../examples/container-app) - استقرار برنامه کانتینری شده  
- [**برنامه پایگاه داده**](../../examples/database-app) - برنامه وب با ادغام پایگاه داده  

### سناریوهای پیشرفته  
- [**میکروسرویس‌ها**](../../examples/microservices) - معماری برنامه چند سرویس  
- [**توابع بدون سرور**](../../examples/serverless-function) - استقرار Azure Functions  
- [**نمونه‌های پیکربندی**](../../examples/configurations) - الگوهای پیکربندی قابل استفاده مجدد  

## منابع

### منابع سریع  
- [**برگه تقلب دستورات**](resources/cheat-sheet.md) - دستورات ضروری azd  
- [**واژه‌نامه**](resources/glossary.md) - اصطلاحات Azure و azd  
- [**پرسش‌های متداول**](resources/faq.md) - پرسش‌های رایج  
- [**راهنمای مطالعه**](resources/study-guide.md) - اهداف یادگیری جامع و تمرین‌ها  

### منابع خارجی  
- [مستندات Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [مرکز معماری Azure](https://learn.microsoft.com/en-us/azure/architecture/)  
- [ماشین حساب قیمت‌گذاری Azure](https://azure.microsoft.com/pricing/calculator/)  
- [وضعیت Azure](https://status.azure.com/)  

## مسیر یادگیری

### برای دانشجویان و مبتدیان  
1. با [مبانی AZD](docs/getting-started/azd-basics.md) شروع کنید  
2. [راهنمای نصب](docs/getting-started/installation.md) را دنبال کنید  
3. [اولین پروژه شما](docs/getting-started/first-project.md) را تکمیل کنید  
4. با [نمونه برنامه وب ساده](../../examples/simple-web-app) تمرین کنید  

### برای توسعه‌دهندگان  
1. [راهنمای پیکربندی](docs/getting-started/configuration.md) را مرور کنید  
2. [راهنمای استقرار](docs/deployment/deployment-guide.md) را مطالعه کنید  
3. [نمونه برنامه پایگاه داده](../../examples/database-app) را کار کنید  
4. [نمونه برنامه کانتینری](../../examples/container-app) را بررسی کنید  

### برای مهندسان DevOps  
1. [فراهم‌سازی منابع](docs/deployment/provisioning.md) را یاد بگیرید  
2. [بررسی‌های پیش از پرواز](docs/pre-deployment/preflight-checks.md) را اجرا کنید  
3. [برنامه‌ریزی ظرفیت](docs/pre-deployment/capacity-planning.md) را تمرین کنید  
4. [نمونه پیشرفته میکروسرویس‌ها](../../examples/microservices) را بررسی کنید  

## مشارکت

ما از مشارکت‌ها استقبال می‌کنیم! لطفاً [راهنمای مشارکت](CONTRIBUTING.md) ما را برای جزئیات در مورد:  
- نحوه ارسال مشکلات و درخواست‌های ویژگی  
- دستورالعمل‌های مشارکت کد  
- بهبود مستندات  
- استانداردهای جامعه  

## پشتیبانی

- **مشکلات**: [گزارش اشکالات و درخواست ویژگی‌ها](https://github.com/microsoft/azd-for-beginners/issues)  
- **بحث‌ها**: [پرسش و پاسخ و بحث‌های جامعه دیسکورد Microsoft Azure](https://discord.gg/microsoft-azure)  
- **ایمیل**: برای پرسش‌های خصوصی  
- **Microsoft Learn**: [مستندات رسمی Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

## مجوز

این پروژه تحت مجوز MIT منتشر شده است - فایل [LICENSE](../../LICENSE) را برای جزئیات مشاهده کنید.  

## 🎒 دوره‌های دیگر

تیم ما دوره‌های دیگری تولید می‌کند! بررسی کنید:  

- [**جدید** پروتکل زمینه مدل (MCP) برای مبتدیان](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI Agents برای مبتدیان](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI برای مبتدیان با استفاده از .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
- [Generative AI برای مبتدیان](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI برای مبتدیان با استفاده از Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
- [ML برای مبتدیان](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
- [علم داده برای مبتدیان](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI برای مبتدیان](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
- [امنیت سایبری برای مبتدیان](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)  
- [آموزش توسعه وب برای مبتدیان](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
- [آموزش اینترنت اشیا برای مبتدیان](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
- [آموزش توسعه واقعیت افزوده برای مبتدیان](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [تسلط بر GitHub Copilot برای برنامه‌نویسی جفتی هوش مصنوعی](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
- [تسلط بر GitHub Copilot برای توسعه‌دهندگان C#/.NET](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
- [ماجراجویی خود را با Copilot انتخاب کنید](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  

---

**ناوبری**  
- **درس بعدی**: [مبانی AZD](docs/getting-started/azd-basics.md)  

---

**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما تلاش می‌کنیم دقت را حفظ کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌ها باشند. سند اصلی به زبان اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس، توصیه می‌شود از ترجمه حرفه‌ای انسانی استفاده کنید. ما مسئولیتی در قبال سوء تفاهم‌ها یا تفسیرهای نادرست ناشی از استفاده از این ترجمه نداریم.