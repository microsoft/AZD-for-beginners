# 4. ಟೆಂಪ್ಲೇಟ್ ಅನ್ನು ಸಂರಚಿಸಿ

!!! tip "ಈ ಮಾಪ್ಡಿಯ ಅಂತ್ಯಕ್ಕೆ ನೀವು ಸಾಧ್ಯವಾಗುವುದು"

    - [ ] `azure.yaml` ನ ಉದ್ದೇಶವನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
    - [ ] `azure.yaml` ನ ರಚನೆಯನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
    - [ ] azd ಜೀವನಚಕ್ರ `hooks` ಗಳ ಮೌಲ್ಯವನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
    - [ ] **ಲ್ಯಾಬ್ 4:** ಪರಿಸರ ಚರಗಳನ್ನು ಅನ್ವೇಷಿಸಿ ಮತ್ತು ತಿದ್ದುಪಡಿಮಾಡಿ

---

!!! prompt "`azure.yaml` ಕಡತ 무엇 ಮಾಡುತ್ತದೆ? ಕೋಡ್‌ಫೆನ್ಸ್ ಬಳಸಿ ಮತ್ತು ಅದನ್ನು ಸಾಲುಬದ್ದವಾಗಿ ವಿವರಿಸಿ"

      `azure.yaml` ಫೈಲ್ ಅನ್ನು **Azure Developer CLI (azd) ಗಾಗಿ ಸಂರಚನಾ ಫೈಲ್** ಆಗಿ ಪರಿಗಣಿಸಲಾಗಿದೆ. ಇದು ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು Azure ಗೆ ಹೇಗೆ ನಿಯೋಜಿಸಲು ಬೇಕೋ ಅದರ ಬಗ್ಗೆ, ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್, ಸೇವೆಗಳು, ನಿಯೋಜನೆ ಹೂಕ್‌ಗಳು ಮತ್ತು ಪರಿಸರ ಚರಗಳನ್ನು ಸೇರಿಸಿ ವ್ಯಾಖ್ಯಾನಿಸುತ್ತದೆ.

---

## 1. ಉದ್ದೇಶ ಮತ್ತು ಕಾರ್ಯಕ್ಷಮತೆ

ಈ `azure.yaml` ಫೈಲ್ ಒಂದು AI ಏಜೆಂಟ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಾಗಿ **ನಿಯೋಜನೆ ಯೋಜನೆಯ ರೂಪುರೇಖೆ** ಆಗಿ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತದೆ, ಅದು:

1. ನಿಯೋಜನೆಯ ಮೊದಲು ಪರಿಸರವನ್ನು ಪರಿಶೀಲಿಸುತ್ತದೆ
2. Azure AI ಸೇವೆಗಳನ್ನು ಪೃಥ್ವೀಕರಿಸುತ್ತದೆ (AI Hub, AI Project, Search, ಇತ್ಯಾದಿ)
3. Python ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು Azure Container Apps ಗೆ ನಿಯೋಜಿಸುತ್ತದೆ
4. ಚಾಟ್ ಮತ್ತು ಎಂಬೆಡ್ಡಿಂಗ್ ಕಾರ್ಯಕ್ಷಮತೆಗೆ AI ಮಾದರಿಗಳನ್ನು ಸಂರಚಿಸುತ್ತದೆ
5. AI ಅಪ್ಲಿಕೇಶನ್‌ಗಾಗಿ ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಟ್ರೇಸಿಂಗ್ ಅನ್ನು ಸೆಟ್‌ಅಪ್ ಮಾಡುತ್ತದೆ
6. ಹೊಸ ಮತ್ತು ಇದ್ದಂತೆಯೇ ಇರುವ Azure AI ಪ್ರಾಜೆಕ್ಟ್ ಸನ್ನಿವೇಶಗಳನ್ನು ನಿರ್ವಹಿಸುತ್ತದೆ

ಫೈಲ್ ಸಮರ್ಪಕ ವಾಲಿಡೇಶನ್, ಪ್ರೋವಿಷನಿಂಗ್ ಮತ್ತು ಪೋಸ್ಟ್-ಡಿಪ್ಲಾಯ್ ಸಂರಚನೆಯೊಂದಿಗೆ ಸಂಪೂರ್ಣ AI ಏಜೆಂಟ್ լուծನೆಯನ್ನು ಒಂದು-комಾಂಡ್‌ನ ನಿಯೋಜನೆ (`azd up`) ಮೂಲಕ ಸಾಧ್ಯವಾಗಿಸುತ್ತದೆ.

??? info "ವಿಸ್ತರಿಸಿ ನೋಡಿ: `azure.yaml`"

      ಈ `azure.yaml` ಫೈಲ್ Azure Developer CLI ಈ AI ಏಜೆಂಟ್ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು Azure ನಲ್ಲಿ ಹೇಗೆ ನಿಯೋಜಿಸಬೇಕು ಮತ್ತು ನಿರ್ವಹಿಸಬೇಕು ಎಂಬುದನ್ನು ವ್ಯಾಖ್ಯಾನಿಸುತ್ತದೆ. ಬನ್ನಿ, ಅದನ್ನು ಸಾಲುಬದ್ದವಾಗಿ ಅವಲೋಕಿಸೋಣ.

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

## 2. ಫೈಲ್ ಅನ್ನು ವಿಭಜಿಸುವಿಕೆ

ನಾವು ಫೈಲ್ ಅನ್ನು ವಿಭಾಗವಾಗಿ ನೋಡೋಣ, ಅದು ಏನು ಮಾಡುತ್ತದೆ ಮತ್ತು ಏಕೆ ಎಂಬುದನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಲು.

### 2.1 **ಶೀರ್ಷಿಕೆ ಮತ್ತು ಸ್ಕೆಮಾ (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **ಸಾಲು 1**: IDE ಬೆಂಬಲ ಮತ್ತು IntelliSense ಗಾಗಿ YAML ಲ್ಯಾಂಗ್ವೇಜ್ ಸರ್ವರ್ ಸ್ಕೆಮಾ ವಾಲಿಡೇಶನ್ ಅನ್ನು ಒದಗಿಸುತ್ತದೆ

### 2.2 ಪ್ರಾಜೆಕ್ಟ್ ಮೆಟಾಡೇಟಾ (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **ಸಾಲು 5**: Azure Developer CLI پاران ಬಳಸಲು ಪ್ರಾಜೆಕ್ಟ್ ಹೆಸರು ಅನ್ನು ನಿಗದಿಪಡಿಸುತ್ತದೆ
- **ಸಾಲುಗಳು 6-7**: ಇದು ಟೆಂಪ್ಲೇಟ್ ಆಗಿ ಆಧಾರಿತವಾಗಿದೆ, ಆದಲ್ಲಿ ಸಂಸ್ಕರಣಾ ಆವೃತ್ತಿ 1.0.2 ಅನ್ನು ಸೂಚಿಸುತ್ತದೆ
- **ಸಾಲುಗಳು 8-9**: Azure Developer CLI ಆವೃತ್ತಿ 1.14.0 ಅಥವಾ ಹೆಚ್ಚು ಅಗತ್ಯವಿದೆ

### 2.3 ಡಿಪ್ಲಾಯ್ ಹೂಕ್ಗಳು (11-40)

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

- **ಸಾಲುಗಳು 11-20**: **ಮೊದಲು-ನಿಯೋಜನೆ ಹೂಕ್** - `azd up` ನಿರ್ವಹಣೆಯ ಮೊದಲು ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತದೆ

      - Unix/Linux ಮೇಲೆ: ವಾಲಿಡೇಶನ್ ಸ್ಕ್ರಿಪ್ಟ್ ಅನ್ನು ನಿರ್ವಹಣಾ ಅನುಮತಿ ನೀಡುತ್ತದೆ ಮತ್ತು ಅದನ್ನು 실행ಗೊಳಿಸುತ್ತದೆ
      - Windows ಮೇಲೆ: PowerShell ವಾಲಿಡೇಶನ್ ಸ್ಕ್ರಿಪ್ಟ್ ಅನ್ನು ರನ್ ಮಾಡುತ್ತದೆ
      - ಎರಡೂ ಪರ್ಯಾಯಗಳು ಇಂಟರ್ಯಾಕ್ಟಿವ್ ಆಗಿವೆ ಮತ್ತು ವೈಫಲ್ಯವಾದಲ್ಲಿ ನಿಯೋಜನೆಯನ್ನು ನಿಲ್ಲಿಸುತ್ತವೆ

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
- **ಸಾಲುಗಳು 21-30**: **ಪೋಸ್ಟ್-ಪ್ರಾವಿಷನ್ ಹೂಕ್** - Azure ಸಂಪನ್ಮೂಲಗಳು ರಚಿಸಿದ ನಂತರ ಚಾಲನೆ ಮಾಡುತ್ತದೆ

  - ಪರಿಸರ ಚರಗಳನ್ನು ಬರೆಯುವ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳನ್ನು ಕಾರ್ಯಗೊಳಿಸುತ್ತದೆ
  - ಇವುಗಳ ವೈಫಲ್ಯವಾದರೂ ನಿಯೋಜನೆ ಮುಂದುವರಿಯುತ್ತದೆ (`continueOnError: true`)

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
- **ಸಾಲುಗಳು 31-40**: **ಪೋಸ್ಟ್-ಡಿಪ್ಲಾಯ್ ಹೂಕ್** - ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆಯ ನಂತರ ಚಾಲನೆ ಮಾಡುತ್ತದೆ

  - ಅಂತಿಮ ಸೆಟ್‌ಅಪ್ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳನ್ನು ಕಾರ್ಯಗೊಳಿಸುತ್ತದೆ
  - ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು ವೈಫಲ್ಯವಾದರೂ ಮುಂದುವರಿಯುತ್ತದೆ

### 2.4 ಸೇವೆ ಸಂರಚನೆ (41-48)

ಇದು ನೀವು ನಿಯೋಜಿಸುತ್ತಿರುವ ಅಪ್ಲಿಕೇಶನ್ ಸೇವೆಯನ್ನು ಸಂರಚಿಸುತ್ತದೆ.

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

- **ಸಾಲು 42**: "api_and_frontend" ಎಂಬ ಸೇವೆಯನ್ನು განსೂಚಿಸುತ್ತದೆ
- **ಸಾಲು 43**: ಮೂಲ ಕೋಡ್‌ಗೆ `./src` ಡೈಸ್ಟ್ರೈಕ್ಟರಿಗೆ ಸೂಚಿಸುತ್ತದೆ
- **ಸಾಲು 44**: ಪ್ರೋಗ್ರಾಮಿಂಗ್ ಭಾಷೆಯಾಗಿಯಾಗಿ Python ಅನ್ನು ನಿಗದಿಸಿತ್ತೆ
- **ಸಾಲು 45**: ಹೋಸ್ಟಿಂಗ್ ವೇದಿಕೆಗಾಗಿ Azure Container Apps ಅನ್ನು ಬಳಕೆಮಾಡುತ್ತದೆ
- **ಸಾಲುಗಳು 46-48**: ಡೊಕರ್ ಸಂರಚನೆ

      - "api_and_frontend" ಅನ್ನು ಚಿತ್ರದ (image) ಹೆಸರಾಗಿ ಬಳಸುತ್ತದೆ
      - ಡೊಕರ್ ಇಮೇಜ್ ಅನ್ನು ಸ್ಥಳೀಯವಾಗಿ ಅಲ್ಲದೆ Azure ನಲ್ಲಿ ದೂರದಿಂದ ಬಿಲ್ಡ್ ಮಾಡುತ್ತದೆ

### 2.5 ಪೈಪ್‌ಲೈನ್ ಚರಗಳು (49-76)

ಇವು CI/CD ಪೈಪ್‌ಲೈನ್‌ಗಳಲ್ಲಿ automation ಉದ್ದೇಶಕ್ಕಾಗಿ `azd` ಅನ್ನು ಚಲಾಯಿಸಲು ಸಹಾಯ ಮಾಡುವ ಚರಗಳು

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

ಈ ವಿಭಾಗವು ನಿಯೋಜನೆಯ ವೇಳೆ ಬಳಸುವ ಪರಿಸರ ಚರಗಳನ್ನು ವಿವರಣೆಯೊಂದಿಗೆ ನಿರ್ದಿಷ್ಟಪಡಿಸುತ್ತದೆ:

- **Azure ಸಂಪನ್ಮೂಲ ಹೆಸರುಗಳು (ಸಾಲುಗಳು 51-60)**:
      - ಮೂಲ Azure ಸೇವೆ ಸಂಪನ್ಮೂಲ ಹೆಸರುಗಳು ಉದಾಹರಣೆಗೆ Resource Group, AI Hub, AI Project, ಇತ್ಯಾದಿ
- **ಫೀಚರ್ ಫ್ಲಾಗ್ಗಳು (ಸಾಲುಗಳು 61-63)**:
      - ನಿರ್ದಿಷ್ಟ Azure ಸೇವೆಗಳನ್ನು ಎನೆಬಲ್/ಡಿಸೇಬಲ್ ಮಾಡಲು ಬೂಲಿಯನ್ ಚರಗಳು
- **AI ಏಜೆಂಟ್ ಸಂರಚನೆ (ಸಾಲುಗಳು 64-71)**:
      - ಮುಖ್ಯ AI ಏಜೆಂಟ್ ಗಾಗಿ ಹೆಸರು, ID, ನಿಯೋಜನೆ ಸೆಟ್ಟಿಂಗ್‌ಗಳು, ಮಾದರಿ ವಿವರಗಳು ಮುಂತಾದವುಗಳ ಸಂರಚನೆ
- **AI ಎಂಬೆಡ್ ಸಂರಚನೆ (ಸಾಲುಗಳು 72-79)**:
      - ವೆಕ್ಟರ್ ಸರ್ಚ್‌ಗಾಗಿ ಬಳಸುವ ಎಂಬೆಡ್ಡಿಂಗ್ ಮಾದರಿಯ ಸಂರಚನೆ
- **ಸರ್ಚ್ ಮತ್ತು ಮಾನಿಟರಿಂಗ್ (ಸಾಲುಗಳು 80-84)**:
      - ಸರ್ಚ್ ಇಂಟೆಕ್ಸಲ್ ಹೆಸರು, ಅಸ್ತಿತ್ವದಲ್ಲಿರುವ ಸಂಪನ್ಮೂಲ ID ಗಳು ಮತ್ತು ಮಾನಿಟರಿಂಗ್/ಟ್ರೆಸುಗಳ ಸೆಟ್ಟಿಂಗ್ಗಳು

---

## 3. ಪರಿಸರ ಚರಗಳನ್ನು ತಿಳಿಯಿರಿ
ಈ ಕೆಳಗಿನ ಪರಿಸರ ಚರಗಳು ನಿಮ್ಮ ನಿಯೋಜನೆಯ ಸಂರಚನೆ ಮತ್ತು ಕಾರ್ಯಾಚರಣೆಯನ್ನು ನಿಯಂತ್ರಿಸುತ್ತವೆ, ಅವುಗಳನ್ನು ಅವರ ಪ್ರಾಥಮಿಕ ಉದ್ದೇಶದಿಂದ ವರ್ಗೀಕರಿಸಲಾಗಿದೆ. ಬಹುತೇಕ ಚರಗಳಿಗೆ ನಿರರ್ಥಕ ಡಿಫಾಲ್ಟ್‌ಗಳು ಇರುತ್ತವೆ, ಆದರೆ ನೀವು ಅವುಗಳನ್ನು ನಿಮ್ಮ ನಿರ್ದಿಷ್ಟ ಅವಶ್ಯಕತೆಗಳು ಅಥವಾ ಇತ್ತೀಚಿನ Azure ಸಂಪನ್ಮೂಲಗಳಿಗೆ ಹೊಂದಿಸಬಹುದು.

### 3.1 ಅಗತ್ಯವಿರುವ ಚರಗಳು 

```bash title="" linenums="0"
# ಅಜೂರ್ ಮೂಲ ಸಂರಚನೆ
AZURE_ENV_NAME                    # ವಾತಾವರಣದ ಹೆಸರು (ಸಂಪನ್ಮೂಲಗಳ ಹೆಸರಿಗಾಗಿ ಬಳಸಲಾಗುತ್ತದೆ)
AZURE_LOCATION                    # ಡಿಪ್ಲಾಯ್ ಮಾಡಲಿರುವ ಪ್ರದೇಶ
AZURE_SUBSCRIPTION_ID             # ಲಕ್ಷ್ಯ ಸಬ್‌ಸ್ಕ್ರಿಪ್ಷನ್
AZURE_RESOURCE_GROUP              # ಸಂಪನ್ಮೂಲ ಗುಂಪಿನ ಹೆಸರು
AZURE_PRINCIPAL_ID                # RBAC ಗಾಗಿ ಬಳಕೆದಾರ ಪ್ರಿನ್ಸಿಪಲ್

# ಸಂಪನ್ಮೂಲಗಳ ಹೆಸರുകൾ (ನಿರ್ದಿಷ್ಟವಾಗಿ ನೀಡದಿದ್ದರೆ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ರಚಿಸಲಾಗುತ್ತದೆ)
AZURE_AIHUB_NAME                  # Microsoft Foundry ಹಬ್ ಹೆಸರು
AZURE_AIPROJECT_NAME              # ಎಐ ಯೋಜನೆಯ ಹೆಸರು
AZURE_AISERVICES_NAME             # ಎಐ ಸೇವೆಗಳ ಖಾತೆಯ ಹೆಸರು
AZURE_STORAGE_ACCOUNT_NAME        # ಸಂಗ್ರಹ ಖಾತೆಯ ಹೆಸರು
AZURE_CONTAINER_REGISTRY_NAME     # ಕಂಟೇನರ್ ರೆಜಿಸ್ಟ್ರಿ ಹೆಸರು
AZURE_KEYVAULT_NAME               # ಕೀ ವಾಲ್ಟ್ ಹೆಸರು (ಬಳಸದಿದ್ದರೆ)
```

### 3.2 ಮಾದರಿ ಸಂರಚನೆ 
```bash title="" linenums="0"
# ಚಾಟ್ ಮಾದರಿ ಸಂರಚನೆ
AZURE_AI_AGENT_MODEL_NAME         # ನಿರ್ಧಾರಿತ: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # ನಿರ್ಧಾರಿತ: OpenAI (ಅಥವಾ Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # ನಿರ್ಧಾರಿತ: ಇತ್ತೀಚಿನ ಲಭ್ಯವಿರುವ
AZURE_AI_AGENT_DEPLOYMENT_NAME    # ಚಾಟ್ ಮಾದರಿಗಾಗಿ ನಿಯೋಜನೆ ಹೆಸರು
AZURE_AI_AGENT_DEPLOYMENT_SKU     # ನಿರ್ಧಾರಿತ: ಮಾನಕ
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # ನಿರ್ಧಾರಿತ: 80 (TPMನ ಸಾವಿರಗಳು)

# ಎಂಬೆಡಿಂಗ್ ಮಾದರಿ ಸಂರಚನೆ
AZURE_AI_EMBED_MODEL_NAME         # ನಿರ್ಧಾರಿತ: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # ನಿರ್ಧಾರಿತ: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # ನಿರ್ಧಾರಿತ: ಇತ್ತೀಚಿನ ಲಭ್ಯವಿರುವ
AZURE_AI_EMBED_DEPLOYMENT_NAME    # ಎಂಬೆಡಿಂಗ್‌ಗಳಿಗೆ ನಿಯೋಜನೆ ಹೆಸರು
AZURE_AI_EMBED_DEPLOYMENT_SKU     # ನಿರ್ಧಾರಿತ: ಮಾನಕ
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # ನಿರ್ಧಾರಿತ: 50 (TPMನ ಸಾವಿರಗಳು)

# ಏಜೆಂಟ್ ಸಂರಚನೆ
AZURE_AI_AGENT_NAME               # ಏಜೆಂಟ್ ಪ್ರದರ್ಶನ ಹೆಸರು
AZURE_EXISTING_AGENT_ID           # ಅಸ್ತಿತ್ವದಲ್ಲಿರುವ ಏಜೆಂಟ್ ಬಳಸಿ (ಐಚ್ಛಿಕ)
```

### 3.3 ವೈಶಿಷ್ಟ್ಯ ಟಾಗಲ್
```bash title="" linenums="0"
# ಐಚ್ಛಿಕ ಸೇವೆಗಳು
USE_APPLICATION_INSIGHTS         # ಡೀಫಾಲ್ಡ್: ನಿಜ
USE_AZURE_AI_SEARCH_SERVICE      # ಡೀಫಾಲ್ಟ್: ಅಸತ್ಯ
USE_CONTAINER_REGISTRY           # ಡೀಫಾಲ್ಟ್: ನಿಜ

# ನಿರೀಕ್ಷಣೆ ಮತ್ತು ಟ್ರೇಸಿಂಗ್
ENABLE_AZURE_MONITOR_TRACING     # ಡೀಫಾಲ್ಟ್: ಅಸತ್ಯ
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # ಡೀಫಾಲ್ಟ್: ಅಸತ್ಯ

# ಶೋಧನೆ ಸಂರಚನೆ
AZURE_AI_SEARCH_INDEX_NAME       # ಶೋಧನಾ ಸೂಚ್ಯಂಕದ ಹೆಸರು
AZURE_SEARCH_SERVICE_NAME        # ಶೋಧನಾ ಸೇವೆಯ ಹೆಸರು
```

### 3.4 AI ಪ್ರಾಜೆಕ್ಟ್ ಸಂರಚನೆ 
```bash title="" linenums="0"
# ಈಗಾಗಲೇ ಇರುವ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಬಳಸಿ
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # ಈಗಾಗಲೇ ಇರುವ AI ಯೋಜನೆಯ ಸಂಪೂರ್ಣ ಸಂಪನ್ಮೂಲ ID
AZURE_EXISTING_AIPROJECT_ENDPOINT       # ಈಗಾಗಲೇ ಇರುವ ಯೋಜನೆಯ ಎಂಡ್ಪಾಯಿಂಟ್ URL
```

### 3.5 ನಿಮ್ಮ ಚರಗಳನ್ನು ಪರಿಶೀಲಿಸಿ

Azure Developer CLI ಬಳಸಿಕೊಂಡು ನಿಮ್ಮ ಪರಿಸರ ಚರಗಳನ್ನು ವೀಕ್ಷಿಸಿ ಮತ್ತು ನಿರ್ವಹಿಸಿ:

```bash title="" linenums="0"
# ಪ್ರಸಕ್ತ ಪರಿಸರದ ಎಲ್ಲಾ ಪರಿಸರ ಚರಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd env get-values

# ನಿರ್ದಿಷ್ಟ ಪರಿಸರ ಚರವನ್ನು ಪಡೆಯಿರಿ
azd env get-value AZURE_ENV_NAME

# ಒಂದು ಪರಿಸರ ಚರವನ್ನು ಹೊಂದಿಸಿ
azd env set AZURE_LOCATION eastus

# .env ಫೈಲ್‌ನಿಂದ ಹಲವಾರು ಚರಗಳನ್ನು ಹೊಂದಿಸಿ
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ಈ ದಾಖಲೆ ಅನ್ನು AI ಭಾಷಾಂತರಣಾ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಕಾಯ್ದುಕೊಳ್ಳಲು ಪ್ರಯತ್ನಿಸಿದರೂ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸತ್ಯತೆಗಳಿರುವ ಸಂಭವವಿರುತ್ತದೆ ಎಂಬುದನ್ನು ದಯವಿಟ್ಟು ಗಮನದಲ್ಲಿಡಿ. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಾಖಲೆವೇ ಅಧಿಕೃತ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಭಾಷಾಂತರವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಹಿನ್ನೆಲೆ ಉಂಟಾಗುವ ಯಾವುದೇ ಅಸಮಜೇಶಗಳು ಅಥವಾ ತಪ್ಪಾಗಿ ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದಕ್ಕಾಗಿ ನಾವು ಜವಾಬ್ದಾರಿಯಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->