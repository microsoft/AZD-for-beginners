<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eca806abfc53ae49028f8d34471ab8c7",
  "translation_date": "2025-09-09T16:58:44+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "ja"
}
-->
# デプロイメントガイド - AZDデプロイメントの習得

## はじめに

この包括的なガイドでは、Azure Developer CLIを使用したアプリケーションのデプロイ方法について、基本的な単一コマンドのデプロイメントから、カスタムフック、複数環境、CI/CD統合を含む高度なプロダクションシナリオまでを網羅しています。実践的な例とベストプラクティスを通じて、デプロイメントライフサイクル全体を習得しましょう。

## 学習目標

このガイドを完了することで、以下を習得できます:
- Azure Developer CLIのすべてのデプロイメントコマンドとワークフローをマスターする
- プロビジョニングから監視までのデプロイメントライフサイクルを理解する
- デプロイメント前後の自動化を実現するカスタムフックを実装する
- 環境固有のパラメータを使用して複数環境を構成する
- ブルーグリーンデプロイメントやカナリアデプロイメントなどの高度なデプロイメント戦略を設定する
- azdデプロイメントをCI/CDパイプラインやDevOpsワークフローに統合する

## 学習成果

このガイドを完了すると、以下ができるようになります:
- azdデプロイメントワークフローを独立して実行およびトラブルシューティングする
- カスタムデプロイメント自動化をフックを使用して設計・実装する
- 適切なセキュリティと監視を備えたプロダクション対応のデプロイメントを構成する
- 複雑な複数環境デプロイメントシナリオを管理する
- デプロイメントのパフォーマンスを最適化し、ロールバック戦略を実装する
- azdデプロイメントをエンタープライズDevOpsプラクティスに統合する

## デプロイメント概要

Azure Developer CLIは以下のデプロイメントコマンドを提供します:
- `azd up` - 完全なワークフロー (プロビジョニング + デプロイ)
- `azd provision` - Azureリソースの作成/更新のみ
- `azd deploy` - アプリケーションコードのデプロイのみ
- `azd package` - アプリケーションのビルドとパッケージ化

## 基本的なデプロイメントワークフロー

### 完全なデプロイメント (azd up)
新しいプロジェクトに最も一般的なワークフロー:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### インフラのみのデプロイメント
Azureリソースのみを更新する場合:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### コードのみのデプロイメント
アプリケーションを迅速に更新する場合:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

## 🏗️ デプロイメントプロセスの理解

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

### フェーズ2: インフラプロビジョニング
- インフラテンプレート (Bicep/Terraform) を読み込む
- Azureリソースを作成または更新する
- ネットワークとセキュリティを構成する
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

### フェーズ4: アプリケーションパッケージ化
- アプリケーションコードをビルドする
- デプロイメントアーティファクトを作成する
- 対象プラットフォーム向けにパッケージ化する (コンテナ、ZIPファイルなど)

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

### フェーズ6: アプリケーションデプロイメント
- パッケージ化されたアプリケーションをAzureサービスにデプロイする
- 設定を更新する
- サービスを開始/再起動する

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

## 🎛️ デプロイメント構成

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

### 環境固有の構成
```bash
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Production environment
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 高度なデプロイメントシナリオ

### 複数サービスアプリケーション
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
# Create blue environment
azd env new production-blue
azd up --environment production-blue

# Test blue environment
./scripts/test-environment.sh production-blue

# Switch traffic to blue (manual DNS/load balancer update)
./scripts/switch-traffic.sh production-blue

# Clean up green environment
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

### マルチステージDockerfileの最適化
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
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
azd deploy --parallel
```

### ビルドキャッシュ
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
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 デプロイメント監視

### リアルタイムデプロイメント監視
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
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

### デプロイ後の検証
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Check application health
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
# Store secrets securely
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Reference secrets in azure.yaml
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
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### インフラロールバック
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
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
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
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
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. インフラの検証
```bash
# Validate before deployment
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep
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

### 4. ドキュメントとログの作成
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## 次のステップ

- [リソースのプロビジョニング](provisioning.md) - インフラ管理の詳細
- [デプロイ前の計画](../pre-deployment/capacity-planning.md) - デプロイメント戦略の計画
- [一般的な問題](../troubleshooting/common-issues.md) - デプロイメントの問題を解決する
- [ベストプラクティス](../troubleshooting/debugging.md) - プロダクション対応のデプロイメント戦略

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

**免責事項**:  
この文書はAI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性を追求しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があります。元の言語で記載された文書が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用に起因する誤解や誤解について、当社は責任を負いません。