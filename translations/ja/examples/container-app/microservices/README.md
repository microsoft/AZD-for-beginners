# マイクロサービスアーキテクチャ - コンテナアプリの例

⏱️ **所要時間の目安**: 25-35分 | 💰 **推定コスト**: ~$50-100/月 | ⭐ **難易度**: 上級

**簡略化されつつも実用的な**マイクロサービスアーキテクチャを、AZD CLIを使用してAzure Container Appsにデプロイします。この例では、サービス間通信、コンテナオーケストレーション、モニタリングを2つのサービス構成で実演します。

> **📚 学習アプローチ**: この例は、実際にデプロイして学べる最小限の2サービスアーキテクチャ（API Gateway + Backend Service）から始めます。この基礎を習得した後、完全なマイクロサービスエコシステムへの拡張方法を案内します。

## 学べること

この例を完了することで、以下を学べます:
- 複数のコンテナをAzure Container Appsにデプロイする方法
- 内部ネットワーキングを使用したサービス間通信の実装
- 環境ベースのスケーリングとヘルスチェックの設定
- Application Insightsを使用した分散アプリケーションのモニタリング
- マイクロサービスのデプロイパターンとベストプラクティスの理解
- シンプルなアーキテクチャから複雑なアーキテクチャへの段階的拡張

## アーキテクチャ

### フェーズ1: 構築するもの（この例に含まれる内容）

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

**なぜシンプルに始めるのか？**
- ✅ 短時間でデプロイして理解できる（25-35分）
- ✅ 複雑さを排除してマイクロサービスの基本パターンを学べる
- ✅ 実験や改良が可能な動作するコード
- ✅ 学習コストが低い（~$50-100/月 vs $300-1400/月）
- ✅ データベースやメッセージキューを追加する前に自信をつけられる

**例え**: 車の運転を学ぶようなものです。最初は空の駐車場（2サービス）で基本を習得し、その後都市の交通（5+サービスとデータベース）に進みます。

### フェーズ2: 将来的な拡張（リファレンスアーキテクチャ）

2サービスアーキテクチャを習得した後、以下に拡張できます:

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

「拡張ガイド」セクションでステップバイステップの手順を確認してください。

## 含まれる機能

✅ **サービスディスカバリー**: コンテナ間の自動DNSベースのディスカバリー  
✅ **ロードバランシング**: レプリカ間の組み込みロードバランシング  
✅ **自動スケーリング**: HTTPリクエストに基づくサービスごとの独立スケーリング  
✅ **ヘルスモニタリング**: 両サービスのLivenessおよびReadinessプローブ  
✅ **分散ログ**: Application Insightsを使用した集中ログ管理  
✅ **内部ネットワーキング**: 安全なサービス間通信  
✅ **コンテナオーケストレーション**: 自動デプロイとスケーリング  
✅ **ゼロダウンタイム更新**: リビジョン管理を伴うローリングアップデート  

## 前提条件

### 必要なツール

開始する前に、以下のツールがインストールされていることを確認してください:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (バージョン1.0.0以上)
   ```bash
   azd version
   # 予想される出力: azd バージョン 1.0.0 以上
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (バージョン2.50.0以上)
   ```bash
   az --version
   # 期待される出力: azure-cli 2.50.0以上
   ```

3. **[Docker](https://www.docker.com/get-started)** (ローカル開発/テスト用 - オプション)
   ```bash
   docker --version
   # 期待される出力: Dockerバージョン20.10以上
   ```

### Azureの要件

- 有効な**Azureサブスクリプション**（[無料アカウントを作成](https://azure.microsoft.com/free/)）
- サブスクリプション内でリソースを作成する権限
- サブスクリプションまたはリソースグループでの**Contributor**ロール

### 知識の前提条件

これは**上級レベル**の例です。以下を理解している必要があります:
- [Simple Flask API example](../../../../../examples/container-app/simple-flask-api)を完了している
- マイクロサービスアーキテクチャの基本的な理解
- REST APIとHTTPの基本的な知識
- コンテナの概念の理解

**Container Appsが初めてですか？** まず[Simple Flask API example](../../../../../examples/container-app/simple-flask-api)で基本を学びましょう。

## クイックスタート（ステップバイステップ）

### ステップ1: クローンと移動

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ 成功確認**: `azure.yaml`が表示されることを確認してください:
```bash
ls
# 期待される: README.md, azure.yaml, infra/, src/
```

### ステップ2: Azureで認証

```bash
azd auth login
```

これにより、Azure認証用のブラウザが開きます。Azureの資格情報でサインインしてください。

**✓ 成功確認**: 以下が表示されるはずです:
```
Logged in to Azure.
```

### ステップ3: 環境を初期化

```bash
azd init
```

**表示されるプロンプト**:
- **環境名**: 短い名前を入力（例: `microservices-dev`）
- **Azureサブスクリプション**: サブスクリプションを選択
- **Azureロケーション**: リージョンを選択（例: `eastus`, `westeurope`）

**✓ 成功確認**: 以下が表示されるはずです:
```
SUCCESS: New project initialized!
```

### ステップ4: インフラとサービスをデプロイ

```bash
azd up
```

**実行内容**（8-12分かかります）:
1. Container Apps環境を作成
2. モニタリング用のApplication Insightsを作成
3. API Gatewayコンテナ（Node.js）をビルド
4. Product Serviceコンテナ（Python）をビルド
5. 両コンテナをAzureにデプロイ
6. ネットワーキングとヘルスチェックを設定
7. モニタリングとログをセットアップ

**✓ 成功確認**: 以下が表示されるはずです:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ 時間**: 8-12分

### ステップ5: デプロイのテスト

```bash
# ゲートウェイエンドポイントを取得する
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# APIゲートウェイのヘルスをテストする
curl $GATEWAY_URL/health

# 期待される出力:
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**ゲートウェイ経由でProduct Serviceをテスト**:
```bash
# 製品を一覧表示
curl $GATEWAY_URL/api/products

# 予想される出力:
# [
#   {"id":1,"name":"ノートパソコン","price":999.99,"stock":50},
#   {"id":2,"name":"マウス","price":29.99,"stock":200},
#   {"id":3,"name":"キーボード","price":79.99,"stock":150}
# ]
```

**✓ 成功確認**: 両方のエンドポイントがエラーなしでJSONデータを返すこと。

---

**🎉 おめでとうございます！** Azureにマイクロサービスアーキテクチャをデプロイしました！

## プロジェクト構造

すべての実装ファイルが含まれています—これは完全で動作する例です:

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

**各コンポーネントの役割**:

**インフラストラクチャ (infra/)**:
- `main.bicep`: すべてのAzureリソースとその依存関係をオーケストレーション
- `core/container-apps-environment.bicep`: Container Apps環境とAzure Container Registryを作成
- `core/monitor.bicep`: 分散ログ用のApplication Insightsをセットアップ
- `app/*.bicep`: スケーリングとヘルスチェックを含む個々のコンテナアプリ定義

**API Gateway (src/api-gateway/)**:
- 外部向けサービスで、リクエストをバックエンドサービスにルーティング
- ロギング、エラーハンドリング、リクエスト転送を実装
- サービス間のHTTP通信を実演

**Product Service (src/product-service/)**:
- シンプルなインメモリのプロダクトカタログを持つ内部サービス
- REST APIとヘルスチェックを提供
- バックエンドマイクロサービスパターンの例

## サービス概要

### API Gateway (Node.js/Express)

**ポート**: 8080  
**アクセス**: 公開（外部イングレス）  
**目的**: 入ってくるリクエストを適切なバックエンドサービスにルーティング  

**エンドポイント**:
- `GET /` - サービス情報
- `GET /health` - ヘルスチェックエンドポイント
- `GET /api/products` - Product Serviceに転送（全リスト）
- `GET /api/products/:id` - Product Serviceに転送（ID指定）

**主な機能**:
- axiosを使用したリクエストルーティング
- 集中ロギング
- エラーハンドリングとタイムアウト管理
- 環境変数を介したサービスディスカバリー
- Application Insights統合

**コードハイライト** (`src/api-gateway/app.js`):
```javascript
// 内部サービス通信
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**ポート**: 8000  
**アクセス**: 内部のみ（外部イングレスなし）  
**目的**: インメモリデータを使用したプロダクトカタログの管理  

**エンドポイント**:
- `GET /` - サービス情報
- `GET /health` - ヘルスチェックエンドポイント
- `GET /products` - 全プロダクトのリスト
- `GET /products/<id>` - ID指定のプロダクト取得

**主な機能**:
- Flaskを使用したRESTful API
- インメモリプロダクトストア（シンプルでデータベース不要）
- プローブを使用したヘルスモニタリング
- 構造化ロギング
- Application Insights統合

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

**なぜ内部のみ？**
Product Serviceは公開されていません。すべてのリクエストはAPI Gatewayを通過する必要があります。これにより:
- セキュリティ: 制御されたアクセスポイント
- 柔軟性: クライアントに影響を与えずにバックエンドを変更可能
- モニタリング: 集中化されたリクエストログ

## サービス間通信の理解

### サービス同士の通信方法

この例では、API Gatewayが**内部HTTP通信**を使用してProduct Serviceと通信します:

```javascript
// APIゲートウェイ (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// 内部HTTPリクエストを作成する
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**主なポイント**:

1. **DNSベースのディスカバリー**: Container Appsは内部サービス用のDNSを自動的に提供
   - Product Service FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - 簡略化: `http://product-service`（Container Appsが解決）

2. **公開されない**: Product ServiceはBicepで`external: false`に設定
   - Container Apps環境内でのみアクセス可能
   - インターネットからは到達不可

3. **環境変数**: サービスURLはデプロイ時に注入
   - Bicepが内部FQDNをゲートウェイに渡す
   - アプリケーションコードにハードコードされたURLはなし

**例え**: オフィスの部屋のようなものです。API Gatewayは受付（外部向け）、Product Serviceはオフィスの部屋（内部のみ）。訪問者は受付を通じてしか部屋にアクセスできません。

## デプロイオプション

### フルデプロイ（推奨）

```bash
# インフラストラクチャと両方のサービスをデプロイする
azd up
```

これにより以下がデプロイされます:
1. Container Apps環境
2. Application Insights
3. Container Registry
4. API Gatewayコンテナ
5. Product Serviceコンテナ

**時間**: 8-12分

### 個別サービスのデプロイ

```bash
# 初回のazd upの後に1つのサービスのみをデプロイする
azd deploy api-gateway

# または製品サービスをデプロイする
azd deploy product-service
```

**使用例**: コードを更新したサービスのみを再デプロイしたい場合。

### 設定の更新

```bash
# スケーリングパラメータを変更する
azd env set GATEWAY_MAX_REPLICAS 30

# 新しい構成で再デプロイする
azd up
```

## 設定

### スケーリング設定

両サービスはBicepファイルでHTTPベースの自動スケーリングが設定されています:

**API Gateway**:
- 最小レプリカ: 2（可用性のため常に2以上）
- 最大レプリカ: 20
- スケールトリガー: レプリカごとに50の同時リクエスト

**Product Service**:
- 最小レプリカ: 1（必要に応じてゼロまでスケールダウン可能）
- 最大レプリカ: 10
- スケールトリガー: レプリカごとに100の同時リクエスト

**スケーリングのカスタマイズ**（`infra/app/*.bicep`内）:
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
- 理由: すべての外部トラフィックを処理

**Product Service**:
- CPU: 0.5 vCPU
- メモリ: 1 GiB
- 理由: 軽量なインメモリ操作

### ヘルスチェック

両サービスにはLivenessおよびReadinessプローブが含まれています:

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
- **Liveness**: ヘルスチェックが失敗すると、Container Appsがコンテナを再起動
- **Readiness**: 準備が整っていない場合、Container Appsはそのレプリカへのトラフィックを停止

## モニタリングと可観測性

### サービスログの表示

```bash
# API Gatewayからのログをストリームする
azd logs api-gateway --follow

# 最近の製品サービスのログを表示する
azd logs product-service --tail 100

# 両方のサービスからのすべてのログを表示する
azd logs --follow
```

**期待される出力**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insightsクエリ

AzureポータルでApplication Insightsにアクセスし、以下のクエリを実行:

**遅いリクエストを見つける**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**サービス間通信を追跡**:
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

**時間ごとのリクエスト量**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### モニタリングダッシュボードへのアクセス

```bash
# アプリケーションインサイトの詳細を取得する
azd env get-values | grep APPLICATIONINSIGHTS

# Azureポータルのモニタリングを開く
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### ライブメトリクス

1. AzureポータルでApplication Insightsに移動
2. 「ライブメトリクス」をクリック
3. リアルタイムのリクエスト、失敗、パフォーマンスを確認
4. 以下を実行してテスト: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## 実践演習

[注: デプロイ確認、データ変更、自動スケーリングテスト、エラーハンドリング、3つ目のサービス追加を含む詳細なステップバイステップ演習は「実践演習」セクションを参照してください。]

## コスト分析

### 推定月額コスト（この2サービス例の場合）

| リソース | 構成 | 推定コスト |
|----------|--------------|----------------|
| API Gateway | 2-20レプリカ、1 vCPU、2GB RAM | $30-150 |
| Product Service | 1-10レプリカ、0.5 vCPU、1GB RAM | $15-75 |
| Container Registry | Basic tier | $5 |
| Application Insights | 1-2 GB/月 | $5-10 |
| Log Analytics | 1 GB/月 | $3 |
| **合計** | | **$58-243/月** |

**使用量別コスト内訳**:
- **軽いトラフィック**（テスト/学習用）: ~$60/月
- **中程度のトラフィック**（小規模プロダクション）: ~$120/月
- **高トラフィック**（繁忙期）: ~$240/月

### コスト削減のヒント

1. **開発用にゼロスケール**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Cosmos DBに消費プランを使用**（追加時）:
   - 使用した分だけ支払い
   - 最低料金なし

3. **Application Insightsのサンプリングを設定**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // リクエストの50％をサンプリングする
   ```

4. **不要時にクリーンアップ**:
   ```bash
   azd down
   ```

### 無料プランオプション
学習/テストのために考慮すべき点:
- Azureの無料クレジットを利用する（最初の30日間）
- レプリカ数を最小限に抑える
- テスト後に削除する（継続的な料金を回避）

---

## クリーンアップ

継続的な料金を回避するために、すべてのリソースを削除します:

```bash
azd down --force --purge
```

**確認プロンプト**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

`y`を入力して確認します。

**削除されるもの**:
- コンテナーアプリ環境
- 2つのコンテナーアプリ（ゲートウェイと商品サービス）
- コンテナーレジストリ
- Application Insights
- Log Analytics Workspace
- リソースグループ

**✓ クリーンアップの確認**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

空の結果が返されるはずです。

---

## 拡張ガイド: 2サービスから5+サービスへ

この2サービス構成を習得したら、次のように拡張できます:

### フェーズ1: データベース永続化を追加（次のステップ）

**商品サービスにCosmos DBを追加**:

1. `infra/core/cosmos.bicep`を作成:
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

2. 商品サービスをインメモリデータからCosmos DBに変更

3. 追加コストの見積もり: 約$25/月（サーバーレス）

### フェーズ2: 第3のサービスを追加（注文管理）

**注文サービスを作成**:

1. 新しいフォルダ: `src/order-service/`（Python/Node.js/C#）
2. 新しいBicepファイル: `infra/app/order-service.bicep`
3. APIゲートウェイを更新して`/api/orders`をルーティング
4. 注文永続化のためにAzure SQL Databaseを追加

**アーキテクチャは以下のようになります**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### フェーズ3: 非同期通信を追加（Service Bus）

**イベント駆動型アーキテクチャを実装**:

1. Azure Service Busを追加: `infra/core/servicebus.bicep`
2. 商品サービスが「ProductCreated」イベントを発行
3. 注文サービスが商品イベントを購読
4. 通知サービスを追加してイベントを処理

**パターン**: リクエスト/レスポンス（HTTP） + イベント駆動（Service Bus）

### フェーズ4: ユーザー認証を追加

**ユーザーサービスを実装**:

1. `src/user-service/`を作成（Go/Node.js）
2. Azure AD B2CまたはカスタムJWT認証を追加
3. APIゲートウェイがトークンを検証
4. 各サービスがユーザー権限を確認

### フェーズ5: 本番環境の準備

**以下のコンポーネントを追加**:
- Azure Front Door（グローバル負荷分散）
- Azure Key Vault（秘密管理）
- Azure Monitor Workbooks（カスタムダッシュボード）
- CI/CDパイプライン（GitHub Actions）
- ブルーグリーンデプロイメント
- 各サービスのマネージドID

**完全な本番アーキテクチャのコスト**: 約$300-1,400/月

---

## 詳しく学ぶ

### 関連ドキュメント
- [Azure Container Apps ドキュメント](https://learn.microsoft.com/azure/container-apps/)
- [マイクロサービスアーキテクチャガイド](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [分散トレーシングのためのApplication Insights](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI ドキュメント](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### このコースの次のステップ
- ← 前: [シンプルなFlask API](../../../../../examples/container-app/simple-flask-api) - 初心者向けの単一コンテナー例
- → 次: [AI統合ガイド](../../../../../examples/docs/ai-foundry) - AI機能を追加
- 🏠 [コースホーム](../../README.md)

### 比較: どれを使うべきか

**単一コンテナーアプリ**（シンプルなFlask API例）:
- ✅ シンプルなアプリケーション
- ✅ モノリシックアーキテクチャ
- ✅ デプロイが速い
- ❌ スケーラビリティが限定的
- **コスト**: 約$15-50/月

**マイクロサービス**（この例）:
- ✅ 複雑なアプリケーション
- ✅ サービスごとの独立したスケーリング
- ✅ チームの自律性（異なるサービス、異なるチーム）
- ❌ 管理がより複雑
- **コスト**: 約$60-250/月

**Kubernetes (AKS)**:
- ✅ 最大の制御と柔軟性
- ✅ マルチクラウドの移植性
- ✅ 高度なネットワーキング
- ❌ Kubernetesの専門知識が必要
- **コスト**: 最低約$150-500/月

**推奨**: Container Apps（この例）から始め、Kubernetes固有の機能が必要な場合のみAKSに移行。

---

## よくある質問

**Q: なぜ5+サービスではなく2サービスだけなのですか?**  
A: 教育的な進行のためです。基本（サービス間通信、モニタリング、スケーリング）をシンプルな例で習得してから、複雑さを追加します。ここで学んだパターンは100サービスのアーキテクチャにも適用できます。

**Q: 自分でサービスを追加できますか?**  
A: もちろんです！上記の拡張ガイドに従ってください。新しいサービスごとに、srcフォルダを作成し、Bicepファイルを作成し、azure.yamlを更新してデプロイします。

**Q: これは本番環境対応ですか?**  
A: これは堅実な基盤です。本番環境では、マネージドID、Key Vault、永続的なデータベース、CI/CDパイプライン、モニタリングアラート、バックアップ戦略を追加してください。

**Q: なぜDaprや他のサービスメッシュを使用しないのですか?**  
A: 学習を簡単にするためです。Container Appsのネイティブネットワーキングを理解した後、Daprを追加して高度なシナリオに対応できます。

**Q: ローカルでデバッグするにはどうすればよいですか?**  
A: Dockerを使用してローカルでサービスを実行します:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: 異なるプログラミング言語を使用できますか?**  
A: はい！この例ではNode.js（ゲートウェイ）とPython（商品サービス）を示しています。コンテナーで動作する言語を自由に組み合わせることができます。

**Q: Azureクレジットがない場合はどうすればよいですか?**  
A: Azureの無料枠（新規アカウントで最初の30日間）を利用するか、短期間のテスト用にデプロイしてすぐに削除してください。

---

> **🎓 学習パスのまとめ**: 自動スケーリング、内部ネットワーキング、集中モニタリング、本番対応パターンを備えたマルチサービスアーキテクチャをデプロイする方法を学びました。この基盤は、複雑な分散システムやエンタープライズマイクロサービスアーキテクチャに向けた準備となります。

**📚 コースナビゲーション**:
- ← 前: [シンプルなFlask API](../../../../../examples/container-app/simple-flask-api)
- → 次: [データベース統合例](../../../../../examples/database-app)
- 🏠 [コースホーム](../../README.md)
- 📖 [コンテナーアプリのベストプラクティス](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:  
この文書は、AI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性を期すよう努めておりますが、自動翻訳には誤りや不正確さが含まれる可能性があります。原文（元の言語で記載された文書）が信頼できる情報源とみなされるべきです。重要な情報については、専門の人間による翻訳をお勧めします。この翻訳の使用に起因する誤解や解釈の誤りについて、当方は一切の責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->