# 3. 拆解模板

!!! tip "在本模組結束時，你將能夠"

    - [ ] 啟用結合 MCP 伺服器的 GitHub Copilot 以取得 Azure 協助
    - [ ] 理解 AZD 模板資料夾結構和元件
    - [ ] 探索基礎架構即程式碼 (Bicep) 的組織模式
    - [ ] **實驗 3：** 使用 GitHub Copilot 探索並了解程式庫架構

---


透過 AZD 模板與 Azure 開發者 CLI (`azd`)，我們能快速啟動 AI 開發旅程，使用標準化的程式庫，提供範例程式碼、基礎建設與設定檔，以可隨時部署的 _起始_ 專案形式呈現。

**但現在，我們需要理解專案結構及程式碼庫，並能自訂 AZD 模板——即使沒有任何 AZD 經驗或理解！**

---

## 1. 啟用 GitHub Copilot

### 1.1 安裝 GitHub Copilot Chat

現在是時候探索[具備代理模式的 GitHub Copilot](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode)。我們可以用自然語言高層次描述任務，並獲得執行協助。在本實驗中，我們將使用帶有完成與聊天互動月流量限制的[免費 Copilot 計劃](https://github.com/github-copilot/signup)。

此擴充功能可從市集安裝，但在你的 Codespaces 環境中應已可使用。_點擊 Copilot 圖示下拉選單中的 `Open Chat`，並輸入例如 `What can you do?` 的提示語_ — 可能會提示你登入。**GitHub Copilot Chat 已準備就緒**。

### 1.2 安裝 MCP 伺服器

為了讓代理模式有效，它需要適當工具以協助檢索知識或採取行動。這就是 MCP 伺服器的用武之地。我們將設定以下伺服器：

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

啟用方式：

1. 如果不存在，建立檔案 `.vscode/mcp.json`
1. 將以下內容複製到該檔案 — 並啟動伺服器！
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

??? warning "你可能會遇到 `npx` 未安裝錯誤（點擊展開修復方法）"

      修復方法是在 `.devcontainer/devcontainer.json` 檔案的 features 區段加入以下內容，然後重建容器。你應該會安裝好 `npx` 。

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3 測試 GitHub Copilot Chat

**請先使用 `az login` 從 VS Code 命令列驗證 Azure 身分。**

你現在應能查詢 Azure 訂閱狀態，並詢問已部署資源或設定問題。試試這些提示：

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

你也可以詢問 Azure 文件並從 Microsoft Docs MCP 伺服器取得回答。試試以下提示：

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

或者要求程式碼片段以完成任務。試試這個提示：

1. `Give me a Python code example that uses AAD for an interactive chat client`

在 `Ask` 模式下，將提供可複製貼上的程式碼範例。代理模式下，則可能更進一步，建立相關資源，包括設定腳本與文件，協助你執行任務。

**你現在已具備開始探索模板程式庫的能力**

---

## 2. 拆解架構

??? prompt "詢問：用一段話說明 docs/images/architecture.png 中的應用程式架構"

      此應用程式是一款建立於 Azure 上的 AI 聊天應用，展示現代代理架構。解決方案核心為一個 Azure Container App，承載主要應用程式程式碼，負責處理使用者輸入並透過 AI 代理生成智能回應。
      
      架構利用 Microsoft Foundry 專案作為 AI 能力基礎，連接 Azure AI 服務，提供底層語言模型（如 GPT-4o-mini）及代理功能。使用者互動由 React 前端傳送至 FastAPI 後端，再與 AI 代理服務通訊產生情境回應。
      
      系統包含知識檢索功能，透過檔案搜尋或 Azure AI 搜尋服務，讓代理能存取並引用上傳文件中的資訊。
      
      為確保運營優異性，架構包括 Application Insights 與 Log Analytics 監控與日誌工作區，支持追蹤、日誌與效能優化。
      
      Azure 儲存體提供應用資料及檔案上傳的 Blob 儲存，Managed Identity 則確保 Azure 資源間安全存取，免去儲存憑證。整體方案聚焦於擴展性和可維護性，容器化應用會依需求自動擴展，並透過 Azure 管理服務生態系提供內建安全性、監控與 CI/CD 能力。

![Architecture](../../../../../translated_images/zh-HK/architecture.48d94861e6e6cdc0.webp)

---

## 3. 儲存庫結構

!!! prompt "詢問：說明模板資料夾結構。請以視覺層級圖開始。"

??? info "回答：視覺層級圖"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Configuration & Setup
      │   ├── azure.yaml                    # Azure 開發者 CLI 設定檔
      │   ├── docker-compose.yaml           # 本地開發容器設定
      │   ├── pyproject.toml                # Python 專案配置
      │   ├── requirements-dev.txt          # 開發用相依套件
      │   └── .devcontainer/                # VS Code 開發容器設定
      │
      ├── 🏗️ Infrastructure (infra/)
      │   ├── main.bicep                    # 主要基礎架構模板
      │   ├── api.bicep                     # API 相關資源
      │   ├── main.parameters.json          # 基礎架構參數
      │   └── core/                         # 模組化基礎架構元件
      │       ├── ai/                       # AI 服務設定
      │       ├── host/                     # 主機基礎架構
      │       ├── monitor/                  # 監控與日誌
      │       ├── search/                   # Azure AI 搜尋設定
      │       ├── security/                 # 安全及身份管理
      │       └── storage/                  # 儲存帳戶設定
      │
      ├── 💻 Application Source (src/)
      │   ├── api/                          # 後端 API
      │   │   ├── main.py                   # FastAPI 應用入口
      │   │   ├── routes.py                 # API 路由定義
      │   │   ├── search_index_manager.py   # 搜尋功能
      │   │   ├── data/                     # API 資料處理
      │   │   ├── static/                   # 靜態網頁資源
      │   │   └── templates/                # HTML 模板
      │   ├── frontend/                     # React/TypeScript 前端
      │   │   ├── package.json              # Node.js 相依套件
      │   │   ├── vite.config.ts            # Vite 构建配置
      │   │   └── src/                      # 前端原始碼
      │   ├── data/                         # 範例資料檔案
      │   │   └── embeddings.csv            # 預計算的嵌入向量
      │   ├── files/                        # 知識庫檔案
      │   │   ├── customer_info_*.json      # 客戶資料範例
      │   │   └── product_info_*.md         # 產品文件
      │   ├── Dockerfile                    # 容器設定檔
      │   └── requirements.txt              # Python 相依套件
      │
      ├── 🔧 Automation & Scripts (scripts/)
      │   ├── postdeploy.sh/.ps1           # 部署後設定腳本
      │   ├── setup_credential.sh/.ps1     # 憑證配置腳本
      │   ├── validate_env_vars.sh/.ps1    # 環境變數驗證
      │   └── resolve_model_quota.sh/.ps1  # 模型配額管理
      │
      ├── 🧪 Testing & Evaluation
      │   ├── tests/                        # 單元與整合測試
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # 代理評估框架
      │   │   ├── evaluate.py               # 評估執行器
      │   │   ├── eval-queries.json         # 測試查詢
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # 開發沙箱
      │   │   ├── 1-quickstart.py           # 快速開始範例
      │   │   └── aad-interactive-chat.py   # 身份驗證範例
      │   └── airedteaming/                 # AI 安全評估
      │       └── ai_redteaming.py          # 紅隊測試
      │
      ├── 📚 Documentation (docs/)
      │   ├── deployment.md                 # 部署指南
      │   ├── local_development.md          # 本地開發說明
      │   ├── troubleshooting.md            # 常見問題與解決方案
      │   ├── azure_account_setup.md        # Azure 先決條件
      │   └── images/                       # 文件資源
      │
      └── 📄 Project Metadata
         ├── README.md                     # 專案概述
         ├── CODE_OF_CONDUCT.md           # 社群準則
         ├── CONTRIBUTING.md              # 貢獻指南
         ├── LICENSE                      # 授權條款
         └── next-steps.md                # 部署後指引
      ```

### 3.1 核心應用架構

此模板遵循 **全端網頁應用** 模式，包含：

- **後端**：使用 Python FastAPI 和 Azure AI 整合
- **前端**：TypeScript/React，並以 Vite 建置系統
- **基礎架構**：Azure Bicep 模板管理雲端資源
- **容器化**：以 Docker 確保部署一致性

### 3.2 基礎架構即程式碼 (bicep)

基礎架構層以 **Azure Bicep** 模板模組化組織：

   - **`main.bicep`**：協調所有 Azure 資源
   - **`core/` 模組**：服務重用元件
      - AI 服務 (Azure OpenAI、AI 搜尋)
      - 容器主機 (Azure Container Apps)
      - 監控 (Application Insights、Log Analytics)
      - 安全性 (Key Vault、Managed Identity)

### 3.3 應用程式原始碼 (`src/`)

**後端 API (`src/api/`)**：

- 基於 FastAPI 的 REST API
- Foundry 代理人整合
- 搜尋索引管理供知識檢索
- 檔案上傳與處理功能

**前端 (`src/frontend/`)**：

- 現代 React/TypeScript SPA
- 使用 Vite 進行快速開發與優化建置
- 提供代理人互動聊天介面

**知識庫 (`src/files/`)**：

- 範例客戶與產品資料
- 示範基於檔案的知識檢索
- JSON 與 Markdown 格式範例

### 3.4 DevOps 與自動化

**腳本 (`scripts/`)**：

- 跨平台 PowerShell 與 Bash 腳本
- 環境驗證與設定
- 部署後配置
- 模型配額管理

**Azure 開發者 CLI 整合**：

- `azure.yaml` 配置 `azd` 工作流程
- 自動佈建與部署
- 環境變數管理

### 3.5 測試與品質保證

**評估框架 (`evals/`)**：

- 代理效能評估
- 查詢-回應品質測試
- 自動化評估流程

**AI 安全性 (`airedteaming/`)**：

- 紅隊測試以強化 AI 安全
- 安全漏洞掃描
- 負責任的 AI 實踐

---

## 4. 恭喜 🏆

你已成功使用結合 MCP 伺服器的 GitHub Copilot Chat，探索儲存庫。

- [X] 啟用 Azure 用 GitHub Copilot
- [X] 理解應用架構
- [X] 探索 AZD 模板結構

這讓你對本模板的 _基礎架構即程式碼_ 資產有初步認識。接下來，我們將檢視 AZD 的設定檔。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於提供準確的翻譯，但自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議採用專業人工翻譯。本公司對因使用本翻譯而引起的任何誤解或誤釋概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->