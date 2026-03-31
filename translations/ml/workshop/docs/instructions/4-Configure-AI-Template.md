# 4. ഒരു ടെംപ്ലേറ്റ് കോൺഫിഗർ ചെയ്യുക

!!! tip "ഈ മഡ്യൂളിന്റെ അവസാനം നിങ്ങൾക്ക് കഴിയും"

    - [ ] `azure.yaml`യുടെ ഉദ്ദേശ്യം മനസ്സിലാക്കുക
    - [ ] `azure.yaml`യുടെ സ്ട്രക്ചർ മനസ്സിലാക്കുക
    - [ ] azd ലൈഫ്‍സൈക്കിൾ `hooks`യുടെ മൂല്യം മനസ്സിലാക്കുക
    - [ ] **ലാബ് 4:** പരിസ്ഥിതി മാറ്റങ്ങൾ പരിശോധിക്കുക മാറ്റിക്കുക

---

!!! prompt "`azure.yaml` ഫയൽ എന്ത് ചെയ്യുന്നു? ഒരു കോഡ് ഫെൻസ് ഉപയോഗിച്ച് ഓരോ വരിയും വിശദീകരിക്കുക"

      `azure.yaml` ഫയൽ Azure Developer CLI (azd) യുടെ **കോൺഫിഗറേഷൻ ഫയലാണ്**. ഇത് നിങ്ങളുടെ അപ്ലിക്കേഷൻ എങ്ങനെ Azure-ൽ ഡിപ്ലോയ്ചെയ്യണമെന്ന് നിർവചിക്കുന്നു, കൂടാതെ ഇൻഫ്രാസ്ട്രക്ചർ, സർവീസുകൾ, ഡിപ്ലോയ്മെന്റ് ഹൂക്കുകൾ, പരിസ്ഥിതി മാറ്റങ്ങൾ എന്നിവ ഉൾക്കൊള്ളുന്നു.

---

## 1. ഉദ്ദേശ്യം மற்றும் പ്രവർത്തനം

ഈ `azure.yaml` ഫയൽ ഒരു AI ഏജന്റ് അപ്ലിക്കേഷൻക്കുള്ള **ഡിപ്ലോയ്മെന്റ് ബ്ലൂപ്രിന്റ്** ആയി സേവനം ചെയ്യുന്നു, അത്:

1. **ഡിപ്ലോയ്മെന്റ് മുൻപ് പരിസ്ഥിതി പരിശോധന** നടത്തുന്നു
2. **Azure AI സർവീസുകൾ പ്രൊവിഷൻ ചെയ്യുന്നു** (AI ഹബ്, AI പ്രോജക്റ്റ്, സെർച്ച്, മുതലായവ)
3. **Python അപ്ലിക്കേഷൻ Azure Container Apps-ലേക്ക് ഡിപ്ലോയ് ചെയ്യുന്നു**
4. **ചാറ്റ്, എംബെഡ്ഡിംഗ് ഫംഗ്ഷണാലിറ്റികൾക്കായി AI മോഡലുകൾ കോൺഫിഗർ ചെയ്യുന്നു**
5. **AI അപ്ലിക്കേഷന്കായി മോണിറ്ററിങ്, ട്രേസിംഗ് സജ്ജീകരിക്കുന്നു**
6. **പുതിയതും നിലവിലുളളതുമായ Azure AI പ്രോജക്റ്റ് സീനാറിയോ കൈകാര്യം ചെയ്യുന്നു**

ഫയൽ അംഗീകരിച്ചും പ്രൊവിഷൻ ചെയ്തും പോസ്റ്റ്-ഡിപ്ലോയ്മെന്റ് കോൺഫിഗർ വഴി **ഒറ്റ കമാൻഡ് ഡിപ്ലോയ്മെന്റിനുള്ള** (`azd up`) സാധ്യം ആക്കുന്നു.

??? info "വിസ്തരിച്ച് കാണുക: `azure.yaml`"

      `azure.yaml` ഫയൽ Azure Developer CLI ഈ AI ഏജന്റ് അപ്ലിക്കേഷൻ എങ്ങനെ Azure-ൽ ഡിപ്ലോയ് ചെയ്തും മാനേജ് ചെയ്തും പോകും എന്ന് നിർവചിക്കുന്നു. വരിവാരിയായി അത് പരിശോധിക്കാം.

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

## 2. ഫയൽ പിരിച്ചറിയൽ

എന്തുകൊണ്ട് അങ്ങനെ ചെയ്യുന്നു എന്നോടൊപ്പം ഓരോ സെക്ഷനും പരിശോധിക്കാം.

### 2.1 **ഹെഡർ & സ്കീമ (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **വരി 1**: YAML ഭാഷാ സർവർ സ്കീമ സപോർട്ട്, IDE സഹായത്തിനും IntelliSense-ക്കും

### 2.2 പ്രോജക്റ്റ് മെറ്റഡാറ്റ (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **വരി 5**: Azure Developer CLI-ക്കുള്ള പ്രോജക്റ്റ് നാമം നിർവചിക്കുന്നു
- **വരികൾ 6-7**: ടെംപ്ലേറ്റ് വേർഷൻ 1.0.2 അടിസ്ഥാനമാക്കിയതാണ്
- **വരികൾ 8-9**: Azure Developer CLI വേർഷൻ 1.14.0 അല്ലെങ്കിൽ അതിൽ ഉയർന്നു വേണം

### 2.3 ഡിപ്ലോയ് ഹൂക്കുകൾ (11-40)

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

- **വരികൾ 11-20**: **പ്രീ-ഡിപ്ലോയ്മെന്റ് ഹുക്ക്** - `azd up` മുൻപ് ഓടും

      - Unix/Linux: വെരിഫിക്കേഷൻ സ്ക്രിപ്റ്റ് എക്സിക്യൂട്ടബിൾ ആക്കുകയും ഓടിക്കുകയും ചെയ്യുന്നു
      - Windows: PowerShell വെരിഫിക്കേഷൻ സ്ക്രിപ്റ്റ് ഓടിക്കുന്നു
      - ഇരുവരും ഇന്ററാക്ടീവ് ആകുകയും പരാജയം ഭേദഗതി തടയുകയും ചെയ്യും

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
- **വരികൾ 21-30**: **പോസ്റ്റ്-പ്രൊവിഷൻ ഹുക്ക്** - Azure റിസോഴ്‌സുകൾ സൃഷ്ടിച്ചശേഷം ഓടും

  - പരിസ്ഥിതി മാറ്റങ്ങൾ എഴുതി സേവ് ചെയ്യുന്ന സ്ക്രിപ്റ്റുകൾ പ്രവർത്തിപ്പിക്കുന്നു
  - സ്ക്രിപ്റ്റുകൾ പരാജയപ്പെട്ടാലും ഡിപ്ലോയ്മെന്റ് തുടരും (`continueOnError: true`)

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
- **വരികൾ 31-40**: **പോസ്റ്റ്-ഡിപ്ലോയ് ഹുക്ക്** - അപ്ലിക്കേഷൻ ഡിപ്ലോയ് ചെയ്തശേഷം ഓടും

  - അന്തിമ ക്രമീകരണ സ്ക്രിപ്റ്റുകൾ ഓടുന്നു
  - സ്ക്രിപ്റ്റുകൾ പരാജയപ്പെട്ടാലും തുടരുന്നു

### 2.4 സർവീസ് കോൺഫിഗറേഷൻ (41-48)

നിങ്ങൾ ഡിപ്ലോയ് ചെയ്യുന്ന അപ്ലിക്കേഷൻ സർവീസ് ഇതാണ് കോൺഫിഗർ ചെയ്യുന്നത്.

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

- **വരി 42**: "api_and_frontend" എന്ന സർവീസ് നിർവചിക്കുന്നു
- **വരി 43**: സോഴ്സ് കോഡ് `./src` ഡയറക്ടറിയിലാണെന്ന് സൂചിപ്പിക്കുന്നു
- **വരി 44**: പ്രോഗ്രാമിംഗ് ഭാഷ Python ആണ്
- **വരി 45**: Azure Container Apps ഹോസ്റ്റിംഗ് പ്ലാറ്റ്ഫോംയായി ഉപയോഗിക്കുന്നു
- **വരികൾ 46-48**: ഡോക്കർ കോൺഫിഗറേഷൻ

      - "api_and_frontend" എന്ന ഇമേജ് നാമം ഉപയോഗിക്കുന്നു
      - ഡോക്കർ ഇമേജ് Azure-യിൽ ദൂരസ്ഥമായി ബിൽഡ് ചെയ്യുന്നു (ലോകൽ അല്ല)

### 2.5 പൈപ്പ്ലൈൻ വേരിയബിളുകൾ (49-76)

ഇവ `azd` CI/CD പൈപ്പ്ലൈനുകളിൽ ഓട്ടോമേഷൻക്കായി ഉപയോഗിക്കുന്ന വേരിയബിളുകളാണ്.

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

ഈ സെക്ഷൻ ഡിപ്ലോയ്മെന്റ് സമയത്ത് ഉപയോഗിക്കുന്ന പരിസ്ഥിതി വേരിയബിളുകൾ വ്യവസ്ഥാപിക്കുന്നു, വിഭാഗങ്ങളായി ക്രമീകരിച്ചിരിക്കുന്നു:

- **Azure റിസോഴ്‌സ് നാമങ്ങൾ (വരികൾ 51-60)**:
      - കോർ Azure സർവീസ് റിസോഴ്‌സ് നാമങ്ങൾ (Resource Group, AI Hub, AI Project മുതലായവ)
- **ഫീച്ചർ ഫ്ലാഗുകൾ (വരികൾ 61-63)**:
      - പ്രത്യേകം Azure സർവീസുകൾ ഓൺ/ഓഫ് ചെയ്യാൻ ബൂളിയൻ വേരിയബിളുകൾ
- **AI ഏജന്റ് കോൺഫിഗറേഷൻ (വരികൾ 64-71)**:
      - പ്രധാന AI ഏജന്റ് കോൺഫിഗറേഷൻ (നാമം, ID, ഡിപ്ലോയ്മെന്റ് ക്രമീകരണങ്ങൾ, മോഡൽ വിവരങ്ങൾ)
- **AI എംബെഡ്ഡിംഗ് കോൺഫിഗറേഷൻ (വരികൾ 72-79)**:
      - വെക്റ്റർ സെർച്ചിന് ഉപയോഗിക്കുന്ന എംബെഡ്ഡിംഗ് മോഡൽ  
- **സെർച്ച് & മോണിറ്ററിങ് (വരികൾ 80-84)**:
      - സെർച്ച് ഇൻഡക്സ് നാമം, നിലവിലുള്ള റിസോഴ്‌സ് പേര്, മോണിറ്ററിങ്/ട്രേസിംഗ് ക്രമീകരണങ്ങൾ

---

## 3. പരിസ്ഥിതി വേരിയബിളുകൾ അറിയുക  
താഴെ കൊടുത്തിരിക്കുന്ന പരിസ്ഥിതി വേരിയബിളുകൾ നിങ്ങളുടെ ഡിപ്ലോയ്മെന്റിന്റെ കോൺഫിഗറേഷൻ, പെരുമാറ്റം നിയന്ത്രിക്കുന്നു, അവ അവരുടെ പ്രാഥമിക ഉദ്ദേശ്യം അനുസരിച്ച് ക്രമീകരിച്ചിരിക്കുന്നു. മിക്ക വേരിയബിളുകൾക്ക് സാധുവായ ഡിഫോൾട്ടുകൾ ഉണ്ട്, പക്ഷേ നിങ്ങൾക്ക് അവ നിങ്ങളുടെ പ്രത്യേക ആവശ്യങ്ങൾക്കും നിലവിലുള്ള Azure റിസോഴ്‌സുകളുമായി പൊരുത്തപ്പെടുത്തുന്നതിനായി കസ്റ്റമൈസ് ചെയ്യാം.

### 3.1 ആവശ്യമായ വേരിയബിളുകൾ

```bash title="" linenums="0"
# ആസ്യൂർ കോർ കോൻഫിഗറേഷൻ
AZURE_ENV_NAME                    # പരിസ്ഥിതി നാമം (സ്രോതസ്സ് നാമകരണംയിൽ ഉപയോഗിക്കുന്നു)
AZURE_LOCATION                    # വിന്യാസ മേഖല
AZURE_SUBSCRIPTION_ID             # ലക്ഷ്യ സബ്സ്ക്രിപ്ഷൻ
AZURE_RESOURCE_GROUP              # റിസോഴ്സ് ഗ്രൂപ്പ് നാമം
AZURE_PRINCIPAL_ID                # RBAC-ക്ക് ഉപയോക്തൃ പ്രിൻസിപ്പാൾ

# റിസോഴ്സ് പേരുകൾ (നിർദ്ദേശിക്കാതിരുന്നാൽ സ്വയം സൃഷ്ടിക്കപ്പെടും)
AZURE_AIHUB_NAME                  # മൈക്രോസോഫ്റ്റ് ഫൗണ്ട്രി ഹബ്ബ് നാമം
AZURE_AIPROJECT_NAME              # AI പ്രോജക്ട് നാമം
AZURE_AISERVICES_NAME             # AI സേവന അക്കൗണ്ട് നാമം
AZURE_STORAGE_ACCOUNT_NAME        # സ്റ്റോറേജ് അക്കൗണ്ട് നാമം
AZURE_CONTAINER_REGISTRY_NAME     # കണ്ടെയ്‌നർ രജിസ്ട്രി നാമം
AZURE_KEYVAULT_NAME               # കീ വാൽട്ട് നാമം (ഉപയോഗിക്കുന്നെങ്കിൽ)
```

### 3.2 മോഡൽ കോൺഫിഗറേഷൻ

```bash title="" linenums="0"
# ചാറ്റ് മോഡൽ കോൺഫിഗറേഷൻ
AZURE_AI_AGENT_MODEL_NAME         # ഡിഫോൾട്ട്: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # ഡിഫോൾട്ട്: OpenAI (അഥവാ Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # ഡിഫോൾട്ട്: പുതിയതിലധികം ലഭ്യമായത്
AZURE_AI_AGENT_DEPLOYMENT_NAME    # ചാറ്റ് മോഡലിനുള്ള ഡിപ്ലോയ്മെന്റ് നാമം
AZURE_AI_AGENT_DEPLOYMENT_SKU     # ഡിഫോൾട്ട്: സ്റ്റാൻഡേർഡ്
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # ഡിഫോൾട്ട്: 80 (ആയിരക്കണക്കിന് TPM)

# എംബെഡിങ്ങ് മോഡൽ കോൺഫിഗറേഷൻ
AZURE_AI_EMBED_MODEL_NAME         # ഡിഫോൾട്ട്: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # ഡിഫോൾട്ട്: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # ഡിഫോൾട്ട്: പുതിയതിലധികം ലഭ്യമായത്
AZURE_AI_EMBED_DEPLOYMENT_NAME    # എംബെഡിങ്ങുകൾക്കുള്ള ഡിപ്ലോയ്മെന്റ് നാമം
AZURE_AI_EMBED_DEPLOYMENT_SKU     # ഡിഫോൾട്ട്: സ്റ്റാൻഡേർഡ്
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # ഡിഫോൽട്ട്: 50 (ആയിരക്കണക്കിന് TPM)

# ഏജന്റ് കോൺഫിഗറേഷൻ
AZURE_AI_AGENT_NAME               # ഏജന്റിന്റെ പ്രദർശന നാമം
AZURE_EXISTING_AGENT_ID           # നിലവിലുള്ള ഏജന്റ് ഉപയോഗിക്കുക (ഐച്ഛികം)
```

### 3.3 ഫീച്ചർ ടോഗിൾ

```bash title="" linenums="0"
# ഐച്ഛിക സേവനങ്ങൾ
USE_APPLICATION_INSIGHTS         # ഡീഫോൾട്: സത്യം
USE_AZURE_AI_SEARCH_SERVICE      # ഡീഫോൾട്: വ്യസനം
USE_CONTAINER_REGISTRY           # ഡീഫോൾട്: സത്യം

# നിരീക്ഷണവും ട്രേസിംഗും
ENABLE_AZURE_MONITOR_TRACING     # ഡീഫോൾട്: വ്യസനം
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # ഡീഫോൾട്: വ്യസനം

# തിരയൽ കോൺഫിഗറേഷൻ
AZURE_AI_SEARCH_INDEX_NAME       # തിരയൽ ഇൻഡക്സ് നാമം
AZURE_SEARCH_SERVICE_NAME        # തിരയൽ സേവന നാമം
```

### 3.4 AI പ്രോജക്റ്റ് കോൺഫിഗറേഷൻ

```bash title="" linenums="0"
# നിലവിലെ സ്രോതസുകൾ ഉപയോഗിക്കുക
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # നിലവിലെ AI പദ്ധതിയുടെ പൂർണ്ണ സ്രോതസ് ഐഡി
AZURE_EXISTING_AIPROJECT_ENDPOINT       # നിലവിലെ പദ്ധതിയുടെ എണ്ഡ്പോയിന്റ് URL
```

### 3.5 നിങ്ങളുടെ വേരിയബിളുകൾ പരിശോധിക്കുക

Azure Developer CLI ഉപയോഗിച്ച് നിങ്ങളുടെ പരിസ്ഥിതി വേരിയബിളുകൾ പരിശോധിക്കുകയും മാനേജ് ചെയ്യുകയും ചെയ്യുക:

```bash title="" linenums="0"
# നിലവിലുള്ള പരിസ്ഥിതി മാറ്റങ്ങൾ എല്ലാം കാണുക
azd env get-values

# ഒരു പ്രത്യേക പരിസ്ഥിതി മാറ്റം നേടുക
azd env get-value AZURE_ENV_NAME

# ഒരു പരിസ്ഥിതി മാറ്റം സജ്ജമാക്കുക
azd env set AZURE_LOCATION eastus

# ഒരു .env ഫയലിൽ നിന്നുള്ള പല മാറ്റങ്ങളും സജ്ജമാക്കുക
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അവലോകന കുറിപ്പ്**:  
ഈ രേഖ AI വിവർത്തന സേവനമായ [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവർത്തനം ചെയ്തതാണ്. ನಾವು درستതയ്ക്കായി പരിശ്രമിച്ചാലും, ഓട്ടോമേറ്റഡ് വിവർത്തനങ്ങളിൽ പിശകുകൾ അല്ലെങ്കിൽ അശുദ്ധികൾ ഉണ്ടാകാം എന്ന് ശ്രദ്ധിക്കണം. സ്വതന്ത്ര ഭാഷയിൽ ഉള്ള പ്രഥമ രേഖ അധികാരപരമായ സ്രോതസ്സായി പരിഗണിക്കപ്പെടണം. അത്യാവശ്യ വിവരങ്ങൾക്ക് പ്രൊഫഷണൽ മനുഷ്യ വിവർത്തനം ശുപാർശ ചെയ്യപ്പെടുന്നു. ഈ വിവർത്തന ഉപയോഗത്തിൽ നിന്നുണ്ടാകുന്ന തെറ്റായി മനസ്സിലാക്കലുകൾ അല്ലെങ്കിൽ വ്യാഖ്യാനപ്പെട്ടതുകളുടെ ഉത്തരവാദിത്വം ഞങ്ങൾക്ക് ഉണ്ടാകില്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->