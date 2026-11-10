# 第6章: 展開前の計画と検証

**📚 コース**: [AZD For Beginners](../../README.md) | **⏱️ 所要時間**: 2〜4時間の読書時間；適応されたラボに追加時間 | **⭐ 難易度**: 中級〜上級

---

## 概要

この章では、アプリケーションを展開する前に必要な計画と検証の手順を扱います。適切な容量計画、SKUの選択、事前チェックによって高額なミスを回避する方法を学びます。

> 発行済みの `azd 1.37.2` リファレンスに基づくコマンドガイダンスを確認しています。クラウド展開は実行していません。長めのレッスンには、完全なローカル展開プロジェクトではなく、説明的な断片が含まれています。

## 学習目標

この章を終えることで、あなたは以下を習得します:
- 展開前に事前チェックを実施する
- 容量計画とリソース要件の見積もりを行う
- コスト最適化のために適切なSKUを選択する
- 監視用にApplication Insightsを設定する
- マルチエージェントの調整パターンとその展開要件を理解する

---

## 📚 レッスン

| # | レッスン | 説明 | 時間 |
|---|--------|-------------|------|
| 1 | [事前チェック](preflight-checks.md) | 展開前の設定確認 | 15分 |
| 2 | [容量計画](capacity-planning.md) | リソース要件の見積もり | 20分 |
| 3 | [SKUの選択](sku-selection.md) | 適切な価格帯の選択 | 15分 |
| 4 | [Application Insights](application-insights.md) | 監視の設定 | 20分 |
| 5 | [調整パターン](coordination-patterns.md) | 高度なマルチエージェントオーケストレーション設計 | 60〜75分 |

---

## 🚀 クイックスタート

```bash
# Check subscription quotas
az vm list-usage --location eastus --output table

# Preview infrastructure changes (inspect template hooks before running)
azd provision --preview

# Validate Bicep syntax
az bicep build --file infra/main.bicep

# Check environment configuration
azd env get-values
```

---

## ☑️ 展開前チェックリスト

### `azd provision` の前に

- [ ] リージョンのクォータ確認済み
- [ ] 適切なSKUを選択済み
- [ ] コスト見積もりを確認済み
- [ ] 命名規則が一貫している
- [ ] セキュリティ/RBACを設定済み

### `azd deploy` の前に

- [ ] 環境変数を設定済み
- [ ] Key Vaultにシークレットを格納済み
- [ ] 接続文字列を確認済み
- [ ] ヘルスチェックを設定済み

---

## 💰 SKU選択ガイド

| ワークロード | 開発環境 | 本番環境 |
|----------|-------------|------------|
| Container Apps | コンシューム | 測定された負荷に基づくコンシュームまたは専用ワークロードプロファイル |
| App Service | B1/B2 | P1v3以上 |
| Azure OpenAIモデル | 対応の従量課金型展開タイプ | 従量課金型またはプロビジョンドスループット；モデルおよびリージョン依存 |
| AI Search | 上限内の無料/基本プラン | インデックス、レプリカ、クエリ負荷に応じた基本または標準プラン |

---

## 🔗 ナビゲーション

| 方向 | 章 |
|-----------|---------|
| <strong>前へ</strong> | [第5章: マルチエージェント](../chapter-05-multi-agent/README.md) |
| <strong>次へ</strong> | [第7章: トラブルシューティング](../chapter-07-troubleshooting/README.md) |

---

## 📖 関連リソース

- [設定ガイド](../chapter-03-configuration/configuration.md)
- [展開ガイド](../chapter-04-infrastructure/deployment-guide.md)
- [よくある問題](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->