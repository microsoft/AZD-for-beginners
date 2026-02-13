# AZD for AI Developers Workshop

> [!IMPORTANT]  
> **ಈ ಕಾರ್ಯಾಗಾರವನ್ನು ನಿಮ್ಮ ಸ್ಥಳೀಯ ಬ್ರೌಸರ್‌ನಲ್ಲಿ ಪೂರ್ವ ವೀಕ್ಷಿಸಲು ಇರುವ ಕಾರ್ಯಾಗಾರ ಮಾರ್ಗದರ್ಶಿಯೊಂದಿಗೆ ಸಂರಚಿತಗೊಳಿಸಲಾಗಿದೆ. ಪ್ರಾರಂಭಿಸಲು, ನೀವು ರೆಪೊದಲ್ಲಿ GitHub Codespaces ಅನ್ನು ಪ್ರಾರಂಭಿಸಬೇಕು — ನಂತರ ಸಕ್ರಿಯ VS Code ಟರ್ಮಿನಲ್ ಕಾಣುವವರೆಗೂ ಕಾಯಿಸಿ ಮತ್ತು ಟೈಪ್ ಮಾಡಿ:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **ನೀವು ಬ್ರೌಸರ್‌ನಲ್ಲಿ ಪೂರ್ವ ವೀಕ್ಷಣಾ ಪುಟವನ್ನು ತೆರೆಯಲು ಒಂದು ಪಾಪ್-ಅಪ್ ಸಂಭಾಷಣೆ ಕಾಣಬಹುದಾಗಿದೆ.**

Azure Developer CLI (AZD) ಅನ್ನು AI ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆಗೆ ಕೇಂದ್ರಬಿಂದು ಮಾಡಿಕೊಂಡು ಕಲಿಯಲು ನಡೆಸುವ ಹ್ಯಾಂಡ್ಸ್-ಆನ್ ಕಾರ್ಯಾಗಾರಕ್ಕೆ ಸುಸ್ವಾಗತ. ಈ ಕಾರ್ಯಾಗಾರವು ನಿಮ್ಮನ್ನು 3 ಹಂತಗಳಲ್ಲಿ AZD ಟೆಂಪ್ಲೇಟುಗಳ ಪ್ರತಿಯೋಗಿತಾ ಅಧ್ಯಯನಕ್ಕೆ ಸಹಾಯ ಮಾಡುತ್ತದೆ:

1. **Discovery** - ನಿನಗೆ ಯೋಗ್ಯವಾದ ಟೆಂಪ್ಲೇಟನ್ನು ಕಂಡುಹಿಡಿದುಕೊಳ್ಳಿ.
1. **Deployment** - ನಿಯೋಜಿಸಿ ಮತ್ತು ಇದು ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತದೆಯೆಂದು ದೃಢೀಕರಿಸಿ
1. **Customization** - ಬದಲಾವಣೆ ಮಾಡಿ ಮತ್ತು ಅದನ್ನು ನಿಮ್ಮದಾಗಿಸಿಕೊಳ್ಳಿ!

ಈ ಕಾರ್ಯಾಗಾರದ ಅವಧಿಯಲ್ಲಿ, ಉದ್ದೇಶಿತ ಅಂತ್ಯದ-ಇರುವ ಮುಕ್ತಾಯದ ಡೆವಲಪ್ಮೆಂಟ್ ಪ್ರಯಾಣವನ್ನು ಸರಳಗೊಳಿಸಲು ಮುಖ್ಯ ಡೆವಲಪರ್ ಸಾಧನಗಳು ಮತ್ತು ಕೆಲಸದ ಪ್ರಕ್ರಿಯೆಗಳನ್ನು ಪರಿಚಯಿಸಲಾಗುತ್ತದೆ.

| | | 
|:---|:---|
| **📚 ಕೋರ್ಸ್ ಹೋಮ್**| [AZD For Beginners](../README.md)|
| **📖 ಡಾಕ್ಯುಮೆಂಟೇಶನ್** | [AI ಟೆಂಪ್ಲೇಟ್ಗಳೊಂದಿಗೆ ಪ್ರಾರಂಭಿಸುವುದು](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️ AI ಟೆಂಪ್ಲೇಟ್ಸ್** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
|**🚀 ಮುಂದಿನ ಹಂತಗಳು** | [Take The Challenge](../../../../workshop/docs) |
| | |

## Workshop Overview

**Duration:** 3-4 hours  
**Level:** Beginner to Intermediate  
**Prerequisites:** Familiarity with Azure, AI concepts, VS Code & command-line tools.

ಇದು ಹ್ಯಾಂಡ್ಸ್-ಆನ್ ಕಾರ್ಯಾಗಾರವಾಗಿದ್ದು ನೀವು ಮಾಡುವುದರನ್ನೇ ಕಲಿತೀರಿ. ಅಭ್ಯಾಸಗಳನ್ನು ಪೂರೈಸಿದ ನಂತರ, ನಾವು ನಿಮ್ಮದಾಗಿ ಶಿಕ್ಷೆ ಶೇಖರಣೆಯಂತೆ AZD For Beginners ಪಠ್ಯಕ್ರಮವನ್ನು ಪರಿಶೀಲಿಸಲು ಶಿಫಾರಸು ಮಾಡುತ್ತೇವೆ, ಇದು ಭದ್ರತೆ ಮತ್ತು ಉತ್ಪಾದಕತೆ ಅತ್ಯತ್ತಮ ಅಭ್ಯಾಸಗಳತ್ತ ನಿಮ್ಮ ಅಧ್ಯಯನವನ್ನು ಮುಂದುವರಿಸುತ್ತದೆ.

| Time| Module  | Objective |
|:---|:---|:---|
| 15 mins | Introduction | Set the stage, understand the goals |
| 30 mins | Select AI Template | Explore options and pick starter | 
| 30 mins | Validate AI Template | Deploy default solution to Azure |
| 30 mins | Deconstruct AI Template | Explore structure and configuration |
| 30 mins | Configure AI Template | Activate and try available features |
| 30 mins | Customize AI Template | Adapt the template to your needs |
| 30 mins | Teardown Infrastructure | Cleanup and release resources |
| 15 mins | Wrap-Up & Next Steps | Learning resources, Workshop challenge |
| | |

## What You'll Learn

AZD ಟೆಂಪ್ಲೇಟ್ ಅನ್ನು Microsoft Foundry ಮೇಲಿನ ಅಂತ್ಯದಿಂದ-ಅಂತ್ಯವರೆಗಿನ ಡೆವಲಪ್ಮೆಂಟ್ ಸಾಮರ್ಥ್ಯಗಳನ್ನು ಮತ್ತು ಸಾಧನಗಳನ್ನು ಅನ್ವೇಷಿಸಲು ಇರುವ ಕಲಿಕೆಯ ಸ್ಯಾಂಡ್‌ಬಾಕ್ಸ್ ಆಗಿ ಪರಿಗಣಿಸಿ. ಈ ಕಾರ್ಯಾಗಾರದ ಅಂತ್ಯಕ್ಕೆ, ನೀವು ಈ ಸಂದರ್ಭದಲ್ಲಿ ವಿವಿಧ ಸಾಧನಗಳು ಮತ್ತು ಪರಿಕಲ್ಪನೆಗಳ ಬಗ್ಗೆ ಸಹಜ ಅರಿವು ಹೊಂದಿರುತ್ತೀರೇಂದು ನಾವು ನಿರೀಕ್ಷಿಸುತ್ತೇವೆ.

| Concept  | Objective |
|:---|:---|
| **Azure Developer CLI** | Understand tool commands and workflows|
| **AZD Templates**| Understand project structure and config|
| **Azure AI Agent**| Provision & deploy Microsoft Foundry project  |
| **Azure AI Search**| Enable context engineering with agents |
| **Observability**| Explore tracing, monitoring and evaluations |
| **Red Teaming**| Explore adversarial testing and mitigations |
| | |

## Workshop Modules

Ready to get started? Navigate through the workshop modules:

- [ಘಟಕ 1: AI ಟೆಂಪ್ಲೇಟನ್ನು ಆಯ್ಕೆಮಾಡಿ](instructions/1-Select-AI-Template.md)
- [ಘಟಕ 2: AI ಟೆಂಪ್ಲೇಟನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ](instructions/2-Validate-AI-Template.md) 
- [ಘಟಕ 3: AI ಟೆಂಪ್ಲೇಟನ್ನು ವಿಭಜಿಸಿ](instructions/3-Deconstruct-AI-Template.md)
- [ಘಟಕ 4: AI ಟೆಂಪ್ಲೇಟನ್ನು ಸಂರಚಿಸಿ](instructions/4-Configure-AI-Template.md)
- [ಘಟಕ 5: AI ಟೆಂಪ್ಲೇಟನ್ನು ವ್ಯತ್ಯಯಗೊಳಿಸಿ](instructions/5-Customize-AI-Template.md)
- [ಘಟಕ 6: ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ತೆರವು ಮಾಡು](instructions/6-Teardown-Infrastructure.md)
- [ಘಟಕ 7: ಸಮಾಪ್ತಿಯೂ ಮುಂದಿನ ಹಂತಗಳು](instructions/7-Wrap-up.md)

## Have feedback?

ಈ ರೆಪೊ ಮೇಲೆ ಒಂದು issue ಪೋಸ್ಟ್ ಮಾಡಿ (ಟ್ಯಾಗ್ ಮಾಡಿ `Workshop`) ಅಥವಾ ನಮಗೆ [Discord](https://aka.ms/foundry/discord) ನಲ್ಲಿ ಸೇರಿ ಮತ್ತು ನಮ್ಮ `#get-help` ಚಾನಲ್‌ಗೆ ಪೋಸ್ಟ್ ಮಾಡಿ

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ಅಸ್ವೀಕರಣ:
ಈ ದಸ್ತಾವೇಜನ್ನು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ಸಾಧ್ಯವಾದಷ್ಟು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ ಕೂಡ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸತ್ಯತೆಗಳು ಇರಬಹುದು ಎಂಬುದನ್ನು ದಯವಿಟ್ಟು ಗಮನಿಸಿರಿ. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ದಸ್ತಾವೇಜನ್ನು ಅಧಿಕೃತ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗೆ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದ ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ಭ್ರಾಂತಿ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನದ ಹೊಣೆಗಾರರಾಗಿ ನಾವು ಇರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->