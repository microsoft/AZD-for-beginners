# AZD 新手入門：結構化學習旅程

![AZD-for-beginners](../../translated_images/zh-MO/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 自動翻譯（始終保持最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[阿拉伯語](../ar/README.md) | [孟加拉語](../bn/README.md) | [保加利亞語](../bg/README.md) | [緬甸語](../my/README.md) | [中文（簡體）](../zh-CN/README.md) | [中文（繁體，香港）](../zh-HK/README.md) | [中文（繁體，澳門）](./README.md) | [中文（繁體，台灣）](../zh-TW/README.md) | [克羅地亞語](../hr/README.md) | [捷克語](../cs/README.md) | [丹麥語](../da/README.md) | [荷蘭語](../nl/README.md) | [愛沙尼亞語](../et/README.md) | [芬蘭語](../fi/README.md) | [法語](../fr/README.md) | [德語](../de/README.md) | [希臘語](../el/README.md) | [希伯來語](../he/README.md) | [印地語](../hi/README.md) | [匈牙利語](../hu/README.md) | [印度尼西亞語](../id/README.md) | [義大利語](../it/README.md) | [日語](../ja/README.md) | [坎納達語](../kn/README.md) | [高棉語](../km/README.md) | [韓語](../ko/README.md) | [立陶宛語](../lt/README.md) | [馬來語](../ms/README.md) | [馬拉雅拉姆語](../ml/README.md) | [馬拉地語](../mr/README.md) | [尼泊爾語](../ne/README.md) | [奈及利亞皮欽語](../pcm/README.md) | [挪威語](../no/README.md) | [波斯語（法爾西語）](../fa/README.md) | [波蘭語](../pl/README.md) | [葡萄牙語（巴西）](../pt-BR/README.md) | [葡萄牙語（葡萄牙）](../pt-PT/README.md) | [旁遮普語（古魯穆奇文）](../pa/README.md) | [羅馬尼亞語](../ro/README.md) | [俄語](../ru/README.md) | [塞爾維亞語（西里爾字母）](../sr/README.md) | [斯洛伐克語](../sk/README.md) | [斯洛維尼亞語](../sl/README.md) | [西班牙語](../es/README.md) | [斯瓦希里語](../sw/README.md) | [瑞典語](../sv/README.md) | [他加祿語（菲律賓語）](../tl/README.md) | [泰米爾語](../ta/README.md) | [泰盧固語](../te/README.md) | [泰語](../th/README.md) | [土耳其語](../tr/README.md) | [烏克蘭語](../uk/README.md) | [烏爾都語](../ur/README.md) | [越南語](../vi/README.md)

> **想要本地複製？**
>
> 此儲存庫包含 50 多種語言翻譯，大幅增加下載大小。若想不含翻譯檔案複製，請使用 sparse checkout：
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
> 這樣可以更快速下載且擁有完成課程所需的一切。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 今天 azd 的新功能

Azure Developer CLI 已經超越傳統的網頁應用和 API。現在，azd 是將 <strong>任何</strong> 應用程式部署到 Azure 的單一工具 — 包含 AI 驅動的應用和智慧代理。

這對你意味著：

- **AI 代理現在是 azd 的一級工作負載。** 你可以使用熟悉的 `azd init` → `azd up` 流程來初始化、部署和管理 AI 代理專案。
- **Microsoft Foundry 整合** 將模型部署、代理託管和 AI 服務配置直接帶入 azd 模板生態系統。
- **核心工作流程保持不變。** 無論部署待辦事項應用、微服務，或多代理 AI 解決方案，指令相同。

如果你之前用過 azd，AI 支援只是自然擴展 — 不是獨立工具或進階路線。如果你是新手，將學習一套通用工作流程。

---

## 🚀 什麼是 Azure Developer CLI (azd)？

**Azure Developer CLI (azd)** 是為開發者友善設計的命令列工具，使部署應用到 Azure 變得簡單。你不需要手動建立並連接眾多 Azure 資源，只需一條命令就能部署整個應用。

### `azd up` 的魔力

```bash
# 這個單一指令完成所有工作：
# ✅ 建立所有 Azure 資源
# ✅ 配置網絡與安全
# ✅ 建置你的應用程式程式碼
# ✅ 部署到 Azure
# ✅ 提供你一個可用的網址
azd up
```

**就是這樣！** 不用點選 Azure 入口網站，不用先學複雜的 ARM 範本，也不用手動設定 — 直接在 Azure 上執行應用。

---

## ❓ Azure Developer CLI 與 Azure CLI 有何不同？

初學者最常問的問題。簡單回答：

| 功能 | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|-------|---------------------|--------------------------------|
| <strong>目的</strong> | 管理單一 Azure 資源 | 部署完整應用程式 |
| <strong>思維模式</strong> | 基礎架構導向 | 應用程式導向 |
| <strong>範例指令</strong> | `az webapp create --name myapp...` | `azd up` |
| <strong>學習曲線</strong> | 必須了解 Azure 服務 | 只需了解你的應用 |
| <strong>適合對象</strong> | DevOps、基礎架構人員 | 開發者、快速原型 |

### 簡易比喻

- **Azure CLI** 就像擁有建造房子的所有工具 — 錘子、鋸子、釘子。你可以建造任何東西，但必須知道建築知識。
- **Azure Developer CLI** 就像請了個承包商 — 你描述需求，他負責建造。

### 何時使用哪一個

| 情境 | 使用 |
|------|-------|
| 「我想快速部署網頁應用程式」 | `azd up` |
| 「我需要建立一個儲存帳戶」 | `az storage account create` |
| 「我要建立一個完整的 AI 應用」 | `azd init --template azure-search-openai-demo` |
| 「我要偵錯特定 Azure 資源」 | `az resource show` |
| 「我想要數分鐘完成生產環境部署」 | `azd up --environment production` |

### 它們可以一起用！

AZD 在底層使用 Azure CLI。你可以同時使用兩者：
```bash
# 使用 AZD 部署您的應用程式
azd up

# 然後使用 Azure CLI 微調特定資源
az webapp config set --name myapp --always-on true
```

---

## 🌟 在 Awesome AZD 找模板

別從頭開始！**Awesome AZD** 是社群收集的可立即部署模板：

| 資源 | 描述 |
|-------|-------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | 瀏覽 200 多個模板，一鍵部署 |
| 🔗 [<strong>提交模板</strong>](https://github.com/Azure/awesome-azd/issues) | 向社群貢獻你自己的模板 |
| 🔗 [**GitHub 儲存庫**](https://github.com/Azure/awesome-azd) | 按星及探索原始碼 |

### Awesome AZD 熱門 AI 模板

```bash
# 與 Microsoft Foundry 模型及 AI 搜尋的 RAG 聊天
azd init --template azure-search-openai-demo

# 快速 AI 聊天應用程序
azd init --template openai-chat-app-quickstart

# 使用 Foundry 代理的 AI 代理
azd init --template get-started-with-ai-agents
```

---

## 🎯 三步驟開始

開始前，先確認你的機器已準備好部署想用的模板：

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

若有任何需求檢查失敗，請先修正再繼續快速開始。

### 步驟1：安裝 AZD（2分鐘）

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

### 步驟2：AZD 驗證

```bash
# 如果你計劃在本課程直接使用 Azure CLI 命令，則為可選
az login

# AZD 工作流程所需
azd auth login
```

若不確定需要哪種，請依照 [安裝與設定](docs/chapter-01-foundation/installation.md#authentication-setup) 裡的完整設定流程。

### 步驟3：部署你的第一個應用

```bash
# 從範本初始化
azd init --template todo-nodejs-mongo

# 部署到 Azure（建立所有！）
azd up
```

**🎉 完成！** 你的應用程式已經在 Azure 上線。

### 清理（別忘了！）

```bash
# 完成實驗後刪除所有資源
azd down --force --purge
```

---

## 📚 如何使用本課程

本課程設計為 <strong>漸進式學習</strong> — 從你熟悉的地方開始，逐步升級：

| 你的經驗 | 從這裡開始 |
|-----------|---------------|
| **剛接觸 Azure** | [第1章：基礎](#-chapter-1-foundation--quick-start) |
| **熟悉 Azure，初用 AZD** | [第1章：基礎](#-chapter-1-foundation--quick-start) |
| **想部署 AI 應用** | [第2章：AI優先開發](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| <strong>想實作練習</strong> | [🎓 互動工作坊](workshop/README.md) - 3-4 小時引導實驗 |
| <strong>需要生產模式範例</strong> | [第8章：生產與企業模式](#-chapter-8-production--enterprise-patterns) |

### 快速設定

1. <strong>派生本儲存庫</strong>: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. <strong>複製到本地</strong>: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. <strong>尋求支援</strong>: [Azure Discord 社群](https://discord.com/invite/ByRwuEEgH4)

> **想要本地複製？**

> 此儲存庫包含 50 多種語言翻譯，大幅增加下載大小。若想不含翻譯檔案複製，請使用 sparse checkout：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 這樣可以更快速下載且擁有完成課程所需的一切。


## 課程總覽

透過結構化章節掌握 Azure Developer CLI (azd) ，設計為漸進式學習。**特別專注於與 Microsoft Foundry 整合的 AI 應用部署。**

### 為何這課程對現代開發者很重要

根據 Microsoft Foundry Discord 社群的洞察，**45% 的開發者想用 AZD 部署 AI 工作負載**，但面臨：

- 複雜的多服務 AI 架構
- 生產級 AI 部署最佳實踐
- Azure AI 服務整合與配置
- AI 工作負載成本優化
- AI 專屬部署問題排解

### 學習目標

完成此結構化課程後，你將能：

- **掌握 AZD 基礎**：核心概念、安裝與設定
- **部署 AI 應用**：使用 AZD 與 Microsoft Foundry 服務
- <strong>實作基礎架構即程式碼</strong>：使用 Bicep 範本管理 Azure 資源
- <strong>部署問題排解</strong>：解決常見問題與除錯
- <strong>生產優化</strong>：安全性、擴展、監控與成本管理
- <strong>建構多代理方案</strong>：部署複雜 AI 架構

## 開始之前：帳戶、存取與假設

開始第1章之前，請確保以下條件已具備。本指南後續安裝步驟預設這些基本條件已處理。
- **一個 Azure 訂閱**：您可以使用工作或您自己的帳戶中的現有訂閱，或建立一個 [免費試用](https://aka.ms/azurefreetrial) 以開始使用。
- **建立 Azure 資源的權限**：對於大多數練習，您應至少擁有目標訂閱或資源群組的 <strong>貢獻者</strong> 訪問權限。某些章節可能還假設您可以建立資源群組、受管身份和 RBAC 指派。
- [**一個 GitHub 帳戶**](https://github.com)：這對於分叉儲存庫、追蹤自己的更改，以及使用 GitHub Codespaces 進行工作坊非常有用。
- <strong>範本執行時先決條件</strong>：某些範本需要本地工具，例如 Node.js、Python、Java 或 Docker。開始之前請運行設置驗證程式，讓您及早發現缺少的工具。
- <strong>基本終端機熟悉度</strong>：您不需要成為專家，但應該能熟練執行如 `git clone`、`azd auth login` 和 `azd up` 等命令。

> **在企業訂閱環境工作？**  
> 如果您的 Azure 環境由管理員管理，請事先確認您是否能在您計劃使用的訂閱或資源群組中部署資源。如果不能，請在開始前要求沙箱訂閱或貢獻者訪問權限。

> **剛接觸 Azure？**  
> 從您自己的 Azure 試用或按用量付費訂閱開始 https://aka.ms/azurefreetrial，這樣您就可以完整完成練習，而無需等待租戶層級的批核。

## 🗺️ 課程地圖：快速按章節導航

每個章節都有專屬的 README，包含學習目標、快速入門和練習：

| 章節 | 主題 | 課程 | 時間長度 | 複雜度 |
|---------|-------|---------|----------|------------|
| **[第1章：基礎](docs/chapter-01-foundation/README.md)** | 入門 | [AZD 基本](docs/chapter-01-foundation/azd-basics.md) &#124; [安裝](docs/chapter-01-foundation/installation.md) &#124; [第一個專案](docs/chapter-01-foundation/first-project.md) | 30-45 分鐘 | ⭐ |
| **[第2章：AI 開發](docs/chapter-02-ai-development/README.md)** | AI 優先應用 | [Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI 智能代理](docs/chapter-02-ai-development/agents.md) &#124; [模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [工作坊](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 小時 | ⭐⭐ |
| **[第3章：配置](docs/chapter-03-configuration/README.md)** | 身份驗證與安全 | [配置](docs/chapter-03-configuration/configuration.md) &#124; [身份驗證與安全](docs/chapter-03-configuration/authsecurity.md) | 45-60 分鐘 | ⭐⭐ |
| **[第4章：基礎架構](docs/chapter-04-infrastructure/README.md)** | 基礎架構即程式碼與部署 | [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [資源佈建](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 小時 | ⭐⭐⭐ |
| **[第5章：多代理](docs/chapter-05-multi-agent/README.md)** | AI 代理解決方案 | [零售場景](examples/retail-scenario.md) &#124; [協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 小時 | ⭐⭐⭐⭐ |
| **[第6章：部署前作業](docs/chapter-06-pre-deployment/README.md)** | 規劃與驗證 | [預檢核](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [應用洞察](docs/chapter-06-pre-deployment/application-insights.md) | 1 小時 | ⭐⭐ |
| **[第7章：故障排除](docs/chapter-07-troubleshooting/README.md)** | 除錯與修復 | [常見問題](docs/chapter-07-troubleshooting/common-issues.md) &#124; [偵錯](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI 問題](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 小時 | ⭐⭐ |
| **[第8章：生產](docs/chapter-08-production/README.md)** | 企業模式 | [生產實務](docs/chapter-08-production/production-ai-practices.md) | 2-3 小時 | ⭐⭐⭐⭐ |
| **[🎓 工作坊](workshop/README.md)** | 實作實驗室 | [介紹](workshop/docs/instructions/0-Introduction.md) &#124; [選擇](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [驗證](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [拆解](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [配置](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [自訂](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [拆除](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [總結](workshop/docs/instructions/7-Wrap-up.md) | 3-4 小時 | ⭐⭐ |

**總課程時長：** ~10-14 小時 | **技能進展：** 初學者 → 生產就緒

---

## 📚 學習章節

<em>根據經驗水平與目標選擇您的學習路徑</em>

### 🚀 第1章：基礎與快速入門  
<strong>先決條件</strong>：Azure 訂閱、基本命令列知識  
<strong>時長</strong>：30-45 分鐘  
<strong>複雜度</strong>：⭐

#### 您將學到
- 了解 Azure Developer CLI 的基本概念
- 在您的平台安裝 AZD
- 成功完成您的第一次部署

#### 學習資源
- **🎯 從這裡開始**：[什麼是 Azure Developer CLI？](#what-is-azure-developer-cli)  
- **📖 理論**：[AZD 基本](docs/chapter-01-foundation/azd-basics.md) - 核心概念與術語  
- **⚙️ 設置**：[安裝與設置](docs/chapter-01-foundation/installation.md) - 平台專屬指南  
- **🛠️ 實作**：[您的第一個專案](docs/chapter-01-foundation/first-project.md) - 逐步教學  
- **📋 快速參考**：[命令速查表](resources/cheat-sheet.md)

#### 實務練習
```bash
# 快速安裝檢查
azd version

# 部署您的第一個應用程式
azd init --template todo-nodejs-mongo
azd up
```
  
**💡 章節成果**：成功使用 AZD 部署簡單的網頁應用程式到 Azure

**✅ 成功驗證：**  
```bash
# 完成第一章後，你應該能夠：
azd version              # 顯示已安裝的版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署到 Azure
azd show                # 顯示執行中應用程式的 URL
# 應用程式在瀏覽器中開啟並運作
azd down --force --purge  # 清理資源
```
  
**📊 所需時間：** 30-45 分鐘  
**📈 技能水平提升：** 能獨立部署基本應用程式  
**📈 技能水平提升：** 能獨立部署基本應用程式

---

### 🤖 第2章：AI 優先開發 (建議 AI 開發者)  
<strong>先決條件</strong>：完成第1章  
<strong>時長</strong>：1-2 小時  
<strong>複雜度</strong>：⭐⭐

#### 您將學到
- Microsoft Foundry 與 AZD 的整合
- 部署 AI 驅動的應用程式
- 了解 AI 服務配置

#### 學習資源
- **🎯 從這裡開始**：[Microsoft Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md)  
- **🤖 AI 智能代理**：[AI 代理指南](docs/chapter-02-ai-development/agents.md) - 使用 AZD 部署智慧代理  
- **📖 模式**：[AI 模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) - 部署與管理 AI 模型  
- **🛠️ 工作坊**：[AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - 讓您的 AI 解決方案 AZD 就緒  
- **🎥 互動指南**：[工作坊材料](workshop/README.md) - 使用 MkDocs * DevContainer 環境的瀏覽器學習  
- **📋 範本**：[Microsoft Foundry 範本](#工作坊資源)  
- **📝 範例**：[AZD 部署範例](examples/README.md)

#### 實務練習
```bash
# 部署您的第一個人工智能應用程式
azd init --template azure-search-openai-demo
azd up

# 嘗試更多人工智能範本
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```
  
**💡 章節成果**：部署並配置具備 RAG 功能的 AI 聊天應用程式

**✅ 成功驗證：**  
```bash
# 完成第二章後，你應該能夠：
azd init --template azure-search-openai-demo
azd up
# 測試人工智能聊天介面
# 提問並獲得帶有來源的人工智能回覆
# 驗證搜尋整合是否正常運作
azd monitor  # 檢查應用程式見解是否顯示遙測數據
azd down --force --purge
```
  
**📊 所需時間：** 1-2 小時  
**📈 技能水平提升：** 能部署及配置生產就緒的 AI 應用程式  
**💰 成本意識：** 了解開發成本約 $80-150/月，生產成本約 $300-3500/月

#### 💰 AI 部署費用考量

**開發環境（估計 $80-150/月）：**  
- Microsoft Foundry 模型（按用量付費）：$0-50/月（依 token 使用量）  
- AI Search（基礎層級）：$75/月  
- Container Apps（消耗計費）：$0-20/月  
- 儲存體（標準）：$1-5/月

**生產環境（估計 $300-3,500+/月）：**  
- Microsoft Foundry 模型（PTU 用於穩定效能）：$3,000+/月 或 大量使用的按用量付費  
- AI Search（標準層級）：$250/月  
- Container Apps（專用）：$50-100/月  
- Application Insights：$5-50/月  
- 儲存體（高級）：$10-50/月

**💡 成本優化建議：**  
- 使用 <strong>免費層</strong> Microsoft Foundry 模型學習（Azure OpenAI 提供每月 50,000 令牌）  
- 非開發時使用 `azd down` 停用資源  
- 初期使用消耗型計費，僅生產環境升級 PTU  
- 使用 `azd provision --preview` 預估部署成本  
- 啟用自動調整，只為實際使用量付費

**成本監控：**  
```bash
# 檢查預計每月費用
azd provision --preview

# 在 Azure 入口網站監控實際費用
az consumption budget list --resource-group <your-rg>
```
  
---

### ⚙️ 第3章：配置與身份驗證  
<strong>先決條件</strong>：完成第1章  
<strong>時長</strong>：45-60 分鐘  
<strong>複雜度</strong>：⭐⭐

#### 您將學到
- 環境配置與管理
- 身份驗證與安全最佳實踐
- 資源命名與組織管理

#### 學習資源
- **📖 配置**：[配置指南](docs/chapter-03-configuration/configuration.md) - 環境設定  
- **🔐 安全**：[身份驗證模式與受管身份](docs/chapter-03-configuration/authsecurity.md) - 身份驗證模式  
- **📝 範例**：[資料庫應用範例](examples/database-app/README.md) - AZD 資料庫範例

#### 實務練習
- 配置多個環境（開發、測試、生產）
- 設置受管身份驗證
- 實作環境專屬配置

**💡 章節成果**：管理多個環境，擁有適當的身份驗證與安全措施

---

### 🏗️ 第4章：基礎架構即程式碼與部署  
<strong>先決條件</strong>：完成第1至3章  
<strong>時長</strong>：1-1.5 小時  
<strong>複雜度</strong>：⭐⭐⭐

#### 您將學到
- 進階部署模式
- 使用 Bicep 進行基礎架構即程式碼
- 資源佈建策略

#### 學習資源
- **📖 部署**：[部署指南](docs/chapter-04-infrastructure/deployment-guide.md) - 完整工作流程  
- **🏗️ 佈建**：[資源佈建](docs/chapter-04-infrastructure/provisioning.md) - Azure 資源管理  
- **📝 範例**：[容器應用範例](../../examples/container-app) - 容器化部署

#### 實務練習
- 建立自訂 Bicep 範本
- 部署多服務應用程式
- 實作藍綠部署策略

**💡 章節成果**：使用自訂基礎架構範本部署複雜多服務應用程式

---

### 🎯 第5章：多代理 AI 解決方案（進階）  
<strong>先決條件</strong>：完成第1、2章  
<strong>時長</strong>：2-3 小時  
<strong>複雜度</strong>：⭐⭐⭐⭐

#### 您將學到
- 多代理架構模式
- 代理協調與編排
- 生產就緒的 AI 部署

#### 學習資源
- **🤖 重點專案**：[零售多代理解決方案](examples/retail-scenario.md) - 完整實作  
- **🛠️ ARM 範本**：[ARM 範本套件](../../examples/retail-multiagent-arm-template) - 一鍵部署  
- **📖 架構**：[多代理協調模式](docs/chapter-06-pre-deployment/coordination-patterns.md) - 模式說明

#### 實務練習
```bash
# 部署完整的零售多代理解決方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索代理配置
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 章節成果**：部署並管理生產就緒的多代理 AI 解決方案，含客戶與存貨代理

---

### 🔍 第6章：部署前驗證與規劃  
<strong>先決條件</strong>：完成第4章  
<strong>時長</strong>：1 小時  
<strong>複雜度</strong>：⭐⭐
#### 你將學到的內容
- 容量規劃與資源驗證
- SKU 選擇策略
- 預先檢查與自動化

#### 學習資源
- **📊 規劃**：[容量規劃](docs/chapter-06-pre-deployment/capacity-planning.md) - 資源驗證
- **💰 選擇**：[SKU 選擇](docs/chapter-06-pre-deployment/sku-selection.md) - 成本效益選擇
- **✅ 驗證**：[預先檢查](docs/chapter-06-pre-deployment/preflight-checks.md) - 自動化腳本

#### 實作練習
- 執行容量驗證腳本
- 優化 SKU 選擇以降低成本
- 實作自動化預部署檢查

**💡 本章成果**：在執行前驗證及優化部署

---

### 🚨 第七章：故障排除與偵錯
<strong>先決條件</strong>：完成任一部署章節  
<strong>時間</strong>：1-1.5 小時  
<strong>複雜度</strong>：⭐⭐

#### 你將學到的內容
- 系統化偵錯方法
- 常見問題及解決方案
- AI 專屬故障排除

#### 學習資源
- **🔧 常見問題**：[常見問題](docs/chapter-07-troubleshooting/common-issues.md) - FAQ 與解決方案
- **🕵️ 偵錯**：[偵錯指南](docs/chapter-07-troubleshooting/debugging.md) - 逐步策略
- **🤖 AI 問題**：[AI 專屬故障排除](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI 服務問題

#### 實作練習
- 判斷部署失敗原因
- 解決身份驗證問題
- 偵錯 AI 服務連線

**💡 本章成果**：獨立診斷並解決常見部署問題

---

### 🏢 第八章：生產環境與企業範式
<strong>先決條件</strong>：完成第一至第四章  
<strong>時間</strong>：2-3 小時  
<strong>複雜度</strong>：⭐⭐⭐⭐

#### 你將學到的內容
- 生產環境部署策略
- 企業安全範式
- 監控與成本優化

#### 學習資源
- **🏭 生產環境**：[生產 AI 最佳實踐](docs/chapter-08-production/production-ai-practices.md) - 企業範式
- **📝 範例**：[微服務範例](../../examples/microservices) - 複雜架構
- **📊 監控**：[Application Insights 整合](docs/chapter-06-pre-deployment/application-insights.md) - 監控

#### 實作練習
- 實作企業安全範式
- 設定完整監控
- 依據治理原則部署至生產環境

**💡 本章成果**：部署具備完整生產功能的企業級應用程式

---

## 🎓 工作坊總覽：實作學習體驗

> **⚠️ 工作坊狀態：開發中**  
> 工作坊教材正在開發與優化中。核心模組已具備功能，但部分進階內容尚未完成。我們正積極努力完成所有內容。[追蹤進度 →](workshop/README.md)

### 互動式工作坊教材
<strong>結合瀏覽器工具與引導練習的完整實作學習</strong>

工作坊教材提供結構化且互動的學習體驗，與上述章節課程互補。工作坊設計兼具自學與講師帶領。

#### 🛠️ 工作坊特色
- <strong>瀏覽器介面</strong>：完整 MkDocs 支援的工作坊，具備搜尋、複製及主題功能
- **GitHub Codespaces 整合**：一鍵建立開發環境
- <strong>結構化學習路徑</strong>：8 模組引導練習（總時長 3-4 小時）
- <strong>漸進式方法</strong>：介紹 → 選擇 → 驗證 → 解構 → 配置 → 客製化 → 清理 → 總結
- **互動式 DevContainer 環境**：預先配置工具與依賴

#### 📚 工作坊模組結構
工作坊採用<strong>8 模組漸進方法</strong>，帶領你從探索到部署精通：

| 模組 | 主題 | 你將執行 | 時間 |
|--------|-------|----------------|----------|
| **0. 介紹** | 工作坊總覽 | 理解學習目標、先決條件與工作坊結構 | 15 分鐘 |
| **1. 選擇** | 範本發現 | 瀏覽 AZD 範本，選擇合適的 AI 範本 | 20 分鐘 |
| **2. 驗證** | 部署與驗證 | 使用 `azd up` 部署範本並驗證基礎設施正常 | 30 分鐘 |
| **3. 解構** | 了解結構 | 透過 GitHub Copilot 探索範本架構、Bicep 檔案與程式碼組織 | 30 分鐘 |
| **4. 配置** | azure.yaml 深入 | 精通 `azure.yaml` 配置、生命週期鉤子及環境變數 | 30 分鐘 |
| **5. 客製化** | 打造專屬範本 | 啟用 AI 搜尋、追蹤、評估並根據場景調整設定 | 45 分鐘 |
| **6. 清理** | 資源清除 | 使用 `azd down --purge` 安全移除資源 | 15 分鐘 |
| **7. 總結** | 後續步驟 | 回顧成果、重點概念，並延續學習旅程 | 15 分鐘 |

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
# 在代碼庫中點擊「程式碼」→「在 main 上建立 codespace」

# 選項 2：本地開發
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 遵循 workshop/README.md 中的設置指引
```
  
#### 🎯 工作坊學習成果  
完成工作坊後，參與者將能：
- **部署生產 AI 應用**：使用 AZD 搭配 Microsoft Foundry 服務
- <strong>精通多代理架構</strong>：實作協調的 AI 代理解決方案
- <strong>執行安全最佳實踐</strong>：設定身份驗證與存取控制
- <strong>優化規模擴展</strong>：設計成本效益及效能兼備的部署
- <strong>故障排除部署問題</strong>：能獨立解決常見問題

#### 📖 工作坊資源
- **🎥 互動式指南**：[工作坊教材](workshop/README.md) - 瀏覽器學習環境
- **📋 模組逐步說明**：
  - [0. 介紹](workshop/docs/instructions/0-Introduction.md) - 工作坊概覽與目標
  - [1. 選擇](workshop/docs/instructions/1-Select-AI-Template.md) - 尋找並選擇 AI 範本
  - [2. 驗證](workshop/docs/instructions/2-Validate-AI-Template.md) - 部署與驗證範本
  - [3. 解構](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - 探索範本架構
  - [4. 配置](workshop/docs/instructions/4-Configure-AI-Template.md) - 精通 azure.yaml
  - [5. 客製化](workshop/docs/instructions/5-Customize-AI-Template.md) - 根據場景客製設定
  - [6. 清理](workshop/docs/instructions/6-Teardown-Infrastructure.md) - 清理資源
  - [7. 總結](workshop/docs/instructions/7-Wrap-up.md) - 回顧與未來計劃
- **🛠️ AI 工作坊實驗室**：[AI 工作坊實驗室](docs/chapter-02-ai-development/ai-workshop-lab.md) - 專注 AI 的練習
- **💡 快速開始**：[工作坊設定指南](workshop/README.md#quick-start) - 環境配置

<strong>適合對象</strong>：企業培訓、大學課程、自學及開發者新秀訓練營。

---

## 📖 深入探討：AZD 能力

除基礎外，AZD 提供強大生產部署功能：

- <strong>範本化部署</strong> - 使用預建範本支援常見應用模式
- <strong>基礎設施即程式碼</strong> - 使用 Bicep 或 Terraform 管理 Azure 資源  
- <strong>整合式工作流程</strong> - 無縫提供、部署及監控應用程式
- <strong>開發者友好</strong> - 優化開發者生產力與體驗

### **AZD 與 Microsoft Foundry：AI 部署理想組合**

**為什麼選擇 AZD 來打造 AI 解決方案？** AZD 解決 AI 開發者最關注的挑戰：

- **AI 專用範本** - 預配置 Microsoft Foundry 模型、認知服務與機器學習工作負載範本
- **安全 AI 部署** - 內建 AI 服務、API 金鑰與模型端點安全範式  
- **生產 AI 模式** - 支援可擴展且具成本效益的 AI 應用部署最佳實務
- **端到端 AI 工作流程** - 從模型開發到生產部署含完善監控
- <strong>成本優化</strong> - 智慧資源配置與擴展策略
- **Microsoft Foundry 整合** - 無縫連結 Foundry 模型目錄與端點

---

## 🎯 範本與範例庫

### 精選：Microsoft Foundry 範本
**如果要部署 AI 應用，從這裡開始！**

> **註：** 這些範本展示多元 AI 模式。部分為 Azure Samples 外部範本，部分為本地實作。

| 範本 | 章節 | 複雜度 | 服務 | 類型 |
|----------|---------|------------|----------|------|
| [**AI 聊天入門**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第二章 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | 外部 |
| [**AI 代理入門**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第二章 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| 外部 |
| [**Azure Search + OpenAI 示範**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第二章 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | 外部 |
| [**OpenAI 聊天應用快速啟動**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第二章 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第五章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 第八章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | 外部 |
| [<strong>零售多代理方案</strong>](examples/retail-scenario.md) | 第五章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | <strong>本地</strong> |

### 精選：完整學習場景
<strong>對應學習章節的生產就緒應用範本</strong>

| 範本 | 學習章節 | 複雜度 | 主要學習 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第二章 | ⭐ | 基本 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第二章 | ⭐⭐ | 使用 Azure AI Search 實作 RAG |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第四章 | ⭐⭐ | 文件智能整合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第五章 | ⭐⭐⭐ | 代理框架與函式呼叫 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第八章 | ⭐⭐⭐ | 企業級 AI 編排 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第五章 | ⭐⭐⭐⭐ | 客戶與庫存多代理架構 |

### 根據範例類型學習

> **📌 本地 vs. 外部範例：**  
> <strong>本地範例</strong>（本倉庫內）= 可立即使用  
> <strong>外部範例</strong>（Azure Samples）= 從連結倉庫克隆

#### 本地範例（可立即使用）
- [<strong>零售多代理方案</strong>](examples/retail-scenario.md) - 完整生產就緒實作及 ARM 範本
  - 多代理架構（客戶代理 + 庫存代理）
  - 全面監控與評估
  - 一鍵通過 ARM 範本部署

#### 本地範例 - 容器應用（第二至五章）
**本倉庫提供全面容器部署範例：**
- [**Container App 範例**](examples/container-app/README.md) - 容器化部署完整指南
  - [簡易 Flask API](../../examples/container-app/simple-flask-api) - 支援 scale-to-zero 的基礎 REST API
  - [微服務架構](../../examples/container-app/microservices) - 生產就緒多服務部署
  - 快速啟動、生產與進階部署模式
  - 監控、安全性與成本優化指南

#### 外部範例 - 簡易應用（第一至二章）
**克隆這些 Azure Samples 倉庫開始學習：**
- [簡易 Web 應用 - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本部署模式
- [靜態網站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 靜態內容佈署
- [容器應用 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署

#### 外部範例 - 資料庫整合（第三至四章） 
- [資料庫應用程式 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 資料庫連接模式
- [函數 + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 無伺服器資料工作流程

#### 外部範例 - 進階模式 (第4-8章)
- [Java 微服務](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服務架構
- [容器應用程式工作](https://github.com/Azure-Samples/container-apps-jobs) - 背景處理  
- [企業機器學習管線](https://github.com/Azure-Samples/mlops-v2) - 生產級機器學習模式

### 外部範本集合
- [**官方 AZD 範本館**](https://azure.github.io/awesome-azd/) - 精選官方與社群範本集合
- [**Azure Developer CLI 範本**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - 微軟學習範本文件
- [<strong>範例目錄</strong>](examples/README.md) - 本地學習範例與詳細說明

---

## 📚 學習資源與參考資料

### 快速參考
- [<strong>指令速查表</strong>](resources/cheat-sheet.md) - 依章節分類的主要 azd 指令
- [<strong>術語表</strong>](resources/glossary.md) - Azure 與 azd 術語  
- [<strong>常見問答集</strong>](resources/faq.md) - 按學習章節整理的常見問題
- [<strong>學習指南</strong>](resources/study-guide.md) - 綜合練習題

### 實作工作坊
- [**AI 工作坊實驗室**](docs/chapter-02-ai-development/ai-workshop-lab.md) - 讓你的 AI 解決方案可由 AZD 部署（2-3小時）
- [<strong>互動式工作坊</strong>](workshop/README.md) - 8 模組引導練習，搭配 MkDocs 與 GitHub Codespaces
  - 流程：介紹 → 選擇 → 驗證 → 分解 → 設定 → 自訂 → 拆除 → 總結

### 外部學習資源
- [Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 價格計算器](https://azure.microsoft.com/pricing/calculator/)
- [Azure 狀態](https://status.azure.com/)

### 供您的編輯器使用的 AI Agent 技能
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 個開放式代理技能，支援 Azure AI、Foundry、部署、診斷、成本優化等等。可安裝於 GitHub Copilot、Cursor、Claude Code 或任何支援的代理中：
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 快速故障排除指南

**新手常見問題與即時解決措施：**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

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
<summary><strong>❌ "無法找到訂閱" 或 "未設定訂閱"</strong></summary>

```bash
# 列出可用的訂閱
az account list --output table

# 設定預設訂閱
az account set --subscription "<subscription-id-or-name>"

# 設定為 AZD 環境
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# 驗證
az account show
```
</details>

<details>
<summary><strong>❌ "配額不足" 或 "超過配額"</strong></summary>

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
<summary><strong>❌ "azd up" 執行過程中失敗</strong></summary>

```bash
# 選項 1：清理並重試
azd down --force --purge
azd up

# 選項 2：只修復基礎設施
azd provision

# 選項 3：檢查詳細狀態
azd show

# 選項 4：在 Azure Monitor 中檢查日誌
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "驗證失敗" 或 "權杖過期"</strong></summary>

```bash
# 重新驗證 AZD
azd auth logout
azd auth login

# 選擇性：如果你正在使用 az 命令，亦可刷新 Azure CLI
az logout
az login

# 驗證身份驗證
az account show
```
</details>

<details>
<summary><strong>❌ "資源已存在" 或 命名衝突</strong></summary>

```bash
# AZD 會生成獨特名稱，但如果有衝突：
azd down --force --purge

# 則使用全新環境重試
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 範本部署時間過長</strong></summary>

**正常等待時間：**
- 簡單網站應用程式：5-10 分鐘
- 搭載資料庫的應用程式：10-15 分鐘
- AI 應用程式：15-25 分鐘（OpenAI 配置較慢）

```bash
# 檢查進度
azd show

# 如果停滯超過30分鐘，請檢查 Azure 入口網站：
azd monitor --overview
# 尋找失敗的部署
```
</details>

<details>
<summary><strong>❌ "權限拒絕" 或 "禁止存取"</strong></summary>

```bash
# 檢查您的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 您至少需要「參與者」角色
# 請您的 Azure 管理員授予：
# - 參與者（用於資源）
# - 使用者存取管理員（用於角色指派）
```
</details>

<details>
<summary><strong>❌ 找不到已部署的應用程式網址</strong></summary>

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
- **尋求協助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 課程完成與認證

### 進度追蹤
跟踪你每章的學習進度：

- [ ] **第1章**：基礎與快速入門 ✅
- [ ] **第2章**：以 AI 為先的開發 ✅  
- [ ] **第3章**：設定與認證 ✅
- [ ] **第4章**：基礎設施即程式碼與部署 ✅
- [ ] **第5章**：多代理 AI 解決方案 ✅
- [ ] **第6章**：部署前驗證與規劃 ✅
- [ ] **第7章**：故障排除與除錯 ✅
- [ ] **第8章**：生產級與企業模式 ✅

### 學習驗證
完成每章後，驗證你的知識：
1. <strong>實作練習</strong>：完成該章節的實作部署
2. <strong>知識測試</strong>：查看該章節的常見問題集
3. <strong>社群討論</strong>：在 Azure Discord 分享你的經驗
4. <strong>下一章節</strong>：進入下一層複雜度

### 課程完成效益
完成所有章節後，你將擁有：
- <strong>生產經驗</strong>：實際部署 Azure AI 應用程式
- <strong>專業技能</strong>：具備企業級部署能力  
- <strong>社群認可</strong>：活躍的 Azure 開發者社群成員
- <strong>職涯進展</strong>：搶手的 AZD 與 AI 部署專業知識

---

## 🤝 社群與支援

### 尋求協助與支援
- <strong>技術問題</strong>：[回報錯誤及需求功能](https://github.com/microsoft/azd-for-beginners/issues)
- <strong>學習問題</strong>：[Microsoft Azure Discord 社群](https://discord.gg/microsoft-azure) 和 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 專屬協助**：加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- <strong>文件資源</strong>：[官方 Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord 的社群洞察

**最近 #Azure 頻道投票結果：**
- **45%** 開發者希望使用 AZD 搭配 AI 工作負載
- <strong>主要挑戰</strong>：多服務部署、憑證管理、生產準備  
- <strong>最受歡迎需求</strong>：AI 專用範本、故障排除指南、最佳實務

**加入我們的社群可：**
- 分享你的 AZD + AI 經驗並取得協助
- 取得新 AI 範本的早期預覽
- 參與 AI 部署最佳實務
- 影響未來 AI + AZD 功能開發

### 課程貢獻指南
歡迎提出貢獻！請閱讀我們的 [貢獻指南](CONTRIBUTING.md)，內容涵蓋：
- <strong>內容改進</strong>：強化現有章節與範例
- <strong>新增範例</strong>：增加真實世界情境與範本  
- <strong>翻譯支援</strong>：協助維護多語系支援
- <strong>錯誤回報</strong>：提升內容正確性與清晰度
- <strong>社群標準</strong>：遵守包容性社群規範

---

## 📄 課程資訊

### 授權條款
本專案採用 MIT 授權條款，詳見 [LICENSE](../../LICENSE) 檔案。

### 相關微軟學習資源

我們團隊提供其他完整學習課程：

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j 初學者](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js 初學者](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain 初學者](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / 代理
[![AZD 初學者](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI 初學者](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP 初學者](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI 代理初學者](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### 生成式 AI 系列
[![生成式 AI 初學者](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### 核心學習
[![機器學習初學者](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![入門資料科學](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![入門人工智能](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![入門網絡安全](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![入門網頁開發](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![入門物聯網](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![入門擴增實境開發](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot 系列
[![AI 配對編程 Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot 冒險](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ 課程導航

**🚀 準備好開始學習了嗎？**

<strong>初學者</strong>：從[第一章：基礎與快速入門](#-chapter-1-foundation--quick-start)開始  
**AI 開發者**：直接跳到[第二章：AI 優先開發](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
<strong>有經驗的開發者</strong>：從[第三章：配置與認證](#️-chapter-3-configuration--authentication)開始

<strong>下一步</strong>：[開始第一章 - AZD 基礎](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於精確，但請注意自動翻譯可能包含錯誤或不準確之處。原文文件的母語版本應視為具權威性的來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用此翻譯而產生的任何誤解或誤釋負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->