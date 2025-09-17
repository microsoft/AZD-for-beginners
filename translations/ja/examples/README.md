<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-17T14:19:31+00:00",
  "source_file": "examples/README.md",
  "language_code": "ja"
}
-->
# 実例 - 実践的なAZDテンプレートと構成

**例を通じて学ぶ - 章ごとに整理**
- **📚 コースホーム**: [AZD初心者向け](../README.md)
- **📖 章のマッピング**: 学習の難易度に応じた例
- **🚀 シンプルに始める**: [第1章の例](../../../examples)
- **🤖 AIの例**: [第2章 & 第5章 AIソリューション](../../../examples)

## はじめに

このディレクトリには、Azure Developer CLIを実践的に学ぶための例、テンプレート、実際のシナリオが含まれています。各例は、完全な動作コード、インフラテンプレート、詳細な指示を提供し、さまざまなアプリケーションアーキテクチャやデプロイメントパターンを学ぶことができます。

## 学習目標

これらの例を通じて、以下を学ぶことができます:
- 実際のアプリケーションシナリオを使用したAzure Developer CLIのワークフローを練習
- さまざまなアプリケーションアーキテクチャとそのAZD実装を理解
- Azureサービス向けのInfrastructure as Codeパターンを習得
- 環境固有のデプロイメント戦略と構成管理を適用
- 実践的な文脈での監視、セキュリティ、スケーリングパターンを実装
- 実際のデプロイメントシナリオでのトラブルシューティングとデバッグの経験を構築

## 学習成果

これらの例を完了すると、以下ができるようになります:
- Azure Developer CLIを使用してさまざまなアプリケーションタイプを自信を持ってデプロイ
- 提供されたテンプレートを自分のアプリケーション要件に適応
- Bicepを使用してカスタムインフラパターンを設計・実装
- 適切な依存関係を持つ複雑なマルチサービスアプリケーションを構成
- 実際のシナリオでセキュリティ、監視、パフォーマンスのベストプラクティスを適用
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

### 初心者向け
1. **[シンプルなWebアプリ - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - MongoDBを使用したNode.js Express Webアプリケーションをデプロイ
2. **[静的ウェブサイト - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Azure Static Web AppsでReact静的ウェブサイトをホスト
3. **[コンテナアプリ - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - コンテナ化されたPython Flaskアプリケーションをデプロイ

### 中級者向け
4. **[データベースアプリ - C#とAzure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - C# APIとAzure SQLデータベースを使用したWebアプリケーション
5. **[サーバーレス関数 - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - HTTPトリガーとCosmos DBを使用したPython Azure Functions
6. **[マイクロサービス - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Container AppsとAPIゲートウェイを使用したマルチサービスJavaアプリケーション

### Azure AI Foundryテンプレート

1. **[Azure OpenAIチャットアプリ](https://github.com/Azure-Samples/azure-search-openai-demo)** - Azure OpenAIを使用したインテリジェントチャットアプリケーション
2. **[AIドキュメント処理](https://github.com/Azure-Samples/azure-ai-document-processing)** - Azure AIサービスを使用したドキュメント分析
3. **[機械学習パイプライン](https://github.com/Azure-Samples/mlops-v2)** - Azure Machine Learningを使用したMLOpsワークフロー

### 実際のシナリオ

#### **小売業向けマルチエージェントソリューション** 🆕
**[完全な実装ガイド](./retail-scenario.md)**

AZDを使用したエンタープライズグレードのAIアプリケーションデプロイメントを示す包括的な、実運用対応のマルチエージェント顧客サポートソリューション。このシナリオには以下が含まれます:

- **完全なアーキテクチャ**: 専門的な顧客サービスおよび在庫管理エージェントを備えたマルチエージェントシステム
- **運用インフラ**: マルチリージョンAzure OpenAIデプロイメント、AI検索、コンテナアプリ、包括的な監視
- **即時デプロイ可能なARMテンプレート**: 複数の構成モード（最小/標準/プレミアム）でのワンクリックデプロイメント
- **高度な機能**: レッドチーミングセキュリティ検証、エージェント評価フレームワーク、コスト最適化、トラブルシューティングガイド
- **実際のビジネスコンテキスト**: ファイルアップロード、検索統合、動的スケーリングを備えた小売業者の顧客サポートユースケース

**技術**: Azure OpenAI (GPT-4o, GPT-4o-mini)、Azure AI Search、Container Apps、Cosmos DB、Application Insights、Document Intelligence、Bing Search API

**複雑度**: ⭐⭐⭐⭐ (高度 - エンタープライズ運用対応)

**対象**: AI開発者、ソリューションアーキテクト、運用マルチエージェントシステムを構築するチーム

**クイックスタート**: ARMテンプレートを使用して30分以内に完全なソリューションをデプロイ `./deploy.sh -g myResourceGroup`

## 📋 使用方法

### ローカルで例を実行する

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

3. **環境を構成**
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

各例には以下が含まれます:
- **README.md** - 詳細なセットアップとカスタマイズ手順
- **azure.yaml** - コメント付きのAZD構成
- **infra/** - パラメータの説明付きBicepテンプレート
- **src/** - サンプルアプリケーションコード
- **scripts/** - 共通タスク用のヘルパースクリプト

## 🎯 学習目標

### 例のカテゴリ

#### **基本的なデプロイメント**
- 単一サービスアプリケーション
- シンプルなインフラパターン
- 基本的な構成管理
- コスト効率の良い開発セットアップ

#### **高度なシナリオ**
- マルチサービスアーキテクチャ
- 複雑なネットワーク構成
- データベース統合パターン
- セキュリティとコンプライアンスの実装

#### **運用対応パターン**
- 高可用性構成
- 監視と可観測性
- CI/CD統合
- 災害復旧セットアップ

## 📖 例の説明

### シンプルなWebアプリ - Node.js Express
**技術**: Node.js、Express、MongoDB、Container Apps  
**複雑度**: 初心者  
**コンセプト**: 基本的なデプロイメント、REST API、NoSQLデータベース統合

### 静的ウェブサイト - React SPA
**技術**: React、Azure Static Web Apps、Azure Functions、Cosmos DB  
**複雑度**: 初心者  
**コンセプト**: 静的ホスティング、サーバーレスバックエンド、モダンなウェブ開発

### コンテナアプリ - Python Flask
**技術**: Python Flask、Docker、Container Apps、Container Registry  
**複雑度**: 初心者  
**コンセプト**: コンテナ化、マイクロサービスアーキテクチャ、API開発

### データベースアプリ - C#とAzure SQL
**技術**: C# ASP.NET Core、Azure SQL Database、App Service  
**複雑度**: 中級者  
**コンセプト**: Entity Framework、データベース接続、Web API開発

### サーバーレス関数 - Python Azure Functions
**技術**: Python、Azure Functions、Cosmos DB、Static Web Apps  
**複雑度**: 中級者  
**コンセプト**: イベント駆動型アーキテクチャ、サーバーレスコンピューティング、フルスタック開発

### マイクロサービス - Java Spring Boot
**技術**: Java Spring Boot、Container Apps、Service Bus、API Gateway  
**複雑度**: 中級者  
**コンセプト**: マイクロサービス通信、分散システム、エンタープライズパターン

### Azure AI Foundryの例

#### Azure OpenAIチャットアプリ
**技術**: Azure OpenAI、Cognitive Search、App Service  
**複雑度**: 中級者  
**コンセプト**: RAGアーキテクチャ、ベクトル検索、LLM統合

#### AIドキュメント処理
**技術**: Azure AI Document Intelligence、Storage、Functions  
**複雑度**: 中級者  
**コンセプト**: ドキュメント分析、OCR、データ抽出

#### 機械学習パイプライン
**技術**: Azure ML、MLOps、Container Registry  
**複雑度**: 高度  
**コンセプト**: モデルトレーニング、デプロイメントパイプライン、監視

## 🛠 構成例

`configurations/`ディレクトリには再利用可能なコンポーネントが含まれています:

### 環境構成
- 開発環境設定
- ステージング環境構成
- 運用対応構成
- マルチリージョンデプロイメントセットアップ

### Bicepモジュール
- 再利用可能なインフラコンポーネント
- 共通リソースパターン
- セキュリティ強化テンプレート
- コスト最適化構成

### ヘルパースクリプト
- 環境セットアップの自動化
- データベース移行スクリプト
- デプロイメント検証ツール
- コスト監視ユーティリティ

## 🔧 カスタマイズガイド

### 自分のユースケースに例を適応する

1. **前提条件を確認**
   - Azureサービスの要件を確認
   - サブスクリプションの制限を確認
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
   - 監視とアラートを有効化

## 📊 比較マトリックス

| 例 | サービス | データベース | 認証 | 監視 | 複雑度 |
|----|----------|-------------|------|-------|--------|
| Node.js Express Todo | 2 | ✅ | 基本 | 基本 | ⭐ |
| React SPA + Functions | 3 | ✅ | 基本 | フル | ⭐ |
| Python Flask Container | 2 | ❌ | 基本 | フル | ⭐ |
| C# Web API + SQL | 2 | ✅ | フル | フル | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | フル | フル | ⭐⭐ |
| Java Microservices | 5+ | ✅ | フル | フル | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | フル | フル | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | 基本 | フル | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | フル | フル | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** | **8+** | **✅** | **エンタープライズ** | **高度** | **⭐⭐⭐⭐** |

## 🎓 学習パス

### 推奨進行順序

1. **シンプルなWebアプリから始める**
   - 基本的なAZD概念を学ぶ
   - デプロイメントワークフローを理解
   - 環境管理を練習

2. **静的ウェブサイトを試す**
   - 異なるホスティングオプションを探る
   - CDN統合を学ぶ
   - DNS構成を理解

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
   - サービス通信を学ぶ
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
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **マルチエージェントシステム**: **Retail Multi-Agent Solution**
- **エンタープライズ運用**: **Retail Multi-Agent Solution**

### アーキテクチャパターン別
- **モノリシック**: Node.js Express Todo, C# Web API + SQL
- **静的 + サーバーレス**: React SPA + Functions, Python Functions + SPA
- **マイクロサービス**: Java Spring Boot Microservices
- **コンテナ化**: Python Flask Container App
- **AI対応**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **マルチエージェントアーキテクチャ**: **Retail Multi-Agent Solution**
- **エンタープライズマルチサービス**: **Retail Multi-Agent Solution**

### 複雑度レベル別
- **初心者**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **中級者**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **高度**: ML Pipeline
- **エンタープライズ運用対応**: **Retail Multi-Agent Solution** (ARMテンプレートデプロイメントを含む完全なマルチエージェントシステム)

## 📚 追加リソース

### ドキュメントリンク
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZDテンプレート](https://github.com/Azure/ai-foundry-templates)
- [Bicepドキュメント](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azureアーキテクチャセンター](https://learn.microsoft.com/en-us/azure/architecture/)

### コミュニティ例
- [Azure Samples AZDテンプレート](https://github.com/Azure-S
- [C#とAzure SQLを使ったTodoアプリ](https://github.com/Azure-Samples/todo-csharp-sql)
- [PythonとMongoDBを使ったTodoアプリ](https://github.com/Azure-Samples/todo-python-mongo)
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

**プロのヒント**: 自分の技術スタックに合った最も簡単なサンプルから始め、徐々により複雑なシナリオに進んでください。各サンプルは前のものの概念を基に構築されています！

**次のステップ**: 
- 自分のスキルレベルに合ったサンプルを選ぶ
- サンプルのREADMEに記載されたセットアップ手順に従う
- カスタマイズを試してみる
- コミュニティと学びを共有する

---

**ナビゲーション**
- **前のレッスン**: [学習ガイド](../resources/study-guide.md)
- **戻る**: [メインREADME](../README.md)

---

**免責事項**:  
この文書は、AI翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を追求しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知ください。元の言語で記載された文書が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用に起因する誤解や誤解釈について、当社は責任を負いません。