# Chapter 6: デプロイ前の計画と検証

**📚 Course**: [AZD 入門](../../README.md) | **⏱️ Duration**: 1時間 | **⭐ Complexity**: 中級

---

## Overview

この章では、アプリケーションをデプロイする前の重要な計画と検証手順を解説します。適切な容量計画、SKUの選択、プレフライトチェックにより高額なミスを回避する方法を学びます。

## Learning Objectives

この章を完了すると、以下ができるようになります:
- デプロイ前にプレフライトチェックを実行する
- 容量を計画し、リソース要件を見積もる
- コスト最適化のために適切なSKUを選択する
- 監視のためにApplication Insightsを構成する
- チームの連携パターンを理解する

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [事前チェック](preflight-checks.md) | デプロイ前に構成を検証する | 15分 |
| 2 | [容量計画](capacity-planning.md) | リソース要件を見積もる | 20分 |
| 3 | [SKU 選択](sku-selection.md) | 適切な価格帯を選択する | 15分 |
| 4 | [Application Insights](application-insights.md) | 監視を構成する | 20分 |
| 5 | [調整パターン](coordination-patterns.md) | チームのデプロイワークフロー | 15分 |

---

## 🚀 Quick Start

```bash
# サブスクリプションのクォータを確認する
az vm list-usage --location eastus --output table

# デプロイのプレビュー（リソースは作成されません）
azd provision --preview

# Bicep の構文を検証する
az bicep build --file infra/main.bicep

# 環境の構成を確認する
azd env get-values
```

---

## ☑️ デプロイ前チェックリスト

### `azd provision` の前に

- [ ] リージョンのクォータを確認済み
- [ ] SKUが適切に選択されている
- [ ] コスト見積もりを確認済み
- [ ] ネーミング規則が一貫している
- [ ] セキュリティ/RBACが構成されている

### `azd deploy` の前に

- [ ] 環境変数が設定されている
- [ ] シークレットが Key Vault に保存されている
- [ ] 接続文字列が確認されている
- [ ] ヘルスチェックが構成されている

---

## 💰 SKU 選択ガイド

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigation

| Direction | Chapter |
|-----------|---------|
| **Previous** | [第5章: マルチエージェント](../chapter-05-multi-agent/README.md) |
| **Next** | [第7章: トラブルシューティング](../chapter-07-troubleshooting/README.md) |

---

## 📖 Related Resources

- [構成ガイド](../chapter-03-configuration/configuration.md)
- [デプロイ ガイド](../chapter-04-infrastructure/deployment-guide.md)
- [よくある問題](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:
本文書はAI翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されました。正確性に努めていますが、自動翻訳には誤りや不正確さが含まれる場合があることをご了承ください。原文（原言語のドキュメント）を正式な出典とみなしてください。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の使用により生じた誤解や誤訳について、当方は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->