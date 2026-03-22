# AZD 初学者：结构化学习之旅

![AZD 初学者](../../translated_images/zh-CN/azdbeginners.5527441dd9f74068.webp) 

[![GitHub 关注者](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub 分叉](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub 星标](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 自动翻译（始终最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[阿拉伯语](../ar/README.md) | [孟加拉语](../bn/README.md) | [保加利亚语](../bg/README.md) | [缅甸语（缅甸）](../my/README.md) | [中文（简体）](./README.md) | [中文（繁体，香港）](../zh-HK/README.md) | [中文（繁体，澳门）](../zh-MO/README.md) | [中文（繁体，台湾）](../zh-TW/README.md) | [克罗地亚语](../hr/README.md) | [捷克语](../cs/README.md) | [丹麦语](../da/README.md) | [荷兰语](../nl/README.md) | [爱沙尼亚语](../et/README.md) | [芬兰语](../fi/README.md) | [法语](../fr/README.md) | [德语](../de/README.md) | [希腊语](../el/README.md) | [希伯来语](../he/README.md) | [印地语](../hi/README.md) | [匈牙利语](../hu/README.md) | [印度尼西亚语](../id/README.md) | [意大利语](../it/README.md) | [日语](../ja/README.md) | [卡纳达语](../kn/README.md) | [韩语](../ko/README.md) | [立陶宛语](../lt/README.md) | [马来语](../ms/README.md) | [马拉雅拉姆语](../ml/README.md) | [马拉地语](../mr/README.md) | [尼泊尔语](../ne/README.md) | [尼日利亚皮钦语](../pcm/README.md) | [挪威语](../no/README.md) | [波斯语（法尔西）](../fa/README.md) | [波兰语](../pl/README.md) | [葡萄牙语（巴西）](../pt-BR/README.md) | [葡萄牙语（葡萄牙）](../pt-PT/README.md) | [旁遮普语（古尔穆基）](../pa/README.md) | [罗马尼亚语](../ro/README.md) | [俄语](../ru/README.md) | [塞尔维亚语（西里尔字母）](../sr/README.md) | [斯洛伐克语](../sk/README.md) | [斯洛文尼亚语](../sl/README.md) | [西班牙语](../es/README.md) | [斯瓦西里语](../sw/README.md) | [瑞典语](../sv/README.md) | [塔加洛语（菲律宾语）](../tl/README.md) | [泰米尔语](../ta/README.md) | [泰卢固语](../te/README.md) | [泰语](../th/README.md) | [土耳其语](../tr/README.md) | [乌克兰语](../uk/README.md) | [乌尔都语](../ur/README.md) | [越南语](../vi/README.md)

> **更倾向于本地克隆？**
>
> 本仓库包含 50 多种语言的翻译，会显著增加下载大小。要在不包含翻译的情况下克隆，请使用稀疏签出：
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
> 这会为你提供完成课程所需的一切，并显著加快下载速度。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 azd 今日更新

Azure Developer CLI 已经超越了传统的 Web 应用和 API。如今，azd 是将任何应用部署到 Azure 的单一工具——包括 AI 驱动的应用和智能代理。

这对你的意义如下：

- **AI 代理现在是 azd 的一等工作负载。** 你可以使用熟悉的 `azd init` → `azd up` 工作流来初始化、部署和管理 AI 代理项目。
- **Microsoft Foundry 集成** 将模型部署、代理托管和 AI 服务配置直接带入 azd 模板生态系统。
- **核心工作流未改变。** 无论你是在部署待办应用、微服务，还是多代理 AI 解决方案，命令都是相同的。

如果你以前使用过 azd，AI 支持只是自然的扩展——不是一个独立的工具或高级路线。如果你是新手，你将学习一个适用于所有场景的工作流。

---

## 🚀 什么是 Azure Developer CLI (azd)？

**Azure Developer CLI (azd)** 是一款面向开发者的命令行工具，可简化将应用部署到 Azure 的过程。你无需手动创建和连接几十个 Azure 资源，只需一个命令即可部署整个应用。

### `azd up` 的魔力

```bash
# 这个单一命令完成所有操作：
# ✅ 创建所有 Azure 资源
# ✅ 配置网络和安全
# ✅ 构建你的应用代码
# ✅ 部署到 Azure
# ✅ 提供可用的网址
azd up
```

**就是这样！** 无需点击 Azure 门户，无需先学习复杂的 ARM 模板，无需手动配置——只需将应用部署到 Azure 即可。

---

## ❓ Azure Developer CLI 与 Azure CLI：有什么区别？

这是初学者最常问的问题。简单回答如下：

| 功能 | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| <strong>目的</strong> | 管理单个 Azure 资源 | 部署完整应用 |
| <strong>思维方式</strong> | 以基础设施为中心 | 以应用为中心 |
| <strong>示例</strong> | `az webapp create --name myapp...` | `azd up` |
| <strong>学习曲线</strong> | 需了解 Azure 服务 | 只需了解你的应用 |
| <strong>适合对象</strong> | DevOps、基础架构 | 开发者、快速原型 |

### 简单类比

- **Azure CLI** 就像拥有建造房子的所有工具——锤子、锯子、钉子。你可以建造任何东西，但你需要懂得施工。
- **Azure Developer CLI** 就像雇一个承包商——你描述你的需求，他们负责施工。

### 何时使用各自工具

| 场景 | 使用 |
|----------|----------|
| “我想快速部署我的 Web 应用” | `azd up` |
| “我只需要创建一个存储账户” | `az storage account create` |
| “我正在构建完整的 AI 应用” | `azd init --template azure-search-openai-demo` |
| “我需要调试某个特定的 Azure 资源” | `az resource show` |
| “我想在几分钟内进行生产就绪部署” | `azd up --environment production` |

### 它们可以协同工作！

AZD 在底层使用 Azure CLI。你可以两者配合使用：
```bash
# 使用 AZD 部署您的应用
azd up

# 然后使用 Azure CLI 微调特定资源
az webapp config set --name myapp --always-on true
```

---

## 🌟 在 Awesome AZD 中查找模板

不要从零开始！**Awesome AZD** 是由社区收集的可即刻部署模板合集：

| 资源 | 描述 |
|----------|-------------|
| 🔗 [**Awesome AZD 画廊**](https://azure.github.io/awesome-azd/) | 浏览 200+ 个可一键部署的模板 |
| 🔗 [<strong>提交模板</strong>](https://github.com/Azure/awesome-azd/issues) | 向社区贡献你的模板 |
| 🔗 [**GitHub 仓库**](https://github.com/Azure/awesome-azd) | 给项目加星并浏览源码 |

### 来自 Awesome AZD 的热门 AI 模板

```bash
# 使用 Microsoft Foundry 模型 + AI 搜索的 RAG 聊天
azd init --template azure-search-openai-demo

# 快速 AI 聊天应用
azd init --template openai-chat-app-quickstart

# 具有 Foundry 代理的 AI 代理
azd init --template get-started-with-ai-agents
```

---

## 🎯 三步入门

### 第一步：安装 AZD（2 分钟）

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

### 第二步：登录 Azure

```bash
azd auth login
```

### 第三步：部署你的第一个应用

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

## 📚 本课程如何使用

本课程采用<strong>渐进式学习</strong>设计——从你熟悉的内容开始，逐步提升：

| 你的经验 | 从这里开始 |
|-----------------|------------|
| **刚接触 Azure** | [第 1 章：基础](#-chapter-1-foundation--quick-start) |
| **了解 Azure，但不熟悉 AZD** | [第 1 章：基础](#-chapter-1-foundation--quick-start) |
| **想部署 AI 应用** | [第 2 章：以 AI 为先的开发](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| <strong>想要动手实践</strong> | [🎓 互动式工作坊](workshop/README.md) - 3-4 小时引导实验 |
| <strong>需要生产环境模式</strong> | [第 8 章：生产与企业模式](#-chapter-8-production--enterprise-patterns) |

### 快速设置

1. **Fork 本仓库**: [![GitHub 分叉](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. <strong>克隆仓库</strong>: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. <strong>获取帮助</strong>: [Azure Discord 社区](https://discord.com/invite/ByRwuEEgH4)

> **更倾向于本地克隆？**
>
> 本仓库包含 50 多种语言的翻译，会显著增加下载大小。要在不包含翻译的情况下克隆，请使用稀疏签出：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 这会为你提供完成课程所需的一切，并显著加快下载速度。


## 课程概览

通过结构化章节掌握 Azure Developer CLI (azd)，以渐进式学习为导向。**特别关注与 Microsoft Foundry 集成的 AI 应用部署。**

### 为什么本课程对现代开发者至关重要

根据 Microsoft Foundry Discord 社区的见解，**45% 的开发者希望将 AZD 用于 AI 工作负载**，但会遇到以下挑战：
- 复杂的多服务 AI 架构
- AI 上线部署的最佳实践  
- Azure AI 服务的集成与配置
- AI 工作负载的成本优化
- 排查 AI 特定的部署问题

### 学习目标

完成本结构化课程后，你将能够：
- **掌握 AZD 基础**：核心概念、安装与配置
- **部署 AI 应用**：将 AZD 与 Microsoft Foundry 服务结合使用
- <strong>实施基础设施即代码</strong>：使用 Bicep 模板管理 Azure 资源
- <strong>排查部署问题</strong>：解决常见问题与调试
- <strong>优化生产环境</strong>：安全性、扩展性、监控与成本管理
- <strong>构建多代理解决方案</strong>：部署复杂的 AI 架构

## 🗺️ 课程地图：按章节快速导航

每一章都有专门的 README，包含学习目标、快速入门和练习：

| 章节 | 主题 | 课程 | 时长 | 复杂度 |
|---------|-------|---------|----------|------------|
| **[第 1 章：基础](docs/chapter-01-foundation/README.md)** | 入门 | [AZD 基础](docs/chapter-01-foundation/azd-basics.md) &#124; [安装](docs/chapter-01-foundation/installation.md) &#124; [第一个项目](docs/chapter-01-foundation/first-project.md) | 30-45 分钟 | ⭐ |
| **[第2章：AI 开发](docs/chapter-02-ai-development/README.md)** | 以 AI 为先的应用 | [Foundry 集成](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI 代理](docs/chapter-02-ai-development/agents.md) &#124; [模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [工作坊](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 小时 | ⭐⭐ |
| **[第3章：配置](docs/chapter-03-configuration/README.md)** | 认证与安全 | [配置](docs/chapter-03-configuration/configuration.md) &#124; [认证与安全](docs/chapter-03-configuration/authsecurity.md) | 45-60 分钟 | ⭐⭐ |
| **[第4章：基础设施](docs/chapter-04-infrastructure/README.md)** | IaC 与部署 | [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [资源预配](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 小时 | ⭐⭐⭐ |
| **[第5章：多智能体](docs/chapter-05-multi-agent/README.md)** | AI 代理解决方案 | [零售场景](examples/retail-scenario.md) &#124; [协调模式](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 小时 | ⭐⭐⭐⭐ |
| **[第6章：部署前](docs/chapter-06-pre-deployment/README.md)** | 规划与验证 | [预检检查](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [容量规划](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU 选择](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [应用洞察](docs/chapter-06-pre-deployment/application-insights.md) | 1 小时 | ⭐⭐ |
| **[第7章：故障排查](docs/chapter-07-troubleshooting/README.md)** | 调试与修复 | [常见问题](docs/chapter-07-troubleshooting/common-issues.md) &#124; [调试](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI 问题](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 小时 | ⭐⭐ |
| **[第8章：生产](docs/chapter-08-production/README.md)** | 企业模式 | [生产实践](docs/chapter-08-production/production-ai-practices.md) | 2-3 小时 | ⭐⭐⭐⭐ |
| **[🎓 工作坊](workshop/README.md)** | 动手实验 | [介绍](workshop/docs/instructions/0-Introduction.md) &#124; [选择](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [验证](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [拆解](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [配置](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [自定义](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [清理](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [总结](workshop/docs/instructions/7-Wrap-up.md) | 3-4 小时 | ⭐⭐ |

**总课程时长：** ~10-14 小时 | **技能进阶：** 初学者 → 生产就绪

---

## 📚 学习章节

<em>根据经验水平和目标选择学习路径</em>

### 🚀 第1章：基础与快速开始
<strong>先决条件</strong>：Azure 订阅，基础命令行知识  
<strong>时长</strong>：30-45 分钟  
<strong>复杂度</strong>：⭐

#### 你将学到的内容
- 了解 Azure Developer CLI 的基础知识
- 在你的平台上安装 AZD
- 完成你的第一次成功部署

#### 学习资源
- **🎯 从这里开始**： [什么是 Azure Developer CLI？](#what-is-azure-developer-cli)
- **📖 理论**： [AZD 基础](docs/chapter-01-foundation/azd-basics.md) - 核心概念与术语
- **⚙️ 设置**： [安装与设置](docs/chapter-01-foundation/installation.md) - 平台特定指南
- **🛠️ 实操**： [你的第一个项目](docs/chapter-01-foundation/first-project.md) - 逐步教程
- **📋 快速参考**： [命令速查表](resources/cheat-sheet.md)

#### 实践练习
```bash
# 快速安装检查
azd version

# 部署您的第一个应用程序
azd init --template todo-nodejs-mongo
azd up
```

**💡 章节成果**： 使用 AZD 成功将一个简单的 Web 应用部署到 Azure

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
**📈 学习后技能水平：** 能够独立部署基础应用
**📈 学习后技能水平：** 能够独立部署基础应用

---

### 🤖 第2章：以 AI 为先的开发（推荐给 AI 开发者）
<strong>先决条件</strong>：完成第1章  
<strong>时长</strong>：1-2 小时  
<strong>复杂度</strong>：⭐⭐

#### 你将学到的内容
- Microsoft Foundry 与 AZD 的集成
- 部署 AI 驱动的应用
- 理解 AI 服务配置

#### 学习资源
- **🎯 从这里开始**： [Microsoft Foundry 集成](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI 代理**： [AI 代理指南](docs/chapter-02-ai-development/agents.md) - 使用 AZD 部署智能代理
- **📖 模式**： [AI 模型部署](docs/chapter-02-ai-development/ai-model-deployment.md) - 部署和管理 AI 模型
- **🛠️ 工作坊**： [AI 工作坊实验](docs/chapter-02-ai-development/ai-workshop-lab.md) - 使你的 AI 解决方案适配 AZD
- **🎥 交互式指南**： [工作坊资料](workshop/README.md) - 基于浏览器的 MkDocs * DevContainer 环境学习
- **📋 模板**： [Microsoft Foundry 模板](#工作坊资源)
- **📝 示例**： [AZD 部署示例](examples/README.md)

#### 实践练习
```bash
# 部署你的第一个 AI 应用
azd init --template azure-search-openai-demo
azd up

# 尝试更多 AI 模板
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 章节成果**： 部署并配置具备 RAG 能力的 AI 驱动聊天应用

**✅ 成功验证：**
```bash
# 在第2章之后，您应该能够：
azd init --template azure-search-openai-demo
azd up
# 测试 AI 聊天界面
# 提出问题并获得带来源的 AI 回答
# 验证搜索集成是否正常工作
azd monitor  # 检查 Application Insights 是否显示遥测数据
azd down --force --purge
```

**📊 时间投入：** 1-2 小时  
**📈 学习后技能水平：** 能够部署并配置生产就绪的 AI 应用  
**💰 成本意识：** 了解每月 $80-150 的开发成本，生产环境每月 $300-3500 的成本

#### 💰 AI 部署的成本考虑

**开发环境（估计每月 $80-150）：**
- Microsoft Foundry 模型（按使用付费）：每月 $0-50（基于令牌使用量）
- AI Search（基础层）：每月 $75
- Container Apps（按量计费）：每月 $0-20
- 存储（标准）：每月 $1-5

**生产环境（估计每月 $300-3,500+）：**
- Microsoft Foundry 模型（使用 PTU 以保证稳定性能）：每月 $3,000+ 或者在高流量下按使用付费
- AI Search（标准层）：每月 $250
- Container Apps（专用）：每月 $50-100
- Application Insights：每月 $5-50
- 存储（高级）：每月 $10-50

**💡 成本优化建议：**
- 在学习阶段使用 <strong>免费层</strong> Microsoft Foundry 模型（包含 Azure OpenAI 每月 50,000 个令牌）
- 在不进行主动开发时运行 `azd down` 来释放资源
- 初期使用按量计费，仅在生产环境时升级到 PTU
- 使用 `azd provision --preview` 在部署前估算成本
- 启用自动缩放：仅为实际使用付费

**成本监控：**
```bash
# 检查估算的每月费用
azd provision --preview

# 在 Azure 门户中监控实际费用
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第3章：配置与认证
<strong>先决条件</strong>：完成第1章  
<strong>时长</strong>：45-60 分钟  
<strong>复杂度</strong>：⭐⭐

#### 你将学到的内容
- 环境配置与管理
- 认证与安全最佳实践
- 资源命名与组织

#### 学习资源
- **📖 配置**： [配置指南](docs/chapter-03-configuration/configuration.md) - 环境设置
- **🔐 安全**： [认证模式与托管身份](docs/chapter-03-configuration/authsecurity.md) - 认证模式
- **📝 示例**： [数据库应用示例](examples/database-app/README.md) - AZD 数据库示例

#### 实践练习
- 配置多个环境（dev、staging、prod）
- 设置托管身份认证
- 实施基于环境的特定配置

**💡 章节成果**： 使用适当的认证和安全措施管理多个环境

---

### 🏗️ 第4章：基础设施即代码与部署
<strong>先决条件</strong>：完成第1-3章  
<strong>时长</strong>：1-1.5 小时  
<strong>复杂度</strong>：⭐⭐⭐

#### 你将学到的内容
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

**💡 章节成果**： 使用自定义基础设施模板部署复杂的多服务应用

---

### 🎯 第5章：多智能体 AI 解决方案（高级）
<strong>先决条件</strong>：完成第1-2章  
<strong>时长</strong>：2-3 小时  
<strong>复杂度</strong>：⭐⭐⭐⭐

#### 你将学到的内容
- 多智能体架构模式
- 代理编排与协调
- 面向生产的 AI 部署

#### 学习资源
- **🤖 重点项目**： [零售多智能体解决方案](examples/retail-scenario.md) - 完整实现
- **🛠️ ARM 模板**： [ARM 模板包](../../examples/retail-multiagent-arm-template) - 一键部署
- **📖 架构**： [多智能体协调模式](docs/chapter-06-pre-deployment/coordination-patterns.md) - 模式

#### 实践练习
```bash
# 部署完整的零售多智能体解决方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索智能体配置
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 章节成果**： 部署并管理一个包含客户与库存代理的面向生产的多智能体 AI 解决方案

---

### 🔍 第6章：部署前验证与规划
<strong>先决条件</strong>：完成第4章  
<strong>时长</strong>：1 小时  
<strong>复杂度</strong>：⭐⭐

#### 你将学到的内容
- 容量规划与资源验证
- SKU 选择策略
- 预检检查与自动化

#### 学习资源
- **📊 规划**： [容量规划](docs/chapter-06-pre-deployment/capacity-planning.md) - 资源验证
- **💰 选择**： [SKU 选择](docs/chapter-06-pre-deployment/sku-selection.md) - 成本效益选择
- **✅ 验证**： [预检检查](docs/chapter-06-pre-deployment/preflight-checks.md) - 自动化脚本

#### 实践练习
- 运行容量验证脚本
- 优化 SKU 选择以降低成本
- 实施自动化部署前检查

**💡 章节成果**： 在执行前验证并优化部署

---

### 🚨 第7章：故障排查与调试
<strong>先决条件</strong>：完成任一部署章节  
<strong>时长</strong>：1-1.5 小时  
<strong>复杂度</strong>：⭐⭐

#### 你将学到的内容
- 系统化调试方法
- 常见问题及解决方案
- AI 特定的故障排查

#### 学习资源
- **🔧 常见问题**： [常见问题](docs/chapter-07-troubleshooting/common-issues.md) - 常见问答与解决方案
- **🕵️ 调试**： [调试指南](docs/chapter-07-troubleshooting/debugging.md) - 逐步策略
- **🤖 AI 问题**： [AI 专用故障排查](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI 服务问题

#### 实践练习
- 诊断部署失败
- 解决认证问题
- 调试 AI 服务连接性

**💡 章节成果**： 独立诊断并解决常见部署问题

---

### 🏢 第8章：生产与企业模式
<strong>先决条件</strong>：完成第1-4章  
<strong>时长</strong>：2-3 小时  
<strong>复杂度</strong>：⭐⭐⭐⭐

#### 你将学到的内容
- 生产部署策略
- 企业安全模式
- 监控与成本优化

#### 学习资源
- **🏭 生产**: [生产 AI 最佳实践](docs/chapter-08-production/production-ai-practices.md) - 企业模式
- **📝 示例**: [微服务示例](../../examples/microservices) - 复杂架构
- **📊 监控**: [Application Insights 集成](docs/chapter-06-pre-deployment/application-insights.md) - 监控

#### 实践练习
- 实施企业安全模式
- 设置全面监控
- 以适当治理将应用部署到生产环境

**💡 章节成果**: 部署具备完整生产能力的企业就绪应用

---

## 🎓 工作坊概览：实践学习体验

> **⚠️ 工作坊状态：开发中**  
> 该工作坊材料目前正在开发和完善。核心模块可用，但某些高级部分尚不完整。我们正在积极完善所有内容。 [查看进展 →](workshop/README.md)

### 互动工作坊材料
<strong>使用基于浏览器的工具与引导式练习的全面实践学习</strong>

我们的工作坊材料提供结构化的互动学习体验，补充上文的章节式课程。该工作坊既适合自学，也适合讲师主导的课程。

#### 🛠️ 工作坊特色
- <strong>基于浏览器的界面</strong>: 完整的 MkDocs 驱动工作坊，具有搜索、复制和主题功能
- **GitHub Codespaces 集成**: 一键开发环境设置
- <strong>结构化学习路径</strong>: 8 个模块的引导练习（总计 3-4 小时）
- <strong>渐进方法论</strong>: 介绍 → 选择 → 验证 → 解构 → 配置 → 定制 → 清理 → 总结
- **交互式 DevContainer 环境**: 预配置工具和依赖项

#### 📚 工作坊模块结构
该工作坊遵循一个<strong>8 模块的渐进方法论</strong>，带你从探索到部署精通：

| 模块 | 主题 | 你将做什么 | 时长 |
|--------|-------|----------------|----------|
| **0. 介绍** | 工作坊概览 | 理解学习目标、先决条件和工作坊结构 | 15 分钟 |
| **1. 选择** | 模板发现 | 浏览 AZD 模板并为你的场景选择合适的 AI 模板 | 20 分钟 |
| **2. 验证** | 部署与验证 | 使用 `azd up` 部署模板并验证基础设施是否正常运行 | 30 分钟 |
| **3. 解构** | 理解结构 | 使用 GitHub Copilot 探索模板架构、Bicep 文件和代码组织 | 30 分钟 |
| **4. 配置** | 深入 azure.yaml | 掌握 `azure.yaml` 配置、生命周期钩子和环境变量 | 30 分钟 |
| **5. 定制** | 使其属于你 | 启用 AI 搜索、跟踪、评估，并根据你的场景进行自定义 | 45 分钟 |
| **6. 拆除** | 清理 | 使用 `azd down --purge` 安全释放资源 | 15 分钟 |
| **7. 总结** | 下一步 | 回顾成果、关键概念，并继续你的学习旅程 | 15 分钟 |

**工作坊流程：**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 开始工作坊
```bash
# 选项 1：GitHub Codespaces（推荐）
# 在仓库中点击“Code” → “Create codespace on main”

# 选项 2：本地开发
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 按照 workshop/README.md 中的设置说明进行操作
```

#### 🎯 工作坊学习成果
完成工作坊后，参与者将：
- **部署生产级 AI 应用**: 使用 AZD 配合 Microsoft Foundry 服务
- <strong>掌握多代理架构</strong>: 实现协调的 AI 代理解决方案
- <strong>实施安全最佳实践</strong>: 配置认证和访问控制
- <strong>为规模优化</strong>: 设计具有成本效益且高性能的部署
- <strong>排查部署问题</strong>: 独立解决常见问题

#### 📖 工作坊资源
- **🎥 互动指南**: [工作坊材料](workshop/README.md) - 基于浏览器的学习环境
- **📋 模块逐项说明**:
  - [0. 介绍](workshop/docs/instructions/0-Introduction.md) - 工作坊概览和目标
  - [1. 选择](workshop/docs/instructions/1-Select-AI-Template.md) - 查找并选择 AI 模板
  - [2. 验证](workshop/docs/instructions/2-Validate-AI-Template.md) - 部署并验证模板
  - [3. 解构](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - 探索模板架构
  - [4. 配置](workshop/docs/instructions/4-Configure-AI-Template.md) - 精通 azure.yaml
  - [5. 定制](workshop/docs/instructions/5-Customize-AI-Template.md) - 根据你的场景进行自定义
  - [6. 拆除](workshop/docs/instructions/6-Teardown-Infrastructure.md) - 清理资源
  - [7. 总结](workshop/docs/instructions/7-Wrap-up.md) - 回顾与下一步
- **🛠️ AI 工作坊实验室**: [AI 工作坊实验室](docs/chapter-02-ai-development/ai-workshop-lab.md) - 面向 AI 的练习
- **💡 快速开始**: [工作坊设置指南](workshop/README.md#quick-start) - 环境配置

<strong>适合对象</strong>: 企业培训、大学课程、自主学习和开发者训练营。

---

## 📖 深入探讨：AZD 能力

除了基础功能，AZD 为生产部署提供强大的功能：

- <strong>基于模板的部署</strong> - 使用预构建模板用于常见应用模式
- <strong>基础设施即代码</strong> - 使用 Bicep 或 Terraform 管理 Azure 资源  
- <strong>集成工作流</strong> - 无缝地配置、部署和监控应用
- <strong>对开发者友好</strong> - 优化开发者的生产力和体验

### **AZD + Microsoft Foundry：AI 部署的理想选择**

**为什么选择 AZD 用于 AI 解决方案？** AZD 解决了 AI 开发者面临的主要挑战：

- **AI 就绪模板** - 为 Microsoft Foundry 模型、认知服务和机器学习工作负载提供预配置模板
- **安全的 AI 部署** - 为 AI 服务、API 密钥和模型端点提供内置安全模式  
- **生产级 AI 模式** - 针对可扩展且具有成本效益的 AI 应用部署的最佳实践
- **端到端 AI 工作流** - 从模型开发到带有适当监控的生产部署
- <strong>成本优化</strong> - 针对 AI 工作负载的智能资源分配和伸缩策略
- **与 Microsoft Foundry 集成** - 与 Microsoft Foundry 模型目录和端点的无缝连接

---

## 🎯 模板与示例库

### 精选：Microsoft Foundry 模板
**如果你要部署 AI 应用，请从这里开始！**

> **注意：** 这些模板展示了各种 AI 模式。部分来自外部的 Azure Samples，另一些是本地实现。

| 模板 | 章节 | 复杂度 | 服务 | 类型 |
|----------|---------|------------|----------|------|
| [**开始使用 AI 聊天**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第 2 章 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | 外部 |
| [**开始使用 AI 代理**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第 2 章 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| 外部 |
| [**Azure Search + OpenAI 演示**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第 2 章 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | 外部 |
| [**OpenAI 聊天应用 快速入门**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第 2 章 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第 5 章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso 聊天 RAG**](https://github.com/Azure-Samples/contoso-chat) | 第 8 章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | 外部 |
| [<strong>零售多代理解决方案</strong>](examples/retail-scenario.md) | 第 5 章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | <strong>本地</strong> |

### 精选：完整学习场景
**生产就绪的应用模板，映射到学习章节**

| 模板 | 学习章节 | 复杂度 | 关键学习点 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第 2 章 | ⭐ | 基础 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第 2 章 | ⭐⭐ | 使用 Azure AI Search 的 RAG 实现 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第 4 章 | ⭐⭐ | 文档智能集成 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第 5 章 | ⭐⭐⭐ | 代理框架与函数调用 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第 8 章 | ⭐⭐⭐ | 企业级 AI 编排 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第 5 章 | ⭐⭐⭐⭐ | 具有客户与库存代理的多代理架构 |

### 按示例类型学习

> **📌 本地示例 与 外部示例：**  
> <strong>本地示例</strong>（在此仓库中） = 可立即使用  
> <strong>外部示例</strong>（Azure Samples） = 从链接的仓库克隆

#### 本地示例（可立即使用）
- [<strong>零售多代理解决方案</strong>](examples/retail-scenario.md) - 完整的生产就绪实现，附带 ARM 模板
  - 多代理架构（客户代理 + 库存代理）
  - 全面的监控与评估
  - 通过 ARM 模板一键部署

#### 本地示例 - 容器应用（第 2-5 章）
**本仓库中的完整容器部署示例：**
- [<strong>容器应用示例</strong>](examples/container-app/README.md) - 完整的容器化部署指南
  - [简单的 Flask API](../../examples/container-app/simple-flask-api) - 带有 scale-to-zero 的基本 REST API
  - [微服务架构](../../examples/container-app/microservices) - 生产就绪的多服务部署
  - 快速入门、生产和高级部署模式
  - 监控、安全与成本优化指导

#### 外部示例 - 简单应用（第 1-2 章）
**克隆这些 Azure Samples 仓库以开始：**
- [简单 Web 应用 - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基础部署模式
- [静态网站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 静态内容部署
- [容器应用 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署

#### 外部示例 - 数据库集成（第 3-4 章）  
- [数据库应用 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 数据库连接模式
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 无服务器数据工作流

#### 外部示例 - 高级模式（第 4-8 章）
- [Java 微服务](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服务架构
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - 后台处理  
- [企业级 ML 管道](https://github.com/Azure-Samples/mlops-v2) - 生产就绪的 ML 模式

### 外部模板集合
- [**官方 AZD 模板库**](https://azure.github.io/awesome-azd/) - 官方与社区模板的精选集合
- [**Azure Developer CLI 模板**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 模板文档
- [<strong>示例目录</strong>](examples/README.md) - 本地学习示例及详细说明

---

## 📚 学习资源与参考

### 快速参考
- [<strong>命令速查表</strong>](resources/cheat-sheet.md) - 按章节组织的关键 azd 命令
- [<strong>术语表</strong>](resources/glossary.md) - Azure 和 azd 术语  
- [<strong>常见问题</strong>](resources/faq.md) - 按学习章节组织的常见问题
- [<strong>学习指南</strong>](resources/study-guide.md) - 全面的实践练习

### 实践工作坊
- [**AI 工作坊实验室**](docs/chapter-02-ai-development/ai-workshop-lab.md) - 使你的 AI 解决方案可通过 AZD 部署（2-3 小时）
- [<strong>互动工作坊</strong>](workshop/README.md) - 使用 MkDocs 和 GitHub Codespaces 的 8 模块引导练习
  - 遵循：介绍 → 选择 → 验证 → 解构 → 配置 → 定制 → 清理 → 总结

### 外部学习资源
- [Azure 开发者 CLI 文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架构中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 价格计算器](https://azure.microsoft.com/pricing/calculator/)
- [Azure 状态](https://status.azure.com/)

### 适用于您编辑器的 AI 代理技能
- [**skills.sh 上的 Microsoft Azure 技能**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 个开放代理技能，涵盖 Azure AI、Foundry、部署、诊断、成本优化等。可在 GitHub Copilot、Cursor、Claude Code 或任何受支持的代理中安装：
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 快速故障排除指南

**初学者常见问题及即时解决方案：**

<details>
<summary><strong>❌ "azd: 未找到命令"</strong></summary>

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
<summary><strong>❌ "未找到订阅" 或 "未设置订阅"</strong></summary>

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
# 重新进行身份验证
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
# AZD 会生成唯一名称，但如果发生冲突:
azd down --force --purge

# 然后在新的环境中重试
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 模板部署耗时过长</strong></summary>

**正常等待时间：**
- 简单 Web 应用：5-10 分钟
- 带数据库的应用：10-15 分钟
- AI 应用：15-25 分钟（OpenAI 资源配置较慢）

```bash
# 检查进度
azd show

# 如果卡住超过30分钟，请检查 Azure 门户：
azd monitor
# 查找失败的部署
```
</details>

<details>
<summary><strong>❌ "Permission denied" 或 "Forbidden"</strong></summary>

```bash
# 检查您的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 您至少需要“参与者”角色
# 请联系您的 Azure 管理员授予：
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

### 📚 完整故障排除资源

- **常见问题指南：** [详细解决方案](docs/chapter-07-troubleshooting/common-issues.md)
- **AI 特定问题：** [AI 故障排除](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **调试指南：** [逐步调试](docs/chapter-07-troubleshooting/debugging.md)
- **获取帮助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 课程完成与认证

### 进度跟踪
通过每章跟踪您的学习进度：

- [ ] **第 1 章**：基础与快速入门 ✅
- [ ] **第 2 章**：AI 优先开发 ✅  
- [ ] **第 3 章**：配置与身份验证 ✅
- [ ] **第 4 章**：基础设施即代码与部署 ✅
- [ ] **第 5 章**：多代理 AI 解决方案 ✅
- [ ] **第 6 章**：部署前验证与规划 ✅
- [ ] **第 7 章**：故障排除与调试 ✅
- [ ] **第 8 章**：生产与企业模式 ✅

### 学习验证
完成每章后，通过以下方式验证您的知识：
1. <strong>实践练习</strong>：完成本章的动手部署
2. <strong>知识检测</strong>：查看本章的常见问题解答部分
3. <strong>社区讨论</strong>：在 Azure Discord 分享您的经验
4. <strong>下一章</strong>：进入下一个复杂度级别

### 课程完成收益
完成所有章节后，您将获得：
- <strong>生产经验</strong>：将真实的 AI 应用部署到 Azure
- <strong>专业技能</strong>：具备面向企业的部署能力  
- <strong>社区认可</strong>：Azure 开发者社区的活跃成员
- <strong>职业晋升</strong>：备受需求的 AZD 与 AI 部署专长

---

## 🤝 社区与支持

### 获取帮助与支持
- <strong>技术问题</strong>： [报告错误和请求功能](https://github.com/microsoft/azd-for-beginners/issues)
- <strong>学习问题</strong>： [Microsoft Azure Discord 社区](https://discord.gg/microsoft-azure) 和 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 特定帮助**：加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- <strong>文档</strong>： [Azure 开发者 CLI 官方文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### 来自 Microsoft Foundry Discord 的社区洞察

**来自 #Azure 频道的最新投票结果：**
- **45%** 的开发者希望将 AZD 用于 AI 工作负载
- <strong>主要挑战</strong>：多服务部署、凭据管理、生产准备就绪  
- <strong>最常请求</strong>：AI 特定模板、故障排除指南、最佳实践

**加入我们的社区，您可以：**
- 分享您的 AZD + AI 经验并获取帮助
- 获取新 AI 模板的抢先预览
- 为 AI 部署最佳实践做出贡献
- 影响未来 AI + AZD 功能的开发

### 对课程的贡献
欢迎贡献！请阅读我们的 [贡献指南](CONTRIBUTING.md) 了解详细信息：
- <strong>内容改进</strong>：增强现有章节和示例
- <strong>新示例</strong>：添加真实世界场景和模板  
- <strong>翻译</strong>：帮助维护多语言支持
- <strong>错误报告</strong>：提高准确性和清晰度
- <strong>社区标准</strong>：遵循我们的包容性社区准则

---

## 📄 课程信息

### 许可
本项目采用 MIT 许可证 - 详情见 [LICENSE](../../LICENSE) 文件。

### 相关的 Microsoft 学习资源

我们的团队还制作了其他综合学习课程：

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j 初学者指南](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js 初学者指南](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain 初学者指南](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD 初学者指南](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI 初学者指南](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP 初学者指南](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI 代理 初学者指南](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![生成式 AI 初学者指南](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### 核心学习
[![机器学习 初学者指南](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![数据科学 初学者指南](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI 初学者指南](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![网络安全 初学者指南](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web 开发 初学者指南](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![物联网 初学者指南](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR 开发 初学者指南](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot 系列
[![用于 AI 配对编程的 Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![用于 C#/.NET 的 Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot 冒险](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ 课程导航

**🚀 准备开始学习了吗？**

<strong>初学者</strong>：从 [第 1 章：基础与快速入门](#-chapter-1-foundation--quick-start)  
**AI 开发者**：跳至 [第 2 章：以 AI 为先的开发](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
<strong>资深开发者</strong>：从 [第 3 章：配置与身份验证](#️-chapter-3-configuration--authentication) 开始

<strong>下一步</strong>： [开始第1章 - AZD 基础](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
本文档已使用 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。虽然我们努力确保准确性，但请注意自动翻译可能包含错误或不准确之处。原始语言版本的文档应被视为权威来源。对于重要信息，建议使用专业人工翻译。对于因使用本翻译而产生的任何误解或误释，我们概不负责。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->