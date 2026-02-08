# 2. 驗證範本

!!! tip "在本模組結束時您將能夠"

    - [ ] 分析 AI 解決方案架構
    - [ ] 了解 AZD 部署工作流程
    - [ ] 使用 GitHub Copilot 取得 AZD 使用協助
    - [ ] **實作 2：** 部署並驗證 AI Agents 範本

---


## 1. 介紹

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) or `azd` 是一個開源的命令列工具，可在將應用程式建置並部署到 Azure 時簡化開發人員的工作流程。 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) 是標準化的儲存庫，包含範例應用程式程式碼、_基礎結構即程式碼_ 資產，以及 `azd` 設定檔，以構成一致的解決方案架構。佈建基礎架構變得像執行 `azd provision` 指令那麼簡單，而使用 `azd up` 則可讓您一次同時佈建基礎架構 **並** 部署應用程式！

因此，啟動您的應用程式開發流程可以很簡單：尋找最貼近您應用程式與基礎架構需求的 _AZD Starter template_，然後自訂該儲存庫以符合您的情境需求。

在開始之前，請先確認您已安裝 Azure Developer CLI。

1. 在 VS Code 終端機中開啟並輸入以下指令：

      ```bash title="" linenums="0"
      azd version
      ```

1. 您應該會看到類似如下的畫面！

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**您現在已準備好使用 azd 選擇並部署範本**

---

## 2. 範本選擇

Microsoft Foundry 平台附帶一組 [建議的 AZD 範本](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)，涵蓋像是 _多代理工作流程自動化_ 和 _多模態內容處理_ 等熱門解決方案情境。您也可以透過 Microsoft Foundry 入口網站來探索這些範本。

1. Visit [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. 在出現提示時登入 Microsoft Foundry 入口網站 - 您會看到類似如下畫面。

![挑選範本](../../../../../translated_images/zh-MO/01-pick-template.60d2d5fff5ebc374.webp)


The **Basic** options are your starter templates:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) 會將一個基礎聊天應用程式 _與您的資料一起_ 部署到 Azure Container Apps。使用此範本可探索基本的 AI 聊天機器人情境。
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) 也會部署一個標準的 AI Agent（搭配 Foundry Agents）。用來熟悉包含工具與模型的代理式 AI 解決方案。

在新分頁開啟第二個連結（或點選相關卡片的 `Open in GitHub`）。您應該會看到此 AZD 範本的儲存庫。花一點時間瀏覽 README。應用程式架構如下：

![架構圖](../../../../../translated_images/zh-MO/architecture.8cec470ec15c65c7.webp)

---

## 3. 啟動範本

讓我們嘗試部署此範本並確保它是有效的。我們將遵循 [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) 區段的指引。

1. 點擊 [此連結](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) - 確認預設動作為 `Create codespace`
1. 這會在新分頁開啟 - 等待 GitHub Codespaces 會話載入完成
1. 在 Codespaces 中開啟 VS Code 終端機 - 輸入下列指令：

   ```bash title="" linenums="0"
   azd up
   ```

Complete the workflow steps that this will trigger:

1. 系統會提示您登入 Azure - 按指示進行驗證
1. 輸入一個供您使用的唯一期環境名稱 - 例如：我使用 `nitya-mshack-azd`
1. 這會建立一個 `.azure/` 資料夾 - 您會看到一個以該環境名稱為名的子資料夾
1. 系統會提示您選擇訂閱名稱 - 選擇預設值
1. 系統會提示您選擇位置 - 使用 `East US 2`

接下來，等待佈建完成。**這需要 10-15 分鐘**

1. 完成後，您的主控台會顯示類似如下的 SUCCESS 訊息：
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. 您的 Azure 入口網站現在會有一個以該環境名稱命名的已佈建資源群組：

      ![已佈建基礎架構](../../../../../translated_images/zh-MO/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **您現在已可驗證已部署的基礎架構與應用程式**。

---

## 4. 範本驗證

1. 前往 Azure 入口網站的 [Resource Groups](https://portal.azure.com/#browse/resourcegroups) 頁面 - 在提示時登入
1. 點選您環境名稱的資源群組 - 您會看到上方的頁面

      - 點擊 Azure Container Apps 資源
      - 點擊位於 _Essentials_ 區段（右上）的 Application Url

1. 您應該會看到一個託管的應用程式前端介面，如下：

   ![應用程式](../../../../../translated_images/zh-MO/03-test-application.471910da12c3038e.webp)

1. 嘗試提出幾個 [sample questions](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. 問：```法國的首都是哪裡？``` 
      1. 問：```對兩人、200 美元以內最佳的帳篷是哪一款，並包含哪些特色？```

1. 您應該會收到類似下方所示的答案。_但這是如何運作的？_ 

      ![應用程式問答](../../../../../translated_images/zh-MO/03-test-question.521c1e863cbaddb6.webp)

---

## 5.  代理驗證

Azure Container App 部署了一個端點，該端點會連接到此範本在 Microsoft Foundry 專案中佈建的 AI Agent。讓我們看看這代表什麼。

1. 回到 Azure 入口網站中您資源群組的 _Overview_ 頁面

1. 在該列表中點選 `Microsoft Foundry` 資源

1. 您應該會看到此畫面。點擊 `Go to Microsoft Foundry Portal` 按鈕。 
   ![Foundry](../../../../../translated_images/zh-MO/04-view-foundry-project.fb94ca41803f28f3.webp)

1. 您應該會看到您的 AI 應用程式的 Foundry 專案頁面
   ![Project](../../../../../translated_images/zh-MO/05-visit-foundry-portal.d734e98135892d7e.webp)

1. 點選 `Agents` - 您會看到專案中已佈建的預設 Agent
   ![Agents](../../../../../translated_images/zh-MO/06-visit-agents.bccb263f77b00a09.webp)

1. 選取它 - 您會看到 Agent 詳情。請注意以下事項：

      - 該代理預設（始終）使用 File Search
      - 代理的 `Knowledge` 顯示已上傳 32 個檔案（用於檔案搜尋）
      ![Agents](../../../../../translated_images/zh-MO/07-view-agent-details.0e049f37f61eae62.webp)

1. 在左側選單中尋找 `Data+indexes` 選項並點選以檢視詳細資訊。 

      - 您應該會看到已上傳用於知識庫的 32 個資料檔案。
      - 這些應對應到 `src/files` 底下的 12 個客戶檔案和 20 個產品檔案 
      ![Data](../../../../../translated_images/zh-MO/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**您已驗證代理運作！** 

1. 代理的回應是以那些檔案中的知識為基礎。 
1. 您現在可以針對該資料提問，並獲得有依據的回應。
1. 例如：`customer_info_10.json` 描述了 "Amanda Perez" 所做的 3 筆購買

返回有 Container App 端點的瀏覽器分頁並詢問：`Amanda Perez 擁有哪些產品？`。您應該會看到類似如下的畫面：

![資料查詢結果](../../../../../translated_images/zh-MO/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. 代理人操場

讓我們透過在代理人操場試用該代理，來對 Microsoft Foundry 的功能建立更多直覺。 

1. 回到 Microsoft Foundry 的 `Agents` 頁面 - 選取預設代理
1. 點選 `Try in Playground` 選項 - 您應該會看到類似的 Playground 使用者介面
1. 再次詢問同一個問題：`Amanda Perez 擁有哪些產品？`

    ![資料](../../../../../translated_images/zh-MO/09-ask-in-playground.a1b93794f78fa676.webp)

您會得到相同（或相似）的回應 — 但您也會看到額外資訊，可用來了解您的代理式應用程式的品質、成本與效能。例如：

1. 注意回應中引用了用來「落地」回應的資料檔案
1. 將游標移到這些檔案標籤上 — 該資料是否與您的查詢和顯示的回應相符？

您也會在回應下方看到一列統計資料。

1. 將游標移到任一指標上 - 例如 Safety。您會看到類似的資訊
1. 評估出的安全性等級是否符合您對回應安全性的直覺判斷？

      ![資料](../../../../../translated_images/zh-MO/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. 內建可觀察性

可觀察性是指為應用程式加裝監控以產生可用來了解、除錯和優化其運作的資料。為了讓您感受一下這點：

1. 點選 `View Run Info` 按鈕 - 您應該會看到此檢視。這是 [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) 的實際範例。_您也可以透過在頂層選單點選 Thread Logs 取得此檢視_。

   - 了解執行步驟與代理啟用的工具
   - 了解回應的總 Token 數（相對於輸出 token 的使用）
   - 了解延遲以及在執行過程中時間消耗的位置

      ![Agent](../../../../../translated_images/zh-MO/10-view-run-info.b20ebd75fef6a1cc.webp)

1. 點選 `Metadata` 分頁以查看該執行的其他屬性，這些屬性可能為日後除錯問題提供有用的脈絡。   

      ![Agent](../../../../../translated_images/zh-MO/11-view-run-info-metadata.7966986122c7c2df.webp)


1. 點選 `Evaluations` 分頁以查看針對代理回應所做的自動評估。這些包含安全性評估（例如，自我傷害）和代理特定的評估（例如，意圖解析、任務遵循）。

      ![Agent](../../../../../translated_images/zh-MO/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. 最後，點選側邊選單的 `Monitoring` 分頁。

      - 在顯示的頁面中選取 `Resource usage` 分頁 - 檢視相關指標。
      - 追蹤應用程式在成本（tokens）與負載（請求）方面的使用情形。
      - 追蹤應用程式從接收請求到第一個位元組（輸入處理）與最後一個位元組（輸出）的延遲。

      ![Agent](../../../../../translated_images/zh-MO/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. 環境變數

到目前為止，我們已經透過瀏覽器完成了部署流程，並驗證了基礎架構已佈建且應用程式可運作。但要以「程式碼優先」的方式處理應用程式，我們需要在本機開發環境中設定與這些資源互動所需的相關變數。使用 `azd` 可以讓這件事變得簡單。

1. Azure Developer CLI [使用環境變數](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) 來儲存和管理應用程式部署的設定。

1. 環境變數儲存在 `.azure/<env-name>/.env` 中—這可將它們範圍限制到部署時使用的 `env-name` 環境，並幫助您在同一儲存庫中隔離不同部署目標的環境。

1. 每當 `azd` 執行特定命令（例如 `azd up`）時，環境變數會自動載入。請注意，`azd` 不會自動讀取作業系統層級的環境變數（例如在 shell 中設定的）—應改用 `azd set env` 和 `azd get env` 在腳本中傳遞資訊。


我們來試幾個指令：

1. 取得此環境中為 `azd` 設定的所有環境變數：

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      您會看到類似的輸出：

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4o-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. 取得特定的值 - 例如，我想知道是否設定了 `AZURE_AI_AGENT_MODEL_NAME` 的值

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      您會看到類似如下 - 預設並未設定此值！

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. 為 `azd` 設定一個新的環境變數。在此範例中，我們更新代理的模型名稱。_注意：任何變更會立即反映在 `.azure/<env-name>/.env` 檔案中。_

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      現在，我們應該會找到該值已被設定：

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. 請注意，某些資源是持續性的（例如模型部署），可能僅靠 `azd up` 並不足以強制重新部署。讓我們嘗試拆除原始部署，並在變更環境變數後重新部署。

1. **重新整理** 如果您之前使用 azd 範本部署過基礎架構 - 您可以使用此指令根據 Azure 部署的當前狀態來 _重新整理_ 本機環境變數的狀態：

      ```bash title="" linenums="0"
      azd env refresh
      ```

      這是一種強而有力的方法，可以在兩個或更多本地開發環境之間 _同步_ 環境變數（例如，擁有多名開發人員的團隊） - 讓已部署的基礎設施成為環境變數狀態的真實依據。團隊成員只需 _刷新_ 變數即可回復同步。

---

## 9. 恭喜 🏆

你剛完成了一個端到端的工作流程，包含：

- [X] 選擇了你想使用的 AZD 範本
- [X] 使用 GitHub Codespaces 啟動了該範本 
- [X] 部署了該範本並驗證其運作

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件由 AI 翻譯服務「Co‑op Translator」(https://github.com/Azure/co-op-translator) 自動翻譯而成。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的原文應視為具權威性的版本。若為重要資訊，建議採用專業人工翻譯。我們對因使用本翻譯而引致的任何誤解或錯誤詮釋概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->