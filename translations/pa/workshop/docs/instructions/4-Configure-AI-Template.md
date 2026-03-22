# 4. ਇੱਕ ਟੈਮਪਲੇਟ ਸੰਰਚਨਾ ਕਰੋ

!!! tip "ਇਸ ਮਾਡਿਊਲ ਦੇ ਅੰਤ ਤੱਕ ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ"

    - [ ] `azure.yaml` ਦਾ ਮਕਸਦ ਸਮਝੋ
    - [ ] `azure.yaml` ਦੀ ਰਚਨਾ ਸਮਝੋ
    - [ ] azd lifecycle `hooks` ਦੀ ਮਹੱਤਤਾ ਸਮਝੋ
    - [ ] **ਲੈਬ 4:** ਵਾਤਾਵਰਣ ਵੇਰੀਏਬਲ ਨੂੰ ਖੋਜੋ ਅਤੇ ਸੋਧੋ

---

!!! prompt " `azure.yaml` ਫਾਇਲ ਕੀ ਕਰਦੀ ਹੈ? ਇੱਕ ਕੋਡਫੇੰਸ ਦੀ ਵਰਤੋਂ ਕਰੋ ਅਤੇ ਇਸਨੂੰ ਲਾਈਨ ਦਰ ਲਾਈਨ ਸਮਝਾਓ"

      `azure.yaml` ਫਾਈਲ Azure Developer CLI (azd) ਲਈ **ਕਨਫਿਗਰੇਸ਼ਨ ਫ਼ਾਈਲ** ਹੈ। ਇਹ ਇਹ ਪਰਿਭਾਸ਼ਿਤ ਕਰਦੀ ਹੈ ਕਿ ਤੁਹਾਡੀ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ Azure 'ਤੇ ਕਿਵੇਂ ਡਿਪਲੋਏ ਕੀਤਾ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ, ਜਿਸ ਵਿੱਚ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ, ਸਰਵਿਸਜ਼, ਡਿਪਲੋਇਮੈਂਟ ਹੂਕਸ, ਅਤੇ ਵਾਤਾਵਰਣ ਵੇਰੀਏਬਲ ਸ਼ਾਮਲ ਹਨ।

---

## 1. ਉਦੇਸ਼ ਅਤੇ ਕਾਰਜਸ਼ੀਲਤਾ

ਇਹ `azure.yaml` ਫਾਈਲ ਇੱਕ AI ਏਜੰਟ ਐਪਲੀਕੇਸ਼ਨ ਲਈ **ਡਿਪਲੋਇਮੈਂਟ ਰੂਪਰੇਖਾ** ਵਜੋਂ ਕੰਮ ਕਰਦੀ ਹੈ, ਜੋ:

1. **ਡਿਪਲੋਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਵਾਤਾਵਰਣ ਦੀ ਪੁਸ਼ਟੀ ਕਰਦਾ ਹੈ**
2. **Azure AI ਸੇਵਾਵਾਂ ਦੀ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਕਰਦਾ ਹੈ** (AI Hub, AI Project, Search ਆਦਿ)
3. **ਇੱਕ Python ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ Azure Container Apps 'ਤੇ ਡਿਪਲੋਏ ਕਰਦਾ ਹੈ**
4. **ਚੈਟ ਅਤੇ ਐਮਬੈਡਿੰਗ ਫੰਕਸ਼ਨਾਲਿਟੀ ਲਈ AI ਮਾਡਲਾਂ ਨੂੰ ਸੰਰਚਿਤ ਕਰਦਾ ਹੈ**
5. **AI ਐਪਲੀਕੇਸ਼ਨ ਲਈ ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਟਰੇਸਿੰਗ ਸੈੱਟ ਕਰਦਾ ਹੈ**
6. **ਨਵੇਂ ਅਤੇ ਮੌਜੂਦਾ ਦੋਹਾਂ Azure AI ਪ੍ਰੋਜੈਕਟ ਸੰਦਰਭਾਂ ਨੂੰ ਸੰਭਾਲਦਾ ਹੈ**

ਇਹ ਫਾਈਲ ਸਹੀ ਵੈਧਤਾ, ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਅਤੇ ਪੋਸਟ-ਡਿਪਲੋਇਮੈਂਟ ਸੰਰਚਨਾ ਦੇ ਨਾਲ ਪੂਰੇ AI ਏਜੰਟ ਹੱਲ ਨੂੰ ਇੱਕ ਹੀ ਕਮਾਂਡ (`azd up`) ਵਿੱਚ ਡਿਪਲੋਏ ਕਰਨ ਦੀ ਸਮਰੱਥਾ ਦਿੰਦੀ ਹੈ।

??? info "ਖੋਲ੍ਹ ਕੇ ਵੇਖੋ: `azure.yaml`"

      `azure.yaml` ਫਾਈਲ ਇਹ ਪਰਿਭਾਸ਼ਿਤ ਕਰਦੀ ਹੈ ਕਿ Azure Developer CLI ਇਸ AI ਏਜੰਟ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ Azure ਵਿੱਚ ਕਿਵੇਂ ਡਿਪਲੋਏ ਅਤੇ ਪ੍ਰਬੰਧਿਤ ਕਰੇਗਾ। ਆਓ ਇਸਨੂੰ ਲਾਈਨ ਦਰ ਲਾਈਨ ਤੋੜੀਏ।

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

## 2. ਫਾਈਲ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ

ਆਓ ਫਾਈਲ ਨੂੰ ਹਿੱਸਾ-ਦਰ-ਹਿੱਸਾ ਵੇਖੀਏ, ਤਾਂ ਜੋ ਸਮਝ ਸਕੀਏ ਕਿ ਇਹ ਕੀ ਕਰਦੀ ਹੈ - ਅਤੇ ਕਿਉਂ।

### 2.1 **ਹੈੱਡਰ ਅਤੇ ਸਕੀਮਾ (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **ਲਾਈਨ 1**: IDE ਸਹਾਇਤਾ ਅਤੇ IntelliSense ਲਈ YAML ਲੈਂਗਵੇਜ ਸਰਵਰ ਸਕੀਮਾ ਵੈਧਤਾ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ

### 2.2 ਪ੍ਰੋਜੈਕਟ ਮੈਟਾਡਾਟਾ (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **ਲਾਈਨ 5**: Azure Developer CLI ਦੁਆਰਾ ਵਰਤੇ ਜਾਣ ਵਾਲੇ ਪ੍ਰੋਜੈਕਟ ਦਾ ਨਾਮ ਨਿਰਧਾਰਤ ਕਰਦਾ ਹੈ
- **ਲਾਈਨਾਂ 6-7**: ਦਰਸਾਉਂਦਾ ਹੈ ਕਿ ਇਹ ਟੈਮਪਲੇਟ ਸੰਸਕਰਣ 1.0.2 'ਤੇ ਆਧਾਰਿਤ ਹੈ
- **ਲਾਈਨਾਂ 8-9**: Azure Developer CLI ਸੰਸਕਰਣ 1.14.0 ਜਾਂ ਉੱਪਰ ਦੀ ਲੋੜ ਹੈ

### 2.3 ਡਿਪਲੋਇਮੈਂਟ ਹੂਕਸ (11-40)

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

- **ਲਾਈਨਾਂ 11-20**: **ਪ੍ਰੀ-ਡਿਪਲੋਇਮੈਂਟ ਹੂਕ** - `azd up` ਤੋਂ ਪਹਿਲਾਂ ਚਲਦਾ ਹੈ

      - Unix/Linux 'ਤੇ: ਵੈਲਿਡੇਸ਼ਨ ਸਕ੍ਰਿਪਟ ਨੂੰ ਐਗਜ਼ਿਕਿਊਟੇਬਲ ਬਣਾਉਂਦਾ ਹੈ ਅਤੇ ਚਲਾਉਂਦਾ ਹੈ
      - Windows 'ਤੇ: PowerShell ਵੈਲਿਡੇਸ਼ਨ ਸਕ੍ਰਿਪਟ ਚਲਾਉਂਦਾ ਹੈ
      - ਦੋਹਾਂ ਇੰਟਰਐਕਟਿਵ ਹਨ ਅਤੇ ਜੇ ਅਸਫਲ ਹੋਏ ਤਾਂ ਡਿਪਲੋਇਮੈਂਟ ਰੋਕ ਦਿੱਤਾ ਜਾਵੇਗਾ

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
- **ਲਾਈਨਾਂ 21-30**: **ਪੋਸਟ-ਪ੍ਰੋਵਿਜ਼ਨ ਹੂਕ** - Azure ਰਿਸੋਰਸ ਬਣਨ ਤੋਂ ਬਾਅਦ ਚਲਦਾ ਹੈ

  - ਵਾਤਾਵਰਣ ਵੇਰੀਏਬਲ ਲਿਖਣ ਵਾਲੀਆਂ ਸਕ੍ਰਿਪਟਾਂ ਚਲਾਉਂਦਾ ਹੈ
  - ਜੇ ਇਹ ਸਕ੍ਰਿਪਟ ਅਸਫਲ ਹੋਣ ਤਾਂ ਵੀ ਡਿਪਲੋਇਮੈਂਟ ਜਾਰੀ ਰੱਖਦਾ ਹੈ (`continueOnError: true`)

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
- **ਲਾਈਨਾਂ 31-40**: **ਪੋਸਟ-ਡਿਪਲੋਇਮੈਂਟ ਹੂਕ** - ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੋਇਮੈਂਟ ਤੋਂ ਬਾਅਦ ਚਲਦਾ ਹੈ

  - ਆਖ਼ਰੀ ਸੈਟਅਪ ਸਕ੍ਰਿਪਟਾਂ ਚਲਾਉਂਦਾ ਹੈ
  - ਜੇ ਸਕ੍ਰਿਪਟ ਫੇਲ ਹੋਣ ਤਾਂ ਵੀ ਜਾਰੀ ਰੱਖਦਾ ਹੈ

### 2.4 ਸੇਵਾ ਸੰਰਚਨਾ (41-48)

ਇਹ ਉਸ ਐਪਲੀਕੇਸ਼ਨ ਸੇਵਾ ਨੂੰ ਸੰਰਚਿਤ ਕਰਦਾ ਹੈ ਜਿਸਨੂੰ ਤੁਸੀਂ ਡਿਪਲੋਏ ਕਰ ਰਹੇ ਹੋ।

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

- **ਲਾਈਨ 42**: "api_and_frontend" ਨਾਮ ਦੀ ਸੇਵਾ ਨੂੰ ਪਰਿਭਾਸ਼ਿਤ ਕਰਦਾ ਹੈ
- **ਲਾਈਨ 43**: ਸਰੋਤ ਕੋਡ ਲਈ `./src` ਡਾਇਰੈਕਟਰੀ ਦੀ ਨਿਰਦੇਸ਼ਨਾ ਕਰਦਾ ਹੈ
- **ਲਾਈਨ 44**: ਭਾਸ਼ਾ ਵਜੋਂ Python ਦਰਸਾਉਂਦਾ ਹੈ
- **ਲਾਈਨ 45**: ਹੋਸਟਿੰਗ ਪਲੇਟਫਾਰਮ ਵਜੋਂ Azure Container Apps ਦੀ ਵਰਤੋਂ ਕਰਦਾ ਹੈ
- **ਲਾਈਨਾਂ 46-48**: Docker ਸੰਰਚਨਾ

      - "api_and_frontend" ਨੂੰ ਇਮੇਜ ਨਾਮ ਵਜੋਂ ਵਰਤਦਾ ਹੈ
      - Docker ਇਮੇਜ ਨੂੰ Azure ਵਿੱਚ ਰਿਮੋਟ ਤੌਰ 'ਤੇ ਬਣਾਉਂਦਾ ਹੈ (ਲੋਕਲ ਤੌਰ 'ਤੇ ਨਹੀਂ)

### 2.5 ਪਾਈਪਲਾਈਨ ਵੈਰੀਏਬਲ (49-76)

ਇਹ ਵੈਰੀਏਬਲ ਹਨ ਜੋ ਤੁਹਾਨੂੰ ਆਟੋਮੇਸ਼ਨ ਲਈ CI/CD ਪਾਈਪਲਾਈਨਾਂ ਵਿੱਚ `azd` ਚਲਾਉਣ ਵਿੱਚ ਮਦਦ ਕਰਦੇ ਹਨ

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

ਇਹ ਸੈਕਸ਼ਨ ਵਾਤਾਵਰਣ ਵੇਰੀਏਬਲ ਨੂੰ ਪਰਿਭਾਸ਼ਿਤ ਕਰਦਾ ਹੈ ਜੋ **ਡਿਪਲੋਇਮੈਂਟ ਦੌਰਾਨ** ਵਰਤੇ ਜਾਂਦੇ ਹਨ, ਸ਼੍ਰੇਣੀ ਅਨੁਸਾਰ ਵਿਵਸਥਿਤ:

- **Azure ਰਿਸੋਰਸ ਨਾਮ (ਲਾਈਨਾਂ 51-60)**:
      - ਮੁੱਖ Azure ਸੇਵਾ ਰਿਸੋਰਸ ਨਾਮ ਜਿਵੇਂ Resource Group, AI Hub, AI Project ਆਦਿ
- **ਫੀਚਰ ਫਲੈਗ (ਲਾਈਨਾਂ 61-63)**:
      - ਖਾਸ Azure ਸੇਵਾਵਾਂ ਨੂੰ ਚਾਲੂ/ਬੰਦ ਕਰਨ ਲਈ ਬੁਲੀਅਨ ਵੈਰੀਏਬਲ
- **AI ਏਜੰਟ ਸੰਰਚਨਾ (ਲਾਈਨਾਂ 64-71)**:
      - ਪ੍ਰਮੁੱਖ AI ਏਜੰਟ ਲਈ ਸੰਰਚਨਾ ਜਿਸ ਵਿੱਚ ਨਾਮ, ID, ਡਿਪਲੋਇਮੈਂਟ ਸੈਟਿੰਗ, ਮਾਡਲ ਵੇਰਵੇ ਸ਼ਾਮਲ ਹਨ
- **AI ਐਮਬੈਡਿੰਗ ਸੰਰਚਨਾ (ਲਾਈਨਾਂ 72-79)**:
      - ਵੈਕਟਰ ਖੋਜ ਲਈ ਵਰਤੇ ਜਾਣ ਵਾਲੇ ਐਮਬੈਡਿੰਗ ਮਾਡਲ ਦੀ ਸੰਰਚਨਾ
- **ਖੋਜ ਅਤੇ ਮਾਨੀਟਰਿੰਗ (ਲਾਈਨਾਂ 80-84)**:
      - ਖੋਜ ਇੰਡੈਕਸ ਦਾ ਨਾਮ, ਮੌਜੂਦਾ ਰਿਸੋਰਸ ID, ਅਤੇ ਮਾਨੀਟਰਿੰਗ/ਟਰੇਸਿੰਗ ਸੈਟਿੰਗਸ

---

## 3. ਵਾਤਾਵਰਣ ਵੇਰੀਏਬਲ ਜਾਣੋ
ਹੇਠਾਂ ਦਿੱਤੇ ਵਾਤਾਵਰਣ ਵੇਰੀਏਬਲ ਤੁਹਾਡੇ ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਸੰਰਚਨਾ ਅਤੇ ਵਿਹਾਰ ਨੂੰ ਕੰਟਰੋਲ ਕਰਦੇ ਹਨ, ਉਨ੍ਹਾਂ ਦੇ ਮੁੱਖ ਉਦੇਸ਼ ਅਨੁਸਾਰ ਵਰਗੀਕ੍ਰਿਤ। ਜ਼ਿਆਦਾਤਰ ਵੈਰੀਏਬਲਾਂ ਦੇ ਸਮਝਦਾਰ ਡਿਫਾਲਟ ਮੁੱਲ ਹੁੰਦੇ ਹਨ, ਪਰ ਤੁਸੀਂ ਉਨ੍ਹਾਂ ਨੂੰ ਆਪਣੇ ਵਿਸ਼ੇਸ਼ ਲੋੜਾਂ ਜਾਂ ਮੌਜੂਦਾ Azure ਰਿਸੋਰਸਾਂ ਨਾਲ ਮੇਲ ਖਾਣ ਲਈ ਕਸਟਮਾਈਜ਼ ਕਰ ਸਕਦੇ ਹੋ।

### 3.1 ਲਾਜ਼ਮੀ ਵੈਰੀਏਬਲ

```bash title="" linenums="0"
# ਮੁੱਖ ਅਜ਼ੂਰ ਸੰਰਚਨਾ
AZURE_ENV_NAME                    # ਵਾਤਾਵਰਣ ਦਾ ਨਾਮ (ਰਿਸੋਰਸ ਨਾਂਕਰਨ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ)
AZURE_LOCATION                    # ਤਾਇਨਾਤੀ ਖੇਤਰ
AZURE_SUBSCRIPTION_ID             # ਲਕ਼ਸ਼ ਸਬਸਕ੍ਰਿਪਸ਼ਨ
AZURE_RESOURCE_GROUP              # ਸੰਸਾਧਨ ਗਰੁੱਪ ਦਾ ਨਾਮ
AZURE_PRINCIPAL_ID                # RBAC ਲਈ ਯੂਜ਼ਰ ਪ੍ਰਿੰਸੀਪਲ

# ਸੰਸਾਧਨ ਨਾਮ (ਜੇ ਦਿੱਤੇ ਨਾ ਜਾਣ ਤਾਂ ਆਟੋ-ਜਨਰੇਟ ਕੀਤੇ ਜਾਣਗੇ)
AZURE_AIHUB_NAME                  # Microsoft Foundry ਹੱਬ ਦਾ ਨਾਮ
AZURE_AIPROJECT_NAME              # AI ਪ੍ਰਾਜੈਕਟ ਦਾ ਨਾਮ
AZURE_AISERVICES_NAME             # AI ਸੇਵਾਵਾਂ ਖਾਤੇ ਦਾ ਨਾਮ
AZURE_STORAGE_ACCOUNT_NAME        # ਸਟੋਰੇਜ ਖਾਤੇ ਦਾ ਨਾਮ
AZURE_CONTAINER_REGISTRY_NAME     # ਕੰਟੇਨਰ ਰਜਿਸਟਰੀ ਦਾ ਨਾਮ
AZURE_KEYVAULT_NAME               # ਕੀ ਵੌਲਟ ਦਾ ਨਾਮ (ਜੇ ਵਰਤਿਆ ਗਿਆ ਹੋਵੇ)
```

### 3.2 ਮਾਡਲ ਸੰਰਚਨਾ 
```bash title="" linenums="0"
# ਚੈਟ ਮਾਡਲ ਸੰਰਚਨਾ
AZURE_AI_AGENT_MODEL_NAME         # ਡਿਫਾਲਟ: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # ਡਿਫਾਲਟ: OpenAI (ਜਾਂ Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # ਡਿਫਾਲਟ: ਸਭ ਤੋਂ ਨਵਾਂ ਉਪਲਬਧ
AZURE_AI_AGENT_DEPLOYMENT_NAME    # ਚੈਟ ਮਾਡਲ ਲਈ ਡਿਪਲੋਇਮੈਂਟ ਦਾ ਨਾਮ
AZURE_AI_AGENT_DEPLOYMENT_SKU     # ਡਿਫਾਲਟ: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # ਡਿਫਾਲਟ: 80 (ਹਜ਼ਾਰਾਂ TPM)

# ਐਂਬੈੱਡਿੰਗ ਮਾਡਲ ਸੰਰਚਨਾ
AZURE_AI_EMBED_MODEL_NAME         # ਡਿਫਾਲਟ: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # ਡਿਫਾਲਟ: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # ਡਿਫਾਲਟ: ਸਭ ਤੋਂ ਨਵਾਂ ਉਪਲਬਧ
AZURE_AI_EMBED_DEPLOYMENT_NAME    # ਐਂਬੈੱਡਿੰਗ ਲਈ ਡਿਪਲੋਇਮੈਂਟ ਦਾ ਨਾਮ
AZURE_AI_EMBED_DEPLOYMENT_SKU     # ਡਿਫਾਲਟ: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # ਡਿਫਾਲਟ: 50 (ਹਜ਼ਾਰਾਂ TPM)

# ਏਜੰਟ ਸੰਰਚਨਾ
AZURE_AI_AGENT_NAME               # ਏਜੰਟ ਦਾ ਪ੍ਰਦਰਸ਼ਿਤ ਨਾਮ
AZURE_EXISTING_AGENT_ID           # ਮੌਜੂਦਾ ਏਜੰਟ ਦੀ ਵਰਤੋਂ ਕਰੋ (ਵਿਕਲਪਿਕ)
```

### 3.3 ਫੀਚਰ ਟੌਗਲ
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

### 3.4 AI ਪ੍ਰੋਜੈਕਟ ਸੰਰਚਨਾ 
```bash title="" linenums="0"
# ਮੌਜੂਦਾ ਸਰੋਤਾਂ ਦੀ ਵਰਤੋਂ ਕਰੋ
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # ਮੌਜੂਦਾ AI ਪ੍ਰੋਜੈਕਟ ਦਾ ਪੂਰਾ ਸਰੋਤ ID
AZURE_EXISTING_AIPROJECT_ENDPOINT       # ਮੌਜੂਦਾ ਪ੍ਰੋਜੈਕਟ ਦਾ ਐਂਡਪੌਇੰਟ URL
```

### 3.5 ਆਪਣੇ ਵੈਰੀਏਬਲ ਚੈੱਕ ਕਰੋ

ਆਪਣੇ ਵਾਤਾਵਰਣ ਵੇਰੀਏਬਲਾਂ ਨੂੰ ਵੇਖਣ ਅਤੇ ਪ੍ਰਬੰਧਿਤ ਕਰਨ ਲਈ Azure Developer CLI ਦੀ ਵਰਤੋਂ ਕਰੋ:

```bash title="" linenums="0"
# ਮੌਜੂਦਾ ਐਨਵਾਇਰਨਮੈਂਟ ਲਈ ਸਾਰੇ ਵੈਰੀਏਬਲ ਵੇਖੋ
azd env get-values

# ਕਿਸੇ ਵਿਸ਼ੇਸ਼ ਐਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ ਨੂੰ ਪ੍ਰਾਪਤ ਕਰੋ
azd env get-value AZURE_ENV_NAME

# ਇੱਕ ਐਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ ਸੈੱਟ ਕਰੋ
azd env set AZURE_LOCATION eastus

# .env ਫਾਇਲ ਤੋਂ ਕਈ ਵੈਰੀਏਬਲ ਸੈੱਟ ਕਰੋ
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਨਾਲ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਯਤਨ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਧਿਆਨ ਰੱਖੋ ਕਿ automated (ਆਟੋਮੈਟਿਕ) ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਭੁੱਲਾਂ ਜਾਂ ਅਣਸਹੀਤੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਹੀ ਅਧਿਕਾਰਿਕ ਸਰੋਤ ਮਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਸੰਵੇਦਨਸ਼ੀਲ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਹੋਈਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->