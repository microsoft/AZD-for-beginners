<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8875403d56140e04c0524bed9b788f7a",
  "translation_date": "2025-11-19T09:36:35+00:00",
  "source_file": "examples/README.md",
  "language_code": "zh"
}
-->
# 示例 - 实用的AZD模板和配置

**通过示例学习 - 按章节组织**
- **📚 课程主页**: [AZD入门](../README.md)
- **📖 章节映射**: 示例按学习复杂度组织
- **🚀 本地示例**: [零售多代理解决方案](retail-scenario.md)
- **🤖 外部AI示例**: 链接到Azure Samples仓库

> **📍 重要提示: 本地与外部示例**  
> 此仓库包含**1个完整的本地示例**（零售多代理）及其完整实现。  
> 其他示例为**外部参考**，链接到Azure-Samples仓库，可供克隆使用。

## 简介

此目录提供实用示例和参考资料，帮助您通过实践学习Azure Developer CLI。零售多代理场景是一个完整的生产级实现，包含在此仓库中。其他示例引用官方Azure Samples，展示各种AZD模式。

## 🎯 此仓库的内容

### ✅ 本地实现（可直接使用）

#### [零售多代理解决方案](retail-scenario.md) 🆕  
**此仓库中包含的完整生产级实现**

- **位置**: `examples/retail-multiagent-arm-template/`
- **复杂度**: ⭐⭐⭐⭐（高级）
- **包含内容**:
  - 完整的ARM部署模板
  - 多代理架构（客户+库存）
  - Azure OpenAI集成
  - 基于RAG的AI搜索
  - 全面的监控
  - 一键部署脚本

**快速开始**:  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**技术**: Azure OpenAI、AI搜索、容器应用、Cosmos DB、应用洞察

---

## 🔗 外部Azure示例（克隆使用）

以下示例由官方Azure-Samples仓库维护。克隆后可探索不同的AZD模式：

### 简单应用（章节1-2）

| 模板 | 仓库 | 复杂度 | 服务 |
|:-----|:-----|:-------|:-----|
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express、Cosmos DB、容器应用 |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | 静态Web应用、Functions、SQL |
| **Python Flask容器** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python、容器应用、API |

**使用方法**:  
```bash
# Clone any example
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Deploy
azd up
```
  

### AI应用示例（章节2、5、8）

| 模板 | 仓库 | 复杂度 | 重点 |
|:-----|:-----|:-------|:-----|
| **AI聊天快速入门** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | 基础AI聊天 |
| **AI代理** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | 代理框架 |
| **搜索+OpenAI演示** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG模式 |
| **Contoso聊天** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | 企业AI |

### 数据库与高级模式（章节3-8）

| 模板 | 仓库 | 复杂度 | 重点 |
|:-----|:-----|:-------|:-----|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | 数据库集成 |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | 无服务器NoSQL |
| **Java微服务** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | 多服务 |
| **ML管道** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## 学习目标

通过这些示例，您将能够：
- 使用真实应用场景练习Azure Developer CLI工作流
- 理解不同应用架构及其AZD实现
- 掌握针对各种Azure服务的基础设施即代码模式
- 应用配置管理和环境特定的部署策略
- 在实际场景中实施监控、安全和扩展模式
- 积累解决问题和调试真实部署场景的经验

## 学习成果

完成这些示例后，您将能够：
- 自信地使用Azure Developer CLI部署各种应用类型
- 根据自己的应用需求调整提供的模板
- 使用Bicep设计和实现自定义基础设施模式
- 配置具有正确依赖关系的复杂多服务应用
- 在真实场景中应用安全、监控和性能最佳实践
- 根据实践经验排查和优化部署

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
1. **[简单Web应用 - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - 部署一个带MongoDB的Node.js Express Web应用
2. **[静态网站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - 使用Azure静态Web应用托管React静态网站
3. **[容器应用 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - 部署容器化的Python Flask应用

### 中级用户
4. **[数据库应用 - C#与Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - 使用C# API和Azure SQL数据库的Web应用
5. **[无服务器函数 - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - 带HTTP触发器和Cosmos DB的Python Azure Functions
6. **[微服务 - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - 使用容器应用和API网关的多服务Java应用

### Azure AI Foundry模板

1. **[Azure OpenAI聊天应用](https://github.com/Azure-Samples/azure-search-openai-demo)** - 使用Azure OpenAI的智能聊天应用
2. **[AI文档处理](https://github.com/Azure-Samples/azure-ai-document-processing)** - 使用Azure AI服务进行文档分析
3. **[机器学习管道](https://github.com/Azure-Samples/mlops-v2)** - 使用Azure机器学习的MLOps工作流

### 真实场景

#### **零售多代理解决方案** 🆕  
**[完整实现指南](./retail-scenario.md)**  

一个全面的生产级多代理客户支持解决方案，展示了使用AZD部署企业级AI应用的能力。此场景提供：

- **完整架构**: 专业化客户服务和库存管理代理的多代理系统
- **生产基础设施**: 多区域Azure OpenAI部署、AI搜索、容器应用和全面监控
- **可直接部署的ARM模板**: 一键部署，支持多种配置模式（最小/标准/高级）
- **高级功能**: 红队安全验证、代理评估框架、成本优化和故障排除指南
- **真实业务场景**: 零售商客户支持用例，支持文件上传、搜索集成和动态扩展

**技术**: Azure OpenAI（GPT-4o、GPT-4o-mini）、Azure AI搜索、容器应用、Cosmos DB、应用洞察、文档智能、Bing搜索API  
**复杂度**: ⭐⭐⭐⭐（高级 - 企业生产级）  
**适合对象**: AI开发者、解决方案架构师及构建生产级多代理系统的团队  
**快速开始**: 使用包含的ARM模板，通过`./deploy.sh -g myResourceGroup`在30分钟内部署完整解决方案  

## 📋 使用说明

### 本地运行示例

1. **克隆或复制示例**  
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```
  
2. **初始化AZD环境**  
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
- **azure.yaml** - 带注释的AZD配置
- **infra/** - 带参数说明的Bicep模板
- **src/** - 示例应用代码
- **scripts/** - 常用任务的辅助脚本

## 🎯 学习目标

### 示例分类

#### **基础部署**
- 单服务应用
- 简单基础设施模式
- 基础配置管理
- 成本效益高的开发设置

#### **高级场景**
- 多服务架构
- 复杂网络配置
- 数据库集成模式
- 安全与合规实现

#### **生产级模式**
- 高可用性配置
- 监控与可观测性
- CI/CD集成
- 灾难恢复设置

## 📖 示例描述

### 简单Web应用 - Node.js Express  
**技术**: Node.js、Express、MongoDB、容器应用  
**复杂度**: 初学者  
**概念**: 基础部署、REST API、NoSQL数据库集成  

### 静态网站 - React SPA  
**技术**: React、Azure静态Web应用、Azure Functions、Cosmos DB  
**复杂度**: 初学者  
**概念**: 静态托管、无服务器后端、现代Web开发  

### 容器应用 - Python Flask  
**技术**: Python Flask、Docker、容器应用、容器注册表  
**复杂度**: 初学者  
**概念**: 容器化、微服务架构、API开发  

### 数据库应用 - C#与Azure SQL  
**技术**: C# ASP.NET Core、Azure SQL数据库、应用服务  
**复杂度**: 中级  
**概念**: 实体框架、数据库连接、Web API开发  

### 无服务器函数 - Python Azure Functions  
**技术**: Python、Azure Functions、Cosmos DB、静态Web应用  
**复杂度**: 中级  
**概念**: 事件驱动架构、无服务器计算、全栈开发  

### 微服务 - Java Spring Boot  
**技术**: Java Spring Boot、容器应用、服务总线、API网关  
**复杂度**: 中级  
**概念**: 微服务通信、分布式系统、企业模式  

### Azure AI Foundry示例

#### Azure OpenAI聊天应用  
**技术**: Azure OpenAI、认知搜索、应用服务  
**复杂度**: 中级  
**概念**: RAG架构、向量搜索、LLM集成  

#### AI文档处理  
**技术**: Azure AI文档智能、存储、Functions  
**复杂度**: 中级  
**概念**: 文档分析、OCR、数据提取  

#### 机器学习管道  
**技术**: Azure ML、MLOps、容器注册表  
**复杂度**: 高级  
**概念**: 模型训练、部署管道、监控  

## 🛠 配置示例

`configurations/`目录包含可重用组件：

### 环境配置
- 开发环境设置
- 预生产环境配置
- 生产级配置
- 多区域部署设置  

### Bicep模块
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
   - 检查Azure服务要求  
   - 验证订阅限制  
   - 理解成本影响  

2. **修改配置**  
   - 更新`azure.yaml`服务定义  
   - 自定义Bicep模板  
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
| Python Flask容器 | 2 | ❌ | 基础 | 完整 | ⭐ |
| C# Web API + SQL | 2 | ✅ | 完整 | 完整 | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | 完整 | 完整 | ⭐⭐ |
| Java微服务 | 5+ | ✅ | 完整 | 完整 | ⭐⭐ |
| Azure OpenAI聊天 | 3 | ✅ | 完整 | 完整 | ⭐⭐⭐ |
| AI文档处理 | 2 | ❌ | 基础 | 完整 | ⭐⭐ |
| ML流水线 | 4+ | ✅ | 完整 | 完整 | ⭐⭐⭐⭐ |
| **零售多代理** | **8+** | **✅** | **企业级** | **高级** | **⭐⭐⭐⭐** |

## 🎓 学习路径

### 推荐进度

1. **从简单的Web应用开始**
   - 学习基本的AZD概念
   - 了解部署工作流程
   - 练习环境管理

2. **尝试静态网站**
   - 探索不同的托管选项
   - 学习CDN集成
   - 了解DNS配置

3. **转向容器应用**
   - 学习容器化基础知识
   - 了解扩展概念
   - 使用Docker进行练习

4. **添加数据库集成**
   - 学习数据库配置
   - 了解连接字符串
   - 练习密钥管理

5. **探索无服务器架构**
   - 了解事件驱动架构
   - 学习触发器和绑定
   - 使用API进行练习

6. **构建微服务**
   - 学习服务间通信
   - 了解分布式系统
   - 练习复杂部署

## 🔍 寻找合适的示例

### 按技术栈分类
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask容器应用, Python Functions + SPA
- **C#**: C# Web API + SQL数据库, Azure OpenAI聊天应用, ML流水线
- **Java**: Java Spring Boot微服务
- **React**: React SPA + Functions
- **容器**: Python Flask容器应用, Java微服务
- **数据库**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI聊天应用, AI文档处理, ML流水线, **零售多代理解决方案**
- **多代理系统**: **零售多代理解决方案**
- **企业级生产**: **零售多代理解决方案**

### 按架构模式分类
- **单体架构**: Node.js Express Todo, C# Web API + SQL
- **静态 + 无服务器**: React SPA + Functions, Python Functions + SPA
- **微服务**: Java Spring Boot微服务
- **容器化**: Python Flask容器应用
- **AI驱动**: Azure OpenAI聊天应用, AI文档处理, ML流水线, **零售多代理解决方案**
- **多代理架构**: **零售多代理解决方案**
- **企业级多服务**: **零售多代理解决方案**

### 按复杂度分类
- **初学者**: Node.js Express Todo, React SPA + Functions, Python Flask容器应用
- **中级**: C# Web API + SQL, Python Functions + SPA, Java微服务, Azure OpenAI聊天应用, AI文档处理
- **高级**: ML流水线
- **企业级生产就绪**: **零售多代理解决方案**（完整的多代理系统，带ARM模板部署）

## 📚 额外资源

### 文档链接
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD模板](https://github.com/Azure/ai-foundry-templates)
- [Bicep文档](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure架构中心](https://learn.microsoft.com/en-us/azure/architecture/)

### 社区示例
- [Azure Samples AZD模板](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry模板](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI画廊](https://azure.github.io/awesome-azd/)
- [使用C#和Azure SQL的Todo应用](https://github.com/Azure-Samples/todo-csharp-sql)
- [使用Python和MongoDB的Todo应用](https://github.com/Azure-Samples/todo-python-mongo)
- [使用Node.js和PostgreSQL的Todo应用](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web应用与C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure容器应用作业](https://github.com/Azure-Samples/container-apps-jobs)
- [使用Java的Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### 最佳实践
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [云采用框架](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 贡献示例

有有用的示例分享吗？我们欢迎您的贡献！

### 提交指南
1. 遵循既定的目录结构
2. 包含全面的README.md
3. 在配置文件中添加注释
4. 提交前进行充分测试
5. 包括成本估算和前提条件

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

**专业提示**: 从最简单的与您的技术栈匹配的示例开始，然后逐步学习更复杂的场景。每个示例都基于前一个示例的概念进行构建！

**下一步**: 
- 选择与您的技能水平匹配的示例
- 按照示例README中的设置说明操作
- 尝试进行自定义
- 与社区分享您的学习成果

---

**导航**
- **上一课**: [学习指南](../resources/study-guide.md)
- **返回**: [主README](../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：  
本文档使用AI翻译服务[Co-op Translator](https://github.com/Azure/co-op-translator)进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用此翻译而产生的任何误解或误读不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->