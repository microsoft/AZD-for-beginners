# 6. インフラストラクチャの解体

!!! tip "このモジュールの終わりには以下のことができるようになります"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## 追加演習

プロジェクトを解体する前に、数分間を使って自由形式の探索をしてみましょう。

!!! info "これらの探索プロンプトを試してください"

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

!!! warning "もしGAホステッドエージェントの演習も完了しているなら"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. インフラの解体は次のように簡単です:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. 選択した環境を確認し、削除されるリソースをレビューします。これはAzureリソースを削除し、データを破壊する可能性があります。この学習ワークフローでは確認プロンプトを維持してください。完了すると次のような出力が表示されます：
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. ポータルで削除を確認し、デプロイメントのスコープ外のリソースもチェックします。コストレポートや割り当ての更新には遅延が生じることがあります。ローカルの`.azure`設定は明示的に削除しない限り残ります。

1. `azd down --purge` は、対応しているソフト削除リソースの恒久的な削除も要求します。復旧が不要で、保持・パージ保護ポリシーを理解している場合にのみ使用してください。即時の割り当て解放は保証されません。

1. クリーンアップ確認のためだけに再デプロイしないでください。後で意図的に `azd up` を行うことで、残っているローカルの入力を使ってリソースを再作成でき、再度料金が発生します。モデルの更新は通常、対応可能なプロビジョニング変更で行われ、解体ではありません。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->