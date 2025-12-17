<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "62affa32f7697d88ec2a2d5745364db1",
  "translation_date": "2025-12-15T21:37:17+00:00",
  "source_file": "README.md",
  "language_code": "hk"
}
-->
# AZD 初學者指南：有結構的學習旅程

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.hk.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## 開始本課程

請依照以下步驟開始您的 AZD 學習旅程：

1. **Fork 倉庫**：點擊 [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone 倉庫**：`git clone https://github.com/microsoft/azd-for-beginners.git`
3. **加入社群**：[Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) 尋求專家支援
4. **選擇您的學習路徑**：從下方章節中選擇符合您經驗水平的內容

### 多語言支援

#### 自動翻譯（持續更新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](./README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 課程概覽

透過有結構的章節掌握 Azure Developer CLI (azd)，設計為循序漸進的學習。**特別聚焦於結合 Microsoft Foundry 的 AI 應用部署。**

### 為何本課程對現代開發者至關重要

根據 Microsoft Foundry Discord 社群的見解，**45% 的開發者希望使用 AZD 來處理 AI 工作負載**，但面臨以下挑戰：
- 複雜的多服務 AI 架構
- 生產環境 AI 部署最佳實踐  
- Azure AI 服務整合與配置
- AI 工作負載的成本優化
- AI 特定部署問題的故障排除

### 學習目標

完成本有結構課程後，您將能：
- **掌握 AZD 基礎**：核心概念、安裝與配置
- **部署 AI 應用**：使用 AZD 與 Microsoft Foundry 服務
- **實作基礎設施即代碼**：使用 Bicep 模板管理 Azure 資源
- **故障排除部署問題**：解決常見問題與除錯
- **優化生產環境**：安全性、擴展性、監控與成本管理
- **構建多代理解決方案**：部署複雜 AI 架構

## 📚 學習章節

*根據經驗水平與目標選擇您的學習路徑*

### 🚀 第 1 章：基礎與快速入門
**先決條件**：Azure 訂閱，基本命令列知識  
**時長**：30-45 分鐘  
**難度**：⭐

#### 您將學到
- 了解 Azure Developer CLI 基礎
- 在您的平台安裝 AZD
- 您的第一次成功部署

#### 學習資源
- **🎯 從這裡開始**：[什麼是 Azure Developer CLI？](../..)
- **📖 理論**：[AZD 基礎](docs/getting-started/azd-basics.md) - 核心概念與術語
- **⚙️ 設置**：[安裝與設定](docs/getting-started/installation.md) - 平台專屬指南
- **🛠️ 實作**：[您的第一個專案](docs/getting-started/first-project.md) - 逐步教學
- **📋 快速參考**：[指令速查表](resources/cheat-sheet.md)

#### 實作練習
```bash
# 快速安裝檢查
azd version

# 部署你的第一個應用程式
azd init --template todo-nodejs-mongo
azd up
```

**💡 章節成果**：成功使用 AZD 部署簡單的網頁應用程式到 Azure

**✅ 成功驗證：**
```bash
# 完成第一章後，你應該能夠：
azd version              # 顯示已安裝版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署到 Azure
azd show                # 顯示運行中應用程式的 URL
# 應用程式在瀏覽器中開啟並運作
azd down --force --purge  # 清理資源
```

**📊 時間投入：** 30-45 分鐘  
**📈 完成後技能水平：** 能獨立部署基本應用程式

**✅ 成功驗證：**
```bash
# 完成第一章後，你應該能夠：
azd version              # 顯示已安裝的版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署到 Azure
azd show                # 顯示正在運行的應用程式 URL
# 應用程式在瀏覽器中開啟並運作
azd down --force --purge  # 清理資源
```

**📊 時間投入：** 30-45 分鐘  
**📈 完成後技能水平：** 能獨立部署基本應用程式

---

### 🤖 第 2 章：AI 優先開發（推薦給 AI 開發者）
**先決條件**：完成第 1 章  
**時長**：1-2 小時  
**難度**：⭐⭐

#### 您將學到
- Microsoft Foundry 與 AZD 的整合
- 部署 AI 驅動的應用程式
- 了解 AI 服務配置

#### 學習資源
- **🎯 從這裡開始**：[Microsoft Foundry 整合](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 模式**：[AI 模型部署](docs/microsoft-foundry/ai-model-deployment.md) - 部署與管理 AI 模型
- **🛠️ 工作坊**：[AI 工作坊實驗室](docs/microsoft-foundry/ai-workshop-lab.md) - 讓您的 AI 解決方案適用於 AZD
- **🎥 互動指南**：[工作坊教材](workshop/README.md) - 使用 MkDocs 的瀏覽器學習 * DevContainer 環境
- **📋 範本**：[Microsoft Foundry 範本](../..)
- **📝 範例**：[AZD 部署範例](examples/README.md)

#### 實作練習
```bash
# 部署你的第一個人工智能應用程式
azd init --template azure-search-openai-demo
azd up

# 嘗試更多人工智能範本
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 章節成果**：部署並配置具備 RAG 功能的 AI 聊天應用程式

**✅ 成功驗證：**
```bash
# 完成第二章後，你應該能夠：
azd init --template azure-search-openai-demo
azd up
# 測試 AI 聊天介面
# 提問並獲得帶有來源的 AI 回應
# 驗證搜尋整合是否運作
azd monitor  # 檢查 Application Insights 是否顯示遙測資料
azd down --force --purge
```

**📊 時間投入：** 1-2 小時  
**📈 完成後技能水平：** 能部署並配置生產級 AI 應用程式  
**💰 成本認知：** 了解開發成本約 $80-150/月，生產成本約 $300-3500/月

#### 💰 AI 部署成本考量

**開發環境（估計 $80-150/月）：**
- Azure OpenAI（按使用付費）：$0-50/月（依令牌使用量）
- AI 搜尋（基礎層）：$75/月
- Container Apps（消耗計費）：$0-20/月
- 儲存（標準）：$1-5/月

**生產環境（估計 $300-3,500+/月）：**
- Azure OpenAI（PTU 保持穩定效能）：$3,000+/月 或 高用量按使用付費
- AI 搜尋（標準層）：$250/月
- Container Apps（專用）：$50-100/月
- Application Insights：$5-50/月
- 儲存（高級）：$10-50/月

**💡 成本優化建議：**
- 使用 **免費層** Azure OpenAI 學習（含 50,000 令牌/月）
- 不開發時執行 `azd down` 釋放資源
- 先使用消耗計費，生產環境才升級 PTU
- 使用 `azd provision --preview` 預估部署成本
- 啟用自動擴展：只為實際使用付費

**成本監控：**
```bash
# 檢查預計每月費用
azd provision --preview

# 在 Azure 入口網站監控實際費用
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第 3 章：配置與認證
**先決條件**：完成第 1 章  
**時長**：45-60 分鐘  
**難度**：⭐⭐

#### 您將學到
- 環境配置與管理
- 認證與安全最佳實踐
- 資源命名與組織

#### 學習資源
- **📖 配置**：[配置指南](docs/getting-started/configuration.md) - 環境設定
- **🔐 安全**：[認證模式與管理身分](docs/getting-started/authsecurity.md) - 認證模式
- **📝 範例**：[資料庫應用範例](examples/database-app/README.md) - AZD 資料庫範例

#### 實作練習
- 配置多個環境（開發、測試、生產）
- 設定管理身分認證
- 實作環境特定配置

**💡 章節成果**：管理多個環境並具備適當認證與安全性

---

### 🏗️ 第 4 章：基礎設施即代碼與部署
**先決條件**：完成第 1-3 章  
**時長**：1-1.5 小時  
**難度**：⭐⭐⭐

#### 您將學到
- 進階部署模式
- 使用 Bicep 的基礎設施即代碼
- 資源佈建策略

#### 學習資源
- **📖 部署**：[部署指南](docs/deployment/deployment-guide.md) - 完整工作流程
- **🏗️ 佈建**：[資源佈建](docs/deployment/provisioning.md) - Azure 資源管理
- **📝 範例**：[Container App 範例](../../examples/container-app) - 容器化部署

#### 實作練習
- 建立自訂 Bicep 模板
- 部署多服務應用程式
- 實作藍綠部署策略

**💡 章節成果**：使用自訂基礎設施模板部署複雜多服務應用程式

---

### 🎯 第 5 章：多代理 AI 解決方案（進階）
**先決條件**：完成第 1-2 章  
**時長**：2-3 小時  
**難度**：⭐⭐⭐⭐

#### 您將學到
- 多代理架構模式
- 代理協調與編排
- 生產級 AI 部署

#### 學習資源
- **🤖 精選專案**：[零售多代理解決方案](examples/retail-scenario.md) - 完整實作

- **🛠️ ARM 範本**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - 一鍵部署
- **📖 架構**: [多代理協調模式](/docs/pre-deployment/coordination-patterns.md) - 模式

#### 實作練習
```bash
# 部署完整的零售多代理解決方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索代理配置
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 章節成果**: 部署並管理具備客戶與庫存代理的生產就緒多代理 AI 解決方案

---

### 🔍 第 6 章：部署前驗證與規劃
**先決條件**: 完成第 4 章  
**時長**: 1 小時  
**難度**: ⭐⭐

#### 你將學習
- 容量規劃與資源驗證
- SKU 選擇策略
- 預檢查與自動化

#### 學習資源
- **📊 規劃**: [容量規劃](docs/pre-deployment/capacity-planning.md) - 資源驗證
- **💰 選擇**: [SKU 選擇](docs/pre-deployment/sku-selection.md) - 成本效益選擇
- **✅ 驗證**: [預檢查](docs/pre-deployment/preflight-checks.md) - 自動化腳本

#### 實作練習
- 執行容量驗證腳本
- 優化 SKU 選擇以降低成本
- 實作自動化部署前檢查

**💡 章節成果**: 在執行前驗證並優化部署

---

### 🚨 第 7 章：故障排除與除錯
**先決條件**: 完成任一部署章節  
**時長**: 1-1.5 小時  
**難度**: ⭐⭐

#### 你將學習
- 系統化除錯方法
- 常見問題與解決方案
- AI 專屬故障排除

#### 學習資源
- **🔧 常見問題**: [常見問題](docs/troubleshooting/common-issues.md) - FAQ 與解決方案
- **🕵️ 除錯**: [除錯指南](docs/troubleshooting/debugging.md) - 逐步策略
- **🤖 AI 問題**: [AI 專屬故障排除](docs/troubleshooting/ai-troubleshooting.md) - AI 服務問題

#### 實作練習
- 診斷部署失敗
- 解決身份驗證問題
- 除錯 AI 服務連線

**💡 章節成果**: 獨立診斷並解決常見部署問題

---

### 🏢 第 8 章：生產與企業模式
**先決條件**: 完成第 1-4 章  
**時長**: 2-3 小時  
**難度**: ⭐⭐⭐⭐

#### 你將學習
- 生產部署策略
- 企業安全模式
- 監控與成本優化

#### 學習資源
- **🏭 生產**: [生產 AI 最佳實踐](docs/microsoft-foundry/production-ai-practices.md) - 企業模式
- **📝 範例**: [微服務範例](../../examples/microservices) - 複雜架構
- **📊 監控**: [Application Insights 整合](docs/pre-deployment/application-insights.md) - 監控

#### 實作練習
- 實作企業安全模式
- 設置完整監控
- 以適當治理部署至生產環境

**💡 章節成果**: 部署具備完整生產能力的企業級應用

---

## 🎓 工作坊概覽：實作學習體驗

> **⚠️ 工作坊狀態：積極開發中**  
> 工作坊教材目前正在開發與完善中。核心模組已可使用，但部分進階章節尚未完成。我們正積極努力完成所有內容。 [追蹤進度 →](workshop/README.md)

### 互動式工作坊教材
**結合瀏覽器工具與引導練習的完整實作學習體驗**

我們的工作坊教材提供結構化且互動的學習體驗，與上述章節課程相輔相成。工作坊設計適合自學與講師帶領課程。

#### 🛠️ 工作坊特色
- **瀏覽器介面**: 完整 MkDocs 支援的工作坊，具備搜尋、複製與主題功能
- **GitHub Codespaces 整合**: 一鍵開發環境設定
- **結構化學習路徑**: 7 步驟引導練習（共 3.5 小時）
- **探索 → 部署 → 客製化**: 漸進式方法論
- **互動式 DevContainer 環境**: 預先配置工具與相依性

#### 📚 工作坊結構
工作坊遵循 **探索 → 部署 → 客製化** 方法論：

1. **探索階段** (45 分鐘)
   - 探索 Microsoft Foundry 範本與服務
   - 理解多代理架構模式
   - 檢視部署需求與先決條件

2. **部署階段** (2 小時)
   - 實作使用 AZD 部署 AI 應用
   - 配置 Azure AI 服務與端點
   - 實作安全與身份驗證模式

3. **客製化階段** (45 分鐘)
   - 修改應用以符合特定使用案例
   - 優化生產部署
   - 實作監控與成本管理

#### 🚀 開始使用工作坊
```bash
# 選項 1：GitHub Codespaces（推薦）
# 在倉庫中點擊「Code」→「Create codespace on main」

# 選項 2：本地開發
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 按照 workshop/README.md 中的設置說明進行操作
```

#### 🎯 工作坊學習成果
完成工作坊後，參與者將能：
- **部署生產 AI 應用**：使用 AZD 與 Microsoft Foundry 服務
- **精通多代理架構**：實作協調的 AI 代理解決方案
- **實作安全最佳實踐**：配置身份驗證與存取控制
- **優化擴展性**：設計具成本效益且高效能的部署
- **故障排除部署問題**：獨立解決常見問題

#### 📖 工作坊資源
- **🎥 互動指南**: [工作坊教材](workshop/README.md) - 瀏覽器學習環境
- **📋 逐步指引**: [引導練習](../../workshop/docs/instructions) - 詳細操作說明
- **🛠️ AI 工作坊實驗室**: [AI 工作坊實驗室](docs/microsoft-foundry/ai-workshop-lab.md) - AI 專注練習
- **💡 快速入門**: [工作坊設定指南](workshop/README.md#quick-start) - 環境配置

**適合對象**：企業培訓、大學課程、自學與開發者訓練營。

---

## 📖 什麼是 Azure Developer CLI？

Azure Developer CLI (azd) 是一款以開發者為中心的命令列介面，加速應用程式在 Azure 上的建置與部署流程。它提供：

- **範本式部署** - 使用預建範本快速建立常見應用模式
- **基礎架構即程式碼** - 使用 Bicep 或 Terraform 管理 Azure 資源  
- **整合工作流程** - 無縫配置、部署與監控應用
- **開發者友善** - 優化開發者生產力與體驗

### **AZD + Microsoft Foundry：AI 部署的完美組合**

**為何選擇 AZD 部署 AI 解決方案？** AZD 解決 AI 開發者面臨的主要挑戰：

- **AI 就緒範本** - 預配置 Azure OpenAI、認知服務與機器學習工作負載範本
- **安全 AI 部署** - 內建 AI 服務、API 金鑰與模型端點的安全模式  
- **生產 AI 模式** - 可擴展且成本效益高的 AI 應用部署最佳實踐
- **端到端 AI 工作流程** - 從模型開發到生產部署並具備適當監控
- **成本優化** - 智慧資源分配與擴展策略
- **Microsoft Foundry 整合** - 無縫連接 Microsoft Foundry 模型目錄與端點

---

## 🎯 範本與範例庫

### 精選：Microsoft Foundry 範本
**如果你要部署 AI 應用，從這裡開始！**

> **注意：** 這些範本展示各種 AI 模式。有些是外部 Azure 範例，有些是本地實作。

| 範本 | 章節 | 難度 | 服務 | 類型 |
|----------|---------|------------|----------|------|
| [**開始使用 AI 聊天**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第 2 章 | ⭐⭐ | AzureOpenAI + Azure AI 模型推論 API + Azure AI 搜尋 + Azure Container Apps + Application Insights | 外部 |
| [**開始使用 AI 代理**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第 2 章 | ⭐⭐ | Azure AI 代理服務 + AzureOpenAI + Azure AI 搜尋 + Azure Container Apps + Application Insights| 外部 |
| [**Azure 搜尋 + OpenAI 示範**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第 2 章 | ⭐⭐ | AzureOpenAI + Azure AI 搜尋 + App Service + Storage | 外部 |
| [**OpenAI 聊天應用快速入門**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第 2 章 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第 5 章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 第 8 章 | ⭐⭐⭐⭐ | AzureOpenAI + AI 搜尋 + Cosmos DB + Container Apps | 外部 |
| [**零售多代理解決方案**](examples/retail-scenario.md) | 第 5 章 | ⭐⭐⭐⭐ | AzureOpenAI + AI 搜尋 + Storage + Container Apps + Cosmos DB | **本地** |

### 精選：完整學習場景
**生產就緒應用範本，對應學習章節**

| 範本 | 學習章節 | 難度 | 主要學習內容 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第 2 章 | ⭐ | 基本 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第 2 章 | ⭐⭐ | 使用 Azure AI 搜尋的 RAG 實作 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第 4 章 | ⭐⭐ | 文件智能整合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第 5 章 | ⭐⭐⭐ | 代理框架與函式呼叫 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第 8 章 | ⭐⭐⭐ | 企業 AI 編排 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第 5 章 | ⭐⭐⭐⭐ | 具客戶與庫存代理的多代理架構 |

### 依範例類型學習

> **📌 本地與外部範例：**  
> **本地範例**（本倉庫）= 可立即使用  
> **外部範例**（Azure Samples）= 從連結的倉庫克隆

#### 本地範例（可立即使用）
- [**零售多代理解決方案**](examples/retail-scenario.md) - 完整生產就緒實作含 ARM 範本
  - 多代理架構（客戶 + 庫存代理）
  - 全面監控與評估
  - 透過 ARM 範本一鍵部署

#### 本地範例 - 容器應用（第 2-5 章）
**本倉庫中完整的容器部署範例：**
- [**容器應用範例**](examples/container-app/README.md) - 容器化部署完整指南
  - [簡易 Flask API](../../examples/container-app/simple-flask-api) - 基本 REST API，支援 scale-to-zero
  - [微服務架構](../../examples/container-app/microservices) - 生產就緒多服務部署
  - 快速入門、生產與進階部署模式
  - 監控、安全與成本優化指引

#### 外部範例 - 簡易應用（第 1-2 章）
**克隆這些 Azure Samples 倉庫開始：**
- [簡易 Web 應用 - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本部署模式
- [靜態網站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 靜態內容部署
- [容器應用 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署

#### 外部範例 - 資料庫整合（第 3-4 章）  
- [資料庫應用 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 資料庫連接模式
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 無伺服器資料工作流程

#### 外部範例 - 進階模式（第 4-8 章）
- [Java 微服務](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服務架構
- [容器應用工作任務](https://github.com/Azure-Samples/container-apps-jobs) - 背景處理  
- [企業 ML 管線](https://github.com/Azure-Samples/mlops-v2) - 生產就緒 ML 模式

### 外部範本集合
- [**官方 AZD 範本庫**](https://azure.github.io/awesome-azd/) - 精選官方與社群範本
- [**Azure Developer CLI 範本**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 範本文件
- [**範例目錄**](examples/README.md) - 本地學習範例與詳細說明

---

## 📚 學習資源與參考

### 快速參考
- [**指令速查表**](resources/cheat-sheet.md) - 按章節組織的基本 azd 指令
- [**術語表**](resources/glossary.md) - Azure 與 azd 術語  
- [**常見問題**](resources/faq.md) - 按學習章節組織的常見問題
- [**學習指南**](resources/study-guide.md) - 全面練習題目

### 實作工作坊
- [**AI 工作坊實驗室**](docs/microsoft-foundry/ai-workshop-lab.md) - 讓你的 AI 解決方案可用 AZD 部署（2-3 小時）
- [**互動式工作坊指南**](workshop/README.md) - 使用 MkDocs 與 DevContainer 環境的瀏覽器工作坊
- [**結構化學習路徑**](../../workshop/docs/instructions) - 7 步驟引導練習（探索 → 部署 → 自訂）
- [**AZD 初學者工作坊**](workshop/README.md) - 完整實作工作坊教材，整合 GitHub Codespaces

### 外部學習資源
- [Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 價格計算器](https://azure.microsoft.com/pricing/calculator/)
- [Azure 狀態](https://status.azure.com/)

---

## 🔧 快速故障排除指南

**初學者常見問題與即時解決方案：**

### ❌ 「azd: command not found」

```bash
# 首先安裝 AZD
# Windows（PowerShell）：
winget install microsoft.azd

# macOS：
brew tap azure/azd && brew install azd

# Linux：
curl -fsSL https://aka.ms/install-azd.sh | bash

# 驗證安裝
azd version
```

### ❌ 「找不到訂閱」或「未設定訂閱」

```bash
# 列出可用的訂閱
az account list --output table

# 設定預設訂閱
az account set --subscription "<subscription-id-or-name>"

# 設定 AZD 環境
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# 驗證
az account show
```

### ❌ 「配額不足」或「配額超過」

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

### ❌ 「azd up」中途失敗

```bash
# 選項 1：清理並重試
azd down --force --purge
azd up

# 選項 2：只修復基礎設施
azd provision

# 選項 3：檢查詳細日誌
azd show
azd logs
```

### ❌ 「認證失敗」或「令牌過期」

```bash
# 重新驗證
az logout
az login

azd auth logout
azd auth login

# 驗證身份認證
az account show
```

### ❌ 「資源已存在」或命名衝突

```bash
# AZD 會生成獨特名稱，但如果有衝突：
azd down --force --purge

# 則使用全新環境重試
azd env new dev-v2
azd up
```

### ❌ 模板部署時間過長

**正常等待時間：**
- 簡單網頁應用：5-10 分鐘
- 含資料庫的應用：10-15 分鐘
- AI 應用：15-25 分鐘（OpenAI 配置較慢）

```bash
# 檢查進度
azd show

# 如果卡住超過30分鐘，檢查 Azure 入口網站：
azd monitor
# 尋找失敗的部署
```

### ❌ 「權限被拒絕」或「禁止存取」

```bash
# 檢查你的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 你至少需要「參與者」角色
# 請你的 Azure 管理員授予：
# - 參與者（用於資源）
# - 使用者存取管理員（用於角色指派）
```

### ❌ 找不到已部署應用程式的 URL

```bash
# 顯示所有服務端點
azd show

# 或打開 Azure 入口網站
azd monitor

# 檢查特定服務
azd env get-values
# 尋找 *_URL 變數
```

### 📚 完整故障排除資源

- **常見問題指南：** [詳細解決方案](docs/troubleshooting/common-issues.md)
- **AI 專屬問題：** [AI 故障排除](docs/troubleshooting/ai-troubleshooting.md)
- **除錯指南：** [逐步除錯](docs/troubleshooting/debugging.md)
- **尋求協助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 快速故障排除指南

**初學者常見問題與即時解決方案：**

<details>
<summary><strong>❌ 「azd: command not found」</strong></summary>

```bash
# 首先安裝 AZD
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
<summary><strong>❌ 「找不到訂閱」或「未設定訂閱」</strong></summary>

```bash
# 列出可用的訂閱
az account list --output table

# 設定預設訂閱
az account set --subscription "<subscription-id-or-name>"

# 設定 AZD 環境
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# 驗證
az account show
```
</details>

<details>
<summary><strong>❌ 「配額不足」或「配額超過」</strong></summary>

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
<summary><strong>❌ 「azd up」中途失敗</strong></summary>

```bash
# 選項 1：清理並重試
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
<summary><strong>❌ 「認證失敗」或「令牌過期」</strong></summary>

```bash
# 重新驗證
az logout
az login

azd auth logout
azd auth login

# 驗證身份認證
az account show
```
</details>

<details>
<summary><strong>❌ 「資源已存在」或命名衝突</strong></summary>

```bash
# AZD 會產生獨特名稱，但如果有衝突：
azd down --force --purge

# 則使用全新環境重試
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 模板部署時間過長</strong></summary>

**正常等待時間：**
- 簡單網頁應用：5-10 分鐘
- 含資料庫的應用：10-15 分鐘
- AI 應用：15-25 分鐘（OpenAI 配置較慢）

```bash
# 檢查進度
azd show

# 如果卡住超過30分鐘，檢查 Azure 入口網站：
azd monitor
# 尋找失敗的部署
```
</details>

<details>
<summary><strong>❌ 「權限被拒絕」或「禁止存取」</strong></summary>

```bash
# 檢查你的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 你至少需要「參與者」角色
# 請你的 Azure 管理員授予：
# - 參與者（用於資源）
# - 使用者存取管理員（用於角色指派）
```
</details>

<details>
<summary><strong>❌ 找不到已部署應用程式的 URL</strong></summary>

```bash
# 顯示所有服務端點
azd show

# 或打開 Azure 入口網站
azd monitor

# 檢查特定服務
azd env get-values
# 尋找 *_URL 變數
```
</details>

### 📚 完整故障排除資源

- **常見問題指南：** [詳細解決方案](docs/troubleshooting/common-issues.md)
- **AI 專屬問題：** [AI 故障排除](docs/troubleshooting/ai-troubleshooting.md)
- **除錯指南：** [逐步除錯](docs/troubleshooting/debugging.md)
- **尋求協助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 課程完成與認證

### 進度追蹤
追蹤你每章節的學習進度：

- [ ] **第 1 章**：基礎與快速入門 ✅
- [ ] **第 2 章**：AI 優先開發 ✅  
- [ ] **第 3 章**：設定與認證 ✅
- [ ] **第 4 章**：基礎架構即程式碼與部署 ✅
- [ ] **第 5 章**：多代理 AI 解決方案 ✅
- [ ] **第 6 章**：部署前驗證與規劃 ✅
- [ ] **第 7 章**：故障排除與除錯 ✅
- [ ] **第 8 章**：生產與企業模式 ✅

### 學習驗證
完成每章後，透過以下方式驗證你的知識：
1. **實作練習**：完成該章的實際部署
2. **知識檢核**：檢視該章的常見問題區
3. **社群討論**：在 Azure Discord 分享你的經驗
4. **下一章節**：進入下一個難度層級

### 課程完成好處
完成所有章節後，你將擁有：
- **生產經驗**：將真實 AI 應用部署到 Azure
- **專業技能**：具備企業級部署能力  
- **社群認可**：成為活躍的 Azure 開發者社群成員
- **職涯提升**：掌握熱門的 AZD 與 AI 部署專業知識

---

## 🤝 社群與支援

### 尋求協助與支援
- **技術問題**： [回報錯誤與功能需求](https://github.com/microsoft/azd-for-beginners/issues)
- **學習問題**： [Microsoft Azure Discord 社群](https://discord.gg/microsoft-azure) 與 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 專屬協助**：加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **文件資源**： [官方 Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord 的社群洞察

**#Azure 頻道近期投票結果：**
- **45%** 的開發者想用 AZD 來處理 AI 工作負載
- **主要挑戰**：多服務部署、憑證管理、生產準備  
- **最受歡迎需求**：AI 專屬模板、故障排除指南、最佳實踐

**加入我們的社群，享有：**
- 分享你的 AZD + AI 經驗並獲得協助
- 取得 AI 模板的早期預覽
- 參與 AI 部署最佳實踐的貢獻
- 影響未來 AI + AZD 功能開發

### 課程貢獻
歡迎貢獻！請閱讀我們的 [貢獻指南](CONTRIBUTING.md) 了解詳情：
- **內容改進**：強化現有章節與範例
- **新增範例**：加入真實場景與模板  
- **翻譯**：協助維護多語言支援
- **錯誤回報**：提升準確性與清晰度
- **社群標準**：遵守我們包容的社群規範

---

## 📄 課程資訊

### 授權條款
本專案採用 MIT 授權條款 - 詳見 [LICENSE](../../LICENSE) 檔案。

### 相關 Microsoft 學習資源

我們團隊製作其他全面的學習課程：

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
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

**初學者**：從 [第 1 章：基礎與快速入門](../..) 開始  
**AI 開發者**：跳至 [第 2 章：AI 優先開發](../..)  
**有經驗的開發者**：從 [第 3 章：設定與驗證](../..) 開始

**下一步**：[開始第 1 章 - AZD 基礎](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於確保準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->