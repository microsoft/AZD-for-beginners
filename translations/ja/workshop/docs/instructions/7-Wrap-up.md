# 7. 総括と次のステップ

!!! tip "主な要点"

    - [ ] AZD のテンプレートは AI アプリケーション開発を数日から数時間に短縮する
    - [ ] Discovery → Deployment → Customization の方法論は構造化された学習の道筋を提供する
    - [ ] MCP サーバーと連携した GitHub Copilot により、自然言語で複雑なコードベースを探査できる
    - [ ] Microsoft Foundry は組み込みの可観測性、評価、セキュリティテストを提供する

---

## 1. あなたが達成したこと

おめでとうございます！このワークショップで、あなたは以下を達成しました：

| Module | Accomplishment |
|:---|:---|
| **Module 1** | Azure Developer CLI を発見し、AI テンプレートを選択した |
| **Module 2** | 完全な AI エージェント ソリューションをデプロイし、検証した |
| **Module 3** | テンプレートを分解してアーキテクチャを理解した |
| **Module 4** | `azure.yaml` の設定とライフサイクルフックを調査した |
| **Module 5** | テンプレートを自分のシナリオ向けにカスタマイズした |
| **Module 6** | インフラを安全に解体し、リソースを管理した |

---

## 2. 習得した重要な概念

### Azure Developer CLI (azd)
- `azd init` - テンプレートからプロジェクトを初期化する
- `azd up` - 1つのコマンドでプロビジョニングとデプロイを実行する
- `azd env` - 環境変数を管理する
- `azd down` - リソースを安全にクリーンアップする

### AZD テンプレート構成
- `azure.yaml` - 設定とデプロイのフック
- `infra/` - Bicep によるインフラストラクチャー定義 (IaC)
- `src/` - アプリケーションのソースコード
- `scripts/` - 自動化およびセットアップ用スクリプト

### Microsoft Foundry の機能
- インテリジェントアシスタント向けの AI Agent Service
- ナレッジ検索のための File Search と Azure AI Search
- 組み込みのトレーシング、モニタリング、評価
- AI 安全性検証のためのレッドチーミング

---

## 3. 学習の旅を続ける

### 推奨される次のステップ

| Path | Resource | Time |
|:---|:---|:---|
| **Complete Course** | [AZD for Beginners Curriculum](../../README.md) | 8〜12時間 |
| **Try Another Template** | [Microsoft Foundry Templates](https://ai.azure.com/templates) | 1〜2時間 |
| **Deep Dive** | [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | 継続的 |
| **Community** | [Azure Discord](https://aka.ms/foundry/discord) | 今すぐ参加！ |

### 次に試すことをお勧めするテンプレート

1. **[Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)** - 基本的なデータを使ったチャット
2. **[Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** - 高度な RAG パターン
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - 企業向け小売シナリオ

---

## 4. ワークショップチャレンジ

スキルを試す準備はできていますか？ 以下のチャレンジに挑戦してみましょう：

| Challenge | Description | Difficulty |
|:---|:---|:---|
| **1. Multi-Agent Scenario** | 別の業界（例：ヘルスケア、金融）向けにデプロイしてカスタマイズする | ⭐⭐ |
| **2. Custom Knowledge Base** | 独自のデータファイルを追加し、カスタム検索インデックスを作成する | ⭐⭐⭐ |
| **3. Production Deployment** | `azd pipeline config` を使用して GitHub Actions で CI/CD を構築する | ⭐⭐⭐⭐ |

---

## 5. フィードバックを共有する

皆さんのフィードバックはこのワークショップの改善に役立ちます！

- **GitHub Issues**: [フィードバックを投稿](https://github.com/microsoft/azd-for-beginners/issues) - `Workshop` タグを付けて投稿してください
- **Discord**: Join [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - `#get-help` に投稿してください
- **貢献**: プルリクエストを送ってワークショップの改善に協力してください！

---

## ありがとうございます！ 🎉

AZD for AI Developers ワークショップの修了、おめでとうございます。今回の経験が Azure 上で AI アプリケーションを構築・デプロイするためのスキルと自信を与えられたことを願っています。

**これからも構築を続け、学び続け、Azure AI デベロッパーコミュニティへようこそ！**

---

| | |
|:---|:---|
| **📚 コースホーム** | [AZD For Beginners](../../README.md) |
| **📖 ドキュメント** | [Azure Developer CLI Docs](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI テンプレート** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
| **💬 コミュニティ** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責事項：
本書はAI翻訳サービス「Co‑op Translator」（https://github.com/Azure/co-op-translator）を用いて翻訳されました。正確性の確保に努めておりますが、自動翻訳には誤りや不正確な表現が含まれる可能性があることをご留意ください。重要な情報については原文（原言語）の文書を正式な出典とし、専門の人による翻訳を受けることを推奨します。本翻訳の利用により生じた誤解や解釈の相違については責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->