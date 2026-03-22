# 4. 配置範本

!!! tip "在此模組結束時，您將能夠"

    - [ ] 了解 `azure.yaml` 的用途
    - [ ] 了解 `azure.yaml` 的結構
    - [ ] 了解 azd 生命週期中 `hooks` 的價值
    - [ ] **實驗 4:** 探索並修改環境變數

---

!!! prompt "甚麼是 `azure.yaml` 文件的作用？請用程式區塊逐行說明"

      `azure.yaml` 文件是 **Azure Developer CLI (azd) 的配置文件**。它定義了您的應用程式如何部署到 Azure，包括基礎架構、服務、部署掛鉤及環境變數。

---

## 1. 目的與功能

此 `azure.yaml` 文件作為一個 AI 代理應用程式的 <strong>部署藍圖</strong>，它：

1. <strong>在部署前驗證環境</strong>
2. **部署 Azure AI 服務**（AI Hub、AI Project、Search 等）
3. **將 Python 應用部署到 Azure Container Apps**
4. **為聊天和嵌入功能配置 AI 模型**
5. **設定 AI 應用的監控與追蹤**
6. **處理新建及現有 Azure AI 專案的場景**

此文件支援以單一指令 (`azd up`) 完成完整 AI 代理方案的部署，並包含適當的驗證、佈建及部署後配置。

??? info "展開查看：`azure.yaml`"

      `azure.yaml` 文件定義了 Azure Developer CLI 如何在 Azure 中部署與管理此 AI 代理應用程式。讓我們逐行解析。

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

## 2. 拆解文件內容

讓我們逐節檢視此文件，瞭解它的用途與原因。

### 2.1 **標頭與架構定義 (第1-3行)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **第1行**：為 YAML 語言伺服器提供架構驗證，支援 IDE 裡的 IntelliSense

### 2.2 專案資料 (第5-10行)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **第5行**：定義 Azure Developer CLI 使用的專案名稱
- **第6-7行**：指定此為基於範本版本 1.0.2
- **第8-9行**：要求 Azure Developer CLI 版本 1.14.0 或以上

### 2.3 部署掛鉤 (第11-40行)

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

- **第11-20行**：<strong>部署前掛鉤</strong> - 在執行 `azd up` 前執行

      - 在 Unix/Linux 系統上：將驗證腳本設為可執行並執行
      - 在 Windows 系統上：執行 PowerShell 驗證腳本
      - 皆為交互式，如失敗則停止部署

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
- **第21-30行**：<strong>佈建後掛鉤</strong> - 在 Azure 資源建立完成後執行

  - 執行寫入環境變數腳本
  - 即使腳本失敗仍繼續部署（`continueOnError: true`）

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
- **第31-40行**：<strong>部署後掛鉤</strong> - 在應用程式部署後執行

  - 執行最終設定腳本
  - 即使腳本失敗仍繼續

### 2.4 服務設定 (第41-48行)

此段設定您所部署的應用服務。

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

- **第42行**：定義一個名為 "api_and_frontend" 的服務
- **第43行**：指定原始碼目錄為 `./src`
- **第44行**：指定程式語言為 Python
- **第45行**：使用 Azure Container Apps 作為主機平台
- **第46-48行**：Docker 配置

      - 使用 "api_and_frontend" 作為映像名稱
      - 在 Azure 中遠端建置 Docker 映像（非本地建置）

### 2.5 管線變數 (第49-76行)

這些變數協助您在 CI/CD 管線中自動化執行 `azd`

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

此區包含部署過程中使用的環境變數，依類別整理如下：

- **Azure 資源名稱 (第51-60行)**：
      - 核心 Azure 服務的資源名稱，如資源群組、AI Hub、AI Project 等
- **功能旗標 (第61-63行)**：
      - 啟用/停用特定 Azure 服務的布林變數
- **AI 代理設定 (第64-71行)**：
      - 主 AI 代理相關配置，包含名稱、ID、部署設定及模型細節
- **AI 嵌入設定 (第72-79行)**：
      - 用於向量搜尋的嵌入模型配置
- **搜尋與監控 (第80-84行)**：
      - 搜尋索引名稱、現有資源 ID 及監控/追蹤設定

---

## 3. 了解環境變數
下列環境變數掌控您的部署配置與行為，依主要功能分類。大多數變數有合理預設值，您亦可依需求及現有 Azure 資源調整。

### 3.1 必填變數 

```bash title="" linenums="0"
# 核心 Azure 配置
AZURE_ENV_NAME                    # 環境名稱（用於資源命名）
AZURE_LOCATION                    # 部署地區
AZURE_SUBSCRIPTION_ID             # 目標訂閱
AZURE_RESOURCE_GROUP              # 資源組名稱
AZURE_PRINCIPAL_ID                # RBAC 用戶主體

# 資源名稱（如未指定將自動生成）
AZURE_AIHUB_NAME                  # Microsoft Foundry 中心名稱
AZURE_AIPROJECT_NAME              # AI 專案名稱
AZURE_AISERVICES_NAME             # AI 服務帳戶名稱
AZURE_STORAGE_ACCOUNT_NAME        # 儲存帳戶名稱
AZURE_CONTAINER_REGISTRY_NAME     # 容器登錄名稱
AZURE_KEYVAULT_NAME               # 金鑰保管庫名稱（如有使用）
```

### 3.2 模型配置 
```bash title="" linenums="0"
# 聊天模型配置
AZURE_AI_AGENT_MODEL_NAME         # 默認：gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # 默認：OpenAI（或Microsoft）
AZURE_AI_AGENT_MODEL_VERSION      # 默認：最新可用版本
AZURE_AI_AGENT_DEPLOYMENT_NAME    # 聊天模型的部署名稱
AZURE_AI_AGENT_DEPLOYMENT_SKU     # 默認：標準
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # 默認：80（千TPM）

# 嵌入模型配置
AZURE_AI_EMBED_MODEL_NAME         # 默認：text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # 默認：OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # 默認：最新可用版本
AZURE_AI_EMBED_DEPLOYMENT_NAME    # 嵌入模型的部署名稱
AZURE_AI_EMBED_DEPLOYMENT_SKU     # 默認：標準
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # 默認：50（千TPM）

# 代理配置
AZURE_AI_AGENT_NAME               # 代理顯示名稱
AZURE_EXISTING_AGENT_ID           # 使用現有代理（可選）
```

### 3.3 功能切換
```bash title="" linenums="0"
# 可選服務
USE_APPLICATION_INSIGHTS         # 預設：true
USE_AZURE_AI_SEARCH_SERVICE      # 預設：false
USE_CONTAINER_REGISTRY           # 預設：true

# 監察和追蹤
ENABLE_AZURE_MONITOR_TRACING     # 預設：false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # 預設：false

# 搜尋配置
AZURE_AI_SEARCH_INDEX_NAME       # 搜尋索引名稱
AZURE_SEARCH_SERVICE_NAME        # 搜尋服務名稱
```

### 3.4 AI 專案配置 
```bash title="" linenums="0"
# 使用現有資源
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # 現有 AI 項目的完整資源 ID
AZURE_EXISTING_AIPROJECT_ENDPOINT       # 現有項目的端點 URL
```

### 3.5 檢視您的變數

使用 Azure Developer CLI 查看並管理環境變數：

```bash title="" linenums="0"
# 查看當前環境的所有環境變量
azd env get-values

# 獲取特定環境變量
azd env get-value AZURE_ENV_NAME

# 設置一個環境變量
azd env set AZURE_LOCATION eastus

# 從 .env 檔案設定多個變量
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件是使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，機器翻譯可能包含錯誤或不準確之處。原始語言文件應視為權威來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用此翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->