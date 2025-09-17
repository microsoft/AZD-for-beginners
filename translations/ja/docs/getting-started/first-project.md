<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "67ffbcceec008228c4d22c1b3585844c",
  "translation_date": "2025-09-17T14:13:21+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "ja"
}
-->
# 初めてのプロジェクト - ハンズオンチュートリアル

**章のナビゲーション:**
- **📚 コースホーム**: [AZD For Beginners](../../README.md)
- **📖 現在の章**: 第1章 - 基礎とクイックスタート
- **⬅️ 前へ**: [インストールとセットアップ](installation.md)
- **➡️ 次へ**: [設定](configuration.md)
- **🚀 次の章**: [第2章: AIファースト開発](../ai-foundry/azure-ai-foundry-integration.md)

## はじめに

Azure Developer CLI プロジェクトへようこそ！この包括的なハンズオンチュートリアルでは、azd を使用して Azure 上でフルスタックアプリケーションを作成、デプロイ、管理する方法を完全に解説します。React フロントエンド、Node.js API バックエンド、MongoDB データベースを含む実際の Todo アプリケーションを扱います。

## 学習目標

このチュートリアルを完了することで、以下を習得できます:
- テンプレートを使用した azd プロジェクトの初期化ワークフロー
- Azure Developer CLI プロジェクトの構造と設定ファイルの理解
- インフラストラクチャのプロビジョニングを含むアプリケーションの完全なデプロイ
- アプリケーションの更新と再デプロイ戦略の実装
- 開発およびステージング用の複数環境の管理
- リソースのクリーンアップとコスト管理の実践

## 学習成果

このチュートリアルを完了すると、以下ができるようになります:
- テンプレートから azd プロジェクトを独立して初期化および設定
- azd プロジェクト構造を効果的にナビゲートおよび変更
- 単一コマンドでフルスタックアプリケーションを Azure にデプロイ
- 一般的なデプロイの問題や認証の問題をトラブルシュート
- 異なるデプロイ段階のための複数の Azure 環境を管理
- アプリケーション更新のための継続的デプロイワークフローを実装

## 始める前に

### 必要条件チェックリスト
- ✅ Azure Developer CLI がインストール済み ([インストールガイド](installation.md))
- ✅ Azure CLI がインストールされ、認証済み
- ✅ Git がシステムにインストール済み
- ✅ Node.js 16+（このチュートリアル用）
- ✅ Visual Studio Code（推奨）

### セットアップの確認
```bash
# Check azd installation
azd version
```
### Azure 認証の確認

```bash
az account show
```

### Node.js バージョンの確認
```bash
node --version
```

## ステップ 1: テンプレートの選択と初期化

React フロントエンドと Node.js API バックエンドを含む人気の Todo アプリケーションテンプレートから始めましょう。

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### 何が起こったのか？
- テンプレートコードがローカルディレクトリにダウンロードされました
- サービス定義を含む `azure.yaml` ファイルが作成されました
- `infra/` ディレクトリにインフラストラクチャコードが設定されました
- 環境設定が作成されました

## ステップ 2: プロジェクト構造を探索

azd が作成した内容を確認しましょう:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

以下が表示されるはずです:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### 理解すべき主要ファイル

**azure.yaml** - azd プロジェクトの中心:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - インフラストラクチャ定義:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## ステップ 3: プロジェクトのカスタマイズ（オプション）

デプロイ前にアプリケーションをカスタマイズできます:

### フロントエンドの変更
```bash
# Open the React app component
code src/web/src/App.tsx
```

簡単な変更を加えます:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### 環境変数の設定
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## ステップ 4: Azure へのデプロイ

いよいよ本番です - すべてを Azure にデプロイしましょう！

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### デプロイ中に何が起こるのか？

`azd up` コマンドは以下のステップを実行します:
1. **プロビジョニング** (`azd provision`) - Azure リソースを作成
2. **パッケージ化** - アプリケーションコードをビルド
3. **デプロイ** (`azd deploy`) - コードを Azure リソースにデプロイ

### 期待される出力
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## ステップ 5: アプリケーションのテスト

### アプリケーションにアクセス
デプロイ出力に表示された URL をクリックするか、いつでも以下を使用して取得できます:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo アプリのテスト
1. **Todo アイテムを追加** - 「Add Todo」をクリックしてタスクを入力
2. **完了としてマーク** - 完了したアイテムにチェックを入れる
3. **アイテムを削除** - 不要な Todo を削除

### アプリケーションの監視
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## ステップ 6: 変更を加えて再デプロイ

変更を加え、更新がどれほど簡単か確認しましょう:

### API の変更
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

カスタムレスポンスヘッダーを追加:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### コード変更のみをデプロイ
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## ステップ 7: 複数環境の管理

本番前に変更をテストするためのステージング環境を作成:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### 環境の比較
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## ステップ 8: リソースのクリーンアップ

実験が終わったら、継続的な料金を避けるためにクリーンアップを実行:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## 学んだこと

おめでとうございます！以下を成功させました:
- テンプレートから azd プロジェクトを初期化
- プロジェクト構造と主要ファイルを探索
- フルスタックアプリケーションを Azure にデプロイ
- コード変更を加えて再デプロイ
- 複数環境を管理
- リソースをクリーンアップ

## 一般的な問題のトラブルシューティング

### 認証エラー
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### デプロイ失敗
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### リソース名の競合
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### ポート/ネットワークの問題
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## 次のステップ

最初のプロジェクトを完了したら、以下の高度なトピックを探求してください:

### 1. インフラストラクチャのカスタマイズ
- [コードとしてのインフラストラクチャ](../deployment/provisioning.md)
- [データベース、ストレージ、その他のサービスの追加](../deployment/provisioning.md#adding-services)

### 2. CI/CD のセットアップ
- [GitHub Actions の統合](../deployment/cicd-integration.md)
- [Azure DevOps パイプライン](../deployment/cicd-integration.md#azure-devops)

### 3. 本番環境のベストプラクティス
- [セキュリティ設定](../deployment/best-practices.md#security)
- [パフォーマンス最適化](../deployment/best-practices.md#performance)
- [監視とログ](../deployment/best-practices.md#monitoring)

### 4. その他のテンプレートを探索
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## 追加リソース

### 学習資料
- [Azure Developer CLI ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure アーキテクチャセンター](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### コミュニティとサポート
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer コミュニティ](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### テンプレートと例
- [公式テンプレートギャラリー](https://azure.github.io/awesome-azd/)
- [コミュニティテンプレート](https://github.com/Azure-Samples/azd-templates)
- [エンタープライズパターン](https://github.com/Azure/azure-dev/tree/main/templates)

---

**初めての azd プロジェクトを完了したことをおめでとうございます！** これで、Azure 上で素晴らしいアプリケーションを自信を持って構築・デプロイする準備が整いました。

---

**章のナビゲーション:**
- **📚 コースホーム**: [AZD For Beginners](../../README.md)
- **📖 現在の章**: 第1章 - 基礎とクイックスタート
- **⬅️ 前へ**: [インストールとセットアップ](installation.md)
- **➡️ 次へ**: [設定](configuration.md)
- **🚀 次の章**: [第2章: AIファースト開発](../ai-foundry/azure-ai-foundry-integration.md)
- **次のレッスン**: [デプロイメントガイド](../deployment/deployment-guide.md)

---

**免責事項**:  
この文書は、AI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性を追求しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があります。元の言語で記載された文書を正式な情報源としてご参照ください。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用に起因する誤解や誤解釈について、当方は責任を負いません。