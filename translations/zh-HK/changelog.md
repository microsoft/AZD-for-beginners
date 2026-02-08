# 變更紀錄 - AZD 初學者指南

## 介紹

本變更紀錄記錄 AZD 初學者指南倉庫所有顯著的變更、更新與改進。我們遵循語義版本控制原則並維護此紀錄，幫助使用者了解版本間的差異。

## 學習目標

透過閱讀本變更紀錄，您將能：
- 隨時掌握新功能與內容新增
- 了解既有文件的改進
- 追蹤錯誤修正以確保準確性
- 跟蹤教學材料的演進

## 學習成果

閱讀變更紀錄條目後，您將能：
- 辨識新增的內容與學習資源
- 了解哪些章節已更新或改進
- 根據最新教材規劃學習路徑
- 針對未來改進提出回饋和建議

## 版本歷史

### [v3.17.0] - 2026-02-05

#### 課程導航增強
**此版本改進 README.md 章節導航，採用更完善的表格式設計。**

#### 變更
- **課程地圖表格**：新增直接課程連結、預估時長及難度評級
- **資料夾清理**：移除冗餘的舊資料夾（deployment/、getting-started/、pre-deployment/、troubleshooting/）
- **連結驗證**：課程地圖表中超過 21 個內部連結均已驗證

### [v3.16.0] - 2026-02-05

#### 產品名稱更新
**本版本將產品名稱更新為目前微軟品牌。**

#### 變更
- **Azure AI Foundry → Microsoft Foundry**：所有 非翻譯 文件中相關引用已更新
- **Azure AI Agent Service → Foundry Agents**：服務名稱同步更新以反映現行品牌

#### 更新的檔案
- `README.md` - 主要課程首頁
- `changelog.md` - 版本歷史
- `course-outline.md` - 課程架構
- `docs/chapter-02-ai-development/agents.md` - AI agents 指南
- `examples/README.md` - 範例文件
- `workshop/README.md` - 工作坊首頁
- `workshop/docs/index.md` - 工作坊索引
- `workshop/docs/instructions/*.md` - 所有工作坊操作指引檔案

---

### [v3.15.0] - 2026-02-05

#### 主要倉庫重構：章節資料夾命名
**本版本將文件以章節為單位重新分組，提升導覽清晰度。**

#### 資料夾重命名
舊資料夾被新章節編號資料夾取代：
- `docs/getting-started/` → `docs/chapter-01-foundation/` 與 `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/`與 `docs/chapter-08-production/`
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
| 所有 pre-deployment 檔案 | pre-deployment/ | chapter-06-pre-deployment/ |
| 所有 troubleshooting 檔案 | troubleshooting/ | chapter-07-troubleshooting/ |

#### 新增
- **📚 章節 README 檔案**：於各章節資料夾新增 README.md，包含：
  - 學習目標與時長
  - 課程表及描述
  - 快速指令集
  - 章節間導航

#### 變更
- **🔗 更新所有內部連結**：超過 78 個文件路徑更新
- **🗺️ 主 README.md**：課程地圖改為章節結構
- **📝 examples/README.md**：更新跨章節參考

#### 移除
- 舊資料夾結構（getting-started/、microsoft-foundry/、deployment/、pre-deployment/、troubleshooting/、ai-foundry/）

---

### [v3.14.0] - 2026-02-05

#### 倉庫重構：章節導航
**本版本新增章節導航 README 檔案 (之後被 v3.15.0 取代)。**

---

### [v3.13.0] - 2026-02-05

#### 新增 AI Agents 指南
**本版本新增一份使用 Azure Developer CLI 部署 AI agents 的完整指南。**

#### 新增
- **🤖 docs/microsoft-foundry/agents.md**：完整指南涵蓋：
  - AI agents 是什麼，以及與聊天機器人差異
  - 三種快速啟動 agent 範本（Foundry Agents、Prompty、RAG）
  - Agent 架構範例（單一 agent、RAG、多 agent）
  - 工具配置與客製化
  - 監控與指標追蹤
  - 成本考量與優化
  - 常見故障排除方案
  - 三個實作練習及成功標準

#### 內容架構
- **介紹**：基礎 agent 概念
- **快速開始**：用 `azd init --template get-started-with-ai-agents` 部署 agents
- **架構圖解**：agent 模式視覺化
- **配置**：工具設定與環境變數
- **監控**：整合 Application Insights
- **練習**：漸進式實作練習（每個 20-45 分鐘）

---

### [v3.12.0] - 2026-02-05

#### DevContainer 環境更新
**本版本更新開發容器設定，採用最新工具並優化 AZD 學習體驗。**

#### 變更
- **🐳 基底鏡像**：由 `python:3.12-bullseye` 更新為 `python:3.12-bookworm`（最新 Debian 穩定版）
- **📛 容器名稱**：由「Python 3」改為「AZD for Beginners」以增加清晰度

#### 新增
- **🔧 新 Dev Container 功能**：
  - 安裝具 Bicep 支援的 `azure-cli`
  - `node:20` LTS 版本 (適用 AZD 範本)
  - `github-cli` 用於範本管理
  - `docker-in-docker` 支援容器應用部署

- **🔌 預設轉發常用開發端口**：
  - 8000（MkDocs 預覽）
  - 3000（網頁應用）
  - 5000（Python Flask）
  - 8080（API）

- **🧩 新增 VS Code 擴充套件**：
  - `ms-python.vscode-pylance` - Python 智慧感知
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions 支援
  - `ms-azuretools.vscode-docker` - Docker 支援
  - `ms-azuretools.vscode-bicep` - Bicep 語言支援
  - `ms-azure-devtools.azure-resource-groups` - Azure 資源管理
  - `yzhang.markdown-all-in-one` - Markdown 編輯
  - `DavidAnson.vscode-markdownlint` - Markdown 語法檢查
  - `bierner.markdown-mermaid` - Mermaid 圖表支援
  - `redhat.vscode-yaml` - YAML 支援（azure.yaml）
  - `eamodio.gitlens` - Git 視覺化
  - `mhutchie.git-graph` - Git 歷史

- **⚙️ VS Code 設定**：新增 Python 直譯器、儲存格式化、自動去除空白等預設設定

- **📦 更新 requirements-dev.txt**：
  - 新增 MkDocs minify 外掛
  - 新增 pre-commit 代碼品質工具
  - 新增 Azure SDK 套件（azure-identity、azure-mgmt-resource）

#### 修正
- **Post-Create 指令**：容器啟動時驗證 AZD 和 Azure CLI 是否安裝成功

---

### [v3.11.0] - 2026-02-05

#### 初學者專用 README 大幅改版
**本版本大幅提升 README.md 友善度，並為 AI 開發者新增重要資源。**

#### 新增
- **🆚 Azure CLI 與 AZD 比較**：清楚說明何時使用各工具，並附實例
- **🌟 優秀 AZD 連結**：直接連結至社群範本集及貢獻指南：
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 逾 200 個可直接部署範本
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - 社群貢獻入口
- **🎯 快速入門指南**：簡化三步驟入門說明（安裝 → 登入 → 部署）
- **📊 依經驗程度分類導覽表**：清晰指引初學者從何開始

#### 變更
- **README 結構**：改為漸進式揭露，關鍵資訊優先呈現
- **介紹段落**：重寫說明「`azd up` 的魔力」給全新手
- **刪除重複內容**：移除重覆指定的疑難排解章節
- **疑難排解指令**：修正 README 中 `azd logs` 改為有效的 `azd monitor --logs`

#### 修正
- **🔐 認證指令**：於 cheat-sheet.md 加入 `azd auth login` 和 `azd auth logout`
- **無效指令參考**：刪除 README 疑難排解段落中剩下的 `azd logs`

#### 備註
- **範圍**：變更涵蓋主 README.md 與 resources/cheat-sheet.md
- **目標對象**：專為初學者設計的優化與改良

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI 指令準確性修正
**本版本修正文檔中不存在的 AZD 指令，確保所有程式碼範例均使用有效 Azure Developer CLI 語法。**

#### 修正
- **🔧 移除無效 AZD 指令**：全面檢視及修正錯誤指令：
  - `azd logs`（不存在）→改用 `azd monitor --logs` 或 Azure CLI 替代
  - `azd service` 子命令（不存在）→改用 `azd show` 及 Azure CLI
  - `azd infra import/export/validate`（不存在）→刪除或改為有效指令
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` 參數（不存在）→刪除
  - `azd provision --what-if/--rollback` 參數（不存在）→改用 `--preview`
  - `azd config validate`（不存在）→改用 `azd config list`
  - `azd info`、`azd history`、`azd metrics`（不存在）→刪除

- **📚 更新檔案含指令修正**：
  - `resources/cheat-sheet.md`：指令參考重構
  - `docs/deployment/deployment-guide.md`：修正回滾及部署策略
  - `docs/troubleshooting/debugging.md`：修正日誌分析
  - `docs/troubleshooting/common-issues.md`：更新排錯指令
  - `docs/troubleshooting/ai-troubleshooting.md`：修正 AZD 偵錯部份
  - `docs/getting-started/azd-basics.md`：修正監控指令
  - `docs/getting-started/first-project.md`：更新監控與偵錯示範
  - `docs/getting-started/installation.md`：修正幫助與版本範例
  - `docs/pre-deployment/application-insights.md`：修正查看日誌指令
  - `docs/pre-deployment/coordination-patterns.md`：修正 agent 偵錯指令

- **📝 版本參考更新**：
  - `docs/getting-started/installation.md`：將硬編碼版本 `1.5.0` 更改為通用 `1.x.x` 並連結發行頁

#### 變更
- **回滾策略**：文件改為採用基於 Git 的回滾機制（AZD 尚無本機回滾功能）
- **日誌查看**：全面以 `azd monitor --logs`、`azd monitor --live` 及 Azure CLI 取代 `azd logs`
- **效能章節**：移除不存在的平行/增量部署參數，提供有效替代方案

#### 技術細節
- **有效的 AZD 指令**：`init`、`up`、`auth`、`deploy`、`down`、`provision`、`publish`、`completion`、`config`、`env`、`show`、`version`、`monitor`
- **有效的 azd monitor 旗標**：`--live`、`--logs`、`--overview`
- **移除的功能**：`azd logs`、`azd service`、`azd infra import/export/validate`、`azd history`、`azd metrics`、`azd info`、`azd config validate`

#### 備註
- **驗證**：指令經 Azure Developer CLI v1.23.x 驗證

---

### [v3.9.0] - 2026-02-05

#### 工作坊完成與文件品質更新
**本版本完成互動工作坊模組，修復所有失效的文件連結，並提升 AI 開發者使用 Microsoft AZD 時的整體內容品質。**

#### 新增
- **📝 CONTRIBUTING.md**：新增貢獻指南文件，包含：
  - 清楚的問題回報與提案說明
  - 新內容文件標準
  - 程式碼範例指南及提交訊息規範
  - 社群互動資訊

#### 完成
- **🎯 工作坊模組 7（總結）**：完整完成總結模組，包括：
  - 工作坊成就完整摘要
  - 重要概念掌握章節（AZD、模板、AI Foundry）
  - 持續學習建議
  - 工作坊挑戰練習及難度評級
  - 社群回饋與支援連結

- **📚 工作坊模組 3（分解）**：更新學習目標，含：
  - GitHub Copilot 與 MCP 伺服器啟動指導
  - AZD 模板資料夾結構理解
  - 基礎設施即程式碼（Bicep）組織範例
  - 實作實驗指示

- **🔧 工作坊模組 6（拆除）**：完成，包含：
  - 資源清理與成本管理目標
  - 使用 `azd down` 安全移除基礎設施
  - 軟刪除認知服務恢復指引
  - 額外探索指示（GitHub Copilot 與 Azure 入口網站）

#### 修正
- **🔗 失效連結修復**：修正超過15處內部文件失效連結：
  - `docs/ai-foundry/ai-model-deployment.md`：修正 microsoft-foundry-integration.md 的路徑
  - `docs/troubleshooting/ai-troubleshooting.md`：修正 ai-model-deployment.md 和 production-ai-practices.md 路徑
  - `docs/getting-started/first-project.md`：以 deployment-guide.md 替換不存在的 cicd-integration.md
  - `examples/retail-scenario.md`：修正 FAQ 與疑難排解指南路徑
  - `examples/container-app/microservices/README.md`：修正課程首頁與部署指南路徑
  - `resources/faq.md` 與 `resources/glossary.md`：更新 AI 章節參考
  - `course-outline.md`：修正講師指南與 AI 工作坊實驗參考

- **📅 工作坊狀態橫幅**：從「建構中」更新為 2026 年 2 月的啟用狀態

- **🔗 工作坊導航**：修正 README.md 中指向不存在 lab-1-azd-basics 資料夾的壞掉導航連結

#### 變更
- **工作坊展示**：移除「建構中」警告，工作坊現已完成且準備使用
- **導航一致性**：確保所有工作坊模組具備正確模組間導航
- **學習路徑參考**：更新章節交叉參考使用正確 microsoft-foundry 路徑

#### 驗證
- ✅ 所有英文 markdown 文件內部連結均有效
- ✅ 工作坊模組 0-7 完成交付，含學習目標
- ✅ 章節與模組之間導航正常
- ✅ 內容適合使用 Microsoft AZD 的 AI 開發者
- ✅ 保持友善初學者的語言與結構
- ✅ CONTRIBUTING.md 清楚指導社群貢獻者

#### 技術實作
- **連結驗證**：使用 PowerShell 自動化腳本檢核所有.md 內部連結
- **內容稽核**：人工審查工作坊完整度及適合初學者性
- **導航系統**：統一章節與模組導航模式

#### 備註
- **範圍**：僅對英文文件套用變更
- **翻譯**：本版本未同步翻譯資料夾（後續會自動同步）
- **工作坊時長**：完整工作坊提供約 3-4 小時實作學習

---

### [v3.8.0] - 2025-11-19

#### 進階文件：監控、安全性與多代理模式
**本版本新增完整 A 級課程，涵蓋 Application Insights 整合、認證模式及多代理協調，專為生產環境部署設計。**

#### 新增
- **📊 Application Insights 整合課程**：於 `docs/pre-deployment/application-insights.md`：
  - 以 AZD 為中心的自動部署與資源佈建
  - Application Insights 與 Log Analytics 完整 Bicep 模板
  - 可運作的 Python 應用程式示範，自訂遙測（逾 1200 行程式碼）
  - AI/LLM 監控模式（Azure OpenAI 代幣／成本追蹤）
  - 6 張 Mermaid 架構、分散式追蹤、遙測流程圖
  - 3 個實作練習（警示、儀表板、AI 監控）
  - Kusto 查詢範例與成本優化策略
  - 即時指標串流及除錯
  - 約 40-50 分鐘的產線應用課程

- **🔐 認證與安全模式課程**：於 `docs/getting-started/authsecurity.md`：
  - 3 種認證模式（連線字串、Key Vault、託管身分）
  - 完整 Bicep 基礎設施模板確保安全部署
  - Node.js 應用程式範例整合 Azure SDK
  - 3 完整實作（啟用託管身分、使用者指派身分、Key Vault 輪替）
  - 安全最佳實踐與 RBAC 配置
  - 疑難排解指南及成本分析
  - 生產級無密碼認證模式

- **🤖 多代理協調模式課程**：於 `docs/pre-deployment/coordination-patterns.md`：
  - 5 種協調模式（序列、並行、階層、事件驅動、共識）
  - 完整的協調服務實作（Python/Flask，超過 1500 行）
  - 3 個專用代理服務實作（研究員、撰稿人、編輯）
  - Service Bus 訊息佇列整合
  - Cosmos DB 狀態管理分散系統
  - 6 張 Mermaid 顯示代理互動圖
  - 3 個進階練習（逾時處理、重試邏輯、斷路器）
  - 成本細目（月費 240-565 美元）與優化建議
  - Application Insights 監控整合

#### 強化
- **部署前章節**：新增完整監控與協調模式內容
- **入門章節**：增加專業認證模式
- **生產準備**：涵蓋安全到可觀察性的完整內容
- **課程大綱**：更新第 3 與第 6 章新增課程連結

#### 變更
- **學習進度**：更緊密結合安全與監控內容
- **文件品質**：新課程保持 95-97% 的優質標準
- **生產模式**：企業部署端到端完整涵蓋

#### 改善
- **開發者體驗**：清楚的開發到生產監控路線
- **安全標準**：專業認證與密鑰管理模式
- **可觀察性**：全面 AZD + Application Insights 整合
- **AI 工作負載**：針對 Azure OpenAI 與多代理系統的監控

#### 驗證
- ✅ 所有課程皆含完整可執行程式碼（非片段）
- ✅ 圖形教學用 Mermaid 繪圖（共 19 張）
- ✅ 實作練習含驗證步驟（共 9 項）
- ✅ 生產級 Bicep 模板可由 `azd up` 部署
- ✅ 成本分析與優化建議完整
- ✅ 疑難排解與最佳實務
- ✅ 知識檢核含驗證指令

#### 文件評分結果
- **docs/pre-deployment/application-insights.md**：全面監控指導
- **docs/getting-started/authsecurity.md**：專業安全模式
- **docs/pre-deployment/coordination-patterns.md**：高階多代理架構
- **整體新內容**：一貫高品質標準

#### 技術實作
- **Application Insights**：Log Analytics + 自訂遙測 + 分散式追蹤
- **認證**：託管身分 + Key Vault + RBAC 模式
- **多代理**：Service Bus + Cosmos DB + Container Apps + 編排
- **監控**：即時指標 + Kusto 查詢 + 警示 + 儀表板
- **成本管理**：取樣策略、留存政策與預算控制

### [v3.7.0] - 2025-11-19

#### 文件品質改進與全新 Azure OpenAI 範例
**本版本提升整個專案文件品質，並新增完整的 Azure OpenAI GPT-4 聊天介面部署範例。**

#### 新增
- **🤖 Azure OpenAI 聊天範例**：完整 GPT-4 部署及運作實作於 `examples/azure-openai-chat/`：
  - 完整的 Azure OpenAI 基礎設施（GPT-4 模型部署）
  - Python CLI 聊天介面，具對話歷史功能
  - Key Vault 整合以安全管理 API 金鑰
  - 代幣使用追蹤與成本估算
  - 流量限制與錯誤處理
  - 詳細 README，部署指南約 35-45 分鐘
  - 11 個生產級檔案（Bicep 模板、Python 程式、設定檔）
- **📚 文件實作練習**：新增設定指南的實作練習：
  - 練習 1：多環境設定（15 分鐘）
  - 練習 2：秘密管理實作（10 分鐘）
  - 清楚的成功準則和驗證步驟
- **✅ 部署驗證**：新增部署指南驗證章節：
  - 健康檢查流程
  - 成功準則清單
  - 各部署指令預期輸出
  - 疑難排解快速參考

#### 強化
- **examples/README.md**：提升為 A 級品質（93%）：
  - 新增 azure-openai-chat 至所有相關章節
  - 在本地範例數量由 3 增至 4
  - 新增至 AI 應用範例表
  - 整合到中階快速入門
  - 加入 Microsoft Foundry 模板章節
  - 更新比較矩陣與技術尋找章節
- **文件品質**：docs 資料夾整體由 B+（87%）提升到 A-（92%）：
  - 補充關鍵指令範例的預期輸出
  - 包含設定變更的驗證步驟
  - 強化實作練習與實務手法

#### 變更
- **學習進程**：增強中階 AI 範例整合
- **文件架構**：更具執行性且成果明確的練習
- **驗證流程**：關鍵工作流添加明確成功準則

#### 改善
- **開發者體驗**：Azure OpenAI 部署時間縮短為 35-45 分鐘 (較複雜方案 60-90 分鐘)
- **成本透明度**：Azure OpenAI 範例成本估計（每月 50-200 美元）
- **學習路徑**：為 AI 開發者建立清楚入口—azure-openai-chat
- **文件標準**：一致的預期輸出和驗證步驟

#### 驗證
- ✅ Azure OpenAI 範例可使用 `azd up` 完成部署
- ✅ 11 個實作檔案語法正確
- ✅ README 指引符合實際部署經驗
- ✅ 文件跨 8 處以上連結皆更新
- ✅ 範例索引正確反映本地 4 個範例
- ✅ 表格無重複外部連結
- ✅ 導覽參考皆正確

#### 技術實作
- **Azure OpenAI 架構**：GPT-4 + Key Vault + Container Apps 模式
- **安全性**：支援託管身分，秘密保存在 Key Vault
- **監控**：Application Insights 整合
- **成本管理**：代幣追蹤與使用優化
- **部署**：單一 `azd up` 指令完成設定

### [v3.6.0] - 2025-11-19

#### 重大更新：容器應用部署範例
**本版本新增完整且可生產使用的 Azure Developer CLI (AZD) 容器應用部署範例，附帶完整文件並整合至學習路徑。**

#### 新增
- **🚀 容器應用範例**：新本地範例置於 `examples/container-app/`：
  - [總指南](examples/container-app/README.md)：容器化部署完整概覽，簡易起步、正式生產與進階模式
  - [簡易 Flask API](../../examples/container-app/simple-flask-api)：初學者友好 REST API，具備自動縮放至零、健康探針、監控與疑難排解
  - [微服務架構](../../examples/container-app/microservices)：生產級多服務部署（API Gateway、產品、訂單、使用者、通知），非同步消息、Service Bus、Cosmos DB、Azure SQL、分散式追蹤、藍綠／金絲雀部署
- **最佳實務**：針對容器工作負載的安全性、監控、成本優化及 CI/CD 指南
- **程式碼範例**：完整 `azure.yaml`、Bicep 模板與多語言服務實作（Python、Node.js、C#、Go）
- **測試與疑難排解**：端對端測試案例、監控指令、疑難排解說明

#### 變更
- **README.md**：更新增加並鏈結新容器應用範例於「本地範例 - 容器應用」
- **examples/README.md**：更新強調容器應用範例，新增比較矩陣項目，更新技術與架構參考
- **課程大綱與學習指南**：更新以參考相關章節中的新容器應用示例和部署模式

#### 經驗證
- ✅ 所有新示例均可使用 `azd up` 部署，並遵循最佳實踐
- ✅ 文件相互鏈接與導航已更新
- ✅ 示例涵蓋從初學者到進階情境，包括生產微服務

#### 備註
- **範圍**：僅限英語文件和示例
- **下一步**：未來版本將擴充更多進階容器模式與 CI/CD 自動化

### [v3.5.0] - 2025-11-19

#### 產品重塑品牌：Microsoft Foundry
**本版本在所有英語文件中全面實施產品名稱從「Microsoft Foundry」更名為「Microsoft Foundry」，反映 Microsoft 官方品牌重塑。**

#### 更改
- **🔄 產品名稱更新**：從「Microsoft Foundry」完全重新命名為「Microsoft Foundry」
  - 更新 `docs/` 資料夾中所有英語文件引用
  - 資料夾名稱更改：`docs/ai-foundry/` → `docs/microsoft-foundry/`
  - 檔案名稱更改：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 共更新 7 個文件中 23 處內容引用

- **📁 資料夾結構變更**：
  - `docs/ai-foundry/` 重命名為 `docs/microsoft-foundry/`
  - 所有交叉參考更新以反映新資料夾結構
  - 驗證所有文件中的導航連結

- **📄 檔案名稱更改**：
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 更新所有內部連結以指向新檔名

#### 更新文件
- **章節文件** (7 個)：
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 個導航連結更新
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 個產品名稱引用更新
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - 已使用 Microsoft Foundry（先前已更新）
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 個引用更新（總覽、社群回饋、文件）
  - `docs/getting-started/azd-basics.md` - 4 個交叉參考連結更新
  - `docs/getting-started/first-project.md` - 2 個章節導航連結更新
  - `docs/getting-started/installation.md` - 2 個下一章節連結更新
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 個引用更新（導航、Discord 社群）
  - `docs/troubleshooting/common-issues.md` - 1 個導航連結更新
  - `docs/troubleshooting/debugging.md` - 1 個導航連結更新

- **課程結構文件** (2 個)：
  - `README.md` - 17 處引用更新（課程概述、章節標題、範本區、社群見解）
  - `course-outline.md` - 14 處引用更新（概覽、學習目標、章節資源）

#### 經驗證
- ✅ 英文文件中無剩餘「ai-foundry」資料夾路徑引用
- ✅ 英文文件中無剩餘「Microsoft Foundry」產品名稱引用
- ✅ 所有導航連結與新資料夾結構均正常運作
- ✅ 檔案與資料夾重命名工作順利完成
- ✅ 章節間交叉連結已驗證

#### 備註
- **範圍**：僅限 `docs/` 資料夾中的英語文件
- **翻譯**：本版本不更新翻譯資料夾 (`translations/`)
- **工作坊**：本版本不更新工作坊材料 (`workshop/`)
- **示例**：示例檔案可能仍引用舊名稱（將在未來版本處理）
- **外部連結**：外部 URL 與 GitHub 儲存庫引用保持不變

#### 針對貢獻者的遷移指南
若您有本地分支或文件引用舊結構：
1. 更新資料夾引用：`docs/ai-foundry/` → `docs/microsoft-foundry/`
2. 更新檔案引用：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. 替換產品名稱：「Microsoft Foundry」→「Microsoft Foundry」
4. 驗證所有內部文件連結仍可正常運作

---

### [v3.4.0] - 2025-10-24

#### 基礎設施預覽與驗證增強
**本版本引入對新 Azure Developer CLI 預覽功能的完整支援，並提升工作坊用戶體驗。**

#### 新增
- **🧪 azd provision --preview 功能文件**：全面說明基礎設施預覽功能
  - 指令參考與使用範例於速查表中
  - 詳細集成進部署指南，含使用案例與好處
  - 預先檢查整合，提高部署安全性
  - 新手引導更新，推行安全優先部署流程
- **🚧 工作坊狀態橫幅**：專業 HTML 橫幅顯示工作坊開發狀態
  - 漸層設計與施工指示標誌，明確用戶溝通
  - 最後更新時間戳透明公開
  - 支援各裝置的響應式設計

#### 增強
- **基礎設施安全性**：部署文件全面整合預覽功能
- **部署前驗證**：自動化腳本加入基礎設施預覽測試
- **開發者工作流程**：更新指令序列，建議預覽為最佳實踐
- **工作坊體驗**：明確設定內容開發狀態與使用者期望

#### 變更
- **部署最佳實踐**：推薦以預覽優先工作流程
- **文件流程**：基礎設施驗證提前於學習過程中
- **工作坊展示**：專業狀態溝通，清晰呈現開發時程

#### 改良
- **安全優先策略**：可在部署前驗證基礎設施變更
- **團隊協作**：預覽結果可共享供審閱與批准
- **成本意識**：提前理解資源費用
- **風險降低**：透過事前驗證減少部署失敗風險

#### 技術實現
- **多文件整合**：預覽功能涵蓋 4 個主要文件
- **指令模式**：文件中統一語法與範例
- **最佳實踐集成**：預覽納入驗證流程與腳本
- **視覺標示**：清楚 NEW 功能標示便於發現

#### 工作坊基礎設施
- **狀態溝通**：專業 HTML 橫幅含漸層樣式
- **使用者體驗**：明確開發狀態避免混淆
- **正式呈現**：維護儲存庫信譽並設立期望
- **時程透明**：2025 年 10 月最後更新時間標記

### [v3.3.0] - 2025-09-24

#### 增強工作坊材料與互動式學習體驗
**本版本新增完整工作坊材料，包含瀏覽器互動指南與結構化學習路徑。**

#### 新增
- **🎥 互動工作坊指南**：基於瀏覽器的工作坊體驗，具 MkDocs 預覽功能
- **📝 結構化工作坊指導**：7 步驟引導學習路徑，涵蓋探索至自訂
  - 0-導言：工作坊概述與設置
  - 1-選擇 AI 範本：範本發掘與選擇流程
  - 2-驗證 AI 範本：部署與驗證程序
  - 3-拆解 AI 範本：理解範本架構
  - 4-配置 AI 範本：設定與自訂
  - 5-自訂 AI 範本：進階修改與迭代
  - 6-拆除基礎設施：清理與資源管理
  - 7-總結：回顧與後續步驟
- **🛠️ 工作坊工具**：使用 Material 主題的 MkDocs 設定，提升學習體驗
- **🎯 實作學習路徑**：3 步驟方法論（探索 → 部署 → 自訂）
- **📱 GitHub Codespaces 整合**：順暢的開發環境設置

#### 增強
- **AI 工作坊實驗室**：延伸至 2-3 小時全面結構化學習體驗
- **工作坊文件**：專業呈現含導航與視覺輔助
- **學習進程**：清楚指導從範本選擇至生產部署
- **開發者體驗**：整合工具以簡化開發流程

#### 改良
- **無障礙性**：瀏覽器介面具備搜尋、代碼複製與主題切換功能
- **自定進度學習**：靈活的工作坊架構適合不同學習速度
- **實務應用**：真實 AI 範本部署案例
- **社群整合**：整合 Discord 支援與協作

#### 工作坊特色
- **內建搜尋**：快速關鍵字與課程搜尋
- **代碼區塊複製**：滑鼠懸停即可複製所有程式碼範例
- **主題切換**：支援深色/淺色模式
- **視覺資源**：螢幕截圖與圖表增進理解
- **幫助整合**：直接存取 Discord 社群支援

### [v3.2.0] - 2025-09-17

#### 重大導航重構與章節制學習系統
**本版本引入全面章節制學習結構，並加強全儲存庫的導航功能。**

#### 新增
- **📚 章節制學習系統**：將整個課程重構為 8 個漸進式學習章節
  - 章節 1：基礎與快速入門 (⭐ - 30-45 分鐘)
  - 章節 2：AI 優先開發 (⭐⭐ - 1-2 小時)
  - 章節 3：設定與驗證 (⭐⭐ - 45-60 分鐘)
  - 章節 4：基礎設施即程式碼與部署 (⭐⭐⭐ - 1-1.5 小時)
  - 章節 5：多代理 AI 解決方案 (⭐⭐⭐⭐ - 2-3 小時)
  - 章節 6：部署前驗證與規劃 (⭐⭐ - 1 小時)
  - 章節 7：故障排除與偵錯 (⭐⭐ - 1-1.5 小時)
  - 章節 8：生產與企業模式 (⭐⭐⭐⭐ - 2-3 小時)
- **📚 全面導航系統**：所有文件統一導覽標頭與頁尾
- **🎯 進度追蹤**：課程完成清單與學習驗證系統
- **🗺️ 學習路徑指引**：針對不同經驗與目標設定明確入口
- **🔗 交叉參考導航**：相關章節與先決條件清晰鏈接

#### 增強
- **README 結構**：轉換為結構化學習平台與章節系統
- **文件導航**：每頁均含章節上下文與進度指引
- **範本組織**：示例與範本依據學習章節分配
- **資源整合**：將速查表、常見問答與學習指南連結至相關章節
- **工作坊整合**：實作實驗室綁定多個章節學習目標

#### 變更
- **學習進程**：由線性文件改為彈性章節式學習
- **設定指南位置**：移至章節 3 以優化學習流程
- **AI 內容整合**：AI 專屬內容融入整個學習過程
- **生產內容**：進階模式集中於章節 8，適合企業學員

#### 改良
- **使用者體驗**：清晰導航麵包屑與章節進度指標
- **無障礙性**：一致性導航模式便於課程瀏覽
- **專業呈現**：大學風格課程架構，適用學術與企業訓練
- **學習效率**：透過優化組織結構縮短尋找內容時間

#### 技術實施
- **導航標頭**：40 多個文件中標準化章節導航
- **頁尾導航**：一致性進度指引與章節完成指標
- **交叉鏈接系統**：豐富內部連結連接相關概念
- **章節映射**：範本與示例明確配合學習目標

#### 學習指南增強
- **📚 全面學習目標**：重構指南以符合 8 章制度
- **🎯 章節評量**：每章含專屬學習目標與實作練習
- **📋 進度追蹤**：週學習計畫與可量化成果清單
- **❓ 評量問題**：每章設專業知識驗證題目
- **🛠️ 實務練習**：實作活動含真實部署與故障排除場景
- **📊 技能提升**：從基礎到企業模式階段性進展，聚焦職涯發展
- **🎓 證書框架**：專業發展成果與社群認可制度
- **⏱️ 時程管理**：結構化 10 週學習計畫與里程碑驗證

### [v3.1.0] - 2025-09-17

#### 增強多代理 AI 解決方案
**本版本改進零售多代理方案，提供更佳代理命名與文件說明。**

#### 變更
- **多代理術語**：將零售多代理方案中的「Cora agent」替換為「Customer agent」以增清晰度
- **代理架構**：更新所有文檔、ARM 範本與程式碼範例，統一使用「Customer agent」命名
- **設定範例**：現代化代理設定範例，更新命名慣例
- **文件一致性**：確保所有引用均使用專業且具描述性的代理名稱

#### 增強
- **ARM 範本套件**：更新 retail-multiagent-arm-template 中 Customer agent 參照
- **架構圖**：刷新 Mermaid 圖表，使用新版代理命名
- **程式碼範例**：Python 類別與實作示例改用 CustomerAgent 命名
- **環境變數**：更新所有部署腳本採用 CUSTOMER_AGENT_NAME 慣例

#### 改良
- **開發者體驗**：文件中代理角色與職責更清晰
- **生產環境準備度**：更符合企業命名慣例
- **學習資料**：教育用途代理命名更直觀
- **範本可用性**：簡化代理功能與部署模式的理解

#### 技術細節
- 使用 CustomerAgent 參考更新 Mermaid 架構圖
- 將 Python 範例中的 CoraAgent 類名更換為 CustomerAgent
- 修改 ARM 範本 JSON 配置以使用 "customer" 代理類型
- 更新環境變數，從 CORA_AGENT_* 改為 CUSTOMER_AGENT_*
- 刷新所有部署命令與容器配置

### [v3.0.0] - 2025-09-12

#### 主要變更 - AI 開發者聚焦與 Microsoft Foundry 整合
**此版本將倉庫轉變為完整的 AI 導向學習資源，並整合 Microsoft Foundry。**

#### 新增
- **🤖 AI-第一學習路徑**：全面重構，優先照顧 AI 開發者與工程師
- **Microsoft Foundry 整合指南**：詳盡記錄如何連接 AZD 與 Microsoft Foundry 服務
- **AI 模型部署模式**：深入指南涵蓋模型選擇、設定與生產部署策略
- **AI 工作坊實驗室**：2-3 小時實作工作坊，將 AI 應用轉換為可由 AZD 部署的方案
- **生產 AI 最佳實踐**：適合企業擴展、監控與安全管理 AI 工作負載的模式
- **AI 專屬故障排除指南**：全面解決 Azure OpenAI、認知服務與 AI 部署問題
- **AI 範本庫**：精選 Microsoft Foundry 範本合集，附帶難易度評級
- **工作坊教材**：完整的工作坊架構，含實作實驗與參考資料

#### 強化
- **README 結構**：以 AI 開發者為中心，融合 Microsoft Foundry Discord 45% 社群興趣數據
- **學習路徑**：專門的 AI 開發者旅程，並行傳統學生及 DevOps 工程師路徑
- **範本推薦**：重點 AI 範本，包括 azure-search-openai-demo、contoso-chat 和 openai-chat-app-quickstart
- **社群整合**：增強 Discord 社群支援，包含 AI 專用頻道與討論

#### 安全與生產聚焦
- **受管身份模式**：特定 AI 身份驗證與安全配置
- **成本優化**：記錄令牌使用並控管 AI 工作負載預算
- **多區域部署**：全球 AI 應用部署策略
- **效能監控**：AI 專屬指標與 Application Insights 整合

#### 文件品質
- **線性課程結構**：由淺入深，涵蓋 AI 部署模式
- **已驗證 URL**：所有外部倉庫連結均可訪問
- **完整參考**：所有內部文件連結均有效
- **生產就緒**：企業部署模式，附實際案例

### [v2.0.0] - 2025-09-09

#### 主要變更 - 倉庫重構與專業化提升
**此版本為倉庫結構與內容呈現的大幅整頓。**

#### 新增
- **結構化學習框架**：所有文件頁面新增導言、學習目標與學習成果章節
- **導覽系統**：文件中加入前後課程連結，方便循序學習
- **學習指南**：完整 study-guide.md，包含學習目標、練習與評量材料
- **專業呈現**：移除所有表情符號圖示，提升易用性與正式感
- **內容結構強化**：優化學習材料組織與流程

#### 變更
- **文件格式**：統一學習導向結構
- **導覽流程**：邏輯化所有學習內容的進展
- **內容呈現**：去除裝飾元素，追求清晰正式格式
- **連結結構**：更新內部連結以支援新導覽系統

#### 改善
- **無障礙**：移除表情圖示依賴，提升螢幕閱讀器相容性
- **專業外觀**：乾淨學術風，適合企業學習使用
- **學習體驗**：結構化方式，明確每課目標與成果
- **內容組織**：強化論理流程與主題銜接

### [v1.0.0] - 2025-09-09

#### 初始發行 - 全面 AZD 學習倉庫

#### 新增
- **核心文件結構**
  - 完整入門指南系列
  - 全面部署與建置文件
  - 詳細故障排除與除錯指引
  - 預部署驗證工具與流程

- **入門模組**
  - AZD 基礎：核心概念與術語
  - 安裝指南：各平台安裝說明
  - 配置指南：環境設定與身份驗證
  - 第一個專案教學：循序漸進的實作學習

- **部署與建置模組**
  - 部署指南：完整工作流程文件
  - 基礎建設即程式碼（IaC）：Bicep 範例與指引
  - 生產部署最佳實務
  - 多服務架構模式

- **預部署驗證模組**
  - 容量規劃：Azure 資源可用性驗證
  - SKU 選擇：全面服務層級輔導
  - 預飛行檢查：自動驗證腳本（PowerShell 與 Bash）
  - 成本估算與預算規劃工具

- **故障排除模組**
  - 常見問題：遇到的普遍問題與解答
  - 除錯指南：系統性故障排除方法
  - 進階診斷技術與工具
  - 性能監控與優化

- **資源與參考**
  - 命令速查表：常用命令參考
  - 詞彙表：術語與縮寫解釋
  - 常見問題解答（FAQ）
  - 外部資源連結與社群連結

- **範例與範本**
  - 簡易 Web 應用範例
  - 靜態網站部署範本
  - 容器應用配置
  - 資料庫整合模式
  - 微服務架構範例
  - 無伺服器函數實作

#### 功能特色
- **跨平台支援**：Windows、macOS 與 Linux 安裝與設定指南
- **多技能層級**：涵蓋學生到專業開發者
- **實務導向**：實作範例與真實案例
- **全面涵蓋**：從基礎概念到企業級高級模式
- **安全優先**：整合安全最佳實務
- **成本優化**：提供低成本部署與資源管理建議

#### 文件品質
- **詳細程式範例**：實用且經過測試的程式碼
- **逐步教學**：清晰可行的指引
- **全面錯誤處理**：常見問題的故障排除
- **最佳實務整合**：業界標準與推薦
- **版本相容性**：同步最新 Azure 服務與 azd 功能

## 未來計畫優化

### 版本 3.1.0 (計畫中)
#### AI 平台擴展
- **多模型支援**：整合 Hugging Face、Azure ML 與自訂模型模式
- **AI 代理框架**：LangChain、Semantic Kernel 與 AutoGen 部署範本
- **進階 RAG 模式**：Azure AI Search 之外的向量資料庫選項（Pinecone、Weaviate 等）
- **AI 可觀測性**：強化模型效能、令牌使用及回應品質監控

#### 開發者體驗
- **VS Code 擴充套件**：整合 AZD + AI Foundry 開發體驗
- **GitHub Copilot 整合**：AI 輔助 AZD 範本生成
- **互動教學**：帶有自動驗證的 AI 場景實作練習
- **影片內容**：針對 AI 部署的補充視覺教學

### 版本 4.0.0 (計畫中)
#### 企業 AI 模式
- **治理框架**：AI 模型治理、合規與稽核軌跡
- **多租戶 AI**：為多客戶提供隔離 AI 服務的模式
- **邊緣 AI 部署**：整合 Azure IoT Edge 與容器實例
- **混合雲 AI**：多雲與混合雲 AI 工作負載部署模式

#### 進階功能
- **AI 管線自動化**：Azure Machine Learning 管線整合 MLOps
- **進階安全**：零信任模式、私有端點與威脅防護
- **效能優化**：高吞吐量 AI 應用調優與擴展策略
- **全球分發**：AI 應用內容傳遞與邊緣快取模式

### 版本 3.0.0 (計畫中) - 現版本已取代
#### 提議新增功能 - 現已於 v3.0.0 實作
- ✅ **AI 專注內容**：完整 Microsoft Foundry 整合（已完成）
- ✅ **互動教學**：AI 工作坊實驗室（已完成）
- ✅ **進階安全模組**：AI 專屬安全模式（已完成）
- ✅ **效能優化**：AI 工作負載調優策略（已完成）

### 版本 2.1.0 (計畫中) - 部分已於 v3.0.0 實作
#### 次要增強 - 現版本部分完成
- ✅ **額外範例**：AI 導向部署場景（已完成）
- ✅ **擴展 FAQ**：AI 專屬問題與故障排除（已完成）
- **工具整合**：強化 IDE 與編輯器整合指南
- ✅ **監控擴展**：AI 專屬監控與警示模式（已完成）

#### 未來仍規劃
- **行動裝置友善文件**：具響應式設計的行動學習
- **離線存取**：可下載文件套件
- **增強 IDE 整合**：AZD + AI 工作流程 VS Code 擴充
- **社群儀表板**：即時社群指標與貢獻追蹤

## 變更日誌貢獻說明

### 回報變更
當貢獻此倉庫內容，請確保變更日誌條目包括：

1. **版本號碼**：遵循語意版本控制 (major.minor.patch)
2. **日期**：發布或更新日期，格式為 YYYY-MM-DD
3. **類別**：新增、變更、棄用、移除、修正、安全
4. **清晰描述**：簡明說明變更內容
5. **影響評估**：變更對現有使用者之影響

### 變更類別

#### 新增
- 新功能、文件區段或能力
- 新範例、範本或學習資源
- 其他工具、腳本或實用程式

#### 變更
- 修改既有功能或文件
- 優化清晰度或正確性
- 重構內容或組織

#### 棄用
- 即將淘汰的功能或方法
- 計畫移除的文件區段
- 有更好替代方案的方法

#### 移除
- 不再相關的功能、文件或範例
- 過時資訊或被廢除方式
- 重複或整合內容

#### 修正
- 文檔或程式碼錯誤更正
- 已回報問題的解決
- 精確度或功能的改善

#### 安全
- 與安全相關的改進或修復
- 更新安全最佳實踐
- 解決安全漏洞

### 語意版本控制指引

#### 大版本 (X.0.0)
- 需用戶操作的重大變更
- 內容或組織結構大幅調整
- 改變根本方法或技術途徑

#### 次版本 (X.Y.0)
- 新增功能或內容
- 維持相容性的增強
- 新增範例、工具或資源

#### 修補版 (X.Y.Z)
- 錯誤修正
- 小幅內容改良
- 澄清說明及小增強

## 社群回饋與建議

我們積極鼓勵社群回饋以提升此學習資源：

### 如何提供回饋
- **GitHub Issues**：回報問題或改進建議（歡迎 AI 專屬問題）
- **Discord 討論**：分享想法並與 Microsoft Foundry 社群互動
- **Pull Requests**：直接對內容改進，特別是 AI 範本與指南
- **Microsoft Foundry Discord**：參與 #Azure 頻道討論 AZD + AI
- **社群論壇**：參與更廣泛的 Azure 開發者討論

### 回饋類別
- **AI 內容正確性**：對 AI 服務整合與部署資料的修正
- **學習體驗**：改進 AI 開發者學習流程的建議
- **缺少 AI 內容**：額外 AI 範本、模式或範例需求
- **無障礙性**：促進多元學習需求的提升
- **AI 工具整合**：優化 AI 開發工作流程的提案
- **生產 AI 模式**：企業級 AI 部署模式的請求

### 回應承諾
- **問題回應**：48 小時內處理已回報問題
- **功能請求**：一週內評估
- **社群貢獻**：一週內審核
- **安全相關**：優先立即處理

## 維護計畫

### 定期更新
- **每月審核**：內容正確性與連結檢查
- **每季更新**：新增重要內容與改良
- **半年審查**：全面重構與增強
- **年度發布**：大版本更新含重大改善

### 監控與品質保證
- **自動測試**：定期驗證程式範例與連結
- **社群回饋整合**：持續吸納用戶建議
- **技術更新**：依最新 Azure 服務與 azd 版本同步
- **無障礙審核**：定期檢查與優化包容設計

## 版本支援政策

### 當前版本支援
- **最新大版本**：完整支援與定期更新
- **前一大版本**：12 個月安全更新與重要修補
- **舊版**：社群支援，無官方更新

### 遷移指引
當重大版本發布時，我們提供：
- **遷移指南**：逐步過渡說明
- **相容性說明**：關於重大變更的詳情
- **工具支援**：協助遷移的腳本或工具
- **社群支援**：專門的遷移問題討論論壇

---

**導覽**
- **上一課**：[學習指南](resources/study-guide.md)
- **下一課**：返回至[主 README](README.md)

**保持更新**：關注本儲存庫以接收關於新版本和學習資料重要更新的通知。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於確保翻譯的準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議使用專業人工翻譯。我們不對因使用本翻譯所引起的任何誤解或誤釋負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->