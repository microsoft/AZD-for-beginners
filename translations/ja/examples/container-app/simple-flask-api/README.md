# シンプルな Flask API - コンテナー アプリの例

**学習パス:** 初級 ⭐ | **所要時間:** 25～35分 | **費用:** $0～15/月

Azure Developer CLI (azd) を使用して Azure Container Apps にデプロイされた、完全に動作する Python Flask REST API の例です。このサンプルはコンテナのデプロイ、自動スケーリング、モニタリングの基本を示します。

## 🎯 学べること

- コンテナ化された Python アプリケーションを Azure にデプロイする
- スケール・トゥ・ゼロを含む自動スケーリングを構成する
- ヘルスプローブとレディネスチェックを実装する
- アプリケーションのログとメトリクスを監視する
- Azure Developer CLI を使った迅速なデプロイ

## 📦 含まれるもの

✅ **Flask Application** - CRUD 操作を備えた完全な REST API (`src/app.py`)  
✅ **Dockerfile** - 本番対応のコンテナ設定  
✅ **Bicep Infrastructure** - Container Apps 環境と API のデプロイ  
✅ **AZD Configuration** - ワンコマンドでのデプロイ設定  
✅ **Health Probes** - Liveness と readiness チェックが設定済み  
✅ **Auto-scaling** - HTTP ロードに基づく 0-10 レプリカの自動スケーリング  

## Architecture

```
┌─────────────────────────────────────────┐
│   Azure Container Apps Environment      │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │   Flask API Container             │ │
│  │   - Health endpoints              │ │
│  │   - REST API                      │ │
│  │   - Auto-scaling (0-10 replicas)  │ │
│  └───────────────────────────────────┘ │
│                                         │
│  Application Insights ────────────────┐ │
└────────────────────────────────────────┘
```

## 前提条件

### 必須
- **Azure Developer CLI (azd)** - [インストールガイド](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** - [無料アカウント](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Docker のインストール](https://www.docker.com/products/docker-desktop/)（ローカルテスト用）

### 前提条件の確認

```bash
# azd のバージョンを確認してください (1.5.0 以上が必要)
azd version

# Azure へのログインを確認してください
azd auth login

# Docker を確認 (任意、ローカルテスト用)
docker --version
```

## ⏱️ デプロイのタイムライン

| フェーズ | 所要時間 | 何が起きるか |
|-------|----------|--------------||
| Environment setup | 30秒 | azd 環境を作成 |
| Build container | 2～3分 | Docker で Flask アプリをビルド |
| Provision infrastructure | 3～5分 | Container Apps、レジストリ、モニタリングを作成 |
| Deploy application | 2～3分 | イメージをプッシュして Container Apps にデプロイ |
| **合計** | **8～12分** | デプロイ完了 |

## クイックスタート

```bash
# 例に移動する
cd examples/container-app/simple-flask-api

# 環境を初期化する（固有の名前を選択）
azd env new myflaskapi

# すべてをデプロイする（インフラ＋アプリケーション）
azd up
# 次の入力が求められます：
# 1. Azure サブスクリプションを選択
# 2. ロケーションを選択（例: eastus2）
# 3. デプロイ完了まで8〜12分待つ

# API エンドポイントを取得する
azd env get-values

# API をテストする
curl $(azd env get-value API_ENDPOINT)/health
```

**期待される出力:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ デプロイの検証

### ステップ 1: デプロイ状況の確認

```bash
# 展開されたサービスを表示
azd show

# 期待される出力は次のとおりです:
# - サービス: api
# - エンドポイント: https://ca-api-[env].xxx.azurecontainerapps.io
# - ステータス: 実行中
```

### ステップ 2: API エンドポイントのテスト

```bash
# APIエンドポイントを取得
API_URL=$(azd env get-value API_ENDPOINT)

# ヘルスチェック
curl $API_URL/health

# ルートエンドポイントをテスト
curl $API_URL/

# アイテムを作成
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# すべてのアイテムを取得
curl $API_URL/api/items
```

**成功基準:**
- ✅ ヘルスエンドポイントが HTTP 200 を返す
- ✅ ルートエンドポイントが API 情報を表示する
- ✅ POST が項目を作成し HTTP 201 を返す
- ✅ GET が作成した項目を返す

### ステップ 3: ログの表示

```bash
# azd monitor を使ってライブログをストリーミングする
azd monitor --logs

# または Azure CLI を使用する:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# 次の内容が表示されます:
# - Gunicorn の起動メッセージ
# - HTTP リクエストのログ
# - アプリケーションの情報ログ
```

## プロジェクト構成

```
simple-flask-api/
├── azure.yaml              # AZD configuration
├── infra/
│   ├── main.bicep         # Main infrastructure
│   ├── main.parameters.json
│   └── app/
│       ├── container-env.bicep
│       └── api.bicep
└── src/
    ├── app.py             # Flask application
    ├── requirements.txt
    └── Dockerfile
```

## API エンドポイント

| エンドポイント | メソッド | 説明 |
|----------|--------|-------------|
| `/health` | GET | ヘルスチェック |
| `/api/items` | GET | すべての項目を一覧表示 |
| `/api/items` | POST | 新しい項目を作成 |
| `/api/items/{id}` | GET | 特定の項目を取得 |
| `/api/items/{id}` | PUT | 項目を更新 |
| `/api/items/{id}` | DELETE | 項目を削除 |

## 設定

### 環境変数

```bash
# カスタム設定を行う
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### スケーリング構成

この API は HTTP トラフィックに基づいて自動的にスケールします：
- **最小レプリカ数**: 0（アイドル時にゼロにスケール）
- **最大レプリカ数**: 10
- **各レプリカあたりの同時リクエスト数**: 50

## 開発

### ローカルで実行

```bash
# 依存関係をインストールする
cd src
pip install -r requirements.txt

# アプリを実行する
python app.py

# ローカルでテストする
curl http://localhost:8000/health
```

### コンテナのビルドとテスト

```bash
# Dockerイメージをビルド
docker build -t flask-api:local ./src

# コンテナをローカルで実行
docker run -p 8000:8000 flask-api:local

# コンテナをテスト
curl http://localhost:8000/health
```

## デプロイ

### フルデプロイ

```bash
# インフラストラクチャとアプリケーションをデプロイする
azd up
```

### コードのみのデプロイ

```bash
# アプリケーションコードのみをデプロイする（インフラは変更しない）
azd deploy api
```

### 設定の更新

```bash
# 環境変数を更新する
azd env set API_KEY "new-api-key"

# 新しい設定で再デプロイする
azd deploy api
```

## モニタリング

### ログの表示

```bash
# azd monitor を使ってライブログをストリーミングする
azd monitor --logs

# または Container Apps 用の Azure CLI を使用する:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# 最後の100行を表示する
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### メトリクスの監視

```bash
# Azure Monitor のダッシュボードを開く
azd monitor --overview

# 特定のメトリクスを表示する
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## テスト

### ヘルスチェック

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

期待される応答:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### 項目の作成

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### すべての項目を取得

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## コスト最適化

このデプロイはスケール・トゥ・ゼロを使用するため、API がリクエストを処理している時のみ料金が発生します：

- **アイドル時のコスト**: 約 $0/月（ゼロにスケール）
- **稼働時のコスト**: レプリカあたり約 $0.000024/秒
- **想定月額コスト**（軽度の利用）: $5～15

### さらにコストを削減する

```bash
# 開発環境向けに最大レプリカ数を縮小する
azd env set MAX_REPLICAS 3

# アイドルタイムアウトを短くする
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5分
```

## トラブルシューティング

### コンテナが起動しない場合

```bash
# Azure CLI を使ってコンテナのログを確認する
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# ローカルで Docker イメージがビルドされることを確認する
docker build -t test ./src
```

### API にアクセスできない場合

```bash
# ingress が外部にあることを確認する
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### レスポンスタイムが長い場合

```bash
# CPU/メモリの使用状況を確認する
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# 必要に応じてリソースを増やす
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## クリーンアップ

```bash
# すべてのリソースを削除する
azd down --force --purge
```

## 次のステップ

### この例を拡張する

1. **データベースを追加** - Azure Cosmos DB または SQL Database を統合する
   ```bash
   # infra/main.bicep に Cosmos DB モジュールを追加する
   # app.py をデータベース接続用に更新する
   ```

2. **認証を追加** - Azure AD または API キーを実装する
   ```python
   # app.py に認証ミドルウェアを追加する
   from functools import wraps
   ```

3. **CI/CD を設定** - GitHub Actions ワークフロー
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **マネージド ID を追加** - Azure サービスへのアクセスを保護する
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### 関連する例

- **[Database App](../../../../../examples/database-app)** - SQL Database を使った完全な例
- **[Microservices](../../../../../examples/container-app/microservices)** - マルチサービスアーキテクチャ
- **[Container Apps Master Guide](../README.md)** - すべてのコンテナパターン

### 学習リソース

- 📚 [AZD For Beginners Course](../../../README.md) - コースのメインページ
- 📚 [Container Apps Patterns](../README.md) - さらに多くのデプロイパターン
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - コミュニティテンプレート

## 追加リソース

### ドキュメント
- **[Flask Documentation](https://flask.palletsprojects.com/)** - Flask フレームワーク ガイド
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - 公式の Azure ドキュメント
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd コマンドリファレンス

### チュートリアル
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - 最初のアプリをデプロイする
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Python 開発ガイド
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - インフラストラクチャをコードで管理

### ツール
- **[Azure Portal](https://portal.azure.com)** - リソースを視覚的に管理する
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE 統合

---

**🎉 おめでとうございます！** 自動スケーリングとモニタリングを備えた、プロダクション対応の Flask API を Azure Container Apps にデプロイしました。

**ご質問はありますか？** [Issue を作成する](https://github.com/microsoft/AZD-for-beginners/issues) または [よくある質問](../../../resources/faq.md) を確認してください

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責事項：
この文書は AI 翻訳サービス「Co-op Translator」（https://github.com/Azure/co-op-translator）を使用して翻訳されました。正確性には努めていますが、自動翻訳には誤りや不正確さが含まれる可能性があります。原文（原言語の文書）を正式な情報源とみなしてください。重要な情報については、専門の人間翻訳者による翻訳を推奨します。本翻訳の利用により生じた誤解や解釈の相違について、当社は一切責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->