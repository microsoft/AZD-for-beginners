# 第2章：AIファースト開発

**📚 コース**: [AZD For Beginners](../../README.md) | **⏱️ 所要時間**: 1-2時間 | **⭐ 難易度**: 中級

---

## 概要

本章では、Azure Developer CLI と Microsoft Foundry サービスを使ったAI搭載アプリケーションのデプロイに焦点を当てます。シンプルなAIチャットアプリからツールを備えたインテリジェントエージェントまで。

> **検証メモ (2026-07-13):** 本章のコマンドフローと拡張機能の指示は `azd` `1.27.1` と、現在のプレビュー版AIエージェント拡張 `azure.ai.agents` `1.0.0-beta.5` に基づいてレビューされています。旧バージョンのAZDを使用している場合は、最初にアップデートしてから演習を進めてください。

## 学習目標

本章を修了すると、以下ができるようになります：
- 事前構築されたAZDテンプレートを使ってAIアプリケーションをデプロイする
- Microsoft FoundryとAZDの統合を理解する
- ツールを備えたAIエージェントの設定とカスタマイズを行う
- RAG（検索拡張生成）アプリケーションをデプロイする

---

## 📚 レッスン

| # | レッスン | 説明 | 所要時間 |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | FoundryサービスとAZDの接続 | 30分 |
| 2 | [AI Agents Guide](agents.md) | ツール付きインテリジェントエージェントのデプロイ | 45分 |
| 3 | [AI Model Deployment](ai-model-deployment.md) | AIモデルのデプロイと設定 | 30分 |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | ハンズオン：AIソリューションをAZD対応にする | 60分 |

---

## 🚀 クイックスタート

```bash
# オプション1：RAGチャットアプリケーション
azd init --template azure-search-openai-demo
azd up

# オプション2：AIエージェント
azd init --template get-started-with-ai-agents
azd up

# オプション3：クイックチャットアプリ
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 注目のAIテンプレート

| テンプレート | 説明 | サービス |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | 引用付きRAGチャット | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ツールを備えたAIエージェント | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 基本的なAIチャット | OpenAI + Container Apps |

---

## 💰 コスト意識

| 環境 | 推定月額コスト |
|-------------|----------------------|
| 開発 | $80-150 |
| ステージング | $150-300 |
| 本番 | $300-3,500+ |

**ヒント:** テスト後はコストを避けるために `azd down` を実行してください。

---

## 🔗 ナビゲーション

| 方向 | 章 |
|-----------|---------|
| <strong>前章</strong> | [Chapter 1: Foundation](../chapter-01-foundation/README.md) |
| <strong>次章</strong> | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| <strong>スキップ</strong> | [Chapter 8: Production Patterns](../chapter-08-production/README.md) |

---

## 📖 関連リソース

- [AIトラブルシューティング](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [本番AIプラクティス](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->