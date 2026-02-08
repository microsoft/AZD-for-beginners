# 4. ایک ٹیمپلیٹ ترتیب دیں

!!! tip "اس ماڈیول کے اختتام تک آپ قابل ہو جائیں گے"

    - [ ] `azure.yaml` کا مقصد سمجھیں
    - [ ] `azure.yaml` کی ساخت کو سمجھیں
    - [ ] azd lifecycle `hooks` کی اہمیت کو سمجھیں
    - [ ] **لیب 4:** ماحول کے متغیرات کو دریافت اور ترمیم کریں

---

!!! prompt "`azure.yaml` فائل کیا کرتی ہے؟ کوڈفینس کا استعمال کریں اور لائن بہ لائن وضاحت کریں"

      `azure.yaml` فائل **Azure Developer CLI (azd)** کے لیے تشکیل کی فائل ہے۔ یہ تعریف کرتی ہے کہ آپ کی ایپلیکیشن کو Azure پر کیسے تعینات کیا جانا چاہیے، جس میں انفراسٹرکچر، خدمات، تعیناتی hooks، اور ماحول کے متغیرات شامل ہیں۔

---

## 1. مقصد اور فعالیت

یہ `azure.yaml` فائل ایک AI ایجنٹ ایپلیکیشن کے لیے **تعیناتی خاکہ** کے طور پر کام کرتی ہے جو:

1. تعیناتی سے پہلے **ماحول کی توثیق** کرتی ہے
2. **Azure AI خدمات** فراہم کرتی ہے (AI Hub، AI Project، Search وغیرہ)
3. Azure Container Apps پر **Python ایپلیکیشن تعینات کرتی ہے**
4. چیٹ اور ایمبیڈنگ فنکشنالٹی کے لیے **AI ماڈلز کو ترتیب دیتی ہے**
5. AI ایپلیکیشن کے لیے **مانیٹرنگ اور ٹریسنگ** سیٹ اپ کرتی ہے
6. نئے اور موجودہ **Azure AI پروجیکٹ کے حالات** کو سنبھالتی ہے

یہ فائل ایک مکمل AI ایجنٹ حل کی **ایک کمانڈ تعیناتی** (`azd up`) ممکن بناتی ہے جس میں مناسب توثیق، پروویژننگ، اور تعیناتی کے بعد کی ترتیب شامل ہے۔

??? info "مکمل دیکھنے کے لیے بڑھائیں: `azure.yaml`"

      `azure.yaml` فائل وضاحت کرتی ہے کہ Azure Developer CLI اس AI ایجنٹ ایپلیکیشن کو Azure میں کیسے تعینات اور منظم کرے۔ آئیے اسے لائن بہ لائن دیکھتے ہیں۔

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: کیا ہمیں hooks کی ضرورت ہے؟ 
      # TODO: کیا ہمیں تمام variables کی ضرورت ہے؟

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

## 2. فائل کی وضاحت

آئیے فائل کو سیکشن بہ سیکشن دیکھتے ہیں تاکہ سمجھ سکیں کہ یہ کیا کرتی ہے اور کیوں۔

### 2.1 **ہیڈر اور اسکیمہ (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **لائن 1**: IDE سپورٹ اور IntelliSense کے لیے YAML لینگویج سرور اسکیمہ کی تصدیق فراہم کرتا ہے

### 2.2 پروجیکٹ میٹا ڈیٹا (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **لائن 5**: Azure Developer CLI کے ذریعہ استعمال ہونے والا پروجیکٹ نام متعین کرتا ہے
- **لائنز 6-7**: بتاتا ہے کہ یہ ٹیمپلیٹ ورژن 1.0.2 پر مبنی ہے
- **لائنز 8-9**: Azure Developer CLI ورژن 1.14.0 یا اس سے اوپر کی ضرورت ہے

### 2.3 تعیناتی hooks (11-40)

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

- **لائنز 11-20**: **پری-تعیناتی ہک** - `azd up` سے پہلے چلتا ہے

      - Unix/Linux پر: توثیقی اسکرپٹ کو قابلِ عمل بناتا ہے اور چلایا جاتا ہے
      - Windows پر: PowerShell توثیقی اسکرپٹ چلائی جاتی ہے
      - دونوں انٹرایکٹو ہیں اور ناکامی کی صورت میں تعیناتی روک دیتے ہیں

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
- **لائنز 21-30**: **پوسٹ-پروویژن ہک** - Azure وسائل کے بننے کے بعد چلتا ہے

  - ماحول کے متغیرات لکھنے والے اسکرپٹس چلائے جاتے ہیں
  - اگر یہ اسکرپٹس ناکام ہوں تو بھی تعیناتی جاری رہتی ہے (`continueOnError: true`)

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
- **لائنز 31-40**: **پوسٹ-تعیناتی ہک** - ایپلیکیشن کی تعیناتی کے بعد چلتا ہے

  - آخری سیٹ اپ اسکرپٹس چلاتا ہے
  - اگر اسکرپٹس ناکام ہوں تو بھی جاری رہتا ہے

### 2.4 سروس کی تشکیل (41-48)

یہ اس ایپلیکیشن سروس کو ترتیب دیتا ہے جسے آپ تعینات کر رہے ہیں۔

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

- **لائن 42**: "api_and_frontend" نامی سروس کی تعریف کرتا ہے
- **لائن 43**: سورس کوڈ کے لیے `./src` فولڈر کی نشاندہی کرتا ہے
- **لائن 44**: پروگرامنگ زبان Python متعین کی گئی ہے
- **لائن 45**: میزبان پلیٹ فارم کے طور پر Azure Container Apps استعمال کرتا ہے
- **لائنز 46-48**: ڈاکر کی تشکیل

      - "api_and_frontend" کو امیج کے نام کے طور پر استعمال کرتا ہے
      - Azure میں ڈاکر امیج کو دور سے بناتا ہے (مقامی نہیں)

### 2.5 پائپ لائن متغیرات (49-76)

یہ وہ متغیرات ہیں جو آپ کو CI/CD پائپ لائنز میں `azd` چلانے میں مدد دیتے ہیں تاکہ خودکاری ممکن ہو

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

یہ سیکشن وہ ماحول کے متغیرات مخصوص کرتا ہے جو **تعیناتی کے دوران** استعمال ہوتے ہیں، درج ذیل زمروں میں منظم:

- **Azure وسائل کے نام (لائنز 51-60)**:
      - بنیادی Azure سروسز کے وسائل کے نام جیسے Resource Group، AI Hub، AI Project وغیرہ
- **فیچر کے جھنڈے (لائنز 61-63)**:
      - مخصوص Azure خدمات کو فعال/غیر فعال کرنے کے لیے بولین متغیرات
- **AI ایجنٹ کی ترتیب (لائنز 64-71)**:
      - مرکزی AI ایجنٹ کی تشکیل بشمول نام، ID، تعیناتی کی ترتیبات، ماڈل کی تفصیلات
- **AI ایمبیڈنگ کی تشکیل (لائنز 72-79)**:
      - ویکٹر تلاش کے لیے استعمال ہونے والے ایمبیڈنگ ماڈل کی ترتیب
- **تلاش اور مانیٹرنگ (لائنز 80-84)**:
      - تلاش انڈیکس کا نام، موجودہ وسائل کی IDs، اور مانیٹرنگ/ٹریسنگ کی ترتیبات

---

## 3. ماحول کے متغیرات کو جانیں
مندرجہ ذیل ماحول کے متغیرات آپ کی تعیناتی کی تشکیل اور رویے کو کنٹرول کرتے ہیں، جنہیں ان کے بنیادی مقصد کے مطابق منظم کیا گیا ہے۔ زیادہ تر متغیرات معقول ڈیفالٹس رکھتے ہیں، لیکن آپ انہیں اپنی مخصوص ضروریات یا موجودہ Azure وسائل کے مطابق حسب ضرورت بنا سکتے ہیں۔

### 3.1 ضروری متغیرات 

```bash title="" linenums="0"
# مرکزی ایژر کنفیگریشن
AZURE_ENV_NAME                    # ماحول کا نام (وسیلے کے نام میں استعمال ہوتا ہے)
AZURE_LOCATION                    # تعیناتی کا خطہ
AZURE_SUBSCRIPTION_ID             # ہدف کی رکنیت
AZURE_RESOURCE_GROUP              # وسائل کے گروپ کا نام
AZURE_PRINCIPAL_ID                # RBAC کے لئے صارف کا پرنسپل

# وسائل کے نام (اگر مخصوص نہ کیے جائیں تو خود بخود تیار ہوتے ہیں)
AZURE_AIHUB_NAME                  # مائیکروسافٹ فاؤنڈری حب کا نام
AZURE_AIPROJECT_NAME              # AI پروجیکٹ کا نام
AZURE_AISERVICES_NAME             # AI خدمات اکاؤنٹ کا نام
AZURE_STORAGE_ACCOUNT_NAME        # اسٹوریج اکاؤنٹ کا نام
AZURE_CONTAINER_REGISTRY_NAME     # کنٹینر رجسٹری کا نام
AZURE_KEYVAULT_NAME               # کی والٹ کا نام (اگر استعمال ہو)
```

### 3.2 ماڈل کی تشکیل 
```bash title="" linenums="0"
# چیٹ ماڈل کی تشکیل
AZURE_AI_AGENT_MODEL_NAME         # ڈیفالٹ: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # ڈیفالٹ: OpenAI (یا Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # ڈیفالٹ: تازہ ترین دستیاب
AZURE_AI_AGENT_DEPLOYMENT_NAME    # چیٹ ماڈل کے لیے ڈپلائمنٹ نام
AZURE_AI_AGENT_DEPLOYMENT_SKU     # ڈیفالٹ: معیاری
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # ڈیفالٹ: 80 (ہزاروں TPM)

# ایمبیڈنگ ماڈل کی تشکیل
AZURE_AI_EMBED_MODEL_NAME         # ڈیفالٹ: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # ڈیفالٹ: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # ڈیفالٹ: تازہ ترین دستیاب
AZURE_AI_EMBED_DEPLOYMENT_NAME    # ایمبیڈنگ کے لیے ڈپلائمنٹ نام
AZURE_AI_EMBED_DEPLOYMENT_SKU     # ڈیفالٹ: معیاری
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # ڈیفالٹ: 50 (ہزاروں TPM)

# ایجنٹ کی تشکیل
AZURE_AI_AGENT_NAME               # ایجنٹ کا ڈسپلے نام
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
AZURE_SEARCH_SERVICE_NAME        # تلاش کی خدمت کا نام
```

### 3.4 AI پروجیکٹ کی تشکیل 
```bash title="" linenums="0"
# موجودہ وسائل کا استعمال کریں
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # موجودہ AI پروجیکٹ کا مکمل ریسورس آئی ڈی
AZURE_EXISTING_AIPROJECT_ENDPOINT       # موجودہ پروجیکٹ کا اینڈ پوائنٹ یو آر ایل
```

### 3.5 اپنے متغیرات چیک کریں

اپنے ماحول کے متغیرات دیکھنے اور منظم کرنے کے لیے Azure Developer CLI استعمال کریں:

```bash title="" linenums="0"
# موجودہ ماحول کے تمام ماحول کی متغیرات دیکھیں
azd env get-values

# ایک مخصوص ماحول کی متغیر حاصل کریں
azd env get-value AZURE_ENV_NAME

# ایک ماحول کی متغیر سیٹ کریں
azd env set AZURE_LOCATION eastus

# .env فائل سے متعدد متغیرات سیٹ کریں
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**دستخطی نوٹ**:
یہ دستاویز اے آئی ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ اگرچہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم ذہن نشین رکھیں کہ خودکار ترجمے میں غلطیاں یا غیر یقینی معلومات ہو سکتی ہیں۔ اصل دستاویز کو اس کی مادری زبان میں معتبر ماخذ سمجھا جانا چاہیے۔ اہم معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->