# AZD 初學者指南：課程大綱與學習架構

## 課程概覽

通過結構化章節掌握 Azure Developer CLI (azd)，設計為循序漸進的學習。**特別聚焦於結合 Microsoft Foundry 的 AI 應用部署。**

### 為何本課程對現代開發者至關重要

部署 AI 工作負載的開發者通常需要指導：
- 複雜的多服務 AI 架構
- 生產環境 AI 部署最佳實踐  
- Azure AI 服務整合與配置
- AI 工作負載的成本優化
- 解決 AI 特定部署問題的故障排除

### 核心學習目標

完成本結構化課程後，您將能：
- **掌握 AZD 基礎知識**：核心概念、安裝與配置
- **部署 AI 應用**：使用 AZD 與 Microsoft Foundry 服務
- <strong>實作基礎架構即程式碼</strong>：使用 Bicep 模板管理 Azure 資源
- <strong>故障排除部署問題</strong>：解決常見問題與調試
- <strong>優化生產環境</strong>：安全、擴展、監控與成本管理
- <strong>建置多代理解決方案</strong>：部署複雜 AI 架構

## 🎓 工作坊學習體驗

### 彈性學習交付方式
本課程設計支持 <strong>自我進度個人學習</strong> 及 <strong>引導式工作坊課程</strong>，讓學習者在互動練習中實作 AZD 並培養實務技能。

#### 🚀 自我進度學習模式
<strong>適合個人開發者與持續學習</strong>

**特色：**
- <strong>瀏覽器介面</strong>：完整 MkDocs 支援的工作坊，透過任意網頁瀏覽器訪問
- **GitHub Codespaces 整合**：一鍵啟動預配置開發環境
- **互動式 DevContainer 環境**：無需本地設定，即刻開始編碼
- <strong>進度追蹤</strong>：內建檢查點與驗證練習
- <strong>社群支援</strong>：可透過 Azure Discord 頻道提問與協作

**學習結構：**
- <strong>彈性時間</strong>：按您的節奏於數天或數週內完成章節
- <strong>檢查點系統</strong>：驗證學習成果後再進入更複雜主題
- <strong>資源庫</strong>：完整文件、範例和故障排除指引
- <strong>作品集開發</strong>：構建可部署專案，作為專業作品集

**開始學習（自我進度）：**
```bash
# Option 1: GitHub Codespaces (Recommended)
# Navigate to the repository and click "Code" → "Create codespace on main"

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow setup instructions in workshop/README.md
```

#### 🏛️ 引導式工作坊課程
**適合企業培訓、實戰訓練營與教育機構**

**工作坊格式選項：**

**📚 學術課程整合（8-12 週）**
- <strong>大學課程</strong>：學期制，每週 2 小時課程
- <strong>訓練營格式</strong>：密集 3-5 天課程，每日 6-8 小時
- <strong>企業培訓</strong>：每月團隊課程，結合實務項目實作
- <strong>評量架構</strong>：成績評定、同儕評審與期末專案

**🚀 密集工作坊（1-3 天）**
- **第 1 天**：基礎與 AI 開發（章節 1-2） - 6 小時
- **第 2 天**：配置與基礎架構（章節 3-4） - 6 小時  
- **第 3 天**：進階模式與生產環境（章節 5-8） - 8 小時
- <strong>後續支援</strong>：可選 2 週導師輔導達成專案

**⚡ 執行簡報（4-6 小時）**
- <strong>策略概覽</strong>：AZD 價值主張與商業影響（1 小時）
- <strong>實作示範</strong>：端到端部署 AI 應用（2 小時）
- <strong>架構審查</strong>：企業模式與治理（1 小時）
- <strong>實施規劃</strong>：組織採用策略（1-2 小時）

#### 🛠️ 工作坊學習方法
**探索 → 部署 → 客製化，培養實作技能**

**階段 1：探索 (45 分鐘)**
- <strong>模板探索</strong>：評估 Microsoft Foundry 模板與服務
- <strong>架構分析</strong>：了解多代理模式與部署策略
- <strong>需求評估</strong>：辨識組織需求與限制條件
- <strong>環境設定</strong>：配置開發環境與 Azure 資源

**階段 2：部署 (2 小時)**
- <strong>引導實作</strong>：逐步使用 AZD 部署 AI 應用
- <strong>服務配置</strong>：設定 Azure AI 服務、端點與認證
- <strong>安全實施</strong>：套用企業安全模式與存取控制
- <strong>驗證測試</strong>：確認部署並排解常見問題

**階段 3：客製化 (45 分鐘)**
- <strong>應用修改</strong>：依特定需求調整模板
- <strong>生產優化</strong>：實作監控、成本管理與擴展策略
- <strong>進階模式</strong>：探討多代理協調與複雜架構
- <strong>後續規劃</strong>：定義持續技能發展路徑

#### 🎯 工作坊學習成果
<strong>透過實作練習衡量技能成效</strong>

**技術能力：**
- **部署生產環境 AI 應用**：成功部署並配置 AI 解決方案
- <strong>基礎架構即程式碼掌握</strong>：建立與管理自訂 Bicep 模板
- <strong>多代理架構</strong>：實作協調的 AI 代理解決方案
- <strong>生產環境準備</strong>：應用安全、監控與治理模式
- <strong>故障排除專長</strong>：獨立解決部署與配置問題

**專業技能：**
- <strong>專案領導</strong>：帶領技術團隊推動雲端部署專案
- <strong>架構設計</strong>：設計可擴展且具成本效益的 Azure 解決方案
- <strong>知識傳承</strong>：培訓與指導同事 AZD 最佳實務
- <strong>策略規劃</strong>：影響組織雲端採用策略

#### 📋 工作坊資源與教材
<strong>為引導者與學習者提供的完整工具包</strong>

**引導者用：**
- <strong>講師指南</strong>：[工作坊概覽](workshop/README.md) - 課程規劃與執行指導
- <strong>簡報材料</strong>：投影片、架構圖與示範腳本
- <strong>評量工具</strong>：實務練習、知識測驗與評估標準
- <strong>技術設定</strong>：環境配置、疑難排解指南與備援方案

**學習者用：**
- <strong>互動式工作坊環境</strong>：[工作坊教材](workshop/README.md) - 基於瀏覽器的學習平臺
- <strong>逐步指示</strong>：[引導練習](../../workshop/docs/instructions) - 詳細實作步驟  
- <strong>參考文件</strong>：[AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - 專注 AI 深度探討
- <strong>社群資源</strong>：Azure Discord 頻道、GitHub 討論與專家支援

#### 🏢 企業工作坊實施
<strong>組織部署與訓練策略</strong>

**企業培訓計劃：**
- <strong>開發者入門教育</strong>：新員工導向，涵蓋 AZD 基礎 (2-4 週)
- <strong>團隊技能提升</strong>：現有開發團隊季度工作坊 (1-2 天)
- <strong>架構審查</strong>：給資深工程師與架構師的月度會議 (4 小時)
- <strong>領導簡報</strong>：針對技術決策者的高階工作坊 (半天)

**實施支援：**
- <strong>自訂工作坊設計</strong>：根據組織需求調整內容
- <strong>試點計劃管理</strong>：結構化推行，含成功指標與反饋環
- <strong>持續輔導</strong>：工作坊後的專案協助
- <strong>社群建立</strong>：組織內部 Azure AI 開發者社群與知識分享

**成功衡量指標：**
- <strong>技能習得</strong>：前後評量技術能力成長
- <strong>部署成功率</strong>：參與者成功部署生產應用的百分比
- <strong>生產力時間</strong>：縮短新 Azure AI 專案的入門時間
- <strong>知識保留</strong>：工作坊結束 3-6 個月後的後續評估

## 8 章節學習結構

### 第 1 章：基礎與快速起步 (30-45 分鐘) 🌱
<strong>先決條件</strong>：Azure 訂閱、基本指令行知識  
<strong>難度</strong>：⭐

#### 您會學到
- 了解 Azure Developer CLI 基礎
- 在您的平台上安裝 AZD  
- 您的第一次成功部署
- 核心概念與術語

#### 學習資源
- [AZD 基礎](docs/chapter-01-foundation/azd-basics.md) - 核心概念
- [安裝與設定](docs/chapter-01-foundation/installation.md) - 平台專屬指南
- [您的第一個專案](docs/chapter-01-foundation/first-project.md) - 實務教學
- [指令速查表](resources/cheat-sheet.md) - 快速參考

#### 實務成果
成功使用 AZD 將簡易 Web 應用部署至 Azure

---

### 第 2 章：AI 優先開發 (含工作坊 4-5 小時) 🤖
<strong>先決條件</strong>：完成第 1 章  
<strong>難度</strong>：⭐⭐

#### 您會學到
- Microsoft Foundry 與 AZD 整合
- GA `microsoft.foundry` 套件安裝與託管代理代碼部署
- 本地代理檢查與獨立評估資料集/評分標準
- 部署 AI 應用
- 了解 AI 服務配置
- RAG（檢索增強生成）模式

#### 學習資源
- [Microsoft Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- [託管代理導覽 (GA)](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) - 初始化、檢視 `azure.yaml`、佈建、本地測試、部署、評估與清理
- [AI 代理指南](docs/chapter-02-ai-development/agents.md)
- [AI 模型部署](docs/chapter-02-ai-development/ai-model-deployment.md)
- [AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - <strong>新</strong>：全面 2-3 小時實作實驗
- [互動工作坊指南](workshop/README.md) - <strong>新</strong>：基於瀏覽器的 MkDocs 預覽工作坊
- [Microsoft Foundry 模板](README.md#featured-microsoft-foundry-templates)
- [工作坊指示](../../workshop/docs/instructions) - <strong>新</strong>：逐步引導練習

#### 實務成果
使用 GA 套件本地與 Foundry 中測試託管代理，檢視評估結果，並區分新專案與重用專案的清理。獨立的 RAG/工作坊路徑涵蓋配置 AI 聊天應用。

#### 工作坊學習路徑（選用強化）
<strong>新互動體驗</strong>：[完整工作坊指南](workshop/README.md)
1. <strong>探索</strong> (30 分鐘)：模板選擇與評估
2. <strong>部署</strong> (45 分鐘)：部署並驗證 AI 模板功能  
3. <strong>解構</strong> (30 分鐘)：理解模板架構與元件
4. <strong>設定</strong> (30 分鐘)：客製化設置與參數
5. <strong>客製化</strong> (45 分鐘)：修改並迭代使其貼合您需求
6. <strong>拆除</strong> (15 分鐘)：清理資源並了解生命周期
7. <strong>結業</strong> (15 分鐘)：後續步驟與進階學習路徑

---

### 第 3 章：配置與認證 (45-60 分鐘) ⚙️
<strong>先決條件</strong>：完成第 1 章  
<strong>難度</strong>：⭐⭐

#### 您會學到
- 環境配置與管理
- 認證與安全最佳實踐
- 資源命名與組織
- 多環境部署

#### 學習資源
- [配置指南](docs/chapter-03-configuration/configuration.md) - 環境設定
- [認證與安全模式](docs/chapter-03-configuration/authsecurity.md) - 管理身分與 Key Vault 整合
- 多環境範例

#### 實務成果
管理多個環境並實施妥善的認證與安全措施

---

### 第 4 章：基礎架構即程式碼與部署 (1-1.5 小時) 🏗️
<strong>先決條件</strong>：完成第 1-3 章  
<strong>難度</strong>：⭐⭐⭐

#### 您會學到
- 進階部署模式
- 使用 Bicep 進行基礎架構即程式碼
- 資源供應策略
- 自訂模板建立

- 使用 Azure Container Apps 與 AZD 部署容器化應用

#### 學習資源
- [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) - 完整流程
- [資源供應](docs/chapter-04-infrastructure/provisioning.md) - 資源管理
- 容器與微服務範例
- [容器應用範例](examples/container-app/README.md) - 快速入門、生產環境與進階部署模式

#### 實務成果
使用自訂基礎架構模板部署複雜多服務應用程式

---

### 第 5 章：多代理 AI 解決方案 (2-3 小時) 🤖🤖
<strong>先決條件</strong>：完成第 1-2 章  
<strong>難度</strong>：⭐⭐⭐⭐

#### 您會學到
- 多代理架構模式
- 代理編排與協調
- 生產環境 AI 部署
- 客戶與庫存代理實作

- 容器化微服務集成為代理解決方案一部分

#### 學習資源
- [零售多代理解決方案](examples/retail-scenario.md) - 架構藍圖，非完整應用
- [ARM 模板套件](../../examples/retail-multiagent-arm-template) - 基礎架構腳手架與實作前置條件
- 多代理協調模式
- [微服務架構範例](../../examples/container-app/microservices) - 服務間通訊、非同步通訊與生產部署

#### 實務成果
設計多代理 AI 解決方案，識別除基礎架構供應外應用實作、驗證與營運工作

---

### 第 6 章：部署前驗證與規劃 (1 小時) 🔍
<strong>先決條件</strong>：完成第 4 章  
<strong>難度</strong>：⭐⭐

#### 您會學到
- 容量規劃與資源驗證
- SKU 選擇策略
- 起飛前檢查與自動化
- 成本優化規劃

#### 學習資源
- [容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) - 資源驗證
- [SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) - 成本效益的選擇
- [飛行前檢查](docs/chapter-06-pre-deployment/preflight-checks.md) - 自動化腳本
- [應用洞察整合](docs/chapter-06-pre-deployment/application-insights.md) - 監控與可觀察性
- [多代理協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) - 代理協作策略

#### 實務成果
在執行前驗證與優化部署

---

### 第七章：除錯與故障排除 (1-1.5 小時) 🔧
<strong>先決條件</strong>：完成任一部署章節  
<strong>難度</strong>：⭐⭐

#### 你將學到
- 系統化除錯方法
- 常見問題與解決方案
- AI 專用故障排除
- 效能優化

#### 學習資源
- [常見問題](docs/chapter-07-troubleshooting/common-issues.md) - FAQ 和解答
- [除錯指南](docs/chapter-07-troubleshooting/debugging.md) - 逐步策略
- [AI 專用故障排除](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI 服務問題

#### 實務成果
能獨立診斷並解決常見部署問題

---

### 第八章：生產與企業模式 (2-3 小時) 🏢
<strong>先決條件</strong>：完成第 1-4 章  
<strong>難度</strong>：⭐⭐⭐⭐

#### 你將學到
- 生產部署策略
- 企業安全模式
- 監控與成本優化
- 可擴展性與治理

- 生產容器應用部署最佳實踐（安全性、監控、成本、CI/CD）

#### 學習資源
- [生產 AI 最佳實踐](docs/chapter-08-production/production-ai-practices.md) - 企業模式
- 微服務與企業範例
- 監控與治理框架
- [微服務架構範例](../../examples/container-app/microservices) - 藍綠/金絲雀部署、分散式追蹤、成本優化

#### 實務成果
部署具備完整生產能力的企業級應用

---

## 學習進階與難度

### 逐步技能建構

- **🌱 初學者**：從第 1 章（基礎）→ 第 2 章（AI 開發）開始
- **🔧 中階者**：第 3-4 章（設定與基礎架構）→ 第 6 章（驗證）
- **🚀 高階者**：第 5 章（多代理方案）→ 第 7 章（故障排除）
- **🏢 企業者**：完成所有章節，重點放在第 8 章（生產模式）

- <strong>容器應用路徑</strong>：第 4 章（容器化部署）、第 5 章（微服務整合）、第 8 章（生產最佳實踐）

### 難度指標

- **⭐ 基礎**：單一概念、引導教學、30-60 分鐘
- **⭐⭐ 中階**：多概念、實作練習、1-2 小時  
- **⭐⭐⭐ 高階**：複雜架構、自訂解決方案、1-3 小時
- **⭐⭐⭐⭐ 專家**：生產系統、企業模式、2-4 小時

### 彈性學習路徑

#### 🎯 AI 開發者快速通道 (4-6 小時)
1. **第 1 章**：基礎與快速入門 (45 分鐘)
2. **第 2 章**：AI 首開發 (2 小時)  
3. **第 5 章**：多代理 AI 解決方案 (3 小時)
4. **第 8 章**：生產 AI 最佳實踐 (1 小時)

#### 🛠️ 基礎架構專家路徑 (5-7 小時)
1. **第 1 章**：基礎與快速入門 (45 分鐘)
2. **第 3 章**：設定與認證 (1 小時)
3. **第 4 章**：基礎架構即程式碼與部署 (1.5 小時)
4. **第 6 章**：部署前驗證與規劃 (1 小時)
5. **第 7 章**：故障排除與除錯 (1.5 小時)
6. **第 8 章**：生產與企業模式 (2 小時)

#### 🎓 完整學習旅程 (8-12 小時)
順序完成所有 8 章並實作驗證

## 課程完成架構

### 知識驗證
- <strong>章節檢查點</strong>：具體練習與可衡量成果
- <strong>實作驗證</strong>：為每章部署可運行方案
- <strong>進度追蹤</strong>：可視化指標與完成徽章
- <strong>社群驗證</strong>：於 Azure Discord 頻道分享經驗

### 學習成果評估

#### 第 1-2 章完成（基礎 + AI）
- ✅ 使用 AZD 部署基本網頁應用
- ✅ 部署含 RAG 的 AI 聊天應用
- ✅ 理解 AZD 核心概念與 AI 整合

#### 第 3-4 章完成（設定 + 基礎架構）  
- ✅ 管理多環境部署
- ✅ 建立自訂 Bicep 基礎架構模板
- ✅ 實施安全認證模式

#### 第 5-6 章完成（多代理 + 驗證）
- ✅ 部署複雜多代理 AI 解決方案
- ✅ 執行容量規劃與成本優化
- ✅ 實施自動化部署前驗證

#### 第 7-8 章完成（故障排除 + 生產）
- ✅ 獨立除錯及解決部署問題  
- ✅ 實施企業級監控及安全
- ✅ 部署具治理能力的生產應用

### 證書與認可
- <strong>課程完成徽章</strong>：完成所有 8 章並通過實務驗證
- <strong>社群認可</strong>：積極參與 Microsoft Foundry Discord
- <strong>專業發展</strong>：具產業認可 AZD 與 AI 部署技能
- <strong>職涯進階</strong>：企業級雲端部署能力

## 🎓 全面學習成果

### 基礎級（第 1-2 章）
完成基礎章節後，學員將展現：

**技術能力：**
- 使用 AZD 指令部署簡易網頁應用至 Azure
- 配置部署具 RAG 功能的 AI 聊天應用
- 理解 AZD 核心概念：模板、環境、佈建流程
- 將 Microsoft Foundry 服務整合入 AZD 部署
- 熟悉 Azure AI 服務配置與 API 端點

**專業技能：**
- 遵循結構化部署流程以確保一致結果
- 使用日誌與文件排解基礎部署問題
- 有效溝通雲端部署流程
- 應用安全 AI 服務整合的最佳實務

**學習驗證：**
- ✅ 成功部署 `todo-nodejs-mongo` 模板
- ✅ 使用 RAG 部署並配置 `azure-search-openai-demo`
- ✅ 完成互動式工作坊練習（探索階段）
- ✅ 參與 Azure Discord 社群討論

### 中階級（第 3-4 章）
完成中階章節後，學員將展現：

**技術能力：**
- 管理多環境部署（開發、測試、生產）
- 建立自訂 Bicep 模板作基礎架構即程式碼
- 實施安全認證模式，使用管理身份
- 部署複雜多服務應用並自訂配置
- 優化資源佈建策略以達成成本與效能

**專業技能：**
- 設計可擴展的基礎架構架構
- 實施雲端部署安全最佳實踐
- 文件化基礎架構模式促進團隊協作
- 評估並選擇適合的 Azure 服務以符合需求

**學習驗證：**
- ✅ 配置獨立環境並擁有環境特定設定
- ✅ 建立並部署多服務應用的自訂 Bicep 模板
- ✅ 實施管理身份認證以確保安全存取
- ✅ 完成包含實際案例的設定管理練習

### 高階級（第 5-6 章）
完成高階章節後，學員將展現：

**技術能力：**
- 部署並協調多代理 AI 解決方案，執行協同工作流程
- 實施零售場景的客戶及庫存代理架構
- 進行全面容量規劃與資源驗證
- 執行自動化部署前驗證與優化
- 根據工作負載需求設計成本效益良好的 SKU 選擇

**專業技能：**
- 建築生產環境的複雜 AI 解決方案
- 主導 AI 部署策略的技術討論
- 指導初級開發者掌握 AZD 與 AI 部署最佳實務
- 評估與推薦業務需求的 AI 架構模式

**學習驗證：**
- ✅ 審核零售多代理藍圖，區分已佈建基礎架構與缺失應用實作
- ✅ 示範代理協調與工作流程編排
- ✅ 完成具真實資源約束的容量規劃練習
- ✅ 通過自動化飛行前檢查驗證部署準備

### 專家級（第 7-8 章）
完成專家章節後，學員將展現：

**技術能力：**
- 獨立診斷並解決複雜部署問題
- 實施企業級安全模式與治理框架
- 設計全面監控與警示策略
- 優化生產部署的擴展性、成本與效能
- 建立帶有適當測試與驗證的 CI/CD 管道

**專業技能：**
- 主導企業雲端轉型計畫
- 設計並實施組織部署標準
- 培訓並指導開發團隊掌握進階 AZD 實務
- 影響企業 AI 部署的技術決策

**學習驗證：**
- ✅ 解決複雜多服務部署失敗問題
- ✅ 實施符合規範要求的企業安全模式
- ✅ 設計及部署具有應用洞察的生產監控
- ✅ 完成企業治理框架實施

## 🎯 課程完成證明

### 進度追蹤框架
透過具結構性的檢查點追蹤學習進度：

- [ ] **第 1 章**：基礎與快速入門 ✅
- [ ] **第 2 章**：AI 首開發 ✅  
- [ ] **第 3 章**：設定與認證 ✅
- [ ] **第 4 章**：基礎架構即程式碼與部署 ✅
- [ ] **第 5 章**：多代理 AI 解決方案 ✅
- [ ] **第 6 章**：部署前驗證與規劃 ✅
- [ ] **第 7 章**：故障排除與除錯 ✅
- [ ] **第 8 章**：生產與企業模式 ✅

### 驗證流程
完成每章後，透過以下方式驗證你的知識：

1. <strong>實作練習完成</strong>：為每章部署可運行方案
2. <strong>知識評估</strong>：檢視 FAQ 並完成自我評量
3. <strong>社群參與</strong>：於 Azure Discord 分享經驗並獲得回饋
4. <strong>作品集開發</strong>：紀錄部署與學習心得
5. <strong>同儕審核</strong>：與其他學員協作解決複雜情境

### 課程完成效益
完成所有章節且通過驗證後，畢業生將具備：

**技術專長：**
- <strong>生產經驗</strong>：部署真實 AI 應用至 Azure 環境
- <strong>專業技能</strong>：企業級部署與故障排除能力  
- <strong>架構知識</strong>：多代理 AI 解決方案與複雜基礎架構模式
- <strong>故障排除精通</strong>：獨立解決部署與配置問題

**專業發展：**
- <strong>產業認可</strong>：具可驗證的高需求 AZD 與 AI 部署技能
- <strong>職涯進階</strong>：具資格擔任雲端架構師與 AI 部署專家角色
- <strong>社群領導力</strong>：積極參與 Azure 開發者與 AI 社群
- <strong>持續學習</strong>：為進階 Microsoft Foundry 專業化奠基

**作品集資產：**
- <strong>已部署方案</strong>：AI 應用與基礎架構模式的運作範例
- <strong>文件資源</strong>：完整部署指南與故障排除程序  
- <strong>社群貢獻</strong>：分享討論、範例與改進於 Azure 社群
- <strong>專業人脈</strong>：與 Azure 專家及 AI 部署從業人員建立連結

### 課後學習路徑
畢業生已準備好進階專業化：
- **Microsoft Foundry 專家**：深度專注於 AI 模型部署與協調
- <strong>雲端架構領導</strong>：企業規模部署設計與治理
- <strong>開發者社群領導</strong>：貢獻 Azure 範例與社群資源
- <strong>企業培訓</strong>：企業內部教授 AZD 與 AI 部署技能

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->