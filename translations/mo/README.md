<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee9a026a572535444287d531dbd75d78",
  "translation_date": "2025-09-12T18:42:39+00:00",
  "source_file": "README.md",
  "language_code": "mo"
}
-->
# AZD 初學者指南

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.mo.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)  
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)  
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)  

![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)  

![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)  

按照以下步驟開始使用這些資源：  
1. **Fork 此儲存庫**：點擊 [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)  
2. **Clone 此儲存庫**：`git clone https://github.com/microsoft/azd-for-beginners.git`  
3. [**加入 Azure Discord 社群，與專家和其他開發者交流**](https://discord.com/invite/ByRwuEEgH4)  

### 多語言支援

#### 透過 GitHub Action 支援（自動化且始終保持最新）

[法文](../fr/README.md) | [西班牙文](../es/README.md) | [德文](../de/README.md) | [俄文](../ru/README.md) | [阿拉伯文](../ar/README.md) | [波斯文（法爾西）](../fa/README.md) | [烏爾都文](../ur/README.md) | [中文（簡體）](../zh/README.md) | [中文（繁體，澳門）](./README.md) | [中文（繁體，香港）](../hk/README.md) | [中文（繁體，台灣）](../tw/README.md) | [日文](../ja/README.md) | [韓文](../ko/README.md) | [印地文](../hi/README.md) | [孟加拉文](../bn/README.md) | [馬拉地文](../mr/README.md) | [尼泊爾文](../ne/README.md) | [旁遮普文（古木基文）](../pa/README.md) | [葡萄牙文（葡萄牙）](../pt/README.md) | [葡萄牙文（巴西）](../br/README.md) | [義大利文](../it/README.md) | [波蘭文](../pl/README.md) | [土耳其文](../tr/README.md) | [希臘文](../el/README.md) | [泰文](../th/README.md) | [瑞典文](../sv/README.md) | [丹麥文](../da/README.md) | [挪威文](../no/README.md) | [芬蘭文](../fi/README.md) | [荷蘭文](../nl/README.md) | [希伯來文](../he/README.md) | [越南文](../vi/README.md) | [印尼文](../id/README.md) | [馬來文](../ms/README.md) | [塔加洛文（菲律賓文）](../tl/README.md) | [斯瓦希里文](../sw/README.md) | [匈牙利文](../hu/README.md) | [捷克文](../cs/README.md) | [斯洛伐克文](../sk/README.md) | [羅馬尼亞文](../ro/README.md) | [保加利亞文](../bg/README.md) | [塞爾維亞文（西里爾文）](../sr/README.md) | [克羅埃西亞文](../hr/README.md) | [斯洛文尼亞文](../sl/README.md) | [烏克蘭文](../uk/README.md) | [緬甸文（緬甸）](../my/README.md)  

**如果您希望支援其他翻譯語言，請參考 [此處](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**  

## 簡介

歡迎來到 Azure Developer CLI (azd) 的完整指南。本儲存庫旨在幫助各層級的開發者，從學生到專業開發者，學習並掌握 Azure Developer CLI，以便高效進行雲端部署，**特別是針對使用 Azure AI Foundry 的 AI 應用程式部署**。此結構化學習資源提供 Azure 雲端部署的實作經驗、常見問題的排解，以及成功部署 AZD 範本的最佳實踐。

### **為什麼這份指南對 AI 開發者很重要**
根據我們最近在 Azure AI Foundry Discord 社群的調查，**45% 的開發者有興趣使用 AZD 進行 AI 工作負載**，但面臨以下挑戰：
- 複雜的多服務 AI 架構  
- 生產環境 AI 部署的最佳實踐  
- Azure AI 服務的整合與配置  
- AI 工作負載的成本優化  
- AI 特定部署問題的排解  

## 學習目標

透過學習本儲存庫，您將能夠：  
- 掌握 Azure Developer CLI 的基礎知識和核心概念  
- 學習如何使用基礎架構即程式碼部署和配置 Azure 資源  
- 培養排解常見 AZD 部署問題的技能  
- 了解部署前的驗證和容量規劃  
- 實施安全性最佳實踐和成本優化策略  
- 建立信心，能夠將生產就緒的應用程式部署到 Azure  

## 學習成果

完成本課程後，您將能夠：  
- 成功安裝、配置並使用 Azure Developer CLI  
- 使用 AZD 範本創建並部署應用程式  
- 排解身份驗證、基礎架構和部署問題  
- 執行部署前檢查，包括容量規劃和 SKU 選擇  
- 實施監控、安全性和成本管理的最佳實踐  
- 將 AZD 工作流程整合到 CI/CD 管道中  

## 目錄

- [什麼是 Azure Developer CLI？](../..)  
- [快速入門](../..)  
- [學習路徑](../..)  
  - [AI 開發者（建議從這裡開始！）](../..)  
  - [學生與初學者](../..)  
  - [開發者](../..)  
  - [DevOps 工程師](../..)  
- [文件](../..)  
  - [入門指南](../..)  
  - [部署與配置](../..)  
  - [部署前檢查](../..)  
  - [AI 與 Azure AI Foundry](../..)  
  - [排解問題](../..)  
- [範例與範本](../..)  
  - [精選：Azure AI Foundry 範本](../..)  
  - [精選：Azure AI Foundry E2E 案例](../..)  
  - [其他 AZD 範本](../..)  
  - [實作實驗室與工作坊](../..)  
- [資源](../..)  
- [貢獻](../..)  
- [支援](../..)  
- [社群](../..)  

## 什麼是 Azure Developer CLI？

Azure Developer CLI (azd) 是一個以開發者為中心的命令列介面，能加速應用程式在 Azure 上的建置與部署過程。它提供：  

- **基於範本的部署** - 使用預建範本來實現常見的應用程式模式  
- **基礎架構即程式碼** - 使用 Bicep 或 Terraform 管理 Azure 資源  
- **整合工作流程** - 無縫配置、部署和監控應用程式  
- **友好的開發者體驗** - 專為提升開發者生產力和使用體驗而設計  

### **AZD + Azure AI Foundry：AI 部署的完美搭配**

**為什麼選擇 AZD 進行 AI 解決方案？** AZD 解決了 AI 開發者面臨的主要挑戰：  

- **AI 就緒範本** - 預配置範本，支援 Azure OpenAI、認知服務和 ML 工作負載  
- **安全的 AI 部署** - 內建安全模式，保護 AI 服務、API 金鑰和模型端點  
- **生產 AI 模式** - 可擴展且具成本效益的 AI 應用程式部署最佳實踐  
- **端到端 AI 工作流程** - 從模型開發到生產部署，並提供適當的監控  
- **成本優化** - 智能資源分配和擴展策略，適用於 AI 工作負載  
- **Azure AI Foundry 整合** - 與 AI Foundry 模型目錄和端點無縫連接  

## 快速入門

### 先決條件  
- Azure 訂閱  
- 已安裝 Azure CLI  
- Git（用於克隆範本）  

### 安裝  
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```  

### 您的第一次部署  
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```  

### 您的第一次 AI 部署  
```bash
# Initialize an AI-powered chat application with Azure OpenAI
azd init --template azure-search-openai-demo

# Configure AI services and deploy
azd up

# Or try other AI templates:
azd init --template openai-chat-app-quickstart
azd init --template ai-document-processing
azd init --template contoso-chat
```  

## 學習路徑

### AI 開發者（建議從這裡開始！）  
1. **快速入門**：嘗試 [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) 範本  
2. **學習基礎**：[AZD 基礎知識](docs/getting-started/azd-basics.md) + [Azure AI Foundry 整合](docs/ai-foundry/azure-ai-foundry-integration.md)  
3. **實作練習**：完成 [AI 工作坊實驗室](docs/ai-foundry/ai-workshop-lab.md)  
4. **生產就緒**：檢視 [生產 AI 最佳實踐](docs/ai-foundry/production-ai-practices.md)  
5. **進階**：部署 [contoso-chat](https://github.com/Azure-Samples/contoso-chat) 企業範本  

### 學生與初學者  
1. 從 [AZD 基礎知識](docs/getting-started/azd-basics.md) 開始  
2. 參考 [安裝指南](docs/getting-started/installation.md)  
3. 完成 [您的第一個專案](docs/getting-started/first-project.md)  
4. 練習 [簡單 Web 應用程式範例](../../examples/simple-web-app)  

### 開發者  
1. 檢視 [配置指南](docs/getting-started/configuration.md)  
2. 學習 [部署指南](docs/deployment/deployment-guide.md)  
3. 完成 [資料庫應用程式範例](../../examples/database-app)  
4. 探索 [容器應用程式範例](../../examples/container-app)  

### DevOps 工程師  
1. 掌握 [資源配置](docs/deployment/provisioning.md)  
2. 實施 [部署前檢查](docs/pre-deployment/preflight-checks.md)  
3. 練習 [容量規劃](docs/pre-deployment/capacity-planning.md)  
4. 進階 [微服務範例](../../examples/microservices)  

## 文件

### 入門指南  
- [**AZD 基礎知識**](docs/getting-started/azd-basics.md) - 核心概念與術語  
- [**安裝與設置**](docs/getting-started/installation.md) - 平台特定的安裝指南  
- [**配置**](docs/getting-started/configuration.md) - 環境設置與身份驗證  
- [**您的第一個專案**](docs/getting-started/first-project.md) - 步驟教學  

### 部署與配置  
- [**部署指南**](docs/deployment/deployment-guide.md) - 完整的部署工作流程  
- [**資源配置**](docs/deployment/provisioning.md) - Azure 資源管理  

### 部署前檢查  
- [**容量規劃**](docs/pre-deployment/capacity-planning.md) - Azure 資源容量驗證  
- [**SKU 選擇**](docs/pre-deployment/sku-selection.md) - 選擇合適的 Azure SKU  
- [**部署前檢查**](docs/pre-deployment/preflight-checks.md) - 自動化驗證腳本  

### AI 與 Azure AI Foundry  
- [**Azure AI Foundry 整合**](docs/ai-foundry/azure-ai-foundry-integration.md) - 將 AZD 與 Azure AI Foundry 服務連接  
- [**AI 模型部署模式**](docs/ai-foundry/ai-model-deployment.md) - 使用 AZD 部署和管理 AI 模型  
- [**AI 工作坊實驗室**](docs/ai-foundry/ai-workshop-lab.md) - 實作實驗室：讓 AI 解決方案 AZD 就緒  
- [**生產 AI 最佳實踐**](docs/ai-foundry/production-ai-practices.md) - AI 工作負載的安全性、擴展和監控  

### 排解問題  
- [**常見問題**](docs/troubleshooting/common-issues.md) - 常見問題及解決方案  
- [**除錯指南**](docs/troubleshooting/debugging.md) - 步驟式除錯策略  
- [**AI 特定問題排解**](docs/troubleshooting/ai-troubleshooting.md) - AI 服務與模型部署問題  

## 範例與模板  

### [精選：Azure AI Foundry 模板](https://ai.azure.com/resource/build/templates)  
**如果您正在部署 AI 應用程式，請從這裡開始！**  

| 模板 | 描述 | 複雜度 | 服務 |  
|----------|-------------|------------|----------|  
| [**開始使用 AI 聊天**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 使用 Azure Container Apps 建立並部署整合您的資料與遙測洞察的基本聊天應用程式 |⭐⭐ | AzureOpenAI + Azure AI 模型推理 API + Azure AI 搜尋 + Azure Container Apps + 應用程式洞察 |  
| [**開始使用 AI 代理**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 使用 Azure Container Apps 建立並部署具有動作與遙測洞察的基本代理應用程式 |⭐⭐ | Azure AI 代理服務 + AzureOpenAI + Azure AI 搜尋 + Azure Container Apps + 應用程式洞察 |  
| [**多代理工作流程自動化**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 透過協調與管理一組 AI 代理來增強任務規劃與自動化 |⭐⭐⭐ | AzureOpenAI + Azure AI 代理服務 + Semantic Kernel + Azure CosmosDB + Azure Container Apps |  
| [**從您的資料生成文件**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 加速生成合同、發票和投資提案等文件，透過尋找並摘要您的資料中的相關資訊 |⭐⭐⭐ | AzureOpenAI + Azure AI 搜尋 + Azure AI 服務 + Azure CosmosDB |  
| [**使用代理改善客戶會議**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 利用一組代理將舊版代碼遷移到現代語言 |⭐⭐⭐ | AzureOpenAI + Azure AI 搜尋 + Azure CosmosDB + Azure SQL Database |  
| [**使用代理現代化您的代碼**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 使用 Azure Container Apps 建立並部署整合您的資料與遙測洞察的基本聊天應用程式 |⭐⭐⭐ | AzureOpenAI + Azure 代理服務 + Semantic Kernel + Azure CosmosDB + Azure Container Apps |  
| [**建立您的對話代理**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 利用高級對話理解，創建並增強具有確定性和人類可控工作流程的聊天機器人和代理 |⭐⭐⭐ | AI Language + AzureOpenAI + AI 搜尋 + Azure Storage + Azure Container Registry |  
| [**從對話數據中解鎖洞察**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 使用高級內容理解功能，從大量音頻和文本數據集中發掘洞察，提升聯絡中心效率 |⭐⭐⭐ | AzureOpenAI + AI 搜尋 + Semantic Kernel + Azure 代理服務 + AI AI 內容理解 |  
| [**多模態內容處理**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 快速準確地處理索賠、發票、合同和其他文件，從非結構化內容中提取信息並映射到結構化格式。此模板支持文本、圖像、表格和圖形 |⭐⭐⭐⭐ | AzureOpenAI + Azure 內容理解 + Azure CosmosDB + Azure Container Apps |  

### 精選：Azure AI Foundry 端到端場景  
**如果您正在部署 AI 應用程式，請從這裡開始！**  

| 模板 | 描述 | 複雜度 | 服務 |  
|----------|-------------|------------|----------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 使用 Azure OpenAI 的簡單聊天介面 | ⭐ | AzureOpenAI + Container Apps |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 支援 RAG 的聊天應用程式，使用 Azure OpenAI | ⭐⭐ | AzureOpenAI + 搜尋 + App Service |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 使用 AI 服務進行文件分析 | ⭐⭐ | Azure 文件智能 + Functions |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 具有函數調用功能的 AI 代理框架 | ⭐⭐⭐ | AzureOpenAI + Azure Container Apps + Functions |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 使用 AI 編排的企業聊天 | ⭐⭐⭐ | AzureOpenAI + Azure AI 搜尋 + Container Apps |  

### 其他 AZD 模板  
- [**範例目錄**](examples/README.md) - 實用範例、模板和真實場景  
- [**Azure-Samples AZD 模板**](https://github.com/Azure-Samples/azd-templates) - 微軟官方範例模板  
- [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) - 社群貢獻的模板  

### 實作實驗室與工作坊  
- [**AI 工作坊實驗室**](docs/ai-foundry/ai-workshop-lab.md) - **新**：讓您的 AI 解決方案可 AZD 部署  
- [**AZD 初學者工作坊**](workshop/README.md) - 專注於 AI 代理 AZD 模板部署  

## 資源  

### 快速參考  
- [**指令速查表**](resources/cheat-sheet.md) - 必備 azd 指令  
- [**術語表**](resources/glossary.md) - Azure 和 azd 術語  
- [**常見問題**](resources/faq.md) - 常見問題解答  
- [**學習指南**](resources/study-guide.md) - 全面的學習目標和練習題  

### 外部資源  
- [Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure 價格計算器](https://azure.microsoft.com/pricing/calculator/)  
- [Azure 狀態](https://status.azure.com/)  

## 貢獻  

我們歡迎貢獻！請閱讀我們的 [貢獻指南](CONTRIBUTING.md)，了解以下內容：  
- 如何提交問題和功能請求  
- 代碼貢獻指南  
- 文件改進  
- 社群標準  

## 支援  

- **問題**：[回報錯誤和請求功能](https://github.com/microsoft/azd-for-beginners/issues)  
- **討論**：[微軟 Azure Discord 社群問答與討論](https://discord.gg/microsoft-azure)  
- **AI 特定支援**：加入 [#Azure 頻道](https://discord.gg/microsoft-azure) 進行 AZD + AI Foundry 討論  
- **電子郵件**：針對私人詢問  
- **微軟學習**：[官方 Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

### Azure AI Foundry Discord 社群洞察  

**#Azure 頻道的投票結果：**  
- **45%** 的開發者希望使用 AZD 處理 AI 工作負載  
- **主要挑戰**：多服務部署、憑證管理、生產準備  
- **最受歡迎**：AI 特定模板、問題排解指南、最佳實踐  

**加入我們的社群以：**  
- 分享您的 AZD + AI 經驗並獲得幫助  
- 獲取新 AI 模板的早期預覽  
- 貢獻 AI 部署最佳實踐  
- 影響未來 AI + AZD 功能開發  

## 授權  

此專案依 MIT 授權條款授權 - 詳情請參閱 [LICENSE](../../LICENSE) 文件。  

## 其他課程  

我們的團隊還製作其他課程！請查看：  

- [**新** 初學者的模型上下文協議 (MCP)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [初學者的 AI 代理](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [使用 .NET 的初學者生成式 AI](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
- [初學者生成式 AI](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [使用 Java 的初學者生成式 AI](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
- [初學者的機器學習](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
- [初學者的數據科學](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
- [初學者的 AI](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
- [初學者的網絡安全](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)  
- [初學者的 Web 開發](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
- [初學者的物聯網](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
- [初學者的 XR 開發](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [掌握 GitHub Copilot 用於 AI 配對編程](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
- [掌握 GitHub Copilot 用於 C#/.NET 開發者](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
- [選擇您的 Copilot 冒險](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  

---

**導航**  
- **下一課**：[AZD 基礎](docs/getting-started/azd-basics.md)  

---

**免責聲明**：  
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們努力確保翻譯的準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於關鍵信息，建議使用專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或誤釋不承擔責任。