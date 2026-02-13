# 4. 設定範本

!!! tip "在本單元結束時，您將能夠"

    - [ ] 了解 `azure.yaml` 的用途
    - [ ] 了解 `azure.yaml` 的結構
    - [ ] 了解 azd 生命週期 `hooks` 的用途
    - [ ] **實驗 4:** 探索並修改環境變數

---

!!! prompt "`azure.yaml` 檔案有甚麼用途？使用程式碼區塊並逐行解釋"

      `azure.yaml` 檔案是 Azure Developer CLI (azd) 的 **設定檔**。它定義了應用程式應如何部署到 Azure，包括基礎架構、服務、部署掛鉤，以及環境變數。

---

## 1. 目的與功能

這個 `azure.yaml` 檔案作為 AI 代理應用程式的 **部署藍圖**，其用途包括：

1. 在部署前驗證環境
2. 佈建 Azure AI 服務（AI Hub、AI Project、Search 等）
3. 將 Python 應用程式部署到 Azure Container Apps
4. 為聊天與嵌入功能設定 AI 模型
5. 為 AI 應用程式設定監控與追蹤
6. 處理全新與既有 Azure AI 專案的情境

該檔案讓您能夠透過一條指令（`azd up`）完整部署 AI 代理解決方案，包含適當的驗證、佈建與部署後設定。

??? info "展開以檢視： `azure.yaml`"

      `azure.yaml` 檔案定義了 Azure Developer CLI 應如何在 Azure 中部署與管理此 AI 代理應用程式。讓我們逐行拆解。

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: 我們需要 hooks 嗎？ 
      # TODO: 我們是否需要全部變數？

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

## 2. 拆解檔案

讓我們逐段檢視該檔案，了解它的作用與原因。

### 2.1 **標頭與 Schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **第 1 行**：提供 YAML 語言伺服器的 schema 驗證，以支援 IDE 與自動補全

### 2.2 專案資訊 (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **第 5 行**：定義由 Azure Developer CLI 使用的專案名稱
- **第 6-7 行**：指定此為基於範本版本 1.0.2
- **第 8-9 行**：要求 Azure Developer CLI 版本為 1.14.0 或以上

### 2.3 部署掛鉤 (11-40)

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

- **第 11-20 行**：**預部署掛鉤** - 在 `azd up` 之前執行

      - 在 Unix/Linux：將驗證腳本設為可執行並執行它
      - 在 Windows：執行 PowerShell 驗證腳本
      - 兩者均為互動式，若失敗將停止部署

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
- **第 21-30 行**：**佈建後掛鉤** - 在建立 Azure 資源之後執行

  - 執行寫入環境變數的腳本
  - 即使這些腳本失敗也會繼續部署（`continueOnError: true`）

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
- **第 31-40 行**：**部署後掛鉤** - 在應用程式部署之後執行

  - 執行最終設定腳本
  - 即使腳本失敗也會繼續

### 2.4 服務設定 (41-48)

此處設定您要部署的應用程式服務。

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
- **第 43 行**：指向來源程式碼的 `./src` 目錄
- **第 44 行**：指定程式語言為 Python
- **第 45 行**：使用 Azure Container Apps 作為主機平台
- **第 46-48 行**：Docker 設定

      - 使用 "api_and_frontend" 作為映像名稱
      - 在 Azure 遠端建置 Docker 映像（而非在本機）

### 2.5 管線變數 (49-76)

這些變數可協助您在 CI/CD 管線中使用 `azd` 進行自動化部署

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

本節定義於**部署期間**使用的環境變數，依類別組織：

- **Azure 資源名稱（第 51-60 行）**：
      - 核心 Azure 服務的資源名稱，例如資源群組、AI Hub、AI Project 等。
- **功能開關（第 61-63 行）**：
      - 用於啟用/停用特定 Azure 服務的布林變數
- **AI 代理設定（第 64-71 行）**：
      - 主要 AI 代理的設定，包括名稱、ID、部署設定、模型資訊
- **AI 嵌入設定（第 72-79 行）**：
      - 用於向量搜尋的嵌入模型設定
- **搜尋與監控（第 80-84 行）**：
      - 搜尋索引名稱、既有資源 ID，以及監控/追蹤設定

---

## 3. 了解環境變數
下列環境變數會控制部署的設定與行為，並依其主要用途分類。大多數變數都有合理的預設值，但您可以自訂以符合您的特定需求或既有的 Azure 資源。

### 3.1 必要變數 

```bash title="" linenums="0"
# Azure 核心設定
AZURE_ENV_NAME                    # 環境名稱（用於資源命名）
AZURE_LOCATION                    # 部署區域
AZURE_SUBSCRIPTION_ID             # 目標訂閱
AZURE_RESOURCE_GROUP              # 資源群組名稱
AZURE_PRINCIPAL_ID                # 用於 RBAC 的使用者主體

# 資源名稱（若未指定則自動產生）
AZURE_AIHUB_NAME                  # Microsoft Foundry 樞紐名稱
AZURE_AIPROJECT_NAME              # AI 專案名稱
AZURE_AISERVICES_NAME             # AI 服務帳戶名稱
AZURE_STORAGE_ACCOUNT_NAME        # 儲存體帳戶名稱
AZURE_CONTAINER_REGISTRY_NAME     # 容器註冊表名稱
AZURE_KEYVAULT_NAME               # 金鑰保管庫名稱（如使用）
```

### 3.2 模型設定 
```bash title="" linenums="0"
# 聊天模型設定
AZURE_AI_AGENT_MODEL_NAME         # 預設：gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # 預設：OpenAI（或 Microsoft）
AZURE_AI_AGENT_MODEL_VERSION      # 預設：最新可用
AZURE_AI_AGENT_DEPLOYMENT_NAME    # 聊天模型的部署名稱
AZURE_AI_AGENT_DEPLOYMENT_SKU     # 預設：標準
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # 預設：80（千 TPM）

# 嵌入模型設定
AZURE_AI_EMBED_MODEL_NAME         # 預設：text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # 預設：OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # 預設：最新可用
AZURE_AI_EMBED_DEPLOYMENT_NAME    # 嵌入模型的部署名稱
AZURE_AI_EMBED_DEPLOYMENT_SKU     # 預設：標準
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # 預設：50（千 TPM）

# 代理設定
AZURE_AI_AGENT_NAME               # 代理顯示名稱
AZURE_EXISTING_AGENT_ID           # 使用現有代理（可選）
```

### 3.3 功能切換
```bash title="" linenums="0"
# 可選服務
USE_APPLICATION_INSIGHTS         # 預設: true
USE_AZURE_AI_SEARCH_SERVICE      # 預設: false
USE_CONTAINER_REGISTRY           # 預設: true

# 監控與追蹤
ENABLE_AZURE_MONITOR_TRACING     # 預設: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # 預設: false

# 搜尋設定
AZURE_AI_SEARCH_INDEX_NAME       # 搜尋索引名稱
AZURE_SEARCH_SERVICE_NAME        # 搜尋服務名稱
```

### 3.4 AI 專案設定 
```bash title="" linenums="0"
# 使用現有資源
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # 現有 AI 專案的完整資源 ID
AZURE_EXISTING_AIPROJECT_ENDPOINT       # 現有專案的端點 URL
```

### 3.5 檢查您的變數

請使用 Azure Developer CLI 檢視並管理您的環境變數：

```bash title="" linenums="0"
# 檢視目前環境的所有環境變數
azd env get-values

# 取得特定的環境變數
azd env get-value AZURE_ENV_NAME

# 設定一個環境變數
azd env set AZURE_LOCATION eastus

# 從 .env 檔案設定多個變數
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件已使用 AI 翻譯服務 Co-op Translator（https://github.com/Azure/co-op-translator）進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始語言之文件應被視為具權威性的版本。對於重要資訊，建議採用專業人工翻譯。因使用本翻譯而導致的任何誤解或誤譯，我們概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->