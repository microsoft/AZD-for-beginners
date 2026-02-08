# 2. 驗證範本

!!! tip "完成本模組後，您將能夠"

    - [ ] 分析 AI 解決方案架構
    - [ ] 了解 AZD 部署工作流程
    - [ ] 使用 GitHub Copilot 協助 AZD 的使用
    - [ ] **實驗 2：** 部署並驗證 AI Agents 範本

---


## 1. 介紹

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) or `azd` is an open-source commandline tool that streamlines the developer workflow when building and deploying applications to Azure. 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) are standardized repositories that include sample application code, _基礎架構即程式碼_ assets, and `azd` configuration files for a cohesive solution architecture. Provisioning the infrastructure becomes as simple as an `azd provision` command - while using `azd up` allows you to provision infrastructure **and** deploy your application at one shot!

As a result, jumpstarting your application development process can be as simple as finding the right _AZD Starter template_ that comes closest to your application and infrastructure needs - then customizing the repository to suit your scenario requirements.

Before we begin, let's make sure you have the Azure Developer CLI installed.

1. Open a VS Code terminal and type this command:

      ```bash title="" linenums="0"
      azd version
      ```

1. You should see something like this!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**您現在已準備好使用 azd 選擇並部署範本**

---

## 2. 範本選擇

The Microsoft Foundry platform comes with a [set of recommended AZD templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) that cover popular solution scenarios like _multi-agent workflow atomation_ and _multi-modal content processing_. You can also discover these templates by visiting the Microsoft Foundry portal.

1. 瀏覽 [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Log into the Microsoft Foundry portal when prompted - you will see something like this.

![挑選](../../../../../translated_images/zh-TW/01-pick-template.60d2d5fff5ebc374.webp)


The **Basic** options are your starter templates:

1. [ ] [開始使用 AI 聊天](https://github.com/Azure-Samples/get-started-with-ai-chat) that deploys a basic chat application _包含您的資料_ to Azure Container Apps. Use this to explore a basic AI chatbot scenario.
1. [X] [開始使用 AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) that also deploys a standard AI Agent (with the Foundry Agents). Use this to get familiar with agentic AI solutions involving tools and models.

Visit the second link in a new browser tab (or click `Open in GitHub` for the related card). You should see the repository for this AZD Template. Take a minute to explore the README. The application architecture looks like this:

![架構](../../../../../translated_images/zh-TW/architecture.8cec470ec15c65c7.webp)

---

## 3. 範本啟用

Let's try to deploy this template and make sure it is valid. We'll follow the guidelines in the [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) section.

1. Click [this link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) - confirm the default action to `Create codespace`
1. This opens a new browser tab - wait for the GitHub Codespaces session to complete loading
1. Open the VS Code terminal in Codespaces - type the following command:

   ```bash title="" linenums="0"
   azd up
   ```

Complete the workflow steps that this will trigger:

1. You will be prompted to log into Azure - follow instructions to authenticate
1. Enter a unique environment name for you - e.g., I used `nitya-mshack-azd`
1. This  will create a `.azure/` folder - you will see a subfolder with the env name
1. You will be prompted to select a subscription name - select the default
1. You will be prompted for a location - use `East US 2`

Now, you wait for the provisioning to complete. **This takes 10-15 minutes**

1. When done, your console will show a SUCCESS message like this:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Your Azure Portal will now have a provisioned resource group with that env name:

      ![基礎設施](../../../../../translated_images/zh-TW/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **您現在已準備好驗證已部署的基礎架構與應用程式**。

---

## 4. 範本驗證

1. 前往 Azure 入口網站的 [資源群組](https://portal.azure.com/#browse/resourcegroups) 頁面 - log in when prompted
1. 點選對應您環境名稱的資源群組 - you see the page above

      - 點選 Azure Container Apps 資源
      - 點選 _Essentials_ 區段（右上方）中的 Application Url

1. You should see a hosted application front-end UI like this:

   ![應用程式](../../../../../translated_images/zh-TW/03-test-application.471910da12c3038e.webp)

1. Try asking a couple of [sample questions](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. 詢問： ```法國的首都是哪裡？``` 
      1. 詢問： ```兩人帳篷在 $200 以下的最佳選擇是什麼？它包含哪些功能？```

1. You should get answers similar to what is shown below. _But how does this work?_ 

      ![應用程式](../../../../../translated_images/zh-TW/03-test-question.521c1e863cbaddb6.webp)

---

## 5.  Agent 驗證

The Azure Container App deploys an endpoint that connects to the AI Agent provisioned in the Microsoft Foundry project for this template. Let's take a look at what that means.

1. Return to the Azure Portal _Overview_ page for your resource group

1. Click on the `Microsoft Foundry` resource in that list

1. You should see this. Click the `Go to Microsoft Foundry Portal` button. 
   ![Foundry](../../../../../translated_images/zh-TW/04-view-foundry-project.fb94ca41803f28f3.webp)

1. You should see the Foundry Project page for your AI application
   ![專案](../../../../../translated_images/zh-TW/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Click on `Agents` - you see the default Agent provisioned in your project
   ![代理](../../../../../translated_images/zh-TW/06-visit-agents.bccb263f77b00a09.webp)

1. Select it - and you see the Agent details. Note the following:

      - 該代理預設使用 File Search（檔案搜尋）
      - 該代理的 `Knowledge` 顯示已上傳 32 個檔案（用於檔案搜尋）
      ![代理](../../../../../translated_images/zh-TW/07-view-agent-details.0e049f37f61eae62.webp)

1. Look for the `Data+indexes` option in the left menu and click for details. 

      - You should see the 32 data files uploaded for knowledge.
      - These will correspond to the 12 customer files and 20 product files under `src/files` 
      ![資料](../../../../../translated_images/zh-TW/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**您已驗證代理運作！** 

1. 代理的回應是以那些檔案中的知識為基礎。
1. 您現在可以針對該資料提出問題，並獲得有根據的回答。
1. 範例：`customer_info_10.json` 描述了 "Amanda Perez" 所進行的 3 筆購買紀錄

Revisit the browser tab with the Container App endpoint and ask: `What products does Amanda Perez own?`. You should see something like this:

![資料](../../../../../translated_images/zh-TW/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Let's build a bit more intuition for the capabilities of Microsoft Foundry, by taking the Agent for a spin in the Agents Playground. 

1. Return to the `Agents` page in Microsoft Foundry - select the default agent
1. Click the `Try in Playground` option - you should get a Playground UI like this
1. Ask the same question: `What products does Amanda Perez own?`

    ![資料](../../../../../translated_images/zh-TW/09-ask-in-playground.a1b93794f78fa676.webp)

You get the same (or similar) response - but you also get additional information that you can use to understand the quality, cost, and performance of your 代理式應用程式. For example:

1. 注意回應中引用了用以作為回應依據的資料檔案（用於「落地」回應）
1. 將游標移到這些檔案標籤上 - 資料是否符合您的查詢與所顯示的回應？

You also see a _stats_ row below the response. 

1. 將游標移到任一指標上 - 例如安全性。您會看到像這樣的資訊
1. 該評估等級是否符合您對回應安全性程度的直覺？

      ![資料](../../../../../translated_images/zh-TW/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. 內建可觀察性

Observability is about instrumenting your application to generate data that can be used to understand, debug, and optimize, its operations. To get a sense for this:

1. Click the `View Run Info` button - you should see this view. This is an example of [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) in action. _You can also get this view by clicking Thread Logs in the top-level menu_.

   - 了解執行步驟與代理所啟用的工具
   - 了解回應的總 Token 數（相對於輸出 token 使用量）
   - 了解延遲與執行中時間花費的位置

      ![代理](../../../../../translated_images/zh-TW/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Click the `Metadata` tab to see additional attributes for the run, that may provide useful context for debugging issues later.   

      ![代理](../../../../../translated_images/zh-TW/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Click the `Evaluations` tab to see auto-assessments made on the agent response. These include safety evaluations (e.g., Self-harm) and agent-specifc evaluations (e.g., Intent resolution, Task adherence).

      ![代理](../../../../../translated_images/zh-TW/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Last but not least, click the `Monitoring` tab in the sidebar menu.

      - Select `Resource usage` tab in the displayed page - and view the metrics.
      - Track application usage in terms of costs (tokens) and load (requests).
      - Track applicaton latency to first byte (input processing) and last byte (output).

      ![代理](../../../../../translated_images/zh-TW/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. 環境變數

So far, we've walked through the deployment in the browser - and validated that our infrastructure is provisioned and the application is operational. But to work with the application _code-first_, we need to configure our local development environment with the relevant variables required to work with these resources. Using `azd` makes it easy.

1. The Azure Developer CLI [uses environment variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) to store and manage configuration settings for  the application deployments.

1. Environment variables are stored in `.azure/<env-name>/.env` - this scopes them to the `env-name` environment used during deployment and helps you isolate environments between different deployment targets in the same repo.

1. Environment variables are automatically loaded by the `azd` command whenever it executes a specific command (e.g., `azd up`). Note that `azd` does not automatically read _OS-level_ environment variables (e.g., set in the shell) - instead use `azd set env` and `azd get env` to transfer information within scripts.


Let's try out a few commands:

1. Get all the environment variables set for `azd` in this environment:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      You see something like:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4o-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Get a specific value - e.g., I want to know if we set the `AZURE_AI_AGENT_MODEL_NAME` value

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      You see something like this - it was not set by default!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Set a new environment variable for `azd`. Here, we update the agent model name. _Note: any changes made will be immediately reflected in the `.azure/<env-name>/.env` file.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Now, we should find the value is set:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Note that some resources are persistent (e.g., model deployments) and will require more than just an `azd up` to force the redeployment. Let's try tearing down the original deployment and redeploying with changed env vars.

1. **Refresh** If you had previously deployed infrastructure using an azd template - you can _refresh_ the state of your local environment variables based on the current state of your Azure deployment using this command:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      這是一個強大的方式，可在兩個或多個本地開發環境之間 _同步_ 環境變數 (例如，擁有多名開發人員的團隊) - 允許已部署的基礎架構作為環境變數狀態的事實依據。 團隊成員只要 _重新整理_ 變數就能恢復同步。

---

## 9. 恭喜 🏆

你剛完成一個端到端的工作流程，內容如下：

- [X] 選擇你想使用的 AZD 範本
- [X] 使用 GitHub Codespaces 啟動該範本
- [X] 部署該範本並驗證其運作正常

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件使用 AI 翻譯服務 Co-op Translator（https://github.com/Azure/co-op-translator）進行翻譯。儘管我們力求準確，請注意自動翻譯可能含有錯誤或不精確之處。原始文件的母語版本應視為具權威性的來源。對於重要資訊，建議採用專業人工翻譯。對於因使用此翻譯而導致的任何誤解或誤釋，我們概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->