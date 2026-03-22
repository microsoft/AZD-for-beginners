# 4. Configure a Template

!!! tip "ဤမော်ဒျူးအဆုံးသတ်သောအချိန်တွင် သင်သည် အောက်ပါအရာများကို လုပ်နိုင်ပါမည်"

    - [ ] `azure.yaml` ရဲ့ ရည်ရွယ်ချက်ကို နားလည်သည်
    - [ ] `azure.yaml` တည်ဆောက်ပုံကို နားလည်သည်
    - [ ] azd lifecycle `hooks` のတန်ဖိုးကို နားလည်သည်
    - [ ] **Lab 4:** ပတ်ဝန်းကျင်ပြောင်းပေးမှုများကို စူးစမ်းပြုပြင်မည်

---

!!! prompt "`azure.yaml` ဖိုင်က ဘာလုပ်သလဲ? ကုဒ်ဖမ်းနှင့် အပိုင်းအလိုက် ရှင်းပြပါ"

      `azure.yaml` ဖိုင်သည် **Azure Developer CLI (azd) အတွက် ဖိုင်တစ်ခုဖြစ်ပြီး၊ ထိုဖိုင်က သင့် application ကို Azure တွင် ထည့်သွင်းပေးမယ့် နည်းလမ်းများ (အင်ဖရာ၊ ဝန်ဆောင်မှုများ၊ deploy hooks၊ ပတ်ဝန်းကျင်သတ်မှတ်ချက်များ) ကို သတ်မှတ်ပေးသည်။**

---

## 1. Purpose and Functionality

ဤ `azure.yaml` ဖိုင်သည် AI agent အပလီ케ေးရှင်းအတွက် **deployment အတွက် အခြေခံပုံစံ (blueprint)** အဖြစ် အသုံးပြုသည်၊ ၎င်းသည် -

1. ထည့်သွင်းမတိုင်မီ ပတ်ဝန်းကျင်ကို **မူရင်းစစ်ဆေးပေးသည်**
2. Azure AI ဝန်ဆောင်မှုများကို **Provision** ပြုလုပ်ပေးသည် (AI Hub, AI Project, Search စသည်)
3. Python အပလီ케ေးရှင်းကို **Azure Container Apps** တွင် Deploy လုပ်ပေးသည်
4. Chat နှင့် embedding အတွက် AI မော်ဒယ်များကို **ဖွဲ့စည်းပေးသည်**
5. AI application အတွက် **monitoing နှင့် tracing** ကို သတ်မှတ်ပေးသည်
6. Azure AI project အသစ်နှင့် ရှိပြီးသား အခြေအနေများ နှစ်မျိုးလုံးကို ကိုင်တွယ်နိုင်သည်

ဤဖိုင်က `azd up` တစ်ချက်ပဲဖြင့် validation, provisioning, နှင့် post-deployment configuration တွေပါဝင်သည့် ပြည့်စုံသော AI agent ဖြေရှင်းချက်ကို ထည့်သွင်းပေးရန် ခွင့်ပြုသည်။

??? info "Expand To View: `azure.yaml`"

      `azure.yaml` ဖိုင်သည် Azure Developer CLI သည် ဤ AI Agent application ကို Azure တွင် deployment နှင့် စီမံခန့်ခွဲရန် မည်သို့ ထိန်းချုပ်ရမည်ကို သတ်မှတ်ပေးသည်။ အပိုင်းပိုင်း အလိုက် ရှင်းလင်းပါမည်။

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

## 2. ဖိုင်ကို ပိုမိုနက်ရှိုင်းစေခြင်း (Deconstructing The File)

ဖိုင်ကို အပိုင်းလိုက် ကြည့်ပြီး ၎င်း၏ လုပ်ဆောင်ချက်နှင့် အကြောင်းရင်းကို နားလည်ကြရအောင်။

### 2.1 **Header and Schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Line 1**: IDE အတွက် support နှင့် IntelliSense အတွက် YAML language server schema validation ကို ပေးသည်

### 2.2 Project Metadata (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Line 5**: Azure Developer CLI မှ အသုံးပြုမည့် project နာမည်ကို သတ်မှတ်သည်
- **Lines 6-7**: ဤပရောဂျက်သည် template version 1.0.2 အပေါ် အခြေခံထားသည်ဟု ဖေါ်ပြသည်
- **Lines 8-9**: Azure Developer CLI ဗားရှင်း 1.14.0 သို့မဟုတ် ထို့အထက် လိုအပ်သည်

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

- **Lines 11-20**: **Pre-deployment hook** - `azd up` မတိုင်မီ အလုပ်လုပ်သည်

      - Unix/Linux များတွင်: validation script ကို executable ပြုလုပ်ပြီး run သည်
      - Windows တြင်: PowerShell validation script ကို run လုပ်သည်
      - နှစ်ပတ်လည်ပတ်လုပ်ငန်းကို interactive ဖြစ်ပြီး မအောင်မြင်လျှင် deployment ကို ရပ်ဆိုင်းမည်

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
- **Lines 21-30**: **Post-provision hook** - Azure resources များ ဖန်တီးပြီးနောက် အလုပ်လုပ်သည်

  - ပတ်ဝန်းကျင် အပြောင်းအလဲများကို ရေးသွင်းသည့် script များကို အလုပ်လုပ်စေသည်
  - ၎င်း script များ မအောင်မြင်ပေမယ့် deployment ကို ဆက်လက်လုပ်ဆောင်ရန် (`continueOnError: true`)

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
- **Lines 31-40**: **Post-deploy hook** - application deployment ပြီးနောက် အလုပ်လုပ်သည်

  - နောက်ဆုံး setup script များကို အလုပ်လုပ်စေသည်
  - script များ မအောင်မြင်လည်း ဆက်လက်လုပ်ဆောင်မည်

### 2.4 Service Config (41-48)

ဤမှာ သင် deploy လုပ်မည့် application service ကို ဖော်ပြထားသည်။

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
- **Line 43**: မူရင်းကုဒ်အတွက် `./src` ဒိုင်ရက်ထရီကို ညွှန်ပြသည်
- **Line 44**: programming language အဖြစ် Python ကို သတ်မှတ်သည်
- **Line 45**: hosting ပလက်ဖောင်း အဖြစ် Azure Container Apps ကို အသုံးပြုသည်
- **Lines 46-48**: Docker သတ်မှတ်ချက်များ

      - "api_and_frontend" ကို image နာမည်အဖြစ် သုံးသည်
      - Docker image ကို local မှမဟုတ်ဘဲ Azure တွင် remote အဖြစ် တည်ဆောက်သည်

### 2.5 Pipeline Variables (49-76)

ဤများသည် CI/CD pipeline များတွင် `azd` ကို အလိုအလျောက် ရှုံးစွဲနိုင်ရန် အသုံးပြုသော variables များဖြစ်သည်။

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

ဤအပိုင်းတွင် deployment အတွင်း အသုံးပြုမည့် environment variables များကို အမျိုးအစားအလိုက် သတ်မှတ်ထားသည် -

- **Azure Resource Names (Lines 51-60)**:
      - Resource Group, AI Hub, AI Project စသည်ဖြင့် core Azure service resource အမည်များ
- **Feature Flags (Lines 61-63)**:
      - အချို့ Azure ဝန်ဆောင်မှုများကို ဖွင့်/ပိတ်ရန် boolean variables များ
- **AI Agent Configuration (Lines 64-71)**:
      - အဓိက AI agent အတွက် နာမည်၊ ID၊ deployment သတ်မှတ်ချက်များ၊ မော်ဒယ် အသေးစိတ်များ
- **AI Embedding Configuration (Lines 72-79)**:
      - vector search အတွက် အသုံးပြုမည့် embedding မော်ဒယ် configuration
- **Search and Monitoring (Lines 80-84)**:
      - Search index နာမည်၊ ရှိပြီးသား resource ID များ၊ monitoring/tracing သတ်မှတ်ချက်များ

---

## 3. Env Variables ကို သိရှိထားရန်
အောက်ပါ environment variables များသည် သင့် deployment ရဲ့ ကိုးကားချက်နှင့် အပြုအမူကို ထိန်းချုပ်ပေးသည်၊ အဓိက ရည်ရွယ်ချက်အလိုက် စုစည်းထားသည်။ များစွာသော variables များတွင် သဘာဝအတိုင်း သတ်မှတ်ထားသော default များရှိသော်လည်း သင်၏လိုအပ်ချက်များနှင့် ရှိပြီးသား Azure resource များနှင့် ကိုက်ညီအောင် စိတ်ကြိုက်ပြင်ဆင်နိုင်သည်။

### 3.1 လိုအပ်သော Variables

```bash title="" linenums="0"
# အဓိက Azure ဆက်တင်
AZURE_ENV_NAME                    # ပတ်ဝန်းကျင် အမည် (ရင်းမြစ်အမည် သတ်မှတ်ရာတွင် အသုံးပြုသည်)
AZURE_LOCATION                    # တပ်ဆင်မည့် ဒေသ
AZURE_SUBSCRIPTION_ID             # ပစ်မှတ် စာရင်းသွင်းမှု
AZURE_RESOURCE_GROUP              # ရင်းမြစ် အုပ်စု အမည်
AZURE_PRINCIPAL_ID                # RBAC အတွက် အသုံးပြုသူ principal

# ရင်းမြစ်အမည်များ (မသတ်မှတ်ပါက အလိုအလျောက် ဖန်တီးမည်)
AZURE_AIHUB_NAME                  # Microsoft Foundry hub အမည်
AZURE_AIPROJECT_NAME              # AI ပရောဂျက် အမည်
AZURE_AISERVICES_NAME             # AI ဝန်ဆောင်မှု အကောင့် အမည်
AZURE_STORAGE_ACCOUNT_NAME        # သိုလှောင်မှု အကောင့် အမည်
AZURE_CONTAINER_REGISTRY_NAME     # Container registry အမည်
AZURE_KEYVAULT_NAME               # Key Vault အမည် (အသုံးပြုပါက)
```

### 3.2 မော်ဒယ် သတ်မှတ်ချက်
```bash title="" linenums="0"
# Chat မော်ဒယ် ချိန်ညှိချက်
AZURE_AI_AGENT_MODEL_NAME         # ပုံမှန်: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # ပုံမှန်: OpenAI (သို့မဟုတ် Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # ပုံမှန်: ရရှိနိုင်သည့် နောက်ဆုံး
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Chat မော်ဒယ် အတွက် တပ်ဆင်မှုအမည်
AZURE_AI_AGENT_DEPLOYMENT_SKU     # ပုံမှန်: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # ပုံမှန်: 80 (thousands of TPM)

# Embedding မော်ဒယ် ချိန်ညှိချက်
AZURE_AI_EMBED_MODEL_NAME         # ပုံမှန်: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # ပုံမှန်: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # ပုံမှန်: ရရှိနိုင်သည့် နောက်ဆုံး
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Embeddings အတွက် တပ်ဆင်မှုအမည်
AZURE_AI_EMBED_DEPLOYMENT_SKU     # ပုံမှန်: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # ပုံမှန်: 50 (thousands of TPM)

# Agent ချိန်ညှိချက်
AZURE_AI_AGENT_NAME               # Agent ပြသမည့် အမည်
AZURE_EXISTING_AGENT_ID           # ရှိပြီးသား agent ကို အသုံးပြုပါ (ရွေးချယ်လို့ရသည်)
```

### 3.3 Feature Toggle
```bash title="" linenums="0"
# ရွေးချယ်နိုင်သည့် ဝန်ဆောင်မှုများ
USE_APPLICATION_INSIGHTS         # ပုံမှန်: true
USE_AZURE_AI_SEARCH_SERVICE      # ပုံမှန်: false
USE_CONTAINER_REGISTRY           # ပုံမှန်: true

# စောင့်ကြည့်နှင့် လိုက်လံစစ်ဆေးခြင်း
ENABLE_AZURE_MONITOR_TRACING     # ပုံမှန်: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # ပုံမှန်: false

# ရှာဖွေရေး ဆက်တင်
AZURE_AI_SEARCH_INDEX_NAME       # ရှာဖွေရေး အညွှန်းအမည်
AZURE_SEARCH_SERVICE_NAME        # ရှာဖွေရေး ဝန်ဆောင်မှုအမည်
```

### 3.4 AI Project Configuration
```bash title="" linenums="0"
# ရှိပြီးသား အရင်းအမြစ်များကို အသုံးပြုပါ
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # ရှိပြီးသား AI ပရောဂျက်၏ အပြည့်အစုံ အရင်းအမြစ် ID
AZURE_EXISTING_AIPROJECT_ENDPOINT       # ရှိပြီးသား ပရောဂျက်၏ Endpoint URL
```

### 3.5 သင့် Variables များကို စစ်ဆေးပါ

Azure Developer CLI ကို အသုံးပြု၍ သင့် environment variables များကို ကြည့်ရှု၊ စီမံနိုင်ပါသည်။

```bash title="" linenums="0"
# လက်ရှိ ပတ်ဝန်းကျင်အတွက် environment variable အားလုံးကို ကြည့်ရန်
azd env get-values

# တိကျသော environment variable တစ်ခုကို ရယူရန်
azd env get-value AZURE_ENV_NAME

# environment variable တစ်ခုကို သတ်မှတ်ရန်
azd env set AZURE_LOCATION eastus

# .env ဖိုင်မှ တန်ဖိုးများစွာကို သတ်မှတ်ရန်
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်ရေးအတွက် ကြိုးပမ်းပါသော်လည်း အလိုအလျောက်ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်ပါသည်ဆိုတာ သတိပြုပါ။ မူရင်းစာတမ်းကို မူလဘာသာစကားဖြင့်သာ ယုံကြည်ရသည့် အတည်ပြု အရင်းအမြစ်အနေဖြင့် ကိုးကားသင့်ပါသည်။ အရေးပါသော အချက်အလက်များအတွက် လူ့ပရော်ဖက်ရှင်နယ် ဘာသာပြန်ချက်ကို ကိုးကားရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုသည့်အတွက်ဖြစ်ပေါ်လာနိုင်သည့် နားမလည်မှုများ သို့မဟုတ် အဓိပ္ပါယ်ကောက်ယူမှားယွင်းမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->