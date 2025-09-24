<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b4a16f82d68f5820d574acd8946843e4",
  "translation_date": "2025-09-24T12:14:03+00:00",
  "source_file": "workshop/docs/instructions/4-Configure-AI-Template.md",
  "language_code": "ar"
}
-->
# 4. إعداد قالب

!!! tip "بنهاية هذه الوحدة ستكون قادرًا على"

    - [ ] فهم الغرض من `azure.yaml`
    - [ ] فهم هيكل `azure.yaml`
    - [ ] فهم قيمة `hooks` في دورة حياة azd
    - [ ] **المختبر 3:**

---

!!! prompt "ما هو ملف `azure.yaml`؟ استخدم سياج الكود واشرحه سطرًا بسطر"

      ملف `azure.yaml` هو **ملف التكوين الخاص بـ Azure Developer CLI (azd)**. يحدد كيفية نشر تطبيقك على Azure، بما في ذلك البنية التحتية والخدمات وخطافات النشر ومتغيرات البيئة.

---

## 1. الغرض والوظائف

يعمل ملف `azure.yaml` كـ **مخطط نشر** لتطبيق وكيل الذكاء الاصطناعي الذي:

1. **يتحقق من البيئة** قبل النشر
2. **يوفر خدمات Azure AI** (AI Hub، AI Project، البحث، إلخ.)
3. **ينشر تطبيق Python** على Azure Container Apps
4. **يُعد نماذج الذكاء الاصطناعي** للدردشة ووظائف التضمين
5. **يُعد المراقبة والتتبع** لتطبيق الذكاء الاصطناعي
6. **يتعامل مع سيناريوهات المشاريع الجديدة والقائمة** في Azure AI

يُمكّن الملف **النشر بأمر واحد** (`azd up`) لحل وكيل الذكاء الاصطناعي الكامل مع التحقق المناسب، والتوفير، وتكوين ما بعد النشر.

??? info "اضغط للتوسيع: `azure.yaml`"

      يحدد ملف `azure.yaml` كيفية نشر وإدارة تطبيق وكيل الذكاء الاصطناعي هذا في Azure باستخدام Azure Developer CLI. دعنا نحلله سطرًا بسطر.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: هل نحتاج إلى الخطافات؟
      # TODO: هل نحتاج إلى جميع المتغيرات؟

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

## 2. تفكيك الملف

دعنا نستعرض الملف قسمًا قسمًا لفهم ما يفعله - ولماذا.

### 2.1 **الرأس والمخطط (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **السطر 1**: يوفر التحقق من صحة مخطط خادم لغة YAML لدعم IDE و IntelliSense

### 2.2 بيانات المشروع الوصفية (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **السطر 5**: يحدد اسم المشروع المستخدم بواسطة Azure Developer CLI
- **السطران 6-7**: يحدد أن هذا يعتمد على إصدار القالب 1.0.2
- **السطران 8-9**: يتطلب إصدار Azure Developer CLI 1.14.0 أو أعلى

### 2.3 خطافات النشر (11-40)

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

- **السطران 11-20**: **خطاف ما قبل النشر** - يتم تشغيله قبل `azd up`

      - على Unix/Linux: يجعل البرنامج النصي للتحقق قابلاً للتنفيذ ويشغله
      - على Windows: يشغل برنامج PowerShell النصي للتحقق
      - كلاهما تفاعلي وسيتوقف النشر إذا فشل

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
- **السطران 21-30**: **خطاف ما بعد التوفير** - يتم تشغيله بعد إنشاء موارد Azure

  - يشغل البرامج النصية لكتابة متغيرات البيئة
  - يستمر النشر حتى إذا فشلت هذه البرامج النصية (`continueOnError: true`)

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
- **السطران 31-40**: **خطاف ما بعد النشر** - يتم تشغيله بعد نشر التطبيق

  - يشغل البرامج النصية للإعداد النهائي
  - يستمر حتى إذا فشلت البرامج النصية

### 2.4 تكوين الخدمة (41-48)

هذا يُعد خدمة التطبيق التي تقوم بنشرها.

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

- **السطر 42**: يحدد خدمة باسم "api_and_frontend"
- **السطر 43**: يشير إلى دليل `./src` لشفرة المصدر
- **السطر 44**: يحدد Python كلغة البرمجة
- **السطر 45**: يستخدم Azure Container Apps كمنصة استضافة
- **السطران 46-48**: تكوين Docker

      - يستخدم "api_and_frontend" كاسم للصورة
      - يبني صورة Docker عن بُعد في Azure (وليس محليًا)

### 2.5 متغيرات خط الأنابيب (49-76)

هذه هي المتغيرات التي تساعدك على تشغيل `azd` في خطوط أنابيب CI/CD للتشغيل الآلي

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

يحدد هذا القسم متغيرات البيئة المستخدمة **أثناء النشر**، مرتبة حسب الفئة:

- **أسماء موارد Azure (السطران 51-60)**:
      - أسماء موارد خدمات Azure الأساسية مثل مجموعة الموارد، AI Hub، AI Project، إلخ.
- **علامات الميزات (السطران 61-63)**:
      - متغيرات منطقية لتمكين/تعطيل خدمات Azure محددة
- **تكوين وكيل الذكاء الاصطناعي (السطران 64-71)**:
      - تكوين الوكيل الرئيسي للذكاء الاصطناعي بما في ذلك الاسم، المعرف، إعدادات النشر، تفاصيل النموذج
- **تكوين التضمين للذكاء الاصطناعي (السطران 72-79)**:
      - تكوين النموذج المستخدم للبحث المتجهي
- **البحث والمراقبة (السطران 80-84)**:
      - اسم فهرس البحث، معرفات الموارد الحالية، وإعدادات المراقبة/التتبع

---

## 3. معرفة متغيرات البيئة
تتحكم متغيرات البيئة التالية في تكوين وسلوك النشر الخاص بك، مرتبة حسب الغرض الأساسي لها. معظم المتغيرات لها قيم افتراضية معقولة، ولكن يمكنك تخصيصها لتتناسب مع متطلباتك المحددة أو موارد Azure الحالية.

### 3.1 المتغيرات المطلوبة 

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

### 3.2 تكوين النموذج 
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

### 3.3 تبديل الميزات
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

### 3.4 تكوين مشروع الذكاء الاصطناعي 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 تحقق من متغيراتك

استخدم Azure Developer CLI لعرض وإدارة متغيرات البيئة الخاصة بك:

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

