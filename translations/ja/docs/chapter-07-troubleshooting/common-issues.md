# 共通の問題と解決策

**Chapter Navigation:**
- **📚 Course Home**: [AZD 入門](../../README.md)
- **📖 Current Chapter**: 第7章 - トラブルシューティング & デバッグ
- **⬅️ Previous Chapter**: [第6章: 事前チェック](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Next**: [デバッグガイド](debugging.md)
- **🚀 Next Chapter**: [第8章: 本番とエンタープライズのパターン](../chapter-08-production/production-ai-practices.md)

## はじめに

この包括的なトラブルシューティングガイドは、Azure Developer CLI を使用する際に最も頻繁に遭遇する問題を網羅しています。認証、デプロイ、インフラプロビジョニング、アプリケーション設定に関する一般的な問題の診断、トラブルシューティング、解決方法を学びます。各問題には、症状、根本原因、および段階的な解決手順が含まれています。

## 学習目標

このガイドを完了すると、以下を達成できます:
- Azure Developer CLI の問題に対する診断手法を習得する
- 一般的な認証および権限の問題とその解決方法を理解する
- デプロイ失敗、インフラプロビジョニングのエラー、設定の問題を解決する
- プロアクティブな監視とデバッグ戦略を実装する
- 複雑な問題に対する体系的なトラブルシューティング手法を適用する
- 将来の問題を防ぐための適切なログ記録と監視を構成する

## 学習の成果

完了後、以下ができるようになります:
- 組み込みの診断ツールを使用して Azure Developer CLI の問題を診断する
- 認証、サブスクリプション、および権限に関連する問題を独力で解決する
- デプロイ失敗やインフラプロビジョニングのエラーを効果的にトラブルシュートする
- アプリケーション設定の問題や環境固有の問題をデバッグする
- 潜在的な問題を事前に検出するための監視とアラートを実装する
- ロギング、デバッグ、および問題解決ワークフローのベストプラクティスを適用する

## クイック診断

特定の問題に取り組む前に、これらのコマンドを実行して診断情報を収集してください:

```bash
# azd のバージョンと状態を確認する
azd version
azd config list

# Azure の認証を検証する
az account show
az account list

# 現在の環境を確認する
azd env show
azd env get-values

# デバッグログを有効にする
export AZD_DEBUG=true
azd <command> --debug
```

## 認証の問題

### 問題: "Failed to get access token"
**症状:**
- `azd up` が認証エラーで失敗する
- コマンドが "unauthorized" または "access denied" を返す

**解決方法:**
```bash
# 1. Azure CLIで再認証する
az login
az account show

# 2. キャッシュされた資格情報をクリアする
az account clear
az login

# 3. デバイスコードフローを使用する（ヘッドレスシステム向け）
az login --use-device-code

# 4. 明示的なサブスクリプションを設定する
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### 問題: "Insufficient privileges" during deployment
**症状:**
- デプロイが権限エラーで失敗する
- 特定の Azure リソースを作成できない

**解決方法:**
```bash
# 1. Azure のロール割り当てを確認してください
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. 必要なロールを持っていることを確認してください
# - Contributor（リソース作成用）
# - User Access Administrator（ロール割り当て用）

# 3. 適切な権限については Azure 管理者に連絡してください
```

### 問題: Multi-tenant authentication problems
**解決方法:**
```bash
# 1. 特定のテナントでログインする
az login --tenant "your-tenant-id"

# 2. 構成でテナントを設定する
azd config set auth.tenantId "your-tenant-id"

# 3. テナントを切り替える場合はテナントのキャッシュをクリアする
az account clear
```

## 🏗️ インフラ構築のエラー

### 問題: Resource name conflicts
**症状:**
- "The resource name already exists" エラーが発生する
- リソース作成中にデプロイが失敗する

**解決方法:**
```bash
# 1. トークンを使って一意のリソース名を付ける
# Bicep テンプレート内で:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. 環境名を変更する
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. 既存のリソースをクリーンアップする
azd down --force --purge
```

### 問題: Location/Region not available
**症状:**
- "The location 'xyz' is not available for resource type"
- 選択したリージョンで特定の SKU が利用できない

**解決方法:**
```bash
# 1. リソースの種類ごとに利用可能なロケーションを確認する
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. 一般的に利用可能なリージョンを使用する
azd config set defaults.location eastus2
# または
azd env set AZURE_LOCATION eastus2

# 3. リージョン別にサービスの可用性を確認する
# 参照: https://azure.microsoft.com/global-infrastructure/services/
```

### 問題: Quota exceeded errors
**症状:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**解決方法:**
```bash
# 1. 現在のクォータ使用状況を確認する
az vm list-usage --location eastus2 -o table

# 2. Azure ポータルを通じてクォータの増加をリクエストする
# 移動先: サブスクリプション > 使用状況 + クォータ

# 3. 開発用には小さい SKU を使用する
# main.parameters.json 内:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. 未使用のリソースをクリーンアップする
az resource list --query "[?contains(name, 'unused')]" -o table
```

### 問題: Bicep template errors
**症状:**
- テンプレートの検証失敗
- Bicep ファイルの構文エラー

**解決方法:**
```bash
# 1. Bicep の構文を検証する
az bicep build --file infra/main.bicep

# 2. Bicep リンターを使用する
az bicep lint --file infra/main.bicep

# 3. パラメータ ファイルの構文を検証する
cat infra/main.parameters.json | jq '.'

# 4. デプロイの変更をプレビューする
azd provision --preview
```

## 🚀 デプロイの失敗

### 問題: Build failures
**症状:**
- デプロイ中にアプリケーションのビルドが失敗する
- パッケージインストールのエラー

**解決方法:**
```bash
# 1. デバッグフラグでビルド出力を確認する
azd deploy --service web --debug

# 2. デプロイ済みサービスのステータスを確認する
azd show

# 3. ビルドをローカルでテストする
cd src/web
npm install
npm run build

# 3. Node.js と Python のバージョン互換性を確認する
node --version  # Should match azure.yaml settings: azure.yaml の設定と一致する必要がある
python --version

# 4. ビルドキャッシュをクリアする
rm -rf node_modules package-lock.json
npm install

# 5. コンテナを使用している場合は Dockerfile を確認する
docker build -t test-image .
docker run --rm test-image
```

### 問題: Container deployment failures
**症状:**
- コンテナアプリが起動しない
- イメージのプルエラー

**解決方法:**
```bash
# 1. ローカルで Docker ビルドをテストする
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Azure CLI を使ってコンテナのログを確認する
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. azd を通じてアプリケーションを監視する
azd monitor --logs

# 3. コンテナ レジストリへのアクセスを確認する
az acr login --name myregistry

# 4. コンテナアプリの構成を確認する
az containerapp show --name my-app --resource-group my-rg
```

### 問題: Database connection failures
**症状:**
- アプリケーションがデータベースに接続できない
- 接続タイムアウトエラー

**解決方法:**
```bash
# 1. データベースのファイアウォール規則を確認する
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. アプリケーションから接続をテストする
# アプリに一時的に追加してください:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. 接続文字列の形式を確認する
azd env get-values | grep DATABASE

# 4. データベースサーバーの状態を確認する
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 構成の問題

### 問題: Environment variables not working
**症状:**
- アプリが設定値を読み取れない
- 環境変数が空に見える

**解決方法:**
```bash
# 1. 環境変数が設定されていることを確認する
azd env get-values
azd env get DATABASE_URL

# 2. azure.yaml の変数名を確認する
cat azure.yaml | grep -A 5 env:

# 3. アプリケーションを再起動する
azd deploy --service web

# 4. App Service の構成を確認する
az webapp config appsettings list --name myapp --resource-group myrg
```

### 問題: SSL/TLS certificate problems
**症状:**
- HTTPS が動作しない
- 証明書の検証エラー

**解決方法:**
```bash
# 1. SSL証明書の状態を確認する
az webapp config ssl list --resource-group myrg

# 2. HTTPSのみを有効にする
az webapp update --name myapp --resource-group myrg --https-only true

# 3. カスタムドメインを追加する（必要な場合）
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### 問題: CORS configuration problems
**症状:**
- フロントエンドが API を呼び出せない
- クロスオリジンリクエストがブロックされる

**解決方法:**
```bash
# 1. App Service の CORS を構成する
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. CORS を処理するように API を更新する
# Express.js では:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. 正しい URL で動作しているか確認する
azd show
```

## 🌍 環境管理の問題

### 問題: Environment switching problems
**症状:**
- 間違った環境が使用されている
- 設定が正しく切り替わらない

**解決方法:**
```bash
# 1. すべての環境を一覧表示する
azd env list

# 2. 環境を明示的に選択する
azd env select production

# 3. 現在の環境を確認する
azd env show

# 4. 破損している場合は新しい環境を作成する
azd env new production-new
azd env select production-new
```

### 問題: Environment corruption
**症状:**
- 環境が無効な状態を示す
- リソースが設定と一致しない

**解決方法:**
```bash
# 1. 環境の状態を更新する
azd env refresh

# 2. 環境設定をリセットする
azd env new production-reset
# 必要な環境変数をコピーする
azd env set DATABASE_URL "your-value"

# 3. 既存のリソースをインポートする（可能であれば）
# 手動で .azure/production/config.json をリソース ID で更新する
```

## 🔍 パフォーマンスの問題

### 問題: Slow deployment times
**症状:**
- デプロイに時間がかかる
- デプロイ中にタイムアウトが発生する

**解決方法:**
```bash
# 1. より速い反復のために特定のサービスをデプロイする
azd deploy --service web
azd deploy --service api

# 2. インフラが変更されていない場合はコードのみのデプロイを行う
azd deploy  # azd up より高速

# 3. ビルドプロセスを最適化する
# package.json 内で:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. リソースの配置場所を確認する (同じリージョンを使用する)
azd config set defaults.location eastus2
```

### 問題: Application performance problems
**症状:**
- 応答時間が遅い
- 高いリソース使用率

**解決方法:**
```bash
# 1. リソースをスケールアップする
# main.parameters.json の SKU を更新する:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Application Insights の監視を有効にする
azd monitor --overview

# 3. Azure でアプリケーションのログを確認する
az webapp log tail --name myapp --resource-group myrg
# または Container Apps の場合:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. キャッシュを実装する
# インフラに Redis キャッシュを追加する
```

## 🛠️ トラブルシューティングツールとコマンド

### デバッグコマンド
```bash
# 包括的なデバッグ
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# azd のバージョンを確認
azd version

# 現在の構成を表示
azd config list

# 接続をテスト
curl -v https://myapp.azurewebsites.net/health
```

### ログ分析
```bash
# Azure CLI経由のアプリケーションログ
az webapp log tail --name myapp --resource-group myrg

# azdでアプリケーションを監視する
azd monitor --logs
azd monitor --live

# Azureリソースのログ
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# コンテナログ（Container Apps向け）
az containerapp logs show --name myapp --resource-group myrg --follow
```

### リソース調査
```bash
# すべてのリソースを一覧表示
az resource list --resource-group myrg -o table

# リソースの状態を確認
az webapp show --name myapp --resource-group myrg --query state

# ネットワーク診断
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 追加のヘルプ

### エスカレートするタイミング
- すべての解決策を試しても認証の問題が解決しない場合
- Azure サービス側のインフラ問題
- 課金やサブスクリプションに関する問題
- セキュリティの懸念やインシデント

### サポートチャネル
```bash
# 1. Azure Service Health を確認する
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Azure サポート チケットを作成する
# アクセス先: https://portal.azure.com -> ヘルプ + サポート

# 3. コミュニティ リソース
# - Stack Overflow: azure-developer-cli タグ
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### 収集すべき情報
サポートに連絡する前に、以下を収集してください:
- `azd version` の出力
- `azd config list` の出力
- `azd show` の出力 (現在のデプロイ状況)
- エラーメッセージ（全文）
- 再現手順
- 環境の詳細 (`azd env show`)
- 問題が発生し始めた時期のタイムライン

### ログ収集スクリプト
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 問題の予防

### デプロイ前チェックリスト
```bash
# 1. 認証を検証する
az account show

# 2. クォータと制限を確認する
az vm list-usage --location eastus2

# 3. テンプレートを検証する
az bicep build --file infra/main.bicep

# 4. まずローカルでテストする
npm run build
npm run test

# 5. ドライランのデプロイを使用する
azd provision --preview
```

### 監視の設定
```bash
# Application Insights を有効にする
# main.bicep に追加する:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# アラートを設定する
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### 定期メンテナンス
```bash
# 週次の健康チェック
./scripts/health-check.sh

# 月次の費用見直し
az consumption usage list --billing-period-name 202401

# 四半期ごとのセキュリティレビュー
az security assessment list --resource-group myrg
```

## 関連リソース

- [デバッグガイド](debugging.md) - 高度なデバッグ手法
- [リソースのプロビジョニング](../chapter-04-infrastructure/provisioning.md) - インフラのトラブルシューティング
- [キャパシティプランニング](../chapter-06-pre-deployment/capacity-planning.md) - リソース計画のガイダンス
- [SKU 選択](../chapter-06-pre-deployment/sku-selection.md) - サービス階層の推奨

---

**ヒント**: このガイドをブックマークして、問題が発生したら参照してください。ほとんどの問題は既に発生済みで、確立された解決策があります！

---

**ナビゲーション**
- **前のレッスン**: [リソースのプロビジョニング](../chapter-04-infrastructure/provisioning.md)
- **次のレッスン**: [デバッグガイド](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責事項：
この文書は AI 翻訳サービス「Co-op Translator」(https://github.com/Azure/co-op-translator) を用いて翻訳されました。正確性には努めていますが、自動翻訳には誤りや不正確な表現が含まれる場合があることをご承知おきください。原文（原言語）の文書を権威ある情報源とみなしてください。重要な情報については専門の人による翻訳を推奨します。本翻訳の使用により生じた誤解や解釈の相違については責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->