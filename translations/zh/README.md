<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3bd0e0644b110276e4364eb753ddcef8",
  "translation_date": "2025-09-09T16:21:35+00:00",
  "source_file": "README.md",
  "language_code": "zh"
}
-->
# AZD 初学者指南

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.zh.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)  
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)  
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)  

[![Azure Discord](https://dcbadge.limes.yellow/api/server/kzRShWzttr)](https://discord.gg/microsoft-azure)  
[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)  

按照以下步骤开始使用这些资源：  
1. **Fork 仓库**：点击 [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)  
2. **克隆仓库**：`git clone https://github.com/microsoft/azd-for-beginners.git`  
3. [**加入 Azure Discord 社区，与专家和开发者交流**](https://discord.com/invite/ByRwuEEgH4)  

### 🌐 多语言支持

#### 通过 GitHub Action 支持（自动更新，始终保持最新）

[法语](../fr/README.md) | [西班牙语](../es/README.md) | [德语](../de/README.md) | [俄语](../ru/README.md) | [阿拉伯语](../ar/README.md) | [波斯语](../fa/README.md) | [乌尔都语](../ur/README.md) | [中文（简体）](./README.md) | [中文（繁体，澳门）](../mo/README.md) | [中文（繁体，香港）](../hk/README.md) | [中文（繁体，台湾）](../tw/README.md) | [日语](../ja/README.md) | [韩语](../ko/README.md) | [印地语](../hi/README.md) | [孟加拉语](../bn/README.md) | [马拉地语](../mr/README.md) | [尼泊尔语](../ne/README.md) | [旁遮普语](../pa/README.md) | [葡萄牙语（葡萄牙）](../pt/README.md) | [葡萄牙语（巴西）](../br/README.md) | [意大利语](../it/README.md) | [波兰语](../pl/README.md) | [土耳其语](../tr/README.md) | [希腊语](../el/README.md) | [泰语](../th/README.md) | [瑞典语](../sv/README.md) | [丹麦语](../da/README.md) | [挪威语](../no/README.md) | [芬兰语](../fi/README.md) | [荷兰语](../nl/README.md) | [希伯来语](../he/README.md) | [越南语](../vi/README.md) | [印尼语](../id/README.md) | [马来语](../ms/README.md) | [他加禄语（菲律宾语）](../tl/README.md) | [斯瓦希里语](../sw/README.md) | [匈牙利语](../hu/README.md) | [捷克语](../cs/README.md) | [斯洛伐克语](../sk/README.md) | [罗马尼亚语](../ro/README.md) | [保加利亚语](../bg/README.md) | [塞尔维亚语（西里尔字母）](../sr/README.md) | [克罗地亚语](../hr/README.md) | [斯洛文尼亚语](../sl/README.md) | [乌克兰语](../uk/README.md) | [缅甸语](../my/README.md)  

**如果您希望支持其他语言，请查看 [这里](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**  

## 简介

欢迎来到 Azure Developer CLI (azd) 的全面指南。本仓库旨在帮助从学生到专业开发者的各类用户学习和掌握 Azure Developer CLI，以实现高效的云部署。通过结构化的学习资源，您将获得 Azure 云部署的实践经验，解决常见问题，并实施最佳实践以成功部署 AZD 模板。

## 学习目标

通过学习本仓库，您将能够：  
- 掌握 Azure Developer CLI 的基础知识和核心概念  
- 学习如何使用基础架构即代码部署和配置 Azure 资源  
- 发展解决常见 AZD 部署问题的技能  
- 理解部署前的验证和容量规划  
- 实施安全最佳实践和成本优化策略  
- 建立信心，将生产级应用部署到 Azure  

## 学习成果

完成本课程后，您将能够：  
- 成功安装、配置并使用 Azure Developer CLI  
- 使用 AZD 模板创建和部署应用  
- 解决认证、基础架构和部署问题  
- 执行部署前检查，包括容量规划和 SKU 选择  
- 实施监控、安全和成本管理的最佳实践  
- 将 AZD 工作流集成到 CI/CD 管道中  

## 目录

- [什么是 Azure Developer CLI？](../..)  
- [快速开始](../..)  
- [文档](../..)  
- [示例与模板](../..)  
- [资源](../..)  
- [贡献](../..)  

## 什么是 Azure Developer CLI？

Azure Developer CLI (azd) 是一个以开发者为中心的命令行工具，旨在加速构建和部署 Azure 应用的过程。它提供：  
- **基于模板的部署** - 使用预构建模板实现常见应用模式  
- **基础架构即代码** - 使用 Bicep 或 Terraform 管理 Azure 资源  
- **集成工作流** - 无缝配置、部署和监控应用  
- **开发者友好** - 优化开发者的生产力和体验  

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

## 文档

### 入门  
- [**AZD 基础**](docs/getting-started/azd-basics.md) - 核心概念和术语  
- [**安装与设置**](docs/getting-started/installation.md) - 平台特定安装指南  
- [**配置**](docs/getting-started/configuration.md) - 环境设置和认证  
- [**第一个项目**](docs/getting-started/first-project.md) - 分步教程  

### 部署与配置  
- [**部署指南**](docs/deployment/deployment-guide.md) - 完整的部署工作流  
- [**资源配置**](docs/deployment/provisioning.md) - Azure 资源管理  

### 部署前检查  
- [**容量规划**](docs/pre-deployment/capacity-planning.md) - Azure 资源容量验证  
- [**SKU 选择**](docs/pre-deployment/sku-selection.md) - 选择合适的 Azure SKU  
- [**预检脚本**](docs/pre-deployment/preflight-checks.md) - 自动化验证脚本  

### 故障排除  
- [**常见问题**](docs/troubleshooting/common-issues.md) - 常见问题及解决方案  
- [**调试指南**](docs/troubleshooting/debugging.md) - 分步调试策略  

## 示例与模板

### 入门模板  
- [**简单 Web 应用**](../../examples/simple-web-app) - 基础 Node.js Web 应用部署  
- [**静态网站**](../../examples/static-website) - 在 Azure 存储上托管静态网站  
- [**容器应用**](../../examples/container-app) - 容器化应用部署  
- [**数据库应用**](../../examples/database-app) - 带数据库集成的 Web 应用  

### 高级场景  
- [**微服务**](../../examples/microservices) - 多服务应用架构  
- [**无服务器函数**](../../examples/serverless-function) - Azure Functions 部署  
- [**配置示例**](../../examples/configurations) - 可重用的配置模式  

## 资源

### 快速参考  
- [**命令速查表**](resources/cheat-sheet.md) - 必备 azd 命令  
- [**术语表**](resources/glossary.md) - Azure 和 azd 术语  
- [**常见问题**](resources/faq.md) - 常见问题解答  
- [**学习指南**](resources/study-guide.md) - 全面的学习目标和练习  

### 外部资源  
- [Azure Developer CLI 文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure 架构中心](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure 定价计算器](https://azure.microsoft.com/pricing/calculator/)  
- [Azure 状态](https://status.azure.com/)  

## 学习路径

### 学生与初学者  
1. 从 [AZD 基础](docs/getting-started/azd-basics.md) 开始  
2. 按照 [安装指南](docs/getting-started/installation.md) 操作  
3. 完成 [第一个项目](docs/getting-started/first-project.md)  
4. 练习 [简单 Web 应用示例](../../examples/simple-web-app)  

### 开发者  
1. 查看 [配置指南](docs/getting-started/configuration.md)  
2. 学习 [部署指南](docs/deployment/deployment-guide.md)  
3. 完成 [数据库应用示例](../../examples/database-app)  
4. 探索 [容器应用示例](../../examples/container-app)  

### DevOps 工程师  
1. 掌握 [资源配置](docs/deployment/provisioning.md)  
2. 实施 [预检脚本](docs/pre-deployment/preflight-checks.md)  
3. 练习 [容量规划](docs/pre-deployment/capacity-planning.md)  
4. 深入学习 [微服务示例](../../examples/microservices)  

## 贡献

我们欢迎您的贡献！请阅读我们的 [贡献指南](CONTRIBUTING.md)，了解以下内容：  
- 如何提交问题和功能请求  
- 代码贡献指南  
- 文档改进  
- 社区标准  

## 支持

- **问题**：[报告错误和请求功能](https://github.com/microsoft/azd-for-beginners/issues)  
- **讨论**：[Microsoft Azure Discord 社区问答和讨论](https://discord.gg/microsoft-azure)  
- **电子邮件**：用于私人咨询  
- **Microsoft Learn**：[官方 Azure Developer CLI 文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

## 许可证

本项目基于 MIT 许可证 - 详情请参阅 [LICENSE](../../LICENSE) 文件。  

## 🎒 其他课程

我们的团队还制作了其他课程！查看：  
- [**新课程** Model Context Protocol (MCP) 初学者指南](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI Agents 初学者指南](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [使用 .NET 的生成式 AI 初学者指南](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
- [生成式 AI 初学者指南](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [使用 Java 的生成式 AI 初学者指南](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
- [机器学习初学者指南](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
- [数据科学初学者指南](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI 初学者指南](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
- [网络安全初学者指南](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)  
- [初学者的Web开发](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
- [初学者的物联网](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
- [初学者的XR开发](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [掌握GitHub Copilot进行AI配对编程](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
- [掌握GitHub Copilot为C#/.NET开发者服务](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
- [选择你的Copilot冒险之旅](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  

---

**导航**  
- **下一课**: [AZD基础知识](docs/getting-started/azd-basics.md)  

---

**免责声明**：  
本文档使用AI翻译服务[Co-op Translator](https://github.com/Azure/co-op-translator)进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于关键信息，建议使用专业人工翻译。我们不对因使用此翻译而产生的任何误解或误读承担责任。