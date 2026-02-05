# 初心者のためのAZD：体系的な学習の旅

![AZD-for-beginners](../../translated_images/ja/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## このコースのはじめ方

以下の手順に従ってAZD学習の旅を始めましょう：

1. **リポジトリをフォークする**: クリック [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **リポジトリをクローンする** : `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **コミュニティに参加する** : [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) で専門家からサポートを受ける
4. **学習パスを選択する** : 経験レベルに合った章を下から選びましょう

### 多言語対応

#### 自動翻訳（常に最新）

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](./README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **ローカルでクローンしたいですか？**

> このリポジトリには50以上の言語翻訳が含まれており、ダウンロードサイズが大幅に増加します。翻訳なしでクローンするにはスパースチェックアウトを使用してください：  
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> これにより、コースを完了するために必要なものをすべて、ずっと高速にダウンロードできます。  
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## コース概要

進行に合わせたチャプターで構成されており、Azure Developer CLI (azd) をマスターしましょう。**特に、Microsoft Foundryとの連携によるAIアプリケーションのデプロイに重点を置いています。**

### なぜこのコースが現代の開発者に必須なのか

Microsoft Foundry Discordコミュニティからの知見によると、**45%の開発者がAIワークロードにAZDを利用したいと考えています**が、以下の課題に直面しています：
- 複雑なマルチサービスAIアーキテクチャ
- プロダクションAIデプロイのベストプラクティス  
- Azure AIサービスの統合と設定
- AIワークロードのコスト最適化
- AI特有のデプロイ問題のトラブルシューティング

### 学習目標

この体系的なコースを修了すると、以下が身につきます：
- **AZDの基礎習得**：コア概念、インストール、設定
- **AIアプリケーションのデプロイ**：Microsoft Foundryサービスを利用したAZD活用
- **Infrastructure as Codeの実装**：BicepテンプレートでAzureリソース管理
- **デプロイのトラブルシューティング**：よくある問題解決とデバッグ
- **本番運用向け最適化**：セキュリティ、スケール、監視、コスト管理
- **マルチエージェントソリューションの構築**：複雑なAIアーキテクチャの展開

## 📚 学習チャプター

*経験レベルや目的に応じた学習パスを選択しましょう*

### 🚀 第1章：基礎とクイックスタート
**前提条件**：Azureサブスクリプション、基本的なコマンドライン知識  
**所要時間**：30〜45分  
**難易度**：⭐

#### 学べること
- Azure Developer CLIの基本理解
- AZDのプラットフォーム別インストール
- 最初の成功したデプロイ

#### 学習リソース
- **🎯 はじめに**: [Azure Developer CLIとは？](../..)
- **📖 理論**: [AZD 基本](docs/getting-started/azd-basics.md) - コア概念と用語
- **⚙️ セットアップ**: [インストール＆設定](docs/getting-started/installation.md) - プラットフォーム別ガイド
- **🛠️ 実践**: [最初のプロジェクト](docs/getting-started/first-project.md) - ステップバイステップチュートリアル
- **📋 クイックリファレンス**: [コマンドチートシート](resources/cheat-sheet.md)

#### 実習課題
```bash
# 簡単なインストールチェック
azd version

# 最初のアプリケーションをデプロイする
azd init --template todo-nodejs-mongo
azd up
```

**💡 チャプターの成果**: AZDを使用してシンプルなWebアプリケーションをAzureに成功裏にデプロイする

**✅ 成功の検証：**
```bash
# 第1章を完了した後、次のことができるようになります：
azd version              # インストールされているバージョンを表示します
azd init --template todo-nodejs-mongo  # プロジェクトを初期化します
azd up                  # Azure にデプロイします
azd show                # 実行中のアプリのURLを表示します
# ブラウザでアプリが開き、動作します
azd down --force --purge  # リソースをクリーンアップします
```

**📊 所要時間:** 30〜45分  
**📈 習得レベル後:** 基本的なアプリケーションを独力でデプロイ可能

**✅ 成功の検証：**
```bash
# 第1章を完了した後、次のことができるようになります:
azd version              # インストールされているバージョンを表示します
azd init --template todo-nodejs-mongo  # プロジェクトを初期化します
azd up                  # Azureにデプロイします
azd show                # 実行中のアプリのURLを表示します
# ブラウザでアプリが開いて動作します
azd down --force --purge  # リソースをクリーンアップします
```

**📊 所要時間:** 30〜45分  
**📈 習得レベル後:** 基本的なアプリケーションを独力でデプロイ可能

---

### 🤖 第2章：AIファースト開発（AI開発者推奨）
**前提条件**：第1章完了  
**所要時間**：1〜2時間  
**難易度**：⭐⭐

#### 学べること
- Microsoft FoundryとのAZD連携
- AI搭載アプリケーションのデプロイ
- AIサービス設定の理解

#### 学習リソース
- **🎯 はじめに**: [Microsoft Foundry連携](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 パターン**: [AIモデルデプロイ](docs/microsoft-foundry/ai-model-deployment.md) - AIモデルの展開と管理
- **🛠️ ワークショップ**: [AIワークショップラボ](docs/microsoft-foundry/ai-workshop-lab.md) - AIソリューションのAZD準備
- **🎥 インタラクティブガイド**: [ワークショップ資料](workshop/README.md) - MkDocs * DevContainer環境でのブラウザ学習
- **📋 テンプレート**: [Microsoft Foundryテンプレート](../..)
- **📝 事例**: [AZDデプロイ事例](examples/README.md)

#### 実習課題
```bash
# はじめてのAIアプリケーションをデプロイする
azd init --template azure-search-openai-demo
azd up

# 追加のAIテンプレートを試す
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 チャプターの成果**: RAG機能を備えたAIチャットアプリケーションをデプロイおよび設定する

**✅ 成功の検証：**
```bash
# 第2章の後、あなたは以下ができるはずです：
azd init --template azure-search-openai-demo
azd up
# AIチャットインターフェースをテストする
# 質問をして、情報源付きのAIによる応答を得る
# 検索統合が機能しているか確認する
azd monitor  # Application Insights がテレメトリーを表示しているか確認する
azd down --force --purge
```

**📊 所要時間:** 1〜2時間  
**📈 習得レベル後:** 本番対応のAIアプリケーションを展開・設定可能  
**💰 コスト意識:** 開発費用80〜150ドル/月、本番費用300〜3500ドル/月を理解

#### 💰 AIデプロイのコスト考慮

**開発環境（推定80〜150ドル/月）：**
- Azure OpenAI（従量課金）：0〜50ドル/月（トークン使用量による）
- AI Search（Basicプラン）：75ドル/月
- Container Apps（消費プラン）：0〜20ドル/月
- ストレージ（標準）：1〜5ドル/月

**本番環境（推定300〜3500+ドル/月）：**
- Azure OpenAI（安定性能のPTU）：3000ドル以上/月 または 高トラフィックの従量課金
- AI Search（Standardプラン）：250ドル/月
- Container Apps（専用プラン）：50〜100ドル/月
- Application Insights：5〜50ドル/月
- ストレージ（プレミアム）：10〜50ドル/月

**💡 コスト最適化のヒント：**
- 学習には**無料枠**のAzure OpenAIを利用（50,000トークン/月含む）
- 使わないときは`azd down`でリソースを解放
- 本番までは消費ベース課金で開始し、必要に応じてPTUへ移行
- `azd provision --preview`でデプロイ前にコストを試算
- 自動スケールを有効にし、実使用分だけ支払い

**コスト監視方法：**
```bash
# 推定月額費用を確認する
azd provision --preview

# Azureポータルで実際の費用を監視する
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 第3章：設定と認証
**前提条件**：第1章完了  
**所要時間**：45〜60分  
**難易度**：⭐⭐

#### 学べること
- 環境設定と管理
- 認証とセキュリティのベストプラクティス
- リソースの命名と整理

#### 学習リソース
- **📖 設定**: [設定ガイド](docs/getting-started/configuration.md) - 環境セットアップ
- **🔐 セキュリティ**: [認証パターンとマネージドID](docs/getting-started/authsecurity.md) - 認証パターン
- **📝 事例**: [データベースアプリ例](examples/database-app/README.md) - AZDデータベース例

#### 実習課題
- 複数環境（開発・ステージング・本番）の設定
- マネージドID認証の設定
- 環境別設定の実装

**💡 チャプターの成果**: 適切な認証・セキュリティで複数環境を管理できるようになる

---

### 🏗️ 第4章：Infrastructure as Code とデプロイ
**前提条件**：第1-3章完了  
**所要時間**：1〜1.5時間  
**難易度**：⭐⭐⭐

#### 学べること
- 高度なデプロイパターン
- Bicepを使ったInfrastructure as Code
- リソースプロビジョニング戦略

#### 学習リソース
- **📖 デプロイ**: [デプロイメントガイド](docs/deployment/deployment-guide.md) - 完全なワークフロー
- **🏗️ プロビジョニング**: [リソースプロビジョニング](docs/deployment/provisioning.md) - Azureリソース管理
- **📝 事例**: [コンテナアプリ例](../../examples/container-app) - コンテナ化されたデプロイ

#### 実習課題
- カスタムBicepテンプレートの作成
- マルチサービスアプリのデプロイ
- ブルーグリーンデプロイ戦略の実装

**💡 チャプターの成果**: カスタムInfraテンプレートで複雑なマルチサービスアプリケーションをデプロイできる

---

### 🎯 第5章：マルチエージェントAIソリューション（上級）
**前提条件**：第1-2章完了  
**所要時間**：2〜3時間  
**難易度**：⭐⭐⭐⭐
#### 学習内容
- マルチエージェントアーキテクチャパターン
- エージェントのオーケストレーションと調整
- 本番環境対応のAIデプロイメント

#### 学習リソース
- **🤖 注目プロジェクト**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - 完全実装
- **🛠️ ARMテンプレート**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - ワンクリックデプロイ
- **📖 アーキテクチャ**: [マルチエージェント調整パターン](/docs/pre-deployment/coordination-patterns.md) - パターン紹介

#### 実践演習
```bash
# 完全な小売マルチエージェントソリューションを展開する
cd examples/retail-multiagent-arm-template
./deploy.sh

# エージェントの構成を探る
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 チャプター成果**: CustomerおよびInventoryエージェントを用いた本番環境対応マルチエージェントAIソリューションのデプロイと管理

---

### 🔍 チャプター6：展開前の検証＆計画
**前提条件**: チャプター4完了  
**所要時間**: 1時間  
**難易度**: ⭐⭐

#### 学習内容
- 容量計画とリソース検証
- SKU選択戦略
- 出発点チェックと自動化

#### 学習リソース
- **📊 計画**: [容量計画](docs/pre-deployment/capacity-planning.md) - リソース検証
- **💰 選択**: [SKU 選択](docs/pre-deployment/sku-selection.md) - コスト効果の高い選択
- **✅ 検証**: [出発点チェック](docs/pre-deployment/preflight-checks.md) - 自動化スクリプト

#### 実践演習
- 容量検証スクリプトの実行
- コスト最適化のSKU選択
- 展開前の自動化チェックの実装

**💡 チャプター成果**: 展開前にデプロイメントを検証・最適化

---

### 🚨 チャプター7：トラブルシューティング＆デバッグ
**前提条件**: いずれかの展開チャプターを完了済み  
**所要時間**: 1〜1.5時間  
**難易度**: ⭐⭐

#### 学習内容
- 体系的なデバッグ手法
- よくある問題とその解決策
- AI固有のトラブルシューティング

#### 学習リソース
- **🔧 よくある問題**: [よくある問題](docs/troubleshooting/common-issues.md) - FAQと解決策
- **🕵️ デバッグ**: [デバッグガイド](docs/troubleshooting/debugging.md) - ステップバイステップ手法
- **🤖 AI問題**: [AI固有のトラブルシューティング](docs/troubleshooting/ai-troubleshooting.md) - AIサービス障害対応

#### 実践演習
- 展開失敗の診断
- 認証問題の解決
- AIサービス接続のデバッグ

**💡 チャプター成果**: 共通の展開問題を独力で診断・解決

---

### 🏢 チャプター8：本番＆エンタープライズパターン
**前提条件**: チャプター1〜4完了  
**所要時間**: 2〜3時間  
**難易度**: ⭐⭐⭐⭐

#### 学習内容
- 本番展開戦略
- エンタープライズセキュリティパターン
- 監視とコスト最適化

#### 学習リソース
- **🏭 本番運用**: [本番AIベストプラクティス](docs/microsoft-foundry/production-ai-practices.md) - エンタープライズパターン
- **📝 事例**: [マイクロサービス例](../../examples/microservices) - 複雑なアーキテクチャ例
- **📊 監視**: [Application Insights連携](docs/pre-deployment/application-insights.md) - 監視実装

#### 実践演習
- エンタープライズセキュリティパターンの実装
- 包括的な監視設定
- 適切なガバナンス付きの本番デプロイ

**💡 チャプター成果**: フル機能の本番対応エンタープライズアプリを展開

---

## 🎓 ワークショップ概要：実践的学習体験

> **⚠️ ワークショップステータス：開発中**  
> ワークショップの教材は現在開発および改善を進めています。コアモジュールは機能していますが、一部高度なセクションは未完成です。全コンテンツの完成に向けて積極的に作業を進めています。 [進捗はこちら→](workshop/README.md)

### インタラクティブなワークショップ教材
**ブラウザベースのツールと誘導型演習による包括的な実践学習**

本ワークショップ教材は、上記のチャプター型カリキュラムを補完する構造化されたインタラクティブな学習体験を提供します。セルフペース学習と講師主導セッションの双方に対応しています。

#### 🛠️ ワークショップ機能
- **ブラウザベースインターフェース**: MkDocsにより完全構築。検索、コピー、テーマ機能搭載
- **GitHub Codespaces連携**: ワンクリックで開発環境セットアップ可能
- **構造化された学習パス**: 7ステップの誘導型演習（合計3.5時間）
- **探索 → 展開 → カスタマイズ**: 段階的な方法論
- **インタラクティブなDevContainer環境**: 事前設定済みのツールと依存関係

#### 📚 ワークショップ構造
ワークショップは **探索 → 展開 → カスタマイズ** の方法論に従います：

1. **探索フェーズ** (45分)
   - Microsoft Foundryのテンプレートとサービスの調査
   - マルチエージェントアーキテクチャパターンの理解
   - 展開要件と前提条件の確認

2. **展開フェーズ** (2時間)
   - AZDを使ったAIアプリケーションの実践展開
   - Azure AIサービスとエンドポイントの設定
   - セキュリティおよび認証パターンの実装

3. **カスタマイズフェーズ** (45分)
   - 特定ユースケース向けのアプリケーション修正
   - 本番環境展開の最適化
   - 監視とコスト管理の実装

#### 🚀 ワークショップ開始方法
```bash
# オプション1: GitHub Codespaces（推奨）
# リポジトリで「Code」→「mainでcodespaceを作成」をクリックしてください

# オプション2: ローカル開発
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.mdのセットアップ手順に従ってください
```

#### 🎯 ワークショップ学習成果
ワークショップを修了すると、参加者は以下のことができるようになります：
- **本番用AIアプリケーションの展開**: Microsoft FoundryサービスとAZDを活用
- **マルチエージェントアーキテクチャの習得**: 連携するAIエージェントソリューションの実装
- **セキュリティベストプラクティスの適用**: 認証とアクセス管理の設定
- **スケール最適化**: コスト効率でパフォーマンスの高い展開設計
- **展開トラブルシューティング**: よくある問題を自分で解決

#### 📖 ワークショップリソース
- **🎥 インタラクティブガイド**: [ワークショップ教材](workshop/README.md) - ブラウザベースの学習環境
- **📋 ステップバイステップ手順**: [誘導演習](../../workshop/docs/instructions) - 詳細なウォークスルー
- **🛠️ AI ワークショップラボ**: [AI ワークショップラボ](docs/microsoft-foundry/ai-workshop-lab.md) - AI向け演習
- **💡 クイックスタート**: [ワークショップセットアップガイド](workshop/README.md#quick-start) - 環境構築手順

**適用先**：企業研修、大学講座、セルフペース学習、開発者ブートキャンプに最適。

---

## 📖 Azure Developer CLIとは？

Azure Developer CLI（azd）は、Azureへのアプリケーション構築およびデプロイを迅速化する開発者向けコマンドラインインターフェースです。主な特徴は：

- **テンプレートベースの展開** - 一般的なアプリケーションパターン用の事前構築テンプレートを提供
- **コードとしてのインフラ** - BicepやTerraformでAzureリソースを管理
- **統合ワークフロー** - アプリケーションのプロビジョニング、デプロイ、監視をシームレスに実現
- **開発者に優しい設計** - 開発者の生産性と体験を最適化

### **AZD + Microsoft Foundry：AI展開に最適**

**なぜAIソリューションにAZDなのか？** AZDはAI開発者の主要課題に対応しています：

- **AI対応テンプレート** - Azure OpenAI、Cognitive Services、MLワークロード向け事前設定テンプレート
- **セキュアなAI展開** - AIサービス、APIキー、モデルエンドポイントのセキュリティパターン組み込み
- **本番AIパターン** - スケーラブルかつコスト効率の良いAIアプリ展開のベストプラクティス
- **エンドツーエンドのAIワークフロー** - モデル開発から本番展開、適切な監視まで対応
- **コスト最適化** - AIワークロード向けのスマートなリソース割り当てとスケーリング戦略
- **Microsoft Foundry連携** - Microsoft Foundryのモデルカタログやエンドポイントとのシームレス接続

---

## 🎯 テンプレート＆サンプルライブラリ

### 注目：Microsoft Foundryテンプレート
**AIアプリケーションを展開するならここからスタート！**

> **注意:** これらのテンプレートは様々なAIパターンを示しています。一部は外部のAzure Samples、一部はローカル実装です。

| テンプレート | チャプター | 難易度 | サービス | タイプ |
|----------|---------|------------|----------|------|
| [**AIチャット入門**](https://github.com/Azure-Samples/get-started-with-ai-chat) | チャプター2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | 外部 |
| [**AIエージェント入門**](https://github.com/Azure-Samples/get-started-with-ai-agents) | チャプター2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| 外部 |
| [**Azure Search + OpenAI デモ**](https://github.com/Azure-Samples/azure-search-openai-demo) | チャプター2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | 外部 |
| [**OpenAIチャットアプリクイックスタート**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | チャプター2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 外部 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | チャプター5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 外部 |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | チャプター8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | 外部 |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | チャプター5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **ローカル** |

### 注目：学習シナリオの完全テンプレート
**学習チャプターにマッピングされた本番対応アプリケーションテンプレート**

| テンプレート | 学習チャプター | 難易度 | 主な学習内容 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | チャプター2 | ⭐ | 基本的なAI展開パターン |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | チャプター2 | ⭐⭐ | Azure AI SearchによるRAG実装 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | チャプター4 | ⭐⭐ | ドキュメントインテリジェンス連携 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | チャプター5 | ⭐⭐⭐ | エージェントフレームワークと関数呼び出し |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | チャプター8 | ⭐⭐⭐ | エンタープライズAIオーケストレーション |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | チャプター5 | ⭐⭐⭐⭐ | CustomerおよびInventoryエージェントによるマルチエージェントアーキテクチャ |

### 例による学習タイプ

> **📌 ローカル vs. 外部例:**  
> **ローカル例**（このリポジトリ内）= 即使用可能  
> **外部例**（Azure Samples）= リンクリポジトリからクローン

#### ローカル例（すぐに利用可能）
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - 完全な本番対応実装とARMテンプレート
  - マルチエージェントアーキテクチャ（Customer + Inventoryエージェント）
  - 包括的な監視と評価
  - ARMテンプレートによるワンクリックデプロイ

#### ローカル例 - コンテナアプリケーション（チャプター2-5）
**本リポジトリ内の包括的なコンテナ化展開例:**
- [**Container App Examples**](examples/container-app/README.md) - コンテナ展開の完全ガイド
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - スケールゼロ対応の基本REST API
  - [Microservices Architecture](../../examples/container-app/microservices) - 本番対応のマルチサービス展開
  - クイックスタート、本番、上級展開パターン
  - 監視、セキュリティ、コスト最適化の手引き

#### 外部例 - シンプルアプリケーション（チャプター1-2）
**次のAzure Samplesリポジトリをクローンして開始:**
- [シンプルWebアプリ - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 基本展開パターン
- [静的ウェブサイト - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 静的コンテンツ展開
- [コンテナアプリ - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API展開

#### 外部例 - データベース統合（チャプター3-4）  
- [データベースアプリ - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - データベース接続パターン
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - サーバーレスデータワークフロー

#### 外部例 - 上級パターン（チャプター4-8）
- [Javaマイクロサービス](https://github.com/Azure-Samples/java-microservices-aca-lab) - マルチサービスアーキテクチャ
- [Container Appsジョブ](https://github.com/Azure-Samples/container-apps-jobs) - バックグラウンド処理  
- [エンタープライズMLパイプライン](https://github.com/Azure-Samples/mlops-v2) - 本番対応MLパターン

### 外部テンプレートコレクション
- [**公式AZDテンプレートギャラリー**](https://azure.github.io/awesome-azd/) - 公式およびコミュニティテンプレートのキュレーションコレクション
- [**Azure Developer CLI テンプレート**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn テンプレート ドキュメント
- [**Examples Directory**](examples/README.md) - 詳細な説明付きのローカル学習用例

---

## 📚 学習リソースと参考資料

### クイックリファレンス
- [**コマンド チートシート**](resources/cheat-sheet.md) - 章ごとに整理された必須azdコマンド
- [**用語集**](resources/glossary.md) - Azureおよびazd用語集  
- [**よくある質問（FAQ）**](resources/faq.md) - 学習章ごとに整理されたよくある質問
- [**学習ガイド**](resources/study-guide.md) - 包括的な練習問題集

### ハンズオン ワークショップ
- [**AI ワークショップ ラボ**](docs/microsoft-foundry/ai-workshop-lab.md) - AIソリューションのAZDデプロイ可能化（2〜3時間）
- [**インタラクティブ ワークショップ ガイド**](workshop/README.md) - MkDocsとDevContainer環境を使ったブラウザベースのワークショップ
- [**構造化された学習パス**](../../workshop/docs/instructions) - 7段階のガイド付き演習（発見 → デプロイ → カスタマイズ）
- [**AZD初心者向けワークショップ**](workshop/README.md) - GitHub Codespaces連携済みの完全ハンズオンワークショップ教材

### 外部学習リソース
- [Azure Developer CLI ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure アーキテクチャ センター](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 価格計算ツール](https://azure.microsoft.com/pricing/calculator/)
- [Azure サービスステータス](https://status.azure.com/)

---

## 🔧 クイックトラブルシューティングガイド

**初心者がよく直面する問題と即時の解決策:**

### ❌ "azd: command not found"

```bash
# まずAZDをインストールしてください
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

# AZD環境に設定
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# 確認する
az account show
```

### ❌ "InsufficientQuota" または "Quota exceeded"

```bash
# 別の Azure リージョンを試してください
azd env set AZURE_LOCATION "westus2"
azd up

# または開発時に小さい SKU を使用してください
# infra/main.parameters.json を編集してください：
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" が途中で失敗する

```bash
# オプション1: クリーンして再試行する
azd down --force --purge
azd up

# オプション2: インフラストラクチャのみ修正する
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
# AZD は一意の名前を生成しますが、衝突した場合：
azd down --force --purge

# その場合は新しい環境で再試行します
azd env new dev-v2
azd up
```

### ❌ テンプレートの展開に時間がかかる

**通常の待機時間:**
- シンプルなウェブアプリ: 5〜10分
- データベース付きアプリ: 10〜15分
- AIアプリケーション: 15〜25分（OpenAIプロビジョニングは遅い）

```bash
# 進行状況を確認する
azd show

# 30分以上進まない場合は、Azureポータルを確認してください：
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
# すべてのサービスエンドポイントを表示する
azd show

# または Azure ポータルを開く
azd monitor

# 特定のサービスを確認する
azd env get-values
# *_URL 変数を探す
```

### 📚 フルトラブルシューティングリソース

- **よくある問題ガイド:** [詳細な解決策](docs/troubleshooting/common-issues.md)
- **AI特有の問題:** [AIトラブルシューティング](docs/troubleshooting/ai-troubleshooting.md)
- **デバッグガイド:** [段階的デバッグ](docs/troubleshooting/debugging.md)
- **助けを求める:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 クイックトラブルシューティングガイド

**初心者がよく直面する問題と即時の解決策:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# まずAZDをインストールします
# Windows（PowerShell）：
winget install microsoft.azd

# macOS：
brew tap azure/azd && brew install azd

# Linux：
curl -fsSL https://aka.ms/install-azd.sh | bash

# インストールを確認します
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" または "Subscription not set"</strong></summary>

```bash
# 利用可能なサブスクリプションの一覧表示
az account list --output table

# デフォルトサブスクリプションの設定
az account set --subscription "<subscription-id-or-name>"

# AZD環境の設定
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

# 開発環境では小さい SKU を使用してください
# infra/main.parameters.json を編集してください:
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

# オプション3: 詳細ログを確認
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
# AZDは一意の名前を生成しますが、もし競合があれば：
azd down --force --purge

# その場合は新しい環境で再試行します
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ テンプレートの展開に時間がかかる</strong></summary>

**通常の待機時間:**
- シンプルなウェブアプリ: 5〜10分
- データベース付きアプリ: 10〜15分
- AIアプリケーション: 15〜25分（OpenAIプロビジョニングは遅い）

```bash
# 進行状況を確認する
azd show

# 30分以上進まない場合は、Azureポータルを確認してください:
azd monitor
# 失敗したデプロイメントを探してください
```
</details>

<details>
<summary><strong>❌ "Permission denied" または "Forbidden"</strong></summary>

```bash
# Azureのロールを確認してください
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 少なくとも「Contributor」ロールが必要です
# Azure管理者に以下の権限を付与するよう依頼してください:
# - Contributor（リソース用）
# - User Access Administrator（ロール割り当て用）
```
</details>

<details>
<summary><strong>❌ デプロイ済みアプリケーションのURLが見つからない</strong></summary>

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

### 📚 フルトラブルシューティングリソース

- **よくある問題ガイド:** [詳細な解決策](docs/troubleshooting/common-issues.md)
- **AI特有の問題:** [AIトラブルシューティング](docs/troubleshooting/ai-troubleshooting.md)
- **デバッグガイド:** [段階的デバッグ](docs/troubleshooting/debugging.md)
- **助けを求める:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 コース修了と認定

### 進捗管理
各章の学習進捗を確認しましょう:

- [ ] **第1章**: 基礎 & クイックスタート ✅
- [ ] **第2章**: AIファースト開発 ✅  
- [ ] **第3章**: 設定 & 認証 ✅
- [ ] **第4章**: インフラストラクチャコード化 & デプロイ ✅
- [ ] **第5章**: マルチエージェントAIソリューション ✅
- [ ] **第6章**: 事前デプロイ検証 & 計画 ✅
- [ ] **第7章**: トラブルシューティング & デバッグ ✅
- [ ] **第8章**: 本番・エンタープライズパターン ✅

### 学習検証
各章を修了したら、知識を確認しましょう:
1. **実践演習**: 章ごとのハンズオンデプロイを完了する
2. **知識確認**: 章のFAQセクションを見直す
3. **コミュニティ議論**: Azure Discordで経験を共有する
4. **次の章へ**: 次のレベルの学習へ進む

### コース修了時の利点
全章を修了すると、以下を得られます:
- **実務経験**: AzureにAIアプリケーションをデプロイした経験
- **専門スキル**: エンタープライズ対応のデプロイ能力  
- **コミュニティ認知**: Azure開発者コミュニティのアクティブメンバー
- **キャリア向上**: 需要の高いAZDとAIデプロイ専門知識

---

## 🤝 コミュニティ＆サポート

### 助けとサポート
- **技術的な問題: **[バグ報告と機能リクエスト](https://github.com/microsoft/azd-for-beginners/issues)
- **学習に関する質問:** [Microsoft Azure Discord コミュニティ](https://discord.gg/microsoft-azure) と [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI特有の支援:** [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) に参加
- **ドキュメント:** [公式 Azure Developer CLI ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord からのコミュニティインサイト

**#Azure チャンネルの最新アンケート結果:**
- **45%** の開発者がAIワークロードにAZDを使いたいと回答
- **主な課題:** 複数サービスの展開、認証情報管理、本番対応準備  
- **最も要望されているもの:** AI特化テンプレート、トラブルシューティングガイド、ベストプラクティス

**コミュニティに参加して:**
- AZD＋AIの経験を共有、支援を得る
- 新しいAIテンプレートの早期プレビューにアクセス
- AIデプロイのベストプラクティスに貢献
- 将来のAI＋AZD機能開発に意見を反映

### コースへの貢献
ご意見や改善提案を歓迎します！詳細は[貢献ガイド](CONTRIBUTING.md)をお読みください:
- **コンテンツ改善:** 既存章や例の改良
- **新しい例:** 実践シナリオやテンプレートの追加  
- **翻訳:** 多言語サポートの維持支援
- **バグ報告:** 精度と明瞭さの向上
- **コミュニティ基準:** インクルーシブなコミュニティ指針の遵守

---

## 📄 コース情報

### ライセンス
本プロジェクトはMITライセンスで提供されています - 詳細は[LICENSE](../../LICENSE)ファイルをご覧ください。

### 関連Microsoft学習リソース

チームが提供する他の包括的な学習コース:

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
 
### Generative AI シリーズ
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### コアラーニング
---
 
### コパイロットシリーズ

---

## 🗺️ コースナビゲーション

**🚀 学習の準備はできましたか？**

**初心者**：[第1章: 基礎とクイックスタート](../..) から始めましょう  
**AI開発者**：[第2章: AIファースト開発](../..) へジャンプ  
**経験豊富な開発者**：[第3章: 設定と認証](../..) から開始

**次のステップ**：[第1章を始める - AZDの基本](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類はAI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されました。正確性の向上に努めておりますが、自動翻訳には誤りや不正確な表現が含まれる可能性があります。正式な情報源としては、原文の原語版を参照してください。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の使用に起因するいかなる誤解や誤訳についても、当社は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->