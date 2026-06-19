# 6. 拆除基礎建設

!!! tip "在本單元結束時，您將能夠"

    - [ ] 了解資源清理和成本管理的重要性
    - [ ] 使用 `azd down` 安全地撤除基礎設施
    - [ ] 必要時恢復軟刪除的 Azure AI 服務
    - [ ] **實驗 6：** 清理 Azure 資源並驗證移除

---

## 額外練習

在拆除專案之前，花幾分鐘進行一些開放式探索。

!!! info "嘗試這些探索提示"

    **嘗試 GitHub Copilot：**
    
    1. 詢問：`我還可以嘗試哪些 AZD 範本來進行多代理場景？`
    2. 詢問：`如何為醫療保健使用案例自訂代理指令？`
    3. 詢問：`哪些環境變數控制成本優化？`
    
    **探索 Azure 入口網站：**
    
    1. 查看部署的 Application Insights 指標
    2. 檢查已配置資源的成本分析
    3. 再次探索 Microsoft Foundry 入口網站的代理遊樂場

---

## 撤除基礎設施

1. 拆除基礎設施就這麼簡單：
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. `--purge` 標誌確保它還會清除軟刪除的認知服務資源，從而釋放這些資源佔用的配額。完成後您會看到類似下面的內容：
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. （可選）如果您現在再次執行 `azd up`，您會注意到 gpt-4.1 模型因為環境變數已更改（並保存在本地 `.azure` 資料夾中）而被部署。

      這是部署 <strong>前</strong> 的模型情況：

      ![起始](../../../../../translated_images/zh-HK/14-deploy-initial.30e4cf1c29b587bc.webp)

      這是 <strong>後</strong> 的狀況：
      ![新](../../../../../translated_images/zh-HK/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->