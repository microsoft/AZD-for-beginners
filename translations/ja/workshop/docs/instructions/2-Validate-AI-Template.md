# 2. テンプレートの検証

> 2026年7月に `azd 1.27.1` で検証済み。

!!! tip "このモジュールを終える頃には、以下ができるようになります"

    - [ ] AIソリューションアーキテクチャの分析
    - [ ] AZDのデプロイメントワークフローの理解
    - [ ] GitHub Copilotを使ってAZDの利用に関するサポートを得る
    - [ ] **ラボ 2:** AI Agents テンプレートのデプロイおよび検証

---


## 1. はじめに

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)（通称 `azd`）は、Azureへアプリケーションを構築・デプロイする際の開発者のワークフローを効率化するオープンソースのコマンドラインツールです。

[AZDテンプレート](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates)は、サンプルアプリケーションコード、インフラコード資産、`azd`の設定ファイルを含む標準化されたリポジトリで、統合されたソリューションアーキテクチャを提供します。インフラのプロビジョニングは `azd provision` コマンド一つで完了し、`azd up` コマンドを使えばインフラのプロビジョニングとアプリケーションのデプロイを同時に行うことができます！

そのため、アプリケーションとインフラの要件に最も近いAZDスターターテンプレートを見つけ、それをシナリオに合わせてカスタマイズするだけで、アプリ開発プロセスをすぐに始めることができます。

まずはAzure Developer CLIがインストールされていることを確認しましょう。

1. VS Codeのターミナルを開き、次のコマンドを入力します：

      ```bash title="" linenums="0"
      azd version
      ```

1. このような出力が表示されるはずです！

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**これで azd を使ってテンプレートを選択しデプロイする準備が整いました**

---

## 2. テンプレートの選択

Microsoft Foundryプラットフォームには、[推奨AZDテンプレートのセット](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)が用意されており、マルチエージェントワークフローの自動化やマルチモーダルコンテンツ処理などの人気ソリューションシナリオをカバーしています。Microsoft Foundryポータルからもこれらのテンプレートを探せます。

1. [https://ai.azure.com/templates](https://ai.azure.com/templates) にアクセス
1. プロンプトが表示されたらMicrosoft Foundryポータルにログインします。以下のような画面が表示されます。

![Pick](../../../../../translated_images/ja/01-pick-template.60d2d5fff5ebc374.webp)


**Basic** オプションはスターターテンプレートです：

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) は、基本的なチャットアプリケーションをデータ付きで Azure Container Apps にデプロイします。基本的なAIチャットボットシナリオを試せます。
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) は、Foundry Agentsを含む標準AIエージェントもデプロイします。ツールやモデルを使ったエージェントAIソリューションに慣れるのに使います。

2つめのリンクを新しいブラウザタブで開くか、カードの `Open in GitHub` をクリックします。このAZDテンプレートのリポジトリが表示されるので、READMEを一通り見てみましょう。アプリケーションアーキテクチャは以下のようになっています：

![Arch](../../../../../translated_images/ja/architecture.8cec470ec15c65c7.webp)

---

## 3. テンプレートのアクティベーション

このテンプレートをデプロイして、正しく動作するか検証してみます。[Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) セクションのガイドラインに従います。

1. テンプレートリポジトリの作業環境を選びます：

      - **GitHub Codespaces**: [こちらのリンク](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) をクリックし、`Create codespace` を確認
      - <strong>ローカルクローンまたは開発コンテナ</strong>: `Azure-Samples/get-started-with-ai-agents` をクローンし、VS Codeで開く

1. VS Codeのターミナルが準備できたら、次のコマンドを入力します：

   ```bash title="" linenums="0"
   azd up
   ```

このコマンドで以下のワークフローステップが開始されます：

1. Azureへのログインを促されるので認証を行う
1. 一意の環境名を入力する（例：私は `nitya-mshack-azd` を使いました）
1. `.azure/` フォルダが作成され、環境名のサブフォルダができます
1. サブスクリプション名の選択を求められるのでデフォルトを選択
1. ロケーションの選択が促されるので `East US 2` を指定

プロビジョニングが完了するまで待ちましょう。**10～15分かかります**

1. 完了するとコンソールに成功メッセージが表示されます：
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Azureポータルに環境名のリソースグループが作成されます：

      ![Infra](../../../../../translated_images/ja/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **これでデプロイされたインフラとアプリケーションの検証が可能になりました。**

---

## 4. テンプレートの検証

1. Azureポータルの[リソースグループ](https://portal.azure.com/#browse/resourcegroups)ページにアクセスし、プロンプトに従いログインします
1. 環境名のRGをクリックし、上記のページを表示

      - Azure Container Appsのリソースをクリック
      - _Essentials_ セクション（右上）にあるアプリケーションURLをクリック

1. ホストされているアプリケーションのフロントエンドUIが表示されます：

   ![App](../../../../../translated_images/ja/03-test-application.471910da12c3038e.webp)

1. [サンプル質問](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)をいくつか試してください

      1. 質問例：```フランスの首都はどこですか？``` 
      1. 質問例：```2人用で200ドル以下のおすすめのテントは何で、その特徴は何ですか？```

1. 以下のような回答が得られるはずです。_しかし、これはどう動いているのか？_ 

      ![App](../../../../../translated_images/ja/03-test-question.521c1e863cbaddb6.webp)

---

## 5. エージェントの検証

Azure Container Appは、このテンプレートのMicrosoft FoundryプロジェクトでプロビジョニングされたAIエージェントに接続するエンドポイントをデプロイします。内容を確認しましょう。

1. Azureポータルでリソースグループの_概要_ページに戻る

1. リスト内の `Microsoft Foundry` リソースをクリック

1. この画面が表示されます。`Go to Microsoft Foundry Portal` ボタンをクリックします。 
   ![Foundry](../../../../../translated_images/ja/04-view-foundry-project.fb94ca41803f28f3.webp)

1. AIアプリケーションのFoundryプロジェクトページが表示されます
   ![Project](../../../../../translated_images/ja/05-visit-foundry-portal.d734e98135892d7e.webp)

1. `Agents` をクリックすると、プロジェクトに標準的にプロビジョニングされたエージェントが見えます
   ![Agents](../../../../../translated_images/ja/06-visit-agents.bccb263f77b00a09.webp)

1. 選択するとエージェントの詳細が表示されます。以下の点に注目してください：

      - エージェントはデフォルトでFile Searchを使用しています（常に）
      - エージェントの `Knowledge` には32のファイルがアップロードされていることが示されています（ファイル検索用）
      ![Agents](../../../../../translated_images/ja/07-view-agent-details.0e049f37f61eae62.webp)

1. 左のメニューの `Data+indexes` オプションをクリックして詳細を確認します。 

      - 32のデータファイルがナレッジ用にアップロードされています
      - これらは `src/files` 配下の12の顧客ファイルと20の製品ファイルに対応しています
      ![Data](../../../../../translated_images/ja/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**これでエージェントの動作を検証しました！** 

1. エージェントの回答はこれらファイルのナレッジに基づいています。 
1. これでそのデータに関連する質問をし、確かな回答が得られます。
1. 例：`customer_info_10.json` は "Amanda Perez" がした3件の購入を記述しています。

Container Appのエンドポイントが開かれているブラウザタブに戻って、`Amanda Perezはどんな製品を所有していますか？` と質問してください。以下のような表示がされるはずです：

![Data](../../../../../translated_images/ja/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. エージェントプレイグラウンド

Microsoft Foundryの機能をより直感的に理解するために、Agents Playgroundでこのエージェントを試してみましょう。 

1. Microsoft Foundryの `Agents` ページに戻り、デフォルトエージェントを選択
1. `Try in Playground` オプションをクリックすると、以下のようなプレイグラウンドUIが表示されます
1. 同じ質問をしてみましょう：`Amanda Perezはどんな製品を所有していますか？`

    ![Data](../../../../../translated_images/ja/09-ask-in-playground.a1b93794f78fa676.webp)

同じ（または類似の）回答が得られますが、加えてエージェントアプリの品質、コスト、パフォーマンスを理解するための追加情報も得られます。例として：

1. 回答はどのデータファイルを“根拠”として使ったかを示しています
1. 各ファイルラベルにマウスをホバーさせて、データが質問及び回答表示と一致しているか確認してください

レスポンスの下に _stats_ 行も表示されています。 

1. 任意の指標にホバーします—例えばSafety。以下のように表示されます
1. その評価が回答の安全性に対する直感と合っているかどうか確認してください

      ![Data](../../../../../translated_images/ja/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. 組み込みのオブザーバビリティ

オブザーバビリティは、アプリケーションにインストルメンテーションを入れて、動作を理解・デバッグ・最適化するためのデータを生成することに関わります。以下を見てみましょう：

1. `View Run Info` ボタンをクリックするとこのビューが表示されます。これは[Agentトレース](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground)の例です。_トップレベルメニューの Thread Logs をクリックしてもこのビューが表示されます_。

   - 実行ステップとエージェントが使用したツールを把握
   - 回答に使われたトークン総数（出力トークン使用量との比較）を理解
   - レイテンシやどこに時間がかかっているかを把握

      ![Agent](../../../../../translated_images/ja/10-view-run-info.b20ebd75fef6a1cc.webp)

1. `Metadata`タブをクリックすると、デバッグに役立つ追加の実行属性が表示されます。   

      ![Agent](../../../../../translated_images/ja/11-view-run-info-metadata.7966986122c7c2df.webp)


1. `Evaluations` タブをクリックするとエージェント回答に対する自動評価が見られます。安全性評価（例：自傷行為）やエージェント固有評価（例：意図の解決、タスク遵守）が含まれます。

      ![Agent](../../../../../translated_images/ja/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. 最後に、サイドバーメニューの `Monitoring` タブをクリックします。

      - 表示されたページで `Resource usage` タブを選択し、メトリクスを確認
      - コスト（トークン数）や負荷（リクエスト数）の観点でアプリ使用状況を追跡
      - 初バイト（入力処理）および最終バイト（出力）へのレイテンシを追跡

      ![Agent](../../../../../translated_images/ja/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. 環境変数

ここまで、ブラウザ上でデプロイを進め、インフラがプロビジョニングされアプリが動作していることを確認しました。しかし、アプリケーションをコードベースで扱うには、これらリソースと連携するための環境変数をローカル開発環境に設定する必要があります。`azd` を使うと簡単です。

1. Azure Developer CLIは[環境変数](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash)を使って、アプリケーションのデプロイ設定を保存・管理します。

1. 環境変数は `.azure/<env-name>/.env` に保存され、デプロイ時に指定された `env-name` 環境にスコープされるため、同じリポジトリ内でも異なるデプロイ先間で環境を分離できます。

1. 環境変数は `azd` コマンド実行時に自動的に読み込まれます（例：`azd up`）。ただし、OSレベルの環境変数（シェルに設定されたものなど）は自動的には読み込まれません。代わりにスクリプト内で `azd set env` と `azd get env` を使って情報をやり取りしてください。


いくつかコマンドを試してみましょう：

1. この環境で `azd` に設定されているすべての環境変数を取得するコマンド：

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      以下のように表示されます：

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. 特定の値を取得します。例えば、`AZURE_AI_AGENT_MODEL_NAME` の値が設定されているか知りたい場合：

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      以下のように表示されます—デフォルトでは設定されていませんでした！

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. `azd` の環境変数を新たに設定します。ここではエージェントモデル名を更新します。_注意：変更は `.azure/<env-name>/.env` ファイルに即座に反映されます。_

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      値が設定されたことを確認しましょう：

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. 一部リソース（例：モデルデプロイメント）は永続的なので、単に `azd up` するだけでは再デプロイされません。元のデプロイを削除してから環境変数を変更した状態で再デプロイすることを試みましょう。

1. <strong>リフレッシュ</strong> 以前にazdテンプレートでインフラをデプロイ済みの場合、このコマンドで現在のAzureデプロイ状況に応じてローカル環境変数の状態をリフレッシュできます：

      ```bash title="" linenums="0"
      azd env refresh
      ```


      これは、2つ以上のローカル開発環境（例：複数の開発者がいるチーム）で環境変数を同期させる強力な方法です。デプロイされたインフラストラクチャが環境変数の状態の真実の基準として機能します。チームメンバーは単に変数をリフレッシュして同期を取り戻します。

---

## 9. おめでとうございます 🏆

あなたは次のエンドツーエンドのワークフローを完了しました：

- [X] 使用するAZDテンプレートを選択しました
- [X] サポートされている開発環境でテンプレートを開きました
- [X] テンプレートをデプロイし、動作を確認しました

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->