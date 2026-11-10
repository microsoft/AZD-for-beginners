# 第4章: インフラストラクチャー・アズ・コードとデプロイメント

**📚 コース**: [AZD For Beginners](../../README.md) | **⏱️ 所要時間**: 読了2～3時間；デプロイ練習に追加時間を確保してください | **⭐ 難易度**: 中級

---

## 概要

本章では、Bicepテンプレートを用いたインフラストラクチャー・アズ・コード（IaC）パターン、リソースプロビジョニング、およびAzure Developer CLIを使ったデプロイ戦略について解説します。

> コマンドと設定のレビュー対象: `azd 1.37.2` (2026年11月)。レビュー時にはライブのAzureプロビジョニングは実行されていません。

## 学習目標

本章を修了すると、以下が習得できます：
- Bicepテンプレートの構造と構文を理解する
- `azd provision` を用いたAzureリソースのプロビジョニング
- `azd deploy` を用いたアプリケーションのデプロイ
- ブルーグリーンとローリングデプロイメント戦略の実装

---

## 📚 レッスン

| # | レッスン | 説明 | 時間 |
|---|--------|-------|------|
| 1 | [リソースのプロビジョニング](provisioning.md) | AZDを使ったAzureリソース管理 | 45分 |
| 2 | [デプロイメントガイド](deployment-guide.md) | アプリケーションデプロイ戦略 | 45分 |
| 3 | [独自テンプレートの作成](custom-templates.md) | 再利用可能なazdテンプレートの作成と公開 | 30分 |

---

## 🚀 クイックスタート

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
azd up
```

---

## 📁 AZDプロジェクト構造

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

## 🔧 重要コマンド

| コマンド | 説明 |
|---------|-------|
| `azd init` | プロジェクトの初期化 |
| `azd provision` | Azureリソースの作成 |
| `azd deploy` | アプリケーションコードのデプロイ |
| `azd up` | プロビジョニング + デプロイ |
| `azd down` | すべてのリソース削除 |

---

## 🔗 ナビゲーション

| 方向 | 章 |
|---------|---------|
| <strong>前へ</strong> | [第3章: 設定](../chapter-03-configuration/README.md) |
| <strong>次へ</strong> | [第5章: マルチエージェントソリューション](../chapter-05-multi-agent/README.md) |

---

## 📖 関連資料

- [事前デプロイメントチェック](../chapter-06-pre-deployment/README.md)
- [コンテナアプリの例](../../examples/container-app/README.md)
- [データベースアプリの例](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->