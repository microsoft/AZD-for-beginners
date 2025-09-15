<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6c3d0f9ef66c2cd692a55a2811d9c3e5",
  "translation_date": "2025-09-15T14:55:55+00:00",
  "source_file": "README.md",
  "language_code": "ja"
}
-->
# AZD初心者向けガイド

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.ja.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

以下の手順に従って、これらのリソースを使い始めましょう：
1. **リポジトリをフォークする**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork) をクリック
2. **リポジトリをクローンする**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. [**Azure Discordコミュニティに参加して、専門家や他の開発者と交流する**](https://discord.com/invite/ByRwuEEgH4)

### 多言語対応

#### GitHub Actionによるサポート (自動化 & 常に最新)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](./README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

**追加の翻訳を希望する場合は、サポートされている言語のリストが [こちら](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md) にあります**

## はじめに

Azure Developer CLI (azd) の包括的なガイドへようこそ。このリポジトリは、学生からプロフェッショナルな開発者まで、すべてのレベルの開発者がAzure Developer CLIを学び、効率的なクラウド展開を実現するための支援を目的としています。特に、Azure AI Foundryを使用したAIアプリケーション展開に焦点を当てています。この構造化された学習リソースは、Azureクラウド展開の実践的な経験、一般的な問題のトラブルシューティング、成功するAZDテンプレート展開のベストプラクティスを提供します。

### **AI開発者にとってこのガイドが重要な理由**
最近のAzure AI Foundry Discordコミュニティの投票によると、**45%の開発者がAIワークロードにAZDを使用することに興味を持っています**が、以下の課題に直面しています：
- 複雑なマルチサービスAIアーキテクチャ
- 本番環境でのAI展開のベストプラクティス
- Azure AIサービスの統合と設定
- AIワークロードのコスト最適化
- AI特有の展開問題のトラブルシューティング

## 学習目標

このリポジトリを通じて、以下を学ぶことができます：
- Azure Developer CLIの基本とコアコンセプトを習得
- インフラストラクチャコードを使用してAzureリソースを展開およびプロビジョニング
- 一般的なAZD展開問題のトラブルシューティングスキルを習得
- 展開前の検証と容量計画を理解
- セキュリティのベストプラクティスとコスト最適化戦略を実装
- 本番環境でのアプリケーションをAzureに展開する自信を構築

## 学習成果

このコースを完了すると、以下ができるようになります：
- Azure Developer CLIを正常にインストール、設定、使用
- AZDテンプレートを使用してアプリケーションを作成および展開
- 認証、インフラストラクチャ、展開の問題をトラブルシューティング
- 容量計画やSKU選択を含む展開前チェックを実行
- モニタリング、セキュリティ、コスト管理のベストプラクティスを実装
- AZDワークフローをCI/CDパイプラインに統合

## 目次

- [Azure Developer CLIとは？](../..)
- [クイックスタート](../..)
- [学習パス](../..)
  - [AI開発者向け (ここから始めるのがおすすめ！)](../..)
  - [学生 & 初心者向け](../..)
  - [開発者向け](../..)
  - [DevOpsエンジニア向け](../..)
- [ドキュメント](../..)
  - [はじめに](../..)
  - [展開 & プロビジョニング](../..)
  - [展開前チェック](../..)
  - [AI & Azure AI Foundry](../..)
  - [トラブルシューティング](../..)
- [例 & テンプレート](../..)
  - [注目: Azure AI Foundryテンプレート](../..)
  - [注目: Azure AI Foundry E2Eシナリオ](../..)
  - [追加のAZDテンプレート](../..)
  - [ハンズオンラボ & ワークショップ](../..)
- [リソース](../..)
- [貢献](../..)
- [サポート](../..)
- [コミュニティ](../..)

## Azure Developer CLIとは？

Azure Developer CLI (azd) は、Azureへのアプリケーション構築と展開プロセスを加速する開発者向けのコマンドラインインターフェイスです。以下を提供します：

- **テンプレートベースの展開** - 一般的なアプリケーションパターンのための事前構築テンプレートを使用
- **インフラストラクチャコード** - BicepまたはTerraformを使用してAzureリソースを管理
- **統合ワークフロー** - アプリケーションのプロビジョニング、展開、モニタリングをシームレスに実行
- **開発者向け** - 開発者の生産性と体験を最適化

### **AZD + Azure AI Foundry: AI展開に最適**

**なぜAIソリューションにAZDが適しているのか？** AZDはAI開発者が直面する主要な課題に対応します：

- **AI対応テンプレート** - Azure OpenAI、Cognitive Services、MLワークロード向けの事前設定テンプレート
- **安全なAI展開** - AIサービス、APIキー、モデルエンドポイントのための組み込みセキュリティパターン
- **本番環境AIパターン** - スケーラブルでコスト効率の高いAIアプリケーション展開のベストプラクティス
- **エンドツーエンドAIワークフロー** - モデル開発から適切なモニタリングを伴う本番展開まで
- **コスト最適化** - AIワークロードのスマートなリソース割り当てとスケーリング戦略
- **Azure AI Foundry統合** - AI Foundryモデルカタログとエンドポイントへのシームレスな接続

## クイックスタート

### 必要条件
- Azureサブスクリプション
- Azure CLIインストール済み
- Git (テンプレートのクローン用)

### インストール
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### 初めての展開
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```

### 初めてのAI展開
```bash
# Initialize an AI-powered chat application with Azure OpenAI
azd init --template azure-search-openai-demo

# Configure AI services and deploy
azd up

# Or try other AI templates:
azd init --template openai-chat-app-quickstart
azd init --template ai-document-processing
azd init --template contoso-chat
```

## 学習パス

### AI開発者向け (ここから始めるのがおすすめ！)
1. **クイックスタート**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) テンプレートを試す
2. **基本を学ぶ**: [AZDの基本](docs/getting-started/azd-basics.md) + [Azure AI Foundry統合](docs/ai-foundry/azure-ai-foundry-integration.md)
3. **実践練習**: [AIワークショップラボ](docs/ai-foundry/ai-workshop-lab.md) を完了
4. **本番環境準備**: [本番AIベストプラクティス](docs/ai-foundry/production-ai-practices.md) を確認
5. **応用編**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat) エンタープライズテンプレートを展開

### 学生 & 初心者向け
1. [AZDの基本](docs/getting-started/azd-basics.md) から始める
2. [インストールガイド](docs/getting-started/installation.md) を読む
3. [初めてのプロジェクト](docs/getting-started/first-project.md) を完了
4. [シンプルなWebアプリの例](../../examples/simple-web-app) で練習

### 開発者向け
1. [設定ガイド](docs/getting-started/configuration.md) を確認
2. [展開ガイド](docs/deployment/deployment-guide.md) を学ぶ
3. [データベースアプリの例](../../examples/database-app) を実践
4. [コンテナアプリの例](../../examples/container-app) を探索

### DevOpsエンジニア向け
1. [リソースのプロビジョニング](docs/deployment/provisioning.md) を習得
2. [事前チェック](docs/pre-deployment/preflight-checks.md) を実装
3. [容量計画](docs/pre-deployment/capacity-planning.md) を練習
4. 応用編 [マイクロサービスの例](../../examples/microservices)

## ドキュメント

### はじめに
- [**AZDの基本**](docs/getting-started/azd-basics.md) - コアコンセプトと用語
- [**インストール & セットアップ**](docs/getting-started/installation.md) - プラットフォーム別インストールガイド
- [**設定**](docs/getting-started/configuration.md) - 環境設定と認証
- [**初めてのプロジェクト**](docs/getting-started/first-project.md) - ステップバイステップのチュートリアル

### 展開 & プロビジョニング
- [**展開ガイド**](docs/deployment/deployment-guide.md) - 完全な展開ワークフロー
- [**リソースのプロビジョニング**](docs/deployment/provisioning.md) - Azureリソース管理

### 展開前チェック
- [**容量計画**](docs/pre-deployment/capacity-planning.md) - Azureリソース容量の検証
- [**SKU選択**](docs/pre-deployment/sku-selection.md) - 適切なAzure SKUの選択
- [**事前チェック**](docs/pre-deployment/preflight-checks.md) - 自動化された検証スクリプト

### AI & Azure AI Foundry
- [**Azure AI Foundry統合**](docs/ai-foundry/azure-ai-foundry-integration.md) - AZDをAzure AI Foundryサービスと接続
- [**AIモデル展開パターン**](docs/ai-foundry/ai-model-deployment.md) - AZDを使用したAIモデルの展開と管理
- [**AIワークショップラボ**](docs/ai-foundry/ai-workshop-lab.md) - ハンズオンラボ: AIソリューションをAZD対応にする
- [**本番AIベストプラクティス**](docs/ai-foundry/production-ai-practices.md) - AIワークロードのセキュリティ、スケーリング、モニタリング

### トラブルシューティング
- [**一般的な問題**](docs/troubleshooting/common-issues.md) - よくある問題とその解決策
- [**デバッグガイド**](docs/troubleshooting/debugging.md) - ステップバイステップのデバッグ戦略  
- [**AI特有のトラブルシューティング**](docs/troubleshooting/ai-troubleshooting.md) - AIサービスとモデル展開の問題  

## サンプル & テンプレート

### [注目: Azure AI Foundry テンプレート](https://ai.azure.com/resource/build/templates)  
**AIアプリケーションを展開する場合はここから始めましょう！**

| テンプレート | 説明 | 複雑さ | サービス |
|----------|-------------|------------|----------|
| [**AIチャットの始め方**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Azure Container Appsを使用して、データとテレメトリインサイトを統合した基本的なチャットアプリケーションを作成・展開します。 |⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**AIエージェントの始め方**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Azure Container Appsを使用して、アクションとテレメトリインサイトを備えた基本的なエージェントアプリケーションを作成・展開します。 |⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights |
| [**マルチエージェントのワークフロー自動化**](https://github.com/Azure-Samples/get-started-with-ai-chat) | AIエージェントのグループを編成・管理することで、タスク計画と自動化を強化します。 |⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps |
| [**データから文書を生成**](https://github.com/Azure-Samples/get-started-with-ai-chat) | データから関連情報を見つけて要約することで、契約書、請求書、投資提案書などの文書生成を加速します。 |⭐⭐⭐ | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB |
| [**エージェントを活用してクライアント会議を改善**](https://github.com/Azure-Samples/get-started-with-ai-chat) | レガシーコードをモダンな言語に移行するためにエージェントチームを活用します。 |⭐⭐⭐ | AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**エージェントを活用してコードをモダン化**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Azure Container Appsを使用して、データとテレメトリインサイトを統合した基本的なチャットアプリケーションを作成・展開します。 |⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps |
| [**会話型エージェントを構築**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 高度な会話理解を活用して、決定論的かつ人間が制御可能なワークフローを備えたチャットボットやエージェントを作成・強化します。 |⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry |
| [**会話データからインサイトを引き出す**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 大規模な音声およびテキストデータセットからインサイトを引き出し、コンタクトセンターの効率を向上させます。 |⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding |
| [**マルチモーダルコンテンツ処理**](https://github.com/Azure-Samples/get-started-with-ai-chat) | テキスト、画像、表、グラフを含む非構造化コンテンツから情報を抽出し、構造化形式にマッピングすることで、請求書、契約書などの文書を迅速かつ正確に処理します。 |⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps |

### 注目: Azure AI Foundry E2Eシナリオ  
**AIアプリケーションを展開する場合はここから始めましょう！**

| テンプレート | 説明 | 複雑さ | サービス |
|----------|-------------|------------|----------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Azure OpenAIを使用したシンプルなチャットインターフェース | ⭐ | AzureOpenAI + Container Apps |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG対応のチャットアプリ | ⭐⭐ | AzureOpenAI + Search + App Service |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | AIサービスを使用した文書分析 | ⭐⭐ | Azure Document Intelligence + Functions |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 関数呼び出しを備えたAIエージェントフレームワーク | ⭐⭐⭐ | AzureOpenAI + Azure Container Apps + Functions |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | AIオーケストレーションを備えたエンタープライズチャット | ⭐⭐⭐ | AzureOpenAI + Azure AI Search + Container Apps |

### 追加のAZDテンプレート  
- [**サンプルディレクトリ**](examples/README.md) - 実践的な例、テンプレート、実際のシナリオ  
- [**Azure-Samples AZDテンプレート**](https://github.com/Azure-Samples/azd-templates) - Microsoft公式サンプルテンプレート  
- [**Awesome AZDギャラリー**](https://azure.github.io/awesome-azd/) - コミュニティ提供のテンプレート  

### ハンズオンラボ & ワークショップ  
- [**AIワークショップラボ**](docs/ai-foundry/ai-workshop-lab.md) - **NEW**: AIソリューションをAZDで展開可能にする方法  
- [**AZD初心者向けワークショップ**](workshop/README.md) - AIエージェントAZDテンプレートの展開に焦点を当てた内容  

## リソース

### クイックリファレンス  
- [**コマンドチートシート**](resources/cheat-sheet.md) - 必須のazdコマンド  
- [**用語集**](resources/glossary.md) - Azureとazdの用語  
- [**FAQ**](resources/faq.md) - よくある質問  
- [**学習ガイド**](resources/study-guide.md) - 包括的な学習目標と練習問題  

### 外部リソース  
- [Azure Developer CLI ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure アーキテクチャセンター](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure 価格計算ツール](https://azure.microsoft.com/pricing/calculator/)  
- [Azure ステータス](https://status.azure.com/)  

## コントリビューション

コントリビューションを歓迎します！詳細については[コントリビューションガイド](CONTRIBUTING.md)をご覧ください:  
- 問題や機能リクエストの提出方法  
- コードコントリビューションのガイドライン  
- ドキュメント改善  
- コミュニティ標準  

## サポート

- **問題**: [バグ報告と機能リクエスト](https://github.com/microsoft/azd-for-beginners/issues)  
- **ディスカッション**: [Microsoft Azure Discord コミュニティQ&Aとディスカッション](https://discord.gg/microsoft-azure)  
- **AI特有のサポート**: AZD + AI Foundryのディスカッションには[#Azureチャンネル](https://discord.gg/microsoft-azure)に参加してください  
- **メール**: 非公開の問い合わせ用  
- **Microsoft Learn**: [公式Azure Developer CLIドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

### Azure AI Foundry Discordからのコミュニティインサイト  

**#Azureチャンネルの投票結果:**  
- **45%** の開発者がAIワークロードにAZDを使用したいと回答  
- **主な課題**: マルチサービス展開、資格情報管理、運用準備  
- **最も要望が多いもの**: AI特有のテンプレート、トラブルシューティングガイド、ベストプラクティス  

**コミュニティに参加して:**  
- AZD + AIの経験を共有し、サポートを受ける  
- 新しいAIテンプレートの早期プレビューにアクセス  
- AI展開のベストプラクティスに貢献  
- 将来のAI + AZD機能開発に影響を与える  

## ライセンス

このプロジェクトはMITライセンスの下で提供されています。詳細については[LICENSE](../../LICENSE)ファイルをご覧ください。

## その他のコース

私たちのチームは他にもコースを提供しています！以下をご覧ください:

- [**NEW** モデルコンテキストプロトコル(MCP)初心者向け](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [AIエージェント初心者向け](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [.NETを使用した初心者向け生成AI](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
- [初心者向け生成AI](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Javaを使用した初心者向け生成AI](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
- [初心者向け機械学習](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
- [初心者向けデータサイエンス](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
- [初心者向けAI](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
- [初心者向けサイバーセキュリティ](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)  
- [初心者向けWeb開発](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
- [初心者向けIoT](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
- [初心者向けXR開発](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [GitHub Copilotを活用したAIペアプログラミングの習得](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
- [C#/.NET開発者向けGitHub Copilotの習得](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
- [GitHub Copilotの冒険を選ぼう](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  

---

**ナビゲーション**  
- **次のレッスン**: [AZDの基本](docs/getting-started/azd-basics.md)  

---

**免責事項**:  
この文書は、AI翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を追求しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知ください。元の言語で記載された文書が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用に起因する誤解や誤解釈について、当方は責任を負いません。