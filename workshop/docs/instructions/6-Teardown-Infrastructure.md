# 6. Teardown Infrastructure

!!! tip "BY THE END OF THIS MODULE YOU WILL BE ABLE TO"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Bonus Exercises

Before we tear down the project, take a few minutes to do some open-ended exploration.

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

!!! warning "If you also completed the GA hosted-agent exercise"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. Tearing down infrastructure is as easy as:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Confirm the selected environment and review the resources to be deleted. This removes Azure resources and can destroy data. Keep the confirmation prompt for this learning workflow. Once complete you will see output similar to:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Verify deletion in the portal and check for resources outside the deployment's scope. Cost reporting and quota updates can lag. Local `.azure` configuration remains unless you explicitly remove it.

1. `azd down --purge` additionally requests permanent deletion of supported soft-deleted resources. Use it only when recovery is not required and you understand retention/purge-protection policies. It does not guarantee immediate quota release.

1. Do not redeploy just to verify cleanup. A later intentional `azd up` can recreate resources using the remaining local inputs, and incurs charges again. Model updates normally use supported provisioning changes, not teardown.
