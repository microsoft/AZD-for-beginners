<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "88986b920b82d096f82d6583f5e0a6e6",
  "translation_date": "2025-09-17T14:14:41+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "ja"
}
-->
# AZD 基礎 - Azure Developer CLI の理解

# AZD 基礎 - 核となる概念と基本事項

**章のナビゲーション:**
- **📚 コースホーム**: [AZD 初心者向け](../../README.md)
- **📖 現在の章**: 第1章 - 基礎とクイックスタート
- **⬅️ 前章**: [コース概要](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ 次章**: [インストールとセットアップ](installation.md)
- **🚀 次の章**: [第2章: AI優先の開発](../ai-foundry/azure-ai-foundry-integration.md)

## はじめに

このレッスンでは、Azure Developer CLI (azd) を紹介します。これは、ローカル開発からAzureへのデプロイを加速する強力なコマンドラインツールです。基本的な概念、主要な機能を学び、azd がクラウドネイティブアプリケーションのデプロイをどのように簡素化するかを理解します。

## 学習目標

このレッスンの終わりまでに、以下を理解できるようになります:
- Azure Developer CLI の目的とその基本的な役割
- テンプレート、環境、サービスの基本概念を学ぶ
- テンプレート駆動型開発やInfrastructure as Codeの主要な機能を探る
- azd プロジェクトの構造とワークフローを理解する
- 開発環境に azd をインストールして設定する準備を整える

## 学習成果

このレッスンを完了すると、以下ができるようになります:
- azd が現代のクラウド開発ワークフローで果たす役割を説明する
- azd プロジェクト構造の構成要素を特定する
- テンプレート、環境、サービスがどのように連携するかを説明する
- azd を使用したInfrastructure as Codeの利点を理解する
- azd のさまざまなコマンドとその目的を認識する

## Azure Developer CLI (azd) とは？

Azure Developer CLI (azd) は、ローカル開発からAzureへのデプロイを加速するために設計されたコマンドラインツールです。クラウドネイティブアプリケーションの構築、デプロイ、管理プロセスを簡素化します。

## 核となる概念

### テンプレート
テンプレートは azd の基盤です。以下を含みます:
- **アプリケーションコード** - ソースコードと依存関係
- **インフラ定義** - Bicep または Terraform で定義された Azure リソース
- **設定ファイル** - 設定と環境変数
- **デプロイメントスクリプト** - 自動化されたデプロイメントワークフロー

### 環境
環境は異なるデプロイメントターゲットを表します:
- **開発** - テストと開発用
- **ステージング** - 本番前環境
- **本番** - 実際の運用環境

各環境は以下を個別に保持します:
- Azure リソースグループ
- 設定情報
- デプロイメント状態

### サービス
サービスはアプリケーションの構成要素です:
- **フロントエンド** - Webアプリケーション、SPA
- **バックエンド** - API、マイクロサービス
- **データベース** - データストレージソリューション
- **ストレージ** - ファイルやBlobストレージ

## 主要な機能

### 1. テンプレート駆動型開発
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastructure as Code
- **Bicep** - Azure のドメイン固有言語
- **Terraform** - マルチクラウドインフラツール
- **ARM テンプレート** - Azure Resource Manager テンプレート

### 3. 統合ワークフロー
```bash
# Complete deployment workflow
azd up            # Provision + Deploy this is hands off for first time setup
azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
azd down          # Clean up resources
```

### 4. 環境管理
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 プロジェクト構造

典型的な azd プロジェクト構造:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 設定ファイル

### azure.yaml
主要なプロジェクト設定ファイル:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
環境固有の設定:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 一般的なワークフロー

### 新しいプロジェクトの開始
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### 開発サイクル
```bash
# Set up development environment
azd auth login
azd env new dev
azd env select dev

# Deploy everything
azd up

# Make changes and redeploy
azd deploy

# Clean up when done
azd down --force --purge # command in the Azure Developer CLI is a **hard reset** for your environment—especially useful when you're troubleshooting failed deployments, cleaning up orphaned resources, or prepping for a fresh redeploy.
```

## `azd down --force --purge` の理解
`azd down --force --purge` コマンドは、azd 環境と関連するすべてのリソースを完全に削除する強力な方法です。各フラグの機能は以下の通りです:
```
--force
```
- 確認プロンプトをスキップします。
- 手動入力が難しい自動化やスクリプトに便利です。
- CLI が不整合を検出しても、削除が中断されないようにします。

```
--purge
```
**すべての関連メタデータ**を削除します。これには以下が含まれます:
環境状態
ローカル `.azure` フォルダー
キャッシュされたデプロイ情報
以前のデプロイメントを azd が「記憶」しないようにし、リソースグループの不一致や古いレジストリ参照などの問題を防ぎます。

### 両方を使用する理由
`azd up` が残存状態や部分的なデプロイメントのために問題を引き起こした場合、この組み合わせは**完全なリセット**を保証します。

特に、Azure ポータルで手動でリソースを削除した後や、テンプレート、環境、リソースグループ命名規則を切り替える際に役立ちます。

### 複数環境の管理
```bash
# Create staging environment
azd env new staging
azd env select staging
azd up

# Switch back to dev
azd env select dev

# Compare environments
azd env list
```

## 🧭 ナビゲーションコマンド

### 発見
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### プロジェクト管理
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### モニタリング
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## ベストプラクティス

### 1. 意味のある名前を使用する
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. テンプレートを活用する
- 既存のテンプレートから始める
- ニーズに合わせてカスタマイズする
- 組織向けに再利用可能なテンプレートを作成する

### 3. 環境の分離
- 開発/ステージング/本番用に別々の環境を使用する
- ローカルマシンから直接本番にデプロイしない
- 本番デプロイにはCI/CDパイプラインを使用する

### 4. 設定管理
- 機密データには環境変数を使用する
- 設定をバージョン管理に保存する
- 環境固有の設定を文書化する

## 学習の進行

### 初級 (1〜2週目)
1. azd をインストールして認証する
2. シンプルなテンプレートをデプロイする
3. プロジェクト構造を理解する
4. 基本的なコマンド (up, down, deploy) を学ぶ

### 中級 (3〜4週目)
1. テンプレートをカスタマイズする
2. 複数環境を管理する
3. インフラコードを理解する
4. CI/CD パイプラインを設定する

### 上級 (5週目以降)
1. カスタムテンプレートを作成する
2. 高度なインフラパターンを学ぶ
3. マルチリージョンデプロイメントを行う
4. エンタープライズ向けの設定を構築する

## 次のステップ

**📖 第1章の学習を続ける:**
- [インストールとセットアップ](installation.md) - azd をインストールして設定する
- [最初のプロジェクト](first-project.md) - 実践的なチュートリアルを完了する
- [設定ガイド](configuration.md) - 高度な設定オプション

**🎯 次の章に進む準備はできましたか？**
- [第2章: AI優先の開発](../ai-foundry/azure-ai-foundry-integration.md) - AIアプリケーションの構築を開始する

## 追加リソース

- [Azure Developer CLI 概要](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [テンプレートギャラリー](https://azure.github.io/awesome-azd/)
- [コミュニティサンプル](https://github.com/Azure-Samples)

---

**章のナビゲーション:**
- **📚 コースホーム**: [AZD 初心者向け](../../README.md)
- **📖 現在の章**: 第1章 - 基礎とクイックスタート  
- **⬅️ 前章**: [コース概要](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ 次章**: [インストールとセットアップ](installation.md)
- **🚀 次の章**: [第2章: AI優先の開発](../ai-foundry/azure-ai-foundry-integration.md)

---

**免責事項**:  
この文書はAI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性を追求しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があります。元の言語で記載された文書を正式な情報源としてご参照ください。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用に起因する誤解や誤解釈について、当方は責任を負いません。