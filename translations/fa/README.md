# AZD برای مبتدیان: یک مسیر یادگیری ساختاریافته

![AZD برای مبتدیان](../../translated_images/fa/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### ترجمه‌های خودکار (همیشه به‌روز)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](./README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **ترجیح می‌دهید به‌صورت محلی کلون کنید؟**
>
> این مخزن شامل بیش از 50 ترجمه زبان است که حجم دانلود را به‌طور قابل‌توجهی افزایش می‌دهد. برای کلون کردن بدون ترجمه‌ها از sparse checkout استفاده کنید:
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
> این به شما همه چیز لازم برای تکمیل دوره را با دانلود بسیار سریع‌تر می‌دهد.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 تازه‌ها در azd امروز

> 📌 این دوره با نسخه **`azd 1.25.6`** (ژوئن 2026) اعتبارسنجی شده است. برای بررسی نسخه‌تان `azd version` را اجرا کنید و برای دریافت آخرین نسخه `azd upgrade` را اجرا کنید.

Azure Developer CLI فراتر از برنامه‌های وب و APIهای سنتی رشد کرده است. امروز، azd ابزار واحدی برای استقرار هر برنامه‌ای در Azure است — از جمله برنامه‌های مجهز به هوش مصنوعی و عامل‌های هوشمند.

این برای شما به چه معناست:

- **عامل‌های هوش مصنوعی اکنون به‌عنوان بارهای کاری درجه‌یک در azd پشتیبانی می‌شوند.** می‌توانید پروژه‌های عامل هوش مصنوعی را با همان گردش کاری `azd init` → `azd up` که قبلاً می‌دانستید، مقداردهی اولیه، مستقر و مدیریت کنید.
- **یک چرخه عمر کامل عامل از طریق CLI.** افزونه `azure.ai.agents` اکنون کل مسیر را پوشش می‌دهد—`azd ai agent init` برای اسکافولد، `azd ai agent invoke` برای آزمایش (با خروجی زمان‌سنجی پاسخ)، `azd ai agent eval generate` و `azd ai agent optimize` برای سنجش و بهبود کیفیت، و `azd ai agent delete` برای پاکسازی.
- **بخش‌های ساختاری بیشتر برای هوش مصنوعی.** افزونه‌های پیش‌نمایش جدید—`azure.ai.skills` و `azure.ai.connections`—به شما امکان می‌دهند مهارت‌های قابل‌استفاده مجدد عامل و اتصالات Foundry را مستقیماً با azd مدیریت کنید.
- **یکپارچگی Microsoft Foundry** استقرار مدل، میزبانی عامل و پیکربندی سرویس‌های هوش مصنوعی را مستقیماً به اکوسیستم قالب‌های azd می‌آورد.
- **پایه‌های روزمره روان‌تر.** انتشارهای اخیر باعث شده‌اند `azd init` ایندموتنت باشد (اجرای مجدد ایمن)، `azd auth login` به‌طور خودکار نشانه‌های قدیمی را پاک کند، و یک اعلان راه‌اندازی دوستانه برای اولین اجرای `azd tool` اضافه شود.
- **گردش کار اصلی تغییر نکرده است.** چه درحال استقرار یک برنامه todo، یک میکروسرویس، یا یک راه‌حل چندعامله هوش مصنوعی باشید، دستورات یکسان هستند.

> **نکته برای کاربران Aspire:** مایکروسافت اکنون این محصول را به سادگی **Aspire** می‌نامد (قبلاً ".NET Aspire"). پشتیبانی azd برای Aspire تغییری نکرده است—فقط نام به‌روزرسانی شده است.

اگر قبلاً از azd استفاده کرده‌اید، پشتیبانی هوش مصنوعی امتدادی طبیعی است—نه یک ابزار جدا یا یک مسیر پیشرفته. اگر تازه شروع می‌کنید، یک گردش کاری را خواهید آموخت که برای همه چیز کار می‌کند.

---

## 🚀 Azure Developer CLI (azd) چیست؟

**Azure Developer CLI (azd)** یک ابزار خط فرمان کاربرپسند برای توسعه‌دهندگان است که کار استقرار برنامه‌ها در Azure را ساده می‌کند. به‌جای ایجاد و اتصال دستی ده‌ها منبع Azure، می‌توانید کل برنامه‌ها را با یک فرمان مستقر کنید.

### سحر `azd up`

```bash
# این فرمان واحد همه چیز را انجام می‌دهد:
# ✅ تمام منابع آزور را ایجاد می‌کند
# ✅ شبکه و امنیت را پیکربندی می‌کند
# ✅ کد برنامه شما را می‌سازد
# ✅ به آزور استقرار می‌دهد
# ✅ به شما یک آدرس وب فعال می‌دهد
azd up
```

**همین بود!** نیازی به کلیک در پرتال Azure، یادگیری قالب‌های پیچیده ARM یا پیکربندی دستی نیست — فقط برنامه‌های در حال اجرا در Azure.

---

## ❓ Azure Developer CLI در مقابل Azure CLI: چه تفاوتی دارند؟

این رایج‌ترین سوالی است که مبتدیان می‌پرسند. پاسخ ساده این است:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Purpose** | مدیریت منابع منفرد Azure | استقرار برنامه‌های کامل |
| **Mindset** | متمرکز بر زیرساخت | متمرکز بر برنامه |
| **Example** | `az webapp create --name myapp...` | `azd up` |
| **Learning Curve** | نیاز به دانستن سرویس‌های Azure دارد | کافی است برنامه‌تان را بشناسید |
| **Best For** | DevOps، زیرساخت | توسعه‌دهندگان، نمونه‌سازی سریع |

### یک قیاس ساده

- **Azure CLI** شبیه داشتن تمام ابزارهای ساخت خانه است - چکش‌ها، اره‌ها، میخ‌ها. می‌توانید هر چیزی بسازید، اما باید ساخت‌وساز را بلد باشید.
- **Azure Developer CLI** شبیه استخدام یک پیمانکار است - توصیف می‌کنید چه می‌خواهید، و او ساخت را مدیریت می‌کند.

### چه زمانی از هر کدام استفاده کنیم

| Scenario | Use This |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### آنها با هم کار می‌کنند!

AZD از Azure CLI در زیرساخت استفاده می‌کند. می‌توانید از هر دو استفاده کنید:
```bash
# اپلیکیشن خود را با AZD مستقر کنید
azd up

# سپس منابع خاص را با Azure CLI تنظیم دقیق کنید
az webapp config set --name myapp --always-on true
```

---

## 🌟 پیدا کردن قالب‌ها در Awesome AZD

از صفر شروع نکنید! **Awesome AZD** مجموعه‌ای از قالب‌های آماده‌ی استقرار توسط جامعه است:

| Resource | Description |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | مرور بیش از 200 قالب با استقرار یک‌کلیک |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | قالب خود را به جامعه ارسال کنید |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | ستاره بزنید و منبع را کاوش کنید |

### قالب‌های محبوب هوش مصنوعی از Awesome AZD

```bash
# گفتگوی RAG با مدل‌های Microsoft Foundry + جستجوی هوش مصنوعی
azd init --template azure-search-openai-demo

# برنامه گفتگوی سریع هوش مصنوعی
azd init --template openai-chat-app-quickstart

# عامل‌های هوش مصنوعی با عامل‌های Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 شروع در 3 مرحله

قبل از شروع، مطمئن شوید ماشین شما برای قالبی که می‌خواهید مستقر کنید آماده است:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

اگر هر چک لازم ناموفق شد، ابتدا آن را برطرف کنید و سپس با شروع سریع ادامه دهید.

### مرحله 1: نصب AZD (2 دقیقه)

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

### مرحله 2: احراز هویت برای AZD

```bash
# اختیاری است اگر برنامه دارید در این دوره مستقیماً از دستورات Azure CLI استفاده کنید
az login

# برای گردش‌های کاری AZD ضروری است
azd auth login
```

اگر مطمئن نیستید کدام یک را نیاز دارید، مسیر نصب کامل را در [نصب و پیکربندی](docs/chapter-01-foundation/installation.md#authentication-setup) دنبال کنید.

### مرحله 3: اولین برنامه خود را مستقر کنید

```bash
# مقداردهی اولیه از یک قالب
azd init --template todo-nodejs-mongo

# استقرار در آزور (همه چیز را ایجاد می‌کند!)
azd up
```

**🎉 همین بود!** برنامه شما اکنون در Azure زنده است.

### پاکسازی (فراموش نکنید!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 چگونه از این دوره استفاده کنیم

این دوره برای یادگیری تدریجی طراحی شده است — از جایی که راحت هستید شروع کنید و به‌تدریج پیش بروید:

| Your Experience | Start Here |
|-----------------|------------|
| **کاملاً جدید در Azure** | [فصل 1: پایه](#-chapter-1-foundation--quick-start) |
| **Azure را می‌شناسید، با AZD جدید هستید** | [فصل 1: پایه](#-chapter-1-foundation--quick-start) |
| **می‌خواهید برنامه‌های هوش مصنوعی مستقر کنید** | [فصل 2: توسعه مبتنی بر هوش مصنوعی](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **می‌خواهید تمرین عملی داشته باشید** | [🎓 کارگاه تعاملی](workshop/README.md) - آزمایشگاه راهنمای 3-4 ساعته |
| **نیاز به الگوهای تولیدی دارید** | [فصل 8: تولید و الگوهای سازمانی](#-chapter-8-production--enterprise-patterns) |

### راه‌اندازی سریع

1. **فورک این مخزن**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **کلون کنید**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **کمک بگیرید**: [جامعه Discord Azure](https://discord.com/invite/ByRwuEEgH4)

> **ترجیح می‌دهید به‌صورت محلی کلون کنید؟**
>
> این مخزن شامل بیش از 50 ترجمه زبان است که حجم دانلود را به‌طور قابل‌توجهی افزایش می‌دهد. برای کلون کردن بدون ترجمه‌ها از sparse checkout استفاده کنید:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> این به شما همه چیز لازم برای تکمیل دوره را با دانلود بسیار سریع‌تر می‌دهد.


## مرور دوره

با فصل‌های ساختاریافته طراحی‌شده برای یادگیری تدریجی، Azure Developer CLI (azd) را فرا بگیرید. **تمرکز ویژه بر استقرار برنامه‌های هوش مصنوعی با یکپارچگی Microsoft Foundry.**
### چرا این دوره برای توسعه‌دهندگان مدرن ضروری است

براساس بینش‌های جامعهٔ Discord مایکروسافت فاندری، **45% از توسعه‌دهندگان می‌خواهند از AZD برای بارکاری‌های هوش مصنوعی استفاده کنند** اما با چالش‌هایی مواجه می‌شوند از قبیل:
- معماری‌های پیچیدهٔ هوش مصنوعی چندسرویسی
- بهترین شیوه‌های استقرار هوش مصنوعی در محیط تولید  
- یکپارچه‌سازی و پیکربندی سرویس‌های AI در Azure
- بهینه‌سازی هزینه برای بارکاری‌های هوش مصنوعی
- عیب‌یابی مسائل خاص استقرار هوش مصنوعی

### اهداف یادگیری

با تکمیل این دورهٔ ساختارمند، شما:
- **کسب مهارت در اصول AZD**: مفاهیم اصلی، نصب، و پیکربندی
- **استقرار برنامه‌های هوش مصنوعی**: استفاده از AZD همراه با سرویس‌های Microsoft Foundry
- **پیاده‌سازی زیرساخت به‌عنوان کد**: مدیریت منابع Azure با قالب‌های Bicep
- **عیب‌یابی استقرارها**: حل مشکلات رایج و دیباگ مسائل
- **بهینه‌سازی برای محیط تولید**: امنیت، مقیاس‌پذیری، مانیتورینگ، و مدیریت هزینه
- **ساخت راه‌حل‌های چندعامل**: استقرار معماری‌های پیچیدهٔ هوش مصنوعی

## قبل از شروع: حساب‌ها، دسترسی‌ها و مفروضات

قبل از شروع فصل 1، مطمئن شوید موارد زیر فراهم شده‌اند. مراحل نصب در ادامهٔ این راهنما فرض می‌کنند که این پایه‌ها قبلاً آماده شده‌اند.

- **اشتراک Azure**: می‌توانید از یک اشتراک موجود کاری یا حساب شخصی خود استفاده کنید، یا برای شروع یک [آزمایشی رایگان](https://aka.ms/azurefreetrial) ایجاد کنید.
- **دسترسی برای ایجاد منابع Azure**: برای بیشتر تمرین‌ها، باید حداقل دسترسی **Contributor** روی اشتراک یا گروه منابع مقصد داشته باشید. برخی فصل‌ها ممکن است نیز فرض کنند می‌توانید گروه‌های منابع، هویت‌های مدیریت‌شده، و تخصیص‌های RBAC ایجاد کنید.
- [**یک حساب GitHub**](https://github.com): این برای فورک کردن مخزن، پیگیری تغییرات خود، و استفاده از GitHub Codespaces برای کارگاه مفید است.
- **پیش‌نیازهای زمان اجرای قالب**: برخی قالب‌ها به ابزارهای محلی مانند Node.js، Python، Java، یا Docker نیاز دارند. قبل از شروع setup validator را اجرا کنید تا ابزارهای گم‌شده را زود متوجه شوید.
- **آشنایی پایه با ترمینال**: نیازی به متخصص بودن نیست، اما باید با اجرای فرمان‌هایی مانند `git clone`, `azd auth login`, و `azd up` راحت باشید.

> **اگر در یک اشتراک سازمانی کار می‌کنید؟**
> اگر محیط Azure شما توسط یک مدیر مدیریت می‌شود، پیشاپیش تأیید کنید که می‌توانید منابع را در اشتراک یا گروه منابعی که قصد استفاده از آن را دارید مستقر کنید. اگر نمی‌توانید، قبل از شروع برای یک اشتراک سندباکس یا دسترسی Contributor درخواست دهید.

> **تازه‌کار با Azure؟**
> با دورهٔ آزمایشی یا اشتراک پرداخت‌به‌ازای‌مصرف Azure خود در https://aka.ms/azurefreetrial شروع کنید تا بتوانید تمرین‌ها را از ابتدا تا انتها بدون انتظار برای تأییدهای سطح tenant کامل کنید.

## 🗺️ نقشهٔ دوره: ناوبری سریع بر اساس فصل

هر فصل یک README اختصاصی با اهداف یادگیری، راه‌اندازی سریع، و تمرین‌ها دارد:

| فصل | موضوع | درس‌ها | مدت زمان | پیچیدگی |
|---------|-------|---------|----------|------------|
| **[فصل 1: مبانی](docs/chapter-01-foundation/README.md)** | شروع | [اصول AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [نصب و راه‌اندازی](docs/chapter-01-foundation/installation.md) &#124; [اولین پروژه](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[فصل 2: توسعهٔ هوش مصنوعی](docs/chapter-02-ai-development/README.md)** | برنامه‌های اولویت‌دار هوش مصنوعی | [یکپارچه‌سازی Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [راهنمای عوامل هوش مصنوعی](docs/chapter-02-ai-development/agents.md) &#124; [استقرار مدل‌های هوش مصنوعی](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [کارگاه](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[فصل 3: پیکربندی](docs/chapter-03-configuration/README.md)** | احراز هویت و امنیت | [راهنمای پیکربندی](docs/chapter-03-configuration/configuration.md) &#124; [الگوهای احراز هویت و هویت‌های مدیریت‌شده](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[فصل 4: زیرساخت](docs/chapter-04-infrastructure/README.md)** | IaC و استقرار | [راهنمای استقرار](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [تخصیص منابع](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[فصل 5: چندعامل](docs/chapter-05-multi-agent/README.md)** | راه‌حل‌های عامل هوش مصنوعی | [سناریوی خرده‌فروشی](examples/retail-scenario.md) &#124; [الگوهای هماهنگی](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[فصل 6: پیش‌استقرار](docs/chapter-06-pre-deployment/README.md)** | برنامه‌ریزی و اعتبارسنجی | [بررسی‌های پیش‌پرواز](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [برنامه‌ریزی ظرفیت](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [انتخاب SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[فصل 7: عیب‌یابی](docs/chapter-07-troubleshooting/README.md)** | دیباگ و رفع مشکلات | [مسائل رایج](docs/chapter-07-troubleshooting/common-issues.md) &#124; [دیباگ](docs/chapter-07-troubleshooting/debugging.md) &#124; [مسائل هوش مصنوعی](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[فصل 8: تولید](docs/chapter-08-production/README.md)** | الگوهای سازمانی | [شیوه‌های تولید](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | آزمایشگاه عملی | [معرفی](workshop/docs/instructions/0-Introduction.md) &#124; [انتخاب](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [اعتبارسنجی](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [بازشکافی](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [پیکربندی](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [سفارشی‌سازی](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [خراب‌سازی](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [جمع‌بندی](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**مدت کل دوره:** ~10-14 hours | **پیشرفت مهارت:** Beginner → Production-Ready

---

## 📚 فصل‌های یادگیری

*مسیر یادگیری خود را بر اساس سطح تجربه و اهداف انتخاب کنید*

### 🚀 فصل 1: مبانی و شروع سریع
**پیش‌نیازها**: اشتراک Azure، دانش پایه خط فرمان  
**مدت زمان**: 30-45 دقیقه  
**پیچیدگی**: ⭐

#### آنچه خواهید آموخت
- درک اصول Azure Developer CLI
- نصب AZD بر روی پلتفرم خود
- اولین استقرار موفق شما

#### منابع آموزشی
- **🎯 از اینجا شروع کنید**: [Azure Developer CLI چیست؟](#what-is-azure-developer-cli)
- **📖 تئوری**: [اصول AZD](docs/chapter-01-foundation/azd-basics.md) - مفاهیم و اصطلاحات اصلی
- **⚙️ راه‌اندازی**: [نصب و راه‌اندازی](docs/chapter-01-foundation/installation.md) - راهنماهای مخصوص پلتفرم
- **🛠️ کار عملی**: [پروژهٔ اول شما](docs/chapter-01-foundation/first-project.md) - آموزش گام‌به‌گام
- **📋 مرجع سریع**: [برگه تقلب فرمان‌ها](resources/cheat-sheet.md)

#### تمرین‌های عملی
```bash
# بررسی سریع نصب
azd version

# اولین برنامهٔ خود را مستقر کنید
azd init --template todo-nodejs-mongo
azd up
```

**💡 نتیجهٔ فصل**: استقرار موفق یک برنامهٔ وب ساده در Azure با استفاده از AZD

**✅ معیار موفقیت:**
```bash
# پس از اتمام فصل ۱، باید بتوانید:
azd version              # نسخهٔ نصب‌شده را نمایش می‌دهد
azd init --template todo-nodejs-mongo  # پروژه را مقداردهی اولیه می‌کند
azd up                  # روی Azure مستقر می‌کند
azd show                # نشانی URL برنامه در حال اجرا را نمایش می‌دهد
# برنامه در مرورگر باز می‌شود و کار می‌کند
azd down --force --purge  # منابع را پاک‌سازی می‌کند
```

**📊 سرمایه‌گذاری زمانی:** 30-45 دقیقه  
**📈 سطح مهارت پس از آن:** قادر به استقرار برنامه‌های پایه به‌صورت مستقل
**📈 سطح مهارت پس از آن:** قادر به استقرار برنامه‌های پایه به‌صورت مستقل

---

### 🤖 فصل 2: توسعهٔ هوش مصنوعی (توصیه‌شده برای توسعه‌دهندگان هوش مصنوعی)
**پیش‌نیازها**: تکمیل فصل 1  
**مدت زمان**: 1-2 ساعت  
**پیچیدگی**: ⭐⭐

#### آنچه خواهید آموخت
- یکپارچه‌سازی Microsoft Foundry با AZD
- استقرار برنامه‌های مجهز به هوش مصنوعی
- درک پیکربندی‌های سرویس‌های هوش مصنوعی

#### منابع آموزشی
- **🎯 از اینجا شروع کنید**: [یکپارچه‌سازی Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 عوامل هوش مصنوعی**: [راهنمای عوامل هوش مصنوعی](docs/chapter-02-ai-development/agents.md) - استقرار عوامل هوشمند با AZD
- **📖 الگوها**: [استقرار مدل‌های هوش مصنوعی](docs/chapter-02-ai-development/ai-model-deployment.md) - استقرار و مدیریت مدل‌های هوش مصنوعی
- **🛠️ کارگاه**: [آزمایشگاه کارگاه AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - آماده‌سازی راه‌حل‌های هوش مصنوعی شما برای AZD
- **🎥 راهنمای تعاملی**: [مواد کارگاه](workshop/README.md) - آموزش مبتنی بر مرورگر با MkDocs * DevContainer Environment
- **📋 قالب‌ها**: [قالب‌های Microsoft Foundry](#منابع-کارگاه)
- **📝 مثال‌ها**: [مثال‌های استقرار AZD](examples/README.md)

#### تمرین‌های عملی
```bash
# اولین برنامهٔ هوش مصنوعی خود را مستقر کنید
azd init --template azure-search-openai-demo
azd up

# سایر قالب‌های هوش مصنوعی را امتحان کنید
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 نتیجهٔ فصل**: استقرار و پیکربندی یک برنامهٔ گفت‌وگوی مجهز به هوش مصنوعی با قابلیت‌های RAG

**✅ معیار موفقیت:**
```bash
# پس از فصل ۲، شما باید بتوانید:
azd init --template azure-search-openai-demo
azd up
# رابط گفتگوی هوش مصنوعی را آزمایش کنید
# سؤال بپرسید و پاسخ‌های مبتنی بر هوش مصنوعی را همراه با منابع دریافت کنید
# تأیید کنید که ادغام جستجو کار می‌کند
azd monitor  # بررسی کنید که Application Insights داده‌های تله‌متری را نشان می‌دهد
azd down --force --purge
```

**📊 سرمایه‌گذاری زمانی:** 1-2 ساعت  
**📈 سطح مهارت پس از آن:** قادر به استقرار و پیکربندی برنامه‌های هوش مصنوعی آماده‌ی تولید  
**💰 آگاهی از هزینه:** درک هزینه‌های توسعه حدود $80-150/ماه، هزینه‌های تولید $300-3500/ماه

#### 💰 ملاحظات هزینه برای استقرارهای هوش مصنوعی

**محیط توسعه (حدود $80-150/ماه):**
- مدل‌های Microsoft Foundry (پرداخت به ازای مصرف): $0-50/ماه (بسته به مصرف توکن)
- AI Search (دستهٔ Basic): $75/ماه
- Container Apps (Consumption): $0-20/ماه
- Storage (Standard): $1-5/ماه

**محیط تولید (حدود $300-3,500+/ماه):**
- مدل‌های Microsoft Foundry (PTU برای عملکرد ثابت): $3,000+/ماه OR Pay-as-go with high volume
- AI Search (دستهٔ Standard): $250/ماه
- Container Apps (Dedicated): $50-100/ماه
- Application Insights: $5-50/ماه
- Storage (Premium): $10-50/ماه

**💡 نکات بهینه‌سازی هزینه:**
- از **Free Tier** مدل‌های Microsoft Foundry برای یادگیری استفاده کنید (Azure OpenAI شامل 50,000 توکن/ماه)
- برای آزادسازی منابع زمانی که در حال توسعه فعال نیستید، `azd down` را اجرا کنید
- با صورتحساب مبتنی بر مصرف شروع کنید، و تنها برای تولید به PTU ارتقا دهید
- برای برآورد هزینه‌ها قبل از استقرار از `azd provision --preview` استفاده کنید
- مقیاس خودکار را فعال کنید: فقط برای مصرف واقعی پرداخت کنید

**پایش هزینه:**
```bash
# هزینه‌های ماهیانهٔ تخمینی را بررسی کنید
azd provision --preview

# هزینه‌های واقعی را در پرتال Azure نظارت کنید
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ فصل 3: پیکربندی و احراز هویت
**پیش‌نیازها**: تکمیل فصل 1  
**مدت زمان**: 45-60 دقیقه  
**پیچیدگی**: ⭐⭐

#### آنچه خواهید آموخت
- پیکربندی و مدیریت محیط
- بهترین شیوه‌های احراز هویت و امنیت
- نام‌گذاری و سازمان‌دهی منابع

#### منابع آموزشی
- **📖 پیکربندی**: [راهنمای پیکربندی](docs/chapter-03-configuration/configuration.md) - تنظیم محیط
- **🔐 امنیت**: [الگوهای احراز هویت و هویت‌های مدیریت‌شده](docs/chapter-03-configuration/authsecurity.md) - الگوهای احراز هویت
- **📝 مثال‌ها**: [مثال برنامهٔ پایگاه‌داده](examples/database-app/README.md) - مثال‌های پایگاه‌داده AZD

#### تمرین‌های عملی
- پیکربندی محیط‌های متعدد (dev, staging, prod)
- راه‌اندازی احراز هویت با هویت‌های مدیریت‌شده
- پیاده‌سازی پیکربندی‌های مخصوص هر محیط

**💡 نتیجهٔ فصل**: مدیریت چندین محیط با احراز هویت و امنیت مناسب

---

### 🏗️ فصل 4: زیرساخت به‌عنوان کد و استقرار
**پیش‌نیازها**: تکمیل فصل‌های 1-3  
**مدت زمان**: 1-1.5 ساعت  
**پیچیدگی**: ⭐⭐⭐

#### آنچه خواهید آموخت
- الگوهای پیشرفته استقرار
- زیرساخت به‌عنوان کد با Bicep
- راهبردهای تخصیص منابع

#### منابع آموزشی
- **📖 استقرار**: [راهنمای استقرار](docs/chapter-04-infrastructure/deployment-guide.md) - گردش‌کارهای کامل
- **🏗️ تخصیص منابع**: [تخصیص منابع](docs/chapter-04-infrastructure/provisioning.md) - مدیریت منابع Azure
- **📝 مثال‌ها**: [مثال Container App](../../examples/container-app) - استقرارهای کانتینری

#### تمرین‌های عملی
- ایجاد قالب‌های سفارشی Bicep
- استقرار برنامه‌های چندسرویسی
- پیاده‌سازی راهبردهای استقرار آبی-سبز

**💡 نتیجهٔ فصل**: استقرار برنامه‌های چندسرویسی پیچیده با استفاده از قالب‌های زیرساخت سفارشی
### 🎯 فصل ۵: راه‌حل‌های چندعامله هوش مصنوعی (پیشرفته)
**پیش‌نیازها**: فصل‌های ۱-۲ تکمیل شده  
**مدت زمان**: 2-3 ساعت  
**پیچیدگی**: ⭐⭐⭐⭐

#### آنچه خواهید آموخت
- الگوهای معماری چندعامله
- ارکستراسیون و هماهنگی عامل‌ها
- استقرارهای آماده تولید برای هوش مصنوعی

#### منابع آموزشی
- **🤖 پروژه ویژه**: [راه‌حل چندعاملی خرده‌فروشی](examples/retail-scenario.md) - پیاده‌سازی کامل
- **🛠️ قالب‌های ARM**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - استقرار یک‌کلیک
- **📖 معماری**: [الگوهای هماهنگی چندعاملی](docs/chapter-06-pre-deployment/coordination-patterns.md) - الگوها

#### تمرین‌های عملی
```bash
# استقرار کامل راه‌حل چندعاملی خرده‌فروشی
cd examples/retail-multiagent-arm-template
./deploy.sh

# پیکربندی‌های عامل را بررسی کنید
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 خروجی فصل**: استقرار و مدیریت یک راه‌حل چندعامله آماده تولید با عامل‌های مشتری و موجودی

---

### 🔍 فصل ۶: اعتبارسنجی و برنامه‌ریزی پیش از استقرار
**پیش‌نیازها**: فصل ۴ تکمیل شده  
**مدت زمان**: 1 ساعت  
**پیچیدگی**: ⭐⭐

#### آنچه خواهید آموخت
- برنامه‌ریزی ظرفیت و اعتبارسنجی منابع
- استراتژی‌های انتخاب SKU
- بررسی‌های پیش‌پرواز و خودکارسازی

#### منابع آموزشی
- **📊 برنامه‌ریزی**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - اعتبارسنجی منابع
- **💰 انتخاب**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - انتخاب‌های مقرون‌به‌صرفه
- **✅ اعتبارسنجی**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - اسکریپت‌های خودکار

#### تمرین‌های عملی
- اجرای اسکریپت‌های اعتبارسنجی ظرفیت
- بهینه‌سازی انتخاب‌های SKU برای هزینه
- پیاده‌سازی بررسی‌های خودکار پیش از استقرار

**💡 خروجی فصل**: اعتبارسنجی و بهینه‌سازی استقرارها پیش از اجرا

---

### 🚨 فصل ۷: عیب‌یابی و دیباگ
**پیش‌نیازها**: هر فصل استقرار تکمیل شده  
**مدت زمان**: 1-1.5 ساعت  
**پیچیدگی**: ⭐⭐

#### آنچه خواهید آموخت
- رویکردهای سیستماتیک برای دیباگ
- مشکلات رایج و راه‌حل‌ها
- عیب‌یابی مخصوص هوش مصنوعی

#### منابع آموزشی
- **🔧 مشکلات رایج**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - پرسش‌های متداول و راه‌حل‌ها
- **🕵️ دیباگ**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - استراتژی‌های گام‌به‌گام
- **🤖 مسائل هوش مصنوعی**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - مشکلات سرویس‌های هوش مصنوعی

#### تمرین‌های عملی
- تشخیص شکست‌های استقرار
- رفع مشکلات احراز هویت
- دیباگ اتصال سرویس‌های هوش مصنوعی

**💡 خروجی فصل**: به صورت مستقل مشکلات رایج استقرار را تشخیص و رفع کنید

---

### 🏢 فصل ۸: الگوهای تولید و سازمانی
**پیش‌نیازها**: فصل‌های ۱-۴ تکمیل شده  
**مدت زمان**: 2-3 ساعت  
**پیچیدگی**: ⭐⭐⭐⭐

#### آنچه خواهید آموخت
- استراتژی‌های استقرار در تولید
- الگوهای امنیت سازمانی
- مانیتورینگ و بهینه‌سازی هزینه

#### منابع آموزشی
- **🏭 تولید**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - الگوهای سازمانی
- **📝 مثال‌ها**: [Microservices Example](../../examples/microservices) - معماری‌های پیچیده
- **📊 مانیتورینگ**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - مانیتورینگ

#### تمرین‌های عملی
- پیاده‌سازی الگوهای امنیتی سازمانی
- راه‌اندازی مانیتورینگ جامع
- استقرار در تولید با حاکمیت مناسب

**💡 خروجی فصل**: استقرار برنامه‌های آماده سازمان با قابلیت‌های کامل تولید

---

## 🎓 مرور کلی کارگاه: تجربه یادگیری عملی

> **⚠️ وضعیت کارگاه: در حال توسعه فعال**  
> مواد کارگاه در حال توسعه و پالایش هستند. ماژول‌های اصلی عملکردی‌اند، اما برخی بخش‌های پیشرفته ناقص‌اند. ما فعالانه روی تکمیل تمام محتوا کار می‌کنیم. [Track progress →](workshop/README.md)

### مواد تعاملی کارگاه
**یادگیری عملی جامع با ابزارهای مبتنی بر مرورگر و تمرین‌های هدایت‌شده**

مواد کارگاه ما یک تجربه یادگیری ساختاریافته و تعاملی ارائه می‌دهند که مکمل برنامه درسی مبتنی بر فصل‌ها است. این کارگاه برای یادگیری خودآموز و جلسات هدایت‌شده توسط مدرس طراحی شده است.

#### 🛠️ ویژگی‌های کارگاه
- **رابط مبتنی بر مرورگر**: کارگاه کامل با MkDocs همراه با جستجو، کپی و ویژگی‌های تم
- **ادغام GitHub Codespaces**: راه‌اندازی محیط توسعه با یک کلیک
- **مسیر یادگیری ساختاریافته**: تمرین‌های هدایت‌شده در ۸ ماژول (جمعاً 3-4 ساعت)
- **روش‌شناسی پیشرونده**: معرفی → انتخاب → اعتبارسنجی → تحلیل → پیکربندی → سفارشی‌سازی → پاک‌سازی → جمع‌بندی
- **محیط تعاملی DevContainer**: ابزارها و وابستگی‌های از پیش پیکربندی‌شده

#### 📚 ساختار ماژول‌های کارگاه
این کارگاه از یک روش‌شناسی پیشرونده ۸ ماژوله پیروی می‌کند که شما را از کشف تا تسلط بر استقرار هدایت می‌کند:

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

**روند کارگاه:**
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
# در مخزن روی «Code» کلیک کنید → «Create codespace on main»

# گزینهٔ ۲: توسعهٔ محلی
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# دستورالعمل‌های راه‌اندازی در workshop/README.md را دنبال کنید
```

#### 🎯 نتایج یادگیری کارگاه
با تکمیل کارگاه، شرکت‌کنندگان خواهند توانست:
- **استقرار برنامه‌های هوش مصنوعی در تولید**: استفاده از AZD با سرویس‌های Microsoft Foundry
- **تسلط بر معماری‌های چندعامله**: پیاده‌سازی راه‌حل‌های هماهنگ عامل‌های هوش مصنوعی
- **پیاده‌سازی بهترین شیوه‌های امنیتی**: پیکربندی احراز هویت و کنترل دسترسی
- **بهینه‌سازی برای مقیاس**: طراحی استقرارهای مقرون‌به‌صرفه و عملکردی
- **عیب‌یابی استقرارها**: حل مسائل رایج به‌صورت مستقل

#### 📖 منابع کارگاه
- **🎥 راهنمای تعاملی**: [Workshop Materials](workshop/README.md) - محیط یادگیری مبتنی بر مرورگر
- **📋 دستورالعمل ماژول به ماژول**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - مرور کارگاه و اهداف
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - یافتن و انتخاب قالب‌های هوش مصنوعی
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - استقرار و اعتبارسنجی قالب‌ها
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - کاوش معماری قالب‌ها
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - تسلط بر azure.yaml
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - سفارشی‌سازی برای سناریوی شما
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - پاک‌سازی منابع
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - مرور و گام‌های بعدی
- **🛠️ آزمایشگاه کارگاه هوش مصنوعی**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - تمرین‌های متمرکز بر هوش مصنوعی
- **💡 شروع سریع**: [Workshop Setup Guide](workshop/README.md#quick-start) - پیکربندی محیط

**مناسب برای**: آموزش سازمانی، دوره‌های دانشگاهی، یادگیری خودآموز و بوت‌کمپ‌های توسعه‌دهنده.

---

## 📖 بررسی عمیق: قابلیت‌های AZD

فراتر از مبانی، AZD ویژگی‌های قدرتمندی برای استقرارهای تولیدی فراهم می‌کند:

- **استقرار مبتنی بر قالب** - استفاده از قالب‌های از پیش‌ساخته برای الگوهای رایج برنامه‌ها
- **زیرساخت به‌عنوان کد** - مدیریت منابع Azure با استفاده از Bicep یا Terraform  
- **گردش‌کارهای یکپارچه** - فراهم‌سازی، استقرار و مانیتورینگ برنامه‌ها به‌صورت یکپارچه
- **دوست‌دار توسعه‌دهنده** - بهینه‌شده برای بهره‌وری و تجربه توسعه‌دهنده

### **AZD + Microsoft Foundry: مناسب برای استقرارهای هوش مصنوعی**

**چرا AZD برای راه‌حل‌های هوش مصنوعی؟** AZD به چالش‌های اصلی توسعه‌دهندگان هوش مصنوعی پاسخ می‌دهد:

- **قالب‌های آماده برای AI** - قالب‌های از پیش پیکربندی‌شده برای Microsoft Foundry Models، Azure AI Services، و بارهای کاری ML
- **استقرارهای امن AI** - الگوهای امنیتی داخلی برای سرویس‌های هوش مصنوعی، کلیدهای API و نقطه‌های انتهایی مدل  
- **الگوهای تولیدی AI** - بهترین شیوه‌ها برای استقرار برنامه‌های هوش مصنوعی مقیاس‌پذیر و مقرون‌به‌صرفه
- **گردش‌کار انتها تا انتها برای AI** - از توسعه مدل تا استقرار تولید با مانیتورینگ مناسب
- **بهینه‌سازی هزینه** - تخصیص و استراتژی‌های مقیاس‌بندی هوشمند برای بارهای کاری AI
- **ادغام با Microsoft Foundry** - اتصال بی‌وقفه به فهرست مدل‌ها و نقطه‌های انتهایی Microsoft Foundry

---

## 🎯 کتابخانه قالب‌ها و مثال‌ها

### برجسته: قالب‌های Microsoft Foundry
**از اینجا شروع کنید اگر در حال استقرار برنامه‌های هوش مصنوعی هستید!**

> **توجه:** این قالب‌ها طیف‌های مختلفی از الگوهای هوش مصنوعی را نشان می‌دهند. برخی نمونه‌های Azure خارجی هستند و برخی پیاده‌سازی‌های محلی‌اند.

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | External |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapter 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| External |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | External |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | External |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | External |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | External |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### برجسته: سناریوهای کامل آموزشی
**قالب‌های آماده تولید نگاشت‌شده به فصل‌های آموزشی**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | Basic AI deployment patterns |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | RAG implementation with Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapter 4 | ⭐⭐ | Document Intelligence integration |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | Agent framework and function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐ | Enterprise AI orchestration |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | Multi-agent architecture with Customer and Inventory agents |

### یادگیری از طریق نوع مثال

> **📌 مثال‌های محلی در مقابل خارجی:**  
> **مثال‌های محلی** (در این مخزن) = آماده استفاده بلافاصله  
> **مثال‌های خارجی** (Azure Samples) = از مخازن لینک‌شده کلون کنید

#### مثال‌های محلی (آماده استفاده)
- [**راه‌حل چندعاملی خرده‌فروشی**](examples/retail-scenario.md) - پیاده‌سازی کامل آماده تولید با قالب‌های ARM
  - معماری چندعامله (عامل مشتری + عامل موجودی)
  - مانیتورینگ و ارزیابی جامع
  - استقرار یک‌کلیک از طریق قالب ARM

#### مثال‌های محلی - برنامه‌های کانتینری (فصل‌های 2-5)
**مثال‌های جامع استقرار کانتینر در این مخزن:**
- [**نمونه‌های برنامه Container**](examples/container-app/README.md) - راهنمای کامل برای استقرارهای کانتینری
  - [API ساده Flask](../../examples/container-app/simple-flask-api) - API پایه REST با قابلیت مقیاس تا صفر
  - [معماری میکروسرویس‌ها](../../examples/container-app/microservices) - استقرار چندسرویسی آماده تولید
  - الگوهای استقرار شروع سریع، تولید و پیشرفته
  - راهنمای پایش، امنیت و بهینه‌سازی هزینه

#### نمونه‌های خارجی - برنامه‌های ساده (فصل‌های 1-2)
**مخزن‌های Azure Samples زیر را کلون کنید تا شروع کنید:**
- [وب‌اپ ساده - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - الگوهای پایه استقرار
- [وب‌سایت ایستا - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - استقرار محتوای ایستا
- [برنامه Container - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - استقرار API REST

#### نمونه‌های خارجی - یکپارچه‌سازی پایگاه‌داده (فصل‌های 3-4)  
- [برنامه پایگاه‌داده - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - الگوهای اتصال به پایگاه‌داده
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - گردش‌کار داده بدون‌سرور

#### نمونه‌های خارجی - الگوهای پیشرفته (فصل‌های 4-8)
- [میکروسرویس‌های Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - معماری‌های چندسرویسی
- [وظایف Container Apps](https://github.com/Azure-Samples/container-apps-jobs) - پردازش پس‌زمینه  
- [خط لوله ML سازمانی](https://github.com/Azure-Samples/mlops-v2) - الگوهای ML آماده تولید

### مجموعه الگوهای خارجی
- [**گالری الگوهای رسمی AZD**](https://azure.github.io/awesome-azd/) - مجموعه‌ای گزیده از الگوهای رسمی و جامعه
- [**الگوهای Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - مستندات الگو در Microsoft Learn
- [**دایرکتوری مثال‌ها**](examples/README.md) - مثال‌های آموزشی محلی با توضیحات مفصل

---

## 📚 منابع آموزشی و مراجع

### مراجع سریع
- [**خلاصه فرمان‌ها**](resources/cheat-sheet.md) - فرمان‌های ضروری azd مرتب‌شده بر اساس فصل
- [**واژه‌نامه**](resources/glossary.md) - اصطلاحات Azure و azd  
- [**پرسش‌های متداول**](resources/faq.md) - سؤالات رایج مرتب‌شده بر اساس فصل آموزشی
- [**راهنمای مطالعه**](resources/study-guide.md) - تمرین‌های عملی جامع

### کارگاه‌های عملی
- [**کارگاه عملی AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - راه‌حل‌های هوش مصنوعی خود را قابل استقرار با AZD کنید (2-3 ساعت)
- [**کارگاه تعاملی**](workshop/README.md) - ۸ ماژول تمرین راهنمایی‌شده با MkDocs و GitHub Codespaces
  - شامل: معرفی → انتخاب → اعتبارسنجی → تجزیه → پیکربندی → سفارشی‌سازی → پاکسازی → جمع‌بندی

### منابع آموزشی خارجی
- [مستندات Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [مرکز معماری Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [محاسبه‌گر قیمت Azure](https://azure.microsoft.com/pricing/calculator/)
- [وضعیت Azure](https://status.azure.com/)

### مهارت‌های عامل‌های هوش مصنوعی برای ویرایشگر شما
- [**مهارت‌های Microsoft Azure در skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 مهارت عامل متن‌باز برای Azure AI، Foundry، استقرار، تشخیص خطا، بهینه‌سازی هزینه و بیشتر. آن‌ها را در GitHub Copilot، Cursor، Claude Code، یا هر عامل پشتیبانی‌شده نصب کنید:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 راهنمای سریع عیب‌یابی

**مسائل رایجی که مبتدیان با آن مواجه می‌شوند و راه‌حل‌های فوری:**

<details>
<summary><strong>❌ "azd: دستور یافت نشد"</strong></summary>

```bash
# ابتدا AZD را نصب کنید
# ویندوز (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# لینوکس:
curl -fsSL https://aka.ms/install-azd.sh | bash

# نصب را بررسی کنید
azd version
```
</details>

<details>
<summary><strong>❌ "هیچ اشتراکی یافت نشد" یا "اشتراک تنظیم نشده"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" یا "سهمیه تمام شده"</strong></summary>

```bash
# منطقهٔ دیگری از Azure را امتحان کنید
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
<summary><strong>❌ "azd up" در نیمه راه شکست می‌خورد</strong></summary>

```bash
# گزینه ۱: پاک‌سازی و تلاش مجدد
azd down --force --purge
azd up

# گزینه ۲: فقط زیرساخت را اصلاح کنید
azd provision

# گزینه ۳: وضعیت دقیق را بررسی کنید
azd show

# گزینه ۴: لاگ‌ها را در Azure Monitor بررسی کنید
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "احراز هویت ناموفق" یا "توکن منقضی شده"</strong></summary>

```bash
# برای AZD دوباره احراز هویت کنید
azd auth logout
azd auth login

# اختیاری: اگر در حال اجرای دستورات az هستید، Azure CLI را نیز تازه کنید
az logout
az login

# احراز هویت را بررسی کنید
az account show
```
</details>

<details>
<summary><strong>❌ "منبع از قبل وجود دارد" یا تضاد در نام‌گذاری</strong></summary>

```bash
# AZD نام‌های منحصر به فرد تولید می‌کند، اما در صورت بروز تداخل:
azd down --force --purge

# سپس با یک محیط تازه دوباره تلاش کنید.
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ استقرار الگو بیش از حد طول می‌کشد</strong></summary>

**زمان‌های انتظار معمول:**
- برنامه وب ساده: 5-10 دقیقه
- برنامه با پایگاه‌داده: 10-15 دقیقه
- برنامه‌های هوش مصنوعی: 15-25 دقیقه (تهیه منابع OpenAI کند است)

```bash
# پیشرفت را بررسی کنید
azd show

# اگر بیش از ۳۰ دقیقه گیر کردید، پورتال Azure را بررسی کنید:
azd monitor --overview
# به دنبال استقرارهای ناموفق بگردید
```
</details>

<details>
<summary><strong>❌ "اجازهٔ دسترسی داده نشده" یا "ممنوع"</strong></summary>

```bash
# نقش Azure خود را بررسی کنید
az role assignment list --assignee $(az account show --query user.name -o tsv)

# حداقل به نقش «Contributor» نیاز دارید
# از مدیر Azure خود بخواهید تا موارد زیر را اعطا کند:
# - «Contributor» (برای منابع)
# - «User Access Administrator» (برای تخصیص نقش‌ها)
```
</details>

<details>
<summary><strong>❌ نمی‌توان URL برنامه استقرار‌یافته را پیدا کرد</strong></summary>

```bash
# نمایش همه نقاط انتهایی سرویس‌ها
azd show

# یا پرتال آژور را باز کنید
azd monitor

# یک سرویس خاص را بررسی کنید
azd env get-values
# به دنبال متغیرهای *_URL بگردید
```
</details>

### 📚 منابع کامل عیب‌یابی

- **راهنمای مسائل رایج:** [راه‌حل‌های دقیق](docs/chapter-07-troubleshooting/common-issues.md)
- **مسائل مخصوص AI:** [عیب‌یابی AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **راهنمای اشکال‌زدایی:** [اشکال‌زدایی گام‌به‌گام](docs/chapter-07-troubleshooting/debugging.md)
- **دریافت کمک:** [Discord آژور](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 اتمام دوره و گواهی‌نامه

### پیگیری پیشرفت
پیشرفت یادگیری خود را در هر فصل دنبال کنید:

- [ ] **فصل 1**: مبانی و شروع سریع ✅
- [ ] **فصل 2**: توسعه مبتنی بر AI ✅  
- [ ] **فصل 3**: پیکربندی و احراز هویت ✅
- [ ] **فصل 4**: زیرساخت به‌عنوان کد و استقرار ✅
- [ ] **فصل 5**: راه‌حل‌های AI چندعاملی ✅
- [ ] **فصل 6**: اعتبارسنجی و برنامه‌ریزی پیش از استقرار ✅
- [ ] **فصل 7**: عیب‌یابی و اشکال‌زدایی ✅
- [ ] **فصل 8**: الگوهای تولید و سازمانی ✅

### اعتبارسنجی یادگیری
پس از تکمیل هر فصل، دانش خود را با موارد زیر تایید کنید:
1. **تمرین عملی**: استقرار عملی فصل را کامل کنید
2. **بررسی دانش**: بخش پرسش‌های متداول فصل خود را مرور کنید
3. **بحث در جامعه**: تجربه خود را در Discord آژور به اشتراک بگذارید
4. **فصل بعدی**: به سطح پیچیدگی بعدی بروید

### مزایای اتمام دوره
پس از تکمیل همه فصل‌ها، شما خواهید داشت:
- **تجربه عملی تولید**: برنامه‌های واقعی هوش مصنوعی را در Azure مستقر کرده‌اید
- **مهارت‌های حرفه‌ای**: توانایی‌های استقرار آماده سازمانی  
- **شناخت جامعه**: عضو فعال جامعه توسعه‌دهندگان Azure
- **پیشرفت شغلی**: تخصص مورد نیاز در استقرار AZD و AI

---

## 🤝 جامعه و پشتیبانی

### دریافت کمک و پشتیبانی
- **مسائل فنی**: [گزارش باگ‌ها و درخواست قابلیت](https://github.com/microsoft/azd-for-beginners/issues)
- **سؤالات یادگیری**: [جامعه Discord مایکروسافت آژور](https://discord.gg/microsoft-azure) و [![Discord Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **کمک مخصوص AI**: به [![Discord Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) بپیوندید
- **مستندات**: [مستندات رسمی Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### بینش‌های جامعه از Discord Microsoft Foundry

**نتایج نظرسنجی اخیر از کانال #Azure:**
- **45%** از توسعه‌دهندگان می‌خواهند از AZD برای بارهای کاری AI استفاده کنند
- **چالش‌های اصلی**: استقرارهای چندسرویسی، مدیریت اعتبارنامه‌ها، آماده‌سازی برای تولید  
- **پربازخواست‌ترین‌ها**: الگوهای مخصوص AI، راهنماهای عیب‌یابی، بهترین شیوه‌ها

**برای پیوستن به جامعه ما:**
- تجربیات AZD + AI خود را به اشتراک بگذارید و کمک بگیرید
- دسترسی به پیش‌نمایش‌های اولیه الگوهای جدید AI داشته باشید
- سهیم شدن در بهترین شیوه‌های استقرار AI
- تاثیرگذاری بر توسعه ویژگی‌های آینده AI + AZD

### مشارکت در دوره
ما از مشارکت‌ها استقبال می‌کنیم! لطفاً برای جزئیات راهنمای [مشارکت](CONTRIBUTING.md) را بخوانید:
- **بهبود محتوا**: فصل‌ها و مثال‌های موجود را بهبود دهید
- **مثال‌های جدید**: سناریوها و الگوهای دنیای واقعی را اضافه کنید  
- **ترجمه**: به حفظ پشتیبانی چندزبانه کمک کنید
- **گزارش باگ**: دقت و وضوح را بهبود بخشید
- **استانداردهای جامعه**: از دستورالعمل‌های جامعه‌ی فراگیر ما پیروی کنید

---

## 📄 اطلاعات دوره

### مجوز
این پروژه تحت مجوز MIT قرار دارد - برای جزئیات فایل [LICENSE](../../LICENSE) را ببینید.

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
 
### Generative AI Series
[![Generative AI برای مبتدیان](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![هوش مولد (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### یادگیری پایه‌ای
[![یادگیری ماشین برای مبتدیان](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![علم داده برای مبتدیان](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![هوش مصنوعی برای مبتدیان](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![امنیت سایبری برای مبتدیان](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![توسعه وب برای مبتدیان](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![اینترنت اشیاء برای مبتدیان](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![توسعه XR برای مبتدیان](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### مجموعه Copilot
[![Copilot برای برنامه‌نویسی مشارکتی با هوش مصنوعی](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot برای C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![ماجراجویی Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ ناوبری دوره

**🚀 آماده شروع یادگیری هستید؟**

**مبتدی‌ها**: از [فصل 1: مبانی و شروع سریع](#-chapter-1-foundation--quick-start) شروع کنید  
**توسعه‌دهندگان AI**: بروید به [فصل 2: توسعه مبتنی بر هوش مصنوعی](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**توسعه‌دهندگان باتجربه**: با [فصل 3: پیکربندی و احراز هویت](#️-chapter-3-configuration--authentication) شروع کنید

**گام‌های بعدی**: [شروع فصل 1 - مبانی AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->