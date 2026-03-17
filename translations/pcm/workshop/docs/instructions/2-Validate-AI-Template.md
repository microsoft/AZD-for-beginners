# 2. Check Template

!!! tip "BY THE END OF THIS MODULE YOU GO FIT DO"

    - [ ] Analyse di AI Solution Architecture
    - [ ] Understand di AZD Deployment Workflow
    - [ ] Use GitHub Copilot to get help for AZD usage
    - [ ] **Lab 2:** Deploy & Validate di AI Agents template

---


## 1. Introduction

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) or `azd` na open-source command-line tool wey dey simplify developer workflow when dem dey build and deploy applications to Azure. 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) na standardized repositories wey get sample application code, _infrastructure-as-code_ assets, and `azd` configuration files for one cohesive solution architecture. Provisioning di infrastructure fit be as simple as running `azd provision` command - while using `azd up` allow you to provision infrastructure **and** deploy your application for one shot!

As result, to jumpstart your application development fit be as simple as to find di correct _AZD Starter template_ wey go match your application and infrastructure needs - then customize di repository to fit your scenario requirements.

Before we start, make sure say you don install Azure Developer CLI.

1. Open VS Code terminal and type dis command:

      ```bash title="" linenums="0"
      azd version
      ```

1. You go see sometin like dis!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**You don ready now to select and deploy a template with azd**

---

## 2. Template Selection

Di Microsoft Foundry platform get a [set of recommended AZD templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) wey cover popular solution scenarios like _multi-agent workflow automation_ and _multi-modal content processing_. You fit also find these templates for di Microsoft Foundry portal.

1. Go visit [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Log into di Microsoft Foundry portal when dem prompt you - you go see sometin like dis.

![Pick Template](../../../../../translated_images/pcm/01-pick-template.60d2d5fff5ebc374.webp)


Di **Basic** options na your starter templates:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) wey deploys a basic chat application _with your data_ to Azure Container Apps. Use dis to explore basic AI chatbot scenario.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) wey also deploys a standard AI Agent (with di Foundry Agents). Use dis to sabi agentic AI solutions wey involve tools and models.

Open di second link for new browser tab (or click `Open in GitHub` for di related card). You go see di repository for dis AZD Template. Take small time to explore di README. Di application architecture dey like dis:

![App Architecture](../../../../../translated_images/pcm/architecture.8cec470ec15c65c7.webp)

---

## 3. Template Activation

Make we try deploy dis template make sure say e valid. We go follow di guidelines for di [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) section.

1. Click [this link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) - confirm di default action to `Create codespace`
1. Dis go open new browser tab - wait make GitHub Codespaces session finish load
1. Open di VS Code terminal for Codespaces - type dis command:

   ```bash title="" linenums="0"
   azd up
   ```

Complete di workflow steps wey dis one go trigger:

1. Them go prompt you to log into Azure - follow instructions to authenticate
1. Put unique environment name for you - e.g., I use `nitya-mshack-azd`
1. Dis go create `.azure/` folder - you go see subfolder wey get di env name
1. Them go prompt you to select subscription name - select di default
1. Them go prompt you for location - use `East US 2`

Now, wait make provisioning finish. **E go take 10-15 minutes**

1. When e finish, your console go show SUCCESS message like dis:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Your Azure Portal go now get provisioned resource group with that env name:

      ![Provisioned infra](../../../../../translated_images/pcm/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **You don ready now to validate di deployed infrastructure and application**.

---

## 4. Template Validation

1. Go Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) page - log in if dem prompt you
1. Click on RG wey be your environment name - you go see di page wey show up

      - click on di Azure Container Apps resource
      - click on di Application Url for di _Essentials_ section (top right)

1. You go see hosted application front-end UI like dis:

   ![App Frontend](../../../../../translated_images/pcm/03-test-application.471910da12c3038e.webp)

1. Try ask couple [sample questions](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Ask: ```What is the capital of France?``` 
      1. Ask: ```What's the best tent under $200 for two people, and what features does it include?```

1. You go get answers wey similar to wetin dey show below. _But how e dey work?_ 

      ![App Question](../../../../../translated_images/pcm/03-test-question.521c1e863cbaddb6.webp)

---

## 5.  Agent Validation

Di Azure Container App deploy endpoint wey connect to di AI Agent wey dem provision for di Microsoft Foundry project for dis template. Make we see wetin dat one mean.

1. Return go di Azure Portal _Overview_ page for your resource group

1. Click on di `Microsoft Foundry` resource for dat list

1. You go see dis. Click di `Go to Microsoft Foundry Portal` button. 
   ![Foundry Project Link](../../../../../translated_images/pcm/04-view-foundry-project.fb94ca41803f28f3.webp)

1. You go see di Foundry Project page for your AI application
   ![Project Page](../../../../../translated_images/pcm/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Click on `Agents` - you go see di default Agent wey dem provision for your project
   ![Agents List](../../../../../translated_images/pcm/06-visit-agents.bccb263f77b00a09.webp)

1. Select am - then you go see di Agent details. Note di following:

      - Di agent dey use File Search by default (always)
      - Di agent `Knowledge` show say e get 32 files wey dem uploaded (for file search)
      ![Agent Details](../../../../../translated_images/pcm/07-view-agent-details.0e049f37f61eae62.webp)

1. Look for di `Data+indexes` option for di left menu and click for details. 

      - You go see di 32 data files wey dem uploaded for knowledge.
      - These ones go correspond to di 12 customer files and 20 product files under `src/files` 
      ![Data Indexes](../../../../../translated_images/pcm/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**You don validate Agent operation!** 

1. Di agent responses dey grounded inside di knowledge wey dey those files. 
1. You fit now ask questions wey concern dat data, and get grounded responses.
1. Example: `customer_info_10.json` describe di 3 purchases wey "Amanda Perez" make

Return to di browser tab wey get di Container App endpoint and ask: `What products does Amanda Perez own?`. You go see sometin like dis:

![Ask in ACA](../../../../../translated_images/pcm/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Make we build small sense for wetin Microsoft Foundry fit do, by running di Agent for Agents Playground. 

1. Return to di `Agents` page for Microsoft Foundry - select di default agent
1. Click di `Try in Playground` option - you go get Playground UI wey be like dis
1. Ask di same question: `What products does Amanda Perez own?`

    ![Ask in Playground](../../../../../translated_images/pcm/09-ask-in-playground.a1b93794f78fa676.webp)

You go get same (or similar) response - but you go also get extra information wey fit help you understand di quality, cost, and performance of your agentic app. For example:

1. Note say di response cite data files wey dem use to "ground" di response
1. Put mouse over any of these file labels - di data match your query and di displayed response?

You go also see one _stats_ row under di response. 

1. Put mouse over any metric - e.g., Safety. You go see sometin like dis
1. Di assessed rating match your feeling for di response safety level?

      ![Run Info Meter](../../../../../translated_images/pcm/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Built-in Observability

Observability mean to instrument your application to produce data wey fit help you understand, debug, and optimize how e dey run. To feel dis:

1. Click di `View Run Info` button - you go see dis view. Dis na example of [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) for action. _You fit also get dis view by clicking Thread Logs for di top-level menu_.

   - Make you get sense for di run steps and tools wey di agent use
   - Understand total Token count (vs. output tokens usage) for di response
   - Understand di latency and where time dey spend for execution

      ![Agent Run Info](../../../../../translated_images/pcm/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Click di `Metadata` tab to see extra attributes for di run, wey fit give useful context for debugging issues later.   

      ![Run Metadata](../../../../../translated_images/pcm/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Click di `Evaluations` tab to see auto-assessments wey dem do on di agent response. These include safety evaluations (e.g., Self-harm) and agent-specific evaluations (e.g., Intent resolution, Task adherence).

      ![Run Evaluations](../../../../../translated_images/pcm/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Last but not least, click di `Monitoring` tab for di sidebar menu.

      - Select `Resource usage` tab for di displayed page - then view di metrics.
      - Track application usage in terms of costs (tokens) and load (requests).
      - Track application latency to first byte (input processing) and last byte (output).

      ![Monitoring Resources](../../../../../translated_images/pcm/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Environment Variables

So far, we don waka through di deployment for browser - and validate say our infrastructure don provision and di application dey work. But if we wan work with di application _code-first_, we need configure our local development environment with di relevant variables wey needed to work with these resources. Using `azd` dey make am easy.

1. Di Azure Developer CLI [uses environment variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) to store and manage configuration settings for di application deployments.

1. Environment variables dey stored for `.azure/<env-name>/.env` - dis one dey scope dem to di `env-name` environment wey you use during deployment and e dey help you keep environments separate between different deployment targets inside di same repo.

1. Environment variables dey automatically load by di `azd` command anytime e run specific command (e.g., `azd up`). Note say `azd` no dey automatically read _OS-level_ environment variables (e.g., dem set for shell) - instead use `azd set env` and `azd get env` to transfer information inside scripts.


Make we try small commands:

1. Get all di environment variables wey set for `azd` for dis environment:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      You go see sometin like:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Get specific value - e.g., I wan know if we set di `AZURE_AI_AGENT_MODEL_NAME` value

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      You go see sometin like dis - e no set by default!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Set new environment variable for `azd`. For here, we update di agent model name. _Note: any changes wey you make go reflect immediately for di `.azure/<env-name>/.env` file._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Now, we suppose find say di value don set:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Note say some resources dey persistent (e.g., model deployments) and dem go need more than just `azd up` to force redeployment. Make we try tear down di original deployment and redeploy with changed env vars.

1. **Refresh** If you don previously deploy infrastructure using azd template - you fit _refresh_ di state of your local environment variables based on di current state of your Azure deployment using dis command:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Dis na powerful way to _sync_ environment variables across two or more local development environments (e.g., team wey get plenty developers) - e go allow the deployed infrastructure to be the ground truth for di env variable state. Team members go just _refresh_ variables to come back in sync.

---

## 9. Congratulashuns 🏆

You don just complete one end-to-end workflow wey you:

- [X] You don select the AZD Template wey you wan use
- [X] You don launch the Template with GitHub Codespaces 
- [X] You don deploy the Template and confirm say e dey work

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Make you sabi:
Dis document dem translate wit AI translation service Co-op Translator (https://github.com/Azure/co-op-translator). Even though we dey try make am correct, abeg note say automated translations fit get errors or wrong information. Di original document for im own language na di official authority. If na important matter, make una use professional human translator. We no dey liable for any misunderstanding or wrong interpretation wey fit come from using this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->