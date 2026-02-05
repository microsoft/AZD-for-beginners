# 示例 - 实用的AZD模板和配置

**通过示例学习 - 按章节组织**
- **📚 课程主页**: [AZD入门](../README.md)
- **📖 章节映射**: 示例按学习复杂度组织
- **🚀 本地示例**: [零售多代理解决方案](retail-scenario.md)
- **🤖 外部AI示例**: 链接到Azure Samples仓库

> **📍 重要提示: 本地与外部示例**  
> 此仓库包含**4个完整的本地示例**，提供完整实现：  
> - **Azure OpenAI聊天** (GPT-4部署及聊天界面)  
> - **容器应用** (简单Flask API + 微服务)  
> - **数据库应用** (Web + SQL数据库)  
> - **零售多代理** (企业AI解决方案)  
>  
> 其他示例为**外部参考**，链接到Azure-Samples仓库，可供克隆使用。

## 简介

此目录提供实用示例和参考，帮助您通过实践学习Azure Developer CLI。零售多代理场景是一个完整的、生产级实现，包含在此仓库中。其他示例引用官方Azure Samples，展示各种AZD模式。

### 复杂度评级图例

- ⭐ **初学者** - 基本概念，单一服务，15-30分钟
- ⭐⭐ **中级** - 多服务，数据库集成，30-60分钟
- ⭐⭐⭐ **高级** - 复杂架构，AI集成，1-2小时
- ⭐⭐⭐⭐ **专家** - 生产级，企业模式，2小时以上

## 🎯 此仓库的内容

### ✅ 本地实现（可直接使用）

#### [Azure OpenAI聊天应用](azure-openai-chat/README.md) 🆕
**完整的GPT-4部署及聊天界面，包含在此仓库中**

- **位置:** `examples/azure-openai-chat/`
- **复杂度:** ⭐⭐ (中级)
- **包含内容:**
  - 完整的Azure OpenAI部署 (GPT-4)
  - Python命令行聊天界面
  - Key Vault集成以确保API密钥安全
  - Bicep基础设施模板
  - 令牌使用和成本跟踪
  - 限流和错误处理

**快速开始:**
```bash
# 导航到示例
cd examples/azure-openai-chat

# 部署所有内容
azd up

# 安装依赖项并开始聊天
pip install -r src/requirements.txt
python src/chat.py
```

**技术:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [容器应用示例](container-app/README.md) 🆕
**全面的容器部署示例，包含在此仓库中**

- **位置:** `examples/container-app/`
- **复杂度:** ⭐-⭐⭐⭐⭐ (从初学者到专家)
- **包含内容:**
  - [主指南](container-app/README.md) - 容器部署的完整概述
  - [简单Flask API](../../../examples/container-app/simple-flask-api) - 基本REST API示例
  - [微服务架构](../../../examples/container-app/microservices) - 生产级多服务部署
  - 快速开始、生产和高级模式
  - 监控、安全性和成本优化

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

#### [零售多代理解决方案](retail-scenario.md) 🆕
**完整的生产级实现，包含在此仓库中**

- **位置:** `examples/retail-multiagent-arm-template/`
- **复杂度:** ⭐⭐⭐⭐ (高级)
- **包含内容:**
  - 完整的ARM部署模板
  - 多代理架构（客户+库存）
  - Azure OpenAI集成
  - 使用RAG的AI搜索
  - 全面的监控
  - 一键部署脚本

**快速开始:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**技术:** Azure OpenAI, AI搜索, 容器应用, Cosmos DB, Application Insights

---

## 🔗 外部Azure示例（克隆使用）

以下示例由官方Azure-Samples仓库维护。克隆它们以探索不同的AZD模式：

### 简单应用（章节1-2）

| 模板 | 仓库 | 复杂度 | 服务 |
|:-----|:-----|:-------|:-----|
| **Python Flask API** | [本地: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, 容器应用, Application Insights |
| **微服务** | [本地: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | 多服务, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, 容器应用 |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | 静态Web应用, Functions, SQL |
| **Python Flask容器** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, 容器应用, API |

**使用方法:**
```bash
# 克隆任意示例
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# 部署
azd up
```

### AI应用示例（章节2, 5, 8）

| 模板 | 仓库 | 复杂度 | 重点 |
|:-----|:-----|:-------|:-----|
| **Azure OpenAI聊天** | [本地: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4部署 |
| **AI聊天快速入门** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | 基本AI聊天 |
| **AI代理** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | 代理框架 |
| **搜索+OpenAI演示** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG模式 |
| **Contoso聊天** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | 企业AI |

### 数据库及高级模式（章节3-8）

| 模板 | 仓库 | 复杂度 | 重点 |
|:-----|:-----|:-------|:-----|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | 数据库集成 |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | 无服务器NoSQL |
| **Java微服务** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | 多服务 |
| **ML管道** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## 学习目标

通过完成这些示例，您将能够：
- 使用真实应用场景练习Azure Developer CLI工作流
- 理解不同应用架构及其AZD实现
- 掌握各种Azure服务的基础设施即代码模式
- 应用配置管理和环境特定的部署策略
- 在实际场景中实现监控、安全性和扩展模式
- 积累解决问题和调试真实部署场景的经验

## 学习成果

完成这些示例后，您将能够：
- 自信地使用Azure Developer CLI部署各种应用类型
- 根据自己的应用需求调整提供的模板
- 设计并实现使用Bicep的自定义基础设施模式
- 配置具有正确依赖关系的复杂多服务应用
- 在实际场景中应用安全性、监控和性能最佳实践
- 根据实践经验解决问题并优化部署

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

## 快速开始示例

> **💡 AZD新手？** 从示例#1（Flask API）开始 - 约需20分钟，教授核心概念。

### 初学者
1. **[容器应用 - Python Flask API](../../../examples/container-app/simple-flask-api)** (本地) ⭐  
   部署一个简单的REST API，支持零扩展  
   **时间:** 20-25分钟 | **成本:** $0-5/月  
   **您将学习:** 基本AZD工作流，容器化，健康探测  
   **预期结果:** 工作的API端点返回"Hello, World!"并带有监控功能

2. **[简单Web应用 - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   部署一个带MongoDB的Node.js Express Web应用  
   **时间:** 25-35分钟 | **成本:** $10-30/月  
   **您将学习:** 数据库集成，环境变量，连接字符串  
   **预期结果:** 带有创建/读取/更新/删除功能的待办事项应用

3. **[静态网站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   使用Azure静态Web应用托管React静态网站  
   **时间:** 20-30分钟 | **成本:** $0-10/月  
   **您将学习:** 静态托管，无服务器函数，CDN部署  
   **预期结果:** React UI与API后端，自动SSL，全球CDN

### 中级用户
4. **[Azure OpenAI聊天应用](../../../examples/azure-openai-chat)** (本地) ⭐⭐  
   部署GPT-4聊天界面并管理安全API密钥  
   **时间:** 35-45分钟 | **成本:** $50-200/月  
   **您将学习:** Azure OpenAI部署，Key Vault集成，令牌跟踪  
   **预期结果:** 工作的聊天应用，支持GPT-4和成本监控

5. **[容器应用 - 微服务](../../../examples/container-app/microservices)** (本地) ⭐⭐⭐⭐  
   生产级多服务架构  
   **时间:** 45-60分钟 | **成本:** $50-150/月  
   **您将学习:** 服务通信，消息队列，分布式追踪  
   **预期结果:** 2服务系统（API网关+产品服务）带有监控功能

6. **[数据库应用 - C#与Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   带有C# API和Azure SQL数据库的Web应用  
   **时间:** 30-45分钟 | **成本:** $20-80/月  
   **您将学习:** 实体框架，数据库迁移，连接安全性  
   **预期结果:** 带有Azure SQL后端的C# API，自动架构部署

7. **[无服务器函数 - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   带有HTTP触发器和Cosmos DB的Python Azure Functions  
   **时间:** 30-40分钟 | **成本:** $10-40/月  
   **您将学习:** 事件驱动架构，无服务器扩展，NoSQL集成  
   **预期结果:** 响应HTTP请求的函数应用，带有Cosmos DB存储

8. **[微服务 - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   带有容器应用和API网关的多服务Java应用  
   **时间:** 60-90分钟 | **成本:** $80-200/月  
   **您将学习:** Spring Boot部署，服务网格，负载均衡  
   **预期结果:** 带有服务发现和路由的多服务Java系统

### Azure AI Foundry模板

1. **[Azure OpenAI聊天应用 - 本地示例](../../../examples/azure-openai-chat)** ⭐⭐  
   完整的GPT-4部署及聊天界面  
   **时间:** 35-45分钟 | **成本:** $50-200/月  
   **预期结果:** 工作的聊天应用，支持令牌跟踪和成本监控

2. **[Azure搜索+OpenAI演示](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   使用RAG架构的智能聊天应用  
   **时间:** 60-90分钟 | **成本:** $100-300/月  
   **预期结果:** 支持文档搜索和引用的RAG驱动聊天界面

3. **[AI文档处理](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   使用Azure AI服务进行文档分析  
   **时间:** 40-60分钟 | **成本:** $20-80/月  
   **预期结果:** 提取上传文档中的文本、表格和实体的API

4. **[机器学习管道](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   使用Azure Machine Learning的MLOps工作流  
   **时间:** 2-3小时 | **成本:** $150-500/月  
   **预期结果:** 自动化的ML管道，支持训练、部署和监控

### 实际场景

#### **零售多代理解决方案** 🆕
**[完整实现指南](./retail-scenario.md)**

一个全面的、生产级的多代理客户支持解决方案，展示了使用AZD部署企业级AI应用的能力。此场景提供：

- **完整架构**: 多代理系统，包含专门的客户服务和库存管理代理
- **生产基础设施**：多区域 Azure OpenAI 部署、AI 搜索、容器应用和全面的监控  
- **可部署的 ARM 模板**：一键部署，支持多种配置模式（Minimal/Standard/Premium）  
- **高级功能**：红队安全验证、代理评估框架、成本优化和故障排除指南  
- **真实业务场景**：零售客户支持用例，支持文件上传、搜索集成和动态扩展  

**技术**：Azure OpenAI (GPT-4o, GPT-4o-mini)、Azure AI Search、容器应用、Cosmos DB、Application Insights、Document Intelligence、Bing Search API  

**复杂度**：⭐⭐⭐⭐（高级 - 企业级生产就绪）  

**适合人群**：AI 开发者、解决方案架构师以及构建生产多代理系统的团队  

**快速开始**：使用包含的 ARM 模板，在 30 分钟内通过 `./deploy.sh -g myResourceGroup` 部署完整解决方案  

## 📋 使用说明  

### 先决条件  

在运行任何示例之前：  
- ✅ 拥有 Azure 订阅，并具有所有者或贡献者权限  
- ✅ 已安装 Azure Developer CLI（[安装指南](../docs/getting-started/installation.md)）  
- ✅ Docker Desktop 正在运行（适用于容器示例）  
- ✅ 确保 Azure 配额满足示例特定需求  

> **💰 成本警告**：所有示例都会创建实际的 Azure 资源并产生费用。请查看各示例的 README 文件以了解成本估算。完成后请运行 `azd down` 以避免持续费用。  

### 本地运行示例  

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
  
   **预期成功指标**：  
   - ✅ `azd up` 无错误完成  
   - ✅ 服务端点返回 HTTP 200  
   - ✅ Azure 门户显示“运行中”状态  
   - ✅ Application Insights 接收到遥测数据  

> **⚠️ 有问题？** 请参阅 [常见问题](../docs/troubleshooting/common-issues.md) 以获取部署故障排除指南  

### 调整示例  

每个示例包括：  
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
- 成本效益高的开发设置  

#### **高级场景**  
- 多服务架构  
- 复杂的网络配置  
- 数据库集成模式  
- 安全性和合规性实现  

#### **生产就绪模式**  
- 高可用性配置  
- 监控和可观测性  
- CI/CD 集成  
- 灾难恢复设置  

## 📖 示例描述  

### 简单 Web 应用 - Node.js Express  
**技术**：Node.js、Express、MongoDB、容器应用  
**复杂度**：初学者  
**概念**：基础部署、REST API、NoSQL 数据库集成  

### 静态网站 - React SPA  
**技术**：React、Azure 静态 Web 应用、Azure Functions、Cosmos DB  
**复杂度**：初学者  
**概念**：静态托管、无服务器后端、现代 Web 开发  

### 容器应用 - Python Flask  
**技术**：Python Flask、Docker、容器应用、容器注册表、Application Insights  
**复杂度**：初学者  
**概念**：容器化、REST API、零扩展、健康探测、监控  
**位置**：[本地示例](../../../examples/container-app/simple-flask-api)  

### 容器应用 - 微服务架构  
**技术**：Python、Node.js、C#、Go、Service Bus、Cosmos DB、Azure SQL、容器应用  
**复杂度**：高级  
**概念**：多服务架构、服务通信、消息队列、分布式追踪  
**位置**：[本地示例](../../../examples/container-app/microservices)  

### 数据库应用 - C# 与 Azure SQL  
**技术**：C# ASP.NET Core、Azure SQL 数据库、App Service  
**复杂度**：中级  
**概念**：Entity Framework、数据库连接、Web API 开发  

### 无服务器函数 - Python Azure Functions  
**技术**：Python、Azure Functions、Cosmos DB、静态 Web 应用  
**复杂度**：中级  
**概念**：事件驱动架构、无服务器计算、全栈开发  

### 微服务 - Java Spring Boot  
**技术**：Java Spring Boot、容器应用、Service Bus、API 网关  
**复杂度**：中级  
**概念**：微服务通信、分布式系统、企业模式  

### Azure AI Foundry 示例  

#### Azure OpenAI 聊天应用  
**技术**：Azure OpenAI、Cognitive Search、App Service  
**复杂度**：中级  
**概念**：RAG 架构、向量搜索、LLM 集成  

#### AI 文档处理  
**技术**：Azure AI Document Intelligence、存储、Functions  
**复杂度**：中级  
**概念**：文档分析、OCR、数据提取  

#### 机器学习管道  
**技术**：Azure ML、MLOps、容器注册表  
**复杂度**：高级  
**概念**：模型训练、部署管道、监控  

## 🛠 配置示例  

`configurations/` 目录包含可重用组件：  

### 环境配置  
- 开发环境设置  
- 预生产环境配置  
- 生产就绪配置  
- 多区域部署设置  

### Bicep 模块  
- 可重用的基础设施组件  
- 常见资源模式  
- 加强安全的模板  
- 成本优化配置  

### 辅助脚本  
- 环境设置自动化  
- 数据库迁移脚本  
- 部署验证工具  
- 成本监控工具  

## 🔧 自定义指南  

### 根据您的用例调整示例  

1. **检查先决条件**  
   - 检查 Azure 服务需求  
   - 验证订阅限制  
   - 了解成本影响  

2. **修改配置**  
   - 更新 `azure.yaml` 服务定义  
   - 自定义 Bicep 模板  
   - 调整环境变量  

3. **全面测试**  
   - 首先部署到开发环境  
   - 验证功能  
   - 测试扩展性和性能  

4. **安全审查**  
   - 审查访问控制  
   - 实现密钥管理  
   - 启用监控和警报  

## 📊 对比矩阵  

| 示例 | 服务 | 数据库 | 认证 | 监控 | 复杂度 |  
|---------|----------|----------|------|------------|------------|  
| **Azure OpenAI 聊天**（本地） | 2 | ❌ | Key Vault | 完整 | ⭐⭐ |  
| **Python Flask API**（本地） | 1 | ❌ | 基础 | 完整 | ⭐ |  
| **微服务**（本地） | 5+ | ✅ | 企业级 | 高级 | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | 基础 | 基础 | ⭐ |  
| React SPA + Functions | 3 | ✅ | 基础 | 完整 | ⭐ |  
| Python Flask 容器 | 2 | ❌ | 基础 | 完整 | ⭐ |  
| C# Web API + SQL | 2 | ✅ | 完整 | 完整 | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | 完整 | 完整 | ⭐⭐ |  
| Java 微服务 | 5+ | ✅ | 完整 | 完整 | ⭐⭐ |  
| Azure OpenAI 聊天 | 3 | ✅ | 完整 | 完整 | ⭐⭐⭐ |  
| AI 文档处理 | 2 | ❌ | 基础 | 完整 | ⭐⭐ |  
| ML 管道 | 4+ | ✅ | 完整 | 完整 | ⭐⭐⭐⭐ |  
| **零售多代理**（本地） | **8+** | **✅** | **企业级** | **高级** | **⭐⭐⭐⭐** |  

## 🎓 学习路径  

### 推荐进阶  

1. **从简单 Web 应用开始**  
   - 学习基础 AZD 概念  
   - 理解部署工作流  
   - 练习环境管理  

2. **尝试静态网站**  
   - 探索不同的托管选项  
   - 学习 CDN 集成  
   - 理解 DNS 配置  

3. **转向容器应用**  
   - 学习容器化基础  
   - 理解扩展概念  
   - 练习使用 Docker  

4. **添加数据库集成**  
   - 学习数据库配置  
   - 理解连接字符串  
   - 练习密钥管理  

5. **探索无服务器**  
   - 理解事件驱动架构  
   - 学习触发器和绑定  
   - 练习使用 API  

6. **构建微服务**  
   - 学习服务通信  
   - 理解分布式系统  
   - 练习复杂部署  

## 🔍 查找合适的示例  

### 按技术栈  
- **容器应用**：[Python Flask API（本地）](../../../examples/container-app/simple-flask-api)、[微服务（本地）](../../../examples/container-app/microservices)、Java 微服务  
- **Node.js**：Node.js Express Todo 应用、[微服务 API 网关（本地）](../../../examples/container-app/microservices)  
- **Python**：[Python Flask API（本地）](../../../examples/container-app/simple-flask-api)、[微服务产品服务（本地）](../../../examples/container-app/microservices)、Python Functions + SPA  
- **C#**：[微服务订单服务（本地）](../../../examples/container-app/microservices)、C# Web API + SQL 数据库、Azure OpenAI 聊天应用、ML 管道  
- **Go**：[微服务用户服务（本地）](../../../examples/container-app/microservices)  
- **Java**：Java Spring Boot 微服务  
- **React**：React SPA + Functions  
- **容器**：[Python Flask（本地）](../../../examples/container-app/simple-flask-api)、[微服务（本地）](../../../examples/container-app/microservices)、Java 微服务  
- **数据库**：[微服务（本地）](../../../examples/container-app/microservices)、Node.js + MongoDB、C# + Azure SQL、Python + Cosmos DB  
- **AI/ML**：**[Azure OpenAI 聊天（本地）](../../../examples/azure-openai-chat)**、Azure OpenAI 聊天应用、AI 文档处理、ML 管道、**零售多代理解决方案**  
- **多代理系统**：**零售多代理解决方案**  
- **OpenAI 集成**：**[Azure OpenAI 聊天（本地）](../../../examples/azure-openai-chat)**、零售多代理解决方案  
- **企业级生产**：[微服务（本地）](../../../examples/container-app/microservices)、**零售多代理解决方案**  

### 按架构模式  
- **简单 REST API**：[Python Flask API（本地）](../../../examples/container-app/simple-flask-api)  
- **单体架构**：Node.js Express Todo、C# Web API + SQL  
- **静态 + 无服务器**：React SPA + Functions、Python Functions + SPA  
- **微服务**：[生产微服务（本地）](../../../examples/container-app/microservices)、Java Spring Boot 微服务  
- **容器化**：[Python Flask（本地）](../../../examples/container-app/simple-flask-api)、[微服务（本地）](../../../examples/container-app/microservices)  
- **AI 驱动**：**[Azure OpenAI 聊天（本地）](../../../examples/azure-openai-chat)**、Azure OpenAI 聊天应用、AI 文档处理、ML 管道、**零售多代理解决方案**  
- **多代理架构**：**零售多代理解决方案**  
- **企业多服务**：[微服务（本地）](../../../examples/container-app/microservices)、**零售多代理解决方案**  

### 按复杂度级别  
- **初学者**：[Python Flask API（本地）](../../../examples/container-app/simple-flask-api)、Node.js Express Todo、React SPA + Functions  
- **中级**：**[Azure OpenAI 聊天（本地）](../../../examples/azure-openai-chat)**、C# Web API + SQL、Python Functions + SPA、Java 微服务、Azure OpenAI 聊天应用、AI 文档处理  
- **高级**：ML 管道  
- **企业级生产就绪**：[微服务（本地）](../../../examples/container-app/microservices)（多服务带消息队列）、**零售多代理解决方案**（完整多代理系统，支持 ARM 模板部署）  

## 📚 其他资源  

### 文档链接  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Azure AI Foundry AZD 模板](https://github.com/Azure/ai-foundry-templates)  
- [Bicep 文档](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure 架构中心](https://learn.microsoft.com/en-us/azure/architecture/)  

### 社区示例  
- [Azure Samples AZD 模板](https://github.com/Azure-Samples/azd-templates)  
- [Azure AI Foundry 模板](https://github.com/Azure/ai-foundry-templates)  
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)  
- [C# 和 Azure SQL 的 Todo 应用](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Python 和 MongoDB 的 Todo 应用](https://github.com/Azure-Samples/todo-python-mongo)  
- [使用 Node.js 和 PostgreSQL 的待办事项应用](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [使用 C# API 的 React Web 应用](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure 容器应用任务](https://github.com/Azure-Samples/container-apps-jobs)
- [使用 Java 的 Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### 最佳实践
- [Azure 良好架构框架](https://learn.microsoft.com/en-us/azure/well-architected/)
- [云采用框架](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 贡献示例

有有用的示例想分享吗？我们欢迎您的贡献！

### 提交指南
1. 遵循已建立的目录结构
2. 包含全面的 README.md
3. 在配置文件中添加注释
4. 提交前进行充分测试
5. 包括成本估算和前置条件

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

**专业提示**：从与您的技术栈匹配的最简单示例开始，然后逐步尝试更复杂的场景。每个示例都基于前一个示例的概念！

## 🚀 准备开始了吗？

### 您的学习路径

1. **完全新手？** → 从 [Flask API](../../../examples/container-app/simple-flask-api) 开始 (⭐, 20 分钟)
2. **有基本的 AZD 知识？** → 尝试 [微服务](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 分钟)
3. **构建 AI 应用？** → 从 [Azure OpenAI Chat](../../../examples/azure-openai-chat) 开始 (⭐⭐, 35 分钟) 或探索 [零售多代理](retail-scenario.md) (⭐⭐⭐⭐, 2+ 小时)
4. **需要特定技术栈？** → 使用上方 [找到合适的示例](../../../examples) 部分

### 下一步

- ✅ 查看上方的 [前置条件](../../../examples)
- ✅ 选择与您的技能水平匹配的示例（参见 [复杂性等级说明](../../../examples)）
- ✅ 在部署前仔细阅读示例的 README
- ✅ 测试后设置提醒运行 `azd down`
- ✅ 通过 GitHub Issues 或 Discussions 分享您的体验

### 需要帮助？

- 📖 [常见问题](../resources/faq.md) - 解答常见问题
- 🐛 [故障排除指南](../docs/troubleshooting/common-issues.md) - 解决部署问题
- 💬 [GitHub 讨论](https://github.com/microsoft/AZD-for-beginners/discussions) - 向社区提问
- 📚 [学习指南](../resources/study-guide.md) - 巩固您的学习

---

**导航**
- **📚 课程主页**: [AZD 初学者指南](../README.md)
- **📖 学习资料**: [学习指南](../resources/study-guide.md) | [速查表](../resources/cheat-sheet.md) | [术语表](../resources/glossary.md)
- **🔧 资源**: [常见问题](../resources/faq.md) | [故障排除](../docs/troubleshooting/common-issues.md)

---

*最后更新：2025 年 11 月 | [报告问题](https://github.com/microsoft/AZD-for-beginners/issues) | [贡献示例](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：  
本文档使用AI翻译服务[Co-op Translator](https://github.com/Azure/co-op-translator)进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用此翻译而产生的任何误解或误读不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->