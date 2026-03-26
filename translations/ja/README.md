# AZD 初心者向け: 構造化された学習ジャーニー

![AZD-初心者向け](../../translated_images/ja/azdbeginners.5527441dd9f74068.webp) 

[![GitHub ウォッチャー](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub フォーク](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub スター](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 自動翻訳（常に最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[アラビア語](../ar/README.md) | [ベンガル語](../bn/README.md) | [ブルガリア語](../bg/README.md) | [ビルマ語（ミャンマー）](../my/README.md) | [中国語（簡体字）](../zh-CN/README.md) | [中国語（繁体字・香港）](../zh-HK/README.md) | [中国語（繁体字・マカオ）](../zh-MO/README.md) | [中国語（繁体字・台湾）](../zh-TW/README.md) | [クロアチア語](../hr/README.md) | [チェコ語](../cs/README.md) | [デンマーク語](../da/README.md) | [オランダ語](../nl/README.md) | [エストニア語](../et/README.md) | [フィンランド語](../fi/README.md) | [フランス語](../fr/README.md) | [ドイツ語](../de/README.md) | [ギリシャ語](../el/README.md) | [ヘブライ語](../he/README.md) | [ヒンディー語](../hi/README.md) | [ハンガリー語](../hu/README.md) | [インドネシア語](../id/README.md) | [イタリア語](../it/README.md) | [日本語](./README.md) | [カンナダ語](../kn/README.md) | [韓国語](../ko/README.md) | [リトアニア語](../lt/README.md) | [マレー語](../ms/README.md) | [マラヤーラム語](../ml/README.md) | [マラーティー語](../mr/README.md) | [ネパール語](../ne/README.md) | [ナイジェリア・ピジン語](../pcm/README.md) | [ノルウェー語](../no/README.md) | [ペルシャ語（ファルシ）](../fa/README.md) | [ポーランド語](../pl/README.md) | [ポルトガル語（ブラジル）](../pt-BR/README.md) | [ポルトガル語（ポルトガル）](../pt-PT/README.md) | [パンジャブ語（グルムキー）](../pa/README.md) | [ルーマニア語](../ro/README.md) | [ロシア語](../ru/README.md) | [セルビア語（キリル）](../sr/README.md) | [スロバキア語](../sk/README.md) | [スロベニア語](../sl/README.md) | [スペイン語](../es/README.md) | [スワヒリ語](../sw/README.md) | [スウェーデン語](../sv/README.md) | [タガログ語（フィリピノ）](../tl/README.md) | [タミル語](../ta/README.md) | [テルグ語](../te/README.md) | [タイ語](../th/README.md) | [トルコ語](../tr/README.md) | [ウクライナ語](../uk/README.md) | [ウルドゥー語](../ur/README.md) | [ベトナム語](../vi/README.md)

> **ローカルでクローンするのが好みですか？**
>
> このリポジトリには 50 以上の言語の翻訳が含まれており、ダウンロードサイズが大きくなります。翻訳なしでクローンするには、スパースチェックアウトを使用してください:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> これにより、コースを完了するために必要なすべてが、より高速なダウンロードで取得できます。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 azd の最新情報

Azure Developer CLI は従来の Web アプリや API を超えて成長しました。現在、azd は AI 搭載アプリケーションやインテリジェントエージェントを含む、Azure に「あらゆる」アプリケーションをデプロイするための単一のツールです。

これはあなたにとって次のような意味があります:

- **AI エージェントは現在、azd のファーストクラスのワークロードです。** 既に知っている `azd init` → `azd up` ワークフローを使って、AI エージェントプロジェクトを初期化、デプロイ、管理できます。
- **Microsoft Foundry の統合** により、モデルのデプロイ、エージェントのホスティング、および AI サービスの構成を azd テンプレートエコシステムに直接取り込めます。
- **コアワークフローは変わっていません。** todo アプリ、マイクロサービス、またはマルチエージェントの AI ソリューションをデプロイする場合でも、コマンドは同じです。

以前に azd を使ったことがある場合、AI サポートは自然な拡張機能であり、別のツールや上級トラックではありません。これから始める場合も、すべてに対応する単一のワークフローを学びます。

---

## 🚀 Azure Developer CLI (azd) とは？

**Azure Developer CLI (azd)** は、開発者に優しいコマンドラインツールで、Azure へのアプリケーションのデプロイをシンプルにします。多数の Azure リソースを手動で作成して接続する代わりに、単一のコマンドでアプリケーション全体をデプロイできます。

### `azd up` の魔法

```bash
# この1つのコマンドで全てを実行します：
# ✅ すべてのAzureリソースを作成します
# ✅ ネットワークとセキュリティを構成します
# ✅ アプリケーションコードをビルドします
# ✅ Azureにデプロイします
# ✅ 動作するURLを提供します
azd up
```

**以上です！** Azure ポータルをクリックする必要はなく、複雑な ARM テンプレートを最初に学ぶ必要もなく、手動での設定も不要です — 単に動作するアプリケーションが Azure 上に展開されます。

---

## ❓ Azure Developer CLI と Azure CLI: 違いは何か？

これは初心者が最もよく質問することです。簡単な答えは次のとおりです:

| 機能 | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| <strong>目的</strong> | 個々の Azure リソースを管理する | アプリケーション全体をデプロイする |
| <strong>マインドセット</strong> | インフラ重視 | アプリケーション重視 |
| <strong>例</strong> | `az webapp create --name myapp...` | `azd up` |
| <strong>学習曲線</strong> | Azure サービスを知っている必要がある | アプリだけを知っていればよい |
| <strong>適している人</strong> | DevOps、インフラ | 開発者、プロトタイピング |

### わかりやすい例え

- **Azure CLI** は家を建てるためのすべての工具（ハンマー、ノコギリ、釘）を持っているようなものです。何でも作れますが、建築の知識が必要です。
- **Azure Developer CLI** は請負業者を雇うようなもので、欲しいものを説明すれば、建築をすべて処理してくれます。

### どちらを使うべきか

| シナリオ | 使用するもの |
|----------|----------|
| "ウェブアプリをすばやくデプロイしたい" | `azd up` |
| "ストレージアカウントだけを作成したい" | `az storage account create` |
| "フルの AI アプリケーションを構築している" | `azd init --template azure-search-openai-demo` |
| "特定の Azure リソースをデバッグする必要がある" | `az resource show` |
| "数分で本番対応のデプロイをしたい" | `azd up --environment production` |

### 両方を併用できます！

AZD は内部で Azure CLI を使用しています。両方を併用できます:
```bash
# AZDでアプリをデプロイします
azd up

# 次に、Azure CLIで特定のリソースを微調整します
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD でテンプレートを見つける

ゼロから始めないでください！**Awesome AZD** はデプロイ可能なテンプレートのコミュニティコレクションです:

| リソース | 説明 |
|----------|-------------|
| 🔗 [**Awesome AZD ギャラリー**](https://azure.github.io/awesome-azd/) | 200+ のテンプレートをワンクリックで参照 |
| 🔗 [<strong>テンプレートを提出する</strong>](https://github.com/Azure/awesome-azd/issues) | コミュニティに自分のテンプレートを投稿 |
| 🔗 [**GitHub リポジトリ**](https://github.com/Azure/awesome-azd) | ソースをスターして探索 |

### Awesome AZD の人気 AI テンプレート

```bash
# Microsoft FoundryモデルとAI検索を使ったRAGチャット
azd init --template azure-search-openai-demo

# クイックAIチャットアプリケーション
azd init --template openai-chat-app-quickstart

# Foundryエージェントを使ったAIエージェント
azd init --template get-started-with-ai-agents
```

---

## 🎯 3 ステップで始める

### ステップ 1: AZD をインストール（2 分）

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

### ステップ 2: Azure にログイン

```bash
azd auth login
```

### ステップ 3: 最初のアプリをデプロイ

```bash
# テンプレートから初期化する
azd init --template todo-nodejs-mongo

# Azureに展開する（すべてを作成します！）
azd up
```

**🎉 これで完了です！** あなたのアプリは Azure 上で公開されています。

### クリーンアップ（忘れずに！）

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 このコースの使い方

このコースは <strong>段階的な学習</strong> を目的として設計されています — 自分の慣れたところから始めて、順に学んでいきましょう:

| あなたの経験 | ここから始める |
|-----------------|------------|
| **Azure が初めて** | [第1章: 基礎](#-chapter-1-foundation--quick-start) |
| **Azure は知っているが AZD は初めて** | [第1章: 基礎](#-chapter-1-foundation--quick-start) |
| **AI アプリをデプロイしたい** | [第2章: AI優先開発（AI 開発者向け）](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| <strong>ハンズオンで練習したい</strong> | [🎓 インタラクティブワークショップ](workshop/README.md) - 3～4時間のガイド付きラボ |
| <strong>本番パターンが必要</strong> | [第8章: 本番 & エンタープライズ](#-chapter-8-production--enterprise-patterns) |

### クイックセットアップ

1. <strong>このリポジトリをフォークする</strong>: [![GitHub フォーク](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. <strong>クローンする</strong>: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. <strong>ヘルプを得る</strong>: [Azure Discord コミュニティ](https://discord.com/invite/ByRwuEEgH4)

> **ローカルでクローンするのが好みですか？**
>
> このリポジトリには 50 以上の言語の翻訳が含まれており、ダウンロードサイズが大きくなります。翻訳なしでクローンするには、スパースチェックアウトを使用してください:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> これにより、コースを完了するために必要なすべてが、より高速なダウンロードで取得できます。


## コース概要

段階的に設計された章を通じて Azure Developer CLI (azd) をマスターします。**Microsoft Foundry 統合による AI アプリケーションのデプロイに特別な重点を置いています。**

### なぜこのコースが現代の開発者に不可欠なのか

Microsoft Foundry Discord コミュニティのインサイトに基づくと、**45% の開発者が AI ワークロードに AZD を使用したい** と考えていますが、次のような課題に直面しています:
- 複雑なマルチサービスの AI アーキテクチャ
- 本番環境での AI デプロイのベストプラクティス  
- Azure AI サービスの統合と構成
- AI ワークロードのコスト最適化
- AI 固有のデプロイ問題のトラブルシューティング

### 学習目標

この構造化されたコースを完了することで、あなたは以下を達成します:
- **AZD の基本を習得**: コアコンセプト、インストール、構成
- **AI アプリケーションをデプロイ**: Microsoft Foundry サービスと連携した AZD の使用
- <strong>インフラストラクチャをコードとして実装</strong>: Bicep テンプレートで Azure リソースを管理
- <strong>デプロイのトラブルシューティング</strong>: よくある問題を解決し、デバッグする
- <strong>本番向けに最適化</strong>: セキュリティ、スケーリング、監視、コスト管理
- <strong>マルチエージェントソリューションを構築</strong>: 複雑な AI アーキテクチャをデプロイ

## 🗺️ コースマップ: 章別クイックナビ

各章には学習目標、クイックスタート、演習を含む専用の README があります:

| 章 | トピック | レッスン | 所要時間 | 難易度 |
|---------|-------|---------|----------|------------|
| **[第1章: 基礎](docs/chapter-01-foundation/README.md)** | 入門 | [AZD 基礎](docs/chapter-01-foundation/azd-basics.md) &#124; [インストール](docs/chapter-01-foundation/installation.md) &#124; [最初のプロジェクト](docs/chapter-01-foundation/first-project.md) | 30〜45分 | ⭐ |
| **[Ch 2: AI開発](docs/chapter-02-ai-development/README.md)** | AIファーストアプリ | [Foundry 統合](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AIエージェント](docs/chapter-02-ai-development/agents.md) &#124; [モデルのデプロイ](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [ワークショップ](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 時間 | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | 認証とセキュリティ | [構成](docs/chapter-03-configuration/configuration.md) &#124; [認証とセキュリティ](docs/chapter-03-configuration/authsecurity.md) | 45-60 分 | ⭐⭐ |
| **[Ch 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC とデプロイ | [デプロイガイド](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [プロビジョニング](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 時間 | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AIエージェントソリューション | [小売シナリオ](examples/retail-scenario.md) &#124; [調整パターン](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 時間 | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | 計画と検証 | [プレフライトチェック](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [容量計画](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU選定](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [アプリインサイト](docs/chapter-06-pre-deployment/application-insights.md) | 1 時間 | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | デバッグと修正 | [一般的な問題](docs/chapter-07-troubleshooting/common-issues.md) &#124; [デバッグ](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI関連の問題](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 時間 | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | エンタープライズパターン | [本番運用の実践](docs/chapter-08-production/production-ai-practices.md) | 2-3 時間 | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | ハンズオンラボ | [導入](workshop/docs/instructions/0-Introduction.md) &#124; [選択](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [検証](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [分解](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [構成](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [カスタマイズ](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [破棄](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [まとめ](workshop/docs/instructions/7-Wrap-up.md) | 3-4 時間 | ⭐⭐ |

**総コース時間:** 約10〜14時間 | **スキルの進展:** 初級 → 本番対応

---

## 📚 学習チャプター

<em>経験レベルと目標に基づいて学習パスを選択してください</em>

### 🚀 Chapter 1: 基礎とクイックスタート
<strong>前提条件</strong>: Azure サブスクリプション、基本的なコマンドライン知識  
<strong>所要時間</strong>: 30-45 分  
<strong>難易度</strong>: ⭐

#### 学ぶ内容
- Azure Developer CLI の基本理解
- プラットフォームへの AZD のインストール
- 最初のデプロイ成功体験

#### 学習リソース
- **🎯 ここから始める**: [What is Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 理論**: [AZD 基礎](docs/chapter-01-foundation/azd-basics.md) - コア概念と用語
- **⚙️ 設定**: [インストールとセットアップ](docs/chapter-01-foundation/installation.md) - プラットフォーム別ガイド
- **🛠️ 実践**: [最初のプロジェクト](docs/chapter-01-foundation/first-project.md) - ステップバイステップチュートリアル
- **📋 クイックリファレンス**: [コマンド チートシート](resources/cheat-sheet.md)

#### 実践演習
```bash
# インストールの簡易チェック
azd version

# 最初のアプリケーションをデプロイする
azd init --template todo-nodejs-mongo
azd up
```

**💡 章の成果**: AZD を使用して Azure にシンプルな Web アプリケーションをデプロイできる

**✅ 成功の検証:**
```bash
# 第1章を完了すると、次のことができるようになります:
azd version              # インストールされているバージョンを表示します
azd init --template todo-nodejs-mongo  # プロジェクトを初期化します
azd up                  # Azure にデプロイします
azd show                # 実行中のアプリの URL を表示します
# アプリケーションがブラウザで開き、動作します
azd down --force --purge  # リソースをクリーンアップします
```

**📊 所要時間:** 30-45 分  
**📈 達成後のスキルレベル:** 基本的なアプリケーションを独立してデプロイできる
**📈 達成後のスキルレベル:** 基本的なアプリケーションを独立してデプロイできる

---

### 🤖 Chapter 2: AIファースト開発（AI開発者向け推奨）
<strong>前提条件</strong>: Chapter 1 完了  
<strong>所要時間</strong>: 1-2 時間  
<strong>難易度</strong>: ⭐⭐

#### 学ぶ内容
- AZD と Microsoft Foundry の統合
- AI 搭載アプリケーションのデプロイ
- AI サービスの構成理解

#### 学習リソース
- **🎯 ここから始める**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AIエージェント**: [AIエージェントガイド](docs/chapter-02-ai-development/agents.md) - AZD でインテリジェントエージェントをデプロイ
- **📖 パターン**: [AI モデルのデプロイ](docs/chapter-02-ai-development/ai-model-deployment.md) - AIモデルのデプロイと管理
- **🛠️ ワークショップ**: [AI ワークショップラボ](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI ソリューションを AZD 対応にする
- **🎥 インタラクティブガイド**: [ワークショップ資料](workshop/README.md) - ブラウザベースの学習（MkDocs * DevContainer 環境）
- **📋 テンプレート**: [Microsoft Foundry テンプレート](#ワークショップの資料)
- **📝 事例**: [AZD デプロイ例](examples/README.md)

#### 実践演習
```bash
# 最初のAIアプリケーションをデプロイする
azd init --template azure-search-openai-demo
azd up

# 追加のAIテンプレートを試してみる
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 章の成果**: RAG 機能を備えた AI 搭載チャットアプリケーションをデプロイして構成できる

**✅ 成功の検証:**
```bash
# 第2章の後には、次のことができるようになっているはずです:
azd init --template azure-search-openai-demo
azd up
# AIチャットインターフェースをテストする
# 質問をして、情報源を示したAIの応答を得る
# 検索統合が正しく動作することを確認する
azd monitor  # Application Insightsがテレメトリを表示していることを確認する
azd down --force --purge
```

**📊 所要時間:** 1-2 時間  
**📈 達成後のスキルレベル:** 本番対応の AI アプリケーションをデプロイして構成できる  
**💰 コスト認識:** 開発環境で月 $80-150、運用環境で月 $300-3500 のコスト感を理解する

#### 💰 AI デプロイのコスト考慮事項

**開発環境（推定 $80-150/月）:**
- Microsoft Foundry Models（従量課金）: $0-50/月（トークン使用量に基づく）
- AI Search（Basic 層）: $75/月
- Container Apps（Consumption）: $0-20/月
- ストレージ（Standard）: $1-5/月

**本番環境（推定 $300-3,500+/月）:**
- Microsoft Foundry Models（安定したパフォーマンスのための PTU）: $3,000+/月 または 高ボリュームの場合は従量課金
- AI Search（Standard 層）: $250/月
- Container Apps（Dedicated）: $50-100/月
- Application Insights: $5-50/月
- ストレージ（Premium）: $10-50/月

**💡 コスト最適化のヒント:**
- 学習用途には **Free Tier** の Microsoft Foundry Models を利用する（Azure OpenAI に 50,000 tokens/月 が含まれる場合あり）
- 開発していないときは `azd down` を実行してリソースを解放する
- まずは消費ベースの課金で始め、本番のみ PTU にアップグレードする
- デプロイ前に `azd provision --preview` を使ってコストを見積もる
- オートスケーリングを有効にして、実際の使用分のみ支払う

**コスト監視:**
```bash
# 推定月額費用を確認する
azd provision --preview

# Azure ポータルで実際のコストを監視する
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Chapter 3: 構成と認証
<strong>前提条件</strong>: Chapter 1 完了  
<strong>所要時間</strong>: 45-60 分  
<strong>難易度</strong>: ⭐⭐

#### 学ぶ内容
- 環境の構成と管理
- 認証とセキュリティのベストプラクティス
- リソース命名と整理

#### 学習リソース
- **📖 構成**: [構成ガイド](docs/chapter-03-configuration/configuration.md) - 環境セットアップ
- **🔐 セキュリティ**: [認証パターンとマネージド ID](docs/chapter-03-configuration/authsecurity.md) - 認証パターン
- **📝 事例**: [データベースアプリ例](examples/database-app/README.md) - AZD データベース事例

#### 実践演習
- 複数環境（dev、staging、prod）を構成する
- マネージド ID 認証を設定する
- 環境固有の構成を実装する

**💡 章の成果**: 適切な認証とセキュリティを備えた複数環境を管理できる

---

### 🏗️ Chapter 4: インフラストラクチャーコード（IaC）とデプロイ
<strong>前提条件</strong>: Chapter 1-3 完了  
<strong>所要時間</strong>: 1-1.5 時間  
<strong>難易度</strong>: ⭐⭐⭐

#### 学ぶ内容
- 進んだデプロイパターン
- Bicep を使った Infrastructure as Code
- リソースプロビジョニング戦略

#### 学習リソース
- **📖 デプロイ**: [デプロイガイド](docs/chapter-04-infrastructure/deployment-guide.md) - 完全なワークフロー
- **🏗️ プロビジョニング**: [リソースのプロビジョニング](docs/chapter-04-infrastructure/provisioning.md) - Azure リソース管理
- **📝 事例**: [Container App 事例](../../examples/container-app) - コンテナ化されたデプロイ

#### 実践演習
- カスタム Bicep テンプレートを作成する
- マルチサービスアプリケーションをデプロイする
- ブルーグリーンデプロイ戦略を実装する

**💡 章の成果**: カスタムインフラテンプレートを使って複雑なマルチサービスアプリケーションをデプロイできる

---

### 🎯 Chapter 5: マルチエージェントAIソリューション（上級）
<strong>前提条件</strong>: Chapter 1-2 完了  
<strong>所要時間</strong>: 2-3 時間  
<strong>難易度</strong>: ⭐⭐⭐⭐

#### 学ぶ内容
- マルチエージェントアーキテクチャパターン
- エージェントのオーケストレーションと調整
- 本番対応の AI デプロイ

#### 学習リソース
- **🤖 注目プロジェクト**: [小売マルチエージェントソリューション](examples/retail-scenario.md) - 完全実装
- **🛠️ ARM テンプレート**: [ARM テンプレートパッケージ](../../examples/retail-multiagent-arm-template) - ワンクリックデプロイ
- **📖 アーキテクチャ**: [マルチエージェント調整パターン](docs/chapter-06-pre-deployment/coordination-patterns.md) - パターン

#### 実践演習
```bash
# 小売向けの完全なマルチエージェントソリューションを展開する
cd examples/retail-multiagent-arm-template
./deploy.sh

# エージェントの構成を検討する
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 章の成果**: カスタマーエージェントと在庫エージェントを備えた本番対応のマルチエージェントAIソリューションをデプロイして管理できる

---

### 🔍 Chapter 6: プレデプロイ検証と計画
<strong>前提条件</strong>: Chapter 4 完了  
<strong>所要時間</strong>: 1 時間  
<strong>難易度</strong>: ⭐⭐

#### 学ぶ内容
- 容量計画とリソース検証
- SKU 選定戦略
- プレフライトチェックと自動化

#### 学習リソース
- **📊 計画**: [容量計画](docs/chapter-06-pre-deployment/capacity-planning.md) - リソース検証
- **💰 選定**: [SKU 選定](docs/chapter-06-pre-deployment/sku-selection.md) - コスト効率の良い選択
- **✅ 検証**: [プレフライトチェック](docs/chapter-06-pre-deployment/preflight-checks.md) - 自動化スクリプト

#### 実践演習
- 容量検証スクリプトを実行する
- コスト最適化のために SKU 選定を最適化する
- 自動化されたプレデプロイチェックを実装する

**💡 章の成果**: 実行前にデプロイを検証して最適化できる

---

### 🚨 Chapter 7: トラブルシューティングとデバッグ
<strong>前提条件</strong>: 任意のデプロイチャプターを完了  
<strong>所要時間</strong>: 1-1.5 時間  
<strong>難易度</strong>: ⭐⭐

#### 学ぶ内容
- 系統的なデバッグ手法
- よくある問題とその解決策
- AI 特有のトラブルシューティング

#### 学習リソース
- **🔧 よくある問題**: [一般的な問題](docs/chapter-07-troubleshooting/common-issues.md) - FAQ と解決策
- **🕵️ デバッグ**: [デバッグガイド](docs/chapter-07-troubleshooting/debugging.md) - ステップバイステップの戦略
- **🤖 AI の問題**: [AI 特有のトラブルシューティング](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI サービスの問題

#### 実践演習
- デプロイ失敗を診断する
- 認証問題を解決する
- AI サービスの接続をデバッグする

**💡 章の成果**: よくあるデプロイの問題を独力で診断・解決できる

---

### 🏢 Chapter 8: 本番運用とエンタープライズパターン
<strong>前提条件</strong>: Chapter 1-4 完了  
<strong>所要時間</strong>: 2-3 時間  
<strong>難易度</strong>: ⭐⭐⭐⭐

#### 学ぶ内容
- 本番デプロイ戦略
- エンタープライズ向けセキュリティパターン
- モニタリングとコスト最適化

#### 学習リソース
- **🏭 本番**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - エンタープライズパターン
- **📝 例**: [Microservices Example](../../examples/microservices) - 複雑なアーキテクチャ
- **📊 監視**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - 監視

#### 実践演習
- エンタープライズセキュリティパターンを実装する
- 包括的な監視を設定する
- 適切なガバナンスで本番環境にデプロイする

**💡 章の成果**: 本番対応の機能を備えたエンタープライズ対応アプリケーションをデプロイする

---

## 🎓 ワークショップ概要：ハンズオン学習体験

> **⚠️ ワークショップ状況: 開発中**  
> ワークショップの資料は現在開発および改善中です。主要モジュールは機能していますが、一部の上級セクションは未完成です。全コンテンツの完成に向けて積極的に作業しています。 [進捗を追跡 →](workshop/README.md)

### インタラクティブなワークショップ資料
<strong>ブラウザベースのツールとガイド付き演習による包括的なハンズオン学習</strong>

ワークショップ資料は、上記の章ベースのカリキュラムを補完する構造化されたインタラクティブな学習体験を提供します。ワークショップは自己学習と指導者主導のセッションの両方に対応するよう設計されています。

#### 🛠️ ワークショップの特徴
- <strong>ブラウザベースのインターフェース</strong>: 検索、コピー、テーマ機能を備えた完全なMkDocsベースのワークショップ
- **GitHub Codespaces 統合**: ワンクリックで開発環境をセットアップ
- <strong>構造化された学習パス</strong>: 8モジュールのガイド付き演習（合計3〜4時間）
- <strong>段階的なメソッド</strong>: 導入 → 選択 → 検証 → 分解 → 構成 → カスタマイズ → 解体 → 総括
- **インタラクティブなDevContainer環境**: 事前構成済みのツールと依存関係

#### 📚 ワークショップモジュール構成
ワークショップは、発見からデプロイの習熟まで進める<strong>8モジュールの段階的メソッド</strong>に従います:

| モジュール | トピック | 実施内容 | 所要時間 |
|--------|-------|----------------|----------|
| **0. 導入** | ワークショップ概要 | 学習目標、前提条件、ワークショップの構成を理解する | 15分 |
| **1. 選択** | テンプレート探索 | AZDテンプレートを調査し、シナリオに合ったAIテンプレートを選択する | 20分 |
| **2. 検証** | デプロイと検証 | テンプレートを`azd up`でデプロイし、インフラが機能することを検証する | 30分 |
| **3. 分解** | 構造を理解する | GitHub Copilotを使用してテンプレートアーキテクチャ、Bicepファイル、コード構成を調査する | 30分 |
| **4. 構成** | azure.yaml 深堀り | `azure.yaml` の設定、ライフサイクルフック、環境変数を習得する | 30分 |
| **5. カスタマイズ** | 自分向けにする | AI Search、トレース、評価を有効にし、シナリオに合わせてカスタマイズする | 45分 |
| **6. ティアダウン** | クリーンアップ | `azd down --purge`でリソースを安全に廃止する | 15分 |
| **7. まとめ** | 次のステップ | 達成事項、主要概念を振り返り、学習を継続する | 15分 |

**ワークショップの流れ:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 ワークショップの始め方
```bash
# オプション1: GitHub Codespaces（推奨）
# リポジトリで「Code」→「Create codespace on main」をクリックしてください

# オプション2: ローカルでの開発
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md のセットアップ手順に従ってください
```

#### 🎯 ワークショップの学習成果
ワークショップを完了すると、参加者は以下を習得します：
- **本番用AIアプリケーションをデプロイする**: AZDをMicrosoft Foundryサービスとともに使用する
- <strong>マルチエージェントアーキテクチャを習得する</strong>: 協調するAIエージェントソリューションを実装する
- <strong>セキュリティのベストプラクティスを実装する</strong>: 認証とアクセス制御を構成する
- <strong>スケールに最適化する</strong>: コスト効率が高く、パフォーマンスに優れたデプロイを設計する
- <strong>デプロイのトラブルシューティングを行う</strong>: 一般的な問題を独力で解決する

#### 📖 ワークショップの資料
- **🎥 インタラクティブガイド**: [ワークショップ資料](workshop/README.md) - ブラウザベースの学習環境
- **📋 モジュール別手順**:
  - [0. 導入](workshop/docs/instructions/0-Introduction.md) - ワークショップの概要と目的
  - [1. 選択](workshop/docs/instructions/1-Select-AI-Template.md) - AIテンプレートの検索と選択
  - [2. 検証](workshop/docs/instructions/2-Validate-AI-Template.md) - テンプレートのデプロイと検証
  - [3. 分解](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - テンプレートアーキテクチャの調査
  - [4. 構成](workshop/docs/instructions/4-Configure-AI-Template.md) - `azure.yaml` を習得する
  - [5. カスタマイズ](workshop/docs/instructions/5-Customize-AI-Template.md) - シナリオに合わせてカスタマイズする
  - [6. ティアダウン](workshop/docs/instructions/6-Teardown-Infrastructure.md) - リソースのクリーンアップ
  - [7. まとめ](workshop/docs/instructions/7-Wrap-up.md) - 振り返りと次のステップ
- **🛠️ AIワークショップラボ**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AIに焦点を当てた演習
- **💡 クイックスタート**: [ワークショップセットアップガイド](workshop/README.md#quick-start) - 環境設定

<strong>適している対象</strong>: 企業研修、大学の講義、自己学習、開発者向けブートキャンプ。

---

## 📖 詳細解説: AZDの機能

基本を超えて、AZDは本番環境へのデプロイのための強力な機能を提供します:

- <strong>テンプレートベースのデプロイ</strong> - 共通のアプリケーションパターン向けの事前構築済みテンプレートを使用する
- **Infrastructure as Code（IaC）** - BicepまたはTerraformを使用してAzureリソースを管理する  
- <strong>統合ワークフロー</strong> - アプリケーションのプロビジョニング、デプロイ、監視をシームレスに行う
- <strong>開発者向け</strong> - 開発者の生産性と体験に最適化されている

### **AZD + Microsoft Foundry：AIデプロイに最適**

**なぜAIソリューションにAZDなのか？** AZDはAI開発者が直面する主要な課題に対応します:

- **AI対応テンプレート** - Microsoft Foundryモデル、Cognitive Services、MLワークロード向けの事前設定済みテンプレート
- **安全なAIデプロイ** - AIサービス、APIキー、モデルエンドポイント向けの組み込みセキュリティパターン  
- **本番向けAIパターン** - スケーラブルでコスト効率の良いAIアプリケーションデプロイのベストプラクティス
- **エンドツーエンドのAIワークフロー** - モデル開発から本番展開まで、適切な監視を伴って
- <strong>コスト最適化</strong> - AIワークロード向けのスマートなリソース割り当てとスケーリング戦略
- **Microsoft Foundry統合** - Microsoft Foundryのモデルカタログとエンドポイントへのシームレスな接続

---

## 🎯 テンプレートと例ライブラリ

### 注目: Microsoft Foundryテンプレート
**AIアプリケーションをデプロイする場合はここから始めてください！**

> **注:** これらのテンプレートはさまざまなAIパターンを示しています。いくつかは外部のAzureサンプルで、他はローカル実装です。

| テンプレート | チャプター | 複雑度 | サービス | 種別 |
|----------|---------|------------|----------|------|
| [**AIチャット入門**](https://github.com/Azure-Samples/get-started-with-ai-chat) | チャプター 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | 外部 |
| [**AIエージェント入門**](https://github.com/Azure-Samples/get-started-with-ai-agents) | チャプター 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| 外部 |
| [**Azure Search + OpenAI デモ**](https://github.com/Azure-Samples/azure-search-openai-demo) | チャプター 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | 外部 |
| [**OpenAI Chat App クイックスタート**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | チャプター 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | チャプター 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | チャプター 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | 外部 |
| [<strong>小売業向けマルチエージェントソリューション</strong>](examples/retail-scenario.md) | チャプター 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | <strong>ローカル</strong> |

### 注目: 完全な学習シナリオ
<strong>学習チャプターにマップされた本番対応アプリケーションテンプレート</strong>

| テンプレート | 学習チャプター | 複雑度 | 主要学習ポイント |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | チャプター 2 | ⭐ | 基本的なAIデプロイパターン |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | チャプター 2 | ⭐⭐ | Azure AI Searchを用いたRAG実装 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | チャプター 4 | ⭐⭐ | ドキュメントインテリジェンスの統合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | チャプター 5 | ⭐⭐⭐ | エージェントフレームワークとファンクションコーリング |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | チャプター 8 | ⭐⭐⭐ | エンタープライズAIオーケストレーション |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | チャプター 5 | ⭐⭐⭐⭐ | カスタマーおよび在庫エージェントを有するマルチエージェントアーキテクチャ |

### 例による学習タイプ

> **📌 ローカルと外部の例:**  
> <strong>ローカルの例</strong>（このリポジトリ内） = すぐに使用可能  
> <strong>外部の例</strong>（Azure Samples） = リンクされたリポジトリからクローンしてください

#### ローカルの例（すぐに使用可能）
- [<strong>小売業向けマルチエージェントソリューション</strong>](examples/retail-scenario.md) - ARMテンプレートを使用した本番対応の完全実装
  - マルチエージェントアーキテクチャ（カスタマー + 在庫エージェント）
  - 包括的な監視と評価
  - ARMテンプレートによるワンクリックデプロイ

#### ローカルの例 - コンテナアプリケーション（チャプター2-5）
**このリポジトリにある包括的なコンテナデプロイ例：**
- [**Container App Examples**](examples/container-app/README.md) - コンテナ化されたデプロイの完全ガイド
  - [シンプルな Flask API](../../examples/container-app/simple-flask-api) - スケール・トゥ・ゼロ対応の基本的なREST API
  - [マイクロサービスアーキテクチャ](../../examples/container-app/microservices) - 本番対応のマルチサービスデプロイ
  - クイックスタート、本番、上級のデプロイパターン
  - 監視、セキュリティ、コスト最適化のガイダンス

#### 外部の例 - シンプルなアプリケーション（チャプター1-2）
**これらのAzure Samplesリポジトリをクローンして始めてください：**
- [シンプルWebアプリ - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本的なデプロイパターン
- [静的ウェブサイト - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 静的コンテンツのデプロイ
- [コンテナアプリ - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST APIのデプロイ

#### 外部の例 - データベース統合（チャプター3-4）  
- [データベースアプリ - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - データベース接続パターン
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - サーバーレスデータワークフロー

#### 外部の例 - 上級パターン（チャプター4-8）
- [Javaマイクロサービス](https://github.com/Azure-Samples/java-microservices-aca-lab) - マルチサービスアーキテクチャ
- [Container Apps ジョブ](https://github.com/Azure-Samples/container-apps-jobs) - バックグラウンド処理  
- [エンタープライズMLパイプライン](https://github.com/Azure-Samples/mlops-v2) - 本番対応のMLパターン

### 外部テンプレートコレクション
- [**公式AZDテンプレートギャラリー**](https://azure.github.io/awesome-azd/) - 公式およびコミュニティテンプレートのキュレーションコレクション
- [**Azure Developer CLIテンプレート**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learnのテンプレートドキュメント
- [**Examples Directory**](examples/README.md) - 詳細な説明付きのローカル学習例

---

## 📚 学習リソース & 参考資料

### クイックリファレンス
- [<strong>コマンドチートシート</strong>](resources/cheat-sheet.md) - チャプター別に整理された必須azdコマンド
- [<strong>用語集</strong>](resources/glossary.md) - Azureとazdの用語  
- [**FAQ**](resources/faq.md) - 学習チャプター別のよくある質問
- [<strong>学習ガイド</strong>](resources/study-guide.md) - 包括的な練習問題

### ハンズオンワークショップ
- [**AIワークショップラボ**](docs/chapter-02-ai-development/ai-workshop-lab.md) - AIソリューションをAZDでデプロイ可能にする（2-3時間）
- [<strong>インタラクティブワークショップ</strong>](workshop/README.md) - MkDocsとGitHub Codespacesを用いた8モジュールのガイド付き演習
  - 次の流れに従う：導入 → 選択 → 検証 → 分解 → 構成 → カスタマイズ → ティアダウン → まとめ

### 外部学習リソース
- [Azure Developer CLI ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure アーキテクチャ センター](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 料金計算機](https://azure.microsoft.com/pricing/calculator/)
- [Azure ステータス](https://status.azure.com/)

### エディタ向けの AI エージェント スキル
- [**skills.sh の Microsoft Azure スキル**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI、Foundry、デプロイ、診断、コスト最適化などのための37件の公開エージェントスキル。GitHub Copilot、Cursor、Claude Code、またはサポートされている任意のエージェントにインストールしてください:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 クイックトラブルシューティングガイド

**初心者が直面する一般的な問題と即時の解決策：**

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
# オプション1: クリーンして再試行
azd down --force --purge
azd up

# オプション2: インフラだけ修復する
azd provision

# オプション3: 詳細なステータスを確認する
azd show

# オプション4: Azure Monitorでログを確認する
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

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
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZDは一意の名前を生成しますが、競合が発生した場合:
azd down --force --purge

# その場合、新しい環境で再試行します
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ テンプレートのデプロイに時間がかかりすぎる</strong></summary>

**通常の待機時間:**
- シンプルなウェブアプリ: 5-10 分
- データベース付きアプリ: 10-15 分
- AI アプリケーション: 15-25 分 (OpenAI のプロビジョニングは遅い)

```bash
# 進捗を確認
azd show

# 30分以上動かない場合は、Azure ポータルを確認してください:
azd monitor
# 失敗したデプロイを探す
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Azure のロールを確認してください
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 少なくとも "Contributor" ロールが必要です
# Azure の管理者に次を付与するよう依頼してください:
# - Contributor (リソース用)
# - User Access Administrator (ロールの割り当て用)
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
# *_URL変数を探す
```
</details>

### 📚 詳細なトラブルシューティング リソース

- **一般的な問題ガイド:** [詳細な解決策](docs/chapter-07-troubleshooting/common-issues.md)
- **AI 固有の問題:** [AI トラブルシューティング](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **デバッグガイド:** [ステップバイステップのデバッグ](docs/chapter-07-troubleshooting/debugging.md)
- **ヘルプを得る:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 コース修了と認定

### 進捗の追跡
各章の学習進捗を追跡しましょう：

- [ ] **第1章**: 基礎とクイックスタート ✅
- [ ] **第2章**: AIファースト開発 ✅  
- [ ] **第3章**: 構成と認証 ✅
- [ ] **第4章**: Infrastructure as Code とデプロイ ✅
- [ ] **第5章**: マルチエージェント AI ソリューション ✅
- [ ] **第6章**: 事前デプロイ検証と計画 ✅
- [ ] **第7章**: トラブルシューティングとデバッグ ✅
- [ ] **第8章**: 本番運用とエンタープライズ パターン ✅

### 学習確認
各章を完了したら、次で知識を検証してください：
1. <strong>実践演習</strong>: 章のハンズオンデプロイを完了する
2. <strong>知識確認</strong>: 章のFAQセクションを確認する
3. <strong>コミュニティでの議論</strong>: Azure Discordで経験を共有する
4. <strong>次の章</strong>: 次の難易度レベルに進む

### コース修了特典
全章を修了すると、以下が得られます：
- <strong>実務経験</strong>: 実際のAIアプリケーションをAzureにデプロイした経験
- <strong>プロフェッショナルスキル</strong>: エンタープライズ対応のデプロイ能力  
- <strong>コミュニティでの認知</strong>: Azure開発者コミュニティのアクティブメンバー
- <strong>キャリアの向上</strong>: 需要の高いAZDおよびAIデプロイの専門知識

---

## 🤝 コミュニティとサポート

### ヘルプとサポートを得る
- <strong>技術的な問題</strong>: [バグ報告と機能リクエスト](https://github.com/microsoft/azd-for-beginners/issues)
- <strong>学習に関する質問</strong>: [Microsoft Azure Discord コミュニティ](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 固有のヘルプ**: Join the [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- <strong>ドキュメント</strong>: [公式 Azure Developer CLI ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord からのコミュニティの洞察

**#Azure チャンネルからの最近の投票結果:**
- **45%** の開発者がAIワークロードにAZDを使用したいと考えています
- <strong>主な課題</strong>: マルチサービスのデプロイ、資格情報管理、本番準備  
- <strong>最も要望が多いもの</strong>: AI 特有のテンプレート、トラブルシューティング ガイド、ベストプラクティス

**コミュニティに参加して：**
- AZD + AI の経験を共有して助けを得る
- 新しいAIテンプレートの早期プレビューにアクセスする
- AIデプロイのベストプラクティスに貢献する
- 将来のAI + AZD機能の開発に影響を与える

### コースへの貢献方法
貢献を歓迎します！詳細については [貢献ガイド](CONTRIBUTING.md) をお読みください：
- <strong>コンテンツ改善</strong>: 既存の章や例を改善する
- <strong>新しい例</strong>: 実世界のシナリオやテンプレートを追加する  
- <strong>翻訳</strong>: 多言語サポートの維持を手伝う
- <strong>バグ報告</strong>: 正確性と明確さを改善する
- <strong>コミュニティ基準</strong>: 包括的なコミュニティガイドラインに従う

---

## 📄 コース情報

### ライセンス
このプロジェクトは MIT ライセンスの下でライセンスされています - 詳細については [LICENSE](../../LICENSE) ファイルを参照してください。

### 関連する Microsoft Learning リソース

私たちのチームは他の包括的な学習コースも制作しています：

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j 初心者向け](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js 初心者向け](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain 初心者向け](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / エージェント
[![AZD 初心者向け](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI 初心者向け](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP 初心者向け](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI エージェント 初心者向け](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### 生成AI シリーズ
[![生成AI 初心者向け](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![生成AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![生成AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![生成AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### コア学習
[![ML 初心者向け](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![データサイエンス 初心者向け](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI 初心者向け](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![サイバーセキュリティ 初心者向け](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web 開発 初心者向け](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT 初心者向け](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR 開発 初心者向け](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot シリーズ
[![AIペアプログラミング向け Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET向け Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot アドベンチャー](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ コースナビゲーション

**🚀 学習を始める準備はできましたか？**

<strong>初心者</strong>: まずは [第1章: 基礎 & クイックスタート](#-chapter-1-foundation--quick-start)  
**AI開発者**: [第2章: AIファースト開発](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
<strong>上級開発者</strong>: まずは [第3章: 設定と認証](#️-chapter-3-configuration--authentication)

<strong>次のステップ</strong>: [第1章を始める - AZD 基礎](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:
本書はAI翻訳サービス [Co-op トランスレーター](https://github.com/Azure/co-op-translator) を使用して翻訳されました。正確性に努めておりますが、自動翻訳には誤りや不正確な箇所が含まれる可能性があることにご注意ください。原文（原言語の文書）を権威ある情報源としてご参照ください。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用に起因する誤解や誤訳について、当社は一切責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->