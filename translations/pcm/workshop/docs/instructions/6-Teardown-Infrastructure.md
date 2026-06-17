# 6. Tear down di infrastructure

!!! tip "BY THE END OF THIS MODULE YOU GO FIT"

    - [ ] Understand why e important to clean up resources and manage cost
    - [ ] Use `azd down` to comot infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if e necessary
    - [ ] **Lab 6:** Comot Azure resources and confirm dem don remove

---

## Bonus Exercises

Before we tear down the project, spend small time to do some open-ended exploration.

!!! info "Try Dis Prompts Wey You Fit Try"

    **Experiment wit GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore di Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Deprovision Infra

1. Tearing down infrastructure easy like dis:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. The `--purge` flag ensures that it also purges soft-deleted Cognitive Service resources, thereby releasing quota held by these resources. Once complete you will see something like this:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Optional) If you now run `azd up` again, you will notice the gpt-4.1 model gets deployed since the environment variable was changed (and saved) in the local `.azure` folder. 

      Dis na di model deployments **before**:

      ![Initial](../../../../../translated_images/pcm/14-deploy-initial.30e4cf1c29b587bc.webp)

      And here e be **after**:
      ![New](../../../../../translated_images/pcm/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->