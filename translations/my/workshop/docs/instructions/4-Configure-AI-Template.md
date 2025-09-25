<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b4a16f82d68f5820d574acd8946843e4",
  "translation_date": "2025-09-25T02:06:15+00:00",
  "source_file": "workshop/docs/instructions/4-Configure-AI-Template.md",
  "language_code": "my"
}
-->
# 4. Template ကို Configure လုပ်ခြင်း

!!! tip "ဒီ module အဆုံးသတ်တဲ့အချိန်မှာ သင်တတ်မြောက်ထားမယ့်အရာများ"

    - [ ] `azure.yaml` ရဲ့ ရည်ရွယ်ချက်ကို နားလည်ထားမယ်
    - [ ] `azure.yaml` ရဲ့ ဖွဲ့စည်းပုံကို နားလည်ထားမယ်
    - [ ] azd lifecycle `hooks` ရဲ့ အရေးပါမှုကို နားလည်ထားမယ်
    - [ ] **Lab 3:** 

---

!!! prompt "`azure.yaml` ဖိုင်ကဘာလုပ်ပေးသလဲ? Codefence ကိုသုံးပြီး တစ်ကြောင်းချင်းရှင်းပြပါ"

      `azure.yaml` ဖိုင်က **Azure Developer CLI (azd) ရဲ့ configuration ဖိုင်** ဖြစ်ပါတယ်။ ဒီဖိုင်က သင့် application ကို Azure မှာ deploy လုပ်ဖို့အတွက် infrastructure, services, deployment hooks, နဲ့ environment variables တွေကို သတ်မှတ်ပေးပါတယ်။

---

## 1. ရည်ရွယ်ချက်နှင့် လုပ်ဆောင်ချက်

ဒီ `azure.yaml` ဖိုင်က AI agent application တစ်ခုအတွက် **deployment blueprint** အဖြစ် လုပ်ဆောင်ပေးပါတယ်၊ အထူးသဖြင့်:

1. **Environment ကို validate လုပ်ခြင်း** deployment မလုပ်ခင်
2. **Azure AI services တွေ provision လုပ်ခြင်း** (AI Hub, AI Project, Search စသည်တို့)
3. **Python application ကို Azure Container Apps မှာ deploy လုပ်ခြင်း**
4. **AI models တွေ configure လုပ်ခြင်း** chat နဲ့ embedding functionality အတွက်
5. **AI application အတွက် monitoring နဲ့ tracing စနစ်များ စီစဉ်ခြင်း**
6. **အသစ်နဲ့ ရှိပြီးသား** Azure AI project scenarios နှစ်ခုလုံး handle လုပ်ခြင်း

ဒီဖိုင်က **တစ် command deployment** (`azd up`) ကို enable လုပ်ပေးပြီး validation, provisioning, နဲ့ post-deployment configuration ကို အဆင်ပြေစွာလုပ်ဆောင်နိုင်ပါတယ်။

??? info "Expand To View: `azure.yaml`"

      `azure.yaml` ဖိုင်က Azure Developer CLI ကို ဒီ AI Agent application ကို Azure မှာ deploy နဲ့ manage လုပ်ဖို့ ဘယ်လိုလုပ်ရမယ်ဆိုတာကို သတ်မှတ်ပေးပါတယ်။ အပိုင်းစီကို တစ်ကြောင်းချင်းရှင်းပြပါ။

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: hooks တွေလိုအပ်လား?
      # TODO: variables အားလုံးလိုအပ်လား?

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

## 2. ဖိုင်ကို ခွဲခြမ်းစိတ်ဖြာခြင်း

ဖိုင်ရဲ့ အပိုင်းစီကို သေချာနားလည်ဖို့အတွက် ဘာလုပ်ပေးသလဲ၊ ဘာကြောင့်လိုအပ်လဲဆိုတာကို ရှင်းပြပါ။

### 2.1 **Header နဲ့ Schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Line 1**: YAML language server schema validation ကို IDE support နဲ့ IntelliSense အတွက် ပေးထားပါတယ်။

### 2.2 Project Metadata (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Line 5**: Azure Developer CLI အတွက် project name ကို သတ်မှတ်ထားပါတယ်။
- **Lines 6-7**: Template version 1.0.2 ကို အသုံးပြုထားပါတယ်။
- **Lines 8-9**: Azure Developer CLI version 1.14.0 သို့မဟုတ် အထက်ကို လိုအပ်ပါတယ်။

### 2.3 Deploy Hooks (11-40)

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

- **Lines 11-20**: **Pre-deployment hook** - `azd up` မလုပ်ခင် run လုပ်ပါတယ်။

      - Unix/Linux မှာ: validation script ကို executable လုပ်ပြီး run လုပ်ပါတယ်။
      - Windows မှာ: PowerShell validation script ကို run လုပ်ပါတယ်။
      - နှစ်ခုလုံး interactive ဖြစ်ပြီး fail ဖြစ်ရင် deployment ကို ရပ်တန့်စေပါတယ်။

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
- **Lines 21-30**: **Post-provision hook** - Azure resources တွေ create ပြီးတဲ့နောက် run လုပ်ပါတယ်။

  - Environment variable တွေကိုရေးတဲ့ script တွေကို run လုပ်ပါတယ်။
  - Script fail ဖြစ်ရင်တောင် deployment ကို ဆက်လုပ်နိုင်ပါတယ် (`continueOnError: true`)

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
- **Lines 31-40**: **Post-deploy hook** - application deployment ပြီးတဲ့နောက် run လုပ်ပါတယ်။

  - Final setup scripts တွေကို run လုပ်ပါတယ်။
  - Script fail ဖြစ်ရင်တောင် ဆက်လုပ်နိုင်ပါတယ်။

### 2.4 Service Config (41-48)

ဒီအပိုင်းက သင့် application service ကို configure လုပ်ပေးပါတယ်။

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

- **Line 42**: "api_and_frontend" ဆိုတဲ့ service ကို သတ်မှတ်ထားပါတယ်။
- **Line 43**: `./src` directory ကို source code အတွက် သတ်မှတ်ထားပါတယ်။
- **Line 44**: Python ကို programming language အဖြစ် သတ်မှတ်ထားပါတယ်။
- **Line 45**: Azure Container Apps ကို hosting platform အဖြစ် သတ်မှတ်ထားပါတယ်။
- **Lines 46-48**: Docker configuration

      - "api_and_frontend" ကို image name အဖြစ် သတ်မှတ်ထားပါတယ်။
      - Docker image ကို Azure မှာ remote build လုပ်ပါတယ် (local build မဟုတ်ပါ)။

### 2.5 Pipeline Variables (49-76)

CI/CD pipelines မှာ automation အတွက် `azd` ကို run လုပ်ဖို့ variable တွေပါဝင်ပါတယ်။

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

ဒီအပိုင်းက deployment အတွင်း အသုံးပြုမယ့် environment variables တွေကို သတ်မှတ်ထားပြီး category အလိုက် စီစဉ်ထားပါတယ်:

- **Azure Resource Names (Lines 51-60)**:
      - Azure service resource names တွေ e.g., Resource Group, AI Hub, AI Project စသည်တို့
- **Feature Flags (Lines 61-63)**:
      - Azure services အချို့ကို enable/disable လုပ်ဖို့ Boolean variables
- **AI Agent Configuration (Lines 64-71)**:
      - Main AI agent အတွက် configuration e.g., name, ID, deployment settings, model details
- **AI Embedding Configuration (Lines 72-79)**:
      - Vector search အတွက် embedding model configuration
- **Search and Monitoring (Lines 80-84)**:
      - Search index name, existing resource IDs, နဲ့ monitoring/tracing settings

---

## 3. Env Variables ကို သိထားပါ
အောက်ပါ environment variables တွေက သင့် deployment ရဲ့ configuration နဲ့ လုပ်ဆောင်ချက်ကို ထိန်းချုပ်ပေးပြီး အဓိကရည်ရွယ်ချက်အလိုက် စီစဉ်ထားပါတယ်။ Variables အများစုမှာ default values ရှိပြီး သင့်လိုအပ်ချက်နဲ့ Azure resources တွေကို အလိုက်သင့် customize လုပ်နိုင်ပါတယ်။

### 3.1 လိုအပ်တဲ့ Variables 

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

### 3.2 Model Configuration 
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

### 3.3 Feature Toggle
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

### 3.4 AI Project Configuration 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 Variables ကို စစ်ဆေးပါ

Azure Developer CLI ကို အသုံးပြုပြီး environment variables တွေကို ကြည့်ရှုနဲ့ စီမံနိုင်ပါတယ်:

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

