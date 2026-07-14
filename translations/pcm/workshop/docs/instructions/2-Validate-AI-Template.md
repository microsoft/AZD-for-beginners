# 2. Check if Template Correct

> We test this one with `azd 1.27.1` for July 2026.

!!! tip "BY THE END OF DIS MODULE YOU GO FIT"

    - [ ] Analyze di AI Solution Architecture
    - [ ] Understand di AZD Deployment Workflow
    - [ ] Use GitHub Copilot to help you for AZD use
    - [ ] **Lab 2:** Deploy & Validate di AI Agents template

---


## 1. Introduction

Di [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) or `azd` na open-source commandline tool wey e make developer work easy when e dey build and deploy apps for Azure. 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) be standardized repositories wey carry sample app code, _infrastructure-as-code_ things, and `azd` config files wey join together for one solid solution architecture. To set up di infrastructure, na as simple as `azd provision` command - and if you use `azd up` e allow you to set up infrastructure **and** deploy your app at once!

So, if you wan start your app development, e fit be as simple as to find the correct _AZD Starter template_ wey closest to your app and infrastructure needs - then you no go just use am, you go change am to fit your scenario.

Before we start, make sure say you get Azure Developer CLI for your machine.

1. Open VS Code terminal and run dis command:

      ```bash title="" linenums="0"
      azd version
      ```

1. You go see something like this!

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**You don ready to select and deploy template with azd now**

---

## 2. Template Selection

Microsoft Foundry platform get [set of recommended AZD templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) wey cover popular solution cases like _multi-agent workflow automation_ and _multi-modal content processing_. You fit also find these templates if you visit Microsoft Foundry portal.

1. Go [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Sign in to Microsoft Foundry portal when e ask you - you go see something like dis.

![Pick](../../../../../translated_images/pcm/01-pick-template.60d2d5fff5ebc374.webp)


Di **Basic** options na your starter templates dem:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) wey deploy basic chat app _with your data_ for Azure Container Apps. Use dis one if you wan test basic AI chatbot case.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) wey still deploy standard AI Agent (with Foundry Agents). Use dis one to sabi agentic AI solutions wey get tools and models.

Open di second link for new browser tab (or click `Open in GitHub` for the card). You go see di repo for dis AZD Template. Take small time read di README. Di app architecture look like dis:

![Arch](../../../../../translated_images/pcm/architecture.8cec470ec15c65c7.webp)

---

## 3. Template Activation

Make we try deploy dis template make sure say e correct. We go follow di instructions wey dey inside [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) section.

1. Choose how you wan work for di template repo:

      - **GitHub Codespaces**: Click [dis link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) then confirm `Create codespace`
      - **Local clone or dev container**: Clone `Azure-Samples/get-started-with-ai-agents` then open am for VS Code

1. Wait til VS Code terminal ready, then run dis command:

   ```bash title="" linenums="0"
   azd up
   ```

Follow through di steps wey dis command go start:

1. You go asked to log into Azure - follow the instructions make you authenticate
1. Put one unique environment name wey be your own - for example, I use `nitya-mshack-azd`
1. Dis one go create `.azure/` folder - you go see subfolder with your env name
1. You go asked to choose subscription name - pick di default
1. You go asked for location - choose `East US 2`

Now, you just dey wait make di provisioning finish. **E go take 10-15 minutes**

1. When e finish, your console go show SUCCESS message like dis:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Your Azure Portal now go get one resource group wey e create with your env name:

      ![Infra](../../../../../translated_images/pcm/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **You fit now check di deployed infrastructure and app make sure dem dey correct**.

---

## 4. Template Validation

1. Go to Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) page - sign in if e ask you
1. Click RG for your env name - you go see di page wey dey above

      - Click Azure Container Apps resource
      - Click Application Url for di _Essentials_ section (for top right)

1. You go see one hosted app front-end UI like this:

   ![App](../../../../../translated_images/pcm/03-test-application.471910da12c3038e.webp)

1. Try ask some [sample questions](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Ask: ```Wetind be di capital of France?``` 
      1. Ask: ```Which be di best tent under $200 for two people, and wetin e get inside?```

1. You go get answers wey look like di one wey dey under. _But how e dey work?_ 

      ![App](../../../../../translated_images/pcm/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Agent Validation

Azure Container App deploy endpoint wey connect to AI Agent wey Microsoft Foundry project set up for dis template. Make we check wetin dat mean.

1. Go back to Azure Portal _Overview_ page for your resource group

1. Click di `Microsoft Foundry` resource for dat list

1. You go see dis. Click `Go to Microsoft Foundry Portal` button. 
   ![Foundry](../../../../../translated_images/pcm/04-view-foundry-project.fb94ca41803f28f3.webp)

1. You go see Foundry Project page for your AI app
   ![Project](../../../../../translated_images/pcm/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Click `Agents` - you go see di default Agent wey dem set up for your project
   ![Agents](../../../../../translated_images/pcm/06-visit-agents.bccb263f77b00a09.webp)

1. Select am - you go see Agent details. Look these things:

      - Di agent dey use File Search by default (always)
      - Di agent `Knowledge` dey show say e get 32 files wey e upload (for file search)
      ![Agents](../../../../../translated_images/pcm/07-view-agent-details.0e049f37f61eae62.webp)

1. Find `Data+indexes` option for left menu and click to see details. 

      - You go see di 32 data files wey dem upload for knowledge.
      - These correspond to 12 customer files and 20 product files for `src/files` 
      ![Data](../../../../../translated_images/pcm/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**You don verify Agent work right!** 

1. Di agent answers base on knowledge for those files. 
1. You fit now ask questions about dat data, and get correct answers.
1. Example: `customer_info_10.json` talk about 3 purchases wey "Amanda Perez" do

Go back to browser tab with Container App endpoint and ask: `Which products Amanda Perez get?`. You go see something like dis:

![Data](../../../../../translated_images/pcm/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Make we sabi di power of Microsoft Foundry more, by testing di Agent for Agents Playground. 

1. Go back to `Agents` page for Microsoft Foundry - select di default agent
1. Click `Try in Playground` option - you go get Playground UI like dis
1. Ask di same question: `Which products Amanda Perez get?`

    ![Data](../../../../../translated_images/pcm/09-ask-in-playground.a1b93794f78fa676.webp)

You go get same (or close) answer - but you go see extra info wey go help you understand the quality, cost, and performance of your agentic app. For example:

1. Notice say di answer show di data files wey dem use to "ground" di answer
1. Move your mouse over any of these file labels - di data e no match your question and answer?

You go also see _stats_ row below di answer. 

1. Move mouse over any metric - for example, Safety. You go see something like dis
1. Di rating wey dem give match how you feel about di safety of di answer?

      ![Data](../../../../../translated_images/pcm/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Built-in Observability

Observability na to put tools for your app wey go produce data wey fit help you understand, debug, and improve the way e dey operate. To check am:

1. Click `View Run Info` button - you go see dis screen. Dis na example of [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground). _You fit also get dis view if you click Thread Logs for top menu_.

   - Check di run steps and tools wey agent use
   - Understand total Token count (and output tokens used) for answer
   - Understand time wey e take and where e spend the time inside execution

      ![Agent](../../../../../translated_images/pcm/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Click `Metadata` tab to see more info for dis run, wey fit help you debug later.   

      ![Agent](../../../../../translated_images/pcm/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Click `Evaluations` tab to see automatic assessments wey dem do on di agent answer. This one get safety check (e.g., Self-harm) and agent-specific checks (e.g., Intent resolution, Task adherence).

      ![Agent](../../../../../translated_images/pcm/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Last one, click `Monitoring` tab for sidebar menu.

      - Select `Resource usage` tab on di page - then check di metrics.
      - Track app usage by costs (tokens) and load (requests).
      - Track latency for app to first byte (input process) and last byte (output).

      ![Agent](../../../../../translated_images/pcm/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Environment Variables

So far, we don run deployment for browser - and check say infrastructure dey and app dey work well. But if you want work with app _code-first_, you go need to set your local development environment with correct variables to work with di resources. Using `azd` e easy.

1. Di Azure Developer CLI [uses environment variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) to store and manage config settings for app deployments.

1. Environment variables dey store for `.azure/<env-name>/.env` - dis one na so dem keep am for particular `env-name` wey you use for deployment and e help you keep environments separate for different deployment targets inside di same repo.

1. Environment variables dey load automatically when `azd` command run specific command (like `azd up`). No forget say `azd` no dey read _OS-level_ environment variables (like those wey dey shell) automatically - instead, use `azd set env` and `azd get env` to share info inside scripts.


Make we try small commands:

1. Get all environment variables wey set for `azd` for dis environment:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      You go see something like dis:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Get one particular value - like I want check if `AZURE_AI_AGENT_MODEL_NAME` dey set

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      You go see somethin like dis - e no set by default!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Set new environment variable for `azd`. Here, we go update agent model name. _Note: any changes you make go instantly appear for `.azure/<env-name>/.env` file.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Now, we fit check say value set:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Note say some resources dey persistent (like model deployments) so if you change env vars e no mean say `azd up` go redeploy immediately. Make we try tear down original deployment and redeploy with new env vars.

1. **Refresh** If you don deploy infrastructure with azd template before - you fit _refresh_ your local env variables based on how your Azure deployment be currently with dis command:

      ```bash title="" linenums="0"
      azd env refresh
      ```


      Dis na powerful way to _sync_ environment variables across two or more local development environments (e.g., team wey get plenti developers) - e dey allow di deployed infrastructure make e serve as di ground truth for env variable state. Team members fit just _refresh_ variables make dem come back for sync.

---

## 9. Congratulations 🏆

You don finish one end-to-end workflow wey you:

- [X] Choose di AZD Template Wey You Wan Use
- [X] Open di template for one supported development environment
- [X] Deploy di Template and check say e dey work

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->