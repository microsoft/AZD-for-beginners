# AZD For Beginners: A Structured Learning Journey

![AZD برای مبتدیان](../../translated_images/fa/azdbeginners.5527441dd9f74068.webp) 

[![ناظرهای GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![فورک‌های GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![ستاره‌های GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord آژور](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Discord Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### ترجمه‌های خودکار (همیشه به‌روز)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[عربی](../ar/README.md) | [بنگالی](../bn/README.md) | [بلغاری](../bg/README.md) | [برمه (میانمار)](../my/README.md) | [چینی (ساده‌شده)](../zh-CN/README.md) | [چینی (سنتی، هنگ‌کنگ)](../zh-HK/README.md) | [چینی (سنتی، ماکائو)](../zh-MO/README.md) | [چینی (سنتی، تایوان)](../zh-TW/README.md) | [کرواتی](../hr/README.md) | [چک](../cs/README.md) | [دانمارکی](../da/README.md) | [هلندی](../nl/README.md) | [استونیایی](../et/README.md) | [فنلاندی](../fi/README.md) | [فرانسوی](../fr/README.md) | [آلمانی](../de/README.md) | [یونانی](../el/README.md) | [عبری](../he/README.md) | [هندی](../hi/README.md) | [مجارستانی](../hu/README.md) | [اندونزیایی](../id/README.md) | [ایتالیایی](../it/README.md) | [ژاپنی](../ja/README.md) | [کانادا (Kannada)](../kn/README.md) | [کره‌ای](../ko/README.md) | [لیتوانیایی](../lt/README.md) | [مالایی](../ms/README.md) | [مالایالام](../ml/README.md) | [مراتی](../mr/README.md) | [نپالی](../ne/README.md) | [پیجی نیجریانی](../pcm/README.md) | [نروژی](../no/README.md) | [فارسی (Farsi)](./README.md) | [لهستانی](../pl/README.md) | [پرتغالی (برزیل)](../pt-BR/README.md) | [پرتغالی (پرتغال)](../pt-PT/README.md) | [پنجابی (گورموخی)](../pa/README.md) | [رومانیایی](../ro/README.md) | [روسی](../ru/README.md) | [صربی (سیریلیک)](../sr/README.md) | [اسلواکی](../sk/README.md) | [اسلوونیایی](../sl/README.md) | [اسپانیایی](../es/README.md) | [سواحیلی](../sw/README.md) | [سوئدی](../sv/README.md) | [تاگالوگ (فیلیپینی)](../tl/README.md) | [تامیلی](../ta/README.md) | [تلوگو](../te/README.md) | [تایلندی](../th/README.md) | [ترکی](../tr/README.md) | [اوکراینی](../uk/README.md) | [اردو](../ur/README.md) | [ویتنامی](../vi/README.md)

> **ترجیح می‌دهید محلی کلون کنید؟**
>
> این مخزن شامل بیش از 50 ترجمه به زبان‌های مختلف است که اندازه دانلود را به‌طور قابل‌توجهی افزایش می‌دهد. برای کلون کردن بدون ترجمه‌ها از sparse checkout استفاده کنید:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> این به شما همه چیز مورد نیاز برای تکمیل دوره را با دانلود بسیار سریع‌تر می‌دهد.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 چه چیز جدیدی امروز در azd آمده است

Azure Developer CLI فراتر از برنامه‌های وب و API سنتی رشد کرده است. امروزه، azd ابزار تک برای استقرار هر نوع برنامه در Azure است—از جمله برنامه‌های مبتنی بر AI و عامل‌های هوشمند.

این برای شما چه معنایی دارد:

- **عامل‌های AI اکنون به‌عنوان بار کاری درجه‌یک در azd پشتیبانی می‌شوند.** شما می‌توانید پروژه‌های عامل AI را با همان گردش کاری `azd init` → `azd up` که قبلاً می‌شناسید، مقداردهی اولیه، استقرار و مدیریت کنید.
- **ادغام Microsoft Foundry** استقرار مدل، میزبانی عامل و پیکربندی سرویس‌های AI را مستقیماً به اکوسیستم قالب‌های azd آورده است.
- **گردش کاری اصلی تغییر نکرده است.** چه در حال استقرار یک اپ todo، یک میکروسرویس یا یک راه‌حل چندعاملی AI باشید، فرمان‌ها یکسان هستند.

اگر قبلاً از azd استفاده کرده‌اید، پشتیبانی از AI یک توسعه طبیعی است—نه یک ابزار جدا یا مسیر پیشرفته. اگر تازه کار را شروع می‌کنید، یک گردش کاری واحد را می‌آموزید که برای همه چیز کار می‌کند.

---

## 🚀 Azure Developer CLI (azd) چیست؟

**Azure Developer CLI (azd)** یک ابزار خط فرمان دوستانه برای توسعه‌دهنده است که ساده می‌کند استقرار برنامه‌ها در Azure را. به جای ایجاد و اتصال دستی ده‌ها منبع Azure، می‌توانید کل برنامه‌ها را با یک فرمان مستقر کنید.

### جادوی `azd up`

```bash
# این یک دستور همه کارها را انجام می‌دهد:
# ✅ تمام منابع Azure را ایجاد می‌کند
# ✅ شبکه و امنیت را پیکربندی می‌کند
# ✅ کد برنامه شما را می‌سازد
# ✅ به Azure مستقر می‌کند
# ✅ یک URL قابل استفاده به شما می‌دهد
azd up
```

**همین است!** نیازی به کلیک در Azure Portal نیست، نیازی به یادگیری قالب‌های پیچیده ARM نیست، هیچ پیکربندی دستی‌ای لازم نیست - فقط برنامه‌های در حال اجرا روی Azure.

---

## ❓ تفاوت Azure Developer CLI و Azure CLI چیست؟

این متداول‌ترین سوالی است که مبتدیان می‌پرسند. پاسخ ساده این است:

| ویژگی | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **هدف** | مدیریت منابع منفرد Azure | استقرار برنامه‌های کامل |
| **ذهنیت** | متمرکز بر زیرساخت | متمرکز بر برنامه |
| **مثال** | `az webapp create --name myapp...` | `azd up` |
| **منحنی یادگیری** | باید خدمات Azure را بدانید | کافی است برنامه خود را بشناسید |
| **مناسب برای** | DevOps، زیرساخت | توسعه‌دهندگان، نمونه‌سازی |

### تشبیه ساده

- **Azure CLI** مانند داشتن همه ابزارها برای ساختن یک خانه است - چکش، اره، میخ‌ها. می‌توانید هر چیزی بسازید، اما باید ساخت‌وساز را بدانید.
- **Azure Developer CLI** مانند استخدام یک پیمانکار است - شما توصیف می‌کنید چه می‌خواهید و او ساخت را انجام می‌دهد.

### چه زمانی از هرکدام استفاده کنیم

| سناریو | از این استفاده کنید |
|----------|----------|
| "می‌خواهم برنامه وبم را سریع استقرار دهم" | `azd up` |
| "فقط باید یک حساب ذخیره‌سازی ایجاد کنم" | `az storage account create` |
| "در حال ساخت یک برنامه کامل AI هستم" | `azd init --template azure-search-openai-demo` |
| "باید یک منبع خاص Azure را اشکال‌زدایی کنم" | `az resource show` |
| "می‌خواهم استقرار آماده تولید در چند دقیقه داشته باشم" | `azd up --environment production` |

### آن‌ها با هم کار می‌کنند!

AZD از Azure CLI در پس‌زمینه استفاده می‌کند. شما می‌توانید هردو را استفاده کنید:
```bash
# برنامه خود را با AZD مستقر کنید
azd up

# سپس منابع خاص را با Azure CLI بهینه‌سازی کنید
az webapp config set --name myapp --always-on true
```

---

## 🌟 پیدا کردن قالب‌ها در Awesome AZD

از ابتدا شروع نکنید! **Awesome AZD** مجموعه‌ای از قالب‌های آماده برای استقرار است که توسط جامعه ارائه شده:

| منبع | توضیحات |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | مرور بیش از 200 قالب با یک کلیک برای استقرار |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | قالب خود را به جامعه ارسال کنید |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | ستاره دهید و منبع را بررسی کنید |

### قالب‌های محبوب AI از Awesome AZD

```bash
# گفتگوی RAG با مدل‌های Microsoft Foundry + جستجوی هوش مصنوعی
azd init --template azure-search-openai-demo

# برنامه گفتگوی سریع هوش مصنوعی
azd init --template openai-chat-app-quickstart

# عوامل هوش مصنوعی با عوامل Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 شروع در 3 مرحله

### مرحله 1: نصب AZD (۲ دقیقه)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### مرحله 2: ورود به Azure

```bash
azd auth login
```

### مرحله 3: استقرار اولین برنامه شما

```bash
# مقداردهی اولیه از یک قالب
azd init --template todo-nodejs-mongo

# استقرار در Azure (همه چیز را ایجاد می‌کند!)
azd up
```

**🎉 تمام شد!** برنامه شما اکنون روی Azure فعال است.

### پاک‌سازی (فراموش نکنید!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 چگونه از این دوره استفاده کنیم

این دوره برای یادگیری پیش‌رونده طراحی شده است - از جایی شروع کنید که احساس راحتی می‌کنید و به تدریج پیش بروید:

| تجربه شما | از اینجا شروع کنید |
|-----------------|------------|
| **کاملاً تازه‌کار با Azure** | [فصل 1: پایه](#-chapter-1-foundation--quick-start) |
| **Azure را می‌شناسید، با AZD تازه‌کارید** | [فصل 1: پایه](#-chapter-1-foundation--quick-start) |
| **می‌خواهید اپ‌های AI را استقرار دهید** | [فصل 2: توسعه مبتنی بر AI](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **می‌خواهید تمرین عملی داشته باشید** | [🎓 کارگاه تعاملی](workshop/README.md) - آزمایشگاه راهنمایی‌شده ۳–۴ ساعته |
| **به الگوهای تولید نیاز دارید** | [فصل 8: تولید و الگوهای سازمانی](#-chapter-8-production--enterprise-patterns) |

### راه‌اندازی سریع

1. **فورک این مخزن**: [![فورک‌های GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **کلون کنید**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **کمک بگیرید**: [جامعه Discord آژور](https://discord.com/invite/ByRwuEEgH4)

> **ترجیح می‌دهید محلی کلون کنید؟**

> این مخزن شامل بیش از 50 ترجمه به زبان‌های مختلف است که اندازه دانلود را به‌طور قابل‌توجهی افزایش می‌دهد. برای کلون کردن بدون ترجمه‌ها از sparse checkout استفاده کنید:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> این به شما همه چیز مورد نیاز برای تکمیل دوره را با دانلود بسیار سریع‌تر می‌دهد.


## مرور کلی دوره

مستر Azure Developer CLI (azd) را از طریق فصل‌های ساختاریافته که برای یادگیری پیش‌رونده طراحی شده‌اند بیاموزید. **تمرکز ویژه بر استقرار برنامه‌های AI با ادغام Microsoft Foundry.**

### چرا این دوره برای توسعه‌دهندگان مدرن ضروری است

براساس دیدگاه‌های جامعه Discord مایکروسافت فاندری، **45% توسعه‌دهندگان می‌خواهند از AZD برای بارهای کاری AI استفاده کنند** اما با چالش‌هایی روبرو می‌شوند مانند:
- معماری‌های پیچیده چندسرویسی AI
- بهترین شیوه‌ها برای استقرار AI در تولید  
- ادغام و پیکربندی سرویس‌های AI در Azure
- بهینه‌سازی هزینه برای بارهای کاری AI
- عیب‌یابی مسائل خاص استقرار AI

### اهداف یادگیری

با تکمیل این دوره ساختاریافته، شما:
- **اصول AZD را مسلط می‌شوید**: مفاهیم هسته‌ای، نصب و پیکربندی
- **برنامه‌های AI را مستقر می‌کنید**: استفاده از AZD با سرویس‌های Microsoft Foundry
- **Infrastructure as Code را پیاده‌سازی می‌کنید**: مدیریت منابع Azure با قالب‌های Bicep
- **عیب‌یابی استقرارها را انجام می‌دهید**: رفع مشکلات رایج و دیباگ
- **برای تولید بهینه می‌کنید**: امنیت، مقیاس‌پذیری، مانیتورینگ و مدیریت هزینه
- **راه‌حل‌های چندعاملی می‌سازید**: استقرار معماری‌های پیچیده AI

## 🗺️ نقشه دوره: ناوبری سریع بر اساس فصل

هر فصل یک README جداگانه با اهداف یادگیری، شروع سریع و تمرین‌ها دارد:

| فصل | موضوع | درس‌ها | مدت زمان | پیچیدگی |
|---------|-------|---------|----------|------------|
| **[فصل 1: پایه](docs/chapter-01-foundation/README.md)** | شروع کار | [مبانی AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [نصب](docs/chapter-01-foundation/installation.md) &#124; [اولین پروژه](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[فصل 2: توسعه هوش مصنوعی](docs/chapter-02-ai-development/README.md)** | برنامه‌های مبتنی بر هوش مصنوعی | [ادغام Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [عامل‌های هوش مصنوعی](docs/chapter-02-ai-development/agents.md) &#124; [استقرار مدل](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [کارگاه](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ساعت | ⭐⭐ |
| **[فصل 3: پیکربندی](docs/chapter-03-configuration/README.md)** | احراز هویت و امنیت | [پیکربندی](docs/chapter-03-configuration/configuration.md) &#124; [احراز هویت و امنیت](docs/chapter-03-configuration/authsecurity.md) | 45-60 دقیقه | ⭐⭐ |
| **[فصل 4: زیرساخت](docs/chapter-04-infrastructure/README.md)** | زیرساخت به‌عنوان کد و استقرار | [راهنمای استقرار](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [تأمین منابع](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ساعت | ⭐⭐⭐ |
| **[فصل 5: چندعامل](docs/chapter-05-multi-agent/README.md)** | راهکارهای عامل‌های هوش مصنوعی | [سناریوی خرده‌فروشی](examples/retail-scenario.md) &#124; [الگوهای هماهنگی](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ساعت | ⭐⭐⭐⭐ |
| **[فصل 6: پیش از استقرار](docs/chapter-06-pre-deployment/README.md)** | برنامه‌ریزی و اعتبارسنجی | [بررسی‌های پیش‌اجرایی](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [برنامه‌ریزی ظرفیت](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [انتخاب SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Application Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 ساعت | ⭐⭐ |
| **[فصل 7: عیب‌یابی](docs/chapter-07-troubleshooting/README.md)** | اشکال‌زدایی و رفع | [مسائل رایج](docs/chapter-07-troubleshooting/common-issues.md) &#124; [اشکال‌زدایی](docs/chapter-07-troubleshooting/debugging.md) &#124; [مشکلات مرتبط با هوش مصنوعی](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ساعت | ⭐⭐ |
| **[فصل 8: تولید](docs/chapter-08-production/README.md)** | الگوهای سازمانی | [شیوه‌های تولید](docs/chapter-08-production/production-ai-practices.md) | 2-3 ساعت | ⭐⭐⭐⭐ |
| **[🎓 کارگاه](workshop/README.md)** | آزمایشگاه عملی | [مقدمه](workshop/docs/instructions/0-Introduction.md) &#124; [انتخاب](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [اعتبارسنجی](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [تجزیه](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [پیکربندی](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [سفارشی‌سازی](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [پاک‌سازی](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [جمع‌بندی](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ساعت | ⭐⭐ |

**کل مدت دوره:** ~10-14 ساعت | **پیشرفت مهارتی:** مبتدی → آماده برای تولید

---

## 📚 فصل‌های آموزشی

*مسیر یادگیری خود را بر اساس سطح تجربه و اهداف انتخاب کنید*

### 🚀 فصل 1: مبانی و شروع سریع
**پیش‌نیازها**: اشتراک Azure، دانش پایه‌ای از خط فرمان  
**مدت زمان**: 30-45 دقیقه  
**پیچیدگی**: ⭐

#### آنچه خواهید آموخت
- درک اصول Azure Developer CLI
- نصب AZD روی پلتفرم شما
- اولین استقرار موفق شما

#### منابع آموزشی
- **🎯 از اینجا شروع کنید**: [Azure Developer CLI چیست؟](#what-is-azure-developer-cli)
- **📖 نظریه**: [اصول AZD](docs/chapter-01-foundation/azd-basics.md) - مفاهیم و اصطلاحات پایه‌ای
- **⚙️ راه‌اندازی**: [نصب و راه‌اندازی](docs/chapter-01-foundation/installation.md) - راهنماهای مربوط به پلتفرم‌ها
- **🛠️ عملی**: [اولین پروژه شما](docs/chapter-01-foundation/first-project.md) - آموزش گام‌به‌گام
- **📋 مرجع سریع**: [خلاصه دستورات](resources/cheat-sheet.md)

#### تمرین‌های عملی
```bash
# بررسی سریع نصب
azd version

# اولین برنامه خود را مستقر کنید
azd init --template todo-nodejs-mongo
azd up
```

**💡 خروجی فصل**: استقرار موفق یک برنامه وب ساده در Azure با استفاده از AZD

**✅ اعتبارسنجی موفقیت:**
```bash
# پس از اتمام فصل ۱، شما باید بتوانید:
azd version              # نسخه نصب‌شده را نشان می‌دهد
azd init --template todo-nodejs-mongo  # پروژه را مقداردهی اولیه می‌کند
azd up                  # به Azure مستقر می‌کند
azd show                # آدرس URL برنامه در حال اجرا را نمایش می‌دهد
# برنامه در مرورگر باز می‌شود و کار می‌کند
azd down --force --purge  # منابع را پاک‌سازی می‌کند
```

**📊 زمان مورد نیاز:** 30-45 دقیقه  
**📈 سطح مهارتی پس از اتمام:** قادر به استقرار برنامه‌های پایه به‌طور مستقل
**📈 سطح مهارتی پس از اتمام:** قادر به استقرار برنامه‌های پایه به‌طور مستقل

---

### 🤖 فصل 2: توسعه اولویت‌دار هوش مصنوعی (توصیه‌شده برای توسعه‌دهندگان هوش مصنوعی)
**پیش‌نیازها**: تکمیل فصل 1  
**مدت زمان**: 1-2 ساعت  
**پیچیدگی**: ⭐⭐

#### آنچه خواهید آموخت
- ادغام Microsoft Foundry با AZD
- استقرار برنامه‌های مجهز به هوش مصنوعی
- درک پیکربندی‌های سرویس‌های هوش مصنوعی

#### منابع آموزشی
- **🎯 از اینجا شروع کنید**: [ادغام Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 عامل‌های هوش مصنوعی**: [راهنمای عامل‌های هوش مصنوعی](docs/chapter-02-ai-development/agents.md) - استقرار عامل‌های هوشمند با AZD
- **📖 الگوها**: [استقرار مدل‌های هوش مصنوعی](docs/chapter-02-ai-development/ai-model-deployment.md) - استقرار و مدیریت مدل‌های هوش مصنوعی
- **🛠️ کارگاه**: [آزمایشگاه کارگاه AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - آماده‌سازی راهکارهای هوش مصنوعی برای AZD
- **🎥 راهنمای تعاملی**: [مواد کارگاه](workshop/README.md) - یادگیری مبتنی بر مرورگر با MkDocs * محیط DevContainer
- **📋 الگوها**: [الگوهای Microsoft Foundry](#منابع-کارگاه)
- **📝 مثال‌ها**: [مثال‌های استقرار AZD](examples/README.md)

#### تمرین‌های عملی
```bash
# اولین برنامهٔ هوش مصنوعی خود را مستقر کنید
azd init --template azure-search-openai-demo
azd up

# قالب‌های اضافی هوش مصنوعی را امتحان کنید
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 خروجی فصل**: استقرار و پیکربندی یک برنامه چت مجهز به AI با قابلیت‌های RAG

**✅ اعتبارسنجی موفقیت:**
```bash
# پس از فصل ۲، باید بتوانید:
azd init --template azure-search-openai-demo
azd up
# رابط گفت‌وگوی هوش مصنوعی را آزمایش کنید
# سؤالات مطرح کنید و پاسخ‌های مبتنی بر هوش مصنوعی همراه با منابع دریافت کنید
# بررسی کنید که ادغام جستجو کار می‌کند
azd monitor  # بررسی کنید که Application Insights داده‌های تله‌متری را نشان می‌دهد
azd down --force --purge
```

**📊 زمان مورد نیاز:** 1-2 ساعت  
**📈 سطح مهارتی پس از اتمام:** قادر به استقرار و پیکربندی برنامه‌های هوش مصنوعی آماده تولید  
**💰 آگاهی هزینه:** درک هزینه‌های توسعه ~$80-150/ماه، هزینه‌های تولید $300-3500/ماه

#### 💰 ملاحظات هزینه برای استقرارهای AI

**محیط توسعه (تخمین $80-150/ماه):**
- مدل‌های Microsoft Foundry (پرداخت بر اساس مصرف): $0-50/ماه (بر اساس مصرف توکن)
- AI Search (رده پایه): $75/ماه
- Container Apps (مصرفی): $0-20/ماه
- Storage (استاندارد): $1-5/ماه

**محیط تولید (تخمین $300-3,500+/ماه):**
- مدل‌های Microsoft Foundry (PTU برای عملکرد پایدار): $3,000+/ماه یا پرداخت بر اساس مصرف با حجم بالا
- AI Search (رده استاندارد): $250/ماه
- Container Apps (اختصاصی): $50-100/ماه
- Application Insights: $5-50/ماه
- Storage (پرمیوم): $10-50/ماه

**💡 نکات بهینه‌سازی هزینه:**
- از مدل‌های Microsoft Foundry **Free Tier** برای یادگیری استفاده کنید (Azure OpenAI شامل 50,000 توکن/ماه)
- اجرای `azd down` برای آزادسازی منابع هنگامی که فعالانه توسعه نمی‌دهید
- با صورتحساب مبتنی بر مصرف شروع کنید، تنها برای تولید به PTU ارتقا دهید
- از `azd provision --preview` برای تخمین هزینه‌ها قبل از استقرار استفاده کنید
- مقیاس‌گذاری خودکار را فعال کنید: فقط برای استفاده واقعی پرداخت کنید

**نظارت بر هزینه:**
```bash
# هزینه‌های ماهانهٔ تخمینی را بررسی کنید
azd provision --preview

# هزینه‌های واقعی را در پرتال Azure رصد کنید
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ فصل 3: پیکربندی و احراز هویت
**پیش‌نیازها**: تکمیل فصل 1  
**مدت زمان**: 45-60 دقیقه  
**پیچیدگی**: ⭐⭐

#### آنچه خواهید آموخت
- پیکربندی و مدیریت محیط‌ها
- بهترین روش‌ها در احراز هویت و امنیت
- نام‌گذاری و سازماندهی منابع

#### منابع آموزشی
- **📖 پیکربندی**: [راهنمای پیکربندی](docs/chapter-03-configuration/configuration.md) - تنظیم محیط
- **🔐 امنیت**: [الگوهای احراز هویت و managed identity](docs/chapter-03-configuration/authsecurity.md) - الگوهای احراز هویت
- **📝 مثال‌ها**: [مثال برنامه دیتابیس](examples/database-app/README.md) - مثال‌های دیتابیس AZD

#### تمرین‌های عملی
- پیکربندی چندین محیط (dev, staging, prod)
- راه‌اندازی احراز هویت managed identity
- پیاده‌سازی پیکربندی‌های مخصوص محیط

**💡 خروجی فصل**: مدیریت چندین محیط با احراز هویت و امنیت مناسب

---

### 🏗️ فصل 4: زیرساخت به‌عنوان کد و استقرار
**پیش‌نیازها**: تکمیل فصل‌های 1-3  
**مدت زمان**: 1-1.5 ساعت  
**پیچیدگی**: ⭐⭐⭐

#### آنچه خواهید آموخت
- الگوهای پیشرفته استقرار
- زیرساخت به‌عنوان کد با Bicep
- استراتژی‌های تأمین منابع

#### منابع آموزشی
- **📖 استقرار**: [راهنمای استقرار](docs/chapter-04-infrastructure/deployment-guide.md) - جریان‌های کاری کامل
- **🏗️ تأمین منابع**: [تأمین منابع](docs/chapter-04-infrastructure/provisioning.md) - مدیریت منابع Azure
- **📝 مثال‌ها**: [مثال Container App](../../examples/container-app) - استقرارهای کانتینری

#### تمرین‌های عملی
- ایجاد الگوهای Bicep سفارشی
- استقرار برنامه‌های چندخدمتی
- پیاده‌سازی استراتژی‌های استقرار blue-green

**💡 خروجی فصل**: استقرار برنامه‌های پیچیده چندخدمتی با استفاده از الگوهای زیرساخت سفارشی

---

### 🎯 فصل 5: راهکارهای چندعامل هوش مصنوعی (پیشرفته)
**پیش‌نیازها**: تکمیل فصل‌های 1-2  
**مدت زمان**: 2-3 ساعت  
**پیچیدگی**: ⭐⭐⭐⭐

#### آنچه خواهید آموخت
- الگوهای معماری چندعامل
- ارکستراسیون و هماهنگی عامل‌ها
- استقرارهای آماده تولید هوش مصنوعی

#### منابع آموزشی
- **🤖 پروژه ویژه**: [راهکار چندعامل خرده‌فروشی](examples/retail-scenario.md) - پیاده‌سازی کامل
- **🛠️ بسته ARM**: [بسته قالب ARM چندعامل خرده‌فروشی](../../examples/retail-multiagent-arm-template) - استقرار با یک کلیک
- **📖 معماری**: [الگوهای هماهنگی چندعامل](docs/chapter-06-pre-deployment/coordination-patterns.md) - الگوها

#### تمرین‌های عملی
```bash
# استقرار کامل راه‌حل چندعاملی خرده‌فروشی
cd examples/retail-multiagent-arm-template
./deploy.sh

# کاوش پیکربندی‌های عامل
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 خروجی فصل**: استقرار و مدیریت یک راهکار چندعامل آماده تولید با عامل‌های مشتری و موجودی

---

### 🔍 فصل 6: اعتبارسنجی و برنامه‌ریزی قبل از استقرار
**پیش‌نیازها**: تکمیل فصل 4  
**مدت زمان**: 1 ساعت  
**پیچیدگی**: ⭐⭐

#### آنچه خواهید آموخت
- برنامه‌ریزی ظرفیت و اعتبارسنجی منابع
- استراتژی‌های انتخاب SKU
- بررسی‌های پیش‌اجرایی و اتوماسیون

#### منابع آموزشی
- **📊 برنامه‌ریزی**: [برنامه‌ریزی ظرفیت](docs/chapter-06-pre-deployment/capacity-planning.md) - اعتبارسنجی منابع
- **💰 انتخاب**: [انتخاب SKU](docs/chapter-06-pre-deployment/sku-selection.md) - انتخاب‌های اقتصادی
- **✅ اعتبارسنجی**: [بررسی‌های پیش‌اجرایی](docs/chapter-06-pre-deployment/preflight-checks.md) - اسکریپت‌های خودکار

#### تمرین‌های عملی
- اجرای اسکریپت‌های اعتبارسنجی ظرفیت
- بهینه‌سازی انتخاب‌های SKU برای کاهش هزینه
- پیاده‌سازی بررسی‌های خودکار پیش از استقرار

**💡 خروجی فصل**: اعتبارسنجی و بهینه‌سازی استقرارها قبل از اجرا

---

### 🚨 فصل 7: عیب‌یابی و اشکال‌زدایی
**پیش‌نیازها**: تکمیل هر فصل استقرار  
**مدت زمان**: 1-1.5 ساعت  
**پیچیدگی**: ⭐⭐

#### آنچه خواهید آموخت
- رویکردهای سیستماتیک برای اشکال‌زدایی
- مسائل رایج و راه‌حل‌ها
- عیب‌یابی مخصوص هوش مصنوعی

#### منابع آموزشی
- **🔧 مسائل رایج**: [مسائل رایج](docs/chapter-07-troubleshooting/common-issues.md) - سوالات متداول و راه‌حل‌ها
- **🕵️ اشکال‌زدایی**: [راهنمای اشکال‌زدایی](docs/chapter-07-troubleshooting/debugging.md) - راهبردهای گام‌به‌گام
- **🤖 مسائل AI**: [عیب‌یابی مخصوص هوش مصنوعی](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - مشکلات سرویس‌های هوش مصنوعی

#### تمرین‌های عملی
- تشخیص خطاهای استقرار
- رفع مسائل احراز هویت
- اشکال‌زدایی اتصال سرویس‌های هوش مصنوعی

**💡 خروجی فصل**: تشخیص و رفع مستقل مسائل رایج استقرار

---

### 🏢 فصل 8: تولید و الگوهای سازمانی
**پیش‌نیازها**: تکمیل فصل‌های 1-4  
**مدت زمان**: 2-3 ساعت  
**پیچیدگی**: ⭐⭐⭐⭐

#### آنچه خواهید آموخت
- استراتژی‌های استقرار در تولید
- الگوهای امنیتی سازمانی
- نظارت و بهینه‌سازی هزینه

#### منابع آموزشی
- **🏭 محیط تولید**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - الگوهای سازمانی
- **📝 نمونه‌ها**: [Microservices Example](../../examples/microservices) - معماری‌های پیچیده
- **📊 نظارت**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - نظارت

#### تمرین‌های عملی
- پیاده‌سازی الگوهای امنیتی سازمانی
- راه‌اندازی نظارت جامع
- انتشار در محیط تولید با حاکمیت مناسب

**💡 نتیجه فصل**: استقرار برنامه‌های آماده سازمانی با قابلیت‌های کامل تولید

---

## 🎓 مروری بر کارگاه: تجربه یادگیری عملی

> **⚠️ وضعیت کارگاه: در حال توسعه**  
> مطالب کارگاه در حال توسعه و پالایش هستند. ماژول‌های اصلی عملکردی هستند، اما برخی بخش‌های پیشرفته کامل نشده‌اند. ما به‌طور فعال در حال تکمیل تمام محتوا هستیم. [پیگیری پیشرفت →](workshop/README.md)

### مطالب تعاملی کارگاه
**یادگیری عملی جامع با ابزارهای مبتنی بر مرورگر و تمرین‌های هدایت‌شده**

مطالب کارگاه یک تجربه یادگیری ساختارمند و تعاملی فراهم می‌کند که مکمل برنامه آموزشی مبتنی بر فصل بالا است. کارگاه برای هر دو حالت یادگیری خود‌سرعت و جلسات هدایت‌شده توسط مدرس طراحی شده است.

#### 🛠️ ویژگی‌های کارگاه
- **رابط مبتنی بر مرورگر**: کارگاه کامل مبتنی بر MkDocs با قابلیت‌های جستجو، کپی و پوسته
- **یکپارچه‌سازی GitHub Codespaces**: راه‌اندازی محیط توسعه با یک کلیک
- **مسیر یادگیری ساختارمند**: 8 ماژول تمرین هدایت‌شده (در مجموع 3-4 ساعت)
- **روش پیش‌رونده**: مقدمه → انتخاب → اعتبارسنجی → تحلیل ساختار → پیکربندی → سفارشی‌سازی → پاکسازی → جمع‌بندی
- **محیط DevContainer تعاملی**: ابزارها و وابستگی‌های از پیش پیکربندی‌شده

#### 📚 ساختار ماژول‌های کارگاه
کارگاه از یک **روش 8‌ماژولی پیش‌رونده** پیروی می‌کند که شما را از کشف تا تسلط بر استقرار می‌برد:

| ماژول | موضوع | کاری که انجام خواهید داد | مدت زمان |
|--------|-------|----------------|----------|
| **0. مقدمه** | مروری بر کارگاه | درک اهداف یادگیری، پیش‌نیازها و ساختار کارگاه | 15 min |
| **1. انتخاب** | کشف قالب | بررسی قالب‌های AZD و انتخاب قالب AI مناسب برای سناریوی شما | 20 min |
| **2. اعتبارسنجی** | استقرار و تأیید | قالب را با `azd up` مستقر کرده و بررسی کنید زیرساخت کار می‌کند | 30 min |
| **3. تحلیل ساختار** | درک ساختار | از GitHub Copilot برای بررسی معماری قالب، فایل‌های Bicep و سازماندهی کد استفاده کنید | 30 min |
| **4. پیکربندی** | مرور عمیق azure.yaml | تسلط بر پیکربندی `azure.yaml`، هوک‌های lifecycle و متغیرهای محیطی | 30 min |
| **5. سفارشی‌سازی** | آن را برای خودتان سازگار کنید | فعال‌سازی AI Search، ردیابی، ارزیابی و سفارشی‌سازی برای سناریوی شما | 45 min |
| **6. پاکسازی** | پاکسازی | خروج ایمن از منابع با `azd down --purge` | 15 min |
| **7. جمع‌بندی** | گام‌های بعدی | بازبینی دستاوردها، مفاهیم کلیدی و ادامه مسیر یادگیری | 15 min |

**روند کارگاه:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 شروع کار با کارگاه
```bash
# گزینه ۱: GitHub Codespaces (توصیه‌شده)
# در مخزن روی «Code» → «Create codespace on main» کلیک کنید

# گزینه ۲: توسعه محلی
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# دستورالعمل‌های راه‌اندازی در workshop/README.md را دنبال کنید
```

#### 🎯 نتایج یادگیری کارگاه
با تکمیل کارگاه، شرکت‌کنندگان قادر خواهند بود:
- **استقرار برنامه‌های هوش مصنوعی مناسب محیط تولید**: استفاده از AZD با سرویس‌های Microsoft Foundry
- **تسلط بر معماری‌های چندعاملی**: پیاده‌سازی راه‌حل‌های هماهنگ‌شده عامل‌های هوش مصنوعی
- **پیاده‌سازی بهترین شیوه‌های امنیتی**: پیکربندی احراز هویت و کنترل دسترسی
- **بهینه‌سازی برای مقیاس**: طراحی استقرارهای اقتصادی از نظر هزینه و عملکرد
- **عیب‌یابی استقرارها**: رفع مشکلات رایج به‌صورت مستقل

#### 📖 منابع کارگاه
- **🎥 راهنمای تعاملی**: [Workshop Materials](workshop/README.md) - محیط یادگیری مبتنی بر مرورگر
- **📋 دستورالعمل‌های ماژول به ماژول**:
  - [0. مقدمه](workshop/docs/instructions/0-Introduction.md) - مروری بر کارگاه و اهداف
  - [1. انتخاب](workshop/docs/instructions/1-Select-AI-Template.md) - یافتن و انتخاب قالب‌های AI
  - [2. اعتبارسنجی](workshop/docs/instructions/2-Validate-AI-Template.md) - استقرار و بررسی قالب‌ها
  - [3. تحلیل ساختار](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - بررسی معماری قالب
  - [4. پیکربندی](workshop/docs/instructions/4-Configure-AI-Template.md) - تسلط بر azure.yaml
  - [5. سفارشی‌سازی](workshop/docs/instructions/5-Customize-AI-Template.md) - سفارشی‌سازی برای سناریوی شما
  - [6. پاکسازی](workshop/docs/instructions/6-Teardown-Infrastructure.md) - پاکسازی منابع
  - [7. جمع‌بندی](workshop/docs/instructions/7-Wrap-up.md) - بازبینی و گام‌های بعدی
- **🛠️ آزمایشگاه کارگاه AI**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - تمرین‌های متمرکز بر هوش مصنوعی
- **💡 شروع سریع**: [Workshop Setup Guide](workshop/README.md#quick-start) - پیکربندی محیط

**مناسب برای**: آموزش سازمانی، دوره‌های دانشگاهی، یادگیری خودآموز و بوت‌کمپ‌های توسعه‌دهندگان.

---

## 📖 بررسی عمیق: قابلیت‌های AZD

فراتر از اصول پایه، AZD قابلیت‌های قدرتمندی برای استقرار در محیط تولید ارائه می‌دهد:

- **استقرار مبتنی بر قالب** - استفاده از قالب‌های از پیش ساخته‌شده برای الگوهای متداول برنامه‌ها
- **زیرساخت به‌عنوان کد** - مدیریت منابع Azure با استفاده از Bicep یا Terraform  
- **گردش‌کارهای یکپارچه** - تأمین، استقرار و نظارت بر برنامه‌ها به‌صورت یکپارچه
- **مناسب توسعه‌دهنده** - بهینه‌شده برای بهره‌وری و تجربه توسعه‌دهنده

### **AZD + Microsoft Foundry: مناسب برای استقرارهای AI**

**چرا AZD برای راه‌حل‌های هوش مصنوعی؟** AZD به مهم‌ترین چالش‌هایی که توسعه‌دهندگان AI با آن مواجه‌اند می‌پردازد:

- **قالب‌های آماده AI** - قالب‌های از پیش پیکربندی‌شده برای مدل‌های Microsoft Foundry، Cognitive Services، و بارهای کاری ML
- **استقرارهای امن AI** - الگوهای امنیتی داخلی برای سرویس‌های AI، کلیدهای API و نقاط انتهایی مدل  
- **الگوهای AI برای تولید** - بهترین شیوه‌ها برای استقرار برنامه‌های AI مقیاس‌پذیر و اقتصادی
- **گردش‌کارهای انتها-به-انتها AI** - از توسعه مدل تا استقرار در تولید با نظارت مناسب
- **بهینه‌سازی هزینه** - تخصیص هوشمند منابع و استراتژی‌های مقیاس‌بندی برای بارهای کاری AI
- **یکپارچگی با Microsoft Foundry** - اتصال یکپارچه به فهرست مدل‌ها و نقاط انتهایی Microsoft Foundry

---

## 🎯 کتابخانه قالب‌ها و مثال‌ها

### ویژه: قالب‌های Microsoft Foundry
**اگر برنامه‌های هوش مصنوعی مستقر می‌کنید، از اینجا شروع کنید!**

> **توجه:** این قالب‌ها الگوهای مختلف AI را نشان می‌دهند. برخی از آنها نمونه‌های Azure خارجی هستند و برخی دیگر پیاده‌سازی‌های محلی هستند.

| قالب | فصل | پیچیدگی | سرویس‌ها | نوع |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | فصل 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | خارجی |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | فصل 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| خارجی |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | فصل 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | خارجی |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | فصل 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | خارجی |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | فصل 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | خارجی |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | فصل 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | خارجی |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | فصل 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **محلی** |

### ویژه: سناریوهای کامل آموزشی
**قالب‌های برنامه آماده تولید که به فصل‌های آموزشی نگاشته شده‌اند**

| قالب | فصل آموزشی | پیچیدگی | یادگیری کلیدی |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | فصل 2 | ⭐ | الگوهای پایه استقرار AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | فصل 2 | ⭐⭐ | پیاده‌سازی RAG با Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | فصل 4 | ⭐⭐ | یکپارچه‌سازی Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | فصل 5 | ⭐⭐⭐ | چارچوب عامل و فراخوانی توابع |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | فصل 8 | ⭐⭐⭐ | ارکستراسیون AI سازمانی |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | فصل 5 | ⭐⭐⭐⭐ | معماری چندعامل با عامل‌های مشتری و موجودی |

### یادگیری با نوع مثال

> **📌 مثال‌های محلی در مقابل خارجی:**  
> **مثال‌های محلی** (در این مخزن) = آماده استفاده فوری  
> **مثال‌های خارجی** (نمونه‌های Azure) = از مخزن‌های پیوندی clone کنید

#### مثال‌های محلی (آماده استفاده)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - پیاده‌سازی کامل آماده تولید با قالب‌های ARM
  - معماری چندعامل (عامل‌های مشتری + موجودی)
  - نظارت و ارزیابی جامع
  - استقرار با یک کلیک از طریق قالب ARM

#### مثال‌های محلی - برنامه‌های کانتینری (فصل‌های 2-5)
**مثال‌های جامع استقرار کانتینر در این مخزن:**
- [**Container App Examples**](examples/container-app/README.md) - راهنمای کامل برای استقرارهای کانتینری
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - API REST پایه با مقیاس به صفر
  - [Microservices Architecture](../../examples/container-app/microservices) - استقرار چندسرویس آماده تولید
  - الگوهای شروع سریع، تولید و پیشرفته
  - راهنمای نظارت، امنیت و بهینه‌سازی هزینه

#### مثال‌های خارجی - برنامه‌های ساده (فصل‌های 1-2)
**برای شروع این مخزن‌های نمونه Azure را clone کنید:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - الگوهای استقرار پایه
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - استقرار محتوای ایستا
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - استقرار REST API

#### مثال‌های خارجی - یکپارچه‌سازی پایگاه‌داده (فصل‌های 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - الگوهای اتصال به پایگاه‌داده
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - گردش‌کار داده بدون سرور

#### مثال‌های خارجی - الگوهای پیشرفته (فصل‌های 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - معماری‌های چندسرویس
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - پردازش پس‌زمینه  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - الگوهای ML آماده تولید

### مجموعه قالب‌های خارجی
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - مجموعه انتخاب‌شده‌ای از قالب‌های رسمی و جامعه
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - مستندات قالب در Microsoft Learn
- [**Examples Directory**](examples/README.md) - مثال‌های محلی آموزشی با توضیحات مفصل

---

## 📚 منابع و مراجع آموزشی

### مراجع سریع
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - دستورات اساسی azd سازماندهی‌شده بر اساس فصل
- [**Glossary**](resources/glossary.md) - اصطلاحات Azure و azd  
- [**FAQ**](resources/faq.md) - پرسش‌های متداول سازماندهی‌شده بر اساس فصل آموزشی
- [**Study Guide**](resources/study-guide.md) - تمرین‌های جامع

### کارگاه‌های عملی
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - آماده‌سازی راه‌حل‌های AI شما برای استقرار با AZD (2-3 hours)
- [**Interactive Workshop**](workshop/README.md) - تمرین‌های هدایت‌شده 8 ماژوله با MkDocs و GitHub Codespaces
  - پیروی می‌کند از: مقدمه → انتخاب → اعتبارسنجی → تحلیل ساختار → پیکربندی → سفارشی‌سازی → پاکسازی → جمع‌بندی

### منابع آموزشی خارجی
- [مستندات Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [مرکز معماری Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [محاسبه‌گر قیمت Azure](https://azure.microsoft.com/pricing/calculator/)
- [وضعیت Azure](https://status.azure.com/)

### مهارت‌های عامل‌های هوش مصنوعی برای ویرایشگر شما
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 مهارت عامل باز برای Azure AI، Foundry، استقرار، تشخیص اشکال، بهینه‌سازی هزینه و بیشتر. آن‌ها را در GitHub Copilot، Cursor، Claude Code، یا هر عامل پشتیبانی‌شده نصب کنید:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 راهنمای سریع عیب‌یابی

**مسائل رایجی که مبتدیان با آن مواجه می‌شوند و راه‌حل‌های فوری:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# ابتدا AZD را نصب کنید
# ویندوز (PowerShell):
winget install microsoft.azd

# مک‌اواس:
brew tap azure/azd && brew install azd

# لینوکس:
curl -fsSL https://aka.ms/install-azd.sh | bash

# نصب را تأیید کنید
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# فهرست اشتراک‌های موجود
az account list --output table

# تنظیم اشتراک پیش‌فرض
az account set --subscription "<subscription-id-or-name>"

# تنظیم برای محیط AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# تأیید
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# منطقهٔ دیگری در Azure را امتحان کنید
azd env set AZURE_LOCATION "westus2"
azd up

# یا در محیط توسعه از SKUهای کوچک‌تر استفاده کنید
# فایل infra/main.parameters.json را ویرایش کنید:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# گزینه 1: پاک‌سازی و تلاش مجدد
azd down --force --purge
azd up

# گزینه 2: فقط اصلاح زیرساخت
azd provision

# گزینه 3: بررسی وضعیت دقیق
azd show

# گزینه 4: بررسی لاگ‌ها در Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# احراز هویت مجدد
az logout
az login

azd auth logout
azd auth login

# تأیید احراز هویت
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD نام‌های یکتا تولید می‌کند، اما در صورت تداخل:
azd down --force --purge

# سپس با یک محیط تازه مجدداً تلاش کنید
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ طولانی شدن زمان استقرار قالب</strong></summary>

**زمان انتظار معمول:**
- برنامه وب ساده: 5-10 دقیقه
- برنامه با پایگاه‌داده: 10-15 دقیقه
- برنامه‌های هوش مصنوعی: 15-25 دقیقه (راه‌اندازی OpenAI کند است)

```bash
# پیشرفت را بررسی کنید
azd show

# اگر برای بیش از ۳۰ دقیقه گیر کرده‌اید، پورتال Azure را بررسی کنید:
azd monitor
# به دنبال استقرارهای ناموفق بگردید
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# نقش آژور خود را بررسی کنید
az role assignment list --assignee $(az account show --query user.name -o tsv)

# شما حداقل به نقش «Contributor» نیاز دارید
# از ادمین آژور خود بخواهید تا اعطا کند:
# - نقش «Contributor» (برای منابع)
# - نقش «User Access Administrator» (برای تخصیص نقش‌ها)
```
</details>

<details>
<summary><strong>❌ پیدا نشدن آدرس URL برنامه مستقر شده</strong></summary>

```bash
# نمایش همه نقاط انتهایی سرویس‌ها
azd show

# یا پورتال Azure را باز کنید
azd monitor

# سرویس مشخص را بررسی کنید
azd env get-values
# به دنبال متغیرهای *_URL بگردید
```
</details>

### 📚 منابع کامل عیب‌یابی

- **راهنمای مسائل رایج:** [راه‌حل‌های دقیق](docs/chapter-07-troubleshooting/common-issues.md)
- **مسائل مرتبط با هوش مصنوعی:** [عیب‌یابی AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **راهنمای اشکال‌زدایی:** [اشکال‌زدایی گام‌به‌گام](docs/chapter-07-troubleshooting/debugging.md)
- **دریافت کمک:** [دی‌سکورد Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 اتمام دوره و گواهی‌نامه

### پیگیری پیشرفت
پیشرفت یادگیری خود را در هر فصل دنبال کنید:

- [ ] **فصل 1**: مبانی و شروع سریع ✅
- [ ] **فصل 2**: توسعه مبتنی بر هوش مصنوعی ✅  
- [ ] **فصل 3**: پیکربندی و احراز هویت ✅
- [ ] **فصل 4**: زیرساخت به‌عنوان کد و استقرار ✅
- [ ] **فصل 5**: راه‌حل‌های هوش مصنوعی چندعاملی ✅
- [ ] **فصل 6**: اعتبارسنجی و برنامه‌ریزی پیش از استقرار ✅
- [ ] **فصل 7**: عیب‌یابی و اشکال‌زدایی ✅
- [ ] **فصل 8**: الگوهای تولید و سازمانی ✅

### تأیید یادگیری
پس از تکمیل هر فصل، دانش خود را با موارد زیر تأیید کنید:
1. **تمرین عملی**: تکمیل استقرار عملی فصل
2. **بررسی دانش**: مرور بخش پرسش‌های پرتکرار برای فصل شما
3. **بحث جامعه**: به اشتراک گذاشتن تجربیات خود در دی‌سکورد Azure
4. **فصل بعدی**: رفتن به سطح پیچیدگی بعدی

### مزایای اتمام دوره
پس از اتمام تمام فصل‌ها، شما خواهید داشت:
- **تجربه تولید**: استقرار برنامه‌های واقعی هوش مصنوعی در Azure
- **مهارت‌های حرفه‌ای**: قابلیت‌های استقرار آماده برای سازمان  
- **شناخت جامعه**: عضو فعال جامعه توسعه‌دهندگان Azure
- **پیشرفت شغلی**: مهارت‌های پرتقاضای استقرار AZD و هوش مصنوعی

---

## 🤝 جامعه و پشتیبانی

### دریافت کمک و پشتیبانی
- **مسائل فنی**: [گزارش اشکالات و درخواست ویژگی‌ها](https://github.com/microsoft/azd-for-beginners/issues)
- **سؤالات یادگیری**: [جامعه دی‌سکورد Microsoft Azure](https://discord.gg/microsoft-azure) and [![دی‌سکورد Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **کمک‌های مخصوص هوش مصنوعی**: Join the [![دی‌سکورد Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **مستندات**: [مستندات رسمی Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### دیدگاه‌های جامعه از دی‌سکورد Microsoft Foundry

**نتایج نظرسنجی اخیر از کانال #Azure:**
- **45%** از توسعه‌دهندگان می‌خواهند از AZD برای بارکاری‌های AI استفاده کنند
- **چالش‌های اصلی**: استقرار چندسرویسی، مدیریت اعتبارنامه‌ها، آمادگی برای تولید  
- **بیشترین درخواست‌ها**: قالب‌های مخصوص AI، راهنماهای عیب‌یابی، بهترین شیوه‌ها

**به جامعه ما بپیوندید تا:**
- تجربیات AZD + AI خود را به اشتراک بگذارید و کمک دریافت کنید
- دسترسی به پیش‌نمایش‌های اولیه قالب‌های جدید AI
- مشارکت در بهترین شیوه‌های استقرار AI
- تأثیرگذاری بر توسعه ویژگی‌های آینده AI + AZD

### مشارکت در دوره
از مشارکت‌ها استقبال می‌کنیم! لطفاً راهنمای [مشارکت](CONTRIBUTING.md) را برای جزئیات مطالعه کنید:
- **بهبود محتوا**: بهبود فصل‌ها و مثال‌های موجود
- **مثال‌های جدید**: افزودن سناریوها و قالب‌های دنیای واقعی  
- **ترجمه**: کمک به نگهداری پشتیبانی چندزبانه
- **گزارش اشکال**: بهبود دقت و وضوح
- **استانداردهای جامعه**: پیروی از دستورالعمل‌های جامع جامعه ما

---

## 📄 اطلاعات دوره

### مجوز
این پروژه تحت مجوز MIT است - برای جزئیات فایل [LICENSE](../../LICENSE) را ببینید.

### منابع آموزشی مرتبط مایکروسافت

تیم ما دوره‌های آموزشی جامع دیگری تولید می‌کند:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j برای مبتدیان](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js برای مبتدیان](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain برای مبتدیان](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / عامل‌ها
[![AZD برای مبتدیان](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI برای مبتدیان](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP برای مبتدیان](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![عامل‌های AI برای مبتدیان](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### مجموعه هوش مصنوعی مولد
[![هوش مصنوعی مولد برای مبتدیان](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![هوش مصنوعی مولد (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![هوش مصنوعی مولد (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![هوش مصنوعی مولد (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### یادگیری پایه‌ای
[![یادگیری ماشین برای مبتدیان](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![علم داده برای مبتدیان](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![هوش مصنوعی برای مبتدیان](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![امنیت سایبری برای مبتدیان](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![توسعه وب برای مبتدیان](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT برای مبتدیان](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![توسعه XR برای مبتدیان](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### سری Copilot
[![کوپایلوت برای برنامه‌نویسی جفتی با هوش مصنوعی](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![کوپایلوت برای C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![ماجراجویی کوپایلوت](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ ناوبری دوره

**🚀 آماده برای شروع یادگیری؟**

**مبتدی‌ها**: با [فصل 1: مبانی و شروع سریع](#-chapter-1-foundation--quick-start) شروع کنید  
**توسعه‌دهندگان هوش مصنوعی**: برو به [فصل 2: توسعه‌محور هوش مصنوعی](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**توسعه‌دهندگان با تجربه**: شروع کنید با [فصل 3: پیکربندی و احراز هویت](#️-chapter-3-configuration--authentication)

**گام‌های بعدی**: [شروع فصل 1 - مبانی AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
این سند با استفاده از سرویس ترجمهٔ هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطاها یا نادرستی‌هایی باشند. نسخهٔ اصلی سند به زبان مادری آن باید به‌عنوان مرجع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمهٔ حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوءتفاهم یا برداشت نادرستی که از استفاده از این ترجمه ناشی شود، مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->