# 設定ガイド

**章のナビゲーション:**
- **📚 コースホーム**: [AZD 入門](../../README.md)
- **📖 現在の章**: 第3章 - 設定と認証
- **⬅️ 前へ**: [最初のプロジェクト](first-project.md)
- **➡️ 次へ**: [デプロイ ガイド](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 次の章**: [第4章: インフラストラクチャをコードとして](../chapter-04-infrastructure/deployment-guide.md)

## はじめに

この包括的なガイドは、Azure Developer CLI を最適な開発およびデプロイワークフローのために構成するすべての側面を扱います。構成の階層、環境管理、認証方法、および効率的かつ安全な Azure デプロイを可能にする高度な構成パターンについて学びます。

## 学習目標

このレッスンの終わりまでに、あなたは以下を学びます:
- azd の設定階層を習得し、設定の優先順位を理解する
- グローバルおよびプロジェクト固有の設定を効果的に構成する
- 異なる構成を持つ複数の環境を管理する
- 安全な認証および認可パターンを実装する
- 複雑なシナリオに対応する高度な構成パターンを理解する

## 学習成果

このレッスンを完了した後、あなたは以下ができるようになります:
- 開発ワークフローに最適な azd の構成
- 複数のデプロイ環境のセットアップと管理
- 安全な構成管理の実践を実装
- 構成に関連する問題のトラブルシューティング
- 特定の組織要件に合わせた azd の動作のカスタマイズ

この包括的なガイドは、Azure Developer CLI を最適な開発およびデプロイワークフローのために構成するすべての側面を扱います。

## 設定階層

azd は階層化された構成システムを使用します:
1. **コマンドラインフラグ**（優先度：最も高い）
2. **環境変数**
3. **ローカルプロジェクト設定** (`.azd/config.json`)
4. **グローバルユーザー設定** (`~/.azd/config.json`)
5. **デフォルト値**（優先度：最も低い）

## グローバル設定

### グローバルのデフォルトを設定する
```bash
# 既定のサブスクリプションを設定
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# 既定のロケーションを設定
azd config set defaults.location "eastus2"

# 既定のリソースグループの命名規則を設定
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# すべてのグローバル設定を表示
azd config list

# 構成を削除
azd config unset defaults.location
```

### 一般的なグローバル設定
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

## 🏗️ プロジェクト設定

### azure.yaml の構成
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

### サービス構成オプション

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

# 特定の場所を指定して作成する
azd env new staging --location "westus2"

# テンプレートから作成する
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### 環境設定
各環境は `.azure/<env-name>/config.json` に独自の設定を持ちます:

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

### 環境テンプレート
一貫した環境設定のために `.azure/env.template` を作成します:
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

## 🔐 認証設定

### Azure CLI 統合
```bash
# Azure CLI の資格情報を使用する（デフォルト）
azd config set auth.useAzureCliCredential true

# 特定のテナントにログインする
az login --tenant <tenant-id>

# 既定のサブスクリプションを設定する
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

### マネージドID
Azure ホスト環境向け:
```bash
# マネージド ID 認証を有効にする
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ インフラストラクチャ設定

### Bicep パラメーター
インフラストラクチャのパラメーターを `infra/main.parameters.json` で構成します:
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
Terraform プロジェクトの場合、`infra/terraform.tfvars` で構成します:
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

### Docker 設定
例の `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 高度な設定

### カスタムリソース命名
```bash
# 命名規則を設定する
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

## 🎯 環境別設定

### 開発環境
```bash
# .azure/開発/.env
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
# .azure/本番/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 設定の検証

### 設定を検証する
```bash
# 設定の構文を確認する
azd config validate

# 環境変数をテストする
azd env get-values

# インフラストラクチャを検証する
azd provision --dry-run
```

### 設定スクリプト
バリデーションスクリプトを `scripts/` に作成します:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# 必要な環境変数をチェックする
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

### 3. バージョン管理に関する考慮事項
```bash
# .gitignore
.azure/*/config.json         # 環境設定（リソースIDを含む）
.azure/*/.env               # 環境変数（機密情報を含む可能性があります）
.env                        # ローカル環境ファイル
```

### 4. 設定のドキュメント化
設定を `CONFIG.md` に記録します:
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

## 🎯 ハンズオン演習

### 演習 1: マルチ環境構成（15分）

**目標**: 異なる設定を持つ3つの環境を作成して構成する

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

**達成基準:**
- [ ] 3つの環境が正常に作成されている
- [ ] 各環境が固有の構成を持っている
- [ ] エラーなく環境を切り替えられる
- [ ] `azd env list` が3つの環境をすべて表示する

### 演習 2: シークレット管理（10分）

**目標**: 機密データを使った安全な構成を実践する

```bash
# シークレットを設定する (出力には表示されません)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# 非シークレットの設定を行う
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# 環境を表示する (シークレットは伏せ字にされるはず)
azd env get-values

# シークレットが保存されていることを確認する
azd env get DB_PASSWORD  # 実際の値を表示するはず
```

**達成基準:**
- [ ] シークレットが端末に表示されずに保存されている
- [ ] `azd env get-values` がマスクされたシークレットを表示する
- [ ] 個別の `azd env get <SECRET_NAME>` が実際の値を取得する

## 次のステップ

- [最初のプロジェクト](first-project.md) - 実践で設定を適用する
- [デプロイ ガイド](../chapter-04-infrastructure/deployment-guide.md) - デプロイに設定を使用する
- [リソースのプロビジョニング](../chapter-04-infrastructure/provisioning.md) - 本番環境対応の構成

## 参考資料

- [azd 設定リファレンス](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml スキーマ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [環境変数](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**章のナビゲーション:**
- **📚 コースホーム**: [AZD 入門](../../README.md)
- **📖 現在の章**: 第3章 - 設定と認証
- **⬅️ 前へ**: [最初のプロジェクト](first-project.md)
- **➡️ 次へ**: [第4章: インフラストラクチャをコードとして](../chapter-04-infrastructure/deployment-guide.md)
- **次のレッスン**: [最初のプロジェクト](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責事項：
この文書は、AI翻訳サービス「Co-op Translator」（https://github.com/Azure/co-op-translator）を使用して翻訳されました。正確性の確保に努めておりますが、自動翻訳には誤りや不正確な表現が含まれる可能性があることをご承知おきください。正式かつ権威ある情報源は原文（原言語の文書）です。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じた誤解や解釈の相違について、当社は一切の責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->