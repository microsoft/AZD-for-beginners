# Deployment Guide - Mastering AZD Deployments

**チャプター ナビゲーション:**
- **📚 コースホーム**: [AZD入門](../../README.md)
- **📖 現在の章**: 第4章 - Infrastructure as Code & Deployment
- **⬅️ 前の章**: [第3章: 設定](../chapter-03-configuration/configuration.md)
- **➡️ 次へ**: [リソースのプロビジョニング](provisioning.md)
- **🚀 次の章**: [第5章: マルチエージェントAIソリューション](../../examples/retail-scenario.md)

## はじめに

この包括的なガイドは、Azure Developer CLI を使用したアプリケーションのデプロイに関する基本的なワンコマンドデプロイから、カスタムフック、複数環境、CI/CD 統合を伴う高度な本番シナリオまで、必要なあらゆる事項をカバーします。実践的な例とベストプラクティスでデプロイのライフサイクルを習得します。

## 学習目標

このガイドを完了することで、あなたは次のことができるようになります:
- Azure Developer CLI のすべてのデプロイコマンドとワークフローを習得する
- プロビジョニングから監視までの完全なデプロイライフサイクルを理解する
- デプロイ前後の自動化のためのカスタムデプロイフックを実装する
- 環境固有のパラメーターを持つ複数環境を構成する
- ブルーグリーンやカナリアなどの高度なデプロイ戦略を設定する
- azd デプロイを CI/CD パイプラインや DevOps ワークフローに統合する

## 学習成果

完了後、あなたは次のことができるようになります:
- すべての azd デプロイワークフローを独立して実行およびトラブルシュートする
- フックを使用したカスタムデプロイ自動化を設計および実装する
- 適切なセキュリティと監視を備えた本番対応のデプロイを構成する
- 複雑なマルチ環境デプロイシナリオを管理する
- デプロイパフォーマンスを最適化し、ロールバック戦略を実装する
- azd デプロイを企業の DevOps プラクティスに統合する

## デプロイ概要

Azure Developer CLI はいくつかのデプロイコマンドを提供します:
- `azd up` - 完全なワークフロー（プロビジョン + デプロイ）
- `azd provision` - Azure リソースの作成/更新のみ
- `azd deploy` - アプリケーションコードのデプロイのみ
- `azd package` - アプリケーションのビルドとパッケージ

## 基本的なデプロイワークフロー

### 完全なデプロイ (azd up)
新しいプロジェクトで最も一般的なワークフロー:
```bash
# ゼロからすべてをデプロイする
azd up

# 特定の環境でデプロイする
azd up --environment production

# カスタムパラメータでデプロイする
azd up --parameter location=westus2 --parameter sku=P1v2
```

### インフラのみのデプロイ
Azure リソースのみを更新する必要がある場合:
```bash
# インフラをプロビジョニング／更新する
azd provision

# 変更をプレビューするためにドライランでプロビジョニングする
azd provision --preview

# 特定のサービスをプロビジョニングする
azd provision --service database
```

### コードのみのデプロイ
アプリケーションの迅速な更新向け:
```bash
# すべてのサービスをデプロイする
azd deploy

# 予想される出力:
# サービスをデプロイしています（azd deploy）
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

### ✅ デプロイ検証

任意のデプロイ後に、成功を検証します:

```bash
# すべてのサービスが稼働していることを確認する
azd show

# ヘルスエンドポイントをテストする
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# エラーを監視する（デフォルトではブラウザで開きます）
azd monitor --logs
```

**成功基準:**
- ✅ すべてのサービスが「Running」ステータスを示している
- ✅ ヘルスエンドポイントが HTTP 200 を返す
- ✅ 過去5分間にエラーログがない
- ✅ アプリケーションがテストリクエストに応答する

## 🏗️ デプロイプロセスの理解

### フェーズ1: プロビジョン前フック
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

### フェーズ2: インフラのプロビジョニング
- インフラテンプレート（Bicep/Terraform）を読み取る
- Azure リソースを作成または更新する
- ネットワーキングとセキュリティを構成する
- 監視とログを設定する

### フェーズ3: プロビジョン後フック
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

### フェーズ4: アプリケーションのパッケージング
- アプリケーションコードをビルドする
- デプロイアーティファクトを作成する
- 対象プラットフォーム向けにパッケージする（コンテナ、ZIP ファイルなど）

### フェーズ5: デプロイ前フック
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

### フェーズ6: アプリケーションのデプロイ
- パッケージ化されたアプリケーションを Azure サービスにデプロイする
- 設定を更新する
- サービスを起動/再起動する

### フェーズ7: デプロイ後フック
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

### 環境ごとの構成
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

### ブルーグリーンデプロイ
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

### カナリアデプロイ
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

### 段階的デプロイ
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

### コンテナアプリのデプロイ
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
# より速い反復のために特定のサービスをデプロイする
azd deploy --service web
azd deploy --service api

# すべてのサービスをデプロイする
azd deploy
```

### ビルドキャッシング
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
# コードのみの変更には azd deploy（azd up ではなく）を使用する
# これによりインフラのプロビジョニングをスキップし、はるかに高速になる
azd deploy

# 最速の反復のために特定のサービスだけをデプロイする
azd deploy --service api
```

## 🔍 デプロイ監視

### リアルタイムデプロイ監視
```bash
# アプリケーションをリアルタイムで監視する
azd monitor --live

# アプリケーションのログを表示する
azd monitor --logs

# デプロイの状態を確認する
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

# アプリケーションの正常性を確認
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

## 🔐 セキュリティ上の考慮事項

### シークレット管理
```bash
# シークレットを安全に保存する
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yamlでシークレットを参照する
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

### IDおよびアクセス管理
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
# AZDには組み込みのロールバック機能がありません。推奨されるアプローチ:

# オプション 1: Gitから再デプロイ（推奨）
git revert HEAD  # 問題のあるコミットを元に戻す
git push
azd deploy

# オプション 2: 特定のコミットを再デプロイ
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### インフラロールバック
```bash
# 適用する前にインフラの変更をプレビューする
azd provision --preview

# インフラのロールバックにはバージョン管理を使用してください：
git revert HEAD  # インフラの変更を元に戻す
azd provision    # 以前のインフラの状態を適用する
```

### データベース移行のロールバック
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 デプロイ指標

### デプロイのパフォーマンスを追跡
```bash
# 現在のデプロイ状況を表示
azd show

# Application Insights でアプリケーションを監視
azd monitor --overview

# ライブ メトリクスを表示
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
# 一貫した命名を使用する
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# 環境間の整合性を維持する
./scripts/sync-environments.sh
```

### 2. インフラ検証
```bash
# デプロイ前にインフラの変更をプレビューする
azd provision --preview

# ARM/Bicep のリンティングを使用する
az bicep lint --file infra/main.bicep

# Bicep の構文を検証する
az bicep build --file infra/main.bicep
```

### 3. テスト統合
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
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## 次のステップ

- [リソースのプロビジョニング](provisioning.md) - インフラ管理の詳細解説
- [デプロイ前の計画](../chapter-06-pre-deployment/capacity-planning.md) - デプロイ戦略を計画する
- [一般的な問題](../chapter-07-troubleshooting/common-issues.md) - デプロイの問題を解決する
- [ベストプラクティス](../chapter-07-troubleshooting/debugging.md) - 本番対応のデプロイ戦略

## 🎯 ハンズオンデプロイ演習

### 演習1: インクリメンタルデプロイワークフロー（20分）
<strong>目標</strong>: フルデプロイとインクリメンタルデプロイの違いを習得する

```bash
# 初期デプロイ
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# 初期デプロイ時間を記録する
echo "Full deployment: $(date)" > deployment-log.txt

# コードを変更する
echo "// Updated $(date)" >> src/api/src/server.js

# コードのみをデプロイする（高速）
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# 時間を比較する
cat deployment-log.txt

# クリーンアップ
azd down --force --purge
```

**成功基準:**
- [ ] フルデプロイが5～15分かかる
- [ ] コードのみのデプロイが2～5分かかる
- [ ] コード変更がデプロイ済みアプリに反映される
- [ ] `azd deploy` 実行後にインフラが変更されない

<strong>学習成果</strong>: `azd deploy` はコード変更時に `azd up` より50～70%高速です

### 演習2: カスタムデプロイフック（30分）
<strong>目標</strong>: デプロイ前後の自動化を実装する

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

**成功基準:**
- [ ] デプロイ前スクリプトがデプロイ前に実行される
- [ ] テストが失敗した場合、デプロイが中止される
- [ ] デプロイ後のスモークテストがヘルスを検証する
- [ ] フックが正しい順序で実行される

### 演習3: マルチ環境デプロイ戦略（45分）
<strong>目標</strong>: 段階的デプロイワークフロー（dev → staging → production）を実装する

```bash
# デプロイ用スクリプトを作成する
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# ステップ1: 開発環境へデプロイする
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ステップ2: ステージング環境へデプロイする
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

# 段階的デプロイを実行する
./deploy-staged.sh
```

**成功基準:**
- [ ] 開発環境が正常にデプロイされる
- [ ] ステージング環境が正常にデプロイされる
- [ ] 本番環境には手動承認が必要である
- [ ] すべての環境でヘルスチェックが機能している
- [ ] 必要に応じてロールバックできる

### 演習4: ロールバック戦略（25分）
<strong>目標</strong>: Git を使用したデプロイのロールバックを実装およびテストする

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

# 障害を検出してロールバック
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git を使ってロールバック
    git revert HEAD --no-edit
    
    # 環境をロールバック
    azd env set APP_VERSION "1.0.0"
    
    # v1 を再デプロイ
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**成功基準:**
- [ ] デプロイ失敗を検出できる
- [ ] ロールバックスクリプトが自動的に実行される
- [ ] アプリケーションが動作する状態に戻る
- [ ] ロールバック後にヘルスチェックが通る

## 📊 デプロイ指標の追跡

### デプロイのパフォーマンスを追跡する

```bash
# デプロイのメトリクス用スクリプトを作成する
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
echo "Environment: $(azd env show --output json | jq -r '.name')"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# ファイルにログを出力する
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# 使用する
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

- [Azure Developer CLI デプロイリファレンス](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service のデプロイ](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps のデプロイ](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions のデプロイ](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

<strong>ナビゲーション</strong>
- <strong>前のレッスン</strong>: [最初のプロジェクト](../chapter-01-foundation/first-project.md)
- <strong>次のレッスン</strong>: [リソースのプロビジョニング](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:
この文書は、AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されました。正確性には努めていますが、自動翻訳には誤りや不正確さが含まれる可能性があることにご留意ください。原文（母語版）の文書を正本として扱ってください。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の使用に起因する誤解や誤訳について、当方は一切の責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->