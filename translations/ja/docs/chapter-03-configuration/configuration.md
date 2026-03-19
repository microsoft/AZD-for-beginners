# Configuration Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 3 - Configuration & Authentication
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Next Chapter**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## Introduction

この包括的なガイドは、開発とデプロイのワークフローを最適化するための Azure Developer CLI の構成に関するすべての側面を扱います。構成の階層、環境管理、認証方法、および効率的で安全な Azure デプロイを可能にする高度な構成パターンについて学びます。

## Learning Goals

このレッスンの終了時には、あなたは以下を行えるようになります:
- azd の構成階層を習得し、設定の優先順位を理解する
- グローバルおよびプロジェクト固有の設定を効果的に構成する
- 異なる構成を持つ複数の環境を管理する
- 安全な認証と認可パターンを実装する
- 複雑なシナリオ向けの高度な構成パターンを理解する

## Learning Outcomes

このレッスンを修了すると、あなたは以下ができるようになります:
- 開発ワークフローに最適な azd の構成を行う
- 複数のデプロイ環境を設定および管理する
- 安全な構成管理の実践を実装する
- 構成に関連する問題をトラブルシュートする
- 組織の特定要件に合わせて azd の動作をカスタマイズする

この包括的なガイドは、開発とデプロイのワークフローを最適化するための Azure Developer CLI の構成に関するすべての側面を扱います。

## Understanding AI Agents in an azd Project

AI エージェントに不慣れな場合、azd の世界におけるエージェントを理解する簡単な方法を以下に示します。

### What Is an Agent?

エージェントは、リクエストを受け取り、それについて推論し、アクションを実行できるソフトウェアの一部です — 多くの場合、AI モデルを呼び出したり、データを参照したり、他のサービスを呼び出したりします。azd プロジェクトでは、エージェントはウェブフロントエンドや API バックエンドと並ぶもう一つの **service** に過ぎません。

### How Agents Fit Into the azd Project Structure

azd プロジェクトは **infrastructure**, **code**, **configuration** の三つのレイヤーで構成されます。エージェントは他のサービスと同様にこれらのレイヤーに組み込まれます:

| Layer | What It Does for a Traditional App | What It Does for an Agent |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | Provisions a web app and database | Provisions an AI model endpoint, search index, or agent host |
| **Code** (`src/`) | Contains your frontend and API source code | Contains your agent logic and prompt definitions |
| **Configuration** (`azure.yaml`) | Lists your services and their hosting targets | Lists your agent as a service, pointing to its code and host |

### The Role of `azure.yaml`

今すぐに構文を丸暗記する必要はありません。概念的には、`azure.yaml` は azd に対して「ここが私のアプリケーションを構成するサービスで、ここにそれらのコードがあります」と伝えるファイルです。

プロジェクトに AI エージェントが含まれる場合、`azure.yaml` はそのエージェントをサービスの一つとして列挙するだけです。azd はそれに応じて適切なインフラストラクチャ（Microsoft Foundry Models エンドポイントやエージェントをホストする Container App など）をプロビジョニングし、エージェントコードをデプロイします — ウェブアプリや API の場合と同様です。

つまり、根本的に新しいことを学ぶ必要はありません。azd がウェブサービスを管理する方法を理解していれば、エージェントの管理方法もすでに理解しています。

## Configuration Hierarchy

azd は階層型の構成システムを使用します:
1. **Command-line flags** (highest priority)
2. **Environment variables**
3. **Local project configuration** (`.azd/config.json`)
4. **Global user configuration** (`~/.azd/config.json`)
5. **Default values** (lowest priority)

## Global Configuration

### Setting Global Defaults
```bash
# 既定のサブスクリプションを設定する
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# 既定の場所を設定する
azd config set defaults.location "eastus2"

# 既定のリソースグループの命名規則を設定する
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# すべてのグローバル設定を表示する
azd config list

# 構成を削除する
azd config unset defaults.location
```

### Common Global Settings
```bash
# 開発の設定
azd config set alpha.enable true                    # アルファ機能を有効にする
azd config set telemetry.enabled false             # テレメトリを無効にする
azd config set output.format json                  # 出力形式を設定する

# セキュリティ設定
azd config set auth.useAzureCliCredential true     # 認証に Azure CLI を使用する
azd config set tls.insecure false                  # TLS 検証を強制する

# パフォーマンスの調整
azd config set provision.parallelism 5             # リソースの並列作成
azd config set deploy.timeout 30m                  # デプロイのタイムアウト
```

## 🏗️ Project Configuration

### azure.yaml Structure
`azure.yaml` ファイルは azd プロジェクトの中核です:

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
# 新しい環境を作成する
azd env new development

# 特定の場所で作成する
azd env new staging --location "westus2"

# テンプレートから作成する
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Environment Configuration
各環境は `.azure/<env-name>/config.json` に独自の構成を持ちます:

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
# 環境固有の変数を設定する
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# 環境変数を表示する
azd env get-values

# 期待される出力:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# 環境変数を削除する
azd env unset DEBUG

# 削除を確認する
azd env get-values | grep DEBUG
# (何も返さないはず)
```

### Environment Templates
一貫した環境セットアップのために `.azure/env.template` を作成してください:
```bash
# 必須の変数
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# アプリケーション設定
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# 任意の開発設定
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Authentication Configuration

### Azure CLI Integration
```bash
# Azure CLI の認証情報を使用（デフォルト）
azd config set auth.useAzureCliCredential true

# 特定のテナントでログイン
az login --tenant <tenant-id>

# デフォルトのサブスクリプションを設定
az account set --subscription <subscription-id>
```

### Service Principal Authentication
CI/CD パイプライン向け:
```bash
# 環境変数を設定する
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# または直接設定する
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
Azure ホスト環境向け:
```bash
# マネージド ID 認証を有効にする
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Infrastructure Configuration

### Bicep Parameters
`infra/main.parameters.json` でインフラパラメーターを構成します:
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
Terraform プロジェクトの場合は、`infra/terraform.tfvars` に構成します:
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
# 命名規則を設定する
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
# .azure/開発/.env
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
# .azure/本番/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Configuration Validation

### Validate Configuration
```bash
# 設定の構文を確認する
azd config validate

# 環境変数をテストする
azd env get-values

# インフラを検証する
azd provision --dry-run
```

### Configuration Scripts
`scripts/` に検証スクリプトを作成してください:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# 必要な環境変数を確認する
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml の構文を検証する
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
.azure/*/config.json         # 環境設定（リソースIDを含む）
.azure/*/.env               # 環境変数（機密情報を含む可能性がある）
.env                        # ローカル環境ファイル
```

### 4. Configuration Documentation
設定を `CONFIG.md` にドキュメント化してください:
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

**Goal**: 三つの異なる設定を持つ環境を作成して構成する

```bash
# 開発環境を作成する
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# ステージング環境を作成する
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# 本番環境を作成する
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# 各環境を検証する
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Success Criteria:**
- [ ] 三つの環境が正常に作成されている
- [ ] 各環境が固有の構成を持っている
- [ ] 環境間の切り替えがエラーなく行える
- [ ] `azd env list` が三つの環境すべてを表示する

### Exercise 2: Secret Management (10 minutes)

**Goal**: 機密データを用いた安全な構成を実践する

```bash
# シークレットを設定する（出力には表示されません）
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# 非機密の設定を行う
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# 環境を表示する（シークレットはマスクされるべき）
azd env get-values

# シークレットが保存されていることを確認する
azd env get DB_PASSWORD  # 実際の値を表示するはず
```

**Success Criteria:**
- [ ] シークレットがターミナルに表示されずに保存されている
- [ ] `azd env get-values` がマスクされたシークレットを表示する
- [ ] 個別の `azd env get <SECRET_NAME>` が実際の値を取得できる

## Next Steps

- [Your First Project](first-project.md) - 実践で構成を適用する
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - デプロイで構成を使用する
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - 本番対応の構成

## References

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 3 - Configuration & Authentication
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next Chapter**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **Next Lesson**: [Your First Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:
本書類は AI 翻訳サービス [Co-op トランスレーター](https://github.com/Azure/co-op-translator) を使用して翻訳されました。当社は正確性に努めていますが、自動翻訳には誤りや不正確な箇所が含まれることがある点にご注意ください。原文（原言語の文書）が権威ある情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の使用に起因するいかなる誤解や誤訳についても、当社は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->