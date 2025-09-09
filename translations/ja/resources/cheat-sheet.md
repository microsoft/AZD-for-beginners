<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "04291031a6a1cc0dc4064dcb9c543584",
  "translation_date": "2025-09-09T18:00:22+00:00",
  "source_file": "resources/cheat-sheet.md",
  "language_code": "ja"
}
-->
# コマンドチートシート - 必須AZDコマンド

## はじめに

この包括的なチートシートは、Azure Developer CLIの最もよく使用されるコマンドをカテゴリ別に整理し、実用的な例とともに提供します。開発、トラブルシューティング、日々のAZDプロジェクト運用時の迅速な参照に最適です。

## 学習目標

このチートシートを使用することで、以下を達成できます：
- 必須のAzure Developer CLIコマンドと構文に即座にアクセスできる
- 機能カテゴリと使用例に基づいたコマンドの整理を理解する
- 一般的な開発およびデプロイシナリオの実用的な例を参照する
- 問題解決のためのトラブルシューティングコマンドにアクセスする
- 高度な設定およびカスタマイズオプションを効率的に見つける
- 環境管理およびマルチ環境ワークフローコマンドを特定する

## 学習成果

このチートシートを定期的に参照することで、以下が可能になります：
- 完全なドキュメントを参照せずにAZDコマンドを自信を持って実行する
- 適切な診断コマンドを使用して一般的な問題を迅速に解決する
- 複数の環境とデプロイシナリオを効率的に管理する
- 必要に応じて高度なAZD機能と設定オプションを適用する
- システマティックなコマンドシーケンスを使用してデプロイの問題をトラブルシューティングする
- AZDのショートカットとオプションを効果的に活用してワークフローを最適化する

## 初期設定コマンド

### 認証
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### プロジェクト初期化
```bash
# Browse available templates
azd template list

# Initialize from template
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Initialize in current directory
azd init .

# Initialize with custom name
azd init --template todo-nodejs-mongo my-awesome-app
```

## コアデプロイメントコマンド

### 完全なデプロイメントワークフロー
```bash
# Deploy everything (provision + deploy)
azd up

# Deploy with confirmation prompts disabled
azd up --confirm-with-no-prompt

# Deploy to specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2
```

### インフラストラクチャのみ
```bash
# Provision Azure resources
azd provision

# Preview infrastructure changes
azd provision --preview

# Provision with what-if analysis
azd provision --what-if
```

### アプリケーションのみ
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### ビルドとパッケージ
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 環境管理

### 環境操作
```bash
# List all environments
azd env list

# Create new environment
azd env new development
azd env new staging --location westus2

# Select environment
azd env select production

# Show current environment
azd env show

# Refresh environment state
azd env refresh
```

### 環境変数
```bash
# Set environment variable
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Get environment variable
azd env get API_KEY

# List all environment variables
azd env get-values

# Remove environment variable
azd env unset DEBUG
```

## ⚙️ 設定コマンド

### グローバル設定
```bash
# List all configuration
azd config list

# Set global defaults
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Remove configuration
azd config unset defaults.location

# Reset all configuration
azd config reset
```

### プロジェクト設定
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 モニタリングとログ

### アプリケーションログ
```bash
# View logs from all services
azd logs

# View logs from specific service
azd logs --service api

# Follow logs in real-time
azd logs --follow

# View logs since specific time
azd logs --since 1h
azd logs --since "2024-01-01 10:00:00"

# Filter logs by level
azd logs --level error
```

### モニタリング
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
```

## 🛠️ メンテナンスコマンド

### クリーンアップ
```bash
# Remove all Azure resources
azd down

# Force delete without confirmation
azd down --force

# Purge soft-deleted resources
azd down --purge

# Complete cleanup
azd down --force --purge
```

### 更新
```bash
# Check for azd updates
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 高度なコマンド

### パイプラインとCI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### インフラストラクチャ管理
```bash
# Import existing resources
azd infra import

# Export infrastructure template
azd infra export

# Validate infrastructure
azd infra validate
```

### サービス管理
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 クイックワークフロー

### 開発ワークフロー
```bash
# Start new project
azd init --template todo-nodejs-mongo
cd my-project

# Deploy to development
azd env new dev
azd up

# Make changes and redeploy
azd deploy

# View logs
azd logs --follow
```

### マルチ環境ワークフロー
```bash
# Set up environments
azd env new dev
azd env new staging  
azd env new production

# Deploy to dev
azd env select dev
azd up

# Test and promote to staging
azd env select staging
azd up

# Deploy to production
azd env select production
azd up
```

### トラブルシューティングワークフロー
```bash
# Enable debug mode
export AZD_DEBUG=true

# Check system info
azd info

# Validate configuration
azd config validate

# View detailed logs
azd logs --level debug --since 1h

# Check resource status
azd show --output json
```

## 🔍 デバッグコマンド

### デバッグ情報
```bash
# Enable debug output
export AZD_DEBUG=true
azd <command> --debug

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true

# Get system information
azd info

# Check authentication status
az account show
```

### テンプレートデバッグ
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 ファイルとディレクトリコマンド

### プロジェクト構造
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 出力フォーマット

### JSON出力
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### テーブル出力
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 よく使われるコマンドの組み合わせ

### ヘルスチェックスクリプト
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### デプロイメント検証
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview
az account show
```

### 環境比較
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### リソースクリーンアップスクリプト
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 環境変数

### 一般的な環境変数
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD configuration
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Application configuration
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 緊急コマンド

### クイック修正
```bash
# Reset authentication
az account clear
az login

# Force refresh environment
azd env refresh --force

# Restart all services
azd service restart --all

# Quick rollback
azd deploy --rollback
```

### 復旧コマンド
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 プロのヒント

### ワークフローを高速化するエイリアス
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### 関数ショートカット
```bash
# Quick environment switching
azd-env() {
    azd env select $1 && azd show
}

# Quick deployment with logs
azd-deploy-watch() {
    azd deploy --service $1 && azd logs --service $1 --follow
}

# Environment status
azd-status() {
    echo "Current environment: $(azd env show --output json | jq -r '.name')"
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 ヘルプとドキュメント

### ヘルプの取得
```bash
# General help
azd --help
azd help

# Command-specific help
azd up --help
azd env --help
azd config --help

# Show version and build info
azd version
azd version --output json
```

### ドキュメントリンク
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**ヒント**: このチートシートをブックマークし、`Ctrl+F`を使用して必要なコマンドを迅速に見つけましょう！

---

**ナビゲーション**
- **前のレッスン**: [事前チェック](../docs/pre-deployment/preflight-checks.md)
- **次のレッスン**: [用語集](glossary.md)

---

**免責事項**:  
この文書は、AI翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を追求しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があります。元の言語で記載された文書を正式な情報源としてお考えください。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用に起因する誤解や誤解について、当方は責任を負いません。