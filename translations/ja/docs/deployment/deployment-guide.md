<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6ae5503cd909d625f01efa4d9e99799e",
  "translation_date": "2025-11-19T18:19:36+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "ja"
}
-->
# デプロイメントガイド - AZDデプロイメントを極める

**章のナビゲーション:**
- **📚 コースホーム**: [AZD初心者向け](../../README.md)
- **📖 現在の章**: 第4章 - インフラストラクチャーコードとデプロイメント
- **⬅️ 前の章**: [第3章: 設定](../getting-started/configuration.md)
- **➡️ 次へ**: [リソースのプロビジョニング](provisioning.md)
- **🚀 次の章**: [第5章: マルチエージェントAIソリューション](../../examples/retail-scenario.md)

## はじめに

この包括的なガイドでは、Azure Developer CLIを使用したアプリケーションのデプロイメントについて、基本的な単一コマンドのデプロイメントから、カスタムフック、複数環境、CI/CD統合を含む高度なプロダクションシナリオまで、すべてをカバーします。実践的な例とベストプラクティスを通じて、デプロイメントライフサイクル全体をマスターしましょう。

## 学習目標

このガイドを完了することで、以下を達成できます:
- Azure Developer CLIのすべてのデプロイメントコマンドとワークフローをマスターする
- プロビジョニングからモニタリングまでのデプロイメントライフサイクルを理解する
- デプロイメント前後の自動化のためのカスタムフックを実装する
- 環境固有のパラメータを使用して複数環境を設定する
- ブルーグリーンデプロイメントやカナリアデプロイメントなどの高度なデプロイメント戦略を設定する
- azdデプロイメントをCI/CDパイプラインやDevOpsワークフローに統合する

## 学習成果

このガイドを完了すると、以下ができるようになります:
- すべてのazdデプロイメントワークフローを独立して実行およびトラブルシューティングする
- カスタムデプロイメント自動化を設計および実装する
- 適切なセキュリティとモニタリングを備えたプロダクション対応のデプロイメントを設定する
- 複雑なマルチ環境デプロイメントシナリオを管理する
- デプロイメントのパフォーマンスを最適化し、ロールバック戦略を実装する
- azdデプロイメントをエンタープライズDevOpsプラクティスに統合する

## デプロイメント概要

Azure Developer CLIは、以下のデプロイメントコマンドを提供します:
- `azd up` - 完全なワークフロー (プロビジョニング + デプロイ)
- `azd provision` - Azureリソースの作成/更新のみ
- `azd deploy` - アプリケーションコードのデプロイのみ
- `azd package` - アプリケーションのビルドとパッケージ化

## 基本的なデプロイメントワークフロー

### 完全なデプロイメント (azd up)
新しいプロジェクトに最も一般的なワークフロー:
```bash
# すべてをゼロからデプロイする
azd up

# 特定の環境でデプロイする
azd up --environment production

# カスタムパラメータでデプロイする
azd up --parameter location=westus2 --parameter sku=P1v2
```

### インフラストラクチャーのみのデプロイメント
Azureリソースのみを更新する場合:
```bash
# インフラをプロビジョニング/更新する
azd provision

# 変更をプレビューするためにドライランでプロビジョニングする
azd provision --preview

# 特定のサービスをプロビジョニングする
azd provision --service database
```

### コードのみのデプロイメント
アプリケーションの迅速な更新に:
```bash
# すべてのサービスをデプロイする
azd deploy

# 期待される出力:
# サービスをデプロイ中 (azd deploy)
# - web: デプロイ中... 完了
# - api: デプロイ中... 完了
# 成功: デプロイが2分15秒で完了しました

# 特定のサービスをデプロイする
azd deploy --service web
azd deploy --service api

# カスタムビルド引数でデプロイする
azd deploy --service api --build-arg NODE_ENV=production

# デプロイを確認する
azd show --output json | jq '.services'
```

### ✅ デプロイメントの検証

デプロイメント後、成功を確認してください:

```bash
# すべてのサービスが稼働していることを確認する
azd show

# ヘルスエンドポイントをテストする
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# エラーがないかログを確認する
azd logs --service api --since 5m | grep -i error
```

**成功基準:**
- ✅ すべてのサービスが「Running」ステータスを表示
- ✅ ヘルスエンドポイントがHTTP 200を返す
- ✅ 過去5分間にエラーログがない
- ✅ アプリケーションがテストリクエストに応答する

## 🏗️ デプロイメントプロセスの理解

### フェーズ1: プリプロビジョンフック
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

### フェーズ2: インフラストラクチャープロビジョニング
- インフラストラクチャーテンプレート (Bicep/Terraform) を読み取る
- Azureリソースを作成または更新する
- ネットワーキングとセキュリティを設定する
- モニタリングとログを設定する

### フェーズ3: ポストプロビジョンフック
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

### フェーズ4: アプリケーションパッケージ化
- アプリケーションコードをビルドする
- デプロイメントアーティファクトを作成する
- 対象プラットフォーム (コンテナ、ZIPファイルなど) 用にパッケージ化する

### フェーズ5: プリデプロイフック
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

### フェーズ6: アプリケーションデプロイメント
- パッケージ化されたアプリケーションをAzureサービスにデプロイする
- 設定を更新する
- サービスを開始/再起動する

### フェーズ7: ポストデプロイフック
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

## 🎛️ デプロイメント設定

### サービス固有のデプロイメント設定
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

### 環境固有の設定
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

## 🔧 高度なデプロイメントシナリオ

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
# 青い環境を作成する
azd env new production-blue
azd up --environment production-blue

# 青い環境をテストする
./scripts/test-environment.sh production-blue

# トラフィックを青に切り替える（手動でDNS/ロードバランサーを更新）
./scripts/switch-traffic.sh production-blue

# 緑の環境をクリーンアップする
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

### 段階的デプロイメント
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

## 🐳 コンテナデプロイメント

### コンテナアプリデプロイメント
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

### マルチステージDockerfile最適化
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

### 並列デプロイメント
```bash
# 並列デプロイメントを設定する
azd config set deploy.parallelism 5

# サービスを並列でデプロイする
azd deploy --parallel
```

### ビルドキャッシング
```yaml
# azure.yaml - Enable build caching
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    buildCache:
      enabled: true
      paths:
        - node_modules
        - .next/cache
```

### 増分デプロイメント
```bash
# 変更されたサービスのみをデプロイする
azd deploy --incremental

# 変更検出でデプロイする
azd deploy --detect-changes
```

## 🔍 デプロイメントモニタリング

### リアルタイムデプロイメントモニタリング
```bash
# 展開の進行状況を監視する
azd deploy --follow

# 展開ログを表示する
azd logs --follow --service api

# 展開ステータスを確認する
azd show --service api
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

### デプロイメント後の検証
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# アプリケーションの健全性を確認
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

## 🔐 セキュリティ考慮事項

### シークレット管理
```bash
# 秘密情報を安全に保存する
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yamlで秘密情報を参照する
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

### IDとアクセス管理
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
# 前のデプロイメントにロールバックする
azd deploy --rollback

# 特定のサービスをロールバックする
azd deploy --service api --rollback

# 特定のバージョンにロールバックする
azd deploy --service api --version v1.2.3
```

### インフラストラクチャーロールバック
```bash
# インフラストラクチャの変更をロールバックする
azd provision --rollback

# ロールバック変更をプレビューする
azd provision --rollback --preview
```

### データベース移行ロールバック
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 デプロイメントメトリクス

### デプロイメントパフォーマンスの追跡
```bash
# デプロイメントメトリクスを有効にする
azd config set telemetry.deployment.enabled true

# デプロイメント履歴を表示する
azd history

# デプロイメント統計を取得する
azd metrics --type deployment
```

### カスタムメトリクス収集
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

# 環境の均等性を維持する
./scripts/sync-environments.sh
```

### 2. インフラストラクチャーの検証
```bash
# 展開前に検証する
azd provision --preview
azd provision --what-if

# ARM/Bicepのリンティングを使用する
az bicep lint --file infra/main.bicep
```

### 3. テストの統合
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

### 4. ドキュメントとログの記録
```bash
# デプロイ手順を文書化する
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## 次のステップ

- [リソースのプロビジョニング](provisioning.md) - インフラ管理の詳細
- [デプロイメント計画](../pre-deployment/capacity-planning.md) - デプロイメント戦略を計画する
- [一般的な問題](../troubleshooting/common-issues.md) - デプロイメントの問題を解決する
- [ベストプラクティス](../troubleshooting/debugging.md) - プロダクション対応のデプロイメント戦略

## 🎯 ハンズオンデプロイメント演習

### 演習1: 増分デプロイメントワークフロー (20分)
**目標**: フルデプロイメントと増分デプロイメントの違いをマスターする

```bash
# 初期デプロイ
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# 初期デプロイ時間を記録
echo "Full deployment: $(date)" > deployment-log.txt

# コードを変更
echo "// Updated $(date)" >> src/api/src/server.js

# コードのみをデプロイ（高速）
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# 時間を比較
cat deployment-log.txt

# クリーンアップ
azd down --force --purge
```

**成功基準:**
- [ ] フルデプロイメントが5〜15分で完了する
- [ ] コードのみのデプロイメントが2〜5分で完了する
- [ ] コード変更がデプロイされたアプリに反映される
- [ ] `azd deploy`後にインフラが変更されない

**学習成果**: コード変更において、`azd deploy`は`azd up`より50〜70%高速

### 演習2: カスタムデプロイメントフック (30分)
**目標**: デプロイメント前後の自動化を実装する

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

# フックを使用してデプロイをテストする
azd deploy
```

**成功基準:**
- [ ] デプロイ前スクリプトがデプロイ前に実行される
- [ ] テストが失敗した場合、デプロイが中止される
- [ ] デプロイ後のスモークテストがヘルスを検証する
- [ ] フックが正しい順序で実行される

### 演習3: マルチ環境デプロイメント戦略 (45分)
**目標**: 段階的デプロイメントワークフロー (開発 → ステージング → 本番) を実装する

```bash
# デプロイメントスクリプトを作成する
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

# 段階的デプロイを実行する
./deploy-staged.sh
```

**成功基準:**
- [ ] 開発環境が正常にデプロイされる
- [ ] ステージング環境が正常にデプロイされる
- [ ] 本番環境には手動承認が必要
- [ ] すべての環境でヘルスチェックが機能する
- [ ] 必要に応じてロールバック可能

### 演習4: ロールバック戦略 (25分)
**目標**: デプロイメントロールバックを実装しテストする

```bash
# v1をデプロイ
azd env set APP_VERSION "1.0.0"
azd up

# v1の設定を保存
cp -r .azure/production .azure/production-v1-backup

# 互換性を壊す変更を含むv2をデプロイ
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# 障害を検出
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # コードをロールバック
    git checkout src/api/src/server.js
    
    # 環境をロールバック
    azd env set APP_VERSION "1.0.0"
    
    # v1を再デプロイ
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**成功基準:**
- [ ] デプロイメントの失敗を検出できる
- [ ] ロールバックスクリプトが自動的に実行される
- [ ] アプリケーションが正常な状態に戻る
- [ ] ロールバック後にヘルスチェックが合格する

## 📊 デプロイメントメトリクスの追跡

### デプロイメントパフォーマンスを追跡する

```bash
# デプロイメントメトリクススクリプトを作成する
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

# ファイルにログを記録する
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

# 平均デプロイ時間を計算
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## 追加リソース

- [Azure Developer CLIデプロイメントリファレンス](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Serviceデプロイメント](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Appsデプロイメント](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functionsデプロイメント](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**ナビゲーション**
- **前のレッスン**: [最初のプロジェクト](../getting-started/first-project.md)
- **次のレッスン**: [リソースのプロビジョニング](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:  
この文書は、AI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性を期すよう努めておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があります。原文（元の言語で記載された文書）が公式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳をお勧めします。この翻訳の使用に起因する誤解や誤認について、当方は一切の責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->