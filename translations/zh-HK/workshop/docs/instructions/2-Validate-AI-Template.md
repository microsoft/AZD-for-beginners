# 2. 驗證範本

> 於 2026 年 7 月使用 `azd 1.27.1` 驗證。

!!! tip "完成本模組後，你將能夠"

    - [ ] 分析 AI 解決方案架構
    - [ ] 了解 AZD 部署工作流程
    - [ ] 運用 GitHub Copilot 協助使用 AZD
    - [ ] **實驗 2：** 部署並驗證 AI Agents 範本

---


## 1. 簡介

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) 或 `azd` 是一款開源指令列工具，簡化開發者在建立及部署應用程式至 Azure 時的工作流程。

[AZD 範本](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) 是標準化的儲存庫，包含示範應用程式碼、_基礎結構即程式碼_ 資產與 `azd` 設定檔，以提供一致性的解決方案架構。基礎設施的佈建只需透過 `azd provision` 指令，而執行 `azd up` 則同時佈建基礎設施 <strong>及</strong> 部署應用程式，一氣呵成！

因此，只要找到最符合應用程式與基礎設施需求的 _AZD 起始範本_，再依情境需求自訂儲存庫，即可輕鬆啟動你的應用程式開發流程。

在開始之前，先確定已經安裝 Azure Developer CLI。

1. 開啟 VS Code 終端機並輸入以下指令：

      ```bash title="" linenums="0"
      azd version
      ```

1. 你應該會看到類似這樣的畫面！

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**你現在已做好使用 azd 選擇並部署範本的準備**

---

## 2. 範本選擇

Microsoft Foundry 平台提供一系列[建議的 AZD 範本](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)，涵蓋熱門解決方案場景，如 _多代理流程自動化_ 及 _多模內容處理_。你也可以造訪 Microsoft Foundry 入口網站來探索這些範本。

1. 訪問 [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. 於提示時登入 Microsoft Foundry 入口網站 - 你會看到類似畫面。

![Pick](../../../../../translated_images/zh-HK/01-pick-template.60d2d5fff5ebc374.webp)


**Basic** 選項為起始範本：

1. [ ] [開始使用 AI 聊天](https://github.com/Azure-Samples/get-started-with-ai-chat)，能部署一個基礎的聊天應用程式（搭配你的資料）至 Azure Container Apps。使用此範本可探索基本的 AI 聊天機器人場景。
1. [X] [開始使用 AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)，部署標準的 AI Agent（使用 Foundry Agents）。此範本適合熟悉包含工具及模型的代理型 AI 解決方案。

在新瀏覽器標籤頁開啟第二個連結（或點擊相關卡片的 `Open in GitHub`），你會看到該 AZD 範本的儲存庫。花點時間瀏覽 README。應用程式架構如下：

![Arch](../../../../../translated_images/zh-HK/architecture.8cec470ec15c65c7.webp)

---

## 3. 啟用範本

讓我們嘗試部署這個範本並確保其有效。我們會依循[開始使用](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started)部分的指引。

1. 選擇範本儲存庫的工作環境：

      - **GitHub Codespaces**：點擊 [此連結](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) 並確認 `Create codespace`
      - <strong>本機複製或開發容器</strong>：複製 `Azure-Samples/get-started-with-ai-agents` 並在 VS Code 中開啟

1. 等待 VS Code 終端機準備好，再輸入以下指令：

   ```bash title="" linenums="0"
   azd up
   ```

完成會觸發的工作流程步驟：

1. 系統將提示你登入 Azure - 按指示完成驗證
1. 輸入獨一無二的環境命名，如我使用 `nitya-mshack-azd`
1. 這會建立 `.azure/` 資料夾 - 其中會包含以環境名稱命名的子資料夾
1. 系統會提示選擇訂閱名稱 - 選擇預設的
1. 系統會提示選擇地區 - 使用 `East US 2`

接著等待佈建完成。**此過程約需 10-15 分鐘**

1. 完成後，畫面會顯示類似成功訊息：
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. 你的 Azure 入口網站將有一個以該環境命名的資源群組：

      ![Infra](../../../../../translated_images/zh-HK/02-provisioned-infra.46c706b14f56e0bf.webp)

1. <strong>你現在已準備好驗證已部署的基礎架構和應用程式</strong>。

---

## 4. 範本驗證

1. 造訪 Azure 入口網站的 [資源群組](https://portal.azure.com/#browse/resourcegroups) 頁面 - 提示時登入
1. 點擊你的環境名稱的 RG（資源群組）- 你會看到上方畫面

      - 點擊 Azure Container Apps 資源
      - 點擊 _Essentials_ 區塊（右上方）的應用程式網址

1. 你應該會看到類似的代管應用程式前端 UI：

   ![App](../../../../../translated_images/zh-HK/03-test-application.471910da12c3038e.webp)

1. 試著問幾個[範例問題](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. 問：「法國的首都是哪裡？」 ```What is the capital of France?``` 
      1. 問：「兩人用 200 美元以下最好帳篷是哪款？有哪些特點？」```What's the best tent under $200 for two people, and what features does it include?```

1. 你應該會得到如下類似回答。_但這是如何運作的？_

      ![App](../../../../../translated_images/zh-HK/03-test-question.521c1e863cbaddb6.webp)

---

## 5. 代理驗證

Azure Container App 部署一個端點，連接至 Microsoft Foundry 專案中為此範本佈建的 AI Agent。讓我們看看這代表甚麼。

1. 回到 Azure 入口網站中你資源群組的 _總覽_ 頁面

1. 點擊清單中的 `Microsoft Foundry` 資源

1. 你會看到這個畫面。點擊 `前往 Microsoft Foundry 入口網站` 按鈕。
   ![Foundry](../../../../../translated_images/zh-HK/04-view-foundry-project.fb94ca41803f28f3.webp)

1. 你應該會看到你的 AI 應用程式的 Foundry 專案頁面
   ![Project](../../../../../translated_images/zh-HK/05-visit-foundry-portal.d734e98135892d7e.webp)

1. 點擊 `Agents` - 你會看到專案中已佈建的預設 Agent
   ![Agents](../../../../../translated_images/zh-HK/06-visit-agents.bccb263f77b00a09.webp)

1. 選中它 - 會看到代理詳情。請注意以下：

      - 代理預設始終使用檔案搜尋
      - 代理的 `Knowledge` 表示已上傳 32 個檔案（用於檔案搜尋）
      ![Agents](../../../../../translated_images/zh-HK/07-view-agent-details.0e049f37f61eae62.webp)

1. 在左側選單找 `Data+indexes` 選項並點擊查看詳情。

      - 你會看到用於知識的 32 個資料檔案已上傳。
      - 這些對應至 `src/files` 中的 12 個客戶檔案及 20 個產品檔案
      ![Data](../../../../../translated_images/zh-HK/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**你已驗證代理運作正常！** 

1. 代理回應基於這些檔案中的知識。
1. 你現在可以針對該資料提出問題，並獲得有根據的回答。
1. 例如：`customer_info_10.json` 描述了 "Amanda Perez" 的 3 次購買紀錄。

回到含 Container App 端點的瀏覽器標籤頁，問：「Amanda Perez 擁有哪些產品？」。你應該會看到類似如下：

![Data](../../../../../translated_images/zh-HK/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. 代理操演場

讓我們藉由在 Agents Playground 操演代理，來建立對 Microsoft Foundry 功能的更深入理解。

1. 回到 Microsoft Foundry 中的 `Agents` 頁面 - 選擇預設代理
1. 點擊 `Try in Playground` 選項 - 你應該會看到如下的操演場介面
1. 提問相同問題：「Amanda Perez 擁有哪些產品？」

    ![Data](../../../../../translated_images/zh-HK/09-ask-in-playground.a1b93794f78fa676.webp)

你會得到相同（或類似）的回應 - 但同時可獲得額外資訊，幫助你了解代理應用程式的品質、成本與效能。例如：

1. 請注意回應中引用了用於支持回答的資料檔案
1. 將滑鼠移至任一檔案標籤 - 資料是否與你的查詢及顯示結果相符？

你還會看到回應下方有一行 _統計資料_。

1. 將滑鼠停留在任一指標上 - 例如安全性（Safety），你會看到類似下方的畫面
1. 評估的等級是否符合你對回應安全程度的直覺？

      ![Data](../../../../../translated_images/zh-HK/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. 內建觀察能力

觀察能力是指為應用程式添加量測工具，用以產生可用於理解、除錯及優化其運作的資料。想要體會其運作方式：

1. 點擊 `View Run Info` 按鈕 - 你會看到此視圖。這是[代理追蹤](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) 的一個實例。_你也可以透過頂層選單中的 Thread Logs 獲得此視圖_。

   - 了解代理執行步驟及所啟用工具
   - 了解總 Token 計數（相對於輸出 Token 使用量）以評估回應
   - 了解延遲及執行時間分布位置

      ![Agent](../../../../../translated_images/zh-HK/10-view-run-info.b20ebd75fef6a1cc.webp)

1. 點擊 `Metadata` 頁籤查看執行的其他屬性，這些屬性或可提供除錯時的有用上下文。

      ![Agent](../../../../../translated_images/zh-HK/11-view-run-info-metadata.7966986122c7c2df.webp)


1. 點擊 `Evaluations` 頁籤查看代理回應的自動評估結果。包括安全性評估（如自我傷害）及代理專屬評估（如意圖解析、任務遵守）。

      ![Agent](../../../../../translated_images/zh-HK/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. 最後，點擊側邊選單的 `Monitoring` 頁籤。

      - 選擇展示頁面的 `Resource usage` 頁籤 - 觀看各項指標。
      - 追蹤應用程式使用成本（tokens）及負載（請求數）。
      - 追蹤應用程式從收到請求到回應第一個及最後一個位元組的延遲。

      ![Agent](../../../../../translated_images/zh-HK/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. 環境變數

到目前為止，我們已在瀏覽器中走過部署流程，並驗證基礎架構已佈建且應用程式運作正常。但若想 _以程式碼優先_ 的方式作業，我們需要將相關變數配置於本機開發環境中，以便操作這些資源。利用 `azd` 可以輕鬆達成。

1. Azure Developer CLI 透過[環境變數](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash)來存取與管理應用程式部署的設定。

1. 環境變數儲存在 `.azure/<env-name>/.env` 檔案中 - 以 `env-name` 為範圍，隔離同一儲存庫中不同部署目標的環境。

1. `azd` 指令執行特定命令時（如 `azd up`），會自動載入環境變數。需注意的是，`azd` 不會自動讀取 _作業系統層級_ 的環境變數（如 shell 設定），請改用 `azd set env` 和 `azd get env` 在腳本中傳遞資訊。


嘗試執行以下幾個指令：

1. 取得此環境現存的所有 `azd` 環境變數：

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      你會看到類似：

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. 取得特定值 - 例如，想查是否設置 `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      你會看到類似下方結果 — 預設並未設置！

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. 設置新的 `azd` 環境變數。這裡，我們更新代理模型名稱。_注意：更改會立即反映到 `.azure/<env-name>/.env` 檔案中。_

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      現在，你能查到該值已設置：

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. 某些資源是持續性的（例如模型部署），僅靠 `azd up` 無法強制重新部署。讓我們嘗試拆除原本的部署並以更改後的環境變數重新部署。

1. <strong>刷新</strong> 若你之前使用 azd 範本已佈建基礎設施，可用此指令根據 Azure 目前佈建狀態刷新本機環境變數的狀態：

      ```bash title="" linenums="0"
      azd env refresh
      ```


      這是同步多於兩個本地開發環境（例如多名開發人員的團隊）環境變數的強大方法，讓已部署的基礎架構成為環境變數狀態的真實依據。團隊成員只需_刷新_變數即可重新同步。

---

## 9. 恭喜你 🏆

你剛完成了整個端對端工作流程，其中你：

- [X] 選擇了你想使用的 AZD 範本
- [X] 在支援的開發環境中打開範本
- [X] 部署並驗證範本能運作

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->