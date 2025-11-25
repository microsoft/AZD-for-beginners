<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b4a16f82d68f5820d574acd8946843e4",
  "translation_date": "2025-11-24T22:23:50+00:00",
  "source_file": "workshop/docs/instructions/4-Configure-AI-Template.md",
  "language_code": "ml"
}
-->
# 4. ഒരു ടെംപ്ലേറ്റ് ക്രമീകരിക്കുക

!!! tip "ഈ മോഡ്യൂൾ അവസാനിപ്പിക്കുമ്പോൾ നിങ്ങൾക്ക് കഴിയും"

    - [ ] `azure.yaml` ഫയലിന്റെ ഉദ്ദേശ്യം മനസ്സിലാക്കുക
    - [ ] `azure.yaml` ഫയലിന്റെ ഘടന മനസ്സിലാക്കുക
    - [ ] azd ലൈഫ്സൈക്ലിലെ `hooks`-ന്റെ മൂല്യം മനസ്സിലാക്കുക
    - [ ] **ലാബ് 3:** 

---

!!! prompt "`azure.yaml` ഫയൽ എന്താണ് ചെയ്യുന്നത്? ഒരു കോഡ്‌ഫെൻസ് ഉപയോഗിച്ച് വരി വരിയായി വിശദീകരിക്കുക"

      `azure.yaml` ഫയൽ **Azure Developer CLI (azd)**-ന്റെ കോൺഫിഗറേഷൻ ഫയലാണ്. നിങ്ങളുടെ ആപ്ലിക്കേഷൻ Azure-ലേക്ക് എങ്ങനെ ഡിപ്ലോയ് ചെയ്യണം എന്നതിനെ നിർവചിക്കുന്നു, ഇതിൽ ഇൻഫ്രാസ്ട്രക്ചർ, സർവീസുകൾ, ഡിപ്ലോയ്‌മെന്റ് ഹുക്കുകൾ, പരിസ്ഥിതി വേരിയബിളുകൾ എന്നിവ ഉൾപ്പെടുന്നു.

---

## 1. ഉദ്ദേശ്യംയും പ്രവർത്തനക്ഷമതയും

ഈ `azure.yaml` ഫയൽ ഒരു AI ഏജന്റ് ആപ്ലിക്കേഷനുള്ള **ഡിപ്ലോയ്‌മെന്റ് ബ്ലൂപ്രിന്റ്** ആയി പ്രവർത്തിക്കുന്നു:

1. ഡിപ്ലോയ്‌മെന്റിന് മുമ്പ് **പരിസ്ഥിതി സാധൂകരിക്കുന്നു**
2. **Azure AI സർവീസുകൾ** (AI Hub, AI Project, Search, മുതലായവ) **പ്രൊവിഷൻ ചെയ്യുന്നു**
3. **Python ആപ്ലിക്കേഷൻ** Azure Container Apps-ലേക്ക് **ഡിപ്ലോയ് ചെയ്യുന്നു**
4. **ചാറ്റ്, എംബെഡിംഗ് ഫംഗ്ഷനാലിറ്റികൾക്കുള്ള AI മോഡലുകൾ** കോൺഫിഗർ ചെയ്യുന്നു
5. AI ആപ്ലിക്കേഷനുള്ള **മോണിറ്ററിംഗ്, ട്രേസിംഗ്** ക്രമീകരിക്കുന്നു
6. **പുതിയതും നിലവിലുള്ളതുമായ** Azure AI പ്രോജക്റ്റ് സീനാരിയോകൾ കൈകാര്യം ചെയ്യുന്നു

ഈ ഫയൽ **ഒരു കമാൻഡ് ഡിപ്ലോയ്‌മെന്റ്** (`azd up`) സാധൂകരണം, പ്രൊവിഷൻ, പോസ്റ്റ്-ഡിപ്ലോയ്‌മെന്റ് കോൺഫിഗറേഷൻ എന്നിവയോടെ ഒരു പൂർണ്ണ AI ഏജന്റ് പരിഹാരം പ്രാപ്തമാക്കുന്നു.

??? info "വികസിപ്പിക്കാൻ ക്ലിക്ക് ചെയ്യുക: `azure.yaml`"

      `azure.yaml` ഫയൽ Azure Developer CLI ഈ AI ഏജന്റ് ആപ്ലിക്കേഷൻ Azure-ൽ എങ്ങനെ ഡിപ്ലോയ് ചെയ്യണം, മാനേജ് ചെയ്യണം എന്നതിനെ നിർവചിക്കുന്നു. വരി വരിയായി ഇത് വിശദീകരിക്കാം.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: hooks ആവശ്യമുണ്ടോ? 
      # TODO: എല്ലാ വേരിയബിളുകളും ആവശ്യമുണ്ടോ?

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

## 2. ഫയൽ ഡികൺസ്ട്രക്ഷൻ

ഫയലിന്റെ ഓരോ വിഭാഗവും എന്താണ് ചെയ്യുന്നത് - എന്തുകൊണ്ടാണ് ചെയ്യുന്നത് എന്നതിനെ മനസ്സിലാക്കാം.

### 2.1 **ഹെഡറും സ്കീമയും (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **വരി 1**: IDE പിന്തുണയ്ക്കും IntelliSense-നും വേണ്ടി YAML ഭാഷാ സെർവർ സ്കീമാ സാധൂകരണം നൽകുന്നു

### 2.2 പ്രോജക്റ്റ് മെറ്റാഡാറ്റ (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **വരി 5**: Azure Developer CLI ഉപയോഗിക്കുന്ന പ്രോജക്റ്റ് നാമം നിർവചിക്കുന്നു
- **വരി 6-7**: ഇത് ടെംപ്ലേറ്റ് പതിപ്പ് 1.0.2 അടിസ്ഥാനമാക്കിയുള്ളതാണ്
- **വരി 8-9**: Azure Developer CLI പതിപ്പ് 1.14.0 അല്ലെങ്കിൽ അതിനുമുകളിൽ ആവശ്യമാണ്

### 2.3 ഡിപ്ലോയ് ഹുക്കുകൾ (11-40)

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

- **വരി 11-20**: **പ്രി-ഡിപ്ലോയ്‌മെന്റ് ഹുക്ക്** - `azd up`-ന്റെ മുമ്പ് പ്രവർത്തിക്കുന്നു

      - Unix/Linux-ൽ: സാധൂകരണ സ്ക്രിപ്റ്റ് എക്സിക്യൂട്ടബിൾ ആക്കി പ്രവർത്തിപ്പിക്കുന്നു
      - Windows-ൽ: PowerShell സാധൂകരണ സ്ക്രിപ്റ്റ് പ്രവർത്തിപ്പിക്കുന്നു
      - രണ്ടും ഇന്ററാക്ടീവ് ആണ്, പരാജയപ്പെടുകയാണെങ്കിൽ ഡിപ്ലോയ്‌മെന്റ് നിർത്തും

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
- **വരി 21-30**: **പോസ്റ്റ്-പ്രൊവിഷൻ ഹുക്ക്** - Azure റിസോഴ്സുകൾ സൃഷ്ടിച്ചതിന് ശേഷം പ്രവർത്തിക്കുന്നു

  - പരിസ്ഥിതി വേരിയബിളുകൾ എഴുതുന്ന സ്ക്രിപ്റ്റുകൾ പ്രവർത്തിപ്പിക്കുന്നു
  - ഈ സ്ക്രിപ്റ്റുകൾ പരാജയപ്പെടുകയാണെങ്കിലും ഡിപ്ലോയ്‌മെന്റ് തുടരുന്നു (`continueOnError: true`)

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
- **വരി 31-40**: **പോസ്റ്റ്-ഡിപ്ലോയ് ഹുക്ക്** - ആപ്ലിക്കേഷൻ ഡിപ്ലോയ്‌മെന്റിന് ശേഷം പ്രവർത്തിക്കുന്നു

  - അന്തിമ ക്രമീകരണ സ്ക്രിപ്റ്റുകൾ പ്രവർത്തിപ്പിക്കുന്നു
  - സ്ക്രിപ്റ്റുകൾ പരാജയപ്പെടുകയാണെങ്കിലും തുടരുന്നു

### 2.4 സർവീസ് കോൺഫിഗറേഷൻ (41-48)

നിങ്ങൾ ഡിപ്ലോയ് ചെയ്യുന്ന ആപ്ലിക്കേഷൻ സർവീസ് ഇത് കോൺഫിഗർ ചെയ്യുന്നു.

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

- **വരി 42**: "api_and_frontend" എന്ന പേരിൽ ഒരു സർവീസ് നിർവചിക്കുന്നു
- **വരി 43**: സോഴ്‌സ് കോഡിനായി `./src` ഡയറക്ടറിയിലേക്ക് സൂചിപ്പിക്കുന്നു
- **വരി 44**: Python പ്രോഗ്രാമിംഗ് ഭാഷയായി നിർവചിക്കുന്നു
- **വരി 45**: Azure Container Apps ഹോസ്റ്റിംഗ് പ്ലാറ്റ്‌ഫോമായി ഉപയോഗിക്കുന്നു
- **വരി 46-48**: Docker കോൺഫിഗറേഷൻ

      - "api_and_frontend" എന്ന പേരിൽ Docker ഇമേജ് ഉപയോഗിക്കുന്നു
      - Docker ഇമേജ് Azure-ൽ ദൂരസ്ഥമായി നിർമ്മിക്കുന്നു (ലോകലിൽ അല്ല)

### 2.5 പൈപ്പ്‌ലൈൻ വേരിയബിളുകൾ (49-76)

CI/CD പൈപ്പ്‌ലൈൻസിൽ ഓട്ടോമേഷൻക്കായി `azd` പ്രവർത്തിപ്പിക്കാൻ സഹായിക്കുന്ന വേരിയബിളുകൾ

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

ഈ വിഭാഗം **ഡിപ്ലോയ്‌മെന്റിനിടെ** ഉപയോഗിക്കുന്ന പരിസ്ഥിതി വേരിയബിളുകൾ നിർവചിക്കുന്നു, വിഭാഗം അനുസരിച്ച് ക്രമീകരിച്ചിരിക്കുന്നു:

- **Azure റിസോഴ്സ് നാമങ്ങൾ (വരി 51-60)**:
      - പ്രധാന Azure സർവീസ് റിസോഴ്സ് നാമങ്ങൾ, ഉദാ: റിസോഴ്സ് ഗ്രൂപ്പ്, AI Hub, AI Project മുതലായവ
- **ഫീച്ചർ ഫ്ലാഗുകൾ (വരി 61-63)**:
      - പ്രത്യേക Azure സർവീസുകൾ പ്രാപ്തമാക്കാൻ/പ്രാപ്തമാക്കാതാക്കാൻ ബൂലിയൻ വേരിയബിളുകൾ
- **AI ഏജന്റ് കോൺഫിഗറേഷൻ (വരി 64-71)**:
      - പ്രധാന AI ഏജന്റിനുള്ള കോൺഫിഗറേഷൻ, നാമം, ID, ഡിപ്ലോയ്‌മെന്റ് ക്രമീകരണങ്ങൾ, മോഡൽ വിശദാംശങ്ങൾ
- **AI എംബെഡിംഗ് കോൺഫിഗറേഷൻ (വരി 72-79)**:
      - വെക്ടർ സെർച്ച് ഉപയോഗിക്കുന്ന എംബെഡിംഗ് മോഡലിനുള്ള കോൺഫിഗറേഷൻ
- **സെർച്ച്, മോണിറ്ററിംഗ് (വരി 80-84)**:
      - സെർച്ച് ഇൻഡക്സ് നാമം, നിലവിലുള്ള റിസോഴ്സ് IDs, മോണിറ്ററിംഗ്/ട്രേസിംഗ് ക്രമീകരണങ്ങൾ

---

## 3. പരിസ്ഥിതി വേരിയബിളുകൾ അറിയുക
നിങ്ങളുടെ ഡിപ്ലോയ്‌മെന്റിന്റെ കോൺഫിഗറേഷനും പെരുമാറ്റത്തിനും നിയന്ത്രണം നൽകുന്ന പരിസ്ഥിതി വേരിയബിളുകൾ, അവയുടെ പ്രാഥമിക ഉദ്ദേശ്യം അനുസരിച്ച് ക്രമീകരിച്ചിരിക്കുന്നു. മിക്കവാറും വേരിയബിളുകൾക്ക് സാർവജനീനമായ ഡിഫോൾട്ടുകൾ ഉണ്ട്, എന്നാൽ നിങ്ങളുടെ പ്രത്യേക ആവശ്യങ്ങൾക്കോ നിലവിലുള്ള Azure റിസോഴ്സുകൾക്കോ അനുയോജ്യമായി അവയെ ഇഷ്ടാനുസൃതമാക്കാം.

### 3.1 ആവശ്യമായ വേരിയബിളുകൾ 

```bash title="" linenums="0"
# കോർ Azure കോൺഫിഗറേഷൻ
AZURE_ENV_NAME                    # പരിസ്ഥിതി പേര് (സ്രോതസ്സ് നാമകരണത്തിൽ ഉപയോഗിക്കുന്നു)
AZURE_LOCATION                    # വിന്യാസ പ്രദേശം
AZURE_SUBSCRIPTION_ID             # ലക്ഷ്യ സബ്സ്ക്രിപ്ഷൻ
AZURE_RESOURCE_GROUP              # സ്രോതസ്സ് ഗ്രൂപ്പ് പേര്
AZURE_PRINCIPAL_ID                # RBAC-ക്കുള്ള ഉപയോക്തൃ പ്രിൻസിപ്പൽ

# സ്രോതസ്സ് പേരുകൾ (നിർവചിച്ചില്ലെങ്കിൽ സ്വയം സൃഷ്ടിക്കുന്നു)
AZURE_AIHUB_NAME                  # AI Foundry ഹബ് പേര്
AZURE_AIPROJECT_NAME              # AI പ്രോജക്റ്റ് പേര്
AZURE_AISERVICES_NAME             # AI സേവനങ്ങളുടെ അക്കൗണ്ട് പേര്
AZURE_STORAGE_ACCOUNT_NAME        # സ്റ്റോറേജ് അക്കൗണ്ട് പേര്
AZURE_CONTAINER_REGISTRY_NAME     # കണ്ടെയ്നർ രജിസ്ട്രി പേര്
AZURE_KEYVAULT_NAME               # കീ വോൾട്ട് പേര് (ഉപയോഗിച്ചാൽ)
```

### 3.2 മോഡൽ കോൺഫിഗറേഷൻ 
```bash title="" linenums="0"
# ചാറ്റ് മോഡൽ കോൺഫിഗറേഷൻ
AZURE_AI_AGENT_MODEL_NAME         # ഡീഫോൾട്ട്: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # ഡീഫോൾട്ട്: OpenAI (അല്ലെങ്കിൽ Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # ഡീഫോൾട്ട്: ഏറ്റവും പുതിയത് ലഭ്യമാണ്
AZURE_AI_AGENT_DEPLOYMENT_NAME    # ചാറ്റ് മോഡലിനുള്ള ഡിപ്ലോയ്മെന്റ് പേര്
AZURE_AI_AGENT_DEPLOYMENT_SKU     # ഡീഫോൾട്ട്: സ്റ്റാൻഡേർഡ്
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # ഡീഫോൾട്ട്: 80 (TPM ആയിരങ്ങൾ)

# എംബെഡ്ഡിംഗ് മോഡൽ കോൺഫിഗറേഷൻ
AZURE_AI_EMBED_MODEL_NAME         # ഡീഫോൾട്ട്: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # ഡീഫോൾട്ട്: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # ഡീഫോൾട്ട്: ഏറ്റവും പുതിയത് ലഭ്യമാണ്
AZURE_AI_EMBED_DEPLOYMENT_NAME    # എംബെഡ്ഡിംഗിനുള്ള ഡിപ്ലോയ്മെന്റ് പേര്
AZURE_AI_EMBED_DEPLOYMENT_SKU     # ഡീഫോൾട്ട്: സ്റ്റാൻഡേർഡ്
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # ഡീഫോൾട്ട്: 50 (TPM ആയിരങ്ങൾ)

# ഏജന്റ് കോൺഫിഗറേഷൻ
AZURE_AI_AGENT_NAME               # ഏജന്റിന്റെ പ്രദർശന പേര്
AZURE_EXISTING_AGENT_ID           # നിലവിലുള്ള ഏജന്റ് ഉപയോഗിക്കുക (ഓപ്ഷണൽ)
```

### 3.3 ഫീച്ചർ ടോഗിൾ
```bash title="" linenums="0"
# ഐച്ഛിക സേവനങ്ങൾ
USE_APPLICATION_INSIGHTS         # ഡീഫോൾട്ട്: ശരി
USE_AZURE_AI_SEARCH_SERVICE      # ഡീഫോൾട്ട്: തെറ്റ്
USE_CONTAINER_REGISTRY           # ഡീഫോൾട്ട്: ശരി

# നിരീക്ഷണവും ട്രേസിംഗും
ENABLE_AZURE_MONITOR_TRACING     # ഡീഫോൾട്ട്: തെറ്റ്
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # ഡീഫോൾട്ട്: തെറ്റ്

# തിരയൽ കോൺഫിഗറേഷൻ
AZURE_AI_SEARCH_INDEX_NAME       # തിരയൽ സൂചികയുടെ പേര്
AZURE_SEARCH_SERVICE_NAME        # തിരയൽ സേവനത്തിന്റെ പേര്
```

### 3.4 AI പ്രോജക്റ്റ് കോൺഫിഗറേഷൻ 
```bash title="" linenums="0"
# നിലവിലുള്ള വിഭവങ്ങൾ ഉപയോഗിക്കുക
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # നിലവിലുള്ള AI പ്രോജക്റ്റിന്റെ പൂർണ്ണ വിഭവ ID
AZURE_EXISTING_AIPROJECT_ENDPOINT       # നിലവിലുള്ള പ്രോജക്റ്റിന്റെ എന്റ്പോയിന്റ് URL
```

### 3.5 നിങ്ങളുടെ വേരിയബിളുകൾ പരിശോധിക്കുക

Azure Developer CLI ഉപയോഗിച്ച് നിങ്ങളുടെ പരിസ്ഥിതി വേരിയബിളുകൾ കാണാനും മാനേജുചെയ്യാനും:

```bash title="" linenums="0"
# നിലവിലെ പരിസ്ഥിതിയുടെ എല്ലാ പരിസ്ഥിതി ചോദ്യങ്ങൾ കാണുക
azd env get-values

# ഒരു പ്രത്യേക പരിസ്ഥിതി ചോദ്യം നേടുക
azd env get-value AZURE_ENV_NAME

# ഒരു പരിസ്ഥിതി ചോദ്യം സജ്ജമാക്കുക
azd env set AZURE_LOCATION eastus

# .env ഫയലിൽ നിന്ന് നിരവധി ചോദ്യങ്ങൾ സജ്ജമാക്കുക
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അറിയിപ്പ്**:  
ഈ രേഖ AI വിവർത്തന സേവനമായ [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവർത്തനം ചെയ്തതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി ശ്രമിക്കുന്നുവെങ്കിലും, ഓട്ടോമേറ്റഡ് വിവർത്തനങ്ങളിൽ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റായ വിവരങ്ങൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ട്. അതിന്റെ സ്വഭാവ ഭാഷയിലുള്ള അസൽ രേഖയാണ് വിശ്വസനീയമായ ഉറവിടം. നിർണായകമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ വിവർത്തനം ശുപാർശ ചെയ്യുന്നു. ഈ വിവർത്തനം ഉപയോഗിച്ച് ഉണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾ അല്ലെങ്കിൽ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കായി ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->