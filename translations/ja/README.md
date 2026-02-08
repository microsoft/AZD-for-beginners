# AZD 初心者向け: 構造化された学習の旅

![AZD-初心者向け](../../translated_images/ja/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 自動翻訳（常に最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[アラビア語](../ar/README.md) | [ベンガル語](../bn/README.md) | [ブルガリア語](../bg/README.md) | [ビルマ語（ミャンマー）](../my/README.md) | [中国語（簡体字）](../zh-CN/README.md) | [中国語（繁体字、香港）](../zh-HK/README.md) | [中国語（繁体字、マカオ）](../zh-MO/README.md) | [中国語（繁体字、台湾）](../zh-TW/README.md) | [クロアチア語](../hr/README.md) | [チェコ語](../cs/README.md) | [デンマーク語](../da/README.md) | [オランダ語](../nl/README.md) | [エストニア語](../et/README.md) | [フィンランド語](../fi/README.md) | [フランス語](../fr/README.md) | [ドイツ語](../de/README.md) | [ギリシャ語](../el/README.md) | [ヘブライ語](../he/README.md) | [ヒンディー語](../hi/README.md) | [ハンガリー語](../hu/README.md) | [インドネシア語](../id/README.md) | [イタリア語](../it/README.md) | [日本語](./README.md) | [カンナダ語](../kn/README.md) | [韓国語](../ko/README.md) | [リトアニア語](../lt/README.md) | [マレー語](../ms/README.md) | [マラヤーラム語](../ml/README.md) | [マラーティー語](../mr/README.md) | [ネパール語](../ne/README.md) | [ナイジェリア・ピジン語](../pcm/README.md) | [ノルウェー語](../no/README.md) | [ペルシア語（ファールシー）](../fa/README.md) | [ポーランド語](../pl/README.md) | [ポルトガル語（ブラジル）](../pt-BR/README.md) | [ポルトガル語（ポルトガル）](../pt-PT/README.md) | [パンジャブ語（グルムキー）](../pa/README.md) | [ルーマニア語](../ro/README.md) | [ロシア語](../ru/README.md) | [セルビア語（キリル）](../sr/README.md) | [スロバキア語](../sk/README.md) | [スロベニア語](../sl/README.md) | [スペイン語](../es/README.md) | [スワヒリ語](../sw/README.md) | [スウェーデン語](../sv/README.md) | [タガログ語（フィリピン）](../tl/README.md) | [タミル語](../ta/README.md) | [テルグ語](../te/README.md) | [タイ語](../th/README.md) | [トルコ語](../tr/README.md) | [ウクライナ語](../uk/README.md) | [ウルドゥー語](../ur/README.md) | [ベトナム語](../vi/README.md)

> **ローカルにクローンする方が良いですか？**

> このリポジトリには50以上の言語翻訳が含まれており、ダウンロードサイズが大幅に増加します。翻訳を含めずにクローンするには、スパースチェックアウトを使用してください：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> これにより、コースを完了するために必要なすべての内容が、はるかに速いダウンロードで取得できます。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Azure Developer CLI (azd) とは？

**Azure Developer CLI (azd)** は、開発者に優しいコマンドラインツールで、Azureへのアプリケーションのデプロイを簡単にします。手動で多数のAzureリソースを作成して接続する代わりに、単一のコマンドでアプリケーション全体をデプロイできます。

### `azd up` の魔法

```bash
# この単一のコマンドですべて行います：
# ✅ すべてのAzureリソースを作成します
# ✅ ネットワークとセキュリティを構成します
# ✅ アプリケーションコードをビルドします
# ✅ Azureにデプロイします
# ✅ 動作するURLを提供します
azd up
```

**これで完了です！** Azure ポータルをクリックする必要はありません、最初に複雑な ARM テンプレートを学ぶ必要もありません、手動での構成も不要です - Azure 上で動作するアプリケーションだけが残ります。

---

## ❓ Azure Developer CLI と Azure CLI: 違いは何ですか？

これは初心者が最もよく尋ねる質問です。簡単な答えは以下の通りです：

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Purpose** | Manage individual Azure resources | Deploy complete applications |
| **Mindset** | Infrastructure-focused | Application-focused |
| **Example** | `az webapp create --name myapp...` | `azd up` |
| **Learning Curve** | Must know Azure services | Just know your app |
| **Best For** | DevOps, Infrastructure | Developers, Prototyping |

### わかりやすい例え

- **Azure CLI** は家を建てるためのすべての工具（ハンマー、ノコ、釘）を持っているようなものです。何でも作れますが、建築の知識が必要です。
- **Azure Developer CLI** は請負業者を雇うようなものです - あなたが望むものを説明すれば、彼らが建設を担当します。

### どちらを使うべきか

| Scenario | Use This |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### 両方を併用できます！

AZD は内部で Azure CLI を使用しています。両方を併用できます：
```bash
# AZDを使ってアプリをデプロイします
azd up

# その後、Azure CLIで特定のリソースを微調整します
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD でテンプレートを見つける

ゼロから始めないでください！**Awesome AZD** はワンクリックでデプロイできるテンプレートのコミュニティコレクションです：

| Resource | Description |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | ワンクリックでデプロイできる200以上のテンプレートを閲覧 |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | 自分のテンプレートをコミュニティに投稿 |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | スターを付けてソースを閲覧 |

### Awesome AZD の人気 AI テンプレート

```bash
# Azure OpenAI + AI検索を使ったRAGチャット
azd init --template azure-search-openai-demo

# クイックAIチャットアプリケーション
azd init --template openai-chat-app-quickstart

# FoundryエージェントによるAIエージェント
azd init --template get-started-with-ai-agents
```

---

## 🎯 3つのステップで始める

### ステップ1：AZD をインストール（2分）

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### ステップ2：Azure にログイン

```bash
azd auth login
```

### ステップ3：最初のアプリをデプロイ

```bash
# テンプレートから初期化する
azd init --template todo-nodejs-mongo

# Azureにデプロイする（すべてを作成します！）
azd up
```

**🎉 これで完了です！** お使いのアプリは Azure 上で公開されました。

### クリーンアップ（忘れずに！）

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 このコースの使い方

このコースは**段階的な学習**のために設計されています。自分に合ったところから始めて、順に進んでください：

| Your Experience | Start Here |
|-----------------|------------|
| **Azure が初めて** | [第1章：基礎](../..) |
| **Azure は知っているが AZD は初めて** | [第1章：基礎](../..) |
| **AI アプリをデプロイしたい** | [第2章：AI 開発](../..) |
| **実践的な練習をしたい** | [🎓 インタラクティブワークショップ](workshop/README.md) - 3-4 hour guided lab |
| **本番向けパターンが必要** | [第8章：本番 & エンタープライズ](../..) |

### クイックセットアップ

1. **このリポジトリをフォーク**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **クローンする**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **ヘルプを得る**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **ローカルにクローンする方が良いですか？**

> このリポジトリには50以上の言語翻訳が含まれており、ダウンロードサイズが大幅に増加します。翻訳を含めずにクローンするには、スパースチェックアウトを使用してください：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> これにより、コースを完了するために必要なすべての内容が、はるかに速いダウンロードで取得できます。


## コース概要

段階的な学習のために設計された構成化された章を通じて Azure Developer CLI (azd) を習得します。**Microsoft Foundry 統合による AI アプリケーションのデプロイに特別な焦点を当てています。**

### なぜこのコースが現代の開発者に必須なのか

Microsoft Foundry Discord コミュニティのインサイトに基づき、**開発者の45%が AI ワークロードに AZD を使いたい**と考えていますが、以下の課題に直面しています：
- 複雑なマルチサービスの AI アーキテクチャ
- 本番環境の AI デプロイにおけるベストプラクティス  
- Azure AI サービスの統合と構成
- AI ワークロードのコスト最適化
- AI 固有のデプロイ問題のトラブルシューティング

### 学習目標

この構成化されたコースを修了すると、あなたは：
- **AZD の基本を習得する**: コア概念、インストール、構成
- **AI アプリケーションをデプロイする**: AZD を Microsoft Foundry サービスと共に使用
- **Infrastructure as Code（IaC）を実装する**: Bicep テンプレートで Azure リソースを管理
- **デプロイのトラブルシューティング**: 一般的な問題を解決し、デバッグする
- **本番最適化**: セキュリティ、スケーリング、監視、コスト管理
- **マルチエージェントソリューションを構築**: 複雑な AI アーキテクチャをデプロイ

## 🗺️ コースマップ：章別クイックナビゲーション

各章には学習目標、クイックスタート、演習を含む専用の README があります：

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[第1章：基礎](docs/chapter-01-foundation/README.md)** | はじめに | [AZD 基礎](docs/chapter-01-foundation/azd-basics.md) &#124; [インストール](docs/chapter-01-foundation/installation.md) &#124; [最初のプロジェクト](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[第2章：AI 開発](docs/chapter-02-ai-development/README.md)** | AI ファーストアプリ | [Foundry 統合](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI エージェント](docs/chapter-02-ai-development/agents.md) &#124; [モデルデプロイ](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [ワークショップ](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[第3章：設定](docs/chapter-03-configuration/README.md)** | 認証とセキュリティ | [構成](docs/chapter-03-configuration/configuration.md) &#124; [認証とセキュリティ](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[第4章：インフラ](docs/chapter-04-infrastructure/README.md)** | IaC とデプロイメント | [デプロイガイド](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [プロビジョニング](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AIエージェントソリューション | [小売シナリオ](examples/retail-scenario.md) &#124; [協調パターン](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 時間 | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | 計画と検証 | [事前チェック](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [容量計画](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU 選定](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 時間 | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | デバッグと修正 | [よくある問題](docs/chapter-07-troubleshooting/common-issues.md) &#124; [デバッグ](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI に関する問題](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 時間 | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | エンタープライズパターン | [本番運用の実践](docs/chapter-08-production/production-ai-practices.md) | 2-3 時間 | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | ハンズオンラボ | [導入](workshop/docs/instructions/0-Introduction.md) &#124; [テンプレート選択](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [検証](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [分解](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [構成](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [カスタマイズ](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [インフラの撤去](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [まとめ](workshop/docs/instructions/7-Wrap-up.md) | 3-4 時間 | ⭐⭐ |

**合計コース所要時間:** ~10～14時間 | **スキルの進行:** 初心者 → 本番対応

---

## 📚 学習章

*経験レベルと目標に応じて学習パスを選択してください*

### 🚀 Chapter 1: 基礎とクイックスタート
**前提条件**: Azure サブスクリプション、基本的なコマンドラインの知識  
**所要時間**: 30～45分  
**複雑度**: ⭐

#### 学ぶこと
- Azure Developer CLI の基本を理解する
- プラットフォームへの AZD のインストール
- 最初のデプロイの成功

#### 学習リソース
- **🎯 ここから開始**: [Azure Developer CLI とは？](../..)
- **📖 理論**: [AZD 基礎](docs/chapter-01-foundation/azd-basics.md) - コア概念と用語
- **⚙️ 設定**: [インストールとセットアップ](docs/chapter-01-foundation/installation.md) - プラットフォーム別ガイド
- **🛠️ ハンズオン**: [最初のプロジェクト](docs/chapter-01-foundation/first-project.md) - ステップバイステップのチュートリアル
- **📋 クイックリファレンス**: [コマンドチートシート](resources/cheat-sheet.md)

#### 実習
```bash
# インストールの簡単な確認
azd version

# 最初のアプリケーションをデプロイする
azd init --template todo-nodejs-mongo
azd up
```

**💡 章の成果**: AZD を使用して Azure にシンプルなウェブアプリケーションをデプロイすることに成功する

**✅ 成功の検証:**
```bash
# 第1章を完了すると、以下のことができるようになります:
azd version              # インストールされているバージョンを表示します
azd init --template todo-nodejs-mongo  # プロジェクトを初期化します
azd up                  # Azure にデプロイします
azd show                # 実行中のアプリのURLを表示します
# アプリがブラウザで開き、動作します
azd down --force --purge  # リソースをクリーンアップします
```

**📊 所要時間:** 30～45分  
**📈 習得後のスキルレベル:** 基本的なアプリケーションを独力でデプロイできる

**✅ 成功の検証:**
```bash
# 第1章を完了した後、次のことができるようになります:
azd version              # インストールされているバージョンを表示します
azd init --template todo-nodejs-mongo  # プロジェクトを初期化します
azd up                  # Azureにデプロイします
azd show                # 実行中のアプリのURLを表示します
# アプリケーションがブラウザで開き、正常に動作します
azd down --force --purge  # リソースをクリーンアップします
```

**📊 所要時間:** 30～45分  
**📈 習得後のスキルレベル:** 基本的なアプリケーションを独力でデプロイできる

---

### 🤖 Chapter 2: AIファースト開発（AI 開発者向け推奨）
**前提条件**: Chapter 1 完了  
**所要時間**: 1-2 時間  
**複雑度**: ⭐⭐

#### 学ぶこと
- Microsoft Foundry と AZD の統合
- AI 搭載アプリケーションのデプロイ
- AI サービス構成の理解

#### 学習リソース
- **🎯 ここから開始**: [Microsoft Foundry 統合](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI エージェント**: [AI エージェント ガイド](docs/chapter-02-ai-development/agents.md) - AZD でインテリジェントエージェントをデプロイする
- **📖 パターン**: [AI モデルのデプロイ](docs/chapter-02-ai-development/ai-model-deployment.md) - AI モデルのデプロイと管理
- **🛠️ ワークショップ**: [AI ワークショップラボ](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI ソリューションを AZD 対応にする
- **🎥 インタラクティブガイド**: [Workshop Materials](workshop/README.md) - Browser-based learning with MkDocs * DevContainer Environment
- **📋 テンプレート**: [Microsoft Foundry テンプレート](../..)
- **📝 例**: [AZD デプロイの例](examples/README.md)

#### 実習
```bash
# 最初のAIアプリケーションをデプロイする
azd init --template azure-search-openai-demo
azd up

# 追加のAIテンプレートを試す
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 章の成果**: RAG 機能を備えた AI チャットアプリケーションをデプロイして構成する

**✅ 成功の検証:**
```bash
# 第2章の後、以下のことができるようになります:
azd init --template azure-search-openai-demo
azd up
# AIチャットインターフェースをテストする
# 質問をして、情報源付きのAIによる応答を得る
# 検索統合が機能することを確認する
azd monitor  # Application Insightsにテレメトリが表示されているか確認する
azd down --force --purge
```

**📊 所要時間:** 1-2 時間  
**📈 習得後のスキルレベル:** 本番対応の AI アプリケーションをデプロイして構成できる  
**💰 コストの目安:** 開発環境 $80-150/月、 本番環境 $300-3500/月 を理解する

#### 💰 AI デプロイのコストに関する考慮事項

**開発環境（推定 $80-150/月）:**
- Azure OpenAI（従量課金）: $0-50/月（トークン使用量に基づく）
- AI Search（Basic ティア）: $75/月
- Container Apps（従量課金）: $0-20/月
- ストレージ（Standard）: $1-5/月

**本番環境（推定 $300-3,500+/月）:**
- Azure OpenAI（安定したパフォーマンスのための PTU）: $3,000+/月 または 高負荷時の従量課金
- AI Search（Standard ティア）: $250/月
- Container Apps（専用）: $50-100/月
- Application Insights: $5-50/月
- ストレージ（Premium）: $10-50/月

**💡 コスト最適化のヒント:**
- 学習には **Free Tier** の Azure OpenAI を使用する（50,000 トークン/月が含まれます）
- アクティブに開発していないときは `azd down` を実行してリソースを解放する
- まずは従量課金ベースで開始し、本番のみ PTU にアップグレードする
- デプロイ前にコストを見積もるために `azd provision --preview` を使用する
- オートスケーリングを有効にする：実際の使用量に対してのみ支払う

**コスト監視:**
```bash
# 推定月額費用を確認する
azd provision --preview

# Azure ポータルで実際の費用を監視する
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Chapter 3: 構成と認証
**前提条件**: Chapter 1 完了  
**所要時間**: 45-60 分  
**複雑度**: ⭐⭐

#### 学ぶこと
- 環境の構成と管理
- 認証とセキュリティのベストプラクティス
- リソース命名と整理

#### 学習リソース
- **📖 構成**: [構成ガイド](docs/chapter-03-configuration/configuration.md) - 環境設定
- **🔐 セキュリティ**: [認証パターンとマネージドアイデンティティ](docs/chapter-03-configuration/authsecurity.md) - 認証パターン
- **📝 例**: [データベースアプリの例](examples/database-app/README.md) - AZD データベース例

#### 実習
- 複数環境（dev、staging、prod）を構成する
- マネージドアイデンティティ認証を設定する
- 環境固有の構成を実装する

**💡 章の成果**: 適切な認証とセキュリティを備えた複数環境を管理する

---

### 🏗️ Chapter 4: インフラストラクチャ as Code とデプロイ
**前提条件**: Chapters 1-3 完了  
**所要時間**: 1-1.5 時間  
**複雑度**: ⭐⭐⭐

#### 学ぶこと
- 高度なデプロイパターン
- Bicep を使った Infrastructure as Code
- リソースプロビジョニング戦略

#### 学習リソース
- **📖 デプロイ**: [デプロイガイド](docs/chapter-04-infrastructure/deployment-guide.md) - 完全なワークフロー
- **🏗️ プロビジョニング**: [リソースのプロビジョニング](docs/chapter-04-infrastructure/provisioning.md) - Azure リソース管理
- **📝 例**: [Container App の例](../../examples/container-app) - コンテナ化されたデプロイ

#### 実習
- カスタム Bicep テンプレートを作成する
- マルチサービスアプリケーションをデプロイする
- ブルーグリーンデプロイ戦略を実装する

**💡 章の成果**: カスタムインフラテンプレートを使用して複雑なマルチサービスアプリケーションをデプロイする

---

### 🎯 Chapter 5: マルチエージェント AI ソリューション（上級）
**前提条件**: Chapters 1-2 完了  
**所要時間**: 2-3 時間  
**複雑度**: ⭐⭐⭐⭐

#### 学ぶこと
- マルチエージェントのアーキテクチャパターン
- エージェントのオーケストレーションと協調
- 本番対応の AI デプロイ

#### 学習リソース
- **🤖 注目プロジェクト**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - 完全な実装
- **🛠️ ARM テンプレート**: [ARM テンプレートパッケージ](../../examples/retail-multiagent-arm-template) - ワンクリックデプロイ
- **📖 アーキテクチャ**: [マルチエージェントの協調パターン](docs/chapter-06-pre-deployment/coordination-patterns.md) - パターン

#### 実習
```bash
# 小売向けの完全なマルチエージェントソリューションを展開する
cd examples/retail-multiagent-arm-template
./deploy.sh

# エージェントの構成を確認する
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 章の成果**: Customer エージェントと Inventory エージェントを含む本番対応のマルチエージェント AI ソリューションをデプロイして管理する

---

### 🔍 Chapter 6: 事前デプロイの検証と計画
**前提条件**: Chapter 4 完了  
**所要時間**: 1 時間  
**複雑度**: ⭐⭐

#### 学ぶこと
- 容量計画とリソース検証
- SKU 選定戦略
- 事前チェックと自動化

#### 学習リソース
- **📊 計画**: [容量計画](docs/chapter-06-pre-deployment/capacity-planning.md) - リソース検証
- **💰 選定**: [SKU 選定](docs/chapter-06-pre-deployment/sku-selection.md) - コスト効率の良い選択
- **✅ 検証**: [事前チェック](docs/chapter-06-pre-deployment/preflight-checks.md) - 自動化スクリプト

#### 実習
- 容量検証スクリプトを実行する
- コストを考慮した SKU 選定を最適化する
- 自動化された事前デプロイチェックを実装する

**💡 章の成果**: デプロイ実行前に展開を検証して最適化する

---

### 🚨 Chapter 7: トラブルシューティングとデバッグ
**前提条件**: いずれかのデプロイ章を完了  
**所要時間**: 1-1.5 時間  
**複雑度**: ⭐⭐

#### 学ぶこと
- 系統的なデバッグ手法
- よくある問題とその解決策
- AI 特有のトラブルシューティング

#### 学習リソース
- **🔧 よくある問題**: [よくある問題](docs/chapter-07-troubleshooting/common-issues.md) - FAQ と解決策
- **🕵️ デバッグ**: [デバッグガイド](docs/chapter-07-troubleshooting/debugging.md) - ステップバイステップの戦略
- **🤖 AI の問題**: [AI 専用トラブルシューティング](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI サービスの問題

#### 実習
- デプロイ失敗を診断する
- 認証の問題を解決する
- AI サービスの接続性をデバッグする

**💡 章の成果**: 一般的なデプロイの問題を独力で診断して解決する

---

### 🏢 Chapter 8: 本番運用とエンタープライズパターン
**前提条件**: Chapters 1-4 完了  
**所要時間**: 2-3 時間  
**複雑度**: ⭐⭐⭐⭐

#### 学ぶこと
- 本番デプロイ戦略
- エンタープライズセキュリティパターン
- モニタリングとコスト最適化

#### 学習リソース
- **🏭 本番運用**: [本番運用のベストプラクティス](docs/chapter-08-production/production-ai-practices.md) - エンタープライズパターン
- **📝 例**: [マイクロサービスの例](../../examples/microservices) - 複雑なアーキテクチャ
- **📊 モニタリング**: [Application Insights 統合](docs/chapter-06-pre-deployment/application-insights.md) - モニタリング

#### 実習
- エンタープライズセキュリティパターンを実装する
- 包括的なモニタリングを設定する
- 適切なガバナンスで本番へデプロイする

**💡 章の成果**: フル機能の本番対応アプリケーションをデプロイする

---

## 🎓 ワークショップ概要: ハンズオン学習体験

> **⚠️ WORKSHOP STATUS: Active Development**  
> ワークショップ資料は現在開発および調整中です。コアモジュールは機能していますが、一部の上級セクションは未完成です。コンテンツの完成に向けて積極的に作業しています。 [進捗を追跡 →](workshop/README.md)

### インタラクティブなワークショップ資料
**ブラウザベースのツールとガイド付き演習による総合的なハンズオン学習**
私たちのワークショップ資料は、上の章ベースのカリキュラムを補完する、構造化されたインタラクティブな学習体験を提供します。ワークショップは自己学習とインストラクター主導のセッションの両方を想定して設計されています。

#### 🛠️ ワークショップの特徴
- **Browser-Based Interface**: 検索、コピー、テーマ機能を備えたMkDocsベースのブラウザワークショップ
- **GitHub Codespaces Integration**: ワンクリックで開発環境をセットアップ
- **Structured Learning Path**: 8モジュールのガイド付き演習（合計3〜4時間）
- **Progressive Methodology**: 導入 → 選択 → 検証 → 分解 → 構成 → カスタマイズ → クリーンダウン → まとめ
- **Interactive DevContainer Environment**: 事前構成されたツールと依存関係

#### 📚 ワークショップモジュール構成
ワークショップは、探索からデプロイの習熟まで導く「8モジュールの漸進的手法」に従います:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Introduction** | ワークショップ概要 | 学習目標、前提条件、ワークショップ構成を理解する | 15 分 |
| **1. Selection** | テンプレートの選定 | AZDテンプレートを探索し、シナリオに適したAIテンプレートを選択する | 20 分 |
| **2. Validation** | デプロイと検証 | `azd up`でテンプレートをデプロイし、インフラが動作することを確認する | 30 分 |
| **3. Deconstruction** | 構造の理解 | GitHub Copilotを使用してテンプレートのアーキテクチャ、Bicepファイル、コードの構成を調査する | 30 分 |
| **4. Configuration** | azure.yaml 深掘り | `azure.yaml`の構成、ライフサイクルフック、環境変数を習得する | 30 分 |
| **5. Customization** | カスタマイズ | AI Search、有効化、トレース、評価を有効にし、シナリオに合わせてカスタマイズする | 45 分 |
| **6. Teardown** | クリーンアップ | `azd down --purge`で安全にリソースを削除する | 15 分 |
| **7. Wrap-up** | 次のステップ | 成果、重要な概念を振り返り、学習を継続する方法を確認する | 15 分 |

**Workshop Flow:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 ワークショップの始め方
```bash
# オプション 1: GitHub Codespaces（推奨）
# リポジトリ内で "Code" をクリックし、"Create codespace on main" を選択してください

# オプション 2: ローカル開発
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md にあるセットアップ手順に従ってください
```

#### 🎯 ワークショップの学習成果
ワークショップを完了すると、参加者は以下を達成できます:
- **本番向けAIアプリをデプロイする**: AZDを使用してMicrosoft Foundryサービスと連携する
- **マルチエージェントアーキテクチャを習得する**: 協調するAIエージェントソリューションを実装する
- **セキュリティのベストプラクティスを実装する**: 認証とアクセス制御を構成する
- **スケール最適化**: コスト効率が高く、高性能なデプロイ設計を行う
- **デプロイのトラブルシューティング**: 一般的な問題を自力で解決する

#### 📖 ワークショップリソース
- **🎥 インタラクティブガイド**: [Workshop Materials](workshop/README.md) - ブラウザベースの学習環境
- **📋 モジュール別の手順書**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - ワークショップの概要と目的
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - AIテンプレートの検索と選定
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - テンプレートのデプロイと検証
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - テンプレートのアーキテクチャを調査
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yamlを習得する
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - 自分のシナリオ向けにカスタマイズする
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - リソースのクリーンアップ
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - 振り返りと次のステップ
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AIに焦点を当てた演習
- **💡 クイックスタート**: [Workshop Setup Guide](workshop/README.md#quick-start) - 環境設定ガイド

**最適な対象**: 企業研修、大学の授業、自己学習、デベロッパーブートキャンプ。

---

## 📖 深掘り: AZDの機能

基本を超えて、AZDは本番デプロイ向けの強力な機能を提供します:

- **テンプレートベースのデプロイ** - 共通のアプリケーションパターン向けに事前構築されたテンプレートを利用
- **Infrastructure as Code** - BicepやTerraformを使用してAzureリソースを管理  
- **統合ワークフロー** - アプリケーションのプロビジョニング、デプロイ、監視をシームレスに実行
- **開発者フレンドリー** - 開発者の生産性と体験に最適化

### **AZD + Microsoft Foundry: AIデプロイに最適**

**AZDがAIソリューションに適している理由** AZDはAI開発者が直面する主要な課題に対応します:

- **AI対応テンプレート** - Azure OpenAI、Cognitive Services、MLワークロード向けの事前設定済みテンプレート
- **安全なAIデプロイ** - AIサービス、APIキー、モデルエンドポイント向けの組み込みのセキュリティパターン  
- **本番AIパターン** - スケーラブルでコスト効率の高いAIアプリケーションデプロイのベストプラクティス
- **エンドツーエンドのAIワークフロー** - モデル開発から本番デプロイ、適切な監視まで
- **コスト最適化** - AIワークロード向けのスマートなリソース割り当てとスケーリング戦略
- **Microsoft Foundryとの統合** - Microsoft Foundryのモデルカタログとエンドポイントへのシームレスな接続

---

## 🎯 テンプレートとサンプルライブラリ

### 注目: Microsoft Foundry テンプレート
**AIアプリケーションをデプロイするならここから始めてください！**

> **注意:** これらのテンプレートは様々なAIパターンを示します。いくつかは外部のAzure Samplesで、他はいくつかはローカル実装です。

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | External |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapter 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| External |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | External |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | External |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | External |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | External |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### 注目: 完全な学習シナリオ
**学習章にマッピングされた本番準備済みアプリケーションテンプレート**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | 基本的なAIデプロイパターン |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | Azure AI Searchを用いたRAG実装 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapter 4 | ⭐⭐ | Document Intelligenceの統合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | エージェントフレームワークと関数呼び出し |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐ | エンタープライズ向けAIオーケストレーション |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | CustomerおよびInventoryエージェントを備えたマルチエージェントアーキテクチャ |

### サンプル別による学習

> **📌 ローカルと外部の例:**  
> **ローカル例**（このリポジトリ内） = すぐに使用可能  
> **外部例**（Azure Samples） = リンク先リポジトリをクローンして使用

#### ローカル例（すぐに使用可能）
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARMテンプレートを含む本番対応の完全実装
  - マルチエージェントアーキテクチャ（Customer + Inventoryエージェント）
  - 包括的な監視と評価
  - ARMテンプレートによるワンクリックデプロイ

#### ローカル例 - コンテナアプリケーション（章 2-5）
**このリポジトリ内の包括的なコンテナデプロイ例:**
- [**Container App Examples**](examples/container-app/README.md) - コンテナ化されたデプロイの完全ガイド
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - scale-to-zero対応の基本REST API
  - [Microservices Architecture](../../examples/container-app/microservices) - 本番対応のマルチサービスデプロイ
  - クイックスタート、プロダクション、上級デプロイパターン
  - 監視、セキュリティ、コスト最適化のガイダンス

#### 外部例 - シンプルなアプリケーション（章 1-2）
**これらのAzure Samplesリポジトリをクローンして開始:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本的なデプロイパターン
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 静的コンテンツのデプロイ
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST APIのデプロイ

#### 外部例 - データベース統合（章 3-4）  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - データベース接続パターン
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - サーバーレスデータワークフロー

#### 外部例 - 上級パターン（章 4-8）
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - マルチサービスアーキテクチャ
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - バックグラウンド処理  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - 本番対応のMLパターン

### 外部テンプレートコレクション
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - 公式およびコミュニティテンプレートの厳選コレクション
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learnのテンプレートドキュメント
- [**Examples Directory**](examples/README.md) - 詳細な説明付きのローカル学習例

---

## 📚 学習リソースと参考資料

### クイックリファレンス
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - 章別に整理された必須の azd コマンド
- [**Glossary**](resources/glossary.md) - Azure と azd の用語集  
- [**FAQ**](resources/faq.md) - 学習章別に整理されたよくある質問
- [**Study Guide**](resources/study-guide.md) - 包括的な練習問題

### ハンズオンワークショップ
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - AIソリューションをAZDでデプロイ可能にする（2〜3時間）
- [**Interactive Workshop**](workshop/README.md) - MkDocsとGitHub Codespacesを用いた8モジュールのガイド付き演習
  - フロー: 導入 → 選択 → 検証 → 分解 → 構成 → カスタマイズ → クリーンダウン → まとめ

### 外部学習リソース
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 クイックトラブルシューティングガイド

**初心者が直面しやすい一般的な問題と即時の解決策:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# まず AZD をインストールしてください
# Windows（PowerShell）:
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
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

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
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# 別の Azure リージョンを試してください
azd env set AZURE_LOCATION "westus2"
azd up

# または開発環境ではより小さい SKU を使用してください
# infra/main.parameters.json を編集してください:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>
```bash
# オプション 1: クリーンアップして再試行
azd down --force --purge
azd up

# オプション 2: インフラのみ修正する
azd provision

# オプション 3: 詳細な状態を確認する
azd show

# オプション 4: Azure Monitorでログを確認する
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ 「認証に失敗しました」または「トークンが期限切れです」</strong></summary>

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
<summary><strong>❌ 「リソースは既に存在します」または名前の競合</strong></summary>

```bash
# AZDは一意の名前を生成しますが、競合が発生した場合：
azd down --force --purge

# その場合は新しい環境で再試行してください
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ テンプレートのデプロイに時間がかかる</strong></summary>

**通常の待ち時間:**
- シンプルなウェブアプリ: 5〜10分
- データベースを含むアプリ: 10〜15分
- AIアプリケーション: 15〜25分（OpenAI のプロビジョニングは遅い）

```bash
# 進捗を確認する
azd show

# 30分以上詰まっている場合は、Azure ポータルを確認する:
azd monitor
# 失敗したデプロイを探す
```
</details>

<details>
<summary><strong>❌ 「許可が拒否されました」または「Forbidden」</strong></summary>

```bash
# Azure のロールを確認してください
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 最低でも「Contributor」ロールが必要です
# Azure の管理者に付与を依頼してください:
# - Contributor（リソース用）
# - User Access Administrator（ロールの割り当て用）
```
</details>

<details>
<summary><strong>❌ デプロイされたアプリケーションのURLが見つからない</strong></summary>

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

### 📚 トラブルシューティングの完全リソース

- **一般的な問題ガイド:** [詳細な解決策](docs/chapter-07-troubleshooting/common-issues.md)
- **AI固有の問題:** [AIトラブルシューティング](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **デバッグガイド:** [ステップバイステップのデバッグ](docs/chapter-07-troubleshooting/debugging.md)
- **サポートを得る:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 コース修了と認定

### 進捗トラッキング
各章を通じて学習の進捗を追跡してください:

- [ ] **Chapter 1**: 基礎とクイックスタート ✅
- [ ] **Chapter 2**: AIファースト開発 ✅  
- [ ] **Chapter 3**: 構成と認証 ✅
- [ ] **Chapter 4**: Infrastructure as Code（IaC）とデプロイ ✅
- [ ] **Chapter 5**: マルチエージェントAIソリューション ✅
- [ ] **Chapter 6**: 事前デプロイ検証と計画 ✅
- [ ] **Chapter 7**: トラブルシューティングとデバッグ ✅
- [ ] **Chapter 8**: 本番とエンタープライズパターン ✅

### 学習確認
各章を完了したら、次の方法で知識を確認してください:
1. **実践演習**: 章のハンズオンデプロイを完了する
2. **知識チェック**: 各章のFAQセクションを確認する
3. **コミュニティでの議論**: Azure Discordで経験を共有する
4. **次の章**: 次の難易度レベルに進む

### コース修了のメリット
全章を修了すると、以下が得られます:
- **本番環境での経験**: 実際のAIアプリケーションをAzureにデプロイした経験
- **プロフェッショナルスキル**: エンタープライズ対応のデプロイ能力  
- **コミュニティでの認知**: Azure開発者コミュニティのアクティブメンバー
- **キャリア向上**: 需要の高いAZDおよびAIデプロイの専門知識

---

## 🤝 コミュニティとサポート

### ヘルプとサポートを得る
- **技術的な問題**: [バグ報告と機能リクエスト](https://github.com/microsoft/azd-for-beginners/issues)
- **学習に関する質問**: [Microsoft Azure Discord コミュニティ](https://discord.gg/microsoft-azure) および [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI固有のヘルプ**: [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) に参加してください
- **ドキュメント**: [公式 Azure Developer CLI ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord からのコミュニティインサイト

**#Azure チャンネルからの最近の投票結果:**
- **45%** の開発者がAIワークロードにAZDを使用したいと考えています
- **主な課題**: マルチサービスのデプロイ、資格情報管理、本番準備  
- **最も要望されたもの**: AI特化のテンプレート、トラブルシューティングガイド、ベストプラクティス

**コミュニティに参加して:**
- AZD + AIの経験を共有して助けを得る
- 新しいAIテンプレートの早期プレビューにアクセスする
- AIデプロイのベストプラクティスに貢献する
- 今後のAI + AZD機能開発に影響を与える

### コースへの貢献
貢献を歓迎します！詳細は [貢献ガイド](CONTRIBUTING.md) をお読みください:
- **コンテンツの改善**: 既存の章と例を強化する
- **新しい例**: 実世界のシナリオとテンプレートを追加する  
- **翻訳**: 多言語サポートの維持を手伝う
- **バグ報告**: 精度と明瞭さを向上させる
- **コミュニティ基準**: 包摂的なコミュニティガイドラインに従う

---

## 📄 コース情報

### ライセンス
このプロジェクトはMITライセンスの下でライセンスされています。詳細は [LICENSE](../../LICENSE) ファイルを参照してください。

### 関連する Microsoft 学習リソース

当チームは他にも包括的な学習コースを提供しています:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j 入門](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js 入門](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain 入門](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / エージェント
[![AZD 入門](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI 入門](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP 入門](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AIエージェント 入門](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### 生成AIシリーズ
[![生成AI 入門](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![生成AI（.NET）](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![生成AI（Java）](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![生成AI（JavaScript）](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### コア学習
[![機械学習 入門](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![データサイエンス 入門](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI 入門](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![サイバーセキュリティ 入門](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![ウェブ開発 入門](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT 入門](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR開発 入門](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot シリーズ
[![AIペアプログラミング用Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET用Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilotアドベンチャー](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ コースナビゲーション

**🚀 学習を始める準備はできましたか？**

**初心者**: [Chapter 1: 基礎とクイックスタート](../..) から始めてください
**AI開発者**: [第2章：AIファースト開発](../..)へ移動  
**経験豊富な開発者**: [第3章：構成と認証](../..)から始める

**次のステップ**: [第1章を始める - AZDの基本](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責事項：
この文書はAI翻訳サービス「Co‑op Translator」（https://github.com/Azure/co-op-translator）を用いて翻訳されました。正確性の確保に努めていますが、自動翻訳には誤りや不正確さが含まれる場合があることをご了承ください。原文（原語版）を権威ある正本と見なしてください。重要な情報については、専門の人による翻訳を推奨します。本翻訳の利用により生じた誤解や解釈の相違について、当方は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->