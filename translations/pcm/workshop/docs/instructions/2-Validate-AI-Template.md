# 2. Make Sure Template Dey Valid

> Dem validate dis with `azd 1.25.6` for June 2026.

!!! tip "BY THE END OF THIS MODULE YOU GO FIT DO THIS"

    - [ ] Analyze di AI Solution Architecture
    - [ ] Understand di AZD Deployment Workflow
    - [ ] Use GitHub Copilot to get help on AZD usage
    - [ ] **Lab 2:** Deploy & Validate di AI Agents template

---


## 1. Introduction

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) or `azd` na open-source commandline tool wey dey make developer workflow easy when you dey build and deploy applications to Azure. 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) na standardized repositories wey include sample application code, _infrastructure-as-code_ assets, and `azd` configuration files for one cohesive solution architecture. To provision the infrastructure go simple as to run `azd provision` - while `azd up` go allow you provision infrastructure **and** deploy your application one time!

As result, to jumpstart your application development fit be as simple as to find di correct _AZD Starter template_ wey close to your application and infrastructure needs - then customize di repository make e fit your scenario requirements.

Before we start, make we sure say you don get the Azure Developer CLI installed.

1. Open one VS Code terminal and type this command:

      ```bash title="" linenums="0"
      azd version
      ```

1. You go see something like this!

      ```bash title="" linenums="0"
      azd version 1.25.6 (commit <current-build>)
      ```

**You don ready now to select and deploy one template with azd**

---

## 2. Template Selection

The Microsoft Foundry platform get [set of recommended AZD templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) wey cover popular solution scenarios like _multi-agent workflow atomation_ and _multi-modal content processing_. You fit also find these templates by visiting the Microsoft Foundry portal.

1. Visit [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Log into the Microsoft Foundry portal when dem ask you - you go see something like this.

![Pick](../../../../../translated_images/pcm/01-pick-template.60d2d5fff5ebc374.webp)


Di **Basic** options na your starter templates:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) wey deploy basic chat application _with your data_ to Azure Container Apps. Use this to explore basic AI chatbot scenario.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) wey still deploy standard AI Agent (with the Foundry Agents). Use this one to sabi how agentic AI solutions wey involve tools and models dey work.

Open di second link for new browser tab (or click `Open in GitHub` for di related card). You go see di repository for this AZD Template. Take one minute to waka through the README. Di application architecture resemble like this:

![Arch](../../../../../translated_images/pcm/architecture.8cec470ec15c65c7.webp)

---

## 3. Template Activation

Make we try deploy this template make we confirm say e valid. We go follow di guidelines for di [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) section.

1. Choose one working environment for di template repository:

      - **GitHub Codespaces**: Click [this link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) and confirm `Create codespace`
      - **Local clone or dev container**: Clone `Azure-Samples/get-started-with-ai-agents` and open am for VS Code

1. Wait till di VS Code terminal ready, then type dis command:

   ```bash title="" linenums="0"
   azd up
   ```

Complete di workflow steps wey dis go trigger:

1. Dem go ask you to log into Azure - follow instructions to authenticate
1. Enter one unique environment name for you - e.g., I use `nitya-mshack-azd`
1. Dis go create one `.azure/` folder - you go see subfolder wey get the env name
1. Dem go ask you to select one subscription name - select the default
1. Dem go ask you for one location - use `East US 2`

Now, you go wait make provisioning complete. **E go take 10-15 minutes**

1. When e done, your console go show SUCCESS message like this:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Your Azure Portal go now get one provisioned resource group with that env name:

      ![Infra](../../../../../translated_images/pcm/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **You don ready now to validate the deployed infrastructure and application**.

---

## 4. Template Validation

1. Visit Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) page - log in when dem ask
1. Click on RG for your environment name - you go see the page wey dey above

      - click on the Azure Container Apps resource
      - click on the Application Url for the _Essentials_ section (top right)

1. You suppose see one hosted application front-end UI like this:

   ![App](../../../../../translated_images/pcm/03-test-application.471910da12c3038e.webp)

1. Try ask couple sample questions from [sample questions](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Ask: ```What is the capital of France?``` 
      1. Ask: ```What's the best tent under $200 for two people, and what features does it include?```

1. You suppose get answers wey similar to wetin dem show below. _But how e dey work?_ 

      ![App](../../../../../translated_images/pcm/03-test-question.521c1e863cbaddb6.webp)

---

## 5.  Agent Validation

Di Azure Container App deploy endpoint wey connect to di AI Agent wey dem provision for di Microsoft Foundry project for this template. Make we check wetin that one mean.

1. Return to di Azure Portal _Overview_ page for your resource group

1. Click on di `Microsoft Foundry` resource for that list

1. You go see dis. Click di `Go to Microsoft Foundry Portal` button. 
   ![Foundry](../../../../../translated_images/pcm/04-view-foundry-project.fb94ca41803f28f3.webp)

1. You go see di Foundry Project page for your AI application
   ![Project](../../../../../translated_images/pcm/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Click on `Agents` - you go see di default Agent wey dem provision for your project
   ![Agents](../../../../../translated_images/pcm/06-visit-agents.bccb263f77b00a09.webp)

1. Select am - then you go see di Agent details. Note di following:

      - Di agent dey use File Search by default (always)
      - Di agent `Knowledge` show say e get 32 files wey dem upload (for file search)
      ![Agents](../../../../../translated_images/pcm/07-view-agent-details.0e049f37f61eae62.webp)

1. Look for di `Data+indexes` option for di left menu and click for details. 

      - You go see di 32 data files wey dem upload for knowledge.
      - These ones go correspond to di 12 customer files and 20 product files under `src/files` 
      ![Data](../../../../../translated_images/pcm/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**You don validate Agent operation!** 

1. Di agent responses base for di knowledge wey dey those files. 
1. You fit now ask questions wey relate to that data, and get grounded responses.
1. Example: `customer_info_10.json` dey describe di 3 purchases wey "Amanda Perez" make

Go back to di browser tab wey get di Container App endpoint and ask: `What products does Amanda Perez own?`. You suppose see something like this:

![Data](../../../../../translated_images/pcm/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Make we build small more sense for di capabilities of Microsoft Foundry, by to dey run di Agent for di Agents Playground. 

1. Return to di `Agents` page for Microsoft Foundry - select di default agent
1. Click di `Try in Playground` option - you go get one Playground UI like this
1. Ask di same question: `What products does Amanda Perez own?`

    ![Data](../../../../../translated_images/pcm/09-ask-in-playground.a1b93794f78fa676.webp)

You go get di same (or similar) response - but you go also get extra information wey you fit use to understand di quality, cost, and performance of your agentic app. For example:

1. Note say di response dey cite data files wey dem use to "ground" the response
1. Hover over any of these file labels - di data match your query and di response wey dem show?

You go also see one _stats_ row below di response. 

1. Hover over any metric - e.g., Safety. You go see something like this
1. Di assessed rating match your sense for di response safety level?

      ![Data](../../../../../translated_images/pcm/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Built-in Observability

Observability na about to instrument your application make e generate data wey you fit use to understand, debug, and optimize how e dey work. To get small sense for this:

1. Click di `View Run Info` button - you go see this view. Dis na example of [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) for action. _You fit also get this view by clicking Thread Logs for the top-level menu_.

   - Make you sabi di run steps and tools wey di agent use
   - Understand total Token count (vs. output tokens usage) for di response
   - Understand di latency and where time dey spent for execution

      ![Agent](../../../../../translated_images/pcm/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Click di `Metadata` tab make you see extra attributes for the run, wey fit give useful context for debugging wahala later.   

      ![Agent](../../../../../translated_images/pcm/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Click di `Evaluations` tab make you see auto-assessments wey dem do on di agent response. Dem include safety evaluations (e.g., Self-harm) and agent-specific evaluations (e.g., Intent resolution, Task adherence).

      ![Agent](../../../../../translated_images/pcm/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Last but not least, click di `Monitoring` tab for di sidebar menu.

      - Select `Resource usage` tab for di displayed page - then view di metrics.
      - Track application usage in terms of costs (tokens) and load (requests).
      - Track application latency to first byte (input processing) and last byte (output).

      ![Agent](../../../../../translated_images/pcm/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Environment Variables

So far, we don waka through di deployment for di browser - and validate say our infrastructure don provision and di application dey run. But to work with di application _code-first_, we need to configure our local development environment with di relevant variables wey required to work with these resources. Using `azd` dey make am easy.

1. Di Azure Developer CLI [uses environment variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) to store and manage configuration settings for di application deployments.

1. Environment variables dey stored for `.azure/<env-name>/.env` - dis one scope dem to di `env-name` environment wey you use during deployment and e help you isolate environments between different deployment targets for di same repo.

1. Environment variables dey automatically load by di `azd` command anytime e run one specific command (e.g., `azd up`). Note say `azd` no dey automatically read _OS-level_ environment variables (e.g., wey you set for the shell) - instead use `azd set env` and `azd get env` to transfer information inside scripts.


Make we try few commands:

1. Get all di environment variables wey dem set for `azd` for this environment:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      You go see something like:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Get one specific value - e.g., I want to know if we set di `AZURE_AI_AGENT_MODEL_NAME` value

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      You go see something like this - e no set by default!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Set one new environment variable for `azd`. Here, we update di agent model name. _Note: any changes wey you make go immediately reflect for di `.azure/<env-name>/.env` file.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Now, we suppose find say di value don set:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Note say some resources dey persistent (e.g., model deployments) and dem go require more than just `azd up` to force redeployment. Make we try tear down di original deployment and redeploy with changed env vars.

1. **Refresh** If you don deploy infrastructure before using one azd template - you fit _refresh_ di state of your local environment variables based on di current state of your Azure deployment using dis command:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Dis na powerful way to _sync_ environment variables across two or more local development environments (for example, team wey get multiple developers) - e dey allow the deployed infrastructure to be the ground truth for env variable state. Team members fit just _refresh_ the variables to come back in sync.

---

## 9. Una don finish 🏆

You don just complete an end-to-end workflow wey you:

- [X] You don select the AZD Template wey you wan use
- [X] You don open the template inside a supported development environment
- [X] You don deploy the Template and validate say e dey work

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->