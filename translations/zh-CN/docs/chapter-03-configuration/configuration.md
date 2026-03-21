# 配置指南

**章节导航:**
- **📚 课程主页**: [AZD 初学者](../../README.md)
- **📖 当前章节**: 第3章 - 配置与身份验证
- **⬅️ 上一个**: [你的第一个项目](first-project.md)
- **➡️ 下一个**: [部署指南](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 下一章**: [第4章：基础设施即代码](../chapter-04-infrastructure/deployment-guide.md)

## 简介

本综合指南涵盖了配置 Azure Developer CLI 以实现最佳开发和部署工作流的各个方面。您将了解配置层级、环境管理、身份验证方法以及支持高效且安全的 Azure 部署的高级配置模式。

## 学习目标

完成本课后，您将能够：
- 掌握 azd 的配置层级并理解设置的优先级
- 有效配置全局和项目特定的设置
- 管理具有不同配置的多个环境
- 实现安全的身份验证和授权模式
- 了解复杂场景的高级配置模式

## 学习成果

完成本课后，您将能够：
- 为最佳开发工作流配置 azd
- 设置并管理多个部署环境
- 实施安全的配置管理实践
- 排查与配置相关的问题
- 根据特定组织需求自定义 azd 行为

本综合指南涵盖了配置 Azure Developer CLI 以实现最佳开发和部署工作流的各个方面。

## 了解 azd 项目中的 AI 代理

如果您对 AI 代理不熟悉，以下是一个在 azd 世界中理解它们的简单方式。

### 代理是什么？

代理是一段可以接收请求、进行推理并采取行动的软件——通常通过调用 AI 模型、检索数据或调用其他服务来实现。在 azd 项目中，代理只是与您的 Web 前端或 API 后端并列的另一个 <strong>服务</strong>。

### 代理如何融入 azd 项目结构

azd 项目由三层组成：**infrastructure**、**code** 和 **configuration**。代理以与其他服务相同的方式接入这些层：

| 层 | 对传统应用的作用 | 对代理的作用 |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | 提供 Web 应用和数据库 | 提供 AI 模型端点、搜索索引或代理主机 |
| **Code** (`src/`) | 包含您的前端和 API 源代码 | 包含您的代理逻辑和提示定义 |
| **Configuration** (`azure.yaml`) | 列出您的服务及其托管目标 | 将代理列为服务，指向其代码和主机 |

### `azure.yaml` 的作用

您现在不需要记住语法。从概念上讲，`azure.yaml` 是告诉 azd 的文件：*“这是构成我应用的服务，以及在哪里可以找到它们的代码。”*

当您的项目包含 AI 代理时，`azure.yaml` 只需将该代理列为服务之一。azd 随后就知道要配置正确的基础设施（例如 Microsoft Foundry Models 端点或用于托管代理的 Container App）并部署您的代理代码——就像它对 Web 应用或 API 所做的那样。

这意味着没有本质上的新内容要学习。如果您了解 azd 如何管理 Web 服务，那么您已经了解它如何管理代理。

## 配置层级

azd 使用分层配置系统：
1. <strong>命令行标志</strong>（最高优先级）
2. <strong>环境变量</strong>
3. <strong>本地项目配置</strong> (`.azd/config.json`)
4. <strong>全局用户配置</strong> (`~/.azd/config.json`)
5. <strong>默认值</strong>（最低优先级）

## 全局配置

### 设置全局默认值
```bash
# 设置默认订阅
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# 设置默认位置
azd config set defaults.location "eastus2"

# 设置默认资源组命名约定
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# 查看所有全局配置
azd config list

# 删除配置
azd config unset defaults.location
```

### 常见的全局设置
```bash
# 开发偏好
azd config set alpha.enable true                    # 启用 alpha 功能
azd config set telemetry.enabled false             # 禁用遥测
azd config set output.format json                  # 设置输出格式

# 安全设置
azd config set auth.useAzureCliCredential true     # 使用 Azure CLI 进行身份验证
azd config set tls.insecure false                  # 强制 TLS 验证

# 性能调优
azd config set provision.parallelism 5             # 并行创建资源
azd config set deploy.timeout 30m                  # 部署超时
```

## 🏗️ 项目配置

### `azure.yaml` 结构
`azure.yaml` 文件是您 azd 项目的核心：

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0
  templateBranch: main

# Service definitions
services:
  # Frontend service
  web:
    project: ./src/web              # Source code location
    language: js                    # Programming language
    host: appservice               # Azure service type
    dist: dist                     # Build output directory
    
  # Backend API service  
  api:
    project: ./src/api
    language: python
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
    
  # Database service
  database:
    project: ./src/db
    host: postgres
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location
  parameters:
    environmentName: ${AZURE_ENV_NAME}
    location: ${AZURE_LOCATION}

# Deployment hooks
hooks:
  preprovision:                    # Before infrastructure deployment
    shell: sh
    run: |
      echo "Preparing infrastructure..."
      ./scripts/validate-config.sh
      
  postprovision:                   # After infrastructure deployment
    shell: pwsh
    run: |
      Write-Host "Infrastructure deployed successfully"
      ./scripts/setup-database.ps1
      
  predeploy:                       # Before application deployment
    shell: sh
    run: |
      echo "Building application..."
      npm run build
      
  postdeploy:                      # After application deployment
    shell: sh
    run: |
      echo "Running post-deployment tests..."
      npm run test:integration

# Pipeline configuration
pipeline:
  provider: github                 # CI/CD provider
  variables:
    - AZURE_CLIENT_ID
    - AZURE_TENANT_ID
  secrets:
    - AZURE_CLIENT_SECRET
```

### 服务配置选项

#### 主机类型
```yaml
services:
  web-static:
    host: staticwebapp           # Azure Static Web Apps
    
  web-dynamic:
    host: appservice            # Azure App Service
    
  api-containers:
    host: containerapp          # Azure Container Apps
    
  api-functions:
    host: function              # Azure Functions
    
  api-spring:
    host: springapp             # Azure Spring Apps
```

#### 特定语言的设置
```yaml
services:
  node-app:
    language: js
    buildCommand: npm run build
    startCommand: npm start
    
  python-app:
    language: python
    buildCommand: pip install -r requirements.txt
    startCommand: gunicorn app:app
    
  dotnet-app:
    language: csharp
    buildCommand: dotnet build
    startCommand: dotnet run
    
  java-app:
    language: java
    buildCommand: mvn clean package
    startCommand: java -jar target/app.jar
```

## 🌟 环境管理

### 创建环境
```bash
# 创建一个新环境
azd env new development

# 在特定位置创建
azd env new staging --location "westus2"

# 从模板创建
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### 环境配置
每个环境在 `.azure/<env-name>/config.json` 中有自己的配置：

```json
{
  "version": 1,
  "environmentName": "development",
  "subscriptionId": "12345678-1234-1234-1234-123456789abc",
  "location": "eastus2",
  "resourceGroupName": "rg-myapp-dev-eastus2",
  "services": {
    "web": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.Web/sites/web-abc123",
      "endpoints": ["https://web-abc123.azurewebsites.net"]
    },
    "api": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.App/containerApps/api-def456",
      "endpoints": ["https://api-def456.azurecontainerapps.io"]
    }
  }
}
```

### 环境变量
```bash
# 设置特定于环境的变量
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# 查看环境变量
azd env get-values

# 预期输出:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# 删除环境变量
azd env unset DEBUG

# 验证已删除
azd env get-values | grep DEBUG
# (应不返回任何内容)
```

### 环境模板
创建 `.azure/env.template` 以实现一致的环境设置：
```bash
# 必需的变量
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# 应用设置
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# 可选的开发设置
DEBUG=false
LOG_LEVEL=info
```

## 🔐 身份验证配置

### Azure CLI 集成
```bash
# 使用 Azure CLI 凭据（默认）
azd config set auth.useAzureCliCredential true

# 使用特定租户登录
az login --tenant <tenant-id>

# 设置默认订阅
az account set --subscription <subscription-id>
```

### 服务主体身份验证
适用于 CI/CD 管道：
```bash
# 设置环境变量
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# 或直接配置
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### 托管身份
适用于 Azure 托管的环境：
```bash
# 启用托管标识身份验证
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ 基础设施配置

### Bicep 参数
在 `infra/main.parameters.json` 中配置基础设施参数：
```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSkuName": {
      "value": "B1"
    },
    "databaseSkuName": {
      "value": "Standard_B1ms"
    }
  }
}
```

### Terraform 配置
对于 Terraform 项目，在 `infra/terraform.tfvars` 中配置：
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 部署配置

### 构建配置
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    language: js
    buildCommand: npm run build:prod
    buildEnvironment:
      NODE_ENV: production
      REACT_APP_API_URL: ${API_URL}
    dist: build
    
  api:
    project: ./src/api
    language: python
    buildCommand: |
      pip install -r requirements.txt
      python -m pytest tests/
    buildEnvironment:
      PYTHONPATH: src
```

### Docker 配置
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        NODE_ENV: production
        API_VERSION: v1.0.0
```
示例 `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 高级配置

### 自定义资源命名
```bash
# 设置命名约定
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### 网络配置
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### 监控配置
```yaml
# In azure.yaml
monitoring:
  applicationInsights:
    enabled: true
    samplingPercentage: 100
  logAnalytics:
    enabled: true
    retentionDays: 30
```

## 🎯 环境特定配置

### 开发环境
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### 暂存环境
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### 生产环境
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 配置验证

### 验证配置
```bash
# 检查配置语法
azd config validate

# 测试环境变量
azd env get-values

# 验证基础设施
azd provision --dry-run
```

### 配置脚本
在 `scripts/` 中创建验证脚本：

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# 检查必需的环境变量
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# 验证 azure.yaml 的语法
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 最佳实践

### 1. 使用环境变量
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. 组织配置文件
```
.azure/
├── config.json              # Global project config
├── env.template             # Environment template
├── development/
│   ├── config.json         # Dev environment config
│   └── .env                # Dev environment variables
├── staging/
│   ├── config.json         # Staging environment config
│   └── .env                # Staging environment variables
└── production/
    ├── config.json         # Production environment config
    └── .env                # Production environment variables
```

### 3. 版本控制注意事项
```bash
# .gitignore
.azure/*/config.json         # 环境配置 (包含资源 ID)
.azure/*/.env               # 环境变量 (可能包含机密)
.env                        # 本地环境文件
```

### 4. 配置文档
在 `CONFIG.md` 中记录您的配置：
```markdown
# Configuration Guide

## Required Environment Variables
- `DATABASE_CONNECTION_STRING`: Connection string for the database
- `API_KEY`: API key for external service
- `STORAGE_ACCOUNT_KEY`: Azure Storage account key

## Environment-Specific Settings
- Development: Uses local database, debug logging enabled
- Staging: Uses staging database, info logging
- Production: Uses production database, error logging only
```

## 🎯 实践练习

### 练习 1：多环境配置（15 分钟）

<strong>目标</strong>：创建并配置三个具有不同设置的环境

```bash
# 创建开发环境
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# 创建预发布环境
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# 创建生产环境
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# 验证每个环境
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**成功标准：**
- [ ] 成功创建三个环境
- [ ] 每个环境具有独特的配置
- [ ] 能够无错误地在环境之间切换
- [ ] `azd env list` 显示所有三个环境

### 练习 2：密钥管理（10 分钟）

<strong>目标</strong>：练习带有敏感数据的安全配置

```bash
# 设置机密（不会在输出中显示）
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# 设置非机密配置
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# 查看环境（机密应被掩盖）
azd env get-values

# 验证机密已存储
azd env get DB_PASSWORD  # 应显示实际值
```

**成功标准：**
- [ ] 在存储秘密时不在终端显示
- [ ] `azd env get-values` 显示已遮蔽的秘密
- [ ] 单个 `azd env get <SECRET_NAME>` 检索实际值

## 下一步

- [你的第一个项目](first-project.md) - 在实践中应用配置
- [部署指南](../chapter-04-infrastructure/deployment-guide.md) - 使用配置进行部署
- [资源预配](../chapter-04-infrastructure/provisioning.md) - 生产就绪的配置

## 参考资料

- [azd 配置参考](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml 架构](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [环境变量](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**章节导航:**
- **📚 课程主页**: [AZD 初学者](../../README.md)
- **📖 当前章节**: 第3章 - 配置与身份验证
- **⬅️ 上一个**: [你的第一个项目](first-project.md)
- **➡️ 下一章**: [第4章：基础设施即代码](../chapter-04-infrastructure/deployment-guide.md)
- <strong>下一课</strong>: [你的第一个项目](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**:
本文件已使用 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们致力于准确性，但请注意自动翻译可能包含错误或不准确之处。原始语言的原文应被视为权威来源。对于重要信息，建议使用专业人工翻译。因使用本翻译而产生的任何误解或误读，我们概不负责。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->