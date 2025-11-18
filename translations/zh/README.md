<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6dbd1fe0dee10a4def58fdc663c59e1d",
  "translation_date": "2025-11-18T16:57:04+00:00",
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
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## 开始学习本课程

按照以下步骤开启您的 AZD 学习旅程：

1. **Fork 仓库**：点击 [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **克隆仓库**：`git clone https://github.com/microsoft/azd-for-beginners.git`
3. **加入社区**：[Azure Discord 社区](https://discord.com/invite/ByRwuEEgH4) 获取专家支持
4. **选择学习路径**：根据您的经验水平选择以下章节

### 多语言支持

#### 自动翻译（始终保持最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[阿拉伯语](../ar/README.md) | [孟加拉语](../bn/README.md) | [保加利亚语](../bg/README.md) | [缅甸语](../my/README.md) | [中文（简体）](./README.md) | [中文（繁体，香港）](../hk/README.md) | [中文（繁体，澳门）](../mo/README.md) | [中文（繁体，台湾）](../tw/README.md) | [克罗地亚语](../hr/README.md) | [捷克语](../cs/README.md) | [丹麦语](../da/README.md) | [荷兰语](../nl/README.md) | [爱沙尼亚语](../et/README.md) | [芬兰语](../fi/README.md) | [法语](../fr/README.md) | [德语](../de/README.md) | [希腊语](../el/README.md) | [希伯来语](../he/README.md) | [印地语](../hi/README.md) | [匈牙利语](../hu/README.md) | [印尼语](../id/README.md) | [意大利语](../it/README.md) | [日语](../ja/README.md) | [韩语](../ko/README.md) | [立陶宛语](../lt/README.md) | [马来语](../ms/README.md) | [马拉地语](../mr/README.md) | [尼泊尔语](../ne/README.md) | [尼日利亚皮钦语](../pcm/README.md) | [挪威语](../no/README.md) | [波斯语](../fa/README.md) | [波兰语](../pl/README.md) | [葡萄牙语（巴西）](../br/README.md) | [葡萄牙语（葡萄牙）](../pt/README.md) | [旁遮普语](../pa/README.md) | [罗马尼亚语](../ro/README.md) | [俄语](../ru/README.md) | [塞尔维亚语（西里尔字母）](../sr/README.md) | [斯洛伐克语](../sk/README.md) | [斯洛文尼亚语](../sl/README.md) | [西班牙语](../es/README.md) | [斯瓦希里语](../sw/README.md) | [瑞典语](../sv/README.md) | [他加禄语](../tl/README.md) | [泰米尔语](../ta/README.md) | [泰语](../th/README.md) | [土耳其语](../tr/README.md) | [乌克兰语](../uk/README.md) | [乌尔都语](../ur/README.md) | [越南语](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 课程概述

通过结构化章节掌握 Azure Developer CLI (azd)，逐步学习。**特别关注通过 Azure AI Foundry 集成部署 AI 应用程序。**

### 为什么这门课程对现代开发者至关重要

根据 Azure AI Foundry Discord 社区的反馈，**45% 的开发者希望使用 AZD 处理 AI 工作负载**，但面临以下挑战：
- 复杂的多服务 AI 架构
- 生产环境 AI 部署最佳实践  
- Azure AI 服务集成与配置
- AI 工作负载的成本优化
- AI 部署问题的排查

### 学习目标

完成本课程后，您将能够：
- **掌握 AZD 基础知识**：核心概念、安装和配置
- **部署 AI 应用程序**：使用 AZD 集成 Azure AI Foundry 服务
- **实施基础设施即代码**：使用 Bicep 模板管理 Azure 资源
- **排查部署问题**：解决常见问题并调试故障
- **优化生产环境**：安全性、扩展性、监控和成本管理
- **构建多代理解决方案**：部署复杂的 AI 架构

## 📚 学习章节

*根据经验水平和目标选择您的学习路径*

### 🚀 第1章：基础与快速入门
**前提条件**：Azure 订阅，基本命令行知识  
**时长**：30-45 分钟  
**复杂度**：⭐

#### 学习内容
- 了解 Azure Developer CLI 基础知识
- 在您的平台上安装 AZD
- 完成您的第一个成功部署

#### 学习资源
- **🎯 从这里开始**：[什么是 Azure Developer CLI？](../..)
- **📖 理论**：[AZD 基础知识](docs/getting-started/azd-basics.md) - 核心概念和术语
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

**💡 本章成果**：使用 AZD 成功将一个简单的 Web 应用程序部署到 Azure

---

### 🤖 第2章：AI 优先开发（推荐给 AI 开发者）
**前提条件**：完成第1章  
**时长**：1-2 小时  
**复杂度**：⭐⭐

#### 学习内容
- AZD 与 Azure AI Foundry 的集成
- 部署 AI 驱动的应用程序
- 了解 AI 服务配置

#### 学习资源
- **🎯 从这里开始**：[Azure AI Foundry 集成](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 模式**：[AI 模型部署](docs/ai-foundry/ai-model-deployment.md) - 部署和管理 AI 模型
- **🛠️ 工作坊**：[AI 工作坊实验室](docs/ai-foundry/ai-workshop-lab.md) - 让您的 AI 解决方案支持 AZD
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

**💡 本章成果**：部署并配置一个具有 RAG 功能的 AI 驱动聊天应用程序

---

### ⚙️ 第3章：配置与认证
**前提条件**：完成第1章  
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

**💡 本章成果**：通过正确的认证和安全管理多个环境

---

### 🏗️ 第4章：基础设施即代码与部署
**前提条件**：完成第1-3章  
**时长**：1-1.5 小时  
**复杂度**：⭐⭐⭐

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
- 部署多服务应用程序
- 实现蓝绿部署策略

**💡 本章成果**：使用自定义基础设施模板部署复杂的多服务应用程序

---

### 🎯 第5章：多代理 AI 解决方案（高级）
**前提条件**：完成第1-2章  
**时长**：2-3 小时  
**复杂度**：⭐⭐⭐⭐

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

**💡 本章成果**：部署并管理一个生产级多代理 AI 解决方案，包括客户和库存代理

---

### 🔍 第6章：部署前验证与规划
**前提条件**：完成第4章  
**时长**：1 小时  
**复杂度**：⭐⭐

#### 学习内容
- 容量规划与资源验证
- SKU 选择策略
- 部署前检查与自动化

#### 学习资源
- **📊 规划**：[容量规划](docs/pre-deployment/capacity-planning.md) - 资源验证
- **💰 选择**：[SKU 选择](docs/pre-deployment/sku-selection.md) - 成本优化选择
- **✅ 验证**：[部署前检查](docs/pre-deployment/preflight-checks.md) - 自动化脚本

#### 实践练习
- 运行容量验证脚本
- 优化 SKU 选择以降低成本
- 实现自动化部署前检查

**💡 本章成果**：在执行前验证并优化部署

---

### 🚨 第7章：故障排除与调试
**前提条件**：完成任意部署章节  
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

### 🏢 第8章：生产与企业模式
**前提条件**：完成第1-4章  

**时长**：2-3小时  
**复杂度**：⭐⭐⭐⭐

#### 你将学到的内容
- 生产环境部署策略
- 企业级安全模式
- 监控与成本优化

#### 学习资源
- **🏭 生产环境**：[生产AI最佳实践](docs/ai-foundry/production-ai-practices.md) - 企业级模式
- **📝 示例**：[微服务示例](../../examples/microservices) - 复杂架构
- **📊 监控**：Application Insights集成

#### 实践练习
- 实现企业级安全模式
- 设置全面的监控
- 在生产环境中部署并确保治理

**💡 章节成果**：部署具备完整生产能力的企业级应用

---

## 🎓 工作坊概述：动手学习体验

### 互动式工作坊材料
**通过基于浏览器的工具和指导性练习进行全面的动手学习**

我们的工作坊材料提供了结构化的互动学习体验，与上述章节课程相辅相成。工作坊适用于自学和讲师指导的课程。

#### 🛠️ 工作坊特点
- **基于浏览器的界面**：完整的MkDocs驱动工作坊，支持搜索、复制和主题功能
- **GitHub Codespaces集成**：一键设置开发环境
- **结构化学习路径**：7步指导性练习（总计3.5小时）
- **探索 → 部署 → 定制**：渐进式方法论
- **互动式DevContainer环境**：预配置工具和依赖项

#### 📚 工作坊结构
工作坊遵循**探索 → 部署 → 定制**的方法论：

1. **探索阶段**（45分钟）
   - 探索Azure AI Foundry模板和服务
   - 理解多代理架构模式
   - 审查部署要求和前提条件

2. **部署阶段**（2小时）
   - 动手部署AI应用，使用AZD
   - 配置Azure AI服务和端点
   - 实现安全和认证模式

3. **定制阶段**（45分钟）
   - 根据具体用例修改应用
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
- **部署生产AI应用**：使用AZD和Azure AI Foundry服务
- **掌握多代理架构**：实现协调的AI代理解决方案
- **实施安全最佳实践**：配置认证和访问控制
- **优化扩展性**：设计成本效益高、性能优越的部署
- **解决部署问题**：独立解决常见问题

#### 📖 工作坊资源
- **🎥 互动指南**：[工作坊材料](workshop/README.md) - 基于浏览器的学习环境
- **📋 分步说明**：[指导性练习](../../workshop/docs/instructions) - 详细的操作步骤
- **🛠️ AI工作坊实验室**：[AI工作坊实验室](docs/ai-foundry/ai-workshop-lab.md) - 专注于AI的练习
- **💡 快速开始**：[工作坊设置指南](workshop/README.md#quick-start) - 环境配置

**适合**：企业培训、大学课程、自学和开发者训练营。

---

## 📖 什么是Azure Developer CLI？

Azure Developer CLI (azd) 是一个面向开发者的命令行工具，能够加速应用程序在Azure上的构建和部署过程。它提供：

- **基于模板的部署** - 使用预构建模板实现常见应用模式
- **基础设施即代码** - 使用Bicep或Terraform管理Azure资源  
- **集成工作流** - 无缝地配置、部署和监控应用
- **开发者友好** - 优化开发者的生产力和体验

### **AZD + Azure AI Foundry：AI部署的完美组合**

**为什么选择AZD用于AI解决方案？** AZD解决了AI开发者面临的主要挑战：

- **AI就绪模板** - 为Azure OpenAI、认知服务和机器学习工作负载预配置模板
- **安全AI部署** - 内置AI服务、API密钥和模型端点的安全模式  
- **生产AI模式** - 可扩展、成本效益高的AI应用部署最佳实践
- **端到端AI工作流** - 从模型开发到生产部署，配备完善的监控
- **成本优化** - 智能资源分配和扩展策略，适用于AI工作负载
- **Azure AI Foundry集成** - 无缝连接AI Foundry模型目录和端点

---

## 🎯 模板与示例库

### 推荐：Azure AI Foundry模板
**如果你正在部署AI应用，请从这里开始！**

| 模板 | 章节 | 复杂度 | 服务 |
|------|------|--------|------|
| [**开始AI聊天**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI模型推理API + Azure AI搜索 + Azure容器应用 + Application Insights |
| [**开始AI代理**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第2章 | ⭐⭐ | Azure AI代理服务 + AzureOpenAI + Azure AI搜索 + Azure容器应用 + Application Insights|
| [**多代理工作流自动化**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第5章 | ⭐⭐⭐ | AzureOpenAI + Azure AI代理服务 + 语义内核 + Azure CosmosDB + Azure容器应用|
| [**从数据生成文档**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第4章 | ⭐⭐⭐  | AzureOpenAI + Azure AI搜索 + Azure AI服务 + Azure CosmosDB|
| [**通过代理改善客户会议**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第5章 | ⭐⭐⭐| AzureOpenAI + Azure AI搜索 + Azure CosmosDB + Azure SQL数据库 |
| [**用代理现代化代码**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第5章 | ⭐⭐⭐ | AzureOpenAI + Azure代理服务 + 语义内核 + Azure CosmosDB + Azure容器应用|
| [**构建你的对话代理**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第4章 | ⭐⭐⭐ | AI语言 + AzureOpenAI + AI搜索 + Azure存储 + Azure容器注册表|
| [**从对话数据中解锁洞察**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第8章 | ⭐⭐⭐ | AzureOpenAI + AI搜索 + 语义内核 + Azure代理服务 + AI内容理解|
| [**多模态内容处理**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第8章 | ⭐⭐⭐⭐ | AzureOpenAI + Azure内容理解 + Azure CosmosDB + Azure容器应用|

### 推荐：完整学习场景
**生产就绪的应用模板与学习章节对应**

| 模板 | 学习章节 | 复杂度 | 关键学习 |
|------|----------|--------|----------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | 基础AI部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | 使用Azure AI搜索实现RAG |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第4章 | ⭐⭐ | 文档智能集成 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | 代理框架与函数调用 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐ | 企业AI编排 |
| [**零售多代理解决方案**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | 客户与库存代理的多代理架构 |

### 按示例类型学习

#### 简单应用（第1-2章）
- [简单Web应用](../../examples/simple-web-app) - 基础部署模式
- [静态网站](../../examples/static-site) - 静态内容部署
- [基础API](../../examples/basic-api) - REST API部署

#### 数据库集成（第3-4章）  
- [数据库应用](../../examples/database-app) - 数据库连接模式
- [数据处理](../../examples/data-processing) - ETL工作流部署

#### 高级模式（第4-8章）
- [容器应用](../../examples/container-app) - 容器化部署
- [微服务](../../examples/microservices) - 多服务架构  
- [企业解决方案](../../examples/enterprise) - 生产就绪模式

### 外部模板集合
- [**官方AZD模板库**](https://azure.github.io/awesome-azd/) - 官方和社区模板的精选集合
- [**Azure Developer CLI模板**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn模板文档
- [**示例目录**](examples/README.md) - 本地学习示例及详细说明

---

## 📚 学习资源与参考

### 快速参考
- [**命令速查表**](resources/cheat-sheet.md) - 按章节整理的azd核心命令
- [**术语表**](resources/glossary.md) - Azure和azd术语  
- [**常见问题**](resources/faq.md) - 按学习章节整理的常见问题
- [**学习指南**](resources/study-guide.md) - 全面的实践练习

### 动手工作坊
- [**AI工作坊实验室**](docs/ai-foundry/ai-workshop-lab.md) - 让你的AI解决方案支持AZD部署（2-3小时）
- [**互动工作坊指南**](workshop/README.md) - 基于MkDocs和DevContainer环境的浏览器工作坊
- [**结构化学习路径**](../../workshop/docs/instructions) - 7步指导性练习（探索 → 部署 → 定制）
- [**AZD初学者工作坊**](workshop/README.md) - 完整的动手工作坊材料，支持GitHub Codespaces集成

### 外部学习资源
- [Azure Developer CLI文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure架构中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure定价计算器](https://azure.microsoft.com/pricing/calculator/)
- [Azure状态](https://status.azure.com/)

---

## 🎓 课程完成与认证

### 进度跟踪
通过每一章节跟踪你的学习进度：

- [ ] **第1章**：基础与快速开始 ✅
- [ ] **第2章**：AI优先开发 ✅  
- [ ] **第3章**：配置与认证 ✅
- [ ] **第4章**：基础设施即代码与部署 ✅
- [ ] **第5章**：多代理AI解决方案 ✅
- [ ] **第6章**：预部署验证与规划 ✅
- [ ] **第7章**：故障排除与调试 ✅
- [ ] **第8章**：生产与企业模式 ✅

### 学习验证
完成每一章节后，通过以下方式验证你的知识：
1. **实践练习**：完成章节的动手部署
2. **知识检查**：查看章节的常见问题部分
3. **社区讨论**：在Azure Discord分享你的经验
4. **下一章节**：进入下一个复杂度级别

### 课程完成的好处
完成所有章节后，你将获得：
- **生产经验**：在Azure上部署真实的AI应用
- **专业技能**：企业级部署能力  
- **社区认可**：成为Azure开发者社区的活跃成员
- **职业发展**：掌握AZD和AI部署的热门技能

---

## 🤝 社区与支持

### 获取帮助与支持
- **技术问题**：[报告问题和请求功能](https://github.com/microsoft/azd-for-beginners/issues)
- **学习问题**：[Microsoft Azure Discord社区](https://discord.gg/microsoft-azure) 和 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI相关帮助**：加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **文档**：[官方Azure Developer CLI文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### 来自Azure AI Foundry Discord的社区洞察

**#Azure频道的最新投票结果：**
- **45%** 的开发者希望使用AZD进行AI工作负载
- **主要挑战**：多服务部署、凭证管理、生产就绪  
- **最受欢迎**：AI专属模板、故障排除指南、最佳实践

**加入我们的社区以：**
- 分享你的AZD + AI经验并获得帮助
- 获取新AI模板的早期预览
- 贡献AI部署最佳实践  
- 影响未来AI + AZD功能开发  

### 参与课程贡献  
我们欢迎您的贡献！请阅读我们的[贡献指南](CONTRIBUTING.md)，了解以下内容的详细信息：  
- **内容改进**：优化现有章节和示例  
- **新增示例**：添加真实场景和模板  
- **翻译**：帮助维护多语言支持  
- **错误报告**：提高准确性和清晰度  
- **社区标准**：遵循我们的包容性社区准则  

---

## 📄 课程信息  

### 许可证  
本项目基于MIT许可证授权 - 详情请参阅[LICENSE](../../LICENSE)文件。  

### 相关微软学习资源  

我们的团队还制作了其他全面的学习课程：  

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### Azure / Edge / MCP / Agents  
[![AZD 初学者指南](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)  
[![Edge AI 初学者指南](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)  
[![MCP 初学者指南](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
[![AI Agents 初学者指南](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  

---

### 生成式AI系列  
[![生成式AI 初学者指南](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
[![生成式AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
[![生成式AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
[![生成式AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)  

---

### 核心学习  
[![机器学习 初学者指南](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
[![数据科学 初学者指南](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
[![人工智能 初学者指南](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
[![网络安全 初学者指南](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)  
[![Web开发 初学者指南](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
[![物联网 初学者指南](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
[![XR开发 初学者指南](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)  

---

### Copilot 系列  
[![Copilot AI配对编程](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
[![Copilot 冒险](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ 课程导航  

**🚀 准备好开始学习了吗？**  

**初学者**：从[第1章：基础与快速入门](../..)开始  
**AI开发者**：跳转到[第2章：AI优先开发](../..)  
**有经验的开发者**：从[第3章：配置与认证](../..)开始  

**下一步**：[开始第1章 - AZD基础](docs/getting-started/azd-basics.md) →  

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：  
本文档使用AI翻译服务[Co-op Translator](https://github.com/Azure/co-op-translator)进行翻译。尽管我们努力确保准确性，但请注意，自动翻译可能包含错误或不准确之处。应以原始语言的文档作为权威来源。对于关键信息，建议使用专业人工翻译。我们对因使用本翻译而引起的任何误解或误读不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->