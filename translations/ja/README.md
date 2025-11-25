<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6a804be263d09a0fd6f36d6ab251707a",
  "translation_date": "2025-11-25T10:36:13+00:00",
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
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## このコースの始め方

以下のステップに従ってAZD学習の旅を始めましょう:

1. **リポジトリをフォークする**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork) をクリック
2. **リポジトリをクローンする**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **コミュニティに参加する**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) で専門家のサポートを受ける
4. **学習パスを選ぶ**: 以下の章から自分の経験レベルに合ったものを選択

### 多言語対応

#### 自動翻訳 (常に最新)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[アラビア語](../ar/README.md) | [ベンガル語](../bn/README.md) | [ブルガリア語](../bg/README.md) | [ビルマ語 (ミャンマー)](../my/README.md) | [中国語 (簡体字)](../zh/README.md) | [中国語 (繁体字, 香港)](../hk/README.md) | [中国語 (繁体字, マカオ)](../mo/README.md) | [中国語 (繁体字, 台湾)](../tw/README.md) | [クロアチア語](../hr/README.md) | [チェコ語](../cs/README.md) | [デンマーク語](../da/README.md) | [オランダ語](../nl/README.md) | [エストニア語](../et/README.md) | [フィンランド語](../fi/README.md) | [フランス語](../fr/README.md) | [ドイツ語](../de/README.md) | [ギリシャ語](../el/README.md) | [ヘブライ語](../he/README.md) | [ヒンディー語](../hi/README.md) | [ハンガリー語](../hu/README.md) | [インドネシア語](../id/README.md) | [イタリア語](../it/README.md) | [日本語](./README.md) | [カンナダ語](../kn/README.md) | [韓国語](../ko/README.md) | [リトアニア語](../lt/README.md) | [マレー語](../ms/README.md) | [マラヤーラム語](../ml/README.md) | [マラーティー語](../mr/README.md) | [ネパール語](../ne/README.md) | [ナイジェリア・ピジン語](../pcm/README.md) | [ノルウェー語](../no/README.md) | [ペルシャ語 (ファルシ)](../fa/README.md) | [ポーランド語](../pl/README.md) | [ポルトガル語 (ブラジル)](../br/README.md) | [ポルトガル語 (ポルトガル)](../pt/README.md) | [パンジャブ語 (グルムキー)](../pa/README.md) | [ルーマニア語](../ro/README.md) | [ロシア語](../ru/README.md) | [セルビア語 (キリル文字)](../sr/README.md) | [スロバキア語](../sk/README.md) | [スロベニア語](../sl/README.md) | [スペイン語](../es/README.md) | [スワヒリ語](../sw/README.md) | [スウェーデン語](../sv/README.md) | [タガログ語 (フィリピン)](../tl/README.md) | [タミル語](../ta/README.md) | [テルグ語](../te/README.md) | [タイ語](../th/README.md) | [トルコ語](../tr/README.md) | [ウクライナ語](../uk/README.md) | [ウルドゥー語](../ur/README.md) | [ベトナム語](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## コース概要

Azure Developer CLI (azd) を段階的に学べる構造化された章で習得しましょう。**Microsoft Foundryとの統合によるAIアプリケーション展開に特化しています。**

### このコースが現代の開発者にとって重要な理由

Microsoft Foundry Discordコミュニティの洞察に基づき、**開発者の45%がAIワークロードにAZDを使用したい**と考えていますが、以下の課題に直面しています:
- 複雑なマルチサービスAIアーキテクチャ
- 本番環境でのAI展開のベストプラクティス  
- Azure AIサービスの統合と設定
- AIワークロードのコスト最適化
- AI特有の展開問題のトラブルシューティング

### 学習目標

この構造化されたコースを完了することで、以下を達成できます:
- **AZDの基本を習得**: コアコンセプト、インストール、設定
- **AIアプリケーションの展開**: Microsoft Foundryサービスを使用したAZDの活用
- **コードとしてのインフラストラクチャの実装**: Bicepテンプレートを使用したAzureリソース管理
- **展開のトラブルシューティング**: 一般的な問題の解決とデバッグ
- **本番環境向けの最適化**: セキュリティ、スケーリング、監視、コスト管理
- **マルチエージェントソリューションの構築**: 複雑なAIアーキテクチャの展開

## 📚 学習章

*経験レベルと目標に基づいて学習パスを選択してください*

### 🚀 第1章: 基礎とクイックスタート
**前提条件**: Azureサブスクリプション、基本的なコマンドライン知識  
**所要時間**: 30-45分  
**難易度**: ⭐

#### 学べること
- Azure Developer CLIの基本を理解する
- 自分のプラットフォームにAZDをインストールする
- 初めての展開を成功させる

#### 学習リソース
- **🎯 ここから始める**: [Azure Developer CLIとは?](../..)
- **📖 理論**: [AZDの基本](docs/getting-started/azd-basics.md) - コアコンセプトと用語
- **⚙️ セットアップ**: [インストールとセットアップ](docs/getting-started/installation.md) - プラットフォーム別ガイド
- **🛠️ 実践**: [初めてのプロジェクト](docs/getting-started/first-project.md) - ステップバイステップのチュートリアル
- **📋 クイックリファレンス**: [コマンドチートシート](resources/cheat-sheet.md)

#### 実践演習
```bash
# クイックインストールチェック
azd version

# 最初のアプリケーションをデプロイする
azd init --template todo-nodejs-mongo
azd up
```

**💡 章の成果**: AZDを使用してAzureにシンプルなWebアプリケーションを展開することに成功

**✅ 成功の検証:**
```bash
# 第1章を完了した後、次のことができるようになります:
azd version              # インストールされているバージョンを表示
azd init --template todo-nodejs-mongo  # プロジェクトを初期化
azd up                  # Azureにデプロイ
azd show                # 実行中のアプリのURLを表示
# アプリケーションがブラウザで開き、動作する
azd down --force --purge  # リソースをクリーンアップ
```

**📊 投資時間:** 30-45分  
**📈 習得スキルレベル:** 基本的なアプリケーションを独立して展開できる

**✅ 成功の検証:**
```bash
# 第1章を完了した後、次のことができるようになります:
azd version              # インストールされているバージョンを表示
azd init --template todo-nodejs-mongo  # プロジェクトを初期化
azd up                  # Azureにデプロイ
azd show                # 実行中のアプリのURLを表示
# アプリケーションがブラウザで開き、動作する
azd down --force --purge  # リソースをクリーンアップ
```

**📊 投資時間:** 30-45分  
**📈 習得スキルレベル:** 基本的なアプリケーションを独立して展開できる

---

### 🤖 第2章: AI優先の開発 (AI開発者向け推奨)
**前提条件**: 第1章を完了していること  
**所要時間**: 1-2時間  
**難易度**: ⭐⭐

#### 学べること
- AZDとMicrosoft Foundryの統合
- AI対応アプリケーションの展開
- AIサービスの設定を理解する

#### 学習リソース
- **🎯 ここから始める**: [Microsoft Foundry統合](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 パターン**: [AIモデル展開](docs/microsoft-foundry/ai-model-deployment.md) - AIモデルの展開と管理
- **🛠️ ワークショップ**: [AIワークショップラボ](docs/microsoft-foundry/ai-workshop-lab.md) - AIソリューションをAZD対応にする
- **🎥 インタラクティブガイド**: [ワークショップ資料](workshop/README.md) - MkDocs * DevContainer環境を使用したブラウザベースの学習
- **📋 テンプレート**: [Microsoft Foundryテンプレート](../..)
- **📝 例**: [AZD展開例](examples/README.md)

#### 実践演習
```bash
# 最初のAIアプリケーションを展開する
azd init --template azure-search-openai-demo
azd up

# 追加のAIテンプレートを試す
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 章の成果**: RAG機能を備えたAI対応チャットアプリケーションを展開・設定する

**✅ 成功の検証:**
```bash
# 第2章の後、次のことができるようになります:
azd init --template azure-search-openai-demo
azd up
# AIチャットインターフェースをテストする
# 質問をして、ソース付きのAIによる回答を得る
# 検索統合が機能していることを確認する
azd monitor  # Application Insightsがテレメトリを表示していることを確認する
azd down --force --purge
```

**📊 投資時間:** 1-2時間  
**📈 習得スキルレベル:** 本番環境対応のAIアプリケーションを展開・設定できる  
**💰 コスト意識:** 開発環境で月額$80-150、運用環境で月額$300-3500のコストを理解する

#### 💰 AI展開のコスト考慮

**開発環境 (推定$80-150/月):**
- Azure OpenAI (従量課金制): $0-50/月 (トークン使用量に基づく)
- AI検索 (基本プラン): $75/月
- コンテナアプリ (従量課金制): $0-20/月
- ストレージ (標準): $1-5/月

**運用環境 (推定$300-3,500+/月):**
- Azure OpenAI (PTUで安定したパフォーマンス): $3,000+/月 または 従量課金制で高ボリューム
- AI検索 (標準プラン): $250/月
- コンテナアプリ (専用): $50-100/月
- Application Insights: $5-50/月
- ストレージ (プレミアム): $10-50/月

**💡 コスト最適化のヒント:**
- 学習には**無料プラン**のAzure OpenAIを使用 (月50,000トークン含む)
- 開発を積極的に行わない場合は `azd down` を実行してリソースを解放
- 従量課金制で開始し、本番環境ではPTUにアップグレード
- 展開前に `azd provision --preview` を使用してコストを見積もる
- 自動スケーリングを有効化: 実際の使用量に応じて支払い

**コスト監視:**
```bash
# 推定月額費用を確認する
azd provision --preview

# Azureポータルで実際の費用を監視する
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第3章: 設定と認証
**前提条件**: 第1章を完了していること  
**所要時間**: 45-60分  
**難易度**: ⭐⭐

#### 学べること
- 環境設定と管理
- 認証とセキュリティのベストプラクティス
- リソースの命名と整理

#### 学習リソース
- **📖 設定**: [設定ガイド](docs/getting-started/configuration.md) - 環境セットアップ
- **🔐 セキュリティ**: [認証パターンとマネージドID](docs/getting-started/authsecurity.md) - 認証パターン
- **📝 例**: [データベースアプリの例](examples/database-app/README.md) - AZDデータベース例

#### 実践演習
- 複数の環境 (開発、ステージング、本番) を設定
- マネージドID認証を設定
- 環境固有の設定を実装

**💡 章の成果**: 適切な認証とセキュリティを備えた複数の環境を管理する

---

### 🏗️ 第4章: コードとしてのインフラストラクチャと展開
**前提条件**: 第1章から第3章を完了していること  
**所要時間**: 1-1.5時間  
**難易度**: ⭐⭐⭐

#### 学べること
- 高度な展開パターン
- Bicepを使用したコードとしてのインフラストラクチャ
- リソースプロビジョニング戦略

#### 学習リソース
- **📖 展開**: [展開ガイド](docs/deployment/deployment-guide.md) - 完全なワークフロー
- **🏗️ プロビジョニング**: [リソースのプロビジョニング](docs/deployment/provisioning.md) - Azureリソース管理
- **📝 例**: [コンテナアプリの例](../../examples/container-app) - コンテナ化された展開

#### 実践演習
- カスタムBicepテンプレートを作成
- マルチサービスアプリケーションを展開
- ブルーグリーン展開戦略を実装

**💡 章の成果**: カスタムインフラストラクチャテンプレートを使用して複雑なマルチサービスアプリケーションを展開する

---

### 🎯 第5章: マルチエージェントAIソリューション (上級)
**前提条件**: 第1章から第2章を完了していること  
**所要時間**: 2-3時間  
**難易度**: ⭐⭐⭐⭐

#### 学べること
- マルチエージェントアーキテクチャパターン
- エージェントのオーケストレーションと調整
- 本番環境対応のAI展開

#### 学習リソース
- **🤖 注目プロジェクト**: [小売業向けマルチエージェントソリューション](examples/retail-scenario.md) - 完全な実装
- **🛠️ ARM テンプレート**: [ARM テンプレートパッケージ](../../examples/retail-multiagent-arm-template) - ワンクリックでデプロイ
- **📖 アーキテクチャ**: [マルチエージェントの調整パターン](/docs/pre-deployment/coordination-patterns.md) - パターン

#### 実践演習
```bash
# 完全な小売マルチエージェントソリューションを展開する
cd examples/retail-multiagent-arm-template
./deploy.sh

# エージェント構成を探索する
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 チャプターの成果**: 顧客エージェントと在庫エージェントを使用して、実運用可能なマルチエージェントAIソリューションをデプロイおよび管理する

---

### 🔍 チャプター6: デプロイ前の検証と計画
**前提条件**: チャプター4を完了していること  
**所要時間**: 1時間  
**難易度**: ⭐⭐

#### 学べること
- キャパシティプランニングとリソース検証
- SKU選択の戦略
- 事前チェックと自動化

#### 学習リソース
- **📊 計画**: [キャパシティプランニング](docs/pre-deployment/capacity-planning.md) - リソース検証
- **💰 選択**: [SKU選択](docs/pre-deployment/sku-selection.md) - コスト効率の良い選択
- **✅ 検証**: [事前チェック](docs/pre-deployment/preflight-checks.md) - 自動スクリプト

#### 実践演習
- キャパシティ検証スクリプトを実行する
- コスト最適化のためのSKU選択を行う
- 自動化されたデプロイ前チェックを実装する

**💡 チャプターの成果**: 実行前にデプロイを検証し最適化する

---

### 🚨 チャプター7: トラブルシューティングとデバッグ
**前提条件**: いずれかのデプロイチャプターを完了していること  
**所要時間**: 1～1.5時間  
**難易度**: ⭐⭐

#### 学べること
- 系統的なデバッグアプローチ
- よくある問題とその解決策
- AI特有のトラブルシューティング

#### 学習リソース
- **🔧 よくある問題**: [よくある問題](docs/troubleshooting/common-issues.md) - FAQと解決策
- **🕵️ デバッグ**: [デバッグガイド](docs/troubleshooting/debugging.md) - ステップバイステップの戦略
- **🤖 AIの問題**: [AI特有のトラブルシューティング](docs/troubleshooting/ai-troubleshooting.md) - AIサービスの問題

#### 実践演習
- デプロイ失敗の診断
- 認証問題の解決
- AIサービスの接続性をデバッグする

**💡 チャプターの成果**: 一般的なデプロイ問題を独自に診断し解決する

---

### 🏢 チャプター8: 本番環境とエンタープライズパターン
**前提条件**: チャプター1～4を完了していること  
**所要時間**: 2～3時間  
**難易度**: ⭐⭐⭐⭐

#### 学べること
- 本番環境へのデプロイ戦略
- エンタープライズセキュリティパターン
- モニタリングとコスト最適化

#### 学習リソース
- **🏭 本番環境**: [本番AIのベストプラクティス](docs/microsoft-foundry/production-ai-practices.md) - エンタープライズパターン
- **📝 例**: [マイクロサービスの例](../../examples/microservices) - 複雑なアーキテクチャ
- **📊 モニタリング**: [Application Insightsの統合](docs/pre-deployment/application-insights.md) - モニタリング

#### 実践演習
- エンタープライズセキュリティパターンを実装する
- 包括的なモニタリングを設定する
- 適切なガバナンスで本番環境にデプロイする

**💡 チャプターの成果**: 本番環境対応のアプリケーションを完全な機能でデプロイする

---

## 🎓 ワークショップ概要: 実践的な学習体験

> **⚠️ ワークショップのステータス: 開発中**  
> ワークショップの教材は現在開発および改良中です。主要モジュールは機能していますが、一部の高度なセクションは未完成です。すべてのコンテンツを完成させるために積極的に取り組んでいます。[進捗を追跡する →](workshop/README.md)

### インタラクティブなワークショップ教材
**ブラウザベースのツールとガイド付き演習による包括的な実践学習**

ワークショップ教材は、上記のチャプター形式のカリキュラムを補完する構造化されたインタラクティブな学習体験を提供します。このワークショップは、自己学習とインストラクター主導のセッションの両方に対応しています。

#### 🛠️ ワークショップの特徴
- **ブラウザベースのインターフェース**: MkDocsを活用したワークショップで、検索、コピー、テーマ機能を完備
- **GitHub Codespaces統合**: ワンクリックで開発環境をセットアップ
- **構造化された学習パス**: 7ステップのガイド付き演習（合計3.5時間）
- **発見 → デプロイ → カスタマイズ**: 進行型の学習方法論
- **インタラクティブなDevContainer環境**: 事前構成されたツールと依存関係

#### 📚 ワークショップ構成
ワークショップは、**発見 → デプロイ → カスタマイズ**の方法論に従います:

1. **発見フェーズ** (45分)
   - Microsoft Foundryのテンプレートとサービスを探索
   - マルチエージェントアーキテクチャパターンを理解
   - デプロイ要件と前提条件を確認

2. **デプロイフェーズ** (2時間)
   - AZDを使用したAIアプリケーションのハンズオンデプロイ
   - Azure AIサービスとエンドポイントを構成
   - セキュリティと認証パターンを実装

3. **カスタマイズフェーズ** (45分)
   - 特定のユースケースに合わせてアプリケーションを変更
   - 本番環境デプロイのために最適化
   - モニタリングとコスト管理を実装

#### 🚀 ワークショップの始め方
```bash
# オプション1: GitHub Codespaces（推奨）
# リポジトリで「Code」→「Create codespace on main」をクリック

# オプション2: ローカル開発
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.mdのセットアップ手順に従ってください
```

#### 🎯 ワークショップの学習成果
ワークショップを完了することで、参加者は以下を達成できます:
- **本番AIアプリケーションのデプロイ**: AZDを使用してMicrosoft Foundryサービスを活用
- **マルチエージェントアーキテクチャの習得**: 協調型AIエージェントソリューションを実装
- **セキュリティのベストプラクティスを実装**: 認証とアクセス制御を構成
- **スケールに最適化**: コスト効率が高く、パフォーマンスの良いデプロイを設計
- **デプロイのトラブルシューティング**: 一般的な問題を独自に解決

#### 📖 ワークショップリソース
- **🎥 インタラクティブガイド**: [ワークショップ教材](workshop/README.md) - ブラウザベースの学習環境
- **📋 ステップバイステップの手順**: [ガイド付き演習](../../workshop/docs/instructions) - 詳細な手順
- **🛠️ AIワークショップラボ**: [AIワークショップラボ](docs/microsoft-foundry/ai-workshop-lab.md) - AIに特化した演習
- **💡 クイックスタート**: [ワークショップセットアップガイド](workshop/README.md#quick-start) - 環境構成

**対象**: 企業研修、大学のコース、自己学習、開発者向けブートキャンプ

---

## 📖 Azure Developer CLIとは？

Azure Developer CLI (azd) は、Azureへのアプリケーション構築とデプロイを加速する開発者向けのコマンドラインインターフェースです。以下の機能を提供します:

- **テンプレートベースのデプロイ** - 一般的なアプリケーションパターン用の事前構成済みテンプレートを使用
- **コードとしてのインフラ** - BicepまたはTerraformを使用してAzureリソースを管理  
- **統合されたワークフロー** - アプリケーションのプロビジョニング、デプロイ、モニタリングをシームレスに実行
- **開発者に優しい** - 開発者の生産性と体験を最適化

### **AZD + Microsoft Foundry: AIデプロイに最適**

**AIソリューションにAZDを選ぶ理由**: AZDはAI開発者が直面する主な課題に対応します:

- **AI対応テンプレート** - Azure OpenAI、Cognitive Services、MLワークロード用の事前構成済みテンプレート
- **安全なAIデプロイ** - AIサービス、APIキー、モデルエンドポイント用の組み込みセキュリティパターン  
- **本番AIパターン** - スケーラブルでコスト効率の良いAIアプリケーションデプロイのベストプラクティス
- **エンドツーエンドのAIワークフロー** - モデル開発から本番デプロイまで、適切なモニタリングを含む
- **コスト最適化** - AIワークロードのスマートなリソース割り当てとスケーリング戦略
- **Microsoft Foundry統合** - Microsoft Foundryモデルカタログとエンドポイントへのシームレスな接続

---

## 🎯 テンプレートと例のライブラリ

### 注目: Microsoft Foundryテンプレート
**AIアプリケーションをデプロイするならここから始めましょう！**

> **注意:** これらのテンプレートはさまざまなAIパターンを示しています。一部は外部のAzure Samplesであり、他はローカル実装です。

| テンプレート | チャプター | 難易度 | サービス | 種類 |
|----------|---------|------------|----------|------|
| [**AIチャットの始め方**](https://github.com/Azure-Samples/get-started-with-ai-chat) | チャプター2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | 外部 |
| [**AIエージェントの始め方**](https://github.com/Azure-Samples/get-started-with-ai-agents) | チャプター2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| 外部 |
| [**Azure Search + OpenAIデモ**](https://github.com/Azure-Samples/azure-search-openai-demo) | チャプター2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | 外部 |
| [**OpenAIチャットアプリクイックスタート**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | チャプター2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | チャプター5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | チャプター8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | 外部 |
| [**小売マルチエージェントソリューション**](examples/retail-scenario.md) | チャプター5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **ローカル** |

### 注目: 完全な学習シナリオ
**学習チャプターに対応した本番対応アプリケーションテンプレート**

| テンプレート | 学習チャプター | 難易度 | 主な学習内容 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | チャプター2 | ⭐ | 基本的なAIデプロイパターン |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | チャプター2 | ⭐⭐ | Azure AI Searchを使用したRAG実装 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | チャプター4 | ⭐⭐ | ドキュメントインテリジェンスの統合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | チャプター5 | ⭐⭐⭐ | エージェントフレームワークと関数呼び出し |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | チャプター8 | ⭐⭐⭐ | エンタープライズAIオーケストレーション |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | チャプター5 | ⭐⭐⭐⭐ | 顧客エージェントと在庫エージェントを備えたマルチエージェントアーキテクチャ |

### 種類別の学習例

> **📌 ローカル vs. 外部の例:**  
> **ローカル例** (このリポジトリ内) = すぐに使用可能  
> **外部例** (Azure Samples) = リンクされたリポジトリからクローン

#### ローカル例 (すぐに使用可能)
- [**小売マルチエージェントソリューション**](examples/retail-scenario.md) - ARMテンプレートを使用した完全な本番対応実装
  - マルチエージェントアーキテクチャ (顧客 + 在庫エージェント)
  - 包括的なモニタリングと評価
  - ARMテンプレートによるワンクリックデプロイ

#### ローカル例 - コンテナアプリケーション (チャプター2-5)
**このリポジトリ内の包括的なコンテナデプロイ例:**
- [**コンテナアプリの例**](examples/container-app/README.md) - コンテナ化されたデプロイの完全ガイド
  - [シンプルなFlask API](../../examples/container-app/simple-flask-api) - スケールゼロ対応の基本的なREST API
  - [マイクロサービスアーキテクチャ](../../examples/container-app/microservices) - 本番対応のマルチサービスデプロイ
  - クイックスタート、本番、上級デプロイパターン
  - モニタリング、セキュリティ、コスト最適化のガイダンス

#### 外部例 - シンプルなアプリケーション (チャプター1-2)
**これらのAzure Samplesリポジトリをクローンして始めましょう:**
- [シンプルなWebアプリ - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本的なデプロイパターン
- [静的ウェブサイト - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 静的コンテンツのデプロイ
- [コンテナアプリ - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST APIのデプロイ

#### 外部例 - データベース統合 (チャプター3-4)  
- [データベースアプリ - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - データベース接続パターン
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - サーバーレスデータワークフロー

#### 外部例 - 高度なパターン (チャプター4-8)
- [Javaマイクロサービス](https://github.com/Azure-Samples/java-microservices-aca-lab) - マルチサービスアーキテクチャ
- [コンテナアプリジョブ](https://github.com/Azure-Samples/container-apps-jobs) - バックグラウンド処理  
- [エンタープライズML
- [**コマンドチートシート**](resources/cheat-sheet.md) - 章ごとに整理された基本的な azd コマンド
- [**用語集**](resources/glossary.md) - Azure と azd の用語解説  
- [**FAQ**](resources/faq.md) - 学習章ごとに整理されたよくある質問
- [**学習ガイド**](resources/study-guide.md) - 包括的な練習問題

### ハンズオンワークショップ
- [**AI ワークショップラボ**](docs/microsoft-foundry/ai-workshop-lab.md) - AI ソリューションを AZD でデプロイ可能にする (2～3時間)
- [**インタラクティブワークショップガイド**](workshop/README.md) - MkDocs と DevContainer 環境を使用したブラウザベースのワークショップ
- [**構造化学習パス**](../../workshop/docs/instructions) - 7ステップのガイド付き演習 (発見 → デプロイ → カスタマイズ)
- [**AZD 初心者向けワークショップ**](workshop/README.md) - GitHub Codespaces 統合を含む完全なハンズオンワークショップ資料

### 外部学習リソース
- [Azure Developer CLI ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure アーキテクチャセンター](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 料金計算ツール](https://azure.microsoft.com/pricing/calculator/)
- [Azure ステータス](https://status.azure.com/)

---

## 🔧 クイックトラブルシューティングガイド

**初心者が直面する一般的な問題と即時解決策:**

### ❌ "azd: command not found"

```bash
# まずAZDをインストールする
# Windows（PowerShell）：
winget install microsoft.azd

# macOS：
brew tap azure/azd && brew install azd

# Linux：
curl -fsSL https://aka.ms/install-azd.sh | bash

# インストールを確認する
azd version
```

### ❌ "No subscription found" または "Subscription not set"

```bash
# 利用可能なサブスクリプションを一覧表示
az account list --output table

# デフォルトのサブスクリプションを設定
az account set --subscription "<subscription-id-or-name>"

# AZD環境用に設定
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# 確認
az account show
```

### ❌ "InsufficientQuota" または "Quota exceeded"

```bash
# 別のAzureリージョンを試してください
azd env set AZURE_LOCATION "westus2"
azd up

# 開発でより小さいSKUを使用してください
# infra/main.parameters.jsonを編集してください
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" が途中で失敗する

```bash
# オプション1: クリーンして再試行
azd down --force --purge
azd up

# オプション2: インフラを修正するだけ
azd provision

# オプション3: 詳細なログを確認する
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

# 認証を確認する
az account show
```

### ❌ "Resource already exists" または名前の競合

```bash
# AZDは一意の名前を生成しますが、競合が発生した場合:
azd down --force --purge

# 新しい環境で再試行します
azd env new dev-v2
azd up
```

### ❌ テンプレートのデプロイが長すぎる

**通常の待ち時間:**
- シンプルなウェブアプリ: 5～10分
- データベース付きアプリ: 10～15分
- AI アプリケーション: 15～25分 (OpenAI のプロビジョニングは遅い)

```bash
# 進捗を確認する
azd show

# 30分以上行き詰まった場合は、Azureポータルを確認する:
azd monitor
# 失敗したデプロイメントを探す
```

### ❌ "Permission denied" または "Forbidden"

```bash
# Azure のロールを確認してください
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 少なくとも「Contributor」ロールが必要です
# Azure 管理者に以下を付与するよう依頼してください:
# - Contributor (リソース用)
# - User Access Administrator (ロール割り当て用)
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

### 📚 詳細なトラブルシューティングリソース

- **一般的な問題ガイド:** [詳細な解決策](docs/troubleshooting/common-issues.md)
- **AI 特有の問題:** [AI トラブルシューティング](docs/troubleshooting/ai-troubleshooting.md)
- **デバッグガイド:** [ステップバイステップのデバッグ](docs/troubleshooting/debugging.md)
- **ヘルプを得る:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 クイックトラブルシューティングガイド

**初心者が直面する一般的な問題と即時解決策:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# まずAZDをインストールする
# Windows（PowerShell）：
winget install microsoft.azd

# macOS：
brew tap azure/azd && brew install azd

# Linux：
curl -fsSL https://aka.ms/install-azd.sh | bash

# インストールを確認する
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

# AZD環境用に設定
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# 確認
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" または "Quota exceeded"</strong></summary>

```bash
# 別のAzureリージョンを試してください
azd env set AZURE_LOCATION "westus2"
azd up

# 開発でより小さいSKUを使用してください
# infra/main.parameters.jsonを編集してください
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" が途中で失敗する</strong></summary>

```bash
# オプション1: クリーンして再試行
azd down --force --purge
azd up

# オプション2: インフラを修正するだけ
azd provision

# オプション3: 詳細なログを確認する
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" または "Token expired"</strong></summary>

```bash
# 再認証する
az logout
az login

azd auth logout
azd auth login

# 認証を確認する
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" または名前の競合</strong></summary>

```bash
# AZDは一意の名前を生成しますが、競合が発生した場合:
azd down --force --purge

# 新しい環境で再試行します
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ テンプレートのデプロイが長すぎる</strong></summary>

**通常の待ち時間:**
- シンプルなウェブアプリ: 5～10分
- データベース付きアプリ: 10～15分
- AI アプリケーション: 15～25分 (OpenAI のプロビジョニングは遅い)

```bash
# 進捗を確認する
azd show

# 30分以上行き詰まった場合は、Azureポータルを確認する:
azd monitor
# 失敗したデプロイメントを探す
```
</details>

<details>
<summary><strong>❌ "Permission denied" または "Forbidden"</strong></summary>

```bash
# Azure のロールを確認してください
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 少なくとも「Contributor」ロールが必要です
# Azure 管理者に以下を付与するよう依頼してください:
# - Contributor (リソース用)
# - User Access Administrator (ロール割り当て用)
```
</details>

<details>
<summary><strong>❌ デプロイされたアプリケーションの URL が見つからない</strong></summary>

```bash
# すべてのサービスエンドポイントを表示する
azd show

# またはAzureポータルを開く
azd monitor

# 特定のサービスを確認する
azd env get-values
# *_URL変数を探す
```
</details>

### 📚 詳細なトラブルシューティングリソース

- **一般的な問題ガイド:** [詳細な解決策](docs/troubleshooting/common-issues.md)
- **AI 特有の問題:** [AI トラブルシューティング](docs/troubleshooting/ai-troubleshooting.md)
- **デバッグガイド:** [ステップバイステップのデバッグ](docs/troubleshooting/debugging.md)
- **ヘルプを得る:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 コース完了と認定

### 進捗状況の追跡
各章を通じて学習進捗を追跡:

- [ ] **第1章**: 基礎とクイックスタート ✅
- [ ] **第2章**: AI ファースト開発 ✅  
- [ ] **第3章**: 設定と認証 ✅
- [ ] **第4章**: コードとしてのインフラとデプロイ ✅
- [ ] **第5章**: マルチエージェント AI ソリューション ✅
- [ ] **第6章**: デプロイ前の検証と計画 ✅
- [ ] **第7章**: トラブルシューティングとデバッグ ✅
- [ ] **第8章**: 本番環境とエンタープライズパターン ✅

### 学習の確認
各章を完了した後、以下を行って知識を確認:
1. **実践演習**: 章のハンズオンデプロイを完了
2. **知識チェック**: 章の FAQ セクションを確認
3. **コミュニティディスカッション**: Azure Discord で経験を共有
4. **次の章**: 次の複雑度レベルに進む

### コース完了のメリット
すべての章を完了すると、以下を得られます:
- **実務経験**: 実際の AI アプリケーションを Azure にデプロイ
- **プロフェッショナルスキル**: エンタープライズ対応のデプロイ能力  
- **コミュニティでの認知**: Azure 開発者コミュニティの積極的なメンバー
- **キャリアの向上**: 需要の高い AZD と AI デプロイの専門知識

---

## 🤝 コミュニティとサポート

### ヘルプとサポートを得る
- **技術的な問題**: [バグ報告と機能リクエスト](https://github.com/microsoft/azd-for-beginners/issues)
- **学習に関する質問**: [Microsoft Azure Discord コミュニティ](https://discord.gg/microsoft-azure) および [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 特有のヘルプ**: [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) に参加
- **ドキュメント**: [公式 Azure Developer CLI ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord からのコミュニティインサイト

**#Azure チャンネルの最近の投票結果:**
- **45%** の開発者が AI ワークロードに AZD を使用したいと回答
- **主な課題**: マルチサービスデプロイ、認証情報管理、本番環境対応  
- **最も要望が多いもの**: AI 特有のテンプレート、トラブルシューティングガイド、ベストプラクティス

**コミュニティに参加して:**
- AZD + AI の経験を共有し、サポートを受ける
- 新しい AI テンプレートの早期プレビューにアクセス
- AI デプロイのベストプラクティスに貢献
- 将来の AI + AZD 機能開発に影響を与える

### コースへの貢献
貢献を歓迎します！詳細は [貢献ガイド](CONTRIBUTING.md) をご覧ください:
- **コンテンツの改善**: 既存の章や例を強化
- **新しい例**: 実際のシナリオやテンプレートを追加  
- **翻訳**: 多言語サポートの維持に協力
- **バグ報告**: 正確性と明確性を向上
- **コミュニティ基準**: 包括的なコミュニティガイドラインに従う

---

## 📄 コース情報

### ライセンス
このプロジェクトは MIT ライセンスの下でライセンスされています - 詳細は [LICENSE](../../LICENSE) ファイルをご覧ください。

### 関連する Microsoft 学習リソース

私たちのチームは他にも包括的な学習コースを提供しています:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### Azure / Edge / MCP / エージェント
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### 生成系 AI シリーズ
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### 基本学習
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---

### Copilotシリーズ
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ コースナビゲーション

**🚀 学習を始める準備はできましたか？**

**初心者**: [第1章: 基礎とクイックスタート](../..) から始めましょう  
**AI開発者**: [第2章: AIファースト開発](../..) に進みましょう  
**経験豊富な開発者**: [第3章: 設定と認証](../..) から始めましょう

**次のステップ**: [第1章 - AZDの基本](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:  
この文書はAI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性を追求しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があります。元の言語で記載された文書を正式な情報源としてご参照ください。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用に起因する誤解や誤認について、当方は一切の責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->