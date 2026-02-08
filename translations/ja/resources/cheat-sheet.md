# コマンド チートシート - 必須の AZD コマンド

**全章のクイックリファレンス**
- **📚 コースホーム**: [AZD 入門](../README.md)
- **📖 クイックスタート**: [第1章: 基礎とクイックスタート](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI コマンド**: [第2章: AIファースト開発](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 高度**: [第4章: インフラをコード化](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## 導入

この包括的なチートシートは、カテゴリ別に整理され、実用的な例を含む、最も一般的に使用される Azure Developer CLI コマンドのクイックリファレンスを提供します。開発中、トラブルシューティング時、azd プロジェクトの日常運用で素早く参照するのに最適です。

## 学習目標

このチートシートを利用することで、次のことができます:
- 必須の Azure Developer CLI コマンドと構文に即座にアクセスできる
- 機能別カテゴリやユースケースごとのコマンド構成を理解する
- 一般的な開発およびデプロイのシナリオに対する実用的な例を参照できる
- 問題解決のためのトラブルシューティングコマンドにアクセスできる
- 高度な設定やカスタマイズオプションを効率的に見つける
- 環境管理やマルチ環境ワークフローのコマンドを見つける

## 学習成果

このチートシートを定期的に参照することで、次のことができるようになります:
- 完全なドキュメントを参照せずに azd コマンドを自信を持って実行できる
- 適切な診断コマンドを使用して一般的な問題を迅速に解決できる
- 複数の環境やデプロイシナリオを効率的に管理できる
- 必要に応じて高度な azd 機能や設定オプションを適用できる
- 体系的なコマンドシーケンスを使用してデプロイの問題をトラブルシュートできる
- azd のショートカットやオプションを効果的に使用してワークフローを最適化できる

## 開始コマンド

### 認証
```bash
# AZD 経由で Azure にログイン
azd auth login

# Azure CLI にログイン（AZD は内部的にこれを使用します）
az login

# 現在のアカウントを確認
az account show

# 既定のサブスクリプションを設定
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD からログアウト
azd auth logout

# Azure CLI からログアウト
az logout
```

### プロジェクトの初期化
```bash
# 利用可能なテンプレートを閲覧
azd template list

# テンプレートから初期化
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# 現在のディレクトリで初期化
azd init .

# カスタム名で初期化
azd init --template todo-nodejs-mongo my-awesome-app
```

## コアデプロイコマンド

### 完全なデプロイワークフロー
```bash
# すべてをデプロイ（プロビジョニング＋デプロイ）
azd up

# 確認プロンプトを無効にしてデプロイ
azd up --confirm-with-no-prompt

# 特定の環境にデプロイ
azd up --environment production

# カスタムパラメータでデプロイ
azd up --parameter location=westus2
```

### インフラのみ
```bash
# Azure リソースをプロビジョニングする
azd provision

# 🧪 インフラの変更をプレビューする
azd provision --preview
# 作成・変更・削除されるリソースをドライランで表示します
# 'terraform plan' や 'bicep what-if' に似ています - 実行しても安全で、変更は適用されません
```

### アプリケーションのみ
```bash
# アプリケーションのコードをデプロイする
azd deploy

# 特定のサービスをデプロイする
azd deploy --service web
azd deploy --service api

# すべてのサービスをデプロイする
azd deploy --all
```

### ビルドとパッケージ
```bash
# アプリケーションを構築する
azd package

# 特定のサービスを構築する
azd package --service api
```

## 🌍 環境管理

### 環境操作
```bash
# すべての環境を一覧表示する
azd env list

# 新しい環境を作成する
azd env new development
azd env new staging --location westus2

# 環境を選択する
azd env select production

# 現在の環境を表示する
azd env show

# 環境の状態を更新する
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

## ⚙️ 構成コマンド

### グローバル構成
```bash
# すべての設定を一覧表示
azd config list

# グローバルのデフォルトを設定
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# 設定を削除
azd config unset defaults.location

# すべての設定をリセット
azd config reset
```

### プロジェクト構成
```bash
# azure.yaml を検証する
azd config validate

# プロジェクト情報を表示する
azd show

# サービスのエンドポイントを取得する
azd show --output json
```

## 📊 監視と診断

### 監視ダッシュボード
```bash
# Azure ポータルの監視ダッシュボードを開く
azd monitor

# Application Insights のライブメトリクスを開く
azd monitor --live

# Application Insights のログ ブレードを開く
azd monitor --logs

# Application Insights の概要を開く
azd monitor --overview
```

### コンテナログの表示
```bash
# Azure CLI を使ってログを表示する（Container Apps 用）
az containerapp logs show --name <app-name> --resource-group <rg-name>

# ログをリアルタイムで追跡する
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure ポータルからログを表示する
azd monitor --logs
```

### ログ分析クエリ
```bash
# Azure ポータルで Log Analytics にアクセスする
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

# 完全なクリーンアップ
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
# GitHub Actions を設定する
azd pipeline config

# Azure DevOps を設定する
azd pipeline config --provider azdo

# パイプラインの設定を表示する
azd pipeline show
```

### インフラ管理
```bash
# インフラテンプレートを生成する
azd infra generate

# 🧪 インフラのプレビューと計画
azd provision --preview
# 展開せずにインフラのプロビジョニングをシミュレートします
# Bicep/Terraform テンプレートを解析して以下を表示します:
# - 追加されるリソース（緑 +）
# - 変更されるリソース（黄色 ~）
# - 削除されるリソース（赤 -）
# 実行しても安全です - Azure 環境に実際の変更は加えられません

# azure.yaml からインフラを合成します
azd infra synth
```

### プロジェクト情報
```bash
# プロジェクトのステータスとエンドポイントを表示する
azd show

# プロジェクトの詳細情報をJSONで表示する
azd show --output json

# サービスのエンドポイントを取得する
azd show --output json | jq '.services'
```

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
# 環境を構築する
azd env new dev
azd env new staging  
azd env new production

# 開発環境にデプロイする
azd env select dev
azd up

# テストしてステージング環境へ移行する
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

# 出力を簡潔にするためテレメトリを無効にする
export AZD_DISABLE_TELEMETRY=true

# 現在の設定を確認する
azd config list

# 認証状態を確認する
az account show
```

### テンプレートデバッグ
```bash
# 利用可能なテンプレートを詳細とともに一覧表示する
azd template list --output json

# テンプレート情報を表示する
azd template show <template-name>

# 初期化前にテンプレートを検証する
azd template validate <template-name>
```

## 📁 ファイルとディレクトリのコマンド

### プロジェクト構成
```bash
# 現在のディレクトリ構成を表示する
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
# 表形式に整形する
azd env list --output table

# デプロイ済みのサービスを表示する
azd show --output json | jq '.services | keys'
```

## 🔧 よく使うコマンドの組み合わせ

### ヘルスチェックスクリプト
```bash
#!/bin/bash
# 簡易的なヘルスチェック
azd show
azd env show
azd monitor --logs
```

### デプロイ検証
```bash
#!/bin/bash
# デプロイ前の検証
azd show
azd provision --preview  # デプロイ前に変更をプレビューする
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
# 古い環境をクリーンアップする
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

### クイック修正
```bash
# 認証をリセットする
az account clear
az login

# 環境を強制的にリフレッシュする
azd env refresh

# すべてのサービスを再デプロイする
azd deploy

# デプロイの状態を確認する
azd show --output json
```

### 復旧コマンド
```bash
# デプロイ失敗から回復する - クリーンして再デプロイ
azd down --force --purge
azd up

# インフラのみ再プロビジョニングする
azd provision

# アプリケーションのみ再デプロイする
azd deploy
```

## 💡 プロのヒント

### ワークフローを高速化するエイリアス
```bash
# あなたの .bashrc または .zshrc に追加してください
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### 関数ショートカット
```bash
# 環境の素早い切り替え
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

### ヘルプの取得
```bash
# 一般的なヘルプ
azd --help
azd help

# コマンドごとのヘルプ
azd up --help
azd env --help
azd config --help

# バージョンとビルド情報を表示
azd version
azd version --output json
```

### ドキュメントへのリンク
```bash
# ブラウザでドキュメントを開く
azd docs

# テンプレートのドキュメントを表示する
azd template show <template-name> --docs
```

---

**ヒント**: このチートシートをブックマークし、`Ctrl+F` を使って必要なコマンドを素早く見つけてください！

---

**ナビゲーション**
- **前のレッスン**: [事前チェック](../docs/pre-deployment/preflight-checks.md)
- **次のレッスン**: [用語集](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責事項：
この文書は AI 翻訳サービス「Co‑op Translator」（https://github.com/Azure/co-op-translator）を使用して翻訳されました。正確性には努めていますが、自動翻訳には誤りや不正確な箇所が含まれる可能性があります。原文（元の言語による文書）を権威ある正本としてご参照ください。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じた誤解や解釈の相違について、当社は一切責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->