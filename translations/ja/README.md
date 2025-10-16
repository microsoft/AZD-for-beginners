<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "be5fd7bf2b02d878efdb442580d98d96",
  "translation_date": "2025-10-16T15:28:29+00:00",
  "source_file": "README.md",
  "language_code": "ja"
}
-->
# AZD初心者向け: 構造化された学習の旅

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.ja.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

## このコースの始め方

以下のステップに従って、AZD学習の旅を始めましょう:

1. **リポジトリをフォークする**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork) をクリック
2. **リポジトリをクローンする**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **コミュニティに参加する**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) で専門家のサポートを受ける
4. **学習パスを選択する**: 以下の章から自分の経験レベルに合ったものを選択

### 多言語対応

#### 自動翻訳（常に最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[アラビア語](../ar/README.md) | [ベンガル語](../bn/README.md) | [ブルガリア語](../bg/README.md) | [ビルマ語 (ミャンマー)](../my/README.md) | [中国語 (簡体字)](../zh/README.md) | [中国語 (繁体字, 香港)](../hk/README.md) | [中国語 (繁体字, マカオ)](../mo/README.md) | [中国語 (繁体字, 台湾)](../tw/README.md) | [クロアチア語](../hr/README.md) | [チェコ語](../cs/README.md) | [デンマーク語](../da/README.md) | [オランダ語](../nl/README.md) | [エストニア語](../et/README.md) | [フィンランド語](../fi/README.md) | [フランス語](../fr/README.md) | [ドイツ語](../de/README.md) | [ギリシャ語](../el/README.md) | [ヘブライ語](../he/README.md) | [ヒンディー語](../hi/README.md) | [ハンガリー語](../hu/README.md) | [インドネシア語](../id/README.md) | [イタリア語](../it/README.md) | [日本語](./README.md) | [韓国語](../ko/README.md) | [リトアニア語](../lt/README.md) | [マレー語](../ms/README.md) | [マラーティー語](../mr/README.md) | [ネパール語](../ne/README.md) | [ノルウェー語](../no/README.md) | [ペルシャ語 (ファルシー)](../fa/README.md) | [ポーランド語](../pl/README.md) | [ポルトガル語 (ブラジル)](../br/README.md) | [ポルトガル語 (ポルトガル)](../pt/README.md) | [パンジャブ語 (グルムキー)](../pa/README.md) | [ルーマニア語](../ro/README.md) | [ロシア語](../ru/README.md) | [セルビア語 (キリル文字)](../sr/README.md) | [スロバキア語](../sk/README.md) | [スロベニア語](../sl/README.md) | [スペイン語](../es/README.md) | [スワヒリ語](../sw/README.md) | [スウェーデン語](../sv/README.md) | [タガログ語 (フィリピン)](../tl/README.md) | [タミル語](../ta/README.md) | [タイ語](../th/README.md) | [トルコ語](../tr/README.md) | [ウクライナ語](../uk/README.md) | [ウルドゥー語](../ur/README.md) | [ベトナム語](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## コース概要

Azure Developer CLI (azd) を段階的に学べる構造化された章で習得しましょう。**Azure AI Foundryとの統合によるAIアプリケーションのデプロイに特化しています。**

### このコースが現代の開発者にとって重要な理由

Azure AI Foundry Discordコミュニティの洞察に基づき、**45%の開発者がAIワークロードにAZDを使用したい**と考えていますが、以下の課題に直面しています:
- 複雑なマルチサービスAIアーキテクチャ
- AIの本番環境へのデプロイのベストプラクティス  
- Azure AIサービスの統合と設定
- AIワークロードのコスト最適化
- AI特有のデプロイメント問題のトラブルシューティング

### 学習目標

この構造化されたコースを完了することで、以下を達成できます:
- **AZDの基礎を習得**: 基本概念、インストール、設定
- **AIアプリケーションのデプロイ**: AZDを使用してAzure AI Foundryサービスを活用
- **コードとしてのインフラを実装**: BicepテンプレートでAzureリソースを管理
- **デプロイメントのトラブルシューティング**: 一般的な問題を解決し、デバッグ
- **本番環境向けの最適化**: セキュリティ、スケーリング、監視、コスト管理
- **マルチエージェントソリューションの構築**: 複雑なAIアーキテクチャをデプロイ

## 📚 学習章

*経験レベルと目標に基づいて学習パスを選択してください*

### 🚀 第1章: 基礎とクイックスタート
**前提条件**: Azureサブスクリプション、基本的なコマンドライン知識  
**所要時間**: 30-45分  
**難易度**: ⭐

#### 学べること
- Azure Developer CLIの基本を理解
- AZDをプラットフォームにインストール
- 初めてのデプロイを成功させる

#### 学習リソース
- **🎯 ここから始める**: [Azure Developer CLIとは？](../..)
- **📖 理論**: [AZDの基本](docs/getting-started/azd-basics.md) - 基本概念と用語
- **⚙️ セットアップ**: [インストールとセットアップ](docs/getting-started/installation.md) - プラットフォーム別ガイド
- **🛠️ 実践**: [初めてのプロジェクト](docs/getting-started/first-project.md) - ステップバイステップのチュートリアル
- **📋 クイックリファレンス**: [コマンドチートシート](resources/cheat-sheet.md)

#### 実践課題
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 章の成果**: AZDを使用してAzureにシンプルなWebアプリケーションをデプロイすることに成功する

---

### 🤖 第2章: AIファースト開発 (AI開発者向け推奨)
**前提条件**: 第1章を完了していること  
**所要時間**: 1-2時間  
**難易度**: ⭐⭐

#### 学べること
- AZDとAzure AI Foundryの統合
- AIを活用したアプリケーションのデプロイ
- AIサービスの設定を理解

#### 学習リソース
- **🎯 ここから始める**: [Azure AI Foundry統合](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 パターン**: [AIモデルのデプロイ](docs/ai-foundry/ai-model-deployment.md) - AIモデルのデプロイと管理
- **🛠️ ワークショップ**: [AIワークショップラボ](docs/ai-foundry/ai-workshop-lab.md) - AIソリューションをAZD対応にする
- **🎥 インタラクティブガイド**: [ワークショップ資料](workshop/README.md) - MkDocs * DevContainer環境でのブラウザベース学習
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

**💡 章の成果**: RAG機能を備えたAIチャットアプリケーションをデプロイし設定する

---

### ⚙️ 第3章: 設定と認証
**前提条件**: 第1章を完了していること  
**所要時間**: 45-60分  
**難易度**: ⭐⭐

#### 学べること
- 環境の設定と管理
- 認証とセキュリティのベストプラクティス
- リソースの命名と整理

#### 学習リソース
- **📖 設定**: [設定ガイド](docs/getting-started/configuration.md) - 環境設定
- **🔐 セキュリティ**: 認証パターンとマネージドID
- **📝 例**: [データベースアプリの例](../../examples/database-app) - 設定パターン

#### 実践課題
- 複数の環境 (開発、ステージング、本番) を設定
- マネージドID認証を設定
- 環境固有の設定を実装

**💡 章の成果**: 適切な認証とセキュリティを備えた複数の環境を管理する

---

### 🏗️ 第4章: コードとしてのインフラとデプロイメント
**前提条件**: 第1章から第3章を完了していること  
**所要時間**: 1-1.5時間  
**難易度**: ⭐⭐⭐

#### 学べること
- 高度なデプロイメントパターン
- Bicepを使用したコードとしてのインフラ
- リソースプロビジョニング戦略

#### 学習リソース
- **📖 デプロイメント**: [デプロイメントガイド](docs/deployment/deployment-guide.md) - 完全なワークフロー
- **🏗️ プロビジョニング**: [リソースのプロビジョニング](docs/deployment/provisioning.md) - Azureリソース管理
- **📝 例**: [コンテナアプリの例](../../examples/container-app) - コンテナ化されたデプロイメント

#### 実践課題
- カスタムBicepテンプレートを作成
- マルチサービスアプリケーションをデプロイ
- ブルーグリーンデプロイメント戦略を実装

**💡 章の成果**: カスタムインフラテンプレートを使用して複雑なマルチサービスアプリケーションをデプロイする

---

### 🎯 第5章: マルチエージェントAIソリューション (上級者向け)
**前提条件**: 第1章と第2章を完了していること  
**所要時間**: 2-3時間  
**難易度**: ⭐⭐⭐⭐

#### 学べること
- マルチエージェントアーキテクチャパターン
- エージェントのオーケストレーションと調整
- 本番環境対応のAIデプロイメント

#### 学習リソース
- **🤖 注目プロジェクト**: [小売業マルチエージェントソリューション](examples/retail-scenario.md) - 完全な実装
- **🛠️ ARMテンプレート**: [ARMテンプレートパッケージ](../../examples/retail-multiagent-arm-template) - ワンクリックデプロイメント
- **📖 アーキテクチャ**: マルチエージェント調整パターン

#### 実践課題
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 章の成果**: 顧客エージェントと在庫エージェントを備えた本番対応のマルチエージェントAIソリューションをデプロイし管理する

---

### 🔍 第6章: デプロイ前の検証と計画
**前提条件**: 第4章を完了していること  
**所要時間**: 1時間  
**難易度**: ⭐⭐

#### 学べること
- キャパシティプランニングとリソース検証
- SKU選択戦略
- プリフライトチェックと自動化

#### 学習リソース
- **📊 計画**: [キャパシティプランニング](docs/pre-deployment/capacity-planning.md) - リソース検証
- **💰 選択**: [SKU選択](docs/pre-deployment/sku-selection.md) - コスト効率の良い選択
- **✅ 検証**: [プリフライトチェック](docs/pre-deployment/preflight-checks.md) - 自動スクリプト

#### 実践課題
- キャパシティ検証スクリプトを実行
- コスト最適化のためのSKU選択を最適化
- 自動化されたデプロイ前チェックを実装

**💡 章の成果**: 実行前にデプロイメントを検証し最適化する

---

### 🚨 第7章: トラブルシューティングとデバッグ
**前提条件**: いずれかのデプロイメント章を完了していること  
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

**💡 章の成果**: 一般的なデプロイメント問題を独自に診断し解決する

---

### 🏢 第8章: 本番環境とエンタープライズパターン
**前提条件**: 第1章から第4章を完了していること  
**所要時間**: 2-3時間  

**複雑さ**: ⭐⭐⭐⭐

#### 学べること
- 本番環境へのデプロイ戦略
- エンタープライズセキュリティパターン
- モニタリングとコスト最適化

#### 学習リソース
- **🏭 本番環境**: [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md) - エンタープライズパターン
- **📝 例**: [Microservices Example](../../examples/microservices) - 複雑なアーキテクチャ
- **📊 モニタリング**: Application Insightsの統合

#### 実践演習
- エンタープライズセキュリティパターンの実装
- 包括的なモニタリングの設定
- 適切なガバナンスで本番環境にデプロイ

**💡 チャプターの成果**: 本番環境対応のエンタープライズアプリケーションをデプロイする能力を習得

---

## 🎓 ワークショップ概要: 実践的な学習体験

### インタラクティブなワークショップ教材
**ブラウザベースのツールとガイド付き演習による包括的な実践学習**

ワークショップ教材は、上記のチャプター別カリキュラムを補完する構造化されたインタラクティブな学習体験を提供します。ワークショップは、自己ペース学習とインストラクター主導のセッションの両方に対応しています。

#### 🛠️ ワークショップの特徴
- **ブラウザベースのインターフェース**: 検索、コピー、テーマ機能を備えたMkDocsベースのワークショップ
- **GitHub Codespaces統合**: ワンクリックで開発環境をセットアップ
- **構造化された学習パス**: 7ステップのガイド付き演習（合計3.5時間）
- **発見 → デプロイ → カスタマイズ**: 段階的な学習方法
- **インタラクティブなDevContainer環境**: 事前構成されたツールと依存関係

#### 📚 ワークショップの構成
ワークショップは、**発見 → デプロイ → カスタマイズ**の方法論に従います:

1. **発見フェーズ** (45分)
   - Azure AI Foundryのテンプレートとサービスを探索
   - マルチエージェントアーキテクチャパターンを理解
   - デプロイ要件と前提条件を確認

2. **デプロイフェーズ** (2時間)
   - AZDを使用したAIアプリケーションのハンズオンデプロイ
   - Azure AIサービスとエンドポイントの設定
   - セキュリティと認証パターンの実装

3. **カスタマイズフェーズ** (45分)
   - 特定のユースケースに合わせたアプリケーションの変更
   - 本番環境デプロイの最適化
   - モニタリングとコスト管理の実装

#### 🚀 ワークショップの始め方
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 ワークショップの学習成果
ワークショップを完了することで、参加者は以下を達成できます:
- **本番環境対応AIアプリケーションのデプロイ**: AZDとAzure AI Foundryサービスを使用
- **マルチエージェントアーキテクチャの習得**: 協調型AIエージェントソリューションの実装
- **セキュリティのベストプラクティスの実装**: 認証とアクセス制御の設定
- **スケールの最適化**: コスト効率が良く、パフォーマンスの高いデプロイ設計
- **デプロイのトラブルシューティング**: 一般的な問題を独自に解決

#### 📖 ワークショップリソース
- **🎥 インタラクティブガイド**: [Workshop Materials](workshop/README.md) - ブラウザベースの学習環境
- **📋 ステップバイステップの指示**: [Guided Exercises](../../workshop/docs/instructions) - 詳細な手順
- **🛠️ AIワークショップラボ**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - AIに特化した演習
- **💡 クイックスタート**: [Workshop Setup Guide](workshop/README.md#quick-start) - 環境設定

**対象**: 企業研修、大学講座、自己ペース学習、開発者向けブートキャンプ

---

## 📖 Azure Developer CLIとは？

Azure Developer CLI (azd)は、Azureへのアプリケーション構築とデプロイを迅速化する開発者向けコマンドラインインターフェースです。以下の機能を提供します:

- **テンプレートベースのデプロイ** - 一般的なアプリケーションパターン向けの事前構築テンプレートを使用
- **コードとしてのインフラ** - BicepまたはTerraformを使用してAzureリソースを管理  
- **統合ワークフロー** - アプリケーションのプロビジョニング、デプロイ、モニタリングをシームレスに実行
- **開発者向け** - 開発者の生産性と体験を最適化

### **AZD + Azure AI Foundry: AIデプロイに最適**

**なぜAZDがAIソリューションに適しているのか？** AZDはAI開発者が直面する主要な課題に対応します:

- **AI対応テンプレート** - Azure OpenAI、Cognitive Services、MLワークロード向けの事前構成テンプレート
- **安全なAIデプロイ** - AIサービス、APIキー、モデルエンドポイント向けの組み込みセキュリティパターン  
- **本番環境AIパターン** - スケーラブルでコスト効率の良いAIアプリケーションデプロイのベストプラクティス
- **エンドツーエンドAIワークフロー** - モデル開発から本番環境デプロイまで、適切なモニタリングを含む
- **コスト最適化** - AIワークロード向けのスマートなリソース割り当てとスケーリング戦略
- **Azure AI Foundry統合** - AI Foundryモデルカタログとエンドポイントへのシームレスな接続

---

## 🎯 テンプレート＆例のライブラリ

### 注目: Azure AI Foundryテンプレート
**AIアプリケーションをデプロイするならここから始めましょう！**

| テンプレート | チャプター | 複雑さ | サービス |
|----------|---------|------------|----------|
| [**AIチャットの始め方**](https://github.com/Azure-Samples/get-started-with-ai-chat) | チャプター2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**AIエージェントの始め方**](https://github.com/Azure-Samples/get-started-with-ai-agents) | チャプター2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**マルチエージェントワークフローの自動化**](https://github.com/Azure-Samples/get-started-with-ai-chat) | チャプター5 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**データからドキュメントを生成**](https://github.com/Azure-Samples/get-started-with-ai-chat) | チャプター4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**クライアント会議をエージェントで改善**](https://github.com/Azure-Samples/get-started-with-ai-chat) | チャプター5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**コードをエージェントでモダナイズ**](https://github.com/Azure-Samples/get-started-with-ai-chat) | チャプター5 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**会話型エージェントを構築**](https://github.com/Azure-Samples/get-started-with-ai-chat) | チャプター4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**会話データから洞察を得る**](https://github.com/Azure-Samples/get-started-with-ai-chat) | チャプター8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**マルチモーダルコンテンツ処理**](https://github.com/Azure-Samples/get-started-with-ai-chat) | チャプター8 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### 注目: 完全な学習シナリオ
**学習チャプターに対応した本番環境対応アプリケーションテンプレート**

| テンプレート | 学習チャプター | 複雑さ | 主な学習内容 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | チャプター2 | ⭐ | 基本的なAIデプロイパターン |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | チャプター2 | ⭐⭐ | Azure AI Searchを使用したRAG実装 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | チャプター4 | ⭐⭐ | ドキュメントインテリジェンスの統合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | チャプター5 | ⭐⭐⭐ | エージェントフレームワークと関数呼び出し |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | チャプター8 | ⭐⭐⭐ | エンタープライズAIオーケストレーション |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | チャプター5 | ⭐⭐⭐⭐ | 顧客および在庫エージェントを含むマルチエージェントアーキテクチャ |

### 例の種類別学習

#### シンプルなアプリケーション (チャプター1-2)
- [シンプルなWebアプリ](../../examples/simple-web-app) - 基本的なデプロイパターン
- [静的ウェブサイト](../../examples/static-site) - 静的コンテンツのデプロイ
- [基本的なAPI](../../examples/basic-api) - REST APIのデプロイ

#### データベース統合 (チャプター3-4)  
- [データベースアプリ](../../examples/database-app) - データベース接続パターン
- [データ処理](../../examples/data-processing) - ETLワークフローのデプロイ

#### 高度なパターン (チャプター4-8)
- [コンテナアプリ](../../examples/container-app) - コンテナ化されたデプロイ
- [マイクロサービス](../../examples/microservices) - マルチサービスアーキテクチャ  
- [エンタープライズソリューション](../../examples/enterprise) - 本番環境対応パターン

### 外部テンプレートコレクション
- [**公式AZDテンプレートギャラリー**](https://azure.github.io/awesome-azd/) - 公式およびコミュニティテンプレートの厳選コレクション
- [**Azure Developer CLIテンプレート**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learnのテンプレートドキュメント
- [**例のディレクトリ**](examples/README.md) - 詳細な説明付きのローカル学習例

---

## 📚 学習リソース＆参考資料

### クイックリファレンス
- [**コマンドチートシート**](resources/cheat-sheet.md) - チャプター別に整理された基本的なazdコマンド
- [**用語集**](resources/glossary.md) - Azureとazdの用語集  
- [**FAQ**](resources/faq.md) - 学習チャプター別のよくある質問
- [**学習ガイド**](resources/study-guide.md) - 包括的な練習問題

### 実践ワークショップ
- [**AIワークショップラボ**](docs/ai-foundry/ai-workshop-lab.md) - AIソリューションをAZDでデプロイ可能にする（2-3時間）
- [**インタラクティブワークショップガイド**](workshop/README.md) - MkDocsとDevContainer環境を使用したブラウザベースのワークショップ
- [**構造化された学習パス**](../../workshop/docs/instructions) - 発見 → デプロイ → カスタマイズの7ステップガイド付き演習
- [**AZD初心者向けワークショップ**](workshop/README.md) - GitHub Codespaces統合を含む完全なハンズオンワークショップ教材

### 外部学習リソース
- [Azure Developer CLIドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azureアーキテクチャセンター](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure料金計算ツール](https://azure.microsoft.com/pricing/calculator/)
- [Azureステータス](https://status.azure.com/)

---

## 🎓 コース完了と認定

### 進捗追跡
各チャプターを通じて学習進捗を追跡:

- [ ] **チャプター1**: 基礎とクイックスタート ✅
- [ ] **チャプター2**: AIファースト開発 ✅  
- [ ] **チャプター3**: 設定と認証 ✅
- [ ] **チャプター4**: コードとしてのインフラとデプロイ ✅
- [ ] **チャプター5**: マルチエージェントAIソリューション ✅
- [ ] **チャプター6**: デプロイ前の検証と計画 ✅
- [ ] **チャプター7**: トラブルシューティングとデバッグ ✅
- [ ] **チャプター8**: 本番環境とエンタープライズパターン ✅

### 学習の確認
各チャプターを完了した後、以下の方法で知識を確認:
1. **実践演習**: チャプターのハンズオンデプロイを完了
2. **知識チェック**: FAQセクションをレビュー
3. **コミュニティディスカッション**: Azure Discordで経験を共有
4. **次のチャプター**: 次の複雑さレベルに進む

### コース完了のメリット
すべてのチャプターを完了すると、以下を得られます:
- **本番環境経験**: 実際のAIアプリケーションをAzureにデプロイ
- **プロフェッショナルスキル**: エンタープライズ対応のデプロイ能力  
- **コミュニティ認知**: Azure開発者コミュニティのアクティブメンバー
- **キャリアの進展**: 需要の高いAZDとAIデプロイの専門知識

---

## 🤝 コミュニティ＆サポート

### ヘルプ＆サポート
- **技術的な問題**: [バグ報告と機能リクエスト](https://github.com/microsoft/azd-for-beginners/issues)
- **学習に関する質問**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure)
- **AI特化のヘルプ**: AZD + AI Foundryのディスカッション用[#Azureチャンネル](https://discord.gg/microsoft-azure)に参加
- **ドキュメント**: [公式Azure Developer CLIドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Azure AI Foundry Discordのコミュニティインサイト

**#Azureチャンネルの最近の投票結果:**
- **45%**の開発者がAIワークロードにAZDを使用したいと回答
- **主な課題**: マルチサービスデプロイ、資格情報管理、本番環境対応  
- **最もリクエストされたもの**: AI特化テンプレート、トラブルシューティングガイド、ベストプラクティス

**コミュニティに参加して:**
- AZD + AIの経験を共有し、サポートを受ける
- 新しいAIテンプレートの早期プレビューにアクセス
-
- **新しい例**: 実際のシナリオやテンプレートを追加  
- **翻訳**: 多言語対応を維持するための支援  
- **バグ報告**: 精度と明確さを向上  
- **コミュニティ基準**: 包括的なコミュニティガイドラインに従う  

---

## 📄 コース情報

### ライセンス
このプロジェクトはMITライセンスの下で提供されています。詳細は[LICENSE](../../LICENSE)ファイルをご覧ください。

### 関連するMicrosoft学習リソース

私たちのチームは、他にも包括的な学習コースを提供しています:

- [初心者向けモデルコンテキストプロトコル (MCP)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [初心者向けAIエージェント](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [.NETを使用した初心者向け生成AI](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [初心者向け生成AI](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Javaを使用した初心者向け生成AI](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [初心者向け機械学習](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [初心者向けデータサイエンス](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [初心者向けAI](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [初心者向けサイバーセキュリティ](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [初心者向けWeb開発](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [初心者向けIoT](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [初心者向けXR開発](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AIペアプログラミングのためのGitHub Copilotマスター](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [C#/.NET開発者向けGitHub Copilotマスター](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [自分で選ぶCopilotアドベンチャー](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

## 🗺️ コースナビゲーション

**🚀 学習を始める準備はできましたか？**

**初心者**: [第1章: 基礎とクイックスタート](../..)から始めましょう  
**AI開発者**: [第2章: AIファースト開発](../..)に進みましょう  
**経験豊富な開発者**: [第3章: 設定と認証](../..)から始めましょう  

**次のステップ**: [第1章 - AZDの基本を始める](docs/getting-started/azd-basics.md) →

---

**免責事項**:  
この文書はAI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性を追求しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があります。元の言語で記載された文書を正式な情報源としてご参照ください。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用に起因する誤解や誤解釈について、当社は責任を負いません。