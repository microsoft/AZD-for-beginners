# 第2章: AIファースト開発

**📚 コース**: [AZD For Beginners](../../README.md) | **⏱️ 所要時間**: 1〜2時間 | **⭐ 難易度**: 中級

---

## 概要

この章では、Azure Developer CLI と Microsoft Foundry サービスを使用した AI 搭載アプリケーションのデプロイに焦点を当てます。シンプルな AI チャットアプリからツールを備えたインテリジェントエージェントまで。

## 学習目標

この章を修了すると、次のことができるようになります:
- 事前構築された AZD テンプレートを使用して AI アプリケーションをデプロイする
- AZD と Microsoft Foundry の統合を理解する
- ツールを備えた AI エージェントを設定およびカスタマイズする
- RAG (Retrieval-Augmented Generation) アプリケーションをデプロイする

---

## 📚 レッスン

| # | レッスン | 説明 | 時間 |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry の統合](microsoft-foundry-integration.md) | AZD を Foundry サービスに接続する | 30 分 |
| 2 | [AI エージェントガイド](agents.md) | ツールを使用したインテリジェントエージェントをデプロイする | 45 分 |
| 3 | [AI モデルのデプロイ](ai-model-deployment.md) | AI モデルをデプロイおよび構成する | 30 分 |
| 4 | [AI ワークショップラボ](ai-workshop-lab.md) | ハンズオン: AI ソリューションを AZD 対応にする | 60 分 |

---

## 🚀 クイックスタート

```bash
# オプション 1: RAGチャットアプリケーション
azd init --template azure-search-openai-demo
azd up

# オプション 2: AIエージェント
azd init --template get-started-with-ai-agents
azd up

# オプション 3: クイックチャットアプリケーション
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 注目の AI テンプレート

| Template | Description | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | 引用付きの RAG チャット | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ツールを備えた AI エージェント | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 基本的な AI チャット | OpenAI + Container Apps |

---

## 💰 コストの目安

| Environment | Estimated Monthly Cost |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**ヒント:** テスト後は課金を避けるために `azd down` を実行してください。

---

## 🔗 ナビゲーション

| Direction | Chapter |
|-----------|---------|
| **前へ** | [第1章: 基礎](../chapter-01-foundation/README.md) |
| **次へ** | [第3章: 構成](../chapter-03-configuration/README.md) |
| **スキップ先** | [第8章: 本番パターン](../chapter-08-production/README.md) |

---

## 📖 関連資料

- [AI トラブルシューティング](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [本番向け AI の実践](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責事項：
本書は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) によって翻訳されました。正確性の確保に努めていますが、自動翻訳には誤りや不正確な表現が含まれる場合があることをご理解ください。原文（原言語の文書）を正式な出典としてご参照ください。重要な情報については、専門の翻訳者による人間翻訳を推奨します。本翻訳の利用に起因する誤解や解釈の相違については、一切の責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->