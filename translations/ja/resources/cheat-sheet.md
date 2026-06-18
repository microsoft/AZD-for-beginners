# コマンド チートシート - 重要な AZD コマンド

<strong>すべての章のクイックリファレンス</strong>
- **📚 Course Home**: [AZD 入門](../README.md)
- **📖 クイックスタート**: [第1章: 基礎 & クイックスタート](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI コマンド**: [第2章: AIファースト開発](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 上級**: [第4章: インフラストラクチャーをコードとして](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## 導入

この総合的なチートシートは、カテゴリ別に実用例と共に整理された、最も一般的に使用される Azure Developer CLI コマンドのクイックリファレンスを提供します。開発中、トラブルシューティング中、日常的な azd プロジェクトの運用での素早い参照に最適です。

## 学習目標

このチートシートを使用することで、あなたは次のことができます:
- 重要な Azure Developer CLI コマンドと構文に即座にアクセスする
- 機能別のカテゴリやユースケースごとのコマンドの構成を理解する
- 一般的な開発およびデプロイシナリオの実用的な例を参照する
- 素早い問題解決のためのトラブルシューティングコマンドにアクセスする
- 高度な構成とカスタマイズオプションを効率的に見つける
- 環境管理およびマルチ環境ワークフローのコマンドを見つける

## 学習成果

このチートシートを定期的に参照することで、あなたは次のことができるようになります:
- azd コマンドをドキュメントを参照せずに自信を持って実行する
- 適切な診断コマンドを使用して一般的な問題を迅速に解決する
- 複数の環境とデプロイシナリオを効率的に管理する
- 必要に応じて高度な azd 機能と構成オプションを適用する
- 系統的なコマンドシーケンスを使用してデプロイの問題をトラブルシュートする
- azd のショートカットやオプションを効果的に使用してワークフローを最適化する

## 入門コマンド

### 認証
```bash
# AZDを使ってAzureにログイン
azd auth login

# Azure CLIにログイン（AZDは内部でこれを使用します）
az login

# 現在のアカウントを確認
az account show

# 既定のサブスクリプションを設定
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZDからログアウト
azd auth logout

# Azure CLIからログアウト
az logout
```

### プロジェクトの初期化
```bash
# 利用可能なテンプレートを参照
azd template list

# テンプレートから初期化
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# 現在のディレクトリに初期化
azd init .

# カスタム名で初期化
azd init --template todo-nodejs-mongo my-awesome-app
```

## コアデプロイコマンド

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

# 🧪 インフラの変更をプレビューする
azd provision --preview
# どのリソースが作成/変更/削除されるかをドライランで表示する
# 'terraform plan' や 'bicep what-if' に似ており、安全に実行でき、変更は適用されない
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
# アプリケーションの依存関係を復元（ダウンロード）する
azd restore

# 特定のサービスを復元する
azd restore --service api

# デプロイせずにデプロイ可能なアーティファクトをビルドする
azd package

# 特定のサービスをビルドする
azd package --service api
```

> **`azd restore`** はアプリの依存関係 (npm、pip、NuGet、Maven など) をダウンロードします。`azd package` と `azd deploy` の実行中に自動的に実行されるため、通常は直接呼び出すことはほとんどありません — CI キャッシュをウォームアップする、またはその後オフラインで作業するために事前に依存関係を取得する目的で手動で実行します。

> **`azd package`** はデプロイ可能なアーティファクト（コンテナ イメージや zip）を **Azure にプッシュせずに** 作成します。単独で使用してビルドが成功することを検証したり、出力を検査したり、後で別のプロセスがデプロイするアーティファクトを生成したりできます。`azd deploy` は自動的にパッケージ化を行うため、デプロイせずにアーティファクトだけが必要な場合にのみ `azd package` を使用します。


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
# すべての設定を一覧表示
azd config show

# グローバルの既定値を設定
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
# Azure CLI でログを表示する（Container Apps 用）
az containerapp logs show --name <app-name> --resource-group <rg-name>

# ログをリアルタイムで追跡する
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure ポータルからログを表示する
azd monitor --logs
```

### Log Analytics クエリ
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
azd config show
```

## 🔧 高度なコマンド

### パイプラインと CI/CD
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
# インフラストラクチャのテンプレートを生成する
azd infra generate

# 🧪 インフラのプレビューと計画
azd provision --preview
# デプロイせずにインフラのプロビジョニングをシミュレートする
# Bicep/Terraform テンプレートを解析して以下を表示する:
# - 追加されるリソース（緑 +）
# - 変更されるリソース（黄色 ~）
# - 削除されるリソース（赤 -）
# 実行しても安全です - Azure 環境に実際の変更は加えられません

# azure.yaml からインフラを合成する
azd infra synth
```

### プロジェクト情報
```bash
# プロジェクトのステータスとエンドポイントを表示
azd show

# プロジェクトの詳細情報をJSONで表示
azd show --output json

# サービスのエンドポイントを取得
azd show --output json | jq '.services'
```

## 🤖 AI と拡張コマンド

### AZD 拡張
```bash
# 利用可能なすべての拡張機能を一覧表示する（AIを含む）
azd extension list

# Foundry agents 拡張機能をインストールする
azd extension install azure.ai.agents

# agent skills 拡張機能をインストールする（プレビュー）
azd extension install azure.ai.skills

# Foundry connections 拡張機能をインストールする（プレビュー）
azd extension install azure.ai.connections

# fine-tuning 拡張機能をインストールする
azd extension install azure.ai.finetune

# custom models 拡張機能をインストールする
azd extension install azure.ai.models

# インストールされているすべての拡張機能をアップグレードする
azd extension upgrade --all
```

### AI エージェントコマンド
```bash
# マニフェストからエージェントプロジェクトを初期化する
azd ai agent init -m <manifest-path-or-uri>

# 特定のFoundryプロジェクトを指定する
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# エージェントのソースディレクトリを指定する
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# ホスティングターゲットを選択する
azd ai agent init -m agent-manifest.yaml --host containerapp

# デプロイ済みエージェントをテストする（レイテンシと初回バイト到達時間（TTFB）を表示）
azd ai agent invoke

# ライブエンドポイントの構成を表示する
azd ai agent endpoint show

# 評価用データセットを生成し、エージェントを最適化する
azd ai agent eval generate
azd ai agent optimize

# コードベースのホストされたエージェントのデプロイ済みソースをダウンロードする
azd ai agent code download

# ホストされたエージェントとその全バージョンを削除する（--force はアクティブなセッションを終了させる）
azd ai agent delete --force
```

### MCP サーバー（アルファ）
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

# モニタリングダッシュボードを開く
azd monitor --live
```

### マルチ環境ワークフロー
```bash
# 環境をセットアップする
azd env new dev
azd env new staging  
azd env new production

# 開発環境へデプロイする
azd env select dev
azd up

# テストしてステージングへプロモートする
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

# デプロイ状況を確認する
azd show

# 設定を検証する
azd config show

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

# 現在の構成を確認する
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

# init を実行する前にテンプレートを検証する
azd template validate <template-name>
```

## 📁 ファイルとディレクトリコマンド

### プロジェクト構成
```bash
# 現在のディレクトリ構造を表示
tree /f  # Windows
find . -type f  # Linux/macOS

# azd プロジェクトのルートへ移動
cd $(azd root)

# azd の設定ディレクトリを表示
echo $AZD_CONFIG_DIR  # 通常は ~/.azd
```

## 🎨 出力フォーマット

### JSON 出力
```bash
# スクリプト用にJSON出力を取得する
azd show --output json
azd env list --output json
azd config show --output json

# jqで解析する
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### テーブル出力
```bash
# 表形式に整形
azd env list --output table

# デプロイ済みのサービスを表示
azd show --output json | jq '.services | keys'
```

## 🔧 よく使うコマンド組み合わせ

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

# デプロイ状況を確認
azd show --output json
```

### 復旧コマンド
```bash
# デプロイ失敗からの復旧 — クリーンして再デプロイ
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
# 素早い環境切り替え
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

### ドキュメントへのリンク
```bash
# ブラウザでドキュメントを開く
azd docs

# テンプレートのドキュメントを表示
azd template show <template-name> --docs
```

---

<strong>ヒント</strong>: このチートシートをブックマークし、`Ctrl+F` を使って必要なコマンドを素早く見つけてください！

---

<strong>ナビゲーション</strong>
- <strong>前のレッスン</strong>: [事前チェック](../docs/pre-deployment/preflight-checks.md)
- <strong>次のレッスン</strong>: [用語集](glossary.md)

---

> **💡 エディタで Azure コマンドのヘルプが欲しいですか？** `npx skills add microsoft/github-copilot-for-azure` で [Microsoft Azure Agent スキル](https://skills.sh/microsoft/github-copilot-for-azure) をインストールしてください — AI、Foundry、デプロイ、診断などの 37 のスキルが含まれます。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->