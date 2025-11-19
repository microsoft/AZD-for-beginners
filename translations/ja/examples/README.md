<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4a896781acb2a7bebb3c4c66c4f46e7f",
  "translation_date": "2025-11-19T18:07:37+00:00",
  "source_file": "examples/README.md",
  "language_code": "ja"
}
-->
# 例 - 実践的なAZDテンプレートと構成

**例を通じて学ぶ - 章ごとに整理**
- **📚 コースホーム**: [AZD初心者向け](../README.md)
- **📖 章のマッピング**: 学習の複雑さに応じた例の整理
- **🚀 ローカル例**: [小売業マルチエージェントソリューション](retail-scenario.md)
- **🤖 外部AI例**: Azure Samplesリポジトリへのリンク

> **📍 重要: ローカル例と外部例の違い**  
> このリポジトリには、完全な実装を含む**4つのローカル例**が含まれています:  
> - **Azure OpenAI Chat** (チャットインターフェース付きGPT-4デプロイ)  
> - **コンテナーアプリ** (シンプルなFlask API + マイクロサービス)  
> - **データベースアプリ** (Web + SQLデータベース)  
> - **小売業マルチエージェント** (エンタープライズAIソリューション)  
>  
> 追加の例は、クローン可能なAzure-Samplesリポジトリへの**外部参照**です。

## はじめに

このディレクトリは、Azure Developer CLIを実践的に学ぶための例と参考資料を提供します。小売業マルチエージェントシナリオは、このリポジトリに含まれる完全なプロダクション対応の実装です。追加の例は、さまざまなAZDパターンを示す公式Azure Samplesを参照しています。

### 複雑さの評価基準

- ⭐ **初心者** - 基本概念、単一サービス、15～30分
- ⭐⭐ **中級** - 複数サービス、データベース統合、30～60分
- ⭐⭐⭐ **上級** - 複雑なアーキテクチャ、AI統合、1～2時間
- ⭐⭐⭐⭐ **エキスパート** - プロダクション対応、エンタープライズパターン、2時間以上

## 🎯 このリポジトリに含まれる内容

### ✅ ローカル実装 (すぐに使用可能)

#### [Azure OpenAI Chatアプリケーション](azure-openai-chat/README.md) 🆕
**このリポジトリに含まれる完全なGPT-4デプロイとチャットインターフェース**

- **場所:** `examples/azure-openai-chat/`
- **複雑さ:** ⭐⭐ (中級)
- **含まれる内容:**
  - 完全なAzure OpenAIデプロイ (GPT-4)
  - Pythonコマンドラインチャットインターフェース
  - APIキーのセキュリティ管理のためのKey Vault統合
  - Bicepインフラストラクチャテンプレート
  - トークン使用量とコスト追跡
  - レート制限とエラーハンドリング

**クイックスタート:**
```bash
# 例に移動する
cd examples/azure-openai-chat

# すべてをデプロイする
azd up

# 依存関係をインストールしてチャットを開始する
pip install -r src/requirements.txt
python src/chat.py
```

**技術:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [コンテナーアプリの例](container-app/README.md) 🆕
**このリポジトリに含まれる包括的なコンテナー展開例**

- **場所:** `examples/container-app/`
- **複雑さ:** ⭐-⭐⭐⭐⭐ (初心者から上級まで)
- **含まれる内容:**
  - [マスターガイド](container-app/README.md) - コンテナー展開の完全な概要
  - [シンプルなFlask API](../../../examples/container-app/simple-flask-api) - 基本的なREST API例
  - [マイクロサービスアーキテクチャ](../../../examples/container-app/microservices) - プロダクション対応のマルチサービス展開
  - クイックスタート、プロダクション、上級パターン
  - モニタリング、セキュリティ、コスト最適化

**クイックスタート:**
```bash
# マスターガイドを表示
cd examples/container-app

# シンプルなFlask APIをデプロイ
cd simple-flask-api
azd up

# マイクロサービスの例をデプロイ
cd ../microservices
azd up
```

**技術:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [小売業マルチエージェントソリューション](retail-scenario.md) 🆕
**このリポジトリに含まれる完全なプロダクション対応の実装**

- **場所:** `examples/retail-multiagent-arm-template/`
- **複雑さ:** ⭐⭐⭐⭐ (上級)
- **含まれる内容:**
  - 完全なARMデプロイメントテンプレート
  - マルチエージェントアーキテクチャ (顧客 + 在庫管理)
  - Azure OpenAI統合
  - RAGを使用したAI検索
  - 包括的なモニタリング
  - ワンクリックデプロイメントスクリプト

**クイックスタート:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**技術:** Azure OpenAI, AI検索, コンテナーアプリ, Cosmos DB, Application Insights

---

## 🔗 外部Azure Samples (クローンして使用)

以下の例は公式Azure-Samplesリポジトリで管理されています。クローンしてさまざまなAZDパターンを探索してください。

### シンプルなアプリケーション (章1-2)

| テンプレート | リポジトリ | 複雑さ | サービス |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [ローカル: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **マイクロサービス** | [ローカル: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | マルチサービス, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**使用方法:**
```bash
# 任意の例をクローンする
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# デプロイ
azd up
```

### AIアプリケーション例 (章2, 5, 8)

| テンプレート | リポジトリ | 複雑さ | フォーカス |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [ローカル: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4デプロイ |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | 基本的なAIチャット |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | エージェントフレームワーク |
| **検索 + OpenAIデモ** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAGパターン |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | エンタープライズAI |

### データベース & 高度なパターン (章3-8)

| テンプレート | リポジトリ | 複雑さ | フォーカス |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | データベース統合 |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQLサーバーレス |
| **Javaマイクロサービス** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | マルチサービス |
| **MLパイプライン** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## 学習目標

これらの例を通じて、以下を学びます:
- 実際のアプリケーションシナリオでAzure Developer CLIワークフローを練習
- さまざまなアプリケーションアーキテクチャとそのAZD実装を理解
- さまざまなAzureサービスのインフラストラクチャコードパターンを習得
- 構成管理と環境固有のデプロイメント戦略を適用
- 実践的なコンテキストでモニタリング、セキュリティ、スケーリングパターンを実装
- 実際のデプロイメントシナリオでトラブルシューティングとデバッグの経験を積む

## 学習成果

これらの例を完了すると、以下が可能になります:
- Azure Developer CLIを使用してさまざまなアプリケーションタイプを自信を持ってデプロイ
- 提供されたテンプレートを自分のアプリケーション要件に適応
- Bicepを使用してカスタムインフラストラクチャパターンを設計および実装
- 適切な依存関係を持つ複雑なマルチサービスアプリケーションを構成
- 実際のシナリオでセキュリティ、モニタリング、パフォーマンスのベストプラクティスを適用
- 実践的な経験に基づいてデプロイメントをトラブルシューティングおよび最適化

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

> **💡 AZD初心者向け** 例#1 (Flask API) から始めましょう - 約20分でコアコンセプトを学べます。

### 初心者向け
1. **[コンテナーアプリ - Python Flask API](../../../examples/container-app/simple-flask-api)** (ローカル) ⭐  
   スケールゼロのシンプルなREST APIをデプロイ  
   **時間:** 20～25分 | **コスト:** $0～5/月  
   **学べること:** 基本的なazdワークフロー、コンテナ化、ヘルスプローブ  
   **期待される成果:** モニタリング付きで"Hello, World!"を返す動作するAPIエンドポイント

2. **[シンプルなWebアプリ - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDBを使用したNode.js Express Webアプリケーションをデプロイ  
   **時間:** 25～35分 | **コスト:** $10～30/月  
   **学べること:** データベース統合、環境変数、接続文字列  
   **期待される成果:** 作成/読み取り/更新/削除機能を備えたTodoリストアプリ

3. **[静的ウェブサイト - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web AppsでReact静的ウェブサイトをホスト  
   **時間:** 20～30分 | **コスト:** $0～10/月  
   **学べること:** 静的ホスティング、サーバーレス関数、CDNデプロイ  
   **期待される成果:** React UIとAPIバックエンド、自動SSL、グローバルCDN

### 中級者向け
4. **[Azure OpenAI Chatアプリケーション](../../../examples/azure-openai-chat)** (ローカル) ⭐⭐  
   GPT-4をチャットインターフェースと安全なAPIキー管理でデプロイ  
   **時間:** 35～45分 | **コスト:** $50～200/月  
   **学べること:** Azure OpenAIデプロイ、Key Vault統合、トークン追跡  
   **期待される成果:** GPT-4とコストモニタリングを備えた動作するチャットアプリケーション

5. **[コンテナーアプリ - マイクロサービス](../../../examples/container-app/microservices)** (ローカル) ⭐⭐⭐⭐  
   プロダクション対応のマルチサービスアーキテクチャ  
   **時間:** 45～60分 | **コスト:** $50～150/月  
   **学べること:** サービス間通信、メッセージキューイング、分散トレーシング  
   **期待される成果:** モニタリング付きの2サービスシステム (APIゲートウェイ + 商品サービス)

6. **[データベースアプリ - C#とAzure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# APIとAzure SQLデータベースを備えたWebアプリケーション  
   **時間:** 30～45分 | **コスト:** $20～80/月  
   **学べること:** Entity Framework、データベースマイグレーション、接続セキュリティ  
   **期待される成果:** Azure SQLバックエンドを備えたC# API、自動スキーマデプロイメント

7. **[サーバーレス関数 - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTPトリガーとCosmos DBを備えたPython Azure Functions  
   **時間:** 30～40分 | **コスト:** $10～40/月  
   **学べること:** イベント駆動型アーキテクチャ、サーバーレススケーリング、NoSQL統合  
   **期待される成果:** HTTPリクエストに応答し、Cosmos DBストレージを使用するFunctionアプリ

8. **[マイクロサービス - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   コンテナーアプリとAPIゲートウェイを備えたマルチサービスJavaアプリケーション  
   **時間:** 60～90分 | **コスト:** $80～200/月  
   **学べること:** Spring Bootデプロイ、サービスメッシュ、負荷分散  
   **期待される成果:** サービス発見とルーティングを備えたマルチサービスJavaシステム

### Azure AI Foundryテンプレート

1. **[Azure OpenAI Chatアプリ - ローカル例](../../../examples/azure-openai-chat)** ⭐⭐  
   チャットインターフェースを備えた完全なGPT-4デプロイ  
   **時間:** 35～45分 | **コスト:** $50～200/月  
   **期待される成果:** トークン追跡とコストモニタリングを備えた動作するチャットアプリケーション

2. **[Azure Search + OpenAIデモ](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAGアーキテクチャを備えたインテリジェントチャットアプリケーション  
   **時間:** 60～90分 | **コスト:** $100～300/月  
   **期待される成果:** 文書検索と引用を備えたRAG対応チャットインターフェース

3. **[AI文書処理](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AIサービスを使用した文書分析  
   **時間:** 40～60分 | **コスト:** $20～80/月  
   **期待される成果:** アップロードされた文書からテキスト、表、エンティティを抽出するAPI

4. **[機械学習パイプライン](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learningを使用したMLOpsワークフロー  
   **時間:** 2～3時間 | **コスト:** $150～500/月  
   **期待される成果:** トレーニング、デプロイメント、モニタリングを備えた自動MLパイプライン

### 実世界のシナリオ

#### **小売業マルチエージェントソリューション** 🆕
**[完全な実装ガイド](./retail-scenario.md)**

エンタープライズグレードのAIアプリケーションデプロイメントをAZDで実現する包括的なプロダクション対応マルチエージェント顧客サポートソリューション。このシナリオは以下を提供します:

- **完全なアーキテクチャ**: 専門化された顧客サービスと在庫管理エージェントを備えたマルチエージェントシステム
- **プロダクションインフラストラクチャ**: マルチリージョンAzure OpenAIデプロイメント、AI検索、コンテナーアプリ、包括的なモニタリング
- **即時デプロイ可能なARMテンプレート**: ワンクリックでデプロイ可能、複数の構成モード（Minimal/Standard/Premium）対応
- **高度な機能**: レッドチーミングによるセキュリティ検証、エージェント評価フレームワーク、コスト最適化、トラブルシューティングガイド
- **実際のビジネスコンテキスト**: 小売業の顧客サポートユースケース（ファイルアップロード、検索統合、動的スケーリング対応）

**技術**: Azure OpenAI (GPT-4o, GPT-4o-mini)、Azure AI Search、コンテナーアプリ、Cosmos DB、Application Insights、Document Intelligence、Bing Search API

**複雑度**: ⭐⭐⭐⭐ (高度 - エンタープライズプロダクション対応)

**対象**: AI開発者、ソリューションアーキテクト、プロダクションマルチエージェントシステムを構築するチーム

**クイックスタート**: `./deploy.sh -g myResourceGroup`を使用して、付属のARMテンプレートで30分以内に完全なソリューションをデプロイ

## 📋 使用手順

### 前提条件

例を実行する前に:
- ✅ オーナーまたはコントリビューターアクセス権を持つAzureサブスクリプション
- ✅ Azure Developer CLIインストール済み ([インストールガイド](../docs/getting-started/installation.md))
- ✅ Docker Desktopが稼働中（コンテナー例用）
- ✅ 適切なAzureクォータ（例固有の要件を確認）

> **💰 コスト警告:** すべての例は実際のAzureリソースを作成し、料金が発生します。個別のREADMEファイルでコスト見積もりを確認してください。使用後は`azd down`を実行して継続的なコストを回避してください。

### ローカルでの例の実行

1. **例をクローンまたはコピー**
   ```bash
   # 希望する例に移動します
   cd examples/simple-web-app
   ```

2. **AZD環境を初期化**
   ```bash
   # 既存のテンプレートで初期化する
   azd init
   
   # または新しい環境を作成する
   azd env new my-environment
   ```

3. **環境を構成**
   ```bash
   # 必要な変数を設定する
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **デプロイ**
   ```bash
   # インフラストラクチャとアプリケーションをデプロイする
   azd up
   ```

5. **デプロイを確認**
   ```bash
   # サービスエンドポイントを取得する
   azd env get-values
   
   # エンドポイントをテストする（例）
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **成功の指標:**
   - ✅ `azd up`がエラーなく完了
   - ✅ サービスエンドポイントがHTTP 200を返す
   - ✅ Azureポータルで「Running」ステータスが表示される
   - ✅ Application Insightsがテレメトリを受信

> **⚠️ 問題発生時:** デプロイトラブルシューティングについては[一般的な問題](../docs/troubleshooting/common-issues.md)を参照してください

### 例の適応

各例には以下が含まれます:
- **README.md** - 詳細なセットアップとカスタマイズ手順
- **azure.yaml** - コメント付きのAZD構成
- **infra/** - パラメータ説明付きのBicepテンプレート
- **src/** - サンプルアプリケーションコード
- **scripts/** - 共通タスク用のヘルパースクリプト

## 🎯 学習目標

### 例のカテゴリ

#### **基本的なデプロイ**
- 単一サービスアプリケーション
- シンプルなインフラストラクチャパターン
- 基本的な構成管理
- コスト効率の良い開発セットアップ

#### **高度なシナリオ**
- マルチサービスアーキテクチャ
- 複雑なネットワーク構成
- データベース統合パターン
- セキュリティとコンプライアンスの実装

#### **プロダクション対応パターン**
- 高可用性構成
- モニタリングと可観測性
- CI/CD統合
- 災害復旧セットアップ

## 📖 例の説明

### シンプルなWebアプリ - Node.js Express
**技術**: Node.js、Express、MongoDB、コンテナーアプリ  
**複雑度**: 初級  
**コンセプト**: 基本的なデプロイ、REST API、NoSQLデータベース統合

### 静的ウェブサイト - React SPA
**技術**: React、Azure Static Web Apps、Azure Functions、Cosmos DB  
**複雑度**: 初級  
**コンセプト**: 静的ホスティング、サーバーレスバックエンド、モダンウェブ開発

### コンテナーアプリ - Python Flask
**技術**: Python Flask、Docker、コンテナーアプリ、コンテナーレジストリ、Application Insights  
**複雑度**: 初級  
**コンセプト**: コンテナ化、REST API、スケールゼロ、ヘルスプローブ、モニタリング  
**場所**: [ローカル例](../../../examples/container-app/simple-flask-api)

### コンテナーアプリ - マイクロサービスアーキテクチャ
**技術**: Python、Node.js、C#、Go、Service Bus、Cosmos DB、Azure SQL、コンテナーアプリ  
**複雑度**: 高度  
**コンセプト**: マルチサービスアーキテクチャ、サービス間通信、メッセージキューイング、分散トレーシング  
**場所**: [ローカル例](../../../examples/container-app/microservices)

### データベースアプリ - C#とAzure SQL
**技術**: C# ASP.NET Core、Azure SQL Database、App Service  
**複雑度**: 中級  
**コンセプト**: Entity Framework、データベース接続、Web API開発

### サーバーレス関数 - Python Azure Functions
**技術**: Python、Azure Functions、Cosmos DB、Static Web Apps  
**複雑度**: 中級  
**コンセプト**: イベント駆動型アーキテクチャ、サーバーレスコンピューティング、フルスタック開発

### マイクロサービス - Java Spring Boot
**技術**: Java Spring Boot、コンテナーアプリ、Service Bus、API Gateway  
**複雑度**: 中級  
**コンセプト**: マイクロサービス通信、分散システム、エンタープライズパターン

### Azure AI Foundryの例

#### Azure OpenAIチャットアプリ
**技術**: Azure OpenAI、Cognitive Search、App Service  
**複雑度**: 中級  
**コンセプト**: RAGアーキテクチャ、ベクトル検索、LLM統合

#### AIドキュメント処理
**技術**: Azure AI Document Intelligence、Storage、Functions  
**複雑度**: 中級  
**コンセプト**: ドキュメント分析、OCR、データ抽出

#### 機械学習パイプライン
**技術**: Azure ML、MLOps、コンテナーレジストリ  
**複雑度**: 高度  
**コンセプト**: モデルトレーニング、デプロイメントパイプライン、モニタリング

## 🛠 構成例

`configurations/`ディレクトリには再利用可能なコンポーネントが含まれています:

### 環境構成
- 開発環境設定
- ステージング環境構成
- プロダクション対応構成
- マルチリージョンデプロイメントセットアップ

### Bicepモジュール
- 再利用可能なインフラストラクチャコンポーネント
- 共通リソースパターン
- セキュリティ強化テンプレート
- コスト最適化構成

### ヘルパースクリプト
- 環境セットアップの自動化
- データベース移行スクリプト
- デプロイメント検証ツール
- コストモニタリングユーティリティ

## 🔧 カスタマイズガイド

### 例をユースケースに適応する方法

1. **前提条件を確認**
   - Azureサービス要件を確認
   - サブスクリプション制限を確認
   - コストの影響を理解

2. **構成を変更**
   - `azure.yaml`サービス定義を更新
   - Bicepテンプレートをカスタマイズ
   - 環境変数を調整

3. **徹底的にテスト**
   - まず開発環境にデプロイ
   - 機能を検証
   - スケーリングとパフォーマンスをテスト

4. **セキュリティレビュー**
   - アクセス制御を確認
   - シークレット管理を実装
   - モニタリングとアラートを有効化

## 📊 比較マトリックス

| 例 | サービス | データベース | 認証 | モニタリング | 複雑度 |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAIチャット** (ローカル) | 2 | ❌ | Key Vault | フル | ⭐⭐ |
| **Python Flask API** (ローカル) | 1 | ❌ | 基本 | フル | ⭐ |
| **マイクロサービス** (ローカル) | 5+ | ✅ | エンタープライズ | 高度 | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | 基本 | 基本 | ⭐ |
| React SPA + Functions | 3 | ✅ | 基本 | フル | ⭐ |
| Python Flaskコンテナー | 2 | ❌ | 基本 | フル | ⭐ |
| C# Web API + SQL | 2 | ✅ | フル | フル | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | フル | フル | ⭐⭐ |
| Javaマイクロサービス | 5+ | ✅ | フル | フル | ⭐⭐ |
| Azure OpenAIチャット | 3 | ✅ | フル | フル | ⭐⭐⭐ |
| AIドキュメント処理 | 2 | ❌ | 基本 | フル | ⭐⭐ |
| MLパイプライン | 4+ | ✅ | フル | フル | ⭐⭐⭐⭐ |
| **小売マルチエージェント** (ローカル) | **8+** | **✅** | **エンタープライズ** | **高度** | **⭐⭐⭐⭐** |

## 🎓 学習パス

### 推奨進行順序

1. **シンプルなWebアプリから始める**
   - 基本的なAZD概念を学ぶ
   - デプロイワークフローを理解する
   - 環境管理を練習する

2. **静的ウェブサイトを試す**
   - 異なるホスティングオプションを探る
   - CDN統合を学ぶ
   - DNS構成を理解する

3. **コンテナーアプリに進む**
   - コンテナ化の基本を学ぶ
   - スケーリングの概念を理解する
   - Dockerを練習する

4. **データベース統合を追加する**
   - データベースプロビジョニングを学ぶ
   - 接続文字列を理解する
   - シークレット管理を練習する

5. **サーバーレスを探る**
   - イベント駆動型アーキテクチャを理解する
   - トリガーとバインディングを学ぶ
   - APIを練習する

6. **マイクロサービスを構築する**
   - サービス間通信を学ぶ
   - 分散システムを理解する
   - 複雑なデプロイを練習する

## 🔍 適切な例の見つけ方

### 技術スタック別
- **コンテナーアプリ**: [Python Flask API (ローカル)](../../../examples/container-app/simple-flask-api)、[マイクロサービス (ローカル)](../../../examples/container-app/microservices)、Javaマイクロサービス
- **Node.js**: Node.js Express Todo App、[マイクロサービスAPI Gateway (ローカル)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (ローカル)](../../../examples/container-app/simple-flask-api)、[マイクロサービス製品サービス (ローカル)](../../../examples/container-app/microservices)、Python Functions + SPA
- **C#**: [マイクロサービス注文サービス (ローカル)](../../../examples/container-app/microservices)、C# Web API + SQL Database、Azure OpenAIチャットアプリ、MLパイプライン
- **Go**: [マイクロサービスユーザーサービス (ローカル)](../../../examples/container-app/microservices)
- **Java**: Java Spring Bootマイクロサービス
- **React**: React SPA + Functions
- **コンテナー**: [Python Flask (ローカル)](../../../examples/container-app/simple-flask-api)、[マイクロサービス (ローカル)](../../../examples/container-app/microservices)、Javaマイクロサービス
- **データベース**: [マイクロサービス (ローカル)](../../../examples/container-app/microservices)、Node.js + MongoDB、C# + Azure SQL、Python + Cosmos DB
- **AI/ML**: **[Azure OpenAIチャット (ローカル)](../../../examples/azure-openai-chat)**、Azure OpenAIチャットアプリ、AIドキュメント処理、MLパイプライン、**小売マルチエージェントソリューション**
- **マルチエージェントシステム**: **小売マルチエージェントソリューション**
- **OpenAI統合**: **[Azure OpenAIチャット (ローカル)](../../../examples/azure-openai-chat)**、小売マルチエージェントソリューション
- **エンタープライズプロダクション**: [マイクロサービス (ローカル)](../../../examples/container-app/microservices)、**小売マルチエージェントソリューション**

### アーキテクチャパターン別
- **シンプルなREST API**: [Python Flask API (ローカル)](../../../examples/container-app/simple-flask-api)
- **モノリシック**: Node.js Express Todo、C# Web API + SQL
- **静的 + サーバーレス**: React SPA + Functions、Python Functions + SPA
- **マイクロサービス**: [プロダクションマイクロサービス (ローカル)](../../../examples/container-app/microservices)、Java Spring Bootマイクロサービス
- **コンテナ化**: [Python Flask (ローカル)](../../../examples/container-app/simple-flask-api)、[マイクロサービス (ローカル)](../../../examples/container-app/microservices)
- **AI対応**: **[Azure OpenAIチャット (ローカル)](../../../examples/azure-openai-chat)**、Azure OpenAIチャットアプリ、AIドキュメント処理、MLパイプライン、**小売マルチエージェントソリューション**
- **マルチエージェントアーキテクチャ**: **小売マルチエージェントソリューション**
- **エンタープライズマルチサービス**: [マイクロサービス (ローカル)](../../../examples/container-app/microservices)、**小売マルチエージェントソリューション**

### 複雑度レベル別
- **初級**: [Python Flask API (ローカル)](../../../examples/container-app/simple-flask-api)、Node.js Express Todo、React SPA + Functions
- **中級**: **[Azure OpenAIチャット (ローカル)](../../../examples/azure-openai-chat)**、C# Web API + SQL、Python Functions + SPA、Javaマイクロサービス、Azure OpenAIチャットアプリ、AIドキュメント処理
- **高度**: MLパイプライン
- **エンタープライズプロダクション対応**: [マイクロサービス (ローカル)](../../../examples/container-app/microservices) (メッセージキューイングを含むマルチサービス)、**小売マルチエージェントソリューション** (ARMテンプレートデプロイメントを含む完全なマルチエージェントシステム)

## 📚 追加リソース

### ドキュメントリンク
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicepドキュメント](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azureアーキテクチャセンター](https://learn.microsoft.com/en-us/azure/architecture/)

### コミュニティ例
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [C#とAzure SQLを使用したTodoアプリ](https://github.com/Azure
- [Node.jsとPostgreSQLを使ったTodoアプリ](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [C# APIを使ったReact Webアプリ](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Appsジョブ](https://github.com/Azure-Samples/container-apps-jobs)
- [Javaを使ったAzure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### ベストプラクティス
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 サンプルの貢献

役立つサンプルを共有したいですか？貢献を歓迎します！

### 提出ガイドライン
1. 既存のディレクトリ構造に従う
2. 詳細なREADME.mdを含める
3. 設定ファイルにコメントを追加する
4. 提出前に徹底的にテストする
5. コスト見積もりと前提条件を含める

### サンプルテンプレート構造
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

**プロのヒント**: 自分の技術スタックに合った最もシンプルなサンプルから始め、徐々により複雑なシナリオに進んでください。各サンプルは前のサンプルの概念を基に構築されています！

## 🚀 始める準備はできましたか？

### 学習パス

1. **完全な初心者ですか？** → [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20分) から始めましょう
2. **基本的なAZDの知識がありますか？** → [マイクロサービス](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60分) に挑戦
3. **AIアプリを構築中ですか？** → [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35分) から始めるか、[小売マルチエージェント](retail-scenario.md) (⭐⭐⭐⭐, 2時間以上) を探索
4. **特定の技術スタックが必要ですか？** → [適切なサンプルの見つけ方](../../../examples) セクションを参照

### 次のステップ

- ✅ [前提条件](../../../examples) を確認
- ✅ 自分のスキルレベルに合ったサンプルを選択 ([複雑さの評価基準](../../../examples) を参照)
- ✅ サンプルのREADMEをデプロイ前にしっかり読む
- ✅ テスト後に `azd down` を実行するリマインダーを設定
- ✅ GitHub IssuesやDiscussionsで体験を共有

### サポートが必要ですか？

- 📖 [FAQ](../resources/faq.md) - よくある質問への回答
- 🐛 [トラブルシューティングガイド](../docs/troubleshooting/common-issues.md) - デプロイの問題を解決
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - コミュニティに質問
- 📚 [学習ガイド](../resources/study-guide.md) - 学習を強化

---

**ナビゲーション**
- **📚 コースホーム**: [AZD For Beginners](../README.md)
- **📖 学習資料**: [学習ガイド](../resources/study-guide.md) | [チートシート](../resources/cheat-sheet.md) | [用語集](../resources/glossary.md)
- **🔧 リソース**: [FAQ](../resources/faq.md) | [トラブルシューティング](../docs/troubleshooting/common-issues.md)

---

*最終更新日: 2025年11月 | [問題を報告](https://github.com/microsoft/AZD-for-beginners/issues) | [サンプルを貢献](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:  
この文書は、AI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性を期しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があります。原文（元の言語で記載された文書）を公式な情報源としてご参照ください。重要な情報については、専門の人間による翻訳をお勧めします。本翻訳の使用に起因する誤解や誤認について、当方は一切の責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->