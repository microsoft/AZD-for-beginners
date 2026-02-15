# AZD 新手指南：有系統的學習之旅

![AZD-for-beginners](../../translated_images/zh-HK/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 自動翻譯（隨時更新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](./README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **喜歡在本地克隆？**
>
> 此儲存庫包含 50 多種語言的翻譯，這會大幅增加下載大小。若要不包含翻譯檔案克隆，請使用稀疏簽出：
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> 這樣可以讓您用更快的速度下載完成本課程所需的一切。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 什麼是 Azure Developer CLI (azd)？

**Azure Developer CLI (azd)** 是一款為開發者設計的命令行工具，可簡化將應用程式部署到 Azure。您不用手動建立或連接數十個 Azure 資源，只需一條命令即可部署整個應用程式。

### `azd up` 的魔力

```bash
# 這條單一指令一手包辦所有工作：
# ✅ 建立所有 Azure 資源
# ✅ 設定網絡和安全性
# ✅ 建構你的應用程式程式碼
# ✅ 部署到 Azure
# ✅ 提供一個可用的 URL
azd up
```

**就是這麼簡單！** 無需點擊 Azure 入口網站、無需先學複雜的 ARM 模板、無需手動配置 —— 直接在 Azure 上擁有可運作的應用程式。

---

## ❓ Azure Developer CLI 與 Azure CLI：有何不同？

這是新手最常問的問題。以下是簡單的答案：

| 功能 | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **用途** | 管理單一 Azure 資源 | 部署完整應用程式 |
| **思維模式** | 基礎設施導向 | 應用程式導向 |
| **範例** | `az webapp create --name myapp...` | `azd up` |
| **學習曲線** | 必須了解 Azure 服務 | 只需了解您的應用程式 |
| **適用對象** | 運維和基礎設施工程師 | 開發者、快速原型製作 |

### 簡單比喻

- **Azure CLI** 就像擁有所有建築工具——錘子、鋸子、釘子。您能蓋出任何東西，但需懂建築知識。
- **Azure Developer CLI** 就像請了一位承包商——您說想要什麼，他們來完成建造。

### 何時使用哪個？

| 情境 | 使用這個 |
|----------|----------|
| 「我想快速部署我的網頁應用」 | `azd up` |
| 「我只需要建立一個儲存帳戶」 | `az storage account create` |
| 「我正在建構完整的 AI 應用」 | `azd init --template azure-search-openai-demo` |
| 「我需要除錯特定的 Azure 資源」 | `az resource show` |
| 「我想在幾分鐘內得到可用於生產的部署」 | `azd up --environment production` |

### 它們是協同工作的！

AZD 在底層使用 Azure CLI。您可以兩者並用：
```bash
# 使用 AZD 部署您的應用程式
azd up

# 然後使用 Azure CLI 微調特定資源
az webapp config set --name myapp --always-on true
```

---

## 🌟 在 Awesome AZD 中尋找範本

別從零開始！**Awesome AZD** 是由社群整理的一系列即用型範本：

| 資源 | 說明 |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | 瀏覽 200 多個範本，一鍵部署 |
| 🔗 [**提交範本**](https://github.com/Azure/awesome-azd/issues) | 將您的範本貢獻給社群 |
| 🔗 [**GitHub 儲存庫**](https://github.com/Azure/awesome-azd) | 點讚並探索原始碼 |

### Awesome AZD 熱門 AI 範本

```bash
# 使用 Azure OpenAI 與 AI Search 的 RAG 聊天
azd init --template azure-search-openai-demo

# 快速 AI 聊天應用程式
azd init --template openai-chat-app-quickstart

# 與 Foundry Agents 的 AI 代理
azd init --template get-started-with-ai-agents
```

---

## 🎯 三步驟快速入門

### 步驟 1：安裝 AZD（2 分鐘）

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### 步驟 2：登入 Azure

```bash
azd auth login
```

### 步驟 3：部署您的第一個應用程式

```bash
# 從範本初始化
azd init --template todo-nodejs-mongo

# 部署到 Azure（會建立所有資源！）
azd up
```

**🎉 就完成了！** 您的應用程式已經在 Azure 上正式運行。

### 清理（別忘了！）

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 如何使用本課程

本課程為**循序漸進學習**設計——從您熟悉的地方開始，逐步深入：

| 您的經驗 | 從這裡開始 |
|-----------------|------------|
| **完全不懂 Azure** | [第 1 章：基礎](../..) |
| **懂 Azure、新手 AZD** | [第 1 章：基礎](../..) |
| **想部署 AI 應用** | [第 2 章：AI 為先的開發](../..) |
| **想實作練習** | [🎓 互動工作坊](workshop/README.md) - 3-4 小時引導實驗 |
| **需要生產環境模式** | [第 8 章：生產與企業模式](../..) |

### 快速設定

1. **派生本儲存庫**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **克隆儲存庫**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **取得支援**: [Azure Discord 社群](https://discord.com/invite/ByRwuEEgH4)

> **喜歡在本地克隆？**

> 此儲存庫包含 50 多種語言的翻譯，這會大幅增加下載大小。若要不包含翻譯檔案克隆，請使用稀疏簽出：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 這樣可讓您的下載速度大幅提升，並完成課程所需內容。


## 課程總覽

透過有系統設計的章節掌握 Azure Developer CLI (azd)，**特別聚焦 Microsoft Foundry 整合的 AI 應用部署。**

### 為何本課程對現代開發者至關重要

根據 Microsoft Foundry Discord 社群的調查，**45% 的開發者想使用 AZD 處理 AI 工作負載**，但遇到下列挑戰：
- 複雜的多服務 AI 架構設計
- AI 生產環境部署最佳實踐  
- Azure AI 服務整合與配置
- AI 工作負載成本優化
- AI 特定部署問題的疑難排解

### 學習目標

完成本結構化課程後，您將能：
- **掌握 AZD 基礎**：核心概念、安裝與配置
- **部署 AI 應用**：使用 AZD 與 Microsoft Foundry 服務
- **實現基礎設施即程式碼**：以 Bicep 範本管理 Azure 資源
- **疑難排解部署問題**：排除常見問題與除錯
- **優化生產環境**：安全性、擴展、監控與成本管理
- **構建多代理解決方案**：部署複雜 AI 架構

## 🗺️ 課程地圖：章節快速導覽

每個章節附有獨立 README，包含學習目標、快速上手與練習：

| 章節 | 主題 | 課程內容 | 時長 | 難度 |
|---------|-------|---------|----------|------------|
| **[第 1 章：基礎](docs/chapter-01-foundation/README.md)** | 快速入門 | [AZD 基礎](docs/chapter-01-foundation/azd-basics.md) &#124; [安裝](docs/chapter-01-foundation/installation.md) &#124; [第一個專案](docs/chapter-01-foundation/first-project.md) | 30-45 分鐘 | ⭐ |
| **[第 2 章：AI 開發](docs/chapter-02-ai-development/README.md)** | AI 為先的應用 | [Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI 代理](docs/chapter-02-ai-development/agents.md) &#124; [模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [工作坊](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 小時 | ⭐⭐ |
| **[第 3 章：設定](docs/chapter-03-configuration/README.md)** | 認證與安全 | [設定](docs/chapter-03-configuration/configuration.md) &#124; [認證與安全](docs/chapter-03-configuration/authsecurity.md) | 45-60 分鐘 | ⭐⭐ |
| **[第4章：基礎架構](docs/chapter-04-infrastructure/README.md)** | IaC 與部署 | [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [資源供應](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 小時 | ⭐⭐⭐ |
| **[第5章：多代理](docs/chapter-05-multi-agent/README.md)** | AI 代理方案 | [零售場景](examples/retail-scenario.md) &#124; [協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 小時 | ⭐⭐⭐⭐ |
| **[第6章：預部署](docs/chapter-06-pre-deployment/README.md)** | 規劃與驗證 | [起飛前檢查](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [應用洞察](docs/chapter-06-pre-deployment/application-insights.md) | 1 小時 | ⭐⭐ |
| **[第7章：故障排除](docs/chapter-07-troubleshooting/README.md)** | 偵錯與修復 | [常見問題](docs/chapter-07-troubleshooting/common-issues.md) &#124; [偵錯](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI 問題](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 小時 | ⭐⭐ |
| **[第8章：生產環境](docs/chapter-08-production/README.md)** | 企業模式 | [生產實務](docs/chapter-08-production/production-ai-practices.md) | 2-3 小時 | ⭐⭐⭐⭐ |
| **[🎓 工作坊](workshop/README.md)** | 實作實驗室 | [介紹](workshop/docs/instructions/0-Introduction.md) &#124; [選擇](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [驗證](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [拆解](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [設定](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [客製化](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [拆除](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [總結](workshop/docs/instructions/7-Wrap-up.md) | 3-4 小時 | ⭐⭐ |

**課程總時長:** 約10-14 小時 | **技能進階:** 初階 → 生產就緒

---

## 📚 學習章節

*根據經驗與目標選擇你的學習路線*

### 🚀 第1章：基礎與快速入門
**先決條件**：Azure 訂閱，基本命令列知識  
**時長**：30-45 分鐘  
**難度**：⭐

#### 你將學會
- 了解 Azure Developer CLI 基礎
- 在你的平台安裝 AZD
- 成功進行你的第一次部署

#### 學習資源
- **🎯 從這裡開始**：[什麼是 Azure Developer CLI？](../..)
- **📖 理論**：[AZD 基礎](docs/chapter-01-foundation/azd-basics.md) - 核心概念與術語
- **⚙️ 設置**：[安裝與設定](docs/chapter-01-foundation/installation.md) - 平台專用指南
- **🛠️ 實作**：[你的第一個專案](docs/chapter-01-foundation/first-project.md) - 步驟教學
- **📋 快速參考**：[指令速查表](resources/cheat-sheet.md)

#### 實作練習
```bash
# 快速安裝檢查
azd version

# 部署你的第一個應用程式
azd init --template todo-nodejs-mongo
azd up
```

**💡 章節成果**：使用 AZD 成功部署簡單的 Web 應用程式至 Azure

**✅ 成功驗證：**
```bash
# 完成第一章後，你應該能夠：
azd version              # 顯示已安裝的版本
azd init --template todo-nodejs-mongo  # 初始化項目
azd up                  # 部署到 Azure
azd show                # 顯示正在運行的應用程式網址
# 應用程式在瀏覽器中開啟並正常運作
azd down --force --purge  # 清理資源
```

**📊 所需時間：** 30-45 分鐘  
**📈 完成後技能等級：** 能獨立部署基本應用

**✅ 成功驗證：**
```bash
# 完成第一章後，你應該能夠：
azd version              # 顯示已安裝版本
azd init --template todo-nodejs-mongo  # 初始化項目
azd up                  # 部署到 Azure
azd show                # 顯示運行中應用程式的網址
# 應用程式在瀏覽器中開啟並運作
azd down --force --purge  # 清理資源
```

**📊 所需時間：** 30-45 分鐘  
**📈 完成後技能等級：** 能獨立部署基本應用

---

### 🤖 第2章：AI優先開發（推薦給AI開發者）
**先決條件**：完成第1章  
**時長**：1-2 小時  
**難度**：⭐⭐

#### 你將學會
- Microsoft Foundry 與 AZD 整合
- 部署 AI 驅動應用
- 理解 AI 服務設定

#### 學習資源
- **🎯 從這裡開始**：[Microsoft Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI代理**：[AI代理指南](docs/chapter-02-ai-development/agents.md) - 使用 AZD 部署智慧代理
- **📖 模式**：[AI模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) - 部署與管理 AI 模型
- **🛠️ 工作坊**：[AI工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - 讓你的 AI 解決方案符合 AZD
- **🎥 互動指南**：[工作坊資源](workshop/README.md) - MkDocs 瀏覽器學習與 DevContainer 環境
- **📋 範本**：[Microsoft Foundry 範本](../..)
- **📝 範例**：[AZD 部署範例](examples/README.md)

#### 實作練習
```bash
# 部署你的第一個人工智能應用程式
azd init --template azure-search-openai-demo
azd up

# 嘗試其他人工智能範本
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 章節成果**：部署並設定具備 RAG 功能的 AI 智能聊天應用

**✅ 成功驗證：**
```bash
# 完成第二章後，你應該能夠：
azd init --template azure-search-openai-demo
azd up
# 測試 AI 聊天介面
# 提問並獲取附有資料來源的 AI 回應
# 驗證搜索整合是否正常運作
azd monitor  # 檢查 Application Insights 是否顯示遙測資料
azd down --force --purge
```

**📊 所需時間：** 1-2 小時  
**📈 完成後技能等級：** 能部署及設定生產就緒 AI 應用  
**💰 成本認知：** 了解開發環境月費約為 80-150 美元，生產環境月費約 300-3500 美元

#### 💰 AI 部署的成本考量

**開發環境（估計每月 80-150 美元）：**
- Azure OpenAI（按用量付費）：0-50 美元/月（視代幣使用數量）
- AI 搜尋（基本層）：75 美元/月
- Container Apps（消耗計費）：0-20 美元/月
- 儲存（標準）：1-5 美元/月

**生產環境（估計每月 300-3500+ 美元）：**
- Azure OpenAI（PTU 用於穩定性能）：3000 美元以上/月 或高容量按用量付費
- AI 搜尋（標準層）：250 美元/月
- Container Apps（專用）：50-100 美元/月
- 應用洞察：5-50 美元/月
- 儲存（高級）：10-50 美元/月

**💡 成本優化技巧：**
- 使用 **免費層** Azure OpenAI 進行學習（每月包含 50,000 代幣）
- 非開發時使用 `azd down` 釋放資源
- 先使用消耗計費，僅生產環境升級至 PTU
- 部署前用 `azd provision --preview` 預估成本
- 啟用自動調整，僅為實際使用付費

**成本監控：**
```bash
# 檢查預計每月成本
azd provision --preview

# 在 Azure 門戶監察實際成本
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第3章：設定與認證
**先決條件**：完成第1章  
**時長**：45-60 分鐘  
**難度**：⭐⭐

#### 你將學會
- 環境配置與管理
- 認證與安全最佳實踐
- 資源命名及組織原則

#### 學習資源
- **📖 配置**：[配置指南](docs/chapter-03-configuration/configuration.md) - 環境設定
- **🔐 安全**：[認證模式與管理身分](docs/chapter-03-configuration/authsecurity.md) - 認證模式
- **📝 範例**：[資料庫應用範例](examples/database-app/README.md) - AZD 資料庫範例

#### 實作練習
- 配置多重環境（開發、預備、生產）
- 建立管理身分認證
- 實作環境專屬設定

**💡 章節成果**：管理多個環境並實現正確的認證與安全

---

### 🏗️ 第4章：基礎架構即代碼與部署
**先決條件**：完成第1-3章  
**時長**：1-1.5 小時  
**難度**：⭐⭐⭐

#### 你將學會
- 進階部署模式
- 使用 Bicep 的基礎架構即代碼
- 資源供應策略

#### 學習資源
- **📖 部署**：[部署指南](docs/chapter-04-infrastructure/deployment-guide.md) - 完整工作流程
- **🏗️ 供應**：[資源供應](docs/chapter-04-infrastructure/provisioning.md) - Azure 資源管理
- **📝 範例**：[容器應用範例](../../examples/container-app) - 容器化部署

#### 實作練習
- 創建自訂 Bicep 範本
- 部署多服務應用
- 實作藍綠部署策略

**💡 章節成果**：使用自訂基礎架構範本部署複雜的多服務應用

---

### 🎯 第5章：多代理 AI 解決方案（進階）
**先決條件**：完成第1-2章  
**時長**：2-3 小時  
**難度**：⭐⭐⭐⭐

#### 你將學會
- 多代理架構模式
- 代理協作與調度
- 生產就緒的 AI 部署

#### 學習資源
- **🤖 專案亮點**：[零售多代理方案](examples/retail-scenario.md) - 完整實作
- **🛠️ ARM 範本**：[ARM 範本套件](../../examples/retail-multiagent-arm-template) - 一鍵部署
- **📖 架構**：[多代理協作模式](docs/chapter-06-pre-deployment/coordination-patterns.md) - 模式

#### 實作練習
```bash
# 部署完整嘅零售多智能體解決方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索智能體配置
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 章節成果**：部署並管理具備客戶與庫存代理的生產就緒多代理 AI 解決方案

---

### 🔍 第6章：預部署驗證與規劃
**先決條件**：完成第4章  
**時長**：1 小時  
**難度**：⭐⭐

#### 你將學會
- 容量規劃與資源驗證
- SKU 選擇策略
- 起飛前檢查與自動化

#### 學習資源
- **📊 規劃**：[容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) - 資源驗證
- **💰 選擇**：[SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) - 成本效益選項
- **✅ 驗證**：[起飛前檢查](docs/chapter-06-pre-deployment/preflight-checks.md) - 自動化腳本

#### 實作練習
- 執行容量驗證腳本
- 優化 SKU 選擇以降低成本
- 實作自動化起飛前檢查

**💡 章節成果**：在執行前驗證並優化部署

---

### 🚨 第7章：故障排除與偵錯
**先決條件**：完成任一部署章節  
**時長**：1-1.5 小時  
**難度**：⭐⭐

#### 你將學會
- 系統性偵錯方法
- 常見問題與解決方案
- AI 專屬故障排除

#### 學習資源
- **🔧 常見問題**：[常見問題](docs/chapter-07-troubleshooting/common-issues.md) - 問答與解決方案
- **🕵️ 偵錯**：[偵錯指南](docs/chapter-07-troubleshooting/debugging.md) - 一步步策略
- **🤖 AI 問題**：[AI 專屬故障排除](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI 服務問題

#### 實作練習
- 診斷部署失敗
- 解決認證問題
- 偵錯 AI 服務連線

**💡 章節成果**：能獨立診斷與解決常見部署問題

---

### 🏢 第8章：生產環境與企業模式
**先決條件**：完成第1-4章  
**時長**：2-3 小時  
**難度**：⭐⭐⭐⭐

#### 你將學會
- 生產部署策略
- 企業安全模式
- 監控與成本優化

#### 學習資源
- **🏭 生產環境**：[生產 AI 實務](docs/chapter-08-production/production-ai-practices.md) - 企業模式
- **📝 範例**：[微服務範例](../../examples/microservices) - 複雜架構
- **📊 監控**：[應用洞察整合](docs/chapter-06-pre-deployment/application-insights.md) - 監控

#### 實作練習
- 實作企業安全模式
- 設置完整的監控系統
- 在適當治理下部署至生產環境

**💡 章節成果**：部署具備完整生產能力的企業級應用

---

## 🎓 工作坊概覽：實作學習體驗

> **⚠️ 工作坊狀態：積極開發中**  
> 工作坊材料目前正在開發和完善中。核心模組已具備功能，但部分進階章節尚未完成。我們正積極工作以完成所有內容。[查看進度 →](workshop/README.md)

### 互動式工作坊材料
**全面的實作學習，使用瀏覽器工具及指導練習**

我們的工作坊材料提供有結構的互動學習體驗，以配合上述章節課程。工作坊設計適合自學及講師帶領課程。

#### 🛠️ 工作坊特色
- **瀏覽器介面**：完整的 MkDocs 支援工作坊，具備搜尋、複製及主題功能
- **GitHub Codespaces 整合**：一鍵設定開發環境
- **結構化學習路徑**：8個模組指導練習（共3-4小時）
- **漸進式方法**：介紹 → 選擇 → 驗證 → 解構 → 配置 → 自訂 → 拆除 → 總結
- **互動式 DevContainer 環境**：預先配置工具及依賴

#### 📚 工作坊模組架構
工作坊採用 **8模組漸進式方法論**，帶領你從探索到部署精通：

| 模組 | 主題 | 你將完成 | 時長 |
|------|-------|------------|------|
| **0. 介紹** | 工作坊總覽 | 了解學習目標、先決條件及工作坊架構 | 15 分鐘 |
| **1. 選擇** | 模板發掘 | 探索 AZD 模板並選擇適合你的 AI 模板 | 20 分鐘 |
| **2. 驗證** | 部署並驗證 | 用 `azd up` 部署模板並驗證基礎設施運作 | 30 分鐘 |
| **3. 解構** | 理解結構 | 用 GitHub Copilot 探索模板架構、Bicep 檔案及程式碼組織 | 30 分鐘 |
| **4. 配置** | azure.yaml 深入 | 精通 `azure.yaml` 配置、生命週期掛鉤及環境變數 | 30 分鐘 |
| **5. 自訂** | 量身打造 | 啟用 AI 搜索、追蹤、評估，並自訂符合情境 | 45 分鐘 |
| **6. 拆除** | 清理 | 使用 `azd down --purge` 安全移除資源 | 15 分鐘 |
| **7. 總結** | 後續步驟 | 回顧成果、關鍵概念並繼續學習之旅 | 15 分鐘 |

**工作坊流程：**  
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```
  
#### 🚀 開始工作坊  
```bash
# 選項 1：GitHub Codespaces（建議使用）
# 在倉庫中點擊「Code」→「Create codespace on main」

# 選項 2：本地開發
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 按照 workshop/README.md 中的設定說明進行操作
```
  
#### 🎯 工作坊學習成果  
完成工作坊後，參與者將能：
- **部署生產等級 AI 應用**：使用 AZD 與 Microsoft Foundry 服務
- **精通多代理架構**：實作協調式 AI 代理解決方案
- **落實安全最佳實務**：配置認證與存取控制
- **優化擴展性**：設計成本效益高且效能優化的部署
- **排解部署問題**：獨立解決常見問題

#### 📖 工作坊資源
- **🎥 互動指南**：[工作坊材料](workshop/README.md) - 瀏覽器式學習環境
- **📋 分模組指導**：
  - [0. 介紹](workshop/docs/instructions/0-Introduction.md) - 工作坊總覽與目標
  - [1. 選擇](workshop/docs/instructions/1-Select-AI-Template.md) - 尋找並選擇 AI 模板
  - [2. 驗證](workshop/docs/instructions/2-Validate-AI-Template.md) - 部署與驗證模板
  - [3. 解構](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - 探索模板架構
  - [4. 配置](workshop/docs/instructions/4-Configure-AI-Template.md) - 精通 azure.yaml
  - [5. 自訂](workshop/docs/instructions/5-Customize-AI-Template.md) - 針對情境自訂
  - [6. 拆除](workshop/docs/instructions/6-Teardown-Infrastructure.md) - 清理資源
  - [7. 總結](workshop/docs/instructions/7-Wrap-up.md) - 回顧及後續步驟
- **🛠️ AI 工作坊實驗室**：[AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI 專注練習
- **💡 快速開始**：[工作坊設定指南](workshop/README.md#quick-start) - 環境配置

**非常適合**：企業培訓、大學課程、自學與開發者訓練營。

---

## 📖 深度探索：AZD 功能

除了基礎功能，AZD 也提供強大的生產部署特色：

- **基於模板的部署** - 使用預建模板支援常見應用模式
- **基礎設施即程式碼** - 使用 Bicep 或 Terraform 管理 Azure 資源
- **整合工作流程** - 無縫供應、部署及監控應用
- **開發者友好** - 優化開發生產力與使用體驗

### **AZD + Microsoft Foundry：AI 部署的完美組合**

**為什麼 AI 解決方案選擇 AZD？** AZD 解決 AI 開發者面臨的主要挑戰：

- **AI 準備模板** - 預配置 Azure OpenAI、認知服務與 ML 工作負載模板
- **安全的 AI 部署** - 內建 AI 服務、API 金鑰及模型端點安全模式
- **生產等級 AI 模式** - 可擴展且成本效益高的 AI 應用最佳實務
- **端到端 AI 工作流程** - 從模型開發到生產部署並適當監控
- **成本優化** - 智慧資源分配與彈性擴展策略
- **Microsoft Foundry 整合** - 無縫連接 Foundry 模型目錄和端點

---

## 🎯 模板與範例庫

### 精選：Microsoft Foundry 模板
**開始部署 AI 應用，從這裡開始！**

> **注意：** 這些模板展示多種 AI 模式。有些為外部 Azure 範例，有些為本地實作。

| 模板 | 章節 | 複雜度 | 服務 | 類型 |
|------|-------|---------|-------|------|
| [**開始 AI 聊天**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 章節 2 | ⭐⭐ | AzureOpenAI + Azure AI 搜索 + 容器應用 + 應用程式洞察 | 外部 |
| [**開始 AI 代理**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 章節 2 | ⭐⭐ | Foundry 代理 + AzureOpenAI + Azure AI 搜索 + 容器應用 + 應用程式洞察 | 外部 |
| [**Azure 搜索 + OpenAI 示範**](https://github.com/Azure-Samples/azure-search-openai-demo) | 章節 2 | ⭐⭐ | AzureOpenAI + Azure AI 搜索 + 應用服務 + 儲存體 | 外部 |
| [**OpenAI 聊天應用快速開始**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 章節 2 | ⭐ | AzureOpenAI + 容器應用 + 應用程式洞察 | 外部 |
| [**OpenAI 代理 Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 章節 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso 聊天 RAG**](https://github.com/Azure-Samples/contoso-chat) | 章節 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI 搜索 + Cosmos DB + 容器應用 | 外部 |
| [**零售多代理解決方案**](examples/retail-scenario.md) | 章節 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI 搜索 + 儲存體 + 容器應用 + Cosmos DB | **本地** |

### 精選：完整學習情境
**生產等級應用模板，對應學習章節**

| 模板 | 學習章節 | 複雜度 | 主要學習 |
|------|----------|---------|---------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 章節 2 | ⭐ | 基本 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 章節 2 | ⭐⭐ | Azure AI 搜索的 RAG 實作 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 章節 4 | ⭐⭐ | 文件智能整合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 章節 5 | ⭐⭐⭐ | 代理框架與函式呼叫 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 章節 8 | ⭐⭐⭐ | 企業 AI 協調 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 章節 5 | ⭐⭐⭐⭐ | 擁有客戶與庫存代理的多代理架構 |

### 按範例類型學習

> **📌 本地 vs. 外部範例：**  
> **本地範例**（此存儲庫內）= 可立即使用  
> **外部範例**（Azure Samples）= 從連結倉庫克隆

#### 本地範例（隨時使用）
- [**零售多代理方案**](examples/retail-scenario.md) - 完整生產級實作帶 ARM 模板
  - 多代理架構（客戶 + 庫存代理）
  - 全面監控與評估
  - 一鍵 ARM 模板部署

#### 本地範例 - 容器應用（章節 2-5）
**本存儲庫的容器部署範例：**  
- [**容器應用範例**](examples/container-app/README.md) - 容器部署全攻略
  - [簡易 Flask API](../../examples/container-app/simple-flask-api) - 基本 REST API，具備 scale-to-zero
  - [微服務架構](../../examples/container-app/microservices) - 生產級多服務部署
  - 快速開始、生產與進階部署模式
  - 監控、安全及成本優化指南

#### 外部範例 - 簡單應用（章節 1-2）
**克隆這些 Azure Samples 專案開始使用：**  
- [簡單 Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本部署模式  
- [靜態網站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 靜態內容部署  
- [容器應用 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署  

#### 外部範例 - 資料庫整合（章節 3-4）  
- [資料庫應用 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 資料庫連接模式  
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 無伺服器資料流程  

#### 外部範例 - 進階模式（章節 4-8）
- [Java 微服務](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服務架構  
- [容器應用工作](https://github.com/Azure-Samples/container-apps-jobs) - 背景處理  
- [企業 ML 管道](https://github.com/Azure-Samples/mlops-v2) - 生產就緒 ML 模式  

### 外部模板集
- [**官方 AZD 模板庫**](https://azure.github.io/awesome-azd/) - 官方及社群模板精選
- [**Azure 開發者 CLI 模板**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 模板文件
- [**範例目錄**](examples/README.md) - 本地學習範例詳細說明

---

## 📚 學習資源與參考

### 快速索引
- [**指令速查表**](resources/cheat-sheet.md) - 按章節整理的 azd 重要指令
- [**術語表**](resources/glossary.md) - Azure 與 azd 用語
- [**常見問題**](resources/faq.md) - 依學習章節整理的常見問題
- [**學習指南**](resources/study-guide.md) - 全面實作練習

### 實作工作坊
- [**AI 工作坊實驗室**](docs/chapter-02-ai-development/ai-workshop-lab.md) - 讓你的 AI 解決方案可用 AZD 部署（2-3 小時）
- [**互動式工作坊**](workshop/README.md) - 8 模組指導練習，搭配 MkDocs 與 GitHub Codespaces
  - 流程：介紹 → 選擇 → 驗證 → 解構 → 配置 → 自訂 → 拆除 → 總結

### 外部學習資源
- [Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 定價計算器](https://azure.microsoft.com/pricing/calculator/)
- [Azure 狀態](https://status.azure.com/)

---

## 🔧 快速故障排除指南

**初學者常見問題及快速解決方案：**

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
# 列出可用訂閱
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
<summary><strong>❌ 「配額不足」或「配額已超出」</strong></summary>

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
<summary><strong>❌ 「azd up」 中途失敗</strong></summary>

```bash
# 選項 1：清理並重試
azd down --force --purge
azd up

# 選項 2：只修復基礎設施
azd provision

# 選項 3：檢查詳細狀態
azd show

# 選項 4：在 Azure 監視器中檢查日誌
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ 「認證失敗」或「權杖已過期」</strong></summary>

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
<summary><strong>❌ 範本部署花費時間過長</strong></summary>

**正常等待時間：**
- 簡單的網頁應用程式：5-10分鐘
- 附有資料庫的應用程式：10-15分鐘
- AI 應用程式：15-25分鐘（OpenAI 配置較慢）

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
# - 使用者存取管理員（用於角色分配）
```
</details>

<details>
<summary><strong>❌ 找不到已部署的應用程式 URL</strong></summary>

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

- **常見問題指南：** [詳細解決方案](docs/chapter-07-troubleshooting/common-issues.md)
- **AI 專屬問題：** [AI 故障排除](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **偵錯指南：** [分步偵錯](docs/chapter-07-troubleshooting/debugging.md)
- **尋求協助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 課程完成與認證

### 進度追蹤
追蹤您每個章節的學習進度：

- [ ] **第一章**：基礎與快速入門 ✅
- [ ] **第二章**：AI-先行開發 ✅  
- [ ] **第三章**：設定與認證 ✅
- [ ] **第四章**：基礎建設代碼與部署 ✅
- [ ] **第五章**：多代理 AI 解決方案 ✅
- [ ] **第六章**：部署前驗證與規劃 ✅
- [ ] **第七章**：故障排除與偵錯 ✅
- [ ] **第八章**：生產環境與企業模式 ✅

### 學習驗證
完成每章後，請透過以下步驟檢核您的知識：
1. **實務練習**：完成該章的實作部署
2. **知識檢查**：閱讀該章的常見問題部分
3. **社群討論**：在 Azure Discord 分享您的經驗
4. **下一章節**：進入更高難度的章節

### 課程完成獎勵
完成所有章節後，您將獲得：
- **實務經驗**：完成真實的 AI 應用部署到 Azure
- **專業技能**：企業級部署能力  
- **社群認可**：成為 Azure 開發者社群的活躍成員
- **職涯提升**：具備熱門的 AZD 與 AI 部署專長

---

## 🤝 社群與支援

### 尋求協助與支援
- **技術問題**： [回報錯誤與功能需求](https://github.com/microsoft/azd-for-beginners/issues)
- **學習問題**： [Microsoft Azure Discord 社群](https://discord.gg/microsoft-azure) 及 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 專屬協助**：加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **文件資源**： [官方 Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord 的社群洞察

**#Azure 頻道近期投票結果：**
- **45%** 的開發者希望使用 AZD 來處理 AI 工作負載
- **主要挑戰**：多服務部署、憑證管理、生產準備度  
- **最受歡迎需求**：AI 專用範本、故障排除指南、最佳實務

**加入我們的社群，您可以：**
- 分享 AZD + AI 的使用經驗並獲得協助
- 搶先試用新的 AI 範本預覽版
- 貢獻 AI 部署的最佳實務
- 影響未來 AI + AZD 功能開發

### 對課程的貢獻
歡迎您的貢獻！請閱讀我們的 [貢獻指南](CONTRIBUTING.md) 了解詳情：
- **內容改善**：優化現有章節和範例
- **新增範例**：新增實際案例與範本  
- **翻譯維護**：協助多語言支援
- **錯誤回報**：提升準確性與清晰度
- **社群規範**：遵守包容的社群準則

---

## 📄 課程資訊

### 授權條款
本專案採用 MIT 授權條款，詳情請見 [LICENSE](../../LICENSE) 文件。

### 相關 Microsoft 學習資源

我們團隊製作其他完整的學習課程：

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
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
## 🗺️ 課程導航

**🚀 準備好開始學習了嗎？**

**初學者**: 從 [Chapter 1: Foundation & Quick Start](../..) 開始  
**AI 開發者**: 跳到 [Chapter 2: AI-First Development](../..)  
**有經驗的開發者**: 從 [Chapter 3: Configuration & Authentication](../..) 開始

**下一步**: [開始第 1 章 - AZD 基礎](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件是使用人工智能翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯的。儘管我們致力於提高準確性，但請注意，機器翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為具權威性的來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->