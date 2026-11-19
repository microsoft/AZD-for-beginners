# 6. ಮೂಲಸೌಕರ್ಯವನ್ನು ತೆರವುಗೊಳಿಸುವುದು

!!! tip "ಈ ಘಟಕದ ಅಂತ್ಯಕ್ಕೆ ನೀವು ಈ ಕೆಳಕಂಡವುಗಳನ್ನು ಮಾಡಬಹುದು"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## ಬೋನಸ್ ವ್ಯಾಯಾಮಗಳು

ನಾವು ಯೋಜನೆ ಮುಕ್ತಾಯ ಮಾಡುವ ಮೊದಲು, ಸ್ವತಂತ್ರ ಅನ್ವೇಷಣೆಗೆ ಕೆಲವು ನಿಮಿಷ ತೆಗೆದುಕೊಳ್‍ಳಿ.

!!! info "ಈ ಅನ್ವೇಷಣೆ ಪ್ರಾಂಪ್ಟ್‌ಗಳನ್ನು ಪ್ರಯತ್ನಿಸಿ"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## ಮೂಲಸೌಕರ್ಯವನ್ನು ನಿರ್ಭಂಧಿಸು

!!! warning "ನೀವು GA ನೆಲೆಸಿದ-ಎಜೆಂಟ್ ವ್ಯಾಯಾಮವನ್ನು ಕೂಡ ಸಂಪೂರ್ಣಗೊಳಿಸಿದರೆ"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. ಮೂಲಸೌಕರ್ಯವನ್ನು ತೆರವುಗೊಳಿಸುವುದು ಹೀಗೆ ಸೌಕರ್ಯವಾಗಿದೆ:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. ಆಯ್ದ ಪರಿಸರವನ್ನು ದೃಢೀಕರಿಸಿ ಮತ್ತು ಅಳಿಸಲಾಗಲಿರುವ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಪರಿಶೀಲಿಸಿ. ಇದು ಅಜೂರ್ ಸಂಪನ್ಮೂಲಗಳನ್ನು ತೆಗೆದುಹಾಕುತ್ತದೆ ಮತ್ತು ಡೇಟಾವನ್ನು ನಾಶ ಮಾಡಬಹುದು. ಈ ಕಲಿಕೆ ಕಾರ್ಯಪ್ರವಾಹಕ್ಕಾಗಿ ದೃಢೀಕರಣ ಪ್ರಾಂಪ್ಟ್ ಅನ್ನು ಇಡಿ. ನಿಮ್ಮಿಂದ ಮುಗಿದದಾದ ಮೇಲೆ ಈ ರೀತಿಯ ಔಟ್‍ಪುಟ್ ಕಾಣುತ್ತದೆ:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. ಪೋರ್ಟಲ್‌ನಲ್ಲಿ ಅಳಿಕೆ ದೃಢೀಕರಿಸಿ ಮತ್ತು ನಿಯೋಜನೆಯ ವ್ಯಾಪ್ತಿಗೆ ಹೊರಗಿನ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಪರಿಶೀಲಿಸಿ. ವೆಚ್ಚ ವರದಿ ಮತ್ತು ಕ್ವೋಟಾ تازهಗೊಳಿಸುವಿಕೆಗಳಲ್ಲಿ ತಡವಾಗಬಹುದು. ಸ್ಥಳೀಯ `.azure` ಸಂರಚನೆ ಸ್ಪಷ್ಟವಾಗಿ ತೆಗೆದುಹಾಕದಿದ್ದರೆ ಉಳಿಯುತ್ತದೆ.

1. `azd down --purge` ಜೊತೆಗೆ ಬೆಂಬಲಿತ ಮೃದುವಾಗಿ ಅಳಿಸಲಾಗಿರುವ ಸಂಪನ್ಮೂಲಗಳ ಶಾಶ್ವತ ಅಳಿಕೆಯನ್ನು ವಿನಂತಿಸುತ್ತದೆ. ನೀವು ಮರುಪಡೆಯಲು ಅಗತ್ಯವಿಲ್ಲ ಮತ್ತು ಉಳಿಸುವಿಕೆ/ನಾಶ-ರಕ್ಷಣಾ ನೀತಿಗಳನ್ನು ತಿಳಿದಿದ್ದಾಗ ಮಾತ್ರ ಇದನ್ನು ಬಳಸಿ. ಇದು ತಕ್ಷಣದ ಕ್ವೋಟಾ ಬಿಡುಗಡೆಗೆ ಗ್ಯಾರಂಟಿ ನೀಡುವುದಿಲ್ಲ.

1. ಶುದ್ಧಿ ಪರಿಶೀಲನೆಗಾಗಿ ಪುನರ್ ನಿಯೋಜನೆ ಮಾಡಬೇಡಿ. ನಂತರದ ಉದ್ದೇಶಿತ `azd up` ಉಳಿದ ಸ್ಥಳೀಯ ಇನ್‌ಪುಟ್‌ಗಳನ್ನು ಬಳಸಿಕೊಂಡು ಸಂಪನ್ಮೂಲಗಳನ್ನು ಪುನಃ ರಚಿಸಬಹುದು ಮತ್ತು ಮತ್ತೊಮ್ಮೆ ಶುಲ್ಕವನ್ನು ವಿಧಿಸುತ್ತದೆ. ಮಾದರಿ ನವೀಕರಣಗಳು ಸಾಮಾನ್ಯವಾಗಿ ಬೆಂಬಲಿತ ವಸತಿ ಬದಲಾವಣೆಗಳನ್ನು ಬಳಸುತ್ತವೆ, teardown ಅನ್ನು ಅಲ್ಲ.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕಾರ**:
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಡ್ಡೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->