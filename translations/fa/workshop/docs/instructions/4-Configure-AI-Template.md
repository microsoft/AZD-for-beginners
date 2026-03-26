# 4. پیکربندی یک قالب

!!! tip "در پایان این ماژول شما قادر خواهید بود"

    - [ ] هدف فایل `azure.yaml` را درک کنید
    - [ ] ساختار فایل `azure.yaml` را درک کنید
    - [ ] ارزش چرخه عمر azd و `hooks` را درک کنید
    - [ ] **Lab 4:** متغیرهای محیطی را بررسی و تغییر دهید

---

!!! prompt "فایل `azure.yaml` چه کاری انجام می‌دهد؟ از یک بلوک کد استفاده کنید و آن را خط به خط توضیح دهید"

      فایل `azure.yaml` فایل **پیکربندی برای Azure Developer CLI (azd)** است. این فایل مشخص می‌کند که برنامهٔ شما چگونه باید در Azure مستقر شود، شامل زیرساخت، سرویس‌ها، هوک‌های استقرار و متغیرهای محیطی.

---

## 1. هدف و عملکرد

این `azure.yaml` فایل به‌عنوان **نقشهٔ استقرار** برای یک برنامهٔ عامل AI عمل می‌کند که:

1. **محیط را قبل از استقرار اعتبارسنجی می‌کند**
2. **سرویس‌های Azure AI را تأمین می‌کند** (AI Hub, AI Project, Search و غیره)
3. **یک برنامهٔ Python را** به Azure Container Apps مستقر می‌کند
4. **مدل‌های AI را پیکربندی می‌کند** برای هر دو عملکرد چت و embedding
5. **نظارت و ردیابی را تنظیم می‌کند** برای برنامهٔ AI
6. **سناریوهای پروژهٔ Azure AI جدید و موجود را مدیریت می‌کند**

این فایل امکان استقرار با **یک دستور** (`azd up`) از یک راه‌حل کامل عامل هوش مصنوعی را با اعتبارسنجی، تأمین منابع و پیکربندی پس از استقرار مناسب فراهم می‌کند.

??? info "برای مشاهده گسترش دهید: `azure.yaml`"

      فایل `azure.yaml` مشخص می‌کند که Azure Developer CLI چگونه باید این برنامهٔ عامل AI را در Azure مستقر و مدیریت کند. بیایید آن را خط به خط بشکنیم.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: do we need hooks? 
      # TODO: do we need all of the variables?

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

بیایید بخش به بخش فایل را مرور کنیم تا بفهمیم چه کاری انجام می‌دهد — و چرا.

### 2.1 **هدر و طرحواره (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Line 1**: برای پشتیبانی IDE و IntelliSense اعتبارسنجی طرح‌وارهٔ سرور زبان YAML را فراهم می‌کند

### 2.2 متاداده پروژه (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Line 5**: نام پروژه‌ای که توسط Azure Developer CLI استفاده می‌شود را تعریف می‌کند
- **Lines 6-7**: مشخص می‌کند که این بر پایهٔ قالب نسخهٔ 1.0.2 است
- **Lines 8-9**: نیازمند نسخهٔ 1.14.0 یا بالاتر Azure Developer CLI است

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

- **Lines 11-20**: **هوک پیش‌استقرار** - قبل از `azd up` اجرا می‌شود

      - On Unix/Linux: اسکریپت اعتبارسنجی را اجرایی کرده و آن را اجرا می‌کند
      - On Windows: اسکریپت PowerShell اعتبارسنجی را اجرا می‌کند
      - Both are interactive and will stop deployment if they fail

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
- **Lines 21-30**: **هوک پس‌تأمین** - پس از ایجاد منابع Azure اجرا می‌شود

  - اسکریپت‌های نوشتن متغیرهای محیطی را اجرا می‌کند
  - ادامهٔ استقرار حتی اگر این اسکریپت‌ها شکست بخورند (`continueOnError: true`)

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
- **Lines 31-40**: **هوک پس‌استقرار** - پس از استقرار برنامه اجرا می‌شود

  - اسکریپت‌های راه‌اندازی نهایی را اجرا می‌کند
  - ادامه می‌دهد حتی اگر اسکریپت‌ها شکست بخورند

### 2.4 پیکربندی سرویس (41-48)

این پیکربندی سرویس برنامه‌ای که قرار است مستقر شود را مشخص می‌کند.

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

- **Line 42**: سرویسی با نام "api_and_frontend" را تعریف می‌کند
- **Line 43**: به دایرکتوری `./src` برای کد منبع اشاره می‌کند
- **Line 44**: Python را به عنوان زبان برنامه‌نویسی مشخص می‌کند
- **Line 45**: Azure Container Apps را به عنوان پلتفرم میزبان استفاده می‌کند
- **Lines 46-48**: پیکربندی Docker

      - از "api_and_frontend" به عنوان نام ایمیج استفاده می‌کند
      - ایمیج Docker را از راه دور در Azure می‌سازد (نه به‌صورت محلی)

### 2.5 متغیرهای Pipeline (49-76)

این‌ها متغیرهایی هستند که به شما کمک می‌کنند تا `azd` را در خطوط لولهٔ CI/CD برای خودکارسازی اجرا کنید

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

این بخش متغیرهای محیطی مورد استفاده **در حین استقرار** را تعریف می‌کند، که بر اساس دسته‌بندی سازمان‌دهی شده‌اند:

- **نام‌های منابع Azure (Lines 51-60)**:
      - نام‌های منابع اصلی سرویس‌های Azure، مثلاً Resource Group، AI Hub، AI Project و غیره.- 
- **پرچم‌های ویژگی (Lines 61-63)**:
      - متغیرهای بولی برای فعال/غیرفعال کردن سرویس‌های خاص Azure
- **پیکربندی عامل AI (Lines 64-71)**:
      - پیکربندی برای عامل اصلی AI شامل نام، شناسه، تنظیمات استقرار، جزئیات مدل- 
- **پیکربندی embedding مدل AI (Lines 72-79)**:
      - پیکربندی مدل embedding مورد استفاده برای جستجوی برداری
- **جستجو و نظارت (Lines 80-84)**:
      - نام ایندکس جستجو، شناسه‌های منابع موجود، و تنظیمات نظارت/ردیابی

---

## 3. آشنایی با متغیرهای محیطی
متغیرهای محیطی زیر پیکربندی و رفتار استقرار شما را کنترل می‌کنند، و بر اساس هدف اصلی‌شان سازمان‌دهی شده‌اند. بیشتر متغیرها دارای مقدار پیش‌فرض منطقی هستند، اما می‌توانید آن‌ها را برای هماهنگی با نیازهای خاص یا منابع Azure موجود خود سفارشی کنید.

### 3.1 متغیرهای ضروری 

```bash title="" linenums="0"
# پیکربندی اصلی Azure
AZURE_ENV_NAME                    # نام محیط (برای نام‌گذاری منابع استفاده می‌شود)
AZURE_LOCATION                    # منطقه استقرار
AZURE_SUBSCRIPTION_ID             # اشتراک هدف
AZURE_RESOURCE_GROUP              # نام گروه منابع
AZURE_PRINCIPAL_ID                # کاربر اصلی برای RBAC

# نام‌های منابع (در صورت مشخص نشدن به‌صورت خودکار ایجاد می‌شوند)
AZURE_AIHUB_NAME                  # نام هاب Microsoft Foundry
AZURE_AIPROJECT_NAME              # نام پروژه هوش مصنوعی
AZURE_AISERVICES_NAME             # نام حساب خدمات هوش مصنوعی
AZURE_STORAGE_ACCOUNT_NAME        # نام حساب ذخیره‌سازی
AZURE_CONTAINER_REGISTRY_NAME     # نام رجیستری کانتینر
AZURE_KEYVAULT_NAME               # نام Key Vault (در صورت استفاده)
```

### 3.2 پیکربندی مدل 
```bash title="" linenums="0"
# پیکربندی مدل چت
AZURE_AI_AGENT_MODEL_NAME         # پیش‌فرض: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # پیش‌فرض: OpenAI (یا Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # پیش‌فرض: آخرین در دسترس
AZURE_AI_AGENT_DEPLOYMENT_NAME    # نام استقرار مدل چت
AZURE_AI_AGENT_DEPLOYMENT_SKU     # پیش‌فرض: استاندارد
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # پیش‌فرض: 80 (هزاران TPM)

# پیکربندی مدل تعبیه
AZURE_AI_EMBED_MODEL_NAME         # پیش‌فرض: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # پیش‌فرض: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # پیش‌فرض: آخرین در دسترس
AZURE_AI_EMBED_DEPLOYMENT_NAME    # نام استقرار برای تعبیه‌ها
AZURE_AI_EMBED_DEPLOYMENT_SKU     # پیش‌فرض: استاندارد
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # پیش‌فرض: 50 (هزاران TPM)

# پیکربندی عامل
AZURE_AI_AGENT_NAME               # نام نمایشی عامل
AZURE_EXISTING_AGENT_ID           # استفاده از عامل موجود (اختیاری)
```

### 3.3 تغییر وضعیت ویژگی
```bash title="" linenums="0"
# خدمات اختیاری
USE_APPLICATION_INSIGHTS         # پیش‌فرض: true
USE_AZURE_AI_SEARCH_SERVICE      # پیش‌فرض: false
USE_CONTAINER_REGISTRY           # پیش‌فرض: true

# پایش و ردیابی
ENABLE_AZURE_MONITOR_TRACING     # پیش‌فرض: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # پیش‌فرض: false

# پیکربندی جستجو
AZURE_AI_SEARCH_INDEX_NAME       # نام شاخص جستجو
AZURE_SEARCH_SERVICE_NAME        # نام سرویس جستجو
```

### 3.4 پیکربندی پروژه AI 
```bash title="" linenums="0"
# استفاده از منابع موجود
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # شناسه کامل منبع پروژه‌ی هوش مصنوعی موجود
AZURE_EXISTING_AIPROJECT_ENDPOINT       # نشانی URL نقطهٔ پایانی پروژه‌ی موجود
```

### 3.5 بررسی متغیرهای خود

برای مشاهده و مدیریت متغیرهای محیطی خود از Azure Developer CLI استفاده کنید:

```bash title="" linenums="0"
# نمایش همهٔ متغیرهای محیطی برای محیط جاری
azd env get-values

# دریافت یک متغیر محیطی مشخص
azd env get-value AZURE_ENV_NAME

# تنظیم یک متغیر محیطی
azd env set AZURE_LOCATION eastus

# تنظیم چندین متغیر از فایل .env
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمهٔ هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به‌عنوان منبع معتبر تلقی شود. برای اطلاعات حیاتی، ترجمهٔ حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوءتفاهم یا تفسیر نادرستی که از استفاده از این ترجمه ناشی شود مسئولیت نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->