# 2. 驗證範本

> 於 2026 年 6 月以 `azd 1.25.6` 版本驗證。

!!! tip "完成本模組後，你將能夠"

    - [ ] 分析 AI 解決方案架構
    - [ ] 理解 AZD 部署流程
    - [ ] 使用 GitHub Copilot 獲得 AZD 使用幫助
    - [ ] **實驗 2：** 部署並驗證 AI 代理程式範本

---


## 1. 介紹

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) 或稱 `azd` 是一款開源命令列工具，可簡化開發者在 Azure 上建立與部署應用程式的工作流程。

[AZD 範本](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) 是標準化的儲存庫，其中包含示範應用程式程式碼、_基礎建設即程式碼_ 資產與 `azd` 配置檔，組成具連貫性的解決方案架構。透過 `azd provision` 命令即可輕鬆佈建基礎設施，而 `azd up` 則可以同時佈建基礎設施 <strong>並</strong> 部署你的應用程式！

因此，開始你的應用程式開發過程只需找出最貼近你應用程式和基礎設施需求的 _AZD Starter 範本_ ，並依據情境需求自訂儲存庫即可。

開始前，先確保你已安裝 Azure Developer CLI。

1. 打開 VS Code 終端機並輸入以下指令：

      ```bash title="" linenums="0"
      azd version
      ```

1. 你應該會看到類似如下的畫面！

      ```bash title="" linenums="0"
      azd version 1.25.6 (commit <current-build>)
      ```

**你現在已準備好用 azd 選擇並部署範本**

---

## 2. 範本選擇

Microsoft Foundry 平台隨附一組[推薦的 AZD 範本](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)，涵蓋熱門解決方案場景，如 _多代理流程自動化_ 及 _多模態內容處理_。你也可以造訪 Microsoft Foundry 入口網站來發掘這些範本。

1. 訪問 [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. 當系統提示時登入 Microsoft Foundry 入口，你會看到類似如下畫面。

![Pick](../../../../../translated_images/zh-HK/01-pick-template.60d2d5fff5ebc374.webp)


<strong>基本</strong> 選項是你的入門範本：

1. [ ] [開始使用 AI 聊天](https://github.com/Azure-Samples/get-started-with-ai-chat)，部署一個基礎聊天應用程式，使用你的資料於 Azure Container Apps。可用於探索基本 AI 聊天機器人的情境。
1. [X] [開始使用 AI 代理程式](https://github.com/Azure-Samples/get-started-with-ai-agents)，同時部署一個標準 AI 代理（搭配 Foundry 代理）。能幫你熟悉帶有工具與模型的自動代理式 AI 解決方案。

在新瀏覽器分頁中打開第二個連結（或點擊相關卡的 `Open in GitHub`）。你會看到此 AZD 範本的儲存庫。花點時間瀏覽 README。應用程式架構如下：

![Arch](../../../../../translated_images/zh-HK/architecture.8cec470ec15c65c7.webp)

---

## 3. 範本啟用

現在來嘗試部署此範本並確保其有效。依照[入門](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) 區段的指引進行。

1. 選擇範本儲存庫的工作環境：

      - **GitHub Codespaces**：點擊[此鏈結](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents)，並確認 `Create codespace`
      - <strong>本機複製或開發容器</strong>：將 `Azure-Samples/get-started-with-ai-agents` 複製並在 VS Code 中打開

1. 等待 VS Code 終端機準備就緒，然後輸入以下指令：

   ```bash title="" linenums="0"
   azd up
   ```

完成此操作會觸發以下工作流程步驟：

1. 系統將提示你登入 Azure，請依指示完成身份驗證
1. 輸入一個獨特的環境名稱，例如我使用 `nitya-mshack-azd`
1. 系統會建立一個 `.azure/` 資料夾，內有以環境名稱命名的子資料夾
1. 系統會提示選擇訂閱名稱，請選預設訂閱
1. 系統會提示選擇位置，使用 `East US 2`

接著，請等待佈建完成。**這約需 10-15 分鐘**

1. 完成時，控制台會顯示類似的成功訊息：
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Azure 入口網站會有一個以該環境名稱命名已佈建的資源群組：

      ![Infra](../../../../../translated_images/zh-HK/02-provisioned-infra.46c706b14f56e0bf.webp)

1. <strong>你現在已準備好驗證部署的基礎設施與應用程式</strong>。

---

## 4. 範本驗證

1. 訪問 Azure 入口網站的[資源群組](https://portal.azure.com/#browse/resourcegroups)頁面，遇到提示時請登入
1. 點擊你的環境名稱所對應的資源群組頁面 - 你會看到如上圖頁面

      - 點擊 Azure Container Apps 資源
      - 在 _Essentials_ 區段（右上角）點擊應用程式 URL

1. 你應該會看到一個託管的應用程式前端 UI，如下所示：

   ![App](../../../../../translated_images/zh-HK/03-test-application.471910da12c3038e.webp)

1. 嘗試問幾個[範例問題](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. 問：```法國的首都是哪裡？``` 
      1. 問：```兩人用 200 美元以下最佳帳篷是哪款？有哪些功能？```

1. 你應該會得到類似以下的回答。_但是這是怎麼運作的呢？_ 

      ![App](../../../../../translated_images/zh-HK/03-test-question.521c1e863cbaddb6.webp)

---

## 5. 代理驗證

Azure Container App 部署了一個端點，連接至在 Microsoft Foundry 專案中根據此範本所提供的 AI 代理。讓我們來看看這代表什麼。

1. 返回 Azure 入口網站的資源群組 _概覽_ 頁面

1. 點擊清單中的 `Microsoft Foundry` 資源

1. 你會看到此畫面，點擊 `Go to Microsoft Foundry Portal` 按鈕。
   ![Foundry](../../../../../translated_images/zh-HK/04-view-foundry-project.fb94ca41803f28f3.webp)

1. 你會看到該 AI 應用程式的 Foundry 專案頁面
   ![Project](../../../../../translated_images/zh-HK/05-visit-foundry-portal.d734e98135892d7e.webp)

1. 點擊 `Agents` - 你會看到專案中已佈建的預設代理
   ![Agents](../../../../../translated_images/zh-HK/06-visit-agents.bccb263f77b00a09.webp)

1. 選取代理 - 你會查看代理詳細資訊。請注意：

      - 此代理預設使用檔案搜尋（永遠如此）
      - 代理的 `Knowledge` 顯示已上傳 32 個檔案（用於檔案搜尋）
      ![Agents](../../../../../translated_images/zh-HK/07-view-agent-details.0e049f37f61eae62.webp)

1. 在左側選單尋找 `Data+indexes` 選項，點擊查看詳細內容。

      - 你會看到 32 個已上傳的知識檔案
      - 這些對應於 `src/files` 下的 12 個客戶檔案及 20 個產品檔案
      ![Data](../../../../../translated_images/zh-HK/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**你已驗證代理的運作！**

1. 代理回應根據這些檔案中的知識給出。
1. 現在你可以用與該資料相關的問題詢問，獲得根據知識的回覆。
1. 例如：`customer_info_10.json` 描述名為「Amanda Perez」的 3 筆購買紀錄

回到瀏覽器中 Container App 的端點分頁，問：「Amanda Perez 擁有哪些產品？」你會看到如下：

![Data](../../../../../translated_images/zh-HK/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. 代理試玩場

讓我們更直觀瞭解 Microsoft Foundry 的能力，在代理試玩場裡測試代理。

1. 返回 Microsoft Foundry 的 `Agents` 頁面，選擇預設代理
1. 點擊 `Try in Playground` 選項，你會看到這樣的試玩場 UI
1. 問同樣的問題：「Amanda Perez 擁有哪些產品？」

    ![Data](../../../../../translated_images/zh-HK/09-ask-in-playground.a1b93794f78fa676.webp)

你會得到相同（或相似）的回答，但還會獲得額外資訊，幫助你了解代理應用的品質、成本與效能。例如：

1. 回應中會標示用以「根據」回答的資料檔案
1. 將滑鼠停留在任一檔案標籤上 - 資料是否符合你的查詢與顯示的回答？

你也會看到回應下方有一行 _統計（stats）_。

1. 將滑鼠移至任何指標 - 如安全性，你會看到這樣的畫面
1. 評估結果是否符合你對回答安全性的直覺判斷？

      ![Data](../../../../../translated_images/zh-HK/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. 內建的可觀察性

可觀察性係指對應用程式進行儀表，產生資料以利了解、除錯與優化其運作。以下讓你感受這點：

1. 點擊 `View Run Info` 按鈕，你會看到此視圖。這是 [代理追蹤](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) 的範例畫面。_你也可以從頂層選單點擊 Thread Logs 取得此視圖_。

   - 瞭解代理使用的運行步驟與工具
   - 理解回應的總 Token 數（與輸出 token 使用量比較）
   - 理解延遲以及執行過程中花費時間的環節

      ![Agent](../../../../../translated_images/zh-HK/10-view-run-info.b20ebd75fef6a1cc.webp)

1. 點擊 `Metadata` 分頁，查看更多運行用的屬性，有助於後續調試問題。

      ![Agent](../../../../../translated_images/zh-HK/11-view-run-info-metadata.7966986122c7c2df.webp)


1. 點擊 `Evaluations` 分頁，查看代理回應的自動評估結果。包括安全性評估（如自我傷害）與代理專屬評估（如意圖解析、任務遵循度）。

      ![Agent](../../../../../translated_images/zh-HK/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. 最後，點擊側欄中的 `Monitoring` 分頁。

      - 在其中選取 `Resource usage` 分頁，觀察度量資訊。
      - 追蹤以成本（token）及負載（請求數）衡量的應用使用情況。
      - 追蹤應用從輸入處理到輸出時間的延遲。

      ![Agent](../../../../../translated_images/zh-HK/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. 環境變數

迄今我們已透過瀏覽器完成部署，並確認基礎設施以及應用程式運作正常。但要以「程式碼優先」方式操作應用程式，我們需要設定本機開發環境中與這些資源相關的變數。使用 `azd` 會很輕鬆。

1. Azure Developer CLI [使用環境變數](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) 儲存與管理應用程式部署的配置設定。

1. 環境變數存放於 `.azure/<env-name>/.env` 中，適用範圍限定在部署時使用的 `env-name` 環境，有助於在同一儲存庫中區隔不同部署目標的環境。

1. 每當執行特定命令（例如 `azd up`）時，`azd` 會自動載入環境變數。請注意，`azd` 不會自動讀取 _作業系統層級_ 的環境變數（如在 shell 中設定的），改以使用 `azd set env` 和 `azd get env` 在腳本中傳遞資訊。


試試幾個指令：

1. 取得此環境中設定給 `azd` 的全部環境變數：

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      你會看到如下資訊：

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. 取得特定值 - 例如想知道是否有設定 `AZURE_AI_AGENT_MODEL_NAME` 變數

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      你會看到如下，表示預設沒有設定此變數！

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. 設定新的 `azd` 環境變數。這裡更新代理模型名稱。_注意：所有更動會立即反映於 `.azure/<env-name>/.env` 檔案中。

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      現在查詢應該會得到該值：

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. 注意部分資源是持續存在的（例如模型部署），因此不可能只用 `azd up` 強制重新部署。試著拆除先前部署並用改變環境變數的方式重部署看看。

1. <strong>重新整理</strong> 若先前使用 azd 範本部署過基礎設施，可以用此命令根據目前 Azure 部署狀態重新整理本機環境變數：

      ```bash title="" linenums="0"
      azd env refresh
      ```

這是一個強大的方法，可用於在兩個或多個本地開發環境（例如，擁有多名開發者的團隊）之間同步環境變數——讓已部署的基礎設施成為環境變數狀態的真實依據。團隊成員只需刷新變數，即可重新同步。

---

## 9. 恭喜你 🏆

你剛完成了一個端到端的工作流程，其中你：

- [X] 選擇了你想使用的 AZD 模板
- [X] 在支援的開發環境中打開了模板
- [X] 部署了模板並驗證它能正常運作

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->