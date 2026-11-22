# تغییرات - AZD برای مبتدی‌ها

## مقدمه

این فهرست تغییرات تمام تغییرات، به‌روزرسانی‌ها و بهبودهای قابل توجه در مخزن AZD برای مبتدی‌ها را مستندسازی می‌کند. ما اصول نسخه‌بندی معنایی را دنبال می‌کنیم و این گزارش را برای کمک به کاربران در درک تغییرات بین نسخه‌ها حفظ می‌کنیم.

## اهداف یادگیری

با مرور این فهرست تغییرات، شما:
- در جریان ویژگی‌ها و افزوده‌های جدید محتوا خواهید بود
- بهبودهای ایجاد شده در مستندات موجود را درک خواهید کرد
- اصلاحات و رفع اشکالات را دنبال خواهید کرد تا دقت را تضمین کنید
- تحول مواد آموزشی در طول زمان را دنبال خواهید کرد

## نتایج یادگیری

پس از مرور ورودی‌های فهرست تغییرات، شما قادر خواهید بود:
- محتوای جدید و منابع در دسترس برای یادگیری را شناسایی کنید
- بفهمید کدام بخش‌ها به‌روزرسانی یا بهبود یافته‌اند
- مسیر یادگیری خود را بر اساس به‌روزترین مواد برنامه‌ریزی کنید
- بازخورد و پیشنهاداتی برای بهبودهای آینده ارائه دهید

## تاریخچه نسخه‌ها

### [v3.25.0] - 2026-11-09

#### افزونه Microsoft Foundry نسخه 1.0 اکنون به‌طور عمومی در دسترس است

بسته `microsoft.foundry` 1.0 به صورت **زنده و در دسترس عموم** است، همانطور که در تاریخ [5 نوامبر 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/) اعلام شد. این دوره اکنون روند کاری GA منتشر شده را آموزش می‌دهد، نه نسخه‌ای که قرار است منتشر شود. با AZD **1.37.0 یا بالاتر** شروع کنید و `azd ext install microsoft.foundry`.

#### در این به‌روزرسانی دوره در دسترس است
- راهنمای انگلیسی از بسته GA به‌عنوان مسیر نصب پیش‌فرض استفاده می‌کند و هفت افزونه اصلی با نسخه‌های مستقل خود را توضیح می‌دهد.
- یک [راهنمای عامل میزبانی‌شده](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) نمونه API پاسخ‌های چارچوب عامل پایتون بالادست، uv فعلی، پایتون 3.13+، انتخاب پروژه جدید/موجود، بازاستفاده مدل، و بازبینی `azure.yaml` را پوشش می‌دهد.
- روند کاری محلی تا ابری شامل آزمایش بازرس عامل، هزینه‌های فراخوان مدل مبتنی بر آزور، ساخت کد از راه دور، فراخوان استقرار یافته، ردیابی ابری، پیش‌نمایش استقرار، لاگ‌ها و تشخیص‌ها است.
- راهنمای ارزیابی جداگانه شامل تولید و بازبینی مجموعه داده‌ها/معیارها، پیکربندی ارزیابی نام‌گذاری شده، ثبت دارایی‌ها و بازرسی نتایج است. دستورالعمل‌های قدیمی ارزیابی/بهینه‌سازی همچنان تاریخچه مهاجرت است، نه پایه نسخه فعلی.
- راهنمای CI/CD فاندری شامل نصب افزونه اجراکننده، استقرار احراز هویت شده، دارایی‌ها/دسترسی ارزیابی، و دروازه کیفیت صریح است.
- راهنمای پاک‌سازی تفاوت بین پروژه‌های فاندری تازه ایجاد شده و بازاستفاده شده را مشخص می‌کند. کارگاه پیوندهایی به تمرین GA جداگانه دارد بدون جایگزینی آزمون‌های خاص نمونه آن.
- ناوبری دوره، اهداف یادگیری، پیش‌نیازهای راه‌اندازی، برگه تقلب، پرسش‌های متداول، و راهنمای مطالعه روند کاری GA را بازتاب می‌دهند. ترجمه‌های تولیدشده به صورت دستی ویرایش نشده‌اند.

#### دامنه بازبینی
- بر اساس اعلامیه GA، راهنمایی Microsoft Learn پیوند داده شده، و پیکربندی نمونه بالادست. هیچ تأمین Azure زنده، استقرار، فراخوان مدل یا ارزیابی انجام نشده است.
- GA بسته به معنی GA برای هر ویژگی اختیاری، افزونه مستقل، یا SDK نیست، و همچنین مثال‌ها را برای تولید تایید نمی‌کند.

### [v3.24.0]- 2026-11-04

#### رفع شده
- ناوبری دوره انگلیسی، مسیرهای جابه‌جا شده صفحه، لنگرهای مفقود و ارجاعات خارجی منسوخ، از جمله پیوند فصل دوم به راهنمای هوش مصنوعی تولیدی، تعمیر شد.
- راهنمای فعلی در برابر AZD 1.37.2 منتشر شده، عوامل 1.0.0-beta.23، و ارزیابی‌ها 1.0.0-beta.2 بازبینی شد. روند کاری جداگانه `azd ai eval` و مهاجرت پیکربندی بهینه‌سازی مستندسازی شد.
- پرچم‌های CLI پشتیبانی‌نشده، مرزهای احراز هویت، راهنمای محیط/راز متنی ساده، به‌روزرسانی زیرساخت، پیکربندی مدل، و مثال‌های بازیابی مخرب تصحیح شدند.
- کارگاه در برابر نمونه فعلی هوش مصنوعی عامل‌ها به‌روز شد، شامل قلاب‌های واقعی، ورودی‌های پیکربندی، آزمون‌های ارزیابی، نقاط ورود تیم‌قرمز، و قابلیت مشاهده.
- ادعاهای پیاده‌سازی نمونه اصلاح شد و مسائل مرتبط با برنامه/زیرساخت/پیکربندی تعمیر شدند. مطالب معماری خرده‌فروشی به‌صراحت از برنامه کاری کامل متمایز است.
- ماتریس زبان CodeQL بازیابی شد، Node.js 24 به‌عنوان نسخه پشتیبانی شده برای کانتینر توسعه انتخاب شد، و اعتبارسنج‌های راه‌اندازی فرمان‌های نسخه ناموفق را گزارش دادند.

#### افزودنی‌ها
- یک بررسی کننده لینک/لنگر آفلاین فقط انگلیسی، آزمون‌های رگرسیون، و روند مستندسازی که کارگاه را در حالت سخت‌گیرانه نیز می‌سازد. ترجمه‌های تولید شده و تصاویر ترجمه شده مستثنی هستند.

#### دامنه اعتبارسنجی
- بررسی‌های منبع، نحو، پیکربندی، رفتار محلی، و لینک شبکه قابل استقرار زنده Azure، سهمیه، RBAC، دسترسی مدل منطقه‌ای، صورتحساب، تطابق امنیتی یا آمادگی تولید را تأیید نمی‌کنند.
- ورودی‌های قدیمی‌تر زیر سابقه تاریخی هستند، نه دستورالعمل‌های فعلی فرمان یا نسخه.

### [v3.23.0] - 2026-07-13

#### تازه‌سازی AZD 1.27.1: به‌روزرسانی نسخه
**این نسخه دوره را در برابر `azd` `1.27.1` (ژوئیه 2026، آخرین نسخه پایدار) و افزونه پیش‌نمایش عامل هوش مصنوعی فعلی `azure.ai.agents` `1.0.0-beta.5` دوباره اعتبارسنجی می‌کند، به‌طوری که همه بنرهای "اعتبارسنجی شده بر اساس" پس از نسخه‌های 1.26.0، 1.27.0 و 1.27.1 به‌روز می‌شوند.**

#### تغییر کرده
- **✅ پایه اعتبارسنجی به‌روزرسانی شد** از `azd 1.25.6` (ژوئن ۲۰۲۶) به `azd 1.27.1` (جولای ۲۰۲۶) در README ریشه، تمام READMEهای فصل‌ها، درس کانتینر توسعه فصل ۱ (شامل مثال‌های نسخه سنجاق‌شده)، درس قالب‌های سفارشی فصل ۴، درس چندعاملی فصل ۵، و مستندات کارگاه
- **🤖 پایه فصل ۲ بازتنظیم شد** از `azd 1.23.12` (مارس ۲۰۲۶) به `azd 1.27.1` در `agents.md`، `ai-model-deployment.md`، `ai-workshop-lab.md`، و `microsoft-foundry-integration.md`؛ تاریخ‌های یادداشت اعتبارسنجی به ۲۰۲۶-۰۷-۱۳ به‌روزرسانی شدند
- **🧩 افزونه عامل هوش مصنوعی افزایش یافت** از `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` به نسخه فعلی `1.0.0-beta.5` در README فصل ۲ و `agents.md`
- **🧪 مثال اعتبارسنجی کارگاه** (خروجی `azd version`) به `1.27.1` به‌روزرسانی شد

#### یادداشت‌ها درباره نسخه‌های مرتبط azd (۱.۲۶.۰ → ۱.۲۷.۱)
- **۱.۲۶.۰ (۲۰۲۶-۰۶-۲۴):** پشتیبانی Go برای Azure Functions در Flex Consumption، فیلترهای اشتراک‌گذاری هر مستأجر `azd config sub-filter`، بسته‌های افزونه خودکفا (`azd x pack --bundle`)، و `azd tool install azure-skills`
- **۱.۲۷.۰ (۲۰۲۶-۰۶-۳۰):** مدل‌سازی مستقیم پروژه‌ها/عوامل Azure AI Foundry در `azure.yaml` (شروع بدون Bicep / بدون Terraform)، پشتیبانی از استقرار کانتینر برای App Service (`host: appservice` + `language: docker`)، فرمان‌های مستقیم `-s/--source` برای `azd extension`، و `azd tool uninstall`
- **۱.۲۷.۱ (۲۰۲۶-۰۷-۰۹):** پرچم `--no-dependencies` برای `azd extension install`، مدل‌های منسوخ شده به طور پیش‌فرض از مجوز/کتالوگ حذف شدند، و چندین رفع اشکال

#### فایل‌های به‌روزرسانی شده
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

### [v3.22.0] - ۲۰۲۶-۰۶-۱۶

#### پر کردن فاصله مبتدی #۲: نویسندگی قالب، کانتینرهای توسعه، Pulumi، Azure DevOps، نمایندگان خدمات و بیشتر
**این نسخه شکاف‌های میانی باقی‌مانده که توسط تحلیل azd-coverage آشکار شده بودند را می‌بندد: چگونه قالب خود را نویسندگی و منتشر کنید، محیط‌های بازتولیدپذیر کانتینر توسعه/Codespaces، ارائه‌دهنده زیرساخت Pulumi، راهنمای گام‌به‌گام Azure DevOps CI/CD، احراز هویت نماینده خدمات، راهنمای انتخاب میزبان (AKS/Spring Apps)، توضیحات `azd restore`/`azd package`، خطایابی هوک، و روش‌های تیمی/محیط‌های اشتراکی.**

#### افزوده‌شده
- **🧱 درس جدید فصل ۴** `docs/chapter-04-infrastructure/custom-templates.md` — نویسندگی قالب azd خودتان: ساختار مورد نیاز (`azure.yaml`، `infra/`، `src/`)، فیلد `metadata.template`، پارامتردهی زیرساخت با توکن منبع `uniqueString()` و برچسب `azd-env-name`، تست محلی با `azd init --template <local-path>`، انتشار در GitHub، و ارسال به گالری Awesome AZD
- **📦 درس جدید فصل ۱** `docs/chapter-01-foundation/dev-containers.md` — محیط‌های بازتولیدپذیر azd با کانتینرهای توسعه و GitHub Codespaces: یک `.devcontainer/devcontainer.json` حداقلی با استفاده از ویژگی رسمی `ghcr.io/azure/azure-dev/azd`، ویژگی‌های خاص زبان، `docker-in-docker` برای میزبان‌های کانتینر، و `azd auth login --use-device-code` برای ورود از راه دور
- **🧩 پلومی همراه با azd** بخش در `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`، ساختار پوشه پلومی، اتصال استک‌ها به محیط‌های azd، خروجی‌های مورد نیاز/برچسب‌گذاری، و روند کاری یکسان `azd up` / `azd down`
- **🎯 راهنمای انتخاب میزبان** در `docs/chapter-04-infrastructure/provisioning.md` — مقایسه‌ای ساده برای مبتدی‌ها بین `appservice`، `staticwebapp`، `function`، `containerapp`، `aks`، و `springapp`، به همراه راهنمایی برای انتخاب AKS یا Azure Spring Apps
- **🛠️ راهنمای گام‌به‌گام Azure DevOps CI/CD** در `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`، اتصال سرویس با فدراسیون هویت کاری (OIDC)، `azure-dev.yml` تولید شده، و تنظیم گروه متغیر
- **🔑 نقش‌های سرویس (الگو ۴)** افزوده شده به `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`، `azd auth login` غیرتعاملی با راز کلاینت در مقابل اعتبارنامه‌های فدره / OIDC، زمان استفاده، و ذخیره‌سازی امن اعتبارنامه‌ها
- **🪝 بخش خطایابی هوک** در `docs/chapter-04-infrastructure/deployment-guide.md` — کدهای خروج و `set -e`، `continueOnError`، آزمایش هوک‌ها به صورت مجزا با `azd hooks run`، پوسته‌های خاص سیستم عامل، و `--debug`
- **👥 بخش تیم / محیط‌های مشترک** در `docs/chapter-03-configuration/configuration.md` — چه چیزهایی در `.azure/` قرار دارد، چه چیزی باید در gitignore باشد، محیط‌های مخصوص توسعه‌دهنده، `azd env list`/`select`، و ارائه ارزش‌های محیطی در CI/CD
- **🧰 توضیحات `azd restore` و `azd package` گسترش یافته** در `resources/cheat-sheet.md` — بازیابی وابستگی‌ها و ساختن یک آرکیتکت قابل استقرار بدون انجام استقرار

#### تغییر یافته
- **🧭 جدول درس‌های فصل ۴** به‌روز شده تا درس جدید "نوشتن قالب خودتان" (درس ۳) را شامل شود
- **🧭 جدول درس‌های فصل ۱** به‌روز شده تا درس جدید "کانتینرهای توسعه و Codespaces" (درس ۵) را شامل شود؛ پاورقی‌های پیمایش بین `bring-your-own-app.md` و `dev-containers.md` متصل شدند

### [v3.21.0] - 2026-06-16

#### پر کردن شکاف برای مبتدیان: درس عملی چندعامل، "برنامه خودتان را بیاورید"، Terraform، و راهنمای CI/CD
**این نسخه بزرگترین شکاف‌ها را برای راهنمای کامل مبتدیان با افزودن دو درس عملی جدید (راهنمای پیاده‌سازی چندعامل و افزودن azd به برنامه موجود)، معرفی هوک‌های مناسب برای مبتدیان، بخش Terraform با azd، راهنمای گام‌به‌گام خطوط لوله GitHub Actions، توضیح افزونه‌های نمایشی جدید، و چک‌لیست واضح برای تایید استقرار، بسته است.**

#### افزوده شده
- **🤝 درس جدید فصل ۵** `docs/chapter-05-multi-agent/multi-agent-basics.md` — راهنمای دو عاملی کاملاً عملی و قابل استقرار (هماهنگ‌کننده + متخصصان) با استفاده از یک قالب واقعی (`contoso-creative-writer`)، شامل زمان استفاده از چندعامل، روند کاری `azd up`، شناخت منابع مستقر شده، ردیابی متقابل عامل‌ها، سفارشی‌سازی، و پاک‌سازی
- **📦 درس جدید فصل ۱** `docs/chapter-01-foundation/bring-your-own-app.md` — نحوه افزودن azd به پروژه موجود با `azd init` ("استفاده از کد در دایرکتوری فعلی")، فهمیدن `azure.yaml` و `infra/`، `azd infra generate`، تشخیص میزبان، و استقرار با `azd up`
- **🌐 بخش Terraform با azd** افزوده شده به `docs/chapter-04-infrastructure/provisioning.md` — پیکربندی `infra.provider: terraform`، ساختار پوشه `.tf`، خروجی‌های مورد نیاز `AZURE_*` و برچسب‌گذاری `azd-env-name`، و روند کاری یکسان `azd up` / `azd down` (شکافی را که ادعای پشتیبانی از Terraform وجود داشت ولی فقط Bicep نشان داده شده بود، می‌بندد)
- **⚙️ راهنمای گام‌به‌گام GitHub Actions** در `docs/chapter-08-production/production-ai-practices.md` — از مخزن GitHub تا استقرار خودکار: `azd pipeline config`، اعتبارنامه‌های همگرا شده OIDC (بدون ذخیره اسرار)، `azure-dev.yml` تولید شده، و راهنمایی‌های مربوط به اسرار در مقابل متغیرها
- **🪝 معرفی مبتدی «نوشتن هوک‌ها چیه؟»** در `docs/chapter-04-infrastructure/deployment-guide.md` — هوک چیست، جدول مراحل هوک، یک هوک حداقلی اول، و اجرای دستی هوک‌ها با `azd hooks run`
- **✅ فهرست بررسی «استقرار خود را تأیید کنید»** به مرحله ۵ از `docs/chapter-01-foundation/first-project.md` اضافه شد — تست دود، بررسی نقطه پایان سلامتی، و معیارهای واضح موفقیت
- **🧩 توضیح‌دهنده برای افزونه‌های جدید پیش‌نمایش** `azure.ai.skills` و `azure.ai.connections` (چی هستند و کی باید از آنها استفاده کرد) در `docs/chapter-08-production/production-ai-practices.md`

#### تغییرات
- **🧭 جدول درس‌های فصل ۵** اصلاح شد: اکنون `multi-agent-basics.md` درس ۱ است (تنها درس کاملاً عملی) با برچسب حقیقی که درس ۲ در فصل ۶ است و سناریوی خرده‌فروشی یک نقشه معماری است نه قالب یک‌دستور
- **🧭 جدول درس‌های فصل ۱** اکنون درس جدید "برنامه خودت را بیاور" (درس ۴) را شامل می‌شود
- **🔗 پاورقی‌های ناوبری** به‌روزرسانی شد: `first-project.md` اکنون به `bring-your-own-app.md` ارجاع می‌دهد

#### رفع‌ها
- **🧱 پر کردن شکاف "مطالبه شده اما مفقود" Terraform** — در دوره قبلاً پشتیبانی Terraform ذکر شده بود اما نمایش داده نمی‌شد
- **🔀 اصلاح پیوندهای متقاطع گمراه‌کننده فصل ۵** که القا می‌کرد پیاده‌سازی کامل چندعاملی وجود دارد در حالی که فقط نقشه معماری بود

#### فایل‌های به‌روزرسانی شده
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

#### بازخوانی AZD 1.25.6، دستورات کامل چرخه عمر عامل و بازبرندسازی Aspire
**این نسخه دوره را در برابر `azd` `1.25.6` (ژوئن 2026) و افزونه `azure.ai.agents` `0.1.40-preview` تأیید می‌کند، راهنمایی هوش مصنوعی را از "ایجاد چارچوب عامل" به چرخه کامل عمر عامل (آزمایش → ارزیابی → بهینه‌سازی → بازرسی → حذف) گسترش می‌دهد، افزونه‌های جدید پیش‌نمایش `azure.ai.skills` و `azure.ai.connections` را نمایش می‌دهد، و بازبرندسازی محصول ".NET Aspire" → "Aspire" را یادآوری می‌کند.**

#### اضافه شده
- **🔁 پوشش کامل چرخه عمر عامل** برای مبتدیان و مهندسان هوش مصنوعی در سراسر مستندات:
  - `docs/chapter-01-foundation/azd-basics.md` — جدول چرخه عمر (ایجاد چارچوب → آزمایش → اندازه‌گیری → بهبود → بازرسی → پاک‌سازی) به بخش افزونه‌ها و دستورات AI اضافه شد
  - `docs/chapter-08-production/production-ai-practices.md` — بخش جدید "مدیریت چرخه عمر عامل" که `azd ai agent invoke`، `endpoint show`، `eval generate`، `optimize`، `code download`، و `delete --force` را پوشش می‌دهد
  - `resources/cheat-sheet.md` — دستورات عامل هوش مصنوعی گسترش یافته با `invoke`، `endpoint show`، `eval generate`، `optimize`، `code download`، و `delete --force`
- **🧩 افزونه‌های جدید پیش‌نمایش** مستندسازی شده: `azure.ai.skills` (مهارت‌های عامل قابل استفاده مجدد) و `azure.ai.connections` (اتصالات Foundry) به جدول افزونه‌ها و برگه تقلب اضافه شدند
- **⏱️ راهنمای زمان پاسخ‌گویی** — نمونه‌های `azd ai agent invoke` اکنون زمان تأخیر کلی و زمان تا اولین بایت را چاپ می‌کند
- **📌 بنر نسخه** در README ریشه که یادگیرندگان را به `azd version` و `azd upgrade` راهنمایی می‌کند

#### تغییرات
- **✅ به‌روزرسانی پایه اعتبارسنجی** از `azd 1.23.12` (مارس 2026) به `azd 1.25.6` (ژوئن 2026) در تمام READMEهای فصل‌ها و مستندات کارگاه
- **🤖 به‌روزرسانی یادداشت افزونه فصل ۲** از `azure.ai.agents` `0.1.18-preview` به `0.1.40-preview`
- **🧪 نمونه اعتبارسنجی کارگاه** (خروجی `azd version`) به `1.25.6` تغییر کرد
- **🧭 README «چه چیز جدیدی در azd امروز»** تازه‌سازی شد تا چرخه عمر کامل عامل، افزونه‌های هوش مصنوعی جدید و رفع‌های اخیر کیفیت زندگی را برجسته کند (`azd init` عدم تکرار، `azd auth login` پاک‌سازی توکن‌های منقضی، `azd tool` اولین پرسش‌نامه اجرا)
- **📖 agents.md فصل ۲ (گزینه ۴)** اکنون یادگیرندگان را به دستورات چرخه عمر پس از استقرار راهنمایی می‌کند به جای توقف در `azd up`

#### رفع شده
- **🏷️ نام‌گذاری محصول** — یادداشت بازبرندسازی Aspire افزوده شد (".NET Aspire" اکنون فقط «Aspire» است)؛ پشتیبانی Aspire در azd تغییر نکرده است
- **🔎 تأیید اعتبار انتشار زنده** در برابر فید انتشار Azure Developer CLI: CLI پایدار `1.25.6` (2026-06-12) و `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### روشن‌سازی راه‌اندازی برای مبتدیان، اعتبارسنجی تنظیمات و پاک‌سازی نهایی دستورات AZD
**این نسخه پس از موج اعتبارسنجی AZD 1.23 مستندات را برای مبتدیان مرور می‌کند: راهنمایی تصدیق هویت اول AZD را روشن می‌کند، اسکریپت‌های اعتبارسنجی تنظیمات محلی اضافه می‌کند، دستورات کلیدی را با CLI زنده AZD بررسی می‌کند و آخرین ارجاعات دستور منسوخ به منبع انگلیسی خارج از فهرست تغییرات را حذف می‌کند.**

#### اضافه شده
- **🧪 اسکریپت‌های اعتبارسنجی راه‌اندازی مبتدی** با `validate-setup.ps1` و `validate-setup.sh` تا یادگیرندگان قبل از شروع فصل ۱ ابزارهای مورد نیاز را تأیید کنند
- **✅ مراحل اعتبارسنجی تنظیمات اولیه** در README ریشه و README فصل ۱ تا پیش‌نیازهای گمشده قبل از `azd up` گرفته شوند

#### تغییرات
- **🔐 راهنمایی تصدیق هویت مبتدی** اکنون به طور مداوم `azd auth login` را به عنوان مسیر اصلی برای گردش‌های کاری AZD در نظر می‌گیرد، با `az login` به عنوان گزینه‌ای مگر اینکه دستورات Azure CLI مستقیماً استفاده شوند
- **📚 جریان ورود فصل ۱** اکنون یادگیرندگان را به اعتبارسنجی تنظیمات محلی پیش از مراحل نصب، تصدیق هویت و استقرار اول هدایت می‌کند
- **🛠️ پیام‌های اعتبارسنجی** اکنون نیازهای مسدودکننده را به وضوح از هشدارهای اختیاری Azure CLI برای مسیر مبتدی فقط AZD جدا می‌کند
- **📖 مستندات پیکربندی، عیب‌یابی، و نمونه‌ها** اکنون بین تأیید هویت AZD ضروری و ورود اختیاری Azure CLI تمایز قائل می‌شوند در حالی که قبلاً هر دو بدون زمینه ارائه شده بودند

#### رفع‌ها
- **📋 باقی‌مانده ارجاعات دستورات منبع انگلیسی** به فرم‌های فعلی AZD به روز شدند، از جمله `azd config show` در برگه تقلب و `azd monitor --overview` جایی که راهنمایی نمای کلی Azure Portal منظور بود
- **🧭 ادعاهای مبتدی در فصل ۱** تعدیل شدند تا از وعده‌های بیش از حد مانند تضمین خطای صفر یا رفتار برگشت‌پذیر در تمام قالب‌ها و منابع Azure جلوگیری شود
- **🔎 اعتبارسنجی CLI زنده** پشتیبانی فعلی برای `azd env get-values`، `azd template list`، `azd extension list --installed`، `azd copilot consent list`، `azd mcp start`، `azd provision --preview`، `azd monitor --logs`، و `azd down --force --purge` را تأیید کرد

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

#### اعتبارسنجی AZD 1.23.12، گسترش محیط کارگاه و بازخوانی مدل AI
**این نسخه یک موج بازبینی مستندات در برابر `azd` `1.23.12` انجام می‌دهد، نمونه‌های دستورات AZD قدیمی را به‌روزرسانی می‌کند، راهنمایی مدل هوش مصنوعی را به پیش‌فرض‌های فعلی بازخوانی می‌کند، و دستورالعمل‌های کارگاه را فراتر از GitHub Codespaces به ظروف توسعه و کلون‌های محلی گسترش می‌دهد.**

#### اضافه شده
- **✅ یادداشت‌های اعتبارسنجی در سراسر فصل‌ها و مستندات کارگاه** تا پایه تست شده AZD برای یادگیرندگان با نسخه‌های جدیدتر یا قدیمی‌تر CLI صریح باشد
- **⏱️ راهنمایی تایم‌اوت استقرار** برای استقرار برنامه‌های هوش مصنوعی بلندمدت با استفاده از `azd deploy --timeout 1800`
- **🔎 مراحل بازرسی افزونه** با `azd extension show azure.ai.agents` در مستندات گردش کار AI
- **🌐 راهنمایی محیط کارگاه گسترده‌تر** شامل GitHub Codespaces، ظروف توسعه و کلون‌های محلی با MkDocs

#### تغییرات
- **📚 READMEهای مقدمه فصل** اکنون به طور مداوم اعتبارسنجی در برابر `azd 1.23.12` را در بخش‌های پایه، پیکربندی، زیرساخت، چندعاملی، پیش‌استقرار، عیب‌یابی، و تولید ذکر می‌کنند
- **🛠️ ارجاعات دستورات AZD** در سراسر مستندات به فرم‌های فعلی به‌روزرسانی شدند:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` یا `azd env get-value(s)` بسته به زمینه
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` جایی که نمای کلی Application Insights مد نظر است
- **🧪 نمونه‌های پیش‌نمایش فراهم‌سازی** ساده‌سازی شدند به استفاده‌های فعلی مانند `azd provision --preview` و `azd provision --preview -e production`
- **🧭 جریان کارگاه** به‌روزرسانی شد تا یادگیرندگان بتوانند آزمایشگاه‌ها را در Codespaces، ظرف توسعه یا کلون محلی کامل کنند به جای فرض اجرای فقط در Codespaces
- **🔐 راهنمایی تصدیق هویت** اکنون `azd auth login` را برای گردش‌های کاری AZD ترجیح می‌دهد، با `az login` به عنوان گزینه‌ای وقتی دستورات Azure CLI مستقیماً استفاده می‌شوند

#### رفع‌ها
- **🪟 دستورات نصب ویندوز** به موارد فعلی بسته `winget` در راهنمای نصب استاندارد شدند
- **🐧 راهنمای نصب لینوکس** اصلاح شد تا از دستورات مدیریت بسته توزیع‌محور پشتیبانی نشده `azd` اجتناب کند و به جای آن به دارایی‌های انتشار اشاره کند
- **📦 نمونه‌های مدل AI** از پیش‌فرض‌های قدیمی مانند `gpt-35-turbo` و `text-embedding-ada-002` به نمونه‌های فعلی مانند `gpt-4.1-mini`، `gpt-4.1`، و `text-embedding-3-large` به‌روزرسانی شدند
- **📋 قطعات کد استقرار و تشخیص مشکل** اصلاح شدند تا از محیط و دستورات وضعیت فعلی در لاگ‌ها، اسکریپت‌ها و مراحل عیب‌یابی استفاده کنند
- **⚙️ راهنمایی GitHub Actions** از `Azure/setup-azd@v1.0.0` به `Azure/setup-azd@v2` به‌روزرسانی شد
- **🤖 راهنمای رضایت MCP/Copilot** از `azd mcp consent` به `azd copilot consent list` به‌روزرسانی شد

#### بهبود یافته
- **🧠 راهنمای فصل هوش مصنوعی** اکنون رفتار حساس به پیش‌نمایش `azd ai`، ورود مخصوص مستأجر، استفاده فعلی از افزونه‌ها، و توصیه‌های به‌روز استقرار مدل را بهتر توضیح می‌دهد
- **🧪 دستورالعمل‌های کارگاه** اکنون از نسخه‌های مثالی واقعی‌تر و زبان روشن‌تر برای راه‌اندازی محیط آزمایشگاهی استفاده می‌کند
- **📈 مستندات تولید و عیب‌یابی** اکنون بهتر با مثال‌های فعلی نظارت، مدل پشتیبان، و طبقه هزینه تطبیق دارد

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

#### دستورات CLI هوش مصنوعی AZD، اعتبارسنجی محتوا و گسترش قالب
**این نسخه پوشش دستورات `azd ai`، `azd extension`، و `azd mcp` را در تمام فصل‌های مرتبط با هوش مصنوعی اضافه می‌کند، لینک‌های خراب و کدهای از رده خارج شده در agents.md را اصلاح می‌کند، برگه تقلب را به‌روزرسانی می‌کند و بخش قالب‌های نمونه را با توضیحات بررسی شده و قالب‌های جدید Azure AI AZD بازسازی می‌کند.**

#### اضافه شده
- **🤖 پوشش AZD AI CLI** در ۷ فایل (قبلاً فقط در فصل ۸):
  - `docs/chapter-01-foundation/azd-basics.md` — بخش جدید «دستورالعمل‌های اکستنشن‌ها و هوش مصنوعی» که `azd extension`، `azd ai agent init`، و `azd mcp` را معرفی می‌کند
  - `docs/chapter-02-ai-development/agents.md` — گزینه ۴: `azd ai agent init` با جدول مقایسه (قالب در برابر رویکرد مانیفست)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — بخش‌های فرعی «اکستنشن‌های AZD برای Foundry» و «استقرار محور عامل»
  - `docs/chapter-05-multi-agent/README.md` — شروع سریع اکنون هر دو مسیر استقرار مبتنی بر قالب و مانیفست را نشان می‌دهد
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — بخش استقرار اکنون شامل گزینه `azd ai agent init` است
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — بخش فرعی «دستورات اکستنشن‌های AZD AI برای عیب‌یابی»
  - `resources/cheat-sheet.md` — بخش جدید «دستورات هوش مصنوعی و اکستنشن‌ها» با `azd extension`، `azd ai agent init`، `azd mcp`، و `azd infra generate`
- **📦 قالب‌های نمونه جدید AZD AI** در `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — چت RAG دات‌نت با Blazor WebAssembly، Semantic Kernel، و پشتیبانی از چت صوتی
  - **azure-search-openai-demo-java** — چت RAG جاوا با استفاده از Langchain4J با گزینه‌های استقرار ACA/AKS
  - **contoso-creative-writer** — برنامه چندعاملی نویسندگی خلاقانه با استفاده از Azure AI Agent Service، Bing Grounding و Prompty
  - **serverless-chat-langchainjs** — RAG بدون سرور با ترکیب Azure Functions + LangChain.js + Cosmos DB با پشتیبانی توسعه محلی Ollama
  - **chat-with-your-data-solution-accelerator** — شتاب‌دهنده سازمانی RAG با پرتگاه مدیریت، ادغام Teams و گزینه‌های PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — برنامه مرجع اهرم‌بندی چندعاملی MCP با سرورها در دات‌نت، پایتون، جاوا و تایپ‌اسکریپت
  - **azd-ai-starter** — قالب شروع بایسپ حداقلی زیرساخت Azure AI
  - **🔗 لینک گالری عالی AZD AI** — ارجاع به [گالری عالی-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (بیش از ۸۰ قالب)

#### اصلاح شده
- **🔗 ناوبری agents.md**: لینک‌های قبلی/بعدی اکنون با ترتیب درس فایل README فصل ۲ مطابقت دارند (ادغام Microsoft Foundry → عوامل → استقرار مدل هوش مصنوعی)
- **🔗 لینک‌های خراب agents.md**: `production-ai-practices.md` به `../chapter-08-production/production-ai-practices.md` اصلاح شد (۳ مورد)
- **📦 کد منسوخ شده agents.md**: جایگزینی `opencensus` با `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API نامعتبر agents.md**: انتقال `max_tokens` از `create_agent()` به `create_run()` به عنوان `max_completion_tokens`
- **🔢 agents.md شمارش توکن**: جایگزینی تخمین خام `len//4` با `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: اصلاح خدمات از "جستجوی شناختی + سرویس برنامه" به "Azure AI Search + Azure Container Apps" (میزبان پیش‌فرض اکتبر ۲۰۲۴ تغییر کرد)
- **contoso-chat**: به‌روزرسانی توضیح برای ارجاع به Azure AI Foundry + Prompty، مطابق با عنوان و فناوری واقعی مخزن

#### حذف شده
- **ai-document-processing**: حذف ارجاع قالب غیرعملی (مخزن به‌عنوان قالب AZD به صورت عمومی در دسترس نیست)

#### بهبود یافته
- **📝 تمرین‌های agents.md**: تمرین ۱ اکنون خروجی مورد انتظار و مرحله `azd monitor` را نشان می‌دهد؛ تمرین ۲ شامل کد کامل ثبت نام `FunctionTool` است؛ تمرین ۳ راهنمایی مبهم را با دستورات مشخص `prepdocs.py` جایگزین می‌کند
- **📚 منابع agents.md**: به‌روزرسانی پیوندهای مستندات به اسناد فعلی Azure AI Agent Service و شروع سریع
- **📋 جدول مراحل بعدی agents.md**: افزودن پیوند کارگاه AI برای پوشش کامل فصل

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
**این نسخه ناوبری فصل README.md را با قالب جدول بهبود یافته ارتقا می‌دهد.**

#### تغییرات
- **جدول نقشه دوره**: افزودن پیوندهای مستقیم درس‌ها، تخمین مدت زمان و امتیاز دشواری
- **پاکسازی پوشه‌ها**: حذف پوشه‌های قدیمی و اضافی (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **اعتبارسنجی پیوندها**: بررسی همه ۲۱+ پیوند داخلی در جدول نقشه دوره

### [v3.16.0] - 2026-02-05

#### به‌روزرسانی نام محصول
**این نسخه ارجاعات محصول را به برندینگ فعلی مایکروسافت به‌روزرسانی می‌کند.**

#### تغییرات
- **مایکروسافت فوندری → مایکروسافت فوندری**: همه ارجاعات در فایل‌های غیر ترجمه‌ای به‌روزرسانی شده‌اند
- **Azure AI Agent Service → Foundry Agents**: نام سرویس برای انطباق با برندینگ به‌روز شد

#### فایل‌های به‌روزرسانی شده
- `README.md` - صفحه اصلی دوره
- `changelog.md` - تاریخچه نسخه‌ها
- `course-outline.md` - ساختار دوره
- `docs/chapter-02-ai-development/agents.md` - راهنمای عوامل هوش مصنوعی
- `examples/README.md` - مستندات نمونه‌ها
- `workshop/README.md` - صفحه فرود کارگاه
- `workshop/docs/index.md` - فهرست کارگاه
- `workshop/docs/instructions/*.md` - همه فایل‌های دستورالعمل کارگاه

---

### [v3.15.0] - 2026-02-05

#### بازسازی کلان مخزن: نام‌گذاری پوشه بر اساس فصل
**این نسخه مستندات را به پوشه‌های فصل اختصاصی سازماندهی می‌کند تا ناوبری شفاف‌تر شود.**

#### تغییر نام پوشه‌ها
پوشه‌های قدیمی با پوشه‌های شماره‌گذاری شده بر اساس فصل جایگزین شده‌اند:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- افزودن جدید: `docs/chapter-05-multi-agent/`

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
| همه فایل‌های پیش از استقرار | pre-deployment/ | chapter-06-pre-deployment/ |
| همه فایل‌های عیب‌یابی | troubleshooting/ | chapter-07-troubleshooting/ |

#### افزوده شده
- **📚 فایل‌های README فصل**: ایجاد README.md در هر پوشه فصل شامل:
  - اهداف یادگیری و مدت زمان
  - جدول درس‌ها با توضیحات
  - دستورات شروع سریع
  - ناوبری به فصول دیگر

#### تغییر یافته
- **🔗 به‌روزرسانی همه لینک‌های داخلی**: بیش از ۷۸ مسیر در تمام فایل‌های مستندات به‌روزرسانی شد
- **🗺️ README.md اصلی**: به‌روزرسانی نقشه دوره با ساختار فصل جدید
- **📝 examples/README.md**: به‌روزرسانی ارجاعات متقاطع به پوشه‌های فصل

#### حذف شده
- ساختار قدیمی پوشه‌ها (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### بازسازی مخزن: ناوبری فصل
**این نسخه فایل‌های README ناوبری فصل را اضافه کرد (با v3.15.0 جایگزین شد).**

---

### [v3.13.0] - 2026-02-05

#### راهنمای جدید عوامل هوش مصنوعی
**این نسخه راهنمای جامعی برای استقرار عوامل هوش مصنوعی با Azure Developer CLI اضافه می‌کند.**

#### افزوده شده
- **🤖 docs/microsoft-foundry/agents.md**: راهنمای کامل شامل:
  - عوامل هوش مصنوعی چیستند و چگونه با چت‌بات‌ها متفاوت‌اند
  - سه قالب سریع شروع برای عامل (Foundry Agents، Prompty، RAG)
  - الگوهای معماری عامل (عامل تک، RAG، چند عاملی)
  - پیکربندی ابزار و سفارشی‌سازی
  - پایش و پیگیری معیارها
  - ملاحظات هزینه و بهینه‌سازی
  - سناریوهای معمول عیب‌یابی
  - سه تمرین عملی با معیارهای موفقیت

#### ساختار محتوا
- **مقدمه**: مفاهیم عامل برای مبتدیان
- **شروع سریع**: استقرار عوامل با `azd init --template get-started-with-ai-agents`
- **الگوهای معماری**: نمودارهای تصویری الگوهای عامل
- **پیکربندی**: راه‌اندازی ابزار و متغیرهای محیطی
- **پایش**: ادغام Application Insights
- **تمرین‌ها**: یادگیری مرحله‌ای عملی (۲۰-۴۵ دقیقه هر کدام)

---

### [v3.12.0] - 2026-02-05

#### به‌روزرسانی محیط DevContainer
**این نسخه پیکربندی کانتینر توسعه را با ابزارهای مدرن و پیش‌فرض بهتر برای تجربه یادگیری AZD به‌روزرسانی می‌کند.**

#### تغییرات
- **🐳 تصویر پایه**: به‌روزرسانی از `python:3.12-bullseye` به `python:3.12-bookworm` (آخرین نسخه پایدار دبیان)
- **📛 نام کانتینر**: تغییر نام از "Python 3" به "AZD برای مبتدیان" جهت وضوح بیشتر

#### افزوده شده
- **🔧 ویژگی‌های جدید کانتینر توسعه**:
  - `azure-cli` با پشتیبانی فعال شده برای Bicep
  - `node:20` (نسخه LTS برای قالب‌های AZD)
  - `github-cli` برای مدیریت قالب‌ها
  - `docker-in-docker` برای استقرار برنامه‌های کانتینری

- **🔌 فوروارد پورت‌ها**: پورت‌های پیش‌تنظیم شده برای توسعه معمول:
  - ۸۰۰۰ (پیش‌نمایش MkDocs)
  - ۳۰۰۰ (برنامه‌های وب)
  - ۵۰۰۰ (Python Flask)
  - ۸۰۸۰ (APIها)

- **🧩 افزونه‌های جدید VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense پایتون ارتقا یافته
  - `ms-azuretools.vscode-azurefunctions` - پشتیبانی Azure Functions
  - `ms-azuretools.vscode-docker` - پشتیبانی داکر
  - `ms-azuretools.vscode-bicep` - پشتیبانی زبان Bicep
  - `ms-azure-devtools.azure-resource-groups` - مدیریت منابع Azure
  - `yzhang.markdown-all-in-one` - ویرایش Markdown
  - `DavidAnson.vscode-markdownlint` - بررسی صحت Markdown
  - `bierner.markdown-mermaid` - پشتیبانی نمودار Mermaid
  - `redhat.vscode-yaml` - پشتیبانی YAML (برای azure.yaml)
  - `eamodio.gitlens` - نمایش Git
  - `mhutchie.git-graph` - تاریخچه Git

- **⚙️ تنظیمات VS Code**: افزودن تنظیمات پیش‌فرض برای مفسر پایتون، قالب‌بندی هنگام ذخیره، و حذف فضای خالی

- **📦 به‌روزرسانی requirements-dev.txt**:
  - افزودن پلاگین فشرده‌سازی MkDocs
  - افزودن pre-commit برای کیفیت کد
  - افزودن بسته‌های Azure SDK (azure-identity، azure-mgmt-resource)

#### رفع اشکال
- **فرمان پس از ایجاد**: اکنون هنگام شروع کانتینر نصب AZD و Azure CLI را تأیید می‌کند

---

### [v3.11.0] - 2026-02-05

#### بازطراحی README مناسب مبتدیان
**این نسخه README.md را به شکل قابل توجهی برای مبتدیان قابل دسترس‌تر می‌کند و منابع ضروری برای توسعه‌دهندگان هوش مصنوعی اضافه می‌کند.**

#### افزوده شده
- **🆚 مقایسه Azure CLI و AZD**: توضیح واضح در مورد زمان استفاده از هر ابزار به همراه مثال‌های عملی
- **🌟 پیوندهای عالی AZD**: پیوندهای مستقیم به گالری قالب‌های جامعه و منابع مشارکت:
  - [گالری عالی AZD](https://azure.github.io/awesome-azd/) - بیش از ۲۰۰ قالب آماده برای استقرار
  - [ارسال یک قالب](https://github.com/Azure/awesome-azd/issues) - مشارکت جامعه
- **🎯 راهنمای شروع سریع**: بخش شروع ساده‌شده در ۳ مرحله (نصب → ورود → استقرار)
- **📊 جدول ناوبری بر اساس تجربه**: راهنمایی روشن در مورد محل شروع براساس تجربه توسعه‌دهنده

#### تغییر یافته
- **ساختار README**: برای نمایش تدریجی سازماندهی مجدد شد - اطلاعات کلیدی ابتدا
- **بخش مقدمه**: بازنویسی برای توضیح «جادوی `azd up`» برای مبتدیان کامل
- **حذف محتوای تکراری**: حذف بخش عیب‌یابی تکراری
- **دستورات عیب‌یابی**: ارجاع `azd logs` اصلاح شد تا از `azd monitor --logs` معتبر استفاده کند

#### اصلاح شده
- **🔐 دستورات احراز هویت**: اضافه شدن `azd auth login` و `azd auth logout` به cheat-sheet.md
- **ارجاعات دستور نامعتبر**: حذف باقی‌مانده‌های `azd logs` از بخش عیب‌یابی README

#### یادداشت‌ها
- **دامنه**: تغییرات روی README.md اصلی و resources/cheat-sheet.md اعمال شده است
- **جامعه هدف**: بهبودهایی مخصوص توسعه‌دهندگان تازه‌کار در AZD

---

### [v3.10.0] - 2026-02-05

#### به‌روزرسانی دقت دستورات Azure Developer CLI
**این نسخه دستورات غیرموجود AZD در مستندات را اصلاح می‌کند تا همه مثال‌های کد از نحو معتبر Azure Developer CLI استفاده کنند.**

#### اصلاح شده
- **🔧 حذف دستورات غیرموجود AZD**: بررسی جامع و اصلاح دستورات نامعتبر:
  - `azd logs` (وجود ندارد) → جایگزین با `azd monitor --logs` یا جایگزین‌های Azure CLI
  - زیر‌دستورات `azd service` (وجود ندارد) → جایگزین با `azd show` و Azure CLI
  - `azd infra import/export/validate` (وجود ندارد) → حذف شده یا جایگزین با موارد معتبر
  - پرچم‌های `azd deploy --rollback/--incremental/--parallel/--detect-changes` (وجود ندارد) → حذف شده
  - پرچم‌های `azd provision --what-if/--rollback` (وجود ندارد) → به‌روزرسانی شده برای استفاده از `--preview`
  - `azd config validate` (وجود ندارد) → جایگزین با `azd config list`
  - `azd info`، `azd history`، `azd metrics` (وجود ندارد) → حذف شده

- **📚 فایل‌های به‌روزشده با اصلاحات دستورات**:
  - `resources/cheat-sheet.md`: بازنگری جامع ارجاع دستورات
  - `docs/deployment/deployment-guide.md`: اصلاح استراتژی‌های برگشت و استقرار
  - `docs/troubleshooting/debugging.md`: اصلاح بخش‌های تحلیل لاگ
  - `docs/troubleshooting/common-issues.md`: به‌روزرسانی دستورات عیب‌یابی
  - `docs/troubleshooting/ai-troubleshooting.md`: اصلاح بخش اشکال‌زدایی AZD
  - `docs/getting-started/azd-basics.md`: اصلاح دستورات مانیتورینگ
  - `docs/getting-started/first-project.md`: به‌روزرسانی نمونه‌های مانیتورینگ و اشکال‌زدایی
  - `docs/getting-started/installation.md`: اصلاح مثال‌های راهنما و نسخه
  - `docs/pre-deployment/application-insights.md`: اصلاح دستورات مشاهده لاگ
  - `docs/pre-deployment/coordination-patterns.md`: اصلاح دستورات اشکال‌زدایی عامل

- **📝 به‌روزرسانی مرجع نسخه**: 
  - `docs/getting-started/installation.md`: تغییر نسخه سخت‌کد شده `1.5.0` به نسخه عمومی `1.x.x` همراه با پیوند به نسخه‌ها

#### تغییر یافته
- **استراتژی‌های برگشت**: مستندات به‌روزرسانی شده برای استفاده از برگشت مبتنی بر گیت (AZD برگشت داخلی ندارد)
- **مشاهده لاگ**: ارجاعات `azd logs` جایگزین شده با `azd monitor --logs`، `azd monitor --live` و دستورات Azure CLI
- **بخش عملکرد**: پرچم‌های غیرموجود استقرار موازی/تدریجی حذف شده و جایگزین‌های معتبر ارائه شده

#### جزئیات فنی
- **دستورات معتبر AZD**: `init`، `up`، `auth`، `deploy`، `down`، `provision`، `publish`، `completion`، `config`، `env`، `show`، `version`، `monitor`
- **پرچم‌های معتبر azd monitor**: `--live`، `--logs`، `--overview`
- **ویژگی‌های حذف شده**: `azd logs`، `azd service`، `azd infra import/export/validate`، `azd history`، `azd metrics`، `azd info`، `azd config validate`

#### یادداشت‌ها
- **اعتبارسنجی**: دستورات بر اساس Azure Developer CLI نسخه v1.23.x اعتبارسنجی شده‌اند

---

### [v3.9.0] - 2026-02-05

#### تکمیل کارگاه و به‌روزرسانی کیفیت مستندات
**این نسخه ماژول‌های کارگاه تعاملی را کامل می‌کند، همه لینک‌های شکسته مستندات را اصلاح کرده و کیفیت کلی محتوا را برای توسعه‌دهندگان هوش مصنوعی که از Microsoft AZD استفاده می‌کنند بهبود می‌بخشد.**

#### اضافه شده
- **📝 CONTRIBUTING.md**: سند راهنمای مشارکت جدید با:
  - دستورالعمل‌های واضح برای گزارش مشکلات و پیشنهاد تغییرات
  - استانداردهای مستندسازی برای محتواهای جدید
  - دستورالعمل‌های نمونه کد و قواعد پیام کامیت
  - اطلاعات در مورد مشارکت جامعه

#### تکمیل شده
- **🎯 ماژول کارگاه 7 (خلاصه)**: ماژول جمع‌بندی کامل با:
  - خلاصه‌ای جامع از دستاوردهای کارگاه
  - بخش مفاهیم کلیدی شامل AZD، قالب‌ها و Microsoft Foundry
  - توصیه‌های ادامه مسیر یادگیری
  - تمرینات چالش کارگاه با درجه سختی
  - بازخورد و لینک‌های حمایت جامعه

- **📚 ماژول کارگاه 3 (تجزیه و تحلیل)**: به‌روزرسانی اهداف یادگیری شامل:
  - راهنمای فعال‌سازی GitHub Copilot با سرورهای MCP
  - درک ساختار پوشه قالب AZD
  - الگوهای سازماندهی زیرساخت به عنوان کد (Bicep)
  - دستورالعمل‌های کار عملی آزمایشگاه

- **🔧 ماژول کارگاه 6 (برچیدن)**: تکمیل با:
  - اهداف پاکسازی منابع و مدیریت هزینه
  - استفاده از `azd down` برای خاموش‌کردن ایمن زیرساخت
  - راهنمای بازیابی خدمات شناختی حذف‌شده موقت
  - پیشنهادهای اکتشافی جایزه برای GitHub Copilot و Azure Portal

#### اصلاح شده
- **🔗 اصلاح لینک‌های شکسته**: حل بیش از 15 پیوند شکسته داخلی مستندات:
  - `docs/ai-foundry/ai-model-deployment.md`: اصلاح مسیرها به microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: اصلاح مسیرهای ai-model-deployment.md و production-ai-practices.md
  - `docs/getting-started/first-project.md`: جایگزینی cicd-integration.md غیرموجود با deployment-guide.md
  - `examples/retail-scenario.md`: اصلاح مسیرهای سوالات متداول و راهنمای عیب‌یابی
  - `examples/container-app/microservices/README.md`: اصلاح مسیر صفحه اصلی دوره و راهنمای استقرار
  - `resources/faq.md` و `resources/glossary.md`: به‌روزرسانی ارجاعات فصل‌های هوش مصنوعی
  - `course-outline.md`: اصلاح ارجاعات راهنمای مدرس و آزمایشگاه کارگاه هوش مصنوعی

- **📅 بنر وضعیت کارگاه**: به‌روزرسانی از "در حال ساخت" به وضعیت فعال کارگاه با تاریخ فوریه 2026

- **🔗 ناوبری کارگاه**: اصلاح لینک‌های ناوبری شکسته در README.md کارگاه که به پوشه lab-1-azd-basics غیرموجود اشاره می‌کرد

#### تغییر یافته
- **ارائه کارگاه**: هشدار "در حال ساخت" حذف شده، کارگاه اکنون کامل و آماده استفاده است
- **یکپارچگی ناوبری**: اطمینان از داشتن مسیر ناوبری درست بین همه ماژول‌های کارگاه
- **ارجاعات مسیر یادگیری**: به‌روزرسانی ارجاعات فصلی برای استفاده از مسیرهای صحیح microsoft-foundry

#### اعتبارسنجی شده
- ✅ تمام فایل‌های Markdown انگلیسی لینک‌های داخلی معتبر دارند
- ✅ ماژول‌های کارگاه 0 تا 7 با اهداف یادگیری کامل شده‌اند
- ✅ ناوبری بین فصول و ماژول‌ها به درستی کار می‌کند
- ✅ محتوا مناسب توسعه‌دهندگان هوش مصنوعی استفاده‌کننده از Microsoft AZD است
- ✅ زبان و ساختار مناسب مبتدیان در کل حفظ شده است
- ✅ CONTRIBUTING.md راهنمای روشنی برای مشارکت کنندگان جامعه فراهم می‌کند

#### پیاده‌سازی فنی
- **اعتبارسنجی لینک**: اسکریپت خودکار PowerShell تمام لینک‌های داخلی .md را بررسی کرد
- **بازبینی محتوا**: بازبینی دستی کامل بودن کارگاه و مناسب بودن برای تازه‌کاران
- **سیستم ناوبری**: الگوهای ناوبری فصل و ماژول به صورت یکپارچه اعمال شده

#### یادداشت‌ها
- **دامنه**: تغییرات فقط روی مستندات انگلیسی اعمال شده است
- **ترجمه‌ها**: پوشه‌های ترجمه در این نسخه به‌روزرسانی نشده‌اند (ترجمه خودکار بعدا همگام‌سازی می‌شود)
- **مدت زمان کارگاه**: کارگاه کامل اکنون 3-4 ساعت آموزش عملی ارائه می‌دهد

---

### [v3.8.0] - 2025-11-19

#### مستندات پیشرفته: نظارت، امنیت و الگوهای چندعامله
**این نسخه درس‌های جامع درجه A در یکپارچه‌سازی Application Insights، الگوهای احراز هویت، و هماهنگی چندعامل برای استقرارهای تولیدی ارائه می‌دهد.**

#### اضافه شده
- **📊 درس یکپارچه‌سازی Application Insights**: در `docs/pre-deployment/application-insights.md`:
  - استقرار متمرکز بر AZD با تهیه خودکار
  - قالب‌های کامل Bicep برای Application Insights + Log Analytics
  - برنامه‌های پایتون عملی با تله‌متری سفارشی (بیش از 1200 خط کد)
  - الگوهای نظارت AI/LLM (ردیابی توکن/هزینه مدل‌های Microsoft Foundry)
  - 6 نمودار Mermaid (معماری، ردیابی توزیع‌شده، جریان تله‌متری)
  - 3 تمرین عملی (هشدارها، داشبوردها، نظارت AI)
  - مثال‌های کوئری Kusto و استراتژی‌های بهینه‌سازی هزینه
  - پخش زنده معیارها و اشکال‌زدایی در زمان واقعی
  - زمان یادگیری 40-50 دقیقه با الگوهای آماده تولید

- **🔐 درس الگوهای احراز هویت و امنیت**: در `docs/getting-started/authsecurity.md`:
  - 3 الگوی احراز هویت (رشته اتصال، Key Vault، Managed Identity)
  - قالب‌های زیرساخت کامل Bicep برای استقرارهای امن
  - کد برنامه Node.js با یکپارچه‌سازی Azure SDK
  - 3 تمرین کامل (فعال‌سازی Managed Identity، هویت اختصاص‌یافته کاربر، چرخش Key Vault)
  - بهترین شیوه‌های امنیتی و پیکربندی RBAC
  - راهنمای عیب‌یابی و تحلیل هزینه
  - الگوهای احراز هویت بدون رمز عبور آماده تولید

- **🤖 درس الگوهای هماهنگی چندعامل**: در `docs/pre-deployment/coordination-patterns.md`:
  - 5 الگوی هماهنگی (توالی، موازی، سلسله‌مراتبی، رویداد محور، توافق جمعی)
  - پیاده‌سازی کامل سرویس ارکستراتور (Python/Flask، بیش از 1500 خط)
  - 3 پیاده‌سازی تخصصی عامل (پژوهش، نویسنده، ویرایشگر)
  - یکپارچه‌سازی Service Bus برای صف پیام‌ها
  - مدیریت وضعیت Cosmos DB برای سیستم‌های توزیع‌شده
  - 6 نمودار Mermaid نمایش تعاملات عوامل
  - 3 تمرین پیشرفته (مدیریت زمان متوقف شدن، منطق تلاش دوباره، مدارشکن)
  - تجزیه و تحلیل هزینه ($240-565/ماه) با استراتژی‌های بهینه‌سازی
  - یکپارچه‌سازی Application Insights برای نظارت

#### بهبود یافته
- **فصل پیش‌استقرار**: اکنون شامل الگوهای جامع نظارت و هماهنگی است
- **فصل شروع**: با الگوهای احراز هویت حرفه‌ای بهبود یافته
- **آمادگی تولید**: پوشش کامل از امنیت تا مشاهده‌پذیری
- **طرح دوره**: به‌روزرسانی برای ارجاع به درس‌های جدید در فصل‌های 3 و 6

#### تغییر یافته
- **پیشرفت یادگیری**: تلفیق بهتر امنیت و نظارت در سراسر دوره
- **کیفیت مستندات**: استانداردهای درجه A یکسان (95-97٪) در درس‌های جدید
- **الگوهای تولید**: پوشش کامل از ابتدا تا انتهای استقرار در سازمان‌ها

#### بهبود یافته
- **تجربه توسعه‌دهنده**: مسیر واضح از توسعه تا نظارت تولید
- **استانداردهای امنیتی**: الگوهای حرفه‌ای برای احراز هویت و مدیریت اسرار
- **مشاهده‌پذیری**: یکپارچه‌سازی کامل Application Insights با AZD
- **بارهای کاری هوش مصنوعی**: نظارت تخصصی برای مدل‌های Microsoft Foundry و سیستم‌های چندعامله

#### اعتبارسنجی شده
- ✅ همه درس‌ها شامل کد کاری کامل (نه قطعات کد) هستند
- ✅ نمودارهای Mermaid برای یادگیری بصری (جمعا 19 نمودار در 3 درس)
- ✅ تمرینات عملی با مراحل اعتبارسنجی (جمعا 9 تمرین)
- ✅ قالب‌های Bicep آماده تولید قابل استقرار با `azd up`
- ✅ تحلیل هزینه و استراتژی‌های بهینه‌سازی
- ✅ راهنمای عیب‌یابی و بهترین شیوه‌ها
- ✅ نقاط بررسی دانش با دستورات اعتبارسنجی

#### نتایج درجه‌بندی مستندات
- **docs/pre-deployment/application-insights.md**: - راهنمای جامع نظارت
- **docs/getting-started/authsecurity.md**: - الگوهای امنیتی حرفه‌ای
- **docs/pre-deployment/coordination-patterns.md**: - معماری‌های پیشرفته چندعامله
- **محتوای کلی جدید**: - استانداردهای کیفیت بالا و پایدار

#### پیاده‌سازی فنی
- **Application Insights**: Log Analytics + تله‌متری سفارشی + ردیابی توزیع شده
- **احراز هویت**: Managed Identity + Key Vault + الگوهای RBAC
- **چندعامل**: Service Bus + Cosmos DB + Container Apps + ارکستراسیون
- **نظارت**: معیارهای زنده + کوئری‌های Kusto + هشدارها + داشبوردها
- **مدیریت هزینه**: استراتژی نمونه‌برداری، سیاست‌های نگهداری، کنترل بودجه

### [v3.7.0] - 2025-11-19

#### بهبود کیفیت مستندات و افزودن مثال جدید مدل‌های Microsoft Foundry
**این نسخه کیفیت مستندات در کل مخزن را بهبود می‌دهد و یک مثال کامل استقرار مدل‌های Microsoft Foundry با رابط چت gpt-4.1 ارائه می‌کند.**

#### اضافه شده
- **🤖 مثال چت مدل‌های Microsoft Foundry**: استقرار کامل gpt-4.1 با پیاده‌سازی کاری در `examples/azure-openai-chat/`:
  - زیرساخت کامل مدل‌های Microsoft Foundry (استقرار مدل gpt-4.1)
  - رابط چت خط فرمان پایتون با تاریخچه گفتگو
  - یکپارچه‌سازی Key Vault برای ذخیره امن کلید API
  - ردیابی مصرف توکن و برآورد هزینه
  - محدودیت نرخ و مدیریت خطا
  - مستندات جامع با راهنمای استقرار 35-45 دقیقه‌ای
  - 11 فایل آماده تولید (قالب‌های Bicep، برنامه پایتون، پیکربندی)
- **📚 تمرین‌های مستندات**: افزودن تمرین‌های عملی به راهنمای پیکربندی:
  - تمرین 1: پیکربندی چندمحیطی (15 دقیقه)
  - تمرین 2: تمرین مدیریت مخفی (10 دقیقه)
  - معیارهای موفقیت واضح و مراحل اعتبارسنجی
- **✅ اعتبارسنجی استقرار**: افزودن بخش اعتبارسنجی به راهنمای استقرار:
  - روندهای بررسی سلامت
  - چک‌لیست معیارهای موفقیت
  - خروجی‌های مورد انتظار برای همه دستورات استقرار
  - مرجع سریع عیب‌یابی

#### بهبود یافته
- **examples/README.md**: به کیفیت درجه A (93٪) به‌روزرسانی شده:
  - افزودن azure-openai-chat به همه بخش‌های مرتبط
  - افزایش تعداد مثال‌های محلی از 3 به 4
  - افزودن به جدول نمونه‌های کاربرد هوش مصنوعی
  - ادغام در شروع سریع برای کاربران متوسط
  - افزودن به بخش قالب‌های Microsoft Foundry
  - به‌روزرسانی ماتریس مقایسه و بخش‌های یافتن فناوری
- **کیفیت مستندسازی**: بهبود از B+ (۸۷٪) به A- (۹۲٪) در کل پوشه مستندات:
  - اضافه شدن خروجی‌های مورد انتظار به مثال‌های دستورات حیاتی
  - شامل کردن مراحل تأیید تغییرات پیکربندی
  - تقویت یادگیری عملی با تمرین‌های کاربردی

#### تغییر یافته
- **پیشرفت یادگیری**: ادغام بهتر مثال‌های هوش مصنوعی برای یادگیرندگان متوسط
- **ساختار مستندات**: تمرین‌های عملی بیشتر با نتایج واضح
- **فرآیند تأیید**: معیارهای موفقیت صریح به جریان‌های کاری کلیدی اضافه شده

#### بهبود یافته
- **تجربه توسعه‌دهنده**: زمان پیاده‌سازی مدل‌های Microsoft Foundry اکنون ۳۵ تا ۴۵ دقیقه است (در مقابل ۶۰ تا ۹۰ دقیقه برای گزینه‌های پیچیده‌تر)
- **شفافیت هزینه**: برآوردهای واضح هزینه (۵۰ تا ۲۰۰ دلار در ماه) برای مثال مدل‌های Microsoft Foundry
- **مسیر یادگیری**: توسعه‌دهندگان هوش مصنوعی نقطه ورود واضحی با azure-openai-chat دارند
- **استانداردهای مستندسازی**: خروجی‌های مورد انتظار و مراحل تأیید هماهنگ

#### تأیید شده
- ✅ مثال Microsoft Foundry Models کاملاً کاربردی با `azd up`
- ✅ تمام ۱۱ فایل پیاده‌سازی از نظر نگارشی صحیح هستند
- ✅ دستورالعمل‌های README مطابق با تجربه واقعی پیاده‌سازی است
- ✅ لینک‌های مستندات در بیش از ۸ مکان به‌روزرسانی شدند
- ✅ شاخص مثال‌ها به‌درستی ۴ مثال محلی را نشان می‌دهد
- ✅ هیچ لینک خارجی تکراری در جداول وجود ندارد
- ✅ تمام مراجع ناوبری صحیح است

#### پیاده‌سازی فنی
- **معماری Microsoft Foundry Models**: الگوی gpt-4.1 + Key Vault + Container Apps
- **امنیت**: آماده‌شدن Managed Identity، اسرار در Key Vault
- **نظارت**: ادغام Application Insights
- **مدیریت هزینه**: ردیابی توکن و بهینه‌سازی استفاده
- **استقرار**: یک دستور `azd up` برای تنظیم کامل

### [v3.6.0] - ۲۰۲۵-۱۱-۱۹

#### به‌روزرسانی اصلی: مثال‌های استقرار برنامه‌های کانتینری
**این نسخه مثال‌های جامع و آماده تولید استقرار برنامه‌های کانتینری با استفاده از Azure Developer CLI (AZD) را معرفی می‌کند، با مستندات کامل و ادغام در مسیر یادگیری.**

#### اضافه شده
- **🚀 مثال‌های برنامه کانتینری**: مثال‌های محلی جدید در `examples/container-app/`:
  - [راهنمای اصلی](examples/container-app/README.md): نمای کلی کامل استقرارهای کانتینری، شروع سریع، تولید و الگوهای پیشرفته
  - [API ساده Flask](../../examples/container-app/simple-flask-api): REST API مناسب برای مبتدیان با مقیاس تا صفر، بررسی سلامت، نظارت و عیب‌یابی
  - [معماری میکروسرویس‌ها](../../examples/container-app/microservices): استقرار چندخدمتی آماده تولید (API Gateway، محصول، سفارش، کاربر، اعلان)، پیام‌رسانی آسنکرون، Service Bus، Cosmos DB، Azure SQL، ردیابی توزیع شده، استقرار آبی-سبز / کناری
- **بهترین شیوه‌ها**: راهنمایی امنیت، نظارت، بهینه‌سازی هزینه و CI/CD برای بارهای کاری کانتینری
- **نمونه‌های کد**: نمونه کامل `azure.yaml`، قالب‌های Bicep و پیاده‌سازی خدمات چندزبان (پایتون، Node.js، C#، Go)
- **آزمایش و عیب‌یابی**: سناریوهای آزمایش پایان به پایان، دستورات نظارتی، راهنمای عیب‌یابی

#### تغییر یافته
- **README.md**: به‌روزرسانی برای نمایش و لینک دادن به مثال‌های جدید برنامه کانتینری تحت عنوان "مثال‌های محلی - برنامه‌های کانتینری"
- **examples/README.md**: برجسته‌سازی مثال‌های برنامه کانتینری، اضافه کردن ورودی‌های ماتریس مقایسه، به‌روزرسانی مراجع فناوری/معماری
- **خط‌مشی دوره و راهنمای مطالعه**: ارجاع به مثال‌های جدید برنامه کانتینری و الگوهای استقرار در فصل‌های مرتبط

#### تأیید شده
- ✅ تمام مثال‌های جدید با `azd up` قابل استقرار هستند و بهترین شیوه‌ها را دنبال می‌کنند
- ✅ لینک‌ها و ناوبری مستندات به‌روزرسانی شدند
- ✅ مثال‌ها شامل سناریوهای مبتدی تا پیشرفته، از جمله میکروسرویس‌های تولیدی هستند

#### یادداشت‌ها
- **دامنه**: فقط مستندات و مثال‌های انگلیسی
- **گام‌های بعدی**: گسترش با الگوهای کانتینری پیشرفته و اتوماسیون CI/CD در نسخه‌های آینده

### [v3.5.0] - ۲۰۲۵-۱۱-۱۹

#### تغییر نام محصول: Microsoft Foundry
**این نسخه تغییر نام کامل محصول از "Microsoft Foundry" به "Microsoft Foundry" را در تمام مستندات انگلیسی پیاده‌سازی می‌کند، که بازتاب تغییر رسمی برند مایکروسافت است.**

#### تغییر یافته
- **🔄 به‌روزرسانی نام محصول**: بازبرندینگ کامل از "Microsoft Foundry" به "Microsoft Foundry"
  - به‌روزرسانی همه ارجاعات در مستندات انگلیسی در پوشه `docs/`
  - تغییر نام پوشه: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - تغییر نام فایل: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - مجموعاً: ۲۳ ارجاع محتوا در ۷ فایل مستندات به‌روزرسانی شدند

- **📁 تغییرات ساختار پوشه‌ها**:
  - تغییر نام `docs/ai-foundry/` به `docs/microsoft-foundry/`
  - به‌روزرسانی تمام مراجع متقاطع برای بازتاب ساختار جدید پوشه
  - اعتبارسنجی لینک‌های ناوبری در سراسر مستندات

- **📄 تغییر نام فایل‌ها**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - به‌روزرسانی تمام لینک‌های داخلی برای ارجاع به نام فایل جدید

#### فایل‌های به‌روزرسانی شده
- **مستندات فصل** (۷ فایل):
  - `docs/microsoft-foundry/ai-model-deployment.md` - ۳ به‌روزرسانی لینک ناوبری
  - `docs/microsoft-foundry/ai-workshop-lab.md` - ۴ ارجاع نام محصول به‌روزرسانی شده
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - قبلاً از Microsoft Foundry استفاده می‌کند (از به‌روزرسانی‌های قبلی)
  - `docs/microsoft-foundry/production-ai-practices.md` - ۳ ارجاع به‌روزرسانی شده (نمای کلی، بازخورد جامعه، مستندات)
  - `docs/getting-started/azd-basics.md` - ۴ لینک مراجع متقاطع به‌روزرسانی شده
  - `docs/getting-started/first-project.md` - ۲ لینک ناوبری فصل به‌روزرسانی شده
  - `docs/getting-started/installation.md` - ۲ لینک فصل بعد به‌روزرسانی شده
  - `docs/troubleshooting/ai-troubleshooting.md` - ۳ ارجاع به‌روزرسانی شده (ناوبری، جامعه Discord)
  - `docs/troubleshooting/common-issues.md` - ۱ لینک ناوبری به‌روزرسانی شده
  - `docs/troubleshooting/debugging.md` - ۱ لینک ناوبری به‌روزرسانی شده

- **فایل‌های ساختار دوره** (۲ فایل):
  - `README.md` - ۱۷ ارجاع به‌روزرسانی شده (نمای کلی دوره، عناوین فصل، بخش قالب‌ها، دیدگاه‌های جامعه)
  - `course-outline.md` - ۱۴ ارجاع به‌روزرسانی شده (نمای کلی، اهداف یادگیری، منابع فصل)

#### تأیید شده
- ✅ هیچ ارجاع باقی‌مانده به مسیر پوشه "ai-foundry" در مستندات انگلیسی
- ✅ هیچ ارجاع باقی‌مانده به نام محصول "Microsoft Foundry" در مستندات انگلیسی
- ✅ همه لینک‌های ناوبری با ساختار پوشه جدید کار می‌کنند
- ✅ تغییر نام فایل‌ها و پوشه‌ها با موفقیت انجام شد
- ✅ مراجع متقاطع بین فصل‌ها اعتبارسنجی شدند

#### یادداشت‌ها
- **دامنه**: تغییرات فقط روی مستندات انگلیسی در پوشه `docs/` اعمال شده است
- **ترجمه‌ها**: پوشه‌های ترجمه (`translations/`) در این نسخه به‌روزرسانی نشده‌اند
- **کارگاه**: مواد کارگاهی (`workshop/`) در این نسخه به‌روزرسانی نشده‌اند
- **مثال‌ها**: فایل‌های مثال ممکن است هنوز مرجع نام‌گذاری قدیمی را داشته باشند (در به‌روزرسانی‌های آینده اصلاح خواهد شد)
- **لینک‌های خارجی**: آدرس‌های URL خارجی و مراجع مخزن GitHub دست نخورده باقی مانده‌اند

#### راهنمای مهاجرت برای مشارکت‌کنندگان
اگر شاخه‌های محلی یا مستنداتی دارید که به ساختار قدیمی اشاره می‌کنند:
1. مراجع پوشه را به‌روزرسانی کنید: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. مراجع فایل را به‌روزرسانی کنید: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. نام محصول را جایگزین کنید: "Microsoft Foundry" → "Microsoft Foundry"
4. بررسی کنید که تمام لینک‌های داخلی مستندات هنوز کار می‌کنند

---

### [v3.4.0] - ۲۰۲۵-۱۰-۲۴

#### پیش‌نمایش زیرساخت و بهبودهای اعتبارسنجی
**این نسخه پشتیبانی گسترده‌ای برای ویژگی پیش‌نمایش جدید Azure Developer CLI معرفی کرده و تجربه کاربری کارگاه را بهبود می‌بخشد.**

#### اضافه شده
- **🧪 مستندات ویژگی azd provision --preview**: پوشش کامل قابلیت پیش‌نمایش زیرساخت جدید
  - مرجع دستور و مثال‌های کاربردی در برگه تقلب
  - ادغام دقیق در راهنمای پروویژن با موارد استفاده و مزایا
  - ادغام بررسی پیش‌فرود برای اعتبارسنجی ایمن‌تر استقرار
  - به‌روزرسانی راهنمای شروع کار با تمرکز بر ایمنی در استقرار
- **🚧 بنر وضعیت کارگاه**: بنر HTML حرفه‌ای نشان‌دهنده وضعیت توسعه کارگاه
  - طراحی گرادیان با نشانگرهای ساخت و ساز برای ارتباط واضح با کاربر
  - زمان آخرین به‌روزرسانی برای شفافیت
  - طراحی واکنش‌گرا برای انواع دستگاه‌ها

#### بهبود یافته
- **ایمنی زیرساخت**: قابلیت پیش‌نمایش به طور کامل در مستندات استقرار ادغام شده
- **اعتبارسنجی پیش از استقرار**: اسکریپت‌های خودکار اکنون تست پیش‌نمایش زیرساخت را شامل می‌شوند
- **گردش کار توسعه‌دهنده**: ترتیب دستورات به روز شده است تا پیش‌نمایش به عنوان بهترین شیوه لحاظ شود
- **تجربه کارگاه**: انتظارات واضح برای کاربران درباره وضعیت توسعه محتوا تنظیم شده است

#### تغییر یافته
- **بهترین روش‌های استقرار**: گردش کار پیش‌نمایش‌اول اکنون روش پیشنهادی است
- **جریان مستندات**: اعتبارسنجی زیرساخت زودتر در فرایند یادگیری قرار گرفته است
- **ارائه کارگاه**: ارتباط وضعیت حرفه‌ای با جدول زمانی توسعه واضح

#### بهبود یافته
- **رویکرد ایمنی‌محور**: تغییرات زیرساخت اکنون قبل از استقرار اعتبارسنجی می‌شوند
- **همکاری تیمی**: نتایج پیش‌نمایش می‌تواند برای بازبینی و تأیید به اشتراک گذاشته شود
- **آگاهی از هزینه‌ها**: درک بهتر هزینه منابع قبل از تخصیص
- **کاهش ریسک**: کاهش خطاهای استقرار از طریق اعتبارسنجی پیشرفته

#### پیاده‌سازی فنی
- **ادغام چندین سند**: ویژگی پیش‌نمایش در ۴ فایل کلیدی مستندسازی شده
- **الگوهای دستوری**: نحو و نمونه‌های سازگار در مستندات
- **ادغام بهترین شیوه**: پیش‌نمایش در جریان‌های اعتبارسنجی و اسکریپت‌ها گنجانده شده است
- **نشانه‌های بصری**: علامت‌گذاری واضح ویژگی جدید برای قابلیت کشف

#### زیرساخت کارگاه
- **ارتباط وضعیت**: بنر HTML حرفه‌ای با طراحی گرادیان
- **تجربه کاربری**: وضعیت توسعه روشن از سردرگمی جلوگیری می‌کند
- **ارائه حرفه‌ای**: اعتبار مخزن را حفظ کرده و در عین حال انتظارات را تنظیم می‌کند
- **شفافیت جدول زمانی**: زمان آخرین به‌روزرسانی اکتبر ۲۰۲۵ برای پاسخگویی

### [v3.3.0] - ۲۰۲۵-۰۹-۲۴

#### مواد کارگاه پیشرفته و تجربه یادگیری تعاملی
**این نسخه مواد جامع کارگاهی با راهنماهای تعاملی مبتنی بر مرورگر و مسیرهای یادگیری ساختارمند را معرفی می‌کند.**

#### اضافه شده
- **🎥 راهنمای تعاملی کارگاه**: تجربه کارگاه مبتنی بر مرورگر با قابلیت پیش‌نمایش MkDocs
- **📝 دستورالعمل‌های ساختارمند کارگاه**: مسیر یادگیری ۷ مرحله‌ای از کشف تا سفارشی‌سازی
  - ۰-مقدمه: مرور و راه‌اندازی کارگاه
  - ۱-انتخاب قالب هوش مصنوعی: فرآیند کشف و انتخاب قالب
  - ۲-اعتبارسنجی قالب هوش مصنوعی: روندهای استقرار و اعتبارسنجی
  - ۳-بازساخت قالب هوش مصنوعی: درک معماری قالب
  - ۴-پیکربندی قالب هوش مصنوعی: تنظیمات و سفارشی‌سازی
  - ۵-سفارشی‌سازی قالب هوش مصنوعی: تغییرات پیشرفته و تکرارها
  - ۶-پاکسازی زیرساخت: مدیریت منابع و پاکسازی
  - ۷-جمع‌بندی: خلاصه و گام‌های بعدی
- **🛠️ ابزار کارگاه**: پیکربندی MkDocs با پوسته Material برای تجربه یادگیری بهبود یافته
- **🎯 مسیر یادگیری عملی**: روش ۳ مرحله‌ای (کشف → استقرار → سفارشی‌سازی)
- **📱 ادغام GitHub Codespaces**: راه‌اندازی محیط توسعه به صورت یکپارچه

#### بهبود یافته
- **آزمایشگاه هوش مصنوعی کارگاه**: گسترش یافته با تجربه یادگیری ساختارمند ۲-۳ ساعته
- **مستندسازی کارگاه**: ارائه حرفه‌ای با ناوبری و کمک‌های بصری
- **پیشرفت یادگیری**: راهنمای مرحله به مرحله واضح از انتخاب قالب تا استقرار تولید
- **تجربه توسعه‌دهنده**: ابزارهای یکپارچه برای گردش کار توسعه روان

#### بهبود یافته
- **دسترس‌پذیری**: رابط مبتنی بر مرورگر با عملکرد جستجو، کپی و تغییر پوسته
- **یادگیری خودسرعت**: ساختار کارگاه انعطاف‌پذیر برای سطوح مختلف سرعت یادگیری
- **کاربرد عملی**: سناریوهای استقرار قالب هوش مصنوعی در دنیای واقعی
- **ادغام جامعه**: ادغام Discord برای پشتیبانی و همکاری در کارگاه

#### ویژگی‌های کارگاه
- **جستجوی داخلی**: کشف سریع کلیدواژه‌ها و درس‌ها
- **کپی بلوک‌های کد**: قابلیت کپی‌رنگی با هاور برای همه مثال‌های کد
- **تغییر پوسته**: پشتیبانی از حالت روشن/تاریک برای سلیقه‌های مختلف
- **دارایی‌های بصری**: اسکرین‌شات‌ها و نمودارها برای درک بهتر
- **ادغام کمک**: دسترسی مستقیم به Discord برای پشتیبانی جامعه

### [v3.2.0] - ۲۰۲۵-۰۹-۱۷

#### بازساخت ناوبری اصلی و سیستم یادگیری مبتنی بر فصل
**این نسخه ساختار یادگیری جامع مبتنی بر فصل را معرفی کرده و ناوبری بهبود یافته را در سراسر مخزن اعمال می‌کند.**

#### اضافه شده
- **📚 سیستم یادگیری مبتنی بر فصل**: کل دوره به ۸ فصل پیش‌رونده تقسیم‌بندی شده است
  - فصل ۱: پایه و شروع سریع (⭐ - ۳۰-۴۵ دقیقه)
  - فصل ۲: توسعه هوش مصنوعی اول (⭐⭐ - ۱-۲ ساعت)
  - فصل ۳: پیکربندی و احراز هویت (⭐⭐ - ۴۵-۶۰ دقیقه)
  - فصل ۴: زیرساخت به‌مثابه کد و استقرار (⭐⭐⭐ - ۱-۱.۵ ساعت)
  - فصل ۵: راه‌حل‌های چندعامل هوش مصنوعی (⭐⭐⭐⭐ - ۲-۳ ساعت)
  - فصل ۶: اعتبارسنجی و برنامه‌ریزی پیش‌استقرار (⭐⭐ - ۱ ساعت)
  - فصل ۷: عیب‌یابی و رفع مشکلات (⭐⭐ - ۱-۱.۵ ساعت)
  - فصل ۸: الگوهای تولید و سازمانی (⭐⭐⭐⭐ - ۲-۳ ساعت)
- **📚 سیستم ناوبری جامع**: سربرگ‌ها و پاورقی‌های ناوبری سازگار در کل مستندات
- **🎯 پیگیری پیشرفت**: فهرست بررسی اتمام دوره و سیستم تأیید یادگیری
- **🗺️ راهنمای مسیر یادگیری**: نقاط ورود واضح برای سطوح و اهداف مختلف تجربه
- **🔗 ناوبری مراجع متقاطع**: ارتباط واضح فصل‌ها و پیش‌نیازها

#### بهبود یافته
- **ساختار README**: تبدیل به یک پلتفرم یادگیری ساختارمند با سازماندهی مبتنی بر فصل
- **ناوبری مستندات**: هر صفحه اکنون شامل زمینه فصل و راهنمای پیشرفت است
- **سازماندهی قالب‌ها**: مثال‌ها و قالب‌ها به فصل‌های مربوط به یادگیری اختصاص داده شده‌اند
- **ادغام منابع**: برگه‌های تقلب، سوالات متداول و راهنمای مطالعه به فصل‌های مرتبط متصل شدند
- **ادغام کارگاه**: آزمایشگاه‌های عملی به اهداف یادگیری چند فصل اختصاص یافته‌اند

#### تغییر یافته
- **پیشرفت یادگیری**: انتقال از مستندسازی خطی به یادگیری منعطف مبتنی بر فصل
- **محل قرارگیری پیکربندی**: جابجایی راهنمای پیکربندی به فصل ۳ برای جریان یادگیری بهتر
- **ادغام محتوای هوش مصنوعی**: ادغام بهتر محتوای مرتبط با هوش مصنوعی در طول مسیر یادگیری
- **محتوای تولیدی**: الگوهای پیشرفته جمع‌بندی شده در فصل ۸ برای یادگیرندگان سازمانی

#### بهبود یافته
- **تجربه کاربری**: ناوبری واضح با مسیرهای راهنما و نشانگرهای پیشرفت فصل‌ها
- **دسترس‌پذیری**: الگوهای ناوبری یکنواخت برای سهولت پیمایش دوره
- **ارائه حرفه‌ای**: ساختار دوره دانشگاهی مناسب آموزش‌های آکادمیک و سازمانی
- **کارایی یادگیری**: کاهش زمان یافتن محتوای مرتبط به‌واسطه سازماندهی بهبود یافته

#### پیاده‌سازی فنی
- **هدرهای ناوبری**: استانداردسازی ناوبری فصل‌ها در بیش از ۴۰ فایل مستندات
- **ناوبری فوتر**: راهنمای پیشرفت یکنواخت و نشانگرهای تکمیل فصل‌ها
- **پیوندهای داخلی متقاطع**: سیستم جامع پیوندهای داخلی متصل کننده مفاهیم مرتبط
- **نقشه‌برداری فصل‌ها**: قالب‌ها و نمونه‌ها به وضوح با اهداف یادگیری مرتبط شده‌اند

#### بهبود راهنمای مطالعه
- **📚 اهداف یادگیری جامع**: بازسازی راهنمای مطالعه برای هماهنگی با سیستم ۸ فصله
- **🎯 ارزیابی مبتنی بر فصل**: هر فصل شامل اهداف یادگیری خاص و تمرینات عملی است
- **📋 پیگیری پیشرفت**: برنامه یادگیری هفتگی با خروجی‌های قابل اندازه‌گیری و فهرست‌های بررسی تکمیل
- **❓ سوالات ارزیابی**: سوالات اعتبارسنجی دانش برای هر فصل با نتایج حرفه‌ای
- **🛠️ تمرینات عملی**: فعالیت‌های دستی با سناریوهای واقعی استقرار و عیب‌یابی
- **📊 پیشرفت مهارت**: پیشرفت روشن از مفاهیم پایه تا الگوهای سازمانی با تمرکز بر توسعه حرفه‌ای
- **🎓 چارچوب صدور گواهینامه**: نتایج توسعه حرفه‌ای و سیستم شناخت جامعه
- **⏱️ مدیریت زمان‌بندی**: برنامه آموزشی ساختاریافته ۱۰ هفته‌ای با اعتبارسنجی نقاط عطف

### [v3.1.0] - 2025-09-17

#### راهکارهای هوش مصنوعی چندعاملی پیشرفته
**این نسخه راهکار چندعاملی خرده‌فروشی را با نام‌گذاری بهتر عامل‌ها و مستندات بهبود یافته ارتقاء می‌دهد.**

#### تغییر یافته
- **اصطلاحات چندعاملی**: جایگزینی "عامل کورا" با "عامل مشتری" در سراسر راهکار چندعاملی خرده‌فروشی برای درک واضح‌تر
- **معماری عامل**: به‌روزرسانی همه مستندات، قالب‌های ARM و نمونه‌های کد با نام‌گذاری یکپارچه "عامل مشتری"
- **نمونه‌های پیکربندی**: به‌روزرسانی الگوهای پیکربندی عامل با قراردادهای نام‌گذاری نوین
- **همسان‌سازی مستندات**: اطمینان از استفاده همه ارجاعات از نام‌های توصیفی و حرفه‌ای عامل

#### تقویت شده
- **بسته قالب ARM**: بروزرسانی retail-multiagent-arm-template با ارجاعات به عامل مشتری
- **نمودارهای معماری**: به‌روزرسانی نمودارهای Mermaid با نام‌گذاری به‌روز عامل‌ها
- **نمونه‌های کد**: کلاس‌های پایتون و نمونه‌های پیاده‌سازی اکنون از نام‌گذاری CustomerAgent استفاده می‌کنند
- **متغیرهای محیطی**: به‌روزرسانی همه اسکریپت‌های استقرار برای استفاده از قراردادهای CUSTOMER_AGENT_NAME

#### بهبود یافته
- **تجربه توسعه‌دهنده**: نقش‌ها و مسئولیت‌های عامل شفاف‌تر در مستندات
- **آمادگی برای تولید**: تطابق بهتر با قراردادهای نام‌گذاری سازمانی
- **مواد آموزشی**: نام‌گذاری عامل‌ها با درک شهودی‌تر جهت اهداف آموزشی
- **قابلیت استفاده قالب**: ساده‌سازی درک عملکرد عامل‌ها و الگوهای استقرار

#### جزئیات فنی
- بروزرسانی نمودارهای معماری Mermaid با ارجاعات CustomerAgent
- جایگزینی نام کلاس‌های CoraAgent با CustomerAgent در نمونه‌های پایتون
- تغییر پیکربندی‌های قالب ARM JSON برای استفاده از نوع عامل "customer"
- به‌روزرسانی متغیرهای محیطی از CORA_AGENT_* به الگوهای CUSTOMER_AGENT_*
- تازه‌سازی همه دستورات استقرار و تنظیمات کانتینر

### [v3.0.0] - 2025-09-12

#### تغییرات اصلی - تمرکز بر توسعه‌دهنده هوش مصنوعی و ادغام Microsoft Foundry
**این نسخه مخزن را به منابع یادگیری جامع متمرکز بر هوش مصنوعی با ادغام Microsoft Foundry تبدیل می‌کند.**

#### افزوده شده
- **🤖 مسیر یادگیری مبتنی بر هوش مصنوعی**: ساختاربندی کامل با اولویت توسعه‌دهندگان و مهندسان هوش مصنوعی
- **راهنمای ادغام Microsoft Foundry**: مستندسازی جامع برای اتصال AZD به خدمات Microsoft Foundry
- **الگوهای استقرار مدل‌های هوش مصنوعی**: راهنمای جامع انتخاب مدل، پیکربندی و استراتژی‌های استقرار در تولید
- **کارگاه آموزشی هوش مصنوعی**: کارگاه عملی ۲-۳ ساعته برای تبدیل برنامه‌های هوش مصنوعی به راه‌حل‌های قابل استقرار با AZD
- **بهترین شیوه‌های هوش مصنوعی در تولید**: الگوهای سازمانی آماده بهره‌برداری، نظارت و امنیت بارهای هوش مصنوعی
- **راهنمای جامع عیب‌یابی هوش مصنوعی**: مشکلات مربوط به مدل‌های Microsoft Foundry، خدمات شناختی و استقرار هوش مصنوعی
- **گالری قالب‌های هوش مصنوعی**: مجموعه قالب‌های منتخب Microsoft Foundry با درجه پیچیدگی
- **مواد کارگاه**: ساختار کامل کارگاه با آزمایشگاه‌ها و منابع مرجع

#### بهبود یافته
- **ساختار README**: تمرکز بر توسعه‌دهنده هوش مصنوعی با داده‌های علاقه‌مندی ۴۵٪ جامعه Discord Microsoft Foundry
- **مسیرهای یادگیری**: مسیر متمرکز توسعه‌دهنده هوش مصنوعی در کنار مسیرهای سنتی دانش‌آموزان و مهندسان DevOps
- **پیشنهاد قالب‌ها**: قالب‌های منتخب هوش مصنوعی مانند azure-search-openai-demo، contoso-chat و openai-chat-app-quickstart
- **ادغام جامعه**: تقویت حمایت جامعه Discord با کانال‌ها و بحث‌های اختصاصی هوش مصنوعی

#### امنیت و تمرکز بر تولید
- **الگوهای هویت مدیریت شده**: پیکربندی‌های احراز هویت و امنیت اختصاصی هوش مصنوعی
- **بهینه‌سازی هزینه**: ردیابی مصرف توکن و کنترل بودجه برای بارهای کاری هوش مصنوعی
- **استقرار چندمنطقه‌ای**: استراتژی‌های استقرار جهانی برنامه‌های هوش مصنوعی
- **نظارت بر عملکرد**: شاخص‌های اختصاصی هوش مصنوعی و ادغام Application Insights

#### کیفیت مستندات
- **ساختار خطی دوره**: پیشرفت منطقی از الگوهای استقرار مقدماتی تا پیشرفته هوش مصنوعی
- **آدرس‌های اینترنتی معتبر**: بررسی و دسترسی‌پذیری همه لینک‌های مخزن خارجی
- **مرجع کامل**: اعتبارسنجی و عملکرد همه لینک‌های داخلی مستندات
- **آماده تولید**: الگوهای استقرار سازمانی با نمونه‌های واقعی

### [v2.0.0] - 2025-09-09

#### تغییرات عمده - بازسازی مخزن و بهبود حرفه‌ای
**این نسخه بازسازی اساسی ساختار مخزن و ارائه محتوای آن را نشان می‌دهد.**

#### افزوده شده
- **چارچوب یادگیری ساختاریافته**: تمام صفحات مستندات اکنون شامل بخش‌های معرفی، اهداف یادگیری و نتایج یادگیری هستند
- **سیستم ناوبری**: افزودن لینک‌های درس قبلی/بعدی در تمام مستندات برای پیشرفت هدایت شده یادگیری
- **راهنمای مطالعه**: study-guide.md جامع با اهداف یادگیری، تمرینات عملی و مواد ارزیابی
- **ارائه حرفه‌ای**: حذف همه ایموجی‌ها برای بهبود دسترس‌پذیری و ظاهر حرفه‌ای
- **ساختار محتوای بهبود یافته**: سازماندهی و جریان بهتر مواد یادگیری

#### تغییر یافته
- **فرمت مستندات**: استانداردسازی همه مستندات با ساختار محور یادگیری یکنواخت
- **جریان ناوبری**: پیاده‌سازی پیشرفت منطقی در تمامی مواد آموزشی
- **ارائه محتوا**: حذف عناصر تزئینی به نفع قالب‌بندی شفاف و حرفه‌ای
- **ساختار لینک‌ها**: به‌روزرسانی همه لینک‌های داخلی برای پشتیبانی از سیستم ناوبری جدید

#### بهبود یافته
- **دسترس‌پذیری**: حذف وابستگی به ایموجی برای سازگاری بهتر با صفحه‌خوان‌ها
- **ظاهر حرفه‌ای**: ارائه تمیز به سبک دانشگاهی مناسب یادگیری سازمانی
- **تجربه یادگیری**: رویکرد ساختار یافته با اهداف واضح و نتایج برای هر درس
- **سازماندهی محتوا**: جریان منطقی بهتر و ارتباط میان موضوعات مرتبط

### [v1.0.0] - 2025-09-09

#### انتشار اولیه - مخزن جامع یادگیری AZD

#### افزوده شده
- **ساختار مستندات اصلی**
  - سری راهنمای شروع کامل
  - مستندات کامل استقرار و تأمین منابع
  - منابع جامع عیب‌یابی و راهنمای خطایابی
  - ابزارها و روش‌های اعتبارسنجی پیش از استقرار

- **ماژول شروع به کار**
  - مبانی AZD: مفاهیم و اصطلاحات اصلی
  - راهنمای نصب: دستورالعمل‌های راه‌اندازی پلتفرم خاص
  - راهنمای پیکربندی: تنظیم محیط و احراز هویت
  - آموزش پروژه اول: یادگیری گام به گام عملی

- **ماژول استقرار و تأمین منابع**
  - راهنمای استقرار: مستندات کامل روند کاری
  - راهنمای تأمین منابع: زیرساخت به‌عنوان کد با بایسپ
  - بهترین شیوه‌ها برای استقرار در تولید
  - الگوهای معماری چندسرویسی

- **ماژول اعتبارسنجی پیش از استقرار**
  - برنامه‌ریزی ظرفیت: اعتبارسنجی دسترسی منابع Azure
  - انتخاب SKU: راهنمای جامع سطوح سرویس
  - بررسی‌های پیش‌پرواز: اسکریپت‌های اعتبارسنجی خودکار (PowerShell و Bash)
  - ابزارهای برآورد هزینه و برنامه‌ریزی بودجه

- **ماژول عیب‌یابی**
  - مشکلات رایج: مسائل و راه‌حل‌های متداول
  - راهنمای خطایابی: روش‌شناسی‌های سیستماتیک عیب‌یابی
  - تکنیک‌ها و ابزارهای تشخیص پیشرفته
  - نظارت و بهینه‌سازی عملکرد

- **منابع و مراجع**
  - برگه تقلب دستورات: مرجع سریع دستورات ضروری
  - فرهنگ اصطلاحات: تعریف جامع اصطلاحات و مخفف‌ها
  - سوالات متداول: پاسخ‌های دقیق به سوالات رایج
  - لینک‌های منابع خارجی و ارتباط‌های جامعه

- **نمونه‌ها و قالب‌ها**
  - نمونه برنامه وب ساده
  - قالب استقرار وب‌سایت استاتیک
  - پیکربندی برنامه کانتینر
  - الگوهای ادغام پایگاه داده
  - نمونه‌های معماری میکروسرویس‌ها
  - پیاده‌سازی توابع بدون سرور

#### ویژگی‌ها
- **پشتیبانی چندپلتفرمی**: راهنماهای نصب و پیکربندی برای ویندوز، مک‌اواس و لینوکس
- **سطوح مهارتی متعدد**: محتوا طراحی شده برای دانش‌آموزان تا توسعه‌دهندگان حرفه‌ای
- **تمرکز عملی**: نمونه‌های عملی و سناریوهای دنیای واقعی
- **پوشش جامع**: از مفاهیم پایه تا الگوهای پیشرفته سازمانی
- **رویکرد امنیت‌محور**: به‌کارگیری بهترین شیوه‌های امنیتی در سراسر محتوا
- **بهینه‌سازی هزینه**: راهنمایی برای استقرارهای مقرون‌به‌صرفه و مدیریت منابع

#### کیفیت مستندات
- **نمونه‌های کد دقیق**: نمونه‌های کد کاربردی و تست شده
- **دستورالعمل‌های گام‌به‌گام**: راهنمایی شفاف و قابل اجرا
- **مدیریت خطا جامع**: عیب‌یابی برای مسائل رایج
- **ادغام بهترین شیوه‌ها**: استانداردها و توصیه‌های صنعتی
- **سازگاری نسخه‌ها**: به‌روز با جدیدترین خدمات Azure و ویژگی‌های azd

## بهبودهای برنامه‌ریزی شده آینده

### نسخه ۳.۱.۰ (برنامه‌ریزی شده)
#### توسعه پلتفرم هوش مصنوعی
- **پشتیبانی چندمدلی**: الگوهای ادغام برای Hugging Face، Azure Machine Learning و مدل‌های سفارشی
- **چارچوب‌های عامل هوش مصنوعی**: قالب‌هایی برای استقرار LangChain، Semantic Kernel و AutoGen
- **الگوهای پیشرفته RAG**: گزینه‌های پایگاه داده برداری فراتر از Azure AI Search (مانند Pinecone، Weaviate و غیره)
- **نظارت‌پذیری هوش مصنوعی**: نظارت تقویت‌شده بر عملکرد مدل، مصرف توکن و کیفیت پاسخ‌ها

#### تجربه توسعه‌دهنده
- **افزونه VS Code**: تجربه یکپارچه توسعه AZD + Microsoft Foundry
- **ادغام GitHub Copilot**: تولید قالب AZD با کمک هوش مصنوعی
- **آموزش‌های تعاملی**: تمرین‌های کدنویسی عملی با اعتبارسنجی خودکار برای سناریوهای هوش مصنوعی
- **محتوای ویدئویی**: آموزش‌های ویدئویی مکمل برای یادگیرندگان بصری با تمرکز بر استقرار هوش مصنوعی

### نسخه ۴.۰.۰ (برنامه‌ریزی شده)
#### الگوهای هوش مصنوعی سازمانی
- **چارچوب حاکمیت**: حاکمیت مدل‌های هوش مصنوعی، رعایت قوانین و ردیابی ممیزی
- **هوش مصنوعی چندمستأجری**: الگوهایی برای ارائه خدمات هوش مصنوعی مجزا به چندین مشتری
- **استقرار هوش مصنوعی در لبه**: ادغام با Azure IoT Edge و نمونه‌های کانتینری
- **هوش مصنوعی ابری ترکیبی**: الگوهای استقرار چندابری و ترکیبی برای بارهای هوش مصنوعی

#### ویژگی‌های پیشرفته
- **اتوماسیون خط لوله هوش مصنوعی**: ادغام MLOps با خطوط لوله Azure Machine Learning
- **امنیت پیشرفته**: الگوهای اعتماد صفر، نقاط پایانی خصوصی و حفاظت پیشرفته تهدیدات
- **بهینه‌سازی عملکرد**: تنظیم و مقیاس‌پذیری پیشرفته برای برنامه‌های هوش مصنوعی پرتوان
- **توزیع جهانی**: الگوهای تحویل محتوا و کشینگ لبه برای برنامه‌های هوش مصنوعی

### نسخه ۳.۰.۰ (برنامه‌ریزی شده) - جایگزین شده توسط نسخه فعلی
#### افزوده‌های پیشنهادی - اکنون در v3.0.0 اجرایی شده‌اند
- ✅ **محتوای متمرکز هوش مصنوعی**: ادغام کامل Microsoft Foundry (تکمیل شده)
- ✅ **آموزش‌های تعاملی**: کارگاه عملی هوش مصنوعی (تکمیل شده)
- ✅ **ماژول امنیت پیشرفته**: الگوهای امنیتی اختصاصی هوش مصنوعی (تکمیل شده)
- ✅ **بهینه‌سازی عملکرد**: استراتژی‌های تنظیم بار کاری هوش مصنوعی (تکمیل شده)

### نسخه ۲.۱.۰ (برنامه‌ریزی شده) - بخشی در v3.0.0 اجرا شده
#### بهبود‌های جزئی - برخی در نسخه فعلی انجام شده
- ✅ **نمونه‌های اضافی**: سناریوهای استقرار متمرکز بر هوش مصنوعی (تکمیل شده)
- ✅ **سوالات متداول توسعه یافته**: سوالات و عیب‌یابی اختصاصی هوش مصنوعی (تکمیل شده)
- **ادغام ابزار**: راهنماهای ادغام بهتر IDE و ویرایشگر
- ✅ **گسترش نظارت**: الگوهای نظارت و هشدار اختصاصی هوش مصنوعی (تکمیل شده)

#### هنوز برای نسخه آینده برنامه‌ریزی شده
- **مستندات موبایل‌پسند**: طراحی واکنش‌گرا برای یادگیری موبایل
- **دسترسی آفلاین**: بسته‌های مستندات قابل دانلود
- **ادغام پیشرفته IDE**: افزونه VS Code برای AZD + جریان کاری هوش مصنوعی
- **داشبورد جامعه**: شاخص‌های بلادرنگ جامعه و ردیابی مشارکت

## مشارکت در تغییرات

### گزارش تغییرات
هنگام مشارکت در این مخزن، لطفاً موارد تغییرات شامل موارد زیر باشند:

1. **شماره نسخه**: پیروی از نسخه‌بندی معنایی (اصلی.فرعی.رفع‌اشکال)
2. **تاریخ**: تاریخ انتشار یا به‌روزرسانی به فرمت YYYY-MM-DD
3. **دسته‌بندی**: افزوده شده، تغییر یافته، منسوخ، حذف شده، اصلاح شده، امنیت
4. **شرح واضح**: توضیح موجز از تغییرات انجام شده
5. **ارزیابی تأثیر**: چگونه تغییرات کاربران موجود را تحت تأثیر قرار می‌دهد

### دسته‌بندی تغییرات

#### افزوده شده
- ویژگی‌ها، بخش‌های مستندات یا قابلیت‌های جدید
- نمونه‌ها، قالب‌ها یا منابع یادگیری جدید
- ابزارها، اسکریپت‌ها یا امکانات اضافی

#### تغییر یافته
- تغییرات در عملکرد یا مستندات موجود
- به‌روزرسانی‌ها برای وضوح یا دقت بهتر
- بازسازی ساختار محتوا یا سازماندهی

#### منسوخ شده
- ویژگی‌ها یا روش‌هایی که در حال حذف هستند
- بخش‌های مستنداتی که برای حذف برنامه‌ریزی شده‌اند
- روش‌هایی که جایگزین‌های بهتری دارند

#### حذف شده
- ویژگی‌ها، مستندات یا نمونه‌هایی که دیگر مرتبط نیستند
- اطلاعات منسوخ یا روش‌های حذف شده
- محتوای تکراری یا یکپارچه شده

#### اصلاح شده
- اصلاحات خطاها در مستندات یا کد
- رفع مشکلات یا خطابه‌های گزارش شده
- بهبود دقت یا عملکرد

#### امنیتی
- بهبودها یا اصلاحات مرتبط با امنیت
- به‌روزرسانی بهترین شیوه‌های امنیتی
- رفع آسیب‌پذیری‌های امنیتی

### دستورالعمل‌های نسخه‌بندی معنایی

#### نسخه اصلی (X.0.0)
- تغییرات شکسته‌کننده که نیاز به اقدام کاربر دارند
- بازسازی‌های قابل توجه در محتوا یا سازماندهی
- تغییراتی که رویکرد یا روش بنیادی را تغییر می‌دهند

#### نسخه جزئی (X.Y.0)
- ویژگی‌ها یا افزودنی‌های جدید محتوا
- بهبودهایی که سازگاری با نسخه‌های قبلی را حفظ می‌کنند
- مثال‌ها، ابزارها، یا منابع اضافی

#### نسخه وصله (X.Y.Z)
- رفع اشکال و اصلاحات
- بهبودهای جزئی در محتوای موجود
- توضیحات و بهبودهای کوچک

## بازخورد و پیشنهادات جامعه

ما به‌طور فعال بازخورد جامعه را برای بهبود این منبع یادگیری تشویق می‌کنیم:

### چگونه بازخورد ارائه دهیم
- **مسائل گیت‌هاب**: گزارش مشکلات یا پیشنهاد بهبودها (مسائل خاص هوش مصنوعی خوش‌آمدید)
- **بحث‌های دیسکورد**: به اشتراک گذاشتن ایده‌ها و تعامل با جامعه Microsoft Foundry
- **درخواست‌های Pull**: مشارکت در بهبود مستقیم محتوا، به خصوص قالب‌ها و راهنماهای AI
- **دیسکورد Microsoft Foundry**: مشارکت در کانال #Azure برای بحث‌های AZD + AI
- **انجمن‌های جامعه**: مشارکت در بحث‌های گسترده‌تر توسعه‌دهندگان Azure

### دسته‌بندی‌های بازخورد
- **دقت محتوای AI**: اصلاحات اطلاعات یکپارچه‌سازی و استقرار سرویس‌های AI
- **تجربه یادگیری**: پیشنهادهای بهبود جریان یادگیری توسعه‌دهندگان AI
- **محتوای AI مفقود**: درخواست برای قالب‌ها، الگوها یا مثال‌های بیشتر AI
- **دسترس‌پذیری**: بهبودها برای نیازهای یادگیری متنوع
- **یکپارچه‌سازی ابزار AI**: پیشنهادها برای بهبود جریان توسعه AI
- **الگوهای استقرار AI در تولید**: درخواست الگوهای استقرار سازمانی AI

### تعهد پاسخگویی
- **پاسخ به مسائل**: در مدت ۴۸ ساعت برای مشکلات گزارش شده
- **درخواست ویژگی‌ها**: ارزیابی در مدت یک هفته
- **مشارکت‌های جامعه**: بازبینی در طی یک هفته
- **مسائل امنیتی**: اولویت فوری با پاسخ سریع

## برنامه نگهداری

### به‌روزرسانی‌های منظم
- **مرورهای ماهانه**: دقت محتوا و اعتبارسنجی لینک‌ها
- **به‌روزرسانی‌های فصلی**: افزودنی‌ها و بهبودهای بزرگ محتوا
- **بازبینی‌های نیم‌سالی**: بازسازی و تقویت جامع
- **انتشارهای سالانه**: به‌روزرسانی‌های نسخه اصلی با بهبودهای قابل توجه

### نظارت و تضمین کیفیت
- **آزمایش خودکار**: اعتبارسنجی منظم نمونه کدها و لینک‌ها
- **ادغام بازخورد جامعه**: به‌کارگیری منظم پیشنهادات کاربران
- **به‌روزرسانی‌های فناوری**: هماهنگی با آخرین سرویس‌های Azure و نسخه‌های azd
- **بازرسی‌های دسترس‌پذیری**: مرور منظم برای اصول طراحی فراگیر

## سیاست پشتیبانی نسخه‌ها

### پشتیبانی نسخه جاری
- **جدیدترین نسخه اصلی**: پشتیبانی کامل با به‌روزرسانی‌های منظم
- **نسخه اصلی قبلی**: به‌روزرسانی‌های امنیتی و اصلاحات حیاتی تا ۱۲ ماه
- **نسخه‌های قدیمی**: تنها پشتیبانی جامعه، بدون به‌روزرسانی رسمی

### راهنمای مهاجرت
هنگام انتشار نسخه‌های اصلی، ما ارائه می‌دهیم:
- **راهنمای مهاجرت**: دستورالعمل‌های گام‌به‌گام انتقال
- **یادداشت‌های سازگاری**: جزئیات در مورد تغییرات شکسته‌کننده
- **پشتیبانی ابزار**: اسکریپت‌ها یا ابزارهای کمکی برای مهاجرت
- **پشتیبانی جامعه**: انجمن‌های اختصاصی برای سوالات مهاجرت

---

**مسیر‌یابی**
- **درس قبلی**: [راهنمای مطالعه](resources/study-guide.md)
- **درس بعدی**: بازگشت به [README اصلی](README.md)

**به‌روز بمانید**: این مخزن را برای دریافت اعلان‌های انتشارهای جدید و به‌روزرسانی‌های مهم مطالب آموزشی دنبال کنید.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->