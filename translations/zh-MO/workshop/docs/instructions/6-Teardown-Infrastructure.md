# 6. 清除基礎設施

!!! tip "在本模組結束時您將能夠"

    - [ ] 了解資源清理與成本管理的重要性
    - [ ] 使用 `azd down` 安全地解除佈署基礎設施
    - [ ] 如有需要，還原已軟刪除的 Azure AI Services
    - [ ] **實作 6：** 清理 Azure 資源並驗證移除

---

## 額外練習

在我們拆除專案之前，花幾分鐘做一些開放式探索。

!!! info "試試這些探索提示"

    **使用 GitHub Copilot 做實驗：**
    
    1. 問：`What other AZD templates could I try for multi-agent scenarios?`
    2. 問：`How can I customize the agent instructions for a healthcare use case?`
    3. 問：`What environment variables control cost optimization?`
    
    **探索 Azure 入口網站：**
    
    1. 檢視您佈署的 Application Insights 指標
    2. 檢查已佈署資源的成本分析
    3. 再次探索 Microsoft Foundry portal agent playground

---

## 解除佈署基礎設施

1. 拆除基礎設施非常簡單：
      
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

1. (可選) 如果您現在再次執行 `azd up`，您會注意到 gpt-4.1 模型會被佈署，因為環境變數已在本機 `.azure` 資料夾中被變更（並儲存）。 

      這是模型部署的<strong>之前</strong>：

      ![初始](../../../../../translated_images/zh-MO/14-deploy-initial.30e4cf1c29b587bc.webp)

      而這是<strong>之後</strong>：
      ![新的](../../../../../translated_images/zh-MO/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->