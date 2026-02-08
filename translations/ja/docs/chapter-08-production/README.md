# 第8章: 本番およびエンタープライズパターン

**📚 コース**: [AZD For Beginners](../../README.md) | **⏱️ 所要時間**: 2～3時間 | **⭐ 難易度**: 上級

---

## 概要

この章では、エンタープライズ対応のデプロイパターン、セキュリティ強化、監視、および本番AIワークロードのコスト最適化について扱います。

## 学習目標

この章を修了すると、以下ができるようになります：
- マルチリージョンの耐障害性のあるアプリケーションをデプロイする
- エンタープライズ向けのセキュリティパターンを実装する
- 包括的な監視を構成する
- 大規模でのコスト最適化を行う
- AZDを使用したCI/CDパイプラインを設定する

---

## 📚 レッスン

| # | レッスン | 説明 | 時間 |
|---|--------|-------------|------|
| 1 | [本番AIの実践](production-ai-practices.md) | エンタープライズ向けデプロイパターン | 90分 |

---

## 🚀 本番用チェックリスト

- [ ] 耐障害性のためのマルチリージョン展開
- [ ] 認証のためのマネージドID（キー不要）
- [ ] 監視のためのApplication Insights
- [ ] コスト予算とアラートの設定
- [ ] セキュリティスキャンを有効化
- [ ] CI/CDパイプラインの統合
- [ ] ディザスタリカバリ計画

---

## 🏗️ アーキテクチャパターン

### パターン1: マイクロサービスAI

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   API Gateway   │───▶│   AI Service    │───▶│   Azure OpenAI  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                      │
         ▼                      ▼
┌─────────────────┐    ┌─────────────────┐
│   Auth Service  │    │   Data Store    │
└─────────────────┘    └─────────────────┘
```

### パターン2: イベント駆動AI

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Event Grid    │───▶│  Functions      │───▶│   AI Pipeline   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

---

## 🔐 セキュリティのベストプラクティス

```bicep
// Use managed identity
identity: {
  type: 'SystemAssigned'
}

// Private endpoints for AI services
properties: {
  publicNetworkAccess: 'Disabled'
  networkAcls: {
    defaultAction: 'Deny'
  }
}
```

---

## 💰 コスト最適化

| 戦略 | 節約 |
|----------|---------|
| Scale to zero (Container Apps) | 60-80% |
| Use consumption tiers for dev | 50-70% |
| Scheduled scaling | 30-50% |
| Reserved capacity | 20-40% |

```bash
# 予算アラートを設定する
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 監視のセットアップ

```bash
# ログをストリーミングする
azd monitor --logs

# Application Insights を確認する
azd monitor

# メトリックを表示する
az monitor metrics list --resource <resource-id>
```

---

## 🔗 ナビゲーション

| 方向 | 章 |
|-----------|---------|
| **前へ** | [第7章: トラブルシューティング](../chapter-07-troubleshooting/README.md) |
| **コース完了** | [コースホーム](../../README.md) |

---

## 📖 関連リソース

- [AIエージェントガイド](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [マルチエージェントソリューション](../chapter-05-multi-agent/README.md)
- [マイクロサービスの例](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責事項：
この文書は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を用いて翻訳されました。正確性の確保に努めていますが、自動翻訳には誤りや不正確な表現が含まれる可能性があることにご留意ください。原文（原言語の文書）が権威あるソースと見なされるべきです。重要な情報については専門の人間による翻訳を推奨します。本翻訳の利用に起因する誤解や解釈の相違については、当方は一切の責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->