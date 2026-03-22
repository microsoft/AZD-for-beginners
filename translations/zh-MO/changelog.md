# 變更記錄 - AZD For Beginners

## 介紹

此變更記錄文件記錄了 AZD For Beginners 倉庫的所有重要變更、更新和改進。我們遵循語義化版本控制原則，並維護此日誌以協助使用者了解各版本之間的變動。

## 學習目標

透過檢閱此變更記錄，您將能：
- 了解新增功能與內容補充
- 理解現有文件的改進
- 追蹤錯誤修正與更正以確保準確性
- 追蹤學習材料隨時間的演進

## 學習成果

在檢閱變更記錄條目後，您將能夠：
- 辨識可用於學習的新內容和資源
- 了解哪些章節已被更新或改進
- 根據最新教材規劃您的學習路徑
- 提供回饋與建議以促進未來改進

## 版本歷史

### [v3.18.0] - 2026-03-16

#### AZD AI CLI 指令、內容驗證與範本擴充
**此版本在所有與 AI 相關章節加入 `azd ai`、`azd extension` 與 `azd mcp` 指令涵蓋、修正 agents.md 中的斷鏈與已棄用程式碼、更新速查表，並徹底重寫範例範本段落，包含已驗證的描述與新的 Azure AI AZD 範本。**

#### 新增
- **🤖 AZD AI CLI 覆蓋範圍** 擴及 7 個檔案（先前僅在第 8 章）：
  - `docs/chapter-01-foundation/azd-basics.md` — 新增「Extensions and AI Commands（擴充與 AI 指令）」章節，介紹 `azd extension`、`azd ai agent init` 與 `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — 選項 4：`azd ai agent init`，並加入比較表（template vs manifest 方式）
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — 「AZD Extensions for Foundry」與「Agent-First Deployment」小節
  - `docs/chapter-05-multi-agent/README.md` — 快速入門現顯示範本與基於 manifest 的部署路徑
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy 區段現在包含 `azd ai agent init` 選項
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — 「AZD AI Extension Commands for Diagnostics（AZD AI 擴充診斷指令）」小節
  - `resources/cheat-sheet.md` — 新增「AI & Extensions Commands（AI 與擴充指令）」章節，含 `azd extension`、`azd ai agent init`、`azd mcp` 與 `azd infra generate`
- **📦 新增 AZD AI 範例範本** 在 `microsoft-foundry-integration.md`：
  - **azure-search-openai-demo-csharp** — 使用 Blazor WebAssembly、Semantic Kernel 的 .NET RAG 聊天，並支援語音聊天
  - **azure-search-openai-demo-java** — 使用 Langchain4J 的 Java RAG 聊天，提供 ACA/AKS 部署選項
  - **contoso-creative-writer** — 多代理創意寫作應用，使用 Azure AI Agent Service、Bing Grounding 與 Prompty
  - **serverless-chat-langchainjs** — 無伺服器 RAG，採用 Azure Functions + LangChain.js + Cosmos DB，並支援 Ollama 本地開發
  - **chat-with-your-data-solution-accelerator** — 企業級 RAG 加速器，含管理後台、Teams 整合，以及 PostgreSQL/Cosmos DB 選項
  - **azure-ai-travel-agents** — 多代理 MCP 編排範例應用，伺服器端以 .NET、Python、Java 與 TypeScript 實作
  - **azd-ai-starter** — 最小化 Azure AI 基礎設施的 Bicep 起始範本
  - **🔗 精選 awesome-azd AI 展示集 連結** — 參考 [awesome-azd AI 展示集](https://azure.github.io/awesome-azd/?tags=ai)（80+ 範本）

#### 修正
- **🔗 agents.md 導航**：Previous/Next 連結現在與第 2 章 README 的課程順序一致（Microsoft Foundry Integration → Agents → AI Model Deployment）
- **🔗 agents.md 斷鏈**：將 `production-ai-practices.md` 修正為 `../chapter-08-production/production-ai-practices.md`（3 處）
- **📦 agents.md 已棄用程式碼**：將 `opencensus` 替換為 `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md 無效 API**：將 `max_tokens` 從 `create_agent()` 移到 `create_run()` 作為 `max_completion_tokens`
- **🔢 agents.md 令牌計數**：以 `tiktoken.encoding_for_model()` 取代粗略的 `len//4` 估算
- **azure-search-openai-demo**：將服務描述從 "Cognitive Search + App Service" 更正為 "Azure AI Search + Azure Container Apps"（預設主機於 2024 年 10 月變更）
- **contoso-chat**：更新描述以參照 Azure AI Foundry + Prompty，與該倉庫實際標題與技術棧相符

#### 移除
- **ai-document-processing**：移除不可用的範本參考（該倉庫未公開為 AZD 範本）

#### 改進
- **📝 agents.md 練習**：練習 1 現在顯示預期輸出與 `azd monitor` 步驟；練習 2 包含完整的 `FunctionTool` 註冊程式碼；練習 3 以具體的 `prepdocs.py` 指令取代含糊指示
- **📚 agents.md 資源**：更新文件連結以指向目前的 Azure AI Agent Service 文件與快速入門
- **📋 agents.md 下一步表格**：新增 AI Workshop Lab 連結以涵蓋完整章節

#### 已更新檔案
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### 課程導航強化
**此版本以更強化的表格格式改善 README.md 的章節導航。**

#### 變更
- <strong>課程地圖表格</strong>：加強為直接課程連結、時長估計與複雜度評分
- <strong>資料夾清理</strong>：移除冗餘舊資料夾（deployment/, getting-started/, pre-deployment/, troubleshooting/）
- <strong>連結驗證</strong>：課程地圖表格中超過 21 個內部連結皆已驗證

### [v3.16.0] - 2026-02-05

#### 產品名稱更新
**此版本將產品參考更新為目前的 Microsoft 品牌命名。**

#### 變更
- **Microsoft Foundry → Microsoft Foundry**：所有非翻譯檔案中的參考皆已更新
- **Azure AI Agent Service → Foundry Agents**：服務名稱已更新以反映現行品牌

#### 已更新檔案
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

#### 主要倉庫結構重組：以章節為單位的資料夾命名
**此版本將文件重構為專門的章節資料夾以利更清晰的導覽。**

#### 資料夾重命名
舊資料夾已被章節編號資料夾取代：
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
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### 新增
- **📚 章節 README 檔案**：在每個章節資料夾建立 README.md，包含：
  - 學習目標與時長
  - 課程表格與描述
  - 快速啟動指令
  - 與其他章節的導航連結

#### 變更
- **🔗 更新所有內部連結**：跨所有文件更新超過 78 個路徑
- **🗺️ 主要 README.md**：使用新的章節結構更新課程地圖
- **📝 examples/README.md**：更新對章節資料夾的交叉參考

#### 移除
- 舊的資料夾結構（getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/）

---

### [v3.14.0] - 2026-02-05

#### 倉庫重構：章節導航
**此版本新增章節導航 README 檔案（已被 v3.15.0 取代）。**

---

### [v3.13.0] - 2026-02-05

#### 新增 AI Agents 指南
**此版本新增一份關於使用 Azure Developer CLI 部署 AI agents 的完整指南。**

#### 新增
- **🤖 docs/microsoft-foundry/agents.md**：完整指南涵蓋：
  - 什麼是 AI agents 以及它們與聊天機器人的差異
  - 三個快速上手的 agent 範本（Foundry Agents、Prompty、RAG）
  - 代理架構模式（單一代理、RAG、多代理）
  - 工具設定與自訂
  - 監控與指標追蹤
  - 成本考量與優化
  - 常見的故障排除情境
  - 三個實作練習與成功標準

#### 內容結構
- <strong>介紹</strong>：為初學者說明代理概念
- <strong>快速上手</strong>：使用 `azd init --template get-started-with-ai-agents` 部署代理
- <strong>架構模式</strong>：代理模式的視覺化圖示
- <strong>設定</strong>：工具設定與環境變數
- <strong>監控</strong>：Application Insights 整合
- <strong>練習</strong>：逐步的實作學習（每個 20-45 分鐘）

---

### [v3.12.0] - 2026-02-05

#### DevContainer 開發環境更新
**此版本更新開發容器設定，採用較現代化工具與更好的預設值以提升 AZD 學習體驗。**

#### 變更
- **🐳 基底映像**：從 `python:3.12-bullseye` 更新為 `python:3.12-bookworm`（最新的 Debian 穩定版）
- **📛 容器名稱**：從 "Python 3" 重新命名為 "AZD for Beginners" 以提高清晰度

#### 新增
- **🔧 新的開發容器功能**:
  - `azure-cli` 已啟用 Bicep 支援
  - `node:20` (AZD 範本的 LTS 版本)
  - `github-cli` 用於範本管理
  - `docker-in-docker` 用於容器應用部署

- **🔌 連接埠轉發**: 已預先設定常見開發用連接埠:
  - 8000 (MkDocs 預覽)
  - 3000 (網頁應用)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 新增的 VS Code 擴充功能**:
  - `ms-python.vscode-pylance` - 強化的 Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - 支援 Azure Functions
  - `ms-azuretools.vscode-docker` - Docker 支援
  - `ms-azuretools.vscode-bicep` - Bicep 語言支援
  - `ms-azure-devtools.azure-resource-groups` - Azure 資源管理
  - `yzhang.markdown-all-in-one` - Markdown 編輯
  - `DavidAnson.vscode-markdownlint` - Markdown 代碼檢查
  - `bierner.markdown-mermaid` - Mermaid 圖表支援
  - `redhat.vscode-yaml` - YAML 支援 (用於 azure.yaml)
  - `eamodio.gitlens` - Git 視覺化
  - `mhutchie.git-graph` - Git 歷史

- **⚙️ VS Code 設定**: 新增 Python 直譯器、儲存時格式化與修剪空白字元的預設設定

- **📦 更新 requirements-dev.txt**:
  - 新增 MkDocs minify 外掛
  - 新增 pre-commit 以提升程式碼品質
  - 新增 Azure SDK 套件 (azure-identity, azure-mgmt-resource)

#### 修正
- **Post-Create Command**: 現在在容器啟動時驗證 AZD 與 Azure CLI 的安裝

---

### [v3.11.0] - 2026-02-05

#### 為初學者優化的 README 大幅改寫
**此版本大幅改善 README.md，使其對初學者更友善，並新增 AI 開發者的必要資源。**

#### 新增
- **🆚 Azure CLI 與 AZD 比較**: 清楚說明何時使用各工具並附實際範例
- **🌟 精選 AZD 連結**: 直接連結到社群範本畫廊與貢獻資源:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 超過 200 個可立即部署的範本
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - 社群貢獻
- **🎯 快速入門指南**: 簡化為三步驟的入門流程 (安裝 → 登入 → 部署)
- **📊 依經驗分級的導覽表**: 根據開發者經驗提供清楚的起點建議

#### 變更
- **README 結構**: 重新組織為漸進揭露式 - 重要資訊置於最前
- <strong>介紹章節</strong>: 重新撰寫以向完全新手說明「`azd up` 的魔力」
- <strong>移除重複內容</strong>: 刪除重複的疑難排解章節
- <strong>疑難排解命令</strong>: 修正 `azd logs` 的參考，改為使用有效的 `azd monitor --logs`

#### 修正
- **🔐 驗證命令**: 在 cheat-sheet.md 中新增 `azd auth login` 和 `azd auth logout`
- <strong>無效命令參考</strong>: 移除 README 疑難排解章節中剩餘的 `azd logs`

#### 說明
- <strong>範圍</strong>: 變更套用於主要 README.md 與 resources/cheat-sheet.md
- <strong>目標受眾</strong>: 針對不熟悉 AZD 的開發者進行改善

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI 命令精確度更新
**此版本修正文件中所有不存在的 AZD 命令，確保所有程式碼範例使用有效的 Azure Developer CLI 語法。**

#### 修正
- **🔧 已移除不存在的 AZD 命令**: 全面稽核並修正無效命令:
  - `azd logs` (不存在) → 以 `azd monitor --logs` 或 Azure CLI 替代
  - `azd service` 子命令 (不存在) → 改為使用 `azd show` 與 Azure CLI
  - `azd infra import/export/validate` (不存在) → 已移除或改為有效替代
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` 旗標 (不存在) → 已移除
  - `azd provision --what-if/--rollback` 旗標 (不存在) → 更新為使用 `--preview`
  - `azd config validate` (不存在) → 改為 `azd config list`
  - `azd info`, `azd history`, `azd metrics` (不存在) → 已移除

- **📚 已更新檔案以修正命令**:
  - `resources/cheat-sheet.md`: 指令參考大幅改寫
  - `docs/deployment/deployment-guide.md`: 修正回滾與部署策略
  - `docs/troubleshooting/debugging.md`: 修正日誌分析相關章節
  - `docs/troubleshooting/common-issues.md`: 更新疑難排解命令
  - `docs/troubleshooting/ai-troubleshooting.md`: 修正 AZD 偵錯章節
  - `docs/getting-started/azd-basics.md`: 修正監控命令
  - `docs/getting-started/first-project.md`: 更新監控與偵錯範例
  - `docs/getting-started/installation.md`: 修正說明與版本範例
  - `docs/pre-deployment/application-insights.md`: 修正日誌檢視命令
  - `docs/pre-deployment/coordination-patterns.md`: 修正 agent 偵錯命令

- **📝 版本參考已更新**:
  - `docs/getting-started/installation.md`: 將硬編碼的 `1.5.0` 版本改為通用的 `1.x.x` 並附上 releases 連結

#### 變更
- <strong>回滾策略</strong>: 文件改為使用以 Git 為基礎的回滾方法 (AZD 本身無內建回滾)
- <strong>日誌檢視</strong>: 將 `azd logs` 的參考替換為 `azd monitor --logs`、`azd monitor --live` 以及 Azure CLI 命令
- <strong>效能章節</strong>: 移除不存在的平行/增量部署旗標，並提供有效的替代方案

#### 技術細節
- **有效的 AZD 命令**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **有效的 azd monitor 旗標**: `--live`, `--logs`, `--overview`
- <strong>已移除的功能</strong>: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### 說明
- <strong>驗證</strong>: 命令已針對 Azure Developer CLI v1.23.x 進行驗證

---

### [v3.9.0] - 2026-02-05

#### 工作坊完成與文件品質更新
**此版本完成互動式工作坊模組，修復所有斷裂的文件連結，並提升針對使用 Microsoft AZD 的 AI 開發者的整體內容品質。**

#### 新增
- **📝 CONTRIBUTING.md**: 新的貢獻指南文件，包含:
  - 回報問題與提案變更的清楚指示
  - 新內容的文件標準
  - 程式碼範例指南與提交訊息慣例
  - 社群參與資訊

#### 完成
- **🎯 工作坊模組 7 (總結)**: 完成的總結模組，包含:
  - 工作坊成果的完整摘要
  - 掌握的關鍵概念章節，涵蓋 AZD、範本與 Microsoft Foundry
  - 學習旅程的延續建議
  - 含難度評等的工作坊挑戰練習
  - 社群反饋與支援連結

- **📚 工作坊模組 3 (拆解)**: 更新學習目標，包含:
  - 啟用 GitHub Copilot 與 MCP 伺服器的指引
  - AZD 範本資料夾結構理解
  - 基礎設施即程式碼 (Bicep) 的組織模式
  - 實作實驗室指示

- **🔧 工作坊模組 6 (拆除)**: 完成內容，包含:
  - 資源清理與成本管理目標
  - 使用 `azd down` 安全停用基礎設施
  - 軟刪除認知服務的復原指引
  - 針對 GitHub Copilot 與 Azure Portal 的延伸探索提示

#### 修正
- **🔗 斷鏈修復**: 已解決 15+ 個內部文件的斷裂連結:
  - `docs/ai-foundry/ai-model-deployment.md`: 修正到 microsoft-foundry-integration.md 的路徑
  - `docs/troubleshooting/ai-troubleshooting.md`: 修正 ai-model-deployment.md 與 production-ai-practices.md 的路徑
  - `docs/getting-started/first-project.md`: 將不存在的 cicd-integration.md 換成 deployment-guide.md
  - `examples/retail-scenario.md`: 修正 FAQ 與疑難排解指南路徑
  - `examples/container-app/microservices/README.md`: 修正課程首頁與部署指南路徑
  - `resources/faq.md` 與 `resources/glossary.md`: 更新 AI 章節參考
  - `course-outline.md`: 修正講師指南與 AI 工作坊實驗室參考

- **📅 工作坊狀態橫幅**: 從「建置中」更新為 2026 年 2 月的啟用狀態

- **🔗 工作坊導覽**: 修正 workshop README.md 中指向不存在 lab-1-azd-basics 資料夾的斷裂導覽連結

#### 變更
- <strong>工作坊呈現</strong>: 移除「建置中」警示，工作坊現已完成並可使用
- <strong>導覽一致性</strong>: 確保所有工作坊模組具有正確的模組間導覽
- <strong>學習路徑參考</strong>: 將章節交叉參考更新為正確的 microsoft-foundry 路徑

#### 已驗證
- ✅ 所有英文 Markdown 檔案的內部連結皆有效
- ✅ 工作坊模組 0-7 已完成並含學習目標
- ✅ 章節間與模組間的導覽功能正確
- ✅ 內容適合使用 Microsoft AZD 的 AI 開發者
- ✅ 全文維持對初學者友善的語言與結構
- ✅ CONTRIBUTING.md 提供清楚的社群貢獻指引

#### 技術實作
- <strong>連結驗證</strong>: 使用自動化 PowerShell 腳本驗證所有 .md 檔案的內部連結
- <strong>內容稽核</strong>: 手動審查工作坊的完整性與是否適合初學者
- <strong>導覽系統</strong>: 套用一致的章節與模組導覽模式

#### 說明
- <strong>範圍</strong>: 變更僅套用於英文文件
- <strong>翻譯</strong>: 本版本未更新翻譯資料夾（自動翻譯將在稍後同步）
- <strong>工作坊時長</strong>: 完整工作坊現在提供 3-4 小時的實作學習

---

### [v3.8.0] - 2025-11-19

#### 進階文件：監控、安全與多代理模式
**此版本新增完整的 A 級課程，涵蓋 Application Insights 整合、驗證模式，以及用於生產部署的多代理協調模式。**

#### 新增
- **📊 Application Insights 整合課程**: 位於 `docs/pre-deployment/application-insights.md`:
  - 以 AZD 為重點的部署並自動佈建
  - Application Insights + Log Analytics 的完整 Bicep 範本
  - 含客製遙測的可運作 Python 應用程式（超過 1,200 行）
  - AI/LLM 監控模式（Microsoft Foundry 模型的 token/成本追蹤）
  - 6 個 Mermaid 圖表（架構、分散式追蹤、遙測流程）
  - 3 項實作練習（警示、儀表板、AI 監控）
  - Kusto 查詢範例與成本優化策略
  - 即時度量串流與即時除錯
  - 40-50 分鐘的學習時長，含生產就緒模式

- **🔐 驗證與安全模式課程**: 位於 `docs/getting-started/authsecurity.md`:
  - 3 種驗證模式（連線字串、Key Vault、Managed Identity）
  - 用於安全部署的完整 Bicep 基礎設施範本
  - 與 Azure SDK 整合的 Node.js 應用程式程式碼
  - 3 個完整練習（啟用 Managed Identity、指定使用者指派身分、Key Vault 旋轉）
  - 安全最佳做法與 RBAC 設定
  - 疑難排解指南與成本分析
  - 生產就緒的無密碼驗證模式

- **🤖 多代理協調模式課程**: 位於 `docs/pre-deployment/coordination-patterns.md`:
  - 5 種協調模式（序列、平行、層級、事件驅動、共識）
  - 完整的協調器服務實作（Python/Flask，超過 1,500 行）
  - 3 個專用代理實作（Research、Writer、Editor）
  - Service Bus 的訊息佇列整合
  - Cosmos DB 的分散式系統狀態管理
  - 6 個展示代理互動的 Mermaid 圖表
  - 3 項進階練習（超時處理、重試邏輯、斷路器）
  - 成本細目（每月 $240-565）與優化策略
  - Application Insights 的監控整合

#### 強化
- **Pre-deployment 章節**: 現在包含完整的監控與協調模式
- **Getting Started 章節**: 加強專業的驗證模式
- <strong>生產就緒</strong>: 從安全到可觀測性的完整覆蓋
- <strong>課程大綱</strong>: 已更新以參照第 3 與第 6 章的新課程

#### 變更
- <strong>學習進程</strong>: 將安全與監控更好地整合到整個課程中
- <strong>文件品質</strong>: 新課程維持一致的 A 級標準 (95-97%)
- <strong>生產模式</strong>: 提供企業部署的端到端完整覆蓋

#### 改進
- <strong>開發者體驗</strong>: 從開發到生產監控的明確流程
- <strong>安全標準</strong>: 驗證與機密管理的專業模式
- <strong>可觀察性</strong>: 與 AZD 完整整合 Application Insights
- **AI 工作負載**: 針對 Microsoft Foundry Models 與多代理系統的專門監控

#### 已驗證
- ✅ 所有課程包含完整可執行的程式碼（非片段）
- ✅ Mermaid 圖表供視覺學習（共 19 張，分布於 3 個課程）
- ✅ 實作練習含驗證步驟（共 9 項）
- ✅ 可透過 `azd up` 部署的生產就緒 Bicep 範本
- ✅ 成本分析與優化策略
- ✅ 故障排除指南與最佳實務
- ✅ 知識檢查點與驗證指令

#### 文件評分結果
- **docs/pre-deployment/application-insights.md**: - 全面性的監控指南
- **docs/getting-started/authsecurity.md**: - 專業安全模式
- **docs/pre-deployment/coordination-patterns.md**: - 進階多代理架構
- <strong>整體新內容</strong>: - 一致的高品質標準

#### 技術實作
- **Application Insights**: Log Analytics + 自訂遙測 + 分散式追蹤
- <strong>驗證</strong>: Managed Identity + Key Vault + RBAC 模式
- <strong>多代理</strong>: Service Bus + Cosmos DB + Container Apps + 編排
- <strong>監控</strong>: 實時指標 + Kusto 查詢 + 警示 + 儀表板
- <strong>成本管理</strong>: 取樣策略、保留政策、預算控制

### [v3.7.0] - 2025-11-19

#### 文件品質改進與新的 Microsoft Foundry Models 範例
**此版本提升了整個儲存庫的文件品質，並新增一個完整的 Microsoft Foundry Models 部署範例，包含 gpt-4.1 聊天介面。**

#### 新增
- **🤖 Microsoft Foundry Models Chat Example**: 在 `examples/azure-openai-chat/` 中提供完整的 gpt-4.1 部署與可運作實作：
  - 完整的 Microsoft Foundry Models 基礎設施（gpt-4.1 模型部署）
  - 帶有會話歷史記錄的 Python 命令列聊天介面
  - 與 Key Vault 整合以安全儲存 API 金鑰
  - 代幣使用追蹤與成本估算
  - 速率限制與錯誤處理
  - 完整的 README，包含 35-45 分鐘的部署指南
  - 11 個生產就緒檔案（Bicep 範本、Python 應用程式、設定檔）
- **📚 文件練習**: 在設定指南中新增實作練習：
  - 練習 1：多環境設定（15 分鐘）
  - 練習 2：機密管理練習（10 分鐘）
  - 清晰的成功標準與驗證步驟
- **✅ 部署驗證**: 在部署指南中新增驗證章節：
  - 健康檢查程序
  - 成功準則檢查清單
  - 所有部署指令的預期輸出
  - 故障排除快速參考

#### 強化
- **examples/README.md**: 更新至 A 級品質（93%）：
  - 已將 azure-openai-chat 新增至所有相關章節
  - 將本機範例數量從 3 更新為 4
  - 新增至 AI 應用範例表格
  - 整合進中階使用者快速上手
  - 新增至 Microsoft Foundry 範本章節
  - 更新比較矩陣與技術發現章節
- <strong>文件品質</strong>: 在 docs 資料夾中由 B+ (87%) 提升至 A- (92%)：
  - 在重要指令範例中新增預期輸出
  - 為設定變更加入驗證步驟
  - 以實作練習強化動手學習

#### 更動
- <strong>學習進程</strong>: 為中階學習者更好地整合 AI 範例
- <strong>文件結構</strong>: 更具可執行性的練習與明確結果
- <strong>驗證流程</strong>: 在關鍵工作流程中加入明確成功標準

#### 改善
- <strong>開發者體驗</strong>: Microsoft Foundry Models 部署現在需時 35-45 分鐘（相較於複雜替代方案的 60-90 分鐘）
- <strong>成本透明度</strong>: 為 Microsoft Foundry Models 範例提供明確成本估算（$50-200/月）
- <strong>學習路徑</strong>: AI 開發者有透過 azure-openai-chat 的明確入門點
- <strong>文件標準</strong>: 一致的預期輸出與驗證步驟

#### 已驗證
- ✅ Microsoft Foundry Models 範例可透過 `azd up` 完整運作
- ✅ 所有 11 個實作檔案語法正確
- ✅ README 指示符合實際部署經驗
- ✅ 文件連結已在 8+ 個位置更新
- ✅ 範例索引準確反映 4 個本機範例
- ✅ 表格中無重複外部連結
- ✅ 所有導覽參考皆正確

#### 技術實作
- **Microsoft Foundry Models 架構**: gpt-4.1 + Key Vault + Container Apps 模式
- <strong>安全性</strong>: 側重 Managed Identity，機密儲存在 Key Vault
- <strong>監控</strong>: Application Insights 整合
- <strong>成本管理</strong>: 代幣追蹤與使用優化
- <strong>部署</strong>: 一條 `azd up` 指令完成整體設定

### [v3.6.0] - 2025-11-19

#### 重大更新：Container App 部署範例
**此版本引入使用 Azure Developer CLI (AZD) 的完整、可投入生產的容器應用部署範例，並將其納入教學路徑，附帶完整文件與整合說明。**

#### 新增
- **🚀 Container App 範例**: 在 `examples/container-app/` 中新增本機範例：
  - [Master Guide](examples/container-app/README.md): 容器化部署的完整概覽、快速上手、進入生產與進階模式
  - [Simple Flask API](../../examples/container-app/simple-flask-api): 適合初學者的 REST API，支援 scale-to-zero、健康檢查、監控與故障排除
  - [Microservices Architecture](../../examples/container-app/microservices): 生產就緒的多服務部署（API Gateway、Product、Order、User、Notification）、非同步訊息、Service Bus、Cosmos DB、Azure SQL、分散式追蹤、藍綠/金絲雀部署
- <strong>最佳實務</strong>: 容器工作負載的安全性、監控、成本優化與 CI/CD 指南
- <strong>程式範例</strong>: 完整的 `azure.yaml`、Bicep 範本與多語系服務實作（Python、Node.js、C#、Go）
- <strong>測試與故障排除</strong>: 端對端測試情境、監控指令、故障排除指引

#### 更動
- **README.md**: 更新以介紹並連結新的 Container App 範例（位於「本機範例 - 容器應用」）
- **examples/README.md**: 更新以強調容器應用範例、加入比較矩陣項目，並更新技術/架構參考
- <strong>課程大綱與學習指南</strong>: 更新以在相關章節參考新的容器應用範例與部署模式

#### 已驗證
- ✅ 所有新範例可透過 `azd up` 部署並符合最佳實務
- ✅ 文件交叉連結與導覽已更新
- ✅ 範例涵蓋從初學到進階的情境，包括生產級微服務

#### 注意事項
- <strong>範圍</strong>: 僅限英文文件與範例
- <strong>後續步驟</strong>: 在未來版本中擴充更多進階容器模式與 CI/CD 自動化

### [v3.5.0] - 2025-11-19

#### 產品重新命名：Microsoft Foundry
**此版本在所有英文文件中全面將產品名稱由 "Microsoft Foundry" 更名為 "Microsoft Foundry"，以反映 Microsoft 的官方品牌調整。**

#### 更動
- **🔄 產品名稱更新**: 完整將 "Microsoft Foundry" 更新為 "Microsoft Foundry"
  - 更新 `docs/` 資料夾內所有英文文件中的參考
  - 重新命名資料夾：`docs/ai-foundry/` → `docs/microsoft-foundry/`
  - 重新命名檔案：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 總計：在 7 個文件中更新 23 處內容參考

- **📁 資料夾結構變更**:
  - `docs/ai-foundry/` 重新命名為 `docs/microsoft-foundry/`
  - 所有交叉參考已更新以反映新資料夾結構
  - 導覽連結已於文件中驗證

- **📄 檔案重新命名**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 所有內部連結已更新以參照新檔名

#### 更新檔案
- <strong>章節文件</strong>（7 個檔案）:
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 處導覽連結更新
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 處產品名稱參考更新
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - 已使用 Microsoft Foundry（來自先前更新）
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 處參考更新（概覽、社群回饋、文件）
  - `docs/getting-started/azd-basics.md` - 4 處交叉參考連結更新
  - `docs/getting-started/first-project.md` - 2 處章節導覽連結更新
  - `docs/getting-started/installation.md` - 2 處下一章節連結更新
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 處參考更新（導覽、Discord 社群）
  - `docs/troubleshooting/common-issues.md` - 1 處導覽連結更新
  - `docs/troubleshooting/debugging.md` - 1 處導覽連結更新

- <strong>課程結構檔案</strong>（2 個檔案）:
  - `README.md` - 17 處參考更新（課程概覽、章節標題、範本區段、社群見解）
  - `course-outline.md` - 14 處參考更新（概覽、學習目標、章節資源）

#### 已驗證
- ✅ 英文文件中已無剩餘的 "ai-foundry" 資料夾路徑參考
- ✅ 英文文件中已無剩餘的 "Microsoft Foundry" 產品名稱參考
- ✅ 所有導覽連結於新資料夾結構下可正常運作
- ✅ 檔案與資料夾重新命名已成功完成
- ✅ 章節之間的交叉參考已驗證

#### 注意事項
- <strong>範圍</strong>: 變更僅套用於 `docs/` 資料夾中的英文文件
- <strong>翻譯</strong>: 本版本未更新翻譯資料夾（`translations/`）
- <strong>工作坊</strong>: 工作坊教材（`workshop/`）未在本版本更新
- <strong>範例</strong>: 範例檔案可能仍引用舊名稱（將在未來更新處理）
- <strong>外部連結</strong>: 外部 URL 與 GitHub 倉庫參考保持不變

#### 貢獻者遷移指南
If you have local branches or documentation referencing the old structure:
1. Update folder references: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update file references: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Replace product name: "Microsoft Foundry" → "Microsoft Foundry"
4. Validate all internal documentation links still work

---

### [v3.4.0] - 2025-10-24

#### 基礎設施預覽與驗證增強
**此版本引入對新的 Azure Developer CLI preview 功能的完整支援，並增強工作坊使用者體驗。**

#### 新增
- **🧪 azd provision --preview 功能文件**: 對新基礎設施預覽能力的完整說明
  - 指令參考與使用範例，收錄於備忘單
  - 在佈建指南中詳細整合使用情境與效益
  - 前置檢查整合以提供更安全的部署驗證
  - 入門指南更新，強調安全優先的部署實務
- **🚧 工作坊狀態橫幅**: 顯示工作坊開發狀態的專業 HTML 橫幅
  - 漸層設計與施工指示，清楚傳達使用者狀態
  - 最後更新時間戳以提升透明度
  - 支援行動裝置響應式設計

#### 強化
- <strong>基礎設施安全性</strong>: 預覽功能已整合至部署文件各處
- <strong>預部署驗證</strong>: 自動化腳本現在包含基礎設施預覽測試
- <strong>開發者工作流程</strong>: 更新的指令序列將預覽列為最佳實務
- <strong>工作坊體驗</strong>: 清楚設定使用者對內容開發狀態的期望

#### 更動
- <strong>部署最佳實務</strong>: 建議採用先預覽的工作流程
- <strong>文件流程</strong>: 將基礎設施驗證提早納入學習流程
- <strong>工作坊呈現</strong>: 使用專業狀態溝通顯示清晰的開發時間線

#### 改善
- <strong>安全優先方法</strong>: 在部署前可驗證基礎設施變更
- <strong>團隊協作</strong>: 預覽結果可供分享以供審查與核准
- <strong>成本意識</strong>: 在佈建前更了解資源成本
- <strong>風險緩解</strong>: 透過事先驗證降低部署失敗風險

#### 技術實作
- <strong>多文件整合</strong>: 預覽功能已於 4 個關鍵檔案中文件化
- <strong>指令模式</strong>: 在文件中維持一致的語法與範例
- <strong>最佳實務整合</strong>: 將預覽納入驗證工作流程與腳本
- <strong>視覺指示</strong>: 清楚標示 NEW 功能以利發現

#### 工作坊基礎設施
- <strong>狀態溝通</strong>: 使用具漸層樣式的專業 HTML 橫幅
- <strong>使用者體驗</strong>: 清楚展示開發狀態以避免混淆
- <strong>專業呈現</strong>: 在設置期望同時維持儲存庫的可信度
- <strong>時間線透明度</strong>: 最後更新時間戳為 2025 年 10 月，增進問責

### [v3.3.0] - 2025-09-24

#### 強化的工作坊教材與互動式學習體驗
**此版本推出完整的工作坊教材，包含可在瀏覽器中操作的互動式指南與結構化學習路徑。**

#### 新增
- **🎥 互動式工作坊指南**: 基於瀏覽器的工作坊體驗，具備 MkDocs 預覽功能
- **📝 結構化工作坊指示**: 從探索到自訂的 7 步引導學習路線
  - 0-Introduction: 工作坊概述與設定
  - 1-Select-AI-Template: 範本探索與選擇流程
  - 2-Validate-AI-Template: 部署與驗證程序
  - 3-Deconstruct-AI-Template: 了解範本架構
  - 4-Configure-AI-Template: 設定與自訂
  - 5-Customize-AI-Template: 進階修改與反覆調整
  - 6-Teardown-Infrastructure: 清理與資源管理
  - 7-Wrap-up: 摘要與後續步驟
- **🛠️ 工作坊工具**: 使用 Material 主題的 MkDocs 設定，以增強學習體驗
- **🎯 實作學習路徑**: 3 步方法論 (探索 → 部署 → 自訂)
- **📱 GitHub Codespaces 整合**: 無縫的開發環境設定

#### 強化
- **AI Workshop Lab**: 擴展為全面的 2-3 小時結構化學習體驗
- <strong>工作坊文件</strong>: 專業呈現，附有導覽與視覺輔助
- <strong>學習進程</strong>: 從範本選擇到生產部署的清晰逐步指引
- <strong>開發者體驗</strong>: 整合工具以簡化開發工作流程

#### 改進
- <strong>無障礙性</strong>: 基於瀏覽器的介面，具備搜尋、複製功能與主題切換
- <strong>自定進度學習</strong>: 彈性的工作坊結構，適應不同學習速度
- <strong>實務應用</strong>: 真實世界的 AI 範本部署情境
- <strong>社群整合</strong>: 整合 Discord 提供工作坊支援與協作

#### 工作坊功能
- <strong>內建搜尋</strong>: 快速關鍵字與課程搜尋
- <strong>複製程式碼區塊</strong>: 所有程式碼範例皆支援懸停複製功能
- <strong>主題切換</strong>: 支援深色/淺色模式以符合不同偏好
- <strong>視覺資產</strong>: 擁有截圖與圖表以增強理解
- <strong>協助整合</strong>: 直接透過 Discord 存取社群支援

### [v3.2.0] - 2025-09-17

#### 主要導覽重構與章節式學習系統
**此版本引入了全面的章節式學習結構，並在整個資源庫中增強導覽功能。**

#### 新增
- **📚 章節式學習系統**: 將整個課程重構為 8 個循序進階的學習章節
  - Chapter 1: 基礎與快速上手 (⭐ - 30-45 分鐘)
  - Chapter 2: AI 優先開發 (⭐⭐ - 1-2 小時)
  - Chapter 3: 設定與驗證 (⭐⭐ - 45-60 分鐘)
  - Chapter 4: 基礎架構即程式碼與部署 (⭐⭐⭐ - 1-1.5 小時)
  - Chapter 5: 多代理 AI 解決方案 (⭐⭐⭐⭐ - 2-3 小時)
  - Chapter 6: 預部署驗證與規劃 (⭐⭐ - 1 小時)
  - Chapter 7: 疑難排解與除錯 (⭐⭐ - 1-1.5 小時)
  - Chapter 8: 生產環境與企業方案 (⭐⭐⭐⭐ - 2-3 小時)
- **📚 完整的導覽系統**: 在所有文件中提供一致的導覽標頭與頁腳
- **🎯 進度追蹤**: 課程完成檢查表與學習驗證系統
- **🗺️ 學習路徑指引**: 為不同經驗層級與目標提供清晰的進入點
- **🔗 交叉參照導覽**: 清楚連結相關章節與先決條件

#### 強化
- **README 結構**: 轉變為以章節為基礎的結構化學習平台
- <strong>文件導覽</strong>: 每個頁面現在包含章節上下文與進度指引
- <strong>範本組織</strong>: 範例與範本已對應到適當的學習章節
- <strong>資源整合</strong>: 提示表、常見問題與學習指南已連結到相關章節
- <strong>工作坊整合</strong>: 實作實驗室對應到多個章節的學習目標

#### 變更
- <strong>學習進程</strong>: 從線性文件轉為彈性的章節式學習
- <strong>設定置放</strong>: 將設定指南重新定位為第 3 章以改善學習流程
- **AI 內容整合**: 在整個學習歷程中更好地整合 AI 特定內容
- <strong>生產內容</strong>: 將進階模式整合至第 8 章，供企業學習者使用

#### 改進
- <strong>使用者體驗</strong>: 清晰的導覽麵包屑與章節進度指示
- <strong>無障礙性</strong>: 一致的導覽模式以便於課程瀏覽
- <strong>專業呈現</strong>: 類大學課程式結構，適合學術與企業訓練
- <strong>學習效率</strong>: 透過改善的組織減少尋找相關內容的時間

#### 技術實作
- <strong>導覽標頭</strong>: 在 40+ 個文件中標準化章節導覽
- <strong>頁腳導覽</strong>: 一致的進度指引與章節完成指示
- <strong>交叉連結</strong>: 全面的內部連結系統，連結相關概念
- <strong>章節映射</strong>: 範本與範例已清楚與學習目標對應

#### 學習指南強化
- **📚 完整的學習目標**: 重新構建學習指南以配合 8 章系統
- **🎯 章節式評估**: 每章包含特定學習目標與實務練習
- **📋 進度追蹤**: 每週學習計畫，具可衡量的成果與完成檢查表
- **❓ 評量題目**: 每章的知識驗證題目，帶有專業成果
- **🛠️ 實務練習**: 含真實部署情境與故障排除的實作活動
- **📊 技能進展**: 從基礎概念到企業模式的明確進階，並聚焦職涯發展
- **🎓 證照框架**: 專業發展成果與社群認可機制
- **⏱️ 時間軸管理**: 結構化的 10 週學習計畫，含里程碑驗證

### [v3.1.0] - 2025-09-17

#### 強化的多代理 AI 解決方案
**此版本透過更佳的代理命名與增強的文件來改進多代理零售解決方案。**

#### 變更
- <strong>多代理術語</strong>: 在整個零售多代理解決方案中，已將 "Cora agent" 替換為 "Customer agent" 以便更清楚理解
- <strong>代理架構</strong>: 已更新所有文件、ARM 模板與程式碼範例，以使用一致的 "Customer agent" 命名
- <strong>設定範例</strong>: 以更新的命名慣例現代化代理設定模式
- <strong>文件一致性</strong>: 確保所有參考使用專業且具描述性的代理名稱

#### 強化
- **ARM 模板套件**: 已更新 retail-multiagent-arm-template，加入 Customer agent 參照
- <strong>架構圖</strong>: 使用更新的代理命名刷新 Mermaid 圖表
- <strong>程式碼範例</strong>: Python 類別與實作範例現在使用 CustomerAgent 命名
- <strong>環境變數</strong>: 已更新所有部署腳本以使用 CUSTOMER_AGENT_NAME 慣例

#### 改進
- <strong>開發者體驗</strong>: 文件中代理角色與責任更清晰
- <strong>生產就緒</strong>: 更符合企業命名慣例
- <strong>學習教材</strong>: 教育用途的代理命名更直觀
- <strong>範本可用性</strong>: 簡化對代理功能與部署模式的理解

#### 技術細節
- 更新了帶有 CustomerAgent 參照的 Mermaid 架構圖
- 在 Python 範例中將 CoraAgent 類別名稱替換為 CustomerAgent
- 修改 ARM 模板 JSON 配置以使用 "customer" 代理類型
- 將環境變數從 CORA_AGENT_* 更新為 CUSTOMER_AGENT_* 模式
- 刷新所有部署指令與容器配置

### [v3.0.0] - 2025-09-12

#### 重大變更 - 以 AI 開發者為重心及 Microsoft Foundry 整合
**此版本將資源庫轉變為完整的 AI 專注學習資源，並整合 Microsoft Foundry。**

#### 新增
- **🤖 AI 優先學習路徑**: 完整重構，優先考量 AI 開發者與工程師
- **Microsoft Foundry 整合指南**: 連接 AZD 與 Microsoft Foundry 服務的完整文件
- **AI 模型部署範式**: 詳細指南涵蓋模型選擇、設定與生產部署策略
- **AI Workshop Lab**: 2-3 小時的實作工作坊，將 AI 應用轉換為可由 AZD 部署的解決方案
- **生產 AI 最佳實務**: 適用企業的擴充、監控與保護 AI 工作負載的模式
- **AI 專屬疑難排解指南**: 針對 Microsoft Foundry Models、Cognitive Services 與 AI 部署問題的全面疑難排解
- **AI 範本集**: 精選 Microsoft Foundry 範本，附複雜度評等
- <strong>工作坊教材</strong>: 完整的工作坊結構，包含實作實驗室與參考資料

#### 強化
- **README 結構**: 以 AI 開發者為重點，來自 Microsoft Foundry Discord 的社群興趣數據為 45%
- <strong>學習路徑</strong>: 為 AI 開發者提供專屬旅程，同時保留學生與 DevOps 工程師的傳統路徑
- <strong>範本建議</strong>: 推薦的 AI 範本包括 azure-search-openai-demo、contoso-chat 與 openai-chat-app-quickstart
- <strong>社群整合</strong>: 加強的 Discord 社群支援，設有 AI 專屬頻道與討論

#### 安全與生產重點
- <strong>託管身分模式</strong>: AI 專屬的驗證與安全配置
- <strong>成本優化</strong>: AI 工作負載的代幣使用追蹤與預算控管
- <strong>多區域部署</strong>: 全球 AI 應用部署策略
- <strong>效能監控</strong>: AI 專屬指標與 Application Insights 整合

#### 文件品質
- <strong>線性課程結構</strong>: 從初學者到進階 AI 部署模式的邏輯進展
- **已驗證的 URL**: 所有外部資源庫連結已驗證並可存取
- <strong>完整參考</strong>: 所有內部文件連結已驗證且可用
- <strong>生產就緒</strong>: 含實際範例的企業部署模式

### [v2.0.0] - 2025-09-09

#### 重大變更 - 資源庫重構與專業化強化
**此版本代表資源庫結構與內容呈現的重大改造。**

#### 新增
- <strong>結構化學習框架</strong>: 所有文件頁面現在包含介紹、學習目標與學習成果章節
- <strong>導覽系統</strong>: 在所有文件中新增上一節/下一節連結，以引導學習進程
- <strong>學習指南</strong>: 完整的 study-guide.md，包含學習目標、練習題與評量資料
- <strong>專業呈現</strong>: 移除所有表情符號圖示，以提升無障礙性與專業外觀
- <strong>增強內容結構</strong>: 改善學習材料的組織與流程

#### 變更
- <strong>文件格式</strong>: 將所有文件標準化為一致的學習導向結構
- <strong>導覽流程</strong>: 在所有學習材料中實施邏輯進展
- <strong>內容呈現</strong>: 移除裝飾性元素，以清晰且專業的格式呈現
- <strong>連結結構</strong>: 更新所有內部連結以支援新的導覽系統

#### 改進
- <strong>無障礙性</strong>: 移除對表情符號的依賴，以提升螢幕閱讀器相容性
- <strong>專業外觀</strong>: 簡潔的學術風格呈現，適合企業學習
- <strong>學習體驗</strong>: 結構化方法，為每堂課提供清晰的目標與成果
- <strong>內容組織</strong>: 更好的邏輯流程與相關主題之間的連結

### [v1.0.0] - 2025-09-09

#### 初始發行 - 全面 AZD 學習資源庫

#### 新增
- <strong>核心文件結構</strong>
  - 完整的入門指南系列
  - 全面的部署與佈建文件
  - 詳細的疑難排解資源與除錯指南
  - 預部署驗證工具與程序

- <strong>入門模組</strong>
  - AZD Basics: 核心概念與術語
  - 安裝指南: 平台特定的設定說明
  - 設定指南: 環境設定與驗證
  - 第一個專案教學: 逐步的實作學習

- <strong>部署與佈建模組</strong>
  - 部署指南: 完整的工作流程文件
  - 佈建指南: 使用 Bicep 的基礎架構即程式碼
  - 生產部署最佳實務
  - 多服務架構模式

- <strong>預部署驗證模組</strong>
  - 容量規劃: Azure 資源可用性驗證
  - SKU 選擇: 完整的服務層級指引
  - 預檢查: 自動化驗證腳本 (PowerShell 與 Bash)
  - 成本估算與預算規劃工具

- <strong>疑難排解模組</strong>
  - 常見問題: 常遇到的問題與解決方案
  - 除錯指南: 系統化的疑難排解方法
  - 進階診斷技術與工具
  - 效能監控與優化

- <strong>資源與參考</strong>
  - 指令備忘單: 常用指令快速參考
  - 詞彙表: 完整的術語與縮寫定義
  - 常見問題集: 詳細解答常見問題
  - 外部資源連結與社群連結

- <strong>範例與範本</strong>
  - 簡單 Web 應用程式範例
  - 靜態網站部署範本
  - 容器應用配置
  - 資料庫整合模式
  - 微服務架構範例
  - 無伺服器函式實作

#### 功能
- <strong>跨平台支援</strong>: 提供 Windows、macOS 與 Linux 的安裝與設定指南
- <strong>多種技能等級</strong>: 內容設計涵蓋學生到專業開發者
- <strong>實務導向</strong>: 實作範例與真實情境
- <strong>完整涵蓋</strong>: 從基礎概念到進階企業模式
- <strong>安全優先策略</strong>: 在各處整合安全最佳實務
- <strong>成本優化</strong>: 提供具成本效益的部署與資源管理指引

#### 文件品質
- <strong>詳細程式碼範例</strong>: 實用且經測試的程式碼範例
- <strong>逐步指示</strong>: 清晰且可行的指引
- <strong>完整錯誤處理</strong>: 常見問題的疑難排解
- <strong>最佳實務整合</strong>: 產業標準與建議
- <strong>版本相容性</strong>: 與最新的 Azure 服務與 azd 功能保持最新

## 計畫中的未來增強

### Version 3.1.0 (計畫中)
#### AI 平台擴展
- <strong>多模型支援</strong>：整合 Hugging Face、Azure Machine Learning 與自訂模型 的模式
- **AI 代理框架**：LangChain、Semantic Kernel 與 AutoGen 部署範本
- **進階 RAG 模式**：Azure AI Search 以外的向量資料庫選項（Pinecone、Weaviate 等）
- **AI 可觀察性**：強化模型效能、token 使用與回應品質的監控

#### 開發者體驗
- **VS Code 擴充功能**：整合 AZD + Microsoft Foundry 的開發體驗
- **GitHub Copilot 整合**：AI 輔助的 AZD 範本生成功能
- <strong>互動式教學</strong>：含自動驗證的實作編碼練習，適用於 AI 場景
- <strong>教學影片</strong>：為視覺學習者補充的 AI 部署教學影片

### Version 4.0.0 (Planned)
#### 企業級 AI 模式
- <strong>治理框架</strong>：AI 模型治理、合規與稽核流程
- **多租戶 AI**：為多個客戶提供隔離 AI 服務的模式
- **邊緣 AI 部署**：與 Azure IoT Edge 與容器實例整合
- **混合雲 AI**：AI 工作負載的多雲與混合部署模式

#### 進階功能
- **AI 流程自動化**：與 Azure Machine Learning pipelines 的 MLOps 整合
- <strong>進階安全性</strong>：零信任模式、私有端點與進階威脅防護
- <strong>效能優化</strong>：高吞吐量 AI 應用的進階調整與擴展策略
- <strong>全球分佈</strong>：AI 應用的內容傳遞與邊緣快取模式

### Version 3.0.0 (Planned) - Superseded by Current Release
#### 建議新增項目 - 現已在 v3.0.0 中實作
- ✅ **以 AI 為中心的內容**：完整的 Microsoft Foundry 整合（已完成）
- ✅ <strong>互動式教學</strong>：實作型 AI 工作坊實驗室（已完成）
- ✅ <strong>進階安全模組</strong>：AI 專用的安全模式（已完成）
- ✅ <strong>效能優化</strong>：AI 工作負載調校策略（已完成）

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### 小幅增強 - 目前版本部分已完成
- ✅ <strong>額外範例</strong>：以 AI 為重點的部署情境（已完成）
- ✅ **延伸 FAQ**：AI 專用問題與疑難排解（已完成）
- <strong>工具整合</strong>：強化的 IDE 與編輯器整合指南
- ✅ <strong>監控擴展</strong>：AI 專用的監控與警示模式（已完成）

#### 仍規劃於未來版本
- <strong>行動友善文件</strong>：適合行動學習的響應式設計
- <strong>離線存取</strong>：可下載的文件套件
- **強化 IDE 整合**：為 AZD + AI 工作流程的 VS Code 擴充功能
- <strong>社群儀表板</strong>：即時社群指標與貢獻追蹤

## 為變更日誌做出貢獻

### 回報變更
當向此 repository 貢獻時，請確保變更日誌條目包含：

1. <strong>版本號</strong>：遵循語義化版本 (major.minor.patch)
2. <strong>日期</strong>：以 YYYY-MM-DD 格式的發布或更新日期
3. <strong>類別</strong>：新增、變更、已棄用、已移除、已修正、安全
4. <strong>清楚描述</strong>：簡潔描述變更內容
5. <strong>影響評估</strong>：說明變更如何影響既有使用者

### 變更類別

#### 新增
- 新功能、文件章節或能力
- 新範例、範本或學習資源
- 額外工具、腳本或實用程式

#### 變更
- 對既有功能或文件的修改
- 為提升清晰度或準確性而進行的更新
- 內容或組織架構的重構

#### 已棄用
- 正在淘汰的功能或做法
- 預定移除的文件章節
- 已有更佳替代方法的作法

#### 已移除
- 不再相關的功能、文件或範例
- 過時資訊或已棄用的方法
- 冗餘或已合併的內容

#### 已修正
- 文件或程式碼中的錯誤修正
- 已回報問題或問題的解決
- 精確度或功能性的改善

#### 安全
- 與安全相關的改進或修正
- 安全最佳實務的更新
- 安全漏洞的修補

### 語義化版本指南

#### 主要版本 (X.0.0)
- 需要使用者採取行動的破壞性變更
- 大幅重構內容或組織
- 改變根本方法或方法論的變更

#### 次要版本 (X.Y.0)
- 新功能或內容新增
- 保持向後相容的增強
- 額外範例、工具或資源

#### 修補版本 (X.Y.Z)
- 錯誤修正與修補
- 對既有內容的小幅改進
- 說明與小幅強化

## 社群回饋與建議

我們積極鼓勵社群回饋以改進此學習資源：

### 如何提供回饋
- **GitHub Issues**：回報問題或建議改進（歡迎 AI 專屬議題）
- **Discord Discussions**：分享想法並與 Microsoft Foundry 社群互動
- **Pull Requests**：直接對內容進行貢獻，特別是 AI 範本與指南
- **Microsoft Foundry Discord**：參與 #Azure 頻道討論 AZD + AI 主題
- <strong>社群論壇</strong>：參與更廣泛的 Azure 開發者討論

### 回饋類別
- **AI 內容準確性**：對 AI 服務整合與部署資訊的修正
- <strong>學習體驗</strong>：改善 AI 開發者學習流程的建議
- **缺少的 AI 內容**：要求新增 AI 範本、模式或範例
- <strong>無障礙</strong>：針對多元學習需求的改善
- **AI 工具整合**：改善 AI 開發工作流程整合的建議
- **生產級 AI 模式**：企業級 AI 部署模式的需求

### 回應承諾
- <strong>議題回應</strong>：於 48 小時內回應已回報的問題
- <strong>功能請求</strong>：於一週內評估
- <strong>社群貢獻</strong>：於一週內審查
- <strong>安全議題</strong>：立即優先處理並加速回應

## 維護計劃

### 定期更新
- <strong>每月檢視</strong>：內容準確性與連結驗證
- <strong>每季更新</strong>：主要內容新增與改進
- <strong>每半年檢視</strong>：全面重構與強化
- <strong>年度發行</strong>：重大版本更新與重要改進

### 監控與品質保證
- <strong>自動化測試</strong>：定期驗證程式碼範例與連結
- <strong>社群回饋整合</strong>：定期納入使用者建議
- <strong>技術更新</strong>：與最新 Azure 服務與 azd 發行保持一致
- <strong>無障礙稽核</strong>：定期檢視包容性設計原則

## 版本支援政策

### 目前版本支援
- <strong>最新主要版本</strong>：完整支援並定期更新
- <strong>前一主要版本</strong>：提供 12 個月的安全更新與重大修正
- <strong>舊版</strong>：僅社群支援，不提供正式更新

### 遷移指南
當發布主要版本時，我們會提供：
- <strong>遷移指南</strong>：逐步過渡說明
- <strong>相容性說明</strong>：關於破壞性變更的細節
- <strong>工具支援</strong>：協助遷移的腳本或工具
- <strong>社群支援</strong>：針對遷移問題的專門論壇

---

<strong>導覽</strong>
- <strong>上一課</strong>： [學習指南](resources/study-guide.md)
- <strong>下一課</strong>： 返回 [主要 README](README.md)

<strong>保持更新</strong>：追蹤此 repository 以接收有關新版本與學習材料重要更新的通知。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**:
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始語言版本之文件應被視為具權威性的來源。對於關鍵資訊，建議採用專業人工翻譯。我們對於因使用本翻譯而產生的任何誤解或誤譯概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->