# 2. 驗證模板

> 於2026年7月，根據 `azd 1.27.1` 驗證。

!!! tip "完成本模組後您將能夠"

    - [ ] 分析 AI 解決方案架構
    - [ ] 理解 AZD 部署工作流程
    - [ ] 使用 GitHub Copilot 協助使用 AZD
    - [ ] **實驗 2：** 部署及驗證 AI Agents 模板

---


## 1. 簡介

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) 或稱 `azd` 是一個開源指令行工具，簡化開發人員在構建及部署應用程式至 Azure 時的工作流程。

[AZD 模板](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) 是標準化的儲存庫，包含範例應用程式程式碼、_基礎架構即程式碼_ 資產及 `azd` 配置檔，組成一致的解決方案架構。基礎設施透過 `azd provision` 指令即可輕鬆布建，而使用 `azd up` 則可同時布建基礎設施<strong>及</strong>部署應用程式！

因此，啟動您的應用程式開發過程可以簡化為尋找最接近您應用程式及基礎設施需求的 _AZD 入門模板_，然後客製化儲存庫以符合您的情境需求。

在開始前，確保已安裝 Azure Developer CLI。

1. 開啟 VS Code 終端機並輸入以下命令：

      ```bash title="" linenums="0"
      azd version
      ```

1. 您應該會看到類似這樣的結果！

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**您現在可以使用 azd 選擇並部署模板**

---

## 2. 模板選擇

Microsoft Foundry 平台提供一套[推薦的 AZD 模板](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)，涵蓋熱門解決方案場景，如 _多代理流程自動化_ 及 _多模態內容處理_。您也可以透過造訪 Microsoft Foundry 入口網站來探索這些模板。

1. 訪問 [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. 按提示登入 Microsoft Foundry 入口網站 - 您將會看到類似這樣的畫面。

![Pick](../../../../../translated_images/zh-MO/01-pick-template.60d2d5fff5ebc374.webp)


<strong>基礎</strong> 選項是您的入門模板：

1. [ ] [開始使用 AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)，將基礎聊天應用程式 _搭配您的資料_ 部署到 Azure Container Apps。用來探索基本的 AI 聊天機器人場景。
1. [X] [開始使用 AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)，也會部署標準 AI Agent（搭配 Foundry Agents）。用來熟悉含工具和模型的代理 AI 解決方案。

於新瀏覽器分頁中訪問第二個連結（或點擊相關卡片的「Open in GitHub」）。您應該會看到此 AZD 模板的儲存庫。花點時間瀏覽 README。應用程式架構如下：

![Arch](../../../../../translated_images/zh-MO/architecture.8cec470ec15c65c7.webp)

---

## 3. 模板啟用

嘗試部署此模板並確保其有效。我們將遵循[開始使用](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started)部分的指導。

1. 選擇模板儲存庫的工作環境：

      - **GitHub Codespaces**：點擊[此連結](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents)並確認 `Create codespace`
      - <strong>本地複製或開發容器</strong>：複製 `Azure-Samples/get-started-with-ai-agents` 並在 VS Code 開啟

1. 等待 VS Code 終端機準備好，然後輸入以下命令：

   ```bash title="" linenums="0"
   azd up
   ```

完成這將觸發的工作流程步驟：

1. 您會被提示登入 Azure - 按指示完成驗證
1. 輸入唯一的環境名稱 - 例如，我使用 `nitya-mshack-azd`
1. 這會建立 `.azure/` 資料夾 - 您會看到以環境名稱命名的子資料夾
1. 您會被要求選擇訂閱名稱 - 選擇預設值
1. 您會被要求輸入位置 - 使用 `East US 2`

現在，請等待基礎設施佈建完成。**這需要 10-15 分鐘**

1. 完成後，您的控制台會顯示如下 SUCCESS 訊息：
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. 您的 Azure 入口網站將會有一個以該環境名命名的已佈建資源群組：

      ![Infra](../../../../../translated_images/zh-MO/02-provisioned-infra.46c706b14f56e0bf.webp)

1. <strong>您現在可以驗證已部署的基礎設施和應用程式</strong>。

---

## 4. 模板驗證

1. 訪問 Azure 入口網站的[資源群組](https://portal.azure.com/#browse/resourcegroups)頁面 - 按提示登入
1. 點擊您的環境名稱的 RG，您會看到上方畫面

      - 點擊 Azure Container Apps 資源
      - 點擊 _Essentials_ 區塊（右上方）的應用程式 URL

1. 您應會看到此類託管的應用程式前端介面：

   ![App](../../../../../translated_images/zh-MO/03-test-application.471910da12c3038e.webp)

1. 嘗試提出幾個[範例問題](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. 問：```法國的首都是哪裏？```
      1. 問：```兩人使用，200美元以下最佳帳篷是什麼？包含哪些功能？```

1. 您應該會得到類似以下的答案。_這是如何運作的呢？_

      ![App](../../../../../translated_images/zh-MO/03-test-question.521c1e863cbaddb6.webp)

---

## 5. 代理驗證

Azure Container App 會部署一個端點，連接至此模板 Microsoft Foundry 專案中佈建的 AI Agent。我們來看看這代表什麼。

1. 回到 Azure 入口網站中您的資源群組 _概覽_ 頁面

1. 點擊清單中的 `Microsoft Foundry` 資源

1. 您會看到此畫面，點擊 `Go to Microsoft Foundry Portal` 按鈕。
   ![Foundry](../../../../../translated_images/zh-MO/04-view-foundry-project.fb94ca41803f28f3.webp)

1. 您將看到您的 AI 應用程式的 Foundry 專案頁面
   ![Project](../../../../../translated_images/zh-MO/05-visit-foundry-portal.d734e98135892d7e.webp)

1. 點擊 `Agents` - 您會看到專案中佈建的預設代理
   ![Agents](../../../../../translated_images/zh-MO/06-visit-agents.bccb263f77b00a09.webp)

1. 選取它 - 您會看到代理詳細資訊。請注意以下事項：

      - 該代理預設使用檔案搜尋（恆時）
      - 代理的 `Knowledge` 表示已上傳 32 個檔案（用於檔案搜尋）
      ![Agents](../../../../../translated_images/zh-MO/07-view-agent-details.0e049f37f61eae62.webp)

1. 在左側選單中尋找 `Data+indexes` 選項並點擊以查看詳細資料。

      - 您應該會看到為知識上傳的 32 個資料檔案。
      - 這些檔案對應於 `src/files` 目錄下的 12 個客戶檔案及 20 個產品檔案
      ![Data](../../../../../translated_images/zh-MO/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**您已驗證代理運作！**

1. 代理的回應都基於上述檔案所包含的知識。
1. 您現在可以提出與該資料相關的問題，並獲得紮實的回應。
1. 範例：`customer_info_10.json` 描述 Amanda Perez 所進行的 3 筆購買

回到帶有 Container App 端點的瀏覽器分頁，提出問題：`Amanda Perez 擁有什麼產品？`。您應該會看到如下：

![Data](../../../../../translated_images/zh-MO/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. 代理操場

讓我們透過在代理操場中試用代理，更深入理解 Microsoft Foundry 的功能。

1. 回到 Microsoft Foundry 的 `Agents` 頁面 - 選取預設代理
1. 點擊 `Try in Playground` 選項 - 您將看到如下操場介面
1. 問相同的問題：`Amanda Perez 擁有什麼產品？`

    ![Data](../../../../../translated_images/zh-MO/09-ask-in-playground.a1b93794f78fa676.webp)

您會得到相同（或類似的）回應，但還會得到額外資訊，可用以理解代理應用的品質、成本與效能。例如：

1. 請注意回應中引用支撐答案的資料檔案
1. 滑鼠懸停於任何檔案標籤上 - 該資料是否與您的問題及顯示回應相符？

回應下方還有一行 _統計_ 資訊。

1. 對任何一項指標（例如安全性）滑鼠懸停。您會看到類似如下畫面
1. 評估的安全性等級是否符合您對回應安全性的直覺？

      ![Data](../../../../../translated_images/zh-MO/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. 內建可觀察性

可觀察性指的是為您的應用程式加裝儀表，使其產生可供理解、除錯及優化操作的資料。為了體驗這一點：

1. 點擊 `View Run Info` 按鈕 - 您將看到此畫面。這是[代理追蹤](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground)功能的實例。_您也可以點擊頂層選單的 Thread Logs 來取得此畫面_。

   - 了解代理執行的步驟及調用的工具
   - 了解回應的總 Token 數（與輸出 Token 使用量）
   - 了解延遲及執行中花費時間的環節

      ![Agent](../../../../../translated_images/zh-MO/10-view-run-info.b20ebd75fef6a1cc.webp)

1. 點擊 `Metadata` 標籤可查看執行的額外屬性，這可能對日後除錯有用。

      ![Agent](../../../../../translated_images/zh-MO/11-view-run-info-metadata.7966986122c7c2df.webp)


1. 點擊 `Evaluations` 標籤查看代理回應的自動評估。如安全性評估（例如自我傷害）與代理特定評估（例如意圖解析、任務遵循）。

      ![Agent](../../../../../translated_images/zh-MO/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. 最後，點擊側邊選單中的 `Monitoring` 標籤。

      - 選擇顯示頁面的「資源使用」標籤，查看指標。
      - 追蹤應用程式使用成本（Tokens）及負載（請求數）。
      - 追蹤應用程式從第一字元（輸入處理）到最後字元（輸出）的延遲。

      ![Agent](../../../../../translated_images/zh-MO/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. 環境變數

到目前為止，我們已在瀏覽器中完成部署，並驗證基礎設施已布建且應用程式能運作。但要以 _程式碼優先_ 方式工作，需配置本地開發環境的相關變數，用於操作這些資源。使用 `azd` 可輕鬆完成。

1. Azure Developer CLI [使用環境變數](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash)來儲存和管理應用程式部署的設定。

1. 環境變數存於 `.azure/<env-name>/.env` 中，此路徑將其範圍限定至部署時使用的 `env-name` 環境，有助於分隔同一儲存庫中不同部署目標的環境。

1. 每次 `azd` 執行特定命令（例如 `azd up`）時，均會自動載入環境變數。請注意 `azd` 不會自動讀取作業系統層級的環境變數（例如在 shell 中設置的變數）— 請改用 `azd set env` 和 `azd get env` 在腳本間傳遞資訊。


讓我們試試幾個指令：

1. 取得此環境中 `azd` 設定的所有環境變數：

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      您會看到類似的內容：

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. 取得特定值 - 例如，我要知道是否設置了 `AZURE_AI_AGENT_MODEL_NAME` 變數

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      您會看到如下 - 預設未設置！

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. 為 `azd` 設置新的環境變數。此處更新代理模型名稱。_注意：所做變更會立即反映至 `.azure/<env-name>/.env` 文件中。_

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      現在，應該能找到該值了：

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. 注意有些資源是持久性的（例如模型部署），不只是 `azd up` 即可強制重新部署。我們來嘗試拆除原部署，然後用變更過的環境變數重新部署。

1. <strong>刷新</strong> 如果您先前使用 azd 模板部署了基礎設施，可以使用此命令_刷新_本地環境變數的狀態，以符合您 Azure 部署的現況：

      ```bash title="" linenums="0"
      azd env refresh
      ```


      這是一種強大的方法，可以在兩個或多個本地開發環境（例如，多名開發人員的團隊）間同步環境變數 —— 讓已部署的基礎架構成為環境變數狀態的真實依據。團隊成員只需_刷新_變數即可恢復同步。

---

## 9. 恭喜你 🏆

你剛剛完成了一個端對端的工作流程，內容包括：

- [X] 選擇了你想使用的 AZD 範本
- [X] 在受支持的開發環境中打開範本
- [X] 部署範本並確認其運作正常

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->