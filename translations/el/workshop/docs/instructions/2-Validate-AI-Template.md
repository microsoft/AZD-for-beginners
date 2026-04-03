# 2. Επικύρωση προτύπου

> Επικυρώθηκε με `azd 1.23.12` τον Μάρτιο του 2026.

!!! tip "ΣΤΟ ΤΕΛΟΣ ΑΥΤΟΥ ΤΟΥ ΜΟΝΤΟΥΛΟΥ ΘΑ ΜΠΟΡΕΙΤΕ ΝΑ"

    - [ ] Αναλύσετε την αρχιτεκτονική λύσης AI
    - [ ] Κατανοήσετε τη ροή εργασίας ανάπτυξης με το AZD
    - [ ] Χρησιμοποιήσετε το GitHub Copilot για βοήθεια στη χρήση του AZD
    - [ ] **Εργαστήριο 2:** Αναπτύξετε και Επικυρώσετε το πρότυπο AI Agents

---


## 1. Εισαγωγή

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) or `azd` is an open-source commandline tool that streamlines the developer workflow when building and deploying applications to Azure. 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) are standardized repositories that include sample application code, _infrastructure-as-code_ assets, and `azd` configuration files for a cohesive solution architecture. Provisioning the infrastructure becomes as simple as an `azd provision` command - while using `azd up` allows you to provision infrastructure **and** deploy your application at one shot!

As a result, jumpstarting your application development process can be as simple as finding the right _AZD Starter template_ that comes closest to your application and infrastructure needs - then customizing the repository to suit your scenario requirements.

Before we begin, let's make sure you have the Azure Developer CLI installed.

1. Open a VS Code terminal and type this command:

      ```bash title="" linenums="0"
      azd version
      ```

1. You should see something like this!

      ```bash title="" linenums="0"
      azd version 1.23.12 (commit <current-build>)
      ```

**Τώρα είστε έτοιμοι να επιλέξετε και να αναπτύξετε ένα πρότυπο με το azd**

---

## 2. Επιλογή Προτύπου

The Microsoft Foundry platform comes with a [set of recommended AZD templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) that cover popular solution scenarios like _multi-agent workflow atomation_ and _multi-modal content processing_. You can also discover these templates by visiting the Microsoft Foundry portal.

1. Visit [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Log into the Microsoft Foundry portal when prompted - you will see something like this.

![Επιλογή](../../../../../translated_images/el/01-pick-template.60d2d5fff5ebc374.webp)


The **Basic** options are your starter templates:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) that deploys a basic chat application _with your data_ to Azure Container Apps. Use this to explore a basic AI chatbot scenario.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) that also deploys a standard AI Agent (with the Foundry Agents). Use this to get familiar with agentic AI solutions involving tools and models.

Visit the second link in a new browser tab (or click `Open in GitHub` for the related card). You should see the repository for this AZD Template. Take a minute to explore the README. The application architecture looks like this:

![Αρχιτεκτονική](../../../../../translated_images/el/architecture.8cec470ec15c65c7.webp)

---

## 3. Ενεργοποίηση Προτύπου

Let's try to deploy this template and make sure it is valid. We'll follow the guidelines in the [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) section.

1. Choose a working environment for the template repository:

      - **GitHub Codespaces**: Click [this link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) and confirm `Create codespace`
      - **Local clone or dev container**: Clone `Azure-Samples/get-started-with-ai-agents` and open it in VS Code

1. Wait until the VS Code terminal is ready, then type the following command:

   ```bash title="" linenums="0"
   azd up
   ```

Complete the workflow steps that this will trigger:

1. Θα σας ζητηθεί να συνδεθείτε στο Azure - ακολουθήστε τις οδηγίες για να αυθεντικοποιηθείτε
1. Εισαγάγετε ένα μοναδικό όνομα περιβάλλοντος για εσάς - π.χ., εγώ χρησιμοποίησα `nitya-mshack-azd`
1. Αυτό θα δημιουργήσει έναν φάκελο `.azure/` - θα δείτε έναν υποφάκελο με το όνομα του περιβάλλοντος
1. Θα σας ζητηθεί να επιλέξετε ένα όνομα συνδρομής - επιλέξτε το προεπιλεγμένο
1. Θα σας ζητηθεί μια τοποθεσία - χρησιμοποιήστε `East US 2`

Now, you wait for the provisioning to complete. **This takes 10-15 minutes**

1. When done, your console will show a SUCCESS message like this:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Your Azure Portal will now have a provisioned resource group with that env name:

      ![Υποδομή](../../../../../translated_images/el/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Τώρα είστε έτοιμοι να επικυρώσετε την αναπτυγμένη υποδομή και την εφαρμογή**.

---

## 4. Επικύρωση Προτύπου

1. Visit Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) page - log in when prompted
1. Click on RG for your environment name - you see the page above

      - click on the Azure Container Apps resource
      - click on the Application Url in the _Essentials_ section (top right)

1. You should see a hosted application front-end UI like this:

   ![Εφαρμογή](../../../../../translated_images/el/03-test-application.471910da12c3038e.webp)

1. Try asking a couple of [sample questions](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Ask: ```Ποια είναι η πρωτεύουσα της Γαλλίας;``` 
      1. Ask: ```Ποιο είναι το καλύτερο αντίσκηνο κάτω από $200 για δύο άτομα, και τι χαρακτηριστικά περιλαμβάνει;```

1. You should get answers similar to what is shown below. _But how does this work?_ 

      ![Εφαρμογή](../../../../../translated_images/el/03-test-question.521c1e863cbaddb6.webp)

---

## 5.  Επικύρωση Πράκτορα

The Azure Container App deploys an endpoint that connects to the AI Agent provisioned in the Microsoft Foundry project for this template. Let's take a look at what that means.

1. Return to the Azure Portal _Overview_ page for your resource group

1. Click on the `Microsoft Foundry` resource in that list

1. You should see this. Click the `Go to Microsoft Foundry Portal` button. 
   ![Foundry](../../../../../translated_images/el/04-view-foundry-project.fb94ca41803f28f3.webp)

1. You should see the Foundry Project page for your AI application
   ![Έργο](../../../../../translated_images/el/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Click on `Agents` - you see the default Agent provisioned in your project
   ![Πράκτορες](../../../../../translated_images/el/06-visit-agents.bccb263f77b00a09.webp)

1. Select it - and you see the Agent details. Note the following:

      - The agent uses File Search by default (always)
      - The agent `Knowledge` indicates it has 32 files uploaded (for file search)
      ![Πράκτορας](../../../../../translated_images/el/07-view-agent-details.0e049f37f61eae62.webp)

1. Look for the `Data+indexes` option in the left menu and click for details. 

      - You should see the 32 data files uploaded for knowledge.
      - These will correspond to the 12 customer files and 20 product files under `src/files` 
      ![Δεδομένα](../../../../../translated_images/el/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Επικυρώσατε τη λειτουργία του Πράκτορα!** 

1. The agent responses are grounded in the knowledge in those files. 
1. You can now ask questions related to that data, and get grounded responses.
1. Example: `customer_info_10.json` describes the 3 purchases made by "Amanda Perez"

Revisit the browser tab with the Container App endpoint and ask: `Ποια προϊόντα έχει στην ιδιοκτησία της η Amanda Perez;`. You should see something like this:

![Δεδομένα](../../../../../translated_images/el/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Περιβάλλον Δοκιμών Πράκτορα

Let's build a bit more intuition for the capabilities of Microsoft Foundry, by taking the Agent for a spin in the Agents Playground. 

1. Return to the `Agents` page in Microsoft Foundry - select the default agent
1. Click the `Try in Playground` option - you should get a Playground UI like this
1. Ask the same question: `Ποια προϊόντα έχει στην ιδιοκτησία της η Amanda Perez;`

    ![Δεδομένα](../../../../../translated_images/el/09-ask-in-playground.a1b93794f78fa676.webp)

You get the same (or similar) response - but you also get additional information that you can use to understand the quality, cost, and performance of your agentic app. For example:

1. Note that the response cites data files used to "ground" the response
1. Hover over any of these file labels - does the data match your query and displayed response?

You also see a _stats_ row below the response. 

1. Hover over any metric - e.g., Safety. You see something like this
1. Does the assessed rating match your intuition for the response safety level?

      ![Δεδομένα](../../../../../translated_images/el/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Ενσωματωμένη Παρατηρησιμότητα

Observability is about instrumenting your application to generate data that can be used to understand, debug, and optimize, its operations. To get a sense for this:

1. Click the `View Run Info` button - you should see this view. This is an example of [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) in action. _You can also get this view by clicking Thread Logs in the top-level menu_.

   - Get a sense for the run steps and tools engaged by the agent
   - Understand total Token count (vs. output tokens usage) for response
   - Understand the latency and where time is being spent in execution

      ![Πράκτορας](../../../../../translated_images/el/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Click the `Metadata` tab to see additional attributes for the run, that may provide useful context for debugging issues later.   

      ![Πράκτορας](../../../../../translated_images/el/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Click the `Evaluations` tab to see auto-assessments made on the agent response. These include safety evaluations (e.g., Self-harm) and agent-specifc evaluations (e.g., Intent resolution, Task adherence).

      ![Πράκτορας](../../../../../translated_images/el/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Last but not least, click the `Monitoring` tab in the sidebar menu.

      - Select `Resource usage` tab in the displayed page - and view the metrics.
      - Track application usage in terms of costs (tokens) and load (requests).
      - Track applicaton latency to first byte (input processing) and last byte (output).

      ![Πράκτορας](../../../../../translated_images/el/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Μεταβλητές Περιβάλλοντος

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
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
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

      Αυτός είναι ένας ισχυρός τρόπος για να _συγχρονίσετε_ τις μεταβλητές περιβάλλοντος σε δύο ή περισσότερα τοπικά περιβάλλοντα ανάπτυξης (π.χ., ομάδα με πολλούς προγραμματιστές) - επιτρέποντας στην αναπτυγμένη υποδομή να λειτουργεί ως η απόλυτη πηγή αλήθειας για την κατάσταση των μεταβλητών περιβάλλοντος. Τα μέλη της ομάδας απλώς _ανανεώνουν_ τις μεταβλητές για να επανέλθουν σε συγχρονισμό.

---

## 9. Συγχαρητήρια 🏆

Μόλις ολοκληρώσατε μια ολοκληρωμένη ροή εργασίας όπου:

- [X] Επιλέξατε το πρότυπο AZD που θέλετε να χρησιμοποιήσετε
- [X] Άνοιξατε το πρότυπο σε ένα υποστηριζόμενο περιβάλλον ανάπτυξης
- [X] Αναπτύξατε το πρότυπο και επιβεβαιώσατε ότι λειτουργεί

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Το παρόν έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να γνωρίζετε ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στην αρχική του γλώσσα πρέπει να θεωρείται η επίσημη πηγή. Για κρίσιμες πληροφορίες συνιστάται επαγγελματική μετάφραση από ανθρώπινο μεταφραστή. Δεν φέρουμε ευθύνη για τυχόν παρανοήσεις ή λανθασμένες ερμηνείες που προκύψουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->