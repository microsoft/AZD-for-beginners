# 初學者的 AZD：有系統的學習之旅

![AZD-for-beginners](../../translated_images/zh-MO/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 自動翻譯（隨時更新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](./README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **喜歡在本地複製?**
>
> 此程式庫包含 50 多種語言的翻譯，這大幅增加了下載大小。若要不含翻譯地複製，請使用稀疏檢出：
>
> **Bash / macOS / Linux：**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows)：**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> 這讓你能以更快的速度下載，並取得完成課程所需的一切。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 azd 今日更新內容

> 📌 本課程依據 **`azd 1.27.1`**（2026 年 7 月）進行驗證。執行 `azd version` 檢查版本， `azd upgrade` 更新到最新。

Azure 開發者 CLI 已超越傳統的網頁應用程式與 API。今天，azd 是部署至 Azure <strong>任何</strong> 應用的唯一工具——包括 AI 驅動的應用和智慧代理。

這對你意味著：

- **AI 代理現在是首要的 azd 工作負載。** 你可以使用你熟悉的 `azd init` → `azd up` 流程來初始化、部署和管理 AI 代理專案。
- **來自 CLI 的完整代理生命週期。** `azure.ai.agents` 擴充功能現在涵蓋整個流程—`azd ai agent init` 搭建骨架、`azd ai agent invoke` 測試（含回應時間輸出）、`azd ai agent eval generate` 和 `azd ai agent optimize` 進行品質量測與改進，及 `azd ai agent delete` 清理。
- **更多 AI 牆磚。** 新的預覽擴充—`azure.ai.skills` 和 `azure.ai.connections`——讓你能直接用 azd 管理可重用的代理技能與 Foundry 連接。
- **Microsoft Foundry 整合** 將模型部署、代理託管和 AI 服務配置直接納入 azd 範本生態系統。
- **日常基本操作更順暢。** 最近版本使 `azd init` 可重複執行（安全不出錯）、`azd auth login` 自動清除過期憑證，並新增了友善的 `azd tool` 首次執行設定提示。
- **核心工作流程未變。** 無論你是在部署待辦應用、微服務，還是多代理 AI 解決方案，指令都相同。

> **Aspire 用戶注意：** 微軟現只稱該產品為 **Aspire**（前稱「.NET Aspire」）。azd 的 Aspire 支援未變，僅更新名稱。

若你曾用過 azd，AI 支援是自然延伸——非獨立工具或進階路線。若你是新手，將學習一套通用流程。

---

## 🚀 什麼是 Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** 是個以開發者友善為核心的命令列工具，能簡化部署 Azure 應用。你不須手動建立和連接數十個 Azure 資源，透過一行命令即可部署完整應用。

### `azd up` 的魔力

```bash
# 這一個命令完成所有任務：
# ✅ 建立所有 Azure 資源
# ✅ 配置網絡和安全性
# ✅ 建置你的應用程式代碼
# ✅ 部署到 Azure
# ✅ 提供你一個可用的網址
azd up
```

**就是這樣！** 無需點擊 Azure 入口網站，無需先學複雜 ARM 範本，無需手動設定——直接在 Azure 上運作你的應用程式。

---

## ❓ Azure Developer CLI 與 Azure CLI：差別為何？

這是初學者最常問的問題。簡答如下：

| 功能 | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| <strong>目的</strong> | 管理個別 Azure 資源 | 部署完整應用 |
| <strong>思維</strong> | 基礎設施為主 | 應用為主 |
| <strong>範例</strong> | `az webapp create --name myapp...` | `azd up` |
| <strong>學習曲線</strong> | 必須了解 Azure 服務 | 只需了解你的應用 |
| <strong>適用對象</strong> | DevOps、基礎設施 | 開發者、原型製作 |

### 簡易比喻

- **Azure CLI** 就像你擁有各種工具來蓋房子——錘子、鋸子、釘子。你能建造任何東西，但必須知道建築知識。
- **Azure Developer CLI** 就像你找承包商——你描述需求，他們幫你完成建造。

### 何時使用哪個

| 情境 | 使用工具 |
|----------|----------|
| 「我想快速部署網頁應用」 | `azd up` |
| 「我只需建立儲存帳戶」 | `az storage account create` |
| 「我在建立完整 AI 應用」 | `azd init --template azure-search-openai-demo` |
| 「我想偵錯特定 Azure 資源」 | `az resource show` |
| 「我想數分鐘內得到產線部署」 | `azd up --environment production` |

### 它們是互補的！

AZD 底層使用 Azure CLI。兩個都可以用：
```bash
# 使用 AZD 部署您的應用程式
azd up

# 然後使用 Azure CLI 微調特定資源
az webapp config set --name myapp --always-on true
```

---

## 🌟 在 Awesome AZD 中尋找範本

不必從零開始！**Awesome AZD** 是社群精選的即時部署範本蒐集：

| 資源 | 描述 |
|----------|-------------|
| 🔗 [**Awesome AZD 展示畫廊**](https://azure.github.io/awesome-azd/) | 瀏覽超過 200 個可一鍵部署範本 |
| 🔗 [<strong>提交範本</strong>](https://github.com/Azure/awesome-azd/issues) | 向社群貢獻你的範本 |
| 🔗 [**GitHub 儲存庫**](https://github.com/Azure/awesome-azd) | 收藏並探索源碼 |

### Awesome AZD 熱門 AI 範本

```bash
# 使用 Microsoft Foundry 模型與 AI 搜尋的 RAG 聊天
azd init --template azure-search-openai-demo

# 快速 AI 聊天應用程式
azd init --template openai-chat-app-quickstart

# 使用 Foundry Agent 的 AI 代理
azd init --template get-started-with-ai-agents
```

---

## 🎯 3 步驟快速入門

開始前，請確保你的機器符合你要部署的範本需求：

**Windows：**
```powershell
.\validate-setup.ps1
```

**macOS / Linux：**
```bash
bash ./validate-setup.sh
```

任何必要檢查失敗，請先修正，再繼續快速入門。

### 第一步：安裝 AZD (2 分鐘)

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

### 第二步：AZD 驗證

```bash
# 如果您計劃在本課程中直接使用 Azure CLI 命令，則為可選
az login

# AZD 工作流程所必需
azd auth login
```

若不確定需用哪種，請查看[安裝與設定](docs/chapter-01-foundation/installation.md#authentication-setup)的完整流程。

### 第三步：部署你的第一個應用

```bash
# 從模板初始化
azd init --template todo-nodejs-mongo

# 部署到 Azure（創建所有內容！）
azd up
```

**🎉 完成！** 你的應用現已在 Azure 線上。

### 清理 (別忘了！)

```bash
# 完成實驗後移除所有資源
azd down --force --purge
```

---

## 📚 本課程使用指南

本課程設計為 <strong>漸進式學習</strong>——從你舒適的起點開始，逐步深入：

| 你的經驗 | 開始於 |
|-----------------|------------|
| **剛接觸 Azure** | [第 1 章：基礎](#-chapter-1-foundation--quick-start) |
| **認識 Azure，AZD 新手** | [第 1 章：基礎](#-chapter-1-foundation--quick-start) |
| **想部署 AI 應用** | [第 2 章：AI 首開發](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| <strong>想實作練習</strong> | [🎓 互動式工作坊](workshop/README.md) - 3-4 小時指導實驗室 |
| <strong>需要生產模式</strong> | [第 8 章：生產與企業](#-chapter-8-production--enterprise-patterns) |

### 快速設定

1. <strong>分支此倉庫</strong>: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. <strong>複製它</strong>: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. <strong>取得協助</strong>: [Azure Discord 社群](https://discord.com/invite/ByRwuEEgH4)

> **喜歡在本地複製?**

> 此程式庫包含 50 多種語言的翻譯，這大幅增加了下載大小。若要不含翻譯地複製，請使用稀疏檢出：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 這讓你能以更快的速度下載，並取得完成課程所需的一切。


## 課程總覽

透過有系統的章節掌握 Azure Developer CLI (azd) 。**特別聚焦於結合 Microsoft Foundry 的 AI 應用部署。**


### 為什麼這門課程對現代開發人員至關重要

根據 Microsoft Foundry Discord 社區的見解，**45% 的開發人員想使用 AZD 來處理 AI 工作負載**，但遇到以下挑戰：
- 複雜的多服務 AI 架構
- 生產環境 AI 部署最佳實踐
- Azure AI 服務整合與配置
- AI 工作負載的成本優化
- AI 專屬部署問題的疑難排解

### 學習目標

完成此結構化課程後，您將能：
- **掌握 AZD 基礎知識**：核心概念、安裝與配置
- **部署 AI 應用程式**：使用 AZD 搭配 Microsoft Foundry 服務
- <strong>實作基礎建設即程式碼</strong>：使用 Bicep 模板管理 Azure 資源
- <strong>疑難排解部署問題</strong>：解決常見問題和除錯
- <strong>優化生產環境</strong>：安全、擴展、監控與成本管理
- <strong>建構多智能體解決方案</strong>：部署複雜的 AI 架構

## 開始之前：帳戶、權限與假設

在開始第 1 章之前，請確保您已具備以下條件。本文後續的安裝步驟假設這些基本條件已經完成。

- **Azure 訂閱**：您可以使用工作或個人帳號現有的訂閱，或建立[免費試用](https://aka.ms/azurefreetrial)開始使用。
- **建立 Azure 資源的權限**：大多數練習您應至少具有目標訂閱或資源群組的<strong>貢獻者</strong>權限。有些章節也假設您可以建立資源群組、管理識別和 RBAC 指派。
- [**GitHub 帳戶**](https://github.com)：有助於分叉代碼庫、追蹤您自己的更改，以及使用 GitHub Codespaces 參與工作坊。
- <strong>模板執行環境先決條件</strong>：部分模板需要本機工具，例如 Node.js、Python、Java 或 Docker。開始前請執行設定驗證器，以提前發現缺少的工具。
- <strong>基本終端機操作熟悉度</strong>：您不需是專家，但應該能熟練執行 `git clone`、`azd auth login` 和 `azd up` 等命令。

> **您在企業訂閱工作？**
> 如果您的 Azure 環境由管理員管理，請事先確認您是否可在計劃使用的訂閱或資源群組部署資源。若不行，請在開始前申請沙盒訂閱或貢獻者權限。

> **Azure 新手？**
> 請直接使用您自己的 Azure 試用或按用量付費訂閱 https://aka.ms/azurefreetrial，以便完整完成所有練習，無需等待租戶級批准。

## 🗺️ 課程地圖：按章節快速瀏覽

每個章節都有專屬 README，包含學習目標、快速開始和練習：

| 章節 | 主題 | 課程 | 時長 | 複雜度 |
|---------|-------|---------|----------|------------|
| **[第1章：基礎](docs/chapter-01-foundation/README.md)** | 入門 | [AZD 基礎](docs/chapter-01-foundation/azd-basics.md) &#124; [安裝](docs/chapter-01-foundation/installation.md) &#124; [第一個專案](docs/chapter-01-foundation/first-project.md) | 30-45 分鐘 | ⭐ |
| **[第2章：AI 開發](docs/chapter-02-ai-development/README.md)** | AI 為先的應用程式 | [Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI 智能體](docs/chapter-02-ai-development/agents.md) &#124; [模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [工作坊](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 小時 | ⭐⭐ |
| **[第3章：配置](docs/chapter-03-configuration/README.md)** | 認證與安全 | [配置](docs/chapter-03-configuration/configuration.md) &#124; [認證與安全](docs/chapter-03-configuration/authsecurity.md) | 45-60 分鐘 | ⭐⭐ |
| **[第4章：基礎建設](docs/chapter-04-infrastructure/README.md)** | IaC 與部署 | [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [資源配置](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 小時 | ⭐⭐⭐ |
| **[第5章：多智能體](docs/chapter-05-multi-agent/README.md)** | AI 智能體解決方案 | [零售情境](examples/retail-scenario.md) &#124; [協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 小時 | ⭐⭐⭐⭐ |
| **[第6章：部署前](docs/chapter-06-pre-deployment/README.md)** | 規劃與驗證 | [起飛檢查](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [應用洞察](docs/chapter-06-pre-deployment/application-insights.md) | 1 小時 | ⭐⭐ |
| **[第7章：疑難排解](docs/chapter-07-troubleshooting/README.md)** | 除錯與修復 | [常見問題](docs/chapter-07-troubleshooting/common-issues.md) &#124; [除錯](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI 問題](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 小時 | ⭐⭐ |
| **[第8章：生產環境](docs/chapter-08-production/README.md)** | 企業模式 | [生產實踐](docs/chapter-08-production/production-ai-practices.md) | 2-3 小時 | ⭐⭐⭐⭐ |
| **[🎓 工作坊](workshop/README.md)** | 實作實驗室 | [介紹](workshop/docs/instructions/0-Introduction.md) &#124; [選擇](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [驗證](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [拆解](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [配置](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [自訂](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [拆除](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [總結](workshop/docs/instructions/7-Wrap-up.md) | 3-4 小時 | ⭐⭐ |

**課程總時長：** 約 10-14 小時 | **技能進階：** 初學者 → 生產環境就緒

---

## 📚 學習章節

<em>根據經驗層級與目標選擇您的學習路徑</em>

### 🚀 第1章：基礎與快速起步
<strong>先決條件</strong>：Azure 訂閱、基本指令行知識  
<strong>時長</strong>：30-45 分鐘  
<strong>複雜度</strong>：⭐

#### 您將學到什麼
- 了解 Azure Developer CLI 的基本原理
- 在您的平台上安裝 AZD
- 完成您的第一次成功部署

#### 學習資源
- **🎯 從這裡開始**：[什麼是 Azure Developer CLI？](#what-is-azure-developer-cli)
- **📖 理論**：[AZD 基礎](docs/chapter-01-foundation/azd-basics.md) - 核心概念與術語
- **⚙️ 安裝設定**：[安裝與設定](docs/chapter-01-foundation/installation.md) - 平台特定指南
- **🛠️ 實作操作**：[您的第一個專案](docs/chapter-01-foundation/first-project.md) - 步驟教學
- **📋 快速參考**：[命令速查表](resources/cheat-sheet.md)

#### 實作練習
```bash
# 快速安裝檢查
azd version

# 部署您的第一個應用程式
azd init --template todo-nodejs-mongo
azd up
```

**💡 章節成果**：成功使用 AZD 將簡單網頁應用程式部署到 Azure

**✅ 成功驗證：**
```bash
# 完成第一章後，你應該能夠：
azd version              # 顯示已安裝版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署至 Azure
azd show                # 顯示運行中應用程式的 URL
# 應用程式在瀏覽器中開啟並運作
azd down --force --purge  # 清理資源
```

**📊 時間投入：** 30-45 分鐘  
**📈 後續技能水準：** 能獨立部署基礎應用程式
**📈 後續技能水準：** 能獨立部署基礎應用程式

---

### 🤖 第2章：AI 為先開發（推薦給 AI 開發者）
<strong>先決條件</strong>：完成第1章  
<strong>時長</strong>：1-2 小時  
<strong>複雜度</strong>：⭐⭐

#### 您將學到什麼
- Microsoft Foundry 與 AZD 的整合
- 部署 AI 驅動的應用程式
- 了解 AI 服務配置

#### 學習資源
- **🎯 從這裡開始**：[Microsoft Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI 智能體**：[AI 智能體指南](docs/chapter-02-ai-development/agents.md) - 使用 AZD 部署智慧代理
- **📖 模式**：[AI 模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) - 部署與管理 AI 模型
- **🛠️ 工作坊**：[AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - 讓您的 AI 解決方案符合 AZD
- **🎥 互動指南**：[工作坊教材](workshop/README.md) - 用 MkDocs 瀏覽器學習 * DevContainer 環境
- **📋 範本**：[Microsoft Foundry 範本](#工作坊資源)
- **📝 範例**：[AZD 部署範例](examples/README.md)

#### 實作練習
```bash
# 部署您的第一個人工智能應用程式
azd init --template azure-search-openai-demo
azd up

# 嘗試更多人工智能範本
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 章節成果**：部署並配置具備 RAG 功能的 AI 聊天應用程式

**✅ 成功驗證：**
```bash
# 完成第二章後，你應該能夠：
azd init --template azure-search-openai-demo
azd up
# 測試 AI 聊天介面
# 提問並獲得帶有資料來源的 AI 回應
# 驗證搜尋整合功能正常
azd monitor  # 檢查應用程式洞察顯示遙測資料
azd down --force --purge
```

**📊 時間投入：** 1-2 小時  
**📈 後續技能水準：** 能部署與配置生產就緒的 AI 應用程式  
**💰 成本意識：** 了解開發成本約 $80-150/月，生產成本約 $300-3500/月

#### 💰 AI 部署的成本考慮

**開發環境（估算 $80-150/月）：**
- Microsoft Foundry 模型（按用量付費）：$0-50/月（基於代幣使用量）
- AI 搜尋（基本層級）：$75/月
- Container Apps（按消耗計費）：$0-20/月
- 儲存（標準層）：$1-5/月

**生產環境（估算 $300-3,500+/月）：**
- Microsoft Foundry 模型（PTU 保證效能）：$3,000+/月 或 高流量按用量計費
- AI 搜尋（標準層）：$250/月
- Container Apps（專用層）：$50-100/月
- 應用洞察：$5-50/月
- 儲存（高級層）：$10-50/月

**💡 成本優化建議：**
- 使用 <strong>免費層</strong> Microsoft Foundry 模型學習（包含 Azure OpenAI 50,000 代幣/月）
- 開發非使用時執行 `azd down` 以釋放資源
- 初期採用按消耗計費，生產環境才升級至 PTU
- 部署前用 `azd provision --preview` 估算成本
- 啟用自動調節：僅為實際使用量付費

**成本監控：**
```bash
# 檢查預計每月成本
azd provision --preview

# 在 Azure 入口網站監察實際成本
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第3章：配置與認證
<strong>先決條件</strong>：完成第1章  
<strong>時長</strong>：45-60 分鐘  
<strong>複雜度</strong>：⭐⭐

#### 您將學到什麼
- 環境配置與管理
- 認證與安全最佳實踐
- 資源命名與組織

#### 學習資源
- **📖 配置**：[配置指南](docs/chapter-03-configuration/configuration.md) - 環境設定
- **🔐 安全**：[認證樣式與管理識別](docs/chapter-03-configuration/authsecurity.md) - 認證模式
- **📝 範例**：[資料庫應用範例](examples/database-app/README.md) - AZD 資料庫範例

#### 實作練習
- 配置多個環境（開發、測試、生產）
- 設定管理識別認證
- 實作環境專屬配置

**💡 章節成果**：使用適當的認證與安全管理多個環境

---

### 🏗️ 第4章：基礎建設即程式碼與部署
<strong>先決條件</strong>：完成第1至3章  
<strong>時長</strong>：1-1.5 小時  
<strong>複雜度</strong>：⭐⭐⭐

#### 您將學到什麼
- 進階部署模式
- 使用 Bicep 進行基礎建設即程式碼
- 資源配置策略

#### 學習資源
- **📖 部署**：[部署指南](docs/chapter-04-infrastructure/deployment-guide.md) - 完整工作流程
- **🏗️ 配置**：[資源配置](docs/chapter-04-infrastructure/provisioning.md) - Azure 資源管理
- **📝 範例**：[Container App 範例](../../examples/container-app) - 容器化部署

#### 實作練習
- 建立自訂 Bicep 模板
- 部署多服務應用程式
- 實作藍綠部署策略

**💡 章節成果**：使用自訂基礎架構模板部署複雜多服務應用

---


### 🎯 第五章：多代理人工智能解決方案（進階）
<strong>先決條件</strong>：完成第一至第二章  
<strong>時長</strong>：2-3 小時  
<strong>難度</strong>：⭐⭐⭐⭐

#### 你將學習到
- 多代理架構模式
- 代理協同與協調
- 生產環境就緒的人工智能部署

#### 學習資源
- **🤖 精選專案**：[零售多代理解決方案](examples/retail-scenario.md) - 完整實作
- **🛠️ ARM 範本**：[ARM 範本套件](../../examples/retail-multiagent-arm-template) - 一鍵部署
- **📖 架構**：[多代理協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) - 模式解析

#### 實作練習
```bash
# 部署完整的零售多代理解決方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索代理配置
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 章節成果**：部署並管理生產環境就緒的多代理 AI 解決方案，包含客戶代理與庫存代理

---

### 🔍 第六章：部署前驗證與規劃
<strong>先決條件</strong>：完成第四章  
<strong>時長</strong>：1 小時  
<strong>難度</strong>：⭐⭐

#### 你將學習到
- 容量規劃與資源驗證
- SKU 選擇策略
- 預驗收檢查與自動化

#### 學習資源
- **📊 規劃**：[容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) - 資源驗證
- **💰 選擇**：[SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) - 成本效益選擇
- **✅ 驗證**：[預驗收檢查](docs/chapter-06-pre-deployment/preflight-checks.md) - 自動化腳本

#### 實作練習
- 執行容量驗證腳本
- 優化 SKU 選擇以降低成本
- 實作自動化的部署前檢查

**💡 章節成果**：在執行前驗證並優化部署

---

### 🚨 第七章：故障排除與偵錯
<strong>先決條件</strong>：完成任一部署章節  
<strong>時長</strong>：1-1.5 小時  
<strong>難度</strong>：⭐⭐

#### 你將學習到
- 系統化偵錯方法
- 常見問題與解決方案
- AI 專屬故障排查

#### 學習資源
- **🔧 常見問題**：[常見問題](docs/chapter-07-troubleshooting/common-issues.md) - 常見問答與解決方案
- **🕵️ 偵錯**：[偵錯指南](docs/chapter-07-troubleshooting/debugging.md) - 逐步策略
- **🤖 AI 問題**：[AI 專屬故障排除](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI 服務問題

#### 實作練習
- 診斷部署失敗原因
- 解決認證問題
- 偵錯 AI 服務連線

**💡 章節成果**：獨立診斷並解決常見部署問題

---

### 🏢 第八章：生產與企業模式
<strong>先決條件</strong>：完成第一至第四章  
<strong>時長</strong>：2-3 小時  
<strong>難度</strong>：⭐⭐⭐⭐

#### 你將學習到
- 生產環境部署策略
- 企業安全模式
- 監控與成本優化

#### 學習資源
- **🏭 生產環境**：[生產 AI 最佳實踐](docs/chapter-08-production/production-ai-practices.md) - 企業級模式
- **📝 範例**：[微服務範例](../../examples/microservices) - 複雜架構
- **📊 監控**：[Application Insights 整合](docs/chapter-06-pre-deployment/application-insights.md) - 監控

#### 實作練習
- 實作企業安全模式
- 設定完整監控系統
- 按照規範部署生產環境

**💡 章節成果**：部署具有完整生產能力的企業級應用程式

---

## 🎓 工作坊總覽：實作學習體驗

> **⚠️ 工作坊狀態：持續開發中**  
> 工作坊教材仍在開發和優化中。核心模組已可使用，但部分進階內容尚未完成。我們正在積極完成所有內容。[追蹤進度 →](workshop/README.md)

### 互動式工作坊教材
**完整實作學習，搭配瀏覽器工具及指導練習**

我們的工作坊教材提供結構化、互動式的學習體驗，與上述章節課程互補。工作坊適合自學亦適合教學指導。

#### 🛠️ 工作坊特色
- <strong>瀏覽器介面</strong>：完整 MkDocs 支援，帶搜索、複製、主題功能
- **GitHub Codespaces 整合**：一鍵環境啟動
- <strong>結構化學習路徑</strong>：8 模組指導練習（共約 3-4 小時）
- <strong>循序漸進方法論</strong>：初識 → 選擇 → 驗證 → 拆解 → 配置 → 自訂 → 清理 → 總結
- **互動 DevContainer 環境**：預配置工具與相依

#### 📚 工作坊模組結構
工作坊採用<strong>8 模組循序漸進方法論</strong>，引導你從發掘到部署精通：

| 模組 | 主題 | 你將做什麼 | 時長 |
|--------|-------|----------------|----------|
| **0. 介紹** | 工作坊總覽 | 理解學習目標、先決條件及工作坊架構 | 15 分鐘 |
| **1. 選擇** | 範本探索 | 探索 AZD 範本並選擇適合場景的 AI 範本 | 20 分鐘 |
| **2. 驗證** | 部署與驗證 | 使用 `azd up` 部署範本並驗證基礎設施運作 | 30 分鐘 |
| **3. 拆解** | 理解結構 | 利用 GitHub Copilot 探索範本架構、Bicep 文件和程式碼組織 | 30 分鐘 |
| **4. 配置** | azure.yaml 深入 | 精通 `azure.yaml` 配置、生命週期掛鉤與環境變量 | 30 分鐘 |
| **5. 自訂** | 個人化配置 | 啟用 AI 搜索、追蹤、評估，並根據場景自訂 | 45 分鐘 |
| **6. 清理** | 資源清理 | 安全使用 `azd down --purge` 解除佈署資源 | 15 分鐘 |
| **7. 總結** | 下一步 | 回顧成就、關鍵概念並持續學習 | 15 分鐘 |

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
# 選項 1：GitHub Codespaces（推薦）
# 在儲存庫內點擊「程式碼」→「在 main 上建立 codespace」

# 選項 2：本地開發
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 遵循 workshop/README.md 中的設置說明
```

#### 🎯 工作坊學習成果
完成工作坊後，參與者將能：
- **部署生產級 AI 應用**：使用 AZD 搭配 Microsoft Foundry 服務
- <strong>掌握多代理架構</strong>：實作協調式 AI 代理解決方案
- <strong>實現安全最佳實務</strong>：配置認證與權限控制
- <strong>優化擴展能力</strong>：設計成本效益高且效能良好的部署
- <strong>排除部署問題</strong>：能獨立解決常見問題

#### 📖 工作坊資源
- **🎥 互動式指南**：[工作坊教材](workshop/README.md) - 瀏覽器學習環境
- **📋 分模組教學：**
  - [0. 介紹](workshop/docs/instructions/0-Introduction.md) - 工作坊總覽與目標
  - [1. 選擇](workshop/docs/instructions/1-Select-AI-Template.md) - 尋找並選擇 AI 範本
  - [2. 驗證](workshop/docs/instructions/2-Validate-AI-Template.md) - 部署並驗證範本
  - [3. 拆解](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - 探索範本架構
  - [4. 配置](workshop/docs/instructions/4-Configure-AI-Template.md) - 精通 azure.yaml
  - [5. 自訂](workshop/docs/instructions/5-Customize-AI-Template.md) - 根據場景自訂
  - [6. 清理](workshop/docs/instructions/6-Teardown-Infrastructure.md) - 清理資源
  - [7. 總結](workshop/docs/instructions/7-Wrap-up.md) - 回顧與後續步驟
- **🛠️ AI 工作坊實驗室**：[AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - 針對 AI 的實作練習
- **💡 快速開始**：[工作坊設定指南](workshop/README.md#quick-start) - 環境配置說明

<strong>適合對象</strong>：企業培訓、大學課程、自學及開發者訓練營。

---

## 📖 深入解析：AZD 功能

除了基礎功能外，AZD 還提供強大的生產環境部署功能：

- <strong>基於範本的部署</strong> - 使用預建範本針對常見應用模式
- <strong>基礎架構即程式碼</strong> - 使用 Bicep 或 Terraform 管理 Azure 資源  
- <strong>整合工作流</strong> - 無縫佈署、部署與監控應用
- <strong>友善開發者</strong> - 優化生產力與使用體驗

### **AZD + Microsoft Foundry：AI 部署的完美組合**

**為何選擇 AZD 來做 AI 解決方案？** AZD 解決 AI 開發者面臨的主要挑戰：

- **AI 就緒範本** - 預配置的 Microsoft Foundry 模型、Azure AI 服務與機器學習工作負載範本
- **安全的 AI 部署** - 內建 AI 服務、安全金鑰及模型端點的安全模式  
- **生產級 AI 模式** - 可擴展且成本效益高的 AI 應用部署最佳實務
- **端到端 AI 工作流程** - 從模型開發到生產部署，並配備完善監控
- <strong>成本優化</strong> - 智慧資源配置與運算擴展策略
- **Microsoft Foundry 整合** - 無縫連結 Microsoft Foundry 模型目錄與端點

---

## 🎯 範本與範例庫

### 精選：Microsoft Foundry 範本
**若要部署 AI 應用，請從這裡開始！**

> **注意：** 這些範本展示多種 AI 模式。有些來自外部 Azure 範例，另一些為本地實作。

| 範本 | 章節 | 難度 | 服務 | 類型 |
|----------|---------|------------|----------|------|
| [**開始使用 AI 聊天**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第二章 | ⭐⭐ | AzureOpenAI + Azure AI 推理 API + Azure AI 搜尋 + Azure Container Apps + Application Insights | 外部 |
| [**開始使用 AI 代理**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第二章 | ⭐⭐ | Foundry 代理 + AzureOpenAI + Azure AI 搜尋 + Azure Container Apps + Application Insights| 外部 |
| [**Azure 搜尋 + OpenAI 示範**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第二章 | ⭐⭐ | AzureOpenAI + Azure AI 搜尋 + App Service + 儲存體 | 外部 |
| [**OpenAI 聊天應用快速上手**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第二章 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**代理 OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第五章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso 聊天 RAG**](https://github.com/Azure-Samples/contoso-chat) | 第八章 | ⭐⭐⭐⭐ | AzureOpenAI + AI 搜尋 + Cosmos DB + Container Apps | 外部 |
| [<strong>零售多代理解決方案</strong>](examples/retail-scenario.md) | 第五章 | ⭐⭐⭐⭐ | AzureOpenAI + AI 搜尋 + 儲存體 + Container Apps + Cosmos DB | <strong>本地</strong> |

### 精選：完整學習場景
**生產環境就緒的應用範本，對應學習章節**

| 範本 | 學習章節 | 難度 | 主要學習點 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第二章 | ⭐ | 基本 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第二章 | ⭐⭐ | Azure AI 搜尋的 RAG 實作 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第四章 | ⭐⭐ | 文件智慧整合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第五章 | ⭐⭐⭐ | 代理框架與函式呼叫 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第八章 | ⭐⭐⭐ | 企業 AI 編排 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第五章 | ⭐⭐⭐⭐ | 客戶代理與庫存代理的多代理架構 |

### 按範例類型學習

> **📌 本地與外部範例：**  
> <strong>本地範例</strong>（此 repo 中）= 可立即使用  
> <strong>外部範例</strong>（Azure 範例）= 從連結的倉庫 clone

#### 本地範例（可立即使用）
- [<strong>零售多代理解決方案</strong>](examples/retail-scenario.md) - 完整生產環境就緒實作，含 ARM 範本
  - 多代理架構（客戶 + 庫存代理）
  - 全面監控與評估
  - 一鍵 ARM 範本部署

#### 本地範例 - Container 應用（第二至五章）
**本倉庫中包含完整 container 部署範例：**

- [<strong>容器應用程式範例</strong>](examples/container-app/README.md) - 容器化部署完整指南
  - [簡單的 Flask API](../../examples/container-app/simple-flask-api) - 可擴展至零的基本 REST API
  - [微服務架構](../../examples/container-app/microservices) - 適合生產的多服務部署
  - 快速開始、生產與高級部署模式
  - 監控、安全性及成本優化指引

#### 外部範例 - 簡單應用程式（第一至二章）
**克隆這些 Azure 範例倉庫以開始使用：**
- [簡單網頁應用 - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本部署模式
- [靜態網站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 靜態內容部署
- [容器應用 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署

#### 外部範例 - 資料庫整合（第三至四章）  
- [資料庫應用 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 資料庫連線模式
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 無伺服器資料工作流程

#### 外部範例 - 進階模式（第四至八章）
- [Java 微服務](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服務架構
- [容器應用作業](https://github.com/Azure-Samples/container-apps-jobs) - 背景處理  
- [企業 ML 管道](https://github.com/Azure-Samples/mlops-v2) - 生產就緒的機器學習模式

### 外部模板集合
- [**官方 AZD 模板畫廊**](https://azure.github.io/awesome-azd/) - 精選官方及社區模板集合
- [**Azure Developer CLI 模板**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - 微軟 Learn 模板文件
- [<strong>範例目錄</strong>](examples/README.md) - 本地學習範例及詳細說明

---

## 📚 學習資源與參考

### 快速參考
- [<strong>命令速查表</strong>](resources/cheat-sheet.md) - 按章節整理的必備 azd 指令
- [<strong>術語集</strong>](resources/glossary.md) - Azure 與 azd 術語  
- [<strong>常見問題</strong>](resources/faq.md) - 按學習章節整理的常見問題
- [<strong>學習指南</strong>](resources/study-guide.md) - 全面練習題目

### 實作工作坊
- [**AI 工作坊實驗室**](docs/chapter-02-ai-development/ai-workshop-lab.md) - 讓你的 AI 解決方案可用 AZD 部署（2-3 小時）
- [<strong>互動式工作坊</strong>](workshop/README.md) - 8 模組有導引練習搭配 MkDocs 和 GitHub Codespaces
  - 流程：介紹 → 選擇 → 驗證 → 分解 → 配置 → 自訂 → 拆除 → 總結

### 外部學習資源
- [Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 價格計算器](https://azure.microsoft.com/pricing/calculator/)
- [Azure 狀態](https://status.azure.com/)

### 為你的編輯器準備的 AI 代理技能
- [**Microsoft Azure 技能於 skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 個針對 Azure AI、Foundry、部署、診斷、成本優化等的開放代理技能。可安裝於 GitHub Copilot、Cursor、Claude Code 或任何支援代理：
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 快速故障解決指南

**初學者常見問題與即時解決方案：**

<details>
<summary><strong>❌ "azd: 找不到指令"</strong></summary>

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
<summary><strong>❌ "找不到訂閱" 或 "沒有設定訂閱"</strong></summary>

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
</details>

<details>
<summary><strong>❌ "配額不足" 或 "配額超過"</strong></summary>

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
<summary><strong>❌ "azd up" 在中途失敗</strong></summary>

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
<summary><strong>❌ "驗證失敗" 或 "令牌過期"</strong></summary>

```bash
# 重新驗證 AZD
azd auth logout
azd auth login

# 可選：如果您正在執行 az 命令，亦刷新 Azure CLI
az logout
az login

# 驗證身份驗證
az account show
```
</details>

<details>
<summary><strong>❌ "資源已存在" 或 命名衝突</strong></summary>

```bash
# AZD 會產生唯一名稱，但如果有衝突：
azd down --force --purge

# 然後使用新的環境重新嘗試
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 模板部署耗時過長</strong></summary>

**正常等待時間：**
- 簡單網頁應用：5-10 分鐘
- 含資料庫的應用：10-15 分鐘
- AI 應用：15-25 分鐘（OpenAI 佈建較慢）

```bash
# 檢查進度
azd show

# 如果卡住超過30分鐘，請檢查Azure門戶：
azd monitor --overview
# 尋找失敗的部署
```
</details>

<details>
<summary><strong>❌ "權限被拒絕" 或 "禁止訪問"</strong></summary>

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
<summary><strong>❌ 找不到已部署應用程式的 URL</strong></summary>

```bash
# 顯示所有服務端點
azd show

# 或者打開 Azure 門戶
azd monitor

# 檢查特定服務
azd env get-values
# 尋找 *_URL 變數
```
</details>

### 📚 完整故障排除資源

- **常見問題指南：** [詳細解決方案](docs/chapter-07-troubleshooting/common-issues.md)
- **AI 專用問題：** [AI 故障排除](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **除錯指南：** [逐步除錯](docs/chapter-07-troubleshooting/debugging.md)
- **尋求協助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 課程完成與認證

### 進度追蹤
追蹤你每個章節的學習進度：

- [ ] <strong>第一章</strong>：基礎與快速開始 ✅
- [ ] <strong>第二章</strong>：AI 優先開發 ✅  
- [ ] <strong>第三章</strong>：配置與驗證 ✅
- [ ] <strong>第四章</strong>：基礎架構即程式碼與部署 ✅
- [ ] <strong>第五章</strong>：多代理 AI 解決方案 ✅
- [ ] <strong>第六章</strong>：部署前驗證與規劃 ✅
- [ ] <strong>第七章</strong>：故障排除與除錯 ✅
- [ ] <strong>第八章</strong>：生產與企業模式 ✅

### 學習驗證
完成各章後，請透過以下方式驗證你的知識：
1. <strong>實作練習</strong>：完成該章的實務部署
2. <strong>知識檢核</strong>：查看該章常見問題區
3. <strong>社群討論</strong>：在 Azure Discord 分享你的經驗
4. <strong>下一章節</strong>：進入下一個複雜度階段

### 課程完成獲得
完成所有章節後，你將擁有：
- <strong>生產經驗</strong>：已在 Azure 部署實際 AI 應用
- <strong>專業技能</strong>：具備企業級部署能力  
- <strong>社群認可</strong>：活躍的 Azure 開發者社群成員
- <strong>職涯提升</strong>：搶手的 AZD 及 AI 部署專業知識

---

## 🤝 社群與支援

### 獲得協助與支援
- <strong>技術問題</strong>：[回報錯誤和功能請求](https://github.com/microsoft/azd-for-beginners/issues)
- <strong>學習疑問</strong>：[Microsoft Azure Discord 社群](https://discord.gg/microsoft-azure) 與 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 專用協助**：加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- <strong>文件資料</strong>：[官方 Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### 來自 Microsoft Foundry Discord 的社群洞察

**#Azure 頻道最近投票結果：**
- **45%** 的開發者希望用 AZD 處理 AI 工作負載
- <strong>主要挑戰</strong>：多服務部署、憑證管理、生產就緒度  
- <strong>最受歡迎需求</strong>：AI 專用模板、故障排除指南、最佳實踐

**加入我們的社群來：**
- 分享你的 AZD + AI 經驗和獲得協助
- 取得 AI 模板的早期預覽
- 參與 AI 部署最佳實踐的制定
- 影響未來 AI + AZD 功能的發展

### 為課程做出貢獻
我們歡迎貢獻！請閱讀我們的 [貢獻指南](CONTRIBUTING.md) 了解詳細資訊：
- <strong>內容改進</strong>：增強現有章節與範例
- <strong>新增範例</strong>：加入真實案例與模板  
- <strong>翻譯</strong>：協助維護多語言支援
- <strong>錯誤回報</strong>：提升準確性與清晰度
- <strong>社群準則</strong>：遵守我們的包容性社群指引

---

## 📄 課程資訊

### 授權條款
本專案採用 MIT 授權 - 詳見 [LICENSE](../../LICENSE) 文件。

### 相關 Microsoft 學習資源

我們團隊還製作其他全面的學習課程：

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / 代理
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### 生成式 AI 系列
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

[![生成式 AI（JavaScript）](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### 核心學習
[![初學者機器學習](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![初學者數據科學](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![初學者人工智能](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![初學者網絡安全](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![初學者網頁開發](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![初學者物聯網](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![初學者 XR 開發](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot 系列
[![AI 配對編程 Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot 冒險](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ 課程導航

**🚀 準備開始學習？**

<strong>初學者</strong>：從 [第一章：基礎及快速入門](#-chapter-1-foundation--quick-start) 開始  
**AI 開發者**：跳至 [第二章：AI 優先開發](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
<strong>資深開發者</strong>：從 [第三章：配置及認證](#️-chapter-3-configuration--authentication) 開始

<strong>接下來步驟</strong>：[開始第一章 - AZD 基礎](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->