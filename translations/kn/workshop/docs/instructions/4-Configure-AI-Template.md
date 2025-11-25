<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b4a16f82d68f5820d574acd8946843e4",
  "translation_date": "2025-11-24T22:25:22+00:00",
  "source_file": "workshop/docs/instructions/4-Configure-AI-Template.md",
  "language_code": "kn"
}
-->
# 4. ಟೆಂಪ್ಲೇಟ್ ಅನ್ನು ಸಂರಚಿಸಿ

!!! tip "ಈ ಘಟಕದ ಅಂತ್ಯದ ವೇಳೆಗೆ ನೀವು ಮಾಡಬಲ್ಲಿರಿ"

    - [ ] `azure.yaml` ಫೈಲ್‌ನ ಉದ್ದೇಶವನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
    - [ ] `azure.yaml` ಫೈಲ್‌ನ ರಚನೆಯನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
    - [ ] azd ಲೈಫ್ಸೈಕಲ್ `hooks`ಗಳ ಮೌಲ್ಯವನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
    - [ ] **ಲ್ಯಾಬ್ 3:**

---

!!! prompt "`azure.yaml` ಫೈಲ್ ಏನು ಮಾಡುತ್ತದೆ? ಕೋಡ್‌ಫೆನ್ಸ್ ಬಳಸಿ ಮತ್ತು ಅದನ್ನು ಸಾಲು-ಸಾಲಾಗಿ ವಿವರಿಸಿ"

      `azure.yaml` ಫೈಲ್ **Azure Developer CLI (azd)**ಗೆ ಸಂರಚನಾ ಫೈಲ್ ಆಗಿದೆ. ಇದು ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು Azureಗೆ ಹೇಗೆ ಡಿಪ್ಲಾಯ್ ಮಾಡಬೇಕು ಎಂಬುದನ್ನು ವ್ಯಾಖ್ಯಾನಿಸುತ್ತದೆ, ಇದರಲ್ಲಿ ಮೂಲಸೌಕರ್ಯ, ಸೇವೆಗಳು, ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಹುಕ್ಸ್ ಮತ್ತು ಪರಿಸರ ವ್ಯತ್ಯಾಸಗಳು ಸೇರಿವೆ.

---

## 1. ಉದ್ದೇಶ ಮತ್ತು ಕಾರ್ಯಕ್ಷಮತೆ

ಈ `azure.yaml` ಫೈಲ್ AI ಏಜೆಂಟ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಾಗಿ **ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಬ್ಲೂಪ್ರಿಂಟ್** ಆಗಿ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತದೆ, ಇದು:

1. ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗೂ ಮುನ್ನ **ಪರಿಸರವನ್ನು ಪರಿಶೀಲಿಸುತ್ತದೆ**
2. **Azure AI ಸೇವೆಗಳನ್ನು ಒದಗಿಸುತ್ತದೆ** (AI Hub, AI Project, Search, ಇತ್ಯಾದಿ)
3. **Python ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು** Azure Container Apps ಗೆ ಡಿಪ್ಲಾಯ್ ಮಾಡುತ್ತದೆ
4. **ಚಾಟ್ ಮತ್ತು ಎಂಬೆಡಿಂಗ್ ಕಾರ್ಯಕ್ಷಮತೆಯ** AI ಮಾದರಿಗಳನ್ನು ಸಂರಚಿಸುತ್ತದೆ
5. AI ಅಪ್ಲಿಕೇಶನ್‌ಗಾಗಿ **ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಟ್ರೇಸಿಂಗ್ ಅನ್ನು ಸೆಟ್ ಅಪ್ ಮಾಡುತ್ತದೆ**
6. **ಹೊಸ ಮತ್ತು ಇತ್ತೀಚಿನ** Azure AI ಪ್ರಾಜೆಕ್ಟ್ ಸನ್ನಿವೇಶಗಳನ್ನು ನಿರ್ವಹಿಸುತ್ತದೆ

ಈ ಫೈಲ್ **ಒಂದು ಕಮಾಂಡ್ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್** (`azd up`) ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸುತ್ತದೆ, ಇದು ಸರಿಯಾದ ಪರಿಶೀಲನೆ, ಒದಗಿಸುವಿಕೆ ಮತ್ತು ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ನಂತರದ ಸಂರಚನೆಯೊಂದಿಗೆ ಸಂಪೂರ್ಣ AI ಏಜೆಂಟ್ ಪರಿಹಾರವನ್ನು ಒದಗಿಸುತ್ತದೆ.

??? info "`azure.yaml` ವೀಕ್ಷಿಸಲು ವಿಸ್ತರಿಸಿ"

      `azure.yaml` ಫೈಲ್ Azure Developer CLI ಈ AI ಏಜೆಂಟ್ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು Azureನಲ್ಲಿ ಹೇಗೆ ಡಿಪ್ಲಾಯ್ ಮತ್ತು ನಿರ್ವಹಿಸಬೇಕು ಎಂಬುದನ್ನು ವ್ಯಾಖ್ಯಾನಿಸುತ್ತದೆ. ಅದನ್ನು ಸಾಲು-ಸಾಲಾಗಿ ವಿಭಜಿಸೋಣ.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: ನಮಗೆ hooks ಬೇಕೇ?
      # TODO: ನಮಗೆ ಎಲ್ಲಾ ವ್ಯತ್ಯಾಸಗಳು ಬೇಕೇ?

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

## 2. ಫೈಲ್ ಅನ್ನು ವಿಭಜಿಸುವುದು

ಫೈಲ್‌ನ ಪ್ರತಿ ವಿಭಾಗವನ್ನು ನೋಡೋಣ, ಅದು ಏನು ಮಾಡುತ್ತದೆ ಮತ್ತು ಏಕೆ.

### 2.1 **ಹೆಡರ್ ಮತ್ತು ಸ್ಕೀಮಾ (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **ಸಾಲು 1**: YAML ಭಾಷಾ ಸರ್ವರ್ ಸ್ಕೀಮಾ ಮಾನ್ಯತೆ IDE ಬೆಂಬಲ ಮತ್ತು IntelliSenseಗಾಗಿ ಒದಗಿಸುತ್ತದೆ

### 2.2 ಪ್ರಾಜೆಕ್ಟ್ ಮೆಟಾಡೇಟಾ (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **ಸಾಲು 5**: Azure Developer CLI ಬಳಸುವ ಪ್ರಾಜೆಕ್ಟ್ ಹೆಸರನ್ನು ವ್ಯಾಖ್ಯಾನಿಸುತ್ತದೆ
- **ಸಾಲು 6-7**: ಇದು ಟೆಂಪ್ಲೇಟ್ ಆಧಾರಿತವಾಗಿದೆ ಮತ್ತು ಆವೃತ್ತಿ 1.0.2 ಅನ್ನು ಸೂಚಿಸುತ್ತದೆ
- **ಸಾಲು 8-9**: Azure Developer CLI ಆವೃತ್ತಿ 1.14.0 ಅಥವಾ ಹೆಚ್ಚಿನದನ್ನು ಅಗತ್ಯವಿದೆ

### 2.3 ಡಿಪ್ಲಾಯ್ ಹುಕ್ಸ್ (11-40)

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

- **ಸಾಲು 11-20**: **ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗೂ ಮುನ್ನದ ಹುಕ್** - `azd up`ಗೆ ಮುನ್ನ ಚಲಿಸುತ್ತದೆ

      - ಯುನಿಕ್ಸ್/ಲಿನಕ್ಸ್‌ನಲ್ಲಿ: ಮಾನ್ಯತೆ ಸ್ಕ್ರಿಪ್ಟ್ ಅನ್ನು ಕಾರ್ಯನಿರ್ವಹಿಸಬಹುದಾದಂತೆ ಮಾಡುತ್ತದೆ ಮತ್ತು ಅದನ್ನು ಚಲಿಸುತ್ತದೆ
      - ವಿಂಡೋಸ್‌ನಲ್ಲಿ: ಪವರ್‌ಶೆಲ್ ಮಾನ್ಯತೆ ಸ್ಕ್ರಿಪ್ಟ್ ಅನ್ನು ಚಲಿಸುತ್ತದೆ
      - ಎರಡೂ ಪರಸ್ಪರ ಕ್ರಿಯಾತ್ಮಕವಾಗಿದ್ದು, ವಿಫಲವಾದರೆ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ನಿಲ್ಲುತ್ತದೆ

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
- **ಸಾಲು 21-30**: **ಪೋಸ್ಟ್-ಪ್ರೊವಿಷನ್ ಹುಕ್** - Azure ಸಂಪತ್ತುಗಳನ್ನು ರಚಿಸಿದ ನಂತರ ಚಲಿಸುತ್ತದೆ

  - ಪರಿಸರ ವ್ಯತ್ಯಾಸಗಳನ್ನು ಬರೆಯುವ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳನ್ನು ಚಲಿಸುತ್ತದೆ
  - ಈ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು ವಿಫಲವಾದರೂ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಮುಂದುವರಿಯುತ್ತದೆ (`continueOnError: true`)

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
- **ಸಾಲು 31-40**: **ಪೋಸ್ಟ್-ಡಿಪ್ಲಾಯ್ ಹುಕ್** - ಅಪ್ಲಿಕೇಶನ್ ಡಿಪ್ಲಾಯ್ ಆದ ನಂತರ ಚಲಿಸುತ್ತದೆ

  - ಅಂತಿಮ ಸೆಟ್‌ಅಪ್ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳನ್ನು ಚಲಿಸುತ್ತದೆ
  - ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು ವಿಫಲವಾದರೂ ಮುಂದುವರಿಯುತ್ತದೆ

### 2.4 ಸೇವಾ ಸಂರಚನೆ (41-48)

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

- **ಸಾಲು 42**: "api_and_frontend" ಎಂಬ ಸೇವೆಯನ್ನು ವ್ಯಾಖ್ಯಾನಿಸುತ್ತದೆ
- **ಸಾಲು 43**: ಮೂಲ ಕೋಡ್‌ಗಾಗಿ `./src` ಡೈರೆಕ್ಟರಿಯನ್ನು ಸೂಚಿಸುತ್ತದೆ
- **ಸಾಲು 44**: Python ಅನ್ನು ಪ್ರೋಗ್ರಾಮಿಂಗ್ ಭಾಷೆಯಾಗಿ ನಿರ್ದಿಷ್ಟಪಡಿಸುತ್ತದೆ
- **ಸಾಲು 45**: Azure Container Apps ಅನ್ನು ಹೋಸ್ಟಿಂಗ್ ವೇದಿಕೆಯಾಗಾಗಿ ಬಳಸುತ್ತದೆ
- **ಸಾಲು 46-48**: ಡಾಕರ್ ಸಂರಚನೆ

      - "api_and_frontend" ಅನ್ನು ಇಮೇಜ್ ಹೆಸರಾಗಿ ಬಳಸುತ್ತದೆ
      - ಡಾಕರ್ ಇಮೇಜ್ ಅನ್ನು Azureನಲ್ಲಿ ದೂರಸ್ಥವಾಗಿ ನಿರ್ಮಿಸುತ್ತದೆ (ಸ್ಥಳೀಯವಾಗಿ ಅಲ್ಲ)

### 2.5 ಪೈಪ್‌ಲೈನ್ ವ್ಯತ್ಯಾಸಗಳು (49-76)

ಇವು ಸ್ವಯಂಚಾಲಿತಕ್ಕಾಗಿ `azd` ಅನ್ನು CI/CD ಪೈಪ್‌ಲೈನ್‌ಗಳಲ್ಲಿ ಚಲಿಸಲು ಸಹಾಯ ಮಾಡುವ ವ್ಯತ್ಯಾಸಗಳಾಗಿವೆ

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

ಈ ವಿಭಾಗವು **ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಸಮಯದಲ್ಲಿ** ಬಳಸುವ ಪರಿಸರ ವ್ಯತ್ಯಾಸಗಳನ್ನು ವ್ಯಾಖ್ಯಾನಿಸುತ್ತದೆ, ಅವುಗಳನ್ನು ವರ್ಗದ ಪ್ರಕಾರ ಆಯೋಜಿಸಲಾಗಿದೆ:

- **Azure ಸಂಪತ್ತು ಹೆಸರುಗಳು (ಸಾಲು 51-60)**:
      - ಮೂಲ Azure ಸೇವಾ ಸಂಪತ್ತು ಹೆಸರುಗಳು, ಉದಾ: Resource Group, AI Hub, AI Project, ಇತ್ಯಾದಿ
- **ಫೀಚರ್ ಫ್ಲ್ಯಾಗ್‌ಗಳು (ಸಾಲು 61-63)**:
      - ನಿರ್ದಿಷ್ಟ Azure ಸೇವೆಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಲು/ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಲು ಬೂಲಿಯನ್ ವ್ಯತ್ಯಾಸಗಳು
- **AI ಏಜೆಂಟ್ ಸಂರಚನೆ (ಸಾಲು 64-71)**:
      - ಮುಖ್ಯ AI ಏಜೆಂಟ್‌ಗಾಗಿ ಸಂರಚನೆ, ಇದರಲ್ಲಿ ಹೆಸರು, ID, ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳು, ಮಾದರಿ ವಿವರಗಳು
- **AI ಎಂಬೆಡಿಂಗ್ ಸಂರಚನೆ (ಸಾಲು 72-79)**:
      - ವೆಕ್ಟರ್ ಶೋಧಕ್ಕಾಗಿ ಬಳಸುವ ಎಂಬೆಡಿಂಗ್ ಮಾದರಿಯ ಸಂರಚನೆ
- **ಶೋಧ ಮತ್ತು ಮಾನಿಟರಿಂಗ್ (ಸಾಲು 80-84)**:
      - ಶೋಧ ಸೂಚಿ ಹೆಸರು, ಇತ್ತೀಚಿನ ಸಂಪತ್ತು IDಗಳು, ಮತ್ತು ಮಾನಿಟರಿಂಗ್/ಟ್ರೇಸಿಂಗ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳು

---

## 3. ಪರಿಸರ ವ್ಯತ್ಯಾಸಗಳನ್ನು ತಿಳಿಯಿರಿ
ನಿಮ್ಮ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ನ ಸಂರಚನೆ ಮತ್ತು ವರ್ತನೆಯನ್ನು ನಿಯಂತ್ರಿಸುವ ಈ ಪರಿಸರ ವ್ಯತ್ಯಾಸಗಳು, ಅವುಗಳ ಪ್ರಾಥಮಿಕ ಉದ್ದೇಶದ ಪ್ರಕಾರ ಆಯೋಜಿಸಲಾಗಿದೆ. ಹೆಚ್ಚಿನ ವ್ಯತ್ಯಾಸಗಳಿಗೆ ಸೂಕ್ತ ಡೀಫಾಲ್ಟ್‌ಗಳು ಇವೆ, ಆದರೆ ನೀವು ಅವುಗಳನ್ನು ನಿಮ್ಮ ನಿರ್ದಿಷ್ಟ ಅಗತ್ಯಗಳಿಗೆ ಅಥವಾ ಇತ್ತೀಚಿನ Azure ಸಂಪತ್ತಿಗೆ ಹೊಂದಿಸಬಹುದು.

### 3.1 ಅಗತ್ಯವಿರುವ ವ್ಯತ್ಯಾಸಗಳು 

```bash title="" linenums="0"
# ಕೋರ್ ಆಜೂರ್ ಸಂರಚನೆ
AZURE_ENV_NAME                    # ಪರಿಸರದ ಹೆಸರು (ಸಂಪತ್ತಿನ ಹೆಸರಿನಲ್ಲಿ ಬಳಸಲಾಗುತ್ತದೆ)
AZURE_LOCATION                    # ನಿಯೋಜನೆ ಪ್ರದೇಶ
AZURE_SUBSCRIPTION_ID             # ಗುರಿ ಚಂದಾದಾರಿಕೆ
AZURE_RESOURCE_GROUP              # ಸಂಪತ್ತಿನ ಗುಂಪಿನ ಹೆಸರು
AZURE_PRINCIPAL_ID                # ಆರ್‌ಬಿಎಸಿ ಬಳಕೆದಾರ ಪ್ರಿನ್ಸಿಪಲ್

# ಸಂಪತ್ತಿನ ಹೆಸರುಗಳು (ನಿರ್ದಿಷ್ಟಪಡಿಸದಿದ್ದರೆ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ರಚಿಸಲಾಗುತ್ತದೆ)
AZURE_AIHUB_NAME                  # ಎಐ ಫೌಂಡ್ರಿ ಹಬ್ ಹೆಸರು
AZURE_AIPROJECT_NAME              # ಎಐ ಯೋಜನೆಯ ಹೆಸರು
AZURE_AISERVICES_NAME             # ಎಐ ಸೇವೆಗಳ ಖಾತೆ ಹೆಸರು
AZURE_STORAGE_ACCOUNT_NAME        # ಸಂಗ್ರಹಣಾ ಖಾತೆ ಹೆಸರು
AZURE_CONTAINER_REGISTRY_NAME     # ಕಂಟೈನರ್ ರಿಜಿಸ್ಟ್ರಿ ಹೆಸರು
AZURE_KEYVAULT_NAME               # ಕೀ ವಾಲ್ಟ್ ಹೆಸರು (ಬಳಸಿದರೆ)
```

### 3.2 ಮಾದರಿ ಸಂರಚನೆ 
```bash title="" linenums="0"
# ಚಾಟ್ ಮಾದರಿ ಸಂರಚನೆ
AZURE_AI_AGENT_MODEL_NAME         # ಡೀಫಾಲ್ಟ್: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # ಡೀಫಾಲ್ಟ್: ಓಪನ್‌ಎಐ (ಅಥವಾ ಮೈಕ್ರೋಸಾಫ್ಟ್)
AZURE_AI_AGENT_MODEL_VERSION      # ಡೀಫಾಲ್ಟ್: ಲೇಟೆಸ್ಟ್ ಲಭ್ಯವಿದೆ
AZURE_AI_AGENT_DEPLOYMENT_NAME    # ಚಾಟ್ ಮಾದರಿಗಾಗಿ ನಿಯೋಜನೆ ಹೆಸರು
AZURE_AI_AGENT_DEPLOYMENT_SKU     # ಡೀಫಾಲ್ಟ್: ಸ್ಟ್ಯಾಂಡರ್ಡ್
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # ಡೀಫಾಲ್ಟ್: 80 (ಸಾವಿರ TPM)

# ಎಂಬೆಡಿಂಗ್ ಮಾದರಿ ಸಂರಚನೆ
AZURE_AI_EMBED_MODEL_NAME         # ಡೀಫಾಲ್ಟ್: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # ಡೀಫಾಲ್ಟ್: ಓಪನ್‌ಎಐ
AZURE_AI_EMBED_MODEL_VERSION      # ಡೀಫಾಲ್ಟ್: ಲೇಟೆಸ್ಟ್ ಲಭ್ಯವಿದೆ
AZURE_AI_EMBED_DEPLOYMENT_NAME    # ಎಂಬೆಡಿಂಗ್‌ಗಳಿಗಾಗಿ ನಿಯೋಜನೆ ಹೆಸರು
AZURE_AI_EMBED_DEPLOYMENT_SKU     # ಡೀಫಾಲ್ಟ್: ಸ್ಟ್ಯಾಂಡರ್ಡ್
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # ಡೀಫಾಲ್ಟ್: 50 (ಸಾವಿರ TPM)

# ಏಜೆಂಟ್ ಸಂರಚನೆ
AZURE_AI_AGENT_NAME               # ಏಜೆಂಟ್ ಪ್ರದರ್ಶನ ಹೆಸರು
AZURE_EXISTING_AGENT_ID           # ಅಸ್ತಿತ್ವದಲ್ಲಿರುವ ಏಜೆಂಟ್ ಅನ್ನು ಬಳಸಿ (ಐಚ್ಛಿಕ)
```

### 3.3 ಫೀಚರ್ ಟಾಗಲ್
```bash title="" linenums="0"
# ಆಯ್ಕೆಯ ಸೇವೆಗಳು
USE_APPLICATION_INSIGHTS         # ಡೀಫಾಲ್ಟ್: ಸತ್ಯ
USE_AZURE_AI_SEARCH_SERVICE      # ಡೀಫಾಲ್ಟ್: ಸುಳ್ಳು
USE_CONTAINER_REGISTRY           # ಡೀಫಾಲ್ಟ್: ಸತ್ಯ

# ನಿಗಾವಹಿಸುವುದು ಮತ್ತು ಹಾದಿ ಹತ್ತುವುದು
ENABLE_AZURE_MONITOR_TRACING     # ಡೀಫಾಲ್ಟ್: ಸುಳ್ಳು
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # ಡೀಫಾಲ್ಟ್: ಸುಳ್ಳು

# ಹುಡುಕಾಟ ಸಂರಚನೆ
AZURE_AI_SEARCH_INDEX_NAME       # ಹುಡುಕಾಟ ಸೂಚ್ಯಂಕದ ಹೆಸರು
AZURE_SEARCH_SERVICE_NAME        # ಹುಡುಕಾಟ ಸೇವೆಯ ಹೆಸರು
```

### 3.4 AI ಪ್ರಾಜೆಕ್ಟ್ ಸಂರಚನೆ 
```bash title="" linenums="0"
# ಅಸ್ತಿತ್ವದಲ್ಲಿರುವ ಸಂಪತ್ತನ್ನು ಬಳಸಿ
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # ಅಸ್ತಿತ್ವದಲ್ಲಿರುವ AI ಯೋಜನೆಯ ಸಂಪೂರ್ಣ ಸಂಪತ್ತಿನ ID
AZURE_EXISTING_AIPROJECT_ENDPOINT       # ಅಸ್ತಿತ್ವದಲ್ಲಿರುವ ಯೋಜನೆಯ ಎಂಡ್ಪಾಯಿಂಟ್ URL
```

### 3.5 ನಿಮ್ಮ ವ್ಯತ್ಯಾಸಗಳನ್ನು ಪರಿಶೀಲಿಸಿ

Azure Developer CLI ಅನ್ನು ಬಳಸಿಕೊಂಡು ನಿಮ್ಮ ಪರಿಸರ ವ್ಯತ್ಯಾಸಗಳನ್ನು ವೀಕ್ಷಿಸಿ ಮತ್ತು ನಿರ್ವಹಿಸಿ:

```bash title="" linenums="0"
# ಪ್ರಸ್ತುತ ಪರಿಸರದ ಎಲ್ಲಾ ಪರಿಸರ ವ್ಯತ್ಯಾಸಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd env get-values

# ನಿರ್ದಿಷ್ಟ ಪರಿಸರ ವ್ಯತ್ಯಾಸವನ್ನು ಪಡೆಯಿರಿ
azd env get-value AZURE_ENV_NAME

# ಪರಿಸರ ವ್ಯತ್ಯಾಸವನ್ನು ಹೊಂದಿಸಿ
azd env set AZURE_LOCATION eastus

# .env ಫೈಲ್‌ನಿಂದ ಬಹು ವ್ಯತ್ಯಾಸಗಳನ್ನು ಹೊಂದಿಸಿ
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕಾರ**:  
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯಿಗಾಗಿ ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಡ್ಡೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಮಹತ್ವದ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->