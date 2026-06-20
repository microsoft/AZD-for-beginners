# تغییرات - AZD برای مبتدیان

## معرفی

این تغییرات تمام تغییرات قابل توجه، به‌روزرسانی‌ها و بهبودها را در مخزن AZD برای مبتدیان مستند می‌کند. ما از اصول نسخه‌بندی معنایی پیروی می‌کنیم و این گزارش تغییرات را نگه می‌داریم تا به کاربران کمک کنیم تفاوت‌های بین نسخه‌ها را درک کنند.

## اهداف یادگیری

با مرور این گزارش تغییرات، شما:
- درباره ویژگی‌ها و افزودنی‌های جدید مطلع بمانید
- بهبودهای انجام‌شده در مستندات موجود را درک کنید
- رفع اشکال و اصلاحات را دنبال کنید تا دقت تضمین شود
- تکامل محتوای آموزشی را در طول زمان دنبال کنید

## دستاوردهای آموزشی

پس از مرور موارد گزارش تغییرات، شما قادر خواهید بود:
- محتوای جدید و منابع در دسترس برای یادگیری را شناسایی کنید
- درک کنید کدام بخش‌ها به‌روزرسانی یا بهبود یافته‌اند
- مسیر یادگیری خود را بر اساس جدیدترین مواد برنامه‌ریزی کنید
- بازخورد و پیشنهاداتی برای بهبودهای آینده ارائه دهید

## تاریخچه نسخه‌ها

### [v3.22.0] - 2026-06-16

#### پُرکردن شکاف مبتدی #2: نویسندگی الگو، Dev Containers، Pulumi، Azure DevOps، Service Principals و بیشتر
**این نسخه شکاف‌های میانی باقی‌مانده را که تحلیل azd-coverage نشان داده بود می‌بندد: چگونگی نویسندگی و انتشار الگوی خود، محیط‌های قابل بازتولید Dev Container/Codespaces، تأمین‌کننده زیرساخت Pulumi، راهنمای CI/CD در Azure DevOps، احراز هویت service-principal، راهنمای انتخاب میزبان (AKS/Spring Apps)، توضیحات `azd restore`/`azd package`، مدیریت خطا در هوک‌ها، و شیوه‌های تیمی/محیط‌های مشترک.**

#### افزوده شد
- **🧱 درس جدید فصل 4** `docs/chapter-04-infrastructure/custom-templates.md` — نویسندگی الگوی azd خود: ساختار مورد نیاز (`azure.yaml`, `infra/`, `src/`)، فیلد `metadata.template`، پارامتردهی زیرساخت با نشانه منبع `uniqueString()` و برچسب `azd-env-name`، آزمون محلی با `azd init --template <local-path>`, انتشار در GitHub، و ارسال به گالری Awesome AZD
- **📦 درس جدید فصل 1** `docs/chapter-01-foundation/dev-containers.md` — محیط‌های قابل بازتولید azd با Dev Containers و GitHub Codespaces: یک `.devcontainer/devcontainer.json` حداقلی که از ویژگی رسمی `ghcr.io/azure/azure-dev/azd` استفاده می‌کند، ویژگی‌های اختصاصی زبان، `docker-in-docker` برای میزبان‌های کانتینری، و `azd auth login --use-device-code` برای ورود از راه دور
- **🧩 Pulumi با azd** بخش در `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, ساختار پوشه Pulumi، استک‌ها نگاشت‌شده به محیط‌های azd، خروجی‌های/برچسب‌گذاری مورد نیاز، و همان جریان کاری `azd up` / `azd down`
- **🎯 راهنمای انتخاب میزبان** در `docs/chapter-04-infrastructure/provisioning.md` — مقایسه‌ای مناسب برای مبتدیان بین `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, و `springapp`، با راهنمایی درباره زمان انتخاب AKS یا Azure Spring Apps
- **🛠️ راهنمای CI/CD در Azure DevOps** در `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, اتصال سرویس با federation هویت بار کاری (OIDC)، فایل تولیدشده `azure-dev.yml`, و تنظیم گروه متغیرها
- **🔑 Service Principals (الگو 4)** افزوده‌شده به `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` غیرتعاملی با راز کلاینت در مقابل گواهی‌های فدراسیون/OIDC، زمان استفاده، و ذخیره‌سازی امن مدارک
- **🪝 مدیریت خطا در هوک‌ها** زیرقسمتی در `docs/chapter-04-infrastructure/deployment-guide.md` — کدهای خروج و `set -e`, `continueOnError`, آزمون هوک‌ها به صورت جداگانه با `azd hooks run`, شل‌های سیستم‌عامل‌محور، و `--debug`
- **👥 تیم / محیط‌های اشتراکی** بخش در `docs/chapter-03-configuration/configuration.md` — چه چیزهایی در `.azure/` نگهداری می‌شود، چه چیزهایی را به gitignore بسپارید، محیط‌های هر توسعه‌دهنده، `azd env list`/`select`, و فراهم کردن مقادیر محیط در CI/CD
- **🧰 توضیحات `azd restore` و گسترش‌یافته `azd package`** در `resources/cheat-sheet.md` — بازیابی وابستگی‌ها و ساخت یک اثر قابل استقرار بدون انجام استقرار

#### تغییر کرد
- **🧭 جدول درس‌های فصل 4** به‌روزرسانی شد تا درس جدید "نویسندگی الگوی خود" را شامل شود (درس 3)
- **🧭 جدول درس‌های فصل 1** به‌روزرسانی شد تا درس جدید "Dev Containers & Codespaces" را شامل شود (درس 5); فوترهای ناوبری بین `bring-your-own-app.md` و `dev-containers.md` متصل شدند

### [v3.21.0] - 2026-06-16

#### پرکردن شکاف مبتدی: درس چندعامل عملی، "Bring Your Own App"، Terraform و راهنمای CI/CD
**این نسخه بزرگ‌ترین شکاف‌ها برای یک راهنمای کامل مبتدیان را می‌بندد با افزودن دو درس عملی جدید (یک راهنمای چندعامل قابل استقرار و افزودن azd به یک برنامه موجود)، یک معرفی مناسب برای hooks برای مبتدیان، بخشی درباره Terraform با azd، یک راهنمای گام‌به‌گام برای pipeline در GitHub Actions، توضیحی برای اکستنشن‌های پیش‌نمایش جدید، و یک چک‌لیست صریح برای اعتبارسنجی استقرار.**

#### افزوده شد
- **🤝 درس جدید فصل 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — یک راهنمای کاملاً عملی و قابل استقرار برای دو عامل (orchestrator + specialists) با استفاده از یک الگوی واقعی (`contoso-creative-writer`)، پوشش مواردی مانند زمان استفاده از چندعامل، جریان کاری `azd up`, درک منابع مستقرشده، tracing بین‌عامل‌ها، سفارشی‌سازی، و پاک‌سازی
- **📦 درس جدید فصل 1** `docs/chapter-01-foundation/bring-your-own-app.md` — چگونه azd را به یک پروژه موجود اضافه کنید با `azd init` ("use code in the current directory"), درک `azure.yaml` و `infra/`, `azd infra generate`, تشخیص میزبان، و استقرار با `azd up`
- **🌐 Terraform با azd** بخش افزوده‌شده به `docs/chapter-04-infrastructure/provisioning.md` — پیکربندی `infra.provider: terraform`, ساختار پوشه `.tf`, خروجی‌های مورد نیاز `AZURE_*` و برچسب‌گذاری `azd-env-name`, و همان جریان کاری `azd up` / `azd down` (شکاف‌ای که پشتیبانی از Terraform ادعا شده بود اما فقط Bicep نشان داده شده بود را می‌بندد)
- **⚙️ راهنمای گام‌به‌گام GitHub Actions** در `docs/chapter-08-production/production-ai-practices.md` — از مخزن GitHub تا استقرارهای خودکار: `azd pipeline config`, گواهی‌های فدراسیون OIDC (بدون اسرار ذخیره‌شده), فایل تولیدشده `azure-dev.yml`, و راهنمایی درباره رازها در مقابل متغیرها
- **🪝 معرفی مبتدی «با هوک‌ها آشنایی ندارید؟»** در `docs/chapter-04-infrastructure/deployment-guide.md` — هوک چیست، جدول مراحل هوک، یک هوک حداقلی اول، و اجرای دستی هوک‌ها با `azd hooks run`
- **✅ چک‌لیست "تأیید استقرار شما"** افزوده‌شده به گام 5 از `docs/chapter-01-foundation/first-project.md` — تست دود، بررسی نقطه سلامت، و معیارهای موفقیت صریح
- **🧩 توضیح برای اکستنشن‌های پیش‌نمایش جدید** `azure.ai.skills` و `azure.ai.connections` (چه هستند و چه زمانی استفاده شوند) در `docs/chapter-08-production/production-ai-practices.md`

#### تغییر کرد
- **🧭 جدول درس‌های فصل 5** اصلاح شد: `multi-agent-basics.md` اکنون درس 1 است (تنها درس کاملاً عملی)، با برچسب‌گذاری صادقانه که درس 2 در فصل 6 قرار دارد و سناریوی Retail یک نقشه‌معماری است، نه یک الگوی یک‌دستوره
- **🧭 جدول درس‌های فصل 1** اکنون درس جدید "Bring Your Own App" را شامل می‌شود (درس 4)
- **🔗 فوترهای ناوبری** به‌روزرسانی شد: `first-project.md` اکنون به `bring-your-own-app.md` لینک به جلو دارد

#### اصلاح شد
- **🧱 شکاف "ادعا شده اما مفقود" Terraform بسته شد** — دوره قبلاً به پشتیبانی Terraform اشاره کرده بود بدون اینکه آن را نشان دهد
- **🔀 پیوندهای متقابل گمراه‌کننده فصل 5** که القا می‌کردند یک پیاده‌سازی چندعامل کامل وجود دارد وقتی در حقیقت فقط یک نقشه‌معماری بود، اصلاح شدند

#### فایل‌های به‌روزرسانی‌شده
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(new)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(new)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### تجدید AZD 1.25.6، دستورات کامل چرخه حیات عامل و بازبرند Aspire
**این نسخه دوره را مجدداً نسبت به `azd` `1.25.6` (ژوئن 2026) و اکستنشن `azure.ai.agents` `0.1.40-preview` بازاعتبارسنجی می‌کند، راهنمایی‌های AI را از "اسکافلد یک عامل" به چرخه کامل حیات عامل (test → evaluate → optimize → inspect → delete) گسترش می‌دهد، اکستنشن‌های پیش‌نمایش جدید `azure.ai.skills` و `azure.ai.connections` را نشان می‌دهد، و تغییر نام محصول ".NET Aspire" → "Aspire" را ذکر می‌کند.**

#### افزوده شد
- **🔁 پوشش کامل چرخه حیات عامل** برای مبتدیان و مهندسان AI در سراسر مستندات:
  - `docs/chapter-01-foundation/azd-basics.md` — جدول چرخه حیات (scaffold → test → measure → improve → inspect → clean up) به بخش Extensions and AI Commands افزوده شد
  - `docs/chapter-08-production/production-ai-practices.md` — بخش جدید "مدیریت چرخه حیات عامل" که `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, و `delete --force` را پوشش می‌دهد
  - `resources/cheat-sheet.md` — فرمان‌های عامل AI گسترش‌یافته با `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, و `delete --force`
- **🧩 اکستنشن‌های پیش‌نمایش جدید** مستندسازی شدند: `azure.ai.skills` (مهارت‌های قابل استفاده مجدد عامل) و `azure.ai.connections` (اتصالات Foundry) به جدول اکستنشن‌ها و cheat sheet افزوده شدند
- **⏱️ راهنمای زمان‌بندی پاسخ** — مثال‌های `azd ai agent invoke` اکنون اشاره می‌کنند که تأخیر کل و زمان اولین بایت را چاپ می‌کند
- **📌 بنر نسخه** در README ریشه که فراگیران را به `azd version` و `azd upgrade` هدایت می‌کند

#### تغییر کرد
- **✅ مبنای اعتبارسنجی به‌روزرسانی شد** از `azd 1.23.12` (مارس 2026) به `azd 1.25.6` (ژوئن 2026) در همه README فصل‌ها و مستندات کارگاه
- **🤖 یادداشت اکستنشن فصل 2** از `azure.ai.agents` `0.1.18-preview` به `0.1.40-preview` به‌روزرسانی شد
- **🧪 مثال اعتبارسنجی کارگاه** (خروجی `azd version`) به `1.25.6` به‌روزرسانی شد
- **🧭 README "امروز چه خبر در azd"** تجدید شد تا چرخهٔ کامل حیات عامل، اکستنشن‌های AI جدید، و اصلاحات کیفیت زندگی اخیر (`azd init` idempotency, پاک‌سازی توکن‌های قدیمی توسط `azd auth login`, و اعلانیه اولین اجرا برای `azd tool`) را برجسته کند
- **📖 فصل 2 agents.md (گزینه 4)** اکنون فراگیران را به فرمان‌های چرخه حیات پس از استقرار هدایت می‌کند به‌جای توقف در `azd up`

#### اصلاح شد
- **🏷️ نام‌گذاری محصول** — توضیح تغییر برند Aspire افزوده شد (".NET Aspire" اکنون فقط "Aspire" است); پشتیبانی azd از Aspire بدون تغییر باقی مانده است
- **🔎 اعتبارسنجی انتشار زنده** نسبت به خوراک انتشار Azure Developer CLI تأیید شد: CLI پایدار `1.25.6` (2026-06-12) و `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### فایل‌های به‌روزرسانی‌شده
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
#### روشن‌سازی شروع به‌کار برای مبتدیان، اعتبارسنجی تنظیم و پاک‌سازی دستور نهایی AZD
**این نسخه پیگیری بررسی اعتبارسنجی AZD 1.23 را با یک بازنگری مستنداتی متمرکز بر مبتدیان دنبال می‌کند: راهنمایی احراز هویت مبتنی بر AZD را روشن می‌کند، اسکریپت‌های اعتبارسنجی تنظیم محلی را اضافه می‌کند، دستورات کلیدی را در برابر CLI زنده AZD بررسی می‌کند، و آخرین ارجاعات دستور منبع انگلیسی منسوخ‌شده را خارج از changelog حذف می‌کند.**

#### Added
- **🧪 اسکریپت‌های اعتبارسنجی تنظیم برای مبتدیان** با `validate-setup.ps1` و `validate-setup.sh` تا آموزش‌دهندگان بتوانند پیش از شروع فصل 1 ابزارهای موردنیاز را تأیید کنند
- **✅ مراحل اعتبارسنجی تنظیم مقدماتی** در README ریشه و README فصل 1 تا پیش‌نیازهای گم‌شده قبل از `azd up` شناسایی شوند

#### Changed
- **🔐 راهنمایی احراز هویت برای مبتدیان** اکنون به‌طور سازگار `azd auth login` را مسیر اصلی برای جریان‌های کاری AZD می‌داند، و `az login` را اختیاری ذکر می‌کند مگر اینکه مستقیماً از دستورات Azure CLI استفاده شود
- **📚 جریان ورود به فصل 1** اکنون آموزش‌دهندگان را به اعتبارسنجی تنظیم محلی خود قبل از نصب، احراز هویت و مراحل اولین استقرار هدایت می‌کند
- **🛠️ پیام‌رسانی اعتبارسنج** اکنون به‌وضوح نیازمندی‌های مسدودکننده را از هشدارهای اختیاری Azure CLI برای مسیر مبتدیان تنها-AZD جدا می‌کند
- **📖 پیکربندی، عیب‌یابی و مستندات نمونه** اکنون بین احراز هویت الزامی AZD و ورود اختیاری Azure CLI تمایز قائل می‌شوند در حالی که قبلاً هر دو بدون زمینه ارائه شده بودند

#### Fixed
- **📋 ارجاعات باقی‌مانده دستورات منبع انگلیسی** به اشکال جاری AZD به‌روزرسانی شدند، از جمله `azd config show` در cheat sheet و `azd monitor --overview` جایی که راهنمایی نمای کلی Azure Portal مدنظر بوده
- **🧭 ادعاهای مبتدیانه در فصل 1** برای جلوگیری از وعده بیش از حد درباره خطای صفر یا رفتار بازگشتی تضمین‌شده در همه قالب‌ها و منابع Azure تعدیل شدند
- **🔎 اعتبارسنجی CLI زنده** پشتیبانی فعلی برای `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, و `azd down --force --purge` را تأیید کرد

#### Files Updated
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

#### اعتبارسنجی AZD 1.23.12، گسترش محیط کارگاه و به‌روزرسانی مدل هوش مصنوعی
**این نسخه بازبینی مستندات را در برابر `azd` `1.23.12` انجام می‌دهد، مثال‌های دستورات AZD قدیمی را به‌روز می‌کند، راهنمایی مدل هوش مصنوعی را به پیش‌فرض‌های جاری تازه می‌کند، و دستورالعمل‌های کارگاه را فراتر از GitHub Codespaces گسترش می‌دهد تا از dev containerها و کلون‌های محلی نیز پشتیبانی کند.**

#### Added
- **✅ یادداشت‌های اعتبارسنجی در فصول اصلی و مستندات کارگاه** تا پایه تست شده AZD را برای یادگیرندگانی که از نسخه‌های CLI جدیدتر یا قدیمی‌تر استفاده می‌کنند صریح کند
- **⏱️ راهنمایی زمان‌تایم‌اوت استقرار** برای استقرارهای برنامه‌های هوش مصنوعی بلندمدت با استفاده از `azd deploy --timeout 1800`
- **🔎 گام‌های بازرسی افزونه** با `azd extension show azure.ai.agents` در مستندات روند کاری AI
- **🌐 راهنمایی محیط کارگاه گسترده‌تر** که GitHub Codespaces، dev containerها و کلون‌های محلی با MkDocs را پوشش می‌دهد

#### Changed
- **📚 READMEهای مقدمه فصل** اکنون به‌طور سازگار اعتبارسنجی در برابر `azd 1.23.12` را در بنیاد، پیکربندی، زیرساخت، چندعامل، پیش‌استقرار، عیب‌یابی و بخش‌های تولید یادآور می‌شوند
- **🛠️ ارجاعات دستورات AZD** در سراسر مستندات به اشکال جاری به‌روز شدند:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` یا `azd env get-value(s)` بسته به زمینه
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` جایی که نمای کلی Application Insights مدنظر است
- **🧪 مثال‌های پیش‌نمایش Provision** ساده‌سازی شدند تا با استفاده پشتیبانی‌شده فعلی مانند `azd provision --preview` و `azd provision --preview -e production` هماهنگ شوند
- **🧭 جریان کارگاه** به‌روزرسانی شد تا یادگیرندگان بتوانند آزمایش‌ها را در Codespaces، dev container یا کلون محلی تکمیل کنند به‌جای اینکه اجرای تنها در Codespaces فرض شود
- **🔐 راهنمایی احراز هویت** اکنون `azd auth login` را برای جریان‌های کاری AZD ترجیح می‌دهد، و `az login` را زمانی که دستورات Azure CLI به‌طور مستقیم استفاده می‌شوند اختیاری معرفی می‌کند

#### Fixed
- **🪟 دستورات نصب ویندوز** در راهنمای نصب به نوشتار کنونی `winget` نرمال شدند
- **🐧 راهنمایی نصب لینوکس** اصلاح شد تا از دستورالعمل‌های توزیع-محور غیرپشتیبانی‌شده برای بسته‌بندی `azd` اجتناب شود و در صورت لزوم به دارایی‌های release اشاره کند
- **📦 مثال‌های مدل AI** از پیش‌فرض‌های قدیمی مانند `gpt-35-turbo` و `text-embedding-ada-002` به مثال‌های جاری مانند `gpt-4.1-mini`, `gpt-4.1`, و `text-embedding-3-large` تازه شدند
- **📋 قطعه‌های استقرار و تشخیص خطا** برای استفاده از دستورات محیط و وضعیت جاری در لاگ‌ها، اسکریپت‌ها و مراحل عیب‌یابی اصلاح شدند
- **⚙️ دستورالعمل GitHub Actions** از `Azure/setup-azd@v1.0.0` به `Azure/setup-azd@v2` به‌روزرسانی شد
- **🤖 راهنمایی رضایت MCP/Copilot** از `azd mcp consent` به `azd copilot consent list` به‌روزرسانی شد

#### Improved
- **🧠 راهنمایی فصل AI** اکنون رفتار حساس به پیش‌نمایش `azd ai`، ورود مربوط به tenant، استفاده جاری افزونه‌ها، و توصیه‌های به‌روزرسانی برای استقرار مدل را بهتر توضیح می‌دهد
- **🧪 دستورالعمل‌های کارگاه** اکنون از مثال‌های نسخه واقع‌بینانه‌تر و زبان تنظیم محیط واضح‌تر برای آزمایش‌های عملی استفاده می‌کنند
- **📈 مستندات تولید و عیب‌یابی** اکنون با نظارت جاری، مدل پشتیبان و مثال‌های سطح هزینه بهتر هماهنگ هستند

#### Files Updated
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

#### دستورات AZD AI CLI، اعتبارسنجی محتوا و گسترش قالب‌ها
**این نسخه پوشش `azd ai`, `azd extension`, و `azd mcp` را در همه فصل‌های مرتبط با AI اضافه می‌کند، لینک‌های شکسته و کد منسوخ در agents.md را رفع می‌کند، cheat sheet را به‌روز می‌سازد، و بخش قالب‌های نمونه را با توضیحات اعتبارسنجی‌شده و قالب‌های جدید Azure AI AZD بازسازی می‌کند.**

#### Added
- **🤖 پوشش AZD AI CLI** در 7 فایل (قبلاً فقط در فصل 8):
  - `docs/chapter-01-foundation/azd-basics.md` — بخش جدید «Extensions and AI Commands» که `azd extension`, `azd ai agent init`, و `azd mcp` را معرفی می‌کند
  - `docs/chapter-02-ai-development/agents.md` — گزینه 4: `azd ai agent init` با جدول مقایسه (رویکرد قالب در برابر مانیفست)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — زیربخش‌های «AZD Extensions for Foundry» و «Agent-First Deployment»
  - `docs/chapter-05-multi-agent/README.md` — Quick Start اکنون مسیرهای استقرار مبتنی بر قالب و مبتنی بر مانیفست را نشان می‌دهد
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — بخش استقرار اکنون گزینه `azd ai agent init` را شامل می‌شود
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — زیربخش «دستورات افزونه AZD AI برای تشخیص» را اضافه می‌کند
  - `resources/cheat-sheet.md` — بخش جدید «دستورات AI و افزونه‌ها» با `azd extension`, `azd ai agent init`, `azd mcp`, و `azd infra generate`
- **📦 قالب‌های نمونه جدید AZD AI** در `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — چت RAG .NET با Blazor WebAssembly، Semantic Kernel، و پشتیبانی چت صوتی
  - **azure-search-openai-demo-java** — چت RAG جاوا با استفاده از Langchain4J با گزینه‌های استقرار ACA/AKS
  - **contoso-creative-writer** — اپ چندعامل نویسندگی خلاق با استفاده از Azure AI Agent Service، Bing Grounding، و Prompty
  - **serverless-chat-langchainjs** — RAG بدون‌سرور با استفاده از Azure Functions + LangChain.js + Cosmos DB با پشتیبانی توسعه محلی Ollama
  - **chat-with-your-data-solution-accelerator** — شتاب‌دهنده RAG سازمانی با پورتال ادمین، یکپارچه‌سازی Teams، و گزینه‌های PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — اپ مرجع ارکستراسیون چندعامل MCP با سرورها در .NET، Python، Java، و TypeScript
  - **azd-ai-starter** — قالب شروع‌کننده حداقلی زیرساخت Azure AI با Bicep
  - **🔗 لینک گالری عالی AZD AI** — مرجع به [awesome-azd گالری AI](https://azure.github.io/awesome-azd/?tags=ai) (بیش از 80 قالب)

#### Fixed
- **🔗 ناوبری agents.md**: لینک‌های Previous/Next اکنون با ترتیب درس README فصل 2 مطابقت دارند (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 لینک‌های شکسته agents.md**: `production-ai-practices.md` به `../chapter-08-production/production-ai-practices.md` اصلاح شد (3 مورد)
- **📦 کد منسوخ در agents.md**: `opencensus` با `azure-monitor-opentelemetry` + OpenTelemetry SDK جایگزین شد
- **🐛 API نامعتبر agents.md**: `max_tokens` از `create_agent()` به `create_run()` به‌عنوان `max_completion_tokens` منتقل شد
- **🔢 شمارش توکن در agents.md**: تقریب ناخشنود `len//4` با `tiktoken.encoding_for_model()` جایگزین شد
- **azure-search-openai-demo**: سرویس‌ها از "Cognitive Search + App Service" به "Azure AI Search + Azure Container Apps" اصلاح شدند (میزبان پیش‌فرض اکتبر 2024 تغییر کرد)
- **contoso-chat**: توضیحات برای اشاره به Azure AI Foundry + Prompty به‌روز شد تا با عنوان و تکنولوژی واقعی مخزن مطابقت کند

#### Removed
- **ai-document-processing**: ارجاع قالب غیرعملی حذف شد (مخزن به‌صورت عمومی به‌عنوان یک قالب AZD قابل‌دسترسی نیست)

#### Improved
- **📝 تمرین‌های agents.md**: تمرین 1 اکنون خروجی موردانتظار و مرحله `azd monitor` را نشان می‌دهد؛ تمرین 2 شامل کد کامل ثبت `FunctionTool` است؛ تمرین 3 راهنمایی مبهم را با دستورات مشخص `prepdocs.py` جایگزین می‌کند
- **📚 منابع agents.md**: لینک‌های مستنداتی به اسناد جاری Azure AI Agent Service و quickstart به‌روزرسانی شدند
- **📋 جدول گام‌های بعدی agents.md**: لینک کارگاه AI را برای پوشش کامل فصل اضافه کرد

#### Files Updated
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
**این نسخه ناوبری فصل‌های README.md را با یک قالب جدول بهبود یافته ارتقاء می‌دهد.**

#### تغییرات
- **Course Map Table**: با لینک‌های مستقیم به درس‌ها، برآورد مدت‌زمان و رتبه‌بندی پیچیدگی بهبود یافت
- **Folder Cleanup**: حذف پوشه‌های قدیمی و تکراری (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: همهٔ 21+ لینک داخلی در جدول Course Map بررسی شد

### [v3.16.0] - 2026-02-05

#### به‌روزرسانی نام محصول
**این نسخه مراجع محصول را با نام‌گذاری جاری مایکروسافت به‌روز می‌کند.**

#### تغییرات
- **Microsoft Foundry → Microsoft Foundry**: همهٔ ارجاعات در فایل‌های غیرترجمه به‌روز شدند
- **Azure AI Agent Service → Foundry Agents**: نام سرویس برای انطباق با برند فعلی به‌روز شد

#### فایل‌های به‌روزرسانی‌شده
- `README.md` - صفحهٔ فرود اصلی دوره
- `changelog.md` - تاریخچهٔ نسخه‌ها
- `course-outline.md` - ساختار دوره
- `docs/chapter-02-ai-development/agents.md` - راهنمای عوامل هوش مصنوعی
- `examples/README.md` - مستندسازی مثال‌ها
- `workshop/README.md` - صفحهٔ فرود کارگاه
- `workshop/docs/index.md` - نمایهٔ کارگاه
- `workshop/docs/instructions/*.md` - همهٔ فایل‌های دستورالعمل کارگاه

---

### [v3.15.0] - 2026-02-05

#### بازساخت عمدهٔ مخزن: نام‌گذاری پوشه‌ها بر اساس فصل
**این نسخه مستندات را به پوشه‌های فصل‌محور و ویژه تقسیم می‌کند تا ناوبری روشن‌تری فراهم شود.**

#### تغییر نام پوشه‌ها
پوشه‌های قدیمی با پوشه‌های شماره‌گذاری‌شدهٔ فصل جایگزین شدند:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- اضافه‌شده: `docs/chapter-05-multi-agent/`

#### مهاجرت فایل‌ها
| File | From | To |
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

#### افزوده‌شده
- **📚 فایل‌های README فصل**: در هر پوشهٔ فصل فایل README.md ایجاد شد که شامل:
  - اهداف یادگیری و مدت‌زمان
  - جدول درس‌ها با توضیحات
  - دستورات شروع سریع
  - ناوبری به فصل‌های دیگر

#### تغییرات
- **🔗 بروزرسانی همهٔ لینک‌های داخلی**: بیش از 78 مسیر در تمام فایل‌های مستندات به‌روز شد
- **🗺️ README.md اصلی**: نقشهٔ دوره با ساختار فصل جدید به‌روزرسانی شد
- **📝 examples/README.md**: ارجاعات متقابل به پوشه‌های فصل به‌روزرسانی شد

#### حذف‌شده
- ساختار پوشهٔ قدیمی (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### بازساخت مخزن: ناوبری فصل‌ها
**این نسخه فایل‌های README ناوبری فصل را اضافه کرد (بعداً توسط v3.15.0 جایگزین شد).**

---

### [v3.13.0] - 2026-02-05

#### راهنمای جدید عوامل هوش مصنوعی
**این نسخه یک راهنمای جامع برای استقرار عوامل هوش مصنوعی با Azure Developer CLI اضافه می‌کند.**

#### افزوده‌شده
- **🤖 docs/microsoft-foundry/agents.md**: راهنمای کامل شامل:
  - عوامل هوش مصنوعی چه هستند و چگونه با چت‌بات‌ها تفاوت دارند
  - سه قالب راه‌اندازی سریع عامل (Foundry Agents, Prompty, RAG)
  - الگوهای معماری عامل (عامل تکی، RAG، چندعاملی)
  - پیکربندی ابزار و سفارشی‌سازی
  - پایش و ردیابی معیارها
  - ملاحظات هزینه و بهینه‌سازی
  - سناریوهای متداول رفع اشکال
  - سه تمرین عملی با معیارهای موفقیت

#### ساختار محتوا
- **مقدمه**: مفاهیم عامل برای مبتدیان
- **شروع سریع**: استقرار عوامل با `azd init --template get-started-with-ai-agents`
- **الگوهای معماری**: نمودارهای تصویری الگوهای عامل
- **پیکربندی**: تنظیم ابزار و متغیرهای محیطی
- **پایش**: یکپارچه‌سازی Application Insights
- **تمرین‌ها**: یادگیری عملی پیش‌رونده (هر کدام 20-45 دقیقه)

---

### [v3.12.0] - 2026-02-05

#### به‌روزرسانی محیط DevContainer
**این نسخه پیکربندی کانتینر توسعه را با ابزارهای مدرن و تنظیمات پیش‌فرض بهتر برای تجربهٔ آموزشی AZD به‌روز می‌کند.**

#### تغییرات
- **🐳 Base Image**: به‌روزرسانی از `python:3.12-bullseye` به `python:3.12-bookworm` (آخرین نسخهٔ پایدار Debian)
- **📛 Container Name**: تغییر نام از "Python 3" به "AZD for Beginners" برای شفافیت

#### افزوده‌شده
- **🔧 ویژگی‌های جدید Dev Container**:
  - `azure-cli` با پشتیبانی از Bicep فعال
  - `node:20` (نسخه LTS برای قالب‌های AZD)
  - `github-cli` برای مدیریت قالب‌ها
  - `docker-in-docker` برای استقرار برنامه‌های کانتینری

- **🔌 فوروارد پورت‌ها**: پورت‌های پیش‌پیکربندی‌شده برای توسعهٔ معمول:
  - 8000 (پیش‌نمایش MkDocs)
  - 3000 (وب‌اپ‌ها)
  - 5000 (Python Flask)
  - 8080 (APIها)

- **🧩 افزونه‌های جدید VS Code**:
  - `ms-python.vscode-pylance` - بهبود IntelliSense برای Python
  - `ms-azuretools.vscode-azurefunctions` - پشتیبانی از Azure Functions
  - `ms-azuretools.vscode-docker` - پشتیبانی از Docker
  - `ms-azuretools.vscode-bicep` - پشتیبانی از زبان Bicep
  - `ms-azure-devtools.azure-resource-groups` - مدیریت منابع Azure
  - `yzhang.markdown-all-in-one` - ویرایش Markdown
  - `DavidAnson.vscode-markdownlint` - بررسی قواعد Markdown
  - `bierner.markdown-mermaid` - پشتیبانی از نمودارهای Mermaid
  - `redhat.vscode-yaml` - پشتیبانی از YAML (برای azure.yaml)
  - `eamodio.gitlens` - مشاهدهٔ تصویری گیت
  - `mhutchie.git-graph` - تاریخچهٔ گیت

- **⚙️ تنظیمات VS Code**: تنظیمات پیش‌فرض برای مفسر Python، فرمت هنگام ذخیره، و حذف فاصله‌های اضافی اضافه شد

- **📦 به‌روزرسانی requirements-dev.txt**:
  - افزودن افزونهٔ Minify برای MkDocs
  - افزودن pre-commit برای کیفیت کد
  - افزودن بسته‌های Azure SDK (azure-identity, azure-mgmt-resource)

#### اصلاح شد
- **دستور Post-Create**: اکنون هنگام شروع کانتینر نصب AZD و Azure CLI را بررسی می‌کند

---

### [v3.11.0] - 2026-02-05

#### بازنگری README مناسب مبتدیان
**این نسخه README.md را به‌طور قابل‌توجهی برای مبتدیان قابل‌فهم‌تر می‌کند و منابع اساسی برای توسعه‌دهندگان هوش مصنوعی اضافه می‌کند.**

#### افزوده‌شده
- **🆚 مقایسه Azure CLI و AZD**: توضیح واضح اینکه چه زمانی از هر ابزار استفاده شود همراه با مثال‌های کاربردی
- **🌟 پیوندهای عالی AZD**: لینک‌های مستقیم به گالری قالب‌های جامعه و منابع مشارکت:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - بیش از 200 قالب آمادهٔ استقرار
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - مشارکت جامعه
- **🎯 راهنمای شروع سریع**: بخش شروع ساده‌شده در 3 گام (نصب → ورود → استقرار)
- **📊 جدول ناوبری مبتنی بر تجربه**: راهنمایی واضح دربارهٔ نقطهٔ شروع بر اساس تجربهٔ توسعه‌دهنده

#### تغییرات
- **ساختار README**: بازسازماندهی برای افشای تدریجی - اطلاعات کلیدی در ابتدا
- **بخش معرفی**: بازنویسی برای توضیح "جادوی `azd up`" برای کاملاً مبتدیان
- **حذف محتوای تکراری**: حذف بخش رفع اشکال تکراری
- **دستورات رفع اشکال**: اصلاح ارجاع `azd logs` برای استفاده از `azd monitor --logs`

#### اصلاح شد
- **🔐 دستورات احراز هویت**: افزودن `azd auth login` و `azd auth logout` به cheat-sheet.md
- **ارجاعات دستور نامعتبر**: حذف باقی‌ماندهٔ `azd logs` از بخش رفع اشکال در README

#### نکات
- **دامنه**: تغییرات بر README اصلی و resources/cheat-sheet.md اعمال شد
- **گروه هدف**: بهبودها به‌طور خاص برای توسعه‌دهندگانی که با AZD آشناییشان کم است طراحی شد

---

### [v3.10.0] - 2026-02-05

#### به‌روزرسانی دقت دستورات Azure Developer CLI
**این نسخه دستورات غیرموجود AZD را در سراسر مستندات تصحیح می‌کند تا همهٔ مثال‌های کد از نحو معتبر Azure Developer CLI استفاده کنند.**

#### اصلاح شد
- **🔧 حذف دستورات غیرموجود AZD**: بازبینی جامع و تصحیح دستورهای نامعتبر:
  - `azd logs` (وجود ندارد) → جایگزین با `azd monitor --logs` یا معادل‌های Azure CLI
  - زیر‌دستورات `azd service` (وجود ندارند) → جایگزین با `azd show` و Azure CLI
  - `azd infra import/export/validate` (وجود ندارد) → حذف یا جایگزین با معادل‌های معتبر
  - فلگ‌های `azd deploy --rollback/--incremental/--parallel/--detect-changes` (وجود ندارند) → حذف شدند
  - فلگ‌های `azd provision --what-if/--rollback` (وجود ندارند) → به‌روزرسانی برای استفاده از `--preview`
  - `azd config validate` (وجود ندارد) → جایگزین با `azd config list`
  - `azd info`, `azd history`, `azd metrics` (وجود ندارند) → حذف شدند

- **📚 فایل‌های به‌روزرسانی‌شده با اصلاح دستورات**:
  - `resources/cheat-sheet.md`: بازنگری عمدهٔ مرجع دستورات
  - `docs/deployment/deployment-guide.md`: اصلاح استراتژی‌های بازگردانی و استقرار
  - `docs/troubleshooting/debugging.md`: اصلاح بخش‌های تحلیل لاگ
  - `docs/troubleshooting/common-issues.md`: به‌روزرسانی دستورات رفع اشکال
  - `docs/troubleshooting/ai-troubleshooting.md`: اصلاح بخش دیباگ AZD
  - `docs/getting-started/azd-basics.md`: اصلاح دستورات پایشی
  - `docs/getting-started/first-project.md`: به‌روزرسانی مثال‌های پایش و دیباگ
  - `docs/getting-started/installation.md`: اصلاح مثال‌های کمک و نسخه
  - `docs/pre-deployment/application-insights.md`: اصلاح دستورات مشاهدهٔ لاگ
  - `docs/pre-deployment/coordination-patterns.md`: اصلاح دستورات دیباگ عامل

- **📝 به‌روزرسانی مرجع نسخه**: 
  - `docs/getting-started/installation.md`: تغییر نسخهٔ سخت‌کد شدهٔ `1.5.0` به عمومی `1.x.x` با لینک به صفحهٔ releases

#### تغییرات
- **استراتژی‌های بازگردانی**: مستندات به استفاده از بازگردانی مبتنی بر Git به‌روزرسانی شد (AZD بازگردانی بومی ندارد)
- **مشاهدهٔ لاگ**: ارجاعات `azd logs` با `azd monitor --logs`، `azd monitor --live` و دستورات Azure CLI جایگزین شدند
- **بخش عملکرد**: فلگ‌های استقرار موازی/تدریجی غیرموجود حذف و جایگزین‌های معتبر ارائه شد

#### جزئیات فنی
- **دستورات معتبر AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **فلگ‌های معتبر azd monitor**: `--live`, `--logs`, `--overview`
- **ویژگی‌های حذف‌شده**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### نکات
- **اعتبارسنجی**: دستورات در برابر Azure Developer CLI v1.23.x تایید شدند

---

### [v3.9.0] - 2026-02-05

#### تکمیل کارگاه و بهبود کیفیت مستندات
**این نسخه ماژول‌های تعاملی کارگاه را تکمیل می‌کند، تمام لینک‌های شکستهٔ مستندات را اصلاح می‌کند و کیفیت کلی محتوا را برای توسعه‌دهندگان هوش مصنوعی که از Microsoft AZD استفاده می‌کنند بهبود می‌دهد.**

#### افزوده‌شده
- **📝 CONTRIBUTING.md**: سند راهنمای مشارکت جدید شامل:
  - دستورالعمل‌های واضح برای گزارش مشکلات و پیشنهاد تغییرات
  - استانداردهای مستندسازی برای محتوای جدید
  - دستورالعمل‌های نمونه کد و قراردادهای پیام کامیت
  - اطلاعات مشارکت جامعه

#### تکمیل‌شده
- **🎯 Workshop Module 7 (Wrap-up)**: ماژول جمع‌بندی به‌طور کامل تکمیل شد با:
  - خلاصه‌ای جامع از دستاوردهای کارگاه
  - بخش مفاهیم کلیدی که AZD، قالب‌ها و Microsoft Foundry را پوشش می‌دهد
  - پیشنهاداتی برای ادامه مسیر یادگیری
  - تمرین‌های چالشی کارگاه با سطح دشواری مشخص
  - لینک‌های بازخورد و پشتیبانی جامعه

- **📚 Workshop Module 3 (Deconstruct)**: اهداف یادگیری به‌روزرسانی شد با:
  - راهنمای فعال‌سازی GitHub Copilot با سرورهای MCP
  - درک ساختار پوشه قالب‌های AZD
  - الگوهای سازمان‌دهی زیرساخت به‌عنوان‌کد (Bicep)
  - دستورالعمل‌های آزمایشگاه عملی

- **🔧 Workshop Module 6 (Teardown)**: تکمیل شد با:
  - اهداف پاک‌سازی منابع و مدیریت هزینه
  - استفاده از `azd down` برای حذف ایمن زیرساخت
  - راهنمای بازیابی سرویس‌های شناختی حذف‌شده به‌صورت soft-delete
  - پیشنهادهای اکتشافی اضافی برای GitHub Copilot و Azure Portal

#### اصلاح‌شده
- **🔗 رفع لینک‌های خراب**: بیش از 15 لینک داخلی خراب مستندات رفع شد:
  - `docs/ai-foundry/ai-model-deployment.md`: مسیرها به microsoft-foundry-integration.md اصلاح شد
  - `docs/troubleshooting/ai-troubleshooting.md`: مسیرهای ai-model-deployment.md و production-ai-practices.md تصحیح شد
  - `docs/getting-started/first-project.md`: cicd-integration.md غایب با deployment-guide.md جایگزین شد
  - `examples/retail-scenario.md`: مسیرهای سوالات متداول و راهنمای عیب‌یابی اصلاح شد
  - `examples/container-app/microservices/README.md`: مسیرهای صفحه اصلی دوره و راهنمای استقرار تصحیح شد
  - `resources/faq.md` و `resources/glossary.md`: ارجاعات فصل AI به‌روزرسانی شد
  - `course-outline.md`: ارجاعات راهنمای مدرس و آزمایشگاه کارگاه AI اصلاح شد

- **📅 بنر وضعیت کارگاه**: از "Under Construction" به وضعیت فعال کارگاه با تاریخ February 2026 به‌روزرسانی شد

- **🔗 ناوبری کارگاه**: لینک‌های شکسته ناوبری در README.md کارگاه که به پوشه lab-1-azd-basics غیرموجود اشاره می‌کردند اصلاح شد

#### تغییر یافته
- **ارائه کارگاه**: هشدار "under construction" حذف شد، کارگاه اکنون کامل و آماده استفاده است
- **همگنی ناوبری**: اطمینان از اینکه تمام ماژول‌های کارگاه ناوبری بین‌ماژولی صحیح دارند
- **ارجاعات مسیر یادگیری**: ارجاعات فصل به‌روزرسانی شدند تا از مسیرهای صحیح microsoft-foundry استفاده کنند

#### تأیید شده
- ✅ همه فایل‌های Markdown انگلیسی لینک‌های داخلی معتبری دارند
- ✅ ماژول‌های کارگاه 0-7 با اهداف یادگیری کامل هستند
- ✅ ناوبری بین فصل‌ها و ماژول‌ها به‌درستی کار می‌کند
- ✅ محتوا برای توسعه‌دهندگان هوش مصنوعی که از Microsoft AZD استفاده می‌کنند مناسب است
- ✅ زبان و ساختار مناسب مبتدیان در سراسر محتوا حفظ شده است
- ✅ CONTRIBUTING.md راهنمایی واضحی برای مشارکت‌کنندگان جامعه فراهم می‌کند

#### پیاده‌سازی فنی
- **اعتبارسنجی لینک**: اسکریپت PowerShell خودکار تمام لینک‌های داخلی .md را بررسی کرد
- **حسابرسی محتوا**: بازبینی دستی کامل بودن کارگاه و مناسب‌بودن برای مبتدیان
- **سیستم ناوبری**: الگوهای ناوبری فصل و ماژول هماهنگ اعمال شد

#### نکات
- **دامنه**: تغییرات تنها در مستندات انگلیسی اعمال شد
- **ترجمه‌ها**: پوشه‌های ترجمه در این نسخه به‌روزرسانی نشدند (ترجمه خودکار بعداً همگام‌سازی خواهد شد)
- **مدت زمان کارگاه**: کارگاه کامل اکنون 3-4 ساعت یادگیری عملی ارائه می‌دهد

---

### [v3.8.0] - 2025-11-19

#### مستندسازی پیشرفته: نظارت، امنیت و الگوهای چندعامل
**این نسخه درس‌های جامع درجه A در مورد یکپارچه‌سازی Application Insights، الگوهای احراز هویت و هماهنگی چندعامل برای استقرارهای تولیدی اضافه می‌کند.**

#### اضافه شد
- **📊 درس یکپارچه‌سازی Application Insights**: در `docs/pre-deployment/application-insights.md`:
  - استقرار متمرکز بر AZD با تهیه خودکار
  - قالب‌های Bicep کامل برای Application Insights + Log Analytics
  - برنامه‌های پایتون عملی با تله‌متری سفارشی (بیش از 1,200 خط)
  - الگوهای نظارت AI/LLM (پیگیری توکن/هزینه مدل‌های Microsoft Foundry)
  - 6 نمودار Mermaid (معماری، ردیابی توزیع‌شده، جریان تله‌متری)
  - 3 تمرین عملی (هشدارها، داشبوردها، نظارت AI)
  - مثال‌های Kusto و استراتژی‌های بهینه‌سازی هزینه
  - پخش زنده متریک‌ها و اشکال‌زدایی بلادرنگ
  - زمان یادگیری 40-50 دقیقه با الگوهای آماده تولید

- **🔐 درس الگوهای احراز هویت و امنیت**: در `docs/getting-started/authsecurity.md`:
  - 3 الگوی احراز هویت (connection strings، Key Vault، managed identity)
  - قالب‌های زیرساخت Bicep کامل برای استقرارهای امن
  - کد برنامه Node.js با یکپارچه‌سازی Azure SDK
  - 3 تمرین کامل (فعالسازی managed identity، user-assigned identity، گردش کلید در Key Vault)
  - بهترین شیوه‌های امنیتی و پیکربندی‌های RBAC
  - راهنمای عیب‌یابی و تحلیل هزینه
  - الگوهای احراز هویت بدون رمز عبور آماده تولید

- **🤖 درس الگوهای هماهنگی چندعامل**: در `docs/pre-deployment/coordination-patterns.md`:
  - 5 الگوی هماهنگی (توالی، موازی، سلسله‌مراتبی، رویداد-محور، اجماع)
  - پیاده‌سازی سرویس ارکستراتور کامل (Python/Flask، بیش از 1,500 خط)
  - 3 پیاده‌سازی عامل تخصصی (پژوهش، نویسنده، ویراستار)
  - یکپارچه‌سازی Service Bus برای صف‌بندی پیام
  - مدیریت حالت توزیع‌شده با Cosmos DB
  - 6 نمودار Mermaid نشان‌دهنده تعامل عوامل
  - 3 تمرین پیشرفته (مدیریت تایم‌اوت، منطق تکرار، مدارشکن)
  - شکست هزینه ($240-565/month) با استراتژی‌های بهینه‌سازی
  - یکپارچه‌سازی Application Insights برای نظارت

#### بهبود یافته
- **فصل پیش‌استقرار**: اکنون شامل نظارت جامع و الگوهای هماهنگی است
- **فصل شروع کار**: با الگوهای احراز هویت حرفه‌ای تقویت شد
- **آمادگی تولید**: پوشش کامل از امنیت تا قابل مشاهده بودن
- **طرح درس**: به‌روزرسانی برای ارجاع به درس‌های جدید در فصول 3 و 6

#### تغییر یافته
- **پیشرفت یادگیری**: ادغام بهتر امنیت و نظارت در سراسر دوره
- **کیفیت مستندات**: استانداردهای سطح A (95-97%) در درس‌های جدید حفظ شد
- **الگوهای تولید**: پوشش انتها-به-انتهای کامل برای استقرارهای سازمانی

#### بهبود یافته
- **تجربه توسعه‌دهنده**: مسیر واضح از توسعه تا نظارت تولید
- **استانداردهای امنیتی**: الگوهای حرفه‌ای برای احراز هویت و مدیریت اسرار
- **قابلیت مشاهده**: یکپارچه‌سازی کامل Application Insights با AZD
- **بارهای کاری AI**: نظارت تخصصی برای مدل‌های Microsoft Foundry و سیستم‌های چندعامل

#### تأیید شده
- ✅ همه درس‌ها شامل کد عملی کامل هستند (نه قطعه‌های جداگانه)
- ✅ نمودارهای Mermaid برای یادگیری بصری (جمعاً 19 نمودار در 3 درس)
- ✅ تمرین‌های عملی با مراحل تأیید (جمعاً 9 تمرین)
- ✅ قالب‌های Bicep آماده تولید که از طریق `azd up` قابل استقرارند
- ✅ تحلیل هزینه و استراتژی‌های بهینه‌سازی
- ✅ راهنماهای عیب‌یابی و بهترین شیوه‌ها
- ✅ نقاط بررسی دانش با دستورات تأیید

#### نتایج نمره‌دهی مستندات
- **docs/pre-deployment/application-insights.md**: - راهنمای جامع نظارت
- **docs/getting-started/authsecurity.md**: - الگوهای امنیتی حرفه‌ای
- **docs/pre-deployment/coordination-patterns.md**: - معماری‌های پیشرفته چندعامل
- **محتوای جدید کلی**: - استانداردهای کیفیت بالا و منسجم

#### پیاده‌سازی فنی
- **Application Insights**: Log Analytics + تله‌متری سفارشی + ردیابی توزیع‌شده
- **احراز هویت**: Managed Identity + Key Vault + الگوهای RBAC
- **چندعامل**: Service Bus + Cosmos DB + Container Apps + ارکستراسیون
- **نظارت**: متریک‌های زنده + کوئری‌های Kusto + هشدارها + داشبوردها
- **مدیریت هزینه**: استراتژی‌های نمونه‌برداری، سیاست‌های نگهداری، کنترل‌های بودجه

### [v3.7.0] - 2025-11-19

#### بهبودهای کیفیت مستندات و مثال جدید Microsoft Foundry Models
**این نسخه کیفیت مستندات را در سراسر مخزن ارتقا می‌دهد و یک مثال کامل استقرار Microsoft Foundry Models با رابط چت gpt-4.1 اضافه می‌کند.**

#### اضافه شد
- **🤖 مثال چت Microsoft Foundry Models**: استقرار کامل gpt-4.1 با پیاده‌سازی عملی در `examples/azure-openai-chat/`:
  - زیرساخت کامل Microsoft Foundry Models (استقرار مدل gpt-4.1)
  - رابط چت خط فرمان پایتون با تاریخچه مکالمه
  - یکپارچه‌سازی Key Vault برای ذخیره امن کلید API
  - پیگیری مصرف توکن و برآورد هزینه
  - محدودسازی نرخ و مدیریت خطا
  - README جامع با راهنمای استقرار 35-45 دقیقه‌ای
  - 11 فایل آماده تولید (قالب‌های Bicep، اپ پایتون، پیکربندی)
- **📚 تمرین‌های مستندات**: تمرین‌های عملی به راهنمای پیکربندی اضافه شد:
  - تمرین 1: پیکربندی چندمحیطی (15 دقیقه)
  - تمرین 2: تمرین مدیریت اسرار (10 دقیقه)
  - معیارهای موفقیت واضح و مراحل تأیید
- **✅ تأیید استقرار**: بخش تأیید به راهنمای استقرار اضافه شد:
  - روش‌های بررسی سلامت
  - چک‌لیست معیارهای موفقیت
  - خروجی‌های مورد انتظار برای همه دستورات استقرار
  - مرجع سریع عیب‌یابی

#### بهبود یافته
- **examples/README.md**: به کیفیت سطح A (93%) به‌روزرسانی شد:
  - اضافه‌شدن azure-openai-chat به تمام بخش‌های مرتبط
  - به‌روزرسانی شمار نمونه‌های محلی از 3 به 4
  - اضافه شدن به جدول مثال‌های برنامه‌های AI
  - یکپارچه‌سازی در راه‌اندازی سریع برای کاربران واسط
  - اضافه شدن به بخش قالب‌های Microsoft Foundry
  - به‌روزرسانی ماتریس مقایسه و بخش‌های پیدا کردن فناوری
- **کیفیت مستندات**: از B+ (87%) → A- (92%) در پوشه docs بهبود یافت:
  - افزودن خروجی‌های مورد انتظار به مثال‌های دستورات بحرانی
  - درج مراحل تأیید برای تغییرات پیکربندی
  - تقویت یادگیری عملی با تمرین‌های کاربردی

#### تغییر یافته
- **پیشرفت یادگیری**: ادغام بهتر مثال‌های AI برای یادگیرندگان واسط
- **ساختار مستندات**: تمرین‌های عملی قابل اقدام‌تر با نتایج واضح
- **فرآیند تأیید**: معیارهای موفقیت صریح به گردش‌کارهای کلیدی اضافه شد

#### بهبود یافته
- **تجربه توسعه‌دهنده**: استقرار Microsoft Foundry Models اکنون 35-45 دقیقه طول می‌کشد (در مقابل 60-90 برای جایگزین‌های پیچیده)
- **شفافیت هزینه**: برآورد هزینه واضح ($50-200/month) برای مثال Microsoft Foundry Models
- **مسیر یادگیری**: توسعه‌دهندگان AI نقطه ورود واضح با azure-openai-chat دارند
- **استانداردهای مستندات**: خروجی‌های مورد انتظار و مراحل تأیید منسجم

#### تأیید شده
- ✅ مثال Microsoft Foundry Models با `azd up` به‌طور کامل عملی است
- ✅ همه 11 فایل پیاده‌سازی از نظر نحو صحیح‌اند
- ✅ دستورالعمل‌های README با تجربه واقعی استقرار مطابقت دارد
- ✅ لینک‌های مستندات در بیش از 8 مکان به‌روزرسانی شد
- ✅ فهرست مثال‌ها به‌درستی 4 نمونه محلی را منعکس می‌کند
- ✅ هیچ لینک خارجی تکراری در جداول وجود ندارد
- ✅ همه ارجاعات ناوبری صحیح هستند

#### پیاده‌سازی فنی
- **معماری Microsoft Foundry Models**: gpt-4.1 + Key Vault + الگوی Container Apps
- **امنیت**: آماده Managed Identity، اسرار در Key Vault
- **نظارت**: یکپارچه‌سازی Application Insights
- **مدیریت هزینه**: پیگیری توکن و بهینه‌سازی مصرف
- **استقرار**: یک دستور `azd up` برای راه‌اندازی کامل

### [v3.6.0] - 2025-11-19

#### به‌روزرسانی بزرگ: مثال‌های استقرار Container App
**این نسخه مثال‌های کامل و آماده تولید استقرار برنامه‌های کانتینری را با استفاده از Azure Developer CLI (AZD) معرفی می‌کند، همراه با مستندات کامل و ادغام در مسیر یادگیری.**

#### اضافه شد
- **🚀 مثال‌های Container App**: مثال‌های محلی جدید در `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): مرور کامل استقرارهای کانتینری، راه‌اندازی سریع، الگوهای تولید و پیشرفته
  - [Simple Flask API](../../examples/container-app/simple-flask-api): API REST مناسب مبتدیان با scale-to-zero، پروب‌های سلامت، نظارت و عیب‌یابی
  - [Microservices Architecture](../../examples/container-app/microservices): استقرار چندخدمتی آماده تولید (API Gateway، Product، Order، User، Notification)، پیام‌رسانی ناهمگام، Service Bus، Cosmos DB، Azure SQL، ردیابی توزیع‌شده، استقرار آبی-سبز/کَنِری
- **بهترین شیوه‌ها**: امنیت، نظارت، بهینه‌سازی هزینه و راهنمای CI/CD برای بارهای کاری کانتینری
- **نمونه‌های کد**: `azure.yaml` کامل، قالب‌های Bicep و پیاده‌سازی‌های سرویس چندزبانه (Python, Node.js, C#, Go)
- **آزمون و عیب‌یابی**: سناریوهای تست انتها-به-انتها، دستورات نظارتی، راهنمای عیب‌یابی

#### تغییر یافته
- **README.md**: برای نمایش و لینک‌دادن به مثال‌های جدید container app تحت "Local Examples - Container Applications" به‌روزرسانی شد
- **examples/README.md**: به‌روزرسانی برای برجسته‌سازی مثال‌های container app، افزودن ورودی در ماتریس مقایسه و به‌روزرسانی ارجاعات فناوری/معماری
- **طرح درس و راهنمای مطالعه**: به‌روزرسانی برای ارجاع به مثال‌های جدید container app و الگوهای استقرار در فصل‌های مرتبط

#### تأیید شده
- ✅ همه مثال‌های جدید با `azd up` قابل استقرار و مطابق بهترین شیوه‌ها هستند
- ✅ پیوندهای متقاطع مستندات و ناوبری به‌روزرسانی شد
- ✅ مثال‌ها سناریوهای مبتدی تا پیشرفته، از جمله میکروسرویس‌های تولیدی را پوشش می‌دهند

#### نکات
- **دامنه**: مستندات و مثال‌های انگلیسی تنها در این نسخه تغییر کرده‌اند
- **گام‌های بعدی**: افزودن الگوهای پیشرفته‌تر کانتینر و اتوماسیون CI/CD در نسخه‌های آینده

### [v3.5.0] - 2025-11-19

#### بازبرندسازی محصول: Microsoft Foundry
**این نسخه تغییر نام جامع محصول از "Microsoft Foundry" به "Microsoft Foundry" را در تمام مستندات انگلیسی پیاده‌سازی می‌کند، که بازبرندسازی رسمی مایکروسافت را منعکس می‌نماید.**

#### تغییر یافته
- **🔄 به‌روزرسانی نام محصول**: بازبرندسازی کامل از "Microsoft Foundry" به "Microsoft Foundry"
  - به‌روزرسانی تمام ارجاعات در مستندات انگلیسی در پوشه `docs/`
  - تغییر نام پوشه: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - فایل تغییر نام یافت: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - جمع: 23 ارجاع محتوایی به‌روزرسانی‌شده در 7 فایل مستندات

- **📁 تغییرات ساختار پوشه‌ها**:
  - `docs/ai-foundry/` تغییر نام یافت به `docs/microsoft-foundry/`
  - تمام ارجاعات متقاطع برای بازتاب ساختار پوشه جدید به‌روزرسانی شدند
  - پیوندهای ناوبری در تمام مستندات اعتبارسنجی شدند

- **📄 تغییر نام فایل‌ها**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - تمام لینک‌های داخلی برای ارجاع به نام فایل جدید به‌روزرسانی شدند

#### فایل‌های به‌روزرسانی شده
- **مستندات فصل** (7 فایل):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 به‌روزرسانی لینک‌های ناوبری
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 ارجاع نام محصول به‌روزرسانی شد
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - در حال حاضر از Microsoft Foundry استفاده می‌کند (از به‌روزرسانی‌های قبلی)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 ارجاع به‌روزرسانی شد (مرور کلی، بازخورد جامعه، مستندات)
  - `docs/getting-started/azd-basics.md` - 4 لینک ارجاع متقاطع به‌روزرسانی شد
  - `docs/getting-started/first-project.md` - 2 لینک ناوبری فصل به‌روزرسانی شد
  - `docs/getting-started/installation.md` - 2 لینک فصل بعدی به‌روزرسانی شد
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 ارجاع به‌روزرسانی شد (ناوبری، جامعه Discord)
  - `docs/troubleshooting/common-issues.md` - 1 لینک ناوبری به‌روزرسانی شد
  - `docs/troubleshooting/debugging.md` - 1 لینک ناوبری به‌روزرسانی شد

- **فایل‌های ساختار دوره** (2 فایل):
  - `README.md` - 17 ارجاع به‌روزرسانی شد (مرور دوره، عناوین فصل، بخش قالب‌ها، بینش‌های جامعه)
  - `course-outline.md` - 14 ارجاع به‌روزرسانی شد (مرور کلی، اهداف یادگیری، منابع فصل)

#### اعتبارسنجی شده
- ✅ هیچ ارجاع مسیر پوشه "ai-foundry" باقی‌مانده در مستندات انگلیسی وجود ندارد
- ✅ هیچ ارجاع نام محصول "Microsoft Foundry" باقی‌مانده در مستندات انگلیسی وجود ندارد
- ✅ تمام پیوندهای ناوبری با ساختار پوشه جدید عملکردی هستند
- ✅ تغییر نام فایل‌ها و پوشه‌ها با موفقیت تکمیل شد
- ✅ ارجاعات متقاطع بین فصل‌ها اعتبارسنجی شد

#### نکات
- **دامنه**: تغییرات تنها در مستندات انگلیسی در پوشه `docs/` اعمال شدند
- **ترجمه‌ها**: پوشه‌های ترجمه (`translations/`) در این نسخه به‌روزرسانی نشده‌اند
- **کارگاه**: مواد کارگاه (`workshop/`) در این نسخه به‌روزرسانی نشده‌اند
- **مثال‌ها**: فایل‌های نمونه ممکن است هنوز به نام‌گذاری قدیمی اشاره کنند (در به‌روزرسانی آینده رسیدگی خواهد شد)
- **پیوندهای خارجی**: URLهای خارجی و ارجاعات مخزن GitHub بدون تغییر باقی ماندند

#### راهنمای مهاجرت برای مشارکت‌کنندگان
اگر شاخه‌های محلی یا مستنداتی دارید که به ساختار قدیمی اشاره می‌کنند:
1. ارجاعات پوشه را به‌روزرسانی کنید: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. ارجاعات فایل را به‌روزرسانی کنید: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. نام محصول را جایگزین کنید: "Microsoft Foundry" → "Microsoft Foundry"
4. اعتبارسنجی کنید که تمام لینک‌های داخلی مستندات هنوز کار می‌کنند

---

### [v3.4.0] - 2025-10-24

#### بهبودهای پیش‌نمایش و اعتبارسنجی زیرساخت
**این نسخه پشتیبانی جامع از ویژگی پیش‌نمایش جدید Azure Developer CLI را معرفی می‌کند و تجربه کاربری کارگاه را بهبود می‌بخشد.**

#### اضافه شد
- **🧪 azd provision --preview Feature Documentation**: پوشش کامل قابلیت پیش‌نمایش زیرساخت جدید
  - مرجع دستور و مثال‌های استفاده در cheat sheet
  - ادغام دقیق در راهنمای فراهم‌سازی با موارد استفاده و مزایا
  - ادغام بررسی پیش‌پرواز برای اعتبارسنجی ایمن‌تر استقرار
  - به‌روزرسانی‌های راهنمای شروع سریع با رویه‌های ایمنی‌محور برای استقرار
- **🚧 بنر وضعیت کارگاه**: بنر HTML حرفه‌ای که وضعیت توسعه کارگاه را نشان می‌دهد
  - طراحی گرادیانت با نشانگرهای ساخت برای ارتباط واضح با کاربر
  - زمان آخرین به‌روزرسانی برای شفافیت
  - طراحی واکنش‌گرا برای همه انواع دستگاه‌ها

#### تقویت شد
- **ایمنی زیرساخت**: قابلیت پیش‌نمایش در سراسر مستندات استقرار ادغام شد
- **اعتبارسنجی پیش از استقرار**: اسکریپت‌های خودکار اکنون شامل آزمایش پیش‌نمایش زیرساخت هستند
- **گردش کار توسعه‌دهنده**: دنباله‌های دستور به‌روزرسانی شدند تا پیش‌نمایش را به‌عنوان بهترین شیوه شامل کنند
- **تجربه کارگاه**: انتظارات واضح برای کاربران درباره وضعیت توسعه محتوا تعیین شد

#### تغییر کرد
- **بهترین شیوه‌های استقرار**: اکنون جریان کاری مبتنی بر پیش‌نمایش به‌عنوان رویکرد توصیه‌شده اعلام شده است
- **جریان مستندات**: اعتبارسنجی زیرساخت زودتر در فرآیند یادگیری قرار گرفت
- **ارائه کارگاه**: ارتباط وضعیت حرفه‌ای با زمان‌بندی توسعه واضح

#### بهبود یافت
- **رویکرد ایمنی‌محور**: اکنون می‌توان تغییرات زیرساخت را قبل از استقرار اعتبارسنجی کرد
- **همکاری تیمی**: نتایج پیش‌نمایش قابل اشتراک‌گذاری برای بازبینی و تصویب هستند
- **آگاهی از هزینه‌ها**: درک بهتر هزینه منابع پیش از فراهم‌سازی
- **کاهش ریسک**: کاهش خطاهای استقرار از طریق اعتبارسنجی پیشین

#### پیاده‌سازی فنی
- **ادغام چند-فایلی**: قابلیت پیش‌نمایش در 4 فایل کلیدی مستندسازی شده است
- **الگوهای دستور**: نحو و مثال‌های سازگار در سراسر مستندات
- **ادغام بهترین شیوه‌ها**: پیش‌نمایش در گردش‌های کاری اعتبارسنجی و اسکریپت‌ها گنجانده شد
- **شاخص‌های بصری**: علامت‌گذاری ویژگی‌های NEW برای قابلیت کشف بهتر

#### زیرساخت کارگاه
- **ارتباط وضعیت**: بنر HTML حرفه‌ای با استایل گرادیانت
- **تجربه کاربری**: وضعیت توسعه واضح از سردرگمی جلوگیری می‌کند
- **ارائه حرفه‌ای**: اعتبار مخزن را حفظ کرده و هم‌زمان انتظارات را تنظیم می‌کند
- **شفافیت زمان‌بندی**: زمان آخرین به‌روزرسانی اکتبر 2025 برای پاسخگویی

### [v3.3.0] - 2025-09-24

#### مواد کارگاه تقویت‌شده و تجربه یادگیری تعاملی
**این نسخه مواد کارگاه جامع با راهنماهای تعاملی مبتنی بر مرورگر و مسیرهای یادگیری ساختاریافته را معرفی می‌کند.**

#### اضافه شد
- **🎥 راهنمای کارگاه تعاملی**: تجربه کارگاه مبتنی بر مرورگر با قابلیت پیش‌نمایش MkDocs
- **📝 دستورالعمل‌های ساختاریافته کارگاه**: مسیر یادگیری هفت مرحله‌ای از کشف تا سفارشی‌سازی
  - 0-Introduction: مرور کارگاه و راه‌اندازی
  - 1-Select-AI-Template: کشف و روند انتخاب قالب
  - 2-Validate-AI-Template: فرآیند استقرار و اعتبارسنجی
  - 3-Deconstruct-AI-Template: درک معماری قالب
  - 4-Configure-AI-Template: پیکربندی و سفارشی‌سازی
  - 5-Customize-AI-Template: اصلاحات پیشرفته و تکرارها
  - 6-Teardown-Infrastructure: پاک‌سازی و مدیریت منابع
  - 7-Wrap-up: خلاصه و گام‌های بعدی
- **🛠️ ابزارهای کارگاه**: پیکربندی MkDocs با تم Material برای تجربه یادگیری بهبود‌یافته
- **🎯 مسیر یادگیری عملی**: روش سه مرحله‌ای (کشف → استقرار → سفارشی‌سازی)
- **📱 ادغام GitHub Codespaces**: راه‌اندازی یکپارچه محیط توسعه

#### تقویت شد
- **آزمایشگاه کارگاه AI**: توسعه یافته با تجربه یادگیری ساختاریافته 2-3 ساعته
- **مستندسازی کارگاه**: ارائه حرفه‌ای با ناوبری و کمک‌های بصری
- **پیشرفت یادگیری**: راهنمایی گام‌به‌گام از انتخاب قالب تا استقرار تولید
- **تجربه توسعه‌دهنده**: ابزارهای یکپارچه برای گردش‌های کاری توسعه روان

#### بهبود یافت
- **دسترس‌پذیری**: رابط مبتنی بر مرورگر با قابلیت جستجو، کپی و تغییر تم
- **یادگیری خودآموز**: ساختار کارگاه انعطاف‌پذیر مناسب سرعت‌های مختلف یادگیری
- **کاربرد عملی**: سناریوهای واقعی استقرار قالب‌های AI
- **ادغام جامعه**: ادغام Discord برای پشتیبانی و همکاری کارگاه

#### ویژگی‌های کارگاه
- **جستجوی داخلی**: کشف سریع کلیدواژه‌ها و درس‌ها
- **کپی بلوک‌های کد**: قابلیت hover-to-copy برای تمام مثال‌های کد
- **تغییر تم**: پشتیبانی از حالت تاریک/روشن
- **دارایی‌های بصری**: اسکرین‌شات‌ها و دیاگرام‌ها برای درک بهتر
- **ادغام کمک**: دسترسی مستقیم به Discord برای پشتیبانی جامعه

### [v3.2.0] - 2025-09-17

#### بازسازی عمده ناوبری و سیستم یادگیری مبتنی بر فصل
**این نسخه یک ساختار یادگیری مبتنی بر فصل جامع با ناوبری بهبود‌یافته در سراسر مخزن را معرفی می‌کند.**

#### اضافه شد
- **📚 سیستم یادگیری مبتنی بر فصل**: بازساخت کل دوره به 8 فصل پیش‌رونده
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 سیستم ناوبری جامع**: هدرها و فوترهای ناوبری یکسان در سراسر مستندات
- **🎯 پیگیری پیشرفت**: چک‌لیست اتمام دوره و سیستم تأیید یادگیری
- **🗺️ راهنمای مسیر یادگیری**: نقاط ورود واضح برای سطوح تجربه و اهداف مختلف
- **🔗 ناوبری ارجاع متقابل**: فصل‌ها و پیش‌نیازهای مرتبط به‌وضوح لینک شده‌اند

#### تقویت شد
- **ساختار README**: تبدیل به یک پلتفرم یادگیری ساختاریافته با سازماندهی مبتنی بر فصل
- **ناوبری مستندات**: هر صفحه اکنون شامل بافت فصل و راهنمای پیشرفت است
- **سازماندهی قالب‌ها**: مثال‌ها و قالب‌ها به فصل‌های مناسب نگاشت شدند
- **ادغام منابع**: cheat sheetها، سوالات متداول و راهنماهای مطالعه به فصل‌های مرتبط متصل شدند
- **ادغام کارگاه**: آزمایشگاه‌های عملی به اهداف یادگیری چندین فصل نگاشت شدند

#### تغییر کرد
- **پیشرفت یادگیری**: از مستندسازی خطی به ساختار یادگیری انعطاف‌پذیر مبتنی بر فصل منتقل شد
- **محل قرارگیری پیکربندی**: راهنمای پیکربندی به فصل 3 منتقل شد تا جریان یادگیری بهتر شود
- **ادغام محتوای AI**: محتوای مخصوص AI بهتر در سراسر مسیر یادگیری جای گرفت
- **محتوای تولید**: الگوهای پیشرفته در فصل 8 برای یادگیرندگان سازمانی تجمیع شد

#### بهبود یافت
- **تجربه کاربری**: مسیرهای ناوبری و شاخص‌های پیشرفت فصل واضح‌تر شدند
- **دسترس‌پذیری**: الگوهای ناوبری یکسان برای پیمایش آسان‌تر دوره
- **ارائه حرفه‌ای**: ساختار دوره شبیه دانشگاه مناسب آموزش آکادمیک و شرکتی
- **بازده یادگیری**: زمان لازم برای یافتن محتوای مرتبط کاهش یافت

#### پیاده‌سازی فنی
- **هدرهای ناوبری**: ناوبری فصل استاندارد در بیش از 40 فایل مستندات یکنواخت شد
- **ناوبری فوتر**: راهنمای پیشرفت و نشانگرهای تکمیل فصل یکسان شدند
- **ارجاعات متقابل**: سیستم لینک‌دهی داخلی جامع مفاهیم مرتبط را به هم متصل می‌کند
- **نگاشت فصل‌ها**: قالب‌ها و مثال‌ها به‌وضوح با اهداف یادگیری مرتبط شدند

#### تقویت راهنمای مطالعه
- **📚 اهداف یادگیری جامع**: راهنمای مطالعه برای هماهنگی با سیستم 8 فصلی بازساخت شد
- **🎯 ارزیابی مبتنی بر فصل**: هر فصل شامل اهداف یادگیری مشخص و تمرین‌های عملی است
- **📋 پیگیری پیشرفت**: برنامه یادگیری هفتگی با نتایج قابل اندازه‌گیری و چک‌لیست‌های تکمیل
- **❓ سوالات ارزیابی**: سوالات اعتبارسنجی دانش برای هر فصل با خروجی‌های حرفه‌ای
- **🛠️ تمرین‌های عملی**: فعالیت‌های دست‌ورزی با سناریوهای واقعی استقرار و رفع اشکال
- **📊 پیشرفت مهارت**: پیشرفت واضح از مفاهیم پایه تا الگوهای سازمانی با تمرکز بر توسعه شغلی
- **🎓 چارچوب صدور گواهی**: نتایج توسعه حرفه‌ای و سیستم شناسایی جامعه
- **⏱️ مدیریت زمان‌بندی**: برنامه یادگیری 10 هفته‌ای ساختاریافته با تأیید نقاط عطف

### [v3.1.0] - 2025-09-17

#### بهبود راه‌حل‌های چندعاملۀ AI
**این نسخه راه‌حل چندعامله خرده‌فروشی را با نام‌گذاری بهتر عامل و مستندسازی تقویت می‌کند.**

#### تغییر کرد
- **اصطلاحات چندعامل**: عبارت "Cora agent" با "Customer agent" در سراسر راه‌حل چندعامله خرده‌فروشی جایگزین شد تا درک واضح‌تری فراهم شود
- **معماری عامل**: تمام مستندات، قالب‌های ARM و مثال‌های کد برای استفاده از نام "Customer agent" به‌روزرسانی شدند
- **مثال‌های پیکربندی**: الگوهای پیکربندی عامل مدرن‌شده با نام‌گذاری به‌روز
- **یکپارچگی مستندسازی**: اطمینان حاصل شد که تمام ارجاعات از نام‌های حرفه‌ای و توصیفی استفاده می‌کنند

#### تقویت شد
- **پکیج قالب ARM**: retail-multiagent-arm-template با ارجاعات Customer agent به‌روزرسانی شد
- **دیاگرام‌های معماری**: دیاگرام‌های Mermaid با نام‌گذاری عامل به‌روز شد
- **مثال‌های کد**: کلاس‌ها و مثال‌های پیاده‌سازی Python اکنون از نام CustomerAgent استفاده می‌کنند
- **متغیرهای محیطی**: تمام اسکریپت‌های استقرار برای استفاده از الگوهای CUSTOMER_AGENT_NAME به‌روزرسانی شدند

#### بهبود یافت
- **تجربه توسعه‌دهنده**: نقش‌ها و مسئولیت‌های عامل در مستندات واضح‌تر شدند
- **آمادگی تولید**: تطابق بهتر با کنوانسیون‌های نام‌گذاری سازمانی
- **مواد آموزشی**: نام‌گذاری عامل برای اهداف آموزشی واضح‌تر و شهودی‌تر شد
- **قابلیت استفاده قالب**: فهم عملکردها و الگوهای استقرار عامل ساده‌تر شد

#### جزئیات فنی
- دیاگرام‌های معماری Mermaid با ارجاعات CustomerAgent به‌روز شدند
- نام کلاس‌های CoraAgent در مثال‌های Python با CustomerAgent جایگزین شد
- پیکربندی‌های JSON قالب ARM برای استفاده از نوع عامل "customer" تغییر یافت
- متغیرهای محیطی از CORA_AGENT_* به الگوهای CUSTOMER_AGENT_* تغییر کردند
- تمام دستورات استقرار و پیکربندی‌های کانتینر بازبینی شدند

### [v3.0.0] - 2025-09-12

#### تغییرات عمده - تمرکز بر توسعه‌دهنده AI و ادغام Microsoft Foundry
**این نسخه مخزن را به یک منبع یادگیری جامع متمرکز بر AI با ادغام Microsoft Foundry تبدیل می‌کند.**

#### اضافه شد
- **🤖 مسیر یادگیری AI-First**: بازساخت کامل با اولویت‌دهی به توسعه‌دهندگان و مهندسان AI
- **Microsoft Foundry Integration Guide**: مستندسازی جامع برای اتصال AZD به سرویس‌های Microsoft Foundry
- **الگوهای استقرار مدل AI**: راهنمای دقیق شامل انتخاب مدل، پیکربندی و استراتژی‌های استقرار در تولید
- **AI Workshop Lab**: کارگاه عملی 2-3 ساعته برای تبدیل برنامه‌های AI به راهکارهایی قابل استقرار با AZD
- **Production AI Best Practices**: الگوهای آماده برای سازمان جهت مقیاس‌دهی، مانیتورینگ، و ایمن‌سازی بارهای کاری AI
- **AI-Specific Troubleshooting Guide**: عیب‌یابی جامع برای Microsoft Foundry Models، Cognitive Services و مسائل استقرار AI
- **AI Template Gallery**: مجموعهٔ منتخب قالب‌های Microsoft Foundry به‌همراه درجه‌بندی پیچیدگی
- **Workshop Materials**: ساختار کامل کارگاه همراه با آزمایشگاه‌های عملی و منابع مرجع

#### Enhanced
- **README Structure**: متمرکز بر توسعه‌دهندگان AI با داده‌های 45٪ علاقه‌مندی جامعه از Microsoft Foundry Discord
- **Learning Paths**: مسیر اختصاصی توسعه‌دهنده AI در کنار مسیرهای سنتی برای دانشجویان و مهندسان DevOps
- **Template Recommendations**: قالب‌های پیشنهادی AI از جمله azure-search-openai-demo، contoso-chat و openai-chat-app-quickstart
- **Community Integration**: یکپارچه‌سازی جامعه با پشتیبانی بهبود یافته در Discord و کانال‌ها و بحث‌های مخصوص AI

#### Security & Production Focus
- **Managed Identity Patterns**: پیکربندی‌های احراز هویت و امنیت مخصوص AI
- **Cost Optimization**: ردیابی استفاده از توکن و کنترل‌های بودجه برای بارهای کاری AI
- **Multi-Region Deployment**: استراتژی‌هایی برای استقرار جهانی برنامه‌های AI
- **Performance Monitoring**: معیارهای مخصوص AI و یکپارچگی با Application Insights

#### Documentation Quality
- **Linear Course Structure**: پیشرفت منطقی از مبتدی تا الگوهای پیشرفته استقرار AI
- **Validated URLs**: تمام پیوندهای مخزن خارجی بررسی و قابل دسترسی هستند
- **Complete Reference**: تمام پیوندهای مستندات داخلی تأیید شده و عملیاتی هستند
- **Production Ready**: الگوهای استقرار سازمانی با مثال‌های دنیای واقعی

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**این نسخه نشان‌دهندهٔ بازنگری بزرگی در ساختار مخزن و ارائهٔ محتوا است.**

#### Added
- **Structured Learning Framework**: تمام صفحات مستندات اکنون شامل بخش‌های مقدمه، اهداف یادگیری و نتایج یادگیری هستند
- **Navigation System**: افزودن پیوندهای درس قبلی/بعدی در سراسر مستندات برای هدایت پیشرفت یادگیری
- **Study Guide**: راهنمای جامع study-guide.md با اهداف یادگیری، تمرین‌های عملی و مواد ارزیابی
- **Professional Presentation**: حذف تمامی آیکون‌های ایموجی برای دسترسی بهتر و ظاهر حرفه‌ای‌تر
- **Enhanced Content Structure**: سازمان‌دهی و جریان محتواهای آموزشی بهبود یافته

#### Changed
- **Documentation Format**: استانداردسازی تمام مستندات با ساختار یکپارچهٔ متمرکز بر یادگیری
- **Navigation Flow**: اجرای پیشرفت منطقی در تمام مواد آموزشی
- **Content Presentation**: حذف عناصر تزیینی به‌نفع قالب‌بندی واضح و حرفه‌ای
- **Link Structure**: به‌روزرسانی تمام لینک‌های داخلی برای پشتیبانی از سیستم ناوبری جدید

#### Improved
- **Accessibility**: حذف وابستگی به ایموجی‌ها برای سازگاری بهتر با صفحه‌خوان‌ها
- **Professional Appearance**: ارائهٔ پاک و به‌سبک آکادمیک مناسب برای آموزش سازمانی
- **Learning Experience**: رویکرد ساختاریافته با اهداف و نتایج روشن برای هر درس
- **Content Organization**: جریان منطقی بهتر و ارتباط میان موضوعات مرتبط

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - سری کامل راهنمای getting-started
  - مستندات جامع استقرار و فراهم‌سازی
  - منابع جزئی عیب‌یابی و راهنماهای اشکال‌زدایی
  - ابزارها و رویه‌های اعتبارسنجی پیش از استقرار

- **Getting Started Module**
  - AZD Basics: مفاهیم و اصطلاحات پایه
  - Installation Guide: دستورالعمل‌های نصب مخصوص پلتفرم
  - Configuration Guide: راهنمای راه‌اندازی محیط و احراز هویت
  - First Project Tutorial: آموزش عملی گام‌به‌گام برای اولین پروژه

- **Deployment and Provisioning Module**
  - Deployment Guide: مستندات کامل گردش‌کار
  - Provisioning Guide: Infrastructure as Code با Bicep
  - بهترین شیوه‌ها برای استقرار در محیط تولید
  - الگوهای معماری چندسرویسی

- **Pre-deployment Validation Module**
  - Capacity Planning: اعتبارسنجی در دسترس‌ بودن منابع Azure
  - SKU Selection: راهنمای کامل انتخاب سطح سرویس
  - Pre-flight Checks: اسکریپت‌های اعتبارسنجی خودکار (PowerShell و Bash)
  - ابزارهای برآورد هزینه و برنامه‌ریزی بودجه

- **Troubleshooting Module**
  - Common Issues: مشکلات متداول و راه‌حل‌ها
  - Debugging Guide: روش‌های سیستماتیک عیب‌یابی
  - تکنیک‌ها و ابزارهای تشخیص پیشرفته
  - مانیتورینگ عملکرد و بهینه‌سازی

- **Resources and References**
  - Command Cheat Sheet: مرجع سریع برای دستورات ضروری
  - Glossary: واژه‌نامهٔ جامع اصطلاحات و مخفف‌ها
  - FAQ: پاسخ‌های مفصل به سوالات رایج
  - پیوندهای منابع خارجی و ارتباطات جامعه

- **Examples and Templates**
  - مثال برنامه وب ساده
  - قالب استقرار وب‌سایت استاتیک
  - پیکربندی برنامه کانتینری
  - الگوهای یکپارچه‌سازی پایگاه‌داده
  - مثال‌های معماری میکروسرویس
  - پیاده‌سازی توابع بدون‌سرور

#### Features
- **Multi-Platform Support**: راهنماهای نصب و پیکربندی برای Windows، macOS و Linux
- **Multiple Skill Levels**: محتوا طراحی‌شده برای دانشجویان تا توسعه‌دهندگان حرفه‌ای
- **Practical Focus**: مثال‌های عملی و سناریوهای دنیای واقعی
- **Comprehensive Coverage**: از مفاهیم پایه تا الگوهای سازمانی پیشرفته
- **Security-First Approach**: بهترین شیوه‌های امنیتی در سراسر محتوا یکپارچه شده‌اند
- **Cost Optimization**: راهنمایی برای استقرارهای مقرون‌به‌صرفه و مدیریت منابع

#### Documentation Quality
- **Detailed Code Examples**: نمونه‌های کد عملی و آزموده‌شده
- **Step-by-Step Instructions**: راهنمایی‌های واضح و قابل اجرا گام‌به‌گام
- **Comprehensive Error Handling**: مدیریت خطای جامع؛ عیب‌یابی مشکلات متداول
- **Best Practices Integration**: یکپارچه‌سازی بهترین شیوه‌ها؛ استانداردها و توصیه‌های صنعت
- **Version Compatibility**: به‌روز با آخرین سرویس‌های Azure و قابلیت‌های azd

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: الگوهای یکپارچه‌سازی برای Hugging Face، Azure Machine Learning و مدل‌های سفارشی
- **AI Agent Frameworks**: قالب‌هایی برای استقرارهای LangChain، Semantic Kernel و AutoGen
- **Advanced RAG Patterns**: گزینه‌های دیتابیس برداری فراتر از Azure AI Search (Pinecone، Weaviate و غیره)
- **AI Observability**: مانیتورینگ پیشرفته برای عملکرد مدل، استفاده از توکن و کیفیت پاسخ

#### Developer Experience
- **VS Code Extension**: تجربه توسعه یکپارچه AZD + Microsoft Foundry
- **GitHub Copilot Integration**: تولید قالب‌های AZD با کمک AI
- **Interactive Tutorials**: تمرین‌های کدنویسی عملی با اعتبارسنجی خودکار برای سناریوهای AI
- **Video Content**: آموزش‌های ویدیویی مکمل برای یادگیرندگان تصویری با تمرکز بر استقرارهای AI

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: حاکمیت مدل AI، رعایت انطباق و مسیرهای ممیزی
- **Multi-Tenant AI**: الگوهایی برای ارائه خدمات به چند مشتری با سرویس‌های AI ایزوله‌شده
- **Edge AI Deployment**: یکپارچگی با Azure IoT Edge و نمونه‌های کانتینری
- **Hybrid Cloud AI**: الگوهای استقرار چندابری و هیبرید برای بارهای کاری AI

#### Advanced Features
- **AI Pipeline Automation**: اتوماسیون خط لوله AI؛ یکپارچه‌سازی MLOps با خطوط لوله Azure Machine Learning
- **Advanced Security**: الگوهای اعتماد صفر، نقاط انتهایی خصوصی و حفاظت پیشرفته در برابر تهدیدات
- **Performance Optimization**: تنظیم و مقیاس‌دهی پیشرفته برای برنامه‌های AI با توان بالا
- **Global Distribution**: الگوهای تحویل محتوا و کش لبه برای برنامه‌های AI

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: یکپارچه‌سازی جامع Microsoft Foundry (تکمیل‌شده)
- ✅ **Interactive Tutorials**: کارگاه عملی AI (تکمیل‌شده)
- ✅ **Advanced Security Module**: الگوهای امنیتی مخصوص AI (تکمیل‌شده)
- ✅ **Performance Optimization**: استراتژی‌های بهینه‌سازی بار کاری AI (تکمیل‌شده)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: سناریوهای استقرار متمرکز بر AI (تکمیل‌شده)
- ✅ **Extended FAQ**: سوالات و عیب‌یابی مخصوص AI (تکمیل‌شده)
- **Tool Integration**: راهنماهای یکپارچه‌سازی IDE و ویرایشگر بهبود یافته
- ✅ **Monitoring Expansion**: الگوهای مانیتورینگ و هشداردهی مخصوص AI (تکمیل‌شده)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: طراحی پاسخگو برای یادگیری موبایلی
- **Offline Access**: بسته‌های مستندات قابل دانلود
- **Enhanced IDE Integration**: افزونه VS Code برای گردش‌کارهای AZD + AI
- **Community Dashboard**: معیارهای جامعه در زمان واقعی و ردیابی مشارکت

## Contributing to the Changelog

### Reporting Changes
هنگام مشارکت در این مخزن، لطفاً مطمئن شوید که ورودی‌های changelog شامل موارد زیر باشند:

1. **Version Number**: پیروی از نسخه‌بندی معنایی (major.minor.patch)
2. **Date**: تاریخ انتشار یا به‌روزرسانی در فرمت YYYY-MM-DD
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: توضیح مختصر از آنچه تغییر کرده
5. **Impact Assessment**: چگونه تغییرات بر کاربران موجود تأثیر می‌گذارد

### Change Categories

#### Added
- ویژگی‌ها، بخش‌های مستندات یا قابلیت‌های جدید
- مثال‌ها، قالب‌ها یا منابع یادگیری جدید
- ابزارها، اسکریپت‌ها یا ابزارک‌های اضافی

#### Changed
- تغییرات در عملکرد یا مستندات موجود
- به‌روزرسانی‌ها برای بهبود وضوح یا دقت
- بازساخت محتوا یا سازمان‌دهی

#### Deprecated
- قابلیت‌ها یا روش‌هایی که در حال حذف تدریجی هستند
- بخش‌های مستنداتی که برای حذف برنامه‌ریزی شده‌اند
- روش‌هایی که جایگزین‌های بهتری دارند

#### Removed
- قابلیت‌ها، مستندات یا مثال‌هایی که دیگر مرتبط نیستند
- اطلاعات قدیمی یا روش‌های منسوخ‌شده
- محتوای تکراری یا تجمیع‌شده

#### Fixed
- اصلاح خطاها در مستندات یا کد
- حل مشکلات گزارش‌شده
- بهبود دقت یا عملکرد

#### Security
- بهبودها یا اصلاحات مرتبط با امنیت
- به‌روزرسانی‌های بهترین شیوه‌های امنیتی
- رفع آسیب‌پذیری‌های امنیتی

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- تغییرات شکسته‌کننده که نیاز به اقدام کاربر دارند
- بازساخت قابل توجه محتوا یا سازماندهی
- تغییراتی که رویکرد یا روش‌شناسی پایه را تغییر می‌دهند

#### Minor Version (X.Y.0)
- ویژگی‌ها یا افزودنی‌های محتوایی جدید
- بهبودهایی که سازگاری رو به عقب را حفظ می‌کنند
- مثال‌ها، ابزارها یا منابع اضافی

#### Patch Version (X.Y.Z)
- رفع باگ و اصلاحات
- بهبودهای کوچک در محتوای موجود
- روشن‌سازی‌ها و بهبودهای کوچک

## Community Feedback and Suggestions

ما فعالانه بازخورد جامعه را برای بهبود این منبع آموزشی تشویق می‌کنیم:

### How to Provide Feedback
- **GitHub Issues**: گزارش مشکلات یا پیشنهاد بهبودها (مسائل خاص AI استقبال می‌شود)
- **Discord Discussions**: اشتراک ایده‌ها و تعامل با جامعهٔ Microsoft Foundry
- **Pull Requests**: مشارکت با بهبودهای مستقیم در محتوا، به‌ویژه قالب‌ها و راهنماهای AI
- **Microsoft Foundry Discord**: شرکت در کانال #Azure برای مباحث AZD + AI
- **Community Forums**: شرکت در بحث‌های گسترده‌تر توسعه‌دهندگان Azure

### Feedback Categories
- **AI Content Accuracy**: اصلاحات مربوط به یکپارچه‌سازی سرویس‌های AI و اطلاعات استقرار
- **Learning Experience**: پیشنهادهایی برای بهبود جریان یادگیری توسعه‌دهندگان AI
- **Missing AI Content**: درخواست‌ها برای قالب‌ها، الگوها یا مثال‌های اضافه AI
- **Accessibility**: بهبودها برای نیازهای یادگیری متنوع
- **AI Tool Integration**: پیشنهادهایی برای یکپارچه‌سازی بهتر گردش‌کار توسعه AI
- **Production AI Patterns**: درخواست‌هایی برای الگوهای استقرار AI سازمانی

### Response Commitment
- **Issue Response**: پاسخ در عرض ۴۸ ساعت برای مشکلات گزارش‌شده
- **Feature Requests**: بررسی در عرض یک هفته
- **Community Contributions**: بررسی در عرض یک هفته
- **Security Issues**: اولویت فوری با پاسخ تسریع‌شده

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: بررسی ماهیانه دقت محتوا و اعتبارسنجی لینک‌ها
- **Quarterly Updates**: به‌روزرسانی‌های فصلی شامل افزودنی‌ها و بهبودهای عمده
- **Semi-Annual Reviews**: بازنگری و ارتقای جامع نیم‌سالی
- **Annual Releases**: انتشارهای سالیانه نسخه‌های عمده با بهبودهای قابل توجه

### Monitoring and Quality Assurance
- **Automated Testing**: اعتبارسنجی منظم نمونه‌های کد و لینک‌ها
- **Community Feedback Integration**: یکپارچه‌سازی مداوم پیشنهادات کاربران
- **Technology Updates**: همسوسازی با آخرین سرویس‌های Azure و نسخه‌های azd
- **Accessibility Audits**: بازبینی منظم برای اصول طراحی فراگیر

## Version Support Policy

### Current Version Support
- **Latest Major Version**: پشتیبانی کامل با به‌روزرسانی‌های منظم
- **Previous Major Version**: به‌روزرسانی‌های امنیتی و اصلاحات بحرانی به مدت ۱۲ ماه
- **Legacy Versions**: تنها پشتیبانی جامعه، بدون به‌روزرسانی رسمی

### Migration Guidance
هنگامی که نسخه‌های اصلی منتشر می‌شوند، ما ارائه می‌دهیم:
- **Migration Guides**: دستورالعمل‌های انتقال گام‌به‌گام
- **Compatibility Notes**: جزئیات مربوط به تغییرات شکسته‌کننده
- **Tool Support**: اسکریپت‌ها یا ابزارهایی برای کمک به مهاجرت
- **Community Support**: انجمن‌های اختصاصی برای سؤالات مربوط به مهاجرت

---

**Navigation**
- **Previous Lesson**: [راهنمای مطالعه](resources/study-guide.md)
- **Next Lesson**: بازگشت به [README اصلی](README.md)

**Stay Updated**: این مخزن را دنبال کنید برای دریافت اعلان‌ها دربارهٔ انتشارهای جدید و به‌روزرسانی‌های مهم در مواد آموزشی.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->