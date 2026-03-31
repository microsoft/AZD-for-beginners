# AZD 初學者指南：結構化學習旅程

![AZD-for-beginners](../../translated_images/zh-HK/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 自動翻譯（持續更新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](./README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **想要本地複製？**
>
> 此存儲庫包含超過50種語言的翻譯，會大幅增加下載大小。若要不包含翻譯進行複製，可使用稀疏檢出：
>
> **Bash / macOS / Linux：**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD（Windows）：**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> 這樣可以讓您快速下載並完成課程所需的全部內容。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 azd 今日新功能

Azure Developer CLI 已超越傳統網頁應用與 API。如今，azd 是部署 <strong>任何</strong> Azure 應用的單一工具——包括 AI 驅動的應用及智能代理。

這對你意味著：

- **AI 代理現為首要 azd 工作負載。** 你可以使用熟悉的 `azd init` → `azd up` 工作流程來初始化、部署和管理 AI 代理項目。
- **Microsoft Foundry 整合** 將模型部署、代理託管及 AI 服務配置直接引入 azd 模板生態系統。
- **核心工作流程保持不變。** 無論是部署待辦事項應用、微服務，還是多代理 AI 解決方案，命令都是相同的。

若你以前用過 azd，AI 支援是自然延伸——不是獨立工具或進階路線。若從零開始，你會學會一套適用於所有事情的工作流程。

---

## 🚀 什麼是 Azure Developer CLI (azd)？

**Azure Developer CLI (azd)** 是一款開發友好的指令列工具，能輕鬆部署應用到 Azure。你無需手動建立及連接許多 Azure 資源，只要一條命令即可部署完整應用。

### `azd up` 的魔法

```bash
# 呢條單一指令就包辦晒所有嘢：
# ✅ 建立所有 Azure 資源
# ✅ 設定網絡同安全性
# ✅ 編譯你嘅應用程式代碼
# ✅ 部署到 Azure
# ✅ 畀你一個可用嘅網址
azd up
```

**就這樣！** 不用點擊 Azure 入口網站、不用先學複雜的 ARM 模板、不用手動配置——只要讓應用立即在 Azure 上運作。

---

## ❓ Azure Developer CLI 與 Azure CLI 有何不同？

這是初學者最常問的問題，以下是簡單答案：

| 功能 | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| <strong>用途</strong> | 管理單一 Azure 資源 | 部署完整應用 |
| <strong>思維模式</strong> | 基礎架構導向 | 應用導向 |
| <strong>範例</strong> | `az webapp create --name myapp...` | `azd up` |
| <strong>學習曲線</strong> | 需瞭解 Azure 服務 | 只需懂你的應用 |
| <strong>最佳適用對象</strong> | DevOps、基礎架構工程師 | 開發者、原型設計者 |

### 簡單類比

- **Azure CLI** 就像擁有建造房屋的各種工具——錘子、鋸子、釘子。你什麼都能做，但必須懂得建築。
- **Azure Developer CLI** 就像請承包商——你說明需求，他們負責建造。

### 何時使用哪個？

| 場景 | 使用工具 |
|----------|----------|
|「我想快速部署網頁應用」 | `azd up` |
|「我只要建立儲存帳戶」 | `az storage account create` |
|「我在建置完整 AI 應用」 | `azd init --template azure-search-openai-demo` |
|「我需要除錯特定 Azure 資源」 | `az resource show` |
|「我想幾分鐘內完成生產環境部署」 | `azd up --environment production` |

### 它們可協同使用！

AZD 底層使用 Azure CLI。你可以同時用兩者：
```bash
# 使用 AZD 部署你的應用程式
azd up

# 然後使用 Azure CLI 微調特定資源
az webapp config set --name myapp --always-on true
```

---

## 🌟 在 Awesome AZD 找模板

不要從頭開始！**Awesome AZD** 是社群收集的即開即用模板：

| 資源 | 說明 |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | 浏覽 200+ 模板，一鍵部署 |
| 🔗 [<strong>提交模板</strong>](https://github.com/Azure/awesome-azd/issues) | 貢獻你自己的模板給社群 |
| 🔗 [**GitHub 儲存庫**](https://github.com/Azure/awesome-azd) | 點星並探索程式碼 |

### Awesome AZD 熱門 AI 模板

```bash
# RAG 聊天：結合 Microsoft Foundry 模型與 AI 搜尋
azd init --template azure-search-openai-demo

# 快速 AI 聊天應用程式
azd init --template openai-chat-app-quickstart

# 使用 Foundry Agents 的 AI 代理
azd init --template get-started-with-ai-agents
```

---

## 🎯 三步驟快速上手

### 第一步：安裝 AZD（2分鐘）

**Windows：**
```powershell
winget install microsoft.azd
```

**macOS：**
```bash
brew tap azure/azd && brew install azd
```

**Linux：**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### 第二步：登入 Azure

```bash
azd auth login
```

### 第三步：部署你的第一個應用

```bash
# 從範本初始化
azd init --template todo-nodejs-mongo

# 部署到 Azure（會建立所有資源！）
azd up
```

**🎉 就這樣！** 你的應用已經在線上 Azure 運行。

### 清理環境（別忘了！）

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 如何使用此課程

本課程設計為 <strong>循序漸進學習</strong> — 從你熟悉的部分開始，逐步提升：

| 你的經驗 | 從這裡開始 |
|-----------------|------------|
| **完全沒有 Azure 經驗** | [第1章：基礎](#-chapter-1-foundation--quick-start) |
| **懂 Azure、新接觸 AZD** | [第1章：基礎](#-chapter-1-foundation--quick-start) |
| **想部署 AI 應用** | [第2章：AI 優先開發](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| <strong>想動手實作</strong> | [🎓 互動工作坊](workshop/README.md) - 3-4小時引導實驗 |
| <strong>需要生產環境模式</strong> | [第8章：生產與企業模式](#-chapter-8-production--enterprise-patterns) |

### 快速設定

1. **Fork 本儲存庫**： [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone 下來**：`git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. <strong>尋求協助</strong>：[Azure Discord 社群](https://discord.com/invite/ByRwuEEgH4)

> **想要本地複製？**

> 此存儲庫包含超過50種語言的翻譯，會大幅增加下載大小。若要不包含翻譯進行複製，可使用稀疏檢出：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 這樣可以讓你快速下載並完成整個課程內容。


## 課程總覽

透過結構化章節掌握 Azure Developer CLI (azd) ，適合循序漸進學習。**特別聚焦於 Microsoft Foundry 整合的 AI 應用部署。**

### 為什麼現代開發者需要這門課程

根據 Microsoft Foundry Discord 社群的調查，**45% 的開發者想使用 AZD 來部署 AI 工作負載**，但遇到以下挑戰：
- 複雜的多服務 AI 架構
- 生產環境 AI 部署最佳實踐  
- Azure AI 服務整合與配置
- AI 工作負載的成本優化
- AI 部署問題的故障排除

### 學習目標

完成本結構化課程後，你將：
- **掌握 AZD 基礎**：核心概念、安裝與配置
- **部署 AI 應用**：使用 AZD 與 Microsoft Foundry 服務
- <strong>實作基礎架構即程式碼</strong>：用 Bicep 模板管理 Azure 資源
- <strong>進行部署故障排除</strong>：解決常見問題及除錯
- <strong>優化生產環境</strong>：安全性、擴展、監控及成本管理
- <strong>建構多代理解決方案</strong>：部署複雜 AI 架構

## 🗺️ 課程地圖：快速章節導航

每章節皆有專屬 README，包含學習目標、快速入門及練習：

| 章節 | 主題 | 課程 | 時長 | 難易度 |
|---------|-------|---------|----------|------------|
| **[第1章：基礎](docs/chapter-01-foundation/README.md)** | 初學入門 | [AZD 基本概念](docs/chapter-01-foundation/azd-basics.md) &#124; [安裝指南](docs/chapter-01-foundation/installation.md) &#124; [第一個專案](docs/chapter-01-foundation/first-project.md) | 30-45 分鐘 | ⭐ |
| **[Ch 2: AI 開發](docs/chapter-02-ai-development/README.md)** | AI-First 應用程式 | [Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI 代理](docs/chapter-02-ai-development/agents.md) &#124; [模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [工作坊](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 小時 | ⭐⭐ |
| **[Ch 3: 配置](docs/chapter-03-configuration/README.md)** | 認證與安全 | [配置](docs/chapter-03-configuration/configuration.md) &#124; [認證與安全](docs/chapter-03-configuration/authsecurity.md) | 45-60 分鐘 | ⭐⭐ |
| **[Ch 4: 基礎設施](docs/chapter-04-infrastructure/README.md)** | IaC 與部署 | [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [資源佈建](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 小時 | ⭐⭐⭐ |
| **[Ch 5: 多代理](docs/chapter-05-multi-agent/README.md)** | AI 代理解決方案 | [零售場景](examples/retail-scenario.md) &#124; [協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 小時 | ⭐⭐⭐⭐ |
| **[Ch 6: 預部署](docs/chapter-06-pre-deployment/README.md)** | 計劃與驗證 | [預檢查](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [應用程式洞察](docs/chapter-06-pre-deployment/application-insights.md) | 1 小時 | ⭐⭐ |
| **[Ch 7: 疑難排解](docs/chapter-07-troubleshooting/README.md)** | 除錯與修復 | [常見問題](docs/chapter-07-troubleshooting/common-issues.md) &#124; [除錯](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI 問題](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 小時 | ⭐⭐ |
| **[Ch 8: 生產環境](docs/chapter-08-production/README.md)** | 企業模式 | [生產實踐](docs/chapter-08-production/production-ai-practices.md) | 2-3 小時 | ⭐⭐⭐⭐ |
| **[🎓 工作坊](workshop/README.md)** | 實作實驗室 | [介紹](workshop/docs/instructions/0-Introduction.md) &#124; [選擇](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [驗證](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [拆解](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [配置](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [自訂](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [拆除](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [總結](workshop/docs/instructions/7-Wrap-up.md) | 3-4 小時 | ⭐⭐ |

**課程總時長：** 約 10-14 小時 | **技能進階：** 初學者 → 生產就緒

---

## 📚 學習章節

<em>根據經驗層級與目標選擇您的學習路徑</em>

### 🚀 第一章：基礎與快速入門
<strong>先決條件</strong>：Azure 訂閱，基本命令行知識  
<strong>時長</strong>：30-45 分鐘  
<strong>難度</strong>：⭐

#### 您將學習
- 理解 Azure Developer CLI 基礎  
- 在您的平台上安裝 AZD  
- 成功部署您的第一個應用程式

#### 學習資源
- **🎯 從這裡開始**： [什麼是 Azure Developer CLI？](#what-is-azure-developer-cli)  
- **📖 理論**： [AZD 基礎](docs/chapter-01-foundation/azd-basics.md) - 核心概念與術語  
- **⚙️ 安裝**： [安裝與設定](docs/chapter-01-foundation/installation.md) - 平台專用指南  
- **🛠️ 實作**： [您的第一個專案](docs/chapter-01-foundation/first-project.md) - 分步教學  
- **📋 速查**： [指令速查表](resources/cheat-sheet.md)

#### 實作練習
```bash
# 快速安裝檢查
azd version

# 部署你的第一個應用程序
azd init --template todo-nodejs-mongo
azd up
```

**💡 本章目標**：順利使用 AZD 部署簡單的網頁應用程式

**✅ 成功驗證：**
```bash
# 完成第一章後，您應該能夠：
azd version              # 顯示安裝的版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署到 Azure
azd show                # 顯示正在運行的應用程式網址
# 應用程式在瀏覽器中開啟並運作
azd down --force --purge  # 清理資源
```

**📊 時間投入：** 30-45 分鐘  
**📈 完成後技能：** 能獨立部署基本應用程式

---

### 🤖 第二章：AI-First 開發（推薦給 AI 開發者）
<strong>先決條件</strong>：完成第一章  
<strong>時長</strong>：1-2 小時  
<strong>難度</strong>：⭐⭐

#### 您將學習
- Microsoft Foundry 與 AZD 的整合  
- 部署 AI 驅動的應用程式  
- 理解 AI 服務配置

#### 學習資源
- **🎯 從這裡開始**： [Microsoft Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md)  
- **🤖 AI 代理**： [AI 代理指南](docs/chapter-02-ai-development/agents.md) - 使用 AZD 部署智慧代理  
- **📖 模式**： [AI 模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) - 部署與管理 AI 模型  
- **🛠️ 工作坊**： [AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - 讓您的 AI 解決方案符合 AZD 標準  
- **🎥 互動指南**： [工作坊資源](workshop/README.md) - 使用 MkDocs 與 DevContainer 瀏覽器學習環境  
- **📋 範本**： [Microsoft Foundry 範本](#工作坊資源)  
- **📝 範例**： [AZD 部署範例](examples/README.md)

#### 實作練習
```bash
# 部署你的第一個AI應用程式
azd init --template azure-search-openai-demo
azd up

# 嘗試其他AI範本
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 本章目標**：部署並配置具備 RAG 功能的 AI 聊天應用程式

**✅ 成功驗證：**
```bash
# 完成第二章後，您應該能夠：
azd init --template azure-search-openai-demo
azd up
# 測試 AI 聊天介面
# 提問及獲得帶有來源的 AI 回應
# 驗證搜尋整合功能是否運作
azd monitor  # 檢查 Application Insights 顯示的遙測資料
azd down --force --purge
```

**📊 時間投入：** 1-2 小時  
**📈 完成後技能：** 能部署並配置生產就緒的 AI 應用程式  
**💰 成本意識：** 理解開發環境 $80-150/月，生產環境 $300-3500/月的成本範圍

#### 💰 AI 部署成本考量

**開發環境（預估 $80-150/月）：**
- Microsoft Foundry 模型（按使用量付費）：$0-50/月（取決使用的 token 數）  
- AI 搜索（基礎方案）：$75/月  
- 容器應用（消耗方案）：$0-20/月  
- 儲存（標準）：$1-5/月  

**生產環境（預估 $300-3500+ /月）：**
- Microsoft Foundry 模型（PTU 確保持續表現）：$3,000+/月或大量用量下按使用付費  
- AI 搜索（標準方案）：$250/月  
- 容器應用（專用方案）：$50-100/月  
- 應用洞察：$5-50/月  
- 儲存（高階）：$10-50/月

**💡 成本優化建議：**
- 使用 <strong>免費層</strong> Microsoft Foundry 模型學習（Azure OpenAI 含 50,000 token/月）  
- 不開發時執行 `azd down` 以釋放資源  
- 初期採用消耗型付款，僅在生產時升級為 PTU  
- 使用 `azd provision --preview` 預覽部署成本  
- 啟用自動擴展：僅為實際使用付費

**成本監控：**
```bash
# 檢查預估每月費用
azd provision --preview

# 在 Azure 入口網站監察實際費用
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第三章：配置與認證
<strong>先決條件</strong>：完成第一章  
<strong>時長</strong>：45-60 分鐘  
<strong>難度</strong>：⭐⭐

#### 您將學習
- 環境配置與管理  
- 認證與安全最佳實踐  
- 資源命名與組織

#### 學習資源
- **📖 配置**： [配置指南](docs/chapter-03-configuration/configuration.md) - 環境設定  
- **🔐 安全**： [認證模式與管理身分](docs/chapter-03-configuration/authsecurity.md) - 認證模式介紹  
- **📝 範例**： [資料庫應用範例](examples/database-app/README.md) - AZD 資料庫範例

#### 實作練習
- 配置多個環境（開發、預備、生產）  
- 設定管理身份認證  
- 實施環境專屬配置

**💡 本章目標**：妥善管理多個環境，確保認證及安全

---

### 🏗️ 第四章：基礎設施即代碼與部署
<strong>先決條件</strong>：完成第一至三章  
<strong>時長</strong>：1-1.5 小時  
<strong>難度</strong>：⭐⭐⭐

#### 您將學習
- 進階部署模式  
- 使用 Bicep 的 Infrastructure as Code  
- 資源佈建策略

#### 學習資源
- **📖 部署**： [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) - 完整工作流程  
- **🏗️ 佈建**： [資源佈建](docs/chapter-04-infrastructure/provisioning.md) - Azure 資源管理  
- **📝 範例**： [容器應用範例](../../examples/container-app) - 容器化部署範例

#### 實作練習
- 建立自訂 Bicep 範本  
- 部署多服務應用程式  
- 實作藍綠部署策略

**💡 本章目標**：利用自訂基礎設施範本部署複雜的多服務應用程式

---

### 🎯 第五章：多代理 AI 解決方案（進階）
<strong>先決條件</strong>：完成第一及第二章  
<strong>時長</strong>：2-3 小時  
<strong>難度</strong>：⭐⭐⭐⭐

#### 您將學習
- 多代理架構模式  
- 代理編排與協調  
- 生產就緒的 AI 部署

#### 學習資源
- **🤖 特色專案**： [零售多代理方案](examples/retail-scenario.md) - 完整實作  
- **🛠️ ARM 範本**： [ARM 範本套件](../../examples/retail-multiagent-arm-template) - 一鍵部署  
- **📖 架構**： [多代理協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) - 模式介紹

#### 實作練習
```bash
# 部署完整的零售多代理解決方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索代理配置
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 本章目標**：部署並管理具備客戶與庫存代理的生產就緒多代理 AI 解決方案

---

### 🔍 第六章：預部署驗證與計劃
<strong>先決條件</strong>：完成第四章  
<strong>時長</strong>：1 小時  
<strong>難度</strong>：⭐⭐

#### 您將學習
- 容量規劃與資源驗證  
- SKU 選擇策略  
- 預檢查與自動化

#### 學習資源
- **📊 規劃**： [容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) - 資源驗證  
- **💰 選擇**： [SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) - 成本有效選擇  
- **✅ 驗證**： [預檢查](docs/chapter-06-pre-deployment/preflight-checks.md) - 自動腳本

#### 實作練習
- 執行容量驗證腳本  
- 優化成本選擇 SKU  
- 實施自動化預部署檢查

**💡 本章目標**：在執行前驗證並優化部署

---

### 🚨 第七章：疑難排解與除錯
<strong>先決條件</strong>：完成任一部署章節  
<strong>時長</strong>：1-1.5 小時  
<strong>難度</strong>：⭐⭐

#### 您將學習
- 系統化除錯方法  
- 常見問題與解決方案  
- AI 相關問題排解

#### 學習資源
- **🔧 常見問題**： [常見問題](docs/chapter-07-troubleshooting/common-issues.md) - FAQ 與解決方案  
- **🕵️ 除錯**： [除錯指南](docs/chapter-07-troubleshooting/debugging.md) - 分步策略  
- **🤖 AI 問題**： [AI 特定問題排解](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI 服務問題

#### 實作練習
- 診斷部署失敗原因  
- 解決認證問題  
- 除錯 AI 服務連接問題

**💡 本章目標**：獨立診斷並解決常見部署問題

---

### 🏢 第八章：生產與企業模式
<strong>先決條件</strong>：完成第一至第四章  
<strong>時長</strong>：2-3 小時  
<strong>難度</strong>：⭐⭐⭐⭐

#### 您將學習
- 生產環境部署策略  
- 企業安全模式  
- 監控與成本優化

#### 學習資源
- **🏭 生產環境**: [生產 AI 最佳實踐](docs/chapter-08-production/production-ai-practices.md) - 企業模式
- **📝 範例**: [微服務範例](../../examples/microservices) - 複雜架構
- **📊 監控**: [Application Insights 整合](docs/chapter-06-pre-deployment/application-insights.md) - 監控

#### 實務練習
- 實作企業安全模式
- 設定全面監控
- 以合適治理部署至生產環境

**💡 章節成果**: 部署具備完整生產能力的企業級應用程式

---

## 🎓 工作坊概覽：實作學習體驗

> **⚠️ 工作坊狀態：持續開發中**  
> 工作坊教材目前正在開發與完善中。核心模組功能正常，但部分進階章節尚未完成。我們正積極完善全部內容。[追蹤進度 →](workshop/README.md)

### 互動式工作坊教材
<strong>使用瀏覽器工具及引導練習的全面實作學習</strong>

我們的工作坊教材提供結構化且互動式的學習體驗，作為上述章節體系的輔助。工作坊適用於自學與講師帶領。

#### 🛠️ 工作坊特色
- <strong>瀏覽器介面</strong>：完整的 MkDocs 驅動工作坊，具備搜尋、複製及主題功能
- **GitHub Codespaces 整合**：一鍵設定開發環境
- <strong>結構化學習路徑</strong>：8 個模組的引導練習 (共約 3-4 小時)
- <strong>循序漸進方法</strong>：介紹 → 選擇 → 驗證 → 解構 → 配置 → 客製化 → 清理 → 總結
- **互動 DevContainer 環境**：預先配置好的工具與相依性

#### 📚 工作坊模組架構
工作坊採用 **8 模組循序漸進方法**，帶您從探索到部署專精：

| 模組 | 主題 | 將執行內容 | 時長 |
|--------|-------|----------------|----------|
| **0. 介紹** | 工作坊概覽 | 了解學習目標、前置條件與工作坊結構 | 15 分鐘 |
| **1. 選擇** | 模板探索 | 探索 AZD 模板並挑選適合場景的 AI 模板 | 20 分鐘 |
| **2. 驗證** | 部署與驗證 | 使用 `azd up` 部署模板並驗證基礎架構 | 30 分鐘 |
| **3. 解構** | 了解結構 | 使用 GitHub Copilot 探索模板架構、Bicep 檔案與程式碼組織 | 30 分鐘 |
| **4. 配置** | azure.yaml 深度解析 | 精通 `azure.yaml` 配置、生命週期掛鉤與環境變數 | 30 分鐘 |
| **5. 客製化** | 量身打造 | 啟用 AI 搜尋、追蹤、評估，並依場景自訂 | 45 分鐘 |
| **6. 清理** | 清理資源 | 使用 `azd down --purge` 安全地解除資源配置 | 15 分鐘 |
| **7. 總結** | 下一步 | 回顧成果、關鍵概念並持續學習路徑 | 15 分鐘 |

**工作坊流程：**  
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```
  
#### 🚀 工作坊入門  
```bash
# 選項 1：GitHub Codespaces（推薦）
# 在儲存庫中點擊「Code」→「Create codespace on main」

# 選項 2：本地開發
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 按照 workshop/README.md 中的設置說明進行操作
```
  
#### 🎯 工作坊學習成果  
完成工作坊後，參與者將能：  
- **部署生產級 AI 應用程式**：使用 AZD 配合 Microsoft Foundry 服務  
- <strong>精通多代理架構</strong>：實作協同 AI 代理解決方案  
- <strong>實施安全最佳實踐</strong>：設定驗證與存取控制  
- <strong>優化擴展性</strong>：設計具成本效益且高效能的部署  
- <strong>排解部署問題</strong>：獨立解決常見問題  

#### 📖 工作坊資源  
- **🎥 互動指南**： [工作坊教材](workshop/README.md) - 瀏覽器互動學習環境  
- **📋 模組分章指導**：  
  - [0. 介紹](workshop/docs/instructions/0-Introduction.md) - 工作坊概覽與目標  
  - [1. 選擇](workshop/docs/instructions/1-Select-AI-Template.md) - 查找並挑選 AI 模板  
  - [2. 驗證](workshop/docs/instructions/2-Validate-AI-Template.md) - 部署並驗證模板  
  - [3. 解構](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - 探究模板架構  
  - [4. 配置](workshop/docs/instructions/4-Configure-AI-Template.md) - 精通 azure.yaml  
  - [5. 客製化](workshop/docs/instructions/5-Customize-AI-Template.md) - 依場景自訂  
  - [6. 清理](workshop/docs/instructions/6-Teardown-Infrastructure.md) - 清理資源  
  - [7. 總結](workshop/docs/instructions/7-Wrap-up.md) - 回顧與下一步  
- **🛠️ AI 工作坊實驗室**： [AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI 專注練習  
- **💡 快速開始**： [工作坊設定指南](workshop/README.md#quick-start) - 環境配置  

<strong>適合對象</strong>：企業訓練、大專課程、自學及開發者訓練營。

---

## 📖 深入探討：AZD 功能

除了基礎功能，AZD 提供強大功能支援生產環境部署：

- <strong>基於模板的部署</strong> - 使用現成模板適用於常見應用模式  
- <strong>基礎設施即程式碼</strong> - 使用 Bicep 或 Terraform 管理 Azure 資源  
- <strong>整合化工作流程</strong> - 無縫設定、部署與監控應用程式  
- <strong>開發者友好</strong> - 優化開發效率與體驗  

### **AZD + Microsoft Foundry：AI 部署最佳搭配**

**為何選擇 AZD 部署 AI 解決方案？** AZD 解決 AI 開發主要挑戰：

- **AI 就緒模板** - 預配置 Microsoft Foundry 模型、認知服務及 ML 工作負載模板  
- **安全 AI 部署** - 內建 AI 服務、API 金鑰與模型端點的安全模式  
- **生產級 AI 模式** - 可擴展且具成本效益的 AI 應用部署最佳做法  
- **端對端 AI 工作流程** - 從模型開發到生產部署並正確監控  
- <strong>成本優化</strong> - 智慧資源分配與擴展策略  
- **Microsoft Foundry 整合** - 與 Microsoft Foundry 模型目錄與端點無縫連接  

---

## 🎯 模板與範例庫

### 精選：Microsoft Foundry 模板  
**部署 AI 應用請從這裡開始！**

> **注意：** 這些模板示範多種 AI 模式。部分為 Azure Samples 外部範例，部分為本地實作。

| 模板 | 章節 | 複雜度 | 服務 | 類型 |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第 2 章 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | 外部 |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第 2 章 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| 外部 |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第 2 章 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | 外部 |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第 2 章 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第 5 章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 第 8 章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | 外部 |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | 第 5 章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | <strong>本地</strong> |

### 精選：完整學習場景  
**符合生產的應用模板，對應學習章節**

| 模板 | 學習章節 | 複雜度 | 主要學習重點 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第 2 章 | ⭐ | 基本 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第 2 章 | ⭐⭐ | 使用 Azure AI Search 的 RAG 實作 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第 4 章 | ⭐⭐ | 文件智能整合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第 5 章 | ⭐⭐⭐ | 代理框架與函數調用 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第 8 章 | ⭐⭐⭐ | 企業 AI 協調 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第 5 章 | ⭐⭐⭐⭐ | 擁有顧客與庫存代理的多代理架構 |

### 根據範例類型學習

> **📌 本地 vs 外部範例：**  
> <strong>本地範例</strong>（本存放庫）= 可立即使用  
> <strong>外部範例</strong>（Azure Samples）= 從相關儲存庫克隆

#### 本地範例（可立即使用）
- [<strong>零售多代理解決方案</strong>](examples/retail-scenario.md) - 完整生產級實作附 ARM 模板  
  - 多代理架構 (顧客 + 庫存代理)  
  - 全面監控與評估  
  - 透過 ARM 模板一鍵部署  

#### 本地範例 - 容器應用（第 2-5 章）
**本存放庫中全面的容器部署範例：**  
- [<strong>容器應用範例</strong>](examples/container-app/README.md) - 容器化部署完整指南  
  - [簡易 Flask API](../../examples/container-app/simple-flask-api) - 基本 REST API 並支援 scale-to-zero  
  - [微服務架構](../../examples/container-app/microservices) - 生產級多服務部署  
  - 快速入門、生產與進階部屬模式  
  - 監控、安全與成本優化指導  

#### 外部範例 - 簡易應用（第 1-2 章）
**克隆下列 Azure Samples 儲存庫開始：**  
- [簡易網頁應用 - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本部署模式  
- [靜態網站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 靜態內容部署  
- [容器應用 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署  

#### 外部範例 - 資料庫整合（第 3-4 章）  
- [資料庫應用 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 資料庫連接模式  
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 無伺服器資料工作流程  

#### 外部範例 - 進階模式（第 4-8 章）
- [Java 微服務](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服務架構  
- [容器應用工作](https://github.com/Azure-Samples/container-apps-jobs) - 背景處理  
- [企業 ML 管線](https://github.com/Azure-Samples/mlops-v2) - 生產級 ML 模式  

### 外部模板集錦
- [**官方 AZD 模板庫**](https://azure.github.io/awesome-azd/) - 精選官方及社群模板  
- [**Azure Developer CLI 模板**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 模板文件  
- [<strong>範例目錄</strong>](examples/README.md) - 本地學習範例及詳解  

---

## 📚 學習資源與參考

### 快速參考
- [<strong>指令速查表</strong>](resources/cheat-sheet.md) - 依章節組織的常用 azd 指令  
- [<strong>術語表</strong>](resources/glossary.md) - Azure 與 azd 專有名詞  
- [<strong>常見問題集</strong>](resources/faq.md) - 依學習章節分類的常見問答  
- [<strong>學習指南</strong>](resources/study-guide.md) - 全面練習題目  

### 實作工作坊
- [**AI 工作坊實驗室**](docs/chapter-02-ai-development/ai-workshop-lab.md) - 使你的 AI 解決方案可用 AZD 部署（2-3 小時）  
- [<strong>互動工作坊</strong>](workshop/README.md) - 8 模組引導練習，採用 MkDocs 與 GitHub Codespaces  
  - 流程：介紹 → 選擇 → 驗證 → 解構 → 配置 → 客製化 → 清理 → 總結  

### 外部學習資源
- [Azure Developer CLI 文件說明](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 價格計算器](https://azure.microsoft.com/pricing/calculator/)
- [Azure 狀態](https://status.azure.com/)

### 你的編輯器的 AI 代理技能
- [**skills.sh 上的 Microsoft Azure 技能**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 項關於 Azure AI、Foundry、部署、診斷、成本優化等的開放代理技能。可安裝於 GitHub Copilot、Cursor、Claude Code 或任何支援的代理中：
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 快速疑難排解指南

**初學者常見問題及即時解決方案：**

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

# 驗證安裝是否成功
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" 或 "Subscription not set"</strong></summary>

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
<summary><strong>❌ "azd up" 中途失敗</strong></summary>

```bash
# 選項 1：清理並重試
azd down --force --purge
azd up

# 選項 2：只修復基礎設施
azd provision

# 選項 3：檢查詳細狀態
azd show

# 選項 4：在 Azure 監視器中查看日誌
azd monitor --logs
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
# AZD 會產生獨特名稱，但如果有衝突：
azd down --force --purge

# 然後用全新環境重試
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 模板部署時間過長</strong></summary>

**正常等待時間：**
- 簡單網頁應用：5-10 分鐘
- 帶資料庫的應用程式：10-15 分鐘
- AI 應用程式：15-25 分鐘（OpenAI 配置較慢）

```bash
# 檢查進度
azd show

# 如果卡住超過30分鐘，檢查Azure門戶：
azd monitor
# 找尋失敗的部署
```
</details>

<details>
<summary><strong>❌ "Permission denied" 或 "Forbidden"</strong></summary>

```bash
# 檢查你的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 你至少需要「參與者」角色
# 請求你的 Azure 管理員授予：
# - 參與者（資源用）
# - 使用者存取管理員（角色指派用）
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

### 📚 完整疑難排解資源

- **常見問題指南：** [詳細解決方案](docs/chapter-07-troubleshooting/common-issues.md)
- **AI 專用問題：** [AI 疑難排解](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **除錯指南：** [逐步除錯](docs/chapter-07-troubleshooting/debugging.md)
- **尋求協助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 課程完成與認證

### 進度追蹤
追蹤你每章節的學習進度：

- [ ] **第 1 章**：基礎與快速入門 ✅
- [ ] **第 2 章**：AI 優先開發 ✅  
- [ ] **第 3 章**：設定與驗證 ✅
- [ ] **第 4 章**：基礎設施即程式碼與部署 ✅
- [ ] **第 5 章**：多代理 AI 解決方案 ✅
- [ ] **第 6 章**：部署前驗證與規劃 ✅
- [ ] **第 7 章**：疑難排解與除錯 ✅
- [ ] **第 8 章**：生產與企業模式 ✅

### 學習驗證
完成每個章節後，請透過以下方式驗證你的知識：
1. <strong>實務練習</strong>：完成本章節的動手部署
2. <strong>知識檢核</strong>：檢視本章 FAQ 區段
3. <strong>社區討論</strong>：在 Azure Discord 分享你的經驗
4. <strong>下一章</strong>：進入更高難度章節

### 完成課程的好處
完成所有章節後，你將擁有：
- <strong>生產經驗</strong>：已將真實 AI 應用部署至 Azure
- <strong>專業技能</strong>：具備企業級部署能力  
- <strong>社區認可</strong>：成為積極的 Azure 開發社群成員
- <strong>職涯提升</strong>：掌握需求旺盛的 AZD 與 AI 部署專業

---

## 🤝 社區與支援

### 尋求協助與支援
- <strong>技術問題</strong>： [回報錯誤與功能請求](https://github.com/microsoft/azd-for-beginners/issues)
- <strong>學習問題</strong>：[Microsoft Azure Discord 社區](https://discord.gg/microsoft-azure) 及 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 專項支援**：加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- <strong>文件資源</strong>：[官方 Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### 來自 Microsoft Foundry Discord 的社區見解

**#Azure 頻道近期調查結果：**
- **45%** 的開發者有意用 AZD 處理 AI 工作負載
- <strong>主要挑戰</strong>：多服務部署、憑證管理、生產就緒度  
- <strong>最受歡迎需求</strong>：AI 專用模板、疑難排解指南、最佳實務

**加入我們的社區來：**
- 分享你的 AZD + AI 體驗並獲得協助
- 優先體驗新 AI 模板預覽
- 共同完善 AI 部署最佳實務
- 影響未來 AI + AZD 功能開發

### 貢獻此課程
我們歡迎貢獻！請參考我們的[貢獻指南](CONTRIBUTING.md)了解詳情：
- <strong>內容優化</strong>：增強現有章節與範例
- <strong>新增範例</strong>：加入真實場景與模板  
- <strong>翻譯協助</strong>：維護多語言支持
- <strong>錯誤回報</strong>：提升內容準確與清晰度
- <strong>社群規範</strong>：遵循我們的包容社群指導原則

---

## 📄 課程資訊

### 授權條款
本專案採用 MIT 授權，詳見 [LICENSE](../../LICENSE) 文件。

### 相關 Microsoft 學習資源

我們團隊製作其他完整學習課程：

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

## 🗺️ 課程導覽

**🚀 準備好開始學習了嗎？**

<strong>初學者</strong>：由[第 1 章：基礎與快速入門](#-chapter-1-foundation--quick-start)開始  
**AI 開發人員**：跳至[第 2 章：AI 優先開發](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
<strong>有經驗的開發人員</strong>：從[第 3 章：設定與驗證](#️-chapter-3-configuration--authentication)開始

<strong>下一步</strong>：[開始第 1 章 - AZD 基本知識](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用本翻譯所引起的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->