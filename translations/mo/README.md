<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "21dcf6a2d8a223a853d965138d4fb045",
  "translation_date": "2025-09-17T18:51:20+00:00",
  "source_file": "README.md",
  "language_code": "mo"
}
-->
# AZD 初學者指南：系統化學習旅程

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.mo.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

## 開始學習本課程

按照以下步驟開始您的 AZD 學習旅程：

1. **Fork 儲存庫**：點擊 [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone 儲存庫**：`git clone https://github.com/microsoft/azd-for-beginners.git`
3. **加入社群**：[Azure Discord 社群](https://discord.com/invite/ByRwuEEgH4) 獲取專家支援
4. **選擇學習路徑**：根據您的經驗水平選擇以下章節

### 多語言支援

#### 自動翻譯（保持最新）

[法文](../fr/README.md) | [西班牙文](../es/README.md) | [德文](../de/README.md) | [俄文](../ru/README.md) | [阿拉伯文](../ar/README.md) | [波斯文（法爾西）](../fa/README.md) | [烏爾都文](../ur/README.md) | [中文（簡體）](../zh/README.md) | [中文（繁體，澳門）](./README.md) | [中文（繁體，香港）](../hk/README.md) | [中文（繁體，台灣）](../tw/README.md) | [日文](../ja/README.md) | [韓文](../ko/README.md) | [印地文](../hi/README.md) | [孟加拉文](../bn/README.md) | [馬拉地文](../mr/README.md) | [尼泊爾文](../ne/README.md) | [旁遮普文（古木基文）](../pa/README.md) | [葡萄牙文（葡萄牙）](../pt/README.md) | [葡萄牙文（巴西）](../br/README.md) | [意大利文](../it/README.md) | [波蘭文](../pl/README.md) | [土耳其文](../tr/README.md) | [希臘文](../el/README.md) | [泰文](../th/README.md) | [瑞典文](../sv/README.md) | [丹麥文](../da/README.md) | [挪威文](../no/README.md) | [芬蘭文](../fi/README.md) | [荷蘭文](../nl/README.md) | [希伯來文](../he/README.md) | [越南文](../vi/README.md) | [印尼文](../id/README.md) | [馬來文](../ms/README.md) | [塔加洛文（菲律賓文）](../tl/README.md) | [斯瓦希里文](../sw/README.md) | [匈牙利文](../hu/README.md) | [捷克文](../cs/README.md) | [斯洛伐克文](../sk/README.md) | [羅馬尼亞文](../ro/README.md) | [保加利亞文](../bg/README.md) | [塞爾維亞文（西里爾文）](../sr/README.md) | [克羅埃西亞文](../hr/README.md) | [斯洛文尼亞文](../sl/README.md) | [烏克蘭文](../uk/README.md) | [緬甸文（緬甸）](../my/README.md)

## 課程概述

透過系統化章節學習 Azure Developer CLI (azd)，逐步掌握技能。**特別聚焦於整合 Azure AI Foundry 的 AI 應用程式部署。**

### 為什麼這門課程對現代開發者至關重要

根據 Azure AI Foundry Discord 社群的洞察，**45% 的開發者希望使用 AZD 進行 AI 工作負載**，但面臨以下挑戰：
- 複雜的多服務 AI 架構
- AI 部署的最佳實踐  
- Azure AI 服務的整合與配置
- AI 工作負載的成本優化
- AI 部署特定問題的故障排除

### 學習目標

完成本課程後，您將能夠：
- **掌握 AZD 基礎**：核心概念、安裝與配置
- **部署 AI 應用程式**：使用 AZD 整合 Azure AI Foundry 服務
- **實現基礎設施即代碼**：使用 Bicep 模板管理 Azure 資源
- **故障排除部署問題**：解決常見問題並進行調試
- **優化生產環境**：安全性、擴展性、監控與成本管理
- **構建多代理解決方案**：部署複雜的 AI 架構

## 📚 學習章節

*根據您的經驗水平和目標選擇學習路徑*

### 🚀 第 1 章：基礎與快速入門
**先決條件**：Azure 訂閱、基本命令行知識  
**時長**：30-45 分鐘  
**難度**：⭐

#### 您將學到的內容
- 理解 Azure Developer CLI 的基礎知識
- 在您的平台上安裝 AZD
- 完成首次成功部署

#### 學習資源
- **🎯 從這裡開始**：[什麼是 Azure Developer CLI？](../..)
- **📖 理論**：[AZD 基礎知識](docs/getting-started/azd-basics.md) - 核心概念與術語
- **⚙️ 設置**：[安裝與設置](docs/getting-started/installation.md) - 平台特定指南
- **🛠️ 實踐**：[您的第一個專案](docs/getting-started/first-project.md) - 步驟指南
- **📋 快速參考**：[命令速查表](resources/cheat-sheet.md)

#### 實踐練習
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 本章成果**：使用 AZD 成功部署一個簡單的 Web 應用程式到 Azure

---

### 🤖 第 2 章：以 AI 為核心的開發（推薦給 AI 開發者）
**先決條件**：完成第 1 章  
**時長**：1-2 小時  
**難度**：⭐⭐

#### 您將學到的內容
- AZD 與 Azure AI Foundry 的整合
- 部署 AI 驅動的應用程式
- 理解 AI 服務配置

#### 學習資源
- **🎯 從這裡開始**：[Azure AI Foundry 整合](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 模式**：[AI 模型部署](docs/ai-foundry/ai-model-deployment.md) - 部署與管理 AI 模型
- **🛠️ 工作坊**：[AI 工作坊實驗室](docs/ai-foundry/ai-workshop-lab.md) - 讓您的 AI 解決方案適配 AZD
- **📋 模板**：[Azure AI Foundry 模板](../..)

#### 實踐練習
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 本章成果**：部署並配置一個具備 RAG 功能的 AI 驅動聊天應用程式

---

### ⚙️ 第 3 章：配置與身份驗證
**先決條件**：完成第 1 章  
**時長**：45-60 分鐘  
**難度**：⭐⭐

#### 您將學到的內容
- 環境配置與管理
- 身份驗證與安全性最佳實踐
- 資源命名與組織

#### 學習資源
- **📖 配置**：[配置指南](docs/getting-started/configuration.md) - 環境設置
- **🔐 安全性**：身份驗證模式與托管身份
- **📝 範例**：[資料庫應用範例](../../examples/database-app) - 配置模式

#### 實踐練習
- 配置多個環境（開發、測試、正式）
- 設置托管身份驗證
- 實現環境特定配置

**💡 本章成果**：使用正確的身份驗證與安全性管理多個環境

---

### 🏗️ 第 4 章：基礎設施即代碼與部署
**先決條件**：完成第 1-3 章  
**時長**：1-1.5 小時  
**難度**：⭐⭐⭐

#### 您將學到的內容
- 高級部署模式
- 使用 Bicep 的基礎設施即代碼
- 資源配置策略

#### 學習資源
- **📖 部署**：[部署指南](docs/deployment/deployment-guide.md) - 完整工作流程
- **🏗️ 配置**：[資源配置](docs/deployment/provisioning.md) - Azure 資源管理
- **📝 範例**：[容器應用範例](../../examples/container-app) - 容器化部署

#### 實踐練習
- 創建自定義 Bicep 模板
- 部署多服務應用程式
- 實現藍綠部署策略

**💡 本章成果**：使用自定義基礎設施模板部署複雜的多服務應用程式

---

### 🎯 第 5 章：多代理 AI 解決方案（進階）
**先決條件**：完成第 1-2 章  
**時長**：2-3 小時  
**難度**：⭐⭐⭐⭐

#### 您將學到的內容
- 多代理架構模式
- 代理協調與管理
- 生產就緒的 AI 部署

#### 學習資源
- **🤖 精選專案**：[零售多代理解決方案](examples/retail-scenario.md) - 完整實現
- **🛠️ ARM 模板**：[ARM 模板包](../../examples/retail-multiagent-arm-template) - 一鍵部署
- **📖 架構**：多代理協調模式

#### 實踐練習
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 本章成果**：部署並管理一個生產就緒的多代理 AI 解決方案，包含客戶與庫存代理

---

### 🔍 第 6 章：部署前驗證與規劃
**先決條件**：完成第 4 章  
**時長**：1 小時  
**難度**：⭐⭐

#### 您將學到的內容
- 容量規劃與資源驗證
- SKU 選擇策略
- 預檢查與自動化

#### 學習資源
- **📊 規劃**：[容量規劃](docs/pre-deployment/capacity-planning.md) - 資源驗證
- **💰 選擇**：[SKU 選擇](docs/pre-deployment/sku-selection.md) - 成本效益選擇
- **✅ 驗證**：[預檢查](docs/pre-deployment/preflight-checks.md) - 自動化腳本

#### 實踐練習
- 執行容量驗證腳本
- 優化 SKU 選擇以降低成本
- 實現自動化部署前檢查

**💡 本章成果**：在執行部署前進行驗證與優化

---

### 🚨 第 7 章：故障排除與調試
**先決條件**：完成任意部署章節  
**時長**：1-1.5 小時  
**難度**：⭐⭐

#### 您將學到的內容
- 系統化調試方法
- 常見問題與解決方案
- AI 特定故障排除

#### 學習資源
- **🔧 常見問題**：[常見問題](docs/troubleshooting/common-issues.md) - FAQ 與解決方案
- **🕵️ 調試**：[調試指南](docs/troubleshooting/debugging.md) - 步驟策略
- **🤖 AI 問題**：[AI 特定故障排除](docs/troubleshooting/ai-troubleshooting.md) - AI 服務問題

#### 實踐練習
- 診斷部署失敗
- 解決身份驗證問題
- 調試 AI 服務連接問題

**💡 本章成果**：獨立診斷並解決常見部署問題

---

### 🏢 第 8 章：生產與企業模式
**先決條件**：完成第 1-4 章  
**時長**：2-3 小時  
**難度**：⭐⭐⭐⭐

#### 您將學到的內容
- 生產部署策略
- 企業安全模式
- 監控與成本優化

#### 學習資源
- **🏭 生產**：[生產 AI 最佳實踐](docs/ai-foundry/production-ai-practices.md) - 企業模式
- **📝 範例**：[微服務範例](../../examples/microservices) - 複雜架構
- **📊 監控**：Application Insights 整合

#### 實作練習
- 實現企業級安全模式
- 設置全面的監控
- 在具備適當治理的情況下部署至生產環境

**💡 章節成果**：部署具備完整生產能力的企業級應用程式

---

## 📖 什麼是 Azure Developer CLI？

Azure Developer CLI (azd) 是一個以開發者為中心的命令列介面，能加速在 Azure 上建置和部署應用程式的過程。它提供以下功能：

- **基於範本的部署** - 使用預建範本來應對常見的應用程式模式
- **基礎架構即程式碼** - 使用 Bicep 或 Terraform 管理 Azure 資源  
- **整合式工作流程** - 無縫地配置、部署和監控應用程式
- **友善開發者** - 專為提升開發者生產力和體驗而設計

### **AZD + Azure AI Foundry：AI 部署的完美搭配**

**為什麼選擇 AZD 來解決 AI 方案？** AZD 解決了 AI 開發者面臨的主要挑戰：

- **AI 專用範本** - 為 Azure OpenAI、Cognitive Services 和 ML 工作負載預先配置的範本
- **安全的 AI 部署** - 內建 AI 服務、API 金鑰和模型端點的安全模式  
- **生產級 AI 模式** - 可擴展且具成本效益的 AI 應用程式部署最佳實踐
- **端到端 AI 工作流程** - 從模型開發到生產部署，並具備適當的監控
- **成本優化** - 智慧資源分配和擴展策略，適用於 AI 工作負載
- **Azure AI Foundry 整合** - 無縫連接至 AI Foundry 模型目錄和端點

---

## 🎯 範本與範例庫

### 精選：Azure AI Foundry 範本
**如果您正在部署 AI 應用程式，請從這裡開始！**

| 範本 | 章節 | 複雜度 | 服務 |
|----------|---------|------------|----------|
| [**開始使用 AI 聊天**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第 2 章 | ⭐⭐ | AzureOpenAI + Azure AI 模型推論 API + Azure AI 搜尋 + Azure Container Apps + Application Insights |
| [**開始使用 AI 代理**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第 2 章 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI 搜尋 + Azure Container Apps + Application Insights|
| [**多代理工作流程自動化**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第 5 章 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**從您的數據生成文件**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第 4 章 | ⭐⭐⭐  | AzureOpenAI + Azure AI 搜尋 + Azure AI 服務 + Azure CosmosDB|
| [**使用代理改善客戶會議**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第 5 章 | ⭐⭐⭐| AzureOpenAI + Azure AI 搜尋 + Azure CosmosDB + Azure SQL Database |
| [**使用代理現代化您的代碼**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第 5 章 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**構建您的對話代理**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第 4 章 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI 搜尋 + Azure Storage + Azure Container Registry|
| [**從對話數據中解鎖洞察**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第 8 章 | ⭐⭐⭐ | AzureOpenAI + AI 搜尋 + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**多模態內容處理**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第 8 章 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### 精選：完整學習場景
**生產就緒的應用程式範本，對應至學習章節**

| 範本 | 學習章節 | 複雜度 | 關鍵學習 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第 2 章 | ⭐ | 基本 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第 2 章 | ⭐⭐ | 使用 Azure AI 搜尋實現 RAG |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第 4 章 | ⭐⭐ | 文件智能整合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第 5 章 | ⭐⭐⭐ | 代理框架與函數調用 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第 8 章 | ⭐⭐⭐ | 企業 AI 編排 |
| [**零售多代理解決方案**](examples/retail-scenario.md) | 第 5 章 | ⭐⭐⭐⭐ | 客戶與庫存代理的多代理架構 |

### 按範例類型學習

#### 簡單應用程式（第 1-2 章）
- [簡單 Web 應用程式](../../examples/simple-web-app) - 基本部署模式
- [靜態網站](../../examples/static-site) - 靜態內容部署
- [基本 API](../../examples/basic-api) - REST API 部署

#### 數據庫整合（第 3-4 章）  
- [數據庫應用程式](../../examples/database-app) - 數據庫連接模式
- [數據處理](../../examples/data-processing) - ETL 工作流程部署

#### 高級模式（第 4-8 章）
- [容器應用程式](../../examples/container-app) - 容器化部署
- [微服務](../../examples/microservices) - 多服務架構  
- [企業解決方案](../../examples/enterprise) - 生產就緒模式

### 外部範本集合
- [**Azure-Samples AZD 範本**](https://github.com/Azure-Samples/azd-templates) - 微軟官方範例
- [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) - 社群貢獻範本
- [**範例目錄**](examples/README.md) - 本地學習範例，附詳細說明

---

## 📚 學習資源與參考

### 快速參考
- [**命令速查表**](resources/cheat-sheet.md) - 按章節整理的必備 azd 命令
- [**術語表**](resources/glossary.md) - Azure 和 azd 專有名詞  
- [**常見問題**](resources/faq.md) - 按學習章節整理的常見問題
- [**學習指南**](resources/study-guide.md) - 全面的實作練習

### 實作工作坊
- [**AI 工作坊實驗室**](docs/ai-foundry/ai-workshop-lab.md) - 讓您的 AI 解決方案可用 AZD 部署
- [**AZD 初學者工作坊**](workshop/README.md) - 完整的實作工作坊材料

### 外部學習資源
- [Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 價格計算器](https://azure.microsoft.com/pricing/calculator/)
- [Azure 狀態](https://status.azure.com/)

---

## 🎓 課程完成與認證

### 進度追蹤
透過每章節追蹤您的學習進度：

- [ ] **第 1 章**：基礎與快速入門 ✅
- [ ] **第 2 章**：AI 優先開發 ✅  
- [ ] **第 3 章**：配置與身份驗證 ✅
- [ ] **第 4 章**：基礎架構即程式碼與部署 ✅
- [ ] **第 5 章**：多代理 AI 解決方案 ✅
- [ ] **第 6 章**：部署前驗證與規劃 ✅
- [ ] **第 7 章**：故障排除與除錯 ✅
- [ ] **第 8 章**：生產與企業模式 ✅

### 學習驗證
完成每章節後，驗證您的知識：
1. **實作練習**：完成章節的實作部署
2. **知識檢查**：檢閱該章節的常見問題部分
3. **社群討論**：在 Azure Discord 分享您的經驗
4. **下一章節**：進入下一個複雜度層級

### 課程完成的好處
完成所有章節後，您將擁有：
- **生產經驗**：在 Azure 上部署真實的 AI 應用程式
- **專業技能**：企業級部署能力  
- **社群認可**：成為 Azure 開發者社群的活躍成員
- **職業提升**：具備 AZD 和 AI 部署的熱門技能

---

## 🤝 社群與支援

### 獲得幫助與支援
- **技術問題**：[回報錯誤與請求功能](https://github.com/microsoft/azd-for-beginners/issues)
- **學習問題**：[微軟 Azure Discord 社群](https://discord.gg/microsoft-azure)
- **AI 專屬幫助**：加入 [#Azure 頻道](https://discord.gg/microsoft-azure) 討論 AZD + AI Foundry
- **文件**：[官方 Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Azure AI Foundry Discord 社群洞察

**來自 #Azure 頻道的最新投票結果：**
- **45%** 的開發者希望使用 AZD 處理 AI 工作負載
- **主要挑戰**：多服務部署、憑證管理、生產就緒  
- **最受歡迎**：AI 專屬範本、故障排除指南、最佳實踐

**加入我們的社群以：**
- 分享您的 AZD + AI 經驗並獲得幫助
- 獲取新 AI 範本的早期預覽
- 貢獻 AI 部署最佳實踐
- 影響未來 AI + AZD 功能開發

### 為課程做出貢獻
我們歡迎您的貢獻！請閱讀 [貢獻指南](CONTRIBUTING.md) 了解詳細資訊：
- **內容改進**：增強現有章節和範例
- **新增範例**：添加真實場景和範本  
- **翻譯**：協助維護多語言支持
- **錯誤回報**：提升準確性和清晰度
- **社群標準**：遵循我們的包容性社群指南

---

## 📄 課程資訊

### 授權
此專案依 MIT 授權條款授權 - 詳情請參閱 [LICENSE](../../LICENSE) 文件。

### 微軟相關學習資源

我們的團隊還提供其他全面的學習課程：

- [**NEW** 初學者的模型上下文協議 (MCP)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [初學者的 AI 代理](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [使用 .NET 的生成式 AI 初學者課程](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [生成式 AI 初學者課程](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [使用 Java 的生成式 AI 初學者課程](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [機器學習初學者課程](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [數據科學初學者課程](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI 初學者課程](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [網路安全初學者課程](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Web 開發初學者課程](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [物聯網初學者課程](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [XR 開發初學者課程](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [掌握 GitHub Copilot 的 AI 配對編程](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [掌握 GitHub Copilot 的 C#/.NET 開發](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [選擇您的 Copilot 冒險](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

## 🗺️ 課程導航

**🚀 準備開始學習？**

**初學者**：從 [第 1 章：基礎與快速入門](../..) 開始  
**AI 開發者**：跳至 [第 2 章：AI 優先開發](../..)
**有經驗的開發者**：從[第3章：配置與身份驗證](../..)開始

**下一步**：[開始第1章 - AZD 基礎](docs/getting-started/azd-basics.md) →

---

**免責聲明**：  
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們努力確保翻譯的準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。應以原始語言的文件作為權威來源。對於關鍵信息，建議尋求專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或錯誤解釋不承擔責任。