# 展開ガイド - AZD展開のマスター

**チャプターナビゲーション:**
- **📚 コースホーム**: [AZD For Beginners](../../README.md)
- **📖 現チャプター**: 第4章 - インフラストラクチャ as Code & 展開
- **⬅️ 前の章**: [第3章: 設定](../chapter-03-configuration/configuration.md)
- **➡️ 次へ**: [リソースのプロビジョニング](provisioning.md)
- **🚀 次の章**: [第5章: マルチエージェントAIソリューション](../../examples/retail-scenario.md)

## はじめに

この包括的なガイドは、Azure Developer CLIを使用したアプリケーション展開に関する基本的な単一コマンド展開から、カスタムフック、複数環境、CI/CD統合などの高度な本番シナリオまで、知っておくべきすべてを扱います。実践例やベストプラクティスで完全な展開ライフサイクルをマスターしましょう。

## 学習目標

本ガイドを完了すると、以下を達成できます:
- Azure Developer CLIのすべての展開コマンドとワークフローをマスターする
- プロビジョニングから監視までの完全な展開ライフサイクルを理解する
- 展開前後の自動化のためのカスタム展開フックを実装する
- 環境ごとのパラメータを使用した複数環境の設定を行う
- ブルーグリーンやカナリア展開を含む高度な展開戦略を設定する
- azd展開をCI/CDパイプラインやDevOpsワークフローに統合する

## 学習成果

完了後には次のことが可能になります:
- すべてのazd展開ワークフローを独立して実行・トラブルシューティングする
- フックを使ったカスタム展開自動化を設計・実装する
- 適切なセキュリティと監視を備えた本番対応展開を構成する
- 複雑な複数環境展開シナリオを管理する
- 展開パフォーマンスを最適化し、ロールバック戦略を実装する
- azd展開を企業のDevOpsプラクティスに統合する

## 展開概要

Azure Developer CLIは複数の展開コマンドを提供します:
- `azd up` - 完全なワークフロー（プロビジョニング＋展開）
- `azd provision` - Azureリソースの作成/更新のみ
- `azd deploy` - アプリケーションコードの展開のみ
- `azd package` - アプリケーションのビルドとパッケージ

## 基本的な展開ワークフロー

### 完全展開（azd up）
新規プロジェクトに最も一般的なワークフロー：
```bash
# すべてをゼロからデプロイする
azd up

# 特定の環境でデプロイする
azd up --environment production

# カスタムパラメータでデプロイする
azd up --parameter location=westus2 --parameter sku=P1v2
```

### インフラのみの展開
Azureリソースのみ更新する場合：
```bash
# インフラストラクチャのプロビジョニング／更新
azd provision

# 変更をプレビューするためのドライランでプロビジョニング
azd provision --preview

# 特定のサービスのプロビジョニング
azd provision --service database
```

### コードのみの展開
迅速なアプリ更新向け：
```bash
# すべてのサービスをデプロイする
azd deploy

# 予想される出力:
# サービスをデプロイ中 (azd deploy)
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

### ✅ 展開の検証

展開後は成功を検証しましょう：

```bash
# すべてのサービスが稼働していることを確認してください
azd show

# ヘルスエンドポイントをテストする
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# エラーを監視する（デフォルトでブラウザで開きます）
azd monitor --logs
```

**成功基準:**
- ✅ すべてのサービスが「Running」ステータス
- ✅ ヘルスエンドポイントがHTTP 200を返す
- ✅ 過去5分間エラーログなし
- ✅ アプリケーションがテストリクエストに応答

## 🏗️ 展開プロセスの理解

### フェーズ1: プロビジョニング前のフック
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

### フェーズ2: インフラプロビジョニング
- インフラテンプレート（Bicep/Terraform）を読み込む
- Azureリソースを作成または更新する
- ネットワークとセキュリティを設定
- 監視とログをセットアップ

### フェーズ3: プロビジョニング後のフック
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

### フェーズ4: アプリパッケージング
- アプリケーションコードをビルド
- 展開用アーティファクトを作成
- 対象プラットフォーム用にパッケージング（コンテナ、ZIPファイル等）

### フェーズ5: 展開前のフック
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

### フェーズ6: アプリの展開
- パッケージされたアプリをAzureサービスに展開
- 設定を更新
- サービスを起動/再起動

### フェーズ7: 展開後のフック
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

## 🎛️ 展開設定

### サービス固有の展開設定
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

## 🔧 高度な展開シナリオ

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

### ブルーグリーン展開
```bash
# ブルー環境を作成する
azd env new production-blue
azd up --environment production-blue

# ブルー環境をテストする
./scripts/test-environment.sh production-blue

# トラフィックをブルーに切り替える（手動でDNS/ロードバランサーを更新）
./scripts/switch-traffic.sh production-blue

# グリーン環境をクリーンアップする
azd env select production-green
azd down --force
```

### カナリア展開
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

### ステージド展開
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

## 🐳 コンテナ展開

### コンテナアプリ展開
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

### サービス固有の展開
```bash
# より速い反復のために特定のサービスをデプロイする
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

### 効率的なコード展開
```bash
# コードのみの変更には azd up ではなく azd deploy を使用してください
# これによりインフラのプロビジョニングをスキップし、はるかに高速になります
azd deploy

# 最速の反復のために特定のサービスをデプロイしてください
azd deploy --service api
```

## 🔍 展開監視

### リアルタイム展開監視
```bash
# アプリケーションをリアルタイムで監視する
azd monitor --live

# アプリケーションのログを表示する
azd monitor --logs

# デプロイの状況を確認する
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

### 展開後バリデーション
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# アプリケーションのヘルスチェック
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

### アイデンティティおよびアクセス管理
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
# AZDには組み込みのロールバック機能がありません。推奨される方法：

# オプション1: Gitから再デプロイ（推奨）
git revert HEAD  # 問題のあるコミットを元に戻す
git push
azd deploy

# オプション2: 特定のコミットを再デプロイする
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### インフラロールバック
```bash
# 適用前にインフラストラクチャの変更をプレビューする
azd provision --preview

# インフラストラクチャのロールバックにはバージョン管理を使用してください:
git revert HEAD  # インフラストラクチャの変更を元に戻す
azd provision    # 前のインフラストラクチャの状態を適用する
```

### データベースマイグレーションロールバック
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 展開メトリクス

### 展開パフォーマンスの追跡
```bash
# 現在のデプロイ状況を表示する
azd show

# Application Insightsでアプリケーションを監視する
azd monitor --overview

# ライブメトリクスを表示する
azd monitor --live
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

# 環境の整合性を維持する
./scripts/sync-environments.sh
```

### 2. インフラ検証
```bash
# 展開前にインフラ変更をプレビューする
azd provision --preview

# ARM/Bicepのリンティングを使用する
az bicep lint --file infra/main.bicep

# Bicepの構文を検証する
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
# 展開手順を文書化する
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## 次のステップ

- [リソースのプロビジョニング](provisioning.md) - インフラ管理の詳細
- [展開前の計画](../chapter-06-pre-deployment/capacity-planning.md) - 展開戦略の計画
- [一般的な問題](../chapter-07-troubleshooting/common-issues.md) - 展開問題の解決
- [ベストプラクティス](../chapter-07-troubleshooting/debugging.md) - 本番対応展開戦略

## 🎯 ハンズオン展開演習

### 演習1: インクリメンタル展開ワークフロー（20分）
<strong>目標</strong>: フル展開とインクリメンタル展開の違いをマスターする

```bash
# 初回デプロイメント
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# 初回デプロイメント時間を記録
echo "Full deployment: $(date)" > deployment-log.txt

# コードを変更する
echo "// Updated $(date)" >> src/api/src/server.js

# コードのみをデプロイ（高速）
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# 時間を比較する
cat deployment-log.txt

# クリーンアップする
azd down --force --purge
```

**成功基準:**
- [ ] フル展開に5～15分かかる
- [ ] コードのみ展開に2～5分かかる
- [ ] コード変更が展開アプリに反映される
- [ ] `azd deploy` 後にインフラは変更されない

<strong>学習成果</strong>: コード変更の場合、`azd deploy` は `azd up` より50～70%速い

### 演習2: カスタム展開フック（30分）
<strong>目標</strong>: 展開前後の自動化を実装する

```bash
# デプロイ前検証スクリプトを作成する
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# テストがパスするか確認する
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# コミットされていない変更を確認する
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# デプロイ後スモークテストを作成する
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

# フック付きのデプロイをテストする
azd deploy
```

**成功基準:**
- [ ] 展開前スクリプトが展開前に実行される
- [ ] テスト失敗時に展開が中止される
- [ ] 展開後スモークテストがヘルスを検証する
- [ ] フックが正しい順序で実行される

### 演習3: 複数環境展開戦略（45分）
<strong>目標</strong>: ステージド展開ワークフローを実装する（開発 → ステージング → 本番）

```bash
# デプロイスクリプトを作成
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# ステップ1：開発環境にデプロイ
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ステップ2：ステージング環境にデプロイ
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ステップ3：本番環境の手動承認
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

# 環境を作成
azd env new dev
azd env new staging
azd env new production

# 段階的なデプロイを実行
./deploy-staged.sh
```

**成功基準:**
- [ ] 開発環境が正常に展開される
- [ ] ステージング環境が正常に展開される
- [ ] 本番環境は手動承認が必要
- [ ] すべての環境でヘルスチェックが機能する
- [ ] 必要に応じてロールバック可能

### 演習4: ロールバック戦略（25分）
<strong>目標</strong>: Gitを使った展開ロールバックを実装・テストする

```bash
# v1をデプロイする
azd env set APP_VERSION "1.0.0"
azd up

# v1のコミットハッシュを保存する
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# 破壊的変更を伴うv2をデプロイする
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# 失敗を検出してロールバックする
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # gitを使ってロールバックする
    git revert HEAD --no-edit
    
    # 環境をロールバックする
    azd env set APP_VERSION "1.0.0"
    
    # v1を再デプロイする
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**成功基準:**
- [ ] 展開失敗を検知できる
- [ ] ロールバックスクリプトが自動実行される
- [ ] アプリが正常状態に戻る
- [ ] ロールバック後にヘルスチェックが合格

## 📊 展開メトリクス追跡

### 展開パフォーマンスの追跡

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
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# ファイルにログを記録する
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# それを使う
./track-deployment.sh
```

**メトリクスを分析する:**
```bash
# 展開履歴を表示する
cat deployment-metrics.csv

# 平均展開時間を計算する
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## 追加リソース

- [Azure Developer CLI 展開リファレンス](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service 展開](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps 展開](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions 展開](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

<strong>ナビゲーション</strong>
- <strong>前のレッスン</strong>: [はじめてのプロジェクト](../chapter-01-foundation/first-project.md)
- <strong>次のレッスン</strong>: [リソースのプロビジョニング](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:  
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確さを期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご理解ください。原文はその言語でのオリジナル文書が正本とみなされます。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じた誤解や誤訳について、一切の責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->