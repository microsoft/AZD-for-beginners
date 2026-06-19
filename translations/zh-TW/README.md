# AZD For Beginners: A Structured Learning Journey

![AZD-for-beginners](../../translated_images/zh-TW/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 自動翻譯（隨時更新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[阿拉伯語](../ar/README.md) | [孟加拉語](../bn/README.md) | [保加利亞語](../bg/README.md) | [緬甸語（緬甸）](../my/README.md) | [中文（簡體）](../zh-CN/README.md) | [中文（繁體，香港）](../zh-HK/README.md) | [中文（繁體，澳門）](../zh-MO/README.md) | [中文（繁體，臺灣）](./README.md) | [克羅埃西亞語](../hr/README.md) | [捷克語](../cs/README.md) | [丹麥語](../da/README.md) | [荷蘭語](../nl/README.md) | [愛沙尼亞語](../et/README.md) | [芬蘭語](../fi/README.md) | [法語](../fr/README.md) | [德語](../de/README.md) | [希臘語](../el/README.md) | [希伯來語](../he/README.md) | [印地語](../hi/README.md) | [匈牙利語](../hu/README.md) | [印尼語](../id/README.md) | [義大利語](../it/README.md) | [日語](../ja/README.md) | [坎納達語](../kn/README.md) | [高棉語](../km/README.md) | [韓語](../ko/README.md) | [立陶宛語](../lt/README.md) | [馬來語](../ms/README.md) | [馬拉雅拉姆語](../ml/README.md) | [馬拉地語](../mr/README.md) | [尼泊爾語](../ne/README.md) | [尼日利亞皮欽語](../pcm/README.md) | [挪威語](../no/README.md) | [波斯語（法爾西語）](../fa/README.md) | [波蘭語](../pl/README.md) | [葡萄牙語（巴西）](../pt-BR/README.md) | [葡萄牙語（葡萄牙）](../pt-PT/README.md) | [旁遮普語（古魯穆基）](../pa/README.md) | [羅馬尼亞語](../ro/README.md) | [俄語](../ru/README.md) | [塞爾維亞語（西里爾字母）](../sr/README.md) | [斯洛伐克語](../sk/README.md) | [斯洛維尼亞語](../sl/README.md) | [西班牙語](../es/README.md) | [斯瓦希里語](../sw/README.md) | [瑞典語](../sv/README.md) | [他加祿語（菲律賓語）](../tl/README.md) | [泰米爾語](../ta/README.md) | [泰盧固語](../te/README.md) | [泰語](../th/README.md) | [土耳其語](../tr/README.md) | [烏克蘭語](../uk/README.md) | [烏爾都語](../ur/README.md) | [越南語](../vi/README.md)

> **想要在本機複製？**
>
> 本儲存庫包含超過 50 種語言的翻譯，會大幅增加下載大小。若要在不下載翻譯的情況下複製，請使用稀疏簽出：
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
> 這樣你就可以更快速下載到完成課程所需的所有內容。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 今天 azd 的最新消息

> 📌 本課程已針對 **`azd 1.25.6`**（2026 年 6 月）驗證。執行 `azd version` 檢查您的版本，並使用 `azd upgrade` 取得最新版本。

Azure Developer CLI 已超越傳統的 Web 應用程式與 API。如今，azd 是將「任何」應用程式部署到 Azure 的單一工具——包括以 AI 為動力的應用程式與智慧代理（agents）。

這對你意味著：

- **AI 代理現在是 azd 的一級工作負載。** 你可以使用熟悉的 `azd init` → `azd up` 工作流程初始化、部署和管理 AI 代理專案。
- **從 CLI 管理完整的代理生命週期。** `azure.ai.agents` 擴充功能現在涵蓋整個流程——`azd ai agent init` 用於產生腳手架，`azd ai agent invoke` 用於測試（含回應時序輸出），`azd ai agent eval generate` 與 `azd ai agent optimize` 用於衡量與改善品質，以及 `azd ai agent delete` 用於清理。
- **更多 AI 組件。** 新的預覽擴充功能—`azure.ai.skills` 與 `azure.ai.connections`—讓你可以直接用 azd 管理可重用的代理技能與 Foundry 連線。
- **整合 Microsoft Foundry** 將模型部署、代理託管與 AI 服務設定直接帶入 azd 範本生態系。
- **日常使用更順暢。** 最近的版本讓 `azd init` 可重入（可安全重複執行）、讓 `azd auth login` 自動清除過期的權杖，並新增了友善的 `azd tool` 首次執行設定提示。
- **核心工作流程未改變。** 無論你是在部署待辦事項應用、微服務或多代理的 AI 解決方案，使用的指令都是相同的。

> **給 Aspire 使用者的說明：** Microsoft 現在簡稱該產品為 **Aspire**（原名 ".NET Aspire"）。azd 對 Aspire 的支援沒有改變——只有名稱更新。

如果你以前用過 azd，AI 支援是自然的延伸——不是另一個獨立工具或進階路線。若你是從頭開始，你將學會一套適用於所有情境的工作流程。

---

## 🚀 什麼是 Azure Developer CLI (azd)？

**Azure Developer CLI (azd)** 是一個以開發者為友好的命令列工具，可簡化將應用程式部署到 Azure 的流程。你不需要手動建立與連接數十個 Azure 資源，就可以用單一指令部署整個應用程式。

### `azd up` 的魔力

```bash
# 這個單一指令完成所有工作：
# ✅ 建立所有 Azure 資源
# ✅ 配置網路和安全性
# ✅ 建置您的應用程式程式碼
# ✅ 部署到 Azure
# ✅ 提供您可用的 URL
azd up
```

**就是這樣！** 不需要點擊 Azure 入口網站，不需要先學複雜的 ARM 範本，也不需要手動設定——直接在 Azure 上運行應用程式。

---

## ❓ Azure Developer CLI 與 Azure CLI：有何不同？

這是初學者最常問的問題。簡單回答如下：

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Purpose** | 管理單一的 Azure 資源 | 部署完整的應用程式 |
| **Mindset** | 以基礎架構為中心 | 以應用程式為中心 |
| **Example** | `az webapp create --name myapp...` | `azd up` |
| **Learning Curve** | 需要了解 Azure 服務 | 只需了解你的應用程式 |
| **Best For** | DevOps、基礎架構 | 開發者、原型設計 |

### 簡單類比

- **Azure CLI** 就像擁有建房子的所有工具——鎚子、鋸子、釘子。你可以建造任何東西，但需要知道施工方法。
- **Azure Developer CLI** 就像雇用承包商——你描述想要的結果，他們負責建造。

### 何時使用哪一個

| Scenario | Use This |
|----------|----------|
|「我想快速部署我的 Web 應用」 | `azd up` |
|「我只需要建立一個儲存帳戶」 | `az storage account create` |
|「我正在建立完整的 AI 應用」 | `azd init --template azure-search-openai-demo` |
|「我需要偵錯特定的 Azure 資源」 | `az resource show` |
|「我想在幾分鐘內完成適用於生產的部署」 | `azd up --environment production` |

### 它們可以一起使用！

AZD 在底層使用 Azure CLI。你可以兩者並用：
```bash
# 使用 AZD 部署您的應用程式
azd up

# 然後使用 Azure CLI 微調特定資源
az webapp config set --name myapp --always-on true
```

---

## 🌟 在 Awesome AZD 找到範本

不要從頭開始！**Awesome AZD** 是社群收集的即時可部署範本集合：

| Resource | Description |
|----------|-------------|
| 🔗 [**Awesome AZD 圖庫**](https://azure.github.io/awesome-azd/) | 瀏覽 200+ 範本並一鍵部署 |
| 🔗 [<strong>提交範本</strong>](https://github.com/Azure/awesome-azd/issues) | 將你的範本貢獻給社群 |
| 🔗 [**GitHub 倉庫**](https://github.com/Azure/awesome-azd) | 給星並探索原始碼 |

### Awesome AZD 的熱門 AI 範本

```bash
# 使用 Microsoft Foundry 模型與 AI 搜尋的 RAG 聊天
azd init --template azure-search-openai-demo

# 快速 AI 聊天應用程式
azd init --template openai-chat-app-quickstart

# 搭配 Foundry Agent 的 AI 代理
azd init --template get-started-with-ai-agents
```

---

## 🎯 三步驟快速上手

開始之前，請確保你的機器已滿足你要部署的範本需求：

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

如果任何必要檢查未通過，請先修正再繼續快速開始。

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
# 如果您計劃在本課程中直接使用 Azure CLI 命令，此項為選填
az login

# AZD 工作流程必填
azd auth login
```

如果你不確定需要哪一種，請依照 [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup) 中的完整設定流程操作。

### 第 3 步：部署你的第一個應用程式

```bash
# 從範本初始化
azd init --template todo-nodejs-mongo

# 部署到 Azure（會建立所有東西！）
azd up
```

**🎉 就完成了！** 你的應用程式現在已在 Azure 上運行。

### 清理（別忘了！）

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 如何使用本課程

本課程以「循序漸進學習」為設計理念——從你熟悉的地方開始，逐步進階：

| Your Experience | Start Here |
|-----------------|------------|
| **完全沒接觸過 Azure** | [第 1 章：基礎](#-chapter-1-foundation--quick-start) |
| **了解 Azure，但不熟悉 AZD** | [第 1 章：基礎](#-chapter-1-foundation--quick-start) |
| **想部署 AI 應用** | [第 2 章：以 AI 為先的開發](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| <strong>想要實作練習</strong> | [🎓 互動工作坊](workshop/README.md) - 3-4 小時引導實驗室 |
| <strong>需要生產實務範式</strong> | [第 8 章：生產與企業](#-chapter-8-production--enterprise-patterns) |

### 快速設定

1. **Fork 本儲存庫**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. <strong>克隆它</strong>: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. <strong>尋求幫助</strong>: [Azure Discord 社群](https://discord.com/invite/ByRwuEEgH4)

> **想要在本機複製？**

> 本儲存庫包含超過 50 種語言的翻譯，會大幅增加下載大小。若要在不下載翻譯的情況下複製，請使用稀疏簽出：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 這樣你就可以更快速下載到完成課程所需的所有內容。


## 課程概覽

透過結構化章節掌握 Azure Developer CLI (azd)。**特別著重於整合 Microsoft Foundry 的 AI 應用程式部署。**
### 為什麼這門課程對現代開發者至關重要

根據 Microsoft Foundry Discord 社群的見解，**45% 的開發者想要使用 AZD 來處理 AI 工作負載**，但遇到以下挑戰：
- 複雜的多服務 AI 架構
- 生產環境 AI 部署最佳實務  
- Azure AI 服務整合與設定
- AI 工作負載的成本最佳化
- 疑難排解 AI 特有的部署問題

### 學習目標

完成這門結構化課程後，您將能夠：
- **精通 AZD 基礎**：核心概念、安裝與設定
- **部署 AI 應用程式**：使用 AZD 與 Microsoft Foundry 服務
- <strong>實作基礎設施即程式碼</strong>：使用 Bicep 模板管理 Azure 資源
- <strong>疑難排解部署</strong>：解決常見問題並進行除錯
- <strong>為生產環境優化</strong>：安全性、擴展、監控與成本管理
- <strong>建構多代理解決方案</strong>：部署複雜的 AI 架構

## 在開始之前：帳戶、存取與假設

在開始第 1 章之前，請確保您已具備以下事項。本指南稍後的安裝步驟假設這些基礎已經處理完成。

- **一個 Azure 訂閱**：您可以使用公司或個人的現有訂閱，或建立一個 [免費試用](https://aka.ms/azurefreetrial) 開始。
- **建立 Azure 資源的權限**：在大多數練習中，您應至少在目標訂閱或資源群組上擁有 **Contributor** 存取權。一些章節可能也假設您可以建立資源群組、受管理身分與 RBAC 指派。
- [**一個 GitHub 帳戶**](https://github.com)：這對 fork 倉庫、追蹤個人變更，以及使用 GitHub Codespaces 進行工作坊很有用。
- <strong>範本執行環境先決條件</strong>：某些範本需要本地工具，例如 Node.js、Python、Java 或 Docker。開始前請執行 setup validator，以便及早發現缺少的工具。
- <strong>基本終端機使用熟悉度</strong>：您不需要是專家，但應能熟練執行像 `git clone`、`azd auth login` 與 `azd up` 這類指令。

> **在企業訂閱中工作？**
> 如果您的 Azure 環境由管理員管理，請事先確認您可以在計畫使用的訂閱或資源群組中部署資源。如果無法，請在開始前要求一個沙盒訂閱或 Contributor 存取權。

> **剛接觸 Azure？**
> 使用您自己的 Azure 試用或隨用隨付訂閱 https://aka.ms/azurefreetrial，這樣您就能夠從頭到尾完成練習，而不用等待租戶層級的核准。

## 🗺️ 課程地圖：按章節快速導覽

每個章節都有專屬的 README，內含學習目標、快速入門與練習：

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | 入門 | [AZD 基礎](docs/chapter-01-foundation/azd-basics.md) &#124; [安裝](docs/chapter-01-foundation/installation.md) &#124; [第一個專案](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2: AI Development](docs/chapter-02-ai-development/README.md)** | 以 AI 為先的應用 | [Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI 代理](docs/chapter-02-ai-development/agents.md) &#124; [模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [工作坊](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | 認證與安全 | [設定](docs/chapter-03-configuration/configuration.md) &#124; [認證與安全](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Ch 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC 與部署 | [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [佈建](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI 代理解決方案 | [零售情境](examples/retail-scenario.md) &#124; [協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | 規劃與驗證 | [預檢查](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [應用程式洞察](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | 除錯與修復 | [常見問題](docs/chapter-07-troubleshooting/common-issues.md) &#124; [除錯](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI 問題](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | 企業模式 | [生產實務](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | 實作工作坊 | [介紹](workshop/docs/instructions/0-Introduction.md) &#124; [選擇](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [驗證](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [解構](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [設定](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [客製化](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [資源清除](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [總結](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**總課程時長：** 約 10-14 小時 | **技能進階路徑：** 初學者 → 生產準備

---

## 📚 學習章節

<em>根據經驗層級與目標選擇您的學習路徑</em>

### 🚀 第 1 章：基礎與快速入門
<strong>先決條件</strong>：Azure 訂閱、基本命令列知識  
<strong>時長</strong>：30-45 分鐘  
<strong>複雜度</strong>：⭐

#### 您將學到
- 了解 Azure Developer CLI 的基本概念
- 在您的平台上安裝 AZD
- 您的第一個成功部署

#### 學習資源
- **🎯 從這裡開始**： [什麼是 Azure Developer CLI？](#what-is-azure-developer-cli)
- **📖 理論**： [AZD 基礎](docs/chapter-01-foundation/azd-basics.md) - 核心概念與術語
- **⚙️ 設定**： [安裝與設定](docs/chapter-01-foundation/installation.md) - 平台特定指引
- **🛠️ 實作**： [您的第一個專案](docs/chapter-01-foundation/first-project.md) - 逐步教學
- **📋 快速參考**： [指令速查表](resources/cheat-sheet.md)

#### 實作練習
```bash
# 快速安裝檢查
azd version

# 部署您的第一個應用程式
azd init --template todo-nodejs-mongo
azd up
```

**💡 章節成果**： 使用 AZD 成功將簡單的 web 應用部署到 Azure

**✅ 成功驗證：**
```bash
# 完成第1章後，您應該能夠：
azd version              # 顯示已安裝的版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署到 Azure
azd show                # 顯示正在執行的應用程式網址
# 應用程式在瀏覽器中開啟並能正常運作
azd down --force --purge  # 清理資源
```

**📊 時間投入：** 30-45 分鐘  
**📈 完成後技能層級：** 能獨立部署基本應用程式
**📈 完成後技能層級：** 能獨立部署基本應用程式

---

### 🤖 第 2 章：以 AI 為先的開發（建議給 AI 開發者）
<strong>先決條件</strong>：已完成第 1 章  
<strong>時長</strong>：1-2 小時  
<strong>複雜度</strong>：⭐⭐

#### 您將學到
- Microsoft Foundry 與 AZD 的整合
- 部署具 AI 功能的應用程式
- 了解 AI 服務的設定

#### 學習資源
- **🎯 從這裡開始**： [Microsoft Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI 代理**： [AI 代理指南](docs/chapter-02-ai-development/agents.md) - 使用 AZD 部署智慧代理
- **📖 模式**： [AI 模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) - 部署與管理 AI 模型
- **🛠️ 工作坊**： [AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - 讓您的 AI 解決方案符合 AZD
- **🎥 互動指南**： [工作坊教材](workshop/README.md) - 使用 MkDocs 的瀏覽器式學習 * DevContainer 環境
- **📋 範本**： [精選 Microsoft Foundry 範本](#workshop-resources)
- **📝 範例**： [AZD 部署範例](examples/README.md)

#### 實作練習
```bash
# 部署您的第一個 AI 應用程式
azd init --template azure-search-openai-demo
azd up

# 試試其他 AI 範本
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 章節成果**： 部署並設定具有 RAG 功能的 AI 聊天應用程式

**✅ 成功驗證：**
```bash
# 在第2章之後，您應該能夠：
azd init --template azure-search-openai-demo
azd up
# 測試 AI 聊天介面
# 提出問題並獲得包含來源的 AI 回應
# 確認搜尋整合功能正常運作
azd monitor  # 檢查 Application Insights 是否顯示遙測資料
azd down --force --purge
```

**📊 時間投入：** 1-2 小時  
**📈 完成後技能層級：** 能部署與設定生產就緒的 AI 應用程式  
**💰 成本意識：** 了解開發環境每月 $80-150，生產環境每月 $300-3500 的成本範圍

#### 💰 AI 部署的成本考量

**開發環境（估計每月 $80-150）：**
- Microsoft Foundry 模型（隨用隨付）：$0-50/月（基於 token 使用量）
- AI Search（Basic 階層）：$75/月
- Container Apps（消耗模式）：$0-20/月
- 儲存（標準）：$1-5/月

**生產環境（估計每月 $300-3,500+）：**
- Microsoft Foundry 模型（為一致效能的 PTU）：$3,000+/月 或 高流量時的隨用隨付
- AI Search（Standard 階層）：$250/月
- Container Apps（專屬）：$50-100/月
- Application Insights：$5-50/月
- 儲存（高階）：$10-50/月

**💡 成本優化技巧：**
- 使用 <strong>免費階層</strong> 的 Microsoft Foundry 模型來學習（Azure OpenAI 每月包含 50,000 tokens）
- 在不積極開發時執行 `azd down` 以解除配置資源
- 起初使用消耗計費，僅在生產環境再升級到 PTU
- 使用 `azd provision --preview` 在部署前估算成本
- 啟用自動調整：只為實際使用付費

**成本監控：**
```bash
# 查看預估的每月費用
azd provision --preview

# 在 Azure 入口網站監控實際費用
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第 3 章：設定與認證
<strong>先決條件</strong>：已完成第 1 章  
<strong>時長</strong>：45-60 分鐘  
<strong>複雜度</strong>：⭐⭐

#### 您將學到
- 環境設定與管理
- 認證與安全最佳實務
- 資源命名與組織

#### 學習資源
- **📖 設定**： [設定指南](docs/chapter-03-configuration/configuration.md) - 環境設定
- **🔐 安全**： [認證模式與受管理身分](docs/chapter-03-configuration/authsecurity.md) - 認證模式
- **📝 範例**： [資料庫應用範例](examples/database-app/README.md) - AZD 資料庫範例

#### 實作練習
- 設定多個環境（dev、staging、prod）
- 設置受管理身分認證
- 實作環境特定的設定

**💡 章節成果**： 使用適當的認證與安全性來管理多個環境

---

### 🏗️ 第 4 章：基礎設施即程式碼與部署
<strong>先決條件</strong>：已完成第 1-3 章  
<strong>時長</strong>：1-1.5 小時  
<strong>複雜度</strong>：⭐⭐⭐

#### 您將學到
- 進階部署模式
- 使用 Bicep 的基礎設施即程式碼
- 資源佈建策略

#### 學習資源
- **📖 部署**： [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) - 完整工作流程
- **🏗️ 佈建**： [佈建資源](docs/chapter-04-infrastructure/provisioning.md) - Azure 資源管理
- **📝 範例**： [Container App 範例](../../examples/container-app) - 容器化部署

#### 實作練習
- 建立自訂 Bicep 範本
- 部署多服務應用程式
- 實作藍綠部署策略

**💡 章節成果**： 使用自訂基礎設施範本部署複雜的多服務應用程式

---
### 🎯 第5章: 多代理 AI 解決方案 (進階)
**Prerequisites**: Chapters 1-2 completed  
**Duration**: 2-3 hours  
**Complexity**: ⭐⭐⭐⭐

#### What You'll Learn
- 多代理架構模式
- 代理編排與協同
- 生產就緒的 AI 部署

#### Learning Resources
- **🤖 精選專案**: [零售多代理解決方案](examples/retail-scenario.md) - 完整實作
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - 一鍵部署
- **📖 Architecture**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - Patterns

#### Practical Exercises
```bash
# 部署完整的零售多代理解決方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索代理設定
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Chapter Outcome**: 部署並管理一個生產就緒的多代理 AI 解決方案，含 Customer 與 Inventory 代理

---

### 🔍 第6章: 部署前驗證與規劃
**Prerequisites**: Chapter 4 completed  
**Duration**: 1 hour  
**Complexity**: ⭐⭐

#### What You'll Learn
- 容量規劃與資源驗證
- SKU 選擇策略
- 部署前檢查與自動化

#### Learning Resources
- **📊 Planning**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Resource validation
- **💰 Selection**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Cost-effective choices
- **✅ Validation**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Automated scripts

#### Practical Exercises
- Run capacity validation scripts
- Optimize SKU selections for cost
- Implement automated pre-deployment checks

**💡 Chapter Outcome**: 驗證並優化部署在執行前的狀態

---

### 🚨 第7章: 疑難排解與除錯
**Prerequisites**: Any deployment chapter completed  
**Duration**: 1-1.5 hours  
**Complexity**: ⭐⭐

#### What You'll Learn
- 系統化的除錯方法
- 常見問題與解決方案
- AI 專屬的疑難排解

#### Learning Resources
- **🔧 常見問題**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ and solutions
- **🕵️ 除錯**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Step-by-step strategies
- **🤖 AI 問題**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI service problems

#### Practical Exercises
- Diagnose deployment failures
- Resolve authentication issues
- Debug AI service connectivity

**💡 Chapter Outcome**: 能獨立診斷並解決常見的部署問題

---

### 🏢 第8章: 生產與企業模式
**Prerequisites**: Chapters 1-4 completed  
**Duration**: 2-3 hours  
**Complexity**: ⭐⭐⭐⭐

#### What You'll Learn
- 生產環境部署策略
- 企業安全模式
- 監控與成本最佳化

#### Learning Resources
- **🏭 Production**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Enterprise patterns
- **📝 Examples**: [Microservices Example](../../examples/microservices) - Complex architectures
- **📊 Monitoring**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Monitoring

#### Practical Exercises
- Implement enterprise security patterns
- Set up comprehensive monitoring
- Deploy to production with proper governance

**💡 Chapter Outcome**: 部署具備完整生產能力的企業級應用程式

---

## 🎓 Workshop Overview: Hands-On Learning Experience

> **⚠️ WORKSHOP STATUS: Active Development**  
> The workshop materials are currently being developed and refined. Core modules are functional, but some advanced sections are incomplete. We're actively working to complete all content. [Track progress →](workshop/README.md)

### Interactive Workshop Materials
**Comprehensive hands-on learning with browser-based tools and guided exercises**

Our workshop materials provide a structured, interactive learning experience that complements the chapter-based curriculum above. The workshop is designed for both self-paced learning and instructor-led sessions.

#### 🛠️ Workshop Features
- **Browser-Based Interface**: Complete MkDocs-powered workshop with search, copy, and theme features
- **GitHub Codespaces Integration**: One-click development environment setup
- **Structured Learning Path**: 8-module guided exercises (3-4 hours total)
- **Progressive Methodology**: Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
- **Interactive DevContainer Environment**: Pre-configured tools and dependencies

#### 📚 Workshop Module Structure
The workshop follows an **8-module progressive methodology** that takes you from discovery to deployment mastery:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Introduction** | Workshop Overview | Understand learning objectives, prerequisites, and workshop structure | 15 min |
| **1. Selection** | Template Discovery | Explore AZD templates and select the right AI template for your scenario | 20 min |
| **2. Validation** | Deploy & Verify | Deploy the template with `azd up` and validate infrastructure works | 30 min |
| **3. Deconstruction** | Understand Structure | Use GitHub Copilot to explore template architecture, Bicep files, and code organization | 30 min |
| **4. Configuration** | azure.yaml Deep Dive | Master `azure.yaml` configuration, lifecycle hooks, and environment variables | 30 min |
| **5. Customization** | Make It Yours | Enable AI Search, tracing, evaluation, and customize for your scenario | 45 min |
| **6. Teardown** | Clean Up | Safely deprovision resources with `azd down --purge` | 15 min |
| **7. Wrap-up** | Next Steps | Review accomplishments, key concepts, and continue your learning journey | 15 min |

**Workshop Flow:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Getting Started with the Workshop
```bash
# 選項 1：GitHub Codespaces（建議）
# 在儲存庫中點選「Code」→「Create codespace on main」

# 選項 2：本機開發
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 依照 workshop/README.md 中的設定說明操作
```

#### 🎯 Workshop Learning Outcomes
By completing the workshop, participants will:
- **Deploy Production AI Applications**: Use AZD with Microsoft Foundry services
- **Master Multi-Agent Architectures**: Implement coordinated AI agent solutions
- **Implement Security Best Practices**: Configure authentication and access control
- **Optimize for Scale**: Design cost-effective, performant deployments
- **Troubleshoot Deployments**: Resolve common issues independently

#### 📖 Workshop Resources
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Browser-based learning environment
- **📋 Module-by-Module Instructions**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - Workshop overview and objectives
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - Find and select AI templates
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - Deploy and verify templates
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explore template architecture
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - Master azure.yaml
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - Customize for your scenario
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Clean up resources
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - Review and next steps
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-focused exercises
- **💡 Quick Start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Environment configuration

**Perfect for**: Corporate training, university courses, self-paced learning, and developer bootcamps.

---

## 📖 Deep Dive: AZD Capabilities

Beyond the basics, AZD provides powerful features for production deployments:

- **Template-based deployments** - Use pre-built templates for common application patterns
- **Infrastructure as Code** - Manage Azure resources using Bicep or Terraform  
- **Integrated workflows** - Seamlessly provision, deploy, and monitor applications
- **Developer-friendly** - Optimized for developer productivity and experience

### **AZD + Microsoft Foundry: Perfect for AI Deployments**

**Why AZD for AI Solutions?** AZD addresses the top challenges AI developers face:

- **AI-Ready Templates** - Pre-configured templates for Microsoft Foundry Models, Azure AI Services, and ML workloads
- **Secure AI Deployments** - Built-in security patterns for AI services, API keys, and model endpoints  
- **Production AI Patterns** - Best practices for scalable, cost-effective AI application deployments
- **End-to-End AI Workflows** - From model development to production deployment with proper monitoring
- **Cost Optimization** - Smart resource allocation and scaling strategies for AI workloads
- **Microsoft Foundry Integration** - Seamless connection to Microsoft Foundry model catalog and endpoints

---

## 🎯 Templates & Examples Library

### Featured: Microsoft Foundry Templates
**Start here if you're deploying AI applications!**

> **Note:** These templates demonstrate various AI patterns. Some are external Azure Samples, others are local implementations.

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | External |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapter 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| External |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | External |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | External |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | External |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | External |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### Featured: Complete Learning Scenarios
**Production-ready application templates mapped to learning chapters**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | Basic AI deployment patterns |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | RAG implementation with Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapter 4 | ⭐⭐ | Document Intelligence integration |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | Agent framework and function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐ | Enterprise AI orchestration |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | Multi-agent architecture with Customer and Inventory agents |

### Learning by Example Type

> **📌 Local vs. External Examples:**  
> **Local Examples** (in this repo) = Ready to use immediately  
> **External Examples** (Azure Samples) = Clone from linked repositories

#### Local Examples (Ready to Use)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Complete production-ready implementation with ARM templates
  - Multi-agent architecture (Customer + Inventory agents)
  - Comprehensive monitoring and evaluation
  - One-click deployment via ARM template

#### Local Examples - Container Applications (Chapters 2-5)
**Comprehensive container deployment examples in this repository:**
- [<strong>容器應用範例</strong>](examples/container-app/README.md) - 完整的容器化部署指南
  - [簡單的 Flask API](../../examples/container-app/simple-flask-api) - 支援 scale-to-zero 的基本 REST API
  - [微服務架構](../../examples/container-app/microservices) - 適合生產的多服務部署
  - 快速上手、正式環境與進階部署模式
  - 監控、安全與成本優化指引

#### 外部範例 - 簡易應用（第 1-2 章）
**複製這些 Azure 範例儲存庫開始：**
- [簡易網頁應用 - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本部署模式
- [靜態網站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 靜態內容部署
- [容器應用 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署

#### 外部範例 - 資料庫整合（第 3-4 章）  
- [資料庫應用 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 資料庫連線模式
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 無伺服器資料工作流程

#### 外部範例 - 進階模式（第 4-8 章）
- [Java 微服務](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服務架構
- [Container Apps 工作](https://github.com/Azure-Samples/container-apps-jobs) - 背景處理  
- [企業級機器學習流程](https://github.com/Azure-Samples/mlops-v2) - 適合生產的 ML 範式

### 外部範本集合
- [**官方 AZD 範本畫廊**](https://azure.github.io/awesome-azd/) - 精選官方與社群範本集合
- [**Azure Developer CLI 範本**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 範本文件
- [<strong>範例目錄</strong>](examples/README.md) - 本地學習範例與詳細說明

---

## 📚 學習資源與參考

### 快速參考
- [<strong>指令速查表</strong>](resources/cheat-sheet.md) - 按章節整理的常用 azd 指令
- [<strong>術語表</strong>](resources/glossary.md) - Azure 與 azd 術語
- [<strong>常見問答</strong>](resources/faq.md) - 按學習章節整理的常見問題
- [<strong>學習指南</strong>](resources/study-guide.md) - 綜合練習題

### 實作工作坊
- [**AI 工作坊實驗室**](docs/chapter-02-ai-development/ai-workshop-lab.md) - 讓你的 AI 解決方案可用 AZD 部署（2-3 小時）
- [<strong>互動式工作坊</strong>](workshop/README.md) - 使用 MkDocs 與 GitHub Codespaces 的 8 模組引導練習
  - 依序：介紹 → 選擇 → 驗證 → 拆解 → 設定 → 客製化 → 拆除 → 結語

### 外部學習資源
- [Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 價格計算機](https://azure.microsoft.com/pricing/calculator/)
- [Azure 狀態](https://status.azure.com/)

### 編輯器的 AI 代理技能
- [**skills.sh 上的 Microsoft Azure 技能**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 個開放的代理技能，涵蓋 Azure AI、Foundry、部署、診斷、成本優化等。可在 GitHub Copilot、Cursor、Claude Code 或任何支援的代理中安裝：
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 快速疑難排解指南

**初學者常見問題與即時解決方案：**

<details>
<summary><strong>❌ "azd：找不到命令"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" 或 "超過配額"</strong></summary>

```bash
# 嘗試不同的 Azure 區域
azd env set AZURE_LOCATION "westus2"
azd up

# 或在開發環境中使用較小的 SKU
# 編輯 infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" 在中途失敗</strong></summary>

```bash
# 清理並重試
azd down --force --purge
azd up

# 只修復基礎架構
azd provision

# 檢查詳細狀態
azd show

# 在 Azure Monitor 中檢查日誌
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "驗證失敗" 或 "權杖已過期"</strong></summary>

```bash
# 為 AZD 重新驗證
azd auth logout
azd auth login

# 選擇性：如果您正在執行 az 命令，也可一起刷新 Azure CLI
az logout
az login

# 確認認證狀態
az account show
```
</details>

<details>
<summary><strong>❌ "資源已存在" 或 命名衝突</strong></summary>

```bash
# AZD 會產生唯一的名稱，但若發生衝突：
azd down --force --purge

# 則以全新的環境重試
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 範本部署耗時過長</strong></summary>

**正常等待時間：**
- 簡易網頁應用：5-10 分鐘
- 含資料庫的應用：10-15 分鐘
- AI 應用：15-25 分鐘（OpenAI 預配較慢）

```bash
# 檢查進度
azd show

# 如果卡住超過 30 分鐘，請檢查 Azure 入口網站：
azd monitor --overview
# 尋找失敗的部署
```
</details>

<details>
<summary><strong>❌ "權限被拒" 或 "Forbidden"</strong></summary>

```bash
# 檢查您在 Azure 的角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 您至少需要「Contributor」角色
# 請向您的 Azure 管理員要求授予：
# - Contributor（針對資源）
# - User Access Administrator（用於角色指派）
```
</details>

<details>
<summary><strong>❌ 找不到已部署應用程式的 URL</strong></summary>

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

### 📚 完整的疑難排解資源

- **常見問題指南：** [詳細解決方案](docs/chapter-07-troubleshooting/common-issues.md)
- **AI 特定問題：** [AI 疑難排解](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **除錯指南：** [逐步除錯](docs/chapter-07-troubleshooting/debugging.md)
- **尋求協助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 課程完成與認證

### 進度追蹤
追蹤你在每章的學習進度：

- [ ] **第 1 章**：基礎與快速上手 ✅
- [ ] **第 2 章**：以 AI 為先的開發 ✅  
- [ ] **第 3 章**：設定與驗證 ✅
- [ ] **第 4 章**：基礎設施即程式碼與部署 ✅
- [ ] **第 5 章**：多代理 AI 解決方案 ✅
- [ ] **第 6 章**：部署前驗證與規劃 ✅
- [ ] **第 7 章**：疑難排解與除錯 ✅
- [ ] **第 8 章**：生產與企業模式 ✅

### 學習驗證
完成每章後，驗證你的知識：
1. <strong>實作練習</strong>：完成該章的實作部署
2. <strong>知識檢核</strong>：檢視該章的常見問答
3. <strong>社群討論</strong>：在 Azure Discord 分享你的經驗
4. <strong>下一章</strong>：進入下一個難度層級

### 課程完成的好處
完成所有章節後，你將具備：
- <strong>生產經驗</strong>：將真實的 AI 應用部署到 Azure
- <strong>專業技能</strong>：具備企業生產部署能力  
- <strong>社群認可</strong>：成為活躍的 Azure 開發者社群成員
- <strong>職涯提升</strong>：需求量大的 AZD 與 AI 部署專業技能

---

## 🤝 社群與支援

### 取得協助與支援
- <strong>技術問題</strong>： [回報錯誤與功能需求](https://github.com/microsoft/azd-for-beginners/issues)
- <strong>學習問題</strong>： [Microsoft Azure Discord 社群](https://discord.gg/microsoft-azure) 與 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 專屬協助**：加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- <strong>文件</strong>： [官方 Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### 來自 Microsoft Foundry Discord 的社群見解

**來自 #Azure 頻道的最近投票結果：**
- **45%** 的開發者希望使用 AZD 來處理 AI 工作負載
- <strong>主要挑戰</strong>：多服務部署、憑證管理、正式環境準備  
- <strong>最多人要求</strong>：AI 專用範本、疑難排解指南、最佳實務

**加入我們的社群以：**
- 分享你的 AZD + AI 經驗並獲得協助
- 取得新的 AI 範本的早期預覽
- 貢獻 AI 部署最佳實務
- 影響未來的 AI + AZD 功能開發

### 參與課程貢獻
我們歡迎貢獻！請閱讀我們的 [Contributing Guide](CONTRIBUTING.md) 以了解詳細資訊：
- <strong>內容改進</strong>：強化現有章節與範例
- <strong>新增範例</strong>：加入真實世界情境與範本  
- <strong>翻譯</strong>：協助維護多語言支援
- <strong>錯誤回報</strong>：提升準確性與清晰度
- <strong>社群準則</strong>：遵守我們的包容性社群指引

---

## 📄 課程資訊

### 授權
本專案依 MIT 授權條款授權 - 詳情請見 [LICENSE](../../LICENSE) 檔案。

### 相關的 Microsoft 學習資源

我們的團隊也製作其他完整的學習課程：

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j 初學者指南](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js 初學者指南](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain 初學者指南](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD 初學者指南](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI 初學者指南](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP 初學者指南](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents 初學者指南](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### 生成式 AI 系列
[![生成式 AI 初學者指南](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![生成式 AI（.NET）](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![生成式 AI（Java）](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### 核心學習
[![機器學習入門](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![資料科學入門](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![人工智慧入門](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![資安入門](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![網頁開發入門](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![物聯網入門](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR 開發入門](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot 系列
[![Copilot：AI 配對程式設計](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot：C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot 冒險](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ 課程導覽

**🚀 準備好開始學習了嗎？**

<strong>初學者</strong>: 從 [第 1 章：基礎與快速起步](#-chapter-1-foundation--quick-start) 開始  
**AI 開發者**: 跳到 [第 2 章：以 AI 為先的開發](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
<strong>資深開發者</strong>: 從 [第 3 章：設定與驗證](#️-chapter-3-configuration--authentication) 開始

<strong>下一步</strong>: [開始第 1 章 - AZD 基礎](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->