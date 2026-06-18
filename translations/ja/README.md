# AZD For Beginners: A Structured Learning Journey

![AZD 初心者向け](../../translated_images/ja/azdbeginners.5527441dd9f74068.webp) 

[![GitHub ウォッチャー](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub フォーク](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub スター](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 自動翻訳（常に最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[アラビア語](../ar/README.md) | [ベンガル語](../bn/README.md) | [ブルガリア語](../bg/README.md) | [ビルマ語（ミャンマー）](../my/README.md) | [中国語（簡体字）](../zh-CN/README.md) | [中国語（繁体字、香港）](../zh-HK/README.md) | [中国語（繁体字、マカオ）](../zh-MO/README.md) | [中国語（繁体字、台湾）](../zh-TW/README.md) | [クロアチア語](../hr/README.md) | [チェコ語](../cs/README.md) | [デンマーク語](../da/README.md) | [オランダ語](../nl/README.md) | [エストニア語](../et/README.md) | [フィンランド語](../fi/README.md) | [フランス語](../fr/README.md) | [ドイツ語](../de/README.md) | [ギリシャ語](../el/README.md) | [ヘブライ語](../he/README.md) | [ヒンディー語](../hi/README.md) | [ハンガリー語](../hu/README.md) | [インドネシア語](../id/README.md) | [イタリア語](../it/README.md) | [日本語](./README.md) | [カンナダ語](../kn/README.md) | [クメール語](../km/README.md) | [韓国語](../ko/README.md) | [リトアニア語](../lt/README.md) | [マレー語](../ms/README.md) | [マラヤーラム語](../ml/README.md) | [マラーティー語](../mr/README.md) | [ネパール語](../ne/README.md) | [ナイジェリア・ピジン語](../pcm/README.md) | [ノルウェー語](../no/README.md) | [ペルシア語（ファルシー）](../fa/README.md) | [ポーランド語](../pl/README.md) | [ポルトガル語（ブラジル）](../pt-BR/README.md) | [ポルトガル語（ポルトガル）](../pt-PT/README.md) | [パンジャブ語（グルムキー）](../pa/README.md) | [ルーマニア語](../ro/README.md) | [ロシア語](../ru/README.md) | [セルビア語（キリル）](../sr/README.md) | [スロバキア語](../sk/README.md) | [スロベニア語](../sl/README.md) | [スペイン語](../es/README.md) | [スワヒリ語](../sw/README.md) | [スウェーデン語](../sv/README.md) | [タガログ語（フィリピン）](../tl/README.md) | [タミル語](../ta/README.md) | [テルグ語](../te/README.md) | [タイ語](../th/README.md) | [トルコ語](../tr/README.md) | [ウクライナ語](../uk/README.md) | [ウルドゥー語](../ur/README.md) | [ベトナム語](../vi/README.md)

> **ローカルでクローンする方がよいですか？**
>
> このリポジトリには50以上の言語翻訳が含まれており、ダウンロードサイズが大幅に増加します。翻訳なしでクローンするには、スパースチェックアウトを使用してください：
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD（Windows）:**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> これにより、コースを完了するために必要なすべてがより高速なダウンロードで手に入ります。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 azd の今日の新着

> 📌 本コースは **`azd 1.25.6`**（2026年6月）で検証されています。`azd version` を実行してビルドを確認し、最新にするには `azd upgrade` を実行してください。

Azure Developer CLI は従来のウェブアプリや API を超えて成長しました。現在、azd は AI 搭載アプリケーションやインテリジェントエージェントを含む、Azure にあらゆるアプリケーションをデプロイするための単一ツールです。

これはあなたにとって次のような意味があります：

- **AI エージェントは今や azd のファーストクラスのワークロードです。** 既に知っている `azd init` → `azd up` のワークフローを使って、AI エージェントプロジェクトを初期化、デプロイ、管理できます。
- **CLI からの完全なエージェントライフサイクル。** `azure.ai.agents` 拡張機能は現在、スケルトン作成のための `azd ai agent init`、テスト用の `azd ai agent invoke`（応答時間出力付き）、品質を測定・改善する `azd ai agent eval generate` および `azd ai agent optimize`、クリーンアップ用の `azd ai agent delete` まで、全行程をカバーします。
- **より多くの AI ビルディングブロック。** 新しいプレビュー拡張機能である `azure.ai.skills` と `azure.ai.connections` により、再利用可能なエージェントスキルや Foundry 接続を azd で直接管理できます。
- **Microsoft Foundry 統合** によって、モデルのデプロイ、エージェントのホスティング、AI サービスの構成が azd テンプレートエコシステムに直接組み込まれます。
- **日常的な基本がよりスムーズに。** 最近のリリースでは `azd init` が冪等（再実行しても安全）になり、`azd auth login` が古いトークンを自動的にクリアするようになり、親切な `azd tool` の初回セットアッププロンプトが追加されました。
- **コアワークフローは変わっていません。** todo アプリ、マイクロサービス、またはマルチエージェント AI ソリューションをデプロイする場合でも、コマンドは同じです。

> **Aspire ユーザーへの注意：** Microsoft はこの製品を現在単に **Aspire**（旧 ".NET Aspire"）と呼んでいます。azd の Aspire サポートに変更はなく、名前のみが更新されました。

もし以前に azd を使ったことがあるなら、AI サポートは自然な拡張であり、別のツールや上級トラックではありません。新しく始めるなら、すべてに対応する一つのワークフローを学びます。

---

## 🚀 Azure Developer CLI (azd) とは？

**Azure Developer CLI (azd)** は、開発者にやさしいコマンドラインツールで、Azure にアプリケーションをデプロイする作業を簡単にします。多数の Azure リソースを手動で作成・接続する代わりに、単一のコマンドでアプリケーション全体をデプロイできます。

### `azd up` の魔法

```bash
# この単一のコマンドですべてを行います：
# ✅ すべての Azure リソースを作成します
# ✅ ネットワークとセキュリティを構成します
# ✅ アプリケーションコードをビルドします
# ✅ Azure にデプロイします
# ✅ 動作する URL を提供します
azd up
```

**これで完了です！** Azure ポータルをクリックする必要も、最初に複雑な ARM テンプレートを学ぶ必要も、手動設定もありません — ただ Azure 上で動作するアプリケーションがあります。

---

## ❓ Azure Developer CLI と Azure CLI：違いは何ですか？

これは初心者が最もよく尋ねる質問です。簡単な答えは次のとおりです：

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Purpose** | 個々の Azure リソースを管理する | 完全なアプリケーションをデプロイする |
| **Mindset** | インフラ重視 | アプリケーション重視 |
| **Example** | `az webapp create --name myapp...` | `azd up` |
| **Learning Curve** | Azure サービスを知っている必要がある | 自分のアプリを知っていればよい |
| **Best For** | DevOps、インフラ | 開発者、プロトタイピング |

### わかりやすい例え

- **Azure CLI** は家を建てるためのすべての工具（ハンマー、のこぎり、釘）を持っているようなものです。何でも作れますが、建築を知っている必要があります。
- **Azure Developer CLI** は請負業者を雇うようなものです — 欲しいものを伝えれば、業者が建築を処理してくれます。

### それぞれを使う場面

| Scenario | Use This |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### 両方を併用できます！

AZD は内部で Azure CLI を使用します。両方を使うことができます：
```bash
# AZDでアプリをデプロイする
azd up

# 次にAzure CLIで特定のリソースを微調整する
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD でテンプレートを探す

ゼロから始めないでください！**Awesome AZD** は、ワンクリックでデプロイできるテンプレートのコミュニティコレクションです：

| Resource | Description |
|----------|-------------|
| 🔗 [**Awesome AZD ギャラリー**](https://azure.github.io/awesome-azd/) | 200+ のテンプレートをブラウズし、ワンクリックでデプロイ |
| 🔗 [<strong>テンプレートを提出する</strong>](https://github.com/Azure/awesome-azd/issues) | 自分のテンプレートをコミュニティに貢献する |
| 🔗 [**GitHub リポジトリ**](https://github.com/Azure/awesome-azd) | ソースにスターを付けて探索する |

### Awesome AZD の人気 AI テンプレート

```bash
# Microsoft Foundry モデルと AI 検索による RAG チャット
azd init --template azure-search-openai-demo

# クイック AI チャットアプリケーション
azd init --template openai-chat-app-quickstart

# Foundry エージェントを使った AI エージェント
azd init --template get-started-with-ai-agents
```

---

## 🎯 3ステップで始める

始める前に、デプロイしたいテンプレートに対してマシンが準備できていることを確認してください：

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

必要なチェックが失敗した場合は、まずそれを修正してからクイックスタートを続けてください。

### ステップ1: AZD をインストール（2分）

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

### ステップ2: AZD の認証

```bash
# このコースで Azure CLI コマンドを直接使用する場合はオプションです
az login

# AZD ワークフローには必須です
azd auth login
```

どれを使うべきかわからない場合は、[インストールとセットアップ](docs/chapter-01-foundation/installation.md#authentication-setup) のフルセットアップフローに従ってください。

### ステップ3: 最初のアプリをデプロイ

```bash
# テンプレートから初期化する
azd init --template todo-nodejs-mongo

# Azureにデプロイする（すべてを作成します！）
azd up
```

**🎉 これで完了です！** アプリが Azure 上で公開されました。

### クリーンアップ（忘れずに！）

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 このコースの使い方

このコースは <strong>段階的学習</strong> のために設計されています — 自分が快適な所から始めて徐々にステップアップしてください：

| Your Experience | Start Here |
|-----------------|------------|
| **Azure 初心者** | [チャプター 1: 基礎（クイックスタート）](#-chapter-1-foundation--quick-start) |
| **Azure は知っているが AZD は初心者** | [チャプター 1: 基礎（クイックスタート）](#-chapter-1-foundation--quick-start) |
| **AI アプリをデプロイしたい** | [チャプター 2: AIファースト開発（AI開発者向け推奨）](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| <strong>ハンズオンで実践したい</strong> | [🎓 インタラクティブワークショップ](workshop/README.md) - 3〜4 時間のガイド付きラボ |
| <strong>本番向けパターンが必要</strong> | [チャプター 8: 本番 & エンタープライズ](#-chapter-8-production--enterprise-patterns) |

### 簡単セットアップ

1. <strong>このリポジトリをフォークする</strong>: [![GitHub フォーク](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. <strong>クローンする</strong>: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. <strong>ヘルプを得る</strong>: [Azure Discord コミュニティ](https://discord.com/invite/ByRwuEEgH4)

> **ローカルでクローンする方がよいですか？**
>
> このリポジトリには50以上の言語翻訳が含まれており、ダウンロードサイズが大幅に増加します。翻訳なしでクローンするには、スパースチェックアウトを使用してください：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> これにより、コースを完了するために必要なすべてがより高速なダウンロードで手に入ります。


## コース概要

段階的学習向けに設計された構造化された章を通じて Azure Developer CLI (azd) を習得します。**Microsoft Foundry 統合による AI アプリケーションのデプロイに特に重点を置いています。**
### なぜこのコースが現代の開発者に不可欠なのか

Microsoft Foundry Discord コミュニティのインサイトに基づくと、<strong>45% の開発者が AI ワークロードに AZD を使いたい</strong>と考えていますが、次のような課題に直面しています:
- 複雑なマルチサービスの AI アーキテクチャ
- 本番環境向けの AI デプロイベストプラクティス  
- Azure AI サービスの統合と構成
- AI ワークロードのコスト最適化
- AI 固有のデプロイ問題のトラブルシューティング

### 学習目標

この構造化されたコースを修了すると、次のことができるようになります:
- **AZD の基本を習得する**: コア概念、インストール、構成
- **AI アプリケーションをデプロイする**: Microsoft Foundry サービスと AZD の利用
- **Infrastructure as Code を実装する**: Bicep テンプレートで Azure リソースを管理
- <strong>デプロイのトラブルシューティングを行う</strong>: よくある問題の解決とデバッグ
- <strong>本番向けに最適化する</strong>: セキュリティ、スケーリング、モニタリング、コスト管理
- <strong>マルチエージェントソリューションを構築する</strong>: 複雑な AI アーキテクチャをデプロイ

## 開始前：アカウント、アクセス、前提条件

Chapter 1 を始める前に、以下が整っていることを確認してください。本ガイドのインストール手順は、これらの基本が既に処理されていることを前提としています。

- **Azure サブスクリプション**: 既存の職場や個人のサブスクリプションを使用するか、始めるには [無料トライアル](https://aka.ms/azurefreetrial) を作成してください。
- **Azure リソースを作成する権限**: ほとんどの演習では、対象のサブスクリプションまたはリソースグループに対して少なくとも **Contributor** アクセスが必要です。一部の章では、リソースグループ、マネージド ID、および RBAC の割り当てを作成できることを想定する場合があります。
- [**GitHub アカウント**](https://github.com): リポジトリをフォークしたり、自分の変更を追跡したり、ワークショップで GitHub Codespaces を使用するのに便利です。
- <strong>テンプレートの実行前提条件</strong>: 一部のテンプレートでは、Node.js、Python、Java、Docker などのローカルツールが必要です。開始前にセットアップバリデータを実行して、ツールの不足を早期に検出してください。
- <strong>基本的なターミナル操作の習熟</strong>: エキスパートである必要はありませんが、`git clone`、`azd auth login`、`azd up` などのコマンドを実行できることが望ましいです。

> **エンタープライズ サブスクリプションで作業していますか？**
> Azure 環境が管理者によって管理されている場合、使用する予定のサブスクリプションまたはリソースグループにリソースをデプロイできることを事前に確認してください。できない場合は、開始前にサンドボックス サブスクリプションか Contributor アクセスを依頼してください。

> **Azure が初めてですか？**
> テナントレベルの承認待ちなしに演習を最後まで完了できるよう、https://aka.ms/azurefreetrial で自分の Azure トライアルまたは従量課金サブスクリプションを開始してください。

## 🗺️ コースマップ：章別クイックナビゲーション

各章には学習目標、クイックスタート、演習を含む専用の README があります：

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | 入門 | [AZDの基本](docs/chapter-01-foundation/azd-basics.md) &#124; [インストール](docs/chapter-01-foundation/installation.md) &#124; [最初のプロジェクト](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2: AI Development](docs/chapter-02-ai-development/README.md)** | AIファーストアプリ | [Foundry 統合](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI エージェント](docs/chapter-02-ai-development/agents.md) &#124; [モデルのデプロイ](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [ワークショップ](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | 認証とセキュリティ | [構成](docs/chapter-03-configuration/configuration.md) &#124; [認証とセキュリティ](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Ch 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC とデプロイ | [デプロイガイド](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [プロビジョニング](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI エージェントソリューション | [小売シナリオ](examples/retail-scenario.md) &#124; [コーディネーションパターン](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | 計画と検証 | [事前チェック](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [キャパシティプランニング](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU 選択](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | デバッグと修正 | [一般的な問題](docs/chapter-07-troubleshooting/common-issues.md) &#124; [デバッグ](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI 問題](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | エンタープライズパターン | [本番運用の実践](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | ハンズオンラボ | [イントロダクション](workshop/docs/instructions/0-Introduction.md) &#124; [テンプレート選択](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [テンプレート検証](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [テンプレート分解](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [テンプレート構成](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [テンプレートカスタマイズ](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [インフラの撤去](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [まとめ](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**合計コース時間:** 約 10-14 時間 | **スキルの進展:** 初心者 → 本番対応

---

## 📚 学習章

<em>経験レベルと目標に基づいて学習パスを選択してください</em>

### 🚀 第1章: 基礎 & クイックスタート
<strong>前提条件</strong>: Azure サブスクリプション、基本的なコマンドライン知識  
<strong>所要時間</strong>: 30-45 分  
<strong>複雑さ</strong>: ⭐

#### 学ぶこと
- Azure Developer CLI の基本概念の理解
- ご利用のプラットフォームへの AZD のインストール
- 最初の成功したデプロイ

#### 学習リソース
- **🎯 ここから始める**: [What is Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 理論**: [AZDの基本](docs/chapter-01-foundation/azd-basics.md) - コア概念と用語
- **⚙️ セットアップ**: [インストール & セットアップ](docs/chapter-01-foundation/installation.md) - プラットフォーム別ガイド
- **🛠️ ハンズオン**: [最初のプロジェクト](docs/chapter-01-foundation/first-project.md) - ステップバイステップのチュートリアル
- **📋 クイックリファレンス**: [コマンド チートシート](resources/cheat-sheet.md)

#### 実践演習
```bash
# インストールの簡単な確認
azd version

# 最初のアプリケーションをデプロイする
azd init --template todo-nodejs-mongo
azd up
```

**💡 章の成果**: AZD を使用してシンプルなウェブアプリケーションを Azure に正常にデプロイする

**✅ 成功の検証:**
```bash
# 第1章を終えた後、次のことができるようになります：
azd version              # インストールされているバージョンを表示します
azd init --template todo-nodejs-mongo  # プロジェクトを初期化します
azd up                  # Azure にデプロイします
azd show                # 実行中のアプリのURLを表示します
# アプリケーションがブラウザで開き、動作します
azd down --force --purge  # リソースをクリーンアップします
```

**📊 所要時間:** 30-45 分  
**📈 修了後のスキルレベル:** 基本的なアプリケーションを独立してデプロイできる  
**📈 修了後のスキルレベル:** 基本的なアプリケーションを独立してデプロイできる

---

### 🤖 第2章: AIファースト開発（AI 開発者に推奨）
<strong>前提条件</strong>: 第1章を修了していること  
<strong>所要時間</strong>: 1-2 時間  
<strong>複雑さ</strong>: ⭐⭐

#### 学ぶこと
- AZD と Microsoft Foundry の統合
- AI 搭載アプリケーションのデプロイ
- AI サービス構成の理解

#### 学習リソース
- **🎯 ここから始める**: [Foundry 統合](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI エージェント**: [AI エージェントガイド](docs/chapter-02-ai-development/agents.md) - AZD でインテリジェントエージェントをデプロイ
- **📖 パターン**: [モデルのデプロイ](docs/chapter-02-ai-development/ai-model-deployment.md) - AI モデルのデプロイと管理
- **🛠️ ワークショップ**: [AI ワークショップラボ](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI ソリューションを AZD 準備する
- **🎥 インタラクティブガイド**: [Workshop Materials](workshop/README.md) - ブラウザベースの学習 (MkDocs * DevContainer Environment)
- **📋 テンプレート**: [Microsoft Foundry テンプレート](#ワークショップリソース)
- **📝 例**: [AZD デプロイ例](examples/README.md)

#### 実践演習
```bash
# 最初のAIアプリケーションをデプロイする
azd init --template azure-search-openai-demo
azd up

# 追加のAIテンプレートを試す
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 章の成果**: RAG 機能を備えた AI 搭載チャットアプリケーションをデプロイして構成する

**✅ 成功の検証:**
```bash
# 第2章の後、次のことができるようになっているはずです:
azd init --template azure-search-openai-demo
azd up
# AIチャットインターフェースをテストする
# 質問をして、出典付きのAI生成の応答を得る
# 検索統合が機能することを確認する
azd monitor  # Application Insightsがテレメトリを表示していることを確認する
azd down --force --purge
```

**📊 所要時間:** 1-2 時間  
**📈 修了後のスキルレベル:** 本番対応の AI アプリケーションをデプロイして構成できる  
**💰 コスト認識:** 開発で月額 $80-150、製品環境で月額 $300-3500 を理解している

#### 💰 AI デプロイのコスト考慮事項

**開発環境（推定 $80-150/月）:**
- Microsoft Foundry Models（従量課金）: $0-50/月（トークン使用量に基づく）
- AI Search（Basic ティア）: $75/月
- Container Apps（Consumption）: $0-20/月
- ストレージ（Standard）: $1-5/月

**本番環境（推定 $300-3,500+/月）:**
- Microsoft Foundry Models（安定した性能のための PTU）: $3,000+/月 または 高トラフィック時の従量課金
- AI Search（Standard ティア）: $250/月
- Container Apps（Dedicated）: $50-100/月
- Application Insights: $5-50/月
- ストレージ（Premium）: $10-50/月

**💡 コスト最適化のヒント:**
- 学習には **Free Tier** の Microsoft Foundry Models を使用する（Azure OpenAI の 50,000 トークン/月が含まれる）
- 開発中で使用していないときは `azd down` を実行してリソースを解放する
- 最初は消費ベースの課金で開始し、本番用にのみ PTU にアップグレードする
- デプロイ前に `azd provision --preview` を使用してコストを見積もる
- オートスケーリングを有効にして、実際の使用分だけ支払う

**コストモニタリング:**
```bash
# 推定の月額費用を確認する
azd provision --preview

# Azure ポータルで実際の費用を監視する
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第3章: 構成と認証
<strong>前提条件</strong>: 第1章を修了していること  
<strong>所要時間</strong>: 45-60 分  
<strong>複雑さ</strong>: ⭐⭐

#### 学ぶこと
- 環境構成と管理
- 認証とセキュリティのベストプラクティス
- リソース命名と整理

#### 学習リソース
- **📖 構成**: [構成ガイド](docs/chapter-03-configuration/configuration.md) - 環境セットアップ
- **🔐 セキュリティ**: [認証パターンとマネージド ID](docs/chapter-03-configuration/authsecurity.md) - 認証パターン
- **📝 例**: [データベースアプリ例](examples/database-app/README.md) - AZD データベースの例

#### 実践演習
- 複数の環境（dev、staging、prod）を構成する
- マネージドアイデンティティ認証を設定する
- 環境固有の構成を実装する

**💡 章の成果**: 適切な認証とセキュリティを備えた複数環境を管理する

---

### 🏗️ 第4章: Infrastructure as Code とデプロイ
<strong>前提条件</strong>: 第1〜3章を修了していること  
<strong>所要時間</strong>: 1-1.5 時間  
<strong>複雑さ</strong>: ⭐⭐⭐

#### 学ぶこと
- 高度なデプロイパターン
- Bicep による Infrastructure as Code
- リソースプロビジョニング戦略

#### 学習リソース
- **📖 デプロイ**: [デプロイガイド](docs/chapter-04-infrastructure/deployment-guide.md) - 完全なワークフロー
- **🏗️ プロビジョニング**: [リソースのプロビジョニング](docs/chapter-04-infrastructure/provisioning.md) - Azure リソース管理
- **📝 例**: [Container App の例](../../examples/container-app) - コンテナ化デプロイ

#### 実践演習
- カスタム Bicep テンプレートを作成する
- マルチサービスアプリケーションをデプロイする
- ブルーグリーンデプロイ戦略を実装する

**💡 章の成果**: カスタムインフラテンプレートを使用して複雑なマルチサービスアプリケーションをデプロイする
### 🎯 Chapter 5: Multi-Agent AI Solutions (Advanced)
<strong>前提条件</strong>: 第1〜2章を完了済み  
<strong>所要時間</strong>: 2-3 hours  
<strong>複雑さ</strong>: ⭐⭐⭐⭐

#### 学習内容
- マルチエージェントアーキテクチャパターン
- エージェントのオーケストレーションと調整
- 本番対応のAIデプロイ

#### 学習リソース
- **🤖 注目プロジェクト**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - 完全な実装
- **🛠️ ARM テンプレート**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - ワンクリックデプロイ
- **📖 アーキテクチャ**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - パターン

#### 実践演習
```bash
# 小売向けの完全なマルチエージェントソリューションを展開する
cd examples/retail-multiagent-arm-template
./deploy.sh

# エージェントの構成を探索する
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 チャプターの成果**: CustomerおよびInventoryエージェントを備えた本番対応のマルチエージェントAIソリューションをデプロイおよび管理

---

### 🔍 Chapter 6: Pre-Deployment Validation & Planning
<strong>前提条件</strong>: 第4章を完了済み  
<strong>所要時間</strong>: 1 hour  
<strong>複雑さ</strong>: ⭐⭐

#### 学習内容
- 容量計画とリソース検証
- SKU選定戦略
- プレフライトチェックと自動化

#### 学習リソース
- **📊 計画**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - リソース検証
- **💰 選定**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - コスト効率の良い選択
- **✅ 検証**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - 自動化スクリプト

#### 実践演習
- 容量検証スクリプトを実行する
- コストのためにSKU選定を最適化する
- 自動化されたプレデプロイチェックを実装する

**💡 チャプターの成果**: デプロイ実行前に検証と最適化を行う

---

### 🚨 Chapter 7: Troubleshooting & Debugging
<strong>前提条件</strong>: 任意のデプロイ章を完了済み  
<strong>所要時間</strong>: 1-1.5 hours  
<strong>複雑さ</strong>: ⭐⭐

#### 学習内容
- 系統的なデバッグ手法
- よくある問題とその対処法
- AI特有のトラブルシューティング

#### 学習リソース
- **🔧 よくある問題**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQと解決策
- **🕵️ デバッグ**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - ステップバイステップの戦略
- **🤖 AIの問題**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AIサービスの問題

#### 実践演習
- デプロイ失敗を診断する
- 認証の問題を解決する
- AIサービスの接続性をデバッグする

**💡 チャプターの成果**: 一般的なデプロイ問題を自力で診断・解決する

---

### 🏢 Chapter 8: Production & Enterprise Patterns
<strong>前提条件</strong>: 第1〜4章を完了済み  
<strong>所要時間</strong>: 2-3 hours  
<strong>複雑さ</strong>: ⭐⭐⭐⭐

#### 学習内容
- 本番デプロイ戦略
- エンタープライズ向けセキュリティパターン
- モニタリングとコスト最適化

#### 学習リソース
- **🏭 本番**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - エンタープライズパターン
- **📝 例**: [Microservices Example](../../examples/microservices) - 複雑なアーキテクチャ
- **📊 モニタリング**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - モニタリング

#### 実践演習
- エンタープライズ向けセキュリティパターンを実装する
- 包括的なモニタリングを設定する
- 適切なガバナンスで本番にデプロイする

**💡 チャプターの成果**: フルな本番機能を備えたエンタープライズ向けアプリケーションをデプロイする

---

## 🎓 ワークショップ概要: ハンズオン学習体験

> **⚠️ ワークショップ状況: 開発中**  
> ワークショップ資料は現在作成・改良中です。コアモジュールは機能していますが、いくつかの高度なセクションは未完です。全コンテンツの完成に向けて積極的に作業しています。 [進捗を確認 →](workshop/README.md)

### インタラクティブなワークショップ資料
<strong>ブラウザベースのツールとガイド付き演習による包括的なハンズオン学習</strong>

ワークショップ資料は、上記の章ベースのカリキュラムを補完する、構造化されたインタラクティブな学習体験を提供します。ワークショップは自己学習と講師主導のセッションの両方を想定して設計されています。

#### 🛠️ ワークショップの特徴
- <strong>ブラウザベースのインターフェイス</strong>: 検索、コピー、テーマ機能を備えた完全なMkDocs対応ワークショップ
- **GitHub Codespaces統合**: ワンクリックで開発環境をセットアップ
- <strong>構造化された学習パス</strong>: 8モジュールのガイド付き演習（合計3-4時間）
- <strong>漸進的な方法論</strong>: 導入 → 選定 → 検証 → 分解 → 構成 → カスタマイズ → クリーンアップ → 総括
- **インタラクティブなDevContainer環境**: 事前構成されたツールと依存関係

#### 📚 ワークショップモジュール構成
ワークショップは、発見からデプロイ習得までを導く「8モジュールの漸進的な方法論」に従います:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Introduction** | ワークショップ概要 | 学習目標、前提条件、ワークショップ構成を理解する | 15 min |
| **1. Selection** | テンプレート探索 | AZDテンプレートを調査し、シナリオに適したAIテンプレートを選択する | 20 min |
| **2. Validation** | デプロイと検証 | `azd up` でテンプレートをデプロイし、インフラが動作することを検証する | 30 min |
| **3. Deconstruction** | 構造の理解 | GitHub Copilotを使用してテンプレートのアーキテクチャ、Bicepファイル、コード構成を調査する | 30 min |
| **4. Configuration** | azure.yamlの詳細 | `azure.yaml`の設定、ライフサイクルフック、環境変数を習得する | 30 min |
| **5. Customization** | カスタマイズ | AI検索、トレーシング、評価を有効にし、シナリオに合わせてカスタマイズする | 45 min |
| **6. Teardown** | クリーンアップ | `azd down --purge` で安全にリソースを削除する | 15 min |
| **7. Wrap-up** | 次のステップ | 達成事項、重要な概念を復習し、学習を継続する | 15 min |

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
# オプション 1: GitHub Codespaces（推奨）
# リポジトリで「Code」→「Create codespace on main」をクリックしてください

# オプション 2: ローカル開発
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md のセットアップ手順に従ってください
```

#### 🎯 ワークショップの学習成果
ワークショップを完了すると、参加者は以下を達成します:
- **本番向けAIアプリケーションをデプロイ**: Microsoft Foundryサービスを使用してAZDでデプロイする
- <strong>マルチエージェントアーキテクチャを習得</strong>: 協調するAIエージェントソリューションを実装する
- <strong>セキュリティのベストプラクティスを実装</strong>: 認証とアクセス制御を設定する
- <strong>スケールに最適化</strong>: コスト効率が高く高性能なデプロイを設計する
- <strong>デプロイのトラブルシューティング</strong>: 一般的な問題を自力で解決する

#### 📖 ワークショップリソース
- **🎥 インタラクティブガイド**: [Workshop Materials](workshop/README.md) - ブラウザベースの学習環境
- **📋 モジュール別手順**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - ワークショップ概要と目的
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - AIテンプレートの検索と選定
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - テンプレートのデプロイと検証
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - テンプレートのアーキテクチャを調査
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yamlを習得
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - シナリオに合わせてカスタマイズ
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - リソースのクリーンアップ
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - レビューと次のステップ
- **🛠️ AIワークショップラボ**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AIに特化した演習
- **💡 クイックスタート**: [Workshop Setup Guide](workshop/README.md#quick-start) - 環境設定

<strong>対象</strong>: 企業研修、大学の授業、自己学習、開発者向けブートキャンプに最適。

---

## 📖 深掘り: AZDの機能

基本を超えて、AZDは本番デプロイ向けの強力な機能を提供します:

- <strong>テンプレートベースのデプロイ</strong> - 一般的なアプリケーションパターン向けの事前構築テンプレートを使用
- <strong>コードとしてのインフラ</strong> - BicepやTerraformを使用してAzureリソースを管理  
- <strong>統合ワークフロー</strong> - アプリケーションのプロビジョニング、デプロイ、モニタリングをシームレスに実行
- <strong>開発者フレンドリー</strong> - 開発者の生産性と体験を最適化

### **AZD + Microsoft Foundry: AIデプロイに最適**

**なぜAZDがAIソリューションに適しているのか？** AZDはAI開発者が直面する主要な課題に対応します:

- **AI対応テンプレート** - Microsoft Foundryモデル、Azure AIサービス、MLワークロード向けの事前設定テンプレート
- **安全なAIデプロイ** - AIサービス、APIキー、モデルエンドポイントのための組み込みセキュリティパターン  
- **本番向けAIパターン** - スケーラブルでコスト効率の高いAIアプリケーションデプロイのベストプラクティス
- **エンドツーエンドのAIワークフロー** - モデル開発から本番デプロイまで、適切なモニタリングを備えて実現
- <strong>コスト最適化</strong> - AIワークロードのためのスマートなリソース配分とスケーリング戦略
- **Microsoft Foundry統合** - Microsoft Foundryのモデルカタログとエンドポイントへのシームレスな接続

---

## 🎯 テンプレート＆サンプルライブラリ

### 注目: Microsoft Foundryテンプレート
**AIアプリケーションをデプロイする場合はここから始めてください！**

> **注意:** これらのテンプレートはさまざまなAIパターンを示しています。いくつかは外部のAzure Samplesで、他はローカル実装です。

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | 外部 |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapter 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| 外部 |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | 外部 |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | 外部 |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | <strong>ローカル</strong> |

### 注目: 完全な学習シナリオ
<strong>学習チャプターにマッピングされた本番対応アプリケーションテンプレート</strong>

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | 基本的なAIデプロイパターン |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | Azure AI Searchを使ったRAG実装 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapter 4 | ⭐⭐ | Document Intelligence統合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | エージェントフレームワークと関数呼び出し |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐ | エンタープライズ向けAIオーケストレーション |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | CustomerおよびInventoryエージェントを用いたマルチエージェントアーキテクチャ |

### 例による学習タイプ

> **📌 ローカル vs. 外部の例:**  
> <strong>ローカル例</strong> (このリポジトリ内) = すぐに使用可能  
> <strong>外部例</strong> (Azure Samples) = リンク先のリポジトリをクローンしてください

#### ローカル例（すぐに使用可能）
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARMテンプレートを含む本番対応の完全な実装
  - マルチエージェントアーキテクチャ（Customer + Inventoryエージェント）
  - 包括的なモニタリングと評価
  - ARMテンプレートによるワンクリックデプロイ

#### ローカル例 - コンテナアプリケーション（第2〜5章）
**このリポジトリの包括的なコンテナデプロイ例:**
- [<strong>コンテナアプリの例</strong>](examples/container-app/README.md) - コンテナ化されたデプロイの完全ガイド
  - [シンプルな Flask API](../../examples/container-app/simple-flask-api) - スケールトゥゼロ対応の基本的な REST API
  - [マイクロサービス アーキテクチャ](../../examples/container-app/microservices) - 本番対応のマルチサービスデプロイ
  - クイックスタート、プロダクション、および高度なデプロイパターン
  - 監視、セキュリティ、およびコスト最適化のガイダンス

#### 外部例 - シンプルアプリケーション（第1〜2章）
**開始するには、これらの Azure Samples リポジトリをクローンしてください:**
- [シンプル Web アプリ - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本的なデプロイパターン
- [静的サイト - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 静的コンテンツのデプロイ
- [コンテナアプリ - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API のデプロイ

#### 外部例 - データベース統合（第3〜4章）  
- [データベースアプリ - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - データベース接続パターン
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - サーバーレスデータワークフロー

#### 外部例 - 高度なパターン（第4〜8章）
- [Java マイクロサービス](https://github.com/Azure-Samples/java-microservices-aca-lab) - マルチサービスアーキテクチャ
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - バックグラウンド処理  
- [エンタープライズ ML パイプライン](https://github.com/Azure-Samples/mlops-v2) - 本番対応の ML パターン

### 外部テンプレートコレクション
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - 公式およびコミュニティテンプレートのキュレーションコレクション
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn のテンプレートドキュメント
- [**Examples Directory**](examples/README.md) - 詳細な説明付きのローカル学習用例

---

## 📚 学習リソース & 参考資料

### クイックリファレンス
- [**コマンド チートシート**](resources/cheat-sheet.md) - 章別に整理された必須の azd コマンド
- [<strong>用語集</strong>](resources/glossary.md) - Azure と azd の用語集  
- [<strong>よくある質問</strong>](resources/faq.md) - 学習章ごとに整理された一般的な質問
- [<strong>学習ガイド</strong>](resources/study-guide.md) - 包括的な実践演習

### ハンズオンワークショップ
- [**AI ワークショップラボ**](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI ソリューションを AZD でデプロイ可能にする（2〜3 時間）
- [<strong>インタラクティブワークショップ</strong>](workshop/README.md) - MkDocs と GitHub Codespaces を使った 8 モジュールのガイド付き演習
  - 続き: 導入 → 選択 → 検証 → 分解 → 構成 → カスタマイズ → 後片付け → まとめ

### 外部学習リソース
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### エディタ向け AI エージェントスキル
- [**skills.sh の Microsoft Azure スキル**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI、Foundry、デプロイ、診断、コスト最適化などのための 37 のオープンエージェントスキル。GitHub Copilot、Cursor、Claude Code、またはサポートされている任意のエージェントにインストールできます:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 クイックトラブルシューティングガイド

**初心者が直面する一般的な問題と即時の解決策:**

<details>
<summary><strong>❌ "azd: command not found"（コマンドが見つかりません）</strong></summary>

```bash
# 先に AZD をインストールしてください
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
<summary><strong>❌ "No subscription found" or "Subscription not set"（サブスクリプションが見つからない、または設定されていません）</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"（クォータ不足またはクォータ超過）</strong></summary>

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
<summary><strong>❌ "azd up" fails halfway through（"azd up" が途中で失敗する）</strong></summary>

```bash
# オプション 1: クリーンアップして再試行
azd down --force --purge
azd up

# オプション 2: インフラのみ修復する
azd provision

# オプション 3: 詳細なステータスを確認する
azd show

# オプション 4: Azure Monitor のログを確認する
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"（認証失敗またはトークンの有効期限切れ）</strong></summary>

```bash
# AZDの再認証を行う
azd auth logout
azd auth login

# 任意: az コマンドを実行している場合は Azure CLI も更新してください
az logout
az login

# 認証を確認する
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts（リソースが既に存在する、または名前の競合）</strong></summary>

```bash
# AZD は一意の名前を生成しますが、競合が発生した場合:
azd down --force --purge

# 新しい環境で再試行する
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long（テンプレートのデプロイに時間がかかりすぎる）</strong></summary>

**通常の待ち時間:**
- シンプルな Web アプリ: 5〜10 分
- データベースを含むアプリ: 10〜15 分
- AI アプリケーション: 15〜25 分（OpenAI のプロビジョニングは遅い）

```bash
# 進捗を確認する
azd show

# 30分以上進まない場合は、Azure ポータルを確認してください：
azd monitor --overview
# 失敗したデプロイを探す
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"（許可が拒否された、または禁止されています）</strong></summary>

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
<summary><strong>❌ Can't find deployed application URL（デプロイされたアプリケーションの URL が見つからない）</strong></summary>

```bash
# すべてのサービスのエンドポイントを表示
azd show

# または Azure ポータルを開く
azd monitor

# 特定のサービスを確認する
azd env get-values
# *_URL 変数を探す
```
</details>

### 📚 完全なトラブルシューティング リソース

- **一般的な問題ガイド:** [詳細な解決策](docs/chapter-07-troubleshooting/common-issues.md)
- **AI 固有の問題:** [AI トラブルシューティング](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **デバッグガイド:** [ステップバイステップのデバッグ](docs/chapter-07-troubleshooting/debugging.md)
- **ヘルプを得る:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 コース修了 & 認定

### 進捗トラッキング
各章の学習進捗を追跡してください:

- [ ] **第1章**: 基礎とクイックスタート ✅
- [ ] **第2章**: AIファースト開発 ✅  
- [ ] **第3章**: 構成と認証 ✅
- [ ] **第4章**: インフラストラクチャをコード化 & デプロイ ✅
- [ ] **第5章**: マルチエージェント AI ソリューション ✅
- [ ] **第6章**: 事前デプロイ検証と計画 ✅
- [ ] **第7章**: トラブルシューティングとデバッグ ✅
- [ ] **第8章**: 本番 & エンタープライズパターン ✅

### 学習検証
各章を修了したら、以下で知識を確認してください:
1. <strong>実践演習</strong>: 章のハンズオンデプロイを完了する
2. <strong>知識チェック</strong>: 章の FAQ セクションを確認する
3. <strong>コミュニティでの議論</strong>: Azure Discord で経験を共有する
4. <strong>次の章へ</strong>: 次の難易度レベルへ進む

### コース修了の利点
全章を修了すると、以下が得られます:
- <strong>本番経験</strong>: 実際の AI アプリケーションを Azure にデプロイ済み
- <strong>プロフェッショナルスキル</strong>: エンタープライズ対応のデプロイ能力  
- <strong>コミュニティでの認知</strong>: Azure 開発者コミュニティのアクティブメンバー
- <strong>キャリアの向上</strong>: 需要の高い AZD と AI デプロイの専門知識

---

## 🤝 コミュニティ & サポート

### ヘルプとサポートを受ける
- <strong>技術的な問題</strong>: [バグ報告と機能要望](https://github.com/microsoft/azd-for-beginners/issues)
- <strong>学習に関する質問</strong>: [Microsoft Azure Discord コミュニティ](https://discord.gg/microsoft-azure) と [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 固有のサポート**: [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) に参加してください
- <strong>ドキュメント</strong>: [公式 Azure Developer CLI ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord からのコミュニティの洞察

**#Azure チャンネルの最近の投票結果:**
- **45%** の開発者が AI ワークロードに AZD を使用したいと回答
- <strong>主な課題</strong>: マルチサービスのデプロイ、資格情報管理、本番準備  
- <strong>最も要望が多いもの</strong>: AI 固有のテンプレート、トラブルシューティングガイド、ベストプラクティス

**コミュニティに参加すると:**
- AZD + AI の経験を共有して支援を受けられます
- 新しい AI テンプレートの早期プレビューにアクセスできます
- AI デプロイのベストプラクティスに貢献できます
- 将来の AI + AZD 機能開発に影響を与えられます

### コースへの貢献
貢献を歓迎します！詳細は [Contributing Guide](CONTRIBUTING.md) をお読みください:
- <strong>コンテンツの改善</strong>: 既存章や例を強化する
- <strong>新しい例</strong>: 実世界のシナリオやテンプレートを追加する  
- <strong>翻訳</strong>: 多言語サポートの維持に協力する
- <strong>バグ報告</strong>: 正確性と明確性を向上させる
- <strong>コミュニティ基準</strong>: 包摂的なコミュニティガイドラインに従う

---

## 📄 コース情報

### ライセンス
このプロジェクトは MIT License の下でライセンスされています。詳細は [LICENSE](../../LICENSE) ファイルを参照してください。

### 関連する Microsoft 学習リソース

当チームは他の包括的な学習コースも制作しています:

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
[![AI エージェント入門](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### ジェネレーティブAIシリーズ
[![ジェネレーティブAI入門](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![ジェネレーティブAI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![ジェネレーティブAI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![生成AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### コア学習
[![初心者向け ML](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![初心者向けデータサイエンス](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![初心者向け AI](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![初心者向けサイバーセキュリティ](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![初心者向け Web開発](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![初心者向け IoT](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![初心者向け XR開発](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot シリーズ
[![AIペアプログラミング向け Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET 向け Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot アドベンチャー](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ コースナビゲーション

**🚀 学習を始める準備はできましたか？**

<strong>初心者</strong>: 始めるには [第1章: 基礎とクイックスタート](#-chapter-1-foundation--quick-start)  
**AI開発者**: [第2章: AIファースト開発](#-chapter-2-ai-first-development-recommended-for-ai-developers) に進んでください  
<strong>経験のある開発者</strong>: 始めるには [第3章: 構成と認証](#️-chapter-3-configuration--authentication)

<strong>次のステップ</strong>: [第1章を開始 - AZDの基本](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->