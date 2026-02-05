# 3. 分解模板

!!! tip "完成本模組後，您將能夠"

    - [ ] 項目
    - [ ] 項目
    - [ ] 項目
    - [ ] **實驗 3：**

---

使用 AZD 模板和 Azure Developer CLI (`azd`)，我們可以快速啟動 AI 開發旅程，透過標準化的存儲庫提供範例代碼、基礎設施和配置文件——以一個可部署的 _入門_ 項目形式呈現。

**但現在，我們需要了解項目結構和代碼庫——並能夠在沒有任何 AZD 相關經驗或理解的情況下自定義 AZD 模板！**

---

## 1. 啟用 GitHub Copilot

### 1.1 安裝 GitHub Copilot Chat

是時候探索 [GitHub Copilot 的代理模式](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode)。現在，我們可以使用自然語言來高層次描述任務，並獲得執行上的協助。對於本次實驗，我們將使用 [Copilot 免費計劃](https://github.com/github-copilot/signup)，該計劃每月有完成和聊天互動的限制。

該擴展可以從市場安裝，但應該已在您的 Codespaces 環境中可用。_點擊 Copilot 圖標下拉菜單中的 `Open Chat`，並輸入提示，例如 `What can you do?`_——您可能需要登錄。**GitHub Copilot Chat 已準備就緒**。

### 1.2 安裝 MCP 伺服器

為了使代理模式有效，它需要訪問正確的工具來幫助檢索知識或執行操作。這就是 MCP 伺服器的作用。我們將配置以下伺服器：

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

啟用這些伺服器：

1. 如果 `.vscode/mcp.json` 文件不存在，請創建該文件
1. 將以下內容複製到該文件中，並啟動伺服器！
   ```json title=".vscode/mcp.json"
   {
      "servers": {
         "Azure MCP Server": {
            "command": "npx",
            "args": [
            "-y",
            "@azure/mcp@latest",
            "server",
            "start"
            ]
         },
         "microsoft.docs.mcp": {
            "type": "http",
            "url": "https://learn.microsoft.com/api/mcp"
         }
      }
   }
   ```

??? warning "您可能會收到 `npx` 未安裝的錯誤（點擊展開以獲取修復方法）"

      要修復此問題，打開 `.devcontainer/devcontainer.json` 文件，並在 features 部分添加以下行。然後重建容器。現在應該已安裝 `npx`。

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3 測試 GitHub Copilot Chat

**首先使用 `az login` 從 VS Code 命令行進行 Azure 身份驗證。**

現在您應該能夠查詢您的 Azure 訂閱狀態，並詢問有關已部署資源或配置的問題。嘗試以下提示：

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

您還可以詢問有關 Azure 文檔的問題，並從 Microsoft Docs MCP 伺服器獲得基於文檔的回答。嘗試以下提示：

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

或者，您可以要求完成任務的代碼片段。嘗試以下提示：

1. `Give me a Python code example that uses AAD for an interactive chat client`

在 `Ask` 模式下，這將提供您可以複製粘貼並嘗試的代碼。在 `Agent` 模式下，這可能會更進一步，為您創建相關資源——包括設置腳本和文檔——以幫助您執行該任務。

**您現在已準備好開始探索模板存儲庫**

---

## 2. 分解架構

??? prompt "ASK: 用一段話解釋 docs/images/architecture.png 中的應用架構"

      此應用是一個基於 Azure 的 AI 驅動聊天應用，展示了現代代理架構。解決方案的核心是一個 Azure Container App，該應用承載主要應用代碼，負責處理用戶輸入並通過 AI 代理生成智能回應。
      
      架構以 Azure AI Foundry Project 為基礎，連接到提供底層語言模型（如 GPT-4o-mini）和代理功能的 Azure AI Services。用戶交互通過基於 React 的前端流向 FastAPI 後端，後端與 AI 代理服務通信以生成上下文回應。
      
      系統通過文件搜索或 Azure AI Search 服務集成知識檢索功能，使代理能夠訪問並引用上傳的文檔中的信息。為了實現卓越運營，架構包括通過 Application Insights 和 Log Analytics Workspace 進行的全面監控，用於追踪、日誌記錄和性能優化。
      
      Azure Storage 提供應用數據和文件上傳的 Blob 存儲，而 Managed Identity 確保 Azure 資源之間的安全訪問，無需存儲憑據。整個解決方案旨在實現可擴展性和可維護性，容器化應用根據需求自動擴展，同時通過 Azure 的托管服務生態系統提供內置的安全性、監控和 CI/CD 功能。

![Architecture](../../../../../translated_images/zh-TW/architecture.48d94861e6e6cdc0.webp)

---

## 3. 存儲庫結構

!!! prompt "ASK: 解釋模板文件夾結構。從視覺層次圖開始。"

??? info "ANSWER: 視覺層次圖"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 配置與設置
      │   ├── azure.yaml                    # Azure Developer CLI 配置
      │   ├── docker-compose.yaml           # 本地開發容器
      │   ├── pyproject.toml                # Python 項目配置
      │   ├── requirements-dev.txt          # 開發依賴項
      │   └── .devcontainer/                # VS Code 開發容器設置
      │
      ├── 🏗️ 基礎設施 (infra/)
      │   ├── main.bicep                    # 主基礎設施模板
      │   ├── api.bicep                     # API 特定資源
      │   ├── main.parameters.json          # 基礎設施參數
      │   └── core/                         # 模塊化基礎設施組件
      │       ├── ai/                       # AI 服務配置
      │       ├── host/                     # 託管基礎設施
      │       ├── monitor/                  # 監控與日誌
      │       ├── search/                   # Azure AI Search 設置
      │       ├── security/                 # 安全與身份
      │       └── storage/                  # 存儲帳戶配置
      │
      ├── 💻 應用源代碼 (src/)
      │   ├── api/                          # 後端 API
      │   │   ├── main.py                   # FastAPI 應用入口
      │   │   ├── routes.py                 # API 路由定義
      │   │   ├── search_index_manager.py   # 搜索功能
      │   │   ├── data/                     # API 數據處理
      │   │   ├── static/                   # 靜態網頁資源
      │   │   └── templates/                # HTML 模板
      │   ├── frontend/                     # React/TypeScript 前端
      │   │   ├── package.json              # Node.js 依賴項
      │   │   ├── vite.config.ts            # Vite 構建配置
      │   │   └── src/                      # 前端源代碼
      │   ├── data/                         # 範例數據文件
      │   │   └── embeddings.csv            # 預計算嵌入
      │   ├── files/                        # 知識庫文件
      │   │   ├── customer_info_*.json      # 客戶數據範例
      │   │   └── product_info_*.md         # 產品文檔
      │   ├── Dockerfile                    # 容器配置
      │   └── requirements.txt              # Python 依賴項
      │
      ├── 🔧 自動化與腳本 (scripts/)
      │   ├── postdeploy.sh/.ps1           # 部署後設置
      │   ├── setup_credential.sh/.ps1     # 憑據配置
      │   ├── validate_env_vars.sh/.ps1    # 環境驗證
      │   └── resolve_model_quota.sh/.ps1  # 模型配額管理
      │
      ├── 🧪 測試與評估
      │   ├── tests/                        # 單元與集成測試
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # 代理評估框架
      │   │   ├── evaluate.py               # 評估運行器
      │   │   ├── eval-queries.json         # 測試查詢
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # 開發沙盒
      │   │   ├── 1-quickstart.py           # 快速入門範例
      │   │   └── aad-interactive-chat.py   # 身份驗證範例
      │   └── airedteaming/                 # AI 安全評估
      │       └── ai_redteaming.py          # 紅隊測試
      │
      ├── 📚 文檔 (docs/)
      │   ├── deployment.md                 # 部署指南
      │   ├── local_development.md          # 本地設置說明
      │   ├── troubleshooting.md            # 常見問題與修復
      │   ├── azure_account_setup.md        # Azure 先決條件
      │   └── images/                       # 文檔資源
      │
      └── 📄 項目元數據
         ├── README.md                     # 項目概述
         ├── CODE_OF_CONDUCT.md           # 社群指南
         ├── CONTRIBUTING.md              # 貢獻指南
         ├── LICENSE                      # 授權條款
         └── next-steps.md                # 部署後指導
      ```

### 3.1 核心應用架構

此模板遵循 **全棧網頁應用** 模式，包含：

- **後端**：Python FastAPI 與 Azure AI 集成
- **前端**：TypeScript/React 與 Vite 構建系統
- **基礎設施**：Azure Bicep 模板用於雲資源
- **容器化**：使用 Docker 進行一致性部署

### 3.2 基礎設施即代碼 (bicep)

基礎設施層使用 **Azure Bicep** 模板，模塊化組織：

   - **`main.bicep`**：協調所有 Azure 資源
   - **`core/` 模塊**：不同服務的可重用組件
      - AI 服務（Azure OpenAI、AI Search）
      - 容器託管（Azure Container Apps）
      - 監控（Application Insights、Log Analytics）
      - 安全性（Key Vault、Managed Identity）

### 3.3 應用源代碼 (`src/`)

**後端 API (`src/api/`)**：

- 基於 FastAPI 的 REST API
- Azure AI 代理服務集成
- 用於知識檢索的搜索索引管理
- 文件上傳與處理功能

**前端 (`src/frontend/`)**：

- 現代化 React/TypeScript SPA
- 使用 Vite 進行快速開發與優化構建
- 用於代理交互的聊天界面

**知識庫 (`src/files/`)**：

- 客戶與產品數據範例
- 展示基於文件的知識檢索
- JSON 與 Markdown 格式範例

### 3.4 DevOps 與自動化

**腳本 (`scripts/`)**：

- 跨平台 PowerShell 與 Bash 腳本
- 環境驗證與設置
- 部署後配置
- 模型配額管理

**Azure Developer CLI 集成**：

- `azure.yaml` 配置用於 `azd` 工作流
- 自動化資源配置與部署
- 環境變數管理

### 3.5 測試與質量保證

**評估框架 (`evals/`)**：

- 代理性能評估
- 查詢回應質量測試
- 自動化評估管道

**AI 安全 (`airedteaming/`)**：

- AI 安全的紅隊測試
- 安全漏洞掃描
- 負責任的 AI 實踐

---

## 4. 恭喜 🏆

您成功使用 GitHub Copilot Chat 與 MCP 伺服器，探索了存儲庫。

- [X] 啟用了 GitHub Copilot 用於 Azure
- [X] 理解了應用架構
- [X] 探索了 AZD 模板結構

這讓您對此模板的 _基礎設施即代碼_ 資產有了初步了解。接下來，我們將查看 AZD 的配置文件。

---

