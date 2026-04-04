# AZD 初學者指南：結構化學習歷程

![AZD-for-beginners](../../translated_images/zh-TW/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 自動翻譯（始終保持最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[阿拉伯語](../ar/README.md) | [孟加拉語](../bn/README.md) | [保加利亞語](../bg/README.md) | [緬甸語（緬甸）](../my/README.md) | [中文（簡體）](../zh-CN/README.md) | [中文（繁體，香港）](../zh-HK/README.md) | [中文（繁體，澳門）](../zh-MO/README.md) | [中文（繁體，臺灣）](./README.md) | [克羅埃西亞語](../hr/README.md) | [捷克語](../cs/README.md) | [丹麥語](../da/README.md) | [荷蘭語](../nl/README.md) | [愛沙尼亞語](../et/README.md) | [芬蘭語](../fi/README.md) | [法語](../fr/README.md) | [德語](../de/README.md) | [希臘語](../el/README.md) | [希伯來語](../he/README.md) | [印地語](../hi/README.md) | [匈牙利語](../hu/README.md) | [印度尼西亞語](../id/README.md) | [義大利語](../it/README.md) | [日語](../ja/README.md) | [卡納達語](../kn/README.md) | [高棉語](../km/README.md) | [韓語](../ko/README.md) | [立陶宛語](../lt/README.md) | [馬來語](../ms/README.md) | [馬拉雅拉姆語](../ml/README.md) | [馬拉地語](../mr/README.md) | [尼泊爾語](../ne/README.md) | [尼日利亞皮欽語](../pcm/README.md) | [挪威語](../no/README.md) | [波斯語（法爾西語）](../fa/README.md) | [波蘭語](../pl/README.md) | [葡萄牙語（巴西）](../pt-BR/README.md) | [葡萄牙語（葡萄牙）](../pt-PT/README.md) | [旁遮普語（古魯穆奇體）](../pa/README.md) | [羅馬尼亞語](../ro/README.md) | [俄語](../ru/README.md) | [塞爾維亞語（西里爾字母）](../sr/README.md) | [斯洛伐克語](../sk/README.md) | [斯洛維尼亞語](../sl/README.md) | [西班牙語](../es/README.md) | [斯瓦希里語](../sw/README.md) | [瑞典語](../sv/README.md) | [他加祿語（菲律賓語）](../tl/README.md) | [泰米爾語](../ta/README.md) | [泰盧固語](../te/README.md) | [泰語](../th/README.md) | [土耳其語](../tr/README.md) | [烏克蘭語](../uk/README.md) | [烏爾都語](../ur/README.md) | [越南語](../vi/README.md)

> **偏好本地克隆？**
>
> 此存儲庫包含 50 多種語言的翻譯，這會顯著增加下載大小。若要克隆且不包含翻譯，請使用稀疏檢出：
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
> 這樣您可以更快下載並取得完成課程所需的一切。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 azd 今日新功能

Azure Developer CLI 已超越傳統的 Web 應用和 API。現在，azd 是部署 <strong>任何</strong> Azure 應用程序的單一工具——包含 AI 驅動的應用和智能代理。

這對您意味著：

- **AI 代理現在是首要的 azd 工作負載。** 您可以使用熟悉的 `azd init` → `azd up` 工作流程初始化、部署和管理 AI 代理專案。
- **Microsoft Foundry 集成** 將模型部署、代理託管及 AI 服務配置直接融合進 azd 範本生態系。
- **核心工作流程未變。** 不論您是部署待辦清單應用、微服務或多代理 AI 解決方案，指令都是相同的。

如果您之前用過 azd，AI 支援是自然延伸——而非另外一個工具或進階路徑。如果是新手，您學會的唯一工作流程可應用於所有情境。

---

## 🚀 什麼是 Azure Developer CLI (azd)？

**Azure Developer CLI (azd)** 是一款開發者友善的命令列工具，使部署應用於 Azure 更簡單。您無需手動建立和連接數十個 Azure 資源，而是用單一指令部署整個應用。

### `azd up` 的魔法

```bash
# 這個指令就能完成所有工作：
# ✅ 建立所有 Azure 資源
# ✅ 設定網路與安全性
# ✅ 建置你的應用程式程式碼
# ✅ 部署到 Azure
# ✅ 給你一個可用的 URL
azd up
```

**就是這樣！** 無需點擊 Azure 入口網站、無需先學複雜的 ARM 範本、無需手動設定——直接讓應用在 Azure 運行。

---

## ❓ Azure Developer CLI 與 Azure CLI：有何不同？

這是初學者最常問的問題。簡單回答如下：

| 功能 | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| <strong>目的</strong> | 管理單一 Azure 資源 | 部署完整應用程式 |
| <strong>思維角度</strong> | 基礎設施導向 | 應用程式導向 |
| <strong>示例</strong> | `az webapp create --name myapp...` | `azd up` |
| <strong>學習曲線</strong> | 必須了解 Azure 服務 | 只要了解您的應用 |
| <strong>適用對象</strong> | DevOps、基礎架構 | 開發者、原型設計 |

### 簡單比喻

- **Azure CLI** 就像擁有所有建造房屋的工具—錘子、鋸子、釘子。您能建造任何東西，但需要懂得建築。
- **Azure Developer CLI** 就像找承包商—您描述想法，他們幫您建造。

### 何時使用哪個？

| 場景 | 選用 |
|----------|----------|
| 「我想快速部署網頁應用」 | `azd up` |
| 「我需要只建立一個儲存帳戶」 | `az storage account create` |
| 「我正在建立完整 AI 應用」 | `azd init --template azure-search-openai-demo` |
| 「我需要除錯特定 Azure 資源」 | `az resource show` |
| 「我想要幾分鐘內生產就緒部署」 | `azd up --environment production` |

### 他們可以一起使用！

AZD 在底層使用 Azure CLI。您可同時使用兩者：
```bash
# 使用 AZD 部署您的應用程式
azd up

# 然後使用 Azure CLI 微調特定資源
az webapp config set --name myapp --always-on true
```

---

## 🌟 在 Awesome AZD 尋找範本

不用從零開始！**Awesome AZD** 是社群收集的即時部署範本集：

| 資源 | 描述 |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | 瀏覽 200 多個範本並一鍵部署 |
| 🔗 [<strong>提交範本</strong>](https://github.com/Azure/awesome-azd/issues) | 向社群貢獻您的範本 |
| 🔗 [**GitHub 倉庫**](https://github.com/Azure/awesome-azd) | 按星標並探索原始碼 |

### Awesome AZD 熱門 AI 範本

```bash
# 結合 Microsoft Foundry 模型與 AI 搜尋 的 RAG 聊天
azd init --template azure-search-openai-demo

# 快速 AI 聊天應用程式
azd init --template openai-chat-app-quickstart

# 使用 Foundry Agents 的 AI 代理
azd init --template get-started-with-ai-agents
```

---

## 🎯 3 步快速上手

開始之前，請確保您的電腦已準備好部署您想用的範本：

**Windows：**
```powershell
.\validate-setup.ps1
```

**macOS / Linux：**
```bash
bash ./validate-setup.sh
```

若有必要的檢查失敗，請先修正再繼續快速上手。

### 第一步：安裝 AZD（2 分鐘）

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

### 第二步：AZD 認證

```bash
# 如果您計畫在本課程中直接使用 Azure CLI 命令，則為可選
az login

# AZD 工作流程所需
azd auth login
```

如果不確定用哪一個，請依照 [安裝與設定](docs/chapter-01-foundation/installation.md#authentication-setup) 內的完整設定流程操作。

### 第三步：部署您的第一個應用

```bash
# 從範本初始化
azd init --template todo-nodejs-mongo

# 部署到 Azure（會建立所有資源！）
azd up
```

**🎉 完成了！** 您的應用已在 Azure 上線。

### 清理環境（別忘了！）

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 如何使用本課程

本課程設計為 <strong>循序漸進學習</strong> — 從您熟悉的開始，逐步往上學習：

| 您的經驗 | 從這裡開始 |
|-----------------|------------|
| **完全沒接觸過 Azure** | [第一章：基礎](#-chapter-1-foundation--quick-start) |
| **了解 Azure、新手 AZD** | [第一章：基礎](#-chapter-1-foundation--quick-start) |
| **想部署 AI 應用** | [第二章：AI 優先開發](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| <strong>想要實戰練習</strong> | [🎓 互動工作坊](workshop/README.md) - 3-4 小時引導式實驗 |
| <strong>需要生產實務模式</strong> | [第八章：生產與企業](#-chapter-8-production--enterprise-patterns) |

### 快速設定

1. **Fork 本倉庫**：[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone 它**：`git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. <strong>尋求協助</strong>：[Azure Discord 社群](https://discord.com/invite/ByRwuEEgH4)

> **偏好本地克隆？**

> 此存儲庫包含 50 多種語言的翻譯，會大幅增加下載大小。要無翻譯克隆請用稀疏檢出：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
這樣您能快速下載並取得完成課程所需一切。

## 課程總覽

透過結構化章節掌握 Azure Developer CLI (azd)，設計為循序漸進學習。**特別聚焦於透過 Microsoft Foundry 集成部署 AI 應用。**

### 為何本課程對現代開發者不可或缺

根據 Microsoft Foundry Discord 社群見解，**45% 開發者想用 AZD 部署 AI 工作負載**，但面臨以下挑戰：
- 複雜多服務 AI 架構
- 生產 AI 部署最佳實務
- Azure AI 服務整合與配置
- AI 工作負載成本優化
- AI 部署特定問題排除

### 學習目標

完成本結構化課程後，您將：
- **精通 AZD 基礎**：核心概念、安裝及設定
- **部署 AI 應用**：使用 AZD 與 Microsoft Foundry 服務
- <strong>實作基礎設施即程式碼</strong>：透過 Bicep 範本管理 Azure 資源
- <strong>排解部署問題</strong>：解決常見錯誤與除錯
- <strong>優化生產環境</strong>：安全、擴展、監控及成本管理
- <strong>打造多代理方案</strong>：部署複雜 AI 架構

## 開始前準備：帳戶、存取與假設

開始第 1 章前，請確保已準備以下條件。本指南後續安裝步驟假設這些基本條件已經滿足。
- **Azure 訂閱**：您可以使用工作帳戶或個人帳戶中的現有訂閱，或建立[免費試用](https://aka.ms/azurefreetrial)以開始使用。
- **建立 Azure 資源的權限**：對於大多數練習，您需要在目標訂閱或資源群組上至少擁有<strong>參與者</strong>權限。有些章節也可能假設您可以建立資源群組、受管身分識別和 RBAC 指派。
- [**GitHub 帳戶**](https://github.com)：這對分叉存放庫、追蹤個人變更，以及在工作坊中使用 GitHub Codespaces 非常有用。
- <strong>範本執行前置條件</strong>：某些範本需要本地工具，如 Node.js、Python、Java 或 Docker。開始前請先執行設定驗證器，以便及早發現缺少的工具。
- <strong>基本終端機熟悉度</strong>：不需要是專家，但您應該能夠執行像 `git clone`、`azd auth login` 和 `azd up` 等指令。

> **在企業訂閱中工作？**  
> 如果您的 Azure 環境由管理員管理，請事先確認您是否能在計劃使用的訂閱或資源群組中部署資源。如果不能，請在開始前申請沙盒訂閱或參與者權限。

> **Azure 新手？**  
> 請從自己的 Azure 試用或付費訂閱 https://aka.ms/azurefreetrial 開始，這樣您可以完整完成練習，不需等待租戶層級的批准。

## 🗺️ 課程地圖：章節快速導航

每個章節都有專屬 README，包含學習目標、快速開始與練習：

| 章節 | 主題 | 課程 | 時長 | 複雜度 |
|---------|-------|---------|----------|------------|
| **[第 1 章：基礎](docs/chapter-01-foundation/README.md)** | 入門 | [AZD 基本概念](docs/chapter-01-foundation/azd-basics.md) &#124; [安裝](docs/chapter-01-foundation/installation.md) &#124; [第一個專案](docs/chapter-01-foundation/first-project.md) | 30-45 分鐘 | ⭐ |
| **[第 2 章：AI 開發](docs/chapter-02-ai-development/README.md)** | AI 為先應用 | [Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI 智能代理](docs/chapter-02-ai-development/agents.md) &#124; [模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [工作坊](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 小時 | ⭐⭐ |
| **[第 3 章：設定](docs/chapter-03-configuration/README.md)** | 驗證與安全 | [設定](docs/chapter-03-configuration/configuration.md) &#124; [驗證與安全](docs/chapter-03-configuration/authsecurity.md) | 45-60 分鐘 | ⭐⭐ |
| **[第 4 章：基礎架構](docs/chapter-04-infrastructure/README.md)** | IaC 與部署 | [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [資源配置](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 小時 | ⭐⭐⭐ |
| **[第 5 章：多代理](docs/chapter-05-multi-agent/README.md)** | AI 代理解決方案 | [零售場景](examples/retail-scenario.md) &#124; [協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 小時 | ⭐⭐⭐⭐ |
| **[第 6 章：部署前準備](docs/chapter-06-pre-deployment/README.md)** | 規劃與驗證 | [預檢察](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [應用洞察](docs/chapter-06-pre-deployment/application-insights.md) | 1 小時 | ⭐⭐ |
| **[第 7 章：故障排除](docs/chapter-07-troubleshooting/README.md)** | 偵錯與修復 | [常見問題](docs/chapter-07-troubleshooting/common-issues.md) &#124; [偵錯](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI 問題](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 小時 | ⭐⭐ |
| **[第 8 章：生產環境](docs/chapter-08-production/README.md)** | 企業模式 | [生產實務](docs/chapter-08-production/production-ai-practices.md) | 2-3 小時 | ⭐⭐⭐⭐ |
| **[🎓 工作坊](workshop/README.md)** | 實作練習 | [簡介](workshop/docs/instructions/0-Introduction.md) &#124; [範本選擇](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [驗證](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [拆解](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [設定](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [自訂](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [資源清理](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [總結](workshop/docs/instructions/7-Wrap-up.md) | 3-4 小時 | ⭐⭐ |

**課程總時長：約 10-14 小時** | **技能進展：初學者 → 生產就緒**

---

## 📚 學習章節

<em>依據經驗與目標選擇您的學習路徑</em>

### 🚀 第 1 章：基礎與快速入門  
<strong>先決條件</strong>：Azure 訂閱、基本指令列知識  
<strong>時長</strong>：30-45 分鐘  
<strong>複雜度</strong>：⭐

#### 您將學習
- 了解 Azure Developer CLI 基礎
- 在您的平台上安裝 AZD
- 成功進行第一次部署

#### 學習資源
- **🎯 從這裡開始**：[什麼是 Azure Developer CLI？](#what-is-azure-developer-cli)  
- **📖 理論**：[AZD 基本概念](docs/chapter-01-foundation/azd-basics.md) - 核心概念與術語  
- **⚙️ 設定**：[安裝與設定](docs/chapter-01-foundation/installation.md) - 平台專用指南  
- **🛠️ 實作**：[您的第一個專案](docs/chapter-01-foundation/first-project.md) - 步驟式教學  
- **📋 快速參考**：[指令備忘清單](resources/cheat-sheet.md)

#### 實作練習  
```bash
# 快速安裝檢查
azd version

# 部署您的第一個應用程式
azd init --template todo-nodejs-mongo
azd up
```
  
**💡 章節成果**：使用 AZD 成功部署簡單的 Web 應用程式至 Azure

**✅ 成功驗證：**  
```bash
# 完成第一章後，您應該能夠：
azd version              # 顯示已安裝版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署到 Azure
azd show                # 顯示正在運行的應用程式 URL
# 應用程式在瀏覽器中開啟並運作
azd down --force --purge  # 清除資源
```
  
**📊 時間投入：** 30-45 分鐘  
**📈 完成後技能：** 能獨立部署基礎應用程式

---

### 🤖 第 2 章：AI 為先的開發（推薦給 AI 開發者）  
<strong>先決條件</strong>：完成第 1 章  
<strong>時長</strong>：1-2 小時  
<strong>複雜度</strong>：⭐⭐

#### 您將學習
- Microsoft Foundry 與 AZD 整合
- 部署 AI 驅動的應用程式
- 了解 AI 服務設定

#### 學習資源
- **🎯 從這裡開始**：[Microsoft Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI 智能代理**：[AI 代理指南](docs/chapter-02-ai-development/agents.md) - 使用 AZD 部署智慧代理  
- **📖 模式**：[AI 模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) - 部署與管理 AI 模型  
- **🛠️ 工作坊**：[AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - 讓您的 AI 解決方案符合 AZD  
- **🎥 互動指南**：[工作坊素材](workshop/README.md) - 使用 MkDocs 瀏覽器學習 * DevContainer 環境  
- **📋 範本**：[Microsoft Foundry 範本](#工作坊資源)  
- **📝 範例**：[AZD 部署範例](examples/README.md)  

#### 實作練習  
```bash
# 部署您的第一個人工智能應用程式
azd init --template azure-search-openai-demo
azd up

# 嘗試其他人工智能範本
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```
  
**💡 章節成果**：部署並設定具有 RAG 能力的 AI 聊天應用程式  

**✅ 成功驗證：**  
```bash
# 完成第二章後，你應該能夠：
azd init --template azure-search-openai-demo
azd up
# 測試 AI 聊天介面
# 提問並獲得帶有來源的 AI 回答
# 驗證搜尋整合功能運作正常
azd monitor  # 檢查 Application Insights 是否顯示遙測資料
azd down --force --purge
```
  
**📊 時間投入：** 1-2 小時  
**📈 完成後技能：** 能部署與設定生產就緒的 AI 應用程式  
**💰 成本認知：** 了解開發成本約 $80-150/月，生產成本約 $300-3500/月  

#### 💰 AI 部署成本考量

**開發環境（約 $80-150/月）：**  
- Microsoft Foundry 模型（隨用隨付）：$0-50/月（依標記令牌使用量計）  
- AI 搜尋（基礎層）：$75/月  
- 容器應用程式（消耗量計費）：$0-20/月  
- 儲存體（標準）：$1-5/月  

**生產環境（約 $300-3,500+ /月）：**  
- Microsoft Foundry 模型（PTU 以維持穩定效能）：$3,000+/月 或 高用量隨用隨付  
- AI 搜尋（標準層）：$250/月  
- 容器應用程式（專用層）：$50-100/月  
- 應用程式洞察：$5-50/月  
- 儲存體（高級）：$10-50/月  

**💡 成本優化建議：**  
- 使用 Microsoft Foundry 模型的<strong>免費層</strong>進行學習（Azure OpenAI 包含每月 50,000 令牌）  
- 不開發時執行 `azd down` 釋放資源  
- 起初使用消耗量計費，僅生產時升級成 PTU  
- 使用 `azd provision --preview` 部署前估算成本  
- 啟用自動擴縮：僅為實際用量付費  

**成本監控：**  
```bash
# 檢查預估每月成本
azd provision --preview

# 在 Azure 入口網站監控實際成本
az consumption budget list --resource-group <your-rg>
```
  
---

### ⚙️ 第 3 章：設定與驗證  
<strong>先決條件</strong>：完成第 1 章  
<strong>時長</strong>：45-60 分鐘  
<strong>複雜度</strong>：⭐⭐

#### 您將學習
- 環境設定與管理
- 驗證與安全最佳實務
- 資源命名與組織

#### 學習資源
- **📖 設定**：[設定指南](docs/chapter-03-configuration/configuration.md) - 環境設定  
- **🔐 安全**：[驗證模式與受管身分識別](docs/chapter-03-configuration/authsecurity.md) - 驗證模式  
- **📝 範例**：[資料庫應用範例](examples/database-app/README.md) - AZD 資料庫範例  

#### 實作練習
- 配置多個環境（開發、預備、正式）  
- 設定受管身分識別驗證  
- 實作環境專屬設定  

**💡 章節成果**：管理多環境並具備妥善驗證與安全性  

---

### 🏗️ 第 4 章：基礎架構即程式碼與部署  
<strong>先決條件</strong>：完成第 1-3 章  
<strong>時長</strong>：1-1.5 小時  
<strong>複雜度</strong>：⭐⭐⭐

#### 您將學習
- 進階部署模式  
- 使用 Bicep 進行基礎架構即程式碼  
- 資源配置策略  

#### 學習資源
- **📖 部署**：[部署指南](docs/chapter-04-infrastructure/deployment-guide.md) - 完整流程  
- **🏗️ 配置**：[資源配置](docs/chapter-04-infrastructure/provisioning.md) - Azure 資源管理  
- **📝 範例**：[容器應用範例](../../examples/container-app) - 容器化部署  

#### 實作練習
- 建立自訂 Bicep 範本  
- 部署多服務應用程式  
- 實作藍綠部署策略  

**💡 章節成果**：使用自訂基礎架構範本部署複雜多服務應用程式  

---

### 🎯 第 5 章：多代理 AI 解決方案（進階）  
<strong>先決條件</strong>：完成第 1-2 章  
<strong>時長</strong>：2-3 小時  
<strong>複雜度</strong>：⭐⭐⭐⭐

#### 您將學習
- 多代理架構模式  
- 代理協調與整合  
- 生產環境的 AI 部署  

#### 學習資源
- **🤖 特色專案**：[零售多代理解決方案](examples/retail-scenario.md) - 完整實作  
- **🛠️ ARM 範本**：[ARM 範本套件](../../examples/retail-multiagent-arm-template) - 一鍵部署  
- **📖 架構**：[多代理協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) - 範式  

#### 實作練習  
```bash
# 部署完整的零售多代理解決方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索代理配置
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 章節成果**：部署並管理具有客戶與庫存代理的生產多代理 AI 解決方案  

---

### 🔍 第 6 章：部署前驗證與規劃  
<strong>先決條件</strong>：完成第 4 章  
<strong>時長</strong>：1 小時  
<strong>複雜度</strong>：⭐⭐
#### 你將學到的內容
- 容量規劃與資源驗證
- SKU 選擇策略
- 預檢查與自動化

#### 學習資源
- **📊 規劃**: [容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) - 資源驗證
- **💰 選擇**: [SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) - 成本效益選擇
- **✅ 驗證**: [預檢查](docs/chapter-06-pre-deployment/preflight-checks.md) - 自動化腳本

#### 實務練習
- 執行容量驗證腳本
- 最佳化 SKU 選擇以節省成本
- 實作自動化預部署檢查

**💡 本章成果**：在執行前驗證並最佳化部署

---

### 🚨 第7章：故障排除與除錯
<strong>先決條件</strong>：完成任一部署章節  
<strong>時間</strong>：1-1.5 小時  
<strong>難度</strong>：⭐⭐

#### 你將學到的內容
- 系統化除錯方法
- 常見問題及解決方案
- AI 專屬故障排除

#### 學習資源
- **🔧 常見問題**: [常見問題](docs/chapter-07-troubleshooting/common-issues.md) - FAQ 及解決方案
- **🕵️ 除錯**: [除錯指南](docs/chapter-07-troubleshooting/debugging.md) - 逐步策略
- **🤖 AI 問題**: [AI 專屬故障排除](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI 服務問題

#### 實務練習
- 診斷部署失敗原因
- 解決身份驗證問題
- 除錯 AI 服務連線問題

**💡 本章成果**：能獨立診斷並解決常見部署問題

---

### 🏢 第8章：生產環境與企業模式
<strong>先決條件</strong>：完成第1-4章  
<strong>時間</strong>：2-3 小時  
<strong>難度</strong>：⭐⭐⭐⭐

#### 你將學到的內容
- 生產環境部署策略
- 企業安全模式
- 監控與成本最佳化

#### 學習資源
- **🏭 生產環境**: [生產 AI 最佳實踐](docs/chapter-08-production/production-ai-practices.md) - 企業模式
- **📝 範例**: [微服務範例](../../examples/microservices) - 複雜架構
- **📊 監控**: [Application Insights 整合](docs/chapter-06-pre-deployment/application-insights.md) - 監控

#### 實務練習
- 實作企業安全模式
- 建置完整監控
- 部署到生產環境並落實治理

**💡 本章成果**：部署具備完整生產能力的企業級應用

---

## 🎓 工作坊概述：實作學習經驗

> **⚠️ 工作坊狀態：開發中**  
> 工作坊教材正在開發與調整中。核心模組已具功能，但部分進階章節尚未完成。我們持續積極完善內容。 [追蹤進度 →](workshop/README.md)

### 互動式工作坊教材
**完整的瀏覽器工具與引導式練習，提供實務動手體驗**

我們的工作坊教材提供架構化且互動的學習體驗，完美搭配上述章節式課程。工作坊適合自學進度及講師帶領模式。

#### 🛠️ 工作坊特色
- <strong>瀏覽器介面</strong>：完整 MkDocs 支援，含搜尋、複製及主題功能
- **GitHub Codespaces 整合**：一鍵啟動開發環境
- <strong>結構化學習路徑</strong>：8 個模組引導，總時長約3-4小時
- <strong>循序漸進流程</strong>：介紹 → 選擇 → 驗證 → 解構 → 設定 → 客製化 → 拆除 → 總結
- **交互式 DevContainer 環境**：預配置工具與依賴

#### 📚 工作坊模組結構
工作坊採用<strong>8模組逐步法</strong>，引導你從探索到部署大師：

| 模組 | 主題 | 你將執行 | 時長 |
|--------|-------|----------------|----------|
| **0. 介紹** | 工作坊概述 | 了解學習目標、先決條件及結構 | 15 分鐘 |
| **1. 選擇** | 模板探索 | 探索 AZD 模板並選出合適 AI 模板 | 20 分鐘 |
| **2. 驗證** | 部署與驗證 | 使用 `azd up` 部署模版並驗證基礎設施 | 30 分鐘 |
| **3. 解構** | 了解架構 | 使用 GitHub Copilot 探索模板架構、Bicep 檔與程式碼組織 | 30 分鐘 |
| **4. 設定** | azure.yaml 深入 | 精通 `azure.yaml` 配置、生命週期掛勾與環境變數 | 30 分鐘 |
| **5. 客製化** | 自己的版本 | 啟用 AI 搜尋、追蹤、評估並針對場景調整 | 45 分鐘 |
| **6. 拆除** | 清理資源 | 使用 `azd down --purge` 安全釋放資源 | 15 分鐘 |
| **7. 總結** | 下一步 | 回顧成果、重點概念與接續學習 | 15 分鐘 |

**工作坊流程：**  
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```
  
#### 🚀 開始你的工作坊旅程  
```bash
# 選項 1：GitHub Codespaces（推薦）
# 在儲存庫中點選「Code」→「Create codespace on main」

# 選項 2：本地開發
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 請依照 workshop/README.md 中的設定說明進行設定
```
  
#### 🎯 工作坊學習成果  
完成工作坊後，參與者將能：  
- **部署生產級 AI 應用**：使用 AZD 與 Microsoft Foundry 服務  
- <strong>精通多代理架構</strong>：實作協同 AI 代理方案  
- <strong>落實安全最佳實踐</strong>：設定身份驗證與存取控制  
- <strong>優化規模與成本</strong>：設計高效能、成本合理的部署  
- <strong>故障排除部署問題</strong>：自主解決常見問題  

#### 📖 工作坊資源
- **🎥 互動式指引**：[工作坊教材](workshop/README.md) - 瀏覽器基礎學習環境
- **📋 分模組操作說明**：
  - [0. 介紹](workshop/docs/instructions/0-Introduction.md) - 工作坊概述與目標
  - [1. 選擇](workshop/docs/instructions/1-Select-AI-Template.md) - 尋找與選擇 AI 模板
  - [2. 驗證](workshop/docs/instructions/2-Validate-AI-Template.md) - 部署與驗證模板
  - [3. 解構](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - 探索模板架構
  - [4. 設定](workshop/docs/instructions/4-Configure-AI-Template.md) - 精通 azure.yaml
  - [5. 客製化](workshop/docs/instructions/5-Customize-AI-Template.md) - 依場景自訂
  - [6. 拆除](workshop/docs/instructions/6-Teardown-Infrastructure.md) - 資源清理
  - [7. 總結](workshop/docs/instructions/7-Wrap-up.md) - 回顧與後續
- **🛠️ AI 工作坊實驗室**：[AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI 專注練習
- **💡 快速開始**：[工作坊設定指南](workshop/README.md#quick-start) - 環境配置

<strong>適用對象</strong>：企業培訓、大學課程、自主進修和開發者訓練營。

---

## 📖 深入解析：AZD 功能

除了基礎功能外，AZD 提供強大功能支援生產部署：

- <strong>基於模板的部署</strong> - 使用預建模板套用常見應用架構
- <strong>基礎架構即程式碼</strong> - 使用 Bicep 或 Terraform 管理 Azure 資源  
- <strong>整合工作流程</strong> - 無縫資源配置、部署及監控
- <strong>開發者友善</strong> - 優化開發效率與體驗

### **AZD + Microsoft Foundry：AI 部署完美搭檔**

**為何選用 AZD 部署 AI 解決方案？** AZD 針對 AI 開發者面臨的主要挑戰提供解決方案：

- **AI 就緒模板** - 預配置 Microsoft Foundry 模型、認知服務與 ML 工作負載所需模板
- **安全的 AI 部署** - 內建 AI 服務、API 金鑰與模型端點安全模式  
- **生產級 AI 架構** - 支援可擴充且成本效益佳的 AI 應用部署最佳實踐
- **端對端 AI 工作流程** - 從模型開發到生產部署，並落實監控
- <strong>成本最佳化</strong> - 智慧資源分配與擴展策略
- **Microsoft Foundry 整合** - 與 Microsoft Foundry 模型目錄和端點無縫連接

---

## 🎯 模板與範例庫

### 精選：Microsoft Foundry 模板
**如果你要部署 AI 應用，請從這裡開始！**

> **注意：** 這些模板展示不同 AI 架構，有些來自 Azure Samples 外部資源，有些為本地實作。

| 模板 | 章節 | 難度 | 服務 | 類型 |
|----------|---------|------------|----------|------|
| [**開始使用 AI 聊天**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI 模型推論 API + Azure AI Search + Azure Container Apps + Application Insights | 外部 |
| [**開始使用 AI 代理**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第2章 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | 外部 |
| [**Azure Search + OpenAI 示範**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + 存儲 | 外部 |
| [**OpenAI 聊天應用快速入門**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso 聊天 RAG**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | 外部 |
| [<strong>零售多代理方案</strong>](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + 儲存 + Container Apps + Cosmos DB | <strong>本地</strong> |

### 精選：完整學習場景
**生產就緒應用模板，對應學習章節**

| 模板 | 學習章節 | 難度 | 主要學習內容 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | 基本 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | 使用 Azure AI Search 的 RAG 實作 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第4章 | ⭐⭐ | 文件智慧整合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | 代理框架與函數呼叫 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐ | 企業級 AI 協作 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | 多代理架構：客戶與庫存代理 |

### 按範例類型學習

> **📌 本地與外部範例：**  
> <strong>本地範例</strong>（本資源庫）＝可立即使用  
> <strong>外部範例</strong>（Azure Samples）＝從連結資源庫克隆

#### 本地範例（可立即使用）
- [<strong>零售多代理方案</strong>](examples/retail-scenario.md) - 完整的生產就緒實作與 ARM 模板
  - 多代理架構（客戶代理 + 庫存代理）
  - 全面監控與評估
  - 一鍵透過 ARM 模板部署

#### 本地範例 - 容器應用（第2-5章）
**本庫完整的容器部署範例：**
- [**Container App 範例**](examples/container-app/README.md) - 容器部署指南
  - [簡易 Flask API](../../examples/container-app/simple-flask-api) - 基本 REST API 與 scale-to-zero
  - [微服務架構](../../examples/container-app/microservices) - 生產就緒多服務部署
  - 快速入門、生產與進階部署模式
  - 監控、安全與成本最佳化指南

#### 外部範例 - 簡易應用（第1-2章）
**從下列 Azure Samples 資源庫克隆開始：**
- [簡易網頁應用 - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本部署模式
- [靜態網站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 靜態內容部署
- [容器應用 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署

#### 外部範例 - 資料庫整合（第3-4章）  

- [資料庫應用程式 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 資料庫連線範例
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 無伺服器資料流程

#### 外部範例 - 進階模式（第4至8章）
- [Java 微服務](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服務架構
- [Container Apps 工作](https://github.com/Azure-Samples/container-apps-jobs) - 背景處理  
- [企業級機器學習流程](https://github.com/Azure-Samples/mlops-v2) - 可投入生產的 ML 模式

### 外部範本集合
- [**官方 AZD 範本畫廊**](https://azure.github.io/awesome-azd/) - 精選官方與社群範本收藏
- [**Azure Developer CLI 範本**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - 微軟 Learn 範本文件
- [<strong>範例目錄</strong>](examples/README.md) - 本地學習範例與詳細說明

---

## 📚 學習資源與參考

### 快速參考
- [<strong>指令速查表</strong>](resources/cheat-sheet.md) - 按章節整理之必要 azd 指令
- [<strong>術語集</strong>](resources/glossary.md) - Azure 與 azd 專有名詞  
- [<strong>常見問題集</strong>](resources/faq.md) - 按學習章節整理的常見問題
- [<strong>學習指南</strong>](resources/study-guide.md) - 完整練習題集

### 實作工作坊
- [**AI 工作坊實驗室**](docs/chapter-02-ai-development/ai-workshop-lab.md) - 使您的 AI 解決方案具備 AZD 部署能力（2-3 小時）
- [<strong>互動式工作坊</strong>](workshop/README.md) - 利用 MkDocs 與 GitHub Codespaces 的 8 模組引導練習
  - 流程：介紹 → 選擇 → 驗證 → 分解 → 設定 → 自訂 → 結束 → 收尾

### 外部學習資源
- [Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 價格計算器](https://azure.microsoft.com/pricing/calculator/)
- [Azure 狀態](https://status.azure.com/)

### 編輯器專用 AI 代理技能
- [**Microsoft Azure 技能於 skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 針對 Azure AI、Foundry、部署、診斷、成本優化等，提供 37 種開放代理技能。可於 GitHub Copilot、Cursor、Claude Code 或任何支援的代理中安裝：
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 快速故障排除指南

**新手常見問題與即時解決方案：**

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
# 編輯 infra/main.parameters.json:
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

# 選項 4：在 Azure 監視器中檢查日誌
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" 或 "Token expired"</strong></summary>

```bash
# 重新驗證 AZD
azd auth logout
azd auth login

# 選擇性：如果您正在執行 az 命令，也請刷新 Azure CLI
az logout
az login

# 驗證身份認證
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" 或命名衝突</strong></summary>

```bash
# AZD 會生成唯一名稱，但如果發生衝突：
azd down --force --purge

# 則使用新的環境重試
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 範本部署耗時過長</strong></summary>

**一般等待時間：**
- 簡易網站應用：5-10 分鐘
- 含資料庫應用：10-15 分鐘
- AI 應用：15-25 分鐘（OpenAI 佈署緩慢）

```bash
# 檢查進度
azd show

# 如果停滯超過30分鐘，請檢查Azure入口網站：
azd monitor --overview
# 尋找失敗的部署
```
</details>

<details>
<summary><strong>❌ "Permission denied" 或 "Forbidden"</strong></summary>

```bash
# 檢查您的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 您至少需要「參與者」角色
# 請求您的 Azure 管理員授予：
# - 參與者（資源使用權）
# - 使用者存取管理員（角色指派權限）
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
# 查找 *_URL 變數
```
</details>

### 📚 完整故障排除資源

- **常見問題指南：** [詳細解決方案](docs/chapter-07-troubleshooting/common-issues.md)
- **AI 專屬問題：** [AI 故障排除](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **除錯指南：** [逐步除錯](docs/chapter-07-troubleshooting/debugging.md)
- **尋求協助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 課程完成與認證

### 進度追蹤
追蹤您各章節的學習進度：

- [ ] **第1章**：基礎與快速入門 ✅
- [ ] **第2章**：AI 優先開發 ✅  
- [ ] **第3章**：設定與認證 ✅
- [ ] **第4章**：基礎架構即程式碼與部署 ✅
- [ ] **第5章**：多代理 AI 解決方案 ✅
- [ ] **第6章**：部署前驗證與規劃 ✅
- [ ] **第7章**：故障排除與除錯 ✅
- [ ] **第8章**：生產及企業模式 ✅

### 學習驗證
完成每章節後，進行知識驗證：
1. <strong>實作練習</strong>：完成該章節部署操作
2. <strong>知識測試</strong>：複習該章節 FAQ
3. <strong>社群討論</strong>：在 Azure Discord 分享經驗
4. <strong>下一章節</strong>：進入下一階段的複雜度

### 課程結業福利
完成所有章節後，您將擁有：
- <strong>實務經驗</strong>：實戰部署 AI 應用於 Azure
- <strong>專業技能</strong>：企業級部署能力  
- <strong>社群認可</strong>：成為活躍的 Azure 開發者社群成員
- <strong>職涯提升</strong>：具備熱門的 AZD 與 AI 部署專長

---

## 🤝 社群與支援

### 尋求協助與支援
- <strong>技術問題</strong>： [報告錯誤與功能請求](https://github.com/microsoft/azd-for-beginners/issues)
- <strong>學習問題</strong>： [Microsoft Azure Discord 社群](https://discord.gg/microsoft-azure) 與 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 專屬協助**：加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- <strong>文件資源</strong>： [官方 Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### 微軟 Foundry Discord 社群洞察

**#Azure 頻道近期投票結果：**
- **45%** 開發者想用 AZD 處理 AI 工作負載
- <strong>主要挑戰</strong>：多服務部署、憑證管理、生產準備  
- <strong>最高需求</strong>：AI 專屬範本、故障排除指南、最佳實務

**加入我們社群可：**
- 分享 AZD 與 AI 經驗並獲得協助
- 優先取得 AI 新範本預覽
- 貢獻 AI 部署最佳實踐
- 影響未來 AI 與 AZD 功能開發

### 課程貢獻
歡迎共襄盛舉！請參閱我們的 [貢獻指南](CONTRIBUTING.md) 以瞭解：
- <strong>內容改進</strong>：提升現有章節與範例
- <strong>新增範例</strong>：加入實務場景與範本  
- <strong>翻譯工作</strong>：維護多語系支持
- <strong>錯誤報告</strong>：提升準確性與清晰度
- <strong>社群標準</strong>：遵守我們包容性的社群守則

---

## 📄 課程資訊

### 授權條款
本專案採用 MIT 授權條款，詳細內容請參閱 [LICENSE](../../LICENSE) 檔案。

### 相關微軟學習資源

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
[![資料科學初學者](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![人工智慧初學者](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![資安初學者](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![網頁開發初學者](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![物聯網初學者](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR開發初學者](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot 系列
[![AI配對程式設計的Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET的Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot 冒險](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ 課程導覽

**🚀 準備開始學習了嗎？**

<strong>初學者</strong>：從 [第1章：基礎與快速入門](#-chapter-1-foundation--quick-start) 開始  
<strong>人工智慧開發者</strong>：跳至 [第2章：AI優先開發](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
<strong>有經驗的開發者</strong>：從 [第3章：設定與驗證](#️-chapter-3-configuration--authentication) 開始

<strong>下一步</strong>：[開始第1章 - AZD基礎](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件經由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們力求準確，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或誤譯負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->