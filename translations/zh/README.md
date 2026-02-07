<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6d5c886052b605349d9219cea5f2f6a1",
  "translation_date": "2026-01-16T08:43:14+00:00",
  "source_file": "README.md",
  "language_code": "zh"
}
-->
# AZD 初学者指南：结构化学习之旅

![AZD-for-beginners](../../../../translated_images/zh-CN/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## 开始本课程

请按照以下步骤开始您的 AZD 学习之旅：

1. **Fork 仓库**：点击 [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **克隆仓库**：`git clone https://github.com/microsoft/azd-for-beginners.git`
3. **加入社区**：加入 [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) 寻求专家支持
4. **选择学习路径**：从下方选择与您经验水平相匹配的章节

### 多语言支持

#### 自动翻译（始终保持最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[阿拉伯语](../ar/README.md) | [孟加拉语](../bn/README.md) | [保加利亚语](../bg/README.md) | [缅甸语 (缅甸)](../my/README.md) | [中文 (简体)](./README.md) | [中文 (繁体，香港)](../hk/README.md) | [中文 (繁体，澳门)](../mo/README.md) | [中文 (繁体，台湾)](../tw/README.md) | [克罗地亚语](../hr/README.md) | [捷克语](../cs/README.md) | [丹麦语](../da/README.md) | [荷兰语](../nl/README.md) | [爱沙尼亚语](../et/README.md) | [芬兰语](../fi/README.md) | [法语](../fr/README.md) | [德语](../de/README.md) | [希腊语](../el/README.md) | [希伯来语](../he/README.md) | [印地语](../hi/README.md) | [匈牙利语](../hu/README.md) | [印度尼西亚语](../id/README.md) | [意大利语](../it/README.md) | [日语](../ja/README.md) | [坎纳达语](../kn/README.md) | [韩语](../ko/README.md) | [立陶宛语](../lt/README.md) | [马来语](../ms/README.md) | [马拉雅拉姆语](../ml/README.md) | [马拉地语](../mr/README.md) | [尼泊尔语](../ne/README.md) | [尼日利亚皮钦语](../pcm/README.md) | [挪威语](../no/README.md) | [波斯语 (法尔斯语)](../fa/README.md) | [波兰语](../pl/README.md) | [葡萄牙语 (巴西)](../br/README.md) | [葡萄牙语 (葡萄牙)](../pt/README.md) | [旁遮普语 (古鲁穆克希文)](../pa/README.md) | [罗马尼亚语](../ro/README.md) | [俄语](../ru/README.md) | [塞尔维亚语 (西里尔字母)](../sr/README.md) | [斯洛伐克语](../sk/README.md) | [斯洛文尼亚语](../sl/README.md) | [西班牙语](../es/README.md) | [斯瓦希里语](../sw/README.md) | [瑞典语](../sv/README.md) | [他加禄语 (菲律宾语)](../tl/README.md) | [泰米尔语](../ta/README.md) | [泰卢固语](../te/README.md) | [泰语](../th/README.md) | [土耳其语](../tr/README.md) | [乌克兰语](../uk/README.md) | [乌尔都语](../ur/README.md) | [越南语](../vi/README.md)

> **想要本地克隆？**

> 本仓库包含 50 多种语言翻译，显著增加下载大小。若想克隆无翻译版本，请使用稀疏检出（sparse checkout）：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 这能让您以更快的速度下载并完成课程所需的一切。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 课程概览

通过结构化章节掌握 Azure Developer CLI (azd)，逐步学习进阶。**特别聚焦于结合 Microsoft Foundry 实现的 AI 应用部署。**

### 为什么现代开发者必须掌握本课程

根据 Microsoft Foundry Discord 社区的反馈，**45% 的开发者希望使用 AZD 来完成 AI 工作负载**，但常遇到以下挑战：
- 复杂的多服务 AI 架构
- AI 生产环境部署最佳实践  
- Azure AI 服务的集成与配置
- AI 工作负载的成本优化
- AI 专用部署问题排查

### 学习目标

完成本结构化课程后，您将能够：
- **精通 AZD 基础**：核心概念、安装及配置
- **部署 AI 应用**：结合 Microsoft Foundry 服务使用 AZD
- **实现基础设施即代码**：使用 Bicep 模板管理 Azure 资源
- **排查部署问题**：解决常见问题并调试故障
- **优化生产环境**：安全性、扩展性、监控及成本管理
- **构建多代理解决方案**：部署复杂 AI 架构

## 📚 学习章节

*根据经验水平与目标选择学习路径*

### 🚀 第1章：基础与快速入门
**前提条件**：拥有 Azure 订阅，具备基础命令行知识  
**时长**：30-45分钟  
**难度**：⭐

#### 您将学习到
- 了解 Azure Developer CLI 基础
- 在您的平台上安装 AZD
- 完成首次成功部署

#### 学习资源
- **🎯 从这里开始**：[什么是 Azure Developer CLI？](../..)
- **📖 理论**：[AZD 基础](docs/getting-started/azd-basics.md) - 核心概念和术语
- **⚙️ 安装**：[安装与设置](docs/getting-started/installation.md) - 各平台指南
- **🛠️ 实操**：[您的第一个项目](docs/getting-started/first-project.md) - 步骤教程
- **📋 快速查阅**：[命令速查表](resources/cheat-sheet.md)

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
azd show                # 显示运行中应用的URL
# 应用在浏览器中打开并正常运行
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
# 应用程序在浏览器中打开并正常运行
azd down --force --purge  # 清理资源
```

**📊 时间投入：** 30-45 分钟  
**📈 完成后技能水平：** 能独立部署基础应用

---

### 🤖 第2章：AI 优先开发（推荐 AI 开发者）
**前提条件**：完成第1章  
**时长**：1-2 小时  
**难度**：⭐⭐

#### 您将学习到
- 使用 AZD 集成 Microsoft Foundry 服务
- AI 驱动应用的部署
- AI 服务的配置理解

#### 学习资源
- **🎯 从这里开始**：[Microsoft Foundry 集成](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 模式**：[AI 模型部署](docs/microsoft-foundry/ai-model-deployment.md) - AI 模型的部署与管理
- **🛠️ 研讨会**：[AI 研讨实验室](docs/microsoft-foundry/ai-workshop-lab.md) - 让您的 AI 解决方案符合 AZD 要求
- **🎥 互动指南**：[研讨会资料](workshop/README.md) - 基于浏览器的 MkDocs 学习 * DevContainer 环境
- **📋 模板**：[Microsoft Foundry 模板](../..)
- **📝 示例**：[AZD 部署示例](examples/README.md)

#### 实践练习
```bash
# 部署您的第一个AI应用程序
azd init --template azure-search-openai-demo
azd up

# 试用更多AI模板
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 章节成果**：部署并配置具备 RAG 功能的 AI 驱动聊天应用

**✅ 成功验证：**
```bash
# 在第二章之后，你应该能够：
azd init --template azure-search-openai-demo
azd up
# 测试 AI 聊天界面
# 提问并获得带有来源的 AI 驱动回答
# 验证搜索集成功能正常
azd monitor  # 检查应用程序洞察显示遥测数据
azd down --force --purge
```

**📊 时间投入：** 1-2 小时  
**📈 完成后技能水平：** 能部署并配置生产就绪的 AI 应用  
**💰 成本了解：** 了解开发环境约 $80-150/月，生产环境约 $300-3500/月的费用

#### 💰 AI 部署成本考虑

**开发环境（预计 $80-150/月）：**
- Azure OpenAI（按使用付费）：$0-50/月（基于令牌使用量）
- AI 搜索（基础层）：$75/月
- 容器应用（按消费计费）：$0-20/月
- 存储（标准）：$1-5/月

**生产环境（预计 $300-3500+ /月）：**
- Azure OpenAI（为稳定性能购买 PTU）：$3000+/月，或者高流量按使用付费
- AI 搜索（标准层）：$250/月
- 容器应用（专用）：$50-100/月
- 应用洞察：$5-50/月
- 存储（高级）：$10-50/月

**💡 成本优化建议：**
- 学习阶段使用 **免费额度** Azure OpenAI（包含 50,000 令牌/月）
- 非开发时运行 `azd down` 释放资源
- 初期使用按消费计费，生产环境仅针对生产升级 PTU
- 使用 `azd provision --preview` 部署前预估费用
- 启用自动扩缩，按实际使用付费

**成本监控：**
```bash
# 检查预计的月度费用
azd provision --preview

# 在 Azure 门户中监控实际费用
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第3章：配置与认证
**前提条件**：完成第1章  
**时长**：45-60分钟  
**难度**：⭐⭐

#### 您将学习到
- 环境配置与管理
- 认证与安全最佳实践
- 资源命名与组织

#### 学习资源
- **📖 配置**：[配置指南](docs/getting-started/configuration.md) - 环境设置
- **🔐 安全**：[认证模式与托管身份](docs/getting-started/authsecurity.md) - 认证模式介绍
- **📝 示例**：[数据库应用示例](examples/database-app/README.md) - AZD 数据库示例

#### 实践练习
- 配置多个环境（开发、测试、生产）
- 设置托管身份认证
- 实现环境特定配置

**💡 章节成果**：能够管理多环境，确保适当认证与安全

---

### 🏗️ 第4章：基础设施即代码与部署
**前提条件**：完成第1-3章  
**时长**：1-1.5小时  
**难度**：⭐⭐⭐

#### 您将学习到
- 高级部署模式
- 使用 Bicep 实现基础设施即代码
- 资源编排策略

#### 学习资源
- **📖 部署**：[部署指南](docs/deployment/deployment-guide.md) - 完整流程
- **🏗️ 资源预配**：[资源编排](docs/deployment/provisioning.md) - Azure 资源管理
- **📝 示例**：[容器应用示例](../../examples/container-app) - 容器化部署

#### 实践练习
- 创建自定义 Bicep 模板
- 部署多服务应用
- 实现蓝绿部署策略

**💡 章节成果**：能够使用自定义基础设施模板部署复杂多服务应用

---

### 🎯 第5章：多代理 AI 解决方案（高级）
**前提条件**：完成第1-2章  
**时长**：2-3小时  
**难度**：⭐⭐⭐⭐

#### 您将学习到
- 多代理架构模式
- 代理编排与协调
- 生产就绪的 AI 部署

#### 学习资源
- **🤖 精选项目**：[零售多代理解决方案](examples/retail-scenario.md) - 完整实现
- **🛠️ ARM 模板**：[ARM 模板包](../../examples/retail-multiagent-arm-template) - 一键部署
- **📖 架构**：[多代理协调模式](/docs/pre-deployment/coordination-patterns.md) - 模式

#### 实践练习
```bash
# 部署完整的零售多代理解决方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索代理配置
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 章节成果**：部署并管理具备客户和库存代理的生产就绪多代理 AI 解决方案

---

### 🔍 第 6 章：部署前验证与规划
**先决条件**：完成第 4 章  
**时长**：1 小时  
**复杂度**：⭐⭐

#### 你将学习
- 容量规划与资源验证
- SKU 选择策略
- 预检与自动化

#### 学习资源
- **📊 规划**：[容量规划](docs/pre-deployment/capacity-planning.md) - 资源验证
- **💰 选择**：[SKU 选择](docs/pre-deployment/sku-selection.md) - 经济实惠的选择
- **✅ 验证**：[预检](docs/pre-deployment/preflight-checks.md) - 自动化脚本

#### 实践练习
- 运行容量验证脚本
- 优化 SKU 选择以降低成本
- 实现自动化预部署检查

**💡 章节成果**：在执行前验证并优化部署

---

### 🚨 第 7 章：故障排查与调试
**先决条件**：完成任意部署章节  
**时长**：1-1.5 小时  
**复杂度**：⭐⭐

#### 你将学习
- 系统化调试方法
- 常见问题及解决方案
- AI 专用故障排查

#### 学习资源
- **🔧 常见问题**：[常见问题](docs/troubleshooting/common-issues.md) - 常见问答与解决方案
- **🕵️ 调试**：[调试指南](docs/troubleshooting/debugging.md) - 逐步策略
- **🤖 AI 问题**：[AI 专用故障排查](docs/troubleshooting/ai-troubleshooting.md) - AI 服务问题

#### 实践练习
- 诊断部署失败
- 解决身份验证问题
- 调试 AI 服务连接

**💡 章节成果**：独立诊断并解决常见部署问题

---

### 🏢 第 8 章：生产与企业模式
**先决条件**：完成第 1-4 章  
**时长**：2-3 小时  
**复杂度**：⭐⭐⭐⭐

#### 你将学习
- 生产部署策略
- 企业安全模式
- 监控与成本优化

#### 学习资源
- **🏭 生产**：[生产 AI 最佳实践](docs/microsoft-foundry/production-ai-practices.md) - 企业模式
- **📝 示例**：[微服务示例](../../examples/microservices) - 复杂架构
- **📊 监控**：[Application Insights 集成](docs/pre-deployment/application-insights.md) - 监控

#### 实践练习
- 实施企业安全模式
- 设置全面监控
- 按照治理要求部署到生产环境

**💡 章节成果**：部署具备完整生产能力的企业级应用

---

## 🎓 研讨会概览：动手学习体验

> **⚠️ 研讨会状态：积极开发中**  
> 研讨会材料正在开发和完善中。核心模块可用，但部分高级部分尚未完成。我们正在积极推进所有内容的完成。[跟踪进度 →](workshop/README.md)

### 交互式研讨会材料
**基于浏览器的工具和指导练习，全面动手学习体验**

我们的研讨会材料提供了结构化、互动式的学习体验，补充上面的章节式课程。研讨会既适合自学，也适合导师引导课程。

#### 🛠️ 研讨会特点
- **浏览器界面**：完整的 MkDocs 驱动研讨会，具备搜索、复制和主题功能
- **GitHub Codespaces 集成**：一键搭建开发环境
- **结构化学习路径**：7 步引导式练习（共计 3.5 小时）
- **发现 → 部署 → 定制**：渐进式方法论
- **交互式 DevContainer 环境**：预配置工具及依赖

#### 📚 研讨会结构
研讨会沿用 **发现 → 部署 → 定制** 方法论：

1. **发现阶段**（45 分钟）
   - 探索 Microsoft Foundry 模板及服务
   - 理解多代理架构模式
   - 审查部署需求与先决条件

2. **部署阶段**（2 小时）
   - 通过 AZD 亲自动手部署 AI 应用
   - 配置 Azure AI 服务及端点
   - 实现安全和身份验证模式

3. **定制阶段**（45 分钟）
   - 修改应用以满足具体用例
   - 优化生产部署
   - 实施监控与成本管理

#### 🚀 研讨会入门
```bash
# 选项 1：GitHub Codespaces（推荐）
# 在仓库中点击“代码”→“在 main 上创建 codespace”

# 选项 2：本地开发
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 请按照 workshop/README.md 中的设置说明操作
```

#### 🎯 研讨会学习成果
完成研讨会后，参与者将能够：
- **部署生产 AI 应用**：使用 AZD 和 Microsoft Foundry 服务
- **掌握多代理架构**：实现协调的 AI 代理解决方案
- **实施安全最佳实践**：配置身份验证和访问控制
- **优化扩展能力**：设计经济高效、性能优越的部署
- **故障排查**：独立解决常见部署问题

#### 📖 研讨会资源
- **🎥 交互式指南**：[研讨会材料](workshop/README.md) - 浏览器学习环境
- **📋 逐步指导**：[引导练习](../../workshop/docs/instructions) - 详细操作手册
- **🛠️ AI 研讨室**：[AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - AI 专项练习
- **💡 快速开始**：[研讨会设置指南](workshop/README.md#quick-start) - 环境配置

**适合**：企业培训、大学课程、自主学习及开发者训练营。

---

## 📖 什么是 Azure Developer CLI？

Azure Developer CLI（azd）是一款面向开发者的命令行界面，加速应用构建和部署到 Azure。它提供：

- **基于模板的部署** - 利用预构建模板满足常见应用模式
- **基础设施即代码** - 通过 Bicep 或 Terraform 管理 Azure 资源  
- **集成化工作流** - 无缝进行资源预配、部署和监控
- **开发者友好** - 优化开发者生产力和体验

### **AZD + Microsoft Foundry：AI 部署的理想组合**

**为什么选择 AZD 部署 AI 解决方案？** AZD 针对 AI 开发者面临的核心挑战提供支持：

- **AI 就绪模板** - 预配置 Azure OpenAI、认知服务和机器学习工作负载模板
- **安全的 AI 部署** - 内置 AI 服务、安全密钥和模型端点的安全模式  
- **生产 AI 模式** - 可扩展且成本效益高的 AI 应用最佳实践
- **端到端 AI 工作流** - 从模型开发到生产部署并附带完善监控
- **成本优化** - 智能资源分配和扩展策略
- **Microsoft Foundry 集成** - 无缝对接 Microsoft Foundry 模型目录和端点

---

## 🎯 模板与示例库

### 精选：Microsoft Foundry 模板
**如果你正在部署 AI 应用，从这里开始！**

> **注意：** 这些模板展示了多种 AI 模式。有些是外部 Azure 示例，另一些是本地实现。

| 模板 | 章节 | 复杂度 | 服务 | 类型 |
|----------|---------|------------|----------|------|
| [**AI 聊天快速入门**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第 2 章 | ⭐⭐ | AzureOpenAI + Azure AI 推理 API + Azure AI 搜索 + Azure Container Apps + 应用洞察 | 外部 |
| [**AI 代理快速入门**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第 2 章 | ⭐⭐ | Azure AI 代理服务 + AzureOpenAI + Azure AI 搜索 + Azure Container Apps + 应用洞察 | 外部 |
| [**Azure 搜索 + OpenAI 演示**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第 2 章 | ⭐⭐ | AzureOpenAI + Azure AI 搜索 + 应用服务 + 存储 | 外部 |
| [**OpenAI 聊天应用快速启动**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第 2 章 | ⭐ | AzureOpenAI + Container Apps + 应用洞察 | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第 5 章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 第 8 章 | ⭐⭐⭐⭐ | AzureOpenAI + AI 搜索 + Cosmos DB + Container Apps | 外部 |
| [**零售多代理解决方案**](examples/retail-scenario.md) | 第 5 章 | ⭐⭐⭐⭐ | AzureOpenAI + AI 搜索 + 存储 + Container Apps + Cosmos DB | **本地** |

### 精选：完整学习场景
**生产就绪应用模板，映射学习章节**

| 模板 | 学习章节 | 复杂度 | 关键学习点 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第 2 章 | ⭐ | 基础 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第 2 章 | ⭐⭐ | 结合 Azure AI 搜索的 RAG 实现 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第 4 章 | ⭐⭐ | 文档智能集成 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第 5 章 | ⭐⭐⭐ | 代理框架与函数调用 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第 8 章 | ⭐⭐⭐ | 企业 AI 编排 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第 5 章 | ⭐⭐⭐⭐ | 客户和库存代理的多代理架构 |

### 按示例类型学习

> **📌 本地 vs. 外部示例：**  
> **本地示例**（本仓库）= 可立即使用  
> **外部示例**（Azure 示例）= 从关联仓库克隆

#### 本地示例（可立即使用）
- [**零售多代理解决方案**](examples/retail-scenario.md) - 完整生产就绪实现及 ARM 模板
  - 多代理架构（客户与库存代理）
  - 完整监控与评估
  - 一键通过 ARM 模板部署

#### 本地示例 - 容器应用（第 2-5 章）
**本仓库中全面的容器部署示例：**
- [**容器应用示例**](examples/container-app/README.md) - 容器化部署完整指南
  - [简单 Flask API](../../examples/container-app/simple-flask-api) - 基础 REST API，支持零伸缩
  - [微服务架构](../../examples/container-app/microservices) - 生产就绪多服务部署
  - 快速开始、生产和高级部署模式
  - 监控、安全及成本优化指导

#### 外部示例 - 简单应用（第 1-2 章）
**克隆这些 Azure 示例仓库以快速入门：**
- [简单 Web 应用 - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基础部署模式
- [静态网站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 静态内容部署
- [容器应用 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署

#### 外部示例 - 数据库集成（第 3-4 章）  
- [数据库应用 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 数据库连接模式
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 无服务器数据工作流

#### 外部示例 - 高级模式（第 4-8 章）
- [Java 微服务](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服务架构
- [容器应用作业](https://github.com/Azure-Samples/container-apps-jobs) - 后台处理  
- [企业 ML 管道](https://github.com/Azure-Samples/mlops-v2) - 生产就绪机器学习模式

### 外部模板集合
- [**官方 AZD 模板库**](https://azure.github.io/awesome-azd/) - 官方及社区精选模板合集
- [**Azure Developer CLI 模板**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 模板文档
- [**示例目录**](examples/README.md) - 带有详细说明的本地学习示例

---

## 📚 学习资源与参考

### 快速参考
- [**命令速查表**](resources/cheat-sheet.md) - 按章节组织的关键 azd 命令
- [**术语表**](resources/glossary.md) - Azure 和 azd 术语  
- [**常见问题解答**](resources/faq.md) - 按学习章节组织的常见问题
- [**学习指南**](resources/study-guide.md) - 综合练习题

### 亲身实践工作坊
- [**AI 工作坊实验室**](docs/microsoft-foundry/ai-workshop-lab.md) - 让您的 AI 解决方案可通过 AZD 部署（2-3 小时）
- [**交互式工作坊指南**](workshop/README.md) - 基于浏览器的工作坊，使用 MkDocs 和 DevContainer 环境
- [**结构化学习路径**](../../workshop/docs/instructions) - 7 步引导练习（探索 → 部署 → 定制）
- [**AZD 初学者工作坊**](workshop/README.md) - 完整的动手工作坊材料，集成 GitHub Codespaces

### 外部学习资源
- [Azure 开发者 CLI 文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架构中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 价格计算器](https://azure.microsoft.com/pricing/calculator/)
- [Azure 状态](https://status.azure.com/)

---

## 🔧 快速故障排除指南

**初学者常见问题及即时解决方案：**

### ❌ “azd: 未找到命令”

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

### ❌ “配额不足”或“配额超限”

```bash
# 尝试不同的 Azure 区域
azd env set AZURE_LOCATION "westus2"
azd up

# 或在开发中使用更小的 SKU
# 编辑 infra/main.parameters.json：
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ “azd up” 在中途失败

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

### ❌ “认证失败”或“令牌已过期”

```bash
# 重新验证身份
az logout
az login

azd auth logout
azd auth login

# 验证身份认证
az account show
```

### ❌ “资源已存在”或命名冲突

```bash
# AZD 会生成唯一名称，但如果发生冲突：
azd down --force --purge

# 则使用新的环境重试
azd env new dev-v2
azd up
```

### ❌ 模板部署时间过长

**正常等待时间：**
- 简单的 Web 应用：5-10 分钟
- 含数据库的应用：10-15 分钟
- AI 应用：15-25 分钟（OpenAI 资源预配较慢）

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
# - 参与者（针对资源）
# - 用户访问管理员（针对角色分配）
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
- **AI 专属问题：** [AI 故障排除](docs/troubleshooting/ai-troubleshooting.md)
- **调试指南：** [逐步调试](docs/troubleshooting/debugging.md)
- **求助途径：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 快速故障排除指南

**初学者常见问题及即时解决方案：**

<details>
<summary><strong>❌ “azd: 未找到命令”</strong></summary>

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
# 列出可用订阅
az account list --output table

# 设置默认订阅
az account set --subscription "<subscription-id-or-name>"

# 设置AZD环境
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# 验证
az account show
```
</details>

<details>
<summary><strong>❌ “配额不足”或“配额超限”</strong></summary>

```bash
# 尝试不同的 Azure 区域
azd env set AZURE_LOCATION "westus2"
azd up

# 或在开发中使用较小的 SKU
# 编辑 infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ “azd up” 在中途失败</strong></summary>

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
<summary><strong>❌ “认证失败”或“令牌已过期”</strong></summary>

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
# AZD 会生成唯一的名称，但如果发生冲突：
azd down --force --purge

# 则使用新的环境重试
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 模板部署时间过长</strong></summary>

**正常等待时间：**
- 简单的 Web 应用：5-10 分钟
- 含数据库的应用：10-15 分钟
- AI 应用：15-25 分钟（OpenAI 资源预配较慢）

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
- **AI 专属问题：** [AI 故障排除](docs/troubleshooting/ai-troubleshooting.md)
- **调试指南：** [逐步调试](docs/troubleshooting/debugging.md)
- **求助途径：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 课程完成与认证

### 进度追踪
跟踪您每章节的学习进展：

- [ ] **第 1 章**：基础与快速入门 ✅
- [ ] **第 2 章**：AI 优先开发 ✅  
- [ ] **第 3 章**：配置与认证 ✅
- [ ] **第 4 章**：基础设施即代码与部署 ✅
- [ ] **第 5 章**：多代理 AI 解决方案 ✅
- [ ] **第 6 章**：部署前验证与规划 ✅
- [ ] **第 7 章**：故障排除与调试 ✅
- [ ] **第 8 章**：生产与企业架构 ✅

### 学习验证
完成每章节后，验证您的知识：
1. **实践练习**：完成本章的动手部署
2. **知识检查**：复习本章常见问题解答
3. **社区讨论**：在 Azure Discord 分享您的经验
4. **下一章节**：进入更高难度章节

### 课程完成优势
完成全套章节后，您将获得：
- **生产经验**：成功将真实 AI 应用部署到 Azure
- **专业技能**：企业级部署能力  
- **社区认可**：Azure 开发者社区活跃成员
- **职业提升**：备受需求的 AZD 和 AI 部署专业知识

---

## 🤝 社区与支持

### 寻求帮助与支持
- **技术问题**：[报告错误和提出功能请求](https://github.com/microsoft/azd-for-beginners/issues)
- **学习疑问**：[Microsoft Azure Discord 社区](https://discord.gg/microsoft-azure) 及 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 相关帮助**：加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **官方文档**：[Azure Developer CLI 官方文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### 来自 Microsoft Foundry Discord 的社区见解

**#Azure 频道最新投票结果：**
- **45%** 的开发者希望使用 AZD 进行 AI 工作负载
- **主要挑战**：多服务部署、凭据管理、生产就绪度  
- **最受欢迎**：AI 专用模板、故障排除指南、最佳实践

**加入我们的社区，您可以：**
- 分享您的 AZD + AI 经验并获得帮助
- 访问 AI 新模板的抢先体验
- 共同完善 AI 部署最佳实践
- 影响未来 AI + AZD 功能发展

### 课程贡献
欢迎您的贡献！请阅读我们的 [贡献指南](CONTRIBUTING.md) 了解详情：
- **内容改进**：强化现有章节和示例
- **新示例**：添加真实场景和模板  
- **翻译支持**：协助维护多语言支持
- **错误报告**：提升准确性与清晰度
- **社区规范**：遵守包容性社区准则

---

## 📄 课程信息

### 许可协议
本项目采用 MIT 许可协议 - 详见 [LICENSE](../../LICENSE) 文件。

### 相关 Microsoft 学习资源

我们的团队还制作了其他综合学习课程：

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

---

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
**AI 开发者**：跳转到[第2章：AI优先开发](../..)  
**有经验的开发者**：从[第3章：配置与认证](../..)开始

**下一步**：[开始第1章 - AZD 基础](docs/getting-started/azd-basics.md)→

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。虽然我们力求准确，但请注意自动翻译可能包含错误或不准确之处。原始文档的母语版本应被视为权威来源。对于重要信息，建议采用专业人工翻译。因使用本翻译而产生的任何误解或曲解，我们概不负责。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->