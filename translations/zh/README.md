<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6c3d0f9ef66c2cd692a55a2811d9c3e5",
  "translation_date": "2025-09-15T14:50:50+00:00",
  "source_file": "README.md",
  "language_code": "zh"
}
-->
# AZD 初学者指南

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.zh.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

按照以下步骤开始使用这些资源：
1. **Fork 仓库**：点击 [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **克隆仓库**：`git clone https://github.com/microsoft/azd-for-beginners.git`
3. [**加入 Azure Discord 社区，与专家和开发者交流**](https://discord.com/invite/ByRwuEEgH4)

### 多语言支持

#### 通过 GitHub Action 支持（自动化且始终保持最新）

[法语](../fr/README.md) | [西班牙语](../es/README.md) | [德语](../de/README.md) | [俄语](../ru/README.md) | [阿拉伯语](../ar/README.md) | [波斯语 (法尔西)](../fa/README.md) | [乌尔都语](../ur/README.md) | [中文 (简体)](./README.md) | [中文 (繁体，澳门)](../mo/README.md) | [中文 (繁体，香港)](../hk/README.md) | [中文 (繁体，台湾)](../tw/README.md) | [日语](../ja/README.md) | [韩语](../ko/README.md) | [印地语](../hi/README.md) | [孟加拉语](../bn/README.md) | [马拉地语](../mr/README.md) | [尼泊尔语](../ne/README.md) | [旁遮普语 (古木基文)](../pa/README.md) | [葡萄牙语 (葡萄牙)](../pt/README.md) | [葡萄牙语 (巴西)](../br/README.md) | [意大利语](../it/README.md) | [波兰语](../pl/README.md) | [土耳其语](../tr/README.md) | [希腊语](../el/README.md) | [泰语](../th/README.md) | [瑞典语](../sv/README.md) | [丹麦语](../da/README.md) | [挪威语](../no/README.md) | [芬兰语](../fi/README.md) | [荷兰语](../nl/README.md) | [希伯来语](../he/README.md) | [越南语](../vi/README.md) | [印尼语](../id/README.md) | [马来语](../ms/README.md) | [他加禄语 (菲律宾语)](../tl/README.md) | [斯瓦希里语](../sw/README.md) | [匈牙利语](../hu/README.md) | [捷克语](../cs/README.md) | [斯洛伐克语](../sk/README.md) | [罗马尼亚语](../ro/README.md) | [保加利亚语](../bg/README.md) | [塞尔维亚语 (西里尔文)](../sr/README.md) | [克罗地亚语](../hr/README.md) | [斯洛文尼亚语](../sl/README.md) | [乌克兰语](../uk/README.md) | [缅甸语 (缅甸)](../my/README.md)

**如果您希望支持其他语言，请查看 [这里](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## 简介

欢迎来到 Azure Developer CLI (azd) 的全面指南。本仓库旨在帮助从学生到专业开发者的各类开发者学习和掌握 Azure Developer CLI，以高效进行云部署，**特别是专注于使用 Azure AI Foundry 部署 AI 应用**。本结构化学习资源提供了 Azure 云部署的实践经验，解决常见问题，并实施成功部署 AZD 模板的最佳实践。

### **为什么这份指南对 AI 开发者至关重要**
根据我们最近在 Azure AI Foundry Discord 社区的调查，**45% 的开发者对使用 AZD 进行 AI 工作负载感兴趣**，但面临以下挑战：
- 复杂的多服务 AI 架构
- 生产级 AI 部署的最佳实践
- Azure AI 服务的集成与配置
- AI 工作负载的成本优化
- AI 特定部署问题的排查

## 学习目标

通过学习本仓库内容，您将：
- 掌握 Azure Developer CLI 的基础知识和核心概念
- 学习如何使用基础设施即代码部署和配置 Azure 资源
- 发展解决常见 AZD 部署问题的能力
- 理解部署前的验证和容量规划
- 实施安全性最佳实践和成本优化策略
- 建立信心，将生产级应用部署到 Azure

## 学习成果

完成本课程后，您将能够：
- 成功安装、配置并使用 Azure Developer CLI
- 使用 AZD 模板创建并部署应用
- 排查认证、基础设施和部署问题
- 执行部署前检查，包括容量规划和 SKU 选择
- 实施监控、安全性和成本管理的最佳实践
- 将 AZD 工作流集成到 CI/CD 管道中

## 目录

- [什么是 Azure Developer CLI？](../..)
- [快速开始](../..)
- [学习路径](../..)
  - [针对 AI 开发者（推荐从这里开始！）](../..)
  - [针对学生和初学者](../..)
  - [针对开发者](../..)
  - [针对 DevOps 工程师](../..)
- [文档](../..)
  - [入门指南](../..)
  - [部署与配置](../..)
  - [部署前检查](../..)
  - [AI 与 Azure AI Foundry](../..)
  - [故障排除](../..)
- [示例与模板](../..)
  - [精选：Azure AI Foundry 模板](../..)
  - [精选：Azure AI Foundry 端到端场景](../..)
  - [其他 AZD 模板](../..)
  - [实践实验与工作坊](../..)
- [资源](../..)
- [贡献](../..)
- [支持](../..)
- [社区](../..)

## 什么是 Azure Developer CLI？

Azure Developer CLI (azd) 是一个以开发者为中心的命令行工具，旨在加速构建和部署 Azure 应用的过程。它提供：

- **基于模板的部署** - 使用预构建模板实现常见应用模式
- **基础设施即代码** - 使用 Bicep 或 Terraform 管理 Azure 资源
- **集成工作流** - 无缝实现资源配置、部署和监控
- **开发者友好** - 优化开发者的生产力和体验

### **AZD + Azure AI Foundry：AI 部署的完美组合**

**为什么选择 AZD 进行 AI 解决方案部署？** AZD 解决了 AI 开发者面临的主要挑战：

- **AI 就绪模板** - 为 Azure OpenAI、认知服务和机器学习工作负载预配置模板
- **安全的 AI 部署** - 内置 AI 服务、API 密钥和模型端点的安全模式
- **生产级 AI 模式** - 可扩展、成本优化的 AI 应用部署最佳实践
- **端到端 AI 工作流** - 从模型开发到生产部署，配备完善的监控
- **成本优化** - 智能资源分配和扩展策略
- **Azure AI Foundry 集成** - 无缝连接到 AI Foundry 模型目录和端点

## 快速开始

### 前提条件
- Azure 订阅
- 已安装 Azure CLI
- Git（用于克隆模板）

### 安装
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### 第一次部署
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```

### 第一次 AI 部署
```bash
# Initialize an AI-powered chat application with Azure OpenAI
azd init --template azure-search-openai-demo

# Configure AI services and deploy
azd up

# Or try other AI templates:
azd init --template openai-chat-app-quickstart
azd init --template ai-document-processing
azd init --template contoso-chat
```

## 学习路径

### 针对 AI 开发者（推荐从这里开始！）
1. **快速开始**：尝试 [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) 模板
2. **学习基础知识**：[AZD 基础](docs/getting-started/azd-basics.md) + [Azure AI Foundry 集成](docs/ai-foundry/azure-ai-foundry-integration.md)
3. **实践操作**：完成 [AI 工作坊实验](docs/ai-foundry/ai-workshop-lab.md)
4. **生产级准备**：查看 [生产级 AI 最佳实践](docs/ai-foundry/production-ai-practices.md)
5. **进阶**：部署 [contoso-chat](https://github.com/Azure-Samples/contoso-chat) 企业模板

### 针对学生和初学者
1. 从 [AZD 基础](docs/getting-started/azd-basics.md) 开始
2. 按照 [安装指南](docs/getting-started/installation.md) 操作
3. 完成 [您的第一个项目](docs/getting-started/first-project.md)
4. 练习 [简单 Web 应用示例](../../examples/simple-web-app)

### 针对开发者
1. 查看 [配置指南](docs/getting-started/configuration.md)
2. 学习 [部署指南](docs/deployment/deployment-guide.md)
3. 完成 [数据库应用示例](../../examples/database-app)
4. 探索 [容器应用示例](../../examples/container-app)

### 针对 DevOps 工程师
1. 掌握 [资源配置](docs/deployment/provisioning.md)
2. 实施 [预检检查](docs/pre-deployment/preflight-checks.md)
3. 练习 [容量规划](docs/pre-deployment/capacity-planning.md)
4. 高级 [微服务示例](../../examples/microservices)

## 文档

### 入门指南
- [**AZD 基础**](docs/getting-started/azd-basics.md) - 核心概念和术语
- [**安装与设置**](docs/getting-started/installation.md) - 平台特定安装指南
- [**配置**](docs/getting-started/configuration.md) - 环境设置与认证
- [**您的第一个项目**](docs/getting-started/first-project.md) - 分步教程

### 部署与配置
- [**部署指南**](docs/deployment/deployment-guide.md) - 完整的部署工作流
- [**资源配置**](docs/deployment/provisioning.md) - Azure 资源管理

### 部署前检查
- [**容量规划**](docs/pre-deployment/capacity-planning.md) - Azure 资源容量验证
- [**SKU 选择**](docs/pre-deployment/sku-selection.md) - 选择合适的 Azure SKU
- [**预检检查**](docs/pre-deployment/preflight-checks.md) - 自动化验证脚本

### AI 与 Azure AI Foundry
- [**Azure AI Foundry 集成**](docs/ai-foundry/azure-ai-foundry-integration.md) - 将 AZD 与 Azure AI Foundry 服务连接
- [**AI 模型部署模式**](docs/ai-foundry/ai-model-deployment.md) - 使用 AZD 部署和管理 AI 模型
- [**AI 工作坊实验**](docs/ai-foundry/ai-workshop-lab.md) - 实践实验：让 AI 解决方案适配 AZD
- [**生产级 AI 最佳实践**](docs/ai-foundry/production-ai-practices.md) - AI 工作负载的安全性、扩展性和监控

### 故障排除
- [**常见问题**](docs/troubleshooting/common-issues.md) - 常见问题及解决方案
- [**调试指南**](docs/troubleshooting/debugging.md) - 分步调试策略  
- [**AI相关故障排查**](docs/troubleshooting/ai-troubleshooting.md) - AI服务和模型部署问题  

## 示例与模板  

### [精选：Azure AI Foundry 模板](https://ai.azure.com/resource/build/templates)  
**如果您正在部署AI应用程序，请从这里开始！**  

| 模板 | 描述 | 复杂度 | 服务 |
|------|------|--------|------|
| [**AI聊天入门**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 使用Azure容器应用创建并部署一个集成数据和遥测洞察的基础聊天应用 |⭐⭐ | AzureOpenAI + Azure AI模型推理API + Azure AI搜索 + Azure容器应用 + 应用洞察 |
| [**AI代理入门**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 使用Azure容器应用创建并部署一个基础代理应用，包含操作和遥测洞察 |⭐⭐ | Azure AI代理服务 + AzureOpenAI + Azure AI搜索 + Azure容器应用 + 应用洞察 |
| [**多代理工作流自动化**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 通过协调和管理一组AI代理来增强任务规划和自动化 |⭐⭐⭐ | AzureOpenAI + Azure AI代理服务 + 语义内核 + Azure CosmosDB + Azure容器应用 |
| [**从数据生成文档**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 加速生成合同、发票和投资提案等文档，通过从数据中查找和总结相关信息 |⭐⭐⭐ | AzureOpenAI + Azure AI搜索 + Azure AI服务 + Azure CosmosDB |
| [**通过代理改善客户会议**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 利用代理团队迁移遗留代码到现代语言 |⭐⭐⭐ | AzureOpenAI + Azure AI搜索 + Azure CosmosDB + Azure SQL数据库 |
| [**通过代理现代化代码**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 使用Azure容器应用创建并部署一个集成数据和遥测洞察的基础聊天应用 |⭐⭐⭐ | AzureOpenAI + Azure代理服务 + 语义内核 + Azure CosmosDB + Azure容器应用 |
| [**构建您的对话代理**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 利用高级对话理解创建和增强具有确定性和可控工作流的聊天机器人和代理 |⭐⭐⭐ | AI语言 + AzureOpenAI + AI搜索 + Azure存储 + Azure容器注册表 |
| [**从对话数据中解锁洞察**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 通过高级内容理解能力，从大量音频和文本数据集中发现洞察，提高联络中心效率 |⭐⭐⭐ | AzureOpenAI + AI搜索 + 语义内核 + Azure代理服务 + AI内容理解 |
| [**多模态内容处理**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 快速准确地处理索赔、发票、合同和其他文档，通过从非结构化内容中提取信息并映射到结构化格式。此模板支持文本、图像、表格和图形 |⭐⭐⭐⭐ | AzureOpenAI + Azure内容理解 + Azure CosmosDB + Azure容器应用 |

### 精选：Azure AI Foundry 端到端场景  
**如果您正在部署AI应用程序，请从这里开始！**  

| 模板 | 描述 | 复杂度 | 服务 |
|------|------|--------|------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 使用Azure OpenAI的简单聊天界面 | ⭐ | AzureOpenAI + 容器应用 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 支持RAG的聊天应用，集成Azure OpenAI | ⭐⭐ | AzureOpenAI + 搜索 + 应用服务 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 使用AI服务进行文档分析 | ⭐⭐ | Azure文档智能 + 函数 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 带函数调用的AI代理框架 | ⭐⭐⭐ | AzureOpenAI + Azure容器应用 + 函数 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 企业聊天，支持AI编排 | ⭐⭐⭐ | AzureOpenAI + Azure AI搜索 + 容器应用 |

### 其他AZD模板  
- [**示例目录**](examples/README.md) - 实用示例、模板和真实场景  
- [**Azure-Samples AZD模板**](https://github.com/Azure-Samples/azd-templates) - 官方Microsoft示例模板  
- [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) - 社区贡献的模板  

### 实践实验与工作坊  
- [**AI工作坊实验**](docs/ai-foundry/ai-workshop-lab.md) - **新**：让您的AI解决方案支持AZD部署  
- [**AZD初学者工作坊**](workshop/README.md) - 专注于AI代理AZD模板部署  

## 资源  

### 快速参考  
- [**命令速查表**](resources/cheat-sheet.md) - 必备azd命令  
- [**术语表**](resources/glossary.md) - Azure和azd术语  
- [**常见问题**](resources/faq.md) - 常见问题解答  
- [**学习指南**](resources/study-guide.md) - 综合学习目标和练习  

### 外部资源  
- [Azure开发者CLI文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure架构中心](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure定价计算器](https://azure.microsoft.com/pricing/calculator/)  
- [Azure状态](https://status.azure.com/)  

## 贡献  

我们欢迎贡献！请阅读我们的[贡献指南](CONTRIBUTING.md)，了解以下内容：  
- 如何提交问题和功能请求  
- 代码贡献指南  
- 文档改进  
- 社区标准  

## 支持  

- **问题**：[报告错误和请求功能](https://github.com/microsoft/azd-for-beginners/issues)  
- **讨论**：[Microsoft Azure Discord社区问答和讨论](https://discord.gg/microsoft-azure)  
- **AI相关支持**：加入[#Azure频道](https://discord.gg/microsoft-azure)，参与AZD + AI Foundry讨论  
- **电子邮件**：用于私人咨询  
- **Microsoft Learn**：[官方Azure开发者CLI文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

### 来自Azure AI Foundry Discord社区的洞察  

**#Azure频道的投票结果：**  
- **45%**的开发者希望使用AZD处理AI工作负载  
- **主要挑战**：多服务部署、凭证管理、生产准备  
- **最受欢迎的需求**：AI专属模板、故障排查指南、最佳实践  

**加入我们的社区以：**  
- 分享您的AZD + AI经验并获得帮助  
- 获取新AI模板的早期预览  
- 贡献AI部署最佳实践  
- 影响未来AI + AZD功能开发  

## 许可证  

此项目基于MIT许可证授权 - 详情请参阅[LICENSE](../../LICENSE)文件。  

## 其他课程  

我们的团队还制作了其他课程！请查看：  

- [**新** 初学者模型上下文协议(MCP)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI代理初学者课程](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [使用.NET的生成式AI初学者课程](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
- [生成式AI初学者课程](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [使用Java的生成式AI初学者课程](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
- [机器学习初学者课程](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
- [数据科学初学者课程](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI初学者课程](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
- [网络安全初学者课程](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)  
- [Web开发初学者课程](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
- [物联网初学者课程](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
- [XR开发初学者课程](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [掌握GitHub Copilot进行AI配对编程](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
- [掌握GitHub Copilot为C#/.NET开发者服务](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
- [选择您的Copilot冒险之旅](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  

---

**导航**  
- **下一课**：[AZD基础](docs/getting-started/azd-basics.md)  

---

**免责声明**：  
本文档使用AI翻译服务[Co-op Translator](https://github.com/Azure/co-op-translator)进行翻译。尽管我们努力确保准确性，但请注意，自动翻译可能包含错误或不准确之处。应以原始语言的文档作为权威来源。对于关键信息，建议使用专业人工翻译。对于因使用本翻译而引起的任何误解或误读，我们概不负责。