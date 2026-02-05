<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6d5c886052b605349d9219cea5f2f6a1",
  "translation_date": "2026-01-16T09:14:15+00:00",
  "source_file": "README.md",
  "language_code": "tw"
}
-->
# AZD 新手入門：結構化學習之旅

![AZD-for-beginners](../../../../translated_images/tw/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## 開始這門課程

請依照以下步驟開始您的 AZD 學習之旅：

1. **Fork 倉庫**：點擊 [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone 倉庫**：`git clone https://github.com/microsoft/azd-for-beginners.git`
3. **加入社群**：[Azure Discord 社群](https://discord.com/invite/ByRwuEEgH4) 尋求專家支援
4. **選擇您的學習路徑**：從下方章節選擇適合您經驗程度的內容

### 多語言支援

#### 自動翻譯（始終保持最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[阿拉伯語](../ar/README.md) | [孟加拉語](../bn/README.md) | [保加利亞語](../bg/README.md) | [緬甸語](../my/README.md) | [中文（簡體）](../zh/README.md) | [中文（繁體，香港）](../hk/README.md) | [中文（繁體，澳門）](../mo/README.md) | [中文（繁體，台灣）](./README.md) | [克羅地亞語](../hr/README.md) | [捷克語](../cs/README.md) | [丹麥語](../da/README.md) | [荷蘭語](../nl/README.md) | [愛沙尼亞語](../et/README.md) | [芬蘭語](../fi/README.md) | [法語](../fr/README.md) | [德語](../de/README.md) | [希臘語](../el/README.md) | [希伯來語](../he/README.md) | [印地語](../hi/README.md) | [匈牙利語](../hu/README.md) | [印尼語](../id/README.md) | [義大利語](../it/README.md) | [日語](../ja/README.md) | [卡納達語](../kn/README.md) | [韓語](../ko/README.md) | [立陶宛語](../lt/README.md) | [馬來語](../ms/README.md) | [馬拉雅拉姆語](../ml/README.md) | [馬拉地語](../mr/README.md) | [尼泊爾語](../ne/README.md) | [奈及利亞派京語](../pcm/README.md) | [挪威語](../no/README.md) | [波斯語（法爾西語）](../fa/README.md) | [波蘭語](../pl/README.md) | [葡萄牙語（巴西）](../br/README.md) | [葡萄牙語（葡萄牙）](../pt/README.md) | [旁遮普語（古魯姆基）](../pa/README.md) | [羅馬尼亞語](../ro/README.md) | [俄語](../ru/README.md) | [塞爾維亞語（西里爾字母）](../sr/README.md) | [斯洛伐克語](../sk/README.md) | [斯洛文尼亞語](../sl/README.md) | [西班牙語](../es/README.md) | [斯瓦希里語](../sw/README.md) | [瑞典語](../sv/README.md) | [他加祿語（菲律賓語）](../tl/README.md) | [泰米爾語](../ta/README.md) | [泰盧固語](../te/README.md) | [泰語](../th/README.md) | [土耳其語](../tr/README.md) | [烏克蘭語](../uk/README.md) | [烏爾都語](../ur/README.md) | [越南語](../vi/README.md)

> **偏好本機 Clone？**

> 此倉庫包含 50 多種語言的翻譯，會顯著增加下載大小。若想排除翻譯內容，請使用稀疏簽出：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 這樣可以更快速下載，且包含完成課程所需的所有內容。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 課程總覽

透過結構化章節，逐步掌握 Azure Developer CLI（azd）。**特別強調與 Microsoft Foundry 整合的 AI 應用部署。**

### 為什麼本課程是現代開發者的必修

根據 Microsoft Foundry Discord 社群見解，**45% 的開發者想用 AZD 進行 AI 工作負載**，但面臨以下挑戰：
- 複雜的多服務 AI 架構
- 生產環境的 AI 部署最佳實踐  
- Azure AI 服務整合與配置
- AI 工作負載的成本優化
- AI 專屬部署問題的故障排除

### 學習目標

完成本結構化課程後，您將能夠：
- **掌握 AZD 基礎**：核心概念、安裝與配置
- **部署 AI 應用**：使用 AZD 與 Microsoft Foundry 服務
- **實現基礎建設即代碼**：使用 Bicep 範本管理 Azure 資源
- **部署故障排除**：解決常見問題及除錯
- **生產優化**：安全性、擴展性、監控與成本管理
- **建構多代理解決方案**：部署複雜 AI 架構

## 📚 學習章節

*依經驗程度與目標選擇您的學習路徑*

### 🚀 第一章：基礎與快速入門
**先決條件**：Azure 訂閱、基礎命令列知識  
**時間**：30-45 分鐘  
**難度**：⭐

#### 你將學到
- 了解 Azure Developer CLI 基礎
- 安裝 AZD 在您的平台
- 完成第一個成功部署

#### 學習資源
- **🎯 從此開始**：[什麼是 Azure Developer CLI？](../..)
- **📖 理論**：[AZD 基礎](docs/getting-started/azd-basics.md) - 核心概念與術語
- **⚙️ 安裝**：[安裝與設定](docs/getting-started/installation.md) - 平台專用指引
- **🛠️ 實作**：[您的第一個專案](docs/getting-started/first-project.md) - 分步教學
- **📋 快速參考**：[指令速查表](resources/cheat-sheet.md)

#### 實作練習
```bash
# 快速安裝檢查
azd version

# 部署您的第一個應用程式
azd init --template todo-nodejs-mongo
azd up
```

**💡 本章成果**：使用 AZD 成功部署簡單網頁應用程式至 Azure

**✅ 成功驗證：**
```bash
# 完成第一章後，您應該能夠：
azd version              # 顯示已安裝的版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署至 Azure
azd show                # 顯示正在執行的應用程式 URL
# 應用程式會在瀏覽器中開啟並運作
azd down --force --purge  # 清理資源
```

**📊 時間投入：** 30-45 分鐘  
**📈 完成後技能：** 可以獨立部署基本應用程式

**✅ 成功驗證：**
```bash
# 完成第一章後，您應該能夠：
azd version              # 顯示已安裝的版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署到 Azure
azd show                # 顯示正在運行的應用程式 URL
# 應用程式在瀏覽器中開啟並正常運作
azd down --force --purge  # 清理資源
```

**📊 時間投入：** 30-45 分鐘  
**📈 完成後技能：** 可以獨立部署基本應用程式

---

### 🤖 第二章：AI 優先開發（推薦給 AI 開發者）
**先決條件**：已完成第一章  
**時間**：1-2 小時  
**難度**：⭐⭐

#### 你將學到
- Microsoft Foundry 與 AZD 整合
- 部署 AI 驅動的應用程式
- 理解 AI 服務設定

#### 學習資源
- **🎯 從此開始**：[Microsoft Foundry 整合](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 模式**：[AI 模型部署](docs/microsoft-foundry/ai-model-deployment.md) - 部署與管理 AI 模型
- **🛠️ 工作坊**：[AI 實驗室](docs/microsoft-foundry/ai-workshop-lab.md) - 讓您的 AI 解決方案具備 AZD 支援
- **🎥 互動指引**：[工作坊教材](workshop/README.md) - 使用 MkDocs 及 DevContainer 瀏覽器環境學習
- **📋 範本**：[Microsoft Foundry 範本](../..)
- **📝 範例**：[AZD 部署範例](examples/README.md)

#### 實作練習
```bash
# 部署您的第一個 AI 應用程式
azd init --template azure-search-openai-demo
azd up

# 嘗試其他 AI 範本
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 本章成果**：部署並配置具 RAG 功能的 AI 聊天應用程式

**✅ 成功驗證：**
```bash
# 在第2章之後，您應該能夠：
azd init --template azure-search-openai-demo
azd up
# 測試 AI 聊天介面
# 提問並獲得帶有來源的 AI 回應
# 驗證搜尋整合是否運作
azd monitor  # 檢查 Application Insights 是否顯示遙測數據
azd down --force --purge
```

**📊 時間投入：** 1-2 小時  
**📈 完成後技能：** 能部署與配置生產級 AI 應用  
**💰 成本意識：** 理解月開發成本約 $80-150，生產成本約 $300-3500

#### 💰 AI 部署成本考量

**開發環境（估計月費 $80-150）：**
- Azure OpenAI（按使用付費）：$0-50/月（依代幣使用量計）
- AI 搜索（基礎方案）：$75/月
- 容器應用（消耗計費）：$0-20/月
- 儲存（標準）：$1-5/月

**生產環境（估計月費 $300-3,500+）：**
- Azure OpenAI（PTU 持續效能保證）：$3,000+/月，或高用量按使用付費
- AI 搜索（標準方案）：$250/月
- 容器應用（專用）：$50-100/月
- 應用程式監控：$5-50/月
- 儲存（高級）：$10-50/月

**💡 成本優化建議：**
- 學習中使用 **免費階層** Azure OpenAI（含 50,000 代幣/月）
- 不開發時執行 `azd down` 回收資源
- 初期使用消耗計費，生產僅升級 PTU
- 使用 `azd provision --preview` 預測部署成本
- 啟用自動縮放：僅付實際使用費用

**成本監控：**
```bash
# 檢查預估每月費用
azd provision --preview

# 在 Azure 入口網站監控實際費用
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第三章：設定與驗證
**先決條件**：已完成第一章  
**時間**：45-60 分鐘  
**難度**：⭐⭐

#### 你將學到
- 環境設定與管理
- 身份驗證與安全最佳實踐
- 資源命名與組織規劃

#### 學習資源
- **📖 設定**：[設定指南](docs/getting-started/configuration.md) - 環境配置
- **🔐 安全**：[驗證模式與托管身份](docs/getting-started/authsecurity.md) - 認證模式
- **📝 範例**：[資料庫應用示例](examples/database-app/README.md) - AZD 資料庫範例

#### 實作練習
- 配置多個環境（開發、測試、正式）
- 設置托管身份驗證
- 實作環境專有設定

**💡 本章成果**：管理多環境並實現正確驗證與安全性

---

### 🏗️ 第四章：基礎建設即代碼與部署
**先決條件**：已完成第一至三章  
**時間**：1-1.5 小時  
**難度**：⭐⭐⭐

#### 你將學到
- 進階部署模式
- 使用 Bicep 的基礎建設即代碼
- 資源佈建策略

#### 學習資源
- **📖 部署**：[部署指南](docs/deployment/deployment-guide.md) - 完整工作流程
- **🏗️ 佈建**：[資源佈建](docs/deployment/provisioning.md) - Azure 資源管理
- **📝 範例**：[容器應用示例](../../examples/container-app) - 容器化部署

#### 實作練習
- 建立自訂 Bicep 範本
- 部署多服務應用程式
- 實作藍綠部署策略

**💡 本章成果**：使用自訂基礎建設範本部署複雜多服務應用

---

### 🎯 第五章：多代理 AI 解決方案（進階）
**先決條件**：已完成第一至二章  
**時間**：2-3 小時  
**難度**：⭐⭐⭐⭐

#### 你將學到
- 多代理架構模式
- 代理協調與協作
- 生產環境可用的 AI 部署

#### 學習資源
- **🤖 精選專案**：[零售多代理解決方案](examples/retail-scenario.md) - 完整實作
- **🛠️ ARM 範本**：[ARM 範本套件](../../examples/retail-multiagent-arm-template) - 一鍵部署
- **📖 架構**：[多代理協作模式](/docs/pre-deployment/coordination-patterns.md) - 模式介紹

#### 實務練習
```bash
# 部署完整的零售多代理解決方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索代理設定
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 章節成果**：部署並管理一個生產環境可用的多代理 AI 解決方案，包括客戶和庫存代理

---

### 🔍 第6章：部署前驗證與規劃
**先決條件**：完成第4章  
**時長**：1 小時  
**難度**：⭐⭐

#### 學習重點
- 容量規劃與資源驗證
- SKU 選擇策略
- 預檢查與自動化

#### 學習資源
- **📊 規劃**：[容量規劃](docs/pre-deployment/capacity-planning.md) - 資源驗證
- **💰 選擇**：[SKU 選擇](docs/pre-deployment/sku-selection.md) - 成本效益選擇
- **✅ 驗證**：[預檢查](docs/pre-deployment/preflight-checks.md) - 自動化腳本

#### 實務練習
- 執行容量驗證腳本
- 優化 SKU 選擇以降低成本
- 實作自動化的部署前檢查

**💡 章節成果**：驗證並優化部署設定，確保執行前無誤

---

### 🚨 第7章：故障排除與除錯
**先決條件**：完成任一部署章節  
**時長**：1-1.5 小時  
**難度**：⭐⭐

#### 學習重點
- 系統化的除錯方法
- 常見問題與解決方案
- AI 相關故障排除技巧

#### 學習資源
- **🔧 常見問題**：[常見問題](docs/troubleshooting/common-issues.md) - FAQ 與解決方案
- **🕵️ 除錯指南**：[除錯指南](docs/troubleshooting/debugging.md) - 分步策略
- **🤖 AI 問題**：[AI 專屬故障排除](docs/troubleshooting/ai-troubleshooting.md) - AI 服務問題處理

#### 實務練習
- 診斷部署失敗原因
- 解決認證問題
- 除錯 AI 服務連線問題

**💡 章節成果**：獨立診斷並排除常見部署問題

---

### 🏢 第8章：生產與企業模式
**先決條件**：完成第1至第4章  
**時長**：2-3 小時  
**難度**：⭐⭐⭐⭐

#### 學習重點
- 生產環境部署策略
- 企業安全模式
- 監控與成本優化

#### 學習資源
- **🏭 生產環境**：[生產 AI 最佳實踐](docs/microsoft-foundry/production-ai-practices.md) - 企業模式
- **📝 範例**：[微服務範例](../../examples/microservices) - 複雜架構
- **📊 監控**：[Application Insights 整合](docs/pre-deployment/application-insights.md) - 監控解決方案

#### 實務練習
- 實作企業安全模式
- 建置全面監控方案
- 依規範部署生產環境

**💡 章節成果**：部署企業等級應用，具備完整生產能力

---

## 🎓 工作坊總覽：實作學習體驗

> **⚠️ 工作坊狀態：積極開發中**  
> 工作坊教材目前持續開發與調整中，核心模組已可使用，但部分進階內容尚未完成。我們正努力完善所有內容。[追蹤進度 →](workshop/README.md)

### 互動式工作坊教材
**藉由瀏覽器工具與引導練習，提供完整動手學習體驗**

工作坊教材提供結構化且互動的學習流程，與上方章節課程相輔相成。適合自學與講師帶領課程。

#### 🛠️ 工作坊特色
- **瀏覽器介面**：基於 MkDocs 完整工作坊平台，具備搜尋、複製與主題功能
- **GitHub Codespaces 整合**：一鍵快速建立開發環境
- **結構化學習路徑**：7 步驟引導練習（共3.5小時）
- **探索→部署→自訂**：循序漸進的方法論
- **互動式 DevContainer 環境**：預先配置工具與依賴

#### 📚 工作坊結構
透過 **探索→部署→自訂** 方法：

1. **探索階段**（45 分）  
   - 探索 Microsoft Foundry 範本與服務  
   - 了解多代理架構模式  
   - 檢視部署需求與前置作業

2. **部署階段**（2 小時）  
   - 實作 AZD 進行 AI 應用部署  
   - 配置 Azure AI 服務與端點  
   - 實作安全與認證模式

3. **自訂階段**（45 分）  
   - 修改應用對應特定場景  
   - 優化生產部署設定  
   - 加入監控與成本管理

#### 🚀 開始使用工作坊
```bash
# 選項 1：GitHub Codespaces（推薦）
# 在倉庫中點選「Code」→「Create codespace on main」

# 選項 2：本地開發
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 請依照 workshop/README.md 中的設置說明進行操作
```

#### 🎯 工作坊學習成果
完成工作坊後，學員將會：
- **部署生產 AI 應用**：使用 AZD 與 Microsoft Foundry 服務
- **精通多代理架構**：實作協作 AI 代理解決方案
- **實施安全最佳實務**：設定認證與存取控制
- **優化大規模部署**：設計成本效益與效能兼顧的方案
- **故障排除能力**：獨立解決常見部署問題

#### 📖 工作坊資源
- **🎥 互動導引**：[工作坊教材](workshop/README.md) - 瀏覽器學習環境
- **📋 詳細指引**：[引導練習](../../workshop/docs/instructions) - 詳細操作步驟
- **🛠️ AI 工作坊實驗室**：[AI 工作坊實驗室](docs/microsoft-foundry/ai-workshop-lab.md) - AI 專注練習
- **💡 快速入門**：[工作坊設定指南](workshop/README.md#quick-start) - 環境配置說明

**適用對象**：企業訓練、大學課程、自主學習與開發者集訓營。

---

## 📖 什麼是 Azure Developer CLI？

Azure Developer CLI (azd) 是一款以開發者為中心的指令介面，能快速構建與部署應用至 Azure。其提供：

- **基於範本的部署** - 使用常見應用範本快速上手
- **基礎建設即程式碼** - 使用 Bicep 或 Terraform 管理 Azure 資源  
- **整合工作流程** - 無縫完成資源配置、部署與監控
- **開發者友好** - 優化開發生產力與使用體驗

### **AZD + Microsoft Foundry：AI 部署理想組合**

**為何選擇 AZD 進行 AI 解決方案？** AZD 針對 AI 開發者面臨的挑戰提供解決方案：

- **AI 專用範本** - 預先配置 Azure OpenAI、認知服務與機器學習工作負載範本
- **安全 AI 部署** - AI 服務、API 金鑰與模型端點的內建安全模式  
- **生產 AI 模式** - 可擴展且成本效益高的部署最佳實務
- **端到端 AI 工作流程** - 從模型開發到生產部署暨監控完整流程
- **成本優化** - 聰明的資源配置與擴展策略
- **Microsoft Foundry 整合** - 無縫連結 Microsoft Foundry 模型目錄與端點

---

## 🎯 範本與範例庫

### 精選：Microsoft Foundry 範本
**部署 AI 應用時，從這裡開始！**

> **注意：** 這些範本示範多種 AI 模式。有些為外部 Azure 範例，有些是本地實作。

| 範本 | 章節 | 難度 | 服務 | 類型 |
|----------|---------|------------|----------|------|
| [**開始使用 AI 聊天**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI 推論 API + Azure AI 搜尋 + Azure Container Apps + Application Insights | 外部 |
| [**開始使用 AI 代理**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第2章 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI 搜尋 + Azure Container Apps + Application Insights| 外部 |
| [**Azure 搜尋 + OpenAI 示範**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI 搜尋 + 應用服務 + 儲存體 | 外部 |
| [**OpenAI 聊天應用快速入門**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso 聊天 RAG**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐⭐ | AzureOpenAI + AI 搜尋 + Cosmos DB + Container Apps | 外部 |
| [**零售多代理解決方案**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | AzureOpenAI + AI 搜尋 + 儲存體 + Container Apps + Cosmos DB | **本地** |

### 精選：完整學習案例
**對應學習章節的生產環境應用範本**

| 範本 | 學習章節 | 難度 | 主要學習 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | 基本 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | 以 Azure AI 搜尋實現 RAG |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第4章 | ⭐⭐ | 文件智慧整合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | 代理框架與函式呼叫 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐ | 企業 AI 協調 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | 多代理架構，含客戶與庫存代理 |

### 依範例類型學習

> **📌 本地與外部範例：**  
> **本地範例**（本倉庫內）= 可立即使用  
> **外部範例**（Azure Samples）= 複製自連結的開源專案

#### 本地範例（可立即使用）
- [**零售多代理解決方案**](examples/retail-scenario.md) - 完整生產可用實作與 ARM 範本
  - 多代理架構（客戶與庫存代理）
  - 全面監控與評估
  - 透過 ARM 範本一鍵部署

#### 本地範例 - 容器應用範例（第2-5章）
**本倉庫中的完整容器部署範例：**
- [**Container App 範例**](examples/container-app/README.md) - 容器化部署完整指南
  - [簡易 Flask API](../../examples/container-app/simple-flask-api) - 基礎 REST API，支援零規模
  - [微服務架構](../../examples/container-app/microservices) - 生產環境多服務部署
  - 快速入門、生產與進階部署模式
  - 監控、安全與成本優化指引

#### 外部範例 - 簡易應用（第1-2章）
**可透過 Azure Samples 複製以下專案開始：**
- [簡易網頁應用 - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基礎部署模式
- [靜態網站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 靜態內容部署
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署

#### 外部範例 - 資料庫整合（第3-4章）  
- [資料庫應用 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 資料庫連接模式
- [函式 + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 無伺服器資料工作流

#### 外部範例 - 進階模式（第4-8章）
- [Java 微服務](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服務架構
- [Container Apps 背景工作](https://github.com/Azure-Samples/container-apps-jobs) - 背景處理  
- [企業 ML 管線](https://github.com/Azure-Samples/mlops-v2) - 生產級 ML 模式

### 外部範本合集
- [**官方 AZD 範本庫**](https://azure.github.io/awesome-azd/) - 官方與社群精選範本
- [**Azure Developer CLI 範本**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 範本文件
- [**範例目錄**](examples/README.md) - 在地學習範例與詳細說明

---

## 📚 學習資源與參考

### 快速參考
- [**指令速查表**](resources/cheat-sheet.md) - 依章節整理的重要 azd 指令
- [**術語表**](resources/glossary.md) - Azure 與 azd 術語  
- [**常見問題集**](resources/faq.md) - 依學習章節整理的常見問題
- [**學習指南**](resources/study-guide.md) - 全面練習題目

### 實作工作坊
- [**AI 工作坊實驗室**](docs/microsoft-foundry/ai-workshop-lab.md) - 讓您的 AI 解決方案能以 AZD 部署（2-3 小時）
- [**互動式工作坊指南**](workshop/README.md) - 使用 MkDocs 與 DevContainer 瀏覽器式工作坊
- [**結構化學習路徑**](../../workshop/docs/instructions) - 7 步驟引導式練習（發現 → 部署 → 客製化）
- [**AZD 入門工作坊**](workshop/README.md) - 完整實作工作坊素材並支援 GitHub Codespaces 整合

### 外部學習資源
- [Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 價格計算工具](https://azure.microsoft.com/pricing/calculator/)
- [Azure 服務狀態](https://status.azure.com/)

---

## 🔧 快速故障排除指南

**初學者常遇問題與即時解決方案：**

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

### ❌ "No subscription found" 或 "Subscription not set"

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

### ❌ "InsufficientQuota" 或 "Quota exceeded"

```bash
# 嘗試不同的 Azure 區域
azd env set AZURE_LOCATION "westus2"
azd up

# 或在開發階段使用較小的 SKU
# 編輯 infra/main.parameters.json：
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" 執行至一半失敗

```bash
# 選項1：清理並重試
azd down --force --purge
azd up

# 選項2：僅修復基礎設施
azd provision

# 選項3：檢查詳細日誌
azd show
azd logs
```

### ❌ "Authentication failed" 或 "Token expired"

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
# AZD 會產生唯一名稱，但如果發生衝突：
azd down --force --purge

# 則重新嘗試使用新的環境
azd env new dev-v2
azd up
```

### ❌ 範本部署花費時間過長

**正常等待時間：**
- 簡單網頁應用：5-10 分鐘
- 附資料庫的應用：10-15 分鐘
- AI 應用：15-25 分鐘（OpenAI 預配較慢）

```bash
# 檢查進度
azd show

# 如果卡住超過30分鐘，請檢查 Azure 入口網站：
azd monitor
# 尋找失敗的部署
```

### ❌ "Permission denied" 或 "Forbidden"

```bash
# 檢查您的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 您至少需要「參與者」角色
# 請您的 Azure 管理員授予：
# - 參與者（資源用）
# - 使用者存取管理員（角色指派用）
```

### ❌ 找不到已部署應用的 URL

```bash
# 顯示所有服務端點
azd show

# 或打開 Azure 入口網站
azd monitor

# 檢查特定服務
azd env get-values
# 查找 *_URL 變數
```

### 📚 完整故障排除資源

- **常見問題指南：** [詳細解決方案](docs/troubleshooting/common-issues.md)
- **AI 專屬問題：** [AI 故障排除](docs/troubleshooting/ai-troubleshooting.md)
- **除錯指南：** [逐步除錯](docs/troubleshooting/debugging.md)
- **獲得協助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 快速故障排除指南

**初學者常遇問題與即時解決方案：**

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
<summary><strong>❌ "No subscription found" 或 "Subscription not set"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" 或 "Quota exceeded"</strong></summary>

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
<summary><strong>❌ "azd up" 執行至一半失敗</strong></summary>

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
<summary><strong>❌ "Authentication failed" 或 "Token expired"</strong></summary>

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
<summary><strong>❌ "Resource already exists" 或命名衝突</strong></summary>

```bash
# AZD 會生成唯一名稱，但如果發生衝突：
azd down --force --purge

# 則使用全新環境重試
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 範本部署花費時間過長</strong></summary>

**正常等待時間：**
- 簡單網頁應用：5-10 分鐘
- 附資料庫的應用：10-15 分鐘
- AI 應用：15-25 分鐘（OpenAI 預配較慢）

```bash
# 檢查進度
azd show

# 如果卡住超過30分鐘，請檢查 Azure 入口網站：
azd monitor
# 尋找失敗的部署
```
</details>

<details>
<summary><strong>❌ "Permission denied" 或 "Forbidden"</strong></summary>

```bash
# 檢查您的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 您至少需要「貢獻者」角色
# 請求您的 Azure 管理員授予：
# - 貢獻者（用於資源）
# - 使用者存取管理員（用於角色指派）
```
</details>

<details>
<summary><strong>❌ 找不到已部署應用的 URL</strong></summary>

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
- **獲得協助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 課程完成與認證

### 進度追蹤
追蹤您每章的學習進度：

- [ ] **第一章**：基礎與快速入門 ✅
- [ ] **第二章**：AI 為先的開發 ✅  
- [ ] **第三章**：設定與驗證 ✅
- [ ] **第四章**：基礎設施即程式碼與部署 ✅
- [ ] **第五章**：多代理 AI 解決方案 ✅
- [ ] **第六章**：部署前驗證與規劃 ✅
- [ ] **第七章**：故障排除與除錯 ✅
- [ ] **第八章**：生產環境與企業模式 ✅

### 學習驗證
完成每章後，通過以下驗證所學知識：
1. **實作練習**：完成該章的實務部署
2. **知識檢核**：回顧該章的 FAQ 區段
3. **社群討論**：在 Azure Discord 分享經驗
4. **進入下一章**：邁向更高難度

### 課程完成效益
完成全章後，您將具備：
- **實務經驗**：將真實 AI 應用部署到 Azure
- **專業技能**：企業級部署能力  
- **社群認可**：成為 Azure 開發者社群活躍會員
- **職涯發展**：掌握熱門 AZD 與 AI 部署專長

---

## 🤝 社群與支援

### 獲得協助與支援
- **技術問題**：[回報錯誤與功能需求](https://github.com/microsoft/azd-for-beginners/issues)
- **學習問題**：[Microsoft Azure Discord 社群](https://discord.gg/microsoft-azure) 與 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 專屬支援**：加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **文件資源**：[官方 Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord 社群洞察

**#Azure 頻道最新投票結果：**
- **45%** 的開發者希望使用 AZD 進行 AI 工作負載
- **主要挑戰**：多服務部署、憑證管理、生產環境準備  
- **最高需求**：AI 專屬範本、故障排除指南、最佳實務

**加入我們的社群，即可：**
- 分享您的 AZD + AI 經驗並獲得協助
- 搶先取得 AI 範本預覽版
- 共同制定 AI 部署最佳實務
- 影響未來 AI + AZD 功能開發方向

### 對課程的貢獻
歡迎投稿！請參閱我們的 [貢獻指南](CONTRIBUTING.md) 深入了解：
- **內容改善**：強化現有章節與範例
- **新增範例**：提供真實場景與範本  
- **翻譯支援**：協助維護多語系支持
- **錯誤回報**：提升準確性與清晰度
- **社群準則**：遵從包容的社群規範

---

## 📄 課程資訊

### 授權條款
本專案採用 MIT 授權條款，詳情請參考 [LICENSE](../../LICENSE) 檔案。

### 相關 Microsoft 學習資源

我們團隊還提供其他完整的學習課程：

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j 入門](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js 入門](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

---

### Azure / 邊緣 / MCP / 代理人
[![AZD 入門](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![邊緣 AI 入門](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP 入門](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI 代理人入門](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### 生成式 AI 系列
[![生成式 AI 入門](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### 核心學習
[![機器學習入門](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![數據科學入門](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![初學者專用 AI](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![初學者專用網路安全](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![初學者專用網站開發](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![初學者專用物聯網](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![初學者專用 XR 開發](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot 系列
[![AI 配對編程的 Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET 的 Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot 冒險](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ 課程導覽

**🚀 準備好開始學習了嗎？**

**初學者**：從 [第一章：基礎與快速入門](../..) 開始  
**AI 開發者**：跳到 [第二章：AI 優先開發](../..)  
**有經驗的開發者**：從 [第三章：設定與驗證](../..) 開始

**下一步**：[開始第一章 - AZD 基礎](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意自動翻譯可能存在錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議聘請專業人工翻譯。因使用本翻譯所產生的任何誤解或誤釋，我們概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->