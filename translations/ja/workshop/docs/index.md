# AI開発者向けAZDワークショップ

> 2026年7月に `azd 1.27.1` で検証済み。

> [!IMPORTANT]  
> **このワークショップはワークショップガイドが組み込まれており、ローカルブラウザでプレビュー可能です。開始するには、GitHub Codespaces、開発コンテナ、またはMkDocsがインストールされたローカルクローンでリポジトリを開きます—その後、アクティブなVS Codeのターミナルが表示されるまで待ち、次のコマンドを入力してください：**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **ブラウザでプレビューページを開くためのポップアップダイアログが表示されるはずです。**

Azure Developer CLI (AZD) の学習に焦点を当てたAIアプリケーション展開のハンズオンワークショップへようこそ。このワークショップは、AZDテンプレートの適用的理解を3段階で深めることを目指します：

1. <strong>発見</strong> - 自分に合ったテンプレートを見つける。
1. <strong>展開</strong> - 展開して正常に動作することを確認する。
1. <strong>カスタマイズ</strong> - 変更・繰り返し改善して、自分のものにする！

このワークショップ全体を通して、エンドツーエンドの開発体験を合理化するためのコア開発ツールやワークフローも紹介されます。

| | | 
|:---|:---|
| **📚 コースホーム**| [AZD For Beginners](../README.md)|
| **📖 ドキュメント** | [AIテンプレートの始め方](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AIテンプレート** | [Microsoft Foundryテンプレート](https://ai.azure.com/templates) |
|**🚀 次のステップ** | [チャレンジに挑戦](#workshop-challenge) |
| | |

## ワークショップ概要

**所要時間:** 3～4時間  
**レベル:** 初級〜中級  
**前提条件:** Azure、AI概念、VS Codeおよびコマンドラインツールの基本理解。

このワークショップは実践形式で、体験しながら学びます。演習を終えたら、セキュリティおよび生産性のベストプラクティスへ学びを深めるために、AZD For Beginnersカリキュラムを確認することをお勧めします。

| 時間 | モジュール | 目的 |
|:---|:---|:---|
| 15分 | はじめに | 目的を理解し、概要を設定 |
| 30分 | AIテンプレートの選択 | オプションを調べ、スターターを選ぶ | 
| 30分 | AIテンプレートの検証 | 既定のソリューションをAzureに展開 |
| 30分 | AIテンプレートの分解 | 構造と設定を探索 |
| 30分 | AIテンプレートの設定 | 利用可能な機能を有効化し試す |
| 30分 | AIテンプレートのカスタマイズ | 自分のニーズに合わせて調整 |
| 30分 | インフラの解体 | クリーンアップとリソースの解放 |
| 15分 | まとめと次のステップ | 学習リソース、ワークショップチャレンジ |
| | |

## 学べること

AZDテンプレートは、Microsoft Foundryでのエンドツーエンド開発に関連する様々な機能やツールを試す学習用サンドボックスと考えてください。このワークショップ終了時には、これらのツールや概念について直感的な理解が得られているはずです。

| コンセプト | 目的 |
|:---|:---|
| **Azure Developer CLI** | ツールコマンドとワークフローを理解する |
| **AZDテンプレート** | プロジェクト構造と設定を理解する |
| **Azure AI Agent** | Microsoft Foundryプロジェクトのプロビジョニングと展開 |
| **Azure AI Search** | エージェントを用いたコンテキストエンジニアリングを有効にする |
| <strong>オブザーバビリティ</strong> | トレース、監視、評価を探求する |
| <strong>レッドチーミング</strong> | 敵対的テストと軽減策を探索する |
| | |

## ワークショップモジュール

準備ができたら、以下のワークショップモジュールを進んでください：

- [モジュール1: AIテンプレートの選択](instructions/1-Select-AI-Template.md)
- [モジュール2: AIテンプレートの検証](instructions/2-Validate-AI-Template.md) 
- [モジュール3: AIテンプレートの分解](instructions/3-Deconstruct-AI-Template.md)
- [モジュール4: AIテンプレートの設定](instructions/4-Configure-AI-Template.md)
- [モジュール5: AIテンプレートのカスタマイズ](instructions/5-Customize-AI-Template.md)
- [モジュール6: インフラの解体](instructions/6-Teardown-Infrastructure.md)
- [モジュール7: まとめと次のステップ](instructions/7-Wrap-up.md)

## フィードバックはありますか？

このリポジトリにIssueを投稿（タグは `Workshop`）するか、[Discord](https://aka.ms/foundry/discord)に参加して `#get-help` チャンネルに投稿してください

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->