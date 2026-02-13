# AZD 初學者：結構化學習旅程

![AZD 初學者](../../translated_images/zh-TW/azdbeginners.5527441dd9f74068.webp) 

[![GitHub 追蹤者](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub 分叉](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub 星標](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 自動翻譯（即時更新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[阿拉伯語](../ar/README.md) | [孟加拉語](../bn/README.md) | [保加利亞語](../bg/README.md) | [緬甸語 (Myanmar)](../my/README.md) | [中文（簡體）](../zh-CN/README.md) | [中文（繁體，香港）](../zh-HK/README.md) | [中文（繁體，澳門）](../zh-MO/README.md) | [中文（繁體，台灣）](./README.md) | [克羅埃西亞語](../hr/README.md) | [捷克語](../cs/README.md) | [丹麥語](../da/README.md) | [荷蘭語](../nl/README.md) | [愛沙尼亞語](../et/README.md) | [芬蘭語](../fi/README.md) | [法語](../fr/README.md) | [德語](../de/README.md) | [希臘語](../el/README.md) | [希伯來語](../he/README.md) | [印地語](../hi/README.md) | [匈牙利語](../hu/README.md) | [印尼語](../id/README.md) | [義大利語](../it/README.md) | [日語](../ja/README.md) | [坎納達語](../kn/README.md) | [韓語](../ko/README.md) | [立陶宛語](../lt/README.md) | [馬來語](../ms/README.md) | [馬拉雅拉姆語](../ml/README.md) | [馬拉地語](../mr/README.md) | [尼泊爾語](../ne/README.md) | [奈及利亞洋泣語 (Pidgin)](../pcm/README.md) | [挪威語](../no/README.md) | [波斯語 (法爾西)](../fa/README.md) | [波蘭語](../pl/README.md) | [葡萄牙語（巴西）](../pt-BR/README.md) | [葡萄牙語（葡萄牙）](../pt-PT/README.md) | [旁遮普語 (Gurmukhi)](../pa/README.md) | [羅馬尼亞語](../ro/README.md) | [俄語](../ru/README.md) | [塞爾維亞語（西里爾）](../sr/README.md) | [斯洛伐克語](../sk/README.md) | [斯洛文尼亞語](../sl/README.md) | [西班牙語](../es/README.md) | [斯瓦希里語](../sw/README.md) | [瑞典語](../sv/README.md) | [塔加洛語（菲律賓語）](../tl/README.md) | [泰米爾語](../ta/README.md) | [泰盧固語](../te/README.md) | [泰語](../th/README.md) | [土耳其語](../tr/README.md) | [烏克蘭語](../uk/README.md) | [烏爾都語](../ur/README.md) | [越南語](../vi/README.md)

> **偏好在本機克隆？**

> 本儲存庫包含 50+ 種語言翻譯，會顯著增加下載大小。若要在不包含翻譯的情況下克隆，請使用稀疏檢出：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 這會提供完成課程所需的一切，並且下載速度更快。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 什麼是 Azure Developer CLI (azd)？

**Azure Developer CLI (azd)** 是一款對開發者友好的命令列工具，可讓您輕鬆將應用程式部署到 Azure。與其手動建立並串接數十個 Azure 資源，不如使用單一命令部署整個應用程式。

### `azd up` 的魔力

```bash
# 這個單一指令完成所有工作：
# ✅ 建立所有 Azure 資源
# ✅ 設定網路和安全性
# ✅ 建置您的應用程式程式碼
# ✅ 部署到 Azure
# ✅ 提供您一個可用的網址
azd up
```

**就這樣！** 無需在 Azure 入口網站上點選、無需先學習複雜的 ARM 模板、無需手動設定 —— 只要把可運作的應用程式部署到 Azure。

---

## ❓ Azure Developer CLI 與 Azure CLI：有何不同？

這是初學者最常問的問題。以下是簡單的回答：

| 功能 | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **目的** | 管理單一 Azure 資源 | 部署完整應用程式 |
| **思維模式** | 以基礎架構為主 | 以應用程式為主 |
| **範例** | `az webapp create --name myapp...` | `azd up` |
| **學習曲線** | 需要了解 Azure 服務 | 只需了解你的應用程式 |
| **適合對象** | DevOps、基礎架構團隊 | 開發人員、原型設計 |

### 簡單類比

- **Azure CLI** 就像擁有建造房屋的所有工具 —— 錘子、鋸子、釘子。你可以建造任何東西，但你需要知道建築方法。
- **Azure Developer CLI** 就像聘請承包商 —— 你描述想要的東西，他們處理建造工作。

### 何時使用哪一個

| 情境 | 使用這個 |
|----------|----------|
| 「我想快速部署我的網站應用」 | `azd up` |
| 「我只需要建立一個儲存帳戶」 | `az storage account create` |
| 「我正在建置完整的 AI 應用」 | `azd init --template azure-search-openai-demo` |
| 「我需要除錯特定的 Azure 資源」 | `az resource show` |
| 「我想在數分鐘內完成生產就緒的部署」 | `azd up --environment production` |

### 它們可以一起使用！

AZD 在底層使用 Azure CLI。你可以同時使用兩者：
```bash
# 使用 AZD 部署您的應用程式
azd up

# 然後使用 Azure CLI 微調特定資源
az webapp config set --name myapp --always-on true
```

---

## 🌟 在 Awesome AZD 找到範本

別從頭開始！**Awesome AZD** 是社群彙整的一系列可立即部署的範本：

| 資源 | 描述 |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | 瀏覽 200+ 範本，並可一鍵部署 |
| 🔗 [**提交範本**](https://github.com/Azure/awesome-azd/issues) | 向社群貢獻你的範本 |
| 🔗 [**GitHub 儲存庫**](https://github.com/Azure/awesome-azd) | 按星標並探索原始碼 |

### 來自 Awesome AZD 的熱門 AI 範本

```bash
# 使用 Azure OpenAI 與 AI 搜尋的 RAG 聊天
azd init --template azure-search-openai-demo

# 快速 AI 聊天應用程式
azd init --template openai-chat-app-quickstart

# 使用 Foundry Agents 的 AI 代理
azd init --template get-started-with-ai-agents
```

---

## 🎯 以 3 個步驟開始

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

# 部署到 Azure（建立所有內容！）
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

本課程以**漸進式學習**為設計——從你熟悉的內容開始，逐步提升：

| 你的經驗 | 從此開始 |
|-----------------|------------|
| **剛接觸 Azure** | [第 1 章：基礎](../..) |
| **了解 Azure，但剛接觸 AZD** | [第 1 章：基礎](../..) |
| **想部署 AI 應用程式** | [第 2 章：以 AI 為先的開發](../..) |
| **想要實作練習** | [🎓 互動式工作坊](workshop/README.md) - 3-4 小時的引導實驗 |
| **需要生產環境模式** | [第 8 章：生產與企業](../..) |

### 快速設定

1. **Fork 本儲存庫**: [![GitHub 分叉](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **克隆它**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **尋求協助**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **偏好在本機克隆？**

> 本儲存庫包含 50+ 種語言翻譯，會顯著增加下載大小。若要在不包含翻譯的情況下克隆，請使用稀疏檢出：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 這會提供完成課程所需的一切，並且下載速度更快。


## 課程概覽

透過結構化章節掌握 Azure Developer CLI (azd)，課程設計以漸進式學習為主。**特別關注 AI 應用部署，並與 Microsoft Foundry 整合。**

### 為何本課程對現代開發者至關重要

根據 Microsoft Foundry Discord 社群的見解，**45% 的開發者希望將 AZD 用於 AI 工作負載**，但會遇到以下挑戰：
- 複雜的多服務 AI 架構
- AI 生產部署的最佳實務  
- Azure AI 服務的整合與設定
- AI 工作負載的成本優化
- 排除 AI 特定部署問題

### 學習目標

完成此結構化課程後，你將能夠：
- **精通 AZD 基礎**：核心概念、安裝與設定
- **部署 AI 應用程式**：使用 AZD 與 Microsoft Foundry 服務
- **實作基礎設施即程式碼**：使用 Bicep 範本管理 Azure 資源
- **排除部署問題**：解決常見問題並進行除錯
- **為生產環境優化**：安全性、擴充、監控與成本管理
- **建置多代理解決方案**：部署複雜的 AI 架構

## 🗺️ 課程地圖：依章節快速導覽

每個章節都有專屬的 README，包含學習目標、快速上手與練習題：

| 章節 | 主題 | 課程 | 時間 | 複雜度 |
|---------|-------|---------|----------|------------|
| **[第 1 章：基礎](docs/chapter-01-foundation/README.md)** | 入門 | [AZD 基礎](docs/chapter-01-foundation/azd-basics.md) &#124; [安裝](docs/chapter-01-foundation/installation.md) &#124; [第一個專案](docs/chapter-01-foundation/first-project.md) | 30-45 分鐘 | ⭐ |
| **[第 2 章：AI 開發](docs/chapter-02-ai-development/README.md)** | 以 AI 為先的應用 | [Foundry 整合](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI 代理人](docs/chapter-02-ai-development/agents.md) &#124; [模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [工作坊](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 小時 | ⭐⭐ |
| **[第 3 章：設定](docs/chapter-03-configuration/README.md)** | 驗證與安全 | [設定](docs/chapter-03-configuration/configuration.md) &#124; [驗證與安全](docs/chapter-03-configuration/authsecurity.md) | 45-60 分鐘 | ⭐⭐ |
| **[第 4 章：基礎設施](docs/chapter-04-infrastructure/README.md)** | IaC 與部署 | [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [資源佈建](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 小時 | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI Agent Solutions | [Retail Scenario](examples/retail-scenario.md) &#124; [Coordination Patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | Planning & Validation | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | Debug & Fix | [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | Enterprise Patterns | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Hands-On Lab | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Total Course Duration:** ~10-14 hours | **Skill Progression:** Beginner → Production-Ready

---

## 📚 Learning Chapters

*Select your learning path based on experience level and goals*

### 🚀 Chapter 1: Foundation & Quick Start
**Prerequisites**: Azure subscription, basic command line knowledge  
**Duration**: 30-45 minutes  
**Complexity**: ⭐

#### What You'll Learn
- Understanding Azure Developer CLI fundamentals
- Installing AZD on your platform
- Your first successful deployment

#### Learning Resources
- **🎯 Start Here**: [What is Azure Developer CLI?](../..)
- **📖 Theory**: [AZD Basics](docs/chapter-01-foundation/azd-basics.md) - Core concepts and terminology
- **⚙️ Setup**: [Installation & Setup](docs/chapter-01-foundation/installation.md) - Platform-specific guides
- **🛠️ Hands-On**: [Your First Project](docs/chapter-01-foundation/first-project.md) - Step-by-step tutorial
- **📋 Quick Reference**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Practical Exercises
```bash
# 快速安裝檢查
azd version

# 部署您的第一個應用程式
azd init --template todo-nodejs-mongo
azd up
```

**💡 Chapter Outcome**: Successfully deploy a simple web application to Azure using AZD

**✅ Success Validation:**
```bash
# 完成第 1 章後，您應該能夠：
azd version              # 顯示已安裝的版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署到 Azure
azd show                # 顯示正在執行的應用程式 URL
# 應用程式在瀏覽器中開啟並可正常運作
azd down --force --purge  # 清理資源
```

**📊 Time Investment:** 30-45 minutes  
**📈 Skill Level After:** Can deploy basic applications independently

**✅ Success Validation:**
```bash
# 完成第1章後，你應該能夠：
azd version              # 顯示已安裝的版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                  # 部署到 Azure
azd show                # 顯示正在執行的應用程式網址
# 應用程式在瀏覽器中開啟並能正常運作
azd down --force --purge  # 清理資源
```

**📊 Time Investment:** 30-45 minutes  
**📈 Skill Level After:** Can deploy basic applications independently

---

### 🤖 Chapter 2: AI-First Development (Recommended for AI Developers)
**Prerequisites**: Chapter 1 completed  
**Duration**: 1-2 hours  
**Complexity**: ⭐⭐

#### What You'll Learn
- Microsoft Foundry integration with AZD
- Deploying AI-powered applications
- Understanding AI service configurations

#### Learning Resources
- **🎯 Start Here**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Agents**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - Deploy intelligent agents with AZD
- **📖 Patterns**: [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) - Deploy and manage AI models
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Make your AI solutions AZD-ready
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Browser-based learning with MkDocs * DevContainer Environment
- **📋 Templates**: [Microsoft Foundry Templates](../..)
- **📝 Examples**: [AZD Deployment Examples](examples/README.md)

#### Practical Exercises
```bash
# 部署您的第一個 AI 應用程式
azd init --template azure-search-openai-demo
azd up

# 嘗試其他 AI 範本
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Chapter Outcome**: Deploy and configure an AI-powered chat application with RAG capabilities

**✅ Success Validation:**
```bash
# 在第2章之後，您應該能夠：
azd init --template azure-search-openai-demo
azd up
# 測試 AI 聊天介面
# 提出問題並獲得附帶來源的 AI 回應
# 驗證搜尋整合是否運作
azd monitor  # 檢查 Application Insights 是否顯示遙測資料
azd down --force --purge
```

**📊 Time Investment:** 1-2 hours  
**📈 Skill Level After:** Can deploy and configure production-ready AI applications  
**💰 Cost Awareness:** Understand $80-150/month dev costs, $300-3500/month production costs

#### 💰 Cost Considerations for AI Deployments

**Development Environment (Estimated $80-150/month):**
- Azure OpenAI (Pay-as-you-go): $0-50/month (based on token usage)
- AI Search (Basic tier): $75/month
- Container Apps (Consumption): $0-20/month
- Storage (Standard): $1-5/month

**Production Environment (Estimated $300-3,500+/month):**
- Azure OpenAI (PTU for consistent performance): $3,000+/month OR Pay-as-go with high volume
- AI Search (Standard tier): $250/month
- Container Apps (Dedicated): $50-100/month
- Application Insights: $5-50/month
- Storage (Premium): $10-50/month

**💡 Cost Optimization Tips:**
- Use **Free Tier** Azure OpenAI for learning (50,000 tokens/month included)
- Run `azd down` to deallocate resources when not actively developing
- Start with consumption-based billing, upgrade to PTU only for production
- Use `azd provision --preview` to estimate costs before deployment
- Enable auto-scaling: pay only for actual usage

**Cost Monitoring:**
```bash
# 檢查每月預估費用
azd provision --preview

# 在 Azure 入口網站監控實際費用
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Chapter 3: Configuration & Authentication
**Prerequisites**: Chapter 1 completed  
**Duration**: 45-60 minutes  
**Complexity**: ⭐⭐

#### What You'll Learn
- Environment configuration and management
- Authentication and security best practices
- Resource naming and organization

#### Learning Resources
- **📖 Configuration**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - Environment setup
- **🔐 Security**: [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - Authentication patterns
- **📝 Examples**: [Database App Example](examples/database-app/README.md) - AZD Database Examples

#### Practical Exercises
- Configure multiple environments (dev, staging, prod)
- Set up managed identity authentication
- Implement environment-specific configurations

**💡 Chapter Outcome**: Manage multiple environments with proper authentication and security

---

### 🏗️ Chapter 4: Infrastructure as Code & Deployment
**Prerequisites**: Chapters 1-3 completed  
**Duration**: 1-1.5 hours  
**Complexity**: ⭐⭐⭐

#### What You'll Learn
- Advanced deployment patterns
- Infrastructure as Code with Bicep
- Resource provisioning strategies

#### Learning Resources
- **📖 Deployment**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - Complete workflows
- **🏗️ Provisioning**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Azure resource management
- **📝 Examples**: [Container App Example](../../examples/container-app) - Containerized deployments

#### Practical Exercises
- Create custom Bicep templates
- Deploy multi-service applications
- Implement blue-green deployment strategies

**💡 Chapter Outcome**: Deploy complex multi-service applications using custom infrastructure templates

---

### 🎯 Chapter 5: Multi-Agent AI Solutions (Advanced)
**Prerequisites**: Chapters 1-2 completed  
**Duration**: 2-3 hours  
**Complexity**: ⭐⭐⭐⭐

#### What You'll Learn
- Multi-agent architecture patterns
- Agent orchestration and coordination
- Production-ready AI deployments

#### Learning Resources
- **🤖 Featured Project**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Complete implementation
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - One-click deployment
- **📖 Architecture**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - Patterns

#### Practical Exercises
```bash
# 部署完整的零售多代理解決方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索代理設定
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Chapter Outcome**: Deploy and manage a production-ready multi-agent AI solution with Customer and Inventory agents

---

### 🔍 Chapter 6: Pre-Deployment Validation & Planning
**Prerequisites**: Chapter 4 completed  
**Duration**: 1 hour  
**Complexity**: ⭐⭐

#### What You'll Learn
- Capacity planning and resource validation
- SKU selection strategies
- Pre-flight checks and automation

#### Learning Resources
- **📊 Planning**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Resource validation
- **💰 Selection**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Cost-effective choices
- **✅ Validation**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Automated scripts

#### Practical Exercises
- Run capacity validation scripts
- Optimize SKU selections for cost
- Implement automated pre-deployment checks

**💡 Chapter Outcome**: Validate and optimize deployments before execution

---

### 🚨 Chapter 7: Troubleshooting & Debugging
**Prerequisites**: Any deployment chapter completed  
**Duration**: 1-1.5 hours  
**Complexity**: ⭐⭐

#### What You'll Learn
- Systematic debugging approaches
- Common issues and solutions
- AI-specific troubleshooting

#### Learning Resources
- **🔧 Common Issues**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ and solutions
- **🕵️ Debugging**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Step-by-step strategies
- **🤖 AI Issues**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI service problems

#### Practical Exercises
- Diagnose deployment failures
- Resolve authentication issues
- Debug AI service connectivity

**💡 Chapter Outcome**: Independently diagnose and resolve common deployment issues

---

### 🏢 Chapter 8: Production & Enterprise Patterns
**Prerequisites**: Chapters 1-4 completed  
**Duration**: 2-3 hours  
**Complexity**: ⭐⭐⭐⭐

#### What You'll Learn
- Production deployment strategies
- Enterprise security patterns
- Monitoring and cost optimization

#### Learning Resources
- **🏭 Production**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Enterprise patterns
- **📝 Examples**: [Microservices Example](../../examples/microservices) - Complex architectures
- **📊 Monitoring**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Monitoring

#### Practical Exercises
- Implement enterprise security patterns
- Set up comprehensive monitoring
- Deploy to production with proper governance

**💡 Chapter Outcome**: Deploy enterprise-ready applications with full production capabilities

---

## 🎓 Workshop Overview: Hands-On Learning Experience

> **⚠️ WORKSHOP STATUS: Active Development**  
> The workshop materials are currently being developed and refined. Core modules are functional, but some advanced sections are incomplete. We're actively working to complete all content. [Track progress →](workshop/README.md)

### Interactive Workshop Materials
**Comprehensive hands-on learning with browser-based tools and guided exercises**
Our workshop materials provide a structured, interactive learning experience that complements the chapter-based curriculum above. The workshop is designed for both self-paced learning and instructor-led sessions.

#### 🛠️ 工作坊功能
- **Browser-Based Interface**: Complete MkDocs-powered workshop with search, copy, and theme features
- **GitHub Codespaces Integration**: One-click development environment setup
- **Structured Learning Path**: 8-module guided exercises (3-4 hours total)
- **Progressive Methodology**: Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
- **Interactive DevContainer Environment**: Pre-configured tools and dependencies

#### 📚 工作坊模組結構
The workshop follows an **8-module progressive methodology** that takes you from discovery to deployment mastery:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. 介紹** | Workshop Overview | 了解學習目標、先決條件與工作坊結構 | 15 分鐘 |
| **1. 選擇** | Template Discovery | 探索 AZD 範本並為您的情境選擇合適的 AI 範本 | 20 分鐘 |
| **2. 驗證** | Deploy & Verify | 使用 `azd up` 部署範本並驗證基礎設施運作 | 30 分鐘 |
| **3. 解構** | Understand Structure | 使用 GitHub Copilot 探索範本架構、Bicep 檔案與程式碼組織 | 30 分鐘 |
| **4. 設定** | azure.yaml Deep Dive | 熟練 `azure.yaml` 設定、生命週期掛鉤與環境變數 | 30 分鐘 |
| **5. 客製化** | Make It Yours | 啟用 AI Search、追蹤、評估，並針對您的情境進行客製化 | 45 分鐘 |
| **6. 清理** | Clean Up | 使用 `azd down --purge` 安全地解除部署資源 | 15 分鐘 |
| **7. 總結** | Next Steps | 回顧成就、關鍵概念，並持續您的學習旅程 | 15 分鐘 |

**Workshop Flow:**
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
# 在儲存庫中點擊「Code」→「Create codespace on main」

# 選項 2：本機開發
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 請遵照 workshop/README.md 中的設定說明
```

#### 🎯 工作坊學習成果
By completing the workshop, participants will:
- **部署生產等級的 AI 應用**: Use AZD with Microsoft Foundry services
- **精通多代理架構**: Implement coordinated AI agent solutions
- **實施安全最佳實務**: Configure authentication and access control
- **為擴展優化**: Design cost-effective, performant deployments
- **排解部署問題**: Resolve common issues independently

#### 📖 工作坊資源
- **🎥 互動式指南**: [工作坊教材](workshop/README.md) - 瀏覽器為基礎的學習環境
- **📋 模組逐一說明**:
  - [0. 介紹](workshop/docs/instructions/0-Introduction.md) - 工作坊概述與目標
  - [1. 選擇](workshop/docs/instructions/1-Select-AI-Template.md) - 尋找並選擇 AI 範本
  - [2. 驗證](workshop/docs/instructions/2-Validate-AI-Template.md) - 部署並驗證範本
  - [3. 解構](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - 探索範本架構
  - [4. 設定](workshop/docs/instructions/4-Configure-AI-Template.md) - 精通 azure.yaml
  - [5. 客製化](workshop/docs/instructions/5-Customize-AI-Template.md) - 針對您的情境進行客製化
  - [6. 清理](workshop/docs/instructions/6-Teardown-Infrastructure.md) - 清理資源
  - [7. 總結](workshop/docs/instructions/7-Wrap-up.md) - 回顧與後續步驟
- **🛠️ AI 工作坊實驗室**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - 以 AI 為重點的練習
- **💡 快速開始**: [工作坊設定指南](workshop/README.md#quick-start) - 環境設定

**Perfect for**: Corporate training, university courses, self-paced learning, and developer bootcamps.

---

## 📖 深入探討：AZD 功能

Beyond the basics, AZD provides powerful features for production deployments:

- **Template-based deployments** - Use pre-built templates for common application patterns
- **Infrastructure as Code** - Manage Azure resources using Bicep or Terraform  
- **Integrated workflows** - Seamlessly provision, deploy, and monitor applications
- **Developer-friendly** - Optimized for developer productivity and experience

### **AZD + Microsoft Foundry：AI 部署的完美選擇**

**為什麼選擇 AZD 作為 AI 解決方案？** AZD 解決了 AI 開發者面臨的主要挑戰：

- **AI-Ready Templates** - Pre-configured templates for Azure OpenAI, Cognitive Services, and ML workloads
- **Secure AI Deployments** - Built-in security patterns for AI services, API keys, and model endpoints  
- **Production AI Patterns** - Best practices for scalable, cost-effective AI application deployments
- **End-to-End AI Workflows** - From model development to production deployment with proper monitoring
- **Cost Optimization** - Smart resource allocation and scaling strategies for AI workloads
- **Microsoft Foundry Integration** - Seamless connection to Microsoft Foundry model catalog and endpoints

---

## 🎯 範本與範例庫

### 精選：Microsoft Foundry 範本
**如果您要部署 AI 應用，從這裡開始！**

> **注意：** 這些範本示範各種 AI 範式。有些來自外部 Azure Samples，其他則為本地實作。

| 範本 | 章節 | 複雜度 | 服務 | 類型 |
|----------|---------|------------|----------|------|
| [**開始使用 AI 聊天**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第 2 章 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | 外部 |
| [**開始使用 AI 代理**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第 2 章 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| 外部 |
| [**Azure Search + OpenAI 範例**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第 2 章 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | 外部 |
| [**OpenAI 聊天應用 快速入門**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第 2 章 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第 5 章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso 聊天 RAG**](https://github.com/Azure-Samples/contoso-chat) | 第 8 章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | 外部 |
| [**零售多代理解決方案**](examples/retail-scenario.md) | 第 5 章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **本地** |

### 精選：完整學習情境
**對應學習章節的生產就緒應用程式範本**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | Basic AI deployment patterns |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | RAG implementation with Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapter 4 | ⭐⭐ | Document Intelligence integration |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | Agent framework and function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐ | Enterprise AI orchestration |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | Multi-agent architecture with Customer and Inventory agents |

### 以範例類型學習

> **📌 本地範例 vs. 外部範例：**  
> **本地範例**（在此 repo 中）= 可立即使用  
> **外部範例**（Azure Samples）= 從連結的倉儲複製

#### 本地範例（可立即使用）
- [**零售多代理解決方案**](examples/retail-scenario.md) - 完整的生產就緒實作，含 ARM 範本
  - 多代理架構（客戶 + 庫存 代理）
  - 完整的監控與評估
  - 透過 ARM 範本一鍵部署

#### 本地範例 - 容器應用（第 2-5 章）
**本倉儲中的完整容器部署範例：**
- [**容器應用範例**](examples/container-app/README.md) - 容器化部署完整指南
  - [簡單 Flask API](../../examples/container-app/simple-flask-api) - 基本 REST API，支援 scale-to-zero
  - [微服務架構](../../examples/container-app/microservices) - 生產就緒的多服務部署
  - Quick Start, Production, and Advanced deployment patterns
  - Monitoring, security, and cost optimization guidance

#### 外部範例 - 簡單應用（第 1-2 章）
**複製這些 Azure Samples 倉儲以開始：**
- [簡單 Web 應用 - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Basic deployment patterns
- [靜態網站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Static content deployment
- [容器應用 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API deployment

#### 外部範例 - 資料庫整合（第 3-4 章）  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Database connectivity patterns
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless data workflow

#### 外部範例 - 進階範式（第 4-8 章）
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-service architectures
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Background processing  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Production-ready ML patterns

### External Template Collections
- [**官方 AZD 範本畫廊**](https://azure.github.io/awesome-azd/) - 精選官方與社群範本集合
- [**Azure Developer CLI 範本**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn template documentation
- [**Examples Directory**](examples/README.md) - Local learning examples with detailed explanations

---

## 📚 學習資源與參考

### 快速參考
- [**指令速查表**](resources/cheat-sheet.md) - 按章節整理的必要 azd 指令
- [**術語表**](resources/glossary.md) - Azure 與 azd 術語  
- [**常見問答 (FAQ)**](resources/faq.md) - 按學習章節整理的常見問題
- [**學習指南**](resources/study-guide.md) - 全面的實作練習

### 實作工作坊
- [**AI 工作坊實驗室**](docs/chapter-02-ai-development/ai-workshop-lab.md) - 讓您的 AI 解決方案能以 AZD 部署（2-3 小時）
- [**互動式工作坊**](workshop/README.md) - 8-module guided exercises with MkDocs and GitHub Codespaces
  - 流程：介紹 → 選擇 → 驗證 → 解構 → 設定 → 客製化 → 清理 → 總結

### 外部學習資源
- [Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 價格計算機](https://azure.microsoft.com/pricing/calculator/)
- [Azure 狀態](https://status.azure.com/)

---

## 🔧 快速排解指南

**初學者常見問題與即時解決方案：**

<details>
<summary><strong>❌ 「azd：找不到指令」</strong></summary>

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
<summary><strong>❌ 「找不到訂閱」或「未設定訂閱」</strong></summary>

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
<summary><strong>❌ 「配額不足」或「配額已超過」</strong></summary>

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
<summary><strong>❌ 「azd up」在執行過程中中途失敗</strong></summary>
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
<summary><strong>❌ "驗證失敗" 或 "Token 過期"</strong></summary>

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
<summary><strong>❌ "資源已存在" 或 命名衝突</strong></summary>

```bash
# AZD 會產生唯一的名稱，但若發生衝突：
azd down --force --purge

# 然後以新的環境重試
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 範本部署花費太久</strong></summary>

**正常等待時間：**
- 簡單的網頁應用程式: 5-10 分鐘
- 有資料庫的應用程式: 10-15 分鐘
- AI 應用程式: 15-25 分鐘 (OpenAI 佈建較慢)

```bash
# 檢查進度
azd show

# 如果卡住超過 30 分鐘，請檢查 Azure 入口網站：
azd monitor
# 尋找失敗的部署
```
</details>

<details>
<summary><strong>❌ "權限被拒" 或 "Forbidden"</strong></summary>

```bash
# 檢查您的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 您至少需要「參與者」角色
# 請向您的 Azure 管理員要求授予：
# - 參與者（用於資源）
# - 使用者存取管理員（用於角色指派）
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

### 📚 完整的故障排除資源

- **常見問題指南：** [詳細解決方案](docs/chapter-07-troubleshooting/common-issues.md)
- **AI 特定問題：** [AI 疑難排解](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **除錯指南：** [逐步除錯](docs/chapter-07-troubleshooting/debugging.md)
- **取得協助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 課程完成與認證

### 進度追蹤
追蹤您在每章的學習進度：

- [ ] **第 1 章**: 基礎與快速上手 ✅
- [ ] **第 2 章**: AI 優先開發 ✅  
- [ ] **第 3 章**: 設定與驗證 ✅
- [ ] **第 4 章**: 基礎設施即程式碼與部署 ✅
- [ ] **第 5 章**: 多代理 AI 解決方案 ✅
- [ ] **第 6 章**: 部署前驗證與規劃 ✅
- [ ] **第 7 章**: 故障排除與除錯 ✅
- [ ] **第 8 章**: 生產環境與企業範式 ✅

### 學習驗證
完成每章後，透過以下方式驗證您的知識：
1. **實作練習**：完成該章的實務部署
2. **知識檢核**：查看該章的常見問答部分
3. **社群討論**：在 Azure Discord 分享您的經驗
4. **下一章**：進入下一個難度層級

### 課程完成的好處
完成所有章節後，您將具備：
- **實務經驗**：在 Azure 部署實際的 AI 應用程式
- **專業技能**：具備企業級的部署能力  
- **社群認可**：成為 Azure 開發者社群的活躍成員
- **職涯進展**：具備需求量高的 AZD 及 AI 部署專業知識

---

## 🤝 社群與支援

### 取得協助與支援
- **技術問題**： [回報錯誤與功能需求](https://github.com/microsoft/azd-for-beginners/issues)
- **學習問題**： [Microsoft Azure Discord 社群](https://discord.gg/microsoft-azure) 以及 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 專屬協助**：加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **文件**： [官方 Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### 來自 Microsoft Foundry Discord 的社群見解

**來自 #Azure 頻道 的最新投票結果：**
- **45%** 的開發者想要使用 AZD 來處理 AI 工作負載
- **主要挑戰**：多服務部署、憑證管理、產線準備度  
- **最常被要求的資源**：AI 專用範本、疑難排解指南、最佳實務

**加入我們的社群來：**
- 分享您的 AZD + AI 經驗並取得協助
- 取得新 AI 範本的搶先預覽
- 為 AI 部署最佳實務做出貢獻
- 影響未來 AI + AZD 功能的開發

### 為課程做出貢獻
歡迎您進行貢獻！請閱讀我們的 [貢獻指南](CONTRIBUTING.md) 以了解詳細資訊：
- **內容改進**：強化現有章節與範例
- **新增範例**：加入真實世界情境與範本  
- **翻譯**：協助維護多語系支援
- **錯誤回報**：改進正確性與清晰度
- **社群準則**：遵循我們具包容性的社群準則

---

## 📄 課程資訊

### 授權
本專案採用 MIT 授權 - 詳情請見 [LICENSE](../../LICENSE) 檔案。

### 微軟相關學習資源

Our team produces other comprehensive learning courses:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j 新手入門](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js 新手入門](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain 新手入門](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD 新手入門](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI 新手入門](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP 新手入門](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents 新手入門](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### 生成式 AI 系列
[![生成式 AI 新手入門](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (.NET) 新手入門](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (Java) 新手入門](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (JavaScript) 新手入門](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### 核心學習
[![機器學習 新手入門](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![資料科學 新手入門](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI 新手入門](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![網路安全 新手入門](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![網頁開發 新手入門](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT 新手入門](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR 開發 新手入門](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot 系列
[![Copilot 用於 AI 配對程式設計](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot 用於 C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot 冒險](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ 課程導覽

**🚀 準備好開始學習了嗎？**

**新手**：從 [第 1 章：基礎與快速上手](../..)
**AI 開發者**: 前往 [第 2 章: 以 AI 為先的開發](../..)  
**資深開發者**: 從 [第 3 章: 設定與驗證](../..) 開始

**下一步**: [開始第 1 章 - AZD 基礎](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的原文應視為權威來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用此翻譯而產生的任何誤解或錯誤詮釋負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->