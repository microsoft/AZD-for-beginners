# 第2章: AIファースト開発

**📚 コース**: [AZD入門](../../README.md) | **⏱️ 所要時間**: 1-2時間 | **⭐ 難易度**: 中級

---

## 概要

本章では、Azure Developer CLI と Microsoft Foundry サービスを使用して AI 搭載アプリケーションをデプロイすることに焦点を当てます。単純な AI チャットアプリからツールを備えたインテリジェントエージェントまで。

> **検証メモ (2026-06-15):** 本章のコマンドフローと拡張機能のガイダンスは、`azd` `1.25.6` およびプレビューの AI エージェント拡張リリース `azure.ai.agents` `0.1.40-preview` と照合して確認されました。古い AZD ビルドを使用している場合は、先にアップデートしてから演習を続行してください。

## 学習目標

本章を完了すると、以下ができるようになります：
- 事前構築された AZD テンプレートを使用して AI アプリケーションをデプロイする
- AZD と Microsoft Foundry の統合を理解する
- ツール付きの AI エージェントを構成およびカスタマイズする
- RAG（Retrieval-Augmented Generation）アプリケーションをデプロイする

---

## 📚 レッスン

| # | レッスン | 説明 | 時間 |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry 統合](microsoft-foundry-integration.md) | AZD を Foundry サービスと接続する | 30分 |
| 2 | [AIエージェントガイド](agents.md) | ツールを備えたインテリジェントエージェントをデプロイする | 45分 |
| 3 | [AIモデルのデプロイ](ai-model-deployment.md) | AI モデルをデプロイおよび構成する | 30分 |
| 4 | [AIワークショップラボ](ai-workshop-lab.md) | ハンズオン：AI ソリューションを AZD 対応にする | 60分 |

---

## 🚀 クイックスタート

```bash
# オプション1: RAGチャットアプリケーション
azd init --template azure-search-openai-demo
azd up

# オプション2: AIエージェント
azd init --template get-started-with-ai-agents
azd up

# オプション3: クイックチャットアプリ
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 注目のAIテンプレート

| テンプレート | 説明 | サービス |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | 引用付きの RAG チャット | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ツールを備えた AI エージェント | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 基本的な AI チャット | OpenAI + Container Apps |

---

## 💰 コストに関する注意

| 環境 | 推定月額費用 |
|-------------|----------------------|
| 開発 | $80-150 |
| ステージング | $150-300 |
| 本番 | $300-3,500+ |

**ヒント:** テスト後は請求を避けるため `azd down` を実行してください。

---

## 🔗 ナビゲーション

| 方向 | 章 |
|-----------|---------|
| <strong>前へ</strong> | [第1章：基礎](../chapter-01-foundation/README.md) |
| <strong>次へ</strong> | [第3章：構成](../chapter-03-configuration/README.md) |
| <strong>スキップ先</strong> | [第8章：本番パターン](../chapter-08-production/README.md) |

---

## 📖 関連リソース

- [AIトラブルシューティング](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [本番 AI の実践](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->