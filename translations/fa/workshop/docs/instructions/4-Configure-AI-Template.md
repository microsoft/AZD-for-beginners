# 4. پیکربندی یک قالب

!!! tip "تا پایان این ماژول می‌توانید"

    - [ ] درک هدف فایل `azure.yaml`
    - [ ] درک ساختار فایل `azure.yaml`
    - [ ] درک اهمیت `hooks` چرخه‌عمر azd
    - [ ] **تمرین 4:** بررسی و تغییر متغیرهای محیطی

---

!!! prompt "فایل `azure.yaml` چه کاری انجام می‌دهد؟ از یک بلوک کد استفاده کنید و خط به خط توضیح دهید"

      فایل `azure.yaml` فایل **پیکربندی برای Azure Developer CLI (azd)** است. این فایل تعریف می‌کند که اپلیکیشن شما چگونه باید در Azure مستقر شود، شامل زیرساخت، سرویس‌ها، هوک‌های استقرار و متغیرهای محیطی.

---

## 1. هدف و عملکرد

این فایل `azure.yaml` به عنوان **نقشه استقرار** برای یک اپلیکیشن عامل هوش مصنوعی عمل می‌کند که:

1. **اعتبارسنجی محیط** قبل از استقرار
2. **پروویژن سرویس‌های Azure AI** (AI Hub, AI Project, Search و غیره)
3. **استقرار یک اپلیکیشن Python** در Azure Container Apps
4. **پیکربندی مدل‌های AI** برای هر دو عملکرد چت و تعبیه (embedding)
5. **راه‌اندازی مانیتورینگ و تراستینگ** برای اپلیکیشن AI
6. **مدیریت سناریوهای پروژه AI جدید و موجود** در Azure

این فایل امکان **استقرار با یک دستور** (`azd up`) را برای یک راه‌حل کامل عامل هوش مصنوعی با اعتبارسنجی مناسب، پروویژن و پیکربندی پس از استقرار فراهم می‌کند.

??? info "برای گسترش و مشاهده: `azure.yaml`"

      فایل `azure.yaml` تعیین می‌کند که Azure Developer CLI چگونه باید این اپلیکیشن عامل هوش مصنوعی را در Azure مستقر و مدیریت کند. بیایید آن را خط به خط بررسی کنیم.

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

بیایید فایل را بخش به بخش بررسی کنیم تا بفهمیم چه کاری انجام می‌دهد و چرا.

### 2.1 **هدر و اسکیمای (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **خط 1**: اسکیمای سرور زبان YAML را برای پشتیبانی IDE و IntelliSense فراهم می‌کند

### 2.2 متادیتای پروژه (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **خط 5**: نام پروژه‌ای که توسط Azure Developer CLI استفاده می‌شود را تعریف می‌کند
- **خطوط 6-7**: مشخص می‌کند که این بر اساس قالب نسخه 1.0.2 است
- **خطوط 8-9**: نیازمند نسخه Azure Developer CLI برابر یا بالاتر از 1.14.0 است

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

      - در سیستم‌های Unix/Linux: اسکریپت اعتبارسنجی را اجرایی می‌کند و آن را اجرا می‌کند
      - در ویندوز: اسکریپت اعتبارسنجی PowerShell را اجرا می‌کند
      - هر دو تعاملی هستند و در صورت شکست، استقرار متوقف خواهد شد

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
- **خطوط 21-30**: **هوک پس از پروویژن** - بعد از ایجاد منابع Azure اجرا می‌شود

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
- **خطوط 31-40**: **هوک پس از استقرار** - بعد از استقرار اپلیکیشن اجرا می‌شود

  - اسکریپت‌های تنظیم نهایی را اجرا می‌کند
  - حتی در صورت شکست اسکریپت‌ها ادامه می‌دهد

### 2.4 پیکربندی سرویس (41-48)

این بخش سرویس اپلیکیشنی که در حال استقرار آن هستید را پیکربندی می‌کند.

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

- **خط 42**: سرویس با نام "api_and_frontend" را تعریف می‌کند
- **خط 43**: به دایرکتوری `./src` برای کد منبع اشاره می‌کند
- **خط 44**: زبان برنامه‌نویسی Python را مشخص می‌کند
- **خط 45**: از Azure Container Apps به عنوان پلتفرم میزبانی استفاده می‌کند
- **خطوط 46-48**: پیکربندی Docker

      - از "api_and_frontend" به عنوان نام ایمیج استفاده می‌کند
      - تصویر Docker را در Azure به صورت remote می‌سازد (نه به صورت محلی)

### 2.5 متغیرهای خط لوله (49-76)

این متغیرها به شما کمک می‌کنند تا `azd` را در خط لوله‌های CI/CD برای خودکارسازی اجرا کنید

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

این بخش متغیرهای محیطی مورد استفاده **در طول استقرار** را تعریف می‌کند، مرتب شده بر اساس دسته‌بندی:

- **نام‌های منابع Azure (خطوط 51-60)**:
      - نام‌های اصلی منابع سرویس Azure مانند Resource Group، AI Hub، AI Project و غیره
- **پرچم‌های ویژگی (خطوط 61-63)**:
      - متغیرهای بولی برای فعال/غیرفعال کردن سرویس‌های خاص Azure
- **پیکربندی عامل AI (خطوط 64-71)**:
      - پیکربندی عامل AI اصلی شامل نام، شناسه، تنظیمات استقرار، جزئیات مدل
- **پیکربندی تعبیه AI (خطوط 72-79)**:
      - پیکربندی مدل تعبیه‌شده که برای جستجوی برداری استفاده می‌شود
- **جستجو و مانیتورینگ (خطوط 80-84)**:
      - نام ایندکس جستجو، شناسه‌های منابع موجود، و تنظیمات مانیتورینگ/تراسیگ

---

## 3. آشنایی با متغیرهای محیطی
متغیرهای محیطی زیر پیکربندی و رفتار استقرار شما را کنترل می‌کنند و بر اساس هدف اصلی‌شان دسته‌بندی شده‌اند. اکثر متغیرها مقدار پیش‌فرض معقولی دارند، اما می‌توانید آنها را برای مطابقت با نیازها یا منابع موجود Azure خود سفارشی کنید.

### 3.1 متغیرهای موردنیاز 

```bash title="" linenums="0"
# پیکربندی اصلی Azure
AZURE_ENV_NAME                    # نام محیط (برای نام‌گذاری منابع)
AZURE_LOCATION                    # منطقه استقرار
AZURE_SUBSCRIPTION_ID             # اشتراک هدف
AZURE_RESOURCE_GROUP              # نام گروه منابع
AZURE_PRINCIPAL_ID                # کاربر اصلی برای RBAC

# نام‌های منابع (در صورت مشخص نشدن به‌صورت خودکار تولید می‌شوند)
AZURE_AIHUB_NAME                  # نام هاب Microsoft Foundry
AZURE_AIPROJECT_NAME              # نام پروژه هوش مصنوعی
AZURE_AISERVICES_NAME             # نام حساب سرویس‌های هوش مصنوعی
AZURE_STORAGE_ACCOUNT_NAME        # نام حساب ذخیره‌سازی
AZURE_CONTAINER_REGISTRY_NAME     # نام رجیستری کانتینر
AZURE_KEYVAULT_NAME               # نام Key Vault (در صورت استفاده)
```

### 3.2 پیکربندی مدل 
```bash title="" linenums="0"
# پیکربندی مدل چت
AZURE_AI_AGENT_MODEL_NAME         # پیش‌فرض: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # پیش‌فرض: OpenAI (یا Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # پیش‌فرض: آخرین نسخه موجود
AZURE_AI_AGENT_DEPLOYMENT_NAME    # نام استقرار مدل چت
AZURE_AI_AGENT_DEPLOYMENT_SKU     # پیش‌فرض: استاندارد
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # پیش‌فرض: 80 (هزار TPM)

# پیکربندی مدل امبدینگ
AZURE_AI_EMBED_MODEL_NAME         # پیش‌فرض: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # پیش‌فرض: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # پیش‌فرض: آخرین نسخه موجود
AZURE_AI_EMBED_DEPLOYMENT_NAME    # نام استقرار برای امبدینگ‌ها
AZURE_AI_EMBED_DEPLOYMENT_SKU     # پیش‌فرض: استاندارد
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # پیش‌فرض: 50 (هزار TPM)

# پیکربندی عامل
AZURE_AI_AGENT_NAME               # نام نمایشی عامل
AZURE_EXISTING_AGENT_ID           # استفاده از عامل موجود (اختیاری)
```

### 3.3 سوئیچ‌های ویژگی
```bash title="" linenums="0"
# سرویس‌های اختیاری
USE_APPLICATION_INSIGHTS         # پیش‌فرض: true
USE_AZURE_AI_SEARCH_SERVICE      # پیش‌فرض: false
USE_CONTAINER_REGISTRY           # پیش‌فرض: true

# نظارت و رهگیری
ENABLE_AZURE_MONITOR_TRACING     # پیش‌فرض: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # پیش‌فرض: false

# پیکربندی جستجو
AZURE_AI_SEARCH_INDEX_NAME       # نام شاخص جستجو
AZURE_SEARCH_SERVICE_NAME        # نام سرویس جستجو
```

### 3.4 پیکربندی پروژه AI 
```bash title="" linenums="0"
# استفاده از منابع موجود
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # شناسه کامل منبع پروژهٔ هوش مصنوعی موجود
AZURE_EXISTING_AIPROJECT_ENDPOINT       # آدرس نقطه انتهایی (Endpoint) پروژهٔ موجود
```

### 3.5 بررسی متغیرهای خود

برای مشاهده و مدیریت متغیرهای محیطی خود از Azure Developer CLI استفاده کنید:

```bash title="" linenums="0"
# مشاهدهٔ تمام متغیرهای محیطی برای محیط جاری
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
سلب مسئولیت:
این سند با استفاده از سرویس ترجمهٔ هوش مصنوعی Co-op Translator (https://github.com/Azure/co-op-translator) ترجمه شده است. هرچند ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطاها یا نادرستی‌هایی باشند. نسخهٔ اصلی سند به زبان اصلی خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس یا حیاتی، ترجمهٔ حرفه‌ای توسط انسان توصیه می‌شود. ما در قبال هرگونه سوتفاهم یا تفسیر نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->