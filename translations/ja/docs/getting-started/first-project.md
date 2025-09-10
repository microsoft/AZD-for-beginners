<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d0054b58dbf5baa786403593d848de4a",
  "translation_date": "2025-09-10T12:58:09+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "ja"
}
-->
# 初めてのプロジェクト - 実践チュートリアル

## はじめに

Azure Developer CLIプロジェクトへようこそ！この包括的な実践チュートリアルでは、azdを使用してAzure上でフルスタックアプリケーションを作成、デプロイ、管理する方法を完全に解説します。Reactフロントエンド、Node.js APIバックエンド、MongoDBデータベースを含む実際のTodoアプリケーションを扱います。

## 学習目標

このチュートリアルを完了することで、以下を習得できます：
- テンプレートを使用したazdプロジェクトの初期化ワークフロー
- Azure Developer CLIプロジェクト構造と設定ファイルの理解
- インフラストラクチャのプロビジョニングを含むアプリケーションの完全なAzureへのデプロイ
- アプリケーションの更新と再デプロイ戦略の実装
- 開発およびステージング用の複数環境の管理
- リソースのクリーンアップとコスト管理の実践

## 学習成果

完了後、以下ができるようになります：
- テンプレートから独立してazdプロジェクトを初期化および設定
- azdプロジェクト構造を効果的にナビゲートおよび変更
- 単一コマンドでフルスタックアプリケーションをAzureにデプロイ
- 一般的なデプロイ問題や認証問題のトラブルシューティング
- 異なるデプロイ段階のための複数のAzure環境を管理
- アプリケーション更新のための継続的デプロイワークフローを実装

## 始める前に

### 必要条件チェックリスト
- ✅ Azure Developer CLIインストール済み ([インストールガイド](installation.md))
- ✅ Azure CLIインストール済みおよび認証済み
- ✅ Gitがシステムにインストール済み
- ✅ Node.js 16以上（このチュートリアル用）
- ✅ Visual Studio Code（推奨）

### セットアップの確認
```bash
# Check azd installation
azd version
```
### Azure認証の確認

```bash
az account show
```

### Node.jsバージョンの確認
```bash
node --version
```

## ステップ1: テンプレートの選択と初期化

ReactフロントエンドとNode.js APIバックエンドを含む人気のTodoアプリケーションテンプレートから始めましょう。

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
- サービス定義を含む`azure.yaml`ファイルが作成されました
- `infra/`ディレクトリにインフラストラクチャコードが設定されました
- 環境設定が作成されました

## ステップ2: プロジェクト構造を探索

azdが作成した内容を確認しましょう：

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

以下が表示されるはずです：
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

**azure.yaml** - azdプロジェクトの中心：
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - インフラストラクチャ定義：
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## ステップ3: プロジェクトのカスタマイズ（オプション）

デプロイ前にアプリケーションをカスタマイズできます：

### フロントエンドの変更
```bash
# Open the React app component
code src/web/src/App.tsx
```

簡単な変更を加えます：
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

## ステップ4: Azureへのデプロイ

いよいよ、すべてをAzureにデプロイします！

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

`azd up`コマンドは以下のステップを実行します：
1. **プロビジョン** (`azd provision`) - Azureリソースを作成
2. **パッケージ** - アプリケーションコードをビルド
3. **デプロイ** (`azd deploy`) - コードをAzureリソースにデプロイ

### 期待される出力
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## ステップ5: アプリケーションのテスト

### アプリケーションへのアクセス
デプロイ出力で提供されたURLをクリックするか、いつでも取得できます：
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Todoアプリのテスト
1. **Todoアイテムを追加** - 「Add Todo」をクリックしてタスクを入力
2. **完了としてマーク** - 完了したアイテムをチェック
3. **アイテムを削除** - 不要なTodoを削除

### アプリケーションの監視
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## ステップ6: 変更を加えて再デプロイ

変更を加えて、更新がどれほど簡単か確認しましょう：

### APIの変更
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

カスタムレスポンスヘッダーを追加：
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

## ステップ7: 複数環境の管理

本番前に変更をテストするためのステージング環境を作成：

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

## ステップ8: リソースのクリーンアップ

実験が終わったら、継続的な料金を避けるためにクリーンアップを行います：

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

おめでとうございます！以下を成功させました：
- テンプレートからazdプロジェクトを初期化
- プロジェクト構造と主要ファイルを探索
- フルスタックアプリケーションをAzureにデプロイ
- コード変更を加えて再デプロイ
- 複数環境を管理
- リソースをクリーンアップ

## よくある問題のトラブルシューティング

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

### ポート/ネットワーク問題
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## 次のステップ

初めてのプロジェクトを完了したので、以下の高度なトピックを探索してください：

### 1. インフラストラクチャのカスタマイズ
- [コードとしてのインフラストラクチャ](../deployment/provisioning.md)
- [データベース、ストレージ、その他のサービスの追加](../deployment/provisioning.md#adding-services)

### 2. CI/CDの設定
- [GitHub Actionsの統合](../deployment/cicd-integration.md)
- [Azure DevOpsパイプライン](../deployment/cicd-integration.md#azure-devops)

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
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### テンプレートと例
- [公式テンプレートギャラリー](https://azure.github.io/awesome-azd/)
- [コミュニティテンプレート](https://github.com/Azure-Samples/azd-templates)
- [エンタープライズパターン](https://github.com/Azure/azure-dev/tree/main/templates)

---

**初めてのazdプロジェクトを完了おめでとうございます！** これでAzure上で素晴らしいアプリケーションを自信を持って構築・デプロイする準備が整いました。

---

**ナビゲーション**
- **前のレッスン**: [設定](configuration.md)
- **次のレッスン**: [デプロイガイド](../deployment/deployment-guide.md)

---

**免責事項**:  
この文書はAI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性を追求しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があります。元の言語で記載された文書が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用に起因する誤解や誤解について、当社は責任を負いません。