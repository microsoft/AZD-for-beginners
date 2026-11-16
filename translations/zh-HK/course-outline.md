# AZD 初學者課程大綱與學習框架

## 課程概覽

透過結構化章節掌握 Azure Developer CLI (azd)，設計為逐步學習。**特別聚焦於與 Microsoft Foundry 整合的 AI 應用部署。**

### 本課程對現代開發者的重要性

部署 AI 工作負載的開發者常需要指導：
- 複雜多服務的 AI 架構
- 生產環境 AI 部署最佳實踐  
- Azure AI 服務整合與配置
- AI 工作負載成本優化
- AI 專屬部署問題故障排除

### 核心學習目標

完成此結構化課程後，您將會：
- **掌握 AZD 基礎**：核心概念、安裝與配置
- **部署 AI 應用**：使用 AZD 與 Microsoft Foundry 服務
- <strong>實作基礎設施即代碼</strong>：用 Bicep 範本管理 Azure 資源
- <strong>故障排除部署</strong>：解決常見問題及偵錯
- <strong>生產環境優化</strong>：安全性、擴展性、監控與成本管理
- <strong>建立多代理解決方案</strong>：部署複雜 AI 架構

## 🎓 工作坊學習體驗

### 靈活的學習授課選項
本課程設計支援 <strong>自學模式</strong> 與 <strong>引導式工作坊</strong>，讓學習者透過互動練習獲得實作經驗並發展實用技能。

#### 🚀 自學模式
<strong>非常適合個人開發者及持續學習</strong>

**特色：**
- <strong>瀏覽器介面</strong>：完整的 MkDocs 支援工作坊，透過任何瀏覽器使用
- **GitHub Codespaces 整合**：一鍵啟動預先配置的開發環境
- **互動 DevContainer 環境**：無需本地設定，立即開始寫代碼
- <strong>進度追蹤</strong>：內建檢查點及驗證練習
- <strong>社群支援</strong>：可透過 Azure Discord 頻道提問與協作

**學習結構：**
- <strong>彈性時間</strong>：可在數天或數週內自訂進度完成章節
- <strong>檢查系統</strong>：通過驗證後進入更複雜主題
- <strong>資源庫</strong>：完整文件、範例與故障排除指南
- <strong>作品集開發</strong>：建立可部署的專案用於專業作品集

**開始自學：**
```bash
# Option 1: GitHub Codespaces (Recommended)
# Navigate to the repository and click "Code" → "Create codespace on main"

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow setup instructions in workshop/README.md
```

#### 🏛️ 引導式工作坊
**適合企業培訓、訓練營與教育機構**

**工作坊格式選項：**

**📚 學術課程整合 (8-12 週)**
- <strong>大學課程</strong>：學期制課程，每週2小時
- <strong>訓練營格式</strong>：密集3-5天課程，每日6-8小時
- <strong>企業培訓</strong>：每月團隊課程，含實務專案實作
- <strong>評量架構</strong>：分數作業、同儕評審與期末專案

**🚀 密集工作坊 (1-3 天)**
- **第1天**：基礎與 AI 開發（第1-2章） - 6小時
- **第2天**：配置與基礎設施（第3-4章） - 6小時  
- **第3天**：進階模式與生產（第5-8章） - 8小時
- <strong>後續</strong>：可選2週導師輔導完成專案

**⚡ 執行長簡報 (4-6 小時)**
- <strong>策略概述</strong>：AZD 價值主張與商業影響 (1小時)
- <strong>實作示範</strong>：端到端部署 AI 應用 (2小時)
- <strong>架構審查</strong>：企業模式與治理 (1小時)
- <strong>實施規劃</strong>：組織採用策略 (1-2 小時)

#### 🛠️ 工作坊學習方法
**探索 → 部署 → 客製化，實踐操作技能發展**

**第一階段：探索 (45 分鐘)**
- <strong>範本探究</strong>：評估 Microsoft Foundry 範本與服務
- <strong>架構分析</strong>：理解多代理模式與部署策略
- <strong>需求評估</strong>：確認組織需求與限制
- <strong>環境設置</strong>：配置開發環境與 Azure 資源

**第二階段：部署 (2 小時)**
- <strong>引導實作</strong>：步驟式部署 AI 應用使用 AZD
- <strong>服務配置</strong>：設定 Azure AI 服務、端點和認證
- <strong>安全實施</strong>：應用企業安全模式與存取控制
- <strong>驗證測試</strong>：檢查部署結果並解決常見問題

**第三階段：客製化 (45 分鐘)**
- <strong>應用修改</strong>：根據使用需求調整範本
- <strong>生產優化</strong>：實施監控、成本管理與擴展策略
- <strong>進階模式</strong>：探索多代理協調與複雜架構
- <strong>後續規劃</strong>：訂定持續技能發展學習路徑

#### 🎯 工作坊學習成果
<strong>透過實作練習具體發展技能</strong>

**技術能力：**
- **部署生產環境 AI 應用**：成功部署並配置 AI 驅動解決方案
- <strong>基礎設施即代碼精通</strong>：創建及管理自訂 Bicep 範本
- <strong>多代理架構</strong>：實作協調式 AI 代理方案
- <strong>生產準備</strong>：應用安全、監控及治理模式
- <strong>故障排除專長</strong>：獨立解決部署及配置問題

**專業技能：**
- <strong>專案領導</strong>：帶領技術團隊執行雲端部署
- <strong>架構設計</strong>：設計可擴充且具成本效益的 Azure 解決方案
- <strong>知識傳遞</strong>：指導同事 AZD 最佳實務
- <strong>策略規劃</strong>：影響組織雲端採用策略

#### 📋 工作坊資源與教材
<strong>為引導者與學習者提供全面工具包</strong>

**給引導者：**
- <strong>講師指南</strong>：[工作坊概覽](workshop/README.md) - 課程規劃與教學指引
- <strong>簡報素材</strong>：投影片、架構圖與示範腳本
- <strong>評估工具</strong>：實作練習、知識檢查與評分標準
- <strong>技術設置</strong>：環境配置、故障排除指南與備用方案

**給學習者：**
- <strong>互動工作坊環境</strong>：[工作坊材料](workshop/README.md) - 瀏覽器式學習平台
- <strong>逐步說明</strong>：[引導練習](../../workshop/docs/instructions) - 詳細實作導引  
- <strong>參考文件</strong>：[AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI 深度專題
- <strong>社群資源</strong>：Azure Discord 頻道、GitHub 討論與專家支援

#### 🏢 企業工作坊實施
<strong>組織部署與培訓策略</strong>

**企業培訓方案：**
- <strong>開發者入門</strong>：新進員工 AZD 基礎導向 (2-4 週)
- <strong>團隊提升</strong>：現有團隊季度工作坊 (1-2 天)
- <strong>架構審查</strong>：每月資深工程師與架構師會議 (4 小時)
- <strong>領導簡報</strong>：技術決策者高階研討會（半天）

**實施支援：**
- <strong>客製化課程設計</strong>：針對組織需求量身打造內容
- <strong>試點計畫管理</strong>：結構化推廣，具成功指標與反饋機制  
- <strong>持續導師指導</strong>：工作坊後專案支援
- <strong>社群建設</strong>：內部 Azure AI 開發者社群與知識分享

**成功指標：**
- <strong>技能獲取</strong>：前後測評量技術能力成長
- <strong>部署成功率</strong>：成功部署生產應用的參與者比例
- <strong>投入產出時間</strong>：新 Azure AI 專案縮短上手時間
- <strong>知識留存</strong>：工作坊後 3-6 個月追蹤評估

## 8 章學習結構

### 第一章：基礎與快速入門 (30-45 分鐘) 🌱
<strong>先決條件</strong>：Azure 訂閱、基本命令列知識  
<strong>難度</strong>：⭐

#### 您將學到的內容
- 了解 Azure Developer CLI 基礎
- 在您的平台安裝 AZD  
- 第一次成功部署
- 核心概念與術語

#### 學習資源
- [AZD 基礎](docs/chapter-01-foundation/azd-basics.md) - 核心概念
- [安裝及設定](docs/chapter-01-foundation/installation.md) - 平台專用指引
- [您的第一個專案](docs/chapter-01-foundation/first-project.md) - 實作教學
- [指令速查表](resources/cheat-sheet.md) - 快速參考

#### 實務成果
使用 AZD 成功部署簡單的網頁應用到 Azure

---

### 第二章：AI 優先開發 (1-2 小時) 🤖
<strong>先決條件</strong>：完成第一章  
<strong>難度</strong>：⭐⭐

#### 您將學到的內容
- Microsoft Foundry 與 AZD 整合
- 部署 AI 驅動應用
- 了解 AI 服務配置
- RAG（檢索增強生成）模式

#### 學習資源
- [Microsoft Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- [AI 模型部署](docs/chapter-02-ai-development/ai-model-deployment.md)
- [AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - <strong>全新</strong>：完整 2-3 小時實作實驗
- [互動式工作坊指引](workshop/README.md) - <strong>全新</strong>：瀏覽器式 MkDocs 預覽工作坊
- [Microsoft Foundry 範本](README.md#featured-microsoft-foundry-templates)
- [工作坊指令](../../workshop/docs/instructions) - <strong>全新</strong>：逐步引導練習

#### 實務成果
部署並配置具有 RAG 功能的 AI 聊天應用

#### 工作坊學習路徑（可選加強）
<strong>全新互動體驗</strong>：[完整工作坊指南](workshop/README.md)
1. <strong>探索</strong>（30 分鐘）：範本選擇與評估
2. <strong>部署</strong>（45 分鐘）：部署並驗證 AI 範本功能  
3. <strong>拆解</strong>（30 分鐘）：了解範本架構與元件
4. <strong>配置</strong>（30 分鐘）：自訂設定與參數
5. <strong>客製化</strong>（45 分鐘）：修改並迭代成專屬方案
6. <strong>拆除</strong>（15 分鐘）：清理資源及理解生命週期
7. <strong>結束</strong>（15 分鐘）：下一步與進階學習路徑

---

### 第三章：配置與認證 (45-60 分鐘) ⚙️
<strong>先決條件</strong>：完成第一章  
<strong>難度</strong>：⭐⭐

#### 您將學到的內容
- 環境配置與管理
- 認證與安全最佳實踐
- 資源命名與組織
- 多環境部署

#### 學習資源
- [配置指南](docs/chapter-03-configuration/configuration.md) - 環境設定
- [認證與安全模式](docs/chapter-03-configuration/authsecurity.md) - 管理身份與 Key Vault 整合
- 多環境示例

#### 實務成果
妥善管理多個環境，並確保正確的認證與安全性

---

### 第四章：基礎設施即代碼與部署 (1-1.5 小時) 🏗️
<strong>先決條件</strong>：完成第一至三章  
<strong>難度</strong>：⭐⭐⭐

#### 您將學到的內容
- 進階部署模式
- 使用 Bicep 的基礎設施即代碼
- 資源佈建策略
- 自訂範本建立

- 使用 Azure Container Apps 與 AZD 容器化應用部署

#### 學習資源
- [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) - 完整工作流程
- [資源佈建](docs/chapter-04-infrastructure/provisioning.md) - 資源管理
- 容器與微服務示例
- [容器應用示例](examples/container-app/README.md) - 快速入門、生產與進階部署模式

#### 實務成果
使用自訂的基礎設施範本部署複雜多服務應用

---

### 第五章：多代理 AI 解決方案 (2-3 小時) 🤖🤖
<strong>先決條件</strong>：完成第一至二章  
<strong>難度</strong>：⭐⭐⭐⭐

#### 您將學到的內容
- 多代理架構模式
- 代理編排與協調
- 生產環境 AI 部署
- 客戶與庫存代理實現

- 整合容器化微服務作為代理方案一部分

#### 學習資源
- [零售多代理解決方案](examples/retail-scenario.md) - 架構藍圖，非完整應用
- [ARM 範本套件](../../examples/retail-multiagent-arm-template) - 基礎設施腳手架與實施先決條件
- 多代理協調模式
- [微服務架構範例](../../examples/container-app/microservices) - 服務間通訊、非同步訊息與生產部署

#### 實務成果
設計多代理 AI 解決方案，識別除佈建基礎設施外，應用實施、驗證與營運工作

---

### 第六章：部署前驗證與規劃 (1 小時) 🔍
<strong>先決條件</strong>：完成第四章  
<strong>難度</strong>：⭐⭐

#### 您將學到的內容
- 容量規劃與資源驗證
- SKU 選擇策略
- 預檢點與自動化
- 成本優化規劃

#### 學習資源
- [容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) - 資源驗證
- [SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) - 成本效益選擇
- [預檢點](docs/chapter-06-pre-deployment/preflight-checks.md) - 自動化腳本
- [Application Insights 整合](docs/chapter-06-pre-deployment/application-insights.md) - 監控與可觀察性
- [多代理協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) - 代理編排策略

#### 實務成果
在執行之前驗證並優化部署計劃

---

### 第七章：故障排除與除錯 (1-1.5 小時) 🔧
<strong>前置條件</strong>：完成任何部署章節  
<strong>複雜度</strong>：⭐⭐

#### 你將學習到的內容
- 系統化除錯方法
- 常見問題及解決方案
- AI 專用故障排除
- 性能優化

#### 學習資源
- [常見問題](docs/chapter-07-troubleshooting/common-issues.md) - 常見問答及方案
- [除錯指南](docs/chapter-07-troubleshooting/debugging.md) - 逐步策略
- [AI 專用故障排除](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI 服務問題

#### 實務成果
獨立診斷並解決常見部署問題

---

### 第8章：生產與企業範例（2-3 小時）🏢
<strong>前置條件</strong>：完成第1至4章  
<strong>複雜度</strong>：⭐⭐⭐⭐

#### 你將學習到的內容
- 生產環境部署策略
- 企業安全模式
- 監控與成本優化
- 可擴展性與治理

- 生產容器應用部署最佳實踐（安全性、監控、成本、CI/CD）

#### 學習資源
- [生產 AI 最佳實踐](docs/chapter-08-production/production-ai-practices.md) - 企業範例
- 微服務與企業範例
- 監控與治理框架
- [微服務架構範例](../../examples/container-app/microservices) - 藍綠/金絲雀部署、分散式追蹤及成本優化

#### 實務成果
部署具備完整生產能力的企業級應用程式

---

## 學習進度與複雜度

### 漸進式技能構建

- **🌱 初學者**：從第1章（基礎）→ 第2章（AI 開發）
- **🔧 中級**：第3-4章（配置與基礎架構）→ 第6章（驗證）
- **🚀 進階**：第5章（多代理解決方案）→ 第7章（故障排除）
- **🏢 企業**：完成所有章節，聚焦第8章（生產模式）

- <strong>容器應用路線</strong>：第4章（容器化部署）、第5章（微服務整合）、第8章（生產最佳實踐）

### 複雜度指標

- **⭐ 基礎**：單一概念、引導教學，30-60 分鐘
- **⭐⭐ 中級**：多重概念、實作練習，1-2 小時  
- **⭐⭐⭐ 進階**：複雜架構、自訂解決方案，1-3 小時
- **⭐⭐⭐⭐ 專家**：生產系統、企業模式，2-4 小時

### 彈性學習路線

#### 🎯 AI 開發者快速通道（4-6 小時）
1. **第1章**：基礎與快速入門（45 分鐘）
2. **第2章**：AI 優先開發（2 小時）  
3. **第5章**：多代理 AI 解決方案（3 小時）
4. **第8章**：生產 AI 最佳實踐（1 小時）

#### 🛠️ 基礎架構專家路線（5-7 小時）
1. **第1章**：基礎與快速入門（45 分鐘）
2. **第3章**：配置與身份驗證（1 小時）
3. **第4章**：基礎架構即代碼與部署（1.5 小時）
4. **第6章**：部署前驗證與規劃（1 小時）
5. **第7章**：故障排除與除錯（1.5 小時）
6. **第8章**：生產與企業模式（2 小時）

#### 🎓 全面學習旅程（8-12 小時）
按序完成所有8章，配合實作與驗證

## 課程完成框架

### 知識驗證
- <strong>章節檢查點</strong>：具體成果的實務練習
- <strong>實作驗證</strong>：為每章部署可運作方案
- <strong>進度追蹤</strong>：視覺化指標與完成徽章
- <strong>社群驗證</strong>：於 Azure Discord 頻道分享經驗

### 學習成果評估

#### 完成第1-2章（基礎 + AI）
- ✅ 使用 AZD 部署基本網頁應用
- ✅ 使用 RAG 部署 AI 聊天應用
- ✅ 了解 AZD 核心概念與 AI 整合

#### 完成第3-4章（配置 + 基礎架構）  
- ✅ 管理多環境部署
- ✅ 建立自訂 Bicep 基礎架構範本
- ✅ 實作安全身份驗證模式

#### 完成第5-6章（多代理 + 驗證）
- ✅ 部署複雜多代理 AI 解決方案
- ✅ 執行容量規劃與成本優化
- ✅ 實作自動化部署前驗證

#### 完成第7-8章（故障排除 + 生產）
- ✅ 獨立除錯並解決部署問題  
- ✅ 實作企業級監控與安全
- ✅ 部署具治理功能的生產級應用

### 認證與肯定
- <strong>課程完成徽章</strong>：完成全部8章並通過實務驗證
- <strong>社群肯定</strong>：積極參與 Microsoft Foundry Discord
- <strong>專業發展</strong>：產業相關 AZD 與 AI 部署技能
- <strong>職涯升遷</strong>：企業級雲端部署能力

## 🎓 全面學習成果

### 基礎級（第1-2章）
完成基礎章節後，學員將展現：

**技術能力：**
- 使用 AZD 命令部署簡易網頁應用程式
- 配置並部署具 RAG 能力的 AI 聊天應用
- 了解 AZD 核心概念：範本、環境、配置工作流程
- 整合 Microsoft Foundry 服務與 AZD 部署
- 熟悉 Azure AI 服務設定與 API 端點

**專業技能：**
- 遵循結構化部署流程以確保結果一致
- 利用日誌與文件排除基礎部署問題
- 有效溝通雲端部署流程
- 應用安全 AI 服務整合最佳實踐

**學習驗證：**
- ✅ 成功部署 `todo-nodejs-mongo` 範本
- ✅ 部署並配置具 RAG 的 `azure-search-openai-demo`
- ✅ 完成互動式工作坊練習（探索階段）
- ✅ 參與 Azure Discord 社群討論

### 中級（第3-4章）
完成中階章節後，學員將展現：

**技術能力：**
- 管理多環境部署（開發、測試、生產）
- 建立自訂 Bicep 基礎架構即代碼範本
- 實作以管理身份進行的安全認證模式
- 部署配置自訂的複雜多服務應用
- 優化資源佈建策略以提升成本效益與性能

**專業技能：**
- 設計可擴展基礎架構架構
- 實施雲端部署的安全最佳實踐
- 撰寫基礎架構模式文件促進團隊合作
- 評估並選擇適合的 Azure 服務以滿足需求

**學習驗證：**
- ✅ 配置具環境專屬設定的獨立環境
- ✅ 建立並部署多服務應用的自訂 Bicep 範本
- ✅ 實作管理身份認證以確保安全存取
- ✅ 完成真實案例的配置管理練習

### 進階（第5-6章）
完成進階章節後，學員將展現：

**技術能力：**
- 部署並協調多代理 AI 解決方案與工作流程
- 實作零售場景的客戶與庫存代理架構
- 進行全面的容量規劃與資源驗證
- 執行自動化部署前驗證與優化
- 針對工作負載需求設計成本效益的 SKU 選擇

**專業技能：**
- 架構生產環境的複雜 AI 解決方案
- 主導 AI 部署策略的技術討論
- 指導初級開發者 AZD 與 AI 部署最佳實務
- 評估並推薦符合業務需求的 AI 架構模式

**學習驗證：**
- ✅ 檢視零售多代理範本，區分已配置基礎架構與缺少的應用實作
- ✅ 展示代理協調與工作流程編排
- ✅ 完成真實資源限制下的容量規劃練習
- ✅ 通過自動化部署前檢查驗證部署準備度

### 專家級（第7-8章）
完成專家章節後，學員將展現：

**技術能力：**
- 獨立診斷並解決複雜部署問題
- 實作企業級安全模式與治理框架
- 設計完整的監控與告警策略
- 優化生產部署的擴展性、成本與性能
- 建立附帶測試與驗證的 CI/CD 流程

**專業技能：**
- 主導企業雲端轉型專案
- 設計與實作組織級部署標準
- 培訓及指導開發團隊於進階 AZD 實務
- 影響企業 AI 部署的技術決策

**學習驗證：**
- ✅ 解決複雜多服務部署失敗
- ✅ 實作符合合規要求的企業安全模式
- ✅ 設計並部署具 Application Insights 的生產監控
- ✅ 完成企業治理框架實作

## 🎯 課程完成認證

### 進度追蹤框架
透過結構化檢查點追蹤學習進度：

- [ ] **第1章**：基礎與快速入門 ✅
- [ ] **第2章**：AI 優先開發 ✅  
- [ ] **第3章**：配置與身份驗證 ✅
- [ ] **第4章**：基礎架構即代碼與部署 ✅
- [ ] **第5章**：多代理 AI 解決方案 ✅
- [ ] **第6章**：部署前驗證與規劃 ✅
- [ ] **第7章**：故障排除與除錯 ✅
- [ ] **第8章**：生產與企業模式 ✅

### 驗證流程
每完成一章後，透過下列方式驗證你的知識：

1. <strong>實作練習完成</strong>：部署每章的可運作解決方案
2. <strong>知識評估</strong>：檢視常見問答並完成自我評量
3. <strong>社群參與</strong>：於 Azure Discord 分享經驗並獲得回饋
4. <strong>作品集建立</strong>：紀錄你的部署與學習心得
5. <strong>同儕審核</strong>：與其他學員協作解決複雜場景

### 課程完成優勢
完成所有章節並通過驗證後，畢業生將具備：

**技術專業：**
- <strong>生產經驗</strong>：成功部署實際的 AI 應用於 Azure 環境
- <strong>專業能力</strong>：具備企業級部署與故障排除技能  
- <strong>架構知識</strong>：多代理 AI 解決方案與複雜基礎架構模式
- <strong>故障排除精通</strong>：能獨立解決部署及配置問題

**專業發展：**
- <strong>業界認可</strong>：具備需求量高的 AZD 與 AI 部署技能
- <strong>職涯升遷</strong>：具備雲端架構師與 AI 部署專家的資格
- <strong>社群領導</strong>：Azure 開發者與 AI 社群的活躍成員
- <strong>持續學習</strong>：奠定進階 Microsoft Foundry 專精基礎

**作品集資產：**
- <strong>部署範例</strong>：具實作價值的 AI 應用與基礎架構模式
- <strong>文件資料</strong>：完整的部署指南與故障排除流程  
- <strong>社群貢獻</strong>：分享於 Azure 社群的討論、範例與改良
- <strong>專業人脈</strong>：與 Azure 專家及 AI 部署實踐者建立連結

### 課後學習路線
畢業生可進階專精於：
- **Microsoft Foundry 專家**：深入 AI 模型部署與工作流程編排
- <strong>雲端架構領導</strong>：企業級部署設計與治理
- <strong>開發者社群領導</strong>：貢獻 Azure 範例與社群資源
- <strong>企業培訓</strong>：於組織內教授 AZD 與 AI 部署技能

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->