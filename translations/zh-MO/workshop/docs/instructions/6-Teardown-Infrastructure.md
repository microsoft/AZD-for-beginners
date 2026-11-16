# 6. 拆除基建

!!! tip "完成本單元後你將能夠"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## 額外練習

在拆除項目之前，花幾分鐘做一些開放式探索。

!!! info "嘗試這些探索提示"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## 拆除基建

1. 拆除基建很簡單，只要：
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. 確認選擇的環境並檢視將刪除的資源。這會移除 Azure 資源並可能刪除數據。保留此學習工作流程的確認提示。完成後你將看到類似輸出：
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. 在入口網站中驗證刪除，並檢查部署範圍外的資源。成本報告和配額更新可能延遲。除非你明確移除，否則本地 `.azure` 配置將保留。

1. `azd down --purge` 會額外請求永久刪除支持的軟刪除資源。只有在不需要恢復且了解保留／清除保護政策時使用。它不保證立即釋放配額。

1. 不要為了驗證清理而重新部署。之後故意的 `azd up` 可以透過剩餘的本地輸入重新建立資源，並再次產生費用。模型更新通常使用受支持的佈建變更，而非拆除。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->