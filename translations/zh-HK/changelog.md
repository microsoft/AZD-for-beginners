# 變更日誌 - AZD 初學者指南

## 介紹

此變更日誌記錄了 AZD 初學者指南倉庫的所有重要變更、更新和改進。我們遵循語義版本控制原則，並維護此日誌以幫助用戶了解版本之間的變化。

## 學習目標

通過審閱此變更日誌，您將能夠：
- 了解新功能和內容新增
- 理解現有文件的改進
- 跟蹤錯誤修正及更正以確保準確性
- 追蹤學習資料隨時間的演進

## 學習成果

審閱變更日誌條目後，您將能夠：
- 識別可用於學習的新內容和資源
- 理解哪些章節已被更新或改進
- 根據最新資料規劃您的學習路徑
- 提供反饋和建議以推動未來改進

## 版本歷史

### [v3.22.0] - 2026-06-16

#### 初學者填空練習 #2：模板創作、開發容器、Pulumi、Azure DevOps、服務主體等更多內容
**此版本修補了 azd-coverage 分析顯現的剩餘中級空白：如何創作及發布您自己的模板、可重現的開發容器/Codespaces 環境、Pulumi 基礎設施提供者、Azure DevOps CI/CD 演練、服務主體身份驗證、主機選擇指導（AKS/Spring Apps）、`azd restore`/`azd package` 說明、掛勾錯誤處理及團隊/共享環境實踐。**

#### 新增
- **🧱 新增第4章課程** `docs/chapter-04-infrastructure/custom-templates.md` — 創作您自己的 azd 模板：必需結構（`azure.yaml`、`infra/`、`src/`）、`metadata.template` 欄位、使用 `uniqueString()` 資源標記及 `azd-env-name` 標籤參數化基礎設施、使用 `azd init --template <local-path>` 在本地測試、發布到 GitHub 及提交至 Awesome AZD 展示
- **📦 新增第1章課程** `docs/chapter-01-foundation/dev-containers.md` — 使用 Dev Containers 和 GitHub Codespaces 實作可重現的 azd 環境：基於官方 `ghcr.io/azure/azure-dev/azd` 特性的精簡 `.devcontainer/devcontainer.json`，語言特定功能、作為容器宿主的 `docker-in-docker`，及遠端登入的 `azd auth login --use-device-code`
- **🧩 azd 的 Pulumi** 章節加入於 `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`，Pulumi 資料夾結構，將 stack 映射到 azd 環境，所需的輸出/標記，以及相同的 `azd up` / `azd down` 工作流程
- **🎯 主機選擇指導** 於 `docs/chapter-04-infrastructure/provisioning.md` — 針對初學者的 `appservice`、`staticwebapp`、`function`、`containerapp`、`aks` 和 `springapp` 比較，以及何時選擇 AKS 或 Azure Spring Apps 的指導
- **🛠️ Azure DevOps CI/CD 演練** 於 `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`，使用工作負載身份聯合（OIDC）的服務連接，生成的 `azure-dev.yml`，及變量組設置
- **🔑 新增服務主體（模式4）** 於 `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`，非互動式使用客戶端密鑰與聯合/OIDC 憑證的 `azd auth login`，使用時機及安全憑證存儲
- **🪝 掛勾錯誤處理** 子節於 `docs/chapter-04-infrastructure/deployment-guide.md` — 終止碼與 `set -e`，`continueOnError`，使用 `azd hooks run` 進行掛勾隔離測試，作業系統特定的 Shell，及 `--debug`
- **👥 團隊/共享環境** 章節於 `docs/chapter-03-configuration/configuration.md` — `.azure/` 目錄內容、gitignore 的項目、每位開發者的環境、`azd env list`/`select`，及在 CI/CD 中提供環境值
- **🧰 `azd restore` 及擴展的 `azd package`** 解釋新增於 `resources/cheat-sheet.md` — 還原依賴項及構建可部署工件但不部署

#### 變更
- **🧭 第4章課程表** 更新以包含新課程「創作您自己的模板」(第3課)
- **🧭 第1章課程表** 更新以包含新課程「開發容器與 Codespaces」(第5課)；導航頁腳在 `bring-your-own-app.md` 與 `dev-containers.md` 之間連結

### [v3.21.0] - 2026-06-16

#### 初學者填空練習：多智能體實作課程、「自帶應用」、Terraform 及 CI/CD 演練
**此版本通過新增兩個實作課程（可部署多智能體演練及在現有應用中新增 azd）、針對初學者的掛勾介紹、Terraform 與 azd 章節、逐步 GitHub Actions 管道演練、新預覽擴展解釋，以及明確的部署驗證清單，修補了完整初學者指南的重要空白。**

#### 新增
- **🤝 新增第5章課程** `docs/chapter-05-multi-agent/multi-agent-basics.md` — 完全實作的兩智能體部署演練（協調者 + 專家）使用真實模板 (`contoso-creative-writer`)，涵蓋多智能體使用時機、`azd up` 工作流程、理解部署資源、跨智能體追蹤、自訂與清理
- **📦 新增第1章課程** `docs/chapter-01-foundation/bring-your-own-app.md` — 如何使用 `azd init`（「使用當前目錄中的代碼」）將 azd 新增至現有專案，理解 `azure.yaml` 和 `infra/`，`azd infra generate`，宿主檢測，及使用 `azd up` 部署
- **🌐 新增 Terraform 與 azd 章節** 於 `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` 配置，`.tf` 資料夾結構，必需的 `AZURE_*` 輸出和 `azd-env-name` 標籤，相同的 `azd up` / `azd down` 工作流程（修補此前宣稱支持 Terraform 卻只展示 Bicep 的缺口）
- **⚙️ 逐步 GitHub Actions 演練** 於 `docs/chapter-08-production/production-ai-practices.md` — 從 GitHub 儲存庫到自動部署：`azd pipeline config`、OIDC 聯合憑證（無儲存秘密）、生成的 `azure-dev.yml`，及秘密與變量指導
- **🪝 初學者掛勾入門** 於 `docs/chapter-04-infrastructure/deployment-guide.md` — 介紹掛勾是什麼、掛勾階段表、最小化首個掛勾，以及使用 `azd hooks run` 手動執行掛勾
- **✅ 新增「驗證您的部署」清單** 於 `docs/chapter-01-foundation/first-project.md` 第5步驟 — 煙霧測試、健康端點檢查及明確成功標準
- **🧩 新預覽擴展說明** `azure.ai.skills` 與 `azure.ai.connections`（其含義及何時使用）於 `docs/chapter-08-production/production-ai-practices.md`

#### 變更
- **🧭 第5章課程表** 修正：`multi-agent-basics.md` 現為第1課（唯一完整實作課程），誠實標注第2課在第6章，零售場景為架構藍圖非一鍵模板
- **🧭 第1章課程表** 新增「自帶應用」課程（第4課）
- **🔗 導航頁腳** 更新：`first-project.md` 現向前連結至 `bring-your-own-app.md`

#### 修正
- **🧱 封閉「宣稱但缺失」的 Terraform 缺口** — 先前課程提及 Terraform 支持但未展示，現已修正
- **🔀 修正誤導性第5章交叉連結**，避免誤解完整多智能體實作存在，實際僅為架構藍圖

#### 更新檔案
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(新)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(新)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 重新驗證、完整智能體生命週期命令及 Aspire 品牌重塑
**本版本依據 `azd` `1.25.6`（2026年6月）及 `azure.ai.agents` `0.1.40-preview` 擴展重新驗證課程，擴展 AI 指導從「搭建智能體」到完整生命週期（測試 → 評估 → 優化 → 檢視 → 刪除），介紹新的 `azure.ai.skills` 與 `azure.ai.connections` 預覽擴展，並記錄「.NET Aspire」更名為「Aspire」的品牌重塑。**

#### 新增
- **🔁 完整智能體生命週期涵蓋**，適合初學者及 AI 工程師，分布於多處文件：
  - `docs/chapter-01-foundation/azd-basics.md` — 生命週期表（搭建 → 測試 → 測量 → 改進 → 檢視 → 清理）新增於擴展與 AI 命令章節
  - `docs/chapter-08-production/production-ai-practices.md` — 新增「智能體生命週期管理」章節，涵蓋 `azd ai agent invoke`、`endpoint show`、`eval generate`、`optimize`、`code download` 和 `delete --force`
  - `resources/cheat-sheet.md` — 擴展 AI 智能體命令，包括 `invoke`、`endpoint show`、`eval generate`、`optimize`、`code download` 與 `delete --force`
- **🧩 新預覽擴展文檔**：新增 `azure.ai.skills`（可重用智能體技能）與 `azure.ai.connections`（Foundry 連接）於擴展表及速查表
- **⏱️ 響應時間指導** — `azd ai agent invoke` 範例新增總延遲和首字節時間輸出說明
- **📌 版本橫幅** 於根目錄 README 提醒學習者使用 `azd version` 和 `azd upgrade`

#### 變更
- **✅ 驗證基線從 `azd 1.23.12`（2026年3月）升級至 `azd 1.25.6`（2026年6月）**，涵蓋所有章節 README 和工作坊文件
- **🤖 第2章擴展說明調整**，由 `azure.ai.agents` `0.1.18-preview` 更新至 `0.1.40-preview`
- **🧪 工作坊驗證範例**（`azd version` 輸出）更新為 `1.25.6`
- **🧭 README「azd 今日新功能」更新**，強調智能體生命週期全流程、新 AI 擴展和近期品質改進（`azd init` 幂等性、`azd auth login` 過期令牌清理、`azd tool` 首次運行提示）
- **📖 第2章 agents.md（選項4）** 現指向部署後生命週期命令，而不僅停留於 `azd up`

#### 修正
- **🏷️ 產品命名更新** — 新增 Aspire 品牌重塑說明（「.NET Aspire」現已簡稱「Aspire」）；azd 對 Aspire 支持未變
- **🔎 針對 Azure Developer CLI 發行頻道現場釋出進行驗證**：穩定 CLI 版本 `1.25.6`（2026-06-12）及 `azure.ai.agents` `0.1.40-preview`（2026-06-15）

#### 更新檔案
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27
#### 初學者入門說明、設置驗證與最終 AZD 命令清理
**此版本跟進了 AZD 1.23 的驗證掃描，針對初學者進行文件修訂：澄清 AZD 優先的身份驗證指引，新增本地設置驗證腳本，核對主要命令與即時 AZD CLI，並移除除變更日誌外的最後過時英文源命令引用。**

#### 新增
- **🧪 初學者設置驗證腳本**，包含 `validate-setup.ps1` 與 `validate-setup.sh`，讓學習者能於開始第1章前確認所需工具
- **✅ 初始設置驗證步驟**，新增於根目錄 README 與第1章 README，確保在執行 `azd up` 前捕捉缺少的先決條件

#### 變更
- **🔐 初學者身份驗證指引**，統一將 `azd auth login` 做為 AZD 工作流程的主要路徑，`az login` 僅在直接使用 Azure CLI 命令時標示為選用
- **📚 第1章入門流程**，引導學習者先驗證本地設置，再進行安裝、身份驗證及首次部署步驟
- **🛠️ 驗證器訊息**，清楚分離阻斷性需求與 AZD 單一初學者路徑中選用的 Azure CLI 警告
- **📖 配置、疑難排解與範例文件**，區分必須的 AZD 身份驗證與選用的 Azure CLI 登入，避免之前無脈絡並列說明

#### 修正
- **📋 剩餘英文源命令引用**，更新為現行 AZD 指令格式，包括備忘單中的 `azd config show` 及 Azure 入口網站概述指引本意所在的 `azd monitor --overview`
- **🧭 第1章初學者主張**，調整宣稱，避免對所有範本與 Azure 資源保證零錯誤或保證回滾行為過度承諾
- **🔎 即時 CLI 驗證**，確認支援目前的 `azd env get-values`、`azd template list`、`azd extension list --installed`、`azd copilot consent list`、`azd mcp start`、`azd provision --preview`、`azd monitor --logs` 及 `azd down --force --purge`

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
**本版本針對 `azd` `1.23.12` 進行文件驗證掃描，更新過時的 AZD 命令範例，刷新 AI 模型指引為當前預設，並將工作坊指導擴展出 GitHub Codespaces 以外，支持開發容器與本地複製。**

#### 新增
- **✅ 核心章節與工作坊文件中的驗證註記**，使使用較新或較舊 CLI 版本的學習者明確知道所測試的 AZD 基線版本
- **⏱️ 部署逾時指引**，針對長時間執行的 AI 應用部署，說明如何使用 `azd deploy --timeout 1800`
- **🔎 擴充檢查步驟**，在 AI 工作流程文件中加入使用 `azd extension show azure.ai.agents` 進行擴充檢視
- **🌐 工作坊環境指導擴充**，涵蓋 GitHub Codespaces、開發容器與本地複製，透過 MkDocs 呈現

#### 變更
- **📚 章節開頭 README**，統一註明根據 `azd 1.23.12` 驗證，涵蓋基礎、配置、基礎建設、多代理、預部署、疑難排解與生產章節
- **🛠️ 文件中的 AZD 命令參考**，更新為現行格式：
  - `azd config list` → `azd config show`
  - `azd env show` → 根據情境改為 `azd env list` 或 `azd env get-value(s)`
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → 在 Application Insights 概述意圖中使用 `azd monitor --overview`
- **🧪 預覽部署範例**，簡化為支援的用法如 `azd provision --preview` 與 `azd provision --preview -e production`
- **🧭 工作坊流程**，調整讓學習者可於 Codespaces、開發容器或本地複製中完成實驗，而非假設僅限 Codespaces
- **🔐 身份驗證指引**，改為偏好使用 `azd auth login`，在直接使用 Azure CLI 命令時 `az login` 為可選

#### 修正
- **🪟 Windows 安裝命令**，安裝指南更新為現行 `winget` 套件大小寫一致
- **🐧 Linux 安裝指導**，修正避免不支援的發行版特有 `azd` 套件管理指令，適時改為指向發行資源
- **📦 AI 模型範例**，從較舊預設如 `gpt-35-turbo`、`text-embedding-ada-002` 更新為 `gpt-4.1-mini`、`gpt-4.1` 與 `text-embedding-3-large`
- **📋 部署與診斷程式碼片段**，修正使用目前的環境及狀態命令於日誌、腳本及疑難排解步驟
- **⚙️ GitHub Actions 指引**，從 `Azure/setup-azd@v1.0.0` 更新至 `Azure/setup-azd@v2`
- **🤖 MCP/協助者同意指引**，從 `azd mcp consent` 更新為 `azd copilot consent list`

#### 改善
- **🧠 AI 章節指引**，更清楚說明預覽敏感的 `azd ai` 行為、租戶特定登入、目前擴充使用與更新模型部署建議
- **🧪 工作坊指導**，採用更實際的版本範例及更清晰的環境設置語言以利實作
- **📈 生產與疑難排解文件**，與目前監控、回退模型及成本級別範例更好對齊

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
**本版本在所有 AI 相關章節中新增 `azd ai`、`azd extension` 和 `azd mcp` 命令內容，修復 agents.md 破損連結與棄用程式碼，更新備忘錄，並徹底重整範例範本部分，包含經驗證的描述與全新 Azure AI AZD 範本。**

#### 新增
- **🤖 AZD AI CLI 涵蓋範圍**，橫跨 7 個文件（先前僅限第8章）：
  - `docs/chapter-01-foundation/azd-basics.md` — 新增「擴充與 AI 命令」章節，介紹 `azd extension`、`azd ai agent init` 和 `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — 選項4：`azd ai agent init`，附帶範本與清單比較表
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — 「Foundry 的 AZD 擴充」與「以代理為先的部署」小節
  - `docs/chapter-05-multi-agent/README.md` — 快速開始現示範範本與清單部署路徑
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — 部署段落加入 `azd ai agent init` 選項
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — 「診斷用 AZD AI 擴充命令」小節
  - `resources/cheat-sheet.md` — 新增「AI 與擴充命令」章節，包含 `azd extension`、`azd ai agent init`、`azd mcp` 及 `azd infra generate`
- **📦 新的 AZD AI 範例範本**，列在 `microsoft-foundry-integration.md`：
  - **azure-search-openai-demo-csharp** — .NET RAG 聊天，結合 Blazor WebAssembly、Semantic Kernel 與語音聊天支援
  - **azure-search-openai-demo-java** — Java RAG 聊天，使用 Langchain4J，含 ACA/AKS 部署選項
  - **contoso-creative-writer** — 多代理創意寫作應用，結合 Azure AI Agent Service、Bing 溯源與 Prompty
  - **serverless-chat-langchainjs** — 無伺服器 RAG，使用 Azure Functions + LangChain.js + Cosmos DB，支援 Ollama 本地開發
  - **chat-with-your-data-solution-accelerator** — 企業級 RAG 加速器，含管理入口網站、Teams 整合及 PostgreSQL/Cosmos DB 選項
  - **azure-ai-travel-agents** — 多代理 MCP 編排參考應用，伺服器包含 .NET、Python、Java 與 TypeScript
  - **azd-ai-starter** — 精簡 Azure AI 基礎設施 Bicep 入門範本
  - **🔗 精彩 AZD AI 集錦連結** — 連結至 [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai)（80+ 範本）

#### 修正
- **🔗 agents.md 導航**：上一頁/下一頁連結對應第2章 README 課程順序 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md 破損連結**：`production-ai-practices.md` 修正為 `../chapter-08-production/production-ai-practices.md`（3處）
- **📦 agents.md 棄用程式碼**：將 `opencensus` 換為 `azure-monitor-opentelemetry` 與 OpenTelemetry SDK
- **🐛 agents.md 非法 API**：將 `max_tokens` 從 `create_agent()` 移動至 `create_run()` 作為 `max_completion_tokens`
- **🔢 agents.md 令牌計數**：把粗略的 `len//4` 估算換成 `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**：正確說明為「Azure AI Search + Azure Container Apps」而非「Cognitive Search + App Service」，同時預設主機於2024年10月變更
- **contoso-chat**：更新描述指向 Azure AI Foundry + Prompty，對應實際原始庫標題與技術棧

#### 移除
- **ai-document-processing**：移除無法用的範本參考（該存放庫未公開為 AZD 範本）

#### 改善
- **📝 agents.md 練習**：練習1 現示預期輸出與 `azd monitor` 步驟，練習2 包含全套 `FunctionTool` 註冊程式碼，練習3 用具體 `prepdocs.py` 指令替代不明確指引
- **📚 agents.md 資源**：更新連結指向最新 Azure AI Agent Service 文件與快速入門
- **📋 agents.md 下一步表格**：增加 AI 工作坊實驗室連結，完善章節覆蓋

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
**此版本提升了 README.md 章節導航，採用更完善的表格格式。**

#### 變更
- <strong>課程地圖表格</strong>：加強了直接課程連結、時間預估及難度評分
- <strong>資料夾清理</strong>：移除冗餘的舊資料夾（deployment/, getting-started/, pre-deployment/, troubleshooting/）
- <strong>連結驗證</strong>：課程地圖表中所有 21+ 個內部連結已驗證

### [v3.16.0] - 2026-02-05

#### 產品名稱更新
**此版本更新產品參考，改為使用 Microsoft 最新品牌名稱。**

#### 變更
- **Microsoft Foundry → Microsoft Foundry**：所有非翻譯檔案中的參考已更新
- **Azure AI Agent Service → Foundry Agents**：服務名稱已更新以反映現行品牌

#### 更新檔案
- `README.md` - 主要課程首頁
- `changelog.md` - 版本歷史
- `course-outline.md` - 課程結構
- `docs/chapter-02-ai-development/agents.md` - AI 代理指南
- `examples/README.md` - 範例文件
- `workshop/README.md` - 工作坊首頁
- `workshop/docs/index.md` - 工作坊索引
- `workshop/docs/instructions/*.md` - 所有工作坊教學文件

---

### [v3.15.0] - 2026-02-05

#### 主要倉庫重構：以章節為基礎的資料夾命名
**此版本將文件重構為獨立章節資料夾，提升導航清晰度。**

#### 資料夾重新命名
舊資料夾已替換為章節編號資料夾：
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
- **📚 章節 README 檔案**：於每個章節資料夾建立 README.md，包含：
  - 學習目標及時間
  - 課程表與說明
  - 快速啟動指令
  - 前往其他章節的導航連結

#### 變更
- **🔗 更新所有內部連結**：超過 78 個路徑更新遍及全部文檔
- **🗺️ 主 README.md**：更新課程地圖以反映新章節結構
- **📝 examples/README.md**：更新跨章節資料夾的參考連結

#### 移除
- 舊資料夾結構（getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/）

---

### [v3.14.0] - 2026-02-05

#### 倉庫重構：章節導航
**此版本新增章節導航 README 檔案（被 v3.15.0 版本取代）。**

---

### [v3.13.0] - 2026-02-05

#### 新 AI 代理指南
**此版本新增完整指南，說明如何使用 Azure Developer CLI 部署 AI 代理。**

#### 新增
- **🤖 docs/microsoft-foundry/agents.md**：完整指南涵蓋：
  - AI 代理的定義及與聊天機器人的不同
  - 三種快速啟動代理範本（Foundry Agents、Prompty、RAG）
  - 代理架構模式（單一代理、RAG、多代理）
  - 工具配置及自訂
  - 監控與度量追蹤
  - 成本考量與優化
  - 常見疑難解答
  - 三個實作練習與成功判準

#### 內容架構
- <strong>介紹</strong>：初學者專用代理概念
- <strong>快速啟動</strong>：使用 `azd init --template get-started-with-ai-agents` 部署代理
- <strong>架構模式</strong>：代理模式視覺圖示
- <strong>配置</strong>：工具設定與環境變數
- <strong>監控</strong>：整合 Application Insights
- <strong>練習</strong>：逐步實務學習（每個 20-45 分鐘）

---

### [v3.12.0] - 2026-02-05

#### DevContainer 環境更新
**此版本升級開發容器設定，引入更現代化工具及更佳的 AZD 學習預設。**

#### 變更
- **🐳 基底映像**：由 `python:3.12-bullseye` 更新為 `python:3.12-bookworm`（最新 Debian 穩定版）
- **📛 容器名稱**：由「Python 3」改為「AZD for Beginners」以強化識別

#### 新增
- **🔧 新 Dev Container 功能**：
  - 啟用 Bicep 支援的 `azure-cli`
  - `node:20`（AZD 範本的 LTS 版本）
  - 用於範本管理的 `github-cli`
  - 容器內的 docker (docker-in-docker) 支援容器應用部署

- **🔌 端口轉發**：預設常用開發端口
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
  - `DavidAnson.vscode-markdownlint` - Markdown 語法檢查
  - `bierner.markdown-mermaid` - Mermaid 圖表支援
  - `redhat.vscode-yaml` - YAML 支援（用於 azure.yaml）
  - `eamodio.gitlens` - Git 視覺化
  - `mhutchie.git-graph` - Git 歷史

- **⚙️ VS Code 設定**：新增 Python 直譯器預設設定、儲存時格式化及空白修剪

- **📦 更新 requirements-dev.txt**：
  - 加入 MkDocs 壓縮模組
  - 加入 pre-commit 代碼品質工具
  - 加入 Azure SDK 套件（azure-identity、azure-mgmt-resource）

#### 修正
- <strong>部署後指令</strong>：容器啟動後會驗證 AZD 與 Azure CLI 是否安裝

---

### [v3.11.0] - 2026-02-05

#### 適合初學者的 README 全面改寫
**此版本大幅優化 README.md，使其更適合初學者並新增 AI 開發者重要資源。**

#### 新增
- **🆚 Azure CLI vs AZD 比較**：清楚說明何時使用兩者並附實用範例
- **🌟 卓越 AZD 連結**：直接連結社群範本庫與貢獻資源：
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ 即用範本
  - [提交範本](https://github.com/Azure/awesome-azd/issues) - 社群貢獻入口
- **🎯 快速上手指南**：簡化 3 步驟啟動流程（安裝 → 登入 → 部署）
- **📊 依經驗區分導覽表**：依開發者經驗給出明確起點指引

#### 變更
- **README 結構**：重組資訊層級，先呈現重要資訊
- <strong>介紹章節</strong>：重寫以解釋「`azd up` 的魔力」給初學者
- <strong>移除重複內容</strong>：刪除重複的故障排除說明
- <strong>故障排除指令</strong>：修正 `azd logs` 改用有效的 `azd monitor --logs`

#### 修正
- **🔐 認證指令**：於 cheat-sheet.md 新增 `azd auth login` 和 `azd auth logout`
- <strong>無效指令移除</strong>：README 故障排除段落不再使用 `azd logs`

#### 備註
- <strong>套用範圍</strong>：調整於主要 README.md 及 resources/cheat-sheet.md
- <strong>目標用戶</strong>：針對初次使用 AZD 的開發者優化

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI 指令準確性更新
**此版本修正文件中不存在的 AZD 指令，確保所有範例均使用有效 Azure Developer CLI 語法。**

#### 修正
- **🔧 移除不存在的 AZD 指令**：全面審核並更正無效命令：
  - `azd logs`（不存在） → 改用 `azd monitor --logs` 或 Azure CLI 替代
  - `azd service` 子指令（不存在） → 改用 `azd show` 及 Azure CLI
  - `azd infra import/export/validate`（不存在） → 移除或以有效命令替代
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` 參數（不存在） → 移除
  - `azd provision --what-if/--rollback` 參數（不存在） → 改用 `--preview`
  - `azd config validate`（不存在） → 改為 `azd config list`
  - `azd info`, `azd history`, `azd metrics`（不存在） → 移除

- **📚 更正指令的檔案**：
  - `resources/cheat-sheet.md`：指令參考全面修訂
  - `docs/deployment/deployment-guide.md`：修正回滾及部署策略
  - `docs/troubleshooting/debugging.md`：更正日誌分析部分
  - `docs/troubleshooting/common-issues.md`：更新故障排除指令
  - `docs/troubleshooting/ai-troubleshooting.md`：修正 AZD 除錯章節
  - `docs/getting-started/azd-basics.md`：修正監控指令
  - `docs/getting-started/first-project.md`：更新監控與除錯範例
  - `docs/getting-started/installation.md`：修正幫助及版本範例
  - `docs/pre-deployment/application-insights.md`：修正日誌檢視指令
  - `docs/pre-deployment/coordination-patterns.md`：修正代理除錯指令

- **📝 版本參考更新**：
  - `docs/getting-started/installation.md`：將硬編碼的 `1.5.0` 版本改為通用 `1.x.x`，並附連結至釋出頁

#### 變更
- <strong>回滾策略</strong>：文件改為建議使用 Git 版本控制回滾（AZD 無內建回滾功能）
- <strong>日誌檢視</strong>：將 `azd logs` 改用 `azd monitor --logs`、`azd monitor --live` 及 Azure CLI 指令
- <strong>效能章節</strong>：刪除不存在的平行與增量部署指令，並提供有效替代方案

#### 技術細節
- **有效 AZD 指令**：`init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **有效 azd monitor 參數**：`--live`, `--logs`, `--overview`
- <strong>移除功能</strong>：`azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### 備註
- <strong>驗證</strong>：指令經過 Azure Developer CLI v1.23.x 版本驗證

---

### [v3.9.0] - 2026-02-05

#### 工作坊完成與文件品質提升
**此版本完成互動式工作坊模組，修正所有壞掉的文件連結，並提升 Microsoft AZD AI 開發者整體內容品質。**

#### 新增
- **📝 CONTRIBUTING.md**：新增貢獻指南文件，涵蓋：
  - 明確回報問題及提案指引
  - 新內容文件標準
  - 程式碼範例指引與提交訊息慣例
  - 社群參與資訊

#### 已完成
- **🎯 工作坊模組 7（總結）**：完整完成總結模組，包含：
  - 工作坊成果的全面總結
  - 涵蓋 AZD、範本與 Microsoft Foundry 的關鍵概念掌握章節
  - 建議學習旅程的延續方案
  - 含難度評級的工作坊挑戰練習
  - 社群回饋與支援連結

- **📚 工作坊模組 3（解析）**：更新學習目標，包含：
  - GitHub Copilot 與 MCP 伺服器啟用指導
  - AZD 範本資料夾結構理解
  - 基礎設施即程式碼（Bicep）組織模式
  - 實作實驗室指示

- **🔧 工作坊模組 6（拆除）**：完成：
  - 資源清理與成本管理目標
  - 使用 `azd down` 安全解除基礎設施
  - 軟刪除認知服務的回復指導
  - 附加探索提示：GitHub Copilot 與 Azure 入口網站

#### 修正
- **🔗 斷鏈修復**：解決 15+ 斷裂的內部文件鏈結：
  - `docs/ai-foundry/ai-model-deployment.md`：修正指向 microsoft-foundry-integration.md 的路徑
  - `docs/troubleshooting/ai-troubleshooting.md`：修正 ai-model-deployment.md 與 production-ai-practices.md 路徑
  - `docs/getting-started/first-project.md`：將不存在的 cicd-integration.md 換成 deployment-guide.md
  - `examples/retail-scenario.md`：修正常見問題與疑難排解指南路徑
  - `examples/container-app/microservices/README.md`：修正課程首頁與部署指南路徑
  - `resources/faq.md` 與 `resources/glossary.md`：更新 AI 章節引用
  - `course-outline.md`：修正講師指南與 AI 工作坊實驗室引用

- **📅 工作坊狀態橫幅**：從「建置中」更新為正式啟用，時間標示為 2026 年 2 月

- **🔗 工作坊導航**：修正 README.md 中指向不存在 lab-1-azd-basics 資料夾的斷鏈

#### 變更
- <strong>工作坊簡報</strong>：移除「建置中」警告，工作坊已完成且可使用
- <strong>導航一致性</strong>：確保所有工作坊模組具備相互連結的適當導航
- <strong>學習路徑引用</strong>：更新章節跨引用，採用正確的 microsoft-foundry 路徑

#### 驗證
- ✅ 所有英文 Markdown 文件內鏈有效
- ✅ 工作坊模組 0-7 完整含學習目標
- ✅ 章節與模組間導航正常
- ✅ 內容適用於使用 Microsoft AZD 的 AI 開發者
- ✅ 全文維持初學者友好的語言結構
- ✅ CONTRIBUTING.md 提供明確社群貢獻指導

#### 技術實作
- <strong>鏈結驗證</strong>：自動化 PowerShell 腳本檢查所有 .md 內部鏈結
- <strong>內容稽核</strong>：人工審核工作坊完整性與初學者適用性
- <strong>導航系統</strong>：應用一致的章節與模組導航模式

#### 備註
- <strong>範圍</strong>：變更僅限於英文文件
- <strong>翻譯</strong>：本版本未更新翻譯資料夾（自動翻譯將於後續同步）
- <strong>工作坊時長</strong>：完整工作坊提供 3-4 小時實作學習

---

### [v3.8.0] - 2025-11-19

#### 進階文件：監控、安全與多代理模式
**此版本新增涵蓋應用程式洞察集成、認證模式及多代理協調的完整 A 級教學，適用於生產部署。**

#### 新增
- **📊 應用程式洞察集成課程**：位於 `docs/pre-deployment/application-insights.md`：
  - 以 AZD 為核心的部署與自動化佈建
  - 完整 Application Insights + Log Analytics 的 Bicep 範本
  - 用戶端 Python 應用程式實作自訂遙測（1,200+ 行）
  - AI/LLM 監控模式（Microsoft Foundry 模型 Token/成本追蹤）
  - 6 張 Mermaid 圖示（架構、分散式追蹤、遙測流程）
  - 3 個實作練習（警示、儀表板、AI 監控）
  - Kusto 查詢範例與成本優化策略
  - 實時指標串流與即時偵錯
  - 預計學習時長 40-50 分鐘，含生產級模式

- **🔐 認證與安全模式課程**：位於 `docs/getting-started/authsecurity.md`：
  - 3 種認證模式（連接字串、Key Vault、受控身分識別）
  - 完整 Bicep 基礎設施範本供安全部署
  - Node.js 應用程式結合 Azure SDK 範例
  - 3 個完整練習（啟用受控、使用者指派身分、Key Vault 旋轉）
  - 安全最佳實踐與 RBAC 設定
  - 疑難排解指導與成本分析
  - 生產級無密碼認證模式

- **🤖 多代理協調模式課程**：位於 `docs/pre-deployment/coordination-patterns.md`：
  - 5 種協調模式（順序、並行、階層、事件驅動、共識）
  - 完整總控服務實作（Python/Flask，1,500+ 行）
  - 3 種專屬代理實作（研究、寫手、編輯）
  - 服務總線整合以支援訊息佇列
  - Cosmos DB 用於分散式系統狀態管理
  - 6 張 Mermaid 圖示展示代理交互
  - 3 個進階練習（超時處理、重試邏輯、斷路器）
  - 成本分析（月費 240-565 美元）及優化策略
  - 監控用 Application Insights 集成

#### 強化
- <strong>預部署章節</strong>：新增全面監控及協調模式教學
- <strong>入門章節</strong>：強化專業級認證模式
- <strong>生產就緒</strong>：涵蓋安全到可觀測性的完整流程
- <strong>課程大綱</strong>：更新並納入第 3 與第 6 章新課程

#### 變更
- <strong>學習進度</strong>：更完善整合安全與監控
- <strong>文件品質</strong>：新課程皆達一致 A 級標準（95-97%）
- <strong>生產模式</strong>：全面涵蓋企業部署端到端流程

#### 改善
- <strong>開發者體驗</strong>：提供從開發到生產監控的清晰路徑
- <strong>安全標準</strong>：專業認證與機密管理模式
- <strong>可觀測性</strong>：完全 Application Insights AZD 集成
- **AI 工作負載**：針對 Microsoft Foundry 模型與多代理系統專化監控

#### 驗證
- ✅ 所有課程含完整可用程式碼（非片段）
- ✅ Mermaid 圖示視覺學習（3 課共 19 張）
- ✅ 實作練習含驗證步驟（共 9 個）
- ✅ 可用 `azd up` 部署生產級 Bicep 範本
- ✅ 成本分析與優化策略
- ✅ 疑難排解與最佳實踐
- ✅ 知識檢核點與驗證指令

#### 文件評分結果
- **docs/pre-deployment/application-insights.md**：全面監控指導
- **docs/getting-started/authsecurity.md**：專業安全模式
- **docs/pre-deployment/coordination-patterns.md**：進階多代理架構
- <strong>整體新內容</strong>：一致高品質標準

#### 技術實作
- <strong>應用洞察</strong>：Log Analytics + 自訂遙測 + 分散式追蹤
- <strong>認證</strong>：受控身分 + Key Vault + RBAC
- <strong>多代理</strong>：服務總線 + Cosmos DB + 容器應用 + 總控
- <strong>監控</strong>：實時指標 + Kusto 查詢 + 警示 + 儀表板
- <strong>成本管理</strong>：取樣策略、保留政策、預算控制

### [v3.7.0] - 2025-11-19

#### 文件品質提升與新增 Microsoft Foundry 模型範例
**此版本優化整個倉庫的文件品質，並新增完整 Microsoft Foundry 模型部署範例，含 gpt-4.1 聊天介面。**

#### 新增
- **🤖 Microsoft Foundry 模型聊天範例**：完整 gpt-4.1 部署，含運作實作，位於 `examples/azure-openai-chat/`：
  - 完整 Microsoft Foundry 模型基礎設施（gpt-4.1 模型部署）
  - Python 命令列聊天介面，含對話歷史
  - Key Vault 整合以安全保存 API 金鑰
  - Token 使用追蹤與成本預估
  - 頻率限制與錯誤處理
  - 詳盡 README，部署指南約 35-45 分鐘
  - 11 個生產級檔案（Bicep 範本、Python 應用、配置）
- **📚 文件練習**：配置指南中新增實作練習：
  - 練習 1：多環境配置（15 分鐘）
  - 練習 2：祕密管理實作（10 分鐘）
  - 明確成功標準與驗證步驟
- **✅ 部署驗證**：部署指南中新增驗證章節：
  - 健康檢查流程
  - 成功標準清單
  - 所有部署指令預期輸出
  - 疑難排解快速參考

#### 強化
- **examples/README.md**：升級至 A 級品質（93%）：
  - 所有相關章節新增 azure-openai-chat
  - 本地範例數量由 3 增至 4
  - 新增至 AI 應用範例表中
  - 集成於中階用戶快速入門
  - 加入 Microsoft Foundry 範本區段
  - 更新比較矩陣與技術搜尋章節
- <strong>文件品質</strong>：docs 資料夾由 B+（87%）提升至 A-（92%）：
  - 重要指令範例附帶預期輸出
  - 配置變更加入驗證步驟
  - 增加實作學習的實務練習

#### 變更
- <strong>學習進度</strong>：更好整合中階 AI 範例
- <strong>文件結構</strong>：更多具體行動練習，清楚成果
- <strong>驗證流程</strong>：關鍵工作流程加明確成功標準

#### 改善
- <strong>開發者體驗</strong>：Microsoft Foundry 模型部署時間縮短為 35-45 分鐘（相比傳統複雜方案 60-90 分鐘）
- <strong>成本透明度</strong>：Microsoft Foundry 模型範例估價明確（月費 50-200 美元）
- <strong>學習路徑</strong>：AI 開發者擁有明確入口 azure-openai-chat
- <strong>文件標準</strong>：一貫的預期輸出與驗證步驟

#### 驗證
- ✅ Microsoft Foundry 範例完整使用 `azd up` 部署成功
- ✅ 11 個實作檔案語法正確
- ✅ README 指示與實際部署相符
- ✅ 多處鏈結更新（8+ 處）
- ✅ 範例索引準確反映 4 個本地範例
- ✅ 表格無重複外部鏈結
- ✅ 所有導航引用正確

#### 技術實作
- **Microsoft Foundry 模型架構**：gpt-4.1 + Key Vault + 容器應用模式
- <strong>安全性</strong>：受控身分準備，機密置於 Key Vault
- <strong>監控</strong>：Application Insights 集成
- <strong>成本管理</strong>：Token 追蹤與使用優化
- <strong>部署</strong>：單一 `azd up` 指令完成設置

### [v3.6.0] - 2025-11-19

#### 重大更新：Container App 部署範例
**本版本引入全面且生產就緒的容器應用部署範例，使用 Azure Developer CLI (AZD)，並完整文件化，納入學習路徑中。**

#### 新增
- **🚀 Container App 範例**：新增於 `examples/container-app/`：
  - [主導指南](examples/container-app/README.md)：容器化部署全覽、快速啟動、生產環境與進階模式
  - [簡易 Flask API](../../examples/container-app/simple-flask-api)：入門 REST API，具縮放歸零、健康檢查、監控與疑難排解
  - [微服務架構](../../examples/container-app/microservices)：生產級多服務部署（API Gateway、產品、訂單、用戶、通知），非同步訊息、服務總線、Cosmos DB、Azure SQL、分散式追蹤、藍綠/金絲雀部署
- <strong>最佳實踐</strong>：容器工作負載的安全、監控、成本優化與 CI/CD 指導
- <strong>程式碼範例</strong>：完整的 `azure.yaml`、Bicep 模板、多語言服務實作（Python、Node.js、C#、Go）
- <strong>測試與排錯</strong>：端到端測試場景、監控指令、問題排解指導

#### 變更
- **README.md**：新增並連結於「本地範例 - 容器應用」
- **examples/README.md**：新增強調容器範例、比較矩陣項目，更新技術/架構參考
- <strong>課程大綱與學習指南</strong>：更新以引用相關容器部署範例與模式

#### 驗證
- ✅ 新範例均可用 `azd up` 部署，符合最佳實踐
- ✅ 文檔跨鏈結與導航更新
- ✅ 覆蓋初學至進階生產微服務場景

#### 備註
- <strong>範圍</strong>：限英文文檔與範例
- <strong>後續計畫</strong>：未來版本將擴充進階容器模式與 CI/CD 自動化

### [v3.5.0] - 2025-11-19

#### 產品品牌重塑：Microsoft Foundry
**本版本將所有英文文件中「Microsoft Foundry」產品名稱全面改為「Microsoft Foundry」，反映微軟官方品牌重塑。**

#### 變更
- **🔄 產品名稱更新**：全面從「Microsoft Foundry」改稱「Microsoft Foundry」
  - 更新 `docs/` 目錄下所有英文文件的相關引用
  - 資料夾重新命名：`docs/ai-foundry/` → `docs/microsoft-foundry/`
  - 已重命名檔案：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 總計：7 個文件中共更新 23 處內容引用

- **📁 資料夾結構變更**：
  - `docs/ai-foundry/` 已重新命名為 `docs/microsoft-foundry/`
  - 所有交叉引用均更新以反映新的資料夾結構
  - 全部文件中的導覽連結皆已驗證

- **📄 檔案重新命名**：
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 所有內部連結更新為新的檔案名稱

#### 已更新文件
- <strong>章節文件</strong>（7 個文件）：
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 處導覽連結更新
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 處產品名稱引用更新
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - 先前更新已使用 Microsoft Foundry
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 處引用更新（概覽、社群反饋、文件）
  - `docs/getting-started/azd-basics.md` - 4 處交叉引用連結更新
  - `docs/getting-started/first-project.md` - 2 處章節導覽連結更新
  - `docs/getting-started/installation.md` - 2 處下一章節連結更新
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 處引用更新（導覽、Discord 社群）
  - `docs/troubleshooting/common-issues.md` - 1 處導覽連結更新
  - `docs/troubleshooting/debugging.md` - 1 處導覽連結更新

- <strong>課程結構檔案</strong>（2 個文件）：
  - `README.md` - 17 處引用更新（課程概觀、章節標題、範本區塊、社群見解）
  - `course-outline.md` - 14 處引用更新（概述、學習目標、章節資源）

#### 驗證結果
- ✅ 英文文件中已無剩餘任何「ai-foundry」資料夾路徑引用
- ✅ 英文文件中已無剩餘任何「Microsoft Foundry」產品名稱引用
- ✅ 所有導覽連結在新資料夾結構下均可正常運作
- ✅ 檔案與資料夾重新命名工作已成功完成
- ✅ 章節間交叉引用皆經驗證

#### 備註
- <strong>範圍</strong>：變更僅針對 `docs/` 資料夾中的英文文件應用
- <strong>翻譯</strong>：本版未更新翻譯資料夾（`translations/`）
- <strong>工作坊</strong>：工作坊材料（`workshop/`）未在本版更新
- <strong>範例</strong>：範例檔案可能仍使用舊命名（將於下次更新修正）
- <strong>外部連結</strong>：外部 URL 與 GitHub 儲存庫參考保持不變

#### 貢獻者遷移指南
如您有本地分支或文件引用舊有結構，請：
1. 更新資料夾引用：`docs/ai-foundry/` → `docs/microsoft-foundry/`
2. 更新檔案引用：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. 替換產品名稱：「Microsoft Foundry」 → 「Microsoft Foundry」
4. 驗證所有內部文件連結仍正常

---

### [v3.4.0] - 2025-10-24

#### 基礎設施預覽與驗證增強功能
**本版本引入對全新 Azure Developer CLI 預覽功能的完整支援，並提升工作坊的使用者體驗。**

#### 新增
- **🧪 azd provision --preview 功能文件**：完整說明基礎設施預覽能力
  - 命令參考與用法範例收錄於速查表
  - 詳細整合於佈署指南，包含應用案例與效益
  - 預檢測整合以保障佈署安全性
  - 開始使用指南更新，以安全優先的佈署實踐為主
- **🚧 工作坊狀態橫幅**：專業 HTML 橫幅顯示工作坊開發狀態
  - 漸層設計及施工指示，清楚傳達使用者訊息
  - 提供最後更新時間標記，增進透明度
  - 手機響應式設計，適用各種裝置

#### 強化
- <strong>基礎設施安全性</strong>：預覽功能全面整合於佈署文件
- <strong>佈署前驗證</strong>：自動化腳本新增基礎設施預覽測試
- <strong>開發者工作流程</strong>：更新指令序列，將預覽列為最佳實踐
- <strong>工作坊體驗</strong>：明確設置內容開發現狀，管理使用者預期

#### 變更
- <strong>佈署最佳實踐</strong>：推崇以預覽為先的工作流程
- <strong>文件流程</strong>：基礎設施驗證提前於學習流程中呈現
- <strong>工作坊展示</strong>：專業狀態溝通，附有清晰開發時間表

#### 改善
- <strong>安全優先策略</strong>：佈署前可驗證基礎設施變更
- <strong>團隊協作</strong>：預覽結果可共享，便於審核與批准
- <strong>成本認知</strong>：佈署前更清楚資源成本
- <strong>風險緩解</strong>：提前驗證減少佈署失敗

#### 技術實施
- <strong>多文件整合</strong>：預覽功能文件散布於 4 個主要檔案
- <strong>命令規範</strong>：文檔中語法與範例一致
- <strong>最佳實踐整合</strong>：預覽納入驗證工作流程及腳本
- <strong>視覺指示</strong>：清晰標記新功能以便發現

#### 工作坊基礎設施
- <strong>狀態通報</strong>：專業 HTML 橫幅配合漸層樣式
- <strong>使用者體驗</strong>：明確開發狀態避免混淆
- <strong>專業呈現</strong>：維持庫存信譽與使用預期
- <strong>時間透明度</strong>：2025 年 10 月最後更新時間戳記

### [v3.3.0] - 2025-09-24

#### 強化工作坊教材與互動學習體驗
**本版本推出完整工作坊教材，包含瀏覽器互動指南及結構化學習路徑。**

#### 新增
- **🎥 互動式工作坊指南**：具備 MkDocs 預覽功能的瀏覽器體驗
- **📝 結構化工作坊指引**：7 步驟導引學習路徑，由認識到自訂
  - 0-介紹：工作坊概覽與設定
  - 1-選擇 AI 範本：範本搜尋與挑選流程
  - 2-驗證 AI 範本：佈署與驗證程序
  - 3-解析 AI 範本：理解範本架構
  - 4-配置 AI 範本：設定與自訂
  - 5-客製化 AI 範本：進階修改與迭代
  - 6-拆解基礎設施：清理與資源管理
  - 7-結束總結：回顧與後續步驟
- **🛠️ 工作坊工具**：以 Material 主題配置 MkDocs 增強學習體驗
- **🎯 實作式學習路徑**：3 步驟方法論（探索 → 佈署 → 自訂）
- **📱 GitHub Codespaces 整合**：無縫開發環境部署

#### 強化
- **AI 工作坊實驗室**：擴充為完整 2-3 小時結構化學習體驗
- <strong>工作坊文件</strong>：專業呈現，包含導覽與視覺輔助
- <strong>學習進程</strong>：清晰引導從範本選擇到生產部署步驟
- <strong>開發者經驗</strong>：整合工具以優化開發工作流程

#### 改善
- <strong>可及性</strong>：瀏覽器介面支援搜尋、複製與主題切換
- <strong>自訂步調學習</strong>：靈活結構符合不同學習速度
- <strong>實務應用</strong>：真實世界 AI 範本部署案例
- <strong>社群整合</strong>：Discord 支援與協作

#### 工作坊特色
- <strong>內建搜尋</strong>：快速搜尋關鍵詞與課程
- <strong>程式碼區塊複製</strong>：滑鼠移入即可複製所有示範程式碼
- <strong>主題切換</strong>：支援深色與淺色模式
- <strong>視覺資源</strong>：截圖與圖示輔助理解
- <strong>幫助整合</strong>：直接連結 Discord 社群支持

### [v3.2.0] - 2025-09-17

#### 主要導航重組與章節導向學習系統
**本版本引入完整章節式學習結構，並強化整個資源庫的導覽。**

#### 新增
- **📚 章節導向學習系統**：將整個課程重組為 8 個由淺入深的學習章節
  - 第 1 章：基礎與快速入門（⭐ - 30-45 分鐘）
  - 第 2 章：AI 優先開發（⭐⭐ - 1-2 小時）
  - 第 3 章：配置與身份驗證（⭐⭐ - 45-60 分鐘）
  - 第 4 章：基礎設施即代碼與部署（⭐⭐⭐ - 1-1.5 小時）
  - 第 5 章：多代理 AI 解決方案（⭐⭐⭐⭐ - 2-3 小時）
  - 第 6 章：佈署前驗證與規劃（⭐⭐ - 1 小時）
  - 第 7 章：疑難排解與除錯（⭐⭐ - 1-1.5 小時）
  - 第 8 章：生產與企業模式（⭐⭐⭐⭐ - 2-3 小時）
- **📚 全面導覽系統**：所有文件統一章節標頭與頁尾導覽
- **🎯 進度追蹤**：課程完成檢查與學習驗證系統
- **🗺️ 學習路徑指引**：依經驗與目標明確入門點
- **🔗 交叉引用導覽**：清晰列出相關章節及先決條件

#### 強化
- **README 結構**：轉化為章節式的結構化學習平台
- <strong>文件導覽</strong>：每頁包含章節背景與進度指引
- <strong>範本組織</strong>：示範與範本對應正確章節
- <strong>資源整合</strong>：速查表、FAQ 與學習指南連結至關聯章節
- <strong>工作坊整合</strong>：實作課程對應多章節學習目標

#### 變更
- <strong>學習進展</strong>：由線性文件改為靈活章節學習模式
- <strong>配置位置</strong>：將配置指南移至第 3 章以優化學習流程
- **AI 內容整合**：貫穿整個學習歷程中提升 AI 內容連結
- <strong>生產內容</strong>：高階模組集中於第 8 章供企業學習者

#### 改善
- <strong>使用者體驗</strong>：清晰導覽麵包屑及章節進度顯示
- <strong>無障礙</strong>：導覽模式一致性提升課程通行便利
- <strong>專業呈現</strong>：大學風格課程結構，適合學術與企業訓練
- <strong>學習效率</strong>：優化組織架構，減少尋找內容時間

#### 技術實施
- <strong>導覽標頭</strong>：40 多個文件採用標準化章節導覽
- <strong>頁尾導覽</strong>：一致進度指引與章節完成標示
- <strong>內部連結</strong>：完整交叉引用系統連結相關概念
- <strong>章節映射</strong>：範本與示範清楚對應學習目標

#### 學習指南強化
- **📚 全面學習目標重組**：符合 8 章節系統
- **🎯 章節評量**：每章配置明確學習目標與實作練習
- **📋 進度追蹤**：週間學習計畫含可衡量成果與清單
- **❓ 評量題目**：每章知識驗證題專業設計
- **🛠️ 實務練習**：實戰活動含部署與疑難排解情境
- **📊 技能進階**：從基礎到企業模式，聚焦職涯發展
- **🎓 認證架構**：專業成長與社群認可制度
- **⏱️ 時程管理**：結構化 10 週學習計畫與里程碑驗證

### [v3.1.0] - 2025-09-17

#### 強化多代理 AI 解決方案
**本版本改進零售多代理方案，優化代理命名與文件內容。**

#### 變更
- <strong>多代理術語</strong>：整合將「Cora agent」更名為「Customer agent」，提高理解清晰度
- <strong>代理架構</strong>：更新所有文件、ARM 範本與程式碼範例，統一使用「Customer agent」
- <strong>配置範例</strong>：翻新代理配置範例，採用新命名規範
- <strong>文件一致性</strong>：確保所有引用皆採用專業且具描述性的代理名稱

#### 強化
- **ARM 範本套件**：零售多代理 ARM 範本改用 Customer agent
- <strong>架構圖</strong>：更新 Mermaid 架構圖，採用新版代理命名
- <strong>程式碼範例</strong>：Python 類別與實現範例現均使用 CustomerAgent 命名
- <strong>環境變數</strong>：全部部署腳本更新為 CUSTOMER_AGENT_NAME 命名慣例

#### 改善
- <strong>開發者體驗</strong>：文件中代理角色與責任更清晰
- <strong>生產準備</strong>：與企業命名慣例更好對齊
- <strong>學習資料</strong>：代理命名更直觀、易於理解
- <strong>範本易用性</strong>：簡化代理功能與部署模式理解

#### 技術細節
- 更新 Mermaid 架構圖引用 CustomerAgent
- Python 範例中 CoraAgent 類名稱替換為 CustomerAgent
- 修改 ARM 範本 JSON 配置為「customer」代理類型
- 環境變數從 CORA_AGENT_* 更改為 CUSTOMER_AGENT_*
- 更新所有部署指令與容器設定

### [v3.0.0] - 2025-09-12

#### 重大變更—聚焦 AI 開發者與 Microsoft Foundry 整合
**本版本將資源庫轉型為全面的 AI 專注學習資源，並整合 Microsoft Foundry。**

#### 新增
- **🤖 AI 優先學習路徑**：全面重構以 AI 開發者與工程師為核心
- **Microsoft Foundry 整合指南**：詳細文件說明 AZD 與 Microsoft Foundry 服務的連結方式
- **AI 模型部署模式**：詳細指南包含模型選擇、配置與生產部署策略

- **AI 工作坊實驗室**：2-3 小時的實操工作坊，將 AI 應用轉換為可由 AZD 部署的解決方案  
- **生產 AI 最佳實踐**：適合企業規模的 AI 工作負載擴展、監控及安全模式  
- **AI 專用故障排除指南**：涵蓋 Microsoft Foundry 模型、認知服務及 AI 部署問題的全面故障排除  
- **AI 範本庫**：展示 Microsoft Foundry 範本，包含複雜度評級  
- <strong>工作坊教材</strong>：完整工作坊結構，包含實操實驗室與參考資料  

#### 強化  
- **README 結構**：以 AI 開發者為重點，結合 Microsoft Foundry Discord 的 45% 社群興趣資料  
- <strong>學習路徑</strong>：專為 AI 開發者設計的旅程，與傳統學生及 DevOps 工程師路徑並行  
- <strong>範本推薦</strong>：特色 AI 範本，包括 azure-search-openai-demo、contoso-chat 和 openai-chat-app-quickstart  
- <strong>社群整合</strong>：強化 Discord 社群支援，增設 AI 專用頻道與討論  

#### 安全與生產重點  
- <strong>管理身分模式</strong>：AI 專用認證與安全配置  
- <strong>成本優化</strong>：追蹤 Token 使用及 AI 工作負載的預算控管  
- <strong>多區域部署</strong>：全球 AI 應用部署策略  
- <strong>性能監控</strong>：AI 專用指標與 Application Insights 整合  

#### 文件品質  
- <strong>線性課程結構</strong>：由淺入深，邏輯推進的 AI 部署模式  
- **已驗證的 URL**：所有外部程式庫連結均經過確認可訪問  
- <strong>完整參考</strong>：所有內部文件連結均已驗證且可用  
- <strong>具生產準備度</strong>：具真實案例的企業部署模式  

### [v2.0.0] - 2025-09-09

#### 主要變更 - 程式庫重構及專業化提升  
**此版本代表程式庫架構與內容展示的重大改版。**  

#### 新增  
- <strong>結構化學習框架</strong>：所有文件頁面皆包含介紹、學習目標與學習成果三部分  
- <strong>導覽系統</strong>：全文件新增上下章節連結，助力引導學習進程  
- <strong>學習指南</strong>：涵蓋學習目標、練習題及評估資料的 comprehensive study-guide.md  
- <strong>專業呈現</strong>：刪除所有表情符號，提高無障礙性與專業外觀  
- <strong>內容架構優化</strong>：強化學習材料組織與內容流暢度  

#### 變更  
- <strong>文件格式</strong>：標準化所有說明文件，採一致的學習導向結構  
- <strong>導覽流程</strong>：實現學習材料的邏輯進程  
- <strong>內容呈現</strong>：移除裝飾性元素，以清晰、專業為主  
- <strong>連結結構</strong>：更新所有內部連結，支援新導覽系統  

#### 改進  
- <strong>無障礙性</strong>：移除對表情符號的依賴，提升讀屏器相容性  
- <strong>專業外觀</strong>：採潔淨、學術風格，適合企業學習  
- <strong>學習體驗</strong>：結構化方法，明確說明每課目標與成果  
- <strong>內容組織</strong>：加強相關主題間的邏輯連結與流程  

### [v1.0.0] - 2025-09-09

#### 首次發布 - 全面 AZD 學習程式庫  

#### 新增  
- <strong>核心文件結構</strong>  
  - 完整入門指南系列  
  - 全面部署與設備設定文件  
  - 詳盡故障排除資源及除錯指南  
  - 部署前驗證工具與程序  

- <strong>入門模塊</strong>  
  - AZD 基礎：核心概念與術語  
  - 安裝指南：依平台提供設定說明  
  - 配置指南：環境設置與認證  
  - 第一個專案教學：逐步實操學習  

- <strong>部署與設備模塊</strong>  
  - 部署指南：完整工作流程文件  
  - 設備指南：使用 Bicep 的基礎架構即代碼  
  - 生產部署最佳實踐  
  - 多服務架構模式  

- <strong>部署前驗證模塊</strong>  
  - 容量規劃：驗證 Azure 資源可用性  
  - SKU 選擇：全面服務層級指南  
  - 預檢：自動化驗證腳本（PowerShell 與 Bash）  
  - 成本估算與預算計劃工具  

- <strong>故障排除模塊</strong>  
  - 常見問題：經常遇到的問題與解決方案  
  - 除錯指南：系統性故障排除方法  
  - 進階診斷技術與工具  
  - 性能監控及優化  

- <strong>資源與參考</strong>  
  - 命令速查表：重要命令快速參考  
  - 詞彙表：完整術語與縮寫定義  
  - 常見問題解答：詳細回應常見疑問  
  - 外部資源連結與社群連繫  

- <strong>範例與範本</strong>  
  - 簡單網站應用示例  
  - 靜態網站部署範本  
  - 容器應用配置  
  - 資料庫整合模式  
  - 微服務架構示例  
  - 無伺服器函式實作  

#### 功能特色  
- <strong>多平台支援</strong>：Windows、macOS 與 Linux 安裝及配置指南  
- <strong>多技能層級</strong>：內容涵蓋學生至專業開發者  
- <strong>實用導向</strong>：實操範例和真實情境  
- <strong>全面涵蓋</strong>：從基礎概念到進階企業模式  
- <strong>安全優先</strong>：整合全程安全最佳實踐  
- <strong>成本優化</strong>：提供高效部署與資源管理指引  

#### 文件品質  
- <strong>詳細程式範例</strong>：實用且經測試的範例碼  
- <strong>逐步指導</strong>：清楚且可執行的步驟說明  
- <strong>全面錯誤處理</strong>：常見問題的故障排除  
- <strong>最佳實踐整合</strong>：產業標準與推薦策略  
- <strong>版本相容性</strong>：保持最新 Azure 服務與 azd 功能同步  

## 未來規劃強化

### 版本 3.1.0（規劃中）  
#### AI 平台擴展  
- <strong>多模型支援</strong>：整合 Hugging Face、Azure Machine Learning 及自訂模型  
- **AI 代理框架**：LangChain、Semantic Kernel 與 AutoGen 部署範本  
- **進階 RAG 模式**：Azure AI Search 之外的向量資料庫（Pinecone、Weaviate 等）  
- **AI 觀察性**：強化模型效能、Token 用量與回應品質監控  

#### 開發體驗  
- **VS Code 擴充**：整合 AZD + Microsoft Foundry 開發體驗  
- **GitHub Copilot 整合**：AI 輔助 AZD 範本生成  
- <strong>互動教學</strong>：AI 情境下的實操程式練習與自動驗證  
- <strong>影片內容</strong>：針對 AI 部署的視覺化補充教程  

### 版本 4.0.0（規劃中）  
#### 企業級 AI 模式  
- <strong>治理框架</strong>：AI 模型治理、合規及稽核軌跡  
- **多租戶 AI**：支援多客戶隔離 AI 服務模式  
- **邊緣 AI 部署**：結合 Azure IoT Edge 與容器實例  
- **混合雲 AI**：多雲及混合部署模式  

#### 進階特性  
- **AI 自動化管線**：Azure Machine Learning MLOps 管線整合  
- <strong>進階安全</strong>：零信任模式、私有端點及先進威脅防護  
- <strong>性能優化</strong>：高吞吐量 AI 應用的調校與擴展策略  
- <strong>全球分發</strong>：AI 應用內容傳遞與邊緣快取模式  

### 版本 3.0.0（規劃中） - 已由當前版本取代  
#### 建議新增項目 - 現於 v3.0.0 已實現  
- ✅ **AI 專注內容**：全方位 Microsoft Foundry 整合（已完成）  
- ✅ <strong>互動教學</strong>：AI 實操工作坊實驗室（已完成）  
- ✅ <strong>進階安全模組</strong>：AI 專用安全模式（已完成）  
- ✅ <strong>性能優化</strong>：AI 工作負載調校策略（已完成）  

### 版本 2.1.0（規劃中） - 部分於 v3.0.0 實現  
#### 小幅增強 - 部分已於當前版本完成  
- ✅ <strong>額外範例</strong>：AI 專用部署場景（已完成）  
- ✅ **擴充 FAQ**：AI 專用問題與故障排除（已完成）  
- <strong>工具整合</strong>：強化 IDE 與編輯器整合指南  
- ✅ <strong>監控擴展</strong>：AI 專用監控及警示模式（已完成）  

#### 未來持續規劃  
- <strong>行動友善文件</strong>：響應式設計以利行動學習  
- <strong>離線存取</strong>：可下載文件套件  
- **強化 IDE 整合**：AZD + AI 工作流程的 VS Code 擴充  
- <strong>社群儀表板</strong>：即時社群指標與貢獻追蹤  

## 變更紀錄貢獻指南

### 變更回報  
提交本程式庫貢獻時，請確保變更紀錄包含：  

1. <strong>版本號</strong>：採用語意化版本控制格式（major.minor.patch）  
2. <strong>日期</strong>：發佈或更新日期，格式為 YYYY-MM-DD  
3. <strong>類別</strong>：新增、變更、棄用、移除、修復、安全  
4. <strong>清晰描述</strong>：簡明扼要說明變更內容  
5. <strong>影響評估</strong>：敘述對現有使用者的影響  

### 變更類別

#### 新增  
- 新功能、文件區塊或功能  
- 新增範例、範本或學習資源  
- 新增工具、腳本或實用程式  

#### 變更  
- 修改既有功能或文件  
- 改善清晰度或準確度的更新  
- 內容或組織架構調整  

#### 棄用  
- 正在逐步淘汰的功能或方式  
- 預計移除的文件區塊  
- 具有更佳替代方案的方法  

#### 移除  
- 不再適用的功能、文件或範例  
- 過時資訊或已棄用方式  
- 重複或已整合內容  

#### 修復  
- 文件或程式碼中的錯誤修正  
- 已回報問題的解決  
- 準確性或功能性改善  

#### 安全  
- 涉及安全的改善或修正  
- 安全最佳實踐更新  
- 安全漏洞修補  

### 語意版本控制指南

#### 主版本（X.0.0）  
- 需要使用者採取行動的重大變更  
- 內容或組織架構的重大重構  
- 根本方法或架構的變動  

#### 次版本（X.Y.0）  
- 新功能或內容新增  
- 保持向後相容的增強  
- 額外範例、工具或資源  

#### 修補版本（X.Y.Z）  
- 錯誤修正與校正  
- 現有內容的小幅改善  
- 澄清與微小增強  

## 社群回饋與建議

我們積極鼓勵社群提供回饋以優化此學習資源：  

### 如何提供回饋  
- **GitHub Issues**：回報問題或建議改進（歡迎 AI 專用問題）  
- **Discord 討論**：分享想法，參與 Microsoft Foundry 社群互動  
- **Pull Requests**：直接貢獻內容改進，特別是 AI 範本與指南  
- **Microsoft Foundry Discord**：加入 #Azure 頻道討論 AZD + AI  
- <strong>社群論壇</strong>：參與更廣泛的 Azure 開發者討論  

### 回饋類別  
- **AI 內容準確度**：修正 AI 服務整合與部署資訊  
- <strong>學習體驗</strong>：優化 AI 開發者學習流程的建議  
- **缺少 AI 內容**：增加 AI 範本、模式或範例的請求  
- <strong>無障礙性</strong>：促進多元學習需求改善  
- **AI 工具整合**：優化 AI 開發工作流程建議  
- **生產 AI 模式**：企業 AI 部署模式的建議請求  

### 回應承諾  
- <strong>問題回應</strong>：48 小時內回覆已報告問題  
- <strong>功能請求</strong>：一週內進行評估  
- <strong>社群貢獻</strong>：一週內審核  
- <strong>安全問題</strong>：立即優先處理與快速回應  

## 維護計畫

### 定期更新  
- <strong>每月檢視</strong>：內容準確度與連結驗證  
- <strong>季度更新</strong>：主要內容新增與改善  
- <strong>半年檢視</strong>：全面重構與強化  
- <strong>年度發行</strong>：重大版本更新與重大改進  

### 監控與品質保證  
- <strong>自動化測試</strong>：定期驗證程式範例與連結  
- <strong>社群回饋整合</strong>：定期採納用戶建議  
- <strong>技術更新</strong>：與最新 Azure 服務及 azd 版本同步  
- <strong>無障礙審核</strong>：定期檢視包容性設計原則  

## 版本支援政策

### 目前版本支援  
- <strong>最新主版本</strong>：全面支援並定期更新  
- <strong>前一主版本</strong>：12 個月的安全更新與重要修補  
- <strong>舊版</strong>：僅社群支援，無官方更新  

### 遷移指引  
主版本釋出時，我們將提供：  
- <strong>遷移指南</strong>：逐步過渡說明  
- <strong>相容性說明</strong>：重大更動細節  
- <strong>工具支援</strong>：遷移輔助腳本與工具  
- <strong>社群支援</strong>：專屬論壇協助遷移問題  

---

<strong>導覽</strong>  
- <strong>上一課</strong>：[Study Guide](resources/study-guide.md)  
- <strong>下一課</strong>：返回 [Main README](README.md)  

<strong>保持更新</strong>：關注此程式庫，取得新版本及學習材料重要更新通知。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->