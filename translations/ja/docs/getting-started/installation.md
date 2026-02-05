# インストールとセットアップガイド

**章のナビゲーション:**
- **📚 コースホーム**: [AZD 初心者向け](../../README.md)
- **📖 現在の章**: 第1章 - 基礎とクイックスタート
- **⬅️ 前章**: [AZDの基本](azd-basics.md)
- **➡️ 次章**: [初めてのプロジェクト](first-project.md)
- **🚀 次の章**: [第2章: AIファースト開発](../microsoft-foundry/microsoft-foundry-integration.md)

## はじめに

この包括的なガイドでは、Azure Developer CLI (azd) をシステムにインストールして設定する方法を説明します。異なるオペレーティングシステム向けの複数のインストール方法、認証設定、Azureデプロイメントの準備のための初期設定について学びます。

## 学習目標

このレッスンの終了時には以下を達成できます:
- 使用しているオペレーティングシステムにAzure Developer CLIを正常にインストールする
- 複数の方法でAzureの認証を設定する
- 必要な前提条件を備えた開発環境をセットアップする
- 異なるインストールオプションとその使用タイミングを理解する
- 一般的なインストールとセットアップの問題をトラブルシューティングする

## 学習成果

このレッスンを完了すると以下ができるようになります:
- プラットフォームに適した方法でazdをインストールする
- `azd auth login` を使用してAzureに認証する
- インストールを確認し、基本的なazdコマンドをテストする
- azdを最適に使用するための開発環境を設定する
- 一般的なインストール問題を自力で解決する

このガイドは、オペレーティングシステムや開発環境に関係なく、Azure Developer CLIをシステムにインストールして設定する方法を提供します。

## 前提条件

azdをインストールする前に以下を確認してください:
- **Azureサブスクリプション** - [無料アカウントを作成](https://azure.microsoft.com/free/)
- **Azure CLI** - 認証とリソース管理のため
- **Git** - テンプレートのクローン作成とバージョン管理のため
- **Docker** (オプション) - コンテナ化されたアプリケーションのため

## インストール方法

### Windows

#### オプション1: PowerShell (推奨)
```powershell
# 管理者として、または昇格した権限で実行してください
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### オプション2: Windowsパッケージマネージャー (winget)
```cmd
winget install Microsoft.Azd
```

#### オプション3: Chocolatey
```cmd
choco install azd
```

#### オプション4: 手動インストール
1. [GitHub](https://github.com/Azure/azure-dev/releases) から最新リリースをダウンロード
2. `C:\Program Files\azd\` に解凍
3. PATH環境変数に追加

### macOS

#### オプション1: Homebrew (推奨)
```bash
brew tap azure/azd
brew install azd
```

#### オプション2: インストールスクリプト
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### オプション3: 手動インストール
```bash
# ダウンロードしてインストール
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### オプション1: インストールスクリプト (推奨)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### オプション2: パッケージマネージャー

**Ubuntu/Debian:**
```bash
# Microsoft パッケージリポジトリを追加する
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# azd をインストールする
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Microsoft パッケージリポジトリを追加
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azdはGitHub Codespacesにプリインストールされています。Codespaceを作成してすぐにazdを使用できます。

### Docker

```bash
# コンテナ内でazdを実行する
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# 簡単に使用できるようにエイリアスを作成する
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ インストール確認

インストール後、azdが正しく動作しているか確認してください:

```bash
# バージョンを確認
azd version

# ヘルプを表示
azd --help

# 利用可能なテンプレートを一覧表示
azd template list
```

期待される出力:
```
azd version 1.5.0 (commit abc123)
```

**✅ インストール成功チェックリスト:**
- [ ] `azd version` がエラーなしでバージョン番号を表示する
- [ ] `azd --help` がコマンドのドキュメントを表示する
- [ ] `azd template list` が利用可能なテンプレートを表示する
- [ ] `az account show` がAzureサブスクリプションを表示する
- [ ] テストディレクトリを作成し、`azd init` を正常に実行できる

**すべてのチェックが通れば、[初めてのプロジェクト](first-project.md) に進む準備が整いました！**

## 認証設定

### Azure CLI認証 (推奨)
```bash
# Azure CLI をインストール (未インストールの場合)
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Azure にログイン
az login

# 認証を確認
az account show
```

### デバイスコード認証
ヘッドレスシステムを使用している場合やブラウザの問題がある場合:
```bash
az login --use-device-code
```

### サービスプリンシパル (CI/CD)
自動化環境向け:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## 設定

### グローバル設定
```bash
# デフォルトのサブスクリプションを設定する
azd config set defaults.subscription <subscription-id>

# デフォルトの場所を設定する
azd config set defaults.location eastus2

# すべての設定を表示する
azd config list
```

### 環境変数
シェルプロファイル (`.bashrc`, `.zshrc`, `.profile`) に追加:
```bash
# Azure構成
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd構成
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # デバッグログを有効にする
```

## IDE統合

### Visual Studio Code
Azure Developer CLI拡張機能をインストール:
1. VS Codeを開く
2. 拡張機能 (Ctrl+Shift+X) に移動
3. "Azure Developer CLI" を検索
4. 拡張機能をインストール

機能:
- azure.yamlのIntelliSense
- 統合ターミナルコマンド
- テンプレートの閲覧
- デプロイメントのモニタリング

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
2. Azure認証情報を設定
3. 統合ターミナルでazdコマンドを使用

## 🐛 インストールのトラブルシューティング

### よくある問題

#### 権限拒否 (Windows)
```powershell
# 管理者としてPowerShellを実行する
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATHの問題
手動でazdをPATHに追加:

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
# プロキシを設定する
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL検証をスキップする（本番環境では推奨されません）
azd config set http.insecure true
```

#### バージョンの競合
```bash
# 古いインストールを削除する
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# 設定をクリーンアップする
rm -rf ~/.azd
```

### さらなるヘルプを得る
```bash
# デバッグログを有効にする
export AZD_DEBUG=true
azd <command> --debug

# 詳細なログを表示する
azd logs

# システム情報を確認する
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

## 💡 よくある質問

<details>
<summary><strong>azdとaz CLIの違いは何ですか？</strong></summary>

**Azure CLI (az)**: 個々のAzureリソースを管理するための低レベルツール
- `az webapp create`, `az storage account create`
- 一度に1つのリソース
- インフラ管理に焦点

**Azure Developer CLI (azd)**: 完全なアプリケーションデプロイメントのための高レベルツール
- `azd up` はすべてのリソースを含むアプリ全体をデプロイ
- テンプレートベースのワークフロー
- 開発者の生産性に焦点

**両方必要**: azdは認証にaz CLIを使用します
</details>

<details>
<summary><strong>既存のAzureリソースでazdを使用できますか？</strong></summary>

はい！以下が可能です:
1. 既存のリソースをazd環境にインポート
2. Bicepテンプレートで既存のリソースを参照
3. 既存のインフラと並行して新しいデプロイメントにazdを使用

詳細は[設定ガイド](configuration.md)をご覧ください。
</details>

<details>
<summary><strong>azdはAzure GovernmentやAzure Chinaで動作しますか？</strong></summary>

はい、クラウドを設定してください:
```bash
# Azure 政府
az cloud set --name AzureUSGovernment
az login

# Azure 中国
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>azdをCI/CDパイプラインで使用できますか？</strong></summary>

もちろんです！azdは自動化向けに設計されています:
- GitHub Actionsとの統合
- Azure DevOpsのサポート
- サービスプリンシパル認証
- 非対話モード

CI/CDパターンについては[デプロイメントガイド](../deployment/deployment-guide.md)をご覧ください。
</details>

<details>
<summary><strong>azdの使用にかかる費用は？</strong></summary>

azd自体は**完全無料**でオープンソースです。以下にのみ費用がかかります:
- デプロイするAzureリソース
- Azureの消費コスト (コンピュート、ストレージなど)

デプロイ前にコストを見積もるには `azd provision --preview` を使用してください。
</details>

## 次のステップ

1. **認証を完了**: Azureサブスクリプションにアクセスできることを確認
2. **初めてのデプロイを試す**: [初めてのプロジェクトガイド](first-project.md) に従う
3. **テンプレートを探索**: `azd template list` を使用して利用可能なテンプレートを閲覧
4. **IDEを設定**: 開発環境をセットアップ

## サポート

問題が発生した場合:
- [公式ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [問題を報告](https://github.com/Azure/azure-dev/issues)
- [コミュニティディスカッション](https://github.com/Azure/azure-dev/discussions)
- [Azureサポート](https://azure.microsoft.com/support/)

---

**章のナビゲーション:**
- **📚 コースホーム**: [AZD 初心者向け](../../README.md)
- **📖 現在の章**: 第1章 - 基礎とクイックスタート
- **⬅️ 前章**: [AZDの基本](azd-basics.md) 
- **➡️ 次章**: [初めてのプロジェクト](first-project.md)
- **🚀 次の章**: [第2章: AIファースト開発](../microsoft-foundry/microsoft-foundry-integration.md)

**✅ インストール完了！** [初めてのプロジェクト](first-project.md) に進んでazdを使った構築を始めましょう。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:  
この文書は、AI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性を期すよう努めておりますが、自動翻訳には誤りや不正確さが含まれる可能性があります。原文（元の言語で記載された文書）を公式な情報源としてご参照ください。重要な情報については、専門の人間による翻訳をお勧めします。本翻訳の使用に起因する誤解や誤認について、当方は一切の責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->