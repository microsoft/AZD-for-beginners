# 變更記錄 - AZD 初學者指南

## 介紹

此變更記錄記錄了 AZD 初學者指南儲存庫所有重要的變更、更新及改進。我們遵循語義版本控制原則並維持此記錄，以協助用戶了解各版本間的差異。

## 學習目標

透過檢視此變更記錄，您將能夠：
- 獲知新功能及內容新增
- 了解現有文件的改進
- 追蹤錯誤修正及修正確保準確性
- 跟蹤學習材料隨時間的演進

## 學習成果

檢閱變更記錄條目後，您將能：
- 辨識可供學習的新內容及資源
- 了解哪些章節已被更新或改進
- 根據最新材料規劃您的學習路徑
- 提供回饋及建議以促進未來改進

## 版本歷史

### [v3.19.1] - 2026-03-27

#### 初學者入門澄清、設置驗證與最終 AZD 指令清理
**本版本是在 AZD 1.23 驗證掃描基礎上進行初學者專注文件調整：澄清以 AZD 為先的驗證指引、增加本地設置驗證腳本、核實關鍵指令與 AZD CLI 實際狀況，並移除變更記錄外最後過時的英文來源指令參考。**

#### 新增
- **🧪 初學者設置驗證腳本**，包括 `validate-setup.ps1` 和 `validate-setup.sh`，幫助學習者在開始第一章前確認所需工具
- **✅ 根目錄及第一章 README 中的前置設置驗證步驟**，幫助在執行 `azd up` 前檢查缺失的前置條件

#### 變更
- <strong>🔐 初學者驗證指引</strong>現在統一將 `azd auth login` 作為 AZD 流程的主要認證路徑，並指出除非直接使用 Azure CLI 指令，否則 `az login` 為可選
- <strong>📚 第一章入門流程</strong>現在引導學習者於安裝、驗證及首次部署步驟前，先驗證本地環境設定
- <strong>🛠️ 驗證器訊息</strong>明確區分阻斷性需求和針對 AZD 專用初學者路徑的可選 Azure CLI 警告
- <strong>📖 設定、故障排除及範例文件</strong>現在區分必需的 AZD 驗證與可選的 Azure CLI 登入，避免前後文混淆

#### 修正
- <strong>📋 剩餘英文來源指令參考</strong>更新為當前 AZD 指令形式，包括備忘單中的 `azd config show`，及在需 Azure Portal 概覽指引時的 `azd monitor --overview`
- <strong>🧭 第一章初學者描述</strong>修正過度承諾，避免誤導所有範本和 Azure 資源可保證零錯誤或回滾行為
- <strong>🔎 現場 CLI 驗證</strong>確認對以下指令的當前支持：`azd env get-values`、`azd template list`、`azd extension list --installed`、`azd copilot consent list`、`azd mcp start`、`azd provision --preview`、`azd monitor --logs`和`azd down --force --purge`

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

#### AZD 1.23.12 驗證、工作坊環境擴展暨 AI 模型更新
**此版本對 `azd` `1.23.12` 進行文件驗證掃描，更新過時的 AZD 指令範例，刷新 AI 模型指導以符合當前預設，並將工作坊說明擴展至支持 GitHub Codespaces、開發容器及本地克隆。**

#### 新增
- **✅ 核心章節及工作坊文件的驗證紀錄**，明確告知學習者使用新版或舊版 CLI 時對應的 AZD 基線
- **⏱️ 部署逾時指導**，適用長時間運行的 AI 應用部署，示例 `azd deploy --timeout 1800`
- **🔎 擴展檢查步驟**，在 AI 工作流程文件中使用 `azd extension show azure.ai.agents`
- **🌐 更廣泛的工作坊環境指導**，包含 GitHub Codespaces、開發容器，以及使用 MkDocs 的本地克隆支援

#### 變更
- **📚 章節介紹 README**，統一標示在基礎、設定、基礎結構、多代理、部署前、故障排除及生產環節均已經 AZD 1.23.12 驗證
- <strong>🛠️ 文件中 AZD 指令參考</strong>更新為最新格式：
  - `azd config list` 改為 `azd config show`
  - `azd env show` 改為依情況使用 `azd env list` 或 `azd env get-value(s)`
  - `azd auth whoami` 改為 `azd auth status`
  - `azd monitor` 改為 `azd monitor --overview`（應用洞察概覽時）
- <strong>🧪 預覽版佈建範例</strong>簡化為目前支援用法，如 `azd provision --preview` 和 `azd provision --preview -e production`
- <strong>🧭 工作坊流程</strong>更新，讓學習者可於 Codespaces、開發容器或本地克隆中完成實驗，而非僅限於 Codespaces
- <strong>🔐 認證指導</strong>現優先使用 `azd auth login` 處理 AZD 流程，直接使用 Azure CLI 指令時則視 `az login` 為可選

#### 修正
- <strong>🪟 Windows 安裝指令</strong>安裝指南中統一修正為最新 `winget` 套件大小寫格式
- <strong>🐧 Linux 安裝指導</strong>修正避免使用不支援的發行版專屬 `azd` 套件管理指令，改為指向發布資產
- <strong>📦 AI 模型範例</strong>更新，以目前範例如 `gpt-4.1-mini`、`gpt-4.1`、及 `text-embedding-3-large` 替代舊版 `gpt-35-turbo` 和 `text-embedding-ada-002`
- <strong>📋 部署及診斷代碼片段</strong>修正為使用當前環境及狀態指令，涵蓋日誌、腳本及故障排除步驟
- <strong>⚙️ GitHub Actions 指導</strong>從 `Azure/setup-azd@v1.0.0` 更新為 `Azure/setup-azd@v2`
- <strong>🤖 MCP/Copilot 同意指導</strong>由 `azd mcp consent` 更新為 `azd copilot consent list`

#### 優化
- <strong>🧠 AI 章節指導</strong>更全面說明預覽敏感的 `azd ai` 行為、租戶特定登入、現行擴展用法及更新的模型部署建議
- <strong>🧪 工作坊說明</strong>使用更實際的版本範例和更清晰的環境設置語言，提升動手實驗體驗
- <strong>📈 生產及故障排除文件</strong>更符合同步更新的監控、備援模型和成本層級範例

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

#### AZD AI CLI 指令、內容驗證及範本擴展
**本版本新增 `azd ai`、`azd extension` 與 `azd mcp` 指令涵蓋，貫穿所有 AI 相關章節，修正 agents.md 中的破損連結及棄用代碼，更新備忘單，並重構範例範本章節，附帶已驗證的描述及新的 Azure AI AZD 範本。**

#### 新增
- **🤖 AZD AI CLI 涵蓋**，遍及 7 個檔案（前僅限於第 8 章）：
  - `docs/chapter-01-foundation/azd-basics.md` — 新增「擴展與 AI 指令」章節，介紹 `azd extension`、`azd ai agent init` 與 `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — 選項 4：`azd ai agent init`，含範本與清單方案比較表
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — 「Foundry 的 AZD 擴展」及「以代理為先的部署」子節
  - `docs/chapter-05-multi-agent/README.md` — 快速入門新增範本與清單部署路徑
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — 部署章節新增 `azd ai agent init` 選項
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — 「AZD AI 擴展診斷指令」子節
  - `resources/cheat-sheet.md` — 新增「AI 及擴展指令」章節，列出 `azd extension`, `azd ai agent init`, `azd mcp`, `azd infra generate`
- <strong>📦 新增 AZD AI 範例範本</strong>於 `microsoft-foundry-integration.md`：
  - **azure-search-openai-demo-csharp** — .NET RAG 聊天，支援 Blazor WebAssembly、Semantic Kernel 及語音聊天
  - **azure-search-openai-demo-java** — Java RAG 聊天，使用 Langchain4J，具 ACA/AKS 部署選擇
  - **contoso-creative-writer** — 多代理創意寫作應用，採用 Azure AI 代理服務、Bing Grounding 及 Prompty
  - **serverless-chat-langchainjs** — 無伺服器 RAG，結合 Azure Functions、LangChain.js 與 Cosmos DB，支援 Ollama 本地開發
  - **chat-with-your-data-solution-accelerator** — 企業級 RAG 加速器，含管理入口網站、Teams 整合及 PostgreSQL/Cosmos DB 選項
  - **azure-ai-travel-agents** — 多代理 MCP 編排參考應用，提供 .NET、Python、Java 與 TypeScript 伺服器
  - **azd-ai-starter** — 極簡 Azure AI 基礎 Bicep 起始範本
  - **🔗 精彩 AZD AI 畫廊連結** — 指向 [awesome-azd AI 畫廊](https://azure.github.io/awesome-azd/?tags=ai)（超過 80 款範本）

#### 修正
- **🔗 agents.md 導航連結**：上一頁/下一頁鏈結修正為符合第 2 章 README 課程順序（Microsoft Foundry 整合 → 代理 → AI 模型部署）
- **🔗 agents.md 破損連結**：`production-ai-practices.md` 改為正確路徑 `../chapter-08-production/production-ai-practices.md`（3 處）
- **📦 agents.md 棄用代碼**：以 `azure-monitor-opentelemetry` 加 OpenTelemetry SDK 替換 `opencensus`
- **🐛 agents.md 非法 API**：將 `max_tokens` 從 `create_agent()` 移至 `create_run()`，作為 `max_completion_tokens`
- **🔢 agents.md 代幣計數**：用 `tiktoken.encoding_for_model()` 取代粗略的 `len//4` 估計
- **azure-search-openai-demo**：修正服務名稱由「Cognitive Search + App Service」改為「Azure AI Search + Azure Container Apps」（預設主機更新於 2024 年 10 月）
- **contoso-chat**：更新描述以呼應 Azure AI Foundry 與 Prompty，符合倉庫實際標題與技術堆疊

#### 移除
- **ai-document-processing**：移除無效範本參考（該倉庫未公開作為 AZD 範本）

#### 優化
- **📝 agents.md 練習題**：練習題 1 現顯示預期輸出及 `azd monitor` 步驟；練習題 2 包含完整 `FunctionTool` 註冊程式碼；練習題 3 以具體的 `prepdocs.py` 命令取代含糊指引
- **📚 agents.md 資源**：更新文件連結至最新 Azure AI Agent Service 文件及快速入門
- **📋 agents.md 下一步表格**：新增 AI 工作坊實驗室連結，涵蓋完整章節

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

#### 課程導航增強
**此版本改進 README.md 章節導航，採用增強表格格式。**

#### 變更
- <strong>課程地圖表</strong>：新增直接課程連結、時長估計及難度評分
- <strong>資料夾清理</strong>：移除冗餘舊資料夾（deployment/、getting-started/、pre-deployment/、troubleshooting/）
- <strong>連結驗證</strong>：課程地圖表中超過 21 個內部連結全部驗證無誤

### [v3.16.0] - 2026-02-05

#### 產品名稱更新
**此版本更新產品稱呼為現行 Microsoft 品牌名稱。**

#### 變更
- **Microsoft Foundry → Microsoft Foundry**：所有非翻譯檔案中參考均更新
- **Azure AI Agent Service → Foundry Agents**：服務名稱更新以反映現行品牌

#### 更新檔案
- `README.md` - 主課程首頁
- `changelog.md` - 版本歷史
- `course-outline.md` - 課程架構
- `docs/chapter-02-ai-development/agents.md` - AI 代理指南
- `examples/README.md` - 範例文件
- `workshop/README.md` - 工作坊首頁
- `workshop/docs/index.md` - 工作坊索引
- `workshop/docs/instructions/*.md` - 所有工作坊指令檔案

---

### [v3.15.0] - 2026-02-05

#### 重大倉庫重構：章節資料夾命名
**此版本將文件重構為以章節編號為名的資料夾，以利更清晰的導航。**

#### 資料夾重新命名
舊資料夾取代為章節編號資料夾：
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- 新增：`docs/chapter-05-multi-agent/`

#### 檔案遷移
| 檔案 | 原位置 | 新位置 |
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
- **📚 章節 README 檔案**：在每個章節資料夾中建立 README.md，包含：
  - 學習目標與時長
  - 課程表與描述
  - 快速啟動指令
  - 其他章節導航

#### 變更
- **🔗 更新所有內部連結**：超過 78 條路徑於各文件中修正
- **🗺️ 主 README.md**：更新課程地圖至新章節架構
- **📝 examples/README.md**：更新與章節資料夾的參考

#### 移除
- 舊資料夾結構（getting-started/、microsoft-foundry/、deployment/、pre-deployment/、troubleshooting/、ai-foundry/）

---

### [v3.14.0] - 2026-02-05

#### 倉庫重構：章節導航
**此版本新增章節導航 README 檔案（後被 v3.15.0 取代）。**

---

### [v3.13.0] - 2026-02-05

#### 新增 AI 代理指南
**此版本新增 Azure Developer CLI 部署 AI 代理的完整指南。**

#### 新增
- **🤖 docs/microsoft-foundry/agents.md**：完整指南涵蓋：
  - 什麼是 AI 代理以及它們與聊天機器人的區別
  - 三種快速啟動代理範本（Foundry Agents、Prompty、RAG）
  - 代理架構模式（單代理、RAG、多代理）
  - 工具設定與客製化
  - 監控及指標追蹤
  - 成本考量與最佳化
  - 常見故障排除情境
  - 三個循序漸進的實作練習及成功標準

#### 內容結構
- <strong>介紹</strong>：入門的代理概念
- <strong>快速入門</strong>：使用 `azd init --template get-started-with-ai-agents` 部署代理
- <strong>架構模式</strong>：代理模式視覺圖示
- <strong>設定</strong>：工具配置與環境變數
- <strong>監控</strong>：Application Insights 整合
- <strong>練習</strong>：循序漸進的動手學習（每題約 20-45 分鐘）

---

### [v3.12.0] - 2026-02-05

#### 開發容器環境更新
**此版本更新開發容器組態，引入現代工具及更佳預設設定以提升 AZD 學習體驗。**

#### 變更
- **🐳 基底映像**：從 `python:3.12-bullseye` 更新為 `python:3.12-bookworm`（最新 Debian 穩定版）
- **📛 容器名稱**：由「Python 3」改為「AZD for Beginners」增加明確度

#### 新增
- **🔧 新開發容器功能**：
  - 啟用 Bicep 支援的 `azure-cli`
  - `node:20`（AZD 範本 LTS 版本）
  - 用於範本管理的 `github-cli`
  - 支援容器應用部署的 `docker-in-docker`

- **🔌 預設轉發端口**，方便開發使用：
  - 8000（MkDocs 預覽）
  - 3000（網頁應用）
  - 5000（Python Flask）
  - 8080（API）

- **🧩 新增 VS Code 擴充套件**：
  - `ms-python.vscode-pylance` - Python 智慧提示
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions 支援
  - `ms-azuretools.vscode-docker` - Docker 支援
  - `ms-azuretools.vscode-bicep` - Bicep 語言支援
  - `ms-azure-devtools.azure-resource-groups` - Azure 資源管理
  - `yzhang.markdown-all-in-one` - Markdown 編輯
  - `DavidAnson.vscode-markdownlint` - Markdown 語法檢查
  - `bierner.markdown-mermaid` - Mermaid 圖表
  - `redhat.vscode-yaml` - YAML 支援（用於 azure.yaml）
  - `eamodio.gitlens` - Git 可視化
  - `mhutchie.git-graph` - Git 歷史

- **⚙️ VS Code 設定**：新增預設設定，含 Python 直譯器、儲存時格式化及空白字元修剪

- **📦 requirements-dev.txt 更新**：
  - 加入 MkDocs minify 插件
  - 加入 pre-commit 以促進程式碼品質
  - 加入 Azure SDK 套件（azure-identity、azure-mgmt-resource）

#### 修正
- <strong>建立後指令</strong>：啟動容器時確認 AZD 與 Azure CLI 已安裝

---

### [v3.11.0] - 2026-02-05

#### 新手友善 README 大改版
**此版本大幅改善 README.md，讓新手更容易理解並新增 AI 開發者必備資源。**

#### 新增
- **🆚 Azure CLI 與 AZD 比較**：清楚說明何時使用各工具並附實務範例
- **🌟 精彩 AZD 資源連結**：連結至社群範本集及貢獻管道：
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ 即用範本
  - [提交範本](https://github.com/Azure/awesome-azd/issues) - 社群貢獻指南
- **🎯 快速啟動指南**：簡化三步驟入門（安裝 → 登入 → 部署）
- **📊 根據經驗的導航表**：提供清楚建議新手從何處開始

#### 變更
- **README 結構**：重新組織，先呈現關鍵資訊逐步揭露
- <strong>介紹段落</strong>：重寫解釋「`azd up` 的神奇魔力」給完全新手
- <strong>移除重複內容</strong>：刪除冗餘的疑難排解段落
- <strong>疑難排解命令</strong>：修正 `azd logs` 參照為有效 `azd monitor --logs`

#### 修正
- **🔐 認證指令**：在 cheat-sheet.md 新增 `azd auth login` 與 `azd auth logout`
- <strong>錯誤命令參考</strong>：移除 README 疑難排解段落中剩餘的 `azd logs`

#### 備註
- <strong>範圍</strong>：變更涵蓋主要 README.md 及 resources/cheat-sheet.md
- <strong>目標族群</strong>：改善專為 AZD 新手開發者設計

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI 指令正確性更新
**此版本修正整份文件中不存在的 AZD 指令，確保所有範例皆使用有效 Azure Developer CLI 語法。**

#### 修正
- **🔧 移除不存在 AZD 指令**：全面審核並修正無效指令：
  - `azd logs`（不存在）→ 以 `azd monitor --logs` 或 Azure CLI 替代
  - `azd service` 子指令（不存在）→ 用 `azd show` 及 Azure CLI 替代
  - `azd infra import/export/validate`（不存在）→ 移除或替換為有效指令
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` 旗標（不存在）→ 移除
  - `azd provision --what-if/--rollback` 旗標（不存在）→ 更新為使用 `--preview`
  - `azd config validate`（不存在）→ 以 `azd config list` 取代
  - `azd info`、`azd history`、`azd metrics`（不存在）→ 移除

- **📚 修正指令的更新檔案**：
  - `resources/cheat-sheet.md`：指令參考大改版
  - `docs/deployment/deployment-guide.md`：修正回滾與部署策略
  - `docs/troubleshooting/debugging.md`：修正日誌分析部分
  - `docs/troubleshooting/common-issues.md`：更新疑難排除指令
  - `docs/troubleshooting/ai-troubleshooting.md`：修正 AZD 偵錯段落
  - `docs/getting-started/azd-basics.md`：修正監控指令
  - `docs/getting-started/first-project.md`：更新監控與偵錯範例
  - `docs/getting-started/installation.md`：修正幫助與版本範例
  - `docs/pre-deployment/application-insights.md`：修正日誌查看指令
  - `docs/pre-deployment/coordination-patterns.md`：修正代理偵錯指令

- **📝 版本參考更新**：
  - `docs/getting-started/installation.md`：將固定寫死的 `1.5.0` 版本改為通用 `1.x.x` 並附釋出頁連結

#### 變更
- <strong>回滾策略</strong>：改為使用基於 Git 的回滾，AZD 無原生回滾功能
- <strong>日誌查看</strong>：用 `azd monitor --logs`、`azd monitor --live` 及 Azure CLI 命令替換所有 `azd logs` 參考
- <strong>效能段落</strong>：移除不存在的平行／增量部署旗標，提供有效替代方案

#### 技術細節
- **有效的 AZD 指令**：`init`、`up`、`auth`、`deploy`、`down`、`provision`、`publish`、`completion`、`config`、`env`、`show`、`version`、`monitor`
- **有效的 azd monitor 旗標**：`--live`、`--logs`、`--overview`
- <strong>已移除功能</strong>：`azd logs`、`azd service`、`azd infra import/export/validate`、`azd history`、`azd metrics`、`azd info`、`azd config validate`

#### 備註
- <strong>驗證</strong>：命令已依據 Azure Developer CLI v1.23.x 驗證

---

### [v3.9.0] - 2026-02-05

#### 工作坊完成及文件質素更新
**此版本完成互動式工作坊模組，修復所有失效文件連結，並提升 Microsoft AZD 的 AI 開發者整體內容質素。**

#### 新增
- **📝 CONTRIBUTING.md**：全新貢獻指南文件，包含：
  - 報告問題與提案變更的明確指示
  - 新內容的文件標準
  - 程式碼範例指引及提交訊息慣例
  - 社群參與資訊

#### 完成
- **🎯 工作坊模組 7（總結）**：全面完成總結模組，包含：
  - 工作坊成果綜合總結
  - 主要概念掌握節，涵蓋 AZD、範本與 Microsoft Foundry
  - 學習旅程持續推介
  - 工作坊挑戰練習並附難度評級
  - 社群回饋與支援連結

- **📚 工作坊模組 3（拆解）**：更新學習目標，包括：
  - 啟用配合 MCP 伺服器的 GitHub Copilot
  - 理解 AZD 範本資料夾結構
  - 基礎架構即程式碼（Bicep）組織模式
  - 實作實驗室指導

- **🔧 工作坊模組 6（拆除）**：完成包括：
  - 資源清理與成本管理目標
  - 使用 `azd down` 進行安全基礎架構撤除
  - 軟刪除智慧服務回復指引
  - 額外探索 GitHub Copilot 與 Azure 入口網站提示

#### 修正
- **🔗 失效連結修復**：解決超過15處內部文件失效連結：
  - `docs/ai-foundry/ai-model-deployment.md`：修正至 microsoft-foundry-integration.md 路徑
  - `docs/troubleshooting/ai-troubleshooting.md`：修正 ai-model-deployment.md 及 production-ai-practices.md 路徑
  - `docs/getting-started/first-project.md`：用 deployment-guide.md 替換不存在的 cicd-integration.md
  - `examples/retail-scenario.md`：修正常見問題及疑難排解指南路徑
  - `examples/container-app/microservices/README.md`：修正課程首頁及部署指南路徑
  - `resources/faq.md` 與 `resources/glossary.md`：更新 AI 章節引用
  - `course-outline.md`：修正講師指南及 AI 工作坊實驗參考

- **📅 工作坊狀態橫幅**：從「建設中」更新為 2026 年 2 月的有效工作坊狀態

- **🔗 工作坊導覽**：修復 README.md 中指向不存在 lab-1-azd-basics 資料夾的失效導覽連結

#### 變更
- <strong>工作坊呈現</strong>：移除「建設中」警告，工作坊現已完整且可使用
- <strong>導覽一致性</strong>：確保所有工作坊模組擁有適當互模組導覽
- <strong>學習路徑參考</strong>：更新章節交叉引用以使用正確的 microsoft-foundry 路徑

#### 驗證
- ✅ 所有英文 markdown 檔案均有有效內部連結
- ✅ 工作坊模組 0 到 7 已完成且具學習目標
- ✅ 章節與模組間導覽功能正常
- ✅ 內容適用於使用 Microsoft AZD 的 AI 開發者
- ✅ 以初學者友好語言與結構維持整體一致性
- ✅ CONTRIBUTING.md 提供社群貢獻者明確指導

#### 技術實作
- <strong>連結驗證</strong>：以自動 PowerShell 腳本驗證所有 .md 內部連結
- <strong>內容審核</strong>：手動檢視工作坊完整度與初學適用性
- <strong>導覽系統</strong>：應用一致章節與模組導覽模式

#### 備註
- <strong>範圍</strong>：變更僅限英文文件
- <strong>翻譯</strong>：本版本未更新翻譯資料夾（稍後將自動同步翻譯）
- <strong>工作坊時長</strong>：完整工作坊現提供 3-4 小時實作學習

---

### [v3.8.0] - 2025-11-19

#### 進階文件：監控、安全與多代理模式
**此版本新增應用程式洞察整合、認證模式及多代理協調於生產部署的全面 A 級課程。**

#### 新增
- **📊 應用程式洞察整合課程**：於 `docs/pre-deployment/application-insights.md`：
  - 以 AZD 為核心自動部署
  - 完整 Bicep 範本涵蓋 Application Insights + Log Analytics
  - 可運作 Python 應用程式及自訂遙測（超過1200行）
  - AI/LLM 監控模式（Microsoft Foundry 模型令牌/成本追蹤）
  - 6 個 Mermaid 架構圖（架構、分散式追蹤、遙測流程）
  - 3 項實作練習（警示、儀表板、AI 監控）
  - Kusto 查詢範例與成本優化策略
  - 即時指標串流與現場除錯
  - 約40-50分鐘學習時間，涵蓋生產就緒模式

- **🔐 認證與安全模式課程**：於 `docs/getting-started/authsecurity.md`：
  - 3 種認證模式（連線字串、Key Vault、管理身分）
  - 完整 Bicep 基礎架構範本保障安全部署
  - Node.js 程式碼示例與 Azure SDK 整合
  - 3 項完整練習（啟用管理身分、使用者指派身分、Key Vault 輪替）
  - 安全最佳實務與 RBAC 設定
  - 疑難排解指南與成本分析
  - 生產就緒無密碼認證模式

- **🤖 多代理協調模式課程**：於 `docs/pre-deployment/coordination-patterns.md`：
  - 5 種協調模式（序列、平行、階層、事件驅動、共識）
  - 完整編排服務實作（Python/Flask，超過1500行）
  - 3 個專門代理實作（研究、撰寫、編輯）
  - 服務匯流排（Service Bus）整合消息佇列
  - Cosmos DB 狀態管理於分布式系統
  - 6 個 Mermaid 圖顯示代理互動
  - 3 項進階練習（逾時處理、重試邏輯、斷路器）
  - 成本明細（每月240-565美元）及優化策略
  - Application Insights 監控整合

#### 強化
- <strong>預先部署章節</strong>：新增全面監控與協調模式
- <strong>入門章節</strong>：增強專業認證模式
- <strong>生產準備</strong>：完整覆蓋安全至可觀察性
- <strong>課程大綱</strong>：更新第3與第6章新課程引用

#### 變更
- <strong>學習進程</strong>：安全與監控整合更佳
- <strong>文件質素</strong>：新課程維持一致 A 級標準（95-97%）
- <strong>生產模式</strong>：企業部署端到端完整涵蓋

#### 改善
- <strong>開發體驗</strong>：明確從開發到生產監控路徑
- <strong>安全標準</strong>：專業認證與祕密管理模式
- <strong>可觀察性</strong>：完整 Application Insights 與 AZD 整合
- **AI 工作負載**：專用監控 Microsoft Foundry 模型與多代理系統

#### 驗證
- ✅ 所有課程含完整可執行程式碼（非片段）
- ✅ 3 項課程共19個 Mermaid 圖視覺學習
- ✅ 9 項實作練習含驗證步驟
- ✅ 生產就緒 Bicep 模板可用 `azd up` 部署
- ✅ 成本分析與優化策略
- ✅ 疑難與最佳實務指南
- ✅ 知識檢查點含驗證指令

#### 文件評級結果
- **docs/pre-deployment/application-insights.md**：全面監控指南
- **docs/getting-started/authsecurity.md**：專業安全模式
- **docs/pre-deployment/coordination-patterns.md**：進階多代理架構
- <strong>整體新增內容</strong>：維持一致高品質標準

#### 技術實作
- <strong>應用洞察</strong>：Log Analytics + 自訂遙測 + 分布式追蹤
- <strong>認證</strong>：管理身分 + Key Vault + RBAC 模式
- <strong>多代理</strong>：服務匯流排 + Cosmos DB + 容器應用 + 編排
- <strong>監控</strong>：即時指標 + Kusto 查詢 + 警示 + 儀表板
- <strong>成本管理</strong>：取樣策略、保留政策、預算控管

### [v3.7.0] - 2025-11-19

#### 文件質素提升與新增 Microsoft Foundry 模型範例
**此版本提升整個倉庫文件質素，並新增完整 Microsoft Foundry 模型部署範例，包含 gpt-4.1 聊天介面。**

#### 新增
- **🤖 Microsoft Foundry 模型聊天範例**：完整 gpt-4.1 部署與 `examples/azure-openai-chat/` 實作：
  - 完整 Microsoft Foundry 模型基礎架構（gpt-4.1 模型部署）
  - Python 命令列聊天介面含對話歷史
  - Key Vault 整合保障 API 金鑰安全
  - 令牌使用追蹤與成本估算
  - 流量限制與錯誤處理
  - 詳盡 README 含 35-45 分鐘部署指南
  - 11 個生產就緒檔案（Bicep 範本、Python 應用、設定）
- **📚 文件練習**：於設定指南新增實作練習：
  - 練習 1：多環境設定（15 分鐘）
  - 練習 2：祕密管理實操（10 分鐘）
  - 明確成功標準與驗證步驟
- **✅ 部署驗證**：於部署指南新增驗證章節：
  - 健康檢查程序
  - 成功標準檢查表
  - 所有部署命令預期輸出
  - 疑難快速參考

#### 加強
- **examples/README.md**：提升至 A 級品質（93%）：
  - 加入 azure-openai-chat 至所有相關區塊
  - 本地範例數量從 3 增加至 4
  - 新增至 AI 應用範例表
  - 整合中階用戶快速入門
  - 新增至 Microsoft Foundry 範本區
  - 更新比較矩陣及技術查找區塊
- <strong>文件質素</strong>：文件資料夾由 B+（87%）提升至 A-（92%）：
  - 對關鍵命令範例補充預期輸出
  - 加入設定變更驗證步驟
  - 強化實作學習體驗

#### 變更
- <strong>學習進程</strong>：中階學習者 AI 範例整合更完善
- <strong>文件結構</strong>：更多可操作練習及明確結果
- <strong>驗證流程</strong>：對重要作業流程補充明確成功標準

#### 提升
- <strong>開發體驗</strong>：Microsoft Foundry 模型部署時間縮短至 35-45 分鐘（相比複雜替代方案 60-90 分）
- <strong>成本透明</strong>：提供 Microsoft Foundry 模型範例清楚成本預估（月費 50-200 美元）
- <strong>學習路徑</strong>：AI 開發者有明確入口 azure-openai-chat
- <strong>文件標準</strong>：預期輸出與驗證步驟均一致

#### 驗證
- ✅ Microsoft Foundry 模型範例可由 `azd up` 完整執行
- ✅ 11 個實作檔案語法正確
- ✅ README 指示與實際部署相符
- ✅ 文件連結於 8+ 處更新
- ✅ 範例索引正確反映 4 個本地範例
- ✅ 表格中無外部連結重複
- ✅ 導覽參考全正確

#### 技術實作
- **Microsoft Foundry 架構**：gpt-4.1 + Key Vault + 容器應用模式
- <strong>安全</strong>：管理身分就緒，祕密存於 Key Vault
- <strong>監控</strong>：整合 Application Insights
- <strong>成本管理</strong>：令牌追蹤與使用優化
- <strong>部署</strong>：單一 `azd up` 指令完成部署

### [v3.6.0] - 2025-11-19

#### 重大更新：容器應用部署範例
**此版本引入完整生產就緒容器應用部署範例，使用 Azure Developer CLI (AZD)，含完整文件及學習路徑整合。**

#### 新增
- **🚀 容器應用範例**：新增本地範例於 `examples/container-app/`：
  - [總覽指南](examples/container-app/README.md)：容器化部署完整概覽、快速入門、生產及進階模式
  - [簡易 Flask API](../../examples/container-app/simple-flask-api)：友善新手 REST API，支援縮放至零、健康檢查、監控與疑難排解
  - [微服務架構](../../examples/container-app/microservices)：生產就緒多服務部署（API Gateway、產品、訂單、用戶、通知）、非同步消息、服務匯流排、Cosmos DB、Azure SQL、分布式追蹤、藍綠/金絲雀部署
- <strong>最佳實務</strong>：容器化工作負載安全、監控、成本優化及 CI/CD 指引
- <strong>程式碼範例</strong>：完整 `azure.yaml`、Bicep 範本、及多語言服務實作（Python、Node.js、C#、Go）
- <strong>測試與疑難排解</strong>：端對端測試方案、監控指令、疑難指導

#### 變更
- **README.md**：更新，新增並連結位於「本地範例 - 容器應用程式」之新容器應用程式範例
- **examples/README.md**：更新，以凸顯容器應用程式範例、增加比較矩陣條目，並更新技術／架構參考
- <strong>課程大綱與學習指南</strong>：更新，於相關章節參考新的容器應用程式範例及部署模式

#### 已驗證
- ✅ 所有新範例均可用 `azd up` 部署且符合最佳實踐
- ✅ 文件交叉連結及導覽已更新
- ✅ 範例涵蓋從初學者到進階場景，包括生產微服務

#### 注意事項
- <strong>範圍</strong>：限英文文件與範例
- <strong>後續動作</strong>：未來版本將擴展更多進階容器模式及 CI/CD 自動化

### [v3.5.0] - 2025-11-19

#### 產品重新命名：Microsoft Foundry
**本版本於所有英文文件中全面將產品名稱從「Microsoft Foundry」改為「Microsoft Foundry」，反映 Microsoft 官方重新命名。**

#### 變更
- **🔄 產品名稱更新**：將「Microsoft Foundry」全線更名為「Microsoft Foundry」
  - 更新 `docs/` 資料夾內所有英文文件中的相關引用
  - 資料夾重新命名：`docs/ai-foundry/` → `docs/microsoft-foundry/`
  - 檔案重新命名：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 總計更新 7 個文件中的 23 個內容引用

- **📁 資料夾結構調整**：
  - 將 `docs/ai-foundry/` 更名為 `docs/microsoft-foundry/`
  - 更新所有跨文件引用以反映此新資料夾結構
  - 驗證所有文件中的導覽連結

- **📄 檔案名稱更新**：
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 更新所有內部連結以指向新檔案名稱

#### 更新的檔案
- <strong>章節文件</strong>（7 個檔案）：
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 處導覽連結更新
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 處產品名稱引用更新
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - 已使用 Microsoft Foundry（先前已更新）
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 處引用更新（概覽、社區回饋、文件）
  - `docs/getting-started/azd-basics.md` - 4 處跨文件連結更新
  - `docs/getting-started/first-project.md` - 2 處章節導覽連結更新
  - `docs/getting-started/installation.md` - 2 處下一章導覽連結更新
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 處引用更新（導覽、Discord 社群）
  - `docs/troubleshooting/common-issues.md` - 1 處導覽連結更新
  - `docs/troubleshooting/debugging.md` - 1 處導覽連結更新

- <strong>課程結構文件</strong>（2 個檔案）：
  - `README.md` - 17 處引用更新（課程概述、章節標題、範本部分、社區見解）
  - `course-outline.md` - 14 處引用更新（概覽、學習目標、章節資源）

#### 已驗證
- ✅ 英文文件中無剩餘「ai-foundry」資料夾路徑引用
- ✅ 英文文件中無剩餘「Microsoft Foundry」產品名稱引用
- ✅ 全部導覽連結於新資料夾結構下均功能正常
- ✅ 檔案及資料夾重新命名已完成
- ✅ 章節間互相參照經驗證無誤

#### 注意事項
- <strong>範圍</strong>：本變更僅套用於 `docs/` 資料夾內的英文文件
- <strong>翻譯</strong>：翻譯資料夾 (`translations/`) 於本版本未更新
- <strong>工作坊</strong>：工作坊資料 (`workshop/`) 於本版本未更新
- <strong>範例</strong>：示範檔案可能仍使用舊命名，將於後續版本處理
- <strong>外部連結</strong>：外部 URL 及 GitHub 儲存庫引用維持不變

#### 貢獻者遷移指南
若您有使用舊結構的本地分支或文件：
1. 更新資料夾參考：`docs/ai-foundry/` → `docs/microsoft-foundry/`
2. 更新檔案參考：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. 替換產品名稱：「Microsoft Foundry」→「Microsoft Foundry」
4. 驗證所有內部文件連結仍正常運作

---

### [v3.4.0] - 2025-10-24

#### 基礎架構預覽與驗證增強
**本版本加入對全新 Azure Developer CLI 預覽功能的完整支援，並提升工作坊使用者體驗。**

#### 新增
- **🧪 azd provision --preview 功能文件**：全面介紹全新基礎架構預覽功能
  - 命令參考與操作範例收錄於速查表
  - 預配套指南中詳述功能整合、使用案例與優點
  - 部署前檢查結合，提升部署安全性
  - 入門指南含安全優先部署實踐更新
- **🚧 工作坊狀態橫幅**：專業 HTML 橫幅表示工作坊開發狀態
  - 漸層設計及施工標示，清晰傳達用戶訊息
  - 最後更新時間戳記以提升透明度
  - 行動裝置響應式設計，支援各種設備顯示

#### 強化
- <strong>基礎架構安全性</strong>：預覽功能整合到整體部署文件
- <strong>部署前驗證</strong>：自動化腳本包含基礎架構預覽測試
- <strong>開發者工作流程</strong>：更新命令流程，將預覽納入最佳實踐
- <strong>工作坊體驗</strong>：明確告知使用者關於內容開發進度

#### 變更
- <strong>部署最佳實務</strong>：推薦以預覽優先工作流程
- <strong>文件流暢度</strong>：基礎架構驗證提前於學習流程內
- <strong>工作坊呈現</strong>：專業狀態通告並清晰開發時程

#### 改進
- <strong>安全至上</strong>：部署前可驗證架構更改
- <strong>團隊協作</strong>：可分享預覽結果供審查及批准
- <strong>成本意識</strong>：提前了解資源費用
- <strong>風險減少</strong>：透過預先驗證降低部署失敗

#### 技術實作
- <strong>多文件整合</strong>：在 4 個重要文件中記錄預覽功能
- <strong>命令範例</strong>：文件中統一語法及例子
- <strong>最佳實踐整合</strong>：預覽納入驗證流程及腳本
- <strong>視覺指標</strong>：新增明顯的「新功能」標示

#### 工作坊基礎架構
- <strong>狀態通報</strong>：專業 HTML 漸層橫幅
- <strong>使用者體驗</strong>：清楚說明開發進度避免誤解
- <strong>專業呈現</strong>：維護資源庫信譽且設下期望
- <strong>時間透明</strong>：2025 年 10 月最後更新時間戳

### [v3.3.0] - 2025-09-24

#### 強化工作坊材料與互動學習體驗
**本版本引入完整的工作坊材料，包含基於瀏覽器的互動指南與結構化學習路徑。**

#### 新增
- **🎥 互動工作坊指南**：具 MkDocs 預覽功能的瀏覽器工作坊體驗
- **📝 結構化工作坊指引**：7 步驟引導學習路徑，從探索至自訂化
  - 0-簡介：工作坊概覽與環境設定
  - 1-選擇 AI 範本：範本探索與挑選流程
  - 2-驗證 AI 範本：部署及驗證程序
  - 3-拆解 AI 範本：瞭解範本架構
  - 4-配置 AI 範本：設定與自訂化
  - 5-客製化 AI 範本：進階修改與迭代
  - 6-拆除基礎架構：清理及資源管理
  - 7-總結：總結與後續步驟
- **🛠️ 工作坊工具**：使用 Material 主題配置 MkDocs，提升學習體驗
- **🎯 實作學習路徑**：三階段方法論（探索 → 部署 → 自訂）
- **📱 GitHub Codespaces 整合**：無縫的開發環境設定

#### 強化
- **AI 工作坊實驗室**：延伸為 2-3 小時的結構化學習體驗
- <strong>工作坊文件</strong>：專業呈現，輔以導覽與視覺輔助
- <strong>學習進度</strong>：從範本選擇至生產部署，清楚步驟指引
- <strong>開發者體驗</strong>：整合工具簡化開發流程

#### 改進
- <strong>可及性</strong>：瀏覽器介面含搜尋、複製碼功能與主題切換
- <strong>自我節奏學習</strong>：靈活的工作坊結構適應不同學習速度
- <strong>實務應用</strong>：真實的 AI 範本部署場景
- <strong>社群整合</strong>：Discord 整合支援與合作

#### 工作坊特色
- <strong>內建搜尋</strong>：快速關鍵字及課程搜尋
- <strong>複製代碼區塊</strong>：滑鼠經過即可複製所有範例程式碼
- <strong>主題切換</strong>：支援暗／亮模式切換以符合不同喜好
- <strong>視覺資源</strong>：截圖及圖表提升理解
- <strong>協助整合</strong>：直接連結 Discord 社群支援

### [v3.2.0] - 2025-09-17

#### 主要導覽重組與章節學習系統
**本版本推出全面性的章節式學習結構，並提升整個資源庫導覽體驗。**

#### 新增
- **📚 章節式學習系統**：將整體課程重組為 8 個循序漸進的學習章節
  - 第 1 章：基礎與快速入門（⭐ - 30-45 分鐘）
  - 第 2 章：AI 優先開發（⭐⭐ - 1-2 小時）
  - 第 3 章：配置與驗證（⭐⭐ - 45-60 分鐘）
  - 第 4 章：基礎架構即程式碼與部署（⭐⭐⭐ - 1-1.5 小時）
  - 第 5 章：多智能代理 AI 解決方案（⭐⭐⭐⭐ - 2-3 小時）
  - 第 6 章：部署前驗證與規劃（⭐⭐ - 1 小時）
  - 第 7 章：故障排除與除錯（⭐⭐ - 1-1.5 小時）
  - 第 8 章：生產與企業模式（⭐⭐⭐⭐ - 2-3 小時）
- **📚 全面導覽系統**：所有文件均採用一致的標頭與頁尾導覽
- **🎯 進度追蹤**：課程完成檢查清單與學習驗證系統
- **🗺️ 學習路徑指引**：針對不同經驗層級與目標的清楚入門點
- **🔗 交叉參考導覽**：清楚連結相關章節與預備條件

#### 強化
- **README 結構**：轉變為章節式的結構化學習平台
- <strong>文件導覽</strong>：每頁加入章節背景與學習進度指引
- <strong>範本組織</strong>：範例與範本分配至適當學習章節
- <strong>資源整合</strong>：速查表、常見問答及學習指南連結相關章節
- <strong>工作坊整合</strong>：實作實驗室對應多個章節學習目標

#### 變更
- <strong>學習進度</strong>：從直線型文件改為彈性的章節學習
- <strong>配置調整</strong>：學習流程中，配置指南移至第 3 章
- **AI 內容整合**：貫穿學習旅程的 AI 專屬內容更完善
- <strong>生產內容</strong>：進階模式集中於第 8 章，適合企業學習者

#### 改進
- <strong>用戶體驗</strong>：清楚的導覽麵包屑與章節進度指標
- <strong>可及性</strong>：一致的導覽模式，方便課程流覽
- <strong>專業呈現</strong>：大學式課程結構，適用學術及企業培訓
- <strong>學習效率</strong>：優化組織降低尋找內容時間

#### 技術實作
- <strong>導覽標頭</strong>：40 多份文件採統一章節導覽
- <strong>頁尾導覽</strong>：持續指引與章節完成狀況標示
- <strong>交叉連結</strong>：豐富內部連結系統連結相關概念
- <strong>章節對應</strong>：範本與範例清楚附屬學習目標

#### 學習指南強化
- **📚 全面學習目標**：重構學習指南以配合 8 章體系
- **🎯 章節評估**：各章含特定學習目標與實務練習
- **📋 進度追蹤**：每週學習日程與可衡量結果及完成清單
- **❓ 測驗題目**：各章知識驗證問題，具專業成果導向
- **🛠️ 實作練習**：包含部署與故障排除的實務活動
- **📊 技能進階**：明確從基礎至企業模式之職涯進階
- **🎓 認證架構**：專業發展成果與社群認可系統
- **⏱️ 時程管理**：結構化 10 週學習計畫與里程碑驗證

### [v3.1.0] - 2025-09-17

#### 強化多智能代理 AI 解決方案
**本版本改進零售場景中的多智能代理方案，更清楚的代理命名與改進文件。**

#### 變更
- <strong>多智能代理用語</strong>：零售多智能代理方案中，全體將「Cora agent」更名為「Customer agent」，以利理解
- <strong>代理架構</strong>：更新所有文件、ARM 範本及程式碼範例，採用統一的「Customer agent」命名
- <strong>配置範例</strong>：現代化代理配置範式，採用新版命名慣例
- <strong>文件一致性</strong>：確保所有引用皆使用專業且描述性代理名稱

#### 強化
- **ARM 範本套件**：更新 retail-multiagent-arm-template，加入 Customer agent 參考
- <strong>架構圖</strong>：更新 Mermaid 圖表，採用新的 agent 命名
- <strong>程式碼範例</strong>：Python 類別及實作範例改用 CustomerAgent 命名
- <strong>環境變數</strong>：所有部署腳本更新以使用 CUSTOMER_AGENT_NAME 規範

#### 改進項目
- <strong>開發者體驗</strong>：文件中更清晰說明 agent 角色與責任
- <strong>生產準備度</strong>：更符合企業命名慣例
- <strong>學習素材</strong>：為教學目的使用更直覺的 agent 命名
- <strong>範本可用性</strong>：簡化 agent 功能與部署範式的理解

#### 技術細節
- 更新 Mermaid 架構圖，加入 CustomerAgent 參考
- Python 範例中將 CoraAgent 類別名稱改為 CustomerAgent
- ARM 範本 JSON 配置改用 "customer" agent 類型
- 環境變數從 CORA_AGENT_* 改為 CUSTOMER_AGENT_* 格式
- 更新所有部署指令與容器配置

### [v3.0.0] - 2025-09-12

#### 重大變更 - AI 開發者聚焦及 Microsoft Foundry 整合
**此版本將倉庫轉型為一個全面的 AI 專注學習資源，並整合 Microsoft Foundry。**

#### 新增
- **🤖 AI 先行學習路徑**：完整重構，優先針對 AI 開發者和工程師
- **Microsoft Foundry 整合指南**：詳盡說明如何連接 AZD 與 Microsoft Foundry 服務
- **AI 模型部署範式**：覆蓋模型選擇、配置及生產部署策略的詳細指南
- **AI 工作坊實驗室**：2-3 小時的實作工作坊，教學 AI 應用轉成可用 AZD 部署的解決方案
- **生產 AI 最佳實踐**：企業級擴展、監控與安全模式
- **AI 專屬故障排除指南**：涵蓋 Microsoft Foundry 模型、認知服務及 AI 部署問題
- **AI 範本集錦**：收錄 Microsoft Foundry 範本並附複雜度評級
- <strong>工作坊教學資源</strong>：完整的工作坊結構，包含實驗與參考資料

#### 強化
- **README 結構**：聚焦 AI 開發者，含 45% Microsoft Foundry Discord 社群興趣數據
- <strong>學習路徑</strong>：新增 AI 開發者路徑，並保留學生及 DevOps 工程師傳統路線
- <strong>範本推薦</strong>：重點 AI 範本，如 azure-search-openai-demo、contoso-chat、openai-chat-app-quickstart
- <strong>社群整合</strong>：加強 Discord 社群支援，設立 AI 專用頻道與討論群組

#### 安全與生產
- <strong>受管理身分識別模式</strong>：AI 專屬認證與安全配置
- <strong>成本優化</strong>：AI 工作負載的 Token 使用跟蹤與預算控制
- <strong>多區域部署</strong>：全球 AI 應用部署策略
- <strong>效能監控</strong>：AI 指標及 Application Insights 整合

#### 文件品質
- <strong>線性課程結構</strong>：從初學到進階的 AI 部署模式邏輯進展
- <strong>連結驗證</strong>：所有外部倉庫連結均經過確認可用
- <strong>完整參考</strong>：內部文件連結皆有效
- <strong>生產準備</strong>：企業級部署模式搭配真實案例

### [v2.0.0] - 2025-09-09

#### 重大變更 - 倉庫重構與專業化提升
**此版本對倉庫結構與內容呈現進行重大改版。**

#### 新增
- <strong>結構化學習框架</strong>：所有文檔頁面均新增介紹、學習目標及學習成果段落
- <strong>導覽系統</strong>：全文件加入前一章/下一章連結，支援導學進度
- <strong>學習指南</strong>：全面的 study-guide.md，涵蓋學習目標、練習與評量資料
- <strong>專業外觀</strong>：移除所有表情符號，提升可讀性與專業感
- <strong>內容結構優化</strong>：改進學習素材的組織與流程

#### 變更
- <strong>文檔格式</strong>：標準化為一致的以學習為中心架構
- <strong>導覽流程</strong>：實施邏輯性進階流程
- <strong>內容呈現</strong>：移除裝飾性元素，以清晰專業格式呈現
- <strong>連結架構</strong>：更新內部連結以支援新導覽系統

#### 改善
- <strong>無障礙性</strong>：移除表情符號依賴，改善螢幕閱讀器相容性
- <strong>專業外觀</strong>：清爽、學術風格式，適合企業學習環境
- <strong>學習體驗</strong>：每節課內容結構明確，目標與成果清晰
- <strong>內容組織</strong>：相關主題間邏輯關聯更佳

### [v1.0.0] - 2025-09-09

#### 初次發布 - 全方位 AZD 學習倉庫

#### 新增
- <strong>核心文件結構</strong>
  - 完整的入門指南系列
  - 全面的部署和資源配置文件
  - 詳盡的故障排除資源及除錯指南
  - 部署前驗證工具與程序

- <strong>入門模組</strong>
  - AZD 基礎：核心概念與術語介紹
  - 安裝指南：平台特定安裝說明
  - 配置指南：環境設定與認證
  - 第一個專案教學：循序漸進實作學習

- <strong>部署與資源配置模組</strong>
  - 部署指南：完整工作流程文件
  - 資源配置指南：使用 Bicep 進行基礎架構即程式碼
  - 生產部署最佳實踐
  - 多服務架構模式

- <strong>部署前驗證模組</strong>
  - 容量規劃：驗證 Azure 資源可用性
  - SKU 選擇：完整服務等級指引
  - 預檢核：自動化驗證腳本（PowerShell 與 Bash）
  - 成本估算及預算規劃工具

- <strong>故障排除模組</strong>
  - 常見問題：遇到問題及解決方法
  - 除錯指南：系統化故障排除技術
  - 先進診斷技術與工具
  - 效能監控與優化

- <strong>資源與參考</strong>
  - 指令速查表：重點命令快速參考
  - 詞彙集：詳盡術語與縮寫定義
  - 常見問答：詳細解答常見疑問
  - 外部資源連結與社群關聯

- <strong>範例與範本</strong>
  - 簡易網頁應用範例
  - 靜態網站部署範本
  - 容器應用配置
  - 資料庫整合模式
  - 微服務架構範例
  - 無伺服器函數實作

#### 特性
- <strong>跨平台支援</strong>：Windows、macOS、Linux 安裝與配置指南
- <strong>多技能層級</strong>：內容涵蓋學生至專業開發者
- <strong>實務導向</strong>：實作範例與真實場景
- <strong>全面覆蓋</strong>：從基礎概念到高級企業模式
- <strong>安全優先</strong>：全程貫徹安全最佳實務
- <strong>成本優化</strong>：經濟有效的部署與資源管理指引

#### 文件品質
- <strong>詳盡程式碼範例</strong>：實用且經測試的程式碼樣本
- <strong>逐步指導</strong>：清晰且可行的步驟說明
- <strong>完整錯誤處理</strong>：常見問題故障排除
- <strong>最佳實務整合</strong>：業界標準與建議
- <strong>版本相容性</strong>：與最新 Azure 服務及 azd 功能同步

## 未來增強計劃

### 版本 3.1.0（規劃中）
#### AI 平台擴展
- <strong>多模型支援</strong>：整合 Hugging Face、Azure Machine Learning 及自訂模型模式
- **AI 代理框架**：LangChain、Semantic Kernel、AutoGen 部署範本
- **進階 RAG 模式**：矢量資料庫選項，超越 Azure AI Search（Pinecone、Weaviate 等）
- **AI 觀測性**：強化模型效能、Token 使用及回應品質監控

#### 開發者體驗
- **VS Code 擴充套件**：整合 AZD + Microsoft Foundry 開發體驗
- **GitHub Copilot 整合**：AI 輔助生成 AZD 範本
- <strong>互動式教學</strong>：含自動驗證的 AI 實作練習
- <strong>影音內容</strong>：針對視覺學習者的 AI 部署教學影片

### 版本 4.0.0（規劃中）
#### 企業 AI 模式
- <strong>治理框架</strong>：AI 模型治理、合規與稽核軌跡
- **多租戶 AI**：多客戶隔離 AI 服務模式
- **邊緣 AI 部署**：結合 Azure IoT Edge 與容器實例
- **混合雲 AI**：多雲與混合部署模式

#### 進階功能
- **AI 流程自動化**：MLOps 與 Azure Machine Learning 管線整合
- <strong>進階安全</strong>：零信任、私有端點及威脅防護
- <strong>效能優化</strong>：高吞吐量 AI 應用的調校與擴展策略
- <strong>全球分發</strong>：內容交付與邊緣快取模式

### 版本 3.0.0（規劃中） - 已由目前版本取代
#### 建議新增項目 - 已於 v3.0.0 實作
- ✅ **以 AI 為核心內容**：全面 Microsoft Foundry 整合（完成）
- ✅ <strong>互動教學</strong>：AI 工作坊實作實驗室（完成）
- ✅ <strong>進階安全模組</strong>：AI 專屬安全模式（完成）
- ✅ <strong>效能優化</strong>：AI 工作負載調校策略（完成）

### 版本 2.1.0（規劃中）- 部分已於 v3.0.0 實作
#### 小幅改進 - 部分已完成
- ✅ <strong>額外範例</strong>：AI 專注部署情境（完成）
- ✅ **擴充 FAQ**：AI 專屬問題與故障排除（完成）
- <strong>工具整合</strong>：增強 IDE 與編輯器整合指導
- ✅ <strong>監控擴展</strong>：AI 專屬監控與警示模式（完成）

#### 待未來版本實作
- <strong>行動友好文件</strong>：響應式設計的行動學習版本
- <strong>離線存取</strong>：可下載文件套件
- **增強 IDE 整合**：AZD + AI 工作流程的 VS Code 擴充
- <strong>社群儀表板</strong>：即時社群統計與貢獻追蹤

## 變更日誌貢獻指南

### 報告變更
貢獻此倉庫時，請確保變更日誌條目包含：

1. <strong>版本號</strong>：依語意版本號規則（major.minor.patch）
2. <strong>日期</strong>：發布或更新的 YYYY-MM-DD 格式
3. <strong>類別</strong>：新增、變更、棄用、移除、修復、安全
4. <strong>清晰描述</strong>：簡要說明變更內容
5. <strong>影響評估</strong>：變更對現有用戶的影響

### 變更類別

#### 新增
- 新功能、文件段落或能力
- 新範例、範本或學習資源
- 額外的工具、腳本或實用程序

#### 變更
- 現有功能或文件的修改
- 用以提升清晰度或準確度的更新
- 內容或組織結構的重新安排

#### 棄用
- 將逐漸淘汰的功能或方式
- 計畫移除的文件段落
- 有更佳替代方案的方法

#### 移除
- 不再相關的功能、文件或範例
- 過時資訊或棄用方法
- 多餘或合併後的內容

#### 修復
- 文件或程式碼錯誤修正
- 報告問題的解決
- 精準度或功能性的改良

#### 安全
- 與安全相關的改進或修復
- 更新安全最佳實務
- 解決安全漏洞

### 語意版本規範指南

#### 主要版本 (X.0.0)
- 導致使用者需採取行動的重大變更
- 內容或組織架構大幅改造
- 改變根本方法或流程

#### 次要版本 (X.Y.0)
- 新功能或內容加入
- 保持向下相容的改進
- 額外範例、工具或資源

#### 修訂版 (X.Y.Z)
- 錯誤修正
- 現有內容的小幅改進
- 澄清與細微增強

## 社群反饋與建議

我們積極鼓勵社群反饋，以持續優化此學習資源：

### 如何提供反饋
- **GitHub Issues**：回報問題或建議改進（歡迎 AI 專屬問題）
- **Discord 討論**：分享想法，與 Microsoft Foundry 社群交流
- **Pull Requests**：直接貢獻內容改進，特別是 AI 範本與指南
- **Microsoft Foundry Discord**：參與 #Azure 頻道，討論 AZD + AI 主題
- <strong>社群論壇</strong>：參與更廣泛的 Azure 開發者討論

### 反饋類別
- **AI 內容準確度**：修正 AI 服務整合與部署資訊
- <strong>學習體驗</strong>：改進 AI 開發者學習流程建議
- **缺少 AI 內容**：要求新增 AI 範本、模式或示例
- <strong>可及性</strong>：促進多元學習需求改善
- **AI 工具整合**：加強 AI 開發工作流程建議
- **生產 AI 模式**：企業 AI 部署模式需求

### 回應承諾
- <strong>議題回應</strong>：收到回報問題後 48 小時內回覆
- <strong>功能請求</strong>：一週內評估
- <strong>社群貢獻</strong>：一週內審核
- <strong>安全議題</strong>：優先處理，迅速回應

## 維護計劃

### 定期更新
- <strong>每月檢視</strong>：內容準確度與連結驗證
- <strong>每季更新</strong>：重大內容新增與優化
- <strong>半年檢視</strong>：全面重構與強化
- <strong>年度發布</strong>：重大版本更新與重要改進

### 監控與品質保證
- <strong>自動測試</strong>：定期驗證程式碼範例與連結
- <strong>社群反饋整合</strong>：持續納入使用者建議
- <strong>技術更新</strong>：與最新 Azure 服務及 azd 版本同步
- <strong>無障礙審核</strong>：定期檢視包容性設計原則

## 版本支援政策

### 當前版本支援
- <strong>最新主要版本</strong>：全面支援並定期更新  
- <strong>先前主要版本</strong>：提供安全性更新和關鍵修復達12個月  
- <strong>舊版本</strong>：僅有社群支援，無官方更新  

### 遷移指引  
當主要版本發布時，我們會提供：  
- <strong>遷移指南</strong>：逐步過渡說明  
- <strong>相容性說明</strong>：破壞性變更的詳細資訊  
- <strong>工具支援</strong>：協助遷移的腳本或工具  
- <strong>社群支援</strong>：專門討論遷移問題的論壇  

---

<strong>導航</strong>  
- <strong>前一課</strong>：[學習指南](resources/study-guide.md)  
- <strong>下一課</strong>：返回[主 README](README.md)  

<strong>保持更新</strong>：關注此存放庫以接收新版本和重要學習資源更新的通知。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於重要資訊，建議採用專業人工作翻譯。我們不對因使用本翻譯而產生的任何誤解或誤譯負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->