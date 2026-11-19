# AZD 初學者指南：課程大綱與學習框架

## 課程概述

通過結構化章節掌握 Azure Developer CLI (azd)，設計進階學習。**特別著重於結合 Microsoft Foundry 的 AI 應用部署。**

### 為何現代開發者必修此課程

部署 AI 工作負載的開發者常常需要指引以應對：
- 複雜的多服務 AI 架構
- 生產環境 AI 部署最佳實踐  
- Azure AI 服務整合與配置
- AI 工作負載成本優化
- AI 特定部署問題的排錯

### 核心學習目標

完成本結構化課程後，您將能：
- **精通 AZD 基礎**：核心概念、安裝與配置
- **部署 AI 應用**：結合 Microsoft Foundry 服務使用 AZD
- <strong>實作基於程式碼的基礎建設</strong>：使用 Bicep 範本管理 Azure 資源
- <strong>排解部署問題</strong>：解決常見問題與除錯
- <strong>生產環境優化</strong>：安全性、擴展、監控與成本管理
- <strong>建立多代理方案</strong>：部署複雜的 AI 架構

## 🎓 工作坊學習體驗

### 彈性學習方式選擇
本課程支援 <strong>自主進度的個人學習</strong> 與 <strong>導師引導的工作坊課程</strong>，讓學員透過互動練習獲得 AZD 的實戰經驗與實務技能。

#### 🚀 自主進度學習模式
<strong>適合個人開發者及持續學習</strong>

**特色：**
- <strong>基於瀏覽器介面</strong>：完整 MkDocs 支援的工作坊，可用任意瀏覽器存取
- **GitHub Codespaces 整合**：一鍵開啟預配置工具的開發環境
- **互動式 DevContainer 環境**：無需本機設定，即可立即開始編碼
- <strong>進度追蹤</strong>：內建檢查點與驗證練習
- <strong>社群支持</strong>：可使用 Azure Discord 頻道提問及合作

**學習結構：**
- <strong>彈性時間安排</strong>：可按個人節奏在數日或數週內完成章節
- <strong>檢查點系統</strong>：學習驗證後進入較複雜主題
- <strong>資源庫</strong>：完整文件、範例及故障排除指南
- <strong>作品集發展</strong>：建立可部署的專業作品集專案

**開始使用（自主進度）：**
```bash
# Option 1: GitHub Codespaces (Recommended)
# Navigate to the repository and click "Code" → "Create codespace on main"

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow setup instructions in workshop/README.md
```

#### 🏛️ 導師引導工作坊課程
**適用於企業訓練、密集訓練營與教育機構**

**工作坊形式選項：**

**📚 學術課程整合（8-12 週）**
- <strong>大學課程</strong>：一學期課程，每週 2 小時課堂
- <strong>訓練營格式</strong>：3-5 天密集課程，每日 6-8 小時
- <strong>企業訓練</strong>：每月團隊課程，含實務專案實作
- <strong>評估架構</strong>：帶分數作業，同儕評審及期末專案

**🚀 密集工作坊（1-3 天）**
- **第 1 天**：基礎 + AI 開發（章節 1-2）- 6 小時
- **第 2 天**：配置 + 基礎建設（章節 3-4）- 6 小時  
- **第 3 天**：進階模式 + 生產環境（章節 5-8）- 8 小時
- <strong>後續</strong>：為期 2 週的專案輔導（選項）

**⚡ 執行簡報（4-6 小時）**
- <strong>策略概覽</strong>：AZD 價值與商業影響（1 小時）
- <strong>實作示範</strong>：端對端部署 AI 應用（2 小時）
- <strong>架構審視</strong>：企業架構模式與治理（1 小時）
- <strong>實施規劃</strong>：組織採用策略（1-2 小時）

#### 🛠️ 工作坊學習方法
**探索 → 部署 → 自訂，循序漸進的實務技能發展模式**

**階段 1：探索（45 分鐘）**
- <strong>範本探索</strong>：評估 Microsoft Foundry 範本與服務
- <strong>架構分析</strong>：理解多代理模式與部署策略
- <strong>需求評估</strong>：識別組織需求與限制
- <strong>環境建置</strong>：設定開發環境與 Azure 資源

**階段 2：部署（2 小時）**
- <strong>引導實作</strong>：使用 AZD 逐步部署 AI 應用
- <strong>服務配置</strong>：設定 Azure AI 服務、端點與驗證
- <strong>安全實作</strong>：套用企業安全模式與存取控管
- <strong>驗證測試</strong>：確認部署與排錯常見問題

**階段 3：自訂（45 分鐘）**
- <strong>應用修改</strong>：依需求調整範本以符合理想使用情境
- <strong>生產環境優化</strong>：實施監控、成本管理與擴展策略
- <strong>進階模式</strong>：探索多代理協調與複雜架構
- <strong>後續規劃</strong>：制定持續技能發展路徑

#### 🎯 工作坊學習成果
<strong>透過實作練習所達成的可衡量技能</strong>

**技術能力：**
- **部署生產 AI 應用**：成功部署與配置 AI 驅動解決方案
- <strong>基礎建設即程式碼精通</strong>：建立與管理自訂 Bicep 範本
- <strong>多代理架構</strong>：實作協調 AI 代理解決方案
- <strong>生產準備就緒</strong>：應用安全、監控與治理模式
- <strong>故障排除專業能力</strong>：獨立解決部署與配置問題

**專業技能：**
- <strong>專案領導</strong>：帶領技術團隊完成雲端部署任務
- <strong>架構設計</strong>：設計可擴展且具成本效益的 Azure 解決方案
- <strong>知識傳承</strong>：培訓及指導同事 AZD 最佳實踐
- <strong>策略規劃</strong>：影響組織性雲端採用策略

#### 📋 工作坊資源與教材
<strong>完整工具包供導師與學員使用</strong>

**給導師：**
- <strong>講師指南</strong>：[工作坊概述](workshop/README.md) - 課程規劃與教學指導
- <strong>簡報材料</strong>：投影片、架構圖與示範腳本
- <strong>評估工具</strong>：實作練習、知識檢核與評分標準
- <strong>技術設置</strong>：環境配置、故障排除與備援方案

**給學員：**
- <strong>互動工作坊環境</strong>：[工作坊材料](workshop/README.md) - 基於瀏覽器的學習平台
- <strong>逐步指引</strong>：[引導練習](../../workshop/docs/instructions) - 詳細實作流程  
- <strong>參考文件</strong>：[AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI 深度探索
- <strong>社群資源</strong>：Azure Discord 頻道、GitHub 討論及專家支援

#### 🏢 企業工作坊執行
<strong>組織部署與培訓策略</strong>

**企業培訓計劃：**
- <strong>開發者入職</strong>：新員工導入 AZD 基礎（2-4 週）
- <strong>團隊技能提升</strong>：現有團隊季度訓練（1-2 天）
- <strong>架構審查</strong>：資深工程師與架構師每月課程（4 小時）
- <strong>領導簡報</strong>：技術決策者執行工作坊（半天）

**執行支援：**
- <strong>客製工作坊設計</strong>：依組織需求量身打造內容
- <strong>試點計劃管理</strong>：結構化推行，含成功指標與回饋機制  
- <strong>持續輔導</strong>：工作坊後專案實施支援
- <strong>社群建設</strong>：內部 Azure AI 開發者社群與知識分享

**成功指標：**
- <strong>技能獲得</strong>：課前後評估技術能力成長
- <strong>部署成功率</strong>：成功部署生產應用的學員比例
- <strong>生產力時間</strong>：新 Azure AI 專案縮短上手時間
- <strong>知識留存率</strong>：工作坊後 3-6 個月追蹤評估

## 八章節學習結構

### 第 1 章：基礎與快速起步（30-45 分鐘）🌱
<strong>前置條件</strong>：Azure 訂閱，基礎命令列知識  
<strong>難度</strong>：⭐

#### 你將學習
- 了解 Azure Developer CLI 基本原理
- 在您的平台安裝 AZD  
- 第一次成功部署
- 核心概念與術語

#### 學習資源
- [AZD 基礎](docs/chapter-01-foundation/azd-basics.md) - 核心概念
- [安裝與設定](docs/chapter-01-foundation/installation.md) - 平台專用指南
- [您的第一個專案](docs/chapter-01-foundation/first-project.md) - 實作教學
- [命令速查表](resources/cheat-sheet.md) - 快速參考

#### 實務成果
透過 AZD 成功在 Azure 部署簡單的網頁應用

---

### 第 2 章：AI 優先開發（含工作坊，共 4-5 小時）🤖
<strong>前置條件</strong>：完成第 1 章  
<strong>難度</strong>：⭐⭐

#### 你將學習
- Microsoft Foundry 與 AZD 整合
- GA `microsoft.foundry` 套件安裝與託管代理程式碼部署
- 本地代理檢視器測試與獨立評估資料集/評分標準
- 部署 AI 驅動應用
- 了解 AI 服務配置
- RAG（檢索增強生成）模式

#### 學習資源
- [Microsoft Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- [託管代理演練 (GA)](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) - 初始化、檢閱 `azure.yaml`、配置、本地測試、部署、評估及清理
- [AI 代理指南](docs/chapter-02-ai-development/agents.md)
- [AI 模型部署](docs/chapter-02-ai-development/ai-model-deployment.md)
- [AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - <strong>新</strong>：全面的 2-3 小時實務操作實驗室
- [互動式工作坊指南](workshop/README.md) - <strong>新</strong>：基於瀏覽器的工作坊，包含 MkDocs 預覽
- [Microsoft Foundry 模板](README.md#featured-microsoft-foundry-templates)
- [工作坊指示](../../workshop/docs/instructions) - <strong>新</strong>：循序漸進的引導練習

#### 實務成果
使用 GA 套件在本地和 Foundry 中測試託管代理，檢閱評估結果，區分新建與重用專案的清理。獨立的 RAG/工作坊路徑涵蓋配置 AI 驅動聊天應用。

#### 工作坊學習路徑（選擇性加強）
<strong>新互動體驗</strong>：[完整工作坊指南](workshop/README.md)
1. <strong>探索</strong> (30 分鐘)：模板選擇與評估
2. <strong>部署</strong> (45 分鐘)：部署並驗證 AI 模板功能  
3. <strong>拆解</strong> (30 分鐘)：理解模板架構與組件
4. <strong>配置</strong> (30 分鐘)：自訂設定與參數
5. <strong>自訂</strong> (45 分鐘)：修改並反覆調整，打造專屬方案
6. <strong>拆除</strong> (15 分鐘)：清理資源及了解生命週期
7. <strong>總結</strong> (15 分鐘)：後續步驟與進階學習路徑

---

### 第三章：配置與身份驗證（45-60 分鐘）⚙️
<strong>前置條件</strong>：完成第一章  
<strong>難度</strong>：⭐⭐

#### 您將學習
- 環境配置與管理
- 身份驗證與安全最佳實踐
- 資源命名與組織
- 多環境部署

#### 學習資源
- [配置指南](docs/chapter-03-configuration/configuration.md) - 環境設置
- [身份驗證與安全模式](docs/chapter-03-configuration/authsecurity.md) - 託管身份與 Key Vault 整合
- 多環境範例

#### 實務成果
管理多個環境，並確保正確身份驗證與安全

---

### 第四章：基礎架構即程式碼與部署（1-1.5 小時）🏗️
<strong>前置條件</strong>：完成第一至三章  
<strong>難度</strong>：⭐⭐⭐

#### 您將學習
- 進階部署模式
- 使用 Bicep 的基礎架構即程式碼
- 資源配置策略
- 自訂模板建立

- 使用 Azure Container Apps 與 AZD 進行容器化應用部署

#### 學習資源
- [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) - 完整工作流程
- [資源配置](docs/chapter-04-infrastructure/provisioning.md) - 資源管理
- 容器與微服務範例
- [容器應用範例](examples/container-app/README.md) - 快速入門、生產環境與進階部署模式

#### 實務成果
利用自訂基礎架構模板部署複雜多服務應用

---

### 第五章：多代理 AI 解決方案（2-3 小時）🤖🤖
<strong>前置條件</strong>：完成第一至二章  
<strong>難度</strong>：⭐⭐⭐⭐

#### 您將學習
- 多代理架構模式
- 代理協同與協調
- 生產就緒的 AI 部署
- 客戶端及庫存代理實作

- 將容器化微服務整合為代理式解決方案的一部分

#### 學習資源
- [零售多代理解決方案](examples/retail-scenario.md) - 架構藍圖，非完整應用
- [ARM 模板包](../../examples/retail-multiagent-arm-template) - 基礎架構腳手架及實作前置條件
- 多代理協同模式
- [微服務架構範例](../../examples/container-app/microservices) - 服務間通訊、非同步消息與生產部署

#### 實務成果
設計多代理 AI 解決方案，並識別配置基礎架構之外，應用實作、驗證及運作所需工作

---

### 第六章：部署前驗證與規劃（1 小時）🔍
<strong>前置條件</strong>：完成第四章  
<strong>難度</strong>：⭐⭐

#### 您將學習
- 容量規劃與資源驗證
- SKU 選擇策略
- 起飛前檢查與自動化
- 成本優化規劃

#### 學習資源
- [容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) - 資源驗證
- [SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) - 成本效益選擇
- [飛行前檢查](docs/chapter-06-pre-deployment/preflight-checks.md) - 自動化腳本
- [應用程式洞察整合](docs/chapter-06-pre-deployment/application-insights.md) - 監控與可觀察性
- [多代理協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) - 代理編排策略

#### 實務成果
在執行之前驗證和優化部署

---

### 第7章：故障排除與除錯 (1-1.5 小時) 🔧
<strong>先決條件</strong>：完成任何部署章節  
<strong>複雜度</strong>：⭐⭐

#### 你將學到
- 系統化除錯方法
- 常見問題與解決方案
- AI 專用故障排除
- 效能優化

#### 學習資源
- [常見問題](docs/chapter-07-troubleshooting/common-issues.md) - 常見問答與解決方案
- [除錯指南](docs/chapter-07-troubleshooting/debugging.md) - 分步驟策略
- [AI 專用故障排除](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI 服務問題

#### 實務成果
獨立診斷並解決常見部署問題

---

### 第8章：生產與企業模式 (2-3 小時) 🏢
<strong>先決條件</strong>：完成第1至4章  
<strong>複雜度</strong>：⭐⭐⭐⭐

#### 你將學到
- 生產部署策略
- 企業安全模式
- 監控與成本優化
- 可擴展性與治理

- 生產容器應用部署最佳實踐（安全性、監控、成本、CI/CD）

#### 學習資源
- [生產AI最佳實踐](docs/chapter-08-production/production-ai-practices.md) - 企業模式
- 微服務與企業範例
- 監控與治理框架
- [微服務架構範例](../../examples/container-app/microservices) - 藍綠部署/金絲雀部署、分散式追蹤與成本優化

#### 實務成果
部署具備完整生產能力的企業就緒應用程式

---

## 學習進程與複雜度

### 進階技能構建

- **🌱 初學者**：從第1章（基礎）→第2章（AI開發）開始
- **🔧 中階**：第3至4章（配置與基礎設施）→第6章（驗證）
- **🚀 進階**：第5章（多代理解決方案）→第7章（故障排除）
- **🏢 企業**：完成所有章節，專注第8章（生產模式）

- <strong>容器應用路徑</strong>：第4章（容器化部署）、第5章（微服務整合）、第8章（生產最佳實踐）

### 複雜度指標

- **⭐ 基礎**：單一概念，指導式教學，30-60分鐘
- **⭐⭐ 中階**：多重概念，實作練習，1-2小時  
- **⭐⭐⭐ 進階**：複雜架構，自訂解決方案，1-3小時
- **⭐⭐⭐⭐ 專家**：生產系統，企業模式，2-4小時

### 靈活學習路徑

#### 🎯 AI 開發者快速通道（4-6 小時）
1. **第1章**：基礎與快速入門（45分鐘）
2. **第2章**：AI優先開發（2小時）  
3. **第5章**：多代理 AI 解決方案（3小時）
4. **第8章**：生產AI最佳實踐（1小時）

#### 🛠️ 基礎設施專家路徑（5-7 小時）
1. **第1章**：基礎與快速入門（45分鐘）
2. **第3章**：配置與認證（1小時）
3. **第4章**：基礎設施即代碼與部署（1.5小時）
4. **第6章**：部署前驗證與規劃（1小時）
5. **第7章**：故障排除與除錯（1.5小時）
6. **第8章**：生產與企業模式（2小時）

#### 🎓 完整學習旅程（8-12 小時）
按序完成所有8章，並進行實作練習與驗證

## 課程完成框架

### 知識驗證
- <strong>章節檢查點</strong>：具體實作題目，具備可衡量結果
- <strong>實作驗證</strong>：每章部署可運作的解決方案
- <strong>進度追蹤</strong>：視覺指標與完成徽章
- <strong>社群驗證</strong>：在 Azure Discord 頻道分享經驗

### 學習成果評估

#### 第1-2章完成（基礎 + AI）
- ✅ 使用 AZD 部署基本網頁應用程式
- ✅ 部署具 RAG 功能的 AI 聊天應用程式
- ✅ 理解 AZD 核心概念與 AI 整合

#### 第3-4章完成（配置 + 基礎設施）  
- ✅ 管理多環境部署
- ✅ 建立自訂 Bicep 基礎設施範本
- ✅ 實現安全的認證模式

#### 第5-6章完成（多代理 + 驗證）
- ✅ 部署複雜的多代理 AI 解決方案
- ✅ 執行容量規劃與成本優化
- ✅ 實施自動化部署前驗證

#### 第7-8章完成（故障排除 + 生產）
- ✅ 獨立除錯並解決部署問題  
- ✅ 實施企業級監控與安全
- ✅ 部署具治理的生產就緒應用程式

### 證書與認可
- <strong>課程完成徽章</strong>：實作驗證後完成所有8章
- <strong>社群認可</strong>：積極參與 Microsoft Foundry Discord
- <strong>專業發展</strong>：具產業相關的 AZD 與 AI 部署技能
- <strong>事業提升</strong>：企業就緒的雲端部署能力

## 🎓 全面學習成果

### 基礎等級（第1-2章）
完成基礎章節後，學員能展現：

**技術能力：**
- 使用 AZD 指令部署簡易網頁應用程式
- 配置與部署具 RAG 功能的 AI 聊天應用程式
- 理解 AZD 核心概念：範本、環境、佈建流程
- 將 Microsoft Foundry 服務與 AZD 部署整合
- 操作 Azure AI 服務配置與 API 端點

**專業技能：**
- 遵循結構化部署流程以達成一致結果
- 使用日誌與文件故障排除基本部署問題
- 有效溝通雲端部署流程
- 採用安全的 AI 服務整合最佳實踐

**學習驗證：**
- ✅ 成功部署 `todo-nodejs-mongo` 範本
- ✅ 部署與配置具 RAG 的 `azure-search-openai-demo`
- ✅ 完成互動式工作坊練習（探索階段）
- ✅ 參與 Azure Discord 社群討論

### 中階等級（第3-4章）
完成中階章節後，學員能展現：

**技術能力：**
- 管理多環境部署（開發、測試、生產）
- 建立基礎設施即代碼的自訂 Bicep 範本
- 實施具管理身份的安全認證模式
- 部署具自訂配置的複雜多服務應用程式
- 優化資源佈建策略以提升成本與效能

**專業技能：**
- 設計可擴展基礎設施架構
- 實踐雲端部署安全最佳實踐
- 撰寫基礎設施模式文件以促進團隊協作
- 評估並選擇適合需求的 Azure 服務

**學習驗證：**
- ✅ 配置具環境特定設定的分開環境
- ✅ 建立並部署多服務應用的自訂 Bicep 範本
- ✅ 實施安全存取的管理身份認證
- ✅ 完成具真實場景的配置管理練習

### 進階等級（第5-6章）
完成進階章節後，學員能展現：

**技術能力：**
- 部署並編排多代理 AI 解決方案及協同工作流程
- 實施零售場景的客戶和庫存代理架構
- 進行全面容量規劃與資源驗證
- 執行自動化部署前驗證與優化
- 基於工作負載需求設計成本效益 SKU 選擇

**專業技能：**
- 架構生產環境的複雜 AI 解決方案
- 主持 AI 部署策略的技術討論
- 指導初階開發人員 AZD 與 AI 部署最佳實踐
- 評估與推薦符合業務需求的 AI 架構模式

**學習驗證：**
- ✅ 審視零售多代理藍圖並區分已配置基礎設施與缺失的應用實作
- ✅ 展示代理協調與工作流程編排能力
- ✅ 完成具真實資源限制的容量規劃練習
- ✅ 通過自動化飛行前檢查驗證部署準備

### 專家等級（第7-8章）
完成專家章節後，學員能展現：

**技術能力：**
- 獨立診斷並解決複雜部署問題
- 實施企業級安全模式與治理框架
- 設計完整監控與警示策略
- 優化生產部署的規模、成本與效能
- 建立具適當測試與驗證的 CI/CD 管線

**專業技能：**
- 引領企業雲端轉型專案
- 設計與實作組織部署標準
- 培訓並指導開發團隊進階 AZD 實務
- 影響企業 AI 部署技術決策

**學習驗證：**
- ✅ 解決複雜多服務部署失敗問題
- ✅ 實施符合合規要求的企業安全模式
- ✅ 設計並部署使用應用程式洞察的生產監控
- ✅ 完成企業治理框架實作

## 🎯 課程完成證書

### 進度追蹤框架
透過結構化檢查點追蹤你的學習進展：

- [ ] **第1章**：基礎與快速入門 ✅
- [ ] **第2章**：AI優先開發 ✅  
- [ ] **第3章**：配置與認證 ✅
- [ ] **第4章**：基礎設施即代碼與部署 ✅
- [ ] **第5章**：多代理 AI 解決方案 ✅
- [ ] **第6章**：部署前驗證與規劃 ✅
- [ ] **第7章**：故障排除與除錯 ✅
- [ ] **第8章**：生產與企業模式 ✅

### 驗證流程
完成每章節後，透過以下方法驗證你的知識：

1. <strong>實作練習完成</strong>：部署每章可運作的解決方案
2. <strong>知識評估</strong>：檢視常見問題區並完成自我評量
3. <strong>社群參與</strong>：在 Azure Discord 分享經驗並獲取回饋
4. <strong>作品集建置</strong>：紀錄你的部署與學習經驗
5. <strong>同儕審核</strong>：與其他學員合作解決複雜情境

### 課程完成效益
完成所有章節並通過驗證後，畢業生將擁有：

**技術專長：**
- <strong>生產經驗</strong>：在 Azure 環境部署真實 AI 應用
- <strong>專業技能</strong>：具企業就緒的部署與故障排除能力  
- <strong>架構知識</strong>：多代理 AI 解決方案與複雜基礎設施模式
- <strong>故障排除精通</strong>：獨立解決部署與配置問題

**專業發展：**
- <strong>業界認可</strong>：具備熱門 AZD 與 AI 部署領域的驗證技能
- <strong>職涯提升</strong>：取得雲端架構師及 AI 部署專家資格
- <strong>社群領導</strong>：積極參與 Azure 開發者與 AI 社群
- <strong>持續學習</strong>：奠定進階 Microsoft Foundry 專精基礎

**作品集資產：**
- <strong>已部署的解決方案</strong>：AI 應用與基礎設施模式的實作範例
- <strong>文件資源</strong>：完整的部署指南與故障排除流程  
- <strong>社群貢獻</strong>：與 Azure 社群分享的討論、範例與改進
- <strong>專業網絡</strong>：與 Azure 專家及 AI 部署實務者的連結

### 課程後學習路徑
畢業生已準備好進入以下進階專精領域：
- **Microsoft Foundry 專家**：深度專精於 AI 模型部署與編排
- <strong>雲端架構領導</strong>：企業級部署設計與治理
- <strong>開發者社群領導</strong>：貢獻 Azure 範例與社群資源
- <strong>企業培訓</strong>：在組織內教授 AZD 與 AI 部署技能

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->