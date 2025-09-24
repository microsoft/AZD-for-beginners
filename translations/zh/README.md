<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3df05e83c2307e92452bd7c3307ae849",
  "translation_date": "2025-09-24T08:46:28+00:00",
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

通过结构化章节学习 Azure Developer CLI (azd)，逐步掌握技能。**特别关注通过 Azure AI Foundry 集成部署 AI 应用。**

### 为什么这门课程对现代开发者至关重要

根据 Azure AI Foundry Discord 社区的反馈，**45% 的开发者希望使用 AZD 处理 AI 工作负载**，但面临以下挑战：
- 复杂的多服务 AI 架构
- AI 部署的生产实践
- Azure AI 服务的集成与配置
- AI 工作负载的成本优化
- AI 部署问题的排查

### 学习目标

完成本课程后，您将能够：
- **掌握 AZD 基础知识**：核心概念、安装与配置
- **部署 AI 应用**：结合 Azure AI Foundry 服务使用 AZD
- **实现基础设施即代码**：使用 Bicep 模板管理 Azure 资源
- **排查部署问题**：解决常见问题并进行调试
- **优化生产环境**：安全性、扩展性、监控与成本管理
- **构建多代理解决方案**：部署复杂的 AI 架构

## 📚 学习章节

*根据经验水平和目标选择您的学习路径*

### 🚀 第 1 章：基础与快速入门
**前置条件**：Azure 订阅，基本命令行知识  
**时长**：30-45 分钟  
**复杂度**：⭐

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
**复杂度**：⭐⭐

#### 学习内容
- AZD 与 Azure AI Foundry 的集成
- 部署 AI 驱动的应用
- 了解 AI 服务配置

#### 学习资源
- **🎯 从这里开始**：[Azure AI Foundry 集成](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 模式**：[AI 模型部署](docs/ai-foundry/ai-model-deployment.md) - 部署与管理 AI 模型
- **🛠️ 工作坊**：[AI 工作坊实验](docs/ai-foundry/ai-workshop-lab.md) - 让您的 AI 解决方案适配 AZD
- **🎥 互动指南**：[工作坊材料](workshop/README.md) - 基于浏览器的学习，配备 MkDocs * DevContainer 环境
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

**💡 本章成果**：部署并配置一个具备 RAG 功能的 AI 驱动聊天应用

---

### ⚙️ 第 3 章：配置与认证
**前置条件**：完成第 1 章  
**时长**：45-60 分钟  
**复杂度**：⭐⭐

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

**💡 本章成果**：通过正确的认证与安全管理多个环境

---

### 🏗️ 第 4 章：基础设施即代码与部署
**前置条件**：完成第 1-3 章  
**时长**：1-1.5 小时  
**复杂度**：⭐⭐⭐

#### 学习内容
- 高级部署模式
- 使用 Bicep 实现基础设施即代码
- 资源配置策略

#### 学习资源
- **📖 部署**：[部署指南](docs/deployment/deployment-guide.md) - 完整工作流
- **🏗️ 配置**：[资源配置](docs/deployment/provisioning.md) - Azure 资源管理
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
**复杂度**：⭐⭐⭐⭐

#### 学习内容
- 多代理架构模式
- 代理编排与协调
- 面向生产的 AI 部署

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

**💡 本章成果**：部署并管理一个生产级的多代理 AI 解决方案，包括客户与库存代理

---

### 🔍 第 6 章：部署前验证与规划
**前置条件**：完成第 4 章  
**时长**：1 小时  
**复杂度**：⭐⭐

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

**💡 本章成果**：在执行部署前验证并优化资源

---

### 🚨 第 7 章：故障排除与调试
**前置条件**：完成任意部署章节  
**时长**：1-1.5 小时  
**复杂度**：⭐⭐

#### 学习内容
- 系统化调试方法
- 常见问题与解决方案
- AI 特定故障排除

#### 学习资源
- **🔧 常见问题**：[常见问题](docs/troubleshooting/common-issues.md) - FAQ 与解决方案
- **🕵️ 调试**：[调试指南](docs/troubleshooting/debugging.md) - 分步策略
- **🤖 AI 问题**：[AI 特定故障排除](docs/troubleshooting/ai-troubleshooting.md) - AI 服务问题

#### 实践练习
- 诊断部署失败
- 解决认证问题
- 调试 AI 服务连接问题

**💡 本章成果**：独立诊断并解决常见部署问题

---

### 🏢 第 8 章：生产与企业模式
**前置条件**：完成第 1-4 章  
**时长**：2-3 小时  
**复杂度**：⭐⭐⭐⭐

#### 学习内容
- 生产部署策略
- 企业级安全模式
- 监控与成本优化

#### 学习资源
- **🏭 生产**：[生产 AI 最佳实践](docs/ai-foundry/production-ai-practices.md) - 企业模式
- **📝 示例**: [微服务示例](../../examples/microservices) - 复杂架构
- **📊 监控**: 应用洞察集成

#### 实践练习
- 实现企业级安全模式
- 设置全面的监控
- 在生产环境中部署并确保治理

**💡 章节目标**: 部署具备完整生产能力的企业级应用

---

## 🎓 工作坊概述: 实践学习体验

### 互动式工作坊材料
**通过浏览器工具和指导性练习进行全面的实践学习**

我们的工作坊材料提供了结构化的互动学习体验，与上述章节课程相辅相成。工作坊适用于自学和讲师指导的课程。

#### 🛠️ 工作坊特色
- **基于浏览器的界面**: 完整的 MkDocs 驱动工作坊，支持搜索、复制和主题功能
- **GitHub Codespaces 集成**: 一键设置开发环境
- **结构化学习路径**: 7步指导性练习（总计3.5小时）
- **探索 → 部署 → 定制**: 渐进式方法论
- **互动式 DevContainer 环境**: 预配置工具和依赖项

#### 📚 工作坊结构
工作坊遵循 **探索 → 部署 → 定制** 的方法论：

1. **探索阶段** (45分钟)
   - 探索 Azure AI Foundry 模板和服务
   - 理解多代理架构模式
   - 审查部署要求和前提条件

2. **部署阶段** (2小时)
   - 实践部署 AI 应用程序，使用 AZD
   - 配置 Azure AI 服务和端点
   - 实现安全和认证模式

3. **定制阶段** (45分钟)
   - 根据具体用例修改应用程序
   - 优化生产环境部署
   - 实现监控和成本管理

#### 🚀 开始工作坊
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 工作坊学习成果
完成工作坊后，参与者将能够：
- **部署生产级 AI 应用**: 使用 AZD 和 Azure AI Foundry 服务
- **掌握多代理架构**: 实现协调的 AI 代理解决方案
- **实施安全最佳实践**: 配置认证和访问控制
- **优化扩展性**: 设计成本效益高、性能优越的部署
- **解决部署问题**: 独立解决常见问题

#### 📖 工作坊资源
- **🎥 互动指南**: [工作坊材料](workshop/README.md) - 基于浏览器的学习环境
- **📋 分步说明**: [指导性练习](../../workshop/docs/instructions) - 详细的操作步骤
- **🛠️ AI 工作坊实验室**: [AI 工作坊实验室](docs/ai-foundry/ai-workshop-lab.md) - 专注于 AI 的练习
- **💡 快速开始**: [工作坊设置指南](workshop/README.md#quick-start) - 环境配置

**适合**: 企业培训、大学课程、自学和开发者训练营。

---

## 📖 什么是 Azure Developer CLI？

Azure Developer CLI (azd) 是一个面向开发者的命令行工具，旨在加速构建和部署 Azure 应用程序的过程。它提供：

- **基于模板的部署** - 使用预构建模板实现常见应用模式
- **基础设施即代码** - 使用 Bicep 或 Terraform 管理 Azure 资源  
- **集成工作流** - 无缝地配置、部署和监控应用程序
- **开发者友好** - 优化开发者的生产力和体验

### **AZD + Azure AI Foundry: AI 部署的完美组合**

**为什么选择 AZD 进行 AI 解决方案部署？** AZD 解决了 AI 开发者面临的主要挑战：

- **AI 就绪模板** - 为 Azure OpenAI、认知服务和机器学习工作负载预配置模板
- **安全的 AI 部署** - 内置 AI 服务、API 密钥和模型端点的安全模式  
- **生产级 AI 模式** - 可扩展、成本效益高的 AI 应用部署最佳实践
- **端到端 AI 工作流** - 从模型开发到生产部署，配备完善的监控
- **成本优化** - 智能资源分配和扩展策略，适用于 AI 工作负载
- **Azure AI Foundry 集成** - 无缝连接到 AI Foundry 模型目录和端点

---

## 🎯 模板与示例库

### 推荐: Azure AI Foundry 模板
**如果您正在部署 AI 应用，请从这里开始！**

| 模板 | 章节 | 复杂度 | 服务 |
|------|------|--------|------|
| [**开始使用 AI 聊天**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI 模型推理 API + Azure AI 搜索 + Azure 容器应用 + 应用洞察 |
| [**开始使用 AI 代理**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第2章 | ⭐⭐ | Azure AI 代理服务 + AzureOpenAI + Azure AI 搜索 + Azure 容器应用 + 应用洞察|
| [**多代理工作流自动化**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第5章 | ⭐⭐⭐ | AzureOpenAI + Azure AI 代理服务 + 语义内核 + Azure CosmosDB + Azure 容器应用|
| [**从数据生成文档**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第4章 | ⭐⭐⭐  | AzureOpenAI + Azure AI 搜索 + Azure AI 服务 + Azure CosmosDB|
| [**通过代理改善客户会议**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第5章 | ⭐⭐⭐| AzureOpenAI + Azure AI 搜索 + Azure CosmosDB + Azure SQL 数据库 |
| [**使用代理现代化代码**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第5章 | ⭐⭐⭐ | AzureOpenAI + Azure 代理服务 + 语义内核 + Azure CosmosDB + Azure 容器应用|
| [**构建您的对话代理**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第4章 | ⭐⭐⭐ | AI 语言 + AzureOpenAI + AI 搜索 + Azure 存储 + Azure 容器注册表|
| [**从对话数据中解锁洞察**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第8章 | ⭐⭐⭐ | AzureOpenAI + AI 搜索 + 语义内核 + Azure 代理服务 + AI 内容理解|
| [**多模态内容处理**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第8章 | ⭐⭐⭐⭐ | AzureOpenAI + Azure 内容理解 + Azure CosmosDB + Azure 容器应用|

### 推荐: 完整学习场景
**生产级应用模板与学习章节对应**

| 模板 | 学习章节 | 复杂度 | 关键学习 |
|------|----------|--------|----------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | 基础 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | 使用 Azure AI 搜索实现 RAG |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第4章 | ⭐⭐ | 文档智能集成 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | 代理框架和函数调用 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐ | 企业级 AI 编排 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | 客户和库存代理的多代理架构 |

### 按示例类型学习

#### 简单应用 (第1-2章)
- [简单 Web 应用](../../examples/simple-web-app) - 基础部署模式
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
- [**示例目录**](examples/README.md) - 本地学习示例，附详细说明

---

## 📚 学习资源与参考

### 快速参考
- [**命令速查表**](resources/cheat-sheet.md) - 按章节组织的 azd 核心命令
- [**术语表**](resources/glossary.md) - Azure 和 azd 术语  
- [**常见问题**](resources/faq.md) - 按学习章节组织的常见问题
- [**学习指南**](resources/study-guide.md) - 全面的实践练习

### 实践工作坊
- [**AI 工作坊实验室**](docs/ai-foundry/ai-workshop-lab.md) - 让您的 AI 解决方案支持 AZD 部署（2-3小时）
- [**互动式工作坊指南**](workshop/README.md) - 基于 MkDocs 和 DevContainer 环境的浏览器工作坊
- [**结构化学习路径**](../../workshop/docs/instructions) - 7步指导性练习（探索 → 部署 → 定制）
- [**AZD 初学者工作坊**](workshop/README.md) - 完整的实践工作坊材料，支持 GitHub Codespaces 集成

### 外部学习资源
- [Azure Developer CLI 文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架构中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 定价计算器](https://azure.microsoft.com/pricing/calculator/)
- [Azure 状态](https://status.azure.com/)

---

## 🎓 课程完成与认证

### 进度跟踪
通过每一章节跟踪您的学习进度：

- [ ] **第1章**: 基础与快速开始 ✅
- [ ] **第2章**: AI 优先开发 ✅  
- [ ] **第3章**: 配置与认证 ✅
- [ ] **第4章**: 基础设施即代码与部署 ✅
- [ ] **第5章**: 多代理 AI 解决方案 ✅
- [ ] **第6章**: 部署前验证与规划 ✅
- [ ] **第7章**: 故障排除与调试 ✅
- [ ] **第8章**: 生产与企业模式 ✅

### 学习验证
完成每一章节后，通过以下方式验证您的知识：
1. **实践练习**: 完成章节的实践部署
2. **知识检查**: 查看章节的常见问题部分
3. **社区讨论**: 在 Azure Discord 分享您的经验
4. **下一章节**: 进入下一个复杂度级别

### 课程完成收益
完成所有章节后，您将获得：
- **生产经验**: 将真实的 AI 应用部署到 Azure
- **专业技能**: 企业级部署能力  
- **社区认可**: 成为 Azure 开发者社区的活跃成员
- **职业发展**: 掌握 AZD 和 AI 部署的热门技能

---

## 🤝 社区与支持

### 获取帮助与支持
- **技术问题**: [报告问题和请求功能](https://github.com/microsoft/azd-for-beginners/issues)
- **学习问题**: [Microsoft Azure Discord 社区](https://discord.gg/microsoft-azure)
- **AI 专项帮助**: 加入 [#Azure 频道](https://discord.gg/microsoft-azure)，参与 AZD + AI Foundry 讨论
- **文档**: [官方 Azure Developer CLI 文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### 来自 Azure AI Foundry Discord 的社区洞察

**#Azure 频道的最新投票结果:**
- **45%** 的开发者希望使用 AZD 进行 AI 工作负载
- **主要挑战**: 多服务部署、凭证管理、生产准备  
- **最受欢迎**: AI 专属模板、故障排除指南、最佳实践

**加入我们的社区，您可以:**
- 分享您的 AZD + AI 经验并获得帮助
- 获取新 AI 模板的早期预览
- 贡献 AI 部署最佳实践
- 影响未来 AI + AZD 功能开发

### 为课程做贡献
我们欢迎您的贡献！请阅读我们的 [贡献指南](CONTRIBUTING.md)，了解以下内容：
- **内容改进**: 增强现有章节和示例
- **新增示例**: 添加真实场景和模板  
- **翻译**: 帮助维护多语言支持
- **问题报告**: 提高准确性和清晰度
- **社区标准**: 遵循我们的包容性社区准则

---

## 📄 课程信息

### 许可证
本项目基于 MIT 许可证 - 详情请参阅 [LICENSE](../../LICENSE) 文件。
### 相关的微软学习资源

我们的团队提供其他全面的学习课程：

- [初学者的模型上下文协议 (MCP)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [初学者的AI代理](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [使用 .NET 的生成式AI初学者课程](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [生成式AI初学者课程](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [使用Java的生成式AI初学者课程](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [机器学习初学者课程](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [数据科学初学者课程](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [人工智能初学者课程](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [网络安全初学者课程](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Web开发初学者课程](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [物联网初学者课程](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [XR开发初学者课程](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [掌握GitHub Copilot进行AI配对编程](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [掌握GitHub Copilot为C#/.NET开发者服务](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [选择你的Copilot冒险之旅](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

## 🗺️ 课程导航

**🚀 准备开始学习了吗？**

**初学者**：从[第1章：基础与快速入门](../..)开始  
**AI开发者**：跳转到[第2章：AI优先开发](../..)  
**有经验的开发者**：从[第3章：配置与认证](../..)开始

**下一步**：[开始第1章 - AZD基础](docs/getting-started/azd-basics.md) →

---

