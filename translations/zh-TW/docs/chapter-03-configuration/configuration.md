# 設定指南

**章節導覽:**
- **📚 課程首頁**: [AZD 初學者](../../README.md)
- **📖 目前章節**: 第 3 章 - 設定與驗證
- **⬅️ 上一步**: [你的第一個專案](first-project.md)
- **➡️ 下一步**: [部署指南](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 下一章**: [第 4 章：基礎建設即程式碼](../chapter-04-infrastructure/deployment-guide.md)

## 介紹

本綜合指南涵蓋配置 Azure Developer CLI 以達到最佳開發與部署工作流程的所有面向。你將學習配置層級、環境管理、驗證方法以及可實現高效且安全 Azure 部署的進階配置模式。

## 學習目標

在本課程結束時，你將能夠：
- 精通 azd 的設定層級並了解設定如何被優先處理
- 有效地配置全域與專案特定的設定
- 管理具有不同設定的多個環境
- 實作安全的驗證與授權模式
- 了解複雜情境下的進階配置模式

## 學習成果

完成本課程後，你將能夠：
- 為最佳開發工作流程配置 azd
- 設置並管理多個部署環境
- 實施安全的設定管理作法
- 偵錯與設定相關的問題
- 為特定組織需求自訂 azd 行為

本綜合指南涵蓋配置 Azure Developer CLI 以達到最佳開發與部署工作流程的所有面向。

## 在 azd 專案中理解 AI 代理人

如果你對 AI 代理人還不熟悉，這裡有一個簡單的方式來理解它們在 azd 世界中的角色。

### 什麼是代理人？

代理人是一段可以接收請求、進行推理並採取動作的軟體——通常會呼叫 AI 模型、查詢資料或呼叫其他服務。在 azd 專案中，代理人只是你網頁前端或 API 後端旁的另一個 <strong>服務</strong>。

### 代理人如何融入 azd 專案結構

一個 azd 專案由三個層級組成：<strong>基礎建設</strong>、<strong>程式碼</strong> 和 <strong>設定</strong>。代理人以與其他服務相同的方式接入這些層級：

| 層級 | 對傳統應用程式的作用 | 對代理人的作用 |
|-------|-------------------------------------|---------------------------|
| <strong>基礎建設</strong> (`infra/`) | 配置網頁應用程式與資料庫 | 配置 AI 模型端點、搜尋索引或代理人主機 |
| <strong>程式碼</strong> (`src/`) | 包含你的前端與 API 原始程式碼 | 包含你的代理人邏輯與提示定義 |
| <strong>設定</strong> (`azure.yaml`) | 列出你的服務與其託管目標 | 將你的代理人列為一項服務，並指向其程式碼與主機 |

### `azure.yaml` 的角色

你現在不需要記住語法。概念上，`azure.yaml` 是你告訴 azd 的檔案：*「這些是組成我的應用程式的服務，以及在哪裡可以找到它們的程式碼。」*

當你的專案包含 AI 代理人時，`azure.yaml` 只要將該代理人列為服務之一。azd 就會知道要配置正確的基礎建設（例如 Microsoft Foundry Models 端點或用來託管代理人的 Container App）並部署你的代理人程式碼——就像部署網頁應用或 API 一樣。

這表示沒有根本上新的東西需要學習。如果你了解 azd 如何管理網路服務，你已經知道它如何管理代理人。

## 設定層級

azd 使用分層的設定系統：
1. <strong>命令列旗標</strong>（優先權最高）
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
azd config show

# 移除設定
azd config unset defaults.location
```

### 常見全域設定
```bash
# 開發偏好
azd config set alpha.enable true                    # 啟用 Alpha 功能
azd config set telemetry.enabled false             # 停用遙測
azd config set output.format json                  # 設定輸出格式

# 安全設定
azd config set auth.useAzureCliCredential true     # 使用 Azure CLI 進行驗證
azd config set tls.insecure false                  # 強制執行 TLS 驗證

# 效能調校
azd config set provision.parallelism 5             # 平行資源建立
azd config set deploy.timeout 30m                  # 部署逾時
```

## 🏗️ 專案設定

### azure.yaml 結構
`azure.yaml` 檔案是你 azd 專案的核心：

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

#### 特定程式語言的設定
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

# 在特定位置建立
azd env new staging --location "westus2"

# 從範本建立
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### 環境設定
每個環境都有自己的設定，位於 `.azure/<env-name>/config.json`：

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

# 確認移除
azd env get-values | grep DEBUG
# (應該不會回傳任何東西)
```

### 環境範本
建立 `.azure/env.template` 以維持一致的環境設定：
```bash
# 必要變數
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

### 跨團隊分享環境

當超過一個人共同作業時，你需要就「哪些該跟著 repo 移動、哪些該保留在本地」達成共識。azd 將每個環境保存在 `.azure/` 資料夾下，但並非全部內容都應該被提交。

**`.azure/` 包含什麼：**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**要加入 gitignore 的項目。** azd 預設的 `.gitignore` 已排除 `.azure/`。請維持此設定——`.env` 檔可能包含祕密，而資源 ID 則是由佈建它的人所特有。每位團隊成員在本地建立他們的<strong>專屬</strong>環境：

```bash
# 每位開發人員都會執行一次，以取得各自隔離的環境
azd env new dev-alice
azd up
```

**在環境間切換。** 管理多個環境的開發者會在執行指令前選擇要啟用的環境：

```bash
azd env list                 # 查看所有本地環境，以及哪個為預設
azd env select staging       # 將 'staging' 設為目前使用中的環境
azd env get-values           # 確認你指向的是正確的環境
```

**提供非機密的預設給團隊。** 提交一個範本（例如上方的 `.azure/env.template`），讓每個人都知道要設哪些變數——但切記不要提交已填入的值。新成員複製範本並填入自己的值。

**CI/CD 中的環境。** 管線不會讀取你本地的 `.azure/` 資料夾。相反地，將環境值提供為管線變數/祕密，azd 會從程序環境讀取它們：

```bash
# 在 CI 中，azd 會從環境變數讀取這些，而不是從 .azure/。
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **經驗法則：** 基礎建設程式碼（`infra/`、`azure.yaml`）會在 Git 中共享；環境<em>狀態與祕密</em>（`.azure/`）則為每位開發者及每個管線各自管理。`azd pipeline config` 會自動為你設定好管線變數。

## 🔐 驗證設定

### Azure CLI 整合
```bash
# 使用 Azure CLI 憑證（預設）
azd config set auth.useAzureCliCredential true

# 以特定租戶登入
az login --tenant <tenant-id>

# 設定預設訂閱
az account set --subscription <subscription-id>
```

### 服務主體驗證
適用於 CI/CD 管道：
```bash
# 設定環境變數
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# 或直接設定
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### 託管識別（Managed Identity）
適用於 Azure 托管的環境：
```bash
# 啟用託管身分識別驗證
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ 基礎建設設定

### Bicep 參數
在 `infra/main.parameters.json` 中配置基礎建設參數：
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
對於 Terraform 專案，請在 `infra/terraform.tfvars` 中配置：
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
# 設定命名慣例
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
# .azure/開發/.env
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

# 驗證基礎架構
azd provision --dry-run
```

### 設定腳本
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

### 2. 整理設定檔案
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

### 4. 設定文件說明
在 `CONFIG.md` 中記錄你的設定：
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

<strong>目標</strong>：建立並配置三個具有不同設定的環境

```bash
# 建立開發環境
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# 建立預演環境
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
- [ ] 三個環境成功建立
- [ ] 每個環境都有獨特的設定
- [ ] 能夠在環境間切換且無錯誤
- [ ] `azd env list` 顯示所有三個環境

### 練習 2：祕密管理（10 分鐘）

<strong>目標</strong>：練習對敏感資料的安全設定

```bash
# 設定機密（不會顯示在輸出中）
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# 設定非機密組態
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# 檢視環境（機密資訊應已被遮蔽）
azd env get-values

# 確認機密已被儲存
azd env get DB_PASSWORD  # 應顯示實際值
```

**成功標準：**
- [ ] 秘密已儲存且不在終端機中顯示
- [ ] `azd env get-values` 顯示已遮蔽的秘密
- [ ] 個別 `azd env get <SECRET_NAME>` 可以擷取真實值

## 下一步

- [你的第一個專案](first-project.md) - 在實作中套用設定
- [部署指南](../chapter-04-infrastructure/deployment-guide.md) - 使用設定來部署
- [資源佈建](../chapter-04-infrastructure/provisioning.md) - 生產就緒的設定

## 參考資料

- [azd 設定參考](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml 架構](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [環境變數](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**章節導覽:**
- **📚 課程首頁**: [AZD 初學者](../../README.md)
- **📖 目前章節**: 第 3 章 - 設定與驗證
- **⬅️ 上一步**: [你的第一個專案](first-project.md)
- **➡️ 下一章**: [第 4 章：基礎建設即程式碼](../chapter-04-infrastructure/deployment-guide.md)
- <strong>下一課</strong>: [你的第一個專案](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->