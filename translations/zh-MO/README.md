# AZD 初學者：有結構的學習旅程

![AZD 初學者](../../translated_images/zh-MO/azdbeginners.5527441dd9f74068.webp) 

[![GitHub 觀察者](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub 分支](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub 星標](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 自動翻譯（隨時更新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[阿拉伯語](../ar/README.md) | [孟加拉語](../bn/README.md) | [保加利亞語](../bg/README.md) | [緬甸語（緬甸）](../my/README.md) | [中文（簡體）](../zh-CN/README.md) | [中文（繁體，香港）](../zh-HK/README.md) | [中文（繁體，澳門）](./README.md) | [中文（繁體，台灣）](../zh-TW/README.md) | [克羅地亞語](../hr/README.md) | [捷克語](../cs/README.md) | [丹麥語](../da/README.md) | [荷蘭語](../nl/README.md) | [愛沙尼亞語](../et/README.md) | [芬蘭語](../fi/README.md) | [法語](../fr/README.md) | [德語](../de/README.md) | [希臘語](../el/README.md) | [希伯來語](../he/README.md) | [印地語](../hi/README.md) | [匈牙利語](../hu/README.md) | [印尼語](../id/README.md) | [義大利語](../it/README.md) | [日語](../ja/README.md) | [卡納達語](../kn/README.md) | [韓語](../ko/README.md) | [立陶宛語](../lt/README.md) | [馬來語](../ms/README.md) | [馬拉雅拉姆語](../ml/README.md) | [馬拉地語](../mr/README.md) | [尼泊爾語](../ne/README.md) | [尼日利亞皮欽語](../pcm/README.md) | [挪威語](../no/README.md) | [波斯語（Farsi）](../fa/README.md) | [波蘭語](../pl/README.md) | [葡萄牙語（巴西）](../pt-BR/README.md) | [葡萄牙語（葡萄牙）](../pt-PT/README.md) | [旁遮普語（古魯穆基）](../pa/README.md) | [羅馬尼亞語](../ro/README.md) | [俄語](../ru/README.md) | [塞爾維亞語（西里爾字母）](../sr/README.md) | [斯洛伐克語](../sk/README.md) | [斯洛文尼亞語](../sl/README.md) | [西班牙語](../es/README.md) | [斯瓦希里語](../sw/README.md) | [瑞典語](../sv/README.md) | [塔加洛語（菲律賓語）](../tl/README.md) | [泰米爾語](../ta/README.md) | [泰盧固語](../te/README.md) | [泰語](../th/README.md) | [土耳其語](../tr/README.md) | [烏克蘭語](../uk/README.md) | [烏爾都語](../ur/README.md) | [越南語](../vi/README.md)

> **想在本機複製？**
>
> 這個儲存庫包含超過 50 種語言翻譯，會大幅增加下載大小。若要在不包含翻譯的情況下複製，請使用 sparse checkout：
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
> 這會提供你完成課程所需的一切，且下載速度更快。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 什麼是 Azure Developer CLI (azd)？

**Azure Developer CLI (azd)** 是一個對開發者友善的命令列工具，可讓部署應用程式到 Azure 變得簡單。你不需要手動建立和連接數十個 Azure 資源，只需一個指令即可部署整個應用程式。

### `azd up` 的魔力

```bash
# 這個單一指令完成所有工作：
# ✅ 建立所有 Azure 資源
# ✅ 配置網絡與安全性
# ✅ 建置你的應用程式程式碼
# ✅ 部署到 Azure
# ✅ 提供你一個可用的 URL
azd up
```

**就是這樣！** 不用點擊 Azure 入口網站，不需先學習複雜的 ARM 範本，或手動設定 — 只要把應用程式在 Azure 上運行起來。

---

## ❓ Azure Developer CLI 與 Azure CLI：有什麼不同？

這是初學者最常問的問題。簡單答案如下：

| 功能 | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **目的** | 管理單一 Azure 資源 | 部署完整的應用程式 |
| **思維模式** | 以基礎設施為重點 | 以應用程式為重點 |
| **範例** | `az webapp create --name myapp...` | `azd up` |
| **學習曲線** | 必須了解 Azure 服務 | 只需了解你的應用程式 |
| **適合對象** | DevOps、基礎設施 | 開發者、原型製作 |

### 簡單比喻

- **Azure CLI** 就像擁有所有蓋房子的工具 — 錘子、鋸子、釘子。你可以打造任何東西，但你需要知道建築方法。
- **Azure Developer CLI** 就像請承包商 — 你描述你想要的，他們負責建造。

### 何時使用哪一個

| 情境 | 使用 |
|----------|----------|
| "我想快速部署我的網頁應用程式" | `azd up` |
| "我只需要建立一個儲存帳戶" | `az storage account create` |
| "我正在建置完整的 AI 應用程式" | `azd init --template azure-search-openai-demo` |
| "我需要除錯特定的 Azure 資源" | `az resource show` |
| "我想在數分鐘內完成適合生產環境的部署" | `azd up --environment production` |

### 它們可以一起使用！

AZD 在底層使用 Azure CLI。你可以同時使用兩者：
```bash
# 使用 AZD 部署您的應用程式
azd up

# 然後使用 Azure CLI 微調特定資源
az webapp config set --name myapp --always-on true
```

---

## 🌟 在 Awesome AZD 中尋找範本

別從零開始！**Awesome AZD** 是社群收集的即時可部署範本庫：

| 資源 | 說明 |
|----------|-------------|
| 🔗 [**Awesome AZD 精選畫廊**](https://azure.github.io/awesome-azd/) | 瀏覽 200+ 範本並使用一鍵部署 |
| 🔗 [**提交範本**](https://github.com/Azure/awesome-azd/issues) | 向社群貢獻你的範本 |
| 🔗 [**GitHub 儲存庫**](https://github.com/Azure/awesome-azd) | 按星標並探索原始程式碼 |

### 來自 Awesome AZD 的熱門 AI 範本

```bash
# RAG 與 Azure OpenAI + AI 搜尋聊天
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

# 部署到 Azure（會建立所有東西！）
azd up
```

**🎉 就這樣！** 你的應用程式現在已在 Azure 上線。

### 清理（別忘了！）

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 如何使用本課程

本課程設計為**循序漸進學習** — 從你熟悉的地方開始，逐步提升：

| 你的經驗 | 從此開始 |
|-----------------|------------|
| **剛接觸 Azure** | [第 1 章：基礎](../..) |
| **熟悉 Azure、剛接觸 AZD** | [第 1 章：基礎](../..) |
| **想部署 AI 應用程式** | [第 2 章：以 AI 為先的開發](../..) |
| **想要實作練習** | [🎓 互動工作坊](workshop/README.md) - 3-4 小時的引導實驗 |
| **需要生產環境模式** | [第 8 章：生產與企業模式](../..) |

### 快速設定

1. **Fork 本儲存庫**: [![GitHub 分支](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **複製到本機**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **取得協助**: [Azure Discord 社群](https://discord.com/invite/ByRwuEEgH4)

> **想在本機複製？**
>
> 這個儲存庫包含超過 50 種語言翻譯，會大幅增加下載大小。若要在不包含翻譯的情況下複製，請使用 sparse checkout：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 這會提供你完成課程所需的一切，且下載速度更快。


## 課程總覽

透過有結構的章節掌握 Azure Developer CLI (azd)，設計為循序漸進學習。**特別關注 Microsoft Foundry 整合的 AI 應用部署。**

### 為何本課程對現代開發者很重要

根據 Microsoft Foundry Discord 社群的見解，**45% 的開發者想要使用 AZD 來處理 AI 工作負載**，但會遇到以下挑戰：
- 複雜的多服務 AI 架構
- AI 生產部署最佳實務  
- Azure AI 服務整合與設定
- AI 工作負載的成本優化
- 除錯 AI 特定的部署問題

### 學習目標

完成本結構化課程後，你將會：
- **掌握 AZD 基礎**：核心概念、安裝與設定
- **部署 AI 應用程式**：使用 AZD 與 Microsoft Foundry 服務
- **實作基礎設施即程式碼**：使用 Bicep 範本管理 Azure 資源
- **部署除錯**：解決常見問題並進行除錯
- **為生產環境優化**：安全、擴充、監控與成本管理
- **建置多代理解決方案**：部署複雜的 AI 架構

## 🗺️ 課程地圖：按章節快速導覽

每個章節都有專屬的 README，包含學習目標、快速開始與練習：

| 章節 | 主題 | 課程 | 時長 | 複雜度 |
|---------|-------|---------|----------|------------|
| **[第 1 章：基礎](docs/chapter-01-foundation/README.md)** | 入門 | [AZD 基礎](docs/chapter-01-foundation/azd-basics.md) &#124; [安裝](docs/chapter-01-foundation/installation.md) &#124; [第一個專案](docs/chapter-01-foundation/first-project.md) | 30-45 分鐘 | ⭐ |
| **[第 2 章：以 AI 為先的開發](docs/chapter-02-ai-development/README.md)** | 以 AI 為先的應用程式 | [Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI 代理人](docs/chapter-02-ai-development/agents.md) &#124; [模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [工作坊](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 小時 | ⭐⭐ |
| **[第 3 章：設定](docs/chapter-03-configuration/README.md)** | 認證與安全 | [設定](docs/chapter-03-configuration/configuration.md) &#124; [認證與安全](docs/chapter-03-configuration/authsecurity.md) | 45-60 分鐘 | ⭐⭐ |
| **[第4章：基礎建設](docs/chapter-04-infrastructure/README.md)** | IaC & 部署 | [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [資源配置](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 小時 | ⭐⭐⭐ |
| **[第5章：多代理](docs/chapter-05-multi-agent/README.md)** | AI 代理解決方案 | [零售情境](examples/retail-scenario.md) &#124; [協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 小時 | ⭐⭐⭐⭐ |
| **[第6章：部署前](docs/chapter-06-pre-deployment/README.md)** | 規劃與驗證 | [預檢查](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [應用程式洞察](docs/chapter-06-pre-deployment/application-insights.md) | 1 小時 | ⭐⭐ |
| **[第7章：疑難排解](docs/chapter-07-troubleshooting/README.md)** | 偵錯與修復 | [常見問題](docs/chapter-07-troubleshooting/common-issues.md) &#124; [偵錯](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI 問題](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 小時 | ⭐⭐ |
| **[第8章：生產環境](docs/chapter-08-production/README.md)** | 企業模式 | [生產實務](docs/chapter-08-production/production-ai-practices.md) | 2-3 小時 | ⭐⭐⭐⭐ |
| **[🎓 工作坊](workshop/README.md)** | 實作實驗室 | [介紹](workshop/docs/instructions/0-Introduction.md) &#124; [範本選擇](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [驗證](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [拆解](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [設定](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [自訂](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [拆除基礎建設](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [結業](workshop/docs/instructions/7-Wrap-up.md) | 3-4 小時 | ⭐⭐ |

**總課程時長：** 約10-14 小時 | **技能進階：** 初學者 → 生產就緒

---

## 📚 學習章節

*根據經驗程度與目標選擇你的學習路徑*

### 🚀 第1章：基礎與快速上手
**先決條件**：Azure 訂閱、基本命令列知識  
**時長**：30-45 分鐘  
**複雜度**： ⭐

#### 你將會學到
- 了解 Azure Developer CLI 基本概念
- 在你的平台上安裝 AZD
- 你的第一次成功部署

#### 學習資源
- **🎯 開始**： [什麼是 Azure Developer CLI？](../..)
- **📖 理論**： [AZD 基礎](docs/chapter-01-foundation/azd-basics.md) - 核心概念與術語
- **⚙️ 設定**： [安裝與設定](docs/chapter-01-foundation/installation.md) - 平台專屬指南
- **🛠️ 實作**： [你的第一個專案](docs/chapter-01-foundation/first-project.md) - 逐步教學
- **📋 快速參考**： [指令備忘單](resources/cheat-sheet.md)

#### 實作練習
```bash
# 快速安裝檢查
azd version

# 部署您的第一個應用程式
azd init --template todo-nodejs-mongo
azd up
```

**💡 章節成果**：使用 AZD 成功將簡單的網頁應用程式部署到 Azure

**✅ 成功驗證：**
```bash
# 完成第一章後，您應該能夠：
azd version              # 顯示已安裝的版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署到 Azure
azd show                # 顯示執行中應用程式的 URL
# 應用程式在瀏覽器中開啟並能正常運作
azd down --force --purge  # 清理資源
```

**📊 所需時間：** 30-45 分鐘  
**📈 完成後技能：** 能獨立部署基礎應用程式

**✅ 成功驗證：**
```bash
# 完成第 1 章後，你應該能夠：
azd version              # 顯示已安裝的版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署到 Azure
azd show                # 顯示執行中應用程式的 URL
# 應用程式在瀏覽器中開啟並正常運作
azd down --force --purge  # 清理資源
```

**📊 所需時間：** 30-45 分鐘  
**📈 完成後技能：** 能獨立部署基礎應用程式

---

### 🤖 第2章：以 AI 為先的開發（建議 AI 開發者）
**先決條件**：已完成第1章  
**時長**：1-2 小時  
**複雜度**： ⭐⭐

#### 你將會學到
- Microsoft Foundry 與 AZD 的整合
- 部署 AI 驅動的應用程式
- 了解 AI 服務設定

#### 學習資源
- **🎯 開始**： [Microsoft Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI 代理**： [AI 代理指南](docs/chapter-02-ai-development/agents.md) - 使用 AZD 部署智能代理
- **📖 模式**： [AI 模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) - 部署與管理 AI 模型
- **🛠️ 工作坊**： [AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - 使你的 AI 解決方案可由 AZD 管理
- **🎥 互動指南**： [工作坊教材](workshop/README.md) - 以 MkDocs * DevContainer 瀏覽器環境進行學習
- **📋 範本**： [Microsoft Foundry 範本](../..)
- **📝 範例**： [AZD 部署範例](examples/README.md)

#### 實作練習
```bash
# 部署你的第一個 AI 應用程式
azd init --template azure-search-openai-demo
azd up

# 試試其他 AI 範本
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 章節成果**：部署並設定具有 RAG 功能的 AI 聊天應用程式

**✅ 成功驗證：**
```bash
# 在第 2 章之後，你應該能夠：
azd init --template azure-search-openai-demo
azd up
# 測試 AI 聊天介面
# 提出問題並取得附帶來源的 AI 回應
# 驗證搜尋整合是否運作
azd monitor  # 檢查 Application Insights 是否顯示遙測資料
azd down --force --purge
```

**📊 所需時間：** 1-2 小時  
**📈 完成後技能：** 能部署並設定可上線的 AI 應用程式  
**💰 成本意識：** 了解開發環境約 $80-150/月，生產環境約 $300-3500/月

#### 💰 AI 部署的成本考量

**開發環境 (預估 $80-150/月)：**
- Azure OpenAI（隨用計費）：$0-50/月（視 token 使用量而定）
- AI Search（基礎級）：$75/月
- Container Apps（消耗型）：$0-20/月
- 儲存（標準）：$1-5/月

**生產環境 (預估 $300-3,500+/月)：**
- Azure OpenAI（使用 PTU 以維持穩定效能）：$3,000+/月 OR 高量時採用隨用計費
- AI Search（標準級）：$250/月
- Container Apps（專用）：$50-100/月
- Application Insights：$5-50/月
- 儲存（進階）：$10-50/月

**💡 成本優化建議：**
- 學習期間使用 **免費層** 的 Azure OpenAI（包含 50,000 tokens/月）
- 當不在開發時，執行 `azd down` 以解除分配資源
- 以消耗型計費開始，僅於生產環境升級為 PTU
- 使用 `azd provision --preview` 在部署前估算成本
- 啟用自動擴展：只為實際使用量付費

**成本監控：**
```bash
# 查看預估的每月費用
azd provision --preview

# 在 Azure 入口網站監控實際費用
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第3章：設定與驗證
**先決條件**：已完成第1章  
**時長**：45-60 分鐘  
**複雜度**： ⭐⭐

#### 你將會學到
- 環境設定與管理
- 驗證與安全最佳實務
- 資源命名與組織

#### 學習資源
- **📖 設定**： [設定指南](docs/chapter-03-configuration/configuration.md) - 環境設定
- **🔐 安全**： [驗證模式與受管身分](docs/chapter-03-configuration/authsecurity.md) - 驗證模式
- **📝 範例**： [資料庫應用範例](examples/database-app/README.md) - AZD 資料庫範例

#### 實作練習
- 設定多個環境（dev、staging、prod）
- 設定受管身分驗證
- 實作針對環境的專屬設定

**💡 章節成果**：管理多個環境並採行適當的驗證與安全措施

---

### 🏗️ 第4章：基礎建設即程式碼與部署
**先決條件**：已完成第1-3章  
**時長**：1-1.5 小時  
**複雜度**： ⭐⭐⭐

#### 你將會學到
- 進階部署模式
- 使用 Bicep 的基礎建設即程式碼
- 資源佈建策略

#### 學習資源
- **📖 部署**： [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) - 完整工作流程
- **🏗️ 佈建**： [資源佈建](docs/chapter-04-infrastructure/provisioning.md) - Azure 資源管理
- **📝 範例**： [容器應用範例](../../examples/container-app) - 容器化部署

#### 實作練習
- 建立自訂 Bicep 範本
- 部署多服務應用程式
- 實作藍綠部署策略

**💡 章節成果**：使用自訂基礎建設範本部署複雜的多服務應用程式

---

### 🎯 第5章：多代理 AI 解決方案（進階）
**先決條件**：已完成第1-2章  
**時長**：2-3 小時  
**複雜度**： ⭐⭐⭐⭐

#### 你將會學到
- 多代理架構模式
- 代理編排與協調
- 可上線的 AI 部署

#### 學習資源
- **🤖 精選專案**： [零售多代理解決方案](examples/retail-scenario.md) - 完整實作
- **🛠️ ARM 範本**： [ARM 範本套件](../../examples/retail-multiagent-arm-template) - 一鍵部署
- **📖 架構**： [多代理協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) - 模式說明

#### 實作練習
```bash
# 部署完整的零售多代理解決方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索代理設定
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 章節成果**：部署並管理一個可上線的多代理 AI 解決方案，包含客戶與庫存代理

---

### 🔍 第6章：部署前驗證與規劃
**先決條件**：已完成第4章  
**時長**：1 小時  
**複雜度**： ⭐⭐

#### 你將會學到
- 容量規劃與資源驗證
- SKU 選擇策略
- 預檢查與自動化

#### 學習資源
- **📊 規劃**： [容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) - 資源驗證
- **💰 選擇**： [SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) - 成本效益選擇
- **✅ 驗證**： [預檢查](docs/chapter-06-pre-deployment/preflight-checks.md) - 自動化腳本

#### 實作練習
- 執行容量驗證腳本
- 為成本優化選擇 SKU
- 實作自動化的部署前檢查

**💡 章節成果**：在執行前驗證並優化部署

---

### 🚨 第7章：疑難排解與偵錯
**先決條件**：已完成任一部署章節  
**時長**：1-1.5 小時  
**複雜度**： ⭐⭐

#### 你將會學到
- 系統化的偵錯方法
- 常見問題與解決方案
- AI 特有問題的排解

#### 學習資源
- **🔧 常見問題**： [常見問題](docs/chapter-07-troubleshooting/common-issues.md) - 常見問答與解法
- **🕵️ 偵錯**： [偵錯指南](docs/chapter-07-troubleshooting/debugging.md) - 逐步策略
- **🤖 AI 問題**： [AI 專屬排解](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI 服務問題

#### 實作練習
- 診斷部署失敗
- 解決驗證相關問題
- 偵錯 AI 服務連線

**💡 章節成果**：能獨立診斷並解決常見部署問題

---

### 🏢 第8章：生產環境與企業模式
**先決條件**：已完成第1-4章  
**時長**：2-3 小時  
**複雜度**： ⭐⭐⭐⭐

#### 你將會學到
- 生產部署策略
- 企業安全模式
- 監控與成本優化

#### 學習資源
- **🏭 生產實務**： [生產 AI 最佳實務](docs/chapter-08-production/production-ai-practices.md) - 企業模式
- **📝 範例**： [微服務範例](../../examples/microservices) - 複雜架構
- **📊 監控**： [Application Insights 整合](docs/chapter-06-pre-deployment/application-insights.md) - 監控

#### 實作練習
- 實作企業安全模式
- 設定完整的監控
- 以適當治理部署至生產環境

**💡 章節成果**：部署具有完整生產能力的企業級應用程式

---

## 🎓 工作坊概覽：實作學習體驗

> **⚠️ 工作坊狀態：開發中**
> 工作坊教材目前正在開發與改善中。核心模組已可使用，但某些進階章節尚未完成。我們正積極補齊所有內容。 [追蹤進度 →](workshop/README.md)

### 互動式工作坊教材
**透過瀏覽器工具與引導式練習的完整實作學習體驗**

我們的工作坊教材提供結構化、互動式的學習體驗，以補充上方章節式課程。工作坊設計適合自學與由講師引導的課程。

#### 🛠️ 工作坊特色
- **基於瀏覽器的介面**: 完整由 MkDocs 提供的工作坊，具搜尋、複製與主題功能
- **整合 GitHub Codespaces**: 一鍵設定開發環境
- **結構化學習路徑**: 8 模組的引導式練習（總計 3-4 小時）
- **漸進式流程**: 介紹 → 篩選 → 驗證 → 解構 → 設定 → 客製化 → 清除 → 總結
- **互動式 DevContainer 環境**: 預先配置的工具與相依套件

#### 📚 工作坊模組架構
工作坊採用 **8 模組漸進式流程**，帶領你從探索到部署精通：

| 模組 | 主題 | 你會做什麼 | 時間 |
|--------|-------|----------------|----------|
| **0. 介紹** | 工作坊概覽 | 了解學習目標、先決條件與工作坊結構 | 15 min |
| **1. 篩選** | 範本探索 | 探索 AZD 範本並為你的情境選擇合適的 AI 範本 | 20 min |
| **2. 驗證** | 部署與驗證 | 使用 `azd up` 部署範本並驗證基礎設施是否運作 | 30 min |
| **3. 解構** | 了解結構 | 使用 GitHub Copilot 瀏覽範本架構、Bicep 檔案與程式碼組織 | 30 min |
| **4. 設定** | azure.yaml 深入探討 | 精通 `azure.yaml` 設定、生命週期鉤子與環境變數 | 30 min |
| **5. 客製化** | 打造你的版本 | 啟用 AI 搜尋、追蹤、評估，並根據你的情境進行自訂 | 45 min |
| **6. 清除** | 資源清理 | 使用 `azd down --purge` 安全地移除資源 | 15 min |
| **7. 總結** | 下一步 | 檢視成果、關鍵概念並繼續你的學習旅程 | 15 min |

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
# 選項 1：GitHub Codespaces（推薦）
# 在儲存庫中按一下「Code」→「Create codespace on main」

# 選項 2：本機開發
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 請依照 workshop/README.md 中的設定說明進行
```

#### 🎯 工作坊學習成果
完成工作坊後，參與者將能：
- **部署生產級 AI 應用程式**: 使用 AZD 與 Microsoft Foundry 服務
- **精通多代理架構**: 實作協調式 AI 代理解決方案
- **實作安全最佳做法**: 設定身分驗證與存取控制
- **為擴展最佳化**: 設計具成本效益且高效能的部署
- **故障排除部署**: 獨立解決常見問題

#### 📖 工作坊資源
- **🎥 互動式指南**: [工作坊教材](workshop/README.md) - 基於瀏覽器的學習環境
- **📋 模組逐項指引**:
  - [0. 介紹](workshop/docs/instructions/0-Introduction.md) - 工作坊概覽與目標
  - [1. 篩選](workshop/docs/instructions/1-Select-AI-Template.md) - 尋找並選擇 AI 範本
  - [2. 驗證](workshop/docs/instructions/2-Validate-AI-Template.md) - 部署並驗證範本
  - [3. 解構](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - 探索範本架構
  - [4. 設定](workshop/docs/instructions/4-Configure-AI-Template.md) - 精通 azure.yaml
  - [5. 客製化](workshop/docs/instructions/5-Customize-AI-Template.md) - 依情境自訂
  - [6. 清除](workshop/docs/instructions/6-Teardown-Infrastructure.md) - 清理資源
  - [7. 總結](workshop/docs/instructions/7-Wrap-up.md) - 檢視與下一步
- **🛠️ AI 工作坊實驗室**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - 以 AI 為重點的練習
- **💡 快速上手**: [工作坊設定指南](workshop/README.md#quick-start) - 環境設定

**適合對象**: 企業訓練、大學課程、自學與開發者訓練營。

---

## 📖 深入解析：AZD 能力

除了基礎功能外，AZD 提供適合生產部署的強大特性：

- **基於範本的部署** - 使用預建範本來應對常見的應用程式模式
- **基礎設施即程式碼** - 使用 Bicep 或 Terraform 管理 Azure 資源  
- **整合化工作流程** - 無縫地設定、部署與監控應用程式
- **開發者友善** - 優化開發者生產力與體驗

### **AZD + Microsoft Foundry：AI 部署的理想選擇**

**為何選擇 AZD 作為 AI 解決方案？** AZD 回應 AI 開發者面對的主要挑戰：

- **AI 就緒範本** - 為 Azure OpenAI、Cognitive Services 與 ML 工作負載預先配置的範本
- **安全的 AI 部署** - 內建針對 AI 服務、API 金鑰與模型端點的安全模式  
- **生產級 AI 模式** - 可伸縮且具成本效益的 AI 應用部署最佳實踐
- **端到端 AI 工作流程** - 從模型開發到生產部署並搭配適當的監控
- **成本優化** - 對 AI 工作負載的資源分配與擴展策略進行智慧化管理
- **Microsoft Foundry 整合** - 與 Microsoft Foundry 的模型目錄與端點無縫連接

---

## 🎯 範本與範例庫

### 精選：Microsoft Foundry 範本
**如果你要部署 AI 應用，請從這裡開始！**

> **注意：** 這些範本示範各種 AI 模式。部分為外部 Azure Samples，其他為本地實作。

| 範本 | 章節 | 複雜度 | 服務 | 類型 |
|----------|---------|------------|----------|------|
| [**開始使用 AI 聊天**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | 外部 |
| [**開始使用 AI 代理**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第2章 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| 外部 |
| [**Azure Search + OpenAI 示範**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | 外部 |
| [**OpenAI Chat App 快速上手**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | 外部 |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### 精選：完整學習情境
**對應學習章節的生產就緒應用程式範本**

| 範本 | 學習章節 | 複雜度 | 主要學習重點 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | 基本 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | 使用 Azure AI Search 的 RAG 實作 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第4章 | ⭐⭐ | Document Intelligence 整合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | 代理框架與 function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐ | 企業級 AI 編排 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | 含客戶與庫存代理的多代理架構 |

### 以範例類型學習

> **📌 本地 vs. 外部 範例：**  
> **本地範例**（在此倉庫中）= 可立即使用  
> **外部範例**（Azure Samples）= 從連結的倉庫克隆

#### 本地範例（可立即使用）
- [**零售多代理解決方案**](examples/retail-scenario.md) - 附 ARM 範本的完整生產就緒實作
  - 多代理架構（客戶 + 庫存 代理）
  - 完整的監控與評估
  - 透過 ARM 範本一鍵部署

#### 本地範例 - 容器應用（第2-5章）
**此倉庫中的完整容器部署範例：**
- [**容器應用範例**](examples/container-app/README.md) - 容器化部署的完整指南
  - [簡單 Flask API](../../examples/container-app/simple-flask-api) - 基本 REST API，支援 scale-to-zero
  - [微服務架構](../../examples/container-app/microservices) - 生產就緒的多服務部署
  - 快速上手、正式環境與進階部署模式
  - 監控、安全與成本優化指南

#### 外部範例 - 簡單應用（第1-2章）
**複製這些 Azure Samples 倉庫以開始：**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本部署範式
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 靜態內容部署
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署

#### 外部範例 - 資料庫整合（第3-4章）  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 資料庫連線模式
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless 資料工作流程

#### 外部範例 - 進階模式（第4-8章）
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服務架構
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - 背景處理  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - 生產就緒的 ML 模式

### 外部範本集合
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - 精選官方與社群範本集合
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 範本文件
- [**Examples Directory**](examples/README.md) - 含詳細說明的本地學習範例

---

## 📚 學習資源與參考

### 快速參考
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - 依章節整理的必要 azd 指令
- [**Glossary**](resources/glossary.md) - Azure 與 azd 術語  
- [**FAQ**](resources/faq.md) - 依學習章節整理的常見問題
- [**Study Guide**](resources/study-guide.md) - 全面練習題

### 實作工作坊
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - 使你的 AI 解決方案能被 AZD 部署（2-3 小時）
- [**Interactive Workshop**](workshop/README.md) - 8 模組的 MkDocs 與 GitHub Codespaces 引導式練習
  - 採用：介紹 → 篩選 → 驗證 → 解構 → 設定 → 客製化 → 清除 → 總結

### 外部學習資源
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 快速故障排除指南

**初學者常見問題與即時解決方案：**

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

# 或在開發環境中使用較小的 SKU
# 編輯 infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" 在執行到一半時失敗</strong></summary>

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
# AZD 會產生唯一的名稱，但如果發生衝突：
azd down --force --purge

# 然後以全新的環境重試
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 模板部署耗時過長</strong></summary>

**正常等待時間:**
- 簡單的網頁應用程式: 5-10 minutes
- 含資料庫的應用程式: 10-15 minutes
- AI applications: 15-25 minutes (OpenAI 佈建較慢)

```bash
# 檢查進度
azd show

# 如果卡住超過 30 分鐘，檢查 Azure 入口網站：
azd monitor
# 查看失敗的部署
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# 檢查您的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 您至少需要「Contributor」角色
# 請向您的 Azure 管理員申請授予:
# - Contributor (用於資源)
# - User Access Administrator (用於角色分配)
```
</details>

<details>
<summary><strong>❌ 找不到已部署應用程式的 URL</strong></summary>

```bash
# 顯示所有服務端點
azd show

# 或者打開 Azure 入口網站
azd monitor

# 檢查特定服務
azd env get-values
# 尋找 *_URL 變數
```
</details>

### 📚 完整的故障排除資源

- **常見問題指南:** [詳細解決方案](docs/chapter-07-troubleshooting/common-issues.md)
- **AI 專屬問題:** [AI 故障排除](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **偵錯指南:** [逐步偵錯](docs/chapter-07-troubleshooting/debugging.md)
- **取得協助:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 課程完成與認證

### 進度追蹤
透過每章追蹤你的學習進度：

- [ ] **第 1 章**: 基礎與快速入門 ✅
- [ ] **第 2 章**: AI 為先的開發 ✅  
- [ ] **第 3 章**: 設定與驗證 ✅
- [ ] **第 4 章**: 基礎設施即程式碼與部署 ✅
- [ ] **第 5 章**: 多代理 AI 解決方案 ✅
- [ ] **第 6 章**: 部署前驗證與規劃 ✅
- [ ] **第 7 章**: 故障排除與偵錯 ✅
- [ ] **第 8 章**: 生產環境與企業模式 ✅

### 學習驗證
完成每章後，透過下列方式驗證你的知識：
1. **實作練習**: 完成該章的實作部署
2. **知識檢核**: 檢視該章的常見問題（FAQ）
3. **社群討論**: 在 Azure Discord 分享你的經驗
4. **下一章**: 前往下一個複雜度層級

### 課程完成的好處
完成所有章節後，你將擁有：
- **生產實務經驗**: 已將真實 AI 應用部署到 Azure
- **專業技能**: 具備企業級部署能力  
- **社群認可**: 成為 Azure 開發者社群的活躍成員
- **職涯進展**: 搶手的 AZD 與 AI 部署專業技能

---

## 🤝 社群與支援

### 取得協助與支援
- **技術問題**: [回報 Bug 與需求功能](https://github.com/microsoft/azd-for-beginners/issues)
- **學習問題**: [Microsoft Azure Discord 社群](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 專屬協助**: 加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **文件**: [官方 Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### 來自 Microsoft Foundry Discord 的社群見解

**#Azure 頻道最近的投票結果：**
- **45%** 的開發人員想使用 AZD 來處理 AI 工作負載
- **主要挑戰**：多服務部署、憑證管理、上線準備  
- **最常被要求**：AI 專用範本、故障排除指南、最佳實務

**加入我們的社群以：**
- 分享你的 AZD + AI 經驗並獲得協助
- 取得新 AI 範本的早期預覽
- 為 AI 部署最佳實務做出貢獻
- 影響未來 AI + AZD 功能的開發

### 對課程的貢獻
我們歡迎貢獻！請閱讀我們的 [貢獻指南](CONTRIBUTING.md) 以了解詳細資訊：
- **內容改進**: 增強現有章節和範例
- **新增範例**: 加入實務情境與範本  
- **翻譯**: 協助維護多語言支援
- **錯誤回報**: 提升準確性與明確度
- **社群準則**: 遵循我們的包容性社群指南

---

## 📄 課程資訊

### 授權
本專案採用 MIT 授權條款 - 詳情請參閱 [LICENSE](../../LICENSE) 檔案。

### 相關的 Microsoft 學習資源

我們團隊也製作其他完整的學習課程：

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
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot 系列
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---
## 🗺️ 課程導覽

**🚀 準備好開始學習了嗎？**

**初學者**: 從 [第 1 章：基礎與快速上手](../..)  
**AI 開發者**: 直接前往 [第 2 章：以 AI 為先的開發](../..)  
**進階開發者**: 從 [第 3 章：設定與驗證](../..) 開始

**下一步**: [開始第 1 章 - AZD 基礎](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件已使用 AI 翻譯服務 Co‑op Translator（https://github.com/Azure/co-op-translator）進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始語言的文件應被視為具權威性的版本。對於重要資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而導致的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->