# 2. 驗證範本

> 已於 2026 年 7 月針對 `azd 1.27.1` 版本驗證。

!!! tip "完成本單元後您將能夠"

    - [ ] 分析 AI 解決方案架構
    - [ ] 了解 AZD 部署工作流程
    - [ ] 使用 GitHub Copilot 獲得 AZD 使用上的幫助
    - [ ] **實驗 2：** 部署並驗證 AI Agents 範本

---


## 1. 介紹

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)（簡稱 `azd`）是一個開源的命令列工具，可簡化開發人員在建置和部署應用程式到 Azure 時的工作流程。

[AZD 範本](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) 是標準化的儲存庫，包含範例應用程式程式碼、_基礎架構即程式碼_ 資產與 `azd` 配置檔，打造出一致的解決方案架構。基礎架構的佈建只需執行 `azd provision` 指令即可，而使用 `azd up` 則能一次同時完成基礎架構的佈建 <strong>及</strong> 部署應用程式！

如此一來，快速啟動您的應用程式開發流程就能如找到最接近您的應用和基礎架構需求的 _AZD Starter 範本_ 一樣簡單，接著依需求自訂儲存庫即可。

在開始之前，請先確定已安裝 Azure Developer CLI。

1. 開啟 VS Code 終端機並輸入以下指令：

      ```bash title="" linenums="0"
      azd version
      ```

1. 您應該會看到類似以下畫面！

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**您現在已準備好使用 azd 選擇並部署範本**

---

## 2. 範本選擇

Microsoft Foundry 平台提供一組推薦的 [AZD 範本](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)，涵蓋如 _多代理工作流程自動化_ 與 _多模式內容處理_ 等熱門解決方案場景。您也可透過 Microsoft Foundry 入口網站發現這些範本。

1. 造訪 [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. 按提示登入 Microsoft Foundry 入口網站 — 您會見到類似畫面。

![Pick](../../../../../translated_images/zh-TW/01-pick-template.60d2d5fff5ebc374.webp)


<strong>基礎</strong> 選項是您的入門範本：

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) 部署基本的聊天應用程式並整合您的資料至 Azure Container Apps。使用此範本探索基本 AI 聊天機器人場景。
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) 同樣部署標準 AI Agent（含 Foundry Agents）。使用它熟悉結合工具和模型的代理式 AI 解決方案。

在新瀏覽器分頁中開啟第二個連結（或點選相關卡片上的 `Open in GitHub`）即可看到此 AZD 範本的儲存庫。花點時間瀏覽 README。應用程式架構如下圖：

![Arch](../../../../../translated_images/zh-TW/architecture.8cec470ec15c65c7.webp)

---

## 3. 範本啟動

讓我們嘗試部署此範本並確保其有效，依據 [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) 章節的指引操作。

1. 選擇範本儲存庫的工作環境：

      - **GitHub Codespaces**：點選[此連結](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents)並確認 `Create codespace`
      - <strong>本地端複製或開發容器</strong>：複製 `Azure-Samples/get-started-with-ai-agents` 儲存庫並在 VS Code 中開啟

1. 等候 VS Code 終端機準備好後，輸入以下指令：

   ```bash title="" linenums="0"
   azd up
   ```

接著完成觸發的工作流程步驟：

1. 系統會提示您登入 Azure — 按指示完成認證
1. 輸入唯一的環境名稱 — 例如，我使用 `nitya-mshack-azd`
1. 系統會建立 `.azure/` 資料夾，內含環境名稱的子資料夾
1. 系統會提示選擇訂閱名稱 — 選擇預設項目即可
1. 系統會提示選擇地點 — 請使用 `East US 2`

現在，請等待基礎架構佈建完成。**此過程約需 10-15 分鐘**

1. 完成時，終端機會顯示類似的 SUCCESS 訊息：
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. 您的 Azure 入口網站將會出現此環境名稱的已佈建資源群組：

      ![Infra](../../../../../translated_images/zh-TW/02-provisioned-infra.46c706b14f56e0bf.webp)

1. <strong>您已準備好驗證已部署的基礎架構與應用程式</strong>。

---

## 4. 範本驗證

1. 造訪 Azure 入口網站的 [資源群組](https://portal.azure.com/#browse/resourcegroups) 頁面 — 按提示登入
1. 點選您環境名稱的資源群組 — 您會看到上圖頁面

      - 點選 Azure Container Apps 資源
      - 點選 _Essentials_ 區域（右上角）的應用程式網址（Application Url）

1. 您應會見到像這樣的託管應用程式前端 UI：

   ![App](../../../../../translated_images/zh-TW/03-test-application.471910da12c3038e.webp)

1. 嘗試問幾個 [範例問題](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. 問：```法國的首都是哪裡？```
      1. 問：```兩人帳篷中，$200 以下的最佳帳篷是什麼？含有哪些特性？```

1. 您應該會得到類似下方的答案。_但這是如何運作的呢？_

      ![App](../../../../../translated_images/zh-TW/03-test-question.521c1e863cbaddb6.webp)

---

## 5. 代理驗證

Azure Container App 部署的端點連接到此範本所用 Microsoft Foundry 專案中佈建的 AI 代理。讓我們看看這代表了什麼。

1. 返回您的資源群組在 Azure 入口網站中的 _總覽_ 頁面

1. 點選清單中的 `Microsoft Foundry` 資源

1. 您會看到下圖。按下 `前往 Microsoft Foundry 入口網站`（Go to Microsoft Foundry Portal）按鈕。
   ![Foundry](../../../../../translated_images/zh-TW/04-view-foundry-project.fb94ca41803f28f3.webp)

1. 您會看到 AI 應用程式對應的 Foundry 專案頁面
   ![Project](../../../../../translated_images/zh-TW/05-visit-foundry-portal.d734e98135892d7e.webp)

1. 點選 `Agents` — 見專案中已佈建的預設 Agent
   ![Agents](../../../../../translated_images/zh-TW/06-visit-agents.bccb263f77b00a09.webp)

1. 選擇該 Agent — 您將看到代理詳情。請注意：

      - 該代理預設使用檔案搜尋 (File Search)
      - 代理的 `Knowledge` 顯示有 32 個已上傳檔案 (用於檔案搜尋)
      ![Agents](../../../../../translated_images/zh-TW/07-view-agent-details.0e049f37f61eae62.webp)

1. 在左側選單中查找 `Data+indexes` 選項並點進去看詳情。

      - 您會看到 32 個上傳的知識資料檔案。
      - 這些對應 `src/files` 底下的 12 個顧客檔案與 20 個產品檔案
      ![Data](../../../../../translated_images/zh-TW/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**您已驗證代理正常運作！**

1. 代理的回答以這些檔案中的知識為基礎。
1. 現在您可以提出與這些資料相關的問題，並得到基於事實的回應。
1. 範例：`customer_info_10.json` 描述「Amanda Perez」的 3 筆購買紀錄

回到瀏覽器分頁中 Container App 的端點，問：`Amanda Perez 擁有哪些產品？`。您應會看到類似結果：

![Data](../../../../../translated_images/zh-TW/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. 代理遊樂場

讓我們進一步體驗 Microsoft Foundry 的能耐，將代理帶入代理遊樂場操作看看。

1. 返回 Microsoft Foundry 的 `Agents` 頁面 — 選擇預設代理
1. 點擊 `Try in Playground` 選項 — 您將看到類似下方的遊樂場 UI
1. 問同樣的問題：`Amanda Perez 擁有哪些產品？`

    ![Data](../../../../../translated_images/zh-TW/09-ask-in-playground.a1b93794f78fa676.webp)

您會得到相同（或相似）的回答 — 並額外看到一些可以用來了解您的代理應用品質、成本與效能的重要資訊。例如：

1. 注意回答中引用了用來「基石」回答的資料檔案
1. 將滑鼠移至任何這些檔案標籤上 — 該資料是否與您的查詢及顯示回答相符？

下面還有一列 _stats_。

1. 將滑鼠移到任一指標上 — 例如 Safety，您會看到類似這樣
1. 您覺得這樣的評等是否符合您對回答安全性的直覺感受？

      ![Data](../../../../../translated_images/zh-TW/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. 內建可觀測性

可觀測性指的是為應用程式加入偵測器，能產生理解、除錯及優化作業所需的資料。為了體驗這點：

1. 點擊 `View Run Info` 按鈕 — 您會看到以下畫面。這是 [代理追蹤](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) 的實例。_也可透過頂層選單的 Thread Logs 項目取得此視圖_。

   - 了解代理執行步驟與涉及的工具
   - 理解回答中 Token 的總數（與輸出 token 數量）
   - 了解延遲情形以及執行時間耗費在哪些階段

      ![Agent](../../../../../translated_images/zh-TW/10-view-run-info.b20ebd75fef6a1cc.webp)

1. 點選 `Metadata` 標籤以查看執行的其他屬性，這些資訊可用於後續除錯上下文。

      ![Agent](../../../../../translated_images/zh-TW/11-view-run-info-metadata.7966986122c7c2df.webp)


1. 點選 `Evaluations` 標籤，可以看到代理回答的自動評估結果。包含安全性評估（如自殘）及代理專屬評估（如意圖解析、任務遵循度）。

      ![Agent](../../../../../translated_images/zh-TW/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. 最後，點選側邊欄的 `Monitoring` 標籤。

      - 在顯示的頁面選擇 `Resource usage` 分頁，檢視相關指標。
      - 追蹤應用程式使用量（成本，Token）與負載（請求數）。
      - 監控應用程式延遲時間，包括第一個位元組到達（輸入處理）與最後一個位元組（輸出）。

      ![Agent](../../../../../translated_images/zh-TW/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. 環境變數

到目前為止，我們已在瀏覽器中完成部署並驗證基礎架構已就緒且應用程式正常運作。但若要以 _程式碼優先_ 方式操作，須配置本地開發環境中與這些資源相關的環境變數。使用 `azd` 會變得相當方便。

1. Azure Developer CLI [使用環境變數](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) 來儲存與管理應用部署的配置設定。

1. 環境變數存於 `.azure/<env-name>/.env`，其範圍侷限為部署時使用的 `env-name` 環境，有助於區隔同一儲存庫中不同部署目標的環境。

1. 每當執行特定指令（如 `azd up`）時，`azd` 會自動載入環境變數。注意，`azd` 不會自動讀取作業系統層級環境變數（如 shell 設定），請利用 `azd set env` 與 `azd get env` 在腳本間傳遞資訊。


讓我們試試幾個指令：

1. 取得此環境下所有為 `azd` 設定的環境變數：

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      您會看到類似：

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. 取得特定值 — 例如我想知道是否設定 `AZURE_AI_AGENT_MODEL_NAME` 這個變數

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      您會看到類似以下資訊 — 預設並未設定！

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. 設定新的環境變數給 `azd`。這裡我們更新代理模型名稱。_注意：任何修改會立即反映在 `.azure/<env-name>/.env` 檔案中。_

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      現在，應該能看到該值已設定：

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. 注意部分資源是持久的（例如模型部署），只用 `azd up` 無法強制重新部署。讓我們試著拆除原先部署並帶著修改後的環境變數重新部署。

1. <strong>重新整理</strong> 若您曾使用 azd 範本部署基礎架構 — 可用此指令依據 Azure 部署的目前狀態 _重新整理_ 本地環境變數狀態：

      ```bash title="" linenums="0"
      azd env refresh
      ```


      這是一種強大的方法，可讓兩個或多個本地開發環境（例如多位開發人員的團隊）之間同步環境變數——使已部署的基礎架構成為環境變數狀態的真實依據。團隊成員只需刷新變數即可重新同步。

---

## 9. 恭喜您 🏆

您剛完成了一個端到端的工作流程，內容包括：

- [X] 選擇您想使用的 AZD 範本
- [X] 在受支援的開發環境中開啟範本
- [X] 部署範本並驗證其可運作

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->