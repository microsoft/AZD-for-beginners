# 設定ガイド

**章ナビゲーション:**
- **📚 Course Home**: [AZD 入門](../../README.md)
- **📖 Current Chapter**: 第3章 - 設定と認証
- **⬅️ Previous**: [最初のプロジェクト](first-project.md)
- **➡️ Next**: [デプロイガイド](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Next Chapter**: [第4章: インフラストラクチャをコードとして](../chapter-04-infrastructure/deployment-guide.md)

## はじめに

この包括的なガイドは、開発およびデプロイのワークフローを最適化するための Azure Developer CLI の設定に関するあらゆる側面を扱います。設定階層、環境管理、認証方法、および効率的で安全な Azure デプロイを可能にする高度な設定パターンについて学びます。

## 学習目標

このレッスンの終わりまでに、あなたは以下を習得します:
- azd の設定階層をマスターし、設定の優先順位の付け方を理解する
- グローバルおよびプロジェクト固有の設定を効果的に構成する
- 異なる構成を持つ複数の環境を管理する
- 安全な認証および認可パターンを実装する
- 複雑なシナリオ向けの高度な設定パターンを理解する

## 学習成果

このレッスンを修了すると、あなたは以下ができるようになります:
- 最適な開発ワークフローのために azd を設定する
- 複数のデプロイ環境をセットアップして管理する
- 安全な設定管理の実践を実装する
- 設定に関連する問題をトラブルシューティングする
- 特定の組織要件に合わせて azd の動作をカスタマイズする

この包括的なガイドは、開発およびデプロイのワークフローを最適化するための Azure Developer CLI の設定に関するあらゆる側面を扱います。

## azd プロジェクトにおける AI エージェントの理解

AI エージェントが初めての方のために、azd の世界での扱い方を簡単に説明します。

### エージェントとは何か

エージェントは、リクエストを受け取り、推論を行い、アクションを実行できるソフトウェアです — 多くの場合、AI モデルを呼び出したり、データを参照したり、他のサービスを呼び出したりします。azd プロジェクトでは、エージェントはウェブフロントエンドや API バックエンドと並ぶ別の <strong>サービス</strong> に過ぎません。

### エージェントが azd プロジェクト構造にどのように適合するか

azd プロジェクトは、**infrastructure**、**code**、および **configuration** の3層で構成されています。エージェントは他のサービスと同様にこれらの層に組み込まれます:

| レイヤー | 従来アプリでの役割 | エージェントでの役割 |
|-------|-------------------------------------|---------------------------|
| <strong>インフラストラクチャ</strong> (`infra/`) | Web アプリとデータベースをプロビジョニングします | AI モデルエンドポイント、検索インデックス、またはエージェントホストをプロビジョニングします |
| <strong>コード</strong> (`src/`) | フロントエンドと API のソースコードを含みます | エージェントのロジックとプロンプト定義を含みます |
| <strong>設定</strong> (`azure.yaml`) | サービスとそのホスティングターゲットを一覧化します | エージェントをサービスとして一覧化し、そのコードとホストを指します |

### The Role of `azure.yaml`

構文を今すぐ暗記する必要はありません。概念的には、`azure.yaml` は azd に *「これは私のアプリケーションを構成するサービスであり、ここでそれらのコードが見つかります。」* と伝えるファイルです。

プロジェクトに AI エージェントが含まれている場合、`azure.yaml` は単にそのエージェントをサービスの一つとしてリストします。azd は Microsoft Foundry Models のエンドポイントやコンテナアプリなど、適切なインフラストラクチャをプロビジョニングし、エージェントのコードをデプロイすることを認識します — ちょうどウェブアプリや API の場合と同様です。

つまり、根本的に新しく学ぶことは何もありません。azd がウェブサービスを管理する方法を理解していれば、エージェントの管理方法もすでに理解しています。

## 設定の階層

azd は階層的な設定システムを使用します:
1. <strong>コマンドラインフラグ</strong> (最優先)
2. <strong>環境変数</strong>
3. <strong>ローカルプロジェクト設定</strong> (`.azd/config.json`)
4. <strong>グローバルユーザー設定</strong> (`~/.azd/config.json`)
5. <strong>デフォルト値</strong> (最も低い優先度)

## グローバル設定

### グローバルのデフォルト設定
```bash
# デフォルトのサブスクリプションを設定する
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# デフォルトの場所を設定する
azd config set defaults.location "eastus2"

# デフォルトのリソースグループの命名規則を設定する
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# すべてのグローバル設定を表示する
azd config show

# 設定を削除する
azd config unset defaults.location
```

### 共通のグローバル設定
```bash
# 開発の設定
azd config set alpha.enable true                    # アルファ機能を有効にする
azd config set telemetry.enabled false             # テレメトリを無効にする
azd config set output.format json                  # 出力形式を設定

# セキュリティ設定
azd config set auth.useAzureCliCredential true     # 認証に Azure CLI を使用する
azd config set tls.insecure false                  # TLS 検証を強制する

# パフォーマンス調整
azd config set provision.parallelism 5             # リソースの並列作成
azd config set deploy.timeout 30m                  # デプロイのタイムアウト
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
各環境は `.azure/<env-name>/config.json` に固有の設定を持ちます:

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

# 期待される出力：
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

# 任意の開発設定
DEBUG=false
LOG_LEVEL=info
```

## 🔐 認証設定

### Azure CLI 統合
```bash
# Azure CLI の資格情報を使用する（既定）
azd config set auth.useAzureCliCredential true

# 特定のテナントでログインする
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

### マネージド ID
Azure ホスト環境向け:
```bash
# マネージドID認証を有効にする
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ インフラ設定

### Bicep パラメーター
インフラパラメーターを `infra/main.parameters.json` で構成します:
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
Terraform プロジェクトの場合は、`infra/terraform.tfvars` で構成します:
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

### 監視設定
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
# 設定の構文を確認する
azd config validate

# 環境変数をテストする
azd env get-values

# インフラストラクチャを検証する
azd provision --dry-run
```

### 設定スクリプト
検証スクリプトを `scripts/` に作成します:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# 必須の環境変数を確認する
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
.azure/*/.env               # 環境変数（機密情報を含む可能性がある）
.env                        # ローカル環境ファイル
```

### 4. 設定ドキュメント
設定を `CONFIG.md` にドキュメント化します:
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

### 演習1: マルチ環境設定（15分）

<strong>目標</strong>: 異なる設定を持つ3つの環境を作成して設定する

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

**成功基準:**
- [ ] 3つの環境が正常に作成されている
- [ ] 各環境が固有の設定を持っている
- [ ] エラーなく環境間を切り替えられる
- [ ] `azd env list` が3つの環境すべてを表示する

### 演習2: シークレット管理（10分）

<strong>目標</strong>: 機密データを使った安全な設定を実践する

```bash
# シークレットを設定する（出力には表示されません）
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# 非シークレットの設定を行う
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# 環境を表示する（シークレットは伏せられているはずです）
azd env get-values

# シークレットが保存されていることを確認する
azd env get DB_PASSWORD  # 実際の値を表示するはずです
```

**成功基準:**
- [ ] シークレットがターミナルに表示されることなく保存されている
- [ ] `azd env get-values` がマスクされたシークレットを表示する
- [ ] 個別の `azd env get <SECRET_NAME>` が実際の値を取得する

## 次のステップ

- [最初のプロジェクト](first-project.md) - 設定を実際に適用する
- [デプロイガイド](../chapter-04-infrastructure/deployment-guide.md) - デプロイに設定を使用する
- [リソースのプロビジョニング](../chapter-04-infrastructure/provisioning.md) - 本番向けの設定

## 参考資料

- [azd 設定リファレンス](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml スキーマ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [環境変数](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**章ナビゲーション:**
- **📚 Course Home**: [AZD 入門](../../README.md)
- **📖 Current Chapter**: 第3章 - 設定と認証
- **⬅️ Previous**: [最初のプロジェクト](first-project.md)
- **➡️ Next Chapter**: [第4章: インフラストラクチャをコードとして](../chapter-04-infrastructure/deployment-guide.md)
- **Next Lesson**: [最初のプロジェクト](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:
本書類は AI 翻訳サービス [Co-op トランスレーター](https://github.com/Azure/co-op-translator) を使用して翻訳されました。正確さを期すよう努めていますが、自動翻訳には誤りや不正確な箇所が含まれる可能性があることをご承知おきください。原文（原言語）の文書を正式な情報源とみなしてください。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の使用により生じた誤解や解釈の相違について、当社は一切責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->