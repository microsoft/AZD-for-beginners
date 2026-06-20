# デプロイガイド - AZD デプロイの習得

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 4 - Infrastructure as Code & Deployment
- **⬅️ Previous Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)
- **➡️ Next**: [Provisioning Resources](provisioning.md)
- **🧩 Also in this chapter**: [Authoring Your Own Template](custom-templates.md)
- **🚀 Next Chapter**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)

## Introduction

この総合ガイドでは、Azure Developer CLI を使用したアプリケーションのデプロイに関して、単純なワンコマンドデプロイからカスタムフック、複数環境、CI/CD 統合を伴う本番シナリオまで、必要なすべてを取り扱います。実践的な例とベストプラクティスでデプロイライフサイクルを習得しましょう。

## Learning Goals

このガイドを完了すると、以下を達成できます:
- Azure Developer CLI のすべてのデプロイコマンドとワークフローを習得する
- プロビジョニングからモニタリングまでの完全なデプロイライフサイクルを理解する
- デプロイ前後の自動化のためのカスタムフックを実装する
- 環境固有のパラメータを用いた複数環境の構成を行う
- ブルーグリーンやカナリアなどの高度なデプロイ戦略を設定する
- azd デプロイを CI/CD パイプラインや DevOps ワークフローに統合する

## Learning Outcomes

完了後、以下ができるようになります:
- すべての `azd` デプロイワークフローを単独で実行およびトラブルシュートする
- フックを用いたカスタムデプロイ自動化を設計・実装する
- 適切なセキュリティとモニタリングを備えた本番対応デプロイを構成する
- 複雑なマルチ環境デプロイシナリオを管理する
- デプロイパフォーマンスを最適化し、ロールバック戦略を実装する
- `azd` デプロイをエンタープライズの DevOps 実践に統合する

## Deployment Overview

Azure Developer CLI はいくつかのデプロイコマンドを提供します:
- `azd up` - 完全ワークフロー（プロビジョン + デプロイ）
- `azd provision` - Azure リソースの作成/更新のみ
- `azd deploy` - アプリケーションコードのデプロイのみ
- `azd package` - アプリケーションのビルドとパッケージ化

## Basic Deployment Workflows

### Complete Deployment (azd up)
新規プロジェクトで最も一般的なワークフロー:
```bash
# すべてを最初からデプロイする
azd up

# 特定の環境でデプロイする
azd up --environment production

# カスタムパラメータでデプロイする
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Infrastructure-Only Deployment
Azure リソースだけを更新する必要がある場合:
```bash
# インフラをプロビジョニング/更新する
azd provision

# 変更をプレビューするためにドライランでプロビジョニングする
azd provision --preview

# 特定のサービスをプロビジョニングする
azd provision --service database
```

### Code-Only Deployment
アプリケーションの素早い更新の場合:
```bash
# すべてのサービスをデプロイする
azd deploy

# 期待される出力:
# サービスをデプロイしています (azd deploy)
# - web: デプロイ中... 完了
# - api: デプロイ中... 完了
# 成功: デプロイは2分15秒で完了しました

# 特定のサービスをデプロイする
azd deploy --service web
azd deploy --service api

# カスタムビルド引数でデプロイする
azd deploy --service api --build-arg NODE_ENV=production

# デプロイを検証する
azd show --output json | jq '.services'
```

### ✅ Deployment Verification

デプロイ後は必ず成功を確認してください:

```bash
# すべてのサービスが稼働していることを確認する
azd show

# ヘルスエンドポイントをテストする
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# エラーを監視する（既定ではブラウザで開く）
azd monitor --logs
```

**Success Criteria:**
- ✅ すべてのサービスが「Running」ステータスを示している
- ✅ ヘルスエンドポイントが HTTP 200 を返す
- ✅ 過去5分間にエラーログがない
- ✅ アプリケーションがテストリクエストに応答する

## 🏗️ デプロイプロセスの理解

### フックが初めてですか？ここから始めましょう

<strong>フック</strong>は、azd がデプロイ処理の特定のタイミング（プロビジョニングの前後、コードデプロイの前後など）で自動的に実行するコマンドです。フックを使うことで、デプロイに常につきまとう小さな作業を自動化できます：データベースのシード、マイグレーションの実行、アセットのビルド、ライブアプリのスモークテストなど。

| Hook | Runs… | Common use |
|------|-------|------------|
| `preprovision` | プロビジョン前に実行される | 前提条件の検証、レジストリへのログイン |
| `postprovision` | リソース作成後に実行される | リソースの構成、データベースの設定 |
| `predeploy` | コードデプロイ前に実行される | フロントエンド資産のビルド、ユニットテストの実行 |
| `postdeploy` | コード公開後に実行される | DB マイグレーションの実行、エンドポイントのスモークテスト |

フックはあなたの `azure.yaml` に記述します。以下は最小の例で、デプロイ後にメッセージを表示するだけです:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

以上です—次回 `azd up` を実行すると、そのメッセージが自動的に表示されます。フルデプロイを行わずにフック単体で実行することもでき、テストに便利です:

```bash
azd hooks run postdeploy
```

以下のフェーズには、各段階での実際のフック（マイグレーション、テスト、バリデーション）を示しています。

### フェーズ 1: Pre-Provision フック
```yaml
# azure.yaml
hooks:
  preprovision:
    shell: sh
    run: |
      echo "Validating configuration..."
      ./scripts/validate-prereqs.sh
      
      echo "Setting up secrets..."
      ./scripts/setup-secrets.sh
```

### フェーズ 2: インフラのプロビジョニング
- インフラテンプレート（Bicep/Terraform）を読み込む
- Azure リソースを作成または更新する
- ネットワーキングとセキュリティを構成する
- モニタリングとログの設定を行う

### フェーズ 3: Post-Provision フック
```yaml
hooks:
  postprovision:
    shell: pwsh
    run: |
      Write-Host "Infrastructure ready, setting up databases..."
      ./scripts/setup-database.ps1
      
      Write-Host "Configuring application settings..."
      ./scripts/configure-app-settings.ps1
```

### フェーズ 4: アプリケーションのパッケージ化
- アプリケーションコードをビルドする
- デプロイ用アーティファクトを作成する
- 対象プラットフォーム向けにパッケージ化する（コンテナ、ZIP など）

### フェーズ 5: Pre-Deploy フック
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      echo "Running pre-deployment tests..."
      npm run test:unit
      
      echo "Database migrations..."
      npm run db:migrate
```

### フェーズ 6: アプリケーションのデプロイ
- パッケージ化されたアプリケーションを Azure サービスにデプロイする
- 設定を更新する
- サービスを開始/再起動する

### フェーズ 7: Post-Deploy フック
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl https://${WEB_URL}/health
```

### フックエラーの処理

デフォルトでは、<strong>フックコマンドが非ゼロコードで終了すると、azd は全体の操作を停止します。</strong>これは通常望ましい挙動です—失敗したマイグレーションは壊れたアプリを出荷するよりもデプロイを止めるべきです。ただし、フックは慎重に記述する必要があります。

**1. 失敗を明確かつ意図的にする。** フックは最後のコマンドが非ゼロ終了コードを返すと失敗します。シェルスクリプトでは `set -e` を追加して、最初の失敗でフックが停止するようにしてください（継続して静かに進行するのを防ぐ）:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. azd を停止させずにフックの失敗を許容する。** 重要度の低いステップ（任意のキャッシュウォームアップ、ベストエフォートの通知など）には `continueOnError: true` を設定します。azd は失敗をログに残しますが処理を続行します:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. フル実行の前にフックを単独でテストする。** デバッグのために `azd up` を実行する必要はありません—フックを単体で実行して迅速に反復できます:

```bash
azd hooks run predeploy          # predeploy フックだけを実行します
azd hooks run postdeploy --service api
```

**4. OS 固有のシェルに注意する。** `shell: pwsh` を使用するフックは、実行マシン（CI エージェント含む）に PowerShell がインストールされている必要があります。最も広い互換性を得るには `shell: sh` を使用するか、`windows` と `posix` の両方のバリアントを用意してください:

```yaml
hooks:
  postprovision:
    posix:
      shell: sh
      run: ./scripts/setup.sh
    windows:
      shell: pwsh
      run: ./scripts/setup.ps1
```

> **デバッグのコツ:** フックがローカルで動作するのに CI で失敗する場合、任意の azd コマンドを `--debug` 付きで実行すると、正確なフックのコマンドラインとその完全な出力が確認でき、非常に有用です。

## 🎛️ デプロイ構成

### サービス固有のデプロイ設定
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    buildCommand: npm run build
    outputPath: dist
    
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
    env:
      - name: NODE_ENV
        value: production
      - name: API_VERSION
        value: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    runtime: node
    buildCommand: npm install --production
```

### 環境固有の構成
```bash
# 開発環境
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# ステージング環境
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# 本番環境
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 高度なデプロイシナリオ

### マルチサービスアプリケーション
```yaml
# Complex application with multiple services
services:
  # Frontend applications
  web-app:
    project: ./src/web
    host: staticwebapp
  
  admin-portal:
    project: ./src/admin
    host: appservice
    
  # Backend services
  user-api:
    project: ./src/services/users
    host: containerapp
    
  order-api:
    project: ./src/services/orders
    host: containerapp
    
  payment-api:
    project: ./src/services/payments
    host: function
    
  # Background processing
  notification-worker:
    project: ./src/workers/notifications
    host: containerapp
    
  report-worker:
    project: ./src/workers/reports
    host: function
```

### ブルーグリーンデプロイメント
```bash
# ブルー環境を作成する
azd env new production-blue
azd up --environment production-blue

# ブルー環境をテストする
./scripts/test-environment.sh production-blue

# トラフィックをブルーに切り替える（DNS/ロードバランサーを手動で更新）
./scripts/switch-traffic.sh production-blue

# グリーン環境をクリーンアップする
azd env select production-green
azd down --force
```

### カナリアデプロイメント
```yaml
# azure.yaml - Configure traffic splitting
services:
  api:
    project: ./src/api
    host: containerapp
    trafficSplit:
      - revision: stable
        percentage: 90
      - revision: canary
        percentage: 10
```

### ステージドデプロイメント
```bash
#!/bin/bash
# deploy-staged.sh

echo "Deploying to development..."
azd env select dev
azd up --confirm-with-no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --confirm-with-no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --confirm-with-no-prompt
    
    echo "Running production smoke tests..."
    ./scripts/test-environment.sh production
fi
```

## 🐳 コンテナデプロイ

### Container App のデプロイ
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
        BUILD_VERSION: ${BUILD_VERSION}
        NODE_ENV: production
    env:
      - name: DATABASE_URL
        value: ${DATABASE_URL}
    secrets:
      - name: jwt-secret
        value: ${JWT_SECRET}
    scale:
      minReplicas: 1
      maxReplicas: 10
```

### マルチステージ Dockerfile の最適化
```dockerfile
# Dockerfile
FROM node:18-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci --only=production
COPY . .
RUN npm run build

FROM node:18-alpine AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./
EXPOSE 3000
CMD ["npm", "start"]
```

## ⚡ パフォーマンス最適化

### サービス固有のデプロイ
```bash
# 迅速な反復のために特定のサービスをデプロイする
azd deploy --service web
azd deploy --service api

# すべてのサービスをデプロイする
azd deploy
```

### ビルドキャッシュ
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### 効率的なコードデプロイ
```bash
# コードのみの変更には azd up ではなく azd deploy を使用してください
# これによりインフラのプロビジョニングがスキップされ、はるかに高速になります
azd deploy

# 反復を最速にするには、特定のサービスのみをデプロイしてください
azd deploy --service api
```

## 🔍 デプロイモニタリング

### リアルタイムデプロイ監視
```bash
# アプリケーションをリアルタイムで監視する
azd monitor --live

# アプリケーションのログを表示する
azd monitor --logs

# デプロイ状況を確認する
azd show
```

### ヘルスチェック
```yaml
# azure.yaml - Configure health checks
services:
  api:
    project: ./src/api
    host: containerapp
    healthCheck:
      path: /health
      interval: 30s
      timeout: 10s
      retries: 3
```

### デプロイ後の検証
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# アプリケーションの正常性を確認する
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing web application..."
if curl -f "$WEB_URL/health"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/health"; then
    echo "✅ API is healthy"
else
    echo "❌ API health check failed"
    exit 1
fi

echo "Running integration tests..."
npm run test:integration

echo "✅ Deployment validation completed successfully"
```

## 🔐 セキュリティに関する考慮事項

### シークレット管理
```bash
# シークレットを安全に保存する
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml内のシークレットを参照する
```

```yaml
services:
  api:
    secrets:
      - name: database-password
        value: ${DATABASE_PASSWORD}
      - name: jwt-secret
        value: ${JWT_SECRET}
```

### ネットワークセキュリティ
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### アイデンティティとアクセス管理
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    identity:
      type: systemAssigned
    keyVault:
      - name: app-secrets
        secrets:
          - database-connection
          - external-api-key
```

## 🚨 ロールバック戦略

### クイックロールバック
```bash
# AZDには組み込みのロールバック機能がありません。推奨される方法:

# オプション1: Gitから再デプロイ（推奨）
git revert HEAD  # 問題のあるコミットを元に戻す
git push
azd deploy

# オプション2: 特定のコミットを再デプロイする
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### インフラのロールバック
```bash
# 適用前にインフラの変更をプレビューする
azd provision --preview

# インフラのロールバックにはバージョン管理を使用する:
git revert HEAD  # インフラの変更を元に戻す
azd provision    # 以前のインフラ状態を適用する
```

### データベースマイグレーションのロールバック
```bash
#!/bin/bash
# scripts/データベースのロールバック.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 デプロイ指標

### デプロイパフォーマンスの追跡
```bash
# 現在のデプロイ状況を表示
azd show

# Application Insightsでアプリケーションを監視する
azd monitor --overview

# ライブメトリクスを表示
azd monitor --live
```

### カスタムメトリクスの収集
```yaml
# azure.yaml - Configure custom metrics
hooks:
  postdeploy:
    shell: sh
    run: |
      # Record deployment metrics
      DEPLOY_TIME=$(date +%s)
      SERVICE_COUNT=$(azd show --output json | jq '.services | length')
      
      # Send to monitoring system
      curl -X POST "https://metrics.company.com/deployments" \
        -H "Content-Type: application/json" \
        -d "{\"timestamp\": $DEPLOY_TIME, \"service_count\": $SERVICE_COUNT}"
```

## 🎯 ベストプラクティス

### 1. 環境の一貫性
```bash
# 命名を一貫させる
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# 環境の整合性を維持する
./scripts/sync-environments.sh
```

### 2. インフラの検証
```bash
# 展開前にインフラの変更をプレビューする
azd provision --preview

# ARM/Bicep のリンティングを使用する
az bicep lint --file infra/main.bicep

# Bicep の構文を検証する
az bicep build --file infra/main.bicep
```

### 3. テストとの統合
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      # Unit tests
      npm run test:unit
      
      # Security scanning
      npm audit
      
      # Code quality checks
      npm run lint
      npm run type-check
      
  postdeploy:
    shell: sh
    run: |
      # Integration tests
      npm run test:integration
      
      # Performance tests
      npm run test:performance
      
      # Smoke tests
      npm run test:smoke
```

### 4. ドキュメントとログ
```bash
# デプロイ手順を文書化する
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Next Steps

- [Provisioning Resources](provisioning.md) - インフラ管理の詳細解説
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - デプロイ戦略の計画
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - デプロイの問題解決
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - 本番対応のデプロイ戦略

## 🎯 ハンズオンデプロイ演習

### 演習 1: インクリメンタルデプロイワークフロー（20 分）
**Goal**: フルデプロイとインクリメンタルデプロイの違いを習得する

```bash
# 初期デプロイ
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# 初期デプロイの時刻を記録する
echo "Full deployment: $(date)" > deployment-log.txt

# コードに変更を加える
echo "// Updated $(date)" >> src/api/src/server.js

# コードのみをデプロイする（高速）
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# 時間を比較する
cat deployment-log.txt

# クリーンアップする
azd down --force --purge
```

**Success Criteria:**
- [ ] フルデプロイが 5-15 分で完了する
- [ ] コードのみのデプロイが 2-5 分で完了する
- [ ] デプロイされたアプリにコード変更が反映される
- [ ] `azd deploy` 後もインフラは変更されない

**Learning Outcome**: コード変更では `azd deploy` は `azd up` より 50-70% 速い

### 演習 2: カスタムデプロイフック（30 分）
**Goal**: デプロイ前後の自動化を実装する

```bash
# デプロイ前の検証スクリプトを作成する
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# テストが通るか確認する
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# コミットされていない変更がないか確認する
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# デプロイ後のスモークテストを作成する
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')

if curl -f "$WEB_URL/health"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# azure.yamlにフックを追加する
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# フック付きでデプロイをテストする
azd deploy
```

**Success Criteria:**
- [ ] デプロイスクリプトがデプロイ前に実行される
- [ ] テストが失敗した場合デプロイが中止される
- [ ] デプロイ後のスモークテストでヘルスが検証される
- [ ] フックが正しい順序で実行される

### 演習 3: マルチ環境デプロイ戦略（45 分）
**Goal**: ステージドデプロイワークフロー（dev → staging → production）を実装する

```bash
# デプロイ用スクリプトを作成する
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# ステップ1: 開発環境にデプロイする
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ステップ2: ステージング環境にデプロイする
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ステップ3: 本番環境への手動承認
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# 環境を作成する
azd env new dev
azd env new staging
azd env new production

# 段階的なデプロイを実行する
./deploy-staged.sh
```

**Success Criteria:**
- [ ] Dev 環境が正常にデプロイされる
- [ ] Staging 環境が正常にデプロイされる
- [ ] Production には手動承認が必要である
- [ ] すべての環境でヘルスチェックが動作している
- [ ] 必要に応じてロールバックできる

### 演習 4: ロールバック戦略（25 分）
**Goal**: Git を使ったデプロイのロールバックを実装・テストする

```bash
# v1 をデプロイ
azd env set APP_VERSION "1.0.0"
azd up

# v1 のコミットハッシュを保存
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# 破壊的変更を含む v2 をデプロイ
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# 障害を検出してロールバックする
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git を使ってロールバックする
    git revert HEAD --no-edit
    
    # 環境をロールバックする
    azd env set APP_VERSION "1.0.0"
    
    # v1 を再デプロイ
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Success Criteria:**
- [ ] デプロイ失敗を検出できる
- [ ] ロールバックスクリプトが自動実行される
- [ ] アプリケーションが正常な状態に戻る
- [ ] ロールバック後にヘルスチェックが通る

## 📊 デプロイ指標の追跡

### デプロイパフォーマンスを追跡する

```bash
# デプロイ用のメトリクススクリプトを作成する
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# ファイルにログを出力する
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# それを使う
./track-deployment.sh
```

**メトリクスを分析する:**
```bash
# デプロイ履歴を表示
cat deployment-metrics.csv

# 平均デプロイ時間を計算する
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## 追加リソース

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigation**
- **Previous Lesson**: [Your First Project](../chapter-01-foundation/first-project.md)
- **Next Lesson**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->