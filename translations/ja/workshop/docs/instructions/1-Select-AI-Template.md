# 1. テンプレートを選択

!!! tip "このモジュールの終了時には次のことができるようになります"

    - [ ] AZD テンプレートとは何かを説明する
    - [ ] AI 向けの AZD テンプレートを発見して使用する
    - [ ] AI Agents テンプレートの使い方を習得する
    - [ ] **Lab 1:** Codespaces または開発コンテナでの AZD クイックスタート

---

## 1. A Builder Analogy

ゼロから最新のエンタープライズ対応の AI アプリケーションを構築するのは困難です。これは、新しい家を自分で一つ一つレンガを積んで建てるようなものです。確かに可能ですが、望む成果を得る最も効率的な方法ではありません！

代わりに、既存の「設計図」を使い、建築家と協力して個別の要求に合わせてカスタマイズすることがよくあります。これが知能化されたアプリケーションを構築する際の正しいアプローチです。まず、問題領域に適した良い設計アーキテクチャを見つけます。次にソリューションアーキテクトと協力して、そのシナリオに合わせてソリューションをカスタマイズし開発します。

では、これらの設計図はどこで見つければよいのでしょうか？ また、これらの設計図を自分でカスタマイズしてデプロイする方法を教えてくれるアーキテクトはどこにいるのでしょうか？ このワークショップでは、次の三つの技術を紹介することでこれらの質問に答えます。

1. [Azure Developer CLI](https://aka.ms/azd) - ローカル開発（ビルド）からクラウドデプロイ（シップ）への開発者の道のりを加速するオープンソースツール。
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) - AI ソリューションアーキテクチャをデプロイするためのサンプルコード、インフラ、および構成ファイルを含む標準化されたオープンソースリポジトリ。
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - Azure の知識に基づいてコードベースのナビゲーションや変更方法を自然言語で案内してくれるコーディングエージェント。

これらのツールを活用することで、適切なテンプレートを「発見」し、それを「デプロイ」して動作確認を行い、特定のシナリオに合わせて「カスタマイズ」できるようになります。さっそくそれらの使い方を学んでいきましょう。


---

## 2. Azure Developer CLI

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (or `azd`) は、IDE（開発）と CI/CD（DevOps）環境全体で一貫して動作する、開発者に優しいコマンド群によりコードからクラウドへの道のりを加速するオープンソースのコマンドラインツールです。

`azd` を使うと、デプロイの流れは次のようにシンプルになります:

- `azd init` - 既存の AZD テンプレートから新しい AI プロジェクトを初期化します。
- `azd up` - インフラをプロビジョニングしてアプリケーションを一度にデプロイします。
- `azd monitor` - デプロイ済みアプリケーションのリアルタイム監視と診断を取得します。
- `azd pipeline config` - Azure へのデプロイを自動化する CI/CD パイプラインを設定します。

**🎯 | 演習**: <br/> 現在のワークショップ環境で `azd` コマンドラインツールを探索してください。これは GitHub Codespaces、開発コンテナ、または前提条件をインストールしたローカルクローンで行えます。ツールが何をできるかを見るには、まず次のコマンドを入力してみてください:

```bash title="" linenums="0"
azd help
```

![フロー](../../../../../translated_images/ja/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. The AZD Template

`azd` がこれを実現するためには、プロビジョニングするインフラ、適用すべき構成設定、そしてデプロイするアプリケーションを知る必要があります。ここで [AZD templates](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp) の出番です。 

AZD テンプレートは、サンプルコードとソリューションアーキテクチャをデプロイするために必要なインフラと構成ファイルを組み合わせたオープンソースのリポジトリです。
「Infrastructure-as-Code」（IaC）アプローチを使用することで、テンプレートのリソース定義と構成設定をアプリのソースコードと同様にバージョン管理し、当該プロジェクトのユーザー間で再利用可能で一貫したワークフローを作成できます。

自分のシナリオ向けに AZD テンプレートを作成または再利用する際には、次の質問を検討してください:

1. 何を構築していますか？ → そのシナリオ向けのスターターコードを持つテンプレートはありますか？
1. ソリューションはどのように設計されていますか？ → 必要なリソースを持つテンプレートはありますか？
1. ソリューションはどのようにデプロイされますか？ → `azd deploy` を事前/事後処理フックとともに考えてみてください！
1. どうすればさらに最適化できますか？ → 組み込みの監視や自動化パイプラインを検討してください！

**🎯 | 演習**: <br/> 
[Awesome AZD](https://azure.github.io/awesome-azd/) ギャラリーを訪れてフィルターを使い、現在利用可能な 250+ のテンプレートを探索してください。自分のシナリオ要件に合致するものが見つかるか確認してみましょう。

![コード](../../../../../translated_images/ja/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. AI App Templates

AI 搭載アプリケーション向けに、Microsoft は **Microsoft Foundry** と **Foundry Agents** を特徴とする専門のテンプレートを提供しています。これらのテンプレートは、インテリジェントで本番対応のアプリケーションを構築するまでの道のりを加速します。

### Microsoft Foundry & Foundry Agents Templates

以下からテンプレートを選んでデプロイしてください。各テンプレートは [Awesome AZD](https://azure.github.io/awesome-azd/) に掲載されており、単一のコマンドで初期化できます。

| Template | Description | Deploy Command |
|----------|-------------|----------------|
| **[AI Chat with RAG](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | Microsoft Foundry を使用した Retrieval Augmented Generation によるチャットアプリケーション | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent Service Starter](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | 自律的なタスク実行のための Foundry Agents を使用して AI エージェントを構築する | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[Multi-Agent Orchestration](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | 複雑なワークフローのために複数の Foundry Agents を調整する | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI Document Intelligence](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | Microsoft Foundry モデルでドキュメントを抽出・解析する | `azd init -t azure-samples/ai-document-processing` |
| **[Conversational AI Bot](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | Microsoft Foundry 統合によるインテリジェントなチャットボットを構築する | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI Image Generation](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | Microsoft Foundry 経由で DALL-E を使用して画像を生成する | `azd init -t azure-samples/ai-image-generation` |
| **[Semantic Kernel Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | Foundry Agents と組み合わせた Semantic Kernel を使用する AI エージェント | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen Multi-Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | AutoGen フレームワークを使用したマルチエージェントシステム | `azd init -t azure-samples/autogen-multi-agent` |

### Quick Start

1. <strong>テンプレートを閲覧</strong>: [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) を訪れ、`AI`、`Agents`、または `Microsoft Foundry` でフィルターします
2. <strong>テンプレートを選択</strong>: ユースケースに合ったものを選びます
3. <strong>初期化</strong>: 選んだテンプレートに対して `azd init` コマンドを実行します
4. <strong>デプロイ</strong>: `azd up` を実行してプロビジョニングとデプロイを行います

**🎯 | 演習**: <br/>
上記のテンプレートの中から、自分のシナリオに基づいて一つ選んでください:

- **Building a chatbot?** → **AI Chat with RAG** または **Conversational AI Bot** から開始
- **Need autonomous agents?** → **Foundry Agent Service Starter** または **Multi-Agent Orchestration** を試す
- **Processing documents?** → **AI Document Intelligence** を使用
- **Want AI coding assistance?** → **Semantic Kernel Agent** または **AutoGen Multi-Agent** を検討

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "さらにテンプレートを探索する"
    The [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) contains 250+ templates. Use the filters to find templates matching your specific requirements for language, framework, and Azure services.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:
本ドキュメントはAI翻訳サービス[Co-op トランスレーター](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性の確保に努めていますが、自動翻訳には誤りや不正確さが含まれる可能性があることにご留意ください。原文（原言語での文書）を権威ある出典として扱ってください。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の使用に起因する誤解や誤訳について、当社は一切の責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->