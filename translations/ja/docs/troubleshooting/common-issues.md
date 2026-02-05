# よくある問題と解決策

**章のナビゲーション:**
- **📚 コースホーム**: [AZD 初心者向け](../../README.md)
- **📖 現在の章**: 第7章 - トラブルシューティングとデバッグ
- **⬅️ 前の章**: [第6章: 事前チェック](../pre-deployment/preflight-checks.md)
- **➡️ 次へ**: [デバッグガイド](debugging.md)
- **🚀 次の章**: [第8章: 本番環境とエンタープライズパターン](../microsoft-foundry/production-ai-practices.md)

## はじめに

この包括的なトラブルシューティングガイドでは、Azure Developer CLI を使用する際によく遭遇する問題について説明します。認証、デプロイ、インフラストラクチャのプロビジョニング、アプリケーション設定に関する一般的な問題を診断し、トラブルシューティングし、解決する方法を学びます。各問題には、詳細な症状、根本原因、および段階的な解決手順が含まれています。

## 学習目標

このガイドを完了することで、以下を習得できます:
- Azure Developer CLI の問題に対する診断技術をマスターする
- 一般的な認証および権限の問題とその解決策を理解する
- デプロイの失敗、インフラストラクチャのプロビジョニングエラー、設定の問題を解決する
- プロアクティブな監視およびデバッグ戦略を実装する
- 複雑な問題に対する体系的なトラブルシューティング手法を適用する
- 将来の問題を防ぐために適切なログ記録と監視を設定する

## 学習成果

完了後、以下ができるようになります:
- 組み込みの診断ツールを使用して Azure Developer CLI の問題を診断する
- 認証、サブスクリプション、および権限に関連する問題を独自に解決する
- デプロイの失敗やインフラストラクチャのプロビジョニングエラーを効果的にトラブルシューティングする
- アプリケーション設定の問題や環境固有の問題をデバッグする
- 潜在的な問題をプロアクティブに特定するための監視とアラートを実装する
- ログ記録、デバッグ、および問題解決のワークフローにおけるベストプラクティスを適用する

## クイック診断

特定の問題に取り組む前に、以下のコマンドを実行して診断情報を収集してください:

```bash
# azdのバージョンと正常性を確認する
azd version
azd config list

# Azure認証を確認する
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

### 問題: "アクセストークンの取得に失敗しました"
**症状:**
- `azd up` が認証エラーで失敗する
- コマンドが "unauthorized" または "access denied" を返す

**解決策:**
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

### 問題: デプロイ中の "権限不足"
**症状:**
- デプロイが権限エラーで失敗する
- 特定の Azure リソースを作成できない

**解決策:**
```bash
# 1. Azure のロール割り当てを確認する
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. 必要なロールを持っていることを確認する
# - Contributor (リソース作成用)
# - User Access Administrator (ロール割り当て用)

# 3. 適切な権限について Azure 管理者に連絡する
```

### 問題: マルチテナント認証の問題
**解決策:**
```bash
# 1. 特定のテナントでログインする
az login --tenant "your-tenant-id"

# 2. 設定でテナントを設定する
azd config set auth.tenantId "your-tenant-id"

# 3. テナントを切り替える場合はテナントキャッシュをクリアする
az account clear
```

## 🏗️ インフラストラクチャのプロビジョニングエラー

### 問題: リソース名の競合
**症状:**
- "The resource name already exists" エラー
- リソース作成中にデプロイが失敗する

**解決策:**
```bash
# 1. トークンを使用して一意のリソース名を使用する
# Bicep テンプレートで:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. 環境名を変更する
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. 既存のリソースをクリーンアップする
azd down --force --purge
```

### 問題: 利用可能な場所/リージョンがない
**症状:**
- "The location 'xyz' is not available for resource type"
- 選択したリージョンで特定の SKU が利用できない

**解決策:**
```bash
# 1. リソースタイプの利用可能な場所を確認する
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. 一般的に利用可能なリージョンを使用する
azd config set defaults.location eastus2
# または
azd env set AZURE_LOCATION eastus2

# 3. リージョンごとのサービスの利用状況を確認する
# 訪問: https://azure.microsoft.com/global-infrastructure/services/
```

### 問題: クォータ超過エラー
**症状:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**解決策:**
```bash
# 1. 現在のクォータ使用量を確認する
az vm list-usage --location eastus2 -o table

# 2. Azureポータルを通じてクォータの増加をリクエストする
# 移動先: サブスクリプション > 使用量 + クォータ

# 3. 開発には小さいSKUを使用する
# main.parameters.json内:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. 未使用のリソースをクリーンアップする
az resource list --query "[?contains(name, 'unused')]" -o table
```

### 問題: Bicep テンプレートエラー
**症状:**
- テンプレート検証の失敗
- Bicep ファイルの構文エラー

**解決策:**
```bash
# 1. Bicepの構文を検証する
az bicep build --file infra/main.bicep

# 2. Bicepリンターを使用する
az bicep lint --file infra/main.bicep

# 3. パラメータファイルの構文を確認する
cat infra/main.parameters.json | jq '.'

# 4. デプロイ変更をプレビューする
azd provision --preview
```

## 🚀 デプロイの失敗

### 問題: ビルドの失敗
**症状:**
- デプロイ中にアプリケーションがビルドに失敗する
- パッケージインストールエラー

**解決策:**
```bash
# 1. ビルドログを確認する
azd logs --service web
azd deploy --service web --debug

# 2. ローカルでビルドをテストする
cd src/web
npm install
npm run build

# 3. Node.js/Pythonのバージョン互換性を確認する
node --version  # azure.yamlの設定と一致する必要がある
python --version

# 4. ビルドキャッシュをクリアする
rm -rf node_modules package-lock.json
npm install

# 5. コンテナを使用している場合はDockerfileを確認する
docker build -t test-image .
docker run --rm test-image
```

### 問題: コンテナデプロイの失敗
**症状:**
- コンテナアプリが起動しない
- イメージプルエラー

**解決策:**
```bash
# 1. ローカルでDockerビルドをテストする
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. コンテナログを確認する
azd logs --service api --follow

# 3. コンテナレジストリへのアクセスを確認する
az acr login --name myregistry

# 4. コンテナアプリの設定を確認する
az containerapp show --name my-app --resource-group my-rg
```

### 問題: データベース接続の失敗
**症状:**
- アプリケーションがデータベースに接続できない
- 接続タイムアウトエラー

**解決策:**
```bash
# 1. データベースのファイアウォールルールを確認する
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. アプリケーションからの接続をテストする
# アプリに一時的に追加する:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. 接続文字列の形式を確認する
azd env get-values | grep DATABASE

# 4. データベースサーバーの状態を確認する
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 設定の問題

### 問題: 環境変数が機能しない
**症状:**
- アプリが設定値を読み取れない
- 環境変数が空のように見える

**解決策:**
```bash
# 1. 環境変数が設定されていることを確認する
azd env get-values
azd env get DATABASE_URL

# 2. azure.yaml内の変数名を確認する
cat azure.yaml | grep -A 5 env:

# 3. アプリケーションを再起動する
azd deploy --service web

# 4. アプリサービスの構成を確認する
az webapp config appsettings list --name myapp --resource-group myrg
```

### 問題: SSL/TLS 証明書の問題
**症状:**
- HTTPS が機能しない
- 証明書検証エラー

**解決策:**
```bash
# 1. SSL証明書のステータスを確認する
az webapp config ssl list --resource-group myrg

# 2. HTTPSのみを有効にする
az webapp update --name myapp --resource-group myrg --https-only true

# 3. カスタムドメインを追加する（必要に応じて）
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### 問題: CORS 設定の問題
**症状:**
- フロントエンドが API を呼び出せない
- クロスオリジンリクエストがブロックされる

**解決策:**
```bash
# 1. App ServiceのCORSを設定する
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. APIを更新してCORSを処理する
# Express.jsで:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. 正しいURLで実行されているか確認する
azd show
```

## 🌍 環境管理の問題

### 問題: 環境切り替えの問題
**症状:**
- 間違った環境が使用される
- 設定が正しく切り替わらない

**解決策:**
```bash
# 1. すべての環境を一覧表示する
azd env list

# 2. 環境を明示的に選択する
azd env select production

# 3. 現在の環境を確認する
azd env show

# 4. 環境が破損している場合は新しい環境を作成する
azd env new production-new
azd env select production-new
```

### 問題: 環境の破損
**症状:**
- 環境が無効な状態を示す
- リソースが設定と一致しない

**解決策:**
```bash
# 1. 環境状態を更新する
azd env refresh

# 2. 環境設定をリセットする
azd env new production-reset
# 必要な環境変数をコピーする
azd env set DATABASE_URL "your-value"

# 3. 既存のリソースをインポートする（可能であれば）
# 手動で .azure/production/config.json をリソースIDで更新する
```

## 🔍 パフォーマンスの問題

### 問題: デプロイ時間が遅い
**症状:**
- デプロイに時間がかかりすぎる
- デプロイ中にタイムアウトが発生する

**解決策:**
```bash
# 1. 並列デプロイを有効にする
azd config set deploy.parallelism 5

# 2. 増分デプロイを使用する
azd deploy --incremental

# 3. ビルドプロセスを最適化する
# package.json内:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. リソースの場所を確認する（同じリージョンを使用する）
azd config set defaults.location eastus2
```

### 問題: アプリケーションのパフォーマンス問題
**症状:**
- 応答時間が遅い
- リソース使用量が高い

**解決策:**
```bash
# 1. リソースをスケールアップする
# main.parameters.jsonでSKUを更新する:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Application Insightsモニタリングを有効にする
azd monitor

# 3. アプリケーションログでボトルネックを確認する
azd logs --service api --follow

# 4. キャッシングを実装する
# インフラストラクチャにRedisキャッシュを追加する
```

## 🛠️ トラブルシューティングツールとコマンド

### デバッグコマンド
```bash
# 包括的なデバッグ
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# システム情報を確認
azd info

# 設定を検証
azd config validate

# 接続性をテスト
curl -v https://myapp.azurewebsites.net/health
```

### ログ分析
```bash
# アプリケーションログ
azd logs --service web --follow
azd logs --service api --since 1h

# Azureリソースログ
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# コンテナログ（コンテナアプリ用）
az containerapp logs show --name myapp --resource-group myrg --follow
```

### リソース調査
```bash
# すべてのリソースを一覧表示
az resource list --resource-group myrg -o table

# リソースのステータスを確認
az webapp show --name myapp --resource-group myrg --query state

# ネットワーク診断
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 追加のサポートを得る

### エスカレーションのタイミング
- すべての解決策を試しても認証の問題が解決しない場合
- Azure サービスに関連するインフラストラクチャの問題
- 請求またはサブスクリプションに関連する問題
- セキュリティ上の懸念やインシデント

### サポートチャネル
```bash
# 1. Azure Service Health を確認する
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Azure サポートチケットを作成する
# 次に移動: https://portal.azure.com -> ヘルプ + サポート

# 3. コミュニティリソース
# - Stack Overflow: azure-developer-cli タグ
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### 収集すべき情報
サポートに連絡する前に、以下を収集してください:
- `azd version` の出力
- `azd info` の出力
- エラーメッセージ（全文）
- 問題を再現する手順
- 環境の詳細（`azd env show`）
- 問題が発生し始めた時期のタイムライン

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

## 📊 問題の予防

### デプロイ前のチェックリスト
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

# 5. ドライランデプロイメントを使用する
azd provision --preview
```

### 監視のセットアップ
```bash
# アプリケーションインサイトを有効にする
# main.bicepに追加:
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

### 定期的なメンテナンス
```bash
# 毎週の健康チェック
./scripts/health-check.sh

# 毎月のコストレビュー
az consumption usage list --billing-period-name 202401

# 四半期ごとのセキュリティレビュー
az security assessment list --resource-group myrg
```

## 関連リソース

- [デバッグガイド](debugging.md) - 高度なデバッグ技術
- [リソースのプロビジョニング](../deployment/provisioning.md) - インフラストラクチャのトラブルシューティング
- [キャパシティプランニング](../pre-deployment/capacity-planning.md) - リソース計画のガイダンス
- [SKU 選択](../pre-deployment/sku-selection.md) - サービス層の推奨事項

---

**ヒント**: このガイドをブックマークして、問題が発生したときに参照してください。ほとんどの問題は過去に発生しており、確立された解決策があります！

---

**ナビゲーション**
- **前のレッスン**: [リソースのプロビジョニング](../deployment/provisioning.md)
- **次のレッスン**: [デバッグガイド](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:  
この文書は、AI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性を期しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があります。原文（元の言語で記載された文書）を公式な情報源としてご参照ください。重要な情報については、専門の人間による翻訳をお勧めします。本翻訳の使用に起因する誤解や誤認について、当方は一切の責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->