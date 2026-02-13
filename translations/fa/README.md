# AZD برای مبتدیان: یک مسیر یادگیری ساختارمند

![AZD برای مبتدیان](../../translated_images/fa/azdbeginners.5527441dd9f74068.webp) 

[![ناظرهای GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![فورک‌های GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![ستاره‌های GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![دیسکورد Azure](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![دیسکورد Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### ترجمه‌های خودکار (همیشه به‌روز)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[عربی](../ar/README.md) | [بنگالی](../bn/README.md) | [بلغاری](../bg/README.md) | [برمه‌ای (میانمار)](../my/README.md) | [چینی (ساده‌شده)](../zh-CN/README.md) | [چینی (سنتی، هنگ‌کنگ)](../zh-HK/README.md) | [چینی (سنتی، ماکائو)](../zh-MO/README.md) | [چینی (سنتی، تایوان)](../zh-TW/README.md) | [کرواسیایی](../hr/README.md) | [چکی](../cs/README.md) | [دانمارکی](../da/README.md) | [هلندی](../nl/README.md) | [استونیایی](../et/README.md) | [فنلاندی](../fi/README.md) | [فرانسوی](../fr/README.md) | [آلمانی](../de/README.md) | [یونانی](../el/README.md) | [عبری](../he/README.md) | [هندی](../hi/README.md) | [مجارستانی](../hu/README.md) | [اندونزیایی](../id/README.md) | [ایتالیایی](../it/README.md) | [ژاپنی](../ja/README.md) | [کاننادا](../kn/README.md) | [کره‌ای](../ko/README.md) | [لیتوانیایی](../lt/README.md) | [مالایی](../ms/README.md) | [مالایالام](../ml/README.md) | [ماراتی](../mr/README.md) | [نپالی](../ne/README.md) | [پیدژ نیجریه‌ای](../pcm/README.md) | [نروژی](../no/README.md) | [فارسی (Farsi)](./README.md) | [لهستانی](../pl/README.md) | [پرتغالی (برزیل)](../pt-BR/README.md) | [پرتغالی (پرتغال)](../pt-PT/README.md) | [پنجابی (گورموخی)](../pa/README.md) | [رومانیایی](../ro/README.md) | [روسی](../ru/README.md) | [صربی (سیریلیک)](../sr/README.md) | [اسلواکی](../sk/README.md) | [اسلوونیایی](../sl/README.md) | [اسپانیایی](../es/README.md) | [سواحیلی](../sw/README.md) | [سوئدی](../sv/README.md) | [تاگالوگ (فیلیپینی)](../tl/README.md) | [تامیل](../ta/README.md) | [تلگو](../te/README.md) | [تایلندی](../th/README.md) | [ترکی](../tr/README.md) | [اوکراینی](../uk/README.md) | [اردو](../ur/README.md) | [ویتنامی](../vi/README.md)

> **ترجیح می‌دهید به صورت محلی کلون کنید؟**
>
> این مخزن شامل بیش از 50 ترجمه به زبان‌های مختلف است که حجم دانلود را به‌طور قابل‌توجهی افزایش می‌دهد. برای کلون کردن بدون ترجمه‌ها، از sparse checkout استفاده کنید:
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
> این به شما همه چیزهایی را می‌دهد که برای تکمیل دوره نیاز دارید با دانلودی بسیار سریع‌تر.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Azure Developer CLI (azd) چیست؟

**Azure Developer CLI (azd)** یک ابزار خط فرمان مناسب برای توسعه‌دهندگان است که فرایند استقرار برنامه‌ها در Azure را ساده می‌کند. به‌جای ایجاد و اتصال دستی ده‌ها منبع Azure، می‌توانید کل برنامه‌ها را با یک فرمان مستقر کنید.

### جادوی `azd up`

```bash
# این دستور تنها همه کارها را انجام می‌دهد:
# ✅ همه منابع آزور را ایجاد می‌کند
# ✅ شبکه و امنیت را پیکربندی می‌کند
# ✅ کد برنامه شما را می‌سازد
# ✅ به آزور مستقر می‌کند
# ✅ یک URL عملی به شما می‌دهد
azd up
```

**همین است!** نیازی به کلیک در Azure Portal نیست، نیازی به یادگیری قالب‌های پیچیده ARM اولیه نیست، هیچ پیکربندی دستی نیست - فقط برنامه‌های کاری روی Azure.

---

## ❓ تفاوت Azure Developer CLI و Azure CLI چیست؟

این متداول‌ترین سوالی است که مبتدیان می‌پرسند. پاسخ ساده این است:

| ویژگی | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **هدف** | مدیریت منابع جداگانه Azure | استقرار برنامه‌های کامل |
| **رویکرد** | متمرکز بر زیرساخت | متمرکز بر برنامه‌ها |
| **نمونه** | `az webapp create --name myapp...` | `azd up` |
| **منحنی یادگیری** | باید خدمات Azure را بدانید | فقط برنامه‌تان را بشناسید |
| **مناسب برای** | DevOps، زیرساخت | توسعه‌دهندگان، نمونه‌سازی سریع |

### تشبیه ساده

- **Azure CLI** مثل داشتن تمام ابزارهای لازم برای ساختن یک خانه است - چکش‌ها، اره‌ها، میخ‌ها. شما می‌توانید هر چیزی بسازید، اما باید ساخت‌وساز را بدانید.
- **Azure Developer CLI** مثل استخدام یک پیمانکار است - شما توصیف می‌کنید چه می‌خواهید و آن‌ها ساخت را انجام می‌دهند.

### چه زمانی از هر کدام استفاده کنیم

| سناریو | از این استفاده کنید |
|----------|----------|
| "می‌خواهم برنامه وب خود را سریع مستقر کنم" | `azd up` |
| "نیاز دارم فقط یک حساب ذخیره‌سازی ایجاد کنم" | `az storage account create` |
| "در حال ساخت یک برنامه کامل هوش مصنوعی هستم" | `azd init --template azure-search-openai-demo` |
| "نیاز به اشکال‌زدایی یک منبع خاص Azure دارم" | `az resource show` |
| "می‌خواهم استقرار آماده تولید را در چند دقیقه داشته باشم" | `azd up --environment production` |

### آن‌ها با هم کار می‌کنند!

AZD در زیرساخت از Azure CLI استفاده می‌کند. می‌توانید هر دو را استفاده کنید:
```bash
# برنامه خود را با AZD مستقر کنید
azd up

# سپس منابع خاص را با Azure CLI بهینه کنید
az webapp config set --name myapp --always-on true
```

---

## 🌟 قالب‌ها را در Awesome AZD پیدا کنید

از ابتدا شروع نکنید! **Awesome AZD** مجموعه‌ای از قالب‌های آماده برای استقرار است که توسط جامعه فراهم شده‌اند:

| منبع | توضیحات |
|----------|-------------|
| 🔗 [**گالری Awesome AZD**](https://azure.github.io/awesome-azd/) | مرور بیش از 200+ قالب با امکان استقرار با یک کلیک |
| 🔗 [**ارسال یک قالب**](https://github.com/Azure/awesome-azd/issues) | قالب خود را به جامعه ارسال کنید |
| 🔗 [**مخزن GitHub**](https://github.com/Azure/awesome-azd) | ستاره بزنید و منبع را بررسی کنید |

### قالب‌های محبوب هوش مصنوعی از Awesome AZD

```bash
# چت RAG با Azure OpenAI + جستجوی هوش مصنوعی
azd init --template azure-search-openai-demo

# برنامه چت سریع هوش مصنوعی
azd init --template openai-chat-app-quickstart

# نمایندگان هوش مصنوعی با نمایندگان Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 شروع در 3 مرحله

### مرحله 1: نصب AZD (2 دقیقه)

**ویندوز:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**لینوکس:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### مرحله 2: ورود به Azure

```bash
azd auth login
```

### مرحله 3: استقرار اولین برنامه‌تان

```bash
# مقداردهی اولیه از یک الگو
azd init --template todo-nodejs-mongo

# استقرار در آزور (همه چیز را ایجاد می‌کند!)
azd up
```

**🎉 همین است!** برنامه شما اکنون روی Azure فعال است.

### پاک‌سازی (فراموش نکنید!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 چگونه از این دوره استفاده کنیم

این دوره برای **یادگیری تدریجی** طراحی شده است - از جایی که احساس راحتی می‌کنید شروع کنید و به‌تدریج پیش بروید:

| تجربه شما | از اینجا شروع کنید |
|-----------------|------------|
| **کاملاً تازه‌کار در Azure** | [فصل 1: مبانی](../..) |
| **Azure را می‌شناسید، تازه‌کار در AZD** | [فصل 1: مبانی](../..) |
| **می‌خواهید برنامه‌های هوش مصنوعی را مستقر کنید** | [فصل 2: توسعه هوش‌مصنوعی](../..) |
| **می‌خواهید تمرین عملی داشته باشید** | [🎓 کارگاه تعاملی](workshop/README.md) - آزمایشگاه هدایت‌شده 3-4 ساعته |
| **به الگوهای تولید نیاز دارید** | [فصل 8: تولید و الگوهای سازمانی](../..) |

### راه‌اندازی سریع

1. **مخزن را فورک کنید**: [![فورک‌های GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **آن را کلون کنید**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **کمک بگیرید**: [جامعه Discord Azure](https://discord.com/invite/ByRwuEEgH4)

> **ترجیح می‌دهید به صورت محلی کلون کنید؟**
>
> این مخزن شامل بیش از 50 ترجمه به زبان‌های مختلف است که حجم دانلود را به‌طور قابل‌توجهی افزایش می‌دهد. برای کلون کردن بدون ترجمه‌ها، از sparse checkout استفاده کنید:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> این به شما همه چیزهایی را می‌دهد که برای تکمیل دوره نیاز دارید با دانلودی بسیار سریع‌تر.


## مرور دوره

Azure Developer CLI (azd) را از طریق فصل‌های ساختارمند که برای یادگیری تدریجی طراحی شده‌اند، بیاموزید. **تمرکز ویژه بر استقرار برنامه‌های هوش مصنوعی با یکپارچه‌سازی Microsoft Foundry.**

### چرا این دوره برای توسعه‌دهندگان مدرن ضروری است

بر اساس بینش‌های جامعه Discord مایکروسافت Foundry، **45% از توسعه‌دهندگان می‌خواهند از AZD برای بارهای کاری هوش مصنوعی استفاده کنند** اما با چالش‌هایی مواجه می‌شوند:
- معماری‌های پیچیده هوش مصنوعی چندسرویسی
- بهترین شیوه‌های استقرار هوش مصنوعی در تولید  
- یکپارچه‌سازی و پیکربندی سرویس‌های هوش مصنوعی Azure
- بهینه‌سازی هزینه برای بارهای کاری هوش مصنوعی
- رفع اشکال مشکلات خاص استقرار هوش مصنوعی

### اهداف یادگیری

با تکمیل این دوره ساختارمند، شما:
- **تسلط بر اصول AZD**: مفاهیم پایه، نصب و پیکربندی
- **استقرار برنامه‌های هوش مصنوعی**: استفاده از AZD با سرویس‌های Microsoft Foundry
- **پیاده‌سازی زیرساخت به‌عنوان کد**: مدیریت منابع Azure با قالب‌های Bicep
- **عیب‌یابی استقرارها**: حل مشکلات رایج و دیباگ
- **بهینه‌سازی برای تولید**: امنیت، مقیاس‌پذیری، نظارت و مدیریت هزینه
- **ساخت راه‌حل‌های چندعامله**: استقرار معماری‌های پیچیده هوش مصنوعی

## 🗺️ نقشه دوره: ناوبری سریع بر اساس فصل

هر فصل دارای یک README اختصاصی با اهداف یادگیری، شروع سریع و تمرین‌ها است:

| فصل | موضوع | درس‌ها | مدت زمان | پیچیدگی |
|---------|-------|---------|----------|------------|
| **[فصل ۱: مبانی](docs/chapter-01-foundation/README.md)** | شروع | [مبانی AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [نصب](docs/chapter-01-foundation/installation.md) &#124; [پروژه اول](docs/chapter-01-foundation/first-project.md) | ۳۰–۴۵ دقیقه | ⭐ |
| **[فصل ۲: توسعه هوش‌مصنوعی](docs/chapter-02-ai-development/README.md)** | برنامه‌های محور هوش مصنوعی | [یکپارچه‌سازی با Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [عامل‌های هوش مصنوعی](docs/chapter-02-ai-development/agents.md) &#124; [استقرار مدل](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [کارگاه](docs/chapter-02-ai-development/ai-workshop-lab.md) | ۱–۲ ساعت | ⭐⭐ |
| **[فصل ۳: پیکربندی](docs/chapter-03-configuration/README.md)** | احراز هویت و امنیت | [پیکربندی](docs/chapter-03-configuration/configuration.md) &#124; [احراز هویت و امنیت](docs/chapter-03-configuration/authsecurity.md) | ۴۵–۶۰ دقیقه | ⭐⭐ |
| **[فصل 4: زیرساخت](docs/chapter-04-infrastructure/README.md)** | IaC و استقرار | [راهنمای استقرار](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [تأمین منابع](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ساعت | ⭐⭐⭐ |
| **[فصل 5: چندعامل](docs/chapter-05-multi-agent/README.md)** | راهکارهای عامل هوش مصنوعی | [سناریوی خرده‌فروشی](examples/retail-scenario.md) &#124; [الگوهای هماهنگی](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ساعت | ⭐⭐⭐⭐ |
| **[فصل 6: پیش‌استقرار](docs/chapter-06-pre-deployment/README.md)** | برنامه‌ریزی و اعتبارسنجی | [چک‌های پیش‌پرواز](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [برنامه‌ریزی ظرفیت](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [انتخاب SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 ساعت | ⭐⭐ |
| **[فصل 7: رفع اشکال](docs/chapter-07-troubleshooting/README.md)** | رفع‌خطا و اصلاح | [مسائل رایج](docs/chapter-07-troubleshooting/common-issues.md) &#124; [رفع‌اشکال](docs/chapter-07-troubleshooting/debugging.md) &#124; [عیب‌یابی AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ساعت | ⭐⭐ |
| **[فصل 8: تولید](docs/chapter-08-production/README.md)** | الگوهای سازمانی | [روش‌های تولید](docs/chapter-08-production/production-ai-practices.md) | 2-3 ساعت | ⭐⭐⭐⭐ |
| **[🎓 کارگاه](workshop/README.md)** | آزمایشگاه عملی | [مقدمه](workshop/docs/instructions/0-Introduction.md) &#124; [انتخاب](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [اعتبارسنجی](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [تجزیه قالب AI](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [پیکربندی](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [سفارشی‌سازی](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [برچیدن زیرساخت](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [جمع‌بندی](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ساعت | ⭐⭐ |

**مدت کل دوره:** ~10-14 hours | **پیشرفت مهارت:** Beginner → Production-Ready

---

## 📚 فصول آموزشی

*مسیر یادگیری خود را بر اساس سطح تجربه و هدف‌ها انتخاب کنید*

### 🚀 فصل 1: مبانی و شروع سریع
**پیش‌نیازها**: اشتراک Azure، دانش پایه‌ای از خط فرمان  
**مدت زمان**: 30-45 دقیقه  
**پیچیدگی**: ⭐

#### آنچه خواهید آموخت
- درک اصول Azure Developer CLI
- نصب AZD بر روی سکوی شما
- اولین استقرار موفق شما

#### منابع آموزشی
- **🎯 از اینجا شروع کنید**: [What is Azure Developer CLI?](../..)
- **📖 نظریه**: [مبانی AZD](docs/chapter-01-foundation/azd-basics.md) - مفاهیم و اصطلاحات اصلی
- **⚙️ راه‌اندازی**: [نصب و راه‌اندازی](docs/chapter-01-foundation/installation.md) - راهنماهای مخصوص پلتفرم
- **🛠️ عملی**: [اولین پروژه شما](docs/chapter-01-foundation/first-project.md) - آموزش گام‌به‌گام
- **📋 مرجع سریع**: [فهرست سریع دستورات](resources/cheat-sheet.md)

#### تمرینات عملی
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
# پس از اتمام فصل ۱، شما باید بتوانید:
azd version              # نسخه نصب‌شده را نمایش می‌دهد
azd init --template todo-nodejs-mongo  # پروژه را مقداردهی اولیه می‌کند
azd up                  # روی Azure مستقر می‌کند
azd show                # آدرس URL برنامه در حال اجرا را نمایش می‌دهد
# برنامه در مرورگر باز می‌شود و کار می‌کند
azd down --force --purge  # منابع را پاک‌سازی می‌کند
```

**📊 زمان موردنیاز:** 30-45 دقیقه  
**📈 سطح مهارت پس از:** قادر به استقرار برنامه‌های پایه به‌طور مستقل

**✅ اعتبارسنجی موفقیت:**
```bash
# پس از اتمام فصل ۱، شما باید قادر باشید:
azd version              # نسخه نصب‌شده را نمایش می‌دهد
azd init --template todo-nodejs-mongo  # پروژه را مقداردهی اولیه می‌کند
azd up                  # بر روی Azure مستقر می‌کند
azd show                # آدرس URL برنامهٔ در حال اجرا را نمایش می‌دهد
# برنامه در مرورگر باز می‌شود و کار می‌کند
azd down --force --purge  # منابع را پاک‌سازی می‌کند
```

**📊 زمان موردنیاز:** 30-45 دقیقه  
**📈 سطح مهارت پس از:** قادر به استقرار برنامه‌های پایه به‌طور مستقل

---

### 🤖 فصل 2: توسعه محورِ AI (پیشنهادی برای توسعه‌دهندگان AI)
**پیش‌نیازها**: فصل 1 تکمیل شده  
**مدت زمان**: 1-2 ساعت  
**پیچیدگی**: ⭐⭐

#### آنچه خواهید آموخت
- ادغام Microsoft Foundry با AZD
- استقرار برنامه‌های مبتنی بر AI
- درک پیکربندی‌های سرویس‌های AI

#### منابع آموزشی
- **🎯 از اینجا شروع کنید**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 عامل‌های AI**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - استقرار عامل‌های هوشمند با AZD
- **📖 الگوها**: [استقرار مدل‌های AI](docs/chapter-02-ai-development/ai-model-deployment.md) - استقرار و مدیریت مدل‌های AI
- **🛠️ کارگاه**: [کارگاه آزمایشی AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - آماده‌سازی راهکارهای AI برای AZD
- **🎥 راهنمای تعاملی**: [مطالب کارگاه](workshop/README.md) - یادگیری مبتنی بر مرورگر با MkDocs * DevContainer Environment
- **📋 قالب‌ها**: [قالب‌های Microsoft Foundry](../..)
- **📝 مثال‌ها**: [نمونه‌های استقرار AZD](examples/README.md)

#### تمرینات عملی
```bash
# اولین برنامهٔ هوش مصنوعی خود را مستقر کنید
azd init --template azure-search-openai-demo
azd up

# قالب‌های هوش مصنوعی بیشتری را امتحان کنید
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 نتیجه فصل**: استقرار و پیکربندی یک برنامه چت مبتنی بر AI با قابلیت‌های RAG

**✅ اعتبارسنجی موفقیت:**
```bash
# پس از فصل ۲ باید بتوانید:
azd init --template azure-search-openai-demo
azd up
# رابط چت هوش مصنوعی را تست کنید
# سؤال بپرسید و پاسخ‌های مبتنی بر هوش مصنوعی همراه با منابع دریافت کنید
# اطمینان حاصل کنید که ادغام جستجو کار می‌کند
azd monitor  # بررسی کنید که Application Insights تله‌متری را نمایش می‌دهد
azd down --force --purge
```

**📊 زمان موردنیاز:** 1-2 ساعت  
**📈 سطح مهارت پس از:** قادر به استقرار و پیکربندی برنامه‌های AI آماده تولید  
**💰 آگاهی هزینه:** درک هزینه‌های توسعه $80-150/ماه، هزینه‌های تولید $300-3500/ماه

#### 💰 ملاحظات هزینه برای استقرارهای AI

**محیط توسعه (حدود $80-150/ماه):**
- Azure OpenAI (Pay-as-you-go): $0-50/ماه (بر اساس استفاده از توکن)
- AI Search (Basic tier): $75/ماه
- Container Apps (Consumption): $0-20/ماه
- Storage (Standard): $1-5/ماه

**محیط تولید (حدود $300-3,500+/ماه):**
- Azure OpenAI (PTU برای عملکرد یکنواخت): $3,000+/ماه OR Pay-as-go with high volume
- AI Search (Standard tier): $250/ماه
- Container Apps (Dedicated): $50-100/ماه
- Application Insights: $5-50/ماه
- Storage (Premium): $10-50/ماه

**💡 نکات بهینه‌سازی هزینه:**
- از **Free Tier** Azure OpenAI برای یادگیری استفاده کنید (شامل 50,000 توکن/ماه)
- هنگامی که فعالانه توسعه نمی‌دهید، `azd down` را اجرا کنید تا منابع آزاد شوند
- با صورتحساب مبتنی بر مصرف شروع کنید، فقط برای تولید به PTU ارتقا دهید
- از `azd provision --preview` برای برآورد هزینه‌ها قبل از استقرار استفاده کنید
- مقیاس‌پذیری خودکار را فعال کنید: فقط برای استفاده واقعی هزینه پرداخت کنید

**نظارت بر هزینه:**
```bash
# بررسی هزینه‌های ماهانهٔ تخمینی
azd provision --preview

# نظارت بر هزینه‌های واقعی در پورتال Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ فصل 3: پیکربندی و احراز هویت
**پیش‌نیازها**: فصل 1 تکمیل شده  
**مدت زمان**: 45-60 دقیقه  
**پیچیدگی**: ⭐⭐

#### آنچه خواهید آموخت
- پیکربندی و مدیریت محیط
- احراز هویت و بهترین روش‌های امنیتی
- نام‌گذاری منابع و سازمان‌دهی

#### منابع آموزشی
- **📖 پیکربندی**: [راهنمای پیکربندی](docs/chapter-03-configuration/configuration.md) - تنظیم محیط
- **🔐 امنیت**: [الگوهای احراز هویت و هویت مدیریت‌شده](docs/chapter-03-configuration/authsecurity.md) - الگوهای احراز هویت
- **📝 مثال‌ها**: [نمونه برنامه دیتابیس](examples/database-app/README.md) - مثال‌های دیتابیس برای AZD

#### تمرینات عملی
- پیکربندی چندین محیط (dev, staging, prod)
- راه‌اندازی احراز هویت با هویت مدیریت‌شده
- پیاده‌سازی تنظیمات خاص هر محیط

**💡 نتیجه فصل**: مدیریت چندین محیط با احراز هویت و امنیت مناسب

---

### 🏗️ فصل 4: زیرساخت به‌عنوان‌کد و استقرار
**پیش‌نیازها**: فصل‌های 1-3 تکمیل شده  
**مدت زمان**: 1-1.5 ساعت  
**پیچیدگی**: ⭐⭐⭐

#### آنچه خواهید آموخت
- الگوهای پیشرفته استقرار
- زیرساخت به‌عنوان‌کد با Bicep
- استراتژی‌های تأمین منابع

#### منابع آموزشی
- **📖 استقرار**: [راهنمای استقرار](docs/chapter-04-infrastructure/deployment-guide.md) - گردش‌کار کامل
- **🏗️ تأمین منابع**: [تأمین منابع](docs/chapter-04-infrastructure/provisioning.md) - مدیریت منابع Azure
- **📝 مثال‌ها**: [مثال برنامه کانتینری](../../examples/container-app) - استقرارهای کانتینری

#### تمرینات عملی
- ایجاد قالب‌های Bicep سفارشی
- استقرار برنامه‌های چندخدمتی
- پیاده‌سازی استراتژی‌های blue-green deployment

**💡 نتیجه فصل**: استقرار برنامه‌های چندخدمتی پیچیده با استفاده از قالب‌های زیرساخت سفارشی

---

### 🎯 فصل 5: راهکارهای AI چندعامل (پیشرفته)
**پیش‌نیازها**: فصل‌های 1-2 تکمیل شده  
**مدت زمان**: 2-3 ساعت  
**پیچیدگی**: ⭐⭐⭐⭐

#### آنچه خواهید آموخت
- الگوهای معماری چندعامل
- ارکستراسیون و هماهنگی عامل‌ها
- استقرارهای AI آماده تولید

#### منابع آموزشی
- **🤖 پروژه برجسته**: [راهکار چندعامل خرده‌فروشی](examples/retail-scenario.md) - پیاده‌سازی کامل
- **🛠️ قالب‌های ARM**: [بسته قالب ARM](../../examples/retail-multiagent-arm-template) - استقرار با یک کلیک
- **📖 معماری**: [الگوهای هماهنگی چندعامل](docs/chapter-06-pre-deployment/coordination-patterns.md) - الگوها

#### تمرینات عملی
```bash
# استقرار راهکار چندعاملی کامل برای خرده‌فروشی
cd examples/retail-multiagent-arm-template
./deploy.sh

# کاوش پیکربندی‌های عامل
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 نتیجه فصل**: استقرار و مدیریت یک راهکار چندعامل آماده تولید با عامل‌های مشتری و موجودی

---

### 🔍 فصل 6: اعتبارسنجی و برنامه‌ریزی پیش‌استقرار
**پیش‌نیازها**: فصل 4 تکمیل شده  
**مدت زمان**: 1 ساعت  
**پیچیدگی**: ⭐⭐

#### آنچه خواهید آموخت
- برنامه‌ریزی ظرفیت و اعتبارسنجی منابع
- استراتژی‌های انتخاب SKU
- چک‌های پیش‌استقرار و اتوماسیون

#### منابع آموزشی
- **📊 برنامه‌ریزی**: [برنامه‌ریزی ظرفیت](docs/chapter-06-pre-deployment/capacity-planning.md) - اعتبارسنجی منابع
- **💰 انتخاب**: [انتخاب SKU](docs/chapter-06-pre-deployment/sku-selection.md) - گزینه‌های هزینه-موثر
- **✅ اعتبارسنجی**: [چک‌های پیش‌استقرار](docs/chapter-06-pre-deployment/preflight-checks.md) - اسکریپت‌های خودکار

#### تمرینات عملی
- اجرای اسکریپت‌های اعتبارسنجی ظرفیت
- بهینه‌سازی انتخاب‌های SKU برای کاهش هزینه
- پیاده‌سازی چک‌های خودکار پیش از استقرار

**💡 نتیجه فصل**: اعتبارسنجی و بهینه‌سازی استقرارها قبل از اجرا

---

### 🚨 فصل 7: رفع اشکال و رفع‌خطا
**پیش‌نیازها**: هر فصل استقرار تکمیل شده باشد  
**مدت زمان**: 1-1.5 ساعت  
**پیچیدگی**: ⭐⭐

#### آنچه خواهید آموخت
- رویکردهای سیستماتیک برای رفع‌اشکال
- مسائل رایج و راه‌حل‌ها
- عیب‌یابی مخصوص AI

#### منابع آموزشی
- **🔧 مسائل رایج**: [مسائل رایج](docs/chapter-07-troubleshooting/common-issues.md) - پرسش‌های متداول و راه‌حل‌ها
- **🕵️ رفع‌اشکال**: [راهنمای رفع‌اشکال](docs/chapter-07-troubleshooting/debugging.md) - استراتژی‌های گام‌به‌گام
- **🤖 مسائل AI**: [عیب‌یابی مرتبط با AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - مشکلات سرویس‌های AI

#### تمرینات عملی
- تشخیص شکست‌های استقرار
- رفع مسائل احراز هویت
- رفع‌اشکال اتصال سرویس‌های AI

**💡 نتیجه فصل**: به‌طور مستقل تشخیص و حل مسائل رایج استقرار

---

### 🏢 فصل 8: تولید و الگوهای سازمانی
**پیش‌نیازها**: فصل‌های 1-4 تکمیل شده  
**مدت زمان**: 2-3 ساعت  
**پیچیدگی**: ⭐⭐⭐⭐

#### آنچه خواهید آموخت
- استراتژی‌های استقرار در محیط تولید
- الگوهای امنیتی سازمانی
- نظارت و بهینه‌سازی هزینه‌ها

#### منابع آموزشی
- **🏭 تولید**: [بهترین شیوه‌های AI در تولید](docs/chapter-08-production/production-ai-practices.md) - الگوهای سازمانی
- **📝 مثال‌ها**: [مثال میکروسرویس‌ها](../../examples/microservices) - معماری‌های پیچیده
- **📊 نظارت**: [یکپارچگی Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - نظارت

#### تمرینات عملی
- پیاده‌سازی الگوهای امنیتی سازمانی
- راه‌اندازی نظارت جامع
- استقرار در محیط تولید با حاکمیت مناسب

**💡 نتیجه فصل**: استقرار برنامه‌های آماده سازمانی با تمامی قابلیت‌های تولید

---

## 🎓 نمای کلی کارگاه: تجربه یادگیری عملی

> **⚠️ وضعیت کارگاه: در حال توسعه**
> مواد کارگاه در حال حاضر در حال توسعه و اصلاح هستند. ماژول‌های اصلی عملکردی‌اند، اما برخی بخش‌های پیشرفته ناقص‌اند. ما فعالانه در حال تکمیل تمام محتوا هستیم. [پیشرفت را دنبال کنید →](workshop/README.md)

### مواد کارگاه تعاملی
**یادگیری عملی جامع با ابزارهای مبتنی بر مرورگر و تمرین‌های هدایت‌شده**

مواد کارگاه ما یک تجربه یادگیری ساختارمند و تعاملی فراهم می‌کنند که مکمل برنامه درسی فصل‌بندی‌شده بالا است. این کارگاه برای یادگیری خودآموز و جلسات هدایت‌شده توسط مدرس طراحی شده است.

#### 🛠️ ویژگی‌های کارگاه
- **رابط مبتنی بر مرورگر**: کارگاه کامل با پشتیبانی MkDocs همراه با جستجو، کپی و امکانات پوسته
- **ادغام GitHub Codespaces**: راه‌اندازی محیط توسعه با یک کلیک
- **مسیر یادگیری ساختارمند**: تمرین‌های هدایت‌شده 8 ماژولی (در مجموع 3-4 ساعت)
- **روش‌شناسی تدریجی**: معرفی → انتخاب → اعتبارسنجی → تجزیه → پیکربندی → سفارشی‌سازی → پاک‌سازی → جمع‌بندی
- **محیط DevContainer تعاملی**: ابزارها و وابستگی‌های از پیش پیکربندی‌شده

#### 📚 ساختار ماژول‌های کارگاه
کارگاه از یک **روش‌شناسی تدریجی 8 ماژولی** پیروی می‌کند که شما را از مرحله کشف تا تسلط بر استقرار هدایت می‌کند:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Introduction** | Workshop Overview | Understand learning objectives, prerequisites, and workshop structure | 15 min |
| **1. Selection** | Template Discovery | Explore AZD templates and select the right AI template for your scenario | 20 min |
| **2. Validation** | Deploy & Verify | Deploy the template with `azd up` and validate infrastructure works | 30 min |
| **3. Deconstruction** | Understand Structure | Use GitHub Copilot to explore template architecture, Bicep files, and code organization | 30 min |
| **4. Configuration** | azure.yaml Deep Dive | Master `azure.yaml` configuration, lifecycle hooks, and environment variables | 30 min |
| **5. Customization** | Make It Yours | Enable AI Search, tracing, evaluation, and customize for your scenario | 45 min |
| **6. Teardown** | Clean Up | Safely deprovision resources with `azd down --purge` | 15 min |
| **7. Wrap-up** | Next Steps | Review accomplishments, key concepts, and continue your learning journey | 15 min |

**جریان کارگاه:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 شروع به کار با کارگاه
```bash
# گزینهٔ ۱: GitHub Codespaces (توصیه‌شده)
# در مخزن روی "Code" → "Create codespace on main" کلیک کنید.

# گزینهٔ ۲: توسعهٔ محلی
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# دستورالعمل‌های راه‌اندازی موجود در workshop/README.md را دنبال کنید.
```

#### 🎯 نتایج یادگیری کارگاه
با تکمیل کارگاه، شرکت‌کنندگان قادر خواهند بود:
- **استقرار برنامه‌های AI تولیدی**: استفاده از AZD با سرویس‌های Microsoft Foundry
- **تسلط بر معماری‌های چندعاملی**: پیاده‌سازی راه‌حل‌های هماهنگ‌شده با عوامل AI
- **اجرای بهترین شیوه‌های امنیتی**: پیکربندی احراز هویت و کنترل دسترسی
- **بهینه‌سازی برای مقیاس**: طراحی استقرارهای مقرون‌به‌صرفه و با کارایی بالا
- **عیب‌یابی استقرارها**: حل مشکلات رایج به‌صورت مستقل

#### 📖 منابع کارگاه
- **🎥 راهنمای تعاملی**: [مواد کارگاه](workshop/README.md) - محیط یادگیری مبتنی بر مرورگر
- **📋 دستورالعمل‌های ماژول به ماژول**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - مروری بر کارگاه و اهداف
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - یافتن و انتخاب قالب‌های AI
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - استقرار و اعتبارسنجی قالب‌ها
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - بررسی معماری قالب
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - تسلط بر azure.yaml
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - سفارشی‌سازی برای سناریوی شما
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - پاک‌سازی منابع
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - مرور و گام‌های بعدی
- **🛠️ آزمایشگاه کارگاه AI**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - تمرین‌های متمرکز بر AI
- **💡 شروع سریع**: [راهنمای راه‌اندازی کارگاه](workshop/README.md#quick-start) - پیکربندی محیط

**مناسب برای**: آموزش سازمانی، دوره‌های دانشگاهی، یادگیری خودآموز و بوت‌کمپ‌های توسعه‌دهنده.

---

## 📖 کاوش عمیق: قابلیت‌های AZD

فراتر از اصول پایه، AZD قابلیت‌های قدرتمندی برای استقرارهای تولیدی فراهم می‌کند:

- **استقرار مبتنی بر الگو** - استفاده از قالب‌های از پیش‌ساخته برای الگوهای رایج برنامه‌ها
- **زیرساخت به‌عنوان کد** - مدیریت منابع Azure با استفاده از Bicep یا Terraform  
- **گردش‌کارهای یکپارچه** - تهیه، استقرار و نظارت بر برنامه‌ها به‌صورت یکپارچه
- **مناسب توسعه‌دهنده** - بهینه‌سازی شده برای بهره‌وری و تجربه توسعه‌دهنده

### **AZD + Microsoft Foundry: مناسب برای استقرارهای AI**

**چرا AZD برای راه‌حل‌های AI؟** AZD به مهم‌ترین چالش‌هایی که توسعه‌دهندگان AI با آن مواجه‌اند می‌پردازد:

- **قالب‌های آماده برای AI** - قالب‌های از پیش پیکربندی‌شده برای Azure OpenAI، Cognitive Services و بارهای کاری ML
- **استقرارهای امن AI** - الگوهای امنیتی داخلی برای سرویس‌های AI، کلیدهای API و نقاط انتهایی مدل  
- **الگوهای تولیدی AI** - بهترین شیوه‌ها برای استقرار برنامه‌های AI مقیاس‌پذیر و مقرون‌به‌صرفه
- **گردش‌کارهای انتها به انتها برای AI** - از توسعه مدل تا استقرار تولیدی با نظارت مناسب
- **بهینه‌سازی هزینه** - تخصیص منابع هوشمند و استراتژی‌های مقیاس‌بندی برای بارهای کاری AI
- **ادغام با Microsoft Foundry** - اتصال روان به کاتالوگ مدل‌ها و نقاط انتهایی Microsoft Foundry

---

## 🎯 کتابخانه قالب‌ها و نمونه‌ها

### برجسته: قالب‌های Microsoft Foundry
**اگر در حال استقرار برنامه‌های AI هستید، از اینجا شروع کنید!**

> **توجه:** این قالب‌ها الگوهای مختلف AI را نشان می‌دهند. برخی از آن‌ها نمونه‌های Azure خارجی هستند و برخی دیگر پیاده‌سازی‌های محلی‌اند.

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**شروع با چت هوش مصنوعی**](https://github.com/Azure-Samples/get-started-with-ai-chat) | فصل 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | خارجی |
| [**شروع با عوامل AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | فصل 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| خارجی |
| [**نمونه Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | فصل 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | خارجی |
| [**شروع سریع اپ چت OpenAI**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | فصل 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | خارجی |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | فصل 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | خارجی |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | فصل 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | خارجی |
| [**راه‌حل چندعاملی خرده‌فروشی**](examples/retail-scenario.md) | فصل 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **محلی** |

### برجسته: سناریوهای کامل یادگیری
**قالب‌های آماده تولید که به فصل‌های آموزشی نگاشت شده‌اند**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | فصل 2 | ⭐ | الگوهای پایه استقرار AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | فصل 2 | ⭐⭐ | پیاده‌سازی RAG با Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | فصل 4 | ⭐⭐ | ادغام Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | فصل 5 | ⭐⭐⭐ | چارچوب عامل و فراخوانی توابع |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | فصل 8 | ⭐⭐⭐ | ارکستراسیون AI سازمانی |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | فصل 5 | ⭐⭐⭐⭐ | معماری چندعاملی با عوامل مشتری و موجودی |

### یادگیری براساس نوع مثال

> **📌 مثال‌های محلی در مقابل خارجی:**  
> **مثال‌های محلی** (در این مخزن) = آماده استفاده بلافاصله  
> **مثال‌های خارجی** (Azure Samples) = از مخازن پیوند داده‌شده کلون کنید

#### مثال‌های محلی (آماده برای استفاده)
- [**راه‌حل چندعاملی خرده‌فروشی**](examples/retail-scenario.md) - پیاده‌سازی کامل آماده تولید با قالب‌های ARM
  - معماری چندعاملی (عامل مشتری + عامل موجودی)
  - نظارت و ارزیابی جامع
  - استقرار با یک کلیک از طریق قالب ARM

#### مثال‌های محلی - برنامه‌های کانتینری (فصول 2-5)
**نمونه‌های جامع استقرار کانتینری در این مخزن:**
- [**نمونه‌های Container App**](examples/container-app/README.md) - راهنمای کامل استقرارهای کانتینری
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - API REST پایه با امکان scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - استقرار تولیدی چندخدمتی
  - الگوهای راه‌اندازی سریع، تولید و پیشرفته
  - راهنمایی در زمینه نظارت، امنیت و بهینه‌سازی هزینه

#### مثال‌های خارجی - برنامه‌های ساده (فصول 1-2)
**این مخازن Azure Samples را کلون کنید تا شروع کنید:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - الگوهای پایه استقرار
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - استقرار محتوای ایستا
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - استقرار API REST

#### مثال‌های خارجی - ادغام پایگاه‌داده (فصل 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - الگوهای اتصال به پایگاه‌داده
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - گردش‌کار داده بدون سرور

#### مثال‌های خارجی - الگوهای پیشرفته (فصول 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - معماری‌های چندخدمتی
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - پردازش پس‌زمینه  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - الگوهای ML آماده تولید

### مجموعه‌های قالب خارجی
- [**گالری رسمی قالب‌های AZD**](https://azure.github.io/awesome-azd/) - مجموعه منتخب قالب‌های رسمی و جامعه
- [**قالب‌های Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - مستندات قالب‌های Microsoft Learn
- [**دایرکتوری Examples**](examples/README.md) - مثال‌های یادگیری محلی با توضیحات مفصل

---

## 📚 منابع یادگیری و مراجع

### مراجع سریع
- [**برگه تقلب دستورات**](resources/cheat-sheet.md) - دستورات اساسی azd سازماندهی‌شده بر اساس فصل
- [**واژه‌نامه**](resources/glossary.md) - اصطلاحات Azure و azd  
- [**سؤالات متداول**](resources/faq.md) - پرسش‌های رایج سازماندهی‌شده بر اساس فصل آموزشی
- [**راهنمای مطالعه**](resources/study-guide.md) - تمرین‌های جامع

### کارگاه‌های عملی
- [**آزمایشگاه کارگاه AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - قابل استقرار کردن راه‌حل‌های AI با AZD (2-3 ساعت)
- [**کارگاه تعاملی**](workshop/README.md) - تمرین‌های هدایت‌شده 8 ماژولی با MkDocs و GitHub Codespaces
  - پیروی می‌کند از: معرفی → انتخاب → اعتبارسنجی → تجزیه → پیکربندی → سفارشی‌سازی → پاک‌سازی → جمع‌بندی

### منابع یادگیری خارجی
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

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

# درستی نصب را تأیید کنید
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
<summary><strong>❌ "InsufficientQuota" یا "Quota exceeded"</strong></summary>

```bash
# یک منطقهٔ متفاوت Azure را امتحان کنید
azd env set AZURE_LOCATION "westus2"
azd up

# یا در محیط توسعه از SKUهای کوچکتر استفاده کنید
# فایل infra/main.parameters.json را ویرایش کنید:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" در میانه اجرا شکست می‌خورد</strong></summary>

```bash
# گزینه ۱: پاک‌سازی و تلاش مجدد
azd down --force --purge
azd up

# گزینه ۲: فقط اصلاح زیرساخت
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
<summary><strong>❌ "Resource already exists" یا تضاد نام‌ها</strong></summary>

```bash
# AZD نام‌های یکتا تولید می‌کند، اما در صورت بروز تعارض:
azd down --force --purge

# سپس با یک محیط تازه دوباره تلاش کنید
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ استقرار قالب بیش از حد طول می‌کشد</strong></summary>

**زمان انتظار معمول:**
- برنامه وب ساده: 5-10 دقیقه
- برنامه با پایگاه‌داده: 10-15 دقیقه
- برنامه‌های هوش مصنوعی: 15-25 دقیقه (پروویژنینگ OpenAI کند است)

```bash
# پیشرفت را بررسی کنید
azd show

# اگر بیش از ۳۰ دقیقه گیر کردید، پورتال Azure را بررسی کنید:
azd monitor
# به دنبال استقرارهای ناموفق بگردید
```
</details>

<details>
<summary><strong>❌ "Permission denied" یا "Forbidden"</strong></summary>

```bash
# نقش Azure خود را بررسی کنید
az role assignment list --assignee $(az account show --query user.name -o tsv)

# حداقل به نقش "Contributor" نیاز دارید
# از ادمین Azure خود بخواهید که موارد زیر را اعطا کند:
# - Contributor (برای منابع)
# - User Access Administrator (برای تخصیص نقش‌ها)
```
</details>

<details>
<summary><strong>❌ نمی‌توان آدرس URL برنامه مستقر را پیدا کرد</strong></summary>

```bash
# نمایش تمام نقاط انتهایی سرویس‌ها
azd show

# یا پورتال Azure را باز کنید
azd monitor

# سرویس خاص را بررسی کنید
azd env get-values
# به دنبال متغیرهای *_URL بگردید
```
</details>

### 📚 منابع کامل عیب‌یابی

- **راهنمای مشکلات رایج:** [راه‌حل‌های دقیق](docs/chapter-07-troubleshooting/common-issues.md)
- **مسائل خاص هوش مصنوعی:** [عیب‌یابی هوش مصنوعی](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **راهنمای اشکال‌زدایی:** [اشکال‌زدایی گام‌به‌گام](docs/chapter-07-troubleshooting/debugging.md)
- **دریافت کمک:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 تکمیل دوره و گواهی‌نامه

### پیگیری پیشرفت
پیشرفت یادگیری خود را در هر فصل دنبال کنید:

- [ ] **فصل 1**: مبانی و شروع سریع ✅
- [ ] **فصل 2**: توسعه مبتنی بر AI ✅  
- [ ] **فصل 3**: پیکربندی و احراز هویت ✅
- [ ] **فصل 4**: زیرساخت به‌عنوان کد و استقرار ✅
- [ ] **فصل 5**: راه‌حل‌های چندعامله هوش مصنوعی ✅
- [ ] **فصل 6**: اعتبارسنجی و برنامه‌ریزی پیش از استقرار ✅
- [ ] **فصل 7**: عیب‌یابی و اشکال‌زدایی ✅
- [ ] **فصل 8**: الگوهای تولیدی و سازمانی ✅

### تأیید یادگیری
پس از تکمیل هر فصل، با انجام موارد زیر دانش خود را تأیید کنید:
1. **تمرین عملی**: استقرار عملی فصل را کامل کنید
2. **بررسی دانش**: بخش سوالات متداول فصل خود را مرور کنید
3. **بحث در اجتماع**: تجربه خود را در Azure Discord به اشتراک بگذارید
4. **فصل بعدی**: به سطح بعدی پیچیدگی بروید

### مزایای تکمیل دوره
با تکمیل همه فصل‌ها، شما خواهید داشت:
- **تجربه تولیدی**: برنامه‌های واقعی هوش مصنوعی را در Azure مستقر کرده‌اید
- **مهارت‌های حرفه‌ای**: توانایی‌های استقرار سازمانی  
- **شناخته شدن در جامعه**: عضو فعال جامعه توسعه‌دهندگان Azure
- **پیشرفت شغلی**: مهارت‌های مورد تقاضا در استقرار AZD و هوش مصنوعی

---

## 🤝 جامعه و پشتیبانی

### دریافت کمک و پشتیبانی
- **مشکلات فنی:** [گزارش باگ‌ها و درخواست ویژگی‌ها](https://github.com/microsoft/azd-for-beginners/issues)
- **سؤالات آموزشی:** [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) و [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **کمک خاص هوش مصنوعی:** به [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) بپیوندید
- **مستندات:** [Official Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### بینش‌های جامعه از Microsoft Foundry Discord

**نتایج نظرسنجی اخیر از کانال #Azure:**
- **45%** از توسعه‌دهندگان می‌خواهند از AZD برای بارکاری‌های هوش مصنوعی استفاده کنند
- **چالش‌های اصلی**: استقرار چندسرویسی، مدیریت اعتبارنامه‌ها، آمادگی برای تولید  
- **بیشترین درخواست‌ها**: قالب‌های مخصوص هوش مصنوعی، راهنماهای عیب‌یابی، بهترین شیوه‌ها

با پیوستن به جامعه ما می‌توانید:
- تجربیات AZD + AI خود را به اشتراک بگذارید و کمک دریافت کنید
- به پیش‌نمایش‌های اولیه قالب‌های جدید هوش مصنوعی دسترسی پیدا کنید
- به بهترین شیوه‌های استقرار هوش مصنوعی کمک کنید
- بر توسعه ویژگی‌های آینده AI + AZD تأثیر بگذارید

### مشارکت در دوره
ما از مشارکت‌ها استقبال می‌کنیم! برای جزئیات لطفاً [راهنمای مشارکت](CONTRIBUTING.md) را بخوانید:
- **بهبود محتوا**: بهبود فصل‌ها و مثال‌های موجود
- **مثال‌های جدید**: افزودن سناریوها و قالب‌های دنیای واقعی  
- **ترجمه**: کمک به نگهداری پشتیبانی چندزبانه
- **گزارش باگ**: بهبود دقت و وضوح
- **استانداردهای جامعه**: از دستورالعمل‌های جامعه فراگیر ما پیروی کنید

---

## 📄 اطلاعات دوره

### مجوز
This project is licensed under the MIT License - see the [LICENSE](../../LICENSE) file for details.

### منابع آموزشی مرتبط مایکروسافت

تیم ما دوره‌های آموزشی جامع دیگری تولید می‌کند:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Core Learning
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Series
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ ناوبری دوره

**🚀 آماده‌اید شروع به یادگیری کنید؟**

**مبتدی‌ها**: با [فصل 1: مبانی و شروع سریع](../..) شروع کنید  
**توسعه‌دهندگان هوش مصنوعی**: به [فصل 2: توسعه با محوریت هوش مصنوعی](../..) بروید  
**توسعه‌دهندگان باتجربه**: با [فصل 3: پیکربندی و احراز هویت](../..) شروع کنید

**گام‌های بعدی**: [شروع فصل 1 - مبانی AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
سلب مسئولیت:
این سند با استفاده از سرویس ترجمهٔ هوش مصنوعی Co-op Translator (https://github.com/Azure/co-op-translator) ترجمه شده است. اگرچه ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری‌اش باید به‌عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، استفاده از ترجمهٔ حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوتفاهم یا تفسیر نادرستی که ناشی از استفاده از این ترجمه باشد، مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->