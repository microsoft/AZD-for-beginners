# AZD 初學者：有結構的學習旅程

![AZD 初學者](../../translated_images/zh-MO/azdbeginners.5527441dd9f74068.webp) 

[![GitHub 觀察者](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub 分叉](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub 星標](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 自動翻譯（隨時更新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[阿拉伯語](../ar/README.md) | [孟加拉語](../bn/README.md) | [保加利亞語](../bg/README.md) | [緬甸語（Myanmar）](../my/README.md) | [中文（簡體）](../zh-CN/README.md) | [中文（繁體，香港）](../zh-HK/README.md) | [中文（繁體，澳門）](./README.md) | [中文（繁體，台灣）](../zh-TW/README.md) | [克羅地亞語](../hr/README.md) | [捷克語](../cs/README.md) | [丹麥語](../da/README.md) | [荷蘭語](../nl/README.md) | [愛沙尼亞語](../et/README.md) | [芬蘭語](../fi/README.md) | [法語](../fr/README.md) | [德語](../de/README.md) | [希臘語](../el/README.md) | [希伯來語](../he/README.md) | [印地語](../hi/README.md) | [匈牙利語](../hu/README.md) | [印尼語](../id/README.md) | [意大利語](../it/README.md) | [日語](../ja/README.md) | [卡納達語](../kn/README.md) | [韓語](../ko/README.md) | [立陶宛語](../lt/README.md) | [馬來語](../ms/README.md) | [馬拉雅拉姆語](../ml/README.md) | [馬拉地語](../mr/README.md) | [尼泊爾語](../ne/README.md) | [尼日利亞皮欽語](../pcm/README.md) | [挪威語](../no/README.md) | [波斯語（Farsi）](../fa/README.md) | [波蘭語](../pl/README.md) | [葡萄牙語（巴西）](../pt-BR/README.md) | [葡萄牙語（葡萄牙）](../pt-PT/README.md) | [旁遮普語（Gurmukhi）](../pa/README.md) | [羅馬尼亞語](../ro/README.md) | [俄語](../ru/README.md) | [塞爾維亞語（西里爾字母）](../sr/README.md) | [斯洛伐克語](../sk/README.md) | [斯洛維尼亞語](../sl/README.md) | [西班牙語](../es/README.md) | [斯瓦希里語](../sw/README.md) | [瑞典語](../sv/README.md) | [塔加洛語（菲律賓語）](../tl/README.md) | [泰米爾語](../ta/README.md) | [泰盧固語](../te/README.md) | [泰語](../th/README.md) | [土耳其語](../tr/README.md) | [烏克蘭語](../uk/README.md) | [烏爾都語](../ur/README.md) | [越南語](../vi/README.md)

> **想要在本機複製倉庫？**
>
> 此儲存庫包含超過 50 種語言的翻譯，會顯著增加下載大小。若要在不下載翻譯的情況下複製，請使用稀疏檢出（sparse checkout）：
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
> 這樣可以用更快的下載速度，取得完成課程所需的一切內容。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 azd 今日有什麼新功能

Azure Developer CLI 已超越傳統的網頁應用程式與 API。如今，azd 是將任何應用程式部署到 Azure 的單一工具——包括以 AI 為驅動的應用程式與智慧代理。

這對你意味著：

- **AI 代理現在是 azd 的一等工作負載。** 你可以使用相同的 `azd init` → `azd up` 工作流程來初始化、部署和管理 AI 代理專案。
- **Microsoft Foundry 整合** 將模型部署、代理託管與 AI 服務設定直接帶入 azd 範本生態系統。
- **核心工作流程沒有改變。** 無論你是部署代辦事項應用程式、微服務或多代理 AI 解決方案，指令都是相同的。

如果你之前用過 azd，AI 支援是自然延伸——不是另一個獨立工具或進階路線。若你是新手，會學到一套適用於所有情境的工作流程。

---

## 🚀 什麼是 Azure Developer CLI (azd)？

**Azure Developer CLI (azd)** 是一個以開發者為中心的命令列工具，讓部署應用程式到 Azure 變得簡單。你不需要手動建立並連接數十個 Azure 資源，只要一個指令就能部署整個應用程式。

### `azd up` 的魔力

```bash
# 這個單一指令完成所有工作：
# ✅ 建立所有 Azure 資源
# ✅ 配置網絡和安全性
# ✅ 建構你的應用程式代碼
# ✅ 部署到 Azure
# ✅ 提供你一個可用的網址
azd up
```

**就這樣！** 不用在 Azure 入口網站上點來點去，不用先學會複雜的 ARM 範本，也不用手動設定——只有在 Azure 上可運作的應用程式。

---

## ❓ Azure Developer CLI 與 Azure CLI：有什麼不同？

這是初學者最常問的問題。簡單的回答如下：

| 功能 | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| <strong>目的</strong> | 管理個別的 Azure 資源 | 部署完整的應用程式 |
| <strong>定位</strong> | 以基礎設施為中心 | 以應用程式為中心 |
| <strong>範例</strong> | `az webapp create --name myapp...` | `azd up` |
| <strong>學習曲線</strong> | 需要了解 Azure 服務 | 只需了解你的應用程式 |
| <strong>適合對象</strong> | DevOps、基礎設施 | 開發者、原型設計 |

### 簡單比喻

- **Azure CLI** 就像擁有建房子的所有工具——錘子、鋸子、釘子。你什麼都能建，但需要知道施工方法。
- **Azure Developer CLI** 就像找了承包商——你描述需求，他們負責施工。

### 何時使用哪一個

| 情境 | 使用這個 |
|----------|----------|
| "我想快速部署我的網站應用程式" | `azd up` |
| "我只需要建立一個儲存帳戶" | `az storage account create` |
| "我正在建立完整的 AI 應用程式" | `azd init --template azure-search-openai-demo` |
| "我需要除錯特定的 Azure 資源" | `az resource show` |
| "我想在數分鐘內取得可用於生產的部署" | `azd up --environment production` |

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

別從零開始！**Awesome AZD** 是社群蒐集的可立即部署範本集合：

| 資源 | 描述 |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | 瀏覽超過 200 個可一鍵部署的範本 |
| 🔗 [<strong>提交範本</strong>](https://github.com/Azure/awesome-azd/issues) | 向社群貢獻你的範本 |
| 🔗 [**GitHub 倉庫**](https://github.com/Azure/awesome-azd) | 給星並探索原始碼 |

### Awesome AZD 上熱門的 AI 範本

```bash
# 與 Microsoft Foundry 模型及 AI 搜尋結合的 RAG 對話
azd init --template azure-search-openai-demo

# 快速 AI 對話應用程式
azd init --template openai-chat-app-quickstart

# 搭配 Foundry Agent 的 AI 代理
azd init --template get-started-with-ai-agents
```

---

## 🎯 三個步驟開始

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

# 部署到 Azure（建立所有項目！）
azd up
```

**🎉 就這樣！** 你的應用程式現在已在 Azure 上運行。

### 清理（別忘記！）

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 如何使用本課程

本課程為「漸進式學習」設計——從你熟悉的地方開始，逐步進階：

| 你的經驗 | 從這裡開始 |
|-----------------|------------|
| **完全沒有 Azure 經驗** | [第 1 章：基礎](#-chapter-1-foundation--quick-start) |
| **懂 Azure、但剛接觸 AZD** | [第 1 章：基礎](#-chapter-1-foundation--quick-start) |
| **想部署 AI 應用程式** | [第 2 章：以 AI 為先的開發](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| <strong>想要實作練習</strong> | [🎓 互動式工作坊](workshop/README.md) - 3-4 小時引導實作 |
| <strong>需要生產環境模式</strong> | [第 8 章：生產與企業模式](#-chapter-8-production--enterprise-patterns) |

### 快速設定

1. **Fork 這個儲存庫**: [![GitHub 分叉](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. <strong>克隆它</strong>: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. <strong>取得協助</strong>: [Azure Discord 社群](https://discord.com/invite/ByRwuEEgH4)

> **想要在本機複製倉庫？**
>
> 此儲存庫包含超過 50 種語言的翻譯，會顯著增加下載大小。若要在不下載翻譯的情況下複製，請使用稀疏檢出（sparse checkout）：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 這樣可以用更快的下載速度，取得完成課程所需的一切內容。


## 課程概覽

透過結構化章節掌握 Azure Developer CLI (azd)，以漸進學習方式設計。**特別強調結合 Microsoft Foundry 的 AI 應用部署。**

### 為什麼本課程對現代開發者很重要

根據 Microsoft Foundry Discord 社群見解，**45% 的開發者想使用 AZD 來處理 AI 工作負載**，但他們會遇到以下挑戰：
- 複雜的多服務 AI 架構
- 生產環境 AI 部署的最佳實務  
- Azure AI 服務的整合與設定
- AI 工作負載的成本優化
- AI 專屬部署問題的故障排除

### 學習目標

完成本結構化課程後，你將能夠：
- **掌握 AZD 基礎**：核心概念、安裝與設定
- **部署 AI 應用程式**：在 AZD 中使用 Microsoft Foundry 服務
- <strong>實作基礎設施即程式碼</strong>：使用 Bicep 範本管理 Azure 資源
- <strong>排解部署問題</strong>：解決常見問題並除錯
- <strong>為生產做優化</strong>：安全性、擴充、監控與成本管理
- <strong>構建多代理解決方案</strong>：部署複雜的 AI 架構

## 🗺️ 課程地圖：依章節快速導航

每一章皆有專屬 README，包含學習目標、快速上手與練習：

| 章節 | 主題 | 課程 | 需時 | 難度 |
|---------|-------|---------|----------|------------|
| **[第 1 章：基礎](docs/chapter-01-foundation/README.md)** | 入門 | [AZD 基礎](docs/chapter-01-foundation/azd-basics.md) &#124; [安裝](docs/chapter-01-foundation/installation.md) &#124; [第一個專案](docs/chapter-01-foundation/first-project.md) | 30-45 分鐘 | ⭐ |
| **[第 2 章：AI 開發](docs/chapter-02-ai-development/README.md)** | 以 AI 為先的應用程式 | [Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI 代理人](docs/chapter-02-ai-development/agents.md) &#124; [模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [工作坊](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 小時 | ⭐⭐ |
| **[第 3 章：設定](docs/chapter-03-configuration/README.md)** | 驗證與安全 | [設定](docs/chapter-03-configuration/configuration.md) &#124; [驗證與安全](docs/chapter-03-configuration/authsecurity.md) | 45-60 分鐘 | ⭐⭐ |
| **[第 4 章：基礎架構](docs/chapter-04-infrastructure/README.md)** | IaC 與部署 | [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [資源佈建](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 小時 | ⭐⭐⭐ |
| **[第 5 章：多代理](docs/chapter-05-multi-agent/README.md)** | AI 代理解決方案 | [零售情境](examples/retail-scenario.md) &#124; [協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 小時 | ⭐⭐⭐⭐ |
| **[第 6 章：部署前準備](docs/chapter-06-pre-deployment/README.md)** | 規劃與驗證 | [預檢查](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [應用程式洞察](docs/chapter-06-pre-deployment/application-insights.md) | 1 小時 | ⭐⭐ |
| **[第 7 章：疑難排解](docs/chapter-07-troubleshooting/README.md)** | 除錯與修復 | [常見問題](docs/chapter-07-troubleshooting/common-issues.md) &#124; [除錯](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI 問題](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 小時 | ⭐⭐ |
| **[第 8 章：生產環境](docs/chapter-08-production/README.md)** | 企業模式 | [生產實務](docs/chapter-08-production/production-ai-practices.md) | 2-3 小時 | ⭐⭐⭐⭐ |
| **[🎓 工作坊](workshop/README.md)** | 實作實驗室 | [介紹](workshop/docs/instructions/0-Introduction.md) &#124; [範本選擇](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [驗證](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [解構範本](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [設定](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [自訂](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [拆除基礎架構](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [總結](workshop/docs/instructions/7-Wrap-up.md) | 3-4 小時 | ⭐⭐ |

**總課程時長：** ~10-14 小時 | **技能進階：** 初學者 → 可投入生產

---

## 📚 學習章節

<em>根據經驗程度與目標選擇你的學習路徑</em>

### 🚀 第 1 章：基礎與快速入門
<strong>先決條件</strong>：Azure 訂閱，基本命令列知識  
<strong>時長</strong>：30-45 分鐘  
<strong>複雜度</strong>：⭐

#### 你會學到
- 了解 Azure Developer CLI 的基本概念
- 在你的平台上安裝 AZD
- 你的第一次成功部署

#### 學習資源
- **🎯 從這裡開始**: [什麼是 Azure Developer CLI？](#what-is-azure-developer-cli)
- **📖 理論**: [AZD 基礎](docs/chapter-01-foundation/azd-basics.md) - 核心概念與術語
- **⚙️ 設定**: [安裝與設定](docs/chapter-01-foundation/installation.md) - 平台特定指南
- **🛠️ 實作**: [你的第一個專案](docs/chapter-01-foundation/first-project.md) - 逐步教學
- **📋 快速參考**: [指令速查表](resources/cheat-sheet.md)

#### 實作練習
```bash
# 快速安裝檢查
azd version

# 部署您的第一個應用程式
azd init --template todo-nodejs-mongo
azd up
```

**💡 章節成果**: 使用 AZD 成功部署一個簡單的 Web 應用程式到 Azure

**✅ 成功驗證:**
```bash
# 完成第一章後，你應該能夠：
azd version              # 顯示已安裝的版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署到 Azure
azd show                # 顯示執行中應用程式的 URL
# 應用程式在瀏覽器中開啟並正常運作
azd down --force --purge  # 清理資源
```

**📊 所需時間:** 30-45 分鐘  
**📈 完成後技能等級:** 能獨立部署基本應用程式
**📈 完成後技能等級:** 能獨立部署基本應用程式

---

### 🤖 第 2 章：以 AI 為先的開發（建議 AI 開發者）
<strong>先決條件</strong>：完成第 1 章  
<strong>時長</strong>：1-2 小時  
<strong>複雜度</strong>：⭐⭐

#### 你會學到
- Microsoft Foundry 與 AZD 的整合
- 部署以 AI 驅動的應用程式
- 了解 AI 服務的設定

#### 學習資源
- **🎯 從這裡開始**: [Microsoft Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI 代理人**: [AI 代理人指南](docs/chapter-02-ai-development/agents.md) - 使用 AZD 部署智慧代理人
- **📖 模式**: [AI 模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) - 部署與管理 AI 模型
- **🛠️ 工作坊**: [AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - 讓你的 AI 解決方案符合 AZD
- **🎥 互動指南**: [工作坊教材](workshop/README.md) - 以瀏覽器為基礎的學習，使用 MkDocs * DevContainer 開發環境
- **📋 範本**: [Microsoft Foundry 範本](#工作坊資源)
- **📝 範例**: [AZD 部署範例](examples/README.md)

#### 實作練習
```bash
# 部署您的第一個 AI 應用程式
azd init --template azure-search-openai-demo
azd up

# 試用更多 AI 範本
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 章節成果**: 部署並設定具有 RAG 能力的 AI 聊天應用程式

**✅ 成功驗證:**
```bash
# 完成第2章後，您應該能夠：
azd init --template azure-search-openai-demo
azd up
# 測試 AI 聊天介面
# 提出問題並取得附帶來源的 AI 回應
# 驗證搜尋整合是否運作
azd monitor  # 檢查 Application Insights 是否顯示遙測資料
azd down --force --purge
```

**📊 所需時間:** 1-2 小時  
**📈 完成後技能等級:** 能部署並設定達到生產就緒的 AI 應用程式  
**💰 成本注意事項:** 了解開發環境約 $80-150/月，生產環境約 $300-3,500/月

#### 💰 AI 部署的成本考量

**開發環境（估計 $80-150/月）：**
- Microsoft Foundry 模型（按用量付費）： $0-50/月（取決於 token 使用量）
- AI Search（Basic 層）： $75/月
- Container Apps（Consumption）： $0-20/月
- 儲存空間（Standard）： $1-5/月

**生產環境（估計 $300-3,500+/月）：**
- Microsoft Foundry 模型（PTU 提供穩定效能）： $3,000+/月 或 在高用量情況下使用按用量付費
- AI Search（Standard 層）： $250/月
- Container Apps（Dedicated）： $50-100/月
- Application Insights： $5-50/月
- 儲存空間（Premium）： $10-50/月

**💡 成本優化小技巧：**
- 在學習時使用 <strong>免費等級</strong> 的 Microsoft Foundry 模型（包含 Azure OpenAI 每月 50,000 tokens）
- 在非開發期間執行 `azd down` 以取消配置資源
- 從以消耗計費開始，僅在生產環境升級為 PTU
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

### ⚙️ 第 3 章：設定與驗證
<strong>先決條件</strong>：完成第 1 章  
<strong>時長</strong>：45-60 分鐘  
<strong>複雜度</strong>：⭐⭐

#### 你會學到
- 環境設定與管理
- 驗證與安全最佳實務
- 資源命名與組織

#### 學習資源
- **📖 設定**: [設定指南](docs/chapter-03-configuration/configuration.md) - 環境設定
- **🔐 安全**: [驗證模式與受管理身分](docs/chapter-03-configuration/authsecurity.md) - 驗證模式
- **📝 範例**: [資料庫應用範例](examples/database-app/README.md) - AZD 資料庫範例

#### 實作練習
- 設定多個環境（dev、staging、prod）
- 設定受管理身分驗證
- 實作環境特定的設定

**💡 章節成果**: 使用恰當的驗證與安全性管理多個環境

---

### 🏗️ 第 4 章：基礎架構即程式碼與部署
<strong>先決條件</strong>：完成第 1-3 章  
<strong>時長</strong>：1-1.5 小時  
<strong>複雜度</strong>：⭐⭐⭐

#### 你會學到
- 進階部署模式
- 使用 Bicep 的基礎架構即程式碼
- 資源佈建策略

#### 學習資源
- **📖 部署**: [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) - 完整工作流程
- **🏗️ 佈建**: [資源佈建](docs/chapter-04-infrastructure/provisioning.md) - Azure 資源管理
- **📝 範例**: [Container App 範例](../../examples/container-app) - 容器化部署

#### 實作練習
- 建立自訂的 Bicep 範本
- 部署多服務應用程式
- 實作藍綠部署策略

**💡 章節成果**: 使用自訂的基礎架構範本部署複雜的多服務應用程式

---

### 🎯 第 5 章：多代理 AI 解決方案（進階）
<strong>先決條件</strong>：完成第 1-2 章  
<strong>時長</strong>：2-3 小時  
<strong>複雜度</strong>：⭐⭐⭐⭐

#### 你會學到
- 多代理架構模式
- 代理協作與協調
- 生產就緒的 AI 部署

#### 學習資源
- **🤖 重點專案**: [零售多代理解決方案](examples/retail-scenario.md) - 完整實作
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

**💡 章節成果**: 部署並管理一個生產就緒的多代理 AI 解決方案，包含顧客與庫存代理

---

### 🔍 第 6 章：部署前驗證與規劃
<strong>先決條件</strong>：完成第 4 章  
<strong>時長</strong>：1 小時  
<strong>複雜度</strong>：⭐⭐

#### 你會學到
- 容量規劃與資源驗證
- SKU 選擇策略
- 預檢查與自動化

#### 學習資源
- **📊 規劃**: [容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) - 資源驗證
- **💰 選擇**: [SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) - 成本效益選擇
- **✅ 驗證**: [預檢查](docs/chapter-06-pre-deployment/preflight-checks.md) - 自動化指令

#### 實作練習
- 執行容量驗證腳本
- 為成本優化 SKU 選擇
- 實作自動化的部署前檢查

**💡 章節成果**: 在執行前驗證並優化部署

---

### 🚨 第 7 章：疑難排解與除錯
<strong>先決條件</strong>：完成任一部署章節  
<strong>時長</strong>：1-1.5 小時  
<strong>複雜度</strong>：⭐⭐

#### 你會學到
- 系統性除錯方法
- 常見問題與解決方案
- AI 專屬的疑難排解

#### 學習資源
- **🔧 常見問題**: [常見問題](docs/chapter-07-troubleshooting/common-issues.md) - 問答與解決方案
- **🕵️ 除錯**: [除錯指南](docs/chapter-07-troubleshooting/debugging.md) - 逐步策略
- **🤖 AI 問題**: [AI 特定疑難排解](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI 服務問題

#### 實作練習
- 診斷部署失敗
- 解決驗證問題
- 除錯 AI 服務連線問題

**💡 章節成果**: 能獨立診斷並解決常見的部署問題

---

### 🏢 第 8 章：生產環境與企業模式
<strong>先決條件</strong>：完成第 1-4 章  
<strong>時長</strong>：2-3 小時  
<strong>複雜度</strong>：⭐⭐⭐⭐

#### 你會學到
- 生產部署策略
- 企業安全模式
- 監控與成本優化

#### 學習資源
- **🏭 生產**: [生產 AI 最佳實務](docs/chapter-08-production/production-ai-practices.md) - 企業模式
- **📝 範例**: [微服務範例](../../examples/microservices) - 複雜架構
- **📊 監控**: [Application Insights 整合](docs/chapter-06-pre-deployment/application-insights.md) - 監控

#### 實作練習
- 實作企業安全模式
- 建立完整監控
- 以適當治理部署至生產環境

**💡 章節成果**: 部署具備完整生產能力的企業就緒應用程式

---

## 🎓 工作坊概覽：實作學習體驗

> **⚠️ 工作坊狀態：積極開發中**  
> 工作坊教材目前正在開發與修訂。核心模組可使用，但某些進階章節尚未完成。我們正積極工作以完成所有內容。 [追蹤進度 →](workshop/README.md)

### 互動式工作坊教材
<strong>透過瀏覽器工具與引導式練習的完整實作學習</strong>

我們的工作坊教材提供結構化且互動的學習體驗，以補充上方的章節課程。此工作坊同時適用於自學與講師引導的課程。

#### 🛠️ 工作坊特色
- <strong>瀏覽器介面</strong>: Complete MkDocs-powered workshop with search, copy, and theme features
- **GitHub Codespaces 整合**: 一鍵建立開發環境
- <strong>結構化學習路徑</strong>: 8 模組的引導練習（總計 3-4 小時）
- <strong>進階式方法論</strong>: 介紹 → 選擇 → 驗證 → 解構 → 設定 → 客製化 → 拆除 → 總結
- **互動式 DevContainer 環境**: 預先設定的工具與相依項

#### 📚 工作坊模組結構
此工作坊遵循<strong>8 模組進階方法論</strong>，帶領您從探索到部署精通：

| 模組 | 主題 | 您將做什麼 | 時長 |
|--------|-------|----------------|----------|
| **0. 介紹** | 工作坊概覽 | 了解學習目標、先決條件及工作坊結構 | 15 分鐘 |
| **1. 選擇** | 範本探索 | 探索 AZD 範本並為您的情境選擇合適的 AI 範本 | 20 分鐘 |
| **2. 驗證** | 部署與驗證 | 使用 `azd up` 部署範本並驗證基礎設施運作 | 30 分鐘 |
| **3. 解構** | 理解結構 | 使用 GitHub Copilot 探索範本架構、Bicep 檔案與程式碼組織 | 30 分鐘 |
| **4. 設定** | azure.yaml 深入解析 | 精通 `azure.yaml` 設定、生命週期掛勾與環境變數 | 30 分鐘 |
| **5. 客製化** | 自訂化設定 | 啟用 AI Search、追蹤、評估，並依您的情境進行自訂 | 45 分鐘 |
| **6. 拆除** | 清理 | 使用 `azd down --purge` 安全移除資源 | 15 分鐘 |
| **7. 總結** | 後續步驟 | 回顧成就、關鍵概念，並持續您的學習之旅 | 15 分鐘 |

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
# 在儲存庫中按一下「Code」→「Create codespace on main」

# 選項 2：本機開發
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 按照 workshop/README.md 中的設定說明進行
```

#### 🎯 工作坊學習成果
完成工作坊後，參與者將會：
- **部署生產等級 AI 應用**: 使用 AZD 與 Microsoft Foundry 服務
- <strong>精通多代理架構</strong>: 實作協調的 AI 代理解決方案
- <strong>實作安全最佳實務</strong>: 設定驗證與存取控制
- <strong>為擴展最佳化</strong>: 設計具有成本效益且高效能的部署
- <strong>排解部署問題</strong>: 自行解決常見問題

#### 📖 工作坊資源
- **🎥 互動式指南**: [工作坊教材](workshop/README.md) - 瀏覽器式學習環境
- **📋 模組逐步說明**:
  - [0. 介紹](workshop/docs/instructions/0-Introduction.md) - 工作坊概覽與目標
  - [1. 選擇](workshop/docs/instructions/1-Select-AI-Template.md) - 尋找並選擇 AI 範本
  - [2. 驗證](workshop/docs/instructions/2-Validate-AI-Template.md) - 部署並驗證範本
  - [3. 解構](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - 探索範本架構
  - [4. 設定](workshop/docs/instructions/4-Configure-AI-Template.md) - 精通 azure.yaml
  - [5. 客製化](workshop/docs/instructions/5-Customize-AI-Template.md) - 依您的情境客製化
  - [6. 拆除](workshop/docs/instructions/6-Teardown-Infrastructure.md) - 清理資源
  - [7. 總結](workshop/docs/instructions/7-Wrap-up.md) - 回顧與後續步驟
- **🛠️ AI 工作坊實驗室**: [AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - 以 AI 為重點的練習
- **💡 快速開始**: [工作坊設定指南](workshop/README.md#quick-start) - 環境設定

<strong>適合對象</strong>: 企業訓練、 大學課程、自主學習，以及開發者訓練營。

---

## 📖 深入探討：AZD 能力

超越基礎功能，AZD 提供強大的功能以支援生產部署：

- <strong>範本式部署</strong> - 使用預建範本來處理常見應用模式
- <strong>基礎架構即程式碼</strong> - 使用 Bicep 或 Terraform 管理 Azure 資源  
- <strong>整合式工作流程</strong> - 無縫地佈建、部署與監控應用程式
- <strong>開發者友好</strong> - 優化以提升開發者生產力與體驗

### **AZD + Microsoft Foundry：AI 部署的完美選擇**

**為何為 AI 解決方案選擇 AZD？** AZD 解決了 AI 開發者面臨的主要挑戰：

- **AI 就緒範本** - 為 Microsoft Foundry Models、Cognitive Services 與機器學習工作負載預先配置的範本
- **安全的 AI 部署** - 內建 AI 服務、API 金鑰與模型端點的安全模式  
- **生產 AI 範式** - 可擴展且具成本效益的 AI 應用部署最佳實務
- **端對端 AI 工作流程** - 從模型開發到生產部署並搭配適當監控
- <strong>成本最佳化</strong> - 對 AI 工作負載進行智慧資源配置與縮放策略
- **Microsoft Foundry 整合** - 無縫連接至 Microsoft Foundry 模型目錄與端點

---

## 🎯 範本與範例庫

### 精選：Microsoft Foundry 範本
**如果要部署 AI 應用，從這裡開始！**

> **注意：** 這些範本展示各種 AI 範式。有些來自外部的 Azure 示例，其他則為本地實作。

| 範本 | 章節 | 複雜度 | 服務 | 類型 |
|----------|---------|------------|----------|------|
| [**開始使用 AI 聊天**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 章節 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | 外部 |
| [**開始使用 AI 代理**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 章節 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| 外部 |
| [**Azure Search + OpenAI 示範**](https://github.com/Azure-Samples/azure-search-openai-demo) | 章節 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | 外部 |
| [**OpenAI 聊天應用 快速入門**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 章節 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 章節 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso 聊天 RAG**](https://github.com/Azure-Samples/contoso-chat) | 章節 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | 外部 |
| [<strong>零售多代理解決方案</strong>](examples/retail-scenario.md) | 章節 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | <strong>本地</strong> |

### 精選：完整學習情境
<strong>對應學習章節的生產就緒應用範本</strong>

| 範本 | 學習章節 | 複雜度 | 主要學習 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 章節 2 | ⭐ | 基本 AI 部署範式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 章節 2 | ⭐⭐ | 使用 Azure AI Search 的 RAG 實作 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 章節 4 | ⭐⭐ | 文件智慧整合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 章節 5 | ⭐⭐⭐ | 代理框架與函式呼叫 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 章節 8 | ⭐⭐⭐ | 企業 AI 編排 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 章節 5 | ⭐⭐⭐⭐ | 包含客戶與庫存代理的多代理架構 |

### 以範例學習類型

> **📌 本地 vs 外部 範例：**  
> <strong>本地範例</strong>（在此倉庫內）= 可立即使用  
> <strong>外部範例</strong>（Azure Samples）= 從連結的倉庫複製

#### 本地範例（可立即使用）
- [<strong>零售多代理解決方案</strong>](examples/retail-scenario.md) - 使用 ARM 範本的完整生產就緒實作
  - 多代理架構（客戶 + 庫存 代理）
  - 完整的監控與評估
  - 透過 ARM 範本一鍵部署

#### 本地範例 - 容器應用（章節 2-5）
**本倉庫中的完整容器部署範例：**
- [<strong>容器應用範例</strong>](examples/container-app/README.md) - 完整的容器化部署指南
  - [簡單 Flask API](../../examples/container-app/simple-flask-api) - 具備 scale-to-zero 的基本 REST API
  - [微服務架構](../../examples/container-app/microservices) - 生產就緒的多服務部署
  - Quick Start, Production, and Advanced deployment patterns
  - 監控、安全與成本最佳化指引

#### 外部範例 - 簡單應用（章節 1-2）
**複製這些 Azure Samples 倉庫以開始：**
- [簡單 Web 應用 - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本部署模式
- [靜態網站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 靜態內容部署
- [容器應用 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署

#### 外部範例 - 資料庫整合（章節 3-4）  
- [資料庫應用 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 資料庫連線模式
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 無伺服器資料工作流程

#### 外部範例 - 進階模式（章節 4-8）
- [Java 微服務](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服務架構
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - 背景處理  
- [企業 ML 管道](https://github.com/Azure-Samples/mlops-v2) - 生產就緒的 ML 模式

### 外部範本集合
- [**官方 AZD 範本庫**](https://azure.github.io/awesome-azd/) - 精選的官方與社群範本集合
- [**Azure Developer CLI 範本**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 範本文件
- [<strong>範例目錄</strong>](examples/README.md) - 具有詳細說明的本地學習範例

---

## 📚 學習資源與參考

### 快速參考
- [<strong>指令速查表</strong>](resources/cheat-sheet.md) - 按章節整理的必要 azd 指令
- [<strong>術語表</strong>](resources/glossary.md) - Azure 與 azd 術語  
- [<strong>常見問答</strong>](resources/faq.md) - 按學習章節整理的常見問題
- [<strong>學習指南</strong>](resources/study-guide.md) - 全面性的實作練習

### 實作工作坊
- [**AI 工作坊實驗室**](docs/chapter-02-ai-development/ai-workshop-lab.md) - 讓您的 AI 解決方案可透過 AZD 部署（2-3 小時）
- [<strong>互動工作坊</strong>](workshop/README.md) - 使用 MkDocs 與 GitHub Codespaces 的 8 模組引導練習
  - 流程：介紹 → 選擇 → 驗證 → 解構 → 設定 → 客製化 → 拆除 → 總結

### 外部學習資源
- [Azure 開發者 CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 價格計算器](https://azure.microsoft.com/pricing/calculator/)
- [Azure 狀態](https://status.azure.com/)

### 為你的編輯器的 AI 代理技能
- [**skills.sh 上的 Microsoft Azure 技能**](https://skills.sh/microsoft/github-copilot-for-azure) - 有 37 個開放的代理技能，涵蓋 Azure AI、Foundry、部署、診斷、成本優化等。可安裝於 GitHub Copilot、Cursor、Claude Code 或任何支援的代理：
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 快速疑難排解指南

**初學者常見問題及即時解決方法：**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

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
# 嘗試不同的 Azure 區域
azd env set AZURE_LOCATION "westus2"
azd up

# 或於開發環境使用較小的 SKU
# 編輯 infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# 選項 1：清除並重試
azd down --force --purge
azd up

# 選項 2：只修復基礎架構
azd provision

# 選項 3：檢查詳細狀態
azd show

# 選項 4：在 Azure Monitor 中檢查日誌
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# 重新驗證身份
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

# 然後在全新環境中重試
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**正常等待時間：**
- 簡單的網頁應用程式：5-10 分鐘
- 含資料庫的應用程式：10-15 分鐘
- AI 應用程式：15-25 分鐘（OpenAI 的佈建較慢）

```bash
# 檢查進度
azd show

# 如果卡住超過 30 分鐘，請檢查 Azure 入口網站：
azd monitor
# 尋找失敗的部署
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# 檢查你的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 你至少需要 "Contributor" 角色
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

# 檢查特定服務
azd env get-values
# 尋找 *_URL 變數
```
</details>

### 📚 完整疑難排解資源

- **常見問題指南：** [詳細解決方案](docs/chapter-07-troubleshooting/common-issues.md)
- **AI 專屬問題：** [AI 疑難排解](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **除錯指南：** [逐步除錯](docs/chapter-07-troubleshooting/debugging.md)
- **取得協助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 課程完成與證書

### 進度追蹤
追蹤你在各章節的學習進度：

- [ ] **第 1 章**：基礎與快速入門 ✅
- [ ] **第 2 章**：AI 優先開發 ✅  
- [ ] **第 3 章**：設定與驗證 ✅
- [ ] **第 4 章**：基礎設施即程式碼與部署 ✅
- [ ] **第 5 章**：多代理 AI 解決方案 ✅
- [ ] **第 6 章**：部署前驗證與規劃 ✅
- [ ] **第 7 章**：疑難排解與除錯 ✅
- [ ] **第 8 章**：生產與企業模式 ✅

### 學習驗證
完成每章後，驗證你的知識：
1. <strong>實作練習</strong>：完成該章的實作部署
2. <strong>知識檢核</strong>：檢閱該章的常見問題（FAQ）區
3. <strong>社群討論</strong>：在 Azure Discord 分享你的經驗
4. <strong>下一章節</strong>：進入下一個複雜度層級

### 完成課程的好處
完成所有章節後，你將擁有：
- <strong>實務經驗</strong>：在 Azure 部署真實的 AI 應用程式
- <strong>專業技能</strong>：企業級部署能力  
- <strong>社群認可</strong>：成為活躍的 Azure 開發者社群成員
- <strong>職涯升遷</strong>：具備熱門的 AZD 與 AI 部署專業技能

---

## 🤝 社群與支援

### 取得協助與支援
- **技術問題：** [回報錯誤與功能請求](https://github.com/microsoft/azd-for-beginners/issues)
- **學習問題：** [Microsoft Azure Discord 社群](https://discord.gg/microsoft-azure) 和 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 專屬協助：** 加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **文件：** [官方 Azure 開發者 CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### 來自 Microsoft Foundry Discord 的社群見解

**來自 #Azure 頻道的最新投票結果：**
- **45%** 的開發者希望使用 AZD 進行 AI 工作負載
- <strong>主要挑戰</strong>：多服務部署、憑證管理、生產準備度  
- <strong>最常被請求</strong>：AI 專用模板、疑難排解指南、最佳實務

**加入我們的社群以：**
- 分享你的 AZD + AI 經驗並獲得協助
- 取得新 AI 模板的搶先預覽
- 為 AI 部署最佳實務做出貢獻
- 影響未來 AI + AZD 功能的開發

### 為課程做出貢獻
我們歡迎貢獻！請閱讀我們的 [貢獻指南](CONTRIBUTING.md) 以了解詳細資訊：
- <strong>內容改善</strong>：增強現有章節與範例
- <strong>新增範例</strong>：加入真實世界情境與範本  
- <strong>翻譯</strong>：協助維護多語系支援
- <strong>錯誤回報</strong>：改善準確性與清晰度
- <strong>社群準則</strong>：遵循我們的包容性社群指南

---

## 📄 課程資訊

### 授權
本專案採用 MIT 授權 - 詳情請見 [LICENSE](../../LICENSE) 檔案。

### 相關的 Microsoft 學習資源

我們的團隊也製作其他完整的學習課程：

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j 初學者入門](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js 初學者入門](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain 初學者入門](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / 代理
[![AZD 初學者入門](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI 初學者入門](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP 初學者入門](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI 代理 初學者入門](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### 生成式 AI 系列
[![生成式 AI 初學者入門](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### 核心學習
[![機器學習 初學者入門](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![資料科學 初學者入門](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI 初學者入門](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![資安 初學者入門](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![網頁開發 初學者入門](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![物聯網 初學者入門](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR 開發 初學者入門](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot 系列
[![Copilot：AI 結對編程](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot：C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot 冒險](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ 課程導覽

**🚀 準備開始學習？**

<strong>初學者</strong>: 從 [第 1 章: 基礎與快速上手](#-chapter-1-foundation--quick-start)  
**AI 開發者**: 前往 [第 2 章: 以 AI 為先的開發](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
<strong>進階開發者</strong>: 開始於 [第 3 章: 設定與驗證](#️-chapter-3-configuration--authentication)

**Next Steps**: [開始第 1 章 - AZD 基礎](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**:
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們竭力確保準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為具權威性的版本。對於關鍵資訊，建議採用專業人工翻譯。我們對因使用此翻譯而引致的任何誤解或曲解概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->