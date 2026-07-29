# تغییرات - AZD برای مبتدیان

## مقدمه

این چنجلاگ کلیه تغییرات، به‌روزرسانی‌ها و بهبودهای قابل توجه در مخزن AZD برای مبتدیان را مستندسازی می‌کند. ما اصول نسخه‌بندی معنایی را دنبال کرده و این گزارش را نگه می‌داریم تا به کاربران کمک کنیم تفاوت‌های بین نسخه‌ها را درک کنند.

## اهداف یادگیری

با مرور این چنجلاگ، شما قادر خواهید بود:
- از ویژگی‌ها و محتواهای جدید مطلع بمانید
- بهبودهای اعمال شده در مستندات موجود را درک کنید
- اصلاحات و رفع اشکالات را دنبال کنید تا دقت تضمین شود
- روند تکامل مواد آموزشی را در طول زمان رصد کنید

## نتایج یادگیری

پس از بررسی ورودی‌های چنجلاگ، شما خواهید توانست:
- محتوا و منابع جدید موجود برای یادگیری را شناسایی کنید
- بخش‌هایی که به‌روزرسانی یا بهبود یافته‌اند را درک کنید
- مسیر یادگیری خود را بر اساس جدیدترین مواد برنامه‌ریزی کنید
- بازخورد و پیشنهادات برای بهبودهای آینده ارائه دهید

## تاریخچه نسخه‌ها

### [v3.23.0] - 2026-07-13

#### تازه‌سازی AZD 1.27.1: به‌روزرسانی نسخه مرجع
**این نسخه دوره را با `azd` نسخه `1.27.1` (ژوئیه ۲۰۲۶، جدیدترین نسخه پایدار) و افزونه نمایشی فعلی عامل هوش مصنوعی `azure.ai.agents` نسخه `1.0.0-beta.5` دوباره تایید می‌کند، و بعد از انتشارهای 1.26.0، 1.27.0 و 1.27.1، همه بنرهای “مورد تایید” را به‌روز می‌کند.**

#### تغییرات
- **✅ مبنای اعتبارسنجی به‌روزرسانی شد** از `azd 1.25.6` (ژوئن ۲۰۲۶) به `azd 1.27.1` (ژوئیه ۲۰۲۶) در README اصلی، تمام READMEهای فصل‌ها، درس کانتینر توسعه فصل ۱ (شامل مثال‌های نسخه ثابت)، درس قالب‌های سفارشی فصل ۴، درس چندعاملی فصل ۵ و مستندات ورکشاپ
- **🤖 مبنای فصل ۲ تازه شد** از `azd 1.23.12` (مارس ۲۰۲۶) به `azd 1.27.1` در `agents.md`، `ai-model-deployment.md`، `ai-workshop-lab.md` و `microsoft-foundry-integration.md`؛ تاریخ‌های یادداشت اعتبارسنجی به 2026-07-13 به‌روزرسانی شدند
- **🧩 نسخه افزونه عامل هوش مصنوعی افزایش یافت** از `azure.ai.agents` نسخه `0.1.40-preview`/`0.1.18-preview` به نسخه فعلی `1.0.0-beta.5` در README فصل ۲ و `agents.md`
- **🧪 مثال اعتبارسنجی ورکشاپ** (خروجی `azd version`) به `1.27.1` به‌روزرسانی شد

#### یادداشت‌ها درباره انتشارهای مهم azd (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** پشتیبانی Go برای Azure Functions روی مصرف انعطاف‌پذیر، فیلترهای اشتراک به ازای هر مستأجر با دستور `azd config sub-filter`، بسته‌های افزونه خودکفا (`azd x pack --bundle`)، و نصب ابزار `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** مدل‌سازی پروژه‌ها/عوامل Azure AI Foundry مستقیماً در `azure.yaml` (شروع بدون Bicep و Terraform)، پشتیبانی از استقرار کانتینر برای App Service (با گزینه `host: appservice` و `language: docker`)، گزینه مستقیم `-s/--source` برای دستورات `azd extension` و دستور `azd tool uninstall`
- **1.27.1 (2026-07-09):** افزودن گزینه `--no-dependencies` برای `azd extension install`، حذف مدل‌های منسوخ شده از کاتالوگ و پنجره‌های تخصیص کوتا به طور پیش‌فرض، و چندین رفع اشکال

#### فایل‌های به‌روزرسانی‌شده
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - 2026-06-16

#### پر کردن شکاف مبتدی شماره ۲: تهیه قالب، کانتینرهای توسعه، Pulumi، Azure DevOps، حساب‌های سرویس و موارد بیشتر
**این نسخه شکاف‌های باقی‌مانده میانی که توسط تحلیل پوشش azd شناسایی شده بود را پر می‌کند: چگونه قالب خود را ایجاد و منتشر کنید، محیط‌های قابل تکرار کانتینر توسعه/Codespaces، فراهم‌کننده زیرساخت Pulumi، مرور CI/CD در Azure DevOps، احراز هویت حساب‌های سرویس، راهنمای انتخاب میزبان (AKS/Spring Apps)، توضیح `azd restore`/`azd package`، مدیریت خطا در هوک‌ها، و روش‌های استفاده تیمی/محیط مشترک.**

#### افزوده‌شده
- **🧱 درس جدید فصل ۴** `docs/chapter-04-infrastructure/custom-templates.md` — نگارش قالب azd خود: ساختار مورد نیاز (`azure.yaml`، `infra/`، `src/`)، فیلد `metadata.template`، پارامتردهی زیرساخت با توکن منبع `uniqueString()` و برچسب `azd-env-name`، آزمون محلی با `azd init --template <local-path>`، انتشار در GitHub و ارسال به گالری Awesome AZD
- **📦 درس جدید فصل ۱** `docs/chapter-01-foundation/dev-containers.md` — محیط‌های قابل تکرار azd با Dev Containers و GitHub Codespaces: یک فایل کمینه `.devcontainer/devcontainer.json` با ویژگی رسمی `ghcr.io/azure/azure-dev/azd`، ویژگی‌های وابسته به زبان، اجرای داکر در داکر برای میزبان کانتینر، و ورود از راه دور با `azd auth login --use-device-code`
- **🧩 بخش Pulumi با azd** در `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`، ساختار فولدر Pulumi، استک‌ها که به محیط‌های azd نگاشت شده‌اند، خروجی‌ها/برچسب‌گذاری‌های مورد نیاز، و همان جریان کاری `azd up` / `azd down`
- **🎯 راهنمای انتخاب میزبان** در `docs/chapter-04-infrastructure/provisioning.md` — مقایسه ساده برای مبتدیان بین `appservice`، `staticwebapp`، `function`، `containerapp`، `aks` و `springapp`، به همراه راهنما درباره انتخاب AKS یا Azure Spring Apps
- **🛠️ مرور CI/CD در Azure DevOps** در `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`، اتصال سرویس با احراز هویت فدراسیونی بار کاری (OIDC)، فایل تولید شده `azure-dev.yml`، و تنظیم گروه متغیرها
- **🔑 حساب‌های سرویس (الگوی ۴)** اضافه‌شده به `docs/chapter-03-configuration/authsecurity.md` — ساخت حساب سرویس با `az ad sp create-for-rbac`، ورود غیرتعاملی به `azd auth login` با کلید مخفی مشتری در مقابل اعتبارات فدراسیونی/OIDC، موارد استفاده و ذخیره امن کلیدها
- **🪝 مدیریت خطا هوک‌ها** بخش فرعی در `docs/chapter-04-infrastructure/deployment-guide.md` — کدهای خروج و `set -e`، `continueOnError`، آزمایش هوک‌ها به صورت جداگانه با `azd hooks run`، شِل‌های خاص سیستم‌عامل، و گزینه `--debug`
- **👥 محیط‌های تیمی/مشترک** در `docs/chapter-03-configuration/configuration.md` — آنچه در `.azure/` قرار می‌گیرد، فایل‌هایی که باید در gitignore باشند، محیط‌های هر توسعه‌دهنده، دستورات `azd env list`/`select`، و تأمین مقادیر محیط در CI/CD
- **🧰 توضیحات `azd restore` و گسترش `azd package`** در `resources/cheat-sheet.md` — بازیابی وابستگی‌ها و ساخت یک آرشیو قابل استقرار بدون خود استقرار

#### تغییرات
- **🧭 جدول درس‌های فصل ۴** به‌روزرسانی شد تا درس جدید "نگارش قالب خود" (درس ۳) را شامل شود
- **🧭 جدول درس‌های فصل ۱** به‌روزرسانی شد تا درس جدید "کانتینرهای توسعه و Codespaces" (درس ۵) را شامل شود؛ پاورقی‌های ناوبری بین `bring-your-own-app.md` و `dev-containers.md` متصل شدند

### [v3.21.0] - 2026-06-16

#### پر کردن شکاف برای مبتدیان: درس چندعاملی عملی، "افزودن برنامه خود"، Terraform، و مرور CI/CD
**این نسخه بزرگ‌ترین شکاف‌ها برای یک راهنمای کامل مبتدیان را با افزودن دو درس عملی جدید (مرور چندعاملی قابل استقرار و افزودن azd به پروژه موجود)، معرفی مبتدیان به هوک‌ها، بخش Terraform با azd، مرور گام به گام خط لوله GitHub Actions، توضیح افزونه‌های نمایشی جدید، و فهرست تأیید استقرار صریح بسته می‌کند.**

#### افزوده‌شده
- **🤝 درس جدید فصل ۵** `docs/chapter-05-multi-agent/multi-agent-basics.md` — یک مرور کاملاً عملی دو عامل (هماهنگ‌کننده + متخصصان) قابل استقرار با استفاده از یک قالب واقعی (`contoso-creative-writer`)، شامل زمان استفاده از چندعاملی، جریان کاری `azd up`، درک منابع مستقر شده، رهگیری بین عاملی، سفارشی‌سازی و پاکسازی
- **📦 درس جدید فصل ۱** `docs/chapter-01-foundation/bring-your-own-app.md` — چگونگی افزودن azd به پروژه موجود با `azd init` ("استفاده از کد در دایرکتوری جاری")، درک `azure.yaml` و `infra/`، دستور `azd infra generate`، تشخیص میزبان، و استقرار با `azd up`
- **🌐 بخش Terraform با azd** اضافه شده به `docs/chapter-04-infrastructure/provisioning.md` — پیکربندی `infra.provider: terraform`، ساختار فولدر `.tf`، خروجی‌های مورد نیاز `AZURE_*` و برچسب‌گذاری `azd-env-name`، و همان گردش کار `azd up` / `azd down` (پر کردن شکافی که پشتیبانی Terraform ادعا شده بود اما فقط Bicep نشان داده شده بود)
- **⚙️ مرور گام به گام GitHub Actions** در `docs/chapter-08-production/production-ai-practices.md` — از مخزن GitHub تا استقرارهای خودکار: `azd pipeline config`، کارت‌های احراز هویت فدراسیونی OIDC (بدون ذخیره اسرار)، فایل ساخته شده `azure-dev.yml` و راهنمای فرق بین متغیرها و اسرار
- **🪝 معرفی مبتدی به "هوک‌ها چیست؟"** در `docs/chapter-04-infrastructure/deployment-guide.md` — تعریف هوک، جدول مراحل هوک، یک هوک ساده اولیه، و اجرای دستی هوک‌ها با `azd hooks run`
- **✅ فهرست تأیید "تأیید استقرار شما"** اضافه شده به گام ۵ از `docs/chapter-01-foundation/first-project.md` — تست دود، بررسی نقطه پایان سلامت، و معیارهای موفقیت صریح
- **🧩 توضیح افزونه‌های نمایشی جدید** `azure.ai.skills` و `azure.ai.connections` (چیستند و چه زمانی باید استفاده شوند) در `docs/chapter-08-production/production-ai-practices.md`

#### تغییرات
- **🧭 جدول درس‌های فصل ۵** اصلاح شد: `multi-agent-basics.md` اکنون درس ۱ است (تنها درس کاملاً عملی)، با برچسب‌گذاری صادقانه که درس ۲ در فصل ۶ قرار دارد و سناریوی خرده‌فروشی یک نقشه معماری است نه قالب یک‌دستی
- **🧭 جدول درس‌های فصل ۱** اکنون درس جدید "افزودن برنامه خود" (درس ۴) را شامل می‌شود
- **🔗 پاورقی‌های ناوبری** به‌روزرسانی شدند: `first-project.md` اکنون لینک رو به جلو به `bring-your-own-app.md` دارد

#### رفع شد
- **🧱 شکاف Terraform "ادعا شده اما وجود نداشت" بسته شد** — دوره قبلاً اشاره به پشتیبانی Terraform داشت اما آن را نشان نمی‌داد
- **🔀 اصلاح پیوندهای متقاطع گمراه‌کننده فصل ۵** که القا می‌کردند پیاده‌سازی کامل چندعاملی وجود دارد در حالی که فقط یک نقشه کلی معماری بود

#### فایل‌های به‌روزرسانی‌شده
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(جدید)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(جدید)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### تازه‌سازی AZD 1.25.6، دستورات کامل چرخه عمر عامل و بازبرند Aspire

**این نسخه دوره را در برابر `azd` نسخه `1.25.6` (ژوئن ۲۰۲۶) و افزونه پیش‌نمایش `azure.ai.agents` نسخه `0.1.40-preview` بازنگری می‌کند، راهنمایی‌های هوش مصنوعی را از «اسکافلد یک عامل» به تمام چرخه عمر عامل (تست → ارزیابی → بهینه‌سازی → بازرسی → حذف) گسترش می‌دهد، افزونه‌های جدید پیش‌نمایش `azure.ai.skills` و `azure.ai.connections` را نشان می‌دهد و تغییر برند محصول از ".NET Aspire" به "Aspire" را یادآوری می‌کند.**

#### اضافه شده
- **🔁 پوشش کامل چرخه عمر عامل** برای مبتدیان و مهندسان هوش مصنوعی در سراسر مستندات:
  - `docs/chapter-01-foundation/azd-basics.md` — جدول چرخه عمر (اسکافلد → تست → اندازه‌گیری → بهبود → بازرسی → پاک‌سازی) به بخش Extensions و AI Commands اضافه شد
  - `docs/chapter-08-production/production-ai-practices.md` — بخش جدید "مدیریت چرخه عمر عامل" که پوشش می‌دهد `azd ai agent invoke`، `endpoint show`، `eval generate`، `optimize`، `code download` و `delete --force`
  - `resources/cheat-sheet.md` — دستورهای گسترش یافته عامل هوش مصنوعی با `invoke`، `endpoint show`، `eval generate`، `optimize`، `code download` و `delete --force`
- **🧩 افزونه‌های پیش‌نمایش جدید** مستندسازی شده: `azure.ai.skills` (مهارت‌های قابل استفاده مجدد عامل) و `azure.ai.connections` (اتصالات Foundry) به جدول افزونه‌ها و برگه تقلب اضافه شد
- **⏱️ راهنمایی زمان پاسخ‌دهی** — مثال‌های `azd ai agent invoke` اکنون یادآوری می‌کنند که کل تأخیر و زمان دریافت اولین بایت را چاپ می‌کند
- **📌 بنر نسخه** در README ریشه که یادگیرندگان را به `azd version` و `azd upgrade` راهنمایی می‌کند

#### تغییر کرده
- **✅ خط پایه اعتبارسنجی به‌روز شد** از `azd 1.23.12` (مارس ۲۰۲۶) به `azd 1.25.6` (ژوئن ۲۰۲۶) در تمام README های فصول و مستندات کارگاه
- **🤖 یادداشت افزونه فصل ۲** از `azure.ai.agents` نسخه `0.1.18-preview` به `0.1.40-preview` به‌روز شد
- **🧪 مثال اعتبارسنجی کارگاه** (خروجی `azd version`) به `1.25.6` به‌روزرسانی شد
- **🧭 README "چه چیز جدیدی در azd امروز است"** تازه‌سازی شد تا چرخه عمر عامل انتها به انتها، افزونه‌های هوش مصنوعی جدید و بهبودهای عمده کیفیت زندگی (`azd init` ایدمپوتنتی، پاک‌سازی توکن منقضی `azd auth login`، درخواست اولین اجرای `azd tool`) را برجسته کند
- **📖 فصل ۲ agents.md (گزینه ۴)** اکنون یادگیرندگان را به دستورات چرخه عمر پس از استقرار هدایت می‌کند به جای توقف در `azd up`

#### رفع شده
- **🏷️ نامگذاری محصول** — یادداشت تغییر برند Aspire اضافه شد (".NET Aspire" اکنون فقط "Aspire" است)؛ پشتیبانی azd از Aspire تغییری نکرده است
- **🔎 اعتبارسنجی زنده نسخه انتشار** در برابر خوراک نسخه Azure Developer CLI تأیید شد: CLI پایدار `1.25.6` (2026-06-12) و `azure.ai.agents` نسخه `0.1.40-preview` (2026-06-15)

#### فایل‌های به‌روزرسانی شده
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27

#### روشن‌سازی ورود مبتدیان، اعتبارسنجی راه‌اندازی و پاک‌سازی نهایی دستورات AZD
**این نسخه پس از بررسی اعتبارسنجی AZD 1.23، تمرکز مستندات را به مبتدیان معطوف کرده است: راهنمایی‌های احراز هویت اولیه AZD را شفاف می‌کند، اسکریپت‌های اعتبارسنجی راه‌اندازی محلی اضافه می‌کند، دستورات کلیدی را در برابر CLI زنده AZD تأیید می‌کند و آخرین ارجاعات دستوری منبع انگلیسی منسوخ خارج از changelog را حذف می‌کند.**

#### اضافه شده
- **🧪 اسکریپت‌های اعتبارسنجی راه‌اندازی مبتدیان** با `validate-setup.ps1` و `validate-setup.sh` تا یادگیرندگان بتوانند ابزارهای موردنیاز را قبل از شروع فصل ۱ تأیید کنند
- **✅ مراحل اعتبارسنجی راه‌اندازی اولیه** در README ریشه و README فصل ۱ تا الزامات لازم قبل از اجرای `azd up` شناسایی شوند

#### تغییر کرده
- **🔐 راهنمایی احراز هویت مبتدی** اکنون به صورت یکنواخت `azd auth login` را مسیر اصلی گردش کارهای AZD در نظر می‌گیرد، با ذکر `az login` به عنوان اختیاری مگر آنکه دستورات Azure CLI به صورت مستقیم استفاده شوند
- **📚 جریان ورود فصل ۱** اکنون یادگیرندگان را به اعتبارسنجی راه‌اندازی محلی خود قبل از مراحل نصب، احراز هویت و استقرار اولیه هدایت می‌کند
- **🛠️ پیام‌رسانی اعتبارسنجی** اکنون الزامات مسدودکننده را به طور واضح از هشدارهای اختیاری Azure CLI در مسیر مبتدیان فقط AZD جدا می‌کند
- **📖 مستندات پیکربندی، عیب‌یابی و مثال‌ها** اکنون بین احراز هویت لازم AZD و ورود اختیاری Azure CLI تمایز قائل می‌شوند جایی که قبلاً بدون زمینه ارائه شده بودند

#### رفع شده
- **📋 باقی‌مانده ارجاعات دستوری منبع انگلیسی** به فرم‌های فعلی AZD از جمله `azd config show` در برگه تقلب و `azd monitor --overview` به روز شدند جایی که راهنمایی نمای کلی Azure Portal مورد نظر بود
- **🧭 ادعاهای مبتدی در فصل ۱** تعدیل شد تا از وعده دادن رفتار تضمین‌شده بدون خطا یا برگشت در همه قالب‌ها و منابع Azure پرهیز شود
- **🔎 اعتبارسنجی CLI زنده** پشتیبانی جاری برای `azd env get-values`، `azd template list`، `azd extension list --installed`، `azd copilot consent list`، `azd mcp start`، `azd provision --preview`، `azd monitor --logs` و `azd down --force --purge` تایید شد

#### فایل‌های به‌روزرسانی شده
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### اعتبارسنجی AZD 1.23.12، گسترش محیط کارگاه و تازه‌سازی مدل هوش مصنوعی
**این نسخه یک بازنگری اعتبارسنجی مستندات علیه `azd` نسخه `1.23.12` انجام می‌دهد، مثال‌های دستورات AZD قدیمی را به‌روزرسانی می‌کند، راهنمای مدل هوش مصنوعی را به پیش‌فرض‌های جاری تازه می‌کند و دستورالعمل‌های کارگاه را از GitHub Codespaces فراتر می‌برد تا از dev containers و کلون‌های محلی نیز پشتیبانی کند.**

#### اضافه شده
- **✅ یادداشت‌های اعتبارسنجی در سراسر فصول اصلی و مستندات کارگاه** برای روشن کردن خط پایه AZD تست شده برای یادگیرندگانی که از نسخه‌های جدیدتر یا قدیمی‌تر CLI استفاده می‌کنند
- **⏱️ راهنمایی زمان انتظار استقرار** برای استقرارهای برنامه هوش مصنوعی طولانی‌مدت با استفاده از `azd deploy --timeout 1800`
- **🔎 گام‌های بازرسی افزونه** با `azd extension show azure.ai.agents` در مستندات گردش کار هوش مصنوعی
- **🌐 راهنمایی محیط کارگاه گسترده‌تر** که GitHub Codespaces، dev containers و کلون‌های محلی با MkDocs را پوشش می‌دهد

#### تغییر کرده
- **📚 README های معرفی فصل** اکنون به صورت یکنواخت یادآور اعتبارسنجی در برابر `azd 1.23.12` در بخش‌های بنیاد، پیکربندی، زیرساخت، چندعاملی، پیش‌استقرار، عیب‌یابی و تولید هستند
- **🛠️ ارجاعات دستوری AZD** در سراسر مستندات به فرم‌های جاری به‌روزرسانی شدند:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` یا `azd env get-value(s)` بسته به زمینه
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` جایی که نمای کلی Application Insights مورد نظر است
- **🧪 نمونه‌های پیش‌نمایش Provision** ساده شده به استفاده‌های پشتیبانی‌شده کنونی مانند `azd provision --preview` و `azd provision --preview -e production`
- **🧭 جریان کارگاه** به‌روزرسانی شده تا یادگیرندگان بتوانند آزمایش‌ها را در Codespaces، یک dev container یا کلون محلی کامل کنند به جای فرض اجرای فقط در Codespaces
- **🔐 راهنمایی احراز هویت** اکنون `azd auth login` را برای گردش کارهای AZD ترجیح می‌دهد و `az login` را به عنوان اختیاری هنگام استفاده مستقیم از دستورات Azure CLI قرار می‌دهد

#### رفع شده
- **🪟 دستورات نصب ویندوز** در راهنمای نصب به نگارش جاری بسته winget استاندارد شدند
- **🐧 راهنمای نصب لینوکس** اصلاح شد تا از دستورالعمل‌های غیرپشتیبانی‌شده مدیریت بسته خاص توزیع `azd` جلوگیری کند و در عوض به دارایی‌های نسخه اشاره کند در صورت لزوم
- **📦 مثال‌های مدل هوش مصنوعی** از پیش‌فرض‌های قدیمی مانند `gpt-35-turbo` و `text-embedding-ada-002` به نمونه‌های جاری مانند `gpt-4.1-mini`، `gpt-4.1` و `text-embedding-3-large` تازه شدند
- **📋 بخش‌های استقرار و تشخیص عیب** اصلاح شدند تا از دستورات محیط و وضعیت فعلی در لاگ‌ها، اسکریپت‌ها و مراحل عیب‌یابی استفاده کنند
- **⚙️ راهنمایی GitHub Actions** از `Azure/setup-azd@v1.0.0` به `Azure/setup-azd@v2` به‌روزرسانی شد
- **🤖 راهنمایی رضایت MCP/Copilot** از `azd mcp consent` به `azd copilot consent list` تغییر کرد

#### بهبود یافته
- **🧠 راهنمای فصل هوش مصنوعی** اکنون بهتر رفتار حساس به پیش‌نمایش `azd ai`، ورود مخصوص مستأجر، استفاده فعلی از افزونه و توصیه‌های به‌روزرسانی استقرار مدل را توضیح می‌دهد
- **🧪 دستورالعمل‌های کارگاه** اکنون از نسخه‌های واقعی‌تر و زبان واضح‌تر برای راه‌اندازی محیط‌ها در آزمایش‌های عملی استفاده می‌کند
- **📈 مستندات تولید و عیب‌یابی** اکنون بهتر با نمونه‌های نظارت، مدل جایگزین و طبقه‌بندی هزینه‌های کنونی همسو هستند

#### فایل‌های به‌روزرسانی شده
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### دستورات CLI هوش مصنوعی AZD، اعتبارسنجی محتوا و گسترش قالب‌ها
**این نسخه پوشش دستورات `azd ai`، `azd extension` و `azd mcp` را در تمام فصول مرتبط با هوش مصنوعی اضافه می‌کند، پیوندهای خراب و کدهای منسوخ در agents.md را اصلاح می‌کند، برگه تقلب را به‌روزرسانی می‌کند و بخش قالب‌های نمونه را با توصیفات معتبر و قالب‌های جدید Azure AI AZD بازسازی می‌کند.**

#### اضافه شده
- **🤖 پوشش CLI هوش مصنوعی AZD** در ۷ فایل (قبلاً فقط در فصل ۸):
  - `docs/chapter-01-foundation/azd-basics.md` — بخش جدید "Extensions and AI Commands" که `azd extension`، `azd ai agent init` و `azd mcp` را معرفی می‌کند
  - `docs/chapter-02-ai-development/agents.md` — گزینه ۴: `azd ai agent init` با جدول مقایسه‌ای (رویکرد قالب در مقابل منیفست)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — زیر بخش‌های "AZD Extensions for Foundry" و "Agent-First Deployment"

  - `docs/chapter-05-multi-agent/README.md` — راه‌اندازی سریع اکنون مسیرهای استقرار مبتنی بر قالب و مانیفست را نشان می‌دهد
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — بخش استقرار اکنون گزینه `azd ai agent init` را شامل می‌شود
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — زیر بخش "دستورات افزونه AZD AI برای تشخیص"
  - `resources/cheat-sheet.md` — بخش جدید "دستورات AI و افزونه‌ها" با `azd extension`، `azd ai agent init`، `azd mcp` و `azd infra generate`
- **📦 قالب‌های نمونه جدید AZD AI** در `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — چت RAG در .NET با Blazor WebAssembly، Semantic Kernel و پشتیبانی چت صوتی
  - **azure-search-openai-demo-java** — چت RAG با جاوا با استفاده از Langchain4J با گزینه‌های استقرار ACA/AKS
  - **contoso-creative-writer** — برنامه چندعاملی نگارش خلاقانه با استفاده از سرویس Azure AI Agent، Bing Grounding و Prompty
  - **serverless-chat-langchainjs** — چت بدون سرور RAG با استفاده از Azure Functions + LangChain.js + Cosmos DB با پشتیبانی توسعه محلی Ollama
  - **chat-with-your-data-solution-accelerator** — شتاب‌دهنده RAG سازمانی با پرتال مدیریت، یکپارچگی Teams و گزینه‌های PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — برنامه مرجع هماهنگی MCP چندعاملی با سرورها در .NET، Python، Java و TypeScript
  - **azd-ai-starter** — قالب شروع‌کننده کمینه زیرساخت Azure AI با Bicep
  - **🔗 پیوند گالری فوق‌العاده AZD AI** — ارجاع به [گالری فوق‌العاده AI azd](https://azure.github.io/awesome-azd/?tags=ai) (بیش از ۸۰ قالب)

#### اصلاح شده
- **🔗 ناوبری agents.md**: پیوندهای قبلی/بعدی اکنون با ترتیب درس README فصل ۲ مطابقت دارند (یکپارچگی Microsoft Foundry → عوامل → استقرار مدل AI)
- **🔗 پیوندهای خراب agents.md**: اصلاح `production-ai-practices.md` به `../chapter-08-production/production-ai-practices.md` (۳ بار)
- **📦 کدهای منسوخ agents.md**: جایگزینی `opencensus` با `azure-monitor-opentelemetry` به همراه OpenTelemetry SDK
- **🐛 API نامعتبر agents.md**: جابجایی `max_tokens` از `create_agent()` به `create_run()` به عنوان `max_completion_tokens`
- **🔢 شمارش توکن agents.md**: جایگزینی تخمین تقریبی `len//۴` با `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: اصلاح سرویس‌ها از "Cognitive Search + App Service" به "Azure AI Search + Azure Container Apps" (میزبان پیش‌فرض از اکتبر ۲۰۲۴ تغییر کرد)
- **contoso-chat**: به‌روزرسانی توضیحات به ارجاع Azure AI Foundry + Prompty، مطابق با عنوان و تکنولوژی مخزن

#### حذف شده
- **ai-document-processing**: حذف مرجع قالب غیرعملی (مخزن به عنوان قالب AZD در دسترس عمومی نیست)

#### بهبود یافته
- **📝 تمرینات agents.md**: تمرین ۱ اکنون خروجی مورد انتظار و مرحله `azd monitor` را نشان می‌دهد؛ تمرین ۲ شامل کد کامل ثبت `FunctionTool` است؛ تمرین ۳ راهنمایی مبهم را با دستورات مشخص `prepdocs.py` جایگزین کرده است
- **📚 منابع agents.md**: به‌روزرسانی پیوندهای مستندات به اسناد جاری سرویس Azure AI Agent و راه‌اندازی سریع
- **📋 جدول مراحل بعدی agents.md**: اضافه شدن پیوند به آزمایشگاه کارگاه AI برای پوشش کامل فصل

#### فایل‌های به‌روزرسانی شده
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### بهبود ناوبری دوره
**این نسخه ناوبری فصل README.md را با قالب جدول بهبود یافته ارتقاء می‌دهد.**

#### تغییرات
- **جدول نقشه دوره**: بهبود یافته با پیوندهای مستقیم درس، برآوردهای مدت زمان و ارزیابی پیچیدگی
- **پاکسازی پوشه‌ها**: حذف پوشه‌های قدیمی و زائد (deployment/، getting-started/، pre-deployment/، troubleshooting/)
- **اعتبارسنجی پیوندها**: همه ۲۱+ پیوند داخلی جدول نقشه دوره بررسی شده‌اند

### [v3.16.0] - 2026-02-05

#### به‌روزرسانی نام محصول
**این نسخه ارجاعات به محصولات را با برند مایکروسافت فعلی به‌روزرسانی می‌کند.**

#### تغییرات
- **Microsoft Foundry → Microsoft Foundry**: همه ارجاعات در فایل‌های ترجمه نشده به‌روزرسانی شدند
- **Azure AI Agent Service → Foundry Agents**: نام سرویس برای انعکاس برند فعلی به‌روزرسانی شد

#### فایل‌های به‌روزرسانی شده
- `README.md` - صفحه اصلی دوره
- `changelog.md` - تاریخچه نسخه‌ها
- `course-outline.md` - ساختار دوره
- `docs/chapter-02-ai-development/agents.md` - راهنمای عوامل AI
- `examples/README.md` - مستندات نمونه‌ها
- `workshop/README.md` - صفحه اصلی کارگاه
- `workshop/docs/index.md` - نمایه کارگاه
- `workshop/docs/instructions/*.md` - همه فایل‌های دستورالعمل کارگاه

---

### [v3.15.0] - 2026-02-05

#### بازسازی عمده مخزن: نام پوشه‌های مبتنی بر فصل
**این نسخه مستندات را به پوشه‌های مجزا بر اساس فصل‌ها سازماندهی می‌کند تا ناوبری واضح‌تر شود.**

#### تغییر نام پوشه‌ها
پوشه‌های قدیمی با پوشه‌های شماره‌گذاری‌شده جایگزین شده‌اند:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- اضافه شده جدید: `docs/chapter-05-multi-agent/`

#### مهاجرت فایل‌ها
| فایل | از | به |
|------|------|---|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |

| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### افزوده شده
- **📚 فایل‌های README فصل‌ها**: ایجاد README.md در هر پوشه فصل با:
  - اهداف یادگیری و مدت زمان
  - جدول درس‌ها با توضیحات
  - دستورات شروع سریع
  - ناوبری به فصول دیگر

#### تغییر یافته
- **🔗 به‌روزرسانی همه لینک‌های داخلی**: 78+ مسیر به‌روزرسانی شده در تمام فایل‌های مستندات
- **🗺️ README اصلی**: به‌روزرسانی نقشه دوره با ساختار جدید فصل‌ها
- **📝 examples/README.md**: به‌روزرسانی ارجاعات متقاطع به پوشه‌های فصل

#### حذف شده
- ساختار قدیمی پوشه‌ها (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### بازسازی مخزن: ناوبری فصل‌ها
**این نسخه فایل‌های README ناوبری فصل‌ها را اضافه کرده است (که در v3.15.0 جایگزین شده‌اند).**

---

### [v3.13.0] - 2026-02-05

#### راهنمای جدید عوامل هوش مصنوعی
**این نسخه راهنمای جامع برای استقرار عوامل هوش مصنوعی با Azure Developer CLI را اضافه می‌کند.**

#### افزوده شده
- **🤖 docs/microsoft-foundry/agents.md**: راهنمای کامل شامل:
  - عوامل هوش مصنوعی چیستند و چگونه با چت‌بات‌ها تفاوت دارند
  - سه قالب شروع سریع عامل (Foundry Agents، Prompty، RAG)
  - الگوهای معماری عامل (عامل تک، RAG، چند عامل)
  - پیکربندی و سفارشی‌سازی ابزار
  - مانیتورینگ و ردیابی معیارها
  - ملاحظات هزینه و بهینه‌سازی
  - سناریوهای رایج عیب‌یابی
  - سه تمرین عملی با معیارهای موفقیت

#### ساختار محتوا
- **مقدمه**: مفاهیم عامل برای مبتدیان
- **شروع سریع**: استقرار عوامل با `azd init --template get-started-with-ai-agents`
- **الگوهای معماری**: نمودارهای تصویری الگوهای عامل
- **پیکربندی**: راه‌اندازی ابزار و متغیرهای محیطی
- **مانیتورینگ**: ادغام Application Insights
- **تمرین‌ها**: یادگیری عملی پیش‌رونده (هر کدام ۲۰-۴۵ دقیقه)

---

### [v3.12.0] - 2026-02-05

#### به‌روزرسانی محیط DevContainer
**این نسخه پیکربندی کانتینر توسعه را با ابزارهای مدرن‌تر و پیش‌فرض‌های بهتر برای تجربه یادگیری AZD به‌روزرسانی می‌کند.**

#### تغییر یافته
- **🐳 تصویر پایه**: به‌روزرسانی از `python:3.12-bullseye` به `python:3.12-bookworm` (جدیدترین ورژن پایدار دبیان)
- **📛 نام کانتینر**: تغییر نام از "Python 3" به "AZD برای مبتدیان" برای وضوح بیشتر

#### افزوده شده
- **🔧 ویژگی‌های جدید کانتینر توسعه**:
  - `azure-cli` با پشتیبانی فعال شده از Bicep
  - `node:20` (نسخه LTS برای قالب‌های AZD)
  - `github-cli` برای مدیریت قالب‌ها
  - `docker-in-docker` برای استقرار برنامه‌های کانتینری

- **🔌 فوروارد پورت**: پورت‌های پیش‌پیکربندی شده برای توسعه رایج:
  - 8000 (پیش‌نمایش MkDocs)
  - 3000 (برنامه‌های وب)
  - 5000 (Python Flask)
  - 8080 (API‌ها)

- **🧩 افزونه‌های جدید VS Code**:
  - `ms-python.vscode-pylance` - هوش مصنوعی بهبود یافته برای پایتون
  - `ms-azuretools.vscode-azurefunctions` - پشتیبانی از Azure Functions
  - `ms-azuretools.vscode-docker` - پشتیبانی از داکر
  - `ms-azuretools.vscode-bicep` - پشتیبانی از زبان Bicep
  - `ms-azure-devtools.azure-resource-groups` - مدیریت منابع Azure
  - `yzhang.markdown-all-in-one` - ویرایش مارک‌داون
  - `DavidAnson.vscode-markdownlint` - بررسی نشانه‌گذاری مارک‌داون
  - `bierner.markdown-mermaid` - پشتیبانی نمودار مرمید
  - `redhat.vscode-yaml` - پشتیبانی YAML (برای azure.yaml)
  - `eamodio.gitlens` - تجسم گیت
  - `mhutchie.git-graph` - تاریخچه گیت

- **⚙️ تنظیمات VS Code**: افزودن تنظیمات پیش‌فرض برای مفسر پایتون، فرمت خودکار هنگام ذخیره، و حذف فاصله اضافی

- **📦 بروزرسانی requirements-dev.txt**:
  - اضافه کردن افزونه فشرده‌سازی MkDocs
  - افزودن pre-commit برای کیفیت کد
  - افزودن بسته‌های SDK Azure (azure-identity, azure-mgmt-resource)

#### رفع شده
- **دستور Post-Create**: اکنون با آغاز کانتینر نصب AZD و Azure CLI را بررسی می‌کند

---

### [v3.11.0] - 2026-02-05

#### بازسازی README برای مبتدیان
**این نسخه README.md را به‌طور قابل توجهی برای دسترسی بهتر مبتدیان بهبود می‌بخشد و منابع ضروری برای توسعه‌دهندگان هوش مصنوعی اضافه می‌کند.**

#### افزوده شده
- **🆚 مقایسه Azure CLI و AZD**: توضیح روشن درباره زمان استفاده از هر ابزار با مثال‌های عملی
- **🌟 لینک‌های عالی AZD**: لینک‌های مستقیم به گالری قالب‌های جامعه و منابع مشارکت:
  - [گالری عالی AZD](https://azure.github.io/awesome-azd/) - بیش از ۲۰۰ قالب آماده استقرار
  - [ارسال قالب](https://github.com/Azure/awesome-azd/issues) - مشارکت جامعه
- **🎯 راهنمای شروع سریع**: بخش شروع ساده‌شده ۳ مرحله‌ای (نصب → ورود → استقرار)
- **📊 جدول ناوبری مبتنی بر تجربه**: راهنمایی واضح درباره شروع کار بر اساس تجربه توسعه‌دهنده

#### تغییر یافته
- **ساختار README**: بازسازی برای افشای تدریجی - اطلاعات کلیدی ابتدا
- **بخش مقدمه**: بازنویسی برای توضیح "جادوی `azd up`" برای مبتدیان کامل
- **حذف مطالب تکراری**: حذف بخش عیب‌یابی تکراری

- **دستورات رفع اشکال**: ارجاع `azd logs` اصلاح شد تا از دستور معتبر `azd monitor --logs` استفاده کند

#### اصلاح شده

- **🔐 دستورات احراز هویت**: افزودن `azd auth login` و `azd auth logout` به cheat-sheet.md
- **ارجاعات دستورات نامعتبر**: حذف باقی‌مانده‌های `azd logs` از بخش عیب‌یابی README

#### یادداشت‌ها
- **دامنه**: تغییرات اعمال‌شده بر روی README.md اصلی و resources/cheat-sheet.md
- **مخاطب هدف**: بهبودهای ویژه توسعه‌دهندگان تازه‌وارد به AZD

---

### [v3.10.0] - ۲۰۲۶-۰۲-۰۵

#### به‌روزرسانی دقت دستورات Azure Developer CLI
**این نسخه دستورات AZD ناموجود را در سراسر مستندات اصلاح کرده و اطمینان می‌دهد که همه مثال‌های کد از نحو معتبر Azure Developer CLI استفاده می‌کنند.**

#### اصلاح‌شده
- **🔧 حذف دستورات AZD ناموجود**: بازبینی جامع و اصلاح دستورات نامعتبر:
  - `azd logs` (وجود ندارد) → جایگزین شده با `azd monitor --logs` یا معادل‌های Azure CLI
  - زیر‌دستورات `azd service` (وجود ندارند) → جایگزین شده با `azd show` و Azure CLI
  - `azd infra import/export/validate` (وجود ندارد) → حذف یا جایگزینی با موارد معتبر
  - فلگ‌های `azd deploy --rollback/--incremental/--parallel/--detect-changes` (وجود ندارند) → حذف شده
  - فلگ‌های `azd provision --what-if/--rollback` (وجود ندارند) → به‌‌روزرسانی شده برای استفاده از `--preview`
  - `azd config validate` (وجود ندارد) → جایگزین شده با `azd config list`
  - `azd info`، `azd history`، `azd metrics` (وجود ندارند) → حذف شده

- **📚 فایل‌های به‌روزشده با اصلاح دستورات**:
  - `resources/cheat-sheet.md`: بازنگری کامل مرجع دستورات
  - `docs/deployment/deployment-guide.md`: اصلاح استراتژی‌های rollback و استقرار
  - `docs/troubleshooting/debugging.md`: اصلاح بخش‌های تحلیل لاگ
  - `docs/troubleshooting/common-issues.md`: به‌روزرسانی دستورات عیب‌یابی
  - `docs/troubleshooting/ai-troubleshooting.md`: اصلاح بخش اشکال‌زدایی AZD
  - `docs/getting-started/azd-basics.md`: اصلاح دستورات نظارت
  - `docs/getting-started/first-project.md`: به‌روزرسانی مثال‌های نظارت و اشکال‌زدایی
  - `docs/getting-started/installation.md`: اصلاح مثال‌های کمک و نسخه
  - `docs/pre-deployment/application-insights.md`: اصلاح دستورات مشاهده لاگ
  - `docs/pre-deployment/coordination-patterns.md`: اصلاح دستورات اشکال‌زدایی عامل

- **📝 به‌روزرسانی مرجع نسخه**: 
  - `docs/getting-started/installation.md`: تغییر نسخه سخت‌کد شده `1.5.0` به عمومی `1.x.x` با لینک به نسخه‌ها

#### تغییر یافته
- **استراتژی‌های Rollback**: مستندات به‌روزرسانی شده برای استفاده از rollback مبتنی بر Git (AZD rollback بومی ندارد)
- **مشاهده لاگ**: ارجاعات `azd logs` با `azd monitor --logs`، `azd monitor --live` و دستورات Azure CLI جایگزین شده‌اند
- **بخش عملکرد**: فلگ‌های استقرار موازی/افزایشی ناموجود حذف شده و جایگزین‌های معتبر ارائه شده است

#### جزئیات فنی
- **دستورات معتبر AZD**: `init`، `up`، `auth`، `deploy`، `down`، `provision`، `publish`، `completion`، `config`، `env`، `show`، `version`، `monitor`
- **فلگ‌های معتبر azd monitor**: `--live`، `--logs`، `--overview`
- **ویژگی‌های حذف‌شده**: `azd logs`، `azd service`، `azd infra import/export/validate`، `azd history`، `azd metrics`، `azd info`، `azd config validate`

#### یادداشت‌ها
- **تأیید**: دستورات در برابر Azure Developer CLI نسخه v1.23.x اعتبارسنجی شده‌اند

---

### [v3.9.0] - ۲۰۲۶-۰۲-۰۵

#### تکمیل کارگاه و بهبود کیفیت مستندات
**این نسخه ماژول‌های تعاملی کارگاه را تکمیل کرده، همه لینک‌های شکسته مستندات را اصلاح می‌کند و کیفیت کلی محتوا را برای توسعه‌دهندگان هوش مصنوعی که از Microsoft AZD استفاده می‌کنند، بهبود می‌بخشد.**

#### افزوده شده
- **📝 CONTRIBUTING.md**: سند جدید دستورالعمل‌های مشارکت با:
  - دستورالعمل‌های واضح برای گزارش مشکلات و پیشنهاد تغییرات
  - استانداردهای مستندسازی برای محتواهای جدید
  - راهنمای نمونه کد و قواعد پیام کامیت
  - اطلاعات مشارکت جامعه

#### تکمیل شده
- **🎯 ماژول کارگاه ۷ (خاتمه)**: ماژول خاتمه کاملاً تکمیل شده با:
  - خلاصه جامع دستاوردهای کارگاه
  - بخش مفاهیم کلیدی شامل AZD، قالب‌ها و Microsoft Foundry
  - توصیه‌های ادامه مسیر یادگیری
  - تمرین‌های چالش کارگاه با رتبه‌بندی سختی
  - بازخورد جامعه و لینک‌های حمایت

- **📚 ماژول کارگاه ۳ (تحلیل)**: اهداف یادگیری به‌روزرسانی شده با:
  - راهنمای فعال‌سازی GitHub Copilot با سرورهای MCP
  - درک ساختار پوشه قالب AZD
  - الگوهای سازماندهی زیرساخت به عنوان کد (Bicep)
  - دستورالعمل‌های آزمایشگاه عملی

- **🔧 ماژول کارگاه ۶ (جمع‌آوری)**: با موارد زیر تکمیل شده:
  - اهداف پاکسازی منابع و مدیریت هزینه
  - استفاده از `azd down` برای حذف ایمن زیرساخت
  - راهنمای بازیابی خدمات شناختی حذف‌شده نرم
  - ایده‌های کاوش اضافی برای GitHub Copilot و پورتال Azure

#### اصلاح شده
- **🔗 اصلاح لینک‌های شکسته**: بیش از ۱۵ لینک داخلی مستندات شکسته رفع شده:
  - `docs/ai-foundry/ai-model-deployment.md`: اصلاح مسیرها به microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: اصلاح مسیرهای ai-model-deployment.md و production-ai-practices.md
  - `docs/getting-started/first-project.md`: جایگزینی cicd-integration.md ناموجود با deployment-guide.md
  - `examples/retail-scenario.md`: اصلاح مسیرهای FAQ و راهنمای عیب‌یابی
  - `examples/container-app/microservices/README.md`: اصلاح مسیر خانه دوره و راهنمای استقرار
  - `resources/faq.md` و `resources/glossary.md`: به‌روزرسانی ارجاعات فصل AI
  - `course-outline.md`: اصلاح ارجاعات راهنمای مدرس و آزمایشگاه AI

- **📅 بنر وضعیت کارگاه**: به‌روزرسانی از "در حال ساخت" به وضعیت فعال کارگاه با تاریخ فوریه ۲۰۲۶

- **🔗 ناوبری کارگاه**: اصلاح لینک‌های شکسته ناوبری در README.md کارگاه که به پوشه lab-1-azd-basics ناموجود اشاره می‌کرد

#### تغییر یافته
- **ارائه کارگاه**: هشدار "در حال ساخت" حذف شده، کارگاه اکنون کامل و آماده استفاده است
- **پیوستگی ناوبری**: اطمینان حاصل شده که همه ماژول‌های کارگاه ناوبری درون ماژول صحیح دارند
- **ارجاعات مسیر یادگیری**: ارجاعات فصل‌ها به مسیرهای صحیح microsoft-foundry به‌روزرسانی شده‌اند

#### اعتبارسنجی شده
- ✅ همه فایل‌های markdown انگلیسی دارای لینک داخلی معتبر هستند
- ✅ ماژول‌های کارگاه ۰ تا ۷ با اهداف یادگیری کامل شده‌اند
- ✅ ناوبری بین فصل‌ها و ماژول‌ها به درستی کار می‌کند
- ✅ محتوا برای توسعه‌دهندگان هوش مصنوعی که از Microsoft AZD استفاده می‌کنند مناسب است
- ✅ زبان و ساختار مناسب مبتدیان در سراسر مستندات حفظ شده
- ✅ CONTRIBUTING.md راهنمایی واضح برای مشارکت‌کنندگان جامعه فراهم می‌کند

#### پیاده‌سازی فنی
- **اعتبارسنجی لینک‌ها**: اسکریپت خودکار PowerShell همه لینک‌های داخلی .md را بررسی کرد
- **بازبینی محتوا**: مرور دستی تکمیل بودن کارگاه و تناسب آن با مبتدیان
- **سیستم ناوبری**: الگوهای ناوبری فصل‌ها و ماژول‌ها به صورت یکپارچه اعمال شده‌اند

#### یادداشت‌ها
- **دامنه**: تغییرات فقط بر مستندات انگلیسی اعمال شده
- **ترجمه‌ها**: پوشه‌های ترجمه در این نسخه به‌روزرسانی نشده‌اند (ترجمه خودکار بعداً همگام‌سازی خواهد شد)
- **مدت زمان کارگاه**: کارگاه کامل اکنون ۳-۴ ساعت آموزش عملی فراهم می‌کند

---

### [v3.8.0] - ۲۰۲۵-۱۱-۱۹

#### مستندات پیشرفته: نظارت، امنیت، و الگوهای چندعامله
**این نسخه درس‌های جامعی با درجه A درباره ادغام Application Insights، الگوهای احراز هویت و هماهنگی چندعامل برای استقرارهای تولیدی اضافه می‌کند.**

#### افزوده شده
- **📊 درس ادغام Application Insights**: در `docs/pre-deployment/application-insights.md`:
  - استقرار متمرکز بر AZD با پیش‌تأمین خودکار
  - قالب‌های کامل Bicep برای Application Insights + Log Analytics
  - برنامه‌های پایتون کاربردی با تله‌متری سفارشی (بیش از ۱۲۰۰ خط)
  - الگوهای نظارت AI/LLM (ردیابی توکن/هزینه مدل‌های Microsoft Foundry)
  - ۶ نمودار Mermaid (معماری، ردیابی توزیع‌شده، جریان تله‌متری)
  - ۳ تمرین عملی (هشدارها، داشبوردها، نظارت AI)
  - نمونه‌های کوئری Kusto و استراتژی‌های بهینه‌سازی هزینه
  - پخش زنده متریک‌ها و اشکال‌زدایی بلادرنگ
  - ۴۰-۵۰ دقیقه زمان یادگیری با الگوهای آماده تولید

- **🔐 درس الگوهای احراز هویت و امنیت**: در `docs/getting-started/authsecurity.md`:
  - ۳ الگوی احراز هویت (رشته‌های اتصال، Key Vault، managed identity)
  - قالب‌های کامل Bicep زیرساخت برای استقرارهای امن
  - کد برنامه Node.js با ادغام Azure SDK
  - ۳ تمرین کامل (فعال‌سازی managed identity، user-assigned identity، چرخش Key Vault)
  - بهترین روش‌های امنیتی و پیکربندی‌های RBAC
  - راهنمای عیب‌یابی و تحلیل هزینه
  - الگوهای احراز هویت بدون رمز عبور آماده تولید

- **🤖 درس الگوهای هماهنگی چندعامله**: در `docs/pre-deployment/coordination-patterns.md`:
  - ۵ الگوی هماهنگی (متوالی، موازی، سلسله‌مراتبی، رویدادمحور، اجماع)
  - پیاده‌سازی کامل سرویس هماهنگ‌کننده (Python/Flask، بیش از ۱۵۰۰ خط)
  - ۳ پیاده‌سازی تخصصی عامل (پژوهش، نویسنده، ویراستار)
  - ادغام Service Bus برای صف‌بندی پیام‌ها
  - مدیریت وضعیت Cosmos DB برای سیستم‌های توزیع‌شده
  - ۶ نمودار Mermaid نشان‌دهنده تعاملات عامل
  - ۳ تمرین پیشرفته (مدیریت تایم‌اوت، منطق تجدید تلاش، circuit breaker)
  - تفکیک هزینه (۲۴۰-۵۶۵ دلار در ماه) با استراتژی‌های بهینه‌سازی
  - ادغام Application Insights برای نظارت

#### بهبود یافته
- **فصل پیش‌استقرار**: اکنون شامل الگوهای جامع نظارت و هماهنگی است
- **فصل شروع به کار**: با الگوهای حرفه‌ای احراز هویت تقویت شده
- **آمادگی تولید**: پوشش کامل از امنیت تا قابلیت مشاهده
- **خط‌مشی دوره**: به‌روزرسانی برای ارجاع درس‌های جدید در فصل‌های ۳ و ۶

#### تغییر یافته
- **پیشرفت یادگیری**: ادغام بهتر امنیت و نظارت در سرتاسر دوره
- **کیفیت مستندات**: استانداردهای درجه A یکسان (۹۵-۹۷٪) در درس‌های جدید
- **الگوهای تولید**: پوشش کامل انتها به انتها برای استقرار سازمانی

#### بهبود یافته
- **تجربه توسعه‌دهنده**: مسیر روشن از توسعه به نظارت تولید
- **استانداردهای امنیت**: الگوهای حرفه‌ای برای احراز هویت و مدیریت اسرار
- **قابلیت مشاهده**: ادغام کامل Application Insights با AZD
- **بارهای کاری AI**: نظارت تخصصی برای مدل‌های Microsoft Foundry و سیستم‌های چندعامله

#### اعتبارسنجی شده
- ✅ همه درس‌ها شامل کد کامل و قابل اجرا هستند (نه تکه‌کد)
- ✅ نمودارهای Mermaid برای یادگیری بصری (۱۹ نمودار در ۳ درس)
- ✅ تمرین‌های عملی با مراحل تأیید (۹ تمرین)
- ✅ قالب‌های Bicep آماده تولید قابل استقرار با `azd up`
- ✅ تحلیل هزینه و استراتژی‌های بهینه‌سازی
- ✅ راهنماهای عیب‌یابی و بهترین روش‌ها
- ✅ نقاط کنترل دانش با دستورات تأیید

#### نتایج درجه‌بندی مستندات
- **docs/pre-deployment/application-insights.md**: - راهنمای جامع نظارت
- **docs/getting-started/authsecurity.md**: - الگوهای حرفه‌ای امنیتی
- **docs/pre-deployment/coordination-patterns.md**: - معماری‌های پیشرفته چندعامله
- **مجموع محتواهای جدید**: - استانداردهای کیفی بالا و هماهنگ

#### پیاده‌سازی فنی
- **Application Insights**: Log Analytics + تله‌متری سفارشی + ردیابی توزیع‌شده
- **احراز هویت**: Managed Identity + Key Vault + الگوهای RBAC
- **چندعامل**: Service Bus + Cosmos DB + برنامه‌های کانتینری + ارکستراسیون
- **نظارت**: متریک‌های زنده + کوئری‌های Kusto + هشدارها + داشبوردها
- **مدیریت هزینه**: استراتژی‌های نمونه‌گیری، سیاست‌های نگهداری، کنترل بودجه

### [v3.7.0] - ۲۰۲۵-۱۱-۱۹

#### بهبود کیفیت مستندات و نمونه جدید Microsoft Foundry Models
**این نسخه کیفیت مستندات در سراسر مخزن را افزایش داده و نمونه کامل استقرار Microsoft Foundry Models با رابط گپ gpt-4.1 را اضافه می‌کند.**

#### افزوده شده
- **🤖 نمونه گپ Microsoft Foundry Models**: استقرار کامل gpt-4.1 با پیاده‌سازی کارا در `examples/azure-openai-chat/`:
  - زیرساخت کامل Microsoft Foundry Models (استقرار مدل gpt-4.1)
  - رابط گپ خط فرمان پایتون با تاریخچه مکالمه
  - ادغام Key Vault برای ذخیره امن کلید API
  - ردیابی استفاده از توکن و برآورد هزینه
  - محدودیت نرخ و مدیریت خطا
  - راهنمای جامع README با مدت زمان ۳۵-۴۵ دقیقه برای استقرار
  - ۱۱ فایل آماده تولید (قالب‌های Bicep، برنامه پایتون، پیکربندی)
- **📚 تمرین‌های مستندسازی**: تمرین‌های عملی به راهنمای پیکربندی افزوده شده:
  - تمرین ۱: پیکربندی چند محیطی (۱۵ دقیقه)
  - تمرین ۲: تمرین مدیریت اسرار (۱۰ دقیقه)
  - معیارهای موفقیت واضح و مراحل تأیید
- **✅ تأیید استقرار**: بخش تأیید به راهنمای استقرار افزوده شده:
  - روش‌های بررسی سلامت
  - فهرست معیارهای موفقیت
  - خروجی‌های مورد انتظار برای همه دستورات استقرار
  - مرجع سریع عیب‌یابی

#### بهبود یافته
- **examples/README.md**: به کیفیت درجه A (۹۳٪) به‌روزرسانی شده:
  - افزوده شدن azure-openai-chat به همه بخش‌های مرتبط
  - افزایش تعداد نمونه‌های محلی از ۳ به ۴
  - افزوده شدن به جدول نمونه‌های کاربرد AI
  - ادغام در شروع سریع برای کاربران متوسط
  - افزوده شدن به بخش قالب‌های Microsoft Foundry
  - به‌روزرسانی ماتریس مقایسه و بخش‌های جستجوی فناوری
- **کیفیت مستندات**: از درجه B+ (۸۷٪) به A- (۹۲٪) در پوشه docs بهبود یافته است

  - خروجی‌های مورد انتظار به مثال‌های دستورات حیاتی اضافه شد  
  - مراحل تأیید برای تغییرات کانفیگ اضافه شد  
  - یادگیری عملی با تمرین‌های کاربردی تقویت شد  

#### تغییرات  
- **پیشرفت یادگیری**: ادغام بهتر مثال‌های هوش مصنوعی برای یادگیرندگان متوسط  
- **ساختار مستندات**: تمرین‌های عملی بیشتر با نتایج واضح  
- **فرایند تأیید**: معیارهای موفقیت آشکار به جریان‌های کاری کلیدی اضافه شدند  

#### بهبودها  
- **تجربه توسعه‌دهنده**: استقرار مدل‌های Microsoft Foundry اکنون ۳۵-۴۵ دقیقه طول می‌کشد (در مقابل ۶۰-۹۰ دقیقه برای گزینه‌های پیچیده‌تر)  
- **شفافیت هزینه**: برآوردهای هزینه واضح (۵۰ تا ۲۰۰ دلار در ماه) برای مثال مدل‌های Microsoft Foundry  
- **مسیر یادگیری**: توسعه‌دهندگان هوش مصنوعی دارای نقطه شروع واضح با azure-openai-chat هستند  
- **استانداردهای مستندات**: خروجی‌های مورد انتظار و مراحل تأیید سازگار شدند  

#### تایید شده  
- ✅ مثال Microsoft Foundry مدل‌ها به طور کامل و با دستور `azd up` کار می‌کند  
- ✅ همه ۱۱ فایل پیاده‌سازی از نظر نحو صحیح هستند  
- ✅ دستورالعمل‌های README مطابق با تجربه واقعی استقرار است  
- ✅ لینک‌های مستندات در بیش از ۸ مکان به‌روزرسانی شده‌اند  
- ✅ فهرست مثال‌ها به دقت ۴ مثال محلی را منعکس می‌کند  
- ✅ هیچ لینک خارجی تکراری در جداول وجود ندارد  
- ✅ همه ارجاعات ناوبری صحیح هستند  

#### پیاده‌سازی فنی  
- **معماری مدل‌های Microsoft Foundry**: الگوی gpt-4.1 + Key Vault + Container Apps  
- **امنیت**: آماده احراز هویت مدیریت شده، اسرار در Key Vault  
- **نظارت**: یکپارچه‌سازی Application Insights  
- **مدیریت هزینه**: پیگیری توکن و بهینه‌سازی مصرف  
- **استقرار**: یک دستور `azd up` برای راه‌اندازی کامل  

### [v3.6.0] - 2025-11-19  

#### به‌روزرسانی عمده: مثال‌های استقرار Container App  
**این نسخه شامل مثال‌های جامع و آماده تولید استقرار برنامه‌های کانتینری با استفاده از Azure Developer CLI (AZD) است که مستندسازی کامل و یکپارچه‌سازی در مسیر یادگیری را ارائه می‌دهد.**  

#### افزودنی‌ها  
- **🚀 مثال‌های Container App**: مثال‌های محلی جدید در `examples/container-app/`:  
  - [راهنمای اصلی](examples/container-app/README.md): نمای کلی کامل از استقرارهای کانتینری، شروع سریع، تولید و الگوهای پیشرفته  
  - [API ساده Flask](../../examples/container-app/simple-flask-api): REST API مناسب مبتدیان با قابلیت مقیاس به صفر، پویش سلامت، نظارت و عیب‌یابی  
  - [معماری میکروسرویس‌ها](../../examples/container-app/microservices): استقرار چندخدمتی آماده تولید (API Gateway, Product, Order, User, Notification)، پیام‌رسانی غیرهمگام، Service Bus, Cosmos DB, Azure SQL، ردیابی توزیع شده، استقرار آبی-سبز/کَنری  
- **بهترین روش‌ها**: راهنمایی‌های امنیت، نظارت، بهینه‌سازی هزینه و CI/CD برای بارهای کاری کانتینری  
- **نمونه‌های کد**: فایل کامل `azure.yaml`، قالب‌های Bicep و پیاده‌سازی چندزبانه سرویس (Python, Node.js, C#, Go)  
- **آزمایش و عیب‌یابی**: سناریوهای آزمون انتها به انتها، دستورات مانیتورینگ و راهنمای عیب‌یابی  

#### تغییرات  
- **README.md**: به‌روزرسانی برای ویژگی و لینک‌دهی به مثال‌های جدید برنامه کانتینری تحت عنوان "مثال‌های محلی - برنامه‌های کانتینری"  
- **examples/README.md**: برجسته‌سازی مثال‌های برنامه کانتینری، افزودن ورودی‌های ماتریس مقایسه و به‌روزرسانی مراجع فناوری/معماری  
- **طرح درس و راهنمای مطالعه**: ارجاع به مثال‌ها و الگوهای استقرار جدید در فصل‌های مرتبط  

#### تایید شده  
- ✅ همه مثال‌های جدید با `azd up` قابل استقرار هستند و بهترین شیوه‌ها را دنبال می‌کنند  
- ✅ لینک‌های متقاطع مستندات و ناوبری به‌روزرسانی شدند  
- ✅ مثال‌ها سناریوهای مبتدی تا پیشرفته، شامل میکروسرویس‌های تولیدی را پوشش می‌دهند  

#### نکات  
- **دامنه**: مستندات و مثال‌ها فقط به زبان انگلیسی هستند  
- **گام‌های بعدی**: گسترش با الگوهای پیشرفته کانتینر و اتوماسیون CI/CD در نسخه‌های آینده  

### [v3.5.0] - 2025-11-19  

#### بازبرندسازی محصول: Microsoft Foundry  
**این نسخه تغییر نام رسمی محصول از "Microsoft Foundry" به "Microsoft Foundry" را در تمام مستندات انگلیسی پیاده‌سازی می‌کند که بازبرندسازی رسمی مایکروسافت را منعکس می‌نماید.**  

#### تغییرات  
- **🔄 به‌روزرسانی نام محصول**: بازبرندینگ کامل از "Microsoft Foundry" به "Microsoft Foundry"  
  - همه ارجاعات در مستندات انگلیسی پوشه `docs/` به‌روزرسانی شدند  
  - نام پوشه تغییر یافت: `docs/ai-foundry/` → `docs/microsoft-foundry/`  
  - نام فایل تغییر یافت: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
  - مجموعاً ۲۳ ارجاع محتوایی در ۷ فایل مستندات به‌روزرسانی شد  

- **📁 تغییرات ساختار پوشه‌ها**:  
  - تغییر نام `docs/ai-foundry/` به `docs/microsoft-foundry/`  
  - همه ارجاعات متقاطع برای منعکس کردن ساختار جدید به‌روزرسانی شدند  
  - لینک‌های ناوبری در تمام مستندات تایید شدند  

- **📄 تغییر نام فایل‌ها**:  
  - از `azure-ai-foundry-integration.md` به `microsoft-foundry-integration.md`  
  - همه لینک‌های داخلی به نام فایل جدید اصلاح شدند  

#### فایل‌های به‌روزرسانی شده  
- **مستندات فصل** (۷ فایل):  
  - `docs/microsoft-foundry/ai-model-deployment.md` - سه به‌روزرسانی لینک ناوبری  
  - `docs/microsoft-foundry/ai-workshop-lab.md` - چهار ارجاع نام محصول به‌روزرسانی شد  
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - از قبل از Microsoft Foundry استفاده می‌کند (از به‌روزرسانی‌های قبلی)  
  - `docs/microsoft-foundry/production-ai-practices.md` - سه ارجاع به‌روزرسانی شد (نمای کلی، بازخورد جامعه، مستندات)  
  - `docs/getting-started/azd-basics.md` - چهار لینک ارجاع متقاطع به‌روزرسانی شدند  
  - `docs/getting-started/first-project.md` - دو لینک ناوبری فصل به‌روزرسانی شدند  
  - `docs/getting-started/installation.md` - دو لینک فصل بعدی به‌روزرسانی شدند  
  - `docs/troubleshooting/ai-troubleshooting.md` - سه ارجاع به‌روزرسانی شد (ناوبری، جامعه Discord)  
  - `docs/troubleshooting/common-issues.md` - یک لینک ناوبری به‌روزرسانی شد  
  - `docs/troubleshooting/debugging.md` - یک لینک ناوبری به‌روزرسانی شد  

- **فایل‌های ساختار دوره** (۲ فایل):  
  - `README.md` - ۱۷ ارجاع به‌روزرسانی شد (مرور دوره، عناوین فصل‌ها، بخش قالب‌ها، دیدگاه‌های جامعه)  
  - `course-outline.md` - ۱۴ ارجاع به‌روزرسانی شد (مرور، اهداف یادگیری، منابع فصل‌ها)  

#### تایید شده  
- ✅ هیچ ارجاع مسیر پوشه "ai-foundry" باقی نمانده در مستندات انگلیسی  
- ✅ هیچ ارجاع نام محصول "Microsoft Foundry" باقی نمانده در مستندات انگلیسی  
- ✅ همه لینک‌های ناوبری با ساختار پوشه جدید کار می‌کنند  
- ✅ تغییر نام فایل‌ها و پوشه‌ها با موفقیت انجام شده است  
- ✅ ارجاعات متقاطع بین فصل‌ها تایید شده‌اند  

#### نکات  
- **دامنه**: تغییرات فقط در مستندات انگلیسی پوشه `docs/` اعمال شده‌اند  
- **ترجمه‌ها**: پوشه‌های ترجمه (`translations/`) در این نسخه به‌روزرسانی نشده‌اند  
- **کارگاه**: مواد کارگاه (`workshop/`) در این نسخه به‌روزرسانی نشده‌اند  
- **مثال‌ها**: فایل‌های مثال ممکن است هنوز به نام‌های قدیمی اشاره کنند (در به‌روزرسانی‌های آینده اصلاح می‌شود)  
- **لینک‌های خارجی**: URLهای خارجی و ارجاعات مخزن GitHub بدون تغییر باقی مانده‌اند  

#### راهنمای مهاجرت برای مشارکت‌کنندگان  
اگر شاخه‌های محلی یا مستندات به ساختار قدیمی ارجاع دارند:  
1. ارجاعات پوشه را به‌روزرسانی کنید: `docs/ai-foundry/` → `docs/microsoft-foundry/`  
2. ارجاعات فایل را به‌روزرسانی کنید: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
3. نام محصول را جایگزین کنید: "Microsoft Foundry" → "Microsoft Foundry"  
4. اطمینان حاصل کنید که کلیه لینک‌های داخلی مستندات هنوز کار می‌کنند  

---

### [v3.4.0] - 2025-10-24  

#### پیش‌نمایش زیرساخت و بهبودهای اعتبارسنجی  
**این نسخه پشتیبانی جامعی از ویژگی پیش‌نمایش جدید Azure Developer CLI ارائه می‌دهد و تجربه کاربری کارگاه را بهبود می‌بخشد.**  

#### افزودنی‌ها  
- **🧪 مستندات ویژگی azd provision --preview**: پوشش جامع قابلیت جدید پیش‌نمایش زیرساخت  
  - مراجع دستور و مثال‌های کاربردی در چیت شیت  
  - یکپارچه‌سازی مفصل در راهنمای تأمین زیرساخت با موارد استفاده و مزایا  
  - ادغام بررسی پیش‌پرواز برای اعتبارسنجی امن‌تر استقرار  
  - به‌روزرسانی راهنمای شروع با روش‌های ایمن استقرار  
- **🚧 بنر وضعیت کارگاه**: بنر HTML حرفه‌ای که وضعیت توسعه کارگاه را نشان می‌دهد  
  - طراحی گرادیان با نشانگرهای ساخت برای ارتباط واضح با کاربر  
  - نشانگر زمان آخرین به‌روزرسانی برای شفافیت  
  - طراحی واکنش‌گرا برای همه دستگاه‌ها  

#### بهبودها  
- **ایمنی زیرساخت**: قابلیت پیش‌نمایش در سراسر مستندات استقرار یکپارچه شده است  
- **اعتبارسنجی پیش از استقرار**: اسکریپت‌های خودکار اکنون شامل تست پیش‌نمایش زیرساخت هستند  
- **جریان کاری توسعه‌دهنده**: توالی دستورهای به‌روزرسانی شده برای شامل شدن پیش‌نمایش به عنوان بهترین روش  
- **تجربه کارگاه**: انتظارات واضح برای کاربران درباره وضعیت توسعه محتوا تعیین شده است  

#### تغییرات  
- **بهترین روش‌های استقرار**: جریان کاری با پیش‌نمایش به عنوان رویکرد پیشنهادی  
- **جریان مستندسازی**: اعتبارسنجی زیرساخت زودتر در روند یادگیری منتقل شده است  
- **ارائه کارگاه**: ارتباط وضعیت حرفه‌ای با جدول زمانی توسعه واضح  

#### بهبودها  
- **رویکرد ایمنی‌محور**: اکنون تغییرات زیرساخت قبل از استقرار قابل اعتبارسنجی هستند  
- **همکاری تیمی**: نتایج پیش‌نمایش می‌توانند برای بازبینی و تأیید به اشتراک گذاشته شوند  
- **آگاهی از هزینه‌ها**: درک بهتر هزینه‌های منابع پیش از تأمین  
- **کاهش ریسک**: کاهش شکست‌های استقرار از طریق اعتبارسنجی پیشرفته  

#### پیاده‌سازی فنی  
- **یکپارچه‌سازی چندمستندی**: ویژگی پیش‌نمایش در ۴ فایل کلیدی مستندسازی شده است  
- **الگوهای دستوری**: نحو و مثال‌های سازگار در سراسر مستندات  
- **ادغام بهترین شیوه**: پیش‌نمایش در جریان‌های کاری اعتبارسنجی و اسکریپت‌ها درج شده است  
- **نشانگرهای بصری**: علامت‌گذاری ویژگی جدید برای کشف بهتر  

#### زیرساخت کارگاه  
- **ارتباط وضعیت**: بنر HTML حرفه‌ای با استایل گرادیان  
- **تجربه کاربری**: وضعیت توسعه واضح از سردرگمی جلوگیری می‌کند  
- **ارائه حرفه‌ای**: اعتبار مخزن را حفظ کرده و انتظارات را تنظیم می‌کند  
- **شفافیت جدول زمانی**: زمان آخرین به‌روزرسانی اکتبر ۲۰۲۵ برای پاسخگویی  

### [v3.3.0] - 2025-09-24  

#### بهبود مواد کارگاه و تجربه یادگیری تعاملی  
**این نسخه شامل مواد کامل کارگاه با راهنماهای تعاملی مبتنی بر مرورگر و مسیرهای یادگیری ساختارمند است.**  

#### افزودنی‌ها  
- **🎥 راهنمای تعاملی کارگاه**: تجربه کارگاهی مبتنی بر مرورگر با قابلیت پیش‌نمایش MkDocs  
- **📝 دستورالعمل‌های ساختارمند کارگاه**: مسیر یادگیری ۷ مرحله‌ای از کشف تا سفارشی‌سازی  
  - 0-مقدمه: مرور و راه‌اندازی کارگاه  
  - 1-انتخاب قالب هوش مصنوعی: فرآیند کشف و انتخاب قالب  
  - 2-اعتبارسنجی قالب AI: رویه‌های استقرار و اعتبارسنجی  
  - 3-تحلیل قالب AI: درک معماری قالب  
  - 4-پیکربندی قالب AI: کانفیگ و سفارشی‌سازی  
  - 5-سفارشی‌سازی قالب AI: تغییرات پیشرفته و تکرار‌ها  
  - 6-پاکسازی زیرساخت: مدیریت منابع و تمیزکاری  
  - 7-خلاصه و گام‌های بعدی  
- **🛠️ ابزارهای کارگاه**: پیکربندی MkDocs با تم Material برای تجربه بهتر یادگیری  
- **🎯 مسیر یادگیری عملی**: روش سه مرحله‌ای (کشف → استقرار → سفارشی‌سازی)  
- **📱 ادغام GitHub Codespaces**: راه‌اندازی محیط توسعه بی‌وقفه  

#### بهبودها  
- **آزمایشگاه هوش مصنوعی**: توسعه‌یافته با تجربه یادگیری ساختارمند کامل ۲ تا ۳ ساعت  
- **مستندسازی کارگاه**: ارائه حرفه‌ای با ناوبری و ابزارهای بصری  
- **پیشرفت یادگیری**: راهنمای واضح مرحله به مرحله از انتخاب قالب تا استقرار تولید  
- **تجربه توسعه‌دهنده**: ابزارهای یکپارچه شده برای جریان‌های کاری توسعه ساده‌تر  

#### بهبودها  
- **دسترسی‌پذیری**: رابط مبتنی بر مرورگر با قابلیت جستجو، کپی کد و تغییر تم  
- **یادگیری خودسرعت**: ساختار کارگاه انعطاف‌پذیر که سرعت‌های یادگیری متفاوت را پوشش می‌دهد  
- **کاربرد عملی**: سناریوهای واقعی استقرار قالب‌های هوش مصنوعی  
- **یکپارچه‌سازی جامعه**: ادغام Discord برای پشتیبانی و همکاری در کارگاه  

#### ویژگی‌های کارگاه  
- **جستجوی داخلی**: کشف سریع درس و کلمات کلیدی  
- **کپی بلوک‌های کد**: عملکرد هاور-برای-کپی در تمام مثال‌های کد  
- **تغییر تم**: پشتیبانی از حالت تاریک/روشن برای سلیقه‌های مختلف  
- **دارایی‌های بصری**: تصاویر صفحه و نمودارها برای فهم بهتر  
- **ادغام کمک**: دسترسی مستقیم به Discord برای پشتیبانی جامعه  

### [v3.2.0] - 2025-09-17  

#### بازسازی ناوبری و سیستم یادگیری مبتنی بر فصل  
**این نسخه شامل ساختار یادگیری مبتنی بر فصل جامع با ناوبری بهبود یافته در سراسر مخزن است.**  

#### افزودنی‌ها  
- **📚 سیستم یادگیری فصل‌محور**: کل دوره به ۸ فصل یادگیری پیش‌رونده ساختاردهی مجدد شد  
  - فصل ۱: پایه و شروع سریع (⭐ - ۳۰ تا ۴۵ دقیقه)  
  - فصل ۲: توسعه AI-اول (⭐⭐ - ۱ تا ۲ ساعت)  
  - فصل ۳: پیکربندی و احراز هویت (⭐⭐ - ۴۵ تا ۶۰ دقیقه)  
  - فصل ۴: زیرساخت به عنوان کد و استقرار (⭐⭐⭐ - ۱ تا ۱.۵ ساعت)  
  - فصل ۵: راهکارهای هوش مصنوعی چندعاملی (⭐⭐⭐⭐ - ۲ تا ۳ ساعت)  
  - فصل ۶: اعتبارسنجی پیش از استقرار و برنامه‌ریزی (⭐⭐ - یک ساعت)  
  - فصل ۷: عیب‌یابی و دیباگ (⭐⭐ - ۱ تا ۱.۵ ساعت)  
  - فصل ۸: الگوهای تولید و سازمانی (⭐⭐⭐⭐ - ۲ تا ۳ ساعت)  
- **📚 سیستم ناوبری جامع**: هدر و فوتر ناوبری سازگار در همه مستندات  
- **🎯 پیگیری پیشرفت**: چک‌لیست اتمام دوره و سیستم تأیید یادگیری  
- **🗺️ راهنمای مسیر یادگیری**: نقاط ورود واضح برای سطوح تجربه و اهداف مختلف  
- **🔗 ناوبری ارجاع متقابل**: فصل‌های مرتبط و پیش‌نیازها به طور روشن لینک شده‌اند  

#### بهبودها  
- **ساختار README**: تبدیل به پلتفرم یادگیری ساختارمند با سازمان‌دهی بر اساس فصل  
- **ناوبری مستندات**: هر صفحه اکنون شامل زمینه فصل و هدایت پیشرفت است  
- **سازماندهی قالب‌ها**: مثال‌ها و قالب‌ها به فصل‌های یادگیری مناسب نگاشت شده‌اند  

- **ادغام منابع**: برگه‌های تقلب، پرسش‌های متداول و راهنماهای مطالعه مرتبط با فصل‌های مربوطه
- **ادغام کارگاه‌ها**: آزمایشگاه‌های عملی مرتبط با اهداف یادگیری چندین فصل

#### تغییرات
- **پیشرفت یادگیری**: حرکت از مستندسازی خطی به یادگیری انعطاف‌پذیر مبتنی بر فصل
- **مکان‌یابی پیکربندی**: انتقال راهنمای پیکربندی به فصل ۳ برای جریان بهتر یادگیری
- **ادغام محتوای هوش مصنوعی**: ادغام بهتر محتوای خاص هوش مصنوعی در طول مسیر یادگیری
- **محتوای تولیدی**: الگوهای پیشرفته در فصل ۸ برای یادگیرندگان سازمانی گردآوری شده‌اند

#### بهبود یافته
- **تجربه کاربری**: مسیرهای پیمایش واضح و شاخص‌های پیشرفت فصل
- **دسترس‌پذیری**: الگوهای پیمایش مداوم برای تسهیل عبور از دوره
- **ارائه حرفه‌ای**: ساختار دوره به سبک دانشگاهی متناسب با آموزش‌های آکادمیک و سازمانی
- **کارایی یادگیری**: کاهش زمان یافتن محتوای مرتبط از طریق سازماندهی بهبود یافته

#### پیاده‌سازی فنی
- **سرصفحه‌های پیمایش**: استانداردسازی پیمایش فصل‌ها در بیش از ۴۰ فایل مستندات
- **پیمایش پاورقی**: راهنمای پیشرفت سازگار و شاخص‌های تکمیل فصل
- **پیوندهای متقاطع**: سیستم جامع لینک‌دهی داخلی که مفاهیم مرتبط را متصل می‌کند
- **نگاشت فصل**: قالب‌ها و مثال‌ها به وضوح با اهداف یادگیری مرتبط شده‌اند

#### بهبود راهنمای مطالعه
- **📚 اهداف یادگیری جامع**: بازساخت راهنمای مطالعه مطابق با سیستم ۸ فصلی
- **🎯 ارزیابی مبتنی بر فصل**: هر فصل شامل اهداف یادگیری خاص و تمرین‌های عملی است
- **📋 پیگیری پیشرفت**: برنامه یادگیری هفتگی با نتایج قابل اندازه‌گیری و چک‌لیست تکمیل
- **❓ سوالات ارزیابی**: سوالات اعتبارسنجی دانش برای هر فصل با نتایج حرفه‌ای
- **🛠️ تمرین‌های عملی**: فعالیت‌های دستی با سناریوهای واقعی استقرار و عیب‌یابی
- **📊 پیشرفت مهارتی**: پیشرفت واضح از مفاهیم پایه تا الگوهای سازمانی با تمرکز بر توسعه شغلی
- **🎓 چارچوب صدور گواهینامه**: نتایج توسعه حرفه‌ای و سیستم شناخت جامعه
- **⏱️ مدیریت زمان‌بندی**: برنامه یادگیری ساختاری ۱۰ هفته‌ای با اعتبارسنجی مراحل میانی

### [v3.1.0] - 2025-09-17

#### بهبود راهکارهای هوش مصنوعی چندعامله
**این نسخه راهکار چندعامله خرده‌فروشی را با نام‌گذاری بهتر عامل‌ها و مستندسازی بهبود یافته ارتقا می‌دهد.**

#### تغییرات
- **اصطلاحات چندعامله**: جایگزینی "عامل Cora" با "عامل مشتری" در راهکار چندعامله خرده‌فروشی برای درک بهتر
- **معماری عامل**: به‌روزرسانی تمام مستندات، قالب‌های ARM، و مثال‌های کد به منظور استفاده از نام‌گذاری یکنواخت "عامل مشتری"
- **مثال‌های پیکربندی**: به‌روزرسانی الگوهای پیکربندی عامل با نام‌گذاری به‌روز شده
- **یکپارچگی مستندات**: اطمینان از استفاده همه مراجع از نام‌های حرفه‌ای و توصیفی برای عامل

#### ارتقا یافته
- **بسته قالب ARM**: به‌روزرسانی retail-multiagent-arm-template با ارجاعات به عامل مشتری
- **نمودارهای معماری**: به‌روزرسانی نمودارهای Mermaid با نام‌گذاری جدید عامل
- **مثال‌های کد**: کلاس‌ها و نمونه‌ کدهای پیاده‌سازی پایتون اکنون از نام CustomerAgent استفاده می‌کنند
- **متغیرهای محیطی**: به‌روزرسانی تمام اسکریپت‌های استقرار برای استفاده از الگوهای CUSTOMER_AGENT_NAME

#### بهبود یافته
- **تجربه توسعه‌دهنده**: نقش‌ها و مسئولیت‌های عامل در مستندات واضح‌تر شده‌اند
- **آمادگی برای تولید**: هماهنگی بهتر با الگوهای نام‌گذاری سازمانی
- **مواد آموزشی**: نام‌گذاری عامل برای اهداف آموزشی به صورت شهودی‌تر
- **قابلیت استفاده قالب**: درک ساده‌تر از عملکرد عوامل و الگوهای استقرار

#### جزئیات فنی
- به‌روزرسانی نمودارهای معماری Mermaid با ارجاعات CustomerAgent
- جایگزینی نام‌های کلاس CoraAgent با CustomerAgent در مثال‌های پایتون
- اصلاح پیکربندی‌های JSON قالب ARM برای استفاده از نوع عامل "customer"
- به‌روزرسانی متغیرهای محیطی از CORA_AGENT_* به الگوهای CUSTOMER_AGENT_*
- تازه‌سازی تمام دستورات استقرار و تنظیمات کانتینر

### [v3.0.0] - 2025-09-12

#### تغییرات عمده - تمرکز بر توسعه‌دهنده هوش مصنوعی و ادغام Microsoft Foundry
**این نسخه مخزن را به یک منبع یادگیری کامل برای هوش مصنوعی با ادغام Microsoft Foundry تبدیل می‌کند.**

#### افزوده شده
- **🤖 مسیر یادگیری اول هوش مصنوعی**: بازساخت کامل با اولویت توسعه‌دهندگان و مهندسان هوش مصنوعی
- **راهنمای ادغام Microsoft Foundry**: مستندسازی کامل برای اتصال AZD به خدمات Microsoft Foundry
- **الگوهای استقرار مدل هوش مصنوعی**: راهنمای جامع برای انتخاب مدل، پیکربندی و استقرار تولیدی
- **کارگاه آزمایشگاهی هوش مصنوعی**: کارگاه عملی ۲ تا ۳ ساعته برای تبدیل برنامه‌های هوش مصنوعی به راهکارهای قابل استقرار AZD
- **بهترین رویه‌های هوش مصنوعی در تولید**: الگوهای آماده سازمانی برای مقیاس‌بندی، مانیتورینگ و ایمن‌سازی بارهای کاری هوش مصنوعی
- **راهنمای عیب‌یابی مخصوص هوش مصنوعی**: عیب‌یابی جامع برای مدل‌های Microsoft Foundry، سرویس‌های شناختی و مشکلات استقرار هوش مصنوعی
- **گالری قالب‌های هوش مصنوعی**: مجموعه منتخب قالب‌های Microsoft Foundry با رتبه‌بندی پیچیدگی
- **مواد کارگاه**: ساختار کامل کارگاه با آزمایشگاه‌های عملی و منابع مرجع

#### بهبود یافته
- **ساختار README**: ویژه توسعه‌دهندگان هوش مصنوعی با داده‌های ۴۵% علاقه‌مندی جامعه از Discord مایکروسافت فاندری
- **مسیرهای یادگیری**: مسیر اختصاصی توسعه‌دهنده هوش مصنوعی همراه با مسیرهای سنتی برای دانشجویان و مهندسان DevOps
- **توصیه‌های قالب**: قالب‌های منتخب هوش مصنوعی شامل azure-search-openai-demo، contoso-chat و openai-chat-app-quickstart
- **ادغام جامعه**: پشتیبانی بهبود یافته از جامعه Discord با کانال‌ها و بحث‌های اختصاصی هوش مصنوعی

#### امنیت و تمرکز بر تولید
- **الگوهای مدیریت هویت**: پیکربندی‌های امنیتی و احراز هویت ویژه هوش مصنوعی
- **بهینه‌سازی هزینه**: پیگیری مصرف توکن و کنترل بودجه برای بارهای کاری هوش مصنوعی
- **استقرار چند منطقه‌ای**: استراتژی‌هایی برای استقرار جهانی برنامه‌های هوش مصنوعی
- **مانیتورینگ عملکرد**: معیارهای خاص هوش مصنوعی و ادغام Application Insights

#### کیفیت مستندات
- **ساختار دوره خطی**: پیشرفت منطقی از مدل‌های استقرار مبتدی تا پیشرفته هوش مصنوعی
- **آدرس‌های URL معتبر**: همه لینک‌های مخزن خارجی تأیید شده و قابل دسترسی هستند
- **مرجع کامل**: همه لینک‌های داخلی مستندات تأیید شده و عملی
- **آماده تولید**: الگوهای استقرار سازمانی با نمونه‌های دنیای واقعی

### [v2.0.0] - 2025-09-09

#### تغییرات عمده - بازسازی مخزن و ارتقاء حرفه‌ای
**این نسخه نشان‌دهنده بازسازی قابل توجه ساختار مخزن و ارائه محتوای حرفه‌ای است.**

#### افزوده شده
- **چارچوب یادگیری ساختاریافته**: همه صفحات مستندات حالا شامل بخش‌های معرفی، اهداف یادگیری و نتایج یادگیری هستند
- **سیستم پیمایش**: افزودن لینک‌های درس قبلی/بعدی در تمام مستندات برای پیشرفت هدایت شده یادگیری
- **راهنمای مطالعه**: study-guide.md جامع با اهداف یادگیری، تمرین‌های عملی و مواد ارزیابی
- **ارائه حرفه‌ای**: حذف تمام آیکون‌های ایموجی برای بهبود دسترس‌پذیری و ظاهر حرفه‌ای
- **ساختار محتوای بهبود یافته**: سازماندهی و جریان بهتر مواد یادگیری

#### تغییرات
- **قالب مستندات**: استانداردسازی همه مستندات با ساختار متمرکز بر یادگیری منسجم
- **جریان پیمایش**: پیاده‌سازی پیشرفت منطقی در تمام مواد یادگیری
- **ارائه محتوا**: حذف عناصر تزئینی به نفع قالب‌بندی واضح، حرفه‌ای
- **ساختار لینک‌ها**: به‌روزرسانی تمام لینک‌های داخلی برای پشتیبانی از سیستم پیمایش جدید

#### بهبود یافته
- **دسترس‌پذیری**: حذف وابستگی به ایموجی‌ها برای سازگاری بهتر با صفحه‌خوان‌ها
- **ظاهر حرفه‌ای**: ارائه تمیز و به سبک آکادمیک مناسب آموزش سازمانی
- **تجربه یادگیری**: رویکرد ساختاریافته با اهداف و نتایج واضح برای هر درس
- **سازماندهی محتوا**: جریان منطقی بهتر و ارتباط بین موضوعات مرتبط

### [v1.0.0] - 2025-09-09

#### انتشار اولیه - مخزن یادگیری جامع AZD

#### افزوده شده
- **ساختار اصلی مستندات**
  - سلسله راهنمای شروع کامل
  - مستندات جامع استقرار و فراهم‌سازی
  - منابع عیب‌یابی و راهنمای رفع اشکال دقیق
  - ابزارها و روش‌های اعتبارسنجی پیش از استقرار

- **ماژول شروع به کار**
  - اصول اولیه AZD: مفاهیم اصلی و اصطلاحات
  - راهنمای نصب: دستورالعمل‌های پلتفرم-محور
  - راهنمای پیکربندی: تنظیم محیط و احراز هویت
  - آموزش پروژه اول: یادگیری گام به گام عملی

- **ماژول استقرار و فراهم‌سازی**
  - راهنمای استقرار: مستندسازی کامل روند کار
  - راهنمای فراهم‌سازی: زیرساخت به عنوان کد با بایسک
  - بهترین شیوه‌ها برای استقرارهای تولیدی
  - الگوهای معماری چندخدمتی

- **ماژول اعتبارسنجی پیش از استقرار**
  - برنامه‌ریزی ظرفیت: اعتبارسنجی در دسترس بودن منابع آزور
  - انتخاب SKU: راهنمای جامع سطح خدمات
  - بررسی‌های پیش‌پرواز: اسکریپت‌های اعتبارسنجی خودکار (پاورشل و بش)
  - ابزارهای برآورد هزینه و برنامه‌ریزی بودجه

- **ماژول عیب‌یابی**
  - مشکلات رایج: مسائل متداول و راه‌حل‌ها
  - راهنمای رفع اشکال: متدولوژی‌های سیستماتیک عیب‌یابی
  - تکنیک‌ها و ابزارهای تشخیصی پیشرفته
  - مانیتورینگ عملکرد و بهینه‌سازی

- **منابع و مراجع**
  - برگه خلاصه دستورات: مرجع سریع دستورات ضروری
  - واژه‌نامه: تعاریف جامع اصطلاحات و مخفف‌ها
  - پرسش‌های متداول: پاسخ‌های دقیق به سوالات رایج
  - لینک‌های منابع خارجی و ارتباطات جامعه

- **مثال‌ها و قالب‌ها**
  - مثال ساده برنامه وب
  - قالب استقرار وب‌سایت استاتیک
  - پیکربندی برنامه کانتینری
  - الگوهای یکپارچه‌سازی پایگاه داده
  - مثال‌های معماری میکروسرویس
  - پیاده‌سازی عملکرد بدون سرور

#### ویژگی‌ها
- **پشتیبانی چندسکویی**: راهنماهای نصب و پیکربندی برای ویندوز، مک او اس، و لینوکس
- **سطوح مهارتی متعدد**: محتوا طراحی شده برای دانشجویان تا توسعه‌دهندگان حرفه‌ای
- **تمرکز عملی**: مثال‌های عملی و سناریوهای دنیای واقعی
- **پوشش جامع**: از مفاهیم پایه تا الگوهای پیشرفته سازمانی
- **رویکرد امنیت-محور**: بهترین شیوه‌های امنیتی در سراسر محتوا
- **بهینه‌سازی هزینه**: راهنمایی برای استقرارهای هزینه‌بهینه و مدیریت منابع

#### کیفیت مستندات
- **مثال‌های کد دقیق**: نمونه‌های عملی و آزمایش شده
- **دستورالعمل‌های گام به گام**: راهنمای واضح و قابل اجرا
- **مدیریت جامع خطا**: عیب‌یابی مشکلات رایج
- **ادغام بهترین شیوه‌ها**: استانداردها و توصیه‌های صنعت
- **سازگاری نسخه‌ها**: به‌روز با آخرین خدمات آزور و ویژگی‌های azd

## بهبودهای برنامه‌ریزی شده آینده

### نسخه ۳.۱.۰ (در برنامه)
#### گسترش پلتفرم هوش مصنوعی
- **پشتیبانی چندمدلی**: الگوهای ادغام برای Hugging Face، Azure Machine Learning، و مدل‌های سفارشی
- **چارچوب‌های عامل هوش مصنوعی**: قالب‌هایی برای استقرار LangChain، Semantic Kernel، و AutoGen
- **الگوهای پیشرفته RAG**: گزینه‌های پایگاه داده برداری فراتر از Azure AI Search (Pinecone, Weaviate و غیره)
- **قابلیت نظارت هوش مصنوعی**: مانیتورینگ پیشرفته برای عملکرد مدل، مصرف توکن، و کیفیت پاسخ

#### تجربه توسعه‌دهنده
- **افزونه VS Code**: تجربه توسعه یکپارچه AZD + Microsoft Foundry
- **ادغام GitHub Copilot**: تولید قالب AZD با کمک هوش مصنوعی
- **آموزش‌های تعاملی**: تمرین‌های برنامه‌نویسی عملی با اعتبارسنجی خودکار برای سناریوهای هوش مصنوعی
- **محتوای ویدیویی**: آموزش‌های ویدیویی مکمل برای یادگیرندگان تصویری با تمرکز بر استقرارهای هوش مصنوعی

### نسخه ۴.۰.۰ (در برنامه)
#### الگوهای سازمانی هوش مصنوعی
- **چارچوب حاکمیت**: حاکمیت مدل هوش مصنوعی، انطباق، و سوابق حسابرسی
- **هوش مصنوعی چندمستاجری**: الگوهایی برای ارائه به چند مشتری با خدمات هوش مصنوعی جداشده
- **استقرار هوش مصنوعی در لبه**: ادغام با Azure IoT Edge و نمونه‌های کانتینری
- **ابر هیبرید هوش مصنوعی**: الگوهای استقرار چند ابری و هیبریدی برای بارهای کاری هوش مصنوعی

#### ویژگی‌های پیشرفته
- **خودکارسازی خط لوله هوش مصنوعی**: ادغام MLOps با خط لوله‌های Azure Machine Learning
- **امنیت پیشرفته**: الگوهای امنیت صفراعتمادی، نقاط انتهایی خصوصی، و حفاظت تهدید پیشرفته
- **بهینه‌سازی عملکرد**: تنظیمات پیشرفته و استراتژی‌های مقیاس‌بندی برای برنامه‌های هوش مصنوعی با توان بالا
- **توزیع جهانی**: الگوهای تحویل محتوا و کشینگ لبه برای برنامه‌های هوش مصنوعی

### نسخه ۳.۰.۰ (در برنامه) - جایگزین شده توسط انتشار فعلی
#### افزودنی‌های پیشنهادی - اکنون در v3.0.0 پیاده‌سازی شده‌اند
- ✅ **محتوای متمرکز بر هوش مصنوعی**: ادغام کامل Microsoft Foundry (تکمیل شده)
- ✅ **آموزش‌های تعاملی**: کارگاه آزمایشگاهی عملی هوش مصنوعی (تکمیل شده)
- ✅ **ماژول امنیت پیشرفته**: الگوهای امنیتی خاص هوش مصنوعی (تکمیل شده)
- ✅ **بهینه‌سازی عملکرد**: استراتژی‌های بهینه‌سازی بار کاری هوش مصنوعی (تکمیل شده)

### نسخه ۲.۱.۰ (در برنامه) - تا حدی در v3.0.0 پیاده‌سازی شده
#### بهبودهای جزئی - برخی در انتشار فعلی تکمیل شده‌اند
- ✅ **مثال‌های اضافی**: سناریوهای استقرار متمرکز بر هوش مصنوعی (تکمیل شده)
- ✅ **پرسش‌های متداول گسترش یافته**: سوالات و عیب‌یابی‌های خاص هوش مصنوعی (تکمیل شده)
- **ادغام ابزار**: راهنمایی‌های پیشرفته ادغام IDE و ویرایشگر
- ✅ **گسترش مانیتورینگ**: الگوهای مانیتورینگ و هشداردهی خاص هوش مصنوعی (تکمیل شده)

#### همچنان در برنامه برای انتشار آینده
- **مستندات موبایل‌پسند**: طراحی واکنش‌گرا برای یادگیری موبایلی
- **دسترسی آفلاین**: بسته‌های مستندات قابل دانلود
- **ادغام پیشرفته IDE**: افزونه VS Code برای جریان‌های کاری AZD + هوش مصنوعی
- **داشبورد جامعه**: معیارها و پیگیری مشارکت جامعه در زمان واقعی

## مشارکت در تغییرات

### گزارش تغییرات
هنگام مشارکت در این مخزن، لطفاً اطمینان حاصل کنید که ورودی‌های changelog شامل موارد زیر هستند:

۱. **شماره نسخه**: پیروی از نسخه‌بندی معنایی (بزرگ.کوچک.پچ)
۲. **تاریخ**: تاریخ انتشار یا به‌روزرسانی به فرمت YYYY-MM-DD
۳. **دسته‌بندی**: افزوده شده، تغییر یافته، منسوخ شده، حذف شده، اصلاح شده، امنیتی
۴. **توضیح واضح**: شرح مختصر از تغییرات اعمال شده
۵. **ارزیابی تاثیر**: نحوه تأثیر تغییرات بر کاربران موجود

### دسته‌بندی تغییرات

#### افزوده شده
- ویژگی‌ها، بخش‌ها یا قابلیت‌های مستندات جدید
- مثال‌های جدید، قالب‌ها، یا منابع یادگیری
- ابزارها، اسکریپت‌ها، یا امکانات اضافی

#### تغییر یافته
- تغییرات در عملکرد یا مستندات موجود
- به‌روزرسانی‌ها برای بهبود وضوح یا دقت
- بازسازی محتوا یا سازماندهی

#### منسوخ شده
- ویژگی‌ها یا رویکردهایی که مرحله حذف را طی می‌کنند
- بخش‌های مستنداتی که قرار است حذف شوند
- روش‌هایی که جایگزین‌های بهتری دارند

#### حذف شده
- ویژگی‌ها، مستندات، یا مثال‌هایی که دیگر مرتبط نیستند
- اطلاعات منقضی شده یا رویکردهای منسوخ
- محتوای تکراری یا تجمیع شده

#### اصلاح شده
- اصلاحات خطاهای مستندات یا کد
- رفع مسائل یا مشکلات گزارش شده
- بهبود دقت یا عملکرد


#### امنیت
- بهبودها یا رفع‌های مرتبط با امنیت
- بروزرسانی‌های بهترین شیوه‌های امنیتی
- رفع آسیب‌پذیری‌های امنیتی

### راهنمای نسخه‌بندی معنایی

#### نسخه اصلی (X.0.0)
- تغییرات بزرگ که نیاز به اقدام کاربر دارند
- بازسازی قابل توجه محتوا یا سازماندهی
- تغییراتی که رویکرد یا روش‌شناسی پایه را تغییر می‌دهند

#### نسخه جزئی (X.Y.0)
- ویژگی‌های جدید یا افزودنی‌های محتوا
- بهبودهایی که سازگاری رو به عقب را حفظ می‌کنند
- مثال‌ها، ابزارها یا منابع اضافی

#### نسخه اصلاحی (X.Y.Z)
- رفع باگ‌ها و اصلاحات
- بهبودهای جزئی در محتوای موجود
- روشن‌سازی‌ها و بهبودهای کوچک

## بازخورد و پیشنهادات جامعه

ما فعالانه از بازخورد جامعه برای بهبود این منبع یادگیری استقبال می‌کنیم:

### چگونه بازخورد ارائه دهیم
- **مسائل GitHub**: گزارش مشکلات یا پیشنهاد بهبودها (مسائل خاص AI نیز پذیرفته می‌شود)
- **بحث‌های Discord**: به اشتراک‌گذاری ایده‌ها و تعامل با جامعه Microsoft Foundry
- **درخواست‌های Pull**: مشارکت در بهبود مستقیم محتوا، به ویژه قالب‌ها و راهنمای AI
- **Discord Microsoft Foundry**: مشارکت در کانال #Azure برای بحث‌های AZD + AI
- **انجمن‌های جامعه**: مشارکت در بحث‌های گسترده‌تر توسعه‌دهندگان Azure

### دسته‌بندی‌های بازخورد
- **دقت محتوای AI**: اصلاحات مربوط به ادغام و استقرار سرویس‌های AI
- **تجربه یادگیری**: پیشنهاداتی برای بهبود جریان یادگیری توسعه‌دهندگان AI
- **عدم وجود محتوای AI**: درخواست برای قالب‌ها، الگوها یا مثال‌های بیشتر AI
- **دستیابی‌پذیری**: بهبودهایی برای نیازهای متنوع یادگیری
- **ادغام ابزار AI**: پیشنهاداتی برای بهبود ادغام جریان کاری توسعه AI
- **الگوهای استقرار AI در تولید**: درخواست الگوهای استقرار AI سازمانی

### تعهد پاسخگویی
- **پاسخ به مسائل**: ظرف ۴۸ ساعت برای مشکلات گزارش شده
- **درخواست‌های ویژگی**: بررسی ظرف یک هفته
- **مشارکت‌های جامعه**: بازبینی ظرف یک هفته
- **مسائل امنیتی**: اولویت فوری با پاسخ سریع

## برنامه نگهداری

### بروزرسانی‌های منظم
- **بررسی‌های ماهیانه**: دقت محتوا و اعتبارسنجی لینک‌ها
- **بروزرسانی‌های فصلی**: افزودنی‌ها و بهبودهای اصلی محتوا
- **بررسی‌های نیم‌ساله**: بازسازی و ارتقاء جامع
- **انتشار سالیانه**: بروزرسانی‌های نسخه اصلی با بهبودهای قابل توجه

### نظارت و تضمین کیفیت
- **آزمون‌های اتوماتیک**: اعتبارسنجی منظم نمونه کدها و لینک‌ها
- **ادغام بازخورد جامعه**: بهره‌گیری منظم از پیشنهادهای کاربران
- **بروزرسانی‌های فناوری**: هماهنگی با آخرین خدمات Azure و نسخه‌های azd
- **ممیزی‌های دستیابی‌پذیری**: بازبینی منظم اصول طراحی فراگیر

## سیاست پشتیبانی نسخه‌ها

### پشتیبانی نسخه جاری
- **جدیدترین نسخه اصلی**: پشتیبانی کامل با بروزرسانی‌های منظم
- **نسخه اصلی قبلی**: بروزرسانی‌های امنیتی و رفع اشکالات حیاتی به مدت ۱۲ ماه
- **نسخه‌های قدیمی**: فقط پشتیبانی جامعه، بدون بروزرسانی رسمی

### راهنمای مهاجرت
هنگام انتشار نسخه‌های اصلی جدید، ما ارائه می‌دهیم:
- **راهنمای مهاجرت**: دستورالعمل‌های گام‌به‌گام انتقال
- **یادداشت‌های سازگاری**: جزئیات تغییرات ناسازگار
- **پشتیبانی ابزار**: اسکریپت‌ها یا ابزارهای کمکی برای مهاجرت
- **پشتیبانی جامعه**: انجمن‌های مخصوص پرسش‌های مهاجرت

---

**هدایت**
- **درس قبلی**: [راهنمای مطالعه](resources/study-guide.md)
- **درس بعدی**: بازگشت به [README اصلی](README.md)

**به‌روز بمانید**: این مخزن را دنبال کنید تا در جریان اطلاعیه‌های انتشارهای جدید و به‌روزرسانی‌های مهم مواد یادگیری قرار بگیرید.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->