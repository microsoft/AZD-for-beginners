# 4. ٹیمپلیٹ کی ترتیب دیں

!!! tip "اس ماڈیول کے آخر تک آپ قادر ہو جائیں گے"

    - [ ] `azure.yaml` کے مقصد کو سمجھیں
    - [ ] `azure.yaml` کی ساخت کو سمجھیں
    - [ ] azd lifecycle `hooks` کی قدر کو سمجھیں
    - [ ] **لیب 4:** ماحول کے متغیرات کی تلاش اور ترمیم کریں

---

!!! prompt "`azure.yaml` فائل کیا کرتی ہے؟ ایک کوڈ فنس میں لائن بہ لائن وضاحت کریں"

      `azure.yaml` فائل **Azure Developer CLI (azd)** کے لیے ترتیب فائل ہے۔ یہ تعین کرتی ہے کہ آپ کی ایپلیکیشن کو Azure پر کیسے تعینات کیا جائے، بشمول انفراسٹرکچر، خدمات، تعیناتی کے ہکس، اور ماحول کے متغیرات۔

---

## 1. مقصد اور فعالیت

یہ `azure.yaml` فائل ایک AI ایجنٹ ایپلیکیشن کے لیے **تعیناتی خاکہ** کے طور پر کام کرتی ہے جو:

1. تعیناتی سے پہلے **ماحول کی تصدیق کرتی ہے**
2. Azure AI خدمات (AI Hub, AI Project, Search, وغیرہ) **فراہم کرتی ہے**
3. Python ایپلیکیشن کو Azure Container Apps پر **تعینات کرتی ہے**
4. چیٹ اور ایمبیڈنگ فعالیت دونوں کے لیے AI ماڈلز **تشکیل دیتی ہے**
5. AI ایپلیکیشن کے لیے **مانیٹرنگ اور ٹریسنگ** قائم کرتی ہے
6. Azure AI پروجیکٹ کے دونوں نئے اور موجودہ مناظر کو **ہینڈل کرتی ہے**

یہ فائل **ایک کمانڈ تعیناتی** (`azd up`) کو ممکن بناتی ہے، جس میں مناسب تصدیق، فراہمی، اور تعیناتی کے بعد کی ترتیب شامل ہے۔

??? info "تفصیل دیکھیں: `azure.yaml`"

      `azure.yaml` فائل اس AI Agent ایپلیکیشن کو Azure میں تعینات اور منظم کرنے کے لیے Azure Developer CLI کو بتاتی ہے۔ آئیے اسے لائن بہ لائن دیکھیں۔

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: کیا ہمیں ہکس کی ضرورت ہے؟ 
      # TODO: کیا ہمیں تمام متغیرات کی ضرورت ہے؟

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

## 2. فائل کی تجزیہ

آئیے فائل کو سیکشن بہ سیکشن دیکھتے ہیں تاکہ سمجھ سکیں کہ یہ کیا کرتی ہے اور کیوں۔

### 2.1 **ہیڈر اور اسکیمہ (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **لائن 1**: IDE سپورٹ اور IntelliSense کے لیے YAML زبان سرور اسکیمہ کی توثیق فراہم کرتا ہے۔

### 2.2 پروجیکٹ میٹا ڈیٹا (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **لائن 5**: پروجیکٹ کا نام Azure Developer CLI میں استعمال ہوتا ہے۔
- **لائنز 6-7**: یہ ایک ٹیمپلیٹ ورژن 1.0.2 پر مبنی ہے۔
- **لائنز 8-9**: Azure Developer CLI ورژن 1.14.0 یا اس سے اوپر درکار ہے۔

### 2.3 تعیناتی کے ہکس (11-40)

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

- **لائنز 11-20**: **پری-تعیناتی ہک** - `azd up` سے پہلے چلتا ہے۔

      - Unix/Linux پر: تصدیقی اسکرپٹ کو قابل عمل بناتا ہے اور اسے چلتا ہے۔
      - Windows پر: PowerShell تصدیقی اسکرپٹ چلاتا ہے۔
      - دونوں انٹرایکٹو ہیں اور ناکامی پر تعیناتی روک دیتے ہیں۔

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
- **لائنز 21-30**: **پوسٹ-پروویژن ہک** - Azure وسائل تخلیق ہونے کے بعد چلتا ہے۔

  - ماحول کی متغیرات کو لکھنے والے اسکرپٹس کو چلاتا ہے۔
  - اگر یہ اسکرپٹس ناکام ہوں تو بھی تعیناتی جاری رہتی ہے (`continueOnError: true`)۔

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
- **لائنز 31-40**: **پوسٹ-ڈپلائے ہک** - ایپلیکیشن کی تعیناتی کے بعد چلتا ہے۔

  - آخری ترتیب کے اسکرپٹس چلائے جاتے ہیں۔
  - اگر اسکرپٹس ناکام ہوں تب بھی جاری رہتا ہے۔

### 2.4 سروس کی کنفیگریشن (41-48)

یہ آپ کی ایپلیکیشن سروس کی تعیناتی کی ترتیب فراہم کرتا ہے۔

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

- **لائن 42**: ایک سروس "api_and_frontend" کی تعریف کرتا ہے۔
- **لائن 43**: سورس کوڈ کے لیے `./src` ڈائریکٹری کی طرف اشارہ کرتا ہے۔
- **لائن 44**: Python کو پروگرامنگ زبان کے طور پر بتاتا ہے۔
- **لائن 45**: Azure Container Apps کو ہوسٹنگ پلیٹ فارم کے طور پر استعمال کرتا ہے۔
- **لائنز 46-48**: ڈاکر کی ترتیب۔

      - "api_and_frontend" کو تصویر کے نام کے طور پر استعمال کرتا ہے۔
      - ڈاکر امیج کو Azure میں دور سے بلڈ کرتا ہے (مقامی طور پر نہیں)۔

### 2.5 پائپ لائن متغیرات (49-76)

یہ متغیرات CI/CD پائپ لائنز میں `azd` کو خودکار بنانے کے لیے ہیں۔

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

یہ سیکشن **تعیناتی کے دوران** استعمال ہونے والے ماحول کے متغیرات کو زمروں میں تقسیم کرتا ہے:

- **Azure وسائل کے نام (لائنز 51-60)**:
      - بنیادی Azure سروس ریسورس نام جیسے: Resource Group, AI Hub, AI Project وغیرہ۔
- **فیچر فلیگز (لائنز 61-63)**:
      - مخصوص Azure خدمات کو فعال/غیر فعال کرنے والے بولین متغیرات۔
- **AI ایجنٹ کی ترتیب (لائنز 64-71)**:
      - مرکزی AI ایجنٹ کی ترتیب بشمول نام، ID، تعیناتی کی ترتیبات، ماڈل کی تفصیلات۔
- **AI ایمبیڈنگ کی ترتیب (لائنز 72-79)**:
      - ویکٹر سرچ کے لیے ایمبیڈنگ ماڈل کی ترتیب۔
- **سرچ اور مانیٹرنگ (لائنز 80-84)**:
      - سرچ انڈیکس کا نام، موجودہ وسائل کی شناخت، اور مانیٹرنگ/ٹریسنگ کی ترتیبات۔

---

## 3. ماحول کے متغیرات کو جانیں
نیچے دیے گئے ماحول کے متغیرات آپ کی تعیناتی کی ترتیب اور رویے کو کنٹرول کرتے ہیں، ان کو ان کے بنیادی مقصد کے لحاظ سے منظم کیا گیا ہے۔ زیادہ تر متغیرات کے معقول ڈیفالٹ ہوتے ہیں، لیکن آپ انہیں اپنی مخصوص ضروریات یا موجودہ Azure وسائل کے مطابق تخصیص کر سکتے ہیں۔

### 3.1 ضروری متغیرات 

```bash title="" linenums="0"
# بنیادی ایزور ترتیب
AZURE_ENV_NAME                    # ماحول کا نام (وسائل کے نام میں استعمال ہوتا ہے)
AZURE_LOCATION                    # تعیناتی کا علاقہ
AZURE_SUBSCRIPTION_ID             # ہدف سبسکرپشن
AZURE_RESOURCE_GROUP              # وسائل کے گروپ کا نام
AZURE_PRINCIPAL_ID                # RBAC کے لیے صارف پرنسپل

# وسائل کے نام (اگر مخصوص نہ ہوں تو خودکار طور پر پیدا کیے جاتے ہیں)
AZURE_AIHUB_NAME                  # مائیکروسافٹ فاؤنڈری ہب کا نام
AZURE_AIPROJECT_NAME              # AI پراجیکٹ کا نام
AZURE_AISERVICES_NAME             # AI سروسز اکاؤنٹ کا نام
AZURE_STORAGE_ACCOUNT_NAME        # اسٹوریج اکاؤنٹ کا نام
AZURE_CONTAINER_REGISTRY_NAME     # کنٹینر رجسٹری کا نام
AZURE_KEYVAULT_NAME               # کی والٹ کا نام (اگر استعمال کیا جائے)
```

### 3.2 ماڈل کی ترتیب 
```bash title="" linenums="0"
# چیٹ ماڈل کی ترتیب
AZURE_AI_AGENT_MODEL_NAME         # ڈیفالٹ: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # ڈیفالٹ: OpenAI (یا Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # ڈیفالٹ: دستیاب تازہ ترین
AZURE_AI_AGENT_DEPLOYMENT_NAME    # چیٹ ماڈل کے لئے تعیناتی کا نام
AZURE_AI_AGENT_DEPLOYMENT_SKU     # ڈیفالٹ: معیاری
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # ڈیفالٹ: 80 (ہزاروں TPM)

# ایمبیڈنگ ماڈل کی ترتیب
AZURE_AI_EMBED_MODEL_NAME         # ڈیفالٹ: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # ڈیفالٹ: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # ڈیفالٹ: دستیاب تازہ ترین
AZURE_AI_EMBED_DEPLOYMENT_NAME    # ایمبیڈنگ کے لئے تعیناتی کا نام
AZURE_AI_EMBED_DEPLOYMENT_SKU     # ڈیفالٹ: معیاری
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # ڈیفالٹ: 50 (ہزاروں TPM)

# ایجنٹ کی ترتیب
AZURE_AI_AGENT_NAME               # ایجنٹ کا دکھانے والا نام
AZURE_EXISTING_AGENT_ID           # موجودہ ایجنٹ استعمال کریں (اختیاری)
```

### 3.3 فیچر ٹوگل
```bash title="" linenums="0"
# اختیاری خدمات
USE_APPLICATION_INSIGHTS         # ڈیفالٹ: درست
USE_AZURE_AI_SEARCH_SERVICE      # ڈیفالٹ: غلط
USE_CONTAINER_REGISTRY           # ڈیفالٹ: درست

# نگرانی اور ٹریسنگ
ENABLE_AZURE_MONITOR_TRACING     # ڈیفالٹ: غلط
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # ڈیفالٹ: غلط

# تلاش کی ترتیب
AZURE_AI_SEARCH_INDEX_NAME       # تلاش کے انڈیکس کا نام
AZURE_SEARCH_SERVICE_NAME        # تلاش کی سروس کا نام
```

### 3.4 AI پروجیکٹ کی ترتیب 
```bash title="" linenums="0"
# موجودہ وسائل کا استعمال کریں
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # موجودہ AI پروجیکٹ کا مکمل ریسورس آئی ڈی
AZURE_EXISTING_AIPROJECT_ENDPOINT       # موجودہ پروجیکٹ کا اینڈپوائنٹ یو آر ایل
```

### 3.5 اپنے متغیرات چیک کریں

اپنے ماحول کے متغیرات کو دیکھنے اور منظم کرنے کے لیے Azure Developer CLI استعمال کریں:

```bash title="" linenums="0"
# موجودہ ماحول کے تمام ماحولیات کے متغیرات دیکھیں
azd env get-values

# ایک مخصوص ماحولیات کا متغیر حاصل کریں
azd env get-value AZURE_ENV_NAME

# ایک ماحولیات کا متغیر سیٹ کریں
azd env set AZURE_LOCATION eastus

# .env فائل سے متعدد متغیرات سیٹ کریں
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈسکلیمر**:  
اس دستاویز کا ترجمہ AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعہ کیا گیا ہے۔ اگرچہ ہم درستگی کی کوشش کرتے ہیں، براہ کرم اس بات کا خیال رکھیں کہ خود کار ترجمے میں غلطیاں یا بے دقتیاں ہو سکتی ہیں۔ اصل دستاویز کو اس کی مآخذ زبان میں ہی مستند ذریعہ سمجھا جانا چاہیے۔ اہم معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریحات کے لیے ہم ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->