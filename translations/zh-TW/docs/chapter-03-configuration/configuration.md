# 設定指南

**章節導覽：**
- **📚 課程首頁**：[AZD 初學者指南](../../README.md)
- **📖 目前章節**：第 3 章 - 設定與身份驗證
- **⬅️ 上一章**：[你的第一個專案](first-project.md)
- **➡️ 下一章**：[部署指南](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 下一章節**：[第 4 章：基礎架構即程式碼](../chapter-04-infrastructure/deployment-guide.md)

## 介紹

本完整指南涵蓋配置 Azure Developer CLI 以達成最佳開發與部署工作流程的所有面向。你將學習配置階層、環境管理、身份驗證方法以及啟用高效且安全 Azure 部署的高階配置模式。

## 學習目標

在本課程結束時，你將能：
- 精通 azd 配置階層，瞭解設定如何被優先處理
- 有效配置全域與專案特定設定
- 管理具有不同配置的多個環境
- 實施安全的身份驗證與授權模式
- 理解用於複雜情境的高階配置模式

## 學習成果

完成本課程後，你將能夠：
- 配置 azd 以優化開發工作流程
- 設置並管理多個部署環境
- 實施安全的配置管理實務
- 故障排除配置相關問題
- 根據特定組織需求自訂 azd 行為

本完整指南涵蓋配置 Azure Developer CLI 以達成最佳開發與部署工作流程的所有面向。

## 了解 azd 專案中的 AI 代理人 (AI Agents)

如果你剛接觸 AI 代理人，以下是你在 azd 世界中理解它們的一個簡單方法。

### 代理人是什麼？

代理人是一段軟體，可以接收請求、進行推理，並採取動作——通常會呼叫 AI 模型、查詢資料或調用其他服務。在 azd 專案中，代理人只是和你的 Web 前端或 API 背後服務同等的一個<strong>服務</strong>。

### 代理人如何融入 azd 專案結構

azd 專案由三個層級組成：<strong>基礎架構</strong>、<strong>程式碼</strong>和<strong>設定</strong>。代理人接入這些層級的方式與任何其他服務相同：

| 層級 | 對傳統應用的功能 | 對代理人的功能 |
|-------|-----------------|----------------|
| <strong>基礎架構</strong> (`infra/`) | 提供 Web 應用與資料庫 | 提供 AI 模型端點、搜尋索引或代理人主機 |
| <strong>程式碼</strong> (`src/`) | 包含前端與 API 原始碼 | 包含代理人邏輯與提示定義 |
| <strong>設定</strong> (`azure.yaml`) | 列出服務與其部署目標 | 將代理人列為服務，指向其程式碼與主機 |

### `azure.yaml` 的角色

你現在不需要背誦語法。從概念上講，`azure.yaml` 是你告訴 azd：「這些是組成我應用程式的服務，且這裡是找到它們程式碼的位置」的檔案。

當你的專案包含 AI 代理人時，`azure.yaml` 只是簡單地將該代理人列為其中一個服務。azd 隨即知道要提供適當的基礎架構（例如 Microsoft Foundry Models 端點或用來托管代理人的 Container App）並部署你的代理人程式碼——就像對 Web 應用或 API 一樣。

這代表這沒有根本性的新增學習。如果你了解 azd 如何管理 Web 服務，你也就了解它如何管理代理人。

## 配置階層

azd 使用階層式配置系統：
1. <strong>命令列參數</strong>（優先權最高）
2. <strong>環境變數</strong>
3. <strong>本地專案配置</strong>（`.azd/config.json`）
4. <strong>全域使用者配置</strong>（`~/.azd/config.json`）
5. <strong>預設值</strong>（優先權最低）

## 全域配置

### 設定全域預設值
```bash
# 設定預設訂閱
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# 設定預設位置
azd config set defaults.location "eastus2"

# 設定預設資源群組命名慣例
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# 檢視所有全域設定
azd config show

# 移除設定
azd config unset defaults.location
```

### 常用全域設定
```bash
# 開發偏好設定
azd config set alpha.enable true                    # 啟用測試功能
azd config set telemetry.enabled false             # 停用遙測
azd config set output.format json                  # 設定輸出格式

# 安全性設定
azd config set auth.useAzureCliCredential true     # 使用 Azure CLI 進行身份驗證
azd config set tls.insecure false                  # 強制執行 TLS 驗證

# 效能調校
azd config set provision.parallelism 5             # 平行資源建立
azd config set deploy.timeout 30m                  # 部署逾時
```

## 🏗️ 專案配置

### azure.yaml 結構
`azure.yaml` 是你的 azd 專案核心：

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

### 創建環境
```bash
# 建立一個新的環境
azd env new development

# 在特定位置建立
azd env new staging --location "westus2"

# 從範本建立
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### 環境配置
每個環境有其獨立配置，存於 `.azure/<env-name>/config.json`：

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
# 設定特定環境的變數
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
# （應該不會回傳任何內容）
```

### 環境範本
建立 `.azure/env.template` 以確保環境設定一致：
```bash
# 必要變數
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# 應用程式設定
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# 選擇性開發設定
DEBUG=false
LOG_LEVEL=info
```

## 🔐 身份驗證設定

### Azure CLI 整合
```bash
# 使用 Azure CLI 憑證（預設）
azd config set auth.useAzureCliCredential true

# 使用特定租戶登入
az login --tenant <tenant-id>

# 設定預設訂閱
az account set --subscription <subscription-id>
```

### 服務主體身份驗證
用於 CI/CD 管線：
```bash
# 設定環境變數
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# 或直接配置
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### 管理身份
用於 Azure 代管環境：
```bash
# 啟用受管身分驗證
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
對 Terraform 專案，在 `infra/terraform.tfvars` 設定：
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 部署配置

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
範例 `Dockerfile`：https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 高階配置

### 自訂資源命名
```bash
# 設定命名慣例
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

## 🎯 環境特定設定

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
在 `scripts/` 建立驗證腳本：

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# 檢查必要的環境變數
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

### 3. 版本控制注意事項
```bash
# .gitignore
.azure/*/config.json         # 環境設定（包含資源 ID）
.azure/*/.env               # 環境變數（可能包含機密）
.env                        # 本地環境檔案
```

### 4. 配置文件說明
在 `CONFIG.md` 中記錄你的配置：
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

### 練習 1：多環境配置（15 分鐘）

<strong>目標</strong>：建立並設定三個具有不同設定的環境

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
- [ ] 每個環境有獨特配置
- [ ] 能無誤切換環境
- [ ] `azd env list` 顯示全部三個環境

### 練習 2：機密管理（10 分鐘）

<strong>目標</strong>：練習使用安全方式配置敏感資料

```bash
# 設定秘密（不會顯示在輸出中）
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# 設定非秘密的設定
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# 查看環境（秘密應被遮蔽）
azd env get-values

# 驗證秘密是否已儲存
azd env get DB_PASSWORD  # 應顯示實際值
```

**成功標準：**
- [ ] 機密被安全存放，不在終端機顯示
- [ ] `azd env get-values` 顯示隱藏的機密
- [ ] 個別 `azd env get <SECRET_NAME>` 能取得實際值

## 下一步

- [你的第一個專案](first-project.md) - 實際應用配置
- [部署指南](../chapter-04-infrastructure/deployment-guide.md) - 使用配置進行部署
- [資源佈建](../chapter-04-infrastructure/provisioning.md) - 生產就緒配置

## 參考資料

- [azd 配置參考](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml 架構](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [環境變數](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**章節導覽：**
- **📚 課程首頁**：[AZD 初學者指南](../../README.md)
- **📖 目前章節**：第 3 章 - 設定與身份驗證
- **⬅️ 上一章**：[你的第一個專案](first-project.md)
- **➡️ 下一章節**：[第 4 章：基礎架構即程式碼](../chapter-04-infrastructure/deployment-guide.md)
- <strong>下一課程</strong>：[你的第一個專案](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 所翻譯而成。雖然我們力求準確，但請注意，機器翻譯結果可能包含錯誤或不準確之處。原始文件之原文版本應被視為權威來源。對於重要資訊，建議採用專業人工翻譯。本公司不對因使用本翻譯所產生之任何誤解或誤譯負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->