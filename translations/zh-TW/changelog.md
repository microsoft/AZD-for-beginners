# 更新日誌 - AZD For Beginners

## 介紹

此更新日誌記錄 AZD For Beginners 儲存庫中所有顯著的變更、更新與改進。我們遵循語義版本控制原則並維護此日誌，以幫助使用者了解各版本之間的差異。

## 學習目標

透過檢視此更新日誌，您將能夠：
- 隨時掌握新增功能與內容
- 了解現有文件的改進
- 追蹤錯誤修正與更正以確保準確性
- 追蹤學習教材的演進過程

## 學習成果

在檢視更新日誌條目後，您將能夠：
- 識別可用的新內容與學習資源
- 了解哪些章節已被更新或改進
- 根據最新教材規劃您的學習路徑
- 提供回饋與建議以利未來改進

## 版本歷史

### [v3.18.0] - 2026-03-16

#### AZD AI CLI 指令、內容驗證與範本擴充
**此版本在所有與 AI 相關章節中新增 `azd ai`、`azd extension` 與 `azd mcp` 指令的涵蓋，修正 agents.md 中的斷鏈與已棄用程式碼，更新速查表，並徹底改寫範例範本區段，包含經驗證的描述與新的 Azure AI AZD 範本。**

#### 新增
- **🤖 AZD AI CLI 涵蓋範圍** 橫跨 7 個檔案（之前僅在第 8 章）：
  - `docs/chapter-01-foundation/azd-basics.md` — 新增「Extensions and AI Commands」章節，介紹 `azd extension`、`azd ai agent init` 與 `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — 選項 4：`azd ai agent init`，並附上（template 與 manifest 方法）比較表
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — 「AZD Extensions for Foundry」與「Agent-First Deployment」小節
  - `docs/chapter-05-multi-agent/README.md` — 快速開始現在顯示範本與基於 manifest 的部署路徑
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy 區段現在包含 `azd ai agent init` 選項
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — 「AZD AI Extension Commands for Diagnostics」小節
  - `resources/cheat-sheet.md` — 新增「AI & Extensions Commands」區段，包含 `azd extension`、`azd ai agent init`、`azd mcp` 與 `azd infra generate`
- **📦 新增 AZD AI 範例範本**，列於 `microsoft-foundry-integration.md`：
  - **azure-search-openai-demo-csharp** — .NET RAG 聊天，使用 Blazor WebAssembly、Semantic Kernel，並支援語音聊天
  - **azure-search-openai-demo-java** — Java RAG 聊天，使用 Langchain4J，提供 ACA/AKS 部署選項
  - **contoso-creative-writer** — 使用 Azure AI Agent Service、Bing Grounding 與 Prompty 的多代理創作應用程式
  - **serverless-chat-langchainjs** — 無伺服器 RAG，採用 Azure Functions + LangChain.js + Cosmos DB，並支援 Ollama 本機開發
  - **chat-with-your-data-solution-accelerator** — 企業級 RAG 加速器，含管理入口網站、Teams 整合與 PostgreSQL/Cosmos DB 選項
  - **azure-ai-travel-agents** — 多代理 MCP 編排參考應用，伺服器範例採用 .NET、Python、Java 與 TypeScript
  - **azd-ai-starter** — 最簡 Azure AI 基礎建設 Bicep 啟動範本
  - **🔗 Awesome AZD AI Gallery link** — 參考 [awesome-azd AI 精選庫](https://azure.github.io/awesome-azd/?tags=ai)（80+ 範本）

#### 修正
- **🔗 agents.md 導航**：Previous/Next 連結現在與第 2 章 README 的課程順序相符（Microsoft Foundry Integration → Agents → AI Model Deployment）
- **🔗 agents.md 斷鏈**：將 `production-ai-practices.md` 修正為 `../chapter-08-production/production-ai-practices.md`（3 處）
- **📦 agents.md 已棄用程式碼**：以 `azure-monitor-opentelemetry` + OpenTelemetry SDK 取代 `opencensus`
- **🐛 agents.md 無效 API**：將 `max_tokens` 從 `create_agent()` 移至 `create_run()`，改為 `max_completion_tokens`
- **🔢 agents.md 代幣計數**：以 `tiktoken.encoding_for_model()` 取代粗略的 `len//4` 估算
- **azure-search-openai-demo**：將服務從 "Cognitive Search + App Service" 更正為 "Azure AI Search + Azure Container Apps"（預設主機於 2024 年 10 月變更）
- **contoso-chat**：更新描述以參照 Azure AI Foundry + Prompty，與該 repo 的實際標題與技術堆疊相符

#### 已移除
- **ai-document-processing**：移除無法使用的範本參考（該 repo 並非以 AZD 範本公開存取）

#### 改進
- **📝 agents.md 練習**：練習 1 現在顯示預期輸出與 `azd monitor` 步驟；練習 2 包含完整的 `FunctionTool` 註冊程式碼；練習 3 將模糊指引替換為具體的 `prepdocs.py` 命令
- **📚 agents.md 資源**：更新文件連結至目前的 Azure AI Agent Service 文件與快速入門
- **📋 agents.md 下一步表格**：新增 AI Workshop Lab 連結以涵蓋完整章節內容

#### 更新的檔案
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### 課程導覽強化
**此版本以增強的表格格式改善 README.md 的章節導覽。**

#### 變更
- <strong>課程地圖表格</strong>：加入直接課程連結、時長估計與複雜度評級
- <strong>資料夾清理</strong>：移除冗餘的舊資料夾（deployment/、getting-started/、pre-deployment/、troubleshooting/）
- <strong>連結驗證</strong>：已驗證課程地圖表格中的 21+ 個內部連結

### [v3.16.0] - 2026-02-05

#### 產品名稱更新
**此版本將產品參考更新為目前的 Microsoft 品牌名稱。**

#### 變更
- **Microsoft Foundry → Microsoft Foundry**：非翻譯檔案中的所有引用已更新
- **Azure AI Agent Service → Foundry Agents**：服務名稱已更新以反映現行品牌

#### 更新的檔案
- `README.md` - 主要課程首頁
- `changelog.md` - 版本歷史
- `course-outline.md` - 課程結構
- `docs/chapter-02-ai-development/agents.md` - AI agents 指南
- `examples/README.md` - 範例文件
- `workshop/README.md` - 工作坊首頁
- `workshop/docs/index.md` - 工作坊索引
- `workshop/docs/instructions/*.md` - 所有工作坊指示檔案

---

### [v3.15.0] - 2026-02-05

#### 主要儲存庫重構：章節式資料夾名稱
**此版本將文件重構為專用章節資料夾，以便更清楚的導覽。**

#### 資料夾重新命名
舊資料夾已被章節編號資料夾取代：
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- 新增：`docs/chapter-05-multi-agent/`

#### 檔案遷移
| File | From | To |
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
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### 新增
- **📚 章節 README 檔案**：在每個章節資料夾建立 README.md，包含：
  - 學習目標與時長
  - 課程表格與說明
  - 快速開始指令
  - 與其他章節的導覽連結

#### 變更
- **🔗 更新所有內部連結**：已在所有文件中更新 78+ 個路徑
- **🗺️ 主 README.md**：以新的章節結構更新課程地圖
- **📝 examples/README.md**：更新至章節資料夾的交叉參考

#### 已移除
- 舊資料夾結構（getting-started/、microsoft-foundry/、deployment/、pre-deployment/、troubleshooting/、ai-foundry/）

---

### [v3.14.0] - 2026-02-05

#### 儲存庫重構：章節導覽
**此版本新增章節導覽 README 檔案（後由 v3.15.0 取代）。**

---

### [v3.13.0] - 2026-02-05

#### 新的 AI 代理指南
**此版本新增一份完整指南，說明如何使用 Azure Developer CLI 部署 AI 代理。**

#### 新增
- **🤖 docs/microsoft-foundry/agents.md**：完整指南涵蓋：
  - 什麼是 AI 代理，以及它們與聊天機器人的差異
  - 三個快速啟動代理範本（Foundry Agents、Prompty、RAG）
  - 代理架構模式（單一代理、RAG、多代理）
  - 工具設定與自訂
  - 監控與指標追蹤
  - 成本考量與最佳化
  - 常見疑難排解情境
  - 三個實作練習與成功標準

#### 內容結構
- <strong>簡介</strong>：為初學者說明代理概念
- <strong>快速開始</strong>：使用 `azd init --template get-started-with-ai-agents` 部署代理
- <strong>架構模式</strong>：代理模式的視覺化示意圖
- <strong>設定</strong>：工具設定與環境變數
- <strong>監控</strong>：Application Insights 整合
- <strong>練習</strong>：漸進式的實作學習（每項 20-45 分鐘）

---

### [v3.12.0] - 2026-02-05

#### 開發容器環境更新
**此版本更新開發容器設定，採用現代化工具與更佳的預設值，以提升 AZD 學習體驗。**

#### 變更
- **🐳 基底映像**：由 `python:3.12-bullseye` 更新為 `python:3.12-bookworm`（最新的 Debian 穩定版）
- **📛 容器名稱**：從 "Python 3" 重新命名為 "AZD for Beginners" 以便辨識

#### 新增
- **🔧 新的開發容器功能**:
  - `azure-cli` 已啟用 Bicep 支援
  - `node:20`（AZD 範本的 LTS 版本）
  - `github-cli` 用於範本管理
  - `docker-in-docker` 用於 Container App 部署

- **🔌 連接埠轉發**: 預先配置常見開發埠：
  - 8000 (MkDocs 預覽)
  - 3000 (網站應用)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 新增 VS Code 擴充功能**:
  - `ms-python.vscode-pylance` - 增強的 Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - 支援 Azure Functions
  - `ms-azuretools.vscode-docker` - Docker 支援
  - `ms-azuretools.vscode-bicep` - Bicep 語言支援
  - `ms-azure-devtools.azure-resource-groups` - Azure 資源管理
  - `yzhang.markdown-all-in-one` - Markdown 編輯
  - `DavidAnson.vscode-markdownlint` - Markdown 程式碼風格檢查
  - `bierner.markdown-mermaid` - Mermaid 圖表支援
  - `redhat.vscode-yaml` - YAML 支援（用於 azure.yaml）
  - `eamodio.gitlens` - Git 視覺化
  - `mhutchie.git-graph` - Git 歷史

- **⚙️ VS Code 設定**: 新增預設設定，用於 Python 直譯器、儲存時格式化與移除空白

- **📦 更新 requirements-dev.txt**:
  - 新增 MkDocs minify 外掛
  - 新增 pre-commit 以維持程式碼品質
  - 新增 Azure SDK 套件（azure-identity、azure-mgmt-resource）

#### 修正
- **Post-Create Command**：現在會在容器啟動時驗證 AZD 與 Azure CLI 的安裝情況

---

### [v3.11.0] - 2026-02-05

#### 針對初學者友善的 README 大幅改版
**此版本大幅改善 README.md 的可讀性，讓初學者更容易上手，並新增針對 AI 開發者的必要資源。**

#### 新增
- **🆚 Azure CLI 與 AZD 比較**：清楚說明何時使用各工具並搭配實際範例
- **🌟 精選 AZD 連結**：直接連結至社群範本目錄與貢獻資源：
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ 可直接部署的範本
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - 社群投稿
- **🎯 快速開始指南**：簡化為 3 步驟的入門章節（安裝 → 登入 → 部署）
- **📊 根據經驗的導覽表**：依開發者經驗提供清楚的起點建議

#### 變更
- **README 結構**：重新組織為漸進式揭露重點資訊 — 重要資訊優先
- <strong>介紹章節</strong>：重新撰寫以向完全初學者說明「`azd up` 的魔力」
- <strong>移除重複內容</strong>：刪除重複的疑難排解章節
- <strong>疑難排解指令</strong>：修正 `azd logs` 參考，改為使用有效的 `azd monitor --logs`

#### 修正
- **🔐 驗證指令**：已在 cheat-sheet.md 新增 `azd auth login` 與 `azd auth logout`
- <strong>無效命令參考</strong>：從 README 的疑難排解章節移除剩餘的 `azd logs`

#### 註記
- <strong>範圍</strong>：變更套用於主要 README.md 與 resources/cheat-sheet.md
- <strong>目標讀者</strong>：改進特別針對剛接觸 AZD 的開發者

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI 指令準確性更新
**此版本修正文件中不存在的 AZD 指令，確保所有範例程式碼使用有效的 Azure Developer CLI 語法。**

#### 修正
- **🔧 移除不存在的 AZD 指令**：全面審核並更正無效指令：
  - `azd logs`（不存在）→ 改為 `azd monitor --logs` 或 Azure CLI 替代指令
  - `azd service` 子指令（不存在）→ 改為 `azd show` 與 Azure CLI
  - `azd infra import/export/validate`（不存在）→ 已移除或以有效替代方案取代
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` 旗標（不存在）→ 已移除
  - `azd provision --what-if/--rollback` 旗標（不存在）→ 更新為使用 `--preview`
  - `azd config validate`（不存在）→ 改為 `azd config list`
  - `azd info`、`azd history`、`azd metrics`（不存在）→ 已移除

- **📚 已更新檔案以更正指令**：
  - `resources/cheat-sheet.md`：指令參考大幅改寫
  - `docs/deployment/deployment-guide.md`：修正回滾與部署策略
  - `docs/troubleshooting/debugging.md`：修正日誌分析章節
  - `docs/troubleshooting/common-issues.md`：更新疑難排解指令
  - `docs/troubleshooting/ai-troubleshooting.md`：修正 AZD 偵錯章節
  - `docs/getting-started/azd-basics.md`：修正監控指令
  - `docs/getting-started/first-project.md`：更新監控與偵錯範例
  - `docs/getting-started/installation.md`：修正說明與版本範例
  - `docs/pre-deployment/application-insights.md`：修正檢視日誌指令
  - `docs/pre-deployment/coordination-patterns.md`：修正代理程式偵錯指令

- **📝 版本參考更新**：
  - `docs/getting-started/installation.md`：將硬編碼的 `1.5.0` 版本改為通用 `1.x.x` 並附上 releases 連結

#### 變更
- <strong>回滾策略</strong>：文件改為使用 Git 為基礎的回滾（AZD 沒有原生回滾功能）
- <strong>日誌檢視</strong>：將 `azd logs` 參考改為 `azd monitor --logs`、`azd monitor --live` 以及 Azure CLI 指令
- <strong>效能章節</strong>：移除不存在的平行/增量部署旗標，提供有效的替代方案

#### 技術細節
- **有效的 AZD 指令**：`init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **有效的 azd monitor 旗標**：`--live`, `--logs`, `--overview`
- <strong>已移除的功能</strong>：`azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### 註記
- <strong>驗證</strong>：指令已針對 Azure Developer CLI v1.23.x 進行驗證

---

### [v3.9.0] - 2026-02-05

#### 工作坊完成與文件品質更新
**此版本完成互動式工作坊模組，修復所有斷裂的文件連結，並提升針對使用 Microsoft AZD 的 AI 開發者的整體內容品質。**

#### 新增
- **📝 CONTRIBUTING.md**：新增貢獻指南文件，內容包含：
  - 報告問題與提出變更的清晰指示
  - 新內容的文件標準
  - 程式碼範例指導與提交訊息慣例
  - 社群參與資訊

#### 完成
- **🎯 工作坊模組 7（總結）**：完整完成總結模組，包含：
  - 工作坊成果的全面摘要
  - 精華概念掌握章節，涵蓋 AZD、範本與 Microsoft Foundry
  - 建議的後續學習路徑
  - 具有難度分級的工作坊挑戰練習
  - 社群回饋與支援連結

- **📚 工作坊模組 3（拆解）**：更新學習目標，包含：
  - GitHub Copilot 與 MCP 伺服器啟用指導
  - AZD 範本資料夾結構理解
  - 基礎設施即程式碼（Bicep）組織模式
  - 實作實驗室指令

- **🔧 工作坊模組 6（拆除）**：完成，包含：
  - 資源清理與成本管理目標
  - 使用 `azd down` 的安全基礎設施退場
  - 軟刪除認知服務的復原指導
  - 針對 GitHub Copilot 與 Azure Portal 的延伸探索提示

#### 修正
- **🔗 斷裂連結修復**：解決 15+ 個內部文件斷鏈：
  - `docs/ai-foundry/ai-model-deployment.md`：修正至 microsoft-foundry-integration.md 的路徑
  - `docs/troubleshooting/ai-troubleshooting.md`：更正 ai-model-deployment.md 與 production-ai-practices.md 的路徑
  - `docs/getting-started/first-project.md`：以 deployment-guide.md 取代不存在的 cicd-integration.md
  - `examples/retail-scenario.md`：修正 FAQ 與疑難排解指南路徑
  - `examples/container-app/microservices/README.md`：更正課程首頁與部署指南路徑
  - `resources/faq.md` 與 `resources/glossary.md`：更新 AI 章節參考
  - `course-outline.md`：修正講師指南與 AI 工作坊實驗室參考

- **📅 工作坊狀態橫幅**：由「施工中」更新為 2026 年 2 月的活動工作坊狀態

- **🔗 工作坊導覽**：修正 workshop README.md 中指向不存在 lab-1-azd-basics 資料夾的壞鏈接

#### 變更
- <strong>工作坊簡報</strong>：移除「施工中」警示，工作坊現已完成並可使用
- <strong>導覽一致性</strong>：確保所有工作坊模組具有正確的模組間導覽
- <strong>學習路徑參考</strong>：更新章節交叉參考以使用正確的 microsoft-foundry 路徑

#### 驗證
- ✅ 所有英文 markdown 檔案具有有效的內部連結
- ✅ 工作坊模組 0-7 已完成並具有學習目標
- ✅ 章節與模組間的導覽正常運作
- ✅ 內容適合使用 Microsoft AZD 的 AI 開發者
- ✅ 全程使用對初學者友善的語言與結構
- ✅ CONTRIBUTING.md 為社群貢獻者提供清楚指引

#### 技術實作
- <strong>連結驗證</strong>：使用自動化 PowerShell 腳本驗證所有 .md 的內部連結
- <strong>內容稽核</strong>：人工檢視工作坊完整性與對初學者的適合性
- <strong>導覽系統</strong>：套用一致的章節與模組導覽模式

#### 註記
- <strong>範圍</strong>：變更僅套用於英文文件
- <strong>翻譯</strong>：此版本未更新翻譯資料夾（自動翻譯稍後會同步）
- <strong>工作坊時長</strong>：完整工作坊現在提供 3-4 小時的實作學習

---

### [v3.8.0] - 2025-11-19

#### 進階文件：監控、安全性與多代理模式
**此版本新增完整的 A 級課程，涵蓋 Application Insights 整合、驗證模式與生產部署的多代理協調。**

#### 新增
- **📊 Application Insights 整合課程**：位於 `docs/pre-deployment/application-insights.md`：
  - 以 AZD 為中心的自動佈署與自動佈建
  - Application Insights + Log Analytics 的完整 Bicep 範本
  - 搭配自訂遙測的可運作 Python 應用（1,200+ 行）
  - AI/LLM 監控模式（Microsoft Foundry 模型的 Token/成本追蹤）
  - 6 張 Mermaid 圖表（架構、分散式追蹤、遙測流程）
  - 3 個實作練習（警示、儀表板、AI 監控）
  - Kusto 查詢範例與成本最佳化策略
  - 即時指標串流與即時偵錯
  - 40-50 分鐘學習時長，具備生產就緒模式

- **🔐 驗證與安全模式課程**：位於 `docs/getting-started/authsecurity.md`：
  - 3 種驗證模式（連線字串、Key Vault、Managed Identity）
  - 用於安全部署的完整 Bicep 基礎設施範本
  - 結合 Azure SDK 的 Node.js 應用程式範例
  - 3 個完整練習（啟用 Managed Identity、使用 user-assigned identity、Key Vault 旋轉）
  - 安全最佳實踐與 RBAC 設定
  - 疑難排解指南與成本分析
  - 生產就緒的無密碼驗證模式

- **🤖 多代理協調模式課程**：位於 `docs/pre-deployment/coordination-patterns.md`：
  - 5 種協調模式（序列、平行、分層、事件驅動、共識）
  - 完整的協調器服務實作（Python/Flask，1,500+ 行）
  - 3 個專用代理實作（Research、Writer、Editor）
  - Service Bus 整合用於訊息佇列
  - 使用 Cosmos DB 做分散式系統的狀態管理
  - 6 張展示代理互動的 Mermaid 圖表
  - 3 個進階練習（超時處理、重試邏輯、斷路器）
  - 成本細目（$240-565/月）與最佳化策略
  - Application Insights 整合以進行監控

#### 強化
- **Pre-deployment 章節**：現在包含完整的監控與協調模式
- **Getting Started 章節**：強化專業級驗證模式
- <strong>生產就緒度</strong>：從安全性到可觀測性皆有完整覆蓋
- <strong>課程大綱</strong>：更新以參考第 3 與第 6 章的新課程

#### 變更
- <strong>學習進度</strong>：更好地將安全性與監控整合於整個課程中
- <strong>文件品質</strong>：新課程皆達到一致的 A 級標準（95-97%）
- <strong>生產模式</strong>：針對企業部署提供完整端到端覆蓋

#### 改進
- **Developer Experience**: 從開發到生產監控的清晰路徑
- **Security Standards**: 專業的驗證與機密管理模式
- **Observability**: 與 AZD 完整整合的 Application Insights
- **AI Workloads**: 為 Microsoft Foundry Models 與多代理系統的專門監控

#### Validated
- ✅ 所有課程包含完整可執行程式碼（非摘要）
- ✅ Mermaid 圖表以強化視覺學習（共 19 張，分布於 3 個課程）
- ✅ 實作練習並附驗證步驟（共 9 個）
- ✅ 可透過 `azd up` 部署的生產就緒 Bicep 模板
- ✅ 成本分析與優化策略
- ✅ 疑難排解指南與最佳實務
- ✅ 含驗證指令的知識檢查點

#### Documentation Grading Results
- **docs/pre-deployment/application-insights.md**: - 完整的監控指南
- **docs/getting-started/authsecurity.md**: - 專業的安全模式
- **docs/pre-deployment/coordination-patterns.md**: - 進階多代理架構
- **Overall New Content**: - 一致的高品質標準

#### Technical Implementation
- **Application Insights**: Log Analytics + 自訂遙測 + 分散式追蹤
- **Authentication**: Managed Identity + Key Vault + RBAC 模式
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + 協調
- **Monitoring**: 即時度量 + Kusto 查詢 + 告警 + 儀表板
- **Cost Management**: 取樣策略、保留政策、預算控管

### [v3.7.0] - 2025-11-19

#### Documentation Quality Improvements and New Microsoft Foundry Models Example
**此版本提升了整個資源庫的文件品質，並新增完整的 Microsoft Foundry Models 部署範例，包含 gpt-4.1 聊天介面。**

#### Added
- **🤖 Microsoft Foundry Models Chat Example**: 完整的 gpt-4.1 部署與可運作實作，位於 `examples/azure-openai-chat/`：
  - 完整的 Microsoft Foundry Models 基礎架構（gpt-4.1 model deployment）
  - 具會話歷史記錄的 Python 命令列聊天介面
  - Key Vault 整合以安全儲存 API key
  - 代幣使用追蹤與成本估算
  - 流量限制與錯誤處理
  - 詳盡的 README，部署指南約 35–45 分鐘
  - 11 個生產就緒檔案（Bicep 模板、Python 應用、設定檔）
- **📚 Documentation Exercises**: 在設定指南新增實作練習：
  - 練習 1：多環境設定（15 分鐘）
  - 練習 2：機密管理實作練習（10 分鐘）
  - 清楚的成功準則與驗證步驟
- **✅ Deployment Verification**: 在部署指南新增驗證章節：
  - 健康檢查程序
  - 成功準則檢查表
  - 所有部署指令的預期輸出
  - 疑難排解速查

#### Enhanced
- **examples/README.md**: 更新為 A 等級品質（93%）：
  - 已在所有相關章節新增 azure-openai-chat
  - 本地範例數量由 3 更新為 4
  - 新增至 AI 應用範例表
  - 整合至中階使用者快速上手
  - 新增至 Microsoft Foundry 範本章節
  - 更新比較矩陣與技術評估章節
- **Documentation Quality**: 文件品質提升 B+ (87%) → A- (92%)（docs 資料夾）：
  - 在關鍵指令範例中新增預期輸出
  - 為設定變更加入驗證步驟
  - 透過實作練習強化動手學習

#### Changed
- **Learning Progression**: 更佳整合 AI 範例以服務中階學習者
- **Documentation Structure**: 更具可操作性的練習且結局清晰
- **Verification Process**: 在關鍵工作流程新增明確的成功準則

#### Improved
- **Developer Experience**: Microsoft Foundry Models 部署現今約需 35–45 分鐘（相較於複雜替代方案的 60–90 分鐘）
- **Cost Transparency**: 對於 Microsoft Foundry Models 範例提供明確成本估算（$50–200/月）
- **Learning Path**: AI 開發者有清晰的入門點：azure-openai-chat
- **Documentation Standards**: 預期輸出與驗證步驟一致化

#### Validated
- ✅ Microsoft Foundry Models 範例可透過 `azd up` 完整運作
- ✅ 所有 11 個實作檔案語法正確
- ✅ README 指示與實際部署經驗相符
- ✅ 文件連結已在 8+ 個位置更新
- ✅ 範例索引正確反映 4 個本地範例
- ✅ 表格中無重複外部連結
- ✅ 導覽參考皆正確

#### Technical Implementation
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps 模式
- **Security**: 已準備 Managed Identity，機密存放於 Key Vault
- **Monitoring**: Application Insights 整合
- **Cost Management**: 代幣追蹤與使用優化
- **Deployment**: 單一 `azd up` 指令完成全部設定

### [v3.6.0] - 2025-11-19

#### Major Update: Container App Deployment Examples
**此版本引入完整的生產就緒容器應用部署範例，使用 Azure Developer CLI (AZD)，並包含完整文件與學習流程整合。**

#### Added
- **🚀 Container App Examples**: 新增本地範例於 `examples/container-app/`：
  - [Master Guide](examples/container-app/README.md): 容器化部署的完整概覽、快速上手、上線與進階模式
  - [Simple Flask API](../../examples/container-app/simple-flask-api): 友善初學者的 REST API，支援 scale-to-zero、健康檢查、監控與疑難排解
  - [Microservices Architecture](../../examples/container-app/microservices): 生產就緒的多服務部署（API Gateway、Product、Order、User、Notification）、非同步訊息、Service Bus、Cosmos DB、Azure SQL、分散式追蹤、藍綠/金絲雀部署
- **Best Practices**: 容器化工作負載的安全、監控、成本優化與 CI/CD 指南
- **Code Samples**: 完整的 `azure.yaml`、Bicep 模板與多語言服務實作（Python、Node.js、C#、Go）
- **Testing & Troubleshooting**: 端到端測試情境、監控指令、疑難排解指南

#### Changed
- **README.md**: 更新以呈現並連結新的容器應用範例，置於「Local Examples - Container Applications」
- **examples/README.md**: 更新以強調容器應用範例、新增比較矩陣項目並更新技術/架構參考
- **Course Outline & Study Guide**: 更新以在相關章節參考新的容器應用範例與部署模式

#### Validated
- ✅ 所有新範例可使用 `azd up` 部署並遵循最佳實務
- ✅ 文件交叉連結與導覽已更新
- ✅ 範例涵蓋從初學到進階的情境，包含生產微服務

#### Notes
- **Scope**: 僅限英文文件與範例
- **Next Steps**: 未來版本將擴展更多進階容器模式與 CI/CD 自動化

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**此版本在所有英文文件中全面實施產品名稱變更，將 "Microsoft Foundry" 替換為 "Microsoft Foundry"。**

#### Changed
- **🔄 Product Name Update**: 從 "Microsoft Foundry" 全面改名為 "Microsoft Foundry"
  - 更新 `docs/` 資料夾中所有英文文件的參考
  - 資料夾重新命名：`docs/ai-foundry/` → `docs/microsoft-foundry/`
  - 檔案重新命名：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 共更新 23 處內容參考，分布於 7 個文件

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` 重新命名為 `docs/microsoft-foundry/`
  - 所有交叉參考已更新以反映新資料夾結構
  - 導覽連結已驗證

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 所有內部連結已更新以參照新檔名

#### Updated Files
- **Chapter Documentation** (7 檔):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 更新 3 個導覽連結
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 更新 4 個產品名稱參考
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - 已採用 Microsoft Foundry（自先前更新）
  - `docs/microsoft-foundry/production-ai-practices.md` - 更新 3 個參考（概覽、社群回饋、文件）
  - `docs/getting-started/azd-basics.md` - 更新 4 個交叉參考連結
  - `docs/getting-started/first-project.md` - 更新 2 個章節導覽連結
  - `docs/getting-started/installation.md` - 更新 2 個下一章節連結
  - `docs/troubleshooting/ai-troubleshooting.md` - 更新 3 個參考（導覽、Discord 社群）
  - `docs/troubleshooting/common-issues.md` - 更新 1 個導覽連結
  - `docs/troubleshooting/debugging.md` - 更新 1 個導覽連結

- **Course Structure Files** (2 檔):
  - `README.md` - 更新 17 處參考（課程概覽、章節標題、範本章節、社群見解）
  - `course-outline.md` - 更新 14 處參考（概覽、學習目標、章節資源）

#### Validated
- ✅ 英文文件中已無遺留的 "ai-foundry" 資料夾路徑參考
- ✅ 英文文件中已無遺留的 "Microsoft Foundry" 產品名稱參考
- ✅ 所有導覽連結在新資料夾結構下可正常運作
- ✅ 檔案與資料夾重命名已成功完成
- ✅ 章節間的交叉參考已驗證

#### Notes
- **Scope**: 變更僅套用於 `docs/` 資料夾中的英文文件
- **Translations**: 翻譯資料夾（`translations/`）在此版本未更新
- **Workshop**: 工作坊教材（`workshop/`）在此版本未更新
- **Examples**: 範例檔案可能仍引用舊有命名（將於未來更新處理）
- **External Links**: 外部 URL 與 GitHub 倉儲參考維持不變

#### Migration Guide for Contributors
If you have local branches or documentation referencing the old structure:
1. Update folder references: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update file references: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Replace product name: "Microsoft Foundry" → "Microsoft Foundry"
4. Validate all internal documentation links still work

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**此版本引入對全新 Azure Developer CLI 預覽功能的完整支援，並改善工作坊使用者體驗。**

#### Added
- **🧪 azd provision --preview Feature Documentation**: 全面說明這項基礎設施預覽功能
  - 指令參考與使用範例收錄於備忘單
  - 在佈建指南中詳細整合使用情境與優點
  - 與預檢（pre-flight check）整合，以利更安全的部署驗證
  - 在入門指南中更新以強調安全為先的部署實務
- **🚧 Workshop Status Banner**: 專業的 HTML 橫幅以顯示工作坊開發狀態
  - 漸層設計與施工指示，清楚傳達使用者資訊
  - 顯示最後更新時間以維持透明度
  - 支援行動裝置響應式設計，適用於各種裝置

#### Enhanced
- **Infrastructure Safety**: 預覽功能已整合至整體部署文件
- **Pre-deployment Validation**: 自動化腳本現包含基礎設施預覽測試
- **Developer Workflow**: 已將預覽納入建議的指令序列
- **Workshop Experience**: 為使用者設定清楚的內容開發狀態期望

#### Changed
- **Deployment Best Practices**: 建議採用以預覽為先的工作流程
- **Documentation Flow**: 將基礎設施驗證提早納入學習流程
- **Workshop Presentation**: 以專業方式傳達開發狀態與時間表

#### Improved
- **Safety-First Approach**: 現可在部署前驗證基礎設施變更
- **Team Collaboration**: 可分享預覽結果以供審核與批准
- **Cost Awareness**: 在佈建前更清楚了解資源成本
- **Risk Mitigation**: 透過提前驗證降低部署失敗風險

#### Technical Implementation
- **Multi-document Integration**: 預覽功能已在 4 個關鍵檔案中說明
- **Command Patterns**: 文件中語法與範例一致
- **Best Practice Integration**: 預覽納入驗證工作流程與腳本
- **Visual Indicators**: 新功能標示清楚以利發現

#### Workshop Infrastructure
- **Status Communication**: 使用帶漸層樣式的專業 HTML 橫幅顯示狀態
- **User Experience**: 清楚的開發狀態可避免混淆
- **Professional Presentation**: 在設定預期的同時維持資源庫的可信度
- **Timeline Transparency**: October 2025 最後更新時間以示負責

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**此版本推出完整的工作坊教材，包含瀏覽器互動式指南與結構化學習路徑。**

#### Added
- **🎥 互動式工作坊指南**: 基於瀏覽器的工作坊體驗，具備 MkDocs 預覽功能
- **📝 結構化工作坊指引**: 從探索到自訂的 7 步導覽學習路徑
  - 0-Introduction: 工作坊概覽與設定
  - 1-Select-AI-Template: 範本探索與選擇流程
  - 2-Validate-AI-Template: 部署與驗證程序
  - 3-Deconstruct-AI-Template: 理解範本架構
  - 4-Configure-AI-Template: 設定與自訂
  - 5-Customize-AI-Template: 進階修改與反覆優化
  - 6-Teardown-Infrastructure: 資源清理與管理
  - 7-Wrap-up: 摘要與後續步驟
- **🛠️ 工作坊工具**: 使用 Material 主題的 MkDocs 設定以提升學習體驗
- **🎯 實作學習路徑**: 3 步驟方法 (探索 → 部署 → 自訂)
- **📱 GitHub Codespaces 整合**: 無縫的開發環境設定

#### 增強
- **AI 工作坊實驗室**: 延伸為完整 2-3 小時的結構化學習體驗
- <strong>工作坊文件</strong>: 專業呈現，包含導覽與視覺輔助
- <strong>學習進程</strong>: 從範本選擇到生產部署的清晰逐步指引
- <strong>開發人員體驗</strong>: 整合工具以精簡開發工作流程

#### 改進
- <strong>可存取性</strong>: 具搜尋、複製功能與主題切換的瀏覽器介面
- <strong>自我節奏學習</strong>: 彈性的工作坊結構，適應不同學習速度
- <strong>實務應用</strong>: 真實世界的 AI 範本部署情境
- <strong>社群整合</strong>: 透過 Discord 提供工作坊支援與協作

#### 工作坊特色
- <strong>內建搜尋</strong>: 快速關鍵字與課程搜尋
- <strong>複製程式碼區塊</strong>: 所有程式範例支援滑鼠懸停複製功能
- <strong>主題切換</strong>: 支援深色/淺色模式以符合偏好
- <strong>視覺資產</strong>: 提供截圖與圖示以加強理解
- <strong>協助整合</strong>: 提供直接的 Discord 社群支援

### [v3.2.0] - 2025-09-17

#### 主要導覽重構與章節式學習系統
**此版本於整個倉庫中導入全面性的章節式學習結構並強化導覽功能。**

#### 新增
- **📚 章節式學習系統**: 將整個課程重構為 8 個漸進式學習章節
  - 第 1 章：基礎與快速開始 (⭐ - 30-45 分鐘)
  - 第 2 章：以 AI 為先的開發 (⭐⭐ - 1-2 小時)
  - 第 3 章：設定與認證 (⭐⭐ - 45-60 分鐘)
  - 第 4 章：基礎架構即程式碼與部署 (⭐⭐⭐ - 1-1.5 小時)
  - 第 5 章：多代理人 AI 解決方案 (⭐⭐⭐⭐ - 2-3 小時)
  - 第 6 章：部署前驗證與規劃 (⭐⭐ - 1 小時)
  - 第 7 章：疑難排解與偵錯 (⭐⭐ - 1-1.5 小時)
  - 第 8 章：生產與企業模式 (⭐⭐⭐⭐ - 2-3 小時)
- **📚 綜合導覽系統**: 在所有文件中採用一致的導覽頁首與頁尾
- **🎯 進度追蹤**: 課程完成檢查清單與學習驗證系統
- **🗺️ 學習路徑指引**: 為不同經驗層級與目標提供清晰的入門點
- **🔗 交叉參考導覽**: 清楚連結相關章節與先決條件

#### 增強
- **README 結構**: 轉變為具有章節式組織的結構化學習平台
- <strong>文件導覽</strong>: 每頁現包含章節上下文與進度指引
- <strong>範本組織</strong>: 範例與範本對應到適合的學習章節
- <strong>資源整合</strong>: 備忘單、常見問答與學習指南連結到相關章節
- <strong>工作坊整合</strong>: 實作實驗室對應至多個章節的學習目標

#### 變更
- <strong>學習進程</strong>: 從線性文件轉為彈性的章節式學習
- <strong>設定指南位置</strong>: 將設定指南調整為第 3 章以改善學習流程
- **AI 內容整合**: 在整個學習歷程中更好地整合 AI 專屬內容
- <strong>生產內容</strong>: 進階模式在第 8 章為企業學習者整合

#### 改進
- <strong>使用者體驗</strong>: 清楚的導覽路徑與章節進度指示
- <strong>無障礙</strong>: 一致的導覽模式以便於課程瀏覽
- <strong>專業呈現</strong>: 大學式課程結構，適合學術與企業訓練
- <strong>學習效率</strong>: 透過改進組織減少尋找相關內容的時間

#### 技術實作
- <strong>導航頁首</strong>: 在 40+ 文件中標準化章節導覽
- <strong>頁尾導覽</strong>: 一致的進度指引與章節完成指示
- <strong>交叉連結</strong>: 全面的內部連結系統連接相關概念
- <strong>章節映射</strong>: 範本與範例清楚關聯到學習目標

#### 學習指南強化
- **📚 全面學習目標**: 重構學習指南以配合 8 章系統
- **🎯 章節式評量**: 每章包含特定學習目標與實作練習
- **📋 進度追蹤**: 每週學習時程，具可衡量成果與完成清單
- **❓ 評量問題**: 每章的知識驗證題目，具有專業成果
- **🛠️ 實務練習**: 具真實部署情境與疑難排解的實作活動
- **📊 技能進展**: 從基本概念到企業模式的清晰進階，注重職涯發展
- **🎓 認證框架**: 專業發展成果與社群認可系統
- **⏱️ 時程管理**: 具里程碑驗證的結構化 10 週學習計畫

### [v3.1.0] - 2025-09-17

#### 增強的多代理人 AI 解決方案
**此版本透過更佳的代理人命名與強化文件改善了多代理人零售解決方案。**

#### 變更
- <strong>多代理人術語</strong>: 在整個零售多代理人解決方案中，將 "Cora agent" 替換為 "Customer agent"，以提升清晰度
- <strong>代理人架構</strong>: 更新所有文件、ARM 範本與程式範例以一致使用 "Customer agent" 命名
- <strong>設定範例</strong>: 以更新命名慣例現代化代理人設定模式
- <strong>文件一致性</strong>: 確保所有參考使用專業、具描述性的代理人名稱

#### 增強
- **ARM 範本套件**: 在 retail-multiagent-arm-template 中更新 Customer agent 的參考
- <strong>架構圖</strong>: 以更新後的代理人命名刷新 Mermaid 圖表
- <strong>程式範例</strong>: Python 類別與實作範例現在使用 CustomerAgent 命名
- <strong>環境變數</strong>: 更新所有部署腳本以使用 CUSTOMER_AGENT_NAME 慣例

#### 改進
- <strong>開發者體驗</strong>: 文件中代理人角色與責任更清晰
- <strong>生產準備度</strong>: 與企業命名慣例有更好的一致性
- <strong>學習教材</strong>: 為教學目的提供更直觀的代理人命名
- <strong>範本可用性</strong>: 簡化代理人功能與部署模式的理解

#### 技術細節
- 更新了帶有 CustomerAgent 參考的 Mermaid 架構圖
- 在 Python 範例中，將 CoraAgent 類別名稱替換為 CustomerAgent
- 修改 ARM 範本 JSON 設定以使用 "customer" 代理人類型
- 將環境變數從 CORA_AGENT_* 更新為 CUSTOMER_AGENT_* 模式
- 刷新所有部署命令與容器設定

### [v3.0.0] - 2025-09-12

#### 重大變更 - AI 開發者重點與 Microsoft Foundry 整合
**此版本將倉庫轉型為一個完整的以 AI 為中心的學習資源，並整合 Microsoft Foundry。**

#### 新增
- **🤖 以 AI 為先的學習路徑**: 完整重構，優先針對 AI 開發者與工程師
- **Microsoft Foundry 整合指南**: 連接 AZD 與 Microsoft Foundry 服務的完整文件
- **AI 模型部署模式**: 涵蓋模型選擇、設定與生產部署策略的詳細指南
- **AI 工作坊實驗室**: 2-3 小時的實作工作坊，將 AI 應用轉換為可由 AZD 部署的解決方案
- **生產 AI 最佳實務**: 適合企業的擴展、監控與保護 AI 工作負載的模式
- **AI 專屬疑難排解指南**: 針對 Microsoft Foundry Models、Cognitive Services 與 AI 部署問題的全面排解
- **AI 範本庫**: 精選 Microsoft Foundry 範本集並附複雜度評級
- <strong>工作坊教材</strong>: 完整的工作坊結構，包含實作實驗室與參考資料

#### 增強
- **README 結構**: 以 AI 開發者為中心，並包含來自 Microsoft Foundry Discord 的 45% 社群興趣資料
- <strong>學習路徑</strong>: 為 AI 開發者設計的專屬旅程，並與學生及 DevOps 工程師的傳統路徑並存
- <strong>範本推薦</strong>: 精選 AI 範本，包括 azure-search-openai-demo、contoso-chat 與 openai-chat-app-quickstart
- <strong>社群整合</strong>: 強化的 Discord 社群支援，包含 AI 專用頻道與討論

#### 安全與生產重點
- <strong>託管身份模式</strong>: AI 專屬的驗證與安全設定
- <strong>成本優化</strong>: AI 工作負載的 token 使用追蹤與預算控管
- <strong>多區域部署</strong>: 全球 AI 應用部署策略
- <strong>效能監控</strong>: AI 專屬指標與 Application Insights 整合

#### 文件品質
- <strong>線性課程結構</strong>: 從初學到進階 AI 部署模式的邏輯進展
- **已驗證的 URL**: 所有外部倉庫連結皆已驗證且可存取
- <strong>完整參考</strong>: 所有內部文件連結已驗證並可使用
- <strong>生產就緒</strong>: 具真實範例的企業部署模式

### [v2.0.0] - 2025-09-09

#### 重大變更 - 倉庫重組與專業化強化
**此版本代表倉庫結構與內容呈現的重大改版。**

#### 新增
- <strong>結構化學習框架</strong>: 所有文件頁面現在包含介紹、學習目標與學習成果章節
- <strong>導覽系統</strong>: 在所有文件中新增上一/下一課連結以引導學習進程
- <strong>學習指南</strong>: 包含學習目標、實作練習與評估材料的完整 study-guide.md
- <strong>專業呈現</strong>: 移除所有表情符號以提升無障礙性與專業外觀
- <strong>強化內容結構</strong>: 改進學習材料的組織與流程

#### 變更
- <strong>文件格式</strong>: 以一致的學習導向結構標準化所有文件
- <strong>導覽流程</strong>: 在所有學習材料中實施邏輯性進展
- <strong>內容呈現</strong>: 移除裝飾性元素，改以清晰、專業的格式
- <strong>連結結構</strong>: 更新所有內部連結以支援新的導覽系統

#### 改進
- <strong>無障礙</strong>: 移除表情符號依賴以改善螢幕閱讀器相容性
- <strong>專業外觀</strong>: 乾淨、學術式的呈現，適合企業學習
- <strong>學習體驗</strong>: 結構化方法為每課提供清晰的目標與成果
- <strong>內容組織</strong>: 更佳的邏輯流程與相關主題間的連結

### [v1.0.0] - 2025-09-09

#### 初始發布 - 完整的 AZD 學習倉庫

#### 新增
- <strong>核心文件結構</strong>
  - 完整的入門指南系列
  - 完整的部署與佈建文件
  - 詳細的疑難排解資源與偵錯指南
  - 部署前驗證工具與程序

- <strong>入門模組</strong>
  - AZD 基礎：核心概念與術語
  - 安裝指南：平台特定的設定說明
  - 設定指南：環境設定與驗證
  - 第一個專案教學：逐步實作學習

- <strong>部署與佈建模組</strong>
  - 部署指南：完整工作流程文件
  - 佈建指南：使用 Bicep 的基礎架構即程式碼
  - 生產部署最佳實務
  - 多服務架構模式

- <strong>部署前驗證模組</strong>
  - 容量規劃：Azure 資源可用性驗證
  - SKU 選擇：完整的服務層級指南
  - 預檢查：自動化驗證腳本（PowerShell 與 Bash）
  - 成本估算與預算規劃工具

- <strong>疑難排解模組</strong>
  - 常見問題：常遇到的問題與解決方案
  - 偵錯指南：系統化的疑難排解方法
  - 進階診斷技術與工具
  - 效能監控與優化

- <strong>資源與參考</strong>
  - 指令速查表：常用指令快速參考
  - 術語表：完整的術語與縮寫定義
  - 常見問題：對常見疑問的詳細回答
  - 外部資源連結與社群連結

- <strong>範例與範本</strong>
  - 簡單的網頁應用範例
  - 靜態網站部署範本
  - 容器應用設定
  - 資料庫整合模式
  - 微服務架構範例
  - 無伺服器函式實作

#### 功能
- <strong>跨平台支援</strong>: 提供 Windows、macOS 與 Linux 的安裝與設定指南
- <strong>多層級技能</strong>: 內容從學生到專業開發者皆適用
- <strong>實務導向</strong>: 實作範例與真實情境
- <strong>完整涵蓋</strong>: 從基礎概念到進階企業模式
- <strong>安全優先方法</strong>: 在整體中整合安全最佳實務
- <strong>成本優化</strong>: 提供經濟部署與資源管理的指引

#### 文件品質
- <strong>詳細程式範例</strong>: 實用且經測試的程式範例
- <strong>逐步指示</strong>: 清晰且可執行的指導
- <strong>完整錯誤處理</strong>: 針對常見問題的疑難排解
- <strong>最佳實務整合</strong>: 產業標準與建議
- <strong>版本相容性</strong>: 與最新 Azure 服務與 azd 功能保持一致

## 計畫中的未來增強功能

### 版本 3.1.0（計畫中）
#### AI 平台擴展
- <strong>多模型支援</strong>: 與 Hugging Face、Azure Machine Learning 及自訂模型的整合模式
- **AI 代理框架**: LangChain、Semantic Kernel 與 AutoGen 部署的範本
- **進階 RAG 模式**: Azure AI Search 之外的向量資料庫選項（Pinecone、Weaviate 等）
- **AI 可觀測性**: 強化模型效能、代幣使用量與回應品質的監控

#### 開發者體驗
- **VS Code 延伸套件**: 整合 AZD + Microsoft Foundry 的開發體驗
- **GitHub Copilot 整合**: AI 協助的 AZD 範本產生
- <strong>互動式教學</strong>: 針對 AI 情境的實作練習，搭配自動化驗證
- <strong>影片內容</strong>: 針對視覺學習者、聚焦 AI 部署的補充影片教學

### 版本 4.0.0（規劃中）
#### 企業級 AI 模式
- <strong>治理框架</strong>: AI 模型治理、合規與稽核追蹤
- **多租戶 AI**: 為多客戶提供隔離 AI 服務的模式
- **邊緣 AI 部署**: 與 Azure IoT Edge 及容器實例的整合
- **混合雲 AI**: AI 工作負載的多雲與混合部署模式

#### 進階功能
- **AI 管道自動化**: 與 Azure Machine Learning 管線的 MLOps 整合
- <strong>進階安全性</strong>: 零信任模式、私人端點與進階威脅防護
- <strong>效能優化</strong>: 高吞吐量 AI 應用的進階調校與擴充策略
- <strong>全球分佈</strong>: AI 應用的內容傳遞與邊緣快取模式

### 版本 3.0.0（規劃中） - 已由目前版本取代
#### 建議新增項目 - 現已於 v3.0.0 實作
- ✅ **以 AI 為重點的內容**: 完整的 Microsoft Foundry 整合（已完成）
- ✅ <strong>互動式教學</strong>: 實作型 AI 工作坊實驗室（已完成）
- ✅ <strong>進階安全模組</strong>: AI 專屬的安全模式（已完成）
- ✅ <strong>效能優化</strong>: AI 工作負載調校策略（已完成）

### 版本 2.1.0（規劃中） - 部分於 v3.0.0 實作
#### 小幅增強 - 部分已在當前版本完成
- ✅ <strong>新增範例</strong>: 以 AI 為重點的部署情境（已完成）
- ✅ <strong>延伸常見問題</strong>: AI 特定問題與疑難排解（已完成）
- <strong>工具整合</strong>: 加強的 IDE 與編輯器整合指南
- ✅ <strong>監控擴充</strong>: AI 專屬的監控與警示模式（已完成）

#### 仍規劃於未來版本
- <strong>行動友善文件</strong>: 為行動學習設計的響應式版面
- <strong>離線存取</strong>: 可下載的文件套件
- **增強的 IDE 整合**: 適用於 AZD + AI 工作流程的 VS Code 延伸套件
- <strong>社群儀表板</strong>: 即時社群指標與貢獻追蹤

## 貢獻至變更紀錄

### 報告變更
當您對此倉儲做出貢獻時，請確保變更紀錄條目包含：

1. <strong>版本號</strong>: 遵循語義版本（major.minor.patch）
2. <strong>日期</strong>: 以 YYYY-MM-DD 格式的發布或更新日期
3. <strong>類別</strong>: Added、Changed、Deprecated、Removed、Fixed、Security
4. <strong>清楚描述</strong>: 簡潔說明變更內容
5. <strong>影響評估</strong>: 變更如何影響現有使用者

### 變更類別

#### 已新增
- 新功能、文件章節或功能能力
- 新範例、範本或學習資源
- 額外工具、腳本或實用程式

#### 已變更
- 對現有功能或文件的修改
- 改善清晰度或準確性的更新
- 內容或組織的重構

#### 已棄用
- 正在逐步淘汰的功能或方法
- 計畫移除的文件章節
- 有更佳替代方案的方法

#### 已移除
- 不再相關的功能、文件或範例
- 過時資訊或已棄用的方法
- 冗餘或已整合的內容

#### 已修正
- 文件或程式碼錯誤的修正
- 已回報問題或故障的解決
- 提升準確性或功能性的改進

#### 安全性
- 與安全性相關的改善或修補
- 安全最佳實務的更新
- 修補安全性弱點

### 語義版本指南

#### 主要版本 (X.0.0)
- 需要使用者採取行動的破壞性變更
- 內容或組織的重大重構
- 改變基本方法或方法論的變更

#### 次要版本 (X.Y.0)
- 新功能或內容新增
- 保持向下相容的增強
- 額外範例、工具或資源

#### 修補版本 (X.Y.Z)
- 錯誤修正與修補
- 對現有內容的小幅改進
- 澄清與小幅增強

## 社群回饋與建議

我們積極鼓勵社群回饋，以改善這份學習資源：

### 如何提供回饋
- **GitHub Issues**: 回報問題或建議改進（歡迎 AI 相關議題）
- **Discord 討論**: 分享想法並與 Microsoft Foundry 社群互動
- **Pull Requests**: 直接對內容進行改進，特別是 AI 範本與指南
- **Microsoft Foundry Discord**: 參與 #Azure 頻道討論 AZD + AI
- <strong>社群論壇</strong>: 參與更廣泛的 Azure 開發者討論

### 回饋類別
- **AI 內容準確性**: 修正 AI 服務整合與部署資訊
- <strong>學習體驗</strong>: 提升 AI 開發者學習流程的建議
- **缺少的 AI 內容**: 請求新增 AI 範本、模式或範例
- <strong>無障礙</strong>: 改善以因應多元學習需求
- **AI 工具整合**: 改善 AI 開發工作流程整合的建議
- **生產環境 AI 模式**: 企業 AI 部署模式請求

### 回應承諾
- <strong>議題回應</strong>: 在 48 小時內回應已回報的問題
- <strong>功能請求</strong>: 一週內評估
- <strong>社群貢獻</strong>: 一週內審查
- <strong>安全性議題</strong>: 優先處理並加速回應

## 維護時程

### 定期更新
- <strong>每月檢視</strong>: 內容準確性與連結驗證
- <strong>每季更新</strong>: 主要內容新增與改進
- <strong>半年檢視</strong>: 全面性重構與強化
- <strong>年度發布</strong>: 帶有重大改進的主要版本更新

### 監控與品質保證
- <strong>自動化測試</strong>: 定期驗證程式範例與連結
- <strong>社群回饋整合</strong>: 定期納入使用者建議
- <strong>技術更新</strong>: 與最新 Azure 服務及 azd 發行同步
- <strong>無障礙稽核</strong>: 定期檢視包容性設計原則

## 版本支援政策

### 目前版本支援
- <strong>最新主要版本</strong>: 提供完整支援與定期更新
- <strong>先前主要版本</strong>: 提供 12 個月的安全更新與重大修補
- <strong>舊版</strong>: 僅社群支援，無官方更新

### 遷移指引
當主要版本發布時，我們提供：
- <strong>遷移指南</strong>: 逐步轉換指示
- <strong>相容性說明</strong>: 關於破壞性變更的細節
- <strong>工具支援</strong>: 協助遷移的腳本或實用工具
- <strong>社群支援</strong>: 專門的論壇解答遷移相關問題

---

<strong>導覽</strong>
- <strong>前一課程</strong>: [學習指南](resources/study-guide.md)
- <strong>下一課程</strong>: 返回至 [主 README](README.md)

<strong>保持更新</strong>: 監視此倉儲以接收關於新版本與學習教材重要更新的通知。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**:
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不準確之處。原始語言的文件應視為具權威性的來源。對於重要資訊，建議採用專業人工翻譯。我們不就因使用本翻譯而產生的任何誤解或誤譯負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->