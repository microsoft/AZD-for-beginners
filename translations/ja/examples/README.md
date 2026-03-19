# 例 - 実用的な AZD テンプレートと構成

**例による学習 - 章ごとに整理**
- **📚 コース ホーム**: [AZD 入門](../README.md)
- **📖 章マッピング**: 学習の複雑さごとに整理された例
- **🚀 ローカル例**: [小売マルチエージェント ソリューション](retail-scenario.md)
- **🤖 外部 AI サンプル**: Azure Samples リポジトリへのリンク

> **📍 重要: ローカルと外部の例の違い**  
> このリポジトリには、完全な実装を含む **4つのローカル例** が含まれています:  
> - **Microsoft Foundry Models Chat** (チャットインターフェイス付きの gpt-4.1 デプロイ)  
> - **Container Apps** (シンプルな Flask API + マイクロサービス)  
> - **Database App** (Web + SQL データベース)  
> - **Retail Multi-Agent** (エンタープライズ向け AI ソリューション)  
>  
> 追加の例はクローンできる Azure-Samples リポジトリへの <strong>外部参照</strong> です。

## はじめに

このディレクトリでは、ハンズオンの練習を通じて Azure Developer CLI を学ぶための実践的な例と参照を提供します。Retail Multi-Agent シナリオは、このリポジトリに含まれる完全な本番対応の実装です。追加の例は、さまざまな AZD パターンを示す公式の Azure Samples を参照しています。

### 複雑さ評価の凡例

- ⭐ <strong>初心者</strong> - 基本概念、単一サービス、15-30 分
- ⭐⭐ <strong>中級</strong> - 複数サービス、データベース統合、30-60 分
- ⭐⭐⭐ <strong>上級</strong> - 複雑なアーキテクチャ、AI 統合、1-2 時間
- ⭐⭐⭐⭐ <strong>エキスパート</strong> - 本番対応、エンタープライズパターン、2+ 時間

## 🎯 このリポジトリに実際に含まれているもの

### ✅ ローカル実装（すぐに使用可能）

#### [Microsoft Foundry Models チャット アプリケーション](azure-openai-chat/README.md) 🆕
**このリポジトリにチャットインターフェイス付きの完全な gpt-4.1 デプロイが含まれています**

- **場所:** `examples/azure-openai-chat/`
- **複雑さ:** ⭐⭐ (中級)
- **含まれているもの:**
  - Microsoft Foundry Models の完全なデプロイ (gpt-4.1)
  - Python コマンドラインチャットインターフェイス
  - API キーを安全に管理するための Key Vault 統合
  - Bicep のインフラテンプレート
  - トークン使用量とコストの追跡
  - レート制限とエラーハンドリング

**Quick Start:**
```bash
# example に移動する
cd examples/azure-openai-chat

# すべてをデプロイする
azd up

# 依存関係をインストールしてチャットを開始する
pip install -r src/requirements.txt
python src/chat.py
```

**技術:** Microsoft Foundry Models、gpt-4.1、Key Vault、Python、Bicep

#### [Container App の例](container-app/README.md) 🆕
<strong>このリポジトリに包括的なコンテナデプロイの例が含まれています</strong>

- **場所:** `examples/container-app/`
- **複雑さ:** ⭐-⭐⭐⭐⭐ (初心者〜上級)
- **含まれているもの:**
  - [マスターガイド](container-app/README.md) - コンテナデプロイの包括的な概要
  - [シンプルな Flask API](../../../examples/container-app/simple-flask-api) - 基本的な REST API の例
  - [マイクロサービスアーキテクチャ](../../../examples/container-app/microservices) - 本番対応のマルチサービスデプロイ
  - クイックスタート、プロダクション、および高度なパターン
  - 監視、セキュリティ、コスト最適化

**Quick Start:**
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

**技術:** Azure Container Apps、Docker、Python Flask、Node.js、C#、Go、Application Insights

#### [小売マルチエージェント ソリューション](retail-scenario.md) 🆕
<strong>このリポジトリに含まれる完全な本番対応実装</strong>

- **場所:** `examples/retail-multiagent-arm-template/`
- **複雑さ:** ⭐⭐⭐⭐ (上級)
- **含まれているもの:**
  - 完全な ARM デプロイテンプレート
  - マルチエージェントアーキテクチャ（顧客 + 在庫）
  - Microsoft Foundry Models 統合
  - RAG を使用した AI 検索
  - 包括的な監視
  - ワンクリックデプロイスクリプト

**Quick Start:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**技術:** Microsoft Foundry Models、AI Search、Container Apps、Cosmos DB、Application Insights

---

## 🔗 外部 Azure Samples（クローンして使用）

以下の例は公式の Azure-Samples リポジトリで管理されています。クローンして、さまざまな AZD パターンを確認してください:

### シンプルなアプリケーション（章 1-2）

| テンプレート | リポジトリ | 複雑さ | サービス |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [ローカル: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python、Container Apps、Application Insights |
| <strong>マイクロサービス</strong> | [ローカル: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | マルチサービス、Service Bus、Cosmos DB、SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express、Cosmos DB、Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps、Functions、SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python、Container Apps、API |

**使い方:**
```bash
# 任意の例をクローンする
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# デプロイする
azd up
```

### AI アプリケーションの例（章 2、5、8）

| テンプレート | リポジトリ | 複雑さ | フォーカス |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models チャット** | [ローカル: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 デプロイ |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | 基本的な AI チャット |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | エージェントフレームワーク |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG パターン |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | エンタープライズ AI |

### データベース & 高度なパターン（章 3-8）

| テンプレート | リポジトリ | 複雑さ | フォーカス |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | データベース統合 |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL サーバーレス |
| **Java マイクロサービス** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | マルチサービス |
| **ML パイプライン** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## 学習目標

これらの例を通じて学習することで、次のことができます:
- 実用的なアプリケーションシナリオで Azure Developer CLI のワークフローを練習する
- さまざまなアプリケーションアーキテクチャとそれらの azd 実装を理解する
- さまざまな Azure サービスに対する Infrastructure as Code パターンを習得する
- 構成管理と環境固有のデプロイ戦略を適用する
- 実用的な文脈で監視、セキュリティ、スケーリングのパターンを実装する
- 本番デプロイのトラブルシューティングとデバッグの経験を積む

## 学習成果

これらの例を完了すると、次のことができるようになります:
- Azure Developer CLI を使用してさまざまなアプリケーションタイプを自信を持ってデプロイする
- 提供されたテンプレートを自分のアプリケーション要件に適応させる
- Bicep を使用してカスタムインフラパターンを設計および実装する
- 適切な依存関係を持つ複雑なマルチサービスアプリケーションを構成する
- 実際のシナリオでセキュリティ、監視、およびパフォーマンスのベストプラクティスを適用する
- 実務経験に基づいてデプロイをトラブルシュートおよび最適化する

## ディレクトリ構造

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

> **💡 AZD に不慣れですか？** まず例 #1（Flask API）から始めてください - 約20分でコア概念を学べます。

### 初心者向け
1. **[コンテナアプリ - Python Flask API](../../../examples/container-app/simple-flask-api)** (ローカル) ⭐  
   scale-to-zero を使用したシンプルな REST API をデプロイします  
   **所要時間:** 20-25 分 | **コスト:** $0-5/月  
   **学べること:** 基本的な azd ワークフロー、コンテナ化、ヘルスプローブ  
   **期待される成果:** モニタリング付きで "Hello, World!" を返す動作する API エンドポイント

2. **[シンプル Web アプリ - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB を使用した Node.js Express ウェブアプリをデプロイします  
   **所要時間:** 25-35 分 | **コスト:** $10-30/月  
   **学べること:** データベース統合、環境変数、接続文字列  
   **期待される成果:** 作成/読み取り/更新/削除機能を持つ Todo リストアプリ

3. **[静的サイト - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps で React の静的サイトをホストします  
   **所要時間:** 20-30 分 | **コスト:** $0-10/月  
   **学べること:** 静的ホスティング、サーバーレス関数、CDN デプロイ  
   **期待される成果:** API バックエンドを持つ React UI、 自動 SSL、グローバル CDN

### 中級者向け
4. **[Microsoft Foundry Models チャット アプリケーション](../../../examples/azure-openai-chat)** (ローカル) ⭐⭐  
   gpt-4.1 をチャットインターフェイスと安全な API キー管理でデプロイします  
   **所要時間:** 35-45 分 | **コスト:** $50-200/月  
   **学べること:** Microsoft Foundry Models のデプロイ、Key Vault 統合、トークン追跡  
   **期待される成果:** gpt-4.1 とコスト監視を備えた動作するチャットアプリケーション

5. **[コンテナアプリ - マイクロサービス](../../../examples/container-app/microservices)** (ローカル) ⭐⭐⭐⭐  
   本番対応のマルチサービスアーキテクチャ  
   **所要時間:** 45-60 分 | **コスト:** $50-150/月  
   **学べること:** サービス間通信、メッセージキューイング、分散トレーシング  
   **期待される成果:** 監視を備えた 2 サービスシステム（API ゲートウェイ + 製品サービス）

6. **[データベースアプリ - C# と Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API と Azure SQL Database を持つウェブアプリケーション  
   **所要時間:** 30-45 分 | **コスト:** $20-80/月  
   **学べること:** Entity Framework、データベースマイグレーション、接続のセキュリティ  
   **期待される成果:** Azure SQL バックエンドを持つ C# API、スキーマの自動デプロイ

7. **[サーバーレス関数 - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP トリガーと Cosmos DB を使用する Python Azure Functions  
   **所要時間:** 30-40 分 | **コスト:** $10-40/月  
   **学べること:** イベント駆動アーキテクチャ、サーバーレススケーリング、NoSQL 統合  
   **期待される成果:** HTTP リクエストに応答し Cosmos DB に格納する Function App

8. **[マイクロサービス - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps と API ゲートウェイを使用したマルチサービス Java アプリケーション  
   **所要時間:** 60-90 分 | **コスト:** $80-200/月  
   **学べること:** Spring Boot のデプロイ、サービスメッシュ、ロードバランシング  
   **期待される成果:** サービスディスカバリとルーティングを備えたマルチサービス Java システム

### Microsoft Foundry テンプレート

1. **[Microsoft Foundry Models チャット アプリ - ローカル例](../../../examples/azure-openai-chat)** ⭐⭐  
   チャットインターフェイス付きの完全な gpt-4.1 デプロイ  
   **所要時間:** 35-45 分 | **コスト:** $50-200/月  
   **期待される成果:** トークン追跡とコスト監視を備えた動作するチャットアプリケーション

2. **[Azure Search + OpenAI デモ](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG アーキテクチャを備えたインテリジェントなチャットアプリケーション  
   **所要時間:** 60-90 分 | **コスト:** $100-300/月  
   **期待される成果:** ドキュメント検索と引用を含む RAG 駆動のチャットインターフェイス

3. **[AI ドキュメント処理](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI サービスを使用したドキュメント解析  
   **所要時間:** 40-60 分 | **コスト:** $20-80/月  
   **期待される成果:** アップロードされたドキュメントからテキスト、表、エンティティを抽出する API

4. **[機械学習パイプライン](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning を使用した MLOps ワークフロー  
   **所要時間:** 2-3 時間 | **コスト:** $150-500/月  
   **期待される成果:** トレーニング、デプロイ、および監視を備えた自動化された ML パイプライン

### 実世界のシナリオ

#### **Retail Multi-Agent Solution** 🆕
**[Complete Implementation Guide](./retail-scenario.md)**

包括的で本番対応のマルチエージェント顧客サポートソリューションで、AZD を使用したエンタープライズクラスの AI アプリケーションデプロイを示します。このシナリオは以下を提供します：
- **Complete Architecture**: マルチエージェントシステム（専門のカスタマーサービスおよび在庫管理エージェントを備える）
- **Production Infrastructure**: マルチリージョンの Microsoft Foundry Models デプロイ、AI Search、Container Apps、および包括的な監視
- **Ready-to-Deploy ARM Template**: ワンクリックでデプロイ可能な ARM テンプレート（複数の構成モード: Minimal/Standard/Premium）
- **Advanced Features**: レッドチーミングによるセキュリティ検証、エージェント評価フレームワーク、コスト最適化、トラブルシューティングガイド
- **Real Business Context**: ファイルアップロード、検索統合、動的スケーリングを含む小売業者のカスタマーサポートユースケース

**Technologies**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (Advanced - Enterprise Production Ready)

**Perfect for**: AI 開発者、ソリューションアーキテクト、及び本番環境のマルチエージェントシステムを構築するチームに最適

**Quick Start**: 同梱の ARM テンプレートを使用して `./deploy.sh -g myResourceGroup` により 30 分未満で完全ソリューションをデプロイ

## 📋 使用方法

### 前提条件

例を実行する前に:
- ✅ Azure サブスクリプション（Owner または Contributor 権限）
- ✅ Azure Developer CLI がインストールされている ([Installation Guide](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop が稼働している（コンテナの例用）
- ✅ 適切な Azure クォータ（例ごとの要件を確認）

> **💰 コストに関する注意:** すべての例は課金対象となる実際の Azure リソースを作成します。コスト見積もりは各 README ファイルを参照してください。作業終了後は継続的なコストを避けるために `azd down` を実行してください。

### ローカルでの例の実行

1. <strong>例をクローンまたはコピー</strong>
   ```bash
   # 目的の例に移動
   cd examples/simple-web-app
   ```

2. **AZD 環境の初期化**
   ```bash
   # 既存のテンプレートで初期化する
   azd init
   
   # または新しい環境を作成する
   azd env new my-environment
   ```

3. <strong>環境の設定</strong>
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
   - ✅ `azd up` がエラーなく完了する
   - ✅ サービスエンドポイントが HTTP 200 を返す
   - ✅ Azure Portal に "Running" ステータスが表示される
   - ✅ Application Insights がテレメトリを受信している

> **⚠️ 問題が発生しましたか？** デプロイのトラブルシューティングについては [Common Issues](../docs/chapter-07-troubleshooting/common-issues.md) を参照してください

### 例の適応

各例には以下が含まれます:
- **README.md** - 詳細なセットアップとカスタマイズ手順
- **azure.yaml** - コメント付きの AZD 設定
- **infra/** - パラメーター説明付きの Bicep テンプレート
- **src/** - サンプルアプリケーションコード
- **scripts/** - 一般的な作業のためのヘルパースクリプト

## 🎯 学習目標

### 例のカテゴリ

#### <strong>基本的なデプロイ</strong>
- 単一サービスアプリケーション
- シンプルなインフラパターン
- 基本的な構成管理
- コスト効率の高い開発セットアップ

#### <strong>高度なシナリオ</strong>
- マルチサービスアーキテクチャ
- 複雑なネットワーク構成
- データベース統合パターン
- セキュリティおよびコンプライアンス実装

#### <strong>本番対応パターン</strong>
- 高可用性構成
- 監視と可観測性
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
**Concepts**: コンテナ化、REST API、scale-to-zero、ヘルスプローブ、監視  
**Location**: [Local Example](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Technologies**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexity**: 上級  
**Concepts**: マルチサービスアーキテクチャ、サービス間通信、メッセージキュー、分散トレーシング  
**Location**: [Local Example](../../../examples/container-app/microservices)

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
**Technologies**: Microsoft Foundry Models, Cognitive Search, App Service  
**Complexity**: 中級  
**Concepts**: RAG アーキテクチャ、ベクトル検索、LLM 統合

#### AI Document Processing
**Technologies**: Azure AI Document Intelligence, Storage, Functions  
**Complexity**: 中級  
**Concepts**: ドキュメント分析、OCR、データ抽出

#### Machine Learning Pipeline
**Technologies**: Azure ML, MLOps, Container Registry  
**Complexity**: 上級  
**Concepts**: モデル訓練、デプロイパイプライン、モニタリング

## 🛠 設定例

`configurations/` ディレクトリには再利用可能なコンポーネントが含まれます:

### 環境設定
- 開発環境設定
- ステージング環境設定
- 本番対応設定
- マルチリージョンデプロイ設定

### Bicep モジュール
- 再利用可能なインフラコンポーネント
- 共通のリソースパターン
- セキュリティ強化テンプレート
- コスト最適化構成

### ヘルパースクリプト
- 環境セットアップの自動化
- データベースマイグレーションスクリプト
- デプロイ検証ツール
- コスト監視ユーティリティ

## 🔧 カスタマイズガイド

### 使用ケースに合わせた例の適応

1. <strong>前提条件の確認</strong>
   - Azure サービス要件を確認
   - サブスクリプションの制限を検証
   - コストの影響を理解

2. <strong>構成の修正</strong>
   - `azure.yaml` のサービス定義を更新
   - Bicep テンプレートをカスタマイズ
   - 環境変数を調整

3. <strong>十分なテスト</strong>
   - まず開発環境にデプロイ
   - 機能性を検証
   - スケーリングとパフォーマンスをテスト

4. <strong>セキュリティレビュー</strong>
   - アクセス制御を見直す
   - シークレット管理を実装
   - 監視とアラートを有効化

## 📊 比較マトリクス

| Example | Services | Database | Auth | Monitoring | Complexity |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (ローカル) | 2 | ❌ | Key Vault | フル | ⭐⭐ |
| **Python Flask API** (ローカル) | 1 | ❌ | 基本 | フル | ⭐ |
| **Microservices** (ローカル) | 5+ | ✅ | エンタープライズ | 高度 | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | 基本 | 基本 | ⭐ |
| React SPA + Functions | 3 | ✅ | 基本 | フル | ⭐ |
| Python Flask Container | 2 | ❌ | 基本 | フル | ⭐ |
| C# Web API + SQL | 2 | ✅ | フル | フル | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | フル | フル | ⭐⭐ |
| Java Microservices | 5+ | ✅ | フル | フル | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | フル | フル | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | 基本 | フル | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | フル | フル | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (ローカル) | **8+** | **✅** | <strong>エンタープライズ</strong> | <strong>高度</strong> | **⭐⭐⭐⭐** |

## 🎓 学習パス

### 推奨進行

1. **Simple Web App から始める**
   - 基本的な AZD の概念を学ぶ
   - デプロイワークフローを理解する
   - 環境管理を実践する

2. **Static Website を試す**
   - 異なるホスティングオプションを探る
   - CDN 統合について学ぶ
   - DNS 設定を理解する

3. **Container App へ進む**
   - コンテナ化の基本を学ぶ
   - スケーリングの概念を理解する
   - Docker を用いて練習する

4. <strong>データベース統合を追加</strong>
   - データベースプロビジョニングを学ぶ
   - 接続文字列を理解する
   - シークレット管理を実践する

5. <strong>サーバーレスを探る</strong>
   - イベント駆動アーキテクチャを理解する
   - トリガーとバインディングについて学ぶ
   - API を使って練習する

6. <strong>マイクロサービスを構築</strong>
   - サービス間通信を学ぶ
   - 分散システムを理解する
   - 複雑なデプロイを実践する

## 🔍 適切な例の見つけ方

### 技術スタック別
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java マイクロサービス
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Local)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Local)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot マイクロサービス
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java マイクロサービス
- **Databases**: [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### アーキテクチャパターン別
- **Simple REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot マイクロサービス
- **Containerized**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### 難易度別
- **Beginner**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermediate**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java マイクロサービス, Microsoft Foundry Models Chat App, AI Document Processing
- **Advanced**: ML Pipeline
- **Enterprise Production-Ready**: [Microservices (Local)](../../../examples/container-app/microservices)（メッセージキューを伴うマルチサービス）, **Retail Multi-Agent Solution**（ARM テンプレートデプロイを含む完全なマルチエージェントシステム）

## 📚 追加リソース

### ドキュメントリンク
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### コミュニティの例
- [Azure Samples の AZD テンプレート](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry のテンプレート](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI ギャラリー](https://azure.github.io/awesome-azd/)
- [C# と Azure SQL の Todo アプリ](https://github.com/Azure-Samples/todo-csharp-sql)
- [Python と MongoDB の Todo アプリ](https://github.com/Azure-Samples/todo-python-mongo)
- [Node.js と PostgreSQL の Todo アプリ](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [C# API を持つ React Web アプリ](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps ジョブ](https://github.com/Azure-Samples/container-apps-jobs)
- [Java を使った Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### ベストプラクティス
- [Azure Well-Architected フレームワーク](https://learn.microsoft.com/en-us/azure/well-architected/)
- [クラウド導入フレームワーク](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 サンプルの寄稿

役に立つサンプルを共有したいですか？寄稿を歓迎します！

### 提出ガイドライン
1. 確立されたディレクトリ構造に従う
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

<strong>プロのヒント</strong>: 技術スタックに合った最も簡単な例から始め、徐々により複雑なシナリオに進んでください。各サンプルは前のものの概念に基づいて構築されています！

## 🚀 始める準備はできましたか？

### 学習パス

1. **完全な初心者ですか？** → まずは [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 分)
2. **基本的な AZD の知識がありますか？** → [マイクロサービス](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 分) を試してください
3. **AI アプリを構築していますか？** → まずは [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 分) または [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ 時間) を試してください
4. **特定の技術スタックが必要ですか？** → 上記の [適切な例の見つけ方](#-finding-the-right-example) セクションを参照してください

### 次のステップ

- ✅ 上記の [前提条件](#前提条件) を確認する
- ✅ 自分のスキルレベルに合った例を選ぶ（[複雑さの凡例](#複雑さ評価の凡例) を参照）
- ✅ サンプルの README をデプロイ前によく読む
- ✅ テスト後に `azd down` を実行するようリマインダーを設定する
- ✅ GitHub Issues または Discussions を通じて経験を共有する

### ヘルプが必要ですか？

- 📖 [FAQ](../resources/faq.md) - よくある質問に回答
- 🐛 [トラブルシューティングガイド](../docs/chapter-07-troubleshooting/common-issues.md) - デプロイの問題を解決する
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - コミュニティに質問する
- 📚 [学習ガイド](../resources/study-guide.md) - 学習を強化する

---

<strong>ナビゲーション</strong>
- **📚 コースホーム**: [AZD 入門](../README.md)
- **📖 学習資料**: [学習ガイド](../resources/study-guide.md) | [チートシート](../resources/cheat-sheet.md) | [用語集](../resources/glossary.md)
- **🔧 リソース**: [FAQ](../resources/faq.md) | [トラブルシューティング](../docs/chapter-07-troubleshooting/common-issues.md)

---

*最終更新: 2025年11月 | [問題を報告する](https://github.com/microsoft/AZD-for-beginners/issues) | [サンプルを寄稿する](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:
本書類はAI翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) により翻訳されました。正確性の確保に努めていますが、自動翻訳には誤りや不正確さが含まれる可能性があることにご注意ください。重要な情報については、原文（原言語の文書）を権威ある情報源とみなしてください。重要な事項については、専門の翻訳者による人間の翻訳を推奨します。この翻訳の利用により生じたいかなる誤解や誤訳についても、当社は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->