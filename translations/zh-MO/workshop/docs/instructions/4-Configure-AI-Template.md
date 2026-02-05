# 4. 配置模板

!!! tip "完成本模組後，您將能夠"

    - [ ] 理解 `azure.yaml` 的用途
    - [ ] 理解 `azure.yaml` 的結構
    - [ ] 理解 azd 生命周期中的 `hooks` 的價值
    - [ ] **實驗 3：**

---

!!! prompt "`azure.yaml` 文件的作用是什麼？使用代碼框並逐行解釋"

      `azure.yaml` 文件是 **Azure Developer CLI (azd) 的配置文件**。它定義了應用程式如何部署到 Azure，包括基礎架構、服務、部署 hooks 和環境變數。

---

## 1. 目的與功能

`azure.yaml` 文件作為 AI 代理應用程式的 **部署藍圖**，其功能包括：

1. **在部署前驗證環境**
2. **配置 Azure AI 服務**（AI Hub、AI Project、Search 等）
3. **將 Python 應用程式部署到 Azure Container Apps**
4. **配置 AI 模型**以支持聊天和嵌入功能
5. **設置應用程式的監控和追蹤**
6. **處理新建和現有的 Azure AI 項目場景**

此文件支持 **一鍵部署** (`azd up`) 完整的 AI 代理解決方案，並包含適當的驗證、配置和部署後設置。

??? info "展開查看：`azure.yaml`"

      `azure.yaml` 文件定義了 Azure Developer CLI 如何在 Azure 中部署和管理此 AI 代理應用程式。以下是逐行解析。

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: 我們需要 hooks 嗎？
      # TODO: 我們需要所有的變數嗎？

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

## 2. 文件解析

讓我們逐部分解析此文件，了解其作用及原因。

### 2.1 **標頭與架構 (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **第 1 行**：提供 YAML 語言伺服器架構驗證，用於 IDE 支援和智能提示

### 2.2 項目元數據 (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **第 5 行**：定義 Azure Developer CLI 使用的項目名稱
- **第 6-7 行**：指定基於模板版本 1.0.2
- **第 8-9 行**：要求 Azure Developer CLI 版本 1.14.0 或更高

### 2.3 部署 Hooks (11-40)

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

- **第 11-20 行**：**部署前 hook** - 在執行 `azd up` 之前運行

      - 在 Unix/Linux 上：使驗證腳本可執行並運行
      - 在 Windows 上：運行 PowerShell 驗證腳本
      - 兩者均為交互式，若失敗則停止部署

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
- **第 21-30 行**：**部署後配置 hook** - 在 Azure 資源創建後運行

  - 執行環境變數寫入腳本
  - 即使腳本失敗，部署仍繼續 (`continueOnError: true`)

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
- **第 31-40 行**：**部署後 hook** - 在應用程式部署後運行

  - 執行最終設置腳本
  - 即使腳本失敗，仍繼續

### 2.4 服務配置 (41-48)

此部分配置您要部署的應用程式服務。

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

- **第 42 行**：定義名為 "api_and_frontend" 的服務
- **第 43 行**：指向 `./src` 目錄作為源代碼位置
- **第 44 行**：指定 Python 為編程語言
- **第 45 行**：使用 Azure Container Apps 作為託管平台
- **第 46-48 行**：Docker 配置

      - 使用 "api_and_frontend" 作為映像名稱
      - 在 Azure 中遠程構建 Docker 映像（非本地）

### 2.5 管道變數 (49-76)

這些變數幫助您在 CI/CD 管道中自動化運行 `azd`

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

此部分定義 **部署期間** 使用的環境變數，按類別組織：

- **Azure 資源名稱 (第 51-60 行)**：
      - 核心 Azure 服務資源名稱，例如資源組、AI Hub、AI Project 等
- **功能標誌 (第 61-63 行)**：
      - 布爾變數，用於啟用/禁用特定 Azure 服務
- **AI 代理配置 (第 64-71 行)**：
      - 主 AI 代理的配置，包括名稱、ID、部署設置、模型細節
- **AI 嵌入配置 (第 72-79 行)**：
      - 用於向量搜索的嵌入模型配置
- **搜索與監控 (第 80-84 行)**：
      - 搜索索引名稱、現有資源 ID 和監控/追蹤設置

---

## 3. 瞭解環境變數
以下環境變數控制部署的配置和行為，按主要用途組織。大多數變數有合理的默認值，但您可以根據具體需求或現有 Azure 資源進行自定義。

### 3.1 必需變數 

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

### 3.2 模型配置 
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

### 3.3 功能切換
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

### 3.4 AI 項目配置 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 檢查您的變數

使用 Azure Developer CLI 查看和管理您的環境變數：

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

