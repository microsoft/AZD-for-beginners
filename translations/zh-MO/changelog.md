# 更新日誌 - AZD For Beginners

## 介紹

此更新日誌記錄了 AZD For Beginners 儲存庫所有顯著的變更、更新與改良。我們遵循語義版本控制原則並維護此日誌，以幫助使用者了解各版本間的變動。

## 學習目標

閱讀此更新日誌後，你將能：
- 隨時掌握新功能與內容新增
- 理解現有文件的改進部分
- 跟蹤錯誤修正以確保準確性
- 了解學習材料的演進歷程

## 學習成效

閱讀更新日誌條目後，你將能夠：
- 識別可用的新內容與學習資源
- 了解哪些章節已被更新或改良
- 根據最新材料規劃你的學習路徑
- 提出回饋與建議以促進未來改進

## 版本歷史

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 刷新：版本更新
**本版本重新驗證課程與`azd` `1.27.1`（2026年7月，最新穩定版）及目前預覽的 AI 代理擴充套件 `azure.ai.agents` `1.0.0-beta.5`，使每個“驗證對應版本”橫幅在 1.26.0、1.27.0 及 1.27.1 發布後皆為最新。**

#### 變更
- **✅ 驗證基準更新**，從 `azd 1.25.6`（2026年6月）更新至 `azd 1.27.1`（2026年7月），涵蓋主 README、所有章節 README、第一章開發容器課程（包含固定版本範例）、第四章自訂模板課程、第五章多代理課程及工作坊文件
- **🤖 第二章基準刷新**，由 `azd 1.23.12`（2026年3月）更新至 `azd 1.27.1`，涵蓋 `agents.md`、`ai-model-deployment.md`、`ai-workshop-lab.md` 與 `microsoft-foundry-integration.md`；驗證備註日期更新為 2026-07-13
- **🧩 AI代理擴展套件升級**，從 `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` 更新至目前的 `1.0.0-beta.5` 版本，於第二章 README 與 `agents.md`
- **🧪 工作坊驗證範例**（`azd version` 輸出）更新為 `1.27.1`

#### 相關 azd 發布說明（1.26.0 → 1.27.1）
- **1.26.0 (2026-06-24)：** 支援 Azure Functions 的 Flex Consumption 的 Go，`azd config sub-filter` 支援依租戶訂閱篩選，自含擴展套件包 (`azd x pack --bundle`)，以及 `azd tool install azure-skills`
- **1.27.0 (2026-06-30)：** 可直接於 `azure.yaml` 以模型形式定義 Azure AI Foundry 專案/代理（無需 Bicep/Terraform 初始化）、App Service 容器部署支援（`host: appservice` + `language: docker`）、`azd extension` 指令支持直接指定 `-s/--source`，以及 `azd tool uninstall`
- **1.27.1 (2026-07-09)：** `azd extension install` 新增 `--no-dependencies` 旗標，目錄/配額提示中預設排除已棄用模型，及多項錯誤修正

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

#### 初學者補足 #2：模板撰寫、開發容器、Pulumi、Azure DevOps、服務主體等
**此版本填補由 azd 覆蓋度分析揭示的剩餘中階知識缺口：如何撰寫並發佈自己的模板，可重現的開發容器/Codespaces 環境，Pulumi 基礎設施提供者，Azure DevOps CI/CD 演練，服務主體驗證，主機選擇指導（AKS/Spring Apps），`azd restore`/`azd package` 解析，hook 錯誤處理，以及團隊/共享環境實踐。**

#### 新增
- **🧱 新增第四章課程** `docs/chapter-04-infrastructure/custom-templates.md` — 撰寫你自己的 azd 模板：必備結構（`azure.yaml`、`infra/`、`src/`）、`metadata.template` 欄位，使用 `uniqueString()` 資源標記與 `azd-env-name` 標籤參數化基礎設施，本地使用 `azd init --template <local-path>` 測試，發佈至 GitHub，並提交至 Awesome AZD 畫廊
- **📦 新增第一章課程** `docs/chapter-01-foundation/dev-containers.md` — 使用開發容器與 GitHub Codespaces 建立可重現 azd 環境：最小 `.devcontainer/devcontainer.json` 配置，官方 `ghcr.io/azure/azure-dev/azd` 功能，特定語言特色，容器主機的 `docker-in-docker`，以及使用 `azd auth login --use-device-code` 遠端登入
- **🧩 Pulumi 與 azd** 新增於 `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`，Pulumi 資料夾結構，堆疊對應 azd 環境，必要輸出與標籤設定，以及相同的 `azd up` / `azd down` 工作流程
- **🎯 主機選擇指導** 新增於 `docs/chapter-04-infrastructure/provisioning.md` — 針對 `appservice`、`staticwebapp`、`function`、`containerapp`、`aks` 和 `springapp` 的初學者友好比較，並提供何時選擇 AKS 或 Azure Spring Apps 的建議
- **🛠️ Azure DevOps CI/CD 演練** 新增於 `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`，使用工作負載身份聯盟(OIDC)的服務連結，產生的 `azure-dev.yml`，及變數組設置
- **🔑 服務主體（範例4）** 新增於 `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`，使用用戶端密鑰非互動式登入與聯盟/OIDC 憑證的差異，何時使用，以及安全存放憑證的方法
- **🪝 Hook 錯誤處理** 子節新增於 `docs/chapter-04-infrastructure/deployment-guide.md` — 終止代碼與 `set -e`，`continueOnError`，利用 `azd hooks run` 進行隔離測試，跨作業系統的 shell 支援，以及 `--debug`
- **👥 團隊 / 共用環境** 區段新增於 `docs/chapter-03-configuration/configuration.md` — `.azure/` 目錄內容、gitignore 措施、針對個別開發者的環境，`azd env list`/`select`，在 CI/CD 中提供環境值
- **🧰 `azd restore` 與擴充解釋的 `azd package`** 新增於 `resources/cheat-sheet.md` — 還原依賴與建置可部署的產物而非立即部署

#### 變更
- **🧭 更新第四章課程表**，包含新增的「撰寫你自己的模板」課程（第三課）
- **🧭 更新第一章課程表**，加入新的「開發容器與 Codespaces」課程（第五課）；在 `bring-your-own-app.md` 與 `dev-containers.md` 之間設置導覽頁腳連結

### [v3.21.0] - 2026-06-16

#### 初學者補足：實作多代理課程、「自行攜入應用程式」、Terraform 與 CI/CD 全流程
**此版本填補了完全初學者指南中最大空缺，新增兩個完整實作課程（可部署的多代理示範與將 azd 加入現有應用），初學者友好的 Hooks 介紹，Terraform 與 azd 節，GitHub Actions 分步流程，預覽擴展套件說明，以及明確的部署驗證檢查表。**

#### 新增
- **🤝 新增第五章課程** `docs/chapter-05-multi-agent/multi-agent-basics.md` — 一個完全實作且可部署的雙代理示範（協調者 + 專家）使用真實模板（`contoso-creative-writer`），涵蓋何時使用多代理，`azd up` 工作流程，理解部署資源，跨代理追蹤，自定義與清理
- **📦 新增第一章課程** `docs/chapter-01-foundation/bring-your-own-app.md` — 如何用 `azd init`（「使用目前目錄的程式碼」）將 azd 加入現有專案，了解 `azure.yaml` 與 `infra/`，`azd infra generate`，主機檢測，以及使用 `azd up` 部署
- <strong>🌐 新增 Terraform 與 azd 節</strong>於 `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` 設定、`.tf` 目錄布局，必須的 `AZURE_*` 輸出與 `azd-env-name` 標籤，和同樣的 `azd up` / `azd down` 工作流程（補齊之前只提及 Terraform 支援但只展示 Bicep 的空缺）
- <strong>⚙️ 分步 GitHub Actions 教學</strong>於 `docs/chapter-08-production/production-ai-practices.md` — 從 GitHub 儲存庫到自動部署：`azd pipeline config`，OIDC 聯盟憑證（無需存儲秘密），生成的 `azure-dev.yml`，以及祕密與變數的使用指南
- **🪝 初學者“Hooks 入門？”** 於 `docs/chapter-04-infrastructure/deployment-guide.md` — 介紹什麼是 Hook，Hook 階段表，最小 Hook 範例，以及手動執行 Hook 的 `azd hooks run`
- **✅ “驗證你的部署” 清單** 新增於第一章 `docs/chapter-01-foundation/first-project.md` 的步驟 5 — 簡易測試、健康檢查端點，以及明確成功標準
- **🧩 預覽擴充套件解說** `azure.ai.skills` 與 `azure.ai.connections`（它們是什麼及何時使用）於 `docs/chapter-08-production/production-ai-practices.md`

#### 變更
- **🧭 第五章課程表修正**：`multi-agent-basics.md` 現為第一課（唯一完全實作課程），誠實標示第二課在第六章，零售場景為架構藍圖而非「一鍵模板」
- **🧭 第一章課程表更新**，包括新加入的「自行攜入你的應用程式」課程（第四課）
- **🔗 導覽頁腳更新**：`first-project.md` 現連接至 `bring-your-own-app.md`

#### 修正
- **🧱 補齊“先前宣稱但缺失”的 Terraform 缺口** — 課程之前提及了 Terraform 支援，但未展示其內容
- **🔀 修正誤導的第五章跨連結**，不再暗示已有完整多代理實作，而只是架構藍圖

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

#### AZD 1.25.6 刷新、完整代理生命週期指令集及 Aspire 品牌重塑

**此版本重新驗證課程與 `azd` `1.25.6`（2026 年 6 月）及 `azure.ai.agents` `0.1.40-preview` 擴充套件，將 AI 指導從「搭建代理」擴展至完整代理生命週期（測試 → 評估 → 優化 → 檢查 → 刪除），展示新的 `azure.ai.skills` 和 `azure.ai.connections` 預覽擴充套件，並註明「.NET Aspire」→「Aspire」產品重新命名。**

#### 新增
- **🔁 為初學者及 AI 工程師提供完整代理生命週期涵蓋**，遍及所有文件：
  - `docs/chapter-01-foundation/azd-basics.md` — 在擴充功能和 AI 命令部分新增生命週期表（搭建 → 測試 → 衡量 → 改善 → 檢查 → 清理）
  - `docs/chapter-08-production/production-ai-practices.md` — 新增「管理代理生命週期」章節，涵蓋 `azd ai agent invoke`、`endpoint show`、`eval generate`、`optimize`、`code download` 和 `delete --force`
  - `resources/cheat-sheet.md` — 擴充 AI 代理命令，包括 `invoke`、`endpoint show`、`eval generate`、`optimize`、`code download` 和 `delete --force`
- **🧩 記錄新的預覽擴充套件**：將 `azure.ai.skills`（可重用代理技能）及 `azure.ai.connections`（Foundry 連線）加入擴充套件表和速查表
- **⏱️ 響應時間指導** — `azd ai agent invoke` 範例現註明會印出總延遲和首次回應時間
- **📌 版本橫幅** 加入根目錄 README，引導學習者查詢 `azd version` 和 `azd upgrade`

#### 變更
- **✅ 驗證基準更新**，將所有章節 README 和工作坊文件中從 `azd 1.23.12`（2026 年 3 月）更新至 `azd 1.25.6`（2026 年 6 月）
- **🤖 第二章擴充註解** 從 `azure.ai.agents` `0.1.18-preview` 更新至 `0.1.40-preview`
- **🧪 工作坊驗證範例**（`azd version` 輸出）更新為 `1.25.6`
- **🧭 README「今日 azd 新增功能」** 更新，強調端到端代理生命週期、新 AI 擴充套件及近期便捷性修正 (`azd init` 可重覆執行狀態、`azd auth login` 清除過期令牌、`azd tool` 首次運行提示)
- **📖 第二章 agents.md（選項 4）** 現引導學習者使用部署後生命週期命令，而不僅止於 `azd up`

#### 修正
- **🏷️ 產品命名** — 新增 Aspire 重新命名註解（「.NET Aspire」現簡化為「Aspire」）；azd 對 Aspire 的支援無變
- **🔎 實時釋出驗證** 根據 Azure Developer CLI 釋出源確認：穩定版 CLI `1.25.6`（2026-06-12）與 `azure.ai.agents` `0.1.40-preview`（2026-06-15）

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

#### 初學者入門明確化、安裝驗證與最終 AZD 命令清理
**此版本延續 AZD 1.23 驗證工作，針對初學者進行文檔優化：明確 AZD 為首的驗證指導，新增本機安裝驗證腳本，核對主要命令與現場 AZD CLI，並移除除更新日誌外最後殘留的英文原始指令參考。**

#### 新增
- **🧪 初學者安裝驗證腳本**，包含 `validate-setup.ps1` 和 `validate-setup.sh`，方便學習者於開始第 1 章前確認所需工具
- **✅ 預先安裝驗證步驟**，根目錄 README 和第 1 章 README 中補充，確保缺失前置環境於 `azd up` 前被發現

#### 變更
- **🔐 初學者驗證指引**，現在一致視 `azd auth login` 為 AZD 工作流主要路徑，強調 `az login` 為選項，除非直接使用 Azure CLI 命令
- **📚 第 1 章入門流程** 重新指向學習者先驗證本機設置，才執行安裝、驗證和首次部署
- **🛠️ 驗證器訊息** 現清楚區分阻斷性需求與 AZD 專用初學路徑的選用 Azure CLI 警告
- **📖 配置、故障排除及範例文件** 明確區分必需 AZD 驗證與選用 Azure CLI 登入，以避免過往無上下文混合呈現

#### 修正
- **📋 剩餘英文原始指令參考** 更新為當前 AZD 格式，包含速查表裡的 `azd config show` 及原意為 Azure 入口網站概覽的 `azd monitor --overview`
- **🧭 第 1 章宣稱** 調整為較保守，以避免誇大承諾所有範本與 Azure 資源零錯誤或回滾行為
- **🔎 實時 CLI 驗證** 確認支援指令包括 `azd env get-values`、`azd template list`、`azd extension list --installed`、`azd copilot consent list`、`azd mcp start`、`azd provision --preview`、`azd monitor --logs` 及 `azd down --force --purge`

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

#### AZD 1.23.12 驗證、工作坊環境擴展及 AI 模型更新
**本版本執行針對 `azd` `1.23.12` 的文件驗證掃描，更新過期 AZD 命令範例，刷新 AI 模型指導並以當前預設替換，且將工作坊指南擴展至支援開發容器及本地碼倉，突破僅 GitHub Codespaces 的限制。**

#### 新增
- **✅ 核心章節及工作坊文件的驗證註記**，明確呈現測試用的 AZD 基準，便於新舊 CLI 版本的學習者參考
- **⏱️ 部署逾時指導**，針對長時間執行的 AI 應用部署，使用 `azd deploy --timeout 1800`
- **🔎 擴充套件檢視步驟**，於 AI 工作流程文件示範 `azd extension show azure.ai.agents`
- **🌐 更廣泛的工作坊環境指導**，支援 GitHub Codespaces、開發容器及使用 MkDocs 的本地碼倉

#### 變更
- **📚 章節導言 README** 一致標注以 `azd 1.23.12` 為基準驗證，涵蓋基礎、配置、基礎設施、多代理、預部署、故障排除及生產章節
- **🛠️ AZD 命令參考** 全面更新為當前版本用法：
  - `azd config list` → `azd config show`
  - `azd env show` → 視情況使用 `azd env list` 或 `azd env get-value(s)`
  - `azd auth whoami` → `azd auth status`
  - 於應用洞察概覽場合用 `azd monitor --overview`
- **🧪 簡化預覽部署範例**，使用當前支援指令，如 `azd provision --preview` 及 `azd provision --preview -e production`
- **🧭 工作坊流程更新**，允許學習者在 Codespaces、開發容器或本地碼倉完成實驗室，而非單限 Codespaces
- **🔐 驗證指導更新**，推薦 `azd auth login` 為 AZD 工作流登入方式，使用 Azure CLI 命令時 `az login` 為選項

#### 修正
- **🪟 Windows 安裝命令**，修正為安裝指南中目前使用的 `winget` 套件大小寫
- **🐧 Linux 安裝指導**，修正為避免使用不支援的發行版專用 `azd` 套件管理指令，而正確指向釋出資產
- **📦 AI 模型範例**，更新舊預設（如 `gpt-35-turbo`、`text-embedding-ada-002`）為現行範例（`gpt-4.1-mini`、`gpt-4.1`、`text-embedding-3-large`）
- **📋 部署與診斷代碼片段**，修正為目前環境與狀態指令，應用於日誌、腳本和故障排除步驟
- **⚙️ GitHub Actions 指導**，由 `Azure/setup-azd@v1.0.0` 更新至 `Azure/setup-azd@v2`
- **🤖 MCP/Copilot 同意指導**，由 `azd mcp consent` 更新為 `azd copilot consent list`

#### 改善
- **🧠 AI 章節指導**，更清楚說明預覽版 `azd ai` 行為、租戶特定登入、當前擴充使用和模型部署推薦
- **🧪 工作坊說明**，使用更貼近現實的版本範例和清晰的環境設定說明，提升實作實驗室體驗
- **📈 生產及故障排除文件**，更符合現行監控、備援模型及成本等級範例

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

#### AZD AI CLI 命令、內容驗證與範本擴展
**本版本新增 `azd ai`、`azd extension` 及 `azd mcp` 命令覆蓋，涵蓋所有 AI 相關章節，修正 agents.md 中的破損連結和過時代碼，更新速查表，並大幅翻新範例模板章節，加入經驗證說明及全新 Azure AI AZD 範本。**

#### 新增
- **🤖 AZD AI CLI 覆蓋**，涵蓋 7 個文件（先前僅在第 8 章）：
  - `docs/chapter-01-foundation/azd-basics.md` — 新增「擴充與 AI 命令」章節，介紹 `azd extension`、`azd ai agent init` 和 `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — 選項 4：`azd ai agent init` 及範本與清單比較表
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — 「Foundry 的 AZD 擴充」及「代理優先部署」子章節

  - `docs/chapter-05-multi-agent/README.md` — 快速開始現顯示模板與基於清單的部署路徑
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — 部署部分現加入 `azd ai agent init` 選項
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — 「AZD AI 擴充命令用於診斷」子部分
  - `resources/cheat-sheet.md` — 新增「AI 與擴充命令」部分，涵蓋 `azd extension`、`azd ai agent init`、`azd mcp` 及 `azd infra generate`
- **📦 新的 AZD AI 範例模板** 位於 `microsoft-foundry-integration.md`：
  - **azure-search-openai-demo-csharp** — 以 Blazor WebAssembly、Semantic Kernel 及語音聊天支援的 .NET RAG 聊天
  - **azure-search-openai-demo-java** — 使用 Langchain4J 的 Java RAG 聊天，支援 ACA/AKS 部署選項
  - **contoso-creative-writer** — 使用 Azure AI Agent Service、Bing Grounding 及 Prompty 的多代理創作應用
  - **serverless-chat-langchainjs** — 使用 Azure Functions + LangChain.js + Cosmos DB，並支援 Ollama 本地開發的無伺服器 RAG
  - **chat-with-your-data-solution-accelerator** — 企業級 RAG 加速器，含管理入口網站、Teams 整合及 PostgreSQL/Cosmos DB 選項
  - **azure-ai-travel-agents** — 支援 .NET、Python、Java 及 TypeScript 伺服器的多代理 MCP 編排參考應用
  - **azd-ai-starter** — 最簡介 Azure AI 基礎設施 Bicep 入門模板
  - **🔗 精彩 AZD AI 展示連結** — 指向 [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai)（超過 80 個模板）

#### 修正
- **🔗 agents.md 導航**：上一節/下一節連結現與第 2 章 README 課程順序匹配 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md 斷鏈**：`production-ai-practices.md` 修正為 `../chapter-08-production/production-ai-practices.md`（3處）
- **📦 agents.md 棄用程式碼**：以 `azure-monitor-opentelemetry` + OpenTelemetry SDK 替換 `opencensus`
- **🐛 agents.md 無效 API**：將 `max_tokens` 從 `create_agent()` 移至 `create_run()` 並改名為 `max_completion_tokens`
- **🔢 agents.md 代幣計數**：用 `tiktoken.encoding_for_model()` 替換粗略的 `len//4` 預估
- **azure-search-openai-demo**：修正服務名稱從「認知搜尋 + 應用服務」為「Azure AI 搜尋 + Azure Container Apps」（預設主機更改至 2024 年 10 月）
- **contoso-chat**：更新說明以參考 Azure AI Foundry + Prompty，與倉庫實際標題與技術棧一致

#### 移除
- **ai-document-processing**：移除無法使用的範本參考（倉庫未公開作為 AZD 範本）

#### 改良
- **📝 agents.md 練習**：練習 1 現示期望輸出與 `azd monitor` 步驟；練習 2 包含完整 `FunctionTool` 註冊程式碼；練習 3 以具體的 `prepdocs.py` 指令替換模糊指引
- **📚 agents.md 資源**：更新文件連結至最新 Azure AI Agent Service 文件及快速開始
- **📋 agents.md 下一步表格**：新增 AI 工作坊實驗室連結覆蓋整章內容

#### 更新文件
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
**本版本改良 README.md 章節導覽，使用增強表格格式。**

#### 變更
- <strong>課程地圖表格</strong>：增強為直接課程連結、預估時長與難易度評級
- <strong>資料夾清理</strong>：移除冗餘舊資料夾（deployment/、getting-started/、pre-deployment/、troubleshooting/）
- <strong>連結驗證</strong>：課程地圖表格中 21+ 內部連結皆已驗證

### [v3.16.0] - 2026-02-05

#### 產品名稱更新
**本版本將產品參考更新為目前 Microsoft 品牌名稱。**

#### 變更
- **Microsoft Foundry → Microsoft Foundry**：非翻譯文件中所有參考皆已更新
- **Azure AI Agent Service → Foundry Agents**：服務名稱更新以反映現有品牌

#### 更新檔案
- `README.md` - 主要課程首頁
- `changelog.md` - 版本歷史
- `course-outline.md` - 課程結構
- `docs/chapter-02-ai-development/agents.md` - AI 代理指南
- `examples/README.md` - 範例文件
- `workshop/README.md` - 工作坊首頁
- `workshop/docs/index.md` - 工作坊索引
- `workshop/docs/instructions/*.md` - 所有工作坊指令文件

---

### [v3.15.0] - 2026-02-05

#### 重大倉庫重構：以章節命名的資料夾
**本版本將文件重構為專屬章節資料夾，便於瀏覽。**

#### 資料夾重命名
舊資料夾已由章節編號資料夾取代：
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- 新增：`docs/chapter-05-multi-agent/`

#### 檔案移轉
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
| 全部預部署文件 | pre-deployment/ | chapter-06-pre-deployment/ |
| 全部故障排除文件 | troubleshooting/ | chapter-07-troubleshooting/ |

#### 新增
- **📚 章節 README 文件**：在每章節資料夾中建立 README.md，內容包含：
  - 學習目標與時長
  - 含描述的課程表
  - 快速開始命令
  - 章節間導覽

#### 變更
- **🔗 更新所有內部連結**：78+ 路徑跨所有文件更新
- **🗺️ 主要 README.md**：用新章節結構更新課程地圖
- **📝 examples/README.md**：更新章節資料夾的跨引用

#### 移除
- 舊資料夾結構 (getting-started/、microsoft-foundry/、deployment/、pre-deployment/、troubleshooting/、ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### 倉庫重構：章節導覽
**本版本新增章節導覽 README 文件（被 v3.15.0 取代）。**

---

### [v3.13.0] - 2026-02-05

#### 新增 AI 代理指南
**本版本新增一份使用 Azure Developer CLI 部署 AI 代理的完整指南。**

#### 新增
- **🤖 docs/microsoft-foundry/agents.md**：全面指南涵蓋：
  - 什麼是 AI 代理及其與聊天機器人的差異
  - 三個快速啟動代理範本（Foundry Agents、Prompty、RAG）
  - 代理架構模式（單代理、RAG、多代理）
  - 工具配置與客製化
  - 監控與指標追蹤
  - 成本考量與優化
  - 常見故障排除情境
  - 三個動手練習與成功標準

#### 內容架構
- <strong>介紹</strong>：適合初學者的代理概念
- <strong>快速開始</strong>：以 `azd init --template get-started-with-ai-agents` 部署代理
- <strong>架構模式</strong>：代理模式的視覺化圖解
- <strong>配置</strong>：工具設置與環境變數
- <strong>監控</strong>：整合 Application Insights
- <strong>練習</strong>：階梯式動手學習（每題 20-45 分鐘）

---

### [v3.12.0] - 2026-02-05

#### 開發容器環境更新
**本版本更新開發容器配置，採用現代工具與更佳預設值，優化 AZD 學習體驗。**

#### 變更
- **🐳 基本映像**：從 `python:3.12-bullseye` 更新為 `python:3.12-bookworm`（最新 Debian 穩定版）
- **📛 容器名稱**：由「Python 3」改名為「AZD for Beginners」以利識別

#### 新增
- **🔧 新開發容器功能**：
  - 啟用 Bicep 支援的 `azure-cli`
  - `node:20`（AZD 範本的 LTS 版本）
  - 用於模板管理的 `github-cli`
  - 用於容器應用部署的 `docker-in-docker`

- **🔌 端口轉發**：預配置常見開發端口：
  - 8000（MkDocs 預覽）
  - 3000（Web 應用）
  - 5000（Python Flask）
  - 8080（API）

- **🧩 新增 VS Code 擴充套件**：
  - `ms-python.vscode-pylance` - 強化 Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - 支援 Azure Functions
  - `ms-azuretools.vscode-docker` - Docker 支援
  - `ms-azuretools.vscode-bicep` - Bicep 語言支援
  - `ms-azure-devtools.azure-resource-groups` - Azure 資源管理
  - `yzhang.markdown-all-in-one` - Markdown 編輯
  - `DavidAnson.vscode-markdownlint` - Markdown 語法檢查
  - `bierner.markdown-mermaid` - Mermaid 圖表支援
  - `redhat.vscode-yaml` - YAML 支援（用於 azure.yaml）
  - `eamodio.gitlens` - Git 可視化
  - `mhutchie.git-graph` - Git 歷史記錄

- **⚙️ VS Code 設定**：新增 Python 直譯器的預設設定、儲存時格式化及空白字元修剪

- **📦 更新 requirements-dev.txt**：
  - 新增 MkDocs 壓縮插件
  - 新增 pre-commit 用於程式碼品質
  - 新增 Azure SDK 套件（azure-identity、azure-mgmt-resource）

#### 修正
- <strong>建立後命令</strong>：現於容器啟動時驗證 AZD 及 Azure CLI 安裝

---

### [v3.11.0] - 2026-02-05

#### 初學者友好 README 大改
**本版本大幅改進 README.md，使其對初學者更易懂，並新增 AI 開發者必備資源。**

#### 新增
- **🆚 Azure CLI 與 AZD 比較**：清楚說明何時使用各工具並附實務範例
- **🌟 精彩 AZD 連結**：直接連結到社群模板館及貢獻資源：
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ 即可部署模板
  - [提交模板](https://github.com/Azure/awesome-azd/issues) - 社群貢獻
- **🎯 快速開始指南**：簡化為三步驟入門（安裝 → 登入 → 部署）
- **📊 經驗導向導覽表**：依開發者經驗給予清晰起點指引

#### 變更
- **README 結構**：重新組織為逐步揭露關鍵資訊優先
- <strong>介紹部分</strong>：重寫以解釋「`azd up` 的魔法」給完全初學者
- <strong>移除重複內容</strong>：刪除重複故障排除段落
- <strong>故障排除指令</strong>：修正 `azd logs` 引用，改用合法的 `azd monitor --logs`

#### 修正

- **🔐 認證指令**：新增 `azd auth login` 和 `azd auth logout` 於 cheat-sheet.md
- <strong>無效指令引用</strong>：移除 README 疑難排解部分剩餘的 `azd logs`

#### 備註
- <strong>範圍</strong>：變更應用於主要 README.md 與 resources/cheat-sheet.md
- <strong>目標群體</strong>：專為 AZD 新手開發者所做的改進

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI 指令精確度更新
**本版本修正文檔中不存在的 AZD 指令，確保所有程式碼範例均使用有效的 Azure Developer CLI 語法。**

#### 修正
- **🔧 移除不存在的 AZD 指令**：全面審核與修正無效指令：
  - `azd logs`（不存在）→ 取代為 `azd monitor --logs` 或 Azure CLI 替代方案
  - `azd service` 子指令（不存在）→ 取代為 `azd show` 與 Azure CLI
  - `azd infra import/export/validate`（不存在）→ 移除或用有效替代方案取代
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` 旗標（不存在）→ 移除
  - `azd provision --what-if/--rollback` 旗標（不存在）→ 更新為使用 `--preview`
  - `azd config validate`（不存在）→ 取代為 `azd config list`
  - `azd info`, `azd history`, `azd metrics`（不存在）→ 移除

- **📚 進行指令修正的檔案**：
  - `resources/cheat-sheet.md`：指令參考大幅重整
  - `docs/deployment/deployment-guide.md`：修正回滾與部署策略
  - `docs/troubleshooting/debugging.md`：修正日誌分析章節
  - `docs/troubleshooting/common-issues.md`：更新疑難排解指令
  - `docs/troubleshooting/ai-troubleshooting.md`：修正 AZD 除錯章節
  - `docs/getting-started/azd-basics.md`：修正監控指令
  - `docs/getting-started/first-project.md`：更新監控與除錯範例
  - `docs/getting-started/installation.md`：修正說明與版本範例
  - `docs/pre-deployment/application-insights.md`：修正日誌檢視指令
  - `docs/pre-deployment/coordination-patterns.md`：修正代理除錯指令

- **📝 版本參考更新**：
  - `docs/getting-started/installation.md`：將硬編碼的 `1.5.0` 版本改為通用 `1.x.x` 並附上 releases 連結

#### 變更
- <strong>回滾策略</strong>：更新文檔為使用 Git 基礎的回滾（AZD 本身無原生回滾功能）
- <strong>日誌檢視</strong>：將 `azd logs` 引用改為 `azd monitor --logs`、`azd monitor --live` 及 Azure CLI 指令
- <strong>效能章節</strong>：移除不存在的平行/增量部署旗標，提供有效替代方案

#### 技術細節
- **有效的 AZD 指令**：`init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **有效的 azd monitor 旗標**：`--live`, `--logs`, `--overview`
- <strong>移除功能</strong>：`azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### 備註
- <strong>驗證</strong>：指令已依 Azure Developer CLI v1.23.x 驗證

---

### [v3.9.0] - 2026-02-05

#### 互動工作坊完成與文件品質更新
**本版本完成互動工作坊模組，修正所有損壞的文件連結，並提升 Microsoft AZD AI 開發者的整體內容品質。**

#### 新增
- **📝 CONTRIBUTING.md**：新增貢獻指南文件，包括：
  - 報告問題及提案變更的明確指示
  - 新內容的文件標準
  - 程式碼範例指導與提交訊息慣例
  - 社群參與資訊

#### 完成
- **🎯 工作坊模組 7（結束）**：完整完成結尾模組，包含：
  - 工作坊成果的全面總結
  - 掌握核心概念章節涵蓋 AZD、模板及 Microsoft Foundry
  - 持續學習建議
  - 挑戰練習附難度評級
  - 社群回饋與支援連結

- **📚 工作坊模組 3（拆解）**：更新學習目標，包括：
  - GitHub Copilot 搭配 MCP 伺服器啟動指導
  - AZD 範本資料夾結構理解
  - 基礎架構即程式碼（Bicep）組織模式
  - 實作練習說明

- **🔧 工作坊模組 6（拆除）**：完成如下內容：
  - 資源清理與成本管理目標
  - 安全基礎設施解除指令 `azd down` 用法
  - 軟刪除認知服務恢復指導
  - 額外探索 GitHub Copilot 與 Azure 入口網站

#### 修正
- **🔗 損壞連結修正**：解決超過 15 個內部文件連結錯誤：
  - `docs/ai-foundry/ai-model-deployment.md`：修正 microsoft-foundry-integration.md 路徑
  - `docs/troubleshooting/ai-troubleshooting.md`：校正 ai-model-deployment.md 與 production-ai-practices.md 路徑
  - `docs/getting-started/first-project.md`：用 deployment-guide.md 取代不存在的 cicd-integration.md
  - `examples/retail-scenario.md`：修正 FAQ 與疑難排解指南路徑
  - `examples/container-app/microservices/README.md`：校正課程首頁與部署指南路徑
  - `resources/faq.md` 與 `resources/glossary.md`：更新 AI 章節參考
  - `course-outline.md`：修正講師指南與 AI 工作坊實驗室參考

- **📅 工作坊狀態橫幅**：從「施工中」更新為活躍狀態，日期為 2026 年 2 月

- **🔗 工作坊導覽**：修正 README.md 中指向不存在 lab-1-azd-basics 資料夾的壞連結

#### 變更
- <strong>工作坊簡報</strong>：移除「施工中」警告，工作坊現已完成且準備好使用
- <strong>導覽一致性</strong>：確保所有工作坊模組有適當的跨模組導覽
- <strong>學習路徑參考</strong>：更新章節交叉引用以使用正確的 microsoft-foundry 路徑

#### 驗證
- ✅ 所有英文 Markdown 檔案內部連結有效
- ✅ 工作坊模組 0-7 完整且含學習目標
- ✅ 章節與模組導覽功能正常
- ✅ 內容適合使用 Microsoft AZD 的 AI 開發者
- ✅ 全文保持初學者友善語言與結構
- ✅ CONTRIBUTING.md 提供明確的社群貢獻指引

#### 技術實施
- <strong>連結驗證</strong>：使用自動化 PowerShell 腳本驗證所有 .md 內部連結
- <strong>內容稽核</strong>：人工審查工作坊完整性與適合初學者程度
- <strong>導覽系統</strong>：應用一致的章節與模組導覽模式

#### 備註
- <strong>範圍</strong>：變更僅限英文文件
- <strong>翻譯</strong>：本版本未更新翻譯資料夾（稍後由自動化翻譯同步）
- <strong>工作坊時長</strong>：完整工作坊現在提供 3-4 小時的實操學習

---

### [v3.8.0] - 2025-11-19

#### 進階文檔：監控、安全以及多代理協調模式
**本版本新增全面的 A 級課程，涵蓋 Application Insights 整合、認證模式及生產部署的多代理協調。**

#### 新增
- **📊 Application Insights 整合課程**：於 `docs/pre-deployment/application-insights.md`：
  - 以 AZD 為焦點的部署與自動配置
  - 完整的 Bicep 模板涵蓋 Application Insights 與 Log Analytics
  - 可運作的 Python 應用含自訂遙測（超過 1,200 行）
  - AI/LLM 監控模式（Microsoft Foundry 模型令牌與成本追蹤）
  - 6 個 Mermaid 圖表（架構、分散式追蹤、遙測流程）
  - 3 個實作練習（警報、儀表板、AI 監控）
  - Kusto 查詢範例與成本優化策略
  - 即時度量串流與即時除錯
  - 40-50 分鐘學習時間，附生產就緒模式

- **🔐 認證與安全模式課程**：於 `docs/getting-started/authsecurity.md`：
  - 3 種認證模式（連線字串、Key Vault、管理身份）
  - 完整 Bicep 基礎架構模板支援安全部署
  - Node.js 應用程式代碼與 Azure SDK 整合
  - 3 個完整練習（啟用管理身份、使用者指派身份、Key Vault 旋轉）
  - 安全最佳實踐與 RBAC 設定
  - 疑難排解指引與成本分析
  - 生產就緒免密碼認證模式

- **🤖 多代理協調模式課程**：於 `docs/pre-deployment/coordination-patterns.md`：
  - 5 種協調模式（序列、平行、階層、事件驅動、共識）
  - 完整調度服務實作（Python/Flask，超過 1,500 行）
  - 3 種專精代理實作（研究、撰寫、編輯）
  - 使用 Service Bus 進行訊息佇列
  - 使用 Cosmos DB 進行分散式系統狀態管理
  - 6 個 Mermaid 圖表展示代理互動
  - 3 個進階練習（逾時處理、重試邏輯、斷路器）
  - 成本分解（每月 $240-565 美元）含優化策略
  - Application Insights 監控整合

#### 強化
- <strong>部署前章節</strong>：現在包含完整監控與協調模式
- <strong>入門章節</strong>：增強專業認證模式
- <strong>生產準備</strong>：涵蓋安全至可觀察性全面範圍
- <strong>課程大綱</strong>：更新參考第 3 及第 6 章新課程

#### 變更
- <strong>學習進度</strong>：更好整合安全與監控於課程中
- <strong>文件品質</strong>：新課程保持一致的 A 級標準（95-97%）
- <strong>生產模式</strong>：企業部署端對端完整涵蓋

#### 改善
- <strong>開發者體驗</strong>：開發至生產監控的清晰路徑
- <strong>安全標準</strong>：專業認證與機密管理模式
- <strong>可觀察性</strong>：AZD 完整 Application Insights 整合
- **AI 工作負載**：Microsoft Foundry 模型及多代理系統專用監控

#### 驗證
- ✅ 所有課程均含完整運作程式碼（非僅程式碼片段）
- ✅ Mermaid 圖表支援視覺學習（3 課程共 19 個）
- ✅ 實作練習附驗證步驟（共 9 項）
- ✅ 生產就緒 Bicep 模板能透過 `azd up` 部署
- ✅ 成本分析與最佳化策略
- ✅ 疑難排解指南與最佳實踐
- ✅ 知識檢查點搭配驗證指令

#### 文件評分結果
- **docs/pre-deployment/application-insights.md**：- 全面監控指南
- **docs/getting-started/authsecurity.md**：- 專業安全模式
- **docs/pre-deployment/coordination-patterns.md**：- 進階多代理架構
- <strong>整體新內容</strong>：- 一致高品質標準

#### 技術實施
- **Application Insights**：Log Analytics + 自訂遙測 + 分散式追蹤
- <strong>認證</strong>：管理身份 + Key Vault + RBAC 模式
- <strong>多代理</strong>：Service Bus + Cosmos DB + Container Apps + 編排
- <strong>監控</strong>：即時度量 + Kusto 查詢 + 警報 + 儀表板
- <strong>成本管理</strong>：抽樣策略、保留政策、預算控制

### [v3.7.0] - 2025-11-19

#### 文件品質提升與新增 Microsoft Foundry Models 範例
**本版本提升整倉文件品質，並新增 Microsoft Foundry Models 部署範例，附帶 gpt-4.1 聊天介面。**

#### 新增
- **🤖 Microsoft Foundry Models 聊天範例**：完整的 gpt-4.1 部署與有效實作於 `examples/azure-openai-chat/`：
  - 完整的 Microsoft Foundry Models 基礎架構（gpt-4.1 模型部署）
  - 帶會話歷史的 Python 指令列聊天介面
  - Key Vault 整合以安全存儲 API 密鑰
  - 令牌使用追蹤與成本估算
  - 頻率限制與錯誤處理
  - 詳盡的 README，部署指南約 35-45 分鐘
  - 11 個生產就緒檔案（Bicep 模板、Python 應用、配置）
- **📚 文件練習**：新增配置指南的實作練習：
  - 練習 1：多環境配置（15 分鐘）
  - 練習 2：機密管理練習（10 分鐘）
  - 明確的成功標準與驗證步驟
- **✅ 部署驗證**：在部署指南新增驗證章節：
  - 健康檢查程序
  - 成功標準檢核表
  - 所有部署指令的預期輸出
  - 疑難排解速查表

#### 強化
- **examples/README.md**：更新至 A 級品質（93%）：
  - 向所有相關章節添加 azure-openai-chat
  - 本地範例數量由 3 增至 4
  - 新增於 AI 應用範例表
  - 整合入中階用戶快速啟動指引
  - 新增於 Microsoft Foundry 模板章節
  - 更新比較矩陣和技術搜尋章節
- <strong>文件品質</strong>：將 docs 目錄品質從 B+ （87%）提升至 A- （92%）

  - 新增了關鍵指令示例的預期輸出
  - 包括配置變更的驗證步驟
  - 增強了實作練習的動手學習

#### 變更
- <strong>學習進度</strong>：為中階學習者更好地整合 AI 範例
- <strong>文件結構</strong>：更具行動力的練習並帶有明確成果
- <strong>驗證流程</strong>：在關鍵工作流程中新增明確成功標準

#### 改進
- <strong>開發者體驗</strong>：Microsoft Foundry Models 部署時間縮短至 35-45 分鐘（相比複雜方案 60-90 分鐘）
- <strong>成本透明度</strong>：Microsoft Foundry Models 範例明確成本估算（月費 50-200 美元）
- <strong>學習路徑</strong>：AI 開發者有清晰的入口點 azure-openai-chat
- <strong>文件標準</strong>：預期輸出和驗證步驟更加一致

#### 驗證
- ✅ Microsoft Foundry Models 範例使用`azd up`可完全運作
- ✅ 所有 11 個實作檔案語法正確
- ✅ README 指令與實際部署經驗相符
- ✅ 文件連結在 8 個以上位置更新
- ✅ 範例索引正確反映 4 個本地範例
- ✅ 表格中無重複外部連結
- ✅ 所有導航引用正確

#### 技術實作
- **Microsoft Foundry Models 架構**：gpt-4.1 + Key Vault + Container Apps 模式
- <strong>安全性</strong>：準備 Managed Identity，秘密存放於 Key Vault
- <strong>監控</strong>：整合 Application Insights
- <strong>成本管理</strong>：令牌追蹤與使用優化
- <strong>部署</strong>：使用單一 `azd up` 指令完成設定

### [v3.6.0] - 2025-11-19

#### 重大更新：容器應用部署範例
**本版本引入使用 Azure Developer CLI (AZD) 的全面生產就緒容器應用部署範例，配備完整文件並整合學習路徑。**

#### 新增
- **🚀 容器應用範例**：新增本地範例於 `examples/container-app/`：
  - [主導指南](examples/container-app/README.md)：容器化部署完整概述、快速啟動、生產與進階範式
  - [簡易 Flask API](../../examples/container-app/simple-flask-api)：適合初學者的 REST API 含縮放至零、健康檢查、監控與疑難排解
  - [微服務架構](../../examples/container-app/microservices)：生產就緒多服務部署（API Gateway、產品、訂單、用戶、通知）、非同步訊息、Service Bus、Cosmos DB、Azure SQL、分散式追蹤、藍綠部署／金絲雀發布
- <strong>最佳實踐</strong>：容器工作負載的安全性、監控、成本優化與 CI/CD 指引
- <strong>程式碼範例</strong>：完整`azure.yaml`、Bicep 範本、多語言服務實作（Python、Node.js、C#、Go）
- <strong>測試與疑難排解</strong>：端對端測試場景、監控指令、故障排解指導

#### 變更
- **README.md**：更新，以「本地範例 - 容器應用」介紹並鏈結新容器應用範例
- **examples/README.md**：更新以強調容器應用範例、添加比較矩陣條目、更新技術／架構參考
- <strong>課程大綱及學習指南</strong>：更新相關章節引用新容器應用範例與部署模式

#### 驗證
- ✅ 所有新範例均可用 `azd up` 部署並遵循最佳實踐
- ✅ 文件交叉連結與導航已更新
- ✅ 範例涵蓋初學至進階場景，包括生產微服務

#### 備註
- <strong>範圍</strong>：僅限英文文件和範例
- <strong>後續步驟</strong>：未來版本將擴展更多進階容器範式與 CI/CD 自動化

### [v3.5.0] - 2025-11-19

#### 產品改名：Microsoft Foundry
**本版本全面執行產品名稱從「Microsoft Foundry」改為「Microsoft Foundry」，涵蓋所有英文文件，反映官方更名。**

#### 變更
- **🔄 產品名稱更新**：完整更名從「Microsoft Foundry」至「Microsoft Foundry」
  - 更新所有位於 `docs/` 文件夾的英文文件內引用
  - 資料夾重命名：`docs/ai-foundry/` → `docs/microsoft-foundry/`
  - 檔案重命名：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 共 7 個文件中 23 處內容引用更新

- **📁 資料夾結構變更**：
  - `docs/ai-foundry/` 改名為 `docs/microsoft-foundry/`
  - 所有跨引用更新以反映新資料夾結構
  - 所有文件導航連結已驗證

- **📄 文件重命名**：
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 所有內部連結更新為新檔名

#### 更新文件
- <strong>章節文件</strong>（7 個文件）：
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 處導航連結更新
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 處產品名稱更新
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - 先前版本已使用 Microsoft Foundry
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 處引用更新（概覽、社群反饋、文件）
  - `docs/getting-started/azd-basics.md` - 4 處交叉參考連結更新
  - `docs/getting-started/first-project.md` - 2 處章節導航連結更新
  - `docs/getting-started/installation.md` - 2 處後續章節連結更新
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 處引用更新（導航、Discord 社群）
  - `docs/troubleshooting/common-issues.md` - 1 處導航連結更新
  - `docs/troubleshooting/debugging.md` - 1 處導航連結更新

- <strong>課程結構文件</strong>（2 個文件）：
  - `README.md` - 17 處引用更新（課程總覽、章節標題、範本章節、社群見解）
  - `course-outline.md` - 14 處引用更新（總覽、學習目標、章節資源）

#### 驗證
- ✅ 英文文件中已無任何 "ai-foundry" 資料夾路徑引用
- ✅ 英文文件中已無任何舊 Microsoft Foundry 產品名稱引用
- ✅ 所有導航連結於新資料夾結構下均有效
- ✅ 檔案與資料夾重命名已成功完成
- ✅ 章節間的交叉引用已驗證

#### 備註
- <strong>範圍</strong>：變更只應用於 `docs/` 文件夾中的英文文件
- <strong>翻譯</strong>：本版本未更新翻譯資料夾 (`translations/`)
- <strong>工作坊</strong>：本版本未更新工作坊資料 (`workshop/`)
- <strong>範例</strong>：範例檔案可能仍使用舊名稱（未來版本將修正）
- <strong>外部連結</strong>：外部 URL 和 GitHub 倉庫引用保持不變

#### 貢獻者遷移指南
如果您有本地分支或文件引用舊結構：
1. 更新資料夾引用：`docs/ai-foundry/` → `docs/microsoft-foundry/`
2. 更新檔案引用：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. 替換產品名稱：「Microsoft Foundry」 → 「Microsoft Foundry」
4. 驗證所有內部文件連結正常運作

---

### [v3.4.0] - 2025-10-24

#### 基礎架構預覽與驗證增強
**本版本全面支援新的 Azure Developer CLI 預覽功能，並提升工作坊用戶體驗。**

#### 新增
- **🧪 azd provision --preview 功能文件**：全面涵蓋新基礎架構預覽功能
  - 指令參考與用法範例收錄於速查表
  - 詳盡整合於佈署指南，附使用案例與效益說明
  - 採用預檢查機制，提升部署安全驗證
  - 入門指導更新，優先採用安全部署流程
- **🚧 工作坊狀態橫幅**：專業 HTML 橫幅標示工作坊開發狀態
  - 漸層設計搭配施工指示，清楚告知使用者
  - 附帶最後更新時間戳，提升透明度
  - 手機響應式設計，適用所有裝置

#### 強化
- <strong>基礎架構安全</strong>：全文件中整合預覽功能
- <strong>部署前驗證</strong>：自動化腳本包含基礎架構預覽測試
- <strong>開發者工作流程</strong>：更新指令序列，將預覽納為最佳實踐
- <strong>工作坊體驗</strong>：對用戶明確傳達內容開發狀態

#### 變更
- <strong>部署最佳實踐</strong>：建議採用先預覽後部署流程
- <strong>文件流程</strong>：基礎架構驗證提前融入學習過程
- <strong>工作坊表現</strong>：專業狀態通告並清晰開發時程

#### 改良
- <strong>安全優先策略</strong>：基礎架構變更部署前即可驗證
- <strong>團隊協作</strong>：預覽結果可分享給團隊審核與批准
- <strong>成本意識</strong>：佈署前能更好了解資源成本
- <strong>風險緩解</strong>：透過提前驗證降低部署失敗可能

#### 技術實作
- <strong>多文件整合</strong>：預覽功能於 4 個重要文件中記錄
- <strong>指令模式</strong>：全文件保持統一語法與範例
- <strong>最佳實踐整合</strong>：預覽納入驗證流程和腳本
- <strong>視覺標示</strong>：清晰標示新增功能以便發現

#### 工作坊基礎架構
- <strong>狀態通訊</strong>：專業 HTML 横幅搭配漸層風格
- <strong>用戶體驗</strong>：清楚的開發狀態防止混淆
- <strong>專業呈現</strong>：維持倉庫可信度並設立期望
- <strong>時程透明</strong>：2025 年 10 月最後更新時間戳明確負責任

### [v3.3.0] - 2025-09-24

#### 增強工作坊材料及互動學習體驗
**本版本包含全面工作坊材料，配合瀏覽器互動導覽和架構化學習路徑。**

#### 新增
- **🎥 互動工作坊導覽**：基於瀏覽器的工作坊體驗，具 MkDocs 預覽功能
- **📝 結構化工作坊指示**：7 步驟引導學習路徑，從探索到自訂
  - 0-介紹：工作坊總覽與設定
  - 1-選擇 AI 範本：範本發掘與選擇過程
  - 2-驗證 AI 範本：部署與驗證程序
  - 3-拆解 AI 範本：理解範本架構
  - 4-配置 AI 範本：設定與自訂
  - 5-自訂 AI 範本：進階修改與迭代
  - 6-拆除基礎架構：清理與資源管理
  - 7-總結：總結與後續步驟
- **🛠️ 工作坊工具**：MkDocs 配置與 Material 主題，提升學習體驗
- **🎯 動手學習路徑**：3 步驟方法論（探索 → 部署 → 自訂）
- **📱 GitHub Codespaces 整合**：無縫開發環境設置

#### 強化
- **AI 工作坊實驗室**：擴展至 2-3 小時的結構化學習體驗
- <strong>工作坊文件</strong>：專業呈現，配以導航和視覺輔助
- <strong>學習進度</strong>：清晰的步驟指導，從範本選擇到生產部署
- <strong>開發者體驗</strong>：整合工具以簡化開發流程

#### 改良
- <strong>無障礙性</strong>：瀏覽器介面含搜索、複製功能及主題切換
- <strong>自我節奏學習</strong>：彈性工作坊結構，適應不同學習速度
- <strong>實務應用</strong>：真實世界 AI 範本部署場景
- <strong>社群整合</strong>：Discord 整合提供工作坊支持與協作

#### 工作坊功能
- <strong>內建搜尋</strong>：快速關鍵字及課程發現
- <strong>複製程式碼區塊</strong>：所有程式碼範例具懸停複製功能
- <strong>主題切換</strong>：支援暗／亮模式，符合不同偏好
- <strong>視覺資產</strong>：截圖與圖解提升理解
- <strong>幫助整合</strong>：直接訪問 Discord 以獲得社群支持

### [v3.2.0] - 2025-09-17

#### 重大導航重組及章節式學習系統
**本版本引入完整章節式學習架構，搭配加強版整倉導航。**

#### 新增
- **📚 章節式學習系統**：整體課程重構為 8 個漸進學習章節
  - 第一章：基礎與快速入門 (⭐ - 30-45 分鐘)
  - 第二章：AI 優先開發 (⭐⭐ - 1-2 小時)
  - 第三章：配置與認證 (⭐⭐ - 45-60 分鐘)
  - 第四章：基礎架構即程式碼與部署 (⭐⭐⭐ - 1-1.5 小時)
  - 第五章：多代理 AI 解決方案 (⭐⭐⭐⭐ - 2-3 小時)
  - 第六章：部署前驗證與規劃 (⭐⭐ - 1 小時)
  - 第七章：疑難排解與除錯 (⭐⭐ - 1-1.5 小時)
  - 第八章：生產與企業模式 (⭐⭐⭐⭐ - 2-3 小時)
- **📚 全面導航系統**：整倉文件採用一致導航標頭與頁腳
- **🎯 進度追蹤**：課程完成清單及學習驗證系統
- **🗺️ 學習路徑導引**：為不同經驗層級與目標設定清晰入口點
- **🔗 交叉參考導航**：清楚鏈結相關章節與先決條件

#### 強化
- **README 結構**：轉變為結構化學習平台，搭配章節制組織
- <strong>文件導航</strong>：每頁新增章節背景與進度導引
- <strong>範本組織</strong>：範例與範本映射至適當學習章節

- <strong>資源整合</strong>：連接至相關章節的快速參考表、常見問題和學習指南
- <strong>工作坊整合</strong>：對應多章節學習目標的實作實驗室

#### 變更
- <strong>學習進程</strong>：從線性文件改為彈性章節式學習
- <strong>設定放置位置</strong>：為了更佳學習流程，將設定指南移至第三章
- **AI 內容整合**：在整個學習歷程中更好地整合 AI 特定內容
- <strong>生產內容</strong>：為企業學習者整合進階模式於第八章

#### 改善
- <strong>使用者體驗</strong>：清晰的導覽麵包屑與章節進度指示
- <strong>可存取性</strong>：一致的導覽模式，方便課程巡覽
- <strong>專業呈現</strong>：大學風格課程結構，適合學術與企業培訓
- <strong>學習效率</strong>：透過改善組織降低尋找相關內容的時間

#### 技術實作
- <strong>導航標題</strong>：在 40 多份文件中標準化章節導航
- <strong>頁尾導航</strong>：一致的進度指引與章節完成指示
- <strong>交叉連結</strong>：完善的內部連結系統連接相關概念
- <strong>章節對應</strong>：模板與範例清楚關聯學習目標

#### 學習指南強化
- **📚 全面學習目標**：重構學習指南以配合 8 章節系統
- **🎯 章節式評估**：每章包含特定學習目標和實務練習
- **📋 進度追蹤**：每週學習計劃，具可衡量結果與完成清單
- **❓ 評估問題**：每章的知識驗證問題與專業成果
- **🛠️ 實務練習**：含真實部署場景與故障排除的動手活動
- **📊 技能進展**：從基礎概念到企業模式的明確晉升，強調職涯發展
- **🎓 認證架構**：專業發展成果與社群認可系統
- **⏱️ 時程管理**：結構化的 10 週學習計劃與里程碑驗證

### [v3.1.0] - 2025-09-17

#### 強化多代理 AI 解決方案
**此版本透過更清晰的代理命名和加強的文件提高了多代理零售解決方案。**

#### 變更
- <strong>多代理術語</strong>：將「Cora agent」替換成「Customer agent」於零售多代理解決方案中以更清楚
- <strong>代理架構</strong>：更新所有文件、ARM 模板與程式碼範例，統一使用「Customer agent」命名
- <strong>設定範例</strong>：現代化代理設定模式，更新命名規範
- <strong>文件一致性</strong>：確保所有引用採用專業且描述性的代理名稱

#### 強化
- **ARM 模板包**：更新 retail-multiagent-arm-template 中的 Customer agent 參考
- <strong>架構圖</strong>：更新 Mermaid 圖表以反映代理更新命名
- <strong>程式碼範例</strong>：Python 類別與實作範例現在使用 CustomerAgent 命名
- <strong>環境變數</strong>：更新所有部署腳本使用 CUSTOMER_AGENT_NAME 慣例

#### 改進
- <strong>開發者體驗</strong>：文件中明確代理角色與責任
- <strong>生產準備度</strong>：更符合企業命名慣例
- <strong>學習材料</strong>：為教育用途提供更直觀的代理命名
- <strong>模板可用性</strong>：簡化對代理功能與部署模式的理解

#### 技術細節
- 更新 Mermaid 架構圖以 CustomerAgent 參考
- Python 範例中將 CoraAgent 類名替換為 CustomerAgent
- 調整 ARM 模板 JSON 配置使用「customer」代理類型
- 將環境變數從 CORA_AGENT_* 更新為 CUSTOMER_AGENT_* 模式
- 更新所有部署指令與容器配置

### [v3.0.0] - 2025-09-12

#### 重大變更 - 以 AI 開發者為焦點並整合 Microsoft Foundry
**此版本將資料庫轉型為整合 Microsoft Foundry 的全面 AI 專注學習資源。**

#### 新增
- **🤖 AI 優先學習路徑**：徹底重組，優先支援 AI 開發與工程師
- **Microsoft Foundry 整合指南**：完整文件說明 AZD 與 Microsoft Foundry 服務連接
- **AI 模型部署模式**：詳述模型選擇、設定及生產部署策略
- **AI 工作坊實驗室**：2-3 小時實作工作坊，用於將 AI 應用轉成 AZD 可部署解決方案
- **生產 AI 最佳實務**：企業級擴展、監控及安全模式
- **AI 特定疑難排解指南**：涵蓋 Microsoft Foundry 模型、認知服務及 AI 部署問題的全面排解
- **AI 模板庫**：精選 Microsoft Foundry 模板，附複雜度評級
- <strong>工作坊教材</strong>：完整工作坊架構含實作實驗室與參考材料

#### 強化
- **README 結構**：以 AI 開發者為中心，並包含 45% 來自 Microsoft Foundry Discord 的社群興趣數據
- <strong>學習路徑</strong>：為學生及 DevOps 工程師開設傳統路徑的同時，設置專屬 AI 開發者路程
- <strong>模板推薦</strong>：精選 AI 模板，包括 azure-search-openai-demo、contoso-chat 及 openai-chat-app-quickstart
- <strong>社群整合</strong>：加強 Discord 社群支援，設立 AI 專屬頻道與討論

#### 安全與生產焦點
- <strong>管理身分模式</strong>：AI 特定的身份驗證與安全設定
- <strong>成本優化</strong>：AI 工作負載的代幣使用追蹤與預算控制
- <strong>多區域部署</strong>：全球 AI 應用部署策略
- <strong>效能監控</strong>：AI 專用指標與 Application Insights 整合

#### 文件品質
- <strong>線性課程結構</strong>：從新手到進階 AI 部署模式的邏輯進展
- <strong>驗證網址</strong>：所有外部資料庫連結都已驗證且可訪問
- <strong>完整參考</strong>：所有內部文件連結均已驗證並可使用
- <strong>生產就緒</strong>：企業部署模式並附真實案例

### [v2.0.0] - 2025-09-09

#### 重大變更 - 庫結構調整與專業化提升
**此版本對庫結構與內容呈現進行重大重構。**

#### 新增
- <strong>結構化學習框架</strong>：所有文件頁面均包含介紹、學習目標與學習成果區段
- <strong>導航系統</strong>：增設所有文件中的上一課/下一課連結以引導學習進度
- <strong>學習指南</strong>：全面的 study-guide.md，含學習目標、練習與評估資料
- <strong>專業呈現</strong>：移除所有表情符號圖示以增強無障礙性與專業形象
- <strong>內容結構強化</strong>：改善學習材料的組織與流程

#### 變更
- <strong>文件格式</strong>：標準化所有文件採用一致的學習導向結構
- <strong>導航流程</strong>：實施學習材料的邏輯進展
- <strong>內容呈現</strong>：去除裝飾元素，採用清晰專業格式
- <strong>連結結構</strong>：更新所有內部連結以支援新導航系統

#### 改進
- <strong>可存取性</strong>：移除表情符號依賴，提升螢幕閱讀器兼容性
- <strong>專業外觀</strong>：乾淨、學術風格呈現，適合企業學習
- <strong>學習體驗</strong>：結構化方法，為每課提供明確目標與成果
- <strong>內容組織</strong>：改善相關主題間的邏輯連結與流程

### [v1.0.0] - 2025-09-09

#### 首次發行 - 全面 AZD 學習資料庫

#### 新增
- <strong>核心文件結構</strong>
  - 完整入門指南系列
  - 全面部署及資源供應文件
  - 詳細疑難排解資源與除錯指南
  - 預部署驗證工具與程序

- <strong>入門模組</strong>
  - AZD 基礎：核心概念與術語
  - 安裝指南：平台特定安裝指引
  - 設定指南：環境設置與身份驗證
  - 第一個專案教學：循序漸進的實作學習

- <strong>部署與資源供應模組</strong>
  - 部署指南：完整工作流程文件
  - 資源供應指南：使用 Bicep 的基礎架構即程式碼
  - 生產部署最佳實務
  - 多服務架構模式

- <strong>預部署驗證模組</strong>
  - 容量規劃：Azure 資源可用性驗證
  - SKU 選擇：完整服務階層指引
  - 預檢查：自動化驗證腳本（PowerShell 及 Bash）
  - 成本估算與預算規劃工具

- <strong>疑難排解模組</strong>
  - 常見問題：常見問題與解決方案
  - 除錯指南：系統化疑難排解方法
  - 進階診斷技巧與工具
  - 性能監控與優化

- <strong>資源與參考</strong>
  - 指令快速參考表：必要指令速查
  - 詞彙表：全面術語與縮寫定義
  - 常見問題解答：詳細常見問題答案
  - 外部資源連結與社群聯繫

- <strong>範例與模板</strong>
  - 簡易網頁應用範例
  - 靜態網站部署模板
  - 容器應用程式配置
  - 資料庫整合模式
  - 微服務架構範例
  - 伺服器無函數實作

#### 功能特色
- <strong>跨平台支援</strong>：Windows、macOS 與 Linux 的安裝與設定指南
- <strong>多技能等級</strong>：內容涵蓋學生至專業開發者
- <strong>實務導向</strong>：動手範例與真實場景應用
- <strong>全面覆蓋</strong>：涵蓋基礎概念至進階企業模式
- <strong>安全優先</strong>：全程整合安全最佳實務
- <strong>成本優化</strong>：提供經濟有效的部署與資源管理指導

#### 文件品質
- <strong>詳細程式碼範例</strong>：實用且經過測試的程式碼示範
- <strong>逐步說明</strong>：清楚、可執行的指引
- <strong>全面錯誤處理</strong>：常見問題的疑難排解
- <strong>整合最佳實務</strong>：業界標準與推薦
- <strong>版本相容性</strong>：與最新 Azure 服務及 azd 功能同步更新

## 計畫中的未來增強

### 版本 3.1.0 （計畫中）
#### AI 平台擴展
- <strong>多模型支援</strong>：整合 Hugging Face、Azure Machine Learning 與自訂模型的模式
- **AI 代理框架**：LangChain、Semantic Kernel 及 AutoGen 部署模板
- **進階 RAG 模式**：Azure AI Search 以外的向量資料庫選項（Pinecone、Weaviate 等）
- **AI 可觀察性**：增強模型效能、代幣使用及回應品質監控

#### 開發者體驗
- **VS Code 擴充套件**：整合 AZD 與 Microsoft Foundry 的開發體驗
- **GitHub Copilot 整合**：AI 輔助的 AZD 模板產生
- <strong>互動式教學</strong>：含自動驗證的 AI 場景實作練習
- <strong>視訊內容</strong>：補充的 AI 部署視覺教學影片

### 版本 4.0.0 （計畫中）
#### 企業 AI 模式
- <strong>治理架構</strong>：AI 模型治理、合規與審計軌跡
- **多租戶 AI**：為多客戶提供隔離 AI 服務的模式
- **邊緣 AI 部署**：與 Azure IoT Edge 及容器實例整合
- **混合雲 AI**：AI 工作負載的多雲與混合部署模式

#### 進階功能
- **AI 管線自動化**：與 Azure Machine Learning 管線的 MLOps 整合
- <strong>進階安全</strong>：零信任模式、私有端點與進階威脅防護
- <strong>效能優化</strong>：高吞吐量 AI 應用的調校與擴充策略
- <strong>全球分發</strong>：AI 應用的內容分發與邊緣快取模式

### 版本 3.0.0 （計畫中） - 已被目前版本取代
#### 提議新增功能 - 現已於 v3.0.0 實施
- ✅ **AI 專注內容**：全面 Microsoft Foundry 整合（完成）
- ✅ <strong>互動式教學</strong>：動手 AI 工作坊實驗室（完成）
- ✅ <strong>進階安全模組</strong>：AI 專屬安全模式（完成）
- ✅ <strong>效能優化</strong>：AI 工作負載調校策略（完成）

### 版本 2.1.0 （計畫中） - 部分於 v3.0.0 實現
#### 次要增強 - 一部分已於當前版本完成
- ✅ <strong>額外範例</strong>：AI 專注部署場景（完成）
- ✅ <strong>擴充常見問題</strong>：AI 特定問題與疑難排解（完成）
- <strong>工具整合</strong>：增強 IDE 與編輯器整合指南
- ✅ <strong>監控擴展</strong>：AI 專屬監控與警報模式（完成）

#### 未來版本計畫實施
- <strong>行動裝置友好文件</strong>：支援響應式設計以方便行動學習
- <strong>離線存取</strong>：可下載的文件套件
- **增強的 IDE 整合**：VS Code 擴充套件，適用於 AZD 與 AI 工作流程
- <strong>社群儀表板</strong>：即時社群指標與貢獻追蹤

## 為變更日誌作出貢獻

### 報告變更
在對此資料庫作出貢獻時，請確保變更日誌條目包含：

1. <strong>版本號</strong>：遵循語意版本 (major.minor.patch)
2. <strong>日期</strong>：發布或更新日期，格式為 YYYY-MM-DD
3. <strong>分類</strong>：新增、變更、已棄用、移除、修正、安全
4. <strong>清晰描述</strong>：簡明描述變更內容
5. <strong>影響評估</strong>：變更對現有用戶的影響

### 變更分類

#### 新增
- 新功能、文件區段或能力
- 新範例、模板或學習資源
- 額外工具、腳本或實用工具

#### 變更
- 現有功能或文件的修改
- 改善清晰度或準確度的更新
- 內容或組織結構的重組

#### 棄用
- 即將淘汰的功能或方法
- 計劃移除的文件區段
- 有更佳替代方案的方法

#### 移除
- 不再相關的功能、文件或範例
- 過時資訊或已棄用方法
- 重複或合併內容

#### 修正
- 文件或程式碼中的錯誤修正
- 報告問題或缺陷的解決
- 準確性或功能性的改善


#### 安全性
- 與安全相關的改進或修復
- 安全最佳實務的更新
- 安全漏洞的解決

### 語義版本控制指引

#### 主要版本 (X.0.0)
- 需要用戶操作的重大變更
- 內容或組織的重大重組
- 改變基本方法或方法論的變更

#### 次要版本 (X.Y.0)
- 新功能或內容新增
- 保持向後相容的增強功能
- 額外範例、工具或資源

#### 修補版本 (X.Y.Z)
- 錯誤修正與更正
- 對現有內容的小幅改進
- 澄清與小幅增強

## 社群回饋與建議

我們積極鼓勵社群回饋以改進此學習資源：

### 如何提供回饋
- **GitHub Issues**：回報問題或建議改進（歡迎 AI 特定問題）
- **Discord 討論**：分享想法並與 Microsoft Foundry 社群互動
- **Pull Requests**：直接對內容作出改進，特別是 AI 模板和指南
- **Microsoft Foundry Discord**：參與 #Azure 頻道的 AZD + AI 討論
- <strong>社群論壇</strong>：參與更廣泛的 Azure 開發者討論

### 回饋分類
- **AI 內容準確性**：修正 AI 服務整合和部署資訊
- <strong>學習體驗</strong>：改善 AI 開發者學習流程的建議
- **缺少 AI 內容**：請求新增 AI 模板、模式或範例
- <strong>無障礙</strong>：多元學習需求的改進
- **AI 工具整合**：改進 AI 開發工作流程整合的建議
- **生產 AI 模式**：企業 AI 部署模式請求

### 回應承諾
- <strong>問題回應</strong>：於報告問題後 48 小時內
- <strong>功能請求</strong>：一週內評估
- <strong>社群貢獻</strong>：一週內審核
- <strong>安全問題</strong>：優先處理並加速回應

## 維護計劃

### 定期更新
- <strong>每月審查</strong>：內容準確性及連結驗證
- <strong>季度更新</strong>：大量內容新增與改進
- <strong>半年審查</strong>：全面重組與增強
- <strong>年度釋出</strong>：重大版本更新與重大改進

### 監控與品質保證
- <strong>自動化測試</strong>：定期驗證程式碼範例和連結
- <strong>社群回饋整合</strong>：定期納入用戶建議
- <strong>技術更新</strong>：與最新 Azure 服務和 azd 發布保持一致
- <strong>無障礙稽核</strong>：定期審查包容性設計原則

## 版本支援政策

### 目前版本支援
- <strong>最新主要版本</strong>：全面支援並定期更新
- <strong>前一主要版本</strong>：提供安全更新及關鍵修復為期 12 個月
- <strong>舊版本</strong>：僅社群支援，無官方更新

### 遷移指引
主要版本釋出時，我們會提供：
- <strong>遷移指南</strong>：逐步過渡說明
- <strong>相容性說明</strong>：關於重大變更的細節
- <strong>工具支援</strong>：協助遷移的腳本或實用工具
- <strong>社群支援</strong>：專門的遷移問題論壇

---

<strong>導覽</strong>
- <strong>上一課</strong>：[學習指南](resources/study-guide.md)
- <strong>下一課</strong>：回到 [主 README](README.md)

<strong>保持更新</strong>：關注本儲存庫，以獲取有關新版本和學習資料重要更新的通知。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->