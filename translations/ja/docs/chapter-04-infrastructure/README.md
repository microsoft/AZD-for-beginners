# Chapter 4: インフラストラクチャをコードとして & デプロイメント

**📚 コース**: [AZD For Beginners](../../README.md) | **⏱️ 所要時間**: 1-1.5 時間 | **⭐ 難易度**: 中級

---

## 概要

本章では、Bicep テンプレートを用いたインフラストラクチャをコードとして管理するパターン、リソースのプロビジョニング、Azure Developer CLI を使ったデプロイメント戦略を扱います。

> 2026年3月時点の `azd 1.23.12` にて検証済み。

## 学習目標

本章を修了すると、以下を理解できます：
- Bicep テンプレートの構造と構文
- `azd provision` による Azure リソースのプロビジョニング
- `azd deploy` によるアプリケーションのデプロイ
- ブルーグリーンおよびローリングデプロイ戦略の実装

---

## 📚 レッスン

| # | レッスン | 説明 | 時間 |
|---|--------|-------------|------|
| 1 | [リソースのプロビジョニング](provisioning.md) | AZD を用いた Azure リソース管理 | 45 分 |
| 2 | [デプロイガイド](deployment-guide.md) | アプリケーションのデプロイ戦略 | 45 分 |

---

## 🚀 クイックスタート

```bash
# テンプレートから初期化
azd init --template azure-functions-python-v2-http

# 作成されるものをプレビュー
azd provision --preview

# インフラストラクチャのみをプロビジョニング
azd provision

# コードのみをデプロイ
azd deploy

# または両方一緒に
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

## 🔧 主要コマンド

| コマンド | 説明 |
|---------|-------------|
| `azd init` | プロジェクトの初期化 |
| `azd provision` | Azure リソースを作成 |
| `azd deploy` | アプリケーションコードをデプロイ |
| `azd up` | プロビジョニング + デプロイ |
| `azd down` | 全リソースの削除 |

---

## 🔗 ナビゲーション

| 方向 | チャプター |
|-----------|---------|
| <strong>前へ</strong> | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| <strong>次へ</strong> | [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

---

## 📖 関連リソース

- [事前デプロイチェック](../chapter-06-pre-deployment/README.md)
- [コンテナーアプリ例](../../examples/container-app/README.md)
- [データベースアプリ例](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:  
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確さを期しておりますが、自動翻訳には誤りや不正確な箇所が含まれる場合があります。原文はその言語で記載されたオリジナルの文書を正式な情報源としてご参照ください。重要な情報については、専門の人間翻訳を推奨します。本翻訳の使用に起因する誤解や誤訳について一切の責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->