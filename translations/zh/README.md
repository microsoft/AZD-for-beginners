<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "62affa32f7697d88ec2a2d5745364db1",
  "translation_date": "2025-12-15T21:26:39+00:00",
  "source_file": "README.md",
  "language_code": "zh"
}
-->
# AZD 初学者指南：结构化学习之旅

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.zh.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## 开始本课程

按照以下步骤开始您的 AZD 学习之旅：

1. **Fork 仓库**：点击 [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **克隆仓库**：`git clone https://github.com/microsoft/azd-for-beginners.git`
3. **加入社区**：[Azure Discord 社区](https://discord.com/invite/ByRwuEEgH4) 获取专家支持
4. **选择学习路径**：从下面选择适合您经验水平的章节

### 多语言支持

#### 自动翻译（始终保持最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[阿拉伯语](../ar/README.md) | [孟加拉语](../bn/README.md) | [保加利亚语](../bg/README.md) | [缅甸语 (Myanmar)](../my/README.md) | [中文（简体）](./README.md) | [中文（繁体，香港）](../hk/README.md) | [中文（繁体，澳门）](../mo/README.md) | [中文（繁体，台湾）](../tw/README.md) | [克罗地亚语](../hr/README.md) | [捷克语](../cs/README.md) | [丹麦语](../da/README.md) | [荷兰语](../nl/README.md) | [爱沙尼亚语](../et/README.md) | [芬兰语](../fi/README.md) | [法语](../fr/README.md) | [德语](../de/README.md) | [希腊语](../el/README.md) | [希伯来语](../he/README.md) | [印地语](../hi/README.md) | [匈牙利语](../hu/README.md) | [印度尼西亚语](../id/README.md) | [意大利语](../it/README.md) | [日语](../ja/README.md) | [卡纳达语](../kn/README.md) | [韩语](../ko/README.md) | [立陶宛语](../lt/README.md) | [马来语](../ms/README.md) | [马拉雅拉姆语](../ml/README.md) | [马拉地语](../mr/README.md) | [尼泊尔语](../ne/README.md) | [尼日利亚皮钦语](../pcm/README.md) | [挪威语](../no/README.md) | [波斯语 (法尔西语)](../fa/README.md) | [波兰语](../pl/README.md) | [葡萄牙语（巴西）](../br/README.md) | [葡萄牙语（葡萄牙）](../pt/README.md) | [旁遮普语（古鲁穆奇）](../pa/README.md) | [罗马尼亚语](../ro/README.md) | [俄语](../ru/README.md) | [塞尔维亚语（西里尔字母）](../sr/README.md) | [斯洛伐克语](../sk/README.md) | [斯洛文尼亚语](../sl/README.md) | [西班牙语](../es/README.md) | [斯瓦希里语](../sw/README.md) | [瑞典语](../sv/README.md) | [他加禄语（菲律宾语）](../tl/README.md) | [泰米尔语](../ta/README.md) | [泰卢固语](../te/README.md) | [泰语](../th/README.md) | [土耳其语](../tr/README.md) | [乌克兰语](../uk/README.md) | [乌尔都语](../ur/README.md) | [越南语](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 课程概览

通过结构化章节掌握 Azure Developer CLI (azd)，实现渐进式学习。**特别关注与 Microsoft Foundry 集成的 AI 应用部署。**

### 为什么本课程对现代开发者至关重要

基于 Microsoft Foundry Discord 社区的洞察，**45% 的开发者希望使用 AZD 进行 AI 工作负载**，但面临以下挑战：
- 复杂的多服务 AI 架构
- 生产环境 AI 部署最佳实践  
- Azure AI 服务集成与配置
- AI 工作负载的成本优化
- AI 特定部署问题的故障排除

### 学习目标

完成本结构化课程后，您将能够：
- **掌握 AZD 基础**：核心概念、安装与配置
- **部署 AI 应用**：结合 Microsoft Foundry 服务使用 AZD
- **实现基础设施即代码**：使用 Bicep 模板管理 Azure 资源
- **排查部署问题**：解决常见问题并调试
- **优化生产环境**：安全、扩展、监控与成本管理
- **构建多代理解决方案**：部署复杂 AI 架构

## 📚 学习章节

*根据经验水平和目标选择您的学习路径*

### 🚀 第1章：基础与快速入门
**先决条件**：Azure 订阅，基本命令行知识  
**时长**：30-45 分钟  
**难度**：⭐

#### 您将学习
- 了解 Azure Developer CLI 基础
- 在您的平台上安装 AZD
- 完成您的首次成功部署

#### 学习资源
- **🎯 从这里开始**：[什么是 Azure Developer CLI？](../..)
- **📖 理论**：[AZD 基础](docs/getting-started/azd-basics.md) - 核心概念与术语
- **⚙️ 设置**：[安装与配置](docs/getting-started/installation.md) - 平台特定指南
- **🛠️ 实操**：[您的第一个项目](docs/getting-started/first-project.md) - 逐步教程
- **📋 快速参考**：[命令速查表](resources/cheat-sheet.md)

#### 实践练习
```bash
# 快速安装检查
azd version

# 部署您的第一个应用程序
azd init --template todo-nodejs-mongo
azd up
```

**💡 章节成果**：使用 AZD 成功部署一个简单的 Web 应用到 Azure

**✅ 成功验证：**
```bash
# 完成第1章后，您应该能够：
azd version              # 显示已安装的版本
azd init --template todo-nodejs-mongo  # 初始化项目
azd up                  # 部署到Azure
azd show                # 显示正在运行的应用程序URL
# 应用程序在浏览器中打开并正常工作
azd down --force --purge  # 清理资源
```

**📊 时间投入：** 30-45 分钟  
**📈 完成后技能水平：** 能独立部署基础应用

**✅ 成功验证：**
```bash
# 完成第1章后，您应该能够：
azd version              # 显示已安装的版本
azd init --template todo-nodejs-mongo  # 初始化项目
azd up                  # 部署到Azure
azd show                # 显示正在运行的应用程序URL
# 应用程序在浏览器中打开并正常工作
azd down --force --purge  # 清理资源
```

**📊 时间投入：** 30-45 分钟  
**📈 完成后技能水平：** 能独立部署基础应用

---

### 🤖 第2章：AI 优先开发（推荐给 AI 开发者）
**先决条件**：完成第1章  
**时长**：1-2 小时  
**难度**：⭐⭐

#### 您将学习
- Microsoft Foundry 与 AZD 集成
- 部署 AI 驱动的应用
- 理解 AI 服务配置

#### 学习资源
- **🎯 从这里开始**：[Microsoft Foundry 集成](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 模式**：[AI 模型部署](docs/microsoft-foundry/ai-model-deployment.md) - 部署与管理 AI 模型
- **🛠️ 研讨会**：[AI 研讨会实验室](docs/microsoft-foundry/ai-workshop-lab.md) - 让您的 AI 解决方案适配 AZD
- **🎥 互动指南**：[研讨会材料](workshop/README.md) - 基于浏览器的 MkDocs * DevContainer 环境学习
- **📋 模板**：[Microsoft Foundry 模板](../..)
- **📝 示例**：[AZD 部署示例](examples/README.md)

#### 实践练习
```bash
# 部署您的第一个人工智能应用程序
azd init --template azure-search-openai-demo
azd up

# 尝试更多人工智能模板
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 章节成果**：部署并配置具备 RAG 功能的 AI 驱动聊天应用

**✅ 成功验证：**
```bash
# 在第2章之后，您应该能够：
azd init --template azure-search-openai-demo
azd up
# 测试AI聊天界面
# 提问并获得带有来源的AI驱动回答
# 验证搜索集成是否正常工作
azd monitor  # 检查应用程序洞察显示遥测数据
azd down --force --purge
```

**📊 时间投入：** 1-2 小时  
**📈 完成后技能水平：** 能部署和配置生产级 AI 应用  
**💰 成本意识：** 了解开发环境月成本约 $80-150，生产环境月成本约 $300-3500

#### 💰 AI 部署成本考虑

**开发环境（估计 $80-150/月）：**
- Azure OpenAI（按使用付费）：$0-50/月（基于令牌使用量）
- AI 搜索（基础层）：$75/月
- 容器应用（消费模式）：$0-20/月
- 存储（标准）：$1-5/月

**生产环境（估计 $300-3500+/月）：**
- Azure OpenAI（PTU 保证性能）：$3000+/月 或 高流量按使用付费
- AI 搜索（标准层）：$250/月
- 容器应用（专用）：$50-100/月
- 应用洞察：$5-50/月
- 存储（高级）：$10-50/月

**💡 成本优化建议：**
- 使用 **免费层** Azure OpenAI 学习（含 50,000 令牌/月）
- 不开发时运行 `azd down` 释放资源
- 初期使用消费计费，生产环境再升级 PTU
- 使用 `azd provision --preview` 预估部署成本
- 启用自动扩缩容：只为实际使用付费

**成本监控：**
```bash
# 检查预计的每月费用
azd provision --preview

# 在 Azure 门户中监控实际费用
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第3章：配置与身份验证
**先决条件**：完成第1章  
**时长**：45-60 分钟  
**难度**：⭐⭐

#### 您将学习
- 环境配置与管理
- 身份验证与安全最佳实践
- 资源命名与组织

#### 学习资源
- **📖 配置**：[配置指南](docs/getting-started/configuration.md) - 环境设置
- **🔐 安全**：[身份验证模式与托管身份](docs/getting-started/authsecurity.md) - 身份验证模式
- **📝 示例**：[数据库应用示例](examples/database-app/README.md) - AZD 数据库示例

#### 实践练习
- 配置多个环境（开发、预发布、生产）
- 设置托管身份验证
- 实现环境特定配置

**💡 章节成果**：管理多个环境，确保身份验证和安全性

---

### 🏗️ 第4章：基础设施即代码与部署
**先决条件**：完成第1-3章  
**时长**：1-1.5 小时  
**难度**：⭐⭐⭐

#### 您将学习
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

**💡 章节成果**：使用自定义基础设施模板部署复杂多服务应用

---

### 🎯 第5章：多代理 AI 解决方案（高级）
**先决条件**：完成第1-2章  
**时长**：2-3 小时  
**难度**：⭐⭐⭐⭐

#### 您将学习
- 多代理架构模式
- 代理编排与协调
- 生产级 AI 部署

#### 学习资源
- **🤖 特色项目**：[零售多代理解决方案](examples/retail-scenario.md) - 完整实现

- **🛠️ ARM 模板**: [ARM 模板包](../../examples/retail-multiagent-arm-template) - 一键部署
- **📖 架构**: [多代理协调模式](/docs/pre-deployment/coordination-patterns.md) - 模式

#### 实践练习
```bash
# 部署完整的零售多代理解决方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索代理配置
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 章节成果**: 部署和管理具备客户和库存代理的生产就绪多代理 AI 解决方案

---

### 🔍 第6章：部署前验证与规划
**先决条件**: 完成第4章  
**时长**: 1小时  
**复杂度**: ⭐⭐

#### 你将学习
- 容量规划与资源验证
- SKU 选择策略
- 预检和自动化

#### 学习资源
- **📊 规划**: [容量规划](docs/pre-deployment/capacity-planning.md) - 资源验证
- **💰 选择**: [SKU 选择](docs/pre-deployment/sku-selection.md) - 成本效益选择
- **✅ 验证**: [预检](docs/pre-deployment/preflight-checks.md) - 自动化脚本

#### 实践练习
- 运行容量验证脚本
- 优化 SKU 选择以降低成本
- 实施自动化部署前检查

**💡 章节成果**: 在执行前验证并优化部署

---

### 🚨 第7章：故障排除与调试
**先决条件**: 完成任一部署章节  
**时长**: 1-1.5小时  
**复杂度**: ⭐⭐

#### 你将学习
- 系统化调试方法
- 常见问题及解决方案
- AI 特定故障排除

#### 学习资源
- **🔧 常见问题**: [常见问题](docs/troubleshooting/common-issues.md) - FAQ 和解决方案
- **🕵️ 调试**: [调试指南](docs/troubleshooting/debugging.md) - 逐步策略
- **🤖 AI 问题**: [AI 特定故障排除](docs/troubleshooting/ai-troubleshooting.md) - AI 服务问题

#### 实践练习
- 诊断部署失败
- 解决身份验证问题
- 调试 AI 服务连接

**💡 章节成果**: 独立诊断并解决常见部署问题

---

### 🏢 第8章：生产与企业模式
**先决条件**: 完成第1-4章  
**时长**: 2-3小时  
**复杂度**: ⭐⭐⭐⭐

#### 你将学习
- 生产部署策略
- 企业安全模式
- 监控与成本优化

#### 学习资源
- **🏭 生产**: [生产 AI 最佳实践](docs/microsoft-foundry/production-ai-practices.md) - 企业模式
- **📝 示例**: [微服务示例](../../examples/microservices) - 复杂架构
- **📊 监控**: [Application Insights 集成](docs/pre-deployment/application-insights.md) - 监控

#### 实践练习
- 实施企业安全模式
- 设置全面监控
- 以适当治理部署到生产环境

**💡 章节成果**: 部署具备完整生产能力的企业级应用

---

## 🎓 研讨会概览：动手学习体验

> **⚠️ 研讨会状态：开发中**  
> 研讨会材料正在开发和完善中。核心模块已可用，但部分高级章节尚未完成。我们正在积极完成所有内容。[查看进度 →](workshop/README.md)

### 互动研讨会材料
**基于浏览器的工具和引导练习，提供全面的动手学习体验**

我们的研讨会材料提供结构化、互动式的学习体验，补充上述章节课程。研讨会适合自学和讲师指导的课程。

#### 🛠️ 研讨会特色
- **基于浏览器的界面**: 完整的 MkDocs 支持，具备搜索、复制和主题功能
- **GitHub Codespaces 集成**: 一键设置开发环境
- **结构化学习路径**: 7步引导练习（共3.5小时）
- **发现 → 部署 → 定制**: 渐进式方法论
- **交互式 DevContainer 环境**: 预配置工具和依赖

#### 📚 研讨会结构
研讨会遵循 **发现 → 部署 → 定制** 方法论：

1. **发现阶段**（45分钟）
   - 探索 Microsoft Foundry 模板和服务
   - 理解多代理架构模式
   - 审查部署需求和先决条件

2. **部署阶段**（2小时）
   - 使用 AZD 实践部署 AI 应用
   - 配置 Azure AI 服务和端点
   - 实施安全和身份验证模式

3. **定制阶段**（45分钟）
   - 修改应用以满足特定用例
   - 优化生产部署
   - 实施监控和成本管理

#### 🚀 研讨会入门
```bash
# 选项1：GitHub Codespaces（推荐）
# 在仓库中点击“代码” → “在 main 上创建 codespace”

# 选项2：本地开发
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 按照 workshop/README.md 中的设置说明进行操作
```

#### 🎯 研讨会学习成果
完成研讨会后，参与者将能够：
- **部署生产级 AI 应用**：使用 AZD 和 Microsoft Foundry 服务
- **掌握多代理架构**：实现协调的 AI 代理解决方案
- **实施安全最佳实践**：配置身份验证和访问控制
- **优化规模**：设计成本效益高且性能优良的部署
- **故障排除部署**：独立解决常见问题

#### 📖 研讨会资源
- **🎥 互动指南**: [研讨会材料](workshop/README.md) - 基于浏览器的学习环境
- **📋 逐步指导**: [引导练习](../../workshop/docs/instructions) - 详细操作流程
- **🛠️ AI 研讨会实验室**: [AI 研讨会实验室](docs/microsoft-foundry/ai-workshop-lab.md) - AI 相关练习
- **💡 快速入门**: [研讨会设置指南](workshop/README.md#quick-start) - 环境配置

**适合对象**：企业培训、大学课程、自学和开发者训练营。

---

## 📖 什么是 Azure Developer CLI？

Azure Developer CLI (azd) 是面向开发者的命令行界面，加速构建和部署应用到 Azure 的过程。它提供：

- **基于模板的部署** - 使用预构建模板实现常见应用模式
- **基础设施即代码** - 使用 Bicep 或 Terraform 管理 Azure 资源  
- **集成工作流** - 无缝完成资源配置、部署和监控
- **开发者友好** - 优化开发者生产力和体验

### **AZD + Microsoft Foundry：AI 部署的完美组合**

**为什么选择 AZD 进行 AI 解决方案？** AZD 解决了 AI 开发者面临的主要挑战：

- **AI 就绪模板** - 预配置 Azure OpenAI、认知服务和机器学习工作负载模板
- **安全的 AI 部署** - 内置 AI 服务、API 密钥和模型端点的安全模式  
- **生产级 AI 模式** - 可扩展且成本效益高的 AI 应用部署最佳实践
- **端到端 AI 工作流** - 从模型开发到生产部署及监控
- **成本优化** - 智能资源分配和扩展策略
- **Microsoft Foundry 集成** - 无缝连接 Microsoft Foundry 模型目录和端点

---

## 🎯 模板与示例库

### 精选：Microsoft Foundry 模板
**如果你要部署 AI 应用，从这里开始！**

> **注意：** 这些模板展示了各种 AI 模式。有些是外部 Azure 示例，有些是本地实现。

| 模板 | 章节 | 复杂度 | 服务 | 类型 |
|----------|---------|------------|----------|------|
| [**AI 聊天入门**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI 模型推理 API + Azure AI 搜索 + Azure 容器应用 + Application Insights | 外部 |
| [**AI 代理入门**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第2章 | ⭐⭐ | Azure AI 代理服务 + AzureOpenAI + Azure AI 搜索 + Azure 容器应用 + Application Insights | 外部 |
| [**Azure 搜索 + OpenAI 演示**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI 搜索 + 应用服务 + 存储 | 外部 |
| [**OpenAI 聊天应用快速入门**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | AzureOpenAI + 容器应用 + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso 聊天 RAG**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐⭐ | AzureOpenAI + AI 搜索 + Cosmos DB + 容器应用 | 外部 |
| [**零售多代理解决方案**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | AzureOpenAI + AI 搜索 + 存储 + 容器应用 + Cosmos DB | **本地** |

### 精选：完整学习场景
**生产就绪应用模板，映射到学习章节**

| 模板 | 学习章节 | 复杂度 | 关键学习点 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | 基础 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | 使用 Azure AI 搜索实现 RAG |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第4章 | ⭐⭐ | 文档智能集成 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | 代理框架与函数调用 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐ | 企业 AI 编排 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | 具客户和库存代理的多代理架构 |

### 按示例类型学习

> **📌 本地示例 vs. 外部示例：**  
> **本地示例**（本仓库）= 可立即使用  
> **外部示例**（Azure 示例）= 从链接仓库克隆

#### 本地示例（可立即使用）
- [**零售多代理解决方案**](examples/retail-scenario.md) - 完整生产就绪实现，含 ARM 模板
  - 多代理架构（客户 + 库存代理）
  - 全面监控与评估
  - 通过 ARM 模板一键部署

#### 本地示例 - 容器应用（第2-5章）
**本仓库中的全面容器部署示例：**
- [**容器应用示例**](examples/container-app/README.md) - 容器化部署完整指南
  - [简单 Flask API](../../examples/container-app/simple-flask-api) - 基础 REST API，支持零扩展
  - [微服务架构](../../examples/container-app/microservices) - 生产就绪多服务部署
  - 快速入门、生产和高级部署模式
  - 监控、安全和成本优化指导

#### 外部示例 - 简单应用（第1-2章）
**克隆这些 Azure 示例仓库开始：**
- [简单 Web 应用 - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基础部署模式
- [静态网站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 静态内容部署
- [容器应用 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署

#### 外部示例 - 数据库集成（第3-4章）  
- [数据库应用 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 数据库连接模式
- [函数 + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 无服务器数据工作流

#### 外部示例 - 高级模式（第4-8章）
- [Java 微服务](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服务架构
- [容器应用作业](https://github.com/Azure-Samples/container-apps-jobs) - 后台处理  
- [企业 ML 流水线](https://github.com/Azure-Samples/mlops-v2) - 生产就绪 ML 模式

### 外部模板集合
- [**官方 AZD 模板库**](https://azure.github.io/awesome-azd/) - 官方和社区模板精选
- [**Azure Developer CLI 模板**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 模板文档
- [**示例目录**](examples/README.md) - 本地学习示例及详细说明

---

## 📚 学习资源与参考

### 快速参考
- [**命令速查表**](resources/cheat-sheet.md) - 按章节组织的必备 azd 命令
- [**术语表**](resources/glossary.md) - Azure 和 azd 术语  
- [**常见问题**](resources/faq.md) - 按学习章节组织的常见问题
- [**学习指南**](resources/study-guide.md) - 综合练习题

### 实操工作坊
- [**AI 工作坊实验室**](docs/microsoft-foundry/ai-workshop-lab.md) - 让您的 AI 解决方案支持 AZD 部署（2-3 小时）
- [**交互式工作坊指南**](workshop/README.md) - 基于浏览器的 MkDocs 和 DevContainer 环境工作坊
- [**结构化学习路径**](../../workshop/docs/instructions) - 7 步引导练习（发现 → 部署 → 定制）
- [**AZD 初学者工作坊**](workshop/README.md) - 完整的实操工作坊材料，集成 GitHub Codespaces

### 外部学习资源
- [Azure Developer CLI 文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架构中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 价格计算器](https://azure.microsoft.com/pricing/calculator/)
- [Azure 状态](https://status.azure.com/)

---

## 🔧 快速故障排除指南

**初学者常见问题及即时解决方案：**

### ❌ “azd: command not found”

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

### ❌ “未找到订阅”或“未设置订阅”

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

### ❌ “配额不足”或“超出配额”

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

### ❌ “azd up” 中途失败

```bash
# 选项1：清理并重试
azd down --force --purge
azd up

# 选项2：仅修复基础设施
azd provision

# 选项3：检查详细日志
azd show
azd logs
```

### ❌ “身份验证失败”或“令牌过期”

```bash
# 重新认证
az logout
az login

azd auth logout
azd auth login

# 验证身份认证
az account show
```

### ❌ “资源已存在”或命名冲突

```bash
# AZD 生成唯一名称，但如果冲突：
azd down --force --purge

# 则使用新的环境重试
azd env new dev-v2
azd up
```

### ❌ 模板部署时间过长

**正常等待时间：**
- 简单 Web 应用：5-10 分钟
- 带数据库的应用：10-15 分钟
- AI 应用：15-25 分钟（OpenAI 配置较慢）

```bash
# 检查进度
azd show

# 如果卡住超过30分钟，检查Azure门户：
azd monitor
# 查找失败的部署
```

### ❌ “权限被拒绝”或“禁止访问”

```bash
# 检查您的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 您至少需要“参与者”角色
# 请您的 Azure 管理员授予：
# - 参与者（用于资源）
# - 用户访问管理员（用于角色分配）
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

### 📚 完整故障排除资源

- **常见问题指南：** [详细解决方案](docs/troubleshooting/common-issues.md)
- **AI 专用问题：** [AI 故障排除](docs/troubleshooting/ai-troubleshooting.md)
- **调试指南：** [逐步调试](docs/troubleshooting/debugging.md)
- **获取帮助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 快速故障排除指南

**初学者常见问题及即时解决方案：**

<details>
<summary><strong>❌ “azd: command not found”</strong></summary>

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
<summary><strong>❌ “未找到订阅”或“未设置订阅”</strong></summary>

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
<summary><strong>❌ “配额不足”或“超出配额”</strong></summary>

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
<summary><strong>❌ “azd up” 中途失败</strong></summary>

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
<summary><strong>❌ “身份验证失败”或“令牌过期”</strong></summary>

```bash
# 重新认证
az logout
az login

azd auth logout
azd auth login

# 验证身份认证
az account show
```
</details>

<details>
<summary><strong>❌ “资源已存在”或命名冲突</strong></summary>

```bash
# AZD 会生成唯一名称，但如果发生冲突：
azd down --force --purge

# 则使用新的环境重试
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 模板部署时间过长</strong></summary>

**正常等待时间：**
- 简单 Web 应用：5-10 分钟
- 带数据库的应用：10-15 分钟
- AI 应用：15-25 分钟（OpenAI 配置较慢）

```bash
# 检查进度
azd show

# 如果卡住超过30分钟，检查Azure门户：
azd monitor
# 查找失败的部署
```
</details>

<details>
<summary><strong>❌ “权限被拒绝”或“禁止访问”</strong></summary>

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

### 📚 完整故障排除资源

- **常见问题指南：** [详细解决方案](docs/troubleshooting/common-issues.md)
- **AI 专用问题：** [AI 故障排除](docs/troubleshooting/ai-troubleshooting.md)
- **调试指南：** [逐步调试](docs/troubleshooting/debugging.md)
- **获取帮助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 课程完成与认证

### 进度跟踪
跟踪您每个章节的学习进度：

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
1. **实践练习**：完成该章节的实操部署
2. **知识检测**：查看该章节的常见问题部分
3. **社区讨论**：在 Azure Discord 分享您的经验
4. **下一章节**：进入下一个难度级别

### 课程完成收益
完成所有章节后，您将获得：
- **生产经验**：将真实 AI 应用部署到 Azure
- **专业技能**：具备企业级部署能力  
- **社区认可**：成为活跃的 Azure 开发者社区成员
- **职业发展**：掌握热门的 AZD 和 AI 部署技能

---

## 🤝 社区与支持

### 获取帮助与支持
- **技术问题**：[报告错误和请求功能](https://github.com/microsoft/azd-for-beginners/issues)
- **学习问题**：[Microsoft Azure Discord 社区](https://discord.gg/microsoft-azure) 和 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 专用帮助**：加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **文档**：[官方 Azure Developer CLI 文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### 来自 Microsoft Foundry Discord 的社区见解

**#Azure 频道的最新投票结果：**
- **45%** 的开发者希望使用 AZD 进行 AI 工作负载
- **主要挑战**：多服务部署、凭据管理、生产准备  
- **最受欢迎需求**：AI 专用模板、故障排除指南、最佳实践

**加入我们的社区，您可以：**
- 分享您的 AZD + AI 经验并获得帮助
- 访问新 AI 模板的早期预览
- 参与 AI 部署最佳实践的贡献
- 影响未来 AI + AZD 功能开发

### 课程贡献
欢迎贡献！请阅读我们的[贡献指南](CONTRIBUTING.md)了解详情：
- **内容改进**：完善现有章节和示例
- **新增示例**：添加真实场景和模板  
- **翻译**：协助维护多语言支持
- **错误报告**：提升准确性和清晰度
- **社区规范**：遵守我们的包容性社区准则

---

## 📄 课程信息

### 许可证
本项目采用 MIT 许可证 - 详情请参见 [LICENSE](../../LICENSE) 文件。

### 相关 Microsoft 学习资源

我们的团队还制作了其他综合学习课程：

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### Azure / Edge / MCP / Agents
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### 生成式 AI 系列
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### 核心学习
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot 系列
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ 课程导航

**🚀 准备开始学习了吗？**

**初学者**：从[第1章：基础与快速入门](../..)开始  
**AI开发者**：跳转到[第2章：AI优先开发](../..)  
**有经验的开发者**：从[第3章：配置与身份验证](../..)开始

**下一步**：[开始第1章 - AZD基础](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：  
本文件由人工智能翻译服务[Co-op Translator](https://github.com/Azure/co-op-translator)翻译而成。虽然我们力求准确，但请注意自动翻译可能包含错误或不准确之处。原始文件的母语版本应被视为权威来源。对于重要信息，建议使用专业人工翻译。因使用本翻译而产生的任何误解或误释，我们概不负责。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->