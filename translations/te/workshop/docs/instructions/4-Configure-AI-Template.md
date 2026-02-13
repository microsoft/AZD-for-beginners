# 4. టెంప్లేట్‌ను కాన్ఫిగర్ చేయండి

!!! tip "ఈ మాడ్యూల్ చివరికి మీరు చేయగలుగుతారు"

    - [ ] `azure.yaml` యొక్క ఉద్దేశ్యాన్ని అర్థం చేసుకోవడం
    - [ ] `azure.yaml` యొక్క నిర్మాణాన్ని అర్థం చేసుకోవడం
    - [ ] azd లైఫ్‌సైకిల్ `hooks` విలువను అర్థం చేసుకోవడం
    - [ ] **Lab 4:** పర్యావరణ వేరియబుల్స్‌ను పరిశీలించడం మరియు మార్చడం

---

!!! prompt "`azure.yaml` ఫైల్ ఏమి చేస్తుంది? ఒక కోడ్ బాక్స్ ఉపయోగించి దాన్ని పంక్తివారీగా వివరించండి"

      The `azure.yaml` file is the **configuration file for Azure Developer CLI (azd)**. It defines how your application should be deployed to Azure, including infrastructure, services, deployment hooks, and environment variables.

---

## 1. ఉద్దేశ్యము మరియు ఫంక్షనాలిటీ

This `azure.yaml` file serves as the **deployment blueprint** for an AI agent application that:

1. **డిప్లాయ్‌మెంట్‌కు ముందు పర్యావరణాన్ని ధృవీకరిస్తుంది**
2. **Azure AI సేవలను ప్రొవిజన్ చేస్తుంది** (AI Hub, AI Project, Search, మొదలైనవి)
3. **Python అప్లికేషన్‌ను** Azure Container Apps లో డిప్లాయ్ చేస్తుంది
4. చాట్ మరియు ఎంబెడ్డింగ్ ఫంక్షనాలిటీ కోసం **AI మోడల్స్‌ను కాన్ఫిగర్ చేస్తుంది**
5. AI అప్లికేషన్ కోసం **మానిటరింగ్ మరియు ట్రేసింగ్‌ను సెట్ చేస్తుంది**
6. కొత్త மற்றும் ఇప్పటికే ఉన్న రెండింటిపైనా Azure AI ప్రాజెక్ట్ సన్నివేశాలను నిర్వహిస్తుంది

The file enables **one-command deployment** (`azd up`) of a complete AI agent solution with proper validation, provisioning, and post-deployment configuration.

??? info "వివరాల కోసం విస్తరించండి: `azure.yaml`"

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

## 2. ఫైల్‌ను విశ్లేషించడం

Let's go through the file section by section, to understand what it does - and why.

### 2.1 **శీర్షిక మరియు స్కీమా (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Line 1**: IDE మద్దతు మరియు IntelliSense కోసం YAML లాంగ్వేజ్ సర్వర్ స్కీమా నిర్ధారణను అందిస్తుంది

### 2.2 ప్రాజెక్ట్ మెటాడేటా (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Line 5**: Azure Developer CLI ద్వారా ఉపయోగించబడే ప్రాజెక్ట్ పేరును నిర్వచిస్తుంది
- **Lines 6-7**: ఇది template వెర్షన్ 1.0.2 ఆధారంగా ఉందని సూచిస్తుంది
- **Lines 8-9**: Azure Developer CLI వెర్షన్ 1.14.0 లేదా అందులోకి మరిన్ని అవసరం

### 2.3 డిప్లాయ్ హుక్స్ (11-40)

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

- **Lines 11-20**: **Pre-deployment hook** - `azd up` ముందు నడుస్తుంది

      - Unix/Linuxలో: ధృవీకరణ స్క్రిప్ట్‌ను అమలుకు అనువుగా చేసుకుని, దాన్ని నడిపిస్తుంది
      - Windowsలో: PowerShell ధృవీకరణ స్క్రిప్ట్‌ను నడిపిస్తుంది
      - రెండూ ఇంటరాక్టివ్‌గా ఉంటాయి మరియు అవి విఫలమైతే డిప్లాయ్‌మెంట్‌ను ఆపేస్తాయి

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
- **Lines 21-30**: **Post-provision hook** - Azure వనరులు సృష్టించబడిన తర్వాత నడుస్తుంది

  - పర్యావరణ వేరియబుల్స్ రాయడానికి స్క్రిప్ట్‌లను అమలుపరుస్తుంది
  - ఈ స్క్రిప్ట్‌లు విఫలమైతే కూడా డిప్లాయ్‌మెంట్ కొనసాగుతుంది (`continueOnError: true`)

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
- **Lines 31-40**: **Post-deploy hook** - అప్లికేషన్ డిప్లాయ్ అయిన తర్వాత నడుస్తుంది

  - తుది సెట్టప్ స్క్రిప్ట్‌లను అమలుపరుస్తుంది
  - స్క్రిప్ట్‌లు విఫలమైనప్పటికీ కూడా కొనసాగుతుంది

### 2.4 సేవ కాన్ఫిగరేషన్ (41-48)

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

- **Line 42**: "api_and_frontend" అనే సేవను నిర్వచిస్తుంది
- **Line 43**: మూల కోడ్ కోసం `./src` డైరెక్టరీను సూచిస్తుంది
- **Line 44**: ప్రోగ్రామింగ్ భాషగా Pythonని పేర్కొంటుంది
- **Line 45**: హోస్టింగ్ ప్లాట్‌ఫార్మ్‌గా Azure Container Apps ను ఉపయోగిస్తుంది
- **Lines 46-48**: Docker కాన్ఫిగరేషన్

      - "api_and_frontend" ను ఇమేజ్ పేరుగా ఉపయోగిస్తుంది
      - Docker ఇమేజ్‌ను స్థానికంగా కాకుండా Azureలో రిమోట్‌గా బిల్డ్ చేస్తుంది

### 2.5 పైప్‌లైన్ వేరియబుల్స్ (49-76)

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

- **Azure వనరు పేర్లు (Lines 51-60)**:
      - ప్రధాన Azure సేవల వనరు పేర్లు, ఉదా., Resource Group, AI Hub, AI Project మొదలైనవి
- **ఫీచర్ ఫ్లాగ్స్ (Lines 61-63)**:
      - నిర్దిష్ట Azure సేవలను ఎనేబుల్/డిజేబుల్ చేయడానికి boolean వేరియబుల్స్
- **AI ఏజెంట్ కాన్ఫిగరేషన్ (Lines 64-71)**:
      - ప్రధాన AI ఏజెంట్ కోసం కాన్ఫిగరేషన్, అందులో పేరు, ID, డిప్లాయ్‌మెంట్ సెట్టింగ్స్, మోడల్ వివరాలు ఉన్నాయి
- **AI ఎంబెడ్డింగ్ కాన్ఫిగరేషన్ (Lines 72-79)**:
      - వెక్టర్ సెర్చ్ కోసం ఉపయోగించే ఎంబెడ్డింగ్ మోడల్ కోసం కాన్ఫిగరేషన్
- **సెర్చ్ మరియు మానిటరింగ్ (Lines 80-84)**:
      - సెర్చ్ ఇండెక్స్ పేరు, ప్రస్తుతం ఉన్న వనరు IDలు, మరియు మానిటరింగ్/ట్రేసింగ్ సెట్టింగ్స్

---

## 3. పర్యావరణ వేరియబుల్స్‌ను తెలుసుకోండి
The following environment variables control your deployment's configuration and behavior, organized by their primary purpose. Most variables have sensible defaults, but you can customize them to match your specific requirements or existing Azure resources.

### 3.1 అవసరమైన వేరియబుల్స్ 

```bash title="" linenums="0"
# ప్రధాన Azure కాన్ఫిగరేషన్
AZURE_ENV_NAME                    # పర్యావరణం పేరు (వనరుల పేరులలో ఉపయోగించబడుతుంది)
AZURE_LOCATION                    # డిప్లాయ్‌మెంట్ ప్రాంతం
AZURE_SUBSCRIPTION_ID             # లక్ష్య సబ్‌స్క్రిప్షన్
AZURE_RESOURCE_GROUP              # వనరు గ్రూపు పేరు
AZURE_PRINCIPAL_ID                # RBAC కోసం వినియోగదారు ప్రిన్సిపల్

# వనరు పేర్లు (నిర్దేశించకపోతే స్వయంచాలకంగా ఉత్పత్తి చేయబడతాయి)
AZURE_AIHUB_NAME                  # Microsoft Foundry హబ్ పేరు
AZURE_AIPROJECT_NAME              # AI ప్రాజెక్ట్ పేరు
AZURE_AISERVICES_NAME             # AI సేవల ఖాతా పేరు
AZURE_STORAGE_ACCOUNT_NAME        # స్టోరేజ్ ఖాతా పేరు
AZURE_CONTAINER_REGISTRY_NAME     # కంటైనర్ రిజిస్ట్రీ పేరు
AZURE_KEYVAULT_NAME               # కీ వాల్ట్ పేరు (ఉపయోగిస్తే)
```

### 3.2 మోడల్ కాన్ఫిగరేషన్ 
```bash title="" linenums="0"
# చాట్ మోడల్ కాన్ఫిగరేషన్
AZURE_AI_AGENT_MODEL_NAME         # డిఫాల్ట్: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # డిఫాల్ట్: OpenAI (లేదా Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # డిఫాల్ట్: అందుబాటులో ఉన్న తాజా వెర్షన్
AZURE_AI_AGENT_DEPLOYMENT_NAME    # చాట్ మోడల్ కోసం డిప్లాయ్‌మెంట్ పేరు
AZURE_AI_AGENT_DEPLOYMENT_SKU     # డిఫాల్ట్: స్టాండర్డ్
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # డిఫాల్ట్: 80 (TPM వేలల్లో)

# ఎంబెడ్డింగ్ మోడల్ కాన్ఫిగరేషన్
AZURE_AI_EMBED_MODEL_NAME         # డిఫాల్ట్: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # డిఫాల్ట్: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # డిఫాల్ట్: అందుబాటులో ఉన్న తాజా వెర్షన్
AZURE_AI_EMBED_DEPLOYMENT_NAME    # ఎంబెడ్డింగ్స్ కోసం డిప్లాయ్‌మెంట్ పేరు
AZURE_AI_EMBED_DEPLOYMENT_SKU     # డిఫాల్ట్: స్టాండర్డ్
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # డిఫాల్ట్: 50 (TPM వేలల్లో)

# ఏజెంట్ కాన్ఫిగరేషన్
AZURE_AI_AGENT_NAME               # ఏజెంట్ ప్రదర్శన పేరు
AZURE_EXISTING_AGENT_ID           # ఉన్న ఏజెంట్‌ను ఉపయోగించండి (ఐచ్ఛికం)
```

### 3.3 ఫీచర్ టోగుల్
```bash title="" linenums="0"
# ఐచ్ఛిక సేవలు
USE_APPLICATION_INSIGHTS         # డిఫాల్ట్: true
USE_AZURE_AI_SEARCH_SERVICE      # డిఫాల్ట్: false
USE_CONTAINER_REGISTRY           # డిఫాల్ట్: true

# మానిటరింగ్ మరియు ట్రేసింగ్
ENABLE_AZURE_MONITOR_TRACING     # డిఫాల్ట్: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # డిఫాల్ట్: false

# శోధన విన్యాసం
AZURE_AI_SEARCH_INDEX_NAME       # శోధన సూచిక పేరు
AZURE_SEARCH_SERVICE_NAME        # శోధన సేవ పేరు
```

### 3.4 AI ప్రాజెక్ట్ కాన్ఫిగరేషన్ 
```bash title="" linenums="0"
# ఉన్న వనరులను ఉపయోగించండి
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # ఇప్పటికే ఉన్న AI ప్రాజెక్ట్ యొక్క పూర్తి వనరు ID
AZURE_EXISTING_AIPROJECT_ENDPOINT       # ఉన్న ప్రాజెక్ట్ యొక్క ఎండ్‌పాయింట్ URL
```

### 3.5 మీ వేరియబుల్స్‌ను తనిఖీ చేయండి

మీ పర్యావరణ వేరియబుల్స్‌ను చూడటానికి మరియు నిర్వహించడానికి Azure Developer CLI ను ఉపయోగించండి:

```bash title="" linenums="0"
# ప్రస్తుత పర్యావరణానికి సంబంధించిన అన్ని పర్యావరణ చరాలు చూడండి
azd env get-values

# ఒక నిర్దిష్ట పర్యావరణ చరాన్ని పొందండి
azd env get-value AZURE_ENV_NAME

# ఒక పర్యావరణ చరాన్ని అమర్చండి
azd env set AZURE_LOCATION eastus

# .env ఫైల్ నుండి అనేక పర్యావరణ చరాలను అమర్చండి
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
నివారణ:

ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీ, స్వయంచాలక అనువాదాల్లో తప్పిదాలు లేదా లోపాలు ఉండవచ్చు అని దయచేసి గమనించండి. మూల పత్రాన్ని దాని మూల భాషలోని అధికారిక మూలంగా పరిగణించాలి. కీలకమైన సమాచారానికి వృత్తిపరమైన మానవ అనువాదం చేయించుకోవాలని సూచించబడుతుంది. ఈ అనువాదాన్ని ఉపయోగించడం వల్ల ఏర్పడిన ఏవైనా అపార్థాలు లేదా తప్పుగా అర్థం చేసుకోవడాలకై మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->