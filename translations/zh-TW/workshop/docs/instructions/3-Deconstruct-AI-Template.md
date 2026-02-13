# 3. 拆解範本

!!! tip "在本模組結束時，您將能夠"

    - [ ] 啟用 GitHub Copilot 並使用 MCP 伺服器以取得 Azure 協助
    - [ ] 了解 AZD 範本的資料夾結構與元件
    - [ ] 探索基礎架構即程式碼（Bicep）的組織模式
    - [ ] **實驗 3：** 使用 GitHub Copilot 探索並了解儲存庫架構 

---


使用 AZD 範本與 Azure Developer CLI (`azd`)，我們可以快速以標準化的儲存庫啟動 AI 開發旅程，這些儲存庫提供範例程式碼、基礎架構與設定檔——以一個可立即部署的 _起始專案_ 形式提供。

**但現在，我們需要理解專案結構與程式碼庫 — 並能夠自訂 AZD 範本 — 即使事前沒有任何 AZD 的經驗或了解！**

---

## 1. 啟用 GitHub Copilot

### 1.1 安裝 GitHub Copilot Chat

是時候來探索 [GitHub Copilot 與 Agent 模式](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode)。現在，我們可以使用自然語言描述高階任務，並取得執行上的協助。此實驗將使用有每月限制的 [Copilot Free 計畫](https://github.com/github-copilot/signup)，該計畫對完成項目與聊天互動有月度限制。

擴充功能可以從 Marketplace 安裝，但在你的 Codespaces 環境中應該已可使用。_從 Copilot 圖示下拉選單點選 `Open Chat` - 然後輸入像 `What can you do?` 的提示語_ - 你可能會被要求登入。**GitHub Copilot Chat 已就緒**。

### 1.2. 安裝 MCP 伺服器

為讓 Agent 模式有效，它需要存取正確的工具來協助擷取知識或採取行動。這時 MCP 伺服器會很有幫助。我們將設定以下伺服器：

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

要啟用這些：

1. 若不存在，請建立一個名為 `.vscode/mcp.json` 的檔案
1. 將以下內容複製到該檔案中 - 然後啟動伺服器！
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

??? warning "您可能會遇到錯誤顯示 `npx` 未安裝（點擊展開以獲得修正方法）"

      要修正此問題，請開啟 `.devcontainer/devcontainer.json` 檔案並在 features 區段新增此行。然後重新建置容器。你現在應該已安裝 `npx`。

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. 測試 GitHub Copilot Chat

**首先使用 `az login` 從 VS Code 命令列對 Azure 進行驗證。**

你現在應該能查詢你的 Azure 訂閱狀態，並詢問有關已部署資源或設定的問題。試試這些提示：

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

你也可以詢問有關 Azure 文件的問題，並從 Microsoft Docs MCP 伺服器取得具依據的回應。試試這些提示：

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

或者你也可以請求程式碼片段來完成某項任務。試試這個提示。

1. `Give me a Python code example that uses AAD for an interactive chat client`

在「Ask」模式中，這會提供可複製貼上的程式碼讓你嘗試。在「Agent」模式中，這可能更進一步為你建立相關資源——包括設定腳本與文件——以協助你執行該任務。

**你現在已具備開始探索範本儲存庫的能力**

---

## 2. 拆解架構

??? prompt "詢問：請在 docs/images/architecture.png 中以一段文字說明應用程式架構"

      這個應用程式是一個建立於 Azure 上的 AI 聊天應用，展示了一個現代的代理 (agent) 架構。解決方案以一個承載主要應用程式程式碼的 Azure Container App 為中心，該程式碼處理使用者輸入並透過 AI 代理產生智慧回應。
      
      架構以 Microsoft Foundry Project 作為 AI 能力的基礎，連接至提供底層語言模型（例如 GPT-4o-mini）與代理功能的 Azure AI 服務。使用者互動從基於 React 的前端流向一個與 AI 代理服務通訊以生成情境回應的 FastAPI 後端。
      
      系統透過檔案搜尋或 Azure AI Search 服務整合知識檢索功能，使代理能夠存取並引用上傳文件中的資訊。為了營運卓越，該架構包含透過 Application Insights 與 Log Analytics Workspace 的完整監控，用於追蹤、紀錄與效能最佳化。
      
      Azure Storage 提供應用程式資料與檔案上傳的 Blob 儲存，而 Managed Identity 確保 Azure 資源之間的安全存取而無需儲存憑證。整個解決方案以可擴展性與可維護性為設計目標，容器化應用會依需求自動擴展，同時透過 Azure 的託管服務生態系，提供內建的安全性、監控與 CI/CD 能力。

![架構](../../../../../translated_images/zh-TW/architecture.48d94861e6e6cdc0.webp)

---

## 3. 儲存庫結構

!!! prompt "詢問：說明範本資料夾結構。從視覺化階層圖開始。"

??? info "回答：視覺化階層圖"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 設定與準備
      │   ├── azure.yaml                    # Azure Developer CLI 設定
      │   ├── docker-compose.yaml           # 本地開發容器
      │   ├── pyproject.toml                # Python 專案設定
      │   ├── requirements-dev.txt          # 開發相依套件
      │   └── .devcontainer/                # VS Code 開發容器設定
      │
      ├── 🏗️ 基礎架構 (infra/)
      │   ├── main.bicep                    # 主基礎架構範本
      │   ├── api.bicep                     # API 專屬資源
      │   ├── main.parameters.json          # 基礎架構參數
      │   └── core/                         # 模組化基礎架構元件
      │       ├── ai/                       # AI 服務設定
      │       ├── host/                     # 託管基礎架構
      │       ├── monitor/                  # 監控與日誌
      │       ├── search/                   # Azure AI Search 設定
      │       ├── security/                 # 安全與身分
      │       └── storage/                  # 儲存帳戶設定
      │
      ├── 💻 應用程式原始碼 (src/)
      │   ├── api/                          # 後端 API
      │   │   ├── main.py                   # FastAPI 應用程式入口
      │   │   ├── routes.py                 # API 路由定義
      │   │   ├── search_index_manager.py   # 搜尋功能
      │   │   ├── data/                     # API 資料處理
      │   │   ├── static/                   # 靜態網站資源
      │   │   └── templates/                # HTML 範本
      │   ├── frontend/                     # React/TypeScript 前端
      │   │   ├── package.json              # Node.js 相依套件
      │   │   ├── vite.config.ts            # Vite 建置設定
      │   │   └── src/                      # 前端原始碼
      │   ├── data/                         # 範例資料檔案
      │   │   └── embeddings.csv            # 預先計算的 embeddings
      │   ├── files/                        # 知識庫檔案
      │   │   ├── customer_info_*.json      # 顧客資料範例
      │   │   └── product_info_*.md         # 產品文件
      │   ├── Dockerfile                    # 容器設定
      │   └── requirements.txt              # Python 相依套件
      │
      ├── 🔧 自動化與腳本 (scripts/)
      │   ├── postdeploy.sh/.ps1           # 部署後設定
      │   ├── setup_credential.sh/.ps1     # 憑證設定
      │   ├── validate_env_vars.sh/.ps1    # 環境變數驗證
      │   └── resolve_model_quota.sh/.ps1  # 模型配額管理
      │
      ├── 🧪 測試與評估
      │   ├── tests/                        # 單元與整合測試
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # 代理評估框架
      │   │   ├── evaluate.py               # 評估執行程式
      │   │   ├── eval-queries.json         # 測試查詢
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # 開發沙盒
      │   │   ├── 1-quickstart.py           # 快速入門範例
      │   │   └── aad-interactive-chat.py   # 驗證範例
      │   └── airedteaming/                 # AI 安全性評估
      │       └── ai_redteaming.py          # 紅隊測試
      │
      ├── 📚 文件 (docs/)
      │   ├── deployment.md                 # 部署指南
      │   ├── local_development.md          # 本地開發設定說明
      │   ├── troubleshooting.md            # 常見問題與修正
      │   ├── azure_account_setup.md        # Azure 前置需求
      │   └── images/                       # 文件資產
      │
      └── 📄 專案資料
         ├── README.md                     # 專案概覽
         ├── CODE_OF_CONDUCT.md           # 社群守則
         ├── CONTRIBUTING.md              # 貢獻指南
         ├── LICENSE                      # 授權條款
         └── next-steps.md                # 部署後指引
      ```

### 3.1. 核心應用架構

此範本遵循一個 **全端網頁應用程式** 的模式，包含：

- **後端**：使用整合 Azure AI 的 Python FastAPI
- **前端**：TypeScript/React 與 Vite 建置系統
- **基礎架構**：使用 Azure Bicep 範本建立雲端資源
- **容器化**：使用 Docker 以達成一致的部署

### 3.2 以程式碼方式的基礎架構（Bicep）

基礎架構層使用模組化的 **Azure Bicep** 範本來組織：

   - **`main.bicep`**：協調所有 Azure 資源
   - **`core/` 模組**：為不同服務提供可重複使用的元件
      - AI 服務（Azure OpenAI、AI Search）
      - 容器託管（Azure Container Apps）
      - 監控（Application Insights、Log Analytics）
      - 安全（Key Vault、Managed Identity）

### 3.3 應用程式原始碼 (`src/`)

**後端 API (`src/api/`)**：

- 基於 FastAPI 的 REST API
- Foundry Agents 整合
- 用於知識檢索的搜尋索引管理
- 檔案上傳與處理功能

**前端 (`src/frontend/`)**：

- 現代 React/TypeScript 單頁應用
- 使用 Vite 以加速開發與最佳化建置
- 提供代理互動的聊天介面

**知識庫 (`src/files/`)**：

- 範例顧客與產品資料
- 展示基於檔案的知識檢索
- 提供 JSON 與 Markdown 範例格式


### 3.4 DevOps 與自動化

**腳本 (`scripts/`)**：

- 跨平台的 PowerShell 與 Bash 腳本
- 環境驗證與設定
- 部署後的配置
- 模型配額管理

**Azure Developer CLI 整合**：

- `azure.yaml` 為 `azd` 工作流程的設定
- 自動化佈建與部署
- 環境變數管理

### 3.5 測試與品質保證

**評估框架 (`evals/`)**：

- 代理效能評估
- 查詢-回應品質測試
- 自動化評估流程

**AI 安全性 (`airedteaming/`)**：

- 針對 AI 安全性的紅隊測試
- 安全弱點掃描
- 負責任的 AI 實踐

---

## 4. 恭喜 🏆

你已成功使用 GitHub Copilot Chat 與 MCP 伺服器來探索此儲存庫。

- [X] 已為 Azure 啟用 GitHub Copilot
- [X] 已了解應用程式架構
- [X] 已探索 AZD 範本結構

這讓你對此範本的 _基礎架構即程式碼_ 資產有了初步認識。接下來，我們將檢視 AZD 的設定檔。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件已使用 AI 翻譯服務 Co-op Translator (https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們力求準確，仍請注意自動翻譯可能包含錯誤或不精確之處。原始語言版本的文件應視為具權威性的來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或錯誤詮釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->