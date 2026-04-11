# 變更紀錄 - AZD For Beginners

## 介紹

本變更紀錄記錄 AZD For Beginners 儲存庫的所有顯著變更、更新與改進。我們遵循語意化版本控制（semantic versioning）原則並維護此日誌，以協助使用者了解不同版本之間的變動。

## 學習目標

By reviewing this changelog, you will:
- 掌握新功能及新增內容
- 了解對現有文件所做的改進
- 追蹤錯誤修正與更正以確保準確性
- 追蹤學習教材隨時間的演進

## 學習成果

After reviewing changelog entries, you will be able to:
- 識別可用的新增學習內容與資源
- 了解哪些章節已更新或改進
- 根據最新教材規劃你的學習路徑
- 針對未來改進提供回饋與建議

## 版本歷史

### [v3.19.1] - 2026-03-27

#### 新手入門說明、設定驗證與最終 AZD 指令清理
**此版本延續對 AZD 1.23 的驗證掃描並進行針對新手的文件檢視：釐清以 AZD 為優先的驗證指引、加入本地設定驗證腳本、針對現行 AZD CLI 驗證關鍵指令，並移除變更紀錄外最後殘存的過時英文原始指令參考。**

#### 新增
- **🧪 新手設定驗證腳本**，包含 `validate-setup.ps1` 和 `validate-setup.sh`，讓學習者在開始第 1 章之前確認所需工具
- **✅ 事前設定驗證步驟** 已加入根目錄 README 與第 1 章 README，讓在執行 `azd up` 前即可偵測遺漏的前置需求

#### 變更
- **🔐 新手驗證指引** 現在一致地將 `azd auth login` 視為 AZD 工作流程的主要路徑，並將 `az login` 標示為選用，除非直接使用 Azure CLI 指令
- **📚 第 1 章入門流程** 現在會提示學習者在安裝、驗證與首次部署步驟之前先驗證本地設定
- **🛠️ 驗證器訊息** 現在明確區分會阻礙進行的必要條件與僅適用於 Azure CLI 的選用警告（針對僅使用 AZD 的新手路徑）
- **📖 設定、疑難排解與範例文件** 現在在原本未說明情境就並列的情況下，區分出必需的 AZD 驗證與選用的 Azure CLI 登入

#### 修正
- **📋 剩餘的英文原始指令參考** 已更新為目前的 AZD 形式，包括備忘清單中的 `azd config show`，以及原本意圖指向 Azure 入口網站總覽時改為 `azd monitor --overview`
- **🧭 第 1 章的新手說法** 已緩和措辭，避免過度承諾在所有範本與 Azure 資源上保證零錯誤或回滾行為
- **🔎 即時 CLI 驗證** 已確認目前支援 `azd env get-values`、`azd template list`、`azd extension list --installed`、`azd copilot consent list`、`azd mcp start`、`azd provision --preview`、`azd monitor --logs` 以及 `azd down --force --purge`

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

#### AZD 1.23.12 驗證、工作坊環境擴展與 AI 模型更新
**此版本針對 `azd` `1.23.12` 進行文件驗證掃描，更新過時的 AZD 指令範例，將 AI 模型指引更新為目前預設，並將工作坊指示擴展至除了 GitHub Codespaces 外也支援 dev containers 與本地複製。**

#### 新增
- **✅ 在核心章節與工作坊文件中加入驗證註記**，以便對使用較新或較舊 CLI 版本的學習者明確指出所測試的 AZD 基準版本
- **⏱️ 部署逾時指引**，針對使用 `azd deploy --timeout 1800` 的長時間執行 AI 應用部署
- **🔎 延伸套件檢查步驟**，於 AI 工作流程文件中新加入 `azd extension show azure.ai.agents`
- **🌐 更廣泛的工作坊環境指引**，涵蓋 GitHub Codespaces、dev containers 與使用 MkDocs 的本地複製

#### 變更
- **📚 章節導覽 README** 現在在基礎、設定、基礎架構、多 agent、預部署、疑難排解與上線章節中，一致註明已對 `azd 1.23.12` 進行驗證
- **🛠️ AZD 指令參考** 已在文件中更新為目前形式：
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` or `azd env get-value(s)` depending on context
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` where Application Insights overview is intended
- **🧪 預覽佈建範例** 簡化為目前支援的用法，例如 `azd provision --preview` 與 `azd provision --preview -e production`
- **🧭 工作坊流程** 已更新，讓學習者能在 Codespaces、dev container 或本地複製中完成實驗，而不再假設只能在 Codespaces 執行
- **🔐 驗證指引** 現在偏好在 AZD 工作流程中使用 `azd auth login`，而將 `az login` 視為在直接使用 Azure CLI 指令時的選用項目

#### 修正
- **🪟 Windows 安裝指令** 已在安裝指南中統一為目前 `winget` 套件大小寫慣例
- **🐧 Linux 安裝指引** 已修正，以避免不支援的特定發行版 `azd` 套件管理器指令，改在適當情況下指向發行檔案（release assets）
- **📦 AI 模型範例** 已從舊的預設（如 `gpt-35-turbo` 與 `text-embedding-ada-002`）更新為目前的範例，例如 `gpt-4.1-mini`、`gpt-4.1` 與 `text-embedding-3-large`
- **📋 部署與診斷片段** 已修正，於日誌、腳本與疑難排解步驟使用目前的環境與狀態指令
- **⚙️ GitHub Actions 指引** 已從 `Azure/setup-azd@v1.0.0` 更新為 `Azure/setup-azd@v2`
- **🤖 MCP/Copilot 同意指引** 已從 `azd mcp consent` 更新為 `azd copilot consent list`

#### 改善
- **🧠 AI 章節指引** 現在更清楚說明對預覽敏感的 `azd ai` 行為、租戶專屬登入、目前的擴充套件使用方式，以及更新後的模型部署建議
- **🧪 工作坊指示** 現在在實作實驗中使用更貼近實際的版本範例以及更清晰的環境設定說明
- **📈 生產與疑難排解文件** 現在與目前的監控、備援模型及費用層級範例更為一致

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

#### AZD AI CLI 指令、內容驗證與範本擴充
**此版本在所有 AI 相關章節新增對 `azd ai`、`azd extension` 與 `azd mcp` 指令的涵蓋，修正 agents.md 中的壞連結與已棄用程式碼，更新備忘清單，並以已驗證的描述與新的 Azure AI AZD 範例模板重整 Example Templates 區段。**

#### 新增
- **🤖 AZD AI CLI 涵蓋** 擴及 7 個檔案（先前僅在第 8 章）：
  - `docs/chapter-01-foundation/azd-basics.md` — 新增 "Extensions and AI Commands" 章節，介紹 `azd extension`、`azd ai agent init` 與 `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — 選項 4：`azd ai agent init`，並附比較表（template vs manifest approach）
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" 與 "Agent-First Deployment" 小節
  - `docs/chapter-05-multi-agent/README.md` — 快速開始現在顯示範本與 manifest 基礎的部署路徑
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — 部署章節現在包含 `azd ai agent init` 選項
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — 「用於診斷的 AZD AI 擴充套件指令」小節
  - `resources/cheat-sheet.md` — 新增 "AI & Extensions Commands" 章節，含 `azd extension`、`azd ai agent init`、`azd mcp` 與 `azd infra generate`
- **📦 新的 AZD AI 範例模板** 已加入 `microsoft-foundry-integration.md`：
  - **azure-search-openai-demo-csharp** — .NET RAG 聊天，使用 Blazor WebAssembly、Semantic Kernel，並支援語音聊天
  - **azure-search-openai-demo-java** — Java RAG 聊天，使用 Langchain4J，並提供 ACA/AKS 部署選項
  - **contoso-creative-writer** — 多代理創作寫作應用，使用 Azure AI Agent Service、Bing Grounding 與 Prompty
  - **serverless-chat-langchainjs** — 無伺服器 RAG，使用 Azure Functions + LangChain.js + Cosmos DB，並支援 Ollama 本地開發
  - **chat-with-your-data-solution-accelerator** — 企業級 RAG 加速器，含管理入口、Teams 整合，以及 PostgreSQL/Cosmos DB 選項
  - **azure-ai-travel-agents** — 多代理 MCP 協調參考應用，伺服器以 .NET、Python、Java 與 TypeScript 實作
  - **azd-ai-starter** — 極簡 Azure AI 基礎架構 Bicep 啟始範本
  - **🔗 Awesome AZD AI Gallery link** — 參考 [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai)（80+ 範本）

#### 修正
- **🔗 agents.md 導覽**：上一頁/下一頁連結現已符合第 2 章 README 的課程順序（Microsoft Foundry Integration → Agents → AI Model Deployment）
- **🔗 agents.md 壞連結**：已將 `production-ai-practices.md` 修正為 `../chapter-08-production/production-ai-practices.md`（3 次）
- **📦 agents.md 已棄用的程式碼**：將 `opencensus` 換成 `azure-monitor-opentelemetry` 與 OpenTelemetry SDK
- **🐛 agents.md 無效的 API**：將 `max_tokens` 從 `create_agent()` 移到 `create_run()`，並以 `max_completion_tokens` 命名
- **🔢 agents.md 代幣計算**：將粗略的 `len//4` 估算改為使用 `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**：已將服務從 "Cognitive Search + App Service" 修正為 "Azure AI Search + Azure Container Apps"（預設主機於 2024 年 10 月變更）
- **contoso-chat**：更新描述以參考 Azure AI Foundry + Prompty，與該倉庫的實際標題與技術堆疊相符

#### 移除
- **ai-document-processing**：移除無法使用的範本參考（該倉庫未作為公開可用的 AZD 範本）

#### 改善
- **📝 agents.md 練習**: Exercise 1 現在顯示預期輸出和 `azd monitor` 步驟；Exercise 2 包含完整的 `FunctionTool` 註冊程式碼；Exercise 3 將模糊指引替換為具體的 `prepdocs.py` 命令
- **📚 agents.md 資源**: 已更新文件連結至最新的 Azure AI Agent Service 文件與快速上手
- **📋 agents.md 下一步表格**: 新增 AI Workshop Lab 連結以涵蓋完整章節

#### Files Updated
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Course Navigation Enhancement
**此版本以增強表格格式改善 README.md 章節導覽。**

#### Changed
- **Course Map Table**: Enhanced with direct lesson links, duration estimates, and complexity ratings
- **Folder Cleanup**: Removed redundant old folders (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: All 21+ internal links in Course Map table verified

### [v3.16.0] - 2026-02-05

#### Product Name Updates
**此版本將產品參考更新為目前 Microsoft 的品牌用法。**

#### Changed
- **Microsoft Foundry → Microsoft Foundry**: All references updated across non-translation files
- **Azure AI Agent Service → Foundry Agents**: Service name updated to reflect current branding

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
**此版本將文件重新組織為專門的章節資料夾，以利更清楚的導覽。**

#### Folder Renames
Old folders have been replaced with chapter-numbered folders:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### File Migrations
| 檔案 | 來源 | 目的地 |
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
- **📚 Chapter README files**: Created README.md in each chapter folder with:
  - 學習目標與時長
  - 課程表與說明
  - 快速啟動命令
  - 章節導覽連結

#### Changed
- **🔗 Updated all internal links**: 78+ paths updated across all documentation files
- **🗺️ Main README.md**: Updated Course Map with new chapter structure
- **📝 examples/README.md**: Updated cross-references to chapter folders

#### Removed
- Old folder structure (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository Restructuring: Chapter Navigation
**此版本新增章節導覽的 README 檔案（後續被 v3.15.0 取代）。**

---

### [v3.13.0] - 2026-02-05

#### New AI Agents Guide
**此版本新增一份完整指南，說明如何使用 Azure Developer CLI 部署 AI 代理。**

#### Added
- **🤖 docs/microsoft-foundry/agents.md**: Complete guide covering:
  - What AI agents are and how they differ from chatbots
  - Three quick-start agent templates (Foundry Agents, Prompty, RAG)
  - Agent architecture patterns (single agent, RAG, multi-agent)
  - Tool configuration and customization
  - Monitoring and metrics tracking
  - Cost considerations and optimization
  - Common troubleshooting scenarios
  - Three hands-on exercises with success criteria

#### Content Structure
- **Introduction**: Agent concepts for beginners
- **Quick Start**: Deploy agents with `azd init --template get-started-with-ai-agents`
- **Architecture Patterns**: Visual diagrams of agent patterns
- **Configuration**: Tool setup and environment variables
- **Monitoring**: Application Insights integration
- **Exercises**: Progressive hands-on learning (20-45 minutes each)

---

### [v3.12.0] - 2026-02-05

#### DevContainer Environment Update
**此版本更新開發容器設定，採用較新的工具與更適合 AZD 學習體驗的預設值。**

#### Changed
- **🐳 Base Image**: Updated from `python:3.12-bullseye` to `python:3.12-bookworm` (latest Debian stable)
- **📛 Container Name**: Renamed from "Python 3" to "AZD for Beginners" for clarity

#### Added
- **🔧 New Dev Container Features**:
  - `azure-cli` with Bicep support enabled
  - `node:20` (LTS version for AZD templates)
  - `github-cli` for template management
  - `docker-in-docker` for container app deployments

- **🔌 Port Forwarding**: Pre-configured ports for common development:
  - 8000 (MkDocs preview)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 New VS Code Extensions**:
  - `ms-python.vscode-pylance` - Enhanced Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions support
  - `ms-azuretools.vscode-docker` - Docker support
  - `ms-azuretools.vscode-bicep` - Bicep language support
  - `ms-azure-devtools.azure-resource-groups` - Azure resource management
  - `yzhang.markdown-all-in-one` - Markdown editing
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Mermaid diagram support
  - `redhat.vscode-yaml` - YAML support (for azure.yaml)
  - `eamodio.gitlens` - Git visualization
  - `mhutchie.git-graph` - Git history

- **⚙️ VS Code Settings**: Added default settings for Python interpreter, format on save, and whitespace trimming

- **📦 Updated requirements-dev.txt**:
  - Added MkDocs minify plugin
  - Added pre-commit for code quality
  - Added Azure SDK packages (azure-identity, azure-mgmt-resource)

#### Fixed
- **Post-Create Command**: Now verifies AZD and Azure CLI installation on container start

---

### [v3.11.0] - 2026-02-05

#### Beginner-Friendly README Overhaul
**此版本大幅改寫 README.md，使其對初學者更友善，並新增 AI 開發者的必要資源。**

#### Added
- **🆚 Azure CLI vs AZD Comparison**: Clear explanation of when to use each tool with practical examples
- **🌟 Awesome AZD Links**: Direct links to community template gallery and contribution resources:
  - [精彩 AZD 集錦](https://azure.github.io/awesome-azd/) - 200+ ready-to-deploy templates
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Community contribution
- **🎯 Quick Start Guide**: Simplified 3-step getting started section (Install → Login → Deploy)
- **📊 Experience-Based Navigation Table**: Clear guidance on where to start based on developer experience

#### Changed
- **README Structure**: Reorganized for progressive disclosure - key information first
- **Introduction Section**: Rewrote to explain "The Magic of `azd up`" for complete beginners
- **Removed Duplicate Content**: Eliminated duplicate troubleshooting section
- **Troubleshooting Commands**: Fixed `azd logs` reference to use valid `azd monitor --logs`

#### Fixed
- **🔐 Authentication Commands**: Added `azd auth login` and `azd auth logout` to cheat-sheet.md
- **Invalid Command References**: Removed remaining `azd logs` from README troubleshooting section

#### Notes
- **Scope**: Changes applied to main README.md and resources/cheat-sheet.md
- **Target Audience**: Improvements specifically aimed at developers new to AZD

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Command Accuracy Update
**此版本修正文件中不存在的 AZD 指令，確保所有範例使用有效的 Azure Developer CLI 語法。**

#### Fixed
- **🔧 Non-Existent AZD Commands Removed**: Comprehensive audit and correction of invalid commands:
  - `azd logs` (doesn't exist) → replaced with `azd monitor --logs` or Azure CLI alternatives
  - `azd service` subcommands (don't exist) → replaced with `azd show` and Azure CLI
  - `azd infra import/export/validate` (don't exist) → removed or replaced with valid alternatives
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (don't exist) → removed
  - `azd provision --what-if/--rollback` flags (don't exist) → updated to use `--preview`
  - `azd config validate` (doesn't exist) → replaced with `azd config list`
  - `azd info`, `azd history`, `azd metrics` (don't exist) → removed

- **📚 Files Updated with Command Corrections**:
  - `resources/cheat-sheet.md`: Major overhaul of command reference
  - `docs/deployment/deployment-guide.md`: Fixed rollback and deployment strategies
  - `docs/troubleshooting/debugging.md`: Corrected log analysis sections
  - `docs/troubleshooting/common-issues.md`: Updated troubleshooting commands
  - `docs/troubleshooting/ai-troubleshooting.md`: Fixed AZD debugging section
  - `docs/getting-started/azd-basics.md`: Corrected monitoring commands
  - `docs/getting-started/first-project.md`: Updated monitoring and debugging examples
  - `docs/getting-started/installation.md`: Fixed help and version examples
  - `docs/pre-deployment/application-insights.md`: Corrected log viewing commands
  - `docs/pre-deployment/coordination-patterns.md`: Fixed agent debugging commands

- **📝 Version Reference Updated**: 
  - `docs/getting-started/installation.md`: Changed hardcoded `1.5.0` version to generic `1.x.x` with link to releases

#### Changed
- **Rollback Strategies**: Updated documentation to use Git-based rollback (AZD doesn't have native rollback)
- **Log Viewing**: Replaced `azd logs` references with `azd monitor --logs`, `azd monitor --live`, and Azure CLI commands
- **Performance Section**: Removed non-existent parallel/incremental deployment flags, provided valid alternatives

#### Technical Details
- **有效的 AZD 命令**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **有效的 azd monitor 標誌**: `--live`, `--logs`, `--overview`
- <strong>已移除的功能</strong>: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### 註記
- <strong>驗證</strong>: 命令已針對 Azure Developer CLI v1.23.x 驗證

---

### [v3.9.0] - 2026-02-05

#### 工作坊完成與文件品質更新
**此版本完成了互動式工作坊模組、修復所有斷裂的文件連結，並提升整體內容品質以支援使用 Microsoft AZD 的 AI 開發者。**

#### 新增
- **📝 CONTRIBUTING.md**: 新增貢獻指南文件，包含：
  - 清楚的回報問題與提出變更指引
  - 新內容的文件標準
  - 程式碼範例指引與提交訊息慣例
  - 社群參與資訊

#### 已完成
- **🎯 工作坊模組 7（總結）**: 完整完成的總結模組，包含：
  - 對工作坊成果的全面總結
  - 關鍵概念掌握章節，涵蓋 AZD、模板與 Microsoft Foundry
  - 學習旅程後續建議
  - 附有難度評等的工作坊挑戰練習
  - 社群回饋與支援連結

- **📚 工作坊模組 3（拆解）**: 更新的學習目標，包含：
  - 啟用 GitHub Copilot 與 MCP 伺服器的指引
  - 了解 AZD 模板資料夾結構
  - 基礎設施即程式碼（Bicep）組織模式
  - 實作實驗室指示

- **🔧 工作坊模組 6（清理）**: 完成，包含：
  - 資源清理與成本管理目標
  - 安全解除佈署基礎設施的 `azd down` 用法
  - 軟刪除的認知服務復原指引
  - 提供 GitHub Copilot 與 Azure Portal 的延伸探索提示

#### 修正
- **🔗 斷裂連結修復**: 解決 15+ 個內部文件斷裂連結：
  - `docs/ai-foundry/ai-model-deployment.md`: 修正路徑指向 microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: 更正 ai-model-deployment.md 與 production-ai-practices.md 的路徑
  - `docs/getting-started/first-project.md`: 將不存在的 cicd-integration.md 換成 deployment-guide.md
  - `examples/retail-scenario.md`: 修正 FAQ 與疑難排解指南的路徑
  - `examples/container-app/microservices/README.md`: 更正課程首頁與部署指南的路徑
  - `resources/faq.md` 與 `resources/glossary.md`: 更新 AI 章節參考
  - `course-outline.md`: 修正授課指南與 AI 工作坊實驗室參考

- **📅 工作坊狀態橫幅**: 已將狀態從「施工中」更新為活動工作坊狀態，並標註 2026 年 2 月的日期

- **🔗 工作坊導航**: 修正 workshop README.md 中指向不存在 lab-1-azd-basics 資料夾的斷裂導航連結

#### 變更
- <strong>工作坊呈現</strong>: 已移除「施工中」警告，工作坊現已完成並可使用
- <strong>導航一致性</strong>: 確保所有工作坊模組具有正確的模組間導航
- <strong>學習路徑參考</strong>: 更新章節交叉參考以使用正確的 microsoft-foundry 路徑

#### 已驗證
- ✅ 所有英文 Markdown 檔案的內部連結皆有效
- ✅ 工作坊模組 0-7 已完成並包含學習目標
- ✅ 章節與模組之間的導航運作正常
- ✅ 內容適合使用 Microsoft AZD 的 AI 開發者
- ✅ 保持對初學者友善的語言與結構
- ✅ CONTRIBUTING.md 為社群貢獻者提供清楚指引

#### 技術實作
- <strong>連結驗證</strong>: 使用自動化 PowerShell 腳本驗證所有 .md 的內部連結
- <strong>內容稽核</strong>: 手動審查工作坊的完備性與對初學者的適合度
- <strong>導航系統</strong>: 套用一致的章節與模組導航模式

#### 註記
- <strong>範圍</strong>: 變更僅套用於英文文件
- <strong>翻譯</strong>: 本版本未更新翻譯資料夾（自動翻譯將稍後同步）
- <strong>工作坊時長</strong>: 完整工作坊現在提供 3-4 小時的實作學習

---

### [v3.8.0] - 2025-11-19

#### 進階文件：監控、安全與多代理模式
**此版本新增了完整的 A 級課程，涵蓋 Application Insights 整合、認證模式，以及用於生產部署的多代理協調。**

#### 新增
- **📊 Application Insights 整合課程**: 位於 `docs/pre-deployment/application-insights.md`：
  - 以 AZD 為重點的部署，含自動佈建
  - 包含 Application Insights + Log Analytics 的完整 Bicep 範本
  - 含自訂遙測的可運作 Python 應用程式（1,200+ 行）
  - AI/LLM 監控模式（Microsoft Foundry Models 令牌/成本追蹤）
  - 6 張 Mermaid 圖表（架構、分散式追蹤、遙測流程）
  - 3 個實作練習（警示、儀表板、AI 監控）
  - Kusto 查詢範例與成本優化策略
  - 即時度量串流與即時除錯
  - 40-50 分鐘的學習時間，含生產就緒模式

- **🔐 認證與安全模式課程**: 位於 `docs/getting-started/authsecurity.md`：
  - 3 種認證模式（連接字串、Key Vault、Managed Identity）
  - 提供安全佈署的完整 Bicep 基礎設施範本
  - 與 Azure SDK 整合的 Node.js 應用程式程式碼
  - 3 個完整練習（啟用 Managed Identity、使用者指派身份、Key Vault 旋轉）
  - 安全最佳實務與 RBAC 設定
  - 疑難排解指南與成本分析
  - 生產就緒的無密碼認證模式

- **🤖 多代理協調模式課程**: 位於 `docs/pre-deployment/coordination-patterns.md`：
  - 5 種協調模式（序列、並行、階層、事件驅動、共識）
  - 完整的協調器服務實作（Python/Flask，1,500+ 行）
  - 3 個專用代理實作（Research、Writer、Editor）
  - Service Bus 整合用於訊息佇列
  - 使用 Cosmos DB 進行分散式系統狀態管理
  - 6 張 Mermaid 圖表顯示代理互動
  - 3 個進階練習（逾時處理、重試邏輯、斷路器）
  - 成本拆解（$240-565/月）與優化策略
  - Application Insights 整合以利監控

#### 強化
- **Pre-deployment 章節**: 現在包含完整的監控與協調模式
- **Getting Started 章節**: 加強專業的認證模式
- <strong>生產就緒性</strong>: 從安全到可觀測性的完整涵蓋
- <strong>課程大綱</strong>: 已更新以參考第 3 與第 6 章的新課程

#### 變更
- <strong>學習進程</strong>: 更好地整合安全與監控於課程中
- <strong>文件品質</strong>: 新課程維持一致的 A 級標準（95-97%）
- <strong>生產模式</strong>: 提供企業部署的端到端完整涵蓋

#### 改善
- <strong>開發者體驗</strong>: 從開發到生產監控有清晰路徑
- <strong>安全標準</strong>: 專業的認證與祕密管理模式
- <strong>可觀測性</strong>: 與 AZD 整合的完整 Application Insights
- **AI 工作負載**: 針對 Microsoft Foundry Models 與多代理系統的專門監控

#### 已驗證
- ✅ 所有課程均包含完整可執行程式碼（非片段）
- ✅ 提供視覺化學習的 Mermaid 圖表（3 個課程共 19 張）
- ✅ 含實作練習並附驗證步驟（共 9 個）
- ✅ 可透過 `azd up` 部署的生產就緒 Bicep 範本
- ✅ 成本分析與優化建議
- ✅ 疑難排解指南與最佳實務
- ✅ 設有知識檢查點與驗證指令

#### 文件分級結果
- **docs/pre-deployment/application-insights.md**: - 完整的監控指南
- **docs/getting-started/authsecurity.md**: - 專業的安全模式
- **docs/pre-deployment/coordination-patterns.md**: - 進階的多代理架構
- <strong>整體新內容</strong>: - 一致的高品質標準

#### 技術實作
- **Application Insights**: Log Analytics + 自訂遙測 + 分散式追蹤
- <strong>認證</strong>: Managed Identity + Key Vault + RBAC 模式
- <strong>多代理</strong>: Service Bus + Cosmos DB + Container Apps + 協調器
- <strong>監控</strong>: 即時度量 + Kusto 查詢 + 警示 + 儀表板
- <strong>成本管理</strong>: 取樣策略、保留政策、預算控制

### [v3.7.0] - 2025-11-19

#### 文件品質改進與新的 Microsoft Foundry Models 範例
**此版本提升了整個儲存庫的文件品質，並新增一個完整的 Microsoft Foundry Models 部署範例，包含 gpt-4.1 聊天介面。**

#### 新增
- **🤖 Microsoft Foundry Models 聊天範例**: 在 `examples/azure-openai-chat/` 中完整部署 gpt-4.1 的實作：
  - 完整的 Microsoft Foundry Models 基礎設施（gpt-4.1 模型部署）
  - 具會話歷史記錄的 Python 指令列聊天介面
  - Key Vault 整合以安全儲存 API 金鑰
  - 代幣使用追蹤與成本估算
  - 流量限制與錯誤處理
  - 詳盡 README，部署指南需 35-45 分鐘
  - 11 個生產就緒檔案（Bicep 範本、Python 應用、設定）

- **📚 文件實作練習**: 在設定指南中新增實作練習：
  - 練習 1：多環境設定（15 分鐘）
  - 練習 2：祕密管理實作（10 分鐘）
  - 提供清楚的成功標準與驗證步驟

- **✅ 部署驗證**: 在部署指南中新增驗證章節：
  - 健康檢查程序
  - 成功判準清單
  - 所有部署指令的預期輸出
  - 疑難排解快速參考

#### 強化
- **examples/README.md**: 更新至 A 級品質 (93%)：
  - 在所有相關章節新增 azure-openai-chat
  - 本地範例數量從 3 更新為 4
  - 新增至 AI 應用範例表
  - 整合至進階使用者快速上手
  - 新增至 Microsoft Foundry 範本部分
  - 更新比較矩陣與技術發現部分

- <strong>文件品質</strong>: docs 資料夾整體從 B+ (87%) 提升至 A- (92%)：
  - 在關鍵指令範例中加入預期輸出
  - 為設定變更加入驗證步驟
  - 強化實作學習並提供實務練習

#### 變更
- <strong>學習進程</strong>: 更好地為中階學習者整合 AI 範例
- <strong>文件結構</strong>: 提供更多可執行的練習與清楚的結果
- <strong>驗證流程</strong>: 在主要工作流程中加入明確的成功判準

#### 改善
- <strong>開發者體驗</strong>: Microsoft Foundry Models 的部署現在為 35-45 分鐘（相較於複雜替代方案的 60-90 分鐘）
- <strong>成本透明度</strong>: 對 Microsoft Foundry Models 範例提供清楚的成本估算（$50-200/月）
- <strong>學習路徑</strong>: AI 開發者有一個清楚的入門範例 azure-openai-chat
- <strong>文件標準</strong>: 一致的預期輸出與驗證步驟

#### 已驗證
- ✅ Microsoft Foundry Models 範例可透過 `azd up` 完整運作
- ✅ 所有 11 個實作檔案語法正確
- ✅ README 指示與實際部署體驗相符
- ✅ 文件連結已在 8+ 個位置更新
- ✅ 範例索引準確反映 4 個本地範例
- ✅ 表格中無重複外部連結
- ✅ 所有導覽參考皆正確

#### 技術實作
- **Microsoft Foundry Models 架構**: gpt-4.1 + Key Vault + Container Apps 模式
- <strong>安全性</strong>: Managed Identity 準備就緒，祕密置於 Key Vault
- <strong>監控</strong>: Application Insights 整合
- <strong>成本管理</strong>: 令牌追蹤與使用優化
- <strong>部署</strong>: 單一 `azd up` 指令完成完整設置

### [v3.6.0] - 2025-11-19

#### 重大更新：Container App 部署範例
**此版本新增了完整、可生產的 Container 應用部署範例，使用 Azure Developer CLI (AZD)，並整合入學習路徑。**

#### 新增
- **🚀 Container App 範例**: 在 `examples/container-app/` 新增本地範例：
  - [總覽指南](examples/container-app/README.md): 包含容器化部署的完整概覽、快速上手、量產與進階模式
  - [簡易 Flask API](../../examples/container-app/simple-flask-api): 初學者友善的 REST API，具 scale-to-zero、健康檢查、監控與疑難排解
  - [微服務架構](../../examples/container-app/microservices): 生產就緒的多服務部署（API Gateway、Product、Order、User、Notification）、非同步訊息、Service Bus、Cosmos DB、Azure SQL、分散式追蹤、藍綠/金絲雀部署
- <strong>最佳實務</strong>: 針對容器化工作負載的安全性、監控、成本優化與 CI/CD 指南
- <strong>程式碼範例</strong>: 完整的 `azure.yaml`、Bicep 範本，以及多語言服務實作（Python、Node.js、C#、Go）
- <strong>測試與疑難排解</strong>: 端到端測試情境、監控指令與疑難排解指引

#### 變更
- **README.md**: 已更新，新增並連結「Local Examples - Container Applications」下的新容器應用範例
- **examples/README.md**: 已更新，以突顯容器應用範例、加入比較矩陣條目，並更新技術／架構參考
- **Course Outline & Study Guide**: 已更新，於相關章節中參考新的容器應用範例與部署模式

#### Validated
- ✅ 所有新範例皆可使用 `azd up` 部署，並符合最佳實務
- ✅ 文件內部連結與導覽已更新
- ✅ 範例涵蓋從入門到進階情境，包含生產級微服務

#### Notes
- **Scope**: 僅限英文文件與範例
- **Next Steps**: 未來版本將新增更多進階容器模式與 CI/CD 自動化

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**此版本在所有英文文件中，全面實作產品名稱從 "Microsoft Foundry" 到 "Microsoft Foundry" 的變更，以反映 Microsoft 的官方重新命名。**

#### Changed
- **🔄 Product Name Update**: 完成從 "Microsoft Foundry" 到 "Microsoft Foundry" 的重新命名
  - 已更新 `docs/` 資料夾中所有英文文件的相關引用
  - 重新命名資料夾：`docs/ai-foundry/` → `docs/microsoft-foundry/`
  - 重新命名檔案：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 合計：在 7 個文件中更新了 23 處內容引用

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` 已重新命名為 `docs/microsoft-foundry/`
  - 所有交叉參考已更新以反映新資料夾結構
  - 導覽連結已於整份文件中驗證

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 所有內部連結已更新以參照新檔名

#### Updated Files
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 更新 3 個導覽連結
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 更新 4 處產品名稱引用
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - 已使用 Microsoft Foundry（先前更新）
  - `docs/microsoft-foundry/production-ai-practices.md` - 更新 3 處引用（總覽、社群回饋、文件）
  - `docs/getting-started/azd-basics.md` - 更新 4 個交叉參考連結
  - `docs/getting-started/first-project.md` - 更新 2 個章節導覽連結
  - `docs/getting-started/installation.md` - 更新 2 個後續章節連結
  - `docs/troubleshooting/ai-troubleshooting.md` - 更新 3 處引用（導覽、Discord 社群）
  - `docs/troubleshooting/common-issues.md` - 更新 1 個導覽連結
  - `docs/troubleshooting/debugging.md` - 更新 1 個導覽連結

- **Course Structure Files** (2 files):
  - `README.md` - 更新 17 處引用（課程概述、章節標題、範本區塊、社群見解）
  - `course-outline.md` - 更新 14 處引用（概述、學習目標、章節資源）

#### Validated
- ✅ 英文文件中已無剩餘 "ai-foundry" 資料夾路徑引用
- ✅ 英文文件中已無剩餘 "Microsoft Foundry" 產品名稱引用
- ✅ 所有導覽連結於新資料夾結構下皆可運作
- ✅ 檔案與資料夾重新命名已成功完成
- ✅ 章節間的交叉參考已驗證

#### Notes
- **Scope**: 變更僅套用於 `docs/` 資料夾中的英文文件
- **Translations**: 翻譯資料夾（`translations/`）在此版本未更新
- **Workshop**: 工作坊教材（`workshop/`）在此版本未更新
- **Examples**: 範例檔案可能仍引用舊有命名（將於未來更新處理）
- **External Links**: 外部 URL 及 GitHub 倉庫參考維持不變

#### Migration Guide for Contributors
如果您在本機分支或文件中仍參考舊結構：
1. 更新資料夾參考：`docs/ai-foundry/` → `docs/microsoft-foundry/`
2. 更新檔案參考：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. 置換產品名稱: "Microsoft Foundry" → "Microsoft Foundry"
4. 驗證所有內部文件連結仍可運作

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**此版本新增對 Azure Developer CLI preview 功能的完整支援，並提升工作坊使用者體驗。**

#### Added
- **🧪 azd provision --preview Feature Documentation**: 完整說明新的基礎設施預覽功能
  - 指令參考與範例使用於速查表
  - 在佈署指南中詳細整合，包含使用情境與優點
  - 與預檢機制整合，以強化佈署驗證
  - 起步指南更新為以安全為先的佈署實作
- **🚧 Workshop Status Banner**: 專業 HTML 橫幅，顯示工作坊開發狀態
  - 漸層設計並帶有施工指示以清楚傳達狀態
  - 顯示最後更新時間以維持透明度
  - 為各種裝置提供響應式設計

#### Enhanced
- **Infrastructure Safety**: 預覽功能已整合至整體佈署文件
- **Pre-deployment Validation**: 自動化腳本現包含基礎設施預覽測試
- **Developer Workflow**: 更新指令順序，將預覽列為最佳實務
- **Workshop Experience**: 清楚告知使用者內容開發狀態的期望

#### Changed
- **Deployment Best Practices**: 建議採用以預覽為先的工作流程
- **Documentation Flow**: 將基礎設施驗證提前於學習流程
- **Workshop Presentation**: 以專業方式傳達開發時程

#### Improved
- **Safety-First Approach**: 現在可在佈署前驗證基礎設施變更
- **Team Collaboration**: 可分享預覽結果供審查與核准
- **Cost Awareness**: 在佈署前更清楚了解資源成本
- **Risk Mitigation**: 透過事前驗證降低佈署失敗風險

#### Technical Implementation
- **Multi-document Integration**: 預覽功能已涵蓋於 4 個關鍵文件
- **Command Patterns**: 文件中統一語法與範例
- **Best Practice Integration**: 預覽納入驗證工作流程與腳本
- **Visual Indicators**: 明確標示 NEW 功能以利發現

#### Workshop Infrastructure
- **Status Communication**: 採用帶漸層樣式的專業 HTML 橫幅
- **User Experience**: 清楚的開發狀態避免混淆
- **Professional Presentation**: 在設定期望的同時維持倉庫專業形象
- **Timeline Transparency**: 2025 年 10 月最後更新時間以供問責

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**此版本新增完整的工作坊教材，包含瀏覽器互動式指南與結構化學習路徑。**

#### Added
- **🎥 Interactive Workshop Guide**: 支援瀏覽器的工作坊體驗，含 MkDocs 預覽功能
- **📝 Structured Workshop Instructions**: 7 步驟引導式學習路徑，從探索到自訂
  - 0-Introduction: 工作坊概述與設定
  - 1-Select-AI-Template: 範本探索與選擇流程
  - 2-Validate-AI-Template: 佈署與驗證程序
  - 3-Deconstruct-AI-Template: 了解範本架構
  - 4-Configure-AI-Template: 設定與客製化
  - 5-Customize-AI-Template: 進階修改與迭代
  - 6-Teardown-Infrastructure: 清除與資源管理
  - 7-Wrap-up: 總結與後續步驟
- **🛠️ Workshop Tooling**: MkDocs 與 Material 主題的設定，提升學習體驗
- **🎯 Hands-On Learning Path**: 3 步驟方法論（探索 → 佈署 → 客製化）
- **📱 GitHub Codespaces Integration**: 無縫開發環境設定

#### Enhanced
- **AI Workshop Lab**: 擴展為 2-3 小時的完整結構化學習體驗
- **Workshop Documentation**: 專業呈現，包含導覽與視覺輔助
- **Learning Progression**: 提供從範本選擇到生產佈署的逐步指引
- **Developer Experience**: 整合工具以簡化開發工作流程

#### Improved
- **Accessibility**: 瀏覽器介面具備搜尋、複製功能與主題切換
- **Self-Paced Learning**: 彈性的工作坊結構適應不同學習速度
- **Practical Application**: 真實世界的 AI 範本佈署情境
- **Community Integration**: 與 Discord 整合以提供工作坊支援與協作

#### Workshop Features
- **Built-in Search**: 快速關鍵字與課程搜尋
- **Copy Code Blocks**: 所有程式碼範例支援滑鼠移入複製
- **Theme Toggle**: 支援深色／淺色模式切換
- **Visual Assets**: 包含截圖與圖表以增進理解
- **Help Integration**: 直接連結 Discord 社群以取得支援

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**此版本導入完整的章節式學習結構，並在整個倉庫中強化導覽。**

#### Added
- **📚 Chapter-Based Learning System**: 將整套課程重構為 8 個漸進式學習章節
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Comprehensive Navigation System**: 文件中統一的導覽標頭與頁腳
- **🎯 Progress Tracking**: 課程完成檢查表與學習驗證系統
- **🗺️ Learning Path Guidance**: 為不同經驗層級與目標提供清晰進路
- **🔗 Cross-Reference Navigation**: 清楚連結相關章節與先決條件

#### Enhanced
- **README Structure**: 改造為具章節組織的學習平台
- **Documentation Navigation**: 每頁現在包含章節上下文與學習進度指引
- **Template Organization**: 範例與範本對照至適當的章節
- **Resource Integration**: 速查表、常見問題與學習指南連結至相關章節
- **Workshop Integration**: 實作實驗對應多個章節的學習目標

#### Changed
- **Learning Progression**: 從線性文件流程轉為彈性的章節式學習
- **Configuration Placement**: 將設定指南移至第 3 章以利學習流程
- **AI Content Integration**: 在整個學習旅程中更好地整合 AI 專屬內容
- **Production Content**: 進階模式整合於第 8 章供企業學習者使用

#### Improved
- **User Experience**: 清晰的導覽麵包屑與章節進度指示
- **Accessibility**: 一致的導覽模式便於課程瀏覽
- **Professional Presentation**: 類大學課程的結構，適合學術與企業訓練
- **Learning Efficiency**: 改善組織後更快找尋相關內容

#### Technical Implementation
- **Navigation Headers**: 在 40+ 文件中標準化章節導覽
- **Footer Navigation**: 一致的進度指引與章節完成指示
- **Cross-Linking**: 完整的內部連結系統連接相關概念
- **Chapter Mapping**: 範本與範例清楚對應學習目標

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: 將學習指南重構以對應 8 章系統
- **🎯 Chapter-Based Assessment**: 每章包含特定學習目標與實作練習
- **📋 Progress Tracking**: 每週學習時程表含可衡量成果與完成檢查表
- **❓ Assessment Questions**: 每章的知識驗證題目與專業成果導向
- **🛠️ Practical Exercises**: 實作活動涵蓋真實佈署情境與故障排除
- **📊 Skill Progression**: 清楚從基礎概念進階到企業模式，並聚焦職涯發展
- **🎓 Certification Framework**: 專業發展成果與社群認可機制
- **⏱️ Timeline Management**: 結構化的 10 週學習計劃含里程碑驗證

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**此版本改進零售多代理解決方案，包含更清晰的代理命名與強化的文件。**

#### Changed
- **Multi-Agent Terminology**: 在整個零售多代理解決方案中，將 "Cora agent" 替換為 "Customer agent" 以便更清楚理解
- **Agent Architecture**: 更新所有文件、ARM 範本與程式範例以使用一致的 "Customer agent" 命名
- **Configuration Examples**: 現代化代理設定範例並更新命名慣例
- **Documentation Consistency**: 確保所有引用使用專業且描述性的代理名稱

#### Enhanced
- **ARM Template Package**: 已更新 retail-multiagent-arm-template，加入 Customer agent 參考
- **Architecture Diagrams**: 已更新 Mermaid 架構圖，採用更新後的 agent 命名
- **Code Examples**: Python classes 與實作範例現改用 CustomerAgent 命名
- **Environment Variables**: 已更新所有部署腳本以使用 CUSTOMER_AGENT_NAME 命名慣例

#### 改進
- **Developer Experience**: 文件中對 agent 的角色與責任描述更清晰
- **Production Readiness**: 與企業命名慣例更好地對齊
- **Learning Materials**: 為教學用途採用更直覺的 agent 命名
- **Template Usability**: 更簡化對 agent 功能與部署模式的理解

#### 技術細節
- 已更新 Mermaid 架構圖，包含 CustomerAgent 參考
- 在 Python 範例中將 CoraAgent 類別名稱替換為 CustomerAgent
- 修改 ARM 範本 JSON 配置以使用 "customer" agent 類型
- 將環境變數從 CORA_AGENT_* 更新為 CUSTOMER_AGENT_* 模式
- 已更新所有部署命令與容器設定

### [v3.0.0] - 2025-09-12

#### 重大變更 - 以 AI 開發者為重點及 Microsoft Foundry 整合
**此版本將倉庫轉型為具 Microsoft Foundry 整合的綜合 AI 專注學習資源。**

#### 新增
- **🤖 AI-First Learning Path**: 完整重構，以 AI 開發者與工程師為優先
- **Microsoft Foundry Integration Guide**: 完整文件，說明如何將 AZD 與 Microsoft Foundry 服務連接
- **AI Model Deployment Patterns**: 詳細指南，涵蓋模型選擇、配置與生產部署策略
- **AI Workshop Lab**: 2-3 小時實作工作坊，將 AI 應用轉換為可由 AZD 部署的解決方案
- **Production AI Best Practices**: 適用企業的 AI 工作負載擴展、監控與安全模式
- **AI-Specific Troubleshooting Guide**: 針對 Microsoft Foundry Models、Cognitive Services 與 AI 部署問題的完整疑難排解
- **AI Template Gallery**: 精選 Microsoft Foundry 範本集合，附複雜度評級
- **Workshop Materials**: 完整工作坊結構，含實作實驗與參考教材

#### 強化
- **README Structure**: 以 AI 開發者為主，並包含 Microsoft Foundry Discord 顯示的 45% 社群興趣資料
- **Learning Paths**: 為 AI 開發者設計的專屬學習旅程，與面向學生與 DevOps 工程師的傳統路徑並列
- **Template Recommendations**: 精選 AI 範本，包括 azure-search-openai-demo、contoso-chat 與 openai-chat-app-quickstart
- **Community Integration**: 強化 Discord 社群支援，新增 AI 專屬頻道與討論

#### 安全與生產重點
- **Managed Identity Patterns**: AI 專用的驗證與安全配置
- **Cost Optimization**: AI 工作負載的 token 使用追蹤與預算控管
- **Multi-Region Deployment**: 全球 AI 應用部署策略
- **Performance Monitoring**: AI 專屬指標與 Application Insights 整合

#### 文件品質
- **Linear Course Structure**: 從入門到進階 AI 部署模式的邏輯進展
- **Validated URLs**: 所有外部資源連結已核實並可存取
- **Complete Reference**: 所有內部文件連結已驗證並運作正常
- **Production Ready**: 含實務範例的企業部署範式

### [v2.0.0] - 2025-09-09

#### 重大變更 - 倉庫重構與專業提升
**此版本代表對倉庫結構與內容呈現的重大改造。**

#### 新增
- **Structured Learning Framework**: 所有文件頁面現在包含 Introduction、Learning Goals 與 Learning Outcomes 區段
- **Navigation System**: 在所有文件中新增上一課/下一課連結，以引導學習進度
- **Study Guide**: 完整的 study-guide.md，含學習目標、練習題與評量材料
- **Professional Presentation**: 移除所有 emoji 圖示以提高無障礙與專業外觀
- **Enhanced Content Structure**: 改善學習材料的組織與流程

#### 變更
- **Documentation Format**: 將所有文件標準化為一致的以學習為中心的結構
- **Navigation Flow**: 在所有學習材料中實現邏輯性進展
- **Content Presentation**: 移除裝飾性元素，採用清晰且專業的格式
- **Link Structure**: 更新所有內部連結以支援新的導覽系統

#### 改進
- **Accessibility**: 移除對 emoji 的依賴以提高螢幕閱讀器相容性
- **Professional Appearance**: 乾淨、學術風格的呈現，適合企業學習
- **Learning Experience**: 結構化方法，為每課提供明確的目標與成果
- **Content Organization**: 更佳的邏輯流程與相關主題之間的連結

### [v1.0.0] - 2025-09-09

#### 初始發布 - 全面 AZD 學習資源庫

#### 新增
- <strong>核心文件架構</strong>
  - 完整的 getting-started 指南系列
  - 完整的部署與資源佈建文件
  - 詳細的疑難排解資源與除錯指南
  - 部署前驗證工具與程序

- **Getting Started Module**
  - AZD Basics: Core concepts and terminology
  - Installation Guide: Platform-specific setup instructions
  - Configuration Guide: Environment setup and authentication
  - First Project Tutorial: Step-by-step hands-on learning

- **Deployment and Provisioning Module**
  - Deployment Guide: Complete workflow documentation
  - Provisioning Guide: Infrastructure as Code with Bicep
  - Best practices for production deployments
  - Multi-service architecture patterns

- **Pre-deployment Validation Module**
  - Capacity Planning: Azure resource availability validation
  - SKU Selection: Comprehensive service tier guidance
  - Pre-flight Checks: Automated validation scripts (PowerShell and Bash)
  - Cost estimation and budget planning tools

- **Troubleshooting Module**
  - Common Issues: Frequently encountered problems and solutions
  - Debugging Guide: Systematic troubleshooting methodologies
  - Advanced diagnostic techniques and tools
  - Performance monitoring and optimization

- **Resources and References**
  - Command Cheat Sheet: Quick reference for essential commands
  - Glossary: Comprehensive terminology and acronym definitions
  - FAQ: Detailed answers to common questions
  - External resource links and community connections

- **Examples and Templates**
  - Simple Web Application example
  - Static Website deployment template
  - Container Application configuration
  - Database integration patterns
  - Microservices architecture examples
  - Serverless function implementations

#### 功能
- **Multi-Platform Support**: 針對 Windows、macOS 與 Linux 的安裝與設定指南
- **Multiple Skill Levels**: 內容設計涵蓋學生到專業開發者
- **Practical Focus**: 實作範例與真實情境
- **Comprehensive Coverage**: 從基礎概念到進階企業範式
- **Security-First Approach**: 貫穿的安全最佳實務
- **Cost Optimization**: 關於經濟有效部署與資源管理的指引

#### 文件品質
- **Detailed Code Examples**: 實用且已測試的程式範本
- **Step-by-Step Instructions**: 清晰且可執行的說明
- **Comprehensive Error Handling**: 常見問題的疑難排解
- **Best Practices Integration**: 業界標準與建議
- **Version Compatibility**: 與最新 Azure 服務與 azd 功能保持同步

## 計劃中的未來改進

### Version 3.1.0 (Planned)
#### AI 平台擴展
- **Multi-Model Support**: 針對 Hugging Face、Azure Machine Learning 與自訂模型的整合模式
- **AI Agent Frameworks**: LangChain、Semantic Kernel 與 AutoGen 部署範本
- **Advanced RAG Patterns**: 除 Azure AI Search 外的向量資料庫選項（Pinecone、Weaviate 等）
- **AI Observability**: 加強模型效能、token 使用與回應品質的監控

#### 開發者體驗
- **VS Code Extension**: 整合 AZD 與 Microsoft Foundry 的開發體驗
- **GitHub Copilot Integration**: 由 AI 協助的 AZD 範本生成
- **Interactive Tutorials**: 針對 AI 情境的實作編碼練習，並提供自動驗證
- **Video Content**: 補充的視覺化教學影片，聚焦 AI 部署

### Version 4.0.0 (Planned)
#### 企業級 AI 範式
- **Governance Framework**: AI 模型治理、合規與稽核記錄
- **Multi-Tenant AI**: 以隔離 AI 服務為前提，為多個客戶提供服務的模式
- **Edge AI Deployment**: 與 Azure IoT Edge 與容器執行個體的整合
- **Hybrid Cloud AI**: AI 工作負載的多雲與混合部署模式

#### 進階功能
- **AI Pipeline Automation**: 與 Azure Machine Learning 管線的 MLOps 整合
- **Advanced Security**: 零信任模式、私用端點與進階威脅防護
- **Performance Optimization**: 針對高吞吐量 AI 應用的進階調校與擴展策略
- **Global Distribution**: AI 應用的內容傳遞與邊緣快取模式

### Version 3.0.0 (Planned) - 已被目前版本取代
#### 擬議新增項目 - 現已在 v3.0.0 中實作
- ✅ **AI-Focused Content**: 完整的 Microsoft Foundry 整合（已完成）
- ✅ **Interactive Tutorials**: 實作 AI 工作坊實驗（已完成）
- ✅ **Advanced Security Module**: AI 專屬的安全模式（已完成）
- ✅ **Performance Optimization**: AI 工作負載調校策略（已完成）

### Version 2.1.0 (Planned) - 部分已在 v3.0.0 中實作
#### 小幅增強 - 目前版本中已完成部分項目
- ✅ **Additional Examples**: 以 AI 為重點的部署範例（已完成）
- ✅ **Extended FAQ**: AI 專屬問題與疑難排解（已完成）
- **Tool Integration**: 強化 IDE 與編輯器整合指南
- ✅ **Monitoring Expansion**: AI 專屬的監控與告警模式（已完成）

#### 仍計劃於未來版本實作
- **Mobile-Friendly Documentation**: 針對行動學習的響應式設計
- **Offline Access**: 可下載的文件套件
- **Enhanced IDE Integration**: 為 AZD + AI 工作流程的 VS Code 擴充
- **Community Dashboard**: 即時社群指標與貢獻追蹤

## 為變更日誌做出貢獻

### 回報變更
當您為此倉庫貢獻時，請確保變更日誌條目包含：

1. <strong>版本號</strong>: 遵循語意化版本 (major.minor.patch)
2. <strong>日期</strong>: 發布或更新日期，格式 YYYY-MM-DD
3. <strong>類別</strong>: 新增、變更、已棄用、移除、修復、安全
4. <strong>清楚描述</strong>: 對變更的簡潔描述
5. <strong>影響評估</strong>: 變更對現有使用者的影響

### 變更類別

#### 新增
- 新功能、文件章節或能力
- 新的範例、範本或學習資源
- 額外工具、腳本或實用程式

#### 變更
- 對既有功能或文件的修改
- 為提高清晰度或準確性所做的更新
- 內容或組織的重構

#### 已棄用
- 正在淘汰的功能或做法
- 預定移除的文件章節
- 已有更佳替代方案的方法

#### 移除
- 不再相關的功能、文件或範例
- 過時資訊或已棄用的方法
- 冗餘或已合併的內容

#### 修復
- 修正文件或程式中的錯誤
- 已回報問題的處理與解決
- 提升準確性或功能性的改進

#### 安全
- 與安全相關的改進或修補
- 安全最佳實務的更新
- 安全漏洞的修復

### 語意化版本指南

#### 主要版本 (X.0.0)
- 需要使用者採取措施的重大變更
- 重大內容或組織重構
- 改變基本方法或作法的變更

#### 次要版本 (X.Y.0)
- 新增功能或內容
- 保持向下相容的增強功能
- 額外範例、工具或資源

#### 修補版本 (X.Y.Z)
- 錯誤修正與修補
- 對現有內容的小幅改進
- 說明與小幅增強

## 社群回饋與建議

我們積極鼓勵社群回饋以改進此學習資源：

### 如何提供回饋
- **GitHub Issues**: 回報問題或建議改進（歡迎 AI 相關議題）
- **Discord Discussions**: 分享想法並與 Microsoft Foundry 社群互動
- **Pull Requests**: 直接貢獻內容改進，尤其是 AI 範本與指南
- **Microsoft Foundry Discord**: 參與 #Azure 頻道的 AZD + AI 討論
- **Community Forums**: 參與更廣泛的 Azure 開發者討論

### 回饋類別
- **AI Content Accuracy**: 針對 AI 服務整合與部署資訊的更正
- **Learning Experience**: 改善 AI 開發者學習流程的建議
- **Missing AI Content**: 請求額外的 AI 範本、模式或範例
- **Accessibility**: 針對不同學習需求的改進
- **AI Tool Integration**: 改進 AI 開發工作流程整合的建議
- **Production AI Patterns**: 企業 AI 部署範式的請求

### 回應承諾
- **Issue Response**: 對已回報問題在 48 小時內回覆
- **Feature Requests**: 於一週內評估
- **Community Contributions**: 於一週內審查
- **Security Issues**: 列為優先並加速處理

## 維護時程

### 定期更新
- **Monthly Reviews**: 內容準確性與連結驗證
- **Quarterly Updates**: 主要內容新增與改進
- **Semi-Annual Reviews**: 全面性重構與強化
- **Annual Releases**: 含重大改進的主要版本更新

### 監控與品質保證
- **Automated Testing**: 定期驗證程式範例與連結
- **Community Feedback Integration**: 定期納入使用者建議
- **Technology Updates**: 與最新 Azure 服務與 azd 發行同步
- **Accessibility Audits**: 定期檢視包容性設計原則

## 版本支援政策

### 目前版本支援
- <strong>最新主要版本</strong>: 全面支援並定期更新
- <strong>上一個主要版本</strong>: 提供 12 個月的安全更新和重要修正
- <strong>舊有版本</strong>: 只由社群支援，無官方更新

### 遷移指引
當主要版本發佈時，我們會提供:
- <strong>遷移指引</strong>: 逐步遷移指示
- <strong>相容性說明</strong>: 有關破壞性變更的詳情
- <strong>工具支援</strong>: 協助遷移的腳本或實用工具
- <strong>社群支援</strong>: 針對遷移問題的專屬討論區

---

<strong>導覽</strong>
- <strong>上一課</strong>: [學習指南](resources/study-guide.md)
- <strong>下一課</strong>: 返回 [主要 README](README.md)

<strong>保持更新</strong>: 關注此儲存庫以接收有關新版本發佈及學習資料重要更新的通知。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
本文件已透過 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，請注意自動翻譯可能含有錯誤或不準確之處。原始語言之原文應被視為具權威性的版本。對於關鍵資訊，建議採用專業人工翻譯。我們對因使用此翻譯而導致的任何誤解或誤譯概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->