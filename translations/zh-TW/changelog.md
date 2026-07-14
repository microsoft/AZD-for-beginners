# 變更記錄 - AZD 初學者指南

## 介紹

本變更記錄記錄 AZD For Beginners 儲存庫的所有重大變更、更新和改進。我們遵循語義版本控制原則並維護此日誌，以幫助用戶了解版本間的變化。

## 學習目標

通過查看此變更記錄，您將能夠：
- 保持對新功能和內容新增的了解
- 理解現有文件的改進
- 跟踪 bug 修正和更正，確保準確性
- 隨著時間推移，追蹤學習材料的演變

## 學習成果

查看變更記錄條目後，您將能夠：
- 識別可用的新內容和學習資源
- 瞭解哪些章節已被更新或改進
- 根據最新材料規劃您的學習路徑
- 提出反饋和改進建議

## 版本歷史

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 更新：版本貨幣性更新
**本版本根據 `azd` `1.27.1`（2026 年 7 月，最新穩定版本）及目前的預覽版 AI 代理擴充套件 `azure.ai.agents` `1.0.0-beta.5` 重新驗證課程，將所有「驗證通過」標籤更新至 1.26.0、1.27.0 和 1.27.1 版本之後的最新狀態。**

#### 變更
- **✅ 驗證基準更新**，由 `azd 1.25.6`（2026 年 6 月）升級至 `azd 1.27.1`（2026 年 7 月），範圍涵蓋根目錄 README、所有章節 README、第 1 章開發容器課程（含固定版號範例）、第 4 章自訂範本課程、第 5 章多代理課程及工作坊文件
- **🤖 第 2 章基準更新**，由 `azd 1.23.12`（2026 年 3 月）升級至 `azd 1.27.1`，覆蓋 `agents.md`、`ai-model-deployment.md`、`ai-workshop-lab.md` 與 `microsoft-foundry-integration.md`，並將驗證注釋日期更新為 2026-07-13
- **🧩 AI 代理擴充套件升級**，由 `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` 更新為目前的 `1.0.0-beta.5` 版本，適用於第 2 章 README 和 `agents.md`
- **🧪 工作坊驗證範例**（`azd version` 輸出）更新至 `1.27.1`

#### 相關 azd 版本說明（1.26.0 → 1.27.1）
- **1.26.0（2026-06-24）：** 支援 Azure Functions Flex Consumption 的 Go 語言、每租戶訂閱篩選的 `azd config sub-filter`、自包含擴充套件包 (`azd x pack --bundle`) 以及 `azd tool install azure-skills`
- **1.27.0（2026-06-30）：** 可直接在 `azure.yaml` 中建模 Azure AI Foundry 專案/代理（無需 Bicep 或 Terraform 初始化）、App Service 容器部署支援（`host: appservice` + `language: docker`）、`azd extension` 命令支援直接 `-s/--source`參數，及 `azd tool uninstall`
- **1.27.1（2026-07-09）：** `azd extension install` 新增 `--no-dependencies` 標誌、預設排除已棄用的模型於目錄/配額提示中，以及多項錯誤修正

#### 更新檔案
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - 2026-06-16

#### 初學者填補空白＃2：範本撰寫、開發容器、Pulumi、Azure DevOps、服務主體等功能
**本版本填補了 azd 覆蓋分析顯示的剩餘中階知識空白：如何撰寫和發佈自己的範本、可重現的開發容器/Codespaces 環境、Pulumi 基礎設施提供者、Azure DevOps CI/CD 演練、服務主體驗證、主機選擇指引（AKS/Spring Apps）、`azd restore` / `azd package` 解釋、hook 錯誤處理，以及團隊/共享環境實踐。**

#### 新增
- **🧱 新增第 4 章課程** `docs/chapter-04-infrastructure/custom-templates.md` — 撰寫自有 azd 範本的必要結構 (`azure.yaml`、`infra/`、`src/`)、`metadata.template` 欄位、利用 `uniqueString()` 資源標記與 `azd-env-name` 標籤參數化基礎設施、本地使用 `azd init --template <local-path>` 測試、發佈至 GitHub 與提交至 Awesome AZD 畫廊
- **📦 新增第 1 章課程** `docs/chapter-01-foundation/dev-containers.md` — 利用 Dev Containers 和 GitHub Codespaces 重現 azd 環境：使用官方 `ghcr.io/azure/azure-dev/azd` 功能的最簡化 `.devcontainer/devcontainer.json`、語言專用功能、容器主機的 `docker-in-docker`，以及遠端登入的 `azd auth login --use-device-code`
- **🧩 Pulumi 與 azd** 小節加入 `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`、Pulumi 資料夾結構、堆疊映射至 azd 環境、必需的輸出/標籤，以及相同的 `azd up` / `azd down` 工作流程
- **🎯 主機選擇指引** 加入 `docs/chapter-04-infrastructure/provisioning.md` — 針對初學者友好的 `appservice`、`staticwebapp`、`function`、`containerapp`、`aks`、`springapp` 比較，以及何時選擇 AKS 或 Azure Spring Apps 的指導
- **🛠️ Azure DevOps CI/CD 演練** 加入 `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`、工作負載識別聯邦(OIDC)服務連線、產生的 `azure-dev.yml` 及變數組設定
- **🔑 服務主體（模式 4）** 新增至 `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`、使用客戶端密鑰與聯邦/OIDC 資格的非交互式 `azd auth login`、何時使用及安全存儲資格
- **🪝 Hook 錯誤處理** 新增於 `docs/chapter-04-infrastructure/deployment-guide.md` 子節 — 退出碼及 `set -e`、`continueOnError`、使用 `azd hooks run` 隔離測試 hook、作業系統專屬 shell 及 `--debug`
- **👥 團隊 / 共享環境** 新增於 `docs/chapter-03-configuration/configuration.md` — `.azure/` 目錄內容、gitignore 規則、每開發者環境管理、`azd env list` / `select`、在 CI/CD 中提供環境值
- **🧰 `azd restore` 與擴展 `azd package`** 於 `resources/cheat-sheet.md` 解釋 — 還原依賴、建置可部署工件而無需部署

#### 變更
- **🧭 第 4 章課程表更新**，加入新「撰寫自有範本」課程（課程 3）
- **🧭 第 1 章課程表更新**，加入新「開發容器與 Codespaces」課程（課程 5）；並在 `bring-your-own-app.md` 與 `dev-containers.md` 之間設定導航頁腳連結

### [v3.21.0] - 2026-06-16

#### 初學者填補空白：實作多代理課程、「加入現有應用程式」、Terraform 及 CI/CD 演練
**本版本透過新增兩個實作課程（可部署多代理演練及為現有應用加上 azd）、初學者友善的 hook 介紹、Terraform 與 azd 範例章節、逐步 GitHub Actions 流程演練、預覽擴充套件解說，以及明確的部署驗證檢查表，填補完整初學者指南的最大空白。**

#### 新增
- **🤝 新增第 5 章課程** `docs/chapter-05-multi-agent/multi-agent-basics.md` — 完全實作的兩代理演練（協調者 + 專家代理），使用真實範本 (`contoso-creative-writer`)，涵蓋何時使用多代理、`azd up` 流程、理解部署資源、跨代理追蹤、客製化及清理
- **📦 新增第 1 章課程** `docs/chapter-01-foundation/bring-your-own-app.md` — 如何使用 `azd init` 將 azd 新增至現有專案（「在目前目錄使用程式碼」）、理解 `azure.yaml` 及 `infra/`、`azd infra generate`、主機偵測及 `azd up` 部署
- **🌐 Terraform 與 azd** 小節新增於 `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` 配置、`.tf` 資料夾結構、必要的 `AZURE_*` 輸出及 `azd-env-name` 標籤，以及相同的 `azd up` / `azd down` 工作流程（填補只說支持 Terraform 卻只示範 Bicep 的空白）
- **⚙️ 逐步 GitHub Actions 流程演練** 加入 `docs/chapter-08-production/production-ai-practices.md` — 從 GitHub 儲存庫到自動部署：`azd pipeline config`、OIDC 聯邦憑證（無存儲密碼）、產生的 `azure-dev.yml` 以及密鑰與變數指南
- **🪝 初學者「初識 hooks？」介紹** 加入 `docs/chapter-04-infrastructure/deployment-guide.md` — hook 是什麼、hook 階段表、極簡第一個 hook 及使用 `azd hooks run` 手動執行 hook
- **✅ 新增「驗證您的部署」檢查表** 至 `docs/chapter-01-foundation/first-project.md` 第 5 步驟 — 冒煙測試、健康端點檢查及明確的成功標準
- **🧩 新預覽擴充套件說明** `azure.ai.skills` 與 `azure.ai.connections`（功能及何時使用）加入 `docs/chapter-08-production/production-ai-practices.md`

#### 變更
- **🧭 第 5 章課程表修正**：`multi-agent-basics.md` 現為課程 1（唯一全實作課程），誠實標示課程 2 位於第 6 章，零售場景為架構藍圖，而非一鍵範本
- **🧭 第 1 章課程表更新**，加入新「加入現有應用程式」課程（課程 4）
- **🔗 導航頁腳更新**：`first-project.md` 現向前連結至 `bring-your-own-app.md`

#### 修復
- **🧱 補齊「宣稱但缺失的」Terraform 空白** — 先前課程提及 Terraform 支援卻未展示
- **🔀 修正誤導性的第 5 章交叉連結**，消除暗示存在完整多代理實作的誤解，實際僅為架構藍圖

#### 更新檔案
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(新增)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(新增)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 更新，完整代理生命週期指令與 Aspire 品牌更新

**此版本針對 `azd` `1.25.6`（2026 年 6 月）和 `azure.ai.agents` `0.1.40-preview` 擴充套件重新驗證課程內容，將 AI 指引從「架構代理」擴展至完整代理生命週期（測試 → 評估 → 優化 → 檢查 → 刪除），呈現新的 `azure.ai.skills` 與 `azure.ai.connections` 預覽擴充套件，並註明「.NET Aspire」改名為「Aspire」的產品品牌更新。**

#### 新增
- **🔁 新手與 AI 工程師的完整代理生命週期涵蓋**，貫穿所有文件：
  - `docs/chapter-01-foundation/azd-basics.md` — 在擴充套件與 AI 命令部分新增生命週期表（架構 → 測試 → 測量 → 改善 → 檢查 → 清理）
  - `docs/chapter-08-production/production-ai-practices.md` — 新增「管理代理生命週期」章節，涵蓋 `azd ai agent invoke`、`endpoint show`、`eval generate`、`optimize`、`code download` 與 `delete --force`
  - `resources/cheat-sheet.md` — 擴充 AI 代理命令，涵蓋 `invoke`、`endpoint show`、`eval generate`、`optimize`、`code download` 與 `delete --force`
- **🧩 新增預覽擴充套件** 文件化：`azure.ai.skills`（可重用代理技能）與 `azure.ai.connections`（Foundry 連線）新增至擴充套件表及備忘單
- **⏱️ 回應時效指引** — `azd ai agent invoke` 範例現在會顯示總延遲與首字節時間
- **📌 版本橫幅** 出現在根目錄 README，提醒學習者使用 `azd version` 與 `azd upgrade`

#### 變更
- **✅ 驗證基準更新**，從所有章節 README 與工作坊文件中的 `azd 1.23.12`（2026 年 3 月）更新到 `azd 1.25.6`（2026 年 6 月）
- **🤖 第二章擴充說明** 從 `azure.ai.agents` `0.1.18-preview` 更新至 `0.1.40-preview`
- **🧪 工作坊驗證範例** （`azd version` 輸出）更新至 `1.25.6`
- **🧭 README「今日 azd 新功能」** 更新以彰顯端對端代理生命週期，新 AI 擴充套件與近期的生活便利性修正（`azd init` 可重入操作、`azd auth login` 清除過期令牌、`azd tool` 第一次執行提示）
- **📖 第二章 agents.md（方案 4）** 現在引導學習者使用部署後生命週期命令，取代僅止於 `azd up`

#### 修正
- **🏷️ 產品命名** — 新增 Aspire 品牌重塑說明（「.NET Aspire」現改為單純「Aspire」）；azd 對 Aspire 的支援不變
- **🔎 針對 Azure Developer CLI 發行管道的即時發行驗證**：穩定版 CLI `1.25.6`（2026-06-12）與 `azure.ai.agents` `0.1.40-preview`（2026-06-15）

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

#### 新手入門說明、環境驗證與最終 AZD 命令整理
**此版本延續 AZD 1.23 驗證檢查，進行針對新手的文件回顧：清楚說明 AZD 為首的驗證指引、加入本地設定驗證腳本、針對關鍵命令進行現行 AZD CLI 現場驗證，並移除變更紀錄外最後剩餘的過時英文命令引用。**

#### 新增
- **🧪 新手設定驗證腳本**：提供 `validate-setup.ps1` 與 `validate-setup.sh`，方便學習者在第一章開始前確認必要工具
- **✅ 設定驗證前置步驟**：於根目錄及第一章 README 中加入，使得缺少先決條件能在使用 `azd up` 之前被偵測出來

#### 變更
- **🔐 新手認證指引** 統一將 `azd auth login` 視為 AZD 工作流程的主要途徑，並將 `az login` 標示為選用，除非直接使用 Azure CLI 命令
- **📚 第一章入門流程** 現在引導學習者先驗證本地環境，再進行安裝、認證與首次部署步驟
- **🛠️ 驗證訊息** 清楚區分封鎖性需求與可選的 Azure CLI 警告，適用於僅 AZD 的新手路徑
- **📖 設定、故障排除與範例文件** 區分必須的 AZD 認證與可選的 Azure CLI 登入，過去兩者多無上下文區別

#### 修正
- **📋 剩餘英文命令引用** 全數更新至最新 AZD 形式，包括備忘單中的 `azd config show` 與面向 Azure 入口網站概覽指引的 `azd monitor --overview`
- **🧭 第一章的新手承諾** 弱化，以避免對所有範本與 Azure 資源保證零錯誤或回滾行為的過度承諾
- **🔎 現場 CLI 驗證**：確認目前支援指令包括 `azd env get-values`、`azd template list`、`azd extension list --installed`、`azd copilot consent list`、`azd mcp start`、`azd provision --preview`、`azd monitor --logs` 以及 `azd down --force --purge`

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
**本版本針對 `azd` `1.23.12` 進行文件驗證掃描，更新過時的 AZD 命令範例，刷新 AI 模型指引符合目前預設，並將工作坊指導擴展至除 GitHub Codespaces 外的 dev container 和本地克隆。**

#### 新增
- **✅ 驗證註記** 散佈於核心章節與工作坊文件，明確說明測試驗證的 AZD 基準，供使用更新或舊版 CLI 的學習者參考
- **⏱️ 部署逾時指引**：針對長時間執行的 AI 應用部署提供 `azd deploy --timeout 1800` 用法說明
- **🔎 擴充檢視步驟**：於 AI 工作流程文件中提供 `azd extension show azure.ai.agents` 示範
- **🌐 更廣泛的工作坊環境指引**：涵蓋 GitHub Codespaces、dev container 與使用 MkDocs 的本地克隆

#### 變更
- **📚 各章節介紹 README** 現統一標註針對 `azd 1.23.12` 的驗證，涵蓋基礎、設定、基礎設施、多代理、預部署、故障排除與生產各部分
- **🛠️ AZD 命令引用** 於所有文件更新至最新形式：
  - `azd config list` 改為 `azd config show`
  - `azd env show` 根據上下文改為 `azd env list` 或 `azd env get-value(s)`
  - `azd auth whoami` 改為 `azd auth status`
  - 指向 Application Insights 概覽時，`azd monitor` 改為 `azd monitor --overview`
- **🧪 預覽版 Provision 範例** 簡化為目前支援用法，例如 `azd provision --preview` 及 `azd provision --preview -e production`
- **🧭 工作坊流程** 更新，使學習者能在 Codespaces、dev container 或本地克隆中完成實驗，不再限定 Codespaces
- **🔐 認證指引** 現建議 AZD 工作流程優先使用 `azd auth login`，並將 `az login` 放為選用，除非直接使用 Azure CLI 命令

#### 修正
- **🪟 Windows 安裝命令** 依照安裝指南統一調整為目前 `winget` 套件大小寫格式
- **🐧 Linux 安裝指引** 修正避免不支援的發行版專有 `azd` 套件管理器指令，改以釋出資產指引為主
- **📦 AI 模型範例** 從舊的預設如 `gpt-35-turbo` 與 `text-embedding-ada-002` 更新為現行範例，如 `gpt-4.1-mini`、`gpt-4.1` 與 `text-embedding-3-large`
- **📋 部署與診斷程式碼片段** 修正為使用當前環境與狀態命令於記錄、腳本及故障排除步驟中
- **⚙️ GitHub Actions 指引** 從 `Azure/setup-azd@v1.0.0` 更新為 `Azure/setup-azd@v2`
- **🤖 MCP/Copilot 同意指引** 從 `azd mcp consent` 更新為 `azd copilot consent list`

#### 改善
- **🧠 AI 章指引** 更詳細說明預覽階段敏感的 `azd ai` 行為、租戶特定登入、現有擴充使用情況與更新的模型部署建議
- **🧪 工作坊說明** 使用更真實的版本範例與更清晰的環境設定語句促進實作體驗
- **📈 生產與故障排除文件** 更加符合目前監控、備援模型與成本層級範例

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
**本版本在所有 AI 相關章節新增 `azd ai`、`azd extension` 與 `azd mcp` 命令涵蓋範圍，修正 agents.md 中斷鏈接和過時程式碼，更新備忘單，並全面改造範本示例章節，提供驗證過的說明與新的 Azure AI AZD 範本。**

#### 新增
- **🤖 AZD AI CLI 涵蓋** 延伸至 7 個檔案（此前僅在第 8 章）：
  - `docs/chapter-01-foundation/azd-basics.md` — 新增「擴充套件與 AI 命令」章節，介紹 `azd extension`、`azd ai agent init` 與 `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — 方案 4：`azd ai agent init` 及範本與清單方式的比較表
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — 「Foundry 的 AZD 擴充套件」及「代理先行部署」子章節

  - `docs/chapter-05-multi-agent/README.md` — 快速入門現在顯示模板和清單兩種部署路徑
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — 部署部分現在包含 `azd ai agent init` 選項
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — 「診斷用 AZD AI 擴充指令」子段落
  - `resources/cheat-sheet.md` — 新增「AI 與擴充指令」部分，包含 `azd extension`、`azd ai agent init`、`azd mcp` 和 `azd infra generate`
- **📦 新增 AZD AI 範例模板** 在 `microsoft-foundry-integration.md`：
  - **azure-search-openai-demo-csharp** — 使用 Blazor WebAssembly、Semantic Kernel 與語音聊天支援的 .NET RAG 聊天
  - **azure-search-openai-demo-java** — Java RAG 聊天，採用 Langchain4J，提供 ACA/AKS 部署選項
  - **contoso-creative-writer** — 多代理創意寫作應用，使用 Azure AI Agent 服務、Bing Grounding 與 Prompty
  - **serverless-chat-langchainjs** — 無伺服器 RAG，結合 Azure Functions + LangChain.js + Cosmos DB，支援 Ollama 本地開發
  - **chat-with-your-data-solution-accelerator** — 企業級 RAG 加速器，含管理門戶、Teams 整合及 PostgreSQL/Cosmos DB 選項
  - **azure-ai-travel-agents** — 多代理 MCP 編排參考應用，服務端涵蓋 .NET、Python、Java 與 TypeScript
  - **azd-ai-starter** — 極簡 Azure AI 基礎設施 Bicep 啟動模板
  - **🔗 精彩 AZD AI 展示館連結** — 參考 [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai)（超過 80 個模板）

#### 修正
- **🔗 agents.md 導覽**：上一頁/下一頁連結現在與第 2 章 README 課程順序相符（Microsoft Foundry Integration → Agents → AI Model Deployment）
- **🔗 agents.md 壞掉連結**：將 `production-ai-practices.md` 修正為 `../chapter-08-production/production-ai-practices.md`（共 3 處）
- **📦 agents.md 棄用代碼**：以 `azure-monitor-opentelemetry` + OpenTelemetry SDK 取代 `opencensus`
- **🐛 agents.md 無效 API**：將 `max_tokens` 從 `create_agent()` 移至 `create_run()`，並改名為 `max_completion_tokens`
- **🔢 agents.md 代幣計數**：以 `tiktoken.encoding_for_model()` 取代粗略 `len//4` 估算
- **azure-search-openai-demo**：服務更正為「Azure AI Search + Azure Container Apps」，取代「Cognitive Search + App Service」（預設主機於 2024 年 10 月變更）
- **contoso-chat**：更新描述以參考 Azure AI Foundry + Prompty，符合實際倉庫標題與技術架構

#### 移除
- **ai-document-processing**：移除無法運作的模板參考（該倉庫未公開為 AZD 模板）

#### 改善
- **📝 agents.md 練習**：練習 1 現示預期輸出和 `azd monitor` 步驟；練習 2 包含完整 `FunctionTool` 註冊程式碼；練習 3 用具體 `prepdocs.py` 指令替換模糊指示
- **📚 agents.md 資源**：更新文件連結至最新 Azure AI Agent Service 文件與快速入門
- **📋 agents.md 下一步表格**：加入 AI 工作坊實驗室連結，涵蓋完整章節內容

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

#### 課程導覽強化
**此版本使用更完善的表格格式，改善 README.md 章節導覽。**

#### 變更
- <strong>課程地圖表格</strong>：加強包含直接課程連結、預估時長與難度評級
- <strong>資料夾清理</strong>：移除多餘舊資料夾（deployment/、getting-started/、pre-deployment/、troubleshooting/）
- <strong>連結驗證</strong>：課程地圖表中 21+ 個內部連結均檢查無誤

### [v3.16.0] - 2026-02-05

#### 產品名稱更新
**此版本更新產品參考為目前的 Microsoft 品牌名稱。**

#### 變更
- **Microsoft Foundry → Microsoft Foundry**：所有非翻譯檔案中更新使用
- **Azure AI Agent Service → Foundry Agents**：服務名稱更新反映現行品牌

#### 更新檔案
- `README.md` - 主要課程首頁
- `changelog.md` - 版本歷史
- `course-outline.md` - 課程結構
- `docs/chapter-02-ai-development/agents.md` - AI 代理指南
- `examples/README.md` - 範例文件
- `workshop/README.md` - 工作坊首頁
- `workshop/docs/index.md` - 工作坊索引
- `workshop/docs/instructions/*.md` - 所有工作坊指示文件

---

### [v3.15.0] - 2026-02-05

#### 主要倉庫重構：以章節為基礎的資料夾名稱
**此版本將文件重組至專門的章節資料夾，以利更清晰的導覽。**

#### 資料夾更名
舊資料夾被章節編號資料夾取代：
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- 新增資料夾：`docs/chapter-05-multi-agent/`

#### 文件遷移
| 檔案 | 從 | 至 |
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
| 所有預部署檔案 | pre-deployment/ | chapter-06-pre-deployment/ |
| 所有疑難排解檔案 | troubleshooting/ | chapter-07-troubleshooting/ |

#### 新增
- **📚 章節 README 文件**：在每個章節資料夾建立 README.md，內容包括：
  - 學習目標和時長
  - 課程表與說明
  - 快速啟動指令
  - 導航至其他章節

#### 變更
- **🔗 更新所有內部連結**：跨所有文件更新超過 78 個路徑
- **🗺️ 主要 README.md**：更新課程地圖反映新章節結構
- **📝 examples/README.md**：更新章節資料夾交叉引用

#### 移除
- 舊資料夾結構（getting-started/、microsoft-foundry/、deployment/、pre-deployment/、troubleshooting/、ai-foundry/）

---

### [v3.14.0] - 2026-02-05

#### 倉庫重構：章節導覽
**此版本新增章節導覽 README 文件（後續被 v3.15.0 取代）。**

---

### [v3.13.0] - 2026-02-05

#### 新增 AI 代理指南
**此版本增加完整指南，介紹如何使用 Azure Developer CLI 部署 AI 代理。**

#### 新增
- **🤖 docs/microsoft-foundry/agents.md**：完整指南涵蓋：
  - 什麼是 AI 代理以及它們與聊天機器人的差異
  - 三個快速啟動代理模板（Foundry Agents、Prompty、RAG）
  - 代理架構模式（單一代理、RAG、多代理）
  - 工具設定與自訂
  - 監控與度量追蹤
  - 成本考量與最佳化
  - 常見疑難排解情境
  - 三個實作練習與成功標準

#### 內容架構
- <strong>介紹</strong>：初學者的代理概念
- <strong>快速入門</strong>：使用 `azd init --template get-started-with-ai-agents` 部署代理
- <strong>架構模式</strong>：代理模式視覺圖解
- <strong>設定</strong>：工具組態與環境變數
- <strong>監控</strong>：Application Insights 整合
- <strong>練習</strong>：進階實作練習（每項 20-45 分鐘）

---

### [v3.12.0] - 2026-02-05

#### DevContainer 環境更新
**此版本使用現代工具和更佳預設，更新開發容器設定，提升 AZD 學習體驗。**

#### 變更
- **🐳 基底映像**：由 `python:3.12-bullseye` 更新為 `python:3.12-bookworm`（最新 Debian 穩定版）
- **📛 容器名稱**：由「Python 3」改名為「AZD for Beginners」以提高清楚度

#### 新增
- **🔧 新增開發容器功能**：
  - 啟用 Bicep 支援的 `azure-cli`
  - `node:20`（AZD 模板長期支援版本）
  - 用於模板管理的 `github-cli`
  - 支援容器應用部署的 `docker-in-docker`

- **🔌 端口轉發**：預設開放常用開發端口：
  - 8000（MkDocs 預覽）
  - 3000（網頁應用）
  - 5000（Python Flask）
  - 8080（API）

- **🧩 新增 VS Code 擴充功能**：
  - `ms-python.vscode-pylance` - 強化 Python 智慧感知
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions 支援
  - `ms-azuretools.vscode-docker` - Docker 支援
  - `ms-azuretools.vscode-bicep` - Bicep 語言支援
  - `ms-azure-devtools.azure-resource-groups` - Azure 資源管理
  - `yzhang.markdown-all-in-one` - Markdown 編輯
  - `DavidAnson.vscode-markdownlint` - Markdown 語法檢查
  - `bierner.markdown-mermaid` - Mermaid 圖表支援
  - `redhat.vscode-yaml` - YAML 支援（用於 azure.yaml）
  - `eamodio.gitlens` - Git 視覺化
  - `mhutchie.git-graph` - Git 歷史紀錄

- **⚙️ VS Code 設定**：新增 Python 直譯器、保存自動格式化與修剪空白字元的預設設定

- **📦 更新 requirements-dev.txt**：
  - 新增 MkDocs minify 外掛
  - 新增 pre-commit 以維護程式碼品質
  - 新增 Azure SDK 套件（azure-identity、azure-mgmt-resource）

#### 修正
- <strong>建置後命令</strong>：現在於容器啟動時驗證 AZD 和 Azure CLI 是否安裝

---

### [v3.11.0] - 2026-02-05

#### 適合初學者的 README 改版
**此版本大幅改進 README.md，讓初學者更易理解，並新增 AI 開發者必備資源。**

#### 新增
- **🆚 Azure CLI 與 AZD 比較**：清楚說明兩工具使用時機，附實際範例
- **🌟 精彩 AZD 連結**：直接連結社群模板館和貢獻資源：
  - [精彩 AZD 展示館](https://azure.github.io/awesome-azd/) - 200+ 可直接部署模板
  - [提交模板](https://github.com/Azure/awesome-azd/issues) - 社群貢獻
- **🎯 快速入門指南**：簡化三步驟起始流程（安裝 → 登入 → 部署）
- **📊 依經驗導覽表**：根據開發者經驗給予清晰起點建議

#### 變更
- **README 結構**：重新組織，採漸進揭露方式優先呈現關鍵資訊
- <strong>介紹段落</strong>：改寫說明「`azd up` 的魔法」給完全新手
- <strong>刪除重複內容</strong>：移除重複的疑難排解段落
- <strong>疑難排解指令</strong>：修正 `azd logs` 改用有效指令 `azd monitor --logs`

#### 修正

- **🔐 認證指令**：在 cheat-sheet.md 中新增 `azd auth login` 和 `azd auth logout`
- <strong>無效指令參考</strong>：移除 README 疑難排解部分剩餘的 `azd logs`

#### 備註
- <strong>範圍</strong>：變更套用於主 README.md 與 resources/cheat-sheet.md
- <strong>目標讀者</strong>：專為剛接觸 AZD 的開發者改進

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI 指令準確性更新
**此版本修正文件中不存在的 AZD 指令，確保所有程式碼範例均使用有效的 Azure Developer CLI 語法。**

#### 修正
- **🔧 移除不存在的 AZD 指令**：全面稽核並更正無效指令：
  - `azd logs`（不存在）→ 替換為 `azd monitor --logs` 或 Azure CLI 替代方案
  - `azd service` 子指令（不存在）→ 替換為 `azd show` 和 Azure CLI
  - `azd infra import/export/validate`（不存在）→ 移除或替換為有效替代
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` 標誌（不存在）→ 移除
  - `azd provision --what-if/--rollback` 標誌（不存在）→ 更新為使用 `--preview`
  - `azd config validate`（不存在）→ 替換為 `azd config list`
  - `azd info`、`azd history`、`azd metrics`（不存在）→ 移除

- **📚 已更新檔案修正指令**：
  - `resources/cheat-sheet.md`：指令參考大幅更新
  - `docs/deployment/deployment-guide.md`：修正還原及部署策略
  - `docs/troubleshooting/debugging.md`：糾正日誌分析部分
  - `docs/troubleshooting/common-issues.md`：更新疑難排解指令
  - `docs/troubleshooting/ai-troubleshooting.md`：修正 AZD 偵錯段落
  - `docs/getting-started/azd-basics.md`：修正監控指令
  - `docs/getting-started/first-project.md`：更新監控和偵錯範例
  - `docs/getting-started/installation.md`：修正幫助與版本示範
  - `docs/pre-deployment/application-insights.md`：修正日誌檢視指令
  - `docs/pre-deployment/coordination-patterns.md`：修正代理偵錯指令

- **📝 版本參考更新**：
  - `docs/getting-started/installation.md`：將硬編碼的 `1.5.0` 版本改為通用的 `1.x.x` 並連結發布頁

#### 變更
- <strong>還原策略</strong>：將文件更新為使用基於 Git 的還原（AZD 原生無還原功能）
- <strong>日誌檢視</strong>：用 `azd monitor --logs`、`azd monitor --live` 和 Azure CLI 指令取代 `azd logs`
- <strong>效能部分</strong>：移除不存在的平行/增量部署標誌，提供有效替代方案

#### 技術細節
- **有效的 AZD 指令**：`init`、`up`、`auth`、`deploy`、`down`、`provision`、`publish`、`completion`、`config`、`env`、`show`、`version`、`monitor`
- **有效的 azd monitor 標誌**：`--live`、`--logs`、`--overview`
- <strong>移除功能</strong>：`azd logs`、`azd service`、`azd infra import/export/validate`、`azd history`、`azd metrics`、`azd info`、`azd config validate`

#### 備註
- <strong>驗證</strong>：指令已依 Azure Developer CLI v1.23.x 版本驗證

---

### [v3.9.0] - 2026-02-05

#### 互動工作坊完成與文件品質更新
**此版本完成所有互動工作坊模組，修復所有斷裂的文件連結，並提升 Microsoft AZD AI 開發者整體內容品質。**

#### 新增
- **📝 CONTRIBUTING.md**：新增貢獻指南文件，內容包含：
  - 明確的問題回報與變更提案指示
  - 新內容的文件標準
  - 程式碼範例指導與提交訊息慣例
  - 社群參與資訊

#### 完成
- **🎯 工作坊模組 7（總結）**：完整完成總結模組，包含：
  - 工作坊成就全面概述
  - AZD、範本與 Microsoft Foundry 關鍵概念掌握
  - 學習旅程後續建議
  - 工作坊挑戰練習與難度評比
  - 社群回饋與支援連結

- **📚 工作坊模組 3（拆解）**：更新學習目標，含：
  - GitHub Copilot 與 MCP 伺服器啟用指南
  - AZD 範本資料夾結構理解
  - 基於程式碼基礎設施 (Bicep) 組織模式
  - 實作實驗室指示

- **🔧 工作坊模組 6（拆除）**：完成，包含：
  - 資源清理及成本管理目標
  - 使用 `azd down` 安全解除基礎架構佈署
  - 軟刪除的認知服務復原指導
  - 額外探索題目如 GitHub Copilot 與 Azure 入口網站

#### 修正
- **🔗 斷裂連結修復**：解決 15+ 內部文件斷裂連結：
  - `docs/ai-foundry/ai-model-deployment.md`：修正至 microsoft-foundry-integration.md 的路徑
  - `docs/troubleshooting/ai-troubleshooting.md`：修正 ai-model-deployment.md 和 production-ai-practices.md 路徑
  - `docs/getting-started/first-project.md`：將不存在的 cicd-integration.md 替換為 deployment-guide.md
  - `examples/retail-scenario.md`：修正常見問答與疑難排解指南路徑
  - `examples/container-app/microservices/README.md`：修正課程首頁與部署指南路徑
  - `resources/faq.md` 及 `resources/glossary.md`：更新 AI 章節參考
  - `course-outline.md`：修正講師指南及 AI 工作坊實驗室參考

- **📅 工作坊狀態橫幅**：從「施工中」更新為 2026 年 2 月的活動狀態

- **🔗 工作坊導覽**：修正 README.md 中指向不存在 lab-1-azd-basics 資料夾的斷鏈導覽

#### 變更
- <strong>工作坊簡報</strong>：移除「施工中」警告，工作坊已完成並可使用
- <strong>導覽一致性</strong>：確保所有工作坊模組均有適當的模組間導覽
- <strong>學習路徑參考</strong>：更新章節交叉參照，使用正確的 microsoft-foundry 路徑

#### 已驗證
- ✅ 所有英文 Markdown 檔案具有效的內部連結
- ✅ 工作坊模組 0-7 完整，含學習目標
- ✅ 章節與模組間導覽正常運作
- ✅ 內容適用於使用 Microsoft AZD 的 AI 開發者
- ✅ 全程維持初學者友好語言與結構
- ✅ CONTRIBUTING.md 清楚提供社群貢獻指引

#### 技術實作
- <strong>連結驗證</strong>：採用自動化 PowerShell 腳本驗證所有 .md 內部連結
- <strong>內容稽核</strong>：手動審查工作坊完整性與初學者適用性
- <strong>導覽系統</strong>：應用一致的章節與模組導覽模式

#### 備註
- <strong>範圍</strong>：變更僅套用於英文文件
- <strong>翻譯</strong>：翻譯資料夾此版本未更新（稍後將由自動翻譯同步）
- <strong>工作坊時長</strong>：完整工作坊現提供 3-4 小時的實作學習

---

### [v3.8.0] - 2025-11-19

#### 進階文件：監控、安全與多代理模式
**此版本新增全面的 A 級課程，涵蓋 Application Insights 整合、認證模式、以及生產佈署的多代理協調。**

#### 新增
- **📊 Application Insights 整合課程**：位於 `docs/pre-deployment/application-insights.md`：
  - 專注於 AZD 的佈署與自動配置
  - 完整的 Application Insights + Log Analytics Bicep 範本
  - Python 應用程式含客製遙測（1,200+ 行程式碼）
  - AI/LLM 監控模式（Microsoft Foundry 模型令牌/成本追蹤）
  - 6 張 Mermaid 圖（架構、分布式追蹤、遙測流程）
  - 3 項實作練習（警示、儀表板、AI 監控）
  - Kusto 查詢範例及成本優化策略
  - 實時指標串流與即時偵錯
  - 40-50 分鐘學習時間，提供生產就緒模式

- **🔐 認證與安全模式課程**：位於 `docs/getting-started/authsecurity.md`：
  - 3 種認證模式（連接字串、Key Vault、託管身份）
  - 安全佈署完整 Bicep 基礎架構範本
  - Node.js 應用程式碼包含 Azure SDK 整合
  - 3 項完整練習（啟用託管身份、用戶指派身份、Key Vault 轉換）
  - 安全最佳實踐與 RBAC 配置
  - 疑難排解指南與成本分析
  - 支援生產的無密碼認證模式

- **🤖 多代理協調模式課程**：位於 `docs/pre-deployment/coordination-patterns.md`：
  - 5 種協調模式（序列、平行、階層、事件驅動、共識）
  - 完整調度者服務實作（Python/Flask，1,500+ 行程式碼）
  - 3 種專門代理實作（研究、撰寫、編輯）
  - 服務匯流排整合訊息佇列
  - Cosmos DB 狀態管理用於分布式系統
  - 6 張 Mermaid 圖展示代理互動
  - 3 項進階練習（逾時處理、重試邏輯、斷路器）
  - 成本細目（每月 $240-565）及優化策略
  - Application Insights 監控整合

#### 強化
- <strong>預佈署章節</strong>：現在包含全面監控與協調模式
- <strong>入門章節</strong>：增加專業認證模式
- <strong>生產準備</strong>：涵蓋從安全到可觀測性的完整內容
- <strong>課程大綱</strong>：更新以參考第 3 與第 6 章的新課程

#### 變更
- <strong>學習進度</strong>：更好整合安全與監控內容於整個課程
- <strong>文件品質</strong>：新課程達到穩定的 A 級標準（95-97%）
- <strong>生產模式</strong>：提供企業部署的端到端完整覆蓋

#### 改善
- <strong>開發者體驗</strong>：從開發到生產監控清晰路徑
- <strong>安全標準</strong>：專業認證與機密管理模式
- <strong>可觀測性</strong>：AZD 與 Application Insights 完整整合
- **AI 工作負載**：專為 Microsoft Foundry 模型與多代理系統量身監控

#### 已驗證
- ✅ 所有課程含完整可執行程式碼（非片段）
- ✅ 以 Mermaid 圖表輔助視覺學習（3 課程共 19 張）
- ✅ 含驗證步驟的實作練習（共 9 項）
- ✅ 生產就緒 Bicep 範本可由 `azd up` 部署
- ✅ 成本分析與優化策略
- ✅ 疑難排解指南與最佳實踐
- ✅ 知識檢核點與驗證指令

#### 文件評分結果
- **docs/pre-deployment/application-insights.md**：- 全面監控指南
- **docs/getting-started/authsecurity.md**：- 專業安全模式
- **docs/pre-deployment/coordination-patterns.md**：- 高階多代理架構
- <strong>整體新內容</strong>：- 穩定一致的高品質標準

#### 技術實作
- **Application Insights**：Log Analytics + 自訂遙測 + 分布式追蹤
- <strong>認證</strong>：託管身份 + Key Vault + RBAC 模式
- <strong>多代理</strong>：服務匯流排 + Cosmos DB + Container Apps + 編排
- <strong>監控</strong>：即時指標 + Kusto 查詢 + 警示 + 儀表板
- <strong>成本管理</strong>：採樣策略、保留政策、預算控管

### [v3.7.0] - 2025-11-19

#### 文件品質提升與新增 Microsoft Foundry Models 範例
**此版本提升整個倉庫的文件品質，並新增完整 Microsoft Foundry Models 部署範例，包含 gpt-4.1 聊天介面。**

#### 新增
- **🤖 Microsoft Foundry Models 聊天範例**：完整 gpt-4.1 部署與 `examples/azure-openai-chat/` 的運作實作：
  - 完整的 Microsoft Foundry Models 基礎架構（gpt-4.1 模型部署）
  - Python 命令列聊天介面，含對話歷史
  - Key Vault 整合以安全儲存 API 金鑰
  - 令牌使用追蹤與成本估算
  - 速率限制與錯誤處理
  - 詳盡 README，含 35-45 分鐘部署指南
  - 11 個生產就緒檔案（Bicep 範本、Python 應用、設定）
- **📚 文件練習**：在設定指南中新增實作練習：
  - 練習 1：多環境設定（15 分鐘）
  - 練習 2：祕密管理實作（10 分鐘）
  - 明確成功準則與驗證步驟
- **✅ 部署驗證**：新增部署指南驗證段落：
  - 健康檢查程序
  - 成功準則清單
  - 所有部署指令的預期輸出
  - 快速疑難排解參考

#### 強化
- **examples/README.md**：更新至 A 級品質（93%）：
  - 在所有相關段落新增 azure-openai-chat
  - 本地範例數量從 3 增至 4
  - 加入 AI 應用範例表
  - 整合至中階使用者快速開始指南
  - 新增 Microsoft Foundry 範本章節
  - 更新比較矩陣與技術探索部分
- <strong>文件品質</strong>：docs 資料夾整體由 B+ (87%) 提升至 A- (92%)：

  - 新增關鍵指令範例的預期輸出
  - 包含配置變更的驗證步驟
  - 強化實務操作的實作練習

#### 變更
- <strong>學習進程</strong>：為中階學習者更好整合 AI 範例
- <strong>文件結構</strong>：更多具體行動的練習並明確結果
- <strong>驗證流程</strong>：為關鍵工作流程新增明確成功標準

#### 改善
- <strong>開發者體驗</strong>：Microsoft Foundry Models 部署時間縮短為 35-45 分鐘（相較於複雜方案的 60-90 分鐘）
- <strong>成本透明</strong>：Microsoft Foundry Models 範例清楚成本估算（每月 50-200 美元）
- <strong>學習路徑</strong>：AI 開發者有明確入口，使用 azure-openai-chat
- <strong>文件標準</strong>：預期輸出和驗證步驟一致性

#### 驗證
- ✅ Microsoft Foundry Models 範例可用 `azd up` 完全運作
- ✅ 11 個實作檔案語法皆正確
- ✅ README 指示與實際部署經驗相符
- ✅ 文件連結更新超過 8 個位置
- ✅ 範例索引準確反映 4 個本地範例
- ✅ 表格中無重複外部連結
- ✅ 所有導航參考正確

#### 技術實作
- **Microsoft Foundry Models 架構**：gpt-4.1 + Key Vault + Container Apps 模式
- <strong>安全性</strong>：已支援 Managed Identity，秘密存於 Key Vault
- <strong>監控</strong>：整合 Application Insights
- <strong>成本管理</strong>：代幣追蹤與使用優化
- <strong>部署</strong>：單一 `azd up` 指令完成整套部署

### [v3.6.0] - 2025-11-19

#### 重大更新：Container App 部署範例
**本版本引入完整的生產級容器應用部署範例，透過 Azure Developer CLI (AZD) 並附完整文件，整合於學習路徑中。**

#### 新增
- **🚀 Container App 範例**：新增本地範例於 `examples/container-app/`：
  - [主導覽](examples/container-app/README.md)：容器部署全覽、快速入門、生產及進階模式
  - [簡易 Flask API](../../examples/container-app/simple-flask-api)：適合初學者的 REST API，包含零規模擴展、健康檢查、監控與除錯
  - [微服務架構](../../examples/container-app/microservices)：生產級多服務部署（API Gateway、產品、訂單、使用者、通知），非同步訊息、Service Bus、Cosmos DB、Azure SQL、分散式追蹤、藍綠／金絲雀部署
- <strong>最佳實踐</strong>：針對容器工作負載的安全、監控、成本優化與 CI/CD 指導
- <strong>程式碼範例</strong>：完整 `azure.yaml`、Bicep 範本及多語言服務實作（Python、Node.js、C#、Go）
- <strong>測試與除錯</strong>：端對端測試流程、監控命令、故障排除指引

#### 變更
- **README.md**：新增功能並連結 Container App 範例，置於「本地範例 - 容器應用」下
- **examples/README.md**：強調 Container App 範例，新增比較矩陣條目，並更新技術與架構參考
- <strong>課程大綱與學習指南</strong>：引用新 Container App 範例及部署模式於相關章節

#### 驗證
- ✅ 全新範例可使用 `azd up` 部署且遵循最佳實踐
- ✅ 文件跨鏈接與導航已更新
- ✅ 範例涵蓋初階至進階場景，包括生產微服務

#### 備註
- <strong>範圍</strong>：僅限英文文件及範例
- <strong>後續步驟</strong>：未來版本將擴增更多先進容器模式與 CI/CD 自動化

### [v3.5.0] - 2025-11-19

#### 產品品牌更新：Microsoft Foundry
**本版本於所有英文文件中，全面將產品名稱從「Microsoft Foundry」變更為「Microsoft Foundry」，反映微軟官方品牌更新。**

#### 變更
- **🔄 產品名稱更新**：從「Microsoft Foundry」全面重命名為「Microsoft Foundry」
  - 更新位於 `docs/` 資料夾中所有英文文件參考
  - 資料夾更名：`docs/ai-foundry/` → `docs/microsoft-foundry/`
  - 檔案更名：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 總計更新 7 個文件中 23 處內容參考

- **📁 資料夾結構變更**：
  - `docs/ai-foundry/` 更名為 `docs/microsoft-foundry/`
  - 所有交叉參照更新以反映新資料夾結構
  - 全文件導航連結驗證無誤

- **📄 檔案重新命名**：
  - `azure-ai-foundry-integration.md` 改名為 `microsoft-foundry-integration.md`
  - 所有內部連結皆更新對應新檔名

#### 更新檔案
- <strong>章節文件</strong>（7 個檔案）：
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 處導航連結更新
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 處產品名稱參考更新
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - 先前已使用 Microsoft Foundry
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 處參考更新（概覽、社群回饋、文件）
  - `docs/getting-started/azd-basics.md` - 4 處交叉參照更新
  - `docs/getting-started/first-project.md` - 2 處章節導航連結更新
  - `docs/getting-started/installation.md` - 2 處下一章節連結更新
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 處參考更新（導航、Discord 社群）
  - `docs/troubleshooting/common-issues.md` - 1 處導航連結更新
  - `docs/troubleshooting/debugging.md` - 1 處導航連結更新

- <strong>課程結構檔案</strong>（2 個檔案）：
  - `README.md` - 17 處參考更新（課程概覽、章節標題、範本區塊、社群洞見）
  - `course-outline.md` - 14 處參考更新（概覽、學習目標、章節資源）

#### 驗證
- ✅ 英文文件中不再包含「ai-foundry」資料夾路徑參考
- ✅ 英文文件中不再有「Microsoft Foundry」產品名稱參考殘留
- ✅ 所有依新資料夾結構的導航連結皆正常運作
- ✅ 完成檔案與資料夾更名
- ✅ 章節間交叉參考已驗證無誤

#### 備註
- <strong>範圍</strong>：本次變更僅限於 `docs/` 資料夾中的英文文件
- <strong>翻譯版</strong>：翻譯資料夾 (`translations/`) 尚未更新
- <strong>研討會</strong>：工作坊材料 (`workshop/`) 尚未更新
- <strong>範例</strong>：範例檔案可能仍然引用舊名（將於未來版本處理）
- <strong>外部連結</strong>：外部 URL 及 GitHub 倉庫連結維持原狀

#### 參與者遷移指南
若您有本地分支或文檔仍指向舊結構：
1. 更新資料夾參考：`docs/ai-foundry/` → `docs/microsoft-foundry/`
2. 更新檔案參考：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. 替換產品名稱：「Microsoft Foundry」→「Microsoft Foundry」
4. 確認所有內部文件連結仍可正常使用

---

### [v3.4.0] - 2025-10-24

#### 基礎建設預覽與驗證強化
**本版本全面支援 Azure Developer CLI 新增的基礎建設預覽功能並提升工作坊使用者體驗。**

#### 新增
- **🧪 azd provision --preview 功能文件**：涵蓋全新基礎建設預覽功能
  - 指令參考與用法示例收錄於速查表
  - 預置指南中詳述整合、應用案例與優勢
  - 預檢查機制整合以強化安全部署驗證
  - 入門指南更新，導入安全優先的部署實務
- **🚧 工作坊狀態橫幅**：專業 HTML 橫幅顯示工作坊開發狀態
  - 漸層設計搭配施工指示，清晰溝通用戶
  - 最新更新時間戳示透明度
  - 支援各類裝置的行動響應式設計

#### 強化
- <strong>基礎建設安全性</strong>：整個部署文件中整合預覽功能
- <strong>部署前驗證</strong>：自動化腳本新增基礎建設預覽測試
- <strong>開發流程</strong>：更新指令序列，將預覽納入最佳實務
- <strong>工作坊體驗</strong>：明確告知用戶內容開發狀態

#### 變更
- <strong>部署最佳實務</strong>：建議採用預覽優先工作流程
- <strong>文件流程</strong>：基礎建設驗證提前納入學習流程
- <strong>工作坊呈現</strong>：專業狀態通知並附明確開發時程

#### 改進
- <strong>安全優先</strong>：基礎建設變更可於部署前驗證
- <strong>團隊協作</strong>：可分享預覽結果以供審核與批准
- <strong>成本意識</strong>：部署前更清楚預算與資源花費
- <strong>風險降低</strong>：透過先行驗證減少部署失敗

#### 技術實作
- <strong>多文件整合</strong>：4 個關鍵檔案中均有預覽功能文件
- <strong>指令範例</strong>：文件中保持一致語法與範例
- <strong>最佳實務整合</strong>：驗證流程與指令腳本內均含預覽
- <strong>視覺標示</strong>：明確「NEW」標記讓新功能易於發現

#### 工作坊基礎建設
- <strong>狀態通知</strong>：專業 HTML 橫幅搭配漸層樣式
- <strong>用戶體驗</strong>：清楚說明開發狀態，避免誤解
- <strong>專業呈現</strong>：維持倉庫可信度並設立期望
- <strong>時程透明</strong>：2025 年 10 月最後更新時間標示

### [v3.3.0] - 2025-09-24

#### 強化工作坊材料與互動學習體驗
**本版本引入全面的瀏覽器互動式工作坊指南及結構化學習路徑。**

#### 新增
- **🎥 互動式工作坊指南**：基於瀏覽器的工作坊體驗，搭配 MkDocs 預覽功能
- **📝 結構性工作坊指導**：7 步驟引導式學習流程，從探索至自訂化
  - 0-介紹：工作坊概覽與設定
  - 1-選擇 AI 模板：範本探索與選擇過程
  - 2-驗證 AI 模板：部署與驗證程序
  - 3-拆解 AI 模板：理解模板架構
  - 4-配置 AI 模板：設定與自訂
  - 5-自訂 AI 模板：進階修改與迭代
  - 6-拆除基礎設施：清理與資源管理
  - 7-結束：總結與後續步驟
- **🛠️ 工作坊工具**：使用 MkDocs 配置 Material 主題提升學習體驗
- **🎯 實務學習路徑**：3 步驟法 （探索 → 部署 → 自訂）
- **📱 GitHub Codespaces 整合**：無縫開發環境設定

#### 強化
- **AI 工作坊實驗室**：擴展為 2-3 小時完整結構化學習體驗
- <strong>工作坊文件</strong>：專業呈現，具導航與視覺輔助
- <strong>學習進程</strong>：從範本選擇到生產部署明確指導
- <strong>開發者體驗</strong>：整合工具以簡化開發流程

#### 改善
- <strong>可及性</strong>：瀏覽器介面具備搜尋、複製代碼與主題切換
- <strong>自定節奏學習</strong>：工作坊架構彈性適應不同學習速度
- <strong>實務應用</strong>：真實 AI 模板部署範例
- <strong>社群整合</strong>：Discord 支援與合作

#### 工作坊功能
- <strong>內建搜尋</strong>：快速關鍵字與課程查找
- <strong>代碼區塊複製</strong>：滑鼠懸停即複製所有範例代碼
- <strong>主題切換</strong>：支援深色／淺色模式
- <strong>視覺資產</strong>：截圖與圖解加強理解
- <strong>協助整合</strong>：直接連結 Discord 社群支援

### [v3.2.0] - 2025-09-17

#### 大幅調整導航與章節化學習系統
**本版本導入完整章節式學習架構，全面增強倉庫內的導航體驗。**

#### 新增
- **📚 章節式學習系統**：將整個課程重構為 8 個循序漸進的學習章節
  - 第一章：基礎與快速入門 (⭐ - 30-45 分鐘)
  - 第二章：AI 優先開發 (⭐⭐ - 1-2 小時)
  - 第三章：配置與身份驗證 (⭐⭐ - 45-60 分鐘)
  - 第四章：基礎建設即程式碼與部署 (⭐⭐⭐ - 1-1.5 小時)
  - 第五章：多代理 AI 解決方案 (⭐⭐⭐⭐ - 2-3 小時)
  - 第六章：部署前驗證與規劃 (⭐⭐ - 1 小時)
  - 第七章：故障排除與除錯 (⭐⭐ - 1-1.5 小時)
  - 第八章：生產與企業實踐 (⭐⭐⭐⭐ - 2-3 小時)
- **📚 完整導航系統**：所有文件均設置一致的導航標題與頁尾
- **🎯 進度追蹤**：課程完成核對清單與學習驗證系統
- **🗺️ 學習路徑指引**：為不同經驗層及目標提供明確入口
- **🔗 交叉參考導航**：清楚連結相關章節與先決條件

#### 強化
- **README 結構**：改造為章節制組織的結構化學習平台
- <strong>文件導航</strong>：每頁納入章節上下文與進程指引
- <strong>範本組織</strong>：範例與模板映射至適合的學習章節

- <strong>資源整合</strong>：與相關章節連結的速查表、常見問答與學習指南
- <strong>工作坊整合</strong>：對應多個章節學習目標的實作實驗室

#### 變更
- <strong>學習進程</strong>：從線性文件轉換為靈活的章節式學習
- <strong>設定放置位置</strong>：將設定指南重新定位為第3章以優化學習流程
- **AI內容整合**：在整個學習過程中更好地整合AI專屬內容
- <strong>生產內容</strong>：第8章匯整進階模式，專為企業學習者設計

#### 改善
- <strong>使用者體驗</strong>：清晰的導航麵包屑與章節進度指示
- <strong>無障礙設計</strong>：一致的導航模式便於課程瀏覽
- <strong>專業呈現</strong>：大學風格課程結構，適合學術與企業培訓
- <strong>學習效率</strong>：透過改進的組織結構減少查找相關內容的時間

#### 技術實作
- <strong>導航標頭</strong>：40多個文件中標準化章節導航
- <strong>頁腳導航</strong>：一致的進度引導與章節完成指示
- <strong>交叉連結</strong>：全面的內部連結系統連接相關概念
- <strong>章節對應</strong>：模板與範例明確對應學習目標

#### 學習指南強化
- **📚 全面學習目標**：重組學習指南對應8章系統
- **🎯 章節評量**：每章包含具體學習目標與實務練習
- **📋 進度追蹤**：具可量化結果與完成清單的每週學習計畫
- **❓ 評量問題**：針對各章節的知識驗證題與專業成果
- **🛠️ 實務練習**：實機部署情境與故障排除活動
- **📊 技能進階**：明確從基礎概念到企業模式的職涯發展焦點
- **🎓 證照框架**：專業發展成果與社群認可系統
- **⏱️ 時間管理**：有里程碑驗證的結構化10週學習計畫

### [v3.1.0] - 2025-09-17

#### 強化多代理AI解決方案
**此版本改進零售多代理解決方案，優化代理命名與文件內容。**

#### 變更
- <strong>多代理術語</strong>：將零售多代理解決方案中的 "Cora agent" 全面替換為 "Customer agent" 以增進清晰度
- <strong>代理架構</strong>：更新所有文件、ARM模板與程式碼範例，統一使用 "Customer agent" 命名
- <strong>配置範例</strong>：現代化代理配置模式並更新命名規則
- <strong>文件一致性</strong>：確保所有引用均使用專業且具描述性的代理名稱

#### 強化
- **ARM模板套件**：更新 retail-multiagent-arm-template，包含 Customer agent 參考
- <strong>架構圖</strong>：刷新 Mermaid 架構圖，更新代理命名
- <strong>程式碼範例</strong>：Python 類別與實作範例改用 CustomerAgent 命名
- <strong>環境變數</strong>：所有部署腳本使用 CUSTOMER_AGENT_NAME 命名規則

#### 改善
- <strong>開發者體驗</strong>：文件中代理角色與職責更加清晰
- <strong>生產準備</strong>：更符合企業命名慣例
- <strong>學習資源</strong>：為教育用途提供更直觀的代理命名
- <strong>模板可用性</strong>：簡化代理功能與部署模式的理解

#### 技術細節
- 更新 Mermaid 架構圖引用 CustomerAgent
- Python 範例中將 CoraAgent 類名替換為 CustomerAgent
- 修改 ARM JSON 配置，使用 "customer" 代理類型
- 環境變數從 CORA_AGENT_* 更新為 CUSTOMER_AGENT_*
- 更新所有部署命令與容器配置

### [v3.0.0] - 2025-09-12

#### 重大變更 - AI開發者專注與 Microsoft Foundry 整合
**此版本將倉庫轉型為專注AI的完整學習資源，並整合 Microsoft Foundry。**

#### 新增
- **🤖 AI優先學習路徑**：全面重組，優先支援AI開發者及工程師
- **Microsoft Foundry 整合指南**：完備的 AZD 與 Microsoft Foundry 服務連接文件
- **AI模型部署模式**：涵蓋模型選擇、配置及生產部署策略的詳細指南
- **AI工作坊實驗室**：2-3小時實作課程，教導將AI應用轉為可由AZD部署的解決方案
- **生產AI最佳實踐**：企業等級擴充、監控與安全模範
- **AI專屬除錯指南**：涵蓋 Microsoft Foundry 模型、認知服務及AI部署問題的全面除錯
- **AI模板集**：精選 Microsoft Foundry 模板及難易度評級
- <strong>工作坊教材</strong>：完善的工作坊結構含實作實驗室與參考資料

#### 強化
- **README結構**：聚焦AI開發者，並有Microsoft Foundry Discord社群45%的興趣數據支撐
- <strong>學習路徑</strong>：除傳統學生及DevOps工程師路徑外，新增專屬AI開發者旅程
- <strong>模板推薦</strong>：特色AI模板包括 azure-search-openai-demo、contoso-chat 與 openai-chat-app-quickstart
- <strong>社群整合</strong>：增強Discord社群支援，設立AI專區頻道與討論

#### 安全與生產焦點
- <strong>管理身分模式</strong>：AI專用認證與安全設定
- <strong>成本優化</strong>：AI工作負載的token使用量追蹤與預算控管
- <strong>多區域部署</strong>：全球AI應用部署策略
- <strong>效能監控</strong>：AI專屬指標與Application Insights整合

#### 文件品質
- <strong>線性課程結構</strong>：從入門到進階AI部署模式的邏輯進階
- **已驗證URL**：所有外部倉庫連結均測試可用
- <strong>完整參考</strong>：所有內部文件連結皆有效
- <strong>生產就緒</strong>：配合真實案例的企業部署模式

### [v2.0.0] - 2025-09-09

#### 重大變更 - 倉庫重新結構與專業提升
**此版本象徵倉庫結構與內容呈現的重大重整。**

#### 新增
- <strong>結構化學習框架</strong>：所有文件頁面新增介紹、學習目標與學習成果區塊
- <strong>導航系統</strong>：整合前後課程連結，指引學習流程
- <strong>學習指南</strong>：完善 study-guide.md，含學習目標、練習與評量材料
- <strong>專業呈現</strong>：移除所有emoji圖示，提升可及性與專業外觀
- <strong>內容結構強化</strong>：改進學習資源的組織與流程

#### 變更
- <strong>文件格式</strong>：標準化所有文件，採用一致且聚焦學習的結構
- <strong>導航流程</strong>：實現學習資料的邏輯進展
- <strong>內容呈現</strong>：移除裝飾元素，採用清晰且專業的格式
- <strong>連結結構</strong>：更新所有內部連結以支持新導航系統

#### 改善
- <strong>無障礙設計</strong>：移除對emoji的依賴，提高螢幕閱讀器相容性
- <strong>專業外觀</strong>：乾淨、學術風格呈現，適合企業學習
- <strong>學習體驗</strong>：結構化方式，為每課節設明確目標與成果
- <strong>內容組織</strong>：強化相關主題間的邏輯連結與流程

### [v1.0.0] - 2025-09-09

#### 初始發布 - 全面AZD學習資源庫

#### 新增
- <strong>核心文件架構</strong>
  - 完整入門指南系列
  - 全面部署與資源提供文件
  - 詳細除錯與故障排解指引
  - 部署前驗證工具與程序

- <strong>入門模組</strong>
  - AZD 基礎知識：核心概念與術語
  - 安裝指南：平台特定安裝指示
  - 設定指南：環境設置與認證
  - 首個專案教學：逐步實作學習

- <strong>部署與資源提供模組</strong>
  - 部署指南：完整工作流程文件
  - 資源提供指南：以Bicep實現基礎架構即程式碼
  - 生產部署最佳實踐
  - 多服務架構模式

- <strong>部署前驗證模組</strong>
  - 容量規劃：Azure資源可用性驗證
  - SKU選擇：完整服務層級指引
  - 預檢檢查：自動化驗證腳本（PowerShell與Bash）
  - 成本估算與預算規劃工具

- <strong>故障排解模組</strong>
  - 常見問題：頻繁遇見的問題與解決
  - 除錯指南：系統化排錯方法
  - 進階診斷技術與工具
  - 效能監控與優化

- <strong>資源與參考資料</strong>
  - 命令速查表：重要命令快速參考
  - 詞彙表：完整術語與縮寫定義
  - FAQ：詳細常見問題解答
  - 外部資源連結與社群連結

- <strong>範例與模板</strong>
  - 簡單Web應用範例
  - 靜態網站部署模板
  - 容器應用設定
  - 數據庫整合模式
  - 微服務架構範例
  - 無伺服器函式實作

#### 特點
- <strong>多平台支援</strong>：Windows、macOS及Linux安裝與配置指南
- <strong>多種技能層級</strong>：內容涵蓋學生至專業開發者
- <strong>實務導向</strong>：實作範例與真實情境
- <strong>全面內容涵蓋</strong>：從基礎概念至進階企業模式
- <strong>安全優先設計</strong>：貫穿安全最佳實踐
- <strong>成本優化</strong>：成本效益的部署與資源管理指導

#### 文件品質
- <strong>詳細程式碼範例</strong>：實用且經測試的程式碼範本
- <strong>逐步指導</strong>：清晰、可執行的操作引導
- <strong>全面錯誤處理</strong>：常見問題排錯
- <strong>最佳實踐整合</strong>：業界標準與建議
- <strong>版本相容性</strong>：與最新Azure服務及azd功能同步

## 計畫中的未來增強功能

### 版本 3.1.0（計劃中）
#### AI平台擴展
- <strong>多模型支援</strong>：整合 Hugging Face、Azure Machine Learning 與自訂模型的模式
- **AI代理框架**：LangChain、Semantic Kernel 與 AutoGen 部署模板
- **進階RAG模式**：Azure AI Search 以外的向量資料庫選項（Pinecone、Weaviate等）
- **AI可觀察性**：增強模型效能、token使用與回應品質監控

#### 開發者體驗
- **VS Code 擴充套件**：整合 AZD 與 Microsoft Foundry 的開發體驗
- **GitHub Copilot 整合**：AI輔助的 AZD 模板生成
- <strong>互動教學</strong>：具自動驗證的AI場景實作練習
- <strong>影片內容</strong>：專注於AI部署的視覺化補充教學

### 版本 4.0.0（計劃中）
#### 企業AI模式
- <strong>治理框架</strong>：AI模型治理、合規與稽核追蹤
- **多租戶AI**：提供隔離AI服務以服務多個客戶
- **邊緣AI部署**：整合 Azure IoT Edge 與容器實例
- **混合雲AI**：AI工作負載的多雲與混合部署模式

#### 進階功能
- **AI管線自動化**：與 Azure Machine Learning 管線的MLOps整合
- <strong>進階安全性</strong>：零信任模式、私人端點與進階威脅防護
- <strong>效能優化</strong>：針對高吞吐AI應用的優化與擴充策略
- <strong>全球分發</strong>：AI應用的內容傳遞與邊緣快取策略

### 版本 3.0.0（計劃中）- 已由現行發布取代
#### 建議新增 - 已於 v3.0.0 實施
- ✅ **AI專注內容**：全面 Microsoft Foundry 整合（已完成）
- ✅ <strong>互動教學</strong>：AI工作坊實作實驗室（已完成）
- ✅ <strong>進階安全模組</strong>：AI專屬安全模式（已完成）
- ✅ <strong>效能優化</strong>：AI工作負載調校策略（已完成）

### 版本 2.1.0（計劃中）- 部分於 v3.0.0 實施
#### 小幅增強 - 部分已完成於現行版本
- ✅ <strong>額外範例</strong>：AI專注的部署場景（已完成）
- ✅ **擴充FAQ**：AI專屬問題與除錯（已完成）
- <strong>工具整合</strong>：增強IDE與編輯器整合指導
- ✅ <strong>監控擴展</strong>：AI專用監控與警示模式（已完成）

#### 尚在計劃中未來版本
- <strong>行動友好文件</strong>：響應式設計以強化行動學習
- <strong>離線存取</strong>：可下載的文件套件
- **進階IDE整合**：AZD與AI工作流的VS Code擴充
- <strong>社群儀表板</strong>：即時社群指標與貢獻追蹤

## 對變更日誌的貢獻

### 報告變更
對本倉庫貢獻時，請確保變更日誌條目包含：

1. <strong>版本號碼</strong>：遵循語義化版本規範（主版本.次版本.補丁）
2. <strong>日期</strong>：發布或更新日期，格式為 YYYY-MM-DD
3. <strong>類別</strong>：新增、變更、棄用、移除、修正、安全
4. <strong>明確描述</strong>：簡潔說明變更內容
5. <strong>影響評估</strong>：對現有使用者的影響說明

### 變更類別

#### 新增
- 新功能、文件區塊或能力
- 新增範例、模板或學習資源
- 額外工具、腳本或實用程式

#### 變更
- 對現有功能或文件的修改
- 改善清晰度或準確性的更新
- 內容或組織重整

#### 棄用
- 將逐步淘汰的功能或方法
- 預定移除的文件區塊
- 有更佳替代方案的方法

#### 移除
- 不再相關的功能、文件或範例
- 過時資訊或棄用方法
- 重複或合併的內容

#### 修正
- 文件或程式碼中的錯誤修正
- 已回報問題的解決
- 準確度或功能性的提升


#### 安全性
- 與安全性相關的改進或修復
- 安全最佳實踐的更新
- 安全漏洞的解決

### 語意版本控制指南

#### 主要版本 (X.0.0)
- 需使用者介入的破壞性變更
- 內容或組織的重大重構
- 改變基本方法或策略的變更

#### 次要版本 (X.Y.0)
- 新功能或內容新增
- 維持向後相容性的強化
- 額外的範例、工具或資源

#### 修補版本 (X.Y.Z)
- 錯誤修正與校正
- 對現有內容的小幅改進
- 澄清說明與微小增強

## 社群回饋與建議

我們積極鼓勵社群提供回饋以改進此學習資源：

### 如何提供回饋
- **GitHub Issues**：回報問題或建議改進（歡迎針對 AI 相關議題）
- **Discord 討論**：分享想法並與 Microsoft Foundry 社群互動
- **Pull Requests**：直接貢獻內容改進，尤其是 AI 範本與指南
- **Microsoft Foundry Discord**：參與 #Azure 頻道進行 AZD + AI 議題討論
- <strong>社群論壇</strong>：參與更廣泛的 Azure 開發者討論

### 回饋分類
- **AI 內容準確度**：修正 AI 服務整合與部署資訊
- <strong>學習體驗</strong>：針對 AI 開發者學習流程的改進建議
- **缺失 AI 內容**：請求新增更多 AI 範本、模式或範例
- <strong>無障礙性</strong>：改善多元學習需求的功能
- **AI 工具整合**：提出更佳 AI 開發流程整合的建議
- **生產環境 AI 模式**：企業 AI 部署模式的需求

### 回應承諾
- <strong>問題回應</strong>：針對回報的問題，48 小時內回應
- <strong>功能請求</strong>：一週內評估
- <strong>社群貢獻</strong>：一週內審核
- <strong>安全議題</strong>：立即優先處理與快速回應

## 維護計畫

### 定期更新
- <strong>每月檢視</strong>：內容準確度與連結驗證
- <strong>每季更新</strong>：主要內容新增與改進
- <strong>半年檢視</strong>：全面重構與強化
- <strong>年度發行</strong>：重大版本更新與重大改進

### 監控與品質保證
- <strong>自動化測試</strong>：定期驗證程式碼範例與連結
- <strong>社群回饋整合</strong>：定期納入使用者建議
- <strong>技術更新</strong>：與最新 Azure 服務及 azd 發行保持一致
- <strong>無障礙性審核</strong>：定期檢視符合包容性設計原則

## 版本支援政策

### 當前版本支援
- <strong>最新主要版本</strong>：完整支援與定期更新
- <strong>前一主要版本</strong>：12 個月的安全更新與重要修補
- <strong>舊版</strong>：僅社群支援，無官方更新

### 遷移指引
主要版本發行時，我們提供：
- <strong>遷移指南</strong>：逐步轉換說明
- <strong>相容性說明</strong>：關於破壞性變更的細節
- <strong>工具支援</strong>：協助遷移的腳本或工具
- <strong>社群支援</strong>：專門的遷移問題論壇

---

<strong>導覽</strong>
- <strong>上一課</strong>：[學習指南](resources/study-guide.md)
- <strong>下一課</strong>：返回 [主要自述檔](README.md)

<strong>保持更新</strong>：追蹤本存放庫以獲得有關新發行版本及重要學習材料更新的通知。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->