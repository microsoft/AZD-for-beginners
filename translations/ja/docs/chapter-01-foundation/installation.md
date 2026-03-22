# インストールとセットアップガイド

**章ナビゲーション:**
- **📚 コースホーム**: [AZD 初心者向け](../../README.md)
- **📖 現在の章**: 第1章 - 基礎とクイックスタート
- **⬅️ 前へ**: [AZD 基本](azd-basics.md)
- **➡️ 次へ**: [最初のプロジェクト](first-project.md)
- **🚀 次の章**: [第2章：AIファースト開発](../chapter-02-ai-development/microsoft-foundry-integration.md)

## はじめに

この包括的なガイドでは、Azure Developer CLI (azd) をシステムにインストールおよび構成する手順を説明します。異なるオペレーティングシステム向けの複数のインストール方法、認証の設定、および Azure へのデプロイに向けた開発環境の初期設定を学びます。

## 学習目標

このレッスンの終了時には、次のことができるようになります:
- 使用しているオペレーティングシステムに対して Azure Developer CLI を正常にインストールする
- 複数の方法で Azure と認証を構成する
- 必要な前提条件を整えて開発環境をセットアップする
- 異なるインストールオプションを理解し、各オプションを使うべき状況を判断する
- 一般的なインストールおよびセットアップの問題をトラブルシューティングする

## 学習成果

このレッスンを完了すると、次のことができるようになります:
- プラットフォームに適した方法で azd をインストールする
- `azd auth login` を使用して Azure に認証する
- インストールを検証し、基本的な azd コマンドの動作をテストする
- azd を最適に使用するために開発環境を構成する
- 一般的なインストールの問題を自力で解決する

このガイドは、オペレーティングシステムや開発環境に関係なく、Azure Developer CLI をインストールおよび構成するのに役立ちます。

## 前提条件

azd をインストールする前に、次を確認してください:
- **Azure サブスクリプション** - [無料アカウントを作成する](https://azure.microsoft.com/free/)
- **Azure CLI** - 認証とリソース管理のため
- **Git** - テンプレートのクローンとバージョン管理のため
- **Docker**（オプション） - コンテナ化されたアプリケーション用

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
1. 最新のリリースを [GitHub](https://github.com/Azure/azure-dev/releases) からダウンロードします
2. `C:\Program Files\azd\` に展開します
3. PATH 環境変数に追加します

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
# Microsoft のパッケージリポジトリを追加する
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd は GitHub Codespaces にプレインストールされています。codespace を作成してすぐに azd を使用できます。

### Docker

```bash
# コンテナで azd を実行する
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# より簡単に使えるようにエイリアスを作成する
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ インストールの確認

インストール後、azd が正しく動作していることを確認します:

```bash
# バージョンを確認する
azd version

# ヘルプを表示する
azd --help

# 利用可能なテンプレートを一覧表示する
azd template list
```

期待される出力:
```
azd version 1.x.x (commit xxxxxx)
```

<strong>注</strong>: 実際のバージョン番号は異なる場合があります。最新のバージョンは [Azure Developer CLI リリース](https://github.com/Azure/azure-dev/releases) を確認してください。

**✅ インストール成功チェックリスト:**
- [ ] `azd version` がエラーなくバージョン番号を表示する
- [ ] `azd --help` がコマンドのドキュメントを表示する
- [ ] `azd template list` が利用可能なテンプレートを表示する
- [ ] `az account show` が Azure サブスクリプションを表示する
- [ ] テスト用ディレクトリを作成し、`azd init` を正常に実行できる

**すべてのチェックが通ったら、[最初のプロジェクト](first-project.md) に進む準備ができています！**

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
ヘッドレス環境にいる場合やブラウザの問題がある場合:
```bash
az login --use-device-code
```

### サービスプリンシパル（CI/CD）
自動化された環境向け:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## 設定

### グローバル設定
```bash
# 既定のサブスクリプションを設定する
azd config set defaults.subscription <subscription-id>

# 既定の場所を設定する
azd config set defaults.location eastus2

# すべての構成を表示する
azd config list
```

### 環境変数
シェルプロファイル（`.bashrc`, `.zshrc`, `.profile`）に追加してください:
```bash
# Azure の構成
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd の構成
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # デバッグログを有効にする
```

## IDE 統合

### Visual Studio Code
Azure Developer CLI 拡張機能をインストールします:
1. VS Code を開く
2. Extensions に移動する (Ctrl+Shift+X)
3. "Azure Developer CLI" を検索する
4. 拡張機能をインストールする

機能:
- azure.yaml の IntelliSense
- 統合ターミナルコマンド
- テンプレートの参照
- デプロイの監視

### GitHub Codespaces
`.devcontainer/devcontainer.json` を作成します:
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
1. Azure プラグインをインストールする
2. Azure の資格情報を設定する
3. 統合ターミナルで azd コマンドを使用する

## 🐛 インストールのトラブルシューティング

### 一般的な問題

#### 許可が拒否されました（Windows）
```powershell
# PowerShell を管理者として実行してください
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH の問題
azd を手動で PATH に追加します:

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

### 追加のヘルプを得る
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
azd は更新が利用可能になると通知します:
```bash
azd version --check-for-updates
```

### 手動更新

**Windows（winget）:**
```cmd
winget upgrade Microsoft.Azd
```

**macOS（Homebrew）:**
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

**Azure CLI (az)**: 個々の Azure リソースを管理するための低レベルのツール
- `az webapp create`, `az storage account create`
- 一度に1つのリソースを操作
- インフラ管理に重点

**Azure Developer CLI (azd)**: アプリケーション全体のデプロイ向けの高レベルツール
- `azd up` はすべてのリソースを含むアプリ全体をデプロイする
- テンプレートベースのワークフロー
- 開発者の生産性に重点

<strong>両方が必要です</strong>: azd は認証のために az CLI を使用します
</details>

<details>
<summary><strong>既存の Azure リソースと azd を一緒に使えますか？</strong></summary>

はい！次のことができます:
1. 既存のリソースを azd 環境にインポートする
2. Bicep テンプレート内で既存のリソースを参照する
3. 既存のインフラと並行して azd を使って新しいデプロイを行う

詳細は [構成ガイド](configuration.md) を参照してください。
</details>

<details>
<summary><strong>azd は Azure Government や Azure China でも使えますか？</strong></summary>

はい、クラウドを設定してください:
```bash
# Azure Government（政府向け）
az cloud set --name AzureUSGovernment
az login

# Azure China（中国向け）
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>CI/CD パイプラインで azd を使えますか？</strong></summary>

もちろんです！azd は自動化向けに設計されています:
- GitHub Actions 統合
- Azure DevOps サポート
- サービスプリンシパル認証
- 非対話モード

CI/CD のパターンについては [デプロイガイド](../chapter-04-infrastructure/deployment-guide.md) を参照してください。
</details>

<details>
<summary><strong>azd を使うのに費用はかかりますか？</strong></summary>

azd 自体は <strong>完全に無料</strong> でオープンソースです。支払うのは次のとおりです:
- デプロイする Azure リソース
- Azure の消費コスト（コンピュート、ストレージなど）

デプロイ前にコストを見積もるには `azd provision --preview` を使用してください。
</details>

## 次のステップ

1. <strong>認証を完了する</strong>: Azure サブスクリプションにアクセスできることを確認する
2. <strong>最初のデプロイを試す</strong>: [最初のプロジェクト](first-project.md) に従ってください
3. <strong>テンプレートを探る</strong>: `azd template list` で利用可能なテンプレートを参照する
4. **IDE を構成する**: 開発環境をセットアップする

## サポート

問題が発生した場合:
- [公式ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [問題を報告](https://github.com/Azure/azure-dev/issues)
- [コミュニティの議論](https://github.com/Azure/azure-dev/discussions)
- [Azure サポート](https://azure.microsoft.com/support/)
- [**Azure エージェント スキル**](https://skills.sh/microsoft/github-copilot-for-azure) - `npx skills add microsoft/github-copilot-for-azure` を使ってエディタ内で直接 Azure コマンドのガイダンスを取得できます

---

**章ナビゲーション:**
- **📚 コースホーム**: [AZD 初心者向け](../../README.md)
- **📖 現在の章**: 第1章 - 基礎とクイックスタート
- **⬅️ 前へ**: [AZD 基本](azd-basics.md) 
- **➡️ 次へ**: [最初のプロジェクト](first-project.md)
- **🚀 次の章**: [第2章：AIファースト開発](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ インストール完了！** 続けて [最初のプロジェクト](first-project.md) に進み、azd での開発を開始してください。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:
この文書は、AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されました。正確性の確保に努めていますが、自動翻訳には誤りや不正確さが含まれる場合があることにご注意ください。原文（原言語の文書）が権威ある一次資料と見なされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の使用に起因するいかなる誤解や解釈違いについても、当方は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->