<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b2e94dc30cab0675918a6ad34863b05d",
  "translation_date": "2025-11-20T08:27:34+00:00",
  "source_file": "README.md",
  "language_code": "mo"
}
-->
# AZD 初學者指南：結構化學習旅程

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.mo.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## 開始學習這門課程

按照以下步驟開始您的 AZD 學習旅程：

1. **Fork 儲存庫**：點擊 [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone 儲存庫**：`git clone https://github.com/microsoft/azd-for-beginners.git`
3. **加入社群**：[Azure Discord 社群](https://discord.com/invite/ByRwuEEgH4) 獲取專家支援
4. **選擇您的學習路徑**：根據您的經驗水平選擇以下章節

### 多語言支援

#### 自動翻譯（始終保持最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[阿拉伯文](../ar/README.md) | [孟加拉文](../bn/README.md) | [保加利亞文](../bg/README.md) | [緬甸文](../my/README.md) | [中文（簡體）](../zh/README.md) | [中文（繁體，香港）](../hk/README.md) | [中文（繁體，澳門）](./README.md) | [中文（繁體，台灣）](../tw/README.md) | [克羅埃西亞文](../hr/README.md) | [捷克文](../cs/README.md) | [丹麥文](../da/README.md) | [荷蘭文](../nl/README.md) | [愛沙尼亞文](../et/README.md) | [芬蘭文](../fi/README.md) | [法文](../fr/README.md) | [德文](../de/README.md) | [希臘文](../el/README.md) | [希伯來文](../he/README.md) | [印地文](../hi/README.md) | [匈牙利文](../hu/README.md) | [印尼文](../id/README.md) | [意大利文](../it/README.md) | [日文](../ja/README.md) | [韓文](../ko/README.md) | [立陶宛文](../lt/README.md) | [馬來文](../ms/README.md) | [馬拉地文](../mr/README.md) | [尼泊爾文](../ne/README.md) | [挪威文](../no/README.md) | [波斯文](../fa/README.md) | [波蘭文](../pl/README.md) | [葡萄牙文（巴西）](../br/README.md) | [葡萄牙文（葡萄牙）](../pt/README.md) | [旁遮普文](../pa/README.md) | [羅馬尼亞文](../ro/README.md) | [俄文](../ru/README.md) | [塞爾維亞文（西里爾字母）](../sr/README.md) | [斯洛伐克文](../sk/README.md) | [斯洛文尼亞文](../sl/README.md) | [西班牙文](../es/README.md) | [斯瓦希里文](../sw/README.md) | [瑞典文](../sv/README.md) | [塔加洛文](../tl/README.md) | [泰米爾文](../ta/README.md) | [泰文](../th/README.md) | [土耳其文](../tr/README.md) | [烏克蘭文](../uk/README.md) | [烏爾都文](../ur/README.md) | [越南文](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 課程概述

透過結構化章節掌握 Azure Developer CLI (azd)，逐步學習。**特別聚焦於使用 Microsoft Foundry 整合進行 AI 應用程式部署。**

### 為什麼這門課程對現代開發者至關重要

根據 Microsoft Foundry Discord 社群的洞察，**45% 的開發者希望使用 AZD 進行 AI 工作負載**，但面臨以下挑戰：
- 複雜的多服務 AI 架構
- 生產環境 AI 部署最佳實踐  
- Azure AI 服務整合與配置
- AI 工作負載的成本優化
- 解決 AI 特定部署問題

### 學習目標

完成這門結構化課程後，您將能夠：
- **掌握 AZD 基礎知識**：核心概念、安裝與配置
- **部署 AI 應用程式**：使用 AZD 與 Microsoft Foundry 服務
- **實現基礎設施即代碼**：使用 Bicep 模板管理 Azure 資源
- **解決部署問題**：解決常見問題並進行故障排除
- **優化生產環境**：安全性、擴展性、監控與成本管理
- **構建多代理解決方案**：部署複雜的 AI 架構

## 📚 學習章節

*根據經驗水平和目標選擇您的學習路徑*

### 🚀 第一章：基礎與快速入門
**先決條件**：Azure 訂閱，基本命令行知識  
**時長**：30-45 分鐘  
**難度**：⭐

#### 您將學到的內容
- 了解 Azure Developer CLI 的基礎知識
- 在您的平台上安裝 AZD
- 完成您的首次成功部署

#### 學習資源
- **🎯 從這裡開始**：[什麼是 Azure Developer CLI？](../..)
- **📖 理論**：[AZD 基礎知識](docs/getting-started/azd-basics.md) - 核心概念與術語
- **⚙️ 設置**：[安裝與設置](docs/getting-started/installation.md) - 平台特定指南
- **🛠️ 實踐**：[您的第一個專案](docs/getting-started/first-project.md) - 步驟指南
- **📋 快速參考**：[命令速查表](resources/cheat-sheet.md)

#### 實踐練習
```bash
# 快速安裝檢查
azd version

# 部署您的第一個應用程式
azd init --template todo-nodejs-mongo
azd up
```

**💡 章節成果**：成功使用 AZD 部署一個簡單的網頁應用程式到 Azure

**✅ 成功驗證：**
```bash
# 完成第1章後，您應該能夠：
azd version              # 顯示已安裝的版本
azd init --template todo-nodejs-mongo  # 初始化項目
azd up                  # 部署到Azure
azd show                # 顯示正在運行的應用程式URL
# 應用程式在瀏覽器中開啟並正常運作
azd down --force --purge  # 清理資源
```

**📊 時間投入：** 30-45 分鐘  
**📈 技能水平提升：** 能夠獨立部署基本應用程式

**✅ 成功驗證：**
```bash
# 完成第1章後，您應該能夠：
azd version              # 顯示已安裝的版本
azd init --template todo-nodejs-mongo  # 初始化項目
azd up                  # 部署到Azure
azd show                # 顯示正在運行的應用程式URL
# 應用程式在瀏覽器中打開並正常運作
azd down --force --purge  # 清理資源
```

**📊 時間投入：** 30-45 分鐘  
**📈 技能水平提升：** 能夠獨立部署基本應用程式

---

### 🤖 第二章：以 AI 為核心的開發（推薦給 AI 開發者）
**先決條件**：完成第一章  
**時長**：1-2 小時  
**難度**：⭐⭐

#### 您將學到的內容
- 使用 AZD 與 Microsoft Foundry 整合
- 部署 AI 驅動的應用程式
- 了解 AI 服務配置

#### 學習資源
- **🎯 從這裡開始**：[Microsoft Foundry 整合](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 模式**：[AI 模型部署](docs/microsoft-foundry/ai-model-deployment.md) - 部署與管理 AI 模型
- **🛠️ 工作坊**：[AI 工作坊實驗室](docs/microsoft-foundry/ai-workshop-lab.md) - 讓您的 AI 解決方案適配 AZD
- **🎥 互動指南**：[工作坊材料](workshop/README.md) - 使用 MkDocs 的瀏覽器學習 * DevContainer 環境
- **📋 模板**：[Microsoft Foundry 模板](../..)
- **📝 範例**：[AZD 部署範例](examples/README.md)

#### 實踐練習
```bash
# 部署您的第一個人工智能應用程式
azd init --template azure-search-openai-demo
azd up

# 嘗試其他人工智能模板
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 章節成果**：部署並配置一個具備 RAG 功能的 AI 驅動聊天應用程式

**✅ 成功驗證：**
```bash
# 在第 2 章之後，您應該能夠：
azd init --template azure-search-openai-demo
azd up
# 測試 AI 聊天介面
# 提問並獲得附有來源的 AI 驅動回應
# 驗證搜尋整合是否正常運作
azd monitor  # 檢查 Application Insights 是否顯示遙測數據
azd down --force --purge
```

**📊 時間投入：** 1-2 小時  
**📈 技能水平提升：** 能夠部署並配置生產環境準備的 AI 應用程式  
**💰 成本意識：** 了解每月 $80-150 的開發成本，$300-3500 的生產成本

#### 💰 AI 部署的成本考量

**開發環境（估算 $80-150/月）：**
- Azure OpenAI（按使用量付費）：$0-50/月（基於 token 使用量）
- AI 搜索（基本層）：$75/月
- 容器應用程式（按消耗計費）：$0-20/月
- 儲存（標準）：$1-5/月

**生產環境（估算 $300-3,500+/月）：**
- Azure OpenAI（PTU 保持穩定性能）：$3,000+/月 或按使用量付費（高流量）
- AI 搜索（標準層）：$250/月
- 容器應用程式（專用）：$50-100/月
- 應用程式洞察：$5-50/月
- 儲存（高級）：$10-50/月

**💡 成本優化提示：**
- 使用 **免費層** Azure OpenAI 進行學習（每月包含 50,000 tokens）
- 執行 `azd down` 以釋放資源，當不活躍開發時
- 從按消耗計費開始，僅在生產環境升級到 PTU
- 使用 `azd provision --preview` 在部署前估算成本
- 啟用自動擴展：僅支付實際使用量

**成本監控：**
```bash
# 檢查估算的每月費用
azd provision --preview

# 在 Azure Portal 監控實際費用
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第三章：配置與身份驗證
**先決條件**：完成第一章  
**時長**：45-60 分鐘  
**難度**：⭐⭐

#### 您將學到的內容
- 環境配置與管理
- 身份驗證與安全性最佳實踐
- 資源命名與組織

#### 學習資源
- **📖 配置**：[配置指南](docs/getting-started/configuration.md) - 環境設置
- **🔐 安全性**：[身份驗證模式與管理身份](docs/getting-started/authsecurity.md) - 身份驗證模式
- **📝 範例**：[資料庫應用程式範例](examples/database-app/README.md) - AZD 資料庫範例

#### 實踐練習
- 配置多個環境（開發、測試、生產）
- 設置管理身份驗證
- 實現環境特定配置

**💡 章節成果**：管理多個環境並實現適當的身份驗證與安全性

---

### 🏗️ 第四章：基礎設施即代碼與部署
**先決條件**：完成第一至三章  
**時長**：1-1.5 小時  
**難度**：⭐⭐⭐

#### 您將學到的內容
- 高級部署模式
- 使用 Bicep 的基礎設施即代碼
- 資源配置策略

#### 學習資源
- **📖 部署**：[部署指南](docs/deployment/deployment-guide.md) - 完整工作流程
- **🏗️ 配置**：[資源配置](docs/deployment/provisioning.md) - Azure 資源管理
- **📝 範例**：[容器應用程式範例](../../examples/container-app) - 容器化部署

#### 實踐練習
- 創建自定義 Bicep 模板
- 部署多服務應用程式
- 實現藍綠部署策略

**💡 章節成果**：使用自定義基礎設施模板部署複雜的多服務應用程式

---

### 🎯 第五章：多代理 AI 解決方案（進階）
**先決條件**：完成第一至二章  
**時長**：2-3 小時  
**難度**：⭐⭐⭐⭐

#### 您將學到的內容
- 多代理架構模式
- 代理協調與協作
- 生產環境準備的 AI 部署

#### 學習資源
- **🤖 精選專案**：[零售多代理解決方案](examples/retail-scenario.md) - 完整實現
- **🛠️ ARM 模板**：[ARM 模板包](../../examples/retail-multiagent-arm-template) - 一鍵部署
- **📖 架構**：[多代理協調模式](/docs/pre-deployment/coordination-patterns.md) - 模式

#### 實踐練習
```bash
# 部署完整的零售多代理解決方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索代理配置
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 章節成果**：部署及管理具備生產準備的多代理人工智能解決方案，包括客戶及庫存代理

---

### 🔍 第六章：部署前驗證及規劃
**先決條件**：完成第四章  
**時長**：1小時  
**難度**：⭐⭐

#### 您將學到的內容
- 容量規劃及資源驗證
- SKU選擇策略
- 預檢查及自動化

#### 學習資源
- **📊 規劃**：[容量規劃](docs/pre-deployment/capacity-planning.md) - 資源驗證
- **💰 選擇**：[SKU選擇](docs/pre-deployment/sku-selection.md) - 成本效益選擇
- **✅ 驗證**：[預檢查](docs/pre-deployment/preflight-checks.md) - 自動化腳本

#### 實踐練習
- 執行容量驗證腳本
- 優化SKU選擇以降低成本
- 實施自動化部署前檢查

**💡 章節成果**：在執行前驗證及優化部署

---

### 🚨 第七章：故障排除及調試
**先決條件**：完成任意部署章節  
**時長**：1至1.5小時  
**難度**：⭐⭐

#### 您將學到的內容
- 系統化的調試方法
- 常見問題及解決方案
- 人工智能特定的故障排除

#### 學習資源
- **🔧 常見問題**：[常見問題](docs/troubleshooting/common-issues.md) - 常見問題及解答
- **🕵️ 調試指南**：[調試指南](docs/troubleshooting/debugging.md) - 步驟分解策略
- **🤖 AI問題**：[AI特定故障排除](docs/troubleshooting/ai-troubleshooting.md) - AI服務問題

#### 實踐練習
- 診斷部署失敗原因
- 解決身份驗證問題
- 調試AI服務連接性

**💡 章節成果**：能夠獨立診斷及解決常見部署問題

---

### 🏢 第八章：生產及企業模式
**先決條件**：完成第一至第四章  
**時長**：2至3小時  
**難度**：⭐⭐⭐⭐

#### 您將學到的內容
- 生產部署策略
- 企業安全模式
- 監控及成本優化

#### 學習資源
- **🏭 生產**：[生產AI最佳實踐](docs/microsoft-foundry/production-ai-practices.md) - 企業模式
- **📝 範例**：[微服務範例](../../examples/microservices) - 複雜架構
- **📊 監控**：[應用洞察整合](docs/pre-deployment/application-insights.md) - 監控

#### 實踐練習
- 實施企業安全模式
- 設置全面的監控
- 以適當的治理部署至生產環境

**💡 章節成果**：部署具備完整生產能力的企業級應用

---

## 🎓 工作坊概述：實踐學習體驗

> **⚠️ 工作坊狀態：開發中**  
> 工作坊材料目前正在開發及完善中。核心模組已可使用，但部分高級章節尚未完成。我們正積極努力完成所有內容。[追蹤進度 →](workshop/README.md)

### 互動式工作坊材料
**透過瀏覽器工具及指導練習進行全面的實踐學習**

我們的工作坊材料提供結構化的互動學習體驗，補充上述基於章節的課程。工作坊適合自學及講師指導的課程。

#### 🛠️ 工作坊特色
- **瀏覽器界面**：完整的MkDocs驅動工作坊，具備搜索、複製及主題功能
- **GitHub Codespaces整合**：一鍵設置開發環境
- **結構化學習路徑**：7步指導練習（總時長3.5小時）
- **探索 → 部署 → 自定義**：漸進式方法
- **互動式DevContainer環境**：預配置工具及依賴項

#### 📚 工作坊結構
工作坊遵循**探索 → 部署 → 自定義**的方法：

1. **探索階段**（45分鐘）
   - 探索Microsoft Foundry模板及服務
   - 理解多代理架構模式
   - 審查部署需求及先決條件

2. **部署階段**（2小時）
   - 實踐部署AI應用至AZD
   - 配置Azure AI服務及端點
   - 實施安全及身份驗證模式

3. **自定義階段**（45分鐘）
   - 修改應用以適應特定使用案例
   - 優化生產部署
   - 實施監控及成本管理

#### 🚀 開始工作坊
```bash
# 選項 1：GitHub Codespaces（推薦）
# 點擊 "Code" → "Create codespace on main" 在倉庫中

# 選項 2：本地開發
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 按照 workshop/README.md 中的設置指示操作
```

#### 🎯 工作坊學習成果
完成工作坊後，參與者將能：
- **部署生產AI應用**：使用AZD及Microsoft Foundry服務
- **掌握多代理架構**：實施協調的AI代理解決方案
- **實施安全最佳實踐**：配置身份驗證及訪問控制
- **優化規模**：設計具成本效益及高效能的部署
- **故障排除部署**：獨立解決常見問題

#### 📖 工作坊資源
- **🎥 互動指南**：[工作坊材料](workshop/README.md) - 瀏覽器學習環境
- **📋 步驟指導**：[指導練習](../../workshop/docs/instructions) - 詳細操作指引
- **🛠️ AI工作坊實驗室**：[AI工作坊實驗室](docs/microsoft-foundry/ai-workshop-lab.md) - 聚焦AI的練習
- **💡 快速開始**：[工作坊設置指南](workshop/README.md#quick-start) - 環境配置

**適合**：企業培訓、大學課程、自學及開發者訓練營。

---

## 📖 什麼是Azure Developer CLI？

Azure Developer CLI (azd) 是一個以開發者為中心的命令行界面，加速應用程序部署至Azure的過程。它提供：

- **基於模板的部署** - 使用預建模板進行常見應用模式部署
- **基礎設施即代碼** - 使用Bicep或Terraform管理Azure資源  
- **整合工作流** - 無縫配置、部署及監控應用
- **開發者友好** - 為提升開發者生產力及體驗而優化

### **AZD + Microsoft Foundry：AI部署的完美搭配**

**為什麼選擇AZD進行AI解決方案部署？** AZD解決了AI開發者面臨的主要挑戰：

- **AI準備模板** - 為Azure OpenAI、認知服務及ML工作負載預配置模板
- **安全AI部署** - 為AI服務、API密鑰及模型端點提供內建安全模式  
- **生產AI模式** - 可擴展及具成本效益的AI應用部署最佳實踐
- **端到端AI工作流** - 從模型開發到生產部署，配備完善的監控
- **成本優化** - 為AI工作負載提供智能資源分配及擴展策略
- **Microsoft Foundry整合** - 無縫連接至Microsoft Foundry模型目錄及端點

---

## 🎯 模板及範例庫

### 精選：Microsoft Foundry模板
**如果您正在部署AI應用，從這裡開始！**

> **注意**：這些模板展示了各種AI模式。有些是外部Azure範例，有些是本地實現。

| 模板 | 章節 | 難度 | 服務 | 類型 |
|------|------|------|------|------|
| [**AI聊天入門**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第二章 | ⭐⭐ | AzureOpenAI + Azure AI模型推理API + Azure AI搜索 + Azure容器應用 + 應用洞察 | 外部 |
| [**AI代理入門**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第二章 | ⭐⭐ | Azure AI代理服務 + AzureOpenAI + Azure AI搜索 + Azure容器應用 + 應用洞察 | 外部 |
| [**Azure搜索 + OpenAI示範**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第二章 | ⭐⭐ | AzureOpenAI + Azure AI搜索 + 應用服務 + 存儲 | 外部 |
| [**OpenAI聊天應用快速入門**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第二章 | ⭐ | AzureOpenAI + 容器應用 + 應用洞察 | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第五章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso聊天RAG**](https://github.com/Azure-Samples/contoso-chat) | 第八章 | ⭐⭐⭐⭐ | AzureOpenAI + AI搜索 + Cosmos DB + 容器應用 | 外部 |
| [**零售多代理解決方案**](examples/retail-scenario.md) | 第五章 | ⭐⭐⭐⭐ | AzureOpenAI + AI搜索 + 存儲 + 容器應用 + Cosmos DB | **本地** |

### 精選：完整學習場景
**生產準備應用模板與學習章節對應**

| 模板 | 學習章節 | 難度 | 關鍵學習 |
|------|----------|------|----------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第二章 | ⭐ | 基本AI部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第二章 | ⭐⭐ | 使用Azure AI搜索的RAG實現 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第四章 | ⭐⭐ | 文檔智能整合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第五章 | ⭐⭐⭐ | 代理框架及函數調用 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第八章 | ⭐⭐⭐ | 企業AI編排 |
| [**零售多代理解決方案**](examples/retail-scenario.md) | 第五章 | ⭐⭐⭐⭐ | 客戶及庫存代理的多代理架構 |

### 按範例類型學習

> **📌 本地與外部範例：**  
> **本地範例**（在此倉庫中）= 可立即使用  
> **外部範例**（Azure範例）= 從鏈接倉庫克隆

#### 本地範例（可立即使用）
- [**零售多代理解決方案**](examples/retail-scenario.md) - 使用ARM模板的完整生產準備實現
  - 多代理架構（客戶 + 庫存代理）
  - 全面監控及評估
  - 通過ARM模板一鍵部署

#### 本地範例 - 容器應用（第二至第五章）
**此倉庫中的全面容器部署範例：**
- [**容器應用範例**](examples/container-app/README.md) - 容器化部署的完整指南
  - [簡單Flask API](../../examples/container-app/simple-flask-api) - 基本REST API，支持零規模
  - [微服務架構](../../examples/container-app/microservices) - 生產準備的多服務部署
  - 快速入門、生產及高級部署模式
  - 監控、安全及成本優化指導

#### 外部範例 - 簡單應用（第一至第二章）
**克隆這些Azure範例倉庫以開始：**
- [簡單Web應用 - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本部署模式
- [靜態網站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 靜態內容部署
- [容器應用 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API部署

#### 外部範例 - 數據庫整合（第三至第四章）  
- [數據庫應用 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 數據庫連接模式
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 無伺服器數據工作流

#### 外部範例 - 高級模式（第四至第八章）
- [Java微服務](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服務架構
- [容器應用作業](https://github.com/Azure-Samples/container-apps-jobs) - 背景處理  
- [企業ML管道](https://github.com/Azure-Samples/mlops-v2) - 生產準備的ML模式

### 外部模板集合
- [**官方AZD模板庫**](https://azure.github.io/awesome-azd/) - 精選官方及社區模板
- [**Azure Developer CLI模板**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn模板文檔
- [**範例目錄**](examples/README.md) - 本地學習範例及詳細解釋

---

## 📚 學習資源及參考

### 快速參考
- [**命令速查表**](resources/cheat-sheet.md) - 按章節整理的azd基本命令
- [**詞彙表**](resources/glossary.md) - Azure及azd術語  
- [**常見問題**](resources/faq.md) - 按學習章節整理的常見問題
- [**學習指南**](resources/study-guide.md) - 全面的練習題目
### 實作工作坊
- [**AI 工作坊實驗室**](docs/microsoft-foundry/ai-workshop-lab.md) - 讓你的 AI 解決方案可用 AZD 部署 (2-3 小時)
- [**互動式工作坊指南**](workshop/README.md) - 基於瀏覽器的工作坊，使用 MkDocs 和 DevContainer 環境
- [**結構化學習路徑**](../../workshop/docs/instructions) - 七步驟指導練習 (探索 → 部署 → 自訂化)
- [**AZD 初學者工作坊**](workshop/README.md) - 完整的實作工作坊材料，整合 GitHub Codespaces

### 外部學習資源
- [Azure 開發者 CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 價格計算器](https://azure.microsoft.com/pricing/calculator/)
- [Azure 狀態](https://status.azure.com/)

---

## 🔧 快速故障排除指南

**初學者常見問題及即時解決方案：**

### ❌ "azd: command not found"

```bash
# 首先安裝 AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# 驗證安裝
azd version
```

### ❌ "No subscription found" 或 "Subscription not set"

```bash
# 列出可用的訂閱
az account list --output table

# 設置默認訂閱
az account set --subscription "<subscription-id-or-name>"

# 為 AZD 環境設置
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# 驗證
az account show
```

### ❌ "InsufficientQuota" 或 "Quota exceeded"

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

### ❌ "azd up" 中途失敗

```bash
# 選項 1：清理並重試
azd down --force --purge
azd up

# 選項 2：僅修復基礎設施
azd provision

# 選項 3：檢查詳細日誌
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
# AZD 生成唯一名稱，但如果衝突：
azd down --force --purge

# 然後使用新的環境重試
azd env new dev-v2
azd up
```

### ❌ 模板部署時間過長

**正常等待時間：**
- 簡單的網頁應用程式：5-10 分鐘
- 含資料庫的應用程式：10-15 分鐘
- AI 應用程式：15-25 分鐘 (OpenAI 配置較慢)

```bash
# 檢查進度
azd show

# 如果卡住超過30分鐘，檢查Azure Portal：
azd monitor
# 尋找失敗的部署
```

### ❌ "Permission denied" 或 "Forbidden"

```bash
# 檢查您的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 您至少需要 "Contributor" 角色
# 請要求您的 Azure 管理員授予：
# - Contributor（用於資源）
# - User Access Administrator（用於角色分配）
```

### ❌ 找不到已部署的應用程式 URL

```bash
# 顯示所有服務端點
azd show

# 或打開 Azure Portal
azd monitor

# 檢查特定服務
azd env get-values
# 查找 *_URL 變數
```

### 📚 完整故障排除資源

- **常見問題指南：** [詳細解決方案](docs/troubleshooting/common-issues.md)
- **AI 特定問題：** [AI 故障排除](docs/troubleshooting/ai-troubleshooting.md)
- **除錯指南：** [逐步除錯](docs/troubleshooting/debugging.md)
- **尋求幫助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 快速故障排除指南

**初學者常見問題及即時解決方案：**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# 首先安裝 AZD
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
<summary><strong>❌ "azd up" 中途失敗</strong></summary>

```bash
# 選項 1：清理並重試
azd down --force --purge
azd up

# 選項 2：僅修復基礎設施
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

# 驗證身份驗證
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" 或命名衝突</strong></summary>

```bash
# AZD 生成唯一名稱，但如果有衝突：
azd down --force --purge

# 然後使用新的環境重試
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 模板部署時間過長</strong></summary>

**正常等待時間：**
- 簡單的網頁應用程式：5-10 分鐘
- 含資料庫的應用程式：10-15 分鐘
- AI 應用程式：15-25 分鐘 (OpenAI 配置較慢)

```bash
# 檢查進度
azd show

# 如果卡住超過30分鐘，檢查Azure Portal：
azd monitor
# 尋找失敗的部署
```
</details>

<details>
<summary><strong>❌ "Permission denied" 或 "Forbidden"</strong></summary>

```bash
# 檢查您的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 您至少需要 "Contributor" 角色
# 請向您的 Azure 管理員要求授予：
# - Contributor（用於資源）
# - User Access Administrator（用於角色分配）
```
</details>

<details>
<summary><strong>❌ 找不到已部署的應用程式 URL</strong></summary>

```bash
# 顯示所有服務端點
azd show

# 或打開 Azure Portal
azd monitor

# 檢查特定服務
azd env get-values
# 查找 *_URL 變數
```
</details>

### 📚 完整故障排除資源

- **常見問題指南：** [詳細解決方案](docs/troubleshooting/common-issues.md)
- **AI 特定問題：** [AI 故障排除](docs/troubleshooting/ai-troubleshooting.md)
- **除錯指南：** [逐步除錯](docs/troubleshooting/debugging.md)
- **尋求幫助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 課程完成與認證

### 進度追蹤
透過每章節追蹤你的學習進度：

- [ ] **第 1 章**：基礎與快速入門 ✅
- [ ] **第 2 章**：AI 優先開發 ✅  
- [ ] **第 3 章**：配置與身份驗證 ✅
- [ ] **第 4 章**：基礎架構即代碼與部署 ✅
- [ ] **第 5 章**：多代理 AI 解決方案 ✅
- [ ] **第 6 章**：部署前驗證與規劃 ✅
- [ ] **第 7 章**：故障排除與除錯 ✅
- [ ] **第 8 章**：生產與企業模式 ✅

### 學習驗證
完成每章後，驗證你的知識：
1. **實作練習**：完成該章的實作部署
2. **知識檢查**：檢視該章的 FAQ 部分
3. **社群討論**：在 Azure Discord 分享你的經驗
4. **下一章**：進入下一個複雜度層級

### 完成課程的好處
完成所有章節後，你將擁有：
- **生產經驗**：將真實的 AI 應用程式部署到 Azure
- **專業技能**：企業級部署能力  
- **社群認可**：成為 Azure 開發者社群的活躍成員
- **職業發展**：掌握 AZD 和 AI 部署的熱門技能

---

## 🤝 社群與支援

### 尋求幫助與支援
- **技術問題**：[回報錯誤與功能請求](https://github.com/microsoft/azd-for-beginners/issues)
- **學習問題**：加入 [Microsoft Azure Discord 社群](https://discord.gg/microsoft-azure) 和 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 特定幫助**：加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **文件**：[官方 Azure 開發者 CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### 來自 Microsoft Foundry Discord 的社群見解

**#Azure 頻道的最新投票結果：**
- **45%** 的開發者希望使用 AZD 處理 AI 工作負載
- **主要挑戰**：多服務部署、憑證管理、生產準備  
- **最受歡迎需求**：AI 特定模板、故障排除指南、最佳實踐

**加入我們的社群以：**
- 分享你的 AZD + AI 經驗並獲得幫助
- 獲取新 AI 模板的早期預覽
- 貢獻 AI 部署最佳實踐
- 影響未來 AI + AZD 功能開發

### 為課程做出貢獻
我們歡迎貢獻！請閱讀我們的 [貢獻指南](CONTRIBUTING.md) 以了解詳情：
- **內容改進**：增強現有章節和範例
- **新增範例**：添加真實場景和模板  
- **翻譯**：協助維護多語言支持
- **錯誤回報**：提高準確性和清晰度
- **社群標準**：遵守我們包容性的社群指南

---

## 📄 課程資訊

### 授權
本專案依據 MIT 授權條款授權 - 詳情請參閱 [LICENSE](../../LICENSE) 文件。

### 相關 Microsoft 學習資源

我們的團隊還製作了其他全面的學習課程：

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
[![IoT 初學者課程](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
[![XR 初學者開發課程](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---

### Copilot 系列  
[![AI 配對編程 Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
[![C#/.NET Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
[![Copilot 冒險](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ 課程導航  

**🚀 準備開始學習？**  

**初學者**：從 [第 1 章：基礎與快速入門](../..) 開始  
**AI 開發者**：直接跳到 [第 2 章：AI 優先開發](../..)  
**有經驗的開發者**：從 [第 3 章：配置與身份驗證](../..) 開始  

**下一步**：[開始第 1 章 - AZD 基礎](docs/getting-started/azd-basics.md) →  

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
此文件已使用人工智能翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們努力確保翻譯的準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要信息，建議使用專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或誤釋不承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->