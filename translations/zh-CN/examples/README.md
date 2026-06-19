# 示例 - 实用 AZD 模板和配置

**通过示例学习 - 按章节组织**
- **📚 课程首页**: [AZD 初学者指南](../README.md)
- **📖 章节映射**: 按学习复杂度组织的示例
- **🚀 本地示例**: [零售多智能体解决方案](retail-scenario.md)
- **🤖 外部 AI 示例**: 指向 Azure Samples 仓库的链接

> **📍 重要：本地示例 与 外部示例**  
> 本仓库包含 **4 个完整的本地示例**，具有完整实现：  
> - **Microsoft Foundry Models Chat**（gpt-4.1 部署，带聊天界面）  
> - **Container Apps**（简单的 Flask API + 微服务）  
> - **Database App**（Web + SQL 数据库）  
> - **Retail Multi-Agent**（企业级 AI 解决方案）  
>  
> 其他示例为可克隆的 <strong>外部参考</strong>，来自 Azure-Samples 仓库。

## 介绍

此目录提供实用示例和参考，帮助您通过动手实践学习 Azure Developer CLI。Retail Multi-Agent 场景是本仓库中包含的完整、可生产就绪的实现。其他示例引用官方 Azure Samples，演示各种 AZD 模式。

### 复杂度评级说明

- ⭐ <strong>初学者</strong> - 基本概念，单一服务，15-30 分钟
- ⭐⭐ <strong>中级</strong> - 多服务，数据库集成，30-60 分钟
- ⭐⭐⭐ <strong>高级</strong> - 复杂架构，AI 集成，1-2 小时
- ⭐⭐⭐⭐ <strong>专家</strong> - 生产就绪，企业模式，2 小时以上

## 🎯 本仓库实际包含的内容

### ✅ 本地实现（可直接使用）

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**本仓库包含完整的 gpt-4.1 部署和聊天界面**

- **位置:** `examples/azure-openai-chat/`
- **复杂度:** ⭐⭐（中级）
- **包含内容:**
  - 完整的 Microsoft Foundry Models 部署（gpt-4.1）
  - Python 命令行聊天界面
  - 用于安全 API 密钥的 Key Vault 集成
  - Bicep 基础设施模板
  - 令牌使用量和成本跟踪
  - 速率限制和错误处理

**快速开始:**
```bash
# 导航到示例
cd examples/azure-openai-chat

# 部署所有内容
azd up

# 安装依赖并开始聊天
pip install -r src/requirements.txt
python src/chat.py
```

**技术:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
<strong>本仓库包含全面的容器部署示例</strong>

- **位置:** `examples/container-app/`
- **复杂度:** ⭐-⭐⭐⭐⭐（从初学者到高级）
- **包含内容:**
  - [主指南](container-app/README.md) - 容器部署的完整概述
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - 基本 REST API 示例
  - [Microservices Architecture](../../../examples/container-app/microservices) - 生产就绪的多服务部署
  - 快速上手、生产和高级模式
  - 监控、安全和成本优化

**快速开始:**
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

**技术:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
<strong>本仓库包含完整的生产就绪实现</strong>

- **位置:** `examples/retail-multiagent-arm-template/`
- **复杂度:** ⭐⭐⭐⭐（高级）
- **包含内容:**
  - 完整的 ARM 部署模板
  - 多智能体架构（客户 + 库存）
  - Microsoft Foundry Models 集成
  - 带 RAG 的 AI 搜索
  - 全面监控
  - 一键部署脚本

**快速开始:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**技术:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 外部 Azure 示例（克隆后使用）

以下示例由官方 Azure-Samples 仓库维护。克隆它们以探索不同的 AZD 模式：

### 简单应用（第 1-2 章）

| 模板 | 仓库 | 复杂度 | 服务 |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [本地：simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [本地：microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | 多服务, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**如何使用:**
```bash
# 克隆任意示例
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# 部署
azd up
```

### AI 应用示例（第 2、5、8 章）

| 模板 | 仓库 | 复杂度 | 侧重 |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [本地：azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 部署 |
| **AI Chat 快速入门** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | 基本 AI 聊天 |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | 代理框架 |
| **Search + OpenAI 演示** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG 模式 |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | 企业级 AI |

### 数据库与高级模式（第 3-8 章）

| 模板 | 仓库 | 复杂度 | 侧重 |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | 数据库集成 |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | 无服务器 NoSQL |
| **Java 微服务** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | 多服务 |
| **ML 管道** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## 学习目标

通过完成这些示例，您将能够：
- 在真实应用场景中练习 Azure Developer CLI 工作流
- 了解不同的应用架构及其 azd 实现
- 掌握各种 Azure 服务的基础设施即代码模式
- 应用配置管理和环境特定的部署策略
- 在实际场景中实现监控、安全和伸缩模式
- 积累故障排除和调试真实部署场景的经验

## 学习成果

完成这些示例后，您将能够：
- 自信地使用 Azure Developer CLI 部署各种应用类型
- 将提供的模板适配到您自己的应用需求
- 使用 Bicep 设计和实现自定义基础设施模式
- 为复杂的多服务应用配置正确的依赖关系
- 在真实场景中应用安全、监控和性能最佳实践
- 根据实践经验对部署进行故障排除和优化

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

> **💡 新接触 AZD？** 从示例 #1（Flask API）开始 - 大约需要 20 分钟，并教授核心概念。

### 初学者
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)**（本地） ⭐  
   部署一个带 scale-to-zero 的简单 REST API  
   **时间:** 20-25 分钟 | **费用:** $0-5/月  
   **您将学到:** 基本 azd 工作流、容器化、健康探针  
   **预期结果:** 可用的 API 端点，返回 "Hello, World!"，并具备监控

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   部署带 MongoDB 的 Node.js Express Web 应用  
   **时间:** 25-35 分钟 | **费用:** $10-30/月  
   **您将学到:** 数据库集成、环境变量、连接字符串  
   **预期结果:** 具有创建/读取/更新/删除功能的待办事项应用

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   使用 Azure Static Web Apps 托管 React 静态网站  
   **时间:** 20-30 分钟 | **费用:** $0-10/月  
   **您将学到:** 静态托管、无服务器函数、CDN 部署  
   **预期结果:** 带有 API 后端 的 React 界面，自动 SSL，全球 CDN

### 中级用户
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)**（本地） ⭐⭐  
   部署 gpt-4.1，带聊天界面和安全的 API 密钥管理  
   **时间:** 35-45 分钟 | **费用:** $50-200/月  
   **您将学到:** Microsoft Foundry Models 部署、Key Vault 集成、令牌跟踪  
   **预期结果:** 可用的聊天应用，使用 gpt-4.1 并具备成本监控

5. **[Container App - Microservices](../../../examples/container-app/microservices)**（本地） ⭐⭐⭐⭐  
   生产就绪的多服务架构  
   **时间:** 45-60 分钟 | **费用:** $50-150/月  
   **您将学到:** 服务间通信、消息队列、分布式追踪  
   **预期结果:** 两个服务的系统（API 网关 + 产品服务），带监控

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   带 Azure SQL 的 C# Web 应用和 API  
   **时间:** 30-45 分钟 | **费用:** $20-80/月  
   **您将学到:** Entity Framework、数据库迁移、连接安全  
   **预期结果:** 带 Azure SQL 后端的 C# API，自动架构部署

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   带 HTTP 触发器和 Cosmos DB 的 Python Azure Functions  
   **时间:** 30-40 分钟 | **费用:** $10-40/月  
   **您将学到:** 事件驱动架构、无服务器伸缩、NoSQL 集成  
   **预期结果:** 响应 HTTP 请求并使用 Cosmos DB 存储的函数应用

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   使用 Container Apps 和 API 网关的多服务 Java 应用  
   **时间:** 60-90 分钟 | **费用:** $80-200/月  
   **您将学到:** Spring Boot 部署、服务网格、负载均衡  
   **预期结果:** 带服务发现和路由的多服务 Java 系统

### Microsoft Foundry 模板

1. **[Microsoft Foundry Models Chat App - 本地示例](../../../examples/azure-openai-chat)** ⭐⭐  
   完整的 gpt-4.1 部署，带聊天界面  
   **时间:** 35-45 分钟 | **费用:** $50-200/月  
   **预期结果:** 可用的聊天应用，具备令牌跟踪和成本监控

2. **[Azure Search + OpenAI 演示](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   具有 RAG 架构的智能聊天应用  
   **时间:** 60-90 分钟 | **费用:** $100-300/月  
   **预期结果:** 基于 RAG 的聊天界面，带文档搜索和引用

3. **[AI 文档处理](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   使用 Azure AI 服务的文档分析  
   **时间:** 40-60 分钟 | **费用:** $20-80/月  
   **预期结果:** 从上传文档中提取文本、表格和实体的 API

4. **[机器学习流水线](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   带 Azure Machine Learning 的 MLOps 工作流  
   **时间:** 2-3 小时 | **费用:** $150-500/月  
   **预期结果:** 具有训练、部署和监控的自动化 ML 流水线

### 真实世界场景

#### **Retail Multi-Agent Solution** 🆕
**[完整实现指南](./retail-scenario.md)**

一个全面的、生产就绪的多智能体客户支持解决方案，展示了使用 AZD 部署企业级 AI 应用的能力。该场景提供：

- <strong>完整架构</strong>：具有专门客户服务和库存管理代理的多智能体系统
- <strong>生产基础设施</strong>: 多区域 Microsoft Foundry Models 部署、AI Search、Container Apps，以及全面的监控
- **可一键部署的 ARM 模板**: 一键部署，支持多种配置模式（Minimal/Standard/Premium）
- <strong>高级功能</strong>: 红队安全验证、代理评估框架、成本优化与故障排除指南
- <strong>真实业务场景</strong>: 零售客户支持用例，包含文件上传、搜索集成与动态扩展

<strong>技术</strong>: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

<strong>复杂度</strong>: ⭐⭐⭐⭐ (高级 - 企业生产就绪)

<strong>适合对象</strong>: AI 开发者、解决方案架构师以及构建生产级多代理系统的团队

<strong>快速开始</strong>: 使用随附的 ARM 模板在 30 分钟内部署完整解决方案，命令：`./deploy.sh -g myResourceGroup`

## 📋 使用说明

### 先决条件

在运行任何示例之前：
- ✅ 具有所有者（Owner）或参与者（Contributor）访问权限的 Azure 订阅
- ✅ 已安装 Azure Developer CLI（[安装指南](../docs/chapter-01-foundation/installation.md)）
- ✅ Docker Desktop 正在运行（用于容器示例）
- ✅ 适当的 Azure 配额（检查示例的特定要求）

> **💰 成本警告：** 所有示例都会创建真实的 Azure 资源并产生费用。有关费用估算，请参阅各示例的 README 文件。完成后请记得运行 `azd down` 以避免持续计费。

### 在本地运行示例

1. <strong>克隆或复制示例</strong>
   ```bash
   # 导航到所需的示例
   cd examples/simple-web-app
   ```

2. **初始化 AZD 环境**
   ```bash
   # 使用现有模板初始化
   azd init
   
   # 或创建新环境
   azd env new my-environment
   ```

3. <strong>配置环境</strong>
   ```bash
   # 设置所需变量
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. <strong>部署</strong>
   ```bash
   # 部署基础设施和应用程序
   azd up
   ```

5. <strong>验证部署</strong>
   ```bash
   # 获取服务端点
   azd env get-values
   
   # 测试端点（示例）
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **预期的成功指示器：**
   - ✅ `azd up` 无错误完成
   - ✅ 服务端点返回 HTTP 200
   - ✅ Azure 门户显示 “Running” 状态
   - ✅ Application Insights 接收到遥测数据

> **⚠️ 出现问题？** 请参阅 [常见问题](../docs/chapter-07-troubleshooting/common-issues.md) 获取部署故障排除信息

### 调整示例

每个示例都包含：
- **README.md** - 详细的设置和自定义说明
- **azure.yaml** - 带注释的 AZD 配置
- **infra/** - 带参数说明的 Bicep 模板
- **src/** - 示例应用代码
- **scripts/** - 常见任务的辅助脚本

## 🎯 学习目标

### 示例类别

#### <strong>基础部署</strong>
- 单服务应用
- 简单基础设施模式
- 基本配置管理
- 成本效益的开发配置

#### <strong>高级场景</strong>
- 多服务架构
- 复杂的网络配置
- 数据库集成模式
- 安全与合规实现

#### <strong>生产就绪模式</strong>
- 高可用性配置
- 监控与可观测性
- CI/CD 集成
- 灾难恢复方案

## 📖 示例说明

### 简单 Web 应用 - Node.js Express
<strong>技术</strong>: Node.js、Express、MongoDB、Container Apps  
<strong>复杂度</strong>: 入门  
<strong>概念</strong>: 基本部署、REST API、NoSQL 数据库集成

### 静态网站 - React SPA
<strong>技术</strong>: React、Azure Static Web Apps、Azure Functions、Cosmos DB  
<strong>复杂度</strong>: 入门  
<strong>概念</strong>: 静态托管、无服务器后端、现代前端开发

### 容器应用 - Python Flask
<strong>技术</strong>: Python Flask、Docker、Container Apps、Container Registry、Application Insights  
<strong>复杂度</strong>: 入门  
<strong>概念</strong>: 容器化、REST API、scale-to-zero、健康探针、监控  
<strong>位置</strong>: [本地示例](../../../examples/container-app/simple-flask-api)

### 容器应用 - 微服务架构
<strong>技术</strong>: Python、Node.js、C#、Go、Service Bus、Cosmos DB、Azure SQL、Container Apps  
<strong>复杂度</strong>: 高级  
<strong>概念</strong>: 多服务架构、服务间通信、消息队列、分布式追踪  
<strong>位置</strong>: [本地示例](../../../examples/container-app/microservices)

### 数据库应用 - 使用 Azure SQL 的 C#
<strong>技术</strong>: C# ASP.NET Core、Azure SQL Database、App Service  
<strong>复杂度</strong>: 中级  
<strong>概念</strong>: Entity Framework、数据库连接、Web API 开发

### 无服务器函数 - Python Azure Functions
<strong>技术</strong>: Python、Azure Functions、Cosmos DB、Static Web Apps  
<strong>复杂度</strong>: 中级  
<strong>概念</strong>: 事件驱动架构、无服务器计算、全栈开发

### 微服务 - Java Spring Boot
<strong>技术</strong>: Java Spring Boot、Container Apps、Service Bus、API Gateway  
<strong>复杂度</strong>: 中级  
<strong>概念</strong>: 微服务通信、分布式系统、企业模式

### Microsoft Foundry 示例

#### Microsoft Foundry Models 聊天应用
<strong>技术</strong>: Microsoft Foundry Models、Azure AI Search、App Service  
<strong>复杂度</strong>: 中级  
<strong>概念</strong>: RAG 架构、向量搜索、LLM 集成

#### AI 文档处理
<strong>技术</strong>: Azure AI Document Intelligence、Storage、Functions  
<strong>复杂度</strong>: 中级  
<strong>概念</strong>: 文档分析、OCR、数据提取

#### 机器学习流水线
<strong>技术</strong>: Azure ML、MLOps、Container Registry  
<strong>复杂度</strong>: 高级  
<strong>概念</strong>: 模型训练、部署流水线、监控

## 🛠 配置示例

`configurations/` 目录包含可重用组件：

### 环境配置
- 开发环境设置
- 预发布（Staging）环境配置
- 生产就绪配置
- 多区域部署设置

### Bicep 模块
- 可重用的基础设施组件
- 常见资源模式
- 安全加固模板
- 成本优化配置

### 辅助脚本
- 环境设置自动化
- 数据库迁移脚本
- 部署验证工具
- 成本监控实用工具

## 🔧 自定义指南

### 将示例调整为您的用例

1. <strong>审查先决条件</strong>
   - 检查 Azure 服务要求
   - 验证订阅配额限制
   - 理解成本影响

2. <strong>修改配置</strong>
   - 更新 `azure.yaml` 服务定义
   - 定制 Bicep 模板
   - 调整环境变量

3. <strong>彻底测试</strong>
   - 首先部署到开发环境
   - 验证功能
   - 测试扩展与性能

4. <strong>安全审查</strong>
   - 审查访问控制
   - 实施密钥/机密管理
   - 启用监控与告警

## 📊 对比矩阵

| 示例 | 服务 | 数据库 | 身份验证 | 监控 | 复杂度 |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat**（本地） | 2 | ❌ | Key Vault | 完整 | ⭐⭐ |
| **Python Flask API**（本地） | 1 | ❌ | 基本 | 完整 | ⭐ |
| **Microservices**（本地） | 5+ | ✅ | 企业级 | 高级 | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | 基本 | 基本 | ⭐ |
| React SPA + Functions | 3 | ✅ | 基本 | 完整 | ⭐ |
| Python Flask Container | 2 | ❌ | 基本 | 完整 | ⭐ |
| C# Web API + SQL | 2 | ✅ | 完整 | 完整 | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | 完整 | 完整 | ⭐⭐ |
| Java Microservices | 5+ | ✅ | 完整 | 完整 | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | 完整 | 完整 | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | 基本 | 完整 | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | 完整 | 完整 | ⭐⭐⭐⭐ |
| **Retail Multi-Agent**（本地） | **8+** | **✅** | <strong>企业级</strong> | <strong>高级</strong> | **⭐⭐⭐⭐** |

## 🎓 学习路径

### 推荐进阶顺序

1. **从简单 Web 应用开始**
   - 学习基本的 AZD 概念
   - 理解部署工作流
   - 练习环境管理

2. <strong>尝试静态网站</strong>
   - 探索不同的托管选项
   - 学习 CDN 集成
   - 理解 DNS 配置

3. <strong>转向容器应用</strong>
   - 学习容器化基础
   - 理解扩展概念
   - 使用 Docker 进行实践

4. <strong>添加数据库集成</strong>
   - 学习数据库预配
   - 理解连接字符串
   - 练习机密管理

5. <strong>探索无服务器</strong>
   - 理解事件驱动架构
   - 学习触发器与绑定
   - 练习 API 集成

6. <strong>构建微服务</strong>
   - 学习服务间通信
   - 理解分布式系统
   - 练习复杂部署

## 🔍 查找合适的示例

### 按技术栈
- **Container Apps**: [Python Flask API（本地）](../../../examples/container-app/simple-flask-api), [Microservices（本地）](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway（本地）](../../../examples/container-app/microservices)
- **Python**: [Python Flask API（本地）](../../../examples/container-app/simple-flask-api), [Microservices Product Service（本地）](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service（本地）](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service（本地）](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask（本地）](../../../examples/container-app/simple-flask-api), [Microservices（本地）](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices（本地）](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat（本地）](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- <strong>多代理系统</strong>: **Retail Multi-Agent Solution**
- **OpenAI 集成**: **[Microsoft Foundry Models Chat（本地）](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- <strong>企业生产级</strong>: [Microservices（本地）](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### 按架构模式
- **简单 REST API**: [Python Flask API（本地）](../../../examples/container-app/simple-flask-api)
- **单体（Monolithic）**: Node.js Express Todo, C# Web API + SQL
- **静态 + 无服务器**: React SPA + Functions, Python Functions + SPA
- <strong>微服务</strong>: [Production Microservices（本地）](../../../examples/container-app/microservices), Java Spring Boot Microservices
- <strong>容器化</strong>: [Python Flask（本地）](../../../examples/container-app/simple-flask-api), [Microservices（本地）](../../../examples/container-app/microservices)
- **AI 驱动**: **[Microsoft Foundry Models Chat（本地）](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- <strong>多代理架构</strong>: **Retail Multi-Agent Solution**
- <strong>企业多服务</strong>: [Microservices（本地）](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### 按复杂度等级
- <strong>入门</strong>: [Python Flask API（本地）](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- <strong>中级</strong>: **[Microsoft Foundry Models Chat（本地）](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- <strong>高级</strong>: ML Pipeline
- <strong>企业生产就绪</strong>: [Microservices（本地）](../../../examples/container-app/microservices)（带消息队列的多服务），**Retail Multi-Agent Solution**（带 ARM 模板部署的完整多代理系统）

## 📚 附加资源

### 文档链接
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### 社区示例
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [带有 C# API 的 React Web 应用](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps 作业](https://github.com/Azure-Samples/container-apps-jobs)
- [使用 Java 的 Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### 最佳实践
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [云采用框架](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 贡献示例

有有用的示例想分享？我们欢迎贡献！

### 提交指南
1. 遵循既定的目录结构
2. 包含完整的 README.md
3. 在配置文件中添加注释
4. 在提交前进行彻底测试
5. 包括成本估算和先决条件

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

<strong>小贴士</strong>：从与您的技术栈最匹配的最简单示例开始，然后逐步过渡到更复杂的场景。每个示例都建立在前一个示例的概念之上！

## 🚀 准备开始吗？

### 你的学习路径

1. **完全初学者？** → 从 [Flask API](../../../examples/container-app/simple-flask-api) 开始 (⭐, 20 分钟)
2. **有基本的 AZD 知识？** → 试试 [微服务](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 分钟)
3. **构建 AI 应用？** → 从 [Microsoft Foundry 模型聊天](../../../examples/azure-openai-chat) 开始 (⭐⭐, 35 分) 或探索 [零售多代理](retail-scenario.md) (⭐⭐⭐⭐, 2+ 小时)
4. **需要特定技术栈？** → 使用上方的 [找到合适的示例](#-finding-the-right-example) 部分

### 下一步

- ✅ 查看上方的 [先决条件](#先决条件)
- ✅ 选择与您技能水平相匹配的示例（参见 [复杂度说明](#复杂度评级说明)）
- ✅ 在部署前彻底阅读该示例的 README
- ✅ 在测试后设置提醒运行 `azd down`
- ✅ 通过 GitHub Issues 或 Discussions 分享您的体验

### 需要帮助？

- 📖 [FAQ](../resources/faq.md) - 常见问题解答
- 🐛 [疑难解答指南](../docs/chapter-07-troubleshooting/common-issues.md) - 修复部署问题
- 💬 [GitHub 讨论](https://github.com/microsoft/AZD-for-beginners/discussions) - 向社区提问
- 📚 [学习指南](../resources/study-guide.md) - 巩固您的学习

---

<strong>导航</strong>
- **📚 课程主页**: [AZD For Beginners](../README.md)
- **📖 学习资料**: [学习指南](../resources/study-guide.md) | [备忘单](../resources/cheat-sheet.md) | [术语表](../resources/glossary.md)
- **🔧 资源**: [常见问题](../resources/faq.md) | [疑难解答](../docs/chapter-07-troubleshooting/common-issues.md)

---

*最后更新：2025年11月 | [报告问题](https://github.com/microsoft/AZD-for-beginners/issues) | [贡献示例](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->