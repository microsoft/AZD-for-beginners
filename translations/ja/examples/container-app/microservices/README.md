# マイクロサービスアーキテクチャ - Container App の例

⏱️ **推定時間**: 25-35 分 | 💰 **推定費用**: 約 $50-100/月 | ⭐ **複雑さ**: 上級

Azure Container Apps に AZD CLI を使ってデプロイする、**簡素化されたが実用的な**マイクロサービスアーキテクチャの例です。この例では、サービス間通信、コンテナのオーケストレーション、監視を実践的な2サービス構成で示します。

> **📚 学習アプローチ**: この例は最小構成の2サービス（API ゲートウェイ + バックエンドサービス）から始め、実際にデプロイして学べるように設計されています。この基礎を習得した後、フルなマイクロサービスエコシステムへ拡張するためのガイダンスを提供します。

## 学べること

この例を完了することで、次のことができるようになります:
- 複数のコンテナを Azure Container Apps にデプロイする
- 内部ネットワーキングによるサービス間通信を実装する
- 環境に基づいたスケーリングとヘルスチェックを構成する
- Application Insights で分散アプリケーションを監視する
- マイクロサービスのデプロイパターンとベストプラクティスを理解する
- シンプルな構成から複雑なアーキテクチャへ段階的に拡張する方法を学ぶ

## アーキテクチャ

### フェーズ 1: 本例で構築するもの（この例に含まれる）

```
                    ┌─────────────────────────────┐
                    │         Internet            │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTPS
                                   │
                    ┌──────────────▼──────────────┐
                    │      API Gateway            │
                    │   (Node.js Container)       │
                    │   - Routes requests         │
                    │   - Health checks           │
                    │   - Request logging         │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTP (internal)
                                   │
                    ┌──────────────▼──────────────┐
                    │    Product Service          │
                    │   (Python Container)        │
                    │   - Product CRUD            │
                    │   - In-memory data store    │
                    │   - REST API                │
                    └──────────────┬──────────────┘
                                   │
                    ┌──────────────▼──────────────┐
                    │   Application Insights      │
                    │   (Monitoring & Logs)       │
                    └─────────────────────────────┘
```

**なぜシンプルから始めるのか?**
- ✅ 迅速にデプロイして理解できる（25-35 分）
- ✅ 複雑さを排してコアなマイクロサービスパターンを学べる
- ✅ 修正や実験が可能な動作するコード
- ✅ 学習コストが低い（約 $50-100/月 vs $300-1400/月）
- ✅ データベースやメッセージキューを追加する前に自信を築ける

**たとえ**: これは運転を学ぶようなものです。空の駐車場（2サービス）で基本を習得し、そこから街中の交通（データベースを伴う5+サービス）へ進みます。

### フェーズ 2: 将来的な拡張（参照アーキテクチャ）

一度2サービス構成を習得したら、次のように拡張できます:

```
Full Architecture (Not Included - For Reference)
├── API Gateway (✅ Included)
├── Product Service (✅ Included)
├── Order Service (🔜 Add next)
├── User Service (🔜 Add next)
├── Notification Service (🔜 Add last)
├── Azure Service Bus (🔜 For async communication)
├── Cosmos DB (🔜 For product persistence)
├── Azure SQL (🔜 For order management)
└── Azure Storage (🔜 For file storage)
```

詳細な手順については、末尾の「拡張ガイド」セクションを参照してください。

## 含まれる機能

✅ **サービス検出**: コンテナ間の DNS ベースの自動検出  
✅ **ロードバランシング**: レプリカ間のビルトイン負荷分散  
✅ **自動スケーリング**: HTTP リクエストに基づくサービスごとの独立スケーリング  
✅ **ヘルス監視**: 両サービスのライフゲネスおよびレディネスプローブ  
✅ **分散ログ収集**: Application Insights による集中ロギング  
✅ **内部ネットワーク**: セキュアなサービス間通信  
✅ **コンテナオーケストレーション**: 自動デプロイとスケーリング  
✅ **ゼロダウンタイム更新**: リビジョン管理によるローリングアップデート  

## 前提条件

### 必要なツール

開始する前に、次のツールがインストールされていることを確認してください:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** （バージョン 1.0.0 以上）
   ```bash
   azd version
   # 期待される出力: azd バージョン 1.0.0 以上
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** （バージョン 2.50.0 以上）
   ```bash
   az --version
   # 期待される出力: azure-cli 2.50.0 以上
   ```

3. **[Docker](https://www.docker.com/get-started)** （ローカル開発/テスト用 - 任意）
   ```bash
   docker --version
   # 期待される出力: Docker バージョン 20.10 以上
   ```

### Azure 要件

- 有効な **Azure サブスクリプション**（[無料アカウントを作成](https://azure.microsoft.com/free/)）
- サブスクリプション内でリソースを作成する権限
- サブスクリプションまたはリソース グループに対する **Contributor** ロール

### 知識の前提

これは **上級レベル** の例です。次のことが前提になります:
- [Simple Flask API の例](../../../../../examples/container-app/simple-flask-api) を完了していること
- マイクロサービスアーキテクチャの基本的な理解
- REST API と HTTP の基本知識
- コンテナの概念の理解

**Container Apps に不慣れですか?** まずは [Simple Flask API の例](../../../../../examples/container-app/simple-flask-api) から基礎を学んでください。

## クイックスタート（ステップバイステップ）

### ステップ 1: クローンして移動

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ 成功確認**: `azure.yaml` が表示されていることを確認してください:
```bash
ls
# 期待される: README.md、azure.yaml、infra/、src/
```

### ステップ 2: Azure への認証

```bash
azd auth login
```

これによりブラウザが開いて Azure 認証が行われます。Azure の資格情報でサインインしてください。

**✓ 成功確認**: 次のような表示がされます:
```
Logged in to Azure.
```

### ステップ 3: 環境の初期化

```bash
azd init
```

**表示されるプロンプト**:
- **環境名 (Environment name)**: 短い名前を入力してください（例: `microservices-dev`）
- **Azure subscription**: サブスクリプションを選択
- **Azure location**: リージョンを選択（例: `eastus`, `westeurope`）

**✓ 成功確認**: 次のような表示がされます:
```
SUCCESS: New project initialized!
```

### ステップ 4: インフラとサービスのデプロイ

```bash
azd up
```

**起きること**（8-12 分かかります）:
1. Container Apps 環境を作成します
2. 監視用に Application Insights を作成します
3. API ゲートウェイコンテナ（Node.js）をビルドします
4. Product Service コンテナ（Python）をビルドします
5. 両コンテナを Azure にデプロイします
6. ネットワーキングとヘルスチェックを構成します
7. 監視とログ収集をセットアップします

**✓ 成功確認**: 次のような表示がされます:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ 時間**: 8-12 分

### ステップ 5: デプロイの検証

```bash
# ゲートウェイのエンドポイントを取得する
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# APIゲートウェイの正常性をテストする
curl $GATEWAY_URL/health

# 想定される出力:
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**ゲートウェイ経由でプロダクトサービスをテスト**:
```bash
# 製品を一覧表示
curl $GATEWAY_URL/api/products

# 期待される出力:
# [
#   {"id":1,"name":"ノートパソコン","price":999.99,"stock":50},
#   {"id":2,"name":"マウス","price":29.99,"stock":200},
#   {"id":3,"name":"キーボード","price":79.99,"stock":150}
# ]
```

**✓ 成功確認**: 両エンドポイントがエラーなく JSON データを返します。

---

**🎉 おめでとうございます！** Azure にマイクロサービスアーキテクチャをデプロイしました！

## プロジェクト構成

すべての実装ファイルが含まれています—完全に動作する例です:

```
microservices/
│
├── README.md                         # This file
├── azure.yaml                        # AZD configuration
├── .gitignore                        # Git ignore patterns
│
├── infra/                           # Infrastructure as Code (Bicep)
│   ├── main.bicep                   # Main orchestration
│   ├── abbreviations.json           # Naming conventions
│   ├── core/                        # Shared infrastructure
│   │   ├── container-apps-environment.bicep  # Container environment + registry
│   │   └── monitor.bicep            # Application Insights + Log Analytics
│   └── app/                         # Service definitions
│       ├── api-gateway.bicep        # API Gateway container app
│       └── product-service.bicep    # Product Service container app
│
└── src/                             # Application source code
    ├── api-gateway/                 # Node.js API Gateway
    │   ├── app.js                   # Express server with routing
    │   ├── package.json             # Node dependencies
    │   └── Dockerfile               # Container definition
    └── product-service/             # Python Product Service
        ├── main.py                  # Flask API with product data
        ├── requirements.txt         # Python dependencies
        └── Dockerfile               # Container definition
```

**各コンポーネントの役割:**

**インフラストラクチャ (infra/)**:
- `main.bicep`: すべての Azure リソースと依存関係をオーケストレーションします
- `core/container-apps-environment.bicep`: Container Apps 環境と Azure Container Registry を作成します
- `core/monitor.bicep`: 分散ログ用の Application Insights を設定します
- `app/*.bicep`: スケーリングとヘルスチェックを含む各コンテナアプリ定義

**API ゲートウェイ (src/api-gateway/)**:
- 外部向けのサービスで、バックエンドサービスへのリクエストをルーティングします
- ロギング、エラーハンドリング、リクエスト転送を実装
- サービス間の HTTP 通信の例を示します

**Product Service (src/product-service/)**:
- 製品カタログを管理する内部サービス（簡便のためインメモリ）
- ヘルスチェックを備えた REST API
- バックエンドマイクロサービスのパターンの例

## サービス概要

### API Gateway (Node.js/Express)

**ポート**: 8080  
**アクセス**: パブリック（外部イングレス）  
**目的**: 受信リクエストを適切なバックエンドサービスにルーティングする  

**エンドポイント**:
- `GET /` - サービス情報
- `GET /health` - ヘルスチェックエンドポイント
- `GET /api/products` - Product Service へ転送（一覧取得）
- `GET /api/products/:id` - Product Service へ転送（ID で取得）

**主な機能**:
- axios によるリクエストルーティング
- 集中ロギング
- エラーハンドリングとタイムアウト管理
- 環境変数を使ったサービス検出
- Application Insights 統合

**コードハイライト** (`src/api-gateway/app.js`):
```javascript
// 内部サービス間通信
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**ポート**: 8000  
**アクセス**: 内部のみ（外部イングレスなし）  
**目的**: インメモリデータで製品カタログを管理する  

**エンドポイント**:
- `GET /` - サービス情報
- `GET /health` - ヘルスチェックエンドポイント
- `GET /products` - すべての製品を一覧表示
- `GET /products/<id>` - ID で製品を取得

**主な機能**:
- Flask による RESTful API
- インメモリの製品ストア（シンプルでデータベース不要）
- プローブによるヘルス監視
- 構造化ログ
- Application Insights 統合

**データモデル**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**なぜ内部専用なのか?**
Product Service は公開されていません。すべてのリクエストは API ゲートウェイを経由する必要があり、これにより次を提供します:
- セキュリティ: 制御されたアクセスポイント
- 柔軟性: クライアントに影響を与えずにバックエンドを変更可能
- 監視: リクエストの一元ログ

## サービス間通信の理解

### サービス間の通信方法

この例では、API ゲートウェイが Product Service と **内部 HTTP 呼び出し** を使って通信します:

```javascript
// APIゲートウェイ (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// 内部のHTTPリクエストを行う
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**重要なポイント**:

1. **DNS ベースの検出**: Container Apps は内部サービス用の DNS を自動的に提供します
   - Product Service の FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - 簡略化して: `http://product-service`（Container Apps が解決します）

2. **公開されていない**: Product Service は Bicep で `external: false` に設定されています
   - Container Apps 環境内でのみアクセス可能
   - インターネットからは到達できません

3. **環境変数**: サービス URL はデプロイ時に注入されます
   - Bicep が内部 FQDN をゲートウェイに渡します
   - アプリケーションコードにハードコーディングされた URL はありません

**たとえ**: これはオフィスの部屋に例えられます。API ゲートウェイは受付（公開向け）で、Product Service は社内の個室（内部のみ）です。来訪者は受付を通ってから個室に向かいます。

## デプロイオプション

### フルデプロイ（推奨）

```bash
# インフラストラクチャと両方のサービスをデプロイする
azd up
```

これによりデプロイされます:
1. Container Apps 環境
2. Application Insights
3. Container Registry
4. API Gateway コンテナ
5. Product Service コンテナ

**時間**: 8-12 分

### 個別サービスのデプロイ

```bash
# 初回の azd up 実行後に1つのサービスだけをデプロイする
azd deploy api-gateway

# または product サービスをデプロイする
azd deploy product-service
```

**ユースケース**: 1つのサービスのコードを更新して、そのサービスだけを再デプロイしたい場合。

### 設定の更新

```bash
# スケーリングパラメータを変更する
azd env set GATEWAY_MAX_REPLICAS 30

# 新しい構成で再デプロイする
azd up
```

## 構成

### スケーリング構成

両サービスは Bicep ファイルで HTTP ベースの自動スケーリングが設定されています:

**API Gateway**:
- 最小レプリカ数: 2（可用性のため常に少なくとも 2）
- 最大レプリカ数: 20
- スケールトリガー: レプリカあたり 50 同時リクエスト

**Product Service**:
- 最小レプリカ数: 1（必要に応じてゼロにスケール可能）
- 最大レプリカ数: 10
- スケールトリガー: レプリカあたり 100 同時リクエスト

**スケーリングのカスタマイズ**（`infra/app/*.bicep` 内）:
```bicep
scale: {
  minReplicas: 1
  maxReplicas: 10
  rules: [
    {
      name: 'http-scale-rule'
      http: {
        metadata: {
          concurrentRequests: '100'  // Adjust this
        }
      }
    }
  ]
}
```

### リソース割り当て

**API Gateway**:
- CPU: 1.0 vCPU
- メモリ: 2 GiB
- 理由: すべての外部トラフィックを処理するため

**Product Service**:
- CPU: 0.5 vCPU
- メモリ: 1 GiB
- 理由: 軽量なインメモリ処理のため

### ヘルスチェック

両サービスにはライヴネスとレディネスプローブが含まれています:

```bicep
probes: [
  {
    type: 'Liveness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 10
    periodSeconds: 30
  }
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 5
    periodSeconds: 10
  }
]
```

**これが意味すること**:
- **ライヴネス**: ヘルスチェックが失敗すると、Container Apps はコンテナを再起動します
- **レディネス**: レプリカが準備完了でない場合、Container Apps はそのレプリカへのトラフィックを停止します



## 監視と可観測性

### サービスログの表示

```bash
# azd monitor を使ってログを表示する
azd monitor --logs

# または特定の Container Apps に対して Azure CLI を使用する:
# API Gateway からログをストリーミングする
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# 最近の product service のログを表示する
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**期待される出力**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights クエリ

Azure ポータルで Application Insights にアクセスし、以下のクエリを実行してください:

**遅いリクエストを検索**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**サービス間呼び出しを追跡**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**サービスごとのエラー率**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**時間経過ごとのリクエスト量**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### 監視ダッシュボードへのアクセス

```bash
# Application Insights の詳細を取得
azd env get-values | grep APPLICATIONINSIGHTS

# Azure ポータルのモニタリングを開く
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### ライブメトリクス

1. Azure ポータルで Application Insights に移動する  
2. 「Live Metrics」をクリックする  
3. リアルタイムのリクエスト、失敗、パフォーマンスを確認する  
4. 次のコマンドを実行してテストしてください: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## 実践演習

[注: デプロイ検証、データ変更、自動スケーリングテスト、エラーハンドリング、3番目のサービスの追加などを含む詳細な手順は、上の「実践演習」セクションを参照してください。]

## コスト分析

### 推定月額コスト（この2サービス例の場合）

| Resource | Configuration | Estimated Cost |
|----------|--------------|----------------|
| API Gateway | 2-20 レプリカ, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 レプリカ, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic プラン | $5 |
| Application Insights | 1-2 GB/月 | $5-10 |
| Log Analytics | 1 GB/月 | $3 |
| **合計** | | **$58-243/月** |

**使用状況別のコスト内訳**:
- **ライトトラフィック**（テスト/学習）: 約 $60/月
- **中程度のトラフィック**（小規模本番）: 約 $120/月
- **高トラフィック**（繁忙期）: 約 $240/月

### コスト最適化のヒント

1. **開発ではゼロまでスケールする**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Cosmos DB を追加する場合はコンシュンプションプランを使用**:
   - 使用した分だけ支払う
   - 最低料金なし

3. **Application Insights のサンプリングを設定する**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // リクエストの50%をサンプリングする
   ```

4. **不要なときはクリーンアップする**:
   ```bash
   azd down
   ```

### 無料枠のオプション
学習/テストのために、次を検討してください:
- Azure の無償クレジットを利用（最初の 30 日）
- レプリカは最小限にする
- テスト後に削除する（継続的な課金を避ける）

---

## クリーンアップ

継続的な課金を避けるため、すべてのリソースを削除してください:

```bash
azd down --force --purge
```

**確認プロンプト**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

確認するには `y` と入力してください。

**削除されるもの**:
- Container Apps Environment
- Both Container Apps (gateway & product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ クリーンアップの確認**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

空を返すはずです。

---

## 拡張ガイド: 2サービスから5以上へ

この2サービスのアーキテクチャを習得したら、拡張は次のように行います:

### フェーズ1: データベース永続化を追加（次のステップ）

**Product Service に Cosmos DB を追加**:

1. `infra/core/cosmos.bicep` を作成します:
   ```bicep
   resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
     name: name
     location: location
     kind: 'GlobalDocumentDB'
     properties: {
       databaseAccountOfferType: 'Standard'
       locations: [{ locationName: location, failoverPriority: 0 }]
     }
   }
   ```

2. product service をインメモリのデータの代わりに Cosmos DB を使うよう更新する

3. 追加見積コストの目安: 約 $25/月（サーバーレス）

### フェーズ2: 第三のサービスを追加（注文管理）

**Order Service を作成**:

1. 新しいフォルダ: `src/order-service/` (Python/Node.js/C#)
2. 新しい Bicep: `infra/app/order-service.bicep`
3. API Gateway を更新して `/api/orders` をルーティングする
4. 注文の永続化のために Azure SQL Database を追加する

**アーキテクチャは次のようになります**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### フェーズ3: 非同期通信を追加（Service Bus）

**イベント駆動アーキテクチャを実装**:

1. Azure Service Bus を追加: `infra/core/servicebus.bicep`
2. Product Service が "ProductCreated" イベントを発行する
3. Order Service が product イベントを購読する
4. イベントを処理する Notification Service を追加する

**パターン**: Request/Response (HTTP) + Event-Driven (Service Bus)

### フェーズ4: ユーザー認証を追加

**User Service を実装**:

1. `src/user-service/` を作成 (Go/Node.js)
2. Azure AD B2C またはカスタム JWT 認証を追加する
3. API Gateway がトークンを検証する
4. サービスがユーザーの権限を確認する

### フェーズ5: 本番準備

**以下のコンポーネントを追加**:
- Azure Front Door (グローバル負荷分散)
- Azure Key Vault (シークレット管理)
- Azure Monitor Workbooks (カスタムダッシュボード)
- CI/CD パイプライン (GitHub Actions)
- Blue-Green デプロイメント
- すべてのサービスに対する Managed Identity

**本番フルアーキテクチャのコスト**: 約 $300-1,400/月

---

## 詳しく学ぶ

### 関連ドキュメント
- [Azure Container Apps ドキュメント](https://learn.microsoft.com/azure/container-apps/)
- [マイクロサービスアーキテクチャ ガイド](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [分散トレースのための Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI ドキュメント](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### このコースの次のステップ
- ← Previous: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - 初心者向けの単一コンテナの例
- → Next: [AI Integration Guide](../../../../../examples/docs/ai-foundry) - AI 機能を追加する
- 🏠 [Course Home](../../README.md)

### 比較: 何をいつ使うか

**単一コンテナアプリ** (Simple Flask API の例):
- ✅ 単純なアプリケーション
- ✅ モノリシックアーキテクチャ
- ✅ デプロイが早い
- ❌ スケーラビリティに限界がある
- **コスト**: 約 $15-50/月

**マイクロサービス** (この例):
- ✅ 複雑なアプリケーション
- ✅ サービスごとの独立したスケーリング
- ✅ チームの自律性（異なるサービスを異なるチームが担当）
- ❌ 管理がより複雑になる
- **コスト**: 約 $60-250/月

**Kubernetes (AKS)**:
- ✅ 最大の制御性と柔軟性
- ✅ マルチクラウドでの移植性
- ✅ 高度なネットワーキング
- ❌ Kubernetes の専門知識が必要
- **コスト**: 約 $150-500/月（最小）

**推奨**: まずは Container Apps（この例）から始め、Kubernetes 固有の機能が必要になったら AKS に移行してください。

---

## よくある質問

**Q: なぜ5つ以上ではなく2つだけなのですか？**  
A: 教育的な進行です。まずはシンプルな例で基礎（サービス間通信、監視、スケーリング）を習得し、その後で複雑さを追加します。ここで学ぶパターンは100サービスのアーキテクチャにも適用できます。

**Q: 自分でさらにサービスを追加できますか？**  
A: もちろんです！上の拡張ガイドに従ってください。新しいサービスは同じパターンに従います: src フォルダを作成、Bicep ファイルを作成、azure.yaml を更新、デプロイ。

**Q: これは本番対応ですか？**  
A: 良い出発点です。本番環境にするには、managed identity、Key Vault、永続データベース、CI/CD パイプライン、監視アラート、バックアップ戦略を追加してください。

**Q: なぜ Dapr や他のサービスメッシュを使わないのですか？**  
A: 学習のためにシンプルに保つためです。まずは Container Apps のネイティブなネットワーキングを理解してから、より高度なシナリオで Dapr を導入できます。

**Q: ローカルでのデバッグはどうしますか？**  
A: Docker を使ってサービスをローカルで実行します:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: 異なるプログラミング言語を使えますか？**  
A: はい！この例では Node.js（gateway）+ Python（product service）を示しています。コンテナで動作する任意の言語を混在させることができます。

**Q: Azure クレジットがない場合は？**  
A: 新規アカウントで最初の 30 日間の Azure 無料枠を利用するか、短期間のテスト用にデプロイしてすぐに削除してください。

---

> **🎓 学習パスのまとめ**: マルチサービスアーキテクチャのデプロイ（自動スケーリング、内部ネットワーキング、集中監視、本番向けパターン）を学びました。この基盤は、複雑な分散システムや企業向けマイクロサービスアーキテクチャの準備になります。

**📚 コースナビゲーション:**
- ← Previous: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → Next: [Database Integration Example](../../../../../examples/database-app)
- 🏠 [Course Home](../../../README.md)
- 📖 [Container Apps ベストプラクティス](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責事項：
本書は AI 翻訳サービス「Co‑op Translator」（https://github.com/Azure/co-op-translator）を使用して翻訳されました。正確性の確保に努めていますが、自動翻訳には誤りや不正確さが含まれる可能性があることにご留意ください。原文（原言語で記載された文書）が権威ある情報源と見なされるべきです。重要な情報については、専門の人間による翻訳をお勧めします。本翻訳の利用に起因するいかなる誤解や誤訳についても責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->