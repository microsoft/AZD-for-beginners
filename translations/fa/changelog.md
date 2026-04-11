# فهرست تغییرات - AZD For Beginners

## مقدمه

این فهرست تغییرات تمام تغییرات، به‌روزرسانی‌ها و بهبودهای قابل توجه در مخزن AZD For Beginners را مستندسازی می‌کند. ما از اصول نسخه‌بندی معنایی پیروی می‌کنیم و این گزارش را نگهداری می‌کنیم تا به کاربران کمک کند بفهمند بین نسخه‌ها چه تغییراتی رخ داده است.

## اهداف یادگیری

با مرور این فهرست تغییرات، شما:
- از ویژگی‌ها و افزودنی‌های محتوایی جدید مطلع می‌شوید
- بهبودهای اعمال‌شده در مستندات موجود را درک می‌کنید
- رفع اشکال‌ها و اصلاحات را برای اطمینان از دقت پیگیری می‌کنید
- تکامل مواد آموزشی را در طول زمان دنبال می‌کنید

## نتایج یادگیری

پس از مرور موارد در این فهرست تغییرات، شما قادر خواهید بود:
- محتوای جدید و منابع در دسترس برای یادگیری را شناسایی کنید
- بفهمید کدام بخش‌ها به‌روزرسانی یا بهبود یافته‌اند
- مسیر یادگیری خود را بر اساس جدیدترین مطالب برنامه‌ریزی کنید
- بازخورد و پیشنهاداتی برای بهبودهای آینده ارائه دهید

## تاریخچه نسخه

### [v3.19.1] - 2026-03-27

#### روشن‌سازی ورود مبتدیان، اعتبارسنجی نصب و پاک‌سازی نهایی دستورات AZD
**این نسخه پیگیری بررسی اعتبار AZD 1.23 را با یک بازنگری مستندسازی متمرکز بر مبتدیان دنبال می‌کند: راهنمایی اولویت‌دار احراز هویت برای AZD را روشن می‌کند، اسکریپت‌های اعتبارسنجی نصب محلی را اضافه می‌کند، دستورات کلیدی را در برابر CLI زنده AZD تأیید می‌کند، و آخرین ارجاعات دستوری منبع-انگلیسیِ منسوخ را خارج از فهرست تغییرات حذف می‌کند.**

#### اضافه‌شده
- **🧪 اسکریپت‌های اعتبارسنجی نصب برای مبتدیان** با `validate-setup.ps1` و `validate-setup.sh` تا فراگیران بتوانند ابزارهای مورد نیاز را قبل از شروع فصل 1 تأیید کنند
- **✅ مراحل اعتبارسنجی نصب از پیش** در READMEٔ ریشه و README فصل 1 تا پیش‌نیازهای گمشده قبل از `azd up` شناسایی شوند

#### تغییرات
- **🔐 راهنمای احراز هویت برای مبتدیان** اکنون به‌طور یکنواخت `azd auth login` را به‌عنوان مسیر اصلی برای جریان‌های کاری AZD در نظر می‌گیرد، و `az login` را به‌عنوان اختیاری ذکر می‌کند مگر اینکه مستقیماً از دستورات Azure CLI استفاده شود
- **📚 جریان ورود فصل 1** اکنون فراگیران را به اعتبارسنجی نصب محلی‌شان قبل از مراحل نصب، احراز هویت و اولین استقرار هدایت می‌کند
- **🛠️ پیام‌دهی اعتبارسنج** اکنون به‌طور واضح نیازمندی‌های مسدودکننده را از هشدارهای اختیاری Azure CLI برای مسیر مبتدیان صرفاً AZD جدا می‌کند
- **📖 مستندات پیکربندی، عیب‌یابی و نمونه** اکنون بین احراز هویت مورد نیاز AZD و ورود اختیاری Azure CLI تفکیک قائل می‌شوند در مکان‌هایی که قبلاً هر دو بدون زمینه ارائه شده بودند

#### رفع‌شده
- **📋 ارجاعات دستوری باقیمانده منبع-انگلیسی** به اشکال کنونی AZD به‌روزرسانی شدند، از جمله `azd config show` در cheat sheet و `azd monitor --overview` در مواقعی که راهنمایی نمای کلی Azure Portal مورد نظر بود
- **🧭 ادعاهای مربوط به مبتدیان در فصل 1** تعدیل شدند تا از وعده‌های بیش از حد درباره تضمین رفتار بدون خطا یا بازگردانی در تمام قالب‌ها و منابع Azure جلوگیری شود
- **🔎 اعتبارسنجی زنده CLI** پشتیبانی فعلی برای `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, و `azd down --force --purge` را تأیید کرد

#### فایل‌های به‌روز‌شده
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

#### اعتبارسنجی AZD 1.23.12، گسترش محیط کارگاه و تازه‌سازی مدل‌های AI
**این نسخه یک بازبینی اعتبار مستندات را در برابر `azd` `1.23.12` انجام می‌دهد، نمونه‌های دستوری قدیمی AZD را به‌روزرسانی می‌کند، راهنمایی مدل‌های AI را به پیش‌فرض‌های جاری تازه می‌کند، و دستورالعمل‌های کارگاه را فراتر از GitHub Codespaces گسترش می‌دهد تا dev containers و کلون‌های محلی با MkDocs را نیز پشتیبانی کند.**

#### اضافه‌شده
- **✅ نکات اعتبارسنجی در سراسر فصل‌های اصلی و مستندات کارگاه** تا پایه AZD تست‌شده را برای فراگیرانی که از بیلدهای جدیدتر یا قدیمی‌تر CLI استفاده می‌کنند، صریح کند
- **⏱️ راهنمایی تایم‌اوت استقرار** برای استقرارهای برنامه AI بلندمدت با استفاده از `azd deploy --timeout 1800`
- **🔎 مراحل بررسی Extension** با `azd extension show azure.ai.agents` در مستندات جریان کاری AI
- **🌐 راهنمایی محیط کارگاه گسترده‌تر** که GitHub Codespaces، dev containers، و کلون‌های محلی را پوشش می‌دهد

#### تغییرات
- **📚 README‌های معرفی فصل** اکنون در سراسر بخش‌های بنیاد، پیکربندی، زیرساخت، چند-عامل، پیش‌استقرار، عیب‌یابی و تولید قید اعتبار در برابر `azd 1.23.12` را به‌صورت یکنواخت ذکر می‌کنند
- **🛠️ ارجاعات دستوری AZD** اکنون در سراسر مستندات به اشکال کنونی به‌روزرسانی شدند:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` or `azd env get-value(s)` depending on context
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` در مواقعی که نمای کلی Application Insights مورد نظر باشد
- **🧪 مثال‌های پیش‌نمایش تأمین منابع** به استفاده‌ی ساده‌شده و پشتیبانی‌شده جاری مانند `azd provision --preview` و `azd provision --preview -e production` تغییر یافتند
- **🧭 جریان کارگاه** به‌روزرسانی شد تا فراگیران بتوانند آزمایشگاه‌ها را در Codespaces، یک dev container، یا یک کلون محلی کامل کنند به‌جای فرض اجرای صرفاً در Codespaces
- **🔐 راهنمایی احراز هویت** اکنون `azd auth login` را برای جریان‌های کاری AZD ترجیح می‌دهد و `az login` را هنگامی که به‌طور مستقیم از دستورات Azure CLI استفاده می‌شود، اختیاری قرار می‌دهد

#### رفع‌شده
- **🪟 دستورات نصب Windows** در راهنمای نصب به نگارش فعلی بسته `winget` نرمالیزه شدند
- **🐧 راهنمای نصب Linux** اصلاح شد تا از دستورالعمل‌های غیرقابل‌پشتیبانی اختصاصی توزیع برای مدیر بسته `azd` جلوگیری کند و در صورت لزوم به فایل‌های انتشار اشاره کند
- **📦 مثال‌های مدل AI** از پیش‌فرض‌های قدیمی مانند `gpt-35-turbo` و `text-embedding-ada-002` به نمونه‌های جاری مانند `gpt-4.1-mini`, `gpt-4.1`, و `text-embedding-3-large` تازه شدند
- **📋 قطعات کد استقرار و تشخیصی** اصلاح شدند تا از دستورات محیط و وضعیتِ جاری در لاگ‌ها، اسکریپت‌ها و مراحل عیب‌یابی استفاده کنند
- **⚙️ راهنمایی GitHub Actions** از `Azure/setup-azd@v1.0.0` به `Azure/setup-azd@v2` به‌روزرسانی شد
- **🤖 راهنمایی رضایت MCP/Copilot** از `azd mcp consent` به `azd copilot consent list` به‌روزرسانی شد

#### بهبود یافته
- **🧠 راهنمای فصل AI** اکنون رفتار حساس به پیش‌نمایش `azd ai`، ورود خاص tenant، استفاده کنونی از extensionها، و توصیه‌های به‌روزشده برای استقرار مدل را بهتر توضیح می‌دهد
- **🧪 دستورالعمل‌های کارگاه** اکنون از مثال‌های نسخه واقع‌گرایانه‌تر و زبان راه‌اندازی محیط واضح‌تر برای آزمایشگاه‌های عملی استفاده می‌کنند
- **📈 مستندات تولید و عیب‌یابی** اکنون بهتر با نظارت جاری، مدل‌های پشتیبان و مثال‌های سطوح هزینه همسان شده‌اند

#### فایل‌های به‌روز‌شده
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

#### دستورات CLI AI در AZD، اعتبارسنجی محتوا و گسترش قالب‌ها
**این نسخه پوشش دستوری `azd ai`، `azd extension`، و `azd mcp` را در سراسر فصل‌های مرتبط با AI اضافه می‌کند، لینک‌های خراب و کد منسوخ در agents.md را اصلاح می‌کند، cheat sheet را به‌روزرسانی می‌کند، و بخش Example Templates را با توضیحات معتبر و قالب‌های جدید Azure AI AZD بازسازی می‌کند.**

#### اضافه‌شده
- **🤖 پوشش دستورات AZD AI CLI** در 7 فایل (قبلاً فقط در فصل 8):
  - `docs/chapter-01-foundation/azd-basics.md` — بخش جدید «افزونه‌ها و دستورات AI» که `azd extension`، `azd ai agent init` و `azd mcp` را معرفی می‌کند
  - `docs/chapter-02-ai-development/agents.md` — گزینه 4: `azd ai agent init` با جدول مقایسه (رویکرد قالب در مقابل مانیفست)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — زیرقسمت‌های «افزونه‌های AZD برای Foundry» و «استقرار مبتنی بر Agent»
  - `docs/chapter-05-multi-agent/README.md` — راه‌اندازی سریع اکنون مسیرهای استقرار مبتنی بر قالب و مبتنی بر مانیفست را نشان می‌دهد
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — بخش استقرار اکنون گزینه `azd ai agent init` را شامل می‌شود
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — زیرقسمت «دستورات افزونه AI AZD برای تشخیص مشکلات»
  - `resources/cheat-sheet.md` — بخش جدید «دستورات AI و افزونه‌ها» با `azd extension`، `azd ai agent init`، `azd mcp`، و `azd infra generate`
- **📦 قالب‌های نمونه AZD AI جدید** در `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — چت RAG .NET با Blazor WebAssembly، Semantic Kernel، و پشتیبانی از چت صوتی
  - **azure-search-openai-demo-java** — چت RAG جاوا با استفاده از Langchain4J با گزینه‌های استقرار ACA/AKS
  - **contoso-creative-writer** — برنامه نگارش خلاق چندعامله با استفاده از Azure AI Agent Service، Bing Grounding، و Prompty
  - **serverless-chat-langchainjs** — RAG بدون سرور با استفاده از Azure Functions + LangChain.js + Cosmos DB و پشتیبانی توسعه محلی با Ollama
  - **chat-with-your-data-solution-accelerator** — شتاب‌دهنده سازمانی RAG با پورتال مدیریت، یکپارچه‌سازی Teams، و گزینه‌های PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — برنامه مرجع ارکستراسیون MCP چندعامله با سرورها در .NET، Python، Java، و TypeScript
  - **azd-ai-starter** — قالب شروع بایسِپ حداقلی زیرساخت Azure AI
  - **🔗 لینک گالری عالی AZD AI** — ارجاع به [گالری awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (بیش از 80 قالب)

#### رفع‌شده
- **🔗 ناوبری agents.md**: لینک‌های قبلی/بعدی اکنون با ترتیب درس‌های README فصل 2 هم‌خوانی دارند (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 لینک‌های خراب agents.md**: `production-ai-practices.md` اصلاح شد به `../chapter-08-production/production-ai-practices.md` (3 وقوع)
- **📦 کد منسوخ agents.md**: `opencensus` با `azure-monitor-opentelemetry` + OpenTelemetry SDK جایگزین شد
- **🐛 API نامعتبر در agents.md**: `max_tokens` از `create_agent()` به `create_run()` منتقل شد به‌صورت `max_completion_tokens`
- **🔢 شمارش توکن در agents.md**: برآورد خشن `len//4` با `tiktoken.encoding_for_model()` جایگزین شد
- **azure-search-openai-demo**: خدمات از "Cognitive Search + App Service" به "Azure AI Search + Azure Container Apps" اصلاح شد (میزبان پیش‌فرض از اکتبر 2024 تغییر کرده است)
- **contoso-chat**: توضیحات برای اشاره به Azure AI Foundry + Prompty به‌روزرسانی شد تا با عنوان و پشته فناوری مخزن مطابقت پیدا کند

#### حذف‌شده
- **ai-document-processing**: ارجاع قالب غیرقابل‌عمل حذف شد (مخزن به‌صورت عمومی به‌عنوان قالب AZD در دسترس نیست)

#### بهبود یافته
- **📝 agents.md exercises**: اکنون تمرین 1 خروجی مورد انتظار و مرحله `azd monitor` را نشان می‌دهد؛ تمرین 2 شامل کد کامل ثبت `FunctionTool` است؛ تمرین 3 راهنمایی مبهم را با دستورات مشخص `prepdocs.py` جایگزین می‌کند
- **📚 agents.md resources**: پیوندهای مستندات را به مستندات فعلی Azure AI Agent Service و راه‌اندازی سریع به‌روز کرد
- **📋 agents.md Next Steps table**: پیوند AI Workshop Lab را برای پوشش کامل فصل اضافه کرد

#### فایل‌های به‌روزرسانی‌شده
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
**این نسخه ناوبری فصل‌ها در README.md را با یک قالب جدول بهبود‌یافته ارتقا می‌دهد.**

#### تغییرات
- **Course Map Table**: با لینک‌های مستقیم درس‌ها، برآوردهای زمان و رتبه‌بندی پیچیدگی بهبود یافت
- **Folder Cleanup**: پوشه‌های قدیمی زائد (deployment/, getting-started/, pre-deployment/, troubleshooting/) حذف شدند
- **Link Validation**: تمامی 21+ لینک داخلی در جدول Course Map بررسی شدند

### [v3.16.0] - 2026-02-05

#### به‌روزرسانی نام محصول
**این نسخه مراجع محصول را با برندینگ فعلی مایکروسافت هماهنگ می‌کند.**

#### تغییرات
- **Microsoft Foundry → Microsoft Foundry**: تمامی ارجاعات در فایل‌های غیرترجمه‌شده به‌روز شدند
- **Azure AI Agent Service → Foundry Agents**: نام سرویس برای بازتاب برندینگ فعلی به Foundry Agents به‌روزرسانی شد

#### فایل‌های به‌روزرسانی‌شده
- `README.md` - صفحه اصلی دوره
- `changelog.md` - تاریخچه نسخه‌ها
- `course-outline.md` - ساختار دوره
- `docs/chapter-02-ai-development/agents.md` - راهنمای عوامل هوش مصنوعی
- `examples/README.md` - مستندات مثال‌ها
- `workshop/README.md` - صفحه فرود کارگاه
- `workshop/docs/index.md` - فهرست کارگاه
- `workshop/docs/instructions/*.md` - تمام فایل‌های دستورالعمل کارگاه

### [v3.15.0] - 2026-02-05

#### بازساخت عمده مخزن: نام‌گذاری پوشه‌ها بر اساس فصل
**این نسخه مستندات را به پوشه‌های اختصاصی فصل‌بندی‌شده بازساخت می‌کند تا ناوبری واضح‌تری فراهم آید.**

#### تغییر نام پوشه‌ها
پوشه‌های قدیمی با پوشه‌های شماره‌گذاری‌شده فصل جایگزین شدند:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- اضافه‌شده: `docs/chapter-05-multi-agent/`

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

#### اضافه‌شده
- **📚 فایل‌های README فصل**: در هر پوشه فصل یک README.md ایجاد شد که شامل:
  - اهداف یادگیری و مدت زمان
  - جدول درس‌ها با توضیحات
  - دستورات شروع سریع
  - ناوبری به سایر فصل‌ها

#### تغییرات
- **🔗 به‌روزرسانی تمام لینک‌های داخلی**: بیش از 78 مسیر در تمام فایل‌های مستندات به‌روز شدند
- **🗺️ README.md اصلی**: نقشه دوره با ساختار جدید فصل‌ها به‌روزرسانی شد
- **📝 examples/README.md**: ارجاعات متقابل به پوشه‌های فصل به‌روزرسانی شد

#### حذف‌شده
- ساختار پوشه قدیمی (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### بازساخت مخزن: ناوبری فصل‌ها
**این نسخه فایل‌های README ناوبری فصل را اضافه کرد (که توسط v3.15.0 جایگزین شد).**

---

### [v3.13.0] - 2026-02-05

#### راهنمای جدید عوامل هوش مصنوعی
**این نسخه یک راهنمای جامع برای استقرار عوامل هوش مصنوعی با Azure Developer CLI اضافه می‌کند.**

#### اضافه‌شده
- **🤖 docs/microsoft-foundry/agents.md**: راهنمای کامل که شامل:
  - عوامل هوش مصنوعی چیستند و چه تفاوتی با چت‌بات‌ها دارند
  - سه قالب شروع سریع عامل (Foundry Agents، Prompty، RAG)
  - الگوهای معماری عامل (عامل واحد، RAG، چندعاملی)
  - پیکربندی و سفارشی‌سازی ابزارها
  - مانیتورینگ و ردیابی متریک‌ها
  - ملاحظات هزینه و بهینه‌سازی
  - سناریوهای رایج رفع اشکال
  - سه تمرین عملی با معیارهای موفقیت

#### ساختار محتوا
- **مقدمه**: مفاهیم عامل‌ها برای مبتدیان
- **شروع سریع**: استقرار عوامل با `azd init --template get-started-with-ai-agents`
- **الگوهای معماری**: نمودارهای تصویری الگوهای عامل
- **پیکربندی**: تنظیم ابزارها و متغیرهای محیطی
- **مانیتورینگ**: یکپارچه‌سازی Application Insights
- **تمرین‌ها**: یادگیری عملی تدریجی (هر کدام 20-45 دقیقه)

---

### [v3.12.0] - 2026-02-05

#### به‌روزرسانی محیط DevContainer
**این نسخه پیکربندی کانتینر توسعه را با ابزارهای مدرن و تنظیمات پیش‌فرض بهتر برای تجربه یادگیری AZD به‌روزرسانی می‌کند.**

#### تغییرات
- **🐳 تصویر پایه**: از `python:3.12-bullseye` به `python:3.12-bookworm` (آخرین نسخه پایدار Debian) ارتقا یافت
- **📛 نام کانتینر**: از "Python 3" به "AZD for Beginners" تغییر نام داده شد برای وضوح بیشتر

#### اضافه‌شده
- **🔧 ویژگی‌های جدید Dev Container**:
  - `azure-cli` با پشتیبانی Bicep فعال
  - `node:20` (نسخه LTS برای قالب‌های AZD)
  - `github-cli` برای مدیریت قالب‌ها
  - `docker-in-docker` برای استقرار برنامه‌های کانتینری

- **🔌 فوروارد پورت‌ها**: پورت‌های پیش‌پیکربندی‌شده برای توسعه رایج:
  - 8000 (پیش‌نمایش MkDocs)
  - 3000 (وب‌اپ‌ها)
  - 5000 (Python Flask)
  - 8080 (APIها)

- **🧩 اکستنشن‌های جدید VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense پیشرفته پایتون
  - `ms-azuretools.vscode-azurefunctions` - پشتیبانی از Azure Functions
  - `ms-azuretools.vscode-docker` - پشتیبانی از Docker
  - `ms-azuretools.vscode-bicep` - پشتیبانی از زبان Bicep
  - `ms-azure-devtools.azure-resource-groups` - مدیریت منابع Azure
  - `yzhang.markdown-all-in-one` - ویرایش Markdown
  - `DavidAnson.vscode-markdownlint` - بررسی سبک Markdown
  - `bierner.markdown-mermaid` - پشتیبانی نمودارهای Mermaid
  - `redhat.vscode-yaml` - پشتیبانی YAML (برای azure.yaml)
  - `eamodio.gitlens` - مصورسازی Git
  - `mhutchie.git-graph` - تاریخچه Git

- **⚙️ تنظیمات VS Code**: تنظیمات پیش‌فرض برای مفسر پایتون، فرمت در ذخیره و حذف فاصله‌های اضافی اضافه شد

- **📦 به‌روزرسانی requirements-dev.txt**:
  - افزوده شدن پلاگین فشرده‌سازی MkDocs
  - افزوده شدن pre-commit برای کیفیت کد
  - افزوده شدن بسته‌های Azure SDK (azure-identity, azure-mgmt-resource)

#### رفع شد
- **دستور پس از ایجاد**: اکنون نصب AZD و Azure CLI را در شروع کانتینر بررسی می‌کند

---

### [v3.11.0] - 2026-02-05

#### بازنگری README مناسب برای مبتدیان
**این نسخه README.md را بطور قابل توجهی برای تازه‌واردان قابل دسترس‌تر می‌کند و منابع ضروری برای توسعه‌دهندگان AI اضافه می‌کند.**

#### اضافه‌شده
- **🆚 مقایسه Azure CLI و AZD**: توضیح واضح درباره زمان استفاده از هر ابزار با مثال‌های کاربردی
- **🌟 لینک‌های عالی AZD**: لینک‌های مستقیم به گالری قالب‌های جامعه و منابع مشارکت:
  - [گالری Awesome AZD](https://azure.github.io/awesome-azd/) - بیش از 200 قالب آماده برای استقرار
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - مشارکت جامعه
- **🎯 راهنمای شروع سریع**: بخش شروع سریع ساده‌شده در 3 گام (نصب → ورود → استقرار)
- **📊 جدول ناوبری مبتنی بر تجربه**: راهنمایی واضح درباره نقطه شروع بر اساس تجربه توسعه‌دهنده

#### تغییرات
- **ساختار README**: برای افشای تدریجی بازسازی شد - اطلاعات کلیدی ابتدا
- **بخش معرفی**: بازنویسی برای توضیح "جادوی `azd up`" برای مبتدیان مطلق
- **حذف محتوای تکراری**: بخش رفع اشکال تکراری حذف شد
- **دستورات رفع اشکال**: مرجع `azd logs` اصلاح شد تا از دستور معتبر `azd monitor --logs` استفاده کند

#### رفع شد
- **🔐 دستورات احراز هویت**: `azd auth login` و `azd auth logout` به cheat-sheet.md اضافه شدند
- **ارجاعات دستور نامعتبر**: مراجع باقی‌مانده به `azd logs` از بخش رفع اشکال README حذف شدند

#### نکات
- **دامنه**: تغییرات در README.md اصلی و resources/cheat-sheet.md اعمال شده‌اند
- **گروه هدف**: بهبودها مخصوصاً برای توسعه‌دهندگانی که با AZD آشنا نیستند اعمال شده‌اند

---

### [v3.10.0] - 2026-02-05

#### به‌روزرسانی دقت دستورات Azure Developer CLI
**این نسخه دستورهای غیرموجود AZD را در سراسر مستندات اصلاح می‌کند تا همه مثال‌های کد از نحو معتبر Azure Developer CLI استفاده کنند.**

#### رفع شد
- **🔧 حذف دستورهای غیرموجود AZD**: بررسی و اصلاح جامع دستورهای نامعتبر:
  - `azd logs` (وجود ندارد) → جایگزین با `azd monitor --logs` یا جایگزین‌های Azure CLI
  - `azd service` subcommands (وجود ندارد) → جایگزین با `azd show` و Azure CLI
  - `azd infra import/export/validate` (وجود ندارد) → حذف یا جایگزینی با گزینه‌های معتبر
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` فلگ‌ها (وجود ندارد) → حذف شدند
  - `azd provision --what-if/--rollback` فلگ‌ها (وجود ندارد) → به‌روزرسانی برای استفاده از `--preview`
  - `azd config validate` (وجود ندارد) → جایگزین با `azd config list`
  - `azd info`, `azd history`, `azd metrics` (وجود ندارد) → حذف شدند

- **📚 فایل‌هایی که با اصلاحات دستوری به‌روزرسانی شدند**:
  - `resources/cheat-sheet.md`: بازنگری عمده مرجع دستورات
  - `docs/deployment/deployment-guide.md`: اصلاح استراتژی‌های بازگشت و استقرار
  - `docs/troubleshooting/debugging.md`: اصلاح بخش‌های تحلیل لاگ
  - `docs/troubleshooting/common-issues.md`: به‌روزرسانی دستورات رفع اشکال
  - `docs/troubleshooting/ai-troubleshooting.md`: اصلاح بخش اشکال‌زدایی AZD
  - `docs/getting-started/azd-basics.md`: اصلاح دستورات مانیتورینگ
  - `docs/getting-started/first-project.md`: به‌روزرسانی مثال‌های مانیتورینگ و اشکال‌زدایی
  - `docs/getting-started/installation.md`: اصلاح مثال‌های help و version
  - `docs/pre-deployment/application-insights.md`: اصلاح دستورات مشاهده لاگ
  - `docs/pre-deployment/coordination-patterns.md`: اصلاح دستورات اشکال‌زدایی عامل

- **📝 به‌روزرسانی مرجع نسخه**:
  - `docs/getting-started/installation.md`: نسخه سخت‌کدن `1.5.0` به `1.x.x` عمومی با لینک به ریلیزها تغییر یافت

#### تغییرات
- **استراتژی‌های بازگشت**: مستندات به استفاده از بازگشت مبتنی بر Git به‌روزرسانی شدند (AZD بازگشت بومی ندارد)
- **مشاهده لاگ**: مراجع `azd logs` با `azd monitor --logs`، `azd monitor --live` و دستورات Azure CLI جایگزین شدند
- **بخش عملکرد**: فلگ‌های ناموجود مربوط به استقرار موازی/افزایشی حذف شدند و جایگزین‌های معتبر ارائه شد

#### جزئیات فنی
- **دستورات معتبر AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **فلگ‌های معتبر azd monitor**: `--live`, `--logs`, `--overview`
- **قابلیت‌های حذف‌شده**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### یادداشت‌ها
- **تأیید**: دستورات در برابر Azure Developer CLI v1.23.x اعتبارسنجی شدند

---

### [v3.9.0] - 2026-02-05

#### تکمیل کارگاه و به‌روزرسانی کیفیت مستندات
**این نسخه ماژول‌های تعاملی کارگاه را کامل می‌کند، تمامی لینک‌های شکسته مستندات را اصلاح می‌کند و کیفیت کلی محتوا را برای توسعه‌دهندگان هوش مصنوعی که از Microsoft AZD استفاده می‌کنند بهبود می‌بخشد.**

#### افزوده‌شده
- **📝 CONTRIBUTING.md**: سند جدید راهنمای مشارکت با:
  - دستورالعمل‌های واضح برای گزارش مشکلات و پیشنهاد تغییرات
  - استانداردهای مستندسازی برای محتوای جدید
  - راهنمای نمونه‌های کد و قراردادهای پیام‌های commit
  - اطلاعات درباره مشارکت جامعه

#### تکمیل‌شده
- **🎯 ماژول کارگاه ۷ (جمع‌بندی)**: ماژول جمع‌بندی به‌طور کامل تکمیل شده با:
  - خلاصه جامع از دستاوردهای کارگاه
  - بخش مفاهیم کلیدی تسلط یافته شامل AZD، قالب‌ها و Microsoft Foundry
  - توصیه‌هایی برای ادامه مسیر یادگیری
  - تمرین‌های چالشی کارگاه با درجه‌بندی دشواری
  - لینک‌های بازخورد و پشتیبانی جامعه

- **📚 ماژول کارگاه ۳ (بکا‌ن‌سازی)**: اهداف یادگیری به‌روز شده با:
  - راهنمای فعال‌سازی GitHub Copilot با سرورهای MCP
  - درک ساختار پوشه‌های قالب‌های AZD
  - الگوهای سازماندهی Infrastructure-as-code (Bicep)
  - دستورالعمل‌های آزمایشگاه عملی

- **🔧 ماژول کارگاه ۶ (تخریب)**: تکمیل‌شده با:
  - اهداف پاکسازی منابع و مدیریت هزینه
  - استفاده از `azd down` برای پاک‌سازی ایمن زیرساخت
  - راهنمای بازیابی سرویس‌های شناختی حذف‌شده نرم
  - پیشنهادات کاوش اضافی برای GitHub Copilot و Azure Portal

#### اصلاح‌شده
- **🔗 اصلاح لینک‌های شکسته**: بیش از 15 لینک داخلی شکسته مستندات حل شد:
  - `docs/ai-foundry/ai-model-deployment.md`: مسیرها به microsoft-foundry-integration.md اصلاح شد
  - `docs/troubleshooting/ai-troubleshooting.md`: مسیرهای ai-model-deployment.md و production-ai-practices.md اصلاح شدند
  - `docs/getting-started/first-project.md`: cicd-integration.md که وجود نداشت با deployment-guide.md جایگزین شد
  - `examples/retail-scenario.md`: مسیرهای FAQ و راهنمای عیب‌یابی اصلاح شدند
  - `examples/container-app/microservices/README.md`: مسیرهای صفحه اصلی دوره و راهنمای استقرار اصلاح شدند
  - `resources/faq.md` و `resources/glossary.md`: ارجاعات فصل AI به‌روزرسانی شدند
  - `course-outline.md`: ارجاعات راهنمای مدرس و آزمایشگاه کارگاه AI اصلاح شدند

- **📅 بنر وضعیت کارگاه**: بنر وضعیت از «در حال ساخت» به وضعیت فعال کارگاه با تاریخ فوریه ۲۰۲۶ به‌روزرسانی شد

- **🔗 ناوبری کارگاه**: لینک‌های ناوبری شکسته در README.md کارگاه که به پوشه lab-1-azd-basics اشاره می‌کردند و وجود نداشتند اصلاح شدند

#### تغییر یافته
- **ارائه کارگاه**: هشدار «under construction» حذف شد، کارگاه اکنون کامل و آماده استفاده است
- **تناسق ناوبری**: اطمینان حاصل شد که همه ماژول‌های کارگاه ناوبری بین ماژولی مناسب دارند
- **ارجاعات مسیر یادگیری**: ارجاعات فصل‌ها به مسیرهای صحیح microsoft-foundry به‌روزرسانی شدند

#### تایید شده
- ✅ همه فایل‌های markdown انگلیسی لینک‌های داخلی معتبری دارند
- ✅ ماژول‌های کارگاه 0-7 با اهداف یادگیری کامل شده‌اند
- ✅ ناوبری بین فصول و ماژول‌ها به‌درستی کار می‌کند
- ✅ محتوا برای توسعه‌دهندگان هوش مصنوعی که از Microsoft AZD استفاده می‌کنند مناسب است
- ✅ زبان و ساختار مناسب مبتدیان در سراسر محتوا حفظ شده است
- ✅ CONTRIBUTING.md راهنمای روشن برای مشارکت‌کنندگان جامعه ارائه می‌دهد

#### پیاده‌سازی فنی
- **اعتبارسنجی لینک**: اسکریپت خودکار PowerShell تمامی لینک‌های داخلی با پسوند .md را بررسی کرد
- **ممیزی محتوا**: بازبینی دستی برای تکمیل بودن کارگاه و مناسب بودن برای مبتدیان انجام شد
- **سیستم ناوبری**: الگوهای ناوبری فصل‌ها و ماژول‌ها به‌طور یکسان پیاده‌سازی شدند

#### یادداشت‌ها
- **دامنه**: تغییرات فقط در مستندات انگلیسی اعمال شده‌اند
- **ترجمه‌ها**: پوشه‌های ترجمه در این نسخه به‌روزرسانی نشدند (ترجمه خودکار بعداً همگام‌سازی می‌شود)
- **مدت زمان کارگاه**: کارگاه کامل اکنون 3-4 ساعت یادگیری عملی ارائه می‌دهد

---

### [v3.8.0] - 2025-11-19

#### مستندات پیشرفته: مانیتورینگ، امنیت و الگوهای چندعامل
**این نسخه درس‌های جامع با درجه A درباره یکپارچه‌سازی Application Insights، الگوهای احراز هویت و هماهنگی چندعامل برای استقرارهای تولیدی اضافه می‌کند.**

#### افزوده‌شده
- **📊 درس یکپارچه‌سازی Application Insights**: در `docs/pre-deployment/application-insights.md`:
  - استقرار متمرکز بر AZD با فراهم‌سازی خودکار
  - قالب‌های کامل Bicep برای Application Insights + Log Analytics
  - برنامه‌های Python عملی با تله‌متری سفارشی (بیش از 1,200 خط)
  - الگوهای مانیتورینگ AI/LLM (ردیابی توکن/هزینه مدل‌های Microsoft Foundry)
  - 6 نمودار Mermaid (معماری، tracing توزیع‌شده، جریان تله‌متری)
  - 3 تمرین عملی (هشدارها، داشبوردها، مانیتورینگ AI)
  - مثال‌های پرس‌وجوی Kusto و استراتژی‌های بهینه‌سازی هزینه
  - پخش زنده معیارها و اشکال‌زدایی در زمان واقعی
  - زمان یادگیری 40-50 دقیقه با الگوهای آماده تولید

- **🔐 درس الگوهای احراز هویت و امنیت**: در `docs/getting-started/authsecurity.md`:
  - 3 الگوی احراز هویت (connection strings، Key Vault، managed identity)
  - قالب‌های زیرساخت کامل Bicep برای استقرارهای امن
  - کد برنامه Node.js با یکپارچه‌سازی Azure SDK
  - 3 تمرین کامل (فعال‌سازی managed identity، user-assigned identity، گردش کلید Key Vault)
  - بهترین شیوه‌های امنیتی و پیکربندی‌های RBAC
  - راهنمای عیب‌یابی و تحلیل هزینه
  - الگوهای احراز هویت بدون رمز عبور آماده تولید

- **🤖 درس الگوهای هماهنگی چندعامل**: در `docs/pre-deployment/coordination-patterns.md`:
  - 5 الگوی هماهنگی (پیاپی، موازی، سلسله‌مراتبی، رویدادمحور، اجماع)
  - پیاده‌سازی کامل سرویس ارکستریتور (Python/Flask، بیش از 1,500 خط)
  - 3 پیاده‌سازی عامل تخصصی (پژوهش، نویسنده، ویراستار)
  - یکپارچه‌سازی Service Bus برای صف‌بندی پیام
  - مدیریت حالت با Cosmos DB برای سیستم‌های توزیع‌شده
  - 6 نمودار Mermaid نمایش‌دهنده تعاملات عوامل
  - 3 تمرین پیشرفته (مدیریت تایم‌اوت، منطق retry، circuit breaker)
  - تحلیل هزینه (240-565 دلار/ماه) با استراتژی‌های بهینه‌سازی
  - یکپارچه‌سازی Application Insights برای مانیتورینگ

#### بهبود یافته
- **فصل پیش‌استقرار**: اکنون شامل الگوهای جامعی برای مانیتورینگ و هماهنگی است
- **فصل شروع کار**: با الگوهای حرفه‌ای احراز هویت تقویت شده است
- **آمادگی تولید**: پوشش کامل از امنیت تا قابلیت مشاهده فراهم شده است
- **طرح درس دوره**: به‌روزرسانی برای ارجاع به درس‌های جدید در فصل‌های 3 و 6

#### تغییر یافته
- **پیشرفت یادگیری**: ادغام بهتر امنیت و مانیتورینگ در سراسر دوره
- **کیفیت مستندات**: استانداردهای درجه A (95-97%) در درس‌های جدید حفظ شد
- **الگوهای تولید**: پوشش کامل انتها به انتها برای استقرارهای سازمانی

#### بهبودها
- **تجربه توسعه‌دهنده**: مسیر واضح از توسعه تا مانیتورینگ تولید فراهم شده است
- **استانداردهای امنیتی**: الگوهای حرفه‌ای برای احراز هویت و مدیریت اسرار
- **قابلیت مشاهده**: یکپارچه‌سازی کامل Application Insights با AZD
- **بارهای کاری AI**: مانیتورینگ تخصصی برای مدل‌های Microsoft Foundry و سیستم‌های چندعامله

#### تایید شده
- ✅ همه درس‌ها شامل کد کاربردی کامل هستند (نه قطعات کد ناقص)
- ✅ نمودارهای Mermaid برای یادگیری بصری (جمعاً 19 نمودار در 3 درس)
- ✅ تمرین‌های عملی با مراحل تأیید (جمعاً 9 تمرین)
- ✅ قالب‌های Bicep آماده تولید که از طریق `azd up` قابل استقرار هستند
- ✅ تحلیل هزینه و استراتژی‌های بهینه‌سازی
- ✅ راهنماهای عیب‌یابی و بهترین شیوه‌ها
- ✅ نقاط بررسی دانش با دستورات تأیید

#### نتایج درجه‌بندی مستندات
- **docs/pre-deployment/application-insights.md**: - راهنمای جامع مانیتورینگ
- **docs/getting-started/authsecurity.md**: - الگوهای امنیتی حرفه‌ای
- **docs/pre-deployment/coordination-patterns.md**: - معماری‌های چندعامل پیشرفته
- **محتوای جدید کلی**: - استانداردهای کیفیت بالا و یکپارچه

#### پیاده‌سازی فنی
- **Application Insights**: Log Analytics + تله‌متری سفارشی + tracing توزیع‌شده
- **احراز هویت**: Managed Identity + Key Vault + الگوهای RBAC
- **چندعامل**: Service Bus + Cosmos DB + Container Apps + ارکستراسیون
- **مانیتورینگ**: معیارهای زنده + پرس‌وجوهای Kusto + هشدارها + داشبوردها
- **مدیریت هزینه**: استراتژی‌های نمونه‌گیری، سیاست‌های نگهداری، کنترل‌های بودجه

### [v3.7.0] - 2025-11-19

#### بهبود کیفیت مستندات و مثال جدید Microsoft Foundry Models
**این نسخه کیفیت مستندات در سراسر مخزن را ارتقا می‌دهد و یک مثال کامل استقرار Microsoft Foundry Models با رابط مکالمه gpt-4.1 اضافه می‌کند.**

#### افزوده‌شده
- **🤖 مثال گفتگو با Microsoft Foundry Models**: استقرار کامل gpt-4.1 با پیاده‌سازی عملی در `examples/azure-openai-chat/`:
  - زیرساخت کامل Microsoft Foundry Models (استقرار مدل gpt-4.1)
  - رابط خط فرمان Python برای گفتگو با تاریخچه مکالمه
  - یکپارچه‌سازی Key Vault برای ذخیره امن کلیدهای API
  - ردیابی مصرف توکن و برآورد هزینه
  - محدودسازی نرخ و مدیریت خطاها
  - README جامع با راهنمای استقرار 35-45 دقیقه‌ای
  - 11 فایل آماده تولید (قالب‌های Bicep، برنامه Python، پیکربندی)
- **📚 تمرین‌های مستندسازی**: تمرین‌های عملی به راهنمای پیکربندی اضافه شدند:
  - تمرین 1: پیکربندی چندمحیطی (15 دقیقه)
  - تمرین 2: تمرین مدیریت اسرار (10 دقیقه)
  - معیارهای موفقیت واضح و مراحل تأیید
- **✅ تأیید استقرار**: بخش تأیید به راهنمای استقرار اضافه شد:
  - روش‌های بررسی سلامت
  - چک‌لیست معیارهای موفقیت
  - خروجی‌های مورد انتظار برای همه دستورات استقرار
  - مرجع سریع عیب‌یابی

#### بهبود یافته
- **examples/README.md**: به کیفیت درجه A (93%) به‌روزرسانی شد:
  - افزودن azure-openai-chat به همه بخش‌های مرتبط
  - به‌روزرسانی شمار نمونه‌های محلی از 3 به 4
  - اضافه‌شدن به جدول نمونه‌های برنامه AI
  - یکپارچه‌سازی در Quick Start برای کاربران میانی
  - اضافه‌شدن به بخش قالب‌های Microsoft Foundry
  - به‌روزرسانی ماتریس مقایسه و بخش‌های یافته‌های فناوری
- **کیفیت مستندات**: از B+ (87%) → A- (92%) در پوشه docs بهبود یافت:
  - افزودن خروجی‌های مورد انتظار به نمونه‌های دستورات حیاتی
  - شامل کردن مراحل تأیید برای تغییرات پیکربندی
  - تقویت یادگیری عملی با تمرین‌های کاربردی

#### تغییر یافته
- **پیشرفت یادگیری**: ادغام بهتر مثال‌های AI برای یادگیرندگان میانی
- **ساختار مستندات**: تمرین‌های عملی کاربردی‌تر با نتایج واضح
- **فرآیند تأیید**: معیارهای موفقیت صریح به گردش‌کاری‌های کلیدی اضافه شد

#### بهبودها
- **تجربه توسعه‌دهنده**: استقرار Microsoft Foundry Models اکنون 35-45 دقیقه طول می‌کشد (در مقابل 60-90 برای گزینه‌های پیچیده‌تر)
- **شفافیت هزینه**: برآورد هزینه واضح ($50-200/month) برای مثال Microsoft Foundry Models
- **مسیر یادگیری**: توسعه‌دهندگان AI نقطه ورود واضح با azure-openai-chat دارند
- **استانداردهای مستندسازی**: خروجی‌های مورد انتظار و مراحل تأیید یکسان شدند

#### تایید شده
- ✅ مثال Microsoft Foundry Models با `azd up` به‌طور کامل عملی و کارا است
- ✅ همه 11 فایل پیاده‌سازی از نظر نحو صحیح هستند
- ✅ دستورالعمل‌های README با تجربه واقعی استقرار مطابقت دارند
- ✅ لینک‌های مستندات در بیش از 8 مکان به‌روز شدند
- ✅ فهرست مثال‌ها به‌درستی 4 مثال محلی را نشان می‌دهد
- ✅ هیچ لینک خارجی تکراری در جداول وجود ندارد
- ✅ همه ارجاعات ناوبری صحیح هستند

#### پیاده‌سازی فنی
- **معماری Microsoft Foundry Models**: gpt-4.1 + Key Vault + الگوی Container Apps
- **امنیت**: آماده Managed Identity، اسرار در Key Vault
- **مانیتورینگ**: یکپارچه‌سازی Application Insights
- **مدیریت هزینه**: ردیابی توکن و بهینه‌سازی مصرف
- **استقرار**: یک دستور `azd up` برای راه‌اندازی کامل

### [v3.6.0] - 2025-11-19

#### به‌روزرسانی عمده: مثال‌های استقرار Container App
**این نسخه مثال‌های جامع و آماده تولید برای استقرار برنامه‌های کانتینری با استفاده از Azure Developer CLI (AZD) را معرفی می‌کند، همراه با مستندسازی کامل و ادغام در مسیر یادگیری.**

#### افزوده‌شده
- **🚀 مثال‌های Container App**: نمونه‌های محلی جدید در `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): نمای کلی کامل از استقرارهای کانتینری، راه‌اندازی سریع، الگوهای تولید و پیشرفته
  - [Simple Flask API](../../examples/container-app/simple-flask-api): API REST مناسب مبتدیان با scale-to-zero، health probes، مانیتورینگ و عیب‌یابی
  - [Microservices Architecture](../../examples/container-app/microservices): استقرار چندخدمتی آماده تولید (API Gateway، Product، Order، User، Notification)، پیام‌رسانی غیرهمزمان، Service Bus، Cosmos DB، Azure SQL، tracing توزیع‌شده، استقرار blue-green/canary
- **بهترین شیوه‌ها**: امنیت، مانیتورینگ، بهینه‌سازی هزینه و راهنمای CI/CD برای بارهای کاری کانتینری
- **نمونه‌های کد**: `azure.yaml` کامل، قالب‌های Bicep، و پیاده‌سازی خدمات چندزبانه (Python، Node.js، C#، Go)
- **آزمایش و عیب‌یابی**: سناریوهای تست انتها-به-انتها، دستورات مانیتورینگ، راهنمای عیب‌یابی

#### تغییر یافته
- **README.md**: به‌روزرسانی شد تا نمونه‌های جدید اپلیکیشن‌های کانتینری را زیر "Local Examples - Container Applications" نمایش دهد و لینک کند
- **examples/README.md**: به‌روزرسانی شد تا نمونه‌های اپلیکیشن کانتینری برجسته شوند، ورودی‌های ماتریس مقایسه اضافه شوند، و ارجاعات فناوری/معماری به‌روز شوند
- **Course Outline & Study Guide**: به‌روزرسانی شد تا به نمونه‌های جدید اپلیکیشن کانتینری و الگوهای استقرار مرتبط در فصل‌های مربوطه اشاره کند

#### Validated
- ✅ همه نمونه‌های جدید با `azd up` قابل استقرار هستند و از بهترین شیوه‌ها پیروی می‌کنند
- ✅ پیوندهای متقابل مستندات و ناوبری به‌روز شده‌اند
- ✅ نمونه‌ها از سناریوهای مبتدی تا پیشرفته، شامل میکروسرویس‌های تولیدی را پوشش می‌دهند

#### Notes
- **Scope**: فقط مستندات و مثال‌های انگلیسی
- **Next Steps**: در نسخه‌های آینده الگوهای کانتینری پیشرفته‌تر و اتوماسیون CI/CD بیشتری اضافه خواهد شد

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**این نسخه تغییر نام کامل محصول از "Microsoft Foundry" به "Microsoft Foundry" را در سراسر مستندات انگلیسی پیاده‌سازی می‌کند که منعکس‌کننده بازبرندینگ رسمی مایکروسافت است.**

#### Changed
- **🔄 Product Name Update**: بازبرندینگ کامل از "Microsoft Foundry" به "Microsoft Foundry"
  - همه ارجاعات در مستندات انگلیسی در پوشه `docs/` به‌روزرسانی شدند
  - تغییر نام پوشه: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - تغییر نام فایل: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - جمعاً: 23 ارجاع محتوایی در 7 فایل مستندات به‌روزرسانی شد

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` به `docs/microsoft-foundry/` تغییر نام یافت
  - همه ارجاعات متقابل برای بازتاب ساختار پوشه جدید به‌روزرسانی شدند
  - پیوندهای ناوبری در سراسر مستندات تأیید شدند

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - همه پیوندهای داخلی برای اشاره به نام فایل جدید به‌روزرسانی شدند

#### Updated Files
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 به‌روزرسانی پیوند ناوبری
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 ارجاع نام محصول به‌روزرسانی شد
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - قبلاً از Microsoft Foundry استفاده می‌کرد (از به‌روزرسانی‌های قبلی)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 ارجاع به‌روزرسانی شد (مرور کلی، بازخورد جامعه، مستندسازی)
  - `docs/getting-started/azd-basics.md` - 4 پیوند ارجاع متقابل به‌روزرسانی شد
  - `docs/getting-started/first-project.md` - 2 پیوند ناوبری فصل به‌روزرسانی شد
  - `docs/getting-started/installation.md` - 2 پیوند فصل بعدی به‌روزرسانی شد
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 ارجاع به‌روزرسانی شد (ناوبری، جامعه Discord)
  - `docs/troubleshooting/common-issues.md` - 1 پیوند ناوبری به‌روزرسانی شد
  - `docs/troubleshooting/debugging.md` - 1 پیوند ناوبری به‌روزرسانی شد

- **Course Structure Files** (2 files):
  - `README.md` - 17 ارجاع به‌روزرسانی شد (بررسی دوره، عناوین فصل‌ها، بخش قالب‌ها، دیدگاه‌های جامعه)
  - `course-outline.md` - 14 ارجاع به‌روزرسانی شد (مرور کلی، اهداف یادگیری، منابع فصل)

#### Validated
- ✅ هیچ ارجاع باقیمانده به مسیر پوشه "ai-foundry" در مستندات انگلیسی وجود ندارد
- ✅ هیچ ارجاع باقیمانده به نام محصول "Microsoft Foundry" در مستندات انگلیسی وجود ندارد
- ✅ همه پیوندهای ناوبری با ساختار پوشه جدید کار می‌کنند
- ✅ تغییر نام فایل‌ها و پوشه‌ها با موفقیت انجام شد
- ✅ ارجاع‌های متقابل بین فصل‌ها تأیید شدند

#### Notes
- **Scope**: تغییرات فقط در مستندات انگلیسی در پوشه `docs/` اعمال شد
- **Translations**: پوشه‌های ترجمه (`translations/`) در این نسخه به‌روزرسانی نشدند
- **Workshop**: مواد کارگاه (`workshop/`) در این نسخه به‌روزرسانی نشدند
- **Examples**: فایل‌های مثال ممکن است هنوز به نام‌گذاری قدیمی اشاره داشته باشند (در به‌روزرسانی‌های آینده رسیدگی می‌شود)
- **External Links**: URLهای خارجی و ارجاعات مخزن GitHub بدون تغییر باقی ماندند

#### Migration Guide for Contributors
If you have local branches or documentation referencing the old structure:
1. Update folder references: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update file references: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Replace product name: "Microsoft Foundry" → "Microsoft Foundry"
4. Validate all internal documentation links still work

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**این نسخه پشتیبانی جامع برای قابلیت پیش‌نمایش جدید Azure Developer CLI و بهبود تجربه کاربری کارگاه را معرفی می‌کند.**

#### Added
- **🧪 azd provision --preview Feature Documentation**: پوشش جامع قابلیت پیش‌نمایش زیرساخت جدید
  - مرجع دستور و مثال‌های استفاده در چیت‌شیت
  - ادغام دقیق در راهنمای تهیه با موارد استفاده و مزایا
  - ادغام بررسی‌های پیش از پرواز برای اعتبارسنجی امن‌تر استقرار
  - به‌روزرسانی‌های راهنمای شروع سریع با تمرکز بر استقرار ایمن
- **🚧 Workshop Status Banner**: بنر HTML حرفه‌ای که وضعیت توسعه کارگاه را نشان می‌دهد
  - طراحی گرادیان با نشانگرهای ساخت و ساز برای ارتباط واضح با کاربر
  - مهر زمان آخرین به‌روزرسانی برای شفافیت
  - طراحی ریسپانسیو موبایل برای انواع دستگاه‌ها

#### Enhanced
- **Infrastructure Safety**: قابلیت پیش‌نمایش در سراسر مستندات استقرار یکپارچه شد
- **Pre-deployment Validation**: اسکریپت‌های خودکار اکنون شامل آزمون پیش‌نمایش زیرساخت هستند
- **Developer Workflow**: توالی دستورات به‌روزرسانی شد تا پیش‌نمایش به‌عنوان بهترین شیوه گنجانده شود
- **Workshop Experience**: انتظارات واضحی برای کاربران درباره وضعیت توسعه محتوا تعیین شد

#### Changed
- **Deployment Best Practices**: جریان کاری مبتنی بر پیش‌نمایش اکنون روش پیشنهادی است
- **Documentation Flow**: اعتبارسنجی زیرساخت زودتر در فرایند یادگیری قرار گرفت
- **Workshop Presentation**: ارتباط وضعیت حرفه‌ای با جدول زمانی توسعه شفاف شد

#### Improved
- **Safety-First Approach**: اکنون تغییرات زیرساخت را می‌توان قبل از استقرار اعتبارسنجی کرد
- **Team Collaboration**: نتایج پیش‌نمایش می‌توانند برای بازبینی و تأیید به اشتراک گذاشته شوند
- **Cost Awareness**: درک بهتری از هزینه منابع قبل از تهیه فراهم شد
- **Risk Mitigation**: شکست‌های استقرار از طریق اعتبارسنجی پیشاپیش کاهش یافت

#### Technical Implementation
- **Multi-document Integration**: ویژگی پیش‌نمایش در 4 فایل کلیدی مستندسازی شد
- **Command Patterns**: نحو و مثال‌های سازگار در سراسر مستندات
- **Best Practice Integration**: پیش‌نمایش در گردش‌های کاری اعتبارسنجی و اسکریپت‌ها گنجانده شد
- **Visual Indicators**: علامت‌گذاری‌های واضح NEW برای قابل‌کشف بودن ویژگی

#### Workshop Infrastructure
- **Status Communication**: بنر HTML حرفه‌ای با استایل گرادیان
- **User Experience**: وضعیت توسعه واضح باعث جلوگیری از سردرگمی می‌شود
- **Professional Presentation**: اعتبار مخزن را حفظ کرده و در عین حال انتظارات را تعیین می‌کند
- **Timeline Transparency**: مهر زمان آخرین به‌روزرسانی اکتبر 2025 برای پاسخگویی

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**این نسخه مواد کارگاه جامع با راهنماهای تعاملی مبتنی بر مرورگر و مسیرهای یادگیری ساخت‌یافته را معرفی می‌کند.**

#### Added
- **🎥 Interactive Workshop Guide**: تجربه کارگاه مبتنی بر مرورگر با قابلیت پیش‌نمایش MkDocs
- **📝 Structured Workshop Instructions**: مسیر یادگیری هفت مرحله‌ای از کشف تا سفارشی‌سازی
  - 0-Introduction: مرور کلی کارگاه و راه‌اندازی
  - 1-Select-AI-Template: کشف و انتخاب قالب
  - 2-Validate-AI-Template: رویه‌های استقرار و اعتبارسنجی
  - 3-Deconstruct-AI-Template: درک معماری قالب
  - 4-Configure-AI-Template: پیکربندی و سفارشی‌سازی
  - 5-Customize-AI-Template: تغییرات پیشرفته و تکرارها
  - 6-Teardown-Infrastructure: پاک‌سازی و مدیریت منابع
  - 7-Wrap-up: خلاصه و گام‌های بعدی
- **🛠️ Workshop Tooling**: پیکربندی MkDocs با تم Material برای تجربه یادگیری بهبود یافته
- **🎯 Hands-On Learning Path**: روش‌شناسی سه مرحله‌ای (کشف → استقرار → سفارشی‌سازی)
- **📱 GitHub Codespaces Integration**: راه‌اندازی محیط توسعه یکپارچه

#### Enhanced
- **AI Workshop Lab**: با تجربه یادگیری ساخت‌یافته 2-3 ساعته گسترش یافت
- **Workshop Documentation**: ارائه حرفه‌ای با ناوبری و کمک‌های بصری
- **Learning Progression**: راهنمایی گام‌به‌گام روشن از انتخاب قالب تا استقرار تولید
- **Developer Experience**: ابزارهای یکپارچه برای جریان کار توسعه ساده‌شده

#### Improved
- **Accessibility**: رابط مبتنی بر مرورگر با جستجو، قابلیت کپی و تغییر تم
- **Self-Paced Learning**: ساختار کارگاه انعطاف‌پذیر برای سطوح مختلف یادگیری
- **Practical Application**: سناریوهای واقعی استقرار قالب‌های AI
- **Community Integration**: ادغام Discord برای حمایت و همکاری کارگاه

#### Workshop Features
- **Built-in Search**: کشف سریع کلیدواژه‌ها و درس‌ها
- **Copy Code Blocks**: قابلیت کپی با هاور برای تمام مثال‌های کد
- **Theme Toggle**: پشتیبانی از حالت تاریک/روشن برای ترجیحات مختلف
- **Visual Assets**: اسکرین‌شات‌ها و نمودارها برای درک بهتر
- **Help Integration**: دسترسی مستقیم به Discord برای پشتیبانی جامعه

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**این نسخه ساختار یادگیری مبتنی بر فصل جامع با ناوبری بهبود یافته در سراسر مخزن را معرفی می‌کند.**

#### Added
- **📚 Chapter-Based Learning System**: کل دوره به 8 فصل پیشرونده بازسازی شد
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Comprehensive Navigation System**: هدرها و فوترهای ناوبری یکسان در سراسر مستندات
- **🎯 Progress Tracking**: چک‌لیست تکمیل دوره و سیستم تأیید یادگیری
- **🗺️ Learning Path Guidance**: نقاط ورود واضح برای سطوح تجربه و اهداف مختلف
- **🔗 Cross-Reference Navigation**: فصل‌های مرتبط و پیش‌نیازها به‌صورت واضح پیوند داده شدند

#### Enhanced
- **README Structure**: به یک پلتفرم یادگیری ساخت‌یافته با سازمان‌دهی مبتنی بر فصل تبدیل شد
- **Documentation Navigation**: هر صفحه اکنون شامل زمینه فصل و راهنمای پیشرفت است
- **Template Organization**: مثال‌ها و قالب‌ها به فصل‌های مناسب نگاشته شدند
- **Resource Integration**: چیت‌شیت‌ها، سؤالات متداول و راهنماهای مطالعه به فصل‌های مربوط متصل شدند
- **Workshop Integration**: آزمایشگاه‌های عملی به اهداف یادگیری چندین فصل نگاشت شدند

#### Changed
- **Learning Progression**: از مستندسازی خطی به یادگیری انعطاف‌پذیر مبتنی بر فصل منتقل شد
- **Configuration Placement**: راهنمای پیکربندی به عنوان فصل 3 برای جریان یادگیری بهتر بازچینی شد
- **AI Content Integration**: محتوای مرتبط با AI بهتر در طول مسیر یادگیری یکپارچه شد
- **Production Content**: الگوهای پیشرفته در فصل 8 برای یادگیرندگان سازمانی متمرکز شدند

#### Improved
- **User Experience**: مسیرهای ناوبری و نشانگرهای پیشرفت فصل واضح‌تر شدند
- **Accessibility**: الگوهای ناوبری سازگار برای عبور آسان‌تر از دوره
- **Professional Presentation**: ساختار دوره‌ای به سبک دانشگاه برای آموزش‌های آکادمیک و شرکتی مناسب است
- **Learning Efficiency**: زمان یافتن محتوای مرتبط با سازمان‌دهی بهبود یافته کاهش یافت

#### Technical Implementation
- **Navigation Headers**: ناوبری فصل استاندارد شده در بیش از 40 فایل مستندات
- **Footer Navigation**: راهنمای پیشرفت و نشانگرهای تکمیل فصل سازگار
- **Cross-Linking**: سیستم پیوند داخلی جامع که مفاهیم مرتبط را به هم متصل می‌کند
- **Chapter Mapping**: قالب‌ها و مثال‌ها به‌وضوح با اهداف یادگیری مرتبط شدند

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: راهنمای مطالعه برای هم‌راستایی با سیستم 8 فصلی بازسازی شد
- **🎯 Chapter-Based Assessment**: هر فصل شامل اهداف یادگیری خاص و تمرینات عملی است
- **📋 Progress Tracking**: برنامه هفتگی یادگیری با نتایج قابل اندازه‌گیری و چک‌لیست‌های تکمیل
- **❓ Assessment Questions**: سوالات اعتبارسنجی دانش برای هر فصل با نتایج حرفه‌ای
- **🛠️ Practical Exercises**: فعالیت‌های عملی با سناریوهای واقعی استقرار و رفع اشکال
- **📊 Skill Progression**: پیشرفت واضح از مفاهیم پایه تا الگوهای سازمانی با تمرکز بر توسعه حرفه‌ای
- **🎓 Certification Framework**: نتایج توسعه حرفه‌ای و سیستم شناسایی جامعه
- **⏱️ Timeline Management**: برنامه زمان‌بندی ساخت‌یافته 10 هفته‌ای با اعتبارسنجی نقاط عطف

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**این نسخه راه‌حل چندعامل فروشگاهی را با نام‌گذاری بهتر عامل‌ها و مستندسازی بهبود یافته ارتقاء می‌دهد.**

#### Changed
- **Multi-Agent Terminology**: در راه‌حل چندعامل خرده‌فروشی عبارت "Cora agent" با "Customer agent" جایگزین شد تا فهم واضح‌تری فراهم شود
- **Agent Architecture**: همه مستندات، قالب‌های ARM و مثال‌های کد به منظور استفاده از نام‌گذاری سازگار "Customer agent" به‌روزرسانی شدند
- **Configuration Examples**: الگوهای پیکربندی عامل مدرن‌سازی شدند و نام‌گذاری به‌روز شد
- **Documentation Consistency**: اطمینان حاصل شد که همه ارجاعات از نام‌های توصیفی و حرفه‌ای عامل استفاده می‌کنند

#### Enhanced
- **ARM Template Package**: به‌روزرسانی retail-multiagent-arm-template با ارجاعات به عامل Customer
- **Architecture Diagrams**: تازه‌سازی نمودارهای Mermaid با نام‌گذاری به‌روز شده عامل‌ها
- **Code Examples**: کلاس‌های Python و مثال‌های پیاده‌سازی اکنون از نام‌گذاری CustomerAgent استفاده می‌کنند
- **Environment Variables**: بروزرسانی همه اسکریپت‌های استقرار برای استفاده از قراردادهای نام‌گذاری CUSTOMER_AGENT_NAME

#### بهبودها
- **Developer Experience**: نقش‌ها و مسئولیت‌های واضح‌تر عامل‌ها در مستندسازی
- **Production Readiness**: هماهنگی بهتر با قراردادهای نام‌گذاری سازمانی
- **Learning Materials**: نام‌گذاری عامل‌ها برای اهداف آموزشی قابل‌فهم‌تر شده است
- **Template Usability**: درک ساده‌تر عملکردهای عامل و الگوهای استقرار

#### جزئیات فنی
- به‌روزرسانی نمودارهای معماری Mermaid با ارجاعات CustomerAgent
- جایگزینی نام کلاس‌های CoraAgent با CustomerAgent در مثال‌های Python
- اصلاح پیکربندی‌های JSON در ARM template برای استفاده از نوع عامل "customer"
- به‌روزرسانی متغیرهای محیطی از CORA_AGENT_* به الگوهای CUSTOMER_AGENT_*
- تازه‌سازی همه فرمان‌های استقرار و پیکربندی‌های کانتینر

### [v3.0.0] - 2025-09-12

#### تغییرات بزرگ - تمرکز بر توسعه‌دهندگان هوش مصنوعی و ادغام Microsoft Foundry
**این نسخه مخزن را به یک منبع آموزشی جامع متمرکز بر هوش مصنوعی با ادغام Microsoft Foundry تبدیل می‌کند.**

#### افزوده شد
- **🤖 AI-First Learning Path**: بازساخت کامل با اولویت‌بندی توسعه‌دهندگان و مهندسان AI
- **Microsoft Foundry Integration Guide**: مستندسازی جامع برای اتصال AZD به سرویس‌های Microsoft Foundry
- **AI Model Deployment Patterns**: راهنمای دقیق در انتخاب مدل، پیکربندی و راهکارهای استقرار در تولید
- **AI Workshop Lab**: کارگاه عملی 2–3 ساعته برای تبدیل برنامه‌های AI به راه‌حل‌های قابل‌استقرار با AZD
- **Production AI Best Practices**: الگوهای مناسب سازمانی برای مقیاس‌بندی، پایش و امن‌سازی بارهای کاری AI
- **AI-Specific Troubleshooting Guide**: راهنمای جامع عیب‌یابی برای Microsoft Foundry Models، Cognitive Services و مشکلات استقرار AI
- **AI Template Gallery**: مجموعه منتخب قالب‌های Microsoft Foundry با درجه‌بندی پیچیدگی
- **Workshop Materials**: ساختار کامل کارگاه با آزمایشگاه‌های عملی و متریال مرجع

#### تقویت شد
- **README Structure**: ساختار متمرکز بر توسعه‌دهنده AI با داده‌های 45٪ علاقه جامعه از Discord مایکروسافت Foundry
- **Learning Paths**: مسیر یادگیری مخصوص توسعه‌دهنده AI در کنار مسیرهای سنتی برای دانشجویان و مهندسان DevOps
- **Template Recommendations**: قالب‌های برجسته AI شامل azure-search-openai-demo، contoso-chat، و openai-chat-app-quickstart
- **Community Integration**: پشتیبانی تقویت‌شده از جامعه Discord با کانال‌ها و بحث‌های مخصوص AI

#### تمرکز بر امنیت و تولید
- **Managed Identity Patterns**: پیکربندی‌های احراز هویت و امنیت مخصوص AI
- **Cost Optimization**: ردیابی مصرف توکن و کنترل بودجه برای بارهای کاری AI
- **Multi-Region Deployment**: استراتژی‌هایی برای استقرار جهانی برنامه‌های AI
- **Performance Monitoring**: معیارهای مخصوص AI و یکپارچه‌سازی با Application Insights

#### کیفیت مستندسازی
- **Linear Course Structure**: پیشرفت منطقی از مبتدی تا الگوهای پیشرفته استقرار AI
- **Validated URLs**: همه لینک‌های مخزن خارجی بررسی و قابل دسترسی هستند
- **Complete Reference**: همه لینک‌های مستندات داخلی اعتبارسنجی و عملیاتی شده‌اند
- **Production Ready**: الگوهای استقرار سازمانی با مثال‌های دنیای واقعی

### [v2.0.0] - 2025-09-09

#### تغییرات بزرگ - بازسازمانی مخزن و ارتقای حرفه‌ای
**این نسخه بازآرایی قابل‌توجه ساختار مخزن و ارائه محتوایی را نشان می‌دهد.**

#### افزوده شد
- **Structured Learning Framework**: همه صفحات مستندات اکنون شامل بخش‌های مقدمه، اهداف یادگیری و نتایج یادگیری هستند
- **Navigation System**: افزودن لینک‌های درس قبلی/بعدی در سراسر مستندات برای پیشروی هدایت‌شده یادگیری
- **Study Guide**: study-guide.md جامع با اهداف یادگیری، تمرین‌های عملی و مواد ارزیابی
- **Professional Presentation**: حذف همه ایموجی‌ها برای بهبود دسترس‌پذیری و ظاهر حرفه‌ای‌تر
- **Enhanced Content Structure**: سازمان‌دهی و جریان بهتر محتوای آموزشی

#### تغییر کرد
- **Documentation Format**: استانداردسازی همه مستندات با ساختار سازگار متمرکز بر یادگیری
- **Navigation Flow**: پیاده‌سازی پیشروی منطقی در کلیه مواد آموزشی
- **Content Presentation**: حذف عناصر تزئینی به نفع قالب‌بندی واضح و حرفه‌ای
- **Link Structure**: به‌روزرسانی همه لینک‌های داخلی برای پشتیبانی از سیستم مسیریابی جدید

#### بهبود یافت
- **Accessibility**: حذف وابستگی به ایموجی‌ها برای سازگاری بهتر با صفحه‌خوان‌ها
- **Professional Appearance**: ارائه‌ای پاک و سبک آکادمیک مناسب برای آموزش سازمانی
- **Learning Experience**: رویکرد ساختاریافته با اهداف و نتایج مشخص برای هر درس
- **Content Organization**: جریان منطقی بهتر و ارتباطات واضح‌تر بین موضوعات مرتبط

### [v1.0.0] - 2025-09-09

#### انتشار اولیه - مخزن آموزشی جامع AZD

#### افزوده شد
- **Core Documentation Structure**
  - مجموعه کامل راهنمای شروع سریع
  - مستندسازی جامع استقرار و تهیه منابع
  - منابع رفع اشکال و راهنماهای دیباگ دقیق
  - ابزارها و رویه‌های اعتبارسنجی پیش از استقرار

- **Getting Started Module**
  - AZD Basics: مفاهیم اصلی و اصطلاحات
  - Installation Guide: دستورالعمل‌های نصب بر اساس پلتفرم
  - Configuration Guide: پیکربندی محیط و احراز هویت
  - First Project Tutorial: راهنمای گام‌به‌گام آموزشی عملی

- **Deployment and Provisioning Module**
  - Deployment Guide: مستندسازی کامل جریان کاری
  - Provisioning Guide: زیرساخت به‌عنوان کد با Bicep
  - بهترین شیوه‌ها برای استقرارهای تولید
  - الگوهای معماری چندخدمتی

- **Pre-deployment Validation Module**
  - Capacity Planning: اعتبارسنجی در دسترس‌پذیری منابع Azure
  - SKU Selection: راهنمای جامع انتخاب سطح سرویس
  - Pre-flight Checks: اسکریپت‌های اعتبارسنجی خودکار (PowerShell و Bash)
  - ابزارهای برآورد هزینه و برنامه‌ریزی بودجه

- **Troubleshooting Module**
  - Common Issues: مشکلات متداول و راه‌حل‌ها
  - Debugging Guide: روش‌شناسی‌های سیستماتیک عیب‌یابی
  - تکنیک‌ها و ابزارهای تشخیصی پیشرفته
  - پایش عملکرد و بهینه‌سازی

- **Resources and References**
  - Command Cheat Sheet: مرجع سریع برای فرمان‌های ضروری
  - Glossary: واژه‌نامه جامع اصطلاحات و مخفف‌ها
  - FAQ: پاسخ‌های تفصیلی به سوالات متداول
  - لینک‌های منابع خارجی و ارتباطات جامعه

- **Examples and Templates**
  - مثال برنامه وب ساده
  - قالب استقرار وب‌سایت ایستا
  - پیکربندی برنامه کانتینری
  - الگوهای ادغام پایگاه‌داده
  - مثال‌های معماری میکروسرویس
  - پیاده‌سازی توابع بدون‌سرور

#### ویژگی‌ها
- **Multi-Platform Support**: راهنماهای نصب و پیکربندی برای Windows، macOS و Linux
- **Multiple Skill Levels**: محتوا برای دانشجویان تا توسعه‌دهندگان حرفه‌ای
- **Practical Focus**: مثال‌های عملی و سناریوهای دنیای واقعی
- **Comprehensive Coverage**: از مفاهیم پایه تا الگوهای سازمانی پیشرفته
- **Security-First Approach**: بهترین شیوه‌های امنیتی در سراسر محتوا ادغام شده‌اند
- **Cost Optimization**: راهنمایی برای استقرارها و مدیریت منابع با هزینه مؤثر

#### کیفیت مستندسازی
- **Detailed Code Examples**: نمونه‌های کد عملی و تست‌شده
- **Step-by-Step Instructions**: راهنمایی واضح و عملیاتی
- **Comprehensive Error Handling**: عیب‌یابی برای مسائل متداول
- **Best Practices Integration**: استانداردها و توصیه‌های صنعتی
- **Version Compatibility**: به‌روز با آخرین سرویس‌های Azure و قابلیت‌های azd

## بهبودهای آینده برنامه‌ریزی‌شده

### Version 3.1.0 (Planned)
#### گسترش پلتفرم AI
- **Multi-Model Support**: الگوهای یکپارچه‌سازی برای Hugging Face، Azure Machine Learning و مدل‌های سفارشی
- **AI Agent Frameworks**: قالب‌هایی برای استقرار LangChain، Semantic Kernel و AutoGen
- **Advanced RAG Patterns**: گزینه‌های پایگاه داده برداری فراتر از Azure AI Search (Pinecone، Weaviate و غیره)
- **AI Observability**: پایش تقویت‌شده برای عملکرد مدل، مصرف توکن و کیفیت پاسخ

#### تجربه توسعه‌دهنده
- **VS Code Extension**: تجربه توسعه یکپارچه AZD + Microsoft Foundry در VS Code
- **GitHub Copilot Integration**: تولید قالب‌های AZD با کمک AI
- **Interactive Tutorials**: تمرین‌های کدنویسی عملی با اعتبارسنجی خودکار برای سناریوهای AI
- **Video Content**: آموزش‌های ویدیویی تکمیلی برای یادگیرندگان بصری با تمرکز بر استقرارهای AI

### Version 4.0.0 (Planned)
#### الگوهای سازمانی AI
- **Governance Framework**: حاکمیت مدل AI، انطباق و ردپاهای حسابرسی
- **Multi-Tenant AI**: الگوهایی برای سرو کردن چندین مشتری با سرویس‌های AI ایزوله
- **Edge AI Deployment**: یکپارچه‌سازی با Azure IoT Edge و نمونه‌های کانتینری
- **Hybrid Cloud AI**: الگوهای استقرار چندابری و هیبرید برای بارهای کاری AI

#### ویژگی‌های پیشرفته
- **AI Pipeline Automation**: یکپارچه‌سازی MLOps با pipelineهای Azure Machine Learning
- **Advanced Security**: الگوهای Zero-trust، endpoints خصوصی و حفاظت پیشرفته در برابر تهدیدها
- **Performance Optimization**: تنظیمات و استراتژی‌های مقیاس‌بندی پیشرفته برای برنامه‌های AI با توان بالا
- **Global Distribution**: الگوهای تحویل محتوا و کش لبه برای برنامه‌های AI

### Version 3.0.0 (Planned) - Superseded by Current Release
#### پیشنهادات افزوده‌شده - اکنون در v3.0.0 پیاده‌سازی شده‌اند
- ✅ **AI-Focused Content**: ادغام جامع Microsoft Foundry (تکمیل شد)
- ✅ **Interactive Tutorials**: کارگاه عملی AI (تکمیل شد)
- ✅ **Advanced Security Module**: الگوهای امنیتی مخصوص AI (تکمیل شد)
- ✅ **Performance Optimization**: استراتژی‌های تنظیم بارهای کاری AI (تکمیل شد)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### بهبودهای کوچک - برخی در نسخه فعلی تکمیل شده‌اند
- ✅ **Additional Examples**: سناریوهای استقرار متمرکز بر AI (تکمیل شد)
- ✅ **Extended FAQ**: سوالات و عیب‌یابی خاص AI (تکمیل شد)
- **Tool Integration**: راهنماهای بهبود یافته یکپارچه‌سازی IDE و ویرایشگر
- ✅ **Monitoring Expansion**: الگوهای پایش و هشداردهی مخصوص AI (تکمیل شد)

#### هنوز برای نسخه آینده برنامه‌ریزی شده
- **Mobile-Friendly Documentation**: طراحی واکنش‌گرا برای یادگیری موبایل
- **Offline Access**: بسته‌های مستنداتی قابل دانلود
- **Enhanced IDE Integration**: افزونه VS Code برای جریان‌های کاری AZD + AI
- **Community Dashboard**: معیارهای جامعه و پیگیری مشارکت به‌صورت بلادرنگ

## مشارکت در Changelog

### گزارش تغییرات
هنگام مشارکت در این مخزن، لطفاً اطمینان حاصل کنید که موارد changelog شامل موارد زیر باشند:

1. **Version Number**: مطابق نسخه‌بندی معنایی (major.minor.patch)
2. **Date**: تاریخ انتشار یا بروزرسانی به فرمت YYYY-MM-DD
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: شرح موجز از آنچه تغییر کرده است
5. **Impact Assessment**: چگونگی تأثیر تغییرات بر کاربران موجود

### دسته‌بندی تغییرات

#### Added
- ویژگی‌های جدید، بخش‌های مستنداتی یا قابلیت‌ها
- مثال‌ها، قالب‌ها یا منابع یادگیری جدید
- ابزارها، اسکریپت‌ها یا یوتیلیتی‌های اضافی

#### Changed
- تغییرات در عملکرد یا مستندات موجود
- به‌روزرسانی‌ها برای بهبود وضوح یا دقت
- بازساخت محتوا یا سازمان‌دهی

#### Deprecated
- ویژگی‌ها یا رویکردهایی که در حال حذف تدریجی هستند
- بخش‌های مستنداتی که برنامه‌ریزی شده‌اند حذف شوند
- روش‌هایی که گزینه‌های بهتری جایگزین آن‌ها شده‌اند

#### Removed
- ویژگی‌ها، مستندات یا مثال‌هایی که دیگر مرتبط نیستند
- اطلاعات منسوخ یا رویکردهای منسوخ‌شده
- محتوای تکراری یا متحدالشکل‌شده

#### Fixed
- تصحیحات خطا در مستندات یا کد
- حل مشکلات گزارش‌شده
- بهبودهای مربوط به دقت یا عملکرد

#### Security
- بهبودها یا رفع‌های مرتبط با امنیت
- به‌روزرسانی بهترین شیوه‌های امنیتی
- رفع آسیب‌پذیری‌های امنیتی

### راهنمای نسخه‌بندی معنایی

#### Major Version (X.0.0)
- تغییرات ناسازگار که نیاز به اقدام کاربر دارند
- بازساخت قابل‌توجه محتوا یا سازمان‌دهی
- تغییراتی که رویکرد یا روش اساسی را تغییر می‌دهند

#### Minor Version (X.Y.0)
- ویژگی‌ها یا الحاقات جدید محتوا
- بهبودهایی که سازگاری عقب را حفظ می‌کنند
- مثال‌ها، ابزارها یا منابع اضافی

#### Patch Version (X.Y.Z)
- رفع اشکال و اصلاحات
- بهبودهای جزئی در محتوای موجود
- توضیحات و بهینه‌سازی‌های کوچک

## بازخورد و پیشنهادات جامعه

ما فعالانه بازخورد جامعه را برای بهبود این منبع آموزشی تشویق می‌کنیم:

### چگونه بازخورد ارائه دهیم
- **GitHub Issues**: گزارش مشکلات یا پیشنهاد بهبود (مسائل خاص AI پذیرفته می‌شوند)
- **Discord Discussions**: اشتراک‌گذاری ایده‌ها و تعامل با جامعه Microsoft Foundry
- **Pull Requests**: مشارکت در بهبود مستقیم محتوا، به‌ویژه قالب‌ها و راهنماهای AI
- **Microsoft Foundry Discord**: مشارکت در کانال #Azure برای بحث‌های AZD + AI
- **Community Forums**: مشارکت در بحث‌های گسترده‌تر توسعه‌دهندگان Azure

### دسته‌بندی بازخورد
- **AI Content Accuracy**: اصلاحات در یکپارچه‌سازی خدمات AI و اطلاعات استقرار
- **Learning Experience**: پیشنهاداتی برای بهبود جریان یادگیری توسعه‌دهنده AI
- **Missing AI Content**: درخواست‌ها برای قالب‌ها، الگوها یا مثال‌های AI اضافی
- **Accessibility**: بهبودها برای نیازهای یادگیری متنوع
- **AI Tool Integration**: پیشنهاداتی برای بهبود یکپارچه‌سازی جریان کاری توسعه AI
- **Production AI Patterns**: درخواست الگوهای استقرار سازمانی AI

### تعهد به پاسخگویی
- **Issue Response**: پاسخ در ظرف 48 ساعت برای مشکلات گزارش‌شده
- **Feature Requests**: ارزیابی ظرف یک هفته
- **Community Contributions**: بازبینی ظرف یک هفته
- **Security Issues**: اولویت فوری با پاسخ‌دهی تسریع‌شده

## برنامه نگهداری

### به‌روزرسانی‌های منظم
- **Monthly Reviews**: بررسی صحت محتوا و اعتبارسنجی لینک‌ها
- **Quarterly Updates**: افزودن و بهبود محتواهای عمده
- **Semi-Annual Reviews**: بازآرایی و تقویت جامع
- **Annual Releases**: انتشارهای نسخه بزرگ با بهبودهای قابل‌توجه

### پایش و تضمین کیفیت
- **Automated Testing**: اعتبارسنجی منظم مثال‌های کد و لینک‌ها
- **Community Feedback Integration**: ادغام منظم پیشنهادهای کاربران
- **Technology Updates**: هم‌راستایی با آخرین سرویس‌های Azure و نسخه‌های azd
- **Accessibility Audits**: بازبینی منظم برای اصول طراحی فراگیر

## سیاست پشتیبانی نسخه

### Current Version Support
- **نسخه اصلی اخیر**: پشتیبانی کامل با به‌روزرسانی‌های منظم
- **نسخه اصلی قبلی**: به‌روزرسانی‌های امنیتی و اصلاحات بحرانی برای ۱۲ ماه
- **نسخه‌های قدیمی**: فقط پشتیبانی جامعه، بدون به‌روزرسانی رسمی

### راهنمای مهاجرت
هنگامی که نسخه‌های اصلی منتشر می‌شوند، ما ارائه می‌دهیم:
- **راهنمای مهاجرت**: دستورالعمل‌های گام‌به‌گام برای انتقال
- **یادداشت‌های سازگاری**: جزئیات دربارهٔ تغییرات ناسازگار
- **پشتیبانی ابزار**: اسکریپت‌ها یا ابزارهایی برای کمک به مهاجرت
- **پشتیبانی جامعه**: انجمن‌های اختصاصی برای سوالات مربوط به مهاجرت

---

**ناوبری**
- **درس قبلی**: [راهنمای مطالعه](resources/study-guide.md)
- **درس بعدی**: بازگشت به [README اصلی](README.md)

**در جریان باشید**: این مخزن را برای اعلان‌ها دربارهٔ انتشارهای جدید و به‌روزرسانی‌های مهم مطالب آموزشی دنبال کنید.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مبدأ باید به‌عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، توصیه می‌شود از ترجمه حرفه‌ای انسانی استفاده شود. ما مسئول هیچ سوءتفاهم یا برداشت نادرستی که از استفاده از این ترجمه ناشی شود نیستیم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->