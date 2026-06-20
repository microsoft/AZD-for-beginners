# あなたの最初のプロジェクト - ハンズオンチュートリアル

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## はじめに

最初の Azure Developer CLI プロジェクトへようこそ！この包括的なハンズオンチュートリアルでは、azd を使用してフルスタックアプリケーションを Azure 上で作成、デプロイ、管理する手順をすべて説明します。React フロントエンド、Node.js API バックエンド、MongoDB データベースを含む実際の Todo アプリケーションを扱います。

## 学習目標

このチュートリアルを完了すると、次のことができるようになります:
- テンプレートを使用した azd プロジェクトの初期化ワークフローを習得する
- Azure Developer CLI プロジェクトの構成と設定ファイルを理解する
- インフラのプロビジョニングを含むアプリケーションの完全な Azure へのデプロイを実行する
- アプリケーションの更新と再デプロイ戦略を実装する
- 開発およびステージングのための複数環境を管理する
- リソースのクリーンアップとコスト管理の方法を適用する

## 学習成果

完了後、以下ができるようになります:
- テンプレートから独立して azd プロジェクトを初期化および構成する
- azd プロジェクト構造を効果的にナビゲートおよび変更する
- 単一コマンドでフルスタックアプリケーションを Azure にデプロイする
- 一般的なデプロイの問題や認証の問題をトラブルシューティングする
- 異なるデプロイ段階のために複数の Azure 環境を管理する
- アプリケーション更新のための継続的デプロイワークフローを実装する

## 開始方法

### 前提条件チェックリスト
- ✅ Azure Developer CLI がインストールされている ([Installation Guide](installation.md))
- ✅ `azd auth login` で AZD 認証が完了している
- ✅ Git がシステムにインストールされている
- ✅ Node.js 16+（このチュートリアル用）
- ✅ Visual Studio Code（推奨）

続行する前に、リポジトリのルートからセットアップバリデータを実行してください:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### セットアップの確認
```bash
# azd のインストールを確認する
azd version

# AZD の認証を確認する
azd auth login --check-status
```

### オプションの Azure CLI 認証を確認する

```bash
az account show
```

### Node.js のバージョンを確認
```bash
node --version
```

## ステップ 1: テンプレートの選択と初期化

React フロントエンドと Node.js API バックエンドを含む人気の Todo アプリケーションテンプレートから始めましょう。

```bash
# 利用可能なテンプレートを参照する
azd template list

# todo アプリのテンプレートを初期化する
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# 表示される指示に従ってください:
# - 環境名を入力: "dev"
# - サブスクリプションを選択 (複数ある場合)
# - リージョンを選択: "East US 2" (またはお好みの地域)
```

### 何が起きた？
- テンプレートコードがローカルディレクトリにダウンロードされました
- サービス定義を含む `azure.yaml` ファイルが作成されました
- `infra/` ディレクトリにインフラコードが設定されました
- 環境構成が作成されました

## ステップ 2: プロジェクト構成を確認する

azd が作成したものを確認しましょう:

```bash
# プロジェクトの構造を表示
tree /f   # Windows
# または
find . -type f | head -20   # macOS/Linux
```

次のようなものが表示されます:
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

### 理解しておくべき主要ファイル

**azure.yaml** - あなたの azd プロジェクトの中心:
```bash
# プロジェクトの構成を表示
cat azure.yaml
```

**infra/main.bicep** - インフラの定義:
```bash
# インフラストラクチャのコードを表示する
head -30 infra/main.bicep
```

## ステップ 3: プロジェクトのカスタマイズ（任意）

デプロイする前に、アプリケーションをカスタマイズできます:

### フロントエンドの変更
```bash
# React アプリのコンポーネントを開く
code src/web/src/App.tsx
```

簡単な変更を行う:
```typescript
// タイトルを見つけて変更してください
<h1>My Awesome Todo App</h1>
```

### 環境変数の設定
```bash
# カスタム環境変数を設定する
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# すべての環境変数を表示する
azd env get-values
```

## ステップ 4: Azure にデプロイする

さて、エキサイティングな部分です — すべてを Azure にデプロイしましょう！

```bash
# インフラストラクチャとアプリケーションをデプロイする
azd up

# このコマンドは次のことを実行します:
# 1. Azure のリソースをプロビジョニングする（App Service、Cosmos DB など）
# 2. アプリケーションをビルドする
# 3. プロビジョニングしたリソースにデプロイする
# 4. アプリケーションの URL を表示する
```

### デプロイ中に何が起きているか？

`azd up` コマンドは次のステップを実行します:
1. <strong>プロビジョニング</strong> (`azd provision`) - Azure リソースを作成します
2. <strong>パッケージ</strong> - アプリケーションコードをビルドします
3. <strong>デプロイ</strong> (`azd deploy`) - コードを Azure リソースにデプロイします

### 期待される出力
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## ステップ 5: アプリケーションをテストする

### アプリケーションへのアクセス
デプロイ出力に表示された URL をクリックするか、いつでも取得してください:
```bash
# アプリケーションのエンドポイントを取得する
azd show

# ブラウザでアプリケーションを開く
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo アプリをテストする
1. **To-do 項目を追加** - "Add Todo" をクリックしてタスクを入力します
2. <strong>完了にする</strong> - 完了した項目にチェックを入れます
3. <strong>項目を削除する</strong> - 不要な To-do を削除します

### アプリケーションの監視
```bash
# リソース用の Azure ポータルを開く
azd monitor

# アプリケーションログを表示する
azd monitor --logs

# ライブメトリクスを表示する
azd monitor --live
```

### ✅ デプロイの検証

先に進む前に、この簡単なチェックリストを実行してすべてが実際に動作していることを確認してください — 「デプロイに成功した」から「アプリが動作している」とは限りません:

```bash
# 1. エンドポイントが存在し、到達可能であることを確認する
azd show

# 2. エンドポイントのスモークテストを行う（HTTP 200を期待）
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. アプリが提供している場合は、ヘルスエンドポイントを確認する
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**デプロイが検証される条件:**
- ✅ `azd show` が到達可能なエンドポイント URL を一覧表示している
- ✅ ブラウザで URL を開いてエラーが出ない
- ✅ 主要な機能が動作する（追加/完了/削除）
- ✅ `azd monitor --logs` が予期しないエラーなしにリクエストを記録している

いずれかのチェックが失敗した場合は、[Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md) に移動してください。

## ステップ 6: 変更を行って再デプロイする

変更を加えて、更新がどれほど簡単かを確認しましょう:

### API を修正する
```bash
# APIコードを編集する
code src/api/src/routes/lists.js
```

カスタムのレスポンスヘッダーを追加:
```javascript
// ルートハンドラを見つけて、次を追加してください:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### コード変更のみをデプロイ
```bash
# アプリケーションコードのみをデプロイする（インフラはスキップ）
azd deploy

# インフラが既に存在するため、'azd up' よりもはるかに高速です
```

## ステップ 7: 複数環境の管理

本番前に変更をテストするためのステージング環境を作成します:

```bash
# 新しいステージング環境を作成する
azd env new staging

# ステージングにデプロイする
azd up

# 開発環境に戻す
azd env select dev

# すべての環境を一覧表示する
azd env list
```

### 環境の比較
```bash
# 開発環境を表示
azd env select dev
azd show

# ステージング環境を表示
azd env select staging
azd show
```

## ステップ 8: リソースのクリーンアップ

実験が終わったら、継続的な課金を避けるためにクリーンアップしてください:

```bash
# 現在の環境のすべての Azure リソースを削除する
azd down

# 確認なしで強制削除し、ソフト削除されたリソースをパージする
azd down --force --purge

# 特定の環境を削除する
azd env select staging
azd down --force --purge
```

## 従来アプリ vs. AI搭載アプリ: ワークフローは同じ

今デプロイしたのは従来型のウェブアプリケーションです。しかし、例えば Microsoft Foundry Models をバックエンドにしたチャットアプリのような AI 駆動アプリをデプロイしたい場合はどうでしょうか？

良いニュースは: **ワークフローは同一です。**

| Step | Classic Todo App | AI Chat App |
|------|-----------------|-------------|
| 初期化 | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| 認証 | `azd auth login` | `azd auth login` |
| デプロイ | `azd up` | `azd up` |
| 監視 | `azd monitor` | `azd monitor` |
| クリーンアップ | `azd down --force --purge` | `azd down --force --purge` |

違いは開始する <strong>テンプレート</strong> のみです。AI テンプレートには Microsoft Foundry Models リソースや AI Search インデックスなどの追加インフラが含まれることがありますが、azd はそれらをすべて処理します。新しいコマンドを学んだり、別のツールを採用したり、デプロイに対する考え方を変える必要はありません。

これは azd のコア原則です: **1つのワークフローで、どんなワークロードにも対応。** このチュートリアルで練習したスキル（初期化、デプロイ、監視、再デプロイ、クリーンアップ）は、AI アプリケーションやエージェントにも同様に適用されます。

---

## 学んだこと

おめでとうございます！次のことができるようになりました:
- ✅ テンプレートから azd プロジェクトを初期化した
- ✅ プロジェクト構造と主要ファイルを調査した
- ✅ フルスタックアプリケーションを Azure にデプロイした
- ✅ コードを変更して再デプロイした
- ✅ 複数環境を管理した
- ✅ リソースをクリーンアップした

## 🎯 スキル検証演習

### 演習 1: 別のテンプレートをデプロイする（15 分）
<strong>目標</strong>: azd init とデプロイワークフローの習熟を実証する

```bash
# Python + MongoDB スタックを試す
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# デプロイを検証する
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# クリーンアップする
azd down --force --purge
```

**成功基準:**
- [ ] アプリケーションがエラーなくデプロイされる
- [ ] ブラウザでアプリケーションの URL にアクセスできる
- [ ] アプリケーションが正しく機能する（追加/削除）
- [ ] すべてのリソースを正常にクリーンアップした

### 演習 2: 設定をカスタマイズする（20 分）
<strong>目標</strong>: 環境変数の設定を練習する

```bash
cd my-first-azd-app

# カスタム環境を作成する
azd env new custom-config

# カスタム変数を設定する
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# 変数を検証する
azd env get-values | grep APP_TITLE

# カスタム設定でデプロイする
azd up
```

**成功基準:**
- [ ] カスタム環境が正常に作成される
- [ ] 環境変数が設定され、取得可能である
- [ ] カスタム構成でアプリケーションがデプロイされる
- [ ] デプロイされたアプリでカスタム設定を確認できる

### 演習 3: マルチ環境ワークフロー（25 分）
<strong>目標</strong>: 環境管理とデプロイ戦略を習得する

```bash
# 開発環境を作成する
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# 開発環境のURLをメモする
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# ステージング環境を作成する
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# ステージング環境のURLをメモする
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# 環境を比較する
azd env list

# 両方の環境をテストする
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# 両方の環境をクリーンアップする
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**成功基準:**
- [ ] 異なる構成で 2 つの環境を作成する
- [ ] 両方の環境が正常にデプロイされる
- [ ] `azd env select` を使用して環境を切り替えられる
- [ ] 環境ごとに環境変数が異なる
- [ ] 両方の環境を正常にクリーンアップした

## 📊 進捗

<strong>投資時間</strong>: ~60-90 分  
<strong>習得スキル</strong>:
- ✅ テンプレートベースのプロジェクト初期化
- ✅ Azure リソースのプロビジョニング
- ✅ アプリケーションデプロイワークフロー
- ✅ 環境管理
- ✅ 構成管理
- ✅ リソースのクリーンアップとコスト管理

<strong>次のレベル</strong>: 上級の設定パターンを学ぶには [Configuration Guide](configuration.md) に進んでください！

## よくある問題のトラブルシューティング

### 認証エラー
```bash
# Azureで再認証する
az login

# サブスクリプションへのアクセスを確認する
az account show
```

### デプロイ失敗
```bash
# デバッグログを有効にする
export AZD_DEBUG=true
azd up --debug

# Azureでアプリケーションのログを表示する
azd monitor --logs

# Container Appsの場合は、Azure CLIを使用します:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### リソース名の競合
```bash
# 一意の環境名を使用してください
azd env new dev-$(whoami)-$(date +%s)
```

### ポート/ネットワークの問題
```bash
# ポートが使用可能かどうかを確認する
netstat -an | grep :3000
netstat -an | grep :3100
```

## 次のステップ

最初のプロジェクトを完了したので、次の高度なトピックを探検してください:

### 1. インフラをカスタマイズする
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add databases, storage, and other services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD を設定する
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - 完全な CI/CD ワークフロー
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - パイプラインの構成

### 3. 本番運用のベストプラクティス
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - セキュリティ、パフォーマンス、監視

### 4. さらにテンプレートを探る
```bash
# カテゴリ別にテンプレートを閲覧
azd template list --filter web
azd template list --filter api
azd template list --filter database

# さまざまな技術スタックを試す
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## 追加リソース

### 学習資料
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### コミュニティとサポート
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### テンプレートとサンプル
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**最初の azd プロジェクトの完了おめでとうございます！** これで自信を持って Azure 上に素晴らしいアプリケーションを構築・デプロイする準備ができました。

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->