<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "be2a85ad63abe28f2eb71ba3f3800272",
  "translation_date": "2025-09-17T16:27:24+00:00",
  "source_file": "workshop/README.md",
  "language_code": "fa"
}
-->
# کارگاه AZD برای توسعه‌دهندگان هوش مصنوعی

**راهنمای کارگاه**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../README.md)
- **📖 فصل‌های مرتبط**: شامل [فصل ۱](../README.md#-chapter-1-foundation--quick-start)، [فصل ۲](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)، و [فصل ۵](../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **🛠️ آزمایش عملی**: [آزمایشگاه کارگاه هوش مصنوعی](../docs/ai-foundry/ai-workshop-lab.md)
- **🚀 مراحل بعدی**: [ماژول‌های کارگاه](../../../workshop)

به کارگاه عملی برای یادگیری Azure Developer CLI (AZD) با تمرکز بر استقرار برنامه‌های هوش مصنوعی خوش آمدید. این کارگاه طراحی شده است تا شما را از اصول اولیه AZD به سمت استقرار راه‌حل‌های هوش مصنوعی آماده تولید هدایت کند.

## نمای کلی کارگاه

**مدت زمان:** ۲-۳ ساعت  
**سطح:** مبتدی تا متوسط  
**پیش‌نیازها:** دانش پایه‌ای از Azure، ابزارهای خط فرمان، و مفاهیم هوش مصنوعی

### آنچه یاد خواهید گرفت

- **مبانی AZD**: درک زیرساخت به عنوان کد با AZD  
- 🤖 **یکپارچه‌سازی خدمات هوش مصنوعی**: استقرار Azure OpenAI، AI Search و سایر خدمات هوش مصنوعی  
- **استقرار کانتینر**: استفاده از Azure Container Apps برای برنامه‌های هوش مصنوعی  
- **بهترین شیوه‌های امنیتی**: پیاده‌سازی Managed Identity و تنظیمات امن  
- **نظارت و مشاهده‌پذیری**: راه‌اندازی Application Insights برای بارهای کاری هوش مصنوعی  
- **الگوهای تولید**: استراتژی‌های استقرار آماده برای سازمان‌ها  

## ساختار کارگاه

### ماژول ۱: مبانی AZD (۳۰ دقیقه)
- نصب و پیکربندی AZD  
- درک ساختار پروژه AZD  
- اولین استقرار AZD شما  
- **آزمایشگاه**: استقرار یک برنامه وب ساده  

### ماژول ۲: یکپارچه‌سازی Azure OpenAI (۴۵ دقیقه)
- راه‌اندازی منابع Azure OpenAI  
- استراتژی‌های استقرار مدل  
- پیکربندی دسترسی API و احراز هویت  
- **آزمایشگاه**: استقرار یک برنامه چت با GPT-4  

### ماژول ۳: برنامه‌های RAG (۴۵ دقیقه)
- یکپارچه‌سازی Azure AI Search  
- پردازش اسناد با Azure Document Intelligence  
- جاسازی برداری و جستجوی معنایی  
- **آزمایشگاه**: ساخت یک سیستم پرسش و پاسخ اسناد  

### ماژول ۴: استقرار تولید (۳۰ دقیقه)
- پیکربندی برنامه‌های کانتینر  
- بهینه‌سازی مقیاس‌پذیری و عملکرد  
- نظارت و ثبت لاگ  
- **آزمایشگاه**: استقرار در تولید با مشاهده‌پذیری  

### ماژول ۵: الگوهای پیشرفته (۱۵ دقیقه)
- استقرار چند محیطی  
- یکپارچه‌سازی CI/CD  
- استراتژی‌های بهینه‌سازی هزینه  
- **جمع‌بندی**: چک‌لیست آمادگی تولید  

## پیش‌نیازها

### ابزارهای مورد نیاز

لطفاً این ابزارها را قبل از کارگاه نصب کنید:

```bash
# Azure Developer CLI
curl -fsSL https://aka.ms/install-azd.sh | bash

# Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Git
sudo apt-get install git

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Python 3.10+
sudo apt-get install python3.10 python3.10-venv python3-pip
```

### تنظیم حساب Azure

1. **اشتراک Azure**: [ثبت‌نام رایگان](https://azure.microsoft.com/free/)  
2. **دسترسی Azure OpenAI**: [درخواست دسترسی](https://aka.ms/oai/access)  
3. **مجوزهای مورد نیاز**:  
   - نقش Contributor در اشتراک یا گروه منابع  
   - User Access Administrator (برای تخصیص‌های RBAC)  

### بررسی پیش‌نیازها

این اسکریپت را اجرا کنید تا تنظیمات خود را بررسی کنید:

```bash
#!/bin/bash
echo "Verifying workshop prerequisites..."

# Check AZD installation
if command -v azd &> /dev/null; then
    echo "✅ Azure Developer CLI: $(azd --version)"
else
    echo "❌ Azure Developer CLI not found"
fi

# Check Azure CLI
if command -v az &> /dev/null; then
    echo "✅ Azure CLI: $(az --version | head -n1)"
else
    echo "❌ Azure CLI not found"
fi

# Check Docker
if command -v docker &> /dev/null; then
    echo "✅ Docker: $(docker --version)"
else
    echo "❌ Docker not found"
fi

# Check Python
if command -v python3 &> /dev/null; then
    echo "✅ Python: $(python3 --version)"
else
    echo "❌ Python 3 not found"
fi

# Check Azure login
if az account show &> /dev/null; then
    echo "✅ Azure: Logged in as $(az account show --query user.name -o tsv)"
else
    echo "❌ Azure: Not logged in (run 'az login')"
fi

echo "Setup verification complete!"
```

## مواد کارگاه

### تمرین‌های آزمایشگاهی

هر ماژول شامل آزمایش‌های عملی با کد اولیه و دستورالعمل‌های گام به گام است:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - اولین استقرار AZD شما  
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - برنامه چت با Azure OpenAI  
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - برنامه RAG با AI Search  
- **[lab-4-production/](../../../workshop/lab-4-production)** - الگوهای استقرار تولید  
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - سناریوهای استقرار پیشرفته  

### مواد مرجع

- **[راهنمای یکپارچه‌سازی AI Foundry](../docs/ai-foundry/azure-ai-foundry-integration.md)** - الگوهای جامع یکپارچه‌سازی  
- **[راهنمای استقرار مدل هوش مصنوعی](../docs/ai-foundry/ai-model-deployment.md)** - بهترین شیوه‌های استقرار مدل  
- **[شیوه‌های تولید هوش مصنوعی](../docs/ai-foundry/production-ai-practices.md)** - الگوهای استقرار سازمانی  
- **[راهنمای رفع اشکال هوش مصنوعی](../docs/troubleshooting/ai-troubleshooting.md)** - مشکلات رایج و راه‌حل‌ها  

### قالب‌های نمونه

قالب‌های شروع سریع برای سناریوهای رایج هوش مصنوعی:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## شروع کار

### گزینه ۱: GitHub Codespaces (توصیه‌شده)

سریع‌ترین راه برای شروع کارگاه:

[![Open in GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### گزینه ۲: توسعه محلی

1. **کلون کردن مخزن کارگاه:**
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **ورود به Azure:**
```bash
az login
azd auth login
```

3. **شروع با آزمایشگاه ۱:**
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### گزینه ۳: کارگاه با مربی

اگر در یک جلسه با مربی شرکت می‌کنید:

- 🎥 **ضبط کارگاه**: [در دسترس به صورت درخواستی](https://aka.ms/azd-ai-workshop)  
- 💬 **جامعه Discord**: [برای پشتیبانی زنده بپیوندید](https://aka.ms/foundry/discord)  
- **بازخورد کارگاه**: [تجربه خود را به اشتراک بگذارید](https://aka.ms/azd-workshop-feedback)  

## جدول زمانی کارگاه

### یادگیری خودمحور (۳ ساعت)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### جلسه با مربی (۲.۵ ساعت)

```
⏰ 00:00 - 00:15  Welcome & Prerequisites Check
⏰ 00:15 - 00:40  Module 1: Live Demo + Lab
⏰ 00:40 - 01:20  Module 2: OpenAI Integration
⏰ 01:20 - 01:30  Break
⏰ 01:30 - 02:10  Module 3: RAG Applications
⏰ 02:10 - 02:30  Module 4: Production Patterns
⏰ 02:30 - 02:45  Module 5: Advanced Topics
⏰ 02:45 - 03:00  Q&A and Resources
```

## معیارهای موفقیت

تا پایان این کارگاه، شما قادر خواهید بود:

✅ **استقرار برنامه‌های هوش مصنوعی** با استفاده از قالب‌های AZD  
✅ **پیکربندی خدمات Azure OpenAI** با امنیت مناسب  
✅ **ساخت برنامه‌های RAG** با یکپارچه‌سازی Azure AI Search  
✅ **پیاده‌سازی الگوهای تولید** برای بارهای کاری هوش مصنوعی سازمانی  
✅ **نظارت و رفع اشکال** استقرار برنامه‌های هوش مصنوعی  
✅ **اعمال استراتژی‌های بهینه‌سازی هزینه** برای بارهای کاری هوش مصنوعی  

## جامعه و پشتیبانی

### در طول کارگاه

- 🙋 **سوالات**: از چت کارگاه استفاده کنید یا دست خود را بلند کنید  
- 🐛 **مشکلات**: راهنمای [رفع اشکال](../docs/troubleshooting/ai-troubleshooting.md) را بررسی کنید  
- **نکات**: کشفیات خود را با سایر شرکت‌کنندگان به اشتراک بگذارید  

### پس از کارگاه

- 💬 **Discord**: [جامعه Azure AI Foundry](https://aka.ms/foundry/discord)  
- **مشکلات GitHub**: [گزارش مشکلات قالب](https://github.com/YOUR_ORG/AZD-for-beginners/issues)  
- 📧 **بازخورد**: [فرم ارزیابی کارگاه](https://aka.ms/azd-workshop-feedback)  

## مراحل بعدی

### ادامه یادگیری

1. **سناریوهای پیشرفته**: بررسی [استقرار چند منطقه‌ای](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment)  
2. **یکپارچه‌سازی CI/CD**: راه‌اندازی [جریان‌های کاری GitHub Actions](../docs/deployment/github-actions.md)  
3. **قالب‌های سفارشی**: ایجاد [قالب‌های AZD خود](../docs/getting-started/custom-templates.md)  

### اعمال در پروژه‌های خود

1. **ارزیابی**: از [چک‌لیست آمادگی](./production-readiness-checklist.md) ما استفاده کنید  
2. **قالب‌ها**: با [قالب‌های خاص هوش مصنوعی](../../../workshop/templates) ما شروع کنید  
3. **پشتیبانی**: به [Discord Azure AI Foundry](https://aka.ms/foundry/discord) بپیوندید  

### موفقیت خود را به اشتراک بگذارید

- ⭐ **مخزن را ستاره‌دار کنید** اگر این کارگاه به شما کمک کرد  
- 🐦 **در شبکه‌های اجتماعی به اشتراک بگذارید** با #AzureDeveloperCLI #AzureAI  
- 📝 **یک پست وبلاگ بنویسید** درباره سفر استقرار هوش مصنوعی خود  

---

## بازخورد کارگاه

بازخورد شما به ما کمک می‌کند تجربه کارگاه را بهبود دهیم:

| جنبه | امتیاز (۱-۵) | نظرات |
|------|--------------|-------|
| کیفیت محتوا | ⭐⭐⭐⭐⭐ | |
| آزمایش‌های عملی | ⭐⭐⭐⭐⭐ | |
| مستندات | ⭐⭐⭐⭐⭐ | |
| سطح دشواری | ⭐⭐⭐⭐⭐ | |
| تجربه کلی | ⭐⭐⭐⭐⭐ | |

**ارسال بازخورد**: [فرم ارزیابی کارگاه](https://aka.ms/azd-workshop-feedback)

---

**قبلی:** [راهنمای رفع اشکال هوش مصنوعی](../docs/troubleshooting/ai-troubleshooting.md) | **بعدی:** شروع با [آزمایشگاه ۱: مبانی AZD](../../../workshop/lab-1-azd-basics)

**آماده برای شروع ساخت برنامه‌های هوش مصنوعی با AZD؟**

[شروع آزمایشگاه ۱: مبانی AZD →](./lab-1-azd-basics/README.md)

---

**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما تلاش می‌کنیم دقت را حفظ کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌ها باشند. سند اصلی به زبان اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما مسئولیتی در قبال سوءتفاهم‌ها یا تفسیرهای نادرست ناشی از استفاده از این ترجمه نداریم.