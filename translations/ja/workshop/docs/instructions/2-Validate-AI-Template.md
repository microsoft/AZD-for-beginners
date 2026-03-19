# 2. テンプレートの検証

!!! tip "このモジュールの終了時点で次のことができるようになります"

    - [ ] AI ソリューション アーキテクチャを分析する
    - [ ] AZD デプロイ ワークフローを理解する
    - [ ] GitHub Copilot を使用して AZD の使い方を支援してもらう
    - [ ] **ラボ 2:** AI Agents テンプレートをデプロイして検証する

---


## 1. はじめに

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) または `azd` は、Azure にアプリケーションを構築およびデプロイする際の開発者ワークフローを効率化するオープンソースのコマンドラインツールです。 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) は、サンプルアプリケーションコード、_インフラストラクチャーをコードで管理する_ 資産、および `azd` 構成ファイルを含む標準化されたリポジトリで、一貫したソリューション アーキテクチャを提供します。インフラのプロビジョニングは `azd provision` コマンドを実行するだけで済み、`azd up` を使用すればインフラのプロビジョニングとアプリケーションのデプロイを一度に実行できます！

その結果、アプリケーション開発の立ち上げは、アプリケーションとインフラのニーズに最も近い _AZD スターター テンプレート_ を見つけ、リポジトリをシナリオ要件に合わせてカスタマイズするだけで済む場合があります。

始める前に、Azure Developer CLI がインストールされていることを確認しましょう。

1. VS Code のターミナルを開き、次のコマンドを入力します:

      ```bash title="" linenums="0"
      azd version
      ```

1. 次のような表示が出るはずです！

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**これで azd を使ってテンプレートを選択およびデプロイする準備ができました**

---

## 2. テンプレートの選択

Microsoft Foundry プラットフォームには、_マルチエージェントワークフローの自動化_ や _マルチモーダルコンテンツ処理_ のような一般的なソリューション シナリオをカバーする [推奨される AZD テンプレートのセット](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) が用意されています。これらのテンプレートは Microsoft Foundry ポータルからも見つけることができます。

1. Visit [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. プロンプトが表示されたら Microsoft Foundry ポータルにログインします - 次のような画面が表示されます。

![選択](../../../../../translated_images/ja/01-pick-template.60d2d5fff5ebc374.webp)


「**Basic**」オプションはスターターテンプレートです:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) は、基本的なチャットアプリケーションを _あなたのデータとともに_ Azure Container Apps にデプロイします。基本的な AI チャットボットのシナリオを検討するために使用してください。
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) は、標準の AI エージェント（Foundry Agents を使用）をデプロイします。ツールやモデルを含むエージェント型 AI ソリューションに慣れるために使用してください。

新しいブラウザー タブで 2 番目のリンクを開く（または関連カードの `Open in GitHub` をクリック）してください。AZD テンプレートのリポジトリが表示されるはずです。README を少し確認してみてください。アプリケーションのアーキテクチャは次のようになっています:

![アーキテクチャ](../../../../../translated_images/ja/architecture.8cec470ec15c65c7.webp)

---

## 3. テンプレートの有効化

このテンプレートをデプロイして有効であることを確認してみましょう。[Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) セクションのガイドラインに従います。

1. [このリンク](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) をクリックし、デフォルトのアクションである `Create codespace` を確認します
1. 新しいブラウザー タブが開きます - GitHub Codespaces セッションの読み込みが完了するまで待ちます
1. Codespaces の VS Code ターミナルを開き、次のコマンドを入力します:

   ```bash title="" linenums="0"
   azd up
   ```

Complete the workflow steps that this will trigger:

1. プロンプトが表示されたら Azure にログインしてください - 認証手順に従います
1. あなた専用の一意の環境名を入力します - 例: 私は `nitya-mshack-azd` を使いました
1. これにより  `.azure/` フォルダーが作成されます - env 名のサブフォルダーが表示されます
1. サブスクリプション名の選択を求められます - デフォルトを選択してください
1. ロケーションを求められます - `East US 2` を使用してください

これでプロビジョニングが完了するまで待ちます。**所要時間は 10～15 分です**

1. 完了すると、コンソールに次のような SUCCESS メッセージが表示されます:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Your Azure Portal will now have a provisioned resource group with that env name:

      ![インフラ](../../../../../translated_images/ja/02-provisioned-infra.46c706b14f56e0bf.webp)

1. <strong>これでプロビジョニングされたインフラストラクチャとアプリケーションを検証する準備が整いました</strong>。

---

## 4. テンプレートの検証

1. Azure Portal の [リソース グループ](https://portal.azure.com/#browse/resourcegroups) ページにアクセスします - プロンプトが表示されたらログインしてください
1. 環境名の RG をクリックします - 上記のページが表示されます

      - Azure Container Apps リソースをクリックします
      - _重要事項 (Essentials)_ セクション（右上）にある Application Url をクリックします

1. 次のようなホストされたアプリケーションのフロントエンド UI が表示されるはずです:

   ![アプリ](../../../../../translated_images/ja/03-test-application.471910da12c3038e.webp)

1. [サンプル質問](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md) をいくつか試してみてください

      1. 質問: ```What is the capital of France?``` 
      1. 質問: ```What's the best tent under $200 for two people, and what features does it include?```

1. 下に示すのと同様の回答が得られるはずです。_しかし、これはどのように動作しているのでしょうか?_ 

      ![アプリ](../../../../../translated_images/ja/03-test-question.521c1e863cbaddb6.webp)

---

## 5.  エージェントの検証

Azure Container App は、このテンプレートの Microsoft Foundry プロジェクトでプロビジョニングされた AI エージェントに接続するエンドポイントをデプロイします。これが何を意味するか見てみましょう。

1. Azure ポータルでリソース グループの _概要 (Overview)_ ページに戻ります

1. リスト内の `Microsoft Foundry` リソースをクリックします

1. 次の画面が表示されます。`Go to Microsoft Foundry Portal` ボタンをクリックしてください。
   ![Foundry](../../../../../translated_images/ja/04-view-foundry-project.fb94ca41803f28f3.webp)

1. AI アプリケーション用の Foundry プロジェクト ページが表示されます
   ![Project](../../../../../translated_images/ja/05-visit-foundry-portal.d734e98135892d7e.webp)

1. `Agents` をクリックすると、プロジェクトにプロビジョニングされたデフォルトのエージェントが表示されます
   ![Agents](../../../../../translated_images/ja/06-visit-agents.bccb263f77b00a09.webp)

1. それを選択すると、エージェントの詳細が表示されます。次の点に注意してください:

      - エージェントはデフォルトで File Search を使用します（常に）
      - エージェントの `Knowledge` は、32 個のファイルがアップロードされていることを示しています（ファイル検索用）
      ![Agents](../../../../../translated_images/ja/07-view-agent-details.0e049f37f61eae62.webp)

1. 左側のメニューにある `Data+indexes` オプションを探してクリックし、詳細を表示します。 

      - ここに知識用にアップロードされた 32 個のデータファイルが表示されるはずです。
      - これらは `src/files` の下にある 12 個の顧客ファイルと 20 個の製品ファイルに対応します
      ![Data](../../../../../translated_images/ja/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**エージェントの動作を検証しました！** 

1. エージェントの応答はこれらのファイルにあるナレッジに基づいています。 
1. これらのデータに関連する質問をして、根拠のある応答を得ることができます。
1. 例: `customer_info_10.json` は "Amanda Perez" が行った 3 回の購入を記述しています

Container App のエンドポイントが開いているブラウザー タブに戻り、次を尋ねてみてください: `What products does Amanda Perez own?`。次のような表示が得られるはずです:

![データ](../../../../../translated_images/ja/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. エージェント プレイグラウンド

Microsoft Foundry の機能をもう少し直感的に理解するために、エージェントを Agents Playground で試してみましょう。 

1. Microsoft Foundry の `Agents` ページに戻り、デフォルトのエージェントを選択します
1. `Try in Playground` オプションをクリックすると、次のような Playground UI が表示されます
1. 同じ質問をしてみてください: `What products does Amanda Perez own?`

    ![データ](../../../../../translated_images/ja/09-ask-in-playground.a1b93794f78fa676.webp)

同じ（または類似の）応答が得られますが、エージェント型アプリの品質、コスト、パフォーマンスを理解するのに役立つ追加情報も得られます。例えば:

1. 応答で参照されているデータファイルが、応答の「根拠」を示していることに注意してください
1. これらのファイルラベルにマウスを合わせると、データがあなたのクエリと表示された応答に一致しているか確認できますか？

応答の下に _stats_ 行が表示されます。 

1. 任意のメトリックにマウスを合わせてみてください - 例: Safety。次のような表示になります
1. 評価されたレーティングは、応答の安全性レベルに対するあなたの直感と一致しますか？

      ![データ](../../../../../translated_images/ja/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. 組み込みの可観測性

可観測性は、アプリケーションに計測を組み込み、運用を理解、デバッグ、最適化するために使用できるデータを生成することに関するものです。これを把握するために:

1. `View Run Info` ボタンをクリックします - 次のビューが表示されるはずです。これは [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) の実例です。_このビューはトップレベルメニューの Thread Logs をクリックしても取得できます_。

   - 実行ステップとエージェントが使用したツールの概要を把握する
   - 応答の合計トークン数（出力トークン使用量との比較）を理解する
   - レイテンシと実行時にどこで時間が使われているかを理解する

      ![エージェント](../../../../../translated_images/ja/10-view-run-info.b20ebd75fef6a1cc.webp)

1. `Metadata` タブをクリックして、後で問題をデバッグする際に役立つ追加の属性を確認します。   

      ![エージェント](../../../../../translated_images/ja/11-view-run-info-metadata.7966986122c7c2df.webp)


1. `Evaluations` タブをクリックして、エージェント応答に対する自動評価を確認します。これには安全性評価（例: Self-harm）やエージェント固有の評価（例: 意図の解決、タスク遵守）などが含まれます。

      ![エージェント](../../../../../translated_images/ja/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. 最後に、サイドバー メニューの `Monitoring` タブをクリックします。

      - 表示されたページで `Resource usage` タブを選択し、メトリクスを表示します。
      - コスト（トークン）や負荷（リクエスト）の観点でアプリケーションの使用状況を追跡します。
      - 先頭バイト（入力処理）から最後のバイト（出力）までのアプリケーションのレイテンシを追跡します。

      ![エージェント](../../../../../translated_images/ja/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. 環境変数

これまでブラウザー上でのデプロイ手順を確認し、インフラがプロビジョニングされアプリケーションが動作していることを検証しました。しかし、アプリケーションをコードベースで操作するには、これらのリソースと連携するために必要な変数でローカル開発環境を設定する必要があります。`azd` を使うと簡単です。

1. Azure Developer CLI はデプロイ構成設定を保存および管理するために [環境変数を使用します](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash)。

1. 環境変数は `.azure/<env-name>/.env` に保存されます - これはデプロイ時に使用した `env-name` 環境にスコープされ、同じリポジトリ内の異なるデプロイ先間で環境を分離するのに役立ちます。

1. 環境変数は特定のコマンド（例: `azd up`）を実行するたびに `azd` コマンドによって自動的に読み込まれます。`azd` は OS レベルの環境変数（例: シェルで設定したもの）を自動的に読み込むわけではないことに注意してください - 代わりにスクリプト内で情報を転送するには `azd set env` と `azd get env` を使用してください。


いくつかのコマンドを試してみましょう:

1. この環境で `azd` に設定されているすべての環境変数を取得します:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      次のような表示が得られます:

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
      
      次のような表示になるはずです - デフォルトでは設定されていませんでした!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. `azd` のために新しい環境変数を設定します。ここではエージェントのモデル名を更新します。_注: 行った変更は `.azure/<env-name>/.env` ファイルに直ちに反映されます。_

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      これで値が設定されているはずです:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. 一部のリソース（例: モデルのデプロイ）は永続的であり、再デプロイを強制するには単に `azd up` 以上の作業が必要になることに注意してください。元のデプロイを破棄して、変更した環境変数で再デプロイしてみましょう。

1. **Refresh** 以前に azd テンプレートを使用してインフラをデプロイしている場合、次のコマンドを使用して Azure の現在の状態に基づいてローカルの環境変数の状態を _refresh_ できます:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      これは、2つ以上のローカル開発環境（例: 複数の開発者がいるチーム）間で環境変数を_同期_する強力な方法 - デプロイされたインフラストラクチャを環境変数の状態の基準として使用できるようにします。チームメンバーは単に変数を_更新_して同期を取り戻します。

---

## 9. おめでとうございます 🏆

以下のエンドツーエンドのワークフローを完了しました:

- [X] 使用したい AZD テンプレートを選択しました
- [X] GitHub Codespaces でテンプレートを起動しました 
- [X] テンプレートをデプロイし、正常に動作することを確認しました

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:
この文書は、AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を用いて翻訳されました。正確性には努めておりますが、自動翻訳には誤りや不正確な点が含まれる可能性があることにご留意ください。原文（原語）の文書が権威ある情報源と見なされるべきです。重要な情報については、専門の人間による翻訳をお勧めします。本翻訳の使用に起因して生じたいかなる誤解や解釈の相違についても、当方は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->