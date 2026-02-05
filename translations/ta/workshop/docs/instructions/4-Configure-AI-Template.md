# 4. ஒரு டெம்ப்ளேட்டை அமைக்கவும்

!!! tip "இந்த தொகுதியின் முடிவில் நீங்கள் செய்ய முடியும்"

    - [ ] `azure.yaml`-இன் நோக்கம் புரிந்துகொள்ளப்பட்டது
    - [ ] `azure.yaml`-இன் அமைப்பு புரிந்துகொள்ளப்பட்டது
    - [ ] azd வாழ்க்கைச் சுழற்சியின் `hooks`-இன் மதிப்பு புரிந்துகொள்ளப்பட்டது
    - [ ] **Lab 3:** 

---

!!! prompt "`azure.yaml` கோப்பு என்ன செய்கிறது? ஒரு codefence பயன்படுத்தி அதை வரி வரியாக விளக்கவும்"

      `azure.yaml` கோப்பு என்பது **Azure Developer CLI (azd)-க்கான கட்டமைப்பு கோப்பு** ஆகும். இது உங்கள் பயன்பாட்டை Azure-க்கு எப்படி பிரசுரிக்க வேண்டும் என்பதை வரையறுக்கிறது, அதில் உள்கட்டமைப்பு, சேவைகள், பிரசுர hooks, மற்றும் சூழல் மாறிகள் அடங்கும்.

---

## 1. நோக்கம் மற்றும் செயல்பாடு

இந்த `azure.yaml` கோப்பு AI முகவர் பயன்பாட்டிற்கான **பிரசுர ப்ளூபிரிண்ட்** ஆக செயல்படுகிறது, இது:

1. **சூழலை சரிபார்க்கிறது** பிரசுரத்திற்கு முன்
2. **Azure AI சேவைகளை வழங்குகிறது** (AI Hub, AI Project, Search, போன்றவை)
3. **Python பயன்பாட்டை Azure Container Apps-க்கு பிரசுரிக்கிறது**
4. **AI மாதிரிகளை அமைக்கிறது** உரையாடல் மற்றும் embedding செயல்பாடுகளுக்கு
5. **AI பயன்பாட்டிற்கான கண்காணிப்பு மற்றும் டிரேசிங் அமைக்கிறது**
6. **புதிய மற்றும் ஏற்கனவே உள்ள** Azure AI திட்ட சூழல்களை கையாள்கிறது

இந்த கோப்பு **ஒரு கட்டளையில் பிரசுரத்தை** (`azd up`) சரிபார்ப்பு, வழங்கல், மற்றும் பிரசுரத்திற்குப் பிந்தைய அமைப்புடன் முழுமையான AI முகவர் தீர்வை இயக்குகிறது.

??? info "காண்பிக்க விரிவாக்கவும்: `azure.yaml`"

      `azure.yaml` கோப்பு Azure Developer CLI இந்த AI Agent பயன்பாட்டை Azure-ல் எப்படி பிரசுரிக்க வேண்டும் மற்றும் நிர்வகிக்க வேண்டும் என்பதை வரையறுக்கிறது. அதை வரி வரியாக பிரிக்கலாம்.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: hooks தேவைதானா? 
      # TODO: எல்லா மாறிகளும் தேவைதானா?

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

## 2. கோப்பை பிரிக்கவும்

கோப்பின் ஒவ்வொரு பகுதியையும், அது என்ன செய்கிறது - மற்றும் ஏன் என்பதைப் புரிந்துகொள்ளப் போகிறோம்.

### 2.1 **Header மற்றும் Schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Line 1**: IDE ஆதரவு மற்றும் IntelliSense-க்கு YAML மொழி சர்வர் schema சரிபார்ப்பு வழங்குகிறது

### 2.2 Project Metadata (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Line 5**: Azure Developer CLI-யால் பயன்படுத்தப்படும் திட்டத்தின் பெயரை வரையறுக்கிறது
- **Lines 6-7**: இது 1.0.2 பதிப்பு டெம்ப்ளேட்டின் அடிப்படையில் உள்ளது என்பதை குறிப்பிடுகிறது
- **Lines 8-9**: Azure Developer CLI பதிப்பு 1.14.0 அல்லது அதற்கு மேல் தேவை

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

- **Lines 11-20**: **Pre-deployment hook** - `azd up`-க்கு முன் இயங்குகிறது

      - Unix/Linux-ல்: சரிபார்ப்பு ஸ்கிரிப்டை செயல்படுத்தக்கூடியதாக மாற்றி அதை இயக்குகிறது
      - Windows-ல்: PowerShell சரிபார்ப்பு ஸ்கிரிப்டை இயக்குகிறது
      - இரண்டிலும் interactive ஆக இருக்கும், தோல்வியடைந்தால் deployment நிறுத்தப்படும்

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
- **Lines 21-30**: **Post-provision hook** - Azure வளங்கள் உருவாக்கப்பட்ட பின் இயங்குகிறது

  - சூழல் மாறிகளை எழுதும் ஸ்கிரிப்ட்களை இயக்குகிறது
  - இந்த ஸ்கிரிப்ட்கள் தோல்வியடைந்தாலும் deployment தொடரும் (`continueOnError: true`)

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
- **Lines 31-40**: **Post-deploy hook** - பயன்பாட்டின் deployment பின் இயங்குகிறது

  - இறுதி அமைப்பு ஸ்கிரிப்ட்களை இயக்குகிறது
  - ஸ்கிரிப்ட்கள் தோல்வியடைந்தாலும் deployment தொடரும்

### 2.4 Service Config (41-48)

நீங்கள் பிரசுரிக்க இருக்கும் பயன்பாட்டு சேவையை இது அமைக்கிறது.

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

- **Line 42**: "api_and_frontend" என்ற சேவையை வரையறுக்கிறது
- **Line 43**: மூலக் கோப்புகளுக்கான `./src` அடைவை சுட்டுகிறது
- **Line 44**: Python-ஐ நிரலாக்க மொழியாக குறிப்பிடுகிறது
- **Line 45**: Azure Container Apps-ஐ ஹோஸ்டிங் தளமாக பயன்படுத்துகிறது
- **Lines 46-48**: Docker அமைப்பு

      - "api_and_frontend" என்ற பெயரில் Docker image-ஐ பயன்படுத்துகிறது
      - Azure-ல் image-ஐ local-ல் அல்லாமல் remote-ஆக உருவாக்குகிறது

### 2.5 Pipeline Variables (49-76)

இவை CI/CD pipelines-ல் `azd`-ஐ இயக்க உதவும் மாறிகள்

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

இந்த பகுதி **deployment**-இன் போது பயன்படுத்தப்படும் சூழல் மாறிகளை வரையறுக்கிறது, வகைப்படுத்தப்பட்டு:

- **Azure Resource Names (Lines 51-60)**:
      - Resource Group, AI Hub, AI Project போன்ற முக்கிய Azure சேவைகளின் resource பெயர்கள்
- **Feature Flags (Lines 61-63)**:
      - குறிப்பிட்ட Azure சேவைகளை இயக்க/முடக்க boolean மாறிகள்
- **AI Agent Configuration (Lines 64-71)**:
      - முக்கிய AI முகவரின் பெயர், ID, deployment அமைப்புகள், மாதிரி விவரங்கள்
- **AI Embedding Configuration (Lines 72-79)**:
      - vector search-க்கு பயன்படுத்தப்படும் embedding மாதிரியின் அமைப்பு
- **Search மற்றும் Monitoring (Lines 80-84)**:
      - Search index name, ஏற்கனவே உள்ள resource IDs, மற்றும் monitoring/tracing அமைப்புகள்

---

## 3. Env Variables-ஐ அறிந்து கொள்ளுங்கள்
உங்கள் deployment-இன் அமைப்பு மற்றும் நடத்தை கட்டுப்படுத்தும் சூழல் மாறிகள், அவற்றின் முதன்மை நோக்கின் அடிப்படையில் ஒழுங்குபடுத்தப்பட்டுள்ளன. பெரும்பாலான மாறிகள் உணர்வுப்பூர்வமான முன்னிருப்புகளை கொண்டுள்ளன, ஆனால் நீங்கள் அவற்றை உங்கள் குறிப்பிட்ட தேவைகள் அல்லது ஏற்கனவே உள்ள Azure வளங்களுக்கு பொருந்துமாறு தனிப்பயனாக்கலாம்.

### 3.1 தேவைப்படும் மாறிகள் 

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

### 3.5 உங்கள் மாறிகளை சரிபார்க்கவும்

Azure Developer CLI-யை பயன்படுத்தி உங்கள் சூழல் மாறிகளை காணவும் மற்றும் நிர்வகிக்கவும்:

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

**குறிப்பு**:  
இந்த ஆவணம் [Co-op Translator](https://github.com/Azure/co-op-translator) என்ற AI மொழிபெயர்ப்பு சேவையைப் பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சிக்கின்றோம், ஆனால் தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான தகவல்கள் இருக்கக்கூடும் என்பதை கவனத்தில் கொள்ளவும். அதன் தாய்மொழியில் உள்ள மூல ஆவணம் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கங்களுக்கு நாங்கள் பொறுப்பல்ல.