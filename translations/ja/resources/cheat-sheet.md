# コマンド チートシート - 必須 AZD コマンド

<strong>すべての章のクイック参照</strong>
- **📚 コース ホーム**: [AZD 入門](../README.md)
- **📖 クイックスタート**: [第1章: 基礎とクイックスタート](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI コマンド**: [第2章: AIファースト開発](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 上級**: [第4章: インフラをコードとして](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## はじめに

この包括的なチートシートは、最も一般的に使用される Azure Developer CLI コマンドをカテゴリ別に実用的な例とともに整理して、クイック参照を提供します。開発、トラブルシューティング、および azd プロジェクトの日常運用中の迅速な参照に最適です。

## 学習目標

このチートシートを使用することで、次のことができます:
- 必須の Azure Developer CLI コマンドと構文に即座にアクセスできる
- 機能カテゴリやユースケース別のコマンド構成を理解できる
- 一般的な開発およびデプロイシナリオの実用的な例を参照できる
- 迅速な問題解決のためのトラブルシューティングコマンドにアクセスできる
- 高度な構成およびカスタマイズオプションを効率的に見つけることができる
- 環境管理やマルチ環境ワークフロー用のコマンドを見つけることができる

## 学習成果

このチートシートを定期的に参照することで、次のことができるようになります:
- ドキュメント全体を参照せずに自信を持って azd コマンドを実行できる
- 適切な診断コマンドを使用して一般的な問題を迅速に解決できる
- 複数の環境やデプロイシナリオを効率的に管理できる
- 必要に応じて高度な azd 機能および構成オプションを適用できる
- 体系的なコマンド手順を使用してデプロイの問題をトラブルシューティングできる
- azd のショートカットとオプションを効果的に使用してワークフローを最適化できる

## はじめにコマンド

### 認証
```bash
# AZD経由でAzureにログインする
azd auth login

# Azure CLIにログインする（AZDは内部でこれを使用します）
az login

# 現在のアカウントを確認する
az account show

# デフォルトのサブスクリプションを設定する
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZDからログアウトする
azd auth logout

# Azure CLIからログアウトする
az logout
```

### プロジェクト初期化
```bash
# 利用可能なテンプレートを参照
azd template list

# テンプレートから初期化
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# 現在のディレクトリで初期化
azd init .

# カスタム名で初期化
azd init --template todo-nodejs-mongo my-awesome-app
```

## コア デプロイ コマンド

### 完全なデプロイワークフロー
```bash
# すべてをデプロイする（プロビジョニング + デプロイ）
azd up

# 確認プロンプトを無効にしてデプロイする
azd up --confirm-with-no-prompt

# 特定の環境にデプロイする
azd up --environment production

# カスタムパラメータを指定してデプロイする
azd up --parameter location=westus2
```

### インフラのみ
```bash
# Azure リソースをプロビジョニングする
azd provision

# 🧪 インフラの変更をプレビュー
azd provision --preview
# 作成/変更/削除されるリソースをドライランで表示します
# 「terraform plan」や「bicep what-if」に似ています - 実行しても安全で、変更は適用されません
```

### アプリのみ
```bash
# アプリケーションコードをデプロイする
azd deploy

# 特定のサービスをデプロイする
azd deploy --service web
azd deploy --service api

# すべてのサービスをデプロイする
azd deploy --all
```

### ビルドとパッケージ
```bash
# アプリケーションをビルドする
azd package

# 特定のサービスをビルドする
azd package --service api
```

## 🌍 環境管理

### 環境操作
```bash
# すべての環境を一覧表示
azd env list

# 新しい環境を作成
azd env new development
azd env new staging --location westus2

# 環境を選択
azd env select production

# 現在の環境を表示
azd env show

# 環境の状態を更新
azd env refresh
```

### 環境変数
```bash
# 環境変数を設定する
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# 環境変数を取得する
azd env get API_KEY

# すべての環境変数を一覧表示する
azd env get-values

# 環境変数を削除する
azd env unset DEBUG
```

## ⚙️ 設定コマンド

### グローバル設定
```bash
# すべての設定を一覧表示
azd config list

# グローバルデフォルトを設定
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# 設定を削除
azd config unset defaults.location

# すべての設定をリセット
azd config reset
```

### プロジェクト設定
```bash
# azure.yaml を検証する
azd config validate

# プロジェクト情報を表示する
azd show

# サービスのエンドポイントを取得する
azd show --output json
```

## 📊 モニタリングと診断

### モニタリングダッシュボード
```bash
# Azure ポータルの監視ダッシュボードを開く
azd monitor

# Application Insights のライブ メトリクスを開く
azd monitor --live

# Application Insights のログ ブレードを開く
azd monitor --logs

# Application Insights の概要を開く
azd monitor --overview
```

### コンテナログの表示
```bash
# Azure CLI を使用してログを表示する（コンテナー アプリ用）
az containerapp logs show --name <app-name> --resource-group <rg-name>

# ログをリアルタイムで追跡する
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure ポータルからログを表示する
azd monitor --logs
```

### Log Analytics クエリ
```bash
# Azure ポータルから Log Analytics にアクセスする
azd monitor --logs

# Azure CLI を使用してログをクエリする
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ メンテナンスコマンド

### クリーンアップ
```bash
# すべての Azure リソースを削除する
azd down

# 確認なしで強制削除する
azd down --force

# ソフト削除されたリソースを完全に削除する
azd down --purge

# クリーンアップを完了する
azd down --force --purge
```

### 更新
```bash
# azd の更新を確認する
azd version

# 現在のバージョンを取得する
azd version

# 現在の構成を表示する
azd config list
```

## 🔧 高度なコマンド

### パイプラインと CI/CD
```bash
# GitHub Actions を構成する
azd pipeline config

# Azure DevOps を構成する
azd pipeline config --provider azdo

# パイプライン構成を表示する
azd pipeline show
```

### インフラ管理
```bash
# インフラストラクチャのテンプレートを生成する
azd infra generate

# 🧪 インフラのプレビューと計画
azd provision --preview
# デプロイせずにインフラのプロビジョニングをシミュレートする
# Bicep/Terraform テンプレートを解析して次を表示する:
# - 追加されるリソース (緑 +)
# - 変更されるリソース (黄 ~)
# - 削除されるリソース (赤 -)
# 実行しても安全です - Azure 環境には実際の変更は加えられません

# azure.yaml からインフラを合成する
azd infra synth
```

### プロジェクト情報
```bash
# プロジェクトのステータスとエンドポイントを表示
azd show

# JSONでプロジェクトの詳細情報を表示
azd show --output json

# サービスのエンドポイントを取得
azd show --output json | jq '.services'
```

## 🤖 AI と拡張コマンド

### AZD 拡張
```bash
# 利用可能な拡張機能をすべて表示（AIを含む）
azd extension list

# Foundry agents 拡張機能をインストールする
azd extension install azure.ai.agents

# ファインチューニング拡張機能をインストールする
azd extension install azure.ai.finetune

# カスタムモデル拡張機能をインストールする
azd extension install azure.ai.models

# インストール済みのすべての拡張機能をアップグレードする
azd extension upgrade --all
```

### AI エージェントコマンド
```bash
# マニフェストからエージェントプロジェクトを初期化する
azd ai agent init -m <manifest-path-or-uri>

# 特定のFoundryプロジェクトを対象にする
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# エージェントのソースディレクトリを指定する
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# ホスティング先を選択する
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP サーバー（アルファ）
```bash
# プロジェクトのMCPサーバーを起動する
azd mcp start

# MCP操作のためのツールの同意を管理する
azd mcp consent
```

### インフラ生成
```bash
# プロジェクト定義からIaCファイルを生成する
azd infra generate

# azure.yamlからインフラを生成する
azd infra synth
```

---

## 🎯 クイックワークフロー

### 開発ワークフロー
```bash
# 新しいプロジェクトを開始する
azd init --template todo-nodejs-mongo
cd my-project

# 開発環境にデプロイする
azd env new dev
azd up

# 変更を加えて再デプロイする
azd deploy

# 監視ダッシュボードを開く
azd monitor --live
```

### マルチ環境ワークフロー
```bash
# 環境をセットアップする
azd env new dev
azd env new staging  
azd env new production

# 開発環境にデプロイする
azd env select dev
azd up

# テストしてステージングに昇格する
azd env select staging
azd up

# 本番環境にデプロイする
azd env select production
azd up
```

### トラブルシューティングワークフロー
```bash
# デバッグモードを有効にする
export AZD_DEBUG=true

# デプロイの状態を確認する
azd show

# 設定を検証する
azd config list

# ログ用の監視ダッシュボードを開く
azd monitor --logs

# リソースの状態を確認する
azd show --output json
```

## 🔍 デバッグコマンド

### デバッグ情報
```bash
# デバッグ出力を有効にする
export AZD_DEBUG=true
azd <command> --debug

# 出力を見やすくするためにテレメトリを無効にする
export AZD_DISABLE_TELEMETRY=true

# 現在の設定を確認する
azd config list

# 認証状態を確認する
az account show
```

### テンプレートデバッグ
```bash
# 利用可能なテンプレートを詳細付きで一覧表示する
azd template list --output json

# テンプレートの情報を表示する
azd template show <template-name>

# 初期化する前にテンプレートを検証する
azd template validate <template-name>
```

## 📁 ファイルおよびディレクトリコマンド

### プロジェクト構成
```bash
# 現在のディレクトリ構造を表示する
tree /f  # Windows
find . -type f  # Linux/macOS

# azd プロジェクトのルートに移動する
cd $(azd root)

# azd の設定ディレクトリを表示する
echo $AZD_CONFIG_DIR  # 通常は ~/.azd
```

## 🎨 出力フォーマット

### JSON 出力
```bash
# スクリプト用にJSON出力を取得する
azd show --output json
azd env list --output json
azd config list --output json

# jqで解析する
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### テーブル出力
```bash
# 表形式で表示
azd env list --output table

# デプロイ済みサービスを表示
azd show --output json | jq '.services | keys'
```

## 🔧 よく使うコマンド組み合わせ

### ヘルスチェックスクリプト
```bash
#!/bin/bash
# 簡単なヘルスチェック
azd show
azd env show
azd monitor --logs
```

### デプロイ検証
```bash
#!/bin/bash
# デプロイ前の検証
azd show
azd provision --preview  # デプロイする前に変更をプレビューする
az account show
```

### 環境比較
```bash
#!/bin/bash
# 環境を比較する
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### リソースクリーンアップスクリプト
```bash
#!/bin/bash
# 古い環境をクリーンアップ
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 環境変数

### 一般的な環境変数
```bash
# Azure の構成
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD の構成
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# アプリケーションの構成
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 緊急コマンド

### クイックフィックス
```bash
# 認証をリセット
az account clear
az login

# 環境を強制的にリフレッシュ
azd env refresh

# すべてのサービスを再デプロイ
azd deploy

# デプロイの状態を確認
azd show --output json
```

### リカバリーコマンド
```bash
# デプロイの失敗から復旧する - クリーンアップして再デプロイ
azd down --force --purge
azd up

# インフラのみ再プロビジョニング
azd provision

# アプリケーションのみ再デプロイ
azd deploy
```

## 💡 プロのヒント

### 作業を速めるエイリアス
```bash
# あなたの .bashrc または .zshrc に追加してください
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### 関数ショートカット
```bash
# 迅速な環境切り替え
azd-env() {
    azd env select $1 && azd show
}

# 監視付きの迅速なデプロイ
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# 環境の状態
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 ヘルプとドキュメント

### ヘルプを得る
```bash
# 一般的なヘルプ
azd --help
azd help

# コマンド固有のヘルプ
azd up --help
azd env --help
azd config --help

# バージョンとビルド情報を表示
azd version
azd version --output json
```

### ドキュメントリンク
```bash
# ブラウザでドキュメントを開く
azd docs

# テンプレートのドキュメントを表示する
azd template show <template-name> --docs
```

---

<strong>ヒント</strong>: このチートシートをブックマークし、必要なコマンドを素早く見つけるには `Ctrl+F` を使用してください!

---

<strong>ナビゲーション</strong>
- <strong>前のレッスン</strong>: [事前チェック](../docs/pre-deployment/preflight-checks.md)
- <strong>次のレッスン</strong>: [用語集](glossary.md)

---

> **💡 エディタで Azure コマンドのヘルプが欲しいですか？** Install [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) with `npx skills add microsoft/github-copilot-for-azure` — AI、Foundry、デプロイ、診断など、37 のスキルが含まれます。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:
本書は AI 翻訳サービス [Co-op トランスレーター](https://github.com/Azure/co-op-translator) を使用して翻訳されました。正確性の確保に努めていますが、自動翻訳には誤りや不正確な表現が含まれる可能性があることにご注意ください。原文（原言語の文書）を正式な出典としてご確認ください。重要な情報については、専門の人による翻訳を推奨します。本翻訳の使用により生じたいかなる誤解や誤訳についても、当社は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->