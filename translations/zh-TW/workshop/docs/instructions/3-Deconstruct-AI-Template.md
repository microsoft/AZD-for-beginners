# 3. 解構範本

!!! tip "在本模組結束時，您將能夠"

    - [ ] 啟用 MCP 伺服器的 GitHub Copilot 以協助 Azure
    - [ ] 了解 AZD 範本資料夾結構與組件
    - [ ] 探索基礎架構即程式碼（Bicep）的組織模式
    - [ ] **實驗室 3:** 使用 GitHub Copilot 探索並理解儲存庫架構 

---


使用 AZD 範本與 Azure 開發人員 CLI (`azd`)，我們可以快速啟動 AI 開發旅程，透過標準化的儲存庫提供範例程式碼、基礎架構和設定檔，形成一個可隨時部署的 _起始_ 專案。

**但是現在，我們需要了解專案結構與程式碼庫，並且能夠自訂 AZD 範本——即使沒有任何先前的 AZD 經驗或理解！**

---

## 1. 啟用 GitHub Copilot

### 1.1 安裝 GitHub Copilot 聊天功能

現在是探索 [GitHub Copilot 的代理模式](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode)的時候了。我們現在可以使用自然語言來描述任務的高階目標，並獲得執行協助。這次實驗室將使用有每月完成和聊天互動限制的 [Copilot 免費方案](https://github.com/github-copilot/signup)。

此擴充套件可從市集安裝，而且通常在 Codespaces 或開發容器環境中已預先安裝。_從 Copilot 圖示下拉選單點擊 `Open Chat`，然後打字類似 `What can you do?` 的提示_ — 你可能會被要求登入。**GitHub Copilot 聊天功能已準備就緒。**

### 1.2 安裝 MCP 伺服器

為了讓代理模式有效運作，它需要存取正確的工具來協助取得知識或執行操作。這時 MCP 伺服器就派上用場了。我們將配置以下伺服器：

1. [Azure MCP 伺服器](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP 伺服器](../../../../../workshop/docs/instructions)

啟用這些伺服器的步驟：

1. 如果不存在，請建立 `.vscode/mcp.json` 檔案
1. 將以下內容複製到該檔案中 - 然後啟動這些伺服器！
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

??? warning "你可能會遇到 `npx` 未安裝的錯誤（點擊展開修正方法）"

      解決方式是打開 `.devcontainer/devcontainer.json` 檔案，並在 features 區段新增這行。然後重新建置容器。你應該就能安裝並使用 `npx` 了。

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3 測試 GitHub Copilot 聊天

**首先使用 `azd auth login` 從 VS Code 命令列驗證 Azure 身份。如要直接使用 Azure CLI 指令，請額外執行 `az login`。**

你現在應該能查詢你的 Azure 訂閱狀態，以及詢問已部署的資源或設定。嘗試以下提示：

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

你也可以詢問 Azure 文件並獲得以 Microsoft Docs MCP 伺服器為基礎的回覆。嘗試以下提示：

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

或者你也可以索取完成任務的程式碼範例。嘗試此提示：

1. `Give me a Python code example that uses AAD for an interactive chat client`

在「Ask」模式下，它會提供程式碼供你複製貼上並嘗試。在「Agent」模式下，可能會進一步為你建立相關資源——包括設定腳本和文件——協助你完成該任務。

**你現在裝備完成，可以開始探索範本儲存庫了**

---

## 2. 解構架構

??? prompt "ASK: 解釋 docs/images/architecture.png 中的應用程式架構，限制在一段文字內"

      此應用程式是一個 AI 驅動的聊天應用，建立於 Azure 上，展示了現代代理架構。解決方案核心是一個 Azure Container App，承載主要應用程式程式碼，負責處理使用者輸入並透過 AI 代理產生智能回應。
      
      該架構利用 Microsoft Foundry 專案作為 AI 能力的基礎，連接到提供底層語言模型（如 gpt-4.1-mini）及代理功能的 Azure AI 服務。使用者互動從基於 React 的前端流向 FastAPI 後端，與 AI 代理服務溝通以生成上下文相關的回應。
      
      系統透過文件檢索功能，利用檔案搜尋或 Azure AI 搜尋服務，允許代理存取並引用上傳文件中的資訊。為了營運卓越，架構包含完整的觀測方案，透過 Application Insights 和 Log Analytics Workspace 進行追蹤、日誌記錄及效能優化。
      
      Azure Storage 提供 Blob 儲存應用程式資料和檔案上傳，而 Managed Identity 確保 Azure 資源間安全存取，無需儲存憑證。整體解決方案為可擴充且易於維護設計，容器化應用程式可根據需求自動擴展，並透過 Azure 的託管服務生態系統提供內建安全性、監控與 CI/CD 能力。

![Architecture](../../../../../translated_images/zh-TW/architecture.48d94861e6e6cdc0.webp)

---

## 3. 儲存庫結構

!!! prompt "ASK: 解釋範本資料夾結構。請先以視覺階層圖表呈現。"

??? info "回答: 視覺階層圖表"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 設定與配置
      │   ├── azure.yaml                    # Azure 開發人員 CLI 配置
      │   ├── docker-compose.yaml           # 本地開發容器
      │   ├── pyproject.toml                # Python 專案設定
      │   ├── requirements-dev.txt          # 開發相依套件
      │   └── .devcontainer/                # VS Code 開發容器設定
      │
      ├── 🏗️ 基礎架構 (infra/)
      │   ├── main.bicep                    # 主要基礎架構範本
      │   ├── api.bicep                     # API 專用資源
      │   ├── main.parameters.json          # 基礎架構參數
      │   └── core/                         # 模組化基礎架構組件
      │       ├── ai/                       # AI 服務配置
      │       ├── host/                     # 主機基礎架構
      │       ├── monitor/                  # 監控與日誌
      │       ├── search/                   # Azure AI 搜尋設置
      │       ├── security/                 # 安全與身分識別
      │       └── storage/                  # 儲存帳戶配置
      │
      ├── 💻 應用程式原始碼 (src/)
      │   ├── api/                          # 後端 API
      │   │   ├── main.py                   # FastAPI 應用入口
      │   │   ├── routes.py                 # API 路由定義
      │   │   ├── search_index_manager.py   # 搜尋功能
      │   │   ├── data/                     # API 資料處理
      │   │   ├── static/                   # 靜態網頁資源
      │   │   └── templates/                # HTML 範本
      │   ├── frontend/                     # React/TypeScript 前端
      │   │   ├── package.json              # Node.js 相依套件
      │   │   ├── vite.config.ts            # Vite 建置設定
      │   │   └── src/                      # 前端原始碼
      │   ├── data/                         # 範例資料檔案
      │   │   └── embeddings.csv            # 預先計算的詞嵌入
      │   ├── files/                        # 知識庫檔案
      │   │   ├── customer_info_*.json      # 客戶資料範例
      │   │   └── product_info_*.md         # 產品文件
      │   ├── Dockerfile                    # 容器配置
      │   └── requirements.txt              # Python 相依套件
      │
      ├── 🔧 自動化與腳本 (scripts/)
      │   ├── postdeploy.sh/.ps1           # 部署後設定腳本
      │   ├── setup_credential.sh/.ps1     # 憑證配置腳本
      │   ├── validate_env_vars.sh/.ps1    # 環境變數驗證
      │   └── resolve_model_quota.sh/.ps1  # 模型配額管理
      │
      ├── 🧪 測試與評估
      │   ├── tests/                        # 單元與整合測試
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # 代理評估框架
      │   │   ├── evaluate.py               # 評估執行器
      │   │   ├── eval-queries.json         # 測試查詢
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # 開發沙盒
      │   │   ├── 1-quickstart.py           # 快速上手範例
      │   │   └── aad-interactive-chat.py   # 驗證範例
      │   └── airedteaming/                 # AI 安全性評估
      │       └── ai_redteaming.py          # 紅隊測試
      │
      ├── 📚 文件 (docs/)
      │   ├── deployment.md                 # 部署指南
      │   ├── local_development.md          # 本地開發說明
      │   ├── troubleshooting.md            # 常見問題與解決方案
      │   ├── azure_account_setup.md        # Azure 先決條件
      │   └── images/                       # 文件資產
      │
      └── 📄 專案元資料
         ├── README.md                     # 專案概述
         ├── CODE_OF_CONDUCT.md           # 社群準則
         ├── CONTRIBUTING.md              # 貢獻指南
         ├── LICENSE                      # 授權條款
         └── next-steps.md                # 部署後指引
      ```

### 3.1 核心應用程式架構

此範本遵循 <strong>全端網頁應用程式</strong> 模式，包含：

- <strong>後端</strong>：使用 Python FastAPI 並整合 Azure AI
- <strong>前端</strong>：TypeScript/React，採用 Vite 建置系統
- <strong>基礎架構</strong>：Azure Bicep 範本管理雲端資源
- <strong>容器化</strong>：使用 Docker 以確保部署一致性

### 3.2 基礎架構即程式碼 (bicep)

基礎架構層採用 **Azure Bicep** 範本，以模組化方式組織：

   - **`main.bicep`**：協調所有 Azure 資源
   - **`core/` 模組**：不同服務的可重用組件
      - AI 服務（Microsoft Foundry 模型、AI 搜尋）
      - 容器主機（Azure Container Apps）
      - 監控（Application Insights、Log Analytics）
      - 安全（Key Vault、Managed Identity）

### 3.3 應用程式原始碼 (`src/`)

**後端 API (`src/api/`)**：

- 基於 FastAPI 的 REST API
- Foundry 代理整合
- 搜尋索引管理以支援知識檢索
- 檔案上傳與處理功能

**前端 (`src/frontend/`)**：

- 現代 React/TypeScript 單頁應用程式
- 使用 Vite 以加速開發與優化建置
- 代理互動的聊天介面

**知識庫 (`src/files/`)**：

- 客戶和產品的範例資料
- 展示基於檔案的知識檢索
- JSON 與 Markdown 格式範例


### 3.4 DevOps 與自動化

**腳本 (`scripts/`)**：

- 跨平台 PowerShell 與 Bash 腳本
- 環境驗證與設定
- 部署後配置
- 模型配額管理

**Azure 開發人員 CLI 整合**：

- `azure.yaml` 配置的 `azd` 工作流程
- 自動供應與部署
- 環境變數管理

### 3.5 測試與品質保證

**評估框架 (`evals/`)**：

- 代理效能評估
- 查詢回應品質測試
- 自動化評估流程

**AI 安全 (`airedteaming/`)**：

- AI 安全的紅隊測試
- 安全漏洞掃描
- 負責任的 AI 實踐

---

## 4. 恭喜 🏆

你已成功使用 MCP 伺服器啟用 GitHub Copilot 聊天功能，探索整個儲存庫。

- [X] 啟用 GitHub Copilot 協助 Azure
- [X] 了解應用程式架構
- [X] 探索 AZD 範本結構

這讓你對此範本的 _基礎架構即程式碼_ 資產有基本認識。接下來，我們將檢視 AZD 的設定檔。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不準確之處。原文件的母語版本應被視為權威來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用本翻譯所產生的任何誤解或誤讀負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->