# AZD 初学者：结构化学习之旅

![AZD 入门](../../translated_images/zh-CN/azdbeginners.5527441dd9f74068.webp) 

[![GitHub 关注者](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub 分叉](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub 星标](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord 社区](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord 社区](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 自动翻译（始终保持最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[阿拉伯语](../ar/README.md) | [孟加拉语](../bn/README.md) | [保加利亚语](../bg/README.md) | [缅甸语（缅甸）](../my/README.md) | [中文（简体）](./README.md) | [中文（繁体，香港）](../zh-HK/README.md) | [中文（繁体，澳门）](../zh-MO/README.md) | [中文（繁体，台湾）](../zh-TW/README.md) | [克罗地亚语](../hr/README.md) | [捷克语](../cs/README.md) | [丹麦语](../da/README.md) | [荷兰语](../nl/README.md) | [爱沙尼亚语](../et/README.md) | [芬兰语](../fi/README.md) | [法语](../fr/README.md) | [德语](../de/README.md) | [希腊语](../el/README.md) | [希伯来语](../he/README.md) | [印地语](../hi/README.md) | [匈牙利语](../hu/README.md) | [印度尼西亚语](../id/README.md) | [意大利语](../it/README.md) | [日语](../ja/README.md) | [卡纳达语](../kn/README.md) | [韩语](../ko/README.md) | [立陶宛语](../lt/README.md) | [马来语](../ms/README.md) | [马拉雅拉姆语](../ml/README.md) | [马拉地语](../mr/README.md) | [尼泊尔语](../ne/README.md) | [尼日利亚皮钦语](../pcm/README.md) | [挪威语](../no/README.md) | [波斯语（法尔西）](../fa/README.md) | [波兰语](../pl/README.md) | [葡萄牙语（巴西）](../pt-BR/README.md) | [葡萄牙语（葡萄牙）](../pt-PT/README.md) | [旁遮普语（Gurmukhi）](../pa/README.md) | [罗马尼亚语](../ro/README.md) | [俄语](../ru/README.md) | [塞尔维亚语（西里尔字母）](../sr/README.md) | [斯洛伐克语](../sk/README.md) | [斯洛文尼亚语](../sl/README.md) | [西班牙语](../es/README.md) | [斯瓦希里语](../sw/README.md) | [瑞典语](../sv/README.md) | [他加禄语（菲律宾）](../tl/README.md) | [泰米尔语](../ta/README.md) | [泰卢固语](../te/README.md) | [泰语](../th/README.md) | [土耳其语](../tr/README.md) | [乌克兰语](../uk/README.md) | [乌尔都语](../ur/README.md) | [越南语](../vi/README.md)

> **是否更喜欢在本地克隆？**
>
> 本仓库包含 50+ 语言的翻译文件，会显著增加下载大小。若要在不下载翻译的情况下克隆，请使用稀疏检出：
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
> 这会为你提供完成课程所需的一切，并大幅加快下载速度。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 什么是 Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** 是一个对开发者友好的命令行工具，使在 Azure 上部署应用变得简单。与其手动创建并连接数十个 Azure 资源，不如通过一个命令部署整个应用。

### `azd up` 的魔法

```bash
# 这个单一命令完成所有操作：
# ✅ 创建所有 Azure 资源
# ✅ 配置网络和安全
# ✅ 构建您的应用程序代码
# ✅ 部署到 Azure
# ✅ 给你一个可用的网址
azd up
```

**就是这样！** 无需在 Azure 门户中反复点击，无需先学习复杂的 ARM 模板，无需手动配置——只需在 Azure 上运行应用。

---

## ❓ Azure Developer CLI 与 Azure CLI：有什么不同？

这是初学者最常问的问题。简单答案如下：

| 功能 | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **目的** | 管理单个 Azure 资源 | 部署完整应用程序 |
| **思维模式** | 以基础设施为中心 | 以应用为中心 |
| **示例** | `az webapp create --name myapp...` | `azd up` |
| **学习曲线** | 需要了解 Azure 服务 | 只需了解你的应用 |
| **适合人群** | DevOps、基础设施 | 开发者、原型开发 |

### 简单比喻

- **Azure CLI** 就像拥有建造房屋的所有工具——锤子、锯子、钉子。你可以建造任何东西，但你需要懂建筑。
- **Azure Developer CLI** 就像聘请承包商——你描述想要的，他们负责建设。

### 何时使用哪一个

| 场景 | 使用建议 |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### 它们可以协同工作！

AZD 在底层使用 Azure CLI。你可以同时使用两者：
```bash
# 使用 AZD 部署您的应用
azd up

# 然后使用 Azure CLI 细化特定资源
az webapp config set --name myapp --always-on true
```

---

## 🌟 在 Awesome AZD 中查找模板

不要从零开始！**Awesome AZD** 是社区收集的可一键部署模板：

| 资源 | 描述 |
|----------|-------------|
| 🔗 [**Awesome AZD 画廊**](https://azure.github.io/awesome-azd/) | 浏览 200+ 模板并一键部署 |
| 🔗 [**提交模板**](https://github.com/Azure/awesome-azd/issues) | 向社区贡献你的模板 |
| 🔗 [**GitHub 仓库**](https://github.com/Azure/awesome-azd) | 收藏并查看源代码 |

### 来自 Awesome AZD 的热门 AI 模板

```bash
# 与 Azure OpenAI 和 AI 搜索的 RAG 聊天
azd init --template azure-search-openai-demo

# 快速 AI 聊天应用
azd init --template openai-chat-app-quickstart

# 使用 Foundry Agents 的 AI 代理
azd init --template get-started-with-ai-agents
```

---

## 🎯 三步快速入门

### 步骤 1：安装 AZD（2 分钟）

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

### 步骤 2：登录到 Azure

```bash
azd auth login
```

### 步骤 3：部署你的第一个应用

```bash
# 从模板初始化
azd init --template todo-nodejs-mongo

# 部署到 Azure（创建所有内容！）
azd up
```

**🎉 就是这样！** 你的应用现在已在 Azure 上运行。

### 清理（别忘了！）

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 如何使用本课程

本课程为**循序渐进的学习**而设计——从你熟悉的部分开始，逐步深入：

| 你的经验 | 从这里开始 |
|-----------------|------------|
| **刚接触 Azure** | [第 1 章：基础](../..) |
| **了解 Azure，但刚接触 AZD** | [第 1 章：基础](../..) |
| **想部署 AI 应用** | [第 2 章：AI 开发](../..) |
| **想要动手实践** | [🎓 互动工作坊](workshop/README.md) - 3-4 小时的引导实验 |
| **需要生产环境模式** | [第 8 章：生产与企业](../..) |

### 快速设置

1. **Fork 这个仓库**: [![GitHub 分叉](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **克隆仓库**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **寻求帮助**: [Azure Discord 社区](https://discord.com/invite/ByRwuEEgH4)

> **是否更喜欢在本地克隆？**
>
> 本仓库包含 50+ 语言的翻译文件，会显著增加下载大小。若要在不下载翻译的情况下克隆，请使用稀疏检出：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 这会为你提供完成课程所需的一切，并大幅加快下载速度。


## 课程概览

通过结构化章节掌握 Azure Developer CLI (azd)，以循序渐进的方式学习。**特别关注与 Microsoft Foundry 集成的 AI 应用部署。**

### 为什么本课程对现代开发者至关重要

基于 Microsoft Foundry Discord 社区的洞察，**45% 的开发者希望将 AZD 用于 AI 工作负载**，但在以下方面遇到挑战：
- 复杂的多服务 AI 架构
- 生产环境 AI 部署最佳实践  
- Azure AI 服务集成与配置
- AI 工作负载的成本优化
- AI 特有的部署问题排查

### 学习目标

完成本课程后，你将：
- **掌握 AZD 基础**：核心概念、安装和配置
- **部署 AI 应用**：将 AZD 与 Microsoft Foundry 服务结合使用
- **实现基础设施即代码**：使用 Bicep 模板管理 Azure 资源
- **排查部署问题**：解决常见问题并进行调试
- **为生产环境优化**：安全、扩展、监控和成本管理
- **构建多代理解决方案**：部署复杂的 AI 架构

## 🗺️ 课程地图：按章节快速导航

每章都有专属的 README，包含学习目标、快速入门和练习：

| 章节 | 主题 | 课程 | 时长 | 复杂度 |
|---------|-------|---------|----------|------------|
| **[第 1 章：基础](docs/chapter-01-foundation/README.md)** | 入门 | [AZD 基础](docs/chapter-01-foundation/azd-basics.md) &#124; [安装](docs/chapter-01-foundation/installation.md) &#124; [第一个项目](docs/chapter-01-foundation/first-project.md) | 30-45 分钟 | ⭐ |
| **[第 2 章：AI 开发](docs/chapter-02-ai-development/README.md)** | 以 AI 为先的应用 | [Foundry 集成](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI 代理](docs/chapter-02-ai-development/agents.md) &#124; [模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [工作坊](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 小时 | ⭐⭐ |
| **[第 3 章：配置](docs/chapter-03-configuration/README.md)** | 认证与安全 | [配置](docs/chapter-03-configuration/configuration.md) &#124; [认证与安全](docs/chapter-03-configuration/authsecurity.md) | 45-60 分钟 | ⭐⭐ |
| **[第4章：基础设施](docs/chapter-04-infrastructure/README.md)** | 基础设施即代码 & 部署 | [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [资源配置](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 小时 | ⭐⭐⭐ |
| **[第5章：多智能体](docs/chapter-05-multi-agent/README.md)** | AI 代理 解决方案 | [零售场景](examples/retail-scenario.md) &#124; [协调模式](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 小时 | ⭐⭐⭐⭐ |
| **[第6章：预部署](docs/chapter-06-pre-deployment/README.md)** | 规划与验证 | [预检流程](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [容量规划](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU 选择](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [应用洞察](docs/chapter-06-pre-deployment/application-insights.md) | 1 小时 | ⭐⭐ |
| **[第7章：故障排除](docs/chapter-07-troubleshooting/README.md)** | 调试与修复 | [常见问题](docs/chapter-07-troubleshooting/common-issues.md) &#124; [调试指南](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI 问题](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 小时 | ⭐⭐ |
| **[第8章：生产](docs/chapter-08-production/README.md)** | 企业模式 | [生产实践](docs/chapter-08-production/production-ai-practices.md) | 2-3 小时 | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | 实操实验室 | [介绍](workshop/docs/instructions/0-Introduction.md) &#124; [选择](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [验证](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [拆解](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [配置](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [定制](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [拆除](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [总结](workshop/docs/instructions/7-Wrap-up.md) | 3-4 小时 | ⭐⭐ |

**总课程时长：** ~10-14 小时 | **技能进阶：** 初级 → 生产就绪

---

## 📚 学习章节

*根据经验水平和目标选择你的学习路径*

### 🚀 第1章：基础与快速入门
**先决条件**: Azure 订阅、基本命令行知识  
**时长**: 30-45 分钟  
**复杂度**: ⭐

#### 你将学到的内容
- 了解 Azure Developer CLI 的基本原理
- 在你的平台上安装 AZD
- 成功完成你的第一次部署

#### 学习资源
- **🎯 从这里开始**: [什么是 Azure Developer CLI？](../..)
- **📖 理论**: [AZD 基础](docs/chapter-01-foundation/azd-basics.md) - 核心概念和术语
- **⚙️ 设置**: [安装与设置](docs/chapter-01-foundation/installation.md) - 平台特定指南
- **🛠️ 实践**: [你的第一个项目](docs/chapter-01-foundation/first-project.md) - 步骤教程
- **📋 快速参考**: [命令速查表](resources/cheat-sheet.md)

#### 实践练习
```bash
# 快速安装检查
azd version

# 部署您的第一个应用程序
azd init --template todo-nodejs-mongo
azd up
```

**💡 章节成果**：使用 AZD 成功将一个简单的 Web 应用部署到 Azure

**✅ 成功验证：**
```bash
# 完成第1章后，你应该能够：
azd version              # 显示已安装的版本
azd init --template todo-nodejs-mongo  # 初始化项目
azd up                  # 部署到 Azure
azd show                # 显示正在运行的应用的 URL
# 应用在浏览器中打开并正常工作
azd down --force --purge  # 清理资源
```

**📊 时间投入：** 30-45 分钟  
**📈 完成后技能水平：** 能独立部署基础应用

**✅ 成功验证：**
```bash
# 完成第1章后，您应该能够：
azd version              # 显示已安装的版本
azd init --template todo-nodejs-mongo  # 初始化项目
azd up                  # 部署到 Azure
azd show                # 显示正在运行的应用程序的 URL
# 应用在浏览器中打开并正常运行
azd down --force --purge  # 清理资源
```

**📊 时间投入：** 30-45 分钟  
**📈 完成后技能水平：** 能独立部署基础应用

---

### 🤖 第2章：以 AI 为先的开发（推荐给 AI 开发者）
**先决条件**: 完成第1章  
**时长**: 1-2 小时  
**复杂度**: ⭐⭐

#### 你将学到的内容
- Microsoft Foundry 与 AZD 的集成
- 部署具备 AI 功能的应用
- 了解 AI 服务配置

#### 学习资源
- **🎯 从这里开始**: [Microsoft Foundry 集成](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI 代理**: [AI 代理指南](docs/chapter-02-ai-development/agents.md) - 使用 AZD 部署智能代理
- **📖 模式**: [AI 模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) - 部署和管理 AI 模型
- **🛠️ 车间**: [AI 实验室](docs/chapter-02-ai-development/ai-workshop-lab.md) - 使你的 AI 解决方案适配 AZD
- **🎥 互动指南**: [车间材料](workshop/README.md) - 基于浏览器的学习，使用 MkDocs * DevContainer Environment
- **📋 模板**: [Microsoft Foundry 模板](../..)
- **📝 示例**: [AZD 部署示例](examples/README.md)

#### 实践练习
```bash
# 部署你的第一个 AI 应用程序
azd init --template azure-search-openai-demo
azd up

# 尝试更多 AI 模板
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 章节成果**：部署并配置具有 RAG 能力的 AI 聊天应用

**✅ 成功验证：**
```bash
# 在第二章之后，你应该能够：
azd init --template azure-search-openai-demo
azd up
# 测试 AI 聊天界面
# 提出问题并获取包含来源的 AI 回答
# 验证搜索集成是否正常工作
azd monitor  # 检查 Application Insights 是否显示遥测数据
azd down --force --purge
```

**📊 时间投入：** 1-2 小时  
**📈 完成后技能水平：** 能部署并配置可投入生产的 AI 应用  
**💰 成本意识：** 了解开发成本约 $80-150/月，生产成本约 $300-3500/月

#### 💰 AI 部署的成本考虑

**开发环境（估计 $80-150/月）：**
- Azure OpenAI（按使用付费）：$0-50/月（基于令牌使用）
- AI Search（基础层）：$75/月
- Container Apps（按消费计费）：$0-20/月
- 存储（标准）：$1-5/月

**生产环境（估计 $300-3,500+/月）：**
- Azure OpenAI（为了稳定性能的 PTU）：$3,000+/月 或 高流量时按使用付费
- AI Search（标准层）：$250/月
- Container Apps（专用）：$50-100/月
- Application Insights：$5-50/月
- 存储（高级）：$10-50/月

**💡 成本优化建议：**
- 学习阶段使用 **免费层** Azure OpenAI（包含 50,000 令牌/月）
- 不开发时运行 `azd down` 来释放资源
- 从按消费计费开始，仅在生产时升级到 PTU
- 使用 `azd provision --preview` 在部署前估算成本
- 启用自动伸缩：仅为实际使用付费

**成本监控：**
```bash
# 检查预估的每月费用
azd provision --preview

# 在 Azure 门户中监控实际费用
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第3章：配置与认证
**先决条件**: 完成第1章  
**时长**: 45-60 分钟  
**复杂度**: ⭐⭐

#### 你将学到的内容
- 环境配置与管理
- 认证与安全最佳实践
- 资源命名与组织

#### 学习资源
- **📖 配置**: [配置指南](docs/chapter-03-configuration/configuration.md) - 环境设置
- **🔐 安全**: [认证模式与托管身份](docs/chapter-03-configuration/authsecurity.md) - 认证模式
- **📝 示例**: [数据库应用示例](examples/database-app/README.md) - AZD 数据库示例

#### 实践练习
- 配置多个环境（dev、staging、prod）
- 设置托管身份认证
- 实现环境特定配置

**💡 章节成果**：管理多个环境并实现恰当的认证与安全

---

### 🏗️ 第4章：基础设施即代码与部署
**先决条件**: 完成第1-3章  
**时长**: 1-1.5 小时  
**复杂度**: ⭐⭐⭐

#### 你将学到的内容
- 高级部署模式
- 使用 Bicep 的基础设施即代码
- 资源供应策略

#### 学习资源
- **📖 部署**: [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) - 完整工作流
- **🏗️ 资源配置**: [资源配置](docs/chapter-04-infrastructure/provisioning.md) - Azure 资源管理
- **📝 示例**: [Container App 示例](../../examples/container-app) - 容器化部署

#### 实践练习
- 创建自定义 Bicep 模板
- 部署多服务应用
- 实现蓝绿部署策略

**💡 章节成果**：使用自定义基础设施模板部署复杂的多服务应用

---

### 🎯 第5章：多智能体 AI 解决方案（高级）
**先决条件**: 完成第1-2章  
**时长**: 2-3 小时  
**复杂度**: ⭐⭐⭐⭐

#### 你将学到的内容
- 多智能体架构模式
- 代理编排与协调
- 可投入生产的 AI 部署

#### 学习资源
- **🤖 精选项目**: [零售多智能体解决方案](examples/retail-scenario.md) - 完整实现
- **🛠️ ARM 模板**: [ARM 模板包](../../examples/retail-multiagent-arm-template) - 一键部署
- **📖 架构**: [多智能体协调模式](docs/chapter-06-pre-deployment/coordination-patterns.md) - 模式

#### 实践练习
```bash
# 部署完整的零售多代理解决方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索代理配置
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 章节成果**：部署并管理具有客户与库存代理的可投入生产的多智能体 AI 解决方案

---

### 🔍 第6章：预部署验证与规划
**先决条件**: 完成第4章  
**时长**: 1 小时  
**复杂度**: ⭐⭐

#### 你将学到的内容
- 容量规划与资源验证
- SKU 选择策略
- 预检流程与自动化

#### 学习资源
- **📊 规划**: [容量规划](docs/chapter-06-pre-deployment/capacity-planning.md) - 资源验证
- **💰 选择**: [SKU 选择](docs/chapter-06-pre-deployment/sku-selection.md) - 成本效益选择
- **✅ 验证**: [预检流程](docs/chapter-06-pre-deployment/preflight-checks.md) - 自动化脚本

#### 实践练习
- 运行容量验证脚本
- 为成本优化选择 SKU
- 实现自动化的预部署检查

**💡 章节成果**：在执行前验证并优化部署

---

### 🚨 第7章：故障排除与调试
**先决条件**: 完成任一部署章节  
**时长**: 1-1.5 小时  
**复杂度**: ⭐⭐

#### 你将学到的内容
- 系统化的调试方法
- 常见问题与解决方案
- 针对 AI 的故障排查

#### 学习资源
- **🔧 常见问题**: [常见问题](docs/chapter-07-troubleshooting/common-issues.md) - 常见问答与解决方案
- **🕵️ 调试**: [调试指南](docs/chapter-07-troubleshooting/debugging.md) - 步骤策略
- **🤖 AI 问题**: [AI 专用故障排查](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI 服务问题

#### 实践练习
- 诊断部署失败
- 解决认证问题
- 调试 AI 服务连接性

**💡 章节成果**：能够独立诊断并解决常见的部署问题

---

### 🏢 第8章：生产与企业模式
**先决条件**: 完成第1-4章  
**时长**: 2-3 小时  
**复杂度**: ⭐⭐⭐⭐

#### 你将学到的内容
- 生产部署策略
- 企业级安全模式
- 监控与成本优化

#### 学习资源
- **🏭 生产**: [生产 AI 最佳实践](docs/chapter-08-production/production-ai-practices.md) - 企业模式
- **📝 示例**: [微服务示例](../../examples/microservices) - 复杂架构
- **📊 监控**: [Application Insights 集成](docs/chapter-06-pre-deployment/application-insights.md) - 监控

#### 实践练习
- 实现企业级安全模式
- 设置全面监控
- 在恰当的治理下部署到生产环境

**💡 章节成果**：部署具备完整生产能力的企业级应用

---

## 🎓 车间概览：实操学习体验

> **⚠️ 车间状态：开发中**
> 研讨会材料目前正在开发和完善中。核心模块可用，但某些高级部分尚未完成。我们正在积极完成所有内容。 [跟踪进度 →](workshop/README.md)

### 互动研讨会材料
**使用基于浏览器的工具和指导练习的综合实践学习**

我们的研讨会材料提供了结构化、互动的学习体验，补充了上面的章节制课程。研讨会既适合自学，也适合讲师主导的课程。

#### 🛠️ 研讨会特色
- **基于浏览器的界面**：完整的 MkDocs 驱动研讨会，具有搜索、复制和主题功能
- **GitHub Codespaces 集成**：一键设置开发环境
- **结构化学习路径**：8 模块引导练习（总计 3-4 小时）
- **渐进式方法论**：介绍 → 选择 → 验证 → 解构 → 配置 → 自定义 → 清理 → 总结
- **交互式 DevContainer 环境**：预配置的工具和依赖项

#### 📚 研讨会模块结构
研讨会遵循一个将你从发现带到部署精通的**8 模块渐进方法论**：

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

**研讨会流程：**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 开始使用研讨会
```bash
# 选项 1：GitHub Codespaces（推荐）
# 在仓库中点击 "Code" → "Create codespace on main"

# 选项 2：本地开发
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 按照 workshop/README.md 中的设置说明进行操作
```

#### 🎯 研讨会学习成果
完成研讨会后，参与者将能够：
- **部署生产级 AI 应用**：使用 AZD 与 Microsoft Foundry 服务
- **掌握多代理架构**：实现协调工作的 AI 代理解决方案
- **实施安全最佳实践**：配置身份验证和访问控制
- **优化以满足扩展需求**：设计具有成本效益且高性能的部署
- **故障排除部署问题**：独立解决常见问题

#### 📖 研讨会资源
- **🎥 互动指南**： [Workshop Materials](workshop/README.md) - 基于浏览器的学习环境
- **📋 模块逐项说明**：
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - 研讨会概览和目标
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - 查找并选择 AI 模板
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - 部署并验证模板
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - 探索模板架构
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - 精通 azure.yaml
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - 根据场景进行自定义
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - 清理资源
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - 回顾与下一步
- **🛠️ AI 研讨会实验室**： [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - 以 AI 为中心的练习
- **💡 快速入门**： [Workshop Setup Guide](workshop/README.md#quick-start) - 环境配置

**适合对象**：企业培训、大学课程、自学和开发者训练营。

---

## 📖 深入解析：AZD 能力

除了基础功能外，AZD 为生产部署提供强大的功能：

- **基于模板的部署** - 使用预构建模板实现常见应用模式
- **基础设施即代码** - 使用 Bicep 或 Terraform 管理 Azure 资源  
- **集成的工作流** - 无缝地配置、部署和监控应用
- **开发者友好** - 优化开发者的生产力和体验

### **AZD + Microsoft Foundry：AI 部署的理想之选**

**为什么选择 AZD 来构建 AI 解决方案？** AZD 解决了 AI 开发者面临的主要挑战：

- **AI 准备就绪的模板** - 为 Azure OpenAI、Cognitive Services 和 ML 工作负载预配置的模板
- **安全的 AI 部署** - 针对 AI 服务、API 密钥和模型端点的内置安全模式  
- **生产级 AI 模式** - 可扩展且具有成本效益的 AI 应用部署最佳实践
- **端到端 AI 工作流** - 从模型开发到生产部署并配有适当的监控
- **成本优化** - 针对 AI 工作负载的智能资源分配和弹性策略
- **Microsoft Foundry 集成** - 与 Microsoft Foundry 模型目录和端点的无缝连接

---

## 🎯 模板与示例库

### 精选：Microsoft Foundry 模板
**如果你要部署 AI 应用，从这里开始！**

> **注意：** 这些模板展示了各种 AI 模式。部分为外部 Azure 示例，其他为本地实现。

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | External |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第2章 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| External |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | External |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | AzureOpenAI + Container Apps + Application Insights | External |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | External |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | External |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **本地** |

### 精选：完整学习场景
**映射到学习章节的生产就绪应用模板**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | 基本 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | 使用 Azure AI Search 的 RAG 实现 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第4章 | ⭐⭐ | 文档智能集成 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | 代理框架与函数调用 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐ | 企业级 AI 编排 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | 包含客户代理和库存代理的多代理架构 |

### 按示例类型学习

> **📌 本地示例 vs. 外部示例：**  
> **本地示例**（在此仓库）= 可立即使用  
> **外部示例**（Azure Samples）= 从链接的仓库克隆

#### 本地示例（可立即使用）
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - 完整的生产就绪实现，带有 ARM 模板
  - 多代理架构（客户代理 + 库存代理）
  - 完整的监控与评估
  - 通过 ARM 模板一键部署

#### 本地示例 - 容器应用（第2-5章）
**本仓库中的综合容器部署示例：**
- [**Container App Examples**](examples/container-app/README.md) - 容器化部署完整指南
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - 带有 scale-to-zero 的基本 REST API
  - [Microservices Architecture](../../examples/container-app/microservices) - 生产就绪的多服务部署
  - 快速入门、生产和高级部署模式
  - 监控、安全和成本优化指南

#### 外部示例 - 简单应用（第1-2章）
**克隆这些 Azure Samples 仓库以开始：**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本部署模式
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 静态内容部署
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署

#### 外部示例 - 数据库集成（第3-4章）  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 数据库连接模式
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 无服务器数据工作流

#### 外部示例 - 高级模式（第4-8章）
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服务架构
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - 后台处理  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - 生产就绪的 ML 模式

### 外部模板集合
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - 精选的官方和社区模板集合
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 的模板文档
- [**Examples Directory**](examples/README.md) - 本地学习示例及详细说明

---

## 📚 学习资源与参考

### 快速参考
- [**命令速查表**](resources/cheat-sheet.md) - 按章节组织的常用 azd 命令
- [**术语表**](resources/glossary.md) - Azure 与 azd 术语  
- [**常见问题**](resources/faq.md) - 按学习章节组织的常见问题
- [**学习指南**](resources/study-guide.md) - 综合练习题

### 实操研讨会
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - 使你的 AI 解决方案可通过 AZD 部署（2-3 小时）
- [**互动研讨会**](workshop/README.md) - 使用 MkDocs 和 GitHub Codespaces 的 8 模块引导练习
  - 流程：介绍 → 选择 → 验证 → 解构 → 配置 → 自定义 → 清理 → 总结

### 外部学习资源
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 快速故障排除指南

**初学者常见问题及即时解决方案：**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# 先安装 AZD
# Windows（PowerShell）：
winget install microsoft.azd

# macOS：
brew tap azure/azd && brew install azd

# Linux：
curl -fsSL https://aka.ms/install-azd.sh | bash

# 验证安装
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# 列出可用订阅
az account list --output table

# 设置默认订阅
az account set --subscription "<subscription-id-or-name>"

# 为 AZD 环境设置
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# 验证
az account show
```
</details>
<details>
<summary><strong>❌ "InsufficientQuota" 或 "Quota exceeded"</strong></summary>

```bash
# 尝试不同的 Azure 区域
azd env set AZURE_LOCATION "westus2"
azd up

# 或在开发环境中使用更小的 SKU
# 编辑 infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" 在中途失败</strong></summary>

```bash
# 选项 1：清理并重试
azd down --force --purge
azd up

# 选项 2：仅修复基础设施
azd provision

# 选项 3：检查详细状态
azd show

# 选项 4：在 Azure Monitor 中检查日志
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" 或 "Token expired"</strong></summary>

```bash
# 重新验证身份
az logout
az login

azd auth logout
azd auth login

# 验证身份
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" 或 命名冲突</strong></summary>

```bash
# AZD 会生成唯一的名称，但如果发生冲突：
azd down --force --purge

# 然后用全新的环境重试
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 模板部署耗时过长</strong></summary>

**正常等待时间：**
- 简单的 Web 应用：5-10 分钟
- 带数据库的应用：10-15 分钟
- AI 应用：15-25 分钟（OpenAI 资源配置较慢）

```bash
# 检查进度
azd show

# 如果卡住超过 30 分钟，请检查 Azure 门户:
azd monitor
# 查找失败的部署
```
</details>

<details>
<summary><strong>❌ "Permission denied" 或 "Forbidden"</strong></summary>

```bash
# 检查您的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 您至少需要 "参与者" 角色
# 请让您的 Azure 管理员授予:
# - 参与者（用于资源）
# - 用户访问管理员（用于角色分配）
```
</details>

<details>
<summary><strong>❌ 无法找到已部署应用的 URL</strong></summary>

```bash
# 显示所有服务端点
azd show

# 或打开 Azure 门户
azd monitor

# 检查特定服务
azd env get-values
# 查找 *_URL 变量
```
</details>

### 📚 完整故障排除资源

- **常见问题指南：** [详细解决方案](docs/chapter-07-troubleshooting/common-issues.md)
- **AI 特定问题：** [AI 故障排除](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **调试指南：** [逐步调试](docs/chapter-07-troubleshooting/debugging.md)
- **获取帮助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 课程完成与证书

### 进度跟踪
通过完成各章跟踪你的学习进度：

- [ ] **第 1 章**：基础与快速入门 ✅
- [ ] **第 2 章**：AI 优先开发 ✅  
- [ ] **第 3 章**：配置与身份验证 ✅
- [ ] **第 4 章**：基础设施即代码与部署 ✅
- [ ] **第 5 章**：多代理 AI 解决方案 ✅
- [ ] **第 6 章**：部署前验证与规划 ✅
- [ ] **第 7 章**：故障排除与调试 ✅
- [ ] **第 8 章**：生产与企业级模式 ✅

### 学习验证
完成每章后，通过以下方式验证你的知识：
1. **实践练习**：完成本章的动手部署
2. **知识检查**：查看本章的 FAQ 部分
3. **社区讨论**：在 Azure Discord 分享你的经验
4. **下一章**：进入下一个难度级别

### 课程完成收益
完成所有章节后，你将获得：
- **生产经验**：将真实的 AI 应用部署到 Azure
- **专业技能**：具备企业级部署能力  
- **社区认可**：成为 Azure 开发者社区的活跃成员
- **职业发展**：掌握市场需求的 AZD 和 AI 部署专长

---

## 🤝 社区与支持

### 获取帮助与支持
- **技术问题**： [报告错误和请求功能](https://github.com/microsoft/azd-for-beginners/issues)
- **学习问题**： [Microsoft Azure Discord 社区](https://discord.gg/microsoft-azure) 和 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 专项帮助**：加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **文档**： [官方 Azure Developer CLI 文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### 来自 Microsoft Foundry Discord 的社区见解

**来自 #Azure 频道的最新投票结果：**
- **45%** 的开发者希望将 AZD 用于 AI 工作负载
- **主要挑战**：多服务部署、凭证管理、生产准备就绪  
- **最常请求**：AI 特定模板、故障排除指南、最佳实践

**加入我们的社区以：**
- 分享你的 AZD + AI 经验并获得帮助
- 获取新 AI 模板的早期预览
- 为 AI 部署最佳实践做出贡献
- 影响未来 AI + AZD 功能的开发

### 为课程做贡献
我们欢迎贡献！请阅读我们的 [贡献指南](CONTRIBUTING.md) 以了解详情：
- **内容改进**：增强现有章节和示例
- **新示例**：添加真实场景和模板  
- **翻译**：协助维护多语言支持
- **错误报告**：提高准确性和清晰度
- **社区标准**：遵循我们的包容性社区准则

---

## 📄 课程信息

### 许可证
本项目根据 MIT 许可证授权 - 详细信息请参阅 [LICENSE](../../LICENSE) 文件。

### 相关的 Microsoft 学习资源

我们的团队还制作了其他综合学习课程：

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j 入门](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js 入门](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain 入门](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD 入门](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI 入门](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP 入门](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI 代理 入门](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### 生成式 AI 系列
[![生成式 AI 入门](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### 核心学习
[![机器学习 入门](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![数据科学 入门](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI 入门](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![网络安全 入门](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web 开发 入门](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![物联网 入门](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR 开发 入门](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot 系列
[![Copilot：AI 配对编程](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot：适用于 C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot 冒险](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ 课程导航

**🚀 准备开始学习了吗？**

**初学者**: 从 [第1章：基础与快速入门](../..)  
**AI 开发者**: 跳至 [第2章：以 AI 为先的开发](../..)  
**有经验的开发者**: 从 [第3章：配置与身份验证](../..)

**下一步**: [开始第1章 - AZD 基础](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免责声明：
本文件已使用 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们努力确保翻译的准确性，但请注意自动翻译可能存在错误或不准确之处。应以原文（原始语言版本）为权威来源。对于关键信息，建议使用专业人工翻译。因使用本翻译而产生的任何误解或曲解，我们概不负责。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->