# 配置指南

**章節導航：**
- **📚 課程首頁**: [AZD 初學者指南](../../README.md)
- **📖 當前章節**: 第三章 - 配置與身份驗證
- **⬅️ 上一章**: [你的第一個專案](first-project.md)
- **➡️ 下一章**: [部署指南](../deployment/deployment-guide.md)
- **🚀 下一章節**: [第四章：基礎設施即代碼](../deployment/deployment-guide.md)

## 簡介

這份全面的指南涵蓋了配置 Azure Developer CLI 的所有方面，幫助您優化開發和部署工作流程。您將學習配置層級、環境管理、身份驗證方法以及高級配置模式，從而實現高效且安全的 Azure 部署。

## 學習目標

完成本課程後，您將能夠：
- 掌握 azd 的配置層級，了解設置的優先順序
- 有效配置全域和專案特定的設置
- 管理多個具有不同配置的環境
- 實現安全的身份驗證和授權模式
- 理解複雜場景中的高級配置模式

## 學習成果

完成本課程後，您將能夠：
- 配置 azd 以優化開發工作流程
- 設置和管理多個部署環境
- 實現安全的配置管理實踐
- 解決與配置相關的問題
- 根據特定組織需求自定義 azd 行為

這份全面的指南涵蓋了配置 Azure Developer CLI 的所有方面，幫助您優化開發和部署工作流程。

## 配置層級

azd 使用分層的配置系統：
1. **命令列標誌**（最高優先級）
2. **環境變數**
3. **本地專案配置**（`.azd/config.json`）
4. **全域用戶配置**（`~/.azd/config.json`）
5. **默認值**（最低優先級）

## 全域配置

### 設置全域默認值
```bash
# 設置預設訂閱
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# 設置預設位置
azd config set defaults.location "eastus2"

# 設置預設資源組命名規範
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# 查看所有全域配置
azd config list

# 移除配置
azd config unset defaults.location
```

### 常見的全域設置
```bash
# 開發偏好設定
azd config set alpha.enable true                    # 啟用 alpha 功能
azd config set telemetry.enabled false             # 停用遙測
azd config set output.format json                  # 設定輸出格式

# 安全性設定
azd config set auth.useAzureCliCredential true     # 使用 Azure CLI 進行身份驗證
azd config set tls.insecure false                  # 強制 TLS 驗證

# 性能調整
azd config set provision.parallelism 5             # 平行資源創建
azd config set deploy.timeout 30m                  # 部署超時
```

## 🏗️ 專案配置

### azure.yaml 結構
`azure.yaml` 文件是 azd 專案的核心：

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

### 服務配置選項

#### 主機類型
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

#### 語言特定設置
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

## 🌟 環境管理

### 創建環境
```bash
# 建立新環境
azd env new development

# 使用特定位置建立
azd env new staging --location "westus2"

# 從模板建立
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### 環境配置
每個環境都有自己的配置，位於 `.azure/<env-name>/config.json`：

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

### 環境變數
```bash
# 設置環境特定變數
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# 查看環境變數
azd env get-values

# 預期輸出：
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# 移除環境變數
azd env unset DEBUG

# 驗證移除
azd env get-values | grep DEBUG
# （應該返回空值）
```

### 環境模板
創建 `.azure/env.template` 以實現一致的環境設置：
```bash
# 必需的變數
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

## 🔐 身份驗證配置

### Azure CLI 集成
```bash
# 使用 Azure CLI 憑證（預設）
azd config set auth.useAzureCliCredential true

# 使用特定租戶登入
az login --tenant <tenant-id>

# 設定預設訂閱
az account set --subscription <subscription-id>
```

### 服務主體身份驗證
適用於 CI/CD 管道：
```bash
# 設置環境變數
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# 或直接配置
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### 託管身份
適用於 Azure 託管環境：
```bash
# 啟用受管理身份驗證
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ 基礎設施配置

### Bicep 參數
在 `infra/main.parameters.json` 中配置基礎設施參數：
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
對於 Terraform 專案，在 `infra/terraform.tfvars` 中進行配置：
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 部署配置

### 構建配置
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
範例 `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 高級配置

### 自定義資源命名
```bash
# 設置命名規範
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### 網絡配置
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### 監控配置
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

## 🎯 環境特定配置

### 開發環境
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### 測試環境
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### 生產環境
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 配置驗證

### 驗證配置
```bash
# 檢查配置語法
azd config validate

# 測試環境變數
azd env get-values

# 驗證基礎設施
azd provision --dry-run
```

### 配置腳本
在 `scripts/` 中創建驗證腳本：

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# 檢查所需的環境變數
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# 驗證 azure.yaml 語法
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 最佳實踐

### 1. 使用環境變數
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. 組織配置文件
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

### 3. 版本控制考量
```bash
# .gitignore
.azure/*/config.json         # 環境配置（包含資源 ID）
.azure/*/.env               # 環境變數（可能包含秘密）
.env                        # 本地環境檔案
```

### 4. 配置文檔
在 `CONFIG.md` 中記錄您的配置：
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

## 🎯 實踐練習

### 練習 1：多環境配置（15 分鐘）

**目標**：創建並配置三個具有不同設置的環境

```bash
# 建立開發環境
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# 建立測試環境
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

**成功標準：**
- [ ] 成功創建三個環境
- [ ] 每個環境都有獨特的配置
- [ ] 能夠在環境之間無錯誤地切換
- [ ] `azd env list` 顯示所有三個環境

### 練習 2：密鑰管理（10 分鐘）

**目標**：練習使用敏感數據進行安全配置

```bash
# 設置秘密（不顯示在輸出中）
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# 設置非秘密配置
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# 查看環境（秘密應該被隱藏）
azd env get-values

# 驗證秘密已存儲
azd env get DB_PASSWORD  # 應顯示實際值
```

**成功標準：**
- [ ] 密鑰存儲時不顯示在終端
- [ ] `azd env get-values` 顯示已遮蔽的密鑰
- [ ] 單獨的 `azd env get <SECRET_NAME>` 能檢索實際值

## 下一步

- [你的第一個專案](first-project.md) - 在實踐中應用配置
- [部署指南](../deployment/deployment-guide.md) - 使用配置進行部署
- [資源配置](../deployment/provisioning.md) - 生產就緒的配置

## 參考資料

- [azd 配置參考](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml 架構](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [環境變數](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**章節導航：**
- **📚 課程首頁**: [AZD 初學者指南](../../README.md)
- **📖 當前章節**: 第三章 - 配置與身份驗證
- **⬅️ 上一章**: [你的第一個專案](first-project.md)
- **➡️ 下一章節**: [第四章：基礎設施即代碼](../deployment/deployment-guide.md)
- **下一課程**: [你的第一個專案](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
此文件已使用人工智能翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們努力確保準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於關鍵信息，建議使用專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或誤釋不承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->