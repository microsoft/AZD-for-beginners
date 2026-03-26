# 更新日誌 - AZD 初學者指南

## 介紹

本更新日誌記錄 AZD 初學者指南倉庫的所有顯著變更、更新和改進。我們遵循語義化版本控制原則，並維護此日誌以幫助用戶了解版本間的變化。

## 學習目標

透過檢視此更新日誌，您將能夠：
- 瞭解新增功能與內容擴充
- 理解現有文件的改進點
- 跟蹤錯誤修正以確保準確性
- 追蹤學習材料的發展過程

## 學習成果

在檢視更新日誌條目後，您將能夠：
- 辨識可用的新內容和資源
- 了解哪些章節已更新或改進
- 根據最新材料規劃您的學習路線
- 提供反饋和建議以促進未來改進

## 版本歷史

### [v3.18.0] - 2026-03-16

#### AZD AI CLI 指令、內容驗證與範本擴充
**此版本在所有與 AI 相關章節中，新增了 `azd ai`、`azd extension` 與 `azd mcp` 指令的涵蓋範圍，修正了 agents.md 中的壞鏈結和過時程式碼，更新了速查表，並徹底翻新了範例範本章節，加入經驗證的描述與新的 Azure AI AZD 範本。**

#### 新增
- <strong>🤖 AZD AI CLI 涵蓋範圍</strong>涵蓋 7 個檔案（先前僅限第 8 章）：
  - `docs/chapter-01-foundation/azd-basics.md` — 新增「擴展與 AI 指令」章節，介紹 `azd extension`、`azd ai agent init` 和 `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — 選項 4：`azd ai agent init`，附帶範本與清單比對表
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — 「Foundry 的 AZD 擴展」與「代理先部署」小節
  - `docs/chapter-05-multi-agent/README.md` — 快速入門示範範本與清單兩種部署路徑
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — 部署部分新增 `azd ai agent init` 選項
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — 「AZD AI 擴展指令用於診斷」小節
  - `resources/cheat-sheet.md` — 新增「AI 與擴展指令」章節，涵蓋 `azd extension`、`azd ai agent init`、`azd mcp` 與 `azd infra generate`
- <strong>📦 新增 AZD AI 範例範本</strong>於 `microsoft-foundry-integration.md`：
  - **azure-search-openai-demo-csharp** — 使用 Blazor WebAssembly、Semantic Kernel 和語音聊天支援的 .NET RAG 聊天
  - **azure-search-openai-demo-java** — 使用 Langchain4J 的 Java RAG 聊天，支援 ACA/AKS 部署選項
  - **contoso-creative-writer** — 多代理創作寫作應用，利用 Azure AI Agent Service、Bing Grounding 與 Prompty
  - **serverless-chat-langchainjs** — 免伺服器架構的 RAG，使用 Azure Functions + LangChain.js + Cosmos DB，且支援 Ollama 的本地開發
  - **chat-with-your-data-solution-accelerator** — 企業級 RAG 加速器，內含管理門戶、Teams 整合及 PostgreSQL / Cosmos DB 選項
  - **azure-ai-travel-agents** — 多代理 MCP 編排參考應用，伺服器端支援 .NET、Python、Java 與 TypeScript
  - **azd-ai-starter** — 精簡版 Azure AI 基礎設施 Bicep 起始範本
  - **🔗 超讚 AZD AI 展示集連結** — 引用 [awesome-azd AI 展示集](https://azure.github.io/awesome-azd/?tags=ai)（80+ 範本）
  
#### 修正
- **🔗 agents.md 導航**：上一頁/下一頁連結現與第 2 章 README 課程順序相符（Microsoft Foundry Integration → Agents → AI Model Deployment）
- **🔗 agents.md 壞鏈結**：將 `production-ai-practices.md` 修正為 `../chapter-08-production/production-ai-practices.md`（共 3 處）
- **📦 agents.md 過時程式碼**：用 `azure-monitor-opentelemetry` + OpenTelemetry SDK 取代 `opencensus`
- **🐛 agents.md 無效 API**：將 `max_tokens` 從 `create_agent()` 移至 `create_run()` 改為 `max_completion_tokens`
- **🔢 agents.md 令牌計數**：用 `tiktoken.encoding_for_model()` 取代粗略的 `len//4` 估算
- **azure-search-openai-demo**：修正服務由「Cognitive Search + App Service」改為「Azure AI Search + Azure Container Apps」（2024 年 10 月起預設主機更變）
- **contoso-chat**：描述更新，參考 Azure AI Foundry + Prompty，與實際倉庫標題及技術棧相符

#### 移除
- **ai-document-processing**：移除不可用的範本引用（該倉庫尚未公開為 AZD 範本）

#### 改進
- **📝 agents.md 練習題**：練習 1 新增預期輸出與 `azd monitor` 步驟；練習 2 完整 `FunctionTool` 註冊程式碼；練習 3 用確切 `prepdocs.py` 指令替代模糊引導
- **📚 agents.md 資源**：文件連結更新為最新 Azure AI Agent Service 文件與快速入門
- **📋 agents.md 下一步表格**：新增 AI 工作坊實驗室連結，涵蓋完整章節範圍

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

#### 課程導航優化
**此版本提升 README.md 章節的導航，改用增強表格格式。**

#### 變更
- <strong>課程地圖表格</strong>：新增直接課程連結、預估時長與難度評級
- <strong>資料夾清理</strong>：移除多餘舊資料夾（deployment/、getting-started/、pre-deployment/、troubleshooting/）
- <strong>連結驗證</strong>：課程地圖中 21+ 個內部鏈結皆已驗證

### [v3.16.0] - 2026-02-05

#### 產品名稱更新
**此版本將產品參考更新為最新微軟品牌名稱。**

#### 變更
- **Microsoft Foundry → Microsoft Foundry**：所有非翻譯檔案中的相關引用皆已更新
- **Azure AI Agent Service → Foundry Agents**：服務名稱更新以符合品牌現況

#### 更新檔案
- `README.md` - 主要課程首頁
- `changelog.md` - 版本歷史
- `course-outline.md` - 課程架構
- `docs/chapter-02-ai-development/agents.md` - AI 代理指導文件
- `examples/README.md` - 範例文件
- `workshop/README.md` - 工作坊首頁
- `workshop/docs/index.md` - 工作坊索引
- `workshop/docs/instructions/*.md` - 所有工作坊指令文件

---

### [v3.15.0] - 2026-02-05

#### 重大倉庫重構：章節為單位的資料夾命名
**此版本將文件重構為專屬章節資料夾，以利更清晰的導航。**

#### 資料夾重命名
舊資料夾已被章節編號資料夾取代：
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- 新增：`docs/chapter-05-multi-agent/`

#### 檔案搬遷
| 檔案 | 來源 | 目標 |
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
- **📚 章節 README 檔案**：在各章節資料夾中建立 README.md，內容包括：
  - 學習目標和預估時長
  - 課程表與描述
  - 快速開始指令
  - 其他章節導航連結

#### 變更
- **🔗 更新所有內部連結**：超過 78 個路徑在所有文件中更新
- **🗺️ 主要 README.md**：更新課程地圖為新的章節結構
- **📝 examples/README.md**：更新跨章節引用路徑

#### 移除
- 舊的資料夾結構（getting-started/、microsoft-foundry/、deployment/、pre-deployment/、troubleshooting/、ai-foundry/）

---

### [v3.14.0] - 2026-02-05

#### 倉庫重構：章節導航
**此版本新增章節導航 README 文件（後被 v3.15.0 取代）。**

---

### [v3.13.0] - 2026-02-05

#### 新增 AI 代理指南
**此版本新增使用 Azure Developer CLI 部署 AI 代理的完整指南。**

#### 新增
- **🤖 docs/microsoft-foundry/agents.md**：完整指南涵蓋：
  - AI 代理的定義及與聊天機器人的差異
  - 三個快速啟動代理範本（Foundry Agents、Prompty、RAG）
  - 代理架構模式（單代理、RAG、多代理）
  - 工具配置及自訂
  - 監控及指標追蹤
  - 成本考量與優化
  - 常見故障排除情境
  - 三個實作練習與成功標準

#### 內容架構
- <strong>介紹</strong>：針對初學者的代理概念
- <strong>快速開始</strong>：使用 `azd init --template get-started-with-ai-agents` 部署代理
- <strong>架構模式</strong>：代理模式視覺化圖解
- <strong>配置</strong>：工具設定與環境變數
- <strong>監控</strong>：Application Insights 整合
- <strong>練習</strong>：分階段的實作學習（每項約 20-45 分鐘）

---

### [v3.12.0] - 2026-02-05

#### DevContainer 環境更新
**此版本更新開發容器配置，採用現代工具與更佳預設，改善 AZD 學習體驗。**

#### 變更
- **🐳 基底映像**：由 `python:3.12-bullseye` 更新為 `python:3.12-bookworm`（最新 Debian 穩定版）
- **📛 容器名稱**：由「Python 3」更名為「AZD for Beginners」，更具識別性

#### 新增
- **🔧 新開發容器功能**：
  - 啟用 Bicep 支援的 `azure-cli`
  - 用於 AZD 範本的 `node:20`（LTS 版本）
  - 用於範本管理的 `github-cli`
  - 用於容器應用部署的 `docker-in-docker`

- **🔌 端口轉發**：預先配置常用開發端口：
  - 8000（MkDocs 預覽）
  - 3000（Web 應用）
  - 5000（Python Flask）
  - 8080（API）

- **🧩 新增 VS Code 擴充套件**：
  - `ms-python.vscode-pylance` - 強化 Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions 支援
  - `ms-azuretools.vscode-docker` - Docker 支援
  - `ms-azuretools.vscode-bicep` - Bicep 語言支援
  - `ms-azure-devtools.azure-resource-groups` - Azure 資源管理
  - `yzhang.markdown-all-in-one` - Markdown 編輯
  - `DavidAnson.vscode-markdownlint` - Markdown 程式碼風格檢查
  - `bierner.markdown-mermaid` - Mermaid 圖表支援
  - `redhat.vscode-yaml` - YAML 支援（用於 azure.yaml）
  - `eamodio.gitlens` - Git 視覺化
  - `mhutchie.git-graph` - Git 紀錄

- **⚙️ VS Code 設定**：新增 Python 直譯器預設設定、儲存自動格式化與空白字元修剪

- **📦 更新 requirements-dev.txt**：
  - 新增 MkDocs 的 minify 外掛
  - 新增 pre-commit 以提升程式碼品質
  - 新增 Azure SDK 套件（azure-identity、azure-mgmt-resource）

#### 修正
- <strong>建立後指令</strong>：現在會在容器啟動時驗證 AZD 與 Azure CLI 是否已安裝

---

### [v3.11.0] - 2026-02-05

#### 初學者友善 README 大翻新
**此版本大幅提升 README.md 的親和力，讓新手更易上手，並加入 AI 開發者必備資源。**

#### 新增
- **🆚 Azure CLI 與 AZD 比較**：清楚說明何時使用各工具並附實例
- **🌟 精選 AZD 連結**：社群範本畫廊與貢獻相關資源直達鏈結：
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ 即用範本
  - [提交範本](https://github.com/Azure/awesome-azd/issues) - 社群貢獻
- **🎯 快速開始指南**：簡化為三步驟入門（安裝 → 登入 → 部署）
- **📊 根據經驗的導覽表**：依開發者經驗清晰指引起步位置

#### 變更
- **README 結構**：重新組織以逐步揭露資訊，優先關鍵內容
- <strong>介紹章節</strong>：重寫說明「`azd up` 的魔法」以服務完全新手
- <strong>刪除重複內容</strong>：移除重複的故障排除章節
- <strong>故障排除指令</strong>：修正 `azd logs` 為正確的 `azd monitor --logs`

#### 修正
- **🔐 認證指令**：於 cheat-sheet.md 中加入 `azd auth login` 與 `azd auth logout`
- <strong>無效指令引用</strong>：從 README 的故障排除中移除所有剩餘的 `azd logs`

#### 備註
- <strong>範圍</strong>：修改應用於主 README.md 與 resources/cheat-sheet.md
- <strong>目標對象</strong>：專為 AZD 初學開發者改進

---

### [v3.10.0] - 2026-02-05

#### Azure 開發者 CLI 指令準確性更新
**此版本修正文件中所有不存在的 AZD 指令，確保所有範例皆使用有效正確的 Azure 開發者 CLI 語法。**

#### 修正
- **🔧 移除不存在的 AZD 指令**：全面稽核並修正無效指令：
  - `azd logs`（不存在）→ 替換為 `azd monitor --logs` 或 Azure CLI 替代指令
  - `azd service` 子指令（不存在）→ 替換為 `azd show` 與 Azure CLI
  - `azd infra import/export/validate`（不存在）→ 移除或以有效替代方案替換
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` 標記（不存在）→ 移除
  - `azd provision --what-if/--rollback` 標記（不存在）→ 更新為 `--preview`
  - `azd config validate`（不存在）→ 替換為 `azd config list`
  - `azd info`、`azd history`、`azd metrics`（不存在）→ 移除

- **📚 指令修正相關檔案**：
  - `resources/cheat-sheet.md`：指令參考大幅更新
  - `docs/deployment/deployment-guide.md`：修正回滾與部署策略
  - `docs/troubleshooting/debugging.md`：修正日誌分析章節
  - `docs/troubleshooting/common-issues.md`：更新故障排除指令
  - `docs/troubleshooting/ai-troubleshooting.md`：修正 AZD 偵錯章節
  - `docs/getting-started/azd-basics.md`：修正監控指令
  - `docs/getting-started/first-project.md`：更新監控及偵錯範例
  - `docs/getting-started/installation.md`：修正幫助及版本範例
  - `docs/pre-deployment/application-insights.md`：修正日誌閱覽指令
  - `docs/pre-deployment/coordination-patterns.md`：修正代理偵錯指令

- **📝 版本參考更新**：
  - `docs/getting-started/installation.md`：硬編碼的 `1.5.0` 改為泛用版本 `1.x.x` 並附連結至發布頁

#### 變更
- <strong>回滾策略</strong>：文檔改為使用 Git-based 回滾（AZD 無原生回滾功能）
- <strong>日誌閱覽</strong>：所有 `azd logs` 參考改為 `azd monitor --logs`、`azd monitor --live` 和 Azure CLI 指令
- <strong>效能章節</strong>：移除不存在的平行／增量部署標記，提供有效替代方案

#### 技術細節
- **有效 AZD 指令**：`init`、`up`、`auth`、`deploy`、`down`、`provision`、`publish`、`completion`、`config`、`env`、`show`、`version`、`monitor`
- **有效 azd monitor 標記**：`--live`、`--logs`、`--overview`
- <strong>移除功能</strong>：`azd logs`、`azd service`、`azd infra import/export/validate`、`azd history`、`azd metrics`、`azd info`、`azd config validate`

#### 備註
- <strong>驗證</strong>：指令依據 Azure 開發者 CLI v1.23.x 驗證

---

### [v3.9.0] - 2026-02-05

#### 工作坊完成及文件品質更新
**本版本完整呈現互動式工作坊模組，修復所有失效的文件連結，並提升 AI 開發者使用 Microsoft AZD 的整體內容品質。**

#### 新增
- **📝 CONTRIBUTING.md**：新貢獻指南文件，包含：
  - 明確報告問題與提交變更流程
  - 新內容的文件標準
  - 程式碼範例指引與提交訊息約定
  - 社群參與資訊

#### 完成
- **🎯 工作坊模組 7（總結）**：完善完成總結模組，包含：
  - 工作坊成果全盤回顧
  - 「掌握核心概念」章節涵蓋 AZD、範本與 Microsoft Foundry
  - 學習之旅持續建議
  - 工作坊挑戰練習及難度標示
  - 社群回饋與支援連結

- **📚 工作坊模組 3（解構）**：學習目標更新：
  - GitHub Copilot 與 MCP 伺服器啟用指導
  - AZD 範本資料夾結構理解
  - 基礎架構即程式碼（Bicep）組織模式
  - 實作實驗室指導

- **🔧 工作坊模組 6（拆解）**：完成內容：
  - 資源清理與成本管理目標
  - 使用 `azd down` 安全釋放基礎架構
  - 可恢復刪除的認知服務指導
  - GitHub Copilot 與 Azure 入口網站探索提示

#### 修正
- **🔗 失效連結修復**：解決 15+ 個內部失效連結：
  - `docs/ai-foundry/ai-model-deployment.md`：修正至 microsoft-foundry-integration.md 路徑
  - `docs/troubleshooting/ai-troubleshooting.md`：修正 ai-model-deployment.md 與 production-ai-practices.md 路徑
  - `docs/getting-started/first-project.md`：將不存在的 cicd-integration.md 替換為 deployment-guide.md
  - `examples/retail-scenario.md`：修正 FAQ 與故障排除指南路徑
  - `examples/container-app/microservices/README.md`：修正課程首頁和部署指南路徑
  - `resources/faq.md` 及 `resources/glossary.md`：更新 AI 章節參照
  - `course-outline.md`：修正講師指南與 AI 工作坊實驗室參考

- **📅 工作坊狀態橫幅**：從「建置中」更新為 2026 年 2 月的活動狀態

- **🔗 工作坊導航**：修正工作坊 README.md 中指向不存在 lab-1-azd-basics 資料夾的破損連結

#### 變更
- <strong>工作坊呈現</strong>：移除「建置中」警告，工作坊現已完整且可使用
- <strong>導航一致性</strong>：確保所有工作坊模組擁有正確模組間導航
- <strong>學習路徑參考</strong>：更新章節交叉引用為正確的 microsoft-foundry 路徑

#### 驗證
- ✅ 所有英文 Markdown 文件內連結皆有效
- ✅ 工作坊模組 0-7 完整並帶有學習目標
- ✅ 章節與模組間導航正常運作
- ✅ 內容適合使用 Microsoft AZD 的 AI 開發者
- ✅ 全文保持初學者友善語言與結構
- ✅ CONTRIBUTING.md 對社群貢獻者提供明確指導

#### 技術實作
- <strong>連結驗證</strong>：自動化 PowerShell 腳本驗證所有 .md 內部連結
- <strong>內容審核</strong>：手動檢查工作坊完整性與初學者適用性
- <strong>導航系統</strong>：採用一致章節與模組導航模式

#### 備註
- <strong>範圍</strong>：變更限於英文文件
- <strong>翻譯</strong>：本版本未更新翻譯資料夾（自動翻譯將於稍後同步）
- <strong>工作坊時長</strong>：完整工作坊提供約 3-4 小時實作學習

---

### [v3.8.0] - 2025-11-19

#### 進階文件：監控、安全與多代理協調模式
**此版本新增關於 Application Insights 整合、身份驗證模式與生產環境多代理協調的完整 A 級課程。**

#### 新增
- **📊 Application Insights 整合課程**：位於 `docs/pre-deployment/application-insights.md`：
  - 專注於 AZD 部署的自動資源配置
  - Application Insights 與 Log Analytics 的完整 Bicep 範本
  - 含自訂遙測功能的 Python 範例應用程式（超過 1,200 行程式碼）
  - AI/LLM 監控模式（Microsoft Foundry 模型 token 與成本追蹤）
  - 6 個 Mermaid 圖表（架構、分散式追蹤、遙測流程）
  - 3 個實作練習（警示、儀表板、AI 監控）
  - Kusto 查詢範例與成本優化策略
  - 實時指標串流與即時偵錯
  - 需時約 40-50 分鐘，具備生產環境級模式

- **🔐 身份驗證與安全模式課程**：位於 `docs/getting-started/authsecurity.md`：
  - 3 種身份驗證模式（連線字串、金鑰保管庫、託管身份）
  - 安全部署的完整 Bicep 基礎架構模板
  - Node.js 應用程式程式碼示例，整合 Azure SDK
  - 3 個完整實作練習（啟用託管身份、指定身份、金鑰輪替）
  - 安全最佳實踐與角色基礎存取控制配置
  - 故障排除指導及成本分析
  - 生產級無密碼認證模式

- **🤖 多代理協調模式課程**：位於 `docs/pre-deployment/coordination-patterns.md`：
  - 5 種協調模式（序列、平行、階層、事件驅動、共識）
  - 完整的編排服務實作（Python/Flask，超過 1,500 行）
  - 3 個專用代理實作（研究員、編寫者、編輯者）
  - 服務匯流排訊息佇列整合
  - Cosmos DB 狀態管理用於分散式系統
  - 6 個展示代理互動的 Mermaid 圖表
  - 3 個進階練習（逾時處理、重試邏輯、斷路器）
  - 成本解析（每月約 240-565 美元）並提供優化策略
  - Application Insights 監控整合

#### 強化
- <strong>部署前章節</strong>：增加全面的監控與協調模式
- <strong>入門章節</strong>：新增專業身份驗證模式
- <strong>生產準備度</strong>：從安全到觀察性完整涵蓋
- <strong>課程大綱</strong>：更新參照第 3 與第 6 章之新課程

#### 變更
- <strong>學習進程</strong>：更佳結合安全與監控內容
- <strong>文件品質</strong>：新課程皆維持一致的 A 級（95-97%）標準
- <strong>生產模式</strong>：完整企業部署端對端涵蓋

#### 改善

- <strong>開發人員體驗</strong>：從開發到生產監控的清晰路徑  
- <strong>安全標準</strong>：專業的身份驗證和機密管理模式  
- <strong>可觀察性</strong>：完整的 Application Insights 與 AZD 整合  
- **AI 工作負載**：專門針對 Microsoft Foundry 模型和多代理系統的監控  

#### 驗證通過  
- ✅ 所有課程均包含完整可運行的程式碼（非片段）  
- ✅ 以 Mermaid 圖表進行視覺化學習（3 課程共 19 張）  
- ✅ 實作練習附帶驗證步驟（共 9 題）  
- ✅ 生產就緒的 Bicep 範本，可透過 `azd up` 部署  
- ✅ 成本分析與優化策略  
- ✅ 疑難排解指引與最佳實踐  
- ✅ 知識檢查點含驗證指令  

#### 文件評分結果  
- **docs/pre-deployment/application-insights.md**：完整的監控指南  
- **docs/getting-started/authsecurity.md**：專業的安全模式  
- **docs/pre-deployment/coordination-patterns.md**：進階多代理架構  
- <strong>整體新內容</strong>：維持一致的高品質標準  

#### 技術實作  
- **Application Insights**：Log Analytics + 自訂遙測 + 分散式追蹤  
- <strong>身份驗證</strong>：Managed Identity + Key Vault + RBAC 模式  
- <strong>多代理</strong>：Service Bus + Cosmos DB + Container Apps + 協調  
- <strong>監控</strong>：即時指標 + Kusto 查詢 + 警示 + 儀表板  
- <strong>成本管理</strong>：抽樣策略、資料保留政策、預算控管  

### [v3.7.0] - 2025-11-19  

#### 文件品質提升與 Microsoft Foundry 模型新範例  
**此版本提升整個倉庫的文件品質，並新增搭配 gpt-4.1 聊天介面的完整 Microsoft Foundry 模型部署範例。**  

#### 新增  
- **🤖 Microsoft Foundry 模型聊天範例**：`examples/azure-openai-chat/` 完整 gpt-4.1 部署與運作實作：  
  - 完整 Microsoft Foundry 模型基礎架構（gpt-4.1 模型部署）  
  - Python 命令列聊天介面含對話歷史  
  - Key Vault 整合以安全存放 API 金鑰  
  - 代幣使用追蹤與成本估算  
  - 流量限制與錯誤處理  
  - 詳盡 README，提供 35-45 分鐘的部署指南  
  - 11 個生產就緒檔案（Bicep 範本、Python 應用程式、設定）  
- **📚 文件練習題**：配置指南新增實作練習：  
  - 練習 1：多環境配置（15 分鐘）  
  - 練習 2：機密管理實作（10 分鐘）  
  - 清楚的成功判斷標準及驗證步驟  
- **✅ 部署驗證**：部署指南新增驗證章節：  
  - 健康檢查程序  
  - 成功標準清單  
  - 所有部署指令的預期輸出  
  - 疑難快速參考  

#### 強化  
- **examples/README.md**：更新至 A 級品質（93%）：  
  - 新增 azure-openai-chat 於所有相關章節  
  - 本地範例數從 3 增至 4  
  - 新增 AI 應用範例表  
  - 整合到中階用戶快速入門  
  - 加入 Microsoft Foundry 範本章節  
  - 更新比較矩陣及技術發現章節  
- <strong>文件品質</strong>：docs 資料夾整體從 B+（87%）提升至 A-（92%）：  
  - 重要指令範例新增預期輸出  
  - 配置變更加入驗證步驟  
  - 加強實作練習提升動手學習效果  

#### 變更  
- <strong>學習歷程規劃</strong>：改善中階用戶 AI 範例整合  
- <strong>文件架構</strong>：增加更多具體成果的實作練習  
- <strong>驗證流程</strong>：關鍵工作流程明確加入成功判斷標準  

#### 改善  
- <strong>開發者體驗</strong>：Microsoft Foundry 模型部署時間縮短為 35-45 分鐘（原複雜方案 60-90 分鐘）  
- <strong>成本透明度</strong>：Microsoft Foundry 範例明確預估成本（每月 50-200 美元）  
- <strong>學習路徑</strong>：AI 開發者有清晰入門點 azure-openai-chat  
- <strong>文件標準</strong>：統一預期輸出及驗證步驟  

#### 驗證通過  
- ✅ Microsoft Foundry 範例可完整執行 `azd up` 部署  
- ✅ 所有 11 個實作檔案語法正確  
- ✅ README 指令與部署流程相符  
- ✅ 文件連結在 8+ 個位置更新  
- ✅ 範例索引準確反映 4 個本地範例  
- ✅ 表格內無重複外部連結  
- ✅ 導航參考皆正確  

#### 技術實作  
- **Microsoft Foundry 模型架構**：gpt-4.1 + Key Vault + Container Apps 模式  
- <strong>安全</strong>：Managed Identity 就緒，機密存放於 Key Vault  
- <strong>監控</strong>：整合 Application Insights  
- <strong>成本管理</strong>：代幣使用追蹤與優化  
- <strong>部署</strong>：單一 `azd up` 指令完成設定  

### [v3.6.0] - 2025-11-19  

#### 重大更新：Container App 部署範例  
**本版本引入完整的生產就緒容器應用程式部署範例，使用 Azure Developer CLI (AZD)，並包含完整文件與學習路徑整合。**  

#### 新增  
- **🚀 Container App 範例**：新增本地範例於 `examples/container-app/`：  
  - [主控指南](examples/container-app/README.md)：容器部署完整總覽、快速入門、生產環境與進階模式  
  - [簡單 Flask API](../../examples/container-app/simple-flask-api)：初學者友善 REST API，支援 scale-to-zero、健康檢查、監控與疑難排解  
  - [微服務架構](../../examples/container-app/microservices)：生產級多服務部署（API Gateway、產品、訂單、使用者、通知），非同步消息、Service Bus、Cosmos DB、Azure SQL、分散式追蹤、藍綠／金絲雀部署  
- <strong>最佳實踐</strong>：容器工作負載的安全性、監控、成本優化及 CI/CD 指引  
- <strong>程式碼範本</strong>：完整 `azure.yaml`、Bicep 範本及多語系服務實作（Python、Node.js、C#、Go）  
- <strong>測試與疑難排解</strong>：端對端測試場景、監控指令、疑難排解指引  

#### 變更  
- **README.md**：更新於「本地範例 - 容器應用程式」新增並連結容器 app 範例  
- **examples/README.md**：更新以突顯容器 app 範例，新增比較矩陣項目，更新技術與架構參考  
- <strong>課程大綱與學習指南</strong>：更新引用新容器應用與部署模式章節  

#### 驗證通過  
- ✅ 新增範例均可用 `azd up` 部署，且符合最佳實踐  
- ✅ 文件交叉連結與導航已更新  
- ✅ 範例涵蓋從初學到進階的生產微服務情境  

#### 備註  
- <strong>範圍</strong>：僅限英文文件與範例  
- <strong>後續計劃</strong>：未來版本將擴充更多進階容器模式與 CI/CD 自動化  

### [v3.5.0] - 2025-11-19  

#### 產品重新品牌化：Microsoft Foundry  
**此版本於所有英文文件中全面將產品名稱從「Microsoft Foundry」更名為「Microsoft Foundry」，反映 Microsoft 官方品牌變更。**  

#### 變更  
- **🔄 產品名稱更新**：全面將「Microsoft Foundry」更改為「Microsoft Foundry」  
  - 更新 `docs/`資料夾內所有英文文件的引用  
  - 資料夾重新命名：`docs/ai-foundry/` → `docs/microsoft-foundry/`  
  - 檔案重命名：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
  - 共 7 份文件中 23 處內容引用更新  

- **📁 資料夾結構變更**：  
  - `docs/ai-foundry/` 更名為 `docs/microsoft-foundry/`  
  - 所有跨檔案引用更新以反映新結構  
  - 導航連結通過驗證  

- **📄 檔案重命名**：  
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
  - 相關內部連結更新  

#### 更新檔案  
- <strong>章節文件</strong>（7 檔）：  
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 處導航連結更新  
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 處產品名稱更新  
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - 已使用 Microsoft Foundry 名稱（先前版本已更新）  
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 處引用更新（概述、社群反饋、文件）  
  - `docs/getting-started/azd-basics.md` - 4 處交叉引用更新  
  - `docs/getting-started/first-project.md` - 2 處章節導航更新  
  - `docs/getting-started/installation.md` - 2 處下一章節連結更新  
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 處引用更新（導航、Discord 社群）  
  - `docs/troubleshooting/common-issues.md` - 1 處導航連結更新  
  - `docs/troubleshooting/debugging.md` - 1 處導航連結更新  

- <strong>課程結構檔案</strong>（2 檔）：  
  - `README.md` - 17 處引用更新（課程概述、章節標題、範本章節、社群心得）  
  - `course-outline.md` - 14 處引用更新（概覽、學習目標、章節資源）  

#### 驗證通過  
- ✅ 英文文件中無遺留 "ai-foundry" 資料夾路徑引用  
- ✅ 英文文件中無遺留 "Microsoft Foundry" 產品名稱引用  
- ✅ 新資料夾結構下所有導航連結正常  
- ✅ 檔案及資料夾改名完成無誤  
- ✅ 跨章節交叉引用驗證無誤  

#### 備註  
- <strong>範圍</strong>：此版本僅套用於 `docs/` 中文件的英文版本  
- <strong>翻譯版本</strong>：翻譯資料夾 (`translations/`) 未更新  
- <strong>研討會材料</strong>：研討會 (`workshop/`) 未包含更新  
- <strong>範例檔</strong>：範例檔仍可能使用舊名稱（未來版本修正）  
- <strong>外部連結</strong>：外部 URL 與 GitHub 儲存庫引用不變  

#### 貢獻者遷移指引  
若您的本地分支或文件參考舊路徑：  
1. 更新資料夾引用：`docs/ai-foundry/` → `docs/microsoft-foundry/`  
2. 更新檔案引用：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
3. 替換產品名稱：「Microsoft Foundry」→「Microsoft Foundry」  
4. 確認所有內部文件連結仍能正常運作  

---

### [v3.4.0] - 2025-10-24  

#### 基礎架構預覽與驗證強化  
**此版本新增對 Azure Developer CLI 預覽功能的完整支援，並提升研討會使用者體驗。**  

#### 新增  
- **🧪 azd provision --preview 功能文件**：完整說明基礎架構預覽能力  
  - 指令參考與範例速查表  
  - 部署指南中詳細整合，含使用案例與好處  
  - 預檢查整合以提升部署安全性  
  - 起步指南更新，導入安全優先部署流程  
- **🚧 研討會狀態橫幅**：專業的 HTML 橫幅顯示研討會開發狀態  
  - 漸層設計，輔以施工符號，清晰傳達狀態  
  - 最後更新時間戳  
  - 行動裝置響應式設計兼容各種設備  

#### 強化  
- <strong>基礎架構安全</strong>：部署文件全面整合預覽功能  
- <strong>預部署驗證</strong>：自動化腳本包含基礎架構預覽測試  
- <strong>開發流程</strong>：更新指令序列以預覽為最佳實踐  
- <strong>研討會體驗</strong>：明確設定使用者對內容開發狀態的預期  

#### 變更  
- <strong>部署最佳實務</strong>：推薦以預覽優先作業流程  
- <strong>文件流程</strong>：基礎架構驗證移至學習過程較早階段  
- <strong>研討會呈現</strong>：以專業狀態通知並明確開發時程  

#### 改善  
- <strong>安全優先策略</strong>：部署前可驗證基礎架構變更  
- <strong>團隊協作</strong>：預覽結果可分享以供審核與批准  
- <strong>成本意識</strong>：更佳掌握資源成本  
- <strong>風險降低</strong>：透過預先驗證減少部署失敗  

#### 技術實作  
- <strong>多文件整合</strong>：預覽功能文件涵蓋 4 個重點檔案  
- <strong>指令模式</strong>：統一語法與範例  
- <strong>最佳實踐整合</strong>：預覽納入驗證流程與腳本  
- <strong>視覺標記</strong>：清楚標示全新功能增強可見性  

#### 研討會基礎架構  
- <strong>狀態溝通</strong>：專業 HTML 橫幅，含漸層樣式  
- <strong>使用者體驗</strong>：清楚顯示開發狀態避免混淆  
- <strong>專業呈現</strong>：維護倉庫可信度並設定期待  
- <strong>時程透明</strong>：標示 2025 年 10 月最後更新時間  

### [v3.3.0] - 2025-09-24  

#### 改良的研討會教材與互動式學習體驗  
**此版本引入全面的研討會教材，包含瀏覽器基礎的互動式指引與結構化學習路徑。**  

#### 新增  
- **🎥 互動工作坊指南**：帶有 MkDocs 預覽功能的瀏覽器工作坊體驗  
- **📝 結構化工作坊指引**：從發現到自訂的 7 步驟引導學習路徑  
  - 0-介紹：工作坊概覽與設定  
  - 1-選擇-AI-範本：範本發現與選擇流程  
  - 2-驗證-AI-範本：部署與驗證程序  
  - 3-拆解-AI-範本：了解範本架構  
  - 4-配置-AI-範本：配置與自訂  
  - 5-自訂-AI-範本：進階修改與迭代  
  - 6-拆除-基礎建設：清理與資源管理  
  - 7-總結：概要與後續步驟  
- **🛠️ 工作坊工具**：使用 Material 主題的 MkDocs 配置以增強學習體驗  
- **🎯 實作學習路徑**：3 步驟方法論（發現 → 部署 → 自訂）  
- **📱 GitHub Codespaces 整合**：無縫開發環境設定  

#### 增強功能  
- **AI 工作坊實驗室**：延伸為完整的 2-3 小時結構化學習體驗  
- <strong>工作坊文件</strong>：專業展示，配有導覽與視覺輔助  
- <strong>學習進度</strong>：明確的步驟指引，從範本選擇到生產部署  
- <strong>開發者體驗</strong>：整合工具以簡化開發工作流程  

#### 改良項目  
- <strong>無障礙設計</strong>：基於瀏覽器介面，具備搜尋、複製功能及主題切換  
- <strong>自主學習</strong>：彈性工作坊架構，容納不同學習速度  
- <strong>實務應用</strong>：真實世界 AI 範本部署情境  
- <strong>社群整合</strong>：Discord 整合提供工作坊支援與協作  

#### 工作坊特色  
- <strong>內建搜尋</strong>：快速尋找關鍵字及課程  
- <strong>複製程式碼區塊</strong>：滑鼠懸停複製所有程式碼範例  
- <strong>主題切換</strong>：支援深色/淺色模式以符合不同偏好  
- <strong>視覺資產</strong>：螢幕截圖與圖表以增進理解  
- <strong>支援整合</strong>：直接連結 Discord 以獲取社群支援  

### [v3.2.0] - 2025-09-17  

#### 主要導航重組與章節式學習系統  
**此版本引入全面的章節式學習結構，並增強整個資源庫的導航功能。**  

#### 新增  
- **📚 章節式學習系統**：將整個課程重組為 8 個漸進的學習章節  
  - 第一章：基礎與快速入門 (⭐ - 30-45 分鐘)  
  - 第二章：AI-First 開發 (⭐⭐ - 1-2 小時)  
  - 第三章：配置與認證 (⭐⭐ - 45-60 分鐘)  
  - 第四章：基礎建設即代碼與部署 (⭐⭐⭐ - 1-1.5 小時)  
  - 第五章：多代理 AI 解決方案 (⭐⭐⭐⭐ - 2-3 小時)  
  - 第六章：部署前驗證與規劃 (⭐⭐ - 1 小時)  
  - 第七章：除錯與故障排除 (⭐⭐ - 1-1.5 小時)  
  - 第八章：生產與企業模式 (⭐⭐⭐⭐ - 2-3 小時)  
- **📚 全面導航系統**：所有文件皆採用一致的導航頁首與頁尾  
- **🎯 進度追蹤**：課程完成清單與學習驗證系統  
- **🗺️ 學習路徑指引**：依據經驗與目標，清楚設置入口點  
- **🔗 交叉參考導航**：清晰連結相關章節與先修條件  

#### 增強  
- **README 結構**：轉變為按章節組織的結構化學習平台  
- <strong>文件導航</strong>：每頁均含章節上下文與進度指引  
- <strong>範本組織</strong>：範例與範本分類匹配學習章節  
- <strong>資源整合</strong>：速查表、常見問答與學習指南連結至相關章節  
- <strong>工作坊整合</strong>：動手實驗對應多個章節學習目標  

#### 變更  
- <strong>學習進程</strong>：由線性文檔轉為彈性章節制學習  
- <strong>配置位置</strong>：重新安排配置指南為第 3 章以優化學習流程  
- **AI 內容整合**：更佳融合 AI 特定內容於整個學習過程  
- <strong>生產內容</strong>：將企業級進階模式合併於第 8 章  

#### 改良  
- <strong>用戶體驗</strong>：明確的導航路徑及章節進度指示  
- <strong>無障礙性</strong>：一致的導航模式促進課程流暢度  
- <strong>專業呈現</strong>：大學風格課程架構，適用學術及企業培訓  
- <strong>學習效率</strong>：優化組織減少尋找相關內容時間  

#### 技術實作  
- <strong>導航頁首</strong>：40 多份文件統一章節導航標準化  
- <strong>頁尾導航</strong>：一致的進度指引與章節完成標示  
- <strong>交叉連結</strong>：完整內部連結系統連接相關概念  
- <strong>章節映射</strong>：範本與範例明確對應學習目標  

#### 學習指南優化  
- **📚 完整學習目標**：重組學習指南以配合 8 章節制  
- **🎯 章節評量**：每章含具體學習目標及實作練習  
- **📋 進度追蹤**：每週學習計劃與可衡量成果及完成清單  
- **❓ 評量問題**：每章配備知識驗證問題與專業結果  
- **🛠️ 實務練習**：實作活動涵蓋真實部署場景與故障排除  
- **📊 技能進階**：由基礎概念至企業模式的明確提升，聚焦職涯發展  
- **🎓 證書體系**：專業發展成果與社群認可系統  
- **⏱️ 時間管理**：結構化 10 週學習計劃及里程碑驗證  

### [v3.1.0] - 2025-09-17  

#### 多代理 AI 解決方案強化  
**此版本改進多代理零售解決方案，優化代理命名與文件品質。**  

#### 變更  
- <strong>多代理術語</strong>：將零售多代理方案中之「Cora agent」統一改名為「Customer agent」，提升明確性  
- <strong>代理架構</strong>：更新所有文件、ARM 範本及程式碼範例，統一使用「Customer agent」命名  
- <strong>配置範例</strong>：現代化代理配置模式，使用更新命名慣例  
- <strong>文件一致性</strong>：確保所有引用均使用專業且描述性的代理名稱  

#### 增強  
- **ARM 範本套件**：更新 retail-multiagent-arm-template，加入 Customer agent 參考  
- <strong>架構圖</strong>：更新 Mermaid 圖表以反映代理新命名  
- <strong>程式碼範例</strong>：Python 類別與實作範例採用 CustomerAgent 命名  
- <strong>環境變數</strong>：統一所有部署腳本以 CUSTOMER_AGENT_NAME 為命名慣例  

#### 改良  
- <strong>開發者體驗</strong>：文件中代理的角色與責任明確化  
- <strong>生產準備</strong>：與企業命名慣例更貼近  
- <strong>學習材料</strong>：教育用途的代理命名更直觀  
- <strong>範本可用性</strong>：簡化代理功能與部署範例的理解  

#### 技術細節  
- 更新 Mermaid 架構圖以包含 CustomerAgent 參考  
- Python 範例中將 CoraAgent 類別名替換為 CustomerAgent  
- ARM 範本 JSON 配置改為使用 "customer" 代理類型  
- 環境變數從 CORA_AGENT_* 改為 CUSTOMER_AGENT_* 模式  
- 更新所有部署命令與容器配置  

### [v3.0.0] - 2025-09-12  

#### 重大變更 - AI 開發者焦點與 Microsoft Foundry 整合  
**此版本將資源庫轉型為專注 AI 的完整學習資源，並整合 Microsoft Foundry。**  

#### 新增  
- **🤖 AI-First 學習路徑**：完整重構，優先照顧 AI 開發者及工程師需求  
- **Microsoft Foundry 整合指南**：完整文件，說明如何將 AZD 連接至 Microsoft Foundry 服務  
- **AI 模型部署模式**：涵蓋模型選擇、配置及生產部署策略的詳細指南  
- **AI 工作坊實驗室**：2-3 小時的實作工作坊，將 AI 應用轉換為 AZD 可部署方案  
- **生產級 AI 最佳實務**：支援擴展、監控與安全性的企業模式  
- **AI 專用故障排除指南**：涵蓋 Microsoft Foundry 模型、認知服務及 AI 部署問題的全面故障排除  
- **AI 範本庫**：展出 Microsoft Foundry 範本，附複雜度評分  
- <strong>工作坊教材</strong>：完整工作坊架構，含實作實驗及參考資料  

#### 增強  
- **README 結構**：針對 AI 開發者設計，結合 Microsoft Foundry Discord 45% 社群興趣資料  
- <strong>學習路徑</strong>：除傳統學生與 DevOps 工程師路徑外，特設 AI 開發者專屬路徑  
- <strong>範本推薦</strong>：精選 AI 範本，如 azure-search-openai-demo、contoso-chat、openai-chat-app-quickstart  
- <strong>社群整合</strong>：強化 Discord 社群支援，設置 AI 專用討論頻道  

#### 安全與生產聚焦  
- <strong>託管身份模式</strong>：AI 專用認證與安全配置  
- <strong>成本優化</strong>：令牌使用追蹤與預算控制  
- <strong>多區域部署</strong>：全球 AI 應用部署策略  
- <strong>效能監控</strong>：AI 專用監測指標與 Application Insights 整合  

#### 文件品質  
- <strong>線性課程結構</strong>：由初學者至高階 AI 部署模式的合理進展  
- **驗證 URL**：所有外部資源連結均經過驗證並可存取  
- <strong>完整參考</strong>：所有內部連結均有效且功能正常  
- <strong>生產準備</strong>：企業級部署模式含實際範例  

### [v2.0.0] - 2025-09-09  

#### 重大變更 - 資源庫重組及專業化提升  
**此版本大幅更新資源庫結構及內容呈現。**  

#### 新增  
- <strong>結構化學習框架</strong>：所有文件頁面新增「介紹」、「學習目標」及「學習成果」部分  
- <strong>導航系統</strong>：於所有文件內加入上一堂/下一堂課鏈結以引導學習進程  
- <strong>學習指南</strong>：完整 study-guide.md，含學習目標、練習題與評量材料  
- <strong>專業呈現</strong>：移除所有表情符號以提升無障礙性與專業外觀  
- <strong>內容結構強化</strong>：改善學習材料的組織與流程  

#### 變更  
- <strong>文件格式</strong>：標準化所有文件，採用一致的以學習為中心結構  
- <strong>導航流程</strong>：實作合邏輯的學習進展流程  
- <strong>內容呈現</strong>：移除裝飾元素，改用清晰、專業格式  
- <strong>鏈結結構</strong>：更新所有內部鏈結以支援新導航系統  

#### 改良  
- <strong>無障礙</strong>：去除表情符號依賴，提升螢幕閱讀器相容性  
- <strong>專業外觀</strong>：乾淨、學術風格，適用企業學習  
- <strong>學習體驗</strong>：結構化方式，明確界定每堂課目標與成果  
- <strong>內容組織</strong>：更妥善邏輯連結相關主題  

### [v1.0.0] - 2025-09-09  

#### 初始釋出 - 完整 AZD 學習資源庫  

#### 新增  
- <strong>核心文件結構</strong>  
  - 完整入門指南系列  
  - 全面部署與設施說明  
  - 詳細故障診斷與除錯指導  
  - 部署前驗證工具與流程  

- <strong>入門模組</strong>  
  - AZD 基礎：核心概念與術語  
  - 安裝指南：平台專屬設定指導  
  - 配置指南：環境設定與認證  
  - 第一個專案教程：逐步實作學習  

- <strong>部署與建置模組</strong>  
  - 部署指南：完整工作流程文件  
  - 建置指南：使用 Bicep 的基礎建設即代碼  
  - 生產部署最佳實務  
  - 多服務架構模式  

- <strong>部署前驗證模組</strong>  
  - 容量規劃：Azure 資源可用性驗證  
  - SKU 選擇：詳盡的服務級別指導  
  - 預驗檢查：自動化驗證腳本 (PowerShell 與 Bash)  
  - 成本估算與預算規劃工具  

- <strong>故障排除模組</strong>  
  - 常見問題：經常遇見的問題與解決方案  
  - 除錯指南：系統性故障排除方法  
  - 進階診斷技術與工具  
  - 效能監控與優化  

- <strong>資源與參考</strong>  
  - 命令速查表：主要命令快速參考  
  - 詞彙表：完整術語與縮寫定義  
  - 常見問答：詳盡答案收集  
  - 外部資源連結與社群連結  

- <strong>範例與範本</strong>  
  - 簡單網頁應用範例  
  - 靜態網站部署範本  
  - 容器應用配置  
  - 資料庫整合模式  
  - 微服務架構範例  
  - 無伺服器函數實作  

#### 功能  
- <strong>跨平台支援</strong>：Windows、macOS 與 Linux 的安裝與配置指導  
- <strong>多層級設計</strong>：內容涵蓋學生至專業開發者  
- <strong>實務導向</strong>：含動手範例與實際情境  
- <strong>全面覆蓋</strong>：從基礎到進階企業模式  
- <strong>安全優先</strong>：貫穿整合安全最佳模式  
- <strong>成本最佳化</strong>：提供經濟有效的部署與資源管理建議  

#### 文件品質  
- <strong>詳盡程式碼範例</strong>：實用且經測試的範例程式碼  
- <strong>逐步指示</strong>：清楚可行的指導步驟  
- <strong>全面錯誤處理</strong>：常見問題的故障排除  
- <strong>最佳實務整合</strong>：業界標準及推薦做法  
- <strong>版本相容性</strong>：符合最新 Azure 服務與 azd 功能  

## 未來規劃增強  

### 版本 3.1.0（規劃中）  
#### AI 平台擴展  
- <strong>多模型支援</strong>：整合 Hugging Face、Azure Machine Learning 及自訂模型的方案
- **AI 代理框架**：LangChain、Semantic Kernel 及 AutoGen 部署範本
- **進階 RAG 模式**：Azure AI Search 之外的向量資料庫選項（Pinecone、Weaviate 等）
- **AI 可觀察性**：模型效能、Token 使用量及回應品質的強化監控

#### 開發者體驗
- **VS Code 擴充功能**：整合 AZD + Microsoft Foundry 的開發體驗
- **GitHub Copilot 整合**：AI 輔助的 AZD 範本產生
- <strong>互動式教學</strong>：針對 AI 情境的動手實作練習及自動驗證
- <strong>影片內容</strong>：針對視覺學習者的 AI 部署補充教學影片

### 版本 4.0.0（計劃中）
#### 企業級 AI 模式
- <strong>治理框架</strong>：AI 模型治理、合規與稽核軌跡
- **多租戶 AI**：為多個客戶提供隔離 AI 服務的模式
- **邊緣 AI 部署**：與 Azure IoT Edge 及容器實例整合
- **混合雲 AI**：AI 工作負載的多雲及混合部署模式

#### 進階功能
- **AI 管線自動化**：與 Azure Machine Learning 管線的 MLOps 整合
- <strong>進階安全性</strong>：零信任模式、私人端點及進階威脅防護
- <strong>效能優化</strong>：高吞吐量 AI 應用的調校與擴展策略
- <strong>全球分佈</strong>：AI 應用的內容傳遞與邊緣快取模式

### 版本 3.0.0（計劃中） - 已被目前版本取代
#### 提案新增功能 - 現已實作於 v3.0.0
- ✅ **以 AI 為焦點的內容**：完整的 Microsoft Foundry 整合（已完成）
- ✅ <strong>互動式教學</strong>：動手 AI 工作坊實驗（已完成）
- ✅ <strong>進階安全模組</strong>：專門的 AI 安全模式（已完成）
- ✅ <strong>效能優化</strong>：AI 工作負載調校策略（已完成）

### 版本 2.1.0（計劃中）- 部分完成於 v3.0.0
#### 小幅強化 - 目前版本部分完成
- ✅ <strong>更多範例</strong>：以 AI 為焦點的部署情境（已完成）
- ✅ <strong>擴充常見問題集</strong>：AI 相關問題與疑難排解（已完成）
- <strong>工具整合</strong>：加強的 IDE 與編輯器整合指南
- ✅ <strong>監控擴充</strong>：AI 專屬監控與警示模式（已完成）

#### 未來版本計劃
- <strong>行動裝置友善文件</strong>：響應式設計以利行動學習
- <strong>離線使用</strong>：可下載的文件套件
- **強化 IDE 整合**：AZD + AI 工作流程的 VS Code 擴充功能
- <strong>社群儀表板</strong>：即時社群指標與貢獻追蹤

## 對變更記錄的貢獻

### 回報變更
在對本存放庫貢獻時，請確保變更記錄包含：

1. <strong>版本號</strong>：遵循語義版本號規範（大版.小版.修補）
2. <strong>日期</strong>：發布或更新日期，格式為 YYYY-MM-DD
3. <strong>類別</strong>：新增、變更、棄用、移除、修正、安全性
4. <strong>清晰描述</strong>：簡潔說明變更內容
5. <strong>影響評估</strong>：說明變更如何影響現有用戶

### 變更分類

#### 新增
- 新功能、文件章節或能力
- 新範例、範本或學習資源
- 額外工具、腳本或實用程式

#### 變更
- 現有功能或文件的修改
- 改善清晰度或正確性的更新
- 內容或組織結構的重組

#### 棄用
- 逐步淘汰的功能或方法
- 預計刪除的文件章節
- 有更好替代方案的方法

#### 移除
- 不再相關的功能、文件或範例
- 過時資訊或棄用方法
- 重複或合併內容

#### 修正
- 文件或程式碼的錯誤修正
- 解決回報的問題
- 精確度或功能的改進

#### 安全性
- 與安全相關的改進或修正
- 安全最佳實務的更新
- 安全漏洞的修補

### 語義版本規範指南

#### 大版本 (X.0.0)
- 需使用者採取行動的重大變更
- 大幅重組內容或組織
- 改變基本方法或架構的變更

#### 小版本 (X.Y.0)
- 新功能或內容新增
- 向下相容的改進
- 新增範例、工具或資源

#### 修補版本 (X.Y.Z)
- 錯誤修正及更正
- 現有內容的小幅改良
- 釐清及輕微增強

## 社群回饋與建議

我們積極鼓勵社群回饋以改進此學習資源：

### 提供回饋方式
- **GitHub Issues**：回報問題或建議改進（歡迎 AI 專屬議題）
- **Discord 討論**：分享想法並與 Microsoft Foundry 社群互動
- **Pull Requests**：直接貢獻內容改進，特別是 AI 範本及指南
- **Microsoft Foundry Discord**：參與 #Azure 頻道討論 AZD + AI
- <strong>社群論壇</strong>：參與更廣泛的 Azure 開發者討論

### 回饋類別
- **AI 內容準確性**：修正 AI 服務整合與部署資訊
- <strong>學習體驗</strong>：改善 AI 開發者學習流程的建議
- **缺少的 AI 內容**：請求額外 AI 範本、模式或範例
- <strong>無障礙</strong>：多元學習需求的優化
- **AI 工具整合**：提升 AI 開發工作流程的建議
- **生產 AI 模式**：企業級 AI 部署模式請求

### 回應承諾
- <strong>問題回應</strong>：依據問題於 48 小時內回覆
- <strong>功能請求</strong>：於一週內評估
- <strong>社群貢獻</strong>：於一週內審核
- <strong>安全問題</strong>：優先處理並加速回應

## 維護計劃

### 定期更新
- <strong>每月檢視</strong>：內容準確性及連結驗證
- <strong>季度更新</strong>：重大內容新增與改進
- <strong>半年檢視</strong>：全面重組與強化
- <strong>年度發布</strong>：帶有重大改進的大版本更新

### 監控與品質保證
- <strong>自動化測試</strong>：定期驗證程式碼範例與連結
- <strong>社群回饋整合</strong>：定期納入用戶建議
- <strong>技術更新</strong>：配合最新 Azure 服務及 azd 發布
- <strong>無障礙審核</strong>：定期檢視包容性設計原則

## 版本支援政策

### 目前版本支援
- <strong>最新大版本</strong>：全面支援並定期更新
- <strong>前一大版本</strong>：提供 12 個月安全更新與關鍵修正
- <strong>舊版本</strong>：僅社群支援，無官方更新

### 遷移指引
發布大版本時，我們提供：
- <strong>遷移指南</strong>：逐步轉換指示
- <strong>相容性說明</strong>：斷裂變更詳情
- <strong>工具支援</strong>：輔助遷移的腳本或工具
- <strong>社群支援</strong>：專門論壇解答遷移問題

---

<strong>導覽</strong>
- <strong>上一課</strong>：[Study Guide](resources/study-guide.md)
- <strong>下一課</strong>：回到 [Main README](README.md)

<strong>保持更新</strong>：追蹤此存放庫以接收關於新版本及重要學習資料更新的通知。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件是使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議使用專業人工翻譯。我們不對因使用本翻譯而導致的任何誤解或誤譯負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->