# 示例 - 实用 AZD 模板和配置

**按章节组织的示例学习**
- **📚 课程首页**: [AZD 入门](../README.md)
- **📖 章节映射**: 按学习难度组织的示例
- **🚀 本地示例**: [零售多智能体解决方案](retail-scenario.md)
- **🤖 外部 AI 示例**: 指向 Azure Samples 仓库的链接

> **📍 重要：本地示例 与 外部示例**  
> 本仓库包含 **4 个完整的本地示例**，具有完整实现：  
> - **Azure OpenAI 聊天**（包含聊天界面的 GPT-4 部署）  
> - **容器应用**（简单 Flask API + 微服务）  
> - **数据库应用**（Web + SQL 数据库）  
> - **零售多智能体**（企业级 AI 解决方案）  
>   
> 其他示例为 **外部引用**，指向可克隆的 Azure-Samples 仓库。

## 介绍

该目录提供实践示例和参考，帮助你通过动手实践学习 Azure Developer CLI。零售多智能体场景是本仓库中包含的完整、可用于生产的实现。其他示例引用了官方的 Azure Samples，展示了各种 AZD 模式。

### 复杂度评级图例

- ⭐ **初学者** - 基本概念，单一服务，15-30 分钟
- ⭐⭐ **中级** - 多服务，数据库集成，30-60 分钟
- ⭐⭐⭐ **高级** - 复杂架构，AI 集成，1-2 小时
- ⭐⭐⭐⭐ **专家** - 可用于生产，企业模式，2 小时以上

## 🎯 本仓库实际包含的内容

### ✅ 本地实现（可立即使用）

#### [Azure OpenAI 聊天应用](azure-openai-chat/README.md) 🆕
**完整的 GPT-4 部署，仓库中包含聊天界面**

- **位置：** `examples/azure-openai-chat/`
- **复杂度：** ⭐⭐（中级）
- **包含内容：**
  - 完整的 Azure OpenAI 部署（GPT-4）
  - Python 命令行聊天界面
  - 与 Key Vault 集成以保护 API 密钥
  - Bicep 基础设施模板
  - 令牌使用和成本跟踪
  - 速率限制和错误处理

**快速开始：**
```bash
# 导航到示例
cd examples/azure-openai-chat

# 部署所有内容
azd up

# 安装依赖并开始聊天
pip install -r src/requirements.txt
python src/chat.py
```

**技术：** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [容器应用示例](container-app/README.md) 🆕
**仓库中包含全面的容器部署示例**

- **位置：** `examples/container-app/`
- **复杂度：** ⭐-⭐⭐⭐⭐（从初学者到高级）
- **包含内容：**
  - [主指南](container-app/README.md) - 完整的容器部署概览
  - [简单 Flask API](../../../examples/container-app/simple-flask-api) - 基本 REST API 示例
  - [微服务架构](../../../examples/container-app/microservices) - 可用于生产的多服务部署
  - 快速入门、生产和高级模式
  - 监控、安全和成本优化

**快速开始：**
```bash
# 查看主指南
cd examples/container-app

# 部署简单的 Flask API
cd simple-flask-api
azd up

# 部署微服务示例
cd ../microservices
azd up
```

**技术：** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [零售多智能体解决方案](retail-scenario.md) 🆕
**仓库中包含完整的可用于生产的实现**

- **位置：** `examples/retail-multiagent-arm-template/`
- **复杂度：** ⭐⭐⭐⭐（高级）
- **包含内容：**
  - 完整的 ARM 部署模板
  - 多智能体架构（客户 + 库存）
  - Azure OpenAI 集成
  - 带 RAG 的 AI 搜索
  - 全面监控
  - 一键部署脚本

**快速开始：**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**技术：** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 外部 Azure 示例（克隆使用）

以下示例维护在官方的 Azure-Samples 仓库中。克隆它们以探索不同的 AZD 模式：

### 简单应用（第1-2章）

| 模板 | 仓库 | 复杂度 | 服务 |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [本地：simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **微服务** | [本地：microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | 多服务, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask 容器** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**如何使用：**
```bash
# 克隆任意示例
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# 部署
azd up
```

### AI 应用示例（第2、5、8章）

| 模板 | 仓库 | 复杂度 | 重点 |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI 聊天** | [本地：azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 部署 |
| **AI 聊天 快速入门** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | 基本 AI 聊天 |
| **AI 代理** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | 代理框架 |
| **搜索 + OpenAI 演示** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG 模式 |
| **Contoso 聊天** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | 企业级 AI |

### 数据库与高级模式（第3-8章）

| 模板 | 仓库 | 复杂度 | 重点 |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | 数据库集成 |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | 无服务器 NoSQL |
| **Java 微服务** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | 多服务 |
| **ML 管道** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## 学习目标

通过完成这些示例，你将能够：
- 在现实的应用场景中练习 Azure Developer CLI 工作流
- 理解不同应用架构及其 azd 实现方式
- 掌握多种 Azure 服务的基础设施即代码模式
- 应用配置管理和面向环境的部署策略
- 在实际场景中实现监控、安全和伸缩模式
- 积累故障排除和调试真实部署场景的经验

## 学习成果

完成这些示例后，你将能够：
- 自信地使用 Azure Developer CLI 部署各种应用类型
- 将提供的模板调整到你自己的应用需求
- 使用 Bicep 设计并实现自定义基础设施模式
- 为复杂的多服务应用配置正确的依赖关系
- 在真实场景中应用安全、监控和性能最佳实践
- 基于实践经验对部署进行故障排除和优化

## 目录结构

```
Azure Samples AZD Templates (linked externally):
├── todo-nodejs-mongo/       # Node.js Express with MongoDB
├── todo-csharp-sql-swa-func/ # React SPA with Static Web Apps  
├── container-apps-store-api/ # Python Flask containerized app
├── todo-csharp-sql/         # C# Web API with Azure SQL
├── todo-python-mongo-swa-func/ # Python Functions with Cosmos DB
├── java-microservices-aca-lab/ # Java microservices with Container Apps
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## 快速入门示例

> **💡 不熟悉 AZD？** 从示例 #1（Flask API）开始 —— 大约需 20 分钟，可学习核心概念。

### 初学者
1. **[容器应用 - Python Flask API](../../../examples/container-app/simple-flask-api)** (本地) ⭐  
   部署一个具有 scale-to-zero 的简单 REST API  
   **时间：** 20-25 分钟 | **成本：** $0-5/月  
   **你将学习：** 基本 azd 工作流、容器化、健康探针  
   **预期结果：** 返回 "Hello, World!" 的工作 API 端点，并带有监控

2. **[简单 Web 应用 - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   部署带 MongoDB 的 Node.js Express Web 应用  
   **时间：** 25-35 分钟 | **成本：** $10-30/月  
   **你将学习：** 数据库集成、环境变量、连接字符串  
   **预期结果：** 具有创建/读取/更新/删除功能的待办事项应用

3. **[静态网站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   使用 Azure Static Web Apps 托管 React 静态网站  
   **时间：** 20-30 分钟 | **成本：** $0-10/月  
   **你将学习：** 静态托管、无服务器函数、CDN 部署  
   **预期结果：** 带 API 后端的 React 界面，自动 SSL，全局 CDN

### 中级用户
4. **[Azure OpenAI 聊天应用](../../../examples/azure-openai-chat)** (本地) ⭐⭐  
   部署带安全 API 密钥管理的 GPT-4 聊天界面  
   **时间：** 35-45 分钟 | **成本：** $50-200/月  
   **你将学习：** Azure OpenAI 部署、Key Vault 集成、令牌跟踪  
   **预期结果：** 带 GPT-4 和成本监控的工作聊天应用

5. **[容器应用 - 微服务](../../../examples/container-app/microservices)** (本地) ⭐⭐⭐⭐  
   可用于生产的多服务架构  
   **时间：** 45-60 分钟 | **成本：** $50-150/月  
   **你将学习：** 服务通信、消息队列、分布式追踪  
   **预期结果：** 具有监控的 2 服务系统（API 网关 + 产品服务）

6. **[数据库应用 - C# 与 Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   带 C# API 和 Azure SQL 数据库的 Web 应用  
   **时间：** 30-45 分钟 | **成本：** $20-80/月  
   **你将学习：** Entity Framework，数据库迁移，连接安全  
   **预期结果：** 带 Azure SQL 后端的 C# API，自动部署模式

7. **[无服务器函数 - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   具有 HTTP 触发器和 Cosmos DB 的 Python Azure Functions  
   **时间：** 30-40 分钟 | **成本：** $10-40/月  
   **你将学习：** 事件驱动架构、无服务器伸缩、NoSQL 集成  
   **预期结果：** 响应 HTTP 请求并使用 Cosmos DB 存储的 Function 应用

8. **[微服务 - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   使用 Container Apps 和 API 网关的多服务 Java 应用  
   **时间：** 60-90 分钟 | **成本：** $80-200/月  
   **你将学习：** Spring Boot 部署、服务网格、负载均衡  
   **预期结果：** 具有服务发现和路由的多服务 Java 系统

### Microsoft Foundry 模板

1. **[Azure OpenAI 聊天应用 - 本地示例](../../../examples/azure-openai-chat)** ⭐⭐  
   完整的 GPT-4 部署，带聊天界面  
   **时间：** 35-45 分钟 | **成本：** $50-200/月  
   **预期结果：** 带令牌跟踪和成本监控的工作聊天应用

2. **[Azure Search + OpenAI 演示](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   具有 RAG 架构的智能聊天应用  
   **时间：** 60-90 分钟 | **成本：** $100-300/月  
   **预期结果：** 基于 RAG 的聊天界面，支持文档搜索与引用

3. **[AI 文档处理](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   使用 Azure AI 服务进行文档分析  
   **时间：** 40-60 分钟 | **成本：** $20-80/月  
   **预期结果：** 从上传文档中提取文本、表格和实体的 API

4. **[机器学习管道](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   使用 Azure Machine Learning 的 MLOps 工作流  
   **时间：** 2-3 小时 | **成本：** $150-500/月  
   **预期结果：** 带训练、部署和监控的自动化 ML 管道

### 真实世界场景

#### **零售多智能体解决方案** 🆕
**[完整实现指南](./retail-scenario.md)**

一个全面的、可用于生产的多智能体客户支持解决方案，展示了使用 AZD 部署企业级 AI 应用的实践。该场景提供：

- **完整架构：** 带有专门的客户服务与库存管理代理的多智能体系统
- **生产基础设施**: 多区域 Azure OpenAI 部署，AI Search，Container Apps，以及全面的监控
- **可即刻部署的 ARM 模板**: 一键部署，支持多种配置模式 (Minimal/Standard/Premium)
- **高级功能**: 红队安全验证、代理评估框架、成本优化以及故障排查指南
- **真实业务场景**: 零售商客户支持用例，包含文件上传、搜索集成和动态扩展

**技术**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**复杂度**: ⭐⭐⭐⭐（高级 - 企业生产就绪）

**适用人群**: AI 开发者、解决方案架构师以及构建生产级多代理系统的团队

**快速开始**: 使用随附的 ARM 模板，通过 `./deploy.sh -g myResourceGroup` 在 30 分钟内部署完整解决方案

## 📋 使用说明

### 前提条件

在运行任何示例之前：
- ✅ 拥有 Owner 或 Contributor 权限的 Azure 订阅
- ✅ 已安装 Azure Developer CLI（[安装指南](../docs/chapter-01-foundation/installation.md)）
- ✅ 运行中的 Docker Desktop（用于容器示例）
- ✅ 适当的 Azure 配额（检查示例特定要求）

> **💰 成本警告：** 所有示例都会创建真实的 Azure 资源并产生费用。有关费用估算，请参见各自的 README 文件。完成后请记得运行 `azd down` 以避免持续费用。

### 在本地运行示例

1. **克隆或复制示例**
   ```bash
   # 导航到所需示例
   cd examples/simple-web-app
   ```

2. **初始化 AZD 环境**
   ```bash
   # 使用现有模板初始化
   azd init
   
   # 或创建新环境
   azd env new my-environment
   ```

3. **配置环境**
   ```bash
   # 设置所需变量
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **部署**
   ```bash
   # 部署基础设施和应用程序
   azd up
   ```

5. **验证部署**
   ```bash
   # 获取服务端点
   azd env get-values
   
   # 测试端点（示例）
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **预期成功指标：**
   - ✅ `azd up` 完成且无错误
   - ✅ 服务端点返回 HTTP 200
   - ✅ Azure 门户显示 "Running" 状态
   - ✅ Application Insights 接收遥测

> **⚠️ 遇到问题？** 有关部署故障排查，请参见 [常见问题](../docs/chapter-07-troubleshooting/common-issues.md)

### 调整示例以适应您的场景

每个示例包含：
- **README.md** - 详细的设置和自定义说明
- **azure.yaml** - 带注释的 AZD 配置
- **infra/** - 带参数说明的 Bicep 模板
- **src/** - 示例应用代码
- **scripts/** - 常用任务的辅助脚本

## 🎯 学习目标

### 示例类别

#### **基础部署**
- 单服务应用
- 简单的基础设施模式
- 基础配置管理
- 成本效益高的开发环境

#### **高级场景**
- 多服务架构
- 复杂的网络配置
- 数据库集成模式
- 安全性与合规性实现

#### **生产就绪模式**
- 高可用配置
- 监控与可观测性
- CI/CD 集成
- 灾难恢复方案

## 📖 示例描述

### 简单 Web 应用 - Node.js Express
**技术**: Node.js、Express、MongoDB、Container Apps  
**复杂度**: 初学者  
**概念**: 基础部署、REST API、NoSQL 数据库集成

### 静态网站 - React SPA
**技术**: React、Azure Static Web Apps、Azure Functions、Cosmos DB  
**复杂度**: 初学者  
**概念**: 静态托管、无服务器后端、现代 Web 开发

### 容器应用 - Python Flask
**技术**: Python Flask、Docker、Container Apps、Container Registry、Application Insights  
**复杂度**: 初学者  
**概念**: 容器化、REST API、scale-to-zero、健康探测、监控  
**位置**: [本地示例](../../../examples/container-app/simple-flask-api)

### 容器应用 - 微服务架构
**技术**: Python、Node.js、C#、Go、Service Bus、Cosmos DB、Azure SQL、Container Apps  
**复杂度**: 高级  
**概念**: 多服务架构、服务通信、消息队列、分布式追踪  
**位置**: [本地示例](../../../examples/container-app/microservices)

### 数据库应用 - 使用 Azure SQL 的 C#
**技术**: C# ASP.NET Core、Azure SQL Database、App Service  
**复杂度**: 中级  
**概念**: Entity Framework、数据库连接、Web API 开发

### 无服务器函数 - Python Azure Functions
**技术**: Python、Azure Functions、Cosmos DB、Static Web Apps  
**复杂度**: 中级  
**概念**: 事件驱动架构、无服务器计算、全栈开发

### 微服务 - Java Spring Boot
**技术**: Java Spring Boot、Container Apps、Service Bus、API Gateway  
**复杂度**: 中级  
**概念**: 微服务通信、分布式系统、企业级模式

### Microsoft Foundry 示例

#### Azure OpenAI 聊天应用
**技术**: Azure OpenAI、Cognitive Search、App Service  
**复杂度**: 中级  
**概念**: RAG 架构、向量检索、LLM 集成

#### AI 文档处理
**技术**: Azure AI Document Intelligence、Storage、Functions  
**复杂度**: 中级  
**概念**: 文档分析、OCR、数据提取

#### 机器学习流水线
**技术**: Azure ML、MLOps、Container Registry  
**复杂度**: 高级  
**概念**: 模型训练、部署流水线、监控

## 🛠 配置示例

`configurations/` 目录包含可重用组件：

### 环境配置
- 开发环境设置
- 预发布环境配置
- 生产就绪配置
- 多区域部署设置

### Bicep 模块
- 可重用基础设施组件
- 常见资源模式
- 安全加固模板
- 成本优化配置

### 辅助脚本
- 环境设置自动化
- 数据库迁移脚本
- 部署验证工具
- 成本监控工具

## 🔧 自定义指南

### 将示例调整为您的使用场景

1. **审查前提条件**
   - 检查 Azure 服务要求
   - 验证订阅限额
   - 了解成本影响

2. **修改配置**
   - 更新 `azure.yaml` 服务定义
   - 自定义 Bicep 模板
   - 调整环境变量

3. **彻底测试**
   - 先部署到开发环境
   - 验证功能
   - 测试扩展性和性能

4. **安全审查**
   - 审查访问控制
   - 实施机密管理
   - 启用监控和告警

## 📊 对比矩阵

| 示例 | 服务 | 数据库 | 认证 | 监控 | 复杂度 |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI 聊天** (本地) | 2 | ❌ | Key Vault | 完整 | ⭐⭐ |
| **Python Flask API** (本地) | 1 | ❌ | 基础 | 完整 | ⭐ |
| **微服务** (本地) | 5+ | ✅ | 企业级 | 高级 | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | 基础 | 基础 | ⭐ |
| React SPA + Functions | 3 | ✅ | 基础 | 完整 | ⭐ |
| Python Flask Container | 2 | ❌ | 基础 | 完整 | ⭐ |
| C# Web API + SQL | 2 | ✅ | 完整 | 完整 | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | 完整 | 完整 | ⭐⭐ |
| Java Microservices | 5+ | ✅ | 完整 | 完整 | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | 完整 | 完整 | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | 基础 | 完整 | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | 完整 | 完整 | ⭐⭐⭐⭐ |
| **零售多代理** (本地) | **8+** | **✅** | **企业级** | **高级** | **⭐⭐⭐⭐** |

## 🎓 学习路径

### 推荐学习顺序

1. **从简单的 Web 应用开始**
   - 学习基础的 AZD 概念
   - 理解部署工作流
   - 练习环境管理

2. **尝试静态网站**
   - 探索不同的托管选项
   - 了解 CDN 集成
   - 理解 DNS 配置

3. **转向容器应用**
   - 学习容器化基础
   - 理解伸缩概念
   - 使用 Docker 进行实践

4. **添加数据库集成**
   - 学习数据库预置
   - 理解连接字符串
   - 练习机密管理

5. **探索无服务器**
   - 理解事件驱动架构
   - 了解触发器与绑定
   - 用 API 进行实践

6. **构建微服务**
   - 学习服务通信
   - 理解分布式系统
   - 练习复杂部署

## 🔍 寻找合适的示例

### 按技术栈
- **Container Apps**: [Python Flask API (本地)](../../../examples/container-app/simple-flask-api), [Microservices (本地)](../../../examples/container-app/microservices), Java 微服务
- **Node.js**: Node.js Express Todo 应用, [Microservices API Gateway (本地)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (本地)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (本地)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (本地)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI 聊天应用, ML Pipeline
- **Go**: [Microservices User Service (本地)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot 微服务
- **React**: React SPA + Functions
- **Containers**: [Python Flask (本地)](../../../examples/container-app/simple-flask-api), [Microservices (本地)](../../../examples/container-app/microservices), Java 微服务
- **Databases**: [Microservices (本地)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (本地)](../../../examples/azure-openai-chat)**, Azure OpenAI 聊天应用, AI 文档处理, ML Pipeline, **零售多代理解决方案**
- **Multi-Agent Systems**: **零售多代理解决方案**
- **OpenAI Integration**: **[Azure OpenAI Chat (本地)](../../../examples/azure-openai-chat)**, 零售多代理解决方案
- **Enterprise Production**: [Microservices (本地)](../../../examples/container-app/microservices), **零售多代理解决方案**

### 按架构模式
- **简单 REST API**: [Python Flask API (本地)](../../../examples/container-app/simple-flask-api)
- **单体**: Node.js Express Todo、C# Web API + SQL
- **静态 + 无服务器**: React SPA + Functions、Python Functions + SPA
- **微服务**: [Production Microservices (本地)](../../../examples/container-app/microservices)、Java Spring Boot 微服务
- **容器化**: [Python Flask (本地)](../../../examples/container-app/simple-flask-api)、[Microservices (本地)](../../../examples/container-app/microservices)
- **AI 驱动**: **[Azure OpenAI Chat (本地)](../../../examples/azure-openai-chat)**、Azure OpenAI 聊天应用、AI 文档处理、ML Pipeline、**零售多代理解决方案**
- **多代理架构**: **零售多代理解决方案**
- **企业多服务**: [Microservices (本地)](../../../examples/container-app/microservices)、**零售多代理解决方案**

### 按复杂度等级
- **初学者**: [Python Flask API (本地)](../../../examples/container-app/simple-flask-api)、Node.js Express Todo、React SPA + Functions
- **中级**: **[Azure OpenAI Chat (本地)](../../../examples/azure-openai-chat)**、C# Web API + SQL、Python Functions + SPA、Java 微服务、Azure OpenAI 聊天应用、AI 文档处理
- **高级**: ML Pipeline
- **企业生产就绪**: [Microservices (本地)](../../../examples/container-app/microservices)（含消息队列的多服务），**零售多代理解决方案**（带 ARM 模板部署的完整多代理系统）

## 📚 其他资源

### Documentation Links
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Community Examples
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Node.js 和 PostgreSQL 的待办应用](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [带 C# API 的 React Web 应用](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps 任务](https://github.com/Azure-Samples/container-apps-jobs)
- [使用 Java 的 Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### 最佳实践
- [Azure 优良架构框架](https://learn.microsoft.com/en-us/azure/well-architected/)
- [云采用框架](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 贡献示例

有有用的示例想分享吗？欢迎贡献！

### 提交指南
1. 遵循既定的目录结构
2. 包含详尽的 README.md
3. 在配置文件中添加注释
4. 提交前彻底测试
5. 包含成本估算和前提条件

### 示例模板结构
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**专业提示**：从最符合你技术栈的最简单示例开始，然后逐步过渡到更复杂的场景。每个示例都建立在前一个示例的概念之上！

## 🚀 准备开始了吗？

### 你的学习路径

1. **完全初学者？** → 从 [Flask API](../../../examples/container-app/simple-flask-api) 开始 (⭐，20 分钟)
2. **有基本的 AZD 知识？** → 试试 [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐，60 分钟)
3. **构建 AI 应用？** → 从 [Azure OpenAI Chat](../../../examples/azure-openai-chat) 开始 (⭐⭐，35 分钟) 或探索 [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐，2+ 小时)
4. **需要特定技术栈？** → 使用上面的 [找到合适的示例](../../../examples) 部分

### 下一步

- ✅ 查看上面的 [前提条件](../../../examples)
- ✅ 选择与你技能水平相匹配的示例（参见 [复杂度图例](../../../examples)）
- ✅ 在部署前仔细阅读示例的 README
- ✅ 在测试后设置提醒运行 `azd down`
- ✅ 通过 GitHub Issues 或 Discussions 分享你的经验

### 需要帮助？

- 📖 [常见问题解答](../resources/faq.md) - 常见问题解答
- 🐛 [疑难解答指南](../docs/chapter-07-troubleshooting/common-issues.md) - 解决部署问题
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - 向社区提问
- 📚 [学习指南](../resources/study-guide.md) - 巩固你的学习

---

**导航**
- **📚 课程主页**: [AZD For Beginners](../README.md)
- **📖 学习资料**: [学习指南](../resources/study-guide.md) | [速查表](../resources/cheat-sheet.md) | [术语表](../resources/glossary.md)
- **🔧 资源**: [常见问题解答](../resources/faq.md) | [疑难解答](../docs/chapter-07-troubleshooting/common-issues.md)

---

*最后更新：2025年11月 | [报告问题](https://github.com/microsoft/AZD-for-beginners/issues) | [贡献示例](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免责声明：

本文档由 AI 翻译服务 Co-op Translator（https://github.com/Azure/co-op-translator）翻译。尽管我们力求准确，但自动翻译可能包含错误或不准确之处。原始文档的母语版本应被视为权威来源。对于关键信息，建议使用专业人工翻译。我们不对因使用此翻译而产生的任何误解或曲解承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->