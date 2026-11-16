# 6. ಮೂಲಸೌಕರ್ಯವನ್ನು ಅಗಲಾಗಿಸುವುದು

!!! tip "ಈ ಘಟಕದ ಅಂತ್ಯಕ್ಕೆ ನೀವು ಸಾಧ್ಯವಾಗುತ್ತದೆ"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## ಬಹುಮಾನ ವ್ಯಾಯಾಮಗಳು

ನಾವು ಯೋಜನೆಯನ್ನು ಮುಗಿಸುವ ಮುನ್ನ, ಸ್ವಲ್ಪ ಸಮಯ ತೆಗೆದುಕೊಂಡು ಕೆಲವು ತೆರೆಯಲಾದ ಅನ್ವೇಷಣೆಗಳನ್ನು ಮಾಡಿ.

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

## ಮೂಲಸೌಕರ್ಯವನ್ನು ಡೀಪ್ರೊವಿಷನ್ ಮಾಡುವುದು

1. ಮೂಲಸೌಕರ್ಯವನ್ನು ಅಗಲಿಸುವುದು ಬಹಳ ಸುಲಭ:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. ಆಯ್ಕೆಯಾದ ಪರಿಸರವನ್ನು ದೃಢೀಕರಿಸಿ ಮತ್ತು ಅಳಿಸಲು ಇರುವ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಪರಿಶೀಲಿಸಿ. ಇದು Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ತೆಗೆದುಹಾಕುತ್ತದೆ ಮತ್ತು ಡೇಟಾವನ್ನು ನಾಶ ಮಾಡಬಹುದು. ಈ ಕಲಿಕೆಯ ಕಾರ್ಯಪ್ರವಾಹಕ್ಕಾಗಿ ದೃಢೀಕರಣ ಪ್ರಾಂಪ್ಟ್ ಅನ್ನು ಉಳಿಸಿ. ಪೂರ್ಣಗೊಳ್ಳುವತ್ತ ನೀವು ಹೀಗೊಂದು ಔಟ್ಪುಟ್ ನೋಡುತ್ತೀರಿ:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. ಪೋರ್ಟಲ್‌ನಲ್ಲಿ ಅಳಿಸುವಿಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ ಮತ್ತು ನಿಯೋಜನೆಯ ವ್ಯಾಪ್ತಿಯ ಹೊರಗಿನ ಸಂಪನ್ಮೂಲಗಳನ್ನೂ ಪರಿಶೀಲಿಸಿ. ವೆಚ್ಚ ವರದಿ ಮತ್ತು ಕೋಟಾ ನವೀಕರಣದಲ್ಲಿ ಸಮಯ ಬೇಕಾಗಬಹುದು. ನೀವು ಸ್ಪಷ್ಟವಾಗಿ ತೆಗೆದುಹಾಕದಿದ್ದರೆ ಸ್ಥಳೀಯ `.azure` ಸಂರಚನೆ ಉಳಿಯುತ್ತದೆ.

1. `azd down --purge` ಹೆಚ್ಚುವರಿ ಆಗಿ ಸಾಫ್ಟ್-ಅಳಿಸಿರುವ ಸಂಪನ್ಮೂಲಗಳ ಶಾಶ್ವತ ಅಳಿಸುವಿಕೆಯನ್ನು ವಿನಂತಿಸುತ್ತದೆ. ಇದು ಪುನರುಜ್ಜೀವಿಸಲು ಅಗತ್ಯವಿಲ್ಲದಾಗ ಮಾತ್ರ ಉಪಯೋಗಿಸಿ ಮತ್ತು ಉಳಿಸುವಿಕೆ/ನಿರ್ವಹಣೆ ರಕ್ಷಣೆ ನೀತಿಗಳನ್ನು ನೀವು ತಿಳಿದುಕೊಳ್ಳಬೇಕು. ಇದು ತಕ್ಷಣದ ಕೋಟಾ ಬಿಡುಗಡೆ ಗಿವಂಟು ನೀಡುವುದಿಲ್ಲ.

1. ಶುದ್ಧೀಕರಣವನ್ನು ಪರಿಶೀಲಿಸಲು ಪುನಃ ನಿಯೋಜನೆ ಮಾಡಬೇಡಿ. ನಂತರದ ಉದ್ದೇಶಿತ `azd up` ಉಳಿದ ಸ್ಥಳೀಯ ಇನ್‌ಪುಟ್‌ಗಳನ್ನು ಉಪಯೋಗಿಸಿ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಪುನರ್ ನಿರ್ಮಿಸುತ್ತವೆ ಮತ್ತು ಮತ್ತೆ ಶುಲ್ಕ ವಿಧಿಸಲಾಗುತ್ತದೆ. ಮಾದರಿ ನವೀಕರಣಗಳು ಸಾಮಾನ್ಯವಾಗಿ ಬೆಂಬಲಿತ ಒದಗಿಸುವಿಕೆ ಬದಲಾವಣೆಗಳನ್ನು ಬಳಸುತ್ತವೆ, ಮೂಲಸೌಕರ್ಯವನ್ನು ಅಗಿಸಲು ಅಲ್ಲ.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕಾರ**:
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಡ್ಡೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->