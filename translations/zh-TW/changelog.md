# 變更紀錄 - AZD For Beginners

## 介紹

此變更紀錄文件記錄 AZD For Beginners 儲存庫所有顯著的變更、更新與改進。我們遵循語意版本控制原則並維護此日誌，以便協助使用者了解各版本之間的變化。

## 學習目標

透過檢閱此變更紀錄，您將能夠：
- 隨時掌握新增功能與內容
- 了解現有文件的改進項目
- 追蹤錯誤修正與更正以確保準確性
- 追蹤學習資料隨時間的演進

## 學習成果

在檢閱變更紀錄條目後，您將能夠：
- 辨識可用的新增內容與學習資源
- 了解哪些章節已被更新或改善
- 根據最新教材規劃您的學習路徑
- 對未來改進提供回饋與建議

## 版本歷史

### [v3.17.0] - 2026-02-05

#### 課程導覽強化
**此版本改進了 README.md 的章節導覽，採用更強化的表格格式。**

#### 已變更
- **課程地圖表格**: 增強為包含直接課程連結、預估時長與複雜度評分
- **資料夾清理**: 移除了冗餘的舊資料夾 (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **連結驗證**: 已驗證課程地圖表格中的所有 21+ 個內部連結

### [v3.16.0] - 2026-02-05

#### 產品名稱更新
**此版本將產品參考更新為目前的 Microsoft 品牌命名。**

#### 已變更
- **Azure AI Foundry → Microsoft Foundry**: 所有參考已在非翻譯檔案中更新
- **Azure AI Agent Service → Foundry Agents**: 服務名稱已更新以反映目前品牌

#### 已更新的檔案
- `README.md` - 主課程入口頁
- `changelog.md` - 版本歷史
- `course-outline.md` - 課程結構
- `docs/chapter-02-ai-development/agents.md` - AI agents 指南
- `examples/README.md` - 範例文件
- `workshop/README.md` - 工作坊入口頁
- `workshop/docs/index.md` - 工作坊索引
- `workshop/docs/instructions/*.md` - 所有工作坊教學檔案

---

### [v3.15.0] - 2026-02-05

#### 主要儲存庫重組：以章節為基礎的資料夾名稱
**此版本將文件重組為專屬的章節資料夾，以利更清楚的導覽。**

#### 資料夾重新命名
舊資料夾已被章節編號的資料夾取代：
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- 已新增: `docs/chapter-05-multi-agent/`

#### 檔案遷移
| 檔案 | From | To |
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
- **📚 章節 README 檔案**: 在每個章節資料夾中建立 README.md，內容包含：
  - 學習目標與時長
  - 含描述的課程表格
  - 快速啟動指令
  - 導覽至其他章節

#### 已變更
- **🔗 更新所有內部連結**: 已於所有文件中更新 78+ 個路徑
- **🗺️ 主 README.md**: 使用新的章節結構更新課程地圖
- **📝 examples/README.md**: 更新對章節資料夾的交叉參考

#### 已移除
- 舊的資料夾結構 (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### 儲存庫重組：章節導覽
**此版本新增章節導覽 README 檔案（已被 v3.15.0 取代）。**

---

### [v3.13.0] - 2026-02-05

#### 新增 AI Agents 指南
**此版本新增一份完整指南，說明如何使用 Azure Developer CLI 部署 AI 代理。**

#### 新增
- **🤖 docs/microsoft-foundry/agents.md**: 完整指南，涵蓋：
  - AI 代理是什麼以及它們如何不同於聊天機器人
  - 三個快速上手代理範本 (Foundry Agents, Prompty, RAG)
  - 代理架構模式（單一代理、RAG、多人代理）
  - 工具設定與客製化
  - 監控與度量追蹤
  - 成本考量與優化
  - 常見故障排除情境
  - 三個實作練習與成功準則

#### 內容結構
- **介紹**: 為初學者說明代理概念
- **快速上手**: 使用 `azd init --template get-started-with-ai-agents` 部署代理
- **架構模式**: 代理模式的視覺化圖示
- **設定**: 工具設定與環境變數
- **監控**: 與 Application Insights 整合
- **練習**: 漸進式的動手學習 (每項 20-45 分鐘)

---

### [v3.12.0] - 2026-02-05

#### DevContainer 環境更新
**此版本更新了開發容器設定，採用較現代化的工具與更佳的預設值，以改善 AZD 的學習體驗。**

#### 已變更
- **🐳 基底映像**: 從 `python:3.12-bullseye` 更新為 `python:3.12-bookworm` (最新的 Debian 穩定版)
- **📛 容器名稱**: 由 "Python 3" 重新命名為 "AZD for Beginners" 以提升清晰度

#### 新增
- **🔧 新的開發容器功能**:
  - `azure-cli` 並啟用 Bicep 支援
  - `node:20` (AZD 範本的 LTS 版本)
  - `github-cli` 以便範本管理
  - `docker-in-docker` 用於 Container App 部署

- **🔌 通訊埠轉發**: 預配置常見開發用通訊埠：
  - 8000 (MkDocs 預覽)
  - 3000 (Web 應用)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 新增 VS Code 擴充套件**:
  - ms-python.vscode-pylance - 強化的 Python 智慧提示
  - ms-azuretools.vscode-azurefunctions - Azure Functions 支援
  - ms-azuretools.vscode-docker - Docker 支援
  - ms-azuretools.vscode-bicep - Bicep 語言支援
  - ms-azure-devtools.azure-resource-groups - Azure 資源管理
  - yzhang.markdown-all-in-one - Markdown 編輯
  - DavidAnson.vscode-markdownlint - Markdown 檢查
  - bierner.markdown-mermaid - Mermaid 圖表支援
  - redhat.vscode-yaml - YAML 支援 (for azure.yaml)
  -eamodio.gitlens - Git 視覺化
  -mhutchie.git-graph - Git 歷史檢視

- **⚙️ VS Code 設定**: 新增預設設定，包含 Python 直譯器、儲存時自動格式化與移除多餘空白

- **📦 更新 requirements-dev.txt**:
  - 新增 MkDocs minify 外掛
  - 新增 pre-commit 以提升程式碼品質
  - 新增 Azure SDK 套件 (azure-identity, azure-mgmt-resource)

#### 已修正
- **Post-Create 指令**: 現在會在容器啟動時驗證 AZD 與 Azure CLI 的安裝

---

### [v3.11.0] - 2026-02-05

#### 為初學者優化的 README 大改版
**此版本大幅改進 README.md，使其對初學者更具可讀性，並新增 AI 開發者的重要資源。**

#### 新增
- **🆚 Azure CLI vs AZD 比較**: 清楚說明何時使用各工具並提供實務範例
- **🌟 Awesome AZD 連結集合**: 直接連結到社群範本畫廊與貢獻資源：
  - [超棒的 AZD 資源庫](https://azure.github.io/awesome-azd/) - 200+ 可立即部署的範本
  - [提交範本](https://github.com/Azure/awesome-azd/issues) - 社群貢獻
- **🎯 快速啟動指南**: 簡化為 3 步驟的入門流程 (安裝 → 登入 → 部署)
- **📊 依經驗層級的導覽表**: 依開發者經驗清楚指引從何開始

#### 已變更
- **README 結構**: 重新組織以實現漸進式揭露—重要資訊先行
- **介紹章節**: 重新撰寫以向完全初學者解釋 "The Magic of `azd up`"
- **移除重複內容**: 刪除重複的疑難排解章節
- **疑難排解指令**: 修正 `azd logs` 的參考，改為使用有效的 `azd monitor --logs`

#### 已修正
- **🔐 驗證指令**: 已在 cheat-sheet.md 中新增 `azd auth login` 與 `azd auth logout`
- **無效指令參考**: 已從 README 的疑難排解章節刪除剩餘的 `azd logs`

#### 備註
- **範圍**: 變更已套用於主 README.md 與 resources/cheat-sheet.md
- **目標讀者**: 針對剛接觸 AZD 的開發者所做的改進

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI 命令準確性更新
**此版本修正文件中不存在的 AZD 命令，確保所有程式範例使用有效的 Azure Developer CLI 語法。**

#### 已修正
- **🔧 移除不存在的 AZD 命令**: 對無效命令進行全面稽核與修正：
  - `azd logs` (不存在) → 以 `azd monitor --logs` 或 Azure CLI 替代
  - `azd service` 子命令 (不存在) → 以 `azd show` 與 Azure CLI 替代
  - `azd infra import/export/validate` (不存在) → 已移除或以有效替代方案取代
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` 標誌 (不存在) → 已移除
  - `azd provision --what-if/--rollback` 標誌 (不存在) → 更新為使用 `--preview`
  - `azd config validate` (不存在) → 以 `azd config list` 取代
  - `azd info`, `azd history`, `azd metrics` (不存在) → 已移除

- **📚 已更新以修正命令的檔案**:
  - `resources/cheat-sheet.md`: 指令參考大幅改寫
  - `docs/deployment/deployment-guide.md`: 修正回滾與部署策略
  - `docs/troubleshooting/debugging.md`: 修正日誌分析章節
  - `docs/troubleshooting/common-issues.md`: 更新疑難排解指令
  - `docs/troubleshooting/ai-troubleshooting.md`: 修正 AZD 偵錯章節
  - `docs/getting-started/azd-basics.md`: 修正監控指令
  - `docs/getting-started/first-project.md`: 更新監控與偵錯範例
  - `docs/getting-started/installation.md`: 修正 help 與版本範例
  - `docs/pre-deployment/application-insights.md`: 修正日誌檢視指令
  - `docs/pre-deployment/coordination-patterns.md`: 修正代理偵錯指令

- **📝 版本參考已更新**:
  - `docs/getting-started/installation.md`: 將硬編碼的 `1.5.0` 版本改為通用的 `1.x.x` 並加上 releases 連結

#### 已變更
- **回滾策略**: 文件更新為使用以 Git 為基礎的回滾方式（AZD 本身不提供原生回滾）
- **日誌檢視**: 將 `azd logs` 的參考替換為 `azd monitor --logs`、`azd monitor --live` 與 Azure CLI 指令
- **效能章節**: 移除不存在的平行/增量部署標誌，並提供有效的替代方案

#### 技術細節
- **Valid AZD Commands**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Valid azd monitor Flags**: `--live`, `--logs`, `--overview`
- **Removed Features**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### 注意事項
- **Verification**: Commands validated against Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### 工作坊完成與文件品質更新
**此版本完成互動式工作坊模組，修正所有斷裂的文件連結，並提升 Microsoft AZD 使用者（AI 開發者）的整體內容品質。**

#### 新增
- **📝 CONTRIBUTING.md**: 新的貢獻指南文件，內容包括：
  - 關於回報問題與提出變更的明確說明
  - 新內容的文件標準
  - 程式範例指引與 commit 訊息慣例
  - 社群參與資訊

#### 完成
- **🎯 Workshop Module 7 (Wrap-up)**: 完整完成的結業模組，包含：
  - 工作坊成果的完整摘要
  - 涵蓋 AZD、範本與 AI Foundry 的關鍵概念掌握章節
  - 建議的學習旅程延續方向
  - 依難度分級的工作坊挑戰練習
  - 社群回饋與支援連結

- **📚 Workshop Module 3 (Deconstruct)**: 更新的學習目標，包含：
  - GitHub Copilot 與 MCP servers 啟用指引
  - AZD 範本資料夾結構理解
  - 基礎設施即程式碼 (Bicep) 的組織模式
  - 實作實驗室指示

- **🔧 Workshop Module 6 (Teardown)**: 完成內容包括：
  - 資源清理與成本管理目標
  - `azd down` 用於安全地移除基礎設施
  - 軟刪除的認知服務復原指引
  - 針對 GitHub Copilot 與 Azure Portal 的額外探索提示

#### 修正
- **🔗 已修復的斷鏈接**：已解決 15+ 個內部文件的斷裂連結：
  - `docs/ai-foundry/ai-model-deployment.md`: 修正指向 microsoft-foundry-integration.md 的路徑
  - `docs/troubleshooting/ai-troubleshooting.md`: 修正 ai-model-deployment.md 與 production-ai-practices.md 的路徑
  - `docs/getting-started/first-project.md`: 將不存在的 cicd-integration.md 替換為 deployment-guide.md
  - `examples/retail-scenario.md`: 修正 FAQ 與疑難排解指引的路徑
  - `examples/container-app/microservices/README.md`: 修正課程首頁與部署指南的路徑
  - `resources/faq.md` 與 `resources/glossary.md`: 更新 AI 章節參考
  - `course-outline.md`: 修正教學者指南與 AI 工作坊實驗室的參考

- **📅 工作坊狀態橫幅**：由「施工中」更新為活動中狀態，日期更新為 2026 年 2 月

- **🔗 工作坊導覽**：修正 workshop README.md 中指向不存在 lab-1-azd-basics 資料夾的斷裂導覽連結

#### 變更
- **工作坊簡報**：移除「施工中」警告，工作坊現已完成且可使用
- **導覽一致性**：確保所有工作坊模組具有正確的模組間導覽
- **學習路徑參照**：更新章節交叉參照以使用正確的 microsoft-foundry 路徑

#### 已驗證
- ✅ 所有英文 Markdown 檔案的內部連結皆有效
- ✅ 工作坊模組 0-7 已完成並具備學習目標
- ✅ 章節與模組之間的導覽可正確運作
- ✅ 內容適合使用 Microsoft AZD 的 AI 開發者
- ✅ 維持對初學者友善的語言與結構
- ✅ CONTRIBUTING.md 提供清晰的社群貢獻者指引

#### 技術實作
- **連結驗證**：自動化 PowerShell 腳本驗證所有 .md 的內部連結
- **內容稽核**：手動檢視工作坊完整性與對初學者的適合性
- **導覽系統**：套用一致的章節與模組導覽模式

#### 注意事項
- **範圍**：變更僅套用於英文文件
- **翻譯**：本版未更新翻譯資料夾（自動翻譯將在稍後同步）
- **工作坊時長**：完整工作坊現提供 3–4 小時的實作學習

---

### [v3.8.0] - 2025-11-19

#### 進階文件：監控、安全與多代理模式
**此版本新增關於 Application Insights 整合、驗證模式與多代理協調以支援生產部署的完整 A 級課程內容。**

#### 新增
- **📊 Application Insights Integration Lesson**: 位於 `docs/pre-deployment/application-insights.md`：
  - 以 AZD 為重點的部署與自動化佈建
  - 完整的 Application Insights + Log Analytics Bicep 範本
  - 包含自訂遙測的可運作 Python 應用（1,200+ 行）
  - AI/LLM 監控模式（Azure OpenAI 令牌/成本追蹤）
  - 6 個 Mermaid 圖表（架構、分散式追蹤、遙測流程）
  - 3 個實作練習（警示、儀表板、AI 監控）
  - Kusto 查詢範例與成本優化策略
  - 即時度量串流與即時除錯
  - 40–50 分鐘的學習時間，包含生產就緒模式

- **🔐 Authentication & Security Patterns Lesson**: 位於 `docs/getting-started/authsecurity.md`：
  - 3 種驗證模式（連線字串、Key Vault、managed identity）
  - 用於安全部署的完整 Bicep 基礎設施範本
  - 與 Azure SDK 整合的 Node.js 應用程式碼
  - 3 個完整練習（啟用 managed identity、使用者指派身份、Key Vault 旋轉）
  - 安全最佳實務與 RBAC 設定
  - 疑難排解指引與成本分析
  - 生產就緒的無密碼驗證模式

- **🤖 Multi-Agent Coordination Patterns Lesson**: 位於 `docs/pre-deployment/coordination-patterns.md`：
  - 5 種協調模式（順序、平行、階層、事件驅動、共識）
  - 完整的協調器服務實作（Python/Flask，1,500+ 行）
  - 3 個專門化代理實作（Research、Writer、Editor）
  - 使用 Service Bus 進行訊息佇列整合
  - 使用 Cosmos DB 進行分散式系統狀態管理
  - 顯示代理互動的 6 個 Mermaid 圖表
  - 3 個進階練習（逾時處理、重試邏輯、熔斷器）
  - 成本細目（$240–565/月）與優化策略
  - 與 Application Insights 的監控整合

#### 強化
- **Pre-deployment 章節**：現在包含完整的監控與協調模式
- **Getting Started 章節**：強化專業級驗證模式
- **生產就緒**：從安全到可觀察性的完整覆蓋
- **課程大綱**：已更新以參考第 3 與第 6 章新增課程

#### 變更
- **學習進程**：更好地整合安全與監控於整個課程
- **文件品質**：新課程一致維持 A 級標準（95–97%）
- **生產模式**：企業部署的端到端完整涵蓋

#### 改善
- **開發者體驗**：從開發到生產監控的清晰路徑
- **安全標準**：專業的驗證與機密管理模式
- **可觀察性**：與 AZD 的完整 Application Insights 整合
- **AI 工作負載**：針對 Azure OpenAI 與多代理系統的專門監控

#### 已驗證
- ✅ 所有課程包含可完整運作的程式碼（非片段）
- ✅ 用於視覺學習的 Mermaid 圖表（3 課程共 19 張）
- ✅ 含驗證步驟的實作練習（共 9 個）
- ✅ 可透過 `azd up` 部署的生產就緒 Bicep 範本
- ✅ 成本分析與優化策略
- ✅ 疑難排解指引與最佳實務
- ✅ 含驗證指令的知識檢查點

#### 文件評分結果
- **docs/pre-deployment/application-insights.md**: - 完整的監控指南
- **docs/getting-started/authsecurity.md**: - 專業的安全模式
- **docs/pre-deployment/coordination-patterns.md**: - 進階的多代理架構
- **整體新增內容**: - 一致的高品質標準

#### 技術實作
- **Application Insights**: Log Analytics + 自訂遙測 + 分散式追蹤
- **Authentication**: Managed Identity + Key Vault + RBAC 模式
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + 協調
- **Monitoring**: 即時度量 + Kusto 查詢 + 警示 + 儀表板
- **成本管理**: 取樣策略、保留政策、預算控管

### [v3.7.0] - 2025-11-19

#### 文件品質改善與新增 Azure OpenAI 範例
**此版本提升整個儲存庫的文件品質，並新增一個完整的 Azure OpenAI 部署範例，包含 GPT-4 聊天介面。**

#### 新增
- **🤖 Azure OpenAI Chat Example**: 完整的 GPT-4 部署與在 `examples/azure-openai-chat/` 中的可運作實作：
  - 完整的 Azure OpenAI 基礎設施（GPT-4 模型部署）
  - 具有對話歷史的 Python 命令列聊天介面
  - 使用 Key Vault 做安全的 API 金鑰儲存
  - 令牌使用追蹤與成本估算
  - 流量限制與錯誤處理
  - 詳盡的 README，部署指南需時 35–45 分鐘
  - 11 個可生產使用的檔案（Bicep 範本、Python 應用、設定檔）
- **📚 文件練習**: 在設定指南中加入實作練習：
  - 練習 1：多環境設定（15 分鐘）
  - 練習 2：秘密管理練習（10 分鐘）
  - 明確的成功準則與驗證步驟
- **✅ 部署驗證**：在部署指南中加入驗證章節：
  - 健康檢查程序
  - 成功準則清單
  - 所有部署指令的預期輸出
  - 疑難排解快速參考

#### 強化
- **examples/README.md**: 更新為 A 級品質（93%）：
  - 將 azure-openai-chat 加入到所有相關章節
  - 將本地範例數量從 3 更新為 4
  - 加入至 AI 應用範例表格
  - 整合到進階使用者的快速入門
  - 加入到 Microsoft Foundry 範本章節
  - 更新比較矩陣與技術發現章節
- **文件品質**: 在 docs 資料夾整體由 B+ (87%) 提升至 A- (92%)：
  - 為關鍵指令範例加入預期輸出
  - 包含設定變更的驗證步驟
  - 透過實作練習強化動手學習

#### 變更
- **學習進程**: 更好地整合中階學習者的 AI 範例
- **文件結構**: 提供更可操作的練習並具明確成果
- **驗證流程**: 在主要工作流程加入明確成功準則

#### 改善
- **開發者體驗**: Azure OpenAI 部署現在需時 35–45 分鐘（相較於複雜替代方案的 60–90 分鐘）
- **成本透明度**: 清楚的成本估算（$50–200/月）供 Azure OpenAI 範例參考
- **學習路徑**: 為 AI 開發者提供清晰的入門範例 azure-openai-chat
- **文件標準**: 一致的預期輸出與驗證步驟

#### 已驗證
- ✅ Azure OpenAI 範例可透過 `azd up` 完整運作
- ✅ 所有 11 個實作檔案語法正確
- ✅ README 指示與實際部署經驗相符
- ✅ 文件連結在 8+ 個位置已更新
- ✅ 範例索引準確反映 4 個本地範例
- ✅ 表格中無重複的外部連結
- ✅ 所有導覽參考皆正確

#### 技術實作
- **Azure OpenAI 架構**: GPT-4 + Key Vault + Container Apps 模式
- **安全性**: Managed Identity 已準備、秘密存放於 Key Vault
- **監控**: 與 Application Insights 整合
- **成本管理**: 令牌追蹤與使用優化
- **部署**: 使用單一 `azd up` 指令完成整個設置

### [v3.6.0] - 2025-11-19

#### 重大更新：Container App 部署範例
**此版本新增完整的生產就緒容器應用部署範例，使用 Azure Developer CLI (AZD)，並將其完整文件與學習路徑整合。**

#### 新增
- **🚀 Container App Examples**: 在 `examples/container-app/` 的新本地範例：
  - [Master Guide](examples/container-app/README.md): 關於容器化部署的完整概述、快速上手、進階與生產模式
  - [Simple Flask API](../../examples/container-app/simple-flask-api): 適合初學者的 REST API，包含 scale-to-zero、健康檢查、監控與疑難排解
  - [Microservices Architecture](../../examples/container-app/microservices): 生產就緒的多服務部署（API Gateway、Product、Order、User、Notification）、非同步訊息、Service Bus、Cosmos DB、Azure SQL、分散式追蹤、藍綠/金絲雀部署
- **最佳實務**: 容器化工作負載的安全性、監控、成本優化與 CI/CD 指南
- **程式範例**: 完整的 `azure.yaml`、Bicep 範本與多語言服務實作（Python、Node.js、C#、Go）
- **測試與疑難排解**: 端對端測試情境、監控指令、疑難排解指引

#### 變更
- **README.md**: 已更新以展示並連結新的 container app 範例於「Local Examples - Container Applications」
- **examples/README.md**: 更新以強調 container app 範例，新增比較矩陣條目，並更新技術/架構參考
- **課程大綱與學習指南**：已更新以參考相關章節中的新容器應用範例與部署模式

#### 已驗證
- ✅ 所有新範例均可使用 `azd up` 部署並遵循最佳實務
- ✅ 文件交叉連結與導覽已更新
- ✅ 範例涵蓋從初學者到進階場景，包括生產級微服務

#### 備註
- **範圍**：僅限英文文件與範例
- **後續步驟**：在未來版本中擴充更多進階容器模式與 CI/CD 自動化

### [v3.5.0] - 2025-11-19

#### 產品重新品牌化：Microsoft Foundry
**此版本在所有英文文件中實施全面性的產品名稱變更，將 "Microsoft Foundry" 從 "Microsoft Foundry" 更名，以反映 Microsoft 的官方重新品牌策略。**

#### 變更
- **🔄 產品名稱更新**：完成將 "Microsoft Foundry" 重新品牌為 "Microsoft Foundry"
  - 已更新 `docs/` 資料夾中所有英文文件的引用
  - 重新命名資料夾：`docs/ai-foundry/` → `docs/microsoft-foundry/`
  - 重新命名檔案：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 總計：在 7 個文件中更新了 23 個內容引用

- **📁 資料夾結構變更**：
  - `docs/ai-foundry/` 已重新命名為 `docs/microsoft-foundry/`
  - 已更新所有交叉參考以反映新的資料夾結構
  - 已驗證整個文件中的導覽連結

- **📄 檔案重新命名**：
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 已更新所有內部連結以參照新檔名

#### 更新檔案
- **章節文件**（7 個檔案）：
  - `docs/microsoft-foundry/ai-model-deployment.md` - 更新 3 個導覽連結
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 更新 4 個產品名稱引用
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - 已使用 Microsoft Foundry（先前更新）
  - `docs/microsoft-foundry/production-ai-practices.md` - 更新 3 個引用（概述、社群回饋、文件）
  - `docs/getting-started/azd-basics.md` - 更新 4 個交叉參考連結
  - `docs/getting-started/first-project.md` - 更新 2 個章節導覽連結
  - `docs/getting-started/installation.md` - 更新 2 個下一章節連結
  - `docs/troubleshooting/ai-troubleshooting.md` - 更新 3 個引用（導覽、Discord 社群）
  - `docs/troubleshooting/common-issues.md` - 更新 1 個導覽連結
  - `docs/troubleshooting/debugging.md` - 更新 1 個導覽連結

- **課程結構檔案**（2 個檔案）：
  - `README.md` - 更新 17 個引用（課程概述、章節標題、範本區、社群見解）
  - `course-outline.md` - 更新 14 個引用（概述、學習目標、章節資源）

#### 已驗證
- ✅ 英文文件中不再有任何 "ai-foundry" 資料夾路徑引用
- ✅ 英文文件中不再有任何 "Microsoft Foundry" 產品名稱引用
- ✅ 所有導覽連結在新資料夾結構下均可正常運作
- ✅ 檔案與資料夾重新命名已成功完成
- ✅ 已驗證章節間的交叉參考

#### 備註
- **範圍**：變更僅套用於 `docs/` 資料夾內的英文文件
- **翻譯**：翻譯資料夾（`translations/`）未在此版本中更新
- **工作坊**：工作坊材料（`workshop/`）未在此版本中更新
- **範例**：範例檔案可能仍然參考舊有命名（將在未來更新中處理）
- **外部連結**：外部 URL 與 GitHub 倉儲參考保持不變

#### 給貢獻者的遷移指南
If you have local branches or documentation referencing the old structure:
1. 更新資料夾參考：`docs/ai-foundry/` → `docs/microsoft-foundry/`
2. 更新檔案參考：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. 取代產品名稱："Microsoft Foundry" → "Microsoft Foundry"
4. 驗證所有內部文件連結仍然可用

---

### [v3.4.0] - 2025-10-24

#### 基礎設施預覽與驗證強化
**此版本新增對 Azure Developer CLI 預覽功能的全面支援，並強化工作坊使用者體驗。**

#### 新增
- **🧪 azd provision --preview 功能文件**：全面說明新的基礎設施預覽能力
  - 指令參考與使用範例收錄在速查表中
  - 在佈建指南中詳細整合使用情境與優點
  - 預檢整合以提供更安全的部署驗證
  - 入門指南更新，強調以安全為優先的部署實務
- **🚧 工作坊狀態橫幅**：專業的 HTML 橫幅顯示工作坊開發狀態
  - 漸層設計並帶有施工指示，清楚傳達給使用者
  - 顯示最後更新時間戳以提升透明度
  - 對各類裝置採用行動響應式設計

#### 強化
- **基礎設施安全性**：預覽功能整合至整體部署文件中
- **部署前驗證**：自動化腳本現在包含基礎設施預覽測試
- **開發者工作流程**：更新指令序列，將預覽列為最佳實務
- **工作坊體驗**：讓使用者清楚了解內容開發狀態與期望

#### 變更
- **部署最佳實務**：建議優先採用預覽為主的工作流程
- **文件流程**：將基礎設施驗證前移至學習流程的早期
- **工作坊呈現**：以專業方式溝通狀態並提供明確的開發時程

#### 改善
- **以安全為先的方式**：現在可以在部署前驗證基礎設施變更
- **團隊協作**：可分享預覽結果以便審查與批准
- **成本意識**：在佈建前能更好地理解資源成本
- **風險緩解**：透過預先驗證降低部署失敗的風險

#### 技術實作
- **多文件整合**：在 4 個關鍵檔案中記載預覽功能
- **指令範式**：整個文件中使用一致的語法與範例
- **最佳實務整合**：將預覽納入驗證工作流程與腳本
- **視覺指示**：針對新功能提供明確的 NEW 標示以利發現

#### 工作坊基礎設施
- **狀態傳達**：使用具有漸層樣式的專業 HTML 橫幅
- **使用者體驗**：清楚的開發狀態說明可避免混淆
- **專業呈現**：在設定期望的同時維持倉儲的可信度
- **時程透明**：2025 年 10 月最後更新時間戳以供追溯

### [v3.3.0] - 2025-09-24

#### 擴充的工作坊教材與互動式學習體驗
**此版本導入完整的工作坊教材，包含瀏覽器內互動式導覽與結構化學習路徑。**

#### 新增
- **🎥 互動式工作坊指南**：提供瀏覽器內的工作坊體驗並支援 MkDocs 預覽
- **📝 結構化工作坊指示**：7 步驟導引式學習路徑，從探索到自訂
  - 0-Introduction: 工作坊概述與設定
  - 1-Select-AI-Template: 範本探索與選擇流程
  - 2-Validate-AI-Template: 部署與驗證程序
  - 3-Deconstruct-AI-Template: 了解範本架構
  - 4-Configure-AI-Template: 設定與客製化
  - 5-Customize-AI-Template: 進階修改與迭代
  - 6-Teardown-Infrastructure: 清理與資源管理
  - 7-Wrap-up: 總結與後續步驟
- **🛠️ 工作坊工具鏈**：使用 MkDocs 與 Material 主題的組態，提升學習體驗
- **🎯 實作學習路徑**：三步驟方法論（探索 → 部署 → 客製化）
- **📱 GitHub Codespaces 整合**：無縫的開發環境設定

#### 強化
- **AI 工作坊實驗室**：延伸為 2-3 小時的完整結構化學習體驗
- **工作坊文件**：專業呈現並提供導覽與視覺輔助
- **學習進展**：從範本選擇到生產部署提供清楚的逐步指導
- **開發者體驗**：整合工具以簡化開發工作流程

#### 改善
- **無障礙性**：瀏覽器介面包含搜尋、複製功能與主題切換
- **自我節奏學習**：彈性的工作坊結構適應不同學習速度
- **實務應用**：真實世界的 AI 範本部署情境
- **社群整合**：整合 Discord 提供工作坊支援與協作

#### 工作坊特色
- **內建搜尋**：快速的關鍵字與課程搜尋
- **複製程式區塊**：所有程式碼範例支援滑鼠懸停複製
- **主題切換**：支援深色/淺色模式以符合偏好
- **視覺資產**：截圖與圖表以增進理解
- **說明整合**：直接連結 Discord 取得社群支援

### [v3.2.0] - 2025-09-17

#### 重大導覽重組與章節化學習系統
**此版本導入完整的章節化學習結構，並在整個倉儲中強化導覽功能。**

#### 新增
- **📚 章節化學習系統**：將整個課程重新結構為 8 個漸進式學習章節
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 完整的導覽系統**：在所有文件中加入一致的導覽標頭與頁尾
- **🎯 進度追蹤**：課程完成檢查表與學習驗證系統
- **🗺️ 學習路徑指引**：為不同經驗層級與目標提供清晰的進入點
- **🔗 交叉參考導覽**：將相關章節與先決條件清楚連結

#### 強化
- **README 結構**：轉型為具有章節化組織的結構化學習平台
- **文件導覽**：每頁現在包含章節背景與進度指引
- **範本組織**：範例與範本已對應到適合的學習章節
- **資源整合**：速查表、常見問題與學習指南與相關章節連結
- **工作坊整合**：實作實驗室對應多個章節的學習目標

#### 變更
- **學習進程**：從線性文件轉為彈性的章節化學習
- **設定文件位置**：將設定指南移至第 3 章以改善學習流程
- **AI 內容整合**：在整個學習旅程中更好地整合 AI 專屬內容
- **生產內容**：進階模式集中於第 8 章以供企業學習者使用

#### 改善
- **使用者體驗**：清晰的導覽麵包屑與章節進度指示
- **無障礙性**：一致的導覽模式方便課程瀏覽
- **專業呈現**：大學式的課程結構適用於學術與企業訓練
- **學習效率**：透過改善的組織減少尋找相關內容的時間

#### 技術實作
- **導覽標頭**：在 40+ 個文件中標準化章節導覽
- **頁尾導覽**：提供一致的進度指引與章節完成指示
- **交叉連結**：建立完整的內部連結系統以連接相關概念
- **章節對應**：將範本與範例清楚對應到學習目標

#### 學習指南強化
- **📚 完整的學習目標**：重構學習指南以符合 8 章節系統
- **🎯 章節評量**：每章包含特定學習目標與實務練習
- **📋 進度追蹤**：每週學習計畫附可量化的成果與完成檢查表
- **❓ 評量題目**：每章提供知識驗證問題以達成專業成果
- **🛠️ 實作練習**：包含真實部署情境與除錯的實作活動
- **📊 技能進展**：從基礎概念到企業模式的清晰進階與職涯發展重點
- **🎓 認證架構**：專業發展結果與社群認可系統
- **⏱️ 時程管理**：結構化的 10 週學習計畫與里程碑驗證

### [v3.1.0] - 2025-09-17

#### 強化的多代理 AI 解決方案
**此版本改進零售多代理解決方案，包含更好的代理命名與增強的文件。**

#### 變更
- **多代理術語**：在整個零售多代理解決方案中，將 "Cora agent" 更名為 "Customer agent"，以便更清楚易懂
- **代理架構**：更新所有文件、ARM 範本與程式範例以使用一致的 "Customer agent" 命名
- **設定範例**：以更新後的命名慣例現代化代理設定模式
- **文件一致性**：確保所有引用使用專業且具描述性的代理名稱

#### 強化
- **ARM 範本套件**：在 retail-multiagent-arm-template 中更新為 Customer agent 參考
- **架構圖**：使用更新的代理命名刷新 Mermaid 圖表
- **程式範例**：Python 類別與實作範例現在使用 CustomerAgent 命名
- **環境變數**：更新所有部署腳本以使用 CUSTOMER_AGENT_NAME 慣例

#### 改善
- **Developer Experience**: 文件中更清楚的 agent 角色與責任
- **Production Readiness**: 更符合企業命名慣例
- **Learning Materials**: 更直觀的 agent 命名以利教學用途
- **Template Usability**: 更簡化對 agent 功能與部署範式的理解

#### Technical Details
- 更新了包含 CustomerAgent 參考的 Mermaid 架構圖
- 在 Python 範例中將 CoraAgent 類別名稱替換為 CustomerAgent
- 修改了 ARM 範本 JSON 配置以使用 "customer" agent 類型
- 將環境變數從 CORA_AGENT_* 更改為 CUSTOMER_AGENT_* 模式
- 更新了所有部署命令與容器配置

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**This version transforms the repository into a comprehensive AI-focused learning resource with Microsoft Foundry integration.**

#### Added
- **🤖 AI-First Learning Path**: 完整重構，優先針對 AI 開發者與工程師
- **Microsoft Foundry Integration Guide**: 連接 AZD 與 Microsoft Foundry 服務的完整文件
- **AI Model Deployment Patterns**: 涵蓋模型選擇、配置與生產部署策略的詳細指南
- **AI Workshop Lab**: 2–3 小時的實作工作坊，用於將 AI 應用轉換為可由 AZD 部署的解決方案
- **Production AI Best Practices**: 適用於企業的 AI 工作負載擴展、監控與安全模式
- **AI-Specific Troubleshooting Guide**: 針對 Azure OpenAI、Cognitive Services 與 AI 部署問題的完整故障排除指南
- **AI Template Gallery**: 精選 Microsoft Foundry 範本集合並附上複雜度評分
- **Workshop Materials**: 完整的工作坊結構、實作實驗與參考資料

#### Enhanced
- **README Structure**: 以 AI 開發者為重心，並包含來自 Microsoft Foundry Discord 的 45% 社群興趣數據
- **Learning Paths**: 為 AI 開發者設計的專屬學習旅程，並保留學生與 DevOps 工程師的傳統路徑
- **Template Recommendations**: 精選 AI 範本，包括 azure-search-openai-demo、contoso-chat 與 openai-chat-app-quickstart
- **Community Integration**: 增強的 Discord 社群支援，包含 AI 專屬頻道與討論

#### Security & Production Focus
- **Managed Identity Patterns**: AI 專屬的認證與安全性配置
- **Cost Optimization**: AI 工作負載的 token 使用追蹤與預算控制
- **Multi-Region Deployment**: 全球 AI 應用部署策略
- **Performance Monitoring**: AI 專屬指標與 Application Insights 整合

#### Documentation Quality
- **Linear Course Structure**: 從初學到進階 AI 部署範式的邏輯進程
- **Validated URLs**: 所有外部倉庫連結已驗證並可存取
- **Complete Reference**: 所有內部文件連結已驗證且可用
- **Production Ready**: 含實務範例的企業部署範式

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**This version represents a significant overhaul of the repository structure and content presentation.**

#### Added
- **Structured Learning Framework**: 所有文件頁面現在包含 Introduction、Learning Goals 與 Learning Outcomes 段落
- **Navigation System**: 在所有文件中新增上一頁/下一頁課程連結以導引學習進程
- **Study Guide**: 完整的 study-guide.md，包含學習目標、實作練習與評量素材
- **Professional Presentation**: 移除所有表情符號圖示以提升無障礙性與專業外觀
- **Enhanced Content Structure**: 改善學習材料的組織與流程

#### Changed
- **Documentation Format**: 將所有文件標準化為一致的學習導向結構
- **Navigation Flow**: 在所有學習材料中實作邏輯性的進度流程
- **Content Presentation**: 移除裝飾性元素，改以清晰、專業的版面表現
- **Link Structure**: 更新所有內部連結以支援新的導覽系統

#### Improved
- **Accessibility**: 移除表情符號依賴以提高螢幕閱讀器相容性
- **Professional Appearance**: 乾淨、學術風格的呈現，適合企業學習場景
- **Learning Experience**: 以清楚的目標與成果為每堂課建立結構化學習路徑
- **Content Organization**: 更佳的邏輯流程與主題間連結

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - 完整的入門指南系列
  - 全面的部署與建置文件
  - 詳盡的故障排除資源與除錯指南
  - 部署前驗證工具與程序

- **Getting Started Module**
  - AZD 基礎：核心概念與術語
  - 安裝指南：依平台的設定說明
  - 設定指南：環境設定與認証
  - 第一個專案教程：循序漸進的實作學習

- **Deployment and Provisioning Module**
  - 部署指南：完整的工作流程文件
  - 建置指南：使用 Bicep 的基礎架構即程式碼
  - 生產部署最佳實務
  - 多服務架構模式

- **Pre-deployment Validation Module**
  - 容量規劃：Azure 資源可用性驗證
  - SKU 選擇：完整的服務層級建議
  - 預檢查項目：自動化驗證腳本（PowerShell 與 Bash）
  - 成本估算與預算規劃工具

- **Troubleshooting Module**
  - 常見問題：常見問題與解決方案
  - 除錯指南：系統化的故障排除方法
  - 進階診斷技術與工具
  - 效能監控與優化

- **Resources and References**
  - 指令速查表：重要指令的快速參考
  - 詞彙表：完整術語與縮寫定義
  - 常見問答：針對常見問題的詳細回答
  - 外部資源連結與社群連結

- **Examples and Templates**
  - 簡易 Web 應用範例
  - 靜態網站部署範本
  - 容器化應用配置
  - 資料庫整合範式
  - 微服務架構範例
  - 無伺服器函式實作

#### Features
- **Multi-Platform Support**: Windows、macOS 與 Linux 的安裝與設定指南
- **Multiple Skill Levels**: 適用於學生到專業開發者的內容
- **Practical Focus**: 實作範例與真實世界情境
- **Comprehensive Coverage**: 從基礎概念到進階企業範式
- **Security-First Approach**: 文件中整合安全最佳實務
- **Cost Optimization**: 成本效益部署與資源管理指引

#### Documentation Quality
- **Detailed Code Examples**: 實用且經測試的程式範例
- **Step-by-Step Instructions**: 清楚且可執行的指引
- **Comprehensive Error Handling**: 常見問題的故障排除
- **Best Practices Integration**: 業界標準與建議
- **Version Compatibility**: 與最新 Azure 服務與 azd 功能保持一致

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: 整合 Hugging Face、Azure Machine Learning 與自訂模型的模式
- **AI Agent Frameworks**: LangChain、Semantic Kernel 與 AutoGen 部署範本
- **Advanced RAG Patterns**: 超越 Azure AI Search 的向量資料庫選項（Pinecone、Weaviate 等）
- **AI Observability**: 加強模型效能、token 使用與回應品質的監控

#### Developer Experience
- **VS Code Extension**: 整合 AZD + AI Foundry 的開發體驗
- **GitHub Copilot Integration**: AI 輔助的 AZD 範本生成功能
- **Interactive Tutorials**: 具自動驗證的 AI 情境實作練習
- **Video Content**: 針對 AI 部署的補充影片教學

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: AI 模型治理、合規與稽核軌跡
- **Multi-Tenant AI**: 為多客戶提供隔離 AI 服務的模式
- **Edge AI Deployment**: 與 Azure IoT Edge 與容器實例整合
- **Hybrid Cloud AI**: AI 工作負載的多雲與混合部署模式

#### Advanced Features
- **AI Pipeline Automation**: 與 Azure Machine Learning 管線整合的 MLOps
- **Advanced Security**: 零信任模式、私有端點與進階威脅防護
- **Performance Optimization**: 高吞吐量 AI 應用的進階調校與擴展策略
- **Global Distribution**: AI 應用的內容傳遞與邊緣快取模式

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: 完整的 Microsoft Foundry 整合（已完成）
- ✅ **Interactive Tutorials**: 實作 AI 工作坊實驗（已完成）
- ✅ **Advanced Security Module**: AI 專屬安全模式（已完成）
- ✅ **Performance Optimization**: AI 工作負載調校策略（已完成）

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: 以 AI 為重點的部署情境範例（已完成）
- ✅ **Extended FAQ**: AI 專屬問題與故障排除（已完成）
- **Tool Integration**: 改善的 IDE 與編輯器整合指南
- ✅ **Monitoring Expansion**: AI 專屬的監控與警示模式（已完成）

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: 行動裝置友善的回應式設計
- **Offline Access**: 可下載的文件套件
- **Enhanced IDE Integration**: 支援 AZD + AI 工作流程的 VS Code 延伸功能
- **Community Dashboard**: 即時的社群指標與貢獻追蹤面板

## Contributing to the Changelog

### Reporting Changes
When contributing to this repository, please ensure changelog entries include:

1. **Version Number**: Following semantic versioning (major.minor.patch)
2. **Date**: Release or update date in YYYY-MM-DD format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Concise description of what changed
5. **Impact Assessment**: How changes affect existing users

### Change Categories

#### Added
- 新功能、文件章節或能力
- 新範例、範本或學習資源
- 額外工具、腳本或實用工具

#### Changed
- 對既有功能或文件的修改
- 改善清晰度或準確性的更新
- 內容或組織的重構

#### Deprecated
- 正在逐步淘汰的功能或做法
- 預定移除的文件章節
- 有更好替代方案的方法

#### Removed
- 不再相關的功能、文件或範例
- 過時或已棄用的資訊
- 重複或已整合的內容

#### Fixed
- 文件或程式碼中的錯誤修正
- 已回報問題或故障的解決
- 精確度或功能性的改進

#### Security
- 與安全相關的改進或修補
- 安全最佳實務的更新
- 安全性漏洞的修復

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- 需要使用者採取行動的破壞性變更
- 重大內容或組織結構重整
- 改變基本方法或方法論的變更

#### Minor Version (X.Y.0)
- 新功能或內容新增
- 在維持向後相容的情況下的增強
- 額外的範例、工具或資源

#### Patch Version (X.Y.Z)
- 錯誤修正與修補
- 對既有內容的微小改進
- 澄清與小幅增強

## Community Feedback and Suggestions

We actively encourage community feedback to improve this learning resource:

### How to Provide Feedback
- **GitHub Issues**: 報告問題或建議改進（歡迎 AI 專屬議題）
- **Discord Discussions**: 分享想法並與 Microsoft Foundry 社群互動
- **Pull Requests**: 直接貢獻內容改進，特別是 AI 範本與指南
- **Microsoft Foundry Discord**: 在 #Azure 頻道參與 AZD + AI 討論
- **Community Forums**: 參與更廣泛的 Azure 開發者討論

### Feedback Categories
- **AI Content Accuracy**: 對 AI 服務整合與部署資訊的更正
- **Learning Experience**: 改善 AI 開發者學習流程的建議
- **Missing AI Content**: 需求新增的 AI 範本、模式或範例
- **Accessibility**: 為多元學習需求做出的改進
- **AI Tool Integration**: 改善 AI 開發工作流程整合的建議
- **Production AI Patterns**: 企業 AI 部署模式的需求

### Response Commitment
- **Issue Response**: 在 48 小時內回應已回報的問題
- **Feature Requests**: 在一週內進行評估
- **Community Contributions**: 在一週內進行審查
- **Security Issues**: 優先處理並加速回應

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: 內容準確性與連結驗證
- **Quarterly Updates**: 主要內容新增與改進
- **Semi-Annual Reviews**: 全面性重構與加強
- **Annual Releases**: 帶有重大改進的主要版本發行

### Monitoring and Quality Assurance
- **Automated Testing**: 定期驗證程式範例與連結
- **Community Feedback Integration**: 定期納入使用者建議
- **Technology Updates**: 與最新 Azure 服務與 azd 發行保持一致
- **Accessibility Audits**: 定期檢視以符合包容性設計原則

## Version Support Policy

### Current Version Support
- **Latest Major Version**: 提供完整支援並定期更新
- **Previous Major Version**: 提供 12 個月的安全更新與重大修補
- **Legacy Versions**: 僅由社群支援，無官方更新

### Migration Guidance
When major versions are released, we provide:
- **遷移指南**: 逐步遷移說明
- **相容性說明**: 有關破壞性變更的詳細資訊
- **工具支援**: 用於協助遷移的腳本或實用工具
- **社群支援**: 針對遷移問題的專門論壇

---

**導覽**
- **上一課**: [學習指南](resources/study-guide.md)
- **下一課**: 回到 [主要 README](README.md)

**保持更新**: 監看此儲存庫以接收有關新版本及學習教材重要更新的通知。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件已使用人工智慧翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們力求準確，請注意自動翻譯可能包含錯誤或不準確之處。原始語言版本的文件應被視為具權威性的來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而導致的任何誤解或誤釋負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->