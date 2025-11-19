<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "10bf998e2d70c35d713fbe6905841b95",
  "translation_date": "2025-11-19T21:05:09+00:00",
  "source_file": "examples/database-app/README.md",
  "language_code": "ja"
}
-->
# Microsoft SQLデータベースとWebアプリのAZDによるデプロイ

⏱️ **所要時間**: 20～30分 | 💰 **推定コスト**: 約15～25ドル/月 | ⭐ **難易度**: 中級

この**完全な動作例**では、[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/)を使用して、Python FlaskのWebアプリケーションとMicrosoft SQLデータベースをAzureにデプロイする方法を示します。すべてのコードが含まれており、テスト済みです。外部依存関係は不要です。

## 学べること

この例を完了することで以下を学べます:
- インフラストラクチャコードを使用してマルチティアアプリケーション（Webアプリ + データベース）をデプロイ
- 秘密情報をハードコーディングせずに安全なデータベース接続を構成
- Application Insightsを使用してアプリケーションの状態を監視
- AZD CLIを使った効率的なAzureリソース管理
- Azureのセキュリティ、コスト最適化、可観測性のベストプラクティスに従う

## シナリオ概要
- **Webアプリ**: データベース接続を備えたPython Flask REST API
- **データベース**: サンプルデータを含むAzure SQLデータベース
- **インフラストラクチャ**: Bicepを使用してプロビジョニング（モジュール化された再利用可能なテンプレート）
- **デプロイ**: `azd`コマンドで完全自動化
- **監視**: ログとテレメトリ用のApplication Insights

## 必要条件

### 必須ツール

開始する前に、以下のツールがインストールされていることを確認してください:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (バージョン2.50.0以上)
   ```sh
   az --version
   # 予想される出力: azure-cli 2.50.0以上
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (バージョン1.0.0以上)
   ```sh
   azd version
   # 予想される出力: azd バージョン 1.0.0 以上
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (ローカル開発用)
   ```sh
   python --version
   # 期待される出力: Python 3.8以上
   ```

4. **[Docker](https://www.docker.com/get-started)** (オプション、ローカルコンテナ開発用)
   ```sh
   docker --version
   # 期待される出力: Dockerバージョン20.10以上
   ```

### Azureの要件

- 有効な**Azureサブスクリプション**（[無料アカウントを作成](https://azure.microsoft.com/free/)）
- サブスクリプション内でリソースを作成する権限
- サブスクリプションまたはリソースグループでの**所有者**または**共同作成者**の役割

### 知識の前提条件

これは**中級レベル**の例です。以下に精通している必要があります:
- 基本的なコマンドライン操作
- クラウドの基本概念（リソース、リソースグループ）
- Webアプリケーションとデータベースの基本的な理解

**AZD初心者ですか？** まずは[入門ガイド](../../docs/getting-started/azd-basics.md)をご覧ください。

## アーキテクチャ

この例では、WebアプリケーションとSQLデータベースを含む2層アーキテクチャをデプロイします:

```
┌─────────────────┐        ┌──────────────────────┐
│  User Browser   │◄──────►│   Azure Web App      │
└─────────────────┘        │   (Flask API)        │
                           │   - /health          │
                           │   - /products        │
                           └──────────┬───────────┘
                                      │
                                      │ Secure Connection
                                      │ (Encrypted)
                                      │
                           ┌──────────▼───────────┐
                           │ Azure SQL Database   │
                           │   - Products table   │
                           │   - Sample data      │
                           └──────────────────────┘
```

**リソースのデプロイ:**
- **リソースグループ**: すべてのリソースを格納するコンテナ
- **App Serviceプラン**: Linuxベースのホスティング（コスト効率の良いB1層）
- **Webアプリ**: Flaskアプリケーションを備えたPython 3.11ランタイム
- **SQLサーバー**: TLS 1.2以上を備えた管理データベースサーバー
- **SQLデータベース**: 基本層（2GB、開発/テストに適したサイズ）
- **Application Insights**: 監視とログ
- **Log Analyticsワークスペース**: 集中ログストレージ

**例え**: レストラン（Webアプリ）とウォークイン冷凍庫（データベース）のようなものです。顧客はメニュー（APIエンドポイント）から注文し、キッチン（Flaskアプリ）が冷凍庫（データ）から材料を取り出します。レストランの管理者（Application Insights）はすべての活動を追跡します。

## フォルダ構造

この例にはすべてのファイルが含まれており、外部依存関係は不要です:

```
examples/database-app/
│
├── README.md                    # This file
├── azure.yaml                   # AZD configuration file
├── .env.sample                  # Sample environment variables
├── .gitignore                   # Git ignore patterns
│
├── infra/                       # Infrastructure as Code (Bicep)
│   ├── main.bicep              # Main orchestration template
│   ├── abbreviations.json      # Azure naming conventions
│   └── resources/              # Modular resource templates
│       ├── sql-server.bicep    # SQL Server configuration
│       ├── sql-database.bicep  # Database configuration
│       ├── app-service-plan.bicep  # Hosting plan
│       ├── app-insights.bicep  # Monitoring setup
│       └── web-app.bicep       # Web application
│
└── src/
    └── web/                    # Application source code
        ├── app.py              # Flask REST API
        ├── requirements.txt    # Python dependencies
        └── Dockerfile          # Container definition
```

**各ファイルの役割:**
- **azure.yaml**: AZDに何をどこにデプロイするかを指示
- **infra/main.bicep**: すべてのAzureリソースをオーケストレーション
- **infra/resources/*.bicep**: 個別のリソース定義（再利用可能なモジュール化）
- **src/web/app.py**: データベースロジックを備えたFlaskアプリケーション
- **requirements.txt**: Pythonパッケージの依存関係
- **Dockerfile**: デプロイ用のコンテナ化手順

## クイックスタート（ステップバイステップ）

### ステップ1: クローンと移動

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ 成功確認**: `azure.yaml`と`infra/`フォルダが表示されることを確認:
```sh
ls
# 期待される: README.md, azure.yaml, infra/, src/
```

### ステップ2: Azureに認証

```sh
azd auth login
```

これにより、Azure認証用のブラウザが開きます。Azureの資格情報でサインインしてください。

**✓ 成功確認**: 以下が表示されるはずです:
```
Logged in to Azure.
```

### ステップ3: 環境を初期化

```sh
azd init
```

**何が起こるか**: AZDがデプロイ用のローカル構成を作成します。

**表示されるプロンプト**:
- **環境名**: 短い名前を入力（例: `dev`, `myapp`）
- **Azureサブスクリプション**: リストからサブスクリプションを選択
- **Azureロケーション**: リージョンを選択（例: `eastus`, `westeurope`）

**✓ 成功確認**: 以下が表示されるはずです:
```
SUCCESS: New project initialized!
```

### ステップ4: Azureリソースをプロビジョニング

```sh
azd provision
```

**何が起こるか**: AZDがすべてのインフラストラクチャをデプロイします（5～8分かかります）:
1. リソースグループを作成
2. SQLサーバーとデータベースを作成
3. App Serviceプランを作成
4. Webアプリを作成
5. Application Insightsを作成
6. ネットワークとセキュリティを構成

**プロンプトで求められるもの**:
- **SQL管理者ユーザー名**: ユーザー名を入力（例: `sqladmin`）
- **SQL管理者パスワード**: 強力なパスワードを入力（保存してください！）

**✓ 成功確認**: 以下が表示されるはずです:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ 時間**: 5～8分

### ステップ5: アプリケーションをデプロイ

```sh
azd deploy
```

**何が起こるか**: AZDがFlaskアプリケーションをビルドしてデプロイします:
1. Pythonアプリケーションをパッケージ化
2. Dockerコンテナをビルド
3. Azure Web Appにプッシュ
4. サンプルデータでデータベースを初期化
5. アプリケーションを開始

**✓ 成功確認**: 以下が表示されるはずです:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ 時間**: 3～5分

### ステップ6: アプリケーションをブラウズ

```sh
azd browse
```

これにより、ブラウザでデプロイされたWebアプリが開きます: `https://app-<unique-id>.azurewebsites.net`

**✓ 成功確認**: JSON出力が表示されるはずです:
```json
{
  "message": "Welcome to the Database App API",
  "endpoints": {
    "/": "This help message",
    "/health": "Health check endpoint",
    "/products": "List all products",
    "/products/<id>": "Get product by ID"
  }
}
```

### ステップ7: APIエンドポイントをテスト

**ヘルスチェック**（データベース接続を確認）:
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**期待される応答**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**製品リスト**（サンプルデータ）:
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**期待される応答**:
```json
[
  {
    "id": 1,
    "name": "Laptop",
    "description": "High-performance laptop",
    "price": 1299.99,
    "created_at": "2025-11-19T10:30:00"
  },
  ...
]
```

**単一製品の取得**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ 成功確認**: すべてのエンドポイントがエラーなしでJSONデータを返す。

---

**🎉 おめでとうございます！** AZDを使用してAzureにデータベース付きWebアプリケーションをデプロイすることに成功しました。

## 設定の詳細

### 環境変数

秘密情報はAzure App Service構成を通じて安全に管理されます—**ソースコードにハードコーディングされることはありません**。

**AZDによる自動設定**:
- `SQL_CONNECTION_STRING`: 暗号化された資格情報を含むデータベース接続
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: 監視テレメトリエンドポイント
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: 自動依存関係インストールを有効化

**秘密情報の保存場所**:
1. `azd provision`中に、SQL資格情報を安全なプロンプトで提供
2. AZDがこれをローカルの`.azure/<env-name>/.env`ファイルに保存（gitで無視される）
3. AZDがこれをAzure App Service構成に注入（保存時に暗号化）
4. アプリケーションが実行時に`os.getenv()`を通じてこれを読み取る

### ローカル開発

ローカルテスト用に、サンプルから`.env`ファイルを作成:

```sh
cp .env.sample .env
# ローカルデータベース接続で.envを編集してください
```

**ローカル開発ワークフロー**:
```sh
# 依存関係をインストールする
cd src/web
pip install -r requirements.txt

# 環境変数を設定する
export SQL_CONNECTION_STRING="your-local-connection-string"

# アプリケーションを実行する
python app.py
```

**ローカルでテスト**:
```sh
curl http://localhost:8000/health
# 期待値: {"status": "healthy", "database": "connected"}
```

### インフラストラクチャコード

すべてのAzureリソースは**Bicepテンプレート**（`infra/`フォルダ）で定義されています:

- **モジュール設計**: 各リソースタイプが再利用可能な独自のファイルを持つ
- **パラメータ化**: SKU、リージョン、命名規則をカスタマイズ可能
- **ベストプラクティス**: Azureの命名基準とセキュリティデフォルトに従う
- **バージョン管理**: インフラストラクチャの変更がGitで追跡される

**カスタマイズ例**:
データベース層を変更するには、`infra/resources/sql-database.bicep`を編集:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## セキュリティのベストプラクティス

この例はAzureのセキュリティベストプラクティスに従っています:

### 1. **ソースコードに秘密情報を含めない**
- ✅ 資格情報はAzure App Service構成に保存（暗号化）
- ✅ `.env`ファイルは`.gitignore`でGitから除外
- ✅ プロビジョニング中に安全なパラメータを通じて秘密情報を渡す

### 2. **暗号化された接続**
- ✅ SQLサーバーはTLS 1.2以上を使用
- ✅ WebアプリはHTTPSのみを強制
- ✅ データベース接続は暗号化されたチャネルを使用

### 3. **ネットワークセキュリティ**
- ✅ SQLサーバーファイアウォールはAzureサービスのみを許可
- ✅ 公共ネットワークアクセスは制限（プライベートエンドポイントでさらに制限可能）
- ✅ WebアプリでFTPSを無効化

### 4. **認証と認可**
- ⚠️ **現在**: SQL認証（ユーザー名/パスワード）
- ✅ **本番推奨**: Azure Managed Identityを使用してパスワードレス認証

**Managed Identityへのアップグレード**（本番用）:
1. WebアプリでManaged Identityを有効化
2. IdentityにSQL権限を付与
3. 接続文字列をManaged Identityを使用するよう更新
4. パスワードベースの認証を削除

### 5. **監査とコンプライアンス**
- ✅ Application Insightsがすべてのリクエストとエラーをログ
- ✅ SQLデータベース監査が有効（コンプライアンス用に設定可能）
- ✅ すべてのリソースにガバナンス用タグを付与

**本番前のセキュリティチェックリスト**:
- [ ] Azure Defender for SQLを有効化
- [ ] SQLデータベースのプライベートエンドポイントを構成
- [ ] Web Application Firewall (WAF)を有効化
- [ ] Azure Key Vaultを使用して秘密情報のローテーションを実装
- [ ] Azure AD認証を構成
- [ ] すべてのリソースで診断ログを有効化

## コスト最適化

**推定月額コスト**（2025年11月時点）:

| リソース | SKU/層 | 推定コスト |
|----------|----------|----------------|
| App Serviceプラン | B1（基本） | 約13ドル/月 |
| SQLデータベース | 基本（2GB） | 約5ドル/月 |
| Application Insights | 従量課金制 | 約2ドル/月（低トラフィック） |
| **合計** | | **約20ドル/月** |

**💡 コスト削減のヒント**:

1. **学習用に無料層を使用**:
   - App Service: F1層（無料、時間制限あり）
   - SQLデータベース: Azure SQL Databaseサーバーレスを使用
   - Application Insights: 月5GBまで無料

2. **使用していないリソースを停止**:
   ```sh
   # ウェブアプリを停止する（データベースは引き続き課金される）
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # 必要に応じて再起動する
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **テスト後にすべて削除**:
   ```sh
   azd down
   ```
   これにより、すべてのリソースが削除され、課金が停止します。

4. **開発と本番のSKU**:
   - **開発**: 基本層（この例で使用）
   - **本番**: 冗長性を備えた標準/プレミアム層

**コスト監視**:
- [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)でコストを確認
- コストアラートを設定して予期せぬ課金を防止
- すべてのリソースに`azd-env-name`タグを付けて追跡

**無料層の代替案**:
学習目的で、`infra/resources/app-service-plan.bicep`を変更:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**注意**: 無料層には制限があります（1日60分のCPU、常時オンなし）。

## 監視と可観測性

### Application Insightsの統合

この例には**Application Insights**が含まれており、包括的な監視が可能です:

**監視対象**:
- ✅ HTTPリクエスト（レイテンシー、ステータスコード、エンドポイント）
- ✅ アプリケーションエラーと例外
- ✅ Flaskアプリからのカスタムログ
- ✅ データベース接続の状態
- ✅ パフォーマンスメトリクス（CPU、メモリ）

**Application Insightsへのアクセス**:
1. [Azure Portal](https://portal.azure.com)を開く
2. リソースグループ（`rg-<env-name>`）に移動
3. Application Insightsリソース（`appi-<unique-id>`）をクリック

**便利なクエリ**（Application Insights → Logs）:

**すべてのリクエストを表示**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**エラーを検索**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**ヘルスエンドポイントを確認**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### SQLデータベース監査

**SQLデータベース監査が有効**で以下を追跡:
- データベースアクセスパターン
- ログイン失敗試行
- スキーマ変更
- データアクセス（コンプライアンス用）

**監査ログへのアクセス**:
1. Azure Portal → SQLデータベース → 監査
2
- 高い応答時間（>2秒）

**アラート作成例**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## トラブルシューティング

### よくある問題と解決策

#### 1. `azd provision` が "Location not available" で失敗する

**症状**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**解決策**:
別のAzureリージョンを選択するか、リソースプロバイダーを登録してください:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. デプロイ中にSQL接続が失敗する

**症状**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**解決策**:
- SQL ServerのファイアウォールがAzureサービスを許可していることを確認（自動的に設定されます）
- `azd provision` 実行時にSQL管理者パスワードが正しく入力されていることを確認
- SQL Serverが完全にプロビジョニングされていることを確認（2～3分かかる場合があります）

**接続確認**:
```sh
# Azureポータルから、SQLデータベース → クエリエディタに移動します
# 資格情報を使用して接続を試みてください
```

#### 3. Webアプリが "Application Error" を表示する

**症状**:
ブラウザに一般的なエラーページが表示される。

**解決策**:
アプリケーションログを確認してください:
```sh
# 最近のログを表示
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**よくある原因**:
- 環境変数が不足している（App Service → Configurationを確認）
- Pythonパッケージのインストールが失敗している（デプロイログを確認）
- データベース初期化エラー（SQL接続を確認）

#### 4. `azd deploy` が "Build Error" で失敗する

**症状**:
```
Error: Failed to build project
```

**解決策**:
- `requirements.txt` に構文エラーがないことを確認
- `infra/resources/web-app.bicep` にPython 3.11が指定されていることを確認
- Dockerfileに正しいベースイメージがあることを確認

**ローカルでデバッグ**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. AZDコマンド実行時に "Unauthorized" が表示される

**症状**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**解決策**:
Azureに再認証してください:
```sh
azd auth login
az login
```

サブスクリプションで正しい権限（Contributorロール）があることを確認してください。

#### 6. データベースコストが高い

**症状**:
予期しないAzure請求書。

**解決策**:
- テスト後に `azd down` を実行し忘れていないか確認
- SQL DatabaseがBasicティア（Premiumではない）を使用していることを確認
- Azure Cost Managementでコストを確認
- コストアラートを設定

### ヘルプを得る

**すべてのAZD環境変数を表示**:
```sh
azd env get-values
```

**デプロイ状況を確認**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**アプリケーションログにアクセス**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**さらにヘルプが必要ですか？**
- [AZDトラブルシューティングガイド](../../docs/troubleshooting/common-issues.md)
- [Azure App Serviceトラブルシューティング](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQLトラブルシューティング](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## 実践演習

### 演習1: デプロイを確認する（初心者向け）

**目標**: すべてのリソースがデプロイされ、アプリケーションが動作していることを確認する。

**手順**:
1. リソースグループ内のすべてのリソースをリスト表示:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **期待される結果**: 6～7個のリソース（Web App、SQL Server、SQL Database、App Service Plan、Application Insights、Log Analytics）

2. すべてのAPIエンドポイントをテスト:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **期待される結果**: すべてがエラーなしで有効なJSONを返す

3. Application Insightsを確認:
   - Azure PortalでApplication Insightsに移動
   - "Live Metrics" に進む
   - Webアプリでブラウザを更新
   **期待される結果**: リアルタイムでリクエストが表示される

**成功基準**: 6～7個のリソースが存在し、すべてのエンドポイントがデータを返し、Live Metricsにアクティビティが表示される。

---

### 演習2: 新しいAPIエンドポイントを追加する（中級者向け）

**目標**: Flaskアプリケーションに新しいエンドポイントを追加する。

**スターターコード**: `src/web/app.py` 内の現在のエンドポイント

**手順**:
1. `src/web/app.py` を編集し、`get_product()` 関数の後に新しいエンドポイントを追加:
   ```python
   @app.route('/products/search/<keyword>')
   def search_products(keyword):
       """Search products by name or description."""
       try:
           conn = get_db_connection()
           cursor = conn.cursor()
           cursor.execute(
               "SELECT id, name, description, price, created_at FROM products WHERE name LIKE ? OR description LIKE ?",
               (f'%{keyword}%', f'%{keyword}%')
           )
           
           products = []
           for row in cursor.fetchall():
               products.append({
                   'id': row[0],
                   'name': row[1],
                   'description': row[2],
                   'price': float(row[3]) if row[3] else None,
                   'created_at': row[4].isoformat() if row[4] else None
               })
           
           cursor.close()
           conn.close()
           
           logger.info(f"Search for '{keyword}' returned {len(products)} results")
           return jsonify(products), 200
           
       except Exception as e:
           logger.error(f"Error searching products: {str(e)}")
           return jsonify({'error': str(e)}), 500
   ```

2. 更新されたアプリケーションをデプロイ:
   ```sh
   azd deploy
   ```

3. 新しいエンドポイントをテスト:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **期待される結果**: "laptop" に一致する製品を返す

**成功基準**: 新しいエンドポイントが動作し、フィルタリングされた結果を返し、Application Insightsログに表示される。

---

### 演習3: モニタリングとアラートを追加する（上級者向け）

**目標**: アラートを設定してプロアクティブなモニタリングを行う。

**手順**:
1. HTTP 500エラーのアラートを作成:
   ```sh
   # アプリケーションインサイトのリソースIDを取得する
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # アラートを作成する
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. エラーを発生させてアラートをトリガー:
   ```sh
   # 存在しない製品をリクエストする
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. アラートが発動したか確認:
   - Azure Portal → Alerts → Alert Rules
   - メールを確認（設定されている場合）

**成功基準**: アラートルールが作成され、エラー時にトリガーされ、通知が受信される。

---

### 演習4: データベーススキーマの変更（上級者向け）

**目標**: 新しいテーブルを追加し、アプリケーションをそれに対応させる。

**手順**:
1. Azure Portal Query Editorを使用してSQL Databaseに接続

2. 新しい `categories` テーブルを作成:
   ```sql
   CREATE TABLE categories (
       id INT PRIMARY KEY IDENTITY(1,1),
       name NVARCHAR(50) NOT NULL,
       description NVARCHAR(200)
   );
   
   INSERT INTO categories (name, description) VALUES
   ('Electronics', 'Electronic devices and accessories'),
   ('Office Supplies', 'Office equipment and supplies');
   
   -- Add category to products table
   ALTER TABLE products ADD category_id INT;
   UPDATE products SET category_id = 1; -- Set all to Electronics
   ```

3. `src/web/app.py` を更新し、レスポンスにカテゴリ情報を含める

4. デプロイとテスト

**成功基準**: 新しいテーブルが存在し、製品にカテゴリ情報が表示され、アプリケーションが正常に動作する。

---

### 演習5: キャッシュを実装する（エキスパート向け）

**目標**: Azure Redis Cacheを追加してパフォーマンスを向上させる。

**手順**:
1. `infra/main.bicep` にRedis Cacheを追加
2. `src/web/app.py` を更新し、製品クエリをキャッシュ
3. Application Insightsでパフォーマンス向上を測定
4. キャッシュ導入前後の応答時間を比較

**成功基準**: Redisがデプロイされ、キャッシュが動作し、応答時間が50%以上改善される。

**ヒント**: [Azure Cache for Redis ドキュメント](https://learn.microsoft.com/azure/azure-cache-for-redis/) を参照してください。

---

## クリーンアップ

継続的な料金を避けるため、作業終了後にすべてのリソースを削除してください:

```sh
azd down
```

**確認プロンプト**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

`y` を入力して確認。

**✓ 成功確認**: 
- Azure Portalからすべてのリソースが削除される
- 継続的な料金が発生しない
- ローカルの `.azure/<env-name>` フォルダーを削除可能

**代替案**（インフラを保持し、データを削除）:
```sh
# リソースグループのみを削除（AZD構成を保持）
az group delete --name rg-<env-name> --yes
```
## 詳細情報

### 関連ドキュメント
- [Azure Developer CLI ドキュメント](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database ドキュメント](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service ドキュメント](https://learn.microsoft.com/azure/app-service/)
- [Application Insights ドキュメント](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep 言語リファレンス](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### このコースの次のステップ
- **[Container Apps Example](../../../../examples/container-app)**: Azure Container Appsでマイクロサービスをデプロイ
- **[AI Integration Guide](../../../../docs/ai-foundry)**: アプリにAI機能を追加
- **[Deployment Best Practices](../../docs/deployment/deployment-guide.md)**: 本番環境のデプロイパターン

### 高度なトピック
- **Managed Identity**: パスワードを削除し、Azure AD認証を使用
- **Private Endpoints**: 仮想ネットワーク内でデータベース接続を保護
- **CI/CD Integration**: GitHub ActionsやAzure DevOpsでデプロイを自動化
- **Multi-Environment**: 開発、ステージング、本番環境を設定
- **Database Migrations**: AlembicやEntity Frameworkを使用してスキーマのバージョン管理

### 他のアプローチとの比較

**AZD vs. ARM Templates**:
- ✅ AZD: 高レベルの抽象化、簡単なコマンド
- ⚠️ ARM: より詳細で、細かい制御が可能

**AZD vs. Terraform**:
- ✅ AZD: Azureネイティブ、Azureサービスと統合
- ⚠️ Terraform: マルチクラウド対応、広範なエコシステム

**AZD vs. Azure Portal**:
- ✅ AZD: 再現可能、バージョン管理可能、自動化可能
- ⚠️ Portal: 手動クリック、再現が困難

**AZDは**: Azure版Docker Composeのようなもの—複雑なデプロイを簡単に構成。

---

## よくある質問

**Q: 別のプログラミング言語を使用できますか？**  
A: はい！ `src/web/` をNode.js、C#、Goなど任意の言語に置き換え、`azure.yaml` とBicepを更新してください。

**Q: データベースを追加するにはどうすればよいですか？**  
A: `infra/main.bicep` に別のSQL Databaseモジュールを追加するか、Azure DatabaseサービスからPostgreSQL/MySQLを使用してください。

**Q: これを本番環境で使用できますか？**  
A: これは出発点です。本番環境では、Managed Identity、Private Endpoints、冗長性、バックアップ戦略、WAF、強化されたモニタリングを追加してください。

**Q: コードデプロイではなくコンテナを使用したい場合はどうすればよいですか？**  
A: [Container Apps Example](../../../../examples/container-app) を参照してください。これにはDockerコンテナが全体で使用されています。

**Q: ローカルマシンからデータベースに接続するにはどうすればよいですか？**  
A: SQL ServerファイアウォールにIPを追加してください:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Q: 新しいデータベースを作成せずに既存のデータベースを使用できますか？**  
A: はい、`infra/main.bicep` を修正して既存のSQL Serverを参照し、接続文字列のパラメータを更新してください。

---

> **注意:** この例は、AZDを使用してデータベース付きWebアプリをデプロイするためのベストプラクティスを示しています。動作するコード、包括的なドキュメント、学習を強化する実践演習が含まれています。本番環境のデプロイについては、セキュリティ、スケーリング、コンプライアンス、コスト要件を組織に合わせて確認してください。

**📚 コースナビゲーション:**
- ← 前: [Container Apps Example](../../../../examples/container-app)
- → 次: [AI Integration Guide](../../../../docs/ai-foundry)
- 🏠 [コースホーム](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:  
この文書は、AI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性を期すよう努めておりますが、自動翻訳には誤りや不正確さが含まれる可能性があります。原文（元の言語で記載された文書）を公式な情報源としてご参照ください。重要な情報については、専門の人間による翻訳をお勧めします。本翻訳の使用に起因する誤解や誤認について、当方は一切の責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->