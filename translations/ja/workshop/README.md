<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "390da1a5d0feb705fa0eb9940f6f3b27",
  "translation_date": "2025-10-16T15:29:26+00:00",
  "source_file": "workshop/README.md",
  "language_code": "ja"
}
-->
<div align="center">
  <div style="background: linear-gradient(135deg, #ff6b35, #f7931e); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(255, 107, 53, 0.3); border: 2px solid #e55a2b;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🚧 ワークショップは現在構築中 🚧
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>このワークショップは現在開発中です。</strong><br>
      コンテンツは未完成である可能性があり、変更される場合があります。更新情報をお待ちください！
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 最終更新日: 2025年10月
      </span>
    </div>
  </div>
</div>

# AI開発者向けAZDワークショップ

Azure Developer CLI (AZD)を学び、AIアプリケーションのデプロイに焦点を当てたハンズオンワークショップへようこそ。このワークショップでは、以下の3ステップでAZDテンプレートの実践的な理解を深めます：

1. **発見** - 自分に合ったテンプレートを見つける
1. **デプロイ** - デプロイして動作を確認する
1. **カスタマイズ** - 自分用に修正して繰り返し作業する

ワークショップを通じて、開発者向けの主要なツールやワークフローも紹介し、開発プロセス全体を効率化する方法を学びます。

<br/>

## ブラウザベースのガイド

ワークショップのレッスンはMarkdown形式で記載されています。GitHubで直接ナビゲートするか、以下のスクリーンショットに示されているようにブラウザベースのプレビューを起動することができます。

![Workshop](../../../translated_images/ja/workshop.75906f133e6f8ba0.webp)

このオプションを使用するには、リポジトリを自分のプロフィールにフォークし、GitHub Codespacesを起動します。VS Codeのターミナルがアクティブになったら、以下のコマンドを入力してください：

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

数秒後、ポップアップダイアログが表示されます。「ブラウザで開く」を選択してください。ウェブベースのガイドが新しいブラウザタブで開きます。このプレビューの利点：

1. **内蔵検索機能** - キーワードやレッスンを素早く検索
1. **コピーアイコン** - コードブロックにカーソルを合わせると表示されます
1. **テーマ切り替え** - ダークテーマとライトテーマを切り替え可能
1. **ヘルプを得る** - フッターのDiscordアイコンをクリックして参加！

<br/>

## ワークショップ概要

**所要時間:** 3～4時間  
**レベル:** 初級～中級  
**前提条件:** Azure、AIの基本概念、VS Code、コマンドラインツールの知識

このワークショップは、実際に手を動かして学ぶ形式です。演習を完了した後は、セキュリティや生産性のベストプラクティスを学ぶために「AZD For Beginners」カリキュラムを確認することをお勧めします。

| 時間| モジュール  | 目的 |
|:---|:---|:---|
| 15分 | [イントロダクション](docs/instructions/0-Introduction.md) | 目的を理解し、準備を整える |
| 30分 | [AIテンプレートを選択](docs/instructions/1-Select-AI-Template.md) | オプションを探索し、スターターを選ぶ | 
| 30分 | [AIテンプレートを検証](docs/instructions/2-Validate-AI-Template.md) | デフォルトのソリューションをAzureにデプロイ |
| 30分 | [AIテンプレートを分解](docs/instructions/3-Deconstruct-AI-Template.md) | 構造と設定を探索 |
| 30分 | [AIテンプレートを設定](docs/instructions/4-Configure-AI-Template.md) | 利用可能な機能を有効化して試す |
| 30分 | [AIテンプレートをカスタマイズ](docs/instructions/5-Customize-AI-Template.md) | テンプレートをニーズに合わせて調整 |
| 30分 | [インフラストラクチャを解体](docs/instructions/6-Teardown-Infrastructure.md) | リソースをクリーンアップして解放 |
| 15分 | [まとめと次のステップ](docs/instructions/7-Wrap-up.md) | 学習リソース、ワークショップチャレンジ |

<br/>

## 学べること

AZDテンプレートを学習のためのサンドボックスと考え、Azure AI Foundryでのエンドツーエンド開発におけるさまざまな機能やツールを探索します。このワークショップを終える頃には、これらのツールや概念について直感的な理解が得られるはずです。

| 概念  | 目的 |
|:---|:---|
| **Azure Developer CLI** | ツールのコマンドとワークフローを理解する |
| **AZDテンプレート**| プロジェクト構造と設定を理解する |
| **Azure AIエージェント**| Azure AI Foundryプロジェクトをプロビジョニング＆デプロイ |
| **Azure AI検索**| エージェントによるコンテキストエンジニアリングを有効化 |
| **可観測性**| トレーシング、モニタリング、評価を探索 |
| **レッドチーミング**| 敵対的テストと緩和策を探索 |

<br/>

## ワークショップ構成

このワークショップは、テンプレートの発見からデプロイ、分解、カスタマイズまでの旅を案内します。公式の[Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)スターターテンプレートを基に進めます。

### [モジュール1: AIテンプレートを選択](docs/instructions/1-Select-AI-Template.md) (30分)

- AIテンプレートとは？
- AIテンプレートはどこで見つけられる？
- AIエージェントの構築を始めるには？
- **ラボ**: GitHub Codespacesでクイックスタート

### [モジュール2: AIテンプレートを検証](docs/instructions/2-Validate-AI-Template.md) (30分)

- AIテンプレートのアーキテクチャとは？
- AZD開発ワークフローとは？
- AZD開発のヘルプを得る方法は？
- **ラボ**: AIエージェントテンプレートをデプロイ＆検証

### [モジュール3: AIテンプレートを分解](docs/instructions/3-Deconstruct-AI-Template.md) (30分)

- `.azure/`内の環境を探索
- `infra/`内のリソース設定を探索
- `azure.yaml`内のAZD設定を探索
- **ラボ**: 環境変数を修正して再デプロイ

### [モジュール4: AIテンプレートを設定](docs/instructions/4-Configure-AI-Template.md) (30分)
- 探索: 検索強化生成
- 探索: エージェント評価＆レッドチーミング
- 探索: トレーシング＆モニタリング
- **ラボ**: AIエージェント＋可観測性を探索

### [モジュール5: AIテンプレートをカスタマイズ](docs/instructions/5-Customize-AI-Template.md) (30分)
- 定義: シナリオ要件を含むPRD
- 設定: AZDの環境変数
- 実装: 追加タスクのライフサイクルフック
- **ラボ**: 自分のシナリオに合わせてテンプレートをカスタマイズ

### [モジュール6: インフラストラクチャを解体](docs/instructions/6-Teardown-Infrastructure.md) (30分)
- 再確認: AZDテンプレートとは？
- 再確認: Azure Developer CLIを使用する理由
- 次のステップ: 別のテンプレートを試す！
- **ラボ**: インフラストラクチャを解除してクリーンアップ

<br/>

## ワークショップチャレンジ

もっと挑戦したいですか？以下のプロジェクト提案を参考にするか、あなた自身のアイデアを共有してください！

| プロジェクト | 説明 |
|:---|:---|
|1. **複雑なAIテンプレートを分解** | 提示されたワークフローとツールを使用して、別のAIソリューションテンプレートをデプロイ、検証、カスタマイズしてみてください。_何を学びましたか？_|
|2. **シナリオに合わせてカスタマイズ**  | 別のシナリオのためのPRD（製品要件文書）を書いてみてください。その後、GitHub Copilotをテンプレートリポジトリのエージェントモデルで使用し、カスタマイズワークフローを生成するよう依頼してください。_何を学びましたか？これらの提案をどう改善できますか？_|
| | |

## フィードバックがありますか？

1. このリポジトリにIssueを投稿してください - `Workshop`タグを付けると便利です。
1. Azure AI Foundry Discordに参加して、仲間とつながりましょう！


| | | 
|:---|:---|
| **📚 コースホーム**| [AZD For Beginners](../README.md)|
| **📖 ドキュメント** | [AIテンプレートの使い方](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AIテンプレート** | [Azure AI Foundry Templates](https://ai.azure.com/templates) |
|**🚀 次のステップ** | [チャレンジに挑戦する](../../../workshop) |
| | |

<br/>

---

**前回:** [AIトラブルシューティングガイド](../docs/troubleshooting/ai-troubleshooting.md) | **次回:** [ラボ1: AZDの基礎](../../../workshop/lab-1-azd-basics)

**AZDを使ってAIアプリケーションの構築を始めますか？**

[ラボ1: AZDの基礎を始める →](./lab-1-azd-basics/README.md)

---

**免責事項**:  
この文書はAI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性を追求しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があります。元の言語で記載された文書を正式な情報源としてご参照ください。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用に起因する誤解や誤認について、当方は責任を負いません。