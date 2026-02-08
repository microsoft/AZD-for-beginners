# インストールとセットアップガイド

**チャプター ナビゲーション:**
- **📚 コース ホーム**: [AZD 入門](../../README.md)
- **📖 現在の章**: 第1章 - 基礎とクイックスタート
- **⬅️ 前へ**: [AZD の基本](azd-basics.md)
- **➡️ 次へ**: [最初のプロジェクト](first-project.md)
- **🚀 次の章**: [第2章: AI-ファースト開発](../chapter-02-ai-development/microsoft-foundry-integration.md)

## はじめに

この包括的なガイドでは、システムに Azure Developer CLI (azd) をインストールおよび構成する手順を説明します。異なるオペレーティングシステム向けの複数のインストール方法、認証の設定、および Azure へのデプロイに備えた初期構成について学びます。

## 学習目標

このレッスンの終了時には、次のことができるようになります:
- 使用しているオペレーティングシステムに Azure Developer CLI を正常にインストールする
- 複数の方法で Azure に対する認証を構成する
- 必要な前提条件を用意して開発環境を設定する
- さまざまなインストールオプションとその利用シーンを理解する
- 一般的なインストールおよびセットアップの問題をトラブルシュートする

## 学習成果

このレッスンを完了すると、次のことができるようになります:
- プラットフォームに適した方法で azd をインストールする
- `azd auth login` を使用して Azure に認証する
- インストールを検証して基本的な azd コマンドをテストする
- azd を最適に使用するために開発環境を構成する
- 一般的なインストール問題を自主的に解決する

このガイドは、オペレーティングシステムや開発環境に関わらず、システムに Azure Developer CLI をインストールして構成するのに役立ちます。

## 前提条件

azd をインストールする前に、次を確認してください:
- **Azure subscription** - [無料アカウントを作成](https://azure.microsoft.com/free/)
- **Azure CLI** - 認証とリソース管理のため
- **Git** - テンプレートのクローンとバージョン管理のため
- **Docker** (optional) - コンテナ化されたアプリケーション向け

## インストール方法

### Windows

#### オプション 1: PowerShell（推奨）
```powershell
# 管理者として、または昇格した権限で実行してください
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
1. 最新のリリースを[GitHub](https://github.com/Azure/azure-dev/releases)からダウンロード
2. `C:\Program Files\azd\` に展開
3. PATH 環境変数に追加

### macOS

#### オプション 1: Homebrew（推奨）
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
# ダウンロードしてインストール
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### オプション 1: インストールスクリプト（推奨）
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### オプション 2: パッケージマネージャー

**Ubuntu/Debian:**
```bash
# Microsoft のパッケージリポジトリを追加する
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# azd をインストールする
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Microsoftのパッケージリポジトリを追加する
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd は GitHub Codespaces にプリインストールされています。コードスペースを作成するだけで、すぐに azd を使用できます。

### Docker

```bash
# コンテナ内で azd を実行する
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# より簡単に使えるようにエイリアスを作成する
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ インストールの確認

インストール後、azd が正しく動作することを確認します:

```bash
# バージョンを確認
azd version

# ヘルプを見る
azd --help

# 利用可能なテンプレートを一覧表示
azd template list
```

期待される出力:
```
azd version 1.x.x (commit xxxxxx)
```

**注意**: 実際のバージョン番号は異なります。最新のバージョンは [Azure Developer CLI のリリース](https://github.com/Azure/azure-dev/releases) を確認してください。

**✅ インストール成功チェックリスト:**
- [ ] `azd version` がエラーなくバージョン番号を表示する
- [ ] `azd --help` がコマンドのドキュメントを表示する
- [ ] `azd template list` が利用可能なテンプレートを表示する
- [ ] `az account show` があなたの Azure サブスクリプションを表示する
- [ ] テスト用ディレクトリを作成し、`azd init` を正常に実行できる

**すべてのチェックが合格したら、[最初のプロジェクト](first-project.md) に進む準備ができています！**

## 認証の設定

### Azure CLI 認証（推奨）
```bash
# まだインストールされていない場合は Azure CLI をインストールする
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Azure にログインする
az login

# 認証を確認する
az account show
```

### デバイスコード認証
ヘッドレスシステムを使用しているかブラウザに問題がある場合:
```bash
az login --use-device-code
```

### サービスプリンシパル（CI/CD）
自動化環境向け:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## 構成

### グローバル構成
```bash
# デフォルトのサブスクリプションを設定する
azd config set defaults.subscription <subscription-id>

# デフォルトのロケーションを設定する
azd config set defaults.location eastus2

# すべての設定を表示する
azd config list
```

### 環境変数
シェルプロファイル（`.bashrc`, `.zshrc`, `.profile`）に追加:
```bash
# Azure の構成
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd の構成
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # デバッグ ログを有効にする
```

## IDE 統合

### Visual Studio Code
Azure Developer CLI 拡張機能をインストール:
1. VS Code を開く
2. 拡張機能へ移動 (Ctrl+Shift+X)
3. 「Azure Developer CLI」を検索
4. 拡張機能をインストール

機能:
- azure.yaml の IntelliSense
- 統合ターミナルのコマンド
- テンプレートの参照
- デプロイの監視

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
1. Azure プラグインをインストール
2. Azure の資格情報を設定
3. 統合ターミナルで azd コマンドを使用

## 🐛 インストールのトラブルシューティング

### よくある問題

#### アクセス拒否 (Windows)
```powershell
# PowerShell を管理者として実行する
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH の問題
手動で azd を PATH に追加:

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
# プロキシを構成する
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL検証をスキップする（本番環境では推奨されません）
azd config set http.insecure true
```

#### バージョンの競合
```bash
# 古いインストールを削除する
# Windows: 'winget uninstall Microsoft.Azd' を実行
# macOS: 'brew uninstall azd' を実行
# Linux: 'sudo apt remove azd' を実行

# 設定をクリーンアップする
rm -rf ~/.azd
```

### さらにヘルプを得る
```bash
# デバッグログを有効にする
export AZD_DEBUG=true
azd <command> --debug

# 現在の設定を表示する
azd config list

# 現在のデプロイ状況を表示する
azd show
```

## azd の更新

### 自動更新
更新が利用可能になると azd が通知します:
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
<summary><strong>azd と az CLI の違いは何ですか？</strong></summary>

**Azure CLI (az)**: 個々の Azure リソースを管理するための低レベルツール
- `az webapp create`, `az storage account create`
- 一度に 1 つのリソースを扱う
- インフラ管理に焦点を当てる

**Azure Developer CLI (azd)**: アプリケーション全体のデプロイを行う高レベルツール
- `azd up` はすべてのリソースを含むアプリ全体をデプロイする
- テンプレートベースのワークフロー
- 開発者の生産性に焦点を当てる

**両方が必要です**: azd は認証に az CLI を使用します
</details>

<details>
<summary><strong>既存の Azure リソースで azd を使用できますか？</strong></summary>

はい！次のことが可能です:
1. 既存のリソースを azd 環境にインポートする
2. Bicep テンプレートで既存のリソースを参照する
3. 既存のインフラストラクチャと並行して新しいデプロイに azd を使用する

詳細は [構成ガイド](configuration.md) を参照してください。
</details>

<details>
<summary><strong>azd は Azure Government や Azure China で動作しますか？</strong></summary>

はい、クラウドを構成してください:
```bash
# Azure（政府向け）
az cloud set --name AzureUSGovernment
az login

# Azure（中国）
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>CI/CD パイプラインで azd を使用できますか？</strong></summary>

もちろんです！azd は自動化向けに設計されています:
- GitHub Actions 統合
- Azure DevOps サポート
- サービスプリンシパル認証
- 非対話モード

CI/CD のパターンについては [デプロイ ガイド](../chapter-04-infrastructure/deployment-guide.md) を参照してください。
</details>

<details>
<summary><strong>azd を使用するコストは？</strong></summary>

azd 自体は**完全に無料**でオープンソースです。支払うのは次のもののみです:
- デプロイする Azure リソース
- Azure の利用料金（コンピュート、ストレージなど）

デプロイ前にコストを見積もるには `azd provision --preview` を使用してください。
</details>

## 次のステップ

1. **認証を完了する**: Azure サブスクリプションにアクセスできることを確認する
2. **最初のデプロイを試す**: [最初のプロジェクト](first-project.md) のガイドに従ってください
3. **テンプレートを探索する**: `azd template list` で利用可能なテンプレートを参照する
4. **IDE を構成する**: 開発環境を設定する

## サポート

問題が発生した場合:
- [公式ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [問題を報告](https://github.com/Azure/azure-dev/issues)
- [コミュニティディスカッション](https://github.com/Azure/azure-dev/discussions)
- [Azure サポート](https://azure.microsoft.com/support/)

---

**チャプター ナビゲーション:**
- **📚 コース ホーム**: [AZD 入門](../../README.md)
- **📖 現在の章**: 第1章 - 基礎とクイックスタート
- **⬅️ 前へ**: [AZD の基本](azd-basics.md) 
- **➡️ 次へ**: [最初のプロジェクト](first-project.md)
- **🚀 次の章**: [第2章: AI-ファースト開発](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ インストール完了！** [最初のプロジェクト](first-project.md) に進んで azd で構築を開始しましょう。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責事項：
この文書は AI 翻訳サービス「Co-op Translator」(https://github.com/Azure/co-op-translator) を使用して翻訳されました。正確性には努めておりますが、自動翻訳には誤りや不正確な表現が含まれる可能性があることをご承知おきください。原文（原言語の文書）を正式な情報源とみなしてください。重要な情報については、専門の翻訳者による人間翻訳をお勧めします。本翻訳の利用に起因して生じた誤解や解釈の相違について、私たちは責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->