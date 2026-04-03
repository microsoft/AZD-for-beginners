# 第2章: AIファースト開発

**📚 Course**: [AZD入門](../../README.md) | **⏱️ Duration**: 1〜2時間 | **⭐ Complexity**: 中級

---

## 概要

本章では Azure Developer CLI と Microsoft Foundry サービスを使用して AI 搭載アプリケーションをデプロイすることに焦点を当てます。単純な AI チャットアプリからツールを備えたインテリジェントエージェントまで扱います。

> **検証メモ (2026-03-25):** 本章のコマンドフローと拡張機能の案内は `azd` `1.23.12` とプレビュー AI エージェント拡張の現行リリース `azure.ai.agents` `0.1.18-preview` に対して確認されました。古い AZD ビルドを使用している場合は、最初に更新してから演習を続けてください。

## 学習目標

By completing this chapter, you will:
- 事前構築された AZD テンプレートを使用して AI アプリケーションをデプロイする
- AZD と Microsoft Foundry の統合を理解する
- ツールを使って AI エージェントを構成およびカスタマイズする
- RAG（Retrieval-Augmented Generation）アプリケーションをデプロイする

---

## 📚 レッスン

| # | レッスン | 説明 | 時間 |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry 統合](microsoft-foundry-integration.md) | AZD を Foundry サービスに接続する | 30分 |
| 2 | [AI エージェント ガイド](agents.md) | ツール付きのインテリジェントエージェントをデプロイする | 45分 |
| 3 | [AI モデルのデプロイ](ai-model-deployment.md) | AI モデルをデプロイおよび構成する | 30分 |
| 4 | [AI ワークショップ ラボ](ai-workshop-lab.md) | ハンズオン: AI ソリューションを AZD 対応にする | 60分 |

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

## 🤖 注目の AI テンプレート

| テンプレート | 説明 | サービス |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | 引用付きの RAG チャット | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ツールを備えた AI エージェント | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 基本的な AI チャット | OpenAI + Container Apps |

---

## 💰 コストに関する注意

| 環境 | 推定月額コスト |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**ヒント:** テスト後に料金を回避するために `azd down` を実行してください。

---

## 🔗 ナビゲーション

| 方向 | チャプター |
|-----------|---------|
| <strong>前へ</strong> | [第1章: 基礎](../chapter-01-foundation/README.md) |
| <strong>次へ</strong> | [第3章: 構成](../chapter-03-configuration/README.md) |
| <strong>スキップ先</strong> | [第8章: 本番パターン](../chapter-08-production/README.md) |

---

## 📖 関連リソース

- [AI トラブルシューティング](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [本番向け AI プラクティス](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:
本書はAI翻訳サービス [Co-op トランスレーター](https://github.com/Azure/co-op-translator) を使用して翻訳されました。正確性には努めておりますが、自動翻訳には誤りや不正確な表現が含まれる可能性があることをご留意ください。原文（原言語の文書）を正式な情報源としてご確認ください。重要な情報については、専門の翻訳者による翻訳を推奨します。本翻訳の使用により生じた誤解や誤った解釈については責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->