<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ba67ea0b26574a03ffcade6c98a9af60",
  "translation_date": "2025-11-19T18:39:33+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "ja"
}
-->
# 初めてのプロジェクト - ハンズオンチュートリアル

**章ナビゲーション:**
- **📚 コースホーム**: [AZD 初心者向け](../../README.md)
- **📖 現在の章**: 第1章 - 基礎とクイックスタート
- **⬅️ 前へ**: [インストールとセットアップ](installation.md)
- **➡️ 次へ**: [設定](configuration.md)
- **🚀 次の章**: [第2章: AIファースト開発](../microsoft-foundry/microsoft-foundry-integration.md)

## はじめに

Azure Developer CLI プロジェクトへようこそ！この包括的なハンズオンチュートリアルでは、azd を使用して Azure 上でフルスタックアプリケーションを作成、デプロイ、管理する方法を完全に解説します。React フロントエンド、Node.js API バックエンド、MongoDB データベースを含む実際の Todo アプリケーションを使用します。

## 学習目標

このチュートリアルを完了することで、以下を習得できます:
- テンプレートを使用した azd プロジェクト初期化ワークフローのマスター
- Azure Developer CLI プロジェクト構造と設定ファイルの理解
- インフラストラクチャのプロビジョニングを含むアプリケーションの完全な Azure へのデプロイ
- アプリケーションの更新と再デプロイ戦略の実装
- 開発およびステージング用の複数環境の管理
- リソースのクリーンアップとコスト管理の実践

## 学習成果

完了後、以下ができるようになります:
- テンプレートから azd プロジェクトを独立して初期化および設定
- azd プロジェクト構造を効果的にナビゲートおよび変更
- 単一コマンドでフルスタックアプリケーションを Azure にデプロイ
- 一般的なデプロイ問題や認証問題のトラブルシューティング
- 異なるデプロイ段階のための複数の Azure 環境を管理
- アプリケーション更新のための継続的デプロイワークフローを実装

## 始めましょう

### 必要条件チェックリスト
- ✅ Azure Developer CLI がインストール済み ([インストールガイド](installation.md))
- ✅ Azure CLI がインストールされ、認証済み
- ✅ Git がシステムにインストール済み
- ✅ Node.js 16+ (このチュートリアル用)
- ✅ Visual Studio Code (推奨)

### セットアップの確認
```bash
# azdのインストールを確認
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
# 利用可能なテンプレートを閲覧する
azd template list

# ToDoアプリのテンプレートを初期化する
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# プロンプトに従う:
# - 環境名を入力する: "dev"
# - サブスクリプションを選択する（複数ある場合）
# - リージョンを選択する: "East US 2"（または希望のリージョン）
```

### 何が起こったのか？
- テンプレートコードがローカルディレクトリにダウンロードされました
- サービス定義を含む `azure.yaml` ファイルが作成されました
- `infra/` ディレクトリにインフラストラクチャコードが設定されました
- 環境設定が作成されました

## ステップ 2: プロジェクト構造を探索

azd が作成したものを確認しましょう:

```bash
# プロジェクト構造を表示する
tree /f   # Windows
# または
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
# プロジェクト構成を表示
cat azure.yaml
```

**infra/main.bicep** - インフラストラクチャ定義:
```bash
# インフラストラクチャコードを表示
head -30 infra/main.bicep
```

## ステップ 3: プロジェクトのカスタマイズ (オプション)

デプロイ前にアプリケーションをカスタマイズできます:

### フロントエンドの変更
```bash
# Reactアプリコンポーネントを開く
code src/web/src/App.tsx
```

簡単な変更を加えます:
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

いよいよエキサイティングな部分です - すべてを Azure にデプロイしましょう！

```bash
# インフラストラクチャとアプリケーションをデプロイする
azd up

# このコマンドは以下を行います:
# 1. Azureリソース（App Service、Cosmos DBなど）をプロビジョニングする
# 2. アプリケーションをビルドする
# 3. プロビジョニングされたリソースにデプロイする
# 4. アプリケーションのURLを表示する
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

## ステップ 5: アプリケーションをテスト

### アプリケーションにアクセス
デプロイ出力に表示された URL をクリックするか、いつでも取得できます:
```bash
# アプリケーションのエンドポイントを取得する
azd show

# ブラウザでアプリケーションを開く
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo アプリをテスト
1. **Todo アイテムを追加** - 「Add Todo」をクリックしてタスクを入力
2. **完了としてマーク** - 完了したアイテムにチェックを入れる
3. **アイテムを削除** - 不要な Todo を削除

### アプリケーションを監視
```bash
# リソース用のAzureポータルを開く
azd monitor

# アプリケーションログを表示する
azd logs
```

## ステップ 6: 変更を加えて再デプロイ

変更を加えて、更新がどれほど簡単かを確認しましょう:

### API の変更
```bash
# APIコードを編集する
code src/api/src/routes/lists.js
```

カスタムレスポンスヘッダーを追加:
```javascript
// ルートハンドラーを見つけて追加します:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### コード変更のみをデプロイ
```bash
# アプリケーションコードのみをデプロイする（インフラストラクチャをスキップ）
azd deploy

# インフラストラクチャが既に存在するため、'azd up' よりもはるかに高速です
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

実験が終わったら、継続的な料金を避けるためにクリーンアップを行いましょう:

```bash
# 現在の環境のすべてのAzureリソースを削除する
azd down

# 確認なしで強制削除し、ソフト削除されたリソースを完全に削除する
azd down --force --purge

# 特定の環境を削除する
azd env select staging
azd down --force --purge
```

## 学んだこと

おめでとうございます！以下を成功させました:
- ✅ テンプレートから azd プロジェクトを初期化
- ✅ プロジェクト構造と主要ファイルを探索
- ✅ フルスタックアプリケーションを Azure にデプロイ
- ✅ コード変更を加えて再デプロイ
- ✅ 複数環境を管理
- ✅ リソースをクリーンアップ

## 🎯 スキル検証演習

### 演習 1: 別のテンプレートをデプロイ (15分)
**目標**: azd init とデプロイワークフローの習熟を示す

```bash
# Python + MongoDBスタックを試す
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
- [ ] ブラウザでアプリケーション URL にアクセス可能
- [ ] アプリケーションが正しく機能する (Todo の追加/削除)
- [ ] すべてのリソースを正常にクリーンアップ

### 演習 2: 設定のカスタマイズ (20分)
**目標**: 環境変数設定の練習

```bash
cd my-first-azd-app

# カスタム環境を作成する
azd env new custom-config

# カスタム変数を設定する
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# 変数を確認する
azd env get-values | grep APP_TITLE

# カスタム構成でデプロイする
azd up
```

**成功基準:**
- [ ] カスタム環境が正常に作成される
- [ ] 環境変数が設定され、取得可能
- [ ] カスタム設定でアプリケーションがデプロイされる
- [ ] デプロイされたアプリでカスタム設定を確認可能

### 演習 3: マルチ環境ワークフロー (25分)
**目標**: 環境管理とデプロイ戦略の習熟

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
- [ ] 異なる設定で2つの環境が作成される
- [ ] 両方の環境が正常にデプロイされる
- [ ] `azd env select` を使用して環境を切り替え可能
- [ ] 環境変数が環境ごとに異なる
- [ ] 両方の環境を正常にクリーンアップ

## 📊 あなたの進捗

**投資時間**: 約60～90分  
**習得スキル**:
- ✅ テンプレートベースのプロジェクト初期化
- ✅ Azure リソースのプロビジョニング
- ✅ アプリケーションデプロイワークフロー
- ✅ 環境管理
- ✅ 設定管理
- ✅ リソースクリーンアップとコスト管理

**次のステップ**: [設定ガイド](configuration.md) で高度な設定パターンを学びましょう！

## 一般的な問題のトラブルシューティング

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

# 詳細なログを表示する
azd logs --service api
azd logs --service web
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

最初のプロジェクトを完了したので、以下の高度なトピックを探求しましょう:

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

### 4. 他のテンプレートを探る
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

**最初の azd プロジェクトを完了おめでとうございます！** これで Azure 上で素晴らしいアプリケーションを自信を持って構築・デプロイする準備が整いました。

---

**章ナビゲーション:**
- **📚 コースホーム**: [AZD 初心者向け](../../README.md)
- **📖 現在の章**: 第1章 - 基礎とクイックスタート
- **⬅️ 前へ**: [インストールとセットアップ](installation.md)
- **➡️ 次へ**: [設定](configuration.md)
- **🚀 次の章**: [第2章: AIファースト開発](../microsoft-foundry/microsoft-foundry-integration.md)
- **次のレッスン**: [デプロイメントガイド](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:  
この文書は、AI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性を期すよう努めておりますが、自動翻訳には誤りや不正確さが含まれる可能性があります。原文（元の言語で記載された文書）を公式な情報源としてご参照ください。重要な情報については、専門の人間による翻訳をお勧めします。本翻訳の使用に起因する誤解や誤認について、当方は一切の責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->