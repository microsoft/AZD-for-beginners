# 4. ഒരു ടെംപ്ലേറ്റ് കോൺഫിഗർ ചെയ്യുക

!!! ടിപ്പ് "ഈ മോഡ്യൂളിന്റെ അവസാനം നിങ്ങൾക്ക് സാധിക്കും"

    - [ ] `azure.yaml`-ന്റെ ഉദ്ദേശ്യം മനസ്സിലാക്കുക
    - [ ] `azure.yaml`-ന്റെ ഘടന മനസ്സിലാക്കുക
    - [ ] azd ലൈഫ്സൈക്കിൾ `hooks`-ന്റെ മൂല്യം മനസ്സിലാക്കുക
    - [ ] **ലാബ് 4:** പരിതസ്ഥിതി വ്യത്യാസങ്ങൾ കണ്ടെത്തുകയും മാറ്റുകയും ചെയ്യുക

---

!!! പ്രോംപ്റ്റ് "`azure.yaml` ഫയൽ എന്താണ് ചെയ്യുന്നത്? ഒരു കോഡ്‌ഫെൻസി ഉപയോഗിച്ച് ലൈൻപ്രതി വിശദീകരിക്കുക"

      `azure.yaml` ഫയൽ Azure Developer CLI (azd)യ്‌ക്കുള്ള **ക്രമീകരണ ഫയലാണ്**. ഇത് നിങ്ങളുടെ അപ്ലിക്കേഷൻ എങ്ങനെ Azure-ലേക്ക് വിന്യസിക്കപ്പെടണം എന്ന് നിർവ്വചിക്കുന്നു, കൂടാതെ ഇൻഫ്രാസ്ട്രക്ചർ, സർവീസുകൾ, വിന്യാസ ഹുക്കുകൾ, പരിതസ്ഥിതി വ്യത്യാസങ്ങൾ എന്നിവ ഉൾപ്പെടുന്നു.

---

## 1. ഉദ്ദേശ്യവും പ്രവർത്തനക്ഷമതയും

ഈ `azure.yaml` ഫയൽ ഒരു AI ഏജന്റ് അപ്ലിക്കേഷന്റെ **വിന്യാസ രൂപരേഖ** ആയി പ്രവർത്തിക്കുന്നു, അത്:

1. വിന്യാസത്തിനു മുൻപ് പരിതസ്ഥിതി **തിരുത്തുന്നു**
2. Azure AI സർവീസുകൾ (AI ഹബ്, AI പ്രോജക്‌ട്, സെർച്ച് തുടങ്ങിയവ) **വിതരിക്കുന്നു**
3. Python അപ്ലിക്കേഷൻ Azure കണ്ടെയ്‌നർ ആപ്പുകളിൽ **വിന്യസിക്കുന്നു**
4. ചാറ്റ്, എംബഡ്ഡിംഗ് പ്രവർത്തനങ്ങൾക്ക് AI മോഡലുകൾ **കോൺഫിഗർ ചെയ്യുന്നു**
5. AI അപ്ലിക്കേഷനുമായി ബന്ധപ്പെട്ട **മോണിറ്ററിങ്, ട്രേസിംഗ് സജ്ജമാക്കുന്നു**
6. പുതിയതും നിലവിലുള്ളതുമായ Azure AI പ്രോജക്‌ട് സാഹചര്യങ്ങൾ **നടത്തുന്നു**

ഈ ഫയൽ ശരിയായ വാലിഡേഷൻ, വിവരണം, വിന്യാസത്തിനുശേഷം കോൺഫിഗറേഷൻ എന്നിവയോടെ **ഒരൊറ്റ കമാൻഡ് വിന്യാസം** (`azd up`) സാധ്യമാക്കുന്നു.

??? വിവരങ്ങൾ "വിടു കാണുക: `azure.yaml`"

      `azure.yaml` ഫയൽ ഈ AI ഏജന്റ് അപ്ലിക്കേഷൻ Azure-ൽ എങ്ങനെ വിന്യസിക്കണമെന്നും നിയന്ത്രിക്കണമെന്നും നിർവ്വചിക്കുന്നു. വരികളിൽ ചുരുക്കി നോക്കാം.

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

## 2. ഫയൽ ഭേദഗതി

ഫയൽ ഭാഗം ഭാഗമായി പരിശോധിച്ച് അതിന്റെ പ്രവർത്തനം - എന്തിനും എന്തിന് - മനസ്സിലാക്കാം.

### 2.1 **ഹെഡർ, സ്കീമ (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **ലെൻ 1**: YAML ഭാഷ സർവർക്ക് സ്കീമ നിർണ്ണയം, IDE പിന്തുണക്കും IntelliSense-ക്കും

### 2.2 പ്രോജക്‌ട് മെറ്റാഡേറ്റ (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **ലെൻ 5**: Azure Developer CLI ഉപയോഗിക്കുന്ന പ്രോജക്‌ട് പേര് നിർവ്വചിക്കുന്നു
- **ലെൻസ് 6-7**: ഈ ടെംപ്ലേറ്റ് പതിപ്പ് 1.0.2 ആണെന്ന് പരാമർശിക്കുന്നു
- **ലെൻസ് 8-9**: Azure Developer CLI പതിപ്പ് 1.14.0 അല്ലെങ്കിൽ അതിൽമുകളിൽ ആവശ്യമാണ്

### 2.3 വിന്യാസ ഹുക്കുകൾ (11-40)

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

- **ലെൻസ് 11-20**: **വിന്യാസത്തിനു മുൻപുള്ള ഹുക്ക്** - `azd up` പ്രവർത്തിക്കുന്നതിന് മുമ്പ് ഓടുന്നു

      - Unix/Linux-ൽ: സാധുത പരിശോധിക്കുന്ന സ്‌ക്രിപ്റ്റ് നിർവഹിക്കാൻ അനുമതി നൽകുന്നു, തുടർന്ന് ഓടിക്കുന്നു
      - Windows-ൽ: PowerShell സാധുതാ സ്‌ക്രിപ്റ്റ് ഓടിക്കുന്നു
      - രണ്ടുതും ഇന്ററാക്റ്റീവ് ആണ്, പരാജയപ്പെട്ടാൽ വിന്യാസം നിർത്തും

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
- **ലെൻസ് 21-30**: **വിന്യാസ ശേഷമുള്ള ഹുക്ക്** - Azure വിഭവങ്ങൾ സൃഷ്ടിച്ചതിനു ശേഷം ഓടുന്നു

  - പരിതസ്ഥിതി വ്യത്യാസങ്ങൾ എഴുതുന്ന സ്‌ക്രിപ്റ്റുകൾ നടത്തുന്നു
  - സ്‌ക്രിപ്റ്റുകൾ പരാജയപ്പെട്ടാലും തുടരും (`continueOnError: true`)

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
- **ലെൻസ് 31-40**: **വിന്യാസ ശേഷമുള്ള ഹുക്ക്** - അപ്ലിക്കേഷൻ വിന്യാസത്തിന് ശേഷം ഓടുന്നു

  - അന്തിമ ക്രമീകരണ സ്‌ക്രിപ്റ്റുകൾ ഓടിക്കുന്നു
  - പരാജയപ്പെട്ടാലും തുടരും

### 2.4 സർവീസ് കോൺഫിഗറേഷൻ (41-48)

നിങ്ങൾ വിന്യാസം ചെയ്യുന്ന അപ്ലിക്കേഷൻ സർവീസ് ഇതോടെ ക്രമീകരിക്കുന്നു.

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

- **ലെൺ 42**: "api_and_frontend" എന്ന പേരിലുള്ള സർവീസ് നിർവചിക്കുന്നു
- **ലെൺ 43**: സോഴ്‌സ് കോഡ് സ്ഥിതി ചെയ്യുന്ന `./src` ഡയറക്ടറി കാണിക്കുന്നു
- **ലെൺ 44**: പ്രസ്തുത പ്രോഗ്രാമിംഗ് ഭാഷ Python ആണെന്ന് സൂചിപ്പിക്കുന്നു
- **ലെൺ 45**: ഹോസ്റ്റ് പ്ലാറ്റ്‌ഫോമായി Azure കണ്ടെയ്‌നർ ആപ്പുകൾ ഉപയോഗിക്കുന്നു
- **ലെൻസ് 46-48**: ഡോക്കർ കോൺഫിഗറേഷൻ

      - "api_and_frontend" എന്ന ഇമേജ് ആണ് ഉപയോഗിക്കുന്നത്
      - Docker ഇമേജ് ലൊക്കലി അല്ല, Azure-യിൽ ദൂരെ നിർമ്മിക്കുന്നു

### 2.5 പൈപ്പ്‌ലൈൻ വേരിയബിളുകൾ (49-76)

ഇവ `azd` CI/CD പൈപ്പ്‌ലൈൻներում ഓട്ടോമേഷനായി ഉപയോഗിക്കുന്ന വേരിയബിളുകളാണ്

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

ഈ വിഭാഗം, വിന്യാസം നടക്കുമ്പോൾ ഉപയോഗിക്കുന്ന പരിതസ്ഥിതി വ്യത്യാസങ്ങൾ, വിഭാഗമ്ബേർപ്പെടുത്തി സമാഹരിക്കുന്നു:

- **Azure വിഭവ നാമങ്ങൾ (ലെൻസ് 51-60)**:
      - പ്രധാന Azure സർവീസ് വിഭവ നാമങ്ങൾ (Resource Group, AI Hub, AI പ്രോജക്‌ട് തുടങ്ങിയവ)
- **ഫീച്ചർ ഫ്‌ളാഗുകൾ (ലെൻസ് 61-63)**:
      - പ്രത്യേക Azure സർവീസുകൾ പ്രവർത്തിപ്പിക്കാനോ പ്രവർത്തിച്ചില്ലാക്കാനോ ബൂളിയൻ വേരിയബിളുകൾ
- **AI ഏജന്റ് കോൺഫിഗറേഷൻ (ലെൻസ് 64-71)**:
      - മുഖ്യ AI ഏജന്റ് പേര്, ഐഡി, വിന്യാസ ക്രമീകരണങ്ങൾ, മോഡൽ വിവരങ്ങൾ
- **AI എംബഡ്ഡിംഗ് കോൺഫിഗറേഷൻ (ലെൻസ് 72-79)**:
      - വെക്ടർ സെർചിന് ഉപയോഗിക്കുന്ന എംബഡ്ഡിംഗ് മോഡലിന്റെ ക്രമീകരണം
- **സെർച്ച്, മോണിറ്ററിങ് (ലെൻസ് 80-84)**:
      - Search index പേര്, നിലവിലുള്ള വിഭവ ഐഡികൾ, മോണിറ്ററിങ്/ട്രേസിംഗ് ക്രമീകരണങ്ങൾ

---

## 3. പരിതസ്ഥിതി വ്യത്യാസങ്ങൾ അറിയുക

താഴെപ്പറയുന്ന പരിതസ്ഥിതി വ്യത്യാസങ്ങൾ നിങ്ങളുടെ വിന്യാസത്തിന്റെ ക്രമീകരണവും പെരുമാറ്റവും നിയന്ത്രിക്കുന്നു, പ്രധാന ഉദേശ്യം അനുസരിച്ച് ക്രമീകരിച്ചിരിക്കുന്നു. പല വേരിയബിളുകൾക്കും യോജിച്ച ഡിഫോൾട്ട് മൂല്യങ്ങളുണ്ട്, എന്നാൽ നിങ്ങൾ താങ്കളുടെ പ്രത്യേക ആവശ്യത്തിനോ നിലവിലുള്ള Azure വിഭവങ്ങളോ അനുസരിച്ച് അത് ഇഷ്ടാനുസൃതമാക്കാം.

### 3.1 ആവശ്യമായ വ്യത്യാസങ്ങൾ 

```bash title="" linenums="0"
# കോർ അസ്യൂർ കോൺഫിഗറേഷൻ
AZURE_ENV_NAME                    # പരിസരത്തിന്റെ പേര് (റിസോഴ്സ് നാമകരണത്തിൽ ഉപയോഗിക്കുന്നു)
AZURE_LOCATION                    # വിനിയോഗ മേഖല
AZURE_SUBSCRIPTION_ID             # ലക്ഷ്യ സബ്സ്ക്രിപ്ഷൻ
AZURE_RESOURCE_GROUP              # റിസോഴ്സ് ഗ്രൂപ്പ് നാമം
AZURE_PRINCIPAL_ID                # RBAC-മേൽ ഉപയോക്തൃ പ്രിൻസിപ്പൽ

# റിസോഴ്സ് നാമങ്ങൾ (ചേർത്തിട്ടില്ലെങ്കിൽ സ്വയം സൃഷ്ടിക്കപ്പെടും)
AZURE_AIHUB_NAME                  # മൈക്രോസോഫ്റ്റ് ഫൗണ്ട്രി ഹബ് നാമം
AZURE_AIPROJECT_NAME              # AI പദ്ധതിയുടെ പേര്
AZURE_AISERVICES_NAME             # AI സേവനങ്ങളുടെ അക്കൗണ്ട് നാമം
AZURE_STORAGE_ACCOUNT_NAME        # സ്റ്റോറെജ് അക്കൗണ്ട് നാമം
AZURE_CONTAINER_REGISTRY_NAME     # കൺറ്റെയ്നർ രജിസ്ട്രി നാമം
AZURE_KEYVAULT_NAME               # കീ വോൾട്ട് നാമം (ഉപയോഗിക്കുകയാണെങ്കിൽ)
```

### 3.2 മോഡൽ ക്രമീകരണം  
```bash title="" linenums="0"
# ചാറ്റ് മോഡൽ കോൺഫിഗറേഷൻ
AZURE_AI_AGENT_MODEL_NAME         # ഡീഫോൾട്ട്: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # ഡീഫോൾട്ട്: OpenAI (അഥവാ Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # ഡീഫോൾട്ട്: ഏറ്റവും പുതിയ ലഭ്യമായത്
AZURE_AI_AGENT_DEPLOYMENT_NAME    # ചാറ്റ് മോഡലിനുള്ള ഡിപ്ലോയ്മെന്റ് നാമം
AZURE_AI_AGENT_DEPLOYMENT_SKU     # ഡീഫോൾട്ട്: സ്റ്റാൻഡേർഡ്
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # ഡീഫോൾട്ട്: 80 (ആയിരക്കണക്കിന് TPM)

# എംബഡ്ഡിംഗ് മോഡൽ കോൺഫിഗറേഷൻ
AZURE_AI_EMBED_MODEL_NAME         # ഡീഫോൾട്ട്: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # ഡീഫോൾട്ട്: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # ഡീഫോൾട്ട്: ഏറ്റവും പുതിയ ലഭ്യമായത്
AZURE_AI_EMBED_DEPLOYMENT_NAME    # എംബഡിംഗിന് ഡിപ്ലോയ്മെന്റ് നാമം
AZURE_AI_EMBED_DEPLOYMENT_SKU     # ഡീഫോൾട്ട്: സ്റ്റാൻഡേർഡ്
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # ഡീഫോൾട്ട്: 50 (ആയിരക്കണക്കിന് TPM)

# ഏജന്റ് കോൺഫിഗറേഷൻ
AZURE_AI_AGENT_NAME               # ഏജന്റ് പ്രദർശന നാമം
AZURE_EXISTING_AGENT_ID           # നിലവിലുള്ള ഏജന്റ് ഉപയോഗിക്കുക (ഐച്ഛിക)
```

### 3.3 ഫീച്ചർ ടോഗിൾ  
```bash title="" linenums="0"
# ഐച്ഛിക സേവനങ്ങൾ
USE_APPLICATION_INSIGHTS         # ഡിഫോൾട്ട്: സത്യം
USE_AZURE_AI_SEARCH_SERVICE      # ഡിഫോൾട്ട്: തെറ്റ്
USE_CONTAINER_REGISTRY           # ഡിഫോൾട്ട്: സത്യം

# നിരീക്ഷണവും ട്രേസിംഗും
ENABLE_AZURE_MONITOR_TRACING     # ഡിഫോൾട്ട്: തെറ്റ്
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # ഡിഫോൾട്ട്: തെറ്റ്

# തിരച്ചിൽ കോൺഫിഗറേഷൻ
AZURE_AI_SEARCH_INDEX_NAME       # തിരച്ചിൽ സൂചികയുടെ പേര്
AZURE_SEARCH_SERVICE_NAME        # തിരച്ചിൽ സേവനത്തിന്റെ പേര്
```

### 3.4 AI പ്രോജക്‌ട് ക്രമീകരണം  
```bash title="" linenums="0"
# നിലവിലുള്ള സ്രോതസ്സുകൾ ഉപയോഗിക്കുക
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # നിലവിലുള്ള AI പദ്ധതിയുടെ പൂർണ്ണ സ്രോതസ് ഐഡി
AZURE_EXISTING_AIPROJECT_ENDPOINT       # നിലവിലുള്ള പദ്ധതിയുടെ എൻഡ്‌പോയിന്റ് URL
```

### 3.5 നിങ്ങളുടെ വ്യത്യാസങ്ങൾ പരിശോധിക്കുക

Azure Developer CLI ഉപയോഗിച്ച് നിങ്ങളുടെ പരിതസ്ഥിതി വ്യത്യാസങ്ങൾ കാണാനും നിയന്ത്രിക്കാനും:

```bash title="" linenums="0"
# നിലവിലുള്ള പരിതസ്ഥിതിക്കായി എല്ലാ പരിതസ്ഥിതി വ്യത്യാസങ്ങളും കാണുക
azd env get-values

# ഒരു പ്രത്യേക പരിതസ്ഥിതി വ്യത്യാസം നേടുക
azd env get-value AZURE_ENV_NAME

# ഒരു പരിതസ്ഥിതി വ്യത്യാസം സജ്ജമാക്കുക
azd env set AZURE_LOCATION eastus

# ഒരു .env ഫയലിൽ നിന്നുള്ള നിരവധി വ്യത്യാസങ്ങൾ സജ്ജമാക്കുക
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**കാര്യവിവരണം**:
ഈ രേഖ [Co-op Translator](https://github.com/Azure/co-op-translator) എന്ന AI പരിഭാഷ സേവനം ഉപയോഗിച്ച് പരിഭാഷപ്പെടുത്തിയതാണ്. നാം സത്യാപേക്ഷയായി പ്രവർത്തിക്കുന്നതിനിടруം, യന്ത്രം ഉപയോഗിച്ച് ഒരുക്കിയ പരിഭാഷകളിൽ ചില തെറ്റുകളോ അശുദ്ധികളോ ഉണ്ടാകാമെന്ന് ദയവായി മനസിലാക്കുക. അതിന്റെ പ്രാഥമിക ഭാഷയിലെ യഥാർത്ഥ രേഖ അഭിമുഖ്യ ഉറവിടമായി കണക്കാക്കപ്പെടണം. നിർണായകമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ ശുപാർശ ചെയ്യപ്പെടുന്നു. ഈ പരിഭാഷ ഉപയോഗിക്കുന്നതിൽ നിന്നുണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾക്കും തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കും ഞങ്ങൾ ഉത്തരവാദിത്വം വഹിക്കുന്നില്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->