<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6d5c886052b605349d9219cea5f2f6a1",
  "translation_date": "2026-01-16T09:07:33+00:00",
  "source_file": "README.md",
  "language_code": "hk"
}
-->
# AZD 新手入門：系統化學習旅程

![AZD-for-beginners](../../../../translated_images/zh-HK/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## 課程入門指南

按照以下步驟開始你的 AZD 學習旅程：

1. **Fork 倉庫**：點選 [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone 倉庫**：`git clone https://github.com/microsoft/azd-for-beginners.git`
3. **加入社區**：[Azure Discord 社區](https://discord.com/invite/ByRwuEEgH4) 尋求專家支援
4. **選擇你的學習路徑**：根據你的經驗程度選擇以下章節

### 多語言支援

#### 自動翻譯（隨時更新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](./README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **想本地 Clone？**

> 這個倉庫包含超過 50 種語言的翻譯，會大幅增加下載大小。若想不帶翻譯克隆，請使用稀疏檢出：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 這樣可以讓你以更快速度下載到完成課程所需的所有內容。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 課程概覽

透過循序漸進的章節掌握 Azure Developer CLI (azd)。**特別聚焦於與 Microsoft Foundry 集成的 AI 應用部署。**

### 為何此課程對現代開發者至關重要

根據 Microsoft Foundry Discord 社群調查，**有 45% 的開發者希望使用 AZD 來處理 AI 工作負載**，但遇到以下挑戰：
- 複雜的多服務 AI 架構
- 生產環境 AI 部署最佳實踐  
- Azure AI 服務集成與配置
- AI 工作負載成本優化
- 解決 AI 專用部署問題

### 學習目標

完成此系統化課程後，你將能：
- **掌握 AZD 基礎**：核心概念、安裝與配置
- **部署 AI 應用**：結合 Microsoft Foundry 服務使用 AZD
- **實現基礎設施即代碼**：使用 Bicep 模板管理 Azure 資源
- **故障排除部署問題**：解決常見問題及除錯
- **生產環境優化**：安全性、擴展、監控及成本管理
- **構建多代理解決方案**：部署複雜 AI 架構

## 📚 學習章節

*根據你的經驗與目標選擇合適學習路徑*

### 🚀 第一章：基礎與快速入門
**先決條件**：Azure 訂閱，基本命令行知識  
**時間**：30-45 分鐘  
**難度**：⭐

#### 你將學到
- 了解 Azure Developer CLI 基本原理
- 在你的平台安裝 AZD
- 首次成功部署

#### 學習資源
- **🎯 從這開始**：[何謂 Azure Developer CLI？](../..)
- **📖 理論**：[AZD 基礎](docs/getting-started/azd-basics.md) - 核心概念與術語
- **⚙️ 設置**：[安裝與設置](docs/getting-started/installation.md) - 平台專屬指南
- **🛠️ 實操**：[你的第一個項目](docs/getting-started/first-project.md) - 逐步教學
- **📋 快速參考**：[命令速查表](resources/cheat-sheet.md)

#### 實作練習
```bash
# 快速安裝檢查
azd version

# 部署您的第一個應用程式
azd init --template todo-nodejs-mongo
azd up
```

**💡 本章目標**：使用 AZD 成功部署簡單的 Web 應用至 Azure

**✅ 成功驗證：**
```bash
# 完成第一章後，你應該能夠：
azd version              # 顯示已安裝版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署到 Azure
azd show                # 顯示運行中應用程式的 URL
# 應用程式在瀏覽器中打開並正常運作
azd down --force --purge  # 清理資源
```

**📊 估計時間：** 30-45 分鐘  
**📈 章節結束技能：** 能獨立部署基本應用

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

**📊 估計時間：** 30-45 分鐘  
**📈 章節結束技能：** 能獨立部署基本應用

---

### 🤖 第二章：以 AI 為先的開發（推薦 AI 開發者）
**先決條件**：完成第一章  
**時間**：1-2 小時  
**難度**：⭐⭐

#### 你將學到
- Microsoft Foundry 與 AZD 的整合
- 部署 AI 驅動的應用
- 了解 AI 服務配置

#### 學習資源
- **🎯 從這開始**：[Microsoft Foundry 整合](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 模式**：[AI 模型部署](docs/microsoft-foundry/ai-model-deployment.md) - 部署及管理 AI 模型
- **🛠️ 實作工作坊**：[AI 工作坊實驗室](docs/microsoft-foundry/ai-workshop-lab.md) - 使你的 AI 解決方案 AZD 準備就緒
- **🎥 互動導引**：[工作坊資料](workshop/README.md) - 基於瀏覽器的 MkDocs 與 DevContainer 環境
- **📋 範本**：[Microsoft Foundry 範本](../..)
- **📝 範例**：[AZD 部署範例](examples/README.md)

#### 實作練習
```bash
# 部署您的第一個 AI 應用程式
azd init --template azure-search-openai-demo
azd up

# 嘗試額外的 AI 模板
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 本章目標**：部署並配置具有 RAG 功能的 AI 聊天應用

**✅ 成功驗證：**
```bash
# 完成第2章後，你應該能夠：
azd init --template azure-search-openai-demo
azd up
# 測試AI聊天介面
# 提問並獲得具來源的AI回應
# 驗證搜尋整合功能是否正常
azd monitor  # 檢查Application Insights是否顯示遙測資料
azd down --force --purge
```

**📊 估計時間：** 1-2 小時  
**📈 章節結束技能：** 能部署及配置生產級 AI 應用  
**💰 成本認知：** 理解開發環境約 $80-150/月，生產環境約 $300-3500/月

#### 💰 AI 部署成本考量

**開發環境（估計 $80-150/月）：**
- Azure OpenAI（隨用隨付）：$0-50/月（依 Token 使用量）
- AI Search（基礎級）：$75/月
- Container Apps（消耗計價）：$0-20/月
- 儲存（標準）：$1-5/月

**生產環境（估計 $300-3500+ /月）：**
- Azure OpenAI（參與式用戶數 PTU 保持穩定效能）：$3,000+/月 或 大量用量下隨用隨付
- AI Search（標準級）：$250/月
- Container Apps（專用）：$50-100/月
- Application Insights：$5-50/月
- 儲存（高級）：$10-50/月

**💡 成本優化建議：**
- 使用 **免費級** Azure OpenAI 學習（每月含 50,000 tokens）
- 不開發時執行 `azd down` 釋放資源
- 以消耗計價開始，生產才升級成 PTU
- 使用 `azd provision --preview` 預估部署成本
- 啟用自動擴展，僅付實際使用費用

**成本監控：**
```bash
# 檢查預計每月費用
azd provision --preview

# 在 Azure 入口網站監察實際費用
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第三章：配置與認證
**先決條件**：完成第一章  
**時間**：45-60 分鐘  
**難度**：⭐⭐

#### 你將學到
- 環境配置與管理
- 認證與安全最佳實踐
- 資源命名與組織

#### 學習資源
- **📖 配置指南**：[環境設定](docs/getting-started/configuration.md)
- **🔐 安全**：[認證模式與Managed Identity](docs/getting-started/authsecurity.md)
- **📝 範例**：[資料庫應用範例](examples/database-app/README.md)

#### 實作練習
- 配置多重環境（開發、預備、正式）
- 設定 Managed Identity 認證
- 實作環境特定設定

**💡 本章目標**：管理多環境並用適當認證與安全措施

---

### 🏗️ 第四章：基礎設施即代碼與部署
**先決條件**：完成第一至三章  
**時間**：1-1.5 小時  
**難度**：⭐⭐⭐

#### 你將學到
- 進階部署模式
- 使用 Bicep 的基礎設施即代碼
- 資源佈建策略

#### 學習資源
- **📖 部署指南**：[部署完整工作流程](docs/deployment/deployment-guide.md)
- **🏗️ 佈建資源**：[資源佈建](docs/deployment/provisioning.md)
- **📝 範例**：[容器應用範例](../../examples/container-app)

#### 實作練習
- 建立自訂 Bicep 範本
- 部署多服務應用
- 實作藍綠部署策略

**💡 本章目標**：使用自訂基礎設施範本部署複雜多服務應用

---

### 🎯 第五章：多代理 AI 解決方案（進階）
**先決條件**：完成第一、二章  
**時間**：2-3 小時  
**難度**：⭐⭐⭐⭐

#### 你將學到
- 多代理架構模式
- 代理協調與統籌
- 生產環境就緒的 AI 部署

#### 學習資源
- **🤖 精選專案**：[零售多代理方案](examples/retail-scenario.md) - 完整實作
- **🛠️ ARM 範本**：[ARM 範本套件](../../examples/retail-multiagent-arm-template) - 一鍵部署
- **📖 架構**：[多代理協調模式](/docs/pre-deployment/coordination-patterns.md) - 模式

#### 實作練習
```bash
# 部署完整的零售多代理解決方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索代理配置
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 章節成果**：部署及管理一個面向生產環境的多代理 AI 解決方案，含客戶與庫存代理

---

### 🔍 第六章：部署前驗證與規劃
**先決條件**：完成第四章  
**時間長度**：1 小時  
**難度**：⭐⭐

#### 你將學到
- 容量規劃與資源驗證
- SKU 選擇策略
- 預檢查與自動化

#### 學習資源
- **📊 規劃**：[容量規劃](docs/pre-deployment/capacity-planning.md) - 資源驗證
- **💰 選擇**：[SKU 選擇](docs/pre-deployment/sku-selection.md) - 成本效益選擇
- **✅ 驗證**：[預檢查](docs/pre-deployment/preflight-checks.md) - 自動化腳本

#### 實作練習
- 執行容量驗證腳本
- 優化 SKU 選擇以降低成本
- 實現自動化的部署前檢查

**💡 章節成果**：在部署執行前驗證與優化部署方案

---

### 🚨 第七章：故障排除與偵錯
**先決條件**：完成任一部署章節  
**時間長度**：1-1.5 小時  
**難度**：⭐⭐

#### 你將學到
- 系統化偵錯方法
- 常見問題及解決方案
- AI 特定故障排除技巧

#### 學習資源
- **🔧 常見問題**：[常見問題](docs/troubleshooting/common-issues.md) - 常見問答與解決方案
- **🕵️ 偵錯**：[偵錯指南](docs/troubleshooting/debugging.md) - 逐步策略
- **🤖 AI 問題**：[AI 專屬故障排除](docs/troubleshooting/ai-troubleshooting.md) - AI 服務問題

#### 實作練習
- 診斷部署失敗問題
- 解決認證相關問題
- 偵錯 AI 服務連線

**💡 章節成果**：能獨立診斷並解決常見部署問題

---

### 🏢 第八章：生產與企業模式
**先決條件**：完成第一至第四章  
**時間長度**：2-3 小時  
**難度**：⭐⭐⭐⭐

#### 你將學到
- 生產部署策略
- 企業安全模式
- 監控與成本優化

#### 學習資源
- **🏭 生產**：[生產 AI 最佳實踐](docs/microsoft-foundry/production-ai-practices.md) - 企業模式
- **📝 範例**：[微服務範例](../../examples/microservices) - 複雜架構
- **📊 監控**：[Application Insights 整合](docs/pre-deployment/application-insights.md) - 監控

#### 實作練習
- 實現企業安全模式
- 設置全面監控
- 以正確治理方式部署生產環境

**💡 章節成果**：部署具備完整生產能力的企業級應用

---

## 🎓 工作坊概述：實作學習體驗

> **⚠️ 工作坊狀態：積極開發中**  
> 工作坊教材目前正持續開發與完善。核心模組已能運作，但部分進階章節尚未完成。我們正積極工作以完成全部內容。[追蹤進度 →](workshop/README.md)

### 互動式工作坊教材
**完整互動式學習體驗，提供瀏覽器工具及引導練習**

本工作坊教材結構化並互動，補充上述章節課程設計。適合自學及教學導向的訓練。

#### 🛠️ 工作坊特色
- **瀏覽器介面**：完整 MkDocs 支援的工作坊，具備搜尋、複製與主題功能
- **GitHub Codespaces 整合**：一鍵快速啟用開發環境
- **結構化學習路徑**：七階段引導練習（共 3.5 小時）
- **發現 → 部署 → 客製化**：循序漸進方法
- **互動式 DevContainer 環境**：預設工具與相依項目

#### 📚 工作坊架構
工作坊遵循 **發現 → 部署 → 客製化** 方法：

1. **發現階段**（45 分鐘）
   - 探索 Microsoft Foundry 範本與服務
   - 了解多代理架構模式
   - 檢視部署需求與先決條件

2. **部署階段**（2 小時）
   - 實作 AI 應用部署與 AZD
   - 配置 Azure AI 服務及端點
   - 實現安全與認證模式

3. **客製化階段**（45 分鐘）
   - 修改應用適用各案例
   - 優化生產部署
   - 配置監控與成本管理

#### 🚀 開始使用工作坊
```bash
# 選項 1：GitHub Codespaces（推薦）
# 按一下「Code」→「在 main 上建立 codespace」於儲存庫中

# 選項 2：本機開發
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 遵循 workshop/README.md 中的設置指示
```

#### 🎯 工作坊學習成果
完成工作坊後，學員將能：
- **部署生產 AI 應用程式**：使用 AZD 並結合 Microsoft Foundry 服務
- **精通多代理架構**：實作協調式 AI 代理解決方案
- **實踐安全最佳實務**：配置認證與存取控制
- **優化擴展效能**：設計具成本效益且效能良好的部署
- **自主排錯**：獨立解決常見部署問題

#### 📖 工作坊資源
- **🎥 互動指南**：[工作坊教材](workshop/README.md) - 瀏覽器互動學習環境
- **📋 詳細指導**：[引導練習](../../workshop/docs/instructions) - 詳盡步驟說明
- **🛠️ AI 工作坊實驗室**：[AI 工作坊實驗室](docs/microsoft-foundry/ai-workshop-lab.md) - AI 專注練習
- **💡 快速啟動**：[工作坊設定指南](workshop/README.md#quick-start) - 環境配置說明

**適合對象**：企業訓練、大學課程、自學與開發者密集訓練營。

---

## 📖 什麼是 Azure Developer CLI？

Azure Developer CLI (azd) 是一套以開發者為中心的命令行工具，加速在 Azure 上構建和部署應用的過程。提供：

- **基於範本的部署** - 使用預建範本支援常見應用模式
- **基礎設施即代碼** - 透過 Bicep 或 Terraform 管理 Azure 資源  
- **整合化工作流程** - 無縫完成資源供應、部署及監控
- **開發者友好** - 提升開發者生產力及體驗

### **AZD + Microsoft Foundry：AI 部署的完美組合**

**為什麼選擇 AZD 實作 AI 解決方案？** AZD 解決 AI 開發者主要挑戰：

- **AI 專用範本** - 預配置 Azure OpenAI、Cognitive Services 及機器學習負載範本
- **安全 AI 部署** - 內建 AI 服務、API 金鑰及模型端點保安模式  
- **生產 AI 範式** - 可擴展且成本效益佳的 AI 應用最佳實踐
- **端到端 AI 工作流程** - 從模型開發到生產部署並妥善監控
- **成本優化** - 智慧資源配置及擴展策略
- **Microsoft Foundry 整合** - 無縫連接 Microsoft Foundry 模型目錄及端點

---

## 🎯 範本與範例庫

### 推薦：Microsoft Foundry 範本
**若部署 AI 應用，請從這裡開始！**

> **注意：** 這些範本展示多種 AI 模式。其中部分為 Azure Samples 外部範例，部分為本地實作。

| 範本 | 章節 | 難度 | 服務 | 類型 |
|----------|---------|------------|----------|------|
| [**AI 聊天入門**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第 2 章 | ⭐⭐ | AzureOpenAI + Azure AI 模型推論 API + Azure AI 搜尋 + Azure Container Apps + Application Insights | 外部 |
| [**AI 代理入門**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第 2 章 | ⭐⭐ | Azure AI 代理服務 + AzureOpenAI + Azure AI 搜尋 + Azure Container Apps + Application Insights | 外部 |
| [**Azure Search + OpenAI 範例**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第 2 章 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | 外部 |
| [**OpenAI 聊天應用快速入門**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第 2 章 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第 5 章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 第 8 章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | 外部 |
| [**零售多代理方案**](examples/retail-scenario.md) | 第 5 章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **本地** |

### 推薦：完整學習場景
**生產就緒應用範本，對應學習章節**

| 範本 | 學習章節 | 難度 | 主要學習內容 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第 2 章 | ⭐ | 基本 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第 2 章 | ⭐⭐ | 使用 Azure AI Search 的 RAG 實作 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第 4 章 | ⭐⭐ | 文件智能整合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第 5 章 | ⭐⭐⭐ | 代理框架與函式呼叫 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第 8 章 | ⭐⭐⭐ | 企業級 AI 編排 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第 5 章 | ⭐⭐⭐⭐ | 客戶與庫存代理多代理架構 |

### 按範例類型學習

> **📌 本地與外部範例說明：**  
> **本地範例**（本庫內）= 立即可用  
> **外部範例**（Azure Samples）= 從外部倉庫 clone

#### 本地範例（可立即使用）
- [**零售多代理方案**](examples/retail-scenario.md) - 完整生產就緒實作及 ARM 範本  
  - 多代理架構（客戶代理 + 庫存代理）  
  - 完善監控與評估  
  - 透過 ARM 範本一鍵部署

#### 本地範例 - 容器應用（第 2-5 章）
**本倉庫內全面的容器部署範例：**
- [**容器應用範例**](examples/container-app/README.md) - 完整容器部署指南  
  - [簡單 Flask API](../../examples/container-app/simple-flask-api) - 基本 REST API 支援縮放至零  
  - [微服務架構](../../examples/container-app/microservices) - 生產級多服務部署  
  - 快速入門、生產、進階部署模式  
  - 監控、安全與成本優化指導

#### 外部範例 - 簡易應用（第 1-2 章）
**克隆以下 Azure Samples 倉庫以開始：**
- [簡單網頁應用 - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本部署模式
- [靜態網站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 靜態內容部署
- [容器應用 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署

#### 外部範例 - 資料庫整合（第 3-4 章）  
- [資料庫應用 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 資料庫連結模式
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 無伺服器資料工作流程

#### 外部範例 - 進階模式（第 4-8 章）
- [Java 微服務](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服務架構
- [容器應用背景任務](https://github.com/Azure-Samples/container-apps-jobs) - 背景處理  
- [企業級 ML 流程](https://github.com/Azure-Samples/mlops-v2) - 生產就緒機器學習模式

### 外部範本集合
- [**官方 AZD 範本庫**](https://azure.github.io/awesome-azd/) - 精選官方與社群範本集合
- [**Azure Developer CLI 範本**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 範本文件
- [**示例目錄**](examples/README.md) - 本地學習示例與詳細說明

---

## 📚 學習資源與參考

### 快速參考
- [**命令速查表**](resources/cheat-sheet.md) - 按章節整理的基本 azd 命令
- [**詞彙表**](resources/glossary.md) - Azure 與 azd 術語  
- [**常見問題**](resources/faq.md) - 按學習章節分類的常見問題
- [**學習指南**](resources/study-guide.md) - 完整練習題

### 實作工作坊
- [**AI 工作坊實驗室**](docs/microsoft-foundry/ai-workshop-lab.md) - 製作可使用 AZD 部署的 AI 解決方案（2-3 小時）
- [**互動工作坊指南**](workshop/README.md) - 基於瀏覽器的工作坊，使用 MkDocs 和 DevContainer 環境
- [**結構化學習路徑**](../../workshop/docs/instructions) - 7 步驟引導練習（探索 → 部署 → 自訂）
- [**AZD 初學者工作坊**](workshop/README.md) - 完整實作工作坊資源，整合 GitHub Codespaces

### 外部學習資源
- [Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 價格計算機](https://azure.microsoft.com/pricing/calculator/)
- [Azure 狀態](https://status.azure.com/)

---

## 🔧 快速故障排除指南

**初學者常見問題及立即解決方案：**

### ❌ "azd: command not found"

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

### ❌ "No subscription found" or "Subscription not set"

```bash
# 列出可用的訂閱
az account list --output table

# 設定預設訂閱
az account set --subscription "<subscription-id-or-name>"

# 設定給 AZD 環境
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# 驗證
az account show
```

### ❌ "InsufficientQuota" or "Quota exceeded"

```bash
# 試試不同的 Azure 地區
azd env set AZURE_LOCATION "westus2"
azd up

# 或者在開發時使用較小的 SKU
# 編輯 infra/main.parameters.json：
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" fails halfway through

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

### ❌ "Resource already exists" or naming conflicts

```bash
# AZD 會產生獨特名稱，但如果發生衝突：
azd down --force --purge

# 則會使用全新環境重試
azd env new dev-v2
azd up
```

### ❌ 模板部署花費時間過長

**正常等待時間：**
- 簡單網頁應用：5-10 分鐘
- 帶資料庫應用：10-15 分鐘
- AI 應用程式：15-25 分鐘（OpenAI 配置較慢）

```bash
# 檢查進度
azd show

# 如果停滯超過30分鐘，檢查Azure入口網站：
azd monitor
# 尋找失敗的部署
```

### ❌ "Permission denied" or "Forbidden"

```bash
# 檢查你的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 你至少需要「參與者」角色
# 請你的 Azure 管理員授權：
# - 參與者（用於資源）
# - 使用者存取管理員（用於角色分配）
```

### ❌ 找不到已部署應用的 URL

```bash
# 顯示所有服務端點
azd show

# 或打開 Azure 入口網站
azd monitor

# 檢查特定服務
azd env get-values
# 搜尋 *_URL 變數
```

### 📚 完整故障排除資源

- **常見問題指南：** [詳細解決方案](docs/troubleshooting/common-issues.md)
- **AI 專屬問題：** [AI 故障排除](docs/troubleshooting/ai-troubleshooting.md)
- **除錯指南：** [逐步除錯](docs/troubleshooting/debugging.md)
- **尋求協助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 快速故障排除指南

**初學者常見問題及立即解決方案：**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

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
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# 嘗試不同的 Azure 區域
azd env set AZURE_LOCATION "westus2"
azd up

# 或在開發中使用較小的 SKU
# 編輯 infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

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
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

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
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD 會生成獨特的名稱，但如果發生衝突：
azd down --force --purge

# 則重試並使用全新環境
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 模板部署花費時間過長</strong></summary>

**正常等待時間：**
- 簡單網頁應用：5-10 分鐘
- 帶資料庫應用：10-15 分鐘
- AI 應用程式：15-25 分鐘（OpenAI 配置較慢）

```bash
# 檢查進度
azd show

# 如果卡住超過30分鐘，檢查 Azure Portal：
azd monitor
# 尋找失敗的部署
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# 檢查你的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 你需要至少有「參與者」角色
# 請你的 Azure 管理員授予：
# - 參與者（針對資源）
# - 使用者存取管理員（針對角色分配）
```
</details>

<details>
<summary><strong>❌ 找不到已部署應用的 URL</strong></summary>

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

### 📚 完整故障排除資源

- **常見問題指南：** [詳細解決方案](docs/troubleshooting/common-issues.md)
- **AI 專屬問題：** [AI 故障排除](docs/troubleshooting/ai-troubleshooting.md)
- **除錯指南：** [逐步除錯](docs/troubleshooting/debugging.md)
- **尋求協助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 課程完成與認證

### 進度追蹤
追蹤每個章節的學習進度：

- [ ] **第一章**：基礎與快速入門 ✅
- [ ] **第二章**：AI 優先開發 ✅  
- [ ] **第三章**：設定與驗證 ✅
- [ ] **第四章**：基礎架構即代碼與部署 ✅
- [ ] **第五章**：多代理 AI 解決方案 ✅
- [ ] **第六章**：部署前驗證與規劃 ✅
- [ ] **第七章**：故障排除與除錯 ✅
- [ ] **第八章**：生產與企業模式 ✅

### 學習驗證
完成每章後，可透過以下方式驗證學習成果：
1. **實務練習**：完成該章節的實作部署
2. **知識測驗**：複習該章節的 FAQ
3. **社群討論**：於 Azure Discord 分享你的經驗
4. **下一章節**：挑戰下一階段難度

### 課程完成好處
完成所有章節後，你將擁有：
- **真實生產經驗**：將 AI 應用成功部署到 Azure
- **專業技能**：具備企業級部署能力  
- **社群認可**：成為 Azure 開發者社群活躍成員
- **職涯提升**：取得需求旺盛的 AZD 與 AI 部署專長

---

## 🤝 社群與支援

### 尋求協助與支援
- **技術問題**：[回報錯誤與功能需求](https://github.com/microsoft/azd-for-beginners/issues)
- **學習問題**：[Microsoft Azure Discord 社群](https://discord.gg/microsoft-azure) 以及 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 專屬協助**：加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **文件資源**：[官方 Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### 微軟 Foundry Discord 的社群洞察

**#Azure 頻道最新調查結果：**
- **45%** 開發者希望使用 AZD 處理 AI 工作負載
- **主要挑戰**：多服務部署、憑證管理、生產準備  
- **最常要求**：AI 專屬模板、故障排除指南、最佳實務

**加入我們的社群，您可以：**
- 分享您的 AZD + AI 經驗，並獲得協助
- 獲得 AI 模板的早期預覽
- 參與 AI 部署最佳實務的貢獻
- 影響未來 AI + AZD 功能開發

### 對課程的貢獻
歡迎投稿！請閱讀我們的 [貢獻指南](CONTRIBUTING.md) 了解：
- **內容改善**：優化現有章節與示例
- **新增示例**：增加真實案例與模板  
- **翻譯工作**：協助多語言支持維護
- **錯誤回報**：提升內容正確性與易讀性
- **社群準則**：遵守我們的包容性社群規範

---

## 📄 課程資訊

### 授權條款
本專案採用 MIT 授權條款 — 詳見 [LICENSE](../../LICENSE) 檔案。

### 相關微軟學習資源

我們團隊亦製作其他完整學習課程：

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

---

### Azure / Edge / MCP / 代理人
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

**🚀 準備開始學習了嗎？**

**初學者**: 從 [第 1 章：基礎及快速入門](../..) 開始  
**人工智能開發者**: 直接前往 [第 2 章：以 AI 為先的開發](../..)  
**有經驗的開發者**: 從 [第 3 章：設定與驗證](../..) 開始

**下一步**: [開始第 1 章 - AZD 基礎](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於確保準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威資料來源。對於重要資訊，建議採用專業人工翻譯。本公司不對因使用此翻譯而引致的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->