# AZD For Beginners: A Structured Learning Journey

![AZD 新手指南](../../translated_images/zh-MO/azdbeginners.5527441dd9f74068.webp) 

[![GitHub 追蹤者](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub 分叉](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub 星標](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 自動翻譯（隨時保持最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[阿拉伯語](../ar/README.md) | [孟加拉語](../bn/README.md) | [保加利亞語](../bg/README.md) | [緬甸語 (Myanmar)](../my/README.md) | [中文（簡體）](../zh-CN/README.md) | [中文（繁體，香港）](../zh-HK/README.md) | [中文（繁體，澳門）](./README.md) | [中文（繁體，台灣）](../zh-TW/README.md) | [克羅地亞語](../hr/README.md) | [捷克語](../cs/README.md) | [丹麥語](../da/README.md) | [荷蘭語](../nl/README.md) | [愛沙尼亞語](../et/README.md) | [芬蘭語](../fi/README.md) | [法語](../fr/README.md) | [德語](../de/README.md) | [希臘語](../el/README.md) | [希伯來語](../he/README.md) | [印地語](../hi/README.md) | [匈牙利語](../hu/README.md) | [印尼語](../id/README.md) | [義大利語](../it/README.md) | [日語](../ja/README.md) | [坎納達語](../kn/README.md) | [高棉語](../km/README.md) | [韓語](../ko/README.md) | [立陶宛語](../lt/README.md) | [馬來語](../ms/README.md) | [馬拉雅拉姆語](../ml/README.md) | [馬拉地語](../mr/README.md) | [尼泊爾語](../ne/README.md) | [奈及利亞皮欽語](../pcm/README.md) | [挪威語](../no/README.md) | [波斯語（法爾西）](../fa/README.md) | [波蘭語](../pl/README.md) | [葡萄牙語（巴西）](../pt-BR/README.md) | [葡萄牙語（葡萄牙）](../pt-PT/README.md) | [旁遮普語（Gurmukhi）](../pa/README.md) | [羅馬尼亞語](../ro/README.md) | [俄語](../ru/README.md) | [塞爾維亞語（西里爾字母）](../sr/README.md) | [斯洛伐克語](../sk/README.md) | [斯洛維尼亞語](../sl/README.md) | [西班牙語](../es/README.md) | [斯瓦希里語](../sw/README.md) | [瑞典語](../sv/README.md) | [塔加洛語（菲律賓）](../tl/README.md) | [泰米爾語](../ta/README.md) | [泰盧固語](../te/README.md) | [泰語](../th/README.md) | [土耳其語](../tr/README.md) | [烏克蘭語](../uk/README.md) | [烏爾都語](../ur/README.md) | [越南語](../vi/README.md)

> **想要在本機複製嗎？**
>
> 這個儲存庫包含 50 多種語言的翻譯，會顯著增加下載大小。若要在不包含翻譯的情況下複製，請使用稀疏簽出：
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
> 這樣可以更快速地下載，並仍然得到完成課程所需的所有內容。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 今天 azd 的最新功能

> 📌 本課程已根據 **`azd 1.25.6`**（2026 年 6 月）進行驗證。執行 `azd version` 檢查您的版本，並使用 `azd upgrade` 取得最新版本。

Azure Developer CLI 已超越傳統的 Web 應用和 API。如今，azd 是將「任何」應用部署到 Azure 的單一工具 —— 包括以 AI 為驅動的應用程式與智慧型代理。

這對你意味著：

- **AI 代理現在是第一等級的 azd 工作負載。** 您可以使用已熟悉的 `azd init` → `azd up` 工作流程來初始化、部署與管理 AI 代理專案。
- **從 CLI 完整管理代理生命週期。** `azure.ai.agents` 擴充套件現在涵蓋整個流程 — 使用 `azd ai agent init` 來產生範本、`azd ai agent invoke` 測試（並輸出回應時間）、`azd ai agent eval generate` 與 `azd ai agent optimize` 來衡量與改進品質，以及 `azd ai agent delete` 來清理。
- **更多 AI 建構模組。** 新的預覽擴充套件—`azure.ai.skills` 與 `azure.ai.connections`—讓您可直接使用 azd 管理可重用的代理技能與 Foundry 連線。
- **與 Microsoft Foundry 整合** 把模型部署、代理託管與 AI 服務設定直接帶入 azd 範本生態系。
- **日常使用更順暢。** 最近的版本讓 `azd init` 具備冪等性（可安全重複執行）、使 `azd auth login` 可自動清理過期權杖，並新增友善的 `azd tool` 首次執行設定提示。
- **核心工作流程未改變。** 無論您是部署待辦應用、微服務，或是多代理 AI 解決方案，指令都是相同的。

> **給 Aspire 使用者的說明：** 微軟現在將該產品簡稱為 **Aspire**（先前為 ".NET Aspire"）。azd 對 Aspire 的支援不變 —— 只有名稱更新。

如果您之前用過 azd，AI 支援只是自然的延伸 —— 不是另一套工具或進階路線。如果您是從頭開始，您將學會一套適用於所有情境的工作流程。

---

## 🚀 什麼是 Azure Developer CLI (azd)？

**Azure 開發者 CLI (azd)** 是為開發者設計的命令列工具，可簡化將應用部署到 Azure 的流程。您不需要手動建立與連接數十個 Azure 資源，就能用單一指令部署整個應用。

### `azd up` 的魔力

```bash
# 這個單一指令完成所有工作：
# ✅ 建立所有 Azure 資源
# ✅ 配置網絡和安全性
# ✅ 建置您的應用程式程式碼
# ✅ 部署到 Azure
# ✅ 提供您一個可用的網址
azd up
```

**就這樣！** 不需要點擊 Azure 入口網站、也不需先學習複雜的 ARM 範本、或進行手動設定 —— 只要把可運作的應用部署到 Azure。

---

## ❓ Azure Developer CLI 與 Azure CLI：有何不同？

這是新手最常問的問題。簡單的回答如下：

| 功能 | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| <strong>目的</strong> | 管理單一的 Azure 資源 | 部署完整應用 |
| <strong>思維模式</strong> | 基礎建設為主 | 應用為主 |
| <strong>範例</strong> | `az webapp create --name myapp...` | `azd up` |
| <strong>學習曲線</strong> | 需要了解 Azure 服務 | 只需了解您的應用 |
| <strong>適合對象</strong> | DevOps、基礎建設 | 開發者、原型開發 |

### 簡單類比

- **Azure CLI** 就像擁有建造房子所需的所有工具 —— 錘子、鋸子、釘子。您可以建造任何東西，但需要懂得建築。
- **Azure Developer CLI** 就像請了一個承包商 —— 您描述想要的東西，他們處理建造細節。

### 何時使用哪個工具

| 情境 | 使用 |
|----------|----------|
| 「我想快速部署我的網頁應用」 | `azd up` |
| 「我只需要建立一個儲存帳戶」 | `az storage account create` |
| 「我正在構建完整的 AI 應用」 | `azd init --template azure-search-openai-demo` |
| 「我需要偵錯特定的 Azure 資源」 | `az resource show` |
| 「我想在幾分鐘內完成可上線的部署」 | `azd up --environment production` |

### 它們可以一起使用！

AZD 在底層使用 Azure CLI。您可以兩者搭配使用：
```bash
# 使用 AZD 部署您的應用程式
azd up

# 然後使用 Azure CLI 微調特定資源
az webapp config set --name myapp --always-on true
```

---

## 🌟 在 Awesome AZD 找範本

別從頭開始！**Awesome AZD** 是社群收集的可立即部署範本集合：

| 資源 | 說明 |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | 瀏覽 200+ 範本並一鍵部署 |
| 🔗 [<strong>提交範本</strong>](https://github.com/Azure/awesome-azd/issues) | 向社群貢獻您的範本 |
| 🔗 [**GitHub 儲存庫**](https://github.com/Azure/awesome-azd) | 給星並探索來源 |

### Awesome AZD 的熱門 AI 範本

```bash
# 結合 Microsoft Foundry 模型與 AI 搜尋的 RAG 聊天
azd init --template azure-search-openai-demo

# 快速 AI 聊天應用程式
azd init --template openai-chat-app-quickstart

# 具備 Foundry 代理人的 AI 代理
azd init --template get-started-with-ai-agents
```

---

## 🎯 以 3 個步驟開始

在開始之前，請確認您的機器已為要部署的範本做好準備：

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

如果任何必要檢查失敗，請先修正那些問題，然後再繼續快速開始步驟。

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

### 步驟 2：為 AZD 認證

```bash
# 如果你打算在本課程中直接使用 Azure CLI 命令，這是可選的
az login

# AZD 工作流程必需
azd auth login
```

如果您不確定需要哪一種認證，請在 [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup) 中遵循完整的設定流程。

### 步驟 3：部署您的第一個應用

```bash
# 從範本初始化
azd init --template todo-nodejs-mongo

# 部署到 Azure（建立所有東西！）
azd up
```

**🎉 完成了！** 您的應用現在已在 Azure 上運行。

### 清理（別忘了！）

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 如何使用本課程

本課程以 <strong>漸進式學習</strong> 為設計原則 —— 從您熟悉的地方開始，逐步提升：

| 您的經驗 | 從這裡開始 |
|-----------------|------------|
| **完全沒接觸過 Azure** | [第 1 章：基礎](#-chapter-1-foundation--quick-start) |
| **懂 Azure、但不熟悉 AZD** | [第 1 章：基礎](#-chapter-1-foundation--quick-start) |
| **想部署 AI 應用** | [第 2 章：以 AI 為先的開發](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| <strong>想要實作練習</strong> | [🎓 互動工作坊](workshop/README.md) - 3-4 小時的實作引導 |
| <strong>需要生產級模式</strong> | [第 8 章：生產與企業](#-chapter-8-production--enterprise-patterns) |

### 快速設定

1. **Fork 此儲存庫**: [![GitHub 分叉](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. <strong>複製它</strong>: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. <strong>取得協助</strong>: [Azure Discord 社群](https://discord.com/invite/ByRwuEEgH4)

> **想要在本機複製嗎？**

> 這個儲存庫包含 50 多種語言的翻譯，會顯著增加下載大小。若要在不包含翻譯的情況下複製，請使用稀疏簽出：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 這樣可以更快速地下載，並仍然得到完成課程所需的所有內容。


## 課程總覽

透過結構化章節掌握 Azure Developer CLI (azd)。**特別著重於整合 Microsoft Foundry 的 AI 應用部署。**
### 為什麼這門課對現代開發人員至關重要

根據 Microsoft Foundry Discord 社群的見解，**45% 的開發人員想使用 AZD 來處理 AI 工作負載**，但遇到以下挑戰：
- 複雜的多服務 AI 架構
- 生產環境 AI 部署最佳實務  
- Azure AI 服務整合與設定
- AI 工作負載的成本最佳化
- 排查 AI 特定部署問題

### 學習目標

完成此結構化課程後，您將能：
- **精通 AZD 基礎**：核心概念、安裝與設定
- **部署 AI 應用程式**：在 AZD 中使用 Microsoft Foundry 服務
- <strong>實作基礎設施即程式碼</strong>：使用 Bicep 範本管理 Azure 資源
- <strong>排查部署問題</strong>：解決常見問題並進行偵錯
- <strong>為生產環境最佳化</strong>：安全、擴展、監控與成本管理
- <strong>建置多代理解決方案</strong>：部署複雜的 AI 架構

## 開始之前：帳戶、存取權與假設

在開始第 1 章之前，請確保您具備以下條件。指南後面的安裝步驟假設這些基礎已經處理完畢。

- **一個 Azure 訂閱**：您可以使用工作或個人帳戶中的現有訂閱，或建立一個 [免費試用](https://aka.ms/azurefreetrial) 開始使用。
- **建立 Azure 資源的權限**：對於大多數練習，您應至少在目標訂閱或資源群組上擁有 **Contributor** 存取權。某些章節可能還假設您可以建立資源群組、受控識別與 RBAC 指派。
- [**一個 GitHub 帳戶**](https://github.com)：這對 fork 倉庫、追蹤個人變更以及使用 GitHub Codespaces 參與工作坊很有幫助。
- <strong>範本執行環境先決條件</strong>：某些範本需要本機工具，例如 Node.js、Python、Java 或 Docker。在開始之前執行設定驗證工具以便早期發現缺少的工具。
- <strong>基本終端機使用熟悉度</strong>：您不需要成為專家，但應該能熟悉執行像 `git clone`、`azd auth login` 及 `azd up` 等指令。

> **在企業訂閱中工作？**
> 如果您的 Azure 環境由管理員管理，請事先確認您是否能在規劃使用的訂閱或資源群組中部署資源。若不能，請在開始前要求沙盒訂閱或 Contributor 存取權。

> **剛接觸 Azure？**
> 請使用您自己的 Azure 試用或按使用付費訂閱於 https://aka.ms/azurefreetrial 開始，這樣您就能在不必等候租戶級別批准的情況下完整完成練習。

## 🗺️ 課程導覽：按章節快速導航

每一章都有專屬的 README，內含學習目標、快速上手與練習：

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | 快速開始 | [AZD Basics](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [First Project](docs/chapter-01-foundation/first-project.md) | 30-45 分鐘 | ⭐ |
| **[Ch 2: AI Development](docs/chapter-02-ai-development/README.md)** | 以 AI 為先的應用 | [Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 小時 | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | 認證與安全 | [Configuration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 分鐘 | ⭐⭐ |
| **[Ch 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC 與部署 | [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 小時 | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI 代理方案 | [Retail Scenario](examples/retail-scenario.md) &#124; [Coordination Patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 小時 | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | 規劃與驗證 | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 小時 | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | 偵錯與修復 | [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 小時 | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | 企業模式 | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 小時 | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | 實作實驗室 | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 小時 | ⭐⭐ |

**總課程時長：** ~10-14 小時 | **技能進階：** 初學者 → 生產就緒

---

## 📚 學習章節

<em>根據經驗與目標選擇您的學習路徑</em>

### 🚀 第 1 章：基礎與快速上手
<strong>先決條件</strong>：Azure 訂閱、基本指令列操作知識  
<strong>時長</strong>：30-45 分鐘  
<strong>難度</strong>：⭐

#### 您將學到的內容
- 了解 Azure Developer CLI 的基本概念
- 在您的平台上安裝 AZD
- 您的第一次成功部署

#### 學習資源
- **🎯 從這裡開始**：[#what-is-azure-developer-cli](#what-is-azure-developer-cli)
- **📖 理論**： [AZD Basics](docs/chapter-01-foundation/azd-basics.md) - 核心概念與術語
- **⚙️ 設定**： [Installation & Setup](docs/chapter-01-foundation/installation.md) - 平台專屬指南
- **🛠️ 實作**： [Your First Project](docs/chapter-01-foundation/first-project.md) - 逐步教學
- **📋 快速參考**： [Command Cheat Sheet](resources/cheat-sheet.md)

#### 實作練習
```bash
# 快速安裝檢查
azd version

# 部署您的第一個應用程式
azd init --template todo-nodejs-mongo
azd up
```

**💡 章節成果**：使用 AZD 成功部署一個簡單的 Web 應用程式到 Azure

**✅ 成功驗證：**
```bash
# 完成第 1 章後，您應該能夠：
azd version              # 顯示已安裝的版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署到 Azure
azd show                # 顯示執行中應用程式的 URL
# 應用程式會在瀏覽器中開啟並正常運作
azd down --force --purge  # 清理資源
```

**📊 時間投入：** 30-45 分鐘  
**📈 完成後的技能等級：** 能夠獨立部署基礎應用程式
**📈 完成後的技能等級：** 能夠獨立部署基礎應用程式

---

### 🤖 第 2 章：以 AI 為先的開發（建議 AI 開發者）
<strong>先決條件</strong>：完成第 1 章  
<strong>時長</strong>：1-2 小時  
<strong>難度</strong>：⭐⭐

#### 您將學到的內容
- Microsoft Foundry 與 AZD 的整合
- 部署具 AI 功能的應用程式
- 理解 AI 服務的設定

#### 學習資源
- **🎯 從這裡開始**： [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI 代理**： [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - 使用 AZD 部署智慧代理
- **📖 範式**： [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) - 部署與管理 AI 模型
- **🛠️ 工作坊**： [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - 讓您的 AI 解決方案符合 AZD
- **🎥 互動指南**： [Workshop Materials](workshop/README.md) - 基於瀏覽器的學習，使用 MkDocs * DevContainer Environment
- **📋 範本**： [Microsoft Foundry Templates](#工作坊資源)
- **📝 範例**： [AZD Deployment Examples](examples/README.md)

#### 實作練習
```bash
# 部署你的第一個 AI 應用程式
azd init --template azure-search-openai-demo
azd up

# 試試其他 AI 範本
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 章節成果**：部署並設定一個具有 RAG 功能的 AI 聊天應用程式

**✅ 成功驗證：**
```bash
# 完成第2章後，你應該能夠：
azd init --template azure-search-openai-demo
azd up
# 測試 AI 聊天介面
# 提出問題並獲得由 AI 提供、附有來源的回應
# 確認搜尋整合運作正常
azd monitor  # 檢查 Application Insights 是否顯示遙測資料
azd down --force --purge
```

**📊 時間投入：** 1-2 小時  
**📈 完成後的技能等級：** 能夠部署與設定生產就緒的 AI 應用程式  
**💰 成本意識：** 了解開發者環境每月 $80-150 的成本，以及生產環境每月 $300-3500 的成本範圍

#### 💰 AI 部署的成本考量

**開發環境（估計 $80-150/月）：**
- Microsoft Foundry Models (Pay-as-you-go)：$0-50/月（根據 token 使用量）
- AI Search (Basic tier)：$75/月
- Container Apps (Consumption)：$0-20/月
- Storage (Standard)：$1-5/月

**生產環境（估計 $300-3,500+/月）：**
- Microsoft Foundry Models (PTU 以維持一致效能)：$3,000+/月 或 高流量時採 Pay-as-you-go
- AI Search (Standard tier)：$250/月
- Container Apps (Dedicated)：$50-100/月
- Application Insights：$5-50/月
- Storage (Premium)：$10-50/月

**💡 成本優化建議：**
- 學習時使用 <strong>免費額度</strong> 的 Microsoft Foundry Models（Azure OpenAI 每月包含 50,000 tokens）
- 在非開發階段執行 `azd down` 以解除配置資源
- 初期使用按用量計費，僅在生產時升級為 PTU
- 使用 `azd provision --preview` 在部署前估算成本
- 啟用自動擴展：只為實際使用付費

**成本監控：**
```bash
# 檢查預估的每月費用
azd provision --preview

# 在 Azure 入口網站監控實際費用
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第 3 章：設定與認證
<strong>先決條件</strong>：完成第 1 章  
<strong>時長</strong>：45-60 分鐘  
<strong>難度</strong>：⭐⭐

#### 您將學到的內容
- 環境設定與管理
- 認證與安全最佳實務
- 資源命名與組織

#### 學習資源
- **📖 設定**： [Configuration Guide](docs/chapter-03-configuration/configuration.md) - 環境設定
- **🔐 安全**： [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - 認證模式
- **📝 範例**： [Database App Example](examples/database-app/README.md) - AZD 資料庫範例

#### 實作練習
- 設定多個環境（dev、staging、prod）
- 設定受控識別（managed identity）認證
- 實作環境專屬配置

**💡 章節成果**：使用適當的認證與安全性管理多個環境

---

### 🏗️ 第 4 章：基礎設施即程式碼與部署
<strong>先決條件</strong>：完成第 1 至第 3 章  
<strong>時長</strong>：1-1.5 小時  
<strong>難度</strong>：⭐⭐⭐

#### 您將學到的內容
- 進階部署模式
- 使用 Bicep 的基礎設施即程式碼
- 資源佈建策略

#### 學習資源
- **📖 部署**： [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - 完整工作流程
- **🏗️ 佈建**： [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Azure 資源管理
- **📝 範例**： [Container App Example](../../examples/container-app) - 容器化部署範例

#### 實作練習
- 建立自訂 Bicep 範本
- 部署多服務應用程式
- 實作藍綠部署策略

**💡 章節成果**：使用自訂基礎設施範本部署複雜的多服務應用程式

---
### 🎯 第五章：多代理 AI 解決方案（進階）
<strong>先決條件</strong>: 第1-2章 已完成  
<strong>持續時間</strong>: 2-3 小時  
<strong>複雜度</strong>: ⭐⭐⭐⭐

#### 你將學到的內容
- 多代理架構模式
- 代理編排與協調
- 生產環境就緒的 AI 部署

#### 學習資源
- **🤖 精選專案**: [零售多代理解決方案](examples/retail-scenario.md) - 完整實作
- **🛠️ ARM 範本**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - 一鍵部署
- **📖 架構**: [多代理協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) - 模式

#### 實作練習
```bash
# 部署完整的零售多代理解決方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索代理設定
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 章節成果**: 部署並管理一個生產就緒的多代理 AI 解決方案，包含 Customer 與 Inventory 代理

---

### 🔍 第六章：預部署驗證與規劃
<strong>先決條件</strong>: 第4章 已完成  
<strong>持續時間</strong>: 1 小時  
<strong>複雜度</strong>: ⭐⭐

#### 你將學到的內容
- 容量規劃與資源驗證
- SKU 選擇策略
- 預檢查與自動化

#### 學習資源
- **📊 規劃**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - 資源驗證
- **💰 選擇**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - 成本效益選擇
- **✅ 驗證**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - 自動化腳本

#### 實作練習
- 執行容量驗證腳本
- 優化 SKU 選擇以節省成本
- 實作自動化的預部署檢查

**💡 章節成果**: 在執行前驗證並優化部署

---

### 🚨 第七章：故障排除與除錯
<strong>先決條件</strong>: 完成任一部署章節  
<strong>持續時間</strong>: 1-1.5 小時  
<strong>複雜度</strong>: ⭐⭐

#### 你將學到的內容
- 系統化的除錯方法
- 常見問題與解決方案
- AI 專屬疑難排解

#### 學習資源
- **🔧 常見問題**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - 常見問答與解法
- **🕵️ 除錯**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - 逐步策略
- **🤖 AI 問題**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI 服務相關問題

#### 實作練習
- 診斷部署失敗
- 解決驗證/認證問題
- 偵錯 AI 服務連線

**💡 章節成果**: 能獨立診斷並解決常見部署問題

---

### 🏢 第八章：生產與企業模式
<strong>先決條件</strong>: 第1-4章 已完成  
<strong>持續時間</strong>: 2-3 小時  
<strong>複雜度</strong>: ⭐⭐⭐⭐

#### 你將學到的內容
- 生產部署策略
- 企業安全模式
- 監控與成本最佳化

#### 學習資源
- **🏭 生產**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - 企業模式
- **📝 範例**: [Microservices Example](../../examples/microservices) - 複雜架構
- **📊 監控**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - 監控

#### 實作練習
- 實作企業級安全模式
- 設定完整的監控
- 以適當治理部署至生產環境

**💡 章節成果**: 部署具備完整生產能力的企業級應用

---

## 🎓 工作坊概覽：動手學習體驗

> **⚠️ 工作坊狀態：開發中**  
> 工作坊教材目前正在開發與精修中。核心模組已可運作，但部分進階章節尚未完成。我們正積極完成所有內容。[追蹤進度 →](workshop/README.md)

### 互動式工作坊教材
<strong>提供以瀏覽器為基礎工具與指導練習的完整動手學習體驗</strong>

我們的工作坊教材提供結構化的互動學習體驗，與上述章節式課程互相補充。工作坊適合自學及帶領式教學。

#### 🛠️ 工作坊特色
- <strong>瀏覽器介面</strong>: 完整的 MkDocs 驅動工作坊，具搜尋、複製及主題功能
- **GitHub Codespaces 整合**: 一鍵建立開發環境
- <strong>結構化學習路徑</strong>: 8 模組引導練習（總時長 3-4 小時）
- <strong>漸進式方法論</strong>: 介紹 → 選擇 → 驗證 → 解構 → 設定 → 客製化 → 清除 → 總結
- **互動式 DevContainer 環境**: 預先配置的工具與相依性

#### 📚 工作坊模組結構
工作坊遵循一個 **8 模組的漸進方法論**，帶你從探索到部署精通：

| 模組 | 主題 | 你會做什麼 | 時長 |
|--------|-------|----------------|----------|
| **0. 介紹** | 工作坊概覽 | 了解學習目標、先決條件與工作坊結構 | 15 分鐘 |
| **1. 選擇** | 範本探索 | 探索 AZD 範本並為你的情境選擇合適的 AI 範本 | 20 分鐘 |
| **2. 驗證** | 部署與驗證 | 使用 `azd up` 部署範本並驗證基礎設施運作 | 30 分鐘 |
| **3. 解構** | 理解結構 | 使用 GitHub Copilot 探索範本架構、Bicep 檔案與程式碼組織 | 30 分鐘 |
| **4. 設定** | 深入研讀 azure.yaml | 精通 `azure.yaml` 設定、生命週期掛勾與環境變數 | 30 分鐘 |
| **5. 客製化** | 將其變成你的專案 | 啟用 AI Search、追蹤、評估，並針對你的情境進行自訂 | 45 分鐘 |
| **6. 清除** | 清理 | 使用 `azd down --purge` 安全移除資源 | 15 分鐘 |
| **7. 總結** | 後續步驟 | 檢視成果、關鍵概念，並延續你的學習旅程 | 15 分鐘 |

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
# 按一下儲存庫中的「Code」→「Create codespace on main」

# 選項 2：本機開發
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 遵循 workshop/README.md 中的設定說明
```

#### 🎯 工作坊學習成果
完成工作坊後，參與者將能：
- **部署生產級 AI 應用**: 使用 AZD 搭配 Microsoft Foundry 服務
- <strong>精通多代理架構</strong>: 實作協調的 AI 代理解決方案
- <strong>實作安全最佳實務</strong>: 設定驗證與存取控制
- <strong>為擴展性最佳化</strong>: 設計具成本效益且高效能的部署
- <strong>除錯部署</strong>: 能獨立解決常見問題

#### 📖 工作坊資源
- **🎥 互動指南**: [Workshop Materials](workshop/README.md) - 瀏覽器式學習環境
- **📋 模組逐步教學**:
  - [0. 介紹](workshop/docs/instructions/0-Introduction.md) - 工作坊概覽與目標
  - [1. 選擇](workshop/docs/instructions/1-Select-AI-Template.md) - 尋找並選取 AI 範本
  - [2. 驗證](workshop/docs/instructions/2-Validate-AI-Template.md) - 部署並驗證範本
  - [3. 解構](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - 探索範本架構
  - [4. 設定](workshop/docs/instructions/4-Configure-AI-Template.md) - 精通 `azure.yaml`
  - [5. 客製化](workshop/docs/instructions/5-Customize-AI-Template.md) - 針對你的情境自訂
  - [6. 清除](workshop/docs/instructions/6-Teardown-Infrastructure.md) - 清理資源
  - [7. 總結](workshop/docs/instructions/7-Wrap-up.md) - 檢視與後續步驟
- **🛠️ AI 工作坊實驗室**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - 以 AI 為主的練習
- **💡 快速開始**: [Workshop Setup Guide](workshop/README.md#quick-start) - 環境設定

<strong>適合對象</strong>: 企業訓練、大學課程、自學，以及開發者訓練營。

---

## 📖 深度探討：AZD 能力

除了基礎功能外，AZD 還提供針對生產部署的強大功能：

- <strong>基於範本的部署</strong> - 使用預建範本來因應常見的應用程式模式
- <strong>基礎設施即程式碼</strong> - 使用 Bicep 或 Terraform 管理 Azure 資源  
- <strong>整合式工作流程</strong> - 無縫地佈建、部署與監控應用程式
- <strong>開發者友善</strong> - 針對開發者生產力與體驗最佳化

### **AZD + Microsoft Foundry：AI 部署的最佳選擇**

**為什麼選擇 AZD 作為 AI 解決方案？** AZD 解決了 AI 開發者面臨的主要挑戰：

- **AI 就緒範本** - 為 Microsoft Foundry 模型、Azure AI 服務與機器學習工作負載預先配置的範本
- **安全的 AI 部署** - 內建 AI 服務、API 金鑰與模型端點的安全模式  
- **生產級 AI 模式** - 可擴展且具成本效益的 AI 應用部署最佳實務
- **端對端 AI 工作流程** - 從模型開發到生產部署並搭配適當監控
- <strong>成本優化</strong> - 針對 AI 工作負載的智慧資源配置與自動擴充策略
- **Microsoft Foundry 整合** - 與 Microsoft Foundry 模型目錄與端點的無縫連線

---

## 🎯 範本與範例庫

### 精選：Microsoft Foundry 範本
**如果你要部署 AI 應用，從這裡開始！**

> **注意：** 這些範本示範各種 AI 模式。有些屬於外部的 Azure Samples，其他則為本地實作。

| 範本 | 章節 | 複雜度 | 服務 | 類型 |
|----------|---------|------------|----------|------|
| [**開始使用 AI 聊天**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第 2 章 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | 外部 |
| [**開始使用 AI 代理**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第 2 章 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| 外部 |
| [**Azure Search + OpenAI 範例**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第 2 章 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | 外部 |
| [**OpenAI 聊天應用 快速入門**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第 2 章 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第 5 章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 第 8 章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | 外部 |
| [<strong>零售多代理解決方案</strong>](examples/retail-scenario.md) | 第 5 章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | <strong>本地</strong> |

### 精選：完整學習情境
<strong>對應到學習章節的生產就緒應用範本</strong>

| 範本 | 學習章節 | 複雜度 | 主要學習 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第 2 章 | ⭐ | 基本 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第 2 章 | ⭐⭐ | 使用 Azure AI Search 的 RAG 實作 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第 4 章 | ⭐⭐ | 文件智慧整合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第 5 章 | ⭐⭐⭐ | 代理框架與函式呼叫 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第 8 章 | ⭐⭐⭐ | 企業級 AI 編排 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第 5 章 | ⭐⭐⭐⭐ | 客戶與庫存代理的多代理架構 |

### 透過範例學習類型

> **📌 本地 vs. 外部 範例：**  
> <strong>本地範例</strong> (在此 repo 中) = 可立即使用  
> <strong>外部範例</strong> (Azure Samples) = 從連結的儲存庫複製

#### 本地範例（可立即使用）
- [<strong>零售多代理解決方案</strong>](examples/retail-scenario.md) - 完整生產就緒實作，附 ARM 範本
  - 多代理架構（Customer + Inventory 代理）
  - 完整的監控與評估
  - 透過 ARM 範本一鍵部署

#### 本地範例 - 容器應用（第 2-5 章）
**此儲存庫中的完整容器部署範例：**
- [<strong>容器應用範例</strong>](examples/container-app/README.md) - 容器化部署完整指南
  - [簡單 Flask API](../../examples/container-app/simple-flask-api) - 可縮放至零的基本 REST API
  - [微服務架構](../../examples/container-app/microservices) - 生產就緒的多服務部署
  - 快速入門、生產與進階部署模式
  - 監控、安全與成本優化指南

#### 外部範例 - 簡單應用（第1-2章）
**複製這些 Azure 範例儲存庫以開始：**
- [簡單 Web 應用 - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本部署模式
- [靜態網站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 靜態內容部署
- [容器應用 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署

#### 外部範例 - 資料庫整合（第3-4章）  
- [資料庫應用 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 資料庫連線模式
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 無伺服器資料工作流程

#### 外部範例 - 進階模式（第4-8章）
- [Java 微服務](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服務架構
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - 背景處理  
- [企業級 ML 管道](https://github.com/Azure-Samples/mlops-v2) - 生產就緒的機器學習模式

### 外部範本集合
- [**官方 AZD 範本庫**](https://azure.github.io/awesome-azd/) - 精選的官方與社群範本集合
- [**Azure 開發者 CLI 範本**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 範本文件
- [<strong>範例目錄</strong>](examples/README.md) - 本地學習範例與詳細說明

---

## 📚 學習資源與參考資料

### 快速參考
- [<strong>命令速查表</strong>](resources/cheat-sheet.md) - 按章節整理的重要 azd 指令
- [<strong>術語表</strong>](resources/glossary.md) - Azure 與 azd 術語  
- [<strong>常見問題</strong>](resources/faq.md) - 按學習章節分類的常見問題
- [<strong>學習指南</strong>](resources/study-guide.md) - 全面的實作練習

### 實作工作坊
- [**AI 工作坊實驗室**](docs/chapter-02-ai-development/ai-workshop-lab.md) - 讓你的 AI 解決方案可透過 AZD 部署（2-3 小時）
- [<strong>互動式工作坊</strong>](workshop/README.md) - 使用 MkDocs 與 GitHub Codespaces 的 8 個模組引導練習
  - 流程：介紹 → 選擇 → 驗證 → 分解 → 設定 → 客製化 → 拆除 → 結語

### 外部學習資源
- [Azure 開發者 CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 價格計算器](https://azure.microsoft.com/pricing/calculator/)
- [Azure 狀態](https://status.azure.com/)

### 供編輯器使用的 AI 代理技能
- [**skills.sh 上的 Microsoft Azure 技能**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 個開放代理技能，涵蓋 Azure AI、Foundry、部署、診斷、成本優化等。可安裝於 GitHub Copilot、Cursor、Claude Code 或任何支援的代理：
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 快速疑難排解指南

**新手常見問題與立即解決方法：**

<details>
<summary><strong>❌ "azd：找不到命令"</strong></summary>

```bash
# 先安裝 AZD
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
<summary><strong>❌ "未找到訂閱" 或 "訂閱未設定"</strong></summary>

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
<summary><strong>❌ "配額不足" 或 "超出配額"</strong></summary>

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
# 清除並重試
azd down --force --purge
azd up

# 僅修復基礎架構
azd provision

# 檢查詳細狀態
azd show

# 在 Azure Monitor 檢查日誌
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "驗證失敗" 或 "Token 已過期"</strong></summary>

```bash
# 為 AZD 重新驗證
azd auth logout
azd auth login

# 可選：如果您正在執行 az 命令，也可同時重新整理 Azure CLI
az logout
az login

# 驗證身份
az account show
```
</details>

<details>
<summary><strong>❌ "資源已存在" 或 命名衝突</strong></summary>

```bash
# AZD 會產生唯一名稱，但若發生衝突：
azd down --force --purge

# 則以全新環境重試
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 範本部署花費太久</strong></summary>

**正常等待時間：**
- 簡單網頁應用：5-10 分鐘
- 含資料庫的應用：10-15 分鐘
- AI 應用：15-25 分鐘（OpenAI 佈建較慢）

```bash
# 檢查進度
azd show

# 若卡住超過 30 分鐘，請檢查 Azure 入口網站:
azd monitor --overview
# 尋找失敗的部署
```
</details>

<details>
<summary><strong>❌ "權限不足" 或 "禁止存取"</strong></summary>

```bash
# 檢查你在 Azure 的角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 你至少需要「Contributor」角色
# 請求你的 Azure 管理員授予：
# - Contributor（用於資源）
# - User Access Administrator（用於角色指派）
```
</details>

<details>
<summary><strong>❌ 找不到已部署的應用程式 URL</strong></summary>

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

### 📚 完整疑難排解資源

- **常見問題指南：** [詳細解決方案](docs/chapter-07-troubleshooting/common-issues.md)
- **AI 專屬問題：** [AI 疑難排解](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **除錯指南：** [逐步除錯](docs/chapter-07-troubleshooting/debugging.md)
- **求助管道：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 課程結業與認證

### 進度追蹤
追蹤你在各章節的學習進度：

- [ ] **第1章**: 基礎與快速入門 ✅
- [ ] **第2章**: AI 優先開發 ✅  
- [ ] **第3章**: 設定與驗證 ✅
- [ ] **第4章**: 基礎架構即程式碼與部署 ✅
- [ ] **第5章**: 多代理 AI 解決方案 ✅
- [ ] **第6章**: 部署前驗證與規劃 ✅
- [ ] **第7章**: 疑難排解與除錯 ✅
- [ ] **第8章**: 生產與企業模式 ✅

### 學習驗證
完成每章後，透過以下方式驗證你的知識：
1. <strong>實作練習</strong>：完成本章的實作部署
2. <strong>知識檢核</strong>：檢閱本章的常見問題章節
3. <strong>社群討論</strong>：在 Azure Discord 分享你的經驗
4. <strong>下一章</strong>：前往更高一級的難度

### 課程完成後的好處
完成所有章節後，你將獲得：
- <strong>實務上線經驗</strong>：將真實的 AI 應用部署到 Azure
- <strong>專業技能</strong>：具備企業就緒的部署能力  
- <strong>社群認可</strong>：成為活躍的 Azure 開發者社群成員
- <strong>職涯提升</strong>：掌握熱門的 AZD 與 AI 部署專業技能

---

## 🤝 社群與支援

### 尋求協助與支援
- <strong>技術問題</strong>： [回報錯誤與功能需求](https://github.com/microsoft/azd-for-beginners/issues)
- <strong>學習問題</strong>： [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) 與 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 專屬協助**：加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- <strong>文件</strong>： [官方 Azure 開發者 CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### 來自 Microsoft Foundry Discord 的社群洞察

**#Azure 頻道的最近投票結果：**
- **45%** 的開發者希望將 AZD 用於 AI 工作負載
- <strong>主要挑戰</strong>：多服務部署、憑證管理、上線準備  
- <strong>最多被要求</strong>：AI 專用範本、疑難排解指南、最佳實務

**加入我們的社群以：**
- 分享你的 AZD + AI 經驗並獲得協助
- 取得新 AI 範本的搶先預覽
- 為 AI 部署最佳實務做出貢獻
- 影響未來 AI + AZD 功能的開發

### 對課程的貢獻
我們歡迎貢獻！請閱讀我們的 [Contributing Guide](CONTRIBUTING.md) 以了解詳細資訊：
- <strong>內容改進</strong>：增強現有章節與範例
- <strong>新增範例</strong>：加入真實情境與範本  
- <strong>翻譯</strong>：協助維護多語支援
- <strong>錯誤回報</strong>：提升準確性與清晰度
- <strong>社群準則</strong>：遵守我們的包容性社群指引

---

## 📄 課程資訊

### 授權
本專案採用 MIT 授權 - 詳情請見 [LICENSE](../../LICENSE) 檔案。

### 相關的 Microsoft 學習資源

我們團隊亦製作其他完整的學習課程：

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
 
### Generative AI Series
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### 核心學習
[![機器學習入門](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![數據科學入門](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI 入門](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![網絡安全入門](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
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

## 🗺️ 課程導航

**🚀 準備好開始學習了嗎？**

<strong>初學者</strong>: 從 [第 1 章：基礎與快速入門](#-chapter-1-foundation--quick-start)  開始  
**AI 開發者**: 跳到 [第 2 章：以 AI 為先的開發](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
<strong>有經驗的開發者</strong>: 從 [第 3 章：設定與驗證](#️-chapter-3-configuration--authentication) 開始

<strong>下一步</strong>: [開始第 1 章 - AZD 基礎](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->