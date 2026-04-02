# AZD 入门：结构化学习之旅

![AZD 入门](../../translated_images/zh-CN/azdbeginners.5527441dd9f74068.webp) 

[![GitHub 关注者](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub 分叉](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub 星标](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 自动翻译（始终保持最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[阿拉伯语](../ar/README.md) | [孟加拉语](../bn/README.md) | [保加利亚语](../bg/README.md) | [缅甸语（缅甸）](../my/README.md) | [中文（简体）](./README.md) | [中文（繁体，香港）](../zh-HK/README.md) | [中文（繁体，澳门）](../zh-MO/README.md) | [中文（繁体，台湾）](../zh-TW/README.md) | [克罗地亚语](../hr/README.md) | [捷克语](../cs/README.md) | [丹麦语](../da/README.md) | [荷兰语](../nl/README.md) | [爱沙尼亚语](../et/README.md) | [芬兰语](../fi/README.md) | [法语](../fr/README.md) | [德语](../de/README.md) | [希腊语](../el/README.md) | [希伯来语](../he/README.md) | [印地语](../hi/README.md) | [匈牙利语](../hu/README.md) | [印尼语](../id/README.md) | [意大利语](../it/README.md) | [日语](../ja/README.md) | [卡纳达语](../kn/README.md) | [高棉语](../km/README.md) | [韩语](../ko/README.md) | [立陶宛语](../lt/README.md) | [马来语](../ms/README.md) | [马拉雅拉姆语](../ml/README.md) | [马拉地语](../mr/README.md) | [尼泊尔语](../ne/README.md) | [尼日利亚皮钦语](../pcm/README.md) | [挪威语](../no/README.md) | [波斯语（Farsi）](../fa/README.md) | [波兰语](../pl/README.md) | [葡萄牙语（巴西）](../pt-BR/README.md) | [葡萄牙语（葡萄牙）](../pt-PT/README.md) | [旁遮普语（古尔穆奇）](../pa/README.md) | [罗马尼亚语](../ro/README.md) | [俄语](../ru/README.md) | [塞尔维亚语（西里尔字母）](../sr/README.md) | [斯洛伐克语](../sk/README.md) | [斯洛文尼亚语](../sl/README.md) | [西班牙语](../es/README.md) | [斯瓦希里语](../sw/README.md) | [瑞典语](../sv/README.md) | [塔加洛语（菲律宾语）](../tl/README.md) | [泰米尔语](../ta/README.md) | [泰卢固语](../te/README.md) | [泰语](../th/README.md) | [土耳其语](../tr/README.md) | [乌克兰语](../uk/README.md) | [乌尔都语](../ur/README.md) | [越南语](../vi/README.md)

> **更喜欢在本地克隆？**
>
> 本仓库包含 50 多种语言的翻译，显著增加了下载大小。要在不下载翻译文件的情况下克隆，请使用稀疏检出：
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
> 这将为你提供完成课程所需的一切，同时下载速度更快。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 azd 今日更新

Azure Developer CLI 已从传统的 Web 应用和 API 扩展。如今，azd 是将任何应用部署到 Azure 的单一工具——包括由 AI 驱动的应用和智能代理。

这对你意味着：

- **AI 代理现在是 azd 的一等工作负载。** 你可以使用熟悉的 `azd init` → `azd up` 工作流来初始化、部署和管理 AI 代理项目。
- **Microsoft Foundry 集成** 将模型部署、代理托管和 AI 服务配置直接引入 azd 模板生态系统。
- **核心工作流没有改变。** 无论你是在部署待办事项应用、微服务，还是多代理 AI 解决方案，命令都是相同的。

如果你以前使用过 azd，AI 支持只是自然的扩展——不是一个独立工具或高级路径。如果你刚开始，你将学会一个适用于所有场景的工作流。

---

## 🚀 什么是 Azure Developer CLI（azd）？

**Azure Developer CLI（azd）** 是一个面向开发者的命令行工具，让在 Azure 上部署应用变得简单。与其手动创建并连接数十个 Azure 资源，不如用一条命令部署整个应用。

### `azd up` 的魔力

```bash
# 这条命令完成所有操作：
# ✅ 创建所有 Azure 资源
# ✅ 配置网络和安全
# ✅ 构建您的应用代码
# ✅ 部署到 Azure
# ✅ 提供可用的 URL
azd up
```

**就这样！** 无需点击 Azure 门户，无需先学习复杂的 ARM 模板，无需手动配置——只是可在 Azure 上运行的应用。

---

## ❓ Azure Developer CLI 与 Azure CLI：有什么区别？

这是初学者最常问的问题。简单回答如下：

| 功能 | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| <strong>目的</strong> | 管理单个 Azure 资源 | 部署完整应用 |
| <strong>思维模式</strong> | 以基础设施为中心 | 以应用为中心 |
| <strong>示例</strong> | `az webapp create --name myapp...` | `azd up` |
| <strong>学习曲线</strong> | 需要了解 Azure 服务 | 只需了解你的应用 |
| <strong>适合对象</strong> | DevOps、基础设施 | 开发人员、原型设计 |

### 简单类比

- **Azure CLI** 就像拥有建房的所有工具——锤子、锯子、钉子。你可以建任何东西，但需要懂施工。
- **Azure Developer CLI** 就像雇了一个承包商——你描述想要的，他们负责建造。

### 何时使用哪个

| 场景 | 使用建议 |
|----------|----------|
| "我想快速部署我的 Web 应用" | `azd up` |
| "我只需要创建一个存储账户" | `az storage account create` |
| "我正在构建完整的 AI 应用" | `azd init --template azure-search-openai-demo` |
| "我需要调试某个特定的 Azure 资源" | `az resource show` |
| "我想在几分钟内实现生产就绪的部署" | `azd up --environment production` |

### 它们可以配合使用！

AZD 在底层使用 Azure CLI。你可以同时使用二者：
```bash
# 使用 AZD 部署您的应用
azd up

# 然后使用 Azure CLI 微调特定资源
az webapp config set --name myapp --always-on true
```

---

## 🌟 在 Awesome AZD 中查找模板

不要从头开始！**Awesome AZD** 是社区收集的可立即部署模板集合：

| 资源 | 描述 |
|----------|-------------|
| 🔗 [**Awesome AZD 画廊**](https://azure.github.io/awesome-azd/) | 浏览 200+ 模板并一键部署 |
| 🔗 [<strong>提交模板</strong>](https://github.com/Azure/awesome-azd/issues) | 向社区贡献你的模板 |
| 🔗 [**GitHub 仓库**](https://github.com/Azure/awesome-azd) | 给仓库加星并查看源码 |

### Awesome AZD 的热门 AI 模板

```bash
# 使用 Microsoft Foundry 模型和 AI 搜索的 RAG 聊天
azd init --template azure-search-openai-demo

# 快速 AI 聊天应用程序
azd init --template openai-chat-app-quickstart

# 使用 Foundry Agent 的 AI 代理
azd init --template get-started-with-ai-agents
```

---

## 🎯 三步快速开始

在开始之前，请确保你的机器已为你想要部署的模板做好准备：

**Windows：**
```powershell
.\validate-setup.ps1
```

**macOS / Linux：**
```bash
bash ./validate-setup.sh
```

如果任何必需的检查未通过，请先修复，然后继续快速开始。

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

### 步骤 2：为 AZD 进行身份验证

```bash
# 如果您计划直接在本课程中使用 Azure CLI 命令，则此项为可选
az login

# AZD 工作流程所必需
azd auth login
```

如果你不确定需要哪一种，请参照[安装与设置](docs/chapter-01-foundation/installation.md#authentication-setup)中的完整设置流程。

### 步骤 3：部署你的第一个应用

```bash
# 从模板初始化
azd init --template todo-nodejs-mongo

# 部署到 Azure（创建所有内容！）
azd up
```

**🎉 完成！** 你的应用现在已在 Azure 上运行。

### 清理（别忘了！）

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 如何使用本课程

本课程为<strong>渐进式学习</strong>而设计——从你熟悉的地方开始，逐步深入：

| 你的经验 | 从这里开始 |
|-----------------|------------|
| **刚接触 Azure** | [第 1 章：基础](#-chapter-1-foundation--quick-start) |
| **了解 Azure，但不熟悉 AZD** | [第 1 章：基础](#-chapter-1-foundation--quick-start) |
| **想部署 AI 应用** | [第 2 章：AI 优先开发](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| <strong>想要动手练习</strong> | [🎓 互动研讨会](workshop/README.md) - 3-4 小时的引导实验 |
| <strong>需要生产级模式</strong> | [第 8 章：生产与企业](#-chapter-8-production--enterprise-patterns) |

### 快速设置

1. **Fork 本仓库**： [![GitHub 分叉](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. <strong>克隆仓库</strong>： `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. <strong>寻求帮助</strong>： [Azure Discord 社区](https://discord.com/invite/ByRwuEEgH4)

> **更喜欢在本地克隆？**
>
> 本仓库包含 50 多种语言的翻译，显著增加了下载大小。要在不下载翻译文件的情况下克隆，请使用稀疏检出：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 这将为你提供完成课程所需的一切，同时下载速度更快。


## 课程概览

通过为渐进式学习设计的结构化章节掌握 Azure Developer CLI（azd）。**特别关注与 Microsoft Foundry 集成的 AI 应用部署。**

### 为什么本课程对现代开发者至关重要

基于 Microsoft Foundry Discord 社区的洞察，**45% 的开发者希望将 AZD 用于 AI 工作负载**，但在以下方面遇到挑战：
- 复杂的多服务 AI 架构
- AI 上线部署的最佳实践  
- Azure AI 服务的集成与配置
- AI 工作负载的成本优化
- 诊断 AI 特定部署问题

### 学习目标

完成本结构化课程后，你将：
- **掌握 AZD 基础**：核心概念、安装与配置
- **部署 AI 应用**：将 AZD 与 Microsoft Foundry 服务结合使用
- <strong>实现基础设施即代码</strong>：使用 Bicep 模板管理 Azure 资源
- <strong>排查部署问题</strong>：解决常见问题并进行调试
- <strong>优化生产环境</strong>：安全、扩展、监控与成本管理
- <strong>构建多代理解决方案</strong>：部署复杂的 AI 架构

## 在开始之前：账户、访问权限及假设

在开始第 1 章之前，请确保你已具备以下条件。本指南后续的安装步骤假定这些基础已被处理。
- **一个 Azure 订阅**: 您可以使用现有的工作订阅或您自己的帐户，或创建一个 [免费试用](https://aka.ms/azurefreetrial) 来开始。
- **创建 Azure 资源的权限**: 对于大多数练习，您应该至少在目标订阅或资源组上拥有 **Contributor** 访问权限。某些章节也可能假定您可以创建资源组、托管标识和 RBAC 分配。
- [**GitHub 帐户**](https://github.com): 这对于分叉仓库、跟踪您自己的更改以及在研讨会中使用 GitHub Codespaces 很有用。
- <strong>模板运行时先决条件</strong>: 某些模板需要本地工具，例如 Node.js、Python、Java 或 Docker。开始之前运行设置验证器，以便及早发现缺失的工具。
- <strong>基本终端使用熟悉度</strong>: 您不需要成为专家，但应熟悉运行诸如 `git clone`, `azd auth login`, 和 `azd up` 等命令。

> **在企业订阅中工作？**
> 如果您的 Azure 环境由管理员管理，请提前确认您是否可以在计划使用的订阅或资源组中部署资源。如果不能，请在开始之前申请沙箱订阅或 Contributor 访问权限。

> **刚接触 Azure？**
> 从您自己的 Azure 试用或按使用付费订阅开始 https://aka.ms/azurefreetrial，这样您就可以在不等待租户级审批的情况下完成端到端的练习。

## 🗺️ 课程地图：按章节快速导航

每章都有专门的 README，包含学习目标、快速入门和练习：

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[第1章：基础](docs/chapter-01-foundation/README.md)** | 入门 | [AZD 基础](docs/chapter-01-foundation/azd-basics.md) &#124; [安装](docs/chapter-01-foundation/installation.md) &#124; [第一个项目](docs/chapter-01-foundation/first-project.md) | 30-45 分钟 | ⭐ |
| **[第2章：以 AI 为先的开发](docs/chapter-02-ai-development/README.md)** | 以 AI 为先的应用 | [Foundry 集成](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [AI 模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [研讨会](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 小时 | ⭐⭐ |
| **[第3章：配置](docs/chapter-03-configuration/README.md)** | 身份验证与安全 | [配置](docs/chapter-03-configuration/configuration.md) &#124; [身份验证与安全](docs/chapter-03-configuration/authsecurity.md) | 45-60 分钟 | ⭐⭐ |
| **[第4章：基础设施](docs/chapter-04-infrastructure/README.md)** | IaC 与部署 | [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [预配](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 小时 | ⭐⭐⭐ |
| **[第5章：多代理](docs/chapter-05-multi-agent/README.md)** | AI 代理解决方案 | [零售场景](examples/retail-scenario.md) &#124; [协调模式](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 小时 | ⭐⭐⭐⭐ |
| **[第6章：预部署](docs/chapter-06-pre-deployment/README.md)** | 规划与验证 | [预检检查](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [容量规划](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU 选择](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [应用洞察](docs/chapter-06-pre-deployment/application-insights.md) | 1 小时 | ⭐⭐ |
| **[第7章：故障排查](docs/chapter-07-troubleshooting/README.md)** | 调试与修复 | [常见问题](docs/chapter-07-troubleshooting/common-issues.md) &#124; [调试](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI 问题](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 小时 | ⭐⭐ |
| **[第8章：生产](docs/chapter-08-production/README.md)** | 企业模式 | [生产实践](docs/chapter-08-production/production-ai-practices.md) | 2-3 小时 | ⭐⭐⭐⭐ |
| **[🎓 研讨会](workshop/README.md)** | 实践实验室 | [介绍](workshop/docs/instructions/0-Introduction.md) &#124; [选择 AI 模板](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [验证 AI 模板](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [拆解 AI 模板](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [配置 AI 模板](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [自定义 AI 模板](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [拆除基础设施](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [总结](workshop/docs/instructions/7-Wrap-up.md) | 3-4 小时 | ⭐⭐ |

**总课程时长：** ~10-14 小时 | **技能进阶：** 初学者 → 生产就绪

---

## 📚 学习章节

<em>根据经验水平和目标选择您的学习路径</em>

### 🚀 第1章：基础与快速入门
<strong>先决条件</strong>：Azure 订阅，基本命令行知识  
<strong>时长</strong>：30-45 分钟  
<strong>复杂度</strong>：⭐

#### 您将学到的内容
- 了解 Azure Developer CLI 的基础知识
- 在您的平台上安装 AZD
- 您的首次成功部署

#### 学习资源
- **🎯 开始于此**: [什么是 Azure Developer CLI？](#what-is-azure-developer-cli)
- **📖 理论**: [AZD 基础](docs/chapter-01-foundation/azd-basics.md) - 核心概念与术语
- **⚙️ 设置**: [安装与设置](docs/chapter-01-foundation/installation.md) - 平台特定指南
- **🛠️ 实操**: [您的第一个项目](docs/chapter-01-foundation/first-project.md) - 逐步教程
- **📋 快速参考**: [命令备忘单](resources/cheat-sheet.md)

#### 实践练习
```bash
# 快速安装检查
azd version

# 部署你的第一个应用程序
azd init --template todo-nodejs-mongo
azd up
```

**💡 章节成果**：使用 AZD 成功将一个简单的 Web 应用部署到 Azure

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
**📈 完成后技能水平：** 能够独立部署基本应用
**📈 完成后技能水平：** 能够独立部署基本应用

---

### 🤖 第2章：以 AI 为先的开发（建议 AI 开发者）
<strong>先决条件</strong>：完成第1章  
<strong>时长</strong>：1-2 小时  
<strong>复杂度</strong>：⭐⭐

#### 您将学到的内容
- Microsoft Foundry 与 AZD 的集成
- 部署 AI 驱动的应用
- 理解 AI 服务配置

#### 学习资源
- **🎯 开始于此**: [Microsoft Foundry 集成](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI 代理**: [AI Agents 指南](docs/chapter-02-ai-development/agents.md) - 使用 AZD 部署智能代理
- **📖 模式**: [AI 模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) - 部署和管理 AI 模型
- **🛠️ 研讨会**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - 使您的 AI 解决方案适配 AZD
- **🎥 交互式指南**: [研讨会资料](workshop/README.md) - 基于浏览器的 MkDocs * DevContainer 环境
- **📋 模板**: [Microsoft Foundry 模板](#工作坊资源)
- **📝 示例**: [AZD 部署示例](examples/README.md)

#### 实践练习
```bash
# 部署你的第一个 AI 应用
azd init --template azure-search-openai-demo
azd up

# 尝试更多 AI 模板
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 章节成果**：部署并配置具有 RAG 功能的 AI 驱动聊天应用

**✅ 成功验证：**
```bash
# 在第2章之后，您应该能够：
azd init --template azure-search-openai-demo
azd up
# 测试 AI 聊天界面
# 提出问题并获得附带来源的 AI 回答
# 验证搜索集成是否正常工作
azd monitor  # 检查 Application Insights 是否显示遥测数据
azd down --force --purge
```

**📊 时间投入：** 1-2 小时  
**📈 完成后技能水平：** 能够部署和配置生产就绪的 AI 应用  
**💰 成本认知：** 了解 $80-150/月 开发成本，$300-3500/月 生产成本

#### 💰 AI 部署的成本考虑

**开发环境（估计 $80-150/月）：**
- Microsoft Foundry 模型（按需付费）：$0-50/月（基于 token 使用量）
- AI Search（基础层）：$75/月
- Container Apps（按量计费）：$0-20/月
- 存储（标准）：$1-5/月

**生产环境（估计 $300-3,500+/月）：**
- Microsoft Foundry 模型（为稳定性能的 PTU）：$3,000+/月 或 在高流量时按需付费
- AI Search（标准层）：$250/月
- Container Apps（专用）：$50-100/月
- Application Insights：$5-50/月
- 存储（高级）：$10-50/月

**💡 成本优化建议：**
- 使用 <strong>免费层</strong> 的 Microsoft Foundry 模型进行学习（包含 Azure OpenAI 每月 50,000 tokens）
- 在非开发活跃期运行 `azd down` 来释放资源
- 从按量计费开始，只有在生产环境再升级到 PTU
- 使用 `azd provision --preview` 在部署前估算成本
- 启用自动伸缩：仅为实际使用付费

**成本监控：**
```bash
# 检查估算的每月费用
azd provision --preview

# 在 Azure 门户中监控实际费用
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第3章：配置与身份验证
<strong>先决条件</strong>：完成第1章  
<strong>时长</strong>：45-60 分钟  
<strong>复杂度</strong>：⭐⭐

#### 您将学到的内容
- 环境配置与管理
- 身份验证与安全最佳实践
- 资源命名与组织

#### 学习资源
- **📖 配置**： [配置指南](docs/chapter-03-configuration/configuration.md) - 环境设置
- **🔐 安全**： [身份验证模式与托管标识](docs/chapter-03-configuration/authsecurity.md) - 身份验证模式
- **📝 示例**： [数据库示例应用](examples/database-app/README.md) - AZD 数据库示例

#### 实践练习
- 配置多个环境（dev、staging、prod）
- 设置托管标识身份验证
- 实现环境特定的配置

**💡 章节成果**：使用适当的身份验证和安全管理多个环境

---

### 🏗️ 第4章：代码即基础设施与部署
<strong>先决条件</strong>：完成第1-3章  
<strong>时长</strong>：1-1.5 小时  
<strong>复杂度</strong>：⭐⭐⭐

#### 您将学到的内容
- 高级部署模式
- 使用 Bicep 的基础设施即代码
- 资源预配策略

#### 学习资源
- **📖 部署**： [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) - 完整工作流程
- **🏗️ 预配**： [资源预配](docs/chapter-04-infrastructure/provisioning.md) - Azure 资源管理
- **📝 示例**： [容器应用示例](../../examples/container-app) - 容器化部署

#### 实践练习
- 创建自定义 Bicep 模板
- 部署多服务应用
- 实施蓝绿部署策略

**💡 章节成果**：使用自定义基础设施模板部署复杂的多服务应用

---

### 🎯 第5章：多代理 AI 解决方案（高级）
<strong>先决条件</strong>：完成第1-2章  
<strong>时长</strong>：2-3 小时  
<strong>复杂度</strong>：⭐⭐⭐⭐

#### 您将学到的内容
- 多代理架构模式
- 代理编排与协调
- 面向生产的 AI 部署

#### 学习资源
- **🤖 特色项目**： [零售多代理解决方案](examples/retail-scenario.md) - 完整实现
- **🛠️ ARM 模板**： [ARM 模板包](../../examples/retail-multiagent-arm-template) - 一键部署
- **📖 架构**： [多代理协调模式](docs/chapter-06-pre-deployment/coordination-patterns.md) - 模式

#### 实践练习
```bash
# 部署完整的零售多智能体解决方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索智能体配置
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 章节成果**：部署并管理具有客户和库存代理的生产就绪多代理 AI 解决方案

---

### 🔍 第6章：预部署验证与规划
<strong>先决条件</strong>：完成第4章  
<strong>时长</strong>：1 小时  
<strong>复杂度</strong>：⭐⭐
#### 你将学到
- 容量规划与资源验证
- SKU 选择策略
- 预部署检查与自动化

#### 学习资源
- **📊 规划**: [容量规划](docs/chapter-06-pre-deployment/capacity-planning.md) - 资源验证
- **💰 选择**: [SKU 选择](docs/chapter-06-pre-deployment/sku-selection.md) - 具有成本效益的选择
- **✅ 验证**: [预部署检查](docs/chapter-06-pre-deployment/preflight-checks.md) - 自动化脚本

#### 实践练习
- 运行容量验证脚本
- 为成本优化 SKU 选择
- 实施自动化的预部署检查

**💡 章节成果**: 在执行前验证并优化部署

---

### 🚨 第7章：故障排除与调试
<strong>先决条件</strong>: 已完成任一部署章节  
<strong>时长</strong>: 1-1.5 hours  
<strong>复杂度</strong>: ⭐⭐

#### 你将学到
- 系统化的调试方法
- 常见问题及解决方案
- AI 特定的故障排除

#### 学习资源
- **🔧 常见问题**: [常见问题](docs/chapter-07-troubleshooting/common-issues.md) - 常见问题与解决方案
- **🕵️ 调试**: [调试指南](docs/chapter-07-troubleshooting/debugging.md) - 逐步策略
- **🤖 AI 问题**: [AI 特定的故障排除](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI 服务问题

#### 实践练习
- 诊断部署失败
- 解决身份验证问题
- 调试 AI 服务连接问题

**💡 章节成果**: 能够独立诊断并解决常见部署问题

---

### 🏢 第8章：生产与企业模式
<strong>先决条件</strong>: 完成第1-4章  
<strong>时长</strong>: 2-3 hours  
<strong>复杂度</strong>: ⭐⭐⭐⭐

#### 你将学到
- 生产部署策略
- 企业安全模式
- 监控与成本优化

#### 学习资源
- **🏭 生产**: [生产 AI 最佳实践](docs/chapter-08-production/production-ai-practices.md) - 企业模式
- **📝 示例**: [微服务示例](../../examples/microservices) - 复杂架构
- **📊 监控**: [Application Insights 集成](docs/chapter-06-pre-deployment/application-insights.md) - 监控

#### 实践练习
- 实现企业安全模式
- 建立全面监控
- 在适当治理下部署到生产环境

**💡 章节成果**: 部署具备完整生产能力的企业级应用

---

## 🎓 工作坊概览：动手学习体验

> **⚠️ 工作坊状态：开发中**  
> 工作坊材料目前正在开发和完善中。核心模块可用，但一些高级部分尚未完成。我们正在积极努力完成全部内容。 [查看进度 →](workshop/README.md)

### 互动式工作坊材料
**通过基于浏览器的工具与引导练习，提供全面的动手学习体验**

我们的工作坊材料提供了结构化的互动学习体验，补充了上述按章节的课程。该工作坊适用于自学和导师主导的授课。

#### 🛠️ 工作坊特性
- <strong>基于浏览器的界面</strong>: 完整的 MkDocs 驱动工作坊，具备搜索、复制和主题功能
- **GitHub Codespaces 集成**: 一键开发环境设置
- <strong>结构化学习路径</strong>: 8 个模块的引导练习（总计 3-4 小时）
- <strong>渐进式方法</strong>: 介绍 → 选择 → 验证 → 解构 → 配置 → 定制 → 清理 → 总结
- **交互式 DevContainer 环境**: 预配置的工具和依赖项

#### 📚 工作坊模块结构
该工作坊遵循一个 **8 个模块的渐进式方法**，将您从探索带到部署精通：

| 模块 | 主题 | 您将做什么 | 时长 |
|--------|-------|----------------|----------|
| **0. 介绍** | 工作坊概述 | 了解学习目标、先决条件和工作坊结构 | 15 分钟 |
| **1. 选择** | 模板发现 | 探索 AZD 模板并为您的场景选择合适的 AI 模板 | 20 分钟 |
| **2. 验证** | 部署并验证 | 使用 `azd up` 部署模板并验证基础设施是否正常 | 30 分钟 |
| **3. 解构** | 理解结构 | 使用 GitHub Copilot 探索模板架构、Bicep 文件和代码组织 | 30 分钟 |
| **4. 配置** | 深入解析 azure.yaml | 掌握 `azure.yaml` 配置、生命周期钩子和环境变量 | 30 分钟 |
| **5. 定制** | 自定义 | 启用 AI Search、追踪、评估，并根据您的场景进行自定义 | 45 分钟 |
| **6. 清理** | 清理 | 使用 `azd down --purge` 安全撤销资源 | 15 分钟 |
| **7. 总结** | 后续步骤 | 回顾成果、关键概念并继续您的学习之旅 | 15 分钟 |

**工作坊流程：**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 工作坊入门
```bash
# 选项 1：GitHub Codespaces（推荐）
# 在仓库中点击“Code” → “Create codespace on main”

# 选项 2：本地开发
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 按照 workshop/README.md 中的设置说明进行
```

#### 🎯 工作坊学习成果
完成工作坊后，参与者将：
- **部署生产环境的 AI 应用**: 在 Microsoft Foundry 服务上使用 AZD
- <strong>掌握多代理架构</strong>: 实现协作式 AI 代理解决方案
- <strong>实施安全最佳实践</strong>: 配置身份验证和访问控制
- <strong>为规模优化</strong>: 设计具有成本效益且高性能的部署
- <strong>排除部署故障</strong>: 独立解决常见问题

#### 📖 工作坊资源
- **🎥 互动指南**: [工作坊材料](workshop/README.md) - 基于浏览器的学习环境
- **📋 模块逐项说明**:
  - [0. 介绍](workshop/docs/instructions/0-Introduction.md) - 工作坊概述与目标
  - [1. 选择](workshop/docs/instructions/1-Select-AI-Template.md) - 查找并选择 AI 模板
  - [2. 验证](workshop/docs/instructions/2-Validate-AI-Template.md) - 部署并验证模板
  - [3. 解构](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - 探索模板架构
  - [4. 配置](workshop/docs/instructions/4-Configure-AI-Template.md) - 掌握 azure.yaml
  - [5. 定制](workshop/docs/instructions/5-Customize-AI-Template.md) - 根据您的场景进行定制
  - [6. 清理](workshop/docs/instructions/6-Teardown-Infrastructure.md) - 清理资源
  - [7. 总结](workshop/docs/instructions/7-Wrap-up.md) - 回顾与后续步骤
- **🛠️ AI 工作坊实验室**: [AI 工作坊实验室](docs/chapter-02-ai-development/ai-workshop-lab.md) - 面向 AI 的练习
- **💡 快速入门**: [工作坊安装指南](workshop/README.md#quick-start) - 环境配置

<strong>非常适合</strong>: 企业培训、大学课程、自定进度学习和开发者训练营。

---

## 📖 深入解析：AZD 能力

除了基础功能外，AZD 为生产部署提供强大功能：

- <strong>基于模板的部署</strong> - 使用预构建模板来实现常见的应用模式
- <strong>基础设施即代码</strong> - 使用 Bicep 或 Terraform 管理 Azure 资源  
- <strong>集成化工作流</strong> - 无缝配置、部署和监控应用
- <strong>面向开发者</strong> - 优化开发者的生产力和体验

### **AZD + Microsoft Foundry：AI 部署的理想选择**

**为什么为 AI 解决方案选择 AZD？** AZD 解决了 AI 开发者面临的主要挑战：

- **AI 就绪模板** - 为 Microsoft Foundry 模型、Cognitive Services 和 ML 工作负载预配置的模板
- **安全的 AI 部署** - 针对 AI 服务、API 密钥和模型端点的内置安全模式  
- **生产 AI 模式** - 可扩展且具成本效益的 AI 应用部署最佳实践
- **端到端 AI 工作流** - 从模型开发到生产部署，并配备适当的监控
- <strong>成本优化</strong> - 针对 AI 工作负载的智能资源分配和缩放策略
- **Microsoft Foundry 集成** - 与 Microsoft Foundry 模型目录和端点的无缝连接

---

## 🎯 模板与示例库

### 精选：Microsoft Foundry 模板
**如果您要部署 AI 应用，请从这里开始！**

> **注意：** 这些模板展示了各种 AI 模式。其中一些来自外部的 Azure 示例仓库，另一些为本地实现。

| 模板 | 章节 | 复杂度 | 服务 | 类型 |
|----------|---------|------------|----------|------|
| [**开始使用 AI 聊天**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | 外部 |
| [**开始使用 AI 代理**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第2章 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| 外部 |
| [**Azure Search + OpenAI 演示**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | 外部 |
| [**OpenAI 聊天应用 快速入门**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso 聊天 RAG**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | 外部 |
| [<strong>零售多代理解决方案</strong>](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | <strong>本地</strong> |

### 精选：完整学习场景
<strong>与学习章节对应的生产就绪应用模板</strong>

| 模板 | 对应学习章节 | 复杂度 | 主要学习点 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | 基础的 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | 使用 Azure AI Search 的 RAG 实现 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第4章 | ⭐⭐ | 文档智能集成 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | 代理框架与函数调用 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐ | 企业级 AI 编排 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | 具有客户和库存代理的多代理架构 |

### 按示例类型学习

> **📌 本地与外部示例：**  
> <strong>本地示例</strong>（在此仓库中） = 可立即使用  
> <strong>外部示例</strong>（Azure Samples） = 从链接的仓库克隆

#### 本地示例（可立即使用）
- [<strong>零售多代理解决方案</strong>](examples/retail-scenario.md) - 使用 ARM 模板的完整生产就绪实现
  - 多代理架构（客户 + 库存代理）
  - 全面监控与评估
  - 通过 ARM 模板一键部署

#### 本地示例 - 容器应用（第2-5章）
**本仓库中的全面容器部署示例：**
- [<strong>容器应用示例</strong>](examples/container-app/README.md) - 容器化部署完整指南
  - [简单的 Flask API](../../examples/container-app/simple-flask-api) - 基本的 REST API，支持 scale-to-zero
  - [微服务架构](../../examples/container-app/microservices) - 生产就绪的多服务部署
  - 快速入门、生产和高级部署模式
  - 监控、安全和成本优化指南

#### 外部示例 - 简单应用（第1-2章）
**克隆这些 Azure Samples 仓库以开始：**
- [简单 Web 应用 - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基础部署模式
- [静态网站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 静态内容部署
- [容器应用 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署

#### 外部示例 - 数据库集成（第3-4章）
- [数据库应用 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 数据库连接模式
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 无服务器数据工作流

#### 外部示例 - 高级模式（第4-8章）
- [Java 微服务](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服务架构
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - 后台处理  
- [企业级机器学习管道](https://github.com/Azure-Samples/mlops-v2) - 生产就绪的 ML 模式

### 外部模板集合
- [**官方 AZD 模板库**](https://azure.github.io/awesome-azd/) - 官方和社区模板的精选集合
- [**Azure Developer CLI 模板**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 模板文档
- [<strong>示例目录</strong>](examples/README.md) - 包含详细说明的本地学习示例

---

## 📚 学习资源与参考

### 快速参考
- [<strong>命令备忘单</strong>](resources/cheat-sheet.md) - 按章节组织的常用 azd 命令
- [<strong>术语表</strong>](resources/glossary.md) - Azure 和 azd 术语  
- [<strong>常见问题</strong>](resources/faq.md) - 按学习章节组织的常见问题
- [<strong>学习指南</strong>](resources/study-guide.md) - 全面的练习题

### 实战研讨会
- [**AI 工作坊实验**](docs/chapter-02-ai-development/ai-workshop-lab.md) - 使您的 AI 解决方案可通过 AZD 部署（2-3 小时）
- [<strong>交互式工作坊</strong>](workshop/README.md) - 基于 MkDocs 和 GitHub Codespaces 的 8 模块引导练习
  - 遵循：介绍 → 选择 → 验证 → 解构 → 配置 → 自定义 → 拆除 → 总结

### 外部学习资源
- [Azure Developer CLI 文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架构中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 定价计算器](https://azure.microsoft.com/pricing/calculator/)
- [Azure 状态](https://status.azure.com/)

### 适用于您编辑器的 AI 代理技能
- [**skills.sh 上的 Microsoft Azure 技能**](https://skills.sh/microsoft/github-copilot-for-azure) - 包含 37 个开放的代理技能，涵盖 Azure AI、Foundry、部署、诊断、成本优化等。可安装到 GitHub Copilot、Cursor、Claude Code 或任何受支持的代理：
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 快速故障排除指南

**初学者常见问题及即时解决方法：**

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
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# 尝试不同的 Azure 区域
azd env set AZURE_LOCATION "westus2"
azd up

# 或者在开发环境中使用更小的 SKU
# 编辑 infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# 选项 1：清理并重试
azd down --force --purge
azd up

# 选项 2：仅修复基础设施
azd provision

# 选项 3：检查详细状态
azd show

# 选项 4：在 Azure Monitor 中查看日志
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# 为 AZD 重新进行身份验证
azd auth logout
azd auth login

# 可选：如果您正在运行 az 命令，也刷新 Azure CLI
az logout
az login

# 验证身份
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD 会生成唯一的名称，但如果发生冲突：
azd down --force --purge

# 然后在新的环境中重试
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**正常等待时间：**
- 简单的 Web 应用：5-10 分钟
- 带数据库的应用：10-15 分钟
- AI 应用：15-25 分钟（OpenAI 预配置较慢）

```bash
# 检查进度
azd show

# 如果停滞超过30分钟，请检查 Azure 门户：
azd monitor --overview
# 查找失败的部署
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# 检查您的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 您至少需要“参与者（Contributor）”角色
# 请让您的 Azure 管理员授予：
# - 参与者（用于资源）
# - 用户访问管理员（用于角色分配）
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

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

### 📚 完整的故障排除资源

- **常见问题指南：** [详细解决方案](docs/chapter-07-troubleshooting/common-issues.md)
- **AI 特定问题：** [AI 故障排查](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **调试指南：** [逐步调试](docs/chapter-07-troubleshooting/debugging.md)
- **寻求帮助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 课程完成与认证

### 进度跟踪
跟踪您在每章的学习进度：

- [ ] **第 1 章**：基础与快速入门 ✅
- [ ] **第 2 章**：AI 优先开发 ✅  
- [ ] **第 3 章**：配置与认证 ✅
- [ ] **第 4 章**：基础设施即代码与部署 ✅
- [ ] **第 5 章**：多代理 AI 解决方案 ✅
- [ ] **第 6 章**：部署前验证与规划 ✅
- [ ] **第 7 章**：故障排除与调试 ✅
- [ ] **第 8 章**：生产与企业模式 ✅

### 学习验证
完成每章后，请通过以下方式验证您的知识：
1. <strong>实践练习</strong>：完成该章节的动手部署
2. <strong>知识检测</strong>：查看该章节的常见问题部分
3. <strong>社区讨论</strong>：在 Azure Discord 分享您的经验
4. <strong>下一章</strong>：进入下一个复杂度级别

### 完成课程的收益
完成所有章节后，您将获得：
- <strong>生产经验</strong>：将真实 AI 应用部署到 Azure
- <strong>专业技能</strong>：具备企业就绪的部署能力  
- <strong>社区认可</strong>：成为 Azure 开发者社区的活跃成员
- <strong>职业发展</strong>：掌握市场需求的 AZD 与 AI 部署专长

---

## 🤝 社区与支持

### 获取帮助与支持
- <strong>技术问题</strong>： [报告错误和请求新功能](https://github.com/microsoft/azd-for-beginners/issues)
- <strong>学习问题</strong>： [Microsoft Azure Discord 社区](https://discord.gg/microsoft-azure) 和 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 特定帮助**：加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- <strong>文档</strong>： [官方 Azure Developer CLI 文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### 来自 Microsoft Foundry Discord 的社区洞察

**来自 #Azure 频道的最新投票结果：**
- **45%** 的开发者希望将 AZD 用于 AI 工作负载
- <strong>主要挑战</strong>：多服务部署、凭证管理、生产就绪性  
- <strong>最常被请求的</strong>：AI 专用模板、故障排查指南、最佳实践

**加入我们的社区以：**
- 分享您的 AZD + AI 经验并获得帮助
- 获取新 AI 模板的早期预览
- 为 AI 部署最佳实践做出贡献
- 影响未来 AI + AZD 功能开发

### 为课程贡献
我们欢迎贡献！请阅读我们的 [贡献指南](CONTRIBUTING.md) 了解详细信息：
- <strong>内容改进</strong>：增强现有章节和示例
- <strong>新示例</strong>：添加真实世界场景和模板  
- <strong>翻译</strong>：帮助维护多语言支持
- <strong>错误报告</strong>：提高准确性和清晰度
- <strong>社区规范</strong>：遵循我们的包容性社区指南

---

## 📄 课程信息

### 许可
本项目采用 MIT 许可证 - 详情请参见 [LICENSE](../../LICENSE) 文件。

### 相关的 Microsoft 学习资源

我们的团队还制作了其他全面的学习课程：

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
[![数据科学入门](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![人工智能入门](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![网络安全入门](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web 开发入门](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![物联网入门](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR 开发入门](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot 系列
[![面向 AI 配对编程的 Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![面向 C#/.NET 的 Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot 冒险](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ 课程导航

**🚀 准备开始学习了吗？**

<strong>初学者</strong>: 从 [第 1 章：基础与快速入门](#-chapter-1-foundation--quick-start) 开始  
**AI 开发者**: 直接前往 [第 2 章：以 AI 为先的开发](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
<strong>有经验的开发者</strong>: 从 [第 3 章：配置与身份验证](#️-chapter-3-configuration--authentication) 开始

<strong>下一步</strong>: [开始第 1 章 - AZD 基础](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**:
本文件已使用 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始文件的母语版本应被视为权威来源。对于重要信息，建议由专业人工翻译。因使用本翻译而产生的任何误解或误释，我们概不负责。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->