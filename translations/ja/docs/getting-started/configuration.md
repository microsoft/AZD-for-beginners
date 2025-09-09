<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "71971408c9d2c3ed2357433ec9bc72b5",
  "translation_date": "2025-09-09T16:51:14+00:00",
  "source_file": "docs/getting-started/configuration.md",
  "language_code": "ja"
}
-->
# 設定ガイド

## はじめに

この包括的なガイドでは、Azure Developer CLIを最適な開発およびデプロイワークフローに設定する方法を説明します。設定の階層構造、環境管理、認証方法、効率的かつ安全なAzureデプロイを可能にする高度な設定パターンについて学びます。

## 学習目標

このレッスンの終了時には以下を習得できます:
- azdの設定階層を理解し、設定の優先順位を把握する
- グローバルおよびプロジェクト固有の設定を効果的に構成する
- 異なる設定を持つ複数の環境を管理する
- 安全な認証および認可パターンを実装する
- 複雑なシナリオに対応する高度な設定パターンを理解する

## 学習成果

このレッスンを完了すると、以下ができるようになります:
- 開発ワークフローを最適化するためにazdを設定する
- 複数のデプロイ環境をセットアップおよび管理する
- 安全な設定管理の実践を実装する
- 設定に関連する問題をトラブルシュートする
- 特定の組織要件に合わせてazdの動作をカスタマイズする

この包括的なガイドでは、Azure Developer CLIを最適な開発およびデプロイワークフローに設定する方法を説明します。

## 設定階層

azdは階層的な設定システムを使用します:
1. **コマンドラインフラグ**（最優先）
2. **環境変数**
3. **ローカルプロジェクト設定** (`.azd/config.json`)
4. **グローバルユーザー設定** (`~/.azd/config.json`)
5. **デフォルト値**（最下位）

## グローバル設定

### グローバルデフォルトの設定
```bash
# Set default subscription
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Set default location
azd config set defaults.location "eastus2"

# Set default resource group naming convention
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# View all global configuration
azd config list

# Remove a configuration
azd config unset defaults.location
```

### 一般的なグローバル設定
```bash
# Development preferences
azd config set alpha.enable true                    # Enable alpha features
azd config set telemetry.enabled false             # Disable telemetry
azd config set output.format json                  # Set output format

# Security settings
azd config set auth.useAzureCliCredential true     # Use Azure CLI for auth
azd config set tls.insecure false                  # Enforce TLS verification

# Performance tuning
azd config set provision.parallelism 5             # Parallel resource creation
azd config set deploy.timeout 30m                  # Deployment timeout
```

## 🏗️ プロジェクト設定

### azure.yamlの構造
`azure.yaml`ファイルはazdプロジェクトの中心です:

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

### サービス設定オプション

#### ホストタイプ
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

#### 言語固有の設定
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

### 環境の作成
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### 環境設定
各環境には独自の設定が`.azure/<env-name>/config.json`に保存されます:

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

### 環境変数
```bash
# Set environment-specific variables
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# View environment variables
azd env get-values

# Remove environment variable
azd env unset DEBUG
```

### 環境テンプレート
一貫した環境セットアップのために`.azure/env.template`を作成します:
```bash
# Required variables
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Application settings
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Optional development settings
DEBUG=false
LOG_LEVEL=info
```

## 🔐 認証設定

### Azure CLI統合
```bash
# Use Azure CLI credentials (default)
azd config set auth.useAzureCliCredential true

# Login with specific tenant
az login --tenant <tenant-id>

# Set default subscription
az account set --subscription <subscription-id>
```

### サービスプリンシパル認証
CI/CDパイプライン用:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Or configure directly
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### マネージドID
Azureホスト環境用:
```bash
# Enable managed identity authentication
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ インフラ設定

### Bicepパラメータ
`infra/main.parameters.json`でインフラパラメータを設定します:
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

### Terraform設定
Terraformプロジェクトの場合、`infra/terraform.tfvars`で設定します:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 デプロイ設定

### ビルド設定
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

### Docker設定
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

## 🔧 高度な設定

### カスタムリソース命名
```bash
# Set naming conventions
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### ネットワーク設定
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### モニタリング設定
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

## 🎯 環境固有の設定

### 開発環境
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### ステージング環境
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### 本番環境
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 設定の検証

### 設定の検証
```bash
# Check configuration syntax
azd config validate

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --dry-run
```

### 設定スクリプト
`scripts/`に検証スクリプトを作成します:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Check required environment variables
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Validate azure.yaml syntax
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 ベストプラクティス

### 1. 環境変数を使用する
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. 設定ファイルを整理する
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

### 3. バージョン管理の考慮事項
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. 設定のドキュメント化
`CONFIG.md`に設定を記録します:
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

## 次のステップ

- [最初のプロジェクト](first-project.md) - 設定を実際に適用する
- [デプロイガイド](../deployment/deployment-guide.md) - デプロイに設定を活用する
- [リソースのプロビジョニング](../deployment/provisioning.md) - 本番対応の設定

## 参考資料

- [azd設定リファレンス](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yamlスキーマ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [環境変数](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**ナビゲーション**
- **前のレッスン**: [インストールとセットアップ](installation.md)
- **次のレッスン**: [最初のプロジェクト](first-project.md)

---

**免責事項**:  
この文書は、AI翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を追求しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知ください。元の言語で記載された文書が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用に起因する誤解や誤解釈について、当方は一切の責任を負いません。