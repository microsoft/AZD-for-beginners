# 2. テンプレートの検証

> 2026年6月に `azd 1.25.6` で検証済み。

!!! tip "BY THE END OF THIS MODULE YOU WILL BE ABLE TO"

    - [ ] Analyze the AI Solution Architecture
    - [ ] Understand the AZD Deployment Workflow
    - [ ] Use GitHub Copilot to get help on AZD usage
    - [ ] **Lab 2:** AI Agents テンプレートをデプロイして検証する

---


## 1. Introduction

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) or `azd` は、アプリケーションを Azure に構築およびデプロイする際の開発者ワークフローを合理化するオープンソースのコマンドラインツールです。 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) は、サンプルアプリケーションコード、_infrastructure-as-code_ のアセット、および統合されたソリューションアーキテクチャのための `azd` 設定ファイルを含む標準化されたリポジトリです。インフラのプロビジョニングは `azd provision` コマンドを実行するだけで簡単に行え、`azd up` を使えばインフラのプロビジョニングとアプリケーションのデプロイを一度に行うことができます！

その結果、アプリケーション開発プロセスの立ち上げは、アプリケーションとインフラ要件に最も近い _AZD Starter template_ を見つけ、それをシナリオ要件に合わせてリポジトリをカスタマイズするだけで済む場合があります。

始める前に、Azure Developer CLI がインストールされていることを確認しましょう。

1. VS Code のターミナルを開き、次のコマンドを入力します：

      ```bash title="" linenums="0"
      azd version
      ```

1. 以下のような表示が出ます！

      ```bash title="" linenums="0"
      azd version 1.25.6 (commit <current-build>)
      ```

**これで azd を使ってテンプレートを選択およびデプロイする準備が整いました**

---

## 2. Template Selection

Microsoft Foundry プラットフォームには、[set of recommended AZD templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) が用意されており、_multi-agent workflow atomation_ や _multi-modal content processing_ といった人気のあるソリューションシナリオをカバーしています。これらのテンプレートは Microsoft Foundry ポータルでも確認できます。

1. Visit [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. プロンプトが表示されたら Microsoft Foundry ポータルにログインします - 次のような画面が表示されます。

![選択](../../../../../translated_images/ja/01-pick-template.60d2d5fff5ebc374.webp)


The **Basic** options are your starter templates:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) は、基本的なチャットアプリケーションを _with your data_ で Azure Container Apps にデプロイします。基本的な AI チャットボットのシナリオを探索するために使用してください。
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) は、Foundry Agents を使った標準的な AI エージェントもデプロイします。ツールやモデルを用いたエージェント型 AI ソリューションに慣れるために使ってください。

関連するカードの `Open in GitHub` をクリックするか、2つ目のリンクを新しいブラウザタブで開いてください。該当する AZD テンプレートのリポジトリが表示されます。README を少し確認してみましょう。アプリケーションのアーキテクチャは次のようになっています:

![アーキテクチャ](../../../../../translated_images/ja/architecture.8cec470ec15c65c7.webp)

---

## 3. Template Activation

このテンプレートをデプロイして有効であることを確認してみましょう。[Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) セクションのガイドラインに従います。

1. テンプレートリポジトリの作業環境を選択します:

      - **GitHub Codespaces**: Click [this link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) and confirm `Create codespace`
      - **Local clone or dev container**: Clone `Azure-Samples/get-started-with-ai-agents` and open it in VS Code

1. VS Code のターミナルが準備できるまで待ち、次のコマンドを入力します：

   ```bash title="" linenums="0"
   azd up
   ```

Complete the workflow steps that this will trigger:

1. プロンプトが表示されたら Azure にサインインします - 指示に従って認証してください
1. 一意の環境名を入力します - 例: 私は `nitya-mshack-azd` を使用しました
1. これにより `.azure/` フォルダーが作成されます - 環境名のサブフォルダーが表示されます
1. サブスクリプション名の選択を促されます - デフォルトを選択してください
1. ロケーションを尋ねられます - `East US 2` を使用してください

ここからはプロビジョニングが完了するまで待ちます。**これには 10～15 分かかります**

1. 完了すると、コンソールに次のような SUCCESS メッセージが表示されます:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. あなたの Azure ポータルには、その環境名のプロビジョニング済みリソースグループが表示されます：

      ![インフラ](../../../../../translated_images/ja/02-provisioned-infra.46c706b14f56e0bf.webp)

1. <strong>これでプロビジョニングされたインフラとアプリケーションを検証する準備が整いました</strong>。

---

## 4. Template Validation

1. Azure ポータルの [Resource Groups](https://portal.azure.com/#browse/resourcegroups) ページにアクセスします - プロンプトが表示されたらサインインします
1. 環境名の RG をクリックします - 上記のページが表示されます

      - Azure Container Apps リソースをクリックします
      - _Essentials_ セクション（右上）の Application Url をクリックします

1. 次のようなホストされたアプリケーションのフロントエンド UI が表示されるはずです：

   ![アプリ](../../../../../translated_images/ja/03-test-application.471910da12c3038e.webp)

1. [sample questions](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md) をいくつか試してみてください

      1. Ask: ```What is the capital of France?``` 
      1. Ask: ```What's the best tent under $200 for two people, and what features does it include?```

1. 以下のような回答が得られるはずです。_でも、これはどうやって動作しているのでしょうか？_ 

      ![アプリ](../../../../../translated_images/ja/03-test-question.521c1e863cbaddb6.webp)

---

## 5.  Agent Validation

Azure Container App は、このテンプレートの Microsoft Foundry プロジェクトでプロビジョニングされた AI エージェントに接続するエンドポイントをデプロイします。これが何を意味するのかを見てみましょう。

1. Azure ポータルのリソースグループの _Overview_ ページに戻ります

1. リスト内の `Microsoft Foundry` リソースをクリックします

1. 次の画面が表示されます。`Go to Microsoft Foundry Portal` ボタンをクリックしてください。 
   ![Foundry](../../../../../translated_images/ja/04-view-foundry-project.fb94ca41803f28f3.webp)

1. AI アプリケーションの Foundry プロジェクトページが表示されます
   ![Project](../../../../../translated_images/ja/05-visit-foundry-portal.d734e98135892d7e.webp)

1. `Agents` をクリックします - プロジェクトにプロビジョニングされたデフォルトのエージェントが表示されます
   ![Agents](../../../../../translated_images/ja/06-visit-agents.bccb263f77b00a09.webp)

1. 選択すると、エージェントの詳細が表示されます。以下に注意してください：

      - エージェントはデフォルトで File Search を使用します（常に）
      - エージェントの `Knowledge` は、32 ファイルがアップロードされていることを示しています（ファイル検索用）
      ![Agents](../../../../../translated_images/ja/07-view-agent-details.0e049f37f61eae62.webp)

1. 左メニューの `Data+indexes` オプションを探してクリックし、詳細を表示します。 

      - 知識用にアップロードされた 32 個のデータファイルが表示されるはずです。
      - これらは `src/files` の下にある 12 個の customer ファイルと 20 個の product ファイルに対応します
      ![Data](../../../../../translated_images/ja/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**エージェントの動作を検証しました！** 

1. エージェントの応答は、これらのファイル内の知識に基づいています。 
1. これで、そのデータに関連する質問をして、根拠のある応答を得ることができます。
1. 例: `customer_info_10.json` は "Amanda Perez" が行った 3 回の購入を記述しています

Container App のエンドポイントが開かれているブラウザタブに戻り、`What products does Amanda Perez own?` と尋ねてみてください。次のような表示が得られるはずです：

![Data](../../../../../translated_images/ja/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Microsoft Foundry の機能についてより直感的に理解するため、Agents Playground でエージェントを動かしてみましょう。 

1. Microsoft Foundry の `Agents` ページに戻り、デフォルトエージェントを選択します
1. `Try in Playground` オプションをクリックすると、次のような Playground UI が表示されます
1. 同じ質問をします: `What products does Amanda Perez own?`

    ![Data](../../../../../translated_images/ja/09-ask-in-playground.a1b93794f78fa676.webp)

同じ（または類似の）応答が得られますが、エージェント型アプリの品質、コスト、パフォーマンスを理解するために役立つ追加情報も得られます。例えば：

1. 応答が「根拠」として使用したデータファイルを引用していることに注意してください
1. これらのファイルラベルにカーソルを合わせると、データがあなたのクエリと表示された応答に一致しているか確認できますか？

応答の下に _stats_ 行も表示されます。 

1. 任意のメトリック（例: Safety）にカーソルを合わせてみてください。次のような表示が出ます
1. 評価された格付けは、応答の安全性レベルに対するあなたの直感と一致していますか？

      ![Data](../../../../../translated_images/ja/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Built-in Observability

Observability（可観測性）とは、アプリケーションの動作を理解、デバッグ、最適化するために使用できるデータを生成するようにアプリケーションに計装することです。これを把握するために次の操作を行ってください：

1. `View Run Info` ボタンをクリックします - このビューが表示されます。これは [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) の実例です。_このビューはトップレベルメニューの Thread Logs をクリックしても表示できます_。

   - 実行ステップとエージェントが使用したツールの概要を把握する
   - 応答に対するトークンの総数（と出力トークンの使用量）を理解する
   - レイテンシーと実行にどこで時間が費やされているかを理解する

      ![Agent](../../../../../translated_images/ja/10-view-run-info.b20ebd75fef6a1cc.webp)

1. `Metadata` タブをクリックして、後で問題をデバッグするための有用なコンテキストを提供する可能性のある追加属性を確認します。   

      ![Agent](../../../../../translated_images/ja/11-view-run-info-metadata.7966986122c7c2df.webp)


1. `Evaluations` タブをクリックして、エージェント応答に対して行われた自動評価を確認します。これには安全性評価（例: 自傷行為関連）やエージェント固有の評価（例: 意図の解決、タスクの順守）などが含まれます。

      ![Agent](../../../../../translated_images/ja/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. 最後に、サイドバーの `Monitoring` タブをクリックします。

      - 表示されたページで `Resource usage` タブを選択し、メトリクスを確認します。
      - コスト（トークン）と負荷（リクエスト）に関するアプリケーションの使用状況を追跡します。
      - 初バイト（入力処理）から最終バイト（出力）までのアプリケーションのレイテンシを追跡します。

      ![Agent](../../../../../translated_images/ja/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Environment Variables

ここまでブラウザでのデプロイ手順を通して、インフラがプロビジョニングされ、アプリケーションが動作していることを検証しました。しかし、コードファーストでアプリケーションを扱うには、これらのリソースと連携するためにローカル開発環境に関連する変数を設定する必要があります。`azd` を使うと簡単です。

1. Azure Developer CLI は、アプリケーションのデプロイ設定を格納および管理するために [environment variables を使用します](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash)。

1. 環境変数は `.azure/<env-name>/.env` に保存されます - これはデプロイ時に使用された `env-name` 環境にスコープされ、同じリポジトリ内で異なるデプロイターゲット間の環境を分離するのに役立ちます。

1. 環境変数は、`azd` が特定のコマンド（例: `azd up`）を実行する際に自動的に読み込まれます。`azd` は OS レベルの環境変数（例: シェルで設定されたもの）を自動的に読み取るわけではない点に注意してください - スクリプト内で情報を渡すには `azd set env` と `azd get env` を使用します。


いくつかのコマンドを試してみましょう:

1. この環境で `azd` に設定されているすべての環境変数を取得します:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      次のような表示が出ます:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. 特定の値を取得します - 例: `AZURE_AI_AGENT_MODEL_NAME` の値が設定されているか確認したい

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      次のような表示が出ます - デフォルトでは設定されていませんでした！

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. `azd` の新しい環境変数を設定します。ここではエージェントのモデル名を更新します。_注意: 変更は `.azure/<env-name>/.env` ファイルに即座に反映されます。_

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      これで値が設定されているはずです:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. 一部のリソースは永続的です（例: モデルのデプロイ）ので、再デプロイを強制するには単なる `azd up` 以上の操作が必要になることに注意してください。元のデプロイを停止して、変更した環境変数で再デプロイしてみましょう。

1. **Refresh** If you had previously deployed infrastructure using an azd template - you can _refresh_ the state of your local environment variables based on the current state of your Azure deployment using this command:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      これは、2つ以上のローカル開発環境（例：複数の開発者がいるチーム）間で環境変数を _同期_ する強力な方法であり、デプロイされたインフラストラクチャを環境変数の状態の基準として扱うことができます。チームメンバーは単に変数を _更新_ するだけで再同期できます。

---

## 9. おめでとうございます 🏆

You just completed an end-to-end workflow where you:

- [X] 使用したい AZD テンプレートを選択しました
- [X] サポートされている開発環境でテンプレートを開きました
- [X] テンプレートをデプロイし、動作することを確認しました

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->