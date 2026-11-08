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

1. Tearing down infrastructure na ez like:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Confirm di selected environment and check di resources wey you wan delete. Dis one go comot Azure resources and fit destroy data. Keep di confirmation prompt for dis learning workflow. When e finish, u go see output wey be like:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Make sure say di deletion happen for portal and check for resources wey dey outside di deployment scope. Cost reporting and quota updates fit dey slow. Local `.azure` configuration go still dey unless you clear am well-well.

1. `azd down --purge` still dey ask make dem delete permanent all di soft-deleted resources wey e fit handle. Use am only if you no need to recover anything and you sabi di retention/purge-protection policies. E no mean say e go free quota quick-quick.

1. No redo deploy just to check cleanup. Later wey you wan, you fit do intentional `azd up` to create resources again with the local inputs wey remain, but e go still charge you. Model updates normally dey use supported provisioning changes, no teardown.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->