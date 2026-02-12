# 4. Configure a Template

!!! tip "BY THE END OF THIS MODULE YOU GO FIT DO"

    - [ ] Understand wetin `azure.yaml` dey do
    - [ ] Understand di structure of `azure.yaml`
    - [ ] Understand di value of azd lifecycle `hooks`
    - [ ] **Lab 4:** Make una explore and change environment variables

---

!!! prompt "Wetinde di `azure.yaml` file dey do? Use codefence make you explain am line by line"

      The `azure.yaml` file na di **configuration file for Azure Developer CLI (azd)**. E dey define how your application suppose deploy to Azure, including infrastructure, services, deployment hooks, and environment variables.

---

## 1. Purpose and Functionality

This `azure.yaml` file serve as di **deployment blueprint** for an AI agent application wey:

1. **Checks di environment** before deployment
2. **Sets up Azure AI services** (AI Hub, AI Project, Search, etc.)
3. **Deploys a Python application** to Azure Container Apps
4. **Configures AI models** for both chat and embedding functionality
5. **Sets up monitoring and tracing** for the AI application
6. **Handles both new and existing** Azure AI project scenarios

The file make e possible to do **one-command deployment** (`azd up`) of full AI agent solution wit proper validation, provisioning, and post-deployment configuration.

??? info "Expand To View: `azure.yaml`"

      The `azure.yaml` file dey explain how Azure Developer CLI go deploy and manage this AI Agent application for Azure. Make we break am down line-by-line.

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

## 2. Deconstructing The File

Make we go through di file section by section, so you fit sabi wetin e dey do - and why.

### 2.1 **Header and Schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Line 1**: E dey provide YAML language server schema validation make IDE get support and IntelliSense

### 2.2 Project Metadata (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Line 5**: E define di project name wey Azure Developer CLI dey use
- **Lines 6-7**: E show say this one base on template version 1.0.2
- **Lines 8-9**: E require Azure Developer CLI version 1.14.0 or higher

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

- **Lines 11-20**: **Pre-deployment hook** - dey run before `azd up`

      - For Unix/Linux: E make validation script executable and den run am
      - For Windows: E run PowerShell validation script
      - Both dey interactive and deployment go stop if dem fail

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
- **Lines 21-30**: **Post-provision hook** - dey run after Azure resources don create

  - E run scripts wey write environment variables
  - E go continue deployment even if these scripts fail (`continueOnError: true`)

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
- **Lines 31-40**: **Post-deploy hook** - dey run after application don deploy

  - E run final setup scripts
  - E go continue even if scripts fail

### 2.4 Service Config (41-48)

This one dey configure di application service wey you dey deploy.

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

- **Line 42**: E define service wey dem name "api_and_frontend"
- **Line 43**: E point to di `./src` directory for source code
- **Line 44**: E show say language na Python
- **Line 45**: E use Azure Container Apps as di hosting platform
- **Lines 46-48**: Docker configuration

      - E use "api_and_frontend" as di image name
      - E build di Docker image remotely for Azure (no build am locally)

### 2.5 Pipeline Variables (49-76)

These na variables wey go help you run `azd` for CI/CD pipelines for automation

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

This section define environment variables wey dem dey use **during deployment**, dem organize dem by category:

- **Azure Resource Names (Lines 51-60)**:
      - Core Azure service resource names e.g, Resource Group, AI Hub, AI Project, etc. 
- **Feature Flags (Lines 61-63)**:
      - Boolean variables wey fit enable/disable specific Azure services
- **AI Agent Configuration (Lines 64-71)**:
      - Configuration for main AI agent including name, ID, deployment settings, model details 
- **AI Embedding Configuration (Lines 72-79)**:
      - Configuration for di embedding model wey dem dey use for vector search
- **Search and Monitoring (Lines 80-84)**:
      - Search index name, existing resource IDs, and monitoring/tracing settings

---

## 3. Know Env Variables
Di environment variables wey follow control how your deployment go behave and di configuration, dem organize dem by their main purpose. Most variables get sensible defaults, but you fit change dem to match your own requirements or existing Azure resources.

### 3.1 Required Variables 

```bash title="" linenums="0"
# Main Azure konfigureshon
AZURE_ENV_NAME                    # Environment name (dem dey use am for resource naming)
AZURE_LOCATION                    # Region wey dem go deploy to
AZURE_SUBSCRIPTION_ID             # Di subscription we dey target
AZURE_RESOURCE_GROUP              # Di resource group name
AZURE_PRINCIPAL_ID                # User principal wey RBAC go use

# Resource names (dem go auto-generate if you no specify)
AZURE_AIHUB_NAME                  # Di Microsoft Foundry hub name
AZURE_AIPROJECT_NAME              # Di AI project name
AZURE_AISERVICES_NAME             # Di AI services account name
AZURE_STORAGE_ACCOUNT_NAME        # Di storage account name
AZURE_CONTAINER_REGISTRY_NAME     # Di container registry name
AZURE_KEYVAULT_NAME               # Key Vault name (if dem use am)
```

### 3.2 Model Configuration 
```bash title="" linenums="0"
# Chat model konfigureshon
AZURE_AI_AGENT_MODEL_NAME         # Di default: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Di default: OpenAI (or Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Di default: di latest we dey available
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Name we dem use deploy chat model
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Di default: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Di default: 80 (thousands of TPM)

# Embedding model konfigureshon
AZURE_AI_EMBED_MODEL_NAME         # Di default: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Di default: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Di default: di latest we dey available
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Name we dem use deploy embeddings
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Di default: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Di default: 50 (thousands of TPM)

# Agent konfigureshon
AZURE_AI_AGENT_NAME               # Name we agent go show
AZURE_EXISTING_AGENT_ID           # Use agent we don get (optional)
```

### 3.3 Feature Toggle
```bash title="" linenums="0"
# Services wey you fit choose
USE_APPLICATION_INSIGHTS         # As e dey by default: true
USE_AZURE_AI_SEARCH_SERVICE      # As e dey by default: false
USE_CONTAINER_REGISTRY           # As e dey by default: true

# Dey monitor and dey trace
ENABLE_AZURE_MONITOR_TRACING     # As e dey by default: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # As e dey by default: false

# Settings wey dey for search
AZURE_AI_SEARCH_INDEX_NAME       # Name wey search index get
AZURE_SEARCH_SERVICE_NAME        # Name wey search service get
```

### 3.4 AI Project Configuration 
```bash title="" linenums="0"
# Use di resources wey don dey
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Di full resource ID for di AI project wey don dey
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Di endpoint URL for di project wey don dey
```

### 3.5 Check Your Variables

Use Azure Developer CLI to view and manage your environment variables:

```bash title="" linenums="0"
# See all di environment variables wey dey dis environment
azd env get-values

# Get one particular environment variable wey you want
azd env get-value AZURE_ENV_NAME

# Put one environment variable
azd env set AZURE_LOCATION eastus

# Put plenty environment variables from di .env file
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Disclaimer:
Dis document na translation wey an AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator) do. Even though we dey try make am correct, abeg sabi say automatic translations fit get mistakes or no too accurate. Di original document for im native language na di correct authority. If na important information, make you use professional human translator. We no dey liable for any misunderstanding or misinterpretation wey fit come from dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->