# 設定指南

**Chapter Navigation:**
- **📚 Course Home**: [AZD 入門](../../README.md)
- **📖 Current Chapter**: 第 3 章 - 設定與驗證
- **⬅️ Previous**: [你的第一個專案](first-project.md)
- **➡️ Next**: [部署指南](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Next Chapter**: [第 4 章：基礎架構即程式碼](../chapter-04-infrastructure/deployment-guide.md)

## 簡介

本綜合指南涵蓋配置 Azure 開發者 CLI 以達到最佳開發與部署工作流程的各個面向。您將學習配置階層、環境管理、驗證方法，以及能夠實現高效且安全的 Azure 部署的進階配置模式。

## 學習目標

在本課程結束時，您將能夠：
- 掌握 azd 的設定階層並了解設定如何被優先處理
- 有效設定全域與專案特定的設定
- 管理具有不同配置的多個環境
- 實作安全的驗證與授權模式
- 了解用於複雜情境的進階配置模式

## 學習成果

完成本課程後，您將能：
- 為最佳開發工作流程設定 azd
- 建置並管理多個部署環境
- 實施安全的設定管理做法
- 排解與設定相關的問題
- 為特定組織需求自訂 azd 的行為

本綜合指南涵蓋配置 Azure 開發者 CLI 以達到最佳開發與部署工作流程的各個面向。

## 理解 azd 專案中的 AI 代理

如果您對 AI 代理還不熟悉，這裡有一個在 azd 世界中簡單的理解方式。

### 什麼是代理？

代理是一段能接收請求、對其進行推理並採取行動的軟體——通常透過呼叫 AI 模型、查詢資料或呼叫其他服務。在 azd 專案中，代理只是與您的網頁前端或 API 後端並列的另一個 <strong>服務</strong>。

### 代理如何融入 azd 專案結構

一個 azd 專案由三個層級組成：<strong>基礎架構</strong>、<strong>程式碼</strong> 與 <strong>設定</strong>。代理以與其他服務相同的方式整合到這些層級中：

| 層級 | 對於傳統應用程式的作用 | 對代理的作用 |
|-------|-------------------------------------|---------------------------|
| <strong>基礎架構</strong> (`infra/`) | 佈建網頁應用程式和資料庫 | 佈建 AI 模型端點、搜尋索引或代理主機 |
| <strong>程式碼</strong> (`src/`) | 包含您的前端與 API 原始程式碼 | 包含您的代理邏輯與提示詞定義 |
| <strong>設定</strong> (`azure.yaml`) | 列出您的服務及其部署目標 | 將您的代理列為一個服務，並指向其程式碼與主機 |

### `azure.yaml` 的角色

您現在不需要背誦語法。概念上，`azure.yaml` 是您告訴 azd 的檔案：*"這裡是組成我應用程式的服務，下面是找到它們程式碼的位置。"*

當您的專案包含 AI 代理時，`azure.yaml` 會簡單地將該代理列為服務之一。azd 隨後就會知道要佈建正確的基礎架構（像是 Microsoft Foundry Models 的端點或用來承載代理的 Container App）並部署您的代理程式碼——就像處理網頁應用或 API 一樣。

這表示沒有什麼根本上需要重新學習的。如果您理解 azd 如何管理一個網路服務，您已經理解它如何管理一個代理。

## 設定階層

azd 使用分層的設定系統：
1. <strong>命令列參數</strong>（優先權最高）
2. <strong>環境變數</strong>
3. <strong>本地專案設定</strong>（`.azd/config.json`）
4. <strong>全域使用者設定</strong>（`~/.azd/config.json`）
5. <strong>預設值</strong>（優先權最低）

## 全域設定

### 設定全域預設值
```bash
# 設定預設訂閱
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# 設定預設位置
azd config set defaults.location "eastus2"

# 設定預設資源群組命名慣例
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# 檢視所有全域設定
azd config list

# 移除一個設定
azd config unset defaults.location
```

### 常見的全域設定
```bash
# 開發偏好
azd config set alpha.enable true                    # 啟用 Alpha 功能
azd config set telemetry.enabled false             # 停用遙測
azd config set output.format json                  # 設定輸出格式

# 安全性設定
azd config set auth.useAzureCliCredential true     # 使用 Azure CLI 進行驗證
azd config set tls.insecure false                  # 強制 TLS 驗證

# 效能調校
azd config set provision.parallelism 5             # 並行建立資源
azd config set deploy.timeout 30m                  # 部署逾時
```

## 🏗️ 專案設定

### azure.yaml 結構
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

### 服務設定選項

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

#### 語言特定設定
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

### 建立環境
```bash
# 建立新環境
azd env new development

# 在指定位置建立
azd env new staging --location "westus2"

# 從範本建立
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### 環境設定
每個環境都有其位於 `.azure/<env-name>/config.json` 的設定：

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

# 確認已移除
azd env get-values | grep DEBUG
# (應該不會回傳任何內容)
```

### 環境範本
建立 `.azure/env.template` 以便一致地設定環境：
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

## 🔐 驗證設定

### Azure CLI 整合
```bash
# 使用 Azure CLI 憑證 (預設)
azd config set auth.useAzureCliCredential true

# 使用指定租戶登入
az login --tenant <tenant-id>

# 設定預設訂閱
az account set --subscription <subscription-id>
```

### 服務主體認證
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

### 託管識別
用於在 Azure 上託管的環境：
```bash
# 啟用託管身分識別驗證
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ 基礎架構設定

### Bicep 參數
在 `infra/main.parameters.json` 設定基礎架構參數：
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

### Terraform 設定
對於 Terraform 專案，於 `infra/terraform.tfvars` 設定：
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 部署設定

### 建置設定
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

### Docker 設定
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

## 🔧 進階設定

### 自訂資源命名
```bash
# 設定命名規則
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### 網路設定
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### 監控設定
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

## 🎯 環境特定設定

### 開發環境
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### 預備環境
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

## 🔍 設定驗證

### 驗證設定
```bash
# 檢查設定語法
azd config validate

# 測試環境變數
azd env get-values

# 驗證基礎設施
azd provision --dry-run
```

### 設定腳本
於 `scripts/` 建立驗證腳本：

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# 檢查所需的環境變數
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

## 🎓 最佳實務

### 1. 使用環境變數
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. 組織設定檔案
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

### 3. 版本控制注意事項
```bash
# .gitignore
.azure/*/config.json         # 環境設定（包含資源 ID）
.azure/*/.env               # 環境變數（可能包含機密）
.env                        # 本地環境檔案
```

### 4. 設定文件
將您的設定紀錄於 `CONFIG.md`：
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

## 🎯 實作練習

### 練習 1：多環境設定（15 分鐘）

<strong>目標</strong>：建立並設定三個具有不同設定的環境

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

**成功標準：**
- [ ] 三個環境已成功建立
- [ ] 每個環境具有獨特的設定
- [ ] 能在環境間切換且無錯誤
- [ ] `azd env list` 顯示所有三個環境

### 練習 2：祕密管理（10 分鐘）

<strong>目標</strong>：練習安全地處理敏感資料的設定

```bash
# 設定機密（不會在輸出中顯示）
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# 設定非機密設定
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# 檢視環境（機密應該被遮蔽）
azd env get-values

# 驗證機密已被儲存
azd env get DB_PASSWORD  # 應顯示實際值
```

**成功標準：**
- [ ] 祕密已儲存但未在終端顯示
- [ ] `azd env get-values` 顯示已遮蔽的祕密
- [ ] 單一 `azd env get <SECRET_NAME>` 可取得實際值

## 下一步

- [你的第一個專案](first-project.md) - 在實務中套用設定
- [部署指南](../chapter-04-infrastructure/deployment-guide.md) - 使用設定進行部署
- [資源佈建](../chapter-04-infrastructure/provisioning.md) - 適用於生產的設定

## 參考資料

- [azd 設定參考](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml 架構](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [環境變數](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD 入門](../../README.md)
- **📖 Current Chapter**: 第 3 章 - 設定與驗證
- **⬅️ Previous**: [你的第一個專案](first-project.md)
- **➡️ Next Chapter**: [第 4 章：基礎架構即程式碼](../chapter-04-infrastructure/deployment-guide.md)
- **Next Lesson**: [你的第一個專案](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**:
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於確保準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始語言版本應被視為具權威性的來源。如涉及重要資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而引致的任何誤解或錯誤詮釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->