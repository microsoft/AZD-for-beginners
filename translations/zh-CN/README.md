# AZD 新手指南：结构化学习之旅

![AZD-for-beginners](../../translated_images/zh-CN/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 自动翻译（始终保持最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[阿拉伯语](../ar/README.md) | [孟加拉语](../bn/README.md) | [保加利亚语](../bg/README.md) | [缅甸语](../my/README.md) | [中文（简体）](./README.md) | [中文（繁体，香港）](../zh-HK/README.md) | [中文（繁体，澳门）](../zh-MO/README.md) | [中文（繁体，台湾）](../zh-TW/README.md) | [克罗地亚语](../hr/README.md) | [捷克语](../cs/README.md) | [丹麦语](../da/README.md) | [荷兰语](../nl/README.md) | [爱沙尼亚语](../et/README.md) | [芬兰语](../fi/README.md) | [法语](../fr/README.md) | [德语](../de/README.md) | [希腊语](../el/README.md) | [希伯来语](../he/README.md) | [印地语](../hi/README.md) | [匈牙利语](../hu/README.md) | [印尼语](../id/README.md) | [意大利语](../it/README.md) | [日语](../ja/README.md) | [卡纳达语](../kn/README.md) | [高棉语](../km/README.md) | [韩语](../ko/README.md) | [立陶宛语](../lt/README.md) | [马来语](../ms/README.md) | [马拉雅拉姆语](../ml/README.md) | [马拉地语](../mr/README.md) | [尼泊尔语](../ne/README.md) | [尼日利亚皮钦语](../pcm/README.md) | [挪威语](../no/README.md) | [波斯语（法尔西语）](../fa/README.md) | [波兰语](../pl/README.md) | [葡萄牙语（巴西）](../pt-BR/README.md) | [葡萄牙语（葡萄牙）](../pt-PT/README.md) | [旁遮普语（古鲁穆奇）](../pa/README.md) | [罗马尼亚语](../ro/README.md) | [俄语](../ru/README.md) | [塞尔维亚语（西里尔）](../sr/README.md) | [斯洛伐克语](../sk/README.md) | [斯洛文尼亚语](../sl/README.md) | [西班牙语](../es/README.md) | [斯瓦希里语](../sw/README.md) | [瑞典语](../sv/README.md) | [他加禄语（菲律宾语）](../tl/README.md) | [泰米尔语](../ta/README.md) | [泰卢固语](../te/README.md) | [泰语](../th/README.md) | [土耳其语](../tr/README.md) | [乌克兰语](../uk/README.md) | [乌尔都语](../ur/README.md) | [越南语](../vi/README.md)

> **喜欢本地克隆？**
>
> 本仓库包含超过50种语言的翻译，大大增加了下载体积。要在不下载翻译的情况下克隆，请使用稀疏检出：
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
> 这将为你提供完成课程所需的一切，且下载速度更快。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 azd 今日新功能

> 📌 本课程基于 **`azd 1.27.1`**（2026年7月）验证。运行 `azd version` 检查版本，运行 `azd upgrade` 获取最新版本。

Azure Developer CLI 已超越传统的 Web 应用和 API。如今，azd 是将 <strong>任何</strong> 应用部署到 Azure 的单一工具——包括 AI 驱动的应用和智能代理。

这对你的意义是：

- **AI 代理现已成为一等 azd 工作负载。** 你可以使用熟悉的 `azd init` → `azd up` 工作流来初始化、部署和管理 AI 代理项目。
- **完整的代理生命周期管理 CLI 支持。** `azure.ai.agents` 扩展覆盖整个流程——`azd ai agent init` 脚手架，`azd ai agent invoke` 测试（带响应时间输出），`azd ai agent eval generate` 和 `azd ai agent optimize` 用于测量和提升质量，`azd ai agent delete` 用于清理。
- **更多 AI 构建模块。** 新的预览扩展——`azure.ai.skills` 和 `azure.ai.connections`，让你直接用 azd 管理可复用的代理技能和 Foundry 连接。
- **微软 Foundry 集成** 将模型部署、代理托管和 AI 服务配置直接带入 azd 模板生态。
- **日常基础操作更顺畅。** 最近发布使 `azd init` 幂等（可安全重复运行）、`azd auth login` 自动清理过期令牌，并新增友好的 `azd tool` 首次运行设置提示。
- **核心工作流未变。** 无论你部署待办应用、微服务，还是多代理 AI 解决方案，命令保持一致。

> **Aspire 用户注意：** 微软现将产品简称为 **Aspire**（前 ".NET Aspire"）。azd 对 Aspire 的支持未变，仅名称更新。

如果你之前使用过 azd，AI 支持是自然延展——不是单独工具或高级路线。新手可以学习一套适用于所有场景的工作流。

---

## 🚀 什么是 Azure Developer CLI (azd)？

**Azure Developer CLI (azd)** 是一款面向开发者的命令行工具，可简化应用部署至 Azure 的流程。无需手动创建和连接多个 Azure 资源，使用单条命令即可部署完整应用。

### `azd up` 的魔力

```bash
# 这条命令完成所有操作：
# ✅ 创建所有 Azure 资源
# ✅ 配置网络和安全
# ✅ 构建您的应用代码
# ✅ 部署到 Azure
# ✅ 提供一个可用的网址
azd up
```

**就是这么简单！** 无需点击 Azure 门户，无需学习复杂的 ARM 模板，无需手动配置——只需应用即可运行在 Azure 上。

---

## ❓ Azure Developer CLI 和 Azure CLI 有什么区别？

这是新手最常问的问题。简单回答如下：

| 功能 | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| <strong>目的</strong> | 管理单个 Azure 资源 | 部署完整应用 |
| <strong>思维方式</strong> | 关注基础设施 | 关注应用程序 |
| <strong>示例</strong> | `az webapp create --name myapp...` | `azd up` |
| <strong>学习曲线</strong> | 需了解 Azure 服务 | 只需懂你的应用 |
| <strong>最佳适用</strong> | DevOps、基础设施管理 | 开发者、快速原型 |

### 简单比喻

- **Azure CLI** 就像拥有所有建房工具——锤子、锯子、钉子。你可以建任何东西，但需要懂建造。
- **Azure Developer CLI** 就像请了承包商——你描述需求，他们负责建筑。

### 何时使用各自？

| 场景 | 使用此工具 |
|----------|----------|
| “我想快速部署我的 Web 应用” | `azd up` |
| “我只需创建存储账号” | `az storage account create` |
| “我在构建完整 AI 应用” | `azd init --template azure-search-openai-demo` |
| “我需要调试特定 Azure 资源” | `az resource show` |
| “我想在几分钟内完成生产就绪部署” | `azd up --environment production` |

### 两者协同工作！

AZD 底层使用 Azure CLI。你可以同时使用：
```bash
# 使用 AZD 部署您的应用
azd up

# 然后使用 Azure CLI 微调特定资源
az webapp config set --name myapp --always-on true
```

---

## 🌟 在 Awesome AZD 中寻找模板

不用从零开始！**Awesome AZD** 是社区收集的可一键部署模板：

| 资源 | 描述 |
|----------|-------------|
| 🔗 [**Awesome AZD 画廊**](https://azure.github.io/awesome-azd/) | 浏览 200+ 模板，支持一键部署 |
| 🔗 [<strong>提交模板</strong>](https://github.com/Azure/awesome-azd/issues) | 向社区贡献你的模板 |
| 🔗 [**GitHub 仓库**](https://github.com/Azure/awesome-azd) | 点星并探索源码 |

### Awesome AZD 中的热门 AI 模板

```bash
# 使用 Microsoft Foundry 模型 + AI 搜索的 RAG 聊天
azd init --template azure-search-openai-demo

# 快速 AI 聊天应用程序
azd init --template openai-chat-app-quickstart

# 使用 Foundry 代理的 AI 代理
azd init --template get-started-with-ai-agents
```

---

## 🎯 三步快速入门

开始之前，确保你的机器满足所选模板的要求：

**Windows：**
```powershell
.\validate-setup.ps1
```

**macOS / Linux：**
```bash
bash ./validate-setup.sh
```

如果有任何检查未通过，请先解决，然后继续快速入门流程。

### 第一步：安装 AZD（2分钟）

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

### 第二步：AZD 认证

```bash
# 如果您计划在本课程中直接使用 Azure CLI 命令，此项为可选
az login

# AZD 工作流所必需
azd auth login
```

如果不确定需要哪种方式，请参阅 [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup) 完整设置流程。

### 第三步：部署第一个应用

```bash
# 从模板初始化
azd init --template todo-nodejs-mongo

# 部署到 Azure（创建所有资源！）
azd up
```

**🎉 就这么简单！** 你的应用已在 Azure 上上线。

### 清理（别忘了！）

```bash
# 实验完成后删除所有资源
azd down --force --purge
```

---

## 📚 如何使用本课程

本课程设计为 <strong>渐进式学习</strong> ——从你熟悉的内容开始，逐步深入：

| 你的经验 | 从这里开始 |
|-----------------|------------|
| **Azure 新手** | [章节 1：基础](#-chapter-1-foundation--quick-start) |
| **了解 Azure，初次使用 AZD** | [章节 1：基础](#-chapter-1-foundation--quick-start) |
| **想部署 AI 应用** | [章节 2：AI 优先开发](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| <strong>想亲手实践</strong> | [🎓 交互式工作坊](workshop/README.md) - 3-4小时引导实验 |
| <strong>需要生产模式</strong> | [章节 8：生产与企业](#-chapter-8-production--enterprise-patterns) |

### 快速设置

1. **Fork 本仓库**：[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. <strong>克隆项目</strong>：`git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. <strong>寻求帮助</strong>：[Azure Discord 社区](https://discord.com/invite/ByRwuEEgH4)

> **喜欢本地克隆？**

> 本仓库包含超过 50 种语言翻译，显著增加了下载体积。若想不带翻译克隆，请使用稀疏检出：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 这将为你提供完成课程所需的全部内容，同时大幅提升下载速度。


## 课程概览

通过结构化章节掌握 Azure Developer CLI (azd)，支持渐进式学习。**特别聚焦 AI 应用部署及微软 Foundry 集成。**


### 为什么这门课程对现代开发者至关重要

基于 Microsoft Foundry Discord 社区的洞察，**45% 的开发者希望使用 AZD 来处理 AI 工作负载**，但遇到了以下挑战：
- 复杂的多服务 AI 架构
- 生产环境 AI 部署的最佳实践  
- Azure AI 服务集成与配置
- AI 工作负载的成本优化
- AI 特定部署问题的故障排除

### 学习目标

完成本结构化课程后，您将能够：
- **掌握 AZD 基础**：核心概念、安装与配置
- **部署 AI 应用**：使用 AZD 结合 Microsoft Foundry 服务
- <strong>实现基础设施即代码</strong>：使用 Bicep 模板管理 Azure 资源
- <strong>故障排除部署</strong>：解决常见问题与调试
- <strong>优化生产环境</strong>：安全、扩展、监控及成本管理
- <strong>构建多智能体解决方案</strong>：部署复杂的 AI 架构

## 开始之前：账户、权限和假设

在开始第1章之前，请确保以下准备就绪。本指南后续的安装步骤假定您已经处理好了这些基础事项。

- **Azure 订阅**：您可以使用工作或个人账户中的现有订阅，或创建一个 [免费试用](https://aka.ms/azurefreetrial) 以开始。
- **创建 Azure 资源的权限**：大多数练习需要您在目标订阅或资源组中至少拥有 <strong>贡献者</strong> 访问权限。部分章节还可能假定您能够创建资源组、托管身份和 RBAC 分配。
- [**GitHub 账号**](https://github.com)：用于 Fork 仓库、跟踪更改，并使用 GitHub Codespaces 进行实验。
- <strong>模板运行时先决条件</strong>：某些模板需要本地工具，如 Node.js、Python、Java 或 Docker。请先运行设置验证器，以便早期发现缺失工具。
- <strong>基本终端操作熟悉度</strong>：不必精通，但应能熟练运行诸如 `git clone`、`azd auth login`、`azd up` 等命令。

> **在企业订阅中工作？**
> 如果您的 Azure 环境由管理员管理，请提前确认您是否可以在计划使用的订阅或资源组中部署资源。如不能，请在开始前申请沙箱订阅或贡献者权限。

> **Azure 新手？**
> 请先使用您自己的 Azure 试用或按需付费订阅（链接：https://aka.ms/azurefreetrial），这样可以完整地完成所有练习，无需等待租户级审批。

## 🗺️ 课程地图：按照章节快速导航

每个章节附有专门的 README，包括学习目标、快速上手和练习：

| 章节 | 主题 | 课程 | 时长 | 复杂度 |
|---------|-------|---------|----------|------------|
| **[第1章：基础](docs/chapter-01-foundation/README.md)** | 入门 | [AZD 基础](docs/chapter-01-foundation/azd-basics.md) &#124; [安装](docs/chapter-01-foundation/installation.md) &#124; [第一个项目](docs/chapter-01-foundation/first-project.md) | 30-45 分钟 | ⭐ |
| **[第2章：AI 开发](docs/chapter-02-ai-development/README.md)** | AI优先应用 | [Foundry 集成](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI智能体](docs/chapter-02-ai-development/agents.md) &#124; [模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [研讨会](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 小时 | ⭐⭐ |
| **[第3章：配置](docs/chapter-03-configuration/README.md)** | 身份验证与安全 | [配置](docs/chapter-03-configuration/configuration.md) &#124; [身份验证与安全](docs/chapter-03-configuration/authsecurity.md) | 45-60 分钟 | ⭐⭐ |
| **[第4章：基础设施](docs/chapter-04-infrastructure/README.md)** | IaC 和部署 | [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [资源配置](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 小时 | ⭐⭐⭐ |
| **[第5章：多智能体](docs/chapter-05-multi-agent/README.md)** | AI 智能体解决方案 | [零售场景](examples/retail-scenario.md) &#124; [协调模式](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 小时 | ⭐⭐⭐⭐ |
| **[第6章：部署前准备](docs/chapter-06-pre-deployment/README.md)** | 规划与验证 | [预检检查](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [容量规划](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU选择](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [应用监控](docs/chapter-06-pre-deployment/application-insights.md) | 1 小时 | ⭐⭐ |
| **[第7章：故障排除](docs/chapter-07-troubleshooting/README.md)** | 调试与修复 | [常见问题](docs/chapter-07-troubleshooting/common-issues.md) &#124; [调试](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI问题排查](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 小时 | ⭐⭐ |
| **[第8章：生产环境](docs/chapter-08-production/README.md)** | 企业级模式 | [生产实践](docs/chapter-08-production/production-ai-practices.md) | 2-3 小时 | ⭐⭐⭐⭐ |
| **[🎓 研讨会](workshop/README.md)** | 实操实验室 | [介绍](workshop/docs/instructions/0-Introduction.md) &#124; [模板选择](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [模板验证](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [模板解构](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [模板配置](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [模板自定义](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [资源清理](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [总结](workshop/docs/instructions/7-Wrap-up.md) | 3-4 小时 | ⭐⭐ |

**总课程时长：** 约 10-14 小时 | **技能进阶：** 初学者 → 生产就绪

---

## 📚 学习章节

<em>根据经验水平和目标选择您的学习路径</em>

### 🚀 第1章：基础与快速入门
<strong>先决条件</strong>：Azure 订阅，基本命令行知识  
<strong>时长</strong>：30-45 分钟  
<strong>复杂度</strong>：⭐

#### 您将学习到
- 了解 Azure Developer CLI 基础
- 在您的平台上安装 AZD
- 完成您的第一次成功部署

#### 学习资源
- **🎯 从这里开始**：[什么是 Azure Developer CLI？](#what-is-azure-developer-cli)
- **📖 理论**：[AZD 基础](docs/chapter-01-foundation/azd-basics.md) — 核心概念与术语
- **⚙️ 设置**：[安装与设置](docs/chapter-01-foundation/installation.md) — 针对不同平台的指南
- **🛠️ 实践**：[您的第一个项目](docs/chapter-01-foundation/first-project.md) — 逐步教程
- **📋 快速参考**：[命令速查表](resources/cheat-sheet.md)

#### 实践练习
```bash
# 快速安装检查
azd version

# 部署你的第一个应用程序
azd init --template todo-nodejs-mongo
azd up
```

**💡 章节成果**：使用 AZD 成功将简单的 Web 应用部署到 Azure

**✅ 成功验证：**
```bash
# 完成第一章后，你应该能够：
azd version              # 显示已安装的版本
azd init --template todo-nodejs-mongo  # 初始化项目
azd up                  # 部署到 Azure
azd show                # 显示运行中的应用程序 URL
# 应用程序在浏览器中打开并正常工作
azd down --force --purge  # 清理资源
```

**📊 时间投入：** 30-45 分钟  
**📈 完成后技能水平：** 能够独立部署基础应用
**📈 完成后技能水平：** 能够独立部署基础应用

---

### 🤖 第2章：AI优先开发 （推荐给 AI 开发者）
<strong>先决条件</strong>：已完成第1章  
<strong>时长</strong>：1-2 小时  
<strong>复杂度</strong>：⭐⭐

#### 您将学习到
- Microsoft Foundry 与 AZD 集成
- 部署 AI 驱动的应用
- 了解 AI 服务配置

#### 学习资源
- **🎯 从这里开始**：[Microsoft Foundry 集成](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI智能体**：[AI 智能体指南](docs/chapter-02-ai-development/agents.md) — 使用 AZD 部署智能体
- **📖 模式**：[AI 模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) — 部署和管理 AI 模型
- **🛠️ 研讨会**：[AI 研讨会实验室](docs/chapter-02-ai-development/ai-workshop-lab.md) — 让您的 AI 解决方案支持 AZD
- **🎥 互动指南**：[研讨会材料](workshop/README.md) — 基于浏览器的 MkDocs 学习，带 DevContainer 环境
- **📋 模板**：[Microsoft Foundry 模板](#研讨会资源)
- **📝 示例**：[AZD 部署示例](examples/README.md)

#### 实践练习
```bash
# 部署你的第一个人工智能应用
azd init --template azure-search-openai-demo
azd up

# 尝试更多人工智能模板
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 章节成果**：部署并配置带有 RAG 功能的 AI 驱动聊天应用

**✅ 成功验证：**
```bash
# 在第2章之后，您应该能够：
azd init --template azure-search-openai-demo
azd up
# 测试AI聊天界面
# 提问并获得带有来源的AI驱动回答
# 验证搜索集成是否有效
azd monitor  # 检查应用程序洞察显示遥测数据
azd down --force --purge
```

**📊 时间投入：** 1-2 小时  
**📈 完成后技能水平：** 能够部署和配置生产就绪的 AI 应用  
**💰 费用意识：** 理解开发成本约 $80-150/月，生产成本约 $300-3500/月

#### 💰 AI 部署成本考虑

**开发环境（估计 $80-150/月）：**
- Microsoft Foundry 模型（按需付费）：$0-50/月（基于令牌使用量）
- AI 搜索（基础层）：$75/月
- 容器应用（消费型）：$0-20/月
- 存储（标准）：$1-5/月

**生产环境（估计 $300-3,500+/月）：**
- Microsoft Foundry 模型（使用 PTU 保证性能）：$3,000+/月 或 高用量按需付费
- AI 搜索（标准层）：$250/月
- 容器应用（专用）：$50-100/月
- 应用洞察：$5-50/月
- 存储（高级）：$10-50/月

**💡 成本优化技巧：**
- 使用 <strong>免费层</strong> Microsoft Foundry 模型进行学习（Azure OpenAI 含 50,000 令牌/月）
- 不活跃开发时运行 `azd down` 以释放资源
- 采用基于消费计费，生产环境再升级到 PTU
- 使用 `azd provision --preview` 预估部署成本
- 启用自动扩展：按实际使用付费

**成本监控：**
```bash
# 检查估计的每月费用
azd provision --preview

# 在 Azure 门户中监控实际费用
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第3章：配置与身份验证
<strong>先决条件</strong>：已完成第1章  
<strong>时长</strong>：45-60 分钟  
<strong>复杂度</strong>：⭐⭐

#### 您将学习到
- 环境配置与管理
- 身份验证与安全最佳实践
- 资源命名与组织

#### 学习资源
- **📖 配置指南**：[配置指南](docs/chapter-03-configuration/configuration.md) — 环境设置
- **🔐 安全**：[身份验证模式与托管身份](docs/chapter-03-configuration/authsecurity.md) — 身份验证模式
- **📝 示例**：[数据库应用示例](examples/database-app/README.md) — AZD 数据库示例

#### 实践练习
- 配置多个环境（开发、预发布、生产）
- 设置托管身份验证
- 实现环境特定配置

**💡 章节成果**：管理多环境，确保正确的身份验证和安全性

---

### 🏗️ 第4章：基础设施即代码与部署
<strong>先决条件</strong>：已完成第1-3章  
<strong>时长</strong>：1-1.5 小时  
<strong>复杂度</strong>：⭐⭐⭐

#### 您将学习到
- 高级部署模式
- 使用 Bicep 实现基础设施即代码
- 资源配置策略

#### 学习资源
- **📖 部署指南**：[部署指南](docs/chapter-04-infrastructure/deployment-guide.md) — 完整工作流程
- **🏗️ 资源配置指南**：[资源配置](docs/chapter-04-infrastructure/provisioning.md) — Azure 资源管理
- **📝 示例**：[容器应用示例](../../examples/container-app) — 容器化部署

#### 实践练习
- 创建自定义 Bicep 模板
- 部署多服务应用
- 实施蓝绿部署策略

**💡 章节成果**：使用自定义基础设施模板部署复杂多服务应用

---


### 🎯 第5章：多智能体 AI 解决方案（高级）
<strong>先决条件</strong>：完成第1-2章  
<strong>时长</strong>：2-3小时  
<strong>复杂度</strong>：⭐⭐⭐⭐

#### 你将学习到
- 多智能体架构模式
- 智能体编排与协调
- 生产就绪的 AI 部署

#### 学习资源
- **🤖 特色项目**：[零售多智能体解决方案](examples/retail-scenario.md) - 完整实现
- **🛠️ ARM 模板**：[ARM 模板包](../../examples/retail-multiagent-arm-template) - 一键部署
- **📖 架构**：[多智能体协调模式](docs/chapter-06-pre-deployment/coordination-patterns.md) - 模式介绍

#### 实践练习
```bash
# 部署完整的零售多代理解决方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索代理配置
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 本章成果**：部署和管理具有客户和库存智能体的生产就绪多智能体 AI 解决方案

---

### 🔍 第6章：预部署验证与规划
<strong>先决条件</strong>：完成第4章  
<strong>时长</strong>：1小时  
<strong>复杂度</strong>：⭐⭐

#### 你将学习到
- 容量规划与资源验证
- SKU 选择策略
- 预检与自动化

#### 学习资源
- **📊 规划**：[容量规划](docs/chapter-06-pre-deployment/capacity-planning.md) - 资源验证
- **💰 选择**：[SKU 选择](docs/chapter-06-pre-deployment/sku-selection.md) - 成本效益选择
- **✅ 验证**：[预检](docs/chapter-06-pre-deployment/preflight-checks.md) - 自动化脚本

#### 实践练习
- 运行容量验证脚本
- 优化 SKU 选择以降低成本
- 实现自动化预部署检查

**💡 本章成果**：在执行前验证并优化部署

---

### 🚨 第7章：疑难解答与调试
<strong>先决条件</strong>：完成任何部署章节  
<strong>时长</strong>：1-1.5小时  
<strong>复杂度</strong>：⭐⭐

#### 你将学习到
- 系统性调试方法
- 常见问题与解决方案
- AI 特定的故障排除

#### 学习资源
- **🔧 常见问题**：[常见问题](docs/chapter-07-troubleshooting/common-issues.md) - FAQ 和解决方案
- **🕵️ 调试**：[调试指南](docs/chapter-07-troubleshooting/debugging.md) - 分步骤策略
- **🤖 AI 问题**：[AI 特定故障排除](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI 服务问题

#### 实践练习
- 诊断部署失败
- 解决身份验证问题
- 调试 AI 服务连通性

**💡 本章成果**：独立诊断并解决常见部署问题

---

### 🏢 第8章：生产与企业模式
<strong>先决条件</strong>：完成第1-4章  
<strong>时长</strong>：2-3小时  
<strong>复杂度</strong>：⭐⭐⭐⭐

#### 你将学习到
- 生产部署策略
- 企业安全模式
- 监控与成本优化

#### 学习资源
- **🏭 生产**：[生产 AI 最佳实践](docs/chapter-08-production/production-ai-practices.md) - 企业模式
- **📝 示例**：[微服务示例](../../examples/microservices) - 复杂架构
- **📊 监控**：[应用洞察集成](docs/chapter-06-pre-deployment/application-insights.md) - 监控

#### 实践练习
- 实现企业安全模式
- 设置全面监控
- 在适当治理下部署生产环境

**💡 本章成果**：部署具备全面生产能力的企业级应用

---

## 🎓 研讨会概览：动手学习体验

> **⚠️ 研讨会状态：开发中**  
> 研讨会材料目前正在开发和完善。核心模块已具备功能，但部分高级章节尚未完成。我们正积极工作以完成所有内容。[查看进展 →](workshop/README.md)

### 互动研讨会材料
<strong>通过浏览器工具和指导练习提供全面的动手学习体验</strong>

我们的研讨会材料提供了结构化、互动式的学习体验，补充上述章节课程。研讨会适合自学和教师主导的课程。

#### 🛠️ 研讨会特色
- <strong>基于浏览器的界面</strong>：完整的 MkDocs 驱动研讨会，支持搜索、复制和主题功能
- **GitHub Codespaces 集成**：一键搭建开发环境
- <strong>结构化学习路径</strong>：8模块指导练习（总时长3-4小时）
- <strong>渐进式方法论</strong>：介绍 → 选择 → 验证 → 分解 → 配置 → 定制 → 清理 → 总结
- **交互式 DevContainer 环境**：预配置工具和依赖

#### 📚 研讨会模块结构
研讨会遵循<strong>8模块渐进方法论</strong>，引导你从探索到部署精通：

| 模块 | 主题 | 你将完成 | 时长 |
|--------|-------|----------------|----------|
| **0. 介绍** | 研讨会概览 | 了解学习目标、先决条件和研讨会结构 | 15 分钟 |
| **1. 选择** | 模板发现 | 探索 AZD 模板并为你的场景选择合适 AI 模板 | 20 分钟 |
| **2. 验证** | 部署与验证 | 使用 `azd up` 部署模板并验证基础设施 | 30 分钟 |
| **3. 分解** | 理解结构 | 利用 GitHub Copilot 探索模板架构、Bicep 文件和代码组织 | 30 分钟 |
| **4. 配置** | azure.yaml 深入解析 | 精通 `azure.yaml` 配置、生命周期钩子和环境变量 | 30 分钟 |
| **5. 定制** | 个性化定制 | 启用 AI 搜索、跟踪、评估并按场景定制 | 45 分钟 |
| **6. 清理** | 清理资源 | 使用 `azd down --purge` 安全销毁资源 | 15 分钟 |
| **7. 总结** | 后续步骤 | 回顾成果、关键概念并继续学习之旅 | 15 分钟 |

**研讨会流程：**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 开始研讨会
```bash
# 选项 1：GitHub Codespaces（推荐）
# 在仓库中点击“代码” → “在 main 上创建 codespace”

# 选项 2：本地开发
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 按照 workshop/README.md 中的设置说明进行操作
```

#### 🎯 研讨会学习成果
通过完成本研讨会，学员将能够：
- **部署生产 AI 应用**：使用 AZD 结合 Microsoft Foundry 服务
- <strong>掌握多智能体架构</strong>：实现协调的 AI 智能代理解决方案
- <strong>实施安全最佳实践</strong>：配置身份验证和访问控制
- <strong>优化扩展性</strong>：设计具成本效益且高性能的部署
- <strong>故障排查部署</strong>：独立解决常见问题

#### 📖 研讨会资源
- **🎥 交互式指南**：[研讨会材料](workshop/README.md) - 基于浏览器的学习环境
- **📋 模块逐步指导**：
  - [0. 介绍](workshop/docs/instructions/0-Introduction.md) - 研讨会概览与目标
  - [1. 选择](workshop/docs/instructions/1-Select-AI-Template.md) - 查找并选择 AI 模板
  - [2. 验证](workshop/docs/instructions/2-Validate-AI-Template.md) - 部署并验证模板
  - [3. 分解](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - 探索模板架构
  - [4. 配置](workshop/docs/instructions/4-Configure-AI-Template.md) - 精通 azure.yaml
  - [5. 定制](workshop/docs/instructions/5-Customize-AI-Template.md) - 按场景定制
  - [6. 清理](workshop/docs/instructions/6-Teardown-Infrastructure.md) - 清理资源
  - [7. 总结](workshop/docs/instructions/7-Wrap-up.md) - 回顾与后续步骤
- **🛠️ AI 研讨会实验室**：[AI 研讨会实验室](docs/chapter-02-ai-development/ai-workshop-lab.md) - 面向 AI 的练习
- **💡 快速入门**：[研讨会设置指南](workshop/README.md#quick-start) - 环境配置

<strong>非常适合</strong>：企业培训、大学课程、自学及开发者训练营。

---

## 📖 深入了解：AZD 功能

除基础功能外，AZD 还提供强大的生产部署特性：

- <strong>基于模板的部署</strong> - 使用预构建模板实现常见应用模式
- <strong>基础设施即代码</strong> - 使用 Bicep 或 Terraform 管理 Azure 资源  
- <strong>集成工作流程</strong> - 无缝提供、部署和监控应用
- <strong>以开发者为中心</strong> - 优化开发者生产力和体验

### **AZD + Microsoft Foundry：AI 部署的完美组合**

**为什么选择 AZD 进行 AI 解决方案？** AZD 解决 AI 开发者面临的主要挑战：

- **AI 就绪模板** - 针对 Microsoft Foundry 模型、Azure AI 服务和 ML 负载预配置的模板
- **安全的 AI 部署** - 内置 AI 服务、API 密钥和模型端点的安全模式  
- **生产级 AI 模式** - 可扩展、成本效益良好的 AI 应用部署最佳实践
- **端到端 AI 工作流** - 从模型开发到生产部署，含完善监控
- <strong>成本优化</strong> - 智能资源分配和 AI 负载弹性伸缩策略
- **Microsoft Foundry 集成** - 无缝连接到 Microsoft Foundry 模型目录与端点

---

## 🎯 模板与示例库

### 特色：Microsoft Foundry 模板
**如果你正在部署 AI 应用，从这里开始！**

> **注意：** 这些模板演示了多种 AI 模式。有些是外部 Azure 示例，有些是本地实现。

| 模板 | 章节 | 复杂度 | 服务 | 类型 |
|----------|---------|------------|----------|------|
| [**入门 AI 聊天**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI 模型推理 API + Azure AI 搜索 + Azure 容器应用 + 应用洞察 | 外部 |
| [**入门 AI 智能体**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第2章 | ⭐⭐ | Foundry 智能体 + AzureOpenAI + Azure AI 搜索 + Azure 容器应用 + 应用洞察| 外部 |
| [**Azure 搜索 + OpenAI 演示**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI 搜索 + 应用服务 + 存储 | 外部 |
| [**OpenAI 聊天应用快速入门**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | AzureOpenAI + 容器应用 + 应用洞察 | 外部 |
| [**智能体 OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso 聊天 RAG**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐⭐ | AzureOpenAI + AI 搜索 + Cosmos DB + 容器应用 | 外部 |
| [<strong>零售多智能体解决方案</strong>](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | AzureOpenAI + AI 搜索 + 存储 + 容器应用 + Cosmos DB | <strong>本地</strong> |

### 特色：完整学习场景
<strong>生产就绪应用模板对应学习章节</strong>

| 模板 | 学习章节 | 复杂度 | 关键学习点 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | 基础 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | 基于 Azure AI 搜索的 RAG 实现 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第4章 | ⭐⭐ | 文档智能集成 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | 智能体框架与函数调用 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐ | 企业级 AI 编排 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | 具有客户和库存智能体的多智能体架构 |

### 按示例类型学习

> **📌 本地与外部示例对比：**  
> <strong>本地示例</strong>（本仓库）= 即刻可用  
> <strong>外部示例</strong>（Azure 示例）= 从链接仓库克隆

#### 本地示例（即用型）
- [<strong>零售多智能体解决方案</strong>](examples/retail-scenario.md) - 完整生产就绪实现及 ARM 模板
  - 多智能体架构（客户 + 库存智能体）
  - 全面监控及评估
  - 通过 ARM 模板一键部署

#### 本地示例 - 容器应用（第2-5章）
**本仓库中的全面容器部署示例：**

- [<strong>容器应用示例</strong>](examples/container-app/README.md) - 容器化部署完整指南
  - [简单 Flask API](../../examples/container-app/simple-flask-api) - 支持零规模扩展的基本 REST API
  - [微服务架构](../../examples/container-app/microservices) - 适用于生产的多服务部署
  - 快速入门、生产和高级部署模式
  - 监控、安全和成本优化指导

#### 外部示例 - 简单应用（章节 1-2）
**克隆这些 Azure 示例仓库以开始学习：**
- [简单 Web 应用 - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本部署模式
- [静态网站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 静态内容部署
- [容器应用 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署

#### 外部示例 - 数据库集成（章节 3-4）  
- [数据库应用 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 数据库连接模式
- [函数 + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 无服务器数据工作流

#### 外部示例 - 高级模式（章节 4-8）
- [Java 微服务](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服务架构
- [容器应用作业](https://github.com/Azure-Samples/container-apps-jobs) - 后台处理  
- [企业级 ML 管道](https://github.com/Azure-Samples/mlops-v2) - 生产就绪的 ML 模式

### 外部模板集锦
- [**官方 AZD 模板库**](https://azure.github.io/awesome-azd/) - 官方和社区模板精选集
- [**Azure Developer CLI 模板**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 模板文档
- [<strong>示例目录</strong>](examples/README.md) - 本地学习示例和详细说明

---

## 📚 学习资源与参考

### 快速参考
- [<strong>命令速查表</strong>](resources/cheat-sheet.md) - 按章节组织的基础 azd 命令
- [<strong>术语表</strong>](resources/glossary.md) - Azure 和 azd 术语解释  
- [<strong>常见问题解答</strong>](resources/faq.md) - 按学习章节整理的常见疑问
- [<strong>学习指南</strong>](resources/study-guide.md) - 综合练习题库

### 实操研讨会
- [**AI 研讨实验室**](docs/chapter-02-ai-development/ai-workshop-lab.md) - 使你的 AI 解决方案支持 AZD 部署（2-3 小时）
- [<strong>交互式研讨会</strong>](workshop/README.md) - 8 模块引导式练习，使用 MkDocs 和 GitHub Codespaces
  - 按顺序：介绍 → 选择 → 验证 → 拆解 → 配置 → 定制 → 清理 → 总结

### 外部学习资源
- [Azure Developer CLI 文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架构中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 价格计算器](https://azure.microsoft.com/pricing/calculator/)
- [Azure 状态](https://status.azure.com/)

### 你的编辑器的 AI 代理技能
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 个开源代理技能，涵盖 Azure AI、Foundry、部署、诊断、成本优化等。可安装于 GitHub Copilot、Cursor、Claude Code 或任何支持的代理：
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 快速故障排查指南

**初学者常见问题及即时解决方案：**

<details>
<summary><strong>❌ “azd: command not found（找不到命令）”</strong></summary>

```bash
# 首先安装 AZD
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
<summary><strong>❌ “No subscription found（未找到订阅）” 或 “Subscription not set（订阅未设置）”</strong></summary>

```bash
# 列出可用的订阅
az account list --output table

# 设置默认订阅
az account set --subscription "<subscription-id-or-name>"

# 设置 AZD 环境
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# 验证
az account show
```
</details>

<details>
<summary><strong>❌ “InsufficientQuota（配额不足）” 或 “Quota exceeded（超出配额）”</strong></summary>

```bash
# 尝试不同的 Azure 区域
azd env set AZURE_LOCATION "westus2"
azd up

# 或在开发中使用较小的 SKU
# 编辑 infra/main.parameters.json：
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ “azd up” 命令中途失败</strong></summary>

```bash
# 选项 1：清理并重试
azd down --force --purge
azd up

# 选项 2：仅修复基础设施
azd provision

# 选项 3：检查详细状态
azd show

# 选项 4：在 Azure 监视器中查看日志
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ “Authentication failed（身份验证失败）” 或 “Token expired（令牌过期）”</strong></summary>

```bash
# 重新进行 AZD 认证
azd auth logout
azd auth login

# 可选：如果您正在运行 az 命令，也刷新 Azure CLI
az logout
az login

# 验证身份认证
az account show
```
</details>

<details>
<summary><strong>❌ “Resource already exists（资源已存在）” 或命名冲突</strong></summary>

```bash
# AZD 会生成唯一名称，但如果有冲突：
azd down --force --purge

# 则使用新的环境重新尝试
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 模板部署时间过长</strong></summary>

**正常等待时间：**
- 简单 Web 应用：5-10 分钟
- 带数据库的应用：10-15 分钟
- AI 应用：15-25 分钟（OpenAI 资源供应较慢）

```bash
# 检查进度
azd show

# 如果卡住超过30分钟，检查Azure门户：
azd monitor --overview
# 查找失败的部署
```
</details>

<details>
<summary><strong>❌ “Permission denied（权限被拒绝）” 或 “Forbidden（禁止访问）”</strong></summary>

```bash
# 检查您的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 您至少需要“参与者”角色
# 请您的 Azure 管理员授予：
# - 参与者（用于资源）
# - 用户访问管理员（用于角色分配）
```
</details>

<details>
<summary><strong>❌ 找不到已部署应用的 URL</strong></summary>

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

### 📚 完整故障排查资源

- **常见问题指南：** [详细解决方案](docs/chapter-07-troubleshooting/common-issues.md)
- **AI 专属问题：** [AI 故障排查](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **调试指南：** [逐步调试](docs/chapter-07-troubleshooting/debugging.md)
- **获取帮助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 课程完成与认证

### 学习进度追踪
跟踪你每章节的学习进度：

- [ ] <strong>第一章</strong>：基础与快速入门 ✅
- [ ] <strong>第二章</strong>：AI 优先开发 ✅  
- [ ] <strong>第三章</strong>：配置与身份验证 ✅
- [ ] <strong>第四章</strong>：基础设施即代码与部署 ✅
- [ ] <strong>第五章</strong>：多代理 AI 解决方案 ✅
- [ ] <strong>第六章</strong>：预部署验证与规划 ✅
- [ ] <strong>第七章</strong>：故障排查与调试 ✅
- [ ] <strong>第八章</strong>：生产与企业模式 ✅

### 学习验证
完成各章节后，请通过以下方式验证你的知识：
1. <strong>实践操练</strong>：完成章节的动手部署
2. <strong>知识点检验</strong>：查看本章的常见问题解答
3. <strong>社区讨论</strong>：在 Azure Discord 分享你的经验
4. <strong>下一章学习</strong>：进入下一个难度级别

### 课程完成收益
完成所有章节后，你将获得：
- <strong>生产经验</strong>：成功将真实 AI 应用部署到 Azure
- <strong>专业技能</strong>：具备企业级部署能力  
- <strong>社区认可</strong>：成为活跃的 Azure 开发者社区成员
- <strong>职业发展</strong>：掌握炙手可热的 AZD 和 AI 部署技能

---

## 🤝 社区与支持

### 获取帮助与支持
- <strong>技术问题</strong>：[报告 BUG 和请求功能](https://github.com/microsoft/azd-for-beginners/issues)
- <strong>学习疑问</strong>：[Microsoft Azure Discord 社区](https://discord.gg/microsoft-azure) 以及 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 专属帮助**：加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- <strong>文档资料</strong>：[官方 Azure Developer CLI 文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### 来自 Microsoft Foundry Discord 的社区见解

**#Azure 频道的最新投票结果：**
- **45%** 开发者希望在 AI 工作负载中使用 AZD
- <strong>主要挑战</strong>：多服务部署、凭证管理、生产环境准备  
- <strong>最常需求</strong>：AI 专属模板、故障排查指南、最佳实践

**加入我们的社区，共同：**
- 分享你的 AZD+AI 经验并获得帮助
- 优先获取最新 AI 模板预览
- 贡献 AI 部署最佳实践
- 影响未来 AI 和 AZD 的功能开发

### 课程贡献
欢迎贡献！请阅读我们的 [贡献指南](CONTRIBUTING.md)，了解详情：
- <strong>内容改进</strong>：增强现有章节和示例
- <strong>新增示例</strong>：添加真实场景和模板  
- <strong>翻译</strong>：协助维护多语言支持
- **Bug 报告**：提升准确性和明晰度
- <strong>社区规范</strong>：遵守包容性的社区准则

---

## 📄 课程信息

### 许可证
本项目采用 MIT 许可证 - 详情请参阅 [LICENSE](../../LICENSE) 文件。

### 相关 Microsoft 学习资源

我们团队制作的其他全面学习课程：

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j 入门](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js 入门](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain 入门](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / 代理
[![AZD 入门](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI 入门](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP 入门](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI 代理入门](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### 生成式 AI 系列
[![生成式 AI 入门](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

[![生成式 AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### 核心学习
[![初学者机器学习](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![初学者数据科学](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![初学者 AI](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![初学者网络安全](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![初学者网页开发](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![初学者物联网](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![初学者 XR 开发](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot 系列
[![AI 配对编程 Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot 冒险](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ 课程导航

**🚀 准备开始学习了吗？**

<strong>初学者</strong>：从[第 1 章：基础与快速入门](#-chapter-1-foundation--quick-start)开始  
**AI 开发者**：跳转到[第 2 章：AI 优先开发](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
<strong>有经验的开发者</strong>：从[第 3 章：配置与身份验证](#️-chapter-3-configuration--authentication)开始

<strong>下一步</strong>：[开始第 1 章 - AZD 基础](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->