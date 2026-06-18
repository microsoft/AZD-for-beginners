# 6. インフラストラクチャの撤去

!!! tip "このモジュールの終了時には次のことができるようになります"

    - [ ] リソースのクリーンアップとコスト管理の重要性を理解する
    - [ ] インフラを安全に解除するために `azd down` を使用する
    - [ ] 必要に応じてソフト削除された Azure AI サービスを復元する
    - [ ] **Lab 6:** Azure リソースをクリーンアップして削除を確認する

---

## ボーナス演習

Before we tear down the project, take a few minutes to do some open-ended exploration.

!!! info "これらの探索プロンプトを試す"

    **GitHub Copilot を使った実験：**
    
    1. 尋ねる： `マルチエージェントのシナリオに試せる他の AZD テンプレートは何ですか？`
    2. 尋ねる： `医療ユースケース向けにエージェントの指示をどうカスタマイズできますか？`
    3. 尋ねる： `コスト最適化を制御する環境変数はどれですか？`
    
    **Azure ポータルの探索：**
    
    1. デプロイのための Application Insights のメトリクスを確認する
    2. プロビジョニングされたリソースのコスト分析を確認する
    3. Microsoft Foundry ポータルのエージェントプレイグラウンドをもう一度探検する

---

## インフラの解除

1. インフラの撤去は次のように簡単です：
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. The `--purge` flag ensures that it also purges soft-deleted Cognitive Service resources, thereby releasing quota held by these resources. Once complete you will see something like this:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (任意) もし今 `azd up` を再実行すると、環境変数がローカルの `.azure` フォルダで変更（および保存）されたため、gpt-4.1 モデルがデプロイされるのがわかります。 

      ここにモデルのデプロイ（<strong>変更前</strong>）があります：

      ![変更前](../../../../../translated_images/ja/14-deploy-initial.30e4cf1c29b587bc.webp)

      そしてこちらが<strong>変更後</strong>です：
      ![変更後](../../../../../translated_images/ja/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->