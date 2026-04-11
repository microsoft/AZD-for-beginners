# Command Cheat Sheet - Essential AZD Commands

**Quick Reference for All Chapters**
- **📚 Course Home**: [AZD 入門](../README.md)
- **📖 Quick Start**: [第1章: 基礎とクイックスタート](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Commands**: [第2章: AIファースト開発](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Advanced**: [第4章: インフラをコード化](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## はじめに

この包括的なチートシートは、最も一般的に使用される Azure Developer CLI コマンドをカテゴリ別に実用例とともに素早く参照できるようにまとめています。azd プロジェクトでの開発、トラブルシューティング、日常運用時のクイック参照に最適です。

## 学習目標

このチートシートを使用することで、次のことができます:
- 重要な Azure Developer CLI コマンドと構文に即座にアクセスする
- 機能別カテゴリとユースケースごとのコマンド構成を理解する
- 一般的な開発およびデプロイシナリオの実用例を参照する
- 問題解決のためのトラブルシューティングコマンドにアクセスする
- 高度な構成とカスタマイズオプションを効率的に見つける
- 環境管理およびマルチ環境ワークフローのコマンドを見つける

## 学習成果

このチートシートを定期的に参照することで、次のことが可能になります:
- ドキュメント全体を参照せずに azd コマンドを自信を持って実行する
- 適切な診断コマンドを使用して一般的な問題を迅速に解決する
- 複数の環境とデプロイシナリオを効率的に管理する
- 必要に応じて高度な azd 機能と構成オプションを適用する
- 系統的なコマンドシーケンスを使用してデプロイの問題をトラブルシュートする
- azd のショートカットとオプションを効果的に使用してワークフローを最適化する

## 導入コマンド

### 認証
```bash
# AZD 経由で Azure にログイン
azd auth login

# Azure CLI にログイン (AZD は内部でこれを使用します)
az login

# 現在のアカウントを確認する
az account show

# 既定のサブスクリプションを設定する
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD からログアウトする
azd auth logout

# Azure CLI からログアウトする
az logout
```

### プロジェクトの初期化
```bash
# 利用可能なテンプレートを閲覧
azd template list

# テンプレートから初期化
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# 現在のディレクトリに初期化
azd init .

# カスタム名で初期化
azd init --template todo-nodejs-mongo my-awesome-app
```

## コア展開コマンド

### 完全なデプロイワークフロー
```bash
# すべてをデプロイする（プロビジョニングとデプロイ）
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

# 🧪 インフラストラクチャの変更をプレビューする
azd provision --preview
# 作成/変更/削除されるリソースをドライランで表示する
# 'terraform plan' や 'bicep what-if' に類似 — 実行しても安全で、変更は適用されません
```

### アプリケーションのみ
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
# アプリケーションを構築する
azd package

# 特定のサービスを構築する
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

# 利用可能な環境を表示
azd env list

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
# すべての設定を一覧表示する
azd config show

# グローバルのデフォルトを設定する
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# 設定を削除する
azd config unset defaults.location

# すべての設定をリセットする
azd config reset
```

### プロジェクト設定
```bash
# azure.yaml を検証する
azd config validate

# プロジェクト情報を表示する
azd show

# サービスエンドポイントを取得する
azd show --output json
```

## 📊 監視と診断

### 監視ダッシュボード
```bash
# Azure ポータルの監視ダッシュボードを開く
azd monitor

# Application Insights のライブメトリクスを開く
azd monitor --live

# Application Insights のログブレードを開く
azd monitor --logs

# Application Insights の概要を開く
azd monitor --overview
```

### コンテナログの表示
```bash
# Azure CLI（Container Apps 向け）でログを表示
az containerapp logs show --name <app-name> --resource-group <rg-name>

# ログをリアルタイムで追跡
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure ポータルからログを表示
azd monitor --logs
```

### ログ分析クエリ
```bash
# Azure ポータルから Log Analytics にアクセス
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

# ソフト削除されたリソースを完全に消去する
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
azd config show
```

## 🔧 上級コマンド

### パイプラインとCI/CD
```bash
# GitHub Actions を設定する
azd pipeline config

# Azure DevOps を設定する
azd pipeline config --provider azdo

# パイプラインの構成を表示する
azd pipeline show
```

### インフラ管理
```bash
# インフラテンプレートを生成する
azd infra generate

# 🧪 インフラのプレビューと計画
azd provision --preview
# デプロイせずにインフラのプロビジョニングをシミュレートする
# Bicep/Terraform テンプレートを解析して次を表示:
# - 追加されるリソース（緑 +）
# - 変更されるリソース（黄色 ~）
# - 削除されるリソース（赤 -）
# 実行しても安全です - Azure 環境には実際の変更は加えられません

# azure.yaml からインフラを合成する
azd infra synth
```

### プロジェクト情報
```bash
# プロジェクトのステータスとエンドポイントを表示する
azd show

# 詳細なプロジェクト情報をJSONで表示する
azd show --output json

# サービスのエンドポイントを取得する
azd show --output json | jq '.services'
```

## 🤖 AI と拡張コマンド

### AZD拡張
```bash
# 利用可能な拡張機能をすべて一覧表示する（AI を含む）
azd extension list

# Foundry Agents 拡張機能をインストールする
azd extension install azure.ai.agents

# ファインチューニング拡張機能をインストールする
azd extension install azure.ai.finetune

# カスタムモデル拡張機能をインストールする
azd extension install azure.ai.models

# インストール済みの拡張機能をすべてアップグレードする
azd extension upgrade --all
```

### AIエージェントコマンド
```bash
# マニフェストからエージェントプロジェクトを初期化する
azd ai agent init -m <manifest-path-or-uri>

# 特定のFoundryプロジェクトを指定する
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# エージェントのソースディレクトリを指定する
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# ホスティング先を選択する
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCPサーバー（アルファ）
```bash
# プロジェクト用のMCPサーバーを起動する
azd mcp start

# MCP操作に関するツールの同意を管理する
azd copilot consent list
```

### インフラ生成
```bash
# プロジェクト定義からIaCファイルを生成する
azd infra generate

# azure.yamlからインフラを合成する
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
# 環境を設定する
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
azd config show

# ログの監視ダッシュボードを開く
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
azd config show

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

## 📁 ファイルとディレクトリコマンド

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

### JSON出力
```bash
# スクリプト用に JSON 出力を取得する
azd show --output json
azd env list --output json
azd config show --output json

# jq で解析する
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### 表形式出力
```bash
# 表としてフォーマットする
azd env list --output table

# デプロイ済みのサービスを表示する
azd show --output json | jq '.services | keys'
```

## 🔧 よく使うコマンドの組み合わせ

### ヘルスチェックスクリプト
```bash
#!/bin/bash
# 簡易ヘルスチェック
azd show
azd env get-values
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

### よく使う環境変数
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

### 復旧コマンド
```bash
# 失敗したデプロイから復旧する - クリーンして再デプロイする
azd down --force --purge
azd up

# インフラのみ再プロビジョニングする
azd provision

# アプリケーションのみ再デプロイする
azd deploy
```

## 💡 プロのコツ

### 高速ワークフローのエイリアス
```bash
# 自分の .bashrc または .zshrc に追加してください
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### 関数ショートカット
```bash
# 環境の迅速な切り替え
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
    azd env get-values
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

<strong>ヒント</strong>: このチートシートをブックマークし、`Ctrl+F` を使って必要なコマンドを素早く見つけてください！

---

<strong>ナビゲーション</strong>
- <strong>前のレッスン</strong>: [事前チェック](../docs/pre-deployment/preflight-checks.md)
- <strong>次のレッスン</strong>: [用語集](glossary.md)

---

> **💡 エディタで Azure コマンドのヘルプが欲しいですか？** Install [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) with `npx skills add microsoft/github-copilot-for-azure` — AI、Foundry、デプロイ、診断など向けの37個のスキルが含まれます。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:
この文書は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性には努めていますが、自動翻訳には誤りや不正確な点が含まれる可能性があることにご注意ください。原文（原言語の文書）が権威ある情報源と見なされるべきです。重要な情報については、専門家による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や誤訳についても、当方は一切責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->