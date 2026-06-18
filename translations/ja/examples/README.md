# 例 - 実用的な AZD テンプレートと構成

**例による学習 - 章別に整理**
- **📚 コースホーム**: [AZD 入門](../README.md)
- **📖 章マッピング**: 学習の難易度別に整理された例
- **🚀 ローカル例**: [小売マルチエージェントソリューション](retail-scenario.md)
- **🤖 外部AIの例**: Azure Samples リポジトリへのリンク

> **📍 重要: ローカルと外部の例**  
> このリポジトリにはフル実装の **4 つの完全なローカル例** が含まれています:  
> - **Microsoft Foundry Models Chat** (チャットインターフェイスを含む gpt-4.1 デプロイ)  
> - **Container Apps** (シンプルな Flask API + マイクロサービス)  
> - **Database App** (Web + SQL データベース)  
> - **Retail Multi-Agent** (エンタープライズ AI ソリューション)  
>  
> 追加の例は、クローンして使用できる Azure-Samples リポジトリへの <strong>外部参照</strong> です。

## はじめに

このディレクトリは、Azure Developer CLI を実践で学ぶための実用的な例と参照を提供します。Retail Multi-Agent シナリオは、このリポジトリに含まれる完全な本番対応実装です。追加の例は、さまざまな AZD パターンを示す公式 Azure Samples を参照しています。

### 難易度評価の凡例

- ⭐ <strong>初心者</strong> - 基本概念、単一サービス、15-30 分  
- ⭐⭐ <strong>中級</strong> - 複数サービス、データベース統合、30-60 分  
- ⭐⭐⭐ <strong>上級</strong> - 複雑なアーキテクチャ、AI 統合、1-2 時間  
- ⭐⭐⭐⭐ <strong>エキスパート</strong> - 本番対応、エンタープライズパターン、2 時間以上

## 🎯 このリポジトリに実際に含まれているもの

### ✅ ローカル実装（すぐに使える）

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**このリポジトリに含まれるチャットインターフェイス付きの完全な gpt-4.1 デプロイ**

- **場所:** `examples/azure-openai-chat/`
- **難易度:** ⭐⭐ (中級)
- **含まれているもの:**
  - 完全な Microsoft Foundry Models のデプロイ (gpt-4.1)
  - Python コマンドラインチャットインターフェイス
  - API キーを安全に管理するための Key Vault 統合
  - Bicep インフラストラクチャテンプレート
  - トークン使用量とコストの追跡
  - レート制限とエラー処理

**クイックスタート:**
```bash
# サンプルに移動
cd examples/azure-openai-chat

# すべてをデプロイする
azd up

# 依存関係をインストールしてチャットを開始する
pip install -r src/requirements.txt
python src/chat.py
```

**技術:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
<strong>このリポジトリに含まれる包括的なコンテナデプロイの例</strong>

- **場所:** `examples/container-app/`
- **難易度:** ⭐-⭐⭐⭐⭐ (初心者〜上級)
- **含まれているもの:**
  - [マスターガイド](container-app/README.md) - コンテナデプロイの完全概要
  - [シンプルな Flask API](../../../examples/container-app/simple-flask-api) - 基本的な REST API の例
  - [マイクロサービスアーキテクチャ](../../../examples/container-app/microservices) - 本番対応のマルチサービスデプロイ
  - クイックスタート、本番、上級パターン
  - 監視、セキュリティ、コスト最適化

**クイックスタート:**
```bash
# マスターガイドを見る
cd examples/container-app

# シンプルな Flask API をデプロイする
cd simple-flask-api
azd up

# マイクロサービスの例をデプロイする
cd ../microservices
azd up
```

**技術:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
<strong>このリポジトリに含まれる本番対応の完全実装</strong>

- **場所:** `examples/retail-multiagent-arm-template/`
- **難易度:** ⭐⭐⭐⭐ (上級)
- **含まれているもの:**
  - 完全な ARM デプロイテンプレート
  - マルチエージェントアーキテクチャ（顧客 + 在庫）
  - Microsoft Foundry Models 統合
  - RAG を用いた AI 検索
  - 包括的な監視
  - ワンクリックデプロイスクリプト

**クイックスタート:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**技術:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 外部 Azure サンプル（クローンして使用）

以下の例は公式 Azure-Samples リポジトリで管理されています。クローンしてさまざまな AZD パターンを確認してください。

### シンプルアプリケーション（章 1-2）

| テンプレート | リポジトリ | 難易度 | サービス |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [ローカル: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| <strong>マイクロサービス</strong> | [ローカル: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**使い方:**
```bash
# 任意の例をクローンする
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# デプロイする
azd up
```

### AI アプリケーションの例（章 2、5、8）

| テンプレート | リポジトリ | 難易度 | フォーカス |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [ローカル: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 デプロイ |
| **AI チャット クイックスタート** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | 基本的な AI チャット |
| **AI エージェント** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | エージェントフレームワーク |
| **Search + OpenAI デモ** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG パターン |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | エンタープライズ AI |

### データベース＆高度なパターン（章 3-8）

| テンプレート | リポジトリ | 難易度 | フォーカス |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | データベース統合 |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL サーバーレス |
| **Java マイクロサービス** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | マルチサービス |
| **ML パイプライン** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## 学習目標

これらの例を通して学習することで、以下が期待できます:
- 現実的なアプリケーションシナリオを用いた Azure Developer CLI ワークフローの練習
- 異なるアプリケーションアーキテクチャとその azd 実装の理解
- さまざまな Azure サービスに対する Infrastructure as Code パターンの習得
- 構成管理と環境固有のデプロイ戦略の適用
- 実践的な文脈での監視、セキュリティ、スケーリングパターンの実装
- 実際のデプロイシナリオにおけるトラブルシューティングとデバッグの経験構築

## 学習成果

これらの例を完了すると、以下ができるようになります:
- Azure Developer CLI を使用してさまざまなタイプのアプリケーションを自信を持ってデプロイする
- 提供されたテンプレートを自分のアプリケーション要件に適応させる
- Bicep を使用してカスタムのインフラパターンを設計・実装する
- 適切な依存関係を持つ複雑なマルチサービスアプリケーションを構成する
- 実際のシナリオでのセキュリティ、監視、パフォーマンスのベストプラクティスを適用する
- 実践経験に基づいてデプロイをトラブルシュートおよび最適化する

## ディレクトリ構成

```
Azure Samples AZD Templates (linked externally):
├── todo-nodejs-mongo/       # Node.js Express with MongoDB
├── todo-csharp-sql-swa-func/ # React SPA with Static Web Apps  
├── container-apps-store-api/ # Python Flask containerized app
├── todo-csharp-sql/         # C# Web API with Azure SQL
├── todo-python-mongo-swa-func/ # Python Functions with Cosmos DB
├── java-microservices-aca-lab/ # Java microservices with Container Apps
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## クイックスタート例

> **💡 AZD を始めたばかりですか？** 例 #1（Flask API）から始めてください — 約 20 分でコア概念を学べます。

### 初心者向け
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (ローカル) ⭐  
   スケール・トゥ・ゼロ対応のシンプルな REST API をデプロイ  
   **時間:** 20-25 分 | **コスト:** $0-5/月  
   **学べること:** 基本的な azd ワークフロー、コンテナ化、ヘルスプローブ  
   **期待される成果:** 監視付きで "Hello, World!" を返す稼働中の API エンドポイント

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB を使用した Node.js Express Web アプリをデプロイ  
   **時間:** 25-35 分 | **コスト:** $10-30/月  
   **学べること:** データベース統合、環境変数、接続文字列  
   **期待される成果:** 作成/読み取り/更新/削除機能を持つ Todo リストアプリ

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps で React 静的サイトをホスト  
   **時間:** 20-30 分 | **コスト:** $0-10/月  
   **学べること:** 静的ホスティング、サーバーレス関数、CDN デプロイ  
   **期待される成果:** API バックエンドを持つ React UI、自動 SSL、グローバル CDN

### 中級者向け
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (ローカル) ⭐⭐  
   チャットインターフェイスと安全な API キー管理で gpt-4.1 をデプロイ  
   **時間:** 35-45 分 | **コスト:** $50-200/月  
   **学べること:** Microsoft Foundry Models のデプロイ、Key Vault 統合、トークン追跡  
   **期待される成果:** gpt-4.1 とコスト監視を備えた稼働中のチャットアプリ

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (ローカル) ⭐⭐⭐⭐  
   本番対応のマルチサービスアーキテクチャ  
   **時間:** 45-60 分 | **コスト:** $50-150/月  
   **学べること:** サービス間通信、メッセージキューイング、分散トレーシング  
   **期待される成果:** モニタリングを備えた 2 サービスシステム（API ゲートウェイ + プロダクトサービス）

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API と Azure SQL Database を備えた Web アプリ  
   **時間:** 30-45 分 | **コスト:** $20-80/月  
   **学べること:** Entity Framework、データベースマイグレーション、接続セキュリティ  
   **期待される成果:** Azure SQL バックエンドを持つ C# API、スキーマの自動デプロイ

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP トリガーと Cosmos DB を持つ Python Azure Functions  
   **時間:** 30-40 分 | **コスト:** $10-40/月  
   **学べること:** イベント駆動アーキテクチャ、サーバーレスのスケーリング、NoSQL 統合  
   **期待される成果:** HTTP リクエストに応答し Cosmos DB に保存する Function アプリ

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps と API ゲートウェイを使用したマルチサービス Java アプリ  
   **時間:** 60-90 分 | **コスト:** $80-200/月  
   **学べること:** Spring Boot のデプロイ、サービスメッシュ、ロードバランシング  
   **期待される成果:** サービスディスカバリとルーティングを備えたマルチサービス Java システム

### Microsoft Foundry テンプレート

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   チャットインターフェイスを備えた完全な gpt-4.1 デプロイ  
   **時間:** 35-45 分 | **コスト:** $50-200/月  
   **期待される成果:** トークン追跡とコスト監視を備えた稼働中のチャットアプリ

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG アーキテクチャによるインテリジェントチャットアプリケーション  
   **時間:** 60-90 分 | **コスト:** $100-300/月  
   **期待される成果:** ドキュメント検索と引用を備えた RAG 駆動のチャットインターフェイス

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI サービスを用いたドキュメント解析  
   **時間:** 40-60 分 | **コスト:** $20-80/月  
   **期待される成果:** アップロードされたドキュメントからテキスト、表、エンティティを抽出する API

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning を用いた MLOps ワークフロー  
   **時間:** 2-3 時間 | **コスト:** $150-500/月  
   **期待される成果:** トレーニング、デプロイ、監視を備えた自動化 ML パイプライン

### 実世界のシナリオ

#### **Retail Multi-Agent Solution** 🆕
**[完全な実装ガイド](./retail-scenario.md)**

AZD を使用したエンタープライズグレードの AI アプリケーションデプロイを示す、包括的で本番対応のマルチエージェント顧客サポートソリューションです。このシナリオは次を提供します:

- <strong>完全なアーキテクチャ</strong>: 専門化されたカスタマーサービスおよび在庫管理エージェントを備えたマルチエージェントシステム
- **Production Infrastructure**: マルチリージョンの Microsoft Foundry Models デプロイ、AI Search、Container Apps、および包括的なモニタリング
- **Ready-to-Deploy ARM Template**: 複数の構成モード（Minimal/Standard/Premium）でワンクリックデプロイ
- **Advanced Features**: レッドチーミングによるセキュリティ検証、エージェント評価フレームワーク、コスト最適化、トラブルシューティングガイド
- **Real Business Context**: ファイルアップロード、検索統合、動的スケーリングを含む小売業者のカスタマーサポートユースケース

**Technologies**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (上級 - エンタープライズ本番対応)

**Perfect for**: AI 開発者、ソリューションアーキテクト、および本番環境のマルチエージェントシステムを構築するチーム

**Quick Start**: 添付の ARM テンプレートを使用して `./deploy.sh -g myResourceGroup` を実行することで、30 分以内に完全なソリューションをデプロイできます

## 📋 使用手順

### 前提条件

各例を実行する前に:
- ✅ Owner または Contributor 権限を持つ Azure サブスクリプション
- ✅ Azure Developer CLI がインストールされていること（[インストールガイド](../docs/chapter-01-foundation/installation.md)）
- ✅ Docker Desktop が稼働していること（コンテナ例向け）
- ✅ 適切な Azure クォータ（例ごとの要件を確認してください）

> **💰 コスト警告:** すべての例は実際の Azure リソースを作成し、料金が発生します。コスト見積もりは各 README ファイルを参照してください。継続的なコストを避けるため、終了後は `azd down` を実行することを忘れないでください。

### ローカルでの例の実行

1. <strong>例をクローンまたはコピー</strong>
   ```bash
   # 目的の例に移動する
   cd examples/simple-web-app
   ```

2. **AZD 環境を初期化**
   ```bash
   # 既存のテンプレートで初期化する
   azd init
   
   # または新しい環境を作成する
   azd env new my-environment
   ```

3. <strong>環境を構成</strong>
   ```bash
   # 必要な変数を設定する
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. <strong>デプロイ</strong>
   ```bash
   # インフラストラクチャとアプリケーションをデプロイする
   azd up
   ```

5. <strong>デプロイの検証</strong>
   ```bash
   # サービスのエンドポイントを取得する
   azd env get-values
   
   # エンドポイントをテストする（例）
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **期待される成功指標:**
   - ✅ `azd up` がエラーなく完了すること
   - ✅ サービスエンドポイントが HTTP 200 を返すこと
   - ✅ Azure ポータルで「Running」ステータスが表示されること
   - ✅ Application Insights がテレメトリを受信していること

> **⚠️ 問題が発生した場合:** デプロイのトラブルシューティングについては [一般的な問題](../docs/chapter-07-troubleshooting/common-issues.md) を参照してください

### 例の適応

各例には以下が含まれます:
- **README.md** - 詳細なセットアップおよびカスタマイズ手順
- **azure.yaml** - コメント付きの AZD 構成
- **infra/** - パラメータ説明付きの Bicep テンプレート
- **src/** - サンプルアプリケーションコード
- **scripts/** - 共通タスクのヘルパースクリプト

## 🎯 学習目標

### 例のカテゴリ

#### <strong>基本デプロイ</strong>
- 単一サービスアプリケーション
- シンプルなインフラパターン
- 基本的な構成管理
- コスト効率の良い開発セットアップ

#### <strong>高度なシナリオ</strong>
- マルチサービスアーキテクチャ
- 複雑なネットワーク構成
- データベース統合パターン
- セキュリティおよびコンプライアンスの実装

#### <strong>本番対応パターン</strong>
- 高可用性構成
- モニタリングと可観測性
- CI/CD 統合
- 災害復旧構成

## 📖 例の説明

### Simple Web App - Node.js Express
**Technologies**: Node.js, Express, MongoDB, Container Apps  
**Complexity**: 初級  
**Concepts**: 基本的なデプロイ、REST API、NoSQL データベース統合

### Static Website - React SPA
**Technologies**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexity**: 初級  
**Concepts**: 静的ホスティング、サーバーレスバックエンド、モダンウェブ開発

### Container App - Python Flask
**Technologies**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexity**: 初級  
**Concepts**: コンテナ化、REST API、scale-to-zero、ヘルスプローブ、モニタリング  
**Location**: [ローカル例](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Technologies**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexity**: 上級  
**Concepts**: マルチサービスアーキテクチャ、サービス間通信、メッセージキューイング、分散トレース  
**Location**: [ローカル例](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Technologies**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexity**: 中級  
**Concepts**: Entity Framework、データベース接続、Web API 開発

### Serverless Function - Python Azure Functions
**Technologies**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexity**: 中級  
**Concepts**: イベント駆動アーキテクチャ、サーバーレスコンピューティング、フルスタック開発

### Microservices - Java Spring Boot
**Technologies**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexity**: 中級  
**Concepts**: マイクロサービス間通信、分散システム、エンタープライズパターン

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**Technologies**: Microsoft Foundry Models, Azure AI Search, App Service  
**Complexity**: 中級  
**Concepts**: RAG アーキテクチャ、ベクトル検索、LLM 統合

#### AI Document Processing
**Technologies**: Azure AI Document Intelligence, Storage, Functions  
**Complexity**: 中級  
**Concepts**: ドキュメント解析、OCR、データ抽出

#### Machine Learning Pipeline
**Technologies**: Azure ML, MLOps, Container Registry  
**Complexity**: 上級  
**Concepts**: モデル学習、デプロイパイプライン、モニタリング

## 🛠 設定例

`configurations/` ディレクトリには再利用可能なコンポーネントが含まれます:

### 環境構成
- 開発環境設定
- ステージング環境構成
- 本番対応構成
- マルチリージョンデプロイ設定

### Bicep モジュール
- 再利用可能なインフラコンポーネント
- 共通のリソースパターン
- セキュリティ強化テンプレート
- コスト最適化構成

### ヘルパースクリプト
- 環境セットアップの自動化
- データベース移行スクリプト
- デプロイ検証ツール
- コスト監視ユーティリティ

## 🔧 カスタマイズガイド

### ユースケースに合わせた例の適応

1. <strong>前提条件の確認</strong>
   - Azure サービス要件を確認
   - サブスクリプションの制限を検証
   - コストの影響を理解

2. <strong>構成の変更</strong>
   - `azure.yaml` のサービス定義を更新
   - Bicep テンプレートをカスタマイズ
   - 環境変数を調整

3. <strong>十分なテスト</strong>
   - まず開発環境にデプロイ
   - 機能を検証
   - スケーリングとパフォーマンスをテスト

4. <strong>セキュリティレビュー</strong>
   - アクセス制御を確認
   - シークレット管理を実装
   - モニタリングとアラートを有効化

## 📊 比較マトリクス

| Example | Services | Database | Auth | Monitoring | Complexity |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Local) | 2 | ❌ | Key Vault | Full | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | Basic | Full | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | Enterprise | Advanced | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 学習ロードマップ

### 推奨進行順

1. **Simple Web App から始める**
   - 基本的な AZD の概念を学ぶ
   - デプロイワークフローを理解する
   - 環境管理を実践する

2. **Static Website を試す**
   - 異なるホスティングオプションを探索
   - CDN 統合について学ぶ
   - DNS 構成を理解する

3. **Container App に進む**
   - コンテナ化の基本を学ぶ
   - スケーリング概念を理解する
   - Docker を使って練習する

4. <strong>データベース統合を追加</strong>
   - データベースプロビジョニングを学ぶ
   - 接続文字列を理解する
   - シークレット管理を実践する

5. **Serverless を探索**
   - イベント駆動アーキテクチャを理解する
   - トリガーとバインディングについて学ぶ
   - API を使って練習する

6. <strong>マイクロサービスを構築</strong>
   - サービス間通信を学ぶ
   - 分散システムを理解する
   - 複雑なデプロイを実践する

## 🔍 適切な例の見つけ方

### 技術スタック別
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Local)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Local)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### アーキテクチャパターン別
- **Simple REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### 複雑さレベル別
- **Beginner**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermediate**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Advanced**: ML Pipeline
- **Enterprise Production-Ready**: [Microservices (Local)](../../../examples/container-app/microservices)（メッセージキューイングを伴うマルチサービス）、**Retail Multi-Agent Solution**（ARM テンプレートによる完全なマルチエージェントシステムのデプロイ）

## 📚 追加リソース

### ドキュメントリンク
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### コミュニティ例
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [C# API を使った React Web アプリ](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps ジョブ](https://github.com/Azure-Samples/container-apps-jobs)
- [Java を使った Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### ベストプラクティス
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 寄稿例

共有したい有用な例がありますか？寄稿を歓迎します！

### 提出ガイドライン
1. 定められたディレクトリ構成に従う
2. 包括的な README.md を含める
3. 設定ファイルにコメントを追加する
4. 提出前に十分にテストする
5. コスト見積もりと前提条件を含める

### 例のテンプレート構成
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

<strong>プロのヒント</strong>: あなたの技術スタックに一致する最も単純な例から始め、徐々により複雑なシナリオに進んでください。各例は前の例の概念に基づいて構築されています！

## 🚀 始める準備はできましたか？

### 学習パス

1. **完全な初心者ですか？** → [Flask API](../../../examples/container-app/simple-flask-api) から始めてください (⭐, 20 分)
2. **基本的な AZD の知識がありますか？** → [マイクロサービス](../../../examples/container-app/microservices) を試してみてください (⭐⭐⭐⭐, 60 分)
3. **AIアプリを構築していますか？** → [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) から始める (⭐⭐, 35 分) か、[Retail Multi-Agent](retail-scenario.md) を探ってみてください (⭐⭐⭐⭐, 2+ 時間)
4. **特定の技術スタックが必要ですか？** → 上記の [適切な例の見つけ方](#-finding-the-right-example) セクションを参照してください

### 次のステップ

- ✅ 上記の [前提条件](#前提条件) を確認する
- ✅ 自分のスキルレベルに合った例を選ぶ（[複雑度の凡例](#難易度評価の凡例) を参照）
- ✅ デプロイする前に例の README をよく読む
- ✅ テスト後に `azd down` を実行するリマインダーを設定する
- ✅ GitHub Issues または Discussions で経験を共有する

### ヘルプが必要ですか？

- 📖 [FAQ](../resources/faq.md) - よくある質問への回答
- 🐛 [トラブルシューティング ガイド](../docs/chapter-07-troubleshooting/common-issues.md) - デプロイの問題を修正する
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - コミュニティに質問する
- 📚 [学習ガイド](../resources/study-guide.md) - 学習を強化する

---

<strong>ナビゲーション</strong>
- **📚 コースホーム**: [AZD For Beginners](../README.md)
- **📖 学習資料**: [学習ガイド](../resources/study-guide.md) | [チートシート](../resources/cheat-sheet.md) | [用語集](../resources/glossary.md)
- **🔧 リソース**: [FAQ](../resources/faq.md) | [トラブルシューティング](../docs/chapter-07-troubleshooting/common-issues.md)

---

*最終更新: 2025年11月 | [問題を報告する](https://github.com/microsoft/AZD-for-beginners/issues) | [例を寄稿する](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->