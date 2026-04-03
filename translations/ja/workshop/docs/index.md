# AI 開発者向け AZD ワークショップ

> 2026年3月に `azd 1.23.12` で検証済み。
> [!IMPORTANT]  
> **このワークショップには、ローカルのブラウザーでプレビューできるワークショップガイドが組み込まれています。始めるには、リポジトリを GitHub Codespaces、dev コンテナ、または MkDocs がインストールされたローカルクローンで開き、VS Code のアクティブなターミナルが表示されるまで待ってから、次のコマンドを入力してください：**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **プレビュー ページをブラウザーで開くダイアログが表示されます。**

ハンズオン形式のワークショップへようこそ。ここでは、AI アプリケーションのデプロイに焦点を当てて Azure Developer CLI (AZD) を学びます。このワークショップでは、次の3ステップで AZD テンプレートの実践的な理解を深めます:

1. <strong>探索</strong> - 自分に適したテンプレートを見つける。  
1. <strong>デプロイ</strong> - デプロイして動作を検証する  
1. <strong>カスタマイズ</strong> - 変更と反復を行い、自分仕様にする！

ワークショップを通じて、エンドツーエンドの開発を効率化するための主要な開発ツールやワークフローも紹介します。

| | | 
|:---|:---|
| **📚 Course Home**| [AZD 初心者向け](../README.md)|
| **📖 Documentation** | [AI テンプレートの始め方](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AIテンプレート** | [Microsoft Foundry テンプレート](https://ai.azure.com/templates) |
|**🚀 Next Steps** | [チャレンジに挑戦する](#workshop-challenge) |
| | |

## ワークショップの概要

**期間:** 3-4 時間  
**レベル:** 初級〜中級  
**前提条件:** Azure、AI の概念、VS Code、コマンドラインツールに慣れていること。

これは実践型のワークショップで、実際に手を動かしながら学びます。演習を完了したら、セキュリティや生産性のベストプラクティスについて学習を続けるために、AZD 初心者向けカリキュラムを確認することをお勧めします。

| 時間| モジュール  | 目的 |
|:---|:---|:---|
| 15 分 | Introduction | 準備と目標の理解 |
| 30 分 | Select AI Template | オプションを探索してスターターを選ぶ | 
| 30 分 | Validate AI Template | デフォルトのソリューションを Azure にデプロイ |
| 30 分 | Deconstruct AI Template | 構造と設定を探る |
| 30 分 | Configure AI Template | 機能を有効化して試す |
| 30 分 | Customize AI Template | テンプレートをニーズに合わせて適応 |
| 30 分 | Teardown Infrastructure | クリーンアップしてリソースを解放 |
| 15 分 | Wrap-Up & Next Steps | 学習リソース、ワークショップチャレンジ |
| | |

## 学習内容

AZD テンプレートを学習用のサンドボックスとして捉え、Microsoft Foundry 上でのエンドツーエンド開発における各種機能やツールを探索します。ワークショップ終了時には、これらのツールや概念に対する直感的な理解が得られているはずです。

| 概念  | 目的 |
|:---|:---|
| **Azure Developer CLI** | ツールのコマンドとワークフローを理解する |
| **AZD テンプレート**| プロジェクト構造と設定を理解する |
| **Azure AI Agent**| Microsoft Foundry プロジェクトをプロビジョニングおよびデプロイ |
| **Azure AI Search**| エージェントによるコンテキストエンジニアリングを有効にする |
| **Observability**| トレース、モニタリング、評価を探索する |
| <strong>レッドチーミング</strong>| 敵対的テストと緩和策を探索する |
| | |

## ワークショップ モジュール

始める準備はできましたか？ワークショップのモジュールを順に進んでください:

- [モジュール 1: AI テンプレートを選択](instructions/1-Select-AI-Template.md)
- [モジュール 2: AI テンプレートを検証](instructions/2-Validate-AI-Template.md) 
- [モジュール 3: AI テンプレートを分解](instructions/3-Deconstruct-AI-Template.md)
- [モジュール 4: AI テンプレートを構成](instructions/4-Configure-AI-Template.md)
- [モジュール 5: AI テンプレートをカスタマイズ](instructions/5-Customize-AI-Template.md)
- [モジュール 6: インフラストラクチャの削除](instructions/6-Teardown-Infrastructure.md)
- [モジュール 7: まとめと次のステップ](instructions/7-Wrap-up.md)

## フィードバックは？

このリポジトリに issue を投稿する（タグは `Workshop`）か、[Discord](https://aka.ms/foundry/discord) に参加して `#get-help` チャンネルに投稿してください

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:
本書は AI翻訳サービス [Co-op トランスレーター](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性には努めていますが、自動翻訳には誤りや不正確な箇所が含まれる可能性があることをご承知おきください。原文（原語版）が権威ある情報源とみなされるべきです。重要な情報については、専門の人間による翻訳をお勧めします。本翻訳の使用に起因する誤解や解釈違いについて、当社は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->