# AZD 初學者：有結構的學習之旅

![AZD-for-beginners](../../translated_images/zh-HK/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 自動翻譯（保持最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[阿拉伯文](../ar/README.md) | [孟加拉文](../bn/README.md) | [保加利亞文](../bg/README.md) | [緬甸語](../my/README.md) | [中文（簡體）](../zh-CN/README.md) | [中文（繁體，香港）](./README.md) | [中文（繁體，澳門）](../zh-MO/README.md) | [中文（繁體，臺灣）](../zh-TW/README.md) | [克羅地亞文](../hr/README.md) | [捷克文](../cs/README.md) | [丹麥文](../da/README.md) | [荷蘭文](../nl/README.md) | [愛沙尼亞文](../et/README.md) | [芬蘭文](../fi/README.md) | [法文](../fr/README.md) | [德文](../de/README.md) | [希臘文](../el/README.md) | [希伯來文](../he/README.md) | [印地文](../hi/README.md) | [匈牙利文](../hu/README.md) | [印尼文](../id/README.md) | [意大利文](../it/README.md) | [日文](../ja/README.md) | [坎那達語](../kn/README.md) | [韓文](../ko/README.md) | [立陶宛文](../lt/README.md) | [馬來文](../ms/README.md) | [馬拉雅拉姆語](../ml/README.md) | [馬拉地語](../mr/README.md) | [尼泊爾文](../ne/README.md) | [奈及利亞皮欽語](../pcm/README.md) | [挪威文](../no/README.md) | [波斯文（法爾西語）](../fa/README.md) | [波蘭文](../pl/README.md) | [葡萄牙文（巴西）](../pt-BR/README.md) | [葡萄牙文（葡萄牙）](../pt-PT/README.md) | [旁遮普文（古魯穆奇體）](../pa/README.md) | [羅馬尼亞文](../ro/README.md) | [俄文](../ru/README.md) | [塞爾維亞文（西里爾字母）](../sr/README.md) | [斯洛伐克文](../sk/README.md) | [斯洛文尼亞文](../sl/README.md) | [西班牙文](../es/README.md) | [斯瓦希里文](../sw/README.md) | [瑞典文](../sv/README.md) | [他加祿語（菲律賓語）](../tl/README.md) | [泰米爾文](../ta/README.md) | [泰盧固文](../te/README.md) | [泰文](../th/README.md) | [土耳其文](../tr/README.md) | [烏克蘭文](../uk/README.md) | [烏爾都文](../ur/README.md) | [越南文](../vi/README.md)

> **想本地複製？**

> 此存儲庫包含 50 多種語言翻譯，顯著增加下載大小。若想無翻譯內容複製，請使用稀疏檢出：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 這讓您用更快的速度下載完成課程所需所有內容。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 什麼是 Azure Developer CLI（azd）？

**Azure Developer CLI（azd）** 是一款對開發者友好的命令行工具，讓應用程式部署到 Azure 變得簡單。您不再需要手動創建和連接數十個 Azure 資源，只需一條命令即可部署整個應用程式。

### `azd up` 的魔法

```bash
# 只需一條指令就能完成所有工作：
# ✅ 建立所有 Azure 資源
# ✅ 設定網絡和安全性
# ✅ 建置你的應用程式代碼
# ✅ 部署到 Azure
# ✅ 提供一個可用的 URL
azd up
```

**就是這麼簡單！** 無需點擊 Azure 入口網站、無需先學習複雜的 ARM 範本、無需手動配置 —— 直接在 Azure 上運行您的應用程式。

---

## ❓ Azure Developer CLI 與 Azure CLI：有什麼分別？

這是初學者最常問的問題。簡單回答如下：

| 功能 | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **用途** | 管理個別 Azure 資源 | 部署完整應用程式 |
| **思維模式** | 專注基礎設施 | 專注應用程式 |
| **範例** | `az webapp create --name myapp...` | `azd up` |
| **學習曲線** | 必須了解 Azure 服務 | 僅需了解您的應用程式 |
| **最佳使用者** | DevOps、基礎設施 | 開發者、原型開發 |

### 簡單類比

- **Azure CLI** 就像擁有建造房子的所有工具——錘子、鋸子、釘子。你可以建造任何東西，但你需要知道建築知識。
- **Azure Developer CLI** 就像聘請承包商——你描述需求，他們負責建造。

### 何時使用哪個？

| 情境 | 使用工具 |
|----------|----------|
|「我想快速部署我的網站」 | `azd up` |
|「我只需要建立一個存儲帳戶」 | `az storage account create` |
|「我正在構建完整的 AI 應用」 | `azd init --template azure-search-openai-demo` |
|「我需要調試特定的 Azure 資源」 | `az resource show` |
|「我想在幾分鐘內完成生產環境部署」 | `azd up --environment production` |

### 它們可以協同工作！

AZD 底層使用 Azure CLI。您可以兩者合用：
```bash
# 使用 AZD 部署你的應用程式
azd up

# 然後使用 Azure CLI 微調特定資源
az webapp config set --name myapp --always-on true
```

---

## 🌟 在 Awesome AZD 找範本

不要從零開始！**Awesome AZD** 是社群收集的可即時部署範本：

| 資源 | 描述 |
|----------|-------------|
| 🔗 [**Awesome AZD 展示館**](https://azure.github.io/awesome-azd/) | 瀏覽 200 多個範本，一鍵部署 |
| 🔗 [**提交範本**](https://github.com/Azure/awesome-azd/issues) | 向社群貢獻您的範本 |
| 🔗 [**GitHub 倉庫**](https://github.com/Azure/awesome-azd) | 給星並探索原始碼 |

### Awesome AZD 熱門 AI 範本

```bash
# 使用 Azure OpenAI + AI Search 的 RAG 聊天
azd init --template azure-search-openai-demo

# 快速 AI 聊天應用程式
azd init --template openai-chat-app-quickstart

# 使用 Foundry Agents 的 AI 代理
azd init --template get-started-with-ai-agents
```

---

## 🎯 3 步驟快速入門

### 第一步：安裝 AZD（2 分鐘）

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

### 第二步：登入 Azure

```bash
azd auth login
```

### 第三步：部署您的第一個應用程式

```bash
# 從範本初始化
azd init --template todo-nodejs-mongo

# 部署到 Azure（會建立所有資源！)
azd up
```

**🎉 大功告成！** 您的應用程式已在 Azure 上線。

### 清理環境（別忘了！）

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 如何使用本課程

本課程採用 **循序漸進的學習** 設計——從您熟悉的部分開始，逐步進階：

| 您的經驗 | 從這裡開始 |
|-----------------|------------|
| **完全不了解 Azure** | [第一章：基礎](../..) |
| **了解 Azure，但不熟悉 AZD** | [第一章：基礎](../..) |
| **想部署 AI 應用** | [第二章：AI 優先開發](../..) |
| **想動手實作** | [🎓 互動工作坊](workshop/README.md) - 3-4 小時引導實驗室 |
| **需要生產環境模式** | [第八章：生產與企業模式](../..) |

### 快速設置

1. **派生此倉庫**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **克隆它**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **尋求幫助**: [Azure Discord 社群](https://discord.com/invite/ByRwuEEgH4)

> **想本地複製？**

> 此存儲庫包含 50 多種語言翻譯，顯著增加下載大小。若想無翻譯內容複製，請使用稀疏檢出：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 這讓您用更快的速度下載完成課程所需所有內容。


## 課程總覽

透過設計有層次的章節來掌握 Azure Developer CLI（azd）。**特別聚焦於 Microsoft Foundry 整合的 AI 應用部署。**

### 為什麼本課程對現代開發者至關重要

根據 Microsoft Foundry Discord 社群調查，**有 45% 的開發者想使用 AZD 處理 AI 工作負載**，但面臨：
- 複雜的多服務 AI 架構
- 生產級 AI 部署最佳實踐
- Azure AI 服務整合與配置
- AI 工作負載的成本優化
- AI 特定部署問題的故障排除

### 學習目標

完成本結構化課程後，您將能：
- **精通 AZD 基礎**：核心概念、安裝與配置
- **部署 AI 應用**：使用 AZD 搭配 Microsoft Foundry 服務
- **實現基礎設施即程式碼**：使用 Bicep 模板管理 Azure 資源
- **故障排查部署問題**：解決常見問題並進行調試
- **優化生產環境**：安全、擴展、監控及成本管理
- **建構多代理解決方案**：部署複雜 AI 架構

## 🗺️ 課程地圖：章節快速導航

每個章節有專門的 README，包含學習目標、快速入門及練習：

| 章節 | 主題 | 課程內容 | 時長 | 難易度 |
|---------|-------|---------|----------|------------|
| **[第一章：基礎](docs/chapter-01-foundation/README.md)** | 入門基礎 | [AZD 基礎](docs/chapter-01-foundation/azd-basics.md) &#124; [安裝](docs/chapter-01-foundation/installation.md) &#124; [第一個專案](docs/chapter-01-foundation/first-project.md) | 30-45 分鐘 | ⭐ |
| **[第二章：AI 開發](docs/chapter-02-ai-development/README.md)** | AI 優先應用 | [Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI 代理](docs/chapter-02-ai-development/agents.md) &#124; [模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 小時 | ⭐⭐ |
| **[第三章：配置](docs/chapter-03-configuration/README.md)** | 身份驗證與安全性 | [配置](docs/chapter-03-configuration/configuration.md) &#124; [身份驗證與安全](docs/chapter-03-configuration/authsecurity.md) | 45-60 分鐘 | ⭐⭐ |
| **[第四章：基礎架構](docs/chapter-04-infrastructure/README.md)** | IaC 與部署 | [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [資源配置](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 小時 | ⭐⭐⭐ |
| **[Ch 5: 多代理](docs/chapter-05-multi-agent/README.md)** | AI 代理方案 | [零售場景](examples/retail-scenario.md) &#124; [協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 小時 | ⭐⭐⭐⭐ |
| **[Ch 6: 部署前準備](docs/chapter-06-pre-deployment/README.md)** | 計劃與驗證 | [預檢查](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [應用程式洞察](docs/chapter-06-pre-deployment/application-insights.md) | 1 小時 | ⭐⭐ |
| **[Ch 7: 疑難排解](docs/chapter-07-troubleshooting/README.md)** | 除錯與修復 | [常見問題](docs/chapter-07-troubleshooting/common-issues.md) &#124; [除錯](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI 問題](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 小時 | ⭐⭐ |
| **[Ch 8: 生產環境](docs/chapter-08-production/README.md)** | 企業模式 | [生產實務](docs/chapter-08-production/production-ai-practices.md) | 2-3 小時 | ⭐⭐⭐⭐ |
| **[🎓 工作坊](workshop/README.md)** | 實作實驗室 | [介紹](workshop/docs/instructions/0-Introduction.md) &#124; [選擇](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [驗證](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [拆解](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [配置](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [客製化](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [拆除](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [總結](workshop/docs/instructions/7-Wrap-up.md) | 3-4 小時 | ⭐⭐ |

**課程總時長：** 約 10-14 小時 | **技能進階：** 初學者 → 生產就緒

---

## 📚 學習章節

*根據經驗與目標選擇你的學習路徑*

### 🚀 第 1 章：基礎與快速入門
**前置需求**：Azure 訂閱、基本命令行知識  
**時長**：30-45 分鐘  
**難度**：⭐

#### 你將學到
- 了解 Azure Developer CLI 基本原理
- 在你的平台安裝 AZD
- 首次成功部署

#### 學習資源
- **🎯 從這裡開始**：[什麼是 Azure Developer CLI？](../..)
- **📖 理論**：[AZD 基礎](docs/chapter-01-foundation/azd-basics.md) - 核心概念與術語
- **⚙️ 設置**：[安裝與配置](docs/chapter-01-foundation/installation.md) - 平台相關指南
- **🛠️ 實作**：[你的第一個專案](docs/chapter-01-foundation/first-project.md) - 逐步教學
- **📋 快速參考**：[命令速查表](resources/cheat-sheet.md)

#### 實作練習
```bash
# 快速安裝檢查
azd version

# 部署你的第一個應用程式
azd init --template todo-nodejs-mongo
azd up
```

**💡 章節成果**：成功使用 AZD 部署簡單的 Web 應用程式到 Azure

**✅ 成功驗證：**
```bash
# 完成第一章後，你應該能夠：
azd version              # 顯示已安裝版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署到 Azure
azd show                # 顯示運行中應用程式的網址
# 應用程式於瀏覽器中開啟並運作
azd down --force --purge  # 清理資源
```

**📊 時間投入：** 30-45 分鐘  
**📈 完成技能等級：** 可以獨立部署基本應用程式

**✅ 成功驗證：**
```bash
# 完成第一章後，你應該能夠：
azd version              # 顯示已安裝的版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署到 Azure
azd show                # 顯示運行中應用程式的網址
# 應用程式在瀏覽器中開啟並運作
azd down --force --purge  # 清理資源
```

**📊 時間投入：** 30-45 分鐘  
**📈 完成技能等級：** 可以獨立部署基本應用程式

---

### 🤖 第 2 章：AI 優先開發（推薦 AI 開發者）
**前置需求**：完成第 1 章  
**時長**：1-2 小時  
**難度**：⭐⭐

#### 你將學到
- Microsoft Foundry 與 AZD 整合
- 部署 AI 驅動應用程式
- 了解 AI 服務配置

#### 學習資源
- **🎯 從這裡開始**：[Microsoft Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI 代理**：[AI 代理指南](docs/chapter-02-ai-development/agents.md) - 使用 AZD 部署智能代理
- **📖 模式**：[AI 模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) - 部署與管理 AI 模型
- **🛠️ 工作坊**：[AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - 使你的 AI 方案適用 AZD
- **🎥 互動指南**：[工作坊材料](workshop/README.md) - 基於瀏覽器的學習與 MkDocs * DevContainer 環境
- **📋 模板**：[Microsoft Foundry 範本](../..)
- **📝 範例**：[AZD 部署範例](examples/README.md)

#### 實作練習
```bash
# 部署您的第一個人工智能應用程式
azd init --template azure-search-openai-demo
azd up

# 嘗試更多人工智能範本
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 章節成果**：部署與配置具備 RAG 功能的 AI 聊天應用

**✅ 成功驗證：**
```bash
# 完成第二章後，您應該能夠：
azd init --template azure-search-openai-demo
azd up
# 測試 AI 聊天介面
# 提問並獲得具來源的 AI 驅動回應
# 驗證搜尋整合是否有效
azd monitor  # 檢查 Application Insights 是否顯示遙測數據
azd down --force --purge
```

**📊 時間投入：** 1-2 小時  
**📈 完成技能等級：** 能部署與配置生產就緒的 AI 應用  
**💰 成本意識：** 了解開發成本約 $80-150/月，生產成本約 $300-3500/月

#### 💰 AI 部署成本考量

**開發環境（估計 $80-150/月）：**
- Azure OpenAI（按使用付費）：$0-50/月（依據令牌使用量）
- AI 搜尋（基礎層）：$75/月
- Container Apps（消耗計費）：$0-20/月
- 儲存空間（標準）：$1-5/月

**生產環境（估計 $300-3,500+/月）：**
- Azure OpenAI（PTU 保持效能）：$3,000+/月 或 大量使用時按使用付費
- AI 搜尋（標準層）：$250/月
- Container Apps（專用）：$50-100/月
- 應用程式洞察：$5-50/月
- 儲存空間（高級）：$10-50/月

**💡 成本優化技巧：**
- 使用 **免費層** Azure OpenAI 學習（含 50,000 個令牌/月）
- 不開發時執行 `azd down` 釋放資源
- 先使用消耗付費，生產才升級 PTU
- 使用 `azd provision --preview` 部署前估算成本
- 啟用自動擴充：只支付實際用量

**成本監控：**
```bash
# 檢查預估每月成本
azd provision --preview

# 在 Azure 入口網站監控實際成本
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第 3 章：配置與認證
**前置需求**：完成第 1 章  
**時長**：45-60 分鐘  
**難度**：⭐⭐

#### 你將學到
- 環境配置與管理
- 認證與安全最佳實踐
- 資源命名和組織

#### 學習資源
- **📖 配置**：[配置指南](docs/chapter-03-configuration/configuration.md) - 環境設置
- **🔐 安全**：[認證模式與託管身份](docs/chapter-03-configuration/authsecurity.md) - 認證模式
- **📝 範例**：[資料庫應用範例](examples/database-app/README.md) - AZD 資料庫範例

#### 實作練習
- 配置多個環境（開發、預備、正式）
- 設置託管身份認證
- 實作環境特定配置

**💡 章節成果**：能管理多個環境並執行適當認證和安全措施

---

### 🏗️ 第 4 章：基礎設施即代碼與部署
**前置需求**：完成第 1-3 章  
**時長**：1-1.5 小時  
**難度**：⭐⭐⭐

#### 你將學到
- 進階部署模式
- 使用 Bicep 實作基礎設施即代碼
- 資源部署策略

#### 學習資源
- **📖 部署**：[部署指南](docs/chapter-04-infrastructure/deployment-guide.md) - 完整工作流
- **🏗️ 資源供應**：[資源供應](docs/chapter-04-infrastructure/provisioning.md) - Azure 資源管理
- **📝 範例**：[Container App 範例](../../examples/container-app) - 容器化部署

#### 實作練習
- 建立自訂 Bicep 範本
- 部署多服務應用
- 實作藍綠部署策略

**💡 章節成果**：能使用自訂的基礎設施模板部署複雜多服務應用程式

---

### 🎯 第 5 章：多代理 AI 解決方案（進階）
**前置需求**：完成第 1-2 章  
**時長**：2-3 小時  
**難度**：⭐⭐⭐⭐

#### 你將學到
- 多代理架構模式
- 代理協調與管弦
- 生產就緒 AI 部署

#### 學習資源
- **🤖 特色專案**：[零售多代理解決方案](examples/retail-scenario.md) - 完整實作
- **🛠️ ARM 範本**：[ARM 範本套件](../../examples/retail-multiagent-arm-template) - 一鍵部署
- **📖 架構**：[多代理協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) - 模式指導

#### 實作練習
```bash
# 部署完整的零售多代理方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索代理配置
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 章節成果**：部署並管理一個具備客戶與庫存代理的生產就緒多代理 AI 解決方案

---

### 🔍 第 6 章：部署前驗證與計劃
**前置需求**：完成第 4 章  
**時長**：1 小時  
**難度**：⭐⭐

#### 你將學到
- 容量規劃與資源驗證
- SKU 選擇策略
- 預檢查與自動化

#### 學習資源
- **📊 規劃**：[容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) - 資源驗證
- **💰 選擇**：[SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) - 成本效益選擇
- **✅ 驗證**：[預檢查](docs/chapter-06-pre-deployment/preflight-checks.md) - 自動化腳本

#### 實作練習
- 執行容量驗證腳本
- 優化成本的 SKU 選擇
- 實現自動化預部署檢查

**💡 章節成果**：在執行前驗證並優化部署

---

### 🚨 第 7 章：疑難排解與除錯
**前置需求**：完成任一部署章節  
**時長**：1-1.5 小時  
**難度**：⭐⭐

#### 你將學到
- 系統性除錯方法
- 常見問題與解決方法
- AI 特定疑難排解

#### 學習資源
- **🔧 常見問題**：[常見問題](docs/chapter-07-troubleshooting/common-issues.md) - 常見問答與解決方式
- **🕵️ 除錯**：[除錯指南](docs/chapter-07-troubleshooting/debugging.md) - 步驟策略
- **🤖 AI 問題**：[AI 專屬疑難排解](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI 服務問題

#### 實作練習
- 診斷部署失敗原因
- 解決認證問題
- 除錯 AI 服務連線

**💡 章節成果**：能獨立診斷與解決常見部署問題

---

### 🏢 第 8 章：生產與企業架構模式
**前置需求**：完成第 1-4 章  
**時長**：2-3 小時  
**難度**：⭐⭐⭐⭐

#### 你將學到
- 生產部署策略
- 企業安全模式
- 監控與成本優化

#### 學習資源
- **🏭 生產**：[生產 AI 最佳實務](docs/chapter-08-production/production-ai-practices.md) - 企業模式
- **📝 範例**：[微服務範例](../../examples/microservices) - 複雜架構
- **📊 監控**：[應用程式洞察整合](docs/chapter-06-pre-deployment/application-insights.md) - 監控指導

#### 實作練習
- 實現企業安全模式
- 設置完整監控
- 依照治理規範部署到生產環境

**💡 章節成果**：能部署具企業級完整功能的生產應用

---

## 🎓 工作坊概覽：實作式學習體驗

> **⚠️ 工作坊狀態：開發中**  
> 工作坊教材目前持續開發與優化中。核心模組已可使用，但部分進階章節尚未完成。我們正積極努力完成所有內容。[追蹤進度 →](workshop/README.md)

### 互動式工作坊教材
**完整實務操作，搭配瀏覽器工具與引導練習**
我們的工作坊材料提供結構化、互動式的學習體驗，作為上述章節式課程的補充。工作坊設計適用於自主學習及導師帶領課程。

#### 🛠️ 工作坊特色
- **瀏覽器介面**：完整 MkDocs 支援的工作坊，具備搜尋、複製和主題功能
- **GitHub Codespaces 整合**：一鍵式開發環境設置
- **結構化學習路徑**：8 模組導引練習（共 3-4 小時）
- **漸進式方法論**：介紹 → 選擇 → 驗證 → 解構 → 配置 → 客製化 → 拆除 → 總結
- **互動式 DevContainer 環境**：預設配置的工具與相依套件

#### 📚 工作坊模組結構
工作坊採用 **8 模組漸進式方法論**，帶你從探索到部署精通：

| 模組 | 主題 | 你將做什麼 | 時長 |
|--------|-------|----------------|----------|
| **0. 介紹** | 工作坊總覽 | 了解學習目標、前置條件及工作坊架構 | 15 分鐘 |
| **1. 選擇** | 範本探索 | 探索 AZD 範本並選擇適合你情境的 AI 範本 | 20 分鐘 |
| **2. 驗證** | 部署與驗證 | 使用 `azd up` 部署範本並驗證基礎架構運作 | 30 分鐘 |
| **3. 解構** | 理解架構 | 利用 GitHub Copilot 探索範本架構、Bicep 檔案與程式碼組織 | 30 分鐘 |
| **4. 配置** | azure.yaml 深入 | 掌握 `azure.yaml` 配置、生命週期掛勾與環境變數 | 30 分鐘 |
| **5. 客製化** | 量身打造 | 啟用 AI 搜尋、追蹤、評估並客製化你的情境 | 45 分鐘 |
| **6. 拆除** | 清理 | 使用 `azd down --purge` 安全解除佈署資源 | 15 分鐘 |
| **7. 總結** | 下一步 | 回顧成果、關鍵概念，繼續你的學習旅程 | 15 分鐘 |

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
# 在倉庫中點擊「Code」→「在 main 上創建 codespace」

# 選項 2：本地開發
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 按照 workshop/README.md 中的設置說明進行操作
```
  
#### 🎯 工作坊學習成果  
透過完成工作坊，參與者將能：  
- **部署生產級 AI 應用**：使用 AZD 連接 Microsoft Foundry 服務  
- **精通多代理架構**：實作協同 AI 代理解決方案  
- **實施安全最佳實踐**：配置身份驗證與存取控制  
- **優化擴展性**：設計成本效益高且性能優異的部署  
- **排解部署問題**：獨立解決常見問題  

#### 📖 工作坊資源  
- **🎥 互動指南**：[Workshop Materials](workshop/README.md) - 瀏覽器式學習環境  
- **📋 各模組指引**：
  - [0. 介紹](workshop/docs/instructions/0-Introduction.md) - 工作坊總覽與目標  
  - [1. 選擇](workshop/docs/instructions/1-Select-AI-Template.md) - 尋找並選擇 AI 範本  
  - [2. 驗證](workshop/docs/instructions/2-Validate-AI-Template.md) - 部署與驗證範本  
  - [3. 解構](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - 探索範本架構  
  - [4. 配置](workshop/docs/instructions/4-Configure-AI-Template.md) - 掌握 azure.yaml  
  - [5. 客製化](workshop/docs/instructions/5-Customize-AI-Template.md) - 針對情境客製化  
  - [6. 拆除](workshop/docs/instructions/6-Teardown-Infrastructure.md) - 清理資源  
  - [7. 總結](workshop/docs/instructions/7-Wrap-up.md) - 檢視與後續步驟  
- **🛠️ AI 工作坊實驗室**：[AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI 專注練習  
- **💡 快速開始**：[Workshop Setup Guide](workshop/README.md#quick-start) - 環境配置指南  

**適合對象**：企業培訓、大學課程、自主學習、開發者訓練營。

---

## 📖 深入了解：AZD 功能

超越基礎，AZD 提供強大功能支持生產環境部署：

- **基於範本的部署** - 使用預建範本快速建立常見應用模式  
- **基礎架構即程式碼** - 以 Bicep 或 Terraform 管理 Azure 資源  
- **整合工作流程** - 無縫配置、部署與監控應用  
- **友善開發者體驗** - 優化生產力與開發體驗  

### **AZD + Microsoft Foundry：AI 部署首選**

**為何選用 AZD 於 AI 解決方案？** AZD 解決 AI 開發者面臨的主要挑戰：

- **AI 預置範本** - 預設配置 Azure OpenAI、Cognitive Services 與機器學習工作負載  
- **安全 AI 部署** - 內建安全模式涵蓋 AI 服務、API 金鑰與模型端點  
- **生產級 AI 模式** - 可擴展且成本效益高的 AI 應用部署最佳實踐  
- **端到端 AI 工作流程** - 從模型開發到生產部署並具適當監控  
- **成本優化** - 智能資源分配與擴展策略  
- **Microsoft Foundry 整合** - 與 Microsoft Foundry 模型目錄和端點無縫連接  

---

## 🎯 範本及示例庫

### 精選：Microsoft Foundry 範本  
**部署 AI 應用首選起點！**

> **注意：** 這些範本展示各種 AI 模式。部分為外部 Azure Samples，部分為本地實作。

| 範本 | 章節 | 複雜度 | 服務 | 類型 |
|----------|---------|------------|----------|------|
| [**開始 AI 聊天**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第 2 章 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | 外部 |
| [**開始 AI 代理**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第 2 章 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| 外部 |
| [**Azure 搜尋 + OpenAI 示範**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第 2 章 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | 外部 |
| [**OpenAI 聊天應用快速啟動**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第 2 章 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第 5 章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 第 8 章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | 外部 |
| [**零售多代理解決方案**](examples/retail-scenario.md) | 第 5 章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **本地** |

### 精選：完整學習情境  
**生產級應用範本，對應各學習章節**

| 範本 | 學習章節 | 複雜度 | 主要學習項目 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第 2 章 | ⭐ | 基本 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第 2 章 | ⭐⭐ | 利用 Azure AI Search 實作 RAG |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第 4 章 | ⭐⭐ | 文件智能整合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第 5 章 | ⭐⭐⭐ | 代理框架與函數呼叫 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第 8 章 | ⭐⭐⭐ | 企業級 AI 協調調度 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第 5 章 | ⭐⭐⭐⭐ | 客戶及庫存代理的多代理架構 |

### 按示例類型學習

> **📌 本地與外部示例說明：**  
> **本地示例**（本倉庫）= 可即刻使用  
> **外部示例**（Azure Samples）= 從連結的倉庫克隆

#### 本地示例（現成可用）
- [**零售多代理解決方案**](examples/retail-scenario.md) - 完整生產級實作含 ARM 範本  
  - 多代理架構（客戶 + 庫存代理）  
  - 完整監控與評估  
  - 一鍵 ARM 範本部署

#### 本地示例 - 容器應用（第 2-5 章）
**此倉庫的完整容器部署範例：**  
- [**Container App 示例集**](examples/container-app/README.md) - 容器化部署全指南  
  - [簡易 Flask API](../../examples/container-app/simple-flask-api) - 基本 REST API 並支援 scale-to-zero  
  - [微服務架構](../../examples/container-app/microservices) - 生產級多服務部署  
  - 快速啟動、生產與進階部署模式  
  - 監控、安全及成本優化建議

#### 外部示例 - 簡易應用（第 1-2 章）  
**克隆這些 Azure Samples 倉庫開始：**  
- [簡易 Web 應用 - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本部署模式  
- [靜態網站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 靜態內容部署  
- [容器應用 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署

#### 外部示例 - 資料庫整合（第 3-4 章）  
- [資料庫應用 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 資料庫連接模式  
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 無伺服器資料工作流程

#### 外部示例 - 進階模式（第 4-8 章）
- [Java 微服務](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服務架構  
- [Container Apps 後台作業](https://github.com/Azure-Samples/container-apps-jobs) - 背景處理  
- [企業級機器學習流水線](https://github.com/Azure-Samples/mlops-v2) - 生產級 ML 模式

### 外部範本集錦
- [**官方 AZD 範本庫**](https://azure.github.io/awesome-azd/) - 精選官方與社群範本  
- [**Azure Developer CLI 範本**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - 微軟學習範本文件  
- [**Examples 目錄**](examples/README.md) - 本地學習示例與詳細說明  

---

## 📚 學習資源與參考資料

### 快速參考
- [**指令速查表**](resources/cheat-sheet.md) - 以章節組織的關鍵 azd 指令  
- [**術語表**](resources/glossary.md) - Azure 與 azd 專有名詞  
- [**常見問答**](resources/faq.md) - 按學習章節分類的常見問題  
- [**學習指南**](resources/study-guide.md) - 全面練習題

### 實作工作坊
- [**AI 工作坊實驗室**](docs/chapter-02-ai-development/ai-workshop-lab.md) - 讓你的 AI 解決方案可用 AZD 部署（2-3 小時）  
- [**互動式工作坊**](workshop/README.md) - 8 模組導引練習，含 MkDocs 與 GitHub Codespaces  
  - 流程：介紹 → 選擇 → 驗證 → 解構 → 配置 → 客製化 → 拆除 → 總結  

### 外部學習資源
- [Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure 價格計算機](https://azure.microsoft.com/pricing/calculator/)  
- [Azure 服務狀態](https://status.azure.com/)  

---

## 🔧 快速故障排除指南

**新手常見問題與立即解法：**

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
<summary><strong>❌ 「找不到訂閱」或「訂閱未設定」</strong></summary>

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
<summary><strong>❌ 「InsufficientQuota」或「Quota exceeded」</strong></summary>

```bash
# 嘗試不同的 Azure 區域
azd env set AZURE_LOCATION "westus2"
azd up

# 或在開發時使用較小的 SKU
# 編輯 infra/main.parameters.json：
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ 「azd up」 部署中途失敗</strong></summary>
```bash
# 選項 1：清理並重試
azd down --force --purge
azd up

# 選項 2：只修復基礎架構
azd provision

# 選項 3：檢查詳細狀態
azd show

# 選項 4：在 Azure 監視器中檢查日誌
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ 「身份驗證失敗」或「權杖已過期」</strong></summary>

```bash
# 重新驗證身份
az logout
az login

azd auth logout
azd auth login

# 驗證認證
az account show
```
</details>

<details>
<summary><strong>❌ 「資源已存在」或命名衝突</strong></summary>

```bash
# AZD 會產生獨特名稱，但如果有衝突：
azd down --force --purge

# 然後使用全新環境重試
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 模板部署花費時間過長</strong></summary>

**正常等待時間：**
- 簡單網頁應用程式：5-10 分鐘
- 含資料庫的應用程式：10-15 分鐘
- AI 應用程式：15-25 分鐘（OpenAI 配置較慢）

```bash
# 檢查進度
azd show

# 如果停頓超過30分鐘，檢查 Azure 入口網站：
azd monitor
# 尋找失敗的部署
```
</details>

<details>
<summary><strong>❌ 「權限拒絕」或「禁止存取」</strong></summary>

```bash
# 檢查你的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 你至少需要「參與者」角色
# 請你的 Azure 管理員授予：
# - 參與者（用於資源）
# - 使用者存取管理員（用於角色分配）
```
</details>

<details>
<summary><strong>❌ 找不到已部署應用程式的 URL</strong></summary>

```bash
# 顯示所有服務端點
azd show

# 或打開 Azure 入口網站
azd monitor

# 檢查指定服務
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
追蹤您每一章節的學習進度：

- [ ] **第 1 章**：基礎與快速入門 ✅
- [ ] **第 2 章**：AI 優先開發 ✅  
- [ ] **第 3 章**：配置與驗證 ✅
- [ ] **第 4 章**：基礎設施即程式碼與部署 ✅
- [ ] **第 5 章**：多代理 AI 解決方案 ✅
- [ ] **第 6 章**：部署前驗證與規劃 ✅
- [ ] **第 7 章**：疑難排解與除錯 ✅
- [ ] **第 8 章**：生產環境與企業模式 ✅

### 學習驗證
完成每章後，請透過以下方式驗證您的知識：
1. **實作練習**：完成該章的動手部署
2. **知識檢核**：瀏覽您章節的常見問答區
3. **社群討論**：於 Azure Discord 分享您的經驗
4. **下一章節**：挑戰更高難度的章節

### 課程完成收益
完成全部章節後，您將擁有：
- **生產經驗**：在 Azure 上成功部署實際 AI 應用
- **專業技能**：具備企業級的部署能力  
- **社群認可**：成為積極的 Azure 開發者社群成員
- **職涯提升**：具備熱門的 AZD 及 AI 部署專業知識

---

## 🤝 社群與支援

### 尋求協助與支援
- **技術問題**：[回報錯誤及功能建議](https://github.com/microsoft/azd-for-beginners/issues)
- **學習疑問**：[Microsoft Azure Discord 社群](https://discord.gg/microsoft-azure) 與 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 專屬協助**：加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **官方文件**：[Azure Developer CLI 官方文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### 來自 Microsoft Foundry Discord 的社群洞見

**來自 #Azure 頻道的近期投票結果：**
- **45%** 的開發者希望使用 AZD 處理 AI 工作負載
- **主要挑戰**：多服務部署、憑證管理、生產環境準備  
- **最受期待**：AI 專屬模板、疑難排解指南、最佳實踐

**加入我們的社群，您可以：**
- 分享您的 AZD + AI 經驗並獲得協助
- 提前使用新的 AI 範本預覽版本
- 為 AI 部署最佳實踐貢獻心力
- 影響未來 AI + AZD 產品功能開發

### 參與課程貢獻
我們歡迎您的參與！請閱讀我們的 [貢獻指南](CONTRIBUTING.md) 了解：
- **內容優化**：改良現有章節與範例
- **新增範例**：加入真實場景與模板  
- **翻譯協助**：維護多語言支援
- **錯誤回報**：提升準確度與清晰度
- **社群規範**：遵循我們包容的社群守則

---

## 📄 課程資訊

### 授權條款
本專案採用 MIT 授權條款，詳見 [LICENSE](../../LICENSE) 文件。

### 微軟相關學習資源

我們團隊製作了其他完整的學習課程：

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

## 🗺️ 課程導航

**🚀 準備好開始學習了嗎？**

**初學者**：請從 [第 1 章：基礎與快速入門](../..) 開始  

**AI 開發人員**：跳至 [第 2 章：以 AI 為先的開發](../..)  
**經驗豐富的開發人員**：從 [第 3 章：配置與身份驗證](../..) 開始

**下一步**：[開始第 1 章 - AZD 基礎知識](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於確保準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原文件之母語版本應被視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。對因使用此翻譯而引起的任何誤解或誤釋，我們概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->