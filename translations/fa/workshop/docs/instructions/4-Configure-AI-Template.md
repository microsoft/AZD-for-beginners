<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b4a16f82d68f5820d574acd8946843e4",
  "translation_date": "2025-09-24T11:02:36+00:00",
  "source_file": "workshop/docs/instructions/4-Configure-AI-Template.md",
  "language_code": "fa"
}
-->
# 4. تنظیم یک قالب

!!! tip "در پایان این ماژول شما قادر خواهید بود"

    - [ ] هدف فایل `azure.yaml` را درک کنید
    - [ ] ساختار فایل `azure.yaml` را درک کنید
    - [ ] ارزش `hooks` در چرخه عمر azd را درک کنید
    - [ ] **آزمایشگاه 3:** 

---

!!! prompt "فایل `azure.yaml` چه کاری انجام می‌دهد؟ از یک کدفنس استفاده کنید و خط به خط توضیح دهید"

      فایل `azure.yaml` **فایل پیکربندی برای Azure Developer CLI (azd)** است. این فایل مشخص می‌کند که برنامه شما چگونه باید در Azure مستقر شود، شامل زیرساخت‌ها، خدمات، هوک‌های استقرار، و متغیرهای محیطی.

---

## 1. هدف و عملکرد

این فایل `azure.yaml` به عنوان **نقشه استقرار** برای یک برنامه عامل هوش مصنوعی عمل می‌کند که:

1. **محیط را قبل از استقرار اعتبارسنجی می‌کند**
2. **خدمات هوش مصنوعی Azure را فراهم می‌کند** (AI Hub، AI Project، Search و غیره)
3. **یک برنامه پایتون را در Azure Container Apps مستقر می‌کند**
4. **مدل‌های هوش مصنوعی را برای عملکرد چت و جاسازی پیکربندی می‌کند**
5. **نظارت و ردیابی را برای برنامه هوش مصنوعی تنظیم می‌کند**
6. **با سناریوهای جدید و موجود پروژه هوش مصنوعی Azure کار می‌کند**

این فایل امکان **استقرار با یک فرمان** (`azd up`) یک راه‌حل کامل عامل هوش مصنوعی را با اعتبارسنجی مناسب، فراهم‌سازی و پیکربندی پس از استقرار فراهم می‌کند.

??? info "برای مشاهده گسترش دهید: `azure.yaml`"

      فایل `azure.yaml` مشخص می‌کند که Azure Developer CLI چگونه باید این برنامه عامل هوش مصنوعی را در Azure مستقر و مدیریت کند. بیایید خط به خط آن را بررسی کنیم.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: آیا به هوک‌ها نیاز داریم؟
      # TODO: آیا به همه متغیرها نیاز داریم؟

      name: azd-get-started-with-ai-agents
      metadata:
      template: azd-get-started-with-ai-agents@1.0.2
      requiredVersions:
      azd: ">=1.14.0"

      hooks:
      preup:
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
            interactive: true
            continueOnError: false
      windows:
            shell: pwsh
            run: ./scripts/validate_env_vars.ps1
            interactive: true
            continueOnError: false      
      postprovision:
      windows:
            shell: pwsh
            run: ./scripts/write_env.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
            continueOnError: true
            interactive: true
      postdeploy:
      windows:
            shell: pwsh
            run: ./scripts/postdeploy.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
            continueOnError: true
            interactive: true
      services:
      api_and_frontend:
      project: ./src
      language: py
      host: containerapp
      docker:
            image: api_and_frontend
            remoteBuild: true
      pipeline:
      variables:
      - AZURE_RESOURCE_GROUP
      - AZURE_AIHUB_NAME
      - AZURE_AIPROJECT_NAME
      - AZURE_AISERVICES_NAME
      - AZURE_SEARCH_SERVICE_NAME
      - AZURE_APPLICATION_INSIGHTS_NAME
      - AZURE_CONTAINER_REGISTRY_NAME
      - AZURE_KEYVAULT_NAME
      - AZURE_STORAGE_ACCOUNT_NAME
      - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
      - USE_CONTAINER_REGISTRY
      - USE_APPLICATION_INSIGHTS
      - USE_AZURE_AI_SEARCH_SERVICE
      - AZURE_AI_AGENT_NAME
      - AZURE_AI_AGENT_ID
      - AZURE_AI_AGENT_DEPLOYMENT_NAME
      - AZURE_AI_AGENT_DEPLOYMENT_SKU
      - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
      - AZURE_AI_AGENT_MODEL_NAME
      - AZURE_AI_AGENT_MODEL_FORMAT
      - AZURE_AI_AGENT_MODEL_VERSION
      - AZURE_AI_EMBED_DEPLOYMENT_NAME
      - AZURE_AI_EMBED_DEPLOYMENT_SKU
      - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
      - AZURE_AI_EMBED_MODEL_NAME
      - AZURE_AI_EMBED_MODEL_FORMAT
      - AZURE_AI_EMBED_MODEL_VERSION
      - AZURE_AI_EMBED_DIMENSIONS
      - AZURE_AI_SEARCH_INDEX_NAME
      - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
      - AZURE_EXISTING_AIPROJECT_ENDPOINT
      - AZURE_EXISTING_AGENT_ID
      - ENABLE_AZURE_MONITOR_TRACING
      - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
      ```

---

## 2. تجزیه فایل

بیایید فایل را بخش به بخش بررسی کنیم تا بفهمیم چه کاری انجام می‌دهد - و چرا.

### 2.1 **هدر و اسکیمای (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **خط 1**: اعتبارسنجی اسکیمای سرور زبان YAML را برای پشتیبانی IDE و IntelliSense فراهم می‌کند

### 2.2 متادیتای پروژه (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **خط 5**: نام پروژه‌ای که توسط Azure Developer CLI استفاده می‌شود را تعریف می‌کند
- **خطوط 6-7**: مشخص می‌کند که این بر اساس نسخه قالب 1.0.2 است
- **خطوط 8-9**: نیاز به نسخه 1.14.0 یا بالاتر Azure Developer CLI دارد

### 2.3 هوک‌های استقرار (11-40)

```yaml title="" linenums="0"
hooks:
  preup:
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
      interactive: true
      continueOnError: false
    windows:
      shell: pwsh
      run: ./scripts/validate_env_vars.ps1
      interactive: true
      continueOnError: false      
```

- **خطوط 11-20**: **هوک پیش از استقرار** - قبل از اجرای `azd up` اجرا می‌شود

      - در یونیکس/لینوکس: اسکریپت اعتبارسنجی را قابل اجرا می‌کند و آن را اجرا می‌کند
      - در ویندوز: اسکریپت اعتبارسنجی پاورشل را اجرا می‌کند
      - هر دو تعاملی هستند و در صورت شکست استقرار را متوقف می‌کنند

```yaml  title="" linenums="0"
  postprovision:
    windows:
      shell: pwsh
      run: ./scripts/write_env.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
      continueOnError: true
      interactive: true
```
- **خطوط 21-30**: **هوک پس از فراهم‌سازی** - پس از ایجاد منابع Azure اجرا می‌شود

  - اسکریپت‌های نوشتن متغیرهای محیطی را اجرا می‌کند
  - حتی اگر این اسکریپت‌ها شکست بخورند، استقرار ادامه می‌یابد (`continueOnError: true`)

```yaml title="" linenums="0"
  postdeploy:
    windows:
      shell: pwsh
      run: ./scripts/postdeploy.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
      continueOnError: true
      interactive: true
```
- **خطوط 31-40**: **هوک پس از استقرار** - پس از استقرار برنامه اجرا می‌شود

  - اسکریپت‌های تنظیم نهایی را اجرا می‌کند
  - حتی اگر اسکریپت‌ها شکست بخورند، ادامه می‌یابد

### 2.4 پیکربندی سرویس (41-48)

این بخش برنامه سرویسی که شما مستقر می‌کنید را پیکربندی می‌کند.

```yaml title="" linenums="0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- **خط 42**: یک سرویس به نام "api_and_frontend" تعریف می‌کند
- **خط 43**: به دایرکتوری `./src` برای کد منبع اشاره می‌کند
- **خط 44**: پایتون را به عنوان زبان برنامه‌نویسی مشخص می‌کند
- **خط 45**: از Azure Container Apps به عنوان پلتفرم میزبانی استفاده می‌کند
- **خطوط 46-48**: پیکربندی داکر

      - از "api_and_frontend" به عنوان نام تصویر استفاده می‌کند
      - تصویر داکر را به صورت از راه دور در Azure می‌سازد (نه به صورت محلی)

### 2.5 متغیرهای پایپ‌لاین (49-76)

این متغیرها به شما کمک می‌کنند تا `azd` را در پایپ‌لاین‌های CI/CD برای خودکارسازی اجرا کنید

```yaml title="" linenums="0"
pipeline:
  variables:
    - AZURE_RESOURCE_GROUP
    - AZURE_AIHUB_NAME
    - AZURE_AIPROJECT_NAME
    - AZURE_AISERVICES_NAME
    - AZURE_SEARCH_SERVICE_NAME
    - AZURE_APPLICATION_INSIGHTS_NAME
    - AZURE_CONTAINER_REGISTRY_NAME
    - AZURE_KEYVAULT_NAME
    - AZURE_STORAGE_ACCOUNT_NAME
    - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
    - USE_CONTAINER_REGISTRY
    - USE_APPLICATION_INSIGHTS
    - USE_AZURE_AI_SEARCH_SERVICE
    - AZURE_AI_AGENT_NAME
    - AZURE_AI_AGENT_ID
    - AZURE_AI_AGENT_DEPLOYMENT_NAME
    - AZURE_AI_AGENT_DEPLOYMENT_SKU
    - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
    - AZURE_AI_AGENT_MODEL_NAME
    - AZURE_AI_AGENT_MODEL_FORMAT
    - AZURE_AI_AGENT_MODEL_VERSION
    - AZURE_AI_EMBED_DEPLOYMENT_NAME
    - AZURE_AI_EMBED_DEPLOYMENT_SKU
    - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
    - AZURE_AI_EMBED_MODEL_NAME
    - AZURE_AI_EMBED_MODEL_FORMAT
    - AZURE_AI_EMBED_MODEL_VERSION
    - AZURE_AI_EMBED_DIMENSIONS
    - AZURE_AI_SEARCH_INDEX_NAME
    - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
    - AZURE_EXISTING_AIPROJECT_ENDPOINT
    - AZURE_EXISTING_AGENT_ID
    - ENABLE_AZURE_MONITOR_TRACING
    - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
```

این بخش متغیرهای محیطی مورد استفاده **در طول استقرار** را تعریف می‌کند، که بر اساس دسته‌بندی سازماندهی شده‌اند:

- **نام‌های منابع Azure (خطوط 51-60)**:
      - نام‌های منابع اصلی خدمات Azure مانند Resource Group، AI Hub، AI Project و غیره
- **فلگ‌های ویژگی (خطوط 61-63)**:
      - متغیرهای بولی برای فعال/غیرفعال کردن خدمات خاص Azure
- **پیکربندی عامل هوش مصنوعی (خطوط 64-71)**:
      - پیکربندی برای عامل اصلی هوش مصنوعی شامل نام، شناسه، تنظیمات استقرار، جزئیات مدل
- **پیکربندی جاسازی هوش مصنوعی (خطوط 72-79)**:
      - پیکربندی برای مدل جاسازی مورد استفاده برای جستجوی برداری
- **جستجو و نظارت (خطوط 80-84)**:
      - نام ایندکس جستجو، شناسه‌های منابع موجود، و تنظیمات نظارت/ردیابی

---

## 3. آشنایی با متغیرهای محیطی
متغیرهای محیطی زیر پیکربندی و رفتار استقرار شما را کنترل می‌کنند، که بر اساس هدف اصلی آنها سازماندهی شده‌اند. اکثر متغیرها دارای مقادیر پیش‌فرض منطقی هستند، اما شما می‌توانید آنها را برای تطابق با نیازهای خاص خود یا منابع موجود Azure سفارشی کنید.

### 3.1 متغیرهای ضروری 

```bash title="" linenums="0"
# Core Azure Configuration
AZURE_ENV_NAME                    # Environment name (used in resource naming)
AZURE_LOCATION                    # Deployment region
AZURE_SUBSCRIPTION_ID             # Target subscription
AZURE_RESOURCE_GROUP              # Resource group name
AZURE_PRINCIPAL_ID                # User principal for RBAC

# Resource Names (Auto-generated if not specified)
AZURE_AIHUB_NAME                  # AI Foundry hub name
AZURE_AIPROJECT_NAME              # AI project name
AZURE_AISERVICES_NAME             # AI services account name
AZURE_STORAGE_ACCOUNT_NAME        # Storage account name
AZURE_CONTAINER_REGISTRY_NAME     # Container registry name
AZURE_KEYVAULT_NAME               # Key Vault name (if used)
```

### 3.2 پیکربندی مدل 
```bash title="" linenums="0"
# Chat Model Configuration
AZURE_AI_AGENT_MODEL_NAME         # Default: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Default: OpenAI (or Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Default: latest available
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Deployment name for chat model
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Default: 80 (thousands of TPM)

# Embedding Model Configuration  
AZURE_AI_EMBED_MODEL_NAME         # Default: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Default: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Default: latest available
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Deployment name for embeddings
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Default: 50 (thousands of TPM)

# Agent Configuration
AZURE_AI_AGENT_NAME               # Agent display name
AZURE_EXISTING_AGENT_ID           # Use existing agent (optional)
```

### 3.3 فلگ‌های ویژگی
```bash title="" linenums="0"
# Optional Services
USE_APPLICATION_INSIGHTS         # Default: true
USE_AZURE_AI_SEARCH_SERVICE      # Default: false
USE_CONTAINER_REGISTRY           # Default: true

# Monitoring and Tracing
ENABLE_AZURE_MONITOR_TRACING     # Default: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Default: false

# Search Configuration
AZURE_AI_SEARCH_INDEX_NAME       # Search index name
AZURE_SEARCH_SERVICE_NAME        # Search service name
```

### 3.4 پیکربندی پروژه هوش مصنوعی 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 بررسی متغیرهای خود

از Azure Developer CLI برای مشاهده و مدیریت متغیرهای محیطی خود استفاده کنید:

```bash title="" linenums="0"
# View all environment variables for current environment
azd env get-values

# Get a specific environment variable
azd env get-value AZURE_ENV_NAME

# Set an environment variable
azd env set AZURE_LOCATION eastus

# Set multiple variables from a .env file
azd env set --from-file .env
```

---

