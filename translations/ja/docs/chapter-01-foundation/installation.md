# インストールとセットアップガイド

**章のナビゲーション:**
- **📚 コースホーム**: [AZD 入門](../../README.md)
- **📖 現在の章**: 第1章 - 基礎とクイックスタート
- **⬅️ 前へ**: [AZD 基本](azd-basics.md)
- **➡️ 次へ**: [最初のプロジェクト](first-project.md)
- **🚀 次の章**: [第2章：AIファースト開発](../chapter-02-ai-development/microsoft-foundry-integration.md)

## はじめに

この包括的なガイドでは、システムに Azure Developer CLI (azd) をインストールおよび構成する手順を案内します。異なるオペレーティングシステム向けの複数のインストール方法、認証の設定、および Azure へのデプロイに向けた開発環境の初期構成を学習します。

## 学習目標

このレッスンの終了時には、次のことができるようになります:
- お使いのオペレーティングシステムに Azure Developer CLI を正常にインストールする
- 複数の方法を使用して Azure の認証を設定する
- 必要な前提条件をそろえて開発環境をセットアップする
- さまざまなインストールオプションと各オプションの使用タイミングを理解する
- 一般的なインストールおよびセットアップの問題をトラブルシュートできるようにする

## 学習成果

このレッスンを修了すると、次のことができるようになります:
- プラットフォームに応じた方法で `azd` をインストールする
- azd auth login を使用して Azure に認証する
- インストールを検証し、基本的な `azd` コマンドをテストする
- 最適な `azd` 利用のために開発環境を構成する
- 一般的なインストール問題を自力で解決する

このガイドは、オペレーティングシステムや開発環境に関わらず、システムで Azure Developer CLI をインストールおよび構成するのに役立ちます。

## 前提条件

`azd` をインストールする前に、次を確認してください:
- **Azure サブスクリプション** - [無料アカウントを作成する](https://azure.microsoft.com/free/)
- **Azure CLI** - 認証とリソース管理のため
- **Git** - テンプレートのクローンとバージョン管理のため
- **Docker**（オプション） - コンテナ化されたアプリケーション用

## インストール方法

### Windows

#### オプション 1: Windows Package Manager（推奨）
```cmd
winget install microsoft.azd
```

#### オプション 2: PowerShell インストールスクリプト
```powershell
# wingetが利用できないときに便利です
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### オプション 3: Chocolatey
```cmd
choco install azd
```

#### オプション 4: 手動インストール
1. 最新リリースを [GitHub](https://github.com/Azure/azure-dev/releases) からダウンロードする
2. `C:\Program Files\azd\` に解凍する
3. PATH 環境変数に追加する

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

#### オプション 2: パッケージマネージャ

**リリースアセットからの手動インストール:**
```bash
# お使いの Linux アーキテクチャ向けの最新アーカイブを次の URL からダウンロードしてください:
# https://github.com/Azure/azure-dev/releases
# その後、展開して azd バイナリを PATH に追加してください。
```

### GitHub Codespaces

一部の Codespaces や dev コンテナ環境にはすでに `azd` が含まれている場合がありますが、推測せずに確認してください：

```bash
azd version
```

`azd` が欠けている場合は、その環境用の標準スクリプトでインストールしてください。

### Docker

```bash
# コンテナで azd を実行する
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# 使いやすくするためにエイリアスを作成する
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ インストールの確認

インストール後、`azd` が正しく動作しているか確認します：

```bash
# バージョンを確認
azd version

# ヘルプを表示
azd --help

# 利用可能なテンプレートを一覧表示
azd template list
```

期待される出力：
```
azd version 1.x.x (commit xxxxxx)
```

<strong>注意</strong>: 実際のバージョン番号は異なります。最新バージョンは [Azure Developer CLI のリリース](https://github.com/Azure/azure-dev/releases) を確認してください。

**✅ インストール成功チェックリスト:**
- [ ] `azd version` がエラーなくバージョン番号を表示する
- [ ] `azd --help` がコマンドのヘルプを表示する
- [ ] `azd template list` が利用可能なテンプレートを表示する
- [ ] テスト用ディレクトリを作成し、`azd init` を正常に実行できる

**すべてのチェックが合格したら、[最初のプロジェクト](first-project.md) に進む準備ができています！**

## 認証のセットアップ

### 推奨される初心者向けセットアップ

AZD 優先のワークフローでは、`azd auth login` でサインインしてください。

```bash
# azd up のような azd コマンドに必要です
azd auth login

# AZD の認証状態を確認する
azd auth login --check-status
```

コース中に自分で `az` コマンドを実行する予定がある場合にのみ、Azure CLI のサインインを使用してください。

### Azure CLI 認証（オプション）
```bash
# まだインストールされていない場合は Azure CLI をインストールする
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: ご使用のディストリビューション向けの Azure CLI インストール手順を参照してください

# Azure にログインする
az login

# 認証を確認する
az account show
```

### どのサインインフローを使用すべきですか？

- 初心者向け AZD パスに従い主に `azd` コマンドを実行する場合は、`azd auth login` を使用してください。
- `az account show` のような Azure CLI コマンドを実行したり、リソースを直接確認したい場合は、`az login` も使用してください。
- 演習に `azd` と `az` の両方のコマンドが含まれる場合は、開始時に両方のサインインコマンドを一度実行してください。

### デバイスコード認証
ヘッドレスシステムを使用しているかブラウザーに問題がある場合：
```bash
azd auth login --use-device-code
```

### サービスプリンシパル（CI/CD）
自動化環境の場合：
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### セットアップ全体の検証

第1章を始める前に簡単な準備チェックを行いたい場合：

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## 設定

### グローバル設定
```bash
# 既定のサブスクリプションを設定する
azd config set defaults.subscription <subscription-id>

# 既定の場所を設定する
azd config set defaults.location eastus2

# すべての設定を表示する
azd config show
```

### 環境変数
シェルプロファイル（`.bashrc`, `.zshrc`, `.profile`）に追加：
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
Azure Developer CLI 拡張機能をインストール：
1. VS Code を開く
2. 拡張機能に移動（Ctrl+Shift+X）
3. 「Azure Developer CLI」を検索する
4. 拡張機能をインストールする

機能:
- azure.yaml の IntelliSense
- 統合ターミナルでのコマンド
- テンプレートの参照
- デプロイ監視

### GitHub Codespaces
`.devcontainer/devcontainer.json` を作成：
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
2. Azure の認証情報を設定する
3. 統合ターミナルで `azd` コマンドを使用する

## 🐛 インストールのトラブルシューティング

### よくある問題

#### 許可が拒否されました（Windows）
```powershell
# PowerShell を管理者として実行する
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH の問題
手動で `azd` を PATH に追加：

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
# Windows: winget uninstall microsoft.azd を実行する
# macOS: brew uninstall azd を実行する
# Linux: 再インストールする前に以前の azd バイナリまたはシンボリックリンクを削除する

# 設定をクリーンアップする
rm -rf ~/.azd
```

### さらにサポートを得る
```bash
# デバッグログを有効にする
export AZD_DEBUG=true
azd <command> --debug

# 現在の設定を表示する
azd config show

# 現在のデプロイ状況を表示する
azd show
```

## azd の更新

### 更新の確認
`azd` は新しいリリースが利用可能な場合に警告し、現在のビルドを次で確認できます：
```bash
azd version
```

### 手動更新

**Windows (winget):**
```cmd
winget upgrade microsoft.azd
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

**Azure CLI (az)**: 個々の Azure リソースを管理する低レベルツール
- `az webapp create`, `az storage account create`
- 一度に1つのリソース
- インフラ管理に焦点

**Azure Developer CLI (azd)**: アプリケーション全体のデプロイ向けのハイレベルツール
- `azd up` はすべてのリソースを含むアプリ全体をデプロイします
- テンプレートベースのワークフロー
- 開発者の生産性に焦点

<strong>両方必要です</strong>: azd は認証に az CLI を使用します
</details>

<details>
<summary><strong>既存の Azure リソースで azd を使用できますか？</strong></summary>

はい！次が可能です：
1. 既存のリソースを azd 環境にインポートする
2. Bicep テンプレートで既存リソースを参照する
3. 既存インフラと並行して新規デプロイに azd を使用する

詳細は [構成ガイド](configuration.md) を参照してください。
</details>

<details>
<summary><strong>azd は Azure Government または Azure China で動作しますか？</strong></summary>

はい、クラウドを設定してください：
```bash
# Azure（政府向け）
az cloud set --name AzureUSGovernment
az login

# Azure 中国
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>CI/CD パイプラインで azd を使用できますか？</strong></summary>

その通りです！azd は自動化向けに設計されています：
- GitHub Actions との統合
- Azure DevOps のサポート
- サービスプリンシパル認証
- 非対話モード

CI/CD パターンの詳細は [デプロイ ガイド](../chapter-04-infrastructure/deployment-guide.md) を参照してください。
</details>

<details>
<summary><strong>azd の使用コストはどれくらいですか？</strong></summary>

azd 自体は <strong>完全に無料</strong> でオープンソースです。支払うのは次だけです：
- デプロイする Azure リソース
- Azure の消費コスト（コンピュート、ストレージなど）

デプロイ前のコスト見積もりには `azd provision --preview` を使用してください。
</details>

## 次のステップ

1. <strong>認証を完了する</strong>：Azure サブスクリプションにアクセスできることを確認する
2. <strong>最初のデプロイを試す</strong>： [最初のプロジェクト ガイド](first-project.md) に従う
3. <strong>テンプレートを探索する</strong>：`azd template list` で利用可能なテンプレートを参照する
4. **IDE を構成する**：開発環境をセットアップする

## サポート

問題が発生した場合：
- [公式ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [問題を報告する](https://github.com/Azure/azure-dev/issues)
- [コミュニティディスカッション](https://github.com/Azure/azure-dev/discussions)
- [Azure サポート](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - エディタ内で直接 Azure コマンドガイダンスを取得するには `npx skills add microsoft/github-copilot-for-azure` を実行してください

---

**章のナビゲーション:**
- **📚 コースホーム**: [AZD 入門](../../README.md)
- **📖 現在の章**: 第1章 - 基礎とクイックスタート
- **⬅️ 前へ**: [AZD 基本](azd-basics.md) 
- **➡️ 次へ**: [最初のプロジェクト](first-project.md)
- **🚀 次の章**: [第2章：AIファースト開発](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ インストール完了！** 続けて [最初のプロジェクト](first-project.md) に進み、azd で構築を開始してください。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:
本書類は AI 翻訳サービス [Co-op トランスレーター](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性の確保に努めていますが、自動翻訳には誤りや不正確な点が含まれている可能性があることにご注意ください。原文（母語版）を正式な情報源とみなしてください。重要な情報については、専門の人による翻訳を推奨します。本翻訳の使用により生じたいかなる誤解や誤訳についても、当社は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->