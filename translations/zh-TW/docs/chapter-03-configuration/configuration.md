# Configuration Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD 入門](../../README.md)
- **📖 Current Chapter**: 第 3 章 - 設定與驗證
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Next Chapter**: [第 4 章：基礎建設即程式碼](../chapter-04-infrastructure/deployment-guide.md)

## Introduction

本綜合指南涵蓋設定 Azure Developer CLI 以達到最佳開發與部署工作流程的所有面向。您將學習設定階層、環境管理、驗證方法，以及可實現高效且安全的 Azure 部署的進階設定模式。

## Learning Goals

在本課結束時，您將能：
- 精通 azd 設定階層並了解設定如何被優先處理
- 有效設定全域與專案特定設定
- 管理具有不同設定的多個環境
- 實作安全的驗證與授權模式
- 了解用於複雜情境的進階設定模式

## Learning Outcomes

完成本課後，您將能夠：
- 為最佳開發工作流程設定 azd
- 設定並管理多個部署環境
- 實施安全的設定管理實務
- 疑難排解與設定相關的問題
- 為特定組織需求自訂 azd 行為

本綜合指南涵蓋設定 Azure Developer CLI 以達到最佳開發與部署工作流程的所有面向。

## Configuration Hierarchy

azd 使用分層的設定系統：
1. **Command-line flags** (最高優先)
2. **Environment variables**
3. **Local project configuration** (`.azd/config.json`)
4. **Global user configuration** (`~/.azd/config.json`)
5. **Default values** (最低優先)

## Global Configuration

### Setting Global Defaults
```bash
# 設定預設訂閱
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# 設定預設位置
azd config set defaults.location "eastus2"

# 設定預設資源群組命名慣例
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# 檢視所有全域設定
azd config list

# 移除設定
azd config unset defaults.location
```

### Common Global Settings
```bash
# 開發偏好
azd config set alpha.enable true                    # 啟用 Alpha 功能
azd config set telemetry.enabled false             # 停用遙測
azd config set output.format json                  # 設定輸出格式

# 安全性設定
azd config set auth.useAzureCliCredential true     # 使用 Azure CLI 進行驗證
azd config set tls.insecure false                  # 強制 TLS 驗證

# 效能調校
azd config set provision.parallelism 5             # 平行建立資源
azd config set deploy.timeout 30m                  # 部署逾時
```

## 🏗️ Project Configuration

### azure.yaml Structure
`azure.yaml` 檔案是您 azd 專案的核心：

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

### Service Configuration Options

#### Host Types
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

#### Language-Specific Settings
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

## 🌟 Environment Management

### Creating Environments
```bash
# 建立新的環境
azd env new development

# 在特定位置建立
azd env new staging --location "westus2"

# 從範本建立
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Environment Configuration
每個環境在 `.azure/<env-name>/config.json` 中有其自己的設定：

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

### Environment Variables
```bash
# 設定環境特定的變數
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# 檢視環境變數
azd env get-values

# 預期輸出:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# 移除環境變數
azd env unset DEBUG

# 確認移除
azd env get-values | grep DEBUG
# (應該不會回傳任何東西)
```

### Environment Templates
建立 `.azure/env.template` 以維持環境設置一致性：
```bash
# 必要的變數
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# 應用程式設定
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# 可選的開發設定
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Authentication Configuration

### Azure CLI Integration
```bash
# 使用 Azure CLI 認證（預設）
azd config set auth.useAzureCliCredential true

# 以特定租戶登入
az login --tenant <tenant-id>

# 設定預設訂閱
az account set --subscription <subscription-id>
```

### Service Principal Authentication
用於 CI/CD 管線：
```bash
# 設定環境變數
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# 或直接設定
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
用於 Azure 托管的環境：
```bash
# 啟用託管身分驗證
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Infrastructure Configuration

### Bicep Parameters
在 `infra/main.parameters.json` 中設定基礎建設參數：
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

### Terraform Configuration
對於 Terraform 專案，在 `infra/terraform.tfvars` 中進行設定：
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Deployment Configuration

### Build Configuration
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

### Docker Configuration
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
Example `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Advanced Configuration

### Custom Resource Naming
```bash
# 設定命名慣例
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Network Configuration
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Monitoring Configuration
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

## 🎯 Environment-Specific Configurations

### Development Environment
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Staging Environment
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Production Environment
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Configuration Validation

### Validate Configuration
```bash
# 檢查設定語法
azd config validate

# 測試環境變數
azd env get-values

# 驗證基礎架構
azd provision --dry-run
```

### Configuration Scripts
在 `scripts/` 中建立驗證腳本：

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# 檢查必要的環境變數
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# 驗證 azure.yaml 的語法
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Best Practices

### 1. Use Environment Variables
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organize Configuration Files
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

### 3. Version Control Considerations
```bash
# .gitignore
.azure/*/config.json         # 環境設定 (包含資源 ID)
.azure/*/.env               # 環境變數 (可能包含機密)
.env                        # 本地環境檔案
```

### 4. Configuration Documentation
在 `CONFIG.md` 中記錄您的設定：
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

## 🎯 Hands-On Practice Exercises

### Exercise 1: Multi-Environment Configuration (15 minutes)

**Goal**: 建立並設定三個具有不同設定的環境

```bash
# 建立開發環境
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# 建立預備環境
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# 建立生產環境
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# 驗證每個環境
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Success Criteria:**
- [ ] 成功建立三個環境
- [ ] 每個環境具有獨特的設定
- [ ] 能在環境間切換且不產生錯誤
- [ ] `azd env list` 顯示全部三個環境

### Exercise 2: Secret Management (10 minutes)

**Goal**: 練習使用敏感資料進行安全的設定管理

```bash
# 設定機密（不會顯示在輸出中）
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# 設定非機密設定
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# 檢視環境（機密應該會被遮蔽）
azd env get-values

# 確認機密已儲存
azd env get DB_PASSWORD  # 應該顯示實際值
```

**Success Criteria:**
- [ ] 機密已儲存且不在終端機中顯示
- [ ] `azd env get-values` 顯示已遮蔽的機密
- [ ] 個別的 `azd env get <SECRET_NAME>` 能取得實際值

## Next Steps

- [Your First Project](first-project.md) - 在實務中套用設定
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - 使用設定進行部署
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - 生產就緒的設定

## References

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD 入門](../../README.md)
- **📖 Current Chapter**: 第 3 章 - 設定與驗證
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next Chapter**: [第 4 章：基礎建設即程式碼](../chapter-04-infrastructure/deployment-guide.md)
- **Next Lesson**: [Your First Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 所翻譯。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不準確之處。原文應視為具權威性的版本。對於關鍵資訊，建議諮詢專業人工翻譯。我們不對因使用此翻譯而產生的任何誤解或曲解承擔任何責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->