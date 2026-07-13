# AZD初心者向け: 構造化された学習の旅

![AZD-for-beginners](../../translated_images/ja/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 自動翻訳（常に最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](./README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **ローカルでクローンすることを希望しますか？**
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
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> これにより、コースを完了するために必要なすべてがより高速にダウンロードできます。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 今日の azd の新機能

> 📌 このコースは **`azd 1.27.1`**（2026年7月）で検証されています。`azd version` でビルドを確認し、`azd upgrade` で最新を入手してください。

Azure Developer CLI は従来のWebアプリやAPIだけでなく拡張しています。今日、azd は AI 搭載アプリやインテリジェントエージェントを含む <strong>あらゆる</strong> アプリケーションを Azure にデプロイするための単一ツールです。

これはあなたにとってこういう意味です：

- **AIエージェントは今やazdの第一級ワークロードです。** すでに知っている `azd init` → `azd up` のワークフローで AIエージェントプロジェクトを初期化、デプロイ、管理できます。
- **CLIからの完全なエージェントライフサイクル。** `azure.ai.agents` 拡張は完全な工程をカバーしています—`azd ai agent init` でスキャフォールド作成、`azd ai agent invoke` でテスト（応答時間出力付き）、`azd ai agent eval generate` と `azd ai agent optimize` で質を測定・改善、`azd ai agent delete` でクリーンアップ。
- **より多くのAIビルディングブロック。** 新しいプレビュー拡張 `azure.ai.skills` と `azure.ai.connections` で、azd を使って再利用可能なエージェントスキルやFoundryコネクションを直接管理可能。
- **Microsoft Foundry統合** により、モデルのデプロイ、エージェントホスティング、AIサービスの構成が azd テンプレートエコシステムに直接組み込まれました。
- **日常基本操作の改善。** 最近のリリースで `azd init` は冪等性を持ち（再実行しても安全）、`azd auth login` は期限切れトークンを自動クリアし、親しみやすい `azd tool` 初回設定プロンプトが追加されました。
- **コアワークフローは変わっていません。** Todoアプリ、マイクロサービス、マルチエージェントAIソリューションなど、どのアプリでも同じコマンドです。

> **Aspireユーザーへの注意:** Microsoft は製品名を単に **Aspire**（旧「.NET Aspire」）と呼ぶようになりました。azdのAspire対応は変わらず、名前のみの更新です。

以前azdを使用したことがある方にとって、AIサポートは自然な拡張です。別ツールや高度なトラックではありません。初めての方は、すべてに有効なワークフローを学びます。

---

## 🚀 Azure Developer CLI（azd）とは？

**Azure Developer CLI（azd）** とは、アプリの Azure デプロイを簡単にする開発者向けコマンドラインツールです。複数の Azure リソースを手動で作成・接続する代わりに、ワンコマンドでアプリ全体をデプロイできます。

### `azd up` の魔法

```bash
# この単一のコマンドですべてを行います：
# ✅ すべてのAzureリソースを作成します
# ✅ ネットワークとセキュリティを構成します
# ✅ アプリケーションコードをビルドします
# ✅ Azureにデプロイします
# ✅ 動作するURLを提供します
azd up
```

**これだけです！** Azure ポータルをクリックする必要もなく、複雑な ARM テンプレートを先に学ぶ必要もなく、手動設定も不要で、Azure 上で動作するアプリケーションができあがります。

---

## ❓ Azure Developer CLI と Azure CLI の違いは？

初心者が最もよく質問する内容です。簡単な答えは以下の通り：

| 機能 | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| <strong>目的</strong> | 個々の Azure リソースの管理 | 完全なアプリケーションのデプロイ |
| <strong>考え方</strong> | インフラ重視 | アプリケーション重視 |
| <strong>例</strong> | `az webapp create --name myapp...` | `azd up` |
| <strong>習得難易度</strong> | Azureサービスを知る必要あり | アプリを知っていればOK |
| <strong>最適な利用者</strong> | DevOps、インフラ管理者 | 開発者、プロトタイピング |

### シンプルな例え

- **Azure CLI** は家を建てるためのすべての道具が揃っているようなものです—ハンマー、のこぎり、釘。何でも建てられますが、建築の知識が必要です。
- **Azure Developer CLI** は請負業者を雇ったようなものです—望みを伝えれば、彼らが建設を担当します。

### 使い分けのタイミング

| シナリオ | 使うコマンド |
|----------|----------|
| "ウェブアプリをすぐにデプロイしたい" | `azd up` |
| "ストレージアカウントだけ作りたい" | `az storage account create` |
| "完全なAIアプリを作っている" | `azd init --template azure-search-openai-demo` |
| "特定のAzureリソースをデバッグしたい" | `az resource show` |
| "数分で本番対応のデプロイをしたい" | `azd up --environment production` |

### 両方使えます！

AZD は内部で Azure CLI を利用しています。両方を使うことが可能です：
```bash
# AZDでアプリをデプロイします
azd up

# その後、Azure CLIで特定のリソースを微調整します
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD でテンプレートを見つけよう

一から始める必要はありません！**Awesome AZD** はコミュニティがコレクションしたデプロイ用テンプレート集です：

| リソース | 説明 |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | 200以上のテンプレートをワンクリックでデプロイ |
| 🔗 [<strong>テンプレートの提出</strong>](https://github.com/Azure/awesome-azd/issues) | 自作テンプレートをコミュニティに貢献 |
| 🔗 [**GitHubリポジトリ**](https://github.com/Azure/awesome-azd) | スターをつけてソースを探索 |

### Awesome AZD の人気AIテンプレート

```bash
# Microsoft FoundryモデルとAI検索を使用したRAGチャット
azd init --template azure-search-openai-demo

# クイックAIチャットアプリケーション
azd init --template openai-chat-app-quickstart

# Foundryエージェントを用いたAIエージェント
azd init --template get-started-with-ai-agents
```

---

## 🎯 3ステップで始めよう

はじめる前に、デプロイしたいテンプレートに対応したマシンの準備を確認しましょう：

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

必要なチェックが失敗した場合は、まずそれを修正してからクイックスタートを続けてください。

### ステップ 1: AZDをインストール (2分)

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

### ステップ 2: AZDの認証

```bash
# このコースでAzure CLIコマンドを直接使用する場合は任意です
az login

# AZDワークフローには必須です
azd auth login
```

どれが必要か迷ったら、[Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup) のフルセットアップフローを参照してください。

### ステップ 3: 最初のアプリをデプロイ

```bash
# テンプレートから初期化します
azd init --template todo-nodejs-mongo

# Azureにデプロイします（すべてを作成します！）
azd up
```

**🎉 これで完了！** あなたのアプリは Azure 上でライブになりました。

### クリーンアップ (忘れずに！)

```bash
# 実験終了後にすべてのリソースを削除する
azd down --force --purge
```

---

## 📚 このコースの使い方

このコースは<strong>段階的な学習</strong>向けに設計されています—自分が快適なところから始めて段階的に進めていきましょう：

| あなたの経験 | ここから始めよう |
|-----------------|------------|
| **Azure初心者** | [第1章: 基礎](#-chapter-1-foundation--quick-start) |
| **Azureは知っているがAZDは初めて** | [第1章: 基礎](#-chapter-1-foundation--quick-start) |
| **AIアプリをデプロイしたい** | [第2章: AIファースト開発](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| <strong>実践的に学びたい</strong> | [🎓 インタラクティブワークショップ](workshop/README.md) - 3～4時間のガイド付きラボ |
| <strong>本番環境パターンが必要</strong> | [第8章: 本番＆エンタープライズ](#-chapter-8-production--enterprise-patterns) |

### クイックセットアップ

1. <strong>このリポジトリをフォーク</strong>: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. <strong>クローンする</strong>: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. <strong>ヘルプを得る</strong>: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **ローカルでクローンすることを希望しますか？**

> このリポジトリには50以上の言語翻訳が含まれており、ダウンロードサイズが大幅に増加します。翻訳なしでクローンするには、スパースチェックアウトを使用してください：
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> これにより、コースを完了するために必要なすべてがより高速にダウンロードできます。


## コース概要

段階的な学習のために設計された構造化された章を通じて Azure Developer CLI (azd) を習得しましょう。**Microsoft Foundry 連携による AI アプリケーション展開に特別に焦点を当てています。**


### なぜこのコースが現代の開発者にとって不可欠なのか

Microsoft Foundry Discordコミュニティの洞察に基づき、<strong>45%の開発者がAIワークロードにAZDを使いたい</strong>と考えているものの、以下の課題に直面しています：
- 複雑なマルチサービスAIアーキテクチャ
- 本番環境のAIデプロイメントベストプラクティス  
- Azure AIサービスの統合と設定
- AIワークロードのコスト最適化
- AI特有のデプロイメント問題のトラブルシューティング

### 学習目標

この体系的なコースを修了すると、以下ができるようになります：
- **AZDの基礎を習得**：コア概念、インストール、設定
- **AIアプリケーションをデプロイ**：AZDとMicrosoft Foundryサービスを使用
- **インフラストラクチャー as Codeを実装**：BicepテンプレートでAzureリソース管理
- <strong>デプロイのトラブルシューティング</strong>：一般的な問題の解決とデバッグ
- <strong>本番環境向け最適化</strong>：セキュリティ、スケーリング、モニタリング、コスト管理
- <strong>マルチエージェントソリューションの構築</strong>：複雑なAIアーキテクチャをデプロイ

## はじめる前に：アカウント、アクセス、前提条件

第1章を始める前に、以下が整っていることを確認してください。このガイドの後半にあるインストール手順は、これらの基本が済んでいることを前提としています。

- **Azureサブスクリプション**：職場や個人の既存サブスクリプションを使うか、[無料トライアル](https://aka.ms/azurefreetrial)を作成して始めましょう。
- **Azureリソース作成の権限**：ほとんどの演習では、対象のサブスクリプションまたはリソースグループに対して最低でも<strong>Contributor</strong>アクセスが必要です。一部の章ではリソースグループやマネージドID、RBAC割り当てを作成できることも前提とします。
- [**GitHubアカウント**](https://github.com)：リポジトリのフォーク、自分の変更追跡、GitHub Codespacesでのワークショップ利用に便利です。
- <strong>テンプレートの実行前提条件</strong>：一部テンプレートはNode.js、Python、Java、Dockerなどのローカルツールが必要です。開始前にセットアップバリデータを実行して不足を早期に検出しましょう。
- <strong>基本的なターミナルの使い方</strong>：専門家である必要はありませんが、`git clone`、`azd auth login`、`azd up`などのコマンドを快適に実行できることが望ましいです。

> **エンタープライズサブスクリプションで作業していますか？**
> Azure環境が管理者によって管理されている場合、使用予定のサブスクリプションまたはリソースグループでリソースをデプロイ可能か事前に確認してください。そうでなければ、開始前にサンドボックスサブスクリプションやContributorアクセスを依頼してください。

> **Azure初心者ですか？**
> 自分のAzureトライアルか従量課金サブスクリプション（https://aka.ms/azurefreetrial）から始め、テナントレベルの承認を待たずに演習を最後まで完了できるようにしましょう。

## 🗺️ コースマップ：章ごとのクイックナビゲーション

各章には学習目標、クイックスタート、演習がまとめられた専用READMEがあります：

| 章 | トピック | レッスン | 期間 | 難易度 |
|---------|-------|---------|----------|------------|
| **[第1章：基礎](docs/chapter-01-foundation/README.md)** | はじめに | [AZD 基礎](docs/chapter-01-foundation/azd-basics.md) &#124; [インストール](docs/chapter-01-foundation/installation.md) &#124; [最初のプロジェクト](docs/chapter-01-foundation/first-project.md) | 30-45分 | ⭐ |
| **[第2章：AI開発](docs/chapter-02-ai-development/README.md)** | AIファーストアプリ | [Foundry 統合](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AIエージェント](docs/chapter-02-ai-development/agents.md) &#124; [モデルデプロイ](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [ワークショップ](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2時間 | ⭐⭐ |
| **[第3章：設定](docs/chapter-03-configuration/README.md)** | 認証とセキュリティ | [設定](docs/chapter-03-configuration/configuration.md) &#124; [認証とセキュリティ](docs/chapter-03-configuration/authsecurity.md) | 45-60分 | ⭐⭐ |
| **[第4章：インフラ](docs/chapter-04-infrastructure/README.md)** | IaCとデプロイ | [デプロイガイド](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [プロビジョニング](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5時間 | ⭐⭐⭐ |
| **[第5章：マルチエージェント](docs/chapter-05-multi-agent/README.md)** | AIエージェントソリューション | [小売シナリオ](examples/retail-scenario.md) &#124; [調整パターン](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3時間 | ⭐⭐⭐⭐ |
| **[第6章：事前準備](docs/chapter-06-pre-deployment/README.md)** | 計画と検証 | [事前チェック](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [容量計画](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU選択](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1時間 | ⭐⭐ |
| **[第7章：トラブルシューティング](docs/chapter-07-troubleshooting/README.md)** | デバッグと修正 | [一般的な問題](docs/chapter-07-troubleshooting/common-issues.md) &#124; [デバッグ](docs/chapter-07-troubleshooting/debugging.md) &#124; [AIの問題](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5時間 | ⭐⭐ |
| **[第8章：本番運用](docs/chapter-08-production/README.md)** | エンタープライズパターン | [本番運用の実践](docs/chapter-08-production/production-ai-practices.md) | 2-3時間 | ⭐⭐⭐⭐ |
| **[🎓 ワークショップ](workshop/README.md)** | ハンズオン実習 | [イントロダクション](workshop/docs/instructions/0-Introduction.md) &#124; [選択](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [検証](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [分解](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [設定](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [カスタマイズ](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [撤収](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [まとめ](workshop/docs/instructions/7-Wrap-up.md) | 3-4時間 | ⭐⭐ |

**合計コース時間:** 約10-14時間 | **スキル進捗:** 初級 → 本番運用準備完了

---

## 📚 学習章

<em>経験レベルと目標に応じて学習パスを選択してください</em>

### 🚀 第1章：基礎とクイックスタート
<strong>前提条件</strong>：Azureサブスクリプション、基本的なコマンドライン知識  
<strong>所要時間</strong>：30-45分  
<strong>難易度</strong>：⭐

#### 学ぶ内容
- Azure Developer CLIの基礎理解
- プラットフォームへのAZDインストール
- 最初の成功したデプロイメント

#### 学習リソース
- **🎯 ここから始める**： [Azure Developer CLIとは？](#what-is-azure-developer-cli)
- **📖 理論**： [AZD基礎](docs/chapter-01-foundation/azd-basics.md) - コア概念と用語
- **⚙️ セットアップ**： [インストール＆セットアップ](docs/chapter-01-foundation/installation.md) - プラットフォーム別ガイド
- **🛠️ 実習**： [最初のプロジェクト](docs/chapter-01-foundation/first-project.md) - ステップバイステップチュートリアル
- **📋 クイックリファレンス**： [コマンドチートシート](resources/cheat-sheet.md)

#### 実践演習
```bash
# クイックインストールチェック
azd version

# 最初のアプリケーションを展開する
azd init --template todo-nodejs-mongo
azd up
```

**💡 章の成果**：AZDを使ってAzureにシンプルなウェブアプリケーションをデプロイ成功

**✅ 成功検証：**
```bash
# 第1章を完了した後、以下のことができるようになります:
azd version              # インストールされているバージョンを表示します
azd init --template todo-nodejs-mongo  # プロジェクトを初期化します
azd up                  # Azureにデプロイします
azd show                # 実行中のアプリのURLを表示します
# アプリケーションがブラウザで開き、動作します
azd down --force --purge  # リソースをクリーンアップします
```

**📊 所要時間：** 30-45分  
**📈 修了後スキルレベル：** 基本的なアプリケーションを独立してデプロイ可能
**📈 修了後スキルレベル：** 基本的なアプリケーションを独立してデプロイ可能

---

### 🤖 第2章：AIファースト開発（AI開発者推奨）
<strong>前提条件</strong>：第1章修了  
<strong>所要時間</strong>：1-2時間  
<strong>難易度</strong>：⭐⭐

#### 学ぶ内容
- Microsoft FoundryとAZDの統合
- AI搭載アプリケーションのデプロイ
- AIサービス設定の理解

#### 学習リソース
- **🎯 ここから始める**： [Microsoft Foundry統合](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AIエージェント**： [AIエージェントガイド](docs/chapter-02-ai-development/agents.md) - AZDでインテリジェントエージェントをデプロイ
- **📖 パターン**： [AIモデルデプロイ](docs/chapter-02-ai-development/ai-model-deployment.md) - AIモデルのデプロイと管理
- **🛠️ ワークショップ**： [AIワークショップラボ](docs/chapter-02-ai-development/ai-workshop-lab.md) - AIソリューションをAZD対応に
- **🎥 インタラクティブガイド**： [ワークショップ資料](workshop/README.md) - MkDocs * DevContainer環境によるブラウザベース学習
- **📋 テンプレート**： [Microsoft Foundryテンプレート](#ワークショップリソース)
- **📝 例**： [AZDデプロイ例](examples/README.md)

#### 実践演習
```bash
# 最初のAIアプリケーションを展開する
azd init --template azure-search-openai-demo
azd up

# 追加のAIテンプレートを試す
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 章の成果**：RAG機能付きAIチャットアプリをデプロイし設定

**✅ 成功検証：**
```bash
# 第2章の後、あなたは以下ができるはずです：
azd init --template azure-search-openai-demo
azd up
# AIチャットインターフェースをテストする
# 質問をして情報源付きのAIによる回答を得る
# 検索統合が機能しているか確認する
azd monitor  # Application Insightsがテレメトリを表示しているか確認する
azd down --force --purge
```

**📊 所要時間：** 1-2時間  
**📈 修了後スキルレベル：** 本番対応AIアプリのデプロイと設定が可能  
**💰 コスト意識：** 開発環境で月$80-150、本番では月$300-3500のコストを理解

#### 💰 AIデプロイのコスト考慮事項

**開発環境（推定月$80-150）：**
- Microsoft Foundryモデル（従量課金）：トークン使用量により月$0-50
- AI Search（Basic階層）：$75/月
- Container Apps（消費ベース）：$0-20/月
- ストレージ（標準）：$1-5/月

**本番環境（推定月$300-3,500以上）：**
- Microsoft Foundryモデル（PTUで安定動作）：月$3,000以上 または 高負荷時の従量課金
- AI Search（Standard階層）：$250/月
- Container Apps（専用）：$50-100/月
- Application Insights：$5-50/月
- ストレージ（プレミアム）：$10-50/月

**💡 コスト最適化のヒント：**
- 学習時には<strong>無料階層</strong>Microsoft Foundryモデルを使用（Azure OpenAI 50,000トークン/月含む）
- アクティブに開発していないときは`azd down`でリソースを解放
- 初期は従量制課金で開始し、本番環境のみPTUにアップグレード
- デプロイ前に`azd provision --preview`でコストを推定
- オートスケーリングを有効化し、実際の使用分のみ支払い

**コストモニタリング：**
```bash
# 推定月間コストを確認する
azd provision --preview

# Azureポータルで実際のコストを監視する
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第3章：設定と認証
<strong>前提条件</strong>：第1章修了  
<strong>所要時間</strong>：45-60分  
<strong>難易度</strong>：⭐⭐

#### 学ぶ内容
- 環境設定と管理
- 認証とセキュリティのベストプラクティス
- リソースの命名と組織化

#### 学習リソース
- **📖 設定**： [設定ガイド](docs/chapter-03-configuration/configuration.md) - 環境セットアップ
- **🔐 セキュリティ**： [認証パターンとマネージドID](docs/chapter-03-configuration/authsecurity.md) - 認証パターン
- **📝 例**： [データベースアプリ例](examples/database-app/README.md) - AZDデータベース例

#### 実践演習
- 複数環境（開発、ステージング、本番）の設定
- マネージドID認証の設定
- 環境別設定の実装

**💡 章の成果**：適切な認証とセキュリティで複数環境を管理

---

### 🏗️ 第4章：インフラストラクチャー as Code とデプロイ
<strong>前提条件</strong>：第1～3章修了  
<strong>所要時間</strong>：1-1.5時間  
<strong>難易度</strong>：⭐⭐⭐

#### 学ぶ内容
- 高度なデプロイメントパターン
- Bicepによるインフラストラクチャー as Code
- リソースプロビジョニング戦略

#### 学習リソース
- **📖 デプロイメント**： [デプロイガイド](docs/chapter-04-infrastructure/deployment-guide.md) - 完全なワークフロー
- **🏗️ プロビジョニング**： [リソースプロビジョニング](docs/chapter-04-infrastructure/provisioning.md) - Azureリソース管理
- **📝 例**： [コンテナアプリ例](../../examples/container-app) - コンテナデプロイメント

#### 実践演習
- カスタムBicepテンプレートの作成
- マルチサービスアプリケーションのデプロイ
- ブルーグリーンデプロイメント戦略の実装

**💡 章の成果**：カスタムインフラテンプレートを使い複雑なマルチサービスアプリをデプロイ

---


### 🎯 第5章：マルチエージェントAIソリューション（上級）
<strong>前提条件</strong>：第1～2章を完了  
<strong>所要時間</strong>：2～3時間  
<strong>難易度</strong>：⭐⭐⭐⭐

#### 学習内容
- マルチエージェントアーキテクチャパターン
- エージェントのオーケストレーションと調整
- 本番対応のAI展開

#### 学習リソース
- **🤖 注目プロジェクト**：[Retail Multi-Agent Solution](examples/retail-scenario.md) - 完全実装
- **🛠️ ARMテンプレート**：[ARM Template Package](../../examples/retail-multiagent-arm-template) - ワンクリック展開
- **📖 アーキテクチャ**：[Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - パターン

#### 実践演習
```bash
# 完全な小売マルチエージェントソリューションを展開する
cd examples/retail-multiagent-arm-template
./deploy.sh

# エージェントの設定を探る
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 章の成果**：CustomerエージェントとInventoryエージェントによる本番対応のマルチエージェントAIソリューションを展開・管理

---

### 🔍 第6章：展開前の検証と計画
<strong>前提条件</strong>：第4章を完了  
<strong>所要時間</strong>：1時間  
<strong>難易度</strong>：⭐⭐

#### 学習内容
- キャパシティプランニングとリソース検証
- SKU選択の戦略
- 展開前チェックと自動化

#### 学習リソース
- **📊 計画**：[Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - リソース検証
- **💰 選択**：[SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - コスト効率の良い選択
- **✅ 検証**：[Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - 自動化スクリプト

#### 実践演習
- キャパシティ検証スクリプトの実行
- コストを考慮したSKU選択の最適化
- 展開前チェックの自動化の実装

**💡 章の成果**：展開前に検証と最適化を実施

---

### 🚨 第7章：トラブルシューティングとデバッグ
<strong>前提条件</strong>：いずれかの展開章を完了  
<strong>所要時間</strong>：1～1.5時間  
<strong>難易度</strong>：⭐⭐

#### 学習内容
- システマティックなデバッグ手法
- よくある問題とその解決策
- AI固有のトラブルシューティング

#### 学習リソース
- **🔧 よくある問題**：[Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQと解決策
- **🕵️ デバッグ**：[Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - ステップバイステップの戦略
- **🤖 AI問題**：[AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AIサービス問題

#### 実践演習
- 展開失敗の診断
- 認証問題の解決
- AIサービスの接続問題のデバッグ

**💡 章の成果**：一般的な展開問題を独力で診断・解決

---

### 🏢 第8章：本番環境＆エンタープライズパターン
<strong>前提条件</strong>：第1～4章を完了  
<strong>所要時間</strong>：2～3時間  
<strong>難易度</strong>：⭐⭐⭐⭐

#### 学習内容
- 本番展開戦略
- エンタープライズセキュリティパターン
- 監視とコスト最適化

#### 学習リソース
- **🏭 本番対応**：[Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - エンタープライズパターン
- **📝 例**：[Microservices Example](../../examples/microservices) - 複雑なアーキテクチャ
- **📊 監視**：[Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - 監視

#### 実践演習
- エンタープライズセキュリティパターンの実装
- 包括的な監視の設定
- 適切なガバナンスを備えた本番展開

**💡 章の成果**：本番対応可能なエンタープライズアプリケーションの展開

---

## 🎓 ワークショップ概要：ハンズオン学習体験

> **⚠️ ワークショップ状況：開発中**  
> ワークショップ資料は現在開発と調整中です。主要モジュールは機能しており、一部の上級セクションは未完成です。すべてのコンテンツ完成に向けて積極的に作業を進めています。[進捗を確認 →](workshop/README.md)

### インタラクティブなワークショップ資料
<strong>ブラウザベースのツールと案内付き演習による包括的なハンズオン学習</strong>

本ワークショップ資料は、上記の章ベースのカリキュラムを補完する構造化されたインタラクティブ学習体験を提供します。自己学習およびインストラクター主導型の両方に対応しています。

#### 🛠️ ワークショップの特徴
- <strong>ブラウザベースインターフェース</strong>：MkDocs搭載の完全ワークショップ、検索、コピー、テーマ機能付き
- **GitHub Codespaces統合**：ワンクリックで開発環境をセットアップ
- <strong>構造化された学習パス</strong>：全8モジュールの案内付き演習（合計3～4時間）
- <strong>段階的メソッド</strong>：導入 → 選択 → 検証 → 分解 → 設定 → カスタマイズ → 解体 → 総括
- **インタラクティブなDevContainer環境**：事前設定されたツールと依存関係

#### 📚 ワークショップモジュール構成
ワークショップは、探索から展開マスターまでを導く<strong>8モジュール段階的手法</strong>に従います：

| モジュール | トピック | 内容 | 所要時間 |
|--------|-------|----------------|---------|
| **0. 導入** | ワークショップ概要 | 学習目標、前提条件、ワークショップ構成の理解 | 15分 |
| **1. 選択** | テンプレート探索 | AZDテンプレートを探索し、シナリオに合ったAIテンプレートを選択 | 20分 |
| **2. 検証** | 展開＆検証 | `azd up`でテンプレートを展開し、インフラ動作を検証 | 30分 |
| **3. 分解** | 構造理解 | GitHub CopilotでテンプレートアーキテクチャやBicepファイル、コード構成を探る | 30分 |
| **4. 設定** | azure.yaml 深堀り | `azure.yaml`設定、ライフサイクルフック、環境変数をマスター | 30分 |
| **5. カスタマイズ** | 自分仕様に | AI検索、有効化、トレーシング、評価を行い、シナリオに合わせてカスタマイズ | 45分 |
| **6. 解体** | クリーンアップ | `azd down --purge`で安全にリソースを解放 | 15分 |
| **7. 総括** | 今後の展開 | 達成事項、重要概念の復習と学習継続の案内 | 15分 |

**ワークショップの流れ：**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 ワークショップ開始方法
```bash
# オプション 1: GitHub Codespaces（推奨）
# リポジトリで「Code」→「mainでコードスペースを作成」をクリック

# オプション 2: ローカル開発
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md のセットアップ手順に従ってください
```

#### 🎯 ワークショップ学習成果
ワークショップを完了すると、参加者は以下を習得できます：
- **本番AIアプリケーションの展開**：Microsoft FoundryサービスとAZDを活用
- <strong>マルチエージェントアーキテクチャの習得</strong>：調整されたAIエージェントソリューションの実装
- <strong>セキュリティベストプラクティス適用</strong>：認証とアクセス制御の設定
- <strong>スケール最適化</strong>：コスト効率と性能を考慮した設計
- <strong>展開トラブルシューティング</strong>：一般的な問題を独力で解決

#### 📖 ワークショップリソース
- **🎥 インタラクティブガイド**：[Workshop Materials](workshop/README.md) - ブラウザベースの学習環境
- **📋 モジュール別手順**：
  - [0. 導入](workshop/docs/instructions/0-Introduction.md) - ワークショップ概要と目標
  - [1. 選択](workshop/docs/instructions/1-Select-AI-Template.md) - AIテンプレートの探索と選択
  - [2. 検証](workshop/docs/instructions/2-Validate-AI-Template.md) - 展開と検証
  - [3. 分解](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - テンプレートアーキテクチャの探索
  - [4. 設定](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yamlのマスター
  - [5. カスタマイズ](workshop/docs/instructions/5-Customize-AI-Template.md) - シナリオに合わせたカスタマイズ
  - [6. 解体](workshop/docs/instructions/6-Teardown-Infrastructure.md) - リソースのクリーンアップ
  - [7. 総括](workshop/docs/instructions/7-Wrap-up.md) - 振り返りと次のステップ
- **🛠️ AIワークショップラボ**：[AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AIに特化した演習
- **💡 クイックスタート**：[Workshop Setup Guide](workshop/README.md#quick-start) - 環境設定

<strong>最適対象</strong>：企業向け研修、大学講義、自習者、デベロッパーブートキャンプ

---

## 📖 深堀り：AZDの機能

基本を超えて、AZDは本番展開向けに強力な機能を提供します：

- <strong>テンプレートベースの展開</strong> - 共通パターンのための事前構築テンプレートの活用
- **Infrastructure as Code** - BicepやTerraformを用いたAzureリソース管理  
- <strong>統合されたワークフロー</strong> - アプリケーションのプロビジョニング、展開、監視のシームレスな実行
- <strong>開発者に優しい</strong> - 生産性と体験を最適化

### **AZD + Microsoft Foundry：AI展開に最適**

**なぜAZDがAIソリューションに最適か？** AZDはAI開発者が直面する主要課題に対応します：

- **AI対応テンプレート** - Microsoft Foundryモデル、Azure AIサービス、MLワークロード向けの事前設定済みテンプレート
- **安全なAI展開** - AIサービス、APIキー、モデルエンドポイントの組み込みセキュリティパターン  
- **本番AIパターン** - 拡張性とコスト効率を考慮したAIアプリケーション展開のベストプラクティス
- **エンドツーエンドAIワークフロー** - モデル開発から本番展開までの適切な監視付き
- <strong>コスト最適化</strong> - AIワークロード向けのスマートなリソース割り当てとスケーリング戦略
- **Microsoft Foundry統合** - Microsoft Foundryモデルカタログとエンドポイントへのシームレスな接続

---

## 🎯 テンプレート＆例ライブラリ

### 注目：Microsoft Foundryテンプレート
**AIアプリケーションを展開するならまずここから！**

> **注意：** これらのテンプレートは様々なAIパターンを示します。一部は外部Azure Samplesで、一部はローカル実装です。

| テンプレート | 章 | 難易度 | サービス | タイプ |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | 外部 |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第2章 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| 外部 |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | 外部 |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | 外部 |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | <strong>ローカル</strong> |

### 注目：完全学習シナリオ
<strong>学習章に対応する本番対応アプリケーションテンプレート</strong>

| テンプレート | 学習章 | 難易度 | 主要学習内容 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | 基本的なAI展開パターン |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | Azure AI Searchを用いたRAG実装 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 第4章 | ⭐⭐ | ドキュメントインテリジェンス統合 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | エージェントフレームワークと関数呼び出し |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐ | エンタープライズAIオーケストレーション |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | CustomerとInventoryエージェントによるマルチエージェントアーキテクチャ |

### タイプ別学習例

> **📌 ローカル例と外部例の違い：**  
> <strong>ローカル例</strong>（本リポジトリ内）＝即使用可能  
> <strong>外部例</strong>（Azure Samples）＝リンク先リポジトリからクローン

#### ローカル例（すぐに使える）
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARMテンプレート付きの完全本番対応実装
  - マルチエージェントアーキテクチャ（Customer + Inventoryエージェント）
  - 包括的な監視と評価
  - ARMテンプレートによるワンクリック展開

#### ローカル例 - コンテナアプリケーション（第2～5章）
**本リポジトリ内の包括的なコンテナ展開例：**

- [**Container App Examples**](examples/container-app/README.md) - コンテナ化されたデプロイメントの完全ガイド
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - スケール・トゥ・ゼロを使った基本的なREST API
  - [Microservices Architecture](../../examples/container-app/microservices) - 本番環境対応のマルチサービスデプロイメント
  - クイックスタート、本番環境、応用的なデプロイパターン
  - 監視、セキュリティ、コスト最適化のガイダンス

#### 外部例 - シンプルアプリケーション（第1〜2章）
**これらの Azure Samples リポジトリをクローンして開始してください：**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本的なデプロイパターン
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 静的コンテンツのデプロイ
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API のデプロイ

#### 外部例 - データベース統合（第3〜4章）  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - データベース接続パターン
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - サーバーレスデータワークフロー

#### 外部例 - 応用パターン（第4〜8章）
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - マルチサービスアーキテクチャ
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - バックグラウンド処理  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - 本番環境対応のMLパターン

### 外部テンプレートコレクション
- [**公式AZDテンプレートギャラリー**](https://azure.github.io/awesome-azd/) - 公式およびコミュニティのテンプレートを厳選したコレクション
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn のテンプレートドキュメント
- [**Examples Directory**](examples/README.md) - 詳細な解説付きのローカル学習用例

---

## 📚 学習リソースと参考資料

### クイックリファレンス
- [<strong>コマンドチートシート</strong>](resources/cheat-sheet.md) - 章ごとに整理された必須 azd コマンド
- [<strong>用語集</strong>](resources/glossary.md) - Azure と azd の用語解説  
- [**FAQ**](resources/faq.md) - 学習章ごとによくある質問
- [<strong>学習ガイド</strong>](resources/study-guide.md) - 総合的な実践問題集

### ハンズオンワークショップ
- [**AIワークショップラボ**](docs/chapter-02-ai-development/ai-workshop-lab.md) - AIソリューションをAZDでデプロイ可能に（2-3時間）
- [<strong>インタラクティブワークショップ</strong>](workshop/README.md) - MkDocsとGitHub Codespacesを使った8モジュールのガイド付き演習
  - 流れ：導入 → 選択 → 検証 → 分解 → 設定 → カスタマイズ → 解体 → 総括

### 外部学習リソース
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### 編集用 AI エージェントスキル
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI、Foundry、デプロイ、診断、コスト最適化などの37のオープンエージェントスキル。GitHub Copilot、Cursor、Claude Code、または対応エージェントにインストール可能：
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 クイックトラブルシューティングガイド

**初心者がよく直面する問題と即時解決法：**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

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
</details>

<details>
<summary><strong>❌ "No subscription found" または "Subscription not set"</strong></summary>

```bash
# 利用可能なサブスクリプションを一覧表示
az account list --output table

# デフォルトのサブスクリプションを設定
az account set --subscription "<subscription-id-or-name>"

# AZD環境に設定
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# 確認
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
# オプション 1: クリーンして再試行する
azd down --force --purge
azd up

# オプション 2: インフラストラクチャのみ修正する
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
# AZDの再認証
azd auth logout
azd auth login

# オプション: azコマンドを実行している場合はAzure CLIもリフレッシュします
az logout
az login

# 認証を確認する
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" または 名前の競合</strong></summary>

```bash
# AZDは一意の名前を生成しますが、競合が発生した場合:
azd down --force --purge

# その場合は新しい環境で再試行します
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ テンプレートの展開が長すぎる</strong></summary>

**通常の待ち時間：**
- シンプルなウェブアプリ：5〜10分
- データベース付きアプリ：10〜15分
- AIアプリケーション：15〜25分（OpenAIのプロビジョニングが遅い）

```bash
# 進捗を確認してください
azd show

# 30分以上停止している場合は、Azureポータルを確認してください：
azd monitor --overview
# 失敗したデプロイメントを探してください
```
</details>

<details>
<summary><strong>❌ "Permission denied" または "Forbidden"</strong></summary>

```bash
# Azureのロールを確認してください
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 最低でも「Contributor」ロールが必要です
# Azure管理者に以下の権限を付与するよう依頼してください：
# - Contributor（リソース用）
# - User Access Administrator（ロール割り当て用）
```
</details>

<details>
<summary><strong>❌ 展開されたアプリのURLが見つからない</strong></summary>

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

### 📚 完全なトラブルシューティングリソース

- **共通問題ガイド:** [詳細な解決策](docs/chapter-07-troubleshooting/common-issues.md)
- **AI特有の問題:** [AIトラブルシューティング](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **デバッグガイド:** [ステップバイステップデバッグ](docs/chapter-07-troubleshooting/debugging.md)
- **ヘルプを得る:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 コース完了と認定

### 進捗管理
各章の学習進捗を追跡しましょう：

- [ ] **第1章**：基礎とクイックスタート ✅
- [ ] **第2章**：AIファースト開発 ✅  
- [ ] **第3章**：設定と認証 ✅
- [ ] **第4章**：コードとしてのインフラ＆デプロイ ✅
- [ ] **第5章**：マルチエージェントAIソリューション ✅
- [ ] **第6章**：事前デプロイ検証と計画 ✅
- [ ] **第7章**：トラブルシューティングとデバッグ ✅
- [ ] **第8章**：本番環境とエンタープライズパターン ✅

### 学習の確認
各章を完了したら、次を行って知識を確認します：
1. <strong>実践演習</strong>：章のハンズオンデプロイを完了する
2. <strong>知識チェック</strong>：章のFAQセクションを見直す
3. <strong>コミュニティで議論</strong>：Azure Discordで経験を共有する
4. <strong>次の章へ</strong>：次の難易度レベルに進む

### コース完了のメリット
全ての章を修了すると、以下を獲得できます：
- <strong>本番経験</strong>：実際にAIアプリケーションをAzureにデプロイ
- <strong>専門的スキル</strong>：エンタープライズ対応のデプロイ能力  
- <strong>コミュニティからの認知</strong>：Azure開発者コミュニティの活発なメンバー
- <strong>キャリアアップ</strong>：需要のあるAZDとAIデプロイの専門知識

---

## 🤝 コミュニティとサポート

### ヘルプとサポートを得る
- <strong>技術的問題</strong>：[バグ報告と機能リクエスト](https://github.com/microsoft/azd-for-beginners/issues)
- <strong>学習に関する質問</strong>：[Microsoft Azure Discordコミュニティ](https://discord.gg/microsoft-azure) と [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI特有のヘルプ**：[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) に参加
- <strong>ドキュメント</strong>：[公式Azure Developer CLIドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discordからのコミュニティインサイト

**#Azure チャンネルの最近の投票結果：**
- **45%** の開発者がAIワークロードにAZDを使いたいと回答
- <strong>主な課題</strong>：マルチサービスデプロイ、資格情報管理、本番環境対応  
- <strong>最も要望の多いもの</strong>：AI特化テンプレート、トラブルシューティングガイド、ベストプラクティス

**コミュニティに参加して：**
- AZD + AI の経験を共有し、支援を得る
- 新しいAIテンプレートの早期プレビューにアクセス
- AIデプロイのベストプラクティスに貢献
- 未来のAI + AZD機能開発に影響を与える

### コースへの貢献
貢献を歓迎します！詳しくは [Contributing Guide](CONTRIBUTING.md) をお読みください：
- <strong>コンテンツの改善</strong>：既存の章や例を強化
- <strong>新しい例</strong>：実世界のシナリオやテンプレートを追加  
- <strong>翻訳</strong>：多言語サポートの維持を支援
- <strong>バグ報告</strong>：正確性と明瞭性の向上
- <strong>コミュニティ標準</strong>：包括的なコミュニティガイドラインに従う

---

## 📄 コース情報

### ライセンス
本プロジェクトはMITライセンスのもとで提供されています。詳細は[LICENSE](../../LICENSE)ファイルをご覧ください。

### 関連Microsoft学習リソース

当チームは他にも包括的な学習コースを提供しています：

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### 生成AIシリーズ
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

[![生成AI（JavaScript）](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### コアラーニング
[![初心者のためのML](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![初心者のためのデータサイエンス](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![初心者のためのAI](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![初心者のためのサイバーセキュリティ](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![初心者のためのウェブ開発](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![初心者のためのIoT](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![初心者のためのXR開発](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot シリーズ
[![AIペアプログラミング用Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET用Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ コースナビゲーション

**🚀 学び始める準備はできましたか？**

<strong>初心者</strong>: [Chapter 1: Foundation & Quick Start](#-chapter-1-foundation--quick-start) から始めましょう  
**AI開発者**: [Chapter 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) にジャンプ  
<strong>経験豊富な開発者</strong>: [Chapter 3: Configuration & Authentication](#️-chapter-3-configuration--authentication) から始めましょう

<strong>次のステップ</strong>: [Chapter 1 - AZD Basics](docs/chapter-01-foundation/azd-basics.md) を始める →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->