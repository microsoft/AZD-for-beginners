<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9788ca3a01099b5a07db01554f915e27",
  "translation_date": "2025-09-09T17:06:42+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "ja"
}
-->
# よくある問題と解決策

## はじめに

この包括的なトラブルシューティングガイドでは、Azure Developer CLIを使用する際によく遭遇する問題について説明します。認証、デプロイメント、インフラストラクチャのプロビジョニング、アプリケーション設定に関する一般的な問題を診断、トラブルシュート、解決する方法を学びます。各問題には、詳細な症状、根本原因、そして段階的な解決手順が含まれています。

## 学習目標

このガイドを完了することで、以下を習得できます：
- Azure Developer CLIの問題に対する診断技術をマスターする
- 一般的な認証と権限の問題を理解し、その解決策を学ぶ
- デプロイメントの失敗、インフラストラクチャのプロビジョニングエラー、設定の問題を解決する
- プロアクティブな監視とデバッグ戦略を実装する
- 複雑な問題に対する体系的なトラブルシューティング手法を適用する
- 適切なログと監視を設定し、将来の問題を防ぐ

## 学習成果

このガイドを完了すると、以下ができるようになります：
- Azure Developer CLIの組み込み診断ツールを使用して問題を診断する
- 認証、サブスクリプション、権限に関連する問題を独自に解決する
- デプロイメントの失敗やインフラストラクチャのプロビジョニングエラーを効果的にトラブルシュートする
- アプリケーション設定の問題や環境固有の問題をデバッグする
- 監視とアラートを実装し、潜在的な問題をプロアクティブに特定する
- ログ、デバッグ、問題解決のワークフローにおけるベストプラクティスを適用する

## クイック診断

特定の問題に取り組む前に、以下のコマンドを実行して診断情報を収集してください：

```bash
# Check azd version and health
azd version
azd config list

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env show
azd env get-values

# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug
```

## 認証の問題

### 問題: "アクセストークンの取得に失敗しました"
**症状:**
- `azd up`が認証エラーで失敗する
- コマンドが「未認証」または「アクセス拒否」を返す

**解決策:**
```bash
# 1. Re-authenticate with Azure CLI
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### 問題: デプロイメント中の「権限不足」
**症状:**
- デプロイメントが権限エラーで失敗する
- 特定のAzureリソースを作成できない

**解決策:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### 問題: マルチテナント認証の問題
**解決策:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ インフラストラクチャのプロビジョニングエラー

### 問題: リソース名の競合
**症状:**
- 「リソース名がすでに存在しています」というエラー
- リソース作成中にデプロイメントが失敗する

**解決策:**
```bash
# 1. Use unique resource names with tokens
# In your Bicep template:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Clean up existing resources
azd down --force --purge
```

### 問題: ロケーション/リージョンが利用不可
**症状:**
- 「リソースタイプに対してロケーション 'xyz' が利用できません」
- 選択したリージョンで特定のSKUが利用できない

**解決策:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Use commonly available regions
azd config set defaults.location eastus2
# or
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

### 問題: クォータ超過エラー
**症状:**
- 「リソースタイプのクォータを超過しました」
- 「リソースの最大数に達しました」

**解決策:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

# 3. Use smaller SKUs for development
# In main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### 問題: Bicepテンプレートエラー
**症状:**
- テンプレートの検証失敗
- Bicepファイルの構文エラー

**解決策:**
```bash
# 1. Validate Bicep syntax
az bicep build --file infra/main.bicep

# 2. Use Bicep linter
az bicep lint --file infra/main.bicep

# 3. Check parameter file syntax
cat infra/main.parameters.json | jq '.'

# 4. Preview deployment changes
azd provision --preview
```

## 🚀 デプロイメントの失敗

### 問題: ビルドの失敗
**症状:**
- デプロイメント中にアプリケーションがビルドに失敗する
- パッケージインストールエラー

**解決策:**
```bash
# 1. Check build logs
azd logs --service web
azd deploy --service web --debug

# 2. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
rm -rf node_modules package-lock.json
npm install

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### 問題: コンテナデプロイメントの失敗
**症状:**
- コンテナアプリが起動しない
- イメージプルエラー

**解決策:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs
azd logs --service api --follow

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### 問題: データベース接続の失敗
**症状:**
- アプリケーションがデータベースに接続できない
- 接続タイムアウトエラー

**解決策:**
```bash
# 1. Check database firewall rules
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test connectivity from application
# Add to your app temporarily:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verify connection string format
azd env get-values | grep DATABASE

# 4. Check database server status
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 設定の問題

### 問題: 環境変数が機能しない
**症状:**
- アプリが設定値を読み取れない
- 環境変数が空のように見える

**解決策:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get DATABASE_URL

# 2. Check variable names in azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Restart the application
azd deploy --service web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### 問題: SSL/TLS証明書の問題
**症状:**
- HTTPSが機能しない
- 証明書検証エラー

**解決策:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### 問題: CORS設定の問題
**症状:**
- フロントエンドがAPIを呼び出せない
- クロスオリジンリクエストがブロックされる

**解決策:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Update API to handle CORS
# In Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Check if running on correct URLs
azd show
```

## 🌍 環境管理の問題

### 問題: 環境切り替えの問題
**症状:**
- 間違った環境が使用されている
- 設定が正しく切り替わらない

**解決策:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env show

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### 問題: 環境の破損
**症状:**
- 環境が無効な状態を示す
- リソースが設定と一致しない

**解決策:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. Import existing resources (if possible)
# Manually update .azure/production/config.json with resource IDs
```

## 🔍 パフォーマンスの問題

### 問題: デプロイメント時間が遅い
**症状:**
- デプロイメントに時間がかかりすぎる
- デプロイメント中のタイムアウト

**解決策:**
```bash
# 1. Enable parallel deployment
azd config set deploy.parallelism 5

# 2. Use incremental deployments
azd deploy --incremental

# 3. Optimize build process
# In package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Check resource locations (use same region)
azd config set defaults.location eastus2
```

### 問題: アプリケーションのパフォーマンス問題
**症状:**
- 応答時間が遅い
- 高いリソース使用率

**解決策:**
```bash
# 1. Scale up resources
# Update SKU in main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Enable Application Insights monitoring
azd monitor

# 3. Check application logs for bottlenecks
azd logs --service api --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ トラブルシューティングツールとコマンド

### デバッグコマンド
```bash
# Comprehensive debugging
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Check system info
azd info

# Validate configuration
azd config validate

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### ログ分析
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### リソース調査
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 追加の支援を得る

### エスカレーションが必要な場合
- すべての解決策を試した後も認証の問題が続く場合
- Azureサービスに関連するインフラストラクチャの問題
- 請求やサブスクリプションに関連する問題
- セキュリティ上の懸念やインシデント

### サポートチャネル
```bash
# 1. Check Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Create Azure support ticket
# Go to: https://portal.azure.com -> Help + support

# 3. Community resources
# - Stack Overflow: azure-developer-cli tag
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### 収集すべき情報
サポートに連絡する前に以下を収集してください：
- `azd version`の出力
- `azd info`の出力
- エラーメッセージ（全文）
- 問題を再現する手順
- 環境の詳細（`azd env show`）
- 問題が発生し始めたタイムライン

### ログ収集スクリプト
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
azd info >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Recent logs:" > debug-logs/recent-logs.txt
azd logs --since 1h >> debug-logs/recent-logs.txt

echo "Debug information collected in debug-logs/"
```

## 📊 問題予防

### デプロイメント前のチェックリスト
```bash
# 1. Validate authentication
az account show

# 2. Check quotas and limits
az vm list-usage --location eastus2

# 3. Validate templates
az bicep build --file infra/main.bicep

# 4. Test locally first
npm run build
npm run test

# 5. Use dry-run deployments
azd provision --preview
```

### 監視の設定
```bash
# Enable Application Insights
# Add to main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Set up alerts
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### 定期的なメンテナンス
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## 関連リソース

- [デバッグガイド](debugging.md) - 高度なデバッグ技術
- [リソースのプロビジョニング](../deployment/provisioning.md) - インフラストラクチャのトラブルシューティング
- [キャパシティプランニング](../pre-deployment/capacity-planning.md) - リソース計画のガイダンス
- [SKU選択](../pre-deployment/sku-selection.md) - サービス層の推奨事項

---

**ヒント**: このガイドをブックマークして、問題が発生した際に参照してください。ほとんどの問題は以前に経験されており、確立された解決策があります！

---

**ナビゲーション**
- **前のレッスン**: [リソースのプロビジョニング](../deployment/provisioning.md)
- **次のレッスン**: [デバッグガイド](debugging.md)

---

**免責事項**:  
この文書は、AI翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を追求しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知ください。元の言語で記載された文書が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用に起因する誤解や誤解釈について、当方は責任を負いません。