# 4. Configure a Template

!!! tip "ဤမော်ဂျူး အဆုံးသတ်လျင် သင် ပြုလုပ်နိုင်မည်"

    - [ ] Understand the purpose of `azure.yaml`
    - [ ] Understand the structure of `azure.yaml`
    - [ ] Understand the value of azd lifecycle `hooks`
    - [ ] **Lab 4:** Explore and modify environment variables

---

!!! prompt "What is the `azure.yaml` file do? Use a codefence and explain it line by line"

      The `azure.yaml` file is the **configuration file for Azure Developer CLI (azd)**. It defines how your application should be deployed to Azure, including infrastructure, services, deployment hooks, and environment variables.

---

## 1. Purpose and Functionality

This `azure.yaml` file serves as the **deployment blueprint** for an AI agent application that:

1. **Validates environment** before deployment
2. **Provisions Azure AI services** (AI Hub, AI Project, Search, etc.)
3. **Deploys a Python application** to Azure Container Apps
4. **Configures AI models** for both chat and embedding functionality
5. **Sets up monitoring and tracing** for the AI application
6. **Handles both new and existing** Azure AI project scenarios

The file enables **one-command deployment** (`azd up`) of a complete AI agent solution with proper validation, provisioning, and post-deployment configuration.

??? info "Expand To View: `azure.yaml`"

      The `azure.yaml` file defines how Azure Developer CLI should deploy and manage this AI Agent application in Azure. Let's break it down line-by-line.

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

## 2. Deconstructing The File

Let's go through the file section by section, to understand what it does - and why.

### 2.1 **Header and Schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Line 1**: YAML language server schema ကို IDE support နှင့် IntelliSense အတွက် သတ်မှတ်ပေးသည်။

### 2.2 Project Metadata (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Line 5**: Azure Developer CLI မှ အသုံးပြုမည့် project အမည်ကို သတ်မှတ်သည်။
- **Lines 6-7**: ဤပရောဂျက်သည် template version 1.0.2 အပေါ် အခြေခံထားသည်ကို ဖော်ပြသည်။
- **Lines 8-9**: Azure Developer CLI ဗားရှင်း 1.14.0 သို့မဟုတ် ထို့ထက်မြင့် ဗားရှင်း လိုအပ်သည်။

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

- **Lines 11-20**: **Pre-deployment hook** - `azd up` များစဉ် မတိုင်ခင် ပြေးဆောင်ရွက်သည်။

      - On Unix/Linux: သတ်မှတ်မှု စစ်ဆေးရေး script ကို executable အဖြစ် ပြောင်းပြီး 실행 မည်
      - On Windows: PowerShell validation script ကို 실행 မည်
      - နှစ်ဘက်လုံး interactive ဖြစ်ပြီး အရေးပေါ် အမှားရှိပါက deployment ကို ရပ်ထားမည်

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
- **Lines 21-30**: **Post-provision hook** - Azure resource များ ဖန်တီးပြီးနောက် ပြေးဆောင်ရွက်သည်

  - environment variable များ ကိုရေးသွင်းသည့် scripts များကို 실행 မည်
  - ဤ scripts များ မအောင်မြင်လျှင်ပါ deployment ကို ဆက်လက်လုပ်ဆောင်မည် (`continueOnError: true`)

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
- **Lines 31-40**: **Post-deploy hook** - application ကို deploy ပြီးနောက် ပြေးဆောင်ရွက်သည်

  - နောက်ဆုံး ပြင်ဆင်မှု scripts များကို 실행 မည်
  - scripts များ မအောင်မြင်လျှင်ပါ ဆက်လက်လုပ်ဆောင်မည်

### 2.4 Service Config (41-48)

This configures the application service you are deploying.

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

- **Line 42**: "api_and_frontend" ဟု အမည်ပေးထားသော service ကို သတ်မှတ်သည်
- **Line 43**: ကုဒ် များအတွက် `./src` ဒါရိုက်တာကို ကိုးကားသည်
- **Line 44**: Python ကို programming language အဖြစ် သတ်မှတ်သည်
- **Line 45**: Azure Container Apps ကို hosting platform အဖြစ် အသုံးပြုသည်
- **Lines 46-48**: Docker သတ်မှတ်ချက်များ

      - "api_and_frontend" ကို image အမည်အဖြစ် အသုံးပြုသည်
      - Docker image ကို ဒေသတွင်းမစBuildဘဲ Azure မှအဝေးမှ အဆောက်အအုံလုပ်ပေးသည် (remote build)

### 2.5 Pipeline Variables (49-76)

These are variables to help you run `azd` in CI/CD pipelines for automation

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

This section defines environment variables used **during deployment**, organized by category:

- **Azure Resource Names (Lines 51-60)**:
      - အဓိက Azure ဝန်ဆောင်မှု resource အမည်များ (ဥပမာ Resource Group, AI Hub, AI Project, စသည်)
- **Feature Flags (Lines 61-63)**:
      - အထူး Azure ဝန်ဆောင်မှုများကို ဖွင့်/ပိတ် စေနိုင်သည့် boolean အမျိုးအစား variables များ
- **AI Agent Configuration (Lines 64-71)**:
      - အဓိက AI agent အတွက် အမည်၊ ID, deployment သတ်မှတ်ချက်များ၊ model ဆိုင်ရာ အသေးစိတ်များ
- **AI Embedding Configuration (Lines 72-79)**:
      - vector search အတွက် အသုံးပြုမည့် embedding model အတွက် သတ်မှတ်ချက်များ
- **Search and Monitoring (Lines 80-84)**:
      - Search index အမည်၊ ရှိပြီးသား resource ID များ၊ နှင့် monitoring/tracing သတ်မှတ်ချက်များ

---

## 3. Know Env Variables
The following environment variables control your deployment's configuration and behavior, organized by their primary purpose. Most variables have sensible defaults, but you can customize them to match your specific requirements or existing Azure resources.

### 3.1 Required Variables 

```bash title="" linenums="0"
# Azure အဓိက ဖွဲ့စည်းမှု
AZURE_ENV_NAME                    # ပတ်ဝန်းကျင် အမည် (ရင်းမြစ်အမည်ပေးရာတွင် အသုံးပြုသည်)
AZURE_LOCATION                    # တပ်ဆင်မည့် ဒေသ
AZURE_SUBSCRIPTION_ID             # ပစ်မှတ် subscription
AZURE_RESOURCE_GROUP              # ရင်းမြစ်အုပ်စု အမည်
AZURE_PRINCIPAL_ID                # RBAC အတွက် User principal

# ရင်းမြစ်အမည်များ (မသတ်မှတ်ထားပါက အလိုအလျောက် ဖန်တီးမည်)
AZURE_AIHUB_NAME                  # Microsoft Foundry hub အမည်
AZURE_AIPROJECT_NAME              # AI စီမံကိန်း အမည်
AZURE_AISERVICES_NAME             # AI ဝန်ဆောင်မှု အကောင့် အမည်
AZURE_STORAGE_ACCOUNT_NAME        # သိုလှောင်မှု အကောင့် အမည်
AZURE_CONTAINER_REGISTRY_NAME     # Container registry အမည်
AZURE_KEYVAULT_NAME               # Key Vault အမည် (သုံးထားပါက)
```

### 3.2 Model Configuration 
```bash title="" linenums="0"
# Chat မော်ဒယ် ဖွဲ့စည်းမှု
AZURE_AI_AGENT_MODEL_NAME         # ပုံမှန်: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # ပုံမှန်: OpenAI (သို့မဟုတ် Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # ပုံမှန်: လက်ရှိရနိုင်သော နောက်ဆုံး
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Chat မော်ဒယ်အတွက် တပ်ဆင်မှု အမည်
AZURE_AI_AGENT_DEPLOYMENT_SKU     # ပုံမှန်: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # ပုံမှန်: 80 (ထောင်စု TPM)

# Embedding မော်ဒယ် ဖွဲ့စည်းမှု
AZURE_AI_EMBED_MODEL_NAME         # ပုံမှန်: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # ပုံမှန်: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # ပုံမှန်: လက်ရှိရနိုင်သော နောက်ဆုံး
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Embeddings အတွက် တပ်ဆင်မှု အမည်
AZURE_AI_EMBED_DEPLOYMENT_SKU     # ပုံမှန်: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # ပုံမှန်: 50 (ထောင်စု TPM)

# Agent ဖွဲ့စည်းမှု
AZURE_AI_AGENT_NAME               # Agent ပြသမည့် အမည်
AZURE_EXISTING_AGENT_ID           # ရှိပြီးသား Agent ကို အသုံးပြုပါ (ရွေးချယ်စရာ)
```

### 3.3 Feature Toggle
```bash title="" linenums="0"
# ရွေးချယ်နိုင်သော ဝန်ဆောင်မှုများ
USE_APPLICATION_INSIGHTS         # ပုံမှန်: မှန်
USE_AZURE_AI_SEARCH_SERVICE      # ပုံမှန်: မမှန်
USE_CONTAINER_REGISTRY           # ပုံမှန်: မှန်

# စောင့်ကြည့်ခြင်းနှင့် လမ်းကြောင်းထောက်လှမ်းခြင်း
ENABLE_AZURE_MONITOR_TRACING     # ပုံမှန်: မမှန်
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # ပုံမှန်: မမှန်

# ရှာဖွေရေး ဆက်တင်များ
AZURE_AI_SEARCH_INDEX_NAME       # ရှာဖွေရေး အင်ဒက်စ် အမည်
AZURE_SEARCH_SERVICE_NAME        # ရှာဖွေရေး ဝန်ဆောင်မှု အမည်
```

### 3.4 AI Project Configuration 
```bash title="" linenums="0"
# ရှိပြီးသား အရင်းအမြစ်များကို အသုံးပြုပါ
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # ရှိပြီးသား AI စီမံကိန်း၏ အရင်းအမြစ် ID အပြည့်အစုံ
AZURE_EXISTING_AIPROJECT_ENDPOINT       # ရှိပြီးသား စီမံကိန်း၏ endpoint URL
```

### 3.5 Check Your Variables

Use the Azure Developer CLI to view and manage your environment variables:

```bash title="" linenums="0"
# လက်ရှိ ပတ်ဝန်းကျင်အတွက် ပတ်ဝန်းကျင် ပြောင်းလဲတန်ဖိုးများအားလုံးကို ကြည့်ရန်
azd env get-values

# တိကျသည့် ပတ်ဝန်းကျင် ပြောင်းလဲတန်ဖိုးတစ်ခုကို ရယူရန်
azd env get-value AZURE_ENV_NAME

# ပတ်ဝန်းကျင် ပြောင်းလဲတန်ဖိုးတစ်ခုကို သတ်မှတ်ရန်
azd env set AZURE_LOCATION eastus

# .env ဖိုင်မှ အများပြားသော ပြောင်းလဲတန်ဖိုးများကို သတ်မှတ်ရန်
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
သတိပေးချက်:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှုဖြစ်သည့် [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် မှန်ကန်မှုအတွက် ကြိုးပမ်းထားသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း ကျေးဇူးပြု၍ သတိပြုပါ။ မူလစာတမ်းကို ထို၏ မူရင်းဘာသာစကားဖြင့် ရရှိသော မူရင်းစာတမ်းကို တရားဝင် အချက်အလက်အဖြစ် သတ်မှတ်ထားသင့်သည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန် အထူးကျွမ်းကျင်သူ၏ ဘာသာပြန်ချက်ကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းကြောင့် ဖြစ်ပေါ်လာသည့် နားလည်မှုမှားများ သို့မဟုတ် မှတ်ချက်များအတွက် ကျွန်ုပ်တို့သည် တာဝန် မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->