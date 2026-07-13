# 第4章: インフラストラクチャをコード化＆デプロイ

**📚 コース**: [AZD For Beginners](../../README.md) | **⏱️ 所要時間**: 1～1.5時間 | **⭐ 難易度**: 中級

---

## 概要

本章では、Bicep テンプレートを用いたインフラストラクチャコード（IaC）パターン、リソースのプロビジョニング、および Azure Developer CLI を使ったデプロイ戦略を扱います。

> 2026年7月の `azd 1.27.1` で検証済みです。

## 学習目標

本章を修了すると、以下が理解できます:
- Bicep テンプレートの構造と構文
- `azd provision` による Azure リソースのプロビジョニング
- `azd deploy` によるアプリケーションのデプロイ
- ブルーグリーンおよびローリングデプロイ戦略の実装

---

## 📚 レッスン

| # | レッスン | 説明 | 時間 |
|---|--------|-------------|------|
| 1 | [Provisioning Resources](provisioning.md) | AZDによるAzureリソース管理 | 45分 |
| 2 | [Deployment Guide](deployment-guide.md) | アプリケーションのデプロイ戦略 | 45分 |
| 3 | [Authoring Your Own Template](custom-templates.md) | 再利用可能な azd テンプレートの作成と公開 | 30分 |

---

## 🚀 クイックスタート

```bash
# テンプレートから初期化
azd init --template azure-functions-python-v2-http

# 作成されるものをプレビュー
azd provision --preview

# インフラのみをプロビジョニング
azd provision

# コードのみをデプロイ
azd deploy

# または両方一緒に
azd up
```

---

## 📁 AZD プロジェクト構造

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

## 🔧 基本コマンド

| コマンド | 説明 |
|---------|-------------|
| `azd init` | プロジェクトの初期化 |
| `azd provision` | Azure リソースの作成 |
| `azd deploy` | アプリケーションコードのデプロイ |
| `azd up` | プロビジョニング + デプロイ |
| `azd down` | すべてのリソースを削除 |

---

## 🔗 ナビゲーション

| 方向 | チャプター |
|-----------|---------|
| <strong>前へ</strong> | [第3章: コンフィギュレーション](../chapter-03-configuration/README.md) |
| <strong>次へ</strong> | [第5章: マルチエージェントソリューション](../chapter-05-multi-agent/README.md) |

---

## 📖 関連リソース

- [事前デプロイチェック](../chapter-06-pre-deployment/README.md)
- [コンテナーアプリの例](../../examples/container-app/README.md)
- [データベースアプリの例](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->