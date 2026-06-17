# 6. ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ತೆರವುಗೊಳಿಸುವುದು

!!! tip "ಈ ಘಟಕದ ಕೊನೆಯಲ್ಲಿ ನೀವು ಕೆಳಗಿನ বিষয়ಗಳನ್ನು ಮಾಡಲು ಸಾಧ್ಯವಾಗುತ್ತದೆ"

    - [ ] ಸಂಪನ್ಮೂಲಗಳ ಸ್ವಚ್ಛೀಕರಣ ಮತ್ತು ವೆಚ್ಚ ನಿರ್ವಹಣೆಯ ಮಹತ್ವವನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
    - [ ] ಸುರಕ್ಷಿತವಾಗಿ ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಅನ್ನು ಡೀಪ್ರೊವಿಷನ್ ಮಾಡಲು `azd down` ಅನ್ನು ಬಳಸಿ
    - [ ] ಅಗತ್ಯವಿದ್ದರೆ ಸಾಫ್ಟ್-ಡಿಲೀಟ್ ಮಾಡಿದ Azure AI ಸೇವೆಗಳನ್ನು ಪುನರುद्धರಿಸು
    - [ ] **ಲ್ಯಾಬ್ 6:** Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ಸ್ವಚ್ಛಗೊಳಿಸಿ ಮತ್ತು ತೆಗೆದುಹಾಕಲಾದುದನ್ನು ಪರಿಶೀಲಿಸಿ

---

## ಬೋನಸ್ ವ್ಯಾಯಾಮಗಳು

Before we tear down the project, take a few minutes to do some open-ended exploration.

!!! info "ಈ ಅನ್ವೇಷಣಾ ಪ್ರಾಂಪ್ಟ್‌ಗಳನ್ನು ಪ್ರಯತ್ನಿಸಿ"

    **GitHub Copilot ಜೊತೆಗೆ ಪ್ರಯೋಗ ಮಾಡಿ:**
    
    1. ಪ್ರಶ್ನೆ ಕೇಳಿ: `What other AZD templates could I try for multi-agent scenarios?`
    2. ಪ್ರಶ್ನೆ ಕೇಳಿ: `How can I customize the agent instructions for a healthcare use case?`
    3. ಪ್ರಶ್ನೆ ಕೇಳಿ: `What environment variables control cost optimization?`
    
    **Azure ಪೋರ್ಟಲ್ ಅನ್ನು ಅನ್ವೇಷಿಸಿ:**
    
    1. ನಿಮ್ಮ ಡಿಪ್ಲಾಯ್ಮೆಂಟ್‌ಗೆ ಸಂಬಂಧಿಸಿದ Application Insights ಮೆಟ್ರಿಕ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
    2. Provision ಮಾಡಲಾದ ಸಂಪನ್ಮೂಲಗಳ ವೆಚ್ಚ ವಿಶ್ಲೇಷಣೆಯನ್ನು ನೋಡಿ
    3. Microsoft Foundry ಪೋರ್ಟಲ್‌ನ ಏಜೆಂಟ್ ಪ್ಲೇಗ್ರೌಂಡ್ ಅನ್ನು ಮತ್ತೊಮ್ಮೆ ಅನ್ವೇಷಿಸಿ

---

## ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ತೆರವು

1. ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಅನ್ನು ತೆರವುಗೊಳಿಸುವುದು ಹೀಗೇ ಸುಲಭ:

      
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

1. (ಐಚ್ಛಿಕ) ನೀವು ಈಗ `azd up` ಅನ್ನು ಮತ್ತೆ ಚಾಲನೆ ಮಾಡಿದರೆ, ಸ್ಥಳೀಯ `.azure` ಫೋಲ್ಡರ್‌ನಲ್ಲಿ ಪರಿಸರ ಚರ ಬದಲಾಗಿರುವುದರಿಂದ (ಮತ್ತು ಉಳಿಸಲಾಗಿದೆ) gpt-4.1 ಮಾದರಿ ನಿಯೋಜಿತವಾಗುತ್ತದೆ ಎಂಬುದನ್ನು ನೀವು ಗಮನಿಸುವಿರಿ. 

      ಇಲ್ಲಿ ಮಾದರಿ ನಿಯೋಜನೆಗಳು **ಮೊದಲು** ಹೀಗಿದ್ದವು:

      ![ಆರಂಭಿಕ](../../../../../translated_images/kn/14-deploy-initial.30e4cf1c29b587bc.webp)

      ಮತ್ತು ಇದು **ನಂತರ** ಹೀಗಿದೆ:
      ![ಹೊಸ](../../../../../translated_images/kn/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕಾರ**:
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಡ್ಡೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->