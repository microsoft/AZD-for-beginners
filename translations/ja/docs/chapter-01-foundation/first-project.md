# あなたの最初のプロジェクト - ハンズオンチュートリアル

**章のナビゲーション:**
- **📚 Course Home**: [AZD 初心者向け](../../README.md)
- **📖 現在の章**: 第1章 - 基礎とクイックスタート
- **⬅️ 前へ**: [インストールとセットアップ](installation.md)
- **➡️ 次へ**: [構成](configuration.md)
- **🚀 次の章**: [第2章：AIファースト開発](../chapter-02-ai-development/microsoft-foundry-integration.md)

## はじめに

あなたの最初の Azure Developer CLI プロジェクトへようこそ！この包括的なハンズオンチュートリアルでは、azd を使ってフルスタックアプリケーションを Azure 上で作成、デプロイ、管理するための完全な手順を提供します。React フロントエンド、Node.js API バックエンド、MongoDB データベースを含む実際の todo アプリケーションを扱います。

## 学習目標

このチュートリアルを完了することで、あなたは以下を習得します:
- テンプレートを使用した azd プロジェクトの初期化ワークフローをマスターする
- Azure Developer CLI プロジェクトの構造と設定ファイルを理解する
- インフラのプロビジョニングを含むアプリケーションの完全な Azure へのデプロイを実行する
- アプリケーションの更新と再デプロイ戦略を実装する
- 開発およびステージング用の複数環境を管理する
- リソースのクリーンアップとコスト管理の手法を適用する

## 学習成果

完了後、あなたは次のことができるようになります:
- テンプレートから azd プロジェクトを独立して初期化および設定する
- azd プロジェクト構造を効果的にナビゲートおよび変更する
- 単一コマンドでフルスタックアプリケーションを Azure にデプロイする
- よくあるデプロイ問題や認証問題をトラブルシュートする
- 異なるデプロイ段階のために複数の Azure 環境を管理する
- アプリケーション更新のための継続的デプロイメントワークフローを実装する

## はじめ方

### 前提条件チェックリスト
- ✅ Azure Developer CLI がインストールされている ([インストールガイド](installation.md))
- ✅ Azure CLI がインストールされ、認証されている
- ✅ Git がシステムにインストールされている
- ✅ Node.js 16+（このチュートリアル用）
- ✅ Visual Studio Code（推奨）

### セットアップの確認
```bash
# azd のインストールを確認する
azd version
```
### Azure 認証の確認

```bash
az account show
```

### Node.js のバージョン確認
```bash
node --version
```

## ステップ 1: テンプレートの選択と初期化

人気のある todo アプリケーションのテンプレート（React フロントエンドと Node.js API バックエンドを含む）から始めましょう。

```bash
# 利用可能なテンプレートを参照する
azd template list

# todoアプリのテンプレートを初期化する
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# プロンプトに従ってください:
# - 環境名を入力: "dev"
# - サブスクリプションを選択する (複数ある場合)
# - リージョンを選択: "East US 2" (またはお好みのリージョン)
```

### 何が起こったのか?
- テンプレートコードがローカルディレクトリにダウンロードされました
- サービス定義を含む `azure.yaml` ファイルが作成されました
- `infra/` ディレクトリにインフラコードが設定されました
- 環境構成が作成されました

## ステップ 2: プロジェクト構成の確認

azd が作成したものを確認しましょう:

```bash
# プロジェクト構造を表示
tree /f   # Windows
# または
find . -type f | head -20   # macOS/Linux
```

次のものが表示されるはずです:
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
# プロジェクト構成を表示する
cat azure.yaml
```

**infra/main.bicep** - インフラ定義:
```bash
# インフラストラクチャのコードを表示する
head -30 infra/main.bicep
```

## ステップ 3: プロジェクトのカスタマイズ（任意）

デプロイ前にアプリケーションをカスタマイズできます:

### フロントエンドの変更
```bash
# Reactアプリのコンポーネントを開く
code src/web/src/App.tsx
```

簡単な変更を行う:
```typescript
// タイトルを見つけて変更する
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

## ステップ 4: Azure へのデプロイ

さあ、エキサイティングな部分です — すべてを Azure にデプロイしましょう！

```bash
# インフラストラクチャとアプリケーションをデプロイする
azd up

# このコマンドは次の操作を行います:
# 1. Azure リソースをプロビジョニングする（App Service、Cosmos DB など）
# 2. アプリケーションをビルドする
# 3. プロビジョニング済みのリソースにデプロイする
# 4. アプリケーションの URL を表示する
```

### デプロイ中に何が起きているか？

`azd up` コマンドは次の手順を実行します:
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
1. **Todo 項目を追加** - 「Add Todo」をクリックしてタスクを入力します
2. <strong>完了としてマーク</strong> - 完了した項目にチェックを入れます
3. <strong>項目を削除</strong> - 不要な todo を削除します

### アプリケーションの監視
```bash
# リソース用の Azure ポータルを開く
azd monitor

# アプリケーションのログを表示する
azd monitor --logs

# ライブメトリクスを表示する
azd monitor --live
```

## ステップ 6: 変更を行い再デプロイする

変更を加えて、更新がどれほど簡単か確認しましょう:

### API の変更
```bash
# APIのコードを編集する
code src/api/src/routes/lists.js
```

カスタムレスポンスヘッダーを追加:
```javascript
// ルートハンドラーを見つけて、次を追加してください:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### コード変更のみをデプロイする
```bash
# アプリケーションコードのみをデプロイする（インフラはスキップ）
azd deploy

# インフラが既に存在するため、'azd up' よりはるかに速い
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

# 確認を求めず強制削除し、ソフト削除されたリソースを完全に消去する
azd down --force --purge

# 特定の環境を削除する
azd env select staging
azd down --force --purge
```

## 伝統的なアプリ vs AI対応アプリ：同じワークフロー

あなたが導入したのは従来型の Web アプリケーションです。しかし、例えば Microsoft Foundry Models をバックエンドに持つチャットアプリなど、AI対応アプリをデプロイしたい場合はどうでしょうか？

良いニュース：**ワークフローは同一です。**

| ステップ | 従来の Todo アプリ | AI チャットアプリ |
|------|-----------------|-------------|
| 初期化 | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| 認証 | `azd auth login` | `azd auth login` |
| デプロイ | `azd up` | `azd up` |
| 監視 | `azd monitor` | `azd monitor` |
| クリーンアップ | `azd down --force --purge` | `azd down --force --purge` |

違いは開始する<strong>テンプレート</strong>だけです。AI テンプレートには追加のインフラ（Microsoft Foundry Models リソースや AI 検索インデックスなど）が含まれる場合がありますが、azd はそれらすべてを処理します。新しいコマンドを学んだり、別のツールを採用したり、デプロイ方法を変えたりする必要はありません。

これが azd の中核原則です：**ワンワークフロー、どんなワークロードでも。** このチュートリアルで練習したスキル（初期化、デプロイ、監視、再デプロイ、クリーンアップ）は、AI アプリケーションやエージェントにも同様に適用できます。

---

## 学んだこと

おめでとうございます！次のことを正常に行いました:
- ✅ テンプレートから azd プロジェクトを初期化した
- ✅ プロジェクト構造と主要ファイルを確認した
- ✅ フルスタックアプリケーションを Azure にデプロイした
- ✅ コードを変更して再デプロイした
- ✅ 複数の環境を管理した
- ✅ リソースをクリーンアップした

## 🎯 スキル確認演習

### 演習 1: 別のテンプレートをデプロイする（15 分）
<strong>目標</strong>: azd init とデプロイワークフローの習熟を示す

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
- [ ] アプリケーションが正しく動作する（todo の追加/削除）
- [ ] すべてのリソースが正常にクリーンアップされる

### 演習 2: 設定のカスタマイズ（20 分）
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
- [ ] 環境変数が設定され、取得できる
- [ ] カスタム構成でアプリケーションがデプロイされる
- [ ] デプロイされたアプリでカスタム設定を検証できる

### 演習 3: マルチ環境ワークフロー（25 分）
<strong>目標</strong>: 環境管理とデプロイ戦略を習得する

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
- [ ] 異なる構成を持つ2つの環境が作成される
- [ ] 両方の環境が正常にデプロイされる
- [ ] `azd env select` を使用して環境間を切り替えられる
- [ ] 環境ごとに環境変数が異なる
- [ ] 両方の環境を正常にクリーンアップした

## 📊 進捗

<strong>投入時間</strong>: 約60〜90分  
<strong>習得したスキル</strong>:
- ✅ テンプレートベースのプロジェクト初期化
- ✅ Azure リソースのプロビジョニング
- ✅ アプリケーションデプロイワークフロー
- ✅ 環境管理
- ✅ 設定管理
- ✅ リソースのクリーンアップとコスト管理

<strong>次のレベル</strong>: 高度な構成パターンを学ぶには [設定ガイド](configuration.md) に進みましょう！

## よくある問題のトラブルシューティング

### 認証エラー
```bash
# Azure に再認証する
az login

# サブスクリプションへのアクセスを確認する
az account show
```

### デプロイ失敗
```bash
# デバッグロギングを有効にする
export AZD_DEBUG=true
azd up --debug

# Azureでアプリケーションのログを表示する
azd monitor --logs

# Container Appsの場合は、Azure CLIを使用する:
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

最初のプロジェクトを完了したので、次の高度なトピックを確認してください:

### 1. インフラのカスタマイズ
- [コードによるインフラ](../chapter-04-infrastructure/provisioning.md)
- [データベース、ストレージ、その他のサービスの追加](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD の設定
- [デプロイガイド](../chapter-04-infrastructure/deployment-guide.md) - 完全な CI/CD ワークフロー
- [Azure Developer CLI ドキュメント](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - パイプラインの設定

### 3. 本番運用のベストプラクティス
- [デプロイガイド](../chapter-04-infrastructure/deployment-guide.md) - セキュリティ、パフォーマンス、監視

### 4. さらにテンプレートを探索する
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
- [Azure Developer CLI ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure アーキテクチャ センター](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected フレームワーク](https://learn.microsoft.com/en-us/azure/well-architected/)

### コミュニティとサポート
- [Azure Developer CLI の GitHub](https://github.com/Azure/azure-dev)
- [Azure 開発者コミュニティ](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### テンプレートとサンプル
- [公式テンプレートギャラリー](https://azure.github.io/awesome-azd/)
- [コミュニティテンプレート](https://github.com/Azure-Samples/azd-templates)
- [エンタープライズパターン](https://github.com/Azure/azure-dev/tree/main/templates)

---

**最初の azd プロジェクトの完了、おめでとうございます！** これで自信を持って Azure に素晴らしいアプリケーションを構築・デプロイする準備ができました。

---

**章のナビゲーション:**
- **📚 Course Home**: [AZD 初心者向け](../../README.md)
- **📖 現在の章**: 第1章 - 基礎とクイックスタート
- **⬅️ 前へ**: [インストールとセットアップ](installation.md)
- **➡️ 次へ**: [構成](configuration.md)
- **🚀 次の章**: [第2章：AIファースト開発](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Next Lesson**: [デプロイガイド](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:
この文書はAI翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されました。正確性の確保に努めていますが、自動翻訳には誤りや不正確な点が含まれる可能性があることにご留意ください。原文（原言語）の文書を信頼できる一次情報源とみなしてください。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の使用に起因するいかなる誤解や解釈の相違についても、当方は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->