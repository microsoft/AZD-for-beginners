# Changelog - AZD For Beginners

## 介紹

此變更日誌記錄 AZD For Beginners 儲存庫中所有值得注意的變更、更新與改進。我們遵循語義版本控制原則並維護此紀錄，以幫助使用者了解各版本之間的變動。

## 學習目標

透過檢視此變更日誌，你將能：
- 了解新增功能與內容
- 明白現有文件的改進項目
- 追蹤錯誤修正與更正以確保準確性
- 跟隨教材隨時間的演進

## 學習成果

閱讀變更記錄後，你將能夠：
- 辨識可用於學習的新內容與資源
- 了解哪些章節已更新或改良
- 根據最新教材規劃你的學習路徑
- 提供回饋與建議以促進未來改進

## 版本歷史

### [v3.22.0] - 2026-06-16

#### Beginner Gap-Fill #2：範本撰寫、開發容器、Pulumi、Azure DevOps、Service Principals 等等
**此版本解決 azd-coverage 分析指出的其餘中階缺口：如何撰寫並發布你自己的範本、可重現的 dev-container/Codespaces 環境、Pulumi 基礎架構提供者、Azure DevOps CI/CD 操作示範、service-principal 驗證、主機選擇建議（AKS/Spring Apps）、`azd restore`/`azd package` 說明、hook 錯誤處理，以及團隊/共用環境實務。**

#### 新增
- **🧱 新增第 4 章課程** `docs/chapter-04-infrastructure/custom-templates.md` — 撰寫你自己的 azd 範本：必要結構（`azure.yaml`、`infra/`、`src/`）、`metadata.template` 欄位、使用 `uniqueString()` 資源 token 與 `azd-env-name` 標籤來參數化基礎架構、以 `azd init --template <local-path>` 在本機測試、發布到 GitHub，並提交到 Awesome AZD 集合
- **📦 新增第 1 章課程** `docs/chapter-01-foundation/dev-containers.md` — 使用 Dev Containers 與 GitHub Codespaces 建立可重現的 azd 環境：一個最小的 `.devcontainer/devcontainer.json`，採用官方 `ghcr.io/azure/azure-dev/azd` feature、語言專屬的 feature、在容器主機上使用 `docker-in-docker`、以及遠端登入的 `azd auth login --use-device-code`
- **🧩 Pulumi 與 azd** 段落加入於 `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`、Pulumi 資料夾佈局、將 stacks 映射到 azd 環境、所需的輸出/標記，及與 `azd up` / `azd down` 相同的工作流程
- **🎯 主機選擇指引** 加入 `docs/chapter-04-infrastructure/provisioning.md` — 以初學者友善方式比較 `appservice`、`staticwebapp`、`function`、`containerapp`、`aks` 與 `springapp`，並提供何時選擇 AKS 或 Azure Spring Apps 的建議
- **🛠️ Azure DevOps CI/CD 操作示範** 加入 `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`、使用 workload identity federation (OIDC) 的 service connection、產生的 `azure-dev.yml`，以及變數群組設定
- **🔑 Service Principals（範例 4）** 新增於 `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`、使用 client secret 與以聯合/OIDC 憑證的非互動式 `azd auth login`，何時使用，以及安全的憑證儲存方式
- **🪝 Hook 錯誤處理** 小節加入於 `docs/chapter-04-infrastructure/deployment-guide.md` — 終止代碼與 `set -e`、`continueOnError`、使用 `azd hooks run` 在隔離環境測試 hooks、作業系統特定的 shell，與 `--debug`
- **👥 團隊 / 共用環境** 章節加入於 `docs/chapter-03-configuration/configuration.md` — 說明什麼會放在 `.azure/`、哪些檔案應該 gitignore、每位開發者的環境、`azd env list`/`select`，以及在 CI/CD 中提供環境值
- **🧰 `azd restore` 與擴展的 `azd package`** 說明加入於 `resources/cheat-sheet.md` — 還原相依性並在不部署的情況下建置可部署的產物

#### 變更
- **🧭 第 4 章課程表** 已更新以包含新的「撰寫你自己的範本」課程（第 3 課）
- **🧭 第 1 章課程表** 已更新以包含新的「Dev Containers & Codespaces」課程（第 5 課）；在 `bring-your-own-app.md` 與 `dev-containers.md` 之間接上導覽頁腳連結

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill：實作的多智能體課程、「將 azd 加入現有應用」、Terraform 與 CI/CD 示範
**此版本透過新增兩個實作課程（可部署的多智能體示範與將 azd 加入現有應用），一個初學者導向的 hooks 介紹、一段 Terraform 與 azd 的內容、一步步的 GitHub Actions pipeline 示範、對新 preview extensions 的說明，以及明確的部署驗證檢查表，來填補針對完全新手指南的最大缺口。**

#### 新增
- **🤝 新增第 5 章課程** `docs/chapter-05-multi-agent/multi-agent-basics.md` — 一個完整的實作、可部署的雙 agent 示例（orchestrator + specialists），使用真實範本（`contoso-creative-writer`），涵蓋何時使用 multi-agent、`azd up` 工作流程、理解已部署的資源、跨 agent 跟蹤、客製化與清理
- **📦 新增第 1 章課程** `docs/chapter-01-foundation/bring-your-own-app.md` — 如何用 `azd init` 將 azd 加入現有專案（「使用目前目錄中的程式碼」）、理解 `azure.yaml` 與 `infra/`、`azd infra generate`、主機偵測，並以 `azd up` 部署
- **🌐 Terraform 與 azd** 段落加入於 `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` 設定、`.tf` 資料夾佈局、所需的 `AZURE_*` 輸出與 `azd-env-name` 標記，及與 `azd up` / `azd down` 相同的工作流程（解決之前文件宣稱支援 Terraform 但僅展示 Bicep 的缺口）
- **⚙️ 一步步的 GitHub Actions 操作示範** 加入於 `docs/chapter-08-production/production-ai-practices.md` — 從 GitHub 倉庫到自動化部署：`azd pipeline config`、OIDC 聯合憑證（無需儲存機密）、產生的 `azure-dev.yml`，以及機密與變數的說明
- **🪝 初學者「不熟悉 hooks？」介紹** 加入於 `docs/chapter-04-infrastructure/deployment-guide.md` — 什麼是 hook、hook 階段對照表、一個最小的第一個 hook，與使用 `azd hooks run` 手動執行 hooks
- **✅「驗證你的部署」檢查清單** 加入於 `docs/chapter-01-foundation/first-project.md` 的第 5 步 — 煙霧測試、健康端點檢查，以及明確的成功準則
- **🧩 新預覽擴充功能說明** `azure.ai.skills` 與 `azure.ai.connections`（它們是什麼以及何時使用）加入於 `docs/chapter-08-production/production-ai-practices.md`

#### 變更
- **🧭 第 5 章課程表** 修正：`multi-agent-basics.md` 現為第 1 課（唯一完全實作的課程），並誠實標示第 2 課位於第 6 章且 Retail 情境為一個架構藍圖，而非一個一鍵建立的範本
- **🧭 第 1 章課程表** 現包含新的「Bring Your Own App」課程（第 4 課）
- **🔗 導覽頁腳** 已更新：`first-project.md` 現在向前連結到 `bring-your-own-app.md`

#### 修正
- **🧱 補上先前宣稱但缺少的 Terraform 支援** — 課程先前提及 Terraform 支援但未展示，已補上
- **🔀 修正誤導性的第 5 章跨連結**，避免暗示存在完整的 multi-agent 實作，而實際上只有架構藍圖

#### 已更新檔案
- changelog.md
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(new)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(new)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 更新、完整的 Agent 生命週期命令與 Aspire 改名
**此版本依 `azd` `1.25.6`（2026 年 6 月）以及 `azure.ai.agents` `0.1.40-preview` 擴充套件重新驗證課程，將 AI 指導從「搭建 agent」擴展到完整的 agent 生命週期（測試 → 評估 → 優化 → 檢視 → 刪除），揭露新的 `azure.ai.skills` 與 `azure.ai.connections` preview 擴充套件，並註記 ".NET Aspire" 改名為 "Aspire" 的產品重塑。**

#### 新增
- **🔁 完整的 agent 生命週期支援**，供初學者與 AI 工程師在文件中參考：
  - `docs/chapter-01-foundation/azd-basics.md` — 在 Extensions 與 AI Commands 小節中新增生命週期表（scaffold → test → measure → improve → inspect → clean up）
  - `docs/chapter-08-production/production-ai-practices.md` — 新增「管理 Agent 生命週期」章節，涵蓋 `azd ai agent invoke`、`endpoint show`、`eval generate`、`optimize`、`code download` 與 `delete --force`
  - `resources/cheat-sheet.md` — 擴充 AI Agent Commands，包含 `invoke`、`endpoint show`、`eval generate`、`optimize`、`code download` 與 `delete --force`
- **🧩 新預覽擴充功能紀錄**：`azure.ai.skills`（可重用的 agent skills）與 `azure.ai.connections`（Foundry connections）已加入擴充表格與備忘清單
- **⏱️ 回應時間指引** — `azd ai agent invoke` 範例現在註記其會印出總延遲與首位元組到達時間（time-to-first-byte）
- **📌 版本橫幅** 加入根 README，提示學習者查閱 `azd version` 與 `azd upgrade`

#### 變更
- **✅ 驗證基準更新**：將所有章節 README 與工作坊文件中的驗證基準從 `azd 1.23.12`（2026 年 3 月）更新為 `azd 1.25.6`（2026 年 6 月）
- **🤖 第 2 章擴充說明** 更新：`azure.ai.agents` 從 `0.1.18-preview` 更新為 `0.1.40-preview`
- **🧪 工作坊驗證範例**（`azd version` 輸出）更新為 `1.25.6`
- **🧭 README 中的「今天 azd 的新功能」** 已刷新，以突顯端到端的 agent 生命週期、新的 AI 擴充，以及近期的使用體驗改進（`azd init` 的冪等性、`azd auth login` 的過期 token 清理、`azd tool` 首次執行提示）
- **📖 第 2 章 agents.md（選項 4）** 現在引導學習者到部署後的生命週期命令，而不再只停在 `azd up`

#### 修正
- **🏷️ 產品命名** — 新增 Aspire 改名註記（".NET Aspire" 現稱為 "Aspire"）；azd 對 Aspire 的支援未改變
- **🔎 實際發布驗證** 已確認來自 Azure Developer CLI 發布來源：穩定 CLI `1.25.6`（2026-06-12）與 `azure.ai.agents` `0.1.40-preview`（2026-06-15）

#### 已更新檔案
- README.md
- changelog.md
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
#### 初學者上手說明、設定驗證與最終 AZD 指令清理
**此版本接續 AZD 1.23 的驗證掃描，針對初學者導向的文件進行整理：釐清以 AZD 為主的驗證指引、加入本地設定驗證腳本、依實際 AZD CLI 驗證關鍵命令，並移除變更日誌以外最後遺留的英文原始指令參考。**

#### 新增
- **🧪 初學者設定驗證腳本**，包含 `validate-setup.ps1` 與 `validate-setup.sh`，讓學習者在開始第 1 章前能確認所需工具
- **✅ 前置設定驗證步驟**，已加入根目錄 README 與第 1 章 README，讓缺少的前置需求在執行 `azd up` 前就被偵測到

#### 變更
- **🔐 初學者驗證指引**，現在一致地將 `azd auth login` 視為 AZD 工作流程的主要路徑，並將 `az login` 標示為可選，除非會直接使用 Azure CLI 命令
- **📚 第 1 章上手流程**，現在指引學習者在安裝、驗證與首次部署步驟前先驗證本機設定
- **🛠️ 驗證器訊息**，現在清楚區分阻斷性需求與針對只用 AZD 的初學者路徑的可選 Azure CLI 警告
- **📖 設定、故障排除與範例文件**，現在在需要的 AZD 驗證與可選 Azure CLI 登入之間做出區隔，避免早先無說明地同時呈現

#### 修正
- **📋 剩餘英文來源的指令參考**，已更新為目前的 AZD 形式，包括備忘單中的 `azd config show` 以及在說明 Azure 入口網站總覽時使用的 `azd monitor --overview`
- **🧭 第 1 章的初學者主張**，措辭放軟，避免過度承諾能對所有範本與 Azure 資源保證零錯誤或回滾行為
- **🔎 即時 CLI 驗證**，確認目前支援 `azd env get-values`、`azd template list`、`azd extension list --installed`、`azd copilot consent list`、`azd mcp start`、`azd provision --preview`、`azd monitor --logs` 與 `azd down --force --purge`

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
**此版本對 `azd` `1.23.12` 進行文件驗證掃描，更新過時的 AZD 指令範例，將 AI 模型指引刷新為目前預設，並將工作坊說明從僅支援 GitHub Codespaces 擴展為也支援 dev container 與本地複本。**

#### 新增
- **✅ 在核心章節與工作坊文件中加入驗證說明**，讓使用新版或舊版 CLI 的學習者能明確知道已測試的 AZD 基線
- **⏱️ 部署逾時指引**，針對長時間運行的 AI 應用部署建議使用 `azd deploy --timeout 1800`
- **🔎 延伸套件檢查步驟**，在 AI 工作流程文件加入 `azd extension show azure.ai.agents`
- **🌐 更廣的工作坊環境指引**，涵蓋 GitHub Codespaces、dev container 與搭配 MkDocs 的本地複本

#### 變更
- **📚 章節導讀 README**，現在在基礎、設定、基礎建設、多代理、預部署、故障排除與生產章節一致註明已針對 `azd 1.23.12` 進行驗證
- **🛠️ AZD 指令參考**，在文件中更新為目前形式：
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` 或 `azd env get-value(s)` （視情境而定）
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview`（當目的是 Application Insights 總覽時）
- **🧪 預覽佈建範例**，簡化為目前支援的用法，例如 `azd provision --preview` 與 `azd provision --preview -e production`
- **🧭 工作坊流程**，更新為學習者可在 Codespaces、dev container 或本地複本完成實驗，而非假設僅能在 Codespaces 執行
- **🔐 驗證指引**，現在偏好以 `azd auth login` 作為 AZD 流程的首選，並將 `az login` 視為在直接使用 Azure CLI 命令時的可選項

#### 修正
- **🪟 Windows 安裝指令**，在安裝指南中標準化為目前 `winget` 套件大小寫
- **🐧 Linux 安裝指引**，修正以避免不支援的發行版特定 `azd` 套件管理指示，改為在適當時引導至 release 釋出項目
- **📦 AI 模型範例**，從較舊的預設如 `gpt-35-turbo` 與 `text-embedding-ada-002` 更新為目前的示例，例如 `gpt-4.1-mini`、`gpt-4.1` 與 `text-embedding-3-large`
- **📋 部署與診斷片段**，在日誌、腳本與故障排除步驟中修正為使用目前的環境與狀態命令
- **⚙️ GitHub Actions 指引**，從 `Azure/setup-azd@v1.0.0` 更新為 `Azure/setup-azd@v2`
- **🤖 MCP/Copilot 同意指引**，從 `azd mcp consent` 更新為 `azd copilot consent list`

#### 改進
- **🧠 AI 章節指引**，更清楚說明預覽敏感的 `azd ai` 行為、租戶特定登入、目前延伸套件的使用，以及更新後的模型部署建議
- **🧪 工作坊說明**，使用更切合實際的版本範例與更清晰的環境設定語言以利實作實驗
- **📈 生產與故障排除文件**，現在與當前的監控、備援模型與費用層級範例更為一致

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

#### AZD AI CLI 指令覆蓋、內容驗證與範本擴充
**此版本在所有 AI 相關章節新增 `azd ai`、`azd extension` 與 `azd mcp` 指令覆蓋，修正 agents.md 的斷鏈與已淘汰程式碼，更新備忘單，並以驗證過的描述與新的 Azure AI AZD 範本改寫範例範本章節。**

#### 新增
- **🤖 AZD AI CLI 覆蓋**，分布在 7 個檔案（先前僅在第 8 章）：
  - `docs/chapter-01-foundation/azd-basics.md` — 新增「Extensions and AI Commands」段落，介紹 `azd extension`、`azd ai agent init` 與 `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — 選項 4：`azd ai agent init`，並附範本與清單式（manifest）方法的比較表
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — 新增「AZD Extensions for Foundry」與「Agent-First Deployment」小節
  - `docs/chapter-05-multi-agent/README.md` — 快速開始現在顯示範本與 manifest 基礎的部署路徑
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — 部署段落現在包含 `azd ai agent init` 選項
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — 新增「AZD AI Extension Commands for Diagnostics」小節
  - `resources/cheat-sheet.md` — 新增「AI & Extensions Commands」章節，包含 `azd extension`、`azd ai agent init`、`azd mcp` 與 `azd infra generate`
- **📦 新的 AZD AI 範本範例**，列於 `microsoft-foundry-integration.md`：
  - **azure-search-openai-demo-csharp** — 使用 Blazor WebAssembly、Semantic Kernel 與語音聊天支援的 .NET RAG 聊天
  - **azure-search-openai-demo-java** — 使用 Langchain4J 的 Java RAG 聊天，並提供 ACA/AKS 部署選項
  - **contoso-creative-writer** — 使用 Azure AI Agent Service、Bing Grounding 與 Prompty 的多代理創意寫作應用
  - **serverless-chat-langchainjs** — 使用 Azure Functions + LangChain.js + Cosmos DB 的無伺服器 RAG，並支援 Ollama 本地開發
  - **chat-with-your-data-solution-accelerator** — 企業級 RAG 加速器，含管理門戶、Teams 整合，以及 PostgreSQL/Cosmos DB 選項
  - **azure-ai-travel-agents** — 多代理 MCP 編排參考應用，伺服器採用 .NET、Python、Java 與 TypeScript
  - **azd-ai-starter** — 最小化的 Azure AI 基礎建設 Bicep 起始範本
  - **🔗 精選 AZD AI 圖庫連結** — 參考 [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai)（80+ 範本）

#### 修正
- **🔗 agents.md 導航**：上/下一篇連結現在與第 2 章 README 的課程順序相符（Microsoft Foundry Integration → Agents → AI Model Deployment）
- **🔗 agents.md 斷鏈**：將 `production-ai-practices.md` 修正為 `../chapter-08-production/production-ai-practices.md`（3 處）
- **📦 agents.md 已淘汰程式碼**：以 `azure-monitor-opentelemetry` + OpenTelemetry SDK 取代 `opencensus`
- **🐛 agents.md 無效 API**：將 `max_tokens` 從 `create_agent()` 移至 `create_run()`，並改為 `max_completion_tokens`
- **🔢 agents.md 代幣計數**：以 `tiktoken.encoding_for_model()` 取代粗略的 `len//4` 估算
- **azure-search-openai-demo**：將服務描述從「Cognitive Search + App Service」修正為「Azure AI Search + Azure Container Apps」（預設主機自 2024 年 10 月變更）
- **contoso-chat**：更新描述以參照 Azure AI Foundry + Prompty，符合該 repo 的實際標題與技術堆疊

#### 移除
- **ai-document-processing**：移除不可用的範本參考（repo 未公開作為 AZD 範本）

#### 改進
- **📝 agents.md 練習**：練習 1 現在顯示預期輸出與 `azd monitor` 步驟；練習 2 包含完整的 `FunctionTool` 註冊程式碼；練習 3 以具體的 `prepdocs.py` 指令取代模糊指示
- **📚 agents.md 資源**：更新文件連結至目前的 Azure AI Agent Service 文件與快速上手指南
- **📋 agents.md 下一步表格**：新增 AI 工作坊實驗室連結以覆蓋完整章節內容

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
**此版本改進了 README.md 的章節導覽，使用更強化的表格格式。**

#### 已變更
- <strong>課程地圖表格</strong>：新增直接課程連結、時間估計與複雜度評等
- <strong>資料夾清理</strong>：移除多餘的舊資料夾 (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- <strong>連結驗證</strong>：已驗證課程地圖表格中的 21+ 個內部連結

### [v3.16.0] - 2026-02-05

#### 產品名稱更新
**此版本將產品參考更新為最新 Microsoft 品牌名稱。**

#### 已變更
- **Microsoft Foundry → Microsoft Foundry**：已於非翻譯檔案中更新所有參考
- **Azure AI Agent Service → Foundry Agents**：已將服務名稱更新為反映最新品牌

#### 已更新檔案
- `README.md` - 主課程首頁
- `changelog.md` - 版本歷史
- `course-outline.md` - 課程結構
- `docs/chapter-02-ai-development/agents.md` - AI 代理指南
- `examples/README.md` - 範例文件
- `workshop/README.md` - 工作坊首頁
- `workshop/docs/index.md` - 工作坊索引
- `workshop/docs/instructions/*.md` - 所有工作坊說明檔案

---

### [v3.15.0] - 2026-02-05

#### 主要倉儲重構：以章節為基礎的資料夾命名
**此版本將文件重構為專門的章節資料夾，以利更清晰的導覽。**

#### 資料夾重新命名
舊資料夾已被章節編號資料夾取代：
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

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
- **📚 章節 README 檔案**：在每個章節資料夾中建立 README.md，內容包括：
  - 學習目標與時長
  - 課程表格與說明
  - 快速啟動指令
  - 與其他章節的導覽

#### 變更
- **🔗 已更新所有內部連結**：已在所有文件中更新 78+ 個路徑
- **🗺️ 主 README.md**：已用新章節結構更新課程地圖
- **📝 examples/README.md**：已更新跨章節參考

#### 已移除
- 舊的資料夾結構 (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### 倉儲重構：章節導覽
**此版本新增章節導覽 README 檔案（已被 v3.15.0 取代）。**

---

### [v3.13.0] - 2026-02-05

#### 新增 AI 代理指南
**此版本新增針對使用 Azure Developer CLI 部署 AI 代理的完整指南。**

#### 新增
- **🤖 docs/microsoft-foundry/agents.md**：完整指南涵蓋：
  - AI 代理是什麼，以及與聊天機器人的差異
  - 三個快速啟動代理範本（Foundry Agents、Prompty、RAG）
  - 代理架構模式（單一代理、RAG、多代理）
  - 工具設定與客製化
  - 監控與度量追蹤
  - 成本考量與最佳化
  - 常見疑難排解情境
  - 三個實作練習與成功準則

#### 內容結構
- <strong>介紹</strong>：針對初學者的代理概念
- <strong>快速入門</strong>：使用 `azd init --template get-started-with-ai-agents` 部署代理
- <strong>架構模式</strong>：代理模式的視覺化圖示
- <strong>設定</strong>：工具設定與環境變數
- <strong>監控</strong>：整合 Application Insights
- <strong>練習</strong>：漸進式實作學習（每個 20-45 分鐘）

---

### [v3.12.0] - 2026-02-05

#### DevContainer 環境更新
**此版本更新開發容器設定，加入現代化工具與更佳的預設，以提升 AZD 學習體驗。**

#### 變更
- **🐳 基礎映像**：已從 `python:3.12-bullseye` 更新為 `python:3.12-bookworm`（最新的 Debian 穩定版）
- **📛 容器名稱**：為了清楚起見，已將名稱從 "Python 3" 重新命名為 "AZD for Beginners"

#### 新增
- **🔧 新的 Dev Container 功能**：
  - `azure-cli` 已啟用 Bicep 支援
  - `node:20`（AZD 範本的 LTS 版本）
  - `github-cli` 用於範本管理
  - `docker-in-docker` 用於容器應用部署

- **🔌 連接埠轉發**：為常見開發預先設定的連接埠：
  - 8000（MkDocs 預覽）
  - 3000（Web 應用）
  - 5000（Python Flask）
  - 8080（API）

- **🧩 新增 VS Code 延伸套件**：
  - `ms-python.vscode-pylance` - 強化的 Python 智慧提示 (IntelliSense)
  - `ms-azuretools.vscode-azurefunctions` - 支援 Azure Functions
  - `ms-azuretools.vscode-docker` - Docker 支援
  - `ms-azuretools.vscode-bicep` - Bicep 語言支援
  - `ms-azure-devtools.azure-resource-groups` - Azure 資源管理
  - `yzhang.markdown-all-in-one` - Markdown 編輯
  - `DavidAnson.vscode-markdownlint` - Markdown 風格檢查
  - `bierner.markdown-mermaid` - Mermaid 圖表支援
  - `redhat.vscode-yaml` - YAML 支援（用於 azure.yaml）
  - `eamodio.gitlens` - Git 視覺化
  - `mhutchie.git-graph` - Git 歷史

- **⚙️ VS Code 設定**：新增 Python 直譯器預設設定、儲存時格式化及去除多餘空白

- **📦 更新 requirements-dev.txt**：
  - 新增 MkDocs 壓縮 (minify) 外掛
  - 新增 pre-commit 以維護程式碼品質
  - 新增 Azure SDK 套件（azure-identity、azure-mgmt-resource）

#### 修正
- <strong>建立後命令</strong>：現在在容器啟動時會驗證 AZD 與 Azure CLI 是否已安裝

---

### [v3.11.0] - 2026-02-05

#### 初學者友善的 README 大改版
**此版本大幅改進 README.md，使其對初學者更友善，並新增 AI 開發者的重要資源。**

#### 新增
- **🆚 Azure CLI 與 AZD 比較**：清楚說明何時使用各工具，並附實務範例
- **🌟 精選 AZD 連結**：提供直接連結至社群範本集與貢獻資源：
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ 個可立即部署的範本
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - 社群貢獻
- **🎯 快速入門指南**：簡化為三步驟的入門章節（安裝 → 登入 → 部署）
- **📊 依經驗的導覽表**：根據開發者經驗提供清楚的起始建議

#### 變更
- **README 結構**：重新組織以漸進揭露（重要資訊優先）
- <strong>介紹區段</strong>：重寫以向完全初學者說明「`azd up` 的魔力」
- <strong>移除重複內容</strong>：刪除重複的疑難排解章節
- <strong>疑難排解指令</strong>：修正 `azd logs` 的參考，改為有效的 `azd monitor --logs`

#### 修正
- **🔐 認證指令**：在 cheat-sheet.md 中新增 `azd auth login` 與 `azd auth logout`
- <strong>無效指令參考</strong>：從 README 的疑難排解章節移除剩餘的 `azd logs`

#### 注意事項
- <strong>範圍</strong>：變更已套用於主 README.md 與 resources/cheat-sheet.md
- <strong>目標讀者</strong>：改善特別針對剛接觸 AZD 的開發者

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI 指令準確性更新
**此版本修正了文件中不存在的 AZD 指令，確保所有範例程式碼使用有效的 Azure Developer CLI 語法。**

#### 修正
- **🔧 移除不存在的 AZD 指令**：全面稽核並修正無效指令：
  - `azd logs`（不存在）→ 改為 `azd monitor --logs` 或使用 Azure CLI 替代方案
  - `azd service` 子指令（不存在）→ 改為 `azd show` 與 Azure CLI
  - `azd infra import/export/validate`（不存在）→ 已移除或以有效替代方案取代
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` 旗標（不存在）→ 已移除
  - `azd provision --what-if/--rollback` 旗標（不存在）→ 已更新為使用 `--preview`
  - `azd config validate`（不存在）→ 改為 `azd config list`
  - `azd info`, `azd history`, `azd metrics`（不存在）→ 已移除

- **📚 已更新的檔案（指令修正）**：
  - `resources/cheat-sheet.md`: 大幅檢修指令參考
  - `docs/deployment/deployment-guide.md`: 修正回滾與部署策略
  - `docs/troubleshooting/debugging.md`: 修正日誌分析章節
  - `docs/troubleshooting/common-issues.md`: 更新疑難排解指令
  - `docs/troubleshooting/ai-troubleshooting.md`: 修正 AZD 偵錯章節
  - `docs/getting-started/azd-basics.md`: 修正監控指令
  - `docs/getting-started/first-project.md`: 更新監控與除錯範例
  - `docs/getting-started/installation.md`: 修正說明與版本範例
  - `docs/pre-deployment/application-insights.md`: 修正檢視日誌指令
  - `docs/pre-deployment/coordination-patterns.md`: 修正代理偵錯指令

#### 變更
- <strong>回滾策略</strong>：更新文件以使用基於 Git 的回滾（AZD 本身沒有原生回滾功能）
- <strong>日誌檢視</strong>：將 `azd logs` 的參考改為 `azd monitor --logs`、`azd monitor --live` 與 Azure CLI 指令
- <strong>效能章節</strong>：移除不存在的平行/增量部署旗標，提供有效的替代方案

#### 技術細節
- **有效的 AZD 指令**：`init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **有效的 azd monitor 旗標**：`--live`, `--logs`, `--overview`
- <strong>移除功能</strong>：`azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### 注意事項
- <strong>驗證</strong>：指令已依 Azure Developer CLI v1.23.x 進行驗證

---

### [v3.9.0] - 2026-02-05

#### 完成工作坊與文件品質更新
**此版本完成互動式工作坊模組、修復所有損壞的文件連結，並提升使用 Microsoft AZD 的 AI 開發者之整體內容品質。**

#### 新增
- **📝 CONTRIBUTING.md**：新的貢獻指南文件，內容包含：
  - 清楚說明如何回報問題與提出修改建議
  - 新內容的文件標準
  - 程式碼範例指引與提交訊息慣例
  - 社群參與資訊

#### 已完成
- **🎯 工作坊 模組 7（總結）**：已完整完成總結模組，包含：
  - 工作坊成果的全面摘要
  - 掌握的關鍵概念（涵蓋 AZD、範本 和 Microsoft Foundry）
  - 後續學習建議
  - 工作坊挑戰練習與難度等級
  - 社群回饋與支援連結

- **📚 工作坊 模組 3（拆解）**：更新學習目標，包含：
  - GitHub Copilot 與 MCP 伺服器啟用指引
  - AZD 範本資料夾結構說明
  - 基礎設施即程式碼 (Bicep) 的組織模式
  - 實作實驗指示

- **🔧 工作坊 模組 6（拆除）**：已完成，包含：
  - 資源清理與成本管理目標
  - 使用 `azd down` 安全解除配置基礎設施的用法
  - 軟刪除的認知服務復原指引
  - 額外探索題：GitHub Copilot 與 Azure 入口網站

#### 修正
- **🔗 破損連結修復**：已解決 15+ 個內部文件的破損連結：
  - `docs/ai-foundry/ai-model-deployment.md`: 修正指向 microsoft-foundry-integration.md 的路徑
  - `docs/troubleshooting/ai-troubleshooting.md`: 修正 ai-model-deployment.md 與 production-ai-practices.md 的路徑
  - `docs/getting-started/first-project.md`: 將不存在的 cicd-integration.md 替換為 deployment-guide.md
  - `examples/retail-scenario.md`: 修正 FAQ 與排除故障指南的路徑
  - `examples/container-app/microservices/README.md`: 修正課程首頁與部署指南的路徑
  - `resources/faq.md` 和 `resources/glossary.md`: 更新 AI 章節參考
  - `course-outline.md`: 修正講師指南與 AI 工作坊實驗室參考

- **📅 工作坊狀態橫幅**：已從「Under Construction」更新為活動中，日期為 2026 年 2 月

- **🔗 工作坊 導覽**：修正 README.md 中指向不存在 lab-1-azd-basics 資料夾的破損導覽連結

#### 變更
- **工作坊 簡報**：移除「under construction」警告，工作坊現已完成並可使用
- <strong>導覽一致性</strong>：確保所有工作坊模組具有適當的模組間導覽
- <strong>學習路徑參考</strong>：更新章節交叉參照以使用正確的 microsoft-foundry 路徑

#### 已驗證
- ✅ 所有英文 Markdown 檔案的內部連結均有效
- ✅ 工作坊模組 0-7 已完成並具學習目標
- ✅ 章節與模組間的導覽功能正常
- ✅ 內容適合使用 Microsoft AZD 的 AI 開發者
- ✅ 整體保持適合初學者的語言與結構
- ✅ CONTRIBUTING.md 為社群貢獻者提供清晰指引

#### 技術實作
- <strong>連結驗證</strong>：自動化 PowerShell 腳本驗證所有 .md 內部連結
- <strong>內容稽核</strong>：人工檢閱工作坊完整性與是否適合初學者
- <strong>導覽系統</strong>：套用一致的章節與模組導覽模式

#### 備註
- <strong>範圍</strong>：變更僅套用於英文文件
- <strong>翻譯</strong>：本版未更新翻譯資料夾（自動翻譯稍後會同步）
- <strong>工作坊時長</strong>：完整工作坊現在提供 3-4 小時的實作學習

---

### [v3.8.0] - 2025-11-19

#### 進階文件：監控、安全與多代理模式
**本版本新增了關於 Application Insights 整合、認證模式與多代理協調的完整 A 級課程，適用於生產部署。**

#### 新增
- **📊 Application Insights 整合課程**：在 `docs/pre-deployment/application-insights.md`：
  - 以 AZD 為重點的部署與自動佈建
  - 包含 Application Insights + Log Analytics 的完整 Bicep 範本
  - 具有自訂遙測的可執行 Python 應用程式（1,200+ 行）
  - AI/LLM 監控模式（Microsoft Foundry Models token/成本追蹤）
  - 6 張 Mermaid 圖（架構、分散式追蹤、遙測流程）
  - 3 個實作練習（警示、儀表板、AI 監控）
  - Kusto 查詢範例與成本優化策略
  - 即時指標串流與即時除錯
  - 學習時間 40-50 分鐘，含生產就緒模式

- **🔐 認證與安全模式課程**：在 `docs/getting-started/authsecurity.md`：
  - 3 種認證模式（連線字串、Key Vault、託管身分）
  - 用於安全部署的完整 Bicep 基礎設施範本
  - 整合 Azure SDK 的 Node.js 應用程式程式碼
  - 3 個完整練習（啟用託管身分、使用者指派身分、Key Vault 輪替）
  - 安全最佳實務與 RBAC 設定
  - 故障排除指南與成本分析
  - 生產就緒的無密碼認證模式

- **🤖 多代理協調模式課程**：在 `docs/pre-deployment/coordination-patterns.md`：
  - 5 種協調模式（順序、平行、階層、事件驅動、共識）
  - 完整的協調器服務實作（Python/Flask，1,500+ 行）
  - 3 個專門代理實作（研究、撰寫、編輯）
  - 使用 Service Bus 整合訊息佇列
  - 使用 Cosmos DB 進行分散式系統的狀態管理
  - 6 張 Mermaid 圖顯示代理互動
  - 3 個進階練習（逾時處理、重試邏輯、斷路器）
  - 成本細項（$240-565/月）與優化策略
  - 整合 Application Insights 以進行監控

#### 強化
- <strong>預部署章節</strong>：現在包含完整的監控與協調模式
- <strong>入門章節</strong>：強化為專業認證模式
- <strong>生產準備度</strong>：從安全到可觀測性皆有完整涵蓋
- <strong>課程大綱</strong>：已更新，參考第 3 章與第 6 章的新課程

#### 變更
- <strong>學習進程</strong>：在整個課程中更好地整合安全與監控
- <strong>文件品質</strong>：新課程一致達到 A 等級標準（95-97%）
- <strong>生產模式</strong>：為企業部署提供完整端到端涵蓋

#### 改善
- <strong>開發者體驗</strong>：從開發到生產監控的清晰路徑
- <strong>安全標準</strong>：關於認證與機密管理的專業模式
- <strong>可觀測性</strong>：與 AZD 完整整合 Application Insights
- **AI 工作負載**：針對 Microsoft Foundry Models 與多代理系統的專門監控

#### 已驗證
- ✅ 所有課程包含完整可執行程式碼（非片段）
- ✅ Mermaid 圖以視覺化學習（3 課程共 19 張）
- ✅ 實作練習含驗證步驟（共 9 個）
- ✅ 生產就緒的 Bicep 範本，可透過 `azd up` 部署
- ✅ 成本分析與優化策略
- ✅ 故障排除指南與最佳實務
- ✅ 知識檢核點含驗證指令

#### 文件分級結果
- **docs/pre-deployment/application-insights.md**：- 全面的監控指南
- **docs/getting-started/authsecurity.md**：- 專業的安全模式
- **docs/pre-deployment/coordination-patterns.md**：- 進階的多代理架構
- **Overall New Content**：- 一致的高品質標準

#### 技術實作
- **Application Insights**：Log Analytics + 自訂遙測 + 分散式追蹤
- <strong>認證</strong>：託管身分 + Key Vault + RBAC 模式
- <strong>多代理</strong>：Service Bus + Cosmos DB + Container Apps + 協調
- <strong>監控</strong>：即時指標 + Kusto 查詢 + 警示 + 儀表板
- <strong>成本管理</strong>：取樣策略、保留政策、預算控管

### [v3.7.0] - 2025-11-19

#### 文件品質改進與新的 Microsoft Foundry Models 範例
**本版本提升了整個儲存庫的文件品質，並新增一個完整的 Microsoft Foundry Models 部署範例，含 gpt-4.1 聊天介面。**

#### 新增
- **🤖 Microsoft Foundry Models 聊天範例**：在 `examples/azure-openai-chat/` 中完整部署 gpt-4.1：
  - 完整的 Microsoft Foundry Models 基礎設施（gpt-4.1 模型部署）
  - 具有對話歷史的 Python 命令列聊天介面
  - 整合 Key Vault 以安全儲存 API 金鑰
  - Token 使用追蹤與成本估算
  - 速率限制與錯誤處理
  - 完整 README，部署指南 35-45 分鐘
  - 11 個生產就緒檔案（Bicep 範本、Python 應用程式、設定）
- **📚 文件練習**：在設定指南中新增實作練習：
  - 練習 1：多環境設定（15 分鐘）
  - 練習 2：機密管理實作（10 分鐘）
  - 清晰的成功標準與驗證步驟
- **✅ 部署驗證**：在部署指南新增驗證章節：
  - 健康檢查程序
  - 成功標準檢查表
  - 所有部署指令的預期輸出
  - 快速故障排除參考

#### 強化
- **examples/README.md**：更新至 A 級品質（93%）：
  - 在所有相關章節中新增 azure-openai-chat
  - 將本地範例數量從 3 更新為 4
  - 加入 AI 應用範例表
  - 整合到中階使用者的快速上手
  - 新增至 Microsoft Foundry 範本區段
  - 更新比較矩陣與技術發現章節
- <strong>文件品質</strong>：在 docs 資料夾中從 B+ (87%) 提升至 A- (92%)：
  - 在關鍵指令範例中新增預期輸出
  - 為設定變更加入驗證步驟
  - 以實作練習強化實務學習

#### 變更
- <strong>學習進程</strong>：為中階學習者更好地整合 AI 範例
- <strong>文件結構</strong>：提供更可執行的練習與明確結果
- <strong>驗證流程</strong>：在關鍵工作流程中新增明確的成功標準

#### 改善
- <strong>開發者體驗</strong>：Microsoft Foundry Models 部署現在需時 35-45 分鐘（相較於複雜替代方案的 60-90 分鐘）
- <strong>成本透明度</strong>：Microsoft Foundry Models 範例的明確成本估算（$50-200/月）
- <strong>學習路徑</strong>：AI 開發者可透過 azure-openai-chat 有明確入門點
- <strong>文件標準</strong>：一致的預期輸出與驗證步驟

#### 已驗證
- ✅ Microsoft Foundry Models 範例可完整以 `azd up` 部署
- ✅ 所有 11 個實作檔案語法正確
- ✅ README 指示與實際部署體驗相符
- ✅ 文件連結已在 8+ 個位置更新
- ✅ 範例索引正確反映 4 個本地範例
- ✅ 表格中無重複的外部連結
- ✅ 所有導覽參考正確

#### 技術實作
- **Microsoft Foundry Models 架構**：gpt-4.1 + Key Vault + Container Apps 模式
- <strong>安全</strong>：準備好託管身分，機密儲存在 Key Vault
- <strong>監控</strong>：整合 Application Insights
- <strong>成本管理</strong>：Token 追蹤與使用優化
- <strong>部署</strong>：單一 `azd up` 指令完成整套部署

### [v3.6.0] - 2025-11-19

#### 重大更新：Container App 部署範例
**本版本新增使用 Azure Developer CLI (AZD) 的完整、可生產部署之容器應用程式部署範例，並將其完整整合至學習路徑。**

#### 新增
- **🚀 Container App 範例**：在 `examples/container-app/` 新增本地範例：
  - [總覽指南](examples/container-app/README.md): 容器化部署的完整概覽、快速上手、生產與進階模式
  - [簡易 Flask API](../../examples/container-app/simple-flask-api): 適合初學者的 REST API，含 scale-to-zero、健康檢查、監控與故障排除
  - [微服務架構](../../examples/container-app/microservices): 生產就緒的多服務部署（API Gateway、Product、Order、User、Notification），非同步訊息、Service Bus、Cosmos DB、Azure SQL、分散式追蹤、藍綠/金絲雀部署
- <strong>最佳實務</strong>：針對容器化工作負載的安全、監控、成本優化與 CI/CD 指引
- <strong>程式範例</strong>：完整 `azure.yaml`、Bicep 範本，以及多語言服務實作（Python、Node.js、C#、Go）
- <strong>測試與故障排除</strong>：端到端測試情境、監控指令、故障排除指引

#### 變更
- **README.md**：更新以展示並連結新的 container app 範例，置於「本地範例 - 容器應用」之下
- **examples/README.md**：更新以強調 container app 範例、加入比較矩陣項目，並更新技術/架構參考
- <strong>課程大綱與學習指南</strong>：更新以在相關章節參考新的 container app 範例與部署模式

#### 已驗證
- ✅ 所有新範例皆可使用 `azd up` 部署並符合最佳實務
- ✅ 文件交叉連結與導覽已更新
- ✅ 範例涵蓋從初學者到進階情境，包括生產微服務

#### 備註
- <strong>範圍</strong>：僅限英文文件與範例
- <strong>後續步驟</strong>：在未來版本擴展其他進階容器模式與 CI/CD 自動化

### [v3.5.0] - 2025-11-19

#### 產品重新命名：Microsoft Foundry
**本版本在所有英文文件中實施了從「Microsoft Foundry」到「Microsoft Foundry」的全面產品名稱變更，以反映微軟的官方重新命名。**

#### 變更
- **🔄 產品名稱更新**：從「Microsoft Foundry」全面重新命名為「Microsoft Foundry」
  - 更新 `docs/` 資料夾中所有英文文件的參考
  - 重新命名資料夾：`docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Renamed file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 content references updated across 7 documentation files

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` renamed to `docs/microsoft-foundry/`
  - All cross-references updated to reflect new folder structure
  - Navigation links validated across all documentation

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - All internal links updated to reference new filename

#### Updated Files
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 更新了 3 個導覽連結
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 更新了 4 個產品名稱參考
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - 已經使用 Microsoft Foundry (from previous updates)
  - `docs/microsoft-foundry/production-ai-practices.md` - 更新了 3 個參考 (overview, community feedback, documentation)
  - `docs/getting-started/azd-basics.md` - 更新了 4 個交叉參考連結
  - `docs/getting-started/first-project.md` - 更新了 2 個章節導覽連結
  - `docs/getting-started/installation.md` - 更新了 2 個下一章節連結
  - `docs/troubleshooting/ai-troubleshooting.md` - 更新了 3 個參考 (navigation, Discord community)
  - `docs/troubleshooting/common-issues.md` - 更新了 1 個導覽連結
  - `docs/troubleshooting/debugging.md` - 更新了 1 個導覽連結

- **Course Structure Files** (2 files):
  - `README.md` - 更新了 17 個參考 (course overview, chapter titles, templates section, community insights)
  - `course-outline.md` - 更新了 14 個參考 (overview, learning objectives, chapter resources)

#### Validated
- ✅ Zero remaining "ai-foundry" folder path references in English docs
- ✅ Zero remaining "Microsoft Foundry" product name references in English docs
- ✅ All navigation links functional with new folder structure
- ✅ File and folder renames completed successfully
- ✅ Cross-references between chapters validated

#### Notes
- **Scope**: Changes applied to English documentation in `docs/` folder only
- **Translations**: Translation folders (`translations/`) not updated in this version
- **Workshop**: Workshop materials (`workshop/`) not updated in this version
- **Examples**: Example files may still reference legacy naming (to be addressed in future update)
- **External Links**: External URLs and GitHub repository references remain unchanged

#### Migration Guide for Contributors
If you have local branches or documentation referencing the old structure:
1. Update folder references: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update file references: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Replace product name: "Microsoft Foundry" → "Microsoft Foundry"
4. Validate all internal documentation links still work

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**This version introduces comprehensive support for the new Azure Developer CLI preview feature and enhances workshop user experience.**

#### Added
- **🧪 azd provision --preview Feature Documentation**: Comprehensive coverage of the new infrastructure preview capability
  - Command reference and usage examples in cheat sheet
  - Detailed integration in provisioning guide with use cases and benefits
  - Pre-flight check integration for safer deployment validation
  - Getting started guide updates with safety-first deployment practices
- **🚧 Workshop Status Banner**: Professional HTML banner indicating workshop development status
  - Gradient design with construction indicators for clear user communication
  - Last updated timestamp for transparency
  - Mobile-responsive design for all device types

#### Enhanced
- **Infrastructure Safety**: Preview functionality integrated throughout deployment documentation
- **Pre-deployment Validation**: Automated scripts now include infrastructure preview testing
- **Developer Workflow**: Updated command sequences to include preview as best practice
- **Workshop Experience**: Clear expectations set for users about content development status

#### Changed
- **Deployment Best Practices**: Preview-first workflow now recommended approach
- **Documentation Flow**: Infrastructure validation moved earlier in learning process
- **Workshop Presentation**: Professional status communication with clear development timeline

#### Improved
- **Safety-First Approach**: Infrastructure changes can now be validated before deployment
- **Team Collaboration**: Preview results can be shared for review and approval
- **Cost Awareness**: Better understanding of resource costs before provisioning
- **Risk Mitigation**: Reduced deployment failures through advance validation

#### Technical Implementation
- **Multi-document Integration**: Preview feature documented across 4 key files
- **Command Patterns**: Consistent syntax and examples throughout documentation
- **Best Practice Integration**: Preview included in validation workflows and scripts
- **Visual Indicators**: Clear NEW feature markings for discoverability

#### Workshop Infrastructure
- **Status Communication**: Professional HTML banner with gradient styling
- **User Experience**: Clear development status prevents confusion
- **Professional Presentation**: Maintains repository credibility while setting expectations
- **Timeline Transparency**: October 2025 last updated timestamp for accountability

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**This version introduces comprehensive workshop materials with browser-based interactive guides and structured learning paths.**

#### Added
- **🎥 Interactive Workshop Guide**: Browser-based workshop experience with MkDocs preview capability
- **📝 Structured Workshop Instructions**: 7-step guided learning path from discovery to customization
  - 0-Introduction: Workshop overview and setup
  - 1-Select-AI-Template: Template discovery and selection process
  - 2-Validate-AI-Template: Deployment and validation procedures
  - 3-Deconstruct-AI-Template: Understanding template architecture
  - 4-Configure-AI-Template: Configuration and customization
  - 5-Customize-AI-Template: Advanced modifications and iterations
  - 6-Teardown-Infrastructure: Cleanup and resource management
  - 7-Wrap-up: Summary and next steps
- **🛠️ Workshop Tooling**: MkDocs configuration with Material theme for enhanced learning experience
- **🎯 Hands-On Learning Path**: 3-step methodology (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces Integration**: Seamless development environment setup

#### Enhanced
- **AI Workshop Lab**: Extended with comprehensive 2-3 hour structured learning experience
- **Workshop Documentation**: Professional presentation with navigation and visual aids
- **Learning Progression**: Clear step-by-step guidance from template selection to production deployment
- **Developer Experience**: Integrated tooling for streamlined development workflows

#### Improved
- **Accessibility**: Browser-based interface with search, copy functionality, and theme toggle
- **Self-Paced Learning**: Flexible workshop structure accommodating different learning speeds
- **Practical Application**: Real-world AI template deployment scenarios
- **Community Integration**: Discord integration for workshop support and collaboration

#### Workshop Features
- **Built-in Search**: Quick keyword and lesson discovery
- **Copy Code Blocks**: Hover-to-copy functionality for all code examples
- **Theme Toggle**: Dark/light mode support for different preferences
- **Visual Assets**: Screenshots and diagrams for enhanced understanding
- **Help Integration**: Direct Discord access for community support

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**This version introduces a comprehensive chapter-based learning structure with enhanced navigation throughout the entire repository.**

#### Added
- **📚 Chapter-Based Learning System**: Restructured entire course into 8 progressive learning chapters
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Comprehensive Navigation System**: Consistent navigation headers and footers across all documentation
- **🎯 Progress Tracking**: Course completion checklist and learning verification system
- **🗺️ Learning Path Guidance**: Clear entry points for different experience levels and goals
- **🔗 Cross-Reference Navigation**: Related chapters and prerequisites clearly linked

#### Enhanced
- **README Structure**: Transformed into a structured learning platform with chapter-based organization
- **Documentation Navigation**: Every page now includes chapter context and progression guidance
- **Template Organization**: Examples and templates mapped to appropriate learning chapters
- **Resource Integration**: Cheat sheets, FAQs, and study guides connected to relevant chapters
- **Workshop Integration**: Hands-on labs mapped to multiple chapter learning objectives

#### Changed
- **Learning Progression**: Moved from linear documentation to flexible chapter-based learning
- **Configuration Placement**: Repositioned configuration guide as Chapter 3 for better learning flow
- **AI Content Integration**: Better integration of AI-specific content throughout the learning journey
- **Production Content**: Advanced patterns consolidated in Chapter 8 for enterprise learners

#### Improved
- **User Experience**: Clear navigation breadcrumbs and chapter progression indicators
- **Accessibility**: Consistent navigation patterns for easier course traversal
- **Professional Presentation**: University-style course structure suitable for academic and corporate training
- **Learning Efficiency**: Reduced time to find relevant content through improved organization

#### Technical Implementation
- **Navigation Headers**: Standardized chapter navigation across 40+ documentation files
- **Footer Navigation**: Consistent progression guidance and chapter completion indicators
- **Cross-Linking**: Comprehensive internal linking system connecting related concepts
- **Chapter Mapping**: Templates and examples clearly associated with learning objectives

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: Restructured study guide to align with 8-chapter system
- **🎯 Chapter-Based Assessment**: Each chapter includes specific learning objectives and practical exercises
- **📋 Progress Tracking**: Weekly learning schedule with measurable outcomes and completion checklists
- **❓ Assessment Questions**: Knowledge validation questions for each chapter with professional outcomes
- **🛠️ Practical Exercises**: Hands-on activities with real deployment scenarios and troubleshooting
- **📊 Skill Progression**: Clear advancement from basic concepts to enterprise patterns with career development focus
- **🎓 Certification Framework**: Professional development outcomes and community recognition system
- **⏱️ Timeline Management**: Structured 10-week learning plan with milestone validation

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**This version improves the multi-agent retail solution with better agent naming and enhanced documentation.**

#### Changed
- **Multi-Agent Terminology**: Replaced "Cora agent" with "Customer agent" throughout retail multi-agent solution for clearer understanding
- **Agent Architecture**: Updated all documentation, ARM templates, and code examples to use consistent "Customer agent" naming
- **Configuration Examples**: Modernized agent configuration patterns with updated naming conventions
- **Documentation Consistency**: Ensured all references use professional, descriptive agent names

#### Enhanced
- **ARM Template Package**: Updated retail-multiagent-arm-template with Customer agent references
- **Architecture Diagrams**: Refreshed Mermaid diagrams with updated agent naming
- **Code Examples**: Python classes and implementation examples now use CustomerAgent naming
- **Environment Variables**: Updated all deployment scripts to use CUSTOMER_AGENT_NAME conventions

#### Improved
- **Developer Experience**: Clearer agent roles and responsibilities in documentation
- **Production Readiness**: Better alignment with enterprise naming conventions
- **Learning Materials**: More intuitive agent naming for educational purposes
- **Template Usability**: Simplified understanding of agent functions and deployment patterns

#### Technical Details
- Updated Mermaid architecture diagrams with CustomerAgent references
- Replaced CoraAgent class names with CustomerAgent in Python examples
- Modified ARM template JSON configurations to use "customer" agent type
- Updated environment variables from CORA_AGENT_* to CUSTOMER_AGENT_* patterns
- Refreshed all deployment commands and container configurations

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**This version transforms the repository into a comprehensive AI-focused learning resource with Microsoft Foundry integration.**

#### Added
- **🤖 AI-First Learning Path**: Complete restructure prioritizing AI developers and engineers
- **Microsoft Foundry Integration Guide**: Comprehensive documentation for connecting AZD with Microsoft Foundry services
- **AI Model Deployment Patterns**: Detailed guide covering model selection, configuration, and production deployment strategies
- **AI Workshop Lab**: 2-3 小時的實作工作坊，將 AI 應用轉換為可由 AZD 部署的解決方案
- **Production AI Best Practices**: 適合企業的模式，用於擴展、監控和保護 AI 工作負載
- **AI-Specific Troubleshooting Guide**: 提供對 Microsoft Foundry 模型、Cognitive Services 以及 AI 部署問題的全面疑難排解
- **AI Template Gallery**: 精選的 Microsoft Foundry 範本集合，並附帶複雜度評分
- **Workshop Materials**: 完整的工作坊結構，包含實作實驗與參考資料

#### Enhanced
- **README Structure**: 以 AI 開發者為主，並包含來自 Microsoft Foundry Discord 的 45% 社群興趣數據
- **Learning Paths**: 為 AI 開發者設計的專屬學習歷程，與學生和 DevOps 工程師的傳統路徑並列
- **Template Recommendations**: 精選 AI 範本，包括 azure-search-openai-demo、contoso-chat 和 openai-chat-app-quickstart
- **Community Integration**: 加強的 Discord 社群支援，包含 AI 專屬頻道與討論

#### Security & Production Focus
- **Managed Identity Patterns**: AI 專用的驗證與安全設定模式
- **Cost Optimization**: 針對 AI 工作負載的 token 使用追蹤與預算控管
- **Multi-Region Deployment**: 全球 AI 應用部署策略
- **Performance Monitoring**: AI 專屬指標與 Application Insights 整合

#### Documentation Quality
- **Linear Course Structure**: 從入門到進階 AI 部署模式的合乎邏輯學習進程
- **Validated URLs**: 所有外部程式庫連結已驗證且可存取
- **Complete Reference**: 所有內部文件連結已驗證且可運作
- **Production Ready**: 含實務範例的企業部署模式

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**This version represents a significant overhaul of the repository structure and content presentation.**

#### Added
- **Structured Learning Framework**: 所有文件頁面現在都包含簡介、學習目標與學習成果章節
- **Navigation System**: 在所有文件中新增「上一課/下一課」連結，以引導學習進程
- **Study Guide**: 提供學習目標、練習題與評量資料的完整 study-guide.md
- **Professional Presentation**: 移除所有表情符號圖示以提升無障礙與專業外觀
- **Enhanced Content Structure**: 改善學習材料的組織與流程

#### Changed
- **Documentation Format**: 將所有文件標準化為一致的以學習為中心的結構
- **Navigation Flow**: 在所有學習材料中實施合乎邏輯的進程
- **Content Presentation**: 移除裝飾性元素，以換取清晰且專業的格式
- **Link Structure**: 更新所有內部連結以支援新的導覽系統

#### Improved
- **Accessibility**: 移除對表情符號的依賴，以提升螢幕閱讀器相容性
- **Professional Appearance**: 清爽、學術風格的呈現，適合企業學習
- **Learning Experience**: 結構化方法，為每一課提供清晰的目標與成果
- **Content Organization**: 改善相關主題間的邏輯流程與連結

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- <strong>核心文件結構</strong>
  - 完整的入門指南系列
  - 完整的部署與資源佈建文件
  - 詳細的疑難排解資源與除錯指南
  - 預部署驗證工具與程序

- <strong>入門模組</strong>
  - AZD 基礎：核心概念與術語
  - 安裝指南：平台特定的設定說明
  - 設定指南：環境設定與驗證
  - 第一個專案教學：逐步實作學習

- <strong>部署與資源佈建模組</strong>
  - 部署指南：完整工作流程文件
  - 佈建指南：使用 Bicep 的基礎架構即程式碼
  - 生產部署的最佳實務
  - 多服務架構模式

- <strong>預部署驗證模組</strong>
  - 容量規劃：Azure 資源可用性驗證
  - SKU 選擇：完整的服務方案指引
  - 起飛前檢查：自動化驗證腳本（PowerShell 與 Bash）
  - 成本估算與預算規劃工具

- <strong>疑難排解模組</strong>
  - 常見問題：常遇到的問題與解決方案
  - 除錯指南：系統化的疑難排解方法
  - 進階診斷技術與工具
  - 效能監控與優化

- <strong>資源與參考</strong>
  - 指令速查表：重要指令的快速參考
  - 詞彙表：完整的術語與縮寫定義
  - 常見問題：對常見提問的詳細回答
  - 外部資源連結與社群連繫

- <strong>範例與範本</strong>
  - 簡單 Web 應用範例
  - 靜態網站部署範本
  - 容器應用設定
  - 資料庫整合模式
  - 微服務架構範例
  - 無伺服器函式實作

#### Features
- <strong>跨平台支援</strong>: 提供 Windows、macOS 與 Linux 的安裝與設定指南
- <strong>多種技能層級</strong>: 內容針對從學生到專業開發者的多種技能層級設計
- <strong>實作導向</strong>: 實作範例與真實世界情境
- <strong>完整涵蓋</strong>: 從基本概念到進階企業模式的完整涵蓋
- **Security-First Approach**: 將安全最佳實務整合於各處
- **Cost Optimization**: 關於成本效益部署與資源管理的指引

#### Documentation Quality
- <strong>詳細程式碼範例</strong>: 實用且已測試的程式碼範例
- <strong>逐步指示</strong>: 清晰且可操作的指導
- <strong>完整的錯誤處理</strong>: 針對常見問題的疑難排解
- <strong>最佳實務整合</strong>: 行業標準與建議
- <strong>版本相容性</strong>: 與最新 Azure 服務及 azd 功能保持同步

## 計畫中的未來增強

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: 支援 Hugging Face、Azure Machine Learning 與自訂模型的整合模式
- **AI Agent Frameworks**: 針對 LangChain、Semantic Kernel 與 AutoGen 部署的範本
- **Advanced RAG Patterns**: 除 Azure AI Search 外的向量資料庫選項（Pinecone、Weaviate 等）
- **AI Observability**: 強化模型效能、token 使用與回應品質的監控

#### Developer Experience
- **VS Code Extension**: 整合 AZD 與 Microsoft Foundry 的開發體驗
- **GitHub Copilot Integration**: AI 輔助的 AZD 範本產生
- **Interactive Tutorials**: 具自動驗證的互動式實作練習，針對 AI 情境
- **Video Content**: 針對視覺學習者的補充視訊教學，重點為 AI 部署

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: AI 模型治理、合規與稽核記錄
- **Multi-Tenant AI**: 為多個客戶提供隔離 AI 服務的模式
- **Edge AI Deployment**: 與 Azure IoT Edge 及容器實例的整合
- **Hybrid Cloud AI**: AI 工作負載的多雲與混合部署模式

#### Advanced Features
- **AI Pipeline Automation**: 與 Azure Machine Learning 流程整合的 MLOps 自動化
- **Advanced Security**: 零信任模式、私人端點與進階威脅防護
- **Performance Optimization**: 針對高吞吐量 AI 應用的進階調校與擴展策略
- **Global Distribution**: AI 應用的內容傳遞與邊緣快取模式

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: 全面的 Microsoft Foundry 整合（已完成）
- ✅ **Interactive Tutorials**: 實作式 AI 工作坊實驗室（已完成）
- ✅ **Advanced Security Module**: AI 專用的安全模式（已完成）
- ✅ **Performance Optimization**: AI 工作負載調優策略（已完成）

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: 以 AI 為重點的部署情境（已完成）
- ✅ **Extended FAQ**: AI 專用的問題與疑難排解（已完成）
- **Tool Integration**: 強化的 IDE 與編輯器整合指南
- ✅ **Monitoring Expansion**: AI 專屬的監控與告警模式（已完成）

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: 針對行動學習的響應式設計
- **Offline Access**: 可下載的文件套件
- **Enhanced IDE Integration**: 用於 AZD + AI 工作流程的 VS Code 擴充功能
- **Community Dashboard**: 即時社群指標與貢獻追蹤

## Contributing to the Changelog

### Reporting Changes
在對此儲存庫做出貢獻時，請確保變更記錄條目包含：

1. **Version Number**: 遵循語義化版本號（major.minor.patch）
2. **Date**: 發行或更新日期，格式為 YYYY-MM-DD
3. **Category**: 分類：Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: 簡潔描述變更內容
5. **Impact Assessment**: 變更對現有使用者的影響

### Change Categories

#### 新增
- 新增功能、文件章節或能力
- 新增範例、範本或學習資源
- 額外工具、腳本或實用程式

#### 變更
- 對既有功能或文件的修改
- 提升清晰度或準確度的更新
- 內容或組織結構的重整

#### 已棄用
- 正在逐步淘汰的功能或方法
- 預定移除的文件章節
- 已有更佳替代方法的做法

#### 移除
- 不再相關的功能、文件或範例
- 過時資訊或已棄用的方法
- 冗餘或已整合的內容

#### 修正
- 對文件或程式碼錯誤的修正
- 已回報問題或故障的解決
- 提升準確性或功能性的改善

#### 安全
- 與安全相關的改進或修補
- 更新安全最佳實務
- 資安漏洞的修補

### Semantic Versioning Guidelines

#### 主要版本 (X.0.0)
- 需要使用者採取行動的重大變更
- 內容或組織的重大重構
- 改變基本方法或方法論的變更

#### 次要版本 (X.Y.0)
- 新增功能或內容
- 維持向後相容的增強功能
- 額外的範例、工具或資源

#### 修補版本 (X.Y.Z)
- 錯誤修正與更正
- 對既有內容的小幅改進
- 說明與小幅強化

## Community Feedback and Suggestions

我們積極鼓勵社群回饋來改進此學習資源：

### How to Provide Feedback
- **GitHub Issues**: 回報問題或建議改善（歡迎 AI 相關問題）
- **Discord Discussions**: 分享想法並與 Microsoft Foundry 社群互動
- **Pull Requests**: 直接為內容提出改進，特別是 AI 範本與指南
- **Microsoft Foundry Discord**: 參與 #Azure 頻道，討論 AZD + AI 主題
- **Community Forums**: 參與更廣泛的 Azure 開發者討論

### Feedback Categories
- **AI Content Accuracy**: 修正 AI 服務整合與部署資訊的錯誤
- **Learning Experience**: 對改善 AI 開發者學習流程的建議
- **Missing AI Content**: 針對額外 AI 範本、模式或範例的需求
- **Accessibility**: 對多元學習需求的改善
- **AI Tool Integration**: 關於更佳 AI 開發工作流程整合的建議
- **Production AI Patterns**: 針對企業 AI 部署模式的需求

### Response Commitment
- **Issue Response**: 在 48 小時內回應已回報的問題
- **Feature Requests**: 在一週內評估
- **Community Contributions**: 在一週內審核
- **Security Issues**: 優先處理並迅速回應

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: 內容準確性與連結驗證
- **Quarterly Updates**: 重大內容新增與改進
- **Semi-Annual Reviews**: 全面重構與增強
- **Annual Releases**: 重大版本更新與顯著改進

### Monitoring and Quality Assurance
- **Automated Testing**: 定期驗證程式碼範例與連結
- **Community Feedback Integration**: 定期納入使用者建議
- **Technology Updates**: 與最新 Azure 服務和 azd 發行版保持一致
- **Accessibility Audits**: 定期檢視以符合共融設計原則

## Version Support Policy

### Current Version Support
- **Latest Major Version**: 提供完整支援並定期更新
- **Previous Major Version**: 提供 12 個月的安全更新與重大修補
- **Legacy Versions**: 僅由社群支援，無官方更新

### Migration Guidance
當主要版本釋出時，我們提供：
- **Migration Guides**: 逐步遷移指引
- **Compatibility Notes**: 有關破壞性變更的細節
- **Tool Support**: 協助遷移的腳本或工具
- **Community Support**: 專門的論壇以討論遷移問題

---

<strong>導覽</strong>
- **Previous Lesson**: [學習指南](resources/study-guide.md)
- **Next Lesson**: 返回 [主要 README](README.md)

<strong>保持更新</strong>: 持續關注此儲存庫，以取得有關新版本與學習材料重要更新的通知。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->