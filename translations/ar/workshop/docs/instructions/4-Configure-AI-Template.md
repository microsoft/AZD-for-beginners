# 4. تكوين قالب

!!! tip "بنهاية هذه الوحدة ستتمكن من"

    - [ ] فهم غرض `azure.yaml`
    - [ ] فهم بنية `azure.yaml`
    - [ ] فهم قيمة دورة حياة azd لـ `hooks`
    - [ ] **المختبر 4:** استكشاف وتعديل متغيرات البيئة

---

!!! prompt "ما الذي يفعله ملف `azure.yaml`؟ استخدم كتلة كود وفسرها سطرًا بسطر"

      ملف `azure.yaml` هو **ملف التهيئة لـ Azure Developer CLI (azd)**. يحدد كيفية نشر تطبيقك على Azure، بما في ذلك البنية التحتية، الخدمات، الـ hooks أثناء النشر، ومتغيرات البيئة.

---

## 1. الغرض والوظائف

يعمل ملف `azure.yaml` هذا كـ **مخطط النشر** لتطبيق وكيل ذكاء اصطناعي يقوم بما يلي:

1. **يتحقق من البيئة** قبل النشر
2. **يوفر خدمات AI في Azure** (AI Hub، AI Project، Search، إلخ)
3. **ينشر تطبيق Python** في Azure Container Apps
4. **يُكوّن نماذج AI** لكل من وظائف الدردشة والتضمين
5. **يقوم بإعداد المراقبة والتتبع** لتطبيق الذكاء الاصطناعي
6. **يتعامل مع مشاريع Azure AI الجديدة والموجودة**

يُمكّن هذا الملف من **نشر بأمر واحد** (`azd up`) لحل وكيل AI مكتمل مع التحقق الصحيح، والتوفير، وضبط ما بعد النشر.

??? info "انقر للتوسيع لعرض: `azure.yaml`"

      يعرّف ملف `azure.yaml` كيف ينبغي على Azure Developer CLI نشر وإدارة تطبيق وكيل AI هذا في Azure. لنفصّله سطرًا بسطر.

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

## 2. تفكيك الملف

لنمر على الملف قسمًا بقسم، لفهم ما يفعله - ولماذا.

### 2.1 **الرأس والمخطط (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **السطر 1**: يوفر التحقق من مخطط لغة YAML لخادم اللغة لدعم بيئة التطوير وIntelliSense

### 2.2 بيانات تعريف المشروع (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **السطر 5**: يعرّف اسم المشروع المستخدم بواسطة Azure Developer CLI
- **الأسطر 6-7**: تحدد أن هذا مبني على قالب بالإصدار 1.0.2
- **الأسطر 8-9**: يتطلب إصدار Azure Developer CLI 1.14.0 أو أعلى

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

- **الأسطر 11-20**: **خطاف قبل النشر** - يعمل قبل `azd up`

      - على Unix/Linux: يجعل سكربت التحقق قابلاً للتنفيذ ويشغله
      - على Windows: يشغل سكربت التحقق بـ PowerShell
      - كلاهما تفاعلي وسيتوقف النشر إذا فشلا

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
- **الأسطر 21-30**: **خطاف ما بعد التهيئة** - يعمل بعد إنشاء موارد Azure

  - ينفّذ سكربتات كتابة متغيرات البيئة
  - يستمر النشر حتى إذا فشلت هذه السكربتات (`continueOnError: true`)

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
- **الأسطر 31-40**: **خطاف ما بعد النشر** - يعمل بعد نشر التطبيق

  - ينفّذ سكربتات الإعداد النهائي
  - يستمر حتى إذا فشلت السكربتات

### 2.4 إعداد الخدمة (41-48)

يُكوّن هذا إعداد خدمة التطبيق التي تقوم بنشرها.

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

- **السطر 42**: يعرّف خدمة باسم "api_and_frontend"
- **السطر 43**: يشير إلى دليل `./src` لمصدر الكود
- **السطر 44**: يحدد Python كلغة برمجة
- **السطر 45**: يستخدم Azure Container Apps كمنصة الاستضافة
- **الأسطر 46-48**: إعدادات Docker

      - يستخدم "api_and_frontend" كاسم للصورة
      - يبني صورة Docker عن بُعد في Azure (وليس محليًا)

### 2.5 متغيرات خط الأنابيب (49-76)

هذه متغيرات لمساعدتك على تشغيل `azd` في خطوط أنابيب CI/CD لأتمتة العملية

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

يعرّف هذا القسم متغيرات البيئة المستخدمة **أثناء النشر**، منظمة حسب الفئة:

- **أسماء موارد Azure (الأسطر 51-60)**:
      - أسماء موارد خدمات Azure الأساسية مثل: Resource Group، AI Hub، AI Project، إلخ
- **مفاتيح الميزات (الأسطر 61-63)**:
      - متغيرات منطقية لتفعيل/تعطيل خدمات Azure محددة
- **تكوين وكيل AI (الأسطر 64-71)**:
      - إعدادات الوكيل الرئيسي للذكاء الاصطناعي بما في ذلك الاسم، المعرف، إعدادات النشر، تفاصيل النموذج
- **تكوين تضمين AI (الأسطر 72-79)**:
      - إعداد نموذج التضمين المستخدم للبحث المتجهّي
- **البحث والمراقبة (الأسطر 80-84)**:
      - اسم فهرس البحث، معرفات الموارد الموجودة، وإعدادات المراقبة/التتبع

---

## 3. تعرف على متغيرات البيئة
تتحكم متغيرات البيئة التالية في تكوين سلوك النشر الخاص بك، منظمة حسب الغرض الأساسي لها. معظم المتغيرات لها قيم افتراضية معقولة، لكن يمكنك تخصيصها لتتناسب مع متطلباتك الخاصة أو موارد Azure الحالية.

### 3.1 المتغيرات المطلوبة 

```bash title="" linenums="0"
# التكوين الأساسي لأزور
AZURE_ENV_NAME                    # اسم البيئة (يُستخدم في تسمية الموارد)
AZURE_LOCATION                    # منطقة النشر
AZURE_SUBSCRIPTION_ID             # الاشتراك المستهدف
AZURE_RESOURCE_GROUP              # اسم مجموعة الموارد
AZURE_PRINCIPAL_ID                # المستخدم الرئيسي لـ RBAC

# أسماء الموارد (تُنشأ تلقائيًا إذا لم يتم تحديدها)
AZURE_AIHUB_NAME                  # اسم محور مايكروسوفت فاوندري
AZURE_AIPROJECT_NAME              # اسم مشروع الذكاء الاصطناعي
AZURE_AISERVICES_NAME             # اسم حساب خدمات الذكاء الاصطناعي
AZURE_STORAGE_ACCOUNT_NAME        # اسم حساب التخزين
AZURE_CONTAINER_REGISTRY_NAME     # اسم سجل الحاويات
AZURE_KEYVAULT_NAME               # اسم مخزن المفاتيح (إذا تم استخدامه)
```

### 3.2 تكوين النموذج 
```bash title="" linenums="0"
# تكوين نموذج المحادثة
AZURE_AI_AGENT_MODEL_NAME         # الافتراضي: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # الافتراضي: OpenAI (أو Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # الافتراضي: الأحدث المتاح
AZURE_AI_AGENT_DEPLOYMENT_NAME    # اسم النشر لنموذج المحادثة
AZURE_AI_AGENT_DEPLOYMENT_SKU     # الافتراضي: القياسي
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # الافتراضي: 80 (آلاف من TPM)

# تكوين نموذج التضمين
AZURE_AI_EMBED_MODEL_NAME         # الافتراضي: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # الافتراضي: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # الافتراضي: الأحدث المتاح
AZURE_AI_EMBED_DEPLOYMENT_NAME    # اسم النشر للتضمينات
AZURE_AI_EMBED_DEPLOYMENT_SKU     # الافتراضي: القياسي
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # الافتراضي: 50 (آلاف من TPM)

# تكوين الوكيل
AZURE_AI_AGENT_NAME               # اسم عرض الوكيل
AZURE_EXISTING_AGENT_ID           # استخدام وكيل موجود (اختياري)
```

### 3.3 تبديل الميزات
```bash title="" linenums="0"
# الخدمات الاختيارية
USE_APPLICATION_INSIGHTS         # القيمة الافتراضية: نعم
USE_AZURE_AI_SEARCH_SERVICE      # القيمة الافتراضية: لا
USE_CONTAINER_REGISTRY           # القيمة الافتراضية: نعم

# المراقبة والتتبع
ENABLE_AZURE_MONITOR_TRACING     # القيمة الافتراضية: لا
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # القيمة الافتراضية: لا

# تكوين البحث
AZURE_AI_SEARCH_INDEX_NAME       # اسم فهرس البحث
AZURE_SEARCH_SERVICE_NAME        # اسم خدمة البحث
```

### 3.4 تكوين مشروع AI 
```bash title="" linenums="0"
# استخدم الموارد الموجودة
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # معرّف المورد الكامل لمشروع الذكاء الاصطناعي الموجود
AZURE_EXISTING_AIPROJECT_ENDPOINT       # عنوان URL لنقطة النهاية للمشروع الموجود
```

### 3.5 تحقق من متغيراتك

استخدم Azure Developer CLI لعرض وإدارة متغيرات البيئة الخاصة بك:

```bash title="" linenums="0"
# عرض جميع متغيرات البيئة للبيئة الحالية
azd env get-values

# الحصول على متغير بيئة محدد
azd env get-value AZURE_ENV_NAME

# تعيين متغير بيئة
azd env set AZURE_LOCATION eastus

# تعيين متغيرات متعددة من ملف .env
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
إخلاء المسؤولية:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة الآلية Co-op Translator (https://github.com/Azure/co-op-translator). نحن نسعى لتحقيق الدقة، لكن يرجى ملاحظة أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر المرجعي والموثوق. للمعلومات الحرجة، يُنصح بالاستعانة بترجمة بشرية محترفة. لن نتحمل المسؤولية عن أي سوء فهم أو تفسير ينشأ عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->