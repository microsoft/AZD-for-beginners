# 4. Configure a Template

!!! tip "SA PAGTATAPOS NG MODULONG ITO MAGAGAWA MO"

    - [ ] Maunawaan ang layunin ng `azure.yaml`
    - [ ] Maunawaan ang istruktura ng `azure.yaml`
    - [ ] Maunawaan ang halaga ng azd lifecycle `hooks`
    - [ ] **Lab 4:** Galugarin at baguhin ang mga environment variable

---

!!! prompt "Ano ang ginagawa ng file na `azure.yaml`? Gumamit ng codefence at ipaliwanag ito linya-por-linya"

      Ang file na `azure.yaml` ang **configuration file para sa Azure Developer CLI (azd)**. Tinatalaga nito kung paano dapat i-deploy ang iyong application sa Azure, kasama ang imprastruktura, mga serbisyo, deployment hooks, at mga environment variable.

---

## 1. Layunin at Pag-andar

Ang `azure.yaml` na ito ay nagsisilbing **deployment blueprint** para sa isang AI agent application na:

1. **Nirerepaso ang kapaligiran** bago mag-deploy
2. **Nag-pro-provision ng Azure AI services** (AI Hub, AI Project, Search, atbp.)
3. **Nag-de-deploy ng Python application** sa Azure Container Apps
4. **Nagko-configure ng mga AI model** para sa chat at embedding na functionality
5. **Nagtatakda ng monitoring at tracing** para sa AI application
6. **Humahawak ng parehong bagong at umiiral na** Azure AI project na mga senaryo

Pinapagana ng file ang **one-command deployment** (`azd up`) ng isang kumpletong AI agent solution na may tamang validation, provisioning, at post-deployment configuration.

??? info "Palawakin Upang Tingnan: `azure.yaml`"

      Ang `azure.yaml` file ay naglalarawan kung paano dapat i-deploy at pamahalaan ng Azure Developer CLI ang AI Agent application na ito sa Azure. Hatiin natin ito at ipaliwanag bawat linya.

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

## 2. Pag-analisa ng File

Daanan natin ang bawat bahagi ng file, upang maunawaan kung ano ang ginagawa nito - at bakit.

### 2.1 **Header at Schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Line 1**: Nagbibigay ng pag-validate ng schema para sa YAML language server para sa suporta ng IDE at IntelliSense

### 2.2 Metadata ng Proyekto (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Line 5**: Itinatakda ang pangalan ng proyekto na ginagamit ng Azure Developer CLI
- **Lines 6-7**: Tinukoy na ito ay batay sa template bersyon 1.0.2
- **Lines 8-9**: Nangangailangan ng Azure Developer CLI bersyon 1.14.0 o mas mataas

### 2.3 Hooks ng Pag-deploy (11-40)

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

- **Lines 11-20**: **Hook bago ang pag-deploy** - tumatakbo bago ang `azd up`

      - Sa Unix/Linux: Ginagawang executable ang validation script at pinapatakbo ito
      - Sa Windows: Pinapatakbo ang PowerShell validation script
      - Pareho ay interactive at hihinto ang deployment kung mabigo

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
- **Lines 21-30**: **Post-provision hook** - tumatakbo pagkatapos malikha ang mga Azure resource

  - Pinapatakbo ang mga script na nagsusulat ng environment variable
  - Nagpapatuloy ang deployment kahit mabigo ang mga script na ito (`continueOnError: true`)

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
- **Lines 31-40**: **Post-deploy hook** - tumatakbo pagkatapos ng deployment ng application

  - Pinapatakbo ang final setup scripts
  - Nagpapatuloy kahit mabigo ang mga script

### 2.4 Konfig ng Serbisyo (41-48)

Ito ang nagko-configure ng application service na ide-deploy mo.

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

- **Line 42**: Nagpapakahulugan ng serbisyo na pinangalanang "api_and_frontend"
- **Line 43**: Tumuturo sa direktoryong `./src` para sa source code
- **Line 44**: Tinutukoy ang Python bilang programming language
- **Line 45**: Ginagamit ang Azure Container Apps bilang hosting platform
- **Lines 46-48**: Docker configuration

      - Ginagamit ang "api_and_frontend" bilang image name
      - Binubuo ang Docker image nang remote sa Azure (hindi locally)

### 2.5 Mga Variable ng Pipeline (49-76)

Ito ang mga variable na tumutulong sa iyo na patakbuhin ang `azd` sa CI/CD pipelines para sa automation

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

Seksyon na ito ay naglalarawan ng mga environment variable na ginagamit **habang nag-de-deploy**, inorganisa ayon sa kategorya:

- **Mga Pangalan ng Azure Resource (Lines 51-60)**:
      - Pangunahing pangalan ng mga resource ng Azure halimbawa, Resource Group, AI Hub, AI Project, atbp.
- **Feature Flags (Lines 61-63)**:
      - Mga boolean variable para paganahin/o hindi paganahin ang mga partikular na Azure service
- **Konfigurasyon ng AI Agent (Lines 64-71)**:
      - Konfigurasyon para sa pangunahing AI agent kabilang ang pangalan, ID, mga setting ng deployment, detalye ng modelo
- **Konfigurasyon ng AI Embedding (Lines 72-79)**:
      - Konfigurasyon para sa embedding model na ginagamit para sa vector search
- **Search at Monitoring (Lines 80-84)**:
      - Pangalan ng search index, umiiral na resource IDs, at mga setting para sa monitoring/tracing

---

## 3. Kilalanin ang Mga Environment Variable
Ang mga sumusunod na environment variable ang kumokontrol sa konfigurasyon at asal ng iyong deployment, inorganisa ayon sa pangunahing layunin nila. Karamihan sa mga variable ay may makatwirang default, pero maaari mo silang i-customize upang tumugma sa iyong partikular na pangangailangan o umiiral na Azure resources.

### 3.1 Mga Kinakailangang Variable 

```bash title="" linenums="0"
# Pangunahing Konfigurasyon ng Azure
AZURE_ENV_NAME                    # Pangalan ng kapaligiran (ginagamit sa pagbuo ng pangalan ng mga resource)
AZURE_LOCATION                    # Rehiyon ng pag-deploy
AZURE_SUBSCRIPTION_ID             # Target na subscription
AZURE_RESOURCE_GROUP              # Pangalan ng resource group
AZURE_PRINCIPAL_ID                # User principal para sa RBAC

# Mga pangalan ng resource (awtomatikong gagawin kung hindi tinukoy)
AZURE_AIHUB_NAME                  # Pangalan ng hub ng Microsoft Foundry
AZURE_AIPROJECT_NAME              # Pangalan ng proyekto ng AI
AZURE_AISERVICES_NAME             # Pangalan ng account ng serbisyo ng AI
AZURE_STORAGE_ACCOUNT_NAME        # Pangalan ng storage account
AZURE_CONTAINER_REGISTRY_NAME     # Pangalan ng container registry
AZURE_KEYVAULT_NAME               # Pangalan ng Key Vault (kung gagamitin)
```

### 3.2 Konfigurasyon ng Modelo 
```bash title="" linenums="0"
# Konfigurasyon ng modelo ng chat
AZURE_AI_AGENT_MODEL_NAME         # Karaniwan: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Karaniwan: OpenAI (o Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Karaniwan: pinakahuling magagamit
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Pangalan ng deployment para sa modelo ng chat
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Karaniwan: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Karaniwan: 80 (libo-libong TPM)

# Konfigurasyon ng modelo ng embedding
AZURE_AI_EMBED_MODEL_NAME         # Karaniwan: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Karaniwan: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Karaniwan: pinakahuling magagamit
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Pangalan ng deployment para sa embeddings
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Karaniwan: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Karaniwan: 50 (libo-libong TPM)

# Konfigurasyon ng ahente
AZURE_AI_AGENT_NAME               # Pangalan na ipinapakita ng ahente
AZURE_EXISTING_AGENT_ID           # Gamitin ang umiiral na ahente (opsyonal)
```

### 3.3 Toggle ng Tampok
```bash title="" linenums="0"
# Opsyonal na Mga Serbisyo
USE_APPLICATION_INSIGHTS         # Paunang halaga: true
USE_AZURE_AI_SEARCH_SERVICE      # Paunang halaga: false
USE_CONTAINER_REGISTRY           # Paunang halaga: true

# Pagmamanman at Pagsusubaybay
ENABLE_AZURE_MONITOR_TRACING     # Paunang halaga: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Paunang halaga: false

# Konfigurasyon ng Paghahanap
AZURE_AI_SEARCH_INDEX_NAME       # Pangalan ng indeks ng paghahanap
AZURE_SEARCH_SERVICE_NAME        # Pangalan ng serbisyo ng paghahanap
```

### 3.4 Konfigurasyon ng AI Project 
```bash title="" linenums="0"
# Gamitin ang mga umiiral na mapagkukunan
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Buong ID ng mapagkukunan ng umiiral na proyekto ng AI
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL ng endpoint ng umiiral na proyekto
```

### 3.5 Suriin ang Iyong Mga Variable

Gamitin ang Azure Developer CLI upang tingnan at pamahalaan ang iyong mga environment variable:

```bash title="" linenums="0"
# Tingnan ang lahat ng mga environment variable para sa kasalukuyang kapaligiran
azd env get-values

# Kunin ang isang tiyak na environment variable
azd env get-value AZURE_ENV_NAME

# Itakda ang isang environment variable
azd env set AZURE_LOCATION eastus

# Itakda ang maramihang variable mula sa .env file
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Paunawa:
Ang dokumentong ito ay isinalin gamit ang serbisyong pagsasalin na pinapagana ng AI na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman sinisikap naming maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o kawalan ng katumpakan. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na awtoritatibong pinagmumulan. Para sa mga mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasaling-tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na maaaring magmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->