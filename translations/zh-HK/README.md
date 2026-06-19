# AZD 初學者指南：有結構的學習旅程

![AZD-for-beginners](../../translated_images/zh-HK/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 自動翻譯（持續更新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[阿拉伯語](../ar/README.md) | [孟加拉語](../bn/README.md) | [保加利亞語](../bg/README.md) | [緬甸語 (緬甸)](../my/README.md) | [中文（簡體）](../zh-CN/README.md) | [中文（繁體，香港）](./README.md) | [中文（繁體，澳門）](../zh-MO/README.md) | [中文（繁體，台灣）](../zh-TW/README.md) | [克羅地亞語](../hr/README.md) | [捷克語](../cs/README.md) | [丹麥語](../da/README.md) | [荷蘭語](../nl/README.md) | [愛沙尼亞語](../et/README.md) | [芬蘭語](../fi/README.md) | [法語](../fr/README.md) | [德語](../de/README.md) | [希臘語](../el/README.md) | [希伯來語](../he/README.md) | [印地語](../hi/README.md) | [匈牙利語](../hu/README.md) | [印度尼西亞語](../id/README.md) | [意大利語](../it/README.md) | [日語](../ja/README.md) | [坎納達語](../kn/README.md) | [高棉語](../km/README.md) | [韓語](../ko/README.md) | [立陶宛語](../lt/README.md) | [馬來語](../ms/README.md) | [馬拉雅拉姆語](../ml/README.md) | [馬拉地語](../mr/README.md) | [尼泊爾語](../ne/README.md) | [尼日利亞皮欽語](../pcm/README.md) | [挪威語](../no/README.md) | [波斯語 (法爾西語)](../fa/README.md) | [波蘭語](../pl/README.md) | [葡萄牙語（巴西）](../pt-BR/README.md) | [葡萄牙語（葡萄牙）](../pt-PT/README.md) | [旁遮普語（古魯穆奇文）](../pa/README.md) | [羅馬尼亞語](../ro/README.md) | [俄語](../ru/README.md) | [塞爾維亞語（西里爾字母）](../sr/README.md) | [斯洛伐克語](../sk/README.md) | [斯洛文尼亞語](../sl/README.md) | [西班牙語](../es/README.md) | [斯瓦希里語](../sw/README.md) | [瑞典語](../sv/README.md) | [他加祿語（菲律賓語）](../tl/README.md) | [泰米爾語](../ta/README.md) | [泰盧固語](../te/README.md) | [泰語](../th/README.md) | [土耳其語](../tr/README.md) | [烏克蘭語](../uk/README.md) | [烏爾都語](../ur/README.md) | [越南語](../vi/README.md)

> **喜歡本地複製？**
>
> 本存儲庫包含超過 50 種語言的翻譯，這會大幅增加下載大小。若想不帶翻譯複製，請使用稀疏檢出：
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
> 這樣能給你所需的一切以完成課程，且下載速度更快。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 azd 今日更新摘要

> 📌 本課程已針對 **`azd 1.25.6`**（2026 年 6 月）進行驗證。請使用 `azd version` 確認版本，並用 `azd upgrade` 更新至最新版本。

Azure Developer CLI 已超越傳統的網頁應用與 API。如今，azd 是唯一部署 <strong>任何</strong> Azure 應用的工具 — 包括 AI 助理應用和智能代理。

這些對你意味著：

- **AI 代理現已成為一等公民 azd 工作負載。** 你可以用熟悉的 `azd init` → `azd up` 工作流程，初始化、部署及管理 AI 代理專案。
- **CLI 支援完整代理生命週期。** `azure.ai.agents` 擴充套件涵蓋整個流程——`azd ai agent init` 腳手架，`azd ai agent invoke` 測試（並顯示回應時間），`azd ai agent eval generate` 和 `azd ai agent optimize` 評估與優化品質，`azd ai agent delete` 清理。
- **更多 AI 元件。** 全新預覽擴充套件——`azure.ai.skills` 與 `azure.ai.connections`，讓你直接用 azd 管理可重用代理技能及 Foundry 連接。
- **Microsoft Foundry 整合，** 直接將模型部署、代理託管和 AI 服務設定融入 azd 範本生態系。
- **日常操作更流暢。** 最新版本讓 `azd init` 可安全重複執行、`azd auth login` 自動清除陳舊權杖，並新增友善的首次執行 `azd tool` 設置提示。
- **核心工作流程不變。** 無論部署待辦事項應用、微服務還是多代理 AI 解決方案，命令皆相同。

> **Aspire 用戶注意：** 微軟現將產品簡稱為 **Aspire**（前稱「.NET Aspire」）。azd 的 Aspire 支援沒有改變，僅名稱更新。

若你曾用過 azd，AI 支援是自然延伸，而非獨立工具或進階路線。新手則會學會一套通用工作流程，適用於所有應用場景。

---

## 🚀 什麼是 Azure Developer CLI (azd)？

**Azure Developer CLI (azd)** 是一款對開發者友善的命令列工具，簡化將應用部署到 Azure。無需手動建立或連接數十個 Azure 資源，只需一個指令即可完成整個應用的部署。

### `azd up` 的魔法

```bash
# 只需這一個指令就完成所有工作：
# ✅ 建立所有 Azure 資源
# ✅ 設定網絡及安全性
# ✅ 建構你的應用程式程式碼
# ✅ 部署到 Azure
# ✅ 為你提供一個可用的 URL
azd up
```

**就這樣！** 無需操作 Azure 入口網站，無需先學複雜的 ARM 範本，也不需手動配置——Azure 上就有可運作的應用。

---

## ❓ Azure Developer CLI 與 Azure CLI 有何不同？

這是初學者最常問的問題。簡單回答如下：

| 功能 | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| <strong>用途</strong> | 管理單一 Azure 資源 | 部署完整應用 |
| <strong>思維模式</strong> | 基礎設施導向 | 應用導向 |
| <strong>範例</strong> | `az webapp create --name myapp...` | `azd up` |
| <strong>學習曲線</strong> | 需熟悉 Azure 服務 | 只需了解你的應用 |
| <strong>適用對象</strong> | DevOps、基礎架構 | 開發者、概念驗證 |

### 簡單比喻

- **Azure CLI** 就像擁有建房子的所有工具——錘子、鋸子、釘子。你可以建造任何東西，但你得懂建築。
- **Azure Developer CLI** 就像找承包商——你說你想要什麼，他們負責蓋房子。

### 何時使用哪個？

| 場景 | 使用工具 |
|----------|----------|
| 「我想快速部署網頁應用」 | `azd up` |
| 「我只要建立一個儲存帳戶」 | `az storage account create` |
| 「我要建造完整 AI 應用」 | `azd init --template azure-search-openai-demo` |
| 「我要偵錯特定 Azure 資源」 | `az resource show` |
| 「我要數分鐘內生產級部署」 | `azd up --environment production` |

### 它們可以一起用！

AZD 底層使用 Azure CLI，你也可以同時用兩者：
```bash
# 使用 AZD 部署你的應用程式
azd up

# 然後使用 Azure CLI 微調特定資源
az webapp config set --name myapp --always-on true
```

---

## 🌟 在 Awesome AZD 找範本

不要從零開始！**Awesome AZD** 是社群收集的即用範本集合：

| 資源 | 說明 |
|----------|-------------|
| 🔗 [**Awesome AZD 展示館**](https://azure.github.io/awesome-azd/) | 瀏覽 200+ 範本，一鍵部署 |
| 🔗 [<strong>提交範本</strong>](https://github.com/Azure/awesome-azd/issues) | 將你的範本貢獻給社群 |
| 🔗 [**GitHub 儲存庫**](https://github.com/Azure/awesome-azd) | 標星並探索原始碼 |

### 來自 Awesome AZD 的熱門 AI 範本

```bash
# RAG 聊天，使用 Microsoft Foundry 模型 + AI 搜尋
azd init --template azure-search-openai-demo

# 快速 AI 聊天應用程式
azd init --template openai-chat-app-quickstart

# 使用 Foundry Agents 的 AI 代理
azd init --template get-started-with-ai-agents
```

---

## 🎯 3 步驟快速入門

開始之前，請先確保你的機器符合你想部署範本的需求：

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

若任何檢查失敗，請先修正問題，再繼續快速開始。

### 第 1 步：安裝 AZD（2 分鐘）

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

### 第 2 步：AZD 驗證身分

```bash
# 如果你打算在本課程中直接使用 Azure CLI 指令，則為可選。
az login

# 為 AZD 工作流程所需。
azd auth login
```

如果不確定該使用哪種驗證，請參考 [安裝與設置](docs/chapter-01-foundation/installation.md#authentication-setup) 中的完整設定流程。

### 第 3 步：部署你的第一個應用

```bash
# 從範本初始化
azd init --template todo-nodejs-mongo

# 部署到 Azure（會建立所有資源！）
azd up
```

**🎉 完成！** 你的應用現在已在 Azure 上線。

### 清理（別忘了！）

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 課程使用說明

本課程設計為<strong>漸進式學習</strong> —— 從你熟悉的地方開始，逐步進階：

| 你的經驗 | 從這裡開始 |
|-----------------|------------|
| **Azure 新手** | [第 1 章：基礎](#-chapter-1-foundation--quick-start) |
| **熟悉 Azure，新手 AZD** | [第 1 章：基礎](#-chapter-1-foundation--quick-start) |
| **想部署 AI 應用** | [第 2 章：AI 優先開發](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| <strong>想動手實作</strong> | [🎓 互動工作坊](workshop/README.md) - 3-4 小時引導實驗室 |
| <strong>需要生產實務模式</strong> | [第 8 章：生產與企業模式](#-chapter-8-production--enterprise-patterns) |

### 快速設置

1. **Fork 此倉庫**：[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. <strong>克隆它</strong>：`git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. <strong>尋求協助</strong>：[Azure Discord 社群](https://discord.com/invite/ByRwuEEgH4)

> **喜歡本地複製？**

> 本存儲庫包含超過 50 種語言的翻譯，這會大幅增加下載大小。若想不帶翻譯複製，請使用稀疏檢出：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 這樣能給你所需的一切以完成課程，且下載速度更快。

## 課程總覽

透過設計良好的章節，循序漸進地掌握 Azure Developer CLI (azd)。**特別著重 Microsoft Foundry 整合與 AI 應用部署。**
### 為何本課程對現代開發者至關重要

根據 Microsoft Foundry Discord 社群見解，有 **45% 的開發者想使用 AZD 進行 AI 工作負載**，但會遇到以下挑戰：
- 複雜的多服務 AI 架構
- 生產 AI 部署最佳實踐  
- Azure AI 服務整合與配置
- AI 工作負載成本優化
- AI 專屬部署問題排除

### 學習目標

完成此結構化課程後，您將能：
- **精通 AZD 基礎**：核心概念、安裝與配置
- **部署 AI 應用程式**：利用 AZD 搭配 Microsoft Foundry 服務
- <strong>實作基礎設施即程式碼</strong>：使用 Bicep 範本管理 Azure 資源
- <strong>故障排除部署問題</strong>：解決常見問題與偵錯
- <strong>優化生產環境</strong>：安全性、擴展、監控及成本管理
- <strong>建置多代理解決方案</strong>：部署複雜 AI 架構

## 開始前：帳戶、存取權限與假設

開始第 1 章前，請確保您已具備以下條件。本指南後續的安裝步驟假設這些基礎已準備就緒。

- **Azure 訂閱**：您可使用現有的工作或個人訂閱，或建立[免費試用](https://aka.ms/azurefreetrial)開始使用。
- **建立 Azure 資源的權限**：在大部分練習中，您需要至少有目標訂閱或資源群組的 **Contributor** 權限。有些章節也假設您能建立資源群組、受控身份與 RBAC 指派。
- [**GitHub 帳戶**](https://github.com)：方便 fork 程式庫、追蹤您的變更，以及使用 GitHub Codespaces 進行工作坊。
- <strong>範本執行時前置條件</strong>：某些範本需要本機工具如 Node.js、Python、Java 或 Docker。請在開始前執行設置驗證工具，以早期發現缺少的工具。
- <strong>基本終端機熟悉度</strong>：不需成為專家，但應能熟練使用 `git clone`、`azd auth login` 及 `azd up` 等指令。

> **在企業訂閱中工作？**  
> 若您的 Azure 環境由管理員管理，事先確認您能在預定的訂閱或資源群組中部署資源。若無，請事先申請沙盒訂閱或 Contributor 權限。

> **剛接觸 Azure？**  
> 請先從您的 Azure 試用或即用即付訂閱開始：https://aka.ms/azurefreetrial，以便完整完成所有練習，而無需等待租戶層級的批准。

## 🗺️ 課程地圖：章節快速導覽

每個章節皆有專屬 README，包含學習目標、快速開始與練習：

| 章節 | 主題 | 課程 | 時長 | 難度 |
|---------|-------|---------|----------|------------|
| **[第1章：基礎](docs/chapter-01-foundation/README.md)** | 入門 | [AZD 基礎](docs/chapter-01-foundation/azd-basics.md) &#124; [安裝](docs/chapter-01-foundation/installation.md) &#124; [第一個專案](docs/chapter-01-foundation/first-project.md) | 30-45 分鐘 | ⭐ |
| **[第2章：AI 開發](docs/chapter-02-ai-development/README.md)** | AI 為先的應用 | [Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI 代理](docs/chapter-02-ai-development/agents.md) &#124; [模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [工作坊](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 小時 | ⭐⭐ |
| **[第3章：配置](docs/chapter-03-configuration/README.md)** | 認證與安全 | [配置](docs/chapter-03-configuration/configuration.md) &#124; [認證與安全](docs/chapter-03-configuration/authsecurity.md) | 45-60 分鐘 | ⭐⭐ |
| **[第4章：基礎設施](docs/chapter-04-infrastructure/README.md)** | 基礎設施即代碼與部署 | [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [佈建](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 小時 | ⭐⭐⭐ |
| **[第5章：多代理](docs/chapter-05-multi-agent/README.md)** | AI 代理解決方案 | [零售場景](examples/retail-scenario.md) &#124; [協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 小時 | ⭐⭐⭐⭐ |
| **[第6章：部署前](docs/chapter-06-pre-deployment/README.md)** | 規劃與驗證 | [啟動檢查](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [應用洞察](docs/chapter-06-pre-deployment/application-insights.md) | 1 小時 | ⭐⭐ |
| **[第7章：故障排除](docs/chapter-07-troubleshooting/README.md)** | 偵錯與修復 | [常見問題](docs/chapter-07-troubleshooting/common-issues.md) &#124; [偵錯](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI 問題排除](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 小時 | ⭐⭐ |
| **[第8章：生產環境](docs/chapter-08-production/README.md)** | 企業模式 | [生產實踐](docs/chapter-08-production/production-ai-practices.md) | 2-3 小時 | ⭐⭐⭐⭐ |
| **[🎓 工作坊](workshop/README.md)** | 實作實驗室 | [介紹](workshop/docs/instructions/0-Introduction.md) &#124; [選擇](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [驗證](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [拆解](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [配置](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [自訂](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [拆除](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [總結](workshop/docs/instructions/7-Wrap-up.md) | 3-4 小時 | ⭐⭐ |

**總課程時長:** 約 10-14 小時 | **技能進階:** 初學者 → 生產就緒

---

## 📚 學習章節

<em>依據經驗與目標選擇您的學習路線</em>

### 🚀 第 1 章：基礎與快速開始  
<strong>先決條件</strong>：Azure 訂閱，基本命令列知識  
<strong>時長</strong>：30-45 分鐘  
<strong>難度</strong>：⭐

#### 您將學會
- 理解 Azure Developer CLI 基礎
- 在您的平台安裝 AZD
- 完成您的第一次成功部署

#### 學習資源
- **🎯 從此開始**：[什麼是 Azure Developer CLI？](#what-is-azure-developer-cli)
- **📖 理論**：[AZD 基礎](docs/chapter-01-foundation/azd-basics.md) - 核心概念與術語
- **⚙️ 設置**：[安裝與設定](docs/chapter-01-foundation/installation.md) - 平台特定指南
- **🛠️ 實作**：[第一個專案](docs/chapter-01-foundation/first-project.md) - 逐步教學
- **📋 快速參考**：[指令速查表](resources/cheat-sheet.md)

#### 實作練習
```bash
# 快速安裝檢查
azd version

# 部署您的第一個應用程式
azd init --template todo-nodejs-mongo
azd up
```
  
**💡 章節成果**：使用 AZD 成功部署簡單的網頁應用程式至 Azure

**✅ 成功驗證：**  
```bash
# 完成第一章後，你應該能夠：
azd version              # 顯示已安裝的版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署至 Azure
azd show                # 顯示運行中應用程式的網址
# 應用程式在瀏覽器中打開並運作
azd down --force --purge  # 清理資源
```
  
**📊 所需時間：** 30-45 分鐘  
**📈 技能等級:** 能獨立部署基本應用程式

---

### 🤖 第 2 章：AI 為先開發（推薦 AI 開發者）  
<strong>先決條件</strong>：完成第 1 章  
<strong>時長</strong>：1-2 小時  
<strong>難度</strong>：⭐⭐

#### 您將學會
- Microsoft Foundry 與 AZD 整合
- 部署 AI 驅動應用程式
- 理解 AI 服務配置方法

#### 學習資源
- **🎯 從此開始**：[Microsoft Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI 代理**：[AI 代理指南](docs/chapter-02-ai-development/agents.md) - 使用 AZD 部署智能代理
- **📖 模式**：[AI 模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) - 部署與管理 AI 模型
- **🛠️ 工作坊**：[AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - 讓 AI 解決方案符合 AZD 標準
- **🎥 互動指南**：[工作坊材料](workshop/README.md) - 使用 MkDocs * DevContainer 瀏覽器學習環境
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
  
**💡 章節成果**：部署並配置具備 RAG 功能的 AI 聊天應用程式

**✅ 成功驗證：**  
```bash
# 完成第2章後，你應該能夠：
azd init --template azure-search-openai-demo
azd up
# 測試AI聊天介面
# 提問並取得帶有來源的AI回應
# 驗證搜尋整合功能是否正常運作
azd monitor  # 檢查Application Insights是否顯示遙測資料
azd down --force --purge
```
  
**📊 所需時間：** 1-2 小時  
**📈 技能等級:** 能部署及配置生產就緒的 AI 應用程式  
**💰 成本認知:** 了解開發約 $80-150/月，生產環境約 $300-3500/月的成本範圍

#### 💰 AI 部署成本考量

**開發環境（預估 $80-150/月）：**  
- Microsoft Foundry 模型（即用即付）：$0-50/月（依標記用量）  
- AI 搜尋（基礎層）：$75/月  
- Container Apps（消耗層）：$0-20/月  
- 儲存空間（標準）：$1-5/月  

**生產環境（預估 $300-3,500+/月）：**  
- Microsoft Foundry 模型（PTU 確保穩定性能）：$3,000+/月 或 大量即用即付  
- AI 搜尋（標準層）：$250/月  
- Container Apps（專用層）：$50-100/月  
- 應用洞察：$5-50/月  
- 儲存空間（高階）：$10-50/月  

**💡 成本優化建議：**  
- 使用 <strong>免費階層</strong> Microsoft Foundry 模型學習（Azure OpenAI 含 50,000 標記/月）  
- 不開發時執行 `azd down` 停用資源  
- 初期採消耗基礎付費，只於生產環境升級 PTU  
- 部署前執行 `azd provision --preview` 預估成本  
- 啟用自動擴展，只為實際使用付費  

**成本監控：**  
```bash
# 檢查預計每月費用
azd provision --preview

# 在 Azure 入口網站監控實際費用
az consumption budget list --resource-group <your-rg>
```
  
---

### ⚙️ 第 3 章：配置與認證  
<strong>先決條件</strong>：完成第 1 章  
<strong>時長</strong>：45-60 分鐘  
<strong>難度</strong>：⭐⭐

#### 您將學會
- 環境配置及管理
- 認證及安全最佳實踐
- 資源命名與組織

#### 學習資源
- **📖 配置**：[配置指南](docs/chapter-03-configuration/configuration.md) - 環境設置
- **🔐 安全**：[認證模式與受控身份](docs/chapter-03-configuration/authsecurity.md) - 認證模式詳解
- **📝 範例**：[資料庫應用範例](examples/database-app/README.md) - AZD 資料庫範例

#### 實作練習
- 配置多環境（開發、預備、正式）
- 設定受控身份認證
- 實作環境專屬配置

**💡 章節成果**：能妥善管理多個環境，並確保認證與安全到位

---

### 🏗️ 第 4 章：基礎設施即代碼與部署  
<strong>先決條件</strong>：完成第 1-3 章  
<strong>時長</strong>：1-1.5 小時  
<strong>難度</strong>：⭐⭐⭐

#### 您將學會
- 進階部署模式
- 使用 Bicep 進行基礎設施即代碼
- 資源佈建策略

#### 學習資源
- **📖 部署**：[部署指南](docs/chapter-04-infrastructure/deployment-guide.md) - 完整工作流程
- **🏗️ 佈建**：[資源佈建](docs/chapter-04-infrastructure/provisioning.md) - Azure 資源管理
- **📝 範例**：[Container App 範例](../../examples/container-app) - 容器化部署

#### 實作練習
- 建立自訂 Bicep 範本
- 部署多服務應用程式
- 實作藍綠部署策略

**💡 章節成果**：利用自訂基礎設施範本成功部署複雜多服務應用程式

---
### 🎯 第5章：多智能體 AI 解決方案（進階）
<strong>先決條件</strong>：完成第1-2章  
<strong>時長</strong>：2-3小時  
<strong>難度</strong>：⭐⭐⭐⭐

#### 你將學到
- 多智能體架構模式
- 智能體編排與協調
- 生產環境就緒的 AI 部署

#### 學習資源
- **🤖 精選專案**：[零售多智能體解決方案](examples/retail-scenario.md) - 完整實作
- **🛠️ ARM 模板**：[ARM 模板套件](../../examples/retail-multiagent-arm-template) - 一鍵部署
- **📖 架構**：[多智能體協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) - 模式

#### 實務演練
```bash
# 部署完整的零售多代理方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索代理配置
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 本章成果**：部署並管理生產環境就緒的多智能體 AI 解決方案，包含客戶與庫存智能體

---

### 🔍 第6章：預部署驗證與規劃
<strong>先決條件</strong>：完成第4章  
<strong>時長</strong>：1小時  
<strong>難度</strong>：⭐⭐

#### 你將學到
- 容量規劃與資源驗證
- SKU 選擇策略
- 預部署檢查與自動化

#### 學習資源
- **📊 規劃**：[容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) - 資源驗證
- **💰 選擇**：[SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) - 成本效益抉擇
- **✅ 驗證**：[預部署檢查](docs/chapter-06-pre-deployment/preflight-checks.md) - 自動化腳本

#### 實務演練
- 執行容量驗證腳本
- 優化 SKU 選擇以降低成本
- 實作自動化預部署檢查

**💡 本章成果**：驗證並優化部署方案以利執行前提

---

### 🚨 第7章：疑難排解與除錯
<strong>先決條件</strong>：完成任一部署章節  
<strong>時長</strong>：1-1.5小時  
<strong>難度</strong>：⭐⭐

#### 你將學到
- 系統性除錯方法
- 常見問題與解決方案
- AI 專屬疑難排解

#### 學習資源
- **🔧 常見問題**：[常見問題](docs/chapter-07-troubleshooting/common-issues.md) - FAQ 與解決方案
- **🕵️ 除錯指引**：[除錯指南](docs/chapter-07-troubleshooting/debugging.md) - 分步策略
- **🤖 AI 問題**：[AI 專屬疑難排解](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI 服務問題

#### 實務演練
- 診斷部署失敗原因
- 解決身分驗證問題
- 除錯 AI 服務連接問題

**💡 本章成果**：能獨立診斷及解決常見部署問題

---

### 🏢 第8章：生產及企業級模式
<strong>先決條件</strong>：完成第1-4章  
<strong>時長</strong>：2-3小時  
<strong>難度</strong>：⭐⭐⭐⭐

#### 你將學到
- 生產環境部署策略
- 企業安全模式
- 監控與成本優化

#### 學習資源
- **🏭 生產**：[生產環境 AI 最佳實踐](docs/chapter-08-production/production-ai-practices.md) - 企業級模式
- **📝 範例**：[微服務範例](../../examples/microservices) - 複雜架構
- **📊 監控**：[Application Insights 整合](docs/chapter-06-pre-deployment/application-insights.md) - 監控

#### 實務演練
- 實作企業安全模式
- 建立全面監控系統
- 以適當治理部署生產環境

**💡 本章成果**：部署具備完整生產能力的企業級應用程式

---

## 🎓 工作坊概覽：實作學習體驗

> **⚠️ 工作坊狀態：積極開發中**  
> 工作坊教材正持續開發與優化中，核心模組已具功能，但部分進階章節尚未完成。我們正積極補全所有內容。 [追蹤進度 →](workshop/README.md)

### 互動式工作坊教材
**完整的實作學習，使用瀏覽器工具與引導式練習**

我們的工作坊教材提供結構化、互動式學習體驗，搭配上述章節課程。適合自學與教師帶領課堂。

#### 🛠️ 工作坊特色
- <strong>瀏覽器介面</strong>：完整 MkDocs 支援，具備搜尋、複製與主題切換
- **GitHub Codespaces 整合**：一鍵設置開發環境
- <strong>結構化學習路徑</strong>：8 模組引導練習（總時長 3-4 小時）
- <strong>漸進式方法論</strong>：介紹 → 選擇 → 驗證 → 解構 → 配置 → 自訂 → 清理 → 總結
- **互動式 DevContainer 環境**：預先配置工具與依賴

#### 📚 工作坊模組架構
工作坊採用<strong>8 模組漸進式方法論</strong>，從探索到部署精通：

| 模組 | 主題 | 操作內容 | 時長 |
|--------|-------|---------|---------|
| **0. 介紹** | 工作坊概覽 | 了解學習目標、先決條件及工作坊架構 | 15 分鐘 |
| **1. 選擇** | 模板探索 | 探索 AZD 模板並選擇適合 AI 範例 | 20 分鐘 |
| **2. 驗證** | 部署與驗證 | 使用 `azd up` 部署模板並驗證基礎架構 | 30 分鐘 |
| **3. 解構** | 理解結構 | 使用 GitHub Copilot 探索模板架構、Bicep 檔及程式碼 | 30 分鐘 |
| **4. 配置** | azure.yaml 深入 | 精通 `azure.yaml` 配置、生命週期掛鉤及環境變數 | 30 分鐘 |
| **5. 自訂** | 專屬調整 | 啟用 AI 搜尋、追蹤、評估並為場景客製化 | 45 分鐘 |
| **6. 清理** | 移除資源 | 使用 `azd down --purge` 安全移除資源 | 15 分鐘 |
| **7. 總結** | 下一步 | 檢視成就、核心概念，持續學習旅程 | 15 分鐘 |

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
# 在倉庫中點擊「Code」→「在 main 上建立 codespace」

# 選項 2：本地開發
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 按照 workshop/README.md 中的設置說明操作
```
  
#### 🎯 工作坊學習成果  
完成工作坊後，參加者將能：
- **部署生產環境 AI 應用**：使用 AZD 搭配 Microsoft Foundry 服務
- <strong>精通多智能體架構</strong>：實作協同 AI 智能體解決方案
- <strong>執行安全最佳實踐</strong>：設定認證與存取控制
- <strong>優化擴展效能</strong>：設計成本效益且具效能的部署方案
- <strong>疑難排解部署問題</strong>：獨立解決常見問題

#### 📖 工作坊資源
- **🎥 互動指南**：[工作坊教材](workshop/README.md) - 瀏覽器學習環境
- **📋 模組指引**：
  - [0. 介紹](workshop/docs/instructions/0-Introduction.md) - 工作坊概覽與目標
  - [1. 選擇](workshop/docs/instructions/1-Select-AI-Template.md) - 尋找並選擇 AI 模板
  - [2. 驗證](workshop/docs/instructions/2-Validate-AI-Template.md) - 部署並驗證模板
  - [3. 解構](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - 探索模板架構
  - [4. 配置](workshop/docs/instructions/4-Configure-AI-Template.md) - 精通 azure.yaml
  - [5. 自訂](workshop/docs/instructions/5-Customize-AI-Template.md) - 依場景客製化
  - [6. 清理](workshop/docs/instructions/6-Teardown-Infrastructure.md) - 清理資源
  - [7. 總結](workshop/docs/instructions/7-Wrap-up.md) - 檢視與後續步驟
- **🛠️ AI 工作坊實驗室**：[AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI 專屬練習
- **💡 快速入門**：[工作坊設定指南](workshop/README.md#quick-start) - 環境配置

<strong>適合對象</strong>：企業培訓、大學課程、自學及開發者訓練營。

---

## 📖 深度解析：AZD 功能

除了基礎功能，AZD 提供強大生產部署功能：

- <strong>模板式部署</strong> - 使用預建模板涵蓋常見應用模式
- <strong>基礎架構即程式碼</strong> - 以 Bicep 或 Terraform 管理 Azure 資源  
- <strong>整合工作流程</strong> - 無縫提供、部署與監控應用
- <strong>開發者友善</strong> - 優化開發者生產力及使用體驗

### **AZD + Microsoft Foundry：AI 部署最佳組合**

**為什麼選擇 AZD AI 解決方案？** AZD 解決 AI 開發者面臨的主要挑戰：

- **AI 就緒模板** - 預配置 Microsoft Foundry 模型、Azure AI 服務及 ML 工作負載模板
- **安全 AI 部署** - 內建 AI 服務、API 金鑰及模型端點安全模式  
- **生產環境 AI 模式** - 可擴展且具成本效益的 AI 應用最佳實踐
- **端對端 AI 工作流程** - 從模型開發到生產部署與監控一氣呵成
- <strong>成本優化</strong> - 智慧資源分配與 AI 工作負載擴展策略
- **Microsoft Foundry 整合** - 無縫連接 Microsoft Foundry 模型目錄及端點

---

## 🎯 模板與範例庫

### 精選：Microsoft Foundry 模板
**如果你要部署 AI 應用，從這邊開始！**

> **註：** 這些模板展現多種 AI 模式。有些為外部 Azure 範例，部分為本地實作。

| 模板 | 章節 | 難度 | 服務 | 類型 |
|----------|---------|------------|----------|------|
| [**入門 AI 聊天**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | 外部 |
| [**入門 AI 智能體**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第2章 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| 外部 |
| [**Azure Search + OpenAI 範例**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | 外部 |
| [**OpenAI 聊天應用快速入門**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | 外部 |
| [<strong>零售多智能體解決方案</strong>](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | <strong>本地</strong> |

### 精選：完整學習場景
<strong>生產就緒應用模板對應學習章節</strong>

| 模板 | 學習章節 | 難度 | 主要學習 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | 基礎 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | 結合 Azure AI Search 的 RAG 實作 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第4章 | ⭐⭐ | 文件智能整合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | 智能體框架與函式呼叫 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐ | 企業級 AI 編排 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | 多智能體架構，含客戶及庫存智能體 |

### 依範例類型學習

> **📌 本地與外部範例說明：**  
> <strong>本地範例</strong>（本倉庫）= 直接使用  
> <strong>外部範例</strong>（Azure Samples）= 從連結的倉庫克隆下載

#### 本地範例（可立即使用）
- [<strong>零售多智能體解決方案</strong>](examples/retail-scenario.md) - 完整生產就緒實作與 ARM 模板
  - 多智能體架構（客戶 + 庫存智能體）
  - 全面監控與評估
  - 一鍵透過 ARM 模板部署

#### 本地範例 - 容器應用（第2-5章）
**本倉庫提供完整容器部署範例：**
- [**Container App 範例**](examples/container-app/README.md) - 容器化部署完整指南
  - [簡單 Flask API](../../examples/container-app/simple-flask-api) - 基本 REST API，支援 scale-to-zero
  - [微服務架構](../../examples/container-app/microservices) - 生產環境的多服務部署
  - 快速入門、生產及進階部署模式
  - 監控、安全及成本優化指導

#### 外部範例 - 簡單應用程式（章節 1-2）
**請 clone 這些 Azure 範例倉庫開始：**
- [簡單網頁應用程式 - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本部署模式
- [靜態網站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 靜態內容部署
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署

#### 外部範例 - 資料庫整合（章節 3-4）  
- [資料庫應用 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 資料庫連線模式
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 無伺服器資料工作流程

#### 外部範例 - 進階模式（章節 4-8）
- [Java 微服務](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服務架構
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - 背景處理  
- [企業機器學習管線](https://github.com/Azure-Samples/mlops-v2) - 生產環境機器學習模式

### 外部範本集合
- [**官方 AZD 範本館**](https://azure.github.io/awesome-azd/) - 精選官方與社群範本集合
- [**Azure Developer CLI 範本**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - 微軟學習範本文件
- [<strong>範例資料夾</strong>](examples/README.md) - 本地學習範例與詳細解說

---

## 📚 學習資源與參考

### 快速參考
- [<strong>指令速查表</strong>](resources/cheat-sheet.md) - 按章節整理的關鍵 azd 指令
- [<strong>詞彙表</strong>](resources/glossary.md) - Azure 和 azd 術語  
- [<strong>常見問題</strong>](resources/faq.md) - 按學習章節整理的常見問題
- [<strong>學習指南</strong>](resources/study-guide.md) - 全面練習題目

### 實作工作坊
- [**AI 工作坊實驗室**](docs/chapter-02-ai-development/ai-workshop-lab.md) - 讓你的 AI 解決方案支援 AZD 部署（2-3 小時）
- [<strong>互動式工作坊</strong>](workshop/README.md) - 8 個模組引導教學，搭配 MkDocs 與 GitHub Codespaces
  - 流程：介紹 → 選擇 → 驗證 → 分析 → 配置 → 自訂 → 拆除 → 總結

### 外部學習資源
- [Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 價格計算器](https://azure.microsoft.com/pricing/calculator/)
- [Azure 狀態](https://status.azure.com/)

### 給你的編輯器的 AI 代理技能
- [**Microsoft Azure Skills 於 skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 種 Azure AI、Foundry、部署、診斷、成本優化等開放代理技能。可安裝於 GitHub Copilot、Cursor、Claude Code 或其他支援代理：
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 快速故障排除指南

**初學者常見問題與即時解決方法：**

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
<summary><strong>❌ "No subscription found" 或 "Subscription not set"</strong></summary>

```bash
# 列出可用的訂閱
az account list --output table

# 設定默認的訂閱
az account set --subscription "<subscription-id-or-name>"

# 設定 AZD 環境
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

# 選項 4：在 Azure 監控中檢查日誌
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" 或 "Token expired"</strong></summary>

```bash
# 重新驗證以登入 AZD
azd auth logout
azd auth login

# 可選：如果你使用 az 命令，亦可刷新 Azure CLI
az logout
az login

# 驗證身份認證
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" 或命名衝突</strong></summary>

```bash
# AZD 會產生獨特名稱，但如果發生衝突：
azd down --force --purge

# 則會以新的環境重新嘗試
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 範本部署過久</strong></summary>

**正常等待時間：**
- 簡單網頁應用程式：5-10 分鐘
- 附帶資料庫應用程式：10-15 分鐘
- AI 應用程式：15-25 分鐘（OpenAI 配置較慢）

```bash
# 檢查進度
azd show

# 如果停滯超過30分鐘，檢查Azure門戶：
azd monitor --overview
# 尋找失敗的部署
```
</details>

<details>
<summary><strong>❌ "Permission denied" 或 "Forbidden"</strong></summary>

```bash
# 檢查你的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 你至少需要「貢獻者」角色
# 請你的 Azure 管理員授予：
# - 貢獻者（針對資源）
# - 使用者訪問管理員（針對角色分配）
```
</details>

<details>
<summary><strong>❌ 找不到已部署的應用程式網址</strong></summary>

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
- **偵錯指南：** [逐步偵錯](docs/chapter-07-troubleshooting/debugging.md)
- **取得協助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 課程完成與證書

### 進度追蹤
追蹤你每個章節的學習進度：

- [ ] **第1章**：基礎與快速入門 ✅
- [ ] **第2章**：AI 為先的開發 ✅  
- [ ] **第3章**：設定與驗證 ✅
- [ ] **第4章**：基礎建設即程式碼與部署 ✅
- [ ] **第5章**：多代理 AI 解決方案 ✅
- [ ] **第6章**：部署前驗證與規劃 ✅
- [ ] **第7章**：故障排除與偵錯 ✅
- [ ] **第8章**：生產與企業模式 ✅

### 學習驗證
完成每章節後，確認你的知識：
1. <strong>實作練習</strong>：完成章節的實操部署
2. <strong>知識檢核</strong>：回顧該章 FAQ 部分
3. <strong>社群討論</strong>：分享經驗於 Azure Discord
4. <strong>下一章</strong>：挑戰更高難度章節

### 課程完成好處
完成所有章節後，你將擁有：
- <strong>生產經驗</strong>：成功部署實際 AI 應用至 Azure
- <strong>專業技能</strong>：具備企業級部署能力  
- <strong>社群認可</strong>：成為 Azure 開發者社群積極成員
- <strong>職涯提升</strong>：掌握熱門 AZD 與 AI 部署專長

---

## 🤝 社群與支援

### 取得協助與支援
- <strong>技術問題</strong>：[匯報問題與功能請求](https://github.com/microsoft/azd-for-beginners/issues)
- <strong>學習疑問</strong>：[Microsoft Azure Discord 社群](https://discord.gg/microsoft-azure) 與 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 專屬協助**：加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- <strong>官方文件</strong>：[Azure Developer CLI 官方文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### 從 Microsoft Foundry Discord 社群見解

**#Azure 頻道最新投票結果：**
- **45%** 的開發者想用 AZD 進行 AI 工作負載
- <strong>主要挑戰</strong>：多服務部署、憑證管理、生產環境準備  
- <strong>最常需求</strong>：AI 專用範本、故障排除指導、最佳實踐

**加入社群即可：**
- 分享你的 AZD + AI 經驗並取得協助
- 搶先取得新 AI 範本預覽
- 參與 AI 部署最佳實務貢獻
- 影響未來 AI + AZD 功能開發

### 課程內容貢獻
歡迎您的貢獻！請閱讀我們的 [貢獻指南](CONTRIBUTING.md)，內容涵蓋：
- <strong>內容改進</strong>：提升現有章節與範例
- <strong>新增範例</strong>：加入實務案例與範本  
- <strong>翻譯支援</strong>：維護多語言內容
- <strong>錯誤回報</strong>：提升準確性與清晰度
- <strong>社群規範</strong>：遵守包容性社群指導方針

---

## 📄 課程資訊

### 授權條款
本專案採 MIT 授權 - 詳情請參閱 [LICENSE](../../LICENSE) 檔案。

### 相關 Microsoft 學習資源

我們團隊製作其他全面學習課程：

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j 入門](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js 入門](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain 入門](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD 入門](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI 入門](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP 入門](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents 入門](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### 生成式 AI 系列
[![生成式 AI 入門](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

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
[![AI 配對編程的 Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET 的 Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot 冒險](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ 課程導覽

**🚀 準備好開始學習了嗎？**

<strong>初學者</strong>：從[第1章：基礎與快速入門](#-chapter-1-foundation--quick-start)開始  
**AI 開發者**：跳至[第2章：AI 優先開發](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
<strong>有經驗的開發者</strong>：從[第3章：設定與驗證](#️-chapter-3-configuration--authentication)開始

<strong>下一步</strong>：[開始第1章 - AZD 基礎](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->