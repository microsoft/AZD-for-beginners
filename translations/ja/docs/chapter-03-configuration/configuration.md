# 設定ガイド

**章のナビゲーション:**
- **📚 コースホーム**: [AZD入門](../../README.md)
- **📖 現在の章**: 第3章 - 設定と認証
- **⬅️ 前へ**: [最初のプロジェクト](first-project.md)
- **➡️ 次へ**: [デプロイガイド](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 次の章**: [第4章 - インフラをコードとして](../chapter-04-infrastructure/deployment-guide.md)

## はじめに

この包括的なガイドは、開発およびデプロイのワークフローを最適化するための Azure Developer CLI の設定に関するあらゆる側面を扱います。設定階層、環境管理、認証方法、および効率的かつ安全な Azure デプロイを可能にする高度な設定パターンについて学びます。

## 学習目標

このレッスンの最後までに、あなたは以下を達成できます:
- azd の設定階層を習得し、設定の優先順位の仕組みを理解する
- グローバルおよびプロジェクト固有の設定を効果的に構成する
- 異なる構成を持つ複数の環境を管理する
- 安全な認証および認可パターンを実装する
- 複雑なシナリオ向けの高度な設定パターンを理解する

## 学習成果

このレッスンを修了すると、次のことができるようになります:
- 開発ワークフローに最適な azd の設定
- 複数のデプロイ環境のセットアップと管理
- 安全な設定管理の実践的な実装
- 設定関連の問題のトラブルシューティング
- 組織固有の要件に合わせた azd のカスタマイズ

この包括的なガイドは、開発およびデプロイのワークフローを最適化するための Azure Developer CLI の設定に関するあらゆる側面を扱います。

## azd プロジェクトにおけるAIエージェントの理解

AI エージェントが初めての場合、azd の世界でそれらをどのように考えるかの簡単な説明です。

### エージェントとは何か？

エージェントは、リクエストを受け取り、それについて推論し、アクションを実行できるソフトウェアの一部です — 多くの場合 AI モデルを呼び出したり、データを参照したり、他のサービスを呼び出したりします。azd プロジェクトでは、エージェントは Web フロントエンドや API バックエンドと並ぶもう一つの <strong>サービス</strong> に過ぎません。

### エージェントが azd プロジェクト構成にどのように適合するか

azd プロジェクトは、<strong>インフラストラクチャ</strong>、<strong>コード</strong>、<strong>設定</strong> の3つのレイヤーで構成されています。エージェントは、他のサービスと同様にこれらのレイヤーに接続されます:

| レイヤー | 従来のアプリでの役割 | エージェントでの役割 |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | Web アプリとデータベースをプロビジョニングする | AI モデルのエンドポイント、検索インデックス、またはエージェントをホストするホストをプロビジョニングする |
| **Code** (`src/`) | フロントエンドと API のソースコードを含む | エージェントのロジックとプロンプト定義を含む |
| **Configuration** (`azure.yaml`) | サービスとそのホスティングターゲットを列挙する | エージェントをサービスとして列挙し、そのコードとホストを指す |

### `azure.yaml` の役割

今すぐ構文を暗記する必要はありません。概念的には、`azure.yaml` は azd に対してこう伝えるファイルです: *「これが私のアプリケーションを構成するサービスで、これがそのコードの場所です。」*

プロジェクトに AI エージェントが含まれる場合、`azure.yaml` は単にそのエージェントをサービスの一つとして列挙します。すると azd は適切なインフラ（Microsoft Foundry Models のエンドポイントやエージェントをホストする Container App など）をプロビジョニングし、Web アプリや API と同様にエージェントのコードをデプロイします。

つまり、根本的に新しいことを学ぶ必要はありません。azd が Web サービスを管理する方法を理解していれば、エージェントの管理方法も既に理解しています。

## 設定の階層

azd は階層的な設定システムを使用します:
1. <strong>コマンドラインフラグ</strong>（最優先）
2. <strong>環境変数</strong>
3. <strong>ローカルプロジェクト設定</strong>（`.azd/config.json`）
4. <strong>グローバルユーザー設定</strong>（`~/.azd/config.json`）
5. <strong>デフォルト値</strong>（最下位）

## グローバル設定

### グローバルデフォルトの設定
```bash
# 既定のサブスクリプションを設定する
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# 既定のロケーションを設定する
azd config set defaults.location "eastus2"

# 既定のリソースグループの命名規則を設定する
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# すべてのグローバル設定を表示する
azd config show

# 設定を削除する
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

# パフォーマンス調整
azd config set provision.parallelism 5             # リソースの並列作成
azd config set deploy.timeout 30m                  # デプロイのタイムアウト
```

## 🏗️ プロジェクト構成

### azure.yaml の構造
The `azure.yaml` file is the heart of your azd project:

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

#### ホストの種類
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
各環境は `.azure/<env-name>/config.json` に独自の設定を持っています:

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

### チーム間で環境を共有する

複数人でプロジェクトに取り組む場合、<strong>リポジトリに含めるものとローカルに留めるもの</strong>について合意する必要があります。azd は各環境を `.azure/` フォルダーの下に保持しますが、そのすべてがコミットされるべきではありません。

**`.azure/` に含まれるもの:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**gitignore に入れるもの。** azd のデフォルトの `.gitignore` はすでに `.azure/` を除外します。そのままにしてください — `.env` ファイルはシークレットを含む可能性があり、リソース ID はプロビジョニングした人物に固有です。各チームメンバーはローカルに<strong>自分の</strong>環境を作成します:

```bash
# 各開発者は自分の独立した環境を得るためにこれを一度実行します。
azd env new dev-alice
azd up
```

**環境の切り替え。** 複数の環境を管理する開発者は、コマンドを実行する前にアクティブな環境を選択します:

```bash
azd env list                 # すべてのローカル環境とどれがデフォルトかを表示する
azd env select staging       # 'staging' をアクティブな環境にする
azd env get-values           # 正しい環境を指しているか確認する
```

**チームに非シークレットのデフォルトを提供する。** 上記のようなテンプレート（`.azure/env.template` のような）をコミットして、誰がどの変数を設定すべきかを共有します — ただし記入済みの値をコミットしてはいけません。新しいメンバーはテンプレートをコピーして自分の値を記入します。

**CI/CD における環境。** パイプラインはローカルの `.azure/` フォルダーを読みません。代わりに、環境値をパイプライン変数/シークレットとして提供し、azd はプロセス環境からそれらを読み取ります:

```bash
# CIでは、azdはこれらを .azure/ ではなく環境から読み取ります
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **経験則：** インフラコード（`infra/`, `azure.yaml`）は Git で共有されますが、環境の<em>状態とシークレット</em>（`.azure/`）は開発者ごとおよびパイプラインごとに管理されます。`azd pipeline config` はパイプライン変数を自動的に設定します。

## 🔐 認証設定

### Azure CLI 統合
```bash
# Azure CLI の認証情報を使用（デフォルト）
azd config set auth.useAzureCliCredential true

# 特定のテナントでログイン
az login --tenant <tenant-id>

# デフォルトのサブスクリプションを設定
az account set --subscription <subscription-id>
```

### サービス プリンシパル認証
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

### マネージド アイデンティティ
Azure ホスト環境向け:
```bash
# マネージドID認証を有効にする
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ インフラ構成

### Bicep パラメータ
インフラパラメータを `infra/main.parameters.json` で構成します:
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
Terraform プロジェクトでは、`infra/terraform.tfvars` で構成します:
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
例 `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

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
# .azure/開発/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### ステージング環境
```bash
# .azure/ステージング/.env
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

### 設定の検証
```bash
# 設定の構文を確認する
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
.azure/*/.env               # 環境変数（秘密情報を含む可能性があります）
.env                        # ローカル環境ファイル
```

### 4. 設定のドキュメント化
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

## 🎯 ハンズオン練習

### 演習1：マルチ環境設定（15分）

<strong>目標</strong>：異なる設定を持つ3つの環境を作成して構成する

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
- [ ] 3 つの環境が正常に作成されている
- [ ] 各環境に固有の設定がある
- [ ] エラーなく環境を切り替えられる
- [ ] `azd env list` が 3 つすべての環境を表示する

### 演習2：シークレット管理（10分）

<strong>目標</strong>：機密データを使った安全な設定を練習する

```bash
# シークレットを設定する（出力には表示されない）
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# 非シークレットの設定を行う
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# 環境を表示する（シークレットは伏せられているはず）
azd env get-values

# シークレットが保存されていることを確認する
azd env get DB_PASSWORD  # 実際の値を表示するはず
```

**成功基準:**
- [ ] シークレットが端末に表示されずに保存されている
- [ ] `azd env get-values` がマスキングされたシークレットを表示する
- [ ] `azd env get <SECRET_NAME>` が個別に実際の値を取得できる

## 次のステップ

- [最初のプロジェクト](first-project.md) - 設定を実践で適用する
- [デプロイガイド](../chapter-04-infrastructure/deployment-guide.md) - デプロイに設定を使用する
- [リソースのプロビジョニング](../chapter-04-infrastructure/provisioning.md) - 本番用の設定

## 参考資料

- [azd 設定リファレンス](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml スキーマ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [環境変数](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**章のナビゲーション:**
- **📚 コースホーム**: [AZD入門](../../README.md)
- **📖 現在の章**: 第3章 - 設定と認証
- **⬅️ 前へ**: [最初のプロジェクト](first-project.md)
- **➡️ 次へ**: [第4章 - インフラをコードとして](../chapter-04-infrastructure/deployment-guide.md)
- <strong>次のレッスン</strong>: [最初のプロジェクト](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->