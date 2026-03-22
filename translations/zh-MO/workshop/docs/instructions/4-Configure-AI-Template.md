# 4. 設定範本

!!! tip "在本單元結束時您將能夠"

    - [ ] 了解 `azure.yaml` 的用途
    - [ ] 了解 `azure.yaml` 的結構
    - [ ] 了解 azd 生命週期 `hooks` 的價值
    - [ ] **實驗 4：** 探索並修改環境變數

---

!!! prompt "`azure.yaml` 檔案有什麼作用？使用程式碼區塊並逐行解釋它"

      `azure.yaml` 檔案是 **Azure Developer CLI (azd) 的設定檔**。它定義了應用程式應如何部署到 Azure，包括基礎架構、服務、部署 hooks 與環境變數。

---

## 1. 目的與功能

這個 `azure.yaml` 檔案作為 AI 代理應用程式的 <strong>部署藍圖</strong>，其功能包括：

1. <strong>在部署前驗證環境</strong>
2. **配置 Azure AI 服務**（AI Hub、AI Project、Search 等）
3. **將 Python 應用部署到 Azure Container Apps**
4. **為聊天與 embedding 功能配置 AI 模型**
5. **為 AI 應用設置監控與追蹤**
6. **處理新的以及既有的 Azure AI 專案情境**

此檔案可讓您透過單一命令（`azd up`）部署完整的 AI 代理解決方案，包含適當的驗證、配置與部署後設定。

??? info "展開以檢視：`azure.yaml`"

      `azure.yaml` 檔案定義了 Azure Developer CLI 應如何在 Azure 上部署與管理此 AI 代理應用程式。讓我們逐行拆解。

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

## 2. 拆解檔案

讓我們逐段檢視檔案，以了解它的作用與原因。

### 2.1 **標頭與 Schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Line 1**：提供 YAML 語言伺服器的 schema 驗證，以利 IDE 支援與 IntelliSense

### 2.2 專案資料 (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Line 5**：定義 Azure Developer CLI 使用的專案名稱
- **Lines 6-7**：指定此為基於範本版本 1.0.2
- **Lines 8-9**：要求 Azure Developer CLI 版本 1.14.0 或以上

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

- **Lines 11-20**：**部署前的 hook** - 在 `azd up` 之前執行

      - 在 Unix/Linux：將驗證腳本設為可執行並執行它
      - 在 Windows：執行 PowerShell 的驗證腳本
      - 兩者皆為互動式，若失敗將會停止部署

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
- **Lines 21-30**：**佈建後的 hook** - 在建立 Azure 資源之後執行

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
- **Lines 31-40**：**部署後的 hook** - 在應用部署之後執行

  - 執行最終設定腳本
  - 即使腳本失敗也會繼續

### 2.4 服務設定 (41-48)

此處設定您要部署的應用服務。

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

- **Line 42**：定義一個名為 "api_and_frontend" 的服務
- **Line 43**：指向 `./src` 目錄作為原始碼位置
- **Line 44**：指定使用 Python 作為程式語言
- **Line 45**：使用 Azure Container Apps 作為主機平台
- **Lines 46-48**：Docker 設定

      - 使用 "api_and_frontend" 作為映像名稱
      - 在 Azure 遠端建置 Docker 映像（非在本地）

### 2.5 管線變數 (49-76)

這些變數可協助您在 CI/CD 管線中自動化執行 `azd`

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

本節定義部署期間使用的環境變數，並依類別整理：

- **Azure 資源名稱（Lines 51-60）**：
      - 核心 Azure 服務資源名稱，例如：資源群組、AI Hub、AI Project 等。- 
- **功能開關（Lines 61-63）**：
      - 用來啟用/停用特定 Azure 服務的布林變數
- **AI 代理設定（Lines 64-71）**：
      - 主要 AI 代理的設定，包括名稱、ID、部署設定、模型細節- 
- **AI embedding 設定（Lines 72-79）**：
      - 用於向量搜尋的 embedding 模型配置
- **搜尋與監控（Lines 80-84）**：
      - 搜尋索引名稱、既有資源 ID，以及監控/追蹤的設定

---

## 3. 瞭解環境變數
下列環境變數會控制部署的設定與行為，並依主要用途分類。大多數變數有合理的預設值，但您可以自訂以符合特定需求或既有的 Azure 資源。

### 3.1 必填變數 

```bash title="" linenums="0"
# Azure 核心設定
AZURE_ENV_NAME                    # 環境名稱（用於資源命名）
AZURE_LOCATION                    # 部署區域
AZURE_SUBSCRIPTION_ID             # 目標訂閱
AZURE_RESOURCE_GROUP              # 資源群組名稱
AZURE_PRINCIPAL_ID                # 用於 RBAC 的使用者主體

# 資源名稱（如未指定則自動產生）
AZURE_AIHUB_NAME                  # Microsoft Foundry 中心名稱
AZURE_AIPROJECT_NAME              # AI 專案名稱
AZURE_AISERVICES_NAME             # AI 服務帳戶名稱
AZURE_STORAGE_ACCOUNT_NAME        # 儲存帳戶名稱
AZURE_CONTAINER_REGISTRY_NAME     # 容器註冊表名稱
AZURE_KEYVAULT_NAME               # 金鑰保管庫名稱（如使用）
```

### 3.2 模型設定 
```bash title="" linenums="0"
# 對話模型設定
AZURE_AI_AGENT_MODEL_NAME         # 預設：gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # 預設：OpenAI（或 Microsoft）
AZURE_AI_AGENT_MODEL_VERSION      # 預設：可用的最新版本
AZURE_AI_AGENT_DEPLOYMENT_NAME    # 對話模型的部署名稱
AZURE_AI_AGENT_DEPLOYMENT_SKU     # 預設：標準
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # 預設：80（千 TPM）

# 嵌入模型設定
AZURE_AI_EMBED_MODEL_NAME         # 預設：text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # 預設：OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # 預設：可用的最新版本
AZURE_AI_EMBED_DEPLOYMENT_NAME    # 嵌入模型的部署名稱
AZURE_AI_EMBED_DEPLOYMENT_SKU     # 預設：標準
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # 預設：50（千 TPM）

# 代理人設定
AZURE_AI_AGENT_NAME               # 代理人顯示名稱
AZURE_EXISTING_AGENT_ID           # 使用現有代理人（可選）
```

### 3.3 功能開關
```bash title="" linenums="0"
# 可選服務
USE_APPLICATION_INSIGHTS         # 預設：true
USE_AZURE_AI_SEARCH_SERVICE      # 預設：false
USE_CONTAINER_REGISTRY           # 預設：true

# 監控與追蹤
ENABLE_AZURE_MONITOR_TRACING     # 預設：false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # 預設：false

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

使用 Azure Developer CLI 查看並管理您的環境變數：

```bash title="" linenums="0"
# 檢視目前環境的所有環境變數
azd env get-values

# 取得特定的環境變數
azd env get-value AZURE_ENV_NAME

# 設定一個環境變數
azd env set AZURE_LOCATION eastus

# 從 .env 檔案設定多個環境變數
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為具有權威性的來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而導致的任何誤解或錯誤詮釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->