<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e9fcb9121c8d0b570798d778f8904a22",
  "translation_date": "2025-09-09T16:47:29+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "ja"
}
-->
# インストールとセットアップガイド

## はじめに

この包括的なガイドでは、Azure Developer CLI (azd) をシステムにインストールし、設定する方法を説明します。異なるオペレーティングシステム向けの複数のインストール方法、認証設定、初期構成について学び、Azureデプロイメントのための開発環境を準備します。

## 学習目標

このレッスンの終了時には以下を達成できます:
- 使用しているオペレーティングシステムにAzure Developer CLIをインストールする
- 複数の方法でAzure認証を設定する
- 必要な前提条件を備えた開発環境をセットアップする
- 異なるインストールオプションとその使用タイミングを理解する
- 一般的なインストールとセットアップの問題をトラブルシューティングする

## 学習成果

このレッスンを完了すると、以下ができるようになります:
- プラットフォームに適した方法でazdをインストールする
- `azd auth login` を使用してAzureに認証する
- インストールを確認し、基本的なazdコマンドをテストする
- azdを最適に使用するための開発環境を構成する
- 一般的なインストール問題を自力で解決する

このガイドは、オペレーティングシステムや開発環境に関係なく、Azure Developer CLIをシステムにインストールして設定する方法を提供します。

## 前提条件

azdをインストールする前に、以下を確認してください:
- **Azureサブスクリプション** - [無料アカウントを作成](https://azure.microsoft.com/free/)
- **Azure CLI** - 認証とリソース管理のため
- **Git** - テンプレートのクローン作成とバージョン管理のため
- **Docker** (オプション) - コンテナ化されたアプリケーションのため

## インストール方法

### Windows

#### オプション 1: PowerShell (推奨)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### オプション 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### オプション 3: Chocolatey
```cmd
choco install azd
```

#### オプション 4: 手動インストール
1. [GitHub](https://github.com/Azure/azure-dev/releases) から最新リリースをダウンロード
2. `C:\Program Files\azd\` に解凍
3. PATH環境変数に追加

### macOS

#### オプション 1: Homebrew (推奨)
```bash
brew tap azure/azd
brew install azd
```

#### オプション 2: インストールスクリプト
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### オプション 3: 手動インストール
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### オプション 1: インストールスクリプト (推奨)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### オプション 2: パッケージマネージャー

**Ubuntu/Debian:**
```bash
# Add Microsoft package repository
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Add Microsoft package repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azdはGitHub Codespacesにプリインストールされています。Codespaceを作成するだけで、すぐにazdを使用できます。

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ インストール確認

インストール後、azdが正しく動作しているか確認します:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

期待される出力:
```
azd version 1.5.0 (commit abc123)
```

## 🔐 認証設定

### Azure CLI認証 (推奨)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Login to Azure
az login

# Verify authentication
az account show
```

### デバイスコード認証
ヘッドレスシステムを使用している場合やブラウザの問題がある場合:
```bash
az login --use-device-code
```

### サービスプリンシパル (CI/CD)
自動化された環境向け:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## 🛠️ 構成

### グローバル構成
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### 環境変数
シェルプロファイル (`.bashrc`, `.zshrc`, `.profile`) に追加:
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## 🔧 IDE統合

### Visual Studio Code
Azure Developer CLI拡張機能をインストール:
1. VS Codeを開く
2. 拡張機能 (Ctrl+Shift+X) に移動
3. "Azure Developer CLI" を検索
4. 拡張機能をインストール

機能:
- azure.yamlのIntelliSense
- 統合ターミナルコマンド
- テンプレート閲覧
- デプロイメントモニタリング

### GitHub Codespaces
`.devcontainer/devcontainer.json` を作成:
```json
{
  "name": "Azure Developer CLI",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/azure/azure-dev/azd:latest": {}
  },
  "postCreateCommand": "azd version"
}
```

### IntelliJ/JetBrains
1. Azureプラグインをインストール
2. Azure認証情報を構成
3. 統合ターミナルでazdコマンドを使用

## 🐛 インストールのトラブルシューティング

### 一般的な問題

#### 権限拒否 (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATHの問題
azdを手動でPATHに追加:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### ネットワーク/プロキシの問題
```bash
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### バージョンの競合
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### さらなるヘルプを得る
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## azdの更新

### 自動更新
azdは更新が利用可能な場合に通知します:
```bash
azd version --check-for-updates
```

### 手動更新

**Windows (winget):**
```cmd
winget upgrade Microsoft.Azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 次のステップ

1. **認証を完了**: Azureサブスクリプションにアクセスできることを確認
2. **最初のデプロイを試す**: [最初のプロジェクトガイド](first-project.md) に従う
3. **テンプレートを探索**: `azd template list` を使用して利用可能なテンプレートを閲覧
4. **IDEを構成**: 開発環境をセットアップ

## サポート

問題が発生した場合:
- [公式ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [問題を報告](https://github.com/Azure/azure-dev/issues)
- [コミュニティディスカッション](https://github.com/Azure/azure-dev/discussions)
- [Azureサポート](https://azure.microsoft.com/support/)

---

**ナビゲーション**
- **前のレッスン**: [AZDの基本](azd-basics.md)
- **次のレッスン**: [構成](configuration.md)

**インストール完了！** [最初のプロジェクト](first-project.md) に進んでazdを使った構築を始めましょう。

---

**免責事項**:  
この文書は、AI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性を追求しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があります。元の言語で記載された原文が正式な情報源と見なされるべきです。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用に起因する誤解や誤訳について、当社は一切の責任を負いません。