# AZD for AI 開発者ワークショップ

> `azd 1.25.6` に対して 2026年6月に検証済み。

> [!IMPORTANT]  
> **このワークショップにはローカルブラウザーでプレビューできるワークショップガイドが組み込まれています。開始するには、リポジトリを GitHub Codespaces、dev コンテナー、または MkDocs がインストールされたローカルクローンで開き—アクティブな VS Code ターミナルが表示されるまで待ってから、次を入力してください：**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **ブラウザーでプレビュー ページを開くためのポップアップ ダイアログが表示されます。**

Azure Developer CLI (AZD) を学ぶためのハンズオンワークショップへようこそ。本ワークショップは AI アプリケーションのデプロイに焦点を当て、AZD テンプレートの実践的な理解を3つのステップで得られるように設計されています。

1. <strong>探索</strong> - 自分に適したテンプレートを見つける。  
1. <strong>展開</strong> - デプロイして動作を検証する。  
1. <strong>カスタマイズ</strong> - 修正して自分用に作り込む！

このワークショップを通して、エンドツーエンドの開発の流れを効率化するための主要な開発ツールとワークフローも紹介します。

| | | 
|:---|:---|
| **📚 コースホーム**| [AZD 初心者向け](../README.md)|
| **📖 ドキュメント** | [Get started with AI templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI テンプレート** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
|**🚀 次のステップ** | [Take The Challenge](#workshop-challenge) |
| | |

## ワークショップ概要

**所要時間:** 3〜4時間  
**レベル:** 初級〜中級  
**前提条件:** Azure、AI の基本概念、VS Code とコマンドラインツールに慣れていること。

これは実践型のワークショップです。課題を完了したら、セキュリティや生産性のベストプラクティスを学ぶために AZD 初心者向けのカリキュラムを見直することをお勧めします。

| 時間| モジュール  | 目的 |
|:---|:---|:---|
| 15分 | 導入 | 全体像を設定し、目標を理解する |
| 30分 | AI テンプレートの選択 | オプションを探索してスターターを選ぶ | 
| 30分 | AI テンプレートの検証 | デフォルトのソリューションを Azure にデプロイする |
| 30分 | AI テンプレートの分解 | 構造と設定を詳しく見る |
| 30分 | AI テンプレートの設定 | 利用可能な機能を有効化して試す |
| 30分 | AI テンプレートのカスタマイズ | テンプレートをニーズに合わせて調整する |
| 30分 | インフラの解体 | クリーンアップしてリソースを解放する |
| 15分 | まとめと次のステップ | 学習リソース、ワークショップ課題 |
| | |

## このワークショップで学ぶこと

AZD テンプレートを、Microsoft Foundry 上でのエンドツーエンド開発のさまざまな機能やツールを探索するための学習用サンドボックスとして考えてください。ワークショップ終了時には、このコンテキストでのさまざまなツールや概念について直感的な理解を得られているはずです。

| 概念  | 目的 |
|:---|:---|
| **Azure Developer CLI** | ツールのコマンドとワークフローを理解する |
| **AZD テンプレート**| プロジェクト構造と設定を理解する |
| **Azure AI エージェント**| Microsoft Foundry プロジェクトのプロビジョニングとデプロイ |
| **Azure AI Search**| エージェントを用いたコンテキストエンジニアリングを有効化する |
| <strong>可観測性</strong>| トレース、監視、評価を探索する |
| <strong>レッドチーミング</strong>| 敵対的テストと緩和策を探索する |
| | |

## ワークショップモジュール

準備ができたら、ワークショップモジュールを順に進んでください:

- [モジュール 1: AI テンプレートを選択](instructions/1-Select-AI-Template.md)
- [モジュール 2: AI テンプレートを検証](instructions/2-Validate-AI-Template.md) 
- [モジュール 3: AI テンプレートを分解](instructions/3-Deconstruct-AI-Template.md)
- [モジュール 4: AI テンプレートを設定](instructions/4-Configure-AI-Template.md)
- [モジュール 5: AI テンプレートをカスタマイズ](instructions/5-Customize-AI-Template.md)
- [モジュール 6: インフラの解体](instructions/6-Teardown-Infrastructure.md)
- [モジュール 7: まとめと次のステップ](instructions/7-Wrap-up.md)

## ご意見はありますか？

このリポジトリに issue を投稿してください（タグは `Workshop`）または [Discord](https://aka.ms/foundry/discord) に参加して `#get-help` チャンネルに投稿してください。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->