# 4. Konfiga Template

!!! tip "BY THE END OF THIS MODULE YOU GO FIT"

    - [ ] Understand di purpose of `azure.yaml`
    - [ ] Understand di structure of `azure.yaml`
    - [ ] Understand di value of azd lifecycle `hooks`
    - [ ] **Lab 4:** Explore and change di environment variables

---

!!! prompt "Wetin de `azure.yaml` file dey do? Use codefence make you explain am line by line"

      The `azure.yaml` file na di **configuration file for Azure Developer CLI (azd)**. E dey define how your application suppose dey deployed to Azure, including infrastructure, services, deployment hooks, and environment variables.

---

## 1. Wetin E Dey Do & How E Dey Work

This `azure.yaml` file na di **deployment blueprint** for an AI agent application wey:

1. **Checks di environment** before deployment
2. **Provisions Azure AI services** (AI Hub, AI Project, Search, etc.)
3. **Deploys a Python application** to Azure Container Apps
4. **Configures AI models** for both chat and embedding functionality
5. **Sets up monitoring and tracing** for the AI application
6. **Handles both new and existing** Azure AI project scenarios

Di file make e possible to do **one-command deployment** (`azd up`) of a complete AI agent solution wit proper validation, provisioning, and post-deployment configuration.

??? info "Open to view: `azure.yaml`"

      Di `azure.yaml` file dey show how Azure Developer CLI go deploy and manage this AI Agent application for Azure. Make we break am down line-by-line.

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

## 2. Deconstruct di File

Make we go through di file section by section, to sabi wetin e dey do - and why.

### 2.1 **Header and Schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Line 1**: E provide YAML language server schema validation for IDE support and IntelliSense

### 2.2 Project Metadata (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Line 5**: E define di project name wey Azure Developer CLI go use
- **Lines 6-7**: E show say dis base on template version 1.0.2
- **Lines 8-9**: Na require say Azure Developer CLI version 1.14.0 or pass

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

- **Lines 11-20**: **Pre-deployment hook** - e dey run before `azd up`

      - On Unix/Linux: E make validation script executable and run am
      - On Windows: E run PowerShell validation script
      - Both dem interactive and dem go stop deployment if dem fail

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
- **Lines 21-30**: **Post-provision hook** - e dey run after Azure resources don create

  - E run environment variable writing scripts
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
- **Lines 31-40**: **Post-deploy hook** - e dey run after application deployment

  - E run final setup scripts
  - E go continue even if scripts fail

### 2.4 Service Config (41-48)

This configures di application service wey you dey deploy.

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
- **Line 44**: E talk say na Python di programming language
- **Line 45**: E use Azure Container Apps as di hosting platform
- **Lines 46-48**: Docker configuration

      - E use "api_and_frontend" as di image name
      - E build di Docker image remotely in Azure (no local)

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

This section define environment variables wey dem dey use **during deployment**, dem arrange dem by category:

- **Azure Resource Names (Lines 51-60)**:
      - Core Azure service resource names like Resource Group, AI Hub, AI Project, etc.- 
- **Feature Flags (Lines 61-63)**:
      - Boolean variables wey dey enable/disable specific Azure services
- **AI Agent Configuration (Lines 64-71)**:
      - Configuration for main AI agent including name, ID, deployment settings, model details- 
- **AI Embedding Configuration (Lines 72-79)**:
      - Configuration for the embedding model wey dem dey use for vector search
- **Search and Monitoring (Lines 80-84)**:
      - Search index name, existing resource IDs, and monitoring/tracing settings

---

## 3. Know di Env Variables
Di environment variables wey follow dey control how your deployment go configure and how e go behave, dem arrange dem by wetin dem main purpose be. Most variables get normal defaults, but you fit customize dem to match your own requirements or existing Azure resources.

### 3.1 Required Variables 

```bash title="" linenums="0"
# Main Azure konfig
AZURE_ENV_NAME                    # Environment name (dem go use am to name resources)
AZURE_LOCATION                    # Region wey dem go deploy
AZURE_SUBSCRIPTION_ID             # Subscription wey dem target
AZURE_RESOURCE_GROUP              # Name wey resource group go carry
AZURE_PRINCIPAL_ID                # User principal wey dem go use for RBAC

# Resource names (dem go auto-generate if you no specify)
AZURE_AIHUB_NAME                  # Name wey Microsoft Foundry hub go carry
AZURE_AIPROJECT_NAME              # Name wey AI project go carry
AZURE_AISERVICES_NAME             # Name wey AI services account go carry
AZURE_STORAGE_ACCOUNT_NAME        # Name wey storage account go carry
AZURE_CONTAINER_REGISTRY_NAME     # Name wey container registry go carry
AZURE_KEYVAULT_NAME               # Key Vault name (if dem use am)
```

### 3.2 Model Configuration 
```bash title="" linenums="0"
# Chat model konfigureshon
AZURE_AI_AGENT_MODEL_NAME         # Di default: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Di default: OpenAI (oba Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Di default: di latest wey dey available
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Name wey dem use deploy di chat model
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Di default: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Di default: 80 (thousands of TPM)

# Embedding model konfigureshon
AZURE_AI_EMBED_MODEL_NAME         # Di default: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Di default: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Di default: di latest wey dey available
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Name wey dem use deploy di embeddings
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Di default: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Di default: 50 (thousands of TPM)

# Agent konfigureshon
AZURE_AI_AGENT_NAME               # Name wey agent go show
AZURE_EXISTING_AGENT_ID           # Use di agent wey don already dey (na optional)
```

### 3.3 Feature Toggle
```bash title="" linenums="0"
# Sabis wey no compulsory
USE_APPLICATION_INSIGHTS         # As e dey set: on
USE_AZURE_AI_SEARCH_SERVICE      # As e dey set: off
USE_CONTAINER_REGISTRY           # As e dey set: on

# Monitorin an Tracin
ENABLE_AZURE_MONITOR_TRACING     # As e dey set: off
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # As e dey set: off

# Search konfigureshon
AZURE_AI_SEARCH_INDEX_NAME       # Name wey search index go get
AZURE_SEARCH_SERVICE_NAME        # Name wey search service go get
```

### 3.4 AI Project Configuration 
```bash title="" linenums="0"
# Use di resources wey don already dey
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Di full resource ID for di AI project wey don already dey
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Di endpoint URL for di project wey don already dey
```

### 3.5 Check Your Variables

Use di Azure Developer CLI to view and manage your environment variables:

```bash title="" linenums="0"
# See all di environment variables wey dey for di current environment
azd env get-values

# Find one specific environment variable wey you want
azd env get-value AZURE_ENV_NAME

# Put one environment variable
azd env set AZURE_LOCATION eastus

# Put plenty variables wey dey inside .env file
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Disclaimer:
Dis dokument don translate wit AI translation service (Co-op Translator: https://github.com/Azure/co-op-translator). Even though we dey try make am correct, abeg note say automated translations fit get mistakes or no too accurate. Di original dokument for im original language suppose be di authoritative source. If na serious or important info, make professional human translator do am. We no dey liable for any misunderstanding or wrong interpretation wey fit come from this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->