# AZD 初學者指南：結構化學習之旅

![AZD-for-beginners](../../translated_images/zh-HK/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 自動翻譯（隨時更新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[阿拉伯文](../ar/README.md) | [孟加拉文](../bn/README.md) | [保加利亞文](../bg/README.md) | [緬甸文](../my/README.md) | [中文（簡體）](../zh-CN/README.md) | [中文（繁體，香港）](./README.md) | [中文（繁體，澳門）](../zh-MO/README.md) | [中文（繁體，台灣）](../zh-TW/README.md) | [克羅地亞文](../hr/README.md) | [捷克文](../cs/README.md) | [丹麥文](../da/README.md) | [荷蘭文](../nl/README.md) | [愛沙尼亞文](../et/README.md) | [芬蘭文](../fi/README.md) | [法文](../fr/README.md) | [德文](../de/README.md) | [希臘文](../el/README.md) | [希伯來文](../he/README.md) | [印地文](../hi/README.md) | [匈牙利文](../hu/README.md) | [印尼文](../id/README.md) | [意大利文](../it/README.md) | [日文](../ja/README.md) | [坎納達文](../kn/README.md) | [韓文](../ko/README.md) | [立陶宛文](../lt/README.md) | [馬來文](../ms/README.md) | [馬拉雅拉姆文](../ml/README.md) | [馬拉地文](../mr/README.md) | [尼泊爾文](../ne/README.md) | [奈及利亞皮欽語](../pcm/README.md) | [挪威文](../no/README.md) | [波斯文（法爾西）](../fa/README.md) | [波蘭文](../pl/README.md) | [葡萄牙文（巴西）](../pt-BR/README.md) | [葡萄牙文（葡萄牙）](../pt-PT/README.md) | [旁遮普文（古魯穆奇）](../pa/README.md) | [羅馬尼亞文](../ro/README.md) | [俄文](../ru/README.md) | [塞爾維亞文（西里爾字母）](../sr/README.md) | [斯洛伐克文](../sk/README.md) | [斯洛文尼亞文](../sl/README.md) | [西班牙文](../es/README.md) | [斯瓦希里文](../sw/README.md) | [瑞典文](../sv/README.md) | [他加祿文（菲律賓語）](../tl/README.md) | [泰米爾文](../ta/README.md) | [泰盧固文](../te/README.md) | [泰文](../th/README.md) | [土耳其文](../tr/README.md) | [烏克蘭文](../uk/README.md) | [烏爾都文](../ur/README.md) | [越南文](../vi/README.md)

> **喜歡本機克隆？**
>
> 本倉庫包括 50 多種語言的翻譯，會大幅增加下載大小。若要不下載翻譯直接克隆，請使用稀疏簽出：
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD（Windows）:**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> 這樣你就能更快地下載完成課程所需全部內容。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 今日 azd 新功能

Azure Developer CLI 已超越傳統網頁應用和 API。現在，azd 是部署 <strong>任何</strong> Azure 應用的單一工具——包括 AI 驅動的應用和智能代理。

這對你意味著：

- **AI 代理現在是第一類 azd 工作負載。** 你可以用熟悉的 `azd init` → `azd up` 工作流初始化、部署和管理 AI 代理專案。
- **Microsoft Foundry 整合** 將模型部署、代理主機管理以及 AI 服務配置直接帶入 azd 範本生態系統。
- **核心工作流保持不變。** 不論你是部署代辦應用、微服務，還是多代理 AI 解決方案，指令是一樣的。

如果你之前使用過 azd，AI 支援是自然延伸——不是另一個工具或高級路線。若是新開始，你將學到一套適用於所有情境的工作流程。

---

## 🚀 什麼是 Azure Developer CLI (azd)？

**Azure Developer CLI (azd)** 是親和開發者的指令行工具，簡化將應用部署到 Azure。你不必手動建立和串接數十個 Azure 資源，只要用一個指令就能部署完整的應用。

### `azd up` 的神奇魔法

```bash
# 這個單一指令一次過執行所有工作：
# ✅ 建立所有 Azure 資源
# ✅ 設定網絡與安全性
# ✅ 建置你的應用程式原始碼
# ✅ 部署到 Azure
# ✅ 為你提供一個可用的 URL
azd up
```

**就這樣！** 無需點擊 Azure 入口網站、無需學習複雜 ARM 模板，無需手動設定——你的應用立刻在 Azure 上運作。

---

## ❓ Azure Developer CLI 和 Azure CLI 有何不同？

這是初學者最常問的問題。簡單回答如下：

| 功能 | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| <strong>目的</strong> | 管理單一 Azure 資源 | 部署完整應用程式 |
| <strong>思維模式</strong> | 基礎設施導向 | 應用導向 |
| <strong>範例</strong> | `az webapp create --name myapp...` | `azd up` |
| <strong>學習曲線</strong> | 必須了解 Azure 服務 | 只需了解你的應用 |
| <strong>適用對象</strong> | DevOps、基礎設施團隊 | 開發者、原型設計 |

### 簡單比喻

- **Azure CLI** 像是擁有蓋房子所需的一切工具——錘子、鋸子、釘子。你能建造任何東西，但必須懂建築。
- **Azure Developer CLI** 像是請了承包商——你描述需求，他們幫你蓋好。

### 什麼時候用哪個？

| 場景 | 使用此工具 |
|----------|----------|
| 「我想快速部署我的網頁應用」 | `azd up` |
| 「我只想建立一個儲存帳戶」 | `az storage account create` |
| 「我要建立完整的 AI 應用」 | `azd init --template azure-search-openai-demo` |
| 「我要調試某個 Azure 資源」 | `az resource show` |
| 「我要幾分鐘內搞定生產部署」 | `azd up --environment production` |

### 它們可以一起使用！

AZD 內部使用 Azure CLI。你可以兩者兼用：
```bash
# 使用 AZD 部署你的應用程式
azd up

# 然後使用 Azure CLI 微調特定資源
az webapp config set --name myapp --always-on true
```

---

## 🌟 在 Awesome AZD 找到範本

不要從頭開始！**Awesome AZD** 是社群蒐集的即用範本：

| 資源 | 說明 |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | 瀏覽 200+ 範本並一鍵部署 |
| 🔗 [<strong>提交範本</strong>](https://github.com/Azure/awesome-azd/issues) | 將你的範本貢獻給社群 |
| 🔗 [**GitHub 倉庫**](https://github.com/Azure/awesome-azd) | 點讚並探索原始碼 |

### Awesome AZD 的熱門 AI 範本

```bash
# RAG 聊天（配合 Microsoft Foundry 模型 + AI 搜尋）
azd init --template azure-search-openai-demo

# 快速 AI 聊天應用程式
azd init --template openai-chat-app-quickstart

# 以 Foundry 代理為基礎的 AI 代理
azd init --template get-started-with-ai-agents
```

---

## 🎯 三步驟快速起步

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

### 第 2 步：登入 Azure

```bash
azd auth login
```

### 第 3 步：部署第一個應用

```bash
# 從範本初始化
azd init --template todo-nodejs-mongo

# 部署到 Azure（會建立所有資源！）
azd up
```

**🎉 就這樣！** 你的應用已經在 Azure 上線。

### 清理工作（別忘了！）

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 如何使用本課程

本課程設計成 <strong>循序漸進學習</strong> —— 從你的熟悉點開始，一步步提升：

| 你的經驗 | 從這裡開始 |
|-----------------|------------|
| **Azure 新手** | [第 1 章：基礎](#-chapter-1-foundation--quick-start) |
| **懂 Azure，初用 AZD** | [第 1 章：基礎](#-chapter-1-foundation--quick-start) |
| **想部署 AI 應用** | [第 2 章：AI 為先的開發](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| <strong>想動手實作</strong> | [🎓 互動工作坊](workshop/README.md) - 3-4 小時引導實驗 |
| <strong>需要生產實務範例</strong> | [第 8 章：生產與企業實務](#-chapter-8-production--enterprise-patterns) |

### 快速設定

1. <strong>分叉本倉庫</strong>: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. <strong>克隆它</strong>: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. <strong>尋求協助</strong>: [Azure Discord 社群](https://discord.com/invite/ByRwuEEgH4)

> **喜歡本機克隆？**

> 本倉庫包含 50 多種語言翻譯，會大幅增加下載大小。若要不下載翻譯直接克隆，請使用稀疏簽出：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 這樣你就能更快速地下載完成課程所需內容。


## 課程總覽

透過結構化章節掌握 Azure Developer CLI (azd)，設計用於循序漸進學習。**特別聚焦 AI 應用部署與 Microsoft Foundry 整合。**

### 為何此課程對現代開發者至關重要

根據 Microsoft Foundry Discord 社群見解，**45% 開發者期望使用 AZD 處理 AI 工作負載**，但面臨挑戰於：
- 複雜多服務 AI 架構  
- 生產環境 AI 部署最佳實務  
- Azure AI 服務整合與配置  
- AI 工作負載的成本優化  
- AI 專屬部署疑難排解

### 學習目標

完成本結構化課程後，你將能：
- **精通 AZD 基本原理**：核心概念、安裝與設定
- **部署 AI 應用**：使用 AZD 搭配 Microsoft Foundry 服務
- <strong>實踐基礎設施即代碼</strong>：用 Bicep 範本管理 Azure 資源
- <strong>排解部署問題</strong>：解決常見問題與除錯
- <strong>優化生產環境</strong>：資安、擴充、監控與成本管理
- <strong>構建多代理解決方案</strong>：部署複雜 AI 架構

## 🗺️ 課程地圖：章節快速導航

每個章節有專屬 README 附帶學習目標、快速啟動與練習：

| 章節 | 主題 | 課程內容 | 時間 | 複雜度 |
|---------|-------|---------|----------|------------|
| **[第 1 章：基礎](docs/chapter-01-foundation/README.md)** | 入門指南 | [AZD 基礎](docs/chapter-01-foundation/azd-basics.md) &#124; [安裝](docs/chapter-01-foundation/installation.md) &#124; [第一個專案](docs/chapter-01-foundation/first-project.md) | 30-45 分鐘 | ⭐ |
| **[Ch 2: AI 開發](docs/chapter-02-ai-development/README.md)** | AI-First 應用程式 | [Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI 代理](docs/chapter-02-ai-development/agents.md) &#124; [模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [工作坊](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 小時 | ⭐⭐ |
| **[Ch 3: 配置](docs/chapter-03-configuration/README.md)** | 認證與安全 | [配置](docs/chapter-03-configuration/configuration.md) &#124; [認證與安全](docs/chapter-03-configuration/authsecurity.md) | 45-60 分鐘 | ⭐⭐ |
| **[Ch 4: 基礎架構](docs/chapter-04-infrastructure/README.md)** | 基礎架構即程式碼與部署 | [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [配置程序](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 小時 | ⭐⭐⭐ |
| **[Ch 5: 多代理](docs/chapter-05-multi-agent/README.md)** | AI 代理解決方案 | [零售場景](examples/retail-scenario.md) &#124; [協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 小時 | ⭐⭐⭐⭐ |
| **[Ch 6: 預部署](docs/chapter-06-pre-deployment/README.md)** | 規劃與驗證 | [預先檢查](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [應用洞察](docs/chapter-06-pre-deployment/application-insights.md) | 1 小時 | ⭐⭐ |
| **[Ch 7: 疑難排解](docs/chapter-07-troubleshooting/README.md)** | 偵錯與修復 | [常見問題](docs/chapter-07-troubleshooting/common-issues.md) &#124; [偵錯](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI 問題](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 小時 | ⭐⭐ |
| **[Ch 8: 生產環境](docs/chapter-08-production/README.md)** | 企業模式 | [生產實務](docs/chapter-08-production/production-ai-practices.md) | 2-3 小時 | ⭐⭐⭐⭐ |
| **[🎓 工作坊](workshop/README.md)** | 實作實驗室 | [介紹](workshop/docs/instructions/0-Introduction.md) &#124; [選擇](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [驗證](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [解構](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [配置](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [自訂](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [拆除](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [總結](workshop/docs/instructions/7-Wrap-up.md) | 3-4 小時 | ⭐⭐ |

**總課程時長：** ~10-14 小時 | **技能進階：** 初學者 → 生產環境準備

---

## 📚 學習章節

<em>根據經驗水平與目標選擇你的學習路徑</em>

### 🚀 第 1 章：基礎與快速入門  
<strong>先決條件</strong>：有 Azure 訂閱，基本命令列知識  
<strong>時長</strong>：30-45 分鐘  
<strong>難度</strong>：⭐

#### 學習內容  
- 了解 Azure Developer CLI 基礎  
- 在你的平台安裝 AZD  
- 第一次成功部署

#### 學習資源  
- **🎯 從這裡開始**：[什麼是 Azure Developer CLI？](#what-is-azure-developer-cli)  
- **📖 理論**：[AZD 基礎](docs/chapter-01-foundation/azd-basics.md) - 核心概念與術語  
- **⚙️ 設置**：[安裝與設置](docs/chapter-01-foundation/installation.md) - 平台專用指南  
- **🛠️ 實作**：[你的第一個專案](docs/chapter-01-foundation/first-project.md) - 逐步教學  
- **📋 快速參考**：[命令速查表](resources/cheat-sheet.md)

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
# 完成第一章之後，您應該能夠：
azd version              # 顯示已安裝的版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署到 Azure
azd show                # 顯示正在運行的應用程式 URL
# 應用程式在瀏覽器中開啟並運作
azd down --force --purge  # 清理資源
```
  
**📊 時間投入：** 30-45 分鐘  
**📈 技能水平：** 能獨立部署基礎應用程式

---

### 🤖 第 2 章：AI-First 開發（推薦給 AI 開發者）  
<strong>先決條件</strong>：完成第 1 章  
<strong>時長</strong>：1-2 小時  
<strong>難度</strong>：⭐⭐

#### 學習內容  
- Microsoft Foundry 與 AZD 整合  
- 部署 AI 驅動應用程式  
- 了解 AI 服務配置

#### 學習資源  
- **🎯 從這裡開始**：[Microsoft Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md)  
- **🤖 AI 代理**：[AI 代理指南](docs/chapter-02-ai-development/agents.md) - 使用 AZD 部署智能代理  
- **📖 模式**：[AI 模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) - 部署和管理 AI 模型  
- **🛠️ 工作坊**：[AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - 讓你的 AI 解決方案適用 AZD  
- **🎥 互動式指南**：[工作坊材料](workshop/README.md) - 基於瀏覽器的學習配合 MkDocs 與 DevContainer 環境  
- **📋 範本**：[Microsoft Foundry 範本](#工作坊資源)  
- **📝 範例**：[AZD 部署範例](examples/README.md)

#### 實作練習  
```bash
# 部署你的第一個人工智能應用程式
azd init --template azure-search-openai-demo
azd up

# 嘗試更多人工智能範本
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```
  
**💡 章節成果**：部署並配置具備 RAG 功能的 AI 驅動聊天應用

**✅ 成功驗證：**  
```bash
# 完成第二章後，你應該能夠：
azd init --template azure-search-openai-demo
azd up
# 測試 AI 聊天介面
# 提問並獲得帶有來源的 AI 回答
# 驗證搜尋整合功能是否運作正常
azd monitor  # 檢查 Application Insights 是否顯示遙測資料
azd down --force --purge
```
  
**📊 時間投入：** 1-2 小時  
**📈 技能水平：** 可以部署及配置生產就緒的 AI 應用  
**💰 成本認知：** 了解開發環境約 $80-150/月、正式環境約 $300-3500/月的成本

#### 💰 AI 部署的成本考量

**開發環境（預估 $80-150/月）：**  
- Microsoft Foundry 模型（按使用付費）：$0-50/月（視使用的 token 數量而定）  
- AI 搜尋（基本層）：$75/月  
- Container Apps（消費計費）：$0-20/月  
- 儲存空間（標準）：$1-5/月

**生產環境（預估 $300-3,500+/月）：**  
- Microsoft Foundry 模型（持續性能保障 PTU）：$3,000+/月，或高流量模式下按使用付費  
- AI 搜尋（標準層）：$250/月  
- Container Apps（專用）：$50-100/月  
- 應用洞察：$5-50/月  
- 儲存空間（高階）：$10-50/月

**💡 成本優化建議：**  
- 使用 <strong>免費層</strong> 的 Microsoft Foundry 模型進行學習（Azure OpenAI 包含每月 50,000 token）  
- 不開發時運行 `azd down` 釋放資源  
- 初期採用消費計費，僅在生產時升級到 PTU  
- 使用 `azd provision --preview` 預估部署成本  
- 啟用自動擴縮，僅為實際使用付費

**成本監控：**  
```bash
# 檢查估計的每月費用
azd provision --preview

# 在 Azure 管理入口監察實際費用
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第 3 章：配置與認證  
<strong>先決條件</strong>：完成第 1 章  
<strong>時長</strong>：45-60 分鐘  
<strong>難度</strong>：⭐⭐

#### 學習內容  
- 環境配置與管理  
- 認證與安全最佳實務  
- 資源命名與組織

#### 學習資源  
- **📖 配置**：[配置指南](docs/chapter-03-configuration/configuration.md) - 環境設置  
- **🔐 安全**：[認證模式與管理身分](docs/chapter-03-configuration/authsecurity.md) - 認證模式說明  
- **📝 範例**：[資料庫應用範例](examples/database-app/README.md) - AZD 資料庫範例

#### 實作練習  
- 配置多個環境（開發、測試、生產）  
- 設置管理身分認證  
- 實作環境專屬配置

**💡 章節成果**：能管理多環境且具備妥善認證與安全措施

---

### 🏗️ 第 4 章：基礎架構即程式碼與部署  
<strong>先決條件</strong>：完成第 1-3 章  
<strong>時長</strong>：1-1.5 小時  
<strong>難度</strong>：⭐⭐⭐

#### 學習內容  
- 進階部署模式  
- 使用 Bicep 實作基礎架構即程式碼  
- 資源配置策略

#### 學習資源  
- **📖 部署**：[部署指南](docs/chapter-04-infrastructure/deployment-guide.md) - 完整工作流程  
- **🏗️ 配置**：[資源配置](docs/chapter-04-infrastructure/provisioning.md) - Azure 資源管理  
- **📝 範例**：[Container App 範例](../../examples/container-app) - 容器化部署

#### 實作練習  
- 建立自訂 Bicep 範本  
- 部署多服務應用  
- 實作藍綠部署策略

**💡 章節成果**：能使用自訂基礎架構模板部署複雜多服務應用

---

### 🎯 第 5 章：多代理 AI 解決方案（進階）  
<strong>先決條件</strong>：完成第 1-2 章  
<strong>時長</strong>：2-3 小時  
<strong>難度</strong>：⭐⭐⭐⭐

#### 學習內容  
- 多代理架構模式  
- 代理協調與編排  
- 生產就緒的 AI 部署

#### 學習資源  
- **🤖 特色專案**：[零售多代理解決方案](examples/retail-scenario.md) - 完整實作  
- **🛠️ ARM 範本**：[ARM 範本套件](../../examples/retail-multiagent-arm-template) - 一鍵部署  
- **📖 架構**：[多代理協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) - 模式說明

#### 實作練習  
```bash
# 部署完整零售多代理解決方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索代理配置
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 章節成果**：部署並管理具客戶與庫存代理的生產就緒多代理 AI 解決方案

---

### 🔍 第 6 章：預部署驗證與規劃  
<strong>先決條件</strong>：完成第 4 章  
<strong>時長</strong>：1 小時  
<strong>難度</strong>：⭐⭐

#### 學習內容  
- 容量規劃與資源驗證  
- SKU 選擇策略  
- 預檢查與自動化作業

#### 學習資源  
- **📊 規劃**：[容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) - 資源驗證  
- **💰 選擇**：[SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) - 成本效益選擇  
- **✅ 驗證**：[預先檢查](docs/chapter-06-pre-deployment/preflight-checks.md) - 自動化腳本

#### 實作練習  
- 執行容量驗證腳本  
- 優化 SKU 選擇以降低成本  
- 實作自動化預部署檢查

**💡 章節成果**：能在部署前驗證並優化資源配置

---

### 🚨 第 7 章：疑難排解與偵錯  
<strong>先決條件</strong>：完成任一部署章節  
<strong>時長</strong>：1-1.5 小時  
<strong>難度</strong>：⭐⭐

#### 學習內容  
- 系統化偵錯方法  
- 常見問題及解決方案  
- AI 相關疑難排解

#### 學習資源  
- **🔧 常見問題**：[常見問題](docs/chapter-07-troubleshooting/common-issues.md) - FAQ 與解決方案  
- **🕵️ 偵錯**：[偵錯指南](docs/chapter-07-troubleshooting/debugging.md) - 逐步策略  
- **🤖 AI 問題**：[AI 專用疑難排解](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI 服務問題

#### 實作練習  
- 診斷部署失敗原因  
- 解決認證問題  
- 偵錯 AI 服務連線問題

**💡 章節成果**：能獨立診斷與解決一般部署問題

---

### 🏢 第 8 章：生產與企業級模式  
<strong>先決條件</strong>：完成第 1-4 章  
<strong>時長</strong>：2-3 小時  
<strong>難度</strong>：⭐⭐⭐⭐

#### 學習內容  
- 生產部署策略  
- 企業安全模式  
- 監控與成本優化

#### 學習資源
- **🏭 生產環境**: [生產 AI 最佳實踐](docs/chapter-08-production/production-ai-practices.md) - 企業模式
- **📝 範例**: [微服務範例](../../examples/microservices) - 複雜架構
- **📊 監控**: [Application Insights 整合](docs/chapter-06-pre-deployment/application-insights.md) - 監控

#### 實務練習
- 實作企業安全模式
- 設置全面監控
- 以適當治理部署至生產環境

**💡 本章成果**: 部署具備完整生產能力的企業級應用程式

---

## 🎓 工作坊概覽：實作學習體驗

> **⚠️ 工作坊狀態：積極開發中**  
> 工作坊教材目前正在開發與精進中。核心模組已可運作，但部分進階章節尚未完成。我們正積極努力完成所有內容。[追蹤進度 →](workshop/README.md)

### 互動式工作坊教材
<strong>結合瀏覽器工具與引導式練習的全面實作學習體驗</strong>

我們的工作坊教材提供結構化、互動式的學習體驗，與上述章節式課程互補。工作坊設計適用於自學及講師帶領課堂。

#### 🛠️ 工作坊特色
- <strong>瀏覽器操作介面</strong>：完整 MkDocs 驅動的工作坊，具搜尋、複製及主題功能
- **GitHub Codespaces 整合**：一鍵設定開發環境
- <strong>結構化學習路徑</strong>：8 模組引導練習（總時長約 3-4 小時）
- <strong>循序漸進方法論</strong>：導入 → 選擇 → 驗證 → 解構 → 設定 → 自訂 → 清理 → 總結
- **互動 DevContainer 環境**：預先設定的工具與相依套件

#### 📚 工作坊模組架構
工作坊採用<strong>8 模組循序漸進方法論</strong>，帶領你從發現到部署掌握：

| 模組 | 主題 | 活動內容 | 時間 |
|--------|-------|----------------|----------|
| **0. 導入** | 工作坊概覽 | 了解學習目標、先決條件及工作坊架構 | 15 分鐘 |
| **1. 選擇** | 範本探索 | 探索 AZD 範本，選擇合適 AI 範本 | 20 分鐘 |
| **2. 驗證** | 部署與驗證 | 使用 `azd up` 部署範本並驗證基礎架構 | 30 分鐘 |
| **3. 解構** | 理解架構 | 利用 GitHub Copilot 探索範本架構、Bicep 檔案與程式碼組織 | 30 分鐘 |
| **4. 設定** | azure.yaml 深入 | 精通 `azure.yaml` 設定、生命週期掛勾及環境變數 | 30 分鐘 |
| **5. 自訂** | 量身打造 | 啟用 AI 搜尋、追蹤、評估並自訂符合需求 | 45 分鐘 |
| **6. 清理** | 收尾作業 | 使用 `azd down --purge` 安全移除資源 | 15 分鐘 |
| **7. 總結** | 往後方向 | 回顧成就、核心概念及持續學習 | 15 分鐘 |

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
# 在存儲庫中點擊「Code」→「Create codespace on main」

# 選項 2：本地開發
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 按照 workshop/README.md 中的設置說明進行操作
```
  
#### 🎯 工作坊學習成效  
完成工作坊後，學員將能：
- **部署生產用 AI 應用程式**：結合 AZD 與 Microsoft Foundry 服務
- <strong>精通多代理架構</strong>：實作協調式 AI 代理解決方案
- <strong>執行安全最佳實踐</strong>：設定驗證及存取控制
- <strong>優化規模效能</strong>：設計成本效益及高效能部署
- <strong>自行排解部署問題</strong>：解決常見故障

#### 📖 工作坊資源
- **🎥 互動指南**: [工作坊教材](workshop/README.md) - 瀏覽器學習環境
- **📋 模組化說明**:
  - [0. 導入](workshop/docs/instructions/0-Introduction.md) - 工作坊概覽與目標
  - [1. 選擇](workshop/docs/instructions/1-Select-AI-Template.md) - 找到並選擇 AI 範本
  - [2. 驗證](workshop/docs/instructions/2-Validate-AI-Template.md) - 部署與驗證範本
  - [3. 解構](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - 探索範本架構
  - [4. 設定](workshop/docs/instructions/4-Configure-AI-Template.md) - 精通 azure.yaml
  - [5. 自訂](workshop/docs/instructions/5-Customize-AI-Template.md) - 依需求自訂範本
  - [6. 清理](workshop/docs/instructions/6-Teardown-Infrastructure.md) - 資源清理
  - [7. 總結](workshop/docs/instructions/7-Wrap-up.md) - 回顧與後續學習
- **🛠️ AI 工作坊實驗室**: [AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - 聚焦 AI 的練習
- **💡 快速入門**: [工作坊設定指南](workshop/README.md#quick-start) - 環境配置

<strong>適合對象</strong>：企業培訓、大學課程、自學及開發者訓練營。

---

## 📖 深入探討：AZD 功能

除基礎之外，AZD 提供強大功能支持生產部署：

- <strong>基於範本部署</strong> - 使用預建範本處理常見應用模式
- <strong>基礎架構即程式碼</strong> - 透過 Bicep 或 Terraform 管理 Azure 資源  
- <strong>整合化工作流程</strong> - 無縫進行佈建、部署及監控
- <strong>友善開發者</strong> - 優化開發效率與使用體驗

### **AZD + Microsoft Foundry：AI 部署最佳夥伴**

**為何選擇 AZD 實作 AI 方案？** AZD 解決 AI 開發者的主要挑戰：

- **AI 準備範本** - 預設 Microsoft Foundry 模型、Cognitive Services 與 ML 負載範本
- **安全 AI 部署** - 內建 AI 服務安全模式、API 金鑰與模型端點保護  
- **生產 AI 模式** - 可擴展且具成本效益的 AI 部署最佳實踐
- **端到端 AI 工作流程** - 從模型開發到監控完善的生產部署
- <strong>成本優化</strong> - 智能資源分配及彈性擴展策略
- **Microsoft Foundry 整合** - 無縫連接 Microsoft Foundry 模型目錄與端點

---

## 🎯 範本與範例庫

### 精選：Microsoft Foundry 範本
**部署 AI 應用程式，從這裡開始！**

> **注意：** 這些範本示範多種 AI 模式。有些屬於 Azure Samples 外部範本，其他為本地實作。

| 範本 | 章節 | 複雜度 | 服務 | 類型 |
|----------|---------|------------|----------|------|
| [**AI 聊天入門**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第 2 章 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | 外部 |
| [**AI 代理入門**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第 2 章 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| 外部 |
| [**Azure Search + OpenAI 示範**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第 2 章 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | 外部 |
| [**OpenAI 聊天應用快速入門**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第 2 章 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第 5 章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso 聊天 RAG**](https://github.com/Azure-Samples/contoso-chat) | 第 8 章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | 外部 |
| [<strong>零售多代理解決方案</strong>](examples/retail-scenario.md) | 第 5 章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | <strong>本地</strong> |

### 精選：完整學習場景
<strong>對應學習章節的生產就緒應用範本</strong>

| 範本 | 學習章節 | 複雜度 | 核心學習內容 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第 2 章 | ⭐ | 基本 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第 2 章 | ⭐⭐ | 使用 Azure AI Search 實作 RAG |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第 4 章 | ⭐⭐ | 文件智能整合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第 5 章 | ⭐⭐⭐ | 代理框架與函式調用 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第 8 章 | ⭐⭐⭐ | 企業 AI 協同編排 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第 5 章 | ⭐⭐⭐⭐ | 多代理架構，含客戶與庫存代理 |

### 依範例類型學習

> **📌 本地與外部範例說明：**  
> <strong>本地範例</strong>（此存放庫）= 可立即使用  
> <strong>外部範例</strong>（Azure Samples）= 從指定倉庫複製

#### 本地範例（可立即使用）
- [<strong>零售多代理解決方案</strong>](examples/retail-scenario.md) - 完整生產就緒包含 ARM 範本  
  - 多代理架構（客戶 + 庫存代理）  
  - 全面監控與評估  
  - 一鍵 ARM 範本部署

#### 本地範例 - 容器應用（第 2-5 章）
**本存放庫中全面容器部署範例：**  
- [<strong>容器應用範例</strong>](examples/container-app/README.md) - 容器化部署完全指南  
  - [簡易 Flask API](../../examples/container-app/simple-flask-api) - 基本 REST API 支援縮減至零  
  - [微服務架構](../../examples/container-app/microservices) - 生產就緒多服務部署  
  - 快速入門、生產與進階部署模式  
  - 監控、安全與成本優化指導

#### 外部範例 - 簡易應用（第 1-2 章）
**可複製下列 Azure Samples 倉庫開始使用：**  
- [簡易 Web 應用 - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本部署模式  
- [靜態網站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 靜態內容部署  
- [容器應用 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署

#### 外部範例 - 資料庫整合（第 3-4 章）  
- [資料庫應用 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 資料庫連接模式  
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 無伺服器資料流程

#### 外部範例 - 進階模式（第 4-8 章）
- [Java 微服務](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服務架構  
- [容器應用批次作業](https://github.com/Azure-Samples/container-apps-jobs) - 背景處理  
- [企業機器學習流水線](https://github.com/Azure-Samples/mlops-v2) - 生產就緒機器學習模式

### 外部範本集合
- [**官方 AZD 範本集**](https://azure.github.io/awesome-azd/) - 精選官方與社群範本  
- [**Azure Developer CLI 範本**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - 微軟學習範本文件  
- [<strong>範例目錄</strong>](examples/README.md) - 本地學習範例及詳細解說

---

## 📚 學習資源與參考資料

### 快速參考
- [<strong>指令備忘單</strong>](resources/cheat-sheet.md) - 關鍵 azd 指令整理，依章節分類  
- [<strong>術語集</strong>](resources/glossary.md) - Azure 與 azd 專用術語  
- [<strong>常見問題集</strong>](resources/faq.md) - 依學習章節組織的常見疑問  
- [<strong>學習指南</strong>](resources/study-guide.md) - 全面練習題目

### 實作工作坊
- [**AI 工作坊實驗室**](docs/chapter-02-ai-development/ai-workshop-lab.md) - 讓 AI 解決方案可由 AZD 部署（約 2-3 小時）  
- [<strong>互動工作坊</strong>](workshop/README.md) - 8 模組引導練習，利用 MkDocs 與 GitHub Codespaces  
  - 路線：導入 → 選擇 → 驗證 → 解構 → 設定 → 自訂 → 清理 → 總結

### 外部學習資源
- [Azure 開發人員 CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 定價計算機](https://azure.microsoft.com/pricing/calculator/)
- [Azure 狀態](https://status.azure.com/)

### 您的編輯器專用 AI 代理技能
- [**skills.sh 上的 Microsoft Azure 技能**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 個開放的 Azure AI、Foundry、部署、診斷、成本優化等代理技能。在 GitHub Copilot、Cursor、Claude Code 或任何支援的代理中安裝：
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 快速故障排除指南

**初學者常見問題及即時解決方案：**

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

# 設定 AZD 環境
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# 驗證
az account show
```
</details>

<details>
<summary><strong>❌ 「InsufficientQuota」或「配額超出」</strong></summary>

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
<summary><strong>❌ 「azd up」中途失敗</strong></summary>

```bash
# 選項1：清理後重試
azd down --force --purge
azd up

# 選項2：只修復基礎設施
azd provision

# 選項3：檢查詳細狀態
azd show

# 選項4：在 Azure 監控中檢查日誌
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ 「身份驗證失敗」或「令牌過期」</strong></summary>

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
# AZD 生成唯一名稱，但如果發生衝突：
azd down --force --purge

# 則使用全新環境重試
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 模板部署花費過長時間</strong></summary>

**正常等待時間：**
- 簡單的網頁應用程式：5-10 分鐘
- 含資料庫的應用程式：10-15 分鐘
- AI 應用程式：15-25 分鐘（OpenAI 佈建較慢）

```bash
# 檢查進度
azd show

# 如果卡住超過30分鐘，檢查 Azure 入口網站：
azd monitor
# 尋找失敗的部署
```
</details>

<details>
<summary><strong>❌ 「權限被拒絕」或「禁止」</strong></summary>

```bash
# 檢查你的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 你需要至少「參與者」角色
# 請你的 Azure 管理員授予：
# - 參與者（用於資源）
# - 使用者存取管理員（用於角色指派）
```
</details>

<details>
<summary><strong>❌ 找不到已部署應用的 URL</strong></summary>

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
- **尋求幫助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 課程完成與證書

### 進度追蹤
追蹤您每章節的學習進度：

- [ ] **第 1 章**：基礎與快速入門 ✅
- [ ] **第 2 章**：AI 優先開發 ✅  
- [ ] **第 3 章**：設定與身份驗證 ✅
- [ ] **第 4 章**：基礎設施即程式碼與部署 ✅
- [ ] **第 5 章**：多代理 AI 解決方案 ✅
- [ ] **第 6 章**：預部署驗證與規劃 ✅
- [ ] **第 7 章**：故障排除與除錯 ✅
- [ ] **第 8 章**：生產與企業範例 ✅

### 學習驗證
完成每章後，透過以下方式驗證您的知識：
1. <strong>實作練習</strong>：完成本章的實務部署
2. <strong>知識查核</strong>：查看本章的常見問題解答
3. <strong>社群討論</strong>：於 Azure Discord 分享您的經驗
4. <strong>下一章節</strong>：進入下一個複雜度層級

### 課程完成福利
完成所有章節後，您將擁有：
- <strong>生產經驗</strong>：已部署真實的 AI 應用至 Azure
- <strong>專業技能</strong>：具備企業級的部署能力  
- <strong>社群認可</strong>：成為活躍的 Azure 開發人員社群成員
- <strong>職涯進階</strong>：掌握需求殷切的 AZD 和 AI 部署專業知識

---

## 🤝 社群與支援

### 獲得幫助與支援
- <strong>技術問題</strong>： [回報錯誤和功能需求](https://github.com/microsoft/azd-for-beginners/issues)
- <strong>學習疑問</strong>： [Microsoft Azure Discord 社群](https://discord.gg/microsoft-azure) 及 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 專屬協助**：加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- <strong>文件資源</strong>： [官方 Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord 上的社群見解

**#Azure 頻道近期投票結果：**
- **45%** 的開發人員想用 AZD 進行 AI 工作負載
- <strong>主要挑戰</strong>：多服務部署、憑證管理、生產準備  
- <strong>最常需求</strong>：AI 專用模板、故障排除指南、最佳實踐

**加入我們的社群以：**
- 分享您的 AZD + AI 經驗並取得協助
- 取得 AI 新模板的搶先預覽
- 共同打造 AI 部署最佳實務
- 影響未來 AI + AZD 功能的開發方向

### 參與課程貢獻
歡迎貢獻！請閱讀我們的 [貢獻指南](CONTRIBUTING.md)，了解：
- <strong>內容改進</strong>：提升現有章節與範例
- <strong>新增範例</strong>：增加實務場景與模板  
- <strong>翻譯協助</strong>：維持多語言支援
- <strong>錯誤回報</strong>：提升準確性與清晰度
- <strong>社群準則</strong>：遵守包容性的社群規範

---

## 📄 課程資訊

### 授權條款
本專案採用 MIT 授權，詳細資訊請參閱 [LICENSE](../../LICENSE) 檔案。

### 相關 Microsoft 學習資源

我們團隊製作其他完整的學習課程：

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j 初學者](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js 初學者](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain 初學者](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / 代理
[![初學者的 AZD](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![初學者的 Edge AI](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![初學者的 MCP](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![初學者的 AI 代理](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### 生成式 AI 系列
[![初學者的生成式 AI](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### 核心學習
[![初學者的 ML](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![初學者的資料科學](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![初學者的 AI](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![初學者的資安](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![初學者的網頁開發](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![初學者的物聯網](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![初學者的 XR 開發](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot 系列
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ 課程導航

**🚀 準備好開始學習了嗎？**

<strong>初學者</strong>：由[第 1 章：基礎與快速入門](#-chapter-1-foundation--quick-start)開始  
**AI 開發者**：直接跳到[第 2 章：AI 優先開發](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
<strong>有經驗的開發者</strong>：從[第 3 章：設定與認證](#️-chapter-3-configuration--authentication)開始

<strong>下一步</strong>：[開始第 1 章 - AZD 基礎](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯。雖然我們致力於提供準確的翻譯，但請注意，機器翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議採用專業人工翻譯。我們對因使用此翻譯而產生的任何誤解或曲解概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->