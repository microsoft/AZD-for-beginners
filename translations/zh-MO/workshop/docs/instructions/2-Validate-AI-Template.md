# 2. Validate a Template

> Validated against `azd 1.25.6` in June 2026.

!!! tip "在本模組結束時您將能夠"

    - [ ] 分析 AI 解決方案架構
    - [ ] 了解 AZD 部署工作流程
    - [ ] 使用 GitHub Copilot 協助 AZD 使用
    - [ ] **Lab 2:** 部署並驗證 AI Agents 範本

---


## 1. 介紹

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) or `azd` 是一個開源的命令列工具，能簡化在 Azure 上建置和部署應用程式時的開發者工作流程。

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) 是標準化的儲存庫，包含範例應用程式程式碼、基礎架構即程式碼資產，以及用於一致解決方案架構的 `azd` 設定檔。建置基礎架構只需一個 `azd provision` 指令 — 而使用 `azd up` 則可在一次執行中同時建立基礎架構並部署應用程式！

因此，啟動您的應用程式開發流程可以非常簡單：尋找最接近您應用程式與基礎架構需求的 _AZD Starter template_，然後自訂儲存庫以符合您的情境需求。

在開始之前，請先確定您已安裝 Azure Developer CLI。

1. 在 VS Code 終端機中開啟並輸入此指令：

      ```bash title="" linenums="0"
      azd version
      ```

1. 您應該會看到類似下列的結果！

      ```bash title="" linenums="0"
      azd version 1.25.6 (commit <current-build>)
      ```

**您現在已準備好使用 azd 選取並部署範本**

---

## 2. 範本選擇

Microsoft Foundry 平台附帶一組 [建議的 AZD 範本](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)，涵蓋熱門的解決方案情境，例如 _多代理工作流程自動化_ 和 _多模態內容處理_。您也可以透過 Microsoft Foundry 入口網站來探索這些範本。

1. 訪問 [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. 在提示時登入 Microsoft Foundry 入口網站 — 您會看到類似以下的畫面。

![挑選範本](../../../../../translated_images/zh-MO/01-pick-template.60d2d5fff5ebc374.webp)


**Basic** 選項是您的入門範本：

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) 可將一個基本的聊天應用程式 _連同您的資料_ 部署到 Azure Container Apps。使用此範本來探索基本的 AI 聊天機器人情境。
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) 也會部署一個標準的 AI Agent（使用 Foundry Agents）。使用此範本來熟悉包含工具與模型的代理式 AI 解決方案。

在新的瀏覽器分頁中開啟第二個連結（或在相關卡片上點選 `Open in GitHub`）。您應該會看到此 AZD 範本的儲存庫。花一點時間瀏覽 README。應用程式架構如下圖所示：

![架構圖](../../../../../translated_images/zh-MO/architecture.8cec470ec15c65c7.webp)

---

## 3. 範本啟用

讓我們嘗試部署此範本並確定它是有效的。我們將依照 [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) 區段的指引進行。

1. 為範本儲存庫選擇一個工作環境：

      - **GitHub Codespaces**：點選 [this link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) 並確認 `Create codespace`
      - **本機 clone 或開發容器**：Clone `Azure-Samples/get-started-with-ai-agents` 並在 VS Code 中開啟

1. 等待 VS Code 終端機就緒，然後輸入下列指令：

   ```bash title="" linenums="0"
   azd up
   ```

完成此指令將觸發的工作流程步驟：

1. 系統會提示您登入 Azure — 按指示進行驗證
1. 輸入一個對您唯一的環境名稱 — 例如，我使用 `nitya-mshack-azd`
1. 這會建立一個 `.azure/` 資料夾 — 您會看到一個以環境名稱為子資料夾
1. 系統會提示您選取訂閱名稱 — 選擇預設
1. 系統會提示您輸入位置 — 使用 `East US 2`

現在，等待佈建完成。**這需要 10–15 分鐘**

1. 完成後，您的主控台會顯示類似此的 SUCCESS 訊息：
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. 您的 Azure 入口網站現在會有一個以該環境名稱命名的已佈建資源組：

      ![佈建的基礎架構](../../../../../translated_images/zh-MO/02-provisioned-infra.46c706b14f56e0bf.webp)

1. <strong>您現在已準備好驗證已部署的基礎架構與應用程式</strong>。

---

## 4. 範本驗證

1. 訪問 Azure 入口網站的 [Resource Groups](https://portal.azure.com/#browse/resourcegroups) 頁面 - 在提示時登入
1. 點選您環境名稱的 RG - 您會看到上述頁面

      - 點選 Azure Container Apps 資源
      - 在 _Essentials_ 區段（右上）點選 Application Url

1. 您應該會看到一個託管的應用程式前端 UI，如下所示：

   ![應用程式介面](../../../../../translated_images/zh-MO/03-test-application.471910da12c3038e.webp)

1. 嘗試問幾個 [範例問題](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. 問：```What is the capital of France?``` 
      1. 問：```What's the best tent under $200 for two people, and what features does it include?```

1. 您應該會得到類似下方所示的回答。_但這是如何運作的？_

      ![提問示例](../../../../../translated_images/zh-MO/03-test-question.521c1e863cbaddb6.webp)

---

## 5. 代理 (Agent) 驗證

Azure Container App 會部署一個端點，連接到為此範本在 Microsoft Foundry 專案中佈建的 AI Agent。讓我們看看這代表什麼。

1. 返回 Azure 入口網站中您資源組的 _Overview_ 頁面

1. 在該清單中點選 `Microsoft Foundry` 資源

1. 您應該會看到這個畫面。點選 `Go to Microsoft Foundry Portal` 按鈕。 
   ![Foundry 入口](../../../../../translated_images/zh-MO/04-view-foundry-project.fb94ca41803f28f3.webp)

1. 您應該會看到您 AI 應用程式的 Foundry Project 頁面
   ![專案頁面](../../../../../translated_images/zh-MO/05-visit-foundry-portal.d734e98135892d7e.webp)

1. 點選 `Agents` - 您會看到專案中已佈建的預設 Agent
   ![Agents 列表](../../../../../translated_images/zh-MO/06-visit-agents.bccb263f77b00a09.webp)

1. 選取該 Agent - 您會看到 Agent 詳細資訊。請注意以下事項：

      - 該 agent 預設（恆常）使用 File Search
      - agent 的 `Knowledge` 顯示已上傳 32 個檔案（用於檔案搜尋）
      ![Agent 詳細](../../../../../translated_images/zh-MO/07-view-agent-details.0e049f37f61eae62.webp)

1. 在左側選單中尋找 `Data+indexes` 選項並點選以查看細節。 

      - 您應該會看到已上傳作為知識的 32 個資料檔案。
      - 這些檔案對應到 `src/files` 下的 12 個客戶檔案與 20 個產品檔案
      ![資料索引](../../../../../translated_images/zh-MO/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**您已驗證 Agent 運作！**

1. Agent 的回應是根據那些檔案中的知識作為基礎的。
1. 現在您可以詢問與該資料相關的問題，並獲得有依據的回應。
1. 範例：`customer_info_10.json` 描述了 "Amanda Perez" 的 3 筆購買紀錄

回到有 Container App 端點的瀏覽器分頁並問：`What products does Amanda Perez own?`。您應該會看到類似下列的結果：

![在 Container App 詢問](../../../../../translated_images/zh-MO/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

讓我們透過在 Agents Playground 中試用該 Agent，來更深入了解 Microsoft Foundry 的功能。

1. 回到 Microsoft Foundry 的 `Agents` 頁面 - 選取預設 agent
1. 點選 `Try in Playground` 選項 - 您應該會看到類似的 Playground UI
1. 提出相同問題：`What products does Amanda Perez own?`

    ![在 Playground 詢問](../../../../../translated_images/zh-MO/09-ask-in-playground.a1b93794f78fa676.webp)

您會獲得相同（或相似）的回應 — 但您也會得到額外的資訊，可用來理解 agentic 應用程式的品質、成本與效能。例如：

1. 注意回應有引用用來「根植」回應的資料檔案
1. 將滑鼠移到任何這些檔案標籤上方 — 該資料是否與您的查詢與顯示的回應相符？

您也會看到回應下方有一列統計資訊。

1. 將滑鼠移到任一指標上方 — 例如 Safety。您會看到類似下列的資訊
1. 評估的分級是否符合您對回應安全等級的直覺判斷？

      ![查看執行資訊量表](../../../../../translated_images/zh-MO/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. 內建可觀察性

可觀察性是指為應用程式加上度量與紀錄，以產生可用來理解、除錯與優化其運作的資料。要了解這一點：

1. 點選 `View Run Info` 按鈕 — 您會看到此畫面。這是 [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) 的示例。_您也可以透過在頂層選單點選 Thread Logs 取得此視圖_。

   - 了解執行步驟與 agent 所呼叫的工具
   - 了解回應的總 Token 數（與輸出 token 使用量的比較）
   - 了解延遲以及執行時間分布於何處

      ![Agent 執行資訊](../../../../../translated_images/zh-MO/10-view-run-info.b20ebd75fef6a1cc.webp)

1. 點選 `Metadata` 分頁以查看該執行的其他屬性，這些屬性可能在日後除錯問題時提供有用的背景資訊。   

      ![Metadata 視圖](../../../../../translated_images/zh-MO/11-view-run-info-metadata.7966986122c7c2df.webp)


1. 點選 `Evaluations` 分頁以查看對 agent 回應的自動評估。這些評估包括安全性評估（例如，自傷）以及 agent 特定評估（例如，意圖解析、任務遵循）。

      ![Evaluations 視圖](../../../../../translated_images/zh-MO/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. 最後，在側邊選單中點選 `Monitoring` 分頁。

      - 在顯示的頁面中選取 `Resource usage` 分頁 - 查看各項指標。
      - 以成本（tokens）和負載（requests）來追蹤應用程式使用情況。
      - 追蹤應用程式從接收輸入到輸出回應的延遲（first byte 與 last byte）。

      ![監控資源](../../../../../translated_images/zh-MO/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. 環境變數

到目前為止，我們已在瀏覽器中走過部署流程，並驗證基礎架構已佈建且應用程式可運作。但要以「程式碼為先」的方式與應用程式互動，我們需要在本機開發環境中設定與這些資源互動所需的相關變數。使用 `azd` 可以讓這件事變得簡單。

1. Azure Developer CLI [使用環境變數](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) 來儲存與管理應用程式部署的設定。

1. 環境變數儲存在 `.azure/<env-name>/.env` — 這將它們限定於部署期間所使用的 `env-name` 環境，並有助於在同一個儲存庫內隔離不同部署目標之間的環境。

1. 每當 `azd` 執行特定指令（例如 `azd up`）時，會自動載入環境變數。請注意，`azd` 不會自動讀取作業系統層級的環境變數（例如 shell 中設定的）— 而是使用 `azd set env` 與 `azd get env` 在腳本中傳遞資訊。


讓我們試幾個指令：

1. 取得在此環境中為 `azd` 設定的所有環境變數：

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      您會看到類似下列的結果：

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. 取得特定值 — 例如，我想知道是否設定了 `AZURE_AI_AGENT_MODEL_NAME` 值

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      您會看到類似下列結果 — 預設情況下此值未被設定！

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. 為 `azd` 設定一個新的環境變數。這裡我們更新 agent 的 model 名稱。_注意：任何變更都會立即反映在 `.azure/<env-name>/.env` 檔案中。_

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      現在，我們應該會發現該值已被設定：

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. 請注意，有些資源是持久性的（例如，模型部署），需要的不僅是 `azd up` 就能強制重新部署。讓我們嘗試拆除原始部署，並使用變更後的 env vars 重新部署。

1. <strong>重新整理</strong> 如果您先前使用 azd 範本已部署過基礎架構 — 您可以使用此指令根據 Azure 部署的目前狀態來 _刷新_ 本機環境變數的狀態：

      ```bash title="" linenums="0"
      azd env refresh
      ```

      這是一個強大方法，用來在兩個或以上的本地開發環境之間 _同步_ 環境變數 (例如，團隊內有多名開發人員) - 允許已部署的基礎設施成為環境變數狀態的真實依據。團隊成員只需 _重新整理_ 變數即可回復同步。

---

## 9. 恭喜你 🏆

你剛剛完成了一個端到端的工作流程，內容如下：

- [X] 已選擇您想使用的 AZD Template
- [X] 已在受支援的開發環境中開啟該範本
- [X] 已部署該範本並驗證其能正常運作

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->