# AZD 初心者向け: 構造化された学習の旅

![AZD-初心者向け](../../translated_images/ja/azdbeginners.5527441dd9f74068.webp) 

[![GitHub ウォッチャー](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub フォーク](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub スター](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 自動翻訳（常に最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[アラビア語](../ar/README.md) | [ベンガル語](../bn/README.md) | [ブルガリア語](../bg/README.md) | [ビルマ語（ミャンマー）](../my/README.md) | [中国語（簡体字）](../zh-CN/README.md) | [中国語（繁体字、香港）](../zh-HK/README.md) | [中国語（繁体字、マカオ）](../zh-MO/README.md) | [中国語（繁体字、台湾）](../zh-TW/README.md) | [クロアチア語](../hr/README.md) | [チェコ語](../cs/README.md) | [デンマーク語](../da/README.md) | [オランダ語](../nl/README.md) | [エストニア語](../et/README.md) | [フィンランド語](../fi/README.md) | [フランス語](../fr/README.md) | [ドイツ語](../de/README.md) | [ギリシャ語](../el/README.md) | [ヘブライ語](../he/README.md) | [ヒンディー語](../hi/README.md) | [ハンガリー語](../hu/README.md) | [インドネシア語](../id/README.md) | [イタリア語](../it/README.md) | [日本語](./README.md) | [カンナダ語](../kn/README.md) | [クメール語](../km/README.md) | [韓国語](../ko/README.md) | [リトアニア語](../lt/README.md) | [マレー語](../ms/README.md) | [マラヤーラム語](../ml/README.md) | [マラーティー語](../mr/README.md) | [ネパール語](../ne/README.md) | [ナイジェリア・ピジン](../pcm/README.md) | [ノルウェー語](../no/README.md) | [ペルシア語（ファールシー）](../fa/README.md) | [ポーランド語](../pl/README.md) | [ポルトガル語（ブラジル）](../pt-BR/README.md) | [ポルトガル語（ポルトガル）](../pt-PT/README.md) | [パンジャブ語（グルムキー）](../pa/README.md) | [ルーマニア語](../ro/README.md) | [ロシア語](../ru/README.md) | [セルビア語（キリル）](../sr/README.md) | [スロバキア語](../sk/README.md) | [スロベニア語](../sl/README.md) | [スペイン語](../es/README.md) | [スワヒリ語](../sw/README.md) | [スウェーデン語](../sv/README.md) | [タガログ語（フィリピン）](../tl/README.md) | [タミル語](../ta/README.md) | [テルグ語](../te/README.md) | [タイ語](../th/README.md) | [トルコ語](../tr/README.md) | [ウクライナ語](../uk/README.md) | [ウルドゥー語](../ur/README.md) | [ベトナム語](../vi/README.md)

> **ローカルでクローンする方法を好みますか？**
>
> このリポジトリには50以上の言語翻訳が含まれており、ダウンロードサイズが大きくなります。翻訳を含めずにクローンするには、スパースチェックアウトを使用してください：
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
> これにより、コースを完了するために必要なものがすべて含まれ、ダウンロードがはるかに高速になります。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 今日の azd の新機能

Azure Developer CLI は従来のウェブアプリや API を超えて成長しています。現在、azd は AI 搭載アプリケーションやインテリジェントエージェントを含む、Azure に「任意の」アプリケーションをデプロイするための単一ツールです。

これはあなたにとって次のような意味があります：

- **AI エージェントは now azd のファーストクラスのワークロードです。** 既存の `azd init` → `azd up` ワークフローを使って、AI エージェントプロジェクトを初期化、デプロイ、管理できます。
- **Microsoft Foundry 統合** により、モデルのデプロイ、エージェントのホスティング、AI サービスの構成が azd テンプレートエコシステムに直接組み込まれます。
- **コアワークフローは変わっていません。** todo アプリ、マイクロサービス、またはマルチエージェント AI ソリューションをデプロイする場合でも、コマンドは同じです。

以前に azd を使用したことがある場合、AI サポートは自然な拡張であり、別のツールや上級トラックではありません。新たに始める場合は、すべてに対応する1つのワークフローを学びます。

---

## 🚀 Azure Developer CLI（azd）とは何ですか？

**Azure Developer CLI (azd)** は、アプリケーションを Azure にデプロイすることを簡単にする、開発者に優しいコマンドラインツールです。多数の Azure リソースを手動で作成して接続する代わりに、単一のコマンドでアプリケーション全体をデプロイできます。

### `azd up` のマジック

```bash
# この単一のコマンドですべてを実行します：
# ✅ すべてのAzureリソースを作成
# ✅ ネットワークとセキュリティを構成
# ✅ アプリケーションコードをビルド
# ✅ Azureにデプロイ
# ✅ 動作するURLを提供
azd up
```

**これで完了です！** Azure ポータルでのクリック操作は不要、複雑な ARM テンプレートを最初に学ぶ必要もありません。手動設定は不要で、Azure 上で動作するアプリケーションが得られます。

---

## ❓ Azure Developer CLI と Azure CLI の違いは何ですか？

初心者が最もよく尋ねる質問です。簡単な答えは次のとおりです：

| 機能 | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| <strong>目的</strong> | 個々の Azure リソースを管理する | 完全なアプリケーションをデプロイする |
| <strong>マインドセット</strong> | インフラ中心 | アプリケーション中心 |
| <strong>例</strong> | `az webapp create --name myapp...` | `azd up` |
| <strong>習得曲線</strong> | Azure サービスの知識が必要 | アプリを理解していればよい |
| <strong>最適な対象</strong> | DevOps、インフラ | 開発者、プロトタイピング |

### 簡単な例え

- **Azure CLI** は、家を建てるための全ての道具（ハンマー、のこぎり、釘）を持っている状態のようなものです。何でも作れますが、建築についての知識が必要です。
- **Azure Developer CLI** は、請負業者を雇うようなものです。望むものを伝えれば、実際の構築は請負業者が処理します。

### どちらを使うべきか

| 状況 | 使用するコマンド |
|----------|----------|
| 「ウェブアプリを素早くデプロイしたい」 | `azd up` |
| 「ストレージアカウントだけ作成したい」 | `az storage account create` |
| 「フル AI アプリケーションを構築している」 | `azd init --template azure-search-openai-demo` |
| 「特定の Azure リソースをデバッグする必要がある」 | `az resource show` |
| 「数分で本番対応のデプロイを行いたい」 | `azd up --environment production` |

### 両方を併用できます！

AZD は内部で Azure CLI を使用しています。両方を併用できます：
```bash
# AZDでアプリをデプロイする
azd up

# その後、Azure CLIで特定のリソースを微調整する
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD でテンプレートを見つける

ゼロから始めないでください！**Awesome AZD** は、すぐにデプロイできるテンプレートのコミュニティコレクションです：

| リソース | 説明 |
|----------|-------------|
| 🔗 [**Awesome AZD ギャラリー**](https://azure.github.io/awesome-azd/) | ワンクリックでデプロイできる200以上のテンプレートを閲覧 |
| 🔗 [<strong>テンプレートを提出する</strong>](https://github.com/Azure/awesome-azd/issues) | 自分のテンプレートをコミュニティに提供 |
| 🔗 [**GitHub リポジトリ**](https://github.com/Azure/awesome-azd) | スターを付けてソースを探索 |

### Awesome AZD の人気 AI テンプレート

```bash
# Microsoft FoundryモデルとAI検索を使用したRAGチャット
azd init --template azure-search-openai-demo

# クイックAIチャットアプリケーション
azd init --template openai-chat-app-quickstart

# Foundryエージェントを使ったAIエージェント
azd init --template get-started-with-ai-agents
```

---

## 🎯 3 ステップで始める

開始する前に、デプロイしたいテンプレートに対してマシンが準備できていることを確認してください：

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

必要なチェック項目のいずれかが失敗した場合は、まずそれを修正してからクイックスタートを続行してください。

### ステップ 1: AZD をインストールする（2 分）

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

### ステップ 2: AZD に認証する

```bash
# このコースで Azure CLI コマンドを直接使用する場合はオプションです
az login

# AZD ワークフローには必須です
azd auth login
```

どれを使うべきかわからない場合は、[Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup) のフルセットアップ手順に従ってください。

### ステップ 3: 最初のアプリをデプロイする

```bash
# テンプレートから初期化する
azd init --template todo-nodejs-mongo

# Azureにデプロイする（すべてを作成します！）
azd up
```

**🎉 これで完了です！** あなたのアプリは Azure 上で公開されました。

### クリーンアップ（忘れずに！）

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 このコースの使い方

このコースは <strong>段階的な学習</strong> を目的としています—自分が快適に始められる場所から始めて、徐々にステップアップしてください：

| あなたの経験 | ここから始める |
|-----------------|------------|
| **Azure が初めて** | [第1章: 基礎（クイックスタート）](#-chapter-1-foundation--quick-start) |
| **Azure は知っているが AZD は未経験** | [第1章: 基礎（クイックスタート）](#-chapter-1-foundation--quick-start) |
| **AI アプリをデプロイしたい** | [第2章: AIファースト開発（AI開発者向け推奨）](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| <strong>ハンズオンで練習したい</strong> | [🎓 インタラクティブワークショップ](workshop/README.md) - 3〜4 時間のガイド付きラボ |
| <strong>本番運用パターンが必要</strong> | [第8章: 本番 & エンタープライズパターン](#-chapter-8-production--enterprise-patterns) |

### クイックセットアップ

1. <strong>このリポジトリをフォークする</strong>: [![GitHub フォーク](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. <strong>クローンする</strong>: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. <strong>ヘルプを得る</strong>: [Azure Discord コミュニティ](https://discord.com/invite/ByRwuEEgH4)

> **ローカルでクローンする方法を好みますか？**
>
> このリポジトリには50以上の言語翻訳が含まれており、ダウンロードサイズが大きくなります。翻訳を含めずにクローンするには、スパースチェックアウトを使用してください：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> これにより、コースを完了するために必要なものがすべて含まれ、ダウンロードがはるかに高速になります。


## コース概要

構造化された章を通じて Azure Developer CLI (azd) を習得します。<strong>Microsoft Foundry 統合による AI アプリケーションのデプロイに特化</strong>しています。

### なぜこのコースが現代の開発者にとって必須なのか

Microsoft Foundry Discord コミュニティのインサイトに基づくと、<strong>45% の開発者が AZD を AI ワークロードに使いたい</strong>と考えていますが、次のような課題に直面しています：
- 複雑なマルチサービスの AI アーキテクチャ
- 本番環境向けの AI デプロイのベストプラクティス  
- Azure AI サービスの統合と構成
- AI ワークロードのコスト最適化
- AI 固有のデプロイ問題のトラブルシューティング

### 学習目標

この構造化されたコースを修了することで、次のことができるようになります：
- **AZD の基本を習得する**: コア概念、インストール、構成
- **AI アプリケーションをデプロイする**: AZD と Microsoft Foundry サービスを使用
- **Infrastructure as Code を実践する**: Bicep テンプレートで Azure リソースを管理
- <strong>デプロイのトラブルシュート</strong>: 一般的な問題の解決とデバッグ
- <strong>本番向けに最適化する</strong>: セキュリティ、スケーリング、監視、コスト管理
- <strong>マルチエージェントソリューションを構築する</strong>: 複雑な AI アーキテクチャをデプロイ

## 開始前に：アカウント、アクセス、前提条件

第1章を始める前に、次の項目が整っていることを確認してください。本ガイドの後続のインストール手順は、これらの基本が既に処理されていることを前提としています。
- **Azure サブスクリプション**: 既存の職場のサブスクリプションやご自身のアカウントを使用するか、開始するには [無料トライアル](https://aka.ms/azurefreetrial) を作成してください。
- **Azure リソースを作成する権限**: ほとんどの演習では、対象のサブスクリプションまたはリソースグループに対して少なくとも **Contributor** アクセスが必要です。いくつかの章ではリソースグループ、マネージド アイデンティティ、および RBAC の割り当てを作成できることを前提としています。
- [**GitHub アカウント**](https://github.com): リポジトリのフォーク、自分の変更の追跡、ワークショップでの GitHub Codespaces の使用に便利です。
- <strong>テンプレート実行の前提条件</strong>: 一部のテンプレートでは Node.js、Python、Java、または Docker などのローカルツールが必要です。開始前にセットアップバリデータを実行して、欠けているツールを早めに検出してください。
- <strong>基本的なターミナル操作の慣れ</strong>: 専門家である必要はありませんが、`git clone`、`azd auth login`、`azd up` のようなコマンドを実行することに慣れているべきです。

> **企業のサブスクリプションで作業していますか？**
> Azure 環境が管理者によって管理されている場合は、使用する予定のサブスクリプションまたはリソースグループにリソースをデプロイできることを事前に確認してください。できない場合は、演習を始める前にサンドボックス サブスクリプションまたは Contributor アクセスを依頼してください。

> **Azure に不慣れですか？**
> 演習を最後まで待たずに完了できるよう、自分の Azure トライアルまたは従量課金サブスクリプション（https://aka.ms/azurefreetrial）から始めてください。

## 🗺️ コースマップ: 章別クイックナビ

各章には学習目標、クイックスタート、演習をまとめた専用 README があります:

| 章 | トピック | レッスン | 所要時間 | 難易度 |
|---------|-------|---------|----------|------------|
| **[第1章: 基礎](docs/chapter-01-foundation/README.md)** | 入門 | [AZD の基本](docs/chapter-01-foundation/azd-basics.md) &#124; [インストール](docs/chapter-01-foundation/installation.md) &#124; [最初のプロジェクト](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[第2章: AI 開発](docs/chapter-02-ai-development/README.md)** | AI ファースト アプリ | [Foundry 統合](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI エージェント](docs/chapter-02-ai-development/agents.md) &#124; [モデルのデプロイ](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [ワークショップ](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[第3章: 設定](docs/chapter-03-configuration/README.md)** | 認証とセキュリティ | [設定](docs/chapter-03-configuration/configuration.md) &#124; [認証とセキュリティ](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[第4章: インフラ](docs/chapter-04-infrastructure/README.md)** | IaC とデプロイ | [デプロイガイド](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [プロビジョニング](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[第5章: マルチエージェント](docs/chapter-05-multi-agent/README.md)** | AI エージェント ソリューション | [小売シナリオ](examples/retail-scenario.md) &#124; [調整パターン](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[第6章: 事前デプロイ](docs/chapter-06-pre-deployment/README.md)** | 計画と検証 | [プレフライトチェック](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [容量計画](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU 選定](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [アプリケーション インサイト](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[第7章: トラブルシューティング](docs/chapter-07-troubleshooting/README.md)** | デバッグと修正 | [一般的な問題](docs/chapter-07-troubleshooting/common-issues.md) &#124; [デバッグ](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI の問題](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[第8章: 本番運用](docs/chapter-08-production/README.md)** | エンタープライズパターン | [本番運用の実践](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 ワークショップ](workshop/README.md)** | ハンズオンラボ | [導入](workshop/docs/instructions/0-Introduction.md) &#124; [テンプレート選択](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [テンプレート検証](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [テンプレート分解](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [テンプレート設定](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [テンプレートカスタマイズ](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [インフラ解体](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [まとめ](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**合計コース所要時間:** 約10-14時間 | **スキル進展:** 初級 → 本番運用準備済み

---

## 📚 学習章

<em>経験レベルと目標に応じて学習経路を選択してください</em>

### 🚀 第1章: 基礎とクイックスタート
<strong>前提条件</strong>: Azure サブスクリプション、基本的なコマンドライン知識  
<strong>所要時間</strong>: 30-45 分  
<strong>難易度</strong>: ⭐

#### 学ぶこと
- Azure Developer CLI の基本概念の理解
- プラットフォームへの AZD のインストール
- 最初の成功したデプロイ

#### 学習リソース
- **🎯 ここから開始**: [Azure Developer CLIとは？](#what-is-azure-developer-cli)
- **📖 理論**: [AZD の基本](docs/chapter-01-foundation/azd-basics.md) - コア概念と用語
- **⚙️ セットアップ**: [インストールとセットアップ](docs/chapter-01-foundation/installation.md) - プラットフォーム別ガイド
- **🛠️ ハンズオン**: [最初のプロジェクト](docs/chapter-01-foundation/first-project.md) - ステップバイステップのチュートリアル
- **📋 クイックリファレンス**: [コマンド チートシート](resources/cheat-sheet.md)

#### 実践演習
```bash
# インストールの簡易チェック
azd version

# 最初のアプリケーションをデプロイする
azd init --template todo-nodejs-mongo
azd up
```

**💡 章の成果**: AZD を使用してシンプルな Web アプリケーションを Azure に正常にデプロイする

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
**📈 修了後のスキルレベル:** 基本的なアプリケーションを独立してデプロイできる  
**📈 修了後のスキルレベル:** 基本的なアプリケーションを独立してデプロイできる

---

### 🤖 第2章: AI ファースト開発（AI 開発者向け推奨）
<strong>前提条件</strong>: 第1章を完了していること  
<strong>所要時間</strong>: 1-2 時間  
<strong>難易度</strong>: ⭐⭐

#### 学ぶこと
- AZD を使用した Microsoft Foundry の統合
- AI 搭載アプリケーションのデプロイ
- AI サービス構成の理解

#### 学習リソース
- **🎯 ここから開始**: [Microsoft Foundry 統合](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI エージェント**: [AI エージェント ガイド](docs/chapter-02-ai-development/agents.md) - AZD でインテリジェント エージェントをデプロイする
- **📖 パターン**: [モデルのデプロイ](docs/chapter-02-ai-development/ai-model-deployment.md) - AI モデルのデプロイと管理
- **🛠️ ワークショップ**: [AI ワークショップラボ](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI ソリューションを AZD 対応にする
- **🎥 インタラクティブガイド**: [Workshop Materials](workshop/README.md) - MkDocs * DevContainer 環境を使用したブラウザベースの学習
- **📋 テンプレート**: [Microsoft Foundry テンプレート](#ワークショップリソース)
- **📝 例**: [AZD デプロイ例](examples/README.md)

#### 実践演習
```bash
# 最初のAIアプリケーションをデプロイする
azd init --template azure-search-openai-demo
azd up

# 追加のAIテンプレートを試してみる
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 章の成果**: RAG 機能を備えた AI チャットアプリケーションをデプロイおよび構成する

**✅ 成功の検証:**
```bash
# 第2章の後、次のことができるようになっているはずです:
azd init --template azure-search-openai-demo
azd up
# AIチャットインターフェースをテストする
# 質問をして、出典付きのAIによる応答を得る
# 検索統合が機能することを確認する
azd monitor  # Application Insights がテレメトリを表示しているか確認する
azd down --force --purge
```

**📊 所要時間:** 1-2 時間  
**📈 修了後のスキルレベル:** 本番対応の AI アプリケーションをデプロイおよび構成できる  
**💰 コスト認識:** 開発環境 $80-150/月、運用環境 $300-3500/月 の概算を理解する

#### 💰 AI デプロイのコストに関する注意点

**開発環境（概算 $80-150/月）:**
- Microsoft Foundry Models（従量課金）: $0-50/月（トークン使用量に基づく）
- AI Search（Basic 層）: $75/月
- Container Apps（消費課金）: $0-20/月
- ストレージ（Standard）: $1-5/月

**本番環境（概算 $300-3,500+/月）:**
- Microsoft Foundry Models（安定したパフォーマンスのための PTU）: $3,000+/月 または 大量利用時の従量課金
- AI Search（Standard 層）: $250/月
- Container Apps（Dedicated）: $50-100/月
- Application Insights: $5-50/月
- ストレージ（Premium）: $10-50/月

**💡 コスト最適化のヒント:**
- 学習用途には **Free Tier** の Microsoft Foundry Models を使用する（Azure OpenAI による 50,000 トークン/月 が含まれる場合あり）
- 開発していないときは `azd down` を実行してリソースをデアロケートする
- 本番ではない限り従量課金（consumption）から始め、必要に応じて PTU にアップグレードする
- デプロイ前に `azd provision --preview` を使用してコストを見積もる
- オートスケーリングを有効にして、実際の使用量に対してのみ支払う

**コスト監視:**
```bash
# 推定月額費用を確認する
azd provision --preview

# Azure ポータルで実際の費用を監視する
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第3章: 設定と認証
<strong>前提条件</strong>: 第1章を完了していること  
<strong>所要時間</strong>: 45-60 分  
<strong>難易度</strong>: ⭐⭐

#### 学ぶこと
- 環境の構成と管理
- 認証とセキュリティのベストプラクティス
- リソースの命名と整理

#### 学習リソース
- **📖 設定**: [設定ガイド](docs/chapter-03-configuration/configuration.md) - 環境のセットアップ
- **🔐 セキュリティ**: [認証パターンとマネージド アイデンティティ](docs/chapter-03-configuration/authsecurity.md) - 認証パターン
- **📝 例**: [データベースアプリの例](examples/database-app/README.md) - AZD データベース例

#### 実践演習
- 複数の環境（dev、staging、prod）の構成
- マネージド アイデンティティ認証の設定
- 環境固有の構成の実装

**💡 章の成果**: 適切な認証とセキュリティを備えた複数の環境を管理する

---

### 🏗️ 第4章: インフラストラクチャー as Code とデプロイ
<strong>前提条件</strong>: 第1～3章を完了していること  
<strong>所要時間</strong>: 1-1.5 時間  
<strong>難易度</strong>: ⭐⭐⭐

#### 学ぶこと
- 高度なデプロイパターン
- Bicep を使用した Infrastructure as Code
- リソースのプロビジョニング戦略

#### 学習リソース
- **📖 デプロイ**: [デプロイガイド](docs/chapter-04-infrastructure/deployment-guide.md) - 完全なワークフロー
- **🏗️ プロビジョニング**: [リソースのプロビジョニング](docs/chapter-04-infrastructure/provisioning.md) - Azure リソース管理
- **📝 例**: [Container App の例](../../examples/container-app) - コンテナ化されたデプロイ

#### 実践演習
- カスタム Bicep テンプレートの作成
- マルチサービスアプリケーションのデプロイ
- ブルー/グリーンデプロイ戦略の実装

**💡 章の成果**: カスタムインフラテンプレートを使用して複雑なマルチサービスアプリケーションをデプロイする

---

### 🎯 第5章: マルチエージェント AI ソリューション（上級）
<strong>前提条件</strong>: 第1～2章を完了していること  
<strong>所要時間</strong>: 2-3 時間  
<strong>難易度</strong>: ⭐⭐⭐⭐

#### 学ぶこと
- マルチエージェントアーキテクチャのパターン
- エージェントのオーケストレーションと調整
- 本番対応の AI デプロイ

#### 学習リソース
- **🤖 注目プロジェクト**: [小売マルチエージェントソリューション](examples/retail-scenario.md) - 完全実装
- **🛠️ ARM テンプレート**: [ARM テンプレートパッケージ](../../examples/retail-multiagent-arm-template) - ワンクリックデプロイ
- **📖 アーキテクチャ**: [マルチエージェントの調整パターン](docs/chapter-06-pre-deployment/coordination-patterns.md) - パターン

#### 実践演習
```bash
# 完全な小売マルチエージェントソリューションを展開する
cd examples/retail-multiagent-arm-template
./deploy.sh

# エージェントの構成を確認する
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 章の成果**: Customer および Inventory エージェントを備えた本番対応のマルチエージェント AI ソリューションをデプロイおよび管理する

---

### 🔍 第6章: 事前デプロイの検証と計画
<strong>前提条件</strong>: 第4章を完了していること  
<strong>所要時間</strong>: 1 時間  
<strong>難易度</strong>: ⭐⭐
#### 学習内容
- 容量計画とリソース検証
- SKU選択戦略
- 事前確認と自動化

#### 学習リソース
- **📊 計画**: [容量計画](docs/chapter-06-pre-deployment/capacity-planning.md) - リソース検証
- **💰 選択**: [SKU選択](docs/chapter-06-pre-deployment/sku-selection.md) - 費用対効果の高い選択
- **✅ 検証**: [事前チェック](docs/chapter-06-pre-deployment/preflight-checks.md) - 自動化スクリプト

#### 実践演習
- 容量検証スクリプトを実行する
- コストのためにSKU選択を最適化する
- 自動化された事前デプロイチェックを実装する

**💡 チャプターの成果**：実行前にデプロイを検証および最適化する

---

### 🚨 第7章: トラブルシューティングとデバッグ
<strong>前提条件</strong>：任意のデプロイ章が完了していること  
<strong>所要時間</strong>：1〜1.5時間  
<strong>難易度</strong>：⭐⭐

#### 学習内容
- 体系的なデバッグ手法
- 一般的な問題と解決策
- AI固有のトラブルシューティング

#### 学習リソース
- **🔧 一般的な問題**: [一般的な問題](docs/chapter-07-troubleshooting/common-issues.md) - FAQと解決策
- **🕵️ デバッグ**: [デバッグガイド](docs/chapter-07-troubleshooting/debugging.md) - 段階的な戦略
- **🤖 AIの問題**: [AI固有のトラブルシューティング](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AIサービスの問題

#### 実践演習
- デプロイ失敗を診断する
- 認証問題を解決する
- AIサービスの接続問題をデバッグする

**💡 チャプターの成果**：一般的なデプロイ問題を自力で診断し解決する

---

### 🏢 第8章: 本番およびエンタープライズパターン
<strong>前提条件</strong>：第1〜4章を完了していること  
<strong>所要時間</strong>：2〜3時間  
<strong>難易度</strong>：⭐⭐⭐⭐

#### 学習内容
- 本番デプロイ戦略
- エンタープライズ向けセキュリティパターン
- 監視とコスト最適化

#### 学習リソース
- **🏭 本番**: [本番AIベストプラクティス](docs/chapter-08-production/production-ai-practices.md) - エンタープライズパターン
- **📝 例**: [マイクロサービス例](../../examples/microservices) - 複雑なアーキテクチャ
- **📊 監視**: [Application Insights 統合](docs/chapter-06-pre-deployment/application-insights.md) - 監視

#### 実践演習
- エンタープライズ向けセキュリティパターンを実装する
- 包括的な監視を設定する
- 適切なガバナンスで本番にデプロイする

**💡 チャプターの成果**：フルプロダクション機能を備えたエンタープライズ対応アプリケーションをデプロイする

---

## 🎓 ワークショップ概要: ハンズオン学習体験

> **⚠️ ワークショップステータス：開発中**  
> ワークショップ資料は現在作成および改良中です。コアモジュールは機能していますが、一部の高度なセクションは未完成です。すべてのコンテンツを完成させるため積極的に作業しています。 [進捗を追跡 →](workshop/README.md)

### インタラクティブなワークショップ資料
<strong>ブラウザベースのツールとガイド付き演習による包括的なハンズオン学習</strong>

ワークショップ資料は、上記の章ベースのカリキュラムを補完する構造化されたインタラクティブな学習体験を提供します。ワークショップは自己学習とインストラクター主導のセッションの両方を想定して設計されています。

#### 🛠️ ワークショップの特徴
- <strong>ブラウザベースのインターフェース</strong>: 検索、コピー、テーマ機能を備えたMkDocs対応の完全なワークショップ
- **GitHub Codespaces 統合**: ワンクリックで開発環境をセットアップ
- <strong>構造化された学習パス</strong>: 8モジュールのガイド付き演習（合計3〜4時間）
- <strong>進行型メソッド</strong>: 導入 → 選択 → 検証 → 分解 → 設定 → カスタマイズ → クリーンアップ → まとめ
- **インタラクティブなDevContainer環境**: 事前構成されたツールと依存関係

#### 📚 ワークショップモジュール構成
このワークショップは、発見からデプロイの習熟まで導く<strong>8モジュールの進行型メソッド</strong>に従います：

| モジュール | トピック | 実施内容 | 所要時間 |
|--------|-------|----------------|----------|
| **0. Introduction** | Workshop Overview | 学習目標、前提条件、ワークショップ構成を理解する | 15分 |
| **1. Selection** | Template Discovery | AZDテンプレートを探し、シナリオに適したAIテンプレートを選択する | 20分 |
| **2. Validation** | Deploy & Verify | テンプレートを`azd up`でデプロイし、インフラが機能することを検証する | 30分 |
| **3. Deconstruction** | Understand Structure | GitHub Copilotを使用してテンプレートアーキテクチャ、Bicepファイル、コード構成を確認する | 30分 |
| **4. Configuration** | azure.yaml Deep Dive | `azure.yaml`の構成、ライフサイクルフック、環境変数を習得する | 30分 |
| **5. Customization** | Make It Yours | AI検索、トレーシング、評価を有効化し、シナリオに合わせてカスタマイズする | 45分 |
| **6. Teardown** | Clean Up | `azd down --purge`で安全にリソースを削除する | 15分 |
| **7. Wrap-up** | Next Steps | 達成事項、主要概念をレビューし、学習を継続する方法を確認する | 15分 |

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
# リポジトリで「Code」→「Create codespace on main」をクリックしてください

# オプション 2: ローカルでの開発
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md のセットアップ手順に従ってください
```

#### 🎯 ワークショップ学習成果
ワークショップを完了することで、参加者は以下を習得します：
- **本番用AIアプリケーションをデプロイする**：Microsoft FoundryサービスとAZDを使用する
- <strong>マルチエージェントアーキテクチャを習得する</strong>：協調するAIエージェントソリューションを実装する
- <strong>セキュリティのベストプラクティスを実装する</strong>：認証とアクセス制御を設定する
- <strong>スケールに最適化する</strong>：コスト効果が高く高性能なデプロイを設計する
- <strong>デプロイをトラブルシュートする</strong>：一般的な問題を自力で解決する

#### 📖 ワークショップリソース
- **🎥 インタラクティブガイド**: [ワークショップ資料](workshop/README.md) - ブラウザベースの学習環境
- **📋 モジュール別指示**:
  - [0. 導入](workshop/docs/instructions/0-Introduction.md) - ワークショップの概要と目的
  - [1. 選択](workshop/docs/instructions/1-Select-AI-Template.md) - AIテンプレートを見つけて選択する
  - [2. 検証](workshop/docs/instructions/2-Validate-AI-Template.md) - テンプレートをデプロイして検証する
  - [3. 分解](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - テンプレートアーキテクチャを調査する
  - [4. 設定](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yamlをマスターする
  - [5. カスタマイズ](workshop/docs/instructions/5-Customize-AI-Template.md) - シナリオに合わせてカスタマイズする
  - [6. クリーンアップ](workshop/docs/instructions/6-Teardown-Infrastructure.md) - リソースをクリーンアップする
  - [7. まとめ](workshop/docs/instructions/7-Wrap-up.md) - レビューと次のステップ
- **🛠️ AIワークショップラボ**: [AIワークショップラボ](docs/chapter-02-ai-development/ai-workshop-lab.md) - AIに焦点を当てた演習
- **💡 クイックスタート**: [ワークショップセットアップガイド](workshop/README.md#quick-start) - 環境構成

<strong>対象</strong>：企業研修、大学の授業、自己学習、開発者ブートキャンプに最適。

---

## 📖 詳細: AZDの機能

基本を超えて、AZDは本番デプロイのための強力な機能を提供します：

- <strong>テンプレートベースのデプロイ</strong> - 一般的なアプリケーションパターン用の事前構築テンプレートを使用する
- <strong>コードとしてのインフラ</strong> - BicepやTerraformを使用してAzureリソースを管理する  
- <strong>統合されたワークフロー</strong> - アプリケーションをシームレスにプロビジョニング、デプロイ、および監視する
- <strong>開発者向け</strong> - 開発者の生産性と体験に最適化されている

### **AZD + Microsoft Foundry：AIデプロイに最適**

**なぜAIソリューションにAZDを使うのか？** AZDはAI開発者が直面する主要な課題に対処します：

- **AI対応テンプレート** - Microsoft Foundryモデル、Cognitive Services、およびMLワークロード向けの事前構成テンプレート
- **安全なAIデプロイ** - AIサービス、APIキー、モデルエンドポイントのための組み込みセキュリティパターン  
- **本番AIパターン** - スケーラブルでコスト効率の良いAIアプリケーションデプロイのベストプラクティス
- **エンドツーエンドのAIワークフロー** - モデル開発から適切な監視を備えた本番デプロイまで
- <strong>コスト最適化</strong> - AIワークロードのためのスマートなリソース割り当てとスケーリング戦略
- **Microsoft Foundry統合** - Microsoft Foundryのモデルカタログとエンドポイントへのシームレスな接続

---

## 🎯 テンプレートと例のライブラリ

### 特集：Microsoft Foundry テンプレート
**AIアプリケーションをデプロイする場合はここから始めてください！**

> **注：** これらのテンプレートはさまざまなAIパターンを示しています。いくつかは外部のAzure Samplesで、他はローカル実装です。

| テンプレート | 章 | 複雑さ | サービス | 種類 |
|----------|---------|------------|----------|------|
| [**AIチャット入門**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | 外部 |
| [**AIエージェント入門**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第2章 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| 外部 |
| [**Azure Search + OpenAI デモ**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | 外部 |
| [**OpenAIチャットアプリ クイックスタート**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | 外部 |
| [<strong>小売向けマルチエージェントソリューション</strong>](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | <strong>ローカル</strong> |

### 特集：完全な学習シナリオ
<strong>学習章に対応した本番対応アプリケーションテンプレート</strong>

| テンプレート | 学習章 | 複雑さ | 主な学習内容 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | 基本的なAIデプロイパターン |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | Azure AI Searchを使用したRAG実装 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第4章 | ⭐⭐ | ドキュメントインテリジェンスの統合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | エージェントフレームワークと関数呼び出し |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐ | エンタープライズ向けAIオーケストレーション |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | CustomerおよびInventoryエージェントを含むマルチエージェントアーキテクチャ |

### 例による学習タイプ

> **📌 ローカル対外部の例：**  
> <strong>ローカルの例</strong>（このリポジトリ内）= すぐに使用可能  
> <strong>外部の例</strong>（Azure Samples）= リンクされたリポジトリからクローンしてください

#### ローカルの例（すぐに使用可能）
- [<strong>小売向けマルチエージェントソリューション</strong>](examples/retail-scenario.md) - ARMテンプレートを含む本番対応の完全な実装
  - マルチエージェントアーキテクチャ（Customer + Inventory エージェント）
  - 包括的な監視と評価
  - ARMテンプレートによるワンクリックデプロイ

#### ローカルの例 - コンテナアプリケーション（第2〜5章）
**このリポジトリ内の包括的なコンテナデプロイメント例：**
- [<strong>コンテナアプリの例</strong>](examples/container-app/README.md) - コンテナ化されたデプロイの完全ガイド
  - [シンプルなFlask API](../../examples/container-app/simple-flask-api) - scale-to-zero機能を備えた基本的なREST API
  - [マイクロサービスアーキテクチャ](../../examples/container-app/microservices) - 本番対応のマルチサービスデプロイ
  - クイックスタート、本番、上級のデプロイパターン
  - 監視、セキュリティ、コスト最適化のガイダンス

#### 外部の例 - シンプルなアプリケーション（第1〜2章）
**開始するにはこれらのAzure Samplesリポジトリをクローンしてください：**
- [シンプルWebアプリ - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本的なデプロイパターン
- [静的サイト - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 静的コンテンツのデプロイ
- [コンテナアプリ - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST APIのデプロイ

#### 外部の例 - データベース統合（第3〜4章）
- [データベース アプリ - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - データベース接続パターン
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - サーバーレスデータワークフロー

#### 外部の例 - 高度なパターン（第4〜8章）
- [Java マイクロサービス](https://github.com/Azure-Samples/java-microservices-aca-lab) - マルチサービスアーキテクチャ
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - バックグラウンド処理  
- [エンタープライズ ML パイプライン](https://github.com/Azure-Samples/mlops-v2) - 本番対応の ML パターン

### 外部テンプレート集
- [**公式 AZD テンプレート ギャラリー**](https://azure.github.io/awesome-azd/) - 公式およびコミュニティテンプレートのキュレーションコレクション
- [**Azure Developer CLI テンプレート**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn のテンプレートドキュメント
- [**Examples Directory**](examples/README.md) - 詳細な説明付きのローカル学習用例

---

## 📚 学習リソースと参考資料

### クイックリファレンス
- [**コマンド チートシート**](resources/cheat-sheet.md) - 章別に整理された必須 azd コマンド
- [<strong>用語集</strong>](resources/glossary.md) - Azure と azd の用語  
- [**FAQ**](resources/faq.md) - 学習章別のよくある質問
- [<strong>学習ガイド</strong>](resources/study-guide.md) - 包括的な実践演習

### ハンズオンワークショップ
- [**AI ワークショップ ラボ**](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI ソリューションを AZD でデプロイ可能にする（2〜3時間）
- [**インタラクティブ ワークショップ**](workshop/README.md) - MkDocs と GitHub Codespaces を使った8モジュールのガイド付き演習
  - 流れ: 導入 → 選択 → 検証 → 分解 → 構成 → カスタマイズ → 解体 → まとめ

### 外部学習リソース
- [Azure Developer CLI ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure アーキテクチャ センター](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 料金計算ツール](https://azure.microsoft.com/pricing/calculator/)
- [Azure ステータス](https://status.azure.com/)

### エディタ向け AI エージェントスキル
- [**skills.sh の Microsoft Azure スキル**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI、Foundry、デプロイ、診断、コスト最適化など向けの37のオープンエージェントスキル。GitHub Copilot、Cursor、Claude Code、またはサポートされている任意のエージェントにインストールしてください:
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
<summary><strong>❌ "No subscription found" または "Subscription not set"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" または "Quota exceeded"</strong></summary>

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
<summary><strong>❌ "azd up" が途中で失敗する</strong></summary>

```bash
# オプション 1: クリーンして再試行
azd down --force --purge
azd up

# オプション 2: インフラのみ修復
azd provision

# オプション 3: 詳細なステータスを確認する
azd show

# オプション 4: Azure Monitor のログを確認する
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" または "Token expired"</strong></summary>

```bash
# AZD の再認証を行う
azd auth logout
azd auth login

# 任意: az コマンドを実行している場合は Azure CLI も再認証する
az logout
az login

# 認証を確認する
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" または 名前の競合</strong></summary>

```bash
# AZD は一意の名前を生成しますが、競合が発生した場合:
azd down --force --purge

# その場合は新しい環境で再試行してください
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ テンプレートのデプロイに時間がかかりすぎている</strong></summary>

**通常の待ち時間:**
- シンプルなウェブアプリ: 5〜10分
- データベースを含むアプリ: 10〜15分
- AI アプリケーション: 15〜25分（OpenAI のプロビジョニングは遅い）

```bash
# 進捗を確認する
azd show

# 30分以上進まない場合は、Azure ポータルを確認してください：
azd monitor --overview
# 失敗したデプロイを探す
```
</details>

<details>
<summary><strong>❌ "Permission denied" または "Forbidden"</strong></summary>

```bash
# Azure のロールを確認してください
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 最低でも「Contributor」ロールが必要です
# Azure 管理者に次の権限を付与するよう依頼してください:
# - Contributor（リソース用）
# - User Access Administrator（ロールの割り当て用）
```
</details>

<details>
<summary><strong>❌ デプロイされたアプリケーションの URL が見つからない</strong></summary>

```bash
# すべてのサービスエンドポイントを表示
azd show

# または Azure ポータルを開く
azd monitor

# 特定のサービスを確認する
azd env get-values
# *_URL 変数を探す
```
</details>

### 📚 詳細なトラブルシューティング リソース

- **一般的な問題ガイド:** [詳細な解決策](docs/chapter-07-troubleshooting/common-issues.md)
- **AI 特有の問題:** [AI トラブルシューティング](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **デバッグガイド:** [ステップバイステップ デバッグ](docs/chapter-07-troubleshooting/debugging.md)
- **ヘルプを得る:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 コース修了と認定

### 進捗トラッキング
各章の学習進捗を追跡する:

- [ ] **Chapter 1**: 基礎とクイックスタート ✅
- [ ] **Chapter 2**: AIファースト開発 ✅  
- [ ] **Chapter 3**: 構成と認証 ✅
- [ ] **Chapter 4**: Infrastructure as Code とデプロイ ✅
- [ ] **Chapter 5**: マルチエージェント AI ソリューション ✅
- [ ] **Chapter 6**: 事前デプロイ検証と計画 ✅
- [ ] **Chapter 7**: トラブルシューティングとデバッグ ✅
- [ ] **Chapter 8**: 本番・エンタープライズ パターン ✅

### 学習の検証
各章修了後、次の方法で知識を検証してください:
1. <strong>実践演習</strong>: 章のハンズオンデプロイを完了する
2. <strong>知識チェック</strong>: 該当章のFAQセクションを確認する
3. <strong>コミュニティでの議論</strong>: Azure Discord で経験を共有する
4. <strong>次の章</strong>: 次の難易度レベルに進む

### コース修了のメリット
全章を修了すると、以下が得られます:
- <strong>本番環境での経験</strong>: Azure に実際の AI アプリケーションをデプロイした経験
- <strong>プロフェッショナルスキル</strong>: エンタープライズ対応のデプロイ能力  
- <strong>コミュニティでの認知</strong>: Azure 開発者コミュニティのアクティブメンバー
- <strong>キャリアの向上</strong>: 需要のある AZD と AI デプロイの専門知識

---

## 🤝 コミュニティとサポート

### ヘルプとサポートを得る
- <strong>技術的な問題</strong>: [バグ報告と機能リクエスト](https://github.com/microsoft/azd-for-beginners/issues)
- <strong>学習に関する質問</strong>: [Microsoft Azure Discord コミュニティ](https://discord.gg/microsoft-azure) と [![Microsoft Foundry の Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI専用のヘルプ**: [![Microsoft Foundry の Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) に参加してください
- <strong>ドキュメント</strong>: [公式 Azure Developer CLI ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord からのコミュニティインサイト

**#Azure チャンネルからの最近の投票結果：**
- **45%** の開発者が AI ワークロードに AZD を使用したいと考えています
- <strong>主な課題</strong>：マルチサービスのデプロイ、資格情報管理、本番対応  
- <strong>最も要望の多い項目</strong>：AI 向けテンプレート、トラブルシューティングガイド、ベストプラクティス

**コミュニティに参加して：**
- AZD + AI の経験を共有して支援を得る
- 新しい AI テンプレートの早期プレビューにアクセスする
- AI デプロイのベストプラクティスに貢献する
- 将来の AI + AZD 機能開発に影響を与える

### コースへの貢献
貢献を歓迎します！詳細は [貢献ガイド](CONTRIBUTING.md) をお読みください:
- <strong>コンテンツの改善</strong>: 既存の章と例を強化する
- <strong>新しい例</strong>: 実世界のシナリオとテンプレートを追加する  
- <strong>翻訳</strong>: 多言語サポートの維持を支援する
- <strong>バグ報告</strong>: 正確さと明確性を改善する
- <strong>コミュニティ基準</strong>: 包括的なコミュニティガイドラインに従う

---

## 📄 コース情報

### ライセンス
This project is licensed under the MIT License - see the [LICENSE](../../LICENSE) file for details.

### 関連する Microsoft 学習リソース

私たちのチームは他の包括的な学習コースも提供しています:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![初心者向け LangChain4j](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![初心者向け LangChain.js](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![初心者向け LangChain](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![初心者向け AZD](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![初心者向け Edge AI](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![初心者向け MCP](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![初心者向け AI エージェント](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![初心者向け 生成AI](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![生成AI（.NET）](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![生成AI（Java）](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![生成AI（JavaScript）](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### コア学習
[![初心者向け ML](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![初心者のためのデータサイエンス](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![初心者のためのAI](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![初心者のためのサイバーセキュリティ](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![初心者のためのWeb開発](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![初心者のためのIoT](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![初心者のためのXR開発](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilotシリーズ
[![AIペアプログラミング向けCopilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET向けCopilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilotアドベンチャー](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ コースナビゲーション

**🚀 学習を始める準備はできましたか？**

<strong>初心者</strong>: Start with [第1章: 基礎とクイックスタート](#-chapter-1-foundation--quick-start)  
**AI開発者**: Jump to [第2章: AIファースト開発](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
<strong>経験豊富な開発者</strong>: Begin with [第3章: 設定と認証](#️-chapter-3-configuration--authentication)

<strong>次のステップ</strong>: [第1章を開始 - AZDの基本](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:
本書類は AI 翻訳サービス [Co-opトランスレーター](https://github.com/Azure/co-op-translator) を用いて翻訳されました。正確性を期しておりますが、自動翻訳には誤りや不正確な箇所が含まれる可能性があることにご注意ください。原文（原言語の文書）を権威ある出典と見なしてください。重要な情報については、専門の人間による翻訳をお勧めします。本翻訳の使用に起因するいかなる誤解や誤訳についても、当社は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->