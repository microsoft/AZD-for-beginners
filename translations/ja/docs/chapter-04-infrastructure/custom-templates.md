# 自分自身の azd テンプレートの作成

**章ナビゲーション:**
- **📚 コースホーム**: [AZD 入門](../../README.md)
- **📖 現在の章**: 第4章 - インフラストラクチャー・アズ・コード & デプロイメント
- **⬅️ 前へ**: [デプロイメントガイド](deployment-guide.md)
- **🚀 次の章**: [第5章: マルチエージェントソリューション](../chapter-05-multi-agent/README.md)

> 2026年7月時点で `azd 1.27.1` で検証済み。

## はじめに

これまで `azd init --template <name>` でテンプレートを<em>利用</em>してきました。しかし、プロジェクトのレイアウトがチームに好まれるものになったら—例えば、Cosmos DB と適切なモニタリングを備えたコンテナーアプリなど—自身の再利用可能なテンプレートに変換したいでしょう。テンプレートとは、azd が読み取れる予測可能な構造を持つ Git リポジトリに過ぎません。このレッスンでは、ゼロからテンプレートを作成し、テストし、（任意で）コミュニティギャラリーに公開する方法を示します。

## 学習目標

このレッスンを終える頃には、あなたは以下ができるようになります:
- フォルダーが「azd テンプレート」である条件を理解する
- 必要なファイルとフォルダー構成を知る
- 他の人が再利用できる `azure.yaml` と `infra/` を追加する
- 共有前にテンプレートをローカルでテストする
- 公開し（任意で）Awesome AZD に提出する

## 学習成果

このレッスン完了後には、以下が可能になります:
- 新規テンプレートリポジトリのスキャフォールド
- あらゆるサブスクリプションで動作するようにインフラをパラメーター化
- `azd init` と `azd up` でテンプレートを検証
- コミュニティギャラリーが必要とするメタデータを追加

---

## テンプレートとは何か？

azd テンプレートは<strong>Gitリポジトリ</strong>であり、最低限以下を含みます:

| ファイル / フォルダー | 目的 | 必須？ |
|---------------|---------|-----------|
| `azure.yaml` | サービス、ホスト、インフラプロバイダーを記述 | ✅ 必須 |
| `infra/` | リソースをプロビジョニングする Bicep、Terraform、または Pulumi | ✅ 必須 |
| `src/` (またはコード) | azd がデプロイするアプリケーションコード | ✅ 必須 |
| `README.md` | テンプレートの使い方 | ✅ 強く推奨 |
| `.azdo/` または `.github/` | CI/CD パイプライン定義 | 任意 |
| `.devcontainer/` | 再現可能な開発環境 | 任意 |
| `azure.yaml` の `metadata` | ギャラリー＋テレメトリ情報 | 任意（公開には必須） |

何も魔法ではありません: `azd init --template you/your-repo` を実行すると azd はリポジトリをクローンし `azure.yaml` を読み込みます。

---

## ステップ1: リポジトリのスキャフォールド

フォルダー構造を手動で作成するか、最小限のテンプレートから始めて編集します:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# 標準レイアウトを作成する
mkdir -p src infra
```

完成した典型的なレイアウトは以下のようになります:

```
my-azd-template/
├── azure.yaml              # ← template definition
├── README.md               # ← how to use it
├── infra/
│   ├── main.bicep          # entry point
│   ├── main.parameters.json
│   └── modules/
│       └── web.bicep
├── src/
│   └── app/                # your application code
└── .github/
    └── workflows/
        └── azure-dev.yml   # optional CI/CD
```

---

## ステップ2: `azure.yaml` の作成

これはテンプレートの心臓部です。azd に何をどうデプロイするかを伝えます:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # or "terraform" / "pulumi"
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> `metadata.template` フィールドはギャラリーテレメトリが使用し使用状況をカウントします。`name@version` の規約を使います。

---

## ステップ3: インフラのパラメーター化

<em>再利用可能</em>なテンプレートにおける最も重要なルールは：**決して名前、リージョン、サブスクリプション固有の値をハードコードしないこと。** パラメーターとリソーストークンパターンを使うことで、同じテンプレートが誰のサブスクリプションでも動作します。

```bicep
// infra/main.bicep
targetScope = 'resourceGroup'

@minLength(1)
@description('Primary location for all resources')
param location string = resourceGroup().location

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

module web 'modules/web.bicep' = {
  name: 'web'
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

これによりテンプレートに適したものになります:

1. **`azd-env-name` タグ** — azd が環境ごとにリソースを追跡・クリーンアップするために使用
2. **`uniqueString(...)` リソーストークン** — 名前が衝突しないように安定したグローバルでユニークな接尾辞を生成

azd が環境から注入する値を読み取る対応するパラメーター ファイルを用意します:

```json
// infra/main.parameters.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd は現在の環境から `${AZURE_ENV_NAME}` と `${AZURE_LOCATION}` を自動的に置換します。

---

## ステップ4: ローカルでテンプレートをテスト

共有する前に、クリーンな状態からテンプレートが動作することを証明します。

<strong>ローカルフォルダからテストする</strong>（Git プッシュ不要）:

```bash
# 空のディレクトリから、ローカルテンプレートパスを使用して初期化します
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# プロビジョニング＋エンドツーエンドのデプロイ
azd auth login
azd up
```

**次に teardown をテスト** — 良いテンプレートは完全にクリーンアップします:

```bash
azd down --force --purge
```

`azd down` がリソースを残す場合、おそらくリソースに `azd-env-name` タグが付いていないのです。

> **ヒント:** まず `azd provision --preview` を実行してください。これにより what-if 分析が行われ、リソースが作成される前にテンプレートのエラーが表示されます。

---

## ステップ5: テンプレートの公開

リポジトリを GitHub にプッシュします（他の人に使ってもらうなら公開リポジトリに）:

```bash
gh repo create my-azd-template --public --source=. --push
```

これで誰でも使えます:

```bash
azd init --template your-github-username/my-azd-template
```

---

## ステップ6（任意）: Awesome AZD に提出する

[Awesome AZD ギャラリー](https://azure.github.io/awesome-azd/) はコミュニティテンプレートを一覧表示します。掲載されるにはリポジトリに以下が含まれている必要があります:

- ✅ 前提条件、アーキテクチャ図、コスト説明を含む明確な `README.md`
- ✅ `metadata.template` を含む動作する `azure.yaml`
- ✅ 新規サブスクリプションで正常にプロビジョニングするインフラ
- ✅ `LICENSE` ファイル
- ✅（推奨）ワンクリックで Codespaces を開ける `.devcontainer/`

[Awesome AZD リポジトリ](https://github.com/Azure/awesome-azd) の貢献ガイドに従い、ギャラリーのデータファイルにテンプレートを追加するプルリクエストを開いて提出してください。

---

## よくある落とし穴

| 落とし穴 | 解決方法 |
|---------|-----|
| ハードコードされたリソース名 | `uniqueString()` リソーストークンを使う |
| `azd down` でリソースが残る | すべてのリソース（またはリソースグループ）に `azd-env-name` タグを付ける |
| 自分では動くが他人では動かないテンプレート | サブスクリプションID、テナントID、リージョンの想定を除去 |
| アプリにアウトプットが紐付いていない | `SERVICE_<NAME>_ENDPOINT_URL` および他の `AZURE_*` アウトプットをエクスポート |
| ギャラリー提出が拒否される | `README.md`、`LICENSE`、`metadata.template` を追加 |

---

## まとめ

- テンプレートはただの Git リポジトリで、`azure.yaml`、`infra/`、コードを含む。
- すべての名前、リージョン、ID をパラメーター化してどこでも動くようにする。
- 常にリソースに `azd-env-name` タグを付けて `azd down` が機能するように。
- 公開前にローカルで `azd init --template <local-path>` でテスト。
- Awesome AZD に提出するためメタデータと README を追加。

---

## 🔗 ナビゲーション

| 方向 | リソース |
|-----------|----------|
| <strong>前へ</strong> | [デプロイメントガイド](deployment-guide.md) |
| <strong>章ホーム</strong> | [第4章: インフラストラクチャー・アズ・コード](README.md) |
| <strong>次の章</strong> | [第5章: マルチエージェントソリューション](../chapter-05-multi-agent/README.md) |

## 📖 関連リソース

- [リソースのプロビジョニング](provisioning.md)
- [Awesome AZD ギャラリー](https://azure.github.io/awesome-azd/)
- [公式 azd テンプレートドキュメント](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->