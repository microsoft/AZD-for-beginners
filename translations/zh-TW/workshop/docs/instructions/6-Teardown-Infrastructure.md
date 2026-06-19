# 6. Teardown Infrastructure

!!! tip "在本模組結束時，您將能夠"

    - [ ] 理解資源清理與成本管理的重要性
    - [ ] 使用 `azd down` 安全地解除配置基礎設施
    - [ ] 在需要時復原已軟刪除的 Azure AI Services
    - [ ] **實驗 6：** 清理 Azure 資源並驗證已移除

---

## Bonus Exercises

在我們拆除專案之前，花幾分鐘進行一些開放式探索。

!!! info "試試這些探索提示"

    **嘗試使用 GitHub Copilot：**
    
    1. 詢問：`我還可以嘗試哪些 AZD 範本來處理多代理情境？`
    2. 詢問：`我如何為醫療保健使用案例自訂代理指令？`
    3. 詢問：`哪些環境變數會控制成本最佳化？`
    
    **探索 Azure 入口網站：**
    
    1. 檢視部署的 Application Insights 指標
    2. 檢查已佈建資源的成本分析
    3. 再次探索 Microsoft Foundry 入口網站的代理人遊樂場

---

## Deprovision Infra

1. 拆除基礎架構非常簡單：
      
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

1. (可選) 如果您現在再次執行 `azd up`，您會注意到 gpt-4.1 模型會被部署，因為環境變數已在本機 `.azure` 資料夾中被變更（並儲存）。 

      以下是模型部署 <strong>之前</strong>：

      ![初始](../../../../../translated_images/zh-TW/14-deploy-initial.30e4cf1c29b587bc.webp)

      而這是 <strong>之後</strong>：
      ![更新後](../../../../../translated_images/zh-TW/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->