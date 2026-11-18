# AZD 初學者：課程大綱與學習框架

## 課程概覽

透過結構化章節掌握 Azure Developer CLI (azd)，設計為逐步學習。**特別專注於結合 Microsoft Foundry 的 AI 應用部署。**

### 為何此課程對現代開發者至關重要

部署 AI 工作負載的開發者經常需要指導於：
- 複雜多服務 AI 架構
- 生產環境 AI 部署最佳實踐  
- Azure AI 服務整合與配置
- AI 工作負載的成本優化
- AI 特定部署問題的故障排除

### 核心學習目標

完成本結構化課程後，您將能：
- **掌握 AZD 基礎**：核心概念、安裝與配置
- **部署 AI 應用程式**：使用 AZD 與 Microsoft Foundry 服務
- <strong>實施基礎設施即代碼</strong>：用 Bicep 模板管理 Azure 資源
- <strong>故障排除部署</strong>：解決常見問題與除錯困難
- <strong>優化生產環境</strong>：安全性、擴展性、監控與成本管理
- <strong>構建多代理解決方案</strong>：部署複雜 AI 架構

## 🎓 工作坊學習體驗

### 靈活的學習交付選項
本課程支援 <strong>自學模式</strong> 和 <strong>引導式工作坊</strong>，讓學員透過互動練習掌握 AZD 的實作經驗。

#### 🚀 自學模式
<strong>適合個人開發者與持續學習</strong>

**功能特色：**
- <strong>瀏覽器介面</strong>：透過 MkDocs 提供的完整工作坊，在任何網頁瀏覽器中均可使用
- **GitHub Codespaces 整合**：一鍵啟動開發環境，預配置工具
- **互動式 DevContainer 環境**：無需本地安裝，立刻開始編碼
- <strong>進度追蹤</strong>：內建檢查點與驗證練習
- <strong>社群支持</strong>：可進入 Azure Discord 頻道提問與協作

**學習結構：**
- <strong>時間彈性</strong>：可依個人節奏於數天或數週完成章節
- <strong>檢查點系統</strong>：學習前進前需通過驗證
- <strong>資源庫</strong>：完整文件、範例與故障排除指南
- <strong>作品集開發</strong>：構建可部署專案，豐富專業作品集

**啟動方式（自學）：**
```bash
# Option 1: GitHub Codespaces (Recommended)
# Navigate to the repository and click "Code" → "Create codespace on main"

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow setup instructions in workshop/README.md
```

#### 🏛️ 引導式工作坊課程
**適合企業培訓、訓練營和教育機構**

**工作坊形式選項：**

**📚 學術課程整合（8-12 週）**
- <strong>大學課程</strong>：學期課程，含每週 2 小時課堂
- <strong>訓練營格式</strong>：密集 3-5 天，每日 6-8 小時課程
- <strong>企業培訓</strong>：每月團隊課程，涵蓋實務專案實作
- <strong>評估框架</strong>：分數作業、同儕評審及期末專案

**🚀 密集工作坊（1-3 天）**
- <strong>第一天</strong>：基礎 + AI 開發（第一至二章）- 6 小時
- <strong>第二天</strong>：配置 + 基礎設施（第三、四章）- 6 小時  
- <strong>第三天</strong>：進階模式 + 生產環境（第五至八章）- 8 小時
- <strong>後續支援</strong>：選擇性 2 週導師指導完成專案

**⚡ 高管簡報（4-6 小時）**
- <strong>策略概覽</strong>：AZD 價值主張與業務影響（1 小時）
- <strong>實作示範</strong>：端對端部署 AI 應用（2 小時）
- <strong>架構檢視</strong>：企業架構模式與治理（1 小時）
- <strong>實施規劃</strong>：組織採用策略（1-2 小時）

#### 🛠️ 工作坊學習方法論
**探索 → 部署 → 自訂的實作式技能培養方法**

**第一階段：探索（45 分鐘）**
- <strong>模板探索</strong>：評估 Microsoft Foundry 模板與服務
- <strong>架構分析</strong>：理解多代理模式與部署策略
- <strong>需求評估</strong>：識別組織需求與限制
- <strong>環境設定</strong>：配置開發環境與 Azure 資源

**第二階段：部署（2 小時）**
- <strong>引導實作</strong>：逐步使用 AZD 部署 AI 應用
- <strong>服務配置</strong>：設定 Azure AI 服務、端點與驗證
- <strong>安全實施</strong>：套用企業安全模式與存取控管
- <strong>驗證測試</strong>：確認部署並排解常見問題

**第三階段：自訂（45 分鐘）**
- <strong>應用修改</strong>：為特定用例與需求調整模板
- <strong>生產優化</strong>：實施監控、成本管理及擴展策略
- <strong>進階模式</strong>：探索多代理協調與複雜架構
- <strong>後續規劃</strong>：訂定持續技能發展路徑

#### 🎯 工作坊學習成果
<strong>透過實作習得有形技能</strong>

**技術能力：**
- **部署生產環境 AI 應用**：成功部署並配置 AI 解決方案
- <strong>基礎設施即代碼精通</strong>：創建與管理自訂 Bicep 模板
- <strong>多代理架構</strong>：實作協調 AI 代理解決方案
- <strong>生產準備</strong>：應用安全、監控與治理模式
- <strong>故障排除專業能力</strong>：獨立解決部署配置問題

**專業技能：**
- <strong>專案領導</strong>：帶領技術團隊進行雲端部署
- <strong>架構設計</strong>：設計具可擴展性且成本有效的 Azure 解決方案
- <strong>知識傳承</strong>：培訓並指導同事 AZD 最佳實踐
- <strong>策略規劃</strong>：影響組織雲端採用策略

#### 📋 工作坊資源與材料
<strong>提供完整工具包給引導者與學員</strong>

**給引導者：**
- <strong>講師指南</strong>： [工作坊總覽](workshop/README.md) - 課程規劃與執行指引
- <strong>簡報材料</strong>：投影片、架構圖與示範腳本
- <strong>評估工具</strong>：實作練習、知識測驗與評分標準
- <strong>技術設置</strong>：環境配置、故障排除指南與備援方案

**給學員：**
- <strong>互動式工作坊環境</strong>： [工作坊材料](workshop/README.md) - 瀏覽器學習平台
- <strong>逐步指引</strong>： [引導練習](../../workshop/docs/instructions) - 詳細實作說明  
- <strong>參考文件</strong>： [AI 工作坊實驗](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI 專題深度探討
- <strong>社群資源</strong>：Azure Discord 頻道、GitHub 討論與專家支援

#### 🏢 企業工作坊實施
<strong>組織部署與培訓策略</strong>

**企業培訓計劃：**
- <strong>開發者入職</strong>：新人導向課程，涵蓋 AZD 基礎（2-4 週）
- <strong>團隊技能提升</strong>：針對現有開發團隊的季度工作坊（1-2 天）
- <strong>架構審查</strong>：針對資深工程師與架構師的月度課程（4 小時）
- <strong>領導簡報</strong>：技術決策者的高管工作坊（半天）

**實施支援：**
- <strong>定制化工作坊設計</strong>：針對組織需求調整內容
- <strong>試點計劃管理</strong>：結構化推廣，含成效指標與反饋循環  
- <strong>持續導師輔導</strong>：工作坊後期支持專案執行
- <strong>社群建置</strong>：組織內 Azure AI 開發者社群與知識分享

**成功指標：**
- <strong>技能獲取</strong>：前後評估衡量技術能力成長
- <strong>部署成功率</strong>：參與者成功部署生產應用的比例
- <strong>生產力時間</strong>：新 Azure AI 專案縮短上手時間
- <strong>知識保留</strong>：工作坊後 3-6 個月的追蹤評估

## 8 章學習結構

### 第 1 章：基礎與快速啟動（30-45 分鐘）🌱
<strong>前置條件</strong>：Azure 訂閱、基本指令列知識  
<strong>難度</strong>：⭐

#### 學習內容
- 了解 Azure Developer CLI 基本概念
- 在您的平台上安裝 AZD  
- 成功完成您的第一次部署
- 核心概念與術語介紹

#### 學習資源
- [AZD 基礎](docs/chapter-01-foundation/azd-basics.md) - 核心概念
- [安裝與設置](docs/chapter-01-foundation/installation.md) - 平台專屬指南
- [您的第一個專案](docs/chapter-01-foundation/first-project.md) - 實作教學
- [指令快速查閱表](resources/cheat-sheet.md) - 速查參考

#### 實務成果
成功運用 AZD 部署簡單的網頁應用到 Azure 上

---

### 第 2 章：以 AI 為先的開發（含工作坊共 4-5 小時）🤖
<strong>前置條件</strong>：完成第一章  
<strong>難度</strong>：⭐⭐

#### 學習內容
- 結合 Microsoft Foundry 與 AZD
- GA `microsoft.foundry` 套件安裝與託管代理代碼部署
- 本地代理檢查測試與獨立評估數據集/評分標準
- 部署 AI 驅動的應用
- 理解 AI 服務配置
- RAG (檢索增強生成) 模式

#### 學習資源
- [Microsoft Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- [託管代理演練 (GA)](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) - 初始化、檢視 `azure.yaml`、資源配置、本地測試、部署、評估與清理
- [AI 代理指南](docs/chapter-02-ai-development/agents.md)
- [AI 模型部署](docs/chapter-02-ai-development/ai-model-deployment.md)
- [AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - <strong>新</strong>：詳盡 2-3 小時實作練習
- [互動式工作坊指南](workshop/README.md) - <strong>新</strong>：基於 MkDocs 預覽的瀏覽器工作坊
- [Microsoft Foundry 模板](README.md#featured-microsoft-foundry-templates)
- [工作坊操作指引](../../workshop/docs/instructions) - <strong>新</strong>：循序引導練習

#### 實務成果
本地及 Foundry 環境測試託管代理並使用 GA 套件，評閱評估結果，並清理新項目與重複使用項目。獨立的 RAG/工作坊路線涵蓋 AI 聊天應用的配置。

#### 工作坊學習路徑（選修強化）
<strong>新互動體驗</strong>：[完整工作坊指南](workshop/README.md)
1. <strong>探索</strong>（30 分鐘）：模板選擇與評估
2. <strong>部署</strong>（45 分鐘）：部署並驗證 AI 模板功能  
3. <strong>拆解</strong>（30 分鐘）：瞭解模板架構與組件
4. <strong>配置</strong>（30 分鐘）：自訂設置與參數
5. <strong>自訂</strong>（45 分鐘）：修改並優化您的專案
6. <strong>拆除</strong>（15 分鐘）：清理資源與理解生命周期
7. <strong>總結</strong>（15 分鐘）：後續步驟與進階路徑

---

### 第 3 章：配置與認證（45-60 分鐘）⚙️
<strong>前置條件</strong>：完成第一章  
<strong>難度</strong>：⭐⭐

#### 學習內容
- 環境配置與管理
- 認證與安全最佳實踐
- 資源命名與組織
- 多環境部署

#### 學習資源
- [配置指南](docs/chapter-03-configuration/configuration.md) - 環境設定
- [認證與安全模式](docs/chapter-03-configuration/authsecurity.md) - 管理身份與金鑰保管庫整合
- 多環境範例

#### 實務成果
運用適當的認證與安全措施管理多環境

---

### 第 4 章：基礎設施即代碼與部署（1-1.5 小時） 🏗️
<strong>前置條件</strong>：完成第一至三章  
<strong>難度</strong>：⭐⭐⭐

#### 學習內容
- 進階部署模式
- 使用 Bicep 的基礎設施即代碼
- 資源佈建策略
- 自訂模板創建

- 透過 Azure Container Apps 與 AZD 部署容器化應用

#### 學習資源
- [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) - 完整工作流程
- [資源佈建](docs/chapter-04-infrastructure/provisioning.md) - 資源管理
- 容器與微服務範例
- [容器應用範例](examples/container-app/README.md) - 快速啟動、生產與進階部署模式

#### 實務成果
使用自訂基礎設施模板部署複雜多服務應用

---

### 第 5 章：多代理 AI 解決方案（2-3 小時）🤖🤖
<strong>前置條件</strong>：完成第一二章  
<strong>難度</strong>：⭐⭐⭐⭐

#### 學習內容
- 多代理架構模式
- 代理編排與協調
- 生產環境 AI 部署實務
- 客戶與庫存代理實作

- 將容器化微服務整合為代理解決方案的一部分

#### 學習資源
- [零售多代理解決方案](examples/retail-scenario.md) - 架構藍圖，非完整應用
- [ARM 模板套件](../../examples/retail-multiagent-arm-template) - 基礎設施腳手架與實施前置條件
- 多代理協調模式
- [微服務架構範例](../../examples/container-app/microservices) - 服務間通訊、非同步消息與生產部署

#### 實務成果
設計多代理 AI 解決方案，識別除基礎設施佈建外需進行的應用實施、驗證與營運工作

---

### 第 6 章：部署前驗證與規劃（1 小時）🔍
<strong>前置條件</strong>：完成第四章  
<strong>難度</strong>：⭐⭐

#### 學習內容
- 容量規劃與資源驗證
- SKU 選擇策略
- 預檢核與自動化
- 成本優化規劃

#### 學習資源
- [容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) - 資源驗證
- [SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) - 成本效益高的選擇
- [飛行前檢查](docs/chapter-06-pre-deployment/preflight-checks.md) - 自動化腳本
- [應用洞察整合](docs/chapter-06-pre-deployment/application-insights.md) - 監控與可觀測性
- [多代理協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) - 代理協調策略

#### 實務成果
在執行前驗證並優化部署

---

### 第 7 章：故障排除與除錯（1-1.5 小時）🔧
<strong>先決條件</strong>：完成任何部署章節  
<strong>複雜度</strong>：⭐⭐

#### 你將學到的內容
- 系統化故障排除方法
- 常見問題與解決方案
- AI 專屬故障排除
- 效能優化

#### 學習資源
- [常見問題](docs/chapter-07-troubleshooting/common-issues.md) - 常見問答與解決方案
- [除錯指南](docs/chapter-07-troubleshooting/debugging.md) - 逐步策略
- [AI 專屬故障排除](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI 服務問題

#### 實務成果
能獨立診斷並解決常見部署問題

---

### 第 8 章：生產與企業模式（2-3 小時）🏢
<strong>先決條件</strong>：完成第 1-4 章  
<strong>複雜度</strong>：⭐⭐⭐⭐

#### 你將學到的內容
- 生產部署策略
- 企業安全模式
- 監控與成本優化
- 可擴展性與治理

- 生產容器應用部署最佳實務（安全性、監控、成本、CI/CD）

#### 學習資源
- [生產 AI 最佳實務](docs/chapter-08-production/production-ai-practices.md) - 企業模式
- 微服務與企業範例
- 監控與治理框架
- [微服務架構範例](../../examples/container-app/microservices) - 藍綠部署/金絲雀部署、分散式追蹤與成本優化

#### 實務成果
部署具備完整生產能力的企業級應用

---

## 學習進程與複雜度

### 逐步技能建構

- **🌱 初學者**：從第 1 章（基礎）→ 第 2 章（AI 開發）開始
- **🔧 中階者**：第 3-4 章（配置與基礎設施）→ 第 6 章（驗證）
- **🚀 進階者**：第 5 章（多代理解決方案）→ 第 7 章（故障排除）
- **🏢 企業級**：完成所有章節，著重第 8 章（生產模式）

- <strong>容器應用路線</strong>：第 4 章（容器化部署）、第 5 章（微服務整合）、第 8 章（生產最佳實務）

### 複雜度指標

- **⭐ 基本**：單一概念、有指導的教學，30-60 分鐘
- **⭐⭐ 中階**：多概念、實作練習，1-2 小時  
- **⭐⭐⭐ 進階**：複雜架構、自訂解決方案，1-3 小時
- **⭐⭐⭐⭐ 專家**：生產系統、企業模式，2-4 小時

### 靈活的學習路線

#### 🎯 AI 開發者快線（4-6 小時）
1. **第 1 章**：基礎與快速開始（45 分鐘）
2. **第 2 章**：AI 為先的開發（2 小時）  
3. **第 5 章**：多代理 AI 解決方案（3 小時）
4. **第 8 章**：生產 AI 最佳實務（1 小時）

#### 🛠️ 基礎設施專家路線（5-7 小時）
1. **第 1 章**：基礎與快速開始（45 分鐘）
2. **第 3 章**：配置與身份驗證（1 小時）
3. **第 4 章**：基礎設施即代碼與部署（1.5 小時）
4. **第 6 章**：部署前驗證與規劃（1 小時）
5. **第 7 章**：故障排除與除錯（1.5 小時）
6. **第 8 章**：生產與企業模式（2 小時）

#### 🎓 完整學習旅程（8-12 小時）
順序完成所有 8 個章節並進行實作與驗證

## 課程完成框架

### 知識驗證
- <strong>章節檢查點</strong>：具體可量測的實作練習
- <strong>實作驗證</strong>：每個章節部署可運作的解決方案
- <strong>進度追蹤</strong>：視覺化指標與完成徽章
- <strong>社群驗證</strong>：在 Azure Discord 頻道分享經驗

### 學習成果評估

#### 第 1-2 章完成（基礎 + AI）
- ✅ 使用 AZD 部署基本 Web 應用
- ✅ 部署具備 RAG 的 AI 聊天應用
- ✅ 了解 AZD 核心概念與 AI 整合

#### 第 3-4 章完成（配置 + 基礎設施）  
- ✅ 管理多環境部署
- ✅ 建立自訂 Bicep 基礎設施模板
- ✅ 實施安全身份驗證模式

#### 第 5-6 章完成（多代理 + 驗證）
- ✅ 部署複雜多代理 AI 解決方案
- ✅ 進行容量規劃與成本優化
- ✅ 實施自動化部署前驗證

#### 第 7-8 章完成（故障排除 + 生產）
- ✅ 獨立除錯與解決部署問題  
- ✅ 實施企業級監控與安全
- ✅ 部署生產準備好且具治理能力的應用

### 證書與認可
- <strong>課程完成徽章</strong>：完成所有 8 章並實務驗證
- <strong>社群認可</strong>：積極參與 Microsoft Foundry Discord
- <strong>專業發展</strong>：具備業界相關 AZD 和 AI 部署技能
- <strong>職涯提升</strong>：企業級雲端部署能力

## 🎓 全面學習成果

### 基礎層級（第 1-2 章）
完成基礎章節後，學習者將展現：

**技術能力：**
- 使用 AZD 指令部署簡單 Web 應用至 Azure
- 配置並部署具備 RAG 功能的 AI 聊天應用
- 了解 AZD 核心概念：模板、環境、佈建工作流程
- 將 Microsoft Foundry 服務與 AZD 部署整合
- 掌握 Azure AI 服務配置與 API 端點

**專業技能：**
- 遵循結構化部署工作流程以確保結果一致
- 利用日誌與文件除錯基本部署問題
- 有效溝通雲端部署流程
- 運用最佳實務確保 AI 服務安全整合

**學習驗證：**
- ✅ 成功部署 `todo-nodejs-mongo` 模板
- ✅ 部署與配置具 RAG 功能的 `azure-search-openai-demo`
- ✅ 完成互動式工作坊練習（探索階段）
- ✅ 參與 Azure Discord 社群討論

### 中階層級（第 3-4 章）
完成中階章節後，學習者將展現：

**技術能力：**
- 管理多環境部署（開發、預備、生產）
- 建立自訂 Bicep 模板以實現基礎設施即代碼
- 實施具管理身分的安全身份驗證模式
- 部署具自訂配置的複雜多服務應用
- 優化資源佈建策略以達成成本與效能平衡

**專業技能：**
- 設計可擴展的基礎設施架構
- 實施雲端部署的安全最佳實務
- 撰寫基礎設施模式文件以促進團隊協作
- 評估並選擇適合需求的 Azure 服務

**學習驗證：**
- ✅ 配置獨立環境並設置環境專屬設定
- ✅ 建立並部署多服務應用的自訂 Bicep 模板
- ✅ 實施管理身分身份驗證以確保安全存取
- ✅ 完成真實案例的配置管理練習

### 進階層級（第 5-6 章）
完成進階章節後，學習者將展現：

**技術能力：**
- 部署並協調具有協同工作流程的多代理 AI 解決方案
- 實施零售場景中的客戶與庫存代理架構
- 進行完整的容量規劃與資源驗證
- 執行自動化部署前驗證與優化
- 根據工作負載需求設計成本效益高的 SKU 選擇

**專業技能：**
- 設計生產環境複雜 AI 解決方案的架構
- 主導 AI 部署策略的技術討論
- 指導初級開發者採用 AZD 與 AI 部署最佳實務
- 評估並建議適合業務需求的 AI 架構模式

**學習驗證：**
- ✅ 審視零售多代理藍圖，分辨已佈建的基礎設施與缺少的應用實作
- ✅ 展示代理協調與工作流程編排
- ✅ 完成真實資源限制下的容量規劃練習
- ✅ 透過自動化飛行前檢查驗證部署準備度

### 專家層級（第 7-8 章）
完成專家章節後，學習者將展現：

**技術能力：**
- 獨立診斷與解決複雜部署問題
- 實施企業級安全模式與治理框架
- 設計完整監控與警示策略
- 優化生產部署的規模、成本與效能
- 建立具測試與驗證的 CI/CD 管線

**專業技能：**
- 領導企業雲端轉型計劃
- 設計並實施組織部署標準
- 培訓並指導團隊採用進階 AZD 實務
- 影響企業 AI 部署的技術決策

**學習驗證：**
- ✅ 解決複雜的多服務部署失敗
- ✅ 實施符合合規要求的企業安全模式
- ✅ 設計並部署配合 Application Insights 的生產監控
- ✅ 完成企業治理框架的實施

## 🎯 課程完成認證

### 進度追蹤框架
透過結構化檢查點追蹤你的學習進度：

- [ ] **第 1 章**：基礎與快速開始 ✅
- [ ] **第 2 章**：AI 為先的開發 ✅  
- [ ] **第 3 章**：配置與身份驗證 ✅
- [ ] **第 4 章**：基礎設施即代碼與部署 ✅
- [ ] **第 5 章**：多代理 AI 解決方案 ✅
- [ ] **第 6 章**：部署前驗證與規劃 ✅
- [ ] **第 7 章**：故障排除與除錯 ✅
- [ ] **第 8 章**：生產與企業模式 ✅

### 驗證流程
完成每個章節後，通過以下方式驗證你的知識：

1. <strong>完成實作練習</strong>：部署可運作的解決方案
2. <strong>知識評估</strong>：檢視常見問題區與自我評量
3. <strong>社群參與</strong>：在 Azure Discord 分享經驗並獲得回饋
4. <strong>作品集建立</strong>：記錄你的部署與學習心得
5. <strong>同儕審查</strong>：與其他學員共同探討複雜情境

### 課程完成效益
完成所有章節並通過驗證後，畢業生將具備：

**技術專長：**
- <strong>生產經驗</strong>：將實際 AI 應用部署至 Azure 環境
- <strong>專業技能</strong>：企業級部署與故障排除能力  
- <strong>架構知識</strong>：多代理 AI 解決方案與複雜基礎設施模式
- <strong>故障排除精通</strong>：獨立解決部署與配置問題

**專業發展：**
- <strong>業界認可</strong>：具備高需求的 AZD 與 AI 部署技能認證
- <strong>職涯晉升</strong>：取得雲端架構師與 AI 部署專家的資格
- <strong>社群領導</strong>：積極參與 Azure 開發者與 AI 社群
- <strong>持續學習</strong>：為進階 Microsoft Foundry 專精打下基礎

**作品集資產：**
- <strong>已部署解決方案</strong>：運作中的 AI 應用與基礎設施模式範例
- <strong>文件資料</strong>：完整的部署指南與故障排除程序  
- <strong>社群貢獻</strong>：與 Azure 社群分享的討論、範例與改進
- <strong>專業網絡</strong>：與 Azure 專家和 AI 部署實務者的連結

### 課後學習路徑
畢業生可準備進階專精於：
- **Microsoft Foundry 專家**：AI 模型部署與編排深度專精
- <strong>雲端架構領導</strong>：企業級部署設計與治理
- <strong>開發者社群領袖</strong>：貢獻 Azure 範例與社群資源
- <strong>企業培訓</strong>：組織內教授 AZD 與 AI 部署技能

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->