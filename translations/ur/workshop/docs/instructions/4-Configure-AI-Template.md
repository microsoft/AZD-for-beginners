# 4. ٹیمپلیٹ کو ترتیب دیں

!!! tip "اس ماڈیول کے اختتام تک آپ یہ کرنے کے قابل ہوں گے"

    - [ ] `azure.yaml` کا مقصد سمجھنا
    - [ ] `azure.yaml` کی ساخت کو سمجھنا
    - [ ] azd لائف سائیکل `hooks` کی اہمیت کو سمجھنا
    - [ ] **لیب 3:** 

---

!!! prompt "`azure.yaml` فائل کیا کرتی ہے؟ کوڈفینس استعمال کریں اور اسے لائن بہ لائن وضاحت کریں"

      `azure.yaml` فائل **Azure Developer CLI (azd)** کے لیے کنفیگریشن فائل ہے۔ یہ وضاحت کرتی ہے کہ آپ کی ایپلیکیشن کو Azure پر کیسے ڈیپلائی کیا جائے، جس میں انفراسٹرکچر، سروسز، ڈیپلائیمنٹ ہکس، اور ماحول کے متغیرات شامل ہیں۔

---

## 1. مقصد اور فعالیت

یہ `azure.yaml` فائل ایک AI ایجنٹ ایپلیکیشن کے لیے **ڈیپلائیمنٹ بلیوپرنٹ** کے طور پر کام کرتی ہے جو:

1. **ماحول کی تصدیق کرتی ہے** ڈیپلائیمنٹ سے پہلے
2. **Azure AI سروسز فراہم کرتی ہے** (AI Hub، AI Project، Search، وغیرہ)
3. **Python ایپلیکیشن کو Azure Container Apps پر ڈیپلائی کرتی ہے**
4. **AI ماڈلز کو ترتیب دیتی ہے** چیٹ اور ایمبیڈنگ فنکشنلٹی کے لیے
5. **مانیٹرنگ اور ٹریسنگ سیٹ اپ کرتی ہے** AI ایپلیکیشن کے لیے
6. **نئے اور موجودہ** Azure AI پروجیکٹ کے منظرنامے سنبھالتی ہے

یہ فائل **ایک کمانڈ ڈیپلائیمنٹ** (`azd up`) کو ممکن بناتی ہے، جس میں مناسب تصدیق، فراہمی، اور ڈیپلائیمنٹ کے بعد کی ترتیب شامل ہے۔

??? info "دیکھنے کے لیے وسعت دیں: `azure.yaml`"

      `azure.yaml` فائل وضاحت کرتی ہے کہ Azure Developer CLI کو اس AI ایجنٹ ایپلیکیشن کو Azure میں کیسے ڈیپلائی اور مینیج کرنا چاہیے۔ آئیے اسے لائن بہ لائن توڑ کر دیکھتے ہیں۔

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

## 2. فائل کو ڈی کنسٹرکٹ کرنا

آئیے فائل کو سیکشن بہ سیکشن دیکھتے ہیں تاکہ یہ سمجھ سکیں کہ یہ کیا کرتی ہے - اور کیوں۔

### 2.1 **ہیڈر اور اسکیمہ (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **لائن 1**: IDE سپورٹ اور IntelliSense کے لیے YAML لینگویج سرور اسکیمہ کی توثیق فراہم کرتا ہے

### 2.2 پروجیکٹ میٹا ڈیٹا (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **لائن 5**: پروجیکٹ کا نام وضاحت کرتا ہے جو Azure Developer CLI استعمال کرتا ہے
- **لائنز 6-7**: وضاحت کرتا ہے کہ یہ ٹیمپلیٹ ورژن 1.0.2 پر مبنی ہے
- **لائنز 8-9**: Azure Developer CLI ورژن 1.14.0 یا اس سے زیادہ کی ضرورت ہے

### 2.3 ڈیپلائی ہکس (11-40)

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

- **لائنز 11-20**: **پری ڈیپلائیمنٹ ہک** - `azd up` سے پہلے چلتا ہے

      - Unix/Linux پر: ویلیڈیشن اسکرپٹ کو قابل عمل بناتا ہے اور اسے چلاتا ہے
      - Windows پر: پاور شیل ویلیڈیشن اسکرپٹ چلاتا ہے
      - دونوں انٹرایکٹو ہیں اور اگر ناکام ہوں تو ڈیپلائیمنٹ روک دیں گے

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
- **لائنز 21-30**: **پوسٹ پروویژن ہک** - Azure وسائل کے بننے کے بعد چلتا ہے

  - ماحول کے متغیرات لکھنے والے اسکرپٹس کو چلاتا ہے
  - اگر یہ اسکرپٹس ناکام ہوں تو بھی ڈیپلائیمنٹ جاری رکھتا ہے (`continueOnError: true`)

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
- **لائنز 31-40**: **پوسٹ ڈیپلائی ہک** - ایپلیکیشن ڈیپلائیمنٹ کے بعد چلتا ہے

  - آخری سیٹ اپ اسکرپٹس کو چلاتا ہے
  - اسکرپٹس ناکام ہونے پر بھی جاری رہتا ہے

### 2.4 سروس کنفیگریشن (41-48)

یہ آپ کی ایپلیکیشن سروس کو ترتیب دیتا ہے جو آپ ڈیپلائی کر رہے ہیں۔

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

- **لائن 42**: ایک سروس "api_and_frontend" کے نام سے وضاحت کرتا ہے
- **لائن 43**: سورس کوڈ کے لیے `./src` ڈائریکٹری کی طرف اشارہ کرتا ہے
- **لائن 44**: Python کو پروگرامنگ زبان کے طور پر وضاحت کرتا ہے
- **لائن 45**: Azure Container Apps کو ہوسٹنگ پلیٹ فارم کے طور پر استعمال کرتا ہے
- **لائنز 46-48**: Docker کنفیگریشن

      - "api_and_frontend" کو امیج نام کے طور پر استعمال کرتا ہے
      - Docker امیج کو Azure میں ریموٹلی بناتا ہے (لوکل میں نہیں)

### 2.5 پائپ لائن متغیرات (49-76)

یہ متغیرات آپ کو CI/CD پائپ لائنز میں `azd` چلانے میں مدد دیتے ہیں

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

یہ سیکشن وضاحت کرتا ہے کہ **ڈیپلائیمنٹ کے دوران** استعمال ہونے والے ماحول کے متغیرات، جو زمرے کے لحاظ سے منظم ہیں:

- **Azure وسائل کے نام (لائنز 51-60)**:
      - بنیادی Azure سروس وسائل کے نام جیسے Resource Group، AI Hub، AI Project، وغیرہ
- **فیچر فلیگز (لائنز 61-63)**:
      - مخصوص Azure سروسز کو فعال/غیر فعال کرنے کے لیے بولین متغیرات
- **AI ایجنٹ کنفیگریشن (لائنز 64-71)**:
      - مرکزی AI ایجنٹ کے لیے کنفیگریشن، جس میں نام، ID، ڈیپلائیمنٹ سیٹنگز، ماڈل کی تفصیلات شامل ہیں
- **AI ایمبیڈنگ کنفیگریشن (لائنز 72-79)**:
      - ایمبیڈنگ ماڈل کے لیے کنفیگریشن جو ویکٹر سرچ کے لیے استعمال ہوتا ہے
- **سرچ اور مانیٹرنگ (لائنز 80-84)**:
      - سرچ انڈیکس کا نام، موجودہ وسائل کے IDs، اور مانیٹرنگ/ٹریسنگ سیٹنگز

---

## 3. ماحول کے متغیرات کو جانیں
مندرجہ ذیل ماحول کے متغیرات آپ کے ڈیپلائیمنٹ کی کنفیگریشن اور رویے کو کنٹرول کرتے ہیں، ان کے بنیادی مقصد کے لحاظ سے منظم ہیں۔ زیادہ تر متغیرات کے معقول ڈیفالٹس ہیں، لیکن آپ انہیں اپنی مخصوص ضروریات یا موجودہ Azure وسائل کے مطابق حسب ضرورت بنا سکتے ہیں۔

### 3.1 ضروری متغیرات 

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

### 3.2 ماڈل کنفیگریشن 
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

### 3.3 فیچر ٹوگل
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

### 3.4 AI پروجیکٹ کنفیگریشن 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 اپنے متغیرات چیک کریں

Azure Developer CLI استعمال کریں تاکہ اپنے ماحول کے متغیرات کو دیکھیں اور مینیج کریں:

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

