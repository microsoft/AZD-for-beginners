# 6. Teardown Infrastructure

!!! tip "BY THE END OF THIS MODULE YOU GO FIT"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Bonus Exercises

Before we tear down the project, make small time do some open-ended exploration.

!!! info "Try These Exploration Prompts"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Deprovision Infra

!!! warning "If you also complete the GA hosted-agent exercise"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. To tear down infrastructure na e easy as:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Confirm the selected environment and check resources wey you go delete. This one go remove Azure resources and fit destroy data. Make you keep the confirmation prompt for this learning workflow. When you finish, you go see output wey be like:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Make you check if e really delete for the portal and look for resources wey no dey for the deployment area. Cost reporting and quota updates fit dey slow. Local `.azure` configuration go still dey unless you remove am yourself.

1. `azd down --purge` still dey request make dem delete properly all supported soft-deleted resources. Make you use am only if recovery no go dey needed and you sabi how retention/purge-protection policies dey work. E no fit guarantee say quota go free quick.

1. No try redeploy just to check if cleanup don happen. Later if you wan, you fit use proper `azd up` to recreate resources with the local input dem still get, but e go cause charges again. Model updates na usually with supported provisioning changes, no be teardown.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->