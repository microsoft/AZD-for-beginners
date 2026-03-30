# 4. టెంప్లేట్‌ని కాన్ఫిగర్ చేయండి

!!! tip "ఈ మాడ్యూల్ చివరిలో మీరు ఏమి చేయగలరో"

    - [ ] `azure.yaml` యొక్క ప్రయోజనం అర్థం చేసుకోగలరు
    - [ ] `azure.yaml` నిర్మాణాన్ని అర్థం చేసుకోగలరు
    - [ ] azd yaşam చక్రం `hooks` విలువను అర్థం చేసుకోగలరు
    - [ ] **ల్యాబ్ 4:** పరిసర వేరియబుల్స్‌ను అన్వేషించండి మరియు మార్చండి

---

!!! prompt "`azure.yaml` ఫైల్ ఏమి చేస్తుంది? ఒక కోడ్ ఫెన్స్ ఉపయోగించి దాని ప్రతి లైన్‌ను వివరిస్తూ వివరించండి"

      `azure.yaml` ఫైల్ అనేది **Azure Developer CLI (azd)** కోసం కాన్ఫిగరేషన్ ఫైల్. ఇది మీ అప్లికేషన్‌ను Azureలో ఎలా డిప్లయ్ చేయాలో నిర్వచిస్తుంది, అందులో ఇన్ఫ్రాస్ట్రక్చర్, సేవలు, డిప్లాయ్‌మెంట్ హుక్స్ మరియు పరిసర వేరియబుల్స్ ఉంటాయి.

---

## 1. ఉద్దేశ్యం మరియు ఫంక్షనాలిటీ

ఈ `azure.yaml` ఫైల్ ఒక AI ఏజెంట్ అప్లికేషన్ కోసం **డిప్లాయ్‌మెంట్ బ్లూప్రింట్** గా పనిచేస్తుంది, ఇది:

1. డిప్లాయ్‌మెంట్ ముందు **పరిసరాలను ధృవీకరిస్తుంది**
2. **Azure AI సేవలను ప్రొవిజన్ చేస్తుంది** (AI Hub, AI Project, Search, మొదలైనవి)
3. **Python అప్లికేషన్‌ను Azure Container Apps‌ కు డిప్లాయ్ చేస్తుంది**
4. చాట్ మరియు ఎంబెడ్డింగ్ ఫంక్షనాలిటీ కోసం **AI మోడల్స్‌ను కాన్ఫిగర్ చేస్తుంది**
5. AI అప్లికేషన్ కోసం **మానిటరింగ్ మరియు ట్రేసింగ్ సెటప్ చేస్తుంది**
6. క్రియేట్ చేయబడే కొత్త లేదా ఉన్నదైన Azure AI ప్రాజెక్ట్ పరిస్థితులను **నిర్వహిస్తుంది**

ఈ ఫైల్ సరైన వాలిడేషన్, ప్రొవిజనింగ్ మరియు పోస్ట్-డిప్లాయ్‌మెంట్ కాన్ఫిగరేషన్‌తో పూర్తి AI ఏజెంట్ సొల్యూషన్‌ను ఒక కమాండ్‌తో (`azd up`) డిప్లాయ్ చేయడానికి సాధ్యంగా చేస్తుంది.

??? info "బహిర్గతి కోసం విస్తరించండి: `azure.yaml`"

      `azure.yaml` ఫైల్ Azure Developer CLI ఈ AI ఏజెంట్ అప్లికేషన్‌ను Azureలో ఎలా డిప్లాయ్ చేసుకోవాలో మరియు నిర్వహించడాన్ని నిర్వచిస్తుంది. దీన్ని పంక్తి-ప్రతి-పంక్తిగా విడగొట్టుకుందాం.

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

## 2. ఫైల్‌ను విచ్ఛిన్నం చేయడం

దీనిని సెక్షన్ ప్రకారం చూద్దాం, ఏమి చేస్తుంది మరియు ఎందుకు అని అర్థం చేసుకోవడానికి.

### 2.1 **హెడ్డర్ మరియు స్కీమా (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **లైన్ 1**: IDE సహాయానికి మరియు IntelliSense కోసం YAML లాంగ్వేజ్ సర్వర్ స్కీమా వాలిడేషన్‌ను అందిస్తుంది

### 2.2 ప్రాజెక్ట్ మెటాడేటా (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **లైన్ 5**: Azure Developer CLI ద్వారా ఉపయోగించే ప్రాజెక్ట్ పేరు నిర్వచిస్తుంది
- **లైన్స్ 6-7**: ఇది template సంస్కరణ 1.0.2 ఆధారంగా ఉందని సూచిస్తుంది
- **లైన్స్ 8-9**: Azure Developer CLI సంస్కరణ 1.14.0 లేదా అంతకంటే పైగా అవసరం

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

- **లైన్స్ 11-20**: **ప్రీ-డిప్లాయ్‌మెంట్ హుక్** - `azd up` ముందు నడుస్తుంది

      - Unix/Linux పై: వాలిడేషన్ స్క్రిప్ట్‌ను ఎక్సిక్యూటబుల్‌గా మార్చి నడిపిస్తుంది
      - Windows పై: PowerShell వాలిడేషన్ స్క్రిప్ట్ నడపబడుతుంది
      - రెండింటూ ఇంటరాక్టివ్ మరియు అవి విఫలమైతే డిప్లాయ్‌మెంట్ నిలిపివేస్తాయి

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
- **లైన్స్ 21-30**: **పోస్ట్-ప్రొవిజన్ హుక్** - Azure రిసోర్సులు క్రియేట్ చేసిన తర్వాత నడుస్తుంది

  - పరిసర వేరియబుల్స్ రాయడం స్క్రిప్ట్‌లు అమలు చేస్తుంది
  - ఈ స్క్రిప్ట్‌లు విఫలమైనా డిప్లాయ్‌మెంట్ కొనసాగుతుంది (`continueOnError: true`)

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
- **లైన్స్ 31-40**: **పోస్ట్-డిప్లॉय్ హుక్** - అప్లికేషన్ డిప్లాయ్ అయిన తర్వాత నడుస్తుంది

  - ఫైనల్ సెటప్ స్క్రిప్ట్‌లను అమలు చేస్తుంది
  - స్క్రిప్ట్‌లు విఫలమైనా కొనసాగుతుంది

### 2.4 సర్వీస్ కాన్ఫిగరేషన్ (41-48)

ఇది మీరు డిప్లాయ్ చేస్తున్న అప్లికేషన్ సర్వీస్‌ను కాన్ఫిగర్ చేస్తుంది.

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
- **లైన్ 43**: సోర్సు కోడ్ కోసం `./src` డైరెక్టరీని సూచిస్తుంది
- **లైన్ 44**: ప్రోగ్రామింగ్ భాషగా Pythonని సూచిస్తుంది
- **లైన్ 45**: హోస్టింగ్ ప్లాట్‌‌ఫార్మ్‌గా Azure Container Apps‌ని ఉపయోగిస్తుంది
- **లైన్స్ 46-48**: Docker కాన్ఫిగరేషన్

      - "api_and_frontend" ను ఇమేజ్ పేరుగా ఉపయోగిస్తుంది
      - Docker ఇమేజ్‌ను స్థానికంగా కాకుండా Azureలో రిమోట్‌గా బిల్డ్ చేస్తుంది

### 2.5 పైప్‌లైన్ వేరియబుల్స్ (49-76)

ఇవి ఆటోమేషన్ కోసం CI/CD పైప్లైన్‌లలో `azd` ను నడపడానికి ఉపయోగించే వేరియబుల్స్

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

ఈ సెక్షన్ డిప్లాయ్‌మెంట్ సమయంలో ఉపయోగించే పరిసర వేరియబుల్స్‌ను నిర్వచిస్తుంది, వర్గాలుగా ఏర్పాటుచేసి:

- **Azure రిసోర్స్ పేర్లు (లైన్స్ 51-60)**:
      - ప్రధాన Azure సేవ రిసోర్స్ పేర్లు ఉదా., Resource Group, AI Hub, AI Project మొదలైనవి
- **ఫీచర్ ఫ్లాగ్స్ (లైన్స్ 61-63)**:
      - నిర్దిష్ట Azure సేవలను ఎనేబుల్/డిసేబుల్ చేయడానికి బూలియన్ వేరియబుల్స్
- **AI ఏజెంట్ కాన్ఫిగరేషన్ (లైన్స్ 64-71)**:
      - ప్రధాన AI ఏజెంట్ కోసం పేరు, ID, డిప్లాయ్‌మెంట్ సెట్టింగ్స్, మోడల్ వివరాలు
- **AI ఎంబెడ్ కాన్ఫిగరేషన్ (లైన్స్ 72-79)**:
      - వెక్టర్ సెర్చ్ కోసం ఉపయోగించే ఎంబెడ్డింగ్ మోడల్ యొక్క కాన్ఫిగరేషన్
- **సర్చ్ మరియు మానిటరింగ్ (లైన్స్ 80-84)**:
      - సర్చ్ ఇండెక్స్ పేరు, ఉన్న రిసోర్స్ IDలు, మరియు మానిటరింగ్/ట్రేసింగ్ సెట్టింగ్స్

---

## 3. పరిసర వేరియబుల్స్‌ను తెలుసుకోండి
కింది పరిసర వేరియబుల్స్ మీ డిప్లాయ్‌మెంట్ కాన్ఫిగరేషన్ మరియు ప్రవర్తనను నియంత్రిస్తాయి, అవి వారి ప్రాథమిక ఉద్దేశ్యాన్ని ఆధారంగా ఏర్పాటు చేయబడ్డాయి. చాలా వేరియబుల్స్‌కు సాధారణ డీఫాల్ట్స్ ఉంటాయి, కానీ మీరు వాటిని మీ నిర్దిష్ట అవసరాలు లేదా ఉన్న Azure రిసోర్స్‌లకు నమోదుచేసుకోవడానికి అనుసృజించవచ్చు.

### 3.1 అవసరమైన వేరియబుల్స్ 

```bash title="" linenums="0"
# ప్రధాన Azure కాన్ఫిగరేషన్
AZURE_ENV_NAME                    # పరిసర పేరు (సంపత్తి పేర్లలో ఉపయోగించబడుతుంది)
AZURE_LOCATION                    # డిప్లాయ్‌మెంట్ ప్రాంతం
AZURE_SUBSCRIPTION_ID             # లక్ష్య సబ్‌స్క్రిప్షన్
AZURE_RESOURCE_GROUP              # రీసోర్స్ గ్రూప్ పేరు
AZURE_PRINCIPAL_ID                # RBAC కోసం వినియోగదారు ప్రిన్సిపల్

# రీసోర్స్ పేర్లు (సూచించనివ్వబడకపోతే ఆటోగా రూపొందించబడతాయి)
AZURE_AIHUB_NAME                  # Microsoft Foundry హబ్ పేరు
AZURE_AIPROJECT_NAME              # AI ప్రాజెక్ట్ పేరు
AZURE_AISERVICES_NAME             # AI సేవల ఖాతా పేరు
AZURE_STORAGE_ACCOUNT_NAME        # స్టోరేజ్ ఖాతా పేరు
AZURE_CONTAINER_REGISTRY_NAME     # కంటైనర్ రిజిస్ట్రీ పేరు
AZURE_KEYVAULT_NAME               # కీ వాల్ట్ పేరు (ఉపయోగించబడితే)
```

### 3.2 మోడల్ కాన్ఫిగరేషన్ 
```bash title="" linenums="0"
# చాట్ మోడల్ కాన్ఫిగరేషన్
AZURE_AI_AGENT_MODEL_NAME         # డిఫాల్ట్: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # డిఫాల్ట్: OpenAI (లేదా Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # డిఫాల్ట్: అందుబాటులో తాజా
AZURE_AI_AGENT_DEPLOYMENT_NAME    # చాట్ మోడల్ కోసం డిప్లాయ్‌మెంట్ పేరు
AZURE_AI_AGENT_DEPLOYMENT_SKU     # డిఫాల్ట్: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # డిఫాల్ట్: 80 (వేలలుగా TPM)

# ఎంబెడ్డింగ్ మోడల్ కాన్ఫిగరేషన్
AZURE_AI_EMBED_MODEL_NAME         # డిఫాల్ట్: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # డిఫాల్ట్: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # డిఫాల్ట్: అందుబాటులో తాజా
AZURE_AI_EMBED_DEPLOYMENT_NAME    # ఎంబెడ్డింగ్స్ కోసం డిప్లాయ్‌మెంట్ పేరు
AZURE_AI_EMBED_DEPLOYMENT_SKU     # డిఫాల్ట్: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # డిఫాల్ట్: 50 (వేలలుగా TPM)

# ఏజెంట్ కాన్ఫిగరేషన్
AZURE_AI_AGENT_NAME               # ఏజెంట్ ప్రదర్శన పేరు
AZURE_EXISTING_AGENT_ID           # ఇప్పటికే ఉన్న ఏజెంట్‌ను ఉపయోగించండి (ఐచ్చికం)
```

### 3.3 ఫీచర్ టోగ్గల్
```bash title="" linenums="0"
# ఐచ్ఛిక సేవలు
USE_APPLICATION_INSIGHTS         # డిఫాల్ట్: true
USE_AZURE_AI_SEARCH_SERVICE      # డిఫాల్ట్: false
USE_CONTAINER_REGISTRY           # డిఫాల్ట్: true

# మానిటరింగ్ మరియు ట్రేసింగ్
ENABLE_AZURE_MONITOR_TRACING     # డిఫాల్ట్: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # డిఫాల్ట్: false

# శోధన కాన్ఫిగరేషన్
AZURE_AI_SEARCH_INDEX_NAME       # శోధన సూచిక పేరు
AZURE_SEARCH_SERVICE_NAME        # శోధన సేవ పేరు
```

### 3.4 AI ప్రాజెక్ట్ కాన్ఫిగరేషన్ 
```bash title="" linenums="0"
# ఉన్న వనరులను ఉపయోగించండి
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # ఉన్న AI ప్రాజెక్ట్ యొక్క పూర్తి వనరు ID
AZURE_EXISTING_AIPROJECT_ENDPOINT       # ఉన్న ప్రాజెక్ట్ యొక్క ఎండ్‌పాయింట్ URL
```

### 3.5 మీ వేరియబుల్స్‌ని తనిఖీ చేయండి

మీ పరిసర వేరియబుల్స్‌ను వీక్షించడానికి మరియు నిర్వహించడానికి Azure Developer CLIను ఉపయోగించండి:

```bash title="" linenums="0"
# ప్రస్తుత ఎన్విరాన్‌మెంట్‌కు సంబంధించిన అన్ని పర్యావరణ వేరియబుల్స్‌ను వీక్షించండి
azd env get-values

# ఒక నిర్దిష్ట పర్యావరణ వేరియబుల్‌ను పొందండి
azd env get-value AZURE_ENV_NAME

# ఒక పర్యావరణ వేరియబుల్‌ను సెట్ చేయండి
azd env set AZURE_LOCATION eastus

# .env ఫైల్ నుండి బహుళ పర్యావరణ వేరియబుల్స్‌ను సెట్ చేయండి
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అవగాహన ప్రకటన**:
ఈ పత్రాన్ని AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీ, ఆటోమెటెడ్ అనువాదాలలో తప్పులు లేదా లోపాలు ఉండవచ్చునని దయచేసి గమనించండి. దాని మాతృభాషలో ఉన్న మూల పత్రాన్ని అధికారిక మూలంగా పరిగణించాలి. ఆవశ్యకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదం సిఫార్సు చేయబడుతుంది. ఈ అనువాదాన్ని ఉపయోగించడంవలన కలిగే ఏవైనా అవగాహన లోపాలు లేదా తప్పుగా అర్థం చేసుకోవడాల కోసం మేము బాధ్యులు కాదము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->