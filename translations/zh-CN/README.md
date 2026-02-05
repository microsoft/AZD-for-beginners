# 初学者的 AZD：结构化学习之旅

![AZD-for-beginners](../../translated_images/zh-CN/azdbeginners.5527441dd9f74068.webp) 

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
4. **选择学习路径**：从下面的章节中选择符合您经验水平的内容

### 多语言支持

#### 自动翻译（始终保持最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[阿拉伯语](../ar/README.md) | [孟加拉语](../bn/README.md) | [保加利亚语](../bg/README.md) | [缅甸语](../my/README.md) | [中文（简体）](./README.md) | [中文（繁体，香港）](../zh-HK/README.md) | [中文（繁体，澳门）](../zh-MO/README.md) | [中文（繁体，台湾）](../zh-TW/README.md) | [克罗地亚语](../hr/README.md) | [捷克语](../cs/README.md) | [丹麦语](../da/README.md) | [荷兰语](../nl/README.md) | [爱沙尼亚语](../et/README.md) | [芬兰语](../fi/README.md) | [法语](../fr/README.md) | [德语](../de/README.md) | [希腊语](../el/README.md) | [希伯来语](../he/README.md) | [印地语](../hi/README.md) | [匈牙利语](../hu/README.md) | [印尼语](../id/README.md) | [意大利语](../it/README.md) | [日语](../ja/README.md) | [卡纳达语](../kn/README.md) | [韩语](../ko/README.md) | [立陶宛语](../lt/README.md) | [马来语](../ms/README.md) | [马拉雅拉姆语](../ml/README.md) | [马拉地语](../mr/README.md) | [尼泊尔语](../ne/README.md) | [尼日利亚皮钦语](../pcm/README.md) | [挪威语](../no/README.md) | [波斯语（法尔西）](../fa/README.md) | [波兰语](../pl/README.md) | [巴西葡萄牙语](../pt-BR/README.md) | [葡萄牙语（葡萄牙）](../pt-PT/README.md) | [旁遮普语（古鲁穆奇）](../pa/README.md) | [罗马尼亚语](../ro/README.md) | [俄语](../ru/README.md) | [塞尔维亚语（西里尔文）](../sr/README.md) | [斯洛伐克语](../sk/README.md) | [斯洛文尼亚语](../sl/README.md) | [西班牙语](../es/README.md) | [斯瓦希里语](../sw/README.md) | [瑞典语](../sv/README.md) | [塔加洛语（菲律宾语）](../tl/README.md) | [泰米尔语](../ta/README.md) | [泰卢固语](../te/README.md) | [泰语](../th/README.md) | [土耳其语](../tr/README.md) | [乌克兰语](../uk/README.md) | [乌尔都语](../ur/README.md) | [越南语](../vi/README.md)

> **更喜欢本地克隆？**

> 本仓库包含50多种语言的翻译，显著增加了下载大小。若要不含翻译进行克隆，请使用稀疏检出：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 这让您下载速度更快，并且拥有完成课程所需的全部内容。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 课程概览

通过结构化章节掌握 Azure Developer CLI（azd），实现逐步学习。**特别关注通过 Microsoft Foundry 集成部署 AI 应用。**

### 现代开发者为何必须学习本课程

基于 Microsoft Foundry Discord 社区的见解，**45% 的开发者希望使用 AZD 进行 AI 工作负载**，但遇到以下挑战：
- 复杂的多服务 AI 架构  
- 生产环境 AI 部署最佳实践  
- Azure AI 服务集成与配置  
- AI 工作负载的成本优化  
- AI 特定部署问题排查

### 学习目标

完成本结构化课程后，您将能够：
- **掌握 AZD 基础**：核心概念、安装与配置  
- **部署 AI 应用**：结合 Microsoft Foundry 服务使用 AZD  
- **实现基础设施即代码**：使用 Bicep 模板管理 Azure 资源  
- **排查部署问题**：解决常见问题并调试  
- **优化生产环境**：安全、扩展、监控与成本管理  
- **构建多代理解决方案**：部署复杂 AI 架构

## 📚 学习章节

*根据经验和目标选择您的学习路径*

### 🚀 第1章：基础与快速入门
**先决条件**：拥有 Azure 订阅，具备基本命令行知识  
**时长**：30-45 分钟  
**难度**：⭐

#### 您将学到
- 了解 Azure Developer CLI 基础  
- 在您的平台上安装 AZD  
- 成功完成首次部署

#### 学习资源
- **🎯 从这里开始**：[什么是 Azure Developer CLI?](../..)  
- **📖 理论**：[AZD 基础](docs/getting-started/azd-basics.md) —— 核心概念和术语  
- **⚙️ 设置**：[安装与配置](docs/getting-started/installation.md) —— 平台专属指南  
- **🛠️ 实操**：[您的第一个项目](docs/getting-started/first-project.md) —— 逐步教程  
- **📋 快速参考**：[命令备忘单](resources/cheat-sheet.md)

#### 实践练习
```bash
# 快速安装检查
azd version

# 部署您的第一个应用程序
azd init --template todo-nodejs-mongo
azd up
```

**💡 本章成果**：成功使用 AZD 将一个简单的 Web 应用部署到 Azure

**✅ 成功验证：**
```bash
# 完成第1章后，您应该能够：
azd version              # 显示已安装版本
azd init --template todo-nodejs-mongo  # 初始化项目
azd up                  # 部署到Azure
azd show                # 显示正在运行的应用程序URL
# 应用程序在浏览器中打开并正常工作
azd down --force --purge  # 清理资源
```

**📊 时间投入：** 30-45 分钟  
**📈 掌握技能：** 独立部署基础应用

**✅ 成功验证：**
```bash
# 完成第1章后，您应该能够：
azd version              # 显示已安装版本
azd init --template todo-nodejs-mongo  # 初始化项目
azd up                  # 部署到Azure
azd show                # 显示正在运行的应用程序URL
# 应用程序在浏览器中打开并正常运行
azd down --force --purge  # 清理资源
```

**📊 时间投入：** 30-45 分钟  
**📈 掌握技能：** 独立部署基础应用

---

### 🤖 第2章：AI 优先开发（推荐给 AI 开发者）
**先决条件**：完成第1章  
**时长**：1-2 小时  
**难度**：⭐⭐

#### 您将学到
- Microsoft Foundry 与 AZD 集成  
- 部署 AI 驱动的应用  
- 理解 AI 服务的配置

#### 学习资源
- **🎯 从这里开始**：[Microsoft Foundry 集成](docs/microsoft-foundry/microsoft-foundry-integration.md)  
- **📖 模式**：[AI 模型部署](docs/microsoft-foundry/ai-model-deployment.md) —— 部署和管理 AI 模型  
- **🛠️ 研讨会**：[AI 研讨会实验室](docs/microsoft-foundry/ai-workshop-lab.md) —— 使您的 AI 解决方案支持 AZD  
- **🎥 互动指南**：[研讨会材料](workshop/README.md) —— 使用 MkDocs 浏览器化学习 * DevContainer 环境  
- **📋 模板**：[Microsoft Foundry 模板](../..)  
- **📝 示例**：[AZD 部署示例](examples/README.md)

#### 实践练习
```bash
# 部署您的第一个 AI 应用程序
azd init --template azure-search-openai-demo
azd up

# 试用更多 AI 模板
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 本章成果**：部署并配置具备 RAG 功能的 AI 驱动聊天应用

**✅ 成功验证：**
```bash
# 在第二章之后，你应该能够：
azd init --template azure-search-openai-demo
azd up
# 测试 AI 聊天界面
# 提问并获得带有来源的 AI 驱动回复
# 验证搜索集成是否正常工作
azd monitor  # 检查 Application Insights 是否显示遥测数据
azd down --force --purge
```

**📊 时间投入：** 1-2 小时  
**📈 掌握技能：** 能部署和配置生产级 AI 应用  
**💰 成本意识：** 理解开发环境成本为每月 $80-150，生产环境成本为每月 $300-3500

#### 💰 AI 部署的成本考虑

**开发环境（估计每月 $80-150）：**
- Azure OpenAI（按用量付费）：$0-50/月（基于 token 使用量）  
- AI 搜索（基础层）：$75/月  
- 容器应用（消费模式）：$0-20/月  
- 存储（标准）：$1-5/月

**生产环境（估计每月 $300-3500+）：**
- Azure OpenAI（PTU 用于稳定性能）：$3000+/月 或者 高用量按用量付费  
- AI 搜索（标准层）：$250/月  
- 容器应用（专用）：$50-100/月  
- 应用程序洞察：$5-50/月  
- 存储（高级）：$10-50/月

**💡 成本优化建议：**
- 使用 **免费层** Azure OpenAI 进行学习（包含 50,000 tokens/月）  
- 非开发时运行 `azd down` 释放资源  
- 初期使用消费计费，生产环境再升级至 PTU  
- 通过 `azd provision --preview` 预估部署成本  
- 启用自动扩缩容：仅为实际使用付费

**成本监控：**
```bash
# 检查估计的每月费用
azd provision --preview

# 在 Azure 门户中监控实际费用
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第3章：配置与认证
**先决条件**：完成第1章  
**时长**：45-60 分钟  
**难度**：⭐⭐

#### 您将学到
- 环境配置与管理  
- 认证与安全最佳实践  
- 资源命名和组织

#### 学习资源
- **📖 配置**：[配置指南](docs/getting-started/configuration.md) —— 环境设置  
- **🔐 安全**：[认证模式与托管身份](docs/getting-started/authsecurity.md) —— 认证模式  
- **📝 示例**：[数据库应用示例](examples/database-app/README.md) —— AZD 数据库示例

#### 实践练习
- 配置多个环境（开发、测试、生产）  
- 设置托管身份认证  
- 实现环境特定配置

**💡 本章成果**：管理多环境，做到认证和安全均妥善配置

---

### 🏗️ 第4章：基础设施即代码与部署
**先决条件**：完成第1-3章  
**时长**：1-1.5 小时  
**难度**：⭐⭐⭐

#### 您将学到
- 高级部署模式  
- 使用 Bicep 实现基础设施即代码  
- 资源供应策略

#### 学习资源
- **📖 部署**：[部署指南](docs/deployment/deployment-guide.md) —— 完整工作流程  
- **🏗️ 资源供应**：[资源供应](docs/deployment/provisioning.md) —— Azure 资源管理  
- **📝 示例**：[容器应用示例](../../examples/container-app) —— 容器化部署

#### 实践练习
- 创建自定义 Bicep 模板  
- 部署多服务应用  
- 实施蓝绿部署策略

**💡 本章成果**：使用自定义基础设施模板部署复杂多服务应用

---

### 🎯 第5章：多代理 AI 解决方案（高级）
**先决条件**：完成第1-2章  
**时长**：2-3 小时  
**难度**：⭐⭐⭐⭐
#### 你将学习
- 多代理架构模式
- 代理编排与协调
- 生产就绪的 AI 部署

#### 学习资源
- **🤖 特色项目**：[零售多代理解决方案](examples/retail-scenario.md) - 完整实现
- **🛠️ ARM 模板**：[ARM 模板包](../../examples/retail-multiagent-arm-template) - 一键部署
- **📖 架构**：[多代理协调模式](/docs/pre-deployment/coordination-patterns.md) - 模式介绍

#### 实践练习
```bash
# 部署完整的零售多智能体解决方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 探索智能体配置
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 章节成果**：部署并管理具备客户及库存代理的生产就绪多代理 AI 解决方案

---

### 🔍 第6章：预部署验证与规划
**先决条件**：完成第4章  
**时长**：1小时  
**难度**：⭐⭐

#### 你将学习
- 容量规划与资源验证
- SKU 选择策略
- 预检与自动化

#### 学习资源
- **📊 规划**：[容量规划](docs/pre-deployment/capacity-planning.md) - 资源验证
- **💰 选择**：[SKU 选择](docs/pre-deployment/sku-selection.md) - 成本效益方案
- **✅ 验证**：[预检](docs/pre-deployment/preflight-checks.md) - 自动化脚本

#### 实践练习
- 运行容量验证脚本
- 优化 SKU 选择以降低成本
- 实现自动化预部署检查

**💡 章节成果**：在执行前验证并优化部署

---

### 🚨 第7章：故障排除与调试
**先决条件**：完成任意部署章节  
**时长**：1-1.5小时  
**难度**：⭐⭐

#### 你将学习
- 系统化调试方法
- 常见问题及解决方案
- 针对 AI 的故障排除

#### 学习资源
- **🔧 常见问题**：[常见问题](docs/troubleshooting/common-issues.md) - FAQ 和解决方案
- **🕵️ 调试**：[调试指南](docs/troubleshooting/debugging.md) - 逐步策略
- **🤖 AI 问题**：[AI 专用故障排除](docs/troubleshooting/ai-troubleshooting.md) - AI 服务问题

#### 实践练习
- 诊断部署失败
- 解决身份验证问题
- 调试 AI 服务连接

**💡 章节成果**：独立诊断并解决常见部署问题

---

### 🏢 第8章：生产及企业模式
**先决条件**：完成第1-4章  
**时长**：2-3小时  
**难度**：⭐⭐⭐⭐

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
- 搭建全面监控
- 合规部署到生产环境

**💡 章节成果**：部署具备完整生产能力的企业级应用

---

## 🎓 工坊概览：动手学习体验

> **⚠️ 工坊状态：开发中**  
> 工坊材料正在开发和完善中。核心模块功能齐全，但部分高级内容尚未完成。我们正努力完成所有内容。[跟踪进度 →](workshop/README.md)

### 交互式工坊材料
**全面的动手学习，配备浏览器工具和引导练习**

我们的工坊材料提供结构化的交互式学习体验，配合以上章节课程。工坊适合自学也可用于讲师授课。

#### 🛠️ 工坊特色
- **基于浏览器的界面**：完整的 MkDocs 驱动工坊，支持搜索、复制和主题切换
- **GitHub Codespaces 集成**：一键设置开发环境
- **结构化学习路径**：7步引导练习（总计3.5小时）
- **发现 → 部署 → 定制**：渐进式方法
- **交互式 DevContainer 环境**：预配置工具和依赖

#### 📚 工坊结构
工坊遵循 **发现 → 部署 → 定制** 方法论：

1. **发现阶段**（45分钟）
   - 探索 Microsoft Foundry 模板和服务
   - 了解多代理架构模式
   - 审视部署需求和先决条件

2. **部署阶段**（2小时）
   - 使用 AZD 动手部署 AI 应用
   - 配置 Azure AI 服务和端点
   - 实现安全与身份验证模式

3. **定制阶段**（45分钟）
   - 修改应用以满足特定用例
   - 优化生产部署
   - 实施监控与成本管理

#### 🚀 工坊开始
```bash
# 选项 1：GitHub Codespaces（推荐）
# 在仓库中点击“代码” → “在 main 上创建 codespace”

# 选项 2：本地开发
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# 按照 workshop/README.md 中的设置说明操作
```

#### 🎯 工坊学习成果
完成工坊后，参与者将：
- **部署生产级 AI 应用**：使用 AZD 及 Microsoft Foundry 服务
- **掌握多代理架构**：实现协调的 AI 代理解决方案
- **实践安全最佳实践**：配置身份验证与访问控制
- **优化扩展性**：设计具成本效益和高性能的部署
- **故障排除部署问题**：独立解决常见故障

#### 📖 工坊资源
- **🎥 交互式指南**：[工坊材料](workshop/README.md) - 浏览器学习环境
- **📋 逐步指导**：[引导练习](../../workshop/docs/instructions) - 详细步骤解析
- **🛠️ AI 工坊实验室**：[AI 工坊实验室](docs/microsoft-foundry/ai-workshop-lab.md) - AI 相关练习
- **💡 快速入门**：[工坊设置指南](workshop/README.md#quick-start) - 环境配置说明

**适合对象**：企业培训、大学课程、自主学习及开发者训练营。

---

## 📖 什么是 Azure Developer CLI？

Azure Developer CLI（azd）是一款以开发者为中心的命令行工具，加速将应用构建与部署到 Azure 的流程。它提供：

- **基于模板的部署** - 利用预构建模板快速启动常见应用模式
- **基础设施即代码** - 使用 Bicep 或 Terraform 管理 Azure 资源  
- **集成化工作流** - 无缝完成应用的资源配置、部署与监控
- **开发者友好** - 优化提升开发效率与体验

### **AZD + Microsoft Foundry：AI 部署的理想选择**

**为什么选择 AZD 部署 AI 解决方案？** AZD 针对 AI 开发者面临的核心挑战提供支持：

- **AI 准备模板** - 预配置适用于 Azure OpenAI、认知服务及机器学习负载的模板
- **安全 AI 部署** - 内置 AI 服务、安全密钥和模型端点的安全模式  
- **生产级 AI 模式** - 可扩展、高效成本的 AI 应用部署最佳实践
- **端到端 AI 工作流** - 从模型开发到生产部署及监控
- **成本优化** - 智能资源分配与扩展策略
- **Microsoft Foundry 集成** - 与 Microsoft Foundry 模型目录及端点无缝连接

---

## 🎯 模板与示例库

### 特色：Microsoft Foundry 模板
**如果要部署 AI 应用，从这里开始！**

> **注意：** 这些模板展示多样 AI 模式。有些为外部 Azure 示例，另一些为本地实现。

| 模板 | 章节 | 难度 | 服务 | 类型 |
|----------|---------|------------|----------|------|
| [**快速入门 AI 聊天**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI 模型推理 API + Azure AI 搜索 + Azure 容器应用 + Application Insights | 外部 |
| [**快速入门 AI 代理**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第2章 | ⭐⭐ | Azure AI Agent 服务 + AzureOpenAI + Azure AI 搜索 + Azure 容器应用 + Application Insights| 外部 |
| [**Azure 搜索 + OpenAI 演示**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI 搜索 + 应用服务 + 存储 | 外部 |
| [**OpenAI 聊天应用快速开始**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | AzureOpenAI + 容器应用 + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso 聊天 RAG**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐⭐ | AzureOpenAI + AI 搜索 + Cosmos DB + 容器应用 | 外部 |
| [**零售多代理解决方案**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | AzureOpenAI + AI 搜索 + 存储 + 容器应用 + Cosmos DB | **本地** |

### 特色：完整学习场景
**生产就绪应用模板，映射到学习章节**

| 模板 | 学习章节 | 难度 | 关键学习点 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | 基础 AI 部署模式 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | 基于 Azure AI 搜索的 RAG 实现 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第4章 | ⭐⭐ | 文档智能集成 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | 代理框架与函数调用 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐ | 企业 AI 编排 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | 多代理架构，包含客户与库存代理 |

### 按示例类型学习

> **📌 本地示例 vs. 外部示例：**  
> **本地示例**（此代码库内）= 可立即使用  
> **外部示例**（Azure 示例库）= 从关联仓库克隆

#### 本地示例（即刻可用）
- [**零售多代理解决方案**](examples/retail-scenario.md) - 完整生产就绪实现，含 ARM 模板
  - 多代理架构（客户代理 + 库存代理）
  - 综合监控与评估
  - 通过 ARM 模板一键部署

#### 本地示例 - 容器应用（第2-5章）
**本仓库内全面容器部署示例：**
- [**容器应用示例**](examples/container-app/README.md) - 容器化部署完整指南
  - [简单 Flask API](../../examples/container-app/simple-flask-api) - 基础 REST API，支持零规模缩放
  - [微服务架构](../../examples/container-app/microservices) - 生产就绪多服务部署
  - 快速入门、生产及高级部署模式
  - 监控、安全与成本优化指导

#### 外部示例 - 简易应用（第1-2章）
**克隆这些 Azure 示例仓库开始使用：**
- [简单 Web 应用 - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基础部署模式
- [静态网站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 静态内容部署
- [容器应用 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 部署

#### 外部示例 - 数据库集成（第3-4章）  
- [数据库应用 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 数据库连接模式
- [函数 + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 无服务器数据工作流

#### 外部示例 - 高级模式（第4-8章）
- [Java 微服务](https://github.com/Azure-Samples/java-microservices-aca-lab) - 多服务架构
- [容器应用作业](https://github.com/Azure-Samples/container-apps-jobs) - 后台处理  
- [企业机器学习流水线](https://github.com/Azure-Samples/mlops-v2) - 生产就绪机器学习模式

### 外部模板集合
- [**官方 AZD 模板库**](https://azure.github.io/awesome-azd/) - 精选官方及社区模板合集
- [**Azure 开发者 CLI 模板**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 模板文档
- [**示例目录**](examples/README.md) - 带详细说明的本地学习示例

---

## 📚 学习资源与参考

### 快速参考
- [**命令速查表**](resources/cheat-sheet.md) - 按章节组织的核心 azd 命令
- [**术语表**](resources/glossary.md) - Azure 和 azd 术语  
- [**常见问题**](resources/faq.md) - 按学习章节分类的常见问题
- [**学习指南**](resources/study-guide.md) - 综合练习题

### 实操工作坊
- [**AI 工作坊实验室**](docs/microsoft-foundry/ai-workshop-lab.md) - 使您的 AI 解决方案支持 AZD 部署（2-3 小时）
- [**互动工作坊指南**](workshop/README.md) - 基于浏览器的 MkDocs 与 DevContainer 环境工作坊
- [**结构化学习路径**](../../workshop/docs/instructions) - 7 步导引练习（探索 → 部署 → 定制）
- [**AZD 初学者工作坊**](workshop/README.md) - 完整的实操工作坊资料及 GitHub Codespaces 集成

### 外部学习资源
- [Azure Developer CLI 文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架构中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 定价计算器](https://azure.microsoft.com/pricing/calculator/)
- [Azure 状态](https://status.azure.com/)

---

## 🔧 快速故障排除指南

**初学者常见问题及快速解决方案：**

### ❌ “azd: 找不到命令”

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

### ❌ “未找到订阅” 或 “未设置订阅”

```bash
# 列出可用的订阅
az account list --output table

# 设置默认订阅
az account set --subscription "<subscription-id-or-name>"

# 为 AZD 环境设置
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# 验证
az account show
```

### ❌ “配额不足” 或 “超出配额限制”

```bash
# 试试不同的 Azure 区域
azd env set AZURE_LOCATION "westus2"
azd up

# 或者在开发环境中使用较小的 SKU
# 编辑 infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ “azd up” 在中途失败

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

### ❌ “身份验证失败” 或 “令牌过期”

```bash
# 重新认证
az logout
az login

azd auth logout
azd auth login

# 验证认证
az account show
```

### ❌ “资源已存在” 或 命名冲突

```bash
# AZD 生成唯一名称，但如果发生冲突：
azd down --force --purge

# 则重试，使用新的环境
azd env new dev-v2
azd up
```

### ❌ 模板部署耗时过长

**正常等待时间：**
- 简单 Web 应用：5-10 分钟
- 带数据库的应用：10-15 分钟
- AI 应用：15-25 分钟（OpenAI 配置较慢）

```bash
# 检查进度
azd show

# 如果卡住超过30分钟，查看Azure门户：
azd monitor
# 查找失败的部署
```

### ❌ “权限被拒绝” 或 “禁止访问”

```bash
# 检查您的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 您至少需要“参与者”角色
# 请您的 Azure 管理员授予：
# - 参与者（针对资源）
# - 用户访问管理员（针对角色分配）
```

### ❌ 找不到已部署应用程序的 URL

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
- **AI 相关问题：** [AI 故障排除](docs/troubleshooting/ai-troubleshooting.md)
- **调试指南：** [逐步调试](docs/troubleshooting/debugging.md)
- **寻求帮助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 快速故障排除指南

**初学者常见问题及快速解决方案：**

<details>
<summary><strong>❌ “azd: 找不到命令”</strong></summary>

```bash
# 请先安装 AZD
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
<summary><strong>❌ “未找到订阅” 或 “未设置订阅”</strong></summary>

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
<summary><strong>❌ “配额不足” 或 “超出配额限制”</strong></summary>

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
<summary><strong>❌ “身份验证失败” 或 “令牌过期”</strong></summary>

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
<summary><strong>❌ “资源已存在” 或 命名冲突</strong></summary>

```bash
# AZD 会生成唯一的名称，但如果发生冲突：
azd down --force --purge

# 则使用新的环境重试
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 模板部署耗时过长</strong></summary>

**正常等待时间：**
- 简单 Web 应用：5-10 分钟
- 带数据库的应用：10-15 分钟
- AI 应用：15-25 分钟（OpenAI 配置较慢）

```bash
# 检查进度
azd show

# 如果卡住超过30分钟，检查Azure门户：
azd monitor
# 查找失败的部署情况
```
</details>

<details>
<summary><strong>❌ “权限被拒绝” 或 “禁止访问”</strong></summary>

```bash
# 检查您的 Azure 角色
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 您至少需要“参与者”角色
# 请您的 Azure 管理员授予：
# - 参与者（针对资源）
# - 用户访问管理员（针对角色分配）
```
</details>

<details>
<summary><strong>❌ 找不到已部署应用程序的 URL</strong></summary>

```bash
# 显示所有服务端点
azd show

# 或者打开 Azure 门户
azd monitor

# 检查特定服务
azd env get-values
# 查找 *_URL 变量
```
</details>

### 📚 完整故障排除资源

- **常见问题指南：** [详细解决方案](docs/troubleshooting/common-issues.md)
- **AI 相关问题：** [AI 故障排除](docs/troubleshooting/ai-troubleshooting.md)
- **调试指南：** [逐步调试](docs/troubleshooting/debugging.md)
- **寻求帮助：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 课程完成与认证

### 进度跟踪
跟踪您每章的学习进度：

- [ ] **第1章**: 基础与快速入门 ✅
- [ ] **第2章**: AI 优先开发 ✅  
- [ ] **第3章**: 配置与身份验证 ✅
- [ ] **第4章**: 基础设施即代码与部署 ✅
- [ ] **第5章**: 多智能体 AI 解决方案 ✅
- [ ] **第6章**: 部署前验证与规划 ✅
- [ ] **第7章**: 故障排除与调试 ✅
- [ ] **第8章**: 生产与企业模式 ✅

### 学习验证
完成每章后，请通过以下方式验证您的知识：
1. **实操练习**：完成该章节的动手部署
2. **知识检查**：查看章节对应的 FAQ 部分
3. **社区讨论**：在 Azure Discord 中分享您的学习经验
4. **下一章节**：进入下一个难度级别学习

### 课程完成收益
完成所有章节后，您将拥有：
- **生产经验**：成功将真实 AI 应用部署到 Azure
- **专业技能**：具备企业级部署能力  
- **社区认可**：成为 Azure 开发者社区活跃成员
- **职业提升**：掌握热门 AZD 与 AI 部署技术

---

## 🤝社区与支持

### 获取帮助与支持
- **技术问题**： [报告错误及功能请求](https://github.com/microsoft/azd-for-beginners/issues)
- **学习疑问**： [Microsoft Azure Discord 社区](https://discord.gg/microsoft-azure) 及 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 相关帮助**： 加入 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **文档资源**： [官方 Azure Developer CLI 文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### 来自 Microsoft Foundry Discord 的社区见解

**#Azure 频道近期投票结果：**
- **45%** 的开发者希望使用 AZD 进行 AI 工作负载
- **主要挑战**：多服务部署、凭据管理、生产就绪度  
- **最受欢迎**：AI 专用模板、故障排除指南、最佳实践

**加入我们的社区，您可以：**
- 分享您的 AZD + AI 经验并获得帮助
- 访问新 AI 模板的早期预览版
- 贡献 AI 部署最佳实践
- 影响未来 AI + AZD 功能的开发

### 课程贡献
我们欢迎贡献！请阅读我们的 [贡献指南](CONTRIBUTING.md) 了解详情：
- **内容改进**：完善已有章节与示例
- **新增示例**：添加真实场景和模板  
- **翻译支持**：维护多语言支持
- **错误报告**：提升准确性与清晰度
- **社区规范**：遵守包容性社区准则

---

## 📄 课程信息

### 许可证
本项目采用 MIT 许可证，详情请参阅 [LICENSE](../../LICENSE) 文件。

### 相关 Microsoft 学习资源

我们的团队还制作了其他综合学习课程：

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j 初学者](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js 初学者](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain 初学者](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD 初学者](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI 初学者](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP 初学者](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents 初学者](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### 生成式 AI 系列
[![生成式 AI 初学者](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![生成式 AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

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
**AI 开发者**：跳到[第2章：以AI为先的发展](../..)  
**有经验的开发者**：从[第3章：配置与认证](../..)开始

**下一步**：[开始第1章 - AZD基础](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件通过AI翻译服务[Co-op Translator](https://github.com/Azure/co-op-translator)进行翻译。虽然我们力求准确，但请注意自动翻译可能存在错误或不准确之处。以原始语言版本的文件为权威来源。对于重要信息，建议使用专业人工翻译。对于因使用本翻译而产生的任何误解或误译，我们不承担任何责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->