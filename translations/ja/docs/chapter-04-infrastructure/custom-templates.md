# Authoring Your Own azd Template

**Chapter Navigation:**
- **📚 コースホーム**: [AZD 入門](../../README.md)
- **📖 現在の章**: 第4章 - インフラをコード化とデプロイ
- **⬅️ 前へ**: [デプロイガイド](deployment-guide.md)
- **🚀 次の章**: [第5章: マルチエージェント ソリューション](../chapter-05-multi-agent/README.md)

> 2026年6月に `azd 1.25.6` で検証済み。

## Introduction

これまで `azd init --template <name>` でテンプレートを「消費」してきました。しかし、チームが好むプロジェクト構成、例えば Cosmos DB と適切な監視を備えた Container App ができたら、それを再利用可能なテンプレートに変換したくなるでしょう。テンプレートとは、azd が読み取れる予測可能な構成を持つ Git リポジトリに過ぎません。このレッスンでは、ゼロから作成し、テストし、（オプションで）コミュニティギャラリーに公開する方法を示します。

## Learning Goals

このレッスンを終了するまでに、あなたは以下を達成できます:
- フォルダが「azd テンプレート」として扱われる条件を理解する
- 必要なファイルとフォルダのレイアウトを知る
- 他の人が再利用できるように `azure.yaml` と `infra/` を追加する
- 共有前にテンプレートをローカルでテストする
- 公開して（オプションで）Awesome AZD に提出する

## Learning Outcomes

このレッスンを完了すると、あなたは次のことができるようになります:
- 新しいテンプレートリポジトリをスキャフォールドする
- インフラをパラメータ化して任意のサブスクリプションで動作させる
- `azd init` と `azd up` でテンプレートを検証する
- コミュニティギャラリーが要求するメタデータを追加する

---

## What Is a Template, Really?

azd テンプレートは **Git リポジトリ** であり、最低限次を含みます:

| File / folder | Purpose | Required? |
|---------------|---------|-----------|
| `azure.yaml` | サービス、ホスト、インフラプロバイダーを記述する | ✅ はい |
| `infra/` | リソースをプロビジョニングする Bicep、Terraform、または Pulumi | ✅ はい |
| `src/` (or your code) | azd がデプロイするアプリケーションコード | ✅ はい |
| `README.md` | テンプレートの使い方 | ✅ 強く推奨 |
| `.azdo/` or `.github/` | CI/CD パイプライン定義 | 任意 |
| `.devcontainer/` | 再現可能な開発環境 | 任意 |
| `azure.yaml` `metadata` | ギャラリー + テレメトリ情報 | 任意（公開するには必須） |

ここに魔法はありません: `azd init --template you/your-repo` を実行すると、azd はリポジトリをクローンして `azure.yaml` を読みます。

---

## Step 1: Scaffold the Repository

フォルダ構成を手動で作成するか、最小限のテンプレートから開始して編集します:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# 標準レイアウトを作成する
mkdir -p src infra
```

典型的な完成レイアウトは次のようになります:

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

## Step 2: Write `azure.yaml`

これはテンプレートの核です。azd に何をデプロイするかと方法を伝えます:

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

> `metadata.template` フィールドはギャラリーテレメトリが使用して利用状況をカウントするためのものです。`name@version` の命名規則を使用してください。

---

## Step 3: Parameterize the Infrastructure

再利用可能なテンプレートにとって最も重要なルール: **名前、リージョン、サブスクリプション固有の値をハードコードしてはいけません。** パラメータとリソーストークンパターンを使用して、同じテンプレートが誰のサブスクリプションでも動作するようにします。

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

このテンプレートをフレンドリーにする要素は二つあります:

1. **`azd-env-name` tag** — azd はこれを使用して環境ごとにリソースを追跡およびクリーンアップします。
2. **`uniqueString(...)` resource token** — 名前の衝突を避けるために安定したグローバル一意のサフィックスを生成します。

azd が環境から注入する値を読み取る一致するパラメータファイルを用意してください:

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

## Step 4: Test Your Template Locally

共有する前に、クリーンな状態からテンプレートが動作することを確認してください。

<strong>ローカルフォルダからテストする</strong>（Git のプッシュは不要）:

```bash
# 空のディレクトリからローカルのテンプレートパスを使って初期化する
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# プロビジョニングとデプロイをエンドツーエンドで実行する
azd auth login
azd up
```

<strong>次にテアダウンをテストします</strong>—優れたテンプレートは完全にクリーンアップします:

```bash
azd down --force --purge
```

もし `azd down` がリソースを残すなら、おそらくリソースに `azd-env-name` タグを付け忘れています。

> **Tip:** まず `azd provision --preview` を実行してください。これは what-if を行い、リソース作成前にテンプレートエラーを浮き彫りにします。

---

## Step 5: Publish the Template

リポジトリを GitHub にプッシュします（他の人に使ってほしい場合はパブリック）:

```bash
gh repo create my-azd-template --public --source=. --push
```

これで誰でも使用できます:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Step 6 (Optional): Submit to Awesome AZD

[Awesome AZD ギャラリー](https://azure.github.io/awesome-azd/) はコミュニティテンプレートを一覧表示します。掲載されるにはリポジトリに以下が含まれているべきです:

- ✅ 前提条件、アーキテクチャ図、およびコスト注記を含む明確な `README.md`
- ✅ `metadata.template` を含む動作する `azure.yaml`
- ✅ 新しいサブスクリプションでクリーンにプロビジョニングされるインフラ
- ✅ `LICENSE` ファイル
- ✅ （推奨）ワンクリックの Codespaces のための `.devcontainer/`

テンプレートをギャラリーのデータファイルに追加するプルリクエストを開き、[Awesome AZD リポジトリ](https://github.com/Azure/awesome-azd) の貢献ガイドに従って提出してください。

---

## Common Pitfalls

| Pitfall | Fix |
|---------|-----|
| ハードコードされたリソース名 | `uniqueString()` リソーストークンを使用する |
| `azd down` がリソースを残す | すべてのリソース（またはリソースグループ）に `azd-env-name` タグを付ける |
| テンプレートはあなたの環境で動くが他では失敗する | サブスクリプション ID、テナント ID、リージョンの仮定を取り除く |
| 出力がアプリに配線されていない | `SERVICE_<NAME>_ENDPOINT_URL` や他の `AZURE_*` 出力をエクスポートする |
| ギャラリー提出が拒否される | `README.md`、`LICENSE`、および `metadata.template` を追加する |

---

## Summary

- テンプレートは `azure.yaml`、`infra/`、およびあなたのコードを含む単なる Git リポジトリです。
- 名前、リージョン、ID などをすべてパラメータ化してどこでも実行できるようにする。
- いつもリソースに `azd-env-name` タグを付けて `azd down` が機能するようにする。
- 公開前に `azd init --template <local-path>` でローカルテストする。
- Awesome AZD に提出するにはメタデータと README を追加する。

---

## 🔗 Navigation

| Direction | Resource |
|-----------|----------|
| **Previous** | [デプロイガイド](deployment-guide.md) |
| **Chapter Home** | [第4章: インフラをコード化](README.md) |
| **Next Chapter** | [第5章: マルチエージェント ソリューション](../chapter-05-multi-agent/README.md) |

## 📖 Related Resources

- [リソースのプロビジョニング](provisioning.md)
- [Awesome AZD ギャラリー](https://azure.github.io/awesome-azd/)
- [公式 azd テンプレート ドキュメント](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->