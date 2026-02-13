# 變更日誌 - AZD For Beginners

## 介紹

此變更日誌記錄 AZD For Beginners 倉庫中所有重要的變更、更新與改進。我們遵循語義化版本控制原則並維護此日誌，以協助使用者了解不同版本之間的變動。

## 學習目標

閱讀此變更日誌後，你將能夠：
- 了解新增功能與內容項目
- 明白現有文件的改進內容
- 追蹤錯誤修正與更正以確保準確性
- 跟蹤學習材料隨時間的演進

## 學習成果

在檢閱變更紀錄後，你將能夠：
- 辨識可用的新內容與學習資源
- 了解哪些章節已被更新或改良
- 根據最新教材規劃你的學習路徑
- 提供回饋與建議以促進未來改進

## 版本歷史

### [v3.17.0] - 2026-02-05

#### Course Navigation Enhancement
**此版本改進 README.md 的章節導覽，採用增強的表格格式。**

#### Changed
- **課程地圖表格**：增強為直接課程連結、時長估計與難度評分
- **資料夾清理**：移除冗餘的舊資料夾 (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **連結驗證**：Course Map 表格中的 21+ 個內部連結全部已驗證

### [v3.16.0] - 2026-02-05

#### Product Name Updates
**此版本將產品參考更新為目前 Microsoft 品牌命名。**

#### Changed
- **Azure AI Foundry → Microsoft Foundry**：所有非翻譯檔案中的參考已更新
- **Azure AI Agent Service → Foundry Agents**：服務名稱已更新以反映當前品牌

#### Files Updated
- `README.md` - Main course landing page
- `changelog.md` - Version history
- `course-outline.md` - Course structure
- `docs/chapter-02-ai-development/agents.md` - AI agents guide
- `examples/README.md` - Examples documentation
- `workshop/README.md` - Workshop landing page
- `workshop/docs/index.md` - Workshop index
- `workshop/docs/instructions/*.md` - All workshop instruction files

---

### [v3.15.0] - 2026-02-05

#### Major Repository Restructuring: Chapter-Based Folder Names
**此版本將文件重構為專門的章節資料夾以便更清晰的導覽。**

#### Folder Renames
舊資料夾已替換為章節編號資料夾：
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- 新增：`docs/chapter-05-multi-agent/`

#### File Migrations
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

#### Added
- **📚 章節 README 檔案**：在每個章節資料夾建立 README.md，包含：
  - 學習目標與時長
  - 課程表格與說明
  - 快速開始指令
  - 與其他章節的導覽連結

#### Changed
- **🔗 更新所有內部連結**：跨所有文件更新了 78+ 個路徑
- **🗺️ 主 README.md**：使用新章節結構更新課程地圖
- **📝 examples/README.md**：更新指向章節資料夾的交叉參考

#### Removed
- 舊的資料夾結構 (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository Restructuring: Chapter Navigation
**此版本新增章節導覽 README 檔案（後來被 v3.15.0 取代）。**

---

### [v3.13.0] - 2026-02-05

#### New AI Agents Guide
**此版本新增一套完整指南，說明如何使用 Azure Developer CLI 部署 AI agents。**

#### Added
- **🤖 docs/microsoft-foundry/agents.md**：完整指南涵蓋：
  - 什麼是 AI agents 以及它們與聊天機器人的差異
  - 三個快速上手的 agent 範本（Foundry Agents、Prompty、RAG）
  - Agent 架構模式（單一 agent、RAG、多 agent）
  - 工具設定與客製化
  - 監控與指標追蹤
  - 成本考量與優化
  - 常見的故障排除情境
  - 三個實作練習與成功判定標準

#### Content Structure
- **Introduction**：為初學者說明 agent 概念
- **Quick Start**：使用 `azd init --template get-started-with-ai-agents` 部署 agents
- **Architecture Patterns**：agent 架構模式的視覺圖示
- **Configuration**：工具設定與環境變數
- **Monitoring**：Application Insights 整合
- **Exercises**：漸進式實作練習（每項 20-45 分鐘）

---

### [v3.12.0] - 2026-02-05

#### DevContainer Environment Update
**此版本更新開發容器組態，採用較新工具與更佳預設值，以提升 AZD 的學習體驗。**

#### Changed
- **🐳 Base Image**：從 `python:3.12-bullseye` 更新為 `python:3.12-bookworm`（最新的 Debian 穩定版）
- **📛 Container Name**：由 "Python 3" 重新命名為 "AZD for Beginners" 以增進清晰度

#### Added
- **🔧 新的 Dev Container 功能**：
  - 已安裝並啟用 Bicep 支援的 `azure-cli`
  - `node:20`（適用於 AZD 範本的 LTS 版本）
  - 用於範本管理的 `github-cli`
  - 用於容器應用部署的 `docker-in-docker`

- **🔌 埠轉發**：預先設定常見開發用埠：
  - 8000 (MkDocs 預覽)
  - 3000 (Web 應用)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 新增 VS Code 擴充套件**：
  - `ms-python.vscode-pylance` - 增強的 Python 智慧感知
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions 支援
  - `ms-azuretools.vscode-docker` - Docker 支援
  - `ms-azuretools.vscode-bicep` - Bicep 語言支援
  - `ms-azure-devtools.azure-resource-groups` - Azure 資源管理
  - `yzhang.markdown-all-in-one` - Markdown 編輯
  - `DavidAnson.vscode-markdownlint` - Markdown 檢查
  - `bierner.markdown-mermaid` - Mermaid 圖表支援
  - `redhat.vscode-yaml` - YAML 支援（用於 azure.yaml）
  - `eamodio.gitlens` - Git 視覺化
  - `mhutchie.git-graph` - Git 歷史

- **⚙️ VS Code 設定**：新增 Python 直譯器預設、儲存時格式化與空白字元修剪等設定

- **📦 更新 requirements-dev.txt**：
  - 新增 MkDocs minify 外掛
  - 新增 pre-commit 以維持程式碼品質
  - 新增 Azure SDK 套件（azure-identity、azure-mgmt-resource）

#### Fixed
- **Post-Create Command**：現在在容器啟動時驗證 AZD 與 Azure CLI 是否已安裝

---

### [v3.11.0] - 2026-02-05

#### Beginner-Friendly README Overhaul
**此版本大幅改善 README.md，使其對初學者更友善，並新增 AI 開發者所需的重要資源。**

#### Added
- **🆚 Azure CLI vs AZD 比較**：清楚說明何時使用每個工具並提供實際範例
- **🌟 精選 AZD 連結**：直接連結到社群範本資源與貢獻管道：
  - [Awesome AZD 資源庫](https://azure.github.io/awesome-azd/) - 200+ 可直接部署的範本
  - [提交範本](https://github.com/Azure/awesome-azd/issues) - 社群貢獻
- **🎯 快速啟動指南**：簡化為三步驟的入門段落（安裝 → 登入 → 部署）
- **📊 依經驗層級的導覽表**：根據開發者經驗提供清楚的起點建議

#### Changed
- **README 結構**：重組為漸進揭示方式 — 將關鍵資訊置前
- **介紹段落**：重寫以解釋對完全初學者的「`azd up` 的魔力」
- **移除重複內容**：刪除重複的故障排除章節
- **故障排除指令**：修正文檔中的 `azd logs` 參考，改用有效的 `azd monitor --logs`

#### Fixed
- **🔐 驗證指令**：在 cheat-sheet.md 中新增 `azd auth login` 與 `azd auth logout`
- **錯誤指令參考**：從 README 的故障排除章節移除仍存在的 `azd logs`

#### Notes
- **範圍**：變更套用於主要 README.md 與 resources/cheat-sheet.md
- **目標讀者**：改進特別針對初學 AZD 的開發者

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Command Accuracy Update
**此版本修正文件中不存在的 AZD 指令，確保所有程式範例使用有效的 Azure Developer CLI 語法。**

#### Fixed
- **🔧 移除不存在的 AZD 指令**：全面稽核並修正無效指令：
  - `azd logs`（不存在）→ 改為 `azd monitor --logs` 或使用 Azure CLI 替代
  - `azd service` 子指令（不存在）→ 改為使用 `azd show` 與 Azure CLI
  - `azd infra import/export/validate`（不存在）→ 移除或以有效替代方案取代
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` 旗標（不存在）→ 移除
  - `azd provision --what-if/--rollback` 旗標（不存在）→ 更新為使用 `--preview`
  - `azd config validate`（不存在）→ 改為 `azd config list`
  - `azd info`、`azd history`、`azd metrics`（不存在）→ 移除

- **📚 已更新的檔案以修正指令**：
  - `resources/cheat-sheet.md`：指令參考大幅改寫
  - `docs/deployment/deployment-guide.md`：修正回滾與部署策略
  - `docs/troubleshooting/debugging.md`：修正日誌分析章節
  - `docs/troubleshooting/common-issues.md`：更新故障排除指令
  - `docs/troubleshooting/ai-troubleshooting.md`：修正 AZD 除錯章節
  - `docs/getting-started/azd-basics.md`：修正監控指令
  - `docs/getting-started/first-project.md`：更新監控與除錯範例
  - `docs/getting-started/installation.md`：修正 help 與版本範例
  - `docs/pre-deployment/application-insights.md`：修正檢視日誌指令
  - `docs/pre-deployment/coordination-patterns.md`：修正 agent 除錯指令

- **📝 版本參考已更新**：
  - `docs/getting-started/installation.md`：將硬編碼的 `1.5.0` 版本改為通用 `1.x.x`，並附上 releases 連結

#### Changed
- **回滾策略**：文件改為使用基於 Git 的回滾（AZD 並無內建回滾功能）
- **日誌檢視**：將 `azd logs` 的參考替換為 `azd monitor --logs`、`azd monitor --live` 與 Azure CLI 指令
- **效能章節**：移除不存在的平行/增量部署旗標，提供有效的替代方案

#### 技術細節
- **有效的 AZD 指令**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **有效的 azd monitor 旗標**: `--live`, `--logs`, `--overview`
- **移除的功能**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### 注意事項
- **驗證**: 指令已依 Azure Developer CLI v1.23.x 驗證

---

### [v3.9.0] - 2026-02-05

#### 工作坊完成與文件品質更新
**此版本完成互動式工作坊模組、修復所有失效的文件連結，並提升使用 Microsoft AZD 的 AI 開發者整體內容品質。**

#### 新增
- **📝 CONTRIBUTING.md**: New contribution guidelines document with:
  - 清楚說明回報問題與提出變更的方法
  - 新內容的文件標準
  - 程式範例指南與提交訊息慣例
  - 社群參與資訊

#### 已完成
- **🎯 Workshop Module 7 (Wrap-up)**: Fully completed wrap-up module with:
  - 工作坊成果的完整摘要
  - 掌握的關鍵概念部分，涵蓋 AZD、範本 與 AI Foundry
  - 持續學習路徑建議
  - 工作坊挑戰練習並附難度評等
  - 社群回饋與支援連結

- **📚 Workshop Module 3 (Deconstruct)**: Updated learning objectives with:
  - GitHub Copilot 與 MCP 伺服器啟用指南
  - AZD 範本資料夾結構說明
  - 基礎設施即程式碼 (Bicep) 的組織模式
  - 實作實驗室指示

- **🔧 Workshop Module 6 (Teardown)**: Completed with:
  - 資源清理與成本管理目標
  - 使用 `azd down` 以安全地移除基礎設施
  - 已軟刪除認知服務的復原指南
  - 給 GitHub Copilot 與 Azure Portal 的額外探索提示

#### 修正
- **🔗 Broken Link Fixes**: Resolved 15+ broken internal documentation links:
  - `docs/ai-foundry/ai-model-deployment.md`: 已修正指向 microsoft-foundry-integration.md 的路徑
  - `docs/troubleshooting/ai-troubleshooting.md`: 已修正 ai-model-deployment.md 與 production-ai-practices.md 的路徑
  - `docs/getting-started/first-project.md`: 已以 deployment-guide.md 取代不存在的 cicd-integration.md
  - `examples/retail-scenario.md`: 已修正 FAQ 與 troubleshooting guide 的路徑
  - `examples/container-app/microservices/README.md`: 已修正 course home 與 deployment guide 的路徑
  - `resources/faq.md` and `resources/glossary.md`: 已更新 AI 章節參考
  - `course-outline.md`: 已修正 instructor guide 與 AI workshop lab 的參考

- **📅 Workshop Status Banner**: 已將狀態橫幅從 "Under Construction" 更新為啟用的工作坊狀態，日期為 February 2026
- **🔗 Workshop Navigation**: 修正 workshop README.md 中指向不存在 lab-1-azd-basics 資料夾的失效導覽連結

#### 變更
- **Workshop Presentation**: 移除 "under construction" 警告，工作坊現已完成並可使用
- **Navigation Consistency**: 確保所有工作坊模組具有正確的模組間導覽
- **Learning Path References**: 更新章節交叉參考以使用正確的 microsoft-foundry 路徑

#### 已驗證
- ✅ 所有英文 markdown 檔案的內部連結均有效
- ✅ 工作坊模組 0-7 已完成並具學習目標
- ✅ 章節與模組之間的導覽運作正常
- ✅ 內容適合使用 Microsoft AZD 的 AI 開發者
- ✅ 保持適合初學者的語言與結構
- ✅ CONTRIBUTING.md 提供對社群貢獻者的明確指引

#### 技術實作
- **Link Validation**: 以自動化 PowerShell 腳本驗證所有 .md 內部連結
- **Content Audit**: 手動檢視工作坊完整性與是否適合初學者
- **Navigation System**: 套用一致的章節與模組導覽模式

#### 注意事項
- **Scope**: 變更僅套用於英文文件
- **Translations**: 本版本未更新翻譯資料夾（自動翻譯將於稍後同步）
- **Workshop Duration**: 完整工作坊現提供 3-4 小時的實作學習

---

### [v3.8.0] - 2025-11-19

#### 進階文件：監控、安全與多代理模式
**此版本新增有關 Application Insights 整合、驗證模式與多代理協調以適用於生產部署的完整 A 級課程。**

#### 新增
- **📊 Application Insights Integration Lesson**: in `docs/pre-deployment/application-insights.md`:
  - 以 AZD 為重點的部署與自動佈署
  - Application Insights + Log Analytics 的完整 Bicep 範本
  - 含自訂遙測的可運作 Python 應用程式（超過 1,200 行）
  - AI/LLM 監控模式（Azure OpenAI 代幣/成本追蹤）
  - 6 個 Mermaid 圖表（架構、分散式追蹤、遙測流程）
  - 3 個實作練習（警示、儀表板、AI 監控）
  - Kusto 查詢範例與成本最佳化策略
  - 即時指標串流與即時偵錯
  - 學習時長 40-50 分鐘，具生產就緒模式

- **🔐 Authentication & Security Patterns Lesson**: in `docs/getting-started/authsecurity.md`:
  - 3 種驗證模式（連線字串、Key Vault、託管識別）
  - 用於安全部署的完整 Bicep 基礎設施範本
  - 整合 Azure SDK 的 Node.js 應用程式程式碼
  - 3 個完整練習（啟用託管識別、使用者指派識別、Key Vault 旋轉）
  - 安全最佳實務與 RBAC 設定
  - 疑難排解指南與成本分析
  - 生產就緒的免密碼驗證模式

- **🤖 Multi-Agent Coordination Patterns Lesson**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 種協調模式（序列、並行、階層、事件驅動、共識）
  - 完整的協調服務實作（Python/Flask，超過 1,500 行）
  - 3 個專門代理實作（Research, Writer, Editor）
  - 整合 Service Bus 以進行訊息佇列
  - 使用 Cosmos DB 做為分散式系統的狀態管理
  - 6 個 Mermaid 圖表顯示代理互動
  - 3 個進階練習（逾時處理、重試邏輯、斷路器）
  - 成本明細（$240-565/month）與最佳化策略
  - 整合 Application Insights 以進行監控

#### 強化
- **Pre-deployment Chapter**: 現在包含完整的監控與協調模式
- **Getting Started Chapter**: 增強專業的驗證模式
- **Production Readiness**: 從安全到可觀察性的完整涵蓋
- **Course Outline**: 已更新以參考第 3 與第 6 章的新課程

#### 變更
- **Learning Progression**: 在整個課程中更好地整合安全與監控
- **Documentation Quality**: 新課程維持一致的 A 級標準（95-97%）
- **Production Patterns**: 為企業部署提供完整端對端涵蓋

#### 改善
- **Developer Experience**: 從開發到生產監控的清晰路徑
- **Security Standards**: 專業的驗證與機密管理模式
- **Observability**: 與 AZD 完整整合的 Application Insights
- **AI Workloads**: 針對 Azure OpenAI 與多代理系統的專門監控

#### 已驗證
- ✅ 所有課程包含完整的可運作程式碼（非片段）
- ✅ 用於視覺學習的 Mermaid 圖表（3 個課程共 19 張）
- ✅ 含驗證步驟的實作練習（共 9 個）
- ✅ 可透過 `azd up` 部署的生產就緒 Bicep 範本
- ✅ 成本分析與最佳化策略
- ✅ 疑難排解指南與最佳實務
- ✅ 含驗證指令的知識檢查點

#### 文件評分結果
- **docs/pre-deployment/application-insights.md**: - Comprehensive monitoring guide
- **docs/getting-started/authsecurity.md**: - Professional security patterns
- **docs/pre-deployment/coordination-patterns.md**: - Advanced multi-agent architectures
- **Overall New Content**: - Consistent high-quality standards

#### 技術實作
- **Application Insights**: Log Analytics + custom telemetry + distributed tracing
- **Authentication**: Managed Identity + Key Vault + RBAC patterns
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestration
- **Monitoring**: Live metrics + Kusto queries + alerts + dashboards
- **Cost Management**: Sampling strategies, retention policies, budget controls

### [v3.7.0] - 2025-11-19

#### 文件品質改善與新的 Azure OpenAI 範例
**此版本提升整個倉庫的文件品質，並新增一個完整的 Azure OpenAI 部署範例，具 GPT-4 聊天介面。**

#### 新增
- **🤖 Azure OpenAI Chat Example**: Complete GPT-4 deployment with working implementation in `examples/azure-openai-chat/`:
  - Complete Azure OpenAI infrastructure (GPT-4 model deployment)
  - Python command-line chat interface with conversation history
  - Key Vault integration for secure API key storage
  - Token usage tracking and cost estimation
  - Rate limiting and error handling
  - Comprehensive README with 35-45 minute deployment guide
  - 11 production-ready files (Bicep templates, Python app, configuration)
- **📚 Documentation Exercises**: Added hands-on practice exercises to configuration guide:
  - Exercise 1: Multi-environment configuration (15 minutes)
  - Exercise 2: Secret management practice (10 minutes)
  - Clear success criteria and verification steps
- **✅ Deployment Verification**: Added verification section to deployment guide:
  - Health check procedures
  - Success criteria checklist
  - Expected outputs for all deployment commands
  - Troubleshooting quick reference

#### 強化
- **examples/README.md**: Updated to A-grade quality (93%):
  - Added azure-openai-chat to all relevant sections
  - Updated local example count from 3 to 4
  - Added to AI Application Examples table
  - Integrated into Quick Start for Intermediate Users
  - Added to Microsoft Foundry Templates section
  - Updated Comparison Matrix and technology finding sections
- **Documentation Quality**: Improved B+ (87%) → A- (92%) across docs folder:
  - Added expected outputs to critical command examples
  - Included verification steps for configuration changes
  - Enhanced hands-on learning with practical exercises

#### 變更
- **Learning Progression**: 更好地為中階學習者整合 AI 範例
- **Documentation Structure**: 更具可執行性的練習並具明確成果
- **Verification Process**: 在關鍵工作流程中新增明確的成功標準

#### 改善
- **Developer Experience**: Azure OpenAI 部署現在需時 35-45 分鐘（相較於複雜選項的 60-90 分鐘）
- **Cost Transparency**: 對 Azure OpenAI 範例提供明確的成本估算（$50-200/month）
- **Learning Path**: AI 開發者有清晰的進入點 azure-openai-chat
- **Documentation Standards**: 一致的預期輸出與驗證步驟

#### 已驗證
- ✅ Azure OpenAI 範例可透過 `azd up` 完整運作
- ✅ 所有 11 個實作檔案語法正確
- ✅ README 指示與實際部署體驗相符
- ✅ 文件連結已在 8+ 個位置更新
- ✅ 範例索引正確反映 4 個本地範例
- ✅ 表格中無重複外部連結
- ✅ 所有導覽參考正確

#### 技術實作
- **Azure OpenAI Architecture**: GPT-4 + Key Vault + Container Apps pattern
- **Security**: Managed Identity ready, secrets in Key Vault
- **Monitoring**: Application Insights integration
- **Cost Management**: Token tracking and usage optimization
- **Deployment**: Single `azd up` command for complete setup

### [v3.6.0] - 2025-11-19

#### 重大更新：Container App 部署範例
**此版本引入完整的、生產就緒的容器應用程式部署範例，使用 Azure Developer CLI (AZD)，並完整文件化且整合進學習路徑。**

#### 新增
- **🚀 Container App Examples**: New local examples in `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Complete overview of containerized deployments, quick start, production, and advanced patterns
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Beginner-friendly REST API with scale-to-zero, health probes, monitoring, and troubleshooting
  - [Microservices Architecture](../../examples/container-app/microservices): Production-ready multi-service deployment (API Gateway, Product, Order, User, Notification), async messaging, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **Best Practices**: Security, monitoring, cost optimization, and CI/CD guidance for containerized workloads
- **Code Samples**: Complete `azure.yaml`, Bicep templates, and multi-language service implementations (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: End-to-end test scenarios, monitoring commands, troubleshooting guidance

#### 變更
- **README.md**: Updated to feature and link new container app examples under "Local Examples - Container Applications"
- **examples/README.md**: Updated to highlight container app examples, add comparison matrix entries, and update technology/architecture references
- **課程大綱與學習指南**: 已更新以在相關章節引用新的容器應用程式範例與部署模式

#### 已驗證
- ✅ 所有新範例均可使用 `azd up` 部署並遵循最佳實務
- ✅ 文件交叉連結與導覽已更新
- ✅ 範例涵蓋從入門到進階情境，包括生產環境微服務

#### 備註
- **範疇**：僅限英文文件與範例
- **後續步驟**：在未來版本擴充更多進階容器模式與 CI/CD 自動化

### [v3.5.0] - 2025-11-19

#### 產品重新命名：Microsoft Foundry
**此版本在所有英文文件中實施了從 "Microsoft Foundry" 到 "Microsoft Foundry" 的全面產品名稱變更，以反映 Microsoft 的官方重新品牌策略。**

#### 變更
- **🔄 產品名稱更新**：從 "Microsoft Foundry" 到 "Microsoft Foundry" 的完整重新命名
  - 更新了 `docs/` 資料夾中所有英文文件的參考
  - `docs/ai-foundry/` → `docs/microsoft-foundry/` 的資料夾重新命名
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md` 的檔案重新命名
  - 合計：在 7 個文件中更新了 23 處內容參考

- **📁 資料夾結構變更**：
  - `docs/ai-foundry/` 已重新命名為 `docs/microsoft-foundry/`
  - 所有交叉參考已更新以反映新的資料夾結構
  - 導覽連結已在所有文件中驗證

- **📄 檔案重新命名**：
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 所有內部連結已更新為參照新檔名

#### 已更新檔案
- **章節文件** (7 個檔案):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 個導覽連結已更新
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 個產品名稱參考已更新
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - 已經在使用 Microsoft Foundry（來自先前更新）
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 處參考已更新（總覽、社群回饋、文件）
  - `docs/getting-started/azd-basics.md` - 4 個交叉參考連結已更新
  - `docs/getting-started/first-project.md` - 2 個章節導覽連結已更新
  - `docs/getting-started/installation.md` - 2 個下一章節連結已更新
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 處參考已更新（導覽、Discord 社群）
  - `docs/troubleshooting/common-issues.md` - 1 個導覽連結已更新
  - `docs/troubleshooting/debugging.md` - 1 個導覽連結已更新

- **課程結構檔案** (2 個檔案):
  - `README.md` - 17 處參考已更新（課程概覽、章節標題、範本區段、社群見解）
  - `course-outline.md` - 14 處參考已更新（概覽、學習目標、章節資源）

#### 已驗證
- ✅ 英文文件中不再遺留任何 "ai-foundry" 資料夾路徑參考
- ✅ 英文文件中不再遺留任何 "Microsoft Foundry" 產品名稱參考
- ✅ 所有導覽連結在新資料夾結構下皆可正常運作
- ✅ 檔案與資料夾重新命名已成功完成
- ✅ 章節間的交叉參考已驗證

#### 備註
- **範疇**：變更僅套用於 `docs/` 資料夾中的英文文件
- **翻譯**：翻譯資料夾（`translations/`）在此版本未更新
- **工作坊**：工作坊教材（`workshop/`）在此版本未更新
- **範例**：範例檔案可能仍引用舊有命名（將在未來更新中處理）
- **外部連結**：外部 URL 與 GitHub 倉庫參考維持不變

#### 給貢獻者的遷移指南
如果您有本地分支或文件仍參考舊結構：
1. 更新資料夾參考：`docs/ai-foundry/` → `docs/microsoft-foundry/`
2. 更新檔案參考：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. 取代產品名稱： "Microsoft Foundry" → "Microsoft Foundry"
4. 驗證所有內部文件連結仍可使用

---

### [v3.4.0] - 2025-10-24

#### 基礎設施預覽與驗證增強
**此版本加入對全新 Azure Developer CLI 預覽功能的完整支援，並提升工作坊使用者體驗。**

#### 新增
- **🧪 azd provision --preview 功能文件**：全面涵蓋新的基礎設施預覽能力
  - 命令參考與捷徑表中的用法範例
  - 在預配指南中詳述整合、使用情境與效益
  - 為更安全的部署驗證整合預檢查流程
  - 開始指南更新以納入優先安全的部署實務
- **🚧 工作坊狀態橫幅**：專業的 HTML 橫幅，用以指出工作坊開發狀態
  - 漸層設計搭配施工指示，清楚傳達給使用者
  - 顯示最後更新時間以提升透明度
  - 對所有裝置類型採行行動響應式設計

#### 強化
- **基礎設施安全**：預覽功能已整合到整個部署文件中
- **部署前驗證**：自動化腳本現在包含基礎設施預覽測試
- **開發者工作流程**：更新命令序列以將預覽納入最佳實務
- **工作坊體驗**：為使用者設定明確的內容開發狀態期待

#### 已變更
- **部署最佳實務**：建議採用先預覽再部署的流程
- **文件流程**：基礎設施驗證提前納入學習流程
- **工作坊呈現**：以專業方式傳達狀態並提供清晰的開發時程

#### 改善
- **以安全為先的作法**：現在可在部署前驗證基礎設施變更
- **團隊協作**：預覽結果可分享以供審查與核准
- **成本意識**：在預配前更清楚資源成本
- **風險緩解**：藉由預先驗證降低部署失敗風險

#### 技術實作
- **多文件整合**：預覽功能已在 4 個關鍵文件中記錄
- **命令範式**：文件中保持一致的語法與範例
- **最佳實務整合**：在驗證工作流程與腳本中包含預覽
- **視覺指引**：明確標示 NEW 功能以利發現

#### 工作坊基礎設施
- **狀態傳達**：專業的 HTML 橫幅搭配漸層樣式
- **使用者體驗**：清楚的開發狀態避免混淆
- **專業呈現**：在設定期待的同時維持倉庫的可信度
- **時間軸透明化**：最後更新時間為 2025 年 10 月，以示問責

### [v3.3.0] - 2025-09-24

#### 強化的工作坊教材與互動式學習體驗
**此版本引入完整的工作坊教材，包含瀏覽器內互動式導覽與結構化學習路徑。**

#### 新增
- **🎥 互動式工作坊導覽**：具備 MkDocs 預覽功能的瀏覽器內工作坊體驗
- **📝 結構化工作坊指引**：從探索到客製化的 7 步引導學習路徑
  - 0-Introduction: 工作坊概覽與設定
  - 1-Select-AI-Template: 範本發掘與選擇流程
  - 2-Validate-AI-Template: 部署與驗證程序
  - 3-Deconstruct-AI-Template: 理解範本架構
  - 4-Configure-AI-Template: 設定與客製化
  - 5-Customize-AI-Template: 進階修改與迭代
  - 6-Teardown-Infrastructure: 清理與資源管理
  - 7-Wrap-up: 總結與後續步驟
- **🛠️ 工作坊工具鏈**：使用 Material 主題的 MkDocs 設定以提升學習體驗
- **🎯 實作學習路徑**：3 步方法論（探索 → 部署 → 客製化）
- **📱 GitHub Codespaces 整合**：無縫的開發環境設定

#### 強化
- **AI 工作坊實驗室**：擴展為完整的 2-3 小時結構化學習體驗
- **工作坊文件**：專業呈現並搭配導覽與視覺輔助
- **學習進程**：從範本選擇到生產部署的逐步清晰指引
- **開發者體驗**：整合工具以簡化開發工作流程

#### 改善
- **無障礙**：瀏覽器介面具搜尋、複製功能與主題切換
- **自我節奏學習**：彈性的工作坊結構適應不同學習速度
- **實務應用**：真實世界的 AI 範本部署情境
- **社群整合**：整合 Discord 以提供工作坊支援與協作

#### 工作坊特色
- **內建搜尋**：快速關鍵字與課程查找
- **複製程式區塊**：所有程式範例支援懸停複製
- **主題切換**：支援深色/淺色模式
- **視覺資產**：截圖與流程圖以增進理解
- **協助整合**：直接連結 Discord 以取得社群支援

### [v3.2.0] - 2025-09-17

#### 重組導覽與章節化學習系統
**此版本導入完整的章節化學習結構，並在整個倉庫中增強導覽。**

#### 新增
- **📚 章節化學習系統**：將整個課程重組為 8 個循序漸進的學習章節
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 全面導覽系統**：在所有文件中使用一致的導覽標頭與頁尾
- **🎯 進度追蹤**：課程完成檢核表與學習驗證系統
- **🗺️ 學習路徑指引**：為不同經驗層級與目標提供明確的切入點
- **🔗 交叉參考導覽**：明確連結相關章節與先決條件

#### 強化
- **README 結構**：轉變為具有章節式組織的結構化學習平台
- **文件導覽**：每一頁現在包含章節上下文與進度指引
- **範本組織**：範例與範本對應至適當的學習章節
- **資源整合**：捷徑表、常見問答與學習指南連結至相關章節
- **工作坊整合**：實作實驗室對應多章節的學習目標

#### 已變更
- **學習進程**：由線性文件轉為彈性的章節化學習
- **設定文件位置**：將設定指南重新定位為第 3 章以改善學習流程
- **AI 內容整合**：在整體學習旅程中更好地整合 AI 專屬內容
- **生產內容**：進階模式集中在第 8 章供企業學習者使用

#### 改善
- **使用者體驗**：清晰的導覽麵包屑與章節進度指示
- **無障礙**：一致的導覽模式便於課程瀏覽
- **專業呈現**：大學式課程結構適合學術與企業訓練
- **學習效率**：透過改進組織減少尋找相關內容的時間

#### 技術實作
- **導覽標頭**：在 40 多個文件中標準化章節導覽
- **頁尾導覽**：一致的進度指引與章節完成指示
- **交叉連結**：建立全面的內部連結系統以連接相關概念
- **章節對應**：將範本與範例清楚對應至學習目標

#### 學習指南增強
- **📚 完整學習目標**：將學習指南重構以對齊 8 章系統
- **🎯 章節評估**：每章包含明確的學習目標與實作練習
- **📋 進度追蹤**：每週學習計畫含可衡量的成果與完成檢核表
- **❓ 評量題目**：每章提供知識驗證題目以達成專業結果
- **🛠️ 實務練習**：具真實部署情境與除錯的動手活動
- **📊 技能成長**：從基礎概念到企業模式的清晰進階與職涯發展重點
- **🎓 認證架構**：專業發展成果與社群認可系統
- **⏱️ 時程管理**：結構化的 10 週學習計畫與里程碑驗證

### [v3.1.0] - 2025-09-17

#### 強化的多代理 AI 解決方案
**此版本改善了零售多代理解決方案，包含更好的代理命名與強化的文件。**

#### 變更
- **多代理術語**：在整個零售多代理解決方案中，將 "Cora agent" 替換為 "Customer agent" 以利更清楚理解
- **代理架構**：更新所有文件、ARM 範本與程式範例以使用一致的 "Customer agent" 命名
- **設定範例**：以更新後的命名慣例現代化代理設定模式
- **文件一致性**：確保所有參考使用專業且具描述性的代理名稱

#### 強化
- **ARM 範本套件**：更新 retail-multiagent-arm-template，改用 Customer agent 參考
- **架構圖**：以更新後的代理命名刷新 Mermaid 圖表
- **程式範例**：Python 類別與實作範例現改用 CustomerAgent 命名
- **環境變數**：更新所有部署腳本以使用 CUSTOMER_AGENT_NAME 慣例

#### 改善
- **開發者體驗**: 在文件中更清楚地說明代理的角色和職責
- **生產就緒**: 與企業命名慣例更好的一致性
- **學習教材**: 為教學用途提供更直覺的代理命名
- **範本可用性**: 簡化對代理功能與部署模式的理解

#### 技術細節
- 更新了包含 CustomerAgent 參考的 Mermaid 架構圖
- 在 Python 範例中將 CoraAgent 類名替換為 CustomerAgent
- 修改 ARM 範本 JSON 配置以使用 "customer" agent 類型
- 將環境變數從 CORA_AGENT_* 更新為 CUSTOMER_AGENT_* 模式
- 更新了所有部署命令與容器配置

### [v3.0.0] - 2025-09-12

#### 主要變更 - 面向 AI 開發者的重點與 Microsoft Foundry 整合
**此版本將儲存庫轉變為包含 Microsoft Foundry 整合的完整 AI 為先學習資源。**

#### 新增
- **🤖 以 AI 為先的學習路徑**: 完整重構，優先針對 AI 開發者與工程師
- **Microsoft Foundry 整合指南**: 用於將 AZD 與 Microsoft Foundry 服務連接的完整文件
- **AI 模型部署模式**: 涵蓋模型選擇、配置與生產部署策略的詳細指南
- **AI 工作坊實驗室**: 2-3 小時的實作工作坊，將 AI 應用轉換為可由 AZD 部署的解決方案
- **生產 AI 最佳實務**: 用於擴展、監控與保護 AI 工作負載的企業就緒模式
- **AI 專屬疑難排解指南**: 針對 Azure OpenAI、Cognitive Services 與 AI 部署問題的完整疑難排解
- **AI 範本畫廊**: 精選 Microsoft Foundry 範本，並附複雜度評級
- **工作坊教材**: 完整的工作坊架構，包含實作實驗與參考資料

#### 強化
- **README 結構**: 以 AI 開發者為主，根據 Microsoft Foundry Discord 的社群興趣資料顯示 45%
- **學習路徑**: 為 AI 開發者設立專屬旅程，同時保留給學生與 DevOps 工程師的傳統路徑
- **範本推薦**: 精選 AI 範本，包括 azure-search-openai-demo、contoso-chat 及 openai-chat-app-quickstart
- **社群整合**: 強化 Discord 社群支援，新增 AI 專屬頻道與討論

#### 安全與生產重點
- **Managed Identity 模式**: AI 專屬驗證與安全配置
- **成本優化**: AI 工作負載的 Token 使用追蹤與預算控制
- **多地區部署**: 全球 AI 應用部署策略
- **效能監控**: AI 專屬指標與 Application Insights 整合

#### 文件品質
- **線性課程結構**: 從入門到進階 AI 部署模式的邏輯進程
- **已驗證的 URL**: 所有外部儲存庫連結皆已驗證並可存取
- **完整參考**: 所有內部文件連結皆已驗證且可運作
- **生產就緒**: 具備實務範例的企業部署模式

### [v2.0.0] - 2025-09-09

#### 主要變更 - 儲存庫重構與專業化提升
**此版本代表對儲存庫結構與內容呈現的重大改造。**

#### 新增
- **結構化學習框架**: 所有文件頁面現在包含 Introduction、Learning Goals 與 Learning Outcomes 區段
- **導覽系統**: 在所有文件中新增 Previous/Next 課程連結，以引導學習進程
- **學習指南**: 完整的 study-guide.md，包含學習目標、練習題與評量材料
- **專業化呈現**: 移除所有 emoji 圖示以提升可及性與專業外觀
- **內容結構強化**: 改善學習材料的組織與流程

#### 變更
- **文件格式**: 將所有文件標準化為一致的以學習為導向結構
- **導覽流程**: 實作各學習材料之間的邏輯進程
- **內容呈現**: 移除裝飾性元素，以清晰、專業的格式替代
- **連結結構**: 更新所有內部連結以支援新版導覽系統

#### 改善
- **可及性**: 移除 emoji 相依以改善螢幕閱讀器相容性
- **專業外觀**: 採用乾淨、學術風格的呈現，適合企業學習
- **學習體驗**: 為每節課提供清楚的目標與學習成果
- **內容組織**: 改善相關主題之間的邏輯流與連結

### [v1.0.0] - 2025-09-09

#### 初始釋出 - 完整的 AZD 學習儲存庫

#### 新增
- **核心文件結構**
  - 完整的入門指南系列
  - 全面的部署與佈建文件
  - 詳細的疑難排解資源與除錯指南
  - 部署前驗證工具與程序

- **入門模組**
  - AZD 基礎: 核心概念與術語
  - 安裝指南: 平台特定的設定說明
  - 設定指南: 環境設定與驗證
  - 第一個專案教學: 逐步的實作學習

- **部署與佈建模組**
  - 部署指南: 完整工作流程文件
  - 佈建指南: 使用 Bicep 的基礎架構即程式碼
  - 生產部署的最佳實務
  - 多服務架構模式

- **部署前驗證模組**
  - 容量規劃: Azure 資源可用性驗證
  - SKU 選擇: 全面性服務層級指引
  - 預檢檢查: 自動驗證腳本（PowerShell 與 Bash）
  - 成本估算與預算規劃工具

- **疑難排解模組**
  - 常見問題: 常見問題與解決方案
  - 除錯指南: 系統化的疑難排解方法
  - 進階診斷技術與工具
  - 效能監控與優化

- **資源與參考**
  - 指令速查表: 必要指令的快速參考
  - 術語表: 全面性的術語與縮寫定義
  - 常見問答: 對常見問題的詳細解答
  - 外部資源連結與社群連結

- **範例與範本**
  - 簡單的網頁應用範例
  - 靜態網站部署範本
  - 容器應用配置
  - 資料庫整合模式
  - 微服務架構範例
  - 無伺服器函式實作

#### 特性
- **跨平台支援**: Windows、macOS 與 Linux 的安裝與設定指南
- **多種技能層級**: 內容適用於學生到專業開發者
- **實務導向**: 實作範例與真實世界情境
- **全面涵蓋**: 從基本概念到進階企業模式
- **安全優先**: 整合安全最佳實務
- **成本優化**: 提供成本效益的部署與資源管理建議

#### 文件品質
- **詳細程式碼範例**: 實用且經測試的程式碼範例
- **逐步指引**: 清楚且可行的操作指示
- **完整錯誤處理**: 常見問題的疑難排解
- **最佳實務整合**: 採用業界標準與建議
- **版本相容性**: 與最新 Azure 服務與 azd 功能保持一致

## 計劃中的未來增強功能

### Version 3.1.0 (Planned)
#### AI 平台擴展
- **多模型支援**: 與 Hugging Face、Azure Machine Learning 及自訂模型的整合模式
- **AI 代理框架**: LangChain、Semantic Kernel 與 AutoGen 部署範本
- **進階 RAG 模式**: 提供 Azure AI Search 之外的向量資料庫選項（Pinecone、Weaviate 等）
- **AI 可觀察性**: 加強模型效能、Token 使用與回應品質的監控

#### 開發者體驗
- **VS Code 擴充套件**: 整合 AZD + AI Foundry 的開發體驗
- **GitHub Copilot 整合**: AI 助手生成 AZD 範本
- **互動式教學**: 具自動驗證的 AI 情境實作練習
- **影片內容**: 針對視覺學習者的 AI 部署補充教學影片

### Version 4.0.0 (Planned)
#### 企業級 AI 模式
- **治理框架**: AI 模型治理、合規與稽核紀錄
- **多租戶 AI**: 為多個客戶提供隔離 AI 服務的模式
- **邊緣 AI 部署**: 與 Azure IoT Edge 及容器實例的整合
- **混合雲 AI**: AI 工作負載的多雲與混合部署模式

#### 進階功能
- **AI 管道自動化**: 與 Azure Machine Learning 管道的 MLOps 整合
- **進階安全性**: 零信任模式、私人端點與進階威脅防護
- **效能優化**: 高吞吐量 AI 應用的進階調校與擴展策略
- **全球分佈**: AI 應用的內容傳遞與邊緣快取模式

### Version 3.0.0 (Planned) - 已被目前版本取代
#### 建議新增項目 - 現已在 v3.0.0 中實作
- ✅ **以 AI 為主的內容**: 完整的 Microsoft Foundry 整合（已完成）
- ✅ **互動式教學**: 實作型 AI 工作坊實驗室（已完成）
- ✅ **進階安全模組**: AI 專屬的安全模式（已完成）
- ✅ **效能優化**: AI 工作負載的調校策略（已完成）

### Version 2.1.0 (Planned) - 部分在 v3.0.0 中實作
#### 次要增強 - 目前版本已部分完成
- ✅ **附加範例**: 以 AI 為焦點的部署情境（已完成）
- ✅ **擴充常見問答**: AI 專屬問題與疑難排解（已完成）
- **工具整合**: 增強 IDE 與編輯器整合指南
- ✅ **監控擴充**: AI 專屬的監控與警示模式（已完成）

#### 仍計劃於未來版本實作
- **行動友善文件**: 為行動學習設計的響應式介面
- **離線存取**: 可下載的文件套件
- **強化 IDE 整合**: 為 AZD + AI 工作流程開發的 VS Code 擴充套件
- **社群儀表板**: 實時社群統計與貢獻追蹤

## 對變更記錄的貢獻

### 報告變更
在為此儲存庫貢獻時，請確保變更記錄條目包含：

1. **版本號**: 遵循語意化版本 (major.minor.patch)
2. **日期**: 發佈或更新日期，格式為 YYYY-MM-DD
3. **類別**: Added、Changed、Deprecated、Removed、Fixed、Security
4. **清楚描述**: 簡潔說明變更內容
5. **影響評估**: 說明變更如何影響現有使用者

### 變更類別

#### 新增
- 新功能、文件區段或能力
- 新範例、範本或學習資源
- 額外工具、腳本或實用程式

#### 變更
- 對現有功能或文件的修改
- 為提高清晰度或準確性所做的更新
- 內容或組織結構的重整

#### 已棄用
- 正在逐步淘汰的功能或方法
- 計劃移除的文件區段
- 有更佳替代方法的舊有作法

#### 移除
- 不再相關的功能、文件或範例
- 過時或已棄用的資訊
- 冗餘或已合併的內容

#### 修復
- 文件或程式碼中的錯誤修正
- 已回報問題或錯誤的解決
- 提升準確性或功能性的改進

#### 安全
- 與安全相關的改進或修補
- 安全最佳實務的更新
- 安全漏洞的修復

### 語意化版本指引

#### 主要版本 (X.0.0)
- 需要使用者採取行動的破壞性變更
- 顯著的內容或組織重構
- 改變基本方法或方法論的變更

#### 次要版本 (X.Y.0)
- 新功能或內容新增
- 保持向後相容性的強化
- 額外範例、工具或資源

#### 修補版本 (X.Y.Z)
- 錯誤修正與更正
- 對現有內容的微小改進
- 說明與小幅改善

## 社群回饋與建議

我們積極鼓勵社群回饋以改進此學習資源：

### 如何提供回饋
- **GitHub Issues**: 回報問題或提出改進建議（歡迎 AI 相關議題）
- **Discord Discussions**: 分享想法並與 Microsoft Foundry 社群互動
- **Pull Requests**: 直接為內容（特別是 AI 範本與指南）貢獻改進
- **Microsoft Foundry Discord**: 於 #Azure 頻道參與 AZD + AI 討論
- **社群論壇**: 參與更廣泛的 Azure 開發者討論

### 回饋類別
- **AI 內容準確性**: 對 AI 服務整合與部署資訊的修正
- **學習體驗**: 改進 AI 開發者學習流程的建議
- **缺少的 AI 內容**: 針對額外 AI 範本、模式或範例的需求
- **可及性**: 為多元學習需求做出的改進建議
- **AI 工具整合**: 改善 AI 開發工作流程整合的建議
- **生產 AI 模式**: 企業 AI 部署模式的需求建議

### 回應承諾
- **議題回覆**: 在 48 小時內回覆已回報問題
- **功能請求**: 在一週內進行評估
- **社群貢獻**: 在一週內審查
- **安全議題**: 為優先事項，並加速處理回應

## 維護時程

### 定期更新
- **每月檢閱**: 內容準確性與連結驗證
- **每季更新**: 主要內容新增與改進
- **半年檢閱**: 全面性的重構與強化
- **年度發行**: 重大版本更新與重大改進

### 監控與品質保證
- **自動化測試**: 定期驗證程式碼範例與連結
- **社群回饋整合**: 定期納入使用者建議
- **技術更新**: 與最新 Azure 服務與 azd 發佈保持一致
- **可及性稽核**: 定期檢視以符合包容性設計原則

## 版本支援政策

### 目前版本支援
- **最新主要版本**: 提供完整支援並定期更新
- **前一主要版本**: 提供 12 個月的安全更新與重大修補
- **舊版**: 僅由社群支援，不提供官方更新

### 遷移指引
當釋出主要版本時，我們會提供：
- **遷移指南**: 逐步遷移指引
- **相容性說明**: 關於破壞性變更的詳細資訊
- **工具支援**: 協助遷移的腳本或實用工具
- **社群支援**: 專門討論遷移問題的論壇

---

**導覽**
- **上一課程**: [學習指南](resources/study-guide.md)
- **下一課程**: 返回 [主要 README](README.md)

**保持更新**: 關注此儲存庫以接收有關新版本發佈及學習教材重要更新的通知。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件已使用 AI 翻譯服務 Co-op Translator（https://github.com/Azure/co-op-translator）進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始語言的原文應視為具權威性的來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用此翻譯而引致的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->