# AZD 初學者指南：有系統的學習旅程

![AZD-for-beginners](../../translated_images/zh-HK/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 自動翻譯（隨時更新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](./README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **想本地克隆？**
>
> 此儲存庫包含 50 多種語言翻譯，會顯著增加下載大小。若想不含翻譯克隆，請使用稀疏結帳：
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
> 這樣可以以更快速度下載，獲得完成課程所需的所有內容。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 今日 azd 新功能

> 📌 本課程基於 **`azd 1.27.1`**（2026 年 7 月）驗證。執行 `azd version` 檢查版本，執行 `azd upgrade` 獲取最新版本。

Azure 開發者 CLI 已超越傳統網頁應用程式及 API。今天，azd 是部署 <strong>任何</strong> Azure 應用程式的單一工具——包括 AI 驅動的應用和智能代理。

這對你意味著：

- **AI 代理現已成為首要 azd 工作負載。** 你可以使用熟悉的 `azd init` → `azd up` 工作流程初始化、部署和管理 AI 代理專案。
- **從 CLI 完整管理代理生命周期。** `azure.ai.agents` 擴充功能覆蓋整個流程—`azd ai agent init` 建立骨架，`azd ai agent invoke` 測試（帶反應時間輸出），`azd ai agent eval generate` 與 `azd ai agent optimize` 進行質量測量與提升，`azd ai agent delete` 清理。
- **更多 AI 建置模組。** 新的預覽擴充—`azure.ai.skills` 與 `azure.ai.connections`，讓你直接用 azd 管理可重用代理技能和 Foundry 連接。
- **Microsoft Foundry 整合** 將模型部署、代理主機及 AI 服務設定直接帶入 azd 範本生態系統。
- **日常操作更順暢。** 最新版本使 `azd init` 可重複執行（安全無副作用）、`azd auth login` 自動清理過期憑證，並新增友好的 `azd tool` 初次執行設定提示。
- **核心工作流程未變。** 無論部署待辦應用、微服務，或多代理 AI 解決方案，指令一致。

> **Aspire 用戶注意：** 微軟目前簡稱此產品為 **Aspire**（前稱 “.NET Aspire”）。azd 的 Aspire 支援未變，僅更名。

若你之前使用過 azd，AI 支援是自然延伸—非獨立工具或進階路線。若新手，將學習一套通用工作流程。

---

## 🚀 什麼是 Azure Developer CLI (azd)？

**Azure Developer CLI (azd)** 是易於使用的開發者命令列工具，可簡化應用程式部署到 Azure。無需手動建立並連接大量 Azure 資源，一行指令即可部署整個應用程式。

### `azd up` 的魔法

```bash
# 呢個單一命令做晒所有嘢：
# ✅ 建立所有 Azure 資源
# ✅ 配置網絡同安全
# ✅ 編譯你嘅應用程式代碼
# ✅ 部署到 Azure
# ✅ 提供一個可用嘅網址
azd up
```

**就是這樣！** 無需點擊 Azure 入口網站，無需學習複雜的 ARM 範本，無需手動設定——只需將運行中的應用程式部署到 Azure。

---

## ❓ Azure Developer CLI 與 Azure CLI 的差異？

這是初學者最常問的問題。簡單說明如下：

| 功能 | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| <strong>用途</strong> | 管理個別 Azure 資源 | 部署完整應用程式 |
| <strong>思維模式</strong> | 基礎設施為主 | 應用程式為主 |
| <strong>範例</strong> | `az webapp create --name myapp...` | `azd up` |
| <strong>學習曲線</strong> | 需了解 Azure 服務 | 只需了解你的應用程式 |
| <strong>適合對象</strong> | DevOps、基礎設施工程師 | 開發人員、原型設計師 |

### 簡單比喻

- **Azure CLI** 就像你擁有建房所有工具——錘子、鋸子、釘子。你能建任何東西，但必須懂建造。
- **Azure Developer CLI** 就像你聘請了承包商——你描述需求，他們負責施工。

### 何時用哪個？

| 情境 | 使用此指令 |
|----------|----------|
| 「我想快速部署網頁應用」 | `azd up` |
| 「我只想建立儲存帳戶」 | `az storage account create` |
| 「我正在建構完整 AI 應用」 | `azd init --template azure-search-openai-demo` |
| 「我想偵錯特定 Azure 資源」 | `az resource show` |
| 「我想幾分鐘內部署生產環境」 | `azd up --environment production` |

### 它們可協同工作！

AZD 底層使用 Azure CLI，你可以同時使用兩者：
```bash
# 使用 AZD 部署你的應用程式
azd up

# 然後使用 Azure CLI 微調特定資源
az webapp config set --name myapp --always-on true
```

---

## 🌟 在 Awesome AZD 找範本

不用從零開始！**Awesome AZD** 是社群收集的即部署範本：

| 資源 | 說明 |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | 瀏覽逾 200 個範本，一鍵部署 |
| 🔗 [<strong>提交範本</strong>](https://github.com/Azure/awesome-azd/issues) | 貢獻你的範本給社群 |
| 🔗 [**GitHub 儲存庫**](https://github.com/Azure/awesome-azd) | 點讚並探索原始碼 |

### Awesome AZD 熱門 AI 範本

```bash
# 結合 Microsoft Foundry 模型與 AI 搜尋的 RAG 聊天
azd init --template azure-search-openai-demo

# 快速 AI 聊天應用程式
azd init --template openai-chat-app-quickstart

# 具備 Foundry 代理的 AI 代理
azd init --template get-started-with-ai-agents
```

---

## 🎯 3 步驟快速入門

開始前，確保你的機器準備好部署想用的範本：

**Windows：**
```powershell
.\validate-setup.ps1
```

**macOS / Linux：**
```bash
bash ./validate-setup.sh
```

若有任何必需檢查未通過，請先修正，再繼續快速入門。

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

### 步驟 2：AZD 驗證身份

```bash
# 如果你打算在本課程中直接使用 Azure CLI 命令，則可選
az login

# AZD 工作流程所必需
azd auth login
```

若不確定需要哪種身份驗證，請參考 [安裝與設定](docs/chapter-01-foundation/installation.md#authentication-setup) 完整流程。

### 步驟 3：部署你的第一個應用

```bash
# 從範本初始化
azd init --template todo-nodejs-mongo

# 部署到 Azure（建立所有！）
azd up
```

**🎉 就是這樣！** 你的應用現在已在 Azure 上運行。

### 清理（別忘了！）

```bash
# 完成實驗後移除所有資源
azd down --force --purge
```

---

## 📚 如何使用本課程

本課程設計為 <strong>逐步學習</strong>—從舒適區開始，逐步深化：

| 你的經驗 | 從這裡開始 |
|-----------------|------------|
| **Azure 新手** | [章節 1：基礎](#-chapter-1-foundation--quick-start) |
| **懂 Azure，AZD 新手** | [章節 1：基礎](#-chapter-1-foundation--quick-start) |
| **想部署 AI 應用** | [章節 2：AI 優先開發](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| <strong>想動手實做</strong> | [🎓 互動工作坊](workshop/README.md) - 3-4 小時引導實驗 |
| <strong>需要生產模式</strong> | [章節 8：生產及企業模式](#-chapter-8-production--enterprise-patterns) |

### 快速設置

1. **Fork 此儲存庫**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. <strong>克隆它</strong>: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. <strong>尋求協助</strong>: [Azure Discord 社群](https://discord.com/invite/ByRwuEEgH4)

> **想本地克隆？**

> 此儲存庫包含 50 多種語言翻譯，會顯著增加下載大小。若想不含翻譯克隆，請使用稀疏結帳：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 這樣可以以更快速度下載，獲得完成課程所需的所有內容。


## 課程概覽

透過有系統的章節漸進掌握 Azure Developer CLI (azd)。**特別關注 Microsoft Foundry 整合下的 AI 應用部署。**


### 為何這課程對現代開發者至關重要

根據 Microsoft Foundry Discord 社群的見解，**45% 的開發者想使用 AZD 來處理 AI 工作負載**，但遇到以下挑戰：
- 複雜的多服務 AI 架構
- 生產環境 AI 部署最佳實踐  
- Azure AI 服務整合與設定
- AI 工作負載成本優化
- AI 特定部署問題排錯

### 學習目標

完成這門結構化課程後，您將能：
- **掌握 AZD 基礎**：核心概念、安裝與設定
- **部署 AI 應用程式**：結合 Microsoft Foundry 服務使用 AZD
- <strong>實作基礎架構即程式碼</strong>：使用 Bicep 模板管理 Azure 資源
- <strong>部署排錯</strong>：解決常見問題並除錯
- <strong>生產最佳化</strong>：安全性、擴展、監控與成本管理
- <strong>構建多代理解決方案</strong>：部署複雜 AI 架構

## 開始前準備：帳號、存取權及假設

在開始第一章之前，請確保您已經具備以下條件。後續指引中的安裝步驟假設這些基礎條件已經完成。

- **Azure 訂閱**：您可以使用工作或個人帳號的現有訂閱，或建立 [免費試用](https://aka.ms/azurefreetrial) 開始。
- **建立 Azure 資源的權限**：大多數練習需於目標訂閱或資源群組擁有至少<strong>參與者</strong>權限。有些章節亦假設您能建立資源群組、管理身分及 RBAC 分配。
- [**GitHub 帳號**](https://github.com)：方便 fork 儲存庫、追蹤變更，以及使用 GitHub Codespaces 進行工作坊。
- <strong>模板執行環境需求</strong>：某些模板需本機工具如 Node.js、Python、Java 或 Docker。請先執行設定驗證器，及早發現缺少工具。
- <strong>基礎終端機操作熟悉度</strong>：不必是專家，但應該能執行 `git clone`、`azd auth login` 與 `azd up` 等指令。

> **使用企業訂閱？**
> 若您的 Azure 環境由管理員控管，請事先確認您能在擬使用的訂閱或資源群組部署資源。若無，請在開始前申請沙箱訂閱或參與者權限。

> **剛使用 Azure？**
> 建議以個人 Azure 試用或隨用隨付訂閱開始 (https://aka.ms/azurefreetrial)，完整練習流程無需等待租戶層級核准。

## 🗺️ 課程地圖：快速依章節導航

各章節均有專屬 README，包含學習目標、快速入門與練習：

| 章節 | 主題 | 課程 | 時長 | 複雜度 |
|---------|-------|---------|----------|------------|
| **[第 1 章：基礎](docs/chapter-01-foundation/README.md)** | 入門 | [AZD 基礎](docs/chapter-01-foundation/azd-basics.md) &#124; [安裝](docs/chapter-01-foundation/installation.md) &#124; [第一個專案](docs/chapter-01-foundation/first-project.md) | 30-45 分鐘 | ⭐ |
| **[第 2 章：AI 開發](docs/chapter-02-ai-development/README.md)** | AI 優先應用 | [Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI 代理](docs/chapter-02-ai-development/agents.md) &#124; [模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [工作坊](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 小時 | ⭐⭐ |
| **[第 3 章：設定](docs/chapter-03-configuration/README.md)** | 身分驗證與安全 | [設定](docs/chapter-03-configuration/configuration.md) &#124; [身分驗證與安全](docs/chapter-03-configuration/authsecurity.md) | 45-60 分鐘 | ⭐⭐ |
| **[第 4 章：基礎架構](docs/chapter-04-infrastructure/README.md)** | IaC 與部署 | [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [資源佈建](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 小時 | ⭐⭐⭐ |
| **[第 5 章：多代理](docs/chapter-05-multi-agent/README.md)** | AI 代理解決方案 | [零售情境](examples/retail-scenario.md) &#124; [協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 小時 | ⭐⭐⭐⭐ |
| **[第 6 章：部署前](docs/chapter-06-pre-deployment/README.md)** | 規劃與驗證 | [預檢查](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [應用洞察](docs/chapter-06-pre-deployment/application-insights.md) | 1 小時 | ⭐⭐ |
| **[第 7 章：故障排除](docs/chapter-07-troubleshooting/README.md)** | 除錯與修復 | [常見問題](docs/chapter-07-troubleshooting/common-issues.md) &#124; [除錯](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI 問題排除](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 小時 | ⭐⭐ |
| **[第 8 章：生產環境](docs/chapter-08-production/README.md)** | 企業模式 | [生產最佳實踐](docs/chapter-08-production/production-ai-practices.md) | 2-3 小時 | ⭐⭐⭐⭐ |
| **[🎓 工作坊](workshop/README.md)** | 實作實驗室 | [介紹](workshop/docs/instructions/0-Introduction.md) &#124; [範本選擇](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [範本驗證](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [範本拆解](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [設定範本](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [自訂範本](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [拆除架構](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [總結](workshop/docs/instructions/7-Wrap-up.md) | 3-4 小時 | ⭐⭐ |

**總課程時長：** 約 10-14 小時 | **技能進展：** 初學者 → 生產就緒

---

## 📚 學習章節

<em>根據經驗與目標選擇適合您的學習路徑</em>

### 🚀 第 1 章：基礎與快速入門
<strong>前置條件</strong>：Azure 訂閱，基礎指令列知識  
<strong>時長</strong>：30-45 分鐘  
<strong>難度</strong>：⭐

#### 您將學到
- 了解 Azure Developer CLI 基本概念
- 在您的平台安裝 AZD
- 您的首次成功部署

#### 學習資源
- **🎯 從這裡開始**：[什麼是 Azure Developer CLI？](#what-is-azure-developer-cli)
- **📖 理論**：[AZD 基礎](docs/chapter-01-foundation/azd-basics.md) - 核心概念與術語
- **⚙️ 設定**：[安裝與設定](docs/chapter-01-foundation/installation.md) - 平台專用指南
- **🛠️ 實作**：[您的第一個專案](docs/chapter-01-foundation/first-project.md) - 一步步教學
- **📋 快速參考**：[指令速查表](resources/cheat-sheet.md)

#### 實作練習
```bash
# 快速安裝檢查
azd version

# 部署你的第一個應用程式
azd init --template todo-nodejs-mongo
azd up
```

**💡 章節成果**：使用 AZD 成功部署一個簡單網頁應用程式至 Azure

**✅ 成功驗證：**
```bash
# 完成第一章後，您應該能夠：
azd version              # 顯示已安裝版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署到 Azure
azd show                # 顯示正在運行的應用程式 URL
# 應用程式在瀏覽器中開啟並運作
azd down --force --purge  # 清理資源
```

**📊 時間投入：** 30-45 分鐘  
**📈 完成後技能：** 可獨立部署基礎應用程式
**📈 完成後技能：** 可獨立部署基礎應用程式

---

### 🤖 第 2 章：AI 優先開發（建議 AI 開發者）
<strong>前置條件</strong>：完成第 1 章  
<strong>時長</strong>：1-2 小時  
<strong>難度</strong>：⭐⭐

#### 您將學到
- Microsoft Foundry 與 AZD 的整合
- 部署 AI 驅動應用程式
- 了解 AI 服務設定

#### 學習資源
- **🎯 從這裡開始**：[Microsoft Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI 代理**：[AI 代理指南](docs/chapter-02-ai-development/agents.md) - 使用 AZD 部署智能代理
- **📖 模式**：[AI 模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) - 部署與管理 AI 模型
- **🛠️ 工作坊**：[AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - 讓您的 AI 解決方案 AZD 就緒
- **🎥 互動指南**：[工作坊材料](workshop/README.md) - 瀏覽器式學習搭配 MkDocs * DevContainer 環境
- **📋 範本**：[Microsoft Foundry 範本](#工作坊資源)
- **📝 範例**：[AZD 部署範例](examples/README.md)

#### 實作練習
```bash
# 部署你的第一個 AI 應用程式
azd init --template azure-search-openai-demo
azd up

# 嘗試更多 AI 範本
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 章節成果**：部署並設定具備 RAG 功能的 AI 對話應用程式

**✅ 成功驗證：**
```bash
# 完成第二章後，你應該能夠：
azd init --template azure-search-openai-demo
azd up
# 測試 AI 聊天介面
# 提問並獲得帶有來源的 AI 支援回應
# 驗證搜索整合是否運作正常
azd monitor  # 檢查 Application Insights 是否顯示遙測資料
azd down --force --purge
```

**📊 時間投入：** 1-2 小時  
**📈 完成後技能：** 可部署並設定生產就緒的 AI 應用程式  
**💰 成本意識：** 理解開發成本約 $80-150/月，生產成本約 $300-3500/月

#### 💰 AI 部署成本考量

**開發環境（預估 $80-150/月）：**
- Microsoft Foundry 模型（隨用隨付）：$0-50/月（依代幣使用量計算）
- AI 搜尋（基本階層）：$75/月
- 容器應用程式（消耗模式）：$0-20/月
- 儲存體（標準級）：$1-5/月

**生產環境（預估 $300-3,500+/月）：**
- Microsoft Foundry 模型（PTU 保持穩定效能）：$3,000+/月 或 大量使用隨用隨付
- AI 搜尋（標準階層）：$250/月
- 容器應用程式（專屬資源）：$50-100/月
- 應用洞察：$5-50/月
- 儲存體（高級）：$10-50/月

**💡 成本優化建議：**
- 對學習使用 <strong>免費等級</strong> Microsoft Foundry 模型（含 Azure OpenAI 50,000 代幣/月）
- 非活躍開發時執行 `azd down` 釋放資源
- 初期採用消耗付費模式，正式生產才切換至 PTU
- 部署前使用 `azd provision --preview` 預估成本
- 啟用自動擴展：僅為實際使用付費

**成本監控：**
```bash
# 檢查預計每月成本
azd provision --preview

# 在 Azure 入口網站監察實際成本
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第 3 章：設定與身份驗證
<strong>前置條件</strong>：完成第 1 章  
<strong>時長</strong>：45-60 分鐘  
<strong>難度</strong>：⭐⭐

#### 您將學到
- 環境配置與管理
- 身份驗證與安全最佳實踐
- 資源命名與組織

#### 學習資源
- **📖 設定**：[設定指南](docs/chapter-03-configuration/configuration.md) - 環境設置
- **🔐 安全**：[身份驗證模式與管理身分](docs/chapter-03-configuration/authsecurity.md) - 身份驗證模式
- **📝 範例**：[資料庫應用程式範例](examples/database-app/README.md) - AZD 資料庫範例

#### 實作練習
- 配置多個環境（開發、預備、生產）
- 建立管理身份驗證
- 實作環境特定設定

**💡 章節成果**：以正確身份驗證與安全措施管理多個環境

---

### 🏗️ 第 4 章：基礎架構即程式碼與部署
<strong>前置條件</strong>：完成第 1 至 3 章  
<strong>時長</strong>：1-1.5 小時  
<strong>難度</strong>：⭐⭐⭐

#### 您將學到
- 進階部署模式
- 使用 Bicep 實作基礎架構即程式碼
- 資源佈建策略

#### 學習資源
- **📖 部署**：[部署指南](docs/chapter-04-infrastructure/deployment-guide.md) - 完整工作流程
- **🏗️ 佈建**：[資源佈建](docs/chapter-04-infrastructure/provisioning.md) - Azure 資源管理
- **📝 範例**：[容器應用程式範例](../../examples/container-app) - 容器化部署

#### 實作練習
- 建立自訂 Bicep 範本
- 部署多服務應用程式
- 實作藍綠部署策略

**💡 章節成果**：使用自訂基礎架構範本部署複雜的多服務應用程式

---


### 🎯 第五章：多代理人工智能解決方案（進階）
<strong>先修條件</strong>：完成第一至二章  
<strong>時長</strong>：2-3 小時  
<strong>複雜度</strong>：⭐⭐⭐⭐

#### 你將學習到
- 多代理架構模式
- 代理協調與編排
- 可量產的 AI 部署

#### 學習資源
- **🤖 精選專案**: [零售多代理解決方案](examples/retail-scenario.md) - 完整實作
- **🛠️ ARM 範本**: [ARM 範本套件](../../examples/retail-multiagent-arm-template) - 一鍵部署
- **📖 架構**: [多代理協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) - 模式介紹

#### 實作練習
```bash
# 部署完整的零售多代理解決方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索代理配置
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 章節成果**：部署並管理具有客戶及庫存代理的生產級多代理 AI 解決方案

---

### 🔍 第六章：部署前驗證與規劃
<strong>先修條件</strong>：完成第四章  
<strong>時長</strong>：1 小時  
<strong>複雜度</strong>：⭐⭐

#### 你將學習到
- 容量規劃與資源驗證
- SKU 選擇策略
- 部署前檢查與自動化

#### 學習資源
- **📊 規劃**: [容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) - 資源驗證
- **💰 選擇**: [SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) - 成本效益選擇
- **✅ 驗證**: [部署前檢查](docs/chapter-06-pre-deployment/preflight-checks.md) - 自動腳本

#### 實作練習
- 執行容量驗證腳本
- 優化 SKU 選擇以降低成本
- 實作自動部署前檢查

**💡 章節成果**：在執行前驗證並優化部署方案

---

### 🚨 第七章：故障排除與除錯
<strong>先修條件</strong>：完成任一部署章節  
<strong>時長</strong>：1-1.5 小時  
<strong>複雜度</strong>：⭐⭐

#### 你將學習到
- 系統化的除錯方法
- 常見問題與解決方案
- AI 專屬故障排除

#### 學習資源
- **🔧 常見問題**: [常見問題](docs/chapter-07-troubleshooting/common-issues.md) - 常見問答與解決方案
- **🕵️ 除錯**: [除錯指南](docs/chapter-07-troubleshooting/debugging.md) - 詳細策略步驟
- **🤖 AI 問題**: [AI 專屬故障排除](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI 服務問題

#### 實作練習
- 診斷部署失敗
- 解決認證問題
- 除錯 AI 服務連接問題

**💡 章節成果**：能獨立診斷並解決常見部署問題

---

### 🏢 第八章：生產及企業模式
<strong>先修條件</strong>：完成第一至四章  
<strong>時長</strong>：2-3 小時  
<strong>複雜度</strong>：⭐⭐⭐⭐

#### 你將學習到
- 生產部署策略
- 企業安全模式
- 監控與成本優化

#### 學習資源
- **🏭 生產**: [生產 AI 最佳實踐](docs/chapter-08-production/production-ai-practices.md) - 企業模式
- **📝 範例**: [微服務範例](../../examples/microservices) - 複雜架構
- **📊 監控**: [Application Insights 整合](docs/chapter-06-pre-deployment/application-insights.md) - 監控介紹

#### 實作練習
- 實作企業安全模式
- 設置全方位監控
- 以適當治理部署到生產環境

**💡 章節成果**：部署具備完整生產能力的企業級應用

---

## 🎓 工作坊概覽：實作學習體驗

> **⚠️ 工作坊狀態：積極開發中**  
> 工作坊教材正在構建與優化中。核心模組已可使用，但部分進階內容尚未完成。我們正積極努力完成所有內容。[追蹤進度 →](workshop/README.md)

### 互動式工作坊教材
**完整的實作體驗，提供瀏覽器工具與引導式練習**

我們的工作坊教材提供有結構的互動學習體驗，補充上述章節課程。工作坊適合自學以及導師指導的教學。

#### 🛠️ 工作坊特色
- <strong>瀏覽器介面</strong>：完整 MkDocs 驅動的工作坊，包括搜尋、複製與主題功能
- **GitHub Codespaces 整合**：一鍵開發環境設定
- <strong>結構化學習路徑</strong>：8 個模組引導練習（共約 3-4 小時）
- <strong>漸進式方法論</strong>：介紹 → 選擇 → 驗證 → 拆解 → 配置 → 自訂 → 清理 → 結業
- **互動式 DevContainer 環境**：預配置工具與依賴

#### 📚 工作坊模組結構
工作坊採用 **8 模組漸進方法論**，帶領你從探索到部署專精：

| 模組 | 主題 | 你將操作 | 時長 |
|--------|-------|----------------|----------|
| **0. 介紹** | 工作坊概覽 | 理解學習目標、先修條件與結構 | 15 分鐘 |
| **1. 選擇** | 範本探索 | 探索 AZD 範本並選擇適合的 AI 範本 | 20 分鐘 |
| **2. 驗證** | 部署與驗證 | 使用 `azd up` 部署，驗證基礎架構運作 | 30 分鐘 |
| **3. 拆解** | 了解結構 | 使用 GitHub Copilot 探索範本架構、Bicep 檔案與程式碼組織 | 30 分鐘 |
| **4. 配置** | 深入 azure.yaml | 精通 `azure.yaml` 設定、生命週期勾子與環境變數 | 30 分鐘 |
| **5. 自訂** | 個人化設定 | 啟用 AI 搜尋、追蹤、評估，並依場景自訂 | 45 分鐘 |
| **6. 清理** | 資源移除 | 安全地使用 `azd down --purge` 清理資源 | 15 分鐘 |
| **7. 結業** | 下一步 | 回顧成果、主要概念，展望後續學習 | 15 分鐘 |

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
完成工作坊後，參與者將能夠：
- **部署生產級 AI 應用**：使用 AZD 與 Microsoft Foundry 服務
- <strong>掌握多代理架構</strong>：實作協調的 AI 代理解決方案
- <strong>實作安全最佳實踐</strong>：設定認證與存取控制
- <strong>優化擴充性</strong>：設計成本效益與高效能部署
- <strong>故障排除部署問題</strong>：獨立排解常見問題

#### 📖 工作坊資源
- **🎥 互動指南**： [工作坊教材](workshop/README.md) - 瀏覽器學習環境
- **📋 模組指引**：
  - [0. 介紹](workshop/docs/instructions/0-Introduction.md) - 工作坊介紹與目標
  - [1. 選擇](workshop/docs/instructions/1-Select-AI-Template.md) - 尋找與選擇 AI 範本
  - [2. 驗證](workshop/docs/instructions/2-Validate-AI-Template.md) - 部署並驗證範本
  - [3. 拆解](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - 探索範本架構
  - [4. 配置](workshop/docs/instructions/4-Configure-AI-Template.md) - 精通 azure.yaml
  - [5. 自訂](workshop/docs/instructions/5-Customize-AI-Template.md) - 依場景客製化
  - [6. 清理](workshop/docs/instructions/6-Teardown-Infrastructure.md) - 清理資源
  - [7. 結業](workshop/docs/instructions/7-Wrap-up.md) - 回顧與後續步驟
- **🛠️ AI 工作坊實驗室**: [AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI 專注練習
- **💡 快速開始**: [工作坊設定指南](workshop/README.md#quick-start) - 環境配置

<strong>適合對象</strong>：企業培訓、大學課程、自主學習與開發者密集班。

---

## 📖 深入解析：AZD 功能

除了基礎功能，AZD 還提供強大的生產級部署特性：

- <strong>範本化部署</strong> - 使用預建範本實作常見應用模式
- <strong>基礎架構即程式碼</strong> - 使用 Bicep 或 Terraform 管理 Azure 資源  
- <strong>整合化工作流程</strong> - 無縫完成佈建、部署與監控
- <strong>開發者友善</strong> - 最佳化開發者生產力與體驗

### **AZD + Microsoft Foundry：AI 部署的完美組合**

**為何選擇 AZD 部署 AI？** AZD 解決了 AI 開發者的主要挑戰：

- **AI 準備範本** - 預配置 Microsoft Foundry 模型、Azure AI 服務及機器學習工作負載範本
- **安全 AI 部署** - 內建 AI 服務、API 金鑰與模型端點安全模式  
- **生產級 AI 模式** - 可擴展且具成本效益的 AI 應用最佳實踐
- **端對端 AI 工作流程** - 從模型開發到生產部署並搭配完善監控
- <strong>成本優化</strong> - 智慧資源分配與彈性擴展策略
- **Microsoft Foundry 整合** - 無縫連接 Microsoft Foundry 模型目錄與端點

---

## 🎯 範本與範例庫

### 精選：Microsoft Foundry 範本
**如果你要部署 AI 應用，請從這裡開始！**

> <strong>注意：</strong>這些範本示範不同 AI 模式。有些是外部 Azure 範例，有些是本地實作。

| 範本 | 章節 | 複雜度 | 服務 | 類型 |
|----------|---------|------------|----------|------|
| [**開始使用 AI 聊天**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第 2 章 | ⭐⭐ | AzureOpenAI + Azure AI 模型推論 API + Azure AI 搜尋 + Azure Container Apps + Application Insights | 外部 |
| [**開始使用 AI 代理**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第 2 章 | ⭐⭐ | Foundry 代理 + AzureOpenAI + Azure AI 搜尋 + Azure Container Apps + Application Insights| 外部 |
| [**Azure Search + OpenAI 展示**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第 2 章 | ⭐⭐ | AzureOpenAI + Azure AI 搜尋 + App Service + 儲存 | 外部 |
| [**OpenAI 聊天應用快速開始**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第 2 章 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**代理 OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第 5 章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 第 8 章 | ⭐⭐⭐⭐ | AzureOpenAI + AI 搜尋 + Cosmos DB + Container Apps | 外部 |
| [<strong>零售多代理解決方案</strong>](examples/retail-scenario.md) | 第 5 章 | ⭐⭐⭐⭐ | AzureOpenAI + AI 搜尋 + 儲存 + Container Apps + Cosmos DB | <strong>本地</strong> |

### 精選：完整學習場景
<strong>映射至學習章節的生產級應用範本</strong>

| 範本 | 學習章節 | 複雜度 | 主要學習內容 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第 2 章 | ⭐ | 基本 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第 2 章 | ⭐⭐ | 使用 Azure AI Search 的 RAG 實作 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第 4 章 | ⭐⭐ | 文件智能整合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第 5 章 | ⭐⭐⭐ | 代理框架與函式呼叫 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第 8 章 | ⭐⭐⭐ | 企業 AI 編排 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第 5 章 | ⭐⭐⭐⭐ | 客戶及庫存代理的多代理架構 |

### 按範例類型學習

> **📌 本地與外部範例說明：**  
> <strong>本地範例</strong> (本儲存庫內) = 立即可用  
> <strong>外部範例</strong> (Azure 範例) = 從連結的儲存庫克隆

#### 本地範例（準備好使用）
- [<strong>零售多代理解決方案</strong>](examples/retail-scenario.md) - 完整的生產級實作附 ARM 範本
  - 多代理架構（客戶 + 庫存代理）
  - 全面監控與評估
  - 透過 ARM 範本一鍵部署

#### 本地範例 - 容器應用（第 2 至 5 章）
**本儲存庫中完整的容器部署範例：**

- [<strong>容器應用範例</strong>](examples/container-app/README.md) - 容器化部署完整指南
  - [簡單 Flask API](../../examples/container-app/simple-flask-api) - 基本 REST API 以及縮放到零
  - [微服務架構](../../examples/container-app/microservices) - 生產就緒的多服務部署
  - 快速入門、生產及進階部署模式
  - 監控、安全及成本優化指引

#### 外部範例 - 簡單應用（第1-2章）
**克隆這些 Azure 範例倉庫開始：**
- [簡單網頁應用 - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本部署模式
- [靜態網站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 靜態內容部署
- [容器應用 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署

#### 外部範例 - 資料庫整合（第3-4章）  
- [資料庫應用 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 資料庫連接模式
- [函數 + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 無伺服器資料工作流程

#### 外部範例 - 進階模式（第4-8章）
- [Java 微服務](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服務架構
- [容器應用排程工作](https://github.com/Azure-Samples/container-apps-jobs) - 背景處理  
- [企業機器學習流程](https://github.com/Azure-Samples/mlops-v2) - 生產就緒的 ML 模式

### 外部模板集合
- [**官方 AZD 模板集錦**](https://azure.github.io/awesome-azd/) - 精選官方及社群模板集合
- [**Azure 開發者 CLI 模板**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 模板文件
- [<strong>範例目錄</strong>](examples/README.md) - 具有詳細解說的本地學習範例

---

## 📚 學習資源與參考

### 快速參考
- [<strong>指令備忘單</strong>](resources/cheat-sheet.md) - 根據章節整理的基本 azd 指令
- [<strong>詞彙表</strong>](resources/glossary.md) - Azure 與 azd 專有名詞
- [<strong>常見問題</strong>](resources/faq.md) - 按學習章節整理的常見問題
- [<strong>學習指南</strong>](resources/study-guide.md) - 全面練習題

### 實作工作坊
- [**AI 工作坊實驗室**](docs/chapter-02-ai-development/ai-workshop-lab.md) - 讓你的 AI 解決方案可用 AZD 部署（2-3 小時）
- [<strong>互動式工作坊</strong>](workshop/README.md) - 使用 MkDocs 和 GitHub Codespaces 的 8 模組導引練習
  - 依序：介紹 → 選擇 → 驗證 → 拆解 → 設定 → 自訂 → 拆除 → 總結

### 外部學習資源
- [Azure 開發者 CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 價格計算器](https://azure.microsoft.com/pricing/calculator/)
- [Azure 狀態](https://status.azure.com/)

### 編輯器 AI 智能助理技能
- [**skills.sh 上的 Microsoft Azure 技能**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 項 Azure AI、Foundry、部署、診斷、成本優化等開放代理技能。安裝於 GitHub Copilot、Cursor、Claude Code 等支援的智能代理：
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 快速故障排除指南

**新手常見問題與即時解決方案：**

<details>
<summary><strong>❌ "找不到 azd 指令"</strong></summary>

```bash
# 先安裝 AZD
# Windows (PowerShell)：
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
<summary><strong>❌ "配額不足" 或 "配額超過"</strong></summary>

```bash
# 嘗試不同的 Azure 區域
azd env set AZURE_LOCATION "westus2"
azd up

# 或在開發時使用較小的 SKU
# 編輯 infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" 指令中途失敗</strong></summary>

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
<summary><strong>❌ "驗證失敗" 或 "令牌過期"</strong></summary>

```bash
# 重新驗證以取得 AZD
azd auth logout
azd auth login

# 選擇性：如果你正在執行 az 命令，也可刷新 Azure CLI
az logout
az login

# 驗證身份驗證
az account show
```
</details>

<details>
<summary><strong>❌ "資源已存在" 或命名衝突</strong></summary>

```bash
# AZD 會生成獨特名稱，但如果發生衝突：
azd down --force --purge

# 然後使用全新環境重試
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 模板部署耗時過久</strong></summary>

**正常等待時間：**
- 簡單網頁應用：5-10 分鐘
- 帶資料庫的應用：10-15 分鐘
- AI 應用：15-25 分鐘（OpenAI配置較慢）

```bash
# 檢查進度
azd show

# 如果停滯超過30分鐘，檢查 Azure 入口網站：
azd monitor --overview
# 尋找失敗的部署
```
</details>

<details>
<summary><strong>❌ "權限拒絕" 或 "禁止訪問"</strong></summary>

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
<summary><strong>❌ 找不到已部署應用程式的 URL</strong></summary>

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
- **除錯指南：** [逐步除錯](docs/chapter-07-troubleshooting/debugging.md)
- **求助管道：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 課程完成與認證

### 進度追蹤
追蹤每章節學習進度：

- [ ] **第 1 章**：基礎與快速入門 ✅
- [ ] **第 2 章**：以 AI 為先的開發 ✅  
- [ ] **第 3 章**：設定與驗證 ✅
- [ ] **第 4 章**：基礎設施即代碼與部署 ✅
- [ ] **第 5 章**：多智能代理 AI 解決方案 ✅
- [ ] **第 6 章**：部署前驗證與計劃 ✅
- [ ] **第 7 章**：故障排除與除錯 ✅
- [ ] **第 8 章**：生產與企業級模式 ✅

### 學習驗證
完成每章後，以以下方式驗證知識：
1. <strong>實作練習</strong>：完成該章節的動手部署
2. <strong>知識檢測</strong>：檢視該章常見問題(FAQ)
3. <strong>社群討論</strong>：於 Azure Discord 分享經驗
4. <strong>下一章節</strong>：挑戰更高難度

### 課程完成好處
全部章節完成後，您將擁有：
- <strong>生產經驗</strong>：已將真實 AI 應用部屬到 Azure
- <strong>專業技能</strong>：企業級部署能力  
- <strong>社群認可</strong>：成為活躍的 Azure 開發者社群成員
- <strong>職涯發展</strong>：搶手的 AZD 和 AI 部署專才

---

## 🤝 社群與支援

### 尋求協助與支援
- <strong>技術問題</strong>： [回報錯誤與功能需求](https://github.com/microsoft/azd-for-beginners/issues)
- <strong>學習問題</strong>： [Microsoft Azure Discord 社群](https://discord.gg/microsoft-azure) 及 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 專屬協助**：加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- <strong>文件</strong>： [官方 Azure 開發者 CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord 的社群洞察

**#Azure 頻道最新投票結果：**
- **45%** 的開發者想使用 AZD 處理 AI 工作負載
- <strong>主要挑戰</strong>：多服務部署、憑證管理、生產準備  
- <strong>最受歡迎</strong>：AI 專屬模板、故障排除指引、最佳實務

**加入我們社群享有：**
- 分享你的 AZD + AI 體驗並獲得協助
- 優先體驗全新 AI 模板預覽
- 參與 AI 部署最佳實務貢獻
- 影響未來 AI + AZD 功能開發

### 對課程的貢獻
歡迎貢獻！請參考我們的 [貢獻指南](CONTRIBUTING.md)，內容包括：
- <strong>內容改進</strong>：增強現有章節與範例
- <strong>新增範例</strong>：加入真實案例與模板  
- <strong>翻譯支援</strong>：維護多語言支援
- <strong>錯誤回報</strong>：提升準確度與清晰度
- <strong>社群標準</strong>：遵守包容性社群守則

---

## 📄 課程資訊

### 授權條款
本專案採用 MIT 授權條款，詳見 [LICENSE](../../LICENSE) 檔案。

### 相關 Microsoft 學習資源

我們團隊亦提供其他完整學習課程：

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j 入門](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js 入門](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain 入門](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / 代理
[![AZD 入門](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI 入門](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP 入門](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI 代理入門](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### 生成式 AI 系列
[![生成式 AI 入門](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

[![生成式人工智能（JavaScript）](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### 核心學習
[![初學者機器學習](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![初學者數據科學](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![初學者人工智能](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![初學者網絡安全](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![初學者網頁開發](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![初學者物聯網](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![初學者XR開發](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot 系列
[![AI 配對編程的 Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET 的 Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot 冒險](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ 課程導航

**🚀 準備開始學習？**

<strong>初學者</strong>：從[第1章：基礎與快速入門](#-chapter-1-foundation--quick-start)開始  
<strong>人工智能開發者</strong>：直接跳到[第2章：AI優先開發](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
<strong>有經驗的開發者</strong>：從[第3章：配置與身份驗證](#️-chapter-3-configuration--authentication)開始

<strong>下一步</strong>：[開始第1章 - AZD 基礎](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->