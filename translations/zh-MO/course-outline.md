# AZD 初學者課程大綱與學習架構

## 課程概述

透過設計的章節結構逐步掌握 Azure Developer CLI (azd)。**特別聚焦於結合 Microsoft Foundry 的 AI 應用部署。**

### 為什麼此課程對現代開發者至關重要

開發者部署 AI 工作負載時常需要指導：
- 複雜的多服務 AI 架構
- 生產環境 AI 部署最佳實踐  
- Azure AI 服務整合與配置
- AI 工作負載成本優化
- 特定於 AI 部署的故障排除

### 核心學習目標

完成此結構化課程，你將能：
- **掌握 AZD 基礎**：核心概念、安裝與配置
- **部署 AI 應用**：使用 AZD 結合 Microsoft Foundry 服務
- <strong>實現基礎設施即程式碼</strong>：用 Bicep 範本管理 Azure 資源
- <strong>故障診斷部署</strong>：解決常見問題與除錯
- <strong>生產優化</strong>：安全性、擴展、監控與成本管理
- <strong>構建多代理解決方案</strong>：部署複雜 AI 架構

## 🎓 工作坊學習體驗

### 彈性學習交付選項
本課程設計支援 <strong>自我節奏個人學習</strong> 及 <strong>有導師帶領工作坊課程</strong>，使學習者能在互動練習中實務操作 AZD 並培養技能。

#### 🚀 自我節奏學習模式
<strong>最適合個人開發者及持續學習</strong>

**功能特色：**
- <strong>瀏覽器介面</strong>：完成的 MkDocs 支援工作坊，可透過任何瀏覽器存取
- **GitHub Codespaces 整合**：一鍵啟動具預設工具的開發環境
- **互動式 DevContainer 環境**：無需本地設定，即刻開始編碼
- <strong>進度追蹤</strong>：內建檢查點與驗證練習
- <strong>社群支持</strong>：可加入 Azure Discord 頻道提問與協作

**學習架構：**
- <strong>彈性時間</strong>：可自行安排天數或週數完成章節
- <strong>檢查點系統</strong>：學習驗證後再進階複雜主題
- <strong>資源庫</strong>：完整文件、範例及故障排除指南
- <strong>作品集開發</strong>：建立可部署作品集專案

**開始使用（自我節奏）：**
```bash
# Option 1: GitHub Codespaces (Recommended)
# Navigate to the repository and click "Code" → "Create codespace on main"

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow setup instructions in workshop/README.md
```

#### 🏛️ 導師帶領工作坊課程
**適合企業培訓、速成營及教育機構**

**工作坊形式選項：**

**📚 學術課程整合 (8-12 週)**
- <strong>大學課程</strong>：學期制，每週兩小時授課
- <strong>速成營</strong>：密集 3-5 天課程，每日 6-8 小時
- <strong>企業培訓</strong>：每月團隊課程結合實務專案實作
- <strong>評核架構</strong>：作業評分、同儕審核與期末專案

**🚀 密集工作坊 (1-3 天)**
- **第1天**：基礎與 AI 開發（章節 1-2）- 6 小時
- **第2天**：配置與基礎設施（章節 3-4）- 6 小時  
- **第3天**：進階模式與生產環境（章節 5-8）- 8 小時
- <strong>後續</strong>：可選 2 週導師輔導專案完成

**⚡ 執行長簡報 (4-6 小時)**
- <strong>策略概覽</strong>：AZD 價值主張及業務影響 (1 小時)
- <strong>實務展示</strong>：AI 應用端到端部署 (2 小時)
- <strong>架構審查</strong>：企業模式與治理 (1 小時)
- <strong>實踐規劃</strong>：組織採納策略 (1-2 小時)

#### 🛠️ 工作坊學習方法
**探索 → 部署 → 自訂，實作技能發展流程**

**階段1：探索 (45 分鐘)**
- <strong>範本探索</strong>：評估 Microsoft Foundry 範本與服務
- <strong>架構分析</strong>：理解多代理模式及部署策略
- <strong>需求評估</strong>：識別組織需求與限制條件
- <strong>環境設定</strong>：配置開發環境與 Azure 資源

**階段2：部署 (2 小時)**
- <strong>引導實作</strong>：步驟化使用 AZD 部署 AI 應用
- <strong>服務設定</strong>：配置 Azure AI 服務、端點與驗證
- <strong>安全實作</strong>：應用企業安全模式與存取控管
- <strong>驗證測試</strong>：確認部署並故障排除常見問題

**階段3：自訂 (45 分鐘)**
- <strong>應用修改</strong>：依特定用例及需求調整範本
- <strong>生產優化</strong>：實施監控、成本管理與擴展策略
- <strong>進階模式</strong>：探究多代理協調與複雜架構
- <strong>後續規劃</strong>：定義持續技能發展路徑

#### 🎯 工作坊學習成果
<strong>透過實作鍛鍊具體技能</strong>

**技術能力：**
- **生產環境 AI 應用部署**：成功部署並配置 AI 方案
- <strong>基礎設施即程式碼精通</strong>：建立並管理自訂 Bicep 範本
- <strong>多代理架構實作</strong>：協調多代理 AI 解決方案
- <strong>生產準備</strong>：應用安全、監控及治理模式
- <strong>故障排除專業</strong>：獨立處理部署及配置問題

**專業技能：**
- <strong>專案領導</strong>：帶領技術團隊推動雲端部署
- <strong>架構設計</strong>：設計可擴展且成本效益高的 Azure 方案
- <strong>知識轉移</strong>：培訓並指導團隊成員 AZD 最佳實務
- <strong>策略規劃</strong>：影響組織雲端採納策略

#### 📋 工作坊資源與教材
<strong>完整工具包供導師及學員使用</strong>

**提供給導師：**
- <strong>講師指南</strong>：[工作坊概覽](workshop/README.md) - 課程規劃與講授指引
- <strong>簡報教材</strong>：簡報檔、架構圖與示範腳本
- <strong>評核工具</strong>：實務練習、知識檢核與評量標準
- <strong>技術設定</strong>：環境配置、故障排除指南及備用方案

**提供給學員：**
- <strong>互動式工作坊環境</strong>：[工作坊資料](workshop/README.md) - 瀏覽器學習平台
- <strong>逐步指導</strong>：[引導練習](../../workshop/docs/instructions) - 詳細實作說明  
- <strong>參考文件</strong>：[AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - 專注 AI 主題深度探討
- <strong>社群資源</strong>：Azure Discord 頻道、GitHub 論壇與專家支援

#### 🏢 企業工作坊實施
<strong>組織部屬與培訓策略</strong>

**企業培訓方案：**
- <strong>開發者入職</strong>：新進員工 AZD 基礎導覽 (2-4 週)
- <strong>團隊技能提升</strong>：現有開發團隊每季工作坊 (1-2 天)
- <strong>架構審查</strong>：每月高階工程師與架構師課程 (4 小時)
- <strong>領導簡報</strong>：技術決策者高階工作坊 (半天)

**實施支援：**
- <strong>量身訂製工作坊設計</strong>：專為組織需求調整內容
- <strong>試點計畫管理</strong>：結構性推出並以成功指標與回饋循環評估  
- <strong>持續導師輔導</strong>：工作坊後專案支援
- <strong>社群建立</strong>：內部 Azure AI 開發者社群與知識共享

**成效衡量指標：**
- <strong>技能獲得</strong>：課前後評估技術能力提升
- <strong>部署成功率</strong>：成功部署生產應用的參與比例
- <strong>上手時間</strong>：縮短新 Azure AI 專案入職週期
- <strong>知識保留</strong>：工作坊後 3-6 個月追蹤評估

## 8 章節學習架構

### 第一章：基礎與快速入門 (30-45 分鐘) 🌱
<strong>預備條件</strong>：Azure 訂閱、基礎命令行知識  
<strong>難度</strong>：⭐

#### 你將學習
- 理解 Azure Developer CLI 基礎
- 安裝 AZD 至你的平台  
- 你的第一次成功部署
- 核心概念與術語

#### 學習資源
- [AZD 基礎](docs/chapter-01-foundation/azd-basics.md) - 核心概念
- [安裝與設置](docs/chapter-01-foundation/installation.md) - 平台特定指引
- [你的第一個專案](docs/chapter-01-foundation/first-project.md) - 實作教學
- [命令速查表](resources/cheat-sheet.md) - 快速參考

#### 實務成果
成功使用 AZD 部署簡單的 Azure 網頁應用

---

### 第二章：以 AI 為先的開發 (1-2 小時) 🤖
<strong>預備條件</strong>：完成第一章  
<strong>難度</strong>：⭐⭐

#### 你將學習
- Microsoft Foundry 與 AZD 整合
- 部署 AI 驅動應用
- 理解 AI 服務配置
- RAG（檢索增強生成）模式

#### 學習資源
- [Microsoft Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- [AI 模型部署](docs/chapter-02-ai-development/ai-model-deployment.md)
- [AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - <strong>全新</strong>：完整 2-3 小時實作實驗
- [互動式工作坊指引](workshop/README.md) - <strong>全新</strong>：帶 MkDocs 預覽的瀏覽器工作坊
- [Microsoft Foundry 範本](README.md#featured-microsoft-foundry-templates)
- [工作坊操作指示](../../workshop/docs/instructions) - <strong>全新</strong>：逐步引導練習

#### 實務成果
部署並配置具備 RAG 功能的 AI 聊天應用

#### 工作坊學習路徑（可選增強）
<strong>全新互動體驗</strong>：[完整工作坊指南](workshop/README.md)
1. <strong>探索</strong>（30 分鐘）：範本選取與評估
2. <strong>部署</strong>（45 分鐘）：部署並驗證 AI 範本功能  
3. <strong>拆解</strong>（30 分鐘）：了解範本架構與組成
4. <strong>配置</strong>（30 分鐘）：自訂設定與參數
5. <strong>客製化</strong>（45 分鐘）：修改並迭代使其符合需求
6. <strong>拆除</strong>（15 分鐘）：清理資源並理解生命週期
7. <strong>總結</strong>（15 分鐘）：後續步驟與進階學習路徑

---

### 第三章：配置與認證 (45-60 分鐘) ⚙️
<strong>預備條件</strong>：完成第一章  
<strong>難度</strong>：⭐⭐

#### 你將學習
- 環境配置與管理
- 認證與安全最佳實務
- 資源命名與組織
- 多環境部署

#### 學習資源
- [配置指南](docs/chapter-03-configuration/configuration.md) - 環境設定
- [認證與安全模式](docs/chapter-03-configuration/authsecurity.md) - 託管身份與 Key Vault 整合
- 多環境示例

#### 實務成果
有效管理多環境並確保認證安全

---

### 第四章：基礎設施即程式碼與部署 (1-1.5 小時) 🏗️
<strong>預備條件</strong>：完成第一至三章  
<strong>難度</strong>：⭐⭐⭐

#### 你將學習
- 進階部署模式
- 使用 Bicep 实現基礎設施即程式碼
- 資源配置策略
- 自訂範本建立

- 使用 Azure Container Apps 和 AZD 部署容器化應用

#### 學習資源
- [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) - 完整工作流程
- [資源配置](docs/chapter-04-infrastructure/provisioning.md) - 資源管理
- 容器與微服務示例
- [容器應用示例](examples/container-app/README.md) - 快速入門、生產及進階部署模式

#### 實務成果
利用自訂基礎設施範本部署複雜多服務應用

---

### 第五章：多代理 AI 解決方案 (2-3 小時) 🤖🤖
<strong>預備條件</strong>：完成第一及第二章  
<strong>難度</strong>：⭐⭐⭐⭐

#### 你將學習
- 多代理架構模式
- 代理協調與整合
- 生產準備 AI 部署
- 客戶與庫存代理實作

- 結合容器化微服務作為代理解決方案組件

#### 學習資源
- [零售多代理解決方案](examples/retail-scenario.md) - 架構藍圖，非完整應用
- [ARM 範本套件](../../examples/retail-multiagent-arm-template) - 基礎設施骨架與實作前置條件
- 多代理協調模式
- [微服務架構範例](../../examples/container-app/microservices) - 服務間通訊、非同步訊息和生產部署

#### 實務成果
設計多代理 AI 解決方案，識別超出基礎設施配置的應用實作、驗證與運營作業

---

### 第六章：部署前驗證與規劃 (1 小時) 🔍
<strong>預備條件</strong>：完成第四章  
<strong>難度</strong>：⭐⭐

#### 你將學習
- 容量規劃與資源驗證
- SKU 選擇策略
- 預備檢查與自動化
- 成本優化規劃

#### 學習資源
- [容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) - 資源驗證
- [SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) - 成本效益策略
- [預備檢查](docs/chapter-06-pre-deployment/preflight-checks.md) - 自動化腳本
- [Application Insights 整合](docs/chapter-06-pre-deployment/application-insights.md) - 監控與可觀測性
- [多代理協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) - 代理協調策略

#### 實務成果
在執行前驗證並優化部署計劃

---

### 第七章：故障排除與除錯 (1-1.5 小時) 🔧
<strong>先決條件</strong>：任何部署章節已完成  
<strong>難度</strong>：⭐⭐

#### 你將學到的內容
- 系統化的除錯方法
- 常見問題與解決方案
- AI 專屬故障排除
- 性能優化

#### 學習資源
- [常見問題](docs/chapter-07-troubleshooting/common-issues.md) - 常見問答與解決方案
- [除錯指南](docs/chapter-07-troubleshooting/debugging.md) - 逐步策略
- [AI 專屬故障排除](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI 服務問題

#### 實踐成果
能獨立診斷及解決常見部署問題

---

### 第八章：生產與企業模式 (2-3 小時) 🏢
<strong>先決條件</strong>：已完成第一至四章  
<strong>難度</strong>：⭐⭐⭐⭐

#### 你將學到的內容
- 生產環境部署策略
- 企業安全模式
- 監控與成本優化
- 可擴展性與治理

- 針對生產容器應用部署的最佳實踐（安全性、監控、成本、CI/CD）

#### 學習資源
- [生產 AI 最佳實踐](docs/chapter-08-production/production-ai-practices.md) - 企業模式
- 微服務與企業範例
- 監控與治理框架
- [微服務架構範例](../../examples/container-app/microservices) - 藍綠/金絲雀部署、分佈式追蹤與成本優化

#### 實踐成果
部署具備完整生產能力的企業級應用

---

## 學習進程與難度

### 漸進式技能養成

- **🌱 初學者**：從第一章（基礎）→ 第二章（AI 開發）
- **🔧 中階**：第三至四章（配置與基礎架構）→ 第六章（驗證）
- **🚀 高階**：第五章（多代理解決方案）→ 第七章（故障排除）
- **🏢 企業**：完成所有章節，著重第八章（生產模式）

- <strong>容器應用路徑</strong>：第四章（容器化部署）、第五章（微服務整合）、第八章（生產最佳實踐）

### 難度指標

- **⭐ 基礎**：單一概念，指導教學，30-60 分鐘
- **⭐⭐ 中階**：多重概念，實作練習，1-2 小時  
- **⭐⭐⭐ 高階**：複雜架構，自訂解決方案，1-3 小時
- **⭐⭐⭐⭐ 專家**：生產系統，企業模式，2-4 小時

### 彈性學習路徑

#### 🎯 AI 開發者快線（4-6 小時）
1. <strong>第一章</strong>：基礎與快速入門（45 分鐘）
2. <strong>第二章</strong>：AI 優先開發（2 小時）  
3. <strong>第五章</strong>：多代理 AI 解決方案（3 小時）
4. <strong>第八章</strong>：生產 AI 最佳實踐（1 小時）

#### 🛠️ 基礎架構專家路線（5-7 小時）
1. <strong>第一章</strong>：基礎與快速入門（45 分鐘）
2. <strong>第三章</strong>：配置與身份驗證（1 小時）
3. <strong>第四章</strong>：基礎架構即程式碼與部署（1.5 小時）
4. <strong>第六章</strong>：部署前驗證與規劃（1 小時）
5. <strong>第七章</strong>：故障排除與除錯（1.5 小時）
6. <strong>第八章</strong>：生產與企業模式（2 小時）

#### 🎓 完整學習旅程（8-12 小時）
按序完成所有 8 章並實作與驗證

## 課程完成框架

### 知識驗證
- <strong>章節檢查點</strong>：具備可衡量成果的實作練習
- <strong>實務驗證</strong>：部署每章節的可運行解決方案
- <strong>進度追蹤</strong>：視覺指標與完成徽章
- <strong>社群驗證</strong>：在 Azure Discord 頻道分享經驗

### 學習成果評估

#### 第一至二章完成（基礎 + AI）
- ✅ 使用 AZD 部署基本網頁應用
- ✅ 部署具 RAG 功能的 AI 聊天應用
- ✅ 理解 AZD 核心概念與 AI 整合

#### 第三至四章完成（配置 + 基礎架構）  
- ✅ 管理多環境部署
- ✅ 建立自訂 Bicep 基礎架構範本
- ✅ 實作安全身份驗證模式

#### 第五至六章完成（多代理 + 驗證）
- ✅ 部署複雜多代理 AI 解決方案
- ✅ 執行容量規劃與成本優化
- ✅ 實施自動化部署前驗證

#### 第七至八章完成（故障排除 + 生產）
- ✅ 獨立除錯與解決部署問題  
- ✅ 部署企業級監控與安全
- ✅ 部署具治理能力的生產環境應用

### 認證與肯定
- <strong>課程完成徽章</strong>：完成所有 8 章的實務驗證
- <strong>社群認可</strong>：積極參與 Microsoft Foundry Discord
- <strong>專業發展</strong>：相關產業 AZD 與 AI 部署技能
- <strong>職涯進階</strong>：具備企業級雲端部署能力

## 🎓 完整學習成果

### 基礎層級（第一至二章）
完成基礎章節後，學習者將展現：

**技術能力：**
- 使用 AZD 指令部署簡易網頁應用
- 配置並部署具 RAG 功能的 AI 聊天應用
- 理解 AZD 核心概念：範本、環境、佈建流程
- 整合 Microsoft Foundry 服務與 AZD 部署
- 導覽 Azure AI 服務配置與 API 端點

**專業技能：**
- 遵循結構化部署流程以達成一致結果
- 利用日誌與文件排查基礎部署問題
- 有效溝通雲端部署流程
- 應用安全 AI 服務整合最佳實踐

**學習驗證：**
- ✅ 成功部署 `todo-nodejs-mongo` 模板
- ✅ 部署與配置具 RAG 功能的 `azure-search-openai-demo`
- ✅ 完成互動式工作坊練習（探索階段）
- ✅ 參與 Azure Discord 社群討論

### 中階層級（第三至四章）
完成中階章節後，學習者將展現：

**技術能力：**
- 管理多環境部署（開發、測試、生產）
- 建立自訂 Bicep 範本以實現基礎架構即程式碼
- 實施具託管身份的安全身份驗證模式
- 部署複雜多服務應用並自訂配置
- 優化資源佈建策略以兼顧成本與效能

**專業技能：**
- 設計可擴展的基礎架構架構
- 實施雲端部署的安全最佳實踐
- 為團隊協作撰寫基礎架構文件
- 評估並選擇適合的 Azure 服務

**學習驗證：**
- ✅ 配置獨立環境及專屬設定
- ✅ 建立並部署多服務應用的自訂 Bicep 範本
- ✅ 實施安全存取的託管身份身份驗證
- ✅ 完成涵蓋實際場景的配置管理練習

### 高階層級（第五至六章）
完成高階章節後，學習者將展現：

**技術能力：**
- 部署及協調多代理 AI 解決方案並執行協同流程
- 實施零售場景的客戶與庫存代理架構
- 執行全面容量規劃與資源驗證
- 執行自動化部署前驗證與優化
- 根據工作負載需求設計符合成本效益的 SKU 選擇

**專業技能：**
- 為生產環境架構複雜 AI 解決方案
- 主導 AI 部署策略的技術討論
- 指導初級開發者掌握 AZD 及 AI 部署最佳實踐
- 評估並推薦符合商業需求的 AI 架構模式

**學習驗證：**
- ✅ 檢視零售多代理藍圖並識別已佈建基礎設施與缺漏的應用實作
- ✅ 展示代理協調與工作流程編排
- ✅ 完成資源約束條件下的容量規劃練習
- ✅ 透過自動化部署前檢查驗證部署準備度

### 專家層級（第七至八章）
完成專家章節後，學習者將展現：

**技術能力：**
- 獨立診斷並解決複雜部署問題
- 實施企業級安全模式及治理框架
- 設計完善的監控與告警策略
- 優化生產部署以達擴展性、成本與效能
- 建立包含適當測試與驗證的 CI/CD 管線

**專業技能：**
- 主導企業雲端轉型專案
- 設計並實施組織內部部署標準
- 培訓並指導團隊掌握高階 AZD 實務
- 影響企業 AI 部署的技術決策

**學習驗證：**
- ✅ 解決複雜多服務部署失敗
- ✅ 實施符合合規要求的企業安全模式
- ✅ 設計並部署包含 Application Insights 的生產監控
- ✅ 完成企業治理框架實施

## 🎯 課程完成認證

### 進度追蹤框架
透過結構化檢查點追蹤你的學習進度：

- [ ] <strong>第一章</strong>：基礎與快速入門 ✅
- [ ] <strong>第二章</strong>：AI 優先開發 ✅  
- [ ] <strong>第三章</strong>：配置與身份驗證 ✅
- [ ] <strong>第四章</strong>：基礎架構即程式碼與部署 ✅
- [ ] <strong>第五章</strong>：多代理 AI 解決方案 ✅
- [ ] <strong>第六章</strong>：部署前驗證與規劃 ✅
- [ ] <strong>第七章</strong>：故障排除與除錯 ✅
- [ ] <strong>第八章</strong>：生產與企業模式 ✅

### 驗證流程
完成每個章節後，透過以下方式驗證你的知識：

1. <strong>實務練習完成</strong>：部署每章節的可運行解決方案
2. <strong>知識評估</strong>：複習常見問答並完成自我測驗
3. <strong>社群參與</strong>：在 Azure Discord 分享經驗並獲取回饋
4. <strong>作品集建立</strong>：記錄你的部署與學習心得
5. <strong>同儕審查</strong>：與其他學習者合作處理複雜情境

### 課程完成效益
完成所有章節並驗證後，畢業生將具備：

**技術專長：**
- <strong>生產經驗</strong>：將真實 AI 應用部署到 Azure 環境
- <strong>專業技能</strong>：企業級部署與故障排除能力  
- <strong>架構知識</strong>：多代理 AI 解決方案與複雜基礎架構模式
- <strong>故障排除精通</strong>：能獨立解決部署與配置問題

**專業發展：**
- <strong>產業認可</strong>：在高需求的 AZD 與 AI 部署領域擁有可驗證技能
- <strong>職涯進階</strong>：具備雲端架構師與 AI 部署專家的資格
- <strong>社群領導力</strong>：積極參與 Azure 開發者與 AI 社群
- <strong>持續學習</strong>：為進階 Microsoft Foundry 專精打下基礎

**作品集資產：**
- <strong>已部署解決方案</strong>：完整運作的 AI 應用與基礎架構範例
- <strong>文件資料</strong>：完善的部署指南與故障排除程序  
- <strong>社群貢獻</strong>：與 Azure 社群分享的討論、範例及改進
- <strong>專業網絡</strong>：與 Azure 專家及 AI 部署實踐者建立連結

### 課後學習路徑
畢業生準備進階專精於：
- **Microsoft Foundry 專家**：深度專精 AI 模型部署與協調
- <strong>雲端架構領導</strong>：企業級部署設計與治理
- <strong>開發者社群領導</strong>：貢獻 Azure 範例與社群資源
- <strong>企業培訓</strong>：在組織內部教授 AZD 與 AI 部署技能

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->