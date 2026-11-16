# 7. جمع‌بندی و مراحل بعدی

!!! tip "پیام‌های اصلی که باید به یاد داشته باشید"

    - [ ] AZD templates accelerate AI application development from days to hours
    - [ ] The Discovery → Deployment → Customization methodology provides a structured learning path
    - [ ] GitHub Copilot with MCP servers enables natural language exploration of complex codebases
    - [ ] Microsoft Foundry provides built-in observability, evaluation, and security testing

---

## 1. آنچه که به دست آوردید

تبریک! در این کارگاه شما با موفقیت:

| ماژول | دستاورد |
|:---|:---|
| **ماژول 1** | آشنایی با Azure Developer CLI و انتخاب یک قالب هوش مصنوعی |
| **ماژول 2** | استقرار و اعتبارسنجی یک راهکار کامل هوش مصنوعی عوامل |
| **ماژول 3** | تفکیک قالب برای درک معماری آن |
| **ماژول 4** | بررسی تنظیمات `azure.yaml` و قلاب‌های چرخه عمر |
| **ماژول 5** | سفارشی‌سازی قالب برای سناریوی خودتان |
| **ماژول 6** | تخریب ایمن زیرساخت و مدیریت منابع |

---

## 2. مفاهیم کلیدی که یاد گرفتید

### Azure Developer CLI (azd)
- `azd init` - راه‌اندازی پروژه‌ها از قالب‌ها
- `azd up` - تامین و استقرار با یک دستور
- `azd env` - مدیریت متغیرهای محیطی
- `azd down` - پاک‌سازی ایمن منابع

### ساختار قالب AZD
- `azure.yaml` - قلاب‌های پیکربندی و استقرار
- `infra/` - زیرساخت به صورت کد با بیسکپ
- `src/` - کد منبع برنامه
- `scripts/` - اسکریپت‌های اتوماسیون و راه‌اندازی

### قابلیت‌های Microsoft Foundry
- سرویس هوش مصنوعی عامل برای دستیارهای هوشمند
- جستجوی فایل و Azure AI Search برای بازیابی دانش
- ردگیری، نظارت و ارزیابی داخلی
- بررسی ایمنی هوش مصنوعی توسط تیم قرمز

---

## 3. مسیر یادگیری خود را ادامه دهید

### مراحل بعدی پیشنهادی

| مسیر | منبع | زمان |
|:---|:---|:---|
| **دوره کامل** | [دوره آشنایی با AZD برای مبتدیان](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) | خودآموز |
| **آزمایش قالب دیگری** | [قالب‌های Microsoft Foundry](https://ai.azure.com/templates) | ۱-۲ ساعت |
| **مطالعه عمیق‌تر** | [مستندات Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | مداوم |
| **جامعه** | [دیسکورد Azure](https://aka.ms/foundry/discord) | همین امروز بپیوندید! |

### قالب‌های پیشنهادی برای آزمایش بعدی

1. **[شروع با چت هوش مصنوعی](https://github.com/Azure-Samples/get-started-with-ai-chat)** - چت پایه با داده‌های شما
2. **[دموی Azure Search OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** - الگوهای پیشرفته RAG
3. **[چت Contoso](https://github.com/Azure-Samples/contoso-chat)** - سناریوهای خرده‌فروشی سازمانی

---

## 4. چالش کارگاه

آماده‌اید مهارت‌های خود را بسنجید؟ این چالش‌ها را امتحان کنید:

| چالش | توضیحات | درجه سختی |
|:---|:---|:---|
| **1. سناریوی چندعاملی** | استقرار و سفارشی‌سازی برای صنعت متفاوت (مثلاً بهداشت و درمان، مالی) | ⭐⭐ |
| **2. پایگاه دانش سفارشی** | اضافه کردن فایل‌های داده‌ای خود و ایجاد شاخص جستجوی سفارشی | ⭐⭐⭐ |
| **3. استقرار در محیط تولید** | راه‌اندازی CI/CD با GitHub Actions با استفاده از `azd pipeline config` | ⭐⭐⭐⭐ |

---

## 5. بازخورد خود را به اشتراک بگذارید

بازخورد شما به ما کمک می‌کند این کارگاه را بهبود دهیم!

- **گیت‌هاب Issues**: [ارسال بازخورد](https://github.com/microsoft/azd-for-beginners/issues) - تگ‌گذاری با `Workshop`
- **دیسکورد**: به [مایکروسافت Foundry Discord](https://aka.ms/foundry/discord) بپیوندید - ارسال در `#get-help`
- **مشارکت‌ها**: با ارسال درخواست‌های کشیدن به بهبود کارگاه کمک کنید!

---

## سپاسگزاریم! 🎉

از اینکه کارگاه AZD برای توسعه‌دهندگان هوش مصنوعی را تکمیل کردید، سپاسگزاریم. امیدواریم این تجربه شما را با مهارت‌ها و اعتماد به نفس لازم برای ساخت و استقرار برنامه‌های هوش مصنوعی در Azure مجهز کرده باشد.

**به ساختن ادامه دهید، به یادگیری ادامه دهید و به جامعه توسعه‌دهندگان هوش مصنوعی Azure خوش آمدید!**

---

| | |
|:---|:---|
| **📚 صفحه اصلی دوره** | [دوره AZD برای مبتدیان](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) |
| **📖 مستندات** | [مستندات Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ قالب‌های هوش مصنوعی** | [قالب‌های Microsoft Foundry](https://ai.azure.com/templates) |
| **💬 جامعه** | [دیسکورد Azure](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->