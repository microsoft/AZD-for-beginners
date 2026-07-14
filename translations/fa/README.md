# AZD برای مبتدی‌ها: یک مسیر یادگیری ساختاریافته

![AZD-for-beginners](../../translated_images/fa/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### ترجمه‌های خودکار (همیشه به‌روز)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](./README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **ترجیح می‌دهید به صورت محلی کلون کنید؟**
>
> این مخزن شامل بیش از ۵۰ ترجمه زبان است که به طور قابل توجهی حجم دانلود را افزایش می‌دهد. برای کلون کردن بدون ترجمه‌ها، از sparse checkout استفاده کنید:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (ویندوز):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> این به شما همه چیز لازم برای تکمیل دوره را با دانلودی بسیار سریع‌تر می‌دهد.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 چه چیز جدیدی در azd امروز است

> 📌 این دوره با **`azd 1.27.1`** (جولای ۲۰۲۶) اعتبارسنجی شده است. نسخه خود را با `azd version` بررسی کنید، و با `azd upgrade` آخرین نسخه را بگیرید.

Azure Developer CLI فراتر از برنامه‌های وب سنتی و APIها رشد کرده است. امروز، azd ابزار واحد برای استقرار **هر** برنامه‌ای در آزور است — از جمله برنامه‌های هوش مصنوعی و عوامل هوشمند.

این یعنی برای شما:

- **عوامل هوش مصنوعی اکنون بارهای کاری اصلی azd هستند.** می‌توانید پروژه‌های عامل هوش مصنوعی را با همان روند `azd init` → `azd up` که قبلاً می‌شناسید، مقداردهی اولیه، مستقر و مدیریت کنید.
- **چرخه عمر کامل عامل از طریق CLI.** افزونه `azure.ai.agents` اکنون کل مسیر را پوشش می‌دهد — `azd ai agent init` برای اسکافلد، `azd ai agent invoke` برای تست (با خروجی زمان پاسخ)، `azd ai agent eval generate` و `azd ai agent optimize` برای سنجش و بهبود کیفیت، و `azd ai agent delete` برای پاکسازی.
- **بلاک‌های ساختمانی بیشتر برای هوش مصنوعی.** افزونه‌های پیش‌نمایش جدید — `azure.ai.skills` و `azure.ai.connections` — به شما اجازه می‌دهند که مهارت‌های قابل استفاده مجدد عامل و اتصالات Foundry را مستقیماً با azd مدیریت کنید.
- **ادغام Microsoft Foundry** مستقیماً استقرار مدل، میزبانی عامل و پیکربندی سرویس هوش مصنوعی را به اکوسیستم قالب azd می‌آورد.
- **اصول روزمره صاف‌تر.** نسخه‌های اخیر `azd init` را ایزومورفیک (ایمن برای اجرای مجدد) کرده‌اند، `azd auth login` را طوری ساخته‌اند که به صورت خودکار توکن‌های قدیمی را پاک کند، و یک راه‌اندازی دوستانه اولیه `azd tool` اضافه کرده‌اند.
- **روند اصلی تغییر نکرده است.** چه یک برنامه todo، یک میکروسرویس، یا یک راه حل هوش مصنوعی چندعاملی مستقر کنید، دستورات همانند گذشته است.

> **نکته برای کاربران Aspire:** مایکروسافت اکنون محصول را ساده "Aspire" (قبلاً ".NET Aspire") می‌نامد. پشتیبانی azd از Aspire تغییر نکرده است — فقط نام به‌روز شده است.

اگر قبلاً از azd استفاده کرده باشید، پشتیبانی AI گسترشی طبیعی است — نه ابزار جدا یا مسیر پیشرفته. اگر تازه شروع می‌کنید، یک روند کاری یاد می‌گیرید که برای همه چیز کار می‌کند.

---

## 🚀 Azure Developer CLI (azd) چیست؟

**Azure Developer CLI (azd)** ابزاری خط فرمان دوستانه برای توسعه‌دهندگان است که ساده می‌کند استقرار برنامه‌ها در آزور را. به جای ایجاد دستی و اتصال ده‌ها منبع آزور، می‌توانید کل برنامه‌ها را با یک دستور مستقر کنید.

### جادوی `azd up`

```bash
# این دستور تنها همه کارها را انجام می‌دهد:
# ✅ همه منابع آزور را ایجاد می‌کند
# ✅ شبکه و امنیت را پیکربندی می‌کند
# ✅ کد برنامه شما را می‌سازد
# ✅ در آزور مستقر می‌کند
# ✅ یک آدرس URL کاری به شما می‌دهد
azd up
```

**همین است!** کلیک در پورتال آزور لازم نیست، قالب‌های پیچیده ARM نیازی به یادگیری ندارند، پیکربندی دستی لازم نیست — فقط برنامه‌های کار کرده روی آزور.

---

## ❓ تفاوت Azure Developer CLI با Azure CLI چیست؟

این رایج‌ترین سوالی است که مبتدیان می‌پرسند. پاسخ ساده این است:

| ویژگی | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **هدف** | مدیریت منابع منفرد آزور | استقرار برنامه‌های کامل |
| **ذهنیت** | تمرکز بر زیرساخت | تمرکز بر برنامه |
| **مثال** | `az webapp create --name myapp...` | `azd up` |
| **شیب یادگیری** | باید خدمات آزور را بلد باشید | فقط برنامه خود را بشناسید |
| **مناسب برای** | DevOps، زیرساخت | توسعه‌دهندگان، نمونه‌سازی سریع |

### تشبیه ساده

- **Azure CLI** مثل داشتن همه ابزارهای ساخت خانه است—چکش‌ها، اره‌ها، میخ‌ها. می‌توانید هر چیزی بسازید، اما باید ساخت‌وساز را بلد باشید.
- **Azure Developer CLI** مثل استخدام یک پیمانکار است—شما آنچه می‌خواهید را توصیف می‌کنید و آن‌ها ساخت را انجام می‌دهند.

### کی از هرکدام استفاده کنیم

| سناریو | از این استفاده کنید |
|----------|----------|
| "می‌خواهم وب اپم را سریع مستقر کنم" | `azd up` |
| "فقط نیاز به ساخت یک حساب ذخیره‌سازی دارم" | `az storage account create` |
| "دارم یک برنامه هوش مصنوعی کامل می‌سازم" | `azd init --template azure-search-openai-demo` |
| "نیاز دارم یک منبع خاص آزور را اشکال‌زدایی کنم" | `az resource show` |
| "می‌خواهم استقرار آماده تولید در چند دقیقه داشته باشم" | `azd up --environment production` |

### آن‌ها با هم کار می‌کنند!

AZD از Azure CLI در پس‌زمینه استفاده می‌کند. شما می‌توانید هر دو را استفاده کنید:
```bash
# برنامه خود را با AZD مستقر کنید
azd up

# سپس منابع خاص را با Azure CLI بهینه‌سازی کنید
az webapp config set --name myapp --always-on true
```

---

## 🌟 قالب‌ها را در Awesome AZD پیدا کنید

از صفر شروع نکنید! **Awesome AZD** مجموعه‌ای از قالب‌های آماده برای استقرار است:

| منبع | توضیح |
|----------|-------------|
| 🔗 [**گالری Awesome AZD**](https://azure.github.io/awesome-azd/) | مرور بیش از ۲۰۰ قالب با یک کلیک استقرار |
| 🔗 [**ارسال قالب**](https://github.com/Azure/awesome-azd/issues) | قالب خود را به جامعه اضافه کنید |
| 🔗 [**مخزن GitHub**](https://github.com/Azure/awesome-azd) | ستاره بدهید و منبع را بررسی کنید |

### قالب‌های محبوب هوش مصنوعی از Awesome AZD

```bash
# گفتگوی RAG با مدل‌های Microsoft Foundry + جستجوی هوش مصنوعی
azd init --template azure-search-openai-demo

# برنامه چت سریع هوش مصنوعی
azd init --template openai-chat-app-quickstart

# عامل‌های هوش مصنوعی با عامل‌های Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 شروع در ۳ مرحله

قبل از شروع، مطمئن شوید ماشین شما برای قالبی که می‌خواهید مستقر کنید آماده است:

**ویندوز:**
```powershell
.\validate-setup.ps1
```

**macOS / لینوکس:**
```bash
bash ./validate-setup.sh
```

اگر هر بررسی موردنیاز رد شد، ابتدا آن را رفع کنید و سپس با شروع سریع ادامه دهید.

### مرحله ۱: نصب AZD (۲ دقیقه)

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

### مرحله ۲: احراز هویت برای AZD

```bash
# اختیاری اگر قصد دارید دستورات Azure CLI را مستقیماً در این دوره استفاده کنید
az login

# لازم برای گردش‌های کاری AZD
azd auth login
```

اگر مطمئن نیستید کدام را نیاز دارید، روند کامل راه‌اندازی را در [نصب و راه‌اندازی](docs/chapter-01-foundation/installation.md#authentication-setup) دنبال کنید.

### مرحله ۳: اولین برنامه خود را مستقر کنید

```bash
# مقداردهی اولیه از یک قالب
azd init --template todo-nodejs-mongo

# استقرار در آزور (همه چیز را ایجاد می‌کند!)
azd up
```

**🎉 تمام شد!** برنامه شما اکنون روی آزور زنده است.

### پاکسازی (فراموش نکنید!)

```bash
# حذف تمام منابع پس از اتمام آزمایش
azd down --force --purge
```

---

## 📚 چگونه از این دوره استفاده کنیم

این دوره برای **یادگیری مرحله‌ای** طراحی شده است - از جایی که راحت‌اید شروع کنید و به تدریج بالا بیایید:

| تجربه شما | از اینجا شروع کنید |
|-----------------|------------|
| **کاملاً تازه‌کار در آزور** | [فصل ۱: پایه‌ها](#-chapter-1-foundation--quick-start) |
| **آژور را می‌شناسید، azd تازه‌کارید** | [فصل ۱: پایه‌ها](#-chapter-1-foundation--quick-start) |
| **می‌خواهید برنامه‌های هوش مصنوعی مستقر کنید** | [فصل ۲: توسعه AI-اول](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **می‌خواهید تمرین عملی کنید** | [🎓 کارگاه تعاملی](workshop/README.md) - آزمایشگاه راهنمای ۳-۴ ساعته |
| **نیاز به الگوهای تولید دارید** | [فصل ۸: تولید و سازمانی](#-chapter-8-production--enterprise-patterns) |

### راه‌اندازی سریع

1. **مخزن را فورک کنید**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **کلون کنید**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **کمک بگیرید**: [جامعه Discord آزور](https://discord.com/invite/ByRwuEEgH4)

> **ترجیح می‌دهید به صورت محلی کلون کنید؟**

> این مخزن شامل بیش از ۵۰ ترجمه زبان است که به طور قابل توجهی حجم دانلود را افزایش می‌دهد. برای کلون کردن بدون ترجمه‌ها، از sparse checkout استفاده کنید:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> این به شما همه چیز لازم برای تکمیل دوره را با دانلودی بسیار سریع‌تر می‌دهد.


## مرور کلی دوره

آژور دِولوپر CLI (azd) را از طریق فصل‌های ساختاریافته‌ای که برای یادگیری مرحله‌ای طراحی شده‌اند، یاد بگیرید. **تمرکز ویژه بر استقرار برنامه‌های هوش مصنوعی با ادغام Microsoft Foundry.**


### چرا این دوره برای توسعه‌دهندگان مدرن ضروری است  

بر اساس دیدگاه‌های جامعه Discord مایکروسافت فاندری، **۴۵٪ توسعه‌دهندگان می‌خواهند از AZD برای بارهای کاری هوش مصنوعی استفاده کنند** اما با چالش‌های زیر مواجه هستند:  
- معماری‌های پیچیده چندسرویسی هوش مصنوعی  
- بهترین شیوه‌های استقرار هوش مصنوعی در محیط تولید  
- یکپارچه‌سازی و پیکربندی سرویس‌های هوش مصنوعی Azure  
- بهینه‌سازی هزینه برای بارهای کاری هوش مصنوعی  
- عیب‌یابی مسائل خاص استقرار هوش مصنوعی  

### اهداف یادگیری  

با سپری کردن این دوره ساختاریافته، شما:  
- **اصول AZD را مسلط می‌شوید**: مفاهیم اصلی، نصب و پیکربندی  
- **برنامه‌های هوش مصنوعی را مستقر می‌کنید**: استفاده از AZD با خدمات مایکروسافت فاندری  
- **زیرساخت را به عنوان کد پیاده‌سازی می‌کنید**: مدیریت منابع Azure با قالب‌های Bicep  
- **عیب‌یابی استقرارها**: حل مشکلات رایج و رفع خطاها  
- **برای محیط تولید بهینه‌سازی می‌کنید**: امنیت، مقیاس‌پذیری، پایش و مدیریت هزینه  
- **راهکارهای چندعامل را می‌سازید**: استقرار معماری‌های پیچیده هوش مصنوعی  

## پیش از شروع: حساب‌ها، دسترسی‌ها و فرضیات  

پیش از شروع فصل ۱، مطمئن شوید موارد زیر را دارید. مراحل نصب بعدی این راهنما فرض می‌کند این موارد پایه قبلاً آماده شده‌اند.  

- **یک اشتراک Azure**: می‌توانید از اشتراک موجود کار یا حساب خود استفاده کنید یا یک [آزمایش رایگان](https://aka.ms/azurefreetrial) ایجاد کنید.  
- **اجازه ایجاد منابع Azure**: برای اکثر تمرین‌ها، باید حداقل دسترسی **Contributor** روی اشتراک یا گروه منبع هدف داشته باشید. برخی فصل‌ها ممکن است فرض کنند می‌توانید گروه منبع، هویت‌های مدیریت‌شده و انتساب‌های RBAC ایجاد کنید.  
- [**یک حساب GitHub**](https://github.com): برای فورک کردن مخزن، ردیابی تغییرات شخصی و استفاده از GitHub Codespaces برای کارگاه مفید است.  
- **پیش‌نیازهای اجرای قالب‌ها**: بعضی قالب‌ها نیاز به ابزارهای محلی مثل Node.js، Python، Java یا Docker دارند. پیش از شروع اعتبارسنج راه‌اندازی را اجرا کنید تا ابزارهای ناقص را زود متوجه شوید.  
- **آشنایی پایه با ترمینال**: لازم نیست حرفه‌ای باشید اما باید راحت باشید که دستوراتی مانند `git clone`، `azd auth login` و `azd up` را اجرا کنید.  

> **در یک اشتراک سازمانی کار می‌کنید؟**  
> اگر محیط Azure شما توسط مدیر کنترل می‌شود، پیشاپیش اطمینان حاصل کنید می‌توانید منابع را در اشتراک یا گروه منبعی که قصد استفاده دارید مستقر کنید. در غیر این صورت، پیش از شروع درخواست اشتراک فضای تمرینی یا دسترسی Contributor بدهید.  

> **با Azure تازه‌کار هستید؟**  
> با آزمایش رایگان Azure خود یا اشتراک پرداخت بر اساس مصرف در https://aka.ms/azurefreetrial شروع کنید تا تمرین‌ها را از ابتدا تا انتها بدون انتظار تایید روی سطوح سازمانی انجام دهید.  

## 🗺️ نقشه دوره: ناوبری سریع بر اساس فصل  

هر فصل دارای README اختصاصی با اهداف یادگیری، شروع سریع و تمرین‌ها است:  

| فصل | موضوع | درس‌ها | مدت | پیچیدگی |  
|---------|-------|---------|----------|------------|  
| **[فصل ۱: پایه](docs/chapter-01-foundation/README.md)** | شروع به کار | [مفاهیم AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [نصب](docs/chapter-01-foundation/installation.md) &#124; [اولین پروژه](docs/chapter-01-foundation/first-project.md) | ۳۰-۴۵ دقیقه | ⭐ |  
| **[فصل ۲: توسعه هوش مصنوعی](docs/chapter-02-ai-development/README.md)** | برنامه‌های هوش مصنوعی | [یکپارچه‌سازی فاندری](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [عامل‌های هوش مصنوعی](docs/chapter-02-ai-development/agents.md) &#124; [استقرار مدل](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [کارگاه](docs/chapter-02-ai-development/ai-workshop-lab.md) | ۱-۲ ساعت | ⭐⭐ |  
| **[فصل ۳: پیکربندی](docs/chapter-03-configuration/README.md)** | احراز هویت و امنیت | [پیکربندی](docs/chapter-03-configuration/configuration.md) &#124; [احراز هویت و امنیت](docs/chapter-03-configuration/authsecurity.md) | ۴۵-۶۰ دقیقه | ⭐⭐ |  
| **[فصل ۴: زیرساخت](docs/chapter-04-infrastructure/README.md)** | IaC و استقرار | [راهنمای استقرار](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [تأمین منابع](docs/chapter-04-infrastructure/provisioning.md) | ۱-۱.۵ ساعت | ⭐⭐⭐ |  
| **[فصل ۵: چندعامل](docs/chapter-05-multi-agent/README.md)** | راهکارهای عامل هوش مصنوعی | [سناریوی فروشگاه](examples/retail-scenario.md) &#124; [الگوهای هماهنگی](docs/chapter-06-pre-deployment/coordination-patterns.md) | ۲-۳ ساعت | ⭐⭐⭐⭐ |  
| **[فصل ۶: پیش از استقرار](docs/chapter-06-pre-deployment/README.md)** | برنامه‌ریزی و اعتبارسنجی | [بررسی‌های مقدماتی](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [برنامه‌ریزی ظرفیت](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [انتخاب SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | ۱ ساعت | ⭐⭐ |  
| **[فصل ۷: عیب‌یابی](docs/chapter-07-troubleshooting/README.md)** | دیباگ و رفع مشکلات | [مسائل رایج](docs/chapter-07-troubleshooting/common-issues.md) &#124; [دیباگ](docs/chapter-07-troubleshooting/debugging.md) &#124; [مسائل هوش مصنوعی](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | ۱-۱.۵ ساعت | ⭐⭐ |  
| **[فصل ۸: تولید](docs/chapter-08-production/README.md)** | الگوهای سازمانی | [شیوه‌های تولید](docs/chapter-08-production/production-ai-practices.md) | ۲-۳ ساعت | ⭐⭐⭐⭐ |  
| **[🎓 کارگاه](workshop/README.md)** | آزمایش عملی | [مقدمه](workshop/docs/instructions/0-Introduction.md) &#124; [انتخاب](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [اعتبارسنجی](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [شکستن قالب](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [پیکربندی](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [سفارشی‌سازی](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [جمع‌آوری](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [خلاصه](workshop/docs/instructions/7-Wrap-up.md) | ۳-۴ ساعت | ⭐⭐ |  

**مدت کل دوره:** تقریباً ۱۰-۱۴ ساعت | **پیشرفت مهارت:** مبتدی → آماده تولید  

---  

## 📚 فصل‌های یادگیری  

*مسیر یادگیری خود را بر اساس سطح تجربه و اهداف انتخاب کنید*  

### 🚀 فصل ۱: پایه و شروع سریع  
**پیش‌نیازها**: اشتراک Azure، آشنایی پایه با خط فرمان  
**مدت زمان**: ۳۰-۴۵ دقیقه  
**پیچیدگی**: ⭐  

#### آنچه یاد می‌گیرید  
- درک اصول Azure Developer CLI  
- نصب AZD روی پلتفرم خود  
- اولین استقرار موفق شما  

#### منابع یادگیری  
- **🎯 از اینجا شروع کنید**: [Azure Developer CLI چیست؟](#what-is-azure-developer-cli)  
- **📖 نظریه**: [مفاهیم AZD](docs/chapter-01-foundation/azd-basics.md) - مفاهیم و اصطلاحات پایه  
- **⚙️ نصب و راه‌اندازی**: [نصب و راه‌اندازی](docs/chapter-01-foundation/installation.md) - راهنماهای اختصاصی پلتفرم  
- **🛠️ عملی**: [اولین پروژه](docs/chapter-01-foundation/first-project.md) - آموزش گام‌به‌گام  
- **📋 مرجع سریع**: [برگه تقلب دستورات](resources/cheat-sheet.md)  

#### تمرین‌های عملی  
```bash
# بررسی سریع نصب
azd version

# برنامه اول خود را استقرار دهید
azd init --template todo-nodejs-mongo
azd up
```
  
**💡 نتایج فصل**: موفقیت در استقرار یک برنامه وب ساده روی Azure با استفاده از AZD  

**✅ معیار تایید موفقیت:**  
```bash
# پس از اتمام فصل ۱، شما باید بتوانید:
azd version              # نسخه نصب شده را نمایش می‌دهد
azd init --template todo-nodejs-mongo  # پروژه را مقداردهی اولیه می‌کند
azd up                  # به Azure مستقر می‌کند
azd show                # آدرس اینترنتی برنامه در حال اجرا را نمایش می‌دهد
# برنامه در مرورگر باز می‌شود و کار می‌کند
azd down --force --purge  # منابع را پاکسازی می‌کند
```
  
**📊 زمان مورد نیاز:** ۳۰-۴۵ دقیقه  
**📈 سطح مهارت پس از دوره:** قادر به استقرار مستقل برنامه‌های پایه  
**📈 سطح مهارت پس از دوره:** قادر به استقرار مستقل برنامه‌های پایه  

---  

### 🤖 فصل ۲: توسعه هوش مصنوعی (توصیه شده برای توسعه‌دهندگان هوش مصنوعی)  
**پیش‌نیازها**: فصل ۱ کامل شده باشد  
**مدت زمان**: ۱-۲ ساعت  
**پیچیدگی**: ⭐⭐  

#### آنچه یاد می‌گیرید  
- یکپارچه‌سازی مایکروسافت فاندری با AZD  
- استقرار برنامه‌های هوش مصنوعی  
- درک پیکربندی سرویس‌های هوش مصنوعی  

#### منابع یادگیری  
- **🎯 از اینجا شروع کنید**: [یکپارچه‌سازی مایکروسافت فاندری](docs/chapter-02-ai-development/microsoft-foundry-integration.md)  
- **🤖 عوامل هوش مصنوعی**: [راهنمای عوامل هوش مصنوعی](docs/chapter-02-ai-development/agents.md) - استقرار عوامل هوشمند با AZD  
- **📖 الگوها**: [استقرار مدل هوش مصنوعی](docs/chapter-02-ai-development/ai-model-deployment.md) - استقرار و مدیریت مدل‌های هوش مصنوعی  
- **🛠️ کارگاه**: [کارگاه هوش مصنوعی](docs/chapter-02-ai-development/ai-workshop-lab.md) - آماده سازی راهکارهای هوش مصنوعی برای AZD  
- **🎥 راهنمای تعاملی**: [مواد کارگاه](workshop/README.md) - یادگیری مبتنی بر مرورگر با MkDocs * محیط DevContainer  
- **📋 قالب‌ها**: [قالب‌های مایکروسافت فاندری](#منابع-کارگاه)  
- **📝 نمونه‌ها**: [نمونه‌های استقرار AZD](examples/README.md)  

#### تمرین‌های عملی  
```bash
# اولین برنامه هوش مصنوعی خود را استقرار دهید
azd init --template azure-search-openai-demo
azd up

# قالب‌های هوش مصنوعی بیشتری را امتحان کنید
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```
  
**💡 نتایج فصل**: استقرار و پیکربندی برنامه چت هوش مصنوعی با قابلیت‌های RAG  

**✅ معیار تایید موفقیت:**  
```bash
# پس از فصل ۲، شما باید بتوانید:
azd init --template azure-search-openai-demo
azd up
# رابط چت هوش مصنوعی را آزمایش کنید
# سوال بپرسید و پاسخ‌های مبتنی بر هوش مصنوعی با منابع دریافت کنید
# اطمینان حاصل کنید که یکپارچگی جستجو کار می‌کند
azd monitor  # بررسی کنید که Application Insights تله‌متری را نشان می‌دهد
azd down --force --purge
```
  
**📊 زمان مورد نیاز:** ۱-۲ ساعت  
**📈 سطح مهارت پس از دوره:** توانایی استقرار و پیکربندی برنامه‌های هوش مصنوعی آماده تولید  
**💰 آگاهی هزینه‌ها:** درک هزینه‌های توسعه ۸۰-۱۵۰ دلار در ماه، هزینه‌های تولید ۳۰۰-۳۵۰۰ دلار در ماه  

#### 💰 ملاحظات هزینه برای استقرارهای هوش مصنوعی  

**محیط توسعه (برآورد ۸۰-۱۵۰ دلار/ماه):**  
- مدل‌های مایکروسافت فاندری (پرداخت به اندازه مصرف): ۰-۵۰ دلار در ماه (بر اساس مصرف توکن)  
- جستجوی هوش مصنوعی (سطح پایه): ۷۵ دلار در ماه  
- برنامه‌های Container (مصرفی): ۰-۲۰ دلار در ماه  
- ذخیره‌سازی (استاندارد): ۱-۵ دلار در ماه  

**محیط تولید (برآورد ۳۰۰-۳۵۰۰+ دلار/ماه):**  
- مدل‌های مایکروسافت فاندری (PTU برای عملکرد ثابت): ۳۰۰۰+ دلار در ماه یا پرداخت بر اساس مصرف با حجم بالا  
- جستجوی هوش مصنوعی (سطح استاندارد): ۲۵۰ دلار در ماه  
- برنامه‌های Container (اختصاصی): ۵۰-۱۰۰ دلار در ماه  
- Application Insights: ۵-۵۰ دلار در ماه  
- ذخیره‌سازی (پریمیوم): ۱۰-۵۰ دلار در ماه  

**💡 نکات بهینه‌سازی هزینه:**  
- از مدل‌های مایکروسافت فاندری **سطح رایگان** برای یادگیری استفاده کنید (Azure OpenAI با ۵۰،۰۰۰ توکن در ماه همراه است)  
- هنگام عدم توسعه فعال، با دستور `azd down` منابع را آزاد کنید  
- با صورت‌حساب مبتنی بر مصرف شروع کنید، فقط برای تولید به PTU ارتقا دهید  
- از دستور `azd provision --preview` برای برآورد هزینه‌ها پیش از استقرار استفاده کنید  
- مقیاس‌بندی خودکار را فعال کنید: تنها برای مصرف واقعی هزینه پرداخت کنید  

**پایش هزینه:**  
```bash
# بررسی هزینه‌های ماهانه تخمینی
azd provision --preview

# نظارت بر هزینه‌های واقعی در پرتال آزور
az consumption budget list --resource-group <your-rg>
```
  
---  

### ⚙️ فصل ۳: پیکربندی و احراز هویت  
**پیش‌نیازها**: فصل ۱ کامل شده باشد  
**مدت زمان**: ۴۵-۶۰ دقیقه  
**پیچیدگی**: ⭐⭐  

#### آنچه یاد می‌گیرید  
- پیکربندی و مدیریت محیط  
- بهترین شیوه‌های احراز هویت و امنیت  
- نامگذاری و سازماندهی منابع  

#### منابع یادگیری  
- **📖 پیکربندی**: [راهنمای پیکربندی](docs/chapter-03-configuration/configuration.md) - راه‌اندازی محیط  
- **🔐 امنیت**: [الگوهای احراز هویت و هویت مدیریت‌شده](docs/chapter-03-configuration/authsecurity.md) - الگوهای احراز هویت  
- **📝 نمونه‌ها**: [نمونه برنامه پایگاه داده](examples/database-app/README.md) - نمونه‌های پایگاه داده AZD  

#### تمرین‌های عملی  
- پیکربندی چندین محیط (توسعه، مرحله‌بندی، تولید)  
- راه‌اندازی احراز هویت هویت مدیریت‌شده  
- پیاده‌سازی پیکربندی‌های مخصوص هر محیط  

**💡 نتایج فصل**: مدیریت چند محیط با احراز هویت و امنیت مناسب  

---  

### 🏗️ فصل ۴: زیرساخت به عنوان کد و استقرار  
**پیش‌نیازها**: فصل‌های ۱ تا ۳ کامل شده باشد  
**مدت زمان**: ۱-۱.۵ ساعت  
**پیچیدگی**: ⭐⭐⭐  

#### آنچه یاد می‌گیرید  
- الگوهای پیشرفته استقرار  
- زیرساخت به عنوان کد با Bicep  
- استراتژی‌های تأمین منابع  

#### منابع یادگیری  
- **📖 استقرار**: [راهنمای استقرار](docs/chapter-04-infrastructure/deployment-guide.md) - جریان کاری کامل  
- **🏗️ تأمین منابع**: [تأمین منابع](docs/chapter-04-infrastructure/provisioning.md) - مدیریت منابع Azure  
- **📝 نمونه‌ها**: [نمونه برنامه Container](../../examples/container-app) - استقرارهای کانتینری شده  

#### تمرین‌های عملی  
- ایجاد قالب‌های Bicep سفارشی  
- استقرار برنامه‌های چندسرویسی  
- پیاده‌سازی استراتژی‌های استقرار آبی-سبز  

**💡 نتایج فصل**: استقرار برنامه‌های پیچیده چندسرویسی با استفاده از قالب‌های زیرساخت سفارشی  

---  


### 🎯 فصل ۵: راهکارهای هوش مصنوعی چندعاملی (پیشرفته)
**پیش‌نیازها**: تکمیل فصل‌های ۱ و ۲  
**مدت زمان**: ۲-۳ ساعت  
**پیچیدگی**: ⭐⭐⭐⭐

#### آنچه خواهید آموخت
- الگوهای معماری چندعاملی
- هماهنگی و ارکستراسیون عوامل
- استقرار آماده تولید هوش مصنوعی

#### منابع آموزشی
- **🤖 پروژه منتخب**: [راهکار چندعاملی خرده‌فروشی](examples/retail-scenario.md) - پیاده‌سازی کامل
- **🛠️ قالب‌های ARM**: [بسته قالب ARM](../../examples/retail-multiagent-arm-template) - استقرار با یک کلیک
- **📖 معماری**: [الگوهای هماهنگی چندعاملی](docs/chapter-06-pre-deployment/coordination-patterns.md) - الگوها

#### تمرین‌های عملی
```bash
# استقرار راه‌حل چندعامله کامل خرده‌فروشی
cd examples/retail-multiagent-arm-template
./deploy.sh

# بررسی پیکربندی‌های عامل‌ها
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 نتیجه فصل**: استقرار و مدیریت راهکار هوش مصنوعی چندعاملی آماده تولید با عوامل مشتری و موجودی

---

### 🔍 فصل ۶: اعتبارسنجی و برنامه‌ریزی پیش از استقرار
**پیش‌نیازها**: تکمیل فصل ۴  
**مدت زمان**: ۱ ساعت  
**پیچیدگی**: ⭐⭐

#### آنچه خواهید آموخت
- برنامه‌ریزی ظرفیت و اعتبارسنجی منابع
- استراتژی‌های انتخاب SKU
- بررسی‌های پیش از پرواز و اتوماسیون

#### منابع آموزشی
- **📊 برنامه‌ریزی**: [برنامه‌ریزی ظرفیت](docs/chapter-06-pre-deployment/capacity-planning.md) - اعتبارسنجی منابع
- **💰 انتخاب**: [انتخاب SKU](docs/chapter-06-pre-deployment/sku-selection.md) - انتخاب‌های مقرون به صرفه
- **✅ اعتبارسنجی**: [بررسی‌های پیش پرواز](docs/chapter-06-pre-deployment/preflight-checks.md) - اسکریپت‌های خودکار

#### تمرین‌های عملی
- اجرای اسکریپت‌های اعتبارسنجی ظرفیت
- بهینه‌سازی انتخاب‌های SKU برای کاهش هزینه
- پیاده‌سازی بررسی‌های اتوماتیک پیش از استقرار

**💡 نتیجه فصل**: اعتبارسنجی و بهینه‌سازی استقرارها قبل از اجرا

---

### 🚨 فصل ۷: عیب‌یابی و دیباگ
**پیش‌نیازها**: تکمیل هر فصل استقرار  
**مدت زمان**: ۱-۱.۵ ساعت  
**پیچیدگی**: ⭐⭐

#### آنچه خواهید آموخت
- رویکردهای سیستماتیک دیباگ
- مشکلات رایج و راه‌حل‌ها
- عیب‌یابی مخصوص هوش مصنوعی

#### منابع آموزشی
- **🔧 مشکلات رایج**: [مشکلات رایج](docs/chapter-07-troubleshooting/common-issues.md) - پرسش‌های متداول و راه‌حل‌ها
- **🕵️ راهنمای دیباگ**: [راهنمای دیباگ](docs/chapter-07-troubleshooting/debugging.md) - راهبردهای گام به گام
- **🤖 مشکلات هوش مصنوعی**: [عیب‌یابی مخصوص AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - مشکلات سرویس‌های هوش مصنوعی

#### تمرین‌های عملی
- تشخیص خطاهای استقرار
- رفع مشکلات احراز هویت
- دیباگ اتصال سرویس‌های AI

**💡 نتیجه فصل**: توانایی مستقل عیب‌یابی و رفع مشکلات معمول استقرار

---

### 🏢 فصل ۸: الگوهای تولید و سازمانی
**پیش‌نیازها**: تکمیل فصل‌های ۱ تا ۴  
**مدت زمان**: ۲-۳ ساعت  
**پیچیدگی**: ⭐⭐⭐⭐

#### آنچه خواهید آموخت
- استراتژی‌های استقرار تولید
- الگوهای امنیت سازمانی
- مانیتورینگ و بهینه‌سازی هزینه

#### منابع آموزشی
- **🏭 تولید**: [بهترین روش‌های AI تولید](docs/chapter-08-production/production-ai-practices.md) - الگوهای سازمانی
- **📝 نمونه‌ها**: [نمونه‌های میکروسرویس](../../examples/microservices) - معماری‌های پیچیده
- **📊 مانیتورینگ**: [یکپارچه‌سازی Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - مانیتورینگ

#### تمرین‌های عملی
- پیاده‌سازی الگوهای امنیت سازمانی
- راه‌اندازی مانیتورینگ جامع
- استقرار در تولید با حاکمیت صحیح

**💡 نتیجه فصل**: استقرار برنامه‌های سازمانی آماده تولید با تمامی قابلیت‌ها

---

## 🎓 مرور کارگاه: تجربه عملی یادگیری

> **⚠️ وضعیت کارگاه: در حال توسعه فعال**  
> محتوای کارگاه هم‌اکنون در حال توسعه و بهینه‌سازی است. ماژول‌های اصلی عملکرد دارند ولی برخی بخش‌های پیشرفته کامل نشده‌اند. در حال تلاش برای تکمیل همه محتوا هستیم. [پیگیری پیشرفت →](workshop/README.md)

### مواد تعاملی کارگاه
**تجربه یادگیری عملی جامع با ابزارهای مبتنی بر مرورگر و تمرین‌های راهنمایی شده**

مواد کارگاه یک تجربه تعاملی ساختاریافته فراهم می‌کند که مکمل برنامه درسی فصلی فوق است. کارگاه برای یادگیری خودسرانه و جلسات با مربی طراحی شده است.

#### 🛠️ ویژگی‌های کارگاه
- **رابط مبتنی بر مرورگر**: کارگاه کامل با MkDocs و امکانات جستجو، کپی و تم‌ها
- **یکپارچه‌سازی GitHub Codespaces**: راه‌اندازی محیط توسعه با یک کلیک
- **مسیر یادگیری ساختاریافته**: ۸ ماژول تمرینی راهنمایی شده (۳-۴ ساعت مجموع)
- **روش‌شناسی پیش‌رونده**: مقدمه → انتخاب → اعتبارسنجی → تجزیه→ پیکربندی → شخصی‌سازی → پاک‌سازی → جمع‌بندی
- **محیط تعاملی DevContainer**: ابزارها و وابستگی‌های پیش‌پیکربندی شده

#### 📚 ساختار ماژول‌های کارگاه
کارگاه از **روش‌شناسی پیش‌رونده ۸ ماژوله** پیروی می‌کند که شما را از کشف تا تسلط بر استقرار می‌برد:

| ماژول | موضوع | کاری که انجام می‌دهید | مدت زمان |
|--------|-------|----------------|----------|
| **0. مقدمه** | مرور کارگاه | درک اهداف یادگیری، پیش‌نیازها و ساختار کارگاه | ۱۵ دقیقه |
| **1. انتخاب** | کشف قالب | کاوش قالب‌های AZD و انتخاب قالب هوش مصنوعی مناسب سناریو | ۲۰ دقیقه |
| **2. اعتبارسنجی** | استقرار و بررسی | استقرار قالب با `azd up` و اعتبارسنجی کارکرد زیرساخت | ۳۰ دقیقه |
| **3. تجزیه** | درک ساختار | استفاده از GitHub Copilot برای بررسی معماری قالب، فایل‌های Bicep و سازماندهی کد | ۳۰ دقیقه |
| **4. پیکربندی** | بررسی عمیق azure.yaml | تسلط بر پیکربندی `azure.yaml`، هوک‌های چرخه عمر و متغیرهای محیطی | ۳۰ دقیقه |
| **5. شخصی‌سازی** | سفارشی‌سازی | فعال‌سازی جستجوی AI، ردیابی، ارزیابی و سفارشی‌سازی برای سناریوی شما | ۴۵ دقیقه |
| **6. پاک‌سازی** | تمیزکاری | حذف امن منابع با `azd down --purge` | ۱۵ دقیقه |
| **7. جمع‌بندی** | گام‌های بعدی | مرور دستاوردها، مفاهیم کلیدی و ادامه مسیر یادگیری | ۱۵ دقیقه |

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
# گزینه ۱: گیت‌هاب کد‌اسپیسز (توصیه شده)
# روی "Code" کلیک کنید → "Create codespace on main" در مخزن

# گزینه ۲: توسعه محلی
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# دستورالعمل‌های نصب در workshop/README.md را دنبال کنید
```

#### 🎯 نتایج یادگیری کارگاه
با تکمیل کارگاه، شرکت‌کنندگان قادر خواهند بود:
- **استقرار برنامه‌های هوش مصنوعی تولیدی**: استفاده از AZD با سرویس‌های Microsoft Foundry
- **تسلط بر معماری چندعاملی**: پیاده‌سازی راهکارهای هماهنگ عوامل هوشمند
- **پیاده‌سازی بهترین شیوه‌های امنیتی**: پیکربندی احراز هویت و کنترل دسترسی
- **بهینه‌سازی مقیاس‌پذیری**: طراحی استقرارهای مقرون به صرفه و کارا
- **عیب‌یابی استقرارها**: حل مستقل مشکلات متداول

#### 📖 منابع کارگاه
- **🎥 راهنمای تعاملی**: [مواد کارگاه](workshop/README.md) - محیط یادگیری مبتنی بر مرورگر
- **📋 دستورالعمل هر ماژول**:
  - [0. مقدمه](workshop/docs/instructions/0-Introduction.md) - مرور و اهداف کارگاه
  - [1. انتخاب](workshop/docs/instructions/1-Select-AI-Template.md) - یافتن و انتخاب قالب‌های هوش مصنوعی
  - [2. اعتبارسنجی](workshop/docs/instructions/2-Validate-AI-Template.md) - استقرار و بررسی قالب‌ها
  - [3. تجزیه](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - بررسی معماری قالب
  - [4. پیکربندی](workshop/docs/instructions/4-Configure-AI-Template.md) - تسلط بر azure.yaml
  - [5. شخصی‌سازی](workshop/docs/instructions/5-Customize-AI-Template.md) - سفارشی‌سازی سناریو
  - [6. پاک‌سازی](workshop/docs/instructions/6-Teardown-Infrastructure.md) - تمیزکاری منابع
  - [7. جمع‌بندی](workshop/docs/instructions/7-Wrap-up.md) - مرور و گام‌های بعدی
- **🛠️ آزمایشگاه کارگاه AI**: [آزمایشگاه کارگاه AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - تمرین‌های متمرکز بر AI
- **💡 شروع سریع**: [راهنمای راه‌اندازی کارگاه](workshop/README.md#quick-start) - پیکربندی محیط

**مناسب برای**: آموزش‌های شرکتی، دوره‌های دانشگاهی، یادگیری خودسرانه و بوت‌کمپ‌های توسعه‌دهنده.

---

## 📖 کاوش عمیق: قابلیت‌های AZD

فراتر از مبانی، AZD امکانات قدرتمندی برای استقرار تولید ارائه می‌دهد:

- **استقرار بر اساس قالب‌ها** - استفاده از قالب‌های پیش‌ساخته برای الگوهای رایج برنامه‌ها
- **زیرساخت به عنوان کد** - مدیریت منابع Azure با Bicep یا Terraform  
- **گردش‌های کاری یکپارچه** - فراهم‌آوری، استقرار و مانیتورینگ برنامه‌ها به صورت یکپارچه
- **دوستدار توسعه‌دهنده** - بهینه شده برای بهره‌وری و تجربه توسعه‌دهنده

### **AZD + Microsoft Foundry: مناسب برای استقرارهای AI**

**چرا AZD برای راهکارهای AI؟** AZD به چالش‌های اصلی توسعه‌دهندگان AI پاسخ می‌دهد:

- **قالب‌های آماده AI** - قالب‌های پیش‌پیکربندی شده برای مدل‌های Microsoft Foundry، سرویس‌های Azure AI و بارهای کاری ML
- **استقرارهای امن AI** - الگوهای امنیتی ساخته شده برای سرویس‌های AI، کلیدهای API و نقاط پایان مدل  
- **الگوهای تولید AI** - بهترین روش‌ها برای استقرارهای مقیاس‌پذیر و مقرون به صرفه برنامه‌های AI
- **گردش کار کامل AI** - از توسعه مدل تا استقرار تولید با مانیتورینگ صحیح
- **بهینه‌سازی هزینه** - تخصیص منابع هوشمند و استراتژی‌های مقیاس‌دهی برای بارهای کاری AI
- **یکپارچه‌سازی Microsoft Foundry** - اتصال یکپارچه به کاتالوگ مدل و نقاط پایان Microsoft Foundry

---

## 🎯 کتابخانه قالب‌ها و نمونه‌ها

### نمونه‌های منتخب: قالب‌های Microsoft Foundry
**اگر قصد استقرار برنامه‌های AI را دارید، از اینجا شروع کنید!**

> **توجه:** این قالب‌ها الگوهای مختلف AI را نشان می‌دهند. برخی نمونه‌های خارجی Azure هستند، برخی پیاده‌سازی‌های محلی.

| قالب | فصل | پیچیدگی | خدمات | نوع |
|----------|---------|------------|----------|------|
| [**شروع با چت AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | فصل ۲ | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | خارجی |
| [**شروع با عوامل AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | فصل ۲ | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| خارجی |
| [**دموی Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | فصل ۲ | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | خارجی |
| [**شروع سریع برنامه چت OpenAI**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | فصل ۲ | ⭐ | AzureOpenAI + Container Apps + Application Insights | خارجی |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | فصل ۵ | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | خارجی |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | فصل ۸ | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | خارجی |
| [**راهکار چندعاملی خرده‌فروشی**](examples/retail-scenario.md) | فصل ۵ | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **محلی** |

### نمونه‌های منتخب: سناریوهای آموزشی کامل
**قالب‌های برنامه آماده تولید مطابق با فصل‌های آموزشی**

| قالب | فصل آموزشی | پیچیدگی | نکته کلیدی یادگیری |
|----------|------------------|------------|--------------|
| [**شروع سریع برنامه چت openai**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | فصل ۲ | ⭐ | الگوهای ابتدایی استقرار AI |
| [**دموی azure-search-openai**](https://github.com/Azure-Samples/azure-search-openai-demo) | فصل ۲ | ⭐⭐ | پیاده‌سازی RAG با Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | فصل ۴ | ⭐⭐ | یکپارچه‌سازی Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | فصل ۵ | ⭐⭐⭐ | چارچوب عامل و فراخوانی توابع |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | فصل ۸ | ⭐⭐⭐ | ارکستراسیون هوش مصنوعی سازمانی |
| [**راهکار چندعاملی خرده‌فروشی**](examples/retail-scenario.md) | فصل ۵ | ⭐⭐⭐⭐ | معماری چندعاملی با عوامل مشتری و موجودی |

### یادگیری بر اساس نوع نمونه

> **📌 نمونه‌های محلی در مقابل خارجی:**  
> **نمونه‌های محلی** (در این مخزن) = آماده استفاده فوری  
> **نمونه‌های خارجی** (نمونه‌های Azure) = کلون از مخازن مرتبط

#### نمونه‌های محلی (آماده استفاده)
- [**راهکار چندعاملی خرده‌فروشی**](examples/retail-scenario.md) - پیاده‌سازی کامل آماده تولید با قالب‌های ARM
  - معماری چندعاملی (عوامل مشتری + موجودی)
  - مانیتورینگ و ارزیابی جامع
  - استقرار با یک کلیک از طریق قالب ARM

#### نمونه‌های محلی - برنامه‌های کانتینری (فصل‌های ۲ تا ۵)
**نمونه‌های جامع استقرار کانتینر در این مخزن:**

- [**نمونه‌های برنامه کانتینری**](examples/container-app/README.md) - راهنمای کامل استقرارهای کانتینری
  - [API ساده Flask](../../examples/container-app/simple-flask-api) - API REST پایه با قابلیت مقیاس‌پذیری صفر
  - [معماری میکروسرویس‌ها](../../examples/container-app/microservices) - استقرار چندخدمتی آماده تولید
  - الگوهای شروع سریع، تولید و پیشرفته استقرار
  - راهنمایی‌های مانیتورینگ، امنیت و بهینه‌سازی هزینه

#### نمونه‌های خارجی - برنامه‌های ساده (فصل‌های ۱-۲)
**برای شروع این مخازن نمونه Azure را کلون کنید:**
- [برنامه وب ساده - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - الگوهای پایه استقرار
- [وب‌سایت ایستا - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - استقرار محتوای ایستا
- [برنامه کانتینر - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - استقرار API REST

#### نمونه‌های خارجی - یکپارچه‌سازی پایگاه داده (فصل‌های ۳-۴)  
- [برنامه پایگاه داده - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - الگوهای اتصال پایگاه داده
- [توابع + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - جریان داده بدون سرور

#### نمونه‌های خارجی - الگوهای پیشرفته (فصل‌های ۴-۸)
- [میکروسرویس‌های جاوا](https://github.com/Azure-Samples/java-microservices-aca-lab) - معماری چندخدمتی
- [مشاغل برنامه‌های کانتینر](https://github.com/Azure-Samples/container-apps-jobs) - پردازش پس‌زمینه  
- [خط لوله ML سازمانی](https://github.com/Azure-Samples/mlops-v2) - الگوهای آماده تولید ML

### مجموعه قالب‌های خارجی
- [**گالری قالب رسمی AZD**](https://azure.github.io/awesome-azd/) - مجموعه گردآوری شده قالب‌های رسمی و جامعه
- [**قالب‌های Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - مستندات قالب مایکروسافت لرن
- [**فهرست نمونه‌ها**](examples/README.md) - نمونه‌های آموزشی محلی با توضیحات مفصل

---

## 📚 منابع یادگیری و مراجع

### مراجع سریع
- [**برگه تقلب دستورات**](resources/cheat-sheet.md) - دستورات اساسی azd سازماندهی شده بر اساس فصل
- [**واژه‌نامه**](resources/glossary.md) - اصطلاحات Azure و azd  
- [**سؤالات متداول**](resources/faq.md) - پرسش‌های رایج سازمان‌یافته بر اساس فصل‌های آموزشی
- [**راهنمای مطالعه**](resources/study-guide.md) - تمرین‌های جامع

### کارگاه‌های عملی
- [**کارگاه آزمایشگاه AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - راه‌اندازی راه‌حل‌های AI خود برای استقرار با AZD (۲-۳ ساعت)
- [**کارگاه تعاملی**](workshop/README.md) - تمرین‌های ۸ ماژوله با MkDocs و GitHub Codespaces
  - پیروی از: معرفی → انتخاب → اعتبارسنجی → تحلیل → پیکربندی → سفارشی‌سازی → جمع‌بندی → پایان

### منابع یادگیری خارجی
- [مستندات Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [مرکز معماری Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [ماشین حساب قیمت Azure](https://azure.microsoft.com/pricing/calculator/)
- [وضعیت Azure](https://status.azure.com/)

### مهارت‌های عامل AI برای ویرایشگر شما
- [**مهارت‌های Microsoft Azure در skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - ۳۷ مهارت عامل باز متن برای AI Azure، Foundry، استقرار، تشخیص، بهینه‌سازی هزینه و بیشتر. آن‌ها را در GitHub Copilot، Cursor، Claude Code یا هر عامل پشتیبانی شده نصب کنید:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 راهنمای سریع عیب‌یابی

**مشکلات رایج مبتدیان و راه‌حل‌های فوری:**

<details>
<summary><strong>❌ "فرمان azd پیدا نشد"</strong></summary>

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
<summary><strong>❌ "اشتراک یافت نشد" یا "اشتراک تنظیم نشده"</strong></summary>

```bash
# فهرست اشتراک‌های موجود
az account list --output table

# تنظیم اشتراک پیش‌فرض
az account set --subscription "<subscription-id-or-name>"

# تنظیم برای محیط AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# تأیید اعتبار
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" یا "حد اعتبار مصرف شده"</strong></summary>

```bash
# آزمایش منطقه‌های مختلف Azure
azd env set AZURE_LOCATION "westus2"
azd up

# یا استفاده از SKUهای کوچکتر در توسعه
# ویرایش infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ مشکل در میانه اجرای دستور "azd up"</strong></summary>

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
<summary><strong>❌ "خطای احراز هویت" یا "توکن منقضی شده"</strong></summary>

```bash
# مجدداً تأیید هویت برای AZD
azd auth logout
azd auth login

# اختیاری: اگر فرمان‌های az را اجرا می‌کنید، Azure CLI را نیز به‌روزرسانی کنید
az logout
az login

# تایید صحت احراز هویت
az account show
```
</details>

<details>
<summary><strong>❌ "منبع از قبل وجود دارد" یا تعارض نام‌ها</strong></summary>

```bash
# AZD نام‌های منحصر به فرد تولید می‌کند، اما در صورت تداخل:
azd down --force --purge

# سپس با محیط جدید دوباره تلاش کنید
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ استقرار قالب‌ها بیش از حد طول می‌کشد</strong></summary>

**زمان انتظار معمول:**
- برنامه وب ساده: ۵-۱۰ دقیقه
- برنامه با پایگاه داده: ۱۰-۱۵ دقیقه
- برنامه‌های AI: ۱۵-۲۵ دقیقه (راه‌اندازی OpenAI کند است)

```bash
# بررسی پیشرفت
azd show

# اگر بیش از ۳۰ دقیقه گیر کردید، پورتال Azure را بررسی کنید:
azd monitor --overview
# به دنبال استقرارهای ناموفق بگردید
```
</details>

<details>
<summary><strong>❌ "دسترسی ممنوع" یا "عدم اجازه"</strong></summary>

```bash
# نقش Azure خود را بررسی کنید
az role assignment list --assignee $(az account show --query user.name -o tsv)

# حداقل به نقش "همکار" نیاز دارید
# از مدیر Azure خود بخواهید تا اعطا کند:
# - همکار (برای منابع)
# - مدیر دسترسی کاربران (برای تخصیص نقش‌ها)
```
</details>

<details>
<summary><strong>❌ نمی‌توان آدرس برنامه مستقر شده را پیدا کرد</strong></summary>

```bash
# نمایش تمام نقاط انتهایی سرویس
azd show

# یا باز کردن پرتال آزور
azd monitor

# بررسی سرویس خاص
azd env get-values
# جستجو برای متغیرهای *_URL
```
</details>

### 📚 منابع کامل عیب‌یابی

- **راهنمای مشکلات رایج:** [راه‌حل‌های دقیق](docs/chapter-07-troubleshooting/common-issues.md)
- **مسائل خاص AI:** [عیب‌یابی AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **راهنمای اشکال‌زدایی:** [اشکال‌زدایی گام به گام](docs/chapter-07-troubleshooting/debugging.md)
- **کمک بگیرید:** [Discord Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 پایان دوره و گواهی‌نامه

### پیگیری پیشرفت
پیشرفت یادگیری خود را در هر فصل دنبال کنید:

- [ ] **فصل ۱**: پایه و شروع سریع ✅
- [ ] **فصل ۲**: توسعه هوش مصنوعی محور ✅  
- [ ] **فصل ۳**: پیکربندی و احراز هویت ✅
- [ ] **فصل ۴**: زیرساخت به عنوان کد و استقرار ✅
- [ ] **فصل ۵**: راهکارهای چندعاملی AI ✅
- [ ] **فصل ۶**: اعتبارسنجی و برنامه‌ریزی پیش از استقرار ✅
- [ ] **فصل ۷**: عیب‌یابی و اشکال‌زدایی ✅
- [ ] **فصل ۸**: الگوهای تولید و سازمانی ✅

### تأیید یادگیری
پس از پایان هر فصل، دانش خود را تأیید کنید با:
1. **تمرین عملی**: تکمیل استقرار عملی فصل
2. **بررسی دانش**: مرور بخش سؤالات متداول فصل شما
3. **بحث جامعه**: اشتراک تجربه خود در Discord Azure
4. **فصل بعدی**: رفتن به سطح پیچیدگی بعدی

### مزایای پایان دوره
بعد از اتمام همه فصل‌ها، شما خواهید داشت:
- **تجربه تولید**: برنامه‌های واقعی AI مستقر شده در Azure
- **مهارت‌های حرفه‌ای**: توانایی استقرار آماده سازمان  
- **شناخت جامعه**: عضو فعال جامعه توسعه‌دهندگان Azure
- **پیشرفت شغلی**: تخصص‌های پرتقاضای AZD و استقرار AI

---

## 🤝 جامعه و پشتیبانی

### گرفتن کمک و پشتیبانی
- **مسائل فنی**: [گزارش اشکال و درخواست ویژگی](https://github.com/microsoft/azd-for-beginners/issues)
- **سؤالات یادگیری**: [جامعه Discord Microsoft Azure](https://discord.gg/microsoft-azure) و [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **کمک خاص AI**: به [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) بپیوندید
- **مستندات**: [مستندات رسمی Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### بینش‌های جامعه از Microsoft Foundry Discord

**نتایج نظرسنجی اخیر از کانال #Azure:**
- **۴۵٪** از توسعه‌دهندگان می‌خواهند AZD را برای بارهای کاری AI استفاده کنند
- **چالش‌های اصلی**: استقرار چندخدمتی، مدیریت اعتبارنامه، آمادگی تولید  
- **بیشترین درخواست‌ها**: قالب‌های خاص AI، راهنمایی‌های عیب‌یابی، بهترین شیوه‌ها

**به جامعه ما بپیوندید تا:**
- تجربیات AZD + AI خود را به اشتراک بگذارید و کمک بگیرید
- به نسخه‌های پیش‌نمایش اولیه قالب‌های جدید AI دسترسی داشته باشید
- به بهبود بهترین شیوه‌های استقرار AI کمک کنید
- به توسعه ویژگی‌های آینده AI + AZD تأثیر بگذارید

### مشارکت در دوره
ما مشارکت‌ها را خوش‌آمد می‌گوییم! لطفاً راهنمای [مشارکت](CONTRIBUTING.md) ما را برای جزئیات درباره:
- **بهبود محتوا**: ارتقاء فصل‌ها و نمونه‌های موجود
- **نمونه‌های جدید**: افزودن سناریوها و قالب‌های واقعی  
- **ترجمه**: کمک به حفظ پشتیبانی چندزبانه
- **گزارش اشکال**: بهبود دقت و وضوح
- **استانداردهای جامعه**: پیروی از دستورالعمل‌های فراگیر جامعه ما

---

## 📄 اطلاعات دوره

### مجوز
این پروژه تحت مجوز MIT است - برای جزئیات به فایل [LICENSE](../../LICENSE) مراجعه کنید.

### منابع مرتبط یادگیری مایکروسافت

تیم ما دوره‌های جامع دیگری نیز تولید می‌کند:

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
 
### سری AI مولد
[![AI مولد برای مبتدیان](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI مولد (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![AI مولد (جاوا)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

[![هوش مصنوعی تولیدی (جاوااسکریپت)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### آموزش اصلی
[![یادگیری ماشین برای تازه‌کارها](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![علم داده برای تازه‌کارها](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![هوش مصنوعی برای تازه‌کارها](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![امنیت سایبری برای تازه‌کارها](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![توسعه وب برای تازه‌کارها](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![اینترنت اشیاء برای تازه‌کارها](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![توسعه XR برای تازه‌کارها](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### سری کوپایلوت
[![کوپایلوت برای برنامه‌نویسی جفتی با هوش مصنوعی](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![کوپایلوت برای C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![ماجراجویی کوپایلوت](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ ناوبری دوره

**🚀 آماده شروع یادگیری هستید؟**

**تازه‌کارها**: با [فصل 1: پایه و شروع سریع](#-chapter-1-foundation--quick-start) شروع کنید  
**توسعه‌دهندگان هوش مصنوعی**: به [فصل 2: توسعه هوش مصنوعی محور](#-chapter-2-ai-first-development-recommended-for-ai-developers) بروید  
**توسعه‌دهندگان باتجربه**: با [فصل 3: پیکربندی و احراز هویت](#️-chapter-3-configuration--authentication) شروع کنید

**گام‌های بعدی**: [شروع فصل 1 - مبانی AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->