<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6d5c886052b605349d9219cea5f2f6a1",
  "translation_date": "2026-01-16T09:00:02+00:00",
  "source_file": "README.md",
  "language_code": "mo"
}
-->
# AZD 初學者指南：結構化學習歷程

![AZD-for-beginners](../../../../translated_images/zh-MO/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## 開始這個課程

按照以下步驟開始你的 AZD 學習之旅：

1. **Fork 這個倉庫**：點擊 [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone 這個倉庫**：`git clone https://github.com/microsoft/azd-for-beginners.git`
3. **加入社區**：參加 [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) 獲得專家支援
4. **選擇你的學習路徑**：從以下章節中選擇符合你經驗水平的內容

### 多語言支援

#### 自動翻譯（保持最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[阿拉伯語](../ar/README.md) | [孟加拉語](../bn/README.md) | [保加利亞語](../bg/README.md) | [緬甸語（Myanmar）](../my/README.md) | [中文（簡體）](../zh/README.md) | [中文（繁體，香港）](../hk/README.md) | [中文（繁體，澳門）](./README.md) | [中文（繁體，台灣）](../tw/README.md) | [克羅地亞語](../hr/README.md) | [捷克語](../cs/README.md) | [丹麥語](../da/README.md) | [荷蘭語](../nl/README.md) | [愛沙尼亞語](../et/README.md) | [芬蘭語](../fi/README.md) | [法語](../fr/README.md) | [德語](../de/README.md) | [希臘語](../el/README.md) | [希伯來語](../he/README.md) | [印地語](../hi/README.md) | [匈牙利語](../hu/README.md) | [印尼語](../id/README.md) | [義大利語](../it/README.md) | [日語](../ja/README.md) | [坎納達語](../kn/README.md) | [韓語](../ko/README.md) | [立陶宛語](../lt/README.md) | [馬來語](../ms/README.md) | [馬拉雅拉姆語](../ml/README.md) | [馬拉地語](../mr/README.md) | [尼泊爾語](../ne/README.md) | [尼日利亞皮欽語](../pcm/README.md) | [挪威語](../no/README.md) | [波斯語（法爾西語）](../fa/README.md) | [波蘭語](../pl/README.md) | [葡萄牙語（巴西）](../br/README.md) | [葡萄牙語（葡萄牙）](../pt/README.md) | [旁遮普語（詹姆赫體）](../pa/README.md) | [羅馬尼亞語](../ro/README.md) | [俄語](../ru/README.md) | [塞爾維亞語（西里爾字母）](../sr/README.md) | [斯洛伐克語](../sk/README.md) | [斯洛維尼亞語](../sl/README.md) | [西班牙語](../es/README.md) | [斯瓦希里語](../sw/README.md) | [瑞典語](../sv/README.md) | [他加祿語（菲律賓語）](../tl/README.md) | [泰米爾語](../ta/README.md) | [泰盧固語](../te/README.md) | [泰語](../th/README.md) | [土耳其語](../tr/README.md) | [烏克蘭語](../uk/README.md) | [烏爾都語](../ur/README.md) | [越南語](../vi/README.md)

> **想要本地 Clone？**

> 本倉庫包含 50 多種語言翻譯，會顯著增加下載大小。若想不含翻譯克隆，請使用稀疏簽出：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 這樣你就能獲得完成課程所需的所有內容，下載速度更快。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 課程概覽

透過設計良好的章節，系統學習 Azure Developer CLI（azd），逐步掌握核心技能。**特別專注於結合 Microsoft Foundry 的 AI 應用部署。**

### 為什麼現代開發者需要這門課程

根據 Microsoft Foundry Discord 社群的洞察，**45% 的開發者想用 AZD 進行 AI 工作負載**，但面臨以下挑戰：
- 複雜的多服務 AI 架構
- AI 生產部署最佳實踐  
- Azure AI 服務整合與配置
- AI 運算成本最佳化
- AI 特定部署問題的故障排除

### 學習目標

完成此結構化課程後，您將會：
- **精通 AZD 基礎**：核心概念、安裝與配置
- **部署 AI 應用**：結合 Microsoft Foundry 服務使用 AZD 部署 AI
- **實現基礎設施即代碼**：使用 Bicep 模板管理 Azure 資源
- **故障排查部署問題**：解決常見錯誤及除錯
- **優化生產環境**：安全性、擴展、監控與成本管理
- **打造多代理 AI 解決方案**：部署複雜 AI 架構

## 📚 學習章節

*根據經驗和目標選擇你的學習路徑*

### 🚀 第一章：基礎與快速入門
**先決條件**：Azure 訂閱、基本指令行知識  
**時間長度**：30-45 分鐘  
**難度**：⭐

#### 學習內容
- 了解 Azure Developer CLI 基礎
- 在你的平台上安裝 AZD
- 第一次成功部署

#### 學習資源
- **🎯 起點**：[什麼是 Azure Developer CLI？](../..)
- **📖 理論**：[AZD 基本概念](docs/getting-started/azd-basics.md) - 核心概念與術語
- **⚙️ 安裝**：[安裝與設定](docs/getting-started/installation.md) - 平台專屬指南
- **🛠️ 實作**：[你的第一個專案](docs/getting-started/first-project.md) - 按步驟教學
- **📋 速查**：[指令備忘](resources/cheat-sheet.md)

#### 實務演練
```bash
# 快速安裝檢查
azd version

# 部署你的第一個應用程式
azd init --template todo-nodejs-mongo
azd up
```

**💡 章節成果**：使用 AZD 成功部署一個簡單的網頁應用到 Azure

**✅ 成功驗證：**
```bash
# 完成第一章後，你應該能夠：
azd version              # 顯示已安裝的版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署到 Azure
azd show                # 顯示正在運行的應用程式網址
# 應用程式在瀏覽器中開啟並正常運作
azd down --force --purge  # 清理資源
```

**📊 時間投資：** 30-45 分鐘  
**📈 完成後技能水平：** 能夠獨立部署基本應用

**✅ 成功驗證：**
```bash
# 完成第一章後，您應該能夠：
azd version              # 顯示已安裝版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署到 Azure
azd show                # 顯示執行中應用程式的網址
# 應用程式在瀏覽器中開啟並運作正常
azd down --force --purge  # 清理資源
```

**📊 時間投資：** 30-45 分鐘  
**📈 完成後技能水平：** 能夠獨立部署基本應用

---

### 🤖 第二章：AI 為先的開發（建議 AI 開發者）
**先決條件**：完成第一章  
**時間長度**：1-2 小時  
**難度**：⭐⭐

#### 學習內容
- 使用 AZD 與 Microsoft Foundry 整合
- 部署 AI 驅動的應用
- 了解 AI 服務配置

#### 學習資源
- **🎯 起點**：[Microsoft Foundry 整合](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 模式**：[AI 模型部署](docs/microsoft-foundry/ai-model-deployment.md) - 部署與管理 AI 模型
- **🛠️ 工作坊**：[AI 工作坊實驗室](docs/microsoft-foundry/ai-workshop-lab.md) - 讓你的 AI 解決方案適合 AZD
- **🎥 互動指引**：[工作坊資源](workshop/README.md) - 使用 MkDocs 與 DevContainer 瀏覽器學習環境
- **📋 模板**：[Microsoft Foundry 範本](../..)
- **📝 範例**：[AZD 部署範例](examples/README.md)

#### 實務演練
```bash
# 部署你嘅第一個AI應用程式
azd init --template azure-search-openai-demo
azd up

# 嘗試更多AI範本
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 章節成果**：部署並配置具備 RAG 功能的 AI 驅動聊天應用

**✅ 成功驗證：**
```bash
# 完成第二章後，您應該能夠：
azd init --template azure-search-openai-demo
azd up
# 測試 AI 聊天界面
# 提問並獲得具來源的 AI 驅動回應
# 驗證搜尋整合是否有效
azd monitor  # 檢查 Application Insights 是否顯示遙測數據
azd down --force --purge
```

**📊 時間投資：** 1-2 小時  
**📈 完成後技能水平：** 能部署並配置生產等級 AI 應用  
**💰 成本認知：** 了解開發成本約 80-150 美元/月，生產成本約 300-3500 美元/月

#### 💰 AI 部署成本考量

**開發環境（預估 80-150 美元/月）：**
- Azure OpenAI（按量付費）：0-50 美元/月（依 token 使用量計）
- AI 搜尋（基礎層）：75 美元/月
- 容器應用（消耗量計費）：0-20 美元/月
- 儲存體（標準）：1-5 美元/月

**生產環境（預估 300-3500+ 美元/月）：**
- Azure OpenAI（PTU 保持穩定效能）：3000+ 美元/月 或高流量按量付費
- AI 搜尋（標準層）：250 美元/月
- 容器應用（專屬）：50-100 美元/月
- Application Insights：5-50 美元/月
- 儲存體（高級）：10-50 美元/月

**💡 成本優化建議：**
- 使用 **免費層** Azure OpenAI 學習（每月包含 50,000 tokens）
- 不開發時執行 `azd down` 解分配資源
- 切換消耗量計費，生產再升級到 PTU
- 部署前用 `azd provision --preview` 估算成本
- 啟用自動擴展，僅按實際用量付費

**成本監控：**
```bash
# 檢查預估每月成本
azd provision --preview

# 在 Azure 入口網站監控實際成本
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第三章：設定與驗證
**先決條件**：完成第一章  
**時間長度**：45-60 分鐘  
**難度**：⭐⭐

#### 學習內容
- 環境配置與管理
- 認證與安全最佳實踐
- 資源命名與組織規劃

#### 學習資源
- **📖 配置**：[配置指南](docs/getting-started/configuration.md) - 環境設定
- **🔐 安全**：[認證模式與受管身分](docs/getting-started/authsecurity.md) - 認證方法
- **📝 範例**：[資料庫應用範例](examples/database-app/README.md) - AZD 資料庫範例

#### 實務演練
- 配置多個環境（開發、預備、正式）
- 設定受管身分認證
- 實作環境特定配置

**💡 章節成果**：妥善管理多個環境並完成驗證與安全設定

---

### 🏗️ 第四章：基礎設施即代碼與部署
**先決條件**：完成第一至三章  
**時間長度**：1-1.5 小時  
**難度**：⭐⭐⭐

#### 學習內容
- 進階部署模式
- 使用 Bicep 的基礎設施即代碼
- 資源佈建策略

#### 學習資源
- **📖 部署**：[部署指南](docs/deployment/deployment-guide.md) - 完整工作流程
- **🏗️ 佈建**：[資源佈建](docs/deployment/provisioning.md) - Azure 資源管理
- **📝 範例**：[容器應用範例](../../examples/container-app) - 容器化部署

#### 實務演練
- 建立自訂 Bicep 模板
- 部署多服務應用
- 實作藍綠部署策略

**💡 章節成果**：利用自訂基礎設施模板部署複雜多服務應用

---

### 🎯 第五章：多代理 AI 解決方案（進階）
**先決條件**：完成第一與第二章  
**時間長度**：2-3 小時  
**難度**：⭐⭐⭐⭐

#### 學習內容
- 多代理架構模式
- 代理協調與編排
- 生產環境就緒的 AI 部署

#### 學習資源
- **🤖 精選專案**: [零售多代理解決方案](examples/retail-scenario.md) - 完整實作
- **🛠️ ARM 範本**: [ARM 範本套件](../../examples/retail-multiagent-arm-template) - 一鍵部署
- **📖 架構**: [多代理協調模式](/docs/pre-deployment/coordination-patterns.md) - 模式

#### 實作練習
```bash
# 部署完整嘅零售多代理解決方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索代理配置
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 章節結果**: 部署與管理一個生產環境就緒的多代理 AI 解決方案，包含客戶與庫存代理

---

### 🔍 第6章：部署前驗證與規劃
**先決條件**：完成第4章  
**時長**：1小時  
**難度**：⭐⭐

#### 你將學習
- 容量規劃與資源驗證
- SKU 選擇策略
- 預檢查與自動化

#### 學習資源
- **📊 規劃**：[容量規劃](docs/pre-deployment/capacity-planning.md) - 資源驗證
- **💰 選擇**：[SKU 選擇](docs/pre-deployment/sku-selection.md) - 成本效益選項
- **✅ 驗證**：[部署前檢查](docs/pre-deployment/preflight-checks.md) - 自動化腳本

#### 實作練習
- 執行容量驗證腳本
- 優化 SKU 選擇以降低成本
- 實作自動化部署前檢查

**💡 章節結果**：於執行前驗證與優化部署

---

### 🚨 第7章：故障排除與除錯
**先決條件**：完成任一部署章節  
**時長**：1-1.5小時  
**難度**：⭐⭐

#### 你將學習
- 系統化的除錯方法
- 常見問題與解決方案
- AI 專屬故障排除技巧

#### 學習資源
- **🔧 常見問題**：[常見問題](docs/troubleshooting/common-issues.md) - FAQ 與解決方案
- **🕵️ 除錯**：[除錯指南](docs/troubleshooting/debugging.md) - 分步策略
- **🤖 AI 問題**：[AI 專屬故障排除](docs/troubleshooting/ai-troubleshooting.md) - AI 服務問題

#### 實作練習
- 診斷部署失敗原因
- 解決驗證問題
- 除錯 AI 服務連線

**💡 章節結果**：獨立診斷與解決常見部署問題

---

### 🏢 第8章：生產與企業模式
**先決條件**：完成第1-4章  
**時長**：2-3小時  
**難度**：⭐⭐⭐⭐

#### 你將學習
- 生產環境部署策略
- 企業安全模式
- 監控與成本優化

#### 學習資源
- **🏭 生產環境**：[生產 AI 最佳實務](docs/microsoft-foundry/production-ai-practices.md) - 企業模式
- **📝 範例**：[微服務範例](../../examples/microservices) - 複雜架構
- **📊 監控**：[Application Insights 整合](docs/pre-deployment/application-insights.md) - 監控

#### 實作練習
- 實作企業安全模式
- 建立完整監控系統
- 以適當治理部署生產環境

**💡 章節結果**：部署具備完整生產能力的企業級應用程式

---

## 🎓 工作坊總覽：實作學習體驗

> **⚠️ 工作坊狀態：積極開發中**  
> 工作坊教材正持續開發與優化中。核心模組已具功能，但部分進階章節尚未完成。我們正積極補齊所有內容。[追蹤進度 →](workshop/README.md)

### 互動工作坊教材
**完整的瀏覽器基礎工具與引導練習**

我們的工作坊教材提供結構化且互動的學習體驗，搭配上述章節課程設計。工作坊適用於自學與教師引導的教學模式。

#### 🛠️ 工作坊特色
- **瀏覽器介面**：完整 MkDocs 支援的工作坊，含搜尋、複製及主題功能
- **GitHub Codespaces 整合**：一鍵設定開發環境
- **結構化學習路徑**：7步導引練習（共3.5小時）
- **探索 → 部署 → 自訂**：循序漸進流程
- **互動 DevContainer 環境**：預先配置工具與相依性

#### 📚 工作坊架構
工作坊遵循 **探索 → 部署 → 自訂** 流程：

1. **探索階段**（45分鐘）  
   - 探索 Microsoft Foundry 範本與服務  
   - 了解多代理架構模式  
   - 回顧部署需求與先決條件  

2. **部署階段**（2小時）  
   - 使用 AZD 實作 AI 應用部署  
   - 設定 Azure AI 服務與端點  
   - 實作安全與驗證模式  

3. **自訂階段**（45分鐘）  
   - 修改應用以符合特定案例  
   - 優化生產部署設定  
   - 實作監控與成本管理  

#### 🚀 工作坊快速開始
```bash
# 選項 1：GitHub Codespaces（推薦）
# 喺儲存庫入面撳「代碼」→「喺 main 創建 codespace」

# 選項 2：本地開發
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 按 workshop/README.md 入面嘅設置指示操作
```

#### 🎯 工作坊學習成果
完成工作坊後，參與者將能：
- **部署生產級 AI 應用**：使用 AZD 搭配 Microsoft Foundry 服務  
- **掌握多代理架構**：實作協調的 AI 代理解決方案  
- **實施安全最佳實務**：設定驗證與存取控管  
- **最佳化擴展能力**：設計成本效益高且效能佳的部署  
- **故障排除**：獨立解決常見部署問題  

#### 📖 工作坊資源
- **🎥 互動指南**：[工作坊教材](workshop/README.md) - 瀏覽器學習環境  
- **📋 詳細步驟**：[引導練習](../../workshop/docs/instructions) - 詳細操作說明  
- **🛠️ AI 工作坊實驗室**：[AI 工作坊實驗室](docs/microsoft-foundry/ai-workshop-lab.md) - AI 專注練習  
- **💡 快速入門**：[工作坊設定指南](workshop/README.md#quick-start) - 環境配置  

**適合對象**：企業培訓、大學課程、自主學習與開發者訓練營。

---

## 📖 什麼是 Azure Developer CLI？

Azure Developer CLI (azd) 是專為開發者設計的指令列介面，加速於 Azure 上構建及部署應用程式的流程。其提供：

- **範本式部署** - 使用預先建置的範本實作常見應用模式  
- **基礎設施即程式碼** - 採用 Bicep 或 Terraform 管理 Azure 資源  
- **整合式工作流程** - 無縫供應、部署及監控應用  
- **開發者友善** - 優化開發效率與使用體驗  

### **AZD + Microsoft Foundry：AI 部署的完美組合**

**為何選擇 AZD 用於 AI 解決方案？** AZD 解決 AI 開發者主要挑戰：

- **AI 就緒範本** - 為 Azure OpenAI、認知服務及 ML 工作負載預設配置
- **安全 AI 部署** - 內建 AI 服務、API 金鑰與模型端點的安全模式
- **生產 AI 範式** - 可擴展且成本效益高的 AI 應用部署最佳實務
- **端對端 AI 工作流** - 從模型開發到生產部署，並具監控管理
- **成本優化** - 智慧資源分配與擴展策略
- **Microsoft Foundry 整合** - 無縫連接 Microsoft Foundry 模型目錄與端點

---

## 🎯 範本與範例資料庫

### 精選：Microsoft Foundry 範本
**如果你要部署 AI 應用，從這裡開始！**

> **注意：** 這些範本展示各種 AI 模式。有些為外部 Azure 範例，有些為本地實作。

| 範本 | 章節 | 難度 | 服務 | 類型 |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | 外部 |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第2章 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| 外部 |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | 外部 |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | 外部 |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **本地** |

### 精選：完整學習情境
**映射至學習章節的生產就緒應用範本**

| 範本 | 學習章節 | 難度 | 主要學習內容 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | 基本 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | 使用 Azure AI Search 實作 RAG |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第4章 | ⭐⭐ | 文件智能整合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | 代理框架與函式呼叫 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐ | 企業級 AI 協調 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | 含客戶與庫存代理的多代理架構 |

### 依範例類型學習

> **📌 本地範例與外部範例：**  
> **本地範例**（本倉庫中）= 可立即使用  
> **外部範例**（Azure 範例）= 從連結倉庫克隆下載

#### 本地範例（可立即使用）
- [**零售多代理解決方案**](examples/retail-scenario.md) - 完整生產就緒實作含 ARM 範本  
  - 多代理架構（客戶代理 + 庫存代理）  
  - 全面監控與評估  
  - 一鍵 ARM 範本部署

#### 本地範例 - 容器應用（第2-5章）
**本倉庫中完整的容器部署範例：**
- [**容器應用範例**](examples/container-app/README.md) - 容器化部署完全指南  
  - [簡單 Flask API](../../examples/container-app/simple-flask-api) - 基本 REST API，支援縮放至零  
  - [微服務架構](../../examples/container-app/microservices) - 生產就緒的多服務部署  
  - 快速啟動、生產及進階部署模式  
  - 監控、安全與成本優化指引

#### 外部範例 - 簡單應用（第1-2章）
**克隆以下 Azure 範例倉庫開始：**
- [簡單網頁應用 - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本部署模式  
- [靜態網站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 靜態內容部署  
- [容器應用 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署  

#### 外部範例 - 資料庫整合（第3-4章）  
- [資料庫應用 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 資料庫連接模式  
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 無伺服器資料工作流程  

#### 外部範例 - 進階模式（第4-8章）
- [Java 微服務](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服務架構  
- [容器應用任務](https://github.com/Azure-Samples/container-apps-jobs) - 背景作業  
- [企業 ML 管線](https://github.com/Azure-Samples/mlops-v2) - 生產就緒的 ML 模式

### 外部範本收藏
- [**官方 AZD 範本集**](https://azure.github.io/awesome-azd/) - 官方與社群範本精選  
- [**Azure Developer CLI 範本**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 範本文件  
- [**範例目錄**](examples/README.md) - 本地學習範例與詳細說明

---

## 📚 學習資源及參考資料

### 快速參考
- [**指令速查表**](resources/cheat-sheet.md) - 依章節組織的必備 azd 指令
- [**詞彙表**](resources/glossary.md) - Azure 與 azd 術語  
- [**常見問答**](resources/faq.md) - 按學習章節整理的常見問題
- [**學習指南**](resources/study-guide.md) - 全面實作練習題

### 實作工作坊
- [**AI 工作坊實驗室**](docs/microsoft-foundry/ai-workshop-lab.md) - 讓你的 AI 解決方案可由 AZD 部署（2-3 小時）
- [**互動式工作坊指南**](workshop/README.md) - 基於瀏覽器的工作坊，搭配 MkDocs 與 DevContainer 環境
- [**結構化學習路徑**](../../workshop/docs/instructions) - 7 步驟引導練習（探索 → 部署 → 客製化）
- [**AZD 初學者工作坊**](workshop/README.md) - 完整動手操作工作坊教材，整合 GitHub Codespaces

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

# 設定為 AZD 環境
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# 驗證
az account show
```

### ❌ "InsufficientQuota" or "Quota exceeded"

```bash
# 嘗試不同的 Azure 地區
azd env set AZURE_LOCATION "westus2"
azd up

# 或在開發時使用較小的 SKU
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
# AZD 會產生獨特嘅名稱，但如果有衝突：
azd down --force --purge

# 就會用新嘅環境重試
azd env new dev-v2
azd up
```

### ❌ Template deployment taking too long

**正常等待時間：**
- 簡單網頁應用：5-10 分鐘
- 含資料庫的應用：10-15 分鐘
- AI 應用：15-25 分鐘（OpenAI 配置較慢）

```bash
# 檢查進度
azd show

# 如果卡住超過30分鐘，檢查Azure門戶：
azd monitor
# 尋找失敗的部署
```

### ❌ "Permission denied" or "Forbidden"

```bash
# 檢查你的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 你至少需要「貢獻者」角色
# 請你的 Azure 管理員授予：
# - 貢獻者（用於資源）
# - 使用者存取管理員（用於角色分配）
```

### ❌ Can't find deployed application URL

```bash
# 顯示所有服務端點
azd show

# 或開啟 Azure 入口網站
azd monitor

# 檢查特定服務
azd env get-values
# 尋找 *_URL 變數
```

### 📚 完整故障排除資源

- **常見問題指南：** [詳細解決方案](docs/troubleshooting/common-issues.md)
- **AI 專屬問題：** [AI 故障排除](docs/troubleshooting/ai-troubleshooting.md)
- **除錯指南：** [逐步除錯](docs/troubleshooting/debugging.md)
- **尋求幫助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

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

# 設定為 AZD 環境
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# 驗證
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# 嘗試不同嘅 Azure 區域
azd env set AZURE_LOCATION "westus2"
azd up

# 或喺開發時用細啲嘅 SKU
# 編輯 infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# 選項 1：清除並重試
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
# AZD 會生成獨特的名稱，但如果有衝突：
azd down --force --purge

# 則使用新的環境重試
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**正常等待時間：**
- 簡單網頁應用：5-10 分鐘
- 含資料庫的應用：10-15 分鐘
- AI 應用：15-25 分鐘（OpenAI 配置較慢）

```bash
# 檢查進度
azd show

# 如果停滯超過30分鐘，檢查 Azure 入口網站：
azd monitor
# 查找失敗的部署
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# 檢查你的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 你至少需要「貢獻者」角色
# 請你的 Azure 管理員授予：
# - 貢獻者（針對資源）
# - 使用者存取管理員（針對角色指派）
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# 顯示所有服務端點
azd show

# 或打開 Azure 入口網站
azd monitor

# 檢查特定服務
azd env get-values
# 搜尋 *_URL 變量
```
</details>

### 📚 完整故障排除資源

- **常見問題指南：** [詳細解決方案](docs/troubleshooting/common-issues.md)
- **AI 專屬問題：** [AI 故障排除](docs/troubleshooting/ai-troubleshooting.md)
- **除錯指南：** [逐步除錯](docs/troubleshooting/debugging.md)
- **尋求幫助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 課程完成與認證

### 進度追蹤
追蹤您每章節的學習進度：

- [ ] **第 1 章**：基礎與快速開始 ✅
- [ ] **第 2 章**：AI 優先開發 ✅  
- [ ] **第 3 章**：設定與驗證 ✅
- [ ] **第 4 章**：基礎建設即代碼與部署 ✅
- [ ] **第 5 章**：多代理 AI 解決方案 ✅
- [ ] **第 6 章**：部署前驗證與規劃 ✅
- [ ] **第 7 章**：故障排除與除錯 ✅
- [ ] **第 8 章**：生產與企業模式 ✅

### 學習驗證
完成每章後，檢驗您的學習成果：
1. **實作練習**：完成該章的動手部署
2. **知識測驗**：查看該章的常見問答部分
3. **社群討論**：於 Azure Discord 分享您的體驗
4. **下一章**：進入下一難度等級

### 課程完成好處
完成所有章節後，您將擁有：
- **生產經驗**：已在 Azure 部署真實的 AI 應用
- **專業技能**：具備企業級部署能力  
- **社群認可**：成為積極參與的 Azure 開發者社群成員
- **職涯提升**：備受矚目的 AZD 與 AI 部署專長

---

## 🤝 社群與支援

### 尋求幫助與支援
- **技術問題**： [回報錯誤與功能請求](https://github.com/microsoft/azd-for-beginners/issues)
- **學習問題**： [Microsoft Azure Discord 社群](https://discord.gg/microsoft-azure) 與 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 專門幫助**： 加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **文件**：[官方 Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord 社群洞察

**#Azure 頻道近期調查結果：**
- **45%** 開發者想用 AZD 作 AI 工作負載
- **主要挑戰**：多服務部署、憑證管理、生產就緒  
- **最多需求**：AI 專用範本、故障排除指南、最佳實踐

**加入我們的社群來：**
- 分享您的 AZD + AI 經驗並獲得協助
- 搶先使用新 AI 範本預覽
- 參與 AI 部署最佳實踐的建立
- 影響未來 AI + AZD 功能開發

### 為課程貢獻
我們歡迎您的貢獻！請閱讀我們的 [貢獻指南](CONTRIBUTING.md) 瞭解詳情：
- **內容改進**：優化現有章節與範例
- **新增範例**：加入真實應用場景與範本  
- **翻譯**：協助維護多語言支援
- **錯誤回報**：提升準確性與清晰度
- **社群準則**：遵守包容性社群規範

---

## 📄 課程資訊

### 授權條款
本專案採用 MIT 授權條款，詳情請見 [LICENSE](../../LICENSE) 文件。

### 相關 Microsoft 學習資源

我們的團隊還製作其他完整的學習課程：

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

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

## 🗺️ 課程導覽

**🚀 準備好開始學習了嗎？**

**初學者**：從[第 1 章：基礎與快速入門](../..)開始  
**AI 開發者**：直接跳到[第 2 章：AI 為先的開發](../..)  
**有經驗的開發者**：從[第 3 章：設定與驗證](../..)開始

**下一步**：[開始第 1 章 - AZD 基礎](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件係使用人工智能翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 所翻譯。雖然我們致力於確保準確性，但請注意自動翻譯可能存在錯誤或不準確之處。應以文件原文為準，作為權威資料來源。對於重要資訊，建議採用專業人工翻譯。我們對因使用本翻譯而引致的任何誤解或誤釋不承擔任何責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->