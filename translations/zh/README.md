<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "21dcf6a2d8a223a853d965138d4fb045",
  "translation_date": "2025-09-17T12:31:59+00:00",
  "source_file": "README.md",
  "language_code": "zh"
}
-->
# AZD 初学者指南：结构化学习旅程

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.zh.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

## 开始学习本课程

按照以下步骤开启您的 AZD 学习旅程：

1. **Fork 仓库**：点击 [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **克隆仓库**：`git clone https://github.com/microsoft/azd-for-beginners.git`
3. **加入社区**：[Azure Discord 社区](https://discord.com/invite/ByRwuEEgH4)，获取专家支持
4. **选择学习路径**：根据您的经验水平选择以下章节

### 多语言支持

#### 自动翻译（始终保持最新）

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](./README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

## 课程概述

通过结构化章节掌握 Azure Developer CLI (azd)，逐步学习。**特别关注通过 Azure AI Foundry 集成部署 AI 应用。**

### 为什么这门课程对现代开发者至关重要

根据 Azure AI Foundry Discord 社区的反馈，**45% 的开发者希望使用 AZD 处理 AI 工作负载**，但面临以下挑战：
- 复杂的多服务 AI 架构
- 生产级 AI 部署最佳实践  
- Azure AI 服务的集成与配置
- AI 工作负载的成本优化
- AI 特定部署问题的排查

### 学习目标

完成本课程后，您将能够：
- **掌握 AZD 基础知识**：核心概念、安装与配置
- **部署 AI 应用**：结合 Azure AI Foundry 服务使用 AZD
- **实施基础设施即代码**：使用 Bicep 模板管理 Azure 资源
- **排查部署问题**：解决常见问题并进行调试
- **优化生产环境**：安全性、扩展性、监控与成本管理
- **构建多代理解决方案**：部署复杂的 AI 架构

## 📚 学习章节

*根据经验水平和目标选择您的学习路径*

### 🚀 第 1 章：基础与快速入门
**前置条件**：Azure 订阅，基本命令行知识  
**时长**：30-45 分钟  
**难度**：⭐

#### 学习内容
- 了解 Azure Developer CLI 的基础知识
- 在您的平台上安装 AZD
- 完成首次成功部署

#### 学习资源
- **🎯 从这里开始**：[什么是 Azure Developer CLI？](../..)
- **📖 理论**：[AZD 基础知识](docs/getting-started/azd-basics.md) - 核心概念与术语
- **⚙️ 设置**：[安装与设置](docs/getting-started/installation.md) - 平台特定指南
- **🛠️ 实践**：[您的第一个项目](docs/getting-started/first-project.md) - 分步教程
- **📋 快速参考**：[命令速查表](resources/cheat-sheet.md)

#### 实践练习
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 本章成果**：使用 AZD 成功将一个简单的 Web 应用部署到 Azure

---

### 🤖 第 2 章：AI 优先开发（推荐给 AI 开发者）
**前置条件**：完成第 1 章  
**时长**：1-2 小时  
**难度**：⭐⭐

#### 学习内容
- AZD 与 Azure AI Foundry 的集成
- 部署 AI 驱动的应用
- 了解 AI 服务配置

#### 学习资源
- **🎯 从这里开始**：[Azure AI Foundry 集成](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 模式**：[AI 模型部署](docs/ai-foundry/ai-model-deployment.md) - 部署与管理 AI 模型
- **🛠️ 工作坊**：[AI 工作坊实验](docs/ai-foundry/ai-workshop-lab.md) - 让您的 AI 解决方案适配 AZD
- **📋 模板**：[Azure AI Foundry 模板](../..)

#### 实践练习
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 本章成果**：部署并配置一个具有 RAG 功能的 AI 驱动聊天应用

---

### ⚙️ 第 3 章：配置与认证
**前置条件**：完成第 1 章  
**时长**：45-60 分钟  
**难度**：⭐⭐

#### 学习内容
- 环境配置与管理
- 认证与安全最佳实践
- 资源命名与组织

#### 学习资源
- **📖 配置**：[配置指南](docs/getting-started/configuration.md) - 环境设置
- **🔐 安全**：认证模式与托管身份
- **📝 示例**：[数据库应用示例](../../examples/database-app) - 配置模式

#### 实践练习
- 配置多个环境（开发、测试、生产）
- 设置托管身份认证
- 实现环境特定配置

**💡 本章成果**：使用正确的认证与安全管理多个环境

---

### 🏗️ 第 4 章：基础设施即代码与部署
**前置条件**：完成第 1-3 章  
**时长**：1-1.5 小时  
**难度**：⭐⭐⭐

#### 学习内容
- 高级部署模式
- 使用 Bicep 实现基础设施即代码
- 资源供应策略

#### 学习资源
- **📖 部署**：[部署指南](docs/deployment/deployment-guide.md) - 完整工作流
- **🏗️ 资源供应**：[资源供应](docs/deployment/provisioning.md) - Azure 资源管理
- **📝 示例**：[容器应用示例](../../examples/container-app) - 容器化部署

#### 实践练习
- 创建自定义 Bicep 模板
- 部署多服务应用
- 实现蓝绿部署策略

**💡 本章成果**：使用自定义基础设施模板部署复杂的多服务应用

---

### 🎯 第 5 章：多代理 AI 解决方案（高级）
**前置条件**：完成第 1-2 章  
**时长**：2-3 小时  
**难度**：⭐⭐⭐⭐

#### 学习内容
- 多代理架构模式
- 代理编排与协调
- 生产级 AI 部署

#### 学习资源
- **🤖 特色项目**：[零售多代理解决方案](examples/retail-scenario.md) - 完整实现
- **🛠️ ARM 模板**：[ARM 模板包](../../examples/retail-multiagent-arm-template) - 一键部署
- **📖 架构**：多代理协调模式

#### 实践练习
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 本章成果**：部署并管理一个生产级多代理 AI 解决方案，包含客户与库存代理

---

### 🔍 第 6 章：部署前验证与规划
**前置条件**：完成第 4 章  
**时长**：1 小时  
**难度**：⭐⭐

#### 学习内容
- 容量规划与资源验证
- SKU 选择策略
- 预检查与自动化

#### 学习资源
- **📊 规划**：[容量规划](docs/pre-deployment/capacity-planning.md) - 资源验证
- **💰 选择**：[SKU 选择](docs/pre-deployment/sku-selection.md) - 成本优化选择
- **✅ 验证**：[预检查](docs/pre-deployment/preflight-checks.md) - 自动化脚本

#### 实践练习
- 运行容量验证脚本
- 优化 SKU 选择以降低成本
- 实现自动化部署前检查

**💡 本章成果**：在执行前验证并优化部署

---

### 🚨 第 7 章：故障排查与调试
**前置条件**：完成任意部署章节  
**时长**：1-1.5 小时  
**难度**：⭐⭐

#### 学习内容
- 系统化调试方法
- 常见问题与解决方案
- AI 特定故障排查

#### 学习资源
- **🔧 常见问题**：[常见问题](docs/troubleshooting/common-issues.md) - FAQ 与解决方案
- **🕵️ 调试**：[调试指南](docs/troubleshooting/debugging.md) - 分步策略
- **🤖 AI 问题**：[AI 特定故障排查](docs/troubleshooting/ai-troubleshooting.md) - AI 服务问题

#### 实践练习
- 诊断部署失败
- 解决认证问题
- 调试 AI 服务连接问题

**💡 本章成果**：独立诊断并解决常见部署问题

---

### 🏢 第 8 章：生产与企业模式
**前置条件**：完成第 1-4 章  
**时长**：2-3 小时  
**难度**：⭐⭐⭐⭐

#### 学习内容
- 生产部署策略
- 企业级安全模式
- 监控与成本优化

#### 学习资源
- **🏭 生产**：[生产级 AI 最佳实践](docs/ai-foundry/production-ai-practices.md) - 企业模式
- **📝 示例**：[微服务示例](../../examples/microservices) - 复杂架构
- **📊 监控**: 应用程序洞察集成

#### 实践练习
- 实现企业级安全模式
- 设置全面的监控
- 在生产环境中部署并确保治理

**💡 章节目标**: 部署具备完整生产能力的企业级应用程序

---

## 📖 什么是 Azure Developer CLI？

Azure Developer CLI (azd) 是一个以开发者为中心的命令行工具，旨在加速构建和部署 Azure 应用程序的过程。它提供以下功能：

- **基于模板的部署** - 使用预构建模板实现常见应用程序模式
- **基础设施即代码** - 使用 Bicep 或 Terraform 管理 Azure 资源  
- **集成工作流** - 无缝地进行应用程序的资源配置、部署和监控
- **开发者友好** - 优化开发者的生产力和体验

### **AZD + Azure AI Foundry: AI 部署的完美组合**

**为什么选择 AZD 进行 AI 解决方案部署？** AZD 解决了 AI 开发者面临的主要挑战：

- **AI 就绪模板** - 针对 Azure OpenAI、认知服务和机器学习工作负载的预配置模板
- **安全的 AI 部署** - 内置 AI 服务、API 密钥和模型端点的安全模式  
- **生产级 AI 模式** - 可扩展、成本优化的 AI 应用程序部署最佳实践
- **端到端 AI 工作流** - 从模型开发到生产部署，配备完善的监控
- **成本优化** - 针对 AI 工作负载的智能资源分配和扩展策略
- **Azure AI Foundry 集成** - 无缝连接到 AI Foundry 模型目录和端点

---

## 🎯 模板与示例库

### 推荐: Azure AI Foundry 模板
**如果您正在部署 AI 应用程序，请从这里开始！**

| 模板 | 章节 | 复杂度 | 服务 |
|------|------|--------|------|
| [**AI 聊天入门**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI 模型推理 API + Azure AI 搜索 + Azure 容器应用 + 应用程序洞察 |
| [**AI 代理入门**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第2章 | ⭐⭐ | Azure AI 代理服务 + AzureOpenAI + Azure AI 搜索 + Azure 容器应用 + 应用程序洞察 |
| [**多代理工作流自动化**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第5章 | ⭐⭐⭐ | AzureOpenAI + Azure AI 代理服务 + 语义内核 + Azure CosmosDB + Azure 容器应用 |
| [**从数据生成文档**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第4章 | ⭐⭐⭐ | AzureOpenAI + Azure AI 搜索 + Azure AI 服务 + Azure CosmosDB |
| [**通过代理改善客户会议**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第5章 | ⭐⭐⭐ | AzureOpenAI + Azure AI 搜索 + Azure CosmosDB + Azure SQL 数据库 |
| [**使用代理现代化代码**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第5章 | ⭐⭐⭐ | AzureOpenAI + Azure 代理服务 + 语义内核 + Azure CosmosDB + Azure 容器应用 |
| [**构建您的对话代理**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第4章 | ⭐⭐⭐ | AI 语言 + AzureOpenAI + AI 搜索 + Azure 存储 + Azure 容器注册表 |
| [**从对话数据中解锁洞察**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第8章 | ⭐⭐⭐ | AzureOpenAI + AI 搜索 + 语义内核 + Azure 代理服务 + AI 内容理解 |
| [**多模态内容处理**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第8章 | ⭐⭐⭐⭐ | AzureOpenAI + Azure 内容理解 + Azure CosmosDB + Azure 容器应用 |

### 推荐: 完整学习场景
**生产级应用程序模板与学习章节对应**

| 模板 | 学习章节 | 复杂度 | 关键学习 |
|------|----------|--------|----------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | 基本 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | 使用 Azure AI 搜索实现 RAG |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第4章 | ⭐⭐ | 文档智能集成 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | 代理框架与函数调用 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐ | 企业级 AI 编排 |
| [**零售多代理解决方案**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | 客户与库存代理的多代理架构 |

### 按示例类型学习

#### 简单应用程序 (第1-2章)
- [简单 Web 应用](../../examples/simple-web-app) - 基本部署模式
- [静态网站](../../examples/static-site) - 静态内容部署
- [基础 API](../../examples/basic-api) - REST API 部署

#### 数据库集成 (第3-4章)  
- [数据库应用](../../examples/database-app) - 数据库连接模式
- [数据处理](../../examples/data-processing) - ETL 工作流部署

#### 高级模式 (第4-8章)
- [容器应用](../../examples/container-app) - 容器化部署
- [微服务](../../examples/microservices) - 多服务架构  
- [企业解决方案](../../examples/enterprise) - 生产级模式

### 外部模板集合
- [**Azure-Samples AZD 模板**](https://github.com/Azure-Samples/azd-templates) - 官方 Microsoft 示例
- [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) - 社区贡献模板
- [**示例目录**](examples/README.md) - 本地学习示例及详细说明

---

## 📚 学习资源与参考

### 快速参考
- [**命令速查表**](resources/cheat-sheet.md) - 按章节整理的关键 azd 命令
- [**术语表**](resources/glossary.md) - Azure 和 azd 术语  
- [**常见问题**](resources/faq.md) - 按学习章节整理的常见问题
- [**学习指南**](resources/study-guide.md) - 综合实践练习

### 实践工作坊
- [**AI 工作坊实验室**](docs/ai-foundry/ai-workshop-lab.md) - 让您的 AI 解决方案支持 AZD 部署
- [**AZD 初学者工作坊**](workshop/README.md) - 完整的实践工作坊材料

### 外部学习资源
- [Azure Developer CLI 文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架构中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 定价计算器](https://azure.microsoft.com/pricing/calculator/)
- [Azure 状态](https://status.azure.com/)

---

## 🎓 课程完成与认证

### 进度跟踪
通过每一章节跟踪您的学习进度：

- [ ] **第1章**: 基础与快速入门 ✅
- [ ] **第2章**: AI 优先开发 ✅  
- [ ] **第3章**: 配置与认证 ✅
- [ ] **第4章**: 基础设施即代码与部署 ✅
- [ ] **第5章**: 多代理 AI 解决方案 ✅
- [ ] **第6章**: 部署前验证与规划 ✅
- [ ] **第7章**: 故障排除与调试 ✅
- [ ] **第8章**: 生产与企业模式 ✅

### 学习验证
完成每一章节后，通过以下方式验证您的知识：
1. **实践练习**: 完成章节的动手部署
2. **知识检查**: 回顾章节的常见问题部分
3. **社区讨论**: 在 Azure Discord 分享您的经验
4. **下一章节**: 进入下一个复杂度级别

### 课程完成收益
完成所有章节后，您将获得：
- **生产经验**: 将真实的 AI 应用程序部署到 Azure
- **专业技能**: 企业级部署能力  
- **社区认可**: 成为 Azure 开发者社区的活跃成员
- **职业发展**: 具备 AZD 和 AI 部署的热门技能

---

## 🤝 社区与支持

### 获取帮助与支持
- **技术问题**: [报告问题与请求功能](https://github.com/microsoft/azd-for-beginners/issues)
- **学习问题**: [Microsoft Azure Discord 社区](https://discord.gg/microsoft-azure)
- **AI 专属帮助**: 加入 [#Azure 频道](https://discord.gg/microsoft-azure) 讨论 AZD + AI Foundry
- **文档**: [官方 Azure Developer CLI 文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### 来自 Azure AI Foundry Discord 的社区洞察

**#Azure 频道的最新投票结果:**
- **45%** 的开发者希望使用 AZD 进行 AI 工作负载
- **主要挑战**: 多服务部署、凭证管理、生产准备  
- **最受欢迎**: AI 专属模板、故障排除指南、最佳实践

**加入我们的社区以:**
- 分享您的 AZD + AI 经验并获得帮助
- 获取新 AI 模板的早期预览
- 贡献 AI 部署最佳实践
- 影响未来 AI + AZD 功能开发

### 为课程做贡献
我们欢迎您的贡献！请阅读我们的 [贡献指南](CONTRIBUTING.md) 了解详情：
- **内容改进**: 增强现有章节和示例
- **新增示例**: 添加真实场景和模板  
- **翻译**: 帮助维护多语言支持
- **问题报告**: 提高准确性和清晰度
- **社区标准**: 遵循我们的包容性社区准则

---

## 📄 课程信息

### 许可
本项目基于 MIT 许可协议 - 详情请参阅 [LICENSE](../../LICENSE) 文件。

### 相关 Microsoft 学习资源

我们的团队还提供其他综合学习课程：

- [**新** 模型上下文协议 (MCP) 初学者课程](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI 代理初学者课程](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [使用 .NET 的生成式 AI 初学者课程](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [生成式 AI 初学者课程](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [使用 Java 的生成式 AI 初学者课程](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [机器学习初学者课程](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [数据科学初学者课程](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI 初学者课程](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [网络安全初学者课程](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Web 开发初学者课程](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [物联网初学者课程](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [XR 开发初学者课程](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [掌握 GitHub Copilot 进行 AI 配对编程](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [掌握 GitHub Copilot 适用于 C#/.NET 开发者](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [选择您的 Copilot 冒险](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

## 🗺️ 课程导航

**🚀 准备开始学习了吗？**

**初学者**: 从 [第1章: 基础与快速入门](../..) 开始  
**AI 开发者**: 跳转到 [第2章: AI 优先开发](../..)  
**经验丰富的开发者**：从[第3章：配置与认证](../..)开始

**下一步**：[开始第1章 - AZD基础](docs/getting-started/azd-basics.md) →

---

**免责声明**：  
本文档使用AI翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于关键信息，建议使用专业人工翻译。我们不对因使用此翻译而产生的任何误解或误读承担责任。