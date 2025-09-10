<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e45896a8acbafead1f195788780a4ab7",
  "translation_date": "2025-09-10T15:59:48+00:00",
  "source_file": "examples/README.md",
  "language_code": "zh"
}
-->
# 示例 - 实用的 AZD 模板和配置

## 介绍

此目录包含实用示例、模板和真实场景，帮助您通过动手实践学习 Azure Developer CLI。每个示例都提供完整的工作代码、基础设施模板以及针对不同应用架构和部署模式的详细说明。

## 学习目标

通过完成这些示例，您将能够：
- 在真实的应用场景中练习 Azure Developer CLI 工作流程
- 理解不同的应用架构及其 AZD 实现方式
- 掌握针对各种 Azure 服务的基础设施即代码模式
- 应用配置管理和环境特定的部署策略
- 在实际场景中实施监控、安全和扩展模式
- 积累解决问题和调试真实部署场景的经验

## 学习成果

完成这些示例后，您将能够：
- 自信地使用 Azure Developer CLI 部署各种类型的应用
- 根据自己的应用需求调整提供的模板
- 使用 Bicep 设计和实施自定义基础设施模式
- 配置具有正确依赖关系的复杂多服务应用
- 在实际场景中应用安全、监控和性能最佳实践
- 根据实践经验排查和优化部署问题

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

### 初学者
1. **[简单 Web 应用 - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - 使用 MongoDB 部署 Node.js Express Web 应用
2. **[静态网站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - 使用 Azure 静态 Web 应用托管 React 静态网站
3. **[容器应用 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - 部署容器化的 Python Flask 应用

### 中级用户
4. **[数据库应用 - C# 和 Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - 使用 C# API 和 Azure SQL 数据库的 Web 应用
5. **[无服务器函数 - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - 带有 HTTP 触发器和 Cosmos DB 的 Python Azure Functions
6. **[微服务 - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - 使用容器应用和 API 网关的多服务 Java 应用

### Azure AI Foundry 模板

1. **[Azure OpenAI 聊天应用](https://github.com/Azure-Samples/azure-search-openai-demo)** - 使用 Azure OpenAI 的智能聊天应用
2. **[AI 文档处理](https://github.com/Azure-Samples/azure-ai-document-processing)** - 使用 Azure AI 服务进行文档分析
3. **[机器学习管道](https://github.com/Azure-Samples/mlops-v2)** - 使用 Azure 机器学习的 MLOps 工作流

## 📋 使用说明

### 本地运行示例

1. **克隆或复制示例**  
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **初始化 AZD 环境**  
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **配置环境**  
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **部署**  
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### 调整示例

每个示例包括：
- **README.md** - 详细的设置和自定义说明
- **azure.yaml** - 带注释的 AZD 配置
- **infra/** - 带参数说明的 Bicep 模板
- **src/** - 示例应用代码
- **scripts/** - 常用任务的辅助脚本

## 🎯 学习目标

### 示例分类

#### **基础部署**
- 单服务应用
- 简单的基础设施模式
- 基础配置管理
- 成本效益高的开发设置

#### **高级场景**
- 多服务架构
- 复杂的网络配置
- 数据库集成模式
- 安全和合规性实现

#### **生产就绪模式**
- 高可用性配置
- 监控和可观察性
- CI/CD 集成
- 灾难恢复设置

## 📖 示例描述

### 简单 Web 应用 - Node.js Express
**技术栈**: Node.js, Express, MongoDB, 容器应用  
**复杂度**: 初学者  
**概念**: 基础部署、REST API、NoSQL 数据库集成

### 静态网站 - React SPA
**技术栈**: React, Azure 静态 Web 应用, Azure Functions, Cosmos DB  
**复杂度**: 初学者  
**概念**: 静态托管、无服务器后端、现代 Web 开发

### 容器应用 - Python Flask
**技术栈**: Python Flask, Docker, 容器应用, 容器注册表  
**复杂度**: 初学者  
**概念**: 容器化、微服务架构、API 开发

### 数据库应用 - C# 和 Azure SQL
**技术栈**: C# ASP.NET Core, Azure SQL 数据库, 应用服务  
**复杂度**: 中级  
**概念**: Entity Framework、数据库连接、Web API 开发

### 无服务器函数 - Python Azure Functions
**技术栈**: Python, Azure Functions, Cosmos DB, 静态 Web 应用  
**复杂度**: 中级  
**概念**: 事件驱动架构、无服务器计算、全栈开发

### 微服务 - Java Spring Boot
**技术栈**: Java Spring Boot, 容器应用, 服务总线, API 网关  
**复杂度**: 中级  
**概念**: 微服务通信、分布式系统、企业模式

### Azure AI Foundry 示例

#### Azure OpenAI 聊天应用
**技术栈**: Azure OpenAI, 认知搜索, 应用服务  
**复杂度**: 中级  
**概念**: RAG 架构、向量搜索、LLM 集成

#### AI 文档处理
**技术栈**: Azure AI 文档智能, 存储, Functions  
**复杂度**: 中级  
**概念**: 文档分析、OCR、数据提取

#### 机器学习管道
**技术栈**: Azure ML, MLOps, 容器注册表  
**复杂度**: 高级  
**概念**: 模型训练、部署管道、监控

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
- 安全加固模板
- 成本优化配置

### 辅助脚本
- 环境设置自动化
- 数据库迁移脚本
- 部署验证工具
- 成本监控工具

## 🔧 自定义指南

### 根据您的用例调整示例

1. **审查先决条件**
   - 检查 Azure 服务要求
   - 验证订阅限制
   - 了解成本影响

2. **修改配置**
   - 更新 `azure.yaml` 服务定义
   - 自定义 Bicep 模板
   - 调整环境变量

3. **彻底测试**
   - 首先部署到开发环境
   - 验证功能
   - 测试扩展性和性能

4. **安全审查**
   - 审查访问控制
   - 实施秘密管理
   - 启用监控和警报

## 📊 示例对比矩阵

| 示例 | 服务 | 数据库 | 认证 | 监控 | 复杂度 |
|------|------|--------|------|------|--------|
| Node.js Express Todo | 2 | ✅ | 基础 | 基础 | ⭐ |
| React SPA + Functions | 3 | ✅ | 基础 | 完整 | ⭐ |
| Python Flask Container | 2 | ❌ | 基础 | 完整 | ⭐ |
| C# Web API + SQL | 2 | ✅ | 完整 | 完整 | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | 完整 | 完整 | ⭐⭐ |
| Java 微服务 | 5+ | ✅ | 完整 | 完整 | ⭐⭐ |
| Azure OpenAI 聊天 | 3 | ✅ | 完整 | 完整 | ⭐⭐⭐ |
| AI 文档处理 | 2 | ❌ | 基础 | 完整 | ⭐⭐ |
| ML 管道 | 4+ | ✅ | 完整 | 完整 | ⭐⭐⭐⭐ |

## 🎓 学习路径

### 推荐进度

1. **从简单 Web 应用开始**
   - 学习基本 AZD 概念
   - 理解部署工作流程
   - 练习环境管理

2. **尝试静态网站**
   - 探索不同的托管选项
   - 学习 CDN 集成
   - 理解 DNS 配置

3. **转向容器应用**
   - 学习容器化基础知识
   - 理解扩展概念
   - 练习使用 Docker

4. **添加数据库集成**
   - 学习数据库配置
   - 理解连接字符串
   - 练习秘密管理

5. **探索无服务器架构**
   - 理解事件驱动架构
   - 学习触发器和绑定
   - 练习使用 API

6. **构建微服务**
   - 学习服务通信
   - 理解分布式系统
   - 练习复杂部署

## 🔍 找到合适的示例

### 按技术栈
- **Node.js**: Node.js Express Todo 应用
- **Python**: Python Flask 容器应用, Python Functions + SPA
- **C#**: C# Web API + SQL 数据库, Azure OpenAI 聊天应用, ML 管道
- **Java**: Java Spring Boot 微服务
- **React**: React SPA + Functions
- **容器**: Python Flask 容器应用, Java 微服务
- **数据库**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI 聊天应用, AI 文档处理, ML 管道

### 按架构模式
- **单体架构**: Node.js Express Todo, C# Web API + SQL
- **静态 + 无服务器**: React SPA + Functions, Python Functions + SPA
- **微服务**: Java Spring Boot 微服务
- **容器化**: Python Flask 容器应用
- **AI 驱动**: Azure OpenAI 聊天应用, AI 文档处理, ML 管道

### 按复杂度级别
- **初学者**: Node.js Express Todo, React SPA + Functions, Python Flask 容器应用
- **中级**: C# Web API + SQL, Python Functions + SPA, Java 微服务, Azure OpenAI 聊天应用, AI 文档处理
- **高级**: ML 管道

## 📚 其他资源

### 文档链接
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD 模板](https://github.com/Azure/ai-foundry-templates)
- [Bicep 文档](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure 架构中心](https://learn.microsoft.com/en-us/azure/architecture/)

### 社区示例
- [Azure 示例 AZD 模板](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry 模板](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [使用 C# 和 Azure SQL 的 Todo 应用](https://github.com/Azure-Samples/todo-csharp-sql)
- [使用 Python 和 MongoDB 的 Todo 应用](https://github.com/Azure-Samples/todo-python-mongo)
- [使用 Node.js 和 PostgreSQL 的 Todo 应用](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [带有 C# API 的 React Web 应用](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure 容器应用作业](https://github.com/Azure-Samples/container-apps-jobs)
- [使用 Java 的 Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### 最佳实践
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [云采用框架](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 贡献示例

有有用的示例要分享吗？我们欢迎您的贡献！

### 提交指南
1. 遵循既定的目录结构
2. 包含全面的 README.md
3. 在配置文件中添加注释
4. 在提交前彻底测试
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

**提示**: 从与您的技术栈匹配的最简单示例开始，然后逐步学习更复杂的场景。每个示例都基于前一个示例的概念构建！

**下一步**: 
- 选择与您的技能水平匹配的示例
- 按照示例的 README 中的设置说明操作
- 尝试自定义
- 与社区分享您的学习成果

---

**导航**
- **上一课**: [学习指南](../resources/study-guide.md)
- **返回**: [主 README](../README.md)

---

**免责声明**：  
本文档使用AI翻译服务[Co-op Translator](https://github.com/Azure/co-op-translator)进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于关键信息，建议使用专业人工翻译。我们不对因使用此翻译而产生的任何误解或误读承担责任。