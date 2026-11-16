# 6. 拆除基礎架構

!!! tip "在本模組結束時，您將能夠"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## 額外練習

在拆除專案之前，花幾分鐘進行一些開放式探索。

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

## 解除基礎架構配置

1. 拆除基礎架構很簡單：
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. 確認所選環境並檢查要刪除的資源。這會移除 Azure 資源並可能破壞資料。請保留此學習工作流程中的確認提示。完成後您將看到類似的輸出：
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. 在入口網站中驗證刪除狀態，並檢查部署範圍外的資源。成本報告和配額更新可能會延遲。本地 `.azure` 配置會保留，除非您明確移除它。

1. `azd down --purge` 另外會請求永久刪除支援的軟刪除資源。只有在不需要回復且理解保留/清除保護政策時才使用。它不保證立即釋放配額。

1. 不要為了確認清理而重部署。稍後有意的 `azd up` 可以使用剩餘的本地輸入重新建立資源，且會再次產生費用。模型更新通常使用支援的配置變更，而非拆除。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->