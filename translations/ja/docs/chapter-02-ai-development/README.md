# 第2章: AIファースト開発

**📚 コース**: [AZD For Beginners](../../README.md) | **⏱️ 所要時間**: ワークショップ含む4〜5時間 | **⭐ 難易度**: 中級

---

## 概要

本章では、Azure Developer CLIとMicrosoft Foundryサービスを利用したAI搭載アプリケーションの展開に焦点を当てます。シンプルなAIチャットアプリから、ツールを備えたインテリジェントエージェントまで。

> **リリースレビュー (2026-11-04):** AI CLIガイダンスは公開されている`azd` `1.37.2`、`azure.ai.agents` `1.0.0-beta.23`、および`azure.ai.evaluations` `1.0.0-beta.2`のドキュメント/ソースと照合されました。統合ワークフローには`azd >= 1.37.0`を使用してください。評価は現在別の`azd ai eval`ネームスペースを使用しています；詳細は[リリースの変更点と移行ガイダンス](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes)を参照してください。これはライブ展開の検証ではありません。

## 学習目標

本章を修了すると、以下ができるようになります：
- 事前構築されたAZDテンプレートを使ったAIアプリケーションの展開
- AZDとMicrosoft Foundry統合の理解
- ツールを備えたAIエージェントの設定とカスタマイズ
- RAG（Retrieval-Augmented Generation）アプリケーションの展開

---

## 📚 レッスン

| # | レッスン | 説明 | 時間 |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | AZDとFoundryサービスの接続 | 30分 |
| 2 | [AI Agents Guide](agents.md) | ツールを備えたインテリジェントエージェントの展開 | 45分 |
| 3 | [AI Model Deployment](ai-model-deployment.md) | AIモデルの展開と設定 | 30分 |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | 実践：テンプレートを探検し変換計画を立てる | 2〜3時間 |

---

## 🚀 クイックスタート

新しい空のディレクトリでいずれかのオプションを選択してください。末尾の`.`は現在のディレクトリを初期化します；それ以外の方法では、AZDがシェルの作業ディレクトリを変更せずにサブディレクトリを作成します。

```bash
# Option 1: RAG Chat Application
azd init --template azure-search-openai-demo .
azd up

# Option 2: AI Agents
azd init --template get-started-with-ai-agents .
azd up

# Option 3: Quick Chat App
azd init --template openai-chat-app-quickstart .
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

## 💰 コストに関する注意

これらは例示的な範囲であり、見積価格や上限ではありません。モデルトラフィック、Search/コンピュートSKU、地域、任意の機能によりこれらを超える場合があります。プロビジョニング前に、選択したサンプルの最新の価格ガイダンスを確認してください。

| 環境 | 推定月額コスト |
|-------------|----------------------|
| 開発 | $80-150 |
| ステージング | $150-300 |
| 本番 | $300-3,500+ |

**ヒント:** テスト後は料金を避けるために`azd down`を実行してください。

---

## 🔗 ナビゲーション

| 方向 | 章 |
|-----------|---------|
| <strong>前へ</strong> | [Chapter 1: Foundation](../chapter-01-foundation/README.md) |
| <strong>次へ</strong> | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| <strong>スキップ</strong> | [Chapter 8: Production Patterns](../chapter-08-production/README.md) |

---

## 📖 関連リソース

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->