<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6d5c886052b605349d9219cea5f2f6a1",
  "translation_date": "2026-01-16T09:30:10+00:00",
  "source_file": "README.md",
  "language_code": "ja"
}
-->
# AZD初心者向け：体系的な学習ジャーニー

![AZD-for-beginners](../../../../translated_images/ja/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## このコースの始め方

以下の手順でAZDの学習を始めてください：

1. **リポジトリをフォークする**: クリック [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **リポジトリをクローンする**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **コミュニティに参加する**: [Azure Discordコミュニティ](https://discord.com/invite/ByRwuEEgH4) で専門家サポートを受ける
4. **学習パスを選ぶ**: ご自身の経験レベルに合った章を以下から選択する

### 多言語対応

#### 自動翻訳（常に最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](./README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **ローカルでクローンする方が良いですか？**

> このリポジトリには50以上の言語翻訳版が含まれており、ダウンロードサイズが大きくなります。翻訳を含めずにクローンするには、スパースチェックアウトを使用してください：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> これにより、このコースを完了するために必要な全てを高速にダウンロードできます。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## コース概要

段階的学習のために設計された構造的な章を通じて、Azure Developer CLI（azd）をマスターします。**特にMicrosoft Foundry統合によるAIアプリケーションの展開に焦点を当てています。**

### なぜこのコースは現代の開発者に必要か

Microsoft Foundry Discordコミュニティのインサイトに基づき、**45％の開発者がAIワークロードにAZDを使いたいと考えています**が、以下の課題に直面しています：
- 複雑なマルチサービスのAIアーキテクチャ
- 本番環境でのAI展開のベストプラクティス
- Azure AIサービスの統合および設定
- AIワークロードのコスト最適化
- AI特有の展開問題のトラブルシューティング

### 学習目標

この構造化されたコースの修了により、以下のことが可能になります：
- **AZDの基礎をマスター**：コアコンセプト、インストール、設定
- **AIアプリケーションの展開**：AZDとMicrosoft Foundryサービスを活用
- **Infrastructure as Codeの実装**：BicepテンプレートでAzureリソース管理
- **展開のトラブルシューティング**：よくある問題の解決とデバッグ
- **本番環境の最適化**：セキュリティ、スケーリング、監視、コスト管理
- **マルチエージェントソリューションの構築**：複雑なAIアーキテクチャを展開

## 📚 学習章

*経験レベルと目標に応じて学習パスを選択してください*

### 🚀 第1章：基礎とクイックスタート
**前提条件**：Azureサブスクリプション、基本的なコマンドライン知識  
**所要時間**：30-45分  
**難易度**：⭐

#### 学習内容
- Azure Developer CLIの基本理解
- お使いのプラットフォームへのAZDインストール
- 最初の成功するデプロイメント

#### 学習リソース
- **🎯 はじめに**：[Azure Developer CLIとは？](../..)
- **📖 理論**：[AZDの基本](docs/getting-started/azd-basics.md) - コアコンセプトと用語
- **⚙️ 設定**：[インストールとセットアップ](docs/getting-started/installation.md) - プラットフォーム別ガイド
- **🛠️ 実践**：[最初のプロジェクト](docs/getting-started/first-project.md) - ステップバイステップチュートリアル
- **📋 クイックリファレンス**：[コマンドチートシート](resources/cheat-sheet.md)

#### 実践演習
```bash
# クイックインストールチェック
azd version

# 最初のアプリケーションをデプロイする
azd init --template todo-nodejs-mongo
azd up
```

**💡 章の成果**：AZDを使って簡単なWebアプリケーションをAzureに成功裏にデプロイする

**✅ 成功の検証：**
```bash
# 第1章を完了すると、次のことができるようになります：
azd version              # インストールされているバージョンを表示します
azd init --template todo-nodejs-mongo  # プロジェクトを初期化します
azd up                  # Azureにデプロイします
azd show                # 実行中のアプリのURLを表示します
# アプリケーションがブラウザで開き、動作します
azd down --force --purge  # リソースをクリーンアップします
```

**📊 時間投入：** 30-45分  
**📈 習得レベル：** 基本的なアプリケーションを独力でデプロイ可能

**✅ 成功の検証：**
```bash
# 第1章を完了した後、次のことができるはずです：
azd version              # インストールされているバージョンを表示します
azd init --template todo-nodejs-mongo  # プロジェクトを初期化します
azd up                  # Azureにデプロイします
azd show                # 実行中のアプリのURLを表示します
# アプリがブラウザで開き、動作します
azd down --force --purge  # リソースをクリーンアップします
```

**📊 時間投入：** 30-45分  
**📈 習得レベル：** 基本的なアプリケーションを独力でデプロイ可能

---

### 🤖 第2章：AIファースト開発（AI開発者に推奨）
**前提条件**：第1章修了  
**所要時間**：1-2時間  
**難易度**：⭐⭐

#### 学習内容
- Microsoft FoundryとのAZD統合
- AI搭載アプリケーションの展開
- AIサービスの設定理解

#### 学習リソース
- **🎯 はじめに**：[Microsoft Foundry統合](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 パターン**：[AIモデルの展開](docs/microsoft-foundry/ai-model-deployment.md) - AIモデルの展開と管理
- **🛠️ ワークショップ**：[AIワークショップラボ](docs/microsoft-foundry/ai-workshop-lab.md) - AIソリューションをAZD対応に
- **🎥 インタラクティブガイド**：[ワークショップ資料](workshop/README.md) - MkDocs * DevContainer環境でブラウザ学習
- **📋 テンプレート**：[Microsoft Foundryテンプレート](../..)
- **📝 例**：[AZD展開例](examples/README.md)

#### 実践演習
```bash
# 最初のAIアプリケーションをデプロイする
azd init --template azure-search-openai-demo
azd up

# 追加のAIテンプレートを試す
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 章の成果**：RAG機能を備えたAI搭載チャットアプリを展開・設定する

**✅ 成功の検証：**
```bash
# 第2章の後、あなたは次のことができるようになっているはずです：
azd init --template azure-search-openai-demo
azd up
# AIチャットインターフェースをテストする
# 質問をして、情報源付きのAIによる回答を得る
# 検索連携が機能していることを確認する
azd monitor  # Application Insightsがテレメトリを表示しているか確認する
azd down --force --purge
```

**📊 時間投入：** 1-2時間  
**📈 習得レベル：** 本番環境対応のAIアプリケーションを展開・設定可能  
**💰 コスト意識：** 開発環境は月額80～150ドル、本番環境は月額300～3500ドルのコスト感覚を理解

#### 💰 AI展開におけるコスト考慮

**開発環境（目安80～150ドル/月）：**
- Azure OpenAI（従量課金）：トークン使用量により0～50ドル/月
- AI Search（ベーシックティア）：75ドル/月
- コンテナーアプリ（消費プラン）：0～20ドル/月
- ストレージ（標準）：1～5ドル/月

**本番環境（目安300～3500ドル+/月）：**
- Azure OpenAI（PTUで安定性能）：3000ドル以上/月 または 高ボリュームの従量課金
- AI Search（スタンダードティア）：250ドル/月
- コンテナーアプリ（専用プラン）：50～100ドル/月
- Application Insights：5～50ドル/月
- ストレージ（プレミアム）：10～50ドル/月

**💡 コスト最適化のヒント：**
- 学習時は**無料ティア**のAzure OpenAIを活用（50,000トークン/月込み）
- 開発しない時は`azd down`でリソースを解除
- 従量課金で開始し、本番でのみPTUにアップグレード
- `azd provision --preview`でデプロイ前にコスト見積り
- オートスケールを有効にして、実際の使用分だけ支払う

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
- リソース命名と整理

#### 学習リソース
- **📖 設定**：[設定ガイド](docs/getting-started/configuration.md) - 環境セットアップ
- **🔐 セキュリティ**：[認証パターンとマネージドID](docs/getting-started/authsecurity.md) - 認証パターン
- **📝 例**：[データベースアプリ例](examples/database-app/README.md) - AZDデータベース例

#### 実践演習
- 複数環境（開発、ステージング、本番）の設定
- マネージドID認証の設定
- 環境ごとの設定実装

**💡 章の成果**：複数環境を認証とセキュリティを守りつつ管理可能

---

### 🏗️ 第4章：Infrastructure as Codeとデプロイ
**前提条件**：第1～3章修了  
**所要時間**：1～1.5時間  
**難易度**：⭐⭐⭐

#### 学習内容
- 高度な展開パターン
- BicepでInfrastructure as Codeを実装
- リソースプロビジョニング戦略

#### 学習リソース
- **📖 デプロイ**：[デプロイガイド](docs/deployment/deployment-guide.md) - 完全なワークフロー
- **🏗️ プロビジョニング**：[リソースのプロビジョニング](docs/deployment/provisioning.md) - Azureリソース管理
- **📝 例**：[コンテナーアプリ例](../../examples/container-app) - コンテナ化された展開

#### 実践演習
- 独自のBicepテンプレート作成
- マルチサービスアプリのデプロイ
- ブルーグリーンデプロイ戦略の実装

**💡 章の成果**：カスタムインフラテンプレートを使用して複雑なマルチサービスアプリをデプロイ可能

---

### 🎯 第5章：マルチエージェントAIソリューション（上級）
**前提条件**：第1～2章修了  
**所要時間**：2-3時間  
**難易度**：⭐⭐⭐⭐

#### 学習内容
- マルチエージェントアーキテクチャパターン

- エージェントのオーケストレーションと調整
- 本番環境対応のAIデプロイメント

#### 学習リソース
- **🤖 注目プロジェクト**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - 完全実装
- **🛠️ ARMテンプレート**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - ワンクリックデプロイ
- **📖 アーキテクチャ**: [マルチエージェント調整パターン](/docs/pre-deployment/coordination-patterns.md) - パターン

#### 実践演習
```bash
# 完全な小売マルチエージェントソリューションを展開する
cd examples/retail-multiagent-arm-template
./deploy.sh

# エージェント構成を探る
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 本章の成果**: CustomerおよびInventoryエージェントを用いた本番対応マルチエージェントAIソリューションのデプロイと管理

---

### 🔍 第6章: デプロイ前の検証と計画
**前提条件**: 第4章完了  
**所要時間**: 1時間  
**難易度**: ⭐⭐

#### 学習内容
- キャパシティプランニングとリソース検証
- SKU選択戦略
- 事前チェックと自動化

#### 学習リソース
- **📊 プランニング**: [容量計画](docs/pre-deployment/capacity-planning.md) - リソース検証
- **💰 選択**: [SKU選択](docs/pre-deployment/sku-selection.md) - コスト効果の高い選択肢
- **✅ 検証**: [事前チェック](docs/pre-deployment/preflight-checks.md) - 自動化スクリプト

#### 実践演習
- キャパシティ検証スクリプトの実行
- コスト最適化のためのSKU選択
- 自動化された事前デプロイチェックの実装

**💡 本章の成果**: 実行前にデプロイを検証し最適化する

---

### 🚨 第7章: トラブルシューティングとデバッグ
**前提条件**: 任意のデプロイ章完了  
**所要時間**: 1～1.5時間  
**難易度**: ⭐⭐

#### 学習内容
- 体系的なデバッグ手法
- よくある問題とその解決策
- AI特有のトラブルシューティング

#### 学習リソース
- **🔧 共通問題**: [よくある問題](docs/troubleshooting/common-issues.md) - FAQと解決策
- **🕵️ デバッグ**: [デバッグガイド](docs/troubleshooting/debugging.md) - 段階的な戦略
- **🤖 AI問題**: [AI特有のトラブルシューティング](docs/troubleshooting/ai-troubleshooting.md) - AIサービス問題

#### 実践演習
- デプロイ失敗の診断
- 認証問題の解決
- AIサービスの接続問題のデバッグ

**💡 本章の成果**: 一般的なデプロイ問題を自力で診断し解決する

---

### 🏢 第8章: 本番環境およびエンタープライズパターン
**前提条件**: 第1～4章完了  
**所要時間**: 2～3時間  
**難易度**: ⭐⭐⭐⭐

#### 学習内容
- 本番環境デプロイ戦略
- エンタープライズセキュリティパターン
- 監視とコスト最適化

#### 学習リソース
- **🏭 本番運用**: [本番AIベストプラクティス](docs/microsoft-foundry/production-ai-practices.md) - エンタープライズパターン
- **📝 例**: [マイクロサービス例](../../examples/microservices) - 複雑なアーキテクチャ
- **📊 監視**: [Application Insights統合](docs/pre-deployment/application-insights.md) - 監視

#### 実践演習
- エンタープライズセキュリティパターンの実装
- 包括的な監視のセットアップ
- 適切なガバナンスの下での本番デプロイ

**💡 本章の成果**: 本番運用に耐えうるエンタープライズアプリケーションをデプロイする

---

## 🎓 ワークショップ概要: ハンズオン学習体験

> **⚠️ ワークショップ状態: 開発中**  
> ワークショップ教材は現在開発と調整中です。基本モジュールは機能していますが、一部高度なセクションは未完成です。全内容の完成に向けて鋭意作業中です。[進捗を確認 →](workshop/README.md)

### インタラクティブなワークショップ教材
**ブラウザベースのツールとガイド付き演習による包括的なハンズオン学習**

このワークショップ教材は、上記の章別カリキュラムを補完する体系的でインタラクティブな学習体験を提供します。セルフペース学習とインストラクター主導の両方に対応しています。

#### 🛠️ ワークショップ特徴
- **ブラウザベースのインターフェース**: 検索、コピー、テーマ機能付きのMkDocsベースワークショップ
- **GitHub Codespaces連携**: ワンクリックで開発環境セットアップ
- **構造化された学習パス**: 7ステップのガイド付き演習（合計3.5時間）
- **Discovery → Deployment → Customization**: 段階的手法
- **インタラクティブなDevContainer環境**: 事前構成済みツールと依存関係

#### 📚 ワークショップ構成
本ワークショップは **Discovery → Deployment → Customization** の流れに沿って進行します：

1. **Discoveryフェーズ** (45分)  
   - Microsoft Foundryテンプレートとサービスの探索  
   - マルチエージェントアーキテクチャパターンの理解  
   - デプロイ要件と前提条件の確認

2. **Deploymentフェーズ** (2時間)  
   - AZDによるAIアプリケーションのハンズオンデプロイ  
   - Azure AIサービスとエンドポイントの設定  
   - セキュリティおよび認証パターンの実装

3. **Customizationフェーズ** (45分)  
   - 特定ユースケース向けアプリケーションの修正  
   - 本番環境デプロイの最適化  
   - 監視およびコスト管理の実装

#### 🚀 ワークショップ開始方法
```bash
# オプション1: GitHub Codespaces（推奨）
# リポジトリで「Code」→「mainでcodespaceを作成」をクリック

# オプション2: ローカル開発
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.mdのセットアップ手順に従う
```
  
#### 🎯 ワークショップ学習成果
ワークショップ修了後、参加者は以下を習得します：  
- **本番環境AIアプリケーションのデプロイ**: Microsoft FoundryサービスとAZDを活用  
- **マルチエージェントアーキテクチャのマスター**: 調整されたAIエージェントソリューションの実装  
- **セキュリティベストプラクティスの実装**: 認証とアクセス制御の設定  
- **スケール最適化**: コスト効率とパフォーマンスを考慮した設計  
- **デプロイトラブルシューティング**: 一般的問題の独力解決

#### 📖 ワークショップリソース
- **🎥 インタラクティブガイド**: [ワークショップ教材](workshop/README.md) - ブラウザベースの学習環境  
- **📋 ステップバイステップ指示**: [ガイド付き演習](../../workshop/docs/instructions) - 詳細な手順  
- **🛠️ AIワークショップラボ**: [AIワークショップラボ](docs/microsoft-foundry/ai-workshop-lab.md) - AIに焦点を当てた演習  
- **💡 クイックスタート**: [ワークショップ設定ガイド](workshop/README.md#quick-start) - 環境構築

**対象**: 企業研修、大学講義、自己学習、開発者ブートキャンプに最適です。

---

## 📖 Azure Developer CLIとは？

Azure Developer CLI (azd) は、開発者に特化したコマンドラインインターフェースで、Azureへのアプリケーション構築とデプロイを迅速化します。以下を提供します：

- **テンプレートベースのデプロイ** - 一般的なアプリケーションパターンの事前構築済みテンプレートを利用  
- **インフラストラクチャコード化** - BicepやTerraformを用いたAzureリソース管理  
- **統合ワークフロー** - シームレスなプロビジョニング、デプロイ、監視  
- **開発者に優しい設計** - 生産性と操作性を最適化

### **AZD + Microsoft Foundry: AIデプロイに最適**

**AIソリューションにAZDが選ばれる理由** AZDはAI開発者が直面する主要課題に対応します：

- **AI対応テンプレート** - Azure OpenAI、Cognitive Services、MLワークロード向けの事前設定済みテンプレート  
- **安全なAIデプロイ** - AIサービス、APIキー、モデルエンドポイント向け組み込みセキュリティパターン  
- **本番向けAIパターン** - スケーラブルでコスト効率の高いAIアプリケーション展開のベストプラクティス  
- **エンドツーエンドAIワークフロー** - モデル開発から本番デプロイまでの監視体制含む  
- **コスト最適化** - AIワークロードに応じたスマートなリソース割当とスケーリング戦略  
- **Microsoft Foundry連携** - モデルカタログとエンドポイントへのシームレス接続

---

## 🎯 テンプレート＆サンプルライブラリ

### 注目：Microsoft Foundryテンプレート
**AIアプリケーションをデプロイするならここから！**

> **注:** これらのテンプレートは様々なAIパターンを実演しています。一部は外部のAzure Samplesであり、他はローカル実装です。

| テンプレート | 章 | 難易度 | サービス | 種類 |
|--------------|-----|---------|----------|------|
| [**AIチャット入門**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | 外部 |
| [**AIエージェント入門**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第2章 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | 外部 |
| [**Azure Search + OpenAI デモ**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | 外部 |
| [**OpenAIチャットアプリクイックスタート**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | 外部 |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **ローカル** |

### 注目：完全学習シナリオ
**学習章に対応した本番対応アプリケーションテンプレート**

| テンプレート | 学習章 | 難易度 | 主要学習内容 |
|--------------|---------|---------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | 基本的なAIデプロイパターン |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | Azure AI SearchによるRAG実装 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第4章 | ⭐⭐ | ドキュメントインテリジェンス統合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | エージェントフレームワークとファンクションコール |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐ | エンタープライズAIオーケストレーション |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | CustomerとInventoryエージェントによるマルチエージェントアーキテクチャ |

### 例の種類で学ぶ

> **📌 ローカルと外部の例の違い:**  
> **ローカル例**（本リポジトリ内）= すぐに利用可能  
> **外部例**（Azure Samples）= リンク先リポジトリからクローン

#### ローカル例（すぐに使える）
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARMテンプレート付きの本番対応完全実装  
  - マルチエージェントアーキテクチャ（Customer + Inventoryエージェント）  
  - 包括的な監視と評価  
  - ARMテンプレートによるワンクリックデプロイ

#### ローカル例 - コンテナアプリ（第2～5章）
**本リポジトリ内の包括的コンテナデプロイ例：**  
- [**コンテナアプリ例**](examples/container-app/README.md) - コンテナ化デプロイ完全ガイド  
  - [シンプルFlask API](../../examples/container-app/simple-flask-api) - スケール・トゥ・ゼロの基本REST API  
  - [マイクロサービスアーキテクチャ](../../examples/container-app/microservices) - 本番対応の複数サービスデプロイ  
  - クイックスタート、生産、上級パターン  
  - 監視、セキュリティ、コスト最適化のガイダンス

#### 外部例 - シンプルアプリ（第1～2章）  
**以下Azure Samplesリポジトリをクローンして開始：**  
- [シンプルWebアプリ - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本的なデプロイパターン  
- [静的サイト - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 静的コンテンツデプロイ  
- [コンテナアプリ - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST APIデプロイ

#### 外部例 - データベース統合（第3～4章）  
- [データベースアプリ - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - データベース接続パターン  
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - サーバーレスデータワークフロー

#### 外部例 - 高度なパターン（第4～8章）  
- [Javaマイクロサービス](https://github.com/Azure-Samples/java-microservices-aca-lab) - マルチサービスアーキテクチャ  
- [コンテナアプリジョブ](https://github.com/Azure-Samples/container-apps-jobs) - バックグラウンド処理  
- [エンタープライズMLパイプライン](https://github.com/Azure-Samples/mlops-v2) - 本番対応MLパターン

### 外部テンプレートコレクション
- [**公式AZDテンプレートギャラリー**](https://azure.github.io/awesome-azd/) - 公式およびコミュニティテンプレート集  
- [**Azure Developer CLIテンプレート**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learnテンプレートドキュメント
- [**Examples Directory**](examples/README.md) - 詳細な説明付きのローカル学習用例

---

## 📚 学習リソース＆参考資料

### クイックリファレンス
- [**コマンド チートシート**](resources/cheat-sheet.md) - 章ごとに整理された必須 azd コマンド
- [**用語集**](resources/glossary.md) - Azure と azd の用語集  
- [**FAQ**](resources/faq.md) - 学習章ごとのよくある質問
- [**学習ガイド**](resources/study-guide.md) - 総合的な練習問題集

### ハンズオンワークショップ
- [**AI ワークショップラボ**](docs/microsoft-foundry/ai-workshop-lab.md) - AI ソリューションを AZD デプロイ可能にする（2～3時間）
- [**インタラクティブワークショップガイド**](workshop/README.md) - MkDocs と DevContainer 環境でのブラウザベースワークショップ
- [**構造化学習パス**](../../workshop/docs/instructions) - 7ステップのガイド付き演習（発見 → デプロイ → カスタマイズ）
- [**AZD 初心者ワークショップ**](workshop/README.md) - GitHub Codespaces 統合済みの完全ハンズオンワークショップ資料

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
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# インストールを確認してください
azd version
```

### ❌ "No subscription found" または "Subscription not set"

```bash
# 利用可能なサブスクリプションの一覧を表示
az account list --output table

# デフォルトサブスクリプションを設定
az account set --subscription "<subscription-id-or-name>"

# AZD環境の設定
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# 検証する
az account show
```

### ❌ "InsufficientQuota" または "Quota exceeded"

```bash
# 別のAzureリージョンを試してください
azd env set AZURE_LOCATION "westus2"
azd up

# または開発環境でより小さいSKUを使用してください
# infra/main.parameters.jsonを編集してください:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" が途中で失敗する

```bash
# オプション1：クリーンして再試行
azd down --force --purge
azd up

# オプション2：インフラを修正するだけ
azd provision

# オプション3：詳細なログを確認する
azd show
azd logs
```

### ❌ "Authentication failed" または "Token expired"

```bash
# 再認証してください
az logout
az login

azd auth logout
azd auth login

# 認証を確認してください
az account show
```

### ❌ "Resource already exists" または命名の競合

```bash
# AZDは一意の名前を生成しますが、もし競合があれば：
azd down --force --purge

# その場合は新しい環境で再試行します
azd env new dev-v2
azd up
```

### ❌ テンプレートのデプロイに時間がかかりすぎる

**通常の待機時間：**
- シンプルな Web アプリ：5～10分
- データベース付きアプリ：10～15分
- AI アプリケーション：15～25分（OpenAI プロビジョニングは遅い）

```bash
# 進行状況を確認する
azd show

# 30分以上停止している場合は、Azure ポータルを確認してください:
azd monitor
# 失敗したデプロイを探す
```

### ❌ "Permission denied" または "Forbidden"

```bash
# Azureの役割を確認してください
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 少なくとも「共同作成者」ロールが必要です
# Azure管理者に次の許可を依頼してください：
# - 共同作成者（リソース用）
# - ユーザーアクセス管理者（ロール割り当て用）
```

### ❌ デプロイ済みアプリケーションの URL が見つからない

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

- **よくある問題ガイド:** [詳細な解決策](docs/troubleshooting/common-issues.md)
- **AI 固有の問題:** [AI トラブルシューティング](docs/troubleshooting/ai-troubleshooting.md)
- **デバッグガイド:** [段階的デバッグ方法](docs/troubleshooting/debugging.md)
- **サポートを受ける:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 クイックトラブルシューティングガイド

**初心者がよく直面する問題と即時解決策：**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# まず AZD をインストールしてください
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

# AZD 環境用に設定
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# 検証する
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" または "Quota exceeded"</strong></summary>

```bash
# 別の Azure リージョンを試してください
azd env set AZURE_LOCATION "westus2"
azd up

# または開発環境では小さい SKU を使用してください
# infra/main.parameters.json を編集してください:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" が途中で失敗する</strong></summary>

```bash
# オプション1：クリーンして再試行
azd down --force --purge
azd up

# オプション2：インフラストラクチャのみ修正
azd provision

# オプション3：詳細ログを確認する
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
<summary><strong>❌ "Resource already exists" または命名の競合</strong></summary>

```bash
# AZDは一意の名前を生成しますが、競合が発生した場合は：
azd down --force --purge

# 新しい環境で再試行します
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ テンプレートのデプロイに時間がかかりすぎる</strong></summary>

**通常の待機時間：**
- シンプルな Web アプリ：5～10分
- データベース付きアプリ：10～15分
- AI アプリケーション：15～25分（OpenAI プロビジョニングは遅い）

```bash
# 進行状況を確認する
azd show

# 30分以上停止している場合は、Azure ポータルを確認してください:
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
# Azure管理者に次の権限の付与を依頼してください:
# - Contributor（リソース用）
# - User Access Administrator（ロール割り当て用）
```
</details>

<details>
<summary><strong>❌ デプロイ済みアプリケーションの URL が見つからない</strong></summary>

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

- **よくある問題ガイド:** [詳細な解決策](docs/troubleshooting/common-issues.md)
- **AI 固有の問題:** [AI トラブルシューティング](docs/troubleshooting/ai-troubleshooting.md)
- **デバッグガイド:** [段階的デバッグ方法](docs/troubleshooting/debugging.md)
- **サポートを受ける:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 コース完了＆認定

### 進捗状況の追跡
各章の学習進捗を記録してください：

- [ ] **第1章**: 基礎＆クイックスタート ✅
- [ ] **第2章**: AIファースト開発 ✅  
- [ ] **第3章**: 設定＆認証 ✅
- [ ] **第4章**: インフラストラクチャコード＆デプロイ ✅
- [ ] **第5章**: マルチエージェントAIソリューション ✅
- [ ] **第6章**: 事前デプロイ検証＆計画 ✅
- [ ] **第7章**: トラブルシューティング＆デバッグ ✅
- [ ] **第8章**: 本番＆エンタープライズパターン ✅

### 学習確認
各章を完了したら、以下で知識を確認してください：
1. **実務演習**: 章のハンズオンデプロイを完了する
2. **知識チェック**: 章のFAQセクションをレビュー
3. **コミュニティディスカッション**: Azure Discord で経験を共有
4. **次章へ進む**: 次の難易度レベルへ移動

### コース完了のメリット
全章を完了すると以下が得られます：
- **実務経験**: 実際に Azure へAIアプリケーションをデプロイ
- **専門スキル**: エンタープライズ対応のデプロイ能力  
- **コミュニティ認知**: Azure 開発者コミュニティのアクティブメンバー
- **キャリア向上**: 需要が高い AZD と AI デプロイの専門知識

---

## 🤝 コミュニティ＆サポート

### サポート＆ヘルプ
- **技術的問題**: [バグ報告＆機能リクエスト](https://github.com/microsoft/azd-for-beginners/issues)
- **学習質問**: [Microsoft Azure Discord コミュニティ](https://discord.gg/microsoft-azure) と [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 固有サポート**: [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) に参加
- **ドキュメント**: [公式 Azure Developer CLI ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord からのコミュニティインサイト

**#Azure チャンネルの最近の投票結果：**
- **45%** の開発者が AI ワークロードに AZD を使いたい
- **主な課題**: マルチサービス展開、資格情報管理、本番運用の準備  
- **要望が多いもの**: AI 固有テンプレート、トラブルシューティングガイド、ベストプラクティス

**コミュニティに参加して：**
- AZD と AI の経験を共有しサポートを得る
- 新しい AI テンプレートの早期プレビューアクセス
- AI デプロイのベストプラクティスに貢献
- 将来の AI ＋ AZD 機能開発に影響を与える

### コースへの貢献
貢献を歓迎します！詳細は[貢献ガイド](CONTRIBUTING.md)をご覧ください：
- **コンテンツ改善**: 既存章やサンプルの強化
- **新しい例の追加**: 実世界のシナリオやテンプレート  
- **翻訳支援**: 多言語サポートの維持
- **バグ報告**: 正確性と明瞭性の向上
- **コミュニティ規範**: 包摂的なコミュニティガイドラインの遵守

---

## 📄 コース情報

### ライセンス
このプロジェクトは MIT ライセンスのもとで提供されています。詳細は [LICENSE](../../LICENSE) ファイルをご覧ください。

### 関連する Microsoft 学習リソース

当チームは他の総合的な学習コースも制作しています：

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

---

### Azure / Edge / MCP / Agents
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI シリーズ
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### コア学習
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![初心者向けAI](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![初心者向けサイバーセキュリティ](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![初心者向けWeb開発](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![初心者向けIoT](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![初心者向けXR開発](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot シリーズ
[![AIペアプログラミング向けCopilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET向けCopilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilotアドベンチャー](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ コースナビゲーション

**🚀 学習を始める準備はできましたか？**

**初心者向け**: [第1章: 基礎とクイックスタート](../..) から始めましょう  
**AI開発者向け**: [第2章: AIファースト開発](../..) に進みましょう  
**経験豊富な開発者向け**: [第3章: 設定と認証](../..) から始めましょう

**次のステップ**: [第1章を始める - AZDの基本](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：  
本書類はAI翻訳サービス「Co-op Translator」（https://github.com/Azure/co-op-translator）を使用して翻訳されました。正確性を期していますが、自動翻訳には誤りや不正確な箇所が含まれる場合があります。原文はあくまで権威ある情報源としてご参照ください。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じた誤解や誤訳について、当方は一切の責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->