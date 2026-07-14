# AZD 初學者指南：有結構的學習旅程

![AZD-for-beginners](../../translated_images/zh-TW/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 自動翻譯（永遠保持最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](./README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **偏好本機複製？**
>
> 此儲存庫包含50多種語言的翻譯檔案，會大幅增加下載大小。如需不帶翻譯的複製，請使用稀疏檢出：
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
> 這樣能快速下載，並包含完成課程所需的所有內容。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 今日 azd 新功能

> 📌 本課程經過 **`azd 1.27.1`**（2026年7月）驗證。執行 `azd version` 查詢版本，執行 `azd upgrade` 以取得最新版本。

Azure Developer CLI 已超越傳統網頁應用和 API。今天，azd 是部署 <strong>任何</strong> Azure 應用的單一工具—包括 AI 驅動的應用與智能代理。

這對你代表什麼：

- **AI 代理現在是正式的 azd 工作負載。** 你可以使用你已熟悉的 `azd init` → `azd up` 工作流程初始化、部署和管理 AI 代理專案。
- **從 CLI 管理完整代理生命週期。** `azure.ai.agents` 擴充功能涵蓋整個流程—`azd ai agent init` 建立結構、`azd ai agent invoke` 測試（含回應時間輸出）、`azd ai agent eval generate` 與 `azd ai agent optimize` 以評估和提升品質，以及 `azd ai agent delete` 進行清理。
- **更多 AI 建構模組。** 新的預覽擴充功能—`azure.ai.skills` 和 `azure.ai.connections`—允許你直接透過 azd 管理可重用的代理技能與 Foundry 連線。
- **Microsoft Foundry 整合** 將模型部署、代理主機和 AI 服務配置直接納入 azd 範本生態系。
- **日常基本工作更順暢。** 最近發佈使 `azd init` 可重複安全執行，`azd auth login` 自動清除過期的令牌，並新增友好的 `azd tool` 首次執行設定提示。
- **核心工作流程未改變。** 無論你在部署待辦事項應用、微服務或多代理 AI 解決方案，指令都是一樣的。

> **Aspire 用戶注意：** 微軟現在將此產品簡稱為 **Aspire**（前稱“.NET Aspire”）。azd 的 Aspire 支援不變，僅名稱更新。

如果你以前用過 azd，AI 支援就是自然延伸—不是獨立工具或進階課程。若你是新手，會學到一個適用所有的工作流程。

---

## 🚀 什麼是 Azure Developer CLI (azd)？

**Azure Developer CLI (azd)** 是一款開發者友好的指令列工具，使向 Azure 部署應用變得簡單。你無需手動創建和連接多個 Azure 資源，一條指令就可部署完整應用。

### `azd up` 的神奇之處

```bash
# 這個單一命令完成所有工作：
# ✅ 建立所有 Azure 資源
# ✅ 設定網路和安全性
# ✅ 建置您的應用程式程式碼
# ✅ 部署到 Azure
# ✅ 提供您一個可用的網址
azd up
```

**就這樣！** 不須點擊 Azure 入口網站、不用先學複雜 ARM 模板，也不需手動配置，直接在 Azure 上有可運行的應用。

---

## ❓ Azure Developer CLI 與 Azure CLI：有何差別？

這是初學者最常問的問題。簡單回答如下：

| 功能 | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| <strong>目的</strong> | 管理單一 Azure 資源 | 部署完整應用程式 |
| <strong>思維方式</strong> | 基礎設施導向 | 應用導向 |
| <strong>範例</strong> | `az webapp create --name myapp...` | `azd up` |
| <strong>學習曲線</strong> | 必須熟悉 Azure 服務 | 只要知道你的應用程式 |
| <strong>適用對象</strong> | DevOps、基礎架構 | 開發者、原型製作 |

### 簡單比喻

- **Azure CLI** 就像你擁有整套建房工具—榔頭、鋸子、釘子。你可以建任何東西，但需要懂建築。
- **Azure Developer CLI** 就像請承包商幫你建造—你描述需求，他們負責施工。

### 什麼時候用哪一個

| 情境 | 使用此指令 |
|----------|----------|
| 「我要快速部署我的網頁應用」 | `azd up` |
| 「我只需建立一個儲存帳戶」 | `az storage account create` |
| 「我在建立完整 AI 應用程式」 | `azd init --template azure-search-openai-demo` |
| 「我要除錯特定 Azure 資源」 | `az resource show` |
| 「我想快速達成生產就緒部署」 | `azd up --environment production` |

### 它們可一起使用！

AZD 在底層使用 Azure CLI。兩者都可使用：
```bash
# 使用 AZD 部署您的應用程式
azd up

# 然後使用 Azure CLI 微調特定資源
az webapp config set --name myapp --always-on true
```

---

## 🌟 在 Awesome AZD 找範本

不用從零開始！**Awesome AZD** 是社群精選可一鍵部署範本集：

| 資源 | 說明 |
|----------|-------------|
| 🔗 [**Awesome AZD 展示頁**](https://azure.github.io/awesome-azd/) | 瀏覽 200+ 範本並一鍵部署 |
| 🔗 [<strong>提交範本</strong>](https://github.com/Azure/awesome-azd/issues) | 向社群貢獻你自己的範本 |
| 🔗 [**GitHub 儲存庫**](https://github.com/Azure/awesome-azd) | 點星並瀏覽原始碼 |

### Awesome AZD 熱門 AI 範本

```bash
# 使用 Microsoft Foundry 模型和 AI 搜尋的 RAG 聊天
azd init --template azure-search-openai-demo

# 快速 AI 聊天應用程式
azd init --template openai-chat-app-quickstart

# 使用 Foundry 代理的 AI 代理
azd init --template get-started-with-ai-agents
```

---

## 🎯 3 步驟開始

開始前，請確保你的機器符合要部署範本的需求：

**Windows：**
```powershell
.\validate-setup.ps1
```

**macOS / Linux：**
```bash
bash ./validate-setup.sh
```

若有任何檢查未通過，請先修正，再繼續快速開始。

### 步驟 1：安裝 AZD（2 分鐘）

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

### 步驟 2：AZD 認證

```bash
# 如果您打算在本課程中直接使用 Azure CLI 命令，則此選項為可選
az login

# AZD 工作流程所需
azd auth login
```

若不確定需要哪一種，請參考 [安裝與設定](docs/chapter-01-foundation/installation.md#authentication-setup) 完整流程。

### 步驟 3：部署你的第一個應用

```bash
# 從範本初始化
azd init --template todo-nodejs-mongo

# 部署到 Azure（建立所有資源！）
azd up
```

**🎉 就這樣！** 你的應用已經在 Azure 上線。

### 清理資源（別忘了！）

```bash
# 完成實驗後刪除所有資源
azd down --force --purge
```

---

## 📚 如何使用本課程

本課程設計為 <strong>漸進式學習</strong> — 從你熟悉的地方開始，逐步進階：

| 你的經驗 | 從這裡開始 |
|-----------------|------------|
| **剛接觸 Azure** | [章節 1：基礎](#-chapter-1-foundation--quick-start) |
| **認識 Azure，初用 AZD** | [章節 1：基礎](#-chapter-1-foundation--quick-start) |
| **想要部署 AI 應用** | [章節 2：AI-第一開發](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| <strong>想要動手實作</strong> | [🎓 互動式工作坊](workshop/README.md) - 3-4 小時導引實驗 |
| <strong>需要生產環境模式</strong> | [章節 8：生產與企業模式](#-chapter-8-production--enterprise-patterns) |

### 快速設定

1. **Fork 此儲存庫**： [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. <strong>複製它</strong>： `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. <strong>尋求協助</strong>： [Azure Discord 社群](https://discord.com/invite/ByRwuEEgH4)

> **偏好本機複製？**

> 此儲存庫包含50多種語言的翻譯檔案，會大幅增加下載大小。如需不帶翻譯的複製，請使用稀疏檢出：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 這樣能快速下載，並包含完成課程所需的所有內容。


## 課程概覽

透過結構化章節掌握 Azure Developer CLI（azd），設計為漸進式學習。**特別聚焦於 Microsoft Foundry 整合的 AI 應用部署。**


### 為什麼本課程是現代開發者必備

根據 Microsoft Foundry Discord 社群洞察，**45% 的開發者希望使用 AZD 進行 AI 工作負載**，但面臨以下挑戰：
- 複雜的多服務 AI 架構
- 生產環境 AI 部署最佳實踐  
- Azure AI 服務整合與設定
- AI 工作負載的成本優化
- 解決 AI 專屬部署問題

### 學習目標

完成本結構式課程後，您將能：
- **精通 AZD 基礎**：核心概念、安裝與設定
- **部署 AI 應用程式**：結合 Microsoft Foundry 服務使用 AZD
- <strong>實作基礎架構即程式碼</strong>：使用 Bicep 模板管理 Azure 資源
- <strong>排解部署問題</strong>：解決常見問題與除錯
- <strong>優化生產環境</strong>：安全性、擴充性、監控與成本管理
- <strong>建置多代理解決方案</strong>：部署複雜 AI 架構

## 開始前準備：帳號、權限與假設

在開始第 1 章之前，請確保您具備以下準備。後續安裝步驟假設這些基本條件已經就緒。

- **Azure 訂閱**：可使用工作或個人帳號的既有訂閱，或建立 [免費試用](https://aka.ms/azurefreetrial)。
- **建立 Azure 資源的權限**：大多數練習需要在目標訂閱或資源群組中擁有至少 <strong>參與者</strong> 權限。有些章節可能需能建立資源群組、管理身份及 RBAC 指派。
- [**GitHub 帳戶**](https://github.com)：方便 fork 倉庫、追蹤個人變更，以及使用 GitHub Codespaces 進行工作坊。
- <strong>模板執行前置條件</strong>：部分模板需本機工具，如 Node.js、Python、Java 或 Docker。請先執行安裝驗證器，及早發現缺少工具。
- <strong>基本終端機操作能力</strong>：無需專家，但應熟悉執行 `git clone`、`azd auth login` 和 `azd up` 等指令。

> **在企業訂閱中工作？**
> 若您的 Azure 環境由管理員控管，請事先確認您能在計畫使用的訂閱或資源群組部署資源。若無，請先申請沙盒訂閱或參與者權限。

> **Azure 新手？**
> 請先使用您自己的 Azure 試用或隨用隨付訂閱 https://aka.ms/azurefreetrial，這樣您可以順利完整執行所有練習，無須等待租戶層級的審批。

## 🗺️ 課程地圖：章節快速導航

每一章均有專屬 README，包含學習目標、快速入門與練習：

| 章節 | 主題 | 課程 | 時長 | 複雜度 |
|---------|-------|---------|----------|------------|
| **[第 1 章：基礎](docs/chapter-01-foundation/README.md)** | 入門基礎 | [AZD 基礎](docs/chapter-01-foundation/azd-basics.md) &#124; [安裝](docs/chapter-01-foundation/installation.md) &#124; [第一個專案](docs/chapter-01-foundation/first-project.md) | 30-45 分鐘 | ⭐ |
| **[第 2 章：AI 開發](docs/chapter-02-ai-development/README.md)** | AI 優先應用 | [Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI 代理](docs/chapter-02-ai-development/agents.md) &#124; [模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [工作坊](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 小時 | ⭐⭐ |
| **[第 3 章：設定](docs/chapter-03-configuration/README.md)** | 驗證與安全 | [設定](docs/chapter-03-configuration/configuration.md) &#124; [驗證與安全](docs/chapter-03-configuration/authsecurity.md) | 45-60 分鐘 | ⭐⭐ |
| **[第 4 章：基礎架構](docs/chapter-04-infrastructure/README.md)** | IaC 與部署 | [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [佈建](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 小時 | ⭐⭐⭐ |
| **[第 5 章：多代理](docs/chapter-05-multi-agent/README.md)** | AI 代理解決方案 | [零售情境](examples/retail-scenario.md) &#124; [協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 小時 | ⭐⭐⭐⭐ |
| **[第 6 章：部署前準備](docs/chapter-06-pre-deployment/README.md)** | 規劃與驗證 | [預檢查](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [應用程式洞察](docs/chapter-06-pre-deployment/application-insights.md) | 1 小時 | ⭐⭐ |
| **[第 7 章：故障排除](docs/chapter-07-troubleshooting/README.md)** | 除錯與修復 | [常見問題](docs/chapter-07-troubleshooting/common-issues.md) &#124; [除錯](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI 問題](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 小時 | ⭐⭐ |
| **[第 8 章：生產環境](docs/chapter-08-production/README.md)** | 企業級模式 | [生產實務](docs/chapter-08-production/production-ai-practices.md) | 2-3 小時 | ⭐⭐⭐⭐ |
| **[🎓 工作坊](workshop/README.md)** | 實作實驗室 | [介紹](workshop/docs/instructions/0-Introduction.md) &#124; [選擇](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [驗證](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [拆解](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [設定](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [客製化](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [拆除](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [結束](workshop/docs/instructions/7-Wrap-up.md) | 3-4 小時 | ⭐⭐ |

**整體課程時長：** 約 10-14 小時 | **技能進階：** 初學者 → 生產就緒

---

## 📚 學習章節

<em>根據經驗與目標選擇您的學習路徑</em>

### 🚀 第 1 章：基礎與快速入門
<strong>先決條件</strong>：Azure 訂閱及基本命令列知識  
<strong>時長</strong>：30-45 分鐘  
<strong>複雜度</strong>：⭐

#### 您將學到什麼
- 了解 Azure Developer CLI 基礎
- 在您的平台上安裝 AZD
- 您的第一次成功部署

#### 學習資源
- **🎯 從這開始**：[什麼是 Azure Developer CLI？](#what-is-azure-developer-cli)
- **📖 理論**：[AZD 基礎](docs/chapter-01-foundation/azd-basics.md) - 核心概念與術語
- **⚙️ 安裝**：[安裝及設定](docs/chapter-01-foundation/installation.md) - 依平台導覽
- **🛠️ 實作**：[您的第一個專案](docs/chapter-01-foundation/first-project.md) - 逐步教學
- **📋 速查表**：[指令速查表](resources/cheat-sheet.md)

#### 實際練習
```bash
# 快速安裝檢查
azd version

# 部署您的第一個應用程式
azd init --template todo-nodejs-mongo
azd up
```

**💡 章節成果**：成功使用 AZD 部署簡單的網頁應用程式至 Azure

**✅ 成功驗證：**
```bash
# 完成第一章後，您應該能夠：
azd version              # 顯示已安裝的版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署到 Azure
azd show                # 顯示執行中應用程式的網址
# 應用程式在瀏覽器中開啟並運作正常
azd down --force --purge  # 清除資源
```

**📊 預估時間：** 30-45 分鐘  
**📈 達成技能：** 可獨立部署基本應用程式
**📈 達成技能：** 可獨立部署基本應用程式

---

### 🤖 第 2 章：AI 優先開發（推薦 AI 開發者）
<strong>先決條件</strong>：完成第 1 章  
<strong>時長</strong>：1-2 小時  
<strong>複雜度</strong>：⭐⭐

#### 您將學到什麼
- Microsoft Foundry 與 AZD 的整合
- 部署 AI 驅動的應用程式
- 了解 AI 服務配置

#### 學習資源
- **🎯 從這開始**：[Microsoft Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI 代理**：[AI 代理指南](docs/chapter-02-ai-development/agents.md) - 使用 AZD 部署智能代理
- **📖 範例模式**：[AI 模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) - 部署並管理 AI 模型
- **🛠️ 工作坊**：[AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - 讓您的 AI 解決方案具備 AZD 就緒條件
- **🎥 互動學習**：[工作坊材料](workshop/README.md) - 使用 MkDocs 的瀏覽器式學習，搭配開發容器環境
- **📋 模板**：[Microsoft Foundry 模板](#工作坊資源)
- **📝 範例**：[AZD 部署範例](examples/README.md)

#### 實際練習
```bash
# 部署您的第一個 AI 應用程式
azd init --template azure-search-openai-demo
azd up

# 嘗試更多 AI 範本
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 章節成果**：部署及設定具備 RAG 功能的 AI 智能聊天應用程式

**✅ 成功驗證：**
```bash
# 在第2章之後，您應該能夠：
azd init --template azure-search-openai-demo
azd up
# 測試 AI 聊天介面
# 提出問題並獲得帶有來源的 AI 回答
# 驗證搜尋整合功能是否正常
azd monitor  # 檢查應用程式見解是否顯示遙測數據
azd down --force --purge
```

**📊 預估時間：** 1-2 小時  
**📈 達成技能：** 可部署並設定生產環境就緒的 AI 應用程式  
**💰 成本認知：** 了解每月約 80-150 美元的開發費用與 300-3500 美元的生產費用

#### 💰 AI 部署成本考量

**開發環境（預估每月 80-150 美元）：**
- Microsoft Foundry 模型（隨用隨付）：基於代幣使用量，每月約 0-50 美元
- AI 搜尋（基礎層）：75 美元/月
- 容器應用（依用量計費）：0-20 美元/月
- 儲存空間（標準）：1-5 美元/月

**生產環境（預估每月 300-3,500 美元以上）：**
- Microsoft Foundry 模型（PTU 以確保穩定效能）：每月超過 3,000 美元或大量使用下的隨用隨付
- AI 搜尋（標準層）：250 美元/月
- 容器應用（專用）：50-100 美元/月
- 應用程式洞察：5-50 美元/月
- 儲存空間（高級）：10-50 美元/月

**💡 成本優化建議：**
- 使用 <strong>免費層</strong> Microsoft Foundry 模型學習（Azure OpenAI 包含每月 50,000 代幣）
- 不在開發時執行 `azd down` 釋放資源
- 初期採用依用量計費，生產環境僅升級至 PTU
- 使用 `azd provision --preview` 預估部署成本
- 開啟自動擴縮：只為實際使用付費

**成本監控：**
```bash
# 檢查預估每月費用
azd provision --preview

# 在 Azure 入口網站監控實際費用
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第 3 章：設定與驗證
<strong>先決條件</strong>：完成第 1 章  
<strong>時長</strong>：45-60 分鐘  
<strong>複雜度</strong>：⭐⭐

#### 您將學到什麼
- 環境設定與管理
- 驗證與安全最佳實務
- 資源命名與組織

#### 學習資源
- **📖 設定**：[設定指南](docs/chapter-03-configuration/configuration.md) - 環境建置
- **🔐 安全**：[驗證模式與管理身份](docs/chapter-03-configuration/authsecurity.md) - 驗證模組
- **📝 範例**：[資料庫應用範例](examples/database-app/README.md) - AZD 資料庫範例

#### 實際練習
- 設定多環境（開發、測試、生產）
- 建立管理身份驗證
- 實作環境專屬設定

**💡 章節成果**：有效地管理多環境設定並妥善進行身份驗證與安全保護

---

### 🏗️ 第 4 章：基礎架構即程式碼與部署
<strong>先決條件</strong>：完成第 1-3 章  
<strong>時長</strong>：1-1.5 小時  
<strong>複雜度</strong>：⭐⭐⭐

#### 您將學到什麼
- 進階部署模式
- 使用 Bicep 進行基礎架構即程式碼
- 資源佈建策略

#### 學習資源
- **📖 部署**：[部署指南](docs/chapter-04-infrastructure/deployment-guide.md) - 完整工作流程
- **🏗️ 佈建**：[資源佈建](docs/chapter-04-infrastructure/provisioning.md) - Azure 資源管理
- **📝 範例**：[容器應用程式範例](../../examples/container-app) - 容器化部署

#### 實際練習
- 建立自訂 Bicep 模板
- 部署多服務應用程式
- 實作藍綠部署策略

**💡 章節成果**：使用自訂基礎架構模板部署複雜多服務應用程式

---


### 🎯 第五章：多代理人 AI 解決方案（進階）
<strong>先決條件</strong>：完成第一至第二章  
<strong>耗時</strong>：2-3 小時  
<strong>難度</strong>：⭐⭐⭐⭐

#### 你將學習到
- 多代理人架構模式
- 代理人編排與協調
- 生產就緒的 AI 部署

#### 學習資源
- **🤖 精選專案**：[零售多代理人解決方案](examples/retail-scenario.md) - 完整實作
- **🛠️ ARM 範本**：[ARM 範本套件](../../examples/retail-multiagent-arm-template) - 一鍵部署
- **📖 架構**：[多代理人協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) - 模式說明

#### 實務練習
```bash
# 部署完整的零售多代理解決方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索代理配置
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 本章成果**：部署並管理具生產就緒能力的多代理人 AI 解決方案，含客戶端與庫存代理人

---

### 🔍 第六章：部署前驗證與規劃
<strong>先決條件</strong>：完成第四章  
<strong>耗時</strong>：1 小時  
<strong>難度</strong>：⭐⭐

#### 你將學習到
- 容量規劃與資源驗證
- SKU 選擇策略
- 部署前檢查與自動化

#### 學習資源
- **📊 規劃**：[容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) - 資源驗證
- **💰 選擇**：[SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) - 成本效益選擇
- **✅ 驗證**：[部署前檢查](docs/chapter-06-pre-deployment/preflight-checks.md) - 自動化腳本

#### 實務練習
- 執行容量驗證腳本
- 優化 SKU 選擇以降低成本
- 實作自動化部署前檢查

**💡 本章成果**：部署前驗證並優化部署方案

---

### 🚨 第七章：疑難排解與除錯
<strong>先決條件</strong>：完成任一部署章節  
<strong>耗時</strong>：1-1.5 小時  
<strong>難度</strong>：⭐⭐

#### 你將學習到
- 系統性除錯方法
- 常見問題與解決方案
- AI 特定疑難排解

#### 學習資源
- **🔧 常見問題**：[常見問題](docs/chapter-07-troubleshooting/common-issues.md) - FAQ 與解決方法
- **🕵️ 除錯**：[除錯指南](docs/chapter-07-troubleshooting/debugging.md) - 步驟式策略
- **🤖 AI 問題**：[AI 特定疑難排解](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI 服務問題

#### 實務練習
- 診斷部署失敗問題
- 解決身份驗證問題
- 除錯 AI 服務連線

**💡 本章成果**：獨立診斷並解決常見部署問題

---

### 🏢 第八章：生產與企業模式
<strong>先決條件</strong>：完成第一至第四章  
<strong>耗時</strong>：2-3 小時  
<strong>難度</strong>：⭐⭐⭐⭐

#### 你將學習到
- 生產環境部署策略
- 企業安全模式
- 監控與成本優化

#### 學習資源
- **🏭 生產**：[生產 AI 最佳實踐](docs/chapter-08-production/production-ai-practices.md) - 企業模式說明
- **📝 範例**：[微服務範例](../../examples/microservices) - 複雜架構
- **📊 監控**：[應用程式洞察整合](docs/chapter-06-pre-deployment/application-insights.md) - 監控

#### 實務練習
- 實作企業安全模式
- 建立完整監控系統
- 以合適治理機制部署到生產環境

**💡 本章成果**：部署具備完整生產能力的企業級應用程式

---

## 🎓 工作坊概述：實作學習體驗

> **⚠️ 工作坊狀態：積極開發中**  
> 工作坊教材正在持續開發與修訂。核心模組已具功能，但部分進階章節尚未完成。我們正努力完善所有內容。[追蹤進度 →](workshop/README.md)

### 互動式工作坊教材
**完整實作學習，搭配瀏覽器操作工具與引導練習**

我們的工作坊教材提供結構化且互動式的學習體驗，與以上章節式課程互補。該工作坊適合自學或導師指導的課程使用。

#### 🛠️ 工作坊特色
- <strong>瀏覽器操作介面</strong>：完整 MkDocs 支援的工作坊，附搜尋、複製與主題功能
- **GitHub Codespaces 整合**：一鍵開發環境設定
- <strong>有結構的學習路徑</strong>：8 模組引導式練習（總計 3-4 小時）
- <strong>循序漸進方法</strong>：介紹 → 選擇 → 驗證 → 拆解 → 設定 → 客製 → 清除 → 總結
- **互動式 DevContainer 環境**：預先配置工具與相依套件

#### 📚 工作坊模組結構
工作坊依循 **8 模組循序漸進法**，帶你由探索到部署精通：

| 模組 | 主題 | 你將做什麼 | 時間 |
|--------|-------|----------------|----------|
| **0. 介紹** | 工作坊概述 | 理解學習目標、先決條件與結構 | 15 分鐘 |
| **1. 選擇** | 範本探索 | 探索 AZD 範本並選擇符合需求的 AI 範本 | 20 分鐘 |
| **2. 驗證** | 部署與驗證 | 使用 `azd up` 部署範本並驗證基礎架構運作 | 30 分鐘 |
| **3. 拆解** | 理解架構 | 利用 GitHub Copilot 探索範本架構、Bicep 檔案及程式組織 | 30 分鐘 |
| **4. 設定** | azure.yaml 深入解析 | 精通 `azure.yaml` 配置、生命週期掛勾及環境變數 | 30 分鐘 |
| **5. 客製** | 客製化你的方案 | 啟用 AI 搜尋、追蹤、評估並依場景調整 | 45 分鐘 |
| **6. 清除** | 清理資源 | 使用 `azd down --purge` 安全清理資源 | 15 分鐘 |
| **7. 總結** | 後續步驟 | 回顧成果、重點並持續學習 | 15 分鐘 |

**工作坊流程：**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 開始使用工作坊
```bash
# 選項一：GitHub Codespaces（推薦）
# 在程式庫中點擊「Code」→「在 main 上建立 codespace」

# 選項二：本地開發
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 請依照 workshop/README.md 中的設定說明執行
```

#### 🎯 工作坊學習成果
透過完成工作坊，學員將能：
- **部署生產 AI 應用**：使用 AZD 搭配 Microsoft Foundry 服務
- <strong>精通多代理人架構</strong>：實作協調 AI 代理解決方案
- <strong>實作安全最佳實踐</strong>：設定身份驗證與存取控制
- <strong>優化擴展能力</strong>：設計成本效益與高效能部署
- <strong>疑難排解部署問題</strong>：獨立解決常見問題

#### 📖 工作坊資源
- **🎥 互動式導覽**：[工作坊教材](workshop/README.md) - 瀏覽器操作學習環境
- **📋 模組指引**：
  - [0. 介紹](workshop/docs/instructions/0-Introduction.md) - 工作坊概述與目標
  - [1. 選擇](workshop/docs/instructions/1-Select-AI-Template.md) - 找尋並選擇 AI 範本
  - [2. 驗證](workshop/docs/instructions/2-Validate-AI-Template.md) - 部署並驗證範本
  - [3. 拆解](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - 探索範本架構
  - [4. 設定](workshop/docs/instructions/4-Configure-AI-Template.md) - 精通 azure.yaml
  - [5. 客製](workshop/docs/instructions/5-Customize-AI-Template.md) - 依場景調整
  - [6. 清除](workshop/docs/instructions/6-Teardown-Infrastructure.md) - 清理資源
  - [7. 總結](workshop/docs/instructions/7-Wrap-up.md) - 回顧與後續
- **🛠️ AI 工作坊實驗室**：[AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI 專注練習
- **💡 快速開始**：[工作坊設定指南](workshop/README.md#quick-start) - 環境配置

<strong>適合對象</strong>：企業訓練、大學課程、自學及開發者訓練營。

---

## 📖 深入探索：AZD 功能

除了基礎功能，AZD 提供強大生產部署特色：

- <strong>基於範本的部署</strong> - 使用預建模版支援常見應用模式
- <strong>基礎架構即程式碼</strong> - 利用 Bicep 或 Terraform 管理 Azure 資源  
- <strong>整合式工作流程</strong> - 無縫佈署及監控應用程式
- <strong>開發者友善</strong> - 優化開發者生產力與體驗

### **AZD + Microsoft Foundry：AI 部署的完美組合**

**為何使用 AZD 部署 AI 解決方案？** AZD 解決 AI 開發者面臨的主要挑戰：

- **AI 就緒範本** - 為 Microsoft Foundry 模型、Azure AI 服務及 ML 工作負載預配置範本
- **安全 AI 部署** - 內建 AI 服務、API 金鑰及模型端點安全模式  
- **生產 AI 模式** - 適用於可擴展且成本效益高的 AI 應用部署最佳實踐
- **端到端 AI 工作流程** - 從模型開發到生產部署並妥善監控
- <strong>成本優化</strong> - 智慧資源配置和 AI 工作負載調整策略
- **Microsoft Foundry 整合** - 與 Microsoft Foundry 模型目錄和端點無縫連接

---

## 🎯 範本與範例庫

### 精選：Microsoft Foundry 範本
**部署 AI 應用從這裡開始！**

> **注意：** 這些範本展示多種 AI 模式。有些是外部 Azure 範例庫，有些是本地實作。

| 範本 | 章節 | 難度 | 服務 | 類型 |
|----------|---------|------------|----------|------|
| [**開始使用 AI 聊天**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第二章 | ⭐⭐ | AzureOpenAI + Azure AI 模型推論 API + Azure AI 搜尋 + Azure Container Apps + 應用程式洞察 | 外部 |
| [**開始使用 AI 代理人**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第二章 | ⭐⭐ | Foundry 代理 + AzureOpenAI + Azure AI 搜尋 + Azure Container Apps + 應用程式洞察 | 外部 |
| [**Azure 搜尋 + OpenAI 示範**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第二章 | ⭐⭐ | AzureOpenAI + Azure AI 搜尋 + App Service + 儲存體 | 外部 |
| [**OpenAI 聊天應用快速開始**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第二章 | ⭐ | AzureOpenAI + Container Apps + 應用程式洞察 | 外部 |
| [**代理人 OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第五章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso 聊天 RAG**](https://github.com/Azure-Samples/contoso-chat) | 第八章 | ⭐⭐⭐⭐ | AzureOpenAI + AI 搜尋 + Cosmos DB + Container Apps | 外部 |
| [<strong>零售多代理人解決方案</strong>](examples/retail-scenario.md) | 第五章 | ⭐⭐⭐⭐ | AzureOpenAI + AI 搜尋 + 儲存體 + Container Apps + Cosmos DB | <strong>本地</strong> |

### 精選：完整學習場景
<strong>與學習章節對應的生產就緒應用範本</strong>

| 範本 | 學習章節 | 難度 | 主要學習點 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第二章 | ⭐ | 基本 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第二章 | ⭐⭐ | 以 Azure AI 搜尋實作 RAG |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第四章 | ⭐⭐ | 文件智能整合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第五章 | ⭐⭐⭐ | 代理人框架與函式調用 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第八章 | ⭐⭐⭐ | 企業 AI 編排 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第五章 | ⭐⭐⭐⭐ | 客戶與庫存代理人的多代理架構 |

### 依範例類型學習

> **📌 本地與外部範例說明：**  
> <strong>本地範例</strong>（此倉庫內）= 可立即使用  
> <strong>外部範例</strong>（Azure 範例）= 從連結倉庫克隆

#### 本地範例（即用型）
- [<strong>零售多代理人解決方案</strong>](examples/retail-scenario.md) - 完整生產就緒實作含 ARM 模板
  - 多代理架構（客戶端與庫存代理）
  - 全面監控與評估功能
  - 透過 ARM 模板一鍵部署

#### 本地範例 - 容器應用（第二至第五章）
**本倉庫中完整的容器部署範例：**

- [<strong>容器應用範例</strong>](examples/container-app/README.md) - 容器化部署完整指南
  - [簡易 Flask API](../../examples/container-app/simple-flask-api) - 基本帶 scaling-to-zero 的 REST API
  - [微服務架構](../../examples/container-app/microservices) - 生產就緒多服務部署
  - 快速入門、生產與進階部署範式
  - 監控、安全與成本優化指導

#### 外部範例 - 簡易應用程式 (第1-2章)
**克隆這些 Azure 範例庫以開始：**
- [簡易網頁應用 - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本部署範例
- [靜態網站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 靜態內容部署
- [容器應用 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署

#### 外部範例 - 資料庫整合 (第3-4章)  
- [資料庫應用 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 資料庫連接範式
- [函式 + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 無伺服器資料工作流

#### 外部範例 - 進階範式 (第4-8章)
- [Java 微服務](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服務架構
- [容器應用工作](https://github.com/Azure-Samples/container-apps-jobs) - 背景處理  
- [企業級 ML 管線](https://github.com/Azure-Samples/mlops-v2) - 生產就緒 ML 範式

### 外部範本集合
- [**官方 AZD 範本畫廊**](https://azure.github.io/awesome-azd/) - 精選官方與社群範本集合
- [**Azure Developer CLI 範本**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 範本文件
- [<strong>範例目錄</strong>](examples/README.md) - 本地學習範例與詳細說明

---

## 📚 學習資源與參考資料

### 快速參考
- [<strong>命令速查表</strong>](resources/cheat-sheet.md) - 依章節組織的 azd 常用命令
- [<strong>詞彙表</strong>](resources/glossary.md) - Azure 與 azd 術語  
- [<strong>常見問題</strong>](resources/faq.md) - 依學習章節整理的常見問題
- [<strong>學習指南</strong>](resources/study-guide.md) - 全面練習題目

### 實作工作坊
- [**AI 工作坊實驗室**](docs/chapter-02-ai-development/ai-workshop-lab.md) - 讓您的 AI 解決方案可由 AZD 部署（2-3 小時）
- [<strong>互動式工作坊</strong>](workshop/README.md) - 8 個模組的指導練習，搭配 MkDocs 與 GitHub Codespaces
  - 流程：介紹 → 選擇 → 驗證 → 拆解 → 配置 → 客製化 → 清理 → 總結

### 外部學習資源
- [Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 價格計算器](https://azure.microsoft.com/pricing/calculator/)
- [Azure 狀態](https://status.azure.com/)

### 編輯器的 AI 代理技能
- [**skills.sh 上的 Microsoft Azure 技能**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 個 Azure AI、Foundry、部署、診斷、成本優化等開放代理技能。可安裝於 GitHub Copilot、Cursor、Claude Code 或任何支援的代理：
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 快速故障排除指南

**初學者常見的問題及即時解決方案：**

<details>
<summary><strong>❌ "azd: 找不到指令"</strong></summary>

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
<summary><strong>❌ "找不到訂閱" 或 "未設定訂閱"</strong></summary>

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
<summary><strong>❌ "配額不足" 或 "配額超出"</strong></summary>

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
<summary><strong>❌ "azd up" 中途失敗</strong></summary>

```bash
# 選項 1：清理並重試
azd down --force --purge
azd up

# 選項 2：僅修正基礎設施
azd provision

# 選項 3：檢查詳細狀態
azd show

# 選項 4：在 Azure 監視器中檢查日誌
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "認證失敗" 或 "令牌過期"</strong></summary>

```bash
# 重新進行 AZD 的身份驗證
azd auth logout
azd auth login

# 可選：如果您正在執行 az 命令，也刷新 Azure CLI
az logout
az login

# 驗證身份驗證
az account show
```
</details>

<details>
<summary><strong>❌ "資源已存在" 或 命名衝突</strong></summary>

```bash
# AZD 會生成唯一名稱，但如果發生衝突：
azd down --force --purge

# 則使用新的環境重試
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 範本部署等待時間過長</strong></summary>

**正常等待時間：**
- 簡易網頁應用：5-10 分鐘
- 帶資料庫的應用：10-15 分鐘
- AI 應用：15-25 分鐘（OpenAI 配置較慢）

```bash
# 檢查進度
azd show

# 如果卡住超過30分鐘，請檢查 Azure 管理入口網站：
azd monitor --overview
# 尋找失敗的部署
```
</details>

<details>
<summary><strong>❌ "權限被拒" 或 "禁止操作"</strong></summary>

```bash
# 檢查您的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 您至少需要「參與者」角色
# 請您的 Azure 管理員授予：
# - 參與者（針對資源）
# - 使用者存取管理員（針對角色指派）
```
</details>

<details>
<summary><strong>❌ 找不到已部署應用程式 URL</strong></summary>

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

- **常見問題指南：** [詳細解決方案](docs/chapter-07-troubleshooting/common-issues.md)
- **AI 特定問題：** [AI 故障排除](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **除錯指南：** [循序除錯](docs/chapter-07-troubleshooting/debugging.md)
- **取得協助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 課程完成與認證

### 進度追蹤
追蹤您每個章節的學習進度：

- [ ] **第 1 章**: 基礎與快速入門 ✅
- [ ] **第 2 章**: AI 優先開發 ✅  
- [ ] **第 3 章**: 配置與認證 ✅
- [ ] **第 4 章**: 基礎架構即代碼與部署 ✅
- [ ] **第 5 章**: 多代理 AI 解決方案 ✅
- [ ] **第 6 章**: 預部署驗證與規劃 ✅
- [ ] **第 7 章**: 故障排除與除錯 ✅
- [ ] **第 8 章**: 生產與企業範式 ✅

### 學習驗證
完成每章後，透過以下方式驗證您的知識：
1. <strong>實作練習</strong>：完成該章的實務部署
2. <strong>知識檢核</strong>：檢視該章常見問答區
3. <strong>社群討論</strong>：於 Azure Discord 分享您的經驗
4. <strong>下一章</strong>：進入下一階段的學習

### 課程完成福利
完成所有章節後，您將獲得：
- <strong>生產經驗</strong>：實際部署 AI 應用至 Azure
- <strong>專業技能</strong>：企業級部署能力  
- <strong>社群認可</strong>：成為活躍的 Azure 開發者社群成員
- <strong>職涯提升</strong>：搶手的 AZD 與 AI 部署專長

---

## 🤝 社群與支援

### 獲取協助與支援
- <strong>技術問題</strong>： [回報錯誤和功能請求](https://github.com/microsoft/azd-for-beginners/issues)
- <strong>學習問題</strong>： [Microsoft Azure Discord 社群](https://discord.gg/microsoft-azure) 與 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 專屬協助**：加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- <strong>文件資源</strong>： [官方 Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord 的社群洞見

**#Azure 頻道最新調查結果：**
- **45%** 的開發者希望使用 AZD 進行 AI 工作負載
- <strong>主要挑戰</strong>：多服務部署、憑證管理、生產準備度  
- <strong>最受歡迎需求</strong>：AI 專用範本、故障排除指南、最佳實踐

**加入我們的社群以：**
- 分享您的 AZD + AI 經驗並獲得協助
- 率先取得新的 AI 範本預覽
- 貢獻 AI 部署的最佳實踐
- 影響未來的 AI + AZD 功能開發

### 課程貢獻指南
我們歡迎您的貢獻！請閱讀我們的 [貢獻指南](CONTRIBUTING.md) 來了解：
- <strong>內容改進</strong>：提升現有章節和範例
- <strong>新增範例</strong>：加入真實案例與範本  
- <strong>翻譯工作</strong>：協助維護多語言支援
- <strong>錯誤回報</strong>：提升準確度與清晰度
- <strong>社群規範</strong>：遵循我們的包容性社群指南

---

## 📄 課程資訊

### 授權
此專案以 MIT 授權條款授權 - 詳見 [LICENSE](../../LICENSE) 檔案。

### 相關 Microsoft 學習資源

我們團隊製作了其他完整學習課程：

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j 初學者](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js 初學者](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain 初學者](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / 邊緣 / MCP / 代理
[![AZD 初學者](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![邊緣 AI 初學者](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP 初學者](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI 代理初學者](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### 生成式 AI 系列
[![生成式 AI 初學者](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

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

<strong>初學者</strong>：從 [第 1 章：基礎與快速入門](#-chapter-1-foundation--quick-start) 開始  
**AI 開發者**：直接跳到 [第 2 章：AI 優先開發](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
<strong>經驗豐富的開發者</strong>：從 [第 3 章：設定與驗證](#️-chapter-3-configuration--authentication) 開始

<strong>下一步</strong>： [開始第 1 章 - AZD 基礎](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->