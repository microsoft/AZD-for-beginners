<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8399160e4ce8c3eb6fd5d831f6602e18",
  "translation_date": "2025-11-19T18:35:31+00:00",
  "source_file": "docs/getting-started/configuration.md",
  "language_code": "ja"
}
-->
# 設定ガイド

**章のナビゲーション:**
- **📚 コースホーム**: [AZD 初心者向け](../../README.md)
- **📖 現在の章**: 第3章 - 設定と認証
- **⬅️ 前章**: [初めてのプロジェクト](first-project.md)
- **➡️ 次章**: [デプロイメントガイド](../deployment/deployment-guide.md)
- **🚀 次の章**: [第4章: インフラストラクチャをコード化](../deployment/deployment-guide.md)

## はじめに

この包括的なガイドでは、Azure Developer CLI を最適な開発およびデプロイメントワークフローに設定する方法を解説します。設定の階層構造、環境管理、認証方法、効率的かつ安全な Azure デプロイメントを可能にする高度な設定パターンについて学びます。

## 学習目標

このレッスンの終了時には以下を習得できます:
- azd の設定階層を理解し、設定の優先順位を把握する
- グローバルおよびプロジェクト固有の設定を効果的に構成する
- 異なる設定を持つ複数の環境を管理する
- 安全な認証と認可パターンを実装する
- 複雑なシナリオに対応する高度な設定パターンを理解する

## 学習成果

このレッスンを完了すると、以下ができるようになります:
- azd を最適な開発ワークフローに設定する
- 複数のデプロイメント環境をセットアップおよび管理する
- 安全な設定管理の実践を実装する
- 設定関連の問題をトラブルシュートする
- 特定の組織要件に合わせて azd の動作をカスタマイズする

この包括的なガイドでは、Azure Developer CLI を最適な開発およびデプロイメントワークフローに設定する方法を解説します。

## 設定階層

azd は階層的な設定システムを使用します:
1. **コマンドラインフラグ** (最優先)
2. **環境変数**
3. **ローカルプロジェクト設定** (`.azd/config.json`)
4. **グローバルユーザー設定** (`~/.azd/config.json`)
5. **デフォルト値** (最下位)

## グローバル設定

### グローバルデフォルトの設定
```bash
# デフォルトのサブスクリプションを設定する
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# デフォルトの場所を設定する
azd config set defaults.location "eastus2"

# デフォルトのリソースグループ命名規則を設定する
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# すべてのグローバル設定を表示する
azd config list

# 設定を削除する
azd config unset defaults.location
```

### 一般的なグローバル設定
```bash
# 開発の好み
azd config set alpha.enable true                    # アルファ機能を有効にする
azd config set telemetry.enabled false             # テレメトリを無効にする
azd config set output.format json                  # 出力形式を設定する

# セキュリティ設定
azd config set auth.useAzureCliCredential true     # 認証にAzure CLIを使用する
azd config set tls.insecure false                  # TLS検証を強制する

# パフォーマンス調整
azd config set provision.parallelism 5             # リソースの並列作成
azd config set deploy.timeout 30m                  # デプロイメントのタイムアウト
```

## 🏗️ プロジェクト設定

### azure.yaml の構造
`azure.yaml` ファイルは azd プロジェクトの中心です:

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
# 新しい環境を作成する
azd env new development

# 特定の場所で作成する
azd env new staging --location "westus2"

# テンプレートから作成する
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### 環境設定
各環境には `.azure/<env-name>/config.json` に独自の設定があります:

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
# 環境固有の変数を設定する
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# 環境変数を表示する
azd env get-values

# 予想される出力:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# 環境変数を削除する
azd env unset DEBUG

# 削除を確認する
azd env get-values | grep DEBUG
# (何も返さないはず)
```

### 環境テンプレート
一貫した環境セットアップのために `.azure/env.template` を作成します:
```bash
# 必須の変数
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# アプリケーション設定
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# オプションの開発設定
DEBUG=false
LOG_LEVEL=info
```

## 🔐 認証設定

### Azure CLI 統合
```bash
# Azure CLIの資格情報を使用する（デフォルト）
azd config set auth.useAzureCliCredential true

# 特定のテナントでログインする
az login --tenant <tenant-id>

# デフォルトのサブスクリプションを設定する
az account set --subscription <subscription-id>
```

### サービスプリンシパル認証
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

### マネージドアイデンティティ
Azure ホスト環境向け:
```bash
# 管理対象ID認証を有効にする
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ インフラストラクチャ設定

### Bicep パラメータ
`infra/main.parameters.json` でインフラストラクチャパラメータを設定します:
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
Terraform プロジェクトの場合、`infra/terraform.tfvars` で設定します:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 デプロイメント設定

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

例 `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 高度な設定

### カスタムリソース命名
```bash
# 名前付け規則を設定する
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
# 設定構文を確認する
azd config validate

# 環境変数をテストする
azd env get-values

# インフラを検証する
azd provision --dry-run
```

### 設定スクリプト
`scripts/` に検証スクリプトを作成します:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# 必須の環境変数を確認
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml の構文を検証
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
.azure/*/config.json         # 環境設定（リソースIDを含む）
.azure/*/.env               # 環境変数（秘密情報を含む可能性あり）
.env                        # ローカル環境ファイル
```

### 4. 設定のドキュメント化
`CONFIG.md` に設定をドキュメント化します:
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

## 🎯 実践練習問題

### 演習 1: マルチ環境設定 (15分)

**目標**: 異なる設定を持つ3つの環境を作成および設定する

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

# 各環境を確認する
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**成功基準:**
- [ ] 3つの環境が正常に作成される
- [ ] 各環境に固有の設定がある
- [ ] 環境間をエラーなく切り替えられる
- [ ] `azd env list` に3つの環境が表示される

### 演習 2: 秘密管理 (10分)

**目標**: 機密データを安全に設定する練習

```bash
# シークレットを設定する（出力には表示されません）
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# 非シークレットの設定を行う
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# 環境を表示する（シークレットはマスクされるべき）
azd env get-values

# シークレットが保存されていることを確認する
azd env get DB_PASSWORD  # 実際の値を表示するべき
```

**成功基準:**
- [ ] 秘密がターミナルに表示されずに保存される
- [ ] `azd env get-values` に秘密がマスクされて表示される
- [ ] 個別の `azd env get <SECRET_NAME>` で実際の値を取得できる

## 次のステップ

- [初めてのプロジェクト](first-project.md) - 設定を実践で適用する
- [デプロイメントガイド](../deployment/deployment-guide.md) - 設定をデプロイメントに活用する
- [リソースのプロビジョニング](../deployment/provisioning.md) - 本番対応の設定

## 参考資料

- [azd 設定リファレンス](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml スキーマ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [環境変数](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**章のナビゲーション:**
- **📚 コースホーム**: [AZD 初心者向け](../../README.md)
- **📖 現在の章**: 第3章 - 設定と認証
- **⬅️ 前章**: [初めてのプロジェクト](first-project.md)
- **➡️ 次の章**: [第4章: インフラストラクチャをコード化](../deployment/deployment-guide.md)
- **次のレッスン**: [初めてのプロジェクト](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:  
この文書は、AI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性を期すよう努めておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があります。原文（元の言語で記載された文書）を公式な情報源としてご参照ください。重要な情報については、専門の人間による翻訳をお勧めします。本翻訳の利用に起因する誤解や誤認について、当方は一切の責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->