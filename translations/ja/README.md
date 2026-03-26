# 初心者向けAZD：体系的な学習の旅

![初心者向けAZD](../../translated_images/ja/azdbeginners.5527441dd9f74068.webp) 

[![GitHub のウォッチャー](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub のフォーク](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub のスター](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure の Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry の Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 自動翻訳（常に最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[アラビア語](../ar/README.md) | [ベンガル語](../bn/README.md) | [ブルガリア語](../bg/README.md) | [ビルマ語（ミャンマー）](../my/README.md) | [中国語（簡体字）](../zh-CN/README.md) | [中国語（繁体字、香港）](../zh-HK/README.md) | [中国語（繁体字、マカオ）](../zh-MO/README.md) | [中国語（繁体字、台湾）](../zh-TW/README.md) | [クロアチア語](../hr/README.md) | [チェコ語](../cs/README.md) | [デンマーク語](../da/README.md) | [オランダ語](../nl/README.md) | [エストニア語](../et/README.md) | [フィンランド語](../fi/README.md) | [フランス語](../fr/README.md) | [ドイツ語](../de/README.md) | [ギリシャ語](../el/README.md) | [ヘブライ語](../he/README.md) | [ヒンディー語](../hi/README.md) | [ハンガリー語](../hu/README.md) | [インドネシア語](../id/README.md) | [イタリア語](../it/README.md) | [日本語](./README.md) | [カンナダ語](../kn/README.md) | [韓国語](../ko/README.md) | [リトアニア語](../lt/README.md) | [マレー語](../ms/README.md) | [マラヤーラム語](../ml/README.md) | [マラーティー語](../mr/README.md) | [ネパール語](../ne/README.md) | [ナイジェリア・ピジン](../pcm/README.md) | [ノルウェー語](../no/README.md) | [ペルシア語（ファールシー）](../fa/README.md) | [ポーランド語](../pl/README.md) | [ポルトガル語（ブラジル）](../pt-BR/README.md) | [ポルトガル語（ポルトガル）](../pt-PT/README.md) | [パンジャブ語（グルムキー）](../pa/README.md) | [ルーマニア語](../ro/README.md) | [ロシア語](../ru/README.md) | [セルビア語（キリル）](../sr/README.md) | [スロバキア語](../sk/README.md) | [スロベニア語](../sl/README.md) | [スペイン語](../es/README.md) | [スワヒリ語](../sw/README.md) | [スウェーデン語](../sv/README.md) | [タガログ語（フィリピン）](../tl/README.md) | [タミル語](../ta/README.md) | [テルグ語](../te/README.md) | [タイ語](../th/README.md) | [トルコ語](../tr/README.md) | [ウクライナ語](../uk/README.md) | [ウルドゥー語](../ur/README.md) | [ベトナム語](../vi/README.md)

> **ローカルにクローンしますか？**
>
> このリポジトリには50以上の言語翻訳が含まれており、ダウンロードサイズが大幅に増加します。翻訳なしでクローンするには、スパースチェックアウトを使用してください:
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
> これにより、より高速なダウンロードでコースを完了するのに必要なすべてが得られます。
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 azd の最新情報

Azure Developer CLI は従来の Web アプリや API を超えて成長しました。現在、azd は AI を活用したアプリケーションやインテリジェントエージェントを含む、あらゆるアプリケーションを Azure にデプロイするための単一ツールです。

これはあなたにとって次のことを意味します:

- **AI エージェントは now azd の第一級ワークロードです。** 既に知っている `azd init` → `azd up` ワークフローを使って、AI エージェントプロジェクトを初期化、デプロイ、管理できます。
- **Microsoft Foundry 統合** により、モデルのデプロイ、エージェントホスティング、AI サービスの構成が azd テンプレートエコシステムに直接組み込まれます。
- **コアのワークフローは変わっていません。** Todo アプリ、マイクロサービス、またはマルチエージェント AI ソリューションをデプロイする場合でも、コマンドは同じです。

以前に azd を使ったことがあるなら、AI サポートは自然な拡張機能です — 別のツールや上級トラックではありません。もし新しく始めるなら、すべてに対応する一つのワークフローを学びます。

---

## 🚀 Azure Developer CLI (azd) とは？

**Azure Developer CLI (azd)** は、アプリケーションを Azure にデプロイする作業を簡単にする開発者向けのコマンドラインツールです。多数の Azure リソースを手動で作成・接続する代わりに、単一のコマンドでアプリケーション全体をデプロイできます。

### `azd up` の魔法

```bash
# この単一のコマンドで全てを行います：
# ✅ すべてのAzureリソースを作成します
# ✅ ネットワークとセキュリティを構成します
# ✅ アプリケーションコードをビルドします
# ✅ Azureにデプロイします
# ✅ 動作するURLを提供します
azd up
```

**これだけです！** Azure ポータルをクリックする必要も、複雑な ARM テンプレートを最初に学ぶ必要も、手動設定も不要 — ただ Azure 上で動作するアプリケーションができます。

---

## ❓ Azure Developer CLI と Azure CLI：何が違うのか？

これは初心者が最もよく尋ねる質問です。ここに簡単な答えがあります:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Purpose** | 個々の Azure リソースを管理する | アプリケーション全体をデプロイする |
| **Mindset** | インフラ志向 | アプリケーション志向 |
| **Example** | `az webapp create --name myapp...` | `azd up` |
| **Learning Curve** | Azure サービスを知っている必要がある | アプリだけ知っていればよい |
| **Best For** | DevOps、インフラ | 開発者、プロトタイピング |

### 単純な例え

- **Azure CLI** は家を建てるためのすべての工具（ハンマー、ノコギリ、釘）を持っているようなものです。何でも作れますが、建築を知っている必要があります。
- **Azure Developer CLI** は請負業者を雇うようなものです — あなたが望むことを説明すれば、彼らが建設を引き受けます。

### それぞれを使うべき時

| Scenario | Use This |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### 両方を併用できます！

AZD は内部で Azure CLI を使用します。両方を使用することができます:
```bash
# AZDでアプリをデプロイする
azd up

# 次に、Azure CLIで特定のリソースを微調整する
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD でテンプレートを見つける

最初から始めないでください！**Awesome AZD** はワンクリックでデプロイできるテンプレートのコミュニティコレクションです:

| Resource | Description |
|----------|-------------|
| 🔗 [**Awesome AZD ギャラリー**](https://azure.github.io/awesome-azd/) | 200以上のテンプレートを1クリックでデプロイして閲覧できます |
| 🔗 [<strong>テンプレートを提出する</strong>](https://github.com/Azure/awesome-azd/issues) | コミュニティにテンプレートを提供してください |
| 🔗 [**GitHub リポジトリ**](https://github.com/Azure/awesome-azd) | スターを付けてソースを探索しましょう |

### Awesome AZD の人気 AI テンプレート

```bash
# Microsoft Foundry モデルと AI 検索を使った RAG チャット
azd init --template azure-search-openai-demo

# クイック AI チャットアプリケーション
azd init --template openai-chat-app-quickstart

# Foundry エージェントを使った AI エージェント
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
# テンプレートから初期化
azd init --template todo-nodejs-mongo

# Azureにデプロイ（すべて作成します！）
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

このコースは <strong>段階的学習</strong> を目的としています — 自分に合ったところから始めて、順に学んでいきましょう:

| Your Experience | Start Here |
|-----------------|------------|
| **Azure が初めて** | [第1章: 基礎](#-chapter-1-foundation--quick-start) |
| **Azure は知っているが AZD は初めて** | [第1章: 基礎](#-chapter-1-foundation--quick-start) |
| **AI アプリをデプロイしたい** | [第2章: AI優先の開発](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| <strong>実践で学びたい</strong> | [🎓 インタラクティブ・ワークショップ](workshop/README.md) - 3〜4時間のガイド付きラボ |
| <strong>本番環境パターンが必要</strong> | [第8章: 本番 & エンタープライズ](#-chapter-8-production--enterprise-patterns) |

### クイックセットアップ

1. <strong>このリポジトリをフォークする</strong>: [![GitHub のフォーク](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. <strong>クローンする</strong>: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. <strong>ヘルプを得る</strong>: [Azure Discord コミュニティ](https://discord.com/invite/ByRwuEEgH4)

> **ローカルにクローンしますか？**

> このリポジトリには50以上の言語翻訳が含まれており、ダウンロードサイズが大幅に増加します。翻訳なしでクローンするには、スパースチェックアウトを使用してください:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> これにより、より高速なダウンロードでコースを完了するのに必要なすべてが得られます。


## コース概要

段階的な章で構成された学習を通して Azure Developer CLI (azd) をマスターしましょう。**Microsoft Foundry 統合による AI アプリケーションのデプロイに特化しています。**

### なぜこのコースが現代の開発者に必要なのか

Microsoft Foundry Discord コミュニティの洞察に基づくと、<strong>開発者の45%が AI ワークロードに AZD を使いたい</strong>と考えていますが、次のような課題に直面しています:
- 複雑なマルチサービスの AI アーキテクチャ
- 本番環境での AI デプロイのベストプラクティス  
- Azure AI サービスの統合と設定
- AI ワークロードのコスト最適化
- AI 固有のデプロイ問題のトラブルシューティング

### 学習目標

この体系的なコースを修了することで、あなたは以下を達成できます:
- **AZD の基礎を習得する**: コア概念、インストール、構成
- **AI アプリケーションをデプロイする**: AZD を Microsoft Foundry サービスと共に使用
- **Infrastructure as Code を実装する**: Bicep テンプレートで Azure リソースを管理
- <strong>デプロイのトラブルシューティング</strong>: 一般的な問題を解決しデバッグする
- <strong>本番最適化</strong>: セキュリティ、スケーリング、監視、コスト管理
- <strong>マルチエージェントソリューションを構築する</strong>: 複雑な AI アーキテクチャをデプロイ

## 🗺️ コースマップ：章別クイックナビゲーション

各章には学習目標、クイックスタート、演習を含む専用の README があります:

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[第1章: 基礎](docs/chapter-01-foundation/README.md)** | はじめに | [AZD 基本](docs/chapter-01-foundation/azd-basics.md) &#124; [インストール](docs/chapter-01-foundation/installation.md) &#124; [最初のプロジェクト](docs/chapter-01-foundation/first-project.md) | 30-45 分 | ⭐ |
| **[第2章: AI開発](docs/chapter-02-ai-development/README.md)** | AI優先アプリ | [Foundry 統合](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AIエージェント](docs/chapter-02-ai-development/agents.md) &#124; [モデルデプロイ](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [ワークショップ](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 時間 | ⭐⭐ |
| **[第3章: 構成](docs/chapter-03-configuration/README.md)** | 認証とセキュリティ | [構成](docs/chapter-03-configuration/configuration.md) &#124; [認証とセキュリティ](docs/chapter-03-configuration/authsecurity.md) | 45-60 分 | ⭐⭐ |
| **[第4章: インフラ](docs/chapter-04-infrastructure/README.md)** | IaC とデプロイ | [デプロイ ガイド](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [プロビジョニング](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 時間 | ⭐⭐⭐ |
| **[第5章: マルチエージェント](docs/chapter-05-multi-agent/README.md)** | AIエージェントソリューション | [小売シナリオ](examples/retail-scenario.md) &#124; [調整パターン](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 時間 | ⭐⭐⭐⭐ |
| **[第6章: 展開前](docs/chapter-06-pre-deployment/README.md)** | 計画と検証 | [事前チェック](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [容量計画](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU選定](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [アプリケーション インサイト](docs/chapter-06-pre-deployment/application-insights.md) | 1 時間 | ⭐⭐ |
| **[第7章: トラブルシューティング](docs/chapter-07-troubleshooting/README.md)** | デバッグと修正 | [よくある問題](docs/chapter-07-troubleshooting/common-issues.md) &#124; [デバッグ](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI の問題](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 時間 | ⭐⭐ |
| **[第8章: 本番](docs/chapter-08-production/README.md)** | エンタープライズパターン | [本番運用のプラクティス](docs/chapter-08-production/production-ai-practices.md) | 2-3 時間 | ⭐⭐⭐⭐ |
| **[🎓 ワークショップ](workshop/README.md)** | 実践ラボ | [導入](workshop/docs/instructions/0-Introduction.md) &#124; [選択](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [検証](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [分解](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [構成](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [カスタマイズ](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [インフラの撤去](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [まとめ](workshop/docs/instructions/7-Wrap-up.md) | 3-4 時間 | ⭐⭐ |

**合計コース時間:** ~10-14 時間 | **スキルの進行:** 初心者 → 本番対応

---

## 📚 学習章

<em>経験レベルと目標に基づいて学習パスを選択してください</em>

### 🚀 第1章: 基礎とクイックスタート
<strong>前提条件</strong>: Azure サブスクリプション、基本的なコマンドラインの知識  
<strong>所要時間</strong>: 30-45 分  
<strong>難易度</strong>: ⭐

#### 学ぶこと
- Azure Developer CLI の基本を理解する
- お使いのプラットフォームに AZD をインストールする
- 最初のデプロイを成功させる

#### 学習リソース
- **🎯 ここから開始**: [Azure Developer CLI とは何か？](#what-is-azure-developer-cli)
- **📖 理論**: [AZD 基礎](docs/chapter-01-foundation/azd-basics.md) - 基本概念と用語
- **⚙️ セットアップ**: [インストールと設定](docs/chapter-01-foundation/installation.md) - プラットフォーム別ガイド
- **🛠️ 実践**: [最初のプロジェクト](docs/chapter-01-foundation/first-project.md) - ステップバイステップのチュートリアル
- **📋 クイックリファレンス**: [コマンド チートシート](resources/cheat-sheet.md)

#### 実践演習
```bash
# インストールの簡易確認
azd version

# 最初のアプリケーションをデプロイする
azd init --template todo-nodejs-mongo
azd up
```

**💡 章の成果**: AZD を使用してシンプルなウェブアプリケーションを Azure に正常にデプロイする

**✅ 成功の検証:**
```bash
# 第1章を完了すると、次のことができるようになります:
azd version              # インストール済みのバージョンを表示します
azd init --template todo-nodejs-mongo  # プロジェクトを初期化します
azd up                  # Azure にデプロイします
azd show                # 実行中のアプリのURLを表示します
# アプリケーションがブラウザで開いて動作します
azd down --force --purge  # リソースをクリーンアップします
```

**📊 所要時間:** 30-45 分  
**📈 習得後のスキルレベル:** 基本的なアプリケーションを独立してデプロイできる
**📈 習得後のスキルレベル:** 基本的なアプリケーションを独立してデプロイできる

---

### 🤖 第2章: AIファースト開発（AI開発者向け推奨）
<strong>前提条件</strong>: 第1章を修了済み  
<strong>所要時間</strong>: 1-2 時間  
<strong>難易度</strong>: ⭐⭐

#### 学ぶこと
- AZD と Microsoft Foundry の統合
- AI 搭載アプリケーションのデプロイ
- AI サービス構成の理解

#### 学習リソース
- **🎯 ここから開始**: [Microsoft Foundry 統合](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AIエージェント**: [AIエージェント ガイド](docs/chapter-02-ai-development/agents.md) - AZD を使ってインテリジェントなエージェントをデプロイする
- **📖 パターン**: [AIモデルのデプロイ](docs/chapter-02-ai-development/ai-model-deployment.md) - AIモデルをデプロイおよび管理する
- **🛠️ ワークショップ**: [AI ワークショップ ラボ](docs/chapter-02-ai-development/ai-workshop-lab.md) - AIソリューションを AZD 対応にする
- **🎥 インタラクティブガイド**: [ワークショップ資料](workshop/README.md) - ブラウザベースの学習（MkDocs * DevContainer 環境）
- **📋 テンプレート**: [Microsoft Foundry テンプレート](#workshop-resources)
- **📝 例**: [AZD デプロイの例](examples/README.md)

#### 実践演習
```bash
# 最初のAIアプリケーションをデプロイする
azd init --template azure-search-openai-demo
azd up

# 追加のAIテンプレートを試す
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 章の成果**: RAG 機能を持つ AI 搭載チャットアプリケーションをデプロイおよび構成する

**✅ 成功の検証:**
```bash
# 第2章を終えたら、次のことができるようになります:
azd init --template azure-search-openai-demo
azd up
# AIチャットインターフェイスをテストする
# 質問をして、出典付きのAIによる応答を得る
# 検索統合が機能することを確認する
azd monitor  # Application Insightsがテレメトリを表示していることを確認する
azd down --force --purge
```

**📊 所要時間:** 1-2 時間  
**📈 習得後のスキルレベル:** 本番対応の AI アプリケーションをデプロイおよび構成できる  
**💰 コスト認識:** 開発は $80-150/月、プロダクションは $300-3500/月の目安を把握する

#### 💰 AI 展開のコスト考慮事項

**開発環境（推定 $80-150/月）:**
- Microsoft Foundry Models (従量課金): $0-50/月（トークン使用量に基づく）
- AI Search (Basic プラン): $75/月
- Container Apps (Consumption): $0-20/月
- Storage (Standard): $1-5/月

**本番環境（推定 $300-3,500+/月）:**
- Microsoft Foundry Models (一貫したパフォーマンスのための PTU): $3,000+/月 または 高トラフィック時の従量課金
- AI Search (Standard プラン): $250/月
- Container Apps (Dedicated): $50-100/月
- Application Insights: $5-50/月
- Storage (Premium): $10-50/月

**💡 コスト最適化のヒント:**
- 学習には **Free Tier** の Microsoft Foundry Models を使用する（Azure OpenAI の 50,000 トークン/月 が含まれる）
- 開発していないときはリソースを解放するために `azd down` を実行する
- まず従量課金で開始し、本番でのみ PTU にアップグレードする
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

### ⚙️ 第3章: 構成と認証
<strong>前提条件</strong>: 第1章を修了済み  
<strong>所要時間</strong>: 45-60 分  
<strong>難易度</strong>: ⭐⭐

#### 学ぶこと
- 環境設定と管理
- 認証とセキュリティのベストプラクティス
- リソースの命名と整理

#### 学習リソース
- **📖 構成**: [構成ガイド](docs/chapter-03-configuration/configuration.md) - 環境のセットアップ
- **🔐 セキュリティ**: [認証パターンとマネージドID](docs/chapter-03-configuration/authsecurity.md) - 認証パターン
- **📝 例**: [データベースアプリの例](examples/database-app/README.md) - AZD データベースの例

#### 実践演習
- 複数の環境を構成する（dev、staging、prod）
- マネージドID認証を設定する
- 環境別の設定を実装する

**💡 章の成果**: 適切な認証とセキュリティで複数の環境を管理する

---

### 🏗️ 第4章: Infrastructure as Code（IaC）とデプロイ
<strong>前提条件</strong>: 第1〜3章を修了済み  
<strong>所要時間</strong>: 1-1.5 時間  
<strong>難易度</strong>: ⭐⭐⭐

#### 学ぶこと
- 高度なデプロイパターン
- Bicep を使った Infrastructure as Code
- リソースのプロビジョニング戦略

#### 学習リソース
- **📖 デプロイ**: [デプロイ ガイド](docs/chapter-04-infrastructure/deployment-guide.md) - 完全なワークフロー
- **🏗️ プロビジョニング**: [リソースのプロビジョニング](docs/chapter-04-infrastructure/provisioning.md) - Azure のリソース管理
- **📝 例**: [コンテナアプリの例](../../examples/container-app) - コンテナ化されたデプロイ

#### 実践演習
- カスタム Bicep テンプレートを作成する
- マルチサービスアプリケーションをデプロイする
- ブルーグリーンデプロイ戦略を実装する

**💡 章の成果**: カスタムインフラテンプレートを使用して複雑なマルチサービスアプリケーションをデプロイする

---

### 🎯 第5章: マルチエージェントAIソリューション（上級）
<strong>前提条件</strong>: 第1〜2章を修了済み  
<strong>所要時間</strong>: 2-3 時間  
<strong>難易度</strong>: ⭐⭐⭐⭐

#### 学ぶこと
- マルチエージェントのアーキテクチャパターン
- エージェントのオーケストレーションと調整
- 本番対応の AI デプロイ

#### 学習リソース
- **🤖 注目プロジェクト**: [小売向けマルチエージェントソリューション](examples/retail-scenario.md) - 完全な実装
- **🛠️ ARM テンプレート**: [ARM テンプレートパッケージ](../../examples/retail-multiagent-arm-template) - ワンクリックデプロイ
- **📖 アーキテクチャ**: [マルチエージェントの調整パターン](docs/chapter-06-pre-deployment/coordination-patterns.md) - パターン

#### 実践演習
```bash
# 完全な小売向けマルチエージェントソリューションを展開する
cd examples/retail-multiagent-arm-template
./deploy.sh

# エージェントの構成を調べる
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 章の成果**: カスタマーおよびインベントリエージェントを備えた本番対応のマルチエージェントAIソリューションをデプロイおよび管理する

---

### 🔍 第6章: 展開前の検証と計画
<strong>前提条件</strong>: 第4章を修了済み  
<strong>所要時間</strong>: 1 時間  
<strong>難易度</strong>: ⭐⭐

#### 学ぶこと
- 容量計画とリソース検証
- SKU 選定戦略
- 事前チェックと自動化

#### 学習リソース
- **📊 計画**: [容量計画](docs/chapter-06-pre-deployment/capacity-planning.md) - リソース検証
- **💰 選定**: [SKU 選定](docs/chapter-06-pre-deployment/sku-selection.md) - コスト効率の良い選択
- **✅ 検証**: [事前チェック](docs/chapter-06-pre-deployment/preflight-checks.md) - 自動化スクリプト

#### 実践演習
- 容量検証スクリプトを実行する
- コストのために SKU 選定を最適化する
- 自動化された展開前チェックを実装する

**💡 章の成果**: 実行前にデプロイを検証および最適化する

---

### 🚨 第7章: トラブルシューティングとデバッグ
<strong>前提条件</strong>: いずれかのデプロイ章を修了済み  
<strong>所要時間</strong>: 1-1.5 時間  
<strong>難易度</strong>: ⭐⭐

#### 学ぶこと
- 体系的なデバッグ手法
- 一般的な問題と解決策
- AI 固有のトラブルシューティング

#### 学習リソース
- **🔧 よくある問題**: [よくある問題](docs/chapter-07-troubleshooting/common-issues.md) - FAQ と解決策
- **🕵️ デバッグ**: [デバッグガイド](docs/chapter-07-troubleshooting/debugging.md) - ステップバイステップの戦略
- **🤖 AI の問題**: [AI 固有のトラブルシューティング](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI サービスの問題

#### 実践演習
- デプロイ失敗を診断する
- 認証の問題を解決する
- AI サービスの接続性をデバッグする

**💡 章の成果**: 一人で一般的なデプロイの問題を診断・解決できる

---

### 🏢 第8章: 本番とエンタープライズパターン
<strong>前提条件</strong>: 第1〜4章を修了済み  
<strong>所要時間</strong>: 2-3 時間  
<strong>難易度</strong>: ⭐⭐⭐⭐

#### 学ぶこと
- 本番デプロイ戦略
- エンタープライズ向けセキュリティパターン
- 監視とコスト最適化

#### 学習リソース
- **🏭 Production**: [本番向け AI ベストプラクティス](docs/chapter-08-production/production-ai-practices.md) - Enterprise patterns
- **📝 Examples**: [マイクロサービスの例](../../examples/microservices) - Complex architectures
- **📊 Monitoring**: [Application Insights 統合](docs/chapter-06-pre-deployment/application-insights.md) - Monitoring

#### Practical Exercises
- 企業向けセキュリティパターンを実装する
- 包括的な監視を設定する
- 適切なガバナンスで本番にデプロイする

**💡 Chapter Outcome**: フルプロダクション機能を備えたエンタープライズ対応アプリケーションをデプロイする

---

## 🎓 Workshop Overview: Hands-On Learning Experience

> **⚠️ WORKSHOP STATUS: Active Development**  
> ワークショップ資料は現在開発および調整中です。コアモジュールは機能していますが、一部の高度なセクションは未完成です。すべてのコンテンツを完成させるために積極的に作業しています。[進捗を追跡 →](workshop/README.md)

### Interactive Workshop Materials
<strong>ブラウザベースのツールとガイド付き演習による包括的な実践学習</strong>

当ワークショップ資料は、上記の章ベースのカリキュラムを補完する構造化されたインタラクティブな学習体験を提供します。ワークショップは自己学習とインストラクター主導のセッションの両方を想定して設計されています。

#### 🛠️ Workshop Features
- **Browser-Based Interface**: 検索、コピー、テーマ機能を備えた MkDocs ベースの完全なワークショップ
- **GitHub Codespaces Integration**: ワンクリックで開発環境をセットアップ
- **Structured Learning Path**: 8 モジュールのガイド付き演習（合計 3-4 時間）
- **Progressive Methodology**: 導入 → 選択 → 検証 → 分解 → 構成 → カスタマイズ → 解体 → 総括
- **Interactive DevContainer Environment**: 事前構成されたツールと依存関係

#### 📚 Workshop Module Structure
ワークショップは、探索からデプロイの習熟まで導く「8 モジュールの漸進的手法」に従います：

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Introduction** | ワークショップの概要 | 学習目標、前提条件、ワークショップ構成を理解する | 15分 |
| **1. Selection** | テンプレートの発見 | AZD テンプレートを探索し、シナリオに適した AI テンプレートを選択する | 20分 |
| **2. Validation** | デプロイ & 検証 | テンプレートを `azd up` でデプロイし、インフラが機能することを確認する | 30分 |
| **3. Deconstruction** | 構造を理解する | GitHub Copilot を使用してテンプレートのアーキテクチャ、Bicep ファイル、およびコード構成を調査する | 30分 |
| **4. Configuration** | azure.yaml の詳細 | `azure.yaml` の設定、ライフサイクルフック、および環境変数を習得する | 30分 |
| **5. Customization** | 自分用にする | AI Search、トレーシング、評価を有効にし、シナリオに合わせてカスタマイズする | 45分 |
| **6. Teardown** | クリーンアップ | `azd down --purge` で安全にリソースを削除する | 15分 |
| **7. Wrap-up** | 次のステップ | 達成事項、重要概念を振り返り学習を継続する | 15分 |

**Workshop Flow:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Getting Started with the Workshop
```bash
# オプション1: GitHub Codespaces（推奨）
# リポジトリで "Code" → "Create codespace on main" をクリックしてください

# オプション2: ローカル開発
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md のセットアップ手順に従ってください
```

#### 🎯 Workshop Learning Outcomes
By completing the workshop, participants will:
- **Deploy Production AI Applications**: Microsoft Foundry サービスと AZD を使用して本番向けの AI アプリケーションをデプロイする
- **Master Multi-Agent Architectures**: 協調する AI エージェントソリューションを実装する
- **Implement Security Best Practices**: 認証とアクセス制御を構成する
- **Optimize for Scale**: コスト効率が高く高パフォーマンスなデプロイを設計する
- **Troubleshoot Deployments**: 一般的な問題を自力で解決する

#### 📖 Workshop Resources
- **🎥 Interactive Guide**: [ワークショップ資料](workshop/README.md) - ブラウザベースの学習環境
- **📋 Module-by-Module Instructions**:
  - [0. 導入](workshop/docs/instructions/0-Introduction.md) - ワークショップの概要と目的
  - [1. 選択](workshop/docs/instructions/1-Select-AI-Template.md) - AI テンプレートの検索と選択
  - [2. 検証](workshop/docs/instructions/2-Validate-AI-Template.md) - テンプレートのデプロイと検証
  - [3. 分解](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - テンプレートのアーキテクチャを調査する
  - [4. 構成](workshop/docs/instructions/4-Configure-AI-Template.md) - `azure.yaml` を習得する
  - [5. カスタマイズ](workshop/docs/instructions/5-Customize-AI-Template.md) - シナリオに合わせてカスタマイズする
  - [6. クリーンアップ](workshop/docs/instructions/6-Teardown-Infrastructure.md) - リソースをクリーンアップする
  - [7. まとめ](workshop/docs/instructions/7-Wrap-up.md) - 振り返りと次のステップ
- **🛠️ AI Workshop Lab**: [AI ワークショップ ラボ](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI に焦点を当てた演習
- **💡 Quick Start**: [ワークショップセットアップガイド](workshop/README.md#quick-start) - 環境構成

**Perfect for**: 企業研修、大学の講義、自己学習、開発者ブートキャンプ。

---

## 📖 Deep Dive: AZD Capabilities

基本を超えて、AZD は本番デプロイのための強力な機能を提供します：

- **Template-based deployments** - 共通のアプリケーションパターン向けに事前構築されたテンプレートを使用する
- **Infrastructure as Code** - Bicep または Terraform を使用して Azure リソースを管理する  
- **Integrated workflows** - アプリケーションをシームレスにプロビジョニング、デプロイ、監視する
- **Developer-friendly** - 開発者の生産性と体験を最適化する

### **AZD + Microsoft Foundry: Perfect for AI Deployments**

**Why AZD for AI Solutions?** AZD は AI 開発者が直面する主要な課題に対応します：

- **AI-Ready Templates** - Microsoft Foundry Models、Cognitive Services、ML ワークロード向けの事前構成テンプレート
- **Secure AI Deployments** - AI サービス、API キー、モデルエンドポイント向けの組み込みセキュリティパターン  
- **Production AI Patterns** - スケーラブルでコスト効率の高い AI アプリケーションデプロイのベストプラクティス
- **End-to-End AI Workflows** - モデル開発から本番デプロイまでのエンドツーエンドワークフローと適切な監視
- **Cost Optimization** - AI ワークロード向けのスマートなリソース割り当てとスケーリング戦略
- **Microsoft Foundry Integration** - Microsoft Foundry のモデルカタログとエンドポイントへのシームレスな接続

---

## 🎯 Templates & Examples Library

### Featured: Microsoft Foundry Templates
**AI アプリケーションをデプロイする場合はここから始めてください！**

> **注:** これらのテンプレートはさまざまな AI パターンを示しています。いくつかは外部の Azure Samples、他はいくつかはローカル実装です。

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**AI チャットの始め方**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | 外部 |
| [**AI エージェントの始め方**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 第2章 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| 外部 |
| [**Azure Search + OpenAI デモ**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | 外部 |
| [**OpenAI チャットアプリ クイックスタート**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | 外部 |
| [<strong>小売業向けマルチエージェントソリューション</strong>](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | <strong>ローカル</strong> |

### Featured: Complete Learning Scenarios
<strong>学習章にマッピングされた本番対応のアプリケーションテンプレート</strong>

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**OpenAI チャットアプリ クイックスタート**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 第2章 | ⭐ | 基本的な AI デプロイパターン |
| [**Azure Search + OpenAI デモ**](https://github.com/Azure-Samples/azure-search-openai-demo) | 第2章 | ⭐⭐ | Azure AI Search を用いた RAG 実装 |
| [**AI ドキュメント処理**](https://github.com/Azure-Samples/ai-document-processing) | 第4章 | ⭐⭐ | ドキュメントインテリジェンスの統合 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 第5章 | ⭐⭐⭐ | エージェントフレームワークとファンクションコール |
| [**Contoso Chat**](https://github.com/Azure-Samples/contoso-chat) | 第8章 | ⭐⭐⭐ | エンタープライズ向け AI オーケストレーション |
| [<strong>小売業向けマルチエージェントソリューション</strong>](examples/retail-scenario.md) | 第5章 | ⭐⭐⭐⭐ | 顧客・在庫エージェントによるマルチエージェントアーキテクチャ |

### Learning by Example Type

> **📌 ローカルと外部の例:**  
> <strong>ローカルの例</strong>（このリポジトリ内） = すぐに使用可能  
> <strong>外部の例</strong>（Azure Samples） = リンクされたリポジトリをクローン

#### ローカルの例（すぐに使用可能）
- [<strong>小売業向けマルチエージェントソリューション</strong>](examples/retail-scenario.md) - ARM テンプレートを備えた本番対応の完全実装
  - マルチエージェントアーキテクチャ（顧客 + 在庫エージェント）
  - 包括的なモニタリングと評価
  - ARM テンプレートによるワンクリックデプロイ

#### ローカルの例 - コンテナアプリケーション（第2章〜第5章）
**このリポジトリ内の包括的なコンテナデプロイメント例：**
- [<strong>コンテナアプリの例</strong>](examples/container-app/README.md) - コンテナ化されたデプロイの完全ガイド
  - [シンプルな Flask API](../../examples/container-app/simple-flask-api) - scale-to-zero を備えた基本的な REST API
  - [マイクロサービスアーキテクチャ](../../examples/container-app/microservices) - 本番対応のマルチサービスデプロイ
  - クイックスタート、本番、上級デプロイパターン
  - 監視、セキュリティ、およびコスト最適化のガイダンス

#### 外部の例 - シンプルアプリケーション（第1章〜第2章）
**開始するにはこれらの Azure Samples リポジトリをクローンしてください：**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本的なデプロイパターン
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 静的コンテンツのデプロイ
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API のデプロイ

#### 外部の例 - データベース統合（第3章〜第4章）  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - データベース接続パターン
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - サーバーレスデータワークフロー

#### 外部の例 - 高度なパターン（第4章〜第8章）
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - マルチサービスアーキテクチャ
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - バックグラウンド処理  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - 本番対応の ML パターン

### External Template Collections
- [**公式 AZD テンプレート ギャラリー**](https://azure.github.io/awesome-azd/) - 公式およびコミュニティテンプレートの厳選コレクション
- [**Azure Developer CLI テンプレート**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn のテンプレートドキュメント
- [**Examples ディレクトリ**](examples/README.md) - 詳細な説明付きのローカル学習例

---

## 📚 Learning Resources & References

### Quick References
- [<strong>コマンドチートシート</strong>](resources/cheat-sheet.md) - 章ごとに整理された必須 azd コマンド
- [<strong>用語集</strong>](resources/glossary.md) - Azure と azd の用語集  
- [<strong>よくある質問</strong>](resources/faq.md) - 学習章ごとに整理された一般的な質問
- [<strong>学習ガイド</strong>](resources/study-guide.md) - 包括的な練習問題

### Hands-On Workshops
- [**AI ワークショップ ラボ**](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI ソリューションを AZD でデプロイ可能にする（2〜3時間）
- [<strong>インタラクティブワークショップ</strong>](workshop/README.md) - MkDocs と GitHub Codespaces を用いた 8 モジュールのガイド付き演習
  - フロー：導入 → 選択 → 検証 → 分解 → 構成 → カスタマイズ → クリーンアップ → まとめ

### External Learning Resources
- [Azure Developer CLI ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure アーキテクチャ センター](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 価格計算ツール](https://azure.microsoft.com/pricing/calculator/)
- [Azure ステータス](https://status.azure.com/)

### エディター向け AI エージェント スキル
- [**skills.sh の Microsoft Azure スキル**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI、Foundry、デプロイ、診断、コスト最適化などの 37 件のオープンエージェントスキル。GitHub Copilot、Cursor、Claude Code、またはその他のサポートされているエージェントにインストールできます：
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 クイックトラブルシューティングガイド

**初心者が直面する一般的な問題と即時の対処法：**

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

# AZD環境用に設定
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
<summary><strong>❌ "azd up" が途中で失敗する</strong></summary>

```bash
# オプション 1: クリーンして再試行
azd down --force --purge
azd up

# オプション 2: インフラだけ修復する
azd provision

# オプション 3: 詳細な状態を確認する
azd show

# オプション 4: Azure Monitor のログを確認する
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# 再認証する
az logout
az login

azd auth logout
azd auth login

# 認証を検証する
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZDは一意の名前を生成しますが、競合が発生した場合:
azd down --force --purge

# 新しい環境で再試行する
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ テンプレートのデプロイが長すぎる</strong></summary>

**通常の待ち時間：**
- シンプルな Web アプリ: 5-10 分
- データベース付きアプリ: 10-15 分
- AI アプリケーション: 15-25 分 (OpenAI のプロビジョニングは遅い)

```bash
# 進捗を確認する
azd show

# 30分以上詰まっている場合は、Azure ポータルを確認する:
azd monitor
# 失敗したデプロイメントを探す
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Azure のロールを確認してください
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 少なくとも「Contributor」ロールが必要です
# Azure 管理者に以下を付与するよう依頼してください:
# - Contributor（リソース用）
# - User Access Administrator（ロール割り当て用）
```
</details>

<details>
<summary><strong>❌ デプロイ済みのアプリケーションの URL が見つからない</strong></summary>

```bash
# すべてのサービスエンドポイントを表示する
azd show

# または Azure ポータルを開く
azd monitor

# 特定のサービスを確認する
azd env get-values
# 「*_URL」変数を探す
```
</details>

### 📚 詳細なトラブルシューティングリソース

- **よくある問題ガイド：** [詳細な解決策](docs/chapter-07-troubleshooting/common-issues.md)
- **AI 固有の問題：** [AI トラブルシューティング](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **デバッグガイド：** [ステップバイステップのデバッグ](docs/chapter-07-troubleshooting/debugging.md)
- **ヘルプを得る：** [Microsoft Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 コース修了と認定

### 進捗の追跡
各章で学習の進捗を追跡しましょう：

- [ ] **第1章**：基礎とクイックスタート ✅
- [ ] **第2章**：AIファースト開発 ✅  
- [ ] **第3章**：構成と認証 ✅
- [ ] **第4章**：Infrastructure as Code とデプロイ ✅
- [ ] **第5章**：マルチエージェント AI ソリューション ✅
- [ ] **第6章**：事前デプロイの検証と計画 ✅
- [ ] **第7章**：トラブルシューティングとデバッグ ✅
- [ ] **第8章**：本番およびエンタープライズパターン ✅

### 学習の検証
各章を完了したら、以下で知識を確認してください：
1. <strong>実践演習</strong>: 章のハンズオンデプロイを完了する
2. <strong>知識チェック</strong>: その章の FAQ セクションを確認する
3. <strong>コミュニティでの議論</strong>: Azure Discord で経験を共有する
4. <strong>次の章</strong>: 次の難易度レベルに進む

### コース修了のメリット
すべての章を修了すると、次のことが得られます：
- <strong>本番経験</strong>: Azure に実際の AI アプリケーションをデプロイした経験
- <strong>プロフェッショナルスキル</strong>: エンタープライズ対応のデプロイ能力  
- <strong>コミュニティでの認知</strong>: Azure 開発者コミュニティのアクティブメンバー
- <strong>キャリアの向上</strong>: 需要の高い AZD および AI デプロイの専門知識

---

## 🤝 コミュニティとサポート

### ヘルプとサポート
- <strong>技術的な問題</strong>: [バグ報告と機能リクエスト](https://github.com/microsoft/azd-for-beginners/issues)
- <strong>学習に関する質問</strong>: [Microsoft Azure Discord コミュニティ](https://discord.gg/microsoft-azure) と [![Microsoft Foundry の Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 専用のヘルプ**: [![Microsoft Foundry の Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) に参加
- <strong>ドキュメント</strong>: [公式 Azure Developer CLI ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord からのコミュニティ洞察

**#Azure チャンネルの最近の投票結果：**
- **45%** の開発者が AI ワークロードに AZD を使用したいと考えています
- <strong>主な課題</strong>：マルチサービスのデプロイ、認証情報管理、本番対応  
- <strong>最も要求されたもの</strong>：AI 専用テンプレート、トラブルシューティングガイド、ベストプラクティス

**コミュニティに参加して：**
- AZD と AI の体験を共有してヘルプを得る
- 新しい AI テンプレートの早期プレビューにアクセスする
- AI デプロイのベストプラクティスに貢献する
- 将来の AI + AZD 機能開発に影響を与える

### コースへの貢献
貢献を歓迎します！ 詳細については [Contributing Guide](CONTRIBUTING.md) をお読みください：
- <strong>コンテンツの改善</strong>：既存の章や例を強化する
- <strong>新しい例</strong>：実世界のシナリオやテンプレートを追加する  
- <strong>翻訳</strong>：多言語サポートの維持を支援する
- <strong>バグ報告</strong>：正確性と明確さを向上させる
- <strong>コミュニティ基準</strong>：包括的なコミュニティガイドラインに従う

---

## 📄 コース情報

### ライセンス
このプロジェクトは MIT ライセンスの下でライセンスされています。詳細は [LICENSE](../../LICENSE) ファイルを参照してください。

### Microsoft の関連学習リソース

私たちのチームは他の包括的な学習コースも提供しています：

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
[![AI エージェント 入門](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![生成 AI 入門](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![生成 AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![生成 AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![生成 AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### コア学習
[![ML 入門](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![データサイエンス 入門](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI 入門](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![サイバーセキュリティ 入門](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web 開発 入門](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT 入門](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR 開発 入門](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot シリーズ
[![AIペアプログラミング用Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET用Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilotアドベンチャー](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ コースナビゲーション

**🚀 学習を始める準備はできましたか？**

<strong>初心者</strong>: [第1章：基礎とクイックスタート](#-chapter-1-foundation--quick-start)  から始めてください  
**AI開発者**: [第2章：AIファースト開発](#-chapter-2-ai-first-development-recommended-for-ai-developers)  に進んでください  
<strong>経験豊富な開発者</strong>: [第3章：構成と認証](#️-chapter-3-configuration--authentication) から始めてください

<strong>次のステップ</strong>: [第1章を始める - AZDの基本](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
この文書は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されました。正確性には努めていますが、自動翻訳には誤りや不正確さが含まれる可能性があることをご承知おきください。原文（原言語）の文書を権威ある情報源とみなしてください。重要な情報については専門の人間による翻訳を推奨します。本翻訳の使用に起因するいかなる誤解や誤訳についても、当方は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->