# Chapter 6: Pre-Deployment Planning & Validation

**📚 Course**: [AZD 初心者向け](../../README.md) | **⏱️ Duration**: 1 hour | **⭐ Complexity**: Intermediate

---

## Overview

この章では、アプリケーションをデプロイする前の重要な計画と検証の手順を扱います。適切なキャパシティ計画、SKU選定、事前チェックにより高価な間違いを避ける方法を学びます。

> 2026年3月に `azd 1.23.12` で検証済み。

## Learning Objectives

この章を完了すると、以下ができるようになります:
- デプロイ前にプレフライトチェックを実行する
- キャパシティを計画し、リソース要件を見積もる
- コスト最適化のために適切なSKUを選択する
- 監視のためにApplication Insightsを構成する
- チームの調整パターンを理解する

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | デプロイ前に構成を検証する | 15 min |
| 2 | [Capacity Planning](capacity-planning.md) | リソース要件を見積もる | 20 min |
| 3 | [SKU Selection](sku-selection.md) | 適切な価格帯を選定する | 15 min |
| 4 | [Application Insights](application-insights.md) | 監視を構成する | 20 min |
| 5 | [Coordination Patterns](coordination-patterns.md) | チームのデプロイワークフロー | 15 min |

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

## ☑️ Pre-Deployment Checklist

### Before `azd provision`

- [ ] リージョンのクォータを確認済み
- [ ] SKUが適切に選択されている
- [ ] コスト見積りを確認済み
- [ ] 命名規則が一貫している
- [ ] セキュリティ/RBACが構成されている

### Before `azd deploy`

- [ ] 環境変数が設定されている
- [ ] Key Vault にシークレットがある
- [ ] 接続文字列が検証されている
- [ ] ヘルスチェックが構成されている

---

## 💰 SKU Selection Guide

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
- [デプロイガイド](../chapter-04-infrastructure/deployment-guide.md)
- [よくある問題](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:
本書類はAI翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されました。正確性の確保に努めていますが、自動翻訳には誤りや不正確な表現が含まれる可能性があることをご留意ください。原文（原言語の文書）を正規の情報源とみなしてください。重要な情報については、専門の人間による翻訳をお勧めします。本翻訳の利用により生じたいかなる誤解や誤訳についても、当社は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->