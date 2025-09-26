<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b4a16f82d68f5820d574acd8946843e4",
  "translation_date": "2025-09-24T23:41:03+00:00",
  "source_file": "workshop/docs/instructions/4-Configure-AI-Template.md",
  "language_code": "tl"
}
-->
# 4. I-configure ang Template

!!! tip "SA DULO NG MODULONG ITO, MAGAGAWA MO NA ANG SUMUSUNOD"

    - [ ] Naiintindihan ang layunin ng `azure.yaml`
    - [ ] Naiintindihan ang istruktura ng `azure.yaml`
    - [ ] Naiintindihan ang halaga ng azd lifecycle `hooks`
    - [ ] **Lab 3:** 

---

!!! prompt "Ano ang ginagawa ng `azure.yaml` file? Gumamit ng codefence at ipaliwanag ito linya sa linya"

      Ang `azure.yaml` file ay ang **configuration file para sa Azure Developer CLI (azd)**. Tinutukoy nito kung paano dapat i-deploy ang iyong application sa Azure, kabilang ang infrastructure, mga serbisyo, deployment hooks, at environment variables.

---

## 1. Layunin at Functionality

Ang `azure.yaml` file ay nagsisilbing **deployment blueprint** para sa isang AI agent application na:

1. **Nagva-validate ng environment** bago ang deployment
2. **Nagpo-provision ng Azure AI services** (AI Hub, AI Project, Search, atbp.)
3. **Nagde-deploy ng Python application** sa Azure Container Apps
4. **Nagko-configure ng AI models** para sa chat at embedding functionality
5. **Nagse-set up ng monitoring at tracing** para sa AI application
6. **Nagha-handle ng parehong bago at umiiral na** Azure AI project scenarios

Pinapadali ng file ang **one-command deployment** (`azd up`) ng isang kumpletong AI agent solution na may tamang validation, provisioning, at post-deployment configuration.

??? info "I-expand Para Makita: `azure.yaml`"

      Ang `azure.yaml` file ay tumutukoy kung paano dapat i-deploy at i-manage ng Azure Developer CLI ang AI Agent application na ito sa Azure. Tingnan natin ito linya-linya.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: kailangan ba natin ng hooks? 
      # TODO: kailangan ba natin ang lahat ng variables?

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

## 2. Pag-unawa sa File

Tingnan natin ang file section by section, upang maunawaan kung ano ang ginagawa nito - at bakit.

### 2.1 **Header at Schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Linya 1**: Nagbibigay ng YAML language server schema validation para sa IDE support at IntelliSense

### 2.2 Metadata ng Project (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Linya 5**: Tinutukoy ang pangalan ng proyekto na ginagamit ng Azure Developer CLI
- **Mga Linya 6-7**: Tinutukoy na ito ay batay sa template version 1.0.2
- **Mga Linya 8-9**: Nangangailangan ng Azure Developer CLI version 1.14.0 o mas mataas

### 2.3 Deploy Hooks (11-40)

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

- **Mga Linya 11-20**: **Pre-deployment hook** - tumatakbo bago ang `azd up`

      - Sa Unix/Linux: Ginagawang executable ang validation script at pinapatakbo ito
      - Sa Windows: Pinapatakbo ang PowerShell validation script
      - Parehong interactive at hihinto ang deployment kung mag-fail

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
- **Mga Linya 21-30**: **Post-provision hook** - tumatakbo pagkatapos malikha ang mga Azure resources

  - Pinapatakbo ang mga script para sa pagsusulat ng environment variables
  - Ipinagpapatuloy ang deployment kahit mag-fail ang mga script (`continueOnError: true`)

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
- **Mga Linya 31-40**: **Post-deploy hook** - tumatakbo pagkatapos ng application deployment

  - Pinapatakbo ang mga final setup scripts
  - Ipinagpapatuloy kahit mag-fail ang mga script

### 2.4 Service Config (41-48)

Ito ang nagko-configure sa application service na iyong ide-deploy.

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

- **Linya 42**: Tinutukoy ang isang serbisyo na pinangalanang "api_and_frontend"
- **Linya 43**: Itinuturo ang `./src` directory para sa source code
- **Linya 44**: Tinutukoy ang Python bilang programming language
- **Linya 45**: Ginagamit ang Azure Container Apps bilang hosting platform
- **Mga Linya 46-48**: Docker configuration

      - Ginagamit ang "api_and_frontend" bilang pangalan ng image
      - Binubuo ang Docker image remotely sa Azure (hindi locally)

### 2.5 Pipeline Variables (49-76)

Ito ang mga variables na tumutulong sa pagtakbo ng `azd` sa CI/CD pipelines para sa automation

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

Ang seksyong ito ay tumutukoy sa environment variables na ginagamit **sa panahon ng deployment**, na nakaayos ayon sa kategorya:

- **Azure Resource Names (Mga Linya 51-60)**:
      - Mga pangunahing pangalan ng Azure service resources tulad ng Resource Group, AI Hub, AI Project, atbp.- 
- **Feature Flags (Mga Linya 61-63)**:
      - Boolean variables para i-enable/disable ang partikular na Azure services
- **AI Agent Configuration (Mga Linya 64-71)**:
      - Configuration para sa pangunahing AI agent kabilang ang pangalan, ID, deployment settings, model details- 
- **AI Embedding Configuration (Mga Linya 72-79)**:
      - Configuration para sa embedding model na ginagamit para sa vector search
- **Search at Monitoring (Mga Linya 80-84)**:
      - Pangalan ng search index, umiiral na resource IDs, at monitoring/tracing settings

---

## 3. Alamin ang Env Variables
Ang mga sumusunod na environment variables ang nagkokontrol sa configuration at behavior ng iyong deployment, na nakaayos ayon sa kanilang pangunahing layunin. Karamihan sa mga variables ay may sensible defaults, ngunit maaari mo itong i-customize upang tumugma sa iyong partikular na pangangailangan o umiiral na Azure resources.

### 3.1 Mga Kinakailangang Variables 

```bash title="" linenums="0"
# Core Azure Configuration
AZURE_ENV_NAME                    # Environment name (used in resource naming)
AZURE_LOCATION                    # Deployment region
AZURE_SUBSCRIPTION_ID             # Target subscription
AZURE_RESOURCE_GROUP              # Resource group name
AZURE_PRINCIPAL_ID                # User principal for RBAC

# Resource Names (Auto-generated if not specified)
AZURE_AIHUB_NAME                  # AI Foundry hub name
AZURE_AIPROJECT_NAME              # AI project name
AZURE_AISERVICES_NAME             # AI services account name
AZURE_STORAGE_ACCOUNT_NAME        # Storage account name
AZURE_CONTAINER_REGISTRY_NAME     # Container registry name
AZURE_KEYVAULT_NAME               # Key Vault name (if used)
```

### 3.2 Model Configuration 
```bash title="" linenums="0"
# Chat Model Configuration
AZURE_AI_AGENT_MODEL_NAME         # Default: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Default: OpenAI (or Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Default: latest available
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Deployment name for chat model
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Default: 80 (thousands of TPM)

# Embedding Model Configuration  
AZURE_AI_EMBED_MODEL_NAME         # Default: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Default: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Default: latest available
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Deployment name for embeddings
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Default: 50 (thousands of TPM)

# Agent Configuration
AZURE_AI_AGENT_NAME               # Agent display name
AZURE_EXISTING_AGENT_ID           # Use existing agent (optional)
```

### 3.3 Feature Toggle
```bash title="" linenums="0"
# Optional Services
USE_APPLICATION_INSIGHTS         # Default: true
USE_AZURE_AI_SEARCH_SERVICE      # Default: false
USE_CONTAINER_REGISTRY           # Default: true

# Monitoring and Tracing
ENABLE_AZURE_MONITOR_TRACING     # Default: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Default: false

# Search Configuration
AZURE_AI_SEARCH_INDEX_NAME       # Search index name
AZURE_SEARCH_SERVICE_NAME        # Search service name
```

### 3.4 AI Project Configuration 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 I-check ang Iyong Variables

Gamitin ang Azure Developer CLI upang tingnan at i-manage ang iyong environment variables:

```bash title="" linenums="0"
# View all environment variables for current environment
azd env get-values

# Get a specific environment variable
azd env get-value AZURE_ENV_NAME

# Set an environment variable
azd env set AZURE_LOCATION eastus

# Set multiple variables from a .env file
azd env set --from-file .env
```

---

