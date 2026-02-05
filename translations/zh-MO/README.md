# AZD 初學者指南：有系統的學習旅程

![AZD-for-beginners](../../translated_images/zh-MO/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## 開始本課程

請按照以下步驟展開您的 AZD 學習旅程：

1. **Fork 該儲存庫**：點擊 [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone 該儲存庫**：`git clone https://github.com/microsoft/azd-for-beginners.git`
3. **加入社區**：[Azure Discord 社群](https://discord.com/invite/ByRwuEEgH4) 以獲取專家支持
4. **選擇您的學習路徑**：從以下章節中選擇符合您經驗水準的內容

### 多語言支援

#### 自動翻譯（持續更新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](./README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **偏好本地 Clone？**

> 本儲存庫包含 50 多種語言翻譯，會大幅增加下載大小。若只想 clone 不包含翻譯，請使用 sparse checkout：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 如此可更快下載且獲得完成課程所需的所有內容。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 課程總覽

透過精心設計的章節，掌握 Azure Developer CLI（azd）。**特別聚焦於與 Microsoft Foundry 集成的 AI 應用部署。**

### 為何本課程是現代開發者的必修

根據 Microsoft Foundry Discord 社群的洞察，**45% 的開發者希望使用 AZD 進行 AI 工作負載**，但遇到的挑戰包括：
- 複雜的多服務 AI 架構
- 生產環境 AI 部署最佳實踐  
- Azure AI 服務整合和配置
- AI 工作負載成本優化
- AI 特殊部署問題的排錯

### 學習目標

完成本系統化課程後，您將能：
- **掌握 AZD 基礎**：核心概念、安裝與配置
- **部署 AI 應用**：搭配 Microsoft Foundry 服務使用 AZD
- **實現基礎設施代碼管理**：利用 Bicep 模板管理 Azure 資源
- **解決部署問題**：排查常見問題與除錯
- **生產優化**：安全性、擴展性、監控及成本控管
- **構建多代理解決方案**：部署複雜的 AI 架構

## 📚 學習章節

*根據經驗與目標選擇您的學習路徑*

### 🚀 第1章：基礎及快速開始
**先決條件**：Azure 訂閱、基本命令行知識  
**時長**：30-45 分鐘  
**難度**：⭐

#### 您將學習
- 理解 Azure Developer CLI 的基礎  
- 在您的平台上安裝 AZD  
- 成功進行第一次部署

#### 學習資源
- **🎯 從這裡開始**：[什麼是 Azure Developer CLI？](../..)
- **📖 理論**：[AZD 基礎](docs/getting-started/azd-basics.md) — 核心概念與術語
- **⚙️ 設置**：[安裝與設定](docs/getting-started/installation.md) — 不同平台的安裝指引
- **🛠️ 實作**：[您的第一個專案](docs/getting-started/first-project.md) — 逐步教學
- **📋 快速參考**：[命令速查表](resources/cheat-sheet.md)

#### 實作練習
```bash
# 快速安裝檢查
azd version

# 部署您的第一個應用程式
azd init --template todo-nodejs-mongo
azd up
```

**💡 本章目標**：成功使用 AZD 部署一個簡單的網頁應用程式至 Azure

**✅ 成功驗證：**
```bash
# 完成第一章後，你應該能夠：
azd version              # 顯示已安裝的版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署到 Azure
azd show                # 顯示執行中應用程式的 URL
# 應用程式會在瀏覽器中開啟並正常運作
azd down --force --purge  # 清理資源
```

**📊 時間投入：** 30-45 分鐘  
**📈 完成後技能水準：** 可獨立部署基本應用

**✅ 成功驗證：**
```bash
# 完成第一章後，你應該能夠：
azd version              # 顯示已安裝版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署到 Azure
azd show                # 顯示正在運行的應用程式網址
# 應用程式會在瀏覽器中開啟並運作
azd down --force --purge  # 清理資源
```

**📊 時間投入：** 30-45 分鐘  
**📈 完成後技能水準：** 可獨立部署基本應用

---

### 🤖 第2章：AI-First 開發（推薦給 AI 開發者）
**先決條件**：完成第1章  
**時長**：1-2 小時  
**難度**：⭐⭐

#### 您將學習
- Microsoft Foundry 與 AZD 的集成
- 部署 AI 驅動應用
- 理解 AI 服務配置

#### 學習資源
- **🎯 從這裡開始**：[Microsoft Foundry 集成](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 範例模式**：[AI 模型部署](docs/microsoft-foundry/ai-model-deployment.md) — 部署及管理 AI 模型
- **🛠️ 工作坊**：[AI 工作坊實驗室](docs/microsoft-foundry/ai-workshop-lab.md) — 讓您的 AI 解決方案 AZD 就緒
- **🎥 互動指南**：[工作坊教材](workshop/README.md) — 使用 MkDocs 和 DevContainer 瀏覽器學習環境
- **📋 模板**：[Microsoft Foundry 模板](../..)
- **📝 範例**：[AZD 部署範例](examples/README.md)

#### 實作練習
```bash
# 部署您的第一個人工智能應用程式
azd init --template azure-search-openai-demo
azd up

# 嘗試其他人工智能範本
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 本章目標**：部署並配置具備 RAG 功能的 AI 聊天應用程式

**✅ 成功驗證：**
```bash
# 完成第二章後，你應該能夠：
azd init --template azure-search-openai-demo
azd up
# 測試 AI 聊天介面
# 提問並獲得帶有來源的 AI 回應
# 驗證搜尋整合是否正常運作
azd monitor  # 檢查應用程式洞察是否顯示遙測數據
azd down --force --purge
```

**📊 時間投入：** 1-2 小時  
**📈 完成後技能水準：** 可部署與配置生產級 AI 應用  
**💰 成本意識：** 了解開發成本約 $80-150/月，生產成本約 $300-3500/月

#### 💰 AI 部署成本考量

**開發環境（預估每月 $80-150）：**
- Azure OpenAI（按量付費）：$0-50/月（依 Token 使用量計算）
- AI 搜尋（基礎層）：$75/月
- Container Apps（消耗計量）：$0-20/月
- 存儲（標準）：$1-5/月

**生產環境（預估每月 $300-3,500+）：**
- Azure OpenAI（PTU 保持穩定效能）：$3,000+/月 或 高用量按量付費
- AI 搜尋（標準層）：$250/月
- Container Apps（專用）：$50-100/月
- Application Insights：$5-50/月
- 存儲（高階）：$10-50/月

**💡 成本優化建議：**
- 利用 Azure OpenAI **免費層** 學習（包含 50,000 token/月）
- 不開發時執行 `azd down` 釋放資源
- 以消耗計價開始，僅在生產使用時升級為 PTU
- 使用 `azd provision --preview` 預估部署費用
- 啟用自動擴縮，僅為實際使用付費

**成本監控：**
```bash
# 查看預計每月成本
azd provision --preview

# 在 Azure 入口網站監控實際成本
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第3章：配置與驗證
**先決條件**：完成第1章  
**時長**：45-60 分鐘  
**難度**：⭐⭐

#### 您將學習
- 環境配置與管理
- 驗證與安全最佳實踐
- 資源命名與組織

#### 學習資源
- **📖 配置**：[配置指南](docs/getting-started/configuration.md) — 環境設定
- **🔐 安全**：[驗證模式與管理身分](docs/getting-started/authsecurity.md) — 驗證模式
- **📝 範例**：[資料庫應用範例](examples/database-app/README.md) — AZD 資料庫應用範例

#### 實作練習
- 配置多個環境（開發、測試、生產）
- 設定管理身分驗證
- 實作環境專屬配置

**💡 本章目標**：有效管理多個環境並落實驗證與安全

---

### 🏗️ 第4章：基礎設施即代碼與部署
**先決條件**：完成第1至3章  
**時長**：1-1.5 小時  
**難度**：⭐⭐⭐

#### 您將學習
- 進階部署模式
- 使用 Bicep 管理基礎設施即代碼
- 資源佈建策略

#### 學習資源
- **📖 部署**：[部署指南](docs/deployment/deployment-guide.md) — 完整工作流程
- **🏗️ 佈建**：[資源佈建](docs/deployment/provisioning.md) — Azure 資源管理
- **📝 範例**：[Container App 範例](../../examples/container-app) — 容器化部署示例

#### 實作練習
- 創建自訂 Bicep 模板
- 部署多服務應用
- 實作藍綠部署策略

**💡 本章目標**：使用自訂的基礎設施模板部署複雜多服務應用

---

### 🎯 第5章：多代理 AI 解決方案（進階）
**先決條件**：完成第1至2章  
**時長**：2-3 小時  
**難度**：⭐⭐⭐⭐
#### 你將會學習到什麼
- 多代理架構模式
- 代理協調與編排
- 生產環境就緒的 AI 部署

#### 學習資源
- **🤖 精選專案**: [零售多代理方案](examples/retail-scenario.md) - 完整實作
- **🛠️ ARM 範本**: [ARM 範本套件](../../examples/retail-multiagent-arm-template) - 一鍵部署
- **📖 架構**: [多代理協調模式](/docs/pre-deployment/coordination-patterns.md) - 模式說明

#### 實作練習
```bash
# 部署完整的零售多代理方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索代理配置
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 本章成果**: 部署並管理一個生產環境就緒的多代理 AI 解決方案，包含客戶和庫存代理

---

### 🔍 第6章：部署前驗證與規劃
**前置條件**: 完成第4章  
**時長**: 1 小時  
**難度**: ⭐⭐

#### 你將會學習到什麼
- 容量規劃與資源驗證
- SKU 選擇策略
- 預檢查與自動化作業

#### 學習資源
- **📊 規劃**: [容量規劃](docs/pre-deployment/capacity-planning.md) - 資源驗證
- **💰 選擇**: [SKU 選擇](docs/pre-deployment/sku-selection.md) - 成本效益選擇
- **✅ 驗證**: [預檢查](docs/pre-deployment/preflight-checks.md) - 自動化腳本

#### 實作練習
- 執行容量驗證腳本
- 優化 SKU 選擇以降低成本
- 實作自動化部署前檢查

**💡 本章成果**: 在執行前驗證與優化部署規劃

---

### 🚨 第7章：故障排除與除錯
**前置條件**: 完成任一部署章節  
**時長**: 1-1.5 小時  
**難度**: ⭐⭐

#### 你將會學習到什麼
- 系統化除錯方法
- 常見問題與解決方案
- AI 特定故障排除

#### 學習資源
- **🔧 常見問題**: [常見問題](docs/troubleshooting/common-issues.md) - FAQ 與解決方案
- **🕵️ 除錯指南**: [除錯指南](docs/troubleshooting/debugging.md) - 逐步策略
- **🤖 AI 問題**: [AI 專用故障排除](docs/troubleshooting/ai-troubleshooting.md) - AI 服務問題

#### 實作練習
- 診斷部署失敗問題
- 解決認證問題
- 除錯 AI 服務連線

**💡 本章成果**: 獨立診斷和解決常見部署問題

---

### 🏢 第8章：生產與企業模式
**前置條件**: 完成第1至4章  
**時長**: 2-3 小時  
**難度**: ⭐⭐⭐⭐

#### 你將會學習到什麼
- 生產環境部署策略
- 企業安全模式
- 監控與成本優化

#### 學習資源
- **🏭 生產環境**: [生產 AI 最佳實務](docs/microsoft-foundry/production-ai-practices.md) - 企業模式
- **📝 範例**: [微服務範例](../../examples/microservices) - 複雜架構
- **📊 監控**: [Application Insights 整合](docs/pre-deployment/application-insights.md) - 監控說明

#### 實作練習
- 實施企業安全模式
- 設定完整的監控系統
- 以適當治理方式部署生產環境

**💡 本章成果**: 部署具備完整生產能力的企業級應用

---

## 🎓 工作坊概覽：實作學習體驗

> **⚠️ 工作坊狀態：開發中**  
> 工作坊教材目前正開發與優化中。核心模組可用，但部分進階內容尚未完成。我們持續努力完善所有內容。[追蹤進度 →](workshop/README.md)

### 互動式工作坊教材
**使用瀏覽器工具與引導練習，提供完整實作學習體驗**

我們的工作坊教材提供有結構的互動式學習體驗，與上述章節課程相輔相成。工作坊設計適合自學與講師主導教學。

#### 🛠️ 工作坊特色
- **瀏覽器介面**: 完整 MkDocs 驅動，具備搜尋、複製與主題功能
- **GitHub Codespaces 整合**: 一鍵建立開發環境
- **結構化學習路徑**: 7 步引導練習（總計 3.5 小時）
- **探索 → 部署 → 自訂**: 進階階段式方法論
- **互動式 DevContainer 環境**: 預先配置工具與依賴

#### 📚 工作坊架構
工作坊遵循 **探索 → 部署 → 自訂** 方法：

1. **探索階段** (45 分鐘)
   - 瀏覽 Microsoft Foundry 範本與服務
   - 了解多代理架構模式
   - 檢視部署需求與前置條件

2. **部署階段** (2 小時)
   - 實作 AI 應用部署，使用 AZD
   - 配置 Azure AI 服務與端點
   - 實施安全性與認證模式

3. **自訂階段** (45 分鐘)
   - 修改應用以符合特定使用案例
   - 優化生產環境部署
   - 實現監控與成本管理

#### 🚀 開始使用工作坊
```bash
# 選項 1：GitHub Codespaces（建議）
# 在倉庫中點擊「代碼」→「在 main 創建代碼空間」

# 選項 2：本地開發
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 遵循 workshop/README.md 中的設置說明
```

#### 🎯 工作坊學習成效
完成工作坊後，參與者將能：
- **部署生產AI應用**: 使用 AZD 與 Microsoft Foundry 服務
- **掌握多代理架構**: 實作協調的 AI 代理解決方案
- **實施安全最佳實踐**: 配置認證與存取控制
- **優化擴展性**: 設計具成本效益且高效能的部署
- **故障排除部署問題**: 獨立解決常見問題

#### 📖 工作坊資源
- **🎥 互動指南**: [工作坊教材](workshop/README.md) - 瀏覽器線上學習環境
- **📋 詳細說明**: [引導練習](../../workshop/docs/instructions) - 詳盡操作流程
- **🛠️ AI 工作坊實驗室**: [AI 工作坊實驗室](docs/microsoft-foundry/ai-workshop-lab.md) - AI 專題練習
- **💡 快速入門**: [工作坊設定指引](workshop/README.md#quick-start) - 環境配置說明

**非常適合**：企業培訓、大學課程、自學與開發者訓練營。

---

## 📖 什麼是 Azure Developer CLI？

Azure Developer CLI（azd）是一款專為開發者設計的命令列介面，加速 Azure 上應用程式的建置與部署。其特色包括：

- **範本式部署** - 利用預建範本處理常見應用模式
- **基礎架構即程式碼** - 以 Bicep 或 Terraform 管理 Azure 資源  
- **整合工作流程** - 無縫供應、部署及監控應用
- **開發者友善** - 優化開發效率與體驗

### **AZD + Microsoft Foundry：AI 部署的理想組合**

**為什麼選用 AZD 進行 AI 解決方案部署？** AZD 解決 AI 開發者面臨的主要挑戰：

- **AI 就緒範本** - 預配置 Azure OpenAI、Cognitive Services 和 ML 工作負載範本
- **安全 AI 部署** - 內建 AI 服務、API 金鑰與模型端點的安全模式  
- **生產等級 AI 模式** - 可擴展且具成本效益的 AI 應用最佳實務
- **端到端 AI 工作流程** - 從模型開發到生產部署並搭配完善監控
- **成本最佳化** - 聰明的資源分配和 AI 工作負載彈性擴展策略
- **Microsoft Foundry 整合** - 與 Microsoft Foundry 模型目錄與端點無縫連接

---

## 🎯 範本與範例庫

### 精選：Microsoft Foundry 範本
**如果您正在部署 AI 應用，請從這裡開始！**

> **注意：** 這些範本展示各種 AI 模式。有些來自 Azure Samples 外部專案，另一些為本地實現。

| 範本 | 章節 | 難度 | 服務 | 類型 |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | 外部 |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第2章 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| 外部 |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | 外部 |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | 外部 |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **本地** |

### 精選：完整學習場景
**針對學習章節映射的生產環境應用範本**

| 範本 | 學習章節 | 難度 | 主要學習內容 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | 基本 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | Azure AI Search 的 RAG 實作 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第4章 | ⭐⭐ | 文件智能整合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | 代理框架與函式調用 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐ | 企業 AI 協調 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | 多代理架構，包含客戶與庫存代理 |

### 按範例類型學習

> **📌 本地與外部範例說明：**  
> **本地範例**（本倉庫）= 可立即使用  
> **外部範例**（Azure Samples）= 克隆自連結的專案倉庫

#### 本地範例（可立即使用）
- [**零售多代理方案**](examples/retail-scenario.md) - 完整生產就緒實作與 ARM 範本
  - 多代理架構（客戶代理 + 庫存代理）
  - 完整監控與評估
  - 一鍵透過 ARM 範本部署

#### 本地範例 - 容器應用（第2-5章）
**本倉庫中容器部署完整示例：**
- [**容器應用範例**](examples/container-app/README.md) - 容器化部署完整指南
  - [簡易 Flask API](../../examples/container-app/simple-flask-api) - 基本 REST API，支援 scale-to-zero
  - [微服務架構](../../examples/container-app/microservices) - 生產就緒多服務部署
  - 快速入門、生產環境與進階部署模式
  - 監控、安全與成本優化指引

#### 外部範例 - 簡易應用（第1-2章）
**克隆這些 Azure Samples 倉庫開始學習：**
- [簡易 Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本部署模式
- [靜態網站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 靜態內容部署
- [容器應用 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署

#### 外部範例 - 資料庫整合（第3-4章）  
- [資料庫應用 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 資料庫連接模式
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 伺服器無狀態資料流程

#### 外部範例 - 進階模式（第4-8章）
- [Java 微服務](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服務架構
- [容器應用工作排程](https://github.com/Azure-Samples/container-apps-jobs) - 背景處理  
- [企業機器學習流程](https://github.com/Azure-Samples/mlops-v2) - 生產就緒 ML 模式

### 外部範本集合
- [**官方 AZD 範本庫**](https://azure.github.io/awesome-azd/) - 官方與社群範本精選集
- [**Azure Developer CLI 模板**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 模板文件說明
- [**範例目錄**](examples/README.md) - 本地學習範例及詳細說明

---

## 📚 學習資源及參考資料

### 快速參考
- [**指令速查表**](resources/cheat-sheet.md) - 重要 azd 指令按章節分類
- [**詞彙表**](resources/glossary.md) - Azure 與 azd 專有名詞  
- [**常見問題**](resources/faq.md) - 按學習章節整理的常見問題
- [**學習指南**](resources/study-guide.md) - 全面實作練習題

### 實作工作坊
- [**人工智能工作坊實驗室**](docs/microsoft-foundry/ai-workshop-lab.md) - 使你的 AI 解決方案可用 AZD 部署（2-3 小時）
- [**互動式工作坊指南**](workshop/README.md) - 使用 MkDocs 及 DevContainer 瀏覽器式工作坊
- [**結構化學習路徑**](../../workshop/docs/instructions) - 7 步驟引導練習（探索 → 部署 → 客製化）
- [**AZD 初學者工作坊**](workshop/README.md) - 完整實作工作坊素材，整合 GitHub Codespaces

### 外部學習資源
- [Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 價格計算器](https://azure.microsoft.com/pricing/calculator/)
- [Azure 狀態](https://status.azure.com/)

---

## 🔧 快速故障排除指南

**初學者常見問題與即時解決方案：**

### ❌ "azd: command not found"

```bash
# 先安裝 AZD
# Windows（PowerShell）：
winget install microsoft.azd

# macOS：
brew tap azure/azd && brew install azd

# Linux：
curl -fsSL https://aka.ms/install-azd.sh | bash

# 驗證安裝
azd version
```

### ❌ "No subscription found" or "Subscription not set"

```bash
# 列出可用訂閱
az account list --output table

# 設定預設訂閱
az account set --subscription "<subscription-id-or-name>"

# 設定 AZD 環境
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# 驗證
az account show
```

### ❌ "InsufficientQuota" or "Quota exceeded"

```bash
# 試試不同的 Azure 區域
azd env set AZURE_LOCATION "westus2"
azd up

# 或在開發時使用較小的 SKU
# 編輯 infra/main.parameters.json：
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" 運行至一半失敗

```bash
# 選項 1：清理然後重試
azd down --force --purge
azd up

# 選項 2：只修正基礎設施
azd provision

# 選項 3：檢查詳細日誌
azd show
azd logs
```

### ❌ "Authentication failed" or "Token expired"

```bash
# 重新驗證
az logout
az login

azd auth logout
azd auth login

# 驗證身份認證
az account show
```

### ❌ "Resource already exists" 或命名衝突

```bash
# AZD 會產生獨特的名稱，但如果發生衝突：
azd down --force --purge

# 則使用全新環境重試
azd env new dev-v2
azd up
```

### ❌ 模板部署耗時過長

**正常等待時間：**
- 簡單網頁應用：5-10 分鐘
- 搭配資料庫應用：10-15 分鐘
- AI 應用程式：15-25 分鐘（OpenAI 佈建較慢）

```bash
# 檢查進度
azd show

# 如果卡住超過30分鐘，檢查Azure門戶：
azd monitor
# 尋找失敗的部署
```

### ❌ "Permission denied" 或 "Forbidden"

```bash
# 檢查你的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 你至少需要「參與者」角色
# 請你的 Azure 管理員授予：
# - 參與者（針對資源）
# - 使用者存取管理員（針對角色分配）
```

### ❌ 找不到已部署應用程式 URL

```bash
# 顯示所有服務端點
azd show

# 或打開 Azure 入口網站
azd monitor

# 檢查特定服務
azd env get-values
# 尋找 *_URL 變量
```

### 📚 完整故障排除資源

- **常見問題指南：** [詳細解決方案](docs/troubleshooting/common-issues.md)
- **AI 特殊問題：** [AI 故障排除](docs/troubleshooting/ai-troubleshooting.md)
- **除錯指南：** [逐步除錯教學](docs/troubleshooting/debugging.md)
- **尋求協助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 快速故障排除指南

**初學者常見問題與即時解決方案：**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# 先安裝 AZD
# Windows（PowerShell）：
winget install microsoft.azd

# macOS：
brew tap azure/azd && brew install azd

# Linux：
curl -fsSL https://aka.ms/install-azd.sh | bash

# 驗證安裝
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# 列出可用訂閱
az account list --output table

# 設定預設訂閱
az account set --subscription "<subscription-id-or-name>"

# 為 AZD 環境設定
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# 驗證
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# 嘗試不同的 Azure 區域
azd env set AZURE_LOCATION "westus2"
azd up

# 或在開發中使用較小的 SKU
# 編輯 infra/main.parameters.json：
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" 運行至一半失敗</strong></summary>

```bash
# 選項 1：清理後重試
azd down --force --purge
azd up

# 選項 2：只修復基礎設施
azd provision

# 選項 3：檢查詳細日誌
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# 重新驗證身份
az logout
az login

azd auth logout
azd auth login

# 驗證身份認證
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" 或命名衝突</strong></summary>

```bash
# AZD 會生成獨特名稱，但如果發生衝突：
azd down --force --purge

# 則使用全新環境重試
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 模板部署耗時過長</strong></summary>

**正常等待時間：**
- 簡單網頁應用：5-10 分鐘
- 搭配資料庫應用：10-15 分鐘
- AI 應用程式：15-25 分鐘（OpenAI 佈建較慢）

```bash
# 檢查進度
azd show

# 如果卡住超過30分鐘，檢查 Azure 入口網站：
azd monitor
# 尋找失敗的部署
```
</details>

<details>
<summary><strong>❌ "Permission denied" 或 "Forbidden"</strong></summary>

```bash
# 檢查您的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 您至少需要「參與者」角色
# 請您的 Azure 管理員授予：
# - 參與者（用於資源）
# - 使用者存取管理員（用於角色分配）
```
</details>

<details>
<summary><strong>❌ 找不到已部署應用程式 URL</strong></summary>

```bash
# 顯示所有服務端點
azd show

# 或者打開 Azure 入口網站
azd monitor

# 檢查特定服務
azd env get-values
# 尋找 *_URL 變數
```
</details>

### 📚 完整故障排除資源

- **常見問題指南：** [詳細解決方案](docs/troubleshooting/common-issues.md)
- **AI 特殊問題：** [AI 故障排除](docs/troubleshooting/ai-troubleshooting.md)
- **除錯指南：** [逐步除錯教學](docs/troubleshooting/debugging.md)
- **尋求協助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 課程完成與認證

### 進度追蹤
追蹤你學習各章節的進度：

- [ ] **第 1 章**：基礎與快速入門 ✅
- [ ] **第 2 章**：AI 優先開發 ✅  
- [ ] **第 3 章**：設定與認證 ✅
- [ ] **第 4 章**：基礎架構即程式碼與部署 ✅
- [ ] **第 5 章**：多代理 AI 解決方案 ✅
- [ ] **第 6 章**：部署前驗證與規劃 ✅
- [ ] **第 7 章**：故障排除與除錯 ✅
- [ ] **第 8 章**：生產環境與企業模式 ✅

### 學習驗證
完成每一章後，依序驗證你的知識：
1. **實作練習**：完成章節的實際部署
2. **知識檢核**：查看該章節的常見問答
3. **社群討論**：於 Azure Discord 分享經驗
4. **下一章節**：前進更高難度章節

### 課程完成好處
完成所有章節後，你將擁有：
- **生產經驗**：已向 Azure 部署真實 AI 應用
- **專業技能**：企業級部署能力  
- **社群認可**：Azure 開發者社群活躍成員
- **職涯提升**：搶手 AZD 與 AI 部署專才

---

## 🤝 社群與支援

### 尋求協助
- **技術問題**：[回報錯誤及功能需求](https://github.com/microsoft/azd-for-beginners/issues)
- **學習疑問**：[Microsoft Azure Discord 社群](https://discord.gg/microsoft-azure) 與 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 相關協助**：加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **文件資料**：[官方 Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord 社群洞察

**#Azure 頻道最新投票結果：**
- **45%** 開發者希望使用 AZD 作 AI 工作負載
- **主要挑戰**：多服務部署、憑證管理、生產準備  
- **最多請求**：AI 專用模板、故障排除指南、最佳實踐

**加入我們社群可：**
- 分享你的 AZD 與 AI 經驗並獲得協助
- 率先取得新 AI 模板預覽
- 參與 AI 部署最佳實踐貢獻
- 影響未來 AI + AZD 功能開發

### 參與課程貢獻
歡迎貢獻！請參閱我們的 [貢獻指南](CONTRIBUTING.md) 了解：
- **內容優化**：改良既有章節及示範
- **新增範例**：增加實務情境與模板  
- **翻譯協助**：維護多語系支援
- **錯誤回報**：提升準確性與完整性
- **社群守則**：遵守共融社群準則

---

## 📄 課程資訊

### 授權條款
本專案採用 MIT 授權條款 - 詳見 [LICENSE](../../LICENSE) 文件。

### 微軟其他學習資源

我們團隊提供其他全面學習課程：

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### 生成式 AI 系列
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### 核心學習

[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot 系列
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ 課程導航

**🚀 準備好開始學習了嗎？**

**初學者**：從 [第 1 章：基礎與快速開始](../..) 開始  
**AI 開發者**：跳至 [第 2 章：AI 優先開發](../..)  
**有經驗的開發者**：開始於 [第 3 章：配置與驗證](../..)

**下一步**：[開始第 1 章 - AZD 基礎](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件乃使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們致力於確保準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件以其母語版本為權威依據。對於重要資訊，建議採用專業人工翻譯。本公司不對因使用本翻譯而引起的任何誤解或錯誤詮釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->