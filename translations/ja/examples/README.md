<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a24ebb49f185f0864813ce1178a3d8b",
  "translation_date": "2025-09-10T15:06:04+00:00",
  "source_file": "examples/README.md",
  "language_code": "ja"
}
-->
# 実例 - 実践的なAZDテンプレートと構成

## はじめに

このディレクトリには、Azure Developer CLIを実践的に学ぶための実例、テンプレート、現実的なシナリオが含まれています。各例では、さまざまなアプリケーションアーキテクチャやデプロイパターンに対応した完全な動作コード、インフラテンプレート、詳細な手順を提供しています。

## 学習目標

これらの例を通じて、以下を学ぶことができます：
- 現実的なアプリケーションシナリオを用いたAzure Developer CLIのワークフローを練習する
- さまざまなアプリケーションアーキテクチャとそのazd実装を理解する
- Azureサービス向けのInfrastructure as Codeパターンを習得する
- 環境固有のデプロイ戦略と構成管理を適用する
- 実践的な文脈でのモニタリング、セキュリティ、スケーリングパターンを実装する
- 実際のデプロイシナリオでのトラブルシューティングとデバッグの経験を積む

## 学習成果

これらの例を完了すると、以下ができるようになります：
- Azure Developer CLIを使用してさまざまなアプリケーションタイプを自信を持ってデプロイする
- 提供されたテンプレートを自分のアプリケーション要件に適応させる
- Bicepを使用してカスタムインフラパターンを設計・実装する
- 適切な依存関係を持つ複雑なマルチサービスアプリケーションを構成する
- 実際のシナリオでセキュリティ、モニタリング、パフォーマンスのベストプラクティスを適用する
- 実践的な経験に基づいてデプロイをトラブルシューティングし、最適化する

## ディレクトリ構造

```
examples/
├── simple-web-app/          # Basic web application deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── microservices/           # Multi-service application
│   ├── azure.yaml
│   ├── infra/
│   ├── services/
│   └── README.md
├── database-app/            # Application with database
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── container-app/           # Containerized application
│   ├── azure.yaml
│   ├── infra/
│   ├── Dockerfile
│   ├── src/
│   └── README.md
├── serverless-function/     # Azure Functions example
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── static-website/          # Static website deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## クイックスタート例

### 初心者向け
1. **[シンプルなWebアプリ](../../../examples/simple-web-app)** - 基本的なNode.jsウェブアプリケーションをデプロイ
2. **[静的ウェブサイト](../../../examples/static-website)** - Azure Storageで静的ウェブサイトをホスト
3. **[コンテナアプリ](../../../examples/container-app)** - コンテナ化されたアプリケーションをデプロイ

### 中級者向け
4. **[データベースアプリ](../../../examples/database-app)** - PostgreSQLデータベースを持つウェブアプリケーション
5. **[サーバーレス関数](../../../examples/serverless-function)** - HTTPトリガーを持つAzure Functions
6. **[マイクロサービス](../../../examples/microservices)** - APIゲートウェイを持つマルチサービスアプリケーション

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

各例には以下が含まれます：
- **README.md** - 詳細なセットアップとカスタマイズ手順
- **azure.yaml** - コメント付きのAZD構成
- **infra/** - パラメータの説明付きBicepテンプレート
- **src/** - サンプルアプリケーションコード
- **scripts/** - 共通タスク用のヘルパースクリプト

## 🎯 学習目標

### 例のカテゴリ

#### **基本的なデプロイ**
- 単一サービスアプリケーション
- シンプルなインフラパターン
- 基本的な構成管理
- コスト効率の高い開発セットアップ

#### **高度なシナリオ**
- マルチサービスアーキテクチャ
- 複雑なネットワーク構成
- データベース統合パターン
- セキュリティとコンプライアンスの実装

#### **本番対応パターン**
- 高可用性構成
- モニタリングと可観測性
- CI/CD統合
- 災害復旧セットアップ

## 📖 例の説明

### シンプルなWebアプリ
**技術**: Node.js, App Service, Application Insights  
**複雑さ**: 初心者向け  
**コンセプト**: 基本的なデプロイ、環境変数、ヘルスチェック

### 静的ウェブサイト
**技術**: HTML/CSS/JS, Storage Account, CDN  
**複雑さ**: 初心者向け  
**コンセプト**: 静的ホスティング、CDN統合、カスタムドメイン

### コンテナアプリ
**技術**: Docker, Container Apps, Container Registry  
**複雑さ**: 中級者向け  
**コンセプト**: コンテナ化、スケーリング、インバウンド設定

### データベースアプリ
**技術**: Python Flask, PostgreSQL, App Service  
**複雑さ**: 中級者向け  
**コンセプト**: データベース接続、シークレット管理、マイグレーション

### サーバーレス関数
**技術**: Azure Functions, Cosmos DB, API Management  
**複雑さ**: 中級者向け  
**コンセプト**: イベント駆動型アーキテクチャ、バインディング、API管理

### マイクロサービス
**技術**: 複数のサービス, Service Bus, API Gateway  
**複雑さ**: 上級者向け  
**コンセプト**: サービス間通信、メッセージキューイング、負荷分散

## 🛠 構成例

`configurations/`ディレクトリには再利用可能なコンポーネントが含まれています：

### 環境構成
- 開発環境設定
- ステージング環境構成
- 本番対応構成
- マルチリージョンデプロイセットアップ

### Bicepモジュール
- 再利用可能なインフラコンポーネント
- 共通リソースパターン
- セキュリティ強化テンプレート
- コスト最適化構成

### ヘルパースクリプト
- 環境セットアップの自動化
- データベースマイグレーションスクリプト
- デプロイ検証ツール
- コストモニタリングユーティリティ

## 🔧 カスタマイズガイド

### 例を自分のユースケースに適応させる

1. **前提条件を確認**
   - 必要なAzureサービスを確認
   - サブスクリプションの制限を確認
   - コストの影響を理解

2. **構成を変更**
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
   - モニタリングとアラートを有効化

## 📊 比較表

| 例 | サービス | データベース | 認証 | モニタリング | 複雑さ |
|----|----------|-------------|------|--------------|--------|
| シンプルなWebアプリ | 1 | ❌ | 基本 | 基本 | ⭐ |
| 静的ウェブサイト | 1 | ❌ | ❌ | 基本 | ⭐ |
| コンテナアプリ | 1 | ❌ | 基本 | フル | ⭐⭐ |
| データベースアプリ | 2 | ✅ | フル | フル | ⭐⭐⭐ |
| サーバーレス関数 | 3 | ✅ | フル | フル | ⭐⭐⭐ |
| マイクロサービス | 5+ | ✅ | フル | フル | ⭐⭐⭐⭐ |

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

3. **コンテナアプリに進む**
   - コンテナ化の基本を学ぶ
   - スケーリングの概念を理解する
   - Dockerを練習する

4. **データベース統合を追加**
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
- **Node.js**: シンプルなWebアプリ、マイクロサービス
- **Python**: データベースアプリ、サーバーレス関数
- **静的サイト**: 静的ウェブサイト
- **コンテナ**: コンテナアプリ、マイクロサービス
- **データベース**: データベースアプリ、サーバーレス関数

### アーキテクチャパターン別
- **モノリシック**: シンプルなWebアプリ、データベースアプリ
- **静的**: 静的ウェブサイト
- **マイクロサービス**: マイクロサービス例
- **サーバーレス**: サーバーレス関数
- **ハイブリッド**: コンテナアプリ

### 複雑さレベル別
- **初心者**: シンプルなWebアプリ、静的ウェブサイト
- **中級者**: コンテナアプリ、データベースアプリ、サーバーレス関数  
- **上級者**: マイクロサービス

## 📚 追加リソース

### ドキュメントリンク
- [Azure AI Foundry AZDテンプレート](https://github.com/Azure/ai-foundry-templates)
- [Bicepドキュメント](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azureアーキテクチャセンター](https://learn.microsoft.com/en-us/azure/architecture/)

### コミュニティ例
- [Azure Samples AZDテンプレート](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundryテンプレート](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLIギャラリー](https://azure.github.io/awesome-azd/)

### ベストプラクティス
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [クラウド導入フレームワーク](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 例の貢献

有用な例を共有したいですか？貢献を歓迎します！

### 提出ガイドライン
1. 確立されたディレクトリ構造に従う
2. 包括的なREADME.mdを含める
3. 構成ファイルにコメントを追加する
4. 提出前に徹底的にテストする
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
- 学んだことをコミュニティと共有する

---

**ナビゲーション**
- **前のレッスン**: [学習ガイド](../resources/study-guide.md)
- **戻る**: [メインREADME](../README.md)

---

**免責事項**:  
この文書は、AI翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を追求しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知ください。元の言語で記載された文書が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用に起因する誤解や誤った解釈について、当方は一切の責任を負いません。