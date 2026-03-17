# 4. உருவாக்கு ஒரு மாதிரியை அமைக்கவும்

!!! tip "இந்த மாட்யூலை முடித்துவிட்டால் நீங்கள் இது செய்வதற்கு முடியும்"

    - [ ] `azure.yaml`-ன் நோக்கத்தை புரிந்து கொள்ளுங்கள்
    - [ ] `azure.yaml`-ன் அமைப்பை புரிந்து கொள்ளுங்கள்
    - [ ] azd உள்நிலையில் lifecycle `hooks`-இன் மதிப்பை புரிந்து கொள்ளுங்கள்
    - [ ] **பயிற்சி 4:** சூழல் மாறிகளை ஆய்வு செய்து மாற்றுங்கள்

---

!!! prompt "இந்த `azure.yaml` கோப்பு என்ன செய்கிறது? ஒரு குறியீட்டு பெட்டி பயன்படுத்தி ஒவ்வொரு வரியையும் விளக்கவும்"

      `azure.yaml` கோப்பு **Azure Developer CLI (azd)** க்கான கட்டமைப்பு கோப்பாகும். இது உங்கள் செயலியை Azure-க்கு எப்படி உட்படுத்த வேண்டும் என்பதை வரையறுக்கிறது, அதாவது தொழில்நுட்ப மையம், சேவைகள், உள்ளிடல்/வெளியேற்ற ஹுக்குகள் மற்றும் சூழல் மாறிகள் ஆகியவை.

---

## 1. நோக்கம் மற்றும் செயல்பாடு

இந்த `azure.yaml` கோப்பு ஒரு AI ஏஜென்ட் செயலிக்கான **வினியோக வரைபடமாக** செயற்படுகிறது, அது:

1. **நிறுவுவதற்கு முன் சுற்றுச்சூழலை சரிபார்க்கிறது**
2. **Azure AI சேவைகளை வழங்குகிறது** (AI Hub, AI Project, Search, மற்றும் இதரவை)
3. **Python செயலியை** Azure Container Apps-க்கு வினியோகிக்கிறது
4. **அவை மற்றும் எம்பெட்டிங் செயல்பாட்டுக்கான AI மாடல்களை** அமைக்கிறது
5. **AI செயலிக்கான கண்காணிப்பு மற்றும் தடதவைக் கண்டறிதலை** அமைக்கிறது
6. **புதிய மற்றும் உள்ளமைவுள்ள** Azure AI Project சூழல்களுக்கு இரண்டும் கையாள்கிறது

இந்த கோப்பு சரியான சரிபார்ப்பு, வழங்கல் மற்றும் மின்னடைவு-பின்வினையாக்கலுடன் ஒரு முழுமையான AI ஏஜென்ட் தீர்வை ஒரு கட்டளையிலேயே (`azd up`) உட்படுத்துவதற்கு உதவுகிறது.

??? info "விரிவாக்கத்திற்காக பார்க்கவும்: `azure.yaml`"

      `azure.yaml` கோப்பு Azure Developer CLI இந்த AI ஏஜென்ட் செயலியை Azure-இல் எப்படி உட்படுத்தி நிர்வகிக்க வேண்டும் என்பதைக் குறிப்பிடுகிறது. ஒவ்வொரு வரியையும் பிரித்து விளக்கலாம்.

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

## 2. கோப்பை பிரித்து பரிசீலனை செய்தல்

எந்த பகுதிகள் என்ன செய்கின்றன மற்றும் ஏன் என்பதை புரிந்துகொள்ள கோப்பை பிரிவு வாரியாகப் பார்ப்போம்.

### 2.1 **தலைப்பு மற்றும் ஸ்கீமா (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **வரி 1**: IDE ஆதரவு மற்றும் IntelliSense க்கு YAML மொழி சர்வர் ஸ்கீமா சரிபார்ப்பை வழங்குகிறது

### 2.2 திட்ட மெட்டாடேட்டா (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **வரி 5**: Azure Developer CLI பயன்படுத்தும் திட்டத்தின் பெயரை வரையறுக்கிறது
- **வரிகள் 6-7**: இது template பதிப்பு 1.0.2 அடிப்படையில் என்பதை குறிப்பிடுகிறது
- **வரிகள் 8-9**: Azure Developer CLI பதிப்பு 1.14.0 அல்லது அதற்கு மேற்பட்டதாக இருக்க வேண்டும் எனக் கோருகிறது

### 2.3 உட்படுத்தல் ஹுக்குகள் (11-40)

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

- **வரிகள் 11-20**: **நிறுவுவதற்கு முன் ஹுக்கு** - `azd up` நடக்கும்முன் இயக்கப்படுகிறது

      - Unix/Linux-இல்: சரிபார்ப்பு ஸ்கிரிப்டை இயக்க உரிமை அளித்து அதை இயக்குகிறது
      - Windows-இல்: PowerShell சரிபார்ப்பு ஸ்கிரிப்டை இயக்குகிறது
      - இரண்டும் தூண்டுதலானவை (interactive) மற்றும் தோல்வியுற்றால் நிறுவலை நிறுத்தும்

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
- **வரிகள் 21-30**: **வழங்கலுக்குப்பிறகு ஹுக்கு** - Azure வளங்கள் உருவாக்கப்பட்ட பிறகு இயக்கப்படுகிறது

  - சூழல் மாறிகளை எழுதும் ஸ்கிரிப்டுகளை இயக்குகிறது
  - இந்த ஸ்கிரிப்டுகள் தோல்வி அடைந்தாலும் நிறுவல் தொடர்கிறது (`continueOnError: true`)

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
- **வரிகள் 31-40**: **வினியோகத்திற்குப்பிறகு ஹுக்கு** - செயலி வினியோகிக்கப்பட்ட பிறகு இயக்கப்படுகிறது

  - இறுதி அமைப்பு ஸ்கிரிப்டுகளை இயக்குகிறது
  - ஸ்கிரிப்டுகள் தோல்வி அடைந்தாலும் தொடர்கிறது

### 2.4 சேவை கட்டமைப்பு (41-48)

இது நீங்கள் வினியோகிக்கும் செயலி சேவையை அமைக்கிறது.

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

- **வரி 42**: "api_and_frontend" என்ற பெயரில் ஒரு சேவையை வரையறுக்கிறது
- **வரி 43**: மூலக் குறியீட்டிற்கு `./src` அடைவை காட்டு
- **வரி 44**: Python மொழியை பயன்படுத்துகிறது
- **வரி 45**: ஹோஸ்டிங் தளமாக Azure Container Apps-ஐ பயன்படுத்துகிறது
- **வரிகள் 46-48**: Docker கட்டமைப்பு

      - படமாக "api_and_frontend" பெயரை பயன்படுத்துகிறது
      - Docker படத்தை உள்ளூர் அல்லாமல் Azure-இல் தூரநிலை கட்டமைப்பாக (remote) கட்டும்

### 2.5 குழாய் மாறிகள் (49-76)

இவை தானியக்கமாக்கலுக்காக (CI/CD) `azd` ஐ இயக்க உதவும் மாறிகள்

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

இந்த பகுதி வினியோகத்தின் போது பயன்படுத்தப்படும் சூழல் மாறிகளை வரையறுக்கிறது, வகைப்படுத்தப்பட்டதாக:

- **Azure வள பெயர்கள் (வரிகள் 51-60)**:
      - முக்கிய Azure சேவை வளப் பெயர்கள், உதாரணமாக Resource Group, AI Hub, AI Project, மற்றும் பல
- **சிறப்புச் செயல்பாடு கொடிகள் (வரிகள் 61-63)**:
      - குறிப்பிட்ட Azure சேவைகளை இயக்கு/அசைக்க கட்டுப்படுத்தும் புல்லியன் மாறிகள்
- **AI ஏஜென்ட் கட்டமைப்பு (வரிகள் 64-71)**:
      - முதற்கட்ட AI ஏஜென்டுக்கு பெயர், ஐடி, வினியோக அமைப்புகள், மாடல் விவரங்கள் போன்றவை
- **AI எம்பெட்டிங் கட்டமைப்பு (வரிகள் 72-79)**:
      - வேக்டர் தேடலுக்காக பயன்படுத்தப்படும் எம்பெட்டிங் மாடலுக்கான அமைப்புகள்
- **தேடல் மற்றும் கண்காணிப்பு (வரிகள் 80-84)**:
      - தேடல் ին்டெக்ஸ் பெயர், உள்ளமைவுள்ள வள ஐடிகள், மற்றும் கண்காணிப்பு/தடதவைக் கட்டமைப்புகள்

---

## 3. சூழல் மாறிகளை அறியுதல்
பின்வரும் சூழல் மாறிகள் உங்கள் வினியோக கட்டமைப்பின் கட்டுப்பாடு மற்றும் செயல்பாட்டை நிர்ணயிக்கின்றன, அவை அவர்களது பிரதான நோக்கத்தின் அடிப்படையில் կազմակերպப்பட்டுள்ளன. பெரும்பாலான மாறிகளுக்கு ஏற்ற டீஃபால்ட் மதிப்புகள் உள்ளன, ஆனால் உங்கள் தேவையின்படி அல்லது ஏற்கனவே உள்ள Azure வளங்களுடன் பொருந்துமாறு நீங்கள் அவற்றை தனிப்பயனாக்கலாம்.

### 3.1 தேவையான மாறிகள் 

```bash title="" linenums="0"
# முக்கிய Azure கட்டமைப்பு
AZURE_ENV_NAME                    # சூழல் பெயர் (வள பெயரிடலில் பயன்படுத்தப்படும்)
AZURE_LOCATION                    # பதிவேற்றும் பிராந்தியம்
AZURE_SUBSCRIPTION_ID             # இலக்கு சந்தா
AZURE_RESOURCE_GROUP              # வளக் குழு பெயர்
AZURE_PRINCIPAL_ID                # RBAC க்கான பயனர் பிரதிநிதி

# வளப் பெயர்கள் (குறிப்பிடப்படவில்லை என்றால் தானாக உருவாக்கப்படும்)
AZURE_AIHUB_NAME                  # Microsoft Foundry மையத்தின் பெயர்
AZURE_AIPROJECT_NAME              # ஏ.ஐ. திட்டத்தின் பெயர்
AZURE_AISERVICES_NAME             # ஏ.ஐ. சேவைகள் கணக்கின் பெயர்
AZURE_STORAGE_ACCOUNT_NAME        # சேமிப்பு கணக்கின் பெயர்
AZURE_CONTAINER_REGISTRY_NAME     # கொண்டெய்னர் பதிவகத்தின் பெயர்
AZURE_KEYVAULT_NAME               # கீ வால்ட் பெயர் (பயன்படுத்தினால்)
```

### 3.2 மாடல் கட்டமைப்பு 
```bash title="" linenums="0"
# சாட் மாடல் கட்டமைப்பு
AZURE_AI_AGENT_MODEL_NAME         # இயல்புநிலை: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # இயல்புநிலை: OpenAI (அல்லது Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # இயல்புநிலை: கிடைக்கும் சமீபத்தியது
AZURE_AI_AGENT_DEPLOYMENT_NAME    # சாட் மாடலுக்கான ஒதுக்கீட்டு பெயர்
AZURE_AI_AGENT_DEPLOYMENT_SKU     # இயல்புநிலை: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # இயல்புநிலை: 80 (ஆயிரக்கணக்கில் TPM)

# எம்பெடிங் மாடல் கட்டமைப்பு
AZURE_AI_EMBED_MODEL_NAME         # இயல்புநிலை: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # இயல்புநிலை: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # இயல்புநிலை: கிடைக்கும் சமீபத்தியது
AZURE_AI_EMBED_DEPLOYMENT_NAME    # எம்பெடிங்குகளுக்கான ஒதுக்கீட்டு பெயர்
AZURE_AI_EMBED_DEPLOYMENT_SKU     # இயல்புநிலை: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # இயல்புநிலை: 50 (ஆயிரக்கணக்கில் TPM)

# ஏஜென்ட் கட்டமைப்பு
AZURE_AI_AGENT_NAME               # ஏஜென்டின் காட்சி பெயர்
AZURE_EXISTING_AGENT_ID           # உள்ள ஏஜென்டை பயன்படுத்தவும் (விருப்பமாய்)
```

### 3.3 செயல்பாட்டு காட்டி
```bash title="" linenums="0"
# விருப்ப சேவைகள்
USE_APPLICATION_INSIGHTS         # இயல்பு: உண்மை
USE_AZURE_AI_SEARCH_SERVICE      # இயல்பு: தவறு
USE_CONTAINER_REGISTRY           # இயல்பு: உண்மை

# கண்காணிப்பு மற்றும் டிரேசிங்
ENABLE_AZURE_MONITOR_TRACING     # இயல்பு: தவறு
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # இயல்பு: தவறு

# தேடல் கட்டமைப்பு
AZURE_AI_SEARCH_INDEX_NAME       # தேடல் குறியீட்டு பெயர்
AZURE_SEARCH_SERVICE_NAME        # தேடல் சேவை பெயர்
```

### 3.4 AI திட்ட கட்டமைப்பு 
```bash title="" linenums="0"
# உள்ள வளங்களைப் பயன்படுத்தவும்
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # உள்ள ஏஐ திட்டத்தின் முழு வள அடையாளம்
AZURE_EXISTING_AIPROJECT_ENDPOINT       # உள்ள திட்டத்தின் எண்ட்பாயிண்ட் URL
```

### 3.5 உங்கள் மாறிகளை சரிபார்க்கவும்

Azure Developer CLI பயன்படுத்தி உங்கள் சூழல் மாறிகளை பார்வையிட்டு நிர்வகிக்கவும்:

```bash title="" linenums="0"
# தற்போதைய சூழலுக்கான அனைத்து சூழல் மாறிலிகளையும் பார்க்கவும்
azd env get-values

# ஒரு குறிப்பிட்ட சூழல் மாறிலியைப் பெறவும்
azd env get-value AZURE_ENV_NAME

# ஒரு சூழல் மாறிலியை அமைக்கவும்
azd env set AZURE_LOCATION eastus

# .env கோப்பிலிருந்து பல மாறிலிகளை அமைக்கவும்
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
மறுப்பு:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டது. நாங்கள் துல்லியத்திற்காக முயற்சித்தாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான தகவல்கள் இருக்கக்கூடும் என்பதை கவனிக்கவும். அதன் சொந்த மொழியிலுள்ள அசல் ஆவணம் அதிகாரப்பூர்வமான வளமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களின் 경우, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கங்களுக்கும் நாங்கள் பொறுப்பேற்க மாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->