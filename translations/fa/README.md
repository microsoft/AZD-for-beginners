# AZD For Beginners: A Structured Learning Journey

![AZD برای مبتدیان](../../translated_images/fa/azdbeginners.5527441dd9f74068.webp) 

[![مشاهِد‌کنندگان GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![انشعابات GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![ستاره‌های GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord آژور](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Discord Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### ترجمه‌های خودکار (همیشه به‌روز)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[عربی](../ar/README.md) | [بنگالی](../bn/README.md) | [بلغاری](../bg/README.md) | [برمه‌ای (میانمار)](../my/README.md) | [چینی (ساده‌شده)](../zh-CN/README.md) | [چینی (سنتی، هنگ‌کنگ)](../zh-HK/README.md) | [چینی (سنتی، ماکائو)](../zh-MO/README.md) | [چینی (سنتی، تایوان)](../zh-TW/README.md) | [کرواتی](../hr/README.md) | [چکی](../cs/README.md) | [دانمارکی](../da/README.md) | [هلندی](../nl/README.md) | [استونیایی](../et/README.md) | [فنلاندی](../fi/README.md) | [فرانسوی](../fr/README.md) | [آلمانی](../de/README.md) | [یونانی](../el/README.md) | [عبری](../he/README.md) | [هندی](../hi/README.md) | [مجارستانی](../hu/README.md) | [اندونزیایی](../id/README.md) | [ایتالیایی](../it/README.md) | [ژاپنی](../ja/README.md) | [کانادا (Kannada)](../kn/README.md) | [کره‌ای](../ko/README.md) | [لیتوانیایی](../lt/README.md) | [مالایی](../ms/README.md) | [مالایالام](../ml/README.md) | [مراتی](../mr/README.md) | [نپالی](../ne/README.md) | [پیدگین نیجریه‌ای](../pcm/README.md) | [نروژی](../no/README.md) | [فارسی (Farsi)](./README.md) | [لهستانی](../pl/README.md) | [پرتغالی (برزیل)](../pt-BR/README.md) | [پرتغالی (پرتغال)](../pt-PT/README.md) | [پنجابی (گورمُخی)](../pa/README.md) | [رومانیایی](../ro/README.md) | [روسی](../ru/README.md) | [صربی (سیریلیک)](../sr/README.md) | [اسلواکیایی](../sk/README.md) | [اسلوونیایی](../sl/README.md) | [اسپانیایی](../es/README.md) | [سواحیلی](../sw/README.md) | [سوئدی](../sv/README.md) | [تگالوگ (فیلیپینی)](../tl/README.md) | [تامیلی](../ta/README.md) | [تلوگو](../te/README.md) | [تایلندی](../th/README.md) | [ترکی](../tr/README.md) | [اوکراینی](../uk/README.md) | [اردو](../ur/README.md) | [ویتنامی](../vi/README.md)

> **ترجیح می‌دهید به‌صورت محلی کلون کنید؟**
>
> این مخزن شامل بیش از 50 ترجمه‌ به زبان‌های مختلف است که اندازه دانلود را به‌طرز قابل‌توجهی افزایش می‌دهد. برای کلون کردن بدون ترجمه‌ها، از sparse checkout استفاده کنید:
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
> این به شما همه چیز مورد نیاز برای تکمیل دوره را با دانلودی بسیار سریع‌تر می‌دهد.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 چه چیز جدیدی امروز در azd وجود دارد

رابط خط فرمان توسعه‌دهندهٔ Azure فراتر از برنامه‌های وب و API‌های سنتی رشد کرده است. امروز، azd ابزار واحد برای استقرار هر برنامه‌ای در Azure است — از جمله برنامه‌های مبتنی بر هوش مصنوعی و عامل‌های هوشمند.

این برای شما چه معنایی دارد:

- **عامل‌های هوش مصنوعی اکنون بار کاری درجه یک در azd هستند.** می‌توانید پروژه‌های عامل هوش مصنوعی را با همان گردش کاری `azd init` → `azd up` که قبلاً می‌شناسید، مقداردهی اولیه، مستقر و مدیریت کنید.
- **ادغام Microsoft Foundry** استقرار مدل، میزبانی عوامل و پیکربندی سرویس‌های هوش مصنوعی را مستقیماً به اکوسیستم قالب‌های azd می‌آورد.
- **گردش کاری اصلی تغییر نکرده است.** چه یک برنامه یادداشت ساده، یک میکروسرویس یا یک راه‌حل چندعاملهٔ هوش مصنوعی را مستقر کنید، دستورات یکسان هستند.

اگر قبلاً از azd استفاده کرده‌اید، پشتیبانی از هوش مصنوعی یک توسعهٔ طبیعی است — نه ابزار جداگانه یا مسیر پیشرفته. اگر تازه شروع می‌کنید، یک گردش کاری را یاد می‌گیرید که برای همه چیز کاربرد دارد.

---

## 🚀 azd چیست؟

**Azure Developer CLI (azd)** یک ابزار خط فرمان دوستانه برای توسعه‌دهنده است که ساده می‌کند استقرار برنامه‌ها در Azure را. به‌جای ساخت و اتصال دستی ده‌ها منبع Azure، می‌توانید کل برنامه‌ها را با یک فرمان مستقر کنید.

### جادوی `azd up`

```bash
# این دستور واحد همه کارها را انجام می‌دهد:
# ✅ تمام منابع آژور را ایجاد می‌کند
# ✅ شبکه‌بندی و امنیت را پیکربندی می‌کند
# ✅ کد برنامه شما را می‌سازد
# ✅ روی آژور مستقر می‌کند
# ✅ یک URL کاری در اختیارتان می‌گذارد
azd up
```

**همین بود!** نیازی به کلیک در Azure Portal نیست، نیازی به یادگیری قالب‌های ARM پیچیده یا پیکربندی دستی نیست — فقط برنامه‌هایی که روی Azure کار می‌کنند.

---

## ❓ تفاوت Azure Developer CLI و Azure CLI چیست؟

این متداول‌ترین سوالی است که مبتدیان می‌پرسند. پاسخ ساده در اینجا است:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Purpose** | مدیریت منابع جداگانهٔ Azure | استقرار برنامه‌های کامل |
| **Mindset** | تمرکز بر زیرساخت | تمرکز بر برنامه |
| **Example** | `az webapp create --name myapp...` | `azd up` |
| **Learning Curve** | باید خدمات Azure را بدانید | فقط برنامه‌تان را بدانید |
| **Best For** | DevOps، زیرساخت | توسعه‌دهندگان، نمونه‌سازی سریع |

### تشبیه ساده

- **Azure CLI** مثل داشتن تمام ابزارهای لازم برای ساختن یک خانه است — چکش، اره، میخ‌ها. می‌توانید هر چیزی بسازید، اما باید ساختمان‌سازی را بلد باشید.
- **Azure Developer CLI** مثل استخدام یک پیمانکار است — شما می‌گویید چه می‌خواهید و آن‌ها ساخت را انجام می‌دهند.

### چه زمانی از هرکدام استفاده کنیم

| Scenario | Use This |
|----------|----------|
| "می‌خواهم برنامهٔ وبم را سریعاً مستقر کنم" | `azd up` |
| "فقط نیاز دارم یک حساب ذخیره‌سازی بسازم" | `az storage account create` |
| "در حال ساختن یک برنامهٔ کامل هوش مصنوعی هستم" | `azd init --template azure-search-openai-demo` |
| "نیاز دارم یک منبع خاص Azure را دیباگ کنم" | `az resource show` |
| "می‌خواهم در چند دقیقه استقرار آمادهٔ تولید داشته باشم" | `azd up --environment production` |

### آن‌ها با هم کار می‌کنند!

AZD از Azure CLI در لایهٔ زیرین استفاده می‌کند. می‌توانید هر دو را به‌کار بگیرید:
```bash
# برنامه خود را با AZD مستقر کنید
azd up

# سپس منابع خاص را با Azure CLI بهینه کنید
az webapp config set --name myapp --always-on true
```

---

## 🌟 قالب‌ها را در Awesome AZD پیدا کنید

از صفر شروع نکنید! **Awesome AZD** مجموعهٔ جامعه از قالب‌های آمادهٔ استقرار است:

| Resource | Description |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | مرور بیش از 200 قالب با امکان استقرار با یک کلیک |
| 🔗 [**ارسال یک قالب**](https://github.com/Azure/awesome-azd/issues) | قالب خود را به جامعه ارسال کنید |
| 🔗 [**مخزن GitHub**](https://github.com/Azure/awesome-azd) | ستاره بدهید و منبع را بررسی کنید |

### قالب‌های محبوب هوش مصنوعی از Awesome AZD

```bash
# گفتگو RAG با مدل‌های Microsoft Foundry + جستجوی هوش مصنوعی
azd init --template azure-search-openai-demo

# برنامه کاربردی سریع گفتگوی هوش مصنوعی
azd init --template openai-chat-app-quickstart

# عوامل هوش مصنوعی با عوامل Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 شروع کار در 3 گام

### گام 1: نصب AZD (2 دقیقه)

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

### گام 2: ورود به Azure

```bash
azd auth login
```

### گام 3: استقرار اولین برنامهٔ خود

```bash
# مقداردهی اولیه از یک قالب
azd init --template todo-nodejs-mongo

# استقرار در آزور (همه چیز را ایجاد می‌کند!)
azd up
```

**🎉 همین بود!** برنامهٔ شما اکنون روی Azure در دسترس است.

### پاک‌سازی (فراموش نکنید!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 چگونه از این دوره استفاده کنیم

این دوره برای یادگیری تدریجی طراحی شده است — از جایی شروع کنید که راحت‌اید و به‌تدریج پیش بروید:

| Your Experience | Start Here |
|-----------------|------------|
| **کاملاً تازه‌کار با Azure** | [فصل 1: پایه](#-chapter-1-foundation--quick-start) |
| **Azure را می‌شناسید، با AZD آشنا نیستید** | [فصل 1: پایه](#-chapter-1-foundation--quick-start) |
| **می‌خواهید برنامه‌های هوش مصنوعی مستقر کنید** | [فصل 2: توسعهٔ مبتنی بر هوش مصنوعی](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **می‌خواهید تمرین عملی داشته باشید** | [🎓 کارگاه تعاملی](workshop/README.md) - آزمایشگاه هدایت‌شدهٔ 3-4 ساعت |
| **نیاز به الگوهای تولید دارید** | [فصل 8: تولید و الگوهای سازمانی](#-chapter-8-production--enterprise-patterns) |

### تنظیم سریع

1. **این مخزن را فورک کنید**: [![انشعابات GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **کلون کنید**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **کمک بگیرید**: [جامعهٔ Discord آژور](https://discord.com/invite/ByRwuEEgH4)

> **ترجیح می‌دهید به‌صورت محلی کلون کنید؟**

> این مخزن شامل بیش از 50 ترجمه به زبان‌های مختلف است که اندازهٔ دانلود را به‌طرز قابل‌توجهی افزایش می‌دهد. برای کلون بدون ترجمه‌ها، از sparse checkout استفاده کنید:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> این به شما همهٔ چیز مورد نیاز برای تکمیل دوره را با دانلودی بسیار سریع‌تر می‌دهد.


## مروری بر دوره

با فصل‌های ساختاریافته که برای یادگیری تدریجی طراحی شده‌اند، Azure Developer CLI (azd) را استاد شوید. **تمرکز ویژه بر استقرار برنامه‌های هوش مصنوعی با ادغام Microsoft Foundry.**

### چرا این دوره برای توسعه‌دهندگان مدرن ضروری است

بر اساس بینش‌های جامعهٔ Discord Microsoft Foundry، **45% از توسعه‌دهندگان می‌خواهند از AZD برای بارهای کاری هوش مصنوعی استفاده کنند** اما با چالش‌هایی روبه‌رو می‌شوند مانند:
- معماری‌های پیچیدهٔ هوش مصنوعی چندخدمتی
- بهترین روش‌های استقرار هوش مصنوعی در تولید  
- ادغام و پیکربندی سرویس‌های هوش مصنوعی Azure
- بهینه‌سازی هزینه برای بارهای کاری هوش مصنوعی
- رفع اشکال مسائل مخصوص استقرار هوش مصنوعی

### اهداف یادگیری

با تکمیل این دورهٔ ساختاریافته، شما:
- **اصول AZD را تسلط خواهید یافت**: مفاهیم اصلی، نصب و پیکربندی
- **برنامه‌های هوش مصنوعی را مستقر خواهید کرد**: استفاده از AZD با سرویس‌های Microsoft Foundry
- **زیرساخت را به‌عنوان کد پیاده‌سازی خواهید کرد**: مدیریت منابع Azure با قالب‌های Bicep
- **استقرارها را رفع اشکال خواهید کرد**: حل مشکلات رایج و دیباگ کردن خطاها
- **برای تولید بهینه‌سازی خواهید کرد**: امنیت، مقیاس، مانیتورینگ و مدیریت هزینه
- **راه‌حل‌های چندعامله خواهید ساخت**: استقرار معماری‌های پیچیدهٔ هوش مصنوعی

## 🗺️ نقشهٔ دوره: ناوبری سریع بر اساس فصل

هر فصل یک README اختصاصی با اهداف یادگیری، شروع سریع و تمرین‌ها دارد:

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[فصل 1: پایه](docs/chapter-01-foundation/README.md)** | شروع کار | [مبانی AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [نصب](docs/chapter-01-foundation/installation.md) &#124; [پروژهٔ اول](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[فصل ۲: توسعه هوش مصنوعی](docs/chapter-02-ai-development/README.md)** | اپلیکیشن‌های محور هوش مصنوعی | [ادغام Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [عامل‌های هوش مصنوعی](docs/chapter-02-ai-development/agents.md) &#124; [استقرار مدل](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [کارگاه](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ساعت | ⭐⭐ |
| **[فصل ۳: پیکربندی](docs/chapter-03-configuration/README.md)** | احراز هویت و امنیت | [پیکربندی](docs/chapter-03-configuration/configuration.md) &#124; [احراز هویت و امنیت](docs/chapter-03-configuration/authsecurity.md) | 45-60 دقیقه | ⭐⭐ |
| **[فصل ۴: زیرساخت](docs/chapter-04-infrastructure/README.md)** | زیرساخت به‌عنوان‌کد و استقرار | [راهنمای استقرار](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [تأمین منابع](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ساعت | ⭐⭐⭐ |
| **[فصل ۵: چندعامله](docs/chapter-05-multi-agent/README.md)** | راه‌حل‌های عامل هوش مصنوعی | [سناریوی خرده‌فروشی](examples/retail-scenario.md) &#124; [الگوهای هماهنگی](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ساعت | ⭐⭐⭐⭐ |
| **[فصل ۶: پیش‌از استقرار](docs/chapter-06-pre-deployment/README.md)** | برنامه‌ریزی و اعتبارسنجی | [بررسی‌های پیش از استقرار](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [برنامه‌ریزی ظرفیت](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [انتخاب SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 ساعت | ⭐⭐ |
| **[فصل ۷: عیب‌یابی](docs/chapter-07-troubleshooting/README.md)** | اشکال‌زدایی و رفع | [مشکلات رایج](docs/chapter-07-troubleshooting/common-issues.md) &#124; [اشکال‌زدایی](docs/chapter-07-troubleshooting/debugging.md) &#124; [مشکلات هوش مصنوعی](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ساعت | ⭐⭐ |
| **[فصل ۸: تولید](docs/chapter-08-production/README.md)** | الگوهای سازمانی | [عملیات تولید](docs/chapter-08-production/production-ai-practices.md) | 2-3 ساعت | ⭐⭐⭐⭐ |
| **[🎓 کارگاه](workshop/README.md)** | آزمایشگاه عملی | [مقدمه](workshop/docs/instructions/0-Introduction.md) &#124; [انتخاب](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [اعتبارسنجی](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [تجزیه و تحلیل](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [پیکربندی](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [سفارشی‌سازی](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [جمع‌آوری زیرساخت](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [جمع‌بندی](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ساعت | ⭐⭐ |

**کل مدت دوره:** ~10-14 hours | **پیشرفت مهارتی:** Beginner → Production-Ready

---

## 📚 فصل‌های یادگیری

*مسیر یادگیری خود را بر اساس سطح تجربه و اهداف انتخاب کنید*

### 🚀 فصل ۱: پایه و شروع سریع
**پیش‌نیازها**: اشتراک Azure، آشنایی پایه با خط فرمان  
**مدت زمان**: 30-45 دقیقه  
**پیچیدگی**: ⭐

#### آنچه خواهید آموخت
- درک اصول Azure Developer CLI
- نصب AZD روی پلتفرم شما
- اولین استقرار موفق شما

#### منابع یادگیری
- **🎯 با اینجا شروع کنید**: [Azure Developer CLI چیست؟](#what-is-azure-developer-cli)
- **📖 نظریه**: [مبانی AZD](docs/chapter-01-foundation/azd-basics.md) - مفاهیم و واژگان پایه
- **⚙️ راه‌اندازی**: [نصب و راه‌اندازی](docs/chapter-01-foundation/installation.md) - راهنماهای مخصوص هر پلتفرم
- **🛠️ عملی**: [اولین پروژه شما](docs/chapter-01-foundation/first-project.md) - راهنمای قدم‌به‌قدم
- **📋 مرجع سریع**: [راهنمای سریع دستورات](resources/cheat-sheet.md)

#### تمرین‌های عملی
```bash
# بررسی سریع نصب
azd version

# اولین برنامهٔ خود را مستقر کنید
azd init --template todo-nodejs-mongo
azd up
```

**💡 نتیجه فصل**: استقرار موفق یک برنامه وب ساده در Azure با استفاده از AZD

**✅ اعتبارسنجی موفقیت:**
```bash
# پس از اتمام فصل ۱، باید بتوانید:
azd version              # نسخهٔ نصب‌شده را نشان می‌دهد
azd init --template todo-nodejs-mongo  # پروژه را مقداردهی اولیه می‌کند
azd up                  # در Azure مستقر می‌کند
azd show                # آدرس URL برنامهٔ در حال اجرا را نمایش می‌دهد
# برنامه در مرورگر باز می‌شود و کار می‌کند
azd down --force --purge  # منابع را پاک‌سازی می‌کند
```

**📊 زمان مورد نیاز:** 30-45 دقیقه  
**📈 سطح مهارت پس از:** می‌تواند برنامه‌های پایه را به صورت مستقل مستقر کند
**📈 سطح مهارت پس از:** می‌تواند برنامه‌های پایه را به صورت مستقل مستقر کند

---

### 🤖 فصل ۲: توسعه مبتنی بر هوش مصنوعی (توصیه‌شده برای توسعه‌دهندگان هوش مصنوعی)
**پیش‌نیازها**: تکمیل فصل ۱  
**مدت زمان**: 1-2 ساعت  
**پیچیدگی**: ⭐⭐

#### آنچه خواهید آموخت
- ادغام Microsoft Foundry با AZD
- استقرار اپلیکیشن‌های مبتنی بر هوش مصنوعی
- درک پیکربندی‌های سرویس‌های هوش مصنوعی

#### منابع یادگیری
- **🎯 با اینجا شروع کنید**: [ادغام Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 عامل‌های هوش مصنوعی**: [راهنمای عامل‌های هوش مصنوعی](docs/chapter-02-ai-development/agents.md) - استقرار عامل‌های هوشمند با AZD
- **📖 الگوها**: [استقرار مدل‌های هوش مصنوعی](docs/chapter-02-ai-development/ai-model-deployment.md) - استقرار و مدیریت مدل‌های هوش مصنوعی
- **🛠️ کارگاه**: [کارگاه AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - آماده‌سازی راه‌حل‌های هوش مصنوعی برای AZD
- **🎥 راهنمای تعاملی**: [مواد کارگاه](workshop/README.md) - یادگیری مبتنی بر مرورگر با MkDocs * DevContainer Environment
- **📋 قالب‌ها**: [الگوهای Microsoft Foundry](#منابع-کارگاه)
- **📝 نمونه‌ها**: [نمونه‌های استقرار AZD](examples/README.md)

#### تمرین‌های عملی
```bash
# اولین برنامه‌ی هوش مصنوعی خود را مستقر کنید
azd init --template azure-search-openai-demo
azd up

# قالب‌های هوش مصنوعی بیشتری را امتحان کنید
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 نتیجه فصل**: استقرار و پیکربندی یک اپلیکیشن چت مبتنی بر هوش مصنوعی با قابلیت‌های RAG

**✅ اعتبارسنجی موفقیت:**
```bash
# پس از فصل ۲، شما باید قادر باشید:
azd init --template azure-search-openai-demo
azd up
# رابط چت هوش مصنوعی را آزمایش کنید
# سؤال بپرسید و پاسخ‌های تولید شده توسط هوش مصنوعی را همراه با منابع دریافت کنید
# بررسی کنید که یکپارچه‌سازی جستجو کار می‌کند
azd monitor  # بررسی کنید که Application Insights داده‌های تله‌متری را نمایش می‌دهد
azd down --force --purge
```

**📊 زمان مورد نیاز:** 1-2 ساعت  
**📈 سطح مهارت پس از:** قادر به استقرار و پیکربندی اپلیکیشن‌های هوش مصنوعی آماده‌ی تولید  
**💰 آگاهی از هزینه:** درک هزینه‌های توسعه حدود $80-150/ماه، هزینه‌های تولید $300-3500/ماه

#### 💰 ملاحظات هزینه برای استقرارهای هوش مصنوعی

**محیط توسعه (تخمینی $80-150/ماه):**
- Microsoft Foundry Models (پرداخت به‌ازای مصرف): $0-50/ماه (براساس استفاده از توکن)
- AI Search (نسخه پایه): $75/ماه
- Container Apps (مصرفی): $0-20/ماه
- ذخیره‌سازی (استاندارد): $1-5/ماه

**محیط تولید (تخمینی $300-3,500+/ماه):**
- Microsoft Foundry Models (PTU برای عملکرد یکنواخت): $3,000+/ماه OR Pay-as-go with high volume
- AI Search (نسخه استاندارد): $250/ماه
- Container Apps (اختصاصی): $50-100/ماه
- Application Insights: $5-50/ماه
- ذخیره‌سازی (پریمیوم): $10-50/ماه

**💡 نکات بهینه‌سازی هزینه:**
- از **سطح رایگان** مدل‌های Microsoft Foundry برای یادگیری استفاده کنید (Azure OpenAI شامل 50,000 توکن/ماه)
- اجرای `azd down` برای آزادسازی منابع وقتی فعالانه در حال توسعه نیستید
- با صورتحساب مبتنی‌بر مصرف شروع کنید، تنها برای تولید به PTU ارتقا دهید
- از `azd provision --preview` برای برآورد هزینه‌ها پیش از استقرار استفاده کنید
- مقیاس‌بندی خودکار را فعال کنید: فقط برای استفاده واقعی پرداخت کنید

**نظارت بر هزینه:**
```bash
# هزینه‌های ماهانهٔ تخمینی را بررسی کنید
azd provision --preview

# هزینه‌های واقعی را در پورتال Azure پایش کنید
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ فصل ۳: پیکربندی و احراز هویت
**پیش‌نیازها**: تکمیل فصل ۱  
**مدت زمان**: 45-60 دقیقه  
**پیچیدگی**: ⭐⭐

#### آنچه خواهید آموخت
- پیکربندی و مدیریت محیط‌ها
- بهترین شیوه‌های احراز هویت و امنیت
- نام‌گذاری و سازمان‌دهی منابع

#### منابع یادگیری
- **📖 پیکربندی**: [راهنمای پیکربندی](docs/chapter-03-configuration/configuration.md) - راه‌اندازی محیط
- **🔐 امنیت**: [الگوهای احراز هویت و هویت مدیریت‌شده](docs/chapter-03-configuration/authsecurity.md) - الگوهای احراز هویت
- **📝 نمونه‌ها**: [نمونه برنامه پایگاه‌داده](examples/database-app/README.md) - نمونه‌های پایگاه‌داده AZD

#### تمرین‌های عملی
- پیکربندی چندین محیط (dev, staging, prod)
- راه‌اندازی احراز هویت با هویت مدیریت‌شده
- اجرای پیکربندی‌های مخصوص هر محیط

**💡 نتیجه فصل**: مدیریت چندین محیط با احراز هویت و امنیت مناسب

---

### 🏗️ فصل ۴: زیرساخت به‌عنوان‌کد و استقرار
**پیش‌نیازها**: تکمیل فصول ۱–۳  
**مدت زمان**: 1-1.5 ساعت  
**پیچیدگی**: ⭐⭐⭐

#### آنچه خواهید آموخت
- الگوهای استقرار پیشرفته
- زیرساخت به‌عنوان‌کد با Bicep
- راهبردهای تأمین منابع

#### منابع یادگیری
- **📖 استقرار**: [راهنمای استقرار](docs/chapter-04-infrastructure/deployment-guide.md) - گردش‌کارهای کامل
- **🏗️ تأمین منابع**: [تأمین منابع](docs/chapter-04-infrastructure/provisioning.md) - مدیریت منابع Azure
- **📝 نمونه‌ها**: [نمونه اپلیکیشن کانتینری](../../examples/container-app) - استقرارهای کانتینری

#### تمرین‌های عملی
- ایجاد قالب‌های Bicep سفارشی
- استقرار برنامه‌های چندسرویسی
- اجرای راهبردهای استقرار آبی-سبز

**💡 نتیجه فصل**: استقرار برنامه‌های پیچیده چندسرویسی با استفاده از قالب‌های زیرساخت سفارشی

---

### 🎯 فصل ۵: راه‌حل‌های هوش مصنوعی چندعامله (پیشرفته)
**پیش‌نیازها**: تکمیل فصول 1–2  
**مدت زمان**: 2-3 ساعت  
**پیچیدگی**: ⭐⭐⭐⭐

#### آنچه خواهید آموخت
- الگوهای معماری چندعامله
- ارکستراسیون و هماهنگی عامل‌ها
- استقرارهای هوش مصنوعی آماده‌ی تولید

#### منابع یادگیری
- **🤖 پروژه برجسته**: [راه‌حل چندعامله خرده‌فروشی](examples/retail-scenario.md) - پیاده‌سازی کامل
- **🛠️ قالب‌های ARM**: [بسته قالب ARM](../../examples/retail-multiagent-arm-template) - استقرار با یک کلیک
- **📖 معماری**: [الگوهای هماهنگی چندعامله](docs/chapter-06-pre-deployment/coordination-patterns.md) - الگوها

#### تمرین‌های عملی
```bash
# استقرار راه‌حل کامل چندعاملی خرده‌فروشی
cd examples/retail-multiagent-arm-template
./deploy.sh

# بررسی پیکربندی‌های عامل
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 نتیجه فصل**: استقرار و مدیریت یک راه‌حل هوش مصنوعی چندعامله آماده‌ی تولید با عامل‌های مشتری و موجودی

---

### 🔍 فصل ۶: اعتبارسنجی و برنامه‌ریزی پیش از استقرار
**پیش‌نیازها**: تکمیل فصل ۴  
**مدت زمان**: 1 ساعت  
**پیچیدگی**: ⭐⭐

#### آنچه خواهید آموخت
- برنامه‌ریزی ظرفیت و اعتبارسنجی منابع
- راهبردهای انتخاب SKU
- چک‌های پیش از استقرار و خودکارسازی

#### منابع یادگیری
- **📊 برنامه‌ریزی**: [برنامه‌ریزی ظرفیت](docs/chapter-06-pre-deployment/capacity-planning.md) - اعتبارسنجی منابع
- **💰 انتخاب**: [انتخاب SKU](docs/chapter-06-pre-deployment/sku-selection.md) - گزینه‌های مقرون‌به‌صرفه
- **✅ اعتبارسنجی**: [بررسی‌های پیش از استقرار](docs/chapter-06-pre-deployment/preflight-checks.md) - اسکریپت‌های خودکار

#### تمرین‌های عملی
- اجرای اسکریپت‌های اعتبارسنجی ظرفیت
- بهینه‌سازی انتخاب SKUها برای کاهش هزینه
- اجرای بررسی‌های خودکار پیش از استقرار

**💡 نتیجه فصل**: اعتبارسنجی و بهینه‌سازی استقرارها پیش از اجرا

---

### 🚨 فصل ۷: عیب‌یابی و اشکال‌زدایی
**پیش‌نیازها**: هر فصل استقراری که تکمیل شده باشد  
**مدت زمان**: 1-1.5 ساعت  
**پیچیدگی**: ⭐⭐

#### آنچه خواهید آموخت
- رویکردهای سیستماتیک اشکال‌زدایی
- مشکلات رایج و راه‌حل‌ها
- عیب‌یابی مخصوص هوش مصنوعی

#### منابع یادگیری
- **🔧 مشکلات رایج**: [مشکلات رایج](docs/chapter-07-troubleshooting/common-issues.md) - سوالات متداول و راه‌حل‌ها
- **🕵️ اشکال‌زدایی**: [راهنمای اشکال‌زدایی](docs/chapter-07-troubleshooting/debugging.md) - استراتژی‌های گام‌به‌گام
- **🤖 مشکلات هوش مصنوعی**: [عیب‌یابی مخصوص هوش مصنوعی](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - مشکلات سرویس‌های هوش مصنوعی

#### تمرین‌های عملی
- تشخیص خطاهای استقرار
- رفع مشکلات احراز هویت
- اشکال‌زدایی اتصال سرویس‌های هوش مصنوعی

**💡 نتیجه فصل**: تشخیص و رفع مستقل مشکلات رایج استقرار

---

### 🏢 فصل ۸: تولید و الگوهای سازمانی
**پیش‌نیازها**: تکمیل فصول 1–4  
**مدت زمان**: 2-3 ساعت  
**پیچیدگی**: ⭐⭐⭐⭐

#### آنچه خواهید آموخت
- راهبردهای استقرار در محیط تولید
- الگوهای امنیت سازمانی
- نظارت و بهینه‌سازی هزینه

#### منابع یادگیری
- **🏭 تولید**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - الگوهای سازمانی
- **📝 مثال‌ها**: [Microservices Example](../../examples/microservices) - معماری‌های پیچیده
- **📊 پایش**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - پایش

#### تمرین‌های عملی
- الگوهای امنیتی سازمانی را پیاده‌سازی کنید
- پایش جامع را راه‌اندازی کنید
- با حاکمیت مناسب در محیط تولید استقرار دهید

**💡 نتیجه فصل**: استقرار برنامه‌های آماده سازمانی با تمام قابلیت‌های تولید

---

## 🎓 مرور کارگاه: تجربه یادگیری عملی

> **⚠️ وضعیت کارگاه: در حال توسعه فعال**  
> مواد کارگاه در حال توسعه و پالایش هستند. ماژول‌های اصلی عملکردی هستند، اما برخی بخش‌های پیشرفته ناقص‌اند. ما فعالانه در حال تکمیل تمام محتوا هستیم. [پیگیری پیشرفت →](workshop/README.md)

### مواد تعاملی کارگاه
**یادگیری عملی جامع با ابزارهای مبتنی بر مرورگر و تمرین‌های هدایت‌شده**

مواد کارگاه ما یک تجربه یادگیری ساختارمند و تعاملی فراهم می‌کند که مکمل برنامه درسی مبتنی بر فصل‌های بالا است. این کارگاه برای یادگیری خودآموز و جلسات هدایت‌شده توسط مربی طراحی شده است.

#### 🛠️ ویژگی‌های کارگاه
- **رابط مبتنی بر مرورگر**: کارگاه کامل مبتنی بر MkDocs با قابلیت‌های جستجو، کپی و پوسته
- **یکپارچه‌سازی GitHub Codespaces**: راه‌اندازی محیط توسعه با یک کلیک
- **مسیر یادگیری ساختارمند**: تمرین‌های هدایت‌شده در 8 ماژول (جمعاً 3-4 ساعت)
- **روش‌شناسی تدریجی**: مقدمه → انتخاب → اعتبارسنجی → تجزیه ساختار → پیکربندی → سفارشی‌سازی → پاک‌سازی → جمع‌بندی
- **محیط DevContainer تعاملی**: ابزارها و وابستگی‌های از پیش پیکربندی‌شده

#### 📚 ساختار ماژول‌های کارگاه
کارگاه از یک **روش‌شناسی تدریجی 8 ماژوله** پیروی می‌کند که شما را از کشف تا تسلط بر استقرار می‌برد:

| ماژول | موضوع | کاری که انجام خواهید داد | مدت زمان |
|--------|-------|----------------|----------|
| **0. مقدمه** | مرور کارگاه | درک اهداف یادگیری، پیش‌نیازها و ساختار کارگاه | 15 دقیقه |
| **1. انتخاب** | کشف قالب‌ها | قالب‌های AZD را بررسی و قالب AI مناسب برای سناریوی خود را انتخاب کنید | 20 دقیقه |
| **2. اعتبارسنجی** | استقرار و تأیید | قالب را با `azd up` استقرار دهید و تأیید کنید که زیرساخت کار می‌کند | 30 دقیقه |
| **3. تجزیه ساختار** | درک ساختار | از GitHub Copilot برای بررسی معماری قالب، فایل‌های Bicep و سازماندهی کد استفاده کنید | 30 دقیقه |
| **4. پیکربندی** | بررسی عمیق azure.yaml | پیکربندی `azure.yaml`، هوک‌های چرخه عمر و متغیرهای محیطی را به‌خوبی بیاموزید | 30 دقیقه |
| **5. سفارشی‌سازی** | سفارشی کنید | جستجوی AI، ردگیری، ارزیابی را فعال کرده و برای سناریوی خود سفارشی کنید | 45 دقیقه |
| **6. پاک‌سازی** | پاک‌سازی | منابع را با `azd down --purge` به‌طور ایمن حذف کنید | 15 دقیقه |
| **7. جمع‌بندی** | گام‌های بعدی | مرور دستاوردها، مفاهیم کلیدی و ادامه مسیر یادگیری | 15 دقیقه |

**جریان کارگاه:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 شروع کار با کارگاه
```bash
# گزینهٔ ۱: GitHub Codespaces (توصیه‌شده)
# در مخزن روی "Code" → "Create codespace on main" کلیک کنید

# گزینهٔ ۲: توسعهٔ محلی
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# دستورالعمل‌های راه‌اندازی در workshop/README.md را دنبال کنید
```

#### 🎯 نتایج یادگیری کارگاه
با تکمیل کارگاه، شرکت‌کنندگان قادر خواهند بود:
- **استقرار برنامه‌های هوش مصنوعی برای تولید**: استفاده از AZD همراه با سرویس‌های Microsoft Foundry
- **تسلط بر معماری‌های چندعاملی**: پیاده‌سازی راهکارهای هماهنگ عامل‌های هوش مصنوعی
- **پیاده‌سازی بهترین شیوه‌های امنیتی**: پیکربندی احراز هویت و کنترل دسترسی
- **بهینه‌سازی برای مقیاس**: طراحی استقرارهای مقرون‌به‌صرفه و با عملکرد مناسب
- **عیب‌یابی استقرارها**: حل مشکلات رایج به‌صورت مستقل

#### 📖 منابع کارگاه
- **🎥 راهنمای تعاملی**: [Workshop Materials](workshop/README.md) - محیط یادگیری مبتنی بر مرورگر
- **📋 دستورالعمل قدم‌به‌قدم ماژول‌ها**:
  - [0. مقدمه](workshop/docs/instructions/0-Introduction.md) - مرور کارگاه و اهداف
  - [1. انتخاب](workshop/docs/instructions/1-Select-AI-Template.md) - پیدا کردن و انتخاب قالب‌های AI
  - [2. اعتبارسنجی](workshop/docs/instructions/2-Validate-AI-Template.md) - استقرار و تأیید قالب‌ها
  - [3. تجزیه ساختار](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - بررسی معماری قالب
  - [4. پیکربندی](workshop/docs/instructions/4-Configure-AI-Template.md) - تسلط بر azure.yaml
  - [5. سفارشی‌سازی](workshop/docs/instructions/5-Customize-AI-Template.md) - سفارشی‌سازی برای سناریوی شما
  - [6. پاک‌سازی](workshop/docs/instructions/6-Teardown-Infrastructure.md) - پاک‌سازی منابع
  - [7. جمع‌بندی](workshop/docs/instructions/7-Wrap-up.md) - مرور و گام‌های بعدی
- **🛠️ آزمایشگاه کارگاه AI**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - تمرین‌های متمرکز بر AI
- **💡 شروع سریع**: [Workshop Setup Guide](workshop/README.md#quick-start) - پیکربندی محیط

مناسب برای: آموزش شرکتی، دوره‌های دانشگاهی، یادگیری خودآموز و بوت‌کمپ‌های توسعه‌دهندگان.

---

## 📖 بررسی عمیق: قابلیت‌های AZD

فراتر از اصول پایه، AZD ویژگی‌های قدرتمندی برای استقرار در تولید فراهم می‌کند:

- **استقرار مبتنی بر قالب‌ها** - از قالب‌های از پیش‌ساخته برای الگوهای رایج برنامه استفاده کنید
- **زیرساخت به‌عنوان کد** - مدیریت منابع Azure با استفاده از Bicep یا Terraform  
- **جریان‌های کاری یکپارچه** - به‌طور یکپارچه برنامه‌ها را تامین، مستقر و مانیتور کنید
- **مناسب توسعه‌دهنده** - بهینه‌شده برای بهره‌وری و تجربه توسعه‌دهنده

### **AZD + Microsoft Foundry: مناسب برای استقرارهای هوش مصنوعی**

**چرا AZD برای راهکارهای AI؟** AZD به چالش‌های اصلی توسعه‌دهندگان AI می‌پردازد:

- **قالب‌های آماده AI** - قالب‌های از پیش پیکربندی‌شده برای مدل‌های Microsoft Foundry، سرویس‌های شناختی و بارهای کاری ML
- **استقرارهای ایمن AI** - الگوهای امنیتی داخلی برای سرویس‌های AI، کلیدهای API و نقاط انتهایی مدل  
- **الگوهای AI برای تولید** - بهترین شیوه‌ها برای استقرار برنامه‌های AI مقیاس‌پذیر و مقرون‌به‌صرفه
- **جریان‌های کاری سرتاسری AI** - از توسعه مدل تا استقرار در تولید با مانیتورینگ مناسب
- **بهینه‌سازی هزینه** - استراتژی‌های تخصیص هوشمند منابع و مقیاس‌دهی برای بارهای کاری AI
- **یکپارچه‌سازی Microsoft Foundry** - اتصال بی‌وقفه به کاتالوگ مدل‌ها و نقاط انتهایی Microsoft Foundry

---

## 🎯 کتابخانه قالب‌ها و مثال‌ها

### ویژه: قالب‌های Microsoft Foundry
اگر دارید برنامه‌های AI را مستقر می‌کنید از اینجا شروع کنید!

> **توجه:** این قالب‌ها الگوهای مختلف AI را نشان می‌دهند. برخی از آن‌ها نمونه‌های Azure خارجی هستند، برخی دیگر پیاده‌سازی‌های محلی.

| قالب | فصل | پیچیدگی | سرویس‌ها | نوع |
|----------|---------|------------|----------|------|
| [**شروع با چت AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | فصل 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | خارجی |
| [**شروع با عامل‌های AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | فصل 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| خارجی |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | فصل 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | خارجی |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | فصل 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | خارجی |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | فصل 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | خارجی |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | فصل 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | خارجی |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | فصل 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **محلی** |

### ویژه: سناریوهای کامل یادگیری
قالب‌های آماده برای برنامه‌های تولیدی که به فصل‌های آموزشی منطبق شده‌اند

| قالب | فصل یادگیری | پیچیدگی | یادگیری کلیدی |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | فصل 2 | ⭐ | الگوهای پایه استقرار AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | فصل 2 | ⭐⭐ | پیاده‌سازی RAG با Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | فصل 4 | ⭐⭐ | یکپارچه‌سازی Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | فصل 5 | ⭐⭐⭐ | چارچوب عامل و فراخوانی توابع |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | فصل 8 | ⭐⭐⭐ | ارکستراسیون AI سازمانی |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | فصل 5 | ⭐⭐⭐⭐ | معماری چندعاملی با عامل‌های مشتری و موجودی |

### یادگیری براساس نوع مثال

> **📌 مثال‌های محلی در مقابل خارجی:**  
> **مثال‌های محلی** (در این مخزن) = آماده استفاده فوری  
> **مثال‌های خارجی** (Azure Samples) = کلون از مخازن لینک‌شده

#### مثال‌های محلی (آماده استفاده)
- [**راهکار چندعامله خرده‌فروشی**](examples/retail-scenario.md) - پیاده‌سازی کامل آماده تولید با قالب‌های ARM
  - معماری چندعاملی (عامل مشتری + عامل موجودی)
  - پایش و ارزیابی جامع
  - استقرار با یک کلیک از طریق قالب ARM

#### مثال‌های محلی - برنامه‌های کانتینری (فصل‌های 2-5)
نمونه‌های جامع استقرار کانتینری در این مخزن:
- [**نمونه‌های برنامه کانتینری**](examples/container-app/README.md) - راهنمای کامل برای استقرارهای کانتینری
  - [API ساده Flask](../../examples/container-app/simple-flask-api) - REST API پایه با قابلیت scale-to-zero
  - [معماری میکروسرویس‌ها](../../examples/container-app/microservices) - استقرار چندخدمتی آماده تولید
  - الگوهای شروع سریع، تولید و پیشرفته برای استقرار
  - راهنمایی برای پایش، امنیت و بهینه‌سازی هزینه

#### مثال‌های خارجی - برنامه‌های ساده (فصل‌های 1-2)
این مخازن Azure Samples را کلون کنید تا شروع کنید:
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - الگوهای استقرار پایه
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - استقرار محتوای ایستا
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - استقرار REST API

#### مثال‌های خارجی - یکپارچه‌سازی پایگاه‌داده (فصل‌های 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - الگوهای اتصال به پایگاه‌داده
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - جریان داده بدون‌سرور

#### مثال‌های خارجی - الگوهای پیشرفته (فصل‌های 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - معماری‌های چندخدمتی
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - پردازش پس‌زمینه  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - الگوهای ML مناسب تولید

### مجموعه‌های قالب خارجی
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - مجموعه انتخاب‌شده‌ای از قالب‌های رسمی و جامعه
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - مستندات قالب‌های Microsoft Learn
- [**Examples Directory**](examples/README.md) - مثال‌های یادگیری محلی با توضیحات مفصل

---

## 📚 منابع و مراجع یادگیری

### ارجاعات سریع
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - دستورهای ضروری azd سازمان‌یافته بر اساس فصل
- [**واژه‌نامه**](resources/glossary.md) - اصطلاحات Azure و azd  
- [**سوالات متداول**](resources/faq.md) - سوالات رایج سازمان‌یافته بر اساس فصل‌های یادگیری
- [**راهنمای مطالعه**](resources/study-guide.md) - تمرین‌های جامع

### کارگاه‌های عملی
- [**آزمایشگاه کارگاه AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - آماده‌سازی راهکارهای AI برای استقرار با AZD (2-3 ساعت)
- [**کارگاه تعاملی**](workshop/README.md) - تمرین‌های هدایت‌شده 8 ماژوله با MkDocs و GitHub Codespaces
  - پیروی می‌کند از: مقدمه → انتخاب → اعتبارسنجی → تجزیه ساختار → پیکربندی → سفارشی‌سازی → پاک‌سازی → جمع‌بندی

### منابع یادگیری خارجی
- [مستندات Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [مرکز معماری Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [محاسبه‌گر قیمت Azure](https://azure.microsoft.com/pricing/calculator/)
- [وضعیت Azure](https://status.azure.com/)

### مهارت‌های عامل هوش مصنوعی برای ویرایشگر شما
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 مهارت عامل باز برای Azure AI، Foundry، استقرار، عیب‌یابی، بهینه‌سازی هزینه و موارد دیگر. آن‌ها را در GitHub Copilot، Cursor، Claude Code یا هر عامل پشتیبانی‌شده‌ای نصب کنید:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 راهنمای سریع رفع مشکل

**مسائل رایجی که مبتدیان با آن مواجه می‌شوند و راه‌حل‌های فوری:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# ابتدا AZD را نصب کنید
# ویندوز (پاورشل):
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
<summary><strong>❌ "No subscription found" یا "Subscription not set"</strong></summary>

```bash
# نمایش اشتراک‌های موجود
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
<summary><strong>❌ "InsufficientQuota" یا "Quota exceeded"</strong></summary>

```bash
# منطقهٔ Azure دیگری را امتحان کنید
azd env set AZURE_LOCATION "westus2"
azd up

# یا در توسعه از SKUهای کوچک‌تر استفاده کنید
# فایل infra/main.parameters.json را ویرایش کنید:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" در نیمه‌راه شکست می‌خورد</strong></summary>

```bash
# گزینه ۱: پاک‌سازی و تلاش مجدد
azd down --force --purge
azd up

# گزینه ۲: فقط رفع مشکلات زیرساخت
azd provision

# گزینه ۳: بررسی وضعیت دقیق
azd show

# گزینه ۴: بررسی لاگ‌ها در Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" یا "Token expired"</strong></summary>

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
<summary><strong>❌ "Resource already exists" یا تداخل نام‌ها</strong></summary>

```bash
# AZD نام‌های یکتا تولید می‌کند، اما در صورت تداخل:
azd down --force --purge

# سپس با یک محیط تازه دوباره تلاش کنید
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ طولانی شدن بیش از حد استقرار قالب</strong></summary>

**زمان‌های انتظار عادی:**
- برنامه وب ساده: 5-10 دقیقه
- برنامه با پایگاه داده: 10-15 دقیقه
- برنامه‌های هوش مصنوعی: 15-25 دقیقه (تأمین منابع OpenAI کند است)

```bash
# پیشرفت را بررسی کنید
azd show

# اگر بیش از ۳۰ دقیقه گیر کرده‌اید، پرتال Azure را بررسی کنید:
azd monitor
# به دنبال استقرارهای ناموفق بگردید
```
</details>

<details>
<summary><strong>❌ "Permission denied" یا "Forbidden"</strong></summary>

```bash
# نقش Azure خود را بررسی کنید
az role assignment list --assignee $(az account show --query user.name -o tsv)

# شما حداقل به نقش «مشارکت‌کننده» نیاز دارید
# از مدیر Azure خود بخواهید که اعطا کند:
# - «مشارکت‌کننده» (برای منابع)
# - «مدیر دسترسی کاربران» (برای تخصیص نقش‌ها)
```
</details>

<details>
<summary><strong>❌ نمی‌توان URL برنامه مستقر‌شده را پیدا کرد</strong></summary>

```bash
# نمایش تمام نقاط پایانی سرویس‌ها
azd show

# یا پورتال Azure را باز کنید
azd monitor

# سرویس مشخص را بررسی کنید
azd env get-values
# به دنبال متغیرهای *_URL بگردید
```
</details>

### 📚 منابع جامع رفع مشکل

- **راهنمای مسائل رایج:** [راه‌حل‌های دقیق](docs/chapter-07-troubleshooting/common-issues.md)
- **مسائل مخصوص هوش مصنوعی:** [رفع‌اشکال هوش مصنوعی](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **راهنمای اشکال‌زدایی:** [اشکال‌زدایی گام‌به‌گام](docs/chapter-07-troubleshooting/debugging.md)
- **دریافت کمک:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 تکمیل دوره و گواهی

### پیگیری پیشرفت
پیشرفت یادگیری خود را در هر فصل دنبال کنید:

- [ ] **فصل 1**: پایه و شروع سریع ✅
- [ ] **فصل 2**: توسعه محور هوش مصنوعی ✅  
- [ ] **فصل 3**: پیکربندی و احراز هویت ✅
- [ ] **فصل 4**: زیرساخت به‌عنوان کد و استقرار ✅
- [ ] **فصل 5**: راهکارهای هوش مصنوعی چندعاملی ✅
- [ ] **فصل 6**: اعتبارسنجی و برنامه‌ریزی پیش از استقرار ✅
- [ ] **فصل 7**: رفع مشکل و اشکال‌زدایی ✅
- [ ] **فصل 8**: الگوهای تولید و سازمانی ✅

### راستی‌آزمایی یادگیری
پس از تکمیل هر فصل، دانش خود را با انجام موارد زیر راستی‌آزمایی کنید:
1. **تمرین عملی**: استقرار عملی فصل را کامل کنید
2. **بررسی دانش**: بخش سوالات متداول آن فصل را مرور کنید
3. **بحث جامعه**: تجربه خود را در Azure Discord به اشتراک بگذارید
4. **فصل بعدی**: به سطح بعدی پیچیدگی بروید

### مزایای اتمام دوره
پس از اتمام همه فصل‌ها، شما خواهید داشت:
- **تجربه تولید**: برنامه‌های واقعی هوش مصنوعی را در Azure مستقر کرده‌اید
- **مهارت‌های حرفه‌ای**: توانایی‌های استقرار آماده سازمانی  
- **شناخت جامعه**: عضو فعال جامعه توسعه‌دهندگان Azure
- **پیشرفت شغلی**: تخصص پرتقاضا در استقرار AZD و هوش مصنوعی

---

## 🤝 جامعه و پشتیبانی

### دریافت کمک و پشتیبانی
- **مسائل فنی**: [گزارش باگ‌ها و درخواست ویژگی‌ها](https://github.com/microsoft/azd-for-beginners/issues)
- **سوالات آموزشی**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) و [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **کمک مخصوص هوش مصنوعی**: به [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) بپیوندید
- **مستندات**: [مستندات رسمی Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### دیدگاه‌های جامعه از Microsoft Foundry Discord

**نتایج نظرسنجی اخیر از کانال #Azure:**
- **45%** از توسعه‌دهندگان می‌خواهند از AZD برای بارکاری‌های هوش مصنوعی استفاده کنند
- **چالش‌های برتر**: استقرار چندخدمتی، مدیریت اعتبارنامه‌ها، آمادگی تولید  
- **بیشترین درخواست‌ها**: قالب‌های مخصوص هوش مصنوعی، راهنمای رفع مشکل، بهترین شیوه‌ها

**برای پیوستن به جامعه ما:**
- تجربیات AZD + AI خود را به اشتراک بگذارید و کمک دریافت کنید
- به پیش‌نمایش‌های اولیه قالب‌های جدید هوش مصنوعی دسترسی پیدا کنید
- در بهترین روش‌های استقرار هوش مصنوعی مشارکت کنید
- بر توسعه ویژگی‌های آینده AI + AZD تأثیر بگذارید

### مشارکت در دوره
ما از مشارکت‌ها استقبال می‌کنیم! لطفاً راهنمای [مشارکت](CONTRIBUTING.md) را برای جزئیات بخوانید:
- **بهبود محتوا**: فصل‌ها و مثال‌های موجود را بهتر کنید
- **مثال‌های جدید**: سناریوها و قالب‌های دنیای واقعی اضافه کنید  
- **ترجمه**: به حفظ پشتیبانی چندزبانه کمک کنید
- **گزارش باگ**: دقت و وضوح را بهبود دهید
- **استانداردهای جامعه**: از دستورالعمل‌های جامعه هماهنگ با هم پیروی کنید

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

### Azure / Edge / MCP / Agents
[![AZD برای مبتدیان](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI برای مبتدیان](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP برای مبتدیان](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents برای مبتدیان](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### مجموعه هوش مصنوعی مولد
[![Generative AI برای مبتدیان](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### یادگیری پایه
[![یادگیری ماشین برای مبتدیان](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science برای مبتدیان](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI برای مبتدیان](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity برای مبتدیان](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev برای مبتدیان](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT برای مبتدیان](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![توسعه XR برای مبتدیان](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### سری Copilot
[![Copilot برای برنامه‌نویسی زوجی با هوش مصنوعی](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot برای C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![ماجراجویی Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ ناوبری دوره

**🚀 آماده شروع یادگیری هستید؟**

**مبتدی‌ها**: با [فصل ۱: مبانی و شروع سریع](#-chapter-1-foundation--quick-start)  
**توسعه‌دهندگان هوش‌مصنوعی**: به [فصل ۲: توسعه مبتنی بر هوش مصنوعی](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**توسعه‌دهندگان باتجربه**: با [فصل ۳: پیکربندی و احراز هویت](#️-chapter-3-configuration--authentication)

**مراحل بعدی**: [شروع فصل ۱ - مبانی AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. اگرچه ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. نسخهٔ اصلی سند به زبان بومی آن باید به‌عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمهٔ حرفه‌ای توسط انسان توصیه می‌شود. ما مسئول هیچ‌گونه سوءتفاهم یا تفسیر نادرستی که از استفاده از این ترجمه ناشی شود، نیستیم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->