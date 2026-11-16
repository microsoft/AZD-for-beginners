# 6. インフラの解体

!!! tip "このモジュールの終了時には以下ができるようになります"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## ボーナス演習

プロジェクトを解体する前に、数分間かけてオープンエンドな探索をしてみましょう。

!!! info "これらの探索用の問いかけを試してみてください"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## インフラの解放

1. インフラを解体するのは簡単です:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. 選択された環境を確認し、削除されるリソースを見直します。これによりAzureリソースが削除され、データが消失する可能性があります。この学習ワークフローでは確認プロンプトを維持してください。完了すると次のような出力が表示されます:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. ポータルで削除を確認し、デプロイメントの範囲外のリソースがないかチェックします。コスト報告やクォータの更新には遅延があります。ローカルの`.azure`設定は明示的に削除しない限り残ります。

1. `azd down --purge` はサポートされているソフト削除されたリソースの永久削除も要求します。リカバリが不要で、保持・削除保護ポリシーを理解している場合のみ使ってください。即時クォータ解放を保証するわけではありません。

1. クリーンアップを確認するためだけに再デプロイしないでください。後から意図的に`azd up`を実行すれば、残っているローカルの入力を使ってリソースを再作成できますが、再び料金が発生します。モデルの更新は通常、解体ではなくサポートされたプロビジョニング変更を使用します。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->