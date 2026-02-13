# 第6章: デプロイ前の計画と検証

**📚 コース**: [AZD 入門](../../README.md) | **⏱️ 所要時間**: 1時間 | **⭐ 難易度**: 中級

---

## 概要

この章では、アプリケーションをデプロイする前に必要な計画と検証の手順を説明します。容量計画、SKUの選定、事前チェックを適切に行うことで、コストのかかるミスを回避する方法を学びます。

## 学習目標

By completing this chapter, you will:
- デプロイ前に事前チェックを実行する
- 容量計画を行い、リソース要件を見積もる
- コスト最適化のために適切なSKUを選択する
- 監視のためにApplication Insightsを構成する
- チームの調整パターンを理解する

---

## 📚 レッスン

| # | レッスン | 説明 | 時間 |
|---|--------|-------------|------|
| 1 | [事前チェック](preflight-checks.md) | デプロイ前に構成を検証する | 15分 |
| 2 | [容量計画](capacity-planning.md) | リソース要件を見積もる | 20分 |
| 3 | [SKU 選択](sku-selection.md) | 適切な価格帯を選択する | 15分 |
| 4 | [Application Insights](application-insights.md) | 監視を構成する | 20分 |
| 5 | [調整パターン](coordination-patterns.md) | チームのデプロイワークフロー | 15分 |

---

## 🚀 クイックスタート

```bash
# サブスクリプションのクォータを確認する
az vm list-usage --location eastus --output table

# デプロイのプレビュー（リソースは作成されません）
azd provision --preview

# Bicep構文を検証する
az bicep build --file infra/main.bicep

# 環境の構成を確認する
azd env get-values
```

---

## ☑️ デプロイ前チェックリスト

### `azd provision` の前に

- [ ] リージョンのクォータを確認済み
- [ ] SKUs が適切に選択されている
- [ ] コスト見積もりを確認済み
- [ ] 命名規則が一貫している
- [ ] セキュリティ/RBAC が設定されている

### `azd deploy` の前に

- [ ] 環境変数が設定されている
- [ ] Key Vault にシークレットが格納されている
- [ ] 接続文字列が確認済み
- [ ] ヘルスチェックが構成されている

---

## 💰 SKU 選択ガイド

| ワークロード | 開発 | 本番 |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 ナビゲーション

| 方向 | 章 |
|-----------|---------|
| **前へ** | [第5章: マルチエージェント](../chapter-05-multi-agent/README.md) |
| **次へ** | [第7章: トラブルシューティング](../chapter-07-troubleshooting/README.md) |

---

## 📖 関連リソース

- [構成ガイド](../chapter-03-configuration/configuration.md)
- [デプロイガイド](../chapter-04-infrastructure/deployment-guide.md)
- [よくある問題](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責事項：
本書は AI 翻訳サービス「Co-op Translator」(https://github.com/Azure/co-op-translator) を用いて翻訳されました。正確性には努めておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知ください。原文（原言語）の文書を正式な出典として扱ってください。重要な情報については、専門の人による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や誤訳についても、当社は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->