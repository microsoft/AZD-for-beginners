# 7. まとめと次のステップ

!!! tip "重要なポイントは次のとおりです"

    - [ ] AZD templates accelerate AI application development from days to hours
    - [ ] The Discovery → Deployment → Customization methodology provides a structured learning path
    - [ ] GitHub Copilot with MCP servers enables natural language exploration of complex codebases
    - [ ] Microsoft Foundry provides built-in observability, evaluation, and security testing

---

## 1. 達成したこと

おめでとうございます！このワークショップでは、以下を成功裏に達成しました：

| モジュール | 達成内容 |
|:---|:---|
| **モジュール 1** | Azure Developer CLI を発見し、AIテンプレートを選択 |
| **モジュール 2** | 完全なAIエージェントソリューションを展開し、検証 |
| **モジュール 3** | テンプレートを分解してアーキテクチャを理解 |
| **モジュール 4** | `azure.yaml` の設定とライフサイクルフックを探求 |
| **モジュール 5** | 独自のシナリオに合わせてテンプレートをカスタマイズ |
| **モジュール 6** | インフラを安全に解体し、リソースを管理 |

---

## 2. 習得した主要なコンセプト

### Azure Developer CLI (azd)
- `azd init` - テンプレートからプロジェクトを初期化
- `azd up` - 1コマンドでプロビジョニングとデプロイ
- `azd env` - 環境変数の管理
- `azd down` - リソースの安全なクリーンアップ

### AZD テンプレート構造
- `azure.yaml` - 設定とデプロイフック
- `infra/` - Bicep インフラストラクチャコード
- `src/` - アプリケーションソースコード
- `scripts/` - 自動化およびセットアップスクリプト

### Microsoft Foundry の機能
- インテリジェントアシスタント向け AI エージェントサービス
- 知識検索のためのファイル検索と Azure AI 検索
- 組み込みのトレース、監視、評価
- AIセーフティ検証のためのレッドチーミング

---

## 3. 学習の旅を続けましょう

### おすすめの次のステップ

| パス | リソース | 所要時間 |
|:---|:---|:---|
| <strong>コース完了</strong> | [AZD for Beginners Curriculum](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) | 自習式 |
| <strong>他のテンプレートを試す</strong> | [Microsoft Foundry Templates](https://ai.azure.com/templates) | 1〜2時間 |
| <strong>深堀り</strong> | [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | 継続的 |
| <strong>コミュニティ参加</strong> | [Azure Discord](https://aka.ms/foundry/discord) | 今すぐ参加！ |

### 次に試すおすすめテンプレート

1. **[Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)** - データで始める基本チャット
2. **[Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** - 高度なRAGパターン
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - エンタープライズ向け小売シナリオ

---

## 4. ワークショップチャレンジ

スキルを試す準備はできましたか？以下のチャレンジに挑戦しましょう：

| チャレンジ | 説明 | 難易度 |
|:---|:---|:---|
| **1. マルチエージェントシナリオ** | 異なる業界（例：医療、金融）向けに展開とカスタマイズ | ⭐⭐ |
| **2. カスタムナレッジベース** | 独自のデータファイルを追加しカスタム検索インデックスを作成 | ⭐⭐⭐ |
| **3. 本番展開** | `azd pipeline config` を使った GitHub Actions の CI/CD 設定 | ⭐⭐⭐⭐ |

---

## 5. フィードバックを共有してください

あなたのフィードバックがこのワークショップの改善に役立ちます！

- **GitHub Issues**: [フィードバックを投稿する](https://github.com/microsoft/azd-for-beginners/issues) - タグは `Workshop`
- **Discord**: [Microsoft Foundry Discord](https://aka.ms/foundry/discord) に参加 - 投稿先は `#get-help`
- <strong>コントリビューション</strong>: プルリクエストを送信してワークショップの改善に協力しましょう！

---

## ありがとうございました！🎉

AZD for AI Developers Workshop を修了していただきありがとうございます。この体験が、Azure 上でAIアプリケーションを構築・展開するためのスキルと自信を身につける助けとなれば幸いです。

**開発を続け、学び続け、Azure AI 開発者コミュニティへようこそ！**

---

| | |
|:---|:---|
| **📚 コースホーム** | [AZD For Beginners](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) |
| **📖 ドキュメント** | [Azure Developer CLI Docs](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI テンプレート** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
| **💬 コミュニティ** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->