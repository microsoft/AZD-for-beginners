# 3. تجزیه یک قالب

!!! tip "تا پایان این ماژول قادر خواهید بود"

    - [ ] GitHub Copilot را با سرورهای MCP برای پشتیبانی Azure فعال کنید
    - [ ] ساختار پوشه قالب AZD و اجزای آن را درک کنید
    - [ ] الگوهای سازمان‌دهی زیرساخت به‌عنوان‌کد (Bicep) را بررسی کنید
    - [ ] **آزمایشگاه 3:** از GitHub Copilot برای بررسی و درک معماری مخزن استفاده کنید

---


With AZD templates and the Azure Developer CLI (`azd`) we can quickly jumpstart our AI development journey with standardized repositories that provide sample code, infrastructure and configuration files - in the form of a ready-to-deploy _پروژه آماده برای استقرار_.

**اما اکنون، نیاز داریم ساختار پروژه و کدبیس را بفهمیم — و بتوانیم قالب AZD را سفارشی کنیم — بدون هیچ تجربه یا درکی قبلی از AZD!**

---

## 1. فعال‌سازی GitHub Copilot

### 1.1 نصب GitHub Copilot Chat

It's time to explore [GitHub Copilot با حالت عامل](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Now, we can use natural language to describe our task at a high level, and get assistance in execution. For this lab, we'll use the [طرح رایگان Copilot](https://github.com/github-copilot/signup) which has a monthly limit for completions and chat interactions.

The extension can be installed from the marketplace, and it is often already available in Codespaces or dev container environments. _Click `Open Chat` from the Copilot icon drop-down - and type a prompt like `What can you do?`_ - you may be prompted to log in. **GitHub Copilot Chat آماده است**.

### 1.2. Install MCP Servers

For Agent mode to be effective, it needs access to the right tools to help it retrieve knowledge or take actions. This is where MCP servers can help. We'll configure the following servers:

1. [سرور MCP آژور](../../../../../workshop/docs/instructions)
1. [سرور MCP Microsoft Docs](../../../../../workshop/docs/instructions)

To activate these:

1. Create a file called `.vscode/mcp.json` if it does not exist
1. Copy the following into that file - and start the servers!
   ```json title=".vscode/mcp.json"
   {
      "servers": {
         "Azure MCP Server": {
            "command": "npx",
            "args": [
            "-y",
            "@azure/mcp@latest",
            "server",
            "start"
            ]
         },
         "microsoft.docs.mcp": {
            "type": "http",
            "url": "https://learn.microsoft.com/api/mcp"
         }
      }
   }
   ```

??? warning "ممکن است خطایی مبنی بر نصب نبودن `npx` دریافت کنید (برای رفع روی باز کردن کلیک کنید)"

      برای رفع این مشکل، فایل `.devcontainer/devcontainer.json` را باز کنید و این خط را به بخش features اضافه کنید. سپس کانتینر را بازسازی کنید. اکنون باید `npx` نصب شده باشد.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Test GitHub Copilot Chat

**ابتدا از `azd auth login` برای احراز هویت با Azure از خط فرمان VS Code استفاده کنید. در صورتی که قصد اجرای مستقیم دستورات Azure CLI را دارید، از `az login` نیز استفاده کنید.**

You should now be able to query your Azure subscription status, and ask questions about deployed resources or configuration. Try these prompts:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

You can also ask questions about Azure documentation and get responses grounded in the Microsoft Docs MCP server. Try these prompts:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Or you can ask for code snippets to complete a task. Try this prompt.

1. `Give me a Python code example that uses AAD for an interactive chat client`

In `Ask` mode, this will provide code that you can copy-paste and try out. In `Agent` mode, this might go a step further and create the relevant resources for you - including setup scripts and documentation - to help you execute that task.

**اکنون مجهز به ابزارهای لازم برای شروع بررسی مخزن قالب هستید**

---

## 2. تجزیه معماری

??? prompt "پرسش: معماری برنامه در docs/images/architecture.png را در یک پاراگراف توضیح دهید"

      این برنامه یک اپلیکیشن چت تقویت‌شده با هوش مصنوعی است که روی Azure ساخته شده و یک معماری مدرن مبتنی بر عامل را نشان می‌دهد. راه‌حل حول یک Azure Container App می‌چرخد که کد اصلی برنامه را میزبانی می‌کند و ورودی کاربر را پردازش کرده و از طریق یک عامل هوش مصنوعی پاسخ‌های هوشمند تولید می‌کند.
      
      معماری از Microsoft Foundry Project به‌عنوان پایه قابلیت‌های هوش مصنوعی بهره می‌برد و به سرویس‌های Azure AI متصل می‌شود که مدل‌های زبانی زیرساختی (مانند gpt-4.1-mini) و قابلیت‌های عامل را فراهم می‌کنند. تعاملات کاربر از طریق یک فرانت‌اند مبتنی بر React به یک بک‌اند FastAPI جریان می‌یابد که با سرویس عامل هوش مصنوعی برای تولید پاسخ‌های متنی و متنی-زمینه‌ای ارتباط برقرار می‌کند.
      
      سیستم قابلیت‌های بازیابی دانش را از طریق جستجوی فایل یا سرویس Azure AI Search در اختیار دارد و به عامل اجازه می‌دهد تا به اسناد بارگذاری‌شده دسترسی یابد و از آنها استناد کند. برای برتری عملیاتی، معماری شامل پایش جامع از طریق Application Insights و Log Analytics Workspace برای ردیابی، لاگ‌گذاری و بهینه‌سازی عملکرد است.
      
      Azure Storage فضای ذخیره‌سازی blob برای داده‌های برنامه و بارگذاری فایل‌ها را فراهم می‌کند، در حالی که Managed Identity دسترسی ایمن بین منابع Azure را بدون ذخیره‌سازی اعتبارنامه تضمین می‌کند. کل راه‌حل برای مقیاس‌پذیری و قابلیت نگهداری طراحی شده است، به‌طوری که برنامه کانتینری‌شده به‌صورت خودکار براساس تقاضا مقیاس می‌یابد و در عین حال امنیت، پایش و قابلیت‌های CI/CD را از طریق اکوسیستم سرویس‌های مدیریت‌شده Azure فراهم می‌کند.

![معماری](../../../../../translated_images/fa/architecture.48d94861e6e6cdc0.webp)

---

## 3. ساختار مخزن

!!! prompt "پرسش: ساختار پوشه قالب را توضیح دهید. با یک نمودار سلسله‌مراتبی بصری شروع کنید."

??? info "پاسخ: نمودار سلسله‌مراتبی بصری"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 پیکربندی و راه‌اندازی
      │   ├── azure.yaml                    # پیکربندی Azure Developer CLI
      │   ├── docker-compose.yaml           # کانتینرهای توسعه محلی
      │   ├── pyproject.toml                # پیکربندی پروژه Python
      │   ├── requirements-dev.txt          # وابستگی‌های توسعه
      │   └── .devcontainer/                # تنظیمات dev container وی‌اس‌کد
      │
      ├── 🏗️ زیرساخت (infra/)
      │   ├── main.bicep                    # قالب اصلی زیرساخت
      │   ├── api.bicep                     # منابع مخصوص API
      │   ├── main.parameters.json          # پارامترهای زیرساخت
      │   └── core/                         # اجزای مدولار زیرساخت
      │       ├── ai/                       # تنظیمات سرویس‌های هوش مصنوعی
      │       ├── host/                     # زیرساخت میزبانی
      │       ├── monitor/                  # مانیتورینگ و لاگ‌گذاری
      │       ├── search/                   # تنظیم Azure AI Search
      │       ├── security/                 # امنیت و هویت
      │       └── storage/                  # پیکربندی حساب‌های ذخیره‌سازی
      │
      ├── 💻 منبع برنامه (src/)
      │   ├── api/                          # API بک‌اند
      │   │   ├── main.py                   # نقطه ورود برنامه FastAPI
      │   │   ├── routes.py                 # تعریف مسیرهای API
      │   │   ├── search_index_manager.py   # عملکرد جستجو
      │   │   ├── data/                     # مدیریت داده‌های API
      │   │   ├── static/                   # دارایی‌های استاتیک وب
      │   │   └── templates/                # قالب‌های HTML
      │   ├── frontend/                     # فرانت‌اند React/TypeScript
      │   │   ├── package.json              # وابستگی‌های Node.js
      │   │   ├── vite.config.ts            # پیکربندی ساخت Vite
      │   │   └── src/                      # کد منبع فرانت‌اند
      │   ├── data/                         # فایل‌های داده نمونه
      │   │   └── embeddings.csv            # امبدینگ‌های از پیش محاسبه‌شده
      │   ├── files/                        # فایل‌های پایگاه دانش
      │   │   ├── customer_info_*.json      # نمونه‌های داده مشتری
      │   │   └── product_info_*.md         # مستندات محصول
      │   ├── Dockerfile                    # پیکربندی کانتینر
      │   └── requirements.txt              # وابستگی‌های پایتون
      │
      ├── 🔧 خودکارسازی و اسکریپت‌ها (scripts/)
      │   ├── postdeploy.sh/.ps1           # تنظیمات پس از استقرار
      │   ├── setup_credential.sh/.ps1     # پیکربندی اعتبارنامه
      │   ├── validate_env_vars.sh/.ps1    # اعتبارسنجی محیط
      │   └── resolve_model_quota.sh/.ps1  # مدیریت سهمیه مدل
      │
      ├── 🧪 آزمایش و ارزیابی
      │   ├── tests/                        # تست‌های واحد و یکپارچه‌سازی
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # چارچوب ارزیابی عامل
      │   │   ├── evaluate.py               # اجراکننده ارزیابی
      │   │   ├── eval-queries.json         # پرس‌و‌جوهای تست
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # فضای بازی توسعه
      │   │   ├── 1-quickstart.py           # مثال‌های شروع سریع
      │   │   └── aad-interactive-chat.py   # مثال‌های احراز هویت
      │   └── airedteaming/                 # ارزیابی ایمنی هوش مصنوعی
      │       └── ai_redteaming.py          # تست تیم قرمز
      │
      ├── 📚 مستندات (docs/)
      │   ├── deployment.md                 # راهنمای استقرار
      │   ├── local_development.md          # راهنمای راه‌اندازی محلی
      │   ├── troubleshooting.md            # مشکلات رایج و رفع آنها
      │   ├── azure_account_setup.md        # پیش‌نیازهای Azure
      │   └── images/                       # دارایی‌های مستندات
      │
      └── 📄 متادیتای پروژه
         ├── README.md                     # مروری بر پروژه
         ├── CODE_OF_CONDUCT.md           # راهنمایی‌های جامعه
         ├── CONTRIBUTING.md              # راهنمای مشارکت
         ├── LICENSE                      # شرایط مجوز
         └── next-steps.md                # راهنمایی پس از استقرار
      ```

### 3.1. معماری اصلی اپ

This template follows a **full-stack web application** pattern with:

- **بک‌اند**: Python FastAPI با ادغام Azure AI
- **فرانت‌اند**: TypeScript/React با سیستم ساخت Vite
- **زیرساخت**: قالب‌های Azure Bicep برای منابع ابری
- **کانتینری شدن**: Docker برای استقرار یکنواخت

### 3.2 زیرساخت به‌عنوان‌کد (bicep)

The infrastructure layer uses **Azure Bicep** templates organized modularly:

   - **`main.bicep`**: هماهنگ‌کننده تمام منابع Azure
   - **ماژول‌های `core/`**: اجزای قابل استفاده مجدد برای سرویس‌های مختلف
      - سرویس‌های AI (Microsoft Foundry Models, AI Search)
      - میزبانی کانتینر (Azure Container Apps)
      - مانیتورینگ (Application Insights, Log Analytics)
      - امنیت (Key Vault, Managed Identity)

### 3.3 کد منبع برنامه (`src/`)

**بک‌اند API (`src/api/`)**:

- REST API مبتنی بر FastAPI
- ادغام با Foundry Agents
- مدیریت شاخص جستجو برای بازیابی دانش
- قابلیت‌های بارگذاری و پردازش فایل

**فرانت‌اند (`src/frontend/`)**:

- SPA مدرن React/TypeScript
- Vite برای توسعه سریع و ساخت‌های بهینه‌شده
- رابط چت برای تعاملات عامل

**پایگاه دانش (`src/files/`)**:

- نمونه‌های داده مشتری و محصول
- نشان‌دهنده بازیابی دانش مبتنی بر فایل
- نمونه‌هایی در فرمت JSON و Markdown


### 3.4 DevOps و خودکارسازی

**اسکریپت‌ها (`scripts/`)**:

- اسکریپت‌های کراس‌پلتفرم PowerShell و Bash
- اعتبارسنجی و راه‌اندازی محیط
- پیکربندی پس از استقرار
- مدیریت سهمیه مدل

**یکپارچه‌سازی Azure Developer CLI**:

- پیکربندی `azure.yaml` برای جریان‌های کاری `azd`
- تأمین و استقرار خودکار
- مدیریت متغیرهای محیطی

### 3.5 آزمایش و تضمین کیفیت

**چارچوب ارزیابی (`evals/`)**:

- ارزیابی عملکرد عامل
- آزمایش کیفیت پرسش-پاسخ
- خط لوله ارزیابی خودکار

**ایمنی هوش مصنوعی (`airedteaming/`)**:

- تست تیم قرمز برای ایمنی هوش مصنوعی
- اسکن آسیب‌پذیری‌های امنیتی
- شیوه‌های مسئولانه در AI

---

## 4. تبریک 🏆

شما با موفقیت از GitHub Copilot Chat همراه با سرورهای MCP استفاده کردید تا مخزن را بررسی کنید.

- [X] GitHub Copilot را برای Azure فعال کردید
- [X] معماری برنامه را درک کردید
- [X] ساختار قالب AZD را بررسی کردید

این به شما دیدی از دارایی‌های _زیرساخت به‌عنوان‌کد_ برای این قالب می‌دهد. در ادامه، به فایل پیکربندی AZD خواهیم پرداخت.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
این سند با استفاده از سرویس ترجمهٔ مبتنی بر هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان بومی‌اش باید به‌عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمهٔ حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوءتفاهم یا تفسیر نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->