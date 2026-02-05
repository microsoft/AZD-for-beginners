# 4. ਟੈਂਪਲੇਟ ਕਨਫਿਗਰ ਕਰੋ

!!! tip "ਇਸ ਮੋਡਿਊਲ ਦੇ ਅੰਤ ਤੱਕ ਤੁਸੀਂ ਇਹ ਕਰਨ ਦੇ ਯੋਗ ਹੋਵੋਗੇ"

    - [ ] `azure.yaml` ਦਾ ਉਦੇਸ਼ ਸਮਝਿਆ
    - [ ] `azure.yaml` ਦੀ ਬਣਤਰ ਸਮਝੀ
    - [ ] azd lifecycle `hooks` ਦੀ ਮਹੱਤਤਾ ਸਮਝੀ
    - [ ] **ਲੈਬ 3:** 

---

!!! prompt "`azure.yaml` ਫਾਈਲ ਕੀ ਕਰਦੀ ਹੈ? ਇੱਕ ਕੋਡਫੈਂਸ ਵਰਤੋ ਅਤੇ ਇਸਨੂੰ ਲਾਈਨ-ਬਾਈ-ਲਾਈਨ ਸਮਝਾਓ"

      `azure.yaml` ਫਾਈਲ **Azure Developer CLI (azd)** ਲਈ ਕਨਫਿਗਰੇਸ਼ਨ ਫਾਈਲ ਹੈ। ਇਹ ਪਰਿਭਾਸ਼ਿਤ ਕਰਦੀ ਹੈ ਕਿ ਤੁਹਾਡੀ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ Azure 'ਤੇ ਕਿਵੇਂ ਡਿਪਲੌਇ ਕੀਤਾ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ, ਜਿਸ ਵਿੱਚ ਇੰਫਰਾਸਟਰਕਚਰ, ਸੇਵਾਵਾਂ, ਡਿਪਲੌਇਮੈਂਟ ਹੂਕਸ, ਅਤੇ ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਸ਼ਾਮਲ ਹਨ।

---

## 1. ਉਦੇਸ਼ ਅਤੇ ਕਾਰਜਸ਼ੀਲਤਾ

ਇਹ `azure.yaml` ਫਾਈਲ AI ਏਜੰਟ ਐਪਲੀਕੇਸ਼ਨ ਲਈ **ਡਿਪਲੌਇਮੈਂਟ ਬਲੂਪ੍ਰਿੰਟ** ਵਜੋਂ ਕੰਮ ਕਰਦੀ ਹੈ ਜੋ:

1. ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ **ਵਾਤਾਵਰਣ ਦੀ ਪੁਸ਼ਟੀ** ਕਰਦੀ ਹੈ
2. **Azure AI ਸੇਵਾਵਾਂ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰਦੀ ਹੈ** (AI Hub, AI Project, Search, ਆਦਿ)
3. **Python ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ Azure Container Apps 'ਤੇ ਡਿਪਲੌਇ ਕਰਦੀ ਹੈ**
4. **ਚੈਟ ਅਤੇ ਐਮਬੈਡਿੰਗ ਫੰਕਸ਼ਨਲਿਟੀ ਲਈ AI ਮਾਡਲ ਕਨਫਿਗਰ ਕਰਦੀ ਹੈ**
5. **AI ਐਪਲੀਕੇਸ਼ਨ ਲਈ ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਟ੍ਰੇਸਿੰਗ ਸੈਟਅਪ ਕਰਦੀ ਹੈ**
6. **ਨਵੇਂ ਅਤੇ ਮੌਜੂਦਾ** Azure AI ਪ੍ਰੋਜੈਕਟ ਸਥਿਤੀਆਂ ਨੂੰ ਸੰਭਾਲਦੀ ਹੈ

ਇਹ ਫਾਈਲ **ਇੱਕ ਕਮਾਂਡ ਡਿਪਲੌਇਮੈਂਟ** (`azd up`) ਨੂੰ ਯੋਗ ਬਣਾਉਂਦੀ ਹੈ, ਜਿਸ ਵਿੱਚ ਸਹੀ ਪੁਸ਼ਟੀ, ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ, ਅਤੇ ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਬਾਅਦ ਦੀ ਕਨਫਿਗਰੇਸ਼ਨ ਸ਼ਾਮਲ ਹੈ।

??? info "ਵੇਖਣ ਲਈ ਵਧਾਓ: `azure.yaml`"

      `azure.yaml` ਫਾਈਲ ਪਰਿਭਾਸ਼ਿਤ ਕਰਦੀ ਹੈ ਕਿ Azure Developer CLI ਨੂੰ ਇਸ AI Agent ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ Azure 'ਤੇ ਕਿਵੇਂ ਡਿਪਲੌਇ ਅਤੇ ਮੈਨੇਜ ਕਰਨਾ ਚਾਹੀਦਾ ਹੈ। ਆਓ ਇਸਨੂੰ ਲਾਈਨ-ਬਾਈ-ਲਾਈਨ ਤੋੜ ਕੇ ਸਮਝੀਏ।

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: ਕੀ ਸਾਨੂੰ hooks ਦੀ ਲੋੜ ਹੈ? 
      # TODO: ਕੀ ਸਾਨੂੰ ਸਾਰੇ variables ਦੀ ਲੋੜ ਹੈ?

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

## 2. ਫਾਈਲ ਨੂੰ ਸਮਝਣਾ

ਆਓ ਫਾਈਲ ਨੂੰ ਸੈਕਸ਼ਨ ਵਾਰ ਸਮਝੀਏ, ਕਿ ਇਹ ਕੀ ਕਰਦੀ ਹੈ - ਅਤੇ ਕਿਉਂ।

### 2.1 **ਹੈਡਰ ਅਤੇ ਸਕੀਮਾ (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **ਲਾਈਨ 1**: YAML ਭਾਸ਼ਾ ਸਰਵਰ ਸਕੀਮਾ ਵੈਧਤਾ IDE ਸਹਾਇਤਾ ਅਤੇ IntelliSense ਲਈ ਪ੍ਰਦਾਨ ਕਰਦੀ ਹੈ

### 2.2 ਪ੍ਰੋਜੈਕਟ ਮੈਟਾਡੇਟਾ (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **ਲਾਈਨ 5**: ਪ੍ਰੋਜੈਕਟ ਦਾ ਨਾਮ ਪਰਿਭਾਸ਼ਿਤ ਕਰਦੀ ਹੈ ਜੋ Azure Developer CLI ਦੁਆਰਾ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ
- **ਲਾਈਨ 6-7**: ਦਰਸਾਉਂਦੀ ਹੈ ਕਿ ਇਹ ਟੈਂਪਲੇਟ ਵਰਜਨ 1.0.2 'ਤੇ ਆਧਾਰਿਤ ਹੈ
- **ਲਾਈਨ 8-9**: Azure Developer CLI ਵਰਜਨ 1.14.0 ਜਾਂ ਇਸ ਤੋਂ ਉੱਚਾ ਦੀ ਲੋੜ ਹੈ

### 2.3 ਡਿਪਲੌਇਮੈਂਟ ਹੂਕਸ (11-40)

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

- **ਲਾਈਨ 11-20**: **ਪ੍ਰੀ-ਡਿਪਲੌਇਮੈਂਟ ਹੂਕ** - `azd up` ਤੋਂ ਪਹਿਲਾਂ ਚਲਦਾ ਹੈ

      - Unix/Linux 'ਤੇ: ਵੈਰੀਏਬਲ ਵੈਧਤਾ ਸਕ੍ਰਿਪਟ ਨੂੰ ਐਕਜ਼ਿਕਿਊਟੇਬਲ ਬਣਾਉਂਦਾ ਹੈ ਅਤੇ ਚਲਾਉਂਦਾ ਹੈ
      - Windows 'ਤੇ: PowerShell ਵੈਰੀਏਬਲ ਵੈਧਤਾ ਸਕ੍ਰਿਪਟ ਚਲਾਉਂਦਾ ਹੈ
      - ਦੋਵੇਂ ਇੰਟਰਐਕਟਿਵ ਹਨ ਅਤੇ ਡਿਪਲੌਇਮੈਂਟ ਨੂੰ ਰੋਕ ਦੇਣਗੇ ਜੇ ਇਹ ਫੇਲ੍ਹ ਹੁੰਦੇ ਹਨ

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
- **ਲਾਈਨ 21-30**: **ਪੋਸਟ-ਪ੍ਰੋਵਿਜ਼ਨ ਹੂਕ** - Azure ਸਰੋਤ ਬਣਨ ਤੋਂ ਬਾਅਦ ਚਲਦਾ ਹੈ

  - ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਲਿਖਣ ਵਾਲੇ ਸਕ੍ਰਿਪਟ ਚਲਾਉਂਦਾ ਹੈ
  - ਜੇਕਰ ਇਹ ਸਕ੍ਰਿਪਟ ਫੇਲ੍ਹ ਹੁੰਦੇ ਹਨ ਤਾਂ ਵੀ ਡਿਪਲੌਇਮੈਂਟ ਜਾਰੀ ਰਹਿੰਦਾ ਹੈ (`continueOnError: true`)

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
- **ਲਾਈਨ 31-40**: **ਪੋਸਟ-ਡਿਪਲੌਇ ਹੂਕ** - ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਬਾਅਦ ਚਲਦਾ ਹੈ

  - ਅੰਤਮ ਸੈਟਅਪ ਸਕ੍ਰਿਪਟ ਚਲਾਉਂਦਾ ਹੈ
  - ਜੇਕਰ ਸਕ੍ਰਿਪਟ ਫੇਲ੍ਹ ਹੁੰਦੇ ਹਨ ਤਾਂ ਵੀ ਜਾਰੀ ਰਹਿੰਦਾ ਹੈ

### 2.4 ਸੇਵਾ ਕਨਫਿਗ (41-48)

ਇਹ ਤੁਹਾਡੇ ਡਿਪਲੌਇ ਕੀਤੇ ਜਾ ਰਹੇ ਐਪਲੀਕੇਸ਼ਨ ਸੇਵਾ ਨੂੰ ਕਨਫਿਗਰ ਕਰਦੀ ਹੈ।

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

- **ਲਾਈਨ 42**: "api_and_frontend" ਨਾਮ ਦੀ ਸੇਵਾ ਪਰਿਭਾਸ਼ਿਤ ਕਰਦੀ ਹੈ
- **ਲਾਈਨ 43**: `./src` ਡਾਇਰੈਕਟਰੀ ਨੂੰ ਸਰੋਤ ਕੋਡ ਲਈ ਦਰਸਾਉਂਦੀ ਹੈ
- **ਲਾਈਨ 44**: Python ਨੂੰ ਪ੍ਰੋਗਰਾਮਿੰਗ ਭਾਸ਼ਾ ਵਜੋਂ ਦਰਸਾਉਂਦੀ ਹੈ
- **ਲਾਈਨ 45**: Azure Container Apps ਨੂੰ ਹੋਸਟਿੰਗ ਪਲੇਟਫਾਰਮ ਵਜੋਂ ਵਰਤਦੀ ਹੈ
- **ਲਾਈਨ 46-48**: Docker ਕਨਫਿਗਰੇਸ਼ਨ

      - "api_and_frontend" ਨੂੰ ਇਮੇਜ ਨਾਮ ਵਜੋਂ ਵਰਤਦੀ ਹੈ
      - Docker ਇਮੇਜ ਨੂੰ Azure ਵਿੱਚ ਰਿਮੋਟਲੀ ਬਣਾਉਂਦੀ ਹੈ (ਲੋਕਲ ਨਹੀਂ)

### 2.5 ਪਾਈਪਲਾਈਨ ਵੈਰੀਏਬਲ (49-76)

ਇਹ ਵੈਰੀਏਬਲ ਤੁਹਾਨੂੰ CI/CD ਪਾਈਪਲਾਈਨ ਵਿੱਚ `azd` ਚਲਾਉਣ ਵਿੱਚ ਮਦਦ ਕਰਦੇ ਹਨ

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

ਇਹ ਸੈਕਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟ ਦੌਰਾਨ ਵਰਤੇ ਜਾਣ ਵਾਲੇ ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਪਰਿਭਾਸ਼ਿਤ ਕਰਦਾ ਹੈ, ਸ਼੍ਰੇਣੀ ਅਨੁਸਾਰ:

- **Azure ਸਰੋਤ ਨਾਮ (ਲਾਈਨ 51-60)**:
      - ਮੁੱਖ Azure ਸੇਵਾ ਸਰੋਤ ਨਾਮ ਜਿਵੇਂ ਕਿ Resource Group, AI Hub, AI Project, ਆਦਿ
- **ਫੀਚਰ ਫਲੈਗਸ (ਲਾਈਨ 61-63)**:
      - ਖਾਸ Azure ਸੇਵਾਵਾਂ ਨੂੰ ਯੋਗ/ਅਯੋਗ ਕਰਨ ਲਈ ਬੂਲੀਅਨ ਵੈਰੀਏਬਲ
- **AI ਏਜੰਟ ਕਨਫਿਗਰੇਸ਼ਨ (ਲਾਈਨ 64-71)**:
      - ਮੁੱਖ AI ਏਜੰਟ ਲਈ ਕਨਫਿਗਰੇਸ਼ਨ ਜਿਸ ਵਿੱਚ ਨਾਮ, ID, ਡਿਪਲੌਇਮੈਂਟ ਸੈਟਿੰਗ, ਮਾਡਲ ਵੇਰਵੇ ਸ਼ਾਮਲ ਹਨ
- **AI ਐਮਬੈਡਿੰਗ ਕਨਫਿਗਰੇਸ਼ਨ (ਲਾਈਨ 72-79)**:
      - ਵੈਕਟਰ ਖੋਜ ਲਈ ਵਰਤੇ ਜਾਣ ਵਾਲੇ ਐਮਬੈਡਿੰਗ ਮਾਡਲ ਲਈ ਕਨਫਿਗਰੇਸ਼ਨ
- **ਖੋਜ ਅਤੇ ਮਾਨੀਟਰਿੰਗ (ਲਾਈਨ 80-84)**:
      - ਖੋਜ ਇੰਡੈਕਸ ਨਾਮ, ਮੌਜੂਦਾ ਸਰੋਤ ID, ਅਤੇ ਮਾਨੀਟਰਿੰਗ/ਟ੍ਰੇਸਿੰਗ ਸੈਟਿੰਗ

---

## 3. ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਜਾਣੋ
ਹੇਠਾਂ ਦਿੱਤੇ ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਤੁਹਾਡੇ ਡਿਪਲੌਇਮੈਂਟ ਦੀ ਕਨਫਿਗਰੇਸ਼ਨ ਅਤੇ ਵਿਹਾਰ ਨੂੰ ਨਿਯੰਤਰਿਤ ਕਰਦੇ ਹਨ, ਜੋ ਉਨ੍ਹਾਂ ਦੇ ਮੁੱਖ ਉਦੇਸ਼ ਅਨੁਸਾਰ ਵਿਵਸਥਿਤ ਹਨ। ਜ਼ਿਆਦਾਤਰ ਵੈਰੀਏਬਲਾਂ ਦੇ ਸਮਝਦਾਰ ਡਿਫਾਲਟ ਹੁੰਦੇ ਹਨ, ਪਰ ਤੁਸੀਂ ਉਨ੍ਹਾਂ ਨੂੰ ਆਪਣੇ ਖਾਸ ਜ਼ਰੂਰਤਾਂ ਜਾਂ ਮੌਜੂਦਾ Azure ਸਰੋਤਾਂ ਦੇ ਅਨੁਕੂਲ ਬਣਾਉਣ ਲਈ ਕਸਟਮਾਈਜ਼ ਕਰ ਸਕਦੇ ਹੋ।

### 3.1 ਲੋੜੀਂਦੇ ਵੈਰੀਏਬਲ 

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

### 3.2 ਮਾਡਲ ਕਨਫਿਗਰੇਸ਼ਨ 
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

### 3.3 ਫੀਚਰ ਟੌਗਲ
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

### 3.4 AI ਪ੍ਰੋਜੈਕਟ ਕਨਫਿਗਰੇਸ਼ਨ 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 ਆਪਣੇ ਵੈਰੀਏਬਲ ਚੈੱਕ ਕਰੋ

Azure Developer CLI ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਆਪਣੇ ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਵੇਖੋ ਅਤੇ ਮੈਨੇਜ ਕਰੋ:

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

