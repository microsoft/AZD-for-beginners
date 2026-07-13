# 第6章: デプロイ前の計画と検証

**📚 コース**: [AZD For Beginners](../../README.md) | **⏱️ 所要時間**: 1時間 | **⭐ 難易度**: 中級

---

## 概要

この章では、アプリケーションをデプロイする前の重要な計画と検証のステップを説明します。適切な容量計画、SKU選択、事前チェックを行うことで、高コストなミスを避ける方法を学びます。

> `azd 1.27.1` にて2026年7月に検証済み。

## 学習目標

この章を完了すると、以下ができるようになります:
- デプロイ前に事前チェックを実行する
- 容量計画とリソース要件の見積もりを行う
- コスト最適化のために適切なSKUを選択する
- 監視のためにApplication Insightsを構成する
- チームの調整パターンを理解する

---

## 📚 レッスン

| # | レッスン | 説明 | 時間 |
|---|--------|-------------|------|
| 1 | [事前チェック](preflight-checks.md) | デプロイ前に構成を検証する | 15分 |
| 2 | [容量計画](capacity-planning.md) | リソース要件を見積もる | 20分 |
| 3 | [SKU選択](sku-selection.md) | 適切な料金階層を選択する | 15分 |
| 4 | [Application Insights](application-insights.md) | 監視構成 | 20分 |
| 5 | [調整パターン](coordination-patterns.md) | チームのデプロイワークフロー | 15分 |

---

## 🚀 クイックスタート

```bash
# サブスクリプションのクォータを確認
az vm list-usage --location eastus --output table

# デプロイのプレビュー（リソースは作成されません）
azd provision --preview

# Bicep の構文を検証
az bicep build --file infra/main.bicep

# 環境設定を確認
azd env get-values
```

---

## ☑️ デプロイ前チェックリスト

### `azd provision` 実行前

- [ ] リージョンのクォータを確認
- [ ] 適切なSKUを選択済み
- [ ] コスト見積もりをレビュー済み
- [ ] 命名規則が一貫している
- [ ] セキュリティ/RBACを構成済み

### `azd deploy` 実行前

- [ ] 環境変数を設定済み
- [ ] Key Vaultにシークレットを保存済み
- [ ] 接続文字列を確認済み
- [ ] ヘルスチェックを構成済み

---

## 💰 SKU選択ガイド

| ワークロード | 開発 | 本番 |
|----------|-------------|------------|
| コンテナーアプリ | コンシューム | 専用 D4 |
| App Service | B1/B2 | P1v3以上 |
| Microsoft Foundry モデル | スタンダード | スタンダード + PTU |
| AI Search | ベーシック | スタンダード S2以上 |

---

## 🔗 ナビゲーション

| 方向 | 章 |
|-----------|---------|
| <strong>前へ</strong> | [第5章: マルチエージェント](../chapter-05-multi-agent/README.md) |
| <strong>次へ</strong> | [第7章: トラブルシューティング](../chapter-07-troubleshooting/README.md) |

---

## 📖 関連リソース

- [構成ガイド](../chapter-03-configuration/configuration.md)
- [デプロイガイド](../chapter-04-infrastructure/deployment-guide.md)
- [一般的な問題](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->