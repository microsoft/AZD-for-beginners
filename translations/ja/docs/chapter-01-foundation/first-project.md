# あなたの最初のプロジェクト - ハンズオンチュートリアル

**チャプター ナビゲーション:**
- **📚 コースホーム**: [AZD 入門](../../README.md)
- **📖 現在の章**: 第1章 - 基礎とクイックスタート
- **⬅️ 前へ**: [インストールとセットアップ](installation.md)
- **➡️ 次へ**: [構成](configuration.md)
- **🚀 次の章**: [第2章: AIファースト開発](../chapter-02-ai-development/microsoft-foundry-integration.md)

## はじめに

あなたの最初の Azure Developer CLI プロジェクトへようこそ！この包括的なハンズオンチュートリアルでは、azd を使用して Azure 上にフルスタックアプリケーションを作成、デプロイ、管理する方法を段階的に説明します。React フロントエンド、Node.js API バックエンド、MongoDB データベースを含む実際の todo アプリケーションを扱います。

## 学習目標

このチュートリアルを完了すると、以下ができるようになります:
- テンプレートを使った azd プロジェクトの初期化ワークフローを習得する
- Azure Developer CLI プロジェクトの構造と設定ファイルを理解する
- インフラのプロビジョニングを含むアプリケーションの完全な Azure へのデプロイを実行する
- アプリケーションの更新と再デプロイ戦略を実装する
- 開発およびステージングのための複数環境を管理する
- リソースのクリーンアップとコスト管理の実践を適用する

## 学習成果

完了時には、以下のことができるようになります:
- テンプレートから azd プロジェクトを独力で初期化および設定する
- azd プロジェクト構造を効果的にナビゲートおよび変更する
- 単一コマンドでフルスタックアプリケーションを Azure にデプロイする
- 一般的なデプロイの問題や認証の問題をトラブルシュートする
- 異なるデプロイ段階のために複数の Azure 環境を管理する
- アプリケーションの更新のための継続的デプロイワークフローを実装する

## はじめる前に

### 前提条件チェックリスト
- ✅ Azure Developer CLI がインストールされている（[Installation Guide](installation.md)）
- ✅ Azure CLI がインストールされ認証されている
- ✅ システムに Git がインストールされている
- ✅ Node.js 16+（このチュートリアル用）
- ✅ Visual Studio Code（推奨）

### セットアップの確認
```bash
# azd のインストールを確認する
azd version
```
### Azure の認証を確認する

```bash
az account show
```

### Node.js バージョンの確認
```bash
node --version
```

## ステップ 1: テンプレートの選択と初期化

React フロントエンドと Node.js API バックエンドを含む人気の todo アプリテンプレートから始めましょう。

```bash
# 利用可能なテンプレートを閲覧する
azd template list

# todo アプリのテンプレートを初期化する
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# プロンプトに従ってください:
# - 環境名を入力してください: "dev"
# - サブスクリプションを選択してください (複数ある場合)
# - リージョンを選択してください: "East US 2" (またはお好みのリージョン)
```

### 何が起こったのか？
- テンプレートコードがローカルディレクトリにダウンロードされました
- サービス定義を含む `azure.yaml` ファイルが作成されました
- `infra/` ディレクトリにインフラコードがセットアップされました
- 環境構成が作成されました

## ステップ 2: プロジェクト構造を調べる

azd が作成したものを確認しましょう:

```bash
# プロジェクト構成を表示
tree /f   # Windows
# または
find . -type f | head -20   # macOS/Linux
```

次のものが見えるはずです:
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
# プロジェクトの設定を表示する
cat azure.yaml
```

**infra/main.bicep** - インフラ定義:
```bash
# インフラストラクチャのコードを表示する
head -30 infra/main.bicep
```

## ステップ 3: プロジェクトをカスタマイズする（任意）

デプロイする前にアプリケーションをカスタマイズできます:

### フロントエンドの変更
```bash
# Reactアプリのコンポーネントを開く
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

## ステップ 4: Azure へデプロイ

いよいよエキサイティングな部分です — すべてを Azure にデプロイしましょう！

```bash
# インフラとアプリケーションをデプロイする
azd up

# このコマンドは次の操作を行います:
# 1. Azure リソースをプロビジョニングする（App Service、Cosmos DB など）
# 2. アプリケーションをビルドする
# 3. プロビジョニングしたリソースにデプロイする
# 4. アプリケーションの URL を表示する
```

### デプロイ中に何が起きているか？

`azd up` コマンドは次のステップを実行します:
1. **プロビジョニング** (`azd provision`) - Azure リソースを作成します
2. **パッケージ** - アプリケーションコードをビルドします
3. **デプロイ** (`azd deploy`) - コードを Azure リソースにデプロイします

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

### アプリケーションへのアクセス
デプロイ出力に表示された URL をクリックするか、いつでも取得してください:
```bash
# アプリケーションのエンドポイントを取得する
azd show

# ブラウザでアプリケーションを開く
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo アプリのテスト
1. **Todo 項目を追加する** - 「Todo を追加」をクリックしてタスクを入力します
2. **完了としてマークする** - 完了した項目にチェックを入れます
3. **項目を削除する** - もう必要ない todo を削除します

### アプリケーションの監視
```bash
# リソース用の Azure ポータルを開く
azd monitor

# アプリケーションのログを表示する
azd monitor --logs

# ライブ メトリクスを表示する
azd monitor --live
```

## ステップ 6: 変更を加えて再デプロイ

変更を加えて、更新がどれほど簡単か確認しましょう:

### API の修正
```bash
# APIコードを編集する
code src/api/src/routes/lists.js
```

カスタム応答ヘッダーを追加:
```javascript
// ルートハンドラーを見つけて、次を追加してください:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### コード変更だけをデプロイ
```bash
# アプリケーションコードのみをデプロイする（インフラはスキップ）
azd deploy

# インフラは既に存在するため、'azd up' よりもはるかに高速です
```

## ステップ 7: 複数環境の管理

本番前に変更をテストするためのステージング環境を作成します:

```bash
# 新しいステージング環境を作成する
azd env new staging

# ステージングにデプロイする
azd up

# 開発環境に切り替える
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
# 現在の環境の Azure リソースをすべて削除する
azd down

# 確認なしで強制削除し、ソフト削除されたリソースをパージする
azd down --force --purge

# 特定の環境を削除する
azd env select staging
azd down --force --purge
```

## 学んだこと

おめでとうございます！あなたは次のことに成功しました:
- ✅ テンプレートから azd プロジェクトを初期化した
- ✅ プロジェクト構造と主要ファイルを調べた
- ✅ フルスタックアプリケーションを Azure にデプロイした
- ✅ コード変更を行い再デプロイした
- ✅ 複数の環境を管理した
- ✅ リソースをクリーンアップした

## 🎯 スキル確認演習

### 演習 1: 別のテンプレートをデプロイする（15 分）
**目標**: azd init とデプロイワークフローの習熟を実証する

```bash
# Python + MongoDB スタックを試す
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# デプロイを確認する
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# クリーンアップする
azd down --force --purge
```

**成功基準:**
- [ ] アプリケーションがエラーなくデプロイされる
- [ ] ブラウザでアプリケーションの URL にアクセスできる
- [ ] アプリケーションが正しく動作する（todo の追加/削除）
- [ ] すべてのリソースを正常にクリーンアップした

### 演習 2: 設定のカスタマイズ（20 分）
**目標**: 環境変数設定の実践

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

# カスタム構成でデプロイする
azd up
```

**成功基準:**
- [ ] カスタム環境が正常に作成される
- [ ] 環境変数が設定され取得できる
- [ ] カスタム構成でアプリケーションがデプロイされる
- [ ] デプロイ済みアプリでカスタム設定を確認できる

### 演習 3: マルチ環境ワークフロー（25 分）
**目標**: 環境管理とデプロイ戦略の習得

```bash
# 開発環境を作成する
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# 開発環境のURLを記録する
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# ステージング環境を作成する
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# ステージング環境のURLを記録する
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
- [ ] 異なる構成を持つ 2 つの環境が作成される
- [ ] 両方の環境が正常にデプロイされる
- [ ] `azd env select` を使用して環境を切り替えられる
- [ ] 環境ごとに環境変数が異なる
- [ ] 両方の環境を正常にクリーンアップした

## 📊 あなたの進捗

**投資時間**: 約 60-90 分  
**獲得スキル**:
- ✅ テンプレートベースのプロジェクト初期化
- ✅ Azure リソースのプロビジョニング
- ✅ アプリケーションデプロイワークフロー
- ✅ 環境管理
- ✅ 構成管理
- ✅ リソースクリーンアップとコスト管理

**次のステップ**: 高度な構成パターンを学ぶには [Configuration Guide](configuration.md) を参照してください！

## よくある問題のトラブルシューティング

### 認証エラー
```bash
# Azure に再認証する
az login

# サブスクリプションへのアクセス権を確認する
az account show
```

### デプロイ失敗
```bash
# デバッグログを有効にする
export AZD_DEBUG=true
azd up --debug

# Azureでアプリケーションのログを表示する
azd monitor --logs

# Container Apps の場合は、Azure CLI を使用します:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### リソース名の競合
```bash
# 一意の環境名を使用してください
azd env new dev-$(whoami)-$(date +%s)
```

### ポート/ネットワークの問題
```bash
# ポートが利用可能か確認する
netstat -an | grep :3000
netstat -an | grep :3100
```

## 次のステップ

最初のプロジェクトを完了したので、以下の高度なトピックを探検しましょう:

### 1. インフラをカスタマイズする
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add databases, storage, and other services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD を設定する
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - 完全な CI/CD ワークフロー
- [Azure Developer CLI ドキュメント](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - パイプライン設定

### 3. 本番運用のベストプラクティス
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - セキュリティ、パフォーマンス、監視

### 4. もっとテンプレートを探る
```bash
# カテゴリ別にテンプレートを閲覧する
azd template list --filter web
azd template list --filter api
azd template list --filter database

# 異なる技術スタックを試す
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## 参考資料

### 学習資料
- [Azure Developer CLI ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### コミュニティとサポート
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### テンプレートと例
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**最初の azd プロジェクトの完了おめでとうございます！** これで自信を持って Azure 上に素晴らしいアプリケーションを構築・デプロイする準備ができました。

---

**チャプター ナビゲーション:**
- **📚 コースホーム**: [AZD 入門](../../README.md)
- **📖 現在の章**: 第1章 - 基礎とクイックスタート
- **⬅️ 前へ**: [インストールとセットアップ](installation.md)
- **➡️ 次へ**: [構成](configuration.md)
- **🚀 次の章**: [第2章: AIファースト開発](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **次のレッスン**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責事項：
本書は AI 翻訳サービス「Co-op Translator」（https://github.com/Azure/co-op-translator）を用いて翻訳されました。正確さを期しておりますが、自動翻訳には誤りや不正確な部分が含まれることがあります。重要な情報については専門の人による翻訳を推奨します。原文（原言語版）を正式な資料としてご確認ください。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->