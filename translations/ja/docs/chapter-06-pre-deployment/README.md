# 第6章: デプロイ前の計画と検証

**📚 コース**: [AZD 入門](../../README.md) | **⏱️ 所要時間**: 1時間 | **⭐ 難易度**: 中級

---

## 概要

この章では、アプリケーションをデプロイする前の重要な計画および検証手順を扱います。適切なキャパシティ計画、SKUの選定、プレフライトチェックにより、費用のかかるミスを回避する方法を学びます。

> 2026年6月に `azd 1.25.6` で検証済み。

## 学習目標

この章を修了すると、以下ができるようになります:
- デプロイ前にプレフライトチェックを実行する
- キャパシティを計画し、リソース要件を見積もる
- コスト最適化のために適切なSKUを選択する
- 監視のために Application Insights を構成する
- チームの連携パターンを理解する

---

## 📚 レッスン

| # | レッスン | 説明 | 所要時間 |
|---|--------|-------------|------|
| 1 | [プレフライトチェック](preflight-checks.md) | デプロイ前に構成を検証する | 15分 |
| 2 | [キャパシティ計画](capacity-planning.md) | リソース要件を見積もる | 20分 |
| 3 | [SKU 選定](sku-selection.md) | 適切な価格帯を選択する | 15分 |
| 4 | [Application Insights](application-insights.md) | 監視を構成する | 20分 |
| 5 | [連携パターン](coordination-patterns.md) | チームのデプロイワークフロー | 15分 |

---

## 🚀 クイックスタート

```bash
# サブスクリプションのクォータを確認する
az vm list-usage --location eastus --output table

# デプロイのプレビュー（リソースは作成されません）
azd provision --preview

# Bicepの構文を検証する
az bicep build --file infra/main.bicep

# 環境の構成を確認する
azd env get-values
```

---

## ☑️ デプロイ前チェックリスト

### `azd provision` の前に

- [ ] リージョンのクォータを確認済み
- [ ] 適切なSKUを選択済み
- [ ] コスト見積もりを確認済み
- [ ] 命名規則が一貫している
- [ ] セキュリティ/RBACが構成されている

### `azd deploy` の前に

- [ ] 環境変数が設定されている
- [ ] Key Vault にシークレットが格納されている
- [ ] 接続文字列が確認されている
- [ ] ヘルスチェックが構成されている

---

## 💰 SKU 選定ガイド

| ワークロード | 開発 | 本番 |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 ナビゲーション

| 方向 | 章 |
|-----------|---------|
| <strong>前へ</strong> | [第5章: マルチエージェント](../chapter-05-multi-agent/README.md) |
| <strong>次へ</strong> | [第7章: トラブルシューティング](../chapter-07-troubleshooting/README.md) |

---

## 📖 関連資料

- [構成ガイド](../chapter-03-configuration/configuration.md)
- [デプロイガイド](../chapter-04-infrastructure/deployment-guide.md)
- [よくある問題](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->