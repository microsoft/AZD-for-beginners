<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ac8b29b2e187a7204533f7136d9fa364",
  "translation_date": "2025-09-12T17:48:49+00:00",
  "source_file": "workshop/README.md",
  "language_code": "ja"
}
-->
# AZD for AI Developers Workshop

**前回:** [AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md) | **次回:** [Workshop Lab Modules](../../../workshop)

Azure Developer CLI (AZD) を使用して AI アプリケーションをデプロイする方法を学ぶためのハンズオンワークショップへようこそ。このワークショップでは、AZD の基本から、実際に運用可能な AI ソリューションのデプロイまでを学びます。

## ワークショップ概要

**所要時間:** 2～3時間  
**レベル:** 初級～中級  
**前提条件:** Azure、コマンドラインツール、AI 概念の基本的な知識

### 学べる内容

- **AZDの基本**: AZDを使ったInfrastructure as Codeの理解
- 🤖 **AIサービスの統合**: Azure OpenAI、AI Search、その他のAIサービスのデプロイ
- **コンテナデプロイ**: Azure Container Appsを使用したAIアプリケーションのデプロイ
- **セキュリティのベストプラクティス**: Managed Identityと安全な設定の実装
- **監視と可観測性**: AIワークロード向けのApplication Insightsの設定
- **運用パターン**: エンタープライズ向けのデプロイ戦略

## ワークショップ構成

### モジュール 1: AZDの基礎 (30分)
- AZDのインストールと設定
- AZDプロジェクト構造の理解
- 初めてのAZDデプロイ
- **ラボ**: シンプルなWebアプリケーションをデプロイ

### モジュール 2: Azure OpenAIの統合 (45分)
- Azure OpenAIリソースの設定
- モデルデプロイ戦略
- APIアクセスと認証の設定
- **ラボ**: GPT-4を使用したチャットアプリケーションをデプロイ

### モジュール 3: RAGアプリケーション (45分)
- Azure AI Searchの統合
- Azure Document Intelligenceを使用したドキュメント処理
- ベクトル埋め込みとセマンティック検索
- **ラボ**: ドキュメントQ&Aシステムを構築

### モジュール 4: 運用デプロイ (30分)
- Container Appsの設定
- スケーリングとパフォーマンス最適化
- 監視とログ記録
- **ラボ**: 可観測性を備えた運用環境にデプロイ

### モジュール 5: 高度なパターン (15分)
- 複数環境へのデプロイ
- CI/CDの統合
- コスト最適化戦略
- **まとめ**: 運用準備チェックリスト

## 前提条件

### 必要なツール

ワークショップ前に以下のツールをインストールしてください:

```bash
# Azure Developer CLI
curl -fsSL https://aka.ms/install-azd.sh | bash

# Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Git
sudo apt-get install git

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Python 3.10+
sudo apt-get install python3.10 python3.10-venv python3-pip
```

### Azureアカウントの設定

1. **Azureサブスクリプション**: [無料で登録](https://azure.microsoft.com/free/)  
2. **Azure OpenAIアクセス**: [アクセスをリクエスト](https://aka.ms/oai/access)  
3. **必要な権限**:
   - サブスクリプションまたはリソースグループのContributorロール
   - RBAC割り当てのためのUser Access Administrator

### 前提条件の確認

以下のスクリプトを実行してセットアップを確認してください:

```bash
#!/bin/bash
echo "Verifying workshop prerequisites..."

# Check AZD installation
if command -v azd &> /dev/null; then
    echo "✅ Azure Developer CLI: $(azd --version)"
else
    echo "❌ Azure Developer CLI not found"
fi

# Check Azure CLI
if command -v az &> /dev/null; then
    echo "✅ Azure CLI: $(az --version | head -n1)"
else
    echo "❌ Azure CLI not found"
fi

# Check Docker
if command -v docker &> /dev/null; then
    echo "✅ Docker: $(docker --version)"
else
    echo "❌ Docker not found"
fi

# Check Python
if command -v python3 &> /dev/null; then
    echo "✅ Python: $(python3 --version)"
else
    echo "❌ Python 3 not found"
fi

# Check Azure login
if az account show &> /dev/null; then
    echo "✅ Azure: Logged in as $(az account show --query user.name -o tsv)"
else
    echo "❌ Azure: Not logged in (run 'az login')"
fi

echo "Setup verification complete!"
```

## ワークショップ資料

### ラボ演習

各モジュールには、スターターコードとステップバイステップの指示が含まれたハンズオンラボがあります:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - 初めてのAZDデプロイ
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Azure OpenAIを使用したチャットアプリケーション
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - AI Searchを使用したRAGアプリケーション
- **[lab-4-production/](../../../workshop/lab-4-production)** - 運用デプロイパターン
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - 高度なデプロイシナリオ

### 参考資料

- **[AI Foundry Integration Guide](../docs/ai-foundry/azure-ai-foundry-integration.md)** - 包括的な統合パターン
- **[AI Model Deployment Guide](../docs/ai-foundry/ai-model-deployment.md)** - モデルデプロイのベストプラクティス
- **[Production AI Practices](../docs/ai-foundry/production-ai-practices.md)** - エンタープライズデプロイパターン
- **[AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md)** - よくある問題と解決策

### サンプルテンプレート

一般的なAIシナリオ向けのクイックスタートテンプレート:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## 始め方

### オプション 1: GitHub Codespaces (推奨)

ワークショップを始める最速の方法:

[![Open in GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### オプション 2: ローカル開発

1. **ワークショップリポジトリをクローン:**
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **Azureにログイン:**
```bash
az login
azd auth login
```

3. **ラボ1から開始:**
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### オプション 3: インストラクター主導のワークショップ

インストラクター主導のセッションに参加する場合:

- 🎥 **ワークショップ録画**: [オンデマンドで利用可能](https://aka.ms/azd-ai-workshop)  
- 💬 **Discordコミュニティ**: [ライブサポートに参加](https://aka.ms/foundry/discord)  
- **ワークショップフィードバック**: [体験を共有](https://aka.ms/azd-workshop-feedback)

## ワークショップタイムライン

### 自習形式 (3時間)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### インストラクター主導セッション (2.5時間)

```
⏰ 00:00 - 00:15  Welcome & Prerequisites Check
⏰ 00:15 - 00:40  Module 1: Live Demo + Lab
⏰ 00:40 - 01:20  Module 2: OpenAI Integration
⏰ 01:20 - 01:30  Break
⏰ 01:30 - 02:10  Module 3: RAG Applications
⏰ 02:10 - 02:30  Module 4: Production Patterns
⏰ 02:30 - 02:45  Module 5: Advanced Topics
⏰ 02:45 - 03:00  Q&A and Resources
```

## 成功基準

ワークショップ終了時には以下ができるようになります:

✅ **AZDテンプレートを使用してAIアプリケーションをデプロイ**  
✅ **Azure OpenAIサービスを適切なセキュリティ設定で構成**  
✅ **Azure AI Search統合を使用してRAGアプリケーションを構築**  
✅ **エンタープライズAIワークロード向けの運用パターンを実装**  
✅ **AIアプリケーションデプロイを監視およびトラブルシュート**  
✅ **AIワークロードのコスト最適化戦略を適用**

## コミュニティとサポート

### ワークショップ中

- 🙋 **質問**: ワークショップチャットを使用するか、手を挙げてください  
- 🐛 **問題**: [トラブルシューティングガイド](../docs/troubleshooting/ai-troubleshooting.md)を確認  
- **ヒント**: 他の参加者と発見を共有してください  

### ワークショップ後

- 💬 **Discord**: [Azure AI Foundry Community](https://aka.ms/foundry/discord)  
- **GitHub Issues**: [テンプレートの問題を報告](https://github.com/YOUR_ORG/AZD-for-beginners/issues)  
- 📧 **フィードバック**: [ワークショップ評価フォーム](https://aka.ms/azd-workshop-feedback)

## 次のステップ

### 学習を続ける

1. **高度なシナリオ**: [マルチリージョンデプロイ](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment)を探索  
2. **CI/CD統合**: [GitHub Actionsワークフロー](../docs/deployment/github-actions.md)を設定  
3. **カスタムテンプレート**: [AZDテンプレート](../docs/getting-started/custom-templates.md)を作成

### プロジェクトに適用

1. **評価**: [準備チェックリスト](./production-readiness-checklist.md)を使用  
2. **テンプレート**: [AI専用テンプレート](../../../workshop/templates)から開始  
3. **サポート**: [Azure AI Foundry Discord](https://aka.ms/foundry/discord)に参加

### 成果を共有

- ⭐ **リポジトリにスターを付ける**: このワークショップが役立った場合  
- 🐦 **ソーシャルメディアで共有**: #AzureDeveloperCLI #AzureAI  
- 📝 **ブログ投稿を書く**: AIデプロイの旅について

---

## ワークショップフィードバック

フィードバックはワークショップ体験の改善に役立ちます:

| 項目 | 評価 (1-5) | コメント |
|------|------------|----------|
| コンテンツの質 | ⭐⭐⭐⭐⭐ | |
| ハンズオンラボ | ⭐⭐⭐⭐⭐ | |
| ドキュメント | ⭐⭐⭐⭐⭐ | |
| 難易度 | ⭐⭐⭐⭐⭐ | |
| 全体的な体験 | ⭐⭐⭐⭐⭐ | |

**フィードバックを送信**: [ワークショップ評価フォーム](https://aka.ms/azd-workshop-feedback)

---

**前回:** [AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md) | **次回:** [Lab 1: AZD Basics](../../../workshop/lab-1-azd-basics)

**AZDを使ってAIアプリケーションの構築を始める準備はできましたか？**

[Lab 1: AZD Foundations →](./lab-1-azd-basics/README.md)

---

**免責事項**:  
この文書は、AI翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を追求しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知ください。元の言語で記載された文書が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用に起因する誤解や誤解釈について、当方は責任を負いません。