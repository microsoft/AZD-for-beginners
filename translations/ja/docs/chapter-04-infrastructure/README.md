# 第4章: Infrastructure as Code（IaC）とデプロイ

**📚 コース**: [AZD For Beginners](../../README.md) | **⏱️ 所要時間**: 1-1.5時間 | **⭐ 難易度**: 中級

---

## 概要

この章では、Bicep テンプレートを用いた Infrastructure as Code (IaC) のパターン、リソースのプロビジョニング、および Azure Developer CLI を使用したデプロイ戦略について扱います。

## 学習目標

この章を修了すると、以下を習得できます:
- Bicep テンプレートの構造と構文を理解する
- Azure リソースを `azd provision` を使ってプロビジョニングする
- アプリケーションを `azd deploy` でデプロイする
- ブルーグリーンおよびローリングデプロイの戦略を実装する

---

## 📚 レッスン

| # | レッスン | 説明 | 所要時間 |
|---|--------|-------------|------|
| 1 | [Provisioning Resources](provisioning.md) | AZD を使った Azure リソース管理 | 45分 |
| 2 | [Deployment Guide](deployment-guide.md) | アプリケーションのデプロイ戦略 | 45分 |

---

## 🚀 クイックスタート

```bash
# テンプレートから初期化する
azd init --template azure-functions-python-v2-http

# 作成される内容をプレビューする
azd provision --preview

# インフラのみをプロビジョニングする
azd provision

# コードのみをデプロイする
azd deploy

# または両方を同時に実行する
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

## 🔧 必須コマンド

| コマンド | 説明 |
|---------|-------------|
| `azd init` | プロジェクトを初期化する |
| `azd provision` | Azure リソースを作成する |
| `azd deploy` | アプリケーションコードをデプロイする |
| `azd up` | プロビジョニング + デプロイ |
| `azd down` | すべてのリソースを削除する |

---

## 🔗 ナビゲーション

| 方向 | 章 |
|-----------|---------|
| **前へ** | [第3章: 設定](../chapter-03-configuration/README.md) |
| **次へ** | [第5章: マルチエージェント ソリューション](../chapter-05-multi-agent/README.md) |

---

## 📖 関連リソース

- [デプロイ前のチェック](../chapter-06-pre-deployment/README.md)
- [コンテナ アプリの例](../../examples/container-app/README.md)
- [データベース アプリの例](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責事項:
本書はAI翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を用いて翻訳されました。正確性には努めておりますが、自動翻訳には誤りや不正確な箇所が含まれる場合があります。重要な情報については、原文（原語版）を正式な出典としてご参照いただき、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈の相違についても、当方は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->