# 變更日誌 - AZD 初學者指南

## 簡介

本變更日誌記錄 AZD 初學者指南倉庫的所有重要變更、更新及改進。我們遵循語義版本控制原則，維護此日誌以幫助用戶了解版本間的變化。

## 學習目標

通過閱讀此變更日誌，您將：
- 保持最新，了解新增的功能和內容
- 了解現有文件的改進內容
- 追蹤錯誤修正和修訂以確保準確性
- 跟蹤學習材料的發展歷程

## 學習成果

閱讀變更日誌後，您將能夠：
- 識別可用的新增內容和資源
- 了解哪些章節已更新或改進
- 根據最新材料規劃您的學習路徑
- 提供反饋和建議以促進未來改進

## 版本歷史

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 更新：版本最新化
**此版本重新驗證課程對應 `azd` `1.27.1`（2026 年 7 月，最新穩定版）及目前的預覽版 AI agent 擴展 `azure.ai.agents` `1.0.0-beta.5`，將「驗證對應版本」標籤更新到最新，涵蓋 1.26.0、1.27.0 和 1.27.1 釋出後的狀態。**

#### 變更
- **✅ 驗證基線更新** 從 `azd 1.25.6`（2026 年 6 月）升級至 `azd 1.27.1`（2026 年 7 月），更新範圍涵蓋根目錄 README、所有章節 README、第一章的 dev-container 課程（包括固定版本示例）、第四章自訂模板課程、第五章多代理課程，以及工作坊文件
- **🤖 第二章基線更新** 從 `azd 1.23.12`（2026 年 3 月）升級到 `azd 1.27.1`，涵蓋 `agents.md`、`ai-model-deployment.md`、`ai-workshop-lab.md` 和 `microsoft-foundry-integration.md`，驗證說明日期更新為 2026-07-13
- **🧩 AI agent 擴展版本調升** 從 `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` 更新至最新的 `1.0.0-beta.5`，修改範圍包括第二章 README 和 `agents.md`
- **🧪 工作坊驗證範例**（`azd version` 輸出）更新為 `1.27.1`

#### 有關 azd 版本（1.26.0 → 1.27.1）的說明
- **1.26.0 (2026-06-24):** 支援 Azure Functions 的 Flex Consumption 模式、`azd config sub-filter` 多租戶訂閱篩選、自包含擴展包 (`azd x pack --bundle`)、及 `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** 可直接在 `azure.yaml` 中建模 Azure AI Foundry 專案與代理（免 Bicep/免 Terraform 初始化）、App Service 容器部署支援（`host: appservice` + `language: docker`）、`azd extension` 命令直接支援 `-s/--source`、以及 `azd tool uninstall`
- **1.27.1 (2026-07-09):** `azd extension install` 新增 `--no-dependencies` 參數、預設排除已棄用模型於目錄/配額提示、及多項錯誤修正

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

#### 初學者填補 #2：模板撰寫、開發容器、Pulumi、Azure DevOps、服務主體等
**此版本補齊 azd-覆蓋率分析揭示的剩餘中階缺口：如何撰寫與發布自訂模板、可重現的開發容器與 Codespaces 環境、Pulumi 基礎設施供應商、Azure DevOps CI/CD 演練、服務主體認證、主機選擇指引（AKS/Spring Apps）、`azd restore` / `azd package` 說明、鉤子錯誤處理、及團隊共享環境實務。**

#### 新增
- **🧱 新增第四章課程** `docs/chapter-04-infrastructure/custom-templates.md` — 撰寫自訂 azd 模板：必備結構（`azure.yaml`、`infra/`、`src/`）、`metadata.template` 欄位、使用 `uniqueString()` 資源標記及 `azd-env-name` 標籤參數化基礎設施、本地測試 `azd init --template <local-path>`、發布到 GitHub 及提交到 Awesome AZD 畫廊
- **📦 新增第一章課程** `docs/chapter-01-foundation/dev-containers.md` — 透過開發容器與 GitHub Codespaces 建立可重現的 azd 環境：精簡的 `.devcontainer/devcontainer.json`，使用官方 `ghcr.io/azure/azure-dev/azd` 功能、語言專屬功能、容器主機之 `docker-in-docker`，以及遠端登入的 `azd auth login --use-device-code`
- **🧩 Pulumi 與 azd** 部分新增於 `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`、Pulumi 文件夾結構、堆疊與 azd 環境的映射、必備輸出與標籤，及與 `azd up` / `azd down` 完全相同的工作流程
- **🎯 主機選擇指引** 新增於 `docs/chapter-04-infrastructure/provisioning.md` — 針對初學者友好的 `appservice`、`staticwebapp`、`function`、`containerapp`、`aks` 和 `springapp` 比較，以及何時選擇 AKS 或 Azure Spring Apps 的建議
- **🛠️ Azure DevOps CI/CD 演練** 新增於 `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`、OIDC 工作負載身分聯邦的服務連接、生成的 `azure-dev.yml`，以及變數組設置
- **🔑 服務主體（模式 4）** 新增於 `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`、使用客戶端密鑰的非互動式 `azd auth login` 與聯邦/OIDC 認證、使用時機及安全憑證儲存
- **🪝 鉤子錯誤處理** 新增細分節於 `docs/chapter-04-infrastructure/deployment-guide.md` — 退出代碼與 `set -e`、`continueOnError`、用 `azd hooks run` 隔離測試鉤子、作業系統特定的 shell 支援和 `--debug` 選項
- **👥 團隊 / 共享環境** 新增於 `docs/chapter-03-configuration/configuration.md` — `.azure/` 的內容、gitignore 設置、每位開發者的獨立環境、`azd env list` / `select`、及 CI/CD 中提供環境變數
- **🧰 `azd restore` 及擴充 `azd package`** 解釋新增於 `resources/cheat-sheet.md` — 還原依賴並構建可部署工件，無需實際部署

#### 變更
- **🧭 更新第四章課程表**，新增「撰寫自訂模板」課程（課程 3）
- **🧭 更新第一章課程表**，新增「開發容器及 Codespaces」課程（課程 5）；在 `bring-your-own-app.md` 跟 `dev-containers.md` 之間建立導覽尾頁連結

### [v3.21.0] - 2026-06-16

#### 初學者填補：實作多代理課程、「帶入自訂應用」、Terraform 及 CI/CD 演練
**此版本填補了初學者指南中最大的缺口，增加兩個實作課程（一個可部署的多代理演練，及如何將 azd 加入現有應用）、初學者友好鉤子入門、Terraform 與 azd 的章節、分步 GitHub Actions 管線演練、預覽擴展說明，以及明確的部署驗證檢查清單。**

#### 新增
- **🤝 新增第五章課程** `docs/chapter-05-multi-agent/multi-agent-basics.md` — 一個全機手操作、可部署的雙代理演練（協調者 + 專家代理），使用真實模板 `contoso-creative-writer`，涵蓋多代理的使用時機、`azd up` 工作流程、理解部署的資源、代理間追蹤、客製化與清理
- **📦 新增第一章課程** `docs/chapter-01-foundation/bring-your-own-app.md` — 如何使用 `azd init` （「使用當前目錄程式碼」）將 azd 加入現有專案、理解 `azure.yaml` 和 `infra/`、`azd infra generate`、主機偵測，以及使用 `azd up` 部署
- **🌐 Terraform with azd** 新增於 `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` 配置、`.tf` 目錄結構、必備 `AZURE_*` 輸出與 `azd-env-name` 標籤、及與 `azd up` / `azd down` 完全相同的工作流程（彌補之前聲稱支援 Terraform 但範例僅示範 Bicep 的缺口）
- **⚙️ 分步 GitHub Actions 演練** 新增於 `docs/chapter-08-production/production-ai-practices.md` — 從 GitHub 倉庫到自動化部署：`azd pipeline config`、OIDC 聯邦認證（無需儲存祕密）、生成的 `azure-dev.yml`、以及祕密與變數的建議
- **🪝 初學者「鉤子新手？」入門** 新增於 `docs/chapter-04-infrastructure/deployment-guide.md` — 什麼是鉤子、鉤子階段表格、極簡初始鉤子、及如何用 `azd hooks run` 手動執行鉤子
- **✅ 「驗證您的部署」清單** 新增於 `docs/chapter-01-foundation/first-project.md` 第 5 步 — 煙霧測試、健康端點檢查及明確的成功標準
- **🧩 新預覽擴展說明** `azure.ai.skills` 與 `azure.ai.connections`（它們是什麼、何時使用）新增於 `docs/chapter-08-production/production-ai-practices.md`

#### 變更
- **🧭 修正第五章課程表**：`multi-agent-basics.md` 為課程 1（唯一完整實作課程），明確標註課程 2 在第六章，零售情境為架構藍圖而非單一命令模板
- **🧭 更新第一章課程表**，新增「帶入自訂應用」課程（課程 4）
- **🔗 更新導覽尾頁**：`first-project.md` 現在指向 `bring-your-own-app.md`

#### 修正
- **🧱 補齊之前漏缺的 Terraform 支援** — 此前課程提及 Terraform 支援但未展示
- **🔀 修正誤導的第五章相互引用**，避免誤導為存在完整多代理實作，實際上只有架構藍圖

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

#### AZD 1.25.6 更新，全代理生命週期命令與 Aspire 重塑品牌

**此版本針對 `azd` `1.25.6`（2026 年 6 月）及 `azure.ai.agents` `0.1.40-preview` 擴充套件重新驗證課程，將 AI 指導從「搭建代理」擴展到完整代理生命週期（測試 → 評估 → 優化 → 檢查 → 刪除），展示新的 `azure.ai.skills` 和 `azure.ai.connections` 預覽擴充套件，並註明「.NET Aspire」更名為「Aspire」。**

#### 新增
- **🔁 適合初學者和 AI 工程師的完整代理生命週期涵蓋**，遍及整個文件：
  - `docs/chapter-01-foundation/azd-basics.md` — 在擴充功能及 AI 指令區新增生命週期表（搭建 → 測試 → 測量 → 改善 → 檢查 → 清理）
  - `docs/chapter-08-production/production-ai-practices.md` — 新增「管理代理生命週期」章節，涵蓋 `azd ai agent invoke`、`endpoint show`、`eval generate`、`optimize`、`code download` 及 `delete --force`
  - `resources/cheat-sheet.md` — 擴充 AI 代理指令，包含 `invoke`、`endpoint show`、`eval generate`、`optimize`、`code download` 及 `delete --force`
- **🧩 新增預覽擴充套件** 文件：`azure.ai.skills`（可重用代理技能）及 `azure.ai.connections`（Foundry 連線）加入擴充套件表及備忘單
- **⏱️ 回應時間指導** — `azd ai agent invoke` 範例現註明會列印總延遲值及首次字節時間
- **📌 版本橫幅** 加入根目錄 README，指導學習者使用 `azd version` 和 `azd upgrade`

#### 變更
- **✅ 驗證基線更新**：所有章節 README 及工作坊文件從 `azd 1.23.12`（2026 年 3 月）更新至 `azd 1.25.6`（2026 年 6 月）
- **🤖 第二章擴充說明** 從 `azure.ai.agents` `0.1.18-preview` 更新為 `0.1.40-preview`
- **🧪 工作坊驗證範例** (`azd version` 輸出) 更新至 `1.25.6`
- **🧭 README「今日 azd 新功能」** 更新，強調端到端代理生命週期、新 AI 擴充功能及近期提升生活品質的修正（`azd init` 冪等性、`azd auth login` 過期令牌清理、`azd tool` 首次運行提示）
- **📖 第二章 agents.md（選項 4）** 現指引學習者使用部署後生命週期指令，而非只停留在 `azd up`

#### 修正
- **🏷️ 產品命名** — 新增 Aspire 更名註記（原「.NET Aspire」現簡稱為「Aspire」）；azd 對 Aspire 的支援不變
- **🔎 直播釋出驗證** 確認符合 Azure Developer CLI 釋出頻道：穩定版 CLI `1.25.6`（2026-06-12）及 `azure.ai.agents` `0.1.40-preview`（2026-06-15）

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

#### 初學者入門說明、設定驗證與最終 AZD 指令清理
**本版本延續 AZD 1.23 驗證掃描，針對初學者重點整理文檔：明確 AZD 為先認證指導，新增本地設定驗證腳本，確認關鍵指令符合現行 AZD CLI，移除變更記錄外最後的英文過時指令參照。**

#### 新增
- **🧪 初學者設定驗證腳本** `validate-setup.ps1` 及 `validate-setup.sh`，讓學習者在第 1 章開始前確認環境需求工具
- **✅ 前置設定驗證步驟** 加入根目錄及第 1 章 README，於 `azd up` 前捕捉缺少前置條件

#### 變更
- **🔐 初學者身份驗證指導** 現統一視 `azd auth login` 為 AZD 工作流程主要路徑，僅當直接使用 Azure CLI 指令時備註可選用 `az login`
- **📚 第 1 章入門流程** 指示學習者先驗證本地設定，才進行安裝、認證及首次部署
- **🛠️ 驗證工具訊息** 現清楚區分阻斷性需求與可選 Azure CLI 警告，以符合僅用 AZD 的初學者路徑
- **📖 組態、疑難排解與範例文件** 現區分必須 AZD 認證與可選 Azure CLI 登入，避免過去兩者混合介紹造成混淆

#### 修正
- **📋 剩餘英文源命令參照** 更新為當前 AZD 格式，包含備忘單中的 `azd config show` 和指導 Azure 入口網站總覽的 `azd monitor --overview`
- **🧭 第 1 章初學者說法** 軟化不過度保證全模板及 Azure 資源都零錯誤或回滾行為
- **🔎 實況 CLI 驗證** 確認目前支持 `azd env get-values`、`azd template list`、`azd extension list --installed`、`azd copilot consent list`、`azd mcp start`、`azd provision --preview`、`azd monitor --logs` 及 `azd down --force --purge`

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
**本版本執行 `azd` `1.23.12` 的文件驗證掃描，更新過時 AZD 指令範例，刷新 AI 模型指導為現行預設，並將工作坊指導從僅針對 GitHub Codespaces 擴展至支援開發容器及本地複製。**

#### 新增
- **✅ 核心章節與工作坊文件新增驗證說明**，讓使用新版或舊版 CLI 的學習者明確了解驗證過的 AZD 基線
- **⏱️ 部署超時指導**，說明使用 `azd deploy --timeout 1800` 進行長時間 AI 應用部署
- **🔎 擴充套件檢視步驟**，AI 工作流程文件新增使用 `azd extension show azure.ai.agents`
- **🌐 擴大工作坊環境指導**，涵蓋 GitHub Codespaces、開發容器及本地複製，使用 MkDocs 文件呈現

#### 變更
- **📚 章節介紹 README**，統一標示使用 `azd 1.23.12` 驗證，涵蓋基礎、配置、基礎架構、多代理、預部署、疑難排解及生產章節
- **🛠️ AZD 指令參考** 更新為文件中現行格式：
  - `azd config list` → `azd config show`
  - `azd env show` → 依情況改為 `azd env list` 或 `azd env get-value(s)`
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → 用於應用洞察總覽時改為 `azd monitor --overview`
- **🧪 簡化預覽提供範例**，採用當前支援用法如 `azd provision --preview` 和 `azd provision --preview -e production`
- **🧭 工作坊流程** 更新，允許學習者於 Codespaces、開發容器或本地複製中完成實驗室，不再限於 Codespaces
- **🔐 認證指導** 更新，偏好 `azd auth login` 用於 AZD 工作流程，當直接使用 Azure CLI 指令時才選擇性採用 `az login`

#### 修正
- **🪟 Windows 安裝指令** 已在安裝指南中調整為現行 `winget` 套件大小寫格式
- **🐧 Linux 安裝指導** 修正，避免不支持的發行版特定 `azd` 套件管理指令，改指向釋出資源
- **📦 AI 模型範例** 從舊版預設如 `gpt-35-turbo` 與 `text-embedding-ada-002` 刷新為現行範例，包括 `gpt-4.1-mini`、`gpt-4.1` 和 `text-embedding-3-large`
- **📋 部署與診斷片段** 修正為使用現行環境和狀態指令於日誌、腳本及診斷步驟
- **⚙️ GitHub Actions 指導** 從 `Azure/setup-azd@v1.0.0` 升級為 `Azure/setup-azd@v2`
- **🤖 MCP/Copilot 同意指導** 從 `azd mcp consent` 更新為 `azd copilot consent list`

#### 改善
- **🧠 AI 章節指導** 更深入解釋預覽敏感的 `azd ai` 行為、多租戶登入、現用擴充功能使用及更新後模型部署建議
- **🧪 工作坊指導** 採用更實際的版本範例及更清楚的環境設定說明，提升實作實驗室體驗
- **📈 生產與疑難排解文件** 與現行監控、備援模型及成本等級範例更好貼合

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

#### AZD AI CLI 指令、內容驗證與範本擴展
**本版本新增 `azd ai`、`azd extension` 和 `azd mcp` 指令涵蓋於所有 AI 相關章節，修復 agents.md 中的壞鏈結及過時代碼，更新備忘單，並徹底改寫範例範本章節，加入經過驗證的說明與新的 Azure AI AZD 範本。**

#### 新增
- **🤖 AZD AI CLI 覆蓋範圍** 擴及 7 個文件（先前僅限第 8 章）：
  - `docs/chapter-01-foundation/azd-basics.md` — 新增「擴充功能及 AI 指令」章節，介紹 `azd extension`、`azd ai agent init` 及 `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — 選項 4：`azd ai agent init`，附比較表（範本與清單方式）
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — 「Foundry 的 AZD 擴充」及「代理優先部署」子段

  - `docs/chapter-05-multi-agent/README.md` — 快速入門現已顯示範本及基於清單檔的部署路徑
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — 部署部分新增 `azd ai agent init` 選項
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — 「AZD AI 擴充功能診斷命令」子項目
  - `resources/cheat-sheet.md` — 新增「AI 與擴充功能命令」區段，包括 `azd extension`、`azd ai agent init`、`azd mcp` 和 `azd infra generate`
- **📦 新增 AZD AI 範本** 於 `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — 使用 Blazor WebAssembly、語義核心及語音聊天支援的 .NET RAG 聊天
  - **azure-search-openai-demo-java** — 使用 Langchain4J 的 Java RAG 聊天，支援 ACA/AKS 部署選項
  - **contoso-creative-writer** — 多代理創意寫作應用，使用 Azure AI Agent 服務、Bing Grounding 與 Prompty
  - **serverless-chat-langchainjs** — 無伺服器 RAG，結合 Azure Functions + LangChain.js + Cosmos DB，支援 Ollama 本地開發
  - **chat-with-your-data-solution-accelerator** — 企業級 RAG 加速器，附管理入口網站、Teams 整合及 PostgreSQL/Cosmos DB 選項
  - **azure-ai-travel-agents** — 多代理 MCP 編排參考應用，包含 .NET、Python、Java 和 TypeScript 服務端
  - **azd-ai-starter** — 最簡化 Azure AI 基礎架構 Bicep 起手範本
  - **🔗 精彩的 AZD AI 展示連結** — 參考 [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai)（超過 80 個範本）

#### 修正
- **🔗 agents.md 導航**：上一頁/下一頁連結現在與第二章 README 的課程順序相符（Microsoft Foundry Integration → Agents → AI Model Deployment）
- **🔗 agents.md 斷鏈修正**：將 `production-ai-practices.md` 修正為 `../chapter-08-production/production-ai-practices.md`（出現 3 次）
- **📦 agents.md 棄用程式碼**：將 `opencensus` 替換為 `azure-monitor-opentelemetry` 與 OpenTelemetry SDK
- **🐛 agents.md 無效 API**：將 `max_tokens` 從 `create_agent()` 移至 `create_run()`，改為 `max_completion_tokens`
- **🔢 agents.md 令牌計數**：用 `tiktoken.encoding_for_model()` 代替粗略的 `len//4` 估算
- **azure-search-openai-demo**：服務修正為「Azure AI Search + Azure Container Apps」，非「認知搜尋 + 應用服務」（2024 年 10 月起預設主機變更）
- **contoso-chat**：更新說明以參考 Azure AI Foundry + Prompty，與儲存庫的實際標題及技術堆疊相符

#### 移除
- **ai-document-processing**：移除非功能性範本參考（該儲存庫未作為 AZD 範本公開）

#### 改善
- **📝 agents.md 練習**：練習一新增預期輸出與 `azd monitor` 步驟；練習二包括完整的 `FunctionTool` 註冊碼；練習三將模糊指引換成具體的 `prepdocs.py` 指令
- **📚 agents.md 資源**：更新文件連結對應最新 Azure AI Agent Service 文件與快速入門
- **📋 agents.md 後續步驟表**：新增 AI 工作坊實驗室連結以完整覆蓋本章內容

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

#### 課程導航強化
**此版本改善了 README.md 章節導航，加入了增強表格格式。**

#### 變更
- <strong>課程地圖表</strong>：新增直接課程連結、時長預估與複雜度評級
- <strong>資料夾清理</strong>：移除冗餘舊資料夾（deployment/、getting-started/、pre-deployment/、troubleshooting/）
- <strong>連結驗證</strong>：課程地圖表中 21+ 內部連結全部驗證無誤

### [v3.16.0] - 2026-02-05

#### 產品名稱更新
**此版本更新了產品引用以匹配目前的 Microsoft 品牌形象。**

#### 變更
- **Microsoft Foundry → Microsoft Foundry**：所有非翻譯文件中參考更新
- **Azure AI Agent Service → Foundry Agents**：服務名稱更新以反映最新品牌

#### 更新檔案
- `README.md` - 主要課程登陸頁面
- `changelog.md` - 版本歷史
- `course-outline.md` - 課程結構
- `docs/chapter-02-ai-development/agents.md` - AI 代理指南
- `examples/README.md` - 範例文件
- `workshop/README.md` - 工作坊首頁
- `workshop/docs/index.md` - 工作坊索引
- `workshop/docs/instructions/*.md` - 所有工作坊指令文件

---

### [v3.15.0] - 2026-02-05

#### 主要儲存庫重構：依章節資料夾命名
**此版本將文件重新整理為專屬章節資料夾，增強導航清晰度。**

#### 資料夾重新命名
舊資料夾已被章節編號資料夾替代：
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- 新增：`docs/chapter-05-multi-agent/`

#### 檔案移轉
| 檔案 | 自 | 至 |
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
| 所有 pre-deployment 文件 | pre-deployment/ | chapter-06-pre-deployment/ |
| 所有 troubleshooting 文件 | troubleshooting/ | chapter-07-troubleshooting/ |

#### 新增
- **📚 章節 README 文件**：於每章節資料夾創建 README.md，包含：
  - 學習目標與時長
  - 課程表與說明
  - 快速入門指令
  - 導航至其他章節

#### 變更
- **🔗 更新所有內部連結**：跨越所有文件共更新 78+ 路徑
- **🗺️ 主要 README.md**：更新課程地圖以反映新章節結構
- **📝 examples/README.md**：更新跨章節參考連結

#### 移除
- 舊資料夾結構（getting-started/、microsoft-foundry/、deployment/、pre-deployment/、troubleshooting/、ai-foundry/）

---

### [v3.14.0] - 2026-02-05

#### 儲存庫重構：章節導航
**此版本新增章節導航 README 文件（後被 v3.15.0 取代）。**

---

### [v3.13.0] - 2026-02-05

#### 新 AI 代理指南
**此版本新增全面的 Azure Developer CLI 部署 AI 代理指南。**

#### 新增
- **🤖 docs/microsoft-foundry/agents.md**：完整指南涵蓋：
  - AI 代理的定義與與聊天機器人的不同
  - 三個快速入門代理範本（Foundry Agents、Prompty、RAG）
  - 代理架構模式（單代理、RAG、多代理）
  - 工具配置與客製化
  - 監控與指標追蹤
  - 成本考量與優化
  - 常見故障排解場景
  - 三個動手練習與成功標準

#### 內容架構
- <strong>導言</strong>：初學者代理概念
- <strong>快速入門</strong>：使用 `azd init --template get-started-with-ai-agents` 部署代理
- <strong>架構模式</strong>：代理模式視覺圖解
- <strong>配置</strong>：工具設置與環境變數
- <strong>監控</strong>：應用程式洞察整合
- <strong>練習</strong>：漸進式動手學習（每題 20-45 分鐘）

---

### [v3.12.0] - 2026-02-05

#### DevContainer 環境更新
**此版本更新了開發容器設定，引入現代化工具與更佳預設，強化 AZD 學習體驗。**

#### 變更
- **🐳 基底映像**：由 `python:3.12-bullseye` 更新為 `python:3.12-bookworm`（最新 Debian 穩定版）
- **📛 容器名稱**：由「Python 3」更名為「AZD for Beginners」以清晰表達

#### 新增
- **🔧 新 Dev Container 功能**：
  - 啟用 Bicep 支援的 `azure-cli`
  - `node:20`（適用於 AZD 範本的 LTS 版本）
  - 用於範本管理的 `github-cli`
  - 用於容器應用部署的 `docker-in-docker`

- **🔌 埠轉發**：預設配置了常用開發埠：
  - 8000（MkDocs 預覽）
  - 3000（Web 應用）
  - 5000（Python Flask）
  - 8080（API）

- **🧩 新增 VS Code 擴充功能**：
  - `ms-python.vscode-pylance` - 強化 Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions 支援
  - `ms-azuretools.vscode-docker` - Docker 支援
  - `ms-azuretools.vscode-bicep` - Bicep 語言支援
  - `ms-azure-devtools.azure-resource-groups` - Azure 資源管理
  - `yzhang.markdown-all-in-one` - Markdown 編輯支援
  - `DavidAnson.vscode-markdownlint` - Markdown 檢查
  - `bierner.markdown-mermaid` - Mermaid 圖表支援
  - `redhat.vscode-yaml` - YAML 支援（用於 azure.yaml）
  - `eamodio.gitlens` - Git 視覺化
  - `mhutchie.git-graph` - Git 歷史圖示

- **⚙️ VS Code 設定**：新增 Python 直譯器預設配置、儲存時格式化及空白字元修剪

- **📦 更新 requirements-dev.txt**：
  - 新增 MkDocs minify 插件
  - 新增 pre-commit 以確保程式碼品質
  - 新增 Azure SDK 套件（azure-identity, azure-mgmt-resource）

#### 修正
- <strong>後置建立指令</strong>：現於容器啟動時驗證 AZD 與 Azure CLI 已安裝

---

### [v3.11.0] - 2026-02-05

#### 初學者友好 README 大改版
**此版本大幅改善 README.md，使其更適合初學者，並新增 AI 開發者重要資源。**

#### 新增
- **🆚 Azure CLI 與 AZD 比較**：清楚說明何時使用各工具並附範例
- **🌟 精彩 AZD 連結**：直接連到社群範本畫廊與貢獻資源：
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 超過 200 個可即刻部署範本
  - [提交範本](https://github.com/Azure/awesome-azd/issues) - 社群貢獻管道
- **🎯 快速入門指南**：簡化的三步驟起手（安裝 → 登入 → 部署）
- **📊 依經驗劃分的導航表**：清楚指引開發者從何處開始

#### 變更
- **README 結構**：重組為漸進式揭露 - 先呈現關鍵資訊
- <strong>導入段落</strong>：重寫解釋「`azd up` 的魔法」，適合完全新手
- <strong>移除重複內容</strong>：刪除重複的故障排解段落
- <strong>故障排解命令</strong>：修正 `azd logs` 參考為有效的 `azd monitor --logs`

#### 修正

- **🔐 認證指令**：新增 `azd auth login` 和 `azd auth logout` 至 cheat-sheet.md
- <strong>無效指令參考</strong>：從 README 疑難排解章節移除剩餘的 `azd logs`

#### 注意事項
- <strong>範圍</strong>：變更應用於主要 README.md 和 resources/cheat-sheet.md
- <strong>目標讀者</strong>：針對 AZD 新手開發者的改進

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI 指令準確性更新
**此版本修正文件中不存在的 AZD 指令，確保所有程式碼範例皆使用有效的 Azure Developer CLI 語法。**

#### 修正
- **🔧 移除不存在的 AZD 指令**：全面審查並修正無效指令：
  - `azd logs`（不存在）→ 取代為 `azd monitor --logs` 或 Azure CLI 替代方案
  - `azd service` 子指令（不存在）→ 取代為 `azd show` 與 Azure CLI
  - `azd infra import/export/validate`（不存在）→ 移除或取代為有效替代方案
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` 標誌（不存在）→ 移除
  - `azd provision --what-if/--rollback` 標誌（不存在）→ 更新為使用 `--preview`
  - `azd config validate`（不存在）→ 取代為 `azd config list`
  - `azd info`、`azd history`、`azd metrics`（不存在）→ 移除

- **📚 修改指令修正的檔案**：
  - `resources/cheat-sheet.md`：指令參考大幅更新
  - `docs/deployment/deployment-guide.md`：修正回滾與部署策略
  - `docs/troubleshooting/debugging.md`：修正日誌分析章節
  - `docs/troubleshooting/common-issues.md`：更新疑難排解指令
  - `docs/troubleshooting/ai-troubleshooting.md`：修正 AZD 疑難排解章節
  - `docs/getting-started/azd-basics.md`：修正監控指令
  - `docs/getting-started/first-project.md`：更新監控與偵錯範例
  - `docs/getting-started/installation.md`：修正幫助與版本範例
  - `docs/pre-deployment/application-insights.md`：修正日誌檢視指令
  - `docs/pre-deployment/coordination-patterns.md`：修正代理程式偵錯指令

- **📝 版本參考更新**：
  - `docs/getting-started/installation.md`：將硬編碼的 `1.5.0` 版本改為泛用的 `1.x.x` 並附連結至釋出頁

#### 變更
- <strong>回滾策略</strong>：文件更新為使用基於 Git 的回滾（AZD 無內建回滾）
- <strong>日誌檢視</strong>：將 `azd logs` 參考改為 `azd monitor --logs`、`azd monitor --live` 與 Azure CLI 指令
- <strong>效能章節</strong>：移除不存在的平行/增量部署旗標，提供有效替代方案

#### 技術細節
- **有效的 AZD 指令**：`init`、`up`、`auth`、`deploy`、`down`、`provision`、`publish`、`completion`、`config`、`env`、`show`、`version`、`monitor`
- **有效的 azd monitor 旗標**：`--live`、`--logs`、`--overview`
- <strong>移除的功能</strong>：`azd logs`、`azd service`、`azd infra import/export/validate`、`azd history`、`azd metrics`、`azd info`、`azd config validate`

#### 注意事項
- <strong>驗證</strong>：依照 Azure Developer CLI v1.23.x 驗證指令

---

### [v3.9.0] - 2026-02-05

#### 工作坊完成與文件品質更新
**此版本完成互動式工作坊模組，修正全部壞掉的文件連結，並提升微軟 AZD 針對 AI 開發者的整體內容品質。**

#### 新增
- **📝 CONTRIBUTING.md**：新增貢獻指南文件，包含：
  - 清楚的問題回報與變更建議說明
  - 新內容文件標準
  - 程式碼範例指導與提交訊息慣例
  - 社群參與資訊

#### 完成
- **🎯 工作坊模組 7（結束）**：全面完成結束模組，包含：
  - 工作坊成果全面總結
  - 重要概念精通章節涵蓋 AZD、範本及 Microsoft Foundry
  - 學習路徑持續建議
  - 工作坊挑戰練習及難度分級
  - 社群回饋與支援連結

- **📚 工作坊模組 3（拆解）**：更新學習目標，包含：
  - GitHub Copilot 與 MCP 伺服器激活指導
  - AZD 範本資料夾結構理解
  - 基礎設施即程式碼（Bicep）組織模式
  - 實作實驗室指令

- **🔧 工作坊模組 6（拆除）**：完成內容：
  - 資源清理與成本管理目標
  - 使用 `azd down` 安全移除基礎設施
  - 恢復軟刪除的認知服務指導
  - 額外探索提示（GitHub Copilot 與 Azure 入口網站）

#### 修正
- **🔗 損壞連結修正**：解決 15+ 個內部文件壞掉的連結：
  - `docs/ai-foundry/ai-model-deployment.md`：修正 microsoft-foundry-integration.md 路徑
  - `docs/troubleshooting/ai-troubleshooting.md`：修正 ai-model-deployment.md 和 production-ai-practices.md 路徑
  - `docs/getting-started/first-project.md`：以 deployment-guide.md 取代不存在的 cicd-integration.md
  - `examples/retail-scenario.md`：修正 FAQ 與疑難排解指南路徑
  - `examples/container-app/microservices/README.md`：修正課程首頁及部署指南路徑
  - `resources/faq.md` 與 `resources/glossary.md`：更新 AI 章節參考
  - `course-outline.md`：修正講師指南與 AI 工作坊實驗室參考

- **📅 工作坊狀態橫幅**：狀態由「建置中」更新為 2026 年 2 月的啟用狀態

- **🔗 工作坊導覽**：修正 workshop README.md 中指向不存在 lab-1-azd-basics 資料夾的壞掉導覽連結

#### 變更
- <strong>工作坊簡報</strong>：移除「建置中」警告，工作坊現已完成且準備可用
- <strong>導覽一致性</strong>：確保所有工作坊模組間具有適當的互動導覽
- <strong>學習路徑參考</strong>：更新章節交叉參考為正確的 microsoft-foundry 路徑

#### 驗證
- ✅ 所有英文 Markdown 檔案具有有效的內部連結
- ✅ 工作坊模組 0-7 均完整且含有學習目標
- ✅ 章節與模組之間的導覽運作正常
- ✅ 內容適合使用 Microsoft AZD 的 AI 開發者
- ✅ 全文保持對初學者友善的語言及結構
- ✅ CONTRIBUTING.md 提供明確的社群貢獻指導

#### 技術實施
- <strong>連結驗證</strong>：自動 PowerShell 腳本驗證所有 .md 內部連結
- <strong>內容稽核</strong>：手動審查工作坊完整性及初學者適用性
- <strong>導覽系統</strong>：一致的章節與模組導覽模式

#### 注意事項
- <strong>範圍</strong>：本次變更僅套用英文文件
- <strong>翻譯</strong>：本版本未更新翻譯資料夾（稍後將透過自動翻譯同步）
- <strong>工作坊時長</strong>：完整工作坊提供 3-4 小時動手學習

---

### [v3.8.0] - 2025-11-19

#### 進階文件：監控、安全與多代理程式模式
**此版本新增包含 Application Insights 整合、認證模式及多代理程式協調的全面 A 級課程，用於生產部署。**

#### 新增
- **📊 Application Insights 整合課程**：位於 `docs/pre-deployment/application-insights.md`：
  - 以 AZD 為焦點的部署與自動配置
  - 完整的 Application Insights + Log Analytics Bicep 範本
  - 具自訂遙測的 Python 可運作範例應用（超過 1,200 行）
  - AI/LLM 監控模式（Microsoft Foundry 模型的代幣與成本追蹤）
  - 6 個 Mermaid 圖表（架構、分散式追蹤、遙測流程）
  - 3 個動手練習（警報、儀表板、AI 監控）
  - Kusto 查詢範例及成本優化策略
  - 即時指標串流與實時偵錯
  - 40-50 分鐘學習時間，含生產就緒模式

- **🔐 認證與安全模式課程**：位於 `docs/getting-started/authsecurity.md`：
  - 3 種認證模式（連接字串、Key Vault、管理身份）
  - 安全部署的完整 Bicep 基礎設施設定範本
  - Azure SDK 整合的 Node.js 應用程式碼
  - 3 個完整練習（啟用管理身份、用戶指派身份、Key Vault 旋轉）
  - 安全最佳實踐與 RBAC 配置
  - 疑難排解指引與成本分析
  - 生產就緒的無密碼認證模式

- **🤖 多代理程式協調模式課程**：位於 `docs/pre-deployment/coordination-patterns.md`：
  - 5 種協調模式（序列、平行、階層、事件驅動、共識）
  - 完整的協調器服務實作（Python/Flask，超過 1,500 行）
  - 3 種專門代理程式實作（研究、作家、編輯）
  - 服務總線整合用於訊息佇列
  - Cosmos DB 用於分散式系統的狀態管理
  - 6 個 Mermaid 圖展示代理程式互動
  - 3 個進階練習（逾時處理、重試邏輯、斷路器）
  - 成本細目（240-565 美元/月）及優化策略
  - Application Insights 監控整合

#### 強化
- <strong>預部署章節</strong>：新增全面監控與協調模式
- <strong>入門章節</strong>：強化專業認證模式
- <strong>生產就緒度</strong>：涵蓋安全至可觀察性的完整內容
- <strong>課程大綱</strong>：更新為新課程在第 3 與第 6 章的參考

#### 變更
- <strong>學習進程</strong>：更佳整合安全與監控
- <strong>文件品質</strong>：新課程維持一致的 A 級標準（95-97%）
- <strong>生產模式</strong>：企業部署端對端完整覆蓋

#### 改良
- <strong>開發者體驗</strong>：從開發到生產監控的清晰路徑
- <strong>安全標準</strong>：專業認證與祕密管理模式
- <strong>可觀察性</strong>：完整 Application Insights 與 AZD 整合
- **AI 工作負載**：針對 Microsoft Foundry 模型與多代理系統的專門監控

#### 驗證
- ✅ 所有課程均含完整可運作程式碼（非簡略片段）
- ✅ Mermaid 圖表視覺學習（3 課程共 19 張）
- ✅ 動手練習附驗證步驟（共 9 個）
- ✅ 生產就緒 Bicep 範本，可透過 `azd up` 部署
- ✅ 成本分析與優化策略
- ✅ 疑難排解指南與最佳實踐
- ✅ 知識檢核點與驗證指令

#### 文件分級結果
- **docs/pre-deployment/application-insights.md**：- 全面監控指南
- **docs/getting-started/authsecurity.md**：- 專業安全模式
- **docs/pre-deployment/coordination-patterns.md**：- 進階多代理架構
- <strong>整體新內容</strong>：- 一致的高品質標準

#### 技術實施
- **Application Insights**：日誌分析 + 自訂遙測 + 分散式追蹤
- <strong>認證</strong>：管理身份 + Key Vault + RBAC 模式
- <strong>多代理</strong>：服務總線 + Cosmos DB + Container Apps + 協調
- <strong>監控</strong>：即時指標 + Kusto 查詢 + 警報 + 儀表板
- <strong>成本管理</strong>：取樣策略、保留政策、預算控制

### [v3.7.0] - 2025-11-19

#### 文件品質提升與新 Microsoft Foundry 模型範例
**此版本提升整個庫的文件品質，並新增 Microsoft Foundry 模型部署範例，包含 gpt-4.1 聊天介面。**

#### 新增
- **🤖 Microsoft Foundry 模型聊天範例**：完整 gpt-4.1 部署，實現在 `examples/azure-openai-chat/`：
  - 完整的 Microsoft Foundry 模型基礎設施（gpt-4.1 模型部署）
  - 具會話歷史記錄的 Python 命令列聊天介面
  - 用於安全 API 金鑰儲存的 Key Vault 整合
  - 代幣使用追蹤與成本估算
  - 速率限制與錯誤處理
  - 詳盡 README 含 35-45 分鐘部署指南
  - 11 個生產就緒檔案（Bicep 範本、Python 應用程式、設定）
- **📚 文件練習**：於設定指南新增動手練習：
  - 練習 1：多環境設定（15 分鐘）
  - 練習 2：秘鑰管理實作（10 分鐘）
  - 明確成功標準與驗證步驟
- **✅ 部署驗證**：於部署指南新增驗證章節：
  - 健康檢查程序
  - 成功標準清單
  - 所有部署指令的預期輸出
  - 疑難排解快速參考

#### 強化
- **examples/README.md**：更新至 A 級品質（93%）：
  - 將 azure-openai-chat 新增至所有相關章節
  - 本機範例數量由 3 增至 4
  - 新增至 AI 應用範例表格
  - 整合至中階使用者快速入門
  - 新增至 Microsoft Foundry 範本章節
  - 更新比較矩陣與技術尋找章節
- <strong>文件品質</strong>：將 docs 資料夾優化從 B+ (87%) 提升至 A- (92%)

  - 新增重要指令範例的預期輸出
  - 增加設定變更的驗證步驟
  - 以實務練習加強實作學習

#### 變更
- <strong>學習進度</strong>：更佳整合中階學習者的 AI 範例
- <strong>文件架構</strong>：更多可操作的練習與明確成果
- <strong>驗證流程</strong>：在關鍵工作流程新增明確成功標準

#### 改善
- <strong>開發者體驗</strong>：Microsoft Foundry Models 部署時間縮短至 35-45 分鐘（較複雜方案的 60-90 分鐘）
- <strong>成本透明度</strong>：Microsoft Foundry Models 範例提供清晰成本估算（$50-200 美元/月）
- <strong>學習路徑</strong>：AI 開發者透過 azure-openai-chat 有明確入口
- <strong>文件標準</strong>：預期輸出與驗證步驟保持一致

#### 確認完成
- ✅ Microsoft Foundry Models 範例已能以 `azd up` 完整運作
- ✅ 所有 11 個實作檔案語法正確
- ✅ README 指示符合實際部署體驗
- ✅ 文件連結於超過 8 處已更新
- ✅ 範例索引正確反映 4 個在地範例
- ✅ 表格中無重複外部連結
- ✅ 所有導覽參考均正確

#### 技術實作
- **Microsoft Foundry Models 架構**：採用 gpt-4.1 + Key Vault + Container Apps 模式
- <strong>安全性</strong>：準備好使用 Managed Identity，機密資料存在 Key Vault
- <strong>監控</strong>：整合 Application Insights
- <strong>成本管理</strong>：Token 追蹤與使用優化
- <strong>部署</strong>：單一 `azd up` 指令完成全部設定

### [v3.6.0] - 2025-11-19

#### 主要更新：Container App 部署範例
**此版本導入了使用 Azure Developer CLI (AZD) 的全方位、可生產用途的容器應用部署範例，並提供完整文件且納入學習路徑。**

#### 新增
- **🚀 容器應用範例**：`examples/container-app/` 資料夾下新增本地範例：
  - [主導覽指南](examples/container-app/README.md)：完整容器化部署概述、快速入門、生產環境與進階方案
  - [簡易 Flask API](../../examples/container-app/simple-flask-api)：友善初學者的 REST API，具備 scale-to-zero、健康檢查、監控和疑難排解
  - [微服務架構](../../examples/container-app/microservices)：生產等級的多服務部署（API Gateway、產品、訂單、用戶、通知），非同步訊息、Service Bus、Cosmos DB、Azure SQL、分散式追蹤、藍綠/金絲雀部署
- <strong>最佳實務</strong>：針對容器工作負載的安全性、監控、成本優化與 CI/CD 指南
- <strong>程式碼範例</strong>：完整 `azure.yaml`、Bicep 模板與多語言服務實作（Python、Node.js、C#、Go）
- <strong>測試與疑難排除</strong>：端對端測試情境、監控指令、疑難排除指導

#### 變更
- **README.md**：更新特色與連結於「本地範例 - 容器應用」底下的新範例
- **examples/README.md**：更新強調容器應用範例，新增比較矩陣條目，更新技術與架構參考
- <strong>課程大綱與學習指南</strong>：更新引用新容器應用範例及部署模式於相關章節

#### 確認完成
- ✅ 所有新範例皆可用 `azd up` 部署並符合最佳實務
- ✅ 文件交叉連結與導覽已更新
- ✅ 範例涵蓋從初學者到進階情境，含生產微服務

#### 備註
- <strong>範圍</strong>：僅限英文版文件和範例
- <strong>後續步驟</strong>：未來版本擴充更多先進容器模式與 CI/CD 自動化

### [v3.5.0] - 2025-11-19

#### 產品品牌更新：Microsoft Foundry
**此版本全面將「Microsoft Foundry」產品名稱更新，反映微軟官方品牌調整，涵蓋所有英文文件。**

#### 變更
- **🔄 產品名稱更新**：完整由「Microsoft Foundry」更名為「Microsoft Foundry」
  - 更新 `docs/` 資料夾內所有英文文件相關引用
  - 資料夾重命名：`docs/ai-foundry/` → `docs/microsoft-foundry/`
  - 文件重新命名：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 共計 7 個文件中 23 處內容鏈結已更新

- **📁 資料夾結構變更**：
  - `docs/ai-foundry/` 已改名為 `docs/microsoft-foundry/`
  - 所有交叉引用已更新為新資料夾路徑
  - 全文件導覽連結通過驗證

- **📄 文件重新命名**：
  - `azure-ai-foundry-integration.md` 改為 `microsoft-foundry-integration.md`
  - 全部內部連結皆已更新為新版檔名

#### 已更新文件
- <strong>章節文件</strong>（7 個檔案）：
  - `docs/microsoft-foundry/ai-model-deployment.md` - 更新 3 處導覽連結
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 處產品名稱引用更新
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - 已使用 Microsoft Foundry（先前已更新）
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 處更新（概述、社群反饋、文件）
  - `docs/getting-started/azd-basics.md` - 更新 4 處交叉引用
  - `docs/getting-started/first-project.md` - 更新 2 處章節導覽連結
  - `docs/getting-started/installation.md` - 更新 2 處下一章連結
  - `docs/troubleshooting/ai-troubleshooting.md` - 更新 3 處（導覽、Discord 社群）
  - `docs/troubleshooting/common-issues.md` - 1 處導覽連結更新
  - `docs/troubleshooting/debugging.md` - 1 處導覽連結更新

- <strong>課程結構文件</strong>（2 個檔案）：
  - `README.md` - 17 處引用更新（課程總覽、章節標題、模板區、社群洞察）
  - `course-outline.md` - 14 處引用更新（總覽、學習目標、章節資源）

#### 確認完成
- ✅ 英文文件中已無所有「ai-foundry」資料夾路徑残留
- ✅ 英文文件中已無「Microsoft Foundry」舊產品名稱殘留
- ✅ 所有導覽連結於新資料夾結構下均正常
- ✅ 檔案及資料夾重新命名成功完成
- ✅ 章節間交叉引用通過驗證

#### 備註
- <strong>適用範圍</strong>：僅對 `docs/` 資料夾內英文文件套用變更
- <strong>翻譯</strong>：本版本未同步更新翻譯資料夾（`translations/`）
- <strong>研討會</strong>：本版本未同步更新研討會材料（`workshop/`）
- <strong>範例</strong>：範例檔案可能仍有舊命名引用（將於未來版本修正）
- <strong>外部連結</strong>：外部 URL 與 GitHub 專案連結保持不變

#### 貢獻者遷移指引
若您有本地分支或文件仍引用舊結構：
1. 更新資料夾參考：`docs/ai-foundry/` → `docs/microsoft-foundry/`
2. 更新文件參考：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. 替換產品名稱：「Microsoft Foundry」 → 「Microsoft Foundry」
4. 驗證所有內部文件連結均可正常運作

---

### [v3.4.0] - 2025-10-24

#### 基礎設施預覽與驗證強化
**此版本全面支援全新 Azure Developer CLI 預覽功能，並提升研討會用戶體驗。**

#### 新增
- **🧪 azd provision --preview 功能文件**：全面說明新的基礎設施預覽能力
  - 指令參考及用法範例收錄於快速參考表
  - 在配置指南詳細說明整合、使用場景與效益
  - 加入預先檢查功能以提升部署安全性
  - 入門指引更新，強調安全部署實踐
- **🚧 研討會狀態橫幅**：專業 HTML 橫幅，顯示研討會開發狀態
  - 漸層設計與建設指示，清楚傳達用戶資訊
  - 最近更新時間戳彰顯透明度
  - 支援手機響應式設計，適合各類裝置

#### 強化
- <strong>基礎設施安全</strong>：預覽功能融入整個部署文件
- <strong>部署前驗證</strong>：自動化腳本新增基礎設施預覽測試
- <strong>開發者工作流程</strong>：更新指令序列，將預覽納入最佳實務
- <strong>研討會體驗</strong>：明確設定用戶對內容開發狀態的期待

#### 變更
- <strong>部署最佳實務</strong>：推薦以預覽為優先流程
- <strong>文件流程</strong>：學習流程提前涵蓋基礎設施驗證
- <strong>研討會呈現</strong>：專業狀態溝通並明確開發時程

#### 改善
- <strong>安全優先措辭</strong>：可於部署前驗證基礎設施變更
- <strong>團隊協作</strong>：可分享預覽結果以供審核與批准
- <strong>成本意識</strong>：提前了解資源成本
- <strong>風險降低</strong>：透過預先驗證減少部署失敗

#### 技術實作
- <strong>多文件整合</strong>：預覽功能涵蓋 4 個關鍵文件
- <strong>指令模式</strong>：文件內一致的語法與範例
- <strong>最佳實務整合</strong>：預覽納入驗證工作流程與腳本
- <strong>視覺標示</strong>：清楚標記新功能便於發現

#### 研討會基礎設施
- <strong>狀態溝通</strong>：專業 HTML 橫幅附漸層風格
- <strong>用戶體驗</strong>：明確的開發狀態避免混淆
- <strong>專業呈現</strong>：維持資源庫信譽並設定期望
- <strong>時程透明</strong>：標示 2025 年 10 月最後更新時間

### [v3.3.0] - 2025-09-24

#### 強化研討會材料與互動式學習體驗
**本版本導入了完整的研討會教材，瀏覽器互動式導引及結構化學習路徑。**

#### 新增
- **🎥 互動研討會導引**：具 MkDocs 預覽能力的瀏覽器式研討會體驗
- **📝 研討會結構化指令**：7 步驟引導式學習路徑，涵蓋探索到客製化
  - 0-介紹：研討會總覽與環境設定
  - 1-選擇 AI 模板：模板發掘與選擇流程
  - 2-驗證 AI 模板：部署與驗證程序
  - 3-解析 AI 模板：了解模板架構
  - 4-設定 AI 模板：配置與自訂
  - 5-客製化 AI 模板：高階修改與迭代
  - 6-拆除基礎設施：清理與資源管理
  - 7-結語：總結與後續步驟
- **🛠️ 研討會工具**：MkDocs 配置使用 Material 主題以提升學習體驗
- **🎯 實作學習路徑**：3 步驟法（探索 → 部署 → 客製化）
- **📱 GitHub Codespaces 整合**：無縫開發環境設定

#### 強化
- **AI 研討會實驗室**：擴充為完整 2-3 小時結構化學習體驗
- <strong>研討會文件</strong>：專業呈現，具導航與視覺輔助
- <strong>學習進度</strong>：明確指引從模板選擇到生產部署的步驟
- <strong>開發者體驗</strong>：整合工具促進流暢開發流程

#### 改善
- <strong>易用性</strong>：瀏覽器介面具搜尋、複製與主題切換功能
- <strong>自主學習</strong>：靈活結構適應不同學習速度
- <strong>實務應用</strong>：真實 AI 模板部署案例
- <strong>社群整合</strong>：Discord 支援研討會協作

#### 研討會特色
- <strong>內建搜尋</strong>：快速關鍵字與課程搜尋
- <strong>複製程式碼區塊</strong>：滑鼠懸停即顯示複製功能
- <strong>主題切換</strong>：支援深色／淺色模式切換
- <strong>視覺資源</strong>：螢幕截圖與圖表強化理解
- <strong>協助整合</strong>：直接連結 Discord 取得社群支援

### [v3.2.0] - 2025-09-17

#### 重大導航重構與章節制學習系統
**本版本推出完整章節制學習架構，並強化整個資源庫的導航系統。**

#### 新增
- **📚 章節制學習系統**：將整個課程重構為 8 個漸進學習章節
  - 第 1 章：基礎與快速入門（⭐ - 30-45 分鐘）
  - 第 2 章：AI 優先開發（⭐⭐ - 1-2 小時）
  - 第 3 章：設定與身分驗證（⭐⭐ - 45-60 分鐘）
  - 第 4 章：基礎設施即程式碼與部署（⭐⭐⭐ - 1-1.5 小時）
  - 第 5 章：多代理 AI 解決方案（⭐⭐⭐⭐ - 2-3 小時）
  - 第 6 章：部署前驗證與規劃（⭐⭐ - 1 小時）
  - 第 7 章：問題排解與調試（⭐⭐ - 1-1.5 小時）
  - 第 8 章：生產與企業模式（⭐⭐⭐⭐ - 2-3 小時）
- **📚 全面導航系統**：所有文件採用一致的導覽標頭與頁腳
- **🎯 進度追蹤**：課程完成檢核表與學習驗證系統
- **🗺️ 學習路徑指引**：為不同經驗層級及目標提供清晰入口
- **🔗 交叉參照導航**：清楚連結相關章節及先決條件

#### 強化
- **README 結構**：改為章節制組織的結構化學習平台
- <strong>文件導覽</strong>：每頁皆含章節上下文及進度指引
- <strong>模板組織</strong>：範例與模板精確對應至適當學習章節

- <strong>資源整合</strong>：連結至相關章節的速查表、常見問題及學習指南
- <strong>工作坊整合</strong>：對應多個章節學習目標的實作實驗

#### 變更內容
- <strong>學習進程</strong>：從線性文件轉為彈性的章節式學習
- <strong>配置位置</strong>：將配置指南重新安排為第 3 章以提升學習流程
- **AI 內容整合**：在整個學習旅程中更佳整合 AI 專屬內容
- <strong>生產內容</strong>：企業學習者的進階模式整合於第 8 章

#### 改善內容
- <strong>使用者體驗</strong>：清晰的導覽麵包屑與章節進度指示
- <strong>無障礙</strong>：一致性的導覽模式方便課程瀏覽
- <strong>專業展示</strong>：大學風格課程架構，適合學術及企業培訓
- <strong>學習效率</strong>：透過組織優化縮短查找相關內容的時間

#### 技術實作
- <strong>導覽頁首</strong>：標準化 40 多份文件的章節導覽
- <strong>頁尾導覽</strong>：一致性的進度引導與章節完成指示
- <strong>交叉連結</strong>：全面的內部連結系統連接相關概念
- <strong>章節對應</strong>：模板與範例明確連結到學習目標

#### 學習指南增強
- **📚 全面學習目標**：重組學習指南以符合 8 章系統
- **🎯 章節式評量**：每個章節包含具體學習目標與實務練習
- **📋 進度追蹤**：具備週學習計劃、可量化成果及完成清單
- **❓ 評量問題**：每章提供專業成效的知識驗證問題
- **🛠️ 實務練習**：含真實部署場景與故障排除的實作活動
- **📊 技能進階**：從基礎概念至企業模式，聚焦職涯發展
- **🎓 認證框架**：專業發展成果和社群認可系統
- **⏱️ 時程管理**：結構化 10 週學習計劃及里程碑驗證

### [v3.1.0] - 2025-09-17

#### 強化多代理 AI 解決方案
**此版本改進多代理零售解決方案，提升代理命名清晰度與文件完善度。**

#### 變更內容
- <strong>多代理術語</strong>：整個零售多代理解決方案中將「Cora 代理」更改為「客戶代理」以提升理解
- <strong>代理架構</strong>：更新所有文件、ARM 範本及程式範例統一使用「客戶代理」命名
- <strong>配置範例</strong>：現代化代理配置模式並更新命名規則
- <strong>文件一致性</strong>：確保所有引用皆使用專業且具描述性的代理名稱

#### 強化內容
- **ARM 範本套件**：更新零售多代理 ARM 範本以反映客戶代理命名
- <strong>架構圖</strong>：更新 Mermaid 架構圖以新代理命名
- <strong>程式範例</strong>：Python 類別及實作範例改用 CustomerAgent 命名
- <strong>環境變數</strong>：更新所有部署腳本，使其採用 CUSTOMER_AGENT_NAME 命名慣例

#### 改善內容
- <strong>開發者體驗</strong>：文件中代理角色與職責更為明確
- <strong>生產準備度</strong>：更符合企業命名慣例
- <strong>學習材料</strong>：教育用途下代理命名更直覺
- <strong>範本易用性</strong>：簡化代理功能與部署模式的理解

#### 技術細節
- 更新 Mermaid 架構圖以反映 CustomerAgent 參考
- Python 範例中將 CoraAgent 類名稱替換為 CustomerAgent
- 修改 ARM 範本 JSON 配置，將代理類型改為「customer」
- 將環境變數從 CORA_AGENT_* 更新為 CUSTOMER_AGENT_* 模式
- 刷新所有部署指令與容器配置

### [v3.0.0] - 2025-09-12

#### 重大變更 — AI 開發者聚焦與 Microsoft Foundry 整合
**此版本將儲存庫轉型為全面的 AI 專注學習資源，整合 Microsoft Foundry。**

#### 新增內容
- **🤖 AI 優先學習路徑**：完整重構，優先考量 AI 開發者與工程師
- **Microsoft Foundry 整合指南**：完整文件說明如何連結 AZD 與 Microsoft Foundry 服務
- **AI 模型部署模式**：詳細指導模型選擇、配置及生產部署策略
- **AI 工作坊實驗**：2-3 小時的實作工作坊，將 AI 應用轉換為 AZD 可部署解決方案
- **生產 AI 最佳實務**：企業級擴展、監控及安全模式
- **AI 專屬故障排除指南**：涵蓋 Microsoft Foundry 模型、認知服務及 AI 部署問題
- **AI 範本庫**：Microsoft Foundry 範本精選及複雜度評等
- <strong>工作坊教材</strong>：完整工作坊結構，包含實作實驗及參考資料

#### 強化內容
- **README 結構**：以 AI 開發者為焦點，基於 Microsoft Foundry Discord 45% 社群興趣資料
- <strong>學習路徑</strong>：專屬 AI 開發者旅程，並行學生及 DevOps 工程師傳統路徑
- <strong>範本推薦</strong>：特色 AI 範本包括 azure-search-openai-demo、contoso-chat 及 openai-chat-app-quickstart
- <strong>社群整合</strong>：增強 Discord 社群支援，包含 AI 專屬頻道與討論

#### 安全與生產焦點
- <strong>受控身份模式</strong>：AI 專屬驗證及安全配置
- <strong>成本優化</strong>：AI 工作負載的令牌使用追蹤與預算控制
- <strong>跨區部署</strong>：全球 AI 應用部署策略
- <strong>性能監控</strong>：AI 專屬指標與 Application Insights 整合

#### 文件品質
- <strong>線性課程架構</strong>：從初學到進階 AI 部署模式的邏輯進程
- **驗證過的 URL**：所有外部儲存庫連結已驗證可用
- <strong>完整參考資料</strong>：所有內部文件連結經過驗證可用
- <strong>生產準備</strong>：具有真實案例的企業部署模式

### [v2.0.0] - 2025-09-09

#### 重大變更 — 儲存庫重構與專業化提升
**此版本代表儲存庫架構及內容呈現的大幅改造。**

#### 新增內容
- <strong>結構化學習框架</strong>：所有文件頁面包含介紹、學習目標與學習成效段落
- <strong>導覽系統</strong>：新增遍及所有文件的上一課/下一課連結，協助導引學習進程
- <strong>學習指南</strong>：完整 study-guide.md，具備學習目標、實作練習與評量材料
- <strong>專業呈現</strong>：移除所有表情符號圖示，以提升無障礙及專業外觀
- <strong>內容結構強化</strong>：改善學習材料的組織及流程

#### 變更內容
- <strong>文件格式</strong>：所有文件標準化為一致的學習導向結構
- <strong>導覽流程</strong>：實作所有學習材料的邏輯進程
- <strong>內容呈現</strong>：去除裝飾元素，改以清晰且專業的格式呈現
- <strong>連結結構</strong>：更新所有內部連結以支持新導覽系統

#### 改善內容
- <strong>無障礙</strong>：移除表情符號依賴，提升螢幕閱讀器相容性
- <strong>專業外觀</strong>：乾淨、學術風格呈現，適合企業學習環境
- <strong>學習體驗</strong>：結構化方法，明確每堂課目標與成效
- <strong>內容組織</strong>：提升相關主題間的邏輯流與連結

### [v1.0.0] - 2025-09-09

#### 初版釋出 — 全面 AZD 學習儲存庫

#### 新增內容
- <strong>核心文件架構</strong>
  - 完整的入門指南系列
  - 全面的部署與佈建文件
  - 詳細的故障排除資源與偵錯指南
  - 部署前驗證工具與程序

- <strong>入門模組</strong>
  - AZD 基礎：核心概念與術語
  - 安裝指南：平台專屬設定指示
  - 配置指南：環境設定與驗證
  - 第一個專案教學：逐步實作學習

- <strong>部署與佈建模組</strong>
  - 部署指南：完整工作流程文件
  - 佈建指南：以 Bicep 為基礎的基礎建設即程式碼
  - 生產部署最佳實務
  - 多服務架構模式

- <strong>部署前驗證模組</strong>
  - 容量規劃：Azure 資源可用性驗證
  - SKU 選擇：完整服務階層指引
  - 預檢點檢查：自動驗證腳本（PowerShell 與 Bash）
  - 成本估算與預算規劃工具

- <strong>故障排除模組</strong>
  - 常見問題：頻繁問題與解決方案
  - 偵錯指南：系統性故障排除方法論
  - 進階診斷技術與工具
  - 性能監控與優化

- <strong>資源與參考資料</strong>
  - 指令速查表：重要指令快速參考
  - 詞彙表：全面的術語與縮寫解釋
  - 常見問題：詳細解答常見疑問
  - 外部資源連結與社群連結

- <strong>範例與範本</strong>
  - 簡易 Web 應用程式範例
  - 靜態網站部署範本
  - 容器應用配置
  - 資料庫整合模式
  - 微服務架構範例
  - 無伺服器函式實作

#### 功能特色
- <strong>多平台支援</strong>：Windows、macOS 與 Linux 安裝與配置指南
- <strong>多種技能層級</strong>：內容涵蓋學生至專業開發者
- <strong>實務導向</strong>：實作範例與真實場景
- <strong>全面涵蓋</strong>：從基礎概念到進階企業模式
- <strong>安全優先</strong>：整合安全最佳實務
- <strong>成本優化</strong>：提供成本效益部署與資源管理指導

#### 文件品質
- <strong>詳細程式範例</strong>：實用且經測試的程式範本
- <strong>逐步指導</strong>：清晰且可操作的步驟說明
- <strong>全面錯誤處理</strong>：常見問題的故障排除指引
- <strong>最佳實務整合</strong>：業界標準與建議
- <strong>版本相容性</strong>：更新至最新 Azure 服務及 azd 功能

## 未來計劃增強功能

### 版本 3.1.0（規劃中）
#### AI 平台擴展
- <strong>多模型支援</strong>：整合 Hugging Face、Azure Machine Learning 及自訂模型的模式
- **AI 代理框架**：LangChain、Semantic Kernel 與 AutoGen 部署範本
- **進階 RAG 模式**：Azure AI Search 之外的向量資料庫選項（Pinecone、Weaviate 等）
- **AI 可觀察性**：加強模型性能、令牌使用及回應品質監控

#### 開發者體驗
- **VS Code 擴充功能**：整合 AZD 與 Microsoft Foundry 的開發體驗
- **GitHub Copilot 整合**：AI 輔助 AZD 範本生成
- <strong>互動式教學</strong>：AI 場景的實作練習與自動驗證
- <strong>影片內容</strong>：針對視覺學習者的 AI 部署補充教學影片

### 版本 4.0.0（規劃中）
#### 企業 AI 模式
- <strong>治理架構</strong>：AI 模型治理、合規與稽核軌跡
- **多租戶 AI**：服務多位客戶並隔離 AI 服務的模式
- **邊緣 AI 部署**：結合 Azure IoT Edge 與容器實例
- **混合雲 AI**：多雲與混合部署 AI 工作負載的模式

#### 進階功能
- **AI 流程自動化**：與 Azure Machine Learning 管線的 MLOps 整合
- <strong>進階安全性</strong>：零信任模式、私有端點及進階威脅防護
- <strong>性能優化</strong>：高吞吐率 AI 應用的高級調校與擴展策略
- <strong>全球分發</strong>：AI 應用的內容傳遞與邊緣快取模式

### 版本 3.0.0（規劃）— 已被現行版本取代
#### 建議新增功能—現已在 v3.0.0 實作
- ✅ **AI 專注內容**：全面 Microsoft Foundry 整合（已完成）
- ✅ <strong>互動式教學</strong>：實作 AI 工作坊實驗室（已完成）
- ✅ <strong>進階安全模組</strong>：AI 專屬安全模式（已完成）
- ✅ <strong>性能優化</strong>：AI 工作負載調校策略（已完成）

### 版本 2.1.0（規劃）— 部分已在 v3.0.0 實作
#### 小幅強化—部分於目前版本完成
- ✅ <strong>額外範例</strong>：AI 專屬部署情境（已完成）
- ✅ <strong>擴展常見問題</strong>：針對 AI 的問題與故障排除（已完成）
- <strong>工具整合</strong>：改善 IDE 與編輯器整合指引
- ✅ <strong>監控擴展</strong>：AI 專屬監控與警示模式（已完成）

#### 未來發布計劃
- <strong>行動友善文件</strong>：響應式設計以利行動學習
- <strong>離線存取</strong>：可下載文件包
- **強化 IDE 整合**：AZD + AI 工作流程的 VS Code 擴充功能
- <strong>社群儀表板</strong>：即時社群指標與貢獻追蹤

## 為變更日誌貢獻

### 回報變更
在貢獻此儲存庫時，請確保變更日誌條目包含：

1. <strong>版本號</strong>：遵循語義版本控制（主版本.次版本.修訂）
2. <strong>日期</strong>：釋出或更新日期，格式為 YYYY-MM-DD
3. <strong>分類</strong>：新增、變更、棄用、移除、修正、安全
4. <strong>清晰描述</strong>：簡潔說明變更內容
5. <strong>影響評估</strong>：變更對現有使用者的影響

### 變更分類

#### 新增
- 新功能、文件段落或能力新增
- 新範例、範本或學習資源
- 額外工具、腳本或實用程式

#### 變更
- 已有功能或文件的修改
- 改善清晰度或準確性的更新
- 內容或組織架構重組

#### 棄用
- 即將淘汰的功能或方法
- 預計移除的文件段落
- 有更佳替代方案的方法

#### 移除
- 不再相關的功能、文件或範例
- 過時資訊或棄用方法
- 重複或整合內容

#### 修正
- 文件或程式碼錯誤的修正
- 已回報問題或缺陷的解決
- 準確度或功能性的改進


#### 安全性
- 與安全相關的改進或修正
- 安全最佳實踐的更新
- 安全漏洞的解決

### 語義版本指引

#### 主要版本 (X.0.0)
- 需要使用者採取行動的重大更改
- 內容或組織架構的重大重組
- 變更根本方法或方法論的更改

#### 次要版本 (X.Y.0)
- 新增功能或內容
- 保持向後相容的增強功能
- 額外範例、工具或資源

#### 修補版本 (X.Y.Z)
- 錯誤修正和更正
- 現有內容的小幅改進
- 澄清和小型增強

## 社群反饋及建議

我們積極鼓勵社群反饋以改進此學習資源：

### 如何提供反饋
- **GitHub 問題追蹤**：回報問題或建議改進（歡迎 AI 相關問題）
- **Discord 討論**：分享想法並與 Microsoft Foundry 社群互動
- <strong>拉取請求</strong>：直接貢獻內容改進，特別是 AI 範本和指南
- **Microsoft Foundry Discord**：參與 #Azure 頻道的 AZD + AI 討論
- <strong>社群論壇</strong>：參與更廣泛的 Azure 開發者討論

### 反饋類別
- **AI 內容準確性**：修正 AI 服務整合和部署資訊
- <strong>學習體驗</strong>：針對 AI 開發者學習流程的改進建議
- **缺少的 AI 內容**：要求新增 AI 範本、模式或範例
- <strong>無障礙設計</strong>：改善多元學習需求
- **AI 工具整合**：建議更佳的 AI 開發工作流程整合
- **生產 AI 模式**：企業 AI 部署模式需求

### 回應承諾
- <strong>問題回應</strong>：報告的問題在 48 小時內回覆
- <strong>功能請求</strong>：一週內評估
- <strong>社群貢獻</strong>：一週內審查
- <strong>安全問題</strong>：立即優先處理並加速回應

## 維護時間表

### 定期更新
- <strong>每月檢視</strong>：內容準確性與連結驗證
- <strong>每季更新</strong>：主要內容新增及改進
- <strong>每半年檢視</strong>：全面重組與增強
- <strong>每年發布</strong>：主要版本升級與重大改進

### 監控與品質保證
- <strong>自動測試</strong>：定期驗證程式碼範例和連結
- <strong>社群反饋整合</strong>：定期納入用戶建議
- <strong>技術更新</strong>：配合最新 Azure 服務與 azd 發布
- <strong>無障礙審查</strong>：定期審核包容性設計原則

## 版本支援政策

### 目前版本支援
- <strong>最新主要版本</strong>：完整支援與定期更新
- <strong>前一主要版本</strong>：12 個月安全更新與重要修正
- <strong>舊版版本</strong>：僅社群支援，無官方更新

### 遷移指引
當發布主要版本時，我們提供：
- <strong>遷移指南</strong>：逐步轉換指示
- <strong>相容性說明</strong>：破壞性變更詳情
- <strong>工具支援</strong>：協助遷移的腳本或工具
- <strong>社群支援</strong>：專屬論壇解答遷移問題

---

<strong>導航</strong>
- <strong>上一課</strong>：[學習指南](resources/study-guide.md)
- <strong>下一課</strong>：回到[主 README](README.md)

<strong>保持更新</strong>：追蹤此儲存庫以接收新版本和學習材料重要更新通知。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->