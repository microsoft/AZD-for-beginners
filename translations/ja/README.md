<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3df05e83c2307e92452bd7c3307ae849",
  "translation_date": "2025-09-24T09:33:43+00:00",
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

以下の手順に従って、AZD学習の旅を始めましょう:

1. **リポジトリをフォークする**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork) をクリック
2. **リポジトリをクローンする**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **コミュニティに参加する**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) で専門家のサポートを受ける
4. **学習パスを選ぶ**: 以下の章から自分の経験レベルに合ったものを選択

### 多言語対応

#### 自動翻訳 (常に最新)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](./README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

## コース概要

Azure Developer CLI (azd) を体系的な章で学び、段階的にスキルを向上させましょう。**Azure AI Foundryとの統合によるAIアプリケーションのデプロイに特化しています。**

### このコースが現代の開発者に必要な理由

Azure AI Foundry Discordコミュニティの洞察に基づき、**45%の開発者がAIワークロードにAZDを使用したい**と考えていますが、以下の課題に直面しています:
- 複雑なマルチサービスAIアーキテクチャ
- AIの本番環境デプロイのベストプラクティス  
- Azure AIサービスの統合と設定
- AIワークロードのコスト最適化
- AI特有のデプロイメント問題のトラブルシューティング

### 学習目標

この構造化されたコースを完了することで、以下を習得できます:
- **AZDの基礎をマスター**: コアコンセプト、インストール、設定
- **AIアプリケーションのデプロイ**: Azure AI Foundryサービスを使用
- **コードとしてのインフラストラクチャを実装**: BicepテンプレートでAzureリソースを管理
- **デプロイメントのトラブルシューティング**: 一般的な問題を解決し、デバッグ
- **本番環境向けの最適化**: セキュリティ、スケーリング、監視、コスト管理
- **マルチエージェントソリューションの構築**: 複雑なAIアーキテクチャをデプロイ

## 📚 学習章

*経験レベルと目標に基づいて学習パスを選択*

### 🚀 第1章: 基礎とクイックスタート
**前提条件**: Azureサブスクリプション、基本的なコマンドライン知識  
**所要時間**: 30-45分  
**難易度**: ⭐

#### 学べること
- Azure Developer CLIの基本を理解
- 自分のプラットフォームにAZDをインストール
- 初めてのデプロイを成功させる

#### 学習リソース
- **🎯 ここから始める**: [Azure Developer CLIとは？](../..)
- **📖 理論**: [AZDの基本](docs/getting-started/azd-basics.md) - コアコンセプトと用語
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

**💡 章の成果**: AZDを使用してAzureにシンプルなWebアプリケーションをデプロイする

---

### 🤖 第2章: AI優先の開発 (AI開発者向け推奨)
**前提条件**: 第1章を完了  
**所要時間**: 1-2時間  
**難易度**: ⭐⭐

#### 学べること
- AZDとAzure AI Foundryの統合
- AI対応アプリケーションのデプロイ
- AIサービスの設定を理解

#### 学習リソース
- **🎯 ここから始める**: [Azure AI Foundry統合](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 パターン**: [AIモデルのデプロイ](docs/ai-foundry/ai-model-deployment.md) - AIモデルのデプロイと管理
- **🛠️ ワークショップ**: [AIワークショップラボ](docs/ai-foundry/ai-workshop-lab.md) - AIソリューションをAZD対応にする
- **🎥 インタラクティブガイド**: [ワークショップ資料](workshop/README.md) - MkDocs * DevContainer環境を使用したブラウザベースの学習
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

**💡 章の成果**: RAG機能を備えたAI対応のチャットアプリケーションをデプロイおよび設定する

---

### ⚙️ 第3章: 設定と認証
**前提条件**: 第1章を完了  
**所要時間**: 45-60分  
**難易度**: ⭐⭐

#### 学べること
- 環境の設定と管理
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

**💡 章の成果**: 適切な認証とセキュリティを備えた複数の環境を管理する

---

### 🏗️ 第4章: コードとしてのインフラストラクチャとデプロイ
**前提条件**: 第1章から第3章を完了  
**所要時間**: 1-1.5時間  
**難易度**: ⭐⭐⭐

#### 学べること
- 高度なデプロイパターン
- Bicepを使用したコードとしてのインフラストラクチャ
- リソースプロビジョニング戦略

#### 学習リソース
- **📖 デプロイ**: [デプロイガイド](docs/deployment/deployment-guide.md) - 完全なワークフロー
- **🏗️ プロビジョニング**: [リソースのプロビジョニング](docs/deployment/provisioning.md) - Azureリソース管理
- **📝 例**: [コンテナアプリの例](../../examples/container-app) - コンテナ化されたデプロイ

#### 実践課題
- カスタムBicepテンプレートを作成
- マルチサービスアプリケーションをデプロイ
- ブルーグリーンデプロイメント戦略を実装

**💡 章の成果**: カスタムインフラストラクチャテンプレートを使用して複雑なマルチサービスアプリケーションをデプロイする

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

**💡 章の成果**: 顧客エージェントと在庫エージェントを備えた本番環境対応のマルチエージェントAIソリューションをデプロイおよび管理する

---

### 🔍 第6章: デプロイ前の検証と計画
**前提条件**: 第4章を完了  
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
**前提条件**: いずれかのデプロイ章を完了  
**所要時間**: 1-1.5時間  
**難易度**: ⭐⭐

#### 学べること
- 系統的なデバッグアプローチ
- 一般的な問題とその解決策
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
**前提条件**: 第1章から第4章を完了  
**所要時間**: 2-3時間  
**難易度**: ⭐⭐⭐⭐

#### 学べること
- 本番環境デプロイ戦略
- エンタープライズセキュリティパターン
- 監視とコスト最適化

#### 学習リソース
- **🏭 本番環境**: [本番AIのベストプラクティス](docs/ai-foundry/production-ai-practices.md) - エンタープライズパターン
- **📝 例**: [Microservices Example](../../examples/microservices) - 複雑なアーキテクチャ
- **📊 モニタリング**: Application Insights の統合

#### 実践的な演習
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
- **ブラウザベースのインターフェース**: MkDocs を活用したワークショップで検索、コピー、テーマ機能を完備
- **GitHub Codespaces の統合**: ワンクリックで開発環境をセットアップ
- **構造化された学習パス**: 7ステップのガイド付き演習（合計3.5時間）
- **発見 → デプロイ → カスタマイズ**: 段階的な学習方法論
- **インタラクティブな DevContainer 環境**: 事前設定されたツールと依存関係

#### 📚 ワークショップの構成
ワークショップは **発見 → デプロイ → カスタマイズ** の方法論に従います:

1. **発見フェーズ** (45分)
   - Azure AI Foundry のテンプレートとサービスを探索
   - マルチエージェントアーキテクチャパターンを理解
   - デプロイ要件と前提条件を確認

2. **デプロイフェーズ** (2時間)
   - AZD を使用した AI アプリケーションのハンズオンデプロイ
   - Azure AI サービスとエンドポイントの設定
   - セキュリティと認証パターンを実装

3. **カスタマイズフェーズ** (45分)
   - 特定のユースケースに合わせてアプリケーションを修正
   - 本番環境デプロイの最適化
   - モニタリングとコスト管理を実装

#### 🚀 ワークショップの開始方法
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
- **本番環境対応の AI アプリケーションをデプロイ**: AZD を使用して Azure AI Foundry サービスを活用
- **マルチエージェントアーキテクチャを習得**: 協調型 AI エージェントソリューションを実装
- **セキュリティのベストプラクティスを実装**: 認証とアクセス制御を設定
- **スケールに最適化**: コスト効率が高く、パフォーマンスの良いデプロイを設計
- **デプロイのトラブルシューティング**: 一般的な問題を独自に解決

#### 📖 ワークショップリソース
- **🎥 インタラクティブガイド**: [Workshop Materials](workshop/README.md) - ブラウザベースの学習環境
- **📋 ステップバイステップの手順**: [Guided Exercises](../../workshop/docs/instructions) - 詳細な手順
- **🛠️ AI ワークショップラボ**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - AI に特化した演習
- **💡 クイックスタート**: [Workshop Setup Guide](workshop/README.md#quick-start) - 環境設定

**対象**: 企業研修、大学講座、自己ペース学習、開発者向けブートキャンプ

---

## 📖 Azure Developer CLI とは？

Azure Developer CLI (azd) は、Azure にアプリケーションを構築・デプロイするプロセスを加速する開発者向けコマンドラインインターフェースです。以下の機能を提供します:

- **テンプレートベースのデプロイ** - 一般的なアプリケーションパターン向けの事前構築テンプレートを使用
- **コードとしてのインフラ** - Bicep または Terraform を使用して Azure リソースを管理  
- **統合ワークフロー** - アプリケーションのプロビジョニング、デプロイ、モニタリングをシームレスに実行
- **開発者向け** - 開発者の生産性と体験を最適化

### **AZD + Azure AI Foundry: AI デプロイに最適**

**なぜ AZD が AI ソリューションに適しているのか？** AZD は AI 開発者が直面する主要な課題に対応します:

- **AI 対応テンプレート** - Azure OpenAI、Cognitive Services、ML ワークロード向けの事前設定テンプレート
- **安全な AI デプロイ** - AI サービス、API キー、モデルエンドポイント向けの組み込みセキュリティパターン  
- **本番環境対応の AI パターン** - スケーラブルでコスト効率の高い AI アプリケーションデプロイのベストプラクティス
- **エンドツーエンドの AI ワークフロー** - モデル開発から本番環境デプロイまで、適切なモニタリングを含む
- **コスト最適化** - AI ワークロード向けのスマートなリソース割り当てとスケーリング戦略
- **Azure AI Foundry の統合** - AI Foundry モデルカタログとエンドポイントへのシームレスな接続

---

## 🎯 テンプレート & 例のライブラリ

### 注目: Azure AI Foundry テンプレート
**AI アプリケーションをデプロイするならここから始めましょう！**

| テンプレート | チャプター | 複雑度 | サービス |
|----------|---------|------------|----------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapter 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**Multi-agent workflow automation**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 5 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Generate documents from your data**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**Improve client meetings with agents**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**Modernize your code with agents**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 5 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Build your conversational agent**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**Unlock insights from conversational data**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**Multi-modal content processing**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 8 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### 注目: 完全な学習シナリオ
**学習チャプターに対応した本番環境対応アプリケーションテンプレート**

| テンプレート | 学習チャプター | 複雑度 | 主な学習内容 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | 基本的な AI デプロイパターン |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | Azure AI Search を使用した RAG 実装 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapter 4 | ⭐⭐ | ドキュメントインテリジェンスの統合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | エージェントフレームワークと関数呼び出し |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐ | エンタープライズ AI オーケストレーション |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | 顧客および在庫エージェントを含むマルチエージェントアーキテクチャ |

### 例の種類別学習

#### シンプルなアプリケーション (チャプター 1-2)
- [Simple Web App](../../examples/simple-web-app) - 基本的なデプロイパターン
- [Static Website](../../examples/static-site) - 静的コンテンツのデプロイ
- [Basic API](../../examples/basic-api) - REST API のデプロイ

#### データベース統合 (チャプター 3-4)  
- [Database App](../../examples/database-app) - データベース接続パターン
- [Data Processing](../../examples/data-processing) - ETL ワークフローのデプロイ

#### 高度なパターン (チャプター 4-8)
- [Container Apps](../../examples/container-app) - コンテナ化されたデプロイ
- [Microservices](../../examples/microservices) - マルチサービスアーキテクチャ  
- [Enterprise Solutions](../../examples/enterprise) - 本番環境対応のパターン

### 外部テンプレートコレクション
- [**Azure-Samples AZD Templates**](https://github.com/Azure-Samples/azd-templates) - Microsoft の公式サンプル
- [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) - コミュニティ提供のテンプレート
- [**Examples Directory**](examples/README.md) - 詳細な説明付きのローカル学習例

---

## 📚 学習リソース & 参考資料

### クイックリファレンス
- [**コマンドチートシート**](resources/cheat-sheet.md) - チャプター別に整理された重要な azd コマンド
- [**用語集**](resources/glossary.md) - Azure と azd の用語  
- [**FAQ**](resources/faq.md) - 学習チャプター別のよくある質問
- [**学習ガイド**](resources/study-guide.md) - 包括的な練習問題

### 実践的なワークショップ
- [**AI ワークショップラボ**](docs/ai-foundry/ai-workshop-lab.md) - AI ソリューションを AZD でデプロイ可能にする (2-3 時間)
- [**インタラクティブワークショップガイド**](workshop/README.md) - MkDocs と DevContainer 環境を活用したブラウザベースのワークショップ
- [**構造化された学習パス**](../../workshop/docs/instructions) - 発見 → デプロイ → カスタマイズの 7 ステップガイド付き演習
- [**AZD 初心者向けワークショップ**](workshop/README.md) - GitHub Codespaces 統合を含む完全なハンズオンワークショップ教材

### 外部学習リソース
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🎓 コース完了 & 認定

### 進捗追跡
各チャプターを通じて学習進捗を追跡:

- [ ] **チャプター 1**: 基礎 & クイックスタート ✅
- [ ] **チャプター 2**: AI ファースト開発 ✅  
- [ ] **チャプター 3**: 設定 & 認証 ✅
- [ ] **チャプター 4**: コードとしてのインフラ & デプロイ ✅
- [ ] **チャプター 5**: マルチエージェント AI ソリューション ✅
- [ ] **チャプター 6**: デプロイ前の検証 & 計画 ✅
- [ ] **チャプター 7**: トラブルシューティング & デバッグ ✅
- [ ] **チャプター 8**: 本番環境 & エンタープライズパターン ✅

### 学習の確認
各チャプターを完了した後、以下を通じて知識を確認:
1. **実践演習**: チャプターのハンズオンデプロイを完了
2. **知識チェック**: チャプターの FAQ セクションを確認
3. **コミュニティディスカッション**: Azure Discord で経験を共有
4. **次のチャプター**: 次の複雑度レベルに進む

### コース完了のメリット
すべてのチャプターを完了すると、以下を達成できます:
- **本番環境の経験**: 実際の AI アプリケーションを Azure にデプロイ
- **プロフェッショナルスキル**: エンタープライズ対応のデプロイ能力  
- **コミュニティ認知**: Azure 開発者コミュニティの積極的なメンバー
- **キャリアの向上**: 需要の高い AZD と AI デプロイの専門知識

---

## 🤝 コミュニティ & サポート

### ヘルプ & サポート
- **技術的な問題**: [バグ報告と機能リクエスト](https://github.com/microsoft/azd-for-beginners/issues)
- **学習に関する質問**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure)
- **AI 特化のヘルプ**: AZD + AI Foundry の議論のため [#Azure チャンネル](https://discord.gg/microsoft-azure) に参加
- **ドキュメント**: [公式 Azure Developer CLI ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Azure AI Foundry Discord のコミュニティインサイト

**#Azure チャンネルの最近の投票結果:**
- **45%** の開発者が AI ワークロードに AZD を使用したいと回答
- **主な課題**: マルチサービスデプロイ、資格情報管理、本番環境対応  
- **最も要望が多い**: AI 特化のテンプレート、トラブルシューティングガイド、ベストプラクティス

**コミュニティに参加して以下を実現:**
- AZD + AI の経験を共有し、ヘルプを得る
- 新しい AI テンプレートの早期プレビューにアクセス
- AI デプロイのベストプラクティスに貢献
- 将来の AI + AZD 機能開発に影響を与える

### コースへの貢献
貢献を歓迎します！詳細は [Contributing Guide](CONTRIBUTING.md) をご覧ください:
- **コンテンツの改善**: 既存のチャプターや例を強化
- **新しい例**: 実際のシナリオやテンプレートを追加  
- **翻訳**: 多言語サポートの維持を支援
- **バグ報告**: 正確性と明確性を向上
- **コミュニティ基準**: 包括的なコミュニティガイドラインに従う

---

## 📄 コース情報

### ライセンス
このプロジェクト
### 関連するMicrosoft学習リソース

私たちのチームは、他にも包括的な学習コースを提供しています：

- [Model Context Protocol (MCP) 初心者向け](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AIエージェント初心者向け](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [.NETを使用した生成AI初心者向け](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [生成AI初心者向け](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Javaを使用した生成AI初心者向け](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML初心者向け](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [データサイエンス初心者向け](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI初心者向け](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [サイバーセキュリティ初心者向け](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Web開発初心者向け](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT初心者向け](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [XR開発初心者向け](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [GitHub Copilotを活用したAIペアプログラミングの習得](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [C#/.NET開発者向けGitHub Copilotの習得](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [自分で選ぶCopilotの冒険](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

## 🗺️ コースナビゲーション

**🚀 学習を始める準備はできましたか？**

**初心者**: [第1章: 基礎とクイックスタート](../..)から始めましょう  
**AI開発者**: [第2章: AIファースト開発](../..)に進みましょう  
**経験豊富な開発者**: [第3章: 設定と認証](../..)から始めましょう

**次のステップ**: [第1章 - AZDの基本を始める](docs/getting-started/azd-basics.md) →

---

