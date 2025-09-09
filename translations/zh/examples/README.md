<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9b7074c8a39e77d2f10fb08b3c6ce34f",
  "translation_date": "2025-09-09T17:29:45+00:00",
  "source_file": "examples/README.md",
  "language_code": "zh"
}
-->
# 示例 - 实用的 AZD 模板和配置

## 介绍

此目录包含实用示例、模板和真实场景，帮助您通过动手实践学习 Azure Developer CLI。每个示例都提供完整的工作代码、基础设施模板以及针对不同应用架构和部署模式的详细说明。

## 学习目标

通过完成这些示例，您将能够：
- 在真实应用场景中练习 Azure Developer CLI 的工作流程
- 理解不同应用架构及其 azd 实现方式
- 掌握针对各种 Azure 服务的基础设施即代码模式
- 应用配置管理和环境特定的部署策略
- 在实际场景中实施监控、安全和扩展模式
- 积累解决问题和调试真实部署场景的经验

## 学习成果

完成这些示例后，您将能够：
- 自信地使用 Azure Developer CLI 部署各种应用类型
- 根据自己的应用需求调整提供的模板
- 使用 Bicep 设计和实施自定义基础设施模式
- 配置具有正确依赖关系的复杂多服务应用
- 在实际场景中应用安全、监控和性能最佳实践
- 根据实践经验排查和优化部署问题

## 目录结构

```
examples/
├── simple-web-app/          # Basic web application deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── microservices/           # Multi-service application
│   ├── azure.yaml
│   ├── infra/
│   ├── services/
│   └── README.md
├── database-app/            # Application with database
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── container-app/           # Containerized application
│   ├── azure.yaml
│   ├── infra/
│   ├── Dockerfile
│   ├── src/
│   └── README.md
├── serverless-function/     # Azure Functions example
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── static-website/          # Static website deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## 快速入门示例

### 初学者
1. **[简单 Web 应用](../../../examples/simple-web-app)** - 部署一个基础的 Node.js Web 应用
2. **[静态网站](../../../examples/static-website)** - 在 Azure Storage 上托管静态网站
3. **[容器应用](../../../examples/container-app)** - 部署容器化应用

### 中级用户
4. **[数据库应用](../../../examples/database-app)** - 带有 PostgreSQL 数据库的 Web 应用
5. **[无服务器函数](../../../examples/serverless-function)** - 带有 HTTP 触发器的 Azure Functions
6. **[微服务](../../../examples/microservices)** - 带有 API 网关的多服务应用

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
- **azure.yaml** - 带有注释的 AZD 配置
- **infra/** - 带有参数说明的 Bicep 模板
- **src/** - 示例应用代码
- **scripts/** - 常见任务的辅助脚本

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
- 安全和合规性实施

#### **生产级模式**
- 高可用性配置
- 监控和可观测性
- CI/CD 集成
- 灾难恢复设置

## 📖 示例描述

### 简单 Web 应用
**技术栈**: Node.js, App Service, Application Insights  
**复杂度**: 初学者  
**概念**: 基础部署、环境变量、健康检查

### 静态网站
**技术栈**: HTML/CSS/JS, Storage Account, CDN  
**复杂度**: 初学者  
**概念**: 静态托管、CDN 集成、自定义域名

### 容器应用
**技术栈**: Docker, Container Apps, Container Registry  
**复杂度**: 中级  
**概念**: 容器化、扩展、入口配置

### 数据库应用
**技术栈**: Python Flask, PostgreSQL, App Service  
**复杂度**: 中级  
**概念**: 数据库连接、密钥管理、迁移

### 无服务器函数
**技术栈**: Azure Functions, Cosmos DB, API Management  
**复杂度**: 中级  
**概念**: 事件驱动架构、绑定、API 管理

### 微服务
**技术栈**: 多个服务, Service Bus, API Gateway  
**复杂度**: 高级  
**概念**: 服务通信、消息队列、负载均衡

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

### 根据您的使用场景调整示例

1. **检查先决条件**
   - 检查 Azure 服务要求
   - 验证订阅限制
   - 理解成本影响

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
   - 实施密钥管理
   - 启用监控和警报

## 📊 对比矩阵

| 示例 | 服务 | 数据库 | 认证 | 监控 | 复杂度 |
|------|------|--------|------|------|--------|
| 简单 Web 应用 | 1 | ❌ | 基础 | 基础 | ⭐ |
| 静态网站 | 1 | ❌ | ❌ | 基础 | ⭐ |
| 容器应用 | 1 | ❌ | 基础 | 完整 | ⭐⭐ |
| 数据库应用 | 2 | ✅ | 完整 | 完整 | ⭐⭐⭐ |
| 无服务器函数 | 3 | ✅ | 完整 | 完整 | ⭐⭐⭐ |
| 微服务 | 5+ | ✅ | 完整 | 完整 | ⭐⭐⭐⭐ |

## 🎓 学习路径

### 推荐进度

1. **从简单 Web 应用开始**
   - 学习 AZD 基本概念
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
   - 练习密钥管理

5. **探索无服务器架构**
   - 理解事件驱动架构
   - 学习触发器和绑定
   - 练习使用 API

6. **构建微服务**
   - 学习服务通信
   - 理解分布式系统
   - 练习复杂部署

## 🔍 查找合适的示例

### 按技术栈
- **Node.js**: 简单 Web 应用, 微服务
- **Python**: 数据库应用, 无服务器函数
- **静态网站**: 静态网站
- **容器**: 容器应用, 微服务
- **数据库**: 数据库应用, 无服务器函数

### 按架构模式
- **单体架构**: 简单 Web 应用, 数据库应用
- **静态架构**: 静态网站
- **微服务架构**: 微服务示例
- **无服务器架构**: 无服务器函数
- **混合架构**: 容器应用

### 按复杂度级别
- **初学者**: 简单 Web 应用, 静态网站
- **中级**: 容器应用, 数据库应用, 无服务器函数  
- **高级**: 微服务

## 📚 其他资源

### 文档链接
- [AZD 模板规范](https://aka.ms/azd/templates)
- [Bicep 文档](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure 架构中心](https://learn.microsoft.com/en-us/azure/architecture/)

### 社区示例
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [AZD 模板库](https://azure.github.io/awesome-azd/)

### 最佳实践
- [Azure 良好架构框架](https://learn.microsoft.com/en-us/azure/well-architected/)
- [云采用框架](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 示例贡献

有有用的示例分享吗？我们欢迎您的贡献！

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

**实用提示**: 从与您的技术栈匹配的最简单示例开始，然后逐步学习更复杂的场景。每个示例都基于前一个示例的概念构建！

**下一步**: 
- 选择与您的技能水平匹配的示例
- 按照示例 README 中的设置说明操作
- 尝试自定义
- 与社区分享您的学习成果

---

**导航**
- **上一课**: [学习指南](../resources/study-guide.md)
- **返回**: [主 README](../README.md)

---

**免责声明**：  
本文档使用AI翻译服务[Co-op Translator](https://github.com/Azure/co-op-translator)进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于关键信息，建议使用专业人工翻译。我们不对因使用此翻译而产生的任何误解或误读承担责任。