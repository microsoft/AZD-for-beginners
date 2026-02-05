# AZD 新手入門：結構化學習之旅

![AZD-for-beginners](../../translated_images/zh-HK/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## 課程入門

請按以下步驟開始您的 AZD 學習之旅：

1. **分叉儲存庫**：點擊 [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **複製儲存庫**：`git clone https://github.com/microsoft/azd-for-beginners.git`
3. **加入社區**：[Azure Discord 社群](https://discord.com/invite/ByRwuEEgH4) 尋求專家支援
4. **選擇您的學習路徑**：從以下章節中選擇符合您經驗水準的學習內容

### 多語言支援

#### 自動翻譯（始終保持最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[阿拉伯語](../ar/README.md) | [孟加拉語](../bn/README.md) | [保加利亞語](../bg/README.md) | [緬甸語](../my/README.md) | [中文（簡體）](../zh-CN/README.md) | [中文（繁體，香港）](./README.md) | [中文（繁體，澳門）](../zh-MO/README.md) | [中文（繁體，台灣）](../zh-TW/README.md) | [克羅地亞語](../hr/README.md) | [捷克語](../cs/README.md) | [丹麥語](../da/README.md) | [荷蘭語](../nl/README.md) | [愛沙尼亞語](../et/README.md) | [芬蘭語](../fi/README.md) | [法語](../fr/README.md) | [德語](../de/README.md) | [希臘語](../el/README.md) | [希伯來語](../he/README.md) | [印地語](../hi/README.md) | [匈牙利語](../hu/README.md) | [印尼語](../id/README.md) | [義大利語](../it/README.md) | [日語](../ja/README.md) | [坎納達語](../kn/README.md) | [韓語](../ko/README.md) | [立陶宛語](../lt/README.md) | [馬來語](../ms/README.md) | [馬拉雅拉姆語](../ml/README.md) | [馬拉地語](../mr/README.md) | [尼泊爾語](../ne/README.md) | [奈及利亞英語皮欽語](../pcm/README.md) | [挪威語](../no/README.md) | [波斯語 (法爾西語)](../fa/README.md) | [波蘭語](../pl/README.md) | [葡萄牙語（巴西）](../pt-BR/README.md) | [葡萄牙語（葡萄牙）](../pt-PT/README.md) | [旁遮普語（古魯穆奇字）](../pa/README.md) | [羅馬尼亞語](../ro/README.md) | [俄語](../ru/README.md) | [塞爾維亞語（西里爾字母）](../sr/README.md) | [斯洛伐克語](../sk/README.md) | [斯洛文尼亞語](../sl/README.md) | [西班牙語](../es/README.md) | [斯瓦希里語](../sw/README.md) | [瑞典語](../sv/README.md) | [塔加洛語（菲律賓語）](../tl/README.md) | [泰米爾語](../ta/README.md) | [泰盧固語](../te/README.md) | [泰語](../th/README.md) | [土耳其語](../tr/README.md) | [烏克蘭語](../uk/README.md) | [烏爾都語](../ur/README.md) | [越南語](../vi/README.md)

> **想要本地複製？**

> 本儲存庫包含 50 多種語言翻譯，會顯著增加下載大小。若要在沒有翻譯的情況下複製，請使用稀疏檢出：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 這樣能讓您更快速下載完成課程所需內容。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 課程概覽

透過結構化章節掌握 Azure Developer CLI (azd)，設計循序漸進的學習流程。**特別聚焦於 Microsoft Foundry 整合的 AI 應用部署。**

### 為何本課程對現代開發者至關重要

根據 Microsoft Foundry Discord 社群見解，**45% 的開發者希望使用 AZD 來執行 AI 工作負載**，但遇到以下挑戰：
- 複雜的多服務 AI 架構
- AI 生產部署最佳實踐
- Azure AI 服務整合與設定
- AI 工作負載成本優化
- AI 專屬部署問題疑難排解

### 學習目標

完成此結構化課程後，您將能：
- **掌握 AZD 基礎知識**：核心概念、安裝與設定
- **部署 AI 應用**：使用 AZD 與 Microsoft Foundry 服務
- **實施基礎設施即代碼**：使用 Bicep 模板管理 Azure 資源
- **疑難排解部署問題**：解決常見問題並進行除錯
- **優化生產環境**：安全性、擴展性、監控與成本管理
- **建立多代理 AI 解決方案**：部署複雜 AI 架構

## 📚 學習章節

*根據經驗程度與目標選擇您的學習路徑*

### 🚀 第 1 章：基礎與快速入門
**先決條件**：Azure 訂閱，基礎命令列知識  
**時長**：30-45 分鐘  
**難度**：⭐

#### 您將學到
- Azure Developer CLI 基礎理解
- 在您平台上安裝 AZD
- 您的第一次成功部署

#### 學習資源
- **🎯 從這裡開始**：[什麼是 Azure Developer CLI？](../..)
- **📖 理論**：[AZD 基礎知識](docs/getting-started/azd-basics.md) - 核心概念與術語
- **⚙️ 設置**：[安裝與配置](docs/getting-started/installation.md) - 平台專屬指南
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

**💡 本章成果**：成功使用 AZD 部署簡單網頁應用到 Azure

**✅ 成功驗證：**
```bash
# 完成第一章後，你應該能夠：
azd version              # 顯示已安裝版本
azd init --template todo-nodejs-mongo  # 初始化項目
azd up                  # 部署到 Azure
azd show                # 顯示正在運行的應用程式網址
# 應用程式在瀏覽器中開啟並運作正常
azd down --force --purge  # 清理資源
```

**📊 時間投入：**30-45 分鐘  
**📈 完成後技能水平：**能獨立部署基礎應用

**✅ 成功驗證：**
```bash
# 完成第一章後，你應該能夠：
azd version              # 顯示已安裝版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署到 Azure
azd show                # 顯示運行中的應用程式 URL
# 應用程式在瀏覽器中開啟並正常運作
azd down --force --purge  # 清理資源
```

**📊 時間投入：**30-45 分鐘  
**📈 完成後技能水平：**能獨立部署基礎應用

---

### 🤖 第 2 章：AI 優先開發（推薦 AI 開發者）
**先決條件**：完成第 1 章  
**時長**：1-2 小時  
**難度**：⭐⭐

#### 您將學到
- Microsoft Foundry 與 AZD 整合
- 部署 AI 驅動的應用
- 理解 AI 服務設定

#### 學習資源
- **🎯 從這裡開始**：[Microsoft Foundry 整合](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 範例模式**：[AI 模型部署](docs/microsoft-foundry/ai-model-deployment.md) - 部署和管理 AI 模型
- **🛠️ 工作坊**：[AI 工作坊實驗室](docs/microsoft-foundry/ai-workshop-lab.md) - 讓您的 AI 解決方案適用於 AZD
- **🎥 互動指南**：[工作坊材料](workshop/README.md) - 使用 MkDocs 及 DevContainer 瀏覽器式學習
- **📋 範本**：[Microsoft Foundry 範本](../..)
- **📝 範例**：[AZD 部署範例](examples/README.md)

#### 實作練習
```bash
# 部署你的第一個人工智能應用程式
azd init --template azure-search-openai-demo
azd up

# 嘗試更多人工智能模板
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 本章成果**：部署並配置具備 RAG 能力的 AI 對話應用

**✅ 成功驗證：**
```bash
# 完成第二章後，你應該能夠：
azd init --template azure-search-openai-demo
azd up
# 測試 AI 聊天介面
# 提問並獲得帶有來源的 AI 回答
# 驗證搜尋整合功能運作正常
azd monitor  # 檢查 Application Insights 顯示遙測數據
azd down --force --purge
```

**📊 時間投入：**1-2 小時  
**📈 完成後技能水平：**能部署與配置生產級 AI 應用  
**💰 成本認知：**了解 $80-150/月開發成本，$300-3500/月生產成本

#### 💰 AI 部署成本考量

**開發環境（估計 $80-150/月）：**
- Azure OpenAI（按使用量付費）：$0-50/月（依代幣使用量）
- AI 搜尋（基礎方案）：$75/月
- Container Apps（消耗方案）：$0-20/月
- 儲存空間（標準）：$1-5/月

**生產環境（估計 $300-3500+ / 月）：**
- Azure OpenAI（PTU 保持一致性能）：$3,000+/月 或大量使用的按使用量付費
- AI 搜尋（標準方案）：$250/月
- Container Apps（專用方案）：$50-100/月
- Application Insights：$5-50/月
- 儲存空間（高階）：$10-50/月

**💡 成本優化技巧：**
- 使用 **免費層** Azure OpenAI 學習（每月包含 50,000 代幣）
- 不開發時執行 `azd down` 停用資源
- 先使用按量付費方案，生產時再升級 PTU
- 部署前使用 `azd provision --preview` 預估成本
- 啟用自動擴展：只付實際使用費用

**成本監控：**
```bash
# 檢查預計每月費用
azd provision --preview

# 在 Azure 入口網站監控實際費用
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第 3 章：設定與認證
**先決條件**：完成第 1 章  
**時長**：45-60 分鐘  
**難度**：⭐⭐

#### 您將學到
- 環境設定與管理
- 認證與安全最佳實踐
- 資源命名與組織管理

#### 學習資源
- **📖 設定指南**：[設定教學](docs/getting-started/configuration.md) - 環境設置
- **🔐 安全**：[認證模式與託管身份](docs/getting-started/authsecurity.md) - 認證架構
- **📝 範例**：[資料庫應用範例](examples/database-app/README.md) - AZD 資料庫範例

#### 實作練習
- 設定多個環境（開發、測試、正式）
- 配置託管身份認證
- 實現環境特定設定

**💡 本章成果**：管理多個環境，實現妥善認證與安全性

---

### 🏗️ 第 4 章：基礎設施即代碼與部署
**先決條件**：完成第 1-3 章  
**時長**：1-1.5 小時  
**難度**：⭐⭐⭐

#### 您將學到
- 進階部署模型
- 使用 Bicep 框架實現基礎設施即代碼
- 資源佈建策略

#### 學習資源
- **📖 部署指南**：[部署指南](docs/deployment/deployment-guide.md) - 完整工作流程
- **🏗️ 佈建資源**：[資源佈建](docs/deployment/provisioning.md) - Azure 資源管理
- **📝 範例**：[Container App 範例](../../examples/container-app) - 容器化部署

#### 實作練習
- 建立自訂 Bicep 模板
- 部署多服務應用
- 實施藍綠部署策略

**💡 本章成果**：使用自訂基礎設施模板部署複雜多服務應用

---

### 🎯 第 5 章：多代理 AI 解決方案（進階）
**先決條件**：完成第 1-2 章  
**時長**：2-3 小時  
**難度**：⭐⭐⭐⭐
#### 你將學習到什麼
- 多代理架構模式
- 代理協調與整合
- 生產就緒的 AI 部署

#### 學習資源
- **🤖 精選專案**: [零售多代理方案](examples/retail-scenario.md) - 完整實作
- **🛠️ ARM 範本**: [ARM 範本套件](../../examples/retail-multiagent-arm-template) - 一鍵部署
- **📖 架構**: [多代理協調模式](/docs/pre-deployment/coordination-patterns.md) - 模式

#### 實作練習
```bash
# 部署完整零售多代理解決方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索代理配置
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 章節成果**：部署並管理生產就緒的多代理 AI 解決方案，包含客戶與庫存代理

---

### 🔍 第 6 章：部署前驗證與規劃
**先決條件**：完成第 4 章  
**時長**：1 小時  
**難度**：⭐⭐

#### 你將學習到什麼
- 容量規劃與資源驗證
- SKU 選擇策略
- 部署前檢查與自動化

#### 學習資源
- **📊 規劃**: [容量規劃](docs/pre-deployment/capacity-planning.md) - 資源驗證
- **💰 選擇**: [SKU 選擇](docs/pre-deployment/sku-selection.md) - 成本效益選項
- **✅ 驗證**: [部署前檢查](docs/pre-deployment/preflight-checks.md) - 自動化腳本

#### 實作練習
- 執行容量驗證腳本
- 優化 SKU 選擇以降低成本
- 實施自動化部署前檢查

**💡 章節成果**：驗證並優化部署以確保執行前的準備作業

---

### 🚨 第 7 章：故障排除與除錯
**先決條件**：完成任意部署章節  
**時長**：1-1.5 小時  
**難度**：⭐⭐

#### 你將學習到什麼
- 系統性除錯方法
- 常見問題與解決方案
- 特定 AI 問題排除

#### 學習資源
- **🔧 常見問題**: [常見問題](docs/troubleshooting/common-issues.md) - FAQ 及解決方案
- **🕵️ 除錯指南**: [除錯指南](docs/troubleshooting/debugging.md) - 步驟策略
- **🤖 AI 問題排除**: [AI 特定故障排除](docs/troubleshooting/ai-troubleshooting.md) - AI 服務問題

#### 實作練習
- 偵測部署失敗原因
- 解決驗證問題
- 除錯 AI 服務連線問題

**💡 章節成果**：能獨立診斷並解決常見部署問題

---

### 🏢 第 8 章：生產與企業模式
**先決條件**：完成第 1-4 章  
**時長**：2-3 小時  
**難度**：⭐⭐⭐⭐

#### 你將學習到什麼
- 生產部署策略
- 企業安全模式
- 監控與成本優化

#### 學習資源
- **🏭 生產**: [生產 AI 最佳實踐](docs/microsoft-foundry/production-ai-practices.md) - 企業模式
- **📝 範例**: [微服務範例](../../examples/microservices) - 複雜架構
- **📊 監控**: [Application Insights 整合](docs/pre-deployment/application-insights.md) - 監控

#### 實作練習
- 實施企業安全模式
- 建立完整監控
- 依照規範部署生產環境

**💡 章節成果**：部署具備完善企業功能的生產應用

---

## 🎓 工作坊總覽：實作學習體驗

> **⚠️ 工作坊狀態：積極開發中**  
> 工作坊教材仍在開發與優化中。核心模組已可運作，但部分進階章節尚未完成。我們正積極完成所有內容。[追蹤進度 →](workshop/README.md)

### 互動式工作坊教材
**全面的實作學習，結合瀏覽器工具與引導練習**

我們的工作坊教材提供一套結構化互動學習流程，搭配上述章節課程。工作坊適合自學或由講師引導。

#### 🛠️ 工作坊特色
- **瀏覽器介面**：完整 MkDocs 運作，具備搜尋、複製與主題切換
- **GitHub Codespaces 整合**：一鍵建立開發環境
- **結構化學習路徑**：7 步驟引導練習（共 3.5 小時）
- **探索 → 部署 → 客製化**：漸進式學習法
- **互動式開發容器環境**：預先配置開發工具與依賴

#### 📚 工作坊架構
工作坊採用 **探索 → 部署 → 客製化** 方法：

1. **探索階段** (45 分鐘)
   - 研究 Microsoft Foundry 範本與服務
   - 理解多代理架構模式
   - 評估部署需求與先決條件

2. **部署階段** (2 小時)
   - 實作部署 AI 應用，使用 AZD 工具
   - 配置 Azure AI 服務與端點
   - 實施安全與驗證模式

3. **客製化階段** (45 分鐘)
   - 修改應用以符合特定使用情境
   - 優化生產部署架構
   - 執行監控與成本管理

#### 🚀 工作坊開始指南
```bash
# 選項 1：GitHub Codespaces（推薦）
# 在儲存庫中點擊「Code」→「Create codespace on main」

# 選項 2：本地開發
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 按照 workshop/README.md 中的設置說明進行操作
```

#### 🎯 工作坊學習成果
完成工作坊後，參加者將能：
- **部署生產 AI 應用**：使用 AZD 和 Microsoft Foundry 服務
- **掌握多代理架構**：實作協調式 AI 代理解決方案
- **實行安全最佳實務**：設定驗證與存取管控
- **優化擴展性**：設計具成本效益與效能的部署
- **故障排除部署問題**：獨立解決常見問題

#### 📖 工作坊資源
- **🎥 互動指南**： [工作坊教材](workshop/README.md) - 瀏覽器式學習環境
- **📋 詳細步驟**： [引導練習](../../workshop/docs/instructions) - 詳細操作流程
- **🛠️ AI 工作坊實驗室**： [AI 工作坊實驗室](docs/microsoft-foundry/ai-workshop-lab.md) - AI 專注練習
- **💡 快速開始**： [工作坊設定指南](workshop/README.md#quick-start) - 環境配置指引

**適合對象**：企業培訓、大學課程、自學與開發者訓練營。

---

## 📖 什麼是 Azure Developer CLI？

Azure Developer CLI (azd) 是針對開發者設計的命令列工具，加速應用程式部署到 Azure 的流程。它提供：

- **範本化部署** - 使用預建範本支援常見應用模式
- **基礎架構即程式碼** - 利用 Bicep 或 Terraform 管理 Azure 資源  
- **整合化工作流程** - 無縫完成資源配置、部署及監控
- **開發者友善** - 優化開發者工作效率與體驗

### **AZD 與 Microsoft Foundry：AI 部署的完美組合**

**為什麼選擇 AZD 來部署 AI 解決方案？** AZD 解決了 AI 開發者面臨的關鍵挑戰：

- **AI 就緒範本** - 為 Azure OpenAI、認知服務及機器學習工作負載預設範本
- **安全 AI 部署** - 內建 AI 服務、API 金鑰與模型端點的安全模式  
- **生產 AI 範式** - 可擴充且成本效益高的 AI 應用部署最佳實踐
- **端到端 AI 工作流程** - 從模型開發到生產部署並含監控
- **成本優化策略** - 聰明的資源調配及擴縮方案
- **Microsoft Foundry 整合** - 無縫連接 Microsoft Foundry 模型目錄及端點

---

## 🎯 範本與範例庫

### 精選：Microsoft Foundry 範本
**想部署 AI 應用？從這開始！**

> **注意：** 這些範本示範多種 AI 模式。有些是外部 Azure 範例，有些是本地實作。

| 範本 | 章節 | 難度 | 服務 | 型態 |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第 2 章 | ⭐⭐ | AzureOpenAI + Azure AI 模型推論 API + Azure AI 搜尋 + Azure Container Apps + Application Insights | 外部 |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第 2 章 | ⭐⭐ | Azure AI 代理服務 + AzureOpenAI + Azure AI 搜尋 + Azure Container Apps + Application Insights| 外部 |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第 2 章 | ⭐⭐ | AzureOpenAI + Azure AI 搜尋 + 應用服務 + 儲存體 | 外部 |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第 2 章 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第 5 章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 第 8 章 | ⭐⭐⭐⭐ | AzureOpenAI + AI 搜尋 + Cosmos DB + Container Apps | 外部 |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | 第 5 章 | ⭐⭐⭐⭐ | AzureOpenAI + AI 搜尋 + 儲存 + Container Apps + Cosmos DB | **本地** |

### 精選：完整學習場景
**生產就緒的應用範本，對應學習章節**

| 範本 | 學習章節 | 難度 | 主要學習內容 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第 2 章 | ⭐ | 基礎 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第 2 章 | ⭐⭐ | RAG 與 Azure AI 搜尋整合 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第 4 章 | ⭐⭐ | 文件智能整合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第 5 章 | ⭐⭐⭐ | 代理框架與函式呼叫 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第 8 章 | ⭐⭐⭐ | 企業 AI 協調 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第 5 章 | ⭐⭐⭐⭐ | 多代理架構（客戶與庫存代理） |

### 依範例類型學習

> **📌 本地與外部範例差異：**  
> **本地範例**（本儲存庫）= 可立即使用  
> **外部範例**（Azure 範例）= 從連結的倉庫克隆

#### 本地範例（可立即使用）
- [**零售多代理方案**](examples/retail-scenario.md) - 完整生產就緒實作，含 ARM 範本
  - 多代理架構（客戶 + 庫存代理）
  - 全面監控與評估
  - 一鍵透過 ARM 範本部署

#### 本地範例 - 容器應用（第 2-5 章）
**本儲存庫中完整容器部署範例：**
- [**容器應用範例**](examples/container-app/README.md) - 容器化部署完整指南
  - [簡易 Flask API](../../examples/container-app/simple-flask-api) - 基本 REST API，具備零規模縮減
  - [微服務架構](../../examples/container-app/microservices) - 生產就緒多服務部署
  - 快速入門、生產及進階部署模式
  - 監控、安全與成本優化指導

#### 外部範例 - 簡易應用（第 1-2 章）
**克隆以下 Azure 範例倉庫來開始學習：**
- [簡易 Web 應用 - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本部署模式
- [靜態網站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 靜態內容部署
- [容器應用 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署

#### 外部範例 - 資料庫整合（第 3-4 章）  
- [資料庫應用 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 資料庫連接模式
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 無服務器資料工作流

#### 外部範例 - 進階模式（第 4-8 章）
- [Java 微服務](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服務架構
- [容器應用任務](https://github.com/Azure-Samples/container-apps-jobs) - 背景處理  
- [企業機器學習流程](https://github.com/Azure-Samples/mlops-v2) - 生產就緒 ML 模式

### 外部範本收藏
- [**官方 AZD 範本庫**](https://azure.github.io/awesome-azd/) - 官方與社群範本精選集
- [**Azure Developer CLI 範本**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 範本文件
- [**範例目錄**](examples/README.md) - 本機學習範例及詳細說明

---

## 📚 學習資源與參考資料

### 快速參考
- [**指令速查表**](resources/cheat-sheet.md) - 按章節組織的 azd 重要指令
- [**詞彙表**](resources/glossary.md) - Azure 和 azd 術語  
- [**常見問題**](resources/faq.md) - 按學習章節整理的常見問題
- [**學習指南**](resources/study-guide.md) - 全面實作練習

### 實作工作坊
- [**AI 工作坊實驗室**](docs/microsoft-foundry/ai-workshop-lab.md) - 讓你的 AI 解決方案可用 AZD 部署（2-3 小時）
- [**互動工作坊指南**](workshop/README.md) - 使用 MkDocs 與 DevContainer 環境的瀏覽器工作坊
- [**結構化學習路徑**](../../workshop/docs/instructions) - 7 步驟引導練習（探索 → 部署 → 自訂）
- [**AZD 初學者工作坊**](workshop/README.md) - 完整實作工作坊材料及 GitHub Codespaces 整合

### 外部學習資源
- [Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 價格計算機](https://azure.microsoft.com/pricing/calculator/)
- [Azure 狀態](https://status.azure.com/)

---

## 🔧 快速排錯指南

**初學者常見問題與快速解決方案：**

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
# 列出可用訂閱
az account list --output table

# 設定預設訂閱
az account set --subscription "<subscription-id-or-name>"

# 設定用於 AZD 環境
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# 驗證
az account show
```

### ❌ "InsufficientQuota" 或 "Quota exceeded"

```bash
# 嘗試不同的 Azure 區域
azd env set AZURE_LOCATION "westus2"
azd up

# 或在開發時使用較小的 SKU
# 編輯 infra/main.parameters.json：
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" 執行至一半失敗

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

### ❌ "Authentication failed" 或 "Token expired"

```bash
# 重新認證
az logout
az login

azd auth logout
azd auth login

# 驗證身份認證
az account show
```

### ❌ "Resource already exists" 或命名衝突

```bash
# AZD 會生成獨特名稱，但如有衝突：
azd down --force --purge

# 然後使用全新環境重試
azd env new dev-v2
azd up
```

### ❌ 範本部署時間過長

**正常等待時間：**
- 簡單網頁應用：5-10 分鐘
- 含資料庫應用：10-15 分鐘
- AI 應用：15-25 分鐘（OpenAI 配置較慢）

```bash
# 檢查進度
azd show

# 如果卡住超過30分鐘，檢查 Azure 入口網站：
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

### ❌ 找不到已部署應用程式網址

```bash
# 顯示所有服務端點
azd show

# 或開啟 Azure 入口網站
azd monitor

# 檢查特定服務
azd env get-values
# 查找 *_URL 變數
```

### 📚 完整排錯資源

- **常見問題指南:** [詳細解決方案](docs/troubleshooting/common-issues.md)
- **AI 專屬問題:** [AI 排錯](docs/troubleshooting/ai-troubleshooting.md)
- **除錯指南:** [步驟式除錯](docs/troubleshooting/debugging.md)
- **求助管道:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 快速排錯指南

**初學者常見問題與快速解決方案：**

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

# 或在開發時使用較小的 SKU
# 編輯 infra/main.parameters.json：
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
# AZD 會產生獨特名稱，但如果有衝突：
azd down --force --purge

# 然後使用新的環境重試
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 範本部署時間過長</strong></summary>

**正常等待時間：**
- 簡單網頁應用：5-10 分鐘
- 含資料庫應用：10-15 分鐘
- AI 應用：15-25 分鐘（OpenAI 配置較慢）

```bash
# 檢查進度
azd show

# 如果停滯超過30分鐘，檢查Azure入口網站：
azd monitor
# 查找失敗的部署
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
<summary><strong>❌ 找不到已部署應用程式網址</strong></summary>

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

### 📚 完整排錯資源

- **常見問題指南:** [詳細解決方案](docs/troubleshooting/common-issues.md)
- **AI 專屬問題:** [AI 排錯](docs/troubleshooting/ai-troubleshooting.md)
- **除錯指南:** [步驟式除錯](docs/troubleshooting/debugging.md)
- **求助管道:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 課程完成與認證

### 進度追蹤
追蹤每章節的學習進度：

- [ ] **第 1 章**：基礎與快速入門 ✅
- [ ] **第 2 章**：AI-First 開發 ✅  
- [ ] **第 3 章**：設定與認證 ✅
- [ ] **第 4 章**：基礎設施即程式碼與部署 ✅
- [ ] **第 5 章**：多代理 AI 解決方案 ✅
- [ ] **第 6 章**：部署前驗證與規劃 ✅
- [ ] **第 7 章**：排錯與除錯 ✅
- [ ] **第 8 章**：生產與企業模式 ✅

### 學習驗證
完成每章節後，請透過以下方式確認學習成效：
1. **實務練習**：完成該章節的動手部署
2. **知識檢核**：檢視該章節的常見問題
3. **社群討論**：在 Azure Discord 分享你的學習經驗
4. **下一章節**：進入下一個複雜度階段

### 課程完成收穫
完成所有章節後，你將擁有：
- **生產經驗**：實際將 AI 應用部署到 Azure
- **專業技能**：企業級部署能力  
- **社群認可**：成為活躍的 Azure 開發者成員
- **職涯提升**：具備高需求的 AZD 與 AI 部署專業知識

---

## 🤝 社群與支援

### 獲取協助與支援
- **技術問題**： [回報錯誤與功能請求](https://github.com/microsoft/azd-for-beginners/issues)
- **學習問題**：[Microsoft Azure Discord 社群](https://discord.gg/microsoft-azure) 及 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 專屬協助**：加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **文件資源**：[官方 Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord 社群見解

**#Azure 頻道最新投票結果：**
- **45%** 開發者希望用 AZD 處理 AI 工作負載
- **主要挑戰**：多服務部署、憑證管理、生產準備  
- **最高需求**：AI 專屬範本、排錯指南、最佳實踐

**加入我們的社群，你可以：**
- 分享你的 AZD + AI 經驗與獲取協助
- 率先使用新 AI 範本預覽版
- 參與 AI 部署最佳實踐的貢獻
- 影響未來 AI + AZD 功能發展

### 為課程做出貢獻
我們歡迎大家參與貢獻！詳情請參考[貢獻指南](CONTRIBUTING.md)：
- **內容優化**：改進現有章節與範例
- **新增範例**：加入真實場景與範本  
- **翻譯支援**：維護多語言環境
- **錯誤回報**：提升準確性與清晰度
- **社群規範**：遵守包容性社群指引

---

## 📄 課程資訊

### 授權條款
本專案採用 MIT 授權條款，詳見 [LICENSE](../../LICENSE) 檔案。

### 相關 Microsoft 學習資源

我們團隊提供其他全面學習課程：

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / 邊緣運算 / MCP / 代理人
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

**初學者**：從 [第1章：基礎與快速入門](../..) 開始  
**AI 開發者**：直接閱讀 [第2章：AI優先開發](../..)  
**有經驗的開發者**：從 [第3章：配置與認證](../..) 開始

**下一步**：[開始第1章－AZD 基礎](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件經由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於確保準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不會對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->