# AZD を使って Microsoft SQL データベースと Web アプリをデプロイ

⏱️ **所要時間**: 20〜30分 | 💰 **推定費用**: 約 $15-25/月 | ⭐ **難易度**: 中級

この完全な実用例では、[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) を使用して、Microsoft SQL データベースとともに Python Flask の Web アプリケーションを Azure にデプロイする方法を示します。すべてのコードが含まれており、外部依存関係は不要でテスト済みです。

## この例で学べること

この例を完了することで、以下を学べます:
- インフラストラクチャ・アズ・コードを使用してマルチティアアプリケーション（Web アプリ + データベース）をデプロイする方法
- 秘密情報をハードコーディングせずに安全なデータベース接続を構成する方法
- Application Insights によるアプリケーションの健全性監視
- AZD CLI を使用した Azure リソースの効率的な管理
- セキュリティ、コスト最適化、可観測性に関する Azure のベストプラクティスの遵守

## シナリオ概要
- **Web App**: データベース接続を備えた Python Flask REST API
- **Database**: サンプルデータを含む Azure SQL Database
- **Infrastructure**: Bicep（モジュール化、再利用可能なテンプレート）を使用してプロビジョニング
- **Deployment**: `azd` コマンドによる完全自動化
- **Monitoring**: ログとテレメトリのための Application Insights

## 前提条件

### 必要なツール

開始する前に、これらのツールがインストールされていることを確認してください:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)**（バージョン 2.50.0 以上）
   ```sh
   az --version
   # 期待される出力: azure-cli 2.50.0 以上
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)**（バージョン 1.0.0 以上）
   ```sh
   azd version
   # 期待される出力: azd バージョン 1.0.0 以上
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)**（ローカル開発用）
   ```sh
   python --version
   # 期待される出力: Python 3.8 以上
   ```

4. **[Docker](https://www.docker.com/get-started)**（任意、ローカルのコンテナ開発用）
   ```sh
   docker --version
   # 期待される出力: Docker バージョン 20.10 以上
   ```

### Azure の要件

- 有効な **Azure サブスクリプション**（[無料アカウントの作成](https://azure.microsoft.com/free/)）
- サブスクリプション内でリソースを作成する権限
- サブスクリプションまたはリソースグループに対する **Owner** または **Contributor** ロール

### 必要な知識

これは **中級者向け** の例です。次の内容に慣れていることを推奨します:
- 基本的なコマンドライン操作
- クラウドの基本概念（リソース、リソースグループ）
- Web アプリケーションとデータベースの基本的な理解

**AZD が初めてですか？** まずは [Getting Started guide](../../docs/chapter-01-foundation/azd-basics.md) を参照してください。

## アーキテクチャ

この例は Web アプリケーションと SQL データベースの二層アーキテクチャをデプロイします:

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
- **リソース グループ**: すべてのリソースを格納するコンテナ
- **App Service プラン**: Linux ベースのホスティング（コスト効率のため B1 ティア）
- **Web App**: Flask アプリケーションを実行する Python 3.11 ランタイム
- **SQL Server**: TLS 1.2 以上を使用するマネージド データベース サーバー
- **SQL Database**: Basic ティア（2GB、開発/テスト向け）
- **Application Insights**: モニタリングとログ
- **Log Analytics Workspace**: ログの集中保管

**例え**: これはレストラン（Web アプリ）と業務用冷凍庫（データベース）のようなものです。顧客はメニュー（API エンドポイント）から注文し、キッチン（Flask アプリ）が冷凍庫から食材（データ）を取り出します。レストランのマネージャー（Application Insights）はすべての出来事を追跡します。

## フォルダー構成

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
- **azure.yaml**: AZD に何をどこにデプロイするかを指示します
- **infra/main.bicep**: すべての Azure リソースをオーケストレーションします
- **infra/resources/*.bicep**: 個々のリソース定義（再利用のためにモジュール化）
- **src/web/app.py**: データベースロジックを含む Flask アプリケーション
- **requirements.txt**: Python パッケージの依存関係
- **Dockerfile**: デプロイ用のコンテナ化手順

## クイックスタート（ステップ・バイ・ステップ）

### ステップ 1: クローンして移動

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ 成功確認**: `azure.yaml` と `infra/` フォルダーが表示されていることを確認してください:
```sh
ls
# 期待される: README.md、azure.yaml、infra/、src/
```

### ステップ 2: Azure に認証

```sh
azd auth login
```

これによりブラウザが開き、Azure の認証が行われます。Azure の資格情報でサインインしてください。

**✓ 成功確認**: 次のような表示があるはずです:
```
Logged in to Azure.
```

### ステップ 3: 環境の初期化

```sh
azd init
```

**何が起きるか**: AZD がデプロイ用のローカル設定を作成します。

**表示されるプロンプト**:
- **環境名**: 短い名前を入力してください（例: `dev`, `myapp`）
- **Azure サブスクリプション**: リストからサブスクリプションを選択
- **Azure ロケーション**: リージョンを選択してください（例: `eastus`, `westeurope`）

**✓ 成功確認**: 次のような表示があるはずです:
```
SUCCESS: New project initialized!
```

### ステップ 4: Azure リソースのプロビジョニング

```sh
azd provision
```

**何が起きるか**: AZD がすべてのインフラをデプロイします（5〜8分かかります）:
1. リソース グループを作成
2. SQL Server とデータベースを作成
3. App Service プランを作成
4. Web App を作成
5. Application Insights を作成
6. ネットワークとセキュリティを構成

**入力を求められる項目**:
- **SQL 管理者ユーザー名**: ユーザー名を入力（例: `sqladmin`）
- **SQL 管理者パスワード**: 強力なパスワードを入力（必ず保存してください！）

**✓ 成功確認**: 次のような表示があるはずです:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ 時間**: 5〜8分

### ステップ 5: アプリケーションのデプロイ

```sh
azd deploy
```

**何が起きるか**: AZD が Flask アプリケーションをビルドしてデプロイします:
1. Python アプリケーションをパッケージ化
2. Docker コンテナをビルド
3. Azure Web App にプッシュ
4. サンプルデータでデータベースを初期化
5. アプリケーションを起動

**✓ 成功確認**: 次のような表示があるはずです:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ 時間**: 3〜5分

### ステップ 6: アプリケーションをブラウズ

```sh
azd browse
```

これにより、デプロイされた Web アプリがブラウザで `https://app-<unique-id>.azurewebsites.net` に表示されます。

**✓ 成功確認**: 次のような JSON 出力が表示されるはずです:
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

### ステップ 7: API エンドポイントのテスト

**ヘルスチェック**（データベース接続の検証）:
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**期待されるレスポンス**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**製品一覧の取得**（サンプルデータ）:
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**期待されるレスポンス**:
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

**✓ 成功確認**: すべてのエンドポイントがエラーなく JSON データを返すことを確認してください。

---

**🎉 おめでとうございます！** AZD を使ってデータベース付きの Web アプリケーションを Azure に正常にデプロイしました。

## 設定の詳細

### 環境変数

シークレットは Azure App Service の構成で安全に管理されます—**ソースコードにハードコードしてはいけません**。

**AZD によって自動的に設定されるもの**:
- `SQL_CONNECTION_STRING`: 暗号化された資格情報を含むデータベース接続文字列
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: モニタリング用のテレメトリエンドポイント
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: デプロイ中の自動依存関係インストールを有効にするフラグ

**シークレットの保存場所**:
1. `azd provision` の際に、セキュアなプロンプトで SQL 資格情報を入力します
2. AZD はこれらをローカルの `.azure/<env-name>/.env` ファイルに保存します（git 管理から除外）
3. AZD はそれらを Azure App Service の構成に注入します（保存時に暗号化）
4. アプリケーションはランタイムで `os.getenv()` 経由で読み取ります

### ローカル開発

ローカルでテストするには、サンプルから `.env` ファイルを作成してください:

```sh
cp .env.sample .env
# .env をローカルのデータベース接続情報で編集してください
```

**ローカル開発のワークフロー**:
```sh
# 依存関係をインストールする
cd src/web
pip install -r requirements.txt

# 環境変数を設定する
export SQL_CONNECTION_STRING="your-local-connection-string"

# アプリケーションを実行する
python app.py
```

**ローカルでのテスト**:
```sh
curl http://localhost:8000/health
# 期待される: {"status": "healthy", "database": "connected"}
```

### インフラストラクチャをコード化

すべての Azure リソースは **Bicep テンプレート**（`infra/` フォルダー）で定義されています:

- **モジュール設計**: 各リソースタイプは再利用可能な別ファイルに分割
- **パラメータ化**: SKU、リージョン、命名規則をカスタマイズ可能
- **ベストプラクティス**: Azure の命名基準とセキュリティのデフォルトに従う
- **バージョン管理**: インフラ変更は Git で追跡

**カスタマイズ例**:
データベースのティアを変更するには、`infra/resources/sql-database.bicep` を編集してください:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## セキュリティのベストプラクティス

この例は Azure のセキュリティベストプラクティスに従っています:

### 1. **ソースコードにシークレットを含めない**
- ✅ 資格情報は Azure App Service の構成に保存されます（暗号化）
- ✅ `.env` ファイルは `.gitignore` により Git から除外
- ✅ プロビジョニング時にセキュアなパラメーターでシークレットを渡す

### 2. **接続の暗号化**
- ✅ SQL Server は TLS 1.2 以上を使用
- ✅ Web App は HTTPS のみを強制
- ✅ データベース接続は暗号化チャネルを使用

### 3. **ネットワークセキュリティ**
- ✅ SQL Server のファイアウォールは Azure サービスのみ許可するように構成
- ✅ パブリックネットワークアクセスは制限（Private Endpoints でさらにロックダウン可能）
- ✅ Web App の FTPS は無効

### 4. **認証と認可**
- ⚠️ **現在**: SQL 認証（ユーザー名/パスワード）
- ✅ **本番推奨**: パスワードレス認証のために Azure Managed Identity を使用

**Managed Identity にアップグレードする手順（本番用）**:
1. Web App でマネージド ID を有効化
2. ID に対して SQL 権限を付与
3. 接続文字列をマネージド ID を使用するよう更新
4. パスワードベースの認証を削除

### 5. **監査とコンプライアンス**
- ✅ Application Insights がすべてのリクエストとエラーをログに記録
- ✅ SQL Database の監査が有効（コンプライアンスに合わせて設定可能）
- ✅ すべてのリソースにタグ付けを行いガバナンスを実施

**本番移行前のセキュリティチェックリスト**:
- [ ] SQL 用の Azure Defender を有効化
- [ ] SQL Database に対して Private Endpoints を構成
- [ ] Web Application Firewall (WAF) を有効化
- [ ] シークレットローテーションのために Azure Key Vault を導入
- [ ] Azure AD 認証を構成
- [ ] すべてのリソースで診断ログを有効化

## コスト最適化

**推定月額費用**（2025年11月時点）:

| リソース | SKU/ティア | 推定費用 |
|----------|------------|---------|
| App Service Plan | B1 (Basic) | ~$13/月 |
| SQL Database | Basic (2GB) | ~$5/月 |
| Application Insights | 従量課金 | ~$2/月（低トラフィック） |
| **合計** | | **~$20/月** |

**💡 コスト節約のヒント**:

1. **学習にはフリーティアを使う**:
   - App Service: F1 ティア（無料、使用時間制限あり）
   - SQL Database: Azure SQL Database serverless を使用
   - Application Insights: 毎月 5GB の無料取り込み

2. **使用していないときはリソースを停止する**:
   ```sh
   # Webアプリを停止する（データベースの料金は引き続き発生します）
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # 必要に応じて再起動する
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **テスト後にすべて削除する**:
   ```sh
   azd down
   ```
   これによりすべてのリソースが削除され、課金が停止します。

4. **開発と本番での SKU の使い分け**:
   - **開発**: この例で使用している Basic ティア
   - **本番**: 冗長性を備えた Standard/Premium ティア

**コスト監視**:
- [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement) でコストを確認
- サプライズを避けるためにコストアラートを設定
- トラッキングのためにすべてのリソースに `azd-env-name` タグを付与

**フリーティアの代替案**:
学習目的の場合、`infra/resources/app-service-plan.bicep` を変更できます:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**注意**: フリーティアには制限があります（CPU 1日60分、常時稼働なし）。

## モニタリングと可観測性

### Application Insights 統合

この例には包括的なモニタリングのために **Application Insights** が含まれています:

**監視対象**:
- ✅ HTTP リクエスト（レイテンシ、ステータスコード、エンドポイント）
- ✅ アプリケーションのエラーと例外
- ✅ Flask アプリからのカスタムログ
- ✅ データベース接続の健全性
- ✅ パフォーマンス指標（CPU、メモリ）

**Application Insights へのアクセス**:
1. [Azure Portal](https://portal.azure.com) を開く
2. リソースグループ（`rg-<env-name>`）に移動
3. Application Insights リソース（`appi-<unique-id>`）をクリック

**役立つクエリ**（Application Insights → Logs）:

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

### SQL データベースの監査

**SQL Database の監査が有効**で、以下を追跡します:
- データベースへのアクセスパターン
- ログイン失敗の試行
- スキーマ変更
- データアクセス（コンプライアンス対応）

**監査ログへのアクセス**:
1. Azure Portal → SQL Database → Auditing
2. Log Analytics ワークスペースでログを表示

### リアルタイム監視

**ライブメトリクスの表示**:
1. Application Insights → Live Metrics
2. リアルタイムでリクエスト、失敗、パフォーマンスを確認

**アラートの設定**:
重要なイベントに対してアラートを作成してください:
- 5 分間で HTTP 500 エラーが 5 件を超える場合
- データベース接続の失敗
- 高い応答時間（>2 秒）

**アラート作成の例**:
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
別の Azure リージョンを選択するか、リソース プロバイダーを登録してください：
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. デプロイ中に SQL 接続が失敗する

**症状**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**解決策**:
- SQL Server のファイアウォールが Azure サービスを許可していることを確認する（自動的に構成されます）
- `azd provision` 実行時に SQL 管理者パスワードが正しく入力されているか確認する
- SQL Server が完全にプロビジョニングされていることを確認する（2-3 分かかる場合があります）

**接続を確認**:
```sh
# Azure ポータルで、SQL データベース → クエリエディターに移動します
# 資格情報を使用して接続してみてください
```

#### 3. Web アプリが "Application Error" を表示する

**症状**:
ブラウザーに汎用のエラーページが表示される。

**解決策**:
アプリケーションログを確認する：
```sh
# 最近のログを表示
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**一般的な原因**:
- 環境変数が欠落している（App Service → Configuration を確認）
- Python パッケージのインストールに失敗した（デプロイログを確認）
- データベース初期化エラー（SQL 接続を確認）

#### 4. `azd deploy` が "Build Error" で失敗する

**症状**:
```
Error: Failed to build project
```

**解決策**:
- `requirements.txt` に構文エラーがないことを確認する
- `infra/resources/web-app.bicep` で Python 3.11 が指定されていることを確認する
- Dockerfile が正しいベースイメージを使用していることを確認する

**ローカルでデバッグ**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. AZD コマンド実行時に "Unauthorized" が表示される

**症状**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**解決策**:
Azure に再認証する：
```sh
azd auth login
az login
```

サブスクリプションで正しい権限（Contributor ロール）を持っていることを確認する。

#### 6. データベースのコストが高い

**症状**:
予期しない Azure の請求。

**解決策**:
- テスト後に `azd down` を実行し忘れていないか確認する
- SQL Database が Basic tier を使用していることを確認する（Premium ではない）
- Azure Cost Management でコストを確認する
- コストアラートを設定する

### ヘルプを得る

**すべての AZD 環境変数を表示**:
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

**さらなるヘルプが必要ですか？**
- [AZD トラブルシューティングガイド](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Azure App Service トラブルシューティング](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL トラブルシューティング](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## 実践演習

### 演習 1: デプロイを確認する（初心者）

**目的**: すべてのリソースがデプロイされ、アプリケーションが動作していることを確認する。

**手順**:
1. リソース グループ内のすべてのリソースを一覧表示する:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **期待される結果**: 6-7 個のリソース (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. すべての API エンドポイントをテストする:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **期待される結果**: すべてエラーなく有効な JSON を返す

3. Application Insights を確認する:
   - Azure ポータルで Application Insights に移動する
   - "Live Metrics" に移動する
   - Web アプリでブラウザーをリフレッシュする
   **期待される結果**: リクエストがリアルタイムで表示されるのを確認する

**成功基準**: 6-7 個のリソースが存在し、すべてのエンドポイントがデータを返し、Live Metrics にアクティビティが表示される。

---

### 演習 2: 新しい API エンドポイントを追加する（中級）

**目的**: Flask アプリケーションに新しいエンドポイントを追加する。

**スターターコード**: `src/web/app.py` の現在のエンドポイント

**手順**:
1. `src/web/app.py` を編集し、`get_product()` 関数の後に新しいエンドポイントを追加する:
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

2. 更新したアプリケーションをデプロイする:
   ```sh
   azd deploy
   ```

3. 新しいエンドポイントをテストする:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **期待される結果**: "laptop" に一致する製品を返す

**成功基準**: 新しいエンドポイントが動作し、フィルタされた結果を返し、Application Insights のログに表示される。

---

### 演習 3: 監視とアラートを追加する（上級）

**目的**: アラートを用いたプロアクティブな監視を設定する。

**手順**:
1. HTTP 500 エラー用のアラートを作成する:
   ```sh
   # Application Insights リソースの ID を取得する
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

2. エラーを発生させてアラートをトリガーする:
   ```sh
   # 存在しない製品をリクエストする
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. アラートが発火したか確認する:
   - Azure Portal → Alerts → Alert Rules
   - メールを確認する（設定している場合）

**成功基準**: アラートルールが作成され、エラーでトリガーされ、通知が受信される。

---

### 演習 4: データベーススキーマの変更（上級）

**目的**: 新しいテーブルを追加し、アプリケーションをそれを使用するように変更する。

**手順**:
1. Azure ポータルのクエリエディタを通じて SQL Database に接続する

2. 新しい `categories` テーブルを作成する:
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

3. `src/web/app.py` を更新して、レスポンスにカテゴリ情報を含める

4. デプロイしてテストする

**成功基準**: 新しいテーブルが存在し、製品にカテゴリ情報が表示され、アプリケーションが引き続き動作する。

---

### 演習 5: キャッシングを実装する（エキスパート）

**目的**: パフォーマンス向上のために Azure Redis Cache を追加する。

**手順**:
1. `infra/main.bicep` に Redis Cache を追加する
2. `src/web/app.py` を更新して製品クエリをキャッシュする
3. Application Insights でパフォーマンスの改善を測定する
4. キャッシュ前後の応答時間を比較する

**成功基準**: Redis がデプロイされ、キャッシングが機能し、応答時間が 50% 以上改善する。

**ヒント**：まずは [Azure Cache for Redis のドキュメント](https://learn.microsoft.com/azure/azure-cache-for-redis/) を参照してください。

---

## クリーンアップ

継続的な課金を避けるため、作業が終わったらすべてのリソースを削除してください：

```sh
azd down
```

**確認プロンプト**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

確認するには `y` を入力してください。

**✓ 成功確認**: 
- Azure ポータルからすべてのリソースが削除されている
- 継続的な課金がない
- ローカルの `.azure/<env-name>` フォルダを削除できる

**代替案**（インフラを維持し、データのみ削除）:
```sh
# リソース グループのみ削除する（AZD 設定は保持）
az group delete --name rg-<env-name> --yes
```
## 詳細

### 関連ドキュメント
- [Azure Developer CLI ドキュメント](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database ドキュメント](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service ドキュメント](https://learn.microsoft.com/azure/app-service/)
- [Application Insights ドキュメント](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep 言語リファレンス](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### 本コースの次のステップ
- **[Container Apps の例](../../../../examples/container-app)**: Azure Container Apps を使ってマイクロサービスをデプロイする
- **[AI 統合ガイド](../../../../docs/ai-foundry)**: アプリに AI 機能を追加する
- **[Deployment Best Practices](../../docs/chapter-04-infrastructure/deployment-guide.md)**: 本番用デプロイのパターン

### 上級トピック
- **Managed Identity**：パスワードを廃止し、Azure AD 認証を使用する
- **Private Endpoints**：仮想ネットワーク内でデータベース接続を保護する
- **CI/CD 統合**：GitHub Actions または Azure DevOps でデプロイを自動化する
- **マルチ環境**：開発、ステージング、本番環境を設定する
- **データベースマイグレーション**：Alembic や Entity Framework を使用してスキーマのバージョン管理を行う

### 他のアプローチとの比較

**AZD vs. ARM Templates**:
- ✅ AZD：抽象度が高く、コマンドが簡素
- ⚠️ ARM：冗長で、細かな制御が可能

**AZD vs. Terraform**:
- ✅ AZD：Azure ネイティブで Azure サービスと統合
- ⚠️ Terraform：マルチクラウド対応、エコシステムが大きい

**AZD vs. Azure Portal**:
- ✅ AZD：再現可能、バージョン管理され、自動化可能
- ⚠️ ポータル：手動操作が主体で再現が難しい

**Think of AZD as**: Azure の Docker Compose — 複雑なデプロイのための簡素化された構成。

---

## よくある質問

**Q: 別のプログラミング言語を使えますか？**  
A: はい！`src/web/` を Node.js、C#、Go、または任意の言語に置き換えてください。`azure.yaml` と Bicep を適宜更新してください。

**Q: どうやってデータベースを追加しますか？**  
A: `infra/main.bicep` に別の SQL Database モジュールを追加するか、Azure Database サービスの PostgreSQL/MySQL を使用してください。

**Q: これを本番で使えますか？**  
A: これは出発点です。本番環境では、Managed Identity、Private Endpoints、冗長化、バックアップ戦略、WAF、および監視の強化を追加してください。

**Q: コードデプロイの代わりにコンテナを使いたい場合は？**  
A: Docker コンテナを通して使用する [Container Apps の例](../../../../examples/container-app) を参照してください。

**Q: ローカルマシンからデータベースに接続するには？**  
A: SQL Server のファイアウォールに自分の IP を追加する：
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Q: 新しいデータベースを作成する代わりに既存のデータベースを使えますか？**  
A: はい。`infra/main.bicep` を修正して既存の SQL Server を参照し、接続文字列のパラメーターを更新してください。

---

> **注:** この例は AZD を使用してデータベース付きの Web アプリをデプロイする際のベストプラクティスを示しています。動作するコード、包括的なドキュメント、および学習を強化する実践的な演習を含みます。本番環境へのデプロイでは、組織固有のセキュリティ、スケーリング、コンプライアンス、およびコスト要件を確認してください。

**📚 コースナビゲーション:**
- ← 前へ: [Container Apps の例](../../../../examples/container-app)
- → 次へ: [AI 統合ガイド](../../../../docs/ai-foundry)
- 🏠 [コースホーム](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責事項：
この文書は AI 翻訳サービス「Co‑op Translator」（https://github.com/Azure/co-op-translator）を使用して翻訳されています。正確性に努めてはおりますが、自動翻訳には誤りや不正確な箇所が含まれる可能性があることにご留意ください。正式な情報源は原文（原言語の文書）とみなしてください。重要な情報については、専門の人間翻訳者による翻訳を推奨します。本翻訳の利用に起因する誤解や解釈の相違について、当方は一切の責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->