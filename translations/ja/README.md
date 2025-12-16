<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "62affa32f7697d88ec2a2d5745364db1",
  "translation_date": "2025-12-15T21:49:23+00:00",
  "source_file": "README.md",
  "language_code": "ja"
}
-->
# 初心者のためのAZD：体系的な学習の旅

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.ja.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## このコースの始め方

以下の手順に従って、AZD学習の旅を始めましょう：

1. **リポジトリをフォークする**: クリック [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **リポジトリをクローンする**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **コミュニティに参加する**: 専門家サポートのための [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4)
4. **学習パスを選ぶ**: 自分の経験レベルに合った章を以下から選択

### 多言語サポート

#### 自動翻訳（常に最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](./README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## コース概要

段階的な学習のために設計された体系的な章を通じて、Azure Developer CLI（azd）をマスターしましょう。**Microsoft Foundryとの統合によるAIアプリケーションの展開に特に注力しています。**

### なぜこのコースが現代の開発者に必須なのか

Microsoft Foundry Discordコミュニティの洞察に基づくと、**45%の開発者がAIワークロードにAZDを使いたい**と考えていますが、以下の課題に直面しています：
- 複雑なマルチサービスAIアーキテクチャ
- 本番環境でのAI展開のベストプラクティス  
- Azure AIサービスの統合と設定
- AIワークロードのコスト最適化
- AI特有の展開問題のトラブルシューティング

### 学習目標

この体系的なコースを修了することで、以下を習得できます：
- **AZDの基本をマスター**：コアコンセプト、インストール、設定
- **AIアプリケーションの展開**：Microsoft FoundryサービスとAZDの活用
- **Infrastructure as Codeの実装**：BicepテンプレートでAzureリソースを管理
- **展開のトラブルシューティング**：一般的な問題の解決とデバッグ
- **本番環境向け最適化**：セキュリティ、スケーリング、監視、コスト管理
- **マルチエージェントソリューションの構築**：複雑なAIアーキテクチャの展開

## 📚 学習章

*経験レベルと目標に応じて学習パスを選択してください*

### 🚀 第1章：基礎とクイックスタート
**前提条件**：Azureサブスクリプション、基本的なコマンドライン知識  
**所要時間**：30-45分  
**難易度**：⭐

#### 学習内容
- Azure Developer CLIの基本理解
- プラットフォームへのAZDインストール
- 最初の成功した展開

#### 学習リソース
- **🎯 ここから開始**: [Azure Developer CLIとは？](../..)
- **📖 理論**: [AZDの基本](docs/getting-started/azd-basics.md) - コアコンセプトと用語
- **⚙️ セットアップ**: [インストールとセットアップ](docs/getting-started/installation.md) - プラットフォーム別ガイド
- **🛠️ ハンズオン**: [最初のプロジェクト](docs/getting-started/first-project.md) - ステップバイステップチュートリアル
- **📋 クイックリファレンス**: [コマンドチートシート](resources/cheat-sheet.md)

#### 実践演習
```bash
# クイックインストールチェック
azd version

# 最初のアプリケーションをデプロイする
azd init --template todo-nodejs-mongo
azd up
```

**💡 章の成果**：AZDを使ってシンプルなWebアプリケーションをAzureに展開成功

**✅ 成功の検証：**
```bash
# 第1章を完了すると、以下ができるようになります：
azd version              # インストールされているバージョンを表示します
azd init --template todo-nodejs-mongo  # プロジェクトを初期化します
azd up                  # Azureにデプロイします
azd show                # 実行中のアプリのURLを表示します
# アプリケーションがブラウザで開き、動作します
azd down --force --purge  # リソースをクリーンアップします
```

**📊 所要時間:** 30-45分  
**📈 習得レベル:** 基本的なアプリケーションを独力で展開可能

**✅ 成功の検証：**
```bash
# 第1章を完了すると、以下ができるようになります：
azd version              # インストールされているバージョンを表示します
azd init --template todo-nodejs-mongo  # プロジェクトを初期化します
azd up                  # Azureにデプロイします
azd show                # 実行中のアプリのURLを表示します
# アプリケーションがブラウザで開き、動作します
azd down --force --purge  # リソースをクリーンアップします
```

**📊 所要時間:** 30-45分  
**📈 習得レベル:** 基本的なアプリケーションを独力で展開可能

---

### 🤖 第2章：AIファースト開発（AI開発者向け推奨）
**前提条件**：第1章修了  
**所要時間**：1-2時間  
**難易度**：⭐⭐

#### 学習内容
- Microsoft FoundryとのAZD統合
- AI搭載アプリケーションの展開
- AIサービス設定の理解

#### 学習リソース
- **🎯 ここから開始**: [Microsoft Foundry統合](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 パターン**: [AIモデル展開](docs/microsoft-foundry/ai-model-deployment.md) - AIモデルの展開と管理
- **🛠️ ワークショップ**: [AIワークショップラボ](docs/microsoft-foundry/ai-workshop-lab.md) - AIソリューションをAZD対応に
- **🎥 インタラクティブガイド**: [ワークショップ資料](workshop/README.md) - MkDocs * DevContainer環境によるブラウザ学習
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

**💡 章の成果**：RAG機能を備えたAIチャットアプリケーションを展開・設定

**✅ 成功の検証：**
```bash
# 第2章の後、あなたは以下ができるようになっているはずです：
azd init --template azure-search-openai-demo
azd up
# AIチャットインターフェースをテストする
# 質問をして、情報源付きのAIによる回答を得る
# 検索統合が機能していることを確認する
azd monitor  # Application Insightsがテレメトリを表示しているか確認する
azd down --force --purge
```

**📊 所要時間:** 1-2時間  
**📈 習得レベル:** 本番対応のAIアプリケーションを展開・設定可能  
**💰 コスト認識:** 開発環境で月80-150ドル、本番環境で月300-3500ドルのコスト理解

#### 💰 AI展開のコスト考慮

**開発環境（推定月80-150ドル）：**
- Azure OpenAI（従量課金）：トークン使用量に応じて0-50ドル/月
- AI Search（Basic層）：75ドル/月
- Container Apps（消費ベース）：0-20ドル/月
- ストレージ（標準）：1-5ドル/月

**本番環境（推定月300-3,500ドル以上）：**
- Azure OpenAI（PTUで安定性能）：3,000ドル以上/月 または 高ボリュームの従量課金
- AI Search（Standard層）：250ドル/月
- Container Apps（専用）：50-100ドル/月
- Application Insights：5-50ドル/月
- ストレージ（プレミアム）：10-50ドル/月

**💡 コスト最適化のヒント：**
- 学習には**無料層**のAzure OpenAI（50,000トークン/月含む）を利用
- 開発していない時は `azd down` でリソースを解放
- 従量課金から始め、本番のみPTUにアップグレード
- 展開前に `azd provision --preview` でコスト見積もり
- オートスケールを有効にし、実際の使用量に応じて支払い

**コスト監視：**
```bash
# 推定月額費用を確認する
azd provision --preview

# Azure ポータルで実際の費用を監視する
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第3章：設定と認証
**前提条件**：第1章修了  
**所要時間**：45-60分  
**難易度**：⭐⭐

#### 学習内容
- 環境設定と管理
- 認証とセキュリティのベストプラクティス
- リソースの命名と整理

#### 学習リソース
- **📖 設定**: [設定ガイド](docs/getting-started/configuration.md) - 環境セットアップ
- **🔐 セキュリティ**: [認証パターンとマネージドID](docs/getting-started/authsecurity.md) - 認証パターン
- **📝 例**: [データベースアプリ例](examples/database-app/README.md) - AZDデータベース例

#### 実践演習
- 複数環境（開発、ステージング、本番）の設定
- マネージドID認証のセットアップ
- 環境固有の設定の実装

**💡 章の成果**：適切な認証とセキュリティで複数環境を管理

---

### 🏗️ 第4章：Infrastructure as Codeと展開
**前提条件**：第1～3章修了  
**所要時間**：1-1.5時間  
**難易度**：⭐⭐⭐

#### 学習内容
- 高度な展開パターン
- BicepによるInfrastructure as Code
- リソースプロビジョニング戦略

#### 学習リソース
- **📖 展開**: [展開ガイド](docs/deployment/deployment-guide.md) - 完全なワークフロー
- **🏗️ プロビジョニング**: [リソースプロビジョニング](docs/deployment/provisioning.md) - Azureリソース管理
- **📝 例**: [コンテナアプリ例](../../examples/container-app) - コンテナ化展開

#### 実践演習
- カスタムBicepテンプレートの作成
- マルチサービスアプリケーションの展開
- ブルーグリーン展開戦略の実装

**💡 章の成果**：カスタムインフラテンプレートを使い複雑なマルチサービスアプリを展開

---

### 🎯 第5章：マルチエージェントAIソリューション（上級）
**前提条件**：第1～2章修了  
**所要時間**：2-3時間  
**難易度**：⭐⭐⭐⭐

#### 学習内容
- マルチエージェントアーキテクチャパターン
- エージェントのオーケストレーションと調整
- 本番対応のAI展開

#### 学習リソース
- **🤖 注目プロジェクト**: [小売業向けマルチエージェントソリューション](examples/retail-scenario.md) - 完全実装

- **🛠️ ARM テンプレート**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - ワンクリックデプロイ
- **📖 アーキテクチャ**: [マルチエージェント調整パターン](/docs/pre-deployment/coordination-patterns.md) - パターン

#### 実践演習
```bash
# 完全な小売マルチエージェントソリューションを展開する
cd examples/retail-multiagent-arm-template
./deploy.sh

# エージェントの構成を探る
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 チャプターの成果**: Customer と Inventory エージェントを用いた本番対応のマルチエージェント AI ソリューションのデプロイと管理

---

### 🔍 チャプター 6: デプロイ前の検証と計画
**前提条件**: チャプター 4 完了  
**所要時間**: 1 時間  
**難易度**: ⭐⭐

#### 学習内容
- キャパシティプランニングとリソース検証
- SKU 選択戦略
- プレフライトチェックと自動化

#### 学習リソース
- **📊 計画**: [キャパシティプランニング](docs/pre-deployment/capacity-planning.md) - リソース検証
- **💰 選択**: [SKU 選択](docs/pre-deployment/sku-selection.md) - コスト効率の良い選択
- **✅ 検証**: [プレフライトチェック](docs/pre-deployment/preflight-checks.md) - 自動化スクリプト

#### 実践演習
- キャパシティ検証スクリプトの実行
- コスト最適化のための SKU 選択
- 自動化されたデプロイ前チェックの実装

**💡 チャプターの成果**: デプロイ実行前の検証と最適化

---

### 🚨 チャプター 7: トラブルシューティングとデバッグ
**前提条件**: いずれかのデプロイチャプター完了  
**所要時間**: 1～1.5 時間  
**難易度**: ⭐⭐

#### 学習内容
- 系統的なデバッグ手法
- よくある問題と解決策
- AI 特有のトラブルシューティング

#### 学習リソース
- **🔧 よくある問題**: [よくある問題](docs/troubleshooting/common-issues.md) - FAQ と解決策
- **🕵️ デバッグ**: [デバッグガイド](docs/troubleshooting/debugging.md) - ステップバイステップの戦略
- **🤖 AI 問題**: [AI 特有のトラブルシューティング](docs/troubleshooting/ai-troubleshooting.md) - AI サービスの問題

#### 実践演習
- デプロイ失敗の診断
- 認証問題の解決
- AI サービス接続のデバッグ

**💡 チャプターの成果**: 一般的なデプロイ問題を自力で診断・解決

---

### 🏢 チャプター 8: 本番環境とエンタープライズパターン
**前提条件**: チャプター 1～4 完了  
**所要時間**: 2～3 時間  
**難易度**: ⭐⭐⭐⭐

#### 学習内容
- 本番環境デプロイ戦略
- エンタープライズセキュリティパターン
- 監視とコスト最適化

#### 学習リソース
- **🏭 本番環境**: [本番 AI ベストプラクティス](docs/microsoft-foundry/production-ai-practices.md) - エンタープライズパターン
- **📝 例**: [マイクロサービス例](../../examples/microservices) - 複雑なアーキテクチャ
- **📊 監視**: [Application Insights 統合](docs/pre-deployment/application-insights.md) - 監視

#### 実践演習
- エンタープライズセキュリティパターンの実装
- 包括的な監視のセットアップ
- 適切なガバナンスによる本番環境へのデプロイ

**💡 チャプターの成果**: 本番対応のエンタープライズアプリケーションを完全な機能でデプロイ

---

## 🎓 ワークショップ概要: ハンズオン学習体験

> **⚠️ ワークショップ状況: 開発中**  
> ワークショップ資料は現在開発・改良中です。コアモジュールは機能していますが、一部の高度なセクションは未完成です。全コンテンツの完成に向けて積極的に作業しています。[進捗を確認 →](workshop/README.md)

### インタラクティブなワークショップ資料
**ブラウザベースのツールとガイド付き演習による包括的なハンズオン学習**

本ワークショップ資料は、上記のチャプター別カリキュラムを補完する構造化されたインタラクティブな学習体験を提供します。自己学習とインストラクター主導の両方に対応しています。

#### 🛠️ ワークショップの特徴
- **ブラウザベースのインターフェース**: 検索、コピー、テーマ機能を備えた MkDocs ベースのワークショップ
- **GitHub Codespaces 統合**: ワンクリックで開発環境をセットアップ
- **構造化された学習パス**: 7 ステップのガイド付き演習（合計 3.5 時間）
- **発見 → デプロイ → カスタマイズ**: 段階的なメソッド
- **インタラクティブな DevContainer 環境**: 事前構成済みのツールと依存関係

#### 📚 ワークショップ構成
ワークショップは **発見 → デプロイ → カスタマイズ** のメソッドに従います：

1. **発見フェーズ**（45 分）
   - Microsoft Foundry テンプレートとサービスの探索
   - マルチエージェントアーキテクチャパターンの理解
   - デプロイ要件と前提条件の確認

2. **デプロイフェーズ**（2 時間）
   - AZD を使った AI アプリケーションのハンズオンデプロイ
   - Azure AI サービスとエンドポイントの設定
   - セキュリティと認証パターンの実装

3. **カスタマイズフェーズ**（45 分）
   - 特定ユースケース向けのアプリケーション修正
   - 本番デプロイ向けの最適化
   - 監視とコスト管理の実装

#### 🚀 ワークショップ開始方法
```bash
# オプション1: GitHub Codespaces（推奨）
# リポジトリで「Code」→「mainでcodespaceを作成」をクリック

# オプション2: ローカル開発
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.mdのセットアップ手順に従ってください
```

#### 🎯 ワークショップの学習成果
ワークショップを完了すると、参加者は以下を習得します：
- **本番対応の AI アプリケーションをデプロイ**: Microsoft Foundry サービスと AZD を使用
- **マルチエージェントアーキテクチャをマスター**: 協調型 AI エージェントソリューションの実装
- **セキュリティベストプラクティスを実装**: 認証とアクセス制御の設定
- **スケールに最適化**: コスト効率とパフォーマンスを考慮した設計
- **デプロイのトラブルシューティング**: 一般的な問題を自力で解決

#### 📖 ワークショップリソース
- **🎥 インタラクティブガイド**: [ワークショップ資料](workshop/README.md) - ブラウザベースの学習環境
- **📋 ステップバイステップ手順**: [ガイド付き演習](../../workshop/docs/instructions) - 詳細なウォークスルー
- **🛠️ AI ワークショップラボ**: [AI ワークショップラボ](docs/microsoft-foundry/ai-workshop-lab.md) - AI に特化した演習
- **💡 クイックスタート**: [ワークショップセットアップガイド](workshop/README.md#quick-start) - 環境構築

**対象**: 企業研修、大学講座、自己学習、開発者ブートキャンプに最適。

---

## 📖 Azure Developer CLI とは？

Azure Developer CLI (azd) は、Azure へのアプリケーション構築とデプロイを加速する開発者向けコマンドラインインターフェースです。以下を提供します：

- **テンプレートベースのデプロイ** - 一般的なアプリケーションパターンの事前構築済みテンプレートを使用
- **Infrastructure as Code** - Bicep や Terraform を使った Azure リソース管理  
- **統合ワークフロー** - アプリケーションのプロビジョニング、デプロイ、監視をシームレスに実行
- **開発者フレンドリー** - 開発者の生産性と体験に最適化

### **AZD + Microsoft Foundry: AI デプロイに最適**

**なぜ AI ソリューションに AZD なのか？** AZD は AI 開発者が直面する主要課題に対応しています：

- **AI 対応テンプレート** - Azure OpenAI、Cognitive Services、ML ワークロード向けの事前設定済みテンプレート
- **安全な AI デプロイ** - AI サービス、API キー、モデルエンドポイントの組み込みセキュリティパターン  
- **本番 AI パターン** - スケーラブルでコスト効率の良い AI アプリケーションデプロイのベストプラクティス
- **エンドツーエンド AI ワークフロー** - モデル開発から本番デプロイまで適切な監視付きで実現
- **コスト最適化** - AI ワークロード向けのスマートなリソース割り当てとスケーリング戦略
- **Microsoft Foundry 連携** - Microsoft Foundry のモデルカタログとエンドポイントへのシームレスな接続

---

## 🎯 テンプレート＆サンプルライブラリ

### 注目: Microsoft Foundry テンプレート
**AI アプリケーションをデプロイするならここから！**

> **注意:** これらのテンプレートは様々な AI パターンを示しています。一部は外部の Azure Samples、他はローカル実装です。

| テンプレート | チャプター | 難易度 | サービス | 種類 |
|--------------|------------|--------|----------|------|
| [**AI チャット入門**](https://github.com/Azure-Samples/get-started-with-ai-chat) | チャプター 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | 外部 |
| [**AI エージェント入門**](https://github.com/Azure-Samples/get-started-with-ai-agents) | チャプター 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | 外部 |
| [**Azure Search + OpenAI デモ**](https://github.com/Azure-Samples/azure-search-openai-demo) | チャプター 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | 外部 |
| [**OpenAI チャットアプリ クイックスタート**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | チャプター 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | チャプター 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | チャプター 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | 外部 |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | チャプター 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **ローカル** |

### 注目: 完全な学習シナリオ
**学習チャプターに対応した本番対応アプリケーションテンプレート**

| テンプレート | 学習チャプター | 難易度 | 主要学習内容 |
|--------------|----------------|--------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | チャプター 2 | ⭐ | 基本的な AI デプロイパターン |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | チャプター 2 | ⭐⭐ | Azure AI Search を用いた RAG 実装 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | チャプター 4 | ⭐⭐ | ドキュメントインテリジェンス統合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | チャプター 5 | ⭐⭐⭐ | エージェントフレームワークと関数呼び出し |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | チャプター 8 | ⭐⭐⭐ | エンタープライズ AI オーケストレーション |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | チャプター 5 | ⭐⭐⭐⭐ | Customer と Inventory エージェントによるマルチエージェントアーキテクチャ |

### 例による学習タイプ

> **📌 ローカル vs. 外部サンプル:**  
> **ローカルサンプル**（このリポジトリ内）= すぐに使用可能  
> **外部サンプル**（Azure Samples）= リンク先リポジトリからクローン

#### ローカルサンプル（すぐに使用可能）
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARM テンプレートを用いた本番対応の完全実装
  - マルチエージェントアーキテクチャ（Customer + Inventory エージェント）
  - 包括的な監視と評価
  - ARM テンプレートによるワンクリックデプロイ

#### ローカルサンプル - コンテナアプリケーション（チャプター 2-5）
**このリポジトリ内の包括的なコンテナデプロイ例：**
- [**Container App Examples**](examples/container-app/README.md) - コンテナ化デプロイの完全ガイド
  - [シンプル Flask API](../../examples/container-app/simple-flask-api) - スケールトゥゼロ対応の基本 REST API
  - [マイクロサービスアーキテクチャ](../../examples/container-app/microservices) - 本番対応のマルチサービスデプロイ
  - クイックスタート、本番、上級デプロイパターン
  - 監視、セキュリティ、コスト最適化のガイダンス

#### 外部サンプル - シンプルアプリケーション（チャプター 1-2）
**以下の Azure Samples リポジトリをクローンして開始：**
- [シンプル Web アプリ - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本的なデプロイパターン
- [静的ウェブサイト - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 静的コンテンツデプロイ
- [コンテナアプリ - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API デプロイ

#### 外部サンプル - データベース統合（チャプター 3-4）  
- [データベースアプリ - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - データベース接続パターン
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - サーバーレスデータワークフロー

#### 外部サンプル - 高度なパターン（チャプター 4-8）
- [Java マイクロサービス](https://github.com/Azure-Samples/java-microservices-aca-lab) - マルチサービスアーキテクチャ
- [Container Apps ジョブ](https://github.com/Azure-Samples/container-apps-jobs) - バックグラウンド処理  
- [エンタープライズ ML パイプライン](https://github.com/Azure-Samples/mlops-v2) - 本番対応 ML パターン

### 外部テンプレートコレクション
- [**公式 AZD テンプレートギャラリー**](https://azure.github.io/awesome-azd/) - 公式およびコミュニティテンプレートの厳選コレクション
- [**Azure Developer CLI テンプレート**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn のテンプレートドキュメント
- [**Examples ディレクトリ**](examples/README.md) - ローカル学習用サンプルと詳細解説

---

## 📚 学習リソース＆参考資料

### クイックリファレンス
- [**コマンドチートシート**](resources/cheat-sheet.md) - 章ごとに整理された必須のazdコマンド
- [**用語集**](resources/glossary.md) - Azureおよびazdの用語集  
- [**FAQ**](resources/faq.md) - 学習章ごとに整理されたよくある質問
- [**学習ガイド**](resources/study-guide.md) - 包括的な練習問題

### ハンズオンワークショップ
- [**AIワークショップラボ**](docs/microsoft-foundry/ai-workshop-lab.md) - AIソリューションをAZDでデプロイ可能にする（2～3時間）
- [**インタラクティブワークショップガイド**](workshop/README.md) - MkDocsとDevContainer環境を使ったブラウザベースのワークショップ
- [**構造化学習パス**](../../workshop/docs/instructions) - 7ステップのガイド付き演習（発見 → デプロイ → カスタマイズ）
- [**AZD初心者向けワークショップ**](workshop/README.md) - GitHub Codespaces統合付きの完全なハンズオンワークショップ資料

### 外部学習リソース
- [Azure Developer CLI ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure アーキテクチャセンター](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 価格計算ツール](https://azure.microsoft.com/pricing/calculator/)
- [Azure ステータス](https://status.azure.com/)

---

## 🔧 クイックトラブルシューティングガイド

**初心者がよく直面する問題と即時解決策：**

### ❌ "azd: command not found"

```bash
# まずAZDをインストールしてください
# Windows（PowerShell）：
winget install microsoft.azd

# macOS：
brew tap azure/azd && brew install azd

# Linux：
curl -fsSL https://aka.ms/install-azd.sh | bash

# インストールを確認してください
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

# 検証する
az account show
```

### ❌ "InsufficientQuota" または "Quota exceeded"

```bash
# 別のAzureリージョンを試してください
azd env set AZURE_LOCATION "westus2"
azd up

# または開発環境ではより小さいSKUを使用してください
# infra/main.parameters.jsonを編集してください:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" が途中で失敗する

```bash
# オプション1: クリーンして再試行
azd down --force --purge
azd up

# オプション2: インフラストラクチャのみ修正
azd provision

# オプション3: 詳細なログを確認する
azd show
azd logs
```

### ❌ "Authentication failed" または "Token expired"

```bash
# 再認証
az logout
az login

azd auth logout
azd auth login

# 認証を確認する
az account show
```

### ❌ "Resource already exists" または名前の競合

```bash
# AZDは一意の名前を生成しますが、競合が発生した場合：
azd down --force --purge

# その場合は新しい環境で再試行します
azd env new dev-v2
azd up
```

### ❌ テンプレートのデプロイに時間がかかりすぎる

**通常の待ち時間：**
- シンプルなウェブアプリ：5～10分
- データベース付きアプリ：10～15分
- AIアプリケーション：15～25分（OpenAIのプロビジョニングは遅い）

```bash
# 進行状況を確認する
azd show

# 30分以上進まない場合は、Azureポータルを確認してください:
azd monitor
# 失敗したデプロイメントを探す
```

### ❌ "Permission denied" または "Forbidden"

```bash
# Azureのロールを確認してください
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 少なくとも「Contributor」ロールが必要です
# Azure管理者に付与を依頼してください:
# - Contributor（リソース用）
# - User Access Administrator（ロール割り当て用）
```

### ❌ デプロイ済みアプリケーションのURLが見つからない

```bash
# すべてのサービスエンドポイントを表示
azd show

# または Azure ポータルを開く
azd monitor

# 特定のサービスを確認
azd env get-values
# *_URL 変数を探す
```

### 📚 詳細なトラブルシューティングリソース

- **よくある問題ガイド：** [詳細な解決策](docs/troubleshooting/common-issues.md)
- **AI特有の問題：** [AIトラブルシューティング](docs/troubleshooting/ai-troubleshooting.md)
- **デバッグガイド：** [ステップバイステップデバッグ](docs/troubleshooting/debugging.md)
- **サポートを受ける：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 クイックトラブルシューティングガイド

**初心者がよく直面する問題と即時解決策：**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# まずAZDをインストールしてください
# Windows（PowerShell）：
winget install microsoft.azd

# macOS：
brew tap azure/azd && brew install azd

# Linux：
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

# AZD環境用に設定
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# 検証する
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" または "Quota exceeded"</strong></summary>

```bash
# 別のAzureリージョンを試してください
azd env set AZURE_LOCATION "westus2"
azd up

# または開発環境ではより小さいSKUを使用してください
# infra/main.parameters.jsonを編集してください:
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

# オプション2: インフラストラクチャのみ修正
azd provision

# オプション3: 詳細なログを確認する
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

# 認証を確認する
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" または名前の競合</strong></summary>

```bash
# AZDは一意の名前を生成しますが、競合が発生した場合：
azd down --force --purge

# その場合は新しい環境で再試行します
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ テンプレートのデプロイに時間がかかりすぎる</strong></summary>

**通常の待ち時間：**
- シンプルなウェブアプリ：5～10分
- データベース付きアプリ：10～15分
- AIアプリケーション：15～25分（OpenAIのプロビジョニングは遅い）

```bash
# 進行状況を確認する
azd show

# 30分以上進まない場合は、Azureポータルを確認してください：
azd monitor
# 失敗したデプロイメントを探す
```
</details>

<details>
<summary><strong>❌ "Permission denied" または "Forbidden"</strong></summary>

```bash
# Azureのロールを確認してください
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 少なくとも「Contributor」ロールが必要です
# Azure管理者に以下の付与を依頼してください:
# - Contributor（リソース用）
# - User Access Administrator（ロール割り当て用）
```
</details>

<details>
<summary><strong>❌ デプロイ済みアプリケーションのURLが見つからない</strong></summary>

```bash
# すべてのサービスエンドポイントを表示
azd show

# または Azure ポータルを開く
azd monitor

# 特定のサービスを確認
azd env get-values
# *_URL 変数を探す
```
</details>

### 📚 詳細なトラブルシューティングリソース

- **よくある問題ガイド：** [詳細な解決策](docs/troubleshooting/common-issues.md)
- **AI特有の問題：** [AIトラブルシューティング](docs/troubleshooting/ai-troubleshooting.md)
- **デバッグガイド：** [ステップバイステップデバッグ](docs/troubleshooting/debugging.md)
- **サポートを受ける：** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 コース修了と認定

### 進捗トラッキング
各章の学習進捗を追跡しましょう：

- [ ] **第1章**: 基礎とクイックスタート ✅
- [ ] **第2章**: AIファースト開発 ✅  
- [ ] **第3章**: 設定と認証 ✅
- [ ] **第4章**: インフラストラクチャコードとデプロイ ✅
- [ ] **第5章**: マルチエージェントAIソリューション ✅
- [ ] **第6章**: 事前デプロイ検証と計画 ✅
- [ ] **第7章**: トラブルシューティングとデバッグ ✅
- [ ] **第8章**: 本番運用とエンタープライズパターン ✅

### 学習確認
各章を修了したら、以下で知識を確認しましょう：
1. **実践演習**：章のハンズオンデプロイを完了する
2. **知識チェック**：章のFAQセクションを確認する
3. **コミュニティディスカッション**：Azure Discordで経験を共有する
4. **次の章へ**：次の難易度レベルに進む

### コース修了のメリット
全章を修了すると、以下を得られます：
- **実務経験**：実際にAzureへAIアプリケーションをデプロイ
- **専門スキル**：エンタープライズ対応のデプロイ能力  
- **コミュニティ認知**：Azure開発者コミュニティのアクティブメンバー
- **キャリアアップ**：需要の高いAZDおよびAIデプロイの専門知識

---

## 🤝 コミュニティとサポート

### ヘルプとサポートを得る
- **技術的な問題**： [バグ報告と機能要望](https://github.com/microsoft/azd-for-beginners/issues)
- **学習に関する質問**： [Microsoft Azure Discordコミュニティ](https://discord.gg/microsoft-azure) および [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI特有のサポート**： [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) に参加
- **ドキュメント**： [公式Azure Developer CLIドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discordからのコミュニティインサイト

**#Azureチャンネルの最近の投票結果：**
- **45%** の開発者がAIワークロードにAZDを使いたいと回答
- **主な課題**：マルチサービスのデプロイ、資格情報管理、本番運用準備  
- **最も要望が多いもの**：AI特化テンプレート、トラブルシューティングガイド、ベストプラクティス

**コミュニティに参加して：**
- AZD + AIの経験を共有し、サポートを受ける
- 新しいAIテンプレートの早期プレビューにアクセス
- AIデプロイのベストプラクティスに貢献
- 将来のAI + AZD機能開発に影響を与える

### コースへの貢献
貢献を歓迎します！詳細は[Contributing Guide](CONTRIBUTING.md)をご覧ください：
- **コンテンツ改善**：既存の章や例を強化
- **新しい例**：実世界のシナリオやテンプレートを追加  
- **翻訳**：多言語サポートの維持に協力
- **バグ報告**：正確性と明瞭さの向上
- **コミュニティ基準**：包括的なコミュニティガイドラインに従う

---

## 📄 コース情報

### ライセンス
本プロジェクトはMITライセンスの下で提供されています。詳細は[LICENSE](../../LICENSE)ファイルをご覧ください。

### 関連するMicrosoft学習リソース

当チームは他にも包括的な学習コースを提供しています：

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### Azure / Edge / MCP / エージェント
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### 生成AIシリーズ
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### コアラーニング
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot シリーズ
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

**次のステップ**: [第1章 - AZDの基本を始める](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：  
本書類はAI翻訳サービス「Co-op Translator」（https://github.com/Azure/co-op-translator）を使用して翻訳されました。正確性を期しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があります。原文の言語による文書が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じた誤解や誤訳について、当方は一切の責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->