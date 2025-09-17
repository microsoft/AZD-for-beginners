<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "21dcf6a2d8a223a853d965138d4fb045",
  "translation_date": "2025-09-17T14:06:04+00:00",
  "source_file": "README.md",
  "language_code": "ja"
}
-->
# AZD初心者向け: 構造化された学習の旅

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.ja.png) 

## このコースの始め方

以下の手順に従って、AZD学習の旅を始めましょう:

1. **リポジトリをフォークする**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork) をクリック
2. **リポジトリをクローンする**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **コミュニティに参加する**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) で専門家のサポートを受ける
4. **学習パスを選ぶ**: 以下の章から自分の経験レベルに合ったものを選択

### 多言語対応

#### 自動翻訳 (常に最新)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](./README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

## コース概要

Azure Developer CLI (azd) を体系的な章を通じて習得し、段階的に学びます。**Azure AI Foundryとの統合を活用したAIアプリケーションのデプロイに特化しています。**

### このコースが現代の開発者にとって重要な理由

Azure AI Foundry Discordコミュニティの洞察に基づき、**開発者の45%がAIワークロードにAZDを使用したい**と考えていますが、以下の課題に直面しています:
- 複雑なマルチサービスAIアーキテクチャ
- AIの本番環境デプロイのベストプラクティス  
- Azure AIサービスの統合と設定
- AIワークロードのコスト最適化
- AI特有のデプロイメント問題のトラブルシューティング

### 学習目標

この構造化されたコースを完了することで、以下を達成できます:
- **AZDの基礎を習得**: コアコンセプト、インストール、設定
- **AIアプリケーションをデプロイ**: AZDを使用してAzure AI Foundryサービスを活用
- **コードとしてのインフラを実装**: BicepテンプレートでAzureリソースを管理
- **デプロイメントのトラブルシューティング**: 一般的な問題を解決し、デバッグ
- **本番環境向けに最適化**: セキュリティ、スケーリング、モニタリング、コスト管理
- **マルチエージェントソリューションを構築**: 複雑なAIアーキテクチャをデプロイ

## 📚 学習章

*経験レベルと目標に基づいて学習パスを選択*

### 🚀 第1章: 基礎とクイックスタート
**前提条件**: Azureサブスクリプション、基本的なコマンドライン知識  
**所要時間**: 30-45分  
**難易度**: ⭐

#### 学べること
- Azure Developer CLIの基本を理解
- AZDをプラットフォームにインストール
- 初めてのデプロイを成功させる

#### 学習リソース
- **🎯 ここから始める**: [Azure Developer CLIとは](../..)
- **📖 理論**: [AZDの基本](docs/getting-started/azd-basics.md) - コアコンセプトと用語
- **⚙️ セットアップ**: [インストールとセットアップ](docs/getting-started/installation.md) - プラットフォーム別ガイド
- **🛠️ 実践**: [最初のプロジェクト](docs/getting-started/first-project.md) - ステップバイステップのチュートリアル
- **📋 クイックリファレンス**: [コマンドチートシート](resources/cheat-sheet.md)

#### 実践課題
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 第1章の成果**: AZDを使用してAzureにシンプルなWebアプリケーションをデプロイする

---

### 🤖 第2章: AI優先の開発 (AI開発者向け推奨)
**前提条件**: 第1章を完了  
**所要時間**: 1-2時間  
**難易度**: ⭐⭐

#### 学べること
- AZDとAzure AI Foundryの統合
- AI搭載アプリケーションのデプロイ
- AIサービスの設定を理解

#### 学習リソース
- **🎯 ここから始める**: [Azure AI Foundry統合](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 パターン**: [AIモデルのデプロイ](docs/ai-foundry/ai-model-deployment.md) - AIモデルのデプロイと管理
- **🛠️ ワークショップ**: [AIワークショップラボ](docs/ai-foundry/ai-workshop-lab.md) - AIソリューションをAZD対応にする
- **📋 テンプレート**: [Azure AI Foundryテンプレート](../..)

#### 実践課題
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 第2章の成果**: RAG機能を備えたAI搭載チャットアプリケーションをデプロイし設定する

---

### ⚙️ 第3章: 設定と認証
**前提条件**: 第1章を完了  
**所要時間**: 45-60分  
**難易度**: ⭐⭐

#### 学べること
- 環境設定と管理
- 認証とセキュリティのベストプラクティス
- リソースの命名と整理

#### 学習リソース
- **📖 設定**: [設定ガイド](docs/getting-started/configuration.md) - 環境セットアップ
- **🔐 セキュリティ**: 認証パターンとマネージドID
- **📝 例**: [データベースアプリの例](../../examples/database-app) - 設定パターン

#### 実践課題
- 複数の環境 (開発、ステージング、本番) を設定
- マネージドID認証をセットアップ
- 環境固有の設定を実装

**💡 第3章の成果**: 適切な認証とセキュリティを備えた複数の環境を管理する

---

### 🏗️ 第4章: コードとしてのインフラとデプロイ
**前提条件**: 第1章から第3章を完了  
**所要時間**: 1-1.5時間  
**難易度**: ⭐⭐⭐

#### 学べること
- 高度なデプロイパターン
- Bicepを使用したコードとしてのインフラ
- リソースプロビジョニング戦略

#### 学習リソース
- **📖 デプロイ**: [デプロイガイド](docs/deployment/deployment-guide.md) - 完全なワークフロー
- **🏗️ プロビジョニング**: [リソースのプロビジョニング](docs/deployment/provisioning.md) - Azureリソース管理
- **📝 例**: [コンテナアプリの例](../../examples/container-app) - コンテナ化されたデプロイ

#### 実践課題
- カスタムBicepテンプレートを作成
- マルチサービスアプリケーションをデプロイ
- ブルーグリーンデプロイメント戦略を実装

**💡 第4章の成果**: カスタムインフラテンプレートを使用して複雑なマルチサービスアプリケーションをデプロイする

---

### 🎯 第5章: マルチエージェントAIソリューション (上級者向け)
**前提条件**: 第1章から第2章を完了  
**所要時間**: 2-3時間  
**難易度**: ⭐⭐⭐⭐

#### 学べること
- マルチエージェントアーキテクチャパターン
- エージェントのオーケストレーションと調整
- 本番環境対応のAIデプロイ

#### 学習リソース
- **🤖 注目プロジェクト**: [小売業マルチエージェントソリューション](examples/retail-scenario.md) - 完全な実装
- **🛠️ ARMテンプレート**: [ARMテンプレートパッケージ](../../examples/retail-multiagent-arm-template) - ワンクリックデプロイ
- **📖 アーキテクチャ**: マルチエージェント調整パターン

#### 実践課題
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 第5章の成果**: 顧客エージェントと在庫エージェントを備えた本番環境対応のマルチエージェントAIソリューションをデプロイし管理する

---

### 🔍 第6章: デプロイ前の検証と計画
**前提条件**: 第4章を完了  
**所要時間**: 1時間  
**難易度**: ⭐⭐

#### 学べること
- 容量計画とリソース検証
- SKU選択戦略
- プリフライトチェックと自動化

#### 学習リソース
- **📊 計画**: [容量計画](docs/pre-deployment/capacity-planning.md) - リソース検証
- **💰 選択**: [SKU選択](docs/pre-deployment/sku-selection.md) - コスト効率の良い選択
- **✅ 検証**: [プリフライトチェック](docs/pre-deployment/preflight-checks.md) - 自動スクリプト

#### 実践課題
- 容量検証スクリプトを実行
- コスト最適化のためのSKU選択を最適化
- 自動化されたデプロイ前チェックを実装

**💡 第6章の成果**: 実行前にデプロイメントを検証し最適化する

---

### 🚨 第7章: トラブルシューティングとデバッグ
**前提条件**: いずれかのデプロイ章を完了  
**所要時間**: 1-1.5時間  
**難易度**: ⭐⭐

#### 学べること
- 系統的なデバッグアプローチ
- 一般的な問題と解決策
- AI特有のトラブルシューティング

#### 学習リソース
- **🔧 一般的な問題**: [一般的な問題](docs/troubleshooting/common-issues.md) - FAQと解決策
- **🕵️ デバッグ**: [デバッグガイド](docs/troubleshooting/debugging.md) - ステップバイステップの戦略
- **🤖 AI問題**: [AI特有のトラブルシューティング](docs/troubleshooting/ai-troubleshooting.md) - AIサービスの問題

#### 実践課題
- デプロイメント失敗を診断
- 認証問題を解決
- AIサービスの接続性をデバッグ

**💡 第7章の成果**: 一般的なデプロイメント問題を独自に診断し解決する

---

### 🏢 第8章: 本番環境とエンタープライズパターン
**前提条件**: 第1章から第4章を完了  
**所要時間**: 2-3時間  
**難易度**: ⭐⭐⭐⭐

#### 学べること
- 本番環境デプロイ戦略
- エンタープライズセキュリティパターン
- モニタリングとコスト最適化

#### 学習リソース
- **🏭 本番環境**: [本番AIのベストプラクティス](docs/ai-foundry/production-ai-practices.md) - エンタープライズパターン
- **📝 例**: [マイクロサービスの例](../../examples/microservices) - 複雑なアーキテクチャ
- **📊 モニタリング**: Application Insights の統合

#### 実践的な演習
- エンタープライズセキュリティパターンの実装
- 包括的なモニタリングの設定
- 適切なガバナンスで本番環境にデプロイ

**💡 チャプターの成果**: 本番環境対応のエンタープライズアプリケーションをデプロイする能力を習得

---

## 📖 Azure Developer CLI とは？

Azure Developer CLI (azd) は、Azure にアプリケーションを構築・デプロイするプロセスを加速する、開発者向けのコマンドラインインターフェイスです。以下の機能を提供します：

- **テンプレートベースのデプロイ** - 一般的なアプリケーションパターン向けの事前構築テンプレートを使用
- **コードとしてのインフラ** - Bicep または Terraform を使用して Azure リソースを管理  
- **統合ワークフロー** - アプリケーションのプロビジョニング、デプロイ、モニタリングをシームレスに実行
- **開発者に優しい設計** - 開発者の生産性と体験を最適化

### **AZD + Azure AI Foundry: AI デプロイに最適**

**AI ソリューションに AZD を選ぶ理由**  
AZD は AI 開発者が直面する主要な課題に対応します：

- **AI 対応テンプレート** - Azure OpenAI、Cognitive Services、ML ワークロード向けの事前設定済みテンプレート
- **安全な AI デプロイ** - AI サービス、API キー、モデルエンドポイント向けのセキュリティパターンを内蔵  
- **本番環境対応の AI パターン** - スケーラブルでコスト効率の高い AI アプリケーションデプロイのベストプラクティス
- **エンドツーエンドの AI ワークフロー** - モデル開発から本番環境デプロイまで、適切なモニタリングを含むプロセス
- **コスト最適化** - AI ワークロード向けのスマートなリソース割り当てとスケーリング戦略
- **Azure AI Foundry 統合** - AI Foundry モデルカタログとエンドポイントへのシームレスな接続

---

## 🎯 テンプレート & サンプルライブラリ

### 注目: Azure AI Foundry テンプレート
**AI アプリケーションをデプロイするならここから始めましょう！**

| テンプレート | チャプター | 複雑度 | サービス |
|----------|---------|------------|----------|
| [**AI チャットの始め方**](https://github.com/Azure-Samples/get-started-with-ai-chat) | チャプター 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**AI エージェントの始め方**](https://github.com/Azure-Samples/get-started-with-ai-agents) | チャプター 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**マルチエージェントワークフローの自動化**](https://github.com/Azure-Samples/get-started-with-ai-chat) | チャプター 5 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**データからドキュメントを生成**](https://github.com/Azure-Samples/get-started-with-ai-chat) | チャプター 4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**クライアント会議をエージェントで改善**](https://github.com/Azure-Samples/get-started-with-ai-chat) | チャプター 5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**コードをエージェントでモダナイズ**](https://github.com/Azure-Samples/get-started-with-ai-chat) | チャプター 5 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**会話型エージェントを構築**](https://github.com/Azure-Samples/get-started-with-ai-chat) | チャプター 4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**会話データからインサイトを引き出す**](https://github.com/Azure-Samples/get-started-with-ai-chat) | チャプター 8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**マルチモーダルコンテンツ処理**](https://github.com/Azure-Samples/get-started-with-ai-chat) | チャプター 8 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### 注目: 完全な学習シナリオ
**学習チャプターに対応した本番環境対応アプリケーションテンプレート**

| テンプレート | 学習チャプター | 複雑度 | 主な学習内容 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | チャプター 2 | ⭐ | 基本的な AI デプロイパターン |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | チャプター 2 | ⭐⭐ | Azure AI Search を使用した RAG 実装 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | チャプター 4 | ⭐⭐ | ドキュメントインテリジェンスの統合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | チャプター 5 | ⭐⭐⭐ | エージェントフレームワークと関数呼び出し |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | チャプター 8 | ⭐⭐⭐ | エンタープライズ AI オーケストレーション |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | チャプター 5 | ⭐⭐⭐⭐ | 顧客および在庫エージェントを含むマルチエージェントアーキテクチャ |

### アプリケーションタイプ別の学習

#### シンプルなアプリケーション (チャプター 1-2)
- [シンプルな Web アプリ](../../examples/simple-web-app) - 基本的なデプロイパターン
- [静的ウェブサイト](../../examples/static-site) - 静的コンテンツのデプロイ
- [基本的な API](../../examples/basic-api) - REST API のデプロイ

#### データベース統合 (チャプター 3-4)  
- [データベースアプリ](../../examples/database-app) - データベース接続パターン
- [データ処理](../../examples/data-processing) - ETL ワークフローのデプロイ

#### 高度なパターン (チャプター 4-8)
- [コンテナアプリ](../../examples/container-app) - コンテナ化されたデプロイ
- [マイクロサービス](../../examples/microservices) - マルチサービスアーキテクチャ  
- [エンタープライズソリューション](../../examples/enterprise) - 本番環境対応のパターン

### 外部テンプレートコレクション
- [**Azure-Samples AZD テンプレート**](https://github.com/Azure-Samples/azd-templates) - Microsoft の公式サンプル
- [**Awesome AZD ギャラリー**](https://azure.github.io/awesome-azd/) - コミュニティ提供のテンプレート
- [**サンプルディレクトリ**](examples/README.md) - 詳細な説明付きのローカル学習サンプル

---

## 📚 学習リソース & 参考資料

### クイックリファレンス
- [**コマンドチートシート**](resources/cheat-sheet.md) - チャプターごとに整理された必須 azd コマンド
- [**用語集**](resources/glossary.md) - Azure と azd の用語  
- [**FAQ**](resources/faq.md) - 学習チャプターごとに整理されたよくある質問
- [**学習ガイド**](resources/study-guide.md) - 包括的な実践演習

### ハンズオンワークショップ
- [**AI ワークショップラボ**](docs/ai-foundry/ai-workshop-lab.md) - AI ソリューションを AZD でデプロイ可能にする
- [**AZD 初心者向けワークショップ**](workshop/README.md) - 完全なハンズオンワークショップ資料

### 外部学習リソース
- [Azure Developer CLI ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure アーキテクチャセンター](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 料金計算ツール](https://azure.microsoft.com/pricing/calculator/)
- [Azure ステータス](https://status.azure.com/)

---

## 🎓 コース完了 & 認定

### 進捗トラッキング
各チャプターを通じて学習進捗を追跡：

- [ ] **チャプター 1**: 基礎 & クイックスタート ✅
- [ ] **チャプター 2**: AI ファースト開発 ✅  
- [ ] **チャプター 3**: 設定 & 認証 ✅
- [ ] **チャプター 4**: コードとしてのインフラ & デプロイ ✅
- [ ] **チャプター 5**: マルチエージェント AI ソリューション ✅
- [ ] **チャプター 6**: デプロイ前の検証 & 計画 ✅
- [ ] **チャプター 7**: トラブルシューティング & デバッグ ✅
- [ ] **チャプター 8**: 本番環境 & エンタープライズパターン ✅

### 学習確認
各チャプターを完了した後、以下を実行して知識を確認：
1. **実践演習**: チャプターのハンズオンデプロイを完了
2. **知識チェック**: チャプターの FAQ セクションをレビュー
3. **コミュニティディスカッション**: Azure Discord で経験を共有
4. **次のチャプター**: 次の複雑度レベルに進む

### コース完了のメリット
すべてのチャプターを完了すると以下を得られます：
- **本番環境経験**: 実際の AI アプリケーションを Azure にデプロイ
- **プロフェッショナルスキル**: エンタープライズ対応のデプロイ能力  
- **コミュニティ認知**: Azure 開発者コミュニティの積極的なメンバー
- **キャリア向上**: 需要の高い AZD と AI デプロイの専門知識

---

## 🤝 コミュニティ & サポート

### ヘルプ & サポート
- **技術的な問題**: [バグ報告と機能リクエスト](https://github.com/microsoft/azd-for-beginners/issues)
- **学習に関する質問**: [Microsoft Azure Discord コミュニティ](https://discord.gg/microsoft-azure)
- **AI 特化のヘルプ**: AZD + AI Foundry の議論は [#Azure チャンネル](https://discord.gg/microsoft-azure) へ
- **ドキュメント**: [公式 Azure Developer CLI ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Azure AI Foundry Discord のコミュニティインサイト

**#Azure チャンネルの最近の投票結果**:
- **45%** の開発者が AI ワークロードに AZD を使用したいと回答
- **主な課題**: マルチサービスデプロイ、資格情報管理、本番環境対応  
- **最も要望が多い**: AI 特化のテンプレート、トラブルシューティングガイド、ベストプラクティス

**コミュニティに参加して以下を実現**:
- AZD + AI の経験を共有し、ヘルプを得る
- 新しい AI テンプレートの早期プレビューにアクセス
- AI デプロイのベストプラクティスに貢献
- 将来の AI + AZD 機能開発に影響を与える

### コースへの貢献
貢献を歓迎します！詳細は [貢献ガイド](CONTRIBUTING.md) をご覧ください：
- **コンテンツ改善**: 既存のチャプターやサンプルを強化
- **新しいサンプル**: 実際のシナリオやテンプレートを追加  
- **翻訳**: 多言語サポートを維持するための協力
- **バグ報告**: 正確性と明確性を向上
- **コミュニティ基準**: 包括的なコミュニティガイドラインを遵守

---

## 📄 コース情報

### ライセンス
このプロジェクトは MIT ライセンスの下で提供されています - 詳細は [LICENSE](../../LICENSE) ファイルをご覧ください。

### 関連する Microsoft 学習リソース

当チームは他にも包括的な学習コースを提供しています：

- [**NEW** モデルコンテキストプロトコル (MCP) 初心者向け](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI エージェント初心者向け](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [.NET を使用した初心者向け生成 AI](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [生成 AI 初心者向け](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Java を使用した初心者向け生成 AI](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML 初心者向け](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [データサイエンス初心者向け](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI 初心者向け](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [サイバーセキュリティ初心者向け](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Web 開発初心者向け](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT 初心者向け](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [XR 開発初心者向け](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [GitHub Copilot を活用した AI ペアプログラミングの習得](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [C#/.NET 開発者向け GitHub Copilot の習得](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [GitHub Copilot の冒険を選ぼう](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

## 🗺️ コースナビゲーション

**🚀 学習を始める準備はできましたか？**

**初心者**: [チャプター 1: 基礎 & クイックスタート](../..) から始めましょう  
**AI 開発者**: [チャプター 2: AI ファースト開発](../..) に進みましょう
**経験豊富な開発者向け**: [第3章: 設定と認証](../..) から始めてください

**次のステップ**: [第1章 - AZDの基本を始める](docs/getting-started/azd-basics.md) →

---

**免責事項**:  
この文書は、AI翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を追求しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知ください。元の言語で記載された文書が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用に起因する誤解や誤解釈について、当社は責任を負いません。