# 4. ಟೆಂಪ್ಲೇಟ್ ಅನ್ನು ಸಂರಚಿಸುವುದು

!!! tip "ಈ ಘಟಕದ ಅಂತ್ಯಕ್ಕೆ ನೀವು ಸಾಧ್ಯವಾಗುವುದು"

    - [ ] `azure.yaml` ಫೈಲ್‌ನ ಉದ್ದೇಶವನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
    - [ ] `azure.yaml` ಫೈಲ್‌ನ ರಚನೆಯನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
    - [ ] azd lifecycle `hooks` ನ ಮೌಲ್ಯವನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
    - [ ] **Lab 4:** ಪರಿಸರ ಚರಗಳನ್ನು ಅನ್ವೇಷಿಸಿ ಮತ್ತು ಬದಲಾಯಿಸಿ

---

!!! prompt "`azure.yaml` ಫೈಲ್ ಏನು ಮಾಡುತ್ತದೆ? ಕೋಡ್ ಫೆನ್ಸ್ ಬಳಸಿ ಮತ್ತು ಅದನ್ನು ಸಾಲು-ನಿರಂತರವಾಗಿ ವಿವರಿಸಿ"

      The `azure.yaml` file is the **configuration file for Azure Developer CLI (azd)**. It defines how your application should be deployed to Azure, including infrastructure, services, deployment hooks, and environment variables.

---

## 1. ಉದ್ದೇಶ ಮತ್ತು ಕಾರ್ಯವೈಶಿಷ್ಟ್ಯಗಳು

ಈ `azure.yaml` ಫೈಲ್ ಒಂದು AI ಏಜೆಂಟ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಾಗಿ **ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಬ್ಲೂಪ್ರಿಂಟ್** ಆಗಿ ಸೇವೆ ಸಲ್ಲಿಸುತ್ತದೆ, ಇದು:

1. **ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗಿಂತ ಮುಂಚೆ** ಪರಿಸರವನ್ನು ಮಾನ್ಯಗೊಳಿಸುತ್ತದೆ
2. **Azure AI ಸೇವೆಗಳನ್ನು ಸಿದ್ಧಪಡಿಸುತ್ತದೆ** (AI Hub, AI Project, Search ಇತ್ಯಾದಿ)
3. **Python ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು** Azure Container Apps ಗೆ ಡಿಪ್ಲಾಯ್ ಮಾಡುತ್ತದೆ
4. ಚಾಟ್ ಮತ್ತು ಎಂಬರ್‌ಡಿಂಗ್ ಕಾರ್ಯಕ್ಷಮತೆಯಿಗಾಗಿ **AI ಮಾದರಿಗಳನ್ನು ಸಂರಚಿಸುತ್ತದೆ**
5. AI ಅಪ್ಲಿಕೇಶನ್‌ಗಾಗಿ **ಮನಿಟರಿಂಗ್ ಮತ್ತು ಟ್ರೇಸಿಂಗ್** ಅನ್ನು ಸಿದ್ಧಪಡಿಸುತ್ತದೆ
6. ಹೊಸ ಹಾಗೂ ಅಸ್ತಿತ್ವದಲ್ಲಿರುವ Azure AI ಪ್ರಾಜೆಕ್ಟ್ ಸನ್ನಿವೇಶಗಳನ್ನು **ಎರಡನ್ನುಲೂ** ನಿರ್ವಹಿಸುತ್ತದೆ

ಈ ಫೈಲ್ ಸರಿಯಾದ ಮಾನ್ಯತೆ, ಪ್ರಾವೀಣೆ (provisioning), ಮತ್ತು ಪೋಸ್ಟ್-ಡಿಪ್ಲಾಯ್ ಸಂರಚನೆಯೊಂದಿಗೆ ಸಂಪೂರ್ಣ AI ಏಜೆಂಟ್ ಪರಿಹಾರವನ್ನು ಒಂದೇ ಆಜ್ಞೆಯಿಂದ (`azd up`) ಡಿಪ್ಲಾಯ್ ಮಾಡಲು ಅವಕಾಶ ನೀಡುತ್ತದೆ.

??? info "ವಿಸ್ತರಿಸಲು ನೋಡುವಿರಿ: `azure.yaml`"

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

## 2. ಫೈಲ್ ಅನ್ನು ವಿವರಿಸುವುದು

ನಾವು ಫೈಲ್ ಅನ್ನು ವಿಭಾಗವಾಗಿ ಒಂದು ಒಂದೋಡಿ ಪರಿಶೀಲಿಸಿ, ಅದು ಏನು ಮಾಡುತ್ತದೆ ಮತ್ತು ಯಾಕೆ ಎಂಬುದನ್ನು ಅರ್ಥಮಾಡ್ಕೋಣ.

### 2.1 **ಹೆಡರ್ ಮತ್ತು ಸ್ಕೀಮಾ (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Line 1**: IDE ಬೆಂಬಲ ಮತ್ತು IntelliSense ಗಾಗಿ YAML ಭಾಷೆ ಸರ್ವರ್ ಸ್ಕೀಮಾ ಮಾನ್ಯತೆಯನ್ನು ಒದಗಿಸುತ್ತದೆ

### 2.2 ಪ್ರಾಜೆಕ್ಟ್ ಮೆಟಾಡೇಟಾ (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Line 5**: Azure Developer CLI ಬಳಸದ ಪ್ರಾಜೆಕ್ಟ್ ಹೆಸರನ್ನು ವ್ಯಾಖ್ಯಾನಿಸುತ್ತದೆ
- **Lines 6-7**: ಇದು ಟೆಂಪ್ಲೇಟ್ ಆಧಾರಿತವಾಗಿದ್ದು ಆವೃತ್ತಿ 1.0.2 ಅನ್ನು ಸೂಚಿಸುತ್ತದೆ
- **Lines 8-9**: Azure Developer CLI ಆವೃತ್ತಿ 1.14.0 ಅಥವಾ ಹೆಚ್ಚಿನದನ್ನು ಅಗತ್ಯವಿಡುತ್ತದೆ

### 2.3 ಡಿಪ್ಲಾಯ್ ಹುಕ್‌ಗಳು (11-40)

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

- **Lines 11-20**: **ಪ್ರಿ-ಡಿಪ್ಲಾಯ್ ಹುಕ್** - `azd up` ಗಿಂತ ಮೊದಲು ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತದೆ

      - ಯುನಿಕ್ಸ್/ಲಿನಕ್ಸ್‌ನಲ್ಲಿ: ಮಾನ್ಯತೆ ಸ್ಕ್ರಿಪ್ಟ್‌ಗೆ ಕಾರ್ಯಗತ ಅನುಮತಿ ನೀಡುವುದಾಗಿ ಮತ್ತು ಅದನ್ನು ಚಲಾಯಿಸುತ್ತದೆ
      - ವಿಂಡೋಸ್‌ನಲ್ಲಿ: PowerShell ಮಾನ್ಯತೆ ಸ್ಕ್ರಿಪ್ಟ್ ಅನ್ನು ನಡೆಸುತ್ತದೆ
      - ಎರಡೂ ಇಂಟರಾಕ್ಟಿವ್ ಆಗಿದ್ದು, ವಿಫಲವಾದರೆ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ನಿಲ್ಲಿಸುತ್ತದೆ

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
- **Lines 21-30**: **ಪೋಸ್ಟ್-ಪ್ರೊವಿಷನ್ ಹುಕ್** - Azure ಸಂಪನ್ಮೂಲಗಳು ಸೃಷ್ಟಿಯಾದ ನಂತರ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತದೆ

  - ಪರಿಸರ ಚರಗಳನ್ನು ಬರೆಯುವ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳನ್ನು ನಿರ್ವಹಿಸುತ್ತದೆ
  - ಈ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು ವಿಫಲವಾದರೂ (`continueOnError: true`) ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಮುಂದುವರೆಯುತ್ತದೆ

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
- **Lines 31-40**: **ಪೋಸ್ಟ್-ಡಿಪ್ಲಾಯ್ ಹುಕ್** - ಅಪ್ಲಿಕೇಶನ್ ಡಿಪ್ಲಾಯ್ ಆದ ನಂತರ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತದೆ

  - ಅಂತಿಮ ಸಿದ್ಧತೆ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳನ್ನು ನಿರ್ವಹಿಸುತ್ತದೆ
  - ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು ವಿಫಲವಾದರೂ ಮುಂದುವರಿಯುತ್ತದೆ

### 2.4 ಸೇವೆ ಸಂರಚನೆ (41-48)

ಇದು ನೀವು ಡಿಪ್ಲಾಯ್ ಮಾಡುತ್ತಿರುವ ಅಪ್ಲಿಕೇಶನ್ ಸೇವೆಯನ್ನು ಸಂರಚಿಸುತ್ತದೆ.

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

- **Line 42**: "api_and_frontend" ಎಂಬ ಹೆಸರಿನ ಸೇವೆಯನ್ನು ವ್ಯಾಖ್ಯಾನಿಸುತ್ತದೆ
- **Line 43**: ಮೂಲಕೋಡ್‌ಗಾಗಿ `./src` ಡೈರೆಕ್ಟರಿಯನ್ನು ಸೂಚಿಸುತ್ತದೆ
- **Line 44**: ಪ್ರೋಗ್ರಾಮಿಂಗ್ ಭಾಷೆಯಾಗಿ Python ಅನ್ನು ನಿರ್ದಿಷ್ಟಗೊಳಿಸುತ್ತದೆ
- **Line 45**: ಹೋಸ್ಟಿಂಗ್ ವೇದಿಕೆಗಾಗಿ Azure Container Apps ಅನ್ನು ಬಳಸುತ್ತದೆ
- **Lines 46-48**: Docker ಸಂರಚನೆ

      - "api_and_frontend" ಅನ್ನು ಇಮೇಜ್ ಹೆಸರಾಗಿ ಬಳಸುತ್ತದೆ
      - Docker ಇಮೇಜ್ ಅನ್ನು Azure ನಲ್ಲಿ ದೂರಸ್ಥವಾಗಿ ನಿರ್ಮಿಸುತ್ತದೆ (ಸ್ಥಳೀಯವಾಗಿ ಅಲ್ಲ)

### 2.5 ಪೈಪ್‌ಲೈನ್ ಪರಿಸರ ಚರಗಳು (49-76)

ಇವು automation ಗಾಗಿ CI/CD ಪೈಪ್‌ಲೈನ್‌ಗಳಲ್ಲಿ `azd` ಅನ್ನು ಚಲಾಯಿಸಲು ಸಹಾಯ ಮಾಡುವ ಚರಗಳು.

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

ಈ ವಿಭಾಗವು ನಿಯುಕ್ತಿಯಾವಾಗುವ ಸಂದರ್ಭದಲ್ಲಿ ಬಳಕೆಯಾದ ಪರಿಸರ ಚರಗಳನ್ನು ವರ್ಗೀಕರಿಸಿಕೊಂಡು ವ್ಯಾಖ್ಯಾನಿಸುತ್ತದೆ:

- **Azure ಸಂಪನ್ಮೂಲ ಹೆಸರುಗಳು (Lines 51-60)**:
      - ಮೂಲ Azure ಸೇವೆಗಳ ಸಂಪನ್ಮೂಲ ಹೆಸರುಗಳು ಉದಾ: Resource Group, AI Hub, AI Project ಇತ್ಯಾದಿ
- **ವೈಶಿಷ್ಟ್ಯ ಫ್ಲಾಗ್‌ಗಳು (Lines 61-63)**:
      - ನಿರ್ದಿಷ್ಟ Azure ಸೇವೆಗಳನ್ನು ಸಕ್ರಿಯ/ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಲು ಬೂಲಿಯನ್ ವ್ಯರಿಯಬಲ್ಸ್
- **AI ಏಜೆಂಟ್ ಸಂರಚನೆ (Lines 64-71)**:
      - ಮುಖ್ಯ AI ಏಜೆಂಟ್‌ಗೆ ಸಂಬಂಧಿಸಿದ ಕಾನ್ಫಿಗರ್‌ಗಳು: ಹೆಸರು, ID, ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಸೆಟ್ಟಿಂಗ್ಸ್, ಮಾದರಿ ವಿವರಗಳು
- **AI ಎಂಬರ್‌ಡಿಂಗ್ ಸಂರಚನೆ (Lines 72-79)**:
      - ವೆಕ್ಟರ್ ಸರ್ಚ್‌ಗೆ ಬಳಸಲಾಗುವ ಎಂಬರ್‌ಡಿಂಗ್ ಮಾದರಿಗಾಗಿ ಸೆಟ್ಟಿಂಗ್ಸ್
- **ಸರ್ಚ್ ಮತ್ತು ಮಾನಿಟರಿಂಗ್ (Lines 80-84)**:
      - ಸರ್ಚ್ ಇಂಡೆಕ್ಸಿನ ಹೆಸರು, ಅಸ್ತಿತ್ವದಲ್ಲಿರುವ ಸಂಪನ್ಮೂಲ IDಗಳು, ಮತ್ತು ಮಾನಿಟರಿಂಗ್/ಟ್ರೇಸಿಂಗ್ ಸೆಟ್ಟಿಂಗ್ಸ್

---

## 3. ಪರಿಸರ ಚರಗಳನ್ನು ತಿಳಿದುಕೊಳ್ಳಿ
ಕೆಳಗಿನ ಪರಿಸರ ಚರಗಳು ನಿಮ್ಮ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ನ ಸಂರಚನೆ ಮತ್ತು ವರ್ತನೆಯನ್ನು ನಿಯಂತ್ರಿಸುತ್ತವೆ, ಅವುಗಳನ್ನು ಅವರ ಪ್ರಮುಖ ಉದ್ದೇಶದ ಪ್ರಕಾರ ಸಂಘಟಿಸಲಾಗಿದೆ. ಬಹುಮಾನವಾದ ಚರಗಳಿಗೆ ಸಾಮಾನ್ಯವಾಗಿ ಯುಕ್ತಿಯುತ ಡೀಫಾಲ್ಟ್ ಮೌಲ್ಯಗಳಿರುತ್ತವೆ, ಆದರೆ ನೀವು ನಿಮ್ಮ ನಿರ್ದಿಷ್ಟ ಅವಶ್ಯಕತೆಗಳು ಅಥವಾ ಅಸ್ತಿತ್ವದಲ್ಲಿರುವ Azure ಸಂಪನ್ಮೂಲಗಳಿಗೆ ಹೊಂದಿಕೊಳ್ಳಲು ಅವನ್ನು ಕಸ್ಟಮೈಸ್ ಮಾಡಬಹುದು.

### 3.1 ಅಗತ್ಯವಾದ ಚರಗಳು 

```bash title="" linenums="0"
# ಕೋರ್ ಆಜೂರ್ ಸಂರಚನೆ
AZURE_ENV_NAME                    # ಪರಿಸರದ ಹೆಸರು (ಸಂಪನ್ಮೂಲಗಳ ಹೆಸರಿನಲ್ಲಿ ಬಳಕೆಯಾಗುತ್ತದೆ)
AZURE_LOCATION                    # ನಿಯೋಜನೆ ಪ್ರದೇಶ
AZURE_SUBSCRIPTION_ID             # ಗುರಿ ಸಬ್ಸ್ಕ್ರಿಪ್ಶನ್
AZURE_RESOURCE_GROUP              # ಸಂಪನ್ಮೂಲ ಗುಂಪಿನ ಹೆಸರು
AZURE_PRINCIPAL_ID                # RBAC ಗಾಗಿ ಬಳಕೆದಾರ ಪ್ರಿನ್ಸಿಪಲ್

# ಸಂಪನ್ಮೂಲಗಳ ಹೆಸರುಗಳು (ನಿರ್ದಿಷ್ಟಪಡಿಸಲಿಲ್ಲದಿದ್ದರೆ ಸ್ವಯಂ-ಉತ್ಪಾದಿತವಾಗುತ್ತವೆ)
AZURE_AIHUB_NAME                  # Microsoft Foundry ಹಬ್‌ನ ಹೆಸರು
AZURE_AIPROJECT_NAME              # AI ಯೋಜನೆಯ ಹೆಸರು
AZURE_AISERVICES_NAME             # AI ಸೇವೆಗಳ ಖಾತೆ ಹೆಸರು
AZURE_STORAGE_ACCOUNT_NAME        # ಸಂಗ್ರಹ ಖಾತೆಯ ಹೆಸರು
AZURE_CONTAINER_REGISTRY_NAME     # ಕಂಟೈನರ್ ರಿಜಿಸ್ಟ್ರಿ ಹೆಸರು
AZURE_KEYVAULT_NAME               # ಕೀ ವಾಲ್ಟ್ ಹೆಸರು (ಬಳಸಿದರೆ)
```

### 3.2 ಮಾದರಿ ಸಂರಚನೆ 
```bash title="" linenums="0"
# ಚಾಟ್ ಮಾದರಿ ಸಂರಚನೆ
AZURE_AI_AGENT_MODEL_NAME         # ಡೀಫಾಲ್ಟ್: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # ಡೀಫಾಲ್ಟ್: OpenAI (ಅಥವಾ Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # ಡೀಫಾಲ್ಟ್: ಲಭ್ಯವಿರುವ ಇತ್ತೀಚಿನ ಆವೃತ್ತಿ
AZURE_AI_AGENT_DEPLOYMENT_NAME    # ಚಾಟ್ ಮಾದರಿಗಾಗಿ ನಿಯೋಜನೆಯ ಹೆಸರು
AZURE_AI_AGENT_DEPLOYMENT_SKU     # ಡೀಫಾಲ್ಟ್: ಸ್ಟ್ಯಾಂಡರ್ಡ್
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # ಡೀಫಾಲ್ಟ್: 80 (TPM ನಲ್ಲಿ ಸಾವಿರಗಳು)

# ಎಂಬೆಡ್ಡಿಂಗ್ ಮಾದರಿ ಸಂರಚನೆ
AZURE_AI_EMBED_MODEL_NAME         # ಡೀಫಾಲ್ಟ್: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # ಡೀಫಾಲ್ಟ್: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # ಡೀಫಾಲ್ಟ್: ಲಭ್ಯವಿರುವ ಇತ್ತೀಚಿನ ಆವೃತ್ತி
AZURE_AI_EMBED_DEPLOYMENT_NAME    # ಎಂಬೆಡ್ಡಿಂಗ್‌ಗಳಿಗಾಗಿ ನಿಯೋಜನೆಯ ಹೆಸರು
AZURE_AI_EMBED_DEPLOYMENT_SKU     # ಡೀಫಾಲ್ಟ್: ಸ್ಟ್ಯಾಂಡರ್ಡ್
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # ಡೀಫಾಲ್ಟ್: 50 (TPM ನಲ್ಲಿ ಸಾವಿರಗಳು)

# ಏಜೆಂಟ್ ಸಂರಚನೆ
AZURE_AI_AGENT_NAME               # ಏಜೆಂಟ್ ಪ್ರದರ್ಶನದ ಹೆಸರು
AZURE_EXISTING_AGENT_ID           # ಲಭ್ಯವಿರುವ ಏಜೆಂಟ್ ಅನ್ನು ಬಳಸಿ (ಐಚ್ಛಿಕ)
```

### 3.3 ವೈಶಿಷ್ಟ್ಯ ಟಾಗಲ್
```bash title="" linenums="0"
# ಐಚ್ಛಿಕ ಸೇವೆಗಳು
USE_APPLICATION_INSIGHTS         # ಡೀಫಾಲ್ಟ್: ನಿಜ
USE_AZURE_AI_SEARCH_SERVICE      # ಡೀಫಾಲ್ಟ್: ಅಸತ್ಯ
USE_CONTAINER_REGISTRY           # ಡೀಫಾಲ್ಟ್: ನಿಜ

# ನಿಗಾ ಮತ್ತು ಅನುಕ್ರಮಣ
ENABLE_AZURE_MONITOR_TRACING     # ಡೀಫಾಲ್ಟ್: ಅಸತ್ಯ
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # ಡೀಫಾಲ್ಟ್: ಅಸತ್ಯ

# ಹುಡುಕು ಸಂರಚನೆ
AZURE_AI_SEARCH_INDEX_NAME       # ಹುಡುಕು ಸೂಚ್ಯಂಕದ ಹೆಸರು
AZURE_SEARCH_SERVICE_NAME        # ಹುಡುಕು ಸೇವೆಯ ಹೆಸರು
```

### 3.4 AI ಪ್ರಾಜೆಕ್ಟ್ ಸಂರಚನೆ 
```bash title="" linenums="0"
# ಅಸ್ತಿತ್ವದಲ್ಲಿರುವ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಬಳಸಿ
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # ಅಸ್ತಿತ್ವದಲ್ಲಿರುವ AI ಯೋಜನೆಯ ಸಂಪೂರ್ಣ ಸಂಪನ್ಮೂಲ ID
AZURE_EXISTING_AIPROJECT_ENDPOINT       # ಅಸ್ತಿತ್ವದಲ್ಲಿರುವ ಯೋಜನೆಯ ಎಂಡ್‌ಪಾಯಿಂಟ್ URL
```

### 3.5 ನಿಮ್ಮ ಚರಗಳನ್ನು ಪರಿಶೀಲಿಸಿ

Azure Developer CLI ಬಳಸಿ ನಿಮ್ಮ ಪರಿಸರ ಚರಗಳನ್ನು ವೀಕ್ಷಿಸಲು ಮತ್ತು ನಿರ್ವಹಿಸಲು:

```bash title="" linenums="0"
# ಪ್ರಸ್ತುತ ಪರಿಸರದ ಎಲ್ಲಾ ಪರಿಸರ ಚರಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd env get-values

# ನಿರ್ದಿಷ್ಟ ಪರಿಸರ ಚರವನ್ನು ಪಡೆಯಿರಿ
azd env get-value AZURE_ENV_NAME

# ಒಂದು ಪರಿಸರ ಚರವನ್ನು ಸೆಟ್ ಮಾಡಿ
azd env set AZURE_LOCATION eastus

# .env ಫೈಲ್‌ನಿಂದ ಹಲವಾರು ಚರಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ನಿರಾಕರಣೆ:
ಈ ದಾಖಲೆ AI ಅನuvad ಸೇವೆ Co-op Translator (https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನuvadಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಗೆ ಪ್ರಯತ್ನಿಸಿದರೂ ಸಹ, ಸ್ವಯಂಚಾಲಿತ ಅನuvadಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ತಪ್ಪು ಮಾಹಿತಿಗಳು ಇರಬಹುದೆಂದು ದಯವಿಟ್ಟು ಗಮನವಿಡಿ. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಾಖಲೆವನ್ನು ಅಧಿಕೃತ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನuvadವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನuvadದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ಅಸಮಂಜಸ್ಯತೆಗಳು ಅಥವಾ ತಪ್ಪಾಗಿ ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವ ಪರಿಣಾಮಗಳಿಗಾಗಿ ನಾವು ಜವಾಬ್ದಾರರಾಗುವುದಿಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->