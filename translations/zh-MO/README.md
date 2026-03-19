# AZD 新手入門：結構化學習旅程

![AZD-新手入門](../../translated_images/zh-MO/azdbeginners.5527441dd9f74068.webp) 

[![GitHub 追蹤者](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub 分叉](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub 星標](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 自動翻譯（隨時更新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[阿拉伯語](../ar/README.md) | [孟加拉語](../bn/README.md) | [保加利亞語](../bg/README.md) | [緬甸語（Myanmar）](../my/README.md) | [中文（簡體）](../zh-CN/README.md) | [中文（繁體，香港）](../zh-HK/README.md) | [中文（繁體，澳門）](./README.md) | [中文（繁體，台灣）](../zh-TW/README.md) | [克羅地亞語](../hr/README.md) | [捷克語](../cs/README.md) | [丹麥語](../da/README.md) | [荷蘭語](../nl/README.md) | [愛沙尼亞語](../et/README.md) | [芬蘭語](../fi/README.md) | [法語](../fr/README.md) | [德語](../de/README.md) | [希臘語](../el/README.md) | [希伯來語](../he/README.md) | [印地語](../hi/README.md) | [匈牙利語](../hu/README.md) | [印尼語](../id/README.md) | [義大利語](../it/README.md) | [日語](../ja/README.md) | [坎納達語](../kn/README.md) | [韓語](../ko/README.md) | [立陶宛語](../lt/README.md) | [馬來語](../ms/README.md) | [馬拉雅拉姆語](../ml/README.md) | [馬拉地語](../mr/README.md) | [尼泊爾語](../ne/README.md) | [奈及利亞洋涇濱語（Pidgin）](../pcm/README.md) | [挪威語](../no/README.md) | [波斯語（Farsi）](../fa/README.md) | [波蘭語](../pl/README.md) | [葡萄牙語（巴西）](../pt-BR/README.md) | [葡萄牙語（葡萄牙）](../pt-PT/README.md) | [旁遮普語（Gurmukhi）](../pa/README.md) | [羅馬尼亞語](../ro/README.md) | [俄語](../ru/README.md) | [塞爾維亞語（西里爾文）](../sr/README.md) | [斯洛伐克語](../sk/README.md) | [斯洛維尼亞語](../sl/README.md) | [西班牙語](../es/README.md) | [斯瓦希里語](../sw/README.md) | [瑞典語](../sv/README.md) | [他加祿語（菲律賓語）](../tl/README.md) | [泰米爾語](../ta/README.md) | [泰盧固語](../te/README.md) | [泰語](../th/README.md) | [土耳其語](../tr/README.md) | [烏克蘭語](../uk/README.md) | [烏爾都語](../ur/README.md) | [越南語](../vi/README.md)

> **想要在本機複製（Clone）嗎？**
>
> 此儲存庫包含 50+ 種語言翻譯，會大幅增加下載大小。若要在不包含翻譯的情況下複製，請使用稀疏檢出：
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
> 這會為你提供完成課程所需的一切，並大幅加快下載速度。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 azd 的最新動態

Azure Developer CLI 的應用已超越傳統的 Web 應用與 API。如今，azd 是將任何應用程式部署到 Azure 的單一工具——包括 AI 驅動的應用程式與智能代理。

這對你意味著：

- **AI 代理現已成為 azd 的一等工作負載。** 你可以使用你已熟悉的 `azd init` → `azd up` 工作流程來初始化、部署和管理 AI 代理專案。
- **Microsoft Foundry 整合** 將模型部署、代理託管和 AI 服務設定直接帶入 azd 範本生態系統。
- **核心工作流程未改變。** 無論你要部署待辦清單應用、微服務，或是多代理 AI 解決方案，使用的命令相同。

如果你以前已使用過 azd，AI 支援只是自然的延伸──不是另外的工具或進階路線。如果你是新手，你會學到一個適用於所有情境的工作流程。

---

## 🚀 什麼是 Azure Developer CLI（azd）？

**Azure Developer CLI (azd)** 是一個對開發者友善的命令列工具，可簡化將應用程式部署到 Azure 的流程。你不需要手動建立並連接十幾個 Azure 資源；只要一個命令，就能部署整個應用程式。

### `azd up` 的魔力

```bash
# 呢條單一命令完成晒所有嘢：
# ✅ 建立所有 Azure 資源
# ✅ 配置網絡同安全性
# ✅ 建構你嘅應用程式代碼
# ✅ 部署到 Azure
# ✅ 提供你一個可用嘅網址
azd up
```

**就這樣！** 無需點選 Azure 入口網站、無需先學習複雜的 ARM 範本、無需手動設定 - 直接在 Azure 上運行應用程式。

---

## ❓ Azure Developer CLI 與 Azure CLI：有什麼不同？

這是初學者最常問的問題。簡短回答如下：

| 功能 | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| <strong>用途</strong> | 管理個別的 Azure 資源 | 部署完整的應用程式 |
| <strong>思維模式</strong> | 以基礎架構為主 | 以應用程式為主 |
| <strong>範例</strong> | `az webapp create --name myapp...` | `azd up` |
| <strong>學習曲線</strong> | 必須了解 Azure 服務 | 只需了解你的應用程式 |
| <strong>適合對象</strong> | DevOps、基礎架構工程師 | 開發者、快速原型設計 |

### 簡單類比

- **Azure CLI** 像是擁有建造房屋的所有工具──鐵鎚、鋸子、釘子。你可以建造任何東西，但你需要懂建築。
- **Azure Developer CLI** 更像是雇用一位承包商──你描述你想要的，他們負責建造。

### 何時使用哪一個

| 情境 | 使用此命令 |
|----------|----------|
| "我想快速部署我的 web 應用程式" | `azd up` |
| "我只需要建立一個儲存帳戶" | `az storage account create` |
| "我正在建構完整的 AI 應用程式" | `azd init --template azure-search-openai-demo` |
| "我需要除錯特定的 Azure 資源" | `az resource show` |
| "我想在幾分鐘內完成生產環境部署" | `azd up --environment production` |

### 它們可以協同運作！

AZD 在底層使用 Azure CLI，你可以兩者並用：
```bash
# 使用 AZD 部署您的應用程式
azd up

# 然後使用 Azure CLI 微調特定資源
az webapp config set --name myapp --always-on true
```

---

## 🌟 在 Awesome AZD 找到範本

不要從零開始！**Awesome AZD** 是社群整理的可立即部署範本集合：

| 資源 | 說明 |
|----------|-------------|
| 🔗 [**Awesome AZD 圖庫**](https://azure.github.io/awesome-azd/) | 瀏覽 200+ 個範本並可一鍵部署 |
| 🔗 [<strong>提交範本</strong>](https://github.com/Azure/awesome-azd/issues) | 向社群貢獻你自己的範本 |
| 🔗 [**GitHub 倉庫**](https://github.com/Azure/awesome-azd) | 標星並探索原始碼 |

### Awesome AZD 的熱門 AI 範本

```bash
# 結合 Microsoft Foundry 模型與 AI 搜尋的 RAG 聊天
azd init --template azure-search-openai-demo

# 快速 AI 聊天應用程式
azd init --template openai-chat-app-quickstart

# 配備 Foundry 代理的 AI 代理
azd init --template get-started-with-ai-agents
```

---

## 🎯 以 3 步驟開始

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

### 步驟 2：登入 Azure

```bash
azd auth login
```

### 步驟 3：部署你的第一個應用程式

```bash
# 從範本初始化
azd init --template todo-nodejs-mongo

# 部署到 Azure（會建立所有東西！）
azd up
```

**🎉 就這樣！** 你的應用程式現在已在 Azure 上運行。

### 清理（別忘了！）

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 如何使用本課程

本課程以<strong>循序漸進學習</strong>為設計——從你熟悉的地方開始，逐步進階：

| 你的經驗 | 從這裡開始 |
|-----------------|------------|
| **剛接觸 Azure** | [第 1 章：基礎](#-chapter-1-foundation--quick-start) |
| **熟悉 Azure，但不熟 AZD** | [第 1 章：基礎](#-chapter-1-foundation--quick-start) |
| **想部署 AI 應用程式** | [第 2 章：AI 優先開發](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| <strong>想要實作練習</strong> | [🎓 互動式工作坊](workshop/README.md) - 3-4 小時的引導實驗 |
| <strong>需要生產環境模式</strong> | [第 8 章：生產與企業](#-chapter-8-production--enterprise-patterns) |

### 快速設定

1. **Fork 本儲存庫**: [![GitHub 分叉](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. <strong>複製儲存庫</strong>: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. <strong>取得協助</strong>: [Azure Discord 社群](https://discord.com/invite/ByRwuEEgH4)

> **想要在本機複製（Clone）嗎？**
>
> 此儲存庫包含 50+ 種語言翻譯，會大幅增加下載大小。若要在不包含翻譯的情況下複製，請使用稀疏檢出：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 這會為你提供完成課程所需的一切，並大幅加快下載速度。


## 課程概覽

透過結構化章節掌握 Azure Developer CLI（azd），以循序漸進學習為設計。**特別著重於透過 Microsoft Foundry 整合部署 AI 應用程式。**

### 為何本課程對現代開發者至關重要

根據 Microsoft Foundry Discord 社群的見解，**45% 的開發者想使用 AZD 於 AI 工作負載**，但面臨下列挑戰：
- 複雜的多服務 AI 架構
- 生產環境 AI 部署最佳實務  
- Azure AI 服務整合與設定
- AI 工作負載的成本優化
- AI 特定部署問題的故障排除

### 學習目標

完成此結構化課程後，你將：
- **掌握 AZD 基礎**：核心概念、安裝與設定
- **部署 AI 應用程式**：使用 AZD 與 Microsoft Foundry 服務
- <strong>實作基礎設施即程式碼</strong>：使用 Bicep 範本管理 Azure 資源
- <strong>部署故障排除</strong>：解決常見問題與偵錯
- <strong>為生產環境優化</strong>：安全、擴充、監控與成本管理
- <strong>建立多代理解決方案</strong>：部署複雜的 AI 架構

## 🗺️ 課程地圖：依章節快速導覽

每章節都有專屬 README，包含學習目標、快速入門與練習：

| 章節 | 主題 | 課程 | 時長 | 複雜度 |
|---------|-------|---------|----------|------------|
| **[第 1 章：基礎](docs/chapter-01-foundation/README.md)** | 入門 | [AZD 基礎](docs/chapter-01-foundation/azd-basics.md) &#124; [安裝](docs/chapter-01-foundation/installation.md) &#124; [第一個專案](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[第 2 章：AI 開發](docs/chapter-02-ai-development/README.md)** | 以 AI 為先的應用 | [Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI 代理](docs/chapter-02-ai-development/agents.md) &#124; [模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [工作坊](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 小時 | ⭐⭐ |
| **[第 3 章：設定](docs/chapter-03-configuration/README.md)** | 認證與安全 | [設定](docs/chapter-03-configuration/configuration.md) &#124; [認證與安全](docs/chapter-03-configuration/authsecurity.md) | 45-60 分鐘 | ⭐⭐ |
| **[第 4 章：基礎架構](docs/chapter-04-infrastructure/README.md)** | IaC 與部署 | [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [資源佈建](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 小時 | ⭐⭐⭐ |
| **[第 5 章：多代理](docs/chapter-05-multi-agent/README.md)** | AI 代理解決方案 | [零售情境](examples/retail-scenario.md) &#124; [協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 小時 | ⭐⭐⭐⭐ |
| **[第 6 章：預部署](docs/chapter-06-pre-deployment/README.md)** | 規劃與驗證 | [預檢查](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [應用程式洞察](docs/chapter-06-pre-deployment/application-insights.md) | 1 小時 | ⭐⭐ |
| **[第 7 章：故障排除](docs/chapter-07-troubleshooting/README.md)** | 除錯與修復 | [常見問題](docs/chapter-07-troubleshooting/common-issues.md) &#124; [除錯](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI 問題](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 小時 | ⭐⭐ |
| **[第 8 章：生產](docs/chapter-08-production/README.md)** | 企業模式 | [生產實務](docs/chapter-08-production/production-ai-practices.md) | 2-3 小時 | ⭐⭐⭐⭐ |
| **[🎓 工作坊](workshop/README.md)** | 實作實驗室 | [介紹](workshop/docs/instructions/0-Introduction.md) &#124; [選擇](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [驗證](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [拆解](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [設定](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [自訂](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [拆除基礎設施](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [總結](workshop/docs/instructions/7-Wrap-up.md) | 3-4 小時 | ⭐⭐ |

**課程總時長：** ~10-14 小時 | **技能進階：** 初學者 → 可投入生產

---

## 📚 學習章節

<em>根據經驗和目標選擇你的學習路徑</em>

### 🚀 第 1 章：基礎與快速入門
<strong>先決條件</strong>: Azure 訂閱、基本指令列知識  
<strong>持續時間</strong>: 30-45 分鐘  
<strong>複雜度</strong>: ⭐

#### 你將學到的內容
- 了解 Azure Developer CLI 的基本原理
- 在你的平台上安裝 AZD
- 成功完成你的第一次部署

#### 學習資源
- **🎯 從這裡開始**: [What is Azure Developer CLI?](#what-is-azure-developer-cli)
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

**💡 章節成果**: 使用 AZD 成功將簡單的 Web 應用部署到 Azure

**✅ 成功驗證：**
```bash
# 完成第一章後，您應該能夠：
azd version              # 顯示已安裝的版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署到 Azure
azd show                # 顯示執行中應用程式的 URL
# 應用程式在瀏覽器中開啟並正常運作
azd down --force --purge  # 清理資源
```

**📊 時間投資：** 30-45 分鐘  
**📈 完成後的技能等級：** 能夠獨立部署基礎應用程式
**📈 完成後的技能等級：** 能夠獨立部署基礎應用程式

---

### 🤖 第 2 章：以 AI 為先的開發（建議 AI 開發者）
<strong>先決條件</strong>: 第 1 章已完成  
<strong>持續時間</strong>: 1-2 小時  
<strong>複雜度</strong>: ⭐⭐

#### 你將學到的內容
- Microsoft Foundry 與 AZD 的整合
- 部署具 AI 功能的應用程式
- 了解 AI 服務設定

#### 學習資源
- **🎯 從這裡開始**: [Microsoft Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI 代理**: [AI 代理指南](docs/chapter-02-ai-development/agents.md) - 使用 AZD 部署智慧代理
- **📖 模式**: [AI 模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) - 部署及管理 AI 模型
- **🛠️ 工作坊**: [AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - 使你的 AI 解決方案能與 AZD 配合
- **🎥 互動指南**: [工作坊教材](workshop/README.md) - 使用 MkDocs 的瀏覽器式學習 * DevContainer 環境
- **📋 範本**: [Microsoft Foundry 範本](#工作坊資源)
- **📝 範例**: [AZD 部署範例](examples/README.md)

#### 實作練習
```bash
# 部署你嘅第一個 AI 應用程式
azd init --template azure-search-openai-demo
azd up

# 嘗試其他 AI 範本
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 章節成果**: 部署並設定具有 RAG 功能的 AI 聊天應用程式

**✅ 成功驗證：**
```bash
# 在第2章之後，您應該能夠：
azd init --template azure-search-openai-demo
azd up
# 測試 AI 聊天介面
# 提出問題並取得附帶來源的 AI 回應
# 驗證搜尋整合是否運作正常
azd monitor  # 確認 Application Insights 是否顯示遙測資料
azd down --force --purge
```

**📊 時間投入：** 1-2 小時  
**📈 完成後的技能等級：** 能夠部署並設定可投入生產的 AI 應用程式  
**💰 成本意識：** 了解開發環境約 $80-150/月 的成本，生產環境約 $300-3500/月 的成本

#### 💰 AI 部署的成本考量

**開發環境（估計 $80-150/月）：**
- Microsoft Foundry 模型（隨用付費）： $0-50/月（基於代幣使用量）
- AI Search（Basic 層級）： $75/月
- Container Apps（消耗計費）： $0-20/月
- 儲存（標準）： $1-5/月

**生產環境（估計 $300-3,500+/月）：**
- Microsoft Foundry 模型（PTU 以維持一致效能）： $3,000+/月 或 高用量時的隨用付費
- AI Search（Standard 層級）： $250/月
- Container Apps（專用）： $50-100/月
- Application Insights： $5-50/月
- 儲存（高級）： $10-50/月

**💡 成本優化提示：**
- 使用 <strong>免費等級</strong> Microsoft Foundry 模型學習（包含 Azure OpenAI 每月 50,000 代幣）
- 在非開發期間執行 `azd down` 以解除配置資源
- 以消耗計費開始，僅在生產環境再升級到 PTU
- 使用 `azd provision --preview` 在部署前估算成本
- 啟用自動擴充：只為實際使用付費

**成本監控：**
```bash
# 檢查預估的每月費用
azd provision --preview

# 在 Azure 入口網站監控實際費用
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第 3 章：設定與認證
<strong>先決條件</strong>: 第 1 章已完成  
<strong>持續時間</strong>: 45-60 分鐘  
<strong>複雜度</strong>: ⭐⭐

#### 你將學到的內容
- 環境設定與管理
- 認證與安全最佳實務
- 資源命名與組織

#### 學習資源
- **📖 設定**: [設定指南](docs/chapter-03-configuration/configuration.md) - 環境設定
- **🔐 安全**: [認證模式與受管理身分](docs/chapter-03-configuration/authsecurity.md) - 認證模式
- **📝 範例**: [資料庫應用範例](examples/database-app/README.md) - AZD 資料庫範例

#### 實作練習
- 設定多個環境（dev、staging、prod）
- 設定受管理身分認證
- 實作環境特定的設定

**💡 章節成果**: 使用適當的認證與安全管理多個環境

---

### 🏗️ 第 4 章：基礎架構即程式碼與部署
<strong>先決條件</strong>: 已完成第 1-3 章  
<strong>持續時間</strong>: 1-1.5 小時  
<strong>複雜度</strong>: ⭐⭐⭐

#### 你將學到的內容
- 進階部署模式
- 使用 Bicep 的基礎架構即程式碼
- 資源佈建策略

#### 學習資源
- **📖 部署**: [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) - 完整工作流程
- **🏗️ 佈建**: [資源佈建](docs/chapter-04-infrastructure/provisioning.md) - Azure 資源管理
- **📝 範例**: [Container App 範例](../../examples/container-app) - 容器化部署

#### 實作練習
- 建立自訂 Bicep 範本
- 部署多服務應用程式
- 實作藍綠部署策略

**💡 章節成果**: 使用自訂基礎架構範本部署複雜的多服務應用程式

---

### 🎯 第 5 章：多代理 AI 解決方案（進階）
<strong>先決條件</strong>: 已完成第 1-2 章  
<strong>持續時間</strong>: 2-3 小時  
<strong>複雜度</strong>: ⭐⭐⭐⭐

#### 你將學到的內容
- 多代理架構模式
- 代理協調與編排
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

# 探索代理設定
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 章節成果**: 部署並管理具 Customer 與 Inventory 代理的可投入生產多代理 AI 解決方案

---

### 🔍 第 6 章：預部署驗證與規劃
<strong>先決條件</strong>: 已完成第 4 章  
<strong>持續時間</strong>: 1 小時  
<strong>複雜度</strong>: ⭐⭐

#### 你將學到的內容
- 容量規劃與資源驗證
- SKU 選擇策略
- 預檢查與自動化

#### 學習資源
- **📊 規劃**: [容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) - 資源驗證
- **💰 選擇**: [SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) - 成本效益選擇
- **✅ 驗證**: [預檢查](docs/chapter-06-pre-deployment/preflight-checks.md) - 自動化腳本

#### 實作練習
- 執行容量驗證腳本
- 為成本優化 SKU 選擇
- 實作自動化的預部署檢查

**💡 章節成果**: 在執行前驗證並優化部署

---

### 🚨 第 7 章：故障排除與除錯
<strong>先決條件</strong>: 已完成任一部署章節  
<strong>持續時間</strong>: 1-1.5 小時  
<strong>複雜度</strong>: ⭐⭐

#### 你將學到的內容
- 系統性除錯方法
- 常見問題與解法
- AI 專屬的故障排除

#### 學習資源
- **🔧 常見問題**: [常見問題](docs/chapter-07-troubleshooting/common-issues.md) - 常見問答與解法
- **🕵️ 除錯**: [除錯指南](docs/chapter-07-troubleshooting/debugging.md) - 逐步策略
- **🤖 AI 問題**: [AI 專屬故障排除](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI 服務問題

#### 實作練習
- 診斷部署失敗
- 解決認證問題
- 除錯 AI 服務連線問題

**💡 章節成果**: 獨立診斷並解決常見的部署問題

---

### 🏢 第 8 章：生產與企業模式
<strong>先決條件</strong>: 已完成第 1-4 章  
<strong>持續時間</strong>: 2-3 小時  
<strong>複雜度</strong>: ⭐⭐⭐⭐

#### 你將學到的內容
- 生產部署策略
- 企業安全模式
- 監控與成本優化

#### 學習資源
- **🏭 生產**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - 企業模式
- **📝 範例**: [Microservices Example](../../examples/microservices) - 複雜架構
- **📊 監控**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - 監控

#### 實作練習
- 實作企業安全模式
- 建立完整監控
- 以適當治理部署到生產

**💡 章節成果**: 部署具備完整生產功能的企業級應用

---

## 🎓 工作坊概覽：實作學習體驗

> **⚠️ 工作坊狀態：開發中**  
> 工作坊教材目前正持續開發與精進。核心模組已可運作，但部分進階內容尚未完成。我們正在積極補齊所有內容。 [追蹤進度 →](workshop/README.md)

### 互動式工作坊教材
<strong>使用瀏覽器工具與引導式練習的完整實作式學習</strong>

我們的工作坊教材提供結構化、互動式的學習體驗，作為上方章節式課程的補充。工作坊設計可支援自學或講師帶領的課程。

#### 🛠️ 工作坊特色
- <strong>瀏覽器介面</strong>：完整 MkDocs 支援的工作坊，具搜尋、複製與佈景主題功能
- **GitHub Codespaces 整合**：一鍵建立開發環境
- <strong>結構化學習路徑</strong>：8 模組引導式練習（總時長 3-4 小時）
- <strong>漸進方法論</strong>：導入 → 選擇 → 驗證 → 分解 → 設定 → 自訂 → 清場 → 總結
- **互動式 DevContainer 環境**：預先配置的工具與相依項

#### 📚 工作坊模組結構
工作坊遵循一套 **8 模組的漸進方法論**，帶領你從探索到部署精通：

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
# 在儲存庫中點選「Code」→「Create codespace on main」

# 選項 2：本地開發
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 按照 workshop/README.md 的設定說明進行
```

#### 🎯 工作坊學習成果
完成工作坊後，參加者將會：
- **部署生產級 AI 應用**：使用 AZD 與 Microsoft Foundry 服務
- <strong>精通多代理架構</strong>：實作協調式 AI 代理解決方案
- <strong>落實安全最佳實務</strong>：設定驗證與存取控制
- <strong>為擴展最佳化</strong>：設計具成本效益且效能良好的部署
- <strong>排解部署問題</strong>：能獨立處理常見問題

#### 📖 工作坊資源
- **🎥 互動指南**：[Workshop Materials](workshop/README.md) - 瀏覽器導向的學習環境
- **📋 模組逐步說明**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - 工作坊概覽與目標
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - 找出並選擇適合的 AI 範本
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - 部署並驗證範本
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - 探索範本架構
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - 精通 azure.yaml
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - 依情境客製化
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - 清理資源
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - 回顧與後續步驟
- **🛠️ AI 工作坊實驗室**：[AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - 以 AI 為重點的練習
- **💡 快速開始**：[Workshop Setup Guide](workshop/README.md#quick-start) - 環境設定

<strong>適合對象</strong>：企業訓練、大學課程、自學與開發者密集訓練營。

---

## 📖 深入探討：AZD 能力

超越基礎，AZD 提供多項針對生產部署的強大功能：

- <strong>範本式部署</strong> - 使用預先建置的範本來處理常見應用模式
- <strong>基礎設施即程式碼</strong> - 使用 Bicep 或 Terraform 管理 Azure 資源  
- <strong>整合化工作流程</strong> - 無縫地佈建、部署與監控應用
- <strong>友善開發者體驗</strong> - 優化開發者生產力與使用經驗

### **AZD + Microsoft Foundry：AI 部署的理想選擇**

**為何選擇 AZD 來做 AI 解決方案？** AZD 解決了 AI 開發者面臨的主要挑戰：

- **AI 就緒範本** - 為 Microsoft Foundry 模型、Cognitive Services 與 ML 工作負載預先配置的範本
- **安全的 AI 部署** - 為 AI 服務、API 金鑰與模型端點內建的安全模式  
- **生產 AI 模式** - 可擴展、具成本效益的 AI 應用部署最佳實務
- **端到端 AI 工作流程** - 從模型開發到生產部署，並搭配適當的監控
- <strong>成本最佳化</strong> - 為 AI 工作負載設計的智慧資源配置與縮放策略
- **Microsoft Foundry 整合** - 與 Microsoft Foundry 模型目錄與端點的無縫連接

---

## 🎯 範本與範例庫

### 精選：Microsoft Foundry 範本
**如果你要部署 AI 應用，從這裡開始！**

> **注意：** 這些範本示範各類 AI 模式。有些為外部 Azure Samples，其他為本地實作。

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**開始使用 AI 聊天**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第 2 章 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | External |
| [**開始使用 AI 代理**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第 2 章 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| External |
| [**Azure Search + OpenAI 示範**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第 2 章 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | External |
| [**OpenAI Chat App 快速開始**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第 2 章 | ⭐ | AzureOpenAI + Container Apps + Application Insights | External |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第 5 章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | External |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 第 8 章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | External |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | 第 5 章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | <strong>本地</strong> |

### 精選：完整學習情境
<strong>對應學習章節的生產就緒應用範本</strong>

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第 2 章 | ⭐ | 基本 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第 2 章 | ⭐⭐ | 使用 Azure AI Search 的 RAG 實作 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第 4 章 | ⭐⭐ | 文件智能整合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第 5 章 | ⭐⭐⭐ | 代理框架與函式呼叫 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第 8 章 | ⭐⭐⭐ | 企業級 AI 協調編排 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第 5 章 | ⭐⭐⭐⭐ | 客戶與庫存代理的多代理架構 |

### 以範例類型學習

> **📌 本地 vs 外部 範例：**  
> <strong>本地範例</strong>（在此 repo 中）＝ 可立即使用  
> <strong>外部範例</strong>（Azure Samples）＝ 從連結的儲存庫複製

#### 本地範例（可立即使用）
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - 完整的生產就緒實作，含 ARM 範本
  - 多代理架構（Customer + Inventory 代理）
  - 完整的監控與評估
  - 透過 ARM 範本一鍵部署

#### 本地範例 - Container 應用（第 2-5 章）
**本儲存庫中的完整容器部署範例：**
- [**Container App Examples**](examples/container-app/README.md) - 容器化部署完整指南
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - 基本 REST API，支援 scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - 生產就緒的多服務部署
  - 快速開始、生產與進階部署模式
  - 監控、安全與成本最佳化指引

#### 外部範例 - 簡單應用（第 1-2 章）
**克隆這些 Azure Samples 儲存庫以開始：**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本部署模式
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 靜態內容部署
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署

#### 外部範例 - 資料庫整合（第 3-4 章）  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 資料庫連線模式
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 無伺服器資料工作流程

#### 外部範例 - 進階模式（第 4-8 章）
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服務架構
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - 背景處理  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - 生產就緒的 ML 模式

### 外部範本集合
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - 精選官方與社群範本集錦
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 的範本文件
- [**Examples Directory**](examples/README.md) - 本地學習範例與詳細說明

---

## 📚 學習資源與參考資料

### 快速參考
- [<strong>指令速查表</strong>](resources/cheat-sheet.md) - 依章節整理的必要 azd 指令
- [<strong>術語表</strong>](resources/glossary.md) - Azure 與 azd 術語  
- [<strong>常見問題</strong>](resources/faq.md) - 依學習章節整理的常見問題
- [<strong>學習指南</strong>](resources/study-guide.md) - 完整的練習題目

### 實作工作坊
- [**AI 工作坊實驗室**](docs/chapter-02-ai-development/ai-workshop-lab.md) - 讓你的 AI 解決方案可由 AZD 部署（2-3 小時）
- [<strong>互動式工作坊</strong>](workshop/README.md) - 使用 MkDocs 與 GitHub Codespaces 的 8 模組引導練習
  - 流程：導入 → 選擇 → 驗證 → 分解 → 設定 → 自訂 → 清場 → 總結

### 外部學習資源
- [Azure 開發者 CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 價格計算器](https://azure.microsoft.com/pricing/calculator/)
- [Azure 狀態](https://status.azure.com/)

### 適用於你的編輯器的 AI 代理技能
- [**skills.sh 上的 Microsoft Azure 技能**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 個開放的代理技能，涵蓋 Azure AI、Foundry、部署、診斷、成本優化等。將它們安裝到 GitHub Copilot、Cursor、Claude Code 或任何受支援的代理：
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 快速疑難排解指南

**常見的初學者問題與即時解決方法：**

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
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# 嘗試不同的 Azure 區域
azd env set AZURE_LOCATION "westus2"
azd up

# 或在開發環境使用較小的 SKU
# 編輯 infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# 選項 1：清理並重試
azd down --force --purge
azd up

# 選項 2：只修復基礎架構
azd provision

# 選項 3：檢查詳細狀態
azd show

# 選項 4：在 Azure Monitor 查看日誌
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# 重新驗證
az logout
az login

azd auth logout
azd auth login

# 驗證身份
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD 會產生唯一的名稱，但若發生衝突：
azd down --force --purge

# 則以全新環境重試
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 範本部署耗時過長</strong></summary>

**一般等待時間：**
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
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# 檢查你的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 你至少需要具有「Contributor」角色
# 請向你的 Azure 管理員要求授予：
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
- **尋求協助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 課程完成與認證

### 進度追蹤
追蹤你在每章節的學習進度：

- [ ] **第 1 章**：基礎與快速入門 ✅
- [ ] **第 2 章**：以 AI 為先的開發 ✅  
- [ ] **第 3 章**：設定與驗證 ✅
- [ ] **第 4 章**：基礎設施即程式碼與部署 ✅
- [ ] **第 5 章**：多代理 AI 解決方案 ✅
- [ ] **第 6 章**：部署前驗證與規劃 ✅
- [ ] **第 7 章**：疑難排解與除錯 ✅
- [ ] **第 8 章**：生產與企業模式 ✅

### 學習驗證
完成每章後，透過以下方式驗證你的知識：
1. <strong>實作練習</strong>：完成該章的實作部署
2. <strong>知識檢核</strong>：查看該章的常見問題（FAQ）
3. <strong>社群討論</strong>：在 Azure Discord 分享你的經驗
4. <strong>下一章</strong>：前往下一個更高難度章節

### 課程完成的收益
完成所有章節後，你將會獲得：
- <strong>實務經驗</strong>：在 Azure 上部署真實的 AI 應用程式
- <strong>專業技能</strong>：具備企業級的部署能力  
- <strong>社群認可</strong>：成為 Azure 開發者社群的活躍成員
- <strong>職涯提升</strong>：需求熱絡的 AZD 與 AI 部署專業技能

---

## 🤝 社群與支援

### 尋求協助與支援
- <strong>技術問題</strong>：[回報錯誤與提出功能需求](https://github.com/microsoft/azd-for-beginners/issues)
- <strong>學習相關問題</strong>：[Microsoft Azure Discord 社群](https://discord.gg/microsoft-azure) 與 [![Microsoft Foundry 的 Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 專屬協助**：加入 [![Microsoft Foundry 的 Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- <strong>文件</strong>：[官方 Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### 來自 Microsoft Foundry Discord 的社群見解

**來自 #Azure 頻道的近期投票結果：**
- **45%** 的開發者希望將 AZD 用於 AI 工作負載
- <strong>主要挑戰</strong>：多服務部署、憑證管理、生產準備度  
- <strong>最多人要求</strong>：AI 專用範本、故障排解指南、最佳實務

**加入我們的社群，你可以：**
- 分享你的 AZD + AI 經驗並獲得協助
- 取得新 AI 範本的早期預覽
- 貢獻 AI 部署最佳實務
- 影響未來 AI + AZD 功能開發

### 為課程做出貢獻
我們歡迎貢獻！請閱讀我們的 [Contributing Guide](CONTRIBUTING.md) 以取得詳細資訊：
- <strong>內容改進</strong>：強化現有章節與範例
- <strong>新增範例</strong>：加入實際情境與範本  
- <strong>翻譯</strong>：協助維護多語系支援
- <strong>錯誤回報</strong>：提升內容的準確性與清晰度
- <strong>社群準則</strong>：遵循我們的包容性社群指引

---

## 📄 課程資訊

### 授權
本專案使用 MIT 許可證授權 - 詳情請參閱 [LICENSE](../../LICENSE) 檔案。

### 相關的 Microsoft 學習資源

我們團隊也製作其他完整的學習課程：

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
[![AI 代理 初學者](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![生成式 AI 初學者](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![生成式 AI（.NET）](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![生成式 AI（Java）](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![生成式 AI（JavaScript）](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Core Learning
[![機器學習 初學者](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![資料科學 初學者](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI 初學者](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![資安 初學者](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![網頁開發 初學者](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![物聯網 初學者](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR 開發 初學者](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Series
[![AI 配對程式設計的 Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET 的 Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot 冒險](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ 課程導覽

**🚀 準備開始學習了嗎？**

<strong>初學者</strong>：從 [第 1 章：基礎與快速入門](#-chapter-1-foundation--quick-start) 開始  
**AI 開發人員**：前往 [第 2 章：AI 優先開發](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
<strong>有經驗的開發人員</strong>：從 [第 3 章：設定與驗證](#️-chapter-3-configuration--authentication) 開始

<strong>下一步</strong>： [開始第 1 章 - AZD 基礎](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**:  
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意自動化翻譯可能包含錯誤或不精確之處。原始文件之母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不就因使用本翻譯而引起的任何誤解或誤譯負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->