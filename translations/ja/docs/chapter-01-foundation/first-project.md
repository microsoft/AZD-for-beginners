# あなたの最初のプロジェクト - ハンズオンチュートリアル

**章ナビゲーション:**
- **📚 コースホーム**: [AZD For Beginners](../../README.md)
- **📖 現在の章**: 第1章 - 基礎とクイックスタート
- **⬅️ 前へ**: [インストールとセットアップ](installation.md)
- **➡️ 次へ**: [構成](configuration.md)
- **🚀 次の章**: [第2章: AIファースト開発](../chapter-02-ai-development/microsoft-foundry-integration.md)

## はじめに

最初の Azure Developer CLI プロジェクトへようこそ！この包括的なハンズオンチュートリアルでは、azd を使って Azure 上にフルスタックアプリケーションを作成、デプロイ、管理する一連の手順を解説します。React フロントエンド、Node.js API バックエンド、MongoDB データベースを含む実際の todo アプリケーションを扱います。

## 学習目標

このチュートリアルを完了すると、以下ができるようになります：
- テンプレートを使用した azd プロジェクトの初期化ワークフローの習得
- Azure Developer CLI プロジェクト構造と設定ファイルの理解
- インフラストラクチャのプロビジョニングを含むアプリケーションの完全な Azure へのデプロイ実行
- アプリケーションの更新および再デプロイ戦略の実装
- 開発およびステージングの複数環境管理
- リソースクリーンアップとコスト管理の実践

## 学習成果

完了すると、次ができるようになります：
- テンプレートから azd プロジェクトを独力で初期化・設定
- azd プロジェクト構造の効果的なナビゲートと修正
- フルスタックアプリケーションを単一コマンドで Azure にデプロイ
- 一般的なデプロイ問題と認証問題のトラブルシューティング
- 異なるデプロイ段階向けの複数 Azure 環境の管理
- アプリケーション更新の継続的デプロイワークフローの実装

## はじめに

### 前提チェックリスト
- ✅ Azure Developer CLI インストール済み ([インストールガイド](installation.md))
- ✅ `azd auth login` による AZD 認証完了
- ✅ システムに Git インストール済み
- ✅ Node.js 16以上（このチュートリアル用）
- ✅ Visual Studio Code（推奨）

続行する前にリポジトリのルートからセットアップバリデータを実行してください：

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### セットアップ確認
```bash
# azdのインストールを確認する
azd version

# AZDの認証を確認する
azd auth login --check-status
```

### Azure CLI 認証の任意確認

```bash
az account show
```

### Node.js バージョン確認
```bash
node --version
```

## ステップ 1: テンプレートの選択と初期化

React フロントエンドと Node.js API バックエンドを含む人気の todo アプリケーションテンプレートから始めましょう。

```bash
# 利用可能なテンプレートを参照してください
azd template list

# Todoアプリのテンプレートを初期化します
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# プロンプトに従ってください：
# - 環境名を入力してください: "dev"
# - サブスクリプションを選択してください（複数ある場合）
# - リージョンを選択してください: "East US 2"（または希望のリージョン）
```

### 何が起こったのか？
- テンプレートコードがローカルディレクトリにダウンロードされた
- サービス定義を含む `azure.yaml` ファイルが作成された
- `infra/` ディレクトリにインフラコードがセットアップされた
- 環境構成が作成された

## ステップ 2: プロジェクト構造の確認

azd が何を作成したのか見てみましょう：

```bash
# プロジェクト構造を見る
tree /f   # Windows
# または
find . -type f | head -20   # macOS/Linux
```

次のものが表示されるはずです：
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

**azure.yaml** - azd プロジェクトの心臓部：
```bash
# プロジェクトの設定を表示する
cat azure.yaml
```

**infra/main.bicep** - インフラ定義：
```bash
# インフラコードを見る
head -30 infra/main.bicep
```

## ステップ 3: プロジェクトのカスタマイズ（任意）

デプロイ前にアプリケーションをカスタマイズできます：

### フロントエンドの修正
```bash
# Reactアプリコンポーネントを開く
code src/web/src/App.tsx
```

簡単な変更を加えます：
```typescript
// タイトルを探して変更する
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

いよいよワクワクの部分 - すべてを Azure にデプロイしましょう！

```bash
# インフラストラクチャとアプリケーションをデプロイする
azd up

# このコマンドは以下を実行します：
# 1. Azure リソース（App Service、Cosmos DB など）をプロビジョニングする
# 2. アプリケーションをビルドする
# 3. プロビジョニングされたリソースにデプロイする
# 4. アプリケーションのURLを表示する
```

### デプロイ時に何が起きているのか？

`azd up` コマンドは以下のステップを実行します：
1. <strong>プロビジョン</strong> (`azd provision`) - Azure リソースの作成
2. <strong>パッケージ</strong> - アプリケーションコードのビルド
3. <strong>デプロイ</strong> (`azd deploy`) - コードを Azure リソースにデプロイ

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

### アプリケーションへアクセス
デプロイ出力に表示される URL をクリック、またはいつでも確認できます：
```bash
# アプリケーションのエンドポイントを取得します
azd show

# ブラウザでアプリケーションを開きます
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo アプリのテスト
1. **todo アイテムを追加** - 「Add Todo」をクリックしてタスクを入力
2. <strong>完了済みにマーク</strong> - 完了した項目にチェックを入れる
3. <strong>アイテムを削除</strong> - もう必要ない todo を削除

### アプリケーションの監視
```bash
# リソースのために Azure ポータルを開く
azd monitor

# アプリケーションログを表示する
azd monitor --logs

# ライブメトリクスを表示する
azd monitor --live
```

## ステップ 6: 変更を加えて再デプロイ

変更を加えて、更新がどれほど簡単か見てみましょう：

### API の修正
```bash
# APIコードを編集する
code src/api/src/routes/lists.js
```

カスタムレスポンスヘッダーを追加：
```javascript
// ルートハンドラーを見つけて、次を追加してください:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### コード変更のみをデプロイ
```bash
# アプリケーションコードのみをデプロイします（インフラはスキップ）
azd deploy

# インフラが既に存在するため、'azd up' よりもはるかに高速です
```

## ステップ 7: 複数環境の管理

本番前のテスト用にステージング環境を作成します：

```bash
# 新しいステージング環境を作成する
azd env new staging

# ステージングにデプロイする
azd up

# 開発環境に戻る
azd env select dev

# すべての環境を一覧表示する
azd env list
```

### 環境の比較
```bash
# 開発環境を見る
azd env select dev
azd show

# ステージング環境を見る
azd env select staging
azd show
```

## ステップ 8: リソースのクリーンアップ

実験が終わったら、継続課金を避けるためにクリーンアップしましょう：

```bash
# 現在の環境のすべてのAzureリソースを削除する
azd down

# 確認なしで強制削除し、ソフト削除されたリソースを完全に削除する
azd down --force --purge

# 特定の環境を削除する
azd env select staging
azd down --force --purge
```

## 従来アプリ vs. AI搭載アプリ：同じワークフロー

今デプロイしたのは伝統的なウェブアプリケーションです。では、Microsoft Foundry Models を使ったチャットアプリなど AI搭載アプリをデプロイしたい場合はどうでしょう？

良いニュースは：**ワークフローは全く同じです。**

| ステップ | 従来の Todo アプリ | AI チャットアプリ |
|------|-----------------|-------------|
| 初期化 | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| 認証 | `azd auth login` | `azd auth login` |
| デプロイ | `azd up` | `azd up` |
| 監視 | `azd monitor` | `azd monitor` |
| クリーンアップ | `azd down --force --purge` | `azd down --force --purge` |

唯一の違いは使う<strong>テンプレート</strong>です。AIテンプレートは Microsoft Foundry Models リソースや AI Search インデックスなどの追加インフラを含みますが、azd はそれらすべてを処理します。新しいコマンドを覚えたり、異なるツールを採用したり、デプロイ方法を変えたりする必要はありません。

これが azd の核心理念です：**ひとつのワークフロー、どんなワークロードでも。** このチュートリアルで練習した初期化、デプロイ、監視、再デプロイ、クリーンアップのスキルは AI アプリケーションやエージェントにも同様に適用されます。

---

## 学んだこと

おめでとうございます！次のことができるようになりました：
- ✅ テンプレートから azd プロジェクトを初期化
- ✅ プロジェクト構造と主要ファイルを理解
- ✅ フルスタックアプリケーションを Azure にデプロイ
- ✅ コード変更を行い再デプロイ
- ✅ 複数環境を管理
- ✅ リソースのクリーンアップ

## 🎯 スキル検証演習

### 演習 1: 別のテンプレートをデプロイ (15 分)
<strong>目的</strong>: azd init とデプロイワークフローの習得を示す

```bash
# Python + MongoDBスタックを試す
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# デプロイメントを確認する
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# クリーンアップする
azd down --force --purge
```

**成功基準:**
- [ ] アプリケーションがエラーなくデプロイされる
- [ ] ブラウザでアプリケーションの URL にアクセス可能
- [ ] アプリが正しく動作する（todo の追加/削除）
- [ ] すべてのリソースを正常にクリーンアップできる

### 演習 2: 設定のカスタマイズ (20 分)
<strong>目的</strong>: 環境変数設定の練習

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
- [ ] 環境変数が設定され取得可能
- [ ] カスタム構成でアプリがデプロイされる
- [ ] デプロイされたアプリで設定を検証可能

### 演習 3: 複数環境ワークフロー (25 分)
<strong>目的</strong>: 環境管理とデプロイ戦略の習得

```bash
# 開発環境を作成する
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# 開発用URLを記録する
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# ステージング環境を作成する
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# ステージング用URLを記録する
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# 環境を比較する
azd env list

# 両方の環境をテストする
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# 両方をクリーンアップする
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**成功基準:**
- [ ] 設定が異なる2つの環境を作成
- [ ] 両環境が正常にデプロイされる
- [ ] `azd env select` で環境切り替え可能
- [ ] 環境間で環境変数が異なる
- [ ] 両環境を正常にクリーンアップできる

## 📊 進捗状況

<strong>かかった時間</strong>: 約60〜90分  
<strong>習得スキル</strong>:
- ✅ テンプレートベースのプロジェクト初期化
- ✅ Azure リソースのプロビジョニング
- ✅ アプリケーションデプロイワークフロー
- ✅ 環境管理
- ✅ 設定管理
- ✅ リソースクリーンアップとコスト管理

<strong>次のレベル</strong>: [構成ガイド](configuration.md) を読んで高度な設定パターンを学びましょう！

## よくある問題のトラブルシューティング

### 認証エラー
```bash
# Azureで再認証する
az login

# サブスクリプションアクセスを確認する
az account show
```

### デプロイ失敗
```bash
# デバッグログを有効にする
export AZD_DEBUG=true
azd up --debug

# Azureでアプリケーションログを表示する
azd monitor --logs

# コンテナーアプリの場合、Azure CLIを使用してください：
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### リソース名の競合
```bash
# ユニークな環境名を使用してください
azd env new dev-$(whoami)-$(date +%s)
```

### ポート/ネットワークの問題
```bash
# ポートが使用可能かどうかを確認してください
netstat -an | grep :3000
netstat -an | grep :3100
```

## 次のステップ

最初のプロジェクトを完了したので、これらの高度なトピックを探求しましょう：

### 1. インフラのカスタマイズ
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [データベース、ストレージ、サービスの追加](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD のセットアップ
- [デプロイガイド](../chapter-04-infrastructure/deployment-guide.md) - 完全な CI/CD ワークフロー
- [Azure Developer CLI ドキュメント](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - パイプライン設定

### 3. 本番環境のベストプラクティス
- [デプロイガイド](../chapter-04-infrastructure/deployment-guide.md) - セキュリティ、パフォーマンス、監視

### 4. もっとテンプレートを調べる
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

## 追加リソース

### 学習資料
- [Azure Developer CLI ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### コミュニティ＆サポート
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### テンプレート＆サンプル
- [公式テンプレートギャラリー](https://azure.github.io/awesome-azd/)
- [コミュニティテンプレート](https://github.com/Azure-Samples/azd-templates)
- [エンタープライズパターン](https://github.com/Azure/azure-dev/tree/main/templates)

---

**最初の azd プロジェクトの完了おめでとうございます！** これで自信を持って Azure 上に素晴らしいアプリケーションを構築しデプロイできます。

---

**章ナビゲーション:**
- **📚 コースホーム**: [AZD For Beginners](../../README.md)
- **📖 現在の章**: 第1章 - 基礎とクイックスタート
- **⬅️ 前へ**: [インストールとセットアップ](installation.md)
- **➡️ 次へ**: [構成](configuration.md)
- **🚀 次の章**: [第2章: AIファースト開発](../chapter-02-ai-development/microsoft-foundry-integration.md)
- <strong>次のレッスン</strong>: [デプロイガイド](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:  
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性に努めていますが、自動翻訳には誤りや不正確な部分が含まれる可能性があります。原文のネイティブ言語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の使用に起因する誤解や誤訳について、当方は一切責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->