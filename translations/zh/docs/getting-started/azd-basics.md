<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c9095103b04dc9504096cf2814d0e634",
  "translation_date": "2025-09-09T16:53:47+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "zh"
}
-->
# AZD 基础知识 - 了解 Azure Developer CLI

## 介绍

本课程将向您介绍 Azure Developer CLI (azd)，这是一款强大的命令行工具，可以加速从本地开发到 Azure 部署的过程。您将学习基本概念、核心功能，并了解 azd 如何简化云原生应用的部署。

## 学习目标

完成本课程后，您将能够：
- 了解 Azure Developer CLI 是什么及其主要用途
- 学习模板、环境和服务的核心概念
- 探索包括基于模板开发和基础设施即代码在内的关键功能
- 理解 azd 项目结构和工作流程
- 为安装和配置 azd 做好准备，以适应您的开发环境

## 学习成果

完成本课程后，您将能够：
- 解释 azd 在现代云开发工作流程中的角色
- 识别 azd 项目结构的组成部分
- 描述模板、环境和服务如何协同工作
- 理解使用 azd 的基础设施即代码的优势
- 了解不同 azd 命令及其用途

## 什么是 Azure Developer CLI (azd)?

Azure Developer CLI (azd) 是一个命令行工具，旨在加速从本地开发到 Azure 部署的过程。它简化了在 Azure 上构建、部署和管理云原生应用的流程。

## 核心概念

### 模板
模板是 azd 的基础。它包含：
- **应用代码** - 您的源代码和依赖项
- **基础设施定义** - 使用 Bicep 或 Terraform 定义的 Azure 资源
- **配置文件** - 设置和环境变量
- **部署脚本** - 自动化部署工作流

### 环境
环境代表不同的部署目标：
- **开发环境** - 用于测试和开发
- **预生产环境** - 准生产环境
- **生产环境** - 实际生产环境

每个环境都有自己的：
- Azure 资源组
- 配置设置
- 部署状态

### 服务
服务是应用的构建模块：
- **前端** - Web 应用、单页应用
- **后端** - API、微服务
- **数据库** - 数据存储解决方案
- **存储** - 文件和 Blob 存储

## 关键功能

### 1. 基于模板的开发
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. 基础设施即代码
- **Bicep** - Azure 的领域专用语言
- **Terraform** - 多云基础设施工具
- **ARM 模板** - Azure 资源管理器模板

### 3. 集成工作流
```bash
# Complete deployment workflow
azd up            # Provision + Deploy
azd provision     # Create Azure resources
azd deploy        # Deploy application code
azd down          # Clean up resources
```

### 4. 环境管理
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 项目结构

一个典型的 azd 项目结构：
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 配置文件

### azure.yaml
主要的项目配置文件：
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
特定环境的配置：
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 常见工作流

### 开始一个新项目
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### 开发周期
```bash
# Set up development environment
azd auth login
azd env new dev
azd env select dev

# Deploy everything
azd up

# Make changes and redeploy
azd deploy

# Clean up when done
azd down --force --purge
```

### 管理多个环境
```bash
# Create staging environment
azd env new staging
azd env select staging
azd up

# Switch back to dev
azd env select dev

# Compare environments
azd env list
```

## 🧭 导航命令

### 发现
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### 项目管理
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### 监控
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## 最佳实践

### 1. 使用有意义的命名
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. 利用模板
- 从现有模板开始
- 根据需求进行定制
- 为您的组织创建可重用的模板

### 3. 环境隔离
- 为开发/预生产/生产使用独立的环境
- 切勿直接从本地机器部署到生产环境
- 使用 CI/CD 管道进行生产环境部署

### 4. 配置管理
- 使用环境变量存储敏感数据
- 将配置保存在版本控制中
- 记录环境特定的设置

## 学习进度

### 初级（第 1-2 周）
1. 安装 azd 并进行身份验证
2. 部署一个简单的模板
3. 理解项目结构
4. 学习基本命令（up, down, deploy）

### 中级（第 3-4 周）
1. 定制模板
2. 管理多个环境
3. 理解基础设施代码
4. 设置 CI/CD 管道

### 高级（第 5 周及以后）
1. 创建自定义模板
2. 高级基础设施模式
3. 多区域部署
4. 企业级配置

## 下一步

- [安装与设置](installation.md) - 安装和配置 azd
- [您的第一个项目](first-project.md) - 实践教程
- [配置指南](configuration.md) - 高级配置选项

## 其他资源

- [Azure Developer CLI 概述](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [模板库](https://azure.github.io/awesome-azd/)
- [社区示例](https://github.com/Azure-Samples)

---

**导航**
- **上一课**: [README](../../README.md)
- **下一课**: [安装与设置](installation.md)

---

**免责声明**：  
本文档使用AI翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于关键信息，建议使用专业人工翻译。我们不对因使用此翻译而产生的任何误解或误读承担责任。