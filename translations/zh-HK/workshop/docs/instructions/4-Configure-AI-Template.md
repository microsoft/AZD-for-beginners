# 4. 配置模板

!!! tip "在本單元結束時你將能夠"

    - [ ] 了解 `azure.yaml` 的目的
    - [ ] 了解 `azure.yaml` 的結構
    - [ ] 了解 azd 生命週期 `hooks` 的價值
    - [ ] **實驗 4：** 探索並修改環境變量

---

!!! prompt "`azure.yaml` 檔案是做什麼用的？請用程式碼區塊逐行解釋"

      `azure.yaml` 檔案是 **Azure Developer CLI (azd) 的配置檔案**。它定義了應用程式應如何部署到 Azure，其中包括基礎設施、服務、部署鉤子以及環境變量。

---

## 1. 目的與功能

此 `azure.yaml` 檔案作為 AI 代理應用程式的 **部署藍圖**，該應用程式：

1. **部署前驗證環境**
2. **佈建 Azure AI 服務**（AI Hub、AI Project、Search 等）
3. **將 Python 應用部署到 Azure 容器應用**
4. **配置用於聊天與嵌入功能的 AI 模型**
5. **設置 AI 應用的監控與追蹤**
6. **處理新建與既有 Azure AI 專案場景**

該檔案允許透過 **一條命令部署**（`azd up`）完整的 AI 代理解決方案，並包含適當的驗證、佈建和部署後配置。

??? info "展開查看：`azure.yaml`"

      `azure.yaml` 檔案定義了 Azure Developer CLI 應如何在 Azure 中部署和管理此 AI 代理應用。讓我們逐行拆解說明。

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

## 2. 拆解檔案內容

讓我們分段解析，理解每部分的功能與原因。

### 2.1 **表頭與 Schema（第1-3行）**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **第 1 行**：為 IDE 提供 YAML 語言伺服器的 schema 驗證與 IntelliSense 支援

### 2.2 專案元資料（第5-10行）

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **第 5 行**：定義 Azure Developer CLI 使用的專案名稱
- **第 6-7 行**：指定此配置基於版本 1.0.2 的模板
- **第 8-9 行**：要求 Azure Developer CLI 版本必須為 1.14.0 或以上

### 2.3 部署鉤子（第11-40行）

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

- **第 11-20 行**：**部署前鉤子** - 在執行 `azd up` 之前執行

      - 在 Unix/Linux 系統：讓驗證腳本可執行，並執行該腳本
      - 在 Windows 系統：執行 PowerShell 驗證腳本
      - 兩者均為互動模式，驗證失敗則停止部署

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
- **第 21-30 行**：**配置後鉤子** - 在 Azure 資源建立完成後執行

  - 執行寫入環境變量的腳本
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
- **第 31-40 行**：**部署後鉤子** - 在應用部署完成後執行

  - 執行最終設定腳本
  - 即使腳本失敗也繼續執行

### 2.4 服務設定（第41-48行）

設定你要部署的應用服務。

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
- **第 43 行**：指定來源碼目錄為 `./src`
- **第 44 行**：指定程式語言為 Python
- **第 45 行**：指定主機類型為 Azure 容器應用
- **第 46-48 行**：Docker 配置

      - 映像名稱為 "api_and_frontend"
      - Docker 映像遠端建置 (在 Azure 端建置，不在本地)

### 2.5 管線變量（第49-76行）

這些變量用於在 CI/CD 管線中執行 `azd`，達成自動化部署

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

此部分定義部署過程中使用的環境變量，依類別整理：

- **Azure 資源命名（第51-60行）**：
      - 核心 Azure 服務的資源名稱，如資源群組、AI Hub、AI Project 等
- **功能開關（第61-63行）**：
      - 用於啟用或停用特定 Azure 服務的布林變量
- **AI 代理配置（第64-71行）**：
      - 主 AI 代理的配置，包括名稱、ID、部署參數、模型詳情
- **AI 嵌入配置（第72-79行）**：
      - 用於向量搜尋的嵌入模型設定
- **搜尋與監控（第80-84行）**：
      - 搜尋索引名稱、既有資源 ID 及監控/追蹤設定

---

## 3. 瞭解環境變量

以下環境變量控制你的部署配置與行為，依主要用途分類。大部分變量都有合理預設值，但你可以依照特定需求或既有 Azure 資源自訂。

### 3.1 必填變量

```bash title="" linenums="0"
# 核心 Azure 配置
AZURE_ENV_NAME                    # 環境名稱（用於資源命名）
AZURE_LOCATION                    # 部署區域
AZURE_SUBSCRIPTION_ID             # 目標訂閱
AZURE_RESOURCE_GROUP              # 資源組名稱
AZURE_PRINCIPAL_ID                # RBAC 用戶主體

# 資源名稱（如未指定，將自動生成）
AZURE_AIHUB_NAME                  # Microsoft Foundry 集線器名稱
AZURE_AIPROJECT_NAME              # AI 項目名稱
AZURE_AISERVICES_NAME             # AI 服務帳戶名稱
AZURE_STORAGE_ACCOUNT_NAME        # 儲存帳戶名稱
AZURE_CONTAINER_REGISTRY_NAME     # 容器註冊表名稱
AZURE_KEYVAULT_NAME               # 金鑰保管庫名稱（如使用）
```

### 3.2 模型配置
```bash title="" linenums="0"
# 聊天模型設定
AZURE_AI_AGENT_MODEL_NAME         # 預設：gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # 預設：OpenAI（或 Microsoft）
AZURE_AI_AGENT_MODEL_VERSION      # 預設：最新可用版本
AZURE_AI_AGENT_DEPLOYMENT_NAME    # 聊天模型的部署名稱
AZURE_AI_AGENT_DEPLOYMENT_SKU     # 預設：標準
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # 預設：80（千 TPM）

# 嵌入模型設定
AZURE_AI_EMBED_MODEL_NAME         # 預設：text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # 預設：OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # 預設：最新可用版本
AZURE_AI_EMBED_DEPLOYMENT_NAME    # 嵌入的部署名稱
AZURE_AI_EMBED_DEPLOYMENT_SKU     # 預設：標準
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # 預設：50（千 TPM）

# 代理設定
AZURE_AI_AGENT_NAME               # 代理顯示名稱
AZURE_EXISTING_AGENT_ID           # 使用現有代理（可選）
```

### 3.3 功能開關
```bash title="" linenums="0"
# 可選服務
USE_APPLICATION_INSIGHTS         # 預設值：true
USE_AZURE_AI_SEARCH_SERVICE      # 預設值：false
USE_CONTAINER_REGISTRY           # 預設值：true

# 監控和追蹤
ENABLE_AZURE_MONITOR_TRACING     # 預設值：false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # 預設值：false

# 搜尋配置
AZURE_AI_SEARCH_INDEX_NAME       # 搜尋索引名稱
AZURE_SEARCH_SERVICE_NAME        # 搜尋服務名稱
```

### 3.4 AI 專案配置
```bash title="" linenums="0"
# 使用現有資源
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # 現有 AI 專案的完整資源 ID
AZURE_EXISTING_AIPROJECT_ENDPOINT       # 現有專案的端點 URL
```

### 3.5 檢查你的變量

使用 Azure Developer CLI 來查看和管理你的環境變量：

```bash title="" linenums="0"
# 查看當前環境的所有環境變量
azd env get-values

# 獲取特定環境變量
azd env get-value AZURE_ENV_NAME

# 設置環境變量
azd env set AZURE_LOCATION eastus

# 從 .env 文件設置多個變量
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原文應視為具權威性的資料來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而產生之任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->