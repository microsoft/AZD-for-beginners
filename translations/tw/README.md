<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1caf5e63f84a4cdffbeb8d0fe5fa3fa8",
  "translation_date": "2025-12-21T12:38:56+00:00",
  "source_file": "README.md",
  "language_code": "tw"
}
-->
# AZD 新手指南：結構化學習之旅

![AZD 新手入門](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.tw.png) 

[![GitHub 追蹤者](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub 分叉](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub 星標](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord 社群](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord 社群](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## 開始此課程

請依照下列步驟開始您的 AZD 學習之旅：

1. **Fork 此倉庫**：點選 [![GitHub 分叉](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone 倉庫**：`git clone https://github.com/microsoft/azd-for-beginners.git`
3. **加入社群**：在 [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) 尋求專家支援
4. **選擇您的學習路徑**：從下方章節中選擇符合您經驗程度的章節

### 多語言支援

#### 自動翻譯（始終保持最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](./README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 課程概覽

透過結構化章節學習 Azure Developer CLI (azd)，設計為循序漸進學習。**特別聚焦於整合 Microsoft Foundry 的 AI 應用部署。**

### 為何此課程對現代開發者至關重要

根據 Microsoft Foundry Discord 社群的見解，**45% 的開發者希望使用 AZD 來處理 AI 工作負載**，但會面臨下列挑戰：
- 複雜的多服務 AI 架構
- AI 上線部署的最佳實務
- Azure AI 服務的整合與設定
- AI 工作負載的成本優化
- AI 特定部署問題的故障排除

### 學習目標

完成此結構化課程後，您將能夠：
- **精通 AZD 基礎**：核心概念、安裝與設定
- **部署 AI 應用**：在 Microsoft Foundry 服務上使用 AZD
- **實作基礎設施即程式碼**：使用 Bicep 範本管理 Azure 資源
- **排查部署問題**：解決常見問題並除錯
- **優化生產環境**：安全、擴展、監控與成本管理
- **建置多代理解決方案**：部署複雜的 AI 架構

## 📚 學習章節

*根據經驗等級與目標選擇您的學習路徑*

### 🚀 第 1 章：基礎與快速入門
**先決條件**：有 Azure 訂閱、基本命令列知識  
**所需時間**：30-45 分鐘  
**複雜度**：⭐

#### 您將學到的內容
- 了解 Azure Developer CLI 的基本概念
- 在您的平台上安裝 AZD
- 成功完成您的第一次部署

#### 學習資源
- **🎯 從這裡開始**： [什麼是 Azure Developer CLI？](../..)
- **📖 理論**： [AZD 基礎](docs/getting-started/azd-basics.md) - 核心概念與術語
- **⚙️ 設定**： [安裝與設定](docs/getting-started/installation.md) - 平台專屬指南
- **🛠️ 實作**： [您的第一個專案](docs/getting-started/first-project.md) - 逐步教學
- **📋 快速參考**： [指令速查表](resources/cheat-sheet.md)

#### 實作練習
```bash
# 快速安裝檢查
azd version

# 部署你的第一個應用程式
azd init --template todo-nodejs-mongo
azd up
```

**💡 章節成果**：使用 AZD 成功將簡單的 Web 應用部署到 Azure

**✅ 成功驗證：**
```bash
# 完成第1章後，您應該能夠：
azd version              # 顯示已安裝的版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署到 Azure
azd show                # 顯示執行中應用程式的 URL
# 應用程式在瀏覽器中開啟並可正常運作
azd down --force --purge  # 清理資源
```

**📊 時間投入：** 30-45 分鐘  
**📈 完成後技能：** 能夠獨立部署基本應用

**✅ 成功驗證：**
```bash
# 完成第1章後，您應該能夠：
azd version              # 顯示已安裝的版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署到 Azure
azd show                # 顯示正在執行的應用程式 URL
# 應用程式在瀏覽器中開啟並正常運作
azd down --force --purge  # 清理資源
```

**📊 時間投入：** 30-45 分鐘  
**📈 完成後技能：** 能夠獨立部署基本應用

---

### 🤖 第 2 章：以 AI 為先的開發（建議 AI 開發者）
**先決條件**：已完成第 1 章  
**所需時間**：1-2 小時  
**複雜度**：⭐⭐

#### 您將學到的內容
- Microsoft Foundry 與 AZD 的整合
- 部署具 AI 能力的應用
- 了解 AI 服務的設定方式

#### 學習資源
- **🎯 從這裡開始**： [Microsoft Foundry 整合](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 範式**： [AI 模型部署](docs/microsoft-foundry/ai-model-deployment.md) - 部署與管理 AI 模型
- **🛠️ 工作坊**： [AI 工作坊實驗室](docs/microsoft-foundry/ai-workshop-lab.md) - 使您的 AI 解決方案能在 AZD 上運作
- **🎥 互動指南**： [工作坊教材](workshop/README.md) - 使用 MkDocs 的瀏覽器學習 * DevContainer 環境
- **📋 範本**： [精選 Microsoft Foundry 範本](../..)
- **📝 範例**： [AZD 部署範例](examples/README.md)

#### 實作練習
```bash
# 部署你的第一個 AI 應用程式
azd init --template azure-search-openai-demo
azd up

# 嘗試其他 AI 範本
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 章節成果**：部署並設定具有 RAG 功能的 AI 聊天應用

**✅ 成功驗證：**
```bash
# 在第2章之後，您應該能夠：
azd init --template azure-search-openai-demo
azd up
# 測試 AI 聊天介面
# 提出問題並取得帶有來源的 AI 回應
# 確認搜尋整合是否正常運作
azd monitor  # 檢查 Application Insights 是否顯示遙測資料
azd down --force --purge
```

**📊 時間投入：** 1-2 小時  
**📈 完成後技能：** 能夠部署並設定生產級的 AI 應用  
**💰 成本認知：** 了解開發成本約 $80-150/月，生產成本約 $300-3500/月

#### 💰 AI 部署的成本考量

**開發環境（估計 $80-150/月）：**
- Azure OpenAI（按用量付費）：$0-50/月（依據 token 使用量）
- AI Search（Basic 階層）：$75/月
- Container Apps（Consumption）：$0-20/月
- 儲存（Standard）：$1-5/月

**生產環境（估計 $300-3,500+/月）：**
- Azure OpenAI（PTU 以維持一致效能）：$3,000+/月 或 高流量下的按用量付費
- AI Search（Standard 階層）：$250/月
- Container Apps（Dedicated）：$50-100/月
- Application Insights：$5-50/月
- 儲存（Premium）：$10-50/月

**💡 成本優化建議：**
- 在學習時使用 **免費方案** 的 Azure OpenAI（包含每月 50,000 tokens）
- 不積極開發時執行 `azd down` 以釋放資源
- 先使用按量計費，僅在生產時才升級為 PTU
- 使用 `azd provision --preview` 在部署前估算成本
- 啟用自動調整：僅為實際使用付費

**成本監控：**
```bash
# 檢查預估每月費用
azd provision --preview

# 在 Azure 入口網站監控實際費用
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第 3 章：設定與驗證（身分驗證）
**先決條件**：已完成第 1 章  
**所需時間**：45-60 分鐘  
**複雜度**：⭐⭐

#### 您將學到的內容
- 環境設定與管理
- 驗證與安全最佳實務
- 資源命名與組織

#### 學習資源
- **📖 設定**： [設定指南](docs/getting-started/configuration.md) - 環境設定
- **🔐 安全**： [驗證模式與受管身分](docs/getting-started/authsecurity.md) - 驗證模式
- **📝 範例**： [資料庫應用範例](examples/database-app/README.md) - AZD 資料庫範例

#### 實作練習
- 設定多個環境（dev、staging、prod）
- 建立受管身分驗證
- 實作環境專屬設定

**💡 章節成果**：以妥善的驗證與安全性管理多個環境

---

### 🏗️ 第 4 章：基礎設施即程式碼與部署
**先決條件**：已完成第 1-3 章  
**所需時間**：1-1.5 小時  
**複雜度**：⭐⭐⭐

#### 您將學到的內容
- 進階部署模式
- 使用 Bicep 的基礎設施即程式碼
- 資源佈署策略

#### 學習資源
- **📖 部署**： [部署指南](docs/deployment/deployment-guide.md) - 完整工作流程
- **🏗️ 佈署資源**： [資源佈署](docs/deployment/provisioning.md) - Azure 資源管理
- **📝 範例**： [Container App 範例](../../examples/container-app) - 容器化部署

#### 實作練習
- 建立自訂 Bicep 範本
- 部署多服務應用
- 實作藍綠部署策略

**💡 章節成果**：使用自訂基礎設施範本部署複雜的多服務應用

---

### 🎯 第 5 章：多代理 AI 解決方案（進階）
**先決條件**：已完成第 1-2 章  
**所需時間**：2-3 小時  
**複雜度**：⭐⭐⭐⭐

#### 您將學到的內容
- 多代理架構模式
- 代理的編排與協調
- 生產就緒的 AI 部署

#### 學習資源
- **🤖 精選專案**： [零售多代理解決方案](examples/retail-scenario.md) - 完整實作
- **🛠️ ARM 模板**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - 一鍵部署
- **📖 架構**: [多代理協調模式](/docs/pre-deployment/coordination-patterns.md) - 模式

#### 實作練習
```bash
# 部署完整的零售多代理解決方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索代理設定
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 章節成果**: 部署並管理具生產就緒的多代理 AI 解決方案，包含 Customer 和 Inventory 代理

---

### 🔍 第6章：部署前驗證與規劃
**先決條件**: 完成第4章  
**時長**: 1 小時  
**複雜度**: ⭐⭐

#### 學習內容
- 容量規劃與資源驗證
- SKU 選擇策略
- 部署前檢查與自動化

#### 學習資源
- **📊 規劃**: [Capacity Planning](docs/pre-deployment/capacity-planning.md) - 資源驗證
- **💰 選擇**: [SKU Selection](docs/pre-deployment/sku-selection.md) - 成本效益的選擇
- **✅ 驗證**: [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) - 自動化腳本

#### 實作練習
- 執行容量驗證腳本
- 為降低成本優化 SKU 選擇
- 實作自動化的部署前檢查

**💡 章節成果**: 在執行前驗證並優化部署

---

### 🚨 第7章：疑難排解與除錯
**先決條件**: 已完成任一部署章節  
**時長**: 1-1.5 小時  
**複雜度**: ⭐⭐

#### 學習內容
- 系統化的除錯方法
- 常見問題與解決方案
- AI 專屬的疑難排解

#### 學習資源
- **🔧 常見問題**: [Common Issues](docs/troubleshooting/common-issues.md) - 常見問答與解決方案
- **🕵️ 除錯**: [Debugging Guide](docs/troubleshooting/debugging.md) - 逐步策略
- **🤖 AI 問題**: [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - AI 服務問題

#### 實作練習
- 診斷部署失敗
- 解決認證問題
- 除錯 AI 服務連線問題

**💡 章節成果**: 能獨立診斷並解決常見的部署問題

---

### 🏢 第8章：生產與企業模式
**先決條件**: 完成第1至第4章  
**時長**: 2-3 小時  
**複雜度**: ⭐⭐⭐⭐

#### 學習內容
- 生產部署策略
- 企業安全模式
- 監控與成本優化

#### 學習資源
- **🏭 生產**: [Production AI Best Practices](docs/microsoft-foundry/production-ai-practices.md) - 企業模式
- **📝 範例**: [Microservices Example](../../examples/microservices) - 複雜架構
- **📊 監控**: [Application Insights integration](docs/pre-deployment/application-insights.md) - 監控

#### 實作練習
- 實作企業安全模式
- 建立完整的監控
- 在適當治理下部署到生產環境

**💡 章節成果**: 部署具備完整生產能力的企業應用

---

## 🎓 工作坊概覽：實作學習體驗

> **⚠️ 工作坊狀態：進行中開發**  
> 工作坊教材目前正在開發與精進中。核心模組可用，但部分進階章節尚未完成。我們正在積極完成所有內容。 [追蹤進度 →](workshop/README.md)

### 互動式工作坊教材
**以瀏覽器工具與引導練習提供完整的實作學習**

我們的工作坊教材提供結構化、互動式的學習體驗，與上述章節課程互補。工作坊設計既適合自學進度，也適合講師帶領的授課。

#### 🛠️ 工作坊特色
- **瀏覽器介面**: 使用 MkDocs 的完整工作坊，具搜尋、複製與主題功能
- **GitHub Codespaces 整合**: 一鍵開發環境設定
- **結構化學習路徑**: 7 步驟引導練習（總計 3.5 小時）
- **探索 → 部署 → 客製化**: 逐步方法論
- **互動式 DevContainer 環境**: 預先配置的工具與相依套件

#### 📚 工作坊結構
工作坊遵循 **探索 → 部署 → 客製化** 的方法論：

1. **探索階段** (45 分鐘)
   - 探索 Microsoft Foundry 範本與服務
   - 理解多代理架構模式
   - 檢視部署需求與先決條件

2. **部署階段** (2 小時)
   - 使用 AZD 實務部署 AI 應用
   - 設定 Azure AI 服務與端點
   - 實作安全與認證模式

3. **客製化階段** (45 分鐘)
   - 修改應用以符合特定使用情境
   - 為生產部署進行最佳化
   - 實作監控與成本管理

#### 🚀 開始使用工作坊
```bash
# 選項 1：GitHub Codespaces（建議）
# 在儲存庫中點選 "Code" → 在 main 分支上建立 codespace

# 選項 2：本機開發
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 請依照 workshop/README.md 中的設定說明進行
```

#### 🎯 工作坊學習成果
完成工作坊後，參與者將能：
- **部署生產 AI 應用**: 使用 AZD 與 Microsoft Foundry 服務
- **掌握多代理架構**: 實作協同的 AI 代理解決方案
- **實作安全最佳實務**: 設定認證與存取控管
- **為擴展最佳化**: 設計具成本效益且效能良好的部署
- **排解部署問題**: 可獨立解決常見問題

#### 📖 工作坊資源
- **🎥 互動式指南**: [Workshop Materials](workshop/README.md) - 瀏覽器式學習環境
- **📋 逐步指引**: [Guided Exercises](../../workshop/docs/instructions) - 詳細操作流程
- **🛠️ AI 工作坊實驗室**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - 以 AI 為重點的練習
- **💡 快速入門**: [Workshop Setup Guide](workshop/README.md#quick-start) - 環境設定

**適合對象**: 企業訓練、校園課程、自主學習與開發者訓練營。

---

## 📖 什麼是 Azure Developer CLI?

Azure Developer CLI (azd) 是以開發者為中心的命令列介面，加速將應用程式建置並部署到 Azure 的流程。它提供：

- **以範本為基礎的部署** - 使用預建範本來應對常見應用模式
- **基礎設施即程式碼** - 使用 Bicep 或 Terraform 管理 Azure 資源  
- **整合化工作流程** - 無縫地佈建、部署與監控應用程式
- **友善開發者** - 為開發者生產力與體驗最佳化

### **AZD + Microsoft Foundry：AI 部署的最佳選擇**

**為什麼選擇 AZD 來做 AI 解決方案？** AZD 解決了 AI 開發人員所面臨的主要挑戰：

- **AI 就緒的範本** - 為 Azure OpenAI、Cognitive Services 與機器學習工作負載預先配置的範本
- **安全的 AI 部署** - 內建 AI 服務、API 金鑰及模型端點的安全模式  
- **生產級 AI 模式** - 可擴展且具成本效益的 AI 應用部署最佳實務
- **端到端 AI 工作流程** - 從模型開發到生產部署並結合適當的監控
- **成本最佳化** - 針對 AI 工作負載的智慧資源配置與擴展策略
- **與 Microsoft Foundry 整合** - 與 Microsoft Foundry 模型目錄及端點的無縫連接

---

## 🎯 範本與範例資料庫

### 精選：Microsoft Foundry 範本
**如果你要部署 AI 應用，從這裡開始！**

> **注意：** 這些範本示範各種 AI 模式。有些來自外部的 Azure Samples，另一些則是本地實作。

| 範本 | 章節 | 複雜度 | 服務 | 類型 |
|----------|---------|------------|----------|------|
| [**開始使用 AI 聊天**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | 外部 |
| [**開始使用 AI 代理**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第2章 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| 外部 |
| [**Azure Search + OpenAI 示範**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | 外部 |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | 外部 |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **本地** |

### 精選：完整學習情境
**對應學習章節的生產就緒應用範本**

| 範本 | 對應學習章節 | 複雜度 | 主要學習 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | 基本 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | 使用 Azure AI Search 的 RAG 實作 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第4章 | ⭐⭐ | 文件智能整合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | 代理框架與函式呼叫 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐ | 企業級 AI 編排 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | 具有 Customer 和 Inventory 代理的多代理架構 |

### 以範例學習類型

> **📌 本地範例 vs. 外部範例：**  
> **本地範例** (在此儲存庫) = 可立即使用  
> **外部範例** (Azure Samples) = 從連結的儲存庫克隆

#### 本地範例（可立即使用）
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - 完整的生產就緒實作，含 ARM 範本
  - 多代理架構（Customer + Inventory 代理）
  - 完整的監控與評估
  - 透過 ARM 範本一鍵部署

#### 本地範例 - 容器應用（第2-5章）
**本儲存庫中的完整容器部署範例：**
- [**Container App Examples**](examples/container-app/README.md) - 容器化部署的完整指南
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - 帶 scale-to-zero 的基本 REST API
  - [Microservices Architecture](../../examples/container-app/microservices) - 生產就緒的多服務部署
  - 快速入門、生產與進階部署模式
  - 監控、安全與成本優化指引

#### 外部範例 - 簡單應用（第1-2章）
**克隆這些 Azure Samples 倉庫以開始：**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本部署模式
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 靜態內容部署
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署

#### 外部範例 - 資料庫整合（第3-4章）  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 資料庫連線模式
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 無伺服器資料工作流程

#### 外部範例 - 進階模式（第4-8章）
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服務架構
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - 背景處理  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - 生產就緒的機器學習模式

### 外部範本集合
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - 官方與社群範本的精選集合
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 的範本文件
- [**Examples Directory**](examples/README.md) - 含詳細說明的本地學習範例

---

## 📚 學習資源與參考資料

### 快速參考
- [**命令速查表**](resources/cheat-sheet.md) - 按章節整理的關鍵 azd 指令
- [**術語表**](resources/glossary.md) - Azure 和 azd 術語  
- [**常見問題集 (FAQ)**](resources/faq.md) - 按學習章節整理的常見問題
- [**學習指南**](resources/study-guide.md) - 完整的實作練習

### 實作工作坊
- [**AI Workshop Lab**](docs/microsoft-foundry/ai-workshop-lab.md) - 讓你的 AI 解決方案可用 AZD 部署 (2-3 hours)
- [**互動式工作坊指南**](workshop/README.md) - 基於瀏覽器的工作坊，使用 MkDocs 與 DevContainer Environment
- [**結構化學習路徑**](../../workshop/docs/instructions) -7-step guided exercises (Discovery → Deployment → Customization)
- [**AZD 初學者工作坊**](workshop/README.md) - 完整的實作工作坊教材，整合 GitHub Codespaces

### 外部學習資源
- [Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 定價計算機](https://azure.microsoft.com/pricing/calculator/)
- [Azure 狀態](https://status.azure.com/)

---

## 🔧 快速疑難排解指南

**常見的新手問題與即時解決方案：**

### ❌ 「找不到 azd 指令」

```bash
# 先安裝 AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
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

# 為 AZD 環境設定
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# 驗證
az account show
```

### ❌ 「InsufficientQuota」或「配額超過」

```bash
# 嘗試使用不同的 Azure 區域
azd env set AZURE_LOCATION "westus2"
azd up

# 或在開發環境使用較小的 SKU
# 編輯 infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ 「azd up」在中途失敗

```bash
# 選項 1：清理並重試
azd down --force --purge
azd up

# 選項 2：只修復基礎架構
azd provision

# 選項 3：檢查詳細日誌
azd show
azd logs
```

### ❌ 「驗證失敗」或「權杖已過期」

```bash
# 重新驗證
az logout
az login

azd auth logout
azd auth login

# 驗證身分
az account show
```

### ❌ 「資源已存在」或命名衝突

```bash
# AZD 會產生唯一的名稱，但若有衝突:
azd down --force --purge

# 則使用新的環境重試
azd env new dev-v2
azd up
```

### ❌ 範本部署耗時過久

**正常等待時間：**
- 簡單的網頁應用程式：5-10 分鐘
- 含資料庫的應用程式：10-15 分鐘
- AI 應用程式：15-25 分鐘（OpenAI 預配較慢）

```bash
# 檢查進度
azd show

# 如果卡住超過30分鐘，請檢查 Azure 入口網站：
azd monitor
# 尋找失敗的部署
```

### ❌ 「權限被拒」或「Forbidden」

```bash
# 檢查您的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 您至少需要「Contributor」角色
# 請向您的 Azure 管理員要求授予：
# - Contributor（用於資源）
# - User Access Administrator（用於角色指派）
```

### ❌ 找不到已部署的應用程式 URL

```bash
# 顯示所有服務端點
azd show

# 或開啟 Azure 入口網站
azd monitor

# 檢查特定服務
azd env get-values
# 尋找 *_URL 變數
```

### 📚 完整的疑難排解資源

- **常見問題指南：** [詳細解決方案](docs/troubleshooting/common-issues.md)
- **AI 專屬問題：** [AI 疑難排解](docs/troubleshooting/ai-troubleshooting.md)
- **除錯指南：** [逐步除錯](docs/troubleshooting/debugging.md)
- **尋求協助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 快速疑難排解指南

**常見的新手問題與即時解決方案：**

<details>
<summary><strong>❌ 「找不到 azd 指令」</strong></summary>

```bash
# 先安裝 AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
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

# 為 AZD 環境設定
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# 驗證
az account show
```
</details>

<details>
<summary><strong>❌ 「InsufficientQuota」或「配額超過」</strong></summary>

```bash
# 嘗試不同的 Azure 區域
azd env set AZURE_LOCATION "westus2"
azd up

# 或在開發時使用較小的 SKU
# 編輯 infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ 「azd up」在中途失敗</strong></summary>

```bash
# 選項 1：清理並重試
azd down --force --purge
azd up

# 選項 2：僅修復基礎架構
azd provision

# 選項 3：檢查詳細日誌
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ 「驗證失敗」或「權杖已過期」</strong></summary>

```bash
# 重新驗證身份
az logout
az login

azd auth logout
azd auth login

# 驗證身份
az account show
```
</details>

<details>
<summary><strong>❌ 「資源已存在」或命名衝突</strong></summary>

```bash
# AZD 會產生唯一名稱，但若發生衝突：
azd down --force --purge

# 則以全新的環境重試
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 範本部署耗時過久</strong></summary>

**正常等待時間：**
- 簡單的網頁應用程式：5-10 分鐘
- 含資料庫的應用程式：10-15 分鐘
- AI 應用程式：15-25 分鐘（OpenAI 預配較慢）

```bash
# 檢查進度
azd show

# 如果卡住超過 30 分鐘，請檢查 Azure 入口網站：
azd monitor
# 尋找失敗的部署
```
</details>

<details>
<summary><strong>❌ 「權限被拒」或「Forbidden」</strong></summary>

```bash
# 檢查您的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 您至少需要 "Contributor" 角色
# 請向您的 Azure 管理員要求授予：
# - Contributor (用於資源)
# - User Access Administrator (用於角色指派)
```
</details>

<details>
<summary><strong>❌ 找不到已部署的應用程式 URL</strong></summary>

```bash
# 顯示所有服務端點
azd show

# 或開啟 Azure 入口網站
azd monitor

# 檢查特定服務
azd env get-values
# 尋找 *_URL 變數
```
</details>

### 📚 完整的疑難排解資源

- **常見問題指南：** [詳細解決方案](docs/troubleshooting/common-issues.md)
- **AI 專屬問題：** [AI 疑難排解](docs/troubleshooting/ai-troubleshooting.md)
- **除錯指南：** [逐步除錯](docs/troubleshooting/debugging.md)
- **尋求協助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 課程完成與認證

### 進度追蹤
追蹤你在每個章節的學習進度：

- [ ] **第 1 章**: 基礎與快速入門 ✅
- [ ] **第 2 章**: 以 AI 為先的開發 ✅  
- [ ] **第 3 章**: 配置與驗證 ✅
- [ ] **第 4 章**: 基礎設施即程式碼與部署 ✅
- [ ] **第 5 章**: 多代理 AI 解決方案 ✅
- [ ] **第 6 章**: 部署前驗證與規劃 ✅
- [ ] **第 7 章**: 疑難排解與除錯 ✅
- [ ] **第 8 章**: 生產環境與企業模式 ✅

### 學習驗證
完成每個章節後，透過以下方式驗證你的知識：
1. **實作練習**: 完成該章節的動手部署
2. **知識檢核**: 檢視該章節的常見問答
3. **社群討論**: 在 Azure Discord 分享你的經驗
4. **下一章**: 進入下一個難度等級

### 課程完成後的收益
完成所有章節後，你將擁有：
- **實務經驗**：將真實的 AI 應用部署到 Azure
- **專業技能**：具備企業級的部署能力  
- **社群認可**：成為 Azure 開發者社群的活躍成員
- **職涯提升**：熱門的 AZD 與 AI 部署專業技能

---

## 🤝 社群與支援

### 取得協助與支援
- **技術問題**： [回報錯誤與功能需求](https://github.com/microsoft/azd-for-beginners/issues)
- **學習問題**： [Microsoft Azure Discord 社群](https://discord.gg/microsoft-azure) 和 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 專屬協助**：加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **文件**： [官方 Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### 來自 Microsoft Foundry Discord 的社群洞察

**來自 #Azure 頻道的最新投票結果：**
- **45%** 的開發者想將 AZD 用於 AI 工作負載
- **主要挑戰**：多服務部署、認證管理、上線準備  
- **最常被要求**：AI 專屬範本、疑難排解指南、最佳實務

**加入我們的社群以：**
- 分享你的 AZD + AI 經驗並獲得協助
- 搶先取得新的 AI 範本預覽
- 為 AI 部署最佳實務做出貢獻
- 影響未來 AI + AZD 功能的開發

### 參與課程貢獻
我們歡迎貢獻！詳細資訊請閱讀我們的 [貢獻指南](CONTRIBUTING.md) 以取得說明：
- **內容改進**：強化現有章節與範例
- **新增範例**：加入真實世界場景與範本  
- **翻譯**：協助維護多語系支援
- **錯誤回報**：提升準確度與清晰度
- **社群準則**：遵守我們的包容性社群準則

---

## 📄 課程資訊

### 授權
本專案採用 MIT 授權 - 詳情請見 [LICENSE](../../LICENSE) 檔案。

### 相關的 Microsoft 學習資源

我們團隊也製作其他完整的學習課程：

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j 初學者](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js 初學者](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

---

### Azure / Edge / MCP / Agents
[![AZD 初學者](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI 初學者](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP 初學者](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents 初學者](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### 生成式 AI 系列
[![生成式 AI 初學者](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### 核心學習
[![機器學習 初學者](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![資料科學 初學者](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI 入門](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![資安入門](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![網頁開發入門](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![物聯網入門](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR 開發入門](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot 系列
[![Copilot：AI 結對程式設計](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot：C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot 冒險](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ 課程導覽

**🚀 準備好開始學習了嗎？**

**初學者**：從 [第 1 章：基礎與快速上手](../..)  
**AI 開發者**：跳至 [第 2 章：以 AI 為先的開發](../..)  
**有經驗的開發者**：從 [第 3 章：設定與驗證](../..)

**下一步**： [開始第 1 章 - AZD 基礎](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不準確之處。原文應視為具權威性的來源。若為關鍵性資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或錯誤詮釋負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->