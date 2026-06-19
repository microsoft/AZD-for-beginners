# 配置指南

**章節導航：**
- **📚 課程首頁**: [AZD 入門](../../README.md)
- **📖 當前章節**: 第3章 - 配置與認證
- **⬅️ 上一節**: [你的第一個專案](first-project.md)
- **➡️ 下一節**: [部署指南](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 下一章節**: [第4章：基礎架構即程式碼](../chapter-04-infrastructure/deployment-guide.md)

## 簡介

本全面指南涵蓋配置 Azure Developer CLI 的所有方面，以實現最佳的開發與部署工作流程。你將學習配置層級環境管理、認證方法，以及可實現高效且安全 Azure 部署的進階配置模式。

## 學習目標

完成本課程後，你將能夠：
- 精通 azd 配置層級並了解設定優先順序
- 有效地配置全域與專案特有設置
- 管理多個具不同配置的環境
- 實作安全認證和授權模式
- 理解複雜場景的進階配置模式

## 學習成果

完成本課程後，你將能：
- 為最佳化開發工作流程配置 azd
- 建立並管理多個部署環境
- 實行安全的配置管理作法
- 疑難排解配置相關問題
- 客製化 azd 行為以符合特定組織需求

本全面指南涵蓋配置 Azure Developer CLI 的所有面向，以達到最佳的開發和部署流程。

## 了解 azd 專案中的 AI 代理

如果你是 AI 代理的新手，以下是簡單的方式理解它們在 azd 世界中的角色。

### 什麼是代理？

代理是一段軟體，它可以接收請求、推理並採取行動—通常是透過呼叫 AI 模型、查詢資料或調用其他服務。在 azd 專案中，代理就是與你的網頁前端或 API 後端並列的另一個 <strong>服務</strong>。

### 代理如何融入 azd 專案架構

azd 專案由三個層級組成：<strong>基礎架構</strong>、<strong>程式碼</strong> 與 <strong>配置</strong>。代理以與其他服務相同的方式插入這些層級：

| 層級 | 傳統應用程式的角色 | 代理的角色 |
|-------|---------------------|------------|
| <strong>基礎架構</strong> (`infra/`) | 配置網頁應用與資料庫 | 配置 AI 模型端點、搜尋索引或代理主機 |
| <strong>程式碼</strong> (`src/`) | 包含前端與 API 原始碼 | 包含代理邏輯與提示定義 |
| <strong>配置</strong> (`azure.yaml`) | 列出你的服務及其主機目標 | 將代理列為服務，指向其程式碼與主機 |

### `azure.yaml` 的角色

你現在不需要記憶語法。概念上，`azure.yaml` 是你告訴 azd：「這些是組成我應用程式的服務，這裡是找到它們程式碼的位置」的檔案。

當你的專案包含 AI 代理時，`azure.yaml` 僅僅將該代理列為服務之一。azd 隨後會知道如何配置適當的基礎架構（例如 Microsoft Foundry Models 端點或用以寄宿代理的 Container App）並部署你的代理程式碼—就像它管理網頁應用或 API 一樣。

這表示沒有什麼根本性的新增學習內容。如果你了解 azd 如何管理網路服務，你已經理解它如何管理代理。

## 配置層級

azd 採用分層配置系統：
1. <strong>命令列參數</strong>（最高優先）
2. <strong>環境變數</strong>
3. <strong>本地專案配置</strong>（`.azd/config.json`）
4. <strong>全域使用者配置</strong>（`~/.azd/config.json`）
5. <strong>預設值</strong>（最低優先）

## 全域配置

### 設定全域預設值
```bash
# 設定預設訂閱
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# 設定預設位置
azd config set defaults.location "eastus2"

# 設定預設資源群組命名規則
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# 檢視所有全域設定
azd config show

# 移除設定
azd config unset defaults.location
```

### 常見全域設定
```bash
# 開發喜好設定
azd config set alpha.enable true                    # 啟用 Alpha 功能
azd config set telemetry.enabled false             # 停用遙測
azd config set output.format json                  # 設定輸出格式

# 安全性設定
azd config set auth.useAzureCliCredential true     # 使用 Azure CLI 進行驗證
azd config set tls.insecure false                  # 強制 TLS 驗證

# 效能調校
azd config set provision.parallelism 5             # 平行資源建立
azd config set deploy.timeout 30m                  # 部署逾時設定
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

#### 特定語言設定
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
# 建立一個新的環境
azd env new development

# 在指定位置建立
azd env new staging --location "westus2"

# 從範本建立
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### 環境配置
每個環境有自己的配置於 `.azure/<env-name>/config.json`：

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

# 預期輸出：
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# 移除環境變數
azd env unset DEBUG

# 驗證移除
azd env get-values | grep DEBUG
# （應該不會返回任何東西）
```

### 環境模板
建立 `.azure/env.template` 以做一致的環境設定：
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

### 團隊間共用環境

當多人協作專案時，你們需要達成共識<strong>哪些要隨碼庫同步，哪些只留本地</strong>。azd 把每個環境放在 `.azure/` 資料夾下，但不全數應該被提交。

**`.azure/` 裡包含的項目：**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**需加入 gitignore 的內容。** azd 預設的 `.gitignore` 已排除 `.azure/`。請保持如此。`.env` 檔內可能包含祕密，且資源 ID 專屬於被配置的人。每位隊員建立<strong>自己的</strong>本地環境：

```bash
# 每位開發者都會執行這個一次，以獲取他們自己獨立的環境
azd env new dev-alice
azd up
```

**切換環境。** 管理多個環境的開發者在執行指令前，會選擇活躍的環境：

```bash
azd env list                 # 查看所有本地環境及預設環境
azd env select staging       # 將「staging」設定為啟用環境
azd env get-values           # 確認你指向正確的環境
```

**向團隊提供非祕密預設值。** 將模板（如上方的 `.azure/env.template`）提交，讓大家明白要設定哪些變數—但絕不提交帶有實際值的檔案。新成員複製模板並填入自己的設定。

**CI/CD 中的環境。** 工作流程不讀取本地 `.azure/` 資料夾。請改以工作流程變數/祕密提供環境值，由 azd 從系統環境中讀取：

```bash
# 喺 CI 裡面，azd 係由環境讀取呢啲，而唔係由 .azure/ 讀取
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> <strong>經驗法則：</strong>基礎架構程式碼（`infra/`、`azure.yaml`）透過 Git 共享；而環境<em>狀態與祕密</em>（`.azure/`）則由個別開發者與工作流程維護。`azd pipeline config` 可自動設定工作流程變數。

## 🔐 認證配置

### Azure CLI 整合
```bash
# 使用 Azure CLI 認證（預設）
azd config set auth.useAzureCliCredential true

# 以特定租戶登入
az login --tenant <tenant-id>

# 設定預設訂閱
az account set --subscription <subscription-id>
```

### 服務主體認證
針對 CI/CD 工作流程：
```bash
# 設置環境變量
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# 或直接配置
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### 管理身份
針對 Azure 托管環境：
```bash
# 啟用託管身份驗證
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ 基礎架構配置

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

### Terraform 配置
對於 Terraform 專案，在 `infra/terraform.tfvars` 配置：
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 部署配置

### 建置配置
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

## 🔧 進階配置

### 自訂資源命名
```bash
# 設定命名規範
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### 網路配置
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

## 🎯 特定環境配置

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

## 🔍 配置驗證

### 驗證配置
```bash
# 檢查配置語法
azd config validate

# 測試環境變量
azd env get-values

# 驗證基礎設施
azd provision --dry-run
```

### 配置腳本
在 `scripts/` 製作驗證腳本：

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

### 2. 組織配置檔案
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
.azure/*/config.json         # 環境設定（包含資源 ID）
.azure/*/.env               # 環境變數（可能包含機密）
.env                        # 本地環境檔案
```

### 4. 配置文件說明
在 `CONFIG.md` 中書寫說明：
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

## 🎯 實務練習

### 練習1：多環境配置（15 分鐘）

<strong>目標</strong>：建立並配置三個擁有不同設定的環境

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
- [ ] 成功建立三個環境
- [ ] 每個環境具獨特配置
- [ ] 可無錯誤切換環境
- [ ] `azd env list` 顯示所有三個環境

### 練習2：祕密管理（10 分鐘）

<strong>目標</strong>：練習安全管理敏感資料

```bash
# 設定密鑰（不會顯示於輸出中）
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# 設定非密鑰配置
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# 檢視環境（密鑰應該被遮蓋）
azd env get-values

# 驗證密鑰是否已儲存
azd env get DB_PASSWORD  # 應該顯示實際值
```

**成功標準：**
- [ ] 祕密存放時不在終端顯示
- [ ] `azd env get-values` 顯示將祕密遮蔽
- [ ] 個別 `azd env get <SECRET_NAME>` 可取回真實值

## 下一步

- [你的第一個專案](first-project.md) - 實務應用配置
- [部署指南](../chapter-04-infrastructure/deployment-guide.md) - 使用配置進行部署
- [資源佈建](../chapter-04-infrastructure/provisioning.md) - 適合生產環境的配置

## 參考資料

- [azd 配置參考](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml 架構](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [環境變數](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**章節導航：**
- **📚 課程首頁**: [AZD 入門](../../README.md)
- **📖 當前章節**: 第3章 - 配置與認證
- **⬅️ 上一節**: [你的第一個專案](first-project.md)
- **➡️ 下一章節**: [第4章：基礎架構即程式碼](../chapter-04-infrastructure/deployment-guide.md)
- <strong>下一課程</strong>: [你的第一個專案](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->