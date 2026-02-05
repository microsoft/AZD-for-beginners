# 配置指南

**章节导航：**
- **📚 课程主页**：[AZD 初学者指南](../../README.md)
- **📖 当前章节**：第 3 章 - 配置与认证
- **⬅️ 上一章**：[你的第一个项目](first-project.md)
- **➡️ 下一章**：[部署指南](../deployment/deployment-guide.md)
- **🚀 下一章节**：[第 4 章：基础设施即代码](../deployment/deployment-guide.md)

## 简介

本指南全面介绍了如何配置 Azure Developer CLI，以实现最佳的开发和部署工作流。你将学习配置层级、环境管理、认证方法以及高级配置模式，从而实现高效且安全的 Azure 部署。

## 学习目标

通过本节学习，你将能够：
- 掌握 azd 的配置层级并了解设置的优先级
- 有效配置全局和项目特定的设置
- 管理具有不同配置的多个环境
- 实现安全的认证和授权模式
- 理解复杂场景下的高级配置模式

## 学习成果

完成本节后，你将能够：
- 配置 azd 以优化开发工作流
- 设置和管理多个部署环境
- 实现安全的配置管理实践
- 排查与配置相关的问题
- 根据特定组织需求自定义 azd 行为

本指南全面介绍了如何配置 Azure Developer CLI，以实现最佳的开发和部署工作流。

## 配置层级

azd 使用分层的配置系统：
1. **命令行标志**（最高优先级）
2. **环境变量**
3. **本地项目配置**（`.azd/config.json`）
4. **全局用户配置**（`~/.azd/config.json`）
5. **默认值**（最低优先级）

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
azd config set auth.useAzureCliCredential true     # 使用 Azure CLI 进行认证
azd config set tls.insecure false                  # 强制 TLS 验证

# 性能调优
azd config set provision.parallelism 5             # 并行资源创建
azd config set deploy.timeout 30m                  # 部署超时
```

## 🏗️ 项目配置

### azure.yaml 结构
`azure.yaml` 文件是 azd 项目的核心：

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

#### 语言特定设置
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

# 使用特定位置创建
azd env new staging --location "westus2"

# 从模板创建
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### 环境配置
每个环境都有自己的配置文件，位于 `.azure/<env-name>/config.json`：

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
# 设置特定环境的变量
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

# 验证删除
azd env get-values | grep DEBUG
# （应该返回空）
```

### 环境模板
创建 `.azure/env.template` 以实现一致的环境设置：
```bash
# 必需变量
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# 应用设置
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# 可选开发设置
DEBUG=false
LOG_LEVEL=info
```

## 🔐 认证配置

### Azure CLI 集成
```bash
# 使用 Azure CLI 凭据（默认）
azd config set auth.useAzureCliCredential true

# 使用特定租户登录
az login --tenant <tenant-id>

# 设置默认订阅
az account set --subscription <subscription-id>
```

### 服务主体认证
适用于 CI/CD 流水线：
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
适用于 Azure 托管环境：
```bash
# 启用托管身份认证
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
 示例 `Dockerfile`：https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

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

### 预生产环境
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

# 检查所需的环境变量
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# 验证 azure.yaml 语法
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
.azure/*/config.json         # 环境配置（包含资源ID）
.azure/*/.env               # 环境变量（可能包含秘密）
.env                        # 本地环境文件
```

### 4. 配置文档
在 `CONFIG.md` 中记录你的配置：
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

**目标**：创建并配置三个具有不同设置的环境

```bash
# 创建开发环境
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# 创建暂存环境
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
- [ ] 能够在环境之间无错误切换
- [ ] `azd env list` 显示所有三个环境

### 练习 2：密钥管理（10 分钟）

**目标**：练习使用敏感数据进行安全配置

```bash
# 设置秘密（不会显示在输出中）
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# 设置非秘密配置
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# 查看环境（秘密应该被编辑）
azd env get-values

# 验证秘密已存储
azd env get DB_PASSWORD  # 应显示实际值
```

**成功标准：**
- [ ] 密钥存储时不在终端显示
- [ ] `azd env get-values` 显示已隐藏的密钥
- [ ] 单独的 `azd env get <SECRET_NAME>` 能检索实际值

## 下一步

- [你的第一个项目](first-project.md) - 实践应用配置
- [部署指南](../deployment/deployment-guide.md) - 使用配置进行部署
- [资源预配](../deployment/provisioning.md) - 生产就绪的配置

## 参考资料

- [azd 配置参考](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml 架构](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [环境变量](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**章节导航：**
- **📚 课程主页**：[AZD 初学者指南](../../README.md)
- **📖 当前章节**：第 3 章 - 配置与认证
- **⬅️ 上一章**：[你的第一个项目](first-project.md)
- **➡️ 下一章节**：[第 4 章：基础设施即代码](../deployment/deployment-guide.md)
- **下一课**：[你的第一个项目](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：  
本文档使用AI翻译服务[Co-op Translator](https://github.com/Azure/co-op-translator)进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用此翻译而产生的任何误解或误读不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->