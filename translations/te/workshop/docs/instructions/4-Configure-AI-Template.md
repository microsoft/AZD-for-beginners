<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b4a16f82d68f5820d574acd8946843e4",
  "translation_date": "2025-11-25T07:31:40+00:00",
  "source_file": "workshop/docs/instructions/4-Configure-AI-Template.md",
  "language_code": "te"
}
-->
# 4. టెంప్లేట్‌ను కాన్ఫిగర్ చేయండి

!!! tip "ఈ మాడ్యూల్ ముగిసే సమయానికి మీరు చేయగలరు"

    - [ ] `azure.yaml` యొక్క ఉద్దేశాన్ని అర్థం చేసుకోవడం
    - [ ] `azure.yaml` యొక్క నిర్మాణాన్ని అర్థం చేసుకోవడం
    - [ ] azd లైఫ్‌సైకిల్ `hooks` యొక్క విలువను అర్థం చేసుకోవడం
    - [ ] **ల్యాబ్ 3:** 

---

!!! prompt "`azure.yaml` ఫైల్ ఏమి చేస్తుంది? కోడ్‌ఫెన్స్ ఉపయోగించి ప్రతి పంక్తిని వివరించండి"

      `azure.yaml` ఫైల్ **Azure Developer CLI (azd)** కోసం కాన్ఫిగరేషన్ ఫైల్. ఇది మీ అప్లికేషన్ Azureలో ఎలా డిప్లాయ్ చేయాలో నిర్వచిస్తుంది, ఇందులో ఇన్‌ఫ్రాస్ట్రక్చర్, సర్వీసులు, డిప్లాయ్‌మెంట్ హుక్స్, మరియు ఎన్విరాన్‌మెంట్ వేరియబుల్స్ ఉన్నాయి.

---

## 1. ఉద్దేశం మరియు ఫంక్షనాలిటీ

ఈ `azure.yaml` ఫైల్ AI ఏజెంట్ అప్లికేషన్ కోసం **డిప్లాయ్‌మెంట్ బ్లూప్రింట్** గా పనిచేస్తుంది:

1. **ఎన్విరాన్‌మెంట్‌ను ధృవీకరించండి** డిప్లాయ్‌మెంట్ ముందు
2. **Azure AI సర్వీసులను ప్రొవిజన్ చేయండి** (AI Hub, AI Project, Search, మొదలైనవి)
3. **Python అప్లికేషన్‌ను Azure Container Appsలో డిప్లాయ్ చేయండి**
4. **AI మోడల్స్‌ను కాన్ఫిగర్ చేయండి** చాట్ మరియు ఎంబెడింగ్ ఫంక్షనాలిటీ కోసం
5. **AI అప్లికేషన్ కోసం మానిటరింగ్ మరియు ట్రేసింగ్ సెట్ చేయండి**
6. **కొత్త మరియు ఉన్న** Azure AI ప్రాజెక్ట్ సన్నివేశాలను నిర్వహించండి

ఈ ఫైల్ **ఒక కమాండ్ డిప్లాయ్‌మెంట్** (`azd up`) ను సులభతరం చేస్తుంది, సరైన ధృవీకరణ, ప్రొవిజనింగ్, మరియు పోస్ట్-డిప్లాయ్‌మెంట్ కాన్ఫిగరేషన్‌తో పూర్తి AI ఏజెంట్ సొల్యూషన్.

??? info "విస్తరించడానికి క్లిక్ చేయండి: `azure.yaml`"

      `azure.yaml` ఫైల్ Azure Developer CLI ఈ AI ఏజెంట్ అప్లికేషన్‌ను Azureలో ఎలా డిప్లాయ్ చేయాలో మరియు నిర్వహించాలో నిర్వచిస్తుంది. దీన్ని పంక్తి పంక్తిగా విభజించి చూద్దాం.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: హుక్స్ అవసరమా?
      # TODO: అన్ని వేరియబుల్స్ అవసరమా?

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

## 2. ఫైల్‌ను విభజించడం

ఫైల్‌లోని ప్రతి విభాగాన్ని చూద్దాం, ఇది ఏమి చేస్తుంది - మరియు ఎందుకు.

### 2.1 **హెడర్ మరియు స్కీమా (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **లైన్ 1**: YAML లాంగ్వేజ్ సర్వర్ స్కీమా వాలిడేషన్ అందిస్తుంది IDE సపోర్ట్ మరియు IntelliSense కోసం

### 2.2 ప్రాజెక్ట్ మెటాడేటా (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **లైన్ 5**: Azure Developer CLI ఉపయోగించే ప్రాజెక్ట్ పేరు నిర్వచిస్తుంది
- **లైన్లు 6-7**: ఇది టెంప్లేట్ వెర్షన్ 1.0.2 ఆధారంగా ఉందని స్పష్టం చేస్తుంది
- **లైన్లు 8-9**: Azure Developer CLI వెర్షన్ 1.14.0 లేదా అంతకంటే ఎక్కువ అవసరం

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

- **లైన్లు 11-20**: **ప్రీ-డిప్లాయ్‌మెంట్ హుక్** - `azd up` ముందు నడుస్తుంది

      - Unix/Linuxలో: వాలిడేషన్ స్క్రిప్ట్‌ను ఎక్జిక్యూటబుల్‌గా మార్చి నడుపుతుంది
      - Windowsలో: PowerShell వాలిడేషన్ స్క్రిప్ట్ నడుపుతుంది
      - రెండూ ఇంటరాక్టివ్‌గా ఉంటాయి మరియు విఫలమైతే డిప్లాయ్‌మెంట్ ఆగుతుంది

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
- **లైన్లు 21-30**: **పోస్ట్-ప్రొవిజన్ హుక్** - Azure వనరులు సృష్టించిన తర్వాత నడుస్తుంది

  - ఎన్విరాన్‌మెంట్ వేరియబుల్స్ రాయడానికి స్క్రిప్ట్స్‌ను ఎగ్జిక్యూట్ చేస్తుంది
  - ఈ స్క్రిప్ట్స్ విఫలమైనా డిప్లాయ్‌మెంట్ కొనసాగుతుంది (`continueOnError: true`)

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
- **లైన్లు 31-40**: **పోస్ట్-డిప్లాయ్ హుక్** - అప్లికేషన్ డిప్లాయ్ అయిన తర్వాత నడుస్తుంది

  - తుది సెటప్ స్క్రిప్ట్స్‌ను ఎగ్జిక్యూట్ చేస్తుంది
  - స్క్రిప్ట్స్ విఫలమైనా కొనసాగుతుంది

### 2.4 సర్వీస్ కాన్ఫిగరేషన్ (41-48)

మీరు డిప్లాయ్ చేస్తున్న అప్లికేషన్ సర్వీస్‌ను ఇది కాన్ఫిగర్ చేస్తుంది.

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

- **లైన్ 42**: "api_and_frontend" అనే సర్వీస్‌ను నిర్వచిస్తుంది
- **లైన్ 43**: సోర్స్ కోడ్ కోసం `./src` డైరెక్టరీని సూచిస్తుంది
- **లైన్ 44**: Pythonని ప్రోగ్రామింగ్ లాంగ్వేజ్‌గా స్పష్టం చేస్తుంది
- **లైన్ 45**: Azure Container Appsను హోస్టింగ్ ప్లాట్‌ఫారమ్‌గా ఉపయోగిస్తుంది
- **లైన్లు 46-48**: Docker కాన్ఫిగరేషన్

      - "api_and_frontend" అనే ఇమేజ్ పేరును ఉపయోగిస్తుంది
      - Docker ఇమేజ్‌ను Azureలో రిమోట్‌గా బిల్డ్ చేస్తుంది (లోకల్‌గా కాదు)

### 2.5 పైప్‌లైన్ వేరియబుల్స్ (49-76)

CI/CD పైప్‌లైన్లలో ఆటోమేషన్ కోసం `azd` నడపడానికి సహాయపడే వేరియబుల్స్.

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

ఈ విభాగం **డిప్లాయ్‌మెంట్ సమయంలో** ఉపయోగించే ఎన్విరాన్‌మెంట్ వేరియబుల్స్‌ను నిర్వచిస్తుంది, వాటిని వర్గీకరించి:

- **Azure రిసోర్స్ పేర్లు (లైన్లు 51-60)**:
      - ముఖ్యమైన Azure సర్వీస్ రిసోర్స్ పేర్లు ఉదా, రిసోర్స్ గ్రూప్, AI Hub, AI Project, మొదలైనవి
- **ఫీచర్ ఫ్లాగ్స్ (లైన్లు 61-63)**:
      - నిర్దిష్ట Azure సర్వీసులను ఎనేబుల్/డిసేబుల్ చేయడానికి బూలియన్ వేరియబుల్స్
- **AI ఏజెంట్ కాన్ఫిగరేషన్ (లైన్లు 64-71)**:
      - ప్రధాన AI ఏజెంట్ కోసం కాన్ఫిగరేషన్, పేరు, ID, డిప్లాయ్‌మెంట్ సెట్టింగ్స్, మోడల్ వివరాలు
- **AI ఎంబెడింగ్ కాన్ఫిగరేషన్ (లైన్లు 72-79)**:
      - వెక్టర్ సెర్చ్ కోసం ఉపయోగించే ఎంబెడింగ్ మోడల్ కాన్ఫిగరేషన్
- **సెర్చ్ మరియు మానిటరింగ్ (లైన్లు 80-84)**:
      - సెర్చ్ ఇండెక్స్ పేరు, ఉన్న రిసోర్స్ IDs, మరియు మానిటరింగ్/ట్రేసింగ్ సెట్టింగ్స్

---

## 3. ఎన్విరాన్‌మెంట్ వేరియబుల్స్ తెలుసుకోండి
డిప్లాయ్‌మెంట్ యొక్క కాన్ఫిగరేషన్ మరియు ప్రవర్తనను నియంత్రించడానికి ఈ ఎన్విరాన్‌మెంట్ వేరియబుల్స్ ఉపయోగించబడతాయి, వాటి ప్రాథమిక ఉద్దేశం ప్రకారం వర్గీకరించబడ్డాయి. చాలా వేరియబుల్స్‌కు సెన్సిబుల్ డిఫాల్ట్స్ ఉంటాయి, కానీ మీరు మీ నిర్దిష్ట అవసరాలకు లేదా ఉన్న Azure వనరులకు అనుగుణంగా వాటిని అనుకూలీకరించవచ్చు.

### 3.1 అవసరమైన వేరియబుల్స్ 

```bash title="" linenums="0"
# కోర్ అజ్యూర్ కాన్ఫిగరేషన్
AZURE_ENV_NAME                    # వాతావరణం పేరు (వనరుల పేరు పెట్టడంలో ఉపయోగించబడుతుంది)
AZURE_LOCATION                    # మోహరింపు ప్రాంతం
AZURE_SUBSCRIPTION_ID             # లక్ష్య సబ్‌స్క్రిప్షన్
AZURE_RESOURCE_GROUP              # వనరుల సమూహం పేరు
AZURE_PRINCIPAL_ID                # RBAC కోసం యూజర్ ప్రిన్సిపల్

# వనరుల పేర్లు (స్పష్టంగా పేర్కొనబడని పక్షంలో ఆటో-జనరేట్ చేయబడుతుంది)
AZURE_AIHUB_NAME                  # AI ఫౌండ్రీ హబ్ పేరు
AZURE_AIPROJECT_NAME              # AI ప్రాజెక్ట్ పేరు
AZURE_AISERVICES_NAME             # AI సేవల ఖాతా పేరు
AZURE_STORAGE_ACCOUNT_NAME        # నిల్వ ఖాతా పేరు
AZURE_CONTAINER_REGISTRY_NAME     # కంటైనర్ రిజిస్ట్రీ పేరు
AZURE_KEYVAULT_NAME               # కీ వాల్ట్ పేరు (ఉపయోగించబడితే)
```

### 3.2 మోడల్ కాన్ఫిగరేషన్ 
```bash title="" linenums="0"
# చాట్ మోడల్ కాన్ఫిగరేషన్
AZURE_AI_AGENT_MODEL_NAME         # డిఫాల్ట్: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # డిఫాల్ట్: OpenAI (లేదా Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # డిఫాల్ట్: తాజా అందుబాటులో ఉన్నది
AZURE_AI_AGENT_DEPLOYMENT_NAME    # చాట్ మోడల్ కోసం డిప్లాయ్‌మెంట్ పేరు
AZURE_AI_AGENT_DEPLOYMENT_SKU     # డిఫాల్ట్: స్టాండర్డ్
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # డిఫాల్ట్: 80 (వేల TPM)

# ఎంబెడింగ్ మోడల్ కాన్ఫిగరేషన్
AZURE_AI_EMBED_MODEL_NAME         # డిఫాల్ట్: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # డిఫాల్ట్: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # డిఫాల్ట్: తాజా అందుబాటులో ఉన్నది
AZURE_AI_EMBED_DEPLOYMENT_NAME    # ఎంబెడింగ్‌ల కోసం డిప్లాయ్‌మెంట్ పేరు
AZURE_AI_EMBED_DEPLOYMENT_SKU     # డిఫాల్ట్: స్టాండర్డ్
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # డిఫాల్ట్: 50 (వేల TPM)

# ఏజెంట్ కాన్ఫిగరేషన్
AZURE_AI_AGENT_NAME               # ఏజెంట్ ప్రదర్శన పేరు
AZURE_EXISTING_AGENT_ID           # ఉన్న ఏజెంట్‌ను ఉపయోగించండి (ఐచ్ఛికం)
```

### 3.3 ఫీచర్ టాగిల్
```bash title="" linenums="0"
# ఐచ్ఛిక సేవలు
USE_APPLICATION_INSIGHTS         # డిఫాల్ట్: నిజం
USE_AZURE_AI_SEARCH_SERVICE      # డిఫాల్ట్: అబద్ధం
USE_CONTAINER_REGISTRY           # డిఫాల్ట్: నిజం

# మానిటరింగ్ మరియు ట్రేసింగ్
ENABLE_AZURE_MONITOR_TRACING     # డిఫాల్ట్: అబద్ధం
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # డిఫాల్ట్: అబద్ధం

# శోధన కాన్ఫిగరేషన్
AZURE_AI_SEARCH_INDEX_NAME       # శోధన సూచిక పేరు
AZURE_SEARCH_SERVICE_NAME        # శోధన సేవ పేరు
```

### 3.4 AI ప్రాజెక్ట్ కాన్ఫిగరేషన్ 
```bash title="" linenums="0"
# ఉన్న వనరులను ఉపయోగించండి
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # ఉన్న AI ప్రాజెక్ట్ యొక్క పూర్తి వనరుల ID
AZURE_EXISTING_AIPROJECT_ENDPOINT       # ఉన్న ప్రాజెక్ట్ యొక్క ఎండ్‌పాయింట్ URL
```

### 3.5 మీ వేరియబుల్స్‌ను తనిఖీ చేయండి

Azure Developer CLI ఉపయోగించి మీ ఎన్విరాన్‌మెంట్ వేరియబుల్స్‌ను వీక్షించండి మరియు నిర్వహించండి:

```bash title="" linenums="0"
# ప్రస్తుత పరిసరానికి సంబంధించిన అన్ని పరిసర మార్పులను చూడండి
azd env get-values

# ఒక నిర్దిష్ట పరిసర మార్పును పొందండి
azd env get-value AZURE_ENV_NAME

# ఒక పరిసర మార్పును సెట్ చేయండి
azd env set AZURE_LOCATION eastus

# .env ఫైల్ నుండి బహుళ మార్పులను సెట్ చేయండి
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:  
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదాన్ని ఉపయోగించడం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->