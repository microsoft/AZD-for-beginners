# 2. 驗證範本

> 已於 2026 年 3 月使用 `azd 1.23.12` 驗證。

!!! tip "完成此模組後，您將能夠"

    - [ ] 分析 AI 解決方案架構
    - [ ] 了解 AZD 部署工作流程
    - [ ] 使用 GitHub Copilot 以協助 AZD 的使用
    - [ ] **實驗 2：** 部署並驗證 AI Agents 範本

---


## 1. 介紹

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) or `azd` 是一個開放原始碼的命令列工具，可在將應用程式建置並部署到 Azure 時簡化開發人員的工作流程。

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) 是一組標準化的儲存庫，包含範例應用程式程式碼、_基礎設施即程式碼_ 資產，以及用於一致性解決方案架構的 `azd` 設定檔。佈建基礎設施變得像執行一個 `azd provision` 命令一樣簡單，而使用 `azd up` 則可以一次性佈建基礎設施 <strong>並</strong> 部署您的應用程式！

因此，啟動您的應用程式開發流程可以很簡單：找到最接近您應用程式與基礎設施需求的 _AZD 起始範本_，然後自訂該儲存庫以符合您的情境需求。

在開始之前，請先確定您已安裝 Azure Developer CLI。

1. 打開 VS Code 終端機並輸入此命令：

      ```bash title="" linenums="0"
      azd version
      ```

1. 你應該會看到類似的輸出！

      ```bash title="" linenums="0"
      azd version 1.23.12 (commit <current-build>)
      ```

**您現在已準備好使用 azd 選擇並部署範本**

---

## 2. 範本選擇

Microsoft Foundry 平台附帶一組 [建議的 AZD 範本](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)，涵蓋像是多代理人工作流程自動化和多模態內容處理等熱門解決方案情境。您也可以透過 Microsoft Foundry 入口網站來探索這些範本。

1. 訪問 [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. 在出現提示時登入 Microsoft Foundry 入口網站 — 您會看到類似以下畫面。

![選擇範本](../../../../../translated_images/zh-HK/01-pick-template.60d2d5fff5ebc374.webp)


The **Basic** options are your starter templates:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) that deploys a basic chat application _with your data_ to Azure Container Apps. Use this to explore a basic AI chatbot scenario.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) that also deploys a standard AI Agent (with the Foundry Agents). Use this to get familiar with agentic AI solutions involving tools and models.

在新瀏覽器分頁中開啟第二個連結（或點選該卡片的 `Open in GitHub`）。您應該會看到此 AZD 範本的儲存庫。花一點時間瀏覽 README。應用程式架構如下圖所示：

![架構圖](../../../../../translated_images/zh-HK/architecture.8cec470ec15c65c7.webp)

---

## 3. 範本啟動

讓我們嘗試部署此範本並確保其有效。我們將依循 [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) 區段的指引。

1. 為範本儲存庫選擇開發環境：

      - **GitHub Codespaces**：點選 [this link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) 並確認 `Create codespace`
      - <strong>本機複製或開發容器</strong>：複製 `Azure-Samples/get-started-with-ai-agents` 並在 VS Code 中開啟

1. 等待直到 VS Code 終端機就緒，然後輸入以下命令：

   ```bash title="" linenums="0"
   azd up
   ```

完成此命令將觸發的工作流程步驟：

1. 系統會提示您登入 Azure — 按指示進行驗證
1. 輸入一個對您來說獨特的環境名稱 — 例如，我使用 `nitya-mshack-azd`
1. 這將建立一個 `.azure/` 資料夾 — 您會看到一個以該環境名稱命名的子資料夾
1. 系統會提示您選取訂閱名稱 — 選擇預設值
1. 系統會提示您選取位置 — 使用 `East US 2`

現在，請等候佈建完成。**這需要 10-15 分鐘**

1. 完成後，您的主控台會顯示類似的 SUCCESS 訊息：
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. 您的 Azure 入口網站現在會有一個已佈建的資源群組，名稱為該環境名稱：

      ![已佈署基礎架構](../../../../../translated_images/zh-HK/02-provisioned-infra.46c706b14f56e0bf.webp)

1. <strong>您現在已準備好驗證已佈建的基礎設施與應用程式</strong>。

---

## 4. 範本驗證

1. 前往 Azure 入口網站的 [Resource Groups](https://portal.azure.com/#browse/resourcegroups) 頁面 — 出現提示時登入
1. 點選您環境名稱對應的 RG — 您會看到前述頁面

      - 點選 Azure Container Apps 資源
      - 在 _Essentials_ 區段（右上）點選 Application Url

1. 您應該會看到一個託管的應用程式前端 UI，如下所示：

   ![應用程式](../../../../../translated_images/zh-HK/03-test-application.471910da12c3038e.webp)

1. 試著詢問幾個 [sample questions](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. 問：```What is the capital of France?``` 
      1. 問：```What's the best tent under $200 for two people, and what features does it include?```

1. 您應該會得到與下方相似的答案。_但這是如何運作的？_

      ![應用程式問答](../../../../../translated_images/zh-HK/03-test-question.521c1e863cbaddb6.webp)

---

## 5.  代理人驗證

The Azure Container App 佈署了一個端點，該端點會連接到此範本在 Microsoft Foundry 專案中所佈建的 AI Agent。我們來看看這代表什麼。

1. 返回 Azure 入口網站中您資源群組的 _Overview_ 頁面

1. 在該清單中點選 `Microsoft Foundry` 資源

1. 您應該會看到這個畫面。點選 `Go to Microsoft Foundry Portal` 按鈕。 
   ![Foundry](../../../../../translated_images/zh-HK/04-view-foundry-project.fb94ca41803f28f3.webp)

1. 您應該會看到該 AI 應用程式的 Foundry 專案頁面
   ![專案頁面](../../../../../translated_images/zh-HK/05-visit-foundry-portal.d734e98135892d7e.webp)

1. 點選 `Agents` — 您會看到在專案中佈建的預設 Agent
   ![代理人](../../../../../translated_images/zh-HK/06-visit-agents.bccb263f77b00a09.webp)

1. 選取它 — 您會看到 Agent 詳細資料。請注意以下內容：

      - 該 agent 預設使用 File Search（始終如此）
      - agent 的 `Knowledge` 顯示已上傳 32 個檔案（用於檔案搜尋）
      ![代理人](../../../../../translated_images/zh-HK/07-view-agent-details.0e049f37f61eae62.webp)

1. 在左側選單中尋找 `Data+indexes` 選項並點選以查看詳細資訊。 

      - 您應該會看到用於知識的 32 個已上傳資料檔案。
      - 這些檔案對應到 `src/files` 底下的 12 個客戶檔案與 20 個產品檔案
      ![資料與索引](../../../../../translated_images/zh-HK/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**您已驗證代理人運作！** 

1. 代理人的回應是以這些檔案中的知識為依據。
1. 現在您可以針對那些資料提問，並取得有根據的回應。
1. 範例：`customer_info_10.json` 描述 "Amanda Perez" 的 3 筆購買紀錄

回到有 Container App 端點的瀏覽器分頁並詢問：`What products does Amanda Perez own?`。您應該會看到類似下列畫面：

![資料查詢](../../../../../translated_images/zh-HK/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

讓我們透過在 Agents Playground 中試玩該 Agent，來建立對 Microsoft Foundry 功能的更多直覺理解。

1. 返回 Microsoft Foundry 的 `Agents` 頁面 — 選取預設 agent
1. 點選 `Try in Playground` 選項 — 您應該會看到類似的 Playground UI
1. 詢問相同問題：`What products does Amanda Perez own?`

    ![資料](../../../../../translated_images/zh-HK/09-ask-in-playground.a1b93794f78fa676.webp)

您會得到相同（或相似）的回應 — 但您也會看到額外資訊，可用來了解代理人應用程式的品質、成本與效能。例如：

1. 注意回應引用了用來作為回應依據的資料檔案
1. 將滑鼠移到任何這些檔案標籤上 — 該資料是否與您的查詢和顯示的回應相符？

您還會在回應下面看到一列 _stats_。

1. 將滑鼠移到任一度量上 — 例如 Safety。您會看到類似下列畫面
1. 所評估的分數是否符合您對回應安全性等級的直覺判斷？

      ![執行資訊計量](../../../../../translated_images/zh-HK/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Built-in Observability

可觀察性是指為您的應用程式加入監控與量測，以產生可用來了解、除錯和優化其運作的資料。要了解這部分：

1. 點選 `View Run Info` 按鈕 — 您應該會看到這個視圖。這是 [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) 的一個實例。_您也可以透過頂層選單的 Thread Logs 來取得此視圖_。

   - 了解執行步驟與 agent 使用的工具
   - 了解回應的總 Token 數（與輸出 Token 使用量）
   - 了解延遲與執行過程中時間的分配

      ![代理人](../../../../../translated_images/zh-HK/10-view-run-info.b20ebd75fef6a1cc.webp)

1. 點選 `Metadata` 分頁以查看此執行的其他屬性，這些屬性可能在後續除錯時提供有用的背景資訊。   

      ![代理人](../../../../../translated_images/zh-HK/11-view-run-info-metadata.7966986122c7c2df.webp)


1. 點選 `Evaluations` 分頁以查看對代理人回應所做的自動評估。這些包含安全性評估（例如自傷風險）與代理人特定的評估（例如意圖解析、任務遵循度）。

      ![代理人](../../../../../translated_images/zh-HK/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. 最後，點選側欄選單中的 `Monitoring` 分頁。

      - 在顯示頁面中選取 `Resource usage` 分頁 — 並查看指標。
      - 以成本（tokens）與負載（請求數）來追蹤應用程式使用情形。
      - 追蹤應用程式從接收輸入到輸出結果的延遲（first byte、last byte）。

      ![代理人](../../../../../translated_images/zh-HK/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. 環境變數

到目前為止，我們已在瀏覽器中完成部署流程，並驗證基礎設施已佈建且應用程式運作正常。但若要以「程式碼優先」的方式操作應用程式，我們需要在本機開發環境中設定與這些資源互動所需的相關變數。使用 `azd` 可以讓這件事很簡單。

1. Azure Developer CLI [使用環境變數](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) 來儲存與管理應用程式部署的設定值。

1. 環境變數儲存在 `.azure/<env-name>/.env` — 這會將它們範圍限定到在部署時使用的 `env-name` 環境，並幫助您在同一個儲存庫中隔離不同的部署環境。

1. 當 `azd` 執行特定命令（例如 `azd up`）時，會自動載入環境變數。請注意，`azd` 不會自動讀取 _作業系統層級_ 的環境變數（例如在 shell 中設定的）— 而是使用 `azd set env` 與 `azd get env` 在腳本內部傳遞資訊。


讓我們試試幾個命令：

1. 取得在此環境中為 `azd` 設定的所有環境變數：

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      你會看到類似以下內容：

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. 取得特定值 — 例如，我想知道是否已設置 `AZURE_AI_AGENT_MODEL_NAME` 值

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      你會看到像這樣的輸出 — 預設情況下它尚未設定！

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. 為 `azd` 設定一個新的環境變數。這裡我們更新 agent 的模型名稱。_注意：所做的任何變更會立即反映在 `.azure/<env-name>/.env` 檔案中。_

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      現在，我們應該可以找到該值已被設定：

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. 請注意某些資源是具持久性的（例如模型部署），僅靠 `azd up` 可能不足以強制重新部署。讓我們嘗試拆除原本的部署，並在變更環境變數後重新部署。

1. <strong>重新整理</strong> 如果您之前已使用 azd 範本部署過基礎設施 — 您可以使用此命令根據目前 Azure 部署的狀態，來 _重新整理_ 本機環境變數的狀態：

      ```bash title="" linenums="0"
      azd env refresh
      ```

      這是一個強大方法，可在兩個或以上的本地開發環境之間 _同步_ 環境變數（例如：有多名開發者的團隊） - 讓已部署的基礎設施成為環境變數狀態的真實來源。團隊成員只需 _重新整理_ 變數即可回復同步。

---

## 9. 恭喜 🏆

你剛完成了一個端到端的工作流程，當中你已：

- [X] 已選擇想要使用的 AZD 範本
- [X] 已在支援的開發環境中開啟該範本
- [X] 已部署該範本並驗證可正常運作

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們致力於確保準確性，請注意自動翻譯可能包含錯誤或不準確之處。原始語言的原件應被視為具權威性的來源。對於關鍵資訊，建議採用專業人工翻譯。我們不就因使用本翻譯而產生的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->