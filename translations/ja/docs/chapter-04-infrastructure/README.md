# 第4章: インフラをコードで管理 & デプロイ

**📚 コース**: [AZD 入門](../../README.md) | **⏱️ 所要時間**: 1-1.5 時間 | **⭐ レベル**: 中級

---

## 概要

この章では、Bicep テンプレートを用いた Infrastructure as Code (IaC) パターン、リソースのプロビジョニング、および Azure Developer CLI を使用したデプロイ戦略について扱います。

> 2026年6月に `azd 1.25.6` で検証済み。

## 学習目標

この章を完了すると、以下を学習できます:
- Bicep テンプレートの構造と構文を理解する
- `azd provision` で Azure リソースをプロビジョニングする
- `azd deploy` でアプリケーションをデプロイする
- ブルー/グリーンおよびローリングデプロイ戦略を実装する

---

## 📚 レッスン

| # | レッスン | 説明 | 時間 |
|---|--------|-------------|------|
| 1 | [リソースのプロビジョニング](provisioning.md) | AZD を使用した Azure リソース管理 | 45 分 |
| 2 | [デプロイガイド](deployment-guide.md) | アプリケーションのデプロイ戦略 | 45 分 |
| 3 | [独自テンプレートの作成](custom-templates.md) | 再利用可能な azd テンプレートの作成と公開 | 30 分 |

---

## 🚀 クイックスタート

```bash
# テンプレートから初期化
azd init --template azure-functions-python-v2-http

# 作成されるものをプレビューする
azd provision --preview

# インフラのみプロビジョニング
azd provision

# コードのみデプロイ
azd deploy

# または両方を同時に
azd up
```

---

## 📁 AZD プロジェクト構成

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 重要なコマンド

| コマンド | 説明 |
|---------|-------------|
| `azd init` | プロジェクトを初期化 |
| `azd provision` | Azure リソースを作成 |
| `azd deploy` | アプリケーションコードをデプロイ |
| `azd up` | プロビジョニング + デプロイ |
| `azd down` | すべてのリソースを削除 |

---

## 🔗 ナビゲーション

| 移動 | 章 |
|-----------|---------|
| <strong>前へ</strong> | [第3章: 構成](../chapter-03-configuration/README.md) |
| <strong>次へ</strong> | [第5章: マルチエージェント ソリューション](../chapter-05-multi-agent/README.md) |

---

## 📖 関連リソース

- [デプロイ前チェック](../chapter-06-pre-deployment/README.md)
- [コンテナアプリの例](../../examples/container-app/README.md)
- [データベースアプリの例](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->