# 一般的な問題と解決策

**チャプター ナビゲーション:**
- **📚 コースホーム**: [AZD For Beginners](../../README.md)
- **📖 現在の章**: 第7章 - トラブルシューティングとデバッグ
- **⬅️ 前の章**: [第6章: 事前チェック](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ 次へ**: [デバッグガイド](debugging.md)
- **🚀 次の章**: [第8章: 本番環境とエンタープライズパターン](../chapter-08-production/production-ai-practices.md)

## はじめに

この包括的なトラブルシューティングガイドは、Azure Developer CLI を使用する際によく遭遇する問題を網羅しています。認証、デプロイ、インフラ構築、アプリケーション構成に関する共通の問題を診断、トラブルシュートし、解決する方法を学びます。各問題には詳細な症状、根本原因、段階的な解決手順が含まれています。

## 学習目標

このガイドを完了すると、次のことができるようになります:
- Azure Developer CLI の問題診断技術を習得する
- 一般的な認証と権限の問題とその解決策を理解する
- デプロイ失敗、インフラ提供エラー、構成問題を解決する
- 事前の監視とデバッグ戦略を実施する
- 複雑な問題に対する体系的なトラブルシューティング手法を適用する
- 将来の問題を防ぐための適切なログ記録と監視を設定する

## 学習成果

完了後、次のことができるようになります:
- 内蔵の診断ツールを使用して Azure Developer CLI の問題を診断する
- 認証、サブスクリプション、権限に関する問題を独力で解決する
- デプロイ失敗やインフラ構築エラーを効果的にトラブルシュートする
- アプリケーション構成の問題や環境固有の問題をデバッグする
- 潜在的な問題を事前に特定するために監視とアラートを実装する
- ロギング、デバッグ、および問題解決ワークフローのベストプラクティスを適用する

## クイック診断

特定の問題に入る前に、これらのコマンドを実行して診断情報を収集してください:

```bash
# azdのバージョンと状態を確認する
azd version
azd config show

# Azure認証を検証する
az account show
az account list

# 現在の環境を確認する
azd env list
azd env get-values

# デバッグログを有効にする
export AZD_DEBUG=true
azd <command> --debug
```

## 認証の問題

### 問題: "アクセストークンの取得に失敗しました"
**症状:**
- `azd up` が認証エラーで失敗する
- コマンドが「 unauthorized 」「アクセス拒否」エラーを返す

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

# 4. 明示的にサブスクリプションを設定する
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### 問題: デプロイ中の「権限不足」
**症状:**
- デプロイが権限エラーで失敗する
- 特定の Azure リソースを作成できない

**解決策:**
```bash
# 1. Azureのロール割り当てを確認してください
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. 必要なロールを持っていることを確認してください
# - Contributor（リソース作成用）
# - User Access Administrator（ロール割り当て用）

# 3. 適切な権限についてはAzure管理者にお問い合わせください
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

## 🏗️ インフラ構築エラー

### 問題: リソース名の競合
**症状:**
- 「リソース名は既に存在します」などのエラー
- リソース作成時にデプロイが失敗する

**解決策:**
```bash
# 1. トークンを使用して一意のリソース名を使用する
# あなたのBicepテンプレートで:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. 環境名を変更する
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. 既存のリソースをクリーンアップする
azd down --force --purge
```

### 問題: ロケーション/リージョンの利用不可
**症状:**
- 「リソースタイプに対して 'xyz' ロケーションは利用できません」
- 選択したリージョンで特定の SKU が利用不可

**解決策:**
```bash
# 1. リソースタイプの利用可能な場所を確認する
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. 一般的に利用可能なリージョンを使用する
azd config set defaults.location eastus2
# または
azd env set AZURE_LOCATION eastus2

# 3. リージョンごとのサービスの可用性を確認する
# 訪問先：https://azure.microsoft.com/global-infrastructure/services/
```

### 問題: クォータ超過エラー
**症状:**
- 「リソースタイプのクォータを超えました」
- 「リソースの最大数に到達しました」

**解決策:**
```bash
# 1. 現在のクォータ使用状況を確認する
az vm list-usage --location eastus2 -o table

# 2. Azureポータルを通じてクォータの増加をリクエストする
# 移動先: サブスクリプション > 使用量 + クォータ

# 3. 開発にはより小さいSKUを使用する
# main.parameters.jsonで:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. 使用していないリソースをクリーンアップする
az resource list --query "[?contains(name, 'unused')]" -o table
```

### 問題: Bicep テンプレートエラー
**症状:**
- テンプレート検証失敗
- Bicep ファイルの文法エラー

**解決策:**
```bash
# 1. Bicep構文を検証する
az bicep build --file infra/main.bicep

# 2. Bicepリンターを使用する
az bicep lint --file infra/main.bicep

# 3. パラメータファイルの構文を確認する
cat infra/main.parameters.json | jq '.'

# 4. デプロイメントの変更をプレビューする
azd provision --preview
```

## 🚀 デプロイ失敗

### 問題: ビルド失敗
**症状:**
- デプロイ時にアプリがビルド失敗する
- パッケージインストールのエラー

**解決策:**
```bash
# 1. デバッグフラグでビルド出力を確認する
azd deploy --service web --debug

# 2. デプロイされたサービスの状態を確認する
azd show

# 3. ローカルでビルドをテストする
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

### 問題: コンテナデプロイ失敗
**症状:**
- コンテナアプリが起動しない
- イメージプルエラー

**解決策:**
```bash
# 1. ローカルでDockerビルドをテストする
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Azure CLIを使ってコンテナのログを確認する
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. azdを通じてアプリケーションを監視する
azd monitor --logs

# 3. コンテナレジストリへのアクセスを検証する
az acr login --name myregistry

# 4. コンテナアプリの構成を確認する
az containerapp show --name my-app --resource-group my-rg
```

### 問題: データベース接続失敗
**症状:**
- アプリがデータベースに接続できない
- 接続タイムアウトエラー

**解決策:**
```bash
# 1. データベースのファイアウォールルールを確認する
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. アプリケーションからの接続をテストする
# 一時的にアプリに追加してください：
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. 接続文字列の形式を確認する
azd env get-values | grep DATABASE

# 4. データベースサーバーの状態を確認する
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 構成の問題

### 問題: 環境変数が機能しない
**症状:**
- アプリが構成値を読み取れない
- 環境変数が空に見える

**解決策:**
```bash
# 1. 環境変数が設定されていることを確認する
azd env get-values
azd env get DATABASE_URL

# 2. azure.yamlの変数名を確認する
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
# 1. App ServiceのCORSを構成します
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. CORSを処理するようにAPIを更新します
# Express.jsで：
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. 正しいURLで実行されているかを確認します
azd show
```

## 🌍 環境管理の問題

### 問題: 環境切り替えの問題
**症状:**
- 間違った環境が使われている
- 構成が正しく切り替わらない

**解決策:**
```bash
# 1. すべての環境を一覧表示する
azd env list

# 2. 環境を明示的に選択する
azd env select production

# 3. 現在の環境を確認する
azd env list

# 4. 破損している場合は新しい環境を作成する
azd env new production-new
azd env select production-new
```

### 問題: 環境の破損
**症状:**
- 環境が無効な状態を示す
- リソースが構成と一致しない

**解決策:**
```bash
# 1. 環境の状態を更新する
azd env refresh

# 2. 環境設定をリセットする
azd env new production-reset
# 必要な環境変数をコピーする
azd env set DATABASE_URL "your-value"

# 3. 既存のリソースをインポートする（可能な場合）
# リソースIDを使用して .azure/production/config.json を手動で更新する
```

## 🔍 パフォーマンスの問題

### 問題: デプロイ時間が遅い
**症状:**
- デプロイに時間がかかりすぎる
- デプロイ中にタイムアウトが発生する

**解決策:**
```bash
# 1. より速い反復のために特定のサービスをデプロイする
azd deploy --service web
azd deploy --service api

# 2. インフラが変更されていない場合はコードのみのデプロイを使用する
azd deploy  # azd up より速い

# 3. ビルドプロセスを最適化する
# package.json 内で:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. リソースの場所を確認する（同じリージョンを使用）
azd config set defaults.location eastus2
```

### 問題: アプリケーションのパフォーマンス問題
**症状:**
- レスポンスが遅い
- リソース使用率が高い

**解決策:**
```bash
# 1. リソースをスケールアップする
# main.parameters.json の SKU を更新する:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Application Insights の監視を有効にする
azd monitor --overview

# 3. Azure でアプリケーションログを確認する
az webapp log tail --name myapp --resource-group myrg
# またはコンテナーアプリの場合:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. キャッシュを実装する
# インフラストラクチャに Redis キャッシュを追加する
```

## 🛠️ トラブルシューティングツールとコマンド

### デバッグコマンド
```bash
# 包括的なデバッグ
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# azdのバージョンを確認
azd version

# 現在の設定を表示
azd config show

# 接続性をテスト
curl -v https://myapp.azurewebsites.net/health
```

### ログ解析
```bash
# Azure CLI を介したアプリケーションログ
az webapp log tail --name myapp --resource-group myrg

# azd でアプリケーションを監視
azd monitor --logs
azd monitor --live

# Azure リソースログ
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# コンテナログ（コンテナアプリ用）
az containerapp logs show --name myapp --resource-group myrg --follow
```

### リソース調査
```bash
# すべてのリソースを一覧表示
az resource list --resource-group myrg -o table

# リソースの状態を確認
az webapp show --name myapp --resource-group myrg --query state

# ネットワークの診断
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 追加支援の取得

### エスカレーションのタイミング
- すべての解決策を試しても認証問題が続く場合
- Azure サービスのインフラ問題
- 請求またはサブスクリプション関連の問題
- セキュリティ上の懸念やインシデント

### サポートチャネル
```bash
# 1. Azure サービスの状態を確認する
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Azure サポートチケットを作成する
# 次へ移動: https://portal.azure.com -> ヘルプ + サポート

# 3. コミュニティリソース
# - Stack Overflow: azure-developer-cli タグ
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/ja-jp/answers/
```

### 収集すべき情報
サポートに連絡する前に次を収集してください:
- `azd version` の出力
- `azd config show` の出力
- `azd show` の出力（現在のデプロイ状況）
- エラーメッセージ（全文）
- 問題の再現手順
- 環境情報（`azd env get-values`）
- 問題が発生し始めたタイムライン

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
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 問題防止

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

# 5. ドライラン展開を使用する
azd provision --preview
```

### 監視設定
```bash
# アプリケーションインサイトを有効にする
# main.bicep に追加：
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
# 週間健康チェック
./scripts/health-check.sh

# 月次コストレビュー
az consumption usage list --billing-period-name 202401

# 四半期ごとのセキュリティレビュー
az security assessment list --resource-group myrg
```

## 関連リソース

- [デバッグガイド](debugging.md) - 高度なデバッグ手法
- [リソース提供](../chapter-04-infrastructure/provisioning.md) - インフラのトラブルシューティング
- [容量計画](../chapter-06-pre-deployment/capacity-planning.md) - リソース計画のガイダンス
- [SKU 選択](../chapter-06-pre-deployment/sku-selection.md) - サービス階層の推奨

---

<strong>ヒント</strong>: このガイドをブックマークして、問題が発生したときはいつでも参照してください。ほとんどの問題は過去に発生しており、確立された解決策があります！

---

<strong>ナビゲーション</strong>
- <strong>前のレッスン</strong>: [リソース提供](../chapter-04-infrastructure/provisioning.md)
- <strong>次のレッスン</strong>: [デバッグガイド](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：  
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性に努めておりますが、自動翻訳には誤りや不正確な箇所が含まれる可能性があります。原文の言語による文書が正式な情報源と見なされます。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じる誤解や誤訳については、一切の責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->