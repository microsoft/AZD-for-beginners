# AZD 初學者指南：結構化學習旅程

![AZD 初學者](../../translated_images/zh-TW/azdbeginners.5527441dd9f74068.webp) 

[![GitHub 觀察者](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub 分叉](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub 星標](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord 社群](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord 社群](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 自動翻譯（即時更新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[阿拉伯語](../ar/README.md) | [孟加拉語](../bn/README.md) | [保加利亞語](../bg/README.md) | [緬甸語（Myanmar）](../my/README.md) | [中文（簡體）](../zh-CN/README.md) | [中文（繁體，香港）](../zh-HK/README.md) | [中文（繁體，澳門）](../zh-MO/README.md) | [中文（繁體，台灣）](./README.md) | [克羅埃西亞語](../hr/README.md) | [捷克語](../cs/README.md) | [丹麥語](../da/README.md) | [荷蘭語](../nl/README.md) | [愛沙尼亞語](../et/README.md) | [芬蘭語](../fi/README.md) | [法語](../fr/README.md) | [德語](../de/README.md) | [希臘語](../el/README.md) | [希伯來語](../he/README.md) | [印地語](../hi/README.md) | [匈牙利語](../hu/README.md) | [印尼語](../id/README.md) | [義大利語](../it/README.md) | [日語](../ja/README.md) | [坎納達語](../kn/README.md) | [韓語](../ko/README.md) | [立陶宛語](../lt/README.md) | [馬來語](../ms/README.md) | [馬拉雅拉姆語](../ml/README.md) | [馬拉地語](../mr/README.md) | [尼泊爾語](../ne/README.md) | [奈及利亞皮欽語](../pcm/README.md) | [挪威語](../no/README.md) | [波斯語（Farsi）](../fa/README.md) | [波蘭語](../pl/README.md) | [葡萄牙語（巴西）](../pt-BR/README.md) | [葡萄牙語（葡萄牙）](../pt-PT/README.md) | [旁遮普語（Gurmukhi）](../pa/README.md) | [羅馬尼亞語](../ro/README.md) | [俄語](../ru/README.md) | [塞爾維亞語（西里爾文）](../sr/README.md) | [斯洛伐克語](../sk/README.md) | [斯洛維尼亞語](../sl/README.md) | [西班牙語](../es/README.md) | [史瓦希里語](../sw/README.md) | [瑞典語](../sv/README.md) | [他加祿語（菲律賓語）](../tl/README.md) | [泰米爾語](../ta/README.md) | [泰盧固語](../te/README.md) | [泰語](../th/README.md) | [土耳其語](../tr/README.md) | [烏克蘭語](../uk/README.md) | [烏爾都語](../ur/README.md) | [越南語](../vi/README.md)

> **想要在本機複製存放庫嗎？**
>
> 此儲存庫包含 50 多種語言的翻譯，會顯著增加下載大小。若要在不下載翻譯的情況下進行複製，請使用稀疏檢出（sparse checkout）：
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
> 這會為你提供完成課程所需的一切，且下載速度更快。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 什麼是 Azure Developer CLI (azd)？

**Azure Developer CLI (azd)** 是一個對開發者友善的命令列工具，讓部署應用到 Azure 變得簡單。與手動建立並連接眾多 Azure 資源不同，你可以用單一指令部署整個應用程式。

### `azd up` 的魔法

```bash
# 這個單一指令完成所有工作：
# ✅ 建立所有 Azure 資源
# ✅ 配置網路和安全性
# ✅ 建置您的應用程式程式碼
# ✅ 部署到 Azure
# ✅ 提供您一個可用的 URL
azd up
```

**就這樣！** 不需要點選 Azure 入口網站、不需要先學習複雜的 ARM 模板、不需要手動設定 — 只要把運作中的應用部署到 Azure。

---

## ❓ Azure Developer CLI 與 Azure CLI：有什麼不同？

這是初學者最常問的問題。簡單回答如下：

| 功能 | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **目的** | 管理單一的 Azure 資源 | 部署完整的應用程式 |
| **心態** | 以基礎設施為主 | 以應用程式為主 |
| **範例** | `az webapp create --name myapp...` | `azd up` |
| **學習曲線** | 需了解 Azure 服務 | 只需了解你的應用程式 |
| **最適合** | DevOps、基礎建設 | 開發者、快速原型 |

### 簡單比喻

- **Azure CLI** 就像擁有打造房子的所有工具 —— 錘子、鋸子、釘子。你可以建造任何東西，但你必須了解建築方法。
- **Azure Developer CLI** 就像請了承包商 —— 你描述你想要的，他們處理建造工作。

### 何時使用哪一個

| 情境 | 使用 |
|----------|----------|
| "我想快速部署我的網站應用" | `azd up` |
| "我只需要建立一個儲存帳戶" | `az storage account create` |
| "我正在構建完整的 AI 應用" | `azd init --template azure-search-openai-demo` |
| "我需要偵錯特定的 Azure 資源" | `az resource show` |
| "我想在幾分鐘內完成生產就緒部署" | `azd up --environment production` |

### 它們可以一起使用！

AZD 在底層會使用 Azure CLI。你可以兩者並用：
```bash
# 使用 AZD 部署您的應用程式
azd up

# 然後使用 Azure CLI 微調特定資源
az webapp config set --name myapp --always-on true
```

---

## 🌟 在 Awesome AZD 找到範本

別從頭開始！**Awesome AZD** 是社群收集的可一鍵部署範本合集：

| 資源 | 說明 |
|----------|-------------|
| 🔗 [**Awesome AZD 圖庫**](https://azure.github.io/awesome-azd/) | 瀏覽 200+ 範本並一鍵部署 |
| 🔗 [**提交範本**](https://github.com/Azure/awesome-azd/issues) | 向社群貢獻你的範本 |
| 🔗 [**GitHub 倉庫**](https://github.com/Azure/awesome-azd) | 按星標並瀏覽原始程式碼 |

### Awesome AZD 上受歡迎的 AI 範本

```bash
# 使用 Azure OpenAI + AI 搜尋的 RAG 聊天
azd init --template azure-search-openai-demo

# 快速 AI 聊天應用程式
azd init --template openai-chat-app-quickstart

# 使用 Foundry Agents 的 AI 代理
azd init --template get-started-with-ai-agents
```

---

## 🎯 三步驟快速開始

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

### 步驟 2：登入 Azure

```bash
azd auth login
```

### 步驟 3：部署你的第一個應用程式

```bash
# 從範本初始化
azd init --template todo-nodejs-mongo

# 部署到 Azure（建立所有東西！）
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

本課程以**循序漸進學習**為設計理念 — 從你熟悉的部分開始，逐步進階：

| 你的經驗 | 從哪開始 |
|-----------------|------------|
| **剛接觸 Azure** | [第 1 章：基礎](../..) |
| **了解 Azure，但第一次使用 AZD** | [第 1 章：基礎](../..) |
| **想部署 AI 應用** | [第 2 章：AI 優先開發](../..) |
| **想要實作練習** | [🎓 互動式工作坊](workshop/README.md) - 3-4 小時的引導實作 |
| **需要生產環境模式** | [第 8 章：生產與企業模式](../..) |

### 快速設定

1. **將本儲存庫 Fork**: [![GitHub 分叉](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone 它**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **取得協助**: [Azure Discord 社群](https://discord.com/invite/ByRwuEEgH4)

> **想要在本機複製存放庫嗎？**
>
> 此儲存庫包含 50 多種語言的翻譯，會顯著增加下載大小。若要在不下載翻譯的情況下進行複製，請使用稀疏檢出（sparse checkout）：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 這會為你提供完成課程所需的一切，且下載速度更快。


## 課程概覽

透過結構化章節熟練掌握 Azure Developer CLI (azd)，課程以循序漸進設計。**特別著重於結合 Microsoft Foundry 的 AI 應用部署。**

### 為何本課程對現代開發者至關重要

根據 Microsoft Foundry Discord 社群洞察，**45% 的開發者想將 AZD 用於 AI 工作負載**，但會遇到以下挑戰：
- 複雜的多服務 AI 架構
- AI 生產部署最佳實務  
- Azure AI 服務整合與設定
- AI 工作負載的成本優化
- 針對 AI 的部署問題進行故障排除

### 學習目標

完成本結構化課程後，你將能：
- **掌握 AZD 基礎**：核心概念、安裝與設定
- **部署 AI 應用**：在 Microsoft Foundry 服務上使用 AZD
- **實作基礎設施即程式碼**：使用 Bicep 範本管理 Azure 資源
- **排除部署問題**：解決常見問題並進行除錯
- **優化生產環境**：安全性、擴充、監控與成本管理
- **建構多代理解決方案**：部署複雜的 AI 架構

## 🗺️ 課程地圖：章節快速導覽

每個章節都有專屬 README，內含學習目標、快速上手和練習：

| 章節 | 主題 | 課程 | 時長 | 複雜度 |
|---------|-------|---------|----------|------------|
| **[第 1 章：基礎](docs/chapter-01-foundation/README.md)** | 入門 | [AZD 基礎](docs/chapter-01-foundation/azd-basics.md) &#124; [安裝](docs/chapter-01-foundation/installation.md) &#124; [第一個專案](docs/chapter-01-foundation/first-project.md) | 30-45 分鐘 | ⭐ |
| **[第 2 章：AI 開發](docs/chapter-02-ai-development/README.md)** | AI 優先的應用 | [Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI 代理](docs/chapter-02-ai-development/agents.md) &#124; [模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [工作坊](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 小時 | ⭐⭐ |
| **[第 3 章：設定](docs/chapter-03-configuration/README.md)** | 驗證與安全 | [設定](docs/chapter-03-configuration/configuration.md) &#124; [驗證與安全](docs/chapter-03-configuration/authsecurity.md) | 45-60 分鐘 | ⭐⭐ |
| **[Ch 4: 基礎設施](docs/chapter-04-infrastructure/README.md)** | 基礎設施即代碼與部署 | [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [資源佈署](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Ch 5: 多代理](docs/chapter-05-multi-agent/README.md)** | AI 代理解決方案 | [零售情境](examples/retail-scenario.md) &#124; [協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Ch 6: 預部署](docs/chapter-06-pre-deployment/README.md)** | 規劃與驗證 | [預檢查](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [應用程式洞察](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Ch 7: 疑難排解](docs/chapter-07-troubleshooting/README.md)** | 偵錯與修復 | [常見問題](docs/chapter-07-troubleshooting/common-issues.md) &#124; [偵錯](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI 疑難排解](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Ch 8: 生產](docs/chapter-08-production/README.md)** | 企業模式 | [生產實務](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | 實作實驗室 | [介紹](workshop/docs/instructions/0-Introduction.md) &#124; [選擇](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [驗證](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [拆解](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [組態](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [客製化](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [拆除](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [總結](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**總課程時長:** ~10-14 hours | **技能進展:** 初學者 → 生產就緒

---

## 📚 學習章節

*根據經驗層級與目標選擇您的學習路徑*

### 🚀 第 1 章：基礎與快速開始
**先決條件**: Azure 訂閱、基礎指令列知識  
**時長**: 30-45 分鐘  
**複雜度**: ⭐

#### 您將學到的內容
- 了解 Azure Developer CLI 的基本概念
- 在您的平台上安裝 AZD
- 您的第一個成功部署

#### 學習資源
- **🎯 從這裡開始**: [什麼是 Azure Developer CLI？](../..)
- **📖 理論**: [AZD 基礎](docs/chapter-01-foundation/azd-basics.md) - 核心概念與術語
- **⚙️ 設定**: [安裝與設定](docs/chapter-01-foundation/installation.md) - 平台專用指南
- **🛠️ 實作**: [您的第一個專案](docs/chapter-01-foundation/first-project.md) - 逐步教學
- **📋 快速參考**: [指令速查表](resources/cheat-sheet.md)

#### 實作練習
```bash
# 快速安裝檢查
azd version

# 部署您的第一個應用程式
azd init --template todo-nodejs-mongo
azd up
```

**💡 章節成果**: 使用 AZD 成功將簡單的 Web 應用部署到 Azure

**✅ 成功驗證:**
```bash
# 完成第 1 章後，您應該能夠：
azd version              # 顯示已安裝的版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署到 Azure
azd show                # 顯示正在執行的應用程式 URL
# 應用程式在瀏覽器中開啟並正常運作
azd down --force --purge  # 清理資源
```

**📊 時間投入:** 30-45 分鐘  
**📈 完成後的技能等級:** 能獨立部署基本應用程式

**✅ 成功驗證:**
```bash
# 完成第一章後，您應該能夠：
azd version              # 顯示已安裝的版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署到 Azure
azd show                # 顯示執行中應用程式的 URL
# 應用程式在瀏覽器中開啟並正常運作
azd down --force --purge  # 清理資源
```

**📊 時間投入:** 30-45 分鐘  
**📈 完成後的技能等級:** 能獨立部署基本應用程式

---

### 🤖 第 2 章：以 AI 為先的開發（建議 AI 開發者）
**先決條件**: 完成第 1 章  
**時長**: 1-2 小時  
**複雜度**: ⭐⭐

#### 您將學到的內容
- 將 Microsoft Foundry 與 AZD 整合
- 部署 AI 驅動的應用程式
- 了解 AI 服務設定

#### 學習資源
- **🎯 從這裡開始**: [Microsoft Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI 代理人**: [AI 代理人指南](docs/chapter-02-ai-development/agents.md) - 使用 AZD 部署智慧代理
- **📖 模式**: [AI 模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) - 部署與管理 AI 模型
- **🛠️ 工作坊**: [AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - 讓您的 AI 解決方案符合 AZD
- **🎥 互動指南**: [工作坊資源](workshop/README.md) - 使用 MkDocs 的瀏覽器學習 * DevContainer 環境
- **📋 範本**: [Microsoft Foundry 範本](../..)
- **📝 範例**: [AZD 部署範例](examples/README.md)

#### 實作練習
```bash
# 部署您的第一個 AI 應用程式
azd init --template azure-search-openai-demo
azd up

# 試用其他 AI 範本
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 章節成果**: 部署並設定具備 RAG 功能的 AI 聊天應用程式

**✅ 成功驗證:**
```bash
# 在第2章之後，你應該能夠：
azd init --template azure-search-openai-demo
azd up
# 測試 AI 聊天介面
# 提出問題並取得由 AI 提供且附有來源的回應
# 驗證搜尋整合是否運作
azd monitor  # 檢查 Application Insights 是否顯示遙測資料
azd down --force --purge
```

**📊 時間投入:** 1-2 小時  
**📈 完成後的技能等級:** 能部署並設定生產就緒的 AI 應用程式  
**💰 成本意識:** 了解每月 $80-150 的開發成本、每月 $300-3500 的生產成本

#### 💰 AI 部署的成本考量

**開發環境（估計每月 $80-150）:**
- Azure OpenAI（隨用隨付）: $0-50/月（基於 token 使用量）
- AI Search（基礎層）: $75/月
- Container Apps（消耗計費）: $0-20/月
- 儲存（標準）: $1-5/月

**生產環境（估計每月 $300-3,500+）:**
- Azure OpenAI（使用 PTU 以獲得穩定效能）: $3,000+/月 或 高流量下的隨用隨付
- AI Search（標準層）: $250/月
- Container Apps（專用）: $50-100/月
- Application Insights: $5-50/月
- 儲存（高階）: $10-50/月

**💡 成本優化小技巧:**
- 使用 **免費層** Azure OpenAI 來學習（包含每月 50,000 tokens）
- 執行 `azd down` 以在非開發時釋放資源
- 從消耗計費開始，僅在生產時升級到 PTU
- 使用 `azd provision --preview` 在部署前估算成本
- 啟用自動擴縮：只為實際使用付費

**成本監控:**
```bash
# 檢查估計的每月成本
azd provision --preview

# 在 Azure 入口網站監控實際成本
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第 3 章：設定與驗證
**先決條件**: 完成第 1 章  
**時長**: 45-60 分鐘  
**複雜度**: ⭐⭐

#### 您將學到的內容
- 環境設定與管理
- 驗證與安全最佳實務
- 資源命名與組織

#### 學習資源
- **📖 設定**: [設定指南](docs/chapter-03-configuration/configuration.md) - 環境設定
- **🔐 安全**: [驗證模式與管理身分](docs/chapter-03-configuration/authsecurity.md) - 驗證模式
- **📝 範例**: [資料庫應用範例](examples/database-app/README.md) - AZD 資料庫範例

#### 實作練習
- 設定多個環境（dev、staging、prod）
- 建立管理身分驗證
- 實作環境特定的組態設定

**💡 章節成果**: 管理多個環境並具備適當的驗證與安全性

---

### 🏗️ 第 4 章：基礎設施即代碼與部署
**先決條件**: 完成第 1-3 章  
**時長**: 1-1.5 小時  
**複雜度**: ⭐⭐⭐

#### 您將學到的內容
- 進階部署模式
- 使用 Bicep 的基礎設施即代碼
- 資源佈署策略

#### 學習資源
- **📖 部署**: [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) - 完整工作流程
- **🏗️ 佈署資源**: [資源佈署](docs/chapter-04-infrastructure/provisioning.md) - Azure 資源管理
- **📝 範例**: [Container App 範例](../../examples/container-app) - 容器化部署

#### 實作練習
- 建立自訂的 Bicep 範本
- 部署多服務應用程式
- 實作藍綠部署策略

**💡 章節成果**: 使用自訂基礎設施範本部署複雜的多服務應用程式

---

### 🎯 第 5 章：多代理 AI 解決方案（進階）
**先決條件**: 完成第 1-2 章  
**時長**: 2-3 小時  
**複雜度**: ⭐⭐⭐⭐

#### 您將學到的內容
- 多代理架構模式
- 代理編排與協調
- 生產就緒的 AI 部署

#### 學習資源
- **🤖 精選專案**: [零售多代理解決方案](examples/retail-scenario.md) - 完整實作
- **🛠️ ARM 範本**: [ARM 範本套件](../../examples/retail-multiagent-arm-template) - 一鍵部署
- **📖 架構**: [多代理協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) - 模式

#### 實作練習
```bash
# 部署完整的零售多代理人解決方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索代理人設定
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 章節成果**: 部署並管理具生產就緒的多代理 AI 解決方案，包含 Customer 與 Inventory 代理

---

### 🔍 第 6 章：預部署驗證與規劃
**先決條件**: 完成第 4 章  
**時長**: 1 小時  
**複雜度**: ⭐⭐

#### 您將學到的內容
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
- 實作自動化預部署檢查

**💡 章節成果**: 在執行前驗證並優化部署

---

### 🚨 第 7 章：疑難排解與偵錯
**先決條件**: 完成任一部署章節  
**時長**: 1-1.5 小時  
**複雜度**: ⭐⭐

#### 您將學到的內容
- 系統化的偵錯方法
- 常見問題與解法
- AI 特定疑難排解

#### 學習資源
- **🔧 常見問題**: [常見問題](docs/chapter-07-troubleshooting/common-issues.md) - FAQ 與解法
- **🕵️ 偵錯**: [偵錯指南](docs/chapter-07-troubleshooting/debugging.md) - 逐步策略
- **🤖 AI 問題**: [AI 專屬疑難排解](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI 服務問題

#### 實作練習
- 診斷部署失敗
- 解決驗證問題
- 偵錯 AI 服務連線問題

**💡 章節成果**: 可獨立診斷並解決常見部署問題

---

### 🏢 第 8 章：生產與企業模式
**先決條件**: 完成第 1-4 章  
**時長**: 2-3 小時  
**複雜度**: ⭐⭐⭐⭐

#### 您將學到的內容
- 生產部署策略
- 企業安全模式
- 監控與成本優化

#### 學習資源
- **🏭 生產**: [生產 AI 最佳實務](docs/chapter-08-production/production-ai-practices.md) - 企業模式
- **📝 範例**: [微服務範例](../../examples/microservices) - 複雜架構
- **📊 監控**: [應用程式洞察整合](docs/chapter-06-pre-deployment/application-insights.md) - 監控

#### 實作練習
- 實作企業安全模式
- 建立完整監控
- 在適當治理下部署到生產環境

**💡 章節成果**: 部署具完整生產能力的企業就緒應用程式

---

## 🎓 工作坊概覽：實作學習體驗

> **⚠️ 工作坊狀態：開發中**
> 工作坊教材目前正在開發與精進中。核心模組可運作，但某些進階章節尚未完成。我們正積極努力完成所有內容。[追蹤進度 →](workshop/README.md)

### 互動式工作坊教材
**使用瀏覽器工具與引導練習的完整實作學習體驗**

我們的工作坊教材提供結構化、互動式的學習體驗，作為上方章節式課程的補充。工作坊設計適用於自學與講師帶領的課程。

#### 🛠️ 工作坊特色
- **瀏覽器介面**：完整的 MkDocs 支援工作坊，具搜尋、複製與主題功能
- **GitHub Codespaces 整合**：一鍵設定開發環境
- **結構化學習路徑**：8 模組引導式練習（總計 3-4 小時）
- **漸進式方法論**：導入 → 選擇 → 驗證 → 拆解 → 設定 → 客製化 → 清理 → 總結
- **互動式 DevContainer 環境**：預先配置的工具與相依項目

#### 📚 工作坊模組結構
工作坊遵循一套 8 模組的**漸進式方法論**，帶領你從探索到部署精通：

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

# 選項 2：本機開發
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 依照 workshop/README.md 的設定說明
```

#### 🎯 工作坊學習成果
完成工作坊後，參與者將會：
- **部署生產等級的 AI 應用程式**：使用 AZD 與 Microsoft Foundry 服務
- **精通多代理架構**：實作協調式 AI 代理解決方案
- **實施安全最佳實務**：設定驗證與存取控制
- **為擴展進行優化**：設計具成本效益且效能優良的部署
- **排解部署問題**：能夠獨立解決常見問題

#### 📖 工作坊資源
- **🎥 互動式指南**： [工作坊教材](workshop/README.md) - 瀏覽器式學習環境
- **📋 模組逐步指引**：
  - [0. 介紹](workshop/docs/instructions/0-Introduction.md) - 工作坊概述與目標
  - [1. 選擇](workshop/docs/instructions/1-Select-AI-Template.md) - 尋找並選擇 AI 範本
  - [2. 驗證](workshop/docs/instructions/2-Validate-AI-Template.md) - 部署並驗證範本
  - [3. 拆解](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - 探索範本架構
  - [4. 設定](workshop/docs/instructions/4-Configure-AI-Template.md) - 精通 azure.yaml
  - [5. 客製化](workshop/docs/instructions/5-Customize-AI-Template.md) - 針對你的情境進行自訂
  - [6. 清理](workshop/docs/instructions/6-Teardown-Infrastructure.md) - 清理資源
  - [7. 總結](workshop/docs/instructions/7-Wrap-up.md) - 回顧與後續步驟
- **🛠️ AI 工作坊實驗室**： [AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - 聚焦 AI 的練習
- **💡 快速開始**： [工作坊設定指南](workshop/README.md#quick-start) - 環境設定

**適合對象**：企業訓練、大學課程、自學者與開發者訓練營。

---

## 📖 深入探討：AZD 能力

除了基礎功能外，AZD 提供用於生產部署的強大功能：

- **以範本為基礎的部署** - 使用預建範本處理常見應用模式
- **基礎設施即程式碼** - 使用 Bicep 或 Terraform 管理 Azure 資源  
- **整合化工作流程** - 無縫地配置、部署與監控應用程式
- **開發者友善** - 專為提高開發者生產力與體驗而優化

### **AZD + Microsoft Foundry：AI 部署的理想選擇**

**為什麼選擇 AZD 作為 AI 解決方案？** AZD 解決了 AI 開發者面臨的主要挑戰：

- **AI 即用範本** - 為 Azure OpenAI、Cognitive Services 與 ML 工作負載預先配置的範本
- **安全的 AI 部署** - 內建的 AI 服務、API 金鑰與模型端點安全模式  
- **生產級 AI 模式** - 可擴展且具成本效益的 AI 應用部署最佳實務
- **端到端 AI 工作流程** - 從模型開發到生產部署並搭配適當的監控
- **成本最佳化** - 為 AI 工作負載提供智慧型資源分配與伸縮策略
- **Microsoft Foundry 整合** - 與 Microsoft Foundry 模型目錄與端點的無縫連接

---

## 🎯 範本與範例資料庫

### 精選：Microsoft Foundry 範本
**如果你要部署 AI 應用，從這裡開始！**

> **注意：** 這些範本示範各種 AI 模式。有些來自外部的 Azure Samples，其他則是本地實作。

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | External |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapter 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| External |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | External |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | External |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | External |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | External |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### 精選：完整學習情境
**對應至學習章節的生產就緒應用範本**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | Basic AI deployment patterns |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | RAG implementation with Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapter 4 | ⭐⭐ | Document Intelligence integration |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | Agent framework and function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐ | Enterprise AI orchestration |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | Multi-agent architecture with Customer and Inventory agents |

### 以範例類型學習

> **📌 本機 vs 外部 範例：**  
> **本機範例**（此倉儲內）= 可立即使用  
> **外部範例**（Azure Samples）= 從連結的程式庫 clone 下來

#### 本機範例（可立即使用）
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - 完整的生產就緒實作，包含 ARM 範本
  - 多代理架構（Customer + Inventory 代理）
  - 完整的監控與評估
  - 透過 ARM 範本一鍵部署

#### 本機範例 - Container 應用（章節 2-5）
**本倉儲中的完整容器部署範例：**
- [**Container App Examples**](examples/container-app/README.md) - 容器化部署完整指南
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - 基本 REST API，支援 scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - 生產就緒的多服務部署
  - 快速開始、生產與進階部署模式
  - 監控、安全與成本最佳化指引

#### 外部範例 - 簡單應用（章節 1-2）
**Clone 這些 Azure Samples 倉儲以開始：**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本部署模式
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 靜態內容部署
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署

#### 外部範例 - 資料庫整合（章節 3-4）  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 資料庫連接模式
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 無伺服器資料工作流程

#### 外部範例 - 進階模式（章節 4-8）
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服務架構
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - 背景處理  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - 生產就緒的 ML 模式

### 外部範本集合
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - 精選官方與社群範本集合
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 的範本文件
- [**Examples Directory**](examples/README.md) - 本地學習範例與詳細說明

---

## 📚 學習資源與參考

### 快速參考
- [**命令速查表**](resources/cheat-sheet.md) - 按章節整理的常用 azd 命令
- [**術語表**](resources/glossary.md) - Azure 與 azd 術語  
- [**常見問題**](resources/faq.md) - 按學習章節整理的常見問答
- [**學習指南**](resources/study-guide.md) - 完整的實作練習題

### 實作工作坊
- [**AI 工作坊實驗室**](docs/chapter-02-ai-development/ai-workshop-lab.md) - 讓你的 AI 解決方案能透過 AZD 部署（2-3 小時）
- [**互動式工作坊**](workshop/README.md) - 8 模組的引導式練習，使用 MkDocs 與 GitHub Codespaces
  - 流程：導入 → 選擇 → 驗證 → 拆解 → 設定 → 客製化 → 清理 → 總結

### 外部學習資源
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 快速故障排除指南

**初學者常遇的問題與即時解決方案：**

<details>
<summary><strong>❌ "azd: 找不到命令"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" 或 "配額已超過"</strong></summary>

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
# 選項 1：清理並重試
azd down --force --purge
azd up

# 選項 2：僅修復基礎架構
azd provision

# 選項 3：檢查詳細狀態
azd show

# 選項 4：在 Azure Monitor 中檢查日誌
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "認證失敗" 或 "權杖已過期"</strong></summary>

```bash
# 重新驗證
az logout
az login

azd auth logout
azd auth login

# 驗證身分
az account show
```
</details>

<details>
<summary><strong>❌ "資源已存在" 或 命名衝突</strong></summary>

```bash
# AZD 會產生唯一名稱，但若發生衝突：
azd down --force --purge

# 則以全新環境重新嘗試
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 範本部署耗時過久</strong></summary>

**正常等待時間：**
- 簡單的網頁應用程式：5-10 分鐘
- 含資料庫的應用程式：10-15 分鐘
- AI 應用程式：15-25 分鐘（OpenAI 建置較慢）

```bash
# 檢查進度
azd show

# 如果停滯超過 30 分鐘，請檢查 Azure 入口網站：
azd monitor
# 尋找失敗的部署
```
</details>

<details>
<summary><strong>❌ "權限被拒絕" 或 "禁止"</strong></summary>

```bash
# 檢查您的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 您至少需要「Contributor」角色
# 請向您的 Azure 管理員申請授予：
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

### 📚 完整故障排除資源

- **常見問題指南：** [詳細解決方案](docs/chapter-07-troubleshooting/common-issues.md)
- **AI 專屬問題：** [AI 故障排除](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **除錯指南：** [逐步除錯](docs/chapter-07-troubleshooting/debugging.md)
- **取得協助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 課程完成與認證

### 進度追蹤
透過各章節追蹤你的學習進度：

- [ ] **第 1 章**：基礎與快速入門 ✅
- [ ] **第 2 章**：以 AI 為先的開發 ✅  
- [ ] **第 3 章**：設定與認證 ✅
- [ ] **第 4 章**：基礎建設即程式碼與部署 ✅
- [ ] **第 5 章**：多代理 AI 解決方案 ✅
- [ ] **第 6 章**：部署前驗證與規劃 ✅
- [ ] **第 7 章**：故障排除與除錯 ✅
- [ ] **第 8 章**：生產環境與企業模式 ✅

### 學習驗證
完成每一章後，驗證你的知識：
1. **實作練習**：完成該章的實際部署
2. **知識檢核**：檢閱該章的常見問題（FAQ）
3. **社群討論**：在 Azure Discord 分享你的經驗
4. **前進下一章**：挑戰下一個難度層級

### 課程完成獲益
完成所有章節後，你將擁有：
- **生產經驗**：將真實的 AI 應用部署到 Azure
- **專業技能**：企業級部署能力  
- **社群認可**：成為活躍的 Azure 開發者社群成員
- **職涯提升**：搶手的 AZD 與 AI 部署專長

---

## 🤝 社群與支援

### 取得協助與支援
- **技術問題：** [回報錯誤並提出功能需求](https://github.com/microsoft/azd-for-beginners/issues)
- **學習問題：** [Microsoft Azure Discord 社群](https://discord.gg/microsoft-azure) 及 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 專屬協助：** 加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **文件：** [官方 Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### 來自 Microsoft Foundry Discord 的社群洞見

**來自 #Azure 頻道的最新投票結果：**
- **45%** 的開發者希望在 AI 工作負載上使用 AZD
- **主要挑戰**：多服務部署、憑證管理、生產準備度  
- **最常被要求**：AI 專用範本、故障排除指南、最佳實務

**加入我們的社群以便：**
- 分享你的 AZD + AI 經驗並獲得協助
- 優先取得新 AI 範本的早期預覽
- 參與制定 AI 部署最佳實務
- 影響未來 AI + AZD 功能的開發方向

### 對本課程的貢獻
我們歡迎貢獻！請閱讀我們的 [Contributing Guide](CONTRIBUTING.md) 以了解詳情：
- **內容改進**：增強現有章節與範例
- **新增範例**：加入真實情境與範本  
- **翻譯**：協助維護多語言支援
- **錯誤回報**：提升準確性與清晰度
- **社群守則**：遵循我們的包容性社群指南

---

## 📄 課程資訊

### 授權
本專案採用 MIT License 授權 - 詳情請見 [LICENSE](../../LICENSE) 檔案。

### 相關的 Microsoft 學習資源

我們的團隊還製作其他完整的學習課程：

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
[![生成式 AI 初學者](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### 核心學習
[![機器學習 初學者](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![資料科學 初學者](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI 初學者](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![資安 初學者](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![網頁開發 初學者](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![物聯網 初學者](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR 開發 初學者](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot 系列
[![Copilot：AI 配對程式設計](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot：C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot 冒險](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ 課程導覽

**🚀 準備開始學習了嗎？**

**初學者**: 從 [第 1 章：基礎與快速上手](../..)  
**AI 開發者**: 前往 [第 2 章：以 AI 為先的開發](../..)  
**進階開發者**: 從 [第 3 章：設定與驗證](../..)

**下一步**: [開始第 1 章 - AZD 基礎](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 所翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始語言的文件應視為具權威性的版本。對於重要資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而導致的任何誤解或誤譯負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->