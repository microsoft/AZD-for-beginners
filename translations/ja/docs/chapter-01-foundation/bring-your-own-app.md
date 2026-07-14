# 既存のプロジェクトに azd を追加する - Bring Your Own App

**章ナビゲーション：**
- **📚 コースホーム**: [AZD入門](../../README.md)
- **📖 現在の章**: 第1章 - 基礎とクイックスタート
- **⬅️ 前へ**: [最初のプロジェクト](first-project.md)
- **➡️ 次へ**: [Dev コンテナと Codespaces](dev-containers.md)

> 2026年7月に `azd 1.27.1` で検証済み。

## はじめに

[最初のプロジェクト](first-project.md) では、テンプレートから始めてアプリをデプロイしました。しかし多くの場合、Node.js API、Python Flaskサービス、.NETウェブアプリなどの既存のアプリがすでにあなたのマシンのフォルダーにあります。このレッスンでは、その既存のコードに azd を追加して、テンプレートなしで `azd up` でデプロイできるようにする方法を説明します。

## 学習目標

このレッスンの終了時には、以下ができるようになります：
- azd プロジェクトを開始する3つの方法を理解する
- 既存のコードベース内で `azd init` を実行する
- `azure.yaml` と `infra/` フォルダーがアプリに何をするか理解する
- azd にインフラを生成させるか、自分で書くべきかを判断する
- 既存のアプリを `azd up` で Azure にデプロイする

## 学習成果

このレッスンを終えると、以下ができるようになります：
- すでにあるプロジェクトに azd を初期化する
- 基本的な `azure.yaml` ファイルの読み書きができる
- `azd infra generate` でスターターインフラを生成する
- アプリに適した Azure ホストを選ぶ
- 自分のアプリをデプロイしてクリーンアップする

---

## azd プロジェクトを開始する3つの方法

| 開始点 | コマンド | 使う時 |
|----------------|---------|-------------|
| <strong>テンプレートから</strong> | `azd init --template <name>` | 学習や実績のあるサンプルから新しいアプリを始める時 |
| <strong>既存のコードから</strong> | `azd init` （プロジェクトフォルダー内で） | すでにアプリがあり、それをデプロイしたい時 |
| **Gitリポジトリから** | `azd init --from-code` （クローン済みリポジトリ内で） | 既存リポジトリに azd を導入する時 |

最初の選択肢はすでに練習済みです。このレッスンは2番目の、実際で最も一般的なケースを扱います。

---

## ステップ1：プロジェクトで `azd init` を実行する

<strong>既存のプロジェクトフォルダー内で</strong> ターミナルを開いて、次を実行します：

```bash
cd my-existing-app
azd init
```

azd は初期化方法を尋ねてきます。選択してください：

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

**「現在のディレクトリのコードを使う」** を選ぶと、azd がフォルダーをスキャンし、言語とフレームワークを検出してホストを提案します。

### azd が検出するもの

azd は `package.json`、`requirements.txt`、`pom.xml`、`*.csproj`、または `Dockerfile` のような手がかりを探し、適した Azure ホストを提案します：

| あなたのアプリ | 検出される可能性のあるホスト |
|----------|----------------------|
| Node.js / Python / .NET ウェブアプリ | Azure App Service または Container Apps |
| コンテナ化アプリ (`Dockerfile`) | Azure Container Apps |
| ファンクションアプリ | Azure Functions |
| 静的サイト（React/Vue のビルド出力） | Azure Static Web Apps |

検出されたサービスを確認し、azd は必要なファイルを足場として作成します。

---

## ステップ2：azd が作成したものを理解する

初期化後、プロジェクトに2つの新しいものが追加されます：

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — プロジェクト定義

これは azd プロジェクトの中心です。最小限の例は以下のようになります：

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

`services` ブロックが重要な部分で、コードのフォルダーと Azure ホストの対応付けをします。フロントエンドと API の両方がある場合、それぞれにサービスが作られます。

### `infra/` — コードとしての Azure リソース

`infra/` フォルダーはアプリに必要な Azure リソース（App Service、データベースなど）を定義する Bicep ファイルを格納します。手書きは不要で、azd が動作する出発点を生成します。後でリソースを追加したりセキュリティを強化したりするために編集できます（[第4章](../chapter-04-infrastructure/README.md)で解説）。

> **ヒント：** デプロイする前に生成されたインフラを確認・カスタマイズしたい場合は、`azd infra generate`（`azd infra synth` とも呼ばれる）を実行して IaC をディスクに書き出し、レビューやバージョン管理が可能です。

---

## ステップ3：必要な設定を行う

アプリが設定や秘密情報（接続文字列、APIキーなど）を必要とする場合、ハードコードしないでください。環境変数を使用しましょう：

```bash
# 環境を作成する
azd env new dev

# 非秘密の値を設定する
azd env set API_VERSION 1.0.0
```

実際の秘密情報は Key Vault に保存し、インフラから参照してください—[第3章：設定と認証](../chapter-03-configuration/authsecurity.md)を参照。

---

## ステップ4：デプロイ

さて、すでに知っているワークフローを使いましょう：

```bash
# 認証（azdに必須）
azd auth login

# 作成されるリソースのプレビュー
azd provision --preview

# インフラストラクチャのプロビジョニングとコードのデプロイ
azd up
```

終了すると、azd はアプリの URL を表示します。通常の azd アプリと同様に検証してください：

```bash
azd show           # エンドポイントを表示
azd monitor --logs # 必要に応じてログを確認してください
```

---

## 初めてのよくある問題

| 症状 | 原因の可能性 | 修正方法 |
|---------|--------------|-----|
| azd がアプリを検出しなかった | マニフェストがない（例：`package.json`） | マニフェストを追加するか、`azd init` 時に手動でホストを選ぶ |
| `azd up` 実行時にビルド失敗 | アプリにビルドステップが必要 | `azure.yaml` のサービスの下に `buildCommand`/`outputPath` を追加 |
| アプリは起動するがエラーを返す | 設定や秘密情報が不足 | `azd env set` で設定するか、Key Vault を接続する |
| 誤ったホストが選ばれた | 自動検出の誤推定 | `azure.yaml` の `host:` を修正して `azd up` を再実行 |

詳しくは [第7章：トラブルシューティング](../chapter-07-troubleshooting/README.md) をご覧ください。

---

## クリーンアップ

```bash
azd down --force --purge
```

---

## まとめ

- `azd init` → **「現在のディレクトリのコードを使う」** で既存のアプリに azd を追加します。
- `azure.yaml` はコードフォルダーと Azure ホストの対応を行い、`infra/` はリソースを Bicep で定義します。
- `azd infra generate` で生成されたインフラをレビューやカスタマイズができます。
- 初期化後は、既存のアプリもテンプレートベースのアプリと同じ `azd up` / `azd down` ワークフローを使います。

---

## 🔗 ナビゲーション

| 方向 | レッスン |
|-----------|--------|
| <strong>前へ</strong> | [最初のプロジェクト](first-project.md) |
| <strong>次へ</strong> | [Dev コンテナと Codespaces](dev-containers.md) |

## 📖 関連資料

- [AZD 基本](azd-basics.md)
- [第4章：コードとしてのインフラ](../chapter-04-infrastructure/README.md)
- [設定と認証](../chapter-03-configuration/authsecurity.md)
- [コマンド チートシート](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->