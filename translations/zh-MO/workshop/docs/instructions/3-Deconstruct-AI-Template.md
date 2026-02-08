# 3. Deconstruct a Template

!!! tip "在本模組結束時您將能夠"

    - [ ] 啟用 GitHub Copilot，並使用 MCP 伺服器取得 Azure 協助
    - [ ] 理解 AZD 範本資料夾結構與元件
    - [ ] 探索基於基礎架構即程式碼（Bicep）的組織模式
    - [ ] **Lab 3:** 使用 GitHub Copilot 探索並理解程式碼庫架構 

---


使用 AZD 範本與 Azure 開發人員 CLI (`azd`)，我們可以快速以標準化的檔案庫啟動 AI 開發流程，這些檔案庫提供範例程式碼、基礎架構與設定檔 —— 以可立即部署的「起始」專案形式呈現。

**但現在，我們需要理解專案結構與程式碼庫——並能夠自訂 AZD 範本——即使沒有任何 AZD 的先前經驗或理解！**

---

## 1. Activate GitHub Copilot

### 1.1 Install GitHub Copilot Chat

現在該去探索 [GitHub Copilot（代理模式）](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode)。我們現在可以使用自然語言高層描述任務，並取得執行協助。在本實驗中，我們會使用 [Copilot 免費方案](https://github.com/github-copilot/signup)，該方案對完成次數與聊天互動有每月限制。

此擴充套件可從市集安裝，但在您的 Codespaces 環境中應已可用。_從 Copilot 圖示下拉選單中點選 `Open Chat` —— 並鍵入像 `What can you do?` 這樣的提示_ —— 您可能會被要求登入。**GitHub Copilot Chat 已就緒**。

### 1.2. Install MCP Servers

為了讓代理模式（Agent mode）有效，它需要存取正確的工具以協助擷取知識或採取行動。這就是 MCP 伺服器可以幫忙的地方。我們會配置以下伺服器：

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

要啟用這些：

1. 如果不存在，建立名為 `.vscode/mcp.json` 的檔案
1. 將下列內容複製到該檔案中 —— 然後啟動伺服器！
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

??? warning "您可能會遇到 `npx` 未安裝 的錯誤（按一下展開以查看修正方法）"

      若要修正，請打開 `.devcontainer/devcontainer.json` 檔案，並在 features 區段新增此行。然後重建 container。您現在應該已安裝 `npx`。

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Test GitHub Copilot Chat

**首先使用 `az login` 從 VS Code 命令列對 Azure 進行驗證。**

您現在應該能查詢您的 Azure 訂閱狀態，並詢問有關已部署資源或設定的問題。嘗試這些提示：

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

您也可以詢問有關 Azure 文件的問題，並取得以 Microsoft Docs MCP 伺服器為依據的回應。嘗試這些提示：

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

或者您可以要求程式碼片段來完成任務。嘗試此提示。

1. `Give me a Python code example that uses AAD for an interactive chat client`

在 `Ask` 模式下，這會提供您可以複製貼上的程式碼以供嘗試。在 `Agent` 模式下，這可能會更進一步，為您建立相關資源 —— 包括設定腳本與文件 —— 以協助您執行該任務。

**您現在已具備開始探索範本程式碼庫的能力**

---

## 2. Deconstruct Architecture

??? prompt "詢問：請用一段落說明 docs/images/architecture.png 中的應用程式架構"

      這個應用程式是一個以 AI 為驅動的聊天應用，建立在 Azure 上，示範現代的代理式架構。解決方案的核心是一個承載主要應用程式程式碼的 Azure Container App，該程式碼處理使用者輸入並透過 AI 代理產生智能回應。
      
      架構以 Microsoft Foundry Project 作為 AI 能力的基礎，連接到提供底層語言模型（例如 GPT-4o-mini）與代理功能的 Azure AI 服務。使用者互動透過基於 React 的前端流向一個 FastAPI 後端，該後端與 AI 代理服務通訊以生成具上下文的回應。
      
      系統透過檔案搜尋或 Azure AI Search 服務整合知識檢索功能，允許代理從上傳文件擷取並引用訊息。為了營運卓越，架構包含透過 Application Insights 與 Log Analytics Workspace 的完整監控，以進行追蹤、日誌與效能最佳化。
      
      Azure Storage 提供應用資料與檔案上傳的 blob 儲存，而 Managed Identity 確保 Azure 資源之間的安全存取而無需儲存憑證。整個解決方案以可擴展性與可維護性為設計，容器化應用會根據需求自動調整，同時透過 Azure 受管服務生態系提供內建的安全性、監控與 CI/CD 能力。

![Architecture](../../../../../translated_images/zh-MO/architecture.48d94861e6e6cdc0.webp)

---

## 3. Repository Structure

!!! prompt "詢問：請說明範本資料夾結構。從視覺階層圖開始。"

??? info "回答：視覺階層結構圖"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 設定與安裝
      │   ├── azure.yaml                    # Azure 開發人員 CLI 設定
      │   ├── docker-compose.yaml           # 本機開發容器
      │   ├── pyproject.toml                # Python 專案設定
      │   ├── requirements-dev.txt          # 開發相依套件
      │   └── .devcontainer/                # VS Code 開發容器設定
      │
      ├── 🏗️ Infrastructure (infra/)
      │   ├── main.bicep                    # 主要基礎架構範本
      │   ├── api.bicep                     # API 專屬資源
      │   ├── main.parameters.json          # 基礎架構參數
      │   └── core/                         # 模組化基礎架構元件
      │       ├── ai/                       # AI 服務設定
      │       ├── host/                     # 主機承載基礎架構
      │       ├── monitor/                  # 監控與日誌
      │       ├── search/                   # Azure AI Search 設定
      │       ├── security/                 # 安全與身分驗證
      │       └── storage/                  # 儲存帳戶設定
      │
      ├── 💻 Application Source (src/)
      │   ├── api/                          # 後端 API
      │   │   ├── main.py                   # FastAPI 應用程式入口
      │   │   ├── routes.py                 # API 路由定義
      │   │   ├── search_index_manager.py   # 搜尋功能
      │   │   ├── data/                     # API 資料處理
      │   │   ├── static/                   # 靜態網頁資產
      │   │   └── templates/                # HTML 範本
      │   ├── frontend/                     # React/TypeScript 前端
      │   │   ├── package.json              # Node.js 相依套件
      │   │   ├── vite.config.ts            # Vite 建置設定
      │   │   └── src/                      # 前端原始碼
      │   ├── data/                         # 範例資料檔
      │   │   └── embeddings.csv            # 預先計算的 embeddings
      │   ├── files/                        # 知識庫檔案
      │   │   ├── customer_info_*.json      # 客戶資料範例
      │   │   └── product_info_*.md         # 產品文件
      │   ├── Dockerfile                    # 容器設定
      │   └── requirements.txt              # Python 相依套件
      │
      ├── 🔧 Automation & Scripts (scripts/)
      │   ├── postdeploy.sh/.ps1           # 部署後設定
      │   ├── setup_credential.sh/.ps1     # 憑證設定
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
      │   ├── sandbox/                      # 開發測試遊樂場
      │   │   ├── 1-quickstart.py           # 快速入門範例
      │   │   └── aad-interactive-chat.py   # 驗證範例
      │   └── airedteaming/                 # AI 安全性評估
      │       └── ai_redteaming.py          # 紅隊測試
      │
      ├── 📚 Documentation (docs/)
      │   ├── deployment.md                 # 部署指南
      │   ├── local_development.md          # 本機開發說明
      │   ├── troubleshooting.md            # 常見問題與修正
      │   ├── azure_account_setup.md        # Azure 前置需求
      │   └── images/                       # 文件資產
      │
      └── 📄 Project Metadata
         ├── README.md                     # 專案概覽
         ├── CODE_OF_CONDUCT.md           # 社群守則
         ├── CONTRIBUTING.md              # 貢獻指南
         ├── LICENSE                      # 授權條款
         └── next-steps.md                # 部署後指引
      ```

### 3.1. Core App Architecture

此範本遵循一個 **全端網路應用** 模式，包含：

- **後端**：使用 Python FastAPI 並整合 Azure AI
- **前端**：TypeScript/React 與 Vite 建構系統
- **基礎架構**：使用 Azure Bicep 範本來建立雲端資源
- **容器化**：使用 Docker 確保部署一致性

### 3.2 Infra As Code (bicep)

基礎架構層使用模組化的 **Azure Bicep** 範本：

   - **`main.bicep`**：協調所有 Azure 資源
   - **`core/` 模組**：可重複使用的不同服務元件
      - AI 服務（Azure OpenAI、AI Search）
      - 容器承載（Azure Container Apps）
      - 監控（Application Insights、Log Analytics）
      - 安全性（Key Vault、Managed Identity）

### 3.3 Application Source (`src/`)

**後端 API (`src/api/`)**：

- 基於 FastAPI 的 REST API
- Foundry Agents 整合
- 用於知識檢索的搜尋索引管理
- 檔案上傳與處理功能

**前端 (`src/frontend/`)**：

- 現代的 React/TypeScript 單頁應用（SPA）
- 使用 Vite 以加速開發與優化建置
- 供代理互動使用的聊天介面

**知識庫 (`src/files/`)**：

- 範例客戶與產品資料
- 示範基於檔案的知識檢索
- 提供 JSON 與 Markdown 格式範例


### 3.4 DevOps & Automation

**腳本 (`scripts/`)**：

- 跨平台的 PowerShell 與 Bash 腳本
- 環境驗證與設定
- 部署後設定
- 模型配額管理

**Azure 開發人員 CLI 整合**：

- `azure.yaml` 為 `azd` 工作流程提供設定
- 自動化的佈建與部署
- 環境變數管理

### 3.5 Testing & Quality Assurance

**評估框架 (`evals/`)**：

- 代理效能評估
- 查詢-回應品質測試
- 自動化評估管線

**AI 安全性 (`airedteaming/`)**：

- 紅隊測試以評估 AI 安全性
- 安全漏洞掃描
- 負責任的 AI 實務

---

## 4. Congratulations 🏆

您已成功使用 GitHub Copilot Chat 並結合 MCP 伺服器，來探索程式碼庫。

- [X] 已啟用 GitHub Copilot 以支援 Azure
- [X] 已理解應用程式架構
- [X] 已探索 AZD 範本結構

這讓您對此範本的 _基礎架構即程式碼_ 資產有基本的了解。接下來，我們將查看 AZD 的設定檔。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件已使用 AI 翻譯服務 Co-op Translator（https://github.com/Azure/co-op-translator）進行翻譯。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不準確之處。原文（原始語言版本）應被視為具權威性的資料。對於重要資訊，建議採用專業人工翻譯。我們對於因使用本翻譯而產生的任何誤解或錯誤詮釋概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->