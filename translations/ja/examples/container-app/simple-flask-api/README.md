<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9e7f581a238c1bf7f9f31a2ba118a90c",
  "translation_date": "2025-11-19T20:58:21+00:00",
  "source_file": "examples/container-app/simple-flask-api/README.md",
  "language_code": "ja"
}
-->
# シンプルな Flask API - コンテナアプリの例

**学習レベル:** 初心者 ⭐ | **所要時間:** 25-35分 | **コスト:** $0-15/月

Azure Developer CLI (azd) を使用して Azure Container Apps にデプロイされた、完全に動作する Python Flask REST API。この例では、コンテナのデプロイ、自動スケーリング、モニタリングの基本を示します。

## 🎯 学べること

- コンテナ化された Python アプリケーションを Azure にデプロイする方法
- スケール・トゥ・ゼロを使用した自動スケーリングの設定
- ヘルスプローブとレディネスチェックの実装
- アプリケーションログとメトリクスのモニタリング
- Azure Developer CLI を使用した迅速なデプロイ

## 📦 含まれる内容

✅ **Flask アプリケーション** - CRUD 操作を備えた完全な REST API (`src/app.py`)  
✅ **Dockerfile** - 本番環境向けのコンテナ設定  
✅ **Bicep インフラストラクチャ** - Container Apps 環境と API デプロイ  
✅ **AZD 設定** - ワンコマンドでのデプロイセットアップ  
✅ **ヘルスプローブ** - ライブネスとレディネスチェックの設定済み  
✅ **自動スケーリング** - HTTP 負荷に基づく 0-10 レプリカ  

## アーキテクチャ

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
- **Azure サブスクリプション** - [無料アカウント](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Docker のインストール](https://www.docker.com/products/docker-desktop/)（ローカルテスト用）

### 前提条件の確認

```bash
# azdバージョンを確認（1.5.0以上が必要）
azd version

# Azureログインを確認
azd auth login

# Dockerを確認（オプション、ローカルテスト用）
docker --version
```

## ⏱️ デプロイのタイムライン

| フェーズ | 所要時間 | 実行内容 |
|---------|----------|----------|
| 環境セットアップ | 30秒 | azd 環境の作成 |
| コンテナのビルド | 2-3分 | Flask アプリの Docker ビルド |
| インフラのプロビジョニング | 3-5分 | Container Apps、レジストリ、モニタリングの作成 |
| アプリケーションのデプロイ | 2-3分 | イメージのプッシュと Container Apps へのデプロイ |
| **合計** | **8-12分** | デプロイ完了 |

## クイックスタート

```bash
# サンプルに移動する
cd examples/container-app/simple-flask-api

# 環境を初期化する（ユニークな名前を選択）
azd env new myflaskapi

# すべてをデプロイする（インフラストラクチャ + アプリケーション）
azd up
# 次のプロンプトが表示されます:
# 1. Azure サブスクリプションを選択する
# 2. ロケーションを選択する（例: eastus2）
# 3. デプロイメントに8～12分待つ

# APIエンドポイントを取得する
azd env get-values

# APIをテストする
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

## ✅ デプロイの確認

### ステップ 1: デプロイ状況の確認

```bash
# 展開されたサービスを表示
azd show

# 予想される出力は次のようになります:
# - サービス: api
# - エンドポイント: https://ca-api-[env].xxx.azurecontainerapps.io
# - ステータス: 実行中
```

### ステップ 2: API エンドポイントのテスト

```bash
# APIエンドポイントを取得する
API_URL=$(azd env get-value API_ENDPOINT)

# ヘルスをテストする
curl $API_URL/health

# ルートエンドポイントをテストする
curl $API_URL/

# アイテムを作成する
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# すべてのアイテムを取得する
curl $API_URL/api/items
```

**成功基準:**
- ✅ ヘルスエンドポイントが HTTP 200 を返す
- ✅ ルートエンドポイントが API 情報を表示
- ✅ POST がアイテムを作成し、HTTP 201 を返す
- ✅ GET が作成されたアイテムを返す

### ステップ 3: ログの表示

```bash
# ライブログをストリームする
azd logs api --follow

# 次のように表示されます:
# - Gunicornの起動メッセージ
# - HTTPリクエストログ
# - アプリケーション情報ログ
```

## プロジェクト構造

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
|---------------|----------|------|
| `/health` | GET | ヘルスチェック |
| `/api/items` | GET | 全アイテムのリスト |
| `/api/items` | POST | 新しいアイテムの作成 |
| `/api/items/{id}` | GET | 特定のアイテムの取得 |
| `/api/items/{id}` | PUT | アイテムの更新 |
| `/api/items/{id}` | DELETE | アイテムの削除 |

## 設定

### 環境変数

```bash
# カスタム設定を設定する
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### スケーリング設定

API は HTTP トラフィックに基づいて自動的にスケーリングします:
- **最小レプリカ数**: 0（アイドル時にスケールダウン）
- **最大レプリカ数**: 10
- **レプリカごとの同時リクエスト数**: 50

## 開発

### ローカルでの実行

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
# Dockerイメージをビルドする
docker build -t flask-api:local ./src

# コンテナをローカルで実行する
docker run -p 8000:8000 flask-api:local

# コンテナをテストする
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
# アプリケーションコードのみをデプロイする（インフラストラクチャは変更しない）
azd deploy api
```

### 設定の更新

```bash
# 環境変数を更新する
azd env set API_KEY "new-api-key"

# 新しい構成で再デプロイする
azd deploy api
```

## モニタリング

### ログの表示

```bash
# ライブログをストリームする
azd logs api --follow

# 最後の100行を表示する
azd logs api --tail 100
```

### メトリクスのモニタリング

```bash
# Azure Monitor ダッシュボードを開く
azd monitor --overview

# 特定のメトリクスを表示
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## テスト

### ヘルスチェック

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

期待されるレスポンス:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### アイテムの作成

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### 全アイテムの取得

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## コスト最適化

このデプロイはスケール・トゥ・ゼロを使用しているため、API がリクエストを処理している間のみ料金が発生します:

- **アイドル時のコスト**: ~$0/月（スケールダウン時）
- **アクティブ時のコスト**: ~$0.000024/秒/レプリカ
- **予想月額コスト**（軽い使用量の場合）: $5-15

### コストをさらに削減する方法

```bash
# 開発用の最大レプリカ数を縮小する
azd env set MAX_REPLICAS 3

# 短いアイドルタイムアウトを使用する
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5分
```

## トラブルシューティング

### コンテナが起動しない

```bash
# コンテナログを確認する
azd logs api --tail 100

# Dockerイメージがローカルでビルドされることを確認する
docker build -t test ./src
```

### API にアクセスできない

```bash
# 外部からのインバウンドを確認する
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### 応答時間が長い

```bash
# CPU/メモリ使用率を確認する
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# 必要に応じてリソースをスケールアップする
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

1. **データベースを追加** - Azure Cosmos DB または SQL Database を統合  
   ```bash
   # infra/main.bicepにCosmos DBモジュールを追加
   # app.pyをデータベース接続で更新
   ```

2. **認証を追加** - Azure AD または API キーを実装  
   ```python
   # app.pyに認証ミドルウェアを追加する
   from functools import wraps
   ```

3. **CI/CD を設定** - GitHub Actions ワークフロー  
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **マネージド ID を追加** - Azure サービスへの安全なアクセス  
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### 関連する例

- **[データベースアプリ](../../../../../examples/database-app)** - SQL Database を使用した完全な例  
- **[マイクロサービス](../../../../../examples/container-app/microservices)** - マルチサービスアーキテクチャ  
- **[Container Apps マスターガイド](../README.md)** - すべてのコンテナパターン  

### 学習リソース

- 📚 [AZD 初心者向けコース](../../../README.md) - メインコースホーム  
- 📚 [Container Apps パターン](../README.md) - 他のデプロイパターン  
- 📚 [AZD テンプレートギャラリー](https://azure.github.io/awesome-azd/) - コミュニティテンプレート  

## 追加リソース

### ドキュメント
- **[Flask ドキュメント](https://flask.palletsprojects.com/)** - Flask フレームワークガイド  
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - 公式 Azure ドキュメント  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd コマンドリファレンス  

### チュートリアル
- **[Container Apps クイックスタート](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - 初めてのアプリをデプロイ  
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Python 開発ガイド  
- **[Bicep 言語](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - インフラストラクチャコード  

### ツール
- **[Azure ポータル](https://portal.azure.com)** - リソースを視覚的に管理  
- **[VS Code Azure 拡張機能](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE 統合  

---

**🎉 おめでとうございます！** 自動スケーリングとモニタリングを備えた本番環境対応の Flask API を Azure Container Apps にデプロイしました。

**質問がありますか？** [問題を報告](https://github.com/microsoft/AZD-for-beginners/issues) または [FAQ](../../../resources/faq.md) を確認してください。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:  
この文書は、AI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性を期しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があります。原文（元の言語で記載された文書）を公式な情報源としてご参照ください。重要な情報については、専門の人間による翻訳をお勧めします。本翻訳の使用に起因する誤解や誤認について、当方は一切の責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->