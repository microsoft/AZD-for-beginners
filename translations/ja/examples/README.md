# 例 - 実践的な AZD テンプレートと構成

**例で学ぶ - 章別に整理**  
- **📚 コース ホーム**: [AZD 入門](../README.md)  
- **📖 章のマッピング**: 学習の複雑さ別に整理された例  
- **🚀 ローカル例**: [小売マルチエージェント ソリューション](retail-scenario.md)  
- **🤖 外部のAI例**: Azure Samples リポジトリへのリンク

> **📍 重要: ローカル と 外部 の例の違い**  
> このリポジトリには完全な実装を含む **4つのローカル例** が含まれています:  
> - **Azure OpenAI Chat**（チャットインターフェイス付きの GPT-4 デプロイ）  
> - **Container Apps**（シンプルな Flask API + マイクロサービス）  
> - **Database App**（Web + SQL データベース）  
> - **Retail Multi-Agent**（エンタープライズ向け AI ソリューション）  
>  
> 追加の例はクローンできる Azure-Samples リポジトリへの **外部参照** です。

## はじめに

このディレクトリは、ハンズオンで Azure Developer CLI を学ぶための実践的な例と参照資料を提供します。小売マルチエージェントのシナリオは、本リポジトリに含まれる本番対応の完全な実装です。追加の例は、さまざまな AZD パターンを示す公式の Azure Samples を参照しています。

### 複雑さ評価の凡例

- ⭐ **初心者** - 基本概念、単一サービス、15～30分  
- ⭐⭐ **中級** - 複数サービス、データベース統合、30～60分  
- ⭐⭐⭐ **上級** - 複雑なアーキテクチャ、AI 統合、1～2時間  
- ⭐⭐⭐⭐ **エキスパート** - 本番対応、企業向けパターン、2時間以上

## 🎯 このリポジトリに実際に含まれるもの

### ✅ ローカル実装（すぐに使える）

#### [Azure OpenAI Chat Application](azure-openai-chat/README.md) 🆕
**このリポジトリに含まれるチャットインターフェイス付きの完全な GPT-4 デプロイ**

- **場所:** `examples/azure-openai-chat/`  
- **複雑さ:** ⭐⭐（中級）  
- **含まれるもの:**
  - 完全な Azure OpenAI デプロイ（GPT-4）  
  - Python コマンドラインチャットインターフェイス  
  - API キーを安全に保管するための Key Vault 統合  
  - Bicep によるインフラテンプレート  
  - トークン使用量とコストの追跡  
  - レート制限とエラー処理  

**クイックスタート：**  
```bash
# 例に移動
cd examples/azure-openai-chat

# すべてをデプロイ
azd up

# 依存関係をインストールしてチャットを開始する
pip install -r src/requirements.txt
python src/chat.py
```
  
**テクノロジー:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [コンテナアプリの例](container-app/README.md) 🆕
**このリポジトリに含まれる包括的なコンテナデプロイ例**

- **場所:** `examples/container-app/`  
- **複雑さ:** ⭐-⭐⭐⭐⭐（初級〜上級）  
- **含まれるもの:**
  - [マスターガイド](container-app/README.md) - コンテナデプロイの完全な概要  
  - [シンプル Flask API](../../../examples/container-app/simple-flask-api) - 基本的な REST API の例  
  - [マイクロサービスアーキテクチャ](../../../examples/container-app/microservices) - 本番対応のマルチサービスデプロイ  
  - クイックスタート、プロダクション、上級パターン  
  - 監視、セキュリティ、コスト最適化  

**クイックスタート：**  
```bash
# マスターガイドを表示
cd examples/container-app

# シンプルな Flask API をデプロイする
cd simple-flask-api
azd up

# マイクロサービスの例をデプロイする
cd ../microservices
azd up
```
  
**テクノロジー:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [小売マルチエージェント ソリューション](retail-scenario.md) 🆕
**このリポジトリに含まれる本番対応の完全な実装**

- **場所:** `examples/retail-multiagent-arm-template/`  
- **複雑さ:** ⭐⭐⭐⭐（上級）  
- **含まれるもの:**
  - 完全な ARM デプロイテンプレート  
  - マルチエージェントアーキテクチャ（カスタマー＋在庫）  
  - Azure OpenAI 統合  
  - RAG を用いた AI Search  
  - 包括的な監視  
  - ワンクリックデプロイスクリプト  

**クイックスタート：**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**テクノロジー:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 外部 Azure Samples（クローンして使用）

以下の例は公式の Azure-Samples リポジトリで管理されています。これらをクローンして、さまざまな AZD パターンを確認してください：

### シンプルアプリケーション（チャプター 1-2）

| テンプレート | リポジトリ | 複雑さ | サービス |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [ローカル: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [ローカル: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | マルチサービス、Service Bus、Cosmos DB、SQL |
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


### AI アプリケーションの例（チャプター 2、5、8）

| テンプレート | リポジトリ | 複雑さ | フォーカス |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [ローカル: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 デプロイ |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | 基本的な AI チャット |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | エージェントフレームワーク |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG パターン |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | エンタープライズ AI |

### データベースと高度なパターン（チャプター 3-8）

| テンプレート | リポジトリ | 複雑さ | フォーカス |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | データベース統合 |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL サーバーレス |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | マルチサービス |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## 学習目標

これらの例を通じて、あなたは次のことを実践できます：
- 現実的なアプリケーションシナリオで Azure Developer CLI のワークフローを実践する  
- さまざまなアプリケーションアーキテクチャとそれらの azd 実装を理解する  
- さまざまな Azure サービスに対する Infrastructure as Code（IaC）パターンを習得する  
- 構成管理と環境固有のデプロイ戦略を適用する  
- 実用的なコンテキストで監視、セキュリティ、スケーリングのパターンを実装する  
- 実際のデプロイシナリオのトラブルシューティングとデバッグの経験を積む

## 学習成果

これらの例を完了すると、以下ができるようになります：
- Azure Developer CLI を使用してさまざまなアプリケーションタイプを自信を持ってデプロイできる  
- 提供されたテンプレートを自分のアプリケーション要件に適合させる  
- Bicep を使用してカスタムインフラパターンを設計・実装する  
- 適切な依存関係を持つ複雑なマルチサービスアプリケーションを構成する  
- 実環境でのセキュリティ、監視、パフォーマンスのベストプラクティスを適用する  
- 実践経験に基づいてデプロイをトラブルシュートし最適化する

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

> **💡 AZD に不慣れですか？** 例 #1（Flask API）から始めてください — 所要時間は約20分でコア概念を学べます。

### 初心者向け
1. **[コンテナアプリ - Python Flask API](../../../examples/container-app/simple-flask-api)**（ローカル） ⭐  
   scale-to-zero 機能を備えたシンプルな REST API をデプロイする  
   **所要時間:** 20-25 分 | **コスト:** $0-5/月  
   **学べること:** 基本的な azd ワークフロー、コンテナ化、ヘルスプローブ  
   **期待される成果:** モニタリングを備えた "Hello, World!" を返す動作する API エンドポイント

2. **[シンプル Web アプリ - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB を使った Node.js Express ウェブアプリをデプロイする  
   **所要時間:** 25-35 分 | **コスト:** $10-30/月  
   **学べること:** データベース統合、環境変数、接続文字列  
   **期待される成果:** 作成/読み取り/更新/削除機能を備えた Todo リストアプリ

3. **[静的サイト - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps で React の静的サイトをホストする  
   **所要時間:** 20-30 分 | **コスト:** $0-10/月  
   **学べること:** 静的ホスティング、サーバーレス関数、CDN デプロイ  
   **期待される成果:** API バックエンドを持つ React UI、自動 SSL、グローバル CDN

### 中級者向け
4. **[Azure OpenAI Chat Application](../../../examples/azure-openai-chat)**（ローカル） ⭐⭐  
   チャットインターフェイスと安全な API キー管理を備えた GPT-4 をデプロイする  
   **所要時間:** 35-45 分 | **コスト:** $50-200/月  
   **学べること:** Azure OpenAI のデプロイ、Key Vault 統合、トークン追跡  
   **期待される成果:** GPT-4 とコスト監視を備えた動作するチャットアプリケーション

5. **[コンテナアプリ - マイクロサービス](../../../examples/container-app/microservices)**（ローカル） ⭐⭐⭐⭐  
   本番対応のマルチサービスアーキテクチャ  
   **所要時間:** 45-60 分 | **コスト:** $50-150/月  
   **学べること:** サービス間通信、メッセージキューイング、分散トレーシング  
   **期待される成果:** 監視を備えた 2 サービス構成（API ゲートウェイ + 製品サービス）

6. **[データベースアプリ - C# と Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API と Azure SQL データベースを備えた Web アプリ  
   **所要時間:** 30-45 分 | **コスト:** $20-80/月  
   **学べること:** Entity Framework、データベースマイグレーション、接続のセキュリティ  
   **期待される成果:** Azure SQL をバックエンドにした C# API、スキーマの自動デプロイ

7. **[サーバーレス関数 - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP トリガーと Cosmos DB を備えた Python Azure Functions  
   **所要時間:** 30-40 分 | **コスト:** $10-40/月  
   **学べること:** イベント駆動アーキテクチャ、サーバーレスのスケーリング、NoSQL 統合  
   **期待される成果:** HTTP リクエストに応答し Cosmos DB に保存する Function アプリ

8. **[マイクロサービス - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps と API ゲートウェイを用いたマルチサービスの Java アプリケーション  
   **所要時間:** 60-90 分 | **コスト:** $80-200/月  
   **学べること:** Spring Boot のデプロイ、サービスメッシュ、ロードバランシング  
   **期待される成果:** サービスディスカバリとルーティングを備えたマルチサービスの Java システム

### Microsoft Foundry テンプレート

1. **[Azure OpenAI Chat App - ローカル例](../../../examples/azure-openai-chat)** ⭐⭐  
   チャットインターフェイス付きの完全な GPT-4 デプロイ  
   **所要時間:** 35-45 分 | **コスト:** $50-200/月  
   **期待される成果:** トークン追跡とコスト監視を備えた動作するチャットアプリケーション

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG アーキテクチャを用いたインテリジェントチャットアプリ  
   **所要時間:** 60-90 分 | **コスト:** $100-300/月  
   **期待される成果:** ドキュメント検索と引用を備えた RAG ベースのチャットインターフェイス

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI サービスを使用したドキュメント解析  
   **所要時間:** 40-60 分 | **コスト:** $20-80/月  
   **期待される成果:** アップロードされたドキュメントからテキスト、表、エンティティを抽出する API

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning を用いた MLOps ワークフロー  
   **所要時間:** 2-3 時間 | **コスト:** $150-500/月  
   **期待される成果:** トレーニング、デプロイ、監視を含む自動化された ML パイプライン

### 実世界のシナリオ

#### **Retail Multi-Agent Solution** 🆕  
**[完全実装ガイド](./retail-scenario.md)**

包括的で本番対応のマルチエージェント顧客サポートソリューションで、AZD を用いたエンタープライズグレードの AI アプリケーションデプロイを示します。このシナリオは次を提供します：

- **完全なアーキテクチャ:** 専用のカスタマーサービスおよび在庫管理エージェントを備えたマルチエージェントシステム
- **本番インフラストラクチャ**: マルチリージョンの Azure OpenAI デプロイ、AI Search、Container Apps、および包括的な監視
- **即時デプロイ可能な ARM テンプレート**: 複数の構成モード（Minimal/Standard/Premium）を備えたワンクリックデプロイ
- **高度な機能**: レッドチーミングによるセキュリティ検証、エージェント評価フレームワーク、コスト最適化、およびトラブルシューティングガイド
- **実ビジネスコンテキスト**: ファイルアップロード、検索統合、動的スケーリングを備えた小売業者のカスタマーサポートユースケース

**Technologies**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (上級 - エンタープライズ本番対応)

**Perfect for**: AI 開発者、ソリューションアーキテクト、および本番のマルチエージェントシステムを構築するチーム

**Quick Start**: 含まれている ARM テンプレートを使用して `./deploy.sh -g myResourceGroup` で 30 分以内に完全なソリューションをデプロイ

## 📋 使用手順

### 前提条件

実行する前に:
- ✅ Azure サブスクリプション（Owner または Contributor 権限）
- ✅ Azure Developer CLI がインストールされている（[インストールガイド](../docs/chapter-01-foundation/installation.md)）
- ✅ Docker Desktop が起動している（コンテナの例用）
- ✅ 適切な Azure クォータ（例固有の要件を確認）

> **💰 コスト警告:** すべての例は課金対象となる実際の Azure リソースを作成します。費用見積りは各 README ファイルを参照してください。作業が完了したら継続的な費用を避けるために `azd down` を実行することを忘れないでください。

### ローカルでの例の実行

1. **例をクローンまたはコピー**
   ```bash
   # 目的の例に移動
   cd examples/simple-web-app
   ```

2. **AZD 環境を初期化**
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

5. **デプロイの確認**
   ```bash
   # サービスのエンドポイントを取得する
   azd env get-values
   
   # エンドポイントをテストする（例）
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **期待される成功指標:**
   - ✅ `azd up` がエラーなく完了する
   - ✅ サービスのエンドポイントが HTTP 200 を返す
   - ✅ Azure Portal が "Running" ステータスを表示する
   - ✅ Application Insights がテレメトリを受信している

> **⚠️ 問題がありますか?** デプロイのトラブルシューティングについては [一般的な問題](../docs/chapter-07-troubleshooting/common-issues.md) を参照してください

### 例の適応

各例には以下が含まれます:
- **README.md** - 詳細なセットアップおよびカスタマイズ手順
- **azure.yaml** - コメント付きの AZD 構成
- **infra/** - パラメーター説明付きの Bicep テンプレート
- **src/** - サンプルアプリケーションコード
- **scripts/** - 一般的なタスク用のヘルパースクリプト

## 🎯 学習目標

### 例のカテゴリ

#### **Basic Deployments**
- 単一サービスアプリケーション
- シンプルなインフラパターン
- 基本的な構成管理
- 低コストの開発セットアップ

#### **Advanced Scenarios**
- マルチサービスアーキテクチャ
- 複雑なネットワーク構成
- データベース統合パターン
- セキュリティとコンプライアンスの実装

#### **Production-Ready Patterns**
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
**Concepts**: 静的ホスティング、サーバーレスバックエンド、モダンなウェブ開発

### Container App - Python Flask
**Technologies**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexity**: 初級  
**Concepts**: コンテナ化、REST API、scale-to-zero、ヘルスプローブ、監視  
**Location**: [ローカルの例](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Technologies**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexity**: 上級  
**Concepts**: マルチサービスアーキテクチャ、サービス間通信、メッセージキューイング、分散トレーシング  
**Location**: [ローカルの例](../../../examples/container-app/microservices)

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

#### Azure OpenAI Chat App
**Technologies**: Azure OpenAI, Cognitive Search, App Service  
**Complexity**: 中級  
**Concepts**: RAG アーキテクチャ、ベクター検索、LLM 統合

#### AI Document Processing
**Technologies**: Azure AI Document Intelligence, Storage, Functions  
**Complexity**: 中級  
**Concepts**: ドキュメント解析、OCR、データ抽出

#### Machine Learning Pipeline
**Technologies**: Azure ML, MLOps, Container Registry  
**Complexity**: 上級  
**Concepts**: モデル訓練、デプロイパイプライン、監視

## 🛠 構成例

`configurations/` ディレクトリには再利用可能なコンポーネントが含まれます:

### 環境構成
- 開発環境設定
- ステージング環境構成
- 本番対応構成
- マルチリージョンデプロイ設定

### Bicep モジュール
- 再利用可能なインフラコンポーネント
- 共通リソースパターン
- セキュリティ強化テンプレート
- コスト最適化構成

### ヘルパースクリプト
- 環境セットアップの自動化
- データベースマイグレーションスクリプト
- デプロイ検証ツール
- コスト監視ユーティリティ

## 🔧 カスタマイズガイド

### 自分のユースケースに合わせた例の適応

1. **前提条件を確認**
   - Azure サービス要件を確認
   - サブスクリプションの制限を検証
   - コストの影響を理解

2. **構成を変更**
   - `azure.yaml` のサービス定義を更新
   - Bicep テンプレートをカスタマイズ
   - 環境変数を調整

3. **十分にテスト**
   - まず開発環境にデプロイ
   - 機能を検証
   - スケーリングとパフォーマンステストを実施

4. **セキュリティレビュー**
   - アクセス制御を確認
   - シークレット管理を実装
   - 監視とアラートを有効化

## 📊 比較マトリクス

| 例 | サービス | データベース | 認証 | 監視 | 複雑さ |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI Chat** (Local) | 2 | ❌ | Key Vault | フル | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | 基本 | フル | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | エンタープライズ | 高度 | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | 基本 | 基本 | ⭐ |
| React SPA + Functions | 3 | ✅ | 基本 | フル | ⭐ |
| Python Flask Container | 2 | ❌ | 基本 | フル | ⭐ |
| C# Web API + SQL | 2 | ✅ | フル | フル | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | フル | フル | ⭐⭐ |
| Java Microservices | 5+ | ✅ | フル | フル | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | フル | フル | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | 基本 | フル | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | フル | フル | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **エンタープライズ** | **高度** | **⭐⭐⭐⭐** |

## 🎓 学習ロードマップ

### 推奨進行順

1. **Simple Web App から始める**
   - 基本的な AZD の概念を学ぶ
   - デプロイワークフローを理解する
   - 環境管理を練習する

2. **Static Website を試す**
   - 異なるホスティングオプションを探る
   - CDN 統合について学ぶ
   - DNS 構成を理解する

3. **Container App へ移行**
   - コンテナ化の基本を学ぶ
   - スケーリングの概念を理解する
   - Docker を使って実践する

4. **データベース統合を追加**
   - データベースのプロビジョニングを学ぶ
   - コネクション文字列を理解する
   - シークレット管理を実践する

5. **サーバーレスを探る**
   - イベント駆動アーキテクチャを理解する
   - トリガーとバインディングについて学ぶ
   - API を用いて実践する

6. **マイクロサービスを構築**
   - サービス間通信を学ぶ
   - 分散システムを理解する
   - 複雑なデプロイを実践する

## 🔍 最適な例の見つけ方

### 技術スタック別
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Local)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Microservices User Service (Local)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### アーキテクチャパターン別
- **Simple REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### 複雑さレベル別
- **Beginner**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermediate**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Advanced**: ML Pipeline
- **Enterprise Production-Ready**: [Microservices (Local)](../../../examples/container-app/microservices)（メッセージキューイングを含むマルチサービス）、**Retail Multi-Agent Solution**（ARM テンプレートデプロイを含む完全なマルチエージェントシステム）

## 📚 追加リソース

### ドキュメントリンク
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### コミュニティの例
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Node.js と PostgreSQL を使用した Todo アプリ](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [C# API を使用した React Web アプリ](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps ジョブ](https://github.com/Azure-Samples/container-apps-jobs)
- [Java を使用した Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### ベストプラクティス
- [Azure の Well-Architected フレームワーク](https://learn.microsoft.com/en-us/azure/well-architected/)
- [クラウド導入フレームワーク](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 サンプルへの貢献

共有したい有用なサンプルがありますか？寄稿を歓迎します！

### 提出ガイドライン
1. 既定のディレクトリ構成に従ってください
2. 詳細な README.md を含めてください
3. 設定ファイルにコメントを追加してください
4. 提出前に十分にテストしてください
5. 費用見積もりと前提条件を含めてください

### サンプルテンプレート構成
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

**プロのコツ**: まずは技術スタックに合った最も簡単なサンプルから始め、徐々により複雑なシナリオに進んでください。各サンプルは前のものの概念を踏まえて構築されています！

## 🚀 始める準備はできましたか？

### 学習パス

1. **完全な初心者ですか？** → まずは [Flask API](../../../examples/container-app/simple-flask-api) から始めましょう (⭐、20分)
2. **AZD の基本知識はありますか？** → [マイクロサービス](../../../examples/container-app/microservices) を試してみてください (⭐⭐⭐⭐、60分)
3. **AI アプリを構築していますか？** → まずは [Azure OpenAI Chat](../../../examples/azure-openai-chat) から始めましょう (⭐⭐、35分) または [Retail Multi-Agent](retail-scenario.md) を試してみてください (⭐⭐⭐⭐、2時間以上)
4. **特定の技術スタックが必要ですか？** → 上記の [適切な例の見つけ方](../../../examples) セクションを参照してください

### 次のステップ

- ✅ 上記の [前提条件](../../../examples) を確認してください
- ✅ 自分のスキルレベルに合ったサンプルを選んでください（[複雑さの凡例](../../../examples) を参照）
- ✅ デプロイ前にサンプルの README をよく読んでください
- ✅ テスト後に `azd down` を実行するリマインダーを設定してください
- ✅ GitHub Issues または Discussions で経験を共有してください

### ヘルプが必要ですか？

- 📖 [FAQ](../resources/faq.md) - よくある質問
- 🐛 [トラブルシューティングガイド](../docs/chapter-07-troubleshooting/common-issues.md) - デプロイの問題を解決する
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - コミュニティに質問する
- 📚 [学習ガイド](../resources/study-guide.md) - 学習を強化する

---

**ナビゲーション**
- **📚 コースホーム**: [AZD For Beginners](../README.md)
- **📖 学習資料**: [学習ガイド](../resources/study-guide.md) | [チートシート](../resources/cheat-sheet.md) | [用語集](../resources/glossary.md)
- **🔧 リソース**: [FAQ](../resources/faq.md) | [トラブルシューティング](../docs/chapter-07-troubleshooting/common-issues.md)

---

*最終更新: 2025年11月 | [問題を報告](https://github.com/microsoft/AZD-for-beginners/issues) | [サンプルを寄稿](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責事項：
本書は AI 翻訳サービス「Co‑op Translator」（https://github.com/Azure/co-op-translator）を用いて翻訳されました。正確性には努めていますが、自動翻訳には誤りや不正確な箇所が含まれる可能性があることにご留意ください。原文（原言語の文書）が権威ある情報源とみなされます。重要な内容については、専門の翻訳者による人間翻訳をお勧めします。本翻訳の利用に起因するいかなる誤解や誤訳についても責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->