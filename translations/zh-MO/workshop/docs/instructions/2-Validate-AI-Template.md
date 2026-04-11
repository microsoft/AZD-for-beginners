# 2. 驗證範本

> 已根據 `azd 1.23.12` 於 2026 年 3 月驗證。

!!! tip "本模組結束時您將能夠"

    - [ ] 分析 AI 解決方案架構
    - [ ] 了解 AZD 部署工作流程
    - [ ] 使用 GitHub Copilot 獲得 AZD 使用協助
    - [ ] **實驗 2：** 部署及驗證 AI Agents 範本

---


## 1. 介紹

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) 或簡稱 `azd` 是一款開源的命令行工具，可簡化開發者在建置及部署應用程式至 Azure 時的工作流程。

[AZD 範本](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) 是標準化倉庫，包含範例應用程式程式碼、_基礎架構即程式碼_ 資產及 `azd` 設定檔，提供一個完整的解決方案架構。部署基礎架構只需要執行 `azd provision` 指令，而 `azd up` 則允許您一次完成基礎架構部署 <strong>及</strong> 應用程式部署！

因此，啟動您的應用程式開發流程，可以簡單地找到最符合您應用程式與基礎架構需求的合適 _AZD 開始範本_，再依照情境需求自訂該倉庫。

在開始之前，請先確認您已安裝 Azure Developer CLI。

1. 開啟 VS Code 終端機並輸入此指令：

      ```bash title="" linenums="0"
      azd version
      ```

1. 您應該會看到類似以下畫面！

      ```bash title="" linenums="0"
      azd version 1.23.12 (commit <current-build>)
      ```

**您現在已準備好使用 azd 選擇並部署範本**

---

## 2. 範本選擇

Microsoft Foundry 平台附帶一組[推薦的 AZD 範本](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)，涵蓋熱門解決方案情境，如 _多代理工作流程自動化_ 及 _多模態內容處理_。您也可以造訪 Microsoft Foundry 入口網站來發掘這些範本。

1. 造訪 [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. 系統提示時登入 Microsoft Foundry 入口網站 - 您會看到類似以下畫面。

![Pick](../../../../../translated_images/zh-MO/01-pick-template.60d2d5fff5ebc374.webp)


<strong>基本</strong> 選項是您的起始範本：

1. [ ] [開始使用 AI 聊天](https://github.com/Azure-Samples/get-started-with-ai-chat)，將部署一個使用您資料的基本聊天應用程式到 Azure 容器應用。用來探索基本的 AI 聊天機器人情境。
1. [X] [開始使用 AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)，同時部署標準 AI Agent（連同 Foundry Agents）。用此熟悉涉及工具與模型的代理 AI 解決方案。

在新分頁開啟第二個連結（或在相關卡片點擊 `Open in GitHub`）。您應該會看到此 AZD 範本的倉庫。花點時間瀏覽 README。應用程式架構如下圖：

![Arch](../../../../../translated_images/zh-MO/architecture.8cec470ec15c65c7.webp)

---

## 3. 範本啟用

讓我們嘗試部署此範本並確認其有效性。遵循[開始使用](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) 部分的指引。

1. 選擇範本倉庫的工作環境：

      - **GitHub Codespaces**：點擊[此連結](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents)並確認 `Create codespace`
      - <strong>本機複製或開發容器</strong>：複製 `Azure-Samples/get-started-with-ai-agents` 並在 VS Code 中開啟

1. 等待 VS Code 終端機準備完畢，接著輸入下列指令：

   ```bash title="" linenums="0"
   azd up
   ```

完成此指令觸發的工作流程步驟：

1. 系統會提示您登入 Azure－依指示完成認證
1. 輸入一個獨特的環境名稱，例如我使用 `nitya-mshack-azd`
1. 會建立 `.azure/` 資料夾，並在其中看到以該環境名稱為子資料夾
1. 系統會提示您選擇訂閱名稱－選擇預設值
1. 系統會提示您選擇地區－使用 `East US 2`

接下來，等待基礎架構部署完成。**此過程需 10-15 分鐘**

1. 完成後，終端機會顯示成功訊息如下：
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. 您的 Azure 入口網站中會出現剛配置好的同名資源群組：

      ![Infra](../../../../../translated_images/zh-MO/02-provisioned-infra.46c706b14f56e0bf.webp)

1. <strong>您現在可以進行已部署基礎架構與應用程式的驗證</strong>。

---

## 4. 範本驗證

1. 造訪 Azure 入口網站的[資源群組](https://portal.azure.com/#browse/resourcegroups)頁面－提示登入時完成登入
1. 點選您環境名稱的資源群組－會看到上述頁面

      - 點選 Azure 容器應用程式資源
      - 點選 _Essentials_ 區塊（右上方）的應用程式 URL

1. 您應該會看到類似這樣的托管應用程式前端 UI：

   ![App](../../../../../translated_images/zh-MO/03-test-application.471910da12c3038e.webp)

1. 嘗試提出幾個[範例問題](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. 詢問：```法國的首都是哪裡？``` 
      1. 詢問：```兩人用的最佳帳篷在 200 美元以下，包含哪些特色？```

1. 您應該會得到下方相似的回答。_但這背後是怎麼運作的？_

      ![App](../../../../../translated_images/zh-MO/03-test-question.521c1e863cbaddb6.webp)

---

## 5. 代理驗證

Azure 容器應用程式會部署一個端點，連接到 Microsoft Foundry 專案中的 AI Agent。讓我們來看看這意味著什麼。

1. 返回 Azure 入口網站您資源群組的 _概覽_ 頁面

1. 點選該列表中的 `Microsoft Foundry` 資源

1. 您應該會看到此畫面。點擊 `Go to Microsoft Foundry Portal` 按鈕。 
   ![Foundry](../../../../../translated_images/zh-MO/04-view-foundry-project.fb94ca41803f28f3.webp)

1. 您會看到 AI 應用程式的 Foundry 專案頁面
   ![Project](../../../../../translated_images/zh-MO/05-visit-foundry-portal.d734e98135892d7e.webp)

1. 點選 `Agents` - 您會看到預設的代理已在專案中部署
   ![Agents](../../../../../translated_images/zh-MO/06-visit-agents.bccb263f77b00a09.webp)

1. 選取它 - 查看代理詳細資訊。請注意以下事項：

      - 代理預設使用檔案搜尋（始終如此）
      - 代理的 `Knowledge` 表示已上傳 32 個檔案（供檔案搜尋用）
      ![Agents](../../../../../translated_images/zh-MO/07-view-agent-details.0e049f37f61eae62.webp)

1. 在左側選單尋找 `Data+indexes` 選項並點擊查看詳情。

      - 您會看到已上傳的 32 個知識資料檔
      - 這些對應到 `src/files` 下的 12 個客戶檔案及 20 個產品檔案
      ![Data](../../../../../translated_images/zh-MO/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**您已驗證代理運作正常！**

1. 代理回應是基於那些檔案中的知識作為依據。
1. 您現在可以提出與該資料相關的問題，並獲得有依據的答案。
1. 範例：`customer_info_10.json` 描述了 "Amanda Perez" 購買的 3 筆商品

回到包含容器應用程式端點的瀏覽器分頁，問：`Amanda Perez 擁有哪些產品？`。您應該會看到類似以下內容：

![Data](../../../../../translated_images/zh-MO/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. 代理遊樂場

讓我們進一步了解 Microsoft Foundry 的功能，透過在代理遊樂場中試玩代理。

1. 返回 Microsoft Foundry 的 `Agents` 頁面－選取預設代理
1. 點擊 `Try in Playground` 選項－您會看到遊樂場 UI 如下
1. 提出相同問題：`Amanda Perez 擁有哪些產品？`

    ![Data](../../../../../translated_images/zh-MO/09-ask-in-playground.a1b93794f78fa676.webp)

您會得到相同（或相似）的回答－但您還可以獲得額外資訊，幫助您了解代理應用程式的品質、成本與效能。例如：

1. 注意回應會引用用來「依據」回答的資料檔案
1. 將滑鼠停留在檔案標籤上－檢查資料是否與您的查詢及顯示的回答相符？

您還會看到回應下方有一行 _統計_ 資訊。

1. 將滑鼠停留在任何一個指標上－例如安全性，會出現下列樣貌
1. 評估的分數與您對回應安全性的直覺相吻合嗎？

      ![Data](../../../../../translated_images/zh-MO/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. 內建可觀測性

可觀測性是指為您的應用程式裝設監控裝置，以產生可用於了解、除錯和優化應用程式運作的資料。大致體驗如下：

1. 點擊 `View Run Info` 按鈕－您會看到這個畫面。這是 [Agent 追蹤](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) 功能的示範。_您也可以透過點擊頂層選單的 Thread Logs 取得此畫面_。

   - 了解執行步驟及代理使用的工具
   - 了解回應的總 Token 數（與輸出 Token 使用量）
   - 了解延遲及執行中花費時間的位置

      ![Agent](../../../../../translated_images/zh-MO/10-view-run-info.b20ebd75fef6a1cc.webp)

1. 點擊 `Metadata` 標籤，查看其他執行屬性，後續除錯時可能有用。

      ![Agent](../../../../../translated_images/zh-MO/11-view-run-info-metadata.7966986122c7c2df.webp)


1. 點擊 `Evaluations` 標籤，查看代理回應的自動評估，包括安全性評估（例如，防自殘）及代理特定評估（例如，意圖解析、任務遵循）。

      ![Agent](../../../../../translated_images/zh-MO/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. 最後，點擊側邊欄選單的 `Monitoring` 標籤。

      - 在出現頁面選擇 `Resource usage` 標籤，並查看指標。
      - 追蹤應用程式使用狀況，包含成本（Token）及負載（請求數）。
      - 追蹤應用程式的首次回應延遲（輸入處理時間）及最後輸出延遲。

      ![Agent](../../../../../translated_images/zh-MO/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. 環境變數

至此，我們已經透過瀏覽器完成部署，並驗證基礎架構已配置且應用程式在運作。但若要進行 _原始碼優先_ 的應用程式作業，您需要設定本機開發環境，配置相關的變數以使用這些資源。使用 `azd` 可以很容易做到。

1. Azure Developer CLI [使用環境變數](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash)來存儲及管理應用程式部署的設定。

1. 環境變數存放於 `.azure/<env-name>/.env` 中，範圍限定於部署時所使用的 `env-name`，幫助您在同一倉庫不同部署目標間隔離環境。

1. 每次執行特定指令時（如 `azd up`），`azd` 都會自動載入環境變數。注意，`azd` 並不會自動讀取作業系統層級的環境變數（例如在 shell 中設定的）－應使用 `azd set env` 與 `azd get env` 在腳本中傳遞資訊。

讓我們嘗試幾個指令：

1. 取得該環境中所有由 `azd` 設定的環境變數：

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      您會看到類似以下結果：

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. 取得特定值－例如，我想看看是否設定了 `AZURE_AI_AGENT_MODEL_NAME` 變數

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      您會看到類似下方內容－預設並未設定此變數！

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. 為 `azd` 設定新環境變數。這裡，我們更新代理模型名稱。_注意：所有變更會立即反映在 `.azure/<env-name>/.env` 檔案中。_

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      現在，我們來確認該值已設定：

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. 注意有些資源是持久的（例如模型部署），光靠 `azd up` 無法強制重新部署。讓我們嘗試拆除原本部署，並用改過的環境變數重新部署。

1. <strong>重新整理</strong> 如果您之前用 azd 範本部署過基礎架構，您可以使用下列指令，依據當前 Azure 部署狀態更新本機環境變數的狀態：

      ```bash title="" linenums="0"
      azd env refresh
      ```

這是一個強大的方法，用於在兩個或多個本地開發環境（例如，多開發者團隊）之間_同步_環境變數——讓已部署的基礎設施作為環境變數狀態的真實依據。團隊成員只需_刷新_變數即可重新同步。

---

## 9. 恭喜你 🏆

你剛完成了一個端到端的工作流程，你：

- [X] 選擇了你想使用的 AZD 範本
- [X] 在支援的開發環境中打開了範本
- [X] 部署了範本並驗證其運作正常

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於準確性，請注意自動翻譯可能包含錯誤或不準確之處。原始文件之本地語言版本應視為權威來源。對於重要資訊，建議使用專業人工翻譯。我們不對因使用此翻譯而產生之任何誤解或誤釋負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->