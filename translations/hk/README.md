<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "be5fd7bf2b02d878efdb442580d98d96",
  "translation_date": "2025-10-16T15:26:10+00:00",
  "source_file": "README.md",
  "language_code": "hk"
}
-->
# AZD 初學者指南：結構化學習旅程

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.hk.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

## 開始學習這門課程

按照以下步驟開始你的 AZD 學習旅程：

1. **Fork 此倉庫**：點擊 [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **克隆倉庫**：`git clone https://github.com/microsoft/azd-for-beginners.git`
3. **加入社群**：[Azure Discord 社群](https://discord.com/invite/ByRwuEEgH4) 獲取專家支持
4. **選擇你的學習路徑**：根據你的經驗水平選擇以下章節

### 多語言支持

#### 自動翻譯（始終保持最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[阿拉伯語](../ar/README.md) | [孟加拉語](../bn/README.md) | [保加利亞語](../bg/README.md) | [緬甸語](../my/README.md) | [中文（簡體）](../zh/README.md) | [中文（繁體，香港）](./README.md) | [中文（繁體，澳門）](../mo/README.md) | [中文（繁體，台灣）](../tw/README.md) | [克羅地亞語](../hr/README.md) | [捷克語](../cs/README.md) | [丹麥語](../da/README.md) | [荷蘭語](../nl/README.md) | [愛沙尼亞語](../et/README.md) | [芬蘭語](../fi/README.md) | [法語](../fr/README.md) | [德語](../de/README.md) | [希臘語](../el/README.md) | [希伯來語](../he/README.md) | [印地語](../hi/README.md) | [匈牙利語](../hu/README.md) | [印尼語](../id/README.md) | [意大利語](../it/README.md) | [日語](../ja/README.md) | [韓語](../ko/README.md) | [立陶宛語](../lt/README.md) | [馬來語](../ms/README.md) | [馬拉地語](../mr/README.md) | [尼泊爾語](../ne/README.md) | [挪威語](../no/README.md) | [波斯語](../fa/README.md) | [波蘭語](../pl/README.md) | [葡萄牙語（巴西）](../br/README.md) | [葡萄牙語（葡萄牙）](../pt/README.md) | [旁遮普語](../pa/README.md) | [羅馬尼亞語](../ro/README.md) | [俄語](../ru/README.md) | [塞爾維亞語（西里爾字母）](../sr/README.md) | [斯洛伐克語](../sk/README.md) | [斯洛文尼亞語](../sl/README.md) | [西班牙語](../es/README.md) | [斯瓦希里語](../sw/README.md) | [瑞典語](../sv/README.md) | [他加祿語（菲律賓語）](../tl/README.md) | [泰米爾語](../ta/README.md) | [泰語](../th/README.md) | [土耳其語](../tr/README.md) | [烏克蘭語](../uk/README.md) | [烏爾都語](../ur/README.md) | [越南語](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 課程概述

通過結構化章節學習掌握 Azure Developer CLI (azd)。**特別關注整合 Azure AI Foundry 的 AI 應用部署。**

### 為什麼這門課程對現代開發者至關重要

根據 Azure AI Foundry Discord 社群的洞察，**45% 的開發者希望使用 AZD 進行 AI 工作負載**，但面臨以下挑戰：
- 複雜的多服務 AI 架構
- 生產環境 AI 部署的最佳實踐  
- Azure AI 服務的整合與配置
- AI 工作負載的成本優化
- AI 特定部署問題的故障排除

### 學習目標

完成這門結構化課程後，你將能夠：
- **掌握 AZD 基礎知識**：核心概念、安裝和配置
- **部署 AI 應用**：使用 AZD 與 Azure AI Foundry 服務
- **實現基礎設施即代碼**：使用 Bicep 模板管理 Azure 資源
- **排除部署故障**：解決常見問題並進行調試
- **優化生產環境**：安全性、擴展性、監控和成本管理
- **構建多代理解決方案**：部署複雜的 AI 架構

## 📚 學習章節

*根據你的經驗水平和目標選擇學習路徑*

### 🚀 第一章：基礎與快速入門
**先決條件**：Azure 訂閱，基本命令行知識  
**時長**：30-45 分鐘  
**難度**：⭐

#### 你將學到什麼
- 理解 Azure Developer CLI 的基礎知識
- 在你的平台上安裝 AZD
- 第一次成功部署

#### 學習資源
- **🎯 從這裡開始**：[什麼是 Azure Developer CLI？](../..)
- **📖 理論**：[AZD 基礎知識](docs/getting-started/azd-basics.md) - 核心概念和術語
- **⚙️ 設置**：[安裝與設置](docs/getting-started/installation.md) - 平台特定指南
- **🛠️ 實踐**：[你的第一個項目](docs/getting-started/first-project.md) - 步驟教程
- **📋 快速參考**：[命令速查表](resources/cheat-sheet.md)

#### 實踐練習
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 本章成果**：使用 AZD 成功部署一個簡單的網頁應用到 Azure

---

### 🤖 第二章：以 AI 為中心的開發（推薦給 AI 開發者）
**先決條件**：完成第一章  
**時長**：1-2 小時  
**難度**：⭐⭐

#### 你將學到什麼
- AZD 與 Azure AI Foundry 的整合
- 部署 AI 驅動的應用
- 理解 AI 服務配置

#### 學習資源
- **🎯 從這裡開始**：[Azure AI Foundry 整合](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 模式**：[AI 模型部署](docs/ai-foundry/ai-model-deployment.md) - 部署和管理 AI 模型
- **🛠️ 工作坊**：[AI 工作坊實驗室](docs/ai-foundry/ai-workshop-lab.md) - 讓你的 AI 解決方案適配 AZD
- **🎥 互動指南**：[工作坊材料](workshop/README.md) - 使用 MkDocs * DevContainer 環境進行瀏覽器學習
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

**💡 本章成果**：部署並配置一個具備 RAG 功能的 AI 驅動聊天應用

---

### ⚙️ 第三章：配置與身份驗證
**先決條件**：完成第一章  
**時長**：45-60 分鐘  
**難度**：⭐⭐

#### 你將學到什麼
- 環境配置與管理
- 身份驗證與安全性最佳實踐
- 資源命名與組織

#### 學習資源
- **📖 配置**：[配置指南](docs/getting-started/configuration.md) - 環境設置
- **🔐 安全性**：身份驗證模式與托管身份
- **📝 示例**：[數據庫應用示例](../../examples/database-app) - 配置模式

#### 實踐練習
- 配置多個環境（開發、測試、正式）
- 設置托管身份驗證
- 實現環境特定配置

**💡 本章成果**：使用正確的身份驗證和安全性管理多個環境

---

### 🏗️ 第四章：基礎設施即代碼與部署
**先決條件**：完成第一至三章  
**時長**：1-1.5 小時  
**難度**：⭐⭐⭐

#### 你將學到什麼
- 高級部署模式
- 使用 Bicep 的基礎設施即代碼
- 資源配置策略

#### 學習資源
- **📖 部署**：[部署指南](docs/deployment/deployment-guide.md) - 完整工作流程
- **🏗️ 配置**：[資源配置](docs/deployment/provisioning.md) - Azure 資源管理
- **📝 示例**：[容器應用示例](../../examples/container-app) - 容器化部署

#### 實踐練習
- 創建自定義 Bicep 模板
- 部署多服務應用
- 實現藍綠部署策略

**💡 本章成果**：使用自定義基礎設施模板部署複雜的多服務應用

---

### 🎯 第五章：多代理 AI 解決方案（高級）
**先決條件**：完成第一至二章  
**時長**：2-3 小時  
**難度**：⭐⭐⭐⭐

#### 你將學到什麼
- 多代理架構模式
- 代理協調與管理
- 生產就緒的 AI 部署

#### 學習資源
- **🤖 精選項目**：[零售多代理解決方案](examples/retail-scenario.md) - 完整實現
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

**💡 本章成果**：部署並管理一個生產就緒的多代理 AI 解決方案，包括客戶和庫存代理

---

### 🔍 第六章：部署前驗證與規劃
**先決條件**：完成第四章  
**時長**：1 小時  
**難度**：⭐⭐

#### 你將學到什麼
- 容量規劃與資源驗證
- SKU 選擇策略
- 預檢查與自動化

#### 學習資源
- **📊 規劃**：[容量規劃](docs/pre-deployment/capacity-planning.md) - 資源驗證
- **💰 選擇**：[SKU 選擇](docs/pre-deployment/sku-selection.md) - 成本效益選擇
- **✅ 驗證**：[預檢查](docs/pre-deployment/preflight-checks.md) - 自動化腳本

#### 實踐練習
- 運行容量驗證腳本
- 優化 SKU 選擇以降低成本
- 實現自動化部署前檢查

**💡 本章成果**：在執行部署前進行驗證和優化

---

### 🚨 第七章：故障排除與調試
**先決條件**：完成任意部署章節  
**時長**：1-1.5 小時  
**難度**：⭐⭐

#### 你將學到什麼
- 系統化的調試方法
- 常見問題及解決方案
- AI 特定的故障排除

#### 學習資源
- **🔧 常見問題**：[常見問題](docs/troubleshooting/common-issues.md) - FAQ 和解決方案
- **🕵️ 調試**：[調試指南](docs/troubleshooting/debugging.md) - 步驟策略
- **🤖 AI 問題**：[AI 特定故障排除](docs/troubleshooting/ai-troubleshooting.md) - AI 服務問題

#### 實踐練習
- 診斷部署失敗
- 解決身份驗證問題
- 調試 AI 服務連接問題

**💡 本章成果**：能夠獨立診斷並解決常見的部署問題

---

### 🏢 第八章：生產與企業模式
**先決條件**：完成第一至四章  
**時長**：2-3 小時  

**複雜度**: ⭐⭐⭐⭐

#### 你將學到的內容
- 生產部署策略
- 企業安全模式
- 監控與成本優化

#### 學習資源
- **🏭 生產**: [生產 AI 最佳實踐](docs/ai-foundry/production-ai-practices.md) - 企業模式
- **📝 範例**: [微服務範例](../../examples/microservices) - 複雜架構
- **📊 監控**: Application Insights 整合

#### 實踐練習
- 實施企業安全模式
- 設置全面的監控
- 在適當的治理下部署到生產環境

**💡 章節成果**: 部署具備完整生產能力的企業級應用程式

---

## 🎓 工作坊概述：實踐學習體驗

### 互動式工作坊材料
**透過瀏覽器工具和指導練習進行全面的實踐學習**

我們的工作坊材料提供結構化的互動學習體驗，與上述章節式課程相輔相成。工作坊適合自學和講師指導的課程。

#### 🛠️ 工作坊特色
- **瀏覽器介面**: 完整的 MkDocs 驅動工作坊，具備搜尋、複製和主題功能
- **GitHub Codespaces 整合**: 一鍵設置開發環境
- **結構化學習路徑**: 七步指導練習（共 3.5 小時）
- **探索 → 部署 → 自訂**: 漸進式方法論
- **互動式 DevContainer 環境**: 預配置工具和依賴項

#### 📚 工作坊結構
工作坊遵循 **探索 → 部署 → 自訂** 方法論：

1. **探索階段**（45 分鐘）
   - 探索 Azure AI Foundry 模板和服務
   - 理解多代理架構模式
   - 審查部署需求和前置條件

2. **部署階段**（2 小時）
   - 實踐部署 AI 應用程式至 AZD
   - 配置 Azure AI 服務和端點
   - 實施安全和身份驗證模式

3. **自訂階段**（45 分鐘）
   - 修改應用程式以適應特定使用案例
   - 優化生產部署
   - 實施監控和成本管理

#### 🚀 開始工作坊
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 工作坊學習成果
完成工作坊後，參與者將能：
- **部署生產 AI 應用程式**: 使用 AZD 和 Azure AI Foundry 服務
- **掌握多代理架構**: 實施協調的 AI 代理解決方案
- **實施安全最佳實踐**: 配置身份驗證和訪問控制
- **優化規模化**: 設計具成本效益且高效的部署
- **排除部署問題**: 獨立解決常見問題

#### 📖 工作坊資源
- **🎥 互動指南**: [工作坊材料](workshop/README.md) - 瀏覽器學習環境
- **📋 分步指導**: [指導練習](../../workshop/docs/instructions) - 詳細操作步驟
- **🛠️ AI 工作坊實驗室**: [AI 工作坊實驗室](docs/ai-foundry/ai-workshop-lab.md) - 聚焦 AI 的練習
- **💡 快速入門**: [工作坊設置指南](workshop/README.md#quick-start) - 環境配置

**適合**: 企業培訓、大學課程、自學和開發者訓練營。

---

## 📖 什麼是 Azure Developer CLI？

Azure Developer CLI (azd) 是一個以開發者為中心的命令列介面，加速應用程式在 Azure 上的構建和部署過程。它提供：

- **基於模板的部署** - 使用預建模板進行常見應用模式
- **基礎架構即代碼** - 使用 Bicep 或 Terraform 管理 Azure 資源  
- **整合工作流程** - 無縫配置、部署和監控應用程式
- **開發者友好** - 專為提升開發者生產力和體驗而設計

### **AZD + Azure AI Foundry: AI 部署的完美搭配**

**為什麼選擇 AZD 用於 AI 解決方案？** AZD 解決了 AI 開發者面臨的主要挑戰：

- **AI 就緒模板** - 預配置模板適用於 Azure OpenAI、Cognitive Services 和 ML 工作負載
- **安全 AI 部署** - 內建 AI 服務、API 金鑰和模型端點的安全模式  
- **生產 AI 模式** - 可擴展且具成本效益的 AI 應用部署最佳實踐
- **端到端 AI 工作流程** - 從模型開發到生產部署，配備完善的監控
- **成本優化** - 智能資源分配和擴展策略適用於 AI 工作負載
- **Azure AI Foundry 整合** - 無縫連接 AI Foundry 模型目錄和端點

---

## 🎯 模板與範例庫

### 精選: Azure AI Foundry 模板
**如果你正在部署 AI 應用，從這裡開始！**

| 模板 | 章節 | 複雜度 | 服務 |
|----------|---------|------------|----------|
| [**開始 AI 聊天**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第 2 章 | ⭐⭐ | AzureOpenAI + Azure AI 模型推理 API + Azure AI 搜索 + Azure 容器應用 + Application Insights |
| [**開始 AI 代理**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第 2 章 | ⭐⭐ | Azure AI 代理服務 + AzureOpenAI + Azure AI 搜索 + Azure 容器應用 + Application Insights|
| [**多代理工作流程自動化**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第 5 章 | ⭐⭐⭐ | AzureOpenAI + Azure AI 代理服務 + Semantic Kernel + Azure CosmosDB + Azure 容器應用|
| [**從數據生成文檔**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第 4 章 | ⭐⭐⭐  | AzureOpenAI + Azure AI 搜索 + Azure AI 服務 + Azure CosmosDB|
| [**改善客戶會議的代理**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第 5 章 | ⭐⭐⭐| AzureOpenAI + Azure AI 搜索 + Azure CosmosDB + Azure SQL Database |
| [**用代理現代化你的代碼**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第 5 章 | ⭐⭐⭐ | AzureOpenAI + Azure 代理服務 + Semantic Kernel + Azure CosmosDB + Azure 容器應用|
| [**構建你的對話代理**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第 4 章 | ⭐⭐⭐ | AI 語言 + AzureOpenAI + AI 搜索 + Azure 存儲 + Azure 容器註冊表|
| [**從對話數據中解鎖洞察**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第 8 章 | ⭐⭐⭐ | AzureOpenAI + AI 搜索 + Semantic Kernel + Azure 代理服務 + AI AI 內容理解|
| [**多模態內容處理**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第 8 章 | ⭐⭐⭐⭐ | AzureOpenAI + Azure 內容理解 + Azure CosmosDB + Azure 容器應用|

### 精選: 完整學習場景
**生產就緒應用模板與學習章節對應**

| 模板 | 學習章節 | 複雜度 | 關鍵學習 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第 2 章 | ⭐ | 基本 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第 2 章 | ⭐⭐ | 使用 Azure AI 搜索的 RAG 實現 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第 4 章 | ⭐⭐ | 文檔智能整合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第 5 章 | ⭐⭐⭐ | 代理框架和函數調用 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第 8 章 | ⭐⭐⭐ | 企業 AI 編排 |
| [**零售多代理解決方案**](examples/retail-scenario.md) | 第 5 章 | ⭐⭐⭐⭐ | 客戶和庫存代理的多代理架構 |

### 按範例類型學習

#### 簡單應用（第 1-2 章）
- [簡單 Web 應用](../../examples/simple-web-app) - 基本部署模式
- [靜態網站](../../examples/static-site) - 靜態內容部署
- [基本 API](../../examples/basic-api) - REST API 部署

#### 數據庫整合（第 3-4 章）  
- [數據庫應用](../../examples/database-app) - 數據庫連接模式
- [數據處理](../../examples/data-processing) - ETL 工作流程部署

#### 高級模式（第 4-8 章）
- [容器應用](../../examples/container-app) - 容器化部署
- [微服務](../../examples/microservices) - 多服務架構  
- [企業解決方案](../../examples/enterprise) - 生產就緒模式

### 外部模板集合
- [**官方 AZD 模板庫**](https://azure.github.io/awesome-azd/) - 精選官方和社群模板
- [**Azure Developer CLI 模板**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 模板文檔
- [**範例目錄**](examples/README.md) - 本地學習範例，附詳細說明

---

## 📚 學習資源與參考

### 快速參考
- [**命令速查表**](resources/cheat-sheet.md) - 按章節整理的必備 azd 命令
- [**術語表**](resources/glossary.md) - Azure 和 azd 專有名詞  
- [**常見問題**](resources/faq.md) - 按學習章節整理的常見問題
- [**學習指南**](resources/study-guide.md) - 全面的練習題目

### 實踐工作坊
- [**AI 工作坊實驗室**](docs/ai-foundry/ai-workshop-lab.md) - 讓你的 AI 解決方案可用 AZD 部署（2-3 小時）
- [**互動式工作坊指南**](workshop/README.md) - 使用 MkDocs 和 DevContainer 環境的瀏覽器工作坊
- [**結構化學習路徑**](../../workshop/docs/instructions) - 七步指導練習（探索 → 部署 → 自訂）
- [**AZD 初學者工作坊**](workshop/README.md) - 完整的實踐工作坊材料，整合 GitHub Codespaces

### 外部學習資源
- [Azure Developer CLI 文檔](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 價格計算器](https://azure.microsoft.com/pricing/calculator/)
- [Azure 狀態](https://status.azure.com/)

---

## 🎓 課程完成與認證

### 進度追蹤
通過每章節追蹤你的學習進度：

- [ ] **第 1 章**: 基礎與快速入門 ✅
- [ ] **第 2 章**: AI 優先開發 ✅  
- [ ] **第 3 章**: 配置與身份驗證 ✅
- [ ] **第 4 章**: 基礎架構即代碼與部署 ✅
- [ ] **第 5 章**: 多代理 AI 解決方案 ✅
- [ ] **第 6 章**: 部署前驗證與規劃 ✅
- [ ] **第 7 章**: 故障排除與調試 ✅
- [ ] **第 8 章**: 生產與企業模式 ✅

### 學習驗證
完成每章節後，驗證你的知識：
1. **實踐練習**: 完成章節的實踐部署
2. **知識檢查**: 查看章節的常見問題部分
3. **社群討論**: 在 Azure Discord 分享你的經驗
4. **下一章節**: 進入下一個複雜度級別

### 課程完成的好處
完成所有章節後，你將擁有：
- **生產經驗**: 部署真實的 AI 應用到 Azure
- **專業技能**: 企業級部署能力  
- **社群認可**: 成為 Azure 開發者社群的活躍成員
- **職業提升**: 具備 AZD 和 AI 部署的熱門專業技能

---

## 🤝 社群與支援

### 獲取幫助與支援
- **技術問題**: [回報錯誤並提出功能請求](https://github.com/microsoft/azd-for-beginners/issues)
- **學習問題**: [Microsoft Azure Discord 社群](https://discord.gg/microsoft-azure)
- **AI 特定幫助**: 加入 [#Azure 頻道](https://discord.gg/microsoft-azure) 討論 AZD + AI Foundry
- **文檔**: [官方 Azure Developer CLI 文檔](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Azure AI Foundry Discord 社群洞察

**#Azure 頻道的最新投票結果:**
- **45%** 的開發者希望使用 AZD 處理 AI 工作負載
- **主要挑戰**: 多服務部署、憑證管理、生產準備  
- **最受歡迎**: AI 特定模板、故障排除指南、最佳實踐

**加入我們的社群以：**
- 分享你的 AZD + AI 經驗並獲得幫助
- 獲取新 AI 模板的早期預覽
- 貢獻 AI 部署最佳實踐
- 影響未來 AI + AZD 功能開發

### 為課程做出貢獻
我們歡迎貢獻！請閱讀 [貢獻指南](CONTRIBUTING.md) 了解如何：
- **改進內容**: 增強現有章節和範例
- **新增範例**：加入真實世界的情境和範本  
- **翻譯**：協助維持多語言支援  
- **錯誤回報**：提升準確性和清晰度  
- **社群標準**：遵守我們包容性的社群指引  

---

## 📄 課程資訊

### 授權
此專案採用 MIT 授權條款 - 詳情請參閱 [LICENSE](../../LICENSE) 文件。

### 相關 Microsoft 學習資源

我們的團隊製作了其他全面的學習課程：

- [Model Context Protocol (MCP) 初學者指南](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI Agents 初學者指南](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [使用 .NET 的生成式 AI 初學者指南](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [生成式 AI 初學者指南](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [使用 Java 的生成式 AI 初學者指南](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [機器學習初學者指南](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [資料科學初學者指南](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [人工智能初學者指南](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [網絡安全初學者指南](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [網頁開發初學者指南](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [物聯網初學者指南](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [XR 開發初學者指南](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [精通 GitHub Copilot 用於 AI 配對編程](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [精通 GitHub Copilot 用於 C#/.NET 開發者](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [選擇你的 Copilot 冒險](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

## 🗺️ 課程導航

**🚀 準備開始學習了嗎？**

**初學者**：從 [第 1 章：基礎與快速入門](../..) 開始  
**AI 開發者**：跳到 [第 2 章：AI 優先開發](../..)  
**有經驗的開發者**：從 [第 3 章：配置與身份驗證](../..) 開始

**下一步**：[開始第 1 章 - AZD 基礎](docs/getting-started/azd-basics.md) →

---

**免責聲明**：  
此文件已使用人工智能翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們致力於提供準確的翻譯，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要信息，建議使用專業人工翻譯。我們不對因使用此翻譯而引起的任何誤解或誤釋承擔責任。