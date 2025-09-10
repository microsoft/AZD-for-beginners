<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e45896a8acbafead1f195788780a4ab7",
  "translation_date": "2025-09-10T16:02:41+00:00",
  "source_file": "examples/README.md",
  "language_code": "ja"
}
-->
# 実例 - 実践的なAZDテンプレートと設定

## はじめに

このディレクトリには、Azure Developer CLIを実践的に学ぶための実例、テンプレート、現実的なシナリオが含まれています。各例では、さまざまなアプリケーションアーキテクチャやデプロイメントパターンに対応した完全な動作コード、インフラテンプレート、詳細な手順を提供しています。

## 学習目標

これらの例を通じて、以下を学ぶことができます：
- 現実的なアプリケーションシナリオを通じたAzure Developer CLIのワークフローの練習
- さまざまなアプリケーションアーキテクチャとそのAZD実装の理解
- Azureサービス向けのInfrastructure as Codeパターンの習得
- 設定管理と環境固有のデプロイメント戦略の適用
- 実践的な文脈での監視、セキュリティ、スケーリングパターンの実装
- 実際のデプロイメントシナリオでのトラブルシューティングとデバッグの経験を積む

## 学習成果

これらの例を完了すると、以下ができるようになります：
- Azure Developer CLIを使用してさまざまなアプリケーションタイプを自信を持ってデプロイ
- 提供されたテンプレートを自身のアプリケーション要件に適応
- Bicepを使用してカスタムインフラパターンを設計・実装
- 適切な依存関係を持つ複雑なマルチサービスアプリケーションを設定
- 実際のシナリオでセキュリティ、監視、パフォーマンスのベストプラクティスを適用
- 実践的な経験に基づいてデプロイメントをトラブルシュートおよび最適化

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

### 初心者向け
1. **[シンプルなWebアプリ - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - MongoDBを使用したNode.js Express Webアプリケーションのデプロイ
2. **[静的ウェブサイト - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Azure Static Web Appsを使用したReact静的ウェブサイトのホスティング
3. **[コンテナアプリ - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - コンテナ化されたPython Flaskアプリケーションのデプロイ

### 中級者向け
4. **[データベースアプリ - C#とAzure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - C# APIとAzure SQLデータベースを使用したWebアプリケーション
5. **[サーバーレス関数 - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - HTTPトリガーとCosmos DBを使用したPython Azure Functions
6. **[マイクロサービス - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Container AppsとAPIゲートウェイを使用したマルチサービスJavaアプリケーション

### Azure AI Foundryテンプレート

1. **[Azure OpenAIチャットアプリ](https://github.com/Azure-Samples/azure-search-openai-demo)** - Azure OpenAIを使用したインテリジェントチャットアプリケーション
2. **[AIドキュメント処理](https://github.com/Azure-Samples/azure-ai-document-processing)** - Azure AIサービスを使用したドキュメント分析
3. **[機械学習パイプライン](https://github.com/Azure-Samples/mlops-v2)** - Azure Machine Learningを使用したMLOpsワークフロー

## 📋 使用手順

### ローカルでの例の実行

1. **例をクローンまたはコピー**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **AZD環境を初期化**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **環境を設定**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **デプロイ**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### 例の適応

各例には以下が含まれます：
- **README.md** - 詳細なセットアップとカスタマイズ手順
- **azure.yaml** - コメント付きのAZD設定
- **infra/** - パラメータの説明付きBicepテンプレート
- **src/** - サンプルアプリケーションコード
- **scripts/** - 共通タスク用のヘルパースクリプト

## 🎯 学習目標

### 例のカテゴリ

#### **基本的なデプロイ**
- 単一サービスアプリケーション
- シンプルなインフラパターン
- 基本的な設定管理
- コスト効率の高い開発セットアップ

#### **高度なシナリオ**
- マルチサービスアーキテクチャ
- 複雑なネットワーク構成
- データベース統合パターン
- セキュリティとコンプライアンスの実装

#### **本番対応パターン**
- 高可用性構成
- 監視と可観測性
- CI/CD統合
- 災害復旧セットアップ

## 📖 例の説明

### シンプルなWebアプリ - Node.js Express
**技術**: Node.js, Express, MongoDB, Container Apps  
**複雑さ**: 初心者向け  
**コンセプト**: 基本的なデプロイ、REST API、NoSQLデータベース統合

### 静的ウェブサイト - React SPA
**技術**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**複雑さ**: 初心者向け  
**コンセプト**: 静的ホスティング、サーバーレスバックエンド、モダンなウェブ開発

### コンテナアプリ - Python Flask
**技術**: Python Flask, Docker, Container Apps, Container Registry  
**複雑さ**: 初心者向け  
**コンセプト**: コンテナ化、マイクロサービスアーキテクチャ、API開発

### データベースアプリ - C#とAzure SQL
**技術**: C# ASP.NET Core, Azure SQL Database, App Service  
**複雑さ**: 中級者向け  
**コンセプト**: Entity Framework、データベース接続、Web API開発

### サーバーレス関数 - Python Azure Functions
**技術**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**複雑さ**: 中級者向け  
**コンセプト**: イベント駆動型アーキテクチャ、サーバーレスコンピューティング、フルスタック開発

### マイクロサービス - Java Spring Boot
**技術**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**複雑さ**: 中級者向け  
**コンセプト**: マイクロサービス通信、分散システム、エンタープライズパターン

### Azure AI Foundryの例

#### Azure OpenAIチャットアプリ
**技術**: Azure OpenAI, Cognitive Search, App Service  
**複雑さ**: 中級者向け  
**コンセプト**: RAGアーキテクチャ、ベクトル検索、LLM統合

#### AIドキュメント処理
**技術**: Azure AI Document Intelligence, Storage, Functions  
**複雑さ**: 中級者向け  
**コンセプト**: ドキュメント分析、OCR、データ抽出

#### 機械学習パイプライン
**技術**: Azure ML, MLOps, Container Registry  
**複雑さ**: 上級者向け  
**コンセプト**: モデルトレーニング、デプロイメントパイプライン、監視

## 🛠 設定例

`configurations/`ディレクトリには再利用可能なコンポーネントが含まれています：

### 環境設定
- 開発環境設定
- ステージング環境設定
- 本番対応設定
- マルチリージョンデプロイメントセットアップ

### Bicepモジュール
- 再利用可能なインフラコンポーネント
- 共通リソースパターン
- セキュリティ強化テンプレート
- コスト最適化設定

### ヘルパースクリプト
- 環境セットアップの自動化
- データベース移行スクリプト
- デプロイメント検証ツール
- コスト監視ユーティリティ

## 🔧 カスタマイズガイド

### 自分のユースケースに例を適応

1. **前提条件を確認**
   - 必要なAzureサービスを確認
   - サブスクリプションの制限を確認
   - コストの影響を理解

2. **設定を変更**
   - `azure.yaml`のサービス定義を更新
   - Bicepテンプレートをカスタマイズ
   - 環境変数を調整

3. **徹底的にテスト**
   - まず開発環境にデプロイ
   - 機能を検証
   - スケーリングとパフォーマンスをテスト

4. **セキュリティレビュー**
   - アクセス制御を確認
   - シークレット管理を実装
   - 監視とアラートを有効化

## 📊 比較表

| 例 | サービス | データベース | 認証 | 監視 | 複雑さ |
|----|----------|-------------|------|--------|--------|
| Node.js Express Todo | 2 | ✅ | 基本 | 基本 | ⭐ |
| React SPA + Functions | 3 | ✅ | 基本 | フル | ⭐ |
| Python Flask Container | 2 | ❌ | 基本 | フル | ⭐ |
| C# Web API + SQL | 2 | ✅ | フル | フル | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | フル | フル | ⭐⭐ |
| Java Microservices | 5+ | ✅ | フル | フル | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | フル | フル | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | 基本 | フル | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | フル | フル | ⭐⭐⭐⭐ |

## 🎓 学習パス

### 推奨進行順序

1. **シンプルなWebアプリから始める**
   - 基本的なAZDの概念を学ぶ
   - デプロイメントワークフローを理解
   - 環境管理を練習

2. **静的ウェブサイトを試す**
   - 異なるホスティングオプションを探る
   - CDN統合を学ぶ
   - DNS設定を理解

3. **コンテナアプリに進む**
   - コンテナ化の基本を学ぶ
   - スケーリングの概念を理解
   - Dockerを練習

4. **データベース統合を追加**
   - データベースプロビジョニングを学ぶ
   - 接続文字列を理解
   - シークレット管理を練習

5. **サーバーレスを探る**
   - イベント駆動型アーキテクチャを理解
   - トリガーとバインディングを学ぶ
   - APIを練習

6. **マイクロサービスを構築**
   - サービス間通信を学ぶ
   - 分散システムを理解
   - 複雑なデプロイメントを練習

## 🔍 適切な例の見つけ方

### 技術スタック別
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **コンテナ**: Python Flask Container App, Java Microservices
- **データベース**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### アーキテクチャパターン別
- **モノリシック**: Node.js Express Todo, C# Web API + SQL
- **静的 + サーバーレス**: React SPA + Functions, Python Functions + SPA
- **マイクロサービス**: Java Spring Boot Microservices
- **コンテナ化**: Python Flask Container App
- **AI対応**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### 複雑さレベル別
- **初心者**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **中級者**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **上級者**: ML Pipeline

## 📚 追加リソース

### ドキュメントリンク
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicepドキュメント](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azureアーキテクチャセンター](https://learn.microsoft.com/en-us/azure/architecture/)

### コミュニティ例
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLIギャラリー](https://azure.github.io/awesome-azd/)
- [C#とAzure SQLのTodoアプリ](https://github.com/Azure-Samples/todo-csharp-sql)
- [PythonとMongoDBのTodoアプリ](https://github.com/Azure-Samples/todo-python-mongo)
- [Node.jsとPostgreSQLのTodoアプリ](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [C# APIを使用したReact Webアプリ](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Appsジョブ](https://github.com/Azure-Samples/container-apps-jobs)
- [Javaを使用したAzure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### ベストプラクティス
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [クラウド導入フレームワーク](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 例の貢献

有用な例を共有したいですか？貢献を歓迎します！

### 提出ガイドライン
1. 確立されたディレクトリ構造に従う
2. 包括的なREADME.mdを含める
3. 設定ファイルにコメントを追加
4. 提出前に徹底的にテスト
5. コスト見積もりと前提条件を含める

### 例のテンプレート構造
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

**プロのヒント**: 自分の技術スタックに合った最も簡単な例から始め、徐々により複雑なシナリオに進んでください。各例は前の例の概念を基に構築されています！

**次のステップ**: 
- 自分のスキルレベルに合った例を選ぶ
- 例のREADMEに記載されたセットアップ手順に従う
- カスタマイズを試す
- 学んだことをコミュニティと共有

---

**ナビゲーション**
- **前のレッスン**: [学習ガイド](../resources/study-guide.md)
- **戻る**: [メインREADME](../README.md)

---

**免責事項**:  
この文書はAI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性を追求しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があります。元の言語で記載された文書が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用に起因する誤解や誤解釈について、当社は責任を負いません。