# 4. ਟੈਂਪਲੇਟ ਨੂੰ ਸੰਰਚਿਤ ਕਰੋ

!!! tip "ਇਸ ਮੋਡੀਊਲ ਦੇ ਅੰਤ ਤੱਕ ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ"

    - [ ] `azure.yaml` ਦਾ ਉਦੇਸ਼ ਸਮਝੋ
    - [ ] `azure.yaml` ਦੀ ਬਣਤਰ ਸਮਝੋ
    - [ ] azd lifecycle `hooks` ਦਾ ਮਹੱਤਵ ਸਮਝੋ
    - [ ] **Lab 4:** ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਦੀ ਜਾਂਚ ਅਤੇ ਸੋਧ ਕਰੋ

---

!!! prompt "`azure.yaml` ਫਾਈਲ ਕੀ ਕਰਦੀ ਹੈ? ਇੱਕ ਕੋਡ ਫੈਂਸ ਵਰਤੋਂ ਅਤੇ ਲਾਈਨ-ਦਰ-ਲਾਈਨ ਸਮਝਾਓ"

      The `azure.yaml` file is the **configuration file for Azure Developer CLI (azd)**. It defines how your application should be deployed to Azure, including infrastructure, services, deployment hooks, and environment variables.

---

## 1. ਉਦੇਸ਼ ਅਤੇ ਕਾਰਕਿਰਦਗੀ

This `azure.yaml` file serves as the **deployment blueprint** for an AI agent application that:

1. **Deploy ਤੋਂ ਪਹਿਲਾਂ ਵਾਤਾਵਰਣ ਨੂੰ ਵੈਧ ਕਰਦਾ ਹੈ**
2. **Azure AI ਸੇਵਾਵਾਂ ਨੂੰ ਪ੍ਰੋਵਿਜਨ ਕਰਦਾ ਹੈ** (AI Hub, AI Project, Search, ਆਦਿ)
3. **ਇੱਕ Python ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ Azure Container Apps ਤੇ ਡਿਪਲੋਇ ਕਰਦਾ ਹੈ**
4. **ਚੈਟ ਅਤੇ ਐਮਬੈੱਡਿੰਗ ਕਾਰਜਕੁਸ਼ਲਤਾ ਲਈ AI ਮਾਡਲਾਂ ਦੀ ਸੰਰਚਨਾ ਕਰਦਾ ਹੈ**
5. **AI ਐਪਲੀਕੇਸ਼ਨ ਲਈ ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਟਰੇਸਿੰਗ ਸੈਟਅੱਪ ਕਰਦਾ ਹੈ**
6. **ਨਵੇਂ ਅਤੇ ਮੌਜੂਦਾ ਦੋਹਾਂ Azure AI ਪ੍ਰੋਜੈਕਟ ਸਥਿਤੀਆਂ ਨੂੰ ਨਿਭਾ ਲੈਂਦਾ ਹੈ**

The file enables **one-command deployment** (`azd up`) of a complete AI agent solution with proper validation, provisioning, and post-deployment configuration.

??? info "ਖੋਲ੍ਹ ਕੇ ਵੇਖੋ: `azure.yaml`"

      The `azure.yaml` file defines how Azure Developer CLI should deploy and manage this AI Agent application in Azure. Let's break it down line-by-line.

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

## 2. ਫਾਈਲ ਦਾ ਵਿਖੰਡਨ

Let's go through the file section by section, to understand what it does - and why.

### 2.1 **ਹੈਡਰ ਅਤੇ ਸਕੀਮਾ (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Line 1**: IDE ਸਹਾਇਤਾ ਅਤੇ IntelliSense ਲਈ YAML ਭਾਸ਼ਾ ਸਰਵਰ ਸਕੀਮਾ ਵੈਧਤਾ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ

### 2.2 ਪ੍ਰੋਜੈਕਟ ਮੈਟਾਡੇਟਾ (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Line 5**: Azure Developer CLI ਵਲੋਂ ਵਰਤੇ ਜਾਣ ਵਾਲੇ ਪ੍ਰੋਜੈਕਟ ਦਾ ਨਾਮ ਪਰਿਭਾਸ਼ਿਤ ਕਰਦਾ ਹੈ
- **Lines 6-7**: ਦਰਸਾਉਂਦਾ ਹੈ ਕਿ ਇਹ ਟੈਂਪਲੇਟ ਵਰਜਨ 1.0.2 'ਤੇ ਆਧਾਰਿਤ ਹੈ
- **Lines 8-9**: Azure Developer CLI ਵਰਜਨ 1.14.0 ਜਾਂ ਇਸ ਤੋਂ ਉੱਪਰ ਦੀ ਲੋੜ ਹੈ

### 2.3 ਡਿਪਲੌਇ ਹੂਕਸ (11-40)

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

- **Lines 11-20**: **ਪ੍ਰੀ-ਡਿਪਲੌਇਮੈਂਟ ਹੂਕ** - `azd up` ਤੋਂ ਪਹਿਲਾਂ ਚਲਦਾ ਹੈ

      - Unix/Linux 'ਤੇ: ਵੈਰੀਏਬਲ ਵੈਧਤਾ ਸਕ੍ਰਿਪਟ ਨੂੰ ਐਕਜ਼ਿਕਿਊਟੇਬਲ ਬਣਾਉਂਦਾ ਹੈ ਅਤੇ ਚਲਾਉਂਦਾ ਹੈ
      - Windows 'ਤੇ: PowerShell ਵੈਧਤਾ ਸਕ੍ਰਿਪਟ ਚਲਾਉਂਦਾ ਹੈ
      - ਦੋਵਾਂ ਇੰਟਰਐਕਟਿਵ ਹਨ ਅਤੇ ਜੇਕਰ ਅਸਫਲ ਹੁੰਦੇ ਹਨ ਤਾਂ ਡਿਪਲੌਇਮੈਂਟ ਰੁਕ ਜਾਵੇਗਾ

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
- **Lines 21-30**: **ਪੋਸਟ-ਪ੍ਰੋਵੀਜ਼ਨ ਹੂਕ** - Azure ਰਿਸੋਸز ਬਣਨ ਤੋਂ ਬਾਅਦ ਚਲਦਾ ਹੈ

  - ਵਾਤਾਵਰਣ ਵੇਰੀਏਬਲ ਲਿਖਣ ਵਾਲੇ ਸਕ੍ਰਿਪਟਾਂ ਨੂੰ ਚਲਾਉਂਦਾ ਹੈ
  - ਜੇ ਇਹ ਸਕ੍ਰਿਪਟ ਅਸਫਲ ਹੋਣ ਤਾਂ ਵੀ ਡਿਪਲੌਇਮੈਂਟ ਜਾਰੀ ਰੱਖਦਾ ਹੈ (`continueOnError: true`)

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
- **Lines 31-40**: **ਪੋਸਟ-ਡਿਪਲੌਇ ਹੂਕ** - ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇ ਹੋਣ ਤੋਂ ਬਾਅਦ ਚਲਦਾ ਹੈ

  - ਅੰਤਿਮ ਸੈਟਅੱਪ ਸਕ੍ਰਿਪਟਾਂ ਨੂੰ ਚਲਾਉਂਦਾ ਹੈ
  - ਜੇਕਰ ਸਕ੍ਰਿਪਟਾਂ ਅਸਫਲ ਹੋ ਜਾਣ ਤਾਂ ਵੀ ਜਾਰੀ ਰੱਖਦਾ ਹੈ

### 2.4 ਸਰਵਿਸ ਸੰਰਚਨਾ (41-48)

This configures the application service you are deploying.

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

- **Line 42**: "api_and_frontend" ਨਾਮ ਦੀ ਇੱਕ ਸੇਵਾ ਦੀ ਪਰਿਭਾਸ਼ਾ ਕਰਦਾ ਹੈ
- **Line 43**: ਸਰੋਤ ਕੋਡ ਲਈ `./src` ਡਾਇਰੈਕਟਰੀ ਵੱਲ ਇਸ਼ਾਰਾ ਕਰਦਾ ਹੈ
- **Line 44**: ਪ੍ਰੋਗ੍ਰਾਮਿੰਗ ਭਾਸ਼ਾ ਵਜੋਂ Python ਦਰਸਾਉਂਦਾ ਹੈ
- **Line 45**: ਹੋਸਟਿੰਗ ਪਲੇਟਫਾਰਮ ਵਜੋਂ Azure Container Apps ਵਰਤਦਾ ਹੈ
- **Lines 46-48**: Docker ਸੰਰਚਨਾ

      - "api_and_frontend" ਨੂੰ ਇਮੇਜ ਨਾਮ ਵਜੋਂ ਵਰਤਦਾ ਹੈ
      - Docker ਇਮੇਜ ਨੂੰ ਦੂਰ-ਸਥਿਤ ਤੌਰ 'ਤੇ Azure ਵਿੱਚ ਬਿਲਡ ਕਰਦਾ ਹੈ (ਸਥਾਨਕ ਨਹੀਂ)

### 2.5 ਪਾਇਪਲਾਈਨ ਵੇਰੀਏਬਲ (49-76)

These are variables to help you run `azd` in CI/CD pipelines for automation

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

This section defines environment variables used **during deployment**, organized by category:

- **Azure Resource Names (Lines 51-60)**:
      - ਮੁੱਖ Azure ਸੇਵਾ ਰਿਸੋਸ ਨਾਮ ਜਿਵੇਂ Resource Group, AI Hub, AI Project, ਆਦਿ
- **Feature Flags (Lines 61-63)**:
      - ਖਾਸ Azure ਸੇਵਾਵਾਂ ਨੂੰ ਯੋਗ/ਅਯੋਗ ਕਰਨ ਲਈ ਬੂਲੀਅਨ ਵੇਰੀਏਬਲ
- **AI Agent Configuration (Lines 64-71)**:
      - ਮੁੱਖ AI ਏਜੰਟ ਲਈ ਸੰਰਚਨਾ ਜਿਵੇਂ ਨਾਮ, ID, ਡਿਪਲੌਇਮੈਂਟ ਸੈਟਿੰਗਜ਼, ਮਾਡਲ ਵੇਰਵੇ
- **AI Embedding Configuration (Lines 72-79)**:
      - ਵਿਕਟਰ ਸਰਚ ਲਈ ਵਰਤੀ ਜਾਣ ਵਾਲੀ ਐਮਬੈੱਡਿੰਗ ਮਾਡਲ ਦੀ ਸੰਰਚਨਾ
- **Search and Monitoring (Lines 80-84)**:
      - ਸਰਚ ਇੰਡੈਕਸ ਦਾ ਨਾਮ, ਮੌਜੂਦਾ ਰਿਸੋਸ ID, ਅਤੇ ਮਾਨੀਟਰਿੰਗ/ਟਰੇਸਿੰਗ ਸੈਟਿੰਗਜ਼

---

## 3. ਵਾਤਾਵਰਣ ਵੇਰੀਏਬਲ ਜਾਣੋ
The following environment variables control your deployment's configuration and behavior, organized by their primary purpose. Most variables have sensible defaults, but you can customize them to match your specific requirements or existing Azure resources.

### 3.1 Required Variables 

```bash title="" linenums="0"
# ਮੁੱਖ ਏਜ਼ਿਊਰ ਸੰਰਚਨਾ
AZURE_ENV_NAME                    # ਵਾਤਾਵਰਣ ਦਾ ਨਾਮ (ਰਿਸੋਰਸ ਨਾਂਕਰਨ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ)
AZURE_LOCATION                    # ਡਿਪਲੋਇਮੈਂਟ ਖੇਤਰ
AZURE_SUBSCRIPTION_ID             # ਨਿਸ਼ਾਨਾ ਸਬਸਕ੍ਰਿਪਸ਼ਨ
AZURE_RESOURCE_GROUP              # ਰਿਸੋਰਸ ਗਰੁੱਪ ਦਾ ਨਾਮ
AZURE_PRINCIPAL_ID                # RBAC ਲਈ ਯੂਜ਼ਰ ਪ੍ਰਿੰਸੀਪਲ

# ਰਿਸੋਰਸ ਨਾਮ (ਜੇ ਦਿੱਤੇ ਨਾ ਹੋਣ ਤਾਂ ਸਵੈਚਾਲਿਤ ਤੌਰ 'ਤੇ ਤਿਆਰ ਕੀਤੇ ਜਾਣਗੇ)
AZURE_AIHUB_NAME                  # ਮਾਇਕ੍ਰੋਸੌਫਟ ਫਾਊਂਡਰੀ ਹੱਬ ਦਾ ਨਾਮ
AZURE_AIPROJECT_NAME              # ਏਆਈ ਪ੍ਰੋਜੈਕਟ ਦਾ ਨਾਮ
AZURE_AISERVICES_NAME             # ਏਆਈ ਸੇਵਾਵਾਂ ਖਾਤੇ ਦਾ ਨਾਮ
AZURE_STORAGE_ACCOUNT_NAME        # ਸਟੋਰੇਜ ਖਾਤੇ ਦਾ ਨਾਮ
AZURE_CONTAINER_REGISTRY_NAME     # ਕੰਟੇਨਰ ਰਜਿਸਟਰੀ ਦਾ ਨਾਮ
AZURE_KEYVAULT_NAME               # ਕੀ ਵੌਲਟ ਦਾ ਨਾਮ (ਜੇ ਵਰਤਿਆ ਗਿਆ ਹੋਵੇ)
```

### 3.2 Model Configuration 
```bash title="" linenums="0"
# ਚੈਟ ਮਾਡਲ ਸੰਰਚਨਾ
AZURE_AI_AGENT_MODEL_NAME         # ਡਿਫਾਲਟ: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # ਡਿਫਾਲਟ: OpenAI (ਜਾਂ Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # ਡਿਫਾਲਟ: ਸਭ ਤੋਂ ਨਵਾਂ ਉਪਲਬਧ
AZURE_AI_AGENT_DEPLOYMENT_NAME    # ਚੈਟ ਮਾਡਲ ਲਈ ਡਿਪਲੋਇਮੈਂਟ ਦਾ ਨਾਮ
AZURE_AI_AGENT_DEPLOYMENT_SKU     # ਡਿਫਾਲਟ: ਮਿਆਰੀ
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # ਡਿਫਾਲਟ: 80 (ਹਜ਼ਾਰਾਂ TPM)

# ਐਮਬੈੱਡਿੰਗ ਮਾਡਲ ਸੰਰਚਨਾ
AZURE_AI_EMBED_MODEL_NAME         # ਡਿਫਾਲਟ: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # ਡਿਫਾਲਟ: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # ਡਿਫਾਲਟ: ਸਭ ਤੋਂ ਨਵਾਂ ਉਪਲਬਧ
AZURE_AI_EMBED_DEPLOYMENT_NAME    # ਐਮਬੈੱਡਿੰਗ ਲਈ ਡਿਪਲੋਇਮੈਂਟ ਦਾ ਨਾਮ
AZURE_AI_EMBED_DEPLOYMENT_SKU     # ਡਿਫਾਲਟ: ਮਿਆਰੀ
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # ਡਿਫਾਲਟ: 50 (ਹਜ਼ਾਰਾਂ TPM)

# ਏਜੰਟ ਸੰਰਚਨਾ
AZURE_AI_AGENT_NAME               # ਏਜੰਟ ਪ੍ਰਦਰਸ਼ਿਤ ਨਾਮ
AZURE_EXISTING_AGENT_ID           # ਮੌਜੂਦਾ ਏਜੰਟ ਵਰਤੋ (ਵਿਕਲਪਿਕ)
```

### 3.3 Feature Toggle
```bash title="" linenums="0"
# ਵਿਕਲਪਿਕ ਸੇਵਾਵਾਂ
USE_APPLICATION_INSIGHTS         # ਡਿਫਾਲਟ: ਸੱਚ
USE_AZURE_AI_SEARCH_SERVICE      # ਡਿਫਾਲਟ: ਝੂਠ
USE_CONTAINER_REGISTRY           # ਡਿਫਾਲਟ: ਸੱਚ

# ਨਿਗਰਾਨੀ ਅਤੇ ਟਰੇਸਿੰਗ
ENABLE_AZURE_MONITOR_TRACING     # ਡਿਫਾਲਟ: ਝੂਠ
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # ਡਿਫਾਲਟ: ਝੂਠ

# ਖੋਜ ਸੰਰਚਨਾ
AZURE_AI_SEARCH_INDEX_NAME       # ਖੋਜ ਇੰਡੈਕਸ ਦਾ ਨਾਮ
AZURE_SEARCH_SERVICE_NAME        # ਖੋਜ ਸੇਵਾ ਦਾ ਨਾਮ
```

### 3.4 AI Project Configuration 
```bash title="" linenums="0"
# ਮੌਜੂਦਾ ਸਰੋਤਾਂ ਦੀ ਵਰਤੋਂ ਕਰੋ
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # ਮੌਜੂਦਾ AI ਪ੍ਰੋਜੈਕਟ ਦਾ ਪੂਰਾ ਸਰੋਤ ID
AZURE_EXISTING_AIPROJECT_ENDPOINT       # ਮੌਜੂਦਾ ਪ੍ਰੋਜੈਕਟ ਦਾ ਐਂਡਪੌਇੰਟ URL
```

### 3.5 ਆਪਣੀਆਂ ਵੇਰੀਏਬਲ ਚੈੱਕ ਕਰੋ

Use the Azure Developer CLI to view and manage your environment variables:

```bash title="" linenums="0"
# ਮੌਜੂਦਾ ਮਾਹੌਲ ਦੀਆਂ ਸਾਰੀਆਂ ਵੈਰੀਏਬਲਾਂ ਵੇਖੋ
azd env get-values

# ਕਿਸੇ ਖਾਸ ਮਾਹੌਲ ਦੀ ਵੈਰੀਏਬਲ ਪ੍ਰਾਪਤ ਕਰੋ
azd env get-value AZURE_ENV_NAME

# ਇੱਕ ਮਾਹੌਲ ਦੀ ਵੈਰੀਏਬਲ ਸੈੱਟ ਕਰੋ
azd env set AZURE_LOCATION eastus

# .env ਫਾਇਲ ਤੋਂ ਕਈ ਵੈਰੀਏਬਲ ਸੈੱਟ ਕਰੋ
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ਅਸਵੀਕਾਰਨ:

ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ Co-op Translator (https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਪਰ ਕਿਰਪਾ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਪੂਰੀ ਤਰ੍ਹਾਂ ਸਹੀ ਨਾ ਹੋਣ ਦੀ ਸੰਭਾਵਨਾ ਹੋ ਸਕਦੀ ਹੈ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਪ੍ਰਮਾਣਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਉੱਪਜਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->