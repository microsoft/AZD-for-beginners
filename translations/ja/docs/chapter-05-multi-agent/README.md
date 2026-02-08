# 第5章：マルチエージェントAIソリューション

**📚 コース**: [AZD 初心者向け](../../README.md) | **⏱️ 所要時間**: 2-3時間 | **⭐ 難易度**: 上級

---

## 概要

この章では、複雑なシナリオ向けの高度なマルチエージェントアーキテクチャパターン、エージェントオーケストレーション、および本番対応のAIデプロイメントについて扱います。

## 学習目標

この章を完了することで、あなたは以下を習得します:
- マルチエージェントのアーキテクチャパターンを理解する
- 協調したAIエージェントシステムをデプロイする
- エージェント間通信を実装する
- 本番対応のマルチエージェントソリューションを構築する

---

## 📚 Lessons

| # | レッスン | 説明 | 時間 |
|---|--------|-------------|------|
| 1 | [小売マルチエージェントソリューション](../../examples/retail-scenario.md) | 実装の完全なウォークスルー | 90分 |
| 2 | [協調パターン](../chapter-06-pre-deployment/coordination-patterns.md) | エージェントオーケストレーション戦略 | 30分 |
| 3 | [ARM テンプレートのデプロイ](../../examples/retail-multiagent-arm-template/README.md) | ワンクリックデプロイ | 30分 |

---

## 🚀 クイックスタート

```bash
# 小売向けマルチエージェントソリューションをデプロイする
cd examples/retail-multiagent-arm-template
./deploy.sh

# またはテンプレートを直接使用する
azd init --template agent-openai-python-prompty
azd up
```

---

## 🤖 マルチエージェントアーキテクチャ

```
┌──────────────────────────────────────────────────────────────┐
│                    Orchestrator Agent                         │
│              (Routes requests, manages workflow)              │
└────────────────────┬─────────────────┬───────────────────────┘
                     │                 │
         ┌───────────▼───────┐ ┌───────▼───────────┐
         │  Customer Agent   │ │  Inventory Agent  │
         │  (User queries,   │ │  (Stock levels,   │
         │   preferences)    │ │   orders)         │
         └───────────────────┘ └───────────────────┘
```

---

## 🎯 注目のソリューション：小売マルチエージェント

The [Retail Multi-Agent Solution](../../examples/retail-scenario.md) demonstrates:

- **Customer Agent**: ユーザーとの対話と嗜好を扱う
- **Inventory Agent**: 在庫と注文処理を管理する
- **Orchestrator**: エージェント間の調整を行う
- **Shared Memory**: エージェント間のコンテキスト共有管理

### 使用サービス

| Service | Purpose |
|---------|---------|
| Azure OpenAI | 言語理解 |
| Azure AI Search | 製品カタログ |
| Cosmos DB | エージェントの状態とメモリ |
| Container Apps | エージェントのホスティング |
| Application Insights | 監視 |

---

## 🔗 ナビゲーション

| Direction | Chapter |
|-----------|---------|
| **Previous** | [第4章：インフラストラクチャ](../chapter-04-infrastructure/README.md) |
| **Next** | [第6章：プレデプロイメント](../chapter-06-pre-deployment/README.md) |

---

## 📖 関連リソース

- [AI エージェントガイド](../chapter-02-ai-development/agents.md)
- [本番向けAIプラクティス](../chapter-08-production/production-ai-practices.md)
- [AIトラブルシューティング](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責事項：
この文書は AI 翻訳サービス「Co‑op Translator」（https://github.com/Azure/co-op-translator）を使用して翻訳されました。正確性には努めていますが、自動翻訳には誤りや不正確さが含まれる可能性があることをご留意ください。原文（原言語の文書）を正式かつ権威ある出典としてご参照ください。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の使用に起因するいかなる誤解や解釈の相違についても、私たちは責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->