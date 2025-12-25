<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "05c30c9e5ed7951c72855108c6788034",
  "translation_date": "2025-12-25T01:01:04+00:00",
  "source_file": "README.md",
  "language_code": "ja"
}
-->
# AZD 初心者向け: 構造化された学習の旅

![AZD初心者向け](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.ja.png) 

[![GitHub ウォッチャー](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub フォーク](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub スター](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## このコースの始め方

以下のステップに従って AZD の学習を始めてください:

1. **リポジトリをフォークする**: Click [![GitHub フォーク](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **リポジトリをクローンする**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **コミュニティに参加する**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) 専門家のサポートのために
4. **学習パスを選択する**: 以下からご自身の経験レベルに合った章を選んでください

### マルチ言語サポート

#### 自動翻訳（常に最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[アラビア語](../ar/README.md) | [ベンガル語](../bn/README.md) | [ブルガリア語](../bg/README.md) | [ビルマ語（ミャンマー）](../my/README.md) | [中国語（簡体）](../zh/README.md) | [中国語（繁体、香港）](../hk/README.md) | [中国語（繁体、マカオ）](../mo/README.md) | [中国語（繁体、台湾）](../tw/README.md) | [クロアチア語](../hr/README.md) | [チェコ語](../cs/README.md) | [デンマーク語](../da/README.md) | [オランダ語](../nl/README.md) | [エストニア語](../et/README.md) | [フィンランド語](../fi/README.md) | [フランス語](../fr/README.md) | [ドイツ語](../de/README.md) | [ギリシャ語](../el/README.md) | [ヘブライ語](../he/README.md) | [ヒンディー語](../hi/README.md) | [ハンガリー語](../hu/README.md) | [インドネシア語](../id/README.md) | [イタリア語](../it/README.md) | [日本語](./README.md) | [カンナダ語](../kn/README.md) | [韓国語](../ko/README.md) | [リトアニア語](../lt/README.md) | [マレー語](../ms/README.md) | [マラヤーラム語](../ml/README.md) | [マラーティー語](../mr/README.md) | [ネパール語](../ne/README.md) | [ナイジェリア・ピジン語](../pcm/README.md) | [ノルウェー語](../no/README.md) | [ペルシャ語（ファールシ）](../fa/README.md) | [ポーランド語](../pl/README.md) | [ポルトガル語（ブラジル）](../br/README.md) | [ポルトガル語（ポルトガル）](../pt/README.md) | [パンジャブ語（グルムキー）](../pa/README.md) | [ルーマニア語](../ro/README.md) | [ロシア語](../ru/README.md) | [セルビア語（キリル）](../sr/README.md) | [スロバキア語](../sk/README.md) | [スロベニア語](../sl/README.md) | [スペイン語](../es/README.md) | [スワヒリ語](../sw/README.md) | [スウェーデン語](../sv/README.md) | [タガログ語（フィリピノ）](../tl/README.md) | [タミル語](../ta/README.md) | [テルグ語](../te/README.md) | [タイ語](../th/README.md) | [トルコ語](../tr/README.md) | [ウクライナ語](../uk/README.md) | [ウルドゥー語](../ur/README.md) | [ベトナム語](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## コース概要

段階的な学習を目的とした構造化された章を通じて Azure Developer CLI (azd) を習得します。**Microsoft Foundry 統合による AI アプリケーションのデプロイに特に重点を置いています。**

### なぜこのコースが現代の開発者に不可欠なのか

Microsoft Foundry の Discord コミュニティの見解に基づくと、**開発者の45%がAIワークロードにAZDを使用したい**と考えていますが、以下の課題に直面しています:
- 複雑なマルチサービスのAIアーキテクチャ
- 本番環境でのAIデプロイのベストプラクティス  
- Azure AIサービスの統合と設定
- AIワークロードのコスト最適化
- AI特有のデプロイ課題のトラブルシューティング

### 学習目標

この構造化されたコースを修了すると、以下ができるようになります:
- **AZDの基本を習得する**: コア概念、インストール、設定
- **AIアプリケーションをデプロイする**: Microsoft Foundry サービスとAZDを使用
- **Infrastructure as Codeを実践する**: BicepテンプレートでAzureリソースを管理
- **デプロイのトラブルシューティング**: 一般的な問題を解決しデバッグする
- **本番向けに最適化する**: セキュリティ、スケーリング、監視、コスト管理
- **マルチエージェントソリューションを構築する**: 複雑なAIアーキテクチャをデプロイ

## 📚 学習章

*経験レベルと目標に基づいて学習パスを選んでください*

### 🚀 第1章: 基礎とクイックスタート
**前提条件**: Azure サブスクリプション、基本的なコマンドラインの知識  
**所要時間**: 30〜45分  
**難易度**: ⭐

#### この章で学ぶこと
- Azure Developer CLI の基本の理解
- 使用するプラットフォームへの AZD インストール
- 最初のデプロイの成功

#### 学習リソース
- **🎯 ここから始める**: [Azure Developer CLIとは？](../..)
- **📖 理論**: [AZD Basics](docs/getting-started/azd-basics.md) - コア概念と用語
- **⚙️ セットアップ**: [Installation & Setup](docs/getting-started/installation.md) - プラットフォーム別ガイド
- **🛠️ ハンズオン**: [Your First Project](docs/getting-started/first-project.md) - ステップバイステップのチュートリアル
- **📋 クイックリファレンス**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### 実践演習
```bash
# インストールの簡易チェック
azd version

# 最初のアプリケーションをデプロイする
azd init --template todo-nodejs-mongo
azd up
```

**💡 章の成果**: AZD を使ってシンプルな Web アプリケーションを Azure に正常にデプロイする

**✅ 成功の検証:**
```bash
# 第1章を終えたら、次のことができるようになります:
azd version              # インストールされているバージョンを表示します
azd init --template todo-nodejs-mongo  # プロジェクトを初期化します
azd up                  # Azure にデプロイします
azd show                # 実行中のアプリの URL を表示します
# アプリケーションがブラウザで開いて動作します
azd down --force --purge  # リソースをクリーンアップします
```

**📊 所要時間:** 30〜45分  
**📈 修了後のスキルレベル:** 基本的なアプリケーションを自分でデプロイできる

**✅ 成功の検証:**
```bash
# 第1章を完了すると、次のことができるようになります:
azd version              # インストールされているバージョンを表示します
azd init --template todo-nodejs-mongo  # プロジェクトを初期化します
azd up                  # Azure にデプロイします
azd show                # 実行中のアプリの URL を表示します
# アプリケーションがブラウザで開き、正常に動作します
azd down --force --purge  # リソースをクリーンアップします
```

**📊 所要時間:** 30〜45分  
**📈 修了後のスキルレベル:** 基本的なアプリケーションを自分でデプロイできる

---

### 🤖 第2章: AIファースト開発（AI開発者に推奨）
**前提条件**: 第1章を完了していること  
**所要時間**: 1〜2時間  
**難易度**: ⭐⭐

#### この章で学ぶこと
- AZD と Microsoft Foundry の統合
- AI駆動アプリケーションのデプロイ
- AIサービスの設定の理解

#### 学習リソース
- **🎯 ここから始める**: [Microsoft Foundry Integration](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 パターン**: [AI Model Deployment](docs/microsoft-foundry/ai-model-deployment.md) - AIモデルのデプロイと管理
- **🛠️ ワークショップ**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - AIソリューションをAZD対応にする
- **🎥 インタラクティブガイド**: [Workshop Materials](workshop/README.md) - MkDocs と DevContainer 環境によるブラウザベースの学習
- **📋 テンプレート**: [Microsoft Foundry Templates](../..)
- **📝 例**: [AZD Deployment Examples](examples/README.md)

#### 実践演習
```bash
# 最初のAIアプリケーションをデプロイする
azd init --template azure-search-openai-demo
azd up

# 追加のAIテンプレートを試す
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 章の成果**: RAG 機能を備えた AI チャットアプリケーションをデプロイおよび構成する

**✅ 成功の検証:**
```bash
# 第2章の後で、次のことができるようになります:
azd init --template azure-search-openai-demo
azd up
# AIチャットインターフェースをテストする
# 質問をして、出典付きのAIによる回答を得る
# 検索統合が機能することを確認する
azd monitor  # Application Insights にテレメトリが表示されていることを確認する
azd down --force --purge
```

**📊 所要時間:** 1〜2時間  
**📈 修了後のスキルレベル:** 本番対応のAIアプリケーションをデプロイ・構成できる  
**💰 コスト認識:** 開発環境で月額約 $80〜150、プロダクションで月額約 $300〜3,500 を理解する

#### 💰 AIデプロイのコストに関する考慮事項

**開発環境（推定 $80〜150/月）:**
- Azure OpenAI（従量課金）: $0〜50/月（トークン使用量に基づく）
- AI Search（Basic ティア）: $75/月
- Container Apps（消費ベース）: $0〜20/月
- ストレージ（Standard）: $1〜5/月

**本番環境（推定 $300〜3,500+/月）:**
- Azure OpenAI（安定したパフォーマンスのための PTU）: $3,000+/月 OR 従量課金（高ボリューム時）
- AI Search（Standard ティア）: $250/月
- Container Apps（専用）: $50〜100/月
- Application Insights: $5〜50/月
- ストレージ（Premium）: $10〜50/月

**💡 コスト最適化のヒント:**
- 学習用途には **Free Tier** の Azure OpenAI を使用する（50,000 トークン/月を含む）
- `azd down` を実行して、開発していないときにリソースを解放する
- まずは消費ベースの請求で始め、本番のみで PTU にアップグレードする
- `azd provision --preview` を使ってデプロイ前にコストを見積もる
- オートスケーリングを有効にする: 実際の使用分のみ支払う

**コスト監視:**
```bash
# 推定月額費用を確認する
azd provision --preview

# Azure ポータルで実際のコストを監視する
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第3章: 設定と認証
**前提条件**: 第1章を完了していること  
**所要時間**: 45〜60分  
**難易度**: ⭐⭐

#### この章で学ぶこと
- 環境の設定と管理
- 認証とセキュリティのベストプラクティス
- リソースの命名と整理

#### 学習リソース
- **📖 設定**: [Configuration Guide](docs/getting-started/configuration.md) - 環境のセットアップ
- **🔐 セキュリティ**: [Authentication patterns and managed identity](docs/getting-started/authsecurity.md) - 認証パターン
- **📝 例**: [Database App Example](examples/database-app/README.md) - AZD データベースの例

#### 実践演習
- 複数の環境（dev、staging、prod）を設定する
- マネージドID認証を設定する
- 環境別の設定を実装する

**💡 章の成果**: 適切な認証とセキュリティで複数の環境を管理できるようになる

---

### 🏗️ 第4章: Infrastructure as Code とデプロイ
**前提条件**: 第1〜3章を完了していること  
**所要時間**: 1〜1.5時間  
**難易度**: ⭐⭐⭐

#### この章で学ぶこと
- 高度なデプロイパターン
- Bicep を用いた Infrastructure as Code
- リソースプロビジョニングの戦略

#### 学習リソース
- **📖 デプロイ**: [Deployment Guide](docs/deployment/deployment-guide.md) - 完全なワークフロー
- **🏗️ プロビジョニング**: [Provisioning Resources](docs/deployment/provisioning.md) - Azure リソース管理
- **📝 例**: [Container App Example](../../examples/container-app) - コンテナ化されたデプロイ

#### 実践演習
- カスタム Bicep テンプレートを作成する
- マルチサービスアプリケーションをデプロイする
- ブルーグリーンデプロイ戦略を実装する

**💡 章の成果**: カスタムインフラテンプレートを使って複雑なマルチサービスアプリケーションをデプロイする

---

### 🎯 第5章: マルチエージェントAIソリューション（上級）
**前提条件**: 第1〜2章を完了していること  
**所要時間**: 2〜3時間  
**難易度**: ⭐⭐⭐⭐

#### この章で学ぶこと
- マルチエージェントのアーキテクチャパターン
- エージェントのオーケストレーションと調整
- 本番対応のAIデプロイ

#### 学習リソース
- **🤖 注目プロジェクト**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - 完全な実装
- **🛠️ ARM テンプレート**: [ARM テンプレート パッケージ](../../examples/retail-multiagent-arm-template) - ワンクリック展開
- **📖 アーキテクチャ**: [マルチエージェントの協調パターン](/docs/pre-deployment/coordination-patterns.md) - パターン

#### 実践演習
```bash
# 完全な小売向けマルチエージェントソリューションを展開する
cd examples/retail-multiagent-arm-template
./deploy.sh

# エージェントの構成を探索する
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 章の成果**: 顧客エージェントと在庫エージェントを備えた本番対応のマルチエージェントAIソリューションをデプロイおよび管理する

---

### 🔍 第6章: 展開前の検証と計画
**前提条件**: 第4章を完了していること  
**所要時間**: 1時間  
**難易度**: ⭐⭐

#### 学習内容
- 容量計画とリソース検証
- SKU選択戦略
- 事前チェックと自動化

#### 学習リソース
- **📊 計画**: [容量計画](docs/pre-deployment/capacity-planning.md) - リソース検証
- **💰 選択**: [SKU選択](docs/pre-deployment/sku-selection.md) - コスト効率の良い選択
- **✅ 検証**: [事前チェック](docs/pre-deployment/preflight-checks.md) - 自動化スクリプト

#### 実践演習
- 容量検証スクリプトを実行する
- コストのためにSKU選択を最適化する
- 自動化された展開前チェックを実装する

**💡 章の成果**: 実行前にデプロイを検証し最適化する

---

### 🚨 第7章: トラブルシューティングとデバッグ
**前提条件**: 任意のデプロイ章を完了していること  
**所要時間**: 1〜1.5時間  
**難易度**: ⭐⭐

#### 学習内容
- 体系的なデバッグ手法
- よくある問題と解決策
- AI特有のトラブルシューティング

#### 学習リソース
- **🔧 よくある問題**: [よくある問題](docs/troubleshooting/common-issues.md) - FAQと解決策
- **🕵️ デバッグ**: [デバッグガイド](docs/troubleshooting/debugging.md) - ステップバイステップの戦略
- **🤖 AIの問題**: [AI特有のトラブルシューティング](docs/troubleshooting/ai-troubleshooting.md) - AIサービスの問題

#### 実践演習
- デプロイ失敗を診断する
- 認証の問題を解決する
- AIサービスの接続問題をデバッグする

**💡 章の成果**: 一般的なデプロイの問題を自力で診断して解決する

---

### 🏢 第8章: 本番およびエンタープライズパターン
**前提条件**: 第1章〜第4章を完了していること  
**所要時間**: 2〜3時間  
**難易度**: ⭐⭐⭐⭐

#### 学習内容
- 本番デプロイ戦略
- エンタープライズ向けセキュリティパターン
- 監視とコスト最適化

#### 学習リソース
- **🏭 本番**: [本番AIベストプラクティス](docs/microsoft-foundry/production-ai-practices.md) - エンタープライズ向けパターン
- **📝 例**: [マイクロサービスの例](../../examples/microservices) - 複雑なアーキテクチャ
- **📊 監視**: [Application Insights 統合](docs/pre-deployment/application-insights.md) - 監視

#### 実践演習
- エンタープライズ向けセキュリティパターンを実装する
- 包括的な監視を設定する
- 適切なガバナンスのもとで本番にデプロイする

**💡 章の成果**: フルに本番対応したエンタープライズ向けアプリケーションをデプロイする

---

## 🎓 ワークショップ概要: 実践型学習体験

> **⚠️ ワークショップの状態: 開発中**  
> ワークショップ資料は現在開発と洗練が進行中です。コアモジュールは機能していますが、いくつかの高度なセクションは未完成です。すべてのコンテンツを完成させるために積極的に作業しています。[進捗を追跡 →](workshop/README.md)

### インタラクティブなワークショップ資料
**ブラウザベースのツールとガイド付き演習による包括的な実践学習**

ワークショップ資料は、上記の章ベースのカリキュラムを補完する構造化されたインタラクティブな学習体験を提供します。ワークショップは、自己学習とインストラクター主導のセッションの両方を想定して設計されています。

#### 🛠️ ワークショップの特徴
- **ブラウザベースのインターフェース**: 検索、コピー、テーマ機能を備えたMkDocsベースのワークショップ
- **GitHub Codespaces 統合**: ワンクリックで開発環境をセットアップ
- **構造化された学習パス**: 7ステップのガイド付き演習（合計3.5時間）
- **発見 → 展開 → カスタマイズ**: 段階的な方法論
- **インタラクティブなDevContainer環境**: あらかじめ設定されたツールと依存関係

#### 📚 ワークショップ構成
ワークショップは**発見 → 展開 → カスタマイズ**の方法論に従います:

1. **発見フェーズ（45分）**
   - Microsoft Foundryのテンプレートとサービスを探る
   - マルチエージェントのアーキテクチャパターンを理解する
   - デプロイ要件と前提条件を確認する

2. **展開フェーズ（2時間）**
   - AZDを使ったAIアプリケーションのハンズオンデプロイ
   - Azure AIサービスとエンドポイントを構成する
   - セキュリティと認証のパターンを実装する

3. **カスタマイズフェーズ（45分）**
   - 特定のユースケース向けにアプリケーションを修正する
   - 本番デプロイ向けに最適化する
   - 監視とコスト管理を実装する

#### 🚀 ワークショップの始め方
```bash
# オプション 1: GitHub Codespaces（推奨）
# リポジトリ内で「Code」→「Create codespace on main」をクリックします

# オプション 2: ローカル開発
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md のセットアップ手順に従ってください
```

#### 🎯 ワークショップの学習成果
ワークショップを完了すると、参加者は以下を習得します:
- **本番用AIアプリケーションをデプロイ**: Microsoft Foundryサービスと共にAZDを使用する
- **マルチエージェントアーキテクチャを習得**: 協調するAIエージェントソリューションを実装する
- **セキュリティのベストプラクティスを実装**: 認証とアクセス制御を構成する
- **スケールに最適化**: コスト効率と性能を考慮したデプロイを設計する
- **デプロイのトラブルシューティング**: 一般的な問題を自主的に解決する

#### 📖 ワークショップ資料
- **🎥 インタラクティブガイド**: [ワークショップ資料](workshop/README.md) - ブラウザベースの学習環境
- **📋 ステップバイステップの指示**: [ガイド付き演習](../../workshop/docs/instructions) - 詳細な手順
- **🛠️ AIワークショップラボ**: [AIワークショップラボ](docs/microsoft-foundry/ai-workshop-lab.md) - AIに焦点を当てた演習
- **💡 クイックスタート**: [ワークショップセットアップガイド](workshop/README.md#quick-start) - 環境構成

**対象**: 企業研修、大学の講義、自習、開発者ブートキャンプに最適。

---

## 📖 Azure Developer CLIとは何か？

Azure Developer CLI (azd) は、アプリケーションのAzureへの構築とデプロイのプロセスを加速する、開発者中心のコマンドラインインターフェースです。提供する機能：
- **テンプレートベースのデプロイ** - 一般的なアプリケーションパターン用の既成テンプレートを使用
- **コードとしてのインフラ** - BicepやTerraformを使ってAzureリソースを管理  
- **統合ワークフロー** - アプリケーションのプロビジョニング、デプロイ、監視をシームレスに実行
- **開発者に優しい** - 開発者の生産性と体験に最適化

### **AZD + Microsoft Foundry: AI デプロイに最適**

**なぜAZDがAIソリューションに適しているのか？** AZDはAI開発者が直面する主要な課題に対処します:
- **AI対応テンプレート** - Azure OpenAI、Cognitive Services、およびMLワークロード向けの事前構成テンプレート
- **安全なAIデプロイ** - AIサービス、APIキー、モデルエンドポイントのための組み込みセキュリティパターン  
- **本番向けAIパターン** - スケーラブルでコスト効率の良いAIアプリケーションデプロイのベストプラクティス
- **エンドツーエンドのAIワークフロー** - モデル開発から本番デプロイまで適切な監視を伴う
- **コスト最適化** - AIワークロード向けの賢いリソース割り当てとスケーリング戦略
- **Microsoft Foundry 統合** - Microsoft Foundryのモデルカタログとエンドポイントへのシームレスな接続

---

## 🎯 テンプレート＆サンプルライブラリ

### 注目: Microsoft Foundry テンプレート
**AIアプリケーションをデプロイする場合はここから始めましょう！**

> **注:** これらのテンプレートはさまざまなAIパターンを示しています。いくつかは外部のAzure Samplesで、他はローカル実装です。

| テンプレート | 章 | 難易度 | サービス | 種類 |
|----------|---------|------------|----------|------|
| [**AIチャット入門**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | 外部 |
| [**AIエージェント入門**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第2章 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| 外部 |
| [**Azure Search + OpenAI デモ**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | 外部 |
| [**OpenAI チャットアプリ クイックスタート**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | 外部 |
| [**リテール マルチエージェント ソリューション**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **ローカル** |

### 注目: 完全な学習シナリオ
**学習章にマッピングされた本番対応アプリケーションテンプレート**

| テンプレート | 学習章 | 難易度 | 主要な学び |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | 基本的なAIデプロイパターン |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | Azure AI Searchを用いたRAGの実装 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第4章 | ⭐⭐ | ドキュメントインテリジェンスの統合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | エージェントフレームワークと関数呼び出し |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐ | エンタープライズ向けAIオーケストレーション |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | 顧客エージェントと在庫エージェントを備えたマルチエージェントアーキテクチャ |

### 例による学習タイプ

> **📌 ローカルと外部の例:**  
> **ローカルの例**（このリポジトリ内）= すぐに使用可能  
> **外部の例**（Azure Samples）= リンクされたリポジトリからクローン

#### ローカルの例（すぐに使用可能）
- [**リテール マルチエージェント ソリューション**](examples/retail-scenario.md) - ARMテンプレートを使用した本番対応の完全な実装
  - マルチエージェントアーキテクチャ（顧客＋在庫エージェント）
  - 包括的な監視と評価
  - ARMテンプレートによるワンクリック展開

#### ローカルの例 - コンテナアプリケーション（第2章〜第5章）
**このリポジトリにある包括的なコンテナデプロイの例:**
- [**コンテナアプリの例**](examples/container-app/README.md) - コンテナ化されたデプロイの完全ガイド
  - [シンプルな Flask API](../../examples/container-app/simple-flask-api) - scale-to-zero対応の基本的なREST API
  - [マイクロサービスアーキテクチャ](../../examples/container-app/microservices) - 本番対応のマルチサービスデプロイ
  - クイックスタート、本番、上級のデプロイパターン
  - 監視、セキュリティ、コスト最適化のガイダンス

#### 外部の例 - シンプルアプリケーション（第1章〜第2章）
**開始するにはこれらのAzure Samplesリポジトリをクローンしてください:**
- [シンプルなWebアプリ - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本的なデプロイパターン
- [静的サイト - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 静的コンテンツのデプロイ
- [コンテナアプリ - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST APIのデプロイ

#### 外部の例 - データベース統合（第3章〜第4章）  
- [データベースアプリ - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - データベース接続パターン
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - サーバーレスデータワークフロー

#### 外部の例 - 高度なパターン（第4章〜第8章）
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - マルチサービスアーキテクチャ
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - バックグラウンド処理  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - 本番対応のMLパターン

### 外部テンプレートコレクション
- [**公式AZDテンプレートギャラリー**](https://azure.github.io/awesome-azd/) - 公式およびコミュニティテンプレートのキュレーションコレクション
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn のテンプレートドキュメント
- [**Examples Directory**](examples/README.md) - 詳細な説明付きのローカル学習サンプル

---

## 📚 学習リソースと参考資料

### クイックリファレンス
- [**コマンドチートシート**](resources/cheat-sheet.md) - 章ごとに整理された重要な azd コマンド
- [**用語集**](resources/glossary.md) - Azure と azd の用語  
- [**よくある質問**](resources/faq.md) - 学習章ごとに整理されたよくある質問
- [**学習ガイド**](resources/study-guide.md) - 包括的な演習

### ハンズオン ワークショップ
- [**AI ワークショップラボ**](docs/microsoft-foundry/ai-workshop-lab.md) - AI ソリューションを AZD でデプロイ可能にする（2～3時間）
- [**インタラクティブ ワークショップ ガイド**](workshop/README.md) - ブラウザベースのワークショップ（MkDocs と DevContainer 環境）
- [**体系的な学習パス**](../../workshop/docs/instructions) -7-step guided exercises (Discovery → Deployment → Customization)
- [**AZD 初心者向けワークショップ**](workshop/README.md) - GitHub Codespaces 統合を備えた完全なハンズオン教材

### 外部学習リソース
- [Azure Developer CLI ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure アーキテクチャ センター](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 価格計算ツール](https://azure.microsoft.com/pricing/calculator/)
- [Azure ステータス](https://status.azure.com/)

---

## 🔧 クイックトラブルシューティングガイド

**初心者が直面する一般的な問題と即時の解決策：**

### ❌ "azd: コマンドが見つかりません"

```bash
# 先に AZD をインストールしてください
# Windows（PowerShell）:
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# インストールを確認する
azd version
```

### ❌ "No subscription found" または "Subscription not set"

```bash
# 利用可能なサブスクリプションを一覧表示
az account list --output table

# 既定のサブスクリプションを設定
az account set --subscription "<subscription-id-or-name>"

# AZD 環境用に設定
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# 検証
az account show
```

### ❌ "InsufficientQuota" または "Quota exceeded"

```bash
# 別の Azure リージョンを試してください
azd env set AZURE_LOCATION "westus2"
azd up

# または開発環境ではより小さい SKU を使用する
# infra/main.parameters.json を編集:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" が途中で失敗する

```bash
# オプション 1: クリーンして再試行
azd down --force --purge
azd up

# オプション 2: インフラだけを修正する
azd provision

# オプション 3: 詳細ログを確認する
azd show
azd logs
```

### ❌ "Authentication failed" または "Token expired"

```bash
# 再認証する
az logout
az login

azd auth logout
azd auth login

# 認証を検証する
az account show
```

### ❌ "Resource already exists" または 名前の競合

```bash
# AZDは一意の名前を生成しますが、競合が発生した場合:
azd down --force --purge

# 新しい環境で再試行してください
azd env new dev-v2
azd up
```

### ❌ テンプレートのデプロイに時間がかかりすぎる

**通常の待ち時間:**
- シンプルな Web アプリ: 5-10 分
- データベースを伴うアプリ: 10-15 分
- AI アプリケーション: 15-25 分（OpenAI のプロビジョニングは遅い）

```bash
# 進捗を確認する
azd show

# 30分以上行き詰まっている場合は、Azure ポータルを確認してください:
azd monitor
# 失敗したデプロイメントを探す
```

### ❌ "Permission denied" または "Forbidden"

```bash
# Azure のロールを確認してください
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 少なくとも "Contributor" ロールが必要です
# Azure 管理者に次を付与するよう依頼してください:
# - Contributor（リソース用）
# - User Access Administrator（ロール割り当て用）
```

### ❌ デプロイされたアプリケーションの URL が見つからない

```bash
# すべてのサービスエンドポイントを表示する
azd show

# または Azure ポータルを開く
azd monitor

# 特定のサービスを確認する
azd env get-values
# *_URL 変数を探す
```

### 📚 完全なトラブルシューティング リソース

- **一般的な問題ガイド:** [詳細な解決策](docs/troubleshooting/common-issues.md)
- **AI 専用の問題:** [AI のトラブルシューティング](docs/troubleshooting/ai-troubleshooting.md)
- **デバッグガイド:** [ステップバイステップのデバッグ](docs/troubleshooting/debugging.md)
- **ヘルプを得る:** [Azure の Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 クイックトラブルシューティングガイド

**初心者が直面する一般的な問題と即時の解決策：**

<details>
<summary><strong>❌ "azd: コマンドが見つかりません"</strong></summary>

```bash
# まず AZD をインストールしてください
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# インストールを確認してください
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" または "Subscription not set"</strong></summary>

```bash
# 利用可能なサブスクリプションを一覧表示
az account list --output table

# デフォルトのサブスクリプションを設定
az account set --subscription "<subscription-id-or-name>"

# AZD 環境用に設定
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# 検証
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" または "Quota exceeded"</strong></summary>

```bash
# 別の Azure リージョンを試す
azd env set AZURE_LOCATION "westus2"
azd up

# または開発ではより小さい SKU を使用する
# infra/main.parameters.json を編集する:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" が途中で失敗する</strong></summary>

```bash
# オプション 1: クリーンアップして再試行する
azd down --force --purge
azd up

# オプション 2: インフラだけ修正する
azd provision

# オプション 3: 詳細ログを確認する
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" または "Token expired"</strong></summary>

```bash
# 再認証
az logout
az login

azd auth logout
azd auth login

# 認証を検証する
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" または 名前の競合</strong></summary>

```bash
# AZD は一意の名前を生成しますが、競合が発生した場合:
azd down --force --purge

# その場合は新しい環境で再試行する
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ テンプレートのデプロイに時間がかかりすぎる</strong></summary>

**通常の待ち時間:**
- シンプルな Web アプリ: 5-10 分
- データベースを伴うアプリ: 10-15 分
- AI アプリケーション: 15-25 分（OpenAI のプロビジョニングは遅い）

```bash
# 進捗を確認する
azd show

# 30分以上進まない場合は、Azure ポータルを確認する:
azd monitor
# 失敗したデプロイを探す
```
</details>

<details>
<summary><strong>❌ "Permission denied" または "Forbidden"</strong></summary>

```bash
# Azure のロールを確認してください
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 少なくとも「Contributor」ロールが必要です
# Azure 管理者に次を付与するよう依頼してください:
# - Contributor (リソース用)
# - User Access Administrator (ロール割り当て用)
```
</details>

<details>
<summary><strong>❌ デプロイされたアプリケーションの URL が見つからない</strong></summary>

```bash
# すべてのサービスエンドポイントを表示する
azd show

# または Azure ポータルを開く
azd monitor

# 特定のサービスを確認する
azd env get-values
# *_URL 変数を探す
```
</details>

### 📚 完全なトラブルシューティング リソース

- **一般的な問題ガイド:** [詳細な解決策](docs/troubleshooting/common-issues.md)
- **AI 専用の問題:** [AI のトラブルシューティング](docs/troubleshooting/ai-troubleshooting.md)
- **デバッグガイド:** [ステップバイステップのデバッグ](docs/troubleshooting/debugging.md)
- **ヘルプを得る:** [Azure の Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 コース完了と認定

### 進捗追跡
各章の学習進捗を追跡します:

- [ ] **第1章**: 基礎とクイックスタート ✅
- [ ] **第2章**: AIファースト開発 ✅  
- [ ] **第3章**: 構成と認証 ✅
- [ ] **第4章**: コードによるインフラストラクチャとデプロイ ✅
- [ ] **第5章**: マルチエージェントAIソリューション ✅
- [ ] **第6章**: 事前デプロイ検証と計画 ✅
- [ ] **第7章**: トラブルシューティングとデバッグ ✅
- [ ] **第8章**: 本番運用とエンタープライズパターン ✅

### 学習の検証
各章を完了した後、以下で知識を確認してください:
1. **実践演習**: 章のハンズオンデプロイを完了する
2. **知識チェック**: 該当章のよくある質問セクションを確認する
3. **コミュニティでの議論**: Azure の Discord で経験を共有する
4. **次の章へ**: より高い難易度へ進む

### コース完了の利点
すべての章を完了すると、次のことが得られます:
- **本番環境での経験**: Azure に実際の AI アプリケーションをデプロイ
- **プロフェッショナルスキル**: エンタープライズ対応のデプロイ能力  
- **コミュニティ認知**: Azure 開発者コミュニティのアクティブメンバー
- **キャリア向上**: 需要の高い AZD および AI デプロイの専門知識

---

## 🤝 コミュニティとサポート

### ヘルプとサポート
- **技術的な問題**: [バグ報告と機能要望を送る](https://github.com/microsoft/azd-for-beginners/issues)
- **学習に関する質問**: [Microsoft Azure の Discord コミュニティ](https://discord.gg/microsoft-azure) と [![Microsoft Foundry の Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 専用のヘルプ**: Join the [![Microsoft Foundry の Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **ドキュメント**: [公式 Azure Developer CLI ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord からのコミュニティの洞察

**#Azure チャンネルからの最近の投票結果:**
- 開発者の **45%** が AI ワークロードに AZD を使いたい
- **主な課題**: マルチサービスのデプロイ、資格情報管理、本番準備  
- **最も要望されたもの**: AI 専用テンプレート、トラブルシューティングガイド、ベストプラクティス

**コミュニティに参加して:**
- AZD と AI の経験を共有して支援を受ける
- 新しい AI テンプレートの早期プレビューにアクセスする
- AI デプロイのベストプラクティスに貢献する
- 将来の AI と AZD の機能開発に影響を与える

### コースへの貢献
貢献を歓迎します！ 詳細は [貢献ガイド](CONTRIBUTING.md) をお読みください:
- **コンテンツの改善**: 既存の章や例を強化する
- **新しい例**: 実世界のシナリオやテンプレートを追加する  
- **翻訳**: 多言語サポートの維持を支援する
- **バグ報告**: 正確性と明確性を向上させる
- **コミュニティ基準**: 包摂的なコミュニティガイドラインに従う

---

## 📄 コース情報

### ライセンス
このプロジェクトは MIT ライセンスの下でライセンスされています。詳細は [LICENSE](../../LICENSE) ファイルを参照してください。

### 関連する Microsoft 学習リソース

私たちのチームは他の包括的な学習コースも制作しています:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j 初心者向け](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js 初心者向け](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

---

### Azure / Edge / MCP / エージェント
[![AZD 初心者向け](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI 初心者向け](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP 初心者向け](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI エージェント初心者向け](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### 生成AIシリーズ
[![生成AI 初心者向け](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![生成AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![生成AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![生成AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### コア学習
[![機械学習 初心者向け](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![データサイエンス 初心者向け](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![初心者向け AI](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![初心者向けサイバーセキュリティ](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![初心者向けWeb開発](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![初心者向けIoT](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![初心者向けXR開発](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot シリーズ
[![AI ペアプログラミング向け Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET向け Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot アドベンチャー](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ コースナビゲーション

**🚀 学習を始める準備はできていますか？**

**初心者**: [第1章: 基礎とクイックスタート](../..) から始めてください  
**AI開発者**: [第2章: AIファースト開発](../..) に進んでください  
**経験のある開発者**: [第3章: 設定と認証](../..) から始めてください

**次のステップ**: [第1章を始める - AZDの基本](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責事項：
この文書はAI翻訳サービス「Co‑op Translator」（https://github.com/Azure/co-op-translator）を用いて翻訳されました。正確性には努めておりますが、自動翻訳には誤りや不正確な表現が含まれることがあります。原文（原語）を正式かつ権威ある情報源と見なしてください。重要な情報については、専門家による人間の翻訳を推奨します。本翻訳の使用により生じた誤解や誤った解釈について、当方は一切の責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->