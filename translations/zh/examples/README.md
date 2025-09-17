<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-17T12:41:04+00:00",
  "source_file": "examples/README.md",
  "language_code": "zh"
}
-->
# 示例 - 实用的 AZD 模板和配置

**通过示例学习 - 按章节组织**
- **📚 课程主页**: [AZD 初学者指南](../README.md)
- **📖 章节映射**: 按学习复杂度组织的示例
- **🚀 从简单开始**: [第 1 章示例](../../../examples)
- **🤖 AI 示例**: [第 2 & 5 章 AI 解决方案](../../../examples)

## 简介

此目录包含实用示例、模板和真实场景，帮助您通过动手实践学习 Azure Developer CLI。每个示例都提供完整的工作代码、基础设施模板以及针对不同应用架构和部署模式的详细说明。

## 学习目标

通过完成这些示例，您将能够：
- 在真实应用场景中练习 Azure Developer CLI 工作流
- 理解不同应用架构及其 AZD 实现方式
- 掌握针对各种 Azure 服务的基础设施即代码模式
- 应用配置管理和环境特定的部署策略
- 在实际场景中实施监控、安全和扩展模式
- 积累解决问题和调试真实部署场景的经验

## 学习成果

完成这些示例后，您将能够：
- 自信地使用 Azure Developer CLI 部署各种应用类型
- 根据自己的应用需求调整提供的模板
- 使用 Bicep 设计和实现自定义基础设施模式
- 配置具有正确依赖关系的复杂多服务应用
- 在实际场景中应用安全、监控和性能最佳实践
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

### 初学者
1. **[简单 Web 应用 - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - 部署一个带有 MongoDB 的 Node.js Express Web 应用
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

### 真实场景

#### **零售多代理解决方案** 🆕
**[完整实施指南](./retail-scenario.md)**

一个全面的、生产级的多代理客户支持解决方案，展示了使用 AZD 部署企业级 AI 应用的能力。此场景提供：

- **完整架构**: 包含专业客户服务和库存管理代理的多代理系统
- **生产基础设施**: 多区域 Azure OpenAI 部署、AI 搜索、容器应用和全面监控
- **可部署 ARM 模板**: 一键部署，支持多种配置模式（最小/标准/高级）
- **高级功能**: 红队安全验证、代理评估框架、成本优化和故障排除指南
- **真实业务场景**: 零售商客户支持用例，支持文件上传、搜索集成和动态扩展

**技术**: Azure OpenAI (GPT-4o, GPT-4o-mini)、Azure AI 搜索、容器应用、Cosmos DB、应用洞察、文档智能、Bing 搜索 API

**复杂度**: ⭐⭐⭐⭐（高级 - 企业生产级）

**适合对象**: AI 开发者、解决方案架构师以及构建生产多代理系统的团队

**快速开始**: 使用包含的 ARM 模板，通过 `./deploy.sh -g myResourceGroup` 在 30 分钟内部署完整解决方案

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
- 安全和合规实施

#### **生产级模式**
- 高可用性配置
- 监控和可观察性
- CI/CD 集成
- 灾难恢复设置

## 📖 示例描述

### 简单 Web 应用 - Node.js Express
**技术**: Node.js, Express, MongoDB, 容器应用  
**复杂度**: 初学者  
**概念**: 基础部署、REST API、NoSQL 数据库集成

### 静态网站 - React SPA
**技术**: React, Azure 静态 Web 应用, Azure Functions, Cosmos DB  
**复杂度**: 初学者  
**概念**: 静态托管、无服务器后端、现代 Web 开发

### 容器应用 - Python Flask
**技术**: Python Flask, Docker, 容器应用, 容器注册表  
**复杂度**: 初学者  
**概念**: 容器化、微服务架构、API 开发

### 数据库应用 - C# 和 Azure SQL
**技术**: C# ASP.NET Core, Azure SQL 数据库, 应用服务  
**复杂度**: 中级  
**概念**: 实体框架、数据库连接、Web API 开发

### 无服务器函数 - Python Azure Functions
**技术**: Python, Azure Functions, Cosmos DB, 静态 Web 应用  
**复杂度**: 中级  
**概念**: 事件驱动架构、无服务器计算、全栈开发

### 微服务 - Java Spring Boot
**技术**: Java Spring Boot, 容器应用, 服务总线, API 网关  
**复杂度**: 中级  
**概念**: 微服务通信、分布式系统、企业模式

### Azure AI Foundry 示例

#### Azure OpenAI 聊天应用
**技术**: Azure OpenAI, 认知搜索, 应用服务  
**复杂度**: 中级  
**概念**: RAG 架构、向量搜索、LLM 集成

#### AI 文档处理
**技术**: Azure AI 文档智能, 存储, Functions  
**复杂度**: 中级  
**概念**: 文档分析、OCR、数据提取

#### 机器学习管道
**技术**: Azure ML, MLOps, 容器注册表  
**复杂度**: 高级  
**概念**: 模型训练、部署管道、监控

## 🛠 配置示例

`configurations/` 目录包含可重用组件：

### 环境配置
- 开发环境设置
- 预生产环境配置
- 生产级配置
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

1. **检查先决条件**
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
   - 测试扩展和性能

4. **安全审查**
   - 审查访问控制
   - 实施秘密管理
   - 启用监控和警报

## 📊 对比矩阵

| 示例 | 服务 | 数据库 | 认证 | 监控 | 复杂度 |
|------|------|--------|------|------|--------|
| Node.js Express Todo | 2 | ✅ | 基础 | 基础 | ⭐ |
| React SPA + Functions | 3 | ✅ | 基础 | 完整 | ⭐ |
| Python Flask 容器 | 2 | ❌ | 基础 | 完整 | ⭐ |
| C# Web API + SQL | 2 | ✅ | 完整 | 完整 | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | 完整 | 完整 | ⭐⭐ |
| Java 微服务 | 5+ | ✅ | 完整 | 完整 | ⭐⭐ |
| Azure OpenAI 聊天 | 3 | ✅ | 完整 | 完整 | ⭐⭐⭐ |
| AI 文档处理 | 2 | ❌ | 基础 | 完整 | ⭐⭐ |
| ML 管道 | 4+ | ✅ | 完整 | 完整 | ⭐⭐⭐⭐ |
| **零售多代理** | **8+** | **✅** | **企业级** | **高级** | **⭐⭐⭐⭐** |

## 🎓 学习路径

### 推荐进度

1. **从简单 Web 应用开始**
   - 学习 AZD 基本概念
   - 理解部署工作流
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
   - 练习 API 开发

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
- **AI/ML**: Azure OpenAI 聊天应用, AI 文档处理, ML 管道, **零售多代理解决方案**
- **多代理系统**: **零售多代理解决方案**
- **企业生产级**: **零售多代理解决方案**

### 按架构模式
- **单体架构**: Node.js Express Todo, C# Web API + SQL
- **静态 + 无服务器**: React SPA + Functions, Python Functions + SPA
- **微服务架构**: Java Spring Boot 微服务
- **容器化**: Python Flask 容器应用
- **AI 驱动**: Azure OpenAI 聊天应用, AI 文档处理, ML 管道, **零售多代理解决方案**
- **多代理架构**: **零售多代理解决方案**
- **企业多服务**: **零售多代理解决方案**

### 按复杂度级别
- **初学者**: Node.js Express Todo, React SPA + Functions, Python Flask 容器应用
- **中级**: C# Web API + SQL, Python Functions + SPA, Java 微服务, Azure OpenAI 聊天应用, AI 文档处理
- **高级**: ML 管道
- **企业生产级**: **零售多代理解决方案**（完整的多代理系统，支持 ARM 模板部署）

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
- [使用 C# 和 Azure SQL 的待办事项应用](https://github.com/Azure-Samples/todo-csharp-sql)  
- [使用 Python 和 MongoDB 的待办事项应用](https://github.com/Azure-Samples/todo-python-mongo)  
- [使用 Node.js 和 PostgreSQL 的待办事项应用](https://github.com/Azure-Samples/todo-nodejs-mongo)  
- [使用 C# API 的 React Web 应用](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)  
- [Azure 容器应用任务](https://github.com/Azure-Samples/container-apps-jobs)  
- [使用 Java 的 Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)  

### 最佳实践
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)  

## 🤝 贡献示例

有有用的示例想要分享吗？我们欢迎您的贡献！

### 提交指南
1. 遵循既定的目录结构  
2. 包含完整的 README.md 文件  
3. 在配置文件中添加注释  
4. 在提交之前进行充分测试  
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

**小提示**：从最简单的、与您的技术栈匹配的示例开始，然后逐步尝试更复杂的场景。每个示例都基于前一个示例的概念进行扩展！

**下一步**：  
- 选择一个与您的技能水平匹配的示例  
- 按照示例 README 中的设置说明操作  
- 尝试进行自定义  
- 与社区分享您的学习成果  

---

**导航**  
- **上一课**: [学习指南](../resources/study-guide.md)  
- **返回**: [主 README](../README.md)  

---

**免责声明**：  
本文档使用AI翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于关键信息，建议使用专业人工翻译。我们不对因使用此翻译而产生的任何误解或误读承担责任。