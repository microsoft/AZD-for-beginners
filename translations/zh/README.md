<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1caf5e63f84a4cdffbeb8d0fe5fa3fa8",
  "translation_date": "2025-12-21T11:56:33+00:00",
  "source_file": "README.md",
  "language_code": "zh"
}
-->
# AZD 入门：结构化学习旅程

![AZD 初学者](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.zh.png) 

[![GitHub 关注者](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub 分叉](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub 星标](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## 开始本课程

按照以下步骤开始你的 AZD 学习之旅：

1. **Fork 仓库**: 点击 [![GitHub 分叉](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **克隆仓库**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **加入社区**: [Azure Discord 社区](https://discord.com/invite/ByRwuEEgH4) 获取专家支持
4. **选择学习路径**: 选择下面一个与你经验相符的章节

### 多语言支持

#### 自动翻译（始终保持最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[阿拉伯语](../ar/README.md) | [孟加拉语](../bn/README.md) | [保加利亚语](../bg/README.md) | [缅甸语 (缅甸)](../my/README.md) | [中文（简体）](./README.md) | [中文（繁体，香港）](../hk/README.md) | [中文（繁体，澳门）](../mo/README.md) | [中文（繁体，台湾）](../tw/README.md) | [克罗地亚语](../hr/README.md) | [捷克语](../cs/README.md) | [丹麦语](../da/README.md) | [荷兰语](../nl/README.md) | [爱沙尼亚语](../et/README.md) | [芬兰语](../fi/README.md) | [法语](../fr/README.md) | [德语](../de/README.md) | [希腊语](../el/README.md) | [希伯来语](../he/README.md) | [印地语](../hi/README.md) | [匈牙利语](../hu/README.md) | [印尼语](../id/README.md) | [意大利语](../it/README.md) | [日语](../ja/README.md) | [卡纳达语](../kn/README.md) | [韩语](../ko/README.md) | [立陶宛语](../lt/README.md) | [马来语](../ms/README.md) | [马拉雅拉姆语](../ml/README.md) | [马拉地语](../mr/README.md) | [尼泊尔语](../ne/README.md) | [尼日利亚皮钦语](../pcm/README.md) | [挪威语](../no/README.md) | [波斯语 (Farsi)](../fa/README.md) | [波兰语](../pl/README.md) | [葡萄牙语（巴西）](../br/README.md) | [葡萄牙语（葡萄牙）](../pt/README.md) | [旁遮普语（古鲁姆基）](../pa/README.md) | [罗马尼亚语](../ro/README.md) | [俄语](../ru/README.md) | [塞尔维亚语（西里尔字母）](../sr/README.md) | [斯洛伐克语](../sk/README.md) | [斯洛文尼亚语](../sl/README.md) | [西班牙语](../es/README.md) | [斯瓦西里语](../sw/README.md) | [瑞典语](../sv/README.md) | [塔加洛语（菲律宾语）](../tl/README.md) | [泰米尔语](../ta/README.md) | [泰卢固语](../te/README.md) | [泰语](../th/README.md) | [土耳其语](../tr/README.md) | [乌克兰语](../uk/README.md) | [乌尔都语](../ur/README.md) | [越南语](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 课程概览

通过结构化章节掌握 Azure Developer CLI (azd)，以实现逐步学习。**特别关注与 Microsoft Foundry 集成的 AI 应用部署。**

### 为什么本课程对现代开发者至关重要

根据 Microsoft Foundry Discord 社区的见解，**45% 的开发者希望将 AZD 用于 AI 工作负载**，但遇到以下挑战：
- 复杂的多服务 AI 架构
- 生产环境 AI 部署最佳实践  
- Azure AI 服务集成与配置
- AI 工作负载的成本优化
- AI 特定部署问题的故障排除

### 学习目标

完成本结构化课程后，你将：
- **掌握 AZD 基础**：核心概念、安装与配置
- **部署 AI 应用**：将 AZD 与 Microsoft Foundry 服务一起使用
- **实现基础设施即代码**：使用 Bicep 模板管理 Azure 资源
- **故障排除部署**：解决常见问题并调试故障
- **为生产环境优化**：安全、扩展、监控与成本管理
- **构建多代理解决方案**：部署复杂的 AI 架构

## 📚 学习章节

*根据经验水平和目标选择你的学习路径*

### 🚀 第1章：基础与快速入门
**先决条件**：Azure 订阅、基本命令行知识  
**时长**：30-45 分钟  
**复杂度**：⭐

#### 你将学到什么
- 了解 Azure Developer CLI 的基础知识
- 在你的平台上安装 AZD
- 你的第一次成功部署

#### 学习资源
- **🎯 从这里开始**： [什么是 Azure Developer CLI？](../..)
- **📖 理论**： [AZD 基础](docs/getting-started/azd-basics.md) - 核心概念和术语
- **⚙️ 设置**： [安装与设置](docs/getting-started/installation.md) - 平台特定指南
- **🛠️ 实践**： [你的第一个项目](docs/getting-started/first-project.md) - 逐步教程
- **📋 快速参考**： [命令备忘单](resources/cheat-sheet.md)

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
azd show                # 显示正在运行的应用的 URL
# 应用在浏览器中打开并可正常运行
azd down --force --purge  # 清理资源
```

**📊 时间投入：** 30-45 分钟  
**📈 完成后技能水平：** 能独立部署基础应用

**✅ 成功验证：**
```bash
# 完成第1章后，你应该能够：
azd version              # 显示已安装的版本
azd init --template todo-nodejs-mongo  # 初始化项目
azd up                  # 部署到 Azure
azd show                # 显示运行中应用的 URL
# 应用在浏览器中打开并正常工作
azd down --force --purge  # 清理资源
```

**📊 时间投入：** 30-45 分钟  
**📈 完成后技能水平：** 能独立部署基础应用

---

### 🤖 第2章：以 AI 为先的开发（推荐给 AI 开发者）
**先决条件**：完成第1章  
**时长**：1-2 小时  
**复杂度**：⭐⭐

#### 你将学到什么
- Microsoft Foundry 与 AZD 的集成
- 部署 AI 驱动的应用
- 理解 AI 服务配置

#### 学习资源
- **🎯 从这里开始**： [Microsoft Foundry 集成](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 模式**： [AI 模型部署](docs/microsoft-foundry/ai-model-deployment.md) - 部署与管理 AI 模型
- **🛠️ 研讨会**： [AI 研讨会实验室](docs/microsoft-foundry/ai-workshop-lab.md) - 使你的 AI 解决方案符合 AZD 要求
- **🎥 互动指南**： [研讨会材料](workshop/README.md) - 基于浏览器的学习与 MkDocs * DevContainer 环境
- **📋 模板**： [Microsoft Foundry 模板](../..)
- **📝 示例**： [AZD 部署示例](examples/README.md)

#### 实践练习
```bash
# 部署你的第一个 AI 应用程序
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
# 提出问题并获得带来源的 AI 回答
# 验证搜索集成是否正常工作
azd monitor  # 检查 Application Insights 是否显示遥测
azd down --force --purge
```

**📊 时间投入：** 1-2 小时  
**📈 完成后技能水平：** 能部署并配置生产就绪的 AI 应用  
**💰 成本意识：** 了解开发环境每月约 $80-150，生产环境每月约 $300-3500 的成本

#### 💰 AI 部署的成本考量

**开发环境（估计 $80-150/月）：**
- Azure OpenAI（按使用付费）：$0-50/月（基于 token 使用量）
- AI Search（基础层）：$75/月
- Container Apps（按需）：$0-20/月
- 存储（标准）：$1-5/月

**生产环境（估计 $300-3,500+/月）：**
- Azure OpenAI（PTU 用于稳定性能）：$3,000+/月 或 在高用量下按使用付费
- AI Search（标准层）：$250/月
- Container Apps（专用）：$50-100/月
- Application Insights：$5-50/月
- 存储（高级）：$10-50/月

**💡 成本优化建议：**
- 在学习阶段使用 **免费层** Azure OpenAI（包含 50,000 tokens/月）
- 在不进行主动开发时运行 `azd down` 来释放资源
- 从按使用付费开始，仅在生产环境升级为 PTU
- 使用 `azd provision --preview` 在部署前估算成本
- 启用自动缩放：只为实际使用付费

**成本监控：**
```bash
# 查看预计的每月费用
azd provision --preview

# 在 Azure 门户中监控实际费用
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第3章：配置与身份验证
**先决条件**：完成第1章  
**时长**：45-60 分钟  
**复杂度**：⭐⭐

#### 你将学到什么
- 环境配置与管理
- 身份验证与安全最佳实践
- 资源命名与组织

#### 学习资源
- **📖 配置**： [配置指南](docs/getting-started/configuration.md) - 环境设置
- **🔐 安全**： [身份验证模式与托管身份](docs/getting-started/authsecurity.md) - 身份验证模式
- **📝 示例**： [数据库应用示例](examples/database-app/README.md) - AZD 数据库示例

#### 实践练习
- 配置多个环境（dev、staging、prod）
- 设置托管身份验证
- 实施环境特定的配置

**💡 章节成果**：通过正确的身份验证与安全管理多个环境

---

### 🏗️ 第4章：基础设施即代码与部署
**先决条件**：完成第1-3章  
**时长**：1-1.5 小时  
**复杂度**：⭐⭐⭐

#### 你将学到什么
- 高级部署模式
- 使用 Bicep 的基础设施即代码
- 资源配置策略

#### 学习资源
- **📖 部署**： [部署指南](docs/deployment/deployment-guide.md) - 完整工作流程
- **🏗️ 配置**： [资源配置](docs/deployment/provisioning.md) - Azure 资源管理
- **📝 示例**： [容器应用示例](../../examples/container-app) - 容器化部署

#### 实践练习
- 创建自定义 Bicep 模板
- 部署多服务应用
- 实施蓝绿部署策略

**💡 章节成果**：使用自定义基础设施模板部署复杂的多服务应用

---

### 🎯 第5章：多代理 AI 解决方案（高级）
**先决条件**：完成第1-2章  
**时长**：2-3 小时  
**复杂度**：⭐⭐⭐⭐

#### 你将学到什么
- 多代理架构模式
- 代理编排与协调
- 面向生产的 AI 部署

#### 学习资源
- **🤖 推荐项目**： [零售多代理解决方案](examples/retail-scenario.md) - 完整实现
- **🛠️ ARM 模板**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - 一键部署
- **📖 架构**: [多代理协调模式](/docs/pre-deployment/coordination-patterns.md) - 模式

#### 实践练习
```bash
# 部署完整的零售多智能体解决方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索智能体配置
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 章节成果**: 部署并管理一个面向生产的多代理 AI 解决方案，包含 Customer 和 Inventory 代理

---

### 🔍 第6章：部署前验证与规划
**先决条件**: 完成第4章  
**时长**: 1 小时  
**复杂度**: ⭐⭐

#### 你将学到的内容
- 容量规划与资源验证
- SKU 选择策略
- 部署前检查与自动化

#### 学习资源
- **📊 规划**: [容量规划](docs/pre-deployment/capacity-planning.md) - 资源验证
- **💰 选择**: [SKU Selection](docs/pre-deployment/sku-selection.md) - 成本效益的选择
- **✅ 验证**: [部署前检查](docs/pre-deployment/preflight-checks.md) - 自动化脚本

#### 实践练习
- 运行容量验证脚本
- 优化 SKU 选择以降低成本
- 实施自动化的部署前检查

**💡 章节成果**: 在执行前验证并优化部署

---

### 🚨 第7章：故障排查与调试
**先决条件**: 完成任一部署章节  
**时长**: 1-1.5 小时  
**复杂度**: ⭐⭐

#### 你将学到的内容
- 系统化的调试方法
- 常见问题及解决方案
- AI 特定的故障排查

#### 学习资源
- **🔧 常见问题**: [Common Issues](docs/troubleshooting/common-issues.md) - 常见问答与解决方案
- **🕵️ 调试**: [Debugging Guide](docs/troubleshooting/debugging.md) - 逐步策略
- **🤖 AI 问题**: [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - AI 服务问题

#### 实践练习
- 诊断部署失败
- 解决身份验证问题
- 调试 AI 服务连接性

**💡 章节成果**: 独立诊断并解决常见部署问题

---

### 🏢 第8章：生产与企业模式
**先决条件**: 完成第1-4章  
**时长**: 2-3 小时  
**复杂度**: ⭐⭐⭐⭐

#### 你将学到的内容
- 生产部署策略
- 企业安全模式
- 监控与成本优化

#### 学习资源
- **🏭 生产**: [Production AI Best Practices](docs/microsoft-foundry/production-ai-practices.md) - 企业模式
- **📝 示例**: [Microservices Example](../../examples/microservices) - 复杂架构
- **📊 监控**: [Application Insights integration](docs/pre-deployment/application-insights.md) - 监控

#### 实践练习
- 实施企业安全模式
- 设置全面监控
- 在适当治理下部署到生产环境

**💡 章节成果**: 部署具有完整生产能力的企业就绪应用

---

## 🎓 研讨会概览：动手学习体验

> **⚠️ 研讨会状态：开发中**  
> 研讨会材料当前正在开发和完善。核心模块可用，但某些高级部分尚未完成。我们正在积极完成所有内容。 [跟踪进度 →](workshop/README.md)

### 交互式研讨会材料
**使用基于浏览器的工具和引导练习的全方位动手学习**

我们的研讨会材料提供结构化的交互式学习体验，补充了上述基于章节的课程。该研讨会既适合自学，也适合讲师主导的课程。

#### 🛠️ 研讨会特点
- **基于浏览器的界面**: 完整的 MkDocs 驱动研讨会，具有搜索、复制和主题功能
- **GitHub Codespaces 集成**: 一键开发环境设置
- **结构化学习路径**: 7 步引导练习（总计 3.5 小时）
- **发现 → 部署 → 定制**: 渐进方法论
- **交互式 DevContainer 环境**: 预配置的工具和依赖

#### 📚 研讨会结构
研讨会遵循 **发现 → 部署 → 定制** 方法论：

1. **发现阶段**（45 分钟）
   - 探索 Microsoft Foundry 模板和服务
   - 理解多代理架构模式
   - 审查部署要求和先决条件

2. **部署阶段**（2 小时）
   - 使用 AZD 进行 AI 应用的动手部署
   - 配置 Azure AI 服务和端点
   - 实施安全与身份验证模式

3. **定制阶段**（45 分钟）
   - 为特定用例修改应用
   - 为生产部署进行优化
   - 实施监控和成本管理

#### 🚀 开始研讨会
```bash
# 选项 1：GitHub Codespaces（推荐）
# 在仓库中点击 "Code" → "Create codespace on main"

# 选项 2：本地开发
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 遵循 workshop/README.md 中的设置说明
```

#### 🎯 研讨会学习成果
完成研讨会后，参与者将：
- **部署生产级 AI 应用**: 使用 AZD 和 Microsoft Foundry 服务
- **掌握多代理架构**: 实现协调的 AI 代理解决方案
- **实施安全最佳实践**: 配置身份验证和访问控制
- **为规模优化**: 设计具有成本效益和高性能的部署
- **排查部署问题**: 独立解决常见问题

#### 📖 研讨会资源
- **🎥 互动指南**: [Workshop Materials](workshop/README.md) - 基于浏览器的学习环境
- **📋 逐步说明**: [Guided Exercises](../../workshop/docs/instructions) - 详细操作指南
- **🛠️ AI 研讨会实验室**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - 以 AI 为中心的练习
- **💡 快速开始**: [Workshop Setup Guide](workshop/README.md#quick-start) - 环境配置

**适合对象**: 企业培训、大学课程、自主学习和开发者训练营。

---

## 📖 什么是 Azure Developer CLI?

Azure Developer CLI (azd) 是一款以开发者为中心的命令行工具，加速将应用构建并部署到 Azure 的过程。它提供：

- **基于模板的部署** - 使用预构建模板来处理常见应用模式
- **基础设施即代码** - 使用 Bicep 或 Terraform 管理 Azure 资源  
- **集成工作流** - 无缝预配、部署并监控应用
- **对开发者友好** - 优化开发者的生产力和体验

### **AZD + Microsoft Foundry：AI 部署的理想选择**

**为什么选择 AZD 用于 AI 解决方案？** AZD 解决了 AI 开发者面临的主要挑战：

- **AI 就绪模板** - 为 Azure OpenAI、Cognitive Services 和 ML 工作负载预配置模板
- **安全的 AI 部署** - 针对 AI 服务、API 密钥和模型端点内置安全模式  
- **生产 AI 模式** - 可扩展且具成本效益的 AI 应用部署最佳实践
- **端到端 AI 工作流** - 从模型开发到生产部署并配备适当的监控
- **成本优化** - 针对 AI 工作负载的智能资源分配和扩展策略
- **Microsoft Foundry 集成** - 与 Microsoft Foundry 模型目录和端点的无缝连接

---

## 🎯 模板与示例库

### 精选：Microsoft Foundry 模板
**如果你要部署 AI 应用，从这里开始！**

> **注意：** 这些模板展示了各种 AI 模式。有些是外部 Azure Samples，另一些是本地实现。

| 模板 | 章节 | 复杂度 | 服务 | 类型 |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | 外部 |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第2章 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| 外部 |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | 外部 |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | 外部 |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **本地** |

### 精选：完整学习场景
**面向生产的应用模板，映射到学习章节**

| 模板 | 学习章节 | 复杂度 | 关键学习点 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | 基础 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | RAG 实现与 Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第4章 | ⭐⭐ | 文档智能集成 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | 代理框架和函数调用 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐ | 企业 AI 编排 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | 含 Customer 和 Inventory 代理的多代理架构 |

### 通过示例学习的类型

> **📌 本地与外部示例：**  
> **本地示例**（在本仓库中）= 可立即使用  
> **外部示例**（Azure Samples）= 从链接的仓库克隆

#### 本地示例（可立即使用）
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - 面向生产的完整实现，带有 ARM 模板
  - 多代理架构（Customer + Inventory 代理）
  - 全面的监控与评估
  - 通过 ARM 模板一键部署

#### 本地示例 - 容器应用（第2-5章）
**本仓库中的全面容器部署示例：**
- [**Container App Examples**](examples/container-app/README.md) - 容器化部署的完整指南
  - [简单 Flask API](../../examples/container-app/simple-flask-api) - 基础 REST API，支持 scale-to-zero
  - [微服务架构](../../examples/container-app/microservices) - 面向生产的多服务部署
  - 快速入门、生产和高级部署模式
  - 监控、安全与成本优化指南

#### 外部示例 - 简单应用（第1-2章）
**克隆这些 Azure Samples 仓库开始：**
- [简单 Web 应用 - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基础部署模式
- [静态网站 - React 单页应用](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 静态内容部署
- [容器应用 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署

#### 外部示例 - 数据库集成（第3-4章）  
- [数据库应用 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 数据库连接模式
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 无服务器数据工作流

#### 外部示例 - 高级模式（第4-8章）
- [Java 微服务](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服务架构
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - 后台处理  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - 面向生产的 ML 模式

### 外部模板集合
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - 官方和社区模板的精选集合
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 的模板文档
- [**Examples Directory**](examples/README.md) - 本地学习示例及详细说明

---

## 📚 学习资源与参考

### 快速参考
- [**命令备忘单**](resources/cheat-sheet.md) - 按章节组织的常用 azd 命令
- [**词汇表**](resources/glossary.md) - Azure 和 azd 术语  
- [**常见问题**](resources/faq.md) - 按学习章节组织的常见问题
- [**学习指南**](resources/study-guide.md) - 综合练习

### 实操工作坊
- [**AI Workshop Lab**](docs/microsoft-foundry/ai-workshop-lab.md) - 使你的 AI 解决方案可通过 AZD 部署 (2-3 小时)
- [**Interactive Workshop Guide**](workshop/README.md) - 基于浏览器的研讨会，使用 MkDocs 和 DevContainer 环境
- [**Structured Learning Path**](../../workshop/docs/instructions) -7 步引导练习 (Discovery → Deployment → Customization)
- [**AZD For Beginners Workshop**](workshop/README.md) - 完整的实操研讨会材料，集成 GitHub Codespaces

### 外部学习资源
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 快速故障排除指南

**初学者常见问题及即时解决方法：**

### ❌ "azd: 未找到命令"

```bash
# 先安装 AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# 验证安装
azd version
```

### ❌ "未找到订阅" or "未设置订阅"

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

### ❌ "InsufficientQuota" or "配额超出"

```bash
# 尝试使用不同的 Azure 区域
azd env set AZURE_LOCATION "westus2"
azd up

# 或在开发环境中使用更小的 SKU
# 编辑 infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" 在中途失败

```bash
# 选项 1：清理并重试
azd down --force --purge
azd up

# 选项 2：只修复基础设施
azd provision

# 选项 3：检查详细日志
azd show
azd logs
```

### ❌ "身份验证失败" or "令牌已过期"

```bash
# 重新验证身份
az logout
az login

azd auth logout
azd auth login

# 验证身份
az account show
```

### ❌ "资源已存在" or 命名冲突

```bash
# AZD 会生成唯一的名称，但如果发生冲突：
azd down --force --purge

# 然后在全新环境中重试
azd env new dev-v2
azd up
```

### ❌ 模板部署耗时过长

**正常等待时间：**
- 简单的 Web 应用：5-10 分钟
- 带数据库的应用：10-15 分钟
- AI 应用：15-25 分钟 (OpenAI 供应较慢)

```bash
# 检查进度
azd show

# 如果卡住超过30分钟，请检查 Azure 门户:
azd monitor
# 查找失败的部署
```

### ❌ "权限被拒绝" or "禁止访问"

```bash
# 检查你的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 你至少需要 "Contributor" 角色
# 请让你的 Azure 管理员授予:
# - Contributor (用于资源)
# - User Access Administrator (用于角色分配)
```

### ❌ 找不到已部署应用的 URL

```bash
# 显示所有服务端点
azd show

# 或打开 Azure 门户
azd monitor

# 检查特定服务
azd env get-values
# 查找 *_URL 变量
```

### 📚 完整的故障排除资源

- **常见问题指南：** [详细解决方案](docs/troubleshooting/common-issues.md)
- **AI 专用问题：** [AI 故障排除](docs/troubleshooting/ai-troubleshooting.md)
- **调试指南：** [逐步调试](docs/troubleshooting/debugging.md)
- **获取帮助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 快速故障排除指南

**初学者常见问题及即时解决方法：**

<details>
<summary><strong>❌ "azd: 未找到命令"</strong></summary>

```bash
# 先安装 AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
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
<summary><strong>❌ "InsufficientQuota" 或 "配额超出"</strong></summary>

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
<summary><strong>❌ "azd up" 在中途失败</strong></summary>

```bash
# 选项 1：清理并重试
azd down --force --purge
azd up

# 选项 2：仅修复基础设施
azd provision

# 选项 3：检查详细日志
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "身份验证失败" 或 "令牌已过期"</strong></summary>

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
<summary><strong>❌ "资源已存在" 或 命名冲突</strong></summary>

```bash
# AZD 生成唯一名称，但如果发生冲突：
azd down --force --purge

# 然后在新的环境中重试
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 模板部署耗时过长</strong></summary>

**正常等待时间：**
- 简单的 Web 应用：5-10 分钟
- 带数据库的应用：10-15 分钟
- AI 应用：15-25 分钟 (OpenAI 供应较慢)

```bash
# 检查进度
azd show

# 如果停滞超过30分钟，请检查 Azure 门户：
azd monitor
# 查找失败的部署
```
</details>

<details>
<summary><strong>❌ "权限被拒绝" 或 "禁止访问"</strong></summary>

```bash
# 检查您的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 您至少需要“Contributor”（参与者）角色
# 请让您的 Azure 管理员授予：
# - Contributor (用于资源)
# - User Access Administrator (用于角色分配)
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

### 📚 完整的故障排除资源

- **常见问题指南：** [详细解决方案](docs/troubleshooting/common-issues.md)
- **AI 专用问题：** [AI 故障排除](docs/troubleshooting/ai-troubleshooting.md)
- **调试指南：** [逐步调试](docs/troubleshooting/debugging.md)
- **获取帮助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 课程完成与认证

### 进度跟踪
跟踪每章的学习进度：

- [ ] **第 1 章**: 基础与快速入门 ✅
- [ ] **第 2 章**: 以 AI 为先的开发 ✅  
- [ ] **第 3 章**: 配置与身份验证 ✅
- [ ] **第 4 章**: 基础设施即代码与部署 ✅
- [ ] **第 5 章**: 多代理 AI 解决方案 ✅
- [ ] **第 6 章**: 部署前验证与规划 ✅
- [ ] **第 7 章**: 故障排查与调试 ✅
- [ ] **第 8 章**: 生产环境与企业模式 ✅

### 学习验证
完成每章后，通过以下方式验证你的知识：
1. **实践练习**：完成本章的动手部署
2. **知识检验**：查看本章的常见问题部分
3. **社区讨论**：在 Azure Discord 中分享你的经验
4. **下一章**：进入下一个复杂度级别

### 课程完成收益
完成所有章节后，你将获得：
- **生产经验**：将真实的 AI 应用部署到 Azure
- **专业技能**：具备企业级部署能力  
- **社区认可**：成为 Azure 开发者社区的活跃成员
- **职业发展**：掌握受欢迎的 AZD 与 AI 部署专长

---

## 🤝 社区与支持

### 获取帮助与支持
- **技术问题**： [报告错误和功能请求](https://github.com/microsoft/azd-for-beginners/issues)
- **学习问题**： [Microsoft Azure Discord 社区](https://discord.gg/microsoft-azure) 和 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 专用帮助**：加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **文档**： [官方 Azure Developer CLI 文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### 来自 Microsoft Foundry Discord 的社区见解

**#Azure 频道的最近投票结果：**
- **45%** 的开发者希望将 AZD 用于 AI 工作负载
- **主要挑战**：多服务部署、凭证管理、生产就绪性  
- **最常请求**：AI 专用模板、故障排除指南、最佳实践

**加入我们的社区以：**
- 分享你的 AZD + AI 经验并寻求帮助
- 获取新 AI 模板的早期预览
- 参与 AI 部署最佳实践的贡献
- 影响未来 AI + AZD 功能的发展

### 为课程做贡献
欢迎贡献！请阅读我们的 [贡献指南](CONTRIBUTING.md) 了解详细信息：
- **内容改进**：增强现有章节和示例
- **新示例**：添加真实世界场景和模板  
- **翻译**：协助维护多语言支持
- **错误报告**：提高准确性和清晰度
- **社区标准**：遵循我们的包容性社区指南

---

## 📄 课程信息

### 许可证
本项目依据 MIT 许可证发布 - 详情请参见 [LICENSE](../../LICENSE) 文件。

### 相关的 Microsoft 学习资源

我们的团队还制作了其他综合学习课程：

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j 入门](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js 入门](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

---

### Azure / Edge / MCP / 代理
[![AZD 入门](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI 入门](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP 入门](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents 入门](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### 生成式 AI 系列
[![生成式 AI 入门](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### 核心学习
[![ML 入门](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![数据科学 入门](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI 入门](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![网络安全入门](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web 开发入门](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![物联网入门](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR 开发入门](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot 系列
[![Copilot 面向 AI 配对编程](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot 适用于 C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot 冒险](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ 课程导航

**🚀 准备开始学习了吗？**

**初学者**：从 [第1章：基础与快速入门](../..) 开始  
**AI 开发者**：跳转到 [第2章：以 AI 为先的开发](../..)  
**有经验的开发者**：从 [第3章：配置与身份验证](../..) 开始

**下一步**： [开始第1章 - AZD 基础](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免责声明：
本文件已使用 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们力求准确，但请注意自动翻译可能包含错误或不准确之处。原始语言的原文应被视为具有权威性的来源。对于关键信息，建议采用专业人工翻译。因使用本翻译而产生的任何误解或错误解读，我们不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->