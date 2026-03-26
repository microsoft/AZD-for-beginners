# 2. 驗證模板

!!! tip "在本單元結束時您將能夠"

    - [ ] 分析 AI 解決方案架構
    - [ ] 了解 AZD 部署工作流程
    - [ ] 使用 GitHub Copilot 取得 AZD 使用協助
    - [ ] **實驗 2：** 部署及驗證 AI Agents 模板

---


## 1. 介紹

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) 或 `azd` 是一個開源命令列工具，可簡化在 Azure 上建立和部署應用程式時的開發人員工作流程。

[AZD 模板](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) 是標準化的儲存庫，包含範例應用程式程式碼、_基礎設施即程式碼_ 資產，以及用於整合解決方案架構的 `azd` 配置檔。基礎設施的配置只需一個 `azd provision` 指令即可完成，而使用 `azd up` 則可以同時完成基礎設施配置與應用程式部署！

因此，啟動您的應用程式開發流程就像是找到最接近您應用程式和基礎設施需求的 _AZD Starter 模板_，然後根據您的情境需求自訂儲存庫一樣簡單。

在開始之前，請確保您已安裝 Azure Developer CLI。

1. 開啟 VS Code 終端機並輸入以下指令：

      ```bash title="" linenums="0"
      azd version
      ```

1. 您應該會看到類似這樣的畫面！

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**您現在已準備好使用 azd 選取並部署模版**

---

## 2. 模板選擇

Microsoft Foundry 平台提供一組[推薦的 AZD 模板](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)，涵蓋多代理工作流程自動化和多模態內容處理等熱門解決方案情境。您也可以透過造訪 Microsoft Foundry 入口網站來探索這些模板。

1. 前往 [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. 提示登入 Microsoft Foundry 入口網站時進行登入 - 您會看到類似下圖的界面。

![Pick](../../../../../translated_images/zh-HK/01-pick-template.60d2d5fff5ebc374.webp)


**Basic** 選項是您的入門模板：

1. [ ] [使用 AI Chat 入門](https://github.com/Azure-Samples/get-started-with-ai-chat) 可部署一個基本的聊天應用程式，並使用您的資料部署至 Azure Container Apps。用此來探索基本的 AI 聊天機器人場景。
1. [X] [使用 AI Agents 入門](https://github.com/Azure-Samples/get-started-with-ai-agents) 亦可部署標準的 AI Agent（含 Foundry Agents）。用此熟悉涉及工具與模型的代理式 AI 解決方案。

請在新瀏覽器標籤中開啟第二個連結（或按相關卡片的「Open in GitHub」）。您應該會看到此 AZD 模板的儲存庫，花一點時間瀏覽 README。應用程式架構如下圖所示：

![Arch](../../../../../translated_images/zh-HK/architecture.8cec470ec15c65c7.webp)

---

## 3. 模板啟動

讓我們嘗試部署此模板，確保它有效。我們將依循 [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) 節中的指引。

1. 點擊[此連結](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) - 確認將預設動作設定為「Create codespace」
1. 開啟新的瀏覽器標籤 - 等待 GitHub Codespaces 工作階段載入完成
1. 在 Codespaces 的 VS Code 終端機中輸入以下指令：

   ```bash title="" linenums="0"
   azd up
   ```

完成此指令觸發的工作流程步驟：

1. 系統會提示您登入 Azure - 按照指示完成驗證
1. 輸入專屬的唯一環境名稱 - 例如，我使用 `nitya-mshack-azd`
1. 此操作會建立 `.azure/` 資料夾 - 您會看到一個以環境名稱命名的子資料夾
1. 系統會提示選擇訂閱名稱 - 選擇預設
1. 系統會提示選擇地區 - 使用 `East US 2`

接著，等待基礎設施配置完成。**這大約需 10-15 分鐘**

1. 完成時，您的終端機會顯示類似成功訊息：
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. 您的 Azure 入口網站現在將有一個使用該環境名稱的資源群組：

      ![Infra](../../../../../translated_images/zh-HK/02-provisioned-infra.46c706b14f56e0bf.webp)

1. <strong>您現在已準備好驗證已部署的基礎設施和應用程式</strong>。

---

## 4. 模板驗證

1. 前往 Azure 入口網站的[資源群組](https://portal.azure.com/#browse/resourcegroups)頁面 - 於提示時登入
1. 點選您環境名稱的資源群組 - 會看到上述畫面

      - 點擊 Azure Container Apps 資源
      - 點擊 _Essentials_ 區塊（右上方）的應用程式 URL

1. 您應該會看到類似這樣的託管應用程式前端 UI：

   ![App](../../../../../translated_images/zh-HK/03-test-application.471910da12c3038e.webp)

1. 試著問幾個[範例問題](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. 問：```法國的首都是哪裡？```
      1. 問：```200 美元以下的最佳雙人帳篷是什麼？包括哪些功能？```

1. 您應該會得到類似下圖的回答。_那這到底是怎麼運作的呢？_

      ![App](../../../../../translated_images/zh-HK/03-test-question.521c1e863cbaddb6.webp)

---

## 5. 代理驗證

Azure Container App 部署了一個端點，連結到本模板中 Microsoft Foundry 專案裡配置的 AI Agent。我們來看看這代表什麼。

1. 返回您的資源群組 Azure 入口網站 _總覽_ 頁面

1. 點選列表中的 `Microsoft Foundry` 資源

1. 您會看到此頁面。點擊 `Go to Microsoft Foundry Portal` 按鈕。
   ![Foundry](../../../../../translated_images/zh-HK/04-view-foundry-project.fb94ca41803f28f3.webp)

1. 您將會看到 AI 應用程式的 Foundry 專案頁面
   ![Project](../../../../../translated_images/zh-HK/05-visit-foundry-portal.d734e98135892d7e.webp)

1. 點擊 `Agents` - 您會看到專案中的預設 Agent
   ![Agents](../../../../../translated_images/zh-HK/06-visit-agents.bccb263f77b00a09.webp)

1. 選取它 - 查看 Agent 詳情。請注意以下說明：

      - 該 agent 預設使用檔案搜尋（永遠）
      - agent 的 `Knowledge` 表明它已上傳 32 個檔案（用於檔案搜尋）
      ![Agents](../../../../../translated_images/zh-HK/07-view-agent-details.0e049f37f61eae62.webp)

1. 在左側選單中尋找 `Data+indexes` 選項並點擊查看詳細資料。

      - 您會看到用於知識的 32 個數據檔案已上傳。
      - 這些檔案對應於 `src/files` 中的 12 個客戶檔案及 20 個產品檔案
      ![Data](../../../../../translated_images/zh-HK/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**您已成功驗證 Agent 運作！**

1. 該 agent 的回應是以這些檔案中的知識為基礎。
1. 您現在可以詢問與這些資料有關的問題，並獲得有根據的回答。
1. 例如：`customer_info_10.json` 描述 "Amanda Perez" 的 3 筆購買記錄

回到瀏覽器標籤頁的 Container App 端點，試問：`Amanda Perez 擁有哪些產品？`。您應該會看到這樣的畫面：

![Data](../../../../../translated_images/zh-HK/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. 代理遊樂場

讓我們透過 Agents Playground 來更深入體驗 Microsoft Foundry 的能力。

1. 返回 Microsoft Foundry 中的 `Agents` 頁面 - 選取預設 agent
1. 點擊 `Try in Playground` 選項 - 您會看到類似的 Playground UI
1. 問同樣的問題：`Amanda Perez 擁有哪些產品？`

    ![Data](../../../../../translated_images/zh-HK/09-ask-in-playground.a1b93794f78fa676.webp)

您會得到相同（或相似）的回應 - 同時還會額外獲取可以用來了解您代理式應用程式品質、成本及性能的資訊。例如：

1. 請注意回應中引用用於「建立基礎」的資料檔案
1. 將滑鼠移至任何檔案標籤上方 - 該資料是否與您的查詢及顯示的回應相符？

在回應下方還可以看到一列 _stat_。

1. 將滑鼠移至任一指標 - 例如 Safety，您會看到這樣的視窗
1. 評估的評級是否符合您對該回答安全性等級的直覺？

      ![Data](../../../../../translated_images/zh-HK/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. 內建可觀察性

可觀察性是為應用程式裝置儀表，以產生可用來理解、除錯和優化其運作的資料。為了體驗這項功能：

1. 點擊 `View Run Info` 按鈕 - 您會看到此頁面。這是[代理追蹤](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground)的範例展現。_您也可以點擊頂層選單的 Thread Logs 取得此視圖_。

   - 了解代理的執行步驟與所使用的工具
   - 瞭解回應的總 Token 數（相較於輸出 Token 使用量）
   - 瞭解延遲時長及執行中時間花費的位置

      ![Agent](../../../../../translated_images/zh-HK/10-view-run-info.b20ebd75fef6a1cc.webp)

1. 點擊 `Metadata` 分頁，檢視執行時的額外屬性，這些屬性可能為除錯問題提供有用的上下文。

      ![Agent](../../../../../translated_images/zh-HK/11-view-run-info-metadata.7966986122c7c2df.webp)


1. 點擊 `Evaluations` 分頁，查看針對代理回應自動評估的結果，包括安全性評估（如自傷）及代理特有的評估（例如意圖解析、任務遵循度）。

      ![Agent](../../../../../translated_images/zh-HK/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. 最後，點擊側邊選單中的 `Monitoring` 分頁。

      - 選擇顯示頁面中的 `Resource usage` 標籤 - 並檢視指標。
      - 追蹤應用程式使用情況（成本: token 數；負載: 請求數）。
      - 追蹤應用程式從收取首字節（輸入處理）到產出末字節的延遲。

      ![Agent](../../../../../translated_images/zh-HK/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. 環境變數

到目前為止，我們已在瀏覽器中完成部署並驗證基礎設施已配置且應用程式正常運作。但若要以 _程式碼優先_ 方式操作應用程式，我們需要將相關變數配置至本地開發環境，以便存取這些資源。使用 `azd` 可輕鬆完成此事。

1. Azure Developer CLI [使用環境變數](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) 來儲存及管理應用程式部署的設定。

1. 環境變數儲存在 `.azure/<env-name>/.env` 中 - 這會針對部署時使用的 `env-name` 環境範圍進行隔離，有助於您在同一儲存庫中區別不同部署目標的環境。

1. 環境變數會在 `azd` 執行特定指令（例如 `azd up`）時自動載入。注意 `azd` 不會自動讀取 _OS 級_ 環境變數（例如在 shell 中設定的），而是使用 `azd set env` 與 `azd get env` 來在腳本間傳遞資訊。

讓我們試試幾個指令：

1. 取得此環境中 `azd` 所設定的所有環境變數：

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      您會看到類似訊息：

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. 取得特定變數值 - 例如我想知道是否設定了 `AZURE_AI_AGENT_MODEL_NAME` 欄位

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      您會看到類似內容 - 這個欄位預設並未設定！

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. 為 `azd` 設定新的環境變數。這裡，我們更新代理模型名稱。_注意：任何變更會立即反映在 `.azure/<env-name>/.env` 檔案中。_

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      現在，我們應該能找到設定的值：

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. 注意某些資源是持久性的（例如模型部署），需要不只是執行一次 `azd up` 才能強制重新部署。我們可以嘗試先拆除原先部署，然後帶著變更過的環境變數重新部署。

1. <strong>刷新</strong> 如果您先前已使用 azd 模板部署過基礎設施 - 可以使用此指令根據您 Azure 部署的當前狀態，_刷新_ 本機環境變數的狀態：

      ```bash title="" linenums="0"
      azd env refresh
      ```

      這是一個強大的方法，可以跨越兩個或多個本地開發環境（例如，有多位開發人員的團隊）_同步_環境變數 — 讓已部署的基礎設施成為環境變數狀態的可靠依據。團隊成員只需_刷新_變數，即可重新同步。

---

## 9. 恭喜你 🏆

你剛完成了一個端到端的工作流程，當中你已：

- [X] 選擇你想使用的 AZD 範本
- [X] 使用 GitHub Codespaces 啓動該範本
- [X] 部署範本並驗證它運作正常

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的原文版本應被視為權威來源。對於關鍵信息，建議使用專業人工翻譯。由於使用本翻譯所引起的任何誤解或誤譯，我們不承擔任何責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->