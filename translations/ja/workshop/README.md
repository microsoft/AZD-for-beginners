<div align="center">
  <div style="background: linear-gradient(135deg, #0078d4, #106ebe); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(0, 120, 212, 0.3); border: 2px solid #005a9e;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🎯 AZD for AI Developers Workshop
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Azure Developer CLI を使って AI アプリケーションを構築するための実践ワークショップです。</strong><br>
      7 つのモジュールを完了して、AZD テンプレートと AI 展開ワークフローを習得しましょう。
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Last Updated: February 2026
      </span>
    </div>
  </div>
</div>

# AZD for AI 開発者向けワークショップ

Azure Developer CLI (AZD) を学び、AI アプリケーションのデプロイに焦点を当てたハンズオンワークショップへようこそ。本ワークショップでは、AZD テンプレートを次の 3 ステップで実践的に理解できます:

1. **Discovery** - 自分に合ったテンプレートを見つける
1. **Deployment** - デプロイして動作を検証する
1. **Customization** - 修正・反復して自分仕様にする!

このワークショップを通じて、エンドツーエンドの開発を効率化するための主要な開発ツールとワークフローも紹介します。

<br/>

## ブラウザベースのガイド

ワークショップのレッスンは Markdown 形式です。GitHub 上で直接ナビゲートすることもできますし、下のスクリーンショットに示すようにブラウザベースのプレビューを起動することもできます。

![ワークショップ](../../../translated_images/ja/workshop.75906f133e6f8ba0.webp)

このオプションを使うには、リポジトリを自分のプロフィールにフォークし、GitHub Codespaces を起動してください。VS Code のターミナルがアクティブになったら、次のコマンドを入力します:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

数秒後にポップアップダイアログが表示されます。`Open in browser` オプションを選択してください。ブラウザベースのガイドが新しいタブで開きます。プレビューの利点:

1. **組み込み検索** - キーワードやレッスンを素早く見つけられます。
1. **コピーアイコン** - コードブロックにマウスを重ねると表示されます
1. **テーマ切替** - ダーク / ライト テーマを切り替えられます
1. **ヘルプを得る** - フッターの Discord アイコンをクリックして参加！

<br/>

## ワークショップ概要

**所要時間:** 3～4 時間  
**レベル:** 初級〜中級  
**前提条件:** Azure、AI の基本概念、VS Code およびコマンドラインツールに慣れていること

これは実践型のワークショップで、手を動かして学びます。演習を完了したら、セキュリティや生産性のベストプラクティスに進むために「AZD For Beginners」カリキュラムを確認することをお勧めします。

| Time| Module  | Objective |
|:---|:---|:---|
| 15 分 | [Introduction](docs/instructions/0-Introduction.md) | 全体の概要を把握し、目標を理解する |
| 30 分 | [Select AI Template](docs/instructions/1-Select-AI-Template.md) | オプションを調べてスターターを選ぶ | 
| 30 分 | [Validate AI Template](docs/instructions/2-Validate-AI-Template.md) | デフォルトソリューションを Azure にデプロイする |
| 30 分 | [Deconstruct AI Template](docs/instructions/3-Deconstruct-AI-Template.md) | 構造と設定を調査する |
| 30 分 | [Configure AI Template](docs/instructions/4-Configure-AI-Template.md) | 利用可能な機能を有効化して試す |
| 30 分 | [Customize AI Template](docs/instructions/5-Customize-AI-Template.md) | テンプレートをニーズに合わせて適応する |
| 30 分 | [Teardown Infrastructure](docs/instructions/6-Teardown-Infrastructure.md) | リソースのクリーンアップと解放 |
| 15 分 | [Wrap-Up & Next Steps](docs/instructions/7-Wrap-up.md) | 学習リソース、ワークショップチャレンジ |

<br/>

## 学べること

AZD テンプレートを学習用のサンドボックスと考え、Microsoft Foundry 上でのエンドツーエンド開発におけるさまざまな機能やツールを探求します。ワークショップ修了時には、この文脈での各種ツールや概念について直感的な理解が得られているはずです。

| Concept  | Objective |
|:---|:---|
| **Azure Developer CLI** | ツールのコマンドとワークフローを理解する |
| **AZD Templates**| プロジェクト構造と設定を理解する |
| **Azure AI Agent**| Microsoft Foundry プロジェクトのプロビジョニングとデプロイ |
| **Azure AI Search**| エージェントによるコンテキストエンジニアリングを可能にする |
| **Observability**| トレース、モニタリング、評価を探る |
| **Red Teaming**| 敵対的テストと軽減策を探る |

<br/>

## ワークショップの構成

このワークショップは、テンプレートの発見からデプロイ、分解、カスタマイズへと進む旅のように構成されています。公式の [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) スターターテンプレートを基礎として使用します。

### [Module 1: Select AI Template](docs/instructions/1-Select-AI-Template.md) (30 mins)

- AI テンプレートとは何か？
- AI テンプレートはどこで見つけられるか？
- AI エージェントの構築を始めるにはどうすればよいか？
- **演習**: GitHub Codespaces でのクイックスタート

### [Module 2: Validate AI Template](docs/instructions/2-Validate-AI-Template.md) (30 mins)

- AI テンプレートのアーキテクチャとは？
- AZD の開発ワークフローとは？
- AZD 開発でどのようにサポートを得られるか？
- **演習**: AI Agents テンプレートのデプロイと検証

### [Module 3: Deconstruct AI Template](docs/instructions/3-Deconstruct-AI-Template.md) (30 mins)

- `.azure/` の環境を調査する 
- `infra/` のリソース構成を調査する 
- `azure.yaml` の AZD 設定を調査する
- **演習**: 環境変数を変更して再デプロイ

### [Module 4: Configure AI Template](docs/instructions/4-Configure-AI-Template.md) (30 mins)
- 探索: Retrieval Augmented Generation（RAG）
- 探索: エージェントの評価とレッドチーミング
- 探索: トレースとモニタリング
- **演習**: AI エージェントと可観測性の探究

### [Module 5: Customize AI Template](docs/instructions/5-Customize-AI-Template.md) (30 mins)
- 定義: シナリオ要件を含む PRD の作成
- 設定: AZD 用の環境変数を構成する
- 実装: 追加タスクのためのライフサイクルフックを実装する
- **演習**: 自分のシナリオに合わせてテンプレートをカスタマイズ

### [Module 6: Teardown Infrastructure](docs/instructions/6-Teardown-Infrastructure.md) (30 mins)
- 振り返り: AZD テンプレートとは何か？
- 振り返り: なぜ Azure Developer CLI を使うのか？
- 次のステップ: 別のテンプレートを試してみよう！
- **演習**: インフラのデプロビジョニング解除とクリーンアップ

<br/>

## ワークショップチャレンジ

もっと挑戦したいですか？ここにプロジェクト提案をいくつか示します — またはアイデアを共有してください!!

| Project | Description |
|:---|:---|
|1. **Deconstruct A Complex AI Template** | ここで示したワークフローとツールを使って、別の AI ソリューションテンプレートをデプロイ、検証、カスタマイズできるか試してみてください。_何を学びましたか？_|
|2. **Customize With Your Scenario**  | 異なるシナリオの PRD（製品要件文書）を書いてみてください。その後、テンプレートリポジトリ内で GitHub Copilot を使い、Agent Model にカスタマイズワークフローの生成を依頼してみましょう。_何を学びましたか？これらの提案をどう改善できますか？_|
| | |

## フィードバックはありますか？

1. このリポジトリに issue を投稿してください — 便利のために `Workshop` とタグ付けしてください。
1. Microsoft Foundry Discord に参加して、仲間とつながりましょう！


| | | 
|:---|:---|
| **📚 コースホーム**| [AZD For Beginners](../README.md)|
| **📖 ドキュメント** | [Get started with AI templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI テンプレート** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
|**🚀 次のステップ** | [Begin Workshop](../../../workshop) |
| | |

<br/>

---

**Navigation:** [Main Course](../README.md) | [Introduction](docs/instructions/0-Introduction.md) | [Module 1: Select Template](docs/instructions/1-Select-AI-Template.md)

**AZD を使って AI アプリケーションの構築を始める準備はできていますか？**

[Begin Workshop: Introduction →](docs/instructions/0-Introduction.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責事項：
本書は AI 翻訳サービス「Co-op Translator」（https://github.com/Azure/co-op-translator）を用いて翻訳されました。正確性には努めていますが、自動翻訳には誤りや不正確な表現が含まれる可能性があることをご承知ください。原文（原言語での文書）が正式な出典として優先されます。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じた誤解や解釈の相違について、当方は一切の責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->