# 變更紀錄 - AZD 初學者指南

## 介紹

此變更紀錄記錄 AZD 初學者指南倉庫中所有重大變更、更新與改進。我們遵循語義版本控制原則，並維護此日誌以幫助使用者了解版本間的差異。

## 學習目標

透過檢視此變更紀錄，您將能：
- 了解新增功能與內容擴充
- 理解現有文件的改進之處
- 追蹤錯誤修正與更正以確保準確性
- 跟隨學習材料的演變過程

## 學習成果

閱讀變更條目後，您將能：
- 辨識可用的全新學習內容與資源
- 了解哪些章節已被更新或改良
- 根據最新材料規劃學習路徑
- 提出回饋與建議，促進未來改進

## 版本歷史

### [v3.19.1] - 2026-03-27

#### 初學者入門說明、設定驗證與最終 AZD 命令清理
**此版本延續 AZD 1.23 驗證掃描，進行針對初學者的文件更新：釐清以 AZD 為優先的身份驗證指導，新增本地設定驗證腳本，核對重要命令與現行 AZD CLI 符合，並移除變更紀錄外最後的過時英文原始命令參考。**

#### 新增
- **🧪 初學者設定驗證腳本**，包含 `validate-setup.ps1` 與 `validate-setup.sh`，讓學習者可在開始第一章前確定所需工具已具備
- **✅ 事前設定驗證步驟**，置於根目錄 README 與第一章 README 中，以於執行 `azd up` 前偵測漏缺的先決條件

#### 變更
- **🔐 初學者身份驗證指導**，統一將 `azd auth login` 視為 AZD 工作流程的主要路徑，`az login` 僅在直接使用 Azure CLI 命令時選用說明
- **📚 第一章入門流程**，指導學習者在安裝、身份驗證與首個部署前先驗證本地設定
- **🛠️ 驗證工具訊息**，明確分開阻擋需求與 Azure CLI 選用性警告，專為僅用 AZD 的初學者設計
- **📖 設定、故障排除與範例文件**，區分必需 AZD 認證與可選用 Azure CLI 登入（兩者過往未加區隔）

#### 修正
- **📋 剩餘英文指令參考**，更新為現行 AZD 格式，包括備忘紙中的 `azd config show` 與以 Azure 入口網概覽說明為意圖的 `azd monitor --overview`
- **🧭 第一章初學者承諾**，語氣調整以避免過度保證所有範本及 Azure 資源零錯誤或回滾行為
- **🔎 即時 CLI 驗證**，確認當前支援 `azd env get-values`、`azd template list`、`azd extension list --installed`、`azd copilot consent list`、`azd mcp start`、`azd provision --preview`、`azd monitor --logs` 與 `azd down --force --purge`

#### 更新檔案
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### AZD 1.23.12 驗證、工作坊環境擴充與 AI 模型刷新
**此版本針對 `azd` 1.23.12 版本進行文件驗證掃描，更新過時 AZD 命令範例，刷新 AI 模型指導以符合最新預設，且將工作坊指引從 GitHub Codespaces 擴展至開發容器與本地複製支持。**

#### 新增
- **✅ 核心章節與工作坊文件的驗證說明**，明確告知學習者所用 AZD CLI 版本基準，避免使用新版或舊版產生混淆
- **⏱️ 長時間 AI 應用部署的超時指引**，示範使用 `azd deploy --timeout 1800`
- **🔎 擴充指令檢查步驟**，示範使用 `azd extension show azure.ai.agents` 探查 AI 工作流程擴充套件
- **🌐 更廣泛工作坊環境指導**，涵蓋 GitHub Codespaces、開發容器與本地複製的 MkDocs 配置

#### 變更
- **📚 章節起始 README**，統一標示所有章節針對 `azd 1.23.12` 版本驗證，包含基礎、設定、基礎架構、多代理、預部署、故障排除與生產等
- **🛠️ AZD 命令參考**，更新為當前格式：
  - `azd config list` → `azd config show`
  - `azd env show` → 根據情境改為 `azd env list` 或 `azd env get-value(s)`
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → 針對 Application Insights 概覽改為 `azd monitor --overview`
- **🧪 預覽版 provision 範例**，簡化為現行支援用法如 `azd provision --preview` 與 `azd provision --preview -e production`
- **🧭 工作坊流程**，改為允許使用 Codespaces、開發容器及本地複製完成實驗操作，不再僅限 Codespaces
- **🔐 身份驗證指導**，偏好使用 `azd auth login` 作為 AZD 工作流程主要登入，`az login` 僅當須直接執行 Azure CLI 指令時為選擇性指令

#### 修正
- **🪟 Windows 安裝指令**，在安裝指南中統一改用當前 `winget` 軟體包大小寫
- **🐧 Linux 安裝指引**，修正避免不支援的特定發行版 `azd` 軟體包管理指令，並改指向發行資源下載
- **📦 AI 模型範例**，從較舊的 `gpt-35-turbo` 和 `text-embedding-ada-002` 刷新至當前版本如 `gpt-4.1-mini`、`gpt-4.1` 及 `text-embedding-3-large`
- **📋 部署與診斷代碼片段**，修正為目前環境狀態命令用法，涵蓋日誌、腳本與故障排除步驟
- **⚙️ GitHub Actions 指南**，升級從 `Azure/setup-azd@v1.0.0` 至 `Azure/setup-azd@v2`
- **🤖 MCP/Copilot 同意指導**，將命令從 `azd mcp consent` 更新為 `azd copilot consent list`

#### 改進
- **🧠 AI 章節指導**，更清楚解釋預覽期敏感的 `azd ai` 行為、多租戶登入流程、現行擴充套件用法及更新模型部署建議
- **🧪 工作坊指令**，改用更具實際情境的版本範例及更清晰的環境設置描述
- **📈 生產與故障排除文件**，與現行監控、回退模型及成本層級範例更為一致

#### 更新檔案
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### AZD AI CLI 命令、內容驗證與範本擴充
**此版本於所有 AI 相關章節新增了 `azd ai`、`azd extension` 與 `azd mcp` 指令涵蓋，修復 agents.md 中的損壞連結與過時代碼，更新備忘紙，並對範例範本區塊進行大改，包括經驗證的說明與新 Azure AI AZD 範本。**

#### 新增
- **🤖 AZD AI CLI 指令涵蓋**，跨越 7 個檔案（此前僅於第 8 章涵蓋）：
  - `docs/chapter-01-foundation/azd-basics.md` — 新增「擴充套件與 AI 指令」章節，介紹 `azd extension`、`azd ai agent init` 與 `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — 選項 4：`azd ai agent init` 及範本與清單式部署法比較表
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — 「AZD Extensions for Foundry」及「Agent-First Deployment」子節
  - `docs/chapter-05-multi-agent/README.md` — 快速入門示範同時顯示基於範本與清單的部署路徑
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — 部署部分新增 `azd ai agent init` 選項
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — 「AZD AI 擴充診斷指令」子節
  - `resources/cheat-sheet.md` — 新增「AI 與擴充指令」章節，涵蓋 `azd extension`、`azd ai agent init`、`azd mcp` 及 `azd infra generate`
- <strong>📦 新增 AZD AI 範例範本</strong>於 `microsoft-foundry-integration.md`：
  - **azure-search-openai-demo-csharp** — .NET RAG 聊天範例，採用 Blazor WebAssembly、Semantic Kernel 及語音聊天支援
  - **azure-search-openai-demo-java** — Java RAG 聊天，使用 Langchain4J 並提供 ACA/AKS 部署選項
  - **contoso-creative-writer** — 多代理創意寫作應用，結合 Azure AI Agent Service、Bing Grounding 與 Prompty
  - **serverless-chat-langchainjs** — 無伺服器 RAG，運用 Azure Functions + LangChain.js + Cosmos DB，支援 Ollama 本地開發
  - **chat-with-your-data-solution-accelerator** — 企業級 RAG 加速器，提供管理入口網、Teams 整合及 PostgreSQL/Cosmos DB 選擇
  - **azure-ai-travel-agents** — 多代理 MCP 編排參考應用，含 .NET、Python、Java 及 TypeScript 伺服器
  - **azd-ai-starter** — 精簡 Azure AI 基礎架構 Bicep 起始範本
  - **🔗 精彩 AZD AI 畫廊鏈結** — 參考 [awesome-azd AI 畫廊](https://azure.github.io/awesome-azd/?tags=ai)（超過 80 個範本）

#### 修正
- **🔗 agents.md 導航**：前後頁面連結修正為符合第 2 章 README 課程順序（Microsoft Foundry Integration → Agents → AI Model Deployment）
- **🔗 agents.md 損壞連結**：修正 `production-ai-practices.md` 連結為 `../chapter-08-production/production-ai-practices.md`（3 處）
- **📦 agents.md 過時代碼**：將 `opencensus` 換為 `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md 無效 API**：將 `max_tokens` 從 `create_agent()` 移至 `create_run()`，改用 `max_completion_tokens`
- **🔢 agents.md 令牌計數**：將粗略 `len//4` 估算改為使用 `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**：更正服務名稱，由「Cognitive Search + App Service」改為「Azure AI Search + Azure Container Apps」（預設主機於 2024 年 10 月更動）
- **contoso-chat**：更新說明以指涉 Azure AI Foundry + Prompty，符合倉庫實際標題與技術棧

#### 移除
- **ai-document-processing**：移除無法使用的範本參考（該倉庫未公開為 AZD 範本）

#### 改進
- **📝 agents.md 練習**：練習 1 現在顯示預期輸出與 `azd monitor` 步驟；練習 2 包含完整的 `FunctionTool` 註冊程式碼；練習 3 用具體的 `prepdocs.py` 指令取代模糊指示  
- **📚 agents.md 資源**：文件連結更新至最新 Azure AI Agent Service 文件與快速入門  
- **📋 agents.md 下一步表格**：新增 AI 工作坊實驗室連結，完整涵蓋章節內容  

#### 更新檔案  
- `docs/chapter-01-foundation/azd-basics.md`  
- `docs/chapter-02-ai-development/agents.md`  
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`  
- `docs/chapter-05-multi-agent/README.md`  
- `docs/chapter-06-pre-deployment/coordination-patterns.md`  
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`  
- `resources/cheat-sheet.md`  

---

### [v3.17.0] - 2026-02-05

#### 課程導覽增強  
**此版本改進 README.md 章節導覽，採用更完善的表格格式。**

#### 變更  
- <strong>課程地圖表格</strong>：增強直接課程連結、預估時長與難度等級  
- <strong>資料夾清理</strong>：移除冗餘舊資料夾（deployment/、getting-started/、pre-deployment/、troubleshooting/）  
- <strong>連結驗證</strong>：課程地圖表格中 21+ 個內部連結皆已驗證  

### [v3.16.0] - 2026-02-05

#### 產品名稱更新  
**此版本更新產品參考，對應現行 Microsoft 品牌名稱。**

#### 變更  
- **Microsoft Foundry → Microsoft Foundry**：非翻譯檔案中所有引用更新  
- **Azure AI Agent Service → Foundry Agents**：服務名稱更名稱以反映最新品牌  

#### 更新檔案  
- `README.md` - 主要課程首頁  
- `changelog.md` - 版本歷史  
- `course-outline.md` - 課程結構  
- `docs/chapter-02-ai-development/agents.md` - AI 代理指南  
- `examples/README.md` - 範例文件  
- `workshop/README.md` - 工作坊首頁  
- `workshop/docs/index.md` - 工作坊索引  
- `workshop/docs/instructions/*.md` - 所有工作坊指令文件  

---

### [v3.15.0] - 2026-02-05

#### 主要資料庫重組：以章節為資料夾名稱  
**此版本將文件重新組織為專門章節資料夾，以利清楚導覽。**

#### 資料夾重新命名  
舊資料夾被章節編號資料夾取代：  
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`  
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`  
- `docs/deployment/` → `docs/chapter-04-infrastructure/`  
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`  
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`  
- 新增：`docs/chapter-05-multi-agent/`  

#### 檔案遷移  
| 檔案 | 從 | 到 |  
|------|------|---|  
| azd-basics.md | getting-started/ | chapter-01-foundation/ |  
| installation.md | getting-started/ | chapter-01-foundation/ |  
| first-project.md | getting-started/ | chapter-01-foundation/ |  
| configuration.md | getting-started/ | chapter-03-configuration/ |  
| authsecurity.md | getting-started/ | chapter-03-configuration/ |  
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |  
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |  
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |  
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |  
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |  
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |  
| provisioning.md | deployment/ | chapter-04-infrastructure/ |  
| 所有 pre-deployment 檔案 | pre-deployment/ | chapter-06-pre-deployment/ |  
| 所有 troubleshooting 檔案 | troubleshooting/ | chapter-07-troubleshooting/ |  

#### 新增  
- **📚 章節 README 檔案**：於各章節資料夾新增 README.md，內容包含：  
  - 學習目標與時長  
  - 課程表格與說明  
  - 快速起步指令  
  - 章節間導覽  

#### 變更  
- **🔗 更新所有內部連結**：超過 78 條路徑跨所有文件更新  
- **🗺️ 主要 README.md**：課程地圖更新為新章節結構  
- **📝 examples/README.md**：更新到章節資料夾的跨參考  

#### 移除  
- 舊資料夾結構（getting-started/、microsoft-foundry/、deployment/、pre-deployment/、troubleshooting/、ai-foundry/）  

---

### [v3.14.0] - 2026-02-05

#### 資料庫重組：章節導覽  
**此版本新增章節導覽 README 文件（後被 v3.15.0 取代）。**

---

### [v3.13.0] - 2026-02-05

#### 新增 AI 代理指南  
**此版本新增針對使用 Azure Developer CLI 部署 AI 代理的完整指南。**

#### 新增  
- **🤖 docs/microsoft-foundry/agents.md**：全方位指南涵蓋：  
  - AI 代理是什麼及其與聊天機器人的差異  
  - 三種快速起步代理樣板（Foundry Agents、Prompty、RAG）  
  - 代理架構模式 (單代理、RAG、多代理)  
  - 工具配置與客製化  
  - 監控與指標追蹤  
  - 成本考量與優化  
  - 常見疑難排解情境  
  - 三個實作練習與成功標準  

#### 內容架構  
- <strong>介紹</strong>：初學者代理概念  
- <strong>快速起步</strong>：`azd init --template get-started-with-ai-agents` 部署代理  
- <strong>架構模式</strong>：代理模式示意圖  
- <strong>配置</strong>：工具設定與環境變數  
- <strong>監控</strong>：Application Insights 整合  
- <strong>練習</strong>：分階段手把手學習（每個 20-45 分鐘）  

---

### [v3.12.0] - 2026-02-05

#### DevContainer 環境更新  
**此版本更新開發容器設定，包含現代化工具及適合 AZD 學習體驗的預設值。**

#### 變更  
- **🐳 基底映像**：從 `python:3.12-bullseye` 更新為 `python:3.12-bookworm`（最新 Debian 穩定版）  
- **📛 容器命名**：由「Python 3」改為「AZD for Beginners」，更清楚說明用途  

#### 新增  
- **🔧 新開發容器功能**：  
  - `azure-cli` 加入 Bicep 支援  
  - `node:20`（AZD 樣板的 LTS 版本）  
  - `github-cli` 方便樣板管理  
  - `docker-in-docker` 用於容器應用部署  

- **🔌 轉發埠口**：預設常用開發埠口  
  - 8000 (MkDocs 預覽)  
  - 3000 (Web 應用)  
  - 5000 (Python Flask)  
  - 8080 (API)  

- **🧩 新增 VS Code 擴充套件**：  
  - `ms-python.vscode-pylance` - 強化 Python 智慧感知  
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions 支援  
  - `ms-azuretools.vscode-docker` - Docker 支持  
  - `ms-azuretools.vscode-bicep` - Bicep 語言支援  
  - `ms-azure-devtools.azure-resource-groups` - Azure 資源管理  
  - `yzhang.markdown-all-in-one` - Markdown 編輯  
  - `DavidAnson.vscode-markdownlint` - Markdown 格式檢查  
  - `bierner.markdown-mermaid` - Mermaid 圖表支援  
  - `redhat.vscode-yaml` - YAML 支援（用於 azure.yaml）  
  - `eamodio.gitlens` - Git 視覺化  
  - `mhutchie.git-graph` - Git 歷史  

- **⚙️ VS Code 設定**：新增預設 Python 解譯器、儲存即格式化、修剪空白字元等設定  

- **📦 更新 requirements-dev.txt**：  
  - 新增 MkDocs 壓縮插件  
  - 新增 pre-commit 以提升程式碼品質  
  - 新增 Azure SDK 套件（azure-identity、azure-mgmt-resource）  

#### 修正  
- **Post-Create 指令**：容器啟動時檢驗 AZD 和 Azure CLI 安裝狀況  

---

### [v3.11.0] - 2026-02-05

#### 友善初學者的 README 大改版  
**此版本大幅改進 README.md，可讓初學者更容易上手，並新增 AI 開發者必備資源。**

#### 新增  
- **🆚 Azure CLI 與 AZD 差異比較**：明確說明何時該使用哪個工具，並含實用範例  
- **🌟 精選 AZD 連結**：社群樣板庫與貢獻資源的直接連結：  
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ 個可快速部署樣板  
  - [提交樣板](https://github.com/Azure/awesome-azd/issues) - 社群貢獻入口  
- **🎯 快速起步指南**：簡化三步驟說明（安裝 → 登入 → 部署）  
- **📊 依經驗分級的導覽表**：根據開發者經驗提供清楚起步建議  

#### 變更  
- **README 結構**：重組以利漸進式揭露，重要資訊優先呈現  
- <strong>介紹章節</strong>：重寫說明「`azd up` 的神奇功效」給新手完整理解  
- <strong>移除重複內容</strong>：刪除重複的疑難排解章節  
- <strong>疑難排解指令</strong>：修正為使用有效的 `azd monitor --logs` 替代 `azd logs`  

#### 修正  
- **🔐 認證指令**：將 `azd auth login` 與 `azd auth logout` 新增入 cheat-sheet.md  
- <strong>修正無效指令引用</strong>：刪除 README 疑難排解章節中殘留的 `azd logs`  

#### 備註  
- <strong>範圍</strong>：變更影響主要 README.md 和 resources/cheat-sheet.md  
- <strong>目標對象</strong>：針對對 AZD 新手的開發者所做的改進  

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI 指令準確性修正  
**此版本修正文件中所有不存在的 AZD 指令，確保範例程式碼中均為有效的 Azure Developer CLI 語法。**

#### 修正  
- **🔧 移除不存在的 AZD 指令**：全面審核並修正無效指令：  
  - `azd logs`（不存在）→ 替換為 `azd monitor --logs` 或 Azure CLI 替代方案  
  - `azd service` 子指令（不存在）→ 以 `azd show` 與 Azure CLI 替代  
  - `azd infra import/export/validate`（不存在）→ 移除或替代為正確指令  
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` 選項（不存在）→ 移除  
  - `azd provision --what-if/--rollback` 選項（不存在）→ 改用 `--preview`  
  - `azd config validate`（不存在）→ 改用 `azd config list`  
  - `azd info`、`azd history`、`azd metrics`（不存在）→ 移除  

- **📚 已修正指令的檔案**：  
  - `resources/cheat-sheet.md`：指令參考全面大改  
  - `docs/deployment/deployment-guide.md`：修正回滾與部署策略  
  - `docs/troubleshooting/debugging.md`：修正日誌分析章節  
  - `docs/troubleshooting/common-issues.md`：更新疑難排解指令  
  - `docs/troubleshooting/ai-troubleshooting.md`：修正 AZD 偵錯章節  
  - `docs/getting-started/azd-basics.md`：修正監控指令  
  - `docs/getting-started/first-project.md`：更新監控與偵錯範例  
  - `docs/getting-started/installation.md`：修正幫助與版本範例  
  - `docs/pre-deployment/application-insights.md`：修正日誌檢視指令  
  - `docs/pre-deployment/coordination-patterns.md`：修正代理偵錯指令  

- **📝 版本引用更新**：  
  - `docs/getting-started/installation.md`：將硬編碼 `1.5.0` 版本改為通用 `1.x.x` 並附釋出連結  

#### 變更  
- <strong>回滾策略</strong>：文件更新為使用 Git 基礎的回滾（AZD 無內建回滾功能）  
- <strong>日誌檢視</strong>：將 `azd logs` 改為 `azd monitor --logs`、`azd monitor --live` 與 Azure CLI 指令  
- <strong>效能章節</strong>：移除不存在的平行/增量部署選項，提供有效替代方案  

#### 技術細節  

- **有效的 AZD 命令**：`init`、`up`、`auth`、`deploy`、`down`、`provision`、`publish`、`completion`、`config`、`env`、`show`、`version`、`monitor`
- **有效的 azd monitor 旗標**：`--live`、`--logs`、`--overview`
- <strong>已移除的功能</strong>：`azd logs`、`azd service`、`azd infra import/export/validate`、`azd history`、`azd metrics`、`azd info`、`azd config validate`

#### 注意事項
- <strong>驗證</strong>：命令經 Azure Developer CLI v1.23.x 驗證有效

---

### [v3.9.0] - 2026-02-05

#### 工作坊完成與文件品質更新
**此版本完成了互動式工作坊模組，修復所有失效的文件連結，並提升 Microsoft AZD AI 開發者的整體內容品質。**

#### 新增
- **📝 CONTRIBUTING.md**：新增貢獻指南文件，包含：
  - 清楚的問題回報與變更提案說明
  - 新增內容的文件標準
  - 程式碼範例指南與提交訊息規範
  - 社群參與相關資訊

#### 完成
- **🎯 工作坊模組 7（總結）**：完整完成總結模組，包含：
  - 工作坊成就的全面回顧
  - 掌握的關鍵概念章節，涵蓋 AZD、範本和 Microsoft Foundry
  - 持續學習路徑建議
  - 工作坊挑戰練習及難度等級
  - 社群反饋與支援連結

- **📚 工作坊模組 3（拆解）**：更新學習目標，包含：
  - GitHub Copilot 與 MCP 伺服器啟用指引
  - AZD 範本資料夾結構理解
  - 基礎設施即程式碼（Bicep）組織模式
  - 實作實驗室說明

- **🔧 工作坊模組 6（拆除）**：完成，包含：
  - 資源清理與成本管理目標
  - 使用 `azd down` 進行安全基礎設施拆除
  - 認知服務軟刪除復原指導
  - GitHub Copilot 與 Azure 入口網站的進階探索提示

#### 修復
- **🔗 失效連結修正**：解決 15 個以上內部文件失效連結：
  - `docs/ai-foundry/ai-model-deployment.md`：修正至 microsoft-foundry-integration.md 路徑
  - `docs/troubleshooting/ai-troubleshooting.md`：更正 ai-model-deployment.md 與 production-ai-practices.md 路徑
  - `docs/getting-started/first-project.md`：以 deployment-guide.md 取代不存在的 cicd-integration.md
  - `examples/retail-scenario.md`：修正 FAQ 與故障排除指南路徑
  - `examples/container-app/microservices/README.md`：更正課程首頁與部署指南路徑
  - `resources/faq.md` 與 `resources/glossary.md`：更新 AI 章節參考
  - `course-outline.md`：修正講師指南與 AI 工作坊實驗室參考

- **📅 工作坊狀態橫幅**：更新為二月 2026 年的正式工作坊狀態，移除「施工中」標示

- **🔗 工作坊導航**：修復 README.md 中指向不存在 lab-1-azd-basics 資料夾的壞連結

#### 變更
- <strong>工作坊呈現</strong>：移除「施工中」警告，工作坊現已完成並可使用
- <strong>導航一致性</strong>：確保所有工作坊模組間有正確的跨模組跳轉
- <strong>學習路徑參照</strong>：更新章節跨參照，使用正確的 microsoft-foundry 路徑

#### 驗證
- ✅ 所有英文 Markdown 文件內部連結有效
- ✅ 工作坊 0-7 模組完整且含學習目標
- ✅ 各章節與模組導航正常運作
- ✅ 內容適合使用 Microsoft AZD 的 AI 開發者
- ✅ 保持易懂且適合初學者的語言與結構
- ✅ CONTRIBUTING.md 提供清楚的社群貢獻指引

#### 技術執行
- <strong>連結驗證</strong>：自動 PowerShell 腳本驗證所有 .md 內部連結
- <strong>內容稽核</strong>：人工審核工作坊完整度與初學者適用性
- <strong>導航系統</strong>：統一章節及模組導航模式

#### 注意事項
- <strong>範圍</strong>：變更僅適用於英文文件
- <strong>翻譯</strong>：翻譯資料夾未在此版本更新（稍後會同步自動翻譯）
- <strong>工作坊時長</strong>：完整工作坊可提供 3-4 小時實作學習

---

### [v3.8.0] - 2025-11-19

#### 高階文件：監控、安全與多代理模式
**本版本新增完整的應用程式洞察整合、身分驗證模式，以及多代理協調生產部署的 A 級課程。**

#### 新增
- **📊 應用程式洞察整合課程**：位於 `docs/pre-deployment/application-insights.md`：
  - 以 AZD 為核心的自動部署與佈建
  - 完整 Application Insights + Log Analytics Bicep 範本
  - 含自訂遙測的 Python 工作範例（超過 1,200 行）
  - AI/LLM 監控模式（Microsoft Foundry Models 權杖與成本追蹤）
  - 6 個 Mermaid 架構圖（架構、分散式追蹤、遙測流程）
  - 3 項實作練習（警示、儀表板、AI 監控）
  - Kusto 查詢範例與成本優化策略
  - 即時指標串流與除錯
  - 約 40-50 分鐘學習時間，具生產級範例

- **🔐 身分驗證與安全模式課程**：位於 `docs/getting-started/authsecurity.md`：
  - 3 種驗證模式（連線字串、Key Vault、管理身分）
  - 完整安全部署 Bicep 架構範本
  - Node.js 應用程式與 Azure SDK 整合程式碼
  - 3 項完整練習（啟用管理身分、指派使用者身分、Key Vault 金鑰輪替）
  - 安全最佳實踐及角色基礎存取控制配置
  - 故障排除指導與成本分析
  - 生產級無密碼身分驗證模式

- **🤖 多代理協調模式課程**：位於 `docs/pre-deployment/coordination-patterns.md`：
  - 5 種協調模式（順序、平行、階層、事件驅動、共識）
  - 完整編排服務實作（Python/Flask，超過 1,500 行）
  - 3 個專屬代理實作（研究、撰稿、編輯）
  - 使用 Service Bus 進行訊息佇列整合
  - Cosmos DB 用於分散式系統狀態管理
  - 6 個代理互動 Mermaid 圖
  - 3 個進階練習（逾時處理、重試邏輯、斷路器模式）
  - 成本分解（每月 240 至 565 美元）及優化策略
  - 整合 Application Insights 監控

#### 強化
- <strong>預部署章節</strong>：新增監控與協調模式完整內容
- <strong>入門章節</strong>：強化專業身分驗證模式
- <strong>生產就緒</strong>：涵蓋安全至可觀測性全方位
- <strong>課程大綱</strong>：更新新增章節 3 與 6 的課程參考

#### 變更
- <strong>學習進度</strong>：更好串接安全與監控內容於整體課程
- <strong>文件品質</strong>：新課程均達穩定 A 級品質（95-97%）
- <strong>生產模式</strong>：端對端涵蓋企業部署所需模式

#### 改善
- <strong>開發體驗</strong>：清晰的從開發到生產監控流程
- <strong>安全標準</strong>：專業的驗證與密鑰管理模式
- <strong>可觀察性</strong>：AZD 與 Application Insights 深度整合
- **AI 工作負載**：專門為 Microsoft Foundry Models 多代理系統設計監控

#### 驗證
- ✅ 所有課程含完整可執行程式碼（非摘錄）
- ✅ Mermaid 圖輔助視覺學習（3 課程共 19 張圖）
- ✅ 實作練習含驗證步驟（共 9 項）
- ✅ 生產級 Bicep 範本可透過 `azd up` 部署
- ✅ 成本分析與優化策略
- ✅ 故障排除指引與最佳實踐
- ✅ 知識檢測指令

#### 文件評分結果
- **docs/pre-deployment/application-insights.md**：全面監控指南
- **docs/getting-started/authsecurity.md**：專業安全模式
- **docs/pre-deployment/coordination-patterns.md**：多代理進階架構
- <strong>整體新內容</strong>：高品質標準一致維持

#### 技術實作
- <strong>應用程式洞察</strong>：Log Analytics + 自訂遙測 + 分散式追蹤
- <strong>身分驗證</strong>：管理身分 + Key Vault + RBAC 模式
- <strong>多代理系統</strong>：Service Bus + Cosmos DB + Container Apps + 編排
- <strong>監控</strong>：即時指標 + Kusto 查詢 + 警示 + 儀表板
- <strong>成本管理</strong>：取樣策略、保存政策、預算控管

### [v3.7.0] - 2025-11-19

#### 文件品質提升及新增 Microsoft Foundry Models 範例
**本版本提升整體文件品質，並新增完整 Microsoft Foundry Models 部署範例，包含 gpt-4.1 聊天介面。**

#### 新增
- **🤖 Microsoft Foundry Models 聊天範例**：完整 gpt-4.1 部署，實作於 `examples/azure-openai-chat/`：
  - 完整 Microsoft Foundry Models 基礎架構（gpt-4.1 模型部署）
  - Python 命令列聊天介面與對話歷史
  - Key Vault 整合，安全管理 API 金鑰
  - 權杖使用追蹤與成本估算
  - 限流與錯誤處理
  - 詳盡 README，包含 35-45 分鐘部署指南
  - 11 個生產級檔案（Bicep 範本、Python 程式、設定）
- **📚 文件練習**：新增配置導引的實作練習：
  - 練習 1：多環境配置（15 分鐘）
  - 練習 2：秘密管理實作（10 分鐘）
  - 清楚的成功標準與驗證步驟
- **✅ 部署驗證**：新增部署導引驗證章節：
  - 健康檢查程序
  - 成功標準檢查表
  - 所有部署指令的預期輸出
  - 快速故障排除參考

#### 強化
- **examples/README.md**：更新為 A 級品質（93%）：
  - 新增 azure-openai-chat 至相關章節
  - 本地範例數量由 3 增至 4
  - 加入 AI 應用範例表
  - 融入中階用戶快速入門
  - 列入 Microsoft Foundry 範本章節
  - 更新比較矩陣與技術找尋說明
- <strong>文件品質</strong>：docs 資料夾從 B+（87%）提升到 A-（92%）：
  - 關鍵指令範例新增預期輸出
  - 配置變更加入驗證步驟
  - 實作練習提升動手學習效果

#### 變更
- <strong>學習進程</strong>：AI 範例更適合中階學習者
- <strong>文件結構</strong>：更多可操作練習並明確成果指標
- <strong>驗證流程</strong>：流程重點新增明確成功標準

#### 改善
- <strong>開發體驗</strong>：Microsoft Foundry Models 部署時間縮短至 35-45 分鐘（對比複雜方案 60-90 分鐘）
- <strong>成本透明度</strong>：Microsoft Foundry Models 範例成本估計 $50-200/月
- <strong>學習路徑</strong>：AI 開發者有明確入門點 azure-openai-chat
- <strong>文件標準</strong>：預期輸出與驗證步驟保持一致

#### 驗證
- ✅ Microsoft Foundry Models 範例可透過 `azd up` 完整執行
- ✅ 11 個實作檔案語法正確
- ✅ README 指示與部署結果相符
- ✅ 文件連結更新涵蓋超過 8 個位置
- ✅ 範例索引正確顯示 4 個本地範例
- ✅ 表格無重複外部連結
- ✅ 導航參照準確無誤

#### 技術執行
- **Microsoft Foundry Models 架構**：gpt-4.1 + Key Vault + Container Apps 模式
- <strong>安全性</strong>：預配置管理身分，秘密存於 Key Vault
- <strong>監控</strong>：整合 Application Insights
- <strong>成本管理</strong>：權杖追蹤與使用優化
- <strong>部署</strong>：單一 `azd up` 指令完成所有設定

### [v3.6.0] - 2025-11-19

#### 重大更新：Container App 部署範例
**本版本引入完整、可生產部署的 Container App 範例，透過 Azure Developer CLI (AZD) 並整合於學習路徑，附完整文件。**

#### 新增
- **🚀 Container App 範例**：新增本地範例於 `examples/container-app/`：
  - [總管指南](examples/container-app/README.md)：容器化部署完整概述，快速入門、生產環境與進階模式
  - [簡易 Flask API](../../examples/container-app/simple-flask-api)：適合初學者 REST API，支援 scale-to-zero、健康探測、監控與故障排除
  - [微服務架構](../../examples/container-app/microservices)：生產級多服務部署（API Gateway、產品、訂單、用戶、通知），非同步訊息、Service Bus、Cosmos DB、Azure SQL、分散式追蹤、藍綠／金絲雀部署
- <strong>最佳實踐</strong>：含容器工作負載的安全、監控、成本優化及 CI/CD 指引
- <strong>程式碼範例</strong>：完整 `azure.yaml`、Bicep 範本及多語言服務實作（Python、Node.js、C#、Go）
- <strong>測試與故障排除</strong>：端對端測試場景、監控指令與故障排除說明

#### 變更
- **README.md**：更新以新增並連結「本機範例 - 容器應用程式」下的新容器應用程式範例
- **examples/README.md**：更新以突顯容器應用程式範例、新增比較矩陣條目及更新技術/架構參考
- <strong>課程大綱與學習指南</strong>：更新以在相關章節中參考新的容器應用程式範例與部署模式

#### 已驗證
- ✅ 所有新範例均可使用 `azd up` 部署，且遵循最佳實踐
- ✅ 文件內部連結與導覽已更新
- ✅ 範例涵蓋從初學者到進階情境，包括生產環境微服務

#### 備註
- <strong>範圍</strong>：僅限英文文件與範例
- <strong>後續計畫</strong>：未來版本將擴展更多進階容器模式與 CI/CD 自動化

### [v3.5.0] - 2025-11-19

#### 產品重新命名：Microsoft Foundry  
**此版本在所有英文文件中全面將產品名稱由「Microsoft Foundry」更新為「Microsoft Foundry」，反映微軟官方重新命名。**

#### 變更項目
- **🔄 產品名稱更新**：全面從「Microsoft Foundry」改為「Microsoft Foundry」  
  - 更新 `docs/` 資料夾內所有英文文件中的引用  
  - 資料夾重新命名：`docs/ai-foundry/` 改為 `docs/microsoft-foundry/`  
  - 檔案重新命名：`azure-ai-foundry-integration.md` 改為 `microsoft-foundry-integration.md`  
  - 總計 7 個文件中共更新 23 處內容引用

- **📁 資料夾結構變更**：  
  - `docs/ai-foundry/` 改名為 `docs/microsoft-foundry/`  
  - 更新所有跨文件引用至新資料夾結構  
  - 驗證所有文件導覽連結

- **📄 檔案重命名**：  
  - `azure-ai-foundry-integration.md` 改為 `microsoft-foundry-integration.md`  
  - 更新所有內部連結參考新檔名

#### 更新文件
- <strong>章節文件</strong>（7 個文件）：  
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 處導覽連結更新  
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 處產品名稱引用更新  
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - 已使用 Microsoft Foundry 名稱（先前更新）  
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 處引用更新（概覽、社群反饋、文件）  
  - `docs/getting-started/azd-basics.md` - 4 處跨引用連結更新  
  - `docs/getting-started/first-project.md` - 2 處章節導覽連結更新  
  - `docs/getting-started/installation.md` - 2 處後續章節連結更新  
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 處引用更新（導覽、Discord 社群）  
  - `docs/troubleshooting/common-issues.md` - 1 處導覽連結更新  
  - `docs/troubleshooting/debugging.md` - 1 處導覽連結更新

- <strong>課程結構文件</strong>（2 個文件）：  
  - `README.md` - 17 處引用更新（課程總覽、章節標題、範本區塊、社群見解）  
  - `course-outline.md` - 14 處引用更新（概覽、學習目標、章節資源）

#### 已驗證
- ✅ 英文文件中已無「ai-foundry」資料夾路徑引用  
- ✅ 英文文件中已無「Microsoft Foundry」產品名稱引用  
- ✅ 所有新資料夾結構的導覽連結都能正常運作  
- ✅ 資料夾與檔案更名成功完成  
- ✅ 章節間跨引用已驗證正確

#### 備註
- <strong>範圍</strong>：變更僅限 `docs/` 資料夾內英文文件  
- <strong>翻譯</strong>：翻譯資料夾 (`translations/`) 未於此版本更新  
- <strong>工作坊</strong>：工作坊材料 (`workshop/`) 未於此版本更新  
- <strong>範例</strong>：範例檔案可能仍參考舊命名（將在未來版本處理）  
- <strong>外部連結</strong>：外部網址及 GitHub 倉庫引用內容保持不變

#### 貢獻者遷移指南  
若有本機分支或文件仍參考舊結構，請執行以下步驟：  
1. 更新資料夾引用：`docs/ai-foundry/` → `docs/microsoft-foundry/`  
2. 更新檔案引用：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
3. 產品名稱更換：「Microsoft Foundry」→「Microsoft Foundry」  
4. 驗證所有內部文檔連結仍可正常使用

---

### [v3.4.0] - 2025-10-24

#### 基礎架構預覽與驗證增強  
**本版本引入全面支援全新 Azure Developer CLI 預覽功能，並提升工作坊使用者體驗。**

#### 新增
- **🧪 azd provision --preview 功能文件**：完整涵蓋基礎架構預覽能力  
  - 命令參考與作弊表使用範例  
  - 部署指南中詳細整合使用案例與效益  
  - 預部署檢查整合，增強安全性驗證  
  - 入門指南更新，導入安全優先部署實務  
- **🚧 工作坊狀態橫幅**：專業 HTML 橫幅顯示工作坊開發狀態  
  - 漸層設計搭配施工指標，清晰向用戶傳達訊息  
  - 最後更新時間戳記透明化  
  - 行動裝置響應式設計適配各種設備

#### 強化
- <strong>基礎架構安全性</strong>：整合預覽功能於部署相關文件  
- <strong>部署前驗證</strong>：自動化腳本包含基礎架構預覽測試  
- <strong>開發者工作流程</strong>：命令序列更新以將預覽納入最佳實踐  
- <strong>工作坊體驗</strong>：明確向用戶告知內容開發狀態

#### 變更
- <strong>部署最佳實踐</strong>：推薦以預覽優先工作流程作為慣例  
- <strong>文件流程</strong>：基礎架構驗證提前至學習過程更前端  
- <strong>工作坊呈現</strong>：以專業狀態訊息溝通開發時間表

#### 改善
- <strong>安全優先方法</strong>：基礎架構變更可先驗證再部署  
- <strong>團隊協作</strong>：可分享預覽結果以供審核與批准  
- <strong>成本意識</strong>：於佈署前更清楚了解資源成本  
- <strong>風險降低</strong>：透過提前驗證減少部署失敗

#### 技術實作
- <strong>多文件整合</strong>：在 4 個主要文件中記錄預覽功能  
- <strong>命令範本</strong>：文件整體保持統一語法與範例  
- <strong>最佳實踐整合</strong>：預覽納入驗證工作流程和腳本  
- <strong>視覺指標</strong>：清晰「新功能」標示利於發現

#### 工作坊基礎架構
- <strong>狀態傳達</strong>：漸層樣式專業 HTML 橫幅  
- <strong>用戶體驗</strong>：明確開發狀態避免混淆  
- <strong>專業呈現</strong>：維護倉庫可信度並設定期望  
- <strong>時間透明</strong>：2025 年 10 月最後更新時間戳記

### [v3.3.0] - 2025-09-24

#### 強化工作坊教材與互動學習體驗  
**此版本引入全面的工作坊教材，具備瀏覽器互動式導覽與結構化學習路徑。**

#### 新增
- **🎥 互動式工作坊導覽**：基於瀏覽器的工作坊體驗，使用 MkDocs 預覽功能  
- **📝 結構化工作坊說明**：7 步驟引導學習路徑，從探索到客製化  
  - 0-介紹：工作坊概覽與設定  
  - 1-選擇 AI 模板：模板發現與選擇流程  
  - 2-驗證 AI 模板：部署與驗證程序  
  - 3-解析 AI 模板：理解模板架構  
  - 4-配置 AI 模板：配置與客製化  
  - 5-自訂 AI 模板：進階修改與迭代  
  - 6-拆解基礎架構：清理與資源管理  
  - 7-結業總結：綜合與後續規劃  
- **🛠️ 工作坊工具**：使用 Material 主題配置 MkDocs 強化學習體驗  
- **🎯 實作學習路徑**：3 步法 (探索 → 部署 → 客製化)  
- **📱 GitHub Codespaces 整合**：無縫開發環境建置

#### 強化
- **AI 工作坊實驗室**：延伸為 2-3 小時結構化學習體驗  
- <strong>工作坊文件</strong>：專業呈現搭配導覽與視覺輔助  
- <strong>學習進度</strong>：從模板選擇到生產部署有清楚的步驟指引  
- <strong>開發者體驗</strong>：整合工具助力開發流程順暢

#### 改善
- <strong>可及性</strong>：基於瀏覽器介面，支持搜尋、代碼複製與主題切換  
- <strong>自主學習</strong>：彈性工作坊結構適應不同學習速度  
- <strong>實務應用</strong>：實際 AI 模板部署示例  
- <strong>社群整合</strong>：Discord 整合提供工作坊支援與協作

#### 工作坊特色
- <strong>內建搜尋</strong>：快速關鍵字與課程查找  
- <strong>代碼區塊複製</strong>：滑鼠懸停即可複製所有範例程式碼  
- <strong>主題切換</strong>：支援深色/淺色模式選擇  
- <strong>視覺資產</strong>：螢幕截圖與架構圖輔助理解  
- <strong>支援整合</strong>：直接連結 Discord 社群支援

### [v3.2.0] - 2025-09-17

#### 重大導覽架構調整與章節基學習系統  
**本版本引入全面章節制學習結構並強化整個倉庫的導覽功能。**

#### 新增
- **📚 章節制學習系統**：整個課程重組為 8 個循序漸進學習章節  
  - 第 1 章：基礎與快速入門 (⭐ - 30-45 分鐘)  
  - 第 2 章：AI 優先開發 (⭐⭐ - 1-2 小時)  
  - 第 3 章：配置與認證 (⭐⭐ - 45-60 分鐘)  
  - 第 4 章：基礎架構即程式碼與部署 (⭐⭐⭐ - 1-1.5 小時)  
  - 第 5 章：多代理 AI 解決方案 (⭐⭐⭐⭐ - 2-3 小時)  
  - 第 6 章：部署前驗證與規劃 (⭐⭐ - 1 小時)  
  - 第 7 章：故障排除與偵錯 (⭐⭐ - 1-1.5 小時)  
  - 第 8 章：生產與企業模式 (⭐⭐⭐⭐ - 2-3 小時)  
- **📚 全面導覽系統**：所有文件採用統一章節標頭與頁尾導覽  
- **🎯 進度追蹤**：課程完成清單與學習驗證系統  
- **🗺️ 學習路徑指引**：依不同經驗與目標提供明確入門點  
- **🔗 交叉引用導覽**：相關章節與先決條件清楚銜接

#### 強化
- **README 結構**：轉型為結構化學習平台，採章節制組織  
- <strong>文檔導覽</strong>：每頁均含章節上下文與進度指引  
- <strong>模板組織</strong>：範例與模板對應於適當學習章節  
- <strong>資源整合</strong>：作弊表、常見問題與學習指南連結相關章節  
- <strong>工作坊整合</strong>：實作實驗室對應多章節學習目標

#### 變更
- <strong>學習進度</strong>：由線性文件改為彈性章節制學習  
- <strong>配置擺放</strong>：將配置指南調整為第三章以利學習流程  
- **AI 內容整合**：更完整融入 AI 特定內容於學習歷程  
- <strong>生產內容</strong>：進階模式集中於第八章供企業學習者使用

#### 改善
- <strong>使用者體驗</strong>：清楚導覽麵包屑與章節進度指示器  
- <strong>可及性</strong>：一致的導覽模式簡化課程瀏覽  
- <strong>專業呈現</strong>：大學風格課程結構適用於學術與企業培訓  
- <strong>學習效率</strong>：組織優化降低尋找內容所需時間

#### 技術實作
- <strong>導覽標頭</strong>：40 多個文件標準化章節導航  
- <strong>頁尾導覽</strong>：一致的進度指引與章節完成狀態  
- <strong>交叉鏈結</strong>：完整內部連結系統串接相關概念  
- <strong>章節映射</strong>：範本與範例明確對應學習目標

#### 學習指南強化
- **📚 全面學習目標**：重組學習指南以符合 8 章系統  
- **🎯 章節制評量**：每章提供特定學習目標及實務練習  
- **📋 進度追蹤**：週學習計劃提供可衡量成果與完成清單  
- **❓ 評量問題**：各章知識驗證問題並具專業成效  
- **🛠️ 實作練習**：含實務部署場景與故障排除活動  
- **📊 技能進階**：從基礎概念到企業模式的明確成長軌跡  
- **🎓 證照架構**：專業發展成果與社群認可系統  
- **⏱️ 時間管理**：結構化 10 週學習計畫與里程碑驗證

### [v3.1.0] - 2025-09-17

#### 強化多代理 AI 解決方案  
**本版本改良多代理零售解決方案，提升代理命名與文件說明。**

#### 變更
- <strong>多代理術語</strong>：將零售多代理方案中「Cora 代理」更名為「顧客代理」以提高清晰度  
- <strong>代理架構</strong>：更新所有文件、ARM 模板與程式碼範例，使用一致「顧客代理」命名  
- <strong>配置範例</strong>：現代化代理配置範本，使用更新命名慣例  
- <strong>文件一致性</strong>：確保所有引用均使用專業且描述性代理名稱

#### 強化
- **ARM 模板套件**：更新 retail-multiagent-arm-template，新增 Customer Agent 參考
- <strong>架構圖</strong>：刷新 Mermaid 圖表，更新代理命名
- <strong>程式碼範例</strong>：Python 類別與實作範例改用 CustomerAgent 命名
- <strong>環境變數</strong>：更新所有部署腳本，使用 CUSTOMER_AGENT_NAME 命名規範

#### 改善項目
- <strong>開發者體驗</strong>：文件中清晰定義代理的角色與責任
- <strong>生產準備度</strong>：更符合企業命名慣例
- <strong>學習教材</strong>：更直覺的代理命名便於教學
- <strong>模板可用性</strong>：簡化代理功能與部署範式的理解

#### 技術細節
- 使用 CustomerAgent 參考更新 Mermaid 架構圖
- Python 範例中將 CoraAgent 類別更換為 CustomerAgent
- ARM 模板 JSON 設定改用 "customer" 代理類型
- 環境變數從 CORA_AGENT_* 改為 CUSTOMER_AGENT_* 格式
- 更新所有部署指令及容器設定

### [v3.0.0] - 2025-09-12

#### 重大變更 - AI 開發者焦點及 Microsoft Foundry 整合
**此版本將本倉庫轉型為全面的 AI 專注學習資源，並整合 Microsoft Foundry。**

#### 新增
- **🤖 AI-第一學習路徑**：完整重構以 AI 開發者及工程師為優先
- **Microsoft Foundry 整合指南**：連接 AZD 與 Microsoft Foundry 服務的詳細文件
- **AI 模型部署模式**：涵蓋模型選擇、配置及生產部署策略的詳細指南
- **AI 工作坊實驗室**：2-3 小時實作工作坊，將 AI 應用轉為 AZD 可部署方案
- **生產 AI 最佳實務**：企業級擴展、監控與安全 AI 工作負載的模式
- **AI 專屬故障排除指南**：Microsoft Foundry 模型、Cognitive Services 與 AI 部署問題的綜合排解
- **AI 模板庫**：精選 Microsoft Foundry 模板合集及複雜度評分
- <strong>工作坊教材</strong>：完整的工作坊結構、實作實驗與參考材料

#### 強化
- **README 結構**：針對 AI 開發者優化，包含 45% 來自 Microsoft Foundry Discord 社群興趣數據
- <strong>學習路徑</strong>：專屬 AI 開發者旅程，並保留學生與 DevOps 工程師傳統路徑
- <strong>模板推薦</strong>：精選 AI 模板如 azure-search-openai-demo、contoso-chat、openai-chat-app-quickstart
- <strong>社群整合</strong>：強化 Discord 社群支援，增加 AI 專屬頻道與討論

#### 安全與生產焦點
- <strong>管理身分模式</strong>：AI 專用驗證與安全設定
- <strong>成本優化</strong>：AI 工作負載的令牌用量追蹤與預算控管
- <strong>多區域部署</strong>：全球 AI 應用部署策略
- <strong>效能監控</strong>：AI 相關指標與 Application Insights 整合

#### 文件品質
- <strong>線性課程結構</strong>：從初學到進階的 AI 部署模式邏輯進展
- **驗證 URL**：所有外部儲存庫連結均已確認可用
- <strong>完整參考</strong>：所有內部文件連結均已驗證正常
- <strong>生產準備</strong>：含有實務範例的企業部署模式

### [v2.0.0] - 2025-09-09

#### 重大變更 - 儲存庫重構與專業提升
**此版本代表儲存庫結構與內容呈現的重大改寫。**

#### 新增
- <strong>結構化學習框架</strong>：所有文件頁面新增介紹、學習目標與學習成果區塊
- <strong>導覽系統</strong>：於各文件加上上一課／下一課連結，引導學習進度
- <strong>學習指南</strong>：完整 study-guide.md，含學習目標、實作練習及評估資料
- <strong>專業呈現</strong>：移除所有表情符號，提高無障礙及專業感
- <strong>內容結構優化</strong>：改善學習材料組織與流程

#### 變更
- <strong>文件格式</strong>：統一為以學習為核心的結構格式
- <strong>導覽流程</strong>：導入邏輯性遞進的學習路線
- <strong>內容呈現</strong>：去除裝飾元素，追求清晰且專業的格式
- <strong>連結結構</strong>：更新所有內部連結支持新導覽系統

#### 改善
- <strong>無障礙性</strong>：移除表情符號依賴，提升螢幕閱讀器相容性
- <strong>專業外觀</strong>：學術風格的乾淨呈現，適合企業學習環境
- <strong>學習體驗</strong>：結構化方法，明確設定每課目標與成果
- <strong>內容組織</strong>：更佳邏輯順序與主題間連結

### [v1.0.0] - 2025-09-09

#### 初始發佈 - 全面 AZD 學習儲存庫

#### 新增
- <strong>核心文件架構</strong>
  - 完整入門指南系列
  - 詳細部署與佈建文件
  - 故障排除及除錯資源
  - 預部署驗證工具與流程

- <strong>入門模組</strong>
  - AZD 基礎：核心概念與術語
  - 安裝指南：平台特定安裝指示
  - 配置指南：環境設置與驗證
  - 首個專案教學：逐步實作學習

- <strong>部署與佈建模組</strong>
  - 部署指南：完整工作流程文件
  - 佈建指南：基於 Bicep 的基礎設施即代碼
  - 生產部署最佳實務
  - 多服務架構範例

- <strong>預部署驗證模組</strong>
  - 容量規劃：Azure 資源可用性驗證
  - SKU 選擇：全面服務方案指引
  - 預檢查：自動化驗證腳本（PowerShell 與 Bash）
  - 成本估算與預算規劃工具

- <strong>故障排除模組</strong>
  - 常見問題：常見問題與解決方案
  - 除錯指南：系統化故障排查方法
  - 進階診斷技巧與工具
  - 性能監控與優化

- <strong>資源與參考</strong>
  - 指令速查表：常用指令快速參考
  - 詞彙表：術語與縮寫完全說明
  - 常見問答：詳細解答常見問題
  - 外部資源連結及社群連結

- <strong>範例與模板</strong>
  - 簡易網頁應用範例
  - 靜態網站部署模板
  - 容器應用配置
  - 資料庫整合模式
  - 微服務架構範例
  - 無伺服器函數實作

#### 功能
- <strong>多平台支援</strong>：Windows、macOS、Linux 安裝與設定指南
- <strong>多層次技能</strong>：涵蓋學生至專業開發者內容
- <strong>實作導向</strong>：範例與真實案例
- <strong>全面涵蓋</strong>：從基礎概念到企業級模式
- <strong>安全第一</strong>：貫穿安全最佳實務
- <strong>成本優化</strong>：具成本效益的部署與資源管理指引

#### 文件品質
- <strong>詳細程式碼範例</strong>：實用且經測試的範例程式碼
- <strong>逐步操作指導</strong>：清晰且可執行的指導
- <strong>全面錯誤處理</strong>：常見問題排解
- <strong>最佳實務整合</strong>：行業標準與推薦方法
- <strong>版本相容性</strong>：更新至最新 Azure 服務與 azd 功能

## 未來計劃增強

### 版本 3.1.0（計劃中）
#### AI 平台擴展
- <strong>多模型支援</strong>：整合 Hugging Face、Azure Machine Learning 與自訂模型模式
- **AI 代理框架**：LangChain、Semantic Kernel、AutoGen 部署模板
- **進階 RAG 模式**：Azure AI Search 以外的向量資料庫選項（Pinecone、Weaviate 等）
- **AI 監控**：強化模型效能、令牌使用與回應品質監控

#### 開發者體驗
- **VS Code 擴充**：整合 AZD + Microsoft Foundry 開發體驗
- **GitHub Copilot 整合**：由 AI 協助產生 AZD 模板
- <strong>互動式教學</strong>：AI 場景手把手寫程式並自動驗證練習
- <strong>影音內容</strong>：補充影音教學，專注 AI 部署視覺學習

### 版本 4.0.0（計劃中）
#### 企業 AI 模式
- <strong>治理框架</strong>：AI 模型治理、合規與審計軌跡
- **多租戶 AI**：為多客戶提供隔離 AI 服務的模式
- **邊緣 AI 部署**：整合 Azure IoT Edge 與容器實例
- **混合雲 AI**：跨多雲與混合部署 AI 工作負載模式

#### 進階功能
- **AI 流程自動化**：與 Azure Machine Learning pipeline 的 MLOps 整合
- <strong>進階安全</strong>：零信任模式、私有端點及進階威脅防護
- <strong>效能優化</strong>：高吞吐量 AI 應用的調校與擴展策略
- <strong>全球分發</strong>：AI 應用的內容傳遞與邊緣緩存模式

### 版本 3.0.0（計劃中）- 已被現行版本取代
#### 提案新增 - 已於 v3.0.0 實現
- ✅ **AI 聚焦內容**：全面 Microsoft Foundry 整合（已完成）
- ✅ <strong>互動教學</strong>：AI 工作坊實驗室（已完成）
- ✅ <strong>進階安全模組</strong>：AI 專屬安全模式（已完成）
- ✅ <strong>效能優化</strong>：AI 工作負載調校策略（已完成）

### 版本 2.1.0（計劃中）- 部分於 v3.0.0 實現
#### 小幅強化 - 部分於現行版本完成
- ✅ <strong>額外範例</strong>：AI 部署場景（已完成）
- ✅ **擴展 FAQ**：AI 專屬問題與故障排除（已完成）
- <strong>工具整合</strong>：強化 IDE 與編輯器整合指南
- ✅ <strong>監控擴充</strong>：AI 專屬監控與警示模式（已完成）

#### 未來計劃
- <strong>行動友善文件</strong>：響應式設計支持行動裝置學習
- <strong>離線使用</strong>：下載文件套件功能
- **強化 IDE 整合**：AZD + AI 工作流程的 VS Code 擴充
- <strong>社群儀表板</strong>：實時社群數據與貢獻追蹤

## 變更記錄貢獻指南

### 報告更動
貢獻本儲存庫時，請確保變更記錄包含：

1. <strong>版本號</strong>：遵循語意版本規範（主版本.次版本.修訂）
2. <strong>日期</strong>：發布或更新日期，格式為 YYYY-MM-DD
3. <strong>類別</strong>：新增、變更、棄用、移除、修復、安全性
4. <strong>明確描述</strong>：簡明說明變更內容
5. <strong>影響評估</strong>：變動對現有使用者的影響

### 變更類別

#### 新增
- 新功能、文件區塊或能力
- 新範例、模板或學習資源
- 其他工具、腳本或實用工具

#### 變更
- 現有功能或文件的修改
- 改善清晰度或準確性更新
- 內容或組織重構

#### 棄用
- 計畫淘汰的功能或方式
- 預定移除的文件區塊
- 有更佳替代方案的方法

#### 移除
- 不再相關的功能、文件或範例
- 過時資訊或棄用方法
- 重複或合併內容

#### 修復
- 文件或程式碼中的錯誤校正
- 解決已回報的問題
- 改進準確性與功能性

#### 安全性
- 安全性改進或修復
- 安全最佳實務更新
- 修補安全漏洞

### 語意版本規範指引

#### 主版本 (X.0.0)
- 重大破壞性變更需使用者採取行動
- 內容或組織顯著重構
- 改變根本方法或流程

#### 次版本 (X.Y.0)
- 新功能或內容新增
- 向後相容的增強
- 新增範例、工具或資源

#### 修訂版本 (X.Y.Z)
- 修正錯誤與更正
- 現有內容小幅改進
- 澄清與細節增強

## 社群回饋與建議

我們積極鼓勵社群回饋以改進學習資源：

### 提供回饋方式
- **GitHub 問題回報**：回報問題或建議改進（歡迎 AI 專屬議題）
- **Discord 討論**：分享想法並參與 Microsoft Foundry 社群
- **Pull Requests**：直接貢獻內容改進，尤其是 AI 模板與指南
- **Microsoft Foundry Discord**：加入 #Azure 頻道參與 AZD + AI 討論
- <strong>社群論壇</strong>：參與更廣泛的 Azure 開發者社群交流

### 回饋分類
- **AI 內容準確性**：修正 AI 服務整合與部署資訊
- <strong>學習體驗</strong>：優化 AI 開發者學習流程的建議
- **缺失 AI 內容**：增加 AI 模板、模式或範例請求
- <strong>可及性</strong>：促進多元學習需求的改善
- **AI 工具整合**：改進 AI 開發工作流程的建議
- **生產 AI 模式**：企業級 AI 部署模式需求

### 回應承諾
- <strong>議題回應</strong>：48 小時內回覆問題
- <strong>功能請求</strong>：一週內評估
- <strong>社群貢獻</strong>：一週內審核
- <strong>安全性議題</strong>：立即優先處理

## 維護時程

### 定期更新
- <strong>每月檢查</strong>：內容準確度與連結驗證
- <strong>每季更新</strong>：重要內容新增與優化
- <strong>半年檢視</strong>：全面重構與強化
- <strong>年度發布</strong>：重大版本更新與改進

### 監控與品質保證
- <strong>自動化測試</strong>：定期驗證程式碼範例與連結
- <strong>社群回饋整合</strong>：定期吸納用戶建議
- <strong>技術更新</strong>：與最新 Azure 服務及 azd 發版同步
- <strong>無障礙審核</strong>：定期檢視包容性設計原則

## 版本支援政策

### 當前版本支援
- <strong>最新主要版本</strong>：全面支援並定期更新
- <strong>先前主要版本</strong>：12 個月的安全更新與關鍵修正
- <strong>舊版</strong>：僅限社群支援，無官方更新

### 遷移指引
當主要版本發布時，我們提供：
- <strong>遷移指南</strong>：逐步過渡說明
- <strong>相容性說明</strong>：破壞性變更細節
- <strong>工具支援</strong>：協助遷移的腳本或工具
- <strong>社群支援</strong>：專用論壇解答遷移問題

---

<strong>導航</strong>
- <strong>上一課</strong>：[學習指南](resources/study-guide.md)
- <strong>下一課</strong>：返回 [主 README](README.md)

<strong>保持更新</strong>：關注此儲存庫以接收新版本發佈及學習資料重要更新的通知。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件係透過 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於提供準確的翻譯，但請注意自動翻譯可能存在錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於關鍵資訊，建議尋求專業人工翻譯。我們不對因使用此翻譯而產生的任何誤解或誤譯負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->