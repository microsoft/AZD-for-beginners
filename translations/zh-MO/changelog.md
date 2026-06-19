# 變更日誌 - AZD For Beginners

## 介紹

此變更日誌記錄 AZD For Beginners 儲存庫的所有重要變更、更新與改進。我們遵循語義版本控制原則，並維護此日誌以幫助使用者了解各版本之間的變更。

## 學習目標

透過檢閱此變更日誌，您將能：
- 了解新的功能與內容新增
- 理解現有文件的改進內容
- 跟蹤錯誤修正與更正以確保準確性
- 追蹤學習素材隨時間的演進

## 學習成果

在檢閱變更條目後，您將能：
- 辨識可用於學習的新內容與資源
- 理解哪些章節已被更新或改進
- 根據最新教材規劃您的學習路徑
- 提供回饋與建議以促進未來改進

## 版本歷史

### [v3.22.0] - 2026-06-16

#### Beginner Gap-Fill #2: 模板撰寫、開發容器、Pulumi、Azure DevOps、服務主體，以及更多
**此版本填補了 azd-coverage 分析所揭露的剩餘中階差距：如何撰寫並發佈您自己的模板、可重現的開發容器/Codespaces 環境、Pulumi 基礎設施提供者、Azure DevOps CI/CD 操作指南、服務主體驗證、主機選擇指引（AKS/Spring Apps）、`azd restore`/`azd package` 說明、Hook 錯誤處理，以及團隊/共用環境實務。**

#### 已新增
- **🧱 新的第 4 章課程** `docs/chapter-04-infrastructure/custom-templates.md` — 撰寫您自己的 azd 範本：必要結構（`azure.yaml`, `infra/`, `src/`）、`metadata.template` 欄位、使用 `uniqueString()` 資源標記與 `azd-env-name` 標籤來參數化基礎設施、使用 `azd init --template <local-path>` 在本機測試、發佈到 GitHub，以及提交至 Awesome AZD 展示庫
- **📦 新的第 1 章課程** `docs/chapter-01-foundation/dev-containers.md` — 使用 Dev Containers 與 GitHub Codespaces 建立可重現的 azd 環境：一個最小的 `.devcontainer/devcontainer.json`，使用官方 `ghcr.io/azure/azure-dev/azd` feature、語言專屬的 feature、用於容器主機的 `docker-in-docker`，以及遠端登入的 `azd auth login --use-device-code`
- **🧩 Pulumi 與 azd** 節在 `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`、Pulumi 資料夾佈局、stacks 與 azd 環境的對應、必要的輸出/標記，以及相同的 `azd up` / `azd down` 工作流程
- **🎯 主機選擇指引** 在 `docs/chapter-04-infrastructure/provisioning.md` — 對 `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, 與 `springapp` 的初學者友善比較，以及何時選擇 AKS 或 Azure Spring Apps 的建議
- **🛠️ Azure DevOps CI/CD 操作指南** 在 `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`、使用工作負載身份聯合 (OIDC) 的 Service Connection、產生的 `azure-dev.yml`，以及變數群組設定
- **🔑 服務主體（模式 4）** 新增於 `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`、以非互動方式使用 client secret 與聯合/OIDC 憑證的 `azd auth login`、何時使用，以及安全的憑證儲存方式
- **🪝 Hook 錯誤處理** 子段在 `docs/chapter-04-infrastructure/deployment-guide.md` — 退出代碼與 `set -e`、`continueOnError`、使用 `azd hooks run` 在隔離環境測試 hooks、作業系統特定的 shell，與 `--debug`
- **👥 團隊 / 共用環境** 節在 `docs/chapter-03-configuration/configuration.md` — `.azure/` 中應包含的內容、gitignore 建議、每位開發者的環境、`azd env list`/`select`，以及在 CI/CD 中提供環境值的方法
- **🧰 `azd restore` 與擴充的 `azd package`** 說明在 `resources/cheat-sheet.md` — 還原相依性與在不部署的情況下建立可部署的 artifact

#### 已變更
- **🧭 第 4 章課程表** 已更新以包含新的「撰寫您自己的模板」課程（課程 3）
- **🧭 第 1 章課程表** 已更新以包含新的「Dev Containers & Codespaces」課程（課程 5）；導覽頁腳已在 `bring-your-own-app.md` 與 `dev-containers.md` 之間連接

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: 實作多代理課程、「加入您自己的應用」、Terraform，與 CI/CD 操作指南
**此版本透過新增兩個實作課程（可部署的多代理操作流程與將 azd 新增到現有應用）、一個初學者導向的 hooks 介紹、Terraform 與 azd 的章節、逐步的 GitHub Actions 管線操作指南、新預覽擴充套件的說明，以及明確的部署驗證檢查清單，關閉了成為完整初學者指南的最大缺口。**

#### 已新增
- **🤝 新的第 5 章課程** `docs/chapter-05-multi-agent/multi-agent-basics.md` — 一個完整實作、可部署的雙代理操作流程（協調器 + 專家）使用真實範本（`contoso-creative-writer`），涵蓋何時使用多代理、`azd up` 工作流程、理解已部署的資源、跨代理追蹤、客製化，與清理
- **📦 新的第 1 章課程** `docs/chapter-01-foundation/bring-your-own-app.md` — 如何使用 `azd init`（「使用目前目錄中的程式碼」）將 azd 新增到既有專案、理解 `azure.yaml` 與 `infra/`、`azd infra generate`、主機偵測，以及使用 `azd up` 部署
- **🌐 Terraform 與 azd** 節新增至 `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` 設定、`.tf` 資料夾佈局、必要的 `AZURE_*` 輸出與 `azd-env-name` 標記，以及相同的 `azd up` / `azd down` 工作流程（補上先前只展示 Bicep 的情況下聲稱支援 Terraform 的落差）
- **⚙️ 逐步的 GitHub Actions 操作指南** 在 `docs/chapter-08-production/production-ai-practices.md` — 從 GitHub 倉庫到自動部署：`azd pipeline config`、OIDC 聯合憑證（無儲存的祕密）、產生的 `azure-dev.yml`，以及祕密與變數的取捨建議
- **🪝 初學者「初識 hooks？」介紹** 在 `docs/chapter-04-infrastructure/deployment-guide.md` — 何謂 hook、hook 階段表、最小的第一個 hook，與使用 `azd hooks run` 手動執行 hooks
- **✅「驗證您的部署」檢查清單** 新增於 `docs/chapter-01-foundation/first-project.md` 的步驟 5 — 煙霧測試、健康端點檢查、以及明確的成功準則
- **🧩 新預覽擴充套件說明** `azure.ai.skills` 與 `azure.ai.connections`（它們是什麼以及何時使用）在 `docs/chapter-08-production/production-ai-practices.md`

#### 已變更
- **🧭 第 5 章課程表** 修正：`multi-agent-basics.md` 現為課程 1（唯一完全實作的課程），並誠實標示課程 2 位於第 6 章且零售場景為一個架構藍圖，而非一鍵部署的範本
- **🧭 第 1 章課程表** 現包含新的「加入您自己的應用」課程（課程 4）
- **🔗 導覽頁腳** 已更新：`first-project.md` 現在會向前連結到 `bring-your-own-app.md`

#### 已修正
- **🧱 關閉「聲稱但缺失」的 Terraform 缺口** — 課程先前提到 Terraform 支援卻沒有示範
- **🔀 修正誤導性的第 5 章交叉連結**，避免暗示存在完整的多代理實作而實際上只有架構藍圖

#### 已更新檔案
- `changelog.md`
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

#### AZD 1.25.6 更新、完整代理生命週期指令與 Aspire 品牌重塑
**此版本針對 `azd` `1.25.6`（2026 年 6 月）與 `azure.ai.agents` `0.1.40-preview` 擴充套件重新驗證課程，將 AI 指導從「生成代理」擴充為完整代理生命週期（測試 → 評估 → 優化 → 檢查 → 刪除），揭示新的 `azure.ai.skills` 與 `azure.ai.connections` 預覽擴充套件，並註記 ".NET Aspire" → "Aspire" 的產品品牌重塑。**

#### 已新增
- **🔁 完整代理生命週期涵蓋**，面向初學者與 AI 工程師，散見於文件：
  - `docs/chapter-01-foundation/azd-basics.md` — 在 Extensions and AI Commands 節新增生命週期表（scaffold → test → measure → improve → inspect → clean up）
  - `docs/chapter-08-production/production-ai-practices.md` — 新增「管理代理生命週期」章節，涵蓋 `azd ai agent invoke`、`endpoint show`、`eval generate`、`optimize`、`code download`，以及 `delete --force`
  - `resources/cheat-sheet.md` — 擴充的 AI 代理指令，包含 `invoke`、`endpoint show`、`eval generate`、`optimize`、`code download`，以及 `delete --force`
- **🧩 新預覽擴充套件文件化**：`azure.ai.skills`（可重用的代理技能）與 `azure.ai.connections`（Foundry 連線）已新增至擴充套件表與速查表
- **⏱️ 回應時間指引** — 在 `azd ai agent invoke` 範例中註明其會列印總延遲與首位元組時間
- **📌 版本橫幅** 在根目錄 README 提示學習者使用 `azd version` 與 `azd upgrade`

#### 已變更
- **✅ 驗證基線已更新**，從 `azd 1.23.12`（2026 年 3 月）更新為 `azd 1.25.6`（2026 年 6 月），散見於各章 README 與工作坊文件
- **🤖 第 2 章擴充套件註記** 從 `azure.ai.agents` `0.1.18-preview` 更新為 `0.1.40-preview`
- **🧪 工作坊驗證範例**（`azd version` 輸出）更新為 `1.25.6`
- **🧭 README「azd 今日新功能」** 已刷新，以突顯端到端的代理生命週期、新的 AI 擴充套件，以及近期的品質改進（`azd init` 的冪等性、`azd auth login` 的過期 token 清理、`azd tool` 首次執行提示）
- **📖 第 2 章 agents.md（選項 4）** 現在會引導學習者至部署後的生命週期指令，而非在 `azd up` 停止

#### 已修正
- **🏷️ 產品命名** — 新增 Aspire 品牌重塑說明（".NET Aspire" 現為簡稱 "Aspire"）；azd 對 Aspire 的支援不變
- **🔎 針對即時發布進行驗證**，確認穩定 CLI `1.25.6`（2026-06-12）與 `azure.ai.agents` `0.1.40-preview`（2026-06-15）

#### 已更新檔案
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
#### 初學者入門說明、設定驗證與最終 AZD 指令清理
**此版本接續對 AZD 1.23 的驗證檢查，並進行以初學者為重點的文件修訂：釐清以 AZD 為首的驗證指引、新增本機設定驗證腳本、針對實際 AZD CLI 驗證重要指令，並移除變更日誌以外仍存在的最後幾處過時英文原始指令參考。**

#### 新增
- **🧪 初學者設定驗證腳本**：包含 `validate-setup.ps1` 與 `validate-setup.sh`，讓學習者在開始第 1 章前能確認所需工具
- **✅ 提前的設定驗證步驟**：在根目錄 README 與第 1 章 README 中加入，讓缺少的先決條件在執行 `azd up` 前就能被發現

#### 更改
- **🔐 初學者驗證指引**：現在一致將 `azd auth login` 視為 AZD 工作流程的主要路徑，並將 `az login` 視為可選，除非直接使用 Azure CLI 指令
- **📚 第 1 章入門流程**：現在指示學習者在安裝、驗證與首次部署步驟前先驗證本機設定
- **🛠️ 驗證器訊息**：現在清楚區分阻斷性需求與針對僅使用 AZD 的初學者路徑中可選的 Azure CLI 警告
- **📖 設定、故障排除與示例文件**：現在區分必須的 AZD 驗證與在同時提供但屬於可選的 Azure CLI 登入情境

#### 修正
- **📋 剩餘的英文原始指令參考**：已更新為目前的 AZD 形式，包括備忘單中的 `azd config show`，以及在預期指示 Azure 入口網站總覽時使用的 `azd monitor --overview`
- **🧭 第 1 章的初學者說法**：調整語氣以避免過度承諾保證零錯誤或在所有範本與 Azure 資源上都能回滾的行為
- **🔎 即時 CLI 驗證**：確認目前支援 `azd env get-values`、`azd template list`、`azd extension list --installed`、`azd copilot consent list`、`azd mcp start`、`azd provision --preview`、`azd monitor --logs` 與 `azd down --force --purge`

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

#### AZD 1.23.12 驗證、工作坊環境擴充與 AI 模型更新
**此版本針對 `azd` `1.23.12` 進行文件驗證掃描，更新過時的 AZD 指令範例，將 AI 模型指引更新為當前預設，並把工作坊說明從僅支援 GitHub Codespaces 擴展到也支援 dev containers 與本地複製。**

#### 新增
- **✅ 在核心章節與工作坊文件中加入驗證註記**，以便使用新版或舊版 CLI 的學習者能明確了解所測試的 AZD 基準
- **⏱️ 部署逾時指引**：針對長時間執行的 AI 應用部署提供 `azd deploy --timeout 1800`
- **🔎 擴充功能檢視步驟**：在 AI 工作流程文件中加入 `azd extension show azure.ai.agents`
- **🌐 更廣的工作坊環境指引**：涵蓋 GitHub Codespaces、dev containers 與使用 MkDocs 的本地複製

#### 更改
- **📚 各章節介紹 README**：現在在 foundation、configuration、infrastructure、multi-agent、pre-deployment、troubleshooting 與 production 等章節一致標註已對 `azd 1.23.12` 進行驗證
- **🛠️ AZD 指令參考**：文件中的指令參考已更新為目前形式：
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` 或 `azd env get-value(s)`（視情境而定）
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview`（當需表示 Application Insights 總覽時）
- **🧪 Provision 預覽範例**：簡化為目前支援的用法，如 `azd provision --preview` 與 `azd provision --preview -e production`
- **🧭 工作坊流程**：更新為學習者可在 Codespaces、dev container 或本地複製完成實驗，而非假定僅能在 Codespaces 執行
- **🔐 驗證指引**：現在偏好使用 `azd auth login` 作為 AZD 工作流程的登入方式，`az login` 則作為在直接使用 Azure CLI 指令時的可選項

#### 修正
- **🪟 Windows 安裝指令**：在安裝指南中將 `winget` 套件大小寫標準化
- **🐧 Linux 安裝指引**：修正為避免引用不受支援的發行版特定 `azd` 套件管理指令，改為在適當情況下指向發行資產
- **📦 AI 模型範例**：從較舊的預設如 `gpt-35-turbo` 與 `text-embedding-ada-002` 更新為當前範例，例如 `gpt-4.1-mini`、`gpt-4.1` 與 `text-embedding-3-large`
- **📋 部署與診斷片段**：修正為在日誌、腳本與故障排除步驟中使用當前的環境與狀態指令
- **⚙️ GitHub Actions 指引**：從 `Azure/setup-azd@v1.0.0` 更新為 `Azure/setup-azd@v2`
- **🤖 MCP/Copilot 同意指引**：從 `azd mcp consent` 更新為 `azd copilot consent list`

#### 改進
- **🧠 AI 章節指引**：更好地說明預覽敏感的 `azd ai` 行為、租戶特定登入、目前的擴充功能使用方式，以及更新後的模型部署建議
- **🧪 工作坊說明**：使用較真實的版本範例與更清晰的環境設定語言，利於實作實驗
- **📈 生產與故障排除文件**：現在與當前的監控、備援模型和成本階層範例更一致

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
**此版本在所有 AI 相關章節中加入 `azd ai`、`azd extension` 與 `azd mcp` 指令覆蓋，修復 agents.md 中的斷鏈與已棄用程式碼，更新備忘單，並重整範例範本章節，加入已驗證描述與新的 Azure AI AZD 範本。**

#### 新增
- **🤖 AZD AI CLI 覆蓋**（涵蓋 7 個檔案，之前僅在第 8 章）：
  - `docs/chapter-01-foundation/azd-basics.md` — 新增「Extensions and AI Commands」章節，介紹 `azd extension`、`azd ai agent init` 與 `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — 選項 4：`azd ai agent init`，並有範本與清單(manifest)方法比較表
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — 「AZD Extensions for Foundry」與「Agent-First Deployment」小節
  - `docs/chapter-05-multi-agent/README.md` — 快速入門現在顯示範本與基於 manifest 的部署路徑
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — 部署章節現在包含 `azd ai agent init` 選項
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — 「AZD AI Extension Commands for Diagnostics」小節
  - `resources/cheat-sheet.md` — 新增「AI & Extensions Commands」章節，包含 `azd extension`、`azd ai agent init`、`azd mcp` 與 `azd infra generate`
- **📦 新的 AZD AI 範例範本**（在 `microsoft-foundry-integration.md`）：
  - **azure-search-openai-demo-csharp** — 使用 Blazor WebAssembly、Semantic Kernel 與語音聊天支援的 .NET RAG 聊天
  - **azure-search-openai-demo-java** — 使用 Langchain4J 的 Java RAG 聊天，支援 ACA/AKS 部署選項
  - **contoso-creative-writer** — 使用 Azure AI Agent Service、Bing Grounding 與 Prompty 的多代理創作寫作應用
  - **serverless-chat-langchainjs** — 使用 Azure Functions + LangChain.js + Cosmos DB 的 Serverless RAG，並支援 Ollama 本地開發
  - **chat-with-your-data-solution-accelerator** — 企業級 RAG 加速器，含管理後台、Teams 整合與 PostgreSQL/Cosmos DB 選項
  - **azure-ai-travel-agents** — 多代理 MCP 編排參考應用，後端有 .NET、Python、Java 與 TypeScript 的伺服器
  - **azd-ai-starter** — 精簡的 Azure AI 基礎設施 Bicep 入門範本
  - **🔗 Awesome AZD AI Gallery link** — 參考 [awesome-azd AI 資源庫](https://azure.github.io/awesome-azd/?tags=ai)（80+ 範本）

#### 修正
- **🔗 agents.md 導航**：上一頁/下一頁連結現在與第 2 章 README 的課程順序相符（Microsoft Foundry Integration → Agents → AI Model Deployment）
- **🔗 agents.md 斷裂鏈結**：`production-ai-practices.md` 已修正為 `../chapter-08-production/production-ai-practices.md`（3 處出現）
- **📦 agents.md 已棄用程式碼**：以 `azure-monitor-opentelemetry` 與 OpenTelemetry SDK 取代 `opencensus`
- **🐛 agents.md 無效 API**：將 `max_tokens` 從 `create_agent()` 移到 `create_run()`，作為 `max_completion_tokens`
- **🔢 agents.md 代幣計算**：以 `tiktoken.encoding_for_model()` 取代粗略的 `len//4` 估算
- **azure-search-openai-demo**：將服務描述從「Cognitive Search + App Service」更正為「Azure AI Search + Azure Container Apps」（預設主機於 2024 年 10 月變更）
- **contoso-chat**：更新描述以參照 Azure AI Foundry + Prompty，與該 repo 的實際標題與技術堆疊相符

#### 移除
- **ai-document-processing**：移除無法運作的範本參考（repo 並未公開作為 AZD 範本）

#### 改進
- **📝 agents.md 練習**：練習 1 現在顯示預期輸出與 `azd monitor` 步驟；練習 2 包含完整的 `FunctionTool` 註冊程式碼；練習 3 以具體的 `prepdocs.py` 指令取代模糊指引
- **📚 agents.md 資源**：將文件連結更新為目前的 Azure AI Agent Service 文件與快速入門
- **📋 agents.md 下一步表格**：新增 AI Workshop Lab 連結以涵蓋完整章節內容

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
**此版本以增強的表格格式改進了 README.md 章節導覽。**

#### 已變更
- <strong>課程地圖表格</strong>：增強為直接課程連結、時長估算與複雜度評分
- <strong>資料夾清理</strong>：移除多餘的舊資料夾 (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- <strong>連結驗證</strong>：課程地圖表格中的 21+ 個內部連結已驗證

### [v3.16.0] - 2026-02-05

#### 產品名稱更新
**此版本將產品參考更新為目前的 Microsoft 品牌命名。**

#### 已變更
- **Microsoft Foundry → Microsoft Foundry**：在非翻譯檔案中更新所有參考
- **Azure AI Agent Service → Foundry Agents**：服務名稱已更新以反映目前品牌

#### 已更新檔案
- `README.md` - 主要課程首頁
- `changelog.md` - 版本歷史
- `course-outline.md` - 課程結構
- `docs/chapter-02-ai-development/agents.md` - AI agents 指南
- `examples/README.md` - 範例文件
- `workshop/README.md` - 工作坊首頁
- `workshop/docs/index.md` - 工作坊索引
- `workshop/docs/instructions/*.md` - 所有工作坊教學檔案

---

### [v3.15.0] - 2026-02-05

#### 主要儲存庫重構：以章節命名的資料夾
**此版本將文件重構為專屬章節資料夾，以便更清晰的導覽。**

#### 資料夾重新命名
舊資料夾已取代為以章節編號命名的資料夾：
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- 新增：`docs/chapter-05-multi-agent/`

#### 檔案遷移
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

#### 已新增
- **📚 章節 README 檔案**：在每個章節資料夾中建立 README.md，內容包含：
  - 學習目標與時長
  - 含描述的課程表格
  - 快速啟動指令
  - 與其他章節的導覽連結

#### 已變更
- **🔗 已更新所有內部連結**：78+ 個路徑在整份文件中更新
- **🗺️ 主要 README.md**：用新章節結構更新課程地圖
- **📝 examples/README.md**：更新指向章節資料夾的交叉參考

#### 已移除
- 舊的資料夾結構 (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### 儲存庫重構：章節導覽
**此版本新增章節導覽 README 檔案（已被 v3.15.0 取代）。**

---

### [v3.13.0] - 2026-02-05

#### 新增 AI Agents 指南
**此版本新增一份完整指南，說明如何使用 Azure Developer CLI 部署 AI agents。**

#### 已新增
- **🤖 docs/microsoft-foundry/agents.md**：完整指南涵蓋：
  - 什麼是 AI agents 以及它們與聊天機器人的差異
  - 三個快速啟動 agent 範本（Foundry Agents、Prompty、RAG）
  - Agent 架構模式（單一 agent、RAG、多 agent）
  - 工具設定與客製化
  - 監控與指標追蹤
  - 成本考量與最佳化
  - 常見疑難排解情境
  - 三個實作練習與成功判準

#### 內容結構
- <strong>介紹</strong>：為初學者說明 agent 概念
- <strong>快速啟動</strong>：使用 `azd init --template get-started-with-ai-agents` 部署 agents
- <strong>架構模式</strong>：agent 模式的視覺圖示
- <strong>設定</strong>：工具設定與環境變數
- <strong>監控</strong>：整合 Application Insights
- <strong>練習</strong>：漸進式的實作學習（每個 20–45 分鐘）

---

### [v3.12.0] - 2026-02-05

#### DevContainer 環境更新
**此版本更新開發容器設定，採用現代化工具與更好的預設值，以提升 AZD 學習體驗。**

#### 已變更
- **🐳 基底映像**：由 `python:3.12-bullseye` 更新為 `python:3.12-bookworm`（最新的 Debian 穩定版）
- **📛 容器名稱**：由 "Python 3" 重新命名為 "AZD for Beginners" 以提升清晰度

#### 已新增
- **🔧 新的 Dev Container 功能**：
  - 已啟用 Bicep 支援的 `azure-cli`
  - `node:20`（AZD 範本之 LTS 版本）
  - 用於範本管理的 `github-cli`
  - 用於容器應用部署的 `docker-in-docker`

- **🔌 連接埠轉發**：預先設定常用開發連接埠：
  - 8000 (MkDocs 預覽)
  - 3000 (Web 應用)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 新增 VS Code 擴充套件**：
  - `ms-python.vscode-pylance` - 強化的 Python IntelliSense
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

- **⚙️ VS Code 設定**：新增 Python 直譯器、儲存時格式化與去除尾端空白的預設設定

- **📦 更新 requirements-dev.txt**：
  - 新增 MkDocs minify 外掛
  - 新增 pre-commit 以提升程式碼品質
  - 新增 Azure SDK 套件（azure-identity、azure-mgmt-resource）

#### 已修正
- <strong>建立後命令</strong>：現在在容器啟動時驗證 AZD 與 Azure CLI 的安裝

---

### [v3.11.0] - 2026-02-05

#### 為初學者友善的 README 大幅改寫
**此版本大幅改善 README.md 的可讀性，讓初學者更容易上手，並新增 AI 開發者所需的重要資源。**

#### 已新增
- **🆚 Azure CLI vs AZD 比較**：清楚說明何時使用每個工具並附實例
- **🌟 精選 AZD 連結**：直接連結到社群範本畫廊與貢獻資源：
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ 即可部署的範本
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - 社群貢獻
- **🎯 快速啟動指南**：簡化為三步驟入門（安裝 → 登入 → 部署）
- **📊 依經驗等級的導覽表**：根據開發者經驗提供清晰的起點建議

#### 已變更
- **README 結構**：重新組織以漸進揭露資訊 - 關鍵資訊優先
- <strong>介紹段落</strong>：重寫以說明對完全初學者的「azd up 的魔力」
- <strong>移除重複內容</strong>：刪除重複的疑難排解章節
- <strong>疑難排解指令</strong>：修正 `azd logs` 參考，改用有效的 `azd monitor --logs`

#### 已修正
- **🔐 身份驗證指令**：在 cheat-sheet.md 中新增 `azd auth login` 與 `azd auth logout`
- <strong>無效的指令參考</strong>：從 README 疑難排解章節移除剩餘的 `azd logs`

#### 備註
- <strong>範圍</strong>：變更適用於主要 README.md 與 resources/cheat-sheet.md
- <strong>目標族群</strong>：改進針對剛接觸 AZD 的開發者

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI 指令正確性更新
**此版本修正文件中不存在的 AZD 指令，確保所有程式範例使用有效的 Azure Developer CLI 語法。**

#### 已修正
- **🔧 移除不存在的 AZD 指令**：全面審核並修正無效指令：
  - `azd logs`（不存在）→ 改為 `azd monitor --logs` 或 Azure CLI 替代指令
  - `azd service` 子指令（不存在）→ 改為 `azd show` 與 Azure CLI
  - `azd infra import/export/validate`（不存在）→ 移除或替換為有效替代
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` 旗標（不存在）→ 移除
  - `azd provision --what-if/--rollback` 旗標（不存在）→ 更新為使用 `--preview`
  - `azd config validate`（不存在）→ 改為 `azd config list`
  - `azd info`, `azd history`, `azd metrics`（不存在）→ 移除

- **📚 已更新檔案以修正指令**：
  - `resources/cheat-sheet.md`：指令參考大幅改寫
  - `docs/deployment/deployment-guide.md`：修正回滾與部署策略
  - `docs/troubleshooting/debugging.md`：修正日誌分析章節
  - `docs/troubleshooting/common-issues.md`：更新疑難排解指令
  - `docs/troubleshooting/ai-troubleshooting.md`：修正 AZD 偵錯章節
  - `docs/getting-started/azd-basics.md`：修正監控指令
  - `docs/getting-started/first-project.md`：更新監控與偵錯範例
  - `docs/getting-started/installation.md`：修正 help 與版本範例
  - `docs/pre-deployment/application-insights.md`：修正檢視日誌指令
  - `docs/pre-deployment/coordination-patterns.md`：修正 agent 偵錯指令

- **📝 版本參考已更新**：
  - `docs/getting-started/installation.md`：將硬編碼的 `1.5.0` 版本改為通用的 `1.x.x` 並附上 releases 連結

#### 已變更
- <strong>回滾策略</strong>：文件更新為使用基於 Git 的回滾（AZD 本身沒有內建回滾）
- <strong>日誌檢視</strong>：將 `azd logs` 參考改為 `azd monitor --logs`、`azd monitor --live` 與 Azure CLI 指令
- <strong>效能章節</strong>：移除不存在的平行/增量部署旗標，提供有效替代方案

#### 技術細節
- **有效的 AZD 指令**：`init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **有效的 azd monitor 旗標**：`--live`, `--logs`, `--overview`
- <strong>已移除的功能</strong>：`azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### 備註
- <strong>驗證</strong>：指令已針對 Azure Developer CLI v1.23.x 驗證

---

### [v3.9.0] - 2026-02-05

#### 工作坊完成與文件品質更新
**此版本完成互動式工作坊模組、修復所有斷裂的文件連結，並提升給使用 Microsoft AZD 的 AI 開發者的整體內容品質。**

#### 已新增
- **📝 CONTRIBUTING.md**：新的貢獻指南文件，包含：
  - 報告問題與提出變更的清楚指示
  - 新內容的文件標準
  - 程式碼範例指南與提交訊息慣例
  - 社群參與資訊

#### Completed
- **🎯 Workshop Module 7 (Wrap-up)**: 已完整完成總結模組，包含：
  - 工作坊成果的全面摘要
  - 涵蓋 AZD、templates 和 Microsoft Foundry 的關鍵概念掌握區
  - 建議持續學習旅程
  - 附有難度分級的工作坊挑戰練習
  - 社群回饋與支援連結

- **📚 Workshop Module 3 (Deconstruct)**: 更新學習目標，包含：
  - GitHub Copilot 與 MCP 伺服器啟用指引
  - AZD template 資料夾結構理解
  - Infrastructure-as-code (Bicep) 組織模式
  - 實作實驗室指示

- **🔧 Workshop Module 6 (Teardown)**: 已完成，包含：
  - 資源清理與成本管理目標
  - 使用 `azd down` 安全移除基礎設施
  - 軟刪除的 cognitive services 復原指引
  - 針對 GitHub Copilot 與 Azure Portal 的額外探索提示

#### Fixed
- **🔗 Broken Link Fixes**: 已修復 15+ 個損壞的內部文件連結：
  - `docs/ai-foundry/ai-model-deployment.md`: 修正至 microsoft-foundry-integration.md 的路徑
  - `docs/troubleshooting/ai-troubleshooting.md`: 校正 ai-model-deployment.md 與 production-ai-practices.md 的路徑
  - `docs/getting-started/first-project.md`: 將不存在的 cicd-integration.md 換成 deployment-guide.md
  - `examples/retail-scenario.md`: 修正 FAQ 與故障排除指南的路徑
  - `examples/container-app/microservices/README.md`: 校正課程首頁與部署指南路徑
  - `resources/faq.md` 與 `resources/glossary.md`: 更新 AI 章節參考
  - `course-outline.md`: 修正講師指南與 AI 工作坊實驗室參考

- **📅 Workshop Status Banner**: 將狀態從 "Under Construction" 更新為活動工作坊狀態，日期為 2026 年 2 月

- **🔗 Workshop Navigation**: 修正 workshop README.md 中指向不存在 lab-1-azd-basics 資料夾的斷開連結

#### Changed
- **Workshop Presentation**: 移除 "under construction" 警告，工作坊現已完成並可使用
- **Navigation Consistency**: 確保所有工作坊模組具備正確的模組間導航
- **Learning Path References**: 更新章節交叉參考以使用正確的 microsoft-foundry 路徑

#### Validated
- ✅ 所有英文 Markdown 檔案具有有效的內部連結
- ✅ 工作坊模組 0-7 已完成，並包含學習目標
- ✅ 章節與模組之間的導航運作正常
- ✅ 內容適合使用 Microsoft AZD 的 AI 開發者
- ✅ 全文維持對初學者友善的語言與結構
- ✅ CONTRIBUTING.md 為社群貢獻者提供清楚的指引

#### Technical Implementation
- **Link Validation**: 使用自動化 PowerShell 腳本驗證所有 .md 的內部連結
- **Content Audit**: 對工作坊完整性與初學者適用性進行人工審查
- **Navigation System**: 套用一致的章節與模組導航模式

#### Notes
- **Scope**: 變更僅套用於英文文件
- **Translations**: 本版本未更新翻譯資料夾（稍後會由自動翻譯同步）
- **Workshop Duration**: 完整工作坊現提供 3-4 小時的實作學習

---

### [v3.8.0] - 2025-11-19

#### Advanced Documentation: Monitoring, Security, and Multi-Agent Patterns
**此版本新增針對 Application Insights 整合、認證模式與多代理協調之生產部署級別的完整 A 級課程。**

#### Added
- **📊 Application Insights Integration Lesson**: 位於 `docs/pre-deployment/application-insights.md`：
  - 以 AZD 為重點的部署與自動佈建
  - Application Insights + Log Analytics 的完整 Bicep 範本
  - 含自訂遙測的可運作 Python 應用程式（1,200+ 行）
  - AI/LLM 監控模式（Microsoft Foundry Models 之 token / 成本追蹤）
  - 6 張 Mermaid 圖表（架構、分散式追蹤、遙測流程）
  - 3 個實作練習（警示、儀表板、AI 監控）
  - Kusto 查詢範例與成本優化策略
  - 即時指標串流與實時除錯
  - 40-50 分鐘學習時長，含可投入生產的模式

- **🔐 Authentication & Security Patterns Lesson**: 位於 `docs/getting-started/authsecurity.md`：
  - 3 種認證模式（連線字串、Key Vault、Managed Identity）
  - 用於安全部署的完整 Bicep 基礎設施設定
  - 與 Azure SDK 整合的 Node.js 應用程式程式碼
  - 3 個完整練習（啟用 Managed Identity、使用者指派身份、Key Vault 旋轉）
  - 安全最佳實務與 RBAC 設定
  - 故障排除指引與成本分析
  - 可投入生產的無密碼認證模式

- **🤖 Multi-Agent Coordination Patterns Lesson**: 位於 `docs/pre-deployment/coordination-patterns.md`：
  - 5 種協調模式（依序、並行、分層、事件驅動、共識）
  - 完整的 orchestrator 服務實作（Python/Flask，1,500+ 行）
  - 3 種專用代理實作（Research、Writer、Editor）
  - Service Bus 整合以進行訊息佇列
  - Cosmos DB 用於分散式系統的狀態管理
  - 6 張顯示代理互動的 Mermaid 圖表
  - 3 個進階練習（逾時處理、重試邏輯、斷路器）
  - 成本拆解（$240-565/month）與優化策略
  - 與 Application Insights 整合以供監控

#### Enhanced
- **Pre-deployment Chapter**: 現包含完整的監控與協調模式
- **Getting Started Chapter**: 強化專業級認證模式
- **Production Readiness**: 從安全到可觀測性之完整覆蓋
- **Course Outline**: 更新以參照第 3 與第 6 章的新課程

#### Changed
- **Learning Progression**: 更佳地將安全與監控整合到整個課程中
- **Documentation Quality**: 新課程維持一致的 A 級標準（95-97%）
- **Production Patterns**: 為企業部署提供端到端的完整覆蓋

#### Improved
- **Developer Experience**: 清晰的路徑，從開發到生產監控
- **Security Standards**: 專業的認證與機密管理模式
- **Observability**: 與 AZD 完整整合的 Application Insights
- **AI Workloads**: 專門針對 Microsoft Foundry Models 與多代理系統的監控

#### Validated
- ✅ 所有課程包含可執行的完整程式碼（非片段）
- ✅ 供視覺學習的 Mermaid 圖表（3 課共 19 張）
- ✅ 含驗證步驟的實作練習（共 9 個）
- ✅ 可透過 `azd up` 部署的生產就緒 Bicep 範本
- ✅ 成本分析與優化策略
- ✅ 故障排除指南與最佳實務
- ✅ 帶驗證指令的知識檢查點

#### Documentation Grading Results
- **docs/pre-deployment/application-insights.md**: - 完整的監控指南
- **docs/getting-started/authsecurity.md**: - 專業的安全模式
- **docs/pre-deployment/coordination-patterns.md**: - 進階的多代理架構
- **Overall New Content**: - 一貫的高品質標準

#### Technical Implementation
- **Application Insights**: Log Analytics + 自訂遙測 + 分散式追蹤
- **Authentication**: Managed Identity + Key Vault + RBAC 模式
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + 協排
- **Monitoring**: 即時指標 + Kusto 查詢 + 警示 + 儀表板
- **Cost Management**: 取樣策略、保留政策、預算控制

### [v3.7.0] - 2025-11-19

#### Documentation Quality Improvements and New Microsoft Foundry Models Example
**此版本提升整個 repository 的文件品質，並新增完整的 Microsoft Foundry Models 部署範例，包含 gpt-4.1 聊天介面。**

#### Added
- **🤖 Microsoft Foundry Models Chat Example**: 在 `examples/azure-openai-chat/` 中完整的 gpt-4.1 部署與可運作實作：
  - 完整的 Microsoft Foundry Models 基礎設施設定（gpt-4.1 模型部署）
  - 帶有對話歷史的 Python 命令列聊天介面
  - Key Vault 整合以安全儲存 API 金鑰
  - 代幣用量追蹤與成本估算
  - 速率限制與錯誤處理
  - 詳盡 README，部署指南 35-45 分鐘
  - 11 個可投入生產的檔案（Bicep 範本、Python 應用、設定）
- **📚 Documentation Exercises**: 在設定指南中新增實作練習：
  - 練習 1：多環境設定（15 分鐘）
  - 練習 2：機密管理實作（10 分鐘）
  - 明確的成功準則與驗證步驟
- **✅ Deployment Verification**: 在部署指南中新增驗證章節：
  - 健康檢查程序
  - 成功準則清單
  - 所有部署指令的預期輸出
  - 故障排除快速參考

#### Enhanced
- **examples/README.md**: 更新為 A 級品質（93%）：
  - 在相關章節加入 azure-openai-chat
  - 將本地範例數量從 3 更新為 4
  - 新增至 AI 應用範例表
  - 整合到進階使用者快速上手
  - 新增於 Microsoft Foundry Templates 區段
  - 更新比較矩陣與技術尋找章節
- **Documentation Quality**: 對 docs 資料夾的品質從 B+ (87%) 改善到 A- (92%)：
  - 在重要指令範例中加入預期輸出
  - 對設定變更加入驗證步驟
  - 以實用練習強化實作學習

#### Changed
- **Learning Progression**: 更好地將 AI 範例整合給中階學習者
- **Documentation Structure**: 提供更具執行性的練習且具明確成果
- **Verification Process**: 在關鍵工作流程加入明確的成功準則

#### Improved
- **Developer Experience**: Microsoft Foundry Models 的部署時間現為 35-45 分鐘（相比複雜替代方案的 60-90 分鐘）
- **Cost Transparency**: 提供 Microsoft Foundry Models 範例的清晰成本估算（$50-200/month）
- **Learning Path**: AI 開發者有明確的入門範例 azure-openai-chat
- **Documentation Standards**: 一致的預期輸出與驗證步驟

#### Validated
- ✅ Microsoft Foundry Models 範例可透過 `azd up` 完整運作
- ✅ 所有 11 個實作檔案語法正確
- ✅ README 指示與實際部署經驗一致
- ✅ 文件連結已於 8+ 個位置更新
- ✅ 範例索引正確反映 4 個本地範例
- ✅ 表格中無重複的外部連結
- ✅ 所有導航參考正確

#### Technical Implementation
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps 模式
- **Security**: 已準備 Managed Identity，機密存放於 Key Vault
- **Monitoring**: Application Insights 整合
- **Cost Management**: 代幣追蹤與使用優化
- **Deployment**: 使用單一 `azd up` 指令完成整體設定

### [v3.6.0] - 2025-11-19

#### Major Update: Container App Deployment Examples
**此版本引入以 Azure Developer CLI (AZD) 為基礎的完整、可投入生產的容器應用部署範例，並將其完整文件納入學習路徑。**

#### Added
- **🚀 Container App Examples**: 在 `examples/container-app/` 中新增本地範例：
  - [Master Guide](examples/container-app/README.md): 關於容器化部署的完整概覽、快速上手、投入生產與進階模式
  - [Simple Flask API](../../examples/container-app/simple-flask-api): 對初學者友善的 REST API，具備 scale-to-zero、健康檢查、監控與故障排除
  - [Microservices Architecture](../../examples/container-app/microservices): 可投入生產的多服務部署（API Gateway、Product、Order、User、Notification）、非同步訊息、Service Bus、Cosmos DB、Azure SQL、分散式追蹤、藍綠/金絲雀部署
- **Best Practices**: 容器工作負載的安全性、監控、成本優化與 CI/CD 指南
- **Code Samples**: 完整的 `azure.yaml`、Bicep 範本與多語言服務實作（Python、Node.js、C#、Go）
- **Testing & Troubleshooting**: 端到端測試情境、監控指令、故障排除指引

#### Changed
- **README.md**: 更新以展示並連結新的 container app 範例，置於「Local Examples - Container Applications」
- **examples/README.md**: 更新以強調 container app 範例、新增比較矩陣條目並更新技術/架構參考
- **Course Outline & Study Guide**: 更新以在相關章節參照新的 container app 範例與部署模式

#### Validated
- ✅ 所有新範例可透過 `azd up` 部署並遵循最佳實務
- ✅ 文件交叉連結與導航已更新
- ✅ 範例涵蓋從初學者到進階情境，包括可投入生產的微服務

#### Notes
- **Scope**: 英文文件與範例
- **Next Steps**: 未來版本將加入更多進階容器模式與 CI/CD 自動化

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**此版本於所有英文文件中實作產品名稱變更，將 "Microsoft Foundry" 全面更新為 "Microsoft Foundry"。**

#### Changed
- **🔄 Product Name Update**: 完成從 "Microsoft Foundry" 到 "Microsoft Foundry" 的全面重新命名
  - 更新 `docs/` 資料夾中所有引用
  - 重新命名資料夾：`docs/ai-foundry/` → `docs/microsoft-foundry/`
  - 已重新命名檔案：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 總計：在 7 個文件中更新了 23 個內容參考

- **📁 資料夾結構變更**：
  - `docs/ai-foundry/` 已重新命名為 `docs/microsoft-foundry/`
  - 已更新所有交叉參考以反映新的資料夾結構
  - 已驗證所有文件中的導覽連結

- **📄 檔案重新命名**：
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 已更新所有內部連結以參照新檔名

#### 已更新檔案
- <strong>章節文件</strong> (7 個檔案)：
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 個導覽連結已更新
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 個產品名稱參考已更新
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - 已使用 Microsoft Foundry（來自先前更新）
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 個參考已更新（概覽、社群回饋、文件）
  - `docs/getting-started/azd-basics.md` - 4 個交叉參考連結已更新
  - `docs/getting-started/first-project.md` - 2 個章節導覽連結已更新
  - `docs/getting-started/installation.md` - 2 個下一章連結已更新
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 個參考已更新（導覽、Discord 社群）
  - `docs/troubleshooting/common-issues.md` - 1 個導覽連結已更新
  - `docs/troubleshooting/debugging.md` - 1 個導覽連結已更新

- <strong>課程結構檔案</strong> (2 個檔案)：
  - `README.md` - 17 個參考已更新（課程概覽、章節標題、範本區、社群見解）
  - `course-outline.md` - 14 個參考已更新（概覽、學習目標、章節資源）

#### 已驗證
- ✅ 零個剩餘的 "ai-foundry" 資料夾路徑參考於英文文件
- ✅ 零個剩餘的 "Microsoft Foundry" 產品名稱參考於英文文件
- ✅ 所有導覽連結在新資料夾結構下皆可運作
- ✅ 檔案與資料夾重新命名已成功完成
- ✅ 章節間的交叉參考已驗證

#### 備註
- <strong>範圍</strong>：變更僅套用於 `docs/` 資料夾中的英文文件
- <strong>翻譯</strong>：翻譯資料夾（`translations/`）未在此版本中更新
- <strong>工作坊</strong>：工作坊教材（`workshop/`）未在此版本中更新
- <strong>範例</strong>：範例檔案可能仍引用舊名稱（將在未來更新中處理）
- <strong>外部連結</strong>：外部 URL 與 GitHub 倉庫參考維持不變

#### 給貢獻者的遷移指南
如果您有本地分支或文件參考舊結構：
1. 更新資料夾參考：`docs/ai-foundry/` → `docs/microsoft-foundry/`
2. 更新檔案參考：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. 取代產品名稱： "Microsoft Foundry" → "Microsoft Foundry"
4. 驗證所有內部文件連結仍可運作

---

### [v3.4.0] - 2025-10-24

#### 基礎架構預覽與驗證強化
**此版本加入對新的 Azure Developer CLI preview 功能的全面支援，並提升工作坊使用者體驗。**

#### 新增
- **🧪 azd provision --preview 功能文件**：全面涵蓋新的基礎架構預覽能力
  - 指令參考與使用範例列於速查表
  - 在佈建指南中詳細整合使用案例與效益
  - 預檢查整合以提供更安全的部署驗證
  - 入門指南更新，強調以安全為先的部署實務
- **🚧 工作坊狀態橫幅**：專業的 HTML 橫幅，顯示工作坊開發狀態
  - 漸層設計與施工指示，清楚傳達給使用者
  - 顯示最後更新時間以增加透明度
  - 對所有裝置提供行動回應式設計

#### 強化
- <strong>基礎架構安全性</strong>：預覽功能已整合於整個部署文件中
- <strong>部署前驗證</strong>：自動化腳本現在包含基礎架構預覽測試
- <strong>開發者流程</strong>：更新的指令序列將預覽列為最佳實務
- <strong>工作坊體驗</strong>：為使用者設定清楚的內容開發狀態預期

#### 變更
- <strong>部署最佳實務</strong>：建議以預覽優先的工作流程為採用方式
- <strong>文件流程</strong>：將基礎架構驗證提前到學習流程中
- <strong>工作坊呈現</strong>：以專業狀態溝通顯示明確的開發時程

#### 改進
- <strong>以安全為先的方法</strong>：現在可在部署前驗證基礎架構變更
- <strong>團隊協作</strong>：可分享預覽結果以供審查與核准
- <strong>成本意識</strong>：在佈建前更清楚了解資源成本
- <strong>風險緩解</strong>：透過事先驗證減少部署失敗

#### 技術實作
- <strong>多文件整合</strong>：預覽功能已在 4 個關鍵檔案中說明
- <strong>指令範式</strong>：文件中使用一致的語法與範例
- <strong>最佳實務整合</strong>：在驗證工作流程與腳本中納入預覽
- <strong>視覺指示</strong>：新增功能以醒目標記便於發現

#### 工作坊基礎架構
- <strong>狀態溝通</strong>：專業 HTML 橫幅搭配漸層樣式
- <strong>使用者體驗</strong>：清楚的開發狀態可避免混淆
- <strong>專業呈現</strong>：在設定預期時維持存放庫的可信度
- <strong>時程透明</strong>：最後更新為 2025 年 10 月以示負責

### [v3.3.0] - 2025-09-24

#### 強化的工作坊教材與互動學習體驗
**此版本引入完整的工作坊教材，具備瀏覽器內互動指南與結構化的學習路徑。**

#### 新增
- **🎥 互動式工作坊指南**：具備 MkDocs 預覽功能的瀏覽器式工作坊體驗
- **📝 結構化的工作坊教學指引**：7 步驟引導式學習路徑，從探索到自訂
  - 0-Introduction: 工作坊概覽與設定
  - 1-Select-AI-Template: 範本探索與選擇流程
  - 2-Validate-AI-Template: 部署與驗證程序
  - 3-Deconstruct-AI-Template: 了解範本架構
  - 4-Configure-AI-Template: 組態與自訂
  - 5-Customize-AI-Template: 進階修改與迭代
  - 6-Teardown-Infrastructure: 清理與資源管理
  - 7-Wrap-up: 小結與後續步驟
- **🛠️ 工作坊工具鏈**：使用 Material 主題的 MkDocs 設定以提升學習體驗
- **🎯 實作學習路徑**：3 步驟方法論（發現 → 部署 → 自訂）
- **📱 GitHub Codespaces 整合**：無縫的開發環境設定

#### 強化
- **AI 工作坊實驗室**：擴展為完整的 2-3 小時結構化學習體驗
- <strong>工作坊文件</strong>：專業呈現並具備導覽與視覺輔助
- <strong>學習進程</strong>：從範本選擇到生產部署提供清楚的逐步指導
- <strong>開發者體驗</strong>：整合工具以簡化開發工作流程

#### 改進
- <strong>無障礙性</strong>：瀏覽器介面具搜尋、複製功能與主題切換
- <strong>自行安排學習</strong>：彈性工作坊架構適應不同學習速度
- <strong>實務應用</strong>：真實世界的 AI 範本部署情境
- <strong>社群整合</strong>：整合 Discord 作為工作坊支援與協作平台

#### 工作坊功能
- <strong>內建搜尋</strong>：快速的關鍵字與課程搜尋
- <strong>複製程式區塊</strong>：滑鼠懸停即可複製所有程式範例
- <strong>主題切換</strong>：支援深色/淺色模式切換
- <strong>視覺資產</strong>：截圖與示意圖以加深理解
- <strong>協助整合</strong>：直接接入 Discord 的社群支援

### [v3.2.0] - 2025-09-17

#### 大幅的導覽重構與章節式學習系統
**此版本導入完整的章節式學習結構，並在整個倉庫中強化導覽。**

#### 新增
- **📚 章節式學習系統**：將整個課程重組為 8 個漸進式學習章節
  - Chapter 1: 基礎與快速入門 (⭐ - 30-45 分鐘)
  - Chapter 2: AI 優先開發 (⭐⭐ - 1-2 小時)
  - Chapter 3: 組態與驗證 (⭐⭐ - 45-60 分鐘)
  - Chapter 4: 基礎架構即程式碼與部署 (⭐⭐⭐ - 1-1.5 小時)
  - Chapter 5: 多代理 AI 解決方案 (⭐⭐⭐⭐ - 2-3 小時)
  - Chapter 6: 部署前驗證與規劃 (⭐⭐ - 1 小時)
  - Chapter 7: 疑難排解與除錯 (⭐⭐ - 1-1.5 小時)
  - Chapter 8: 生產與企業模式 (⭐⭐⭐⭐ - 2-3 小時)
- **📚 全面性的導覽系統**：在所有文件中統一的導覽標頭與頁尾
- **🎯 進度追蹤**：課程完成檢查表與學習驗證系統
- **🗺️ 學習路徑指引**：為不同經驗層級與目標提供清楚的切入點
- **🔗 交叉參考導覽**：明確連結相關章節與先決條件

#### 強化
- **README 結構**：轉為具章節式組織的結構化學習平台
- <strong>文件導覽</strong>：每一頁現在都包含章節上下文與進程指引
- <strong>範本組織</strong>：範例與範本已對應到適合的學習章節
- <strong>資源整合</strong>：速查表、常見問答與學習指南已連結到相關章節
- <strong>工作坊整合</strong>：實作實驗室已對應多章節的學習目標

#### 變更
- <strong>學習進程</strong>：由線性文件移轉為彈性的章節式學習
- <strong>組態放置</strong>：重新將組態指南定位為第 3 章以優化學習流程
- **AI 內容整合**：在整個學習旅程中更好地整合 AI 專屬內容
- <strong>生產內容</strong>：進階模式集中於第 8 章以服務企業學習者

#### 改進
- <strong>使用者體驗</strong>：清楚的導覽麵包屑與章節進度指示
- <strong>無障礙性</strong>：一致的導覽模式方便課程瀏覽
- <strong>專業呈現</strong>：類大學的課程結構適合學術與企業訓練
- <strong>學習效率</strong>：透過改良組織減少尋找相關內容的時間

#### 技術實作
- <strong>導覽標頭</strong>：在 40+ 文件中標準化章節導覽
- <strong>頁尾導覽</strong>：一致的進程指引與章節完成指示
- <strong>交叉連結</strong>：建立連結相關概念的完整內部連結系統
- <strong>章節對應</strong>：範本與範例明確對應到學習目標

#### 學習指南強化
- **📚 全面性的學習目標**：將學習指南重構為與 8 章系統對齊
- **🎯 章節式評量**：每章包含特定學習目標與實作練習
- **📋 進度追蹤**：每週學習計劃附可衡量的結果與完成清單
- **❓ 評量問題**：每章的知識驗證問題以專業成果為導向
- **🛠️ 實作練習**：包含真實部署情境與故障排除的動手練習
- **📊 技能進展**：從基礎概念到企業模式的清楚進階路徑，並著重職涯發展
- **🎓 認證框架**：專業發展成果與社群認可系統
- **⏱️ 時間管理**：結構化的 10 週學習計劃與里程碑驗證

### [v3.1.0] - 2025-09-17

#### 強化的多代理 AI 解決方案
**此版本改進零售多代理解決方案，提供更好的代理命名與更完善的文件。**

#### 變更
- <strong>多代理術語</strong>：在整個零售多代理解決方案中，將 "Cora agent" 替換為 "Customer agent" 以提高清晰度
- <strong>代理架構</strong>：更新所有文件、ARM 範本與程式範例，使用一致的 "Customer agent" 命名
- <strong>組態範例</strong>：使用更新的命名慣例現代化代理組態模式
- <strong>文件一致性</strong>：確保所有參考使用專業且具描述性的代理名稱

#### 強化
- **ARM 範本套件**：更新 retail-multiagent-arm-template，改用 Customer agent 參考
- <strong>架構圖</strong>：以更新後的代理命名刷新 Mermaid 圖表
- <strong>程式範例</strong>：Python 類別與實作範例現在使用 CustomerAgent 命名
- <strong>環境變數</strong>：更新所有部署腳本以使用 CUSTOMER_AGENT_NAME 慣例

#### 改進
- <strong>開發者體驗</strong>：文件中代理角色與責任更為清晰
- <strong>生產就緒度</strong>：與企業命名慣例更好對齊
- <strong>學習材料</strong>：為教學目的提供更直觀的代理命名
- <strong>範本可用性</strong>：簡化對代理功能與部署模式的理解

#### 技術細節
- 在 Mermaid 架構圖中更新為 CustomerAgent 參考
- 在 Python 範例中將 CoraAgent 類別名稱替換為 CustomerAgent
- 修改 ARM 範本 JSON 配置以使用 "customer" 代理類型
- 將環境變數從 CORA_AGENT_* 更新為 CUSTOMER_AGENT_* 慣例
- 更新所有部署指令與容器設定

### [v3.0.0] - 2025-09-12

#### 重大變更 - 以 AI 開發者為中心與 Microsoft Foundry 整合
**此版本將倉庫轉型為以 AI 為重點的完整學習資源，並整合 Microsoft Foundry。**

#### 新增
- **🤖 以 AI 為先的學習路徑**：完整重構，優先服務 AI 開發者與工程師
- **Microsoft Foundry 整合指南**：完整文件說明如何將 AZD 與 Microsoft Foundry 服務連接
- **AI 模型部署模式**：詳細指南涵蓋模型選擇、組態與生產部署策略
- **AI 工作坊實驗室**: 2-3 小時實作工作坊，將 AI 應用轉換為可由 AZD 部署的解決方案
- **生產環境 AI 最佳實踐**: 適用企業的模式，用於擴展、監控與保護 AI 工作負載
- **AI 專用疑難排解指南**: 涵蓋 Microsoft Foundry Models、Cognitive Services 與 AI 部署問題的完整排解資源
- **AI 範本庫**: 精選 Microsoft Foundry 範本集合，並附難度評分
- <strong>工作坊教材</strong>: 完整工作坊結構，含實作實驗與參考資料

#### 增強
- **README 結構**: 以 AI 開發者為重點，並包含來自 Microsoft Foundry Discord 45% 社群興趣資料
- <strong>學習路徑</strong>: 專屬 AI 開發者旅程，並與傳統學生與 DevOps 工程師路徑並行
- <strong>範本推薦</strong>: 精選 AI 範本，包括 azure-search-openai-demo、contoso-chat 與 openai-chat-app-quickstart
- <strong>社群整合</strong>: 強化 Discord 社群支援，新增 AI 專屬頻道與討論

#### 安全與生產重點
- <strong>託管身分模式</strong>: AI 專用的認證與安全設定
- <strong>成本優化</strong>: Token 使用追蹤與 AI 工作負載的預算控制
- <strong>多區域部署</strong>: 全球 AI 應用部署策略
- <strong>效能監控</strong>: AI 專用指標與 Application Insights 整合

#### 文件品質
- <strong>線性課程結構</strong>: 從初學者到進階 AI 部署模式的邏輯進展
- <strong>已驗證的連結</strong>: 所有外部儲存庫連結皆已驗證並可存取
- <strong>完整參考</strong>: 所有內部文件連結皆已驗證並能正常運作
- <strong>可投入生產</strong>: 含實務範例的企業級部署模式

### [v2.0.0] - 2025-09-09

#### 主要變更 - 儲存庫重構與專業化增強
**此版本代表對儲存庫結構與內容呈現的大幅改造。**

#### 新增
- <strong>結構化學習框架</strong>: 所有文件頁面現在都包含簡介、學習目標與學習成果章節
- <strong>導航系統</strong>: 在所有文件中新增上一課/下一課連結，以引導學習進程
- <strong>學習指南</strong>: 完整的 study-guide.md，含學習目標、練習題與評量材料
- <strong>專業化呈現</strong>: 移除所有 emoji 圖示以改善無障礙性與專業外觀
- <strong>增強內容結構</strong>: 改善學習材料的組織與流程

#### 變更
- <strong>文件格式</strong>: 將所有文件標準化為一致的學習導向結構
- <strong>導航流程</strong>: 實作貫穿所有學習材料的邏輯進展
- <strong>內容呈現</strong>: 移除裝飾性元素，改以清晰、專業的格式呈現
- <strong>連結結構</strong>: 更新所有內部連結以支援新的導航系統

#### 改善
- <strong>無障礙性</strong>: 移除對 emoji 的依賴以改善螢幕閱讀器相容性
- <strong>專業外觀</strong>: 乾淨、學術風格的呈現，適合企業學習
- <strong>學習體驗</strong>: 以清楚的目標與成果為每節課設計的結構化方法
- <strong>內容組織</strong>: 改善相關主題之間的邏輯流程與連結

### [v1.0.0] - 2025-09-09

#### 初始釋出 - 全面性的 AZD 學習儲存庫

#### 新增
- <strong>核心文件結構</strong>
  - 完整的入門指南系列
  - 完整的部署與佈建文件
  - 詳盡的疑難排解資源與除錯指南
  - 預部署驗證工具與程序

- <strong>入門模組</strong>
  - AZD 基礎：核心概念與術語
  - 安裝指南：針對各平台的設定說明
  - 設定指南：環境設定與驗證
  - 第一個專案教學：逐步實作學習

- <strong>部署與佈建模組</strong>
  - 部署指南：完整工作流程文件
  - 佈建指南：以 Bicep 為基礎的基礎設施即程式碼
  - 生產部署最佳實務
  - 多服務架構範式

- <strong>預部署驗證模組</strong>
  - 容量規劃：Azure 資源可用性驗證
  - SKU 選擇：完整的服務級別指引
  - 起飛前檢查：自動化驗證腳本（PowerShell 與 Bash）
  - 成本估算與預算規劃工具

- <strong>疑難排解模組</strong>
  - 常見問題：常見問題與解決方案
  - 除錯指南：系統化的疑難排解方法
  - 進階診斷技術與工具
  - 效能監控與優化

- <strong>資源與參考</strong>
  - 指令速查表：常用指令快速參考
  - 術語表：完整術語與縮寫定義
  - 常見問題（FAQ）：對常見問答的詳細回覆
  - 外部資源連結與社群連結

- <strong>範例與範本</strong>
  - 簡單網頁應用範例
  - 靜態網站部署範本
  - 容器應用設定
  - 資料庫整合範式
  - 微服務架構範例
  - 無伺服器函式實作

#### 功能
- <strong>多平台支援</strong>: 提供 Windows、macOS 與 Linux 的安裝與設定指南
- <strong>多種技能層級</strong>: 內容設計適用於學生到專業開發人員
- <strong>實務導向</strong>: 實作範例與真實世界情境
- <strong>完整涵蓋</strong>: 從基礎概念到進階企業模式
- <strong>以安全為先</strong>: 在各處融入安全最佳實務
- <strong>成本優化</strong>: 提供節省成本之部署與資源管理建議

#### 文件品質
- <strong>詳細程式範例</strong>: 實務且經測試的程式碼範例
- <strong>逐步說明</strong>: 清楚且可執行的指引
- <strong>完整錯誤處理</strong>: 常見問題的排解方法
- <strong>最佳實務整合</strong>: 採用業界標準與建議
- <strong>版本相容性</strong>: 與最新 Azure 服務與 azd 功能保持一致

## 計畫中的未來增強

### Version 3.1.0 (Planned)
#### AI 平台擴展
- <strong>多模型支援</strong>: 對 Hugging Face、Azure Machine Learning 與自訂模型的整合模式
- **AI 代理框架**: LangChain、Semantic Kernel 與 AutoGen 部署範本
- **進階 RAG 模式**: 除了 Azure AI Search 外的向量資料庫選項（Pinecone、Weaviate 等）
- **AI 可觀察性**: 增強對模型效能、token 使用與回應品質的監控

#### 開發者體驗
- **VS Code 擴充套件**: 整合 AZD + Microsoft Foundry 的開發體驗
- **GitHub Copilot 整合**: AI 輔助的 AZD 範本產生
- <strong>互動式教學</strong>: 含自動驗證的實作練習，針對 AI 情境
- <strong>影音內容</strong>: 補充的教學影片，針對視覺學習者與 AI 部署主題

### Version 4.0.0 (Planned)
#### 企業級 AI 模式
- <strong>治理框架</strong>: AI 模型治理、合規與稽核追蹤
- **多租戶 AI**: 為多個客戶提供孤立 AI 服務的模式
- **Edge AI 部署**: 與 Azure IoT Edge 與容器實例的整合
- **混合雲 AI**: AI 工作負載的多雲與混合部署模式

#### 進階功能
- **AI 管線自動化**: 與 Azure Machine Learning 管線的 MLOps 整合
- <strong>進階安全</strong>: 零信任模式、私有端點與進階威脅防護
- <strong>效能優化</strong>: 高吞吐量 AI 應用的進階調校與擴展策略
- <strong>全球分佈</strong>: AI 應用的內容傳遞與邊緣快取模式

### Version 3.0.0 (Planned) - Superseded by Current Release
#### 擬議新增項目 - 現已於 v3.0.0 實作
- ✅ **聚焦 AI 的內容**: 完整的 Microsoft Foundry 整合（已完成）
- ✅ <strong>互動式教學</strong>: 實作 AI 工作坊實驗室（已完成）
- ✅ <strong>進階安全模組</strong>: AI 專用安全模式（已完成）
- ✅ <strong>效能優化</strong>: AI 工作負載調校策略（已完成）

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### 小幅增強 - 目前版本部分完成
- ✅ <strong>額外範例</strong>: 聚焦 AI 的部署情境（已完成）
- ✅ <strong>擴充常見問題</strong>: AI 專用問答與疑難排解（已完成）
- <strong>工具整合</strong>: 增強的 IDE 與編輯器整合指南
- ✅ <strong>監控擴展</strong>: AI 專用的監控與警示模式（已完成）

#### 仍計畫於未來版本實作
- <strong>行動友善文件</strong>: 適用於行動學習的響應式設計
- <strong>離線存取</strong>: 可下載的文件套件
- **增強的 IDE 整合**: 適用於 AZD + AI 工作流程的 VS Code 擴充
- <strong>社群儀表板</strong>: 實時社群指標與貢獻追蹤

## 對變更日誌的貢獻

### 回報變更
當向此儲存庫貢獻時，請確保變更日誌條目包含：

1. <strong>版本號</strong>: 遵循語義化版本（major.minor.patch）
2. <strong>日期</strong>: 釋出或更新日期，格式為 YYYY-MM-DD
3. <strong>分類</strong>: Added、Changed、Deprecated、Removed、Fixed、Security
4. <strong>清楚描述</strong>: 簡潔描述變更內容
5. <strong>影響評估</strong>: 變更對現有使用者的影響

### 變更類別

#### 新增
- 新功能、文件章節或能力
- 新範例、範本或學習資源
- 額外工具、腳本或實用工具

#### 變更
- 對現有功能或文件的修改
- 提升清晰度或準確性的更新
- 內容或組織的重構

#### 逐步淘汰
- 正在退場的功能或方法
- 計畫移除的文件章節
- 有更好替代方案的方法

#### 移除
- 不再相關的功能、文件或範例
- 過時資訊或已淘汰的方法
- 冗餘或整併的內容

#### 修正
- 文件或程式碼中的錯誤修正
- 回報問題或故障的解決
- 提升準確性或功能性的改進

#### 安全
- 與安全相關的改進或修補
- 安全最佳實務的更新
- 安全性弱點的修復

### 語義化版本控制指南

#### 主版本 (X.0.0)
- 需要使用者採取動作的重大變更
- 重大內容或組織重構
- 改變基本方法或方法論的變更

#### 次版本 (X.Y.0)
- 新功能或內容新增
- 維持相容性的增強
- 額外範例、工具或資源

#### 修補版本 (X.Y.Z)
- 錯誤修正與修補
- 對現有內容的小幅改進
- 說明與小幅增強

## 社區回饋與建議

我們積極鼓勵社群回饋以改善此學習資源：

### 如何提供回饋
- **GitHub Issues**: 回報問題或建議改善（歡迎 AI 專屬議題）
- **Discord 討論**: 分享想法並與 Microsoft Foundry 社群互動
- **Pull Requests**: 直接為內容做出改進，特別是 AI 範本與指南
- **Microsoft Foundry Discord**: 參與 #Azure 頻道的 AZD + AI 討論
- <strong>社群論壇</strong>: 參與更廣泛的 Azure 開發者討論

### 回饋分類
- **AI 內容準確性**: 對 AI 服務整合與部署資訊的修正
- <strong>學習體驗</strong>: 提升 AI 開發者學習流程的建議
- **缺少的 AI 內容**: 需求新增 AI 範本、模式或範例
- <strong>無障礙性</strong>: 提供多元學習需求的改進建議
- **AI 工具整合**: 改善 AI 開發工作流程整合的建議
- **生產環境 AI 模式**: 企業級 AI 部署模式的需求

### 回應承諾
- <strong>議題回應</strong>: 對報告的問題在 48 小時內回應
- <strong>功能請求</strong>: 一週內評估
- <strong>社群貢獻</strong>: 一週內審查
- <strong>安全議題</strong>: 優先處理並加速回應

## 維護排程

### 定期更新
- <strong>每月審查</strong>: 內容準確性與連結驗證
- <strong>每季更新</strong>: 重大內容新增與改進
- <strong>每半年審查</strong>: 全面性的重構與增強
- <strong>年度釋出</strong>: 含重大改進的主要版本更新

### 監控與品質保證
- <strong>自動化測試</strong>: 定期驗證程式範例與連結
- <strong>社群回饋整合</strong>: 定期採納使用者建議
- <strong>技術更新</strong>: 與最新 Azure 服務與 azd 發佈保持一致
- <strong>無障礙稽核</strong>: 定期檢視包容性設計原則

## 版本支援政策

### 目前版本支援
- <strong>最新主版本</strong>: 提供完整支援並定期更新
- <strong>前一主版本</strong>: 提供 12 個月的安全更新與重大修補
- <strong>舊版</strong>: 僅由社群支援，無官方更新

### 遷移指引
當釋出主要版本時，我們提供：
- <strong>遷移指南</strong>: 逐步轉換的操作說明
- <strong>相容性說明</strong>: 關於破壞性變更的細節
- <strong>工具支援</strong>: 協助遷移的腳本或實用工具
- <strong>社群支援</strong>: 專門的論壇處理遷移問題

---

<strong>導航</strong>
- <strong>上一課程</strong>: [學習指南](resources/study-guide.md)
- <strong>下一課程</strong>: 返回至 [主 README](README.md)

<strong>保持更新</strong>: Watch this repository 以接收關於新釋出與學習材料重要更新的通知。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->