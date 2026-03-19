# 4. I-configure ang Template

!!! tip "SA PAGTATAPOS NG MODULONG ITO MAKAKAYA MO"

    - [ ] Maunawaan ang layunin ng `azure.yaml`
    - [ ] Maunawaan ang istruktura ng `azure.yaml`
    - [ ] Maunawaan ang kahalagahan ng azd lifecycle na `hooks`
    - [ ] **Lab 4:** Siyasatin at baguhin ang mga environment variables

---

!!! prompt "Ano ang ginagawa ng `azure.yaml` file? Gumamit ng codefence at ipaliwanag ito linya-linya"

      Ang `azure.yaml` file ay ang **configuration file para sa Azure Developer CLI (azd)**. Tinutukoy nito kung paano dapat i-deploy ang iyong aplikasyon sa Azure, kabilang ang imprastruktura, mga serbisyo, deployment hooks, at mga environment variable.

---

## 1. Layunin at Pag-andar

Ang `azure.yaml` file na ito ay nagsisilbing ang **deployment blueprint** para sa isang AI agent application na:

1. **Sinusuri ang kapaligiran** bago ang deployment
2. **Nagpo-provision ng Azure AI services** (AI Hub, AI Project, Search, atbp.)
3. **Nagde-deploy ng Python application** sa Azure Container Apps
4. **Nagko-configure ng mga AI model** para sa parehong chat at embedding na functionality
5. **Nagsasaayos ng monitoring at tracing** para sa AI application
6. **Hinahandle ang parehong bagong at umiiral na** mga senaryo ng Azure AI project

Pinapayagan ng file na ito ang **one-command deployment** (`azd up`) ng isang kumpletong solusyon ng AI agent na may angkop na validation, provisioning, at post-deployment na konfigurasyon.

??? info "Palawakin upang Tingnan: `azure.yaml`"

      Ang `azure.yaml` file ay tumutukoy kung paano i-deploy at pamahalaan ng Azure Developer CLI ang AI Agent application na ito sa Azure. Hatiin natin ito linya-linya.

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

## 2. Pagsusuri ng File

Dadaan tayo sa bawat seksyon ng file, upang maunawaan kung ano ang ginagawa nito - at bakit.

### 2.1 **Header at Schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Line 1**: Nagbibigay ng schema validation para sa YAML language server para sa suporta ng IDE at IntelliSense

### 2.2 Metadata ng Proyekto (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Line 5**: Tinutukoy ang pangalan ng proyekto na ginagamit ng Azure Developer CLI
- **Lines 6-7**: Tinutukoy na ito ay batay sa isang template bersyon 1.0.2
- **Lines 8-9**: Nangangailangan ng Azure Developer CLI bersyon 1.14.0 o mas mataas

### 2.3 Mga Deploy Hook (11-40)

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

- **Lines 11-20**: **Pre-deployment hook** - tumatakbo bago `azd up`

      - On Unix/Linux: Ginagawang executable ang validation script at pinapatakbo ito
      - On Windows: Pinapatakbo ang PowerShell validation script
      - Pareho itong interactive at hihinto ang deployment kung mag-fail

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
- **Lines 21-30**: **Post-provision hook** - tumatakbo pagkatapos malikha ang mga Azure resources

  - Nagpapatakbo ng mga script para isulat ang mga environment variable
  - Ipinagpapatuloy ang deployment kahit mabigo ang mga script na ito (`continueOnError: true`)

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
- **Lines 31-40**: **Post-deploy hook** - tumatakbo pagkatapos ng deployment ng aplikasyon

  - Isinasagawa ang panghuling mga setup script
  - Ipinagpapatuloy kahit mabigo ang mga script

### 2.4 Konfig ng Serbisyo (41-48)

Ina-configure nito ang serbisyo ng aplikasyon na ide-deploy mo.

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

- **Line 42**: Tinutukoy ang serbisyong pinangalanang "api_and_frontend"
- **Line 43**: Tumuturo sa `./src` na direktoryo para sa source code
- **Line 44**: Tinutukoy ang Python bilang programming language
- **Line 45**: Gumagamit ng Azure Container Apps bilang hosting platform
- **Lines 46-48**: Konfigurasyon ng Docker

      - Gumagamit ng "api_and_frontend" bilang pangalan ng imahe
      - Binubuo ang Docker image nang remote sa Azure (hindi lokalmente)

### 2.5 Mga Pipeline Variable (49-76)

Ito ang mga variable na tutulong sa iyong patakbuhin ang `azd` sa CI/CD pipelines para sa automation

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

Dinidefine ng seksyong ito ang mga environment variable na ginagamit **habang nagde-deploy**, inayos ayon sa kategorya:

- **Mga Pangalan ng Azure Resource (Lines 51-60)**:
      - Pangunahing pangalan ng Azure service resources hal., Resource Group, AI Hub, AI Project, atbp.- 
- **Mga Feature Flag (Lines 61-63)**:
      - Mga boolean na variable para i-enable o i-disable ang mga partikular na Azure service
- **Konfigurasyon ng AI Agent (Lines 64-71)**:
      - Konfigurasyon para sa pangunahing AI agent kasama ang pangalan, ID, mga setting ng deployment, detalye ng model- 
- **Konfigurasyon ng AI Embedding (Lines 72-79)**:
      - Konfigurasyon para sa embedding model na ginagamit para sa vector search
- **Search at Monitoring (Lines 80-84)**:
      - Pangalan ng search index, umiiral na resource IDs, at mga setting para sa monitoring/tracing

---

## 3. Kilalanin ang mga Env Variable
Ang mga sumusunod na environment variable ang kumokontrol sa konfigurasyon at pag-uugali ng iyong deployment, inayos ayon sa kanilang pangunahing layunin. Karamihan sa mga variable ay may makatwirang default, ngunit maaari mo silang i-customize upang tumugma sa iyong partikular na mga kinakailangan o umiiral na Azure resources.

### 3.1 Mga Kinakailangang Variable 

```bash title="" linenums="0"
# Pangunahing konfigurasyon ng Azure
AZURE_ENV_NAME                    # Pangalan ng kapaligiran (ginagamit sa pagbibigay ng pangalan sa mga resource)
AZURE_LOCATION                    # Rehiyon ng pag-deploy
AZURE_SUBSCRIPTION_ID             # Target na subscription
AZURE_RESOURCE_GROUP              # Pangalan ng resource group
AZURE_PRINCIPAL_ID                # Prinsipal ng gumagamit para sa RBAC

# Pangalan ng mga resource (awtomatikong gagawin kung hindi tinukoy)
AZURE_AIHUB_NAME                  # Pangalan ng hub ng Microsoft Foundry
AZURE_AIPROJECT_NAME              # Pangalan ng proyekto ng AI
AZURE_AISERVICES_NAME             # Pangalan ng account ng mga serbisyo ng AI
AZURE_STORAGE_ACCOUNT_NAME        # Pangalan ng storage account
AZURE_CONTAINER_REGISTRY_NAME     # Pangalan ng container registry
AZURE_KEYVAULT_NAME               # Pangalan ng Key Vault (kung ginagamit)
```

### 3.2 Konfigurasyon ng Modelo 
```bash title="" linenums="0"
# Konfigurasyon ng Modelong Chat
AZURE_AI_AGENT_MODEL_NAME         # Default: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Default: OpenAI (o Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Default: pinakabagong magagamit
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Pangalan ng deployment para sa modelong chat
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Default: 80 (libo-libong TPM)

# Konfigurasyon ng Modelong Embedding
AZURE_AI_EMBED_MODEL_NAME         # Default: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Default: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Default: pinakabagong magagamit
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Pangalan ng deployment para sa mga embedding
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Default: 50 (libo-libong TPM)

# Konfigurasyon ng Ahente
AZURE_AI_AGENT_NAME               # Ipinapakitang pangalan ng ahente
AZURE_EXISTING_AGENT_ID           # Gumamit ng umiiral na ahente (opsyonal)
```

### 3.3 Pag-toggle ng Tampok
```bash title="" linenums="0"
# Mga Opsyonal na Serbisyo
USE_APPLICATION_INSIGHTS         # Default: true
USE_AZURE_AI_SEARCH_SERVICE      # Default: false
USE_CONTAINER_REGISTRY           # Default: true

# Pagmamanman at Pagsubaybay
ENABLE_AZURE_MONITOR_TRACING     # Default: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Default: false

# Kumpigurasyon ng Paghahanap
AZURE_AI_SEARCH_INDEX_NAME       # Pangalan ng indeks ng paghahanap
AZURE_SEARCH_SERVICE_NAME        # Pangalan ng serbisyo ng paghahanap
```

### 3.4 Konfigurasyon ng AI Project 
```bash title="" linenums="0"
# Gamitin ang Umiiral na Mga Mapagkukunan
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Buong resource ID ng umiiral na proyektong AI
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL ng endpoint ng umiiral na proyekto
```

### 3.5 Suriin ang Iyong Mga Variable

Gamitin ang Azure Developer CLI upang tingnan at pamahalaan ang iyong mga environment variable:

```bash title="" linenums="0"
# Tingnan ang lahat ng environment variable para sa kasalukuyang kapaligiran
azd env get-values

# Kunin ang isang tiyak na environment variable
azd env get-value AZURE_ENV_NAME

# Itakda ang isang environment variable
azd env set AZURE_LOCATION eastus

# Itakda ang maramihang mga variable mula sa isang .env na file
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi tumpak na impormasyon. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pinagmumulan ng awtoridad. Para sa mga kritikal na impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->