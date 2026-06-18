# 自分のアプリを使う - 既存のプロジェクトに azd を追加する

**章ナビゲーション:**
- **📚 コースホーム**: [AZD 入門](../../README.md)
- **📖 現在の章**: 第1章 - 基礎とクイックスタート
- **⬅️ 前へ**: [最初のプロジェクト](first-project.md)
- **➡️ 次へ**: [Dev コンテナと Codespaces](dev-containers.md)

> 2026年6月時点で `azd 1.25.6` と検証済み。

## はじめに

前章の [最初のプロジェクト](first-project.md) ではテンプレートから始めてアプリをデプロイしました。しかし多くの場合、ローカルに Node.js API、Python Flask サービス、.NET ウェブアプリなどのアプリが既にフォルダに存在しています。このレッスンでは、その既存のコードに azd を追加し、テンプレート不要で `azd up` でデプロイできるようにする方法を説明します。

## 学習目標

このレッスンを終えるまでに、あなたは以下を行えるようになります:
- azd プロジェクトを開始する3つの方法を理解する
- 既存のコードベース内で `azd init` を実行する
- `azure.yaml` と `infra/` フォルダがアプリに対して何をするかを理解する
- azd にインフラを生成させるべきか自分で書くべきかを判断する
- `azd up` で既存のアプリを Azure にデプロイする

## 学習成果

このレッスンを完了すると、あなたは以下ができるようになります:
- 既にあるプロジェクトに azd を初期化できる
- 基本的な `azure.yaml` ファイルを読み書きできる
- `azd infra generate` でスターターのインフラを生成できる
- アプリに適した Azure ホストを選べる
- 自分のアプリをデプロイしてクリーンアップできる

---

## azd プロジェクトを開始する3つの方法

| 開始方法 | コマンド | 使用する場面 |
|----------------|---------|-------------|
| <strong>テンプレートから</strong> | `azd init --template <name>` | 学習用、または実績あるサンプルから新しいアプリを開始するとき |
| <strong>既存のコードから</strong> | `azd init` (プロジェクトフォルダ内) | 既にアプリがあり、それをデプロイしたい場合 |
| **Git リポジトリから** | `azd init --from-code` (クローンしたリポジトリ内) | 既存リポジトリで azd を導入する場合 |

あなたはすでに最初のオプションを練習しました。本レッスンでは2番目 — 実務で最も一般的なシナリオ — を扱います。

---

## ステップ 1: プロジェクト内で `azd init` を実行する

既存のプロジェクトフォルダの<strong>中で</strong>ターミナルを開き、次を実行します:

```bash
cd my-existing-app
azd init
```

azd は初期化方法を尋ねます。以下を選択してください:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

次に **"現在のディレクトリのコードを使用する."** を選択します。azd はフォルダをスキャンして言語とフレームワークを検出し、ホストを提案します。

### azd が検出するもの

azd は `package.json`、`requirements.txt`、`pom.xml`、`*.csproj`、または `Dockerfile` のような手掛かりを探し、適切な Azure ホストを提案します:

| アプリ | 検出される可能性が高いホスト |
|----------|----------------------|
| Node.js / Python / .NET のウェブアプリ | Azure App Service または Container Apps |
| コンテナ化されたアプリ（`Dockerfile`） | Azure Container Apps |
| 関数アプリ | Azure Functions |
| 静的サイト（React/Vue のビルド出力） | Azure Static Web Apps |

検出されたサービスを確認すると、azd が必要なファイルをスキャフォールド（生成）します。

---

## ステップ 2: azd が作成したものを理解する

初期化後、プロジェクトには次の2つが追加されます:

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

これは azd プロジェクトの中心です。最小限のものは次のようになります:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

`services` ブロックが重要な部分です: 各エントリはコードのフォルダを Azure ホストにマッピングします。アプリにフロントエンドと API の両方がある場合、サービスは2つになります。

### `infra/` — インフラをコードとして

`infra/` フォルダには、アプリが必要とする Azure リソース（App Service、データベースなど）を定義する Bicep ファイルが入ります。これらを手書きする必要はありません — azd は動作する出発点を生成します。後でリソースを追加したりセキュリティを強化するために編集することもできます（[第4章](../chapter-04-infrastructure/README.md)で詳述）。

> **ヒント:** デプロイ前に生成されたインフラを確認またはカスタマイズしたいですか？`azd infra generate`（`azd infra synth` としても利用可能）を実行すると IaC をディスクに書き出すので、レビューやバージョン管理ができます。

---

## ステップ 3: 必要な構成を設定する

アプリが設定やシークレット（接続文字列、API キーなど）を必要とする場合、それらをハードコードしないでください。環境変数を使用します:

```bash
# 環境を作成する
azd env new dev

# 非機密の値を設定する
azd env set API_VERSION 1.0.0
```

本番の機密情報は Key Vault に保存し、インフラストラクチャから参照してください — 詳しくは [第3章: 構成と認証](../chapter-03-configuration/authsecurity.md) を参照。

---

## ステップ 4: デプロイ

これで、既に知っている同じワークフローを使用します:

```bash
# 認証（azdに必須）
azd auth login

# 作成されるリソースをプレビュー
azd provision --preview

# インフラをプロビジョニングしてコードをデプロイする
azd up
```

完了すると、azd はアプリの URL を出力します。通常の azd アプリと同じ方法で検証してください:

```bash
azd show           # エンドポイントを表示
azd monitor --logs # 必要ならログを確認する
```

---

## 初回によくある問題

| 症状 | 考えられる原因 | 対処法 |
|---------|--------------|-----|
| azd がアプリを検出しなかった | マニフェストがない（例: `package.json`） | マニフェストを追加するか、`azd init` 実行時にホストを手動で選択する |
| `azd up` 中にビルドが失敗する | アプリにビルドステップが必要 | `azure.yaml` でサービスの下に `buildCommand`/`outputPath` を追加する |
| アプリは起動するがエラーを返す | 設定/シークレットが不足している | `azd env set` で値を設定するか Key Vault を接続する |
| 間違ったホストが選ばれた | 自動検出が誤った | `azure.yaml` の `host:` を編集し、`azd up` を再実行する |

詳しくは [第7章: トラブルシューティング](../chapter-07-troubleshooting/README.md) を参照してください。

---

## クリーンアップ

```bash
azd down --force --purge
```

---

## まとめ

- `azd init` → **"現在のディレクトリのコードを使用する."** により、既存のアプリに azd を追加します。
- `azure.yaml` はコードフォルダを Azure ホストにマッピングし、`infra/` は Bicep としてリソースを定義します。
- `azd infra generate` により、生成されたインフラをレビューまたはカスタマイズできます。
- 初期化後、既存のアプリはテンプレートベースのアプリと同じ `azd up` / `azd down` ワークフローを使用します。

---

## 🔗 ナビゲーション

| 方向 | レッスン |
|-----------|--------|
| <strong>前へ</strong> | [最初のプロジェクト](first-project.md) |
| <strong>次へ</strong> | [Dev コンテナと Codespaces](dev-containers.md) |

## 📖 関連リソース

- [AZD 基礎](azd-basics.md)
- [第4章: インフラストラクチャをコードとして](../chapter-04-infrastructure/README.md)
- [構成と認証](../chapter-03-configuration/authsecurity.md)
- [コマンドチートシート](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->