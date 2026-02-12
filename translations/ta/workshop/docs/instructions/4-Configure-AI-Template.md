# 4. ஒரு வார்ப்புருளை அமைக்கவும்

!!! tip "இந்த மாடியூலை முடித்ததும் நீங்கள் திறமையாக இருப்பீர்கள்"

    - [ ] `azure.yaml`-இன் நோக்கம் புரிந்துகொள்ளுதல்
    - [ ] `azure.yaml`-இன் கட்டமைப்பு புரிந்துகொள்ளுதல்
    - [ ] azd lifecycle இன் `hooks`-இன் மதிப்பை புரிந்துகொள்ளுதல்
    - [ ] **Lab 4:** சுற்றுப்புற மாறிலிகளை ஆராய்ந்து மாற்றுதல்

---

!!! prompt "What is the `azure.yaml` file do? Use a codefence and explain it line by line"

      The `azure.yaml` file is the **configuration file for Azure Developer CLI (azd)**. It defines how your application should be deployed to Azure, including infrastructure, services, deployment hooks, and environment variables.

---

## 1. Purpose and Functionality

This `azure.yaml` file serves as the **deployment blueprint** for an AI agent application that:

1. **வெளியீட்டிற்கு முன் சுற்றுச்சூழலைச் சரிபார்க்கிறது**
2. **Azure AI சேவைகளை ஒதுக்குகிறது** (AI Hub, AI Project, Search, முதலியவை)
3. **Python பயன்பாட்டை** Azure Container Apps-இல் வரவழைக்கிறது
4. **chat மற்றும் embedding செயல்பாடுகளுக்கான AI மாதிரிகளை** கட்டமைக்கிறது
5. **AI பயன்பாட்டிற்கு கண்காணிப்பு மற்றும் தடயங்களை** அமைக்கிறது
6. **புதிய மற்றும் உள்ளமைவுள்ள** Azure AI திட்ட நிலைகளையும் கையாள்கிறது

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

## 2. கோப்பின் பகுப்பாய்வு

Let’s go through the file section by section, to understand what it does - and why.

### 2.1 **தலைப்புப் பகுதி மற்றும் ஸ்கீமா (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Line 1**: IDE ஆதரவிற்கும் IntelliSense க்கும் YAML மொழி சர்வர் ஸ்கீமா சரிபார்ப்பை வழங்குகிறது

### 2.2 திட்ட மேடேட்டா (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Line 5**: Azure Developer CLI பயன்படுத்தும் திட்டத்தின் பெயரை வரையறுக்கிறது
- **Lines 6-7**: இது template பதிப்பு 1.0.2 அடிப்படையில் என்று குறிப்பிடுகிறது
- **Lines 8-9**: Azure Developer CLI பதிப்பு 1.14.0 அல்லது மேலதிகத்தை தேவையாக்குகிறது

### 2.3 வெளியீட்டு ஹூக்குகள் (11-40)

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

- **Lines 11-20**: **Pre-deployment hook** - `azd up` க்கு முன்பு இயக்கப்படும்

      - Unix/Linux-இல்: சரிபார்ப்பு ஸ்கிரிப்ட்டை இயக்கக்கூடியதாக மாற்றி அதை இயக்குகிறது
      - Windows-இல்: PowerShell சரிபார்ப்பு ஸ்கிரிப்ட்டை இயக்குகிறது
      - இரண்டும் தொடர்பு கொண்டு செயல்படும் மற்றும் அவை தோல்வியடைந்தால் வெளியீட்டை நிறுத்தும்

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
- **Lines 21-30**: **Post-provision hook** - Azure வளங்கள் உருவாக்கப்பட்ட பிறகு இயக்கப்படும்

  - சுற்றுப்புற மாறிலிகளை எழுதும் ஸ்கிரிப்ட்களை இயக்கு
  - இந்த ஸ்கிரிப்ட்கள் தோல்வியடைந்தாலும்deployment தொடரும் (`continueOnError: true`)

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
- **Lines 31-40**: **Post-deploy hook** - பயன்பாட்டை வெளியீடு செய்ததும் இயக்கப்படும்

  - இறுதி அமைப்பு ஸ்கிரிப்ட்களை நிறைவேற்றுகிறது
  - ஸ்கிரிப்ட்கள் தோல்வி அடைந்தாலும் தொடர்கிறது

### 2.4 சேவை கட்டமைப்பு (41-48)

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

- **Line 42**: "api_and_frontend" என்ற பெயரில் ஒரு சேவையை வரையறுக்கிறது
- **Line 43**: மூலக் கோடுகளுக்கு `./src` அடைவை காட்டுகிறது
- **Line 44**: Python மொழியை நிரலாக்க மொழியாகக் குறிப்பிடுகிறது
- **Line 45**: ஹோஸ்டிங்கிற்கு Azure Container Apps-ஐ பயன்படுத்துகிறது
- **Lines 46-48**: Docker கட்டமைப்பு

      - image பெயராக "api_and_frontend" ஐப் பயன்படுத்துகிறது
      - Docker image-ஐ உள்ளகமாக அல்லாமல் Azure இல் தொலை build செய்கிறது

### 2.5 பைப்பிளைன் மாறிலிகள் (49-76)

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
      - முக்கிய Azure சேவை வளப் பெயர்கள், உதாரணமாக Resource Group, AI Hub, AI Project, போன்றவை
- **Feature Flags (Lines 61-63)**:
      - குறிப்பிட்ட Azure சேவைகளை இயக்க/முடக்க Boolean மாறிலிகள்
- **AI Agent Configuration (Lines 64-71)**:
      - முக்கிய AI ஏஜென்டிற்கான அமைப்புகள்: பெயர், ID, deployment அமைப்புகள், மாதிரி விவரங்கள்
- **AI Embedding Configuration (Lines 72-79)**:
      - வெக்டர் தேடலுக்கு பயன்படும் embedding மாதிரிக்கான கட்டமைப்புகள்
- **Search and Monitoring (Lines 80-84)**:
      - Search index பெயர், உள்ளமைவிலுள்ள வள ID-கள், மற்றும் கண்காணிப்பு/தடையமைப்பு அமைப்புகள்

---

## 3. சுற்றுப்புற மாறிலிகள் பற்றி அறியவும்
The following environment variables control your deployment's configuration and behavior, organized by their primary purpose. Most variables have sensible defaults, but you can customize them to match your specific requirements or existing Azure resources.

### 3.1 தேவையான மாறிலிகள் 

```bash title="" linenums="0"
# முக்கிய Azure கட்டமைப்பு
AZURE_ENV_NAME                    # சூழல் பெயர் (வளங்களைப் பெயரிடும்போது பயன்படும்)
AZURE_LOCATION                    # நியமிப்பு பிராந்தியம்
AZURE_SUBSCRIPTION_ID             # இலக்கு சந்தா
AZURE_RESOURCE_GROUP              # வளக் குழு பெயர்
AZURE_PRINCIPAL_ID                # RBAC க்கான பயனர் பிரதிநிதி

# வள பெயர்கள் (குறிப்பிடப்படாவிட்டால் தானாக உருவாக்கப்படும்)
AZURE_AIHUB_NAME                  # Microsoft Foundry மையத்தின் பெயர்
AZURE_AIPROJECT_NAME              # AI திட்டத்தின் பெயர்
AZURE_AISERVICES_NAME             # AI சேவைகள் கணக்கு பெயர்
AZURE_STORAGE_ACCOUNT_NAME        # சேமிப்பு கணக்கு பெயர்
AZURE_CONTAINER_REGISTRY_NAME     # கண்டெய்னர் பதிவகத்தின் பெயர்
AZURE_KEYVAULT_NAME               # Key Vault பெயர் (பயன்படுத்தப்பட்டால்)
```

### 3.2 மாதிரி கட்டமைப்பு 
```bash title="" linenums="0"
# அரட்டை மாதிரி கட்டமைப்பு
AZURE_AI_AGENT_MODEL_NAME         # இயல்புநிலை: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # இயல்புநிலை: OpenAI (அல்லது Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # இயல்புநிலை: சமீபத்தில் கிடைக்கும்
AZURE_AI_AGENT_DEPLOYMENT_NAME    # அரட்டை மாதிரிக்கான வினியோகப் பெயர்
AZURE_AI_AGENT_DEPLOYMENT_SKU     # இயல்புநிலை: சாதாரண
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # இயல்புநிலை: 80 (TPM இல் ஆயிரங்கள்)

# எம்பெட்டிங் மாதிரி கட்டமைப்பு
AZURE_AI_EMBED_MODEL_NAME         # இயல்புநிலை: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # இயல்புநிலை: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # இயல்புநிலை: சமீபத்தில் கிடைக்கும்
AZURE_AI_EMBED_DEPLOYMENT_NAME    # எம்பெடிங்குகளுக்கான வினியோகப் பெயர்
AZURE_AI_EMBED_DEPLOYMENT_SKU     # இயல்புநிலை: சாதாரண
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # இயல்புநிலை: 50 (TPM இல் ஆயிரங்கள்)

# ஏஜெண்ட் அமைப்பு
AZURE_AI_AGENT_NAME               # ஏஜெண்டின் காட்சிப்பெயர்
AZURE_EXISTING_AGENT_ID           # முந்தைய ஏஜெண்டை பயன்படுத்தவும் (விருப்பமானது)
```

### 3.3 அம்சத் தேர்வு
```bash title="" linenums="0"
# விருப்ப சேவைகள்
USE_APPLICATION_INSIGHTS         # இயல்புநிலை: உண்மை
USE_AZURE_AI_SEARCH_SERVICE      # இயல்புநிலை: தவறு
USE_CONTAINER_REGISTRY           # இயல்புநிலை: உண்மை

# கண்காணிப்பு மற்றும் டிரேசிங்
ENABLE_AZURE_MONITOR_TRACING     # இயல்புநிலை: தவறு
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # இயல்புநிலை: தவறு

# தேடல் கட்டமைப்பு
AZURE_AI_SEARCH_INDEX_NAME       # தேடல் இன்டெக்ஸ் பெயர்
AZURE_SEARCH_SERVICE_NAME        # தேடல் சேவை பெயர்
```

### 3.4 AI திட்ட கட்டமைப்பு 
```bash title="" linenums="0"
# உள்ளிருக்கும் வளங்களைப் பயன்படுத்தவும்
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # உள்ளிருக்கும் AI திட்டத்தின் முழு வள அடையாளம் (ID)
AZURE_EXISTING_AIPROJECT_ENDPOINT       # உள்ளிருக்கும் திட்டத்தின் என்ட்பாயிண்ட் URL
```

### 3.5 உங்கள் மாறிலிகளைச் சரிபார்க்கவும்

Use the Azure Developer CLI to view and manage your environment variables:

```bash title="" linenums="0"
# தற்போதைய சூழலுக்கான அனைத்து சூழல் மாறிலிகளையும் காண்க
azd env get-values

# ஒரு குறிப்பிட்ட சூழல் மாறியை பெறுக
azd env get-value AZURE_ENV_NAME

# ஒரு சூழல் மாறியை அமைக்க
azd env set AZURE_LOCATION eastus

# ஒரு .env கோப்பிலிருந்து பல சூழல் மாறிலிகளை அமைக்க
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
மறுப்புரை:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவையான [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சிக்கிறோம் என்றாலும், தானாக இயங்கும் மொழிபெயர்ப்புகளில் தவறுகள் அல்லது பிழைகள் இருக்கலாம் என்பதை தயவுசெய்து கவனிக்கவும். இயல்பு மொழியில் உள்ள அசல் ஆவணம் அதேநேரத்தில் அதிகாரபூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பை பயன்படுத்த பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பின் பயன்பாட்டால் நேரிடக்கூடிய எந்தவொரு தவறான புரிதலுக்கும் அல்லது தவறான விளக்கத்திற்கும் நாங்கள் பொறுப்பாக இருக்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->