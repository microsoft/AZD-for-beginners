<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6539a34c770f3ceff282370d72ee74dc",
  "translation_date": "2025-09-24T09:10:20+00:00",
  "source_file": "workshop/docs/instructions/6-Teardown-Infrastructure.md",
  "language_code": "tw"
}
-->
# 6. 拆除基礎設施

!!! tip "完成本模組後，您將能夠"

    - [ ] 項目
    - [ ] 項目
    - [ ] 項目

---

## 額外練習

在拆除專案之前，花幾分鐘進行一些開放式的探索。

!!! danger "NITYA-TODO: 提供一些可嘗試的提示"

---

## 解除基礎設施

1. 拆除基礎設施非常簡單：

      ```bash title="" linenums="0"
      azd down --purge
      ```

1. `--purge` 標誌確保同時清除已軟刪除的 Cognitive Service 資源，從而釋放這些資源佔用的配額。一旦完成，您將看到類似以下的內容：

      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. （可選）如果您現在再次執行 `azd up`，您會注意到 gpt-4.1 模型被部署，因為環境變數已在本地 `.azure` 資料夾中更改並保存。

      以下是模型部署的 **之前** 狀態：

      ![初始](../../../../../translated_images/tw/14-deploy-initial.30e4cf1c29b587bc.webp)

      以下是 **之後** 的狀態：
      ![新部署](../../../../../translated_images/tw/14-deploy-new.f7f3c355a3cf7299.webp)

---

