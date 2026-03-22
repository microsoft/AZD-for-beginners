# 3. 拆解範本

!!! tip "完成本模組後，您將能夠"

    - [ ] 啟用搭配 MCP 伺服器的 GitHub Copilot 以協助 Azure
    - [ ] 了解 AZD 範本資料夾結構與元件
    - [ ] 探索基礎設施即程式碼（Bicep）的組織模式
    - [ ] **實驗 3：** 使用 GitHub Copilot 探索並了解程式庫架構 

---


使用 AZD 範本和 Azure Developer CLI (`azd`)，我們可以快速啟動 AI 開發旅程，透過標準化的程式庫，提供示範程式碼、基礎設施與組態檔——以可立刻部署的 _起始_ 專案形式。

**但是現在，我們需要了解專案結構與程式碼庫，並且能夠自訂 AZD 範本——即使以前沒有 AZD 的經驗或理解！**

---

## 1. 啟用 GitHub Copilot

### 1.1 安裝 GitHub Copilot Chat

現在是時候探索[搭配代理模式的 GitHub Copilot](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode)了。現在，我們可以用自然語言來描述我們的任務概況，並獲得執行上的協助。這次實驗中，我們將使用[免費版 Copilot](https://github.com/github-copilot/signup)，該版本每月對補全與聊天互動有限制。

此擴充功能可從市集安裝，但在您的 Codespaces 環境中應已預先可用。_從 Copilot 圖示下拉選單點擊 `Open Chat`，然後輸入像是 `What can you do?` 的提示語_ ——您可能會被要求登入。**GitHub Copilot Chat 已就緒**。

### 1.2. 安裝 MCP 伺服器

代理模式要有效運作，需要存取適當工具，協助檢索知識或執行行動。這時 MCP 伺服器便派上用場。我們將配置以下伺服器：

1. [Azure MCP 伺服器](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP 伺服器](../../../../../workshop/docs/instructions)

啟用步驟：

1. 如果不存在，請建立 `.vscode/mcp.json` 檔案
1. 將以下內容複製到該檔案，並啟動伺服器！
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

??? warning "您可能會遇到 `npx` 未安裝的錯誤（點擊展開修正步驟）"

      修正方式是開啟 `.devcontainer/devcontainer.json` 檔案，並在 features 區段新增此行，然後重建容器，即可安裝 `npx`。

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. 測試 GitHub Copilot Chat

**請先使用 `az login` 從 VS Code 命令列認證 Azure 身分。**

您現在應該能查詢 Azure 訂閱狀態，並詢問已部署資源或組態相關的問題。嘗試以下提示：

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

您還可以詢問 Azure 文件相關的問題，並獲得以 Microsoft Docs MCP 伺服器為依據的回應。試試這些提示：

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

或者您可以索取程式片段來完成任務。試試這個提示。

1. `Give me a Python code example that uses AAD for an interactive chat client`

在「問」模式下，系統會提供可複製貼上的程式碼供您試用；在「代理」模式下，可能會更進一步建立相關資源——包含設定腳本和文件——協助您執行該任務。

<strong>您現在已具備探索範本程式庫的能力</strong>

---

## 2. 拆解架構

??? prompt "問：用一段話說明 docs/images/architecture.png 中的應用程式架構"

      此應用程式是一個以 Azure 為基礎的 AI 對話應用，展示了現代代理架構。解決方案核心是一個 Azure Container App，負責主應用程式程式碼，處理使用者輸入並透過 AI 代理產生智慧回應。
      
      架構基於 Microsoft Foundry 專案為 AI 能力基礎，連接 Azure AI 服務，提供底層語言模型（如 gpt-4.1-mini）與代理功能。使用者透過基於 React 的前端介面，連接 FastAPI 後端，再與 AI 代理服務通訊以生成有上下文的回應。
      
      系統整合知識檢索功能，可經由檔案搜尋或 Azure AI 搜尋服務，讓代理能存取並引用上傳的文件資訊。
      
      為確保營運效率，架構包含 Application Insights 與 Log Analytics Workspace，用於追蹤、記錄與效能優化。
      
      Azure Storage 提供應用資料與檔案上傳的 Blob 儲存，Managed Identity 則確保 Azure 資源間安全存取，無需存放密鑰。整體解決方案設計為可擴充且易於維護，容器化應用根據需求自動擴展，並透過 Azure 管理服務生態系統提供內建安全性、監控與 CI/CD 能力。

![Architecture](../../../../../translated_images/zh-HK/architecture.48d94861e6e6cdc0.webp)

---

## 3. 程式庫結構

!!! prompt "問：解釋範本資料夾結構。從視覺階層圖開始。"

??? info "答：視覺階層圖"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 配置與設定
      │   ├── azure.yaml                    # Azure Developer CLI 組態
      │   ├── docker-compose.yaml           # 本地開發容器
      │   ├── pyproject.toml                # Python 專案組態
      │   ├── requirements-dev.txt          # 開發專用依賴
      │   └── .devcontainer/                # VS Code 開發容器設定
      │
      ├── 🏗️ 基礎設施 (infra/)
      │   ├── main.bicep                    # 主要基礎設施範本
      │   ├── api.bicep                     # API 專用資源
      │   ├── main.parameters.json          # 基礎設施參數
      │   └── core/                         # 模組化基礎設施元件
      │       ├── ai/                       # AI 服務組態
      │       ├── host/                     # 主機基礎設施
      │       ├── monitor/                  # 監控與日誌
      │       ├── search/                   # Azure AI 搜尋設定
      │       ├── security/                 # 安全性與身分識別
      │       └── storage/                  # 儲存帳號配置
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
      │   │   ├── package.json              # Node.js 依賴
      │   │   ├── vite.config.ts            # Vite 建置設定
      │   │   └── src/                      # 前端原始碼
      │   ├── data/                         # 範例資料檔案
      │   │   └── embeddings.csv            # 預先計算的向量
      │   ├── files/                        # 知識庫檔案
      │   │   ├── customer_info_*.json      # 客戶資料範本
      │   │   └── product_info_*.md         # 產品文件
      │   ├── Dockerfile                    # 容器組態
      │   └── requirements.txt              # Python 依賴
      │
      ├── 🔧 自動化與腳本 (scripts/)
      │   ├── postdeploy.sh/.ps1           # 部署後設定
      │   ├── setup_credential.sh/.ps1     # 憑證設定
      │   ├── validate_env_vars.sh/.ps1    # 環境驗證
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
      │   │   ├── 1-quickstart.py           # 入門範例
      │   │   └── aad-interactive-chat.py   # 認證範例
      │   └── airedteaming/                 # AI 安全評估
      │       └── ai_redteaming.py          # 紅隊測試
      │
      ├── 📚 文件 (docs/)
      │   ├── deployment.md                 # 部署指南
      │   ├── local_development.md          # 本地開發說明
      │   ├── troubleshooting.md            # 常見問題與修正
      │   ├── azure_account_setup.md        # Azure 先決條件
      │   └── images/                       # 文件資源
      │
      └── 📄 專案元資料
         ├── README.md                     # 專案總覽
         ├── CODE_OF_CONDUCT.md           # 社群守則
         ├── CONTRIBUTING.md              # 參與指南
         ├── LICENSE                      # 授權條款
         └── next-steps.md                # 部署後指引
      ```

### 3.1. 核心應用程式架構

此範本遵循<strong>全端網頁應用程式</strong>模式，包含：

- <strong>後端</strong>：Python FastAPI 搭配 Azure AI 整合
- <strong>前端</strong>：TypeScript/React 與 Vite 建置系統
- <strong>基礎設施</strong>：使用 Azure Bicep 範本定義雲端資源
- <strong>容器化</strong>：Docker 確保部署一致性

### 3.2 基礎設施即程式碼（Bicep）

基礎設施層使用<strong>Azure Bicep</strong>範本，採模組化組織：

   - **`main.bicep`**：協調所有 Azure 資源
   - **`core/` 模組**：可重用元件，對應不同服務
      - AI 服務（Microsoft Foundry 模型、AI 搜尋）
      - 容器主控（Azure Container Apps）
      - 監控（Application Insights、Log Analytics）
      - 安全性（Key Vault、Managed Identity）

### 3.3 應用程式原始碼 (`src/`)

**後端 API (`src/api/`)**：

- 基於 FastAPI 的 REST API
- Foundry 代理整合
- 搜尋索引管理以支援知識檢索
- 檔案上傳與處理功能

**前端 (`src/frontend/`)**：

- 現代 React/TypeScript SPA
- 使用 Vite 提供快速開發與最佳化建置
- 代理互動聊天介面

**知識庫 (`src/files/`)**：

- 範例客戶與產品資料
- 展示基於檔案的知識檢索
- JSON 與 Markdown 格式示例


### 3.4 DevOps 與自動化

**腳本 (`scripts/`)**：

- 跨平台 PowerShell 與 Bash 腳本
- 環境驗證及設定
- 部署後配置
- 模型配額管理

**Azure Developer CLI 整合**：

- `azure.yaml` 組態設定 `azd` 工作流程
- 自動化佈署與資源供應
- 環境變數管理

### 3.5 測試與品質保證

**評估框架 (`evals/`)**：

- 代理效能評估
- 查詢-回應品質測試
- 自動化評估流水線

**AI 安全 (`airedteaming/`)**：

- AI 安全的紅隊測試
- 安全弱點掃描
- 負責任的 AI 實踐

---

## 4. 恭喜 🏆

您已成功使用 GitHub Copilot Chat 搭配 MCP 伺服器，探索這個程式庫。

- [X] 啟用了支援 Azure 的 GitHub Copilot
- [X] 了解了應用程式架構
- [X] 探索了 AZD 範本結構

這讓您對範本中的 _基礎設施即程式碼_ 資產有初步認識。接下來，我們將觀察 AZD 的組態檔。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始語言文件應被視為權威來源。對於重要資訊，建議使用專業人工翻譯。我們不對因使用本翻譯所引起的任何誤解或錯誤詮釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->