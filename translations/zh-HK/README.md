# AZD 初學者入門：有結構的學習旅程

![AZD 初學者入門](../../translated_images/zh-HK/azdbeginners.5527441dd9f74068.webp) 

[![GitHub 觀察者](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub 派生](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub 星標](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 自動翻譯（隨時保持最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[阿拉伯語](../ar/README.md) | [孟加拉語](../bn/README.md) | [保加利亞語](../bg/README.md) | [緬甸語 (Myanmar)](../my/README.md) | [中文（簡體）](../zh-CN/README.md) | [中文（繁體，香港）](./README.md) | [中文（繁體，澳門）](../zh-MO/README.md) | [中文（繁體，台灣）](../zh-TW/README.md) | [克羅地亞語](../hr/README.md) | [捷克語](../cs/README.md) | [丹麥語](../da/README.md) | [荷蘭語](../nl/README.md) | [愛沙尼亞語](../et/README.md) | [芬蘭語](../fi/README.md) | [法語](../fr/README.md) | [德語](../de/README.md) | [希臘語](../el/README.md) | [希伯來語](../he/README.md) | [印地語](../hi/README.md) | [匈牙利語](../hu/README.md) | [印度尼西亞語](../id/README.md) | [義大利語](../it/README.md) | [日語](../ja/README.md) | [卡納達語](../kn/README.md) | [高棉語](../km/README.md) | [韓語](../ko/README.md) | [立陶宛語](../lt/README.md) | [馬來語](../ms/README.md) | [馬拉雅拉姆語](../ml/README.md) | [馬拉地語](../mr/README.md) | [尼泊爾語](../ne/README.md) | [奈及利亞皮欽語](../pcm/README.md) | [挪威語](../no/README.md) | [波斯語（法爾西）](../fa/README.md) | [波蘭語](../pl/README.md) | [葡萄牙語（巴西）](../pt-BR/README.md) | [葡萄牙語（葡萄牙）](../pt-PT/README.md) | [旁遮普語（Gurmukhi）](../pa/README.md) | [羅馬尼亞語](../ro/README.md) | [俄語](../ru/README.md) | [塞爾維亞語（西里爾字母）](../sr/README.md) | [斯洛伐克語](../sk/README.md) | [斯洛文尼亞語](../sl/README.md) | [西班牙語](../es/README.md) | [斯瓦希里語](../sw/README.md) | [瑞典語](../sv/README.md) | [他加祿語（菲律賓語）](../tl/README.md) | [泰米爾語](../ta/README.md) | [泰盧固語](../te/README.md) | [泰語](../th/README.md) | [土耳其語](../tr/README.md) | [烏克蘭語](../uk/README.md) | [烏都語](../ur/README.md) | [越南語](../vi/README.md)

> **想要本機複製倉庫？**
>
> 此儲存庫包含 50+ 種語言的翻譯檔，會顯著增加下載大小。若要在不下載翻譯的情況下複製，請使用稀疏簽出（sparse checkout）：
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
> 這樣可以讓你以更快的下載速度取得完成課程所需的所有內容。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 今天 azd 有什麼新功能

Azure Developer CLI 已經超越傳統的 Web 應用與 API。如今，azd 是部署各類應用至 Azure 的單一工具 —— 包括以 AI 驅動的應用與智慧代理。

這對你的意義如下：

- **AI 代理現在是 azd 的一級工作負載。** 你可以使用熟悉的 `azd init` → `azd up` 工作流程來初始化、部署和管理 AI 代理專案。
- **Microsoft Foundry 整合** 將模型部署、代理託管和 AI 服務設定直接納入 azd 範本生態系統。
- **核心工作流程沒有改變。** 無論你部署的是待辦清單應用、微服務或多代理 AI 解決方案，指令都是一樣的。

如果你以前用過 azd，AI 支援是自然延伸，而不是另一個工具或進階心得。如果你是第一次接觸，你會學會一套適用於所有情境的工作流程。

---

## 🚀 什麼是 Azure Developer CLI (azd)？

**Azure Developer CLI (azd)** 是一個對開發者友好的命令列工具，使部署應用到 Azure 更為簡單。你可以不用手動建立和串接數十個 Azure 資源，只需一個指令就能部署整個應用程式。

### `azd up` 的魔力

```bash
# 呢條單一指令完成所有工作：
# ✅ 建立所有 Azure 資源
# ✅ 配置網絡及安全性
# ✅ 建構你的應用程式代碼
# ✅ 部署到 Azure
# ✅ 提供你可用嘅 URL
azd up
```

**就這樣！** 不需要點擊 Azure 入口網站，不需要先學習複雜的 ARM 範本，也不需要手動設定 —— 只要把應用程式部署到 Azure 上運行。

---

## ❓ Azure Developer CLI 與 Azure CLI：有什麼不同？

這是初學者最常問的問題。簡單回答如下：

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| <strong>目的</strong> | 管理單一 Azure 資源 | 部署完整應用程式 |
| <strong>思維模式</strong> | 基礎設施為主 | 應用程式為主 |
| <strong>範例</strong> | `az webapp create --name myapp...` | `azd up` |
| <strong>學習曲線</strong> | 需了解 Azure 各項服務 | 只要了解你的應用程式 |
| <strong>適合對象</strong> | DevOps、基礎設施工程師 | 開發者、原型設計 |

### 簡單類比

- **Azure CLI** 就像擁有建房子的所有工具 —— 錘子、鋸子、釘子。你可以建任何東西，但你得懂施工。
- **Azure Developer CLI** 就像請了承包商 —— 你描述想要的，他們處理建造。

### 何時使用哪一個

| 情境 | 使用這個 |
|----------|----------|
| 「我想快速部署我的 web 應用」 | `azd up` |
| 「我只需要建立一個儲存帳號」 | `az storage account create` |
| 「我要建立完整的 AI 應用」 | `azd init --template azure-search-openai-demo` |
| 「我需要除錯特定的 Azure 資源」 | `az resource show` |
| 「我想在幾分鐘內完成生產就緒的部署」 | `azd up --environment production` |

### 它們可以一起使用！

AZD 在底層使用 Azure CLI。你可以同時使用兩者：
```bash
# 使用 AZD 部署你的應用程式
azd up

# 然後使用 Azure CLI 微調特定資源
az webapp config set --name myapp --always-on true
```

---

## 🌟 在 Awesome AZD 找到範本

不用從零開始！**Awesome AZD** 是社群彙整的即用型範本集：

| 資源 | 說明 |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | 瀏覽 200+ 範本並一鍵部署 |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | 向社群貢獻你的範本 |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | 按星號並探索原始碼 |

### Awesome AZD 熱門的 AI 範本

```bash
# 與 Microsoft Foundry 模型 + AI 搜尋的 RAG 聊天
azd init --template azure-search-openai-demo

# 快速 AI 聊天應用程式
azd init --template openai-chat-app-quickstart

# 使用 Foundry 代理的 AI 代理
azd init --template get-started-with-ai-agents
```

---

## 🎯 以 3 個步驟快速開始

開始之前，請確保你的機器已為你想部署的範本做好準備：

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

如果任何必要檢查未通過，請先修正再繼續快速開始流程。

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

### 第 2 步：為 AZD 驗證身分

```bash
# 如果您計劃在本課程中直接使用 Azure CLI 命令，則此項為可選
az login

# 對於 AZD 工作流程是必需的
azd auth login
```

如果你不確定需要哪一個驗證方式，請依照 [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup) 中的完整設定流程。

### 第 3 步：部署你的第一個應用程式

```bash
# 從範本初始化
azd init --template todo-nodejs-mongo

# 部署到 Azure（會建立所有東西！）
azd up
```

**🎉 就完成了！** 你的應用程式現在已在 Azure 上線。

### 清理（別忘了！）

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 如何使用本課程

本課程以「漸進式學習」設計 —— 從你熟悉的地方開始，逐步往上學習：

| 你的經驗 | 從這裡開始 |
|-----------------|------------|
| **完全沒接觸過 Azure** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **懂 Azure，但不熟 AZD** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **想部署 AI 應用** | [Chapter 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| <strong>想要實作練習</strong> | [🎓 Interactive Workshop](workshop/README.md) - 3-4 小時的實作實驗 |
| <strong>需要生產級範式</strong> | [Chapter 8: Production & Enterprise](#-chapter-8-production--enterprise-patterns) |

### 快速設定

1. **派生此儲存庫（Fork）**: [![GitHub 派生](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. <strong>複製此儲存庫</strong>: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. <strong>尋求幫助</strong>: [Azure Discord 社群](https://discord.com/invite/ByRwuEEgH4)

> **想要本機複製倉庫？**
>
> 此儲存庫包含 50+ 種語言的翻譯檔，會顯著增加下載大小。若要在不下載翻譯的情況下複製，請使用稀疏簽出（sparse checkout）：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 這樣可以讓你以更快的下載速度取得完成課程所需的所有內容。


## 課程概覽

透過有結構的章節掌握 Azure Developer CLI (azd)，課程設計為漸進式學習。**特別強調 Microsoft Foundry 整合下的 AI 應用部署。**

### 為什麼這門課對現代開發者至關重要

根據 Microsoft Foundry Discord 社群的洞察，**45% 的開發者想使用 AZD 來處理 AI 工作負載**，但會遇到以下挑戰：
- 複雜的多服務 AI 架構
- 生產環境 AI 部署的最佳實踐  
- Azure AI 服務的整合與設定
- AI 工作負載的成本優化
- 排查 AI 特有的部署問題

### 學習目標

完成本結構化課程後，你將能：
- **掌握 AZD 基礎**：核心概念、安裝與設定
- **部署 AI 應用**：使用 AZD 與 Microsoft Foundry 服務
- <strong>實現基礎設施即程式碼</strong>：使用 Bicep 範本管理 Azure 資源
- <strong>排除部署問題</strong>：解決常見問題並進行除錯
- <strong>為生產環境優化</strong>：安全性、擴展性、監控與成本管理
- <strong>構建多代理解決方案</strong>：部署複雜的 AI 架構

## 在開始之前：帳戶、存取與假設

在開始第 1 章之前，請確保你已準備好以下項目。本指南後續的安裝步驟假設這些基礎已經處理完成。
- **Azure 訂閱**：你可以使用公司或你自己的現有訂閱，或建立一個 [free trial](https://aka.ms/azurefreetrial) 開始使用。
- **建立 Azure 資源的權限**：對於大多數練習，你應至少在目標訂閱或資源群組擁有 **Contributor** 存取權。一些章節也可能假設你可以建立資源群組、託管身分識別，以及 RBAC 指派。
- [**一個 GitHub 帳戶**](https://github.com)：這對 fork 儲存庫、追蹤你自己的變更，以及使用 GitHub Codespaces 進行工作坊很有幫助。
- <strong>範本執行環境需求</strong>：某些範本需要本機工具，例如 Node.js、Python、Java 或 Docker。開始之前執行設定驗證工具，以便及早發現缺少的工具。
- <strong>基本終端機使用經驗</strong>：你不需要成為專家，但應該能熟悉執行像 `git clone`、`azd auth login`、和 `azd up` 這類命令。

> **在企業訂閱中工作？**
> 如果你的 Azure 環境由管理員管理，請事先確認你可以在計劃使用的訂閱或資源群組中部署資源。如果不能，請在開始之前申請沙盒訂閱或 Contributor 存取權。

> **剛接觸 Azure？**
> 從你的 Azure 試用或隨用隨付訂閱開始（https://aka.ms/azurefreetrial），這樣你就可以不用等待租戶層級的核准而完成整個練習。

## 🗺️ 課程地圖：按章節快速導航

每個章節都有專屬的 README，包含學習目標、快速入門與練習：

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | 開始上手 | [AZD 基礎](docs/chapter-01-foundation/azd-basics.md) &#124; [安裝與設定](docs/chapter-01-foundation/installation.md) &#124; [你的第一個專案](docs/chapter-01-foundation/first-project.md) | 30-45 分鐘 | ⭐ |
| **[Ch 2: AI Development](docs/chapter-02-ai-development/README.md)** | 以 AI 為先的應用 | [Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI 代理](docs/chapter-02-ai-development/agents.md) &#124; [模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [工作坊](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 小時 | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | 驗證與安全 | [設定](docs/chapter-03-configuration/configuration.md) &#124; [驗證與安全](docs/chapter-03-configuration/authsecurity.md) | 45-60 分鐘 | ⭐⭐ |
| **[Ch 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | 基礎架構即程式碼與部署 | [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [資源部署](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 小時 | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI 代理方案 | [零售情境](examples/retail-scenario.md) &#124; [協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 小時 | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | 規劃與驗證 | [預檢查](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [應用程式洞察](docs/chapter-06-pre-deployment/application-insights.md) | 1 小時 | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | 偵錯與修復 | [常見問題](docs/chapter-07-troubleshooting/common-issues.md) &#124; [除錯](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI 問題](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 小時 | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | 企業模式 | [生產實務](docs/chapter-08-production/production-ai-practices.md) | 2-3 小時 | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | 實作實驗室 | [介紹](workshop/docs/instructions/0-Introduction.md) &#124; [選擇](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [驗證](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [剖析](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [設定](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [自訂](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [拆除](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [總結](workshop/docs/instructions/7-Wrap-up.md) | 3-4 小時 | ⭐⭐ |

**總課程時長：** 約 10-14 小時 | **技能進展：** 初學者 → 生產準備就緒

---

## 📚 學習章節

<em>根據經驗和目標選擇你的學習路徑</em>

### 🚀 第 1 章：基礎與快速起步
<strong>先決條件</strong>: Azure 訂閱，基本指令列知識  
<strong>時長</strong>: 30-45 分鐘  
<strong>複雜度</strong>: ⭐

#### 你會學到
- 了解 Azure Developer CLI 的基本概念
- 在你的平台上安裝 AZD
- 你的第一個成功部署

#### 學習資源
- **🎯 從這裡開始**: [什麼是 Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 理論**: [AZD 基礎](docs/chapter-01-foundation/azd-basics.md) - 核心概念與術語
- **⚙️ 設定**: [安裝與設定](docs/chapter-01-foundation/installation.md) - 平台特定指南
- **🛠️ 實作**: [你的第一個專案](docs/chapter-01-foundation/first-project.md) - 逐步教學
- **📋 快速參考**: [指令速查表](resources/cheat-sheet.md)

#### 實作練習
```bash
# 快速安裝檢查
azd version

# 部署你的第一個應用程式
azd init --template todo-nodejs-mongo
azd up
```

**💡 章節成果**: 成功使用 AZD 將一個簡單的網頁應用程式部署到 Azure

**✅ 成功驗證：**
```bash
# 完成第一章後，你應該能夠：
azd version              # 顯示已安裝的版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署到 Azure
azd show                # 顯示運行中應用程式的 URL
# 應用程式在瀏覽器中開啟並正常運作
azd down --force --purge  # 清理資源
```

**📊 投入時間：** 30-45 分鐘  
**📈 完成後技能等級：** 能獨立部署基本應用程式
**📈 完成後技能等級：** 能獨立部署基本應用程式

---

### 🤖 第 2 章：以 AI 為先的開發（建議 AI 開發者）
<strong>先決條件</strong>: 已完成第 1 章  
<strong>時長</strong>: 1-2 小時  
<strong>複雜度</strong>: ⭐⭐

#### 你會學到
- Microsoft Foundry 與 AZD 的整合
- 部署由 AI 驅動的應用程式
- 了解 AI 服務設定

#### 學習資源
- **🎯 從這裡開始**: [Microsoft Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI 代理**: [AI 代理指南](docs/chapter-02-ai-development/agents.md) - 使用 AZD 部署智能代理
- **📖 模式**: [AI 模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) - 部署與管理 AI 模型
- **🛠️ 工作坊**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - 讓你的 AI 解決方案符合 AZD
- **🎥 互動指南**: [Workshop Materials](workshop/README.md) - 以瀏覽器為基礎的學習，使用 MkDocs * DevContainer Environment
- **📋 範本**: [Microsoft Foundry Templates](#工作坊資源)
- **📝 範例**: [AZD 部署範例](examples/README.md)

#### 實作練習
```bash
# 部署你的第一個 AI 應用程式
azd init --template azure-search-openai-demo
azd up

# 試用更多 AI 範本
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 章節成果**: 部署並設定具有 RAG 功能的 AI 聊天應用程式

**✅ 成功驗證：**
```bash
# 完成第 2 章後，你應該能夠：
azd init --template azure-search-openai-demo
azd up
# 測試 AI 聊天介面
# 提出問題並取得附有來源的 AI 回應
# 驗證搜尋整合是否運作
azd monitor  # 檢查 Application Insights 是否顯示遙測資料
azd down --force --purge
```

**📊 投入時間：** 1-2 小時  
**📈 完成後技能等級：** 能部署並設定可上線的 AI 應用程式  
**💰 成本意識：** 了解開發 $80-150/月，生產 $300-3500/月 的成本

#### 💰 AI 部署的成本考量

**開發環境（估計 $80-150/月）：**
- Microsoft Foundry Models（隨用隨付）：$0-50/月（依 token 使用量）
- AI Search（基本層）：$75/月
- Container Apps（消耗計費）：$0-20/月
- 儲存（標準）：$1-5/月

**生產環境（估計 $300-3,500+/月）：**
- Microsoft Foundry Models（PTU 以確保持續效能）：$3,000+/月 或 高流量下的隨用隨付
- AI Search（標準層）：$250/月
- Container Apps（專屬）：$50-100/月
- Application Insights：$5-50/月
- 儲存（高階）：$10-50/月

**💡 成本優化小提示：**
- 對於學習使用 <strong>免費層</strong> 的 Microsoft Foundry Models（Azure OpenAI 每月含 50,000 tokens）
- 在不主動開發時執行 `azd down` 以解除佔用資源
- 先從消耗型計費開始，僅在生產時升級到 PTU
- 使用 `azd provision --preview` 在部署前估算成本
- 啟用自動調整：只為實際使用付費

**成本監控：**
```bash
# 檢查預計每月費用
azd provision --preview

# 在 Azure 入口網站監察實際費用
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第 3 章：設定與驗證
<strong>先決條件</strong>: 已完成第 1 章  
<strong>時長</strong>: 45-60 分鐘  
<strong>複雜度</strong>: ⭐⭐

#### 你會學到
- 環境設定與管理
- 驗證與安全最佳實務
- 資源命名與組織

#### 學習資源
- **📖 設定**: [設定指南](docs/chapter-03-configuration/configuration.md) - 環境設定
- **🔐 安全**: [驗證模式與託管身分識別](docs/chapter-03-configuration/authsecurity.md) - 驗證模式
- **📝 範例**: [資料庫應用範例](examples/database-app/README.md) - AZD 資料庫範例

#### 實作練習
- 配置多個環境（dev、staging、prod）
- 設定託管身分識別驗證
- 實作環境專屬設定

**💡 章節成果**：以妥善的驗證與安全性管理多個環境

---

### 🏗️ 第 4 章：基礎架構即程式碼與部署
<strong>先決條件</strong>: 已完成第 1-3 章  
<strong>時長</strong>: 1-1.5 小時  
<strong>複雜度</strong>: ⭐⭐⭐

#### 你會學到
- 進階部署模式
- 使用 Bicep 的基礎架構即程式碼
- 資源佈建策略

#### 學習資源
- **📖 部署**: [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) - 完整工作流程
- **🏗️ 佈建**: [資源佈建](docs/chapter-04-infrastructure/provisioning.md) - Azure 資源管理
- **📝 範例**: [容器應用範例](../../examples/container-app) - 容器化部署

#### 實作練習
- 建立自訂 Bicep 範本
- 部署多服務應用程式
- 實作藍綠部署策略

**💡 章節成果**：使用自訂基礎架構範本部署複雜的多服務應用程式

---

### 🎯 第 5 章：多代理 AI 解決方案（進階）
<strong>先決條件</strong>: 已完成第 1-2 章  
<strong>時長</strong>: 2-3 小時  
<strong>複雜度</strong>: ⭐⭐⭐⭐

#### 你會學到
- 多代理架構模式
- 代理編排與協調
- 可投入生產的 AI 部署

#### 學習資源
- **🤖 精選專案**: [零售多代理解決方案](examples/retail-scenario.md) - 完整實作
- **🛠️ ARM 範本**: [ARM 範本套件](../../examples/retail-multiagent-arm-template) - 一鍵部署
- **📖 架構**: [多代理協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) - 模式

#### 實作練習
```bash
# 部署完整的零售多代理解決方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索代理配置
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 章節成果**：部署並管理一個具備客服與庫存代理的可投入生產的多代理 AI 解決方案

---

### 🔍 第 6 章：部署前驗證與規劃
<strong>先決條件</strong>: 已完成第 4 章  
<strong>時長</strong>: 1 小時  
<strong>複雜度</strong>: ⭐⭐
#### 你將會學到
- 容量規劃與資源驗證
- SKU 選擇策略
- 部署前檢查與自動化

#### 學習資源
- **📊 規劃**: [容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) - 資源驗證
- **💰 選擇**: [SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) - 成本效益考量
- **✅ 驗證**: [部署前檢查](docs/chapter-06-pre-deployment/preflight-checks.md) - 自動化腳本

#### 實作練習
- 執行容量驗證腳本
- 為成本最佳化 SKU 選擇
- 實作自動化部署前檢查

**💡 章節成果**: 在執行前驗證並優化部署

---

### 🚨 第 7 章：故障排除與除錯
<strong>先決條件</strong>：已完成任一部署章節  
<strong>時長</strong>：1-1.5 小時  
<strong>複雜度</strong>：⭐⭐

#### 你將會學到
- 系統化除錯方法
- 常見問題與解決方案
- 特定於 AI 的故障排除

#### 學習資源
- **🔧 常見問題**: [常見問題](docs/chapter-07-troubleshooting/common-issues.md) - 常見問答與解決方案
- **🕵️ 除錯**: [除錯指南](docs/chapter-07-troubleshooting/debugging.md) - 逐步策略
- **🤖 AI 問題**: [AI 專屬故障排除](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI 服務相關問題

#### 實作練習
- 診斷部署失敗
- 排解認證問題
- 除錯 AI 服務連線問題

**💡 章節成果**：能獨立診斷並解決常見部署問題

---

### 🏢 第 8 章：生產與企業模式
<strong>先決條件</strong>：完成第 1 至 4 章  
<strong>時長</strong>：2-3 小時  
<strong>複雜度</strong>：⭐⭐⭐⭐

#### 你將會學到
- 生產部署策略
- 企業安全模式
- 監控與成本優化

#### 學習資源
- **🏭 生產**: [生產 AI 最佳實務](docs/chapter-08-production/production-ai-practices.md) - 企業模式
- **📝 範例**: [微服務範例](../../examples/microservices) - 複雜架構
- **📊 監控**: [Application Insights 整合](docs/chapter-06-pre-deployment/application-insights.md) - 監控

#### 實作練習
- 實作企業安全模式
- 設置完整監控
- 在適當治理下部署到生產環境

**💡 章節成果**：部署具備完整生產能力的企業級應用程式

---

## 🎓 工作坊概覽：實作學習體驗

> **⚠️ 工作坊狀態：開發中**  
> 工作坊教材目前正開發與修訂中。核心模組已可運作，但部分進階單元尚未完成。我們正積極補齊所有內容。[追蹤進度 →](workshop/README.md)

### 互動式工作坊教材
<strong>提供完整的瀏覽器工具與引導練習的實作學習</strong>

我們的工作坊教材提供有結構、互動式的學習體驗，補充上方的章節式課程。工作坊同時適合自學與講師帶領的課程。

#### 🛠️ 工作坊特色
- <strong>瀏覽器介面</strong>：完整的 MkDocs 支援工作坊，包含搜尋、複製與主題功能
- **GitHub Codespaces 整合**：一鍵建立開發環境
- <strong>結構化學習路徑</strong>：8 個模組引導練習（總計 3-4 小時）
- <strong>漸進式方法論</strong>：介紹 → 選擇 → 驗證 → 解構 → 設定 → 客製化 → 清理 → 總結
- **互動式 DevContainer 環境**：預先配置的工具與相依套件

#### 📚 工作坊模組結構
工作坊採用 **8 模組的漸進式方法論**，帶你從探索到部署精通：

| 模組 | 主題 | 你會做什麼 | 時長 |
|--------|-------|----------------|----------|
| **0. 介紹** | 工作坊概覽 | 了解學習目標、先決條件與工作坊架構 | 15 分鐘 |
| **1. 選擇** | 模板探索 | 探索 AZD 模板並為你的情境選擇合適的 AI 模板 | 20 分鐘 |
| **2. 驗證** | 部署與驗證 | 使用 `azd up` 部署模板並驗證基礎設施是否運作 | 30 分鐘 |
| **3. 解構** | 理解結構 | 使用 GitHub Copilot 探索模板架構、Bicep 檔案和程式碼組織 | 30 分鐘 |
| **4. 設定** | azure.yaml 深入解析 | 精通 `azure.yaml` 設定、生命週期鉤子與環境變數 | 30 分鐘 |
| **5. 客製化** | 使其成為你的 | 啟用 AI Search、追蹤、評估，並為你的情境進行客製化 | 45 分鐘 |
| **6. 清除** | 清理 | 使用 `azd down --purge` 安全移除資源 | 15 分鐘 |
| **7. 總結** | 下一步 | 回顧成果、重點概念，並繼續你的學習旅程 | 15 分鐘 |

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
# 選項 1：GitHub Codespaces（建議）
# 在儲存庫中點擊「Code」→「Create codespace on main」

# 選項 2：本地開發
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 按照 workshop/README.md 的設定說明操作
```

#### 🎯 工作坊學習成果
完成工作坊後，參與者將會：
- **部署生產等級 AI 應用**：使用 AZD 與 Microsoft Foundry 服務
- <strong>精通多代理架構</strong>：實作協調的 AI 代理解決方案
- <strong>實施安全最佳實務</strong>：設定驗證與存取控制
- <strong>為擴展做優化</strong>：設計具成本效益且具效能的部署
- <strong>故障排除部署問題</strong>：能獨立解決常見問題

#### 📖 工作坊資源
- **🎥 互動指南**： [工作坊教材](workshop/README.md) - 瀏覽器式學習環境
- **📋 模組逐步指引**:
  - [0. 介紹](workshop/docs/instructions/0-Introduction.md) - 工作坊概覽與目標
  - [1. 選擇](workshop/docs/instructions/1-Select-AI-Template.md) - 尋找並選擇 AI 模板
  - [2. 驗證](workshop/docs/instructions/2-Validate-AI-Template.md) - 部署並驗證模板
  - [3. 解構](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - 探索模板架構
  - [4. 設定](workshop/docs/instructions/4-Configure-AI-Template.md) - 精通 azure.yaml
  - [5. 客製化](workshop/docs/instructions/5-Customize-AI-Template.md) - 針對你的情境進行客製化
  - [6. 清理](workshop/docs/instructions/6-Teardown-Infrastructure.md) - 清理資源
  - [7. 總結](workshop/docs/instructions/7-Wrap-up.md) - 回顧與後續步驟
- **🛠️ AI 工作坊實驗室**： [AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - 以 AI 為重點的練習
- **💡 快速開始**： [工作坊設定指南](workshop/README.md#quick-start) - 環境設定

<strong>適合對象</strong>：企業培訓、大學課程、自學，以及開發者訓練營。

---

## 📖 深入探討：AZD 能力

除了基本功能，AZD 為生產部署提供強大的功能：

- <strong>基於模板的部署</strong> - 使用預建模板來應對常見應用模式
- <strong>基礎設施即程式碼</strong> - 使用 Bicep 或 Terraform 管理 Azure 資源  
- <strong>整合式工作流程</strong> - 無縫地配置、部署與監控應用程式
- <strong>開發者友好</strong> - 為開發者生產力與體驗最佳化

### **AZD + Microsoft Foundry：AI 部署的理想選擇**

**為何選擇 AZD 用於 AI 解決方案？** AZD 解決 AI 開發者面臨的主要挑戰：

- **AI 準備就緒的模板** - 為 Microsoft Foundry 模型、Cognitive Services 與機器學習工作負載提供預先配置的模板
- **安全的 AI 部署** - 內建 AI 服務、API 金鑰與模型端點的安全模式  
- **生產級 AI 模式** - 可擴展且具成本效益的 AI 應用部署最佳實務
- **端到端 AI 工作流程** - 從模型開發到生產部署，並搭配適當的監控
- <strong>成本優化</strong> - 為 AI 工作負載提供聰明的資源分配與擴充策略
- **與 Microsoft Foundry 的整合** - 與 Microsoft Foundry 模型目錄與端點的無縫連接

---

## 🎯 模板與範例庫

### 精選：Microsoft Foundry 模板
**如果你要部署 AI 應用，從這裡開始！**

> **注意：** 這些模板示範各種 AI 模式。有些來自外部的 Azure 範例，其他則是本地實作。

| 模板 | 章節 | 複雜度 | 服務 | 類型 |
|----------|---------|------------|----------|------|
| [**開始使用 AI 聊天**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第 2 章 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | 外部 |
| [**開始使用 AI 代理**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第 2 章 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| 外部 |
| [**Azure Search + OpenAI 示範**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第 2 章 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | 外部 |
| [**OpenAI 聊天應用 快速入門**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第 2 章 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第 5 章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 第 8 章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | 外部 |
| [<strong>零售多代理解決方案</strong>](examples/retail-scenario.md) | 第 5 章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | <strong>本地</strong> |

### 精選：完整學習情境
<strong>對應到學習章節的生產就緒應用模板</strong>

| 模板 | 學習章節 | 複雜度 | 主要學習重點 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第 2 章 | ⭐ | 基本的 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第 2 章 | ⭐⭐ | 使用 Azure AI Search 的 RAG 實作 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第 4 章 | ⭐⭐ | 文件智能整合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第 5 章 | ⭐⭐⭐ | 代理框架與函式呼叫 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第 8 章 | ⭐⭐⭐ | 企業級 AI 編排 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第 5 章 | ⭐⭐⭐⭐ | 具有客戶與庫存代理的多代理架構 |

### 按範例類型學習

> **📌 本地與外部範例：**  
> <strong>本地範例</strong>（在此倉庫中） = 可立即使用  
> <strong>外部範例</strong>（Azure 範例） = 從連結的倉庫克隆

#### 本地範例（可立即使用）
- [<strong>零售多代理解決方案</strong>](examples/retail-scenario.md) - 完整的生產就緒實作，含 ARM 模板
  - 多代理架構（客戶 + 庫存 代理）
  - 完整的監控與評估
  - 透過 ARM 模板一鍵部署

#### 本地範例 - 容器應用（第 2-5 章）
**本倉庫中的完整容器部署範例：**
- [<strong>容器應用範例</strong>](examples/container-app/README.md) - 完整的容器化部署指南
  - [簡單 Flask API](../../examples/container-app/simple-flask-api) - 基本 REST API，支援 scale-to-zero
  - [微服務架構](../../examples/container-app/microservices) - 生產就緒的多服務部署
  - 快速開始、生產與進階部署模式
  - 監控、安全與成本優化指引

#### 外部範例 - 簡單應用（第 1-2 章）
**克隆這些 Azure 範例倉庫開始：**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本部署模式
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 靜態內容部署
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署

#### 外部範例 - 資料庫整合（第 3-4 章）
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 資料庫連線模式
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 無伺服器資料工作流程

#### 外部範例 - 進階模式（第 4-8 章）
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服務架構
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - 背景處理  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - 生產就緒的機器學習模式

### 外部範本集合
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - 精選官方與社群範本集合
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 範本文件
- [**Examples Directory**](examples/README.md) - 本地學習範例與詳細說明

---

## 📚 學習資源與參考

### 快速參考
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - 按章節整理的必要 azd 指令
- [**Glossary**](resources/glossary.md) - Azure 與 azd 術語表  
- [**FAQ**](resources/faq.md) - 按學習章節整理的常見問題
- [**Study Guide**](resources/study-guide.md) - 全面的練習題指南

### 實作工作坊
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - 讓你的 AI 解決方案可用 AZD 部署（2-3 小時）
- [**Interactive Workshop**](workshop/README.md) - 使用 MkDocs 和 GitHub Codespaces 的 8 模組引導練習
  - 流程：介紹 → 選擇 → 驗證 → 解構 → 設定 → 客製化 → 拆除 → 總結

### 外部學習資源
- Azure Developer CLI Documentation: https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/
- Azure Architecture Center: https://learn.microsoft.com/en-us/azure/architecture/
- Azure Pricing Calculator: https://azure.microsoft.com/pricing/calculator/
- Azure Status: https://status.azure.com/

### 編輯器用的 AI Agent 技能
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 個開放代理技能，涵蓋 Azure AI、Foundry、部署、診斷、成本優化等。可安裝到 GitHub Copilot、Cursor、Claude Code 或任何支援的代理：
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 快速疑難排解指南

**初學者常見問題與即時解法：**

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
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# 嘗試使用不同的 Azure 區域
azd env set AZURE_LOCATION "westus2"
azd up

# 或在開發環境中使用較小的 SKU
# 編輯 infra/main.parameters.json：
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# 清除並重試
azd down --force --purge
azd up

# 只修復基礎架構
azd provision

# 檢查詳細狀態
azd show

# 在 Azure Monitor 檢查日誌
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# 為 AZD 重新驗證
azd auth logout
azd auth login

# 可選：如果你正在執行 az 指令，也可刷新 Azure CLI
az logout
az login

# 驗證身份
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD 會產生唯一名稱，但如遇衝突：
azd down --force --purge

# 然後在全新環境中重試
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**正常等待時間：**
- 簡單網站應用：5-10 分鐘
- 含資料庫的應用：10-15 分鐘
- AI 應用：15-25 分鐘（OpenAI 供應較慢）

```bash
# 檢查進度
azd show

# 如果卡住超過 30 分鐘，請檢查 Azure 入口網站：
azd monitor --overview
# 尋找失敗的部署
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# 檢查你在 Azure 的角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 你至少需要「Contributor」角色
# 請向你的 Azure 管理員要求授予：
# - Contributor（用於資源）
# - User Access Administrator（用於角色指派）
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# 顯示所有服務端點
azd show

# 或開啟 Azure 入口網站
azd monitor

# 檢查指定的服務
azd env get-values
# 尋找 *_URL 變數
```
</details>

### 📚 完整疑難排解資源

- **常見問題指南：** [Detailed Solutions](docs/chapter-07-troubleshooting/common-issues.md)
- **AI 特定問題：** [AI Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **偵錯指南：** [Step-by-step Debugging](docs/chapter-07-troubleshooting/debugging.md)
- **尋求協助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 課程完成與證書

### 進度追蹤
追蹤你每章的學習進度：

- [ ] **Chapter 1**: Foundation & Quick Start ✅
- [ ] **Chapter 2**: AI-First Development ✅  
- [ ] **Chapter 3**: Configuration & Authentication ✅
- [ ] **Chapter 4**: Infrastructure as Code & Deployment ✅
- [ ] **Chapter 5**: Multi-Agent AI Solutions ✅
- [ ] **Chapter 6**: Pre-Deployment Validation & Planning ✅
- [ ] **Chapter 7**: Troubleshooting & Debugging ✅
- [ ] **Chapter 8**: Production & Enterprise Patterns ✅

### 學習驗證
完成每章後，確認你的知識：
1. <strong>實作練習</strong>：完成該章的實作部署
2. <strong>知識檢核</strong>：檢視該章的常見問題區
3. <strong>社群討論</strong>：在 Azure Discord 分享你的經驗
4. <strong>下一章</strong>：進入下一個難度層級

### 課程完成的好處
完成所有章節後，你將會擁有：
- <strong>生產經驗</strong>：在 Azure 上部署過真正的 AI 應用
- <strong>專業技能</strong>：企業就緒的部署能力  
- <strong>社群認可</strong>：成為活躍的 Azure 開發者社群成員
- <strong>職涯提升</strong>：具需求的 AZD 與 AI 部署專長

---

## 🤝 社群與支援

### 獲得幫助與支援
- <strong>技術問題</strong>： [Report bugs and request features](https://github.com/microsoft/azd-for-beginners/issues)
- <strong>學習問題</strong>： [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) 與 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 特定支援**：加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- <strong>文件</strong>： [Official Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### 來自 Microsoft Foundry Discord 的社群洞見

**#Azure 頻道最近投票結果：**
- **45%** 的開發者希望在 AI 工作負載上使用 AZD
- <strong>主要挑戰</strong>：多服務部署、憑證管理、生產就緒性  
- <strong>最多人要求</strong>：AI 專用範本、疑難排解指南、最佳實踐

**加入我們的社群來：**
- 分享你的 AZD + AI 經驗並獲得協助
- 優先取得新 AI 範本預覽
- 為 AI 部署最佳實務做出貢獻
- 影響未來 AI + AZD 功能開發

### 對課程做出貢獻
我們歡迎貢獻！請閱讀我們的 [Contributing Guide](CONTRIBUTING.md) 了解細節：
- <strong>內容改進</strong>：強化現有章節與範例
- <strong>新增範例</strong>：加入真實世界情境與範本  
- <strong>翻譯</strong>：協助維護多語言支援
- <strong>錯誤回報</strong>：提升準確性與清晰度
- <strong>社群準則</strong>：遵守我們的包容性社群指引

---

## 📄 課程資訊

### 授權
本專案採用 MIT License 授權 - 詳情請見 [LICENSE](../../LICENSE) 檔案。

### 相關的 Microsoft 學習資源

我們的團隊也製作其他完整的學習課程：

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j 初學者](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js 初學者](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain 初學者](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD 初學者](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI 初學者](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP 初學者](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents 初學者](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### 生成式 AI 系列
[![Generative AI 初學者](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### 核心學習
[![ML 初學者](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![數據科學入門](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI 入門](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![網絡安全入門](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![網頁開發入門](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![物聯網入門](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR 開發入門](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot 系列
[![AI 配對編程的 Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET 的 Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot 冒險](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ 課程導航

**🚀 準備好開始學習？**

<strong>初學者</strong>: 從 [第 1 章：基礎與快速上手](#-chapter-1-foundation--quick-start)  
**AI 開發者**: 跳至 [第 2 章：以 AI 為先的開發](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
<strong>進階開發者</strong>: 從 [第 3 章：設定與驗證](#️-chapter-3-configuration--authentication) 開始

<strong>下一步</strong>: [開始第 1 章 - AZD 基礎](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始語言版本的文件應視為具權威性的來源。對於重要或關鍵資訊，建議採用專業人工翻譯。對於因使用此翻譯而引致的任何誤解或誤釋，我們概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->