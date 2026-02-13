# 7. ಸಾರಾಂಶ ಮತ್ತು ಮುಂದಿನ ಹಂತಗಳು

!!! tip "ಮುಖ್ಯ ಸಾರಾಂಶ ಸಂದೇಶಗಳು"

    - [ ] AZD ಟೆಂಪ್ಲೇಟ್ಗಳು AI ಅಪ್ಲಿಕೇಶನ್ ಅಭಿವೃದ್ಧಿಯನ್ನು ದಿನಗಳಿಂದ ಗಂಟೆಗಳ ಮಟ್ಟಿಗೆ ವೇಗಗೊಳಿಸುತ್ತವೆ
    - [ ] ಶೋಧನೆ → ನಿಯೋಜನೆ → ಕಸ್ಟಮೈಜೇಶನ್ ವಿಧಾನವು ಸಂರಚಿತ ಕಲಿಕಾ ಮಾರ್ಗವನ್ನು ಒದಗಿಸುತ್ತದೆ
    - [ ] MCP ಸರ್ವರ್‌ಗಳೊಂದಿಗೆ GitHub Copilot ಸಂಕೀರ್ಣ ಕೋಡ್‌ಬೇಸ್‌ಗಳನ್ನು ಸ್ವಾಭಾವಿಕ ಭಾಷೆಯಲ್ಲಿ ಅನ್ವೇಷಿಸಲು ಸಾಧ್ಯವಾಗಿಸುತ್ತದೆ
    - [ ] Microsoft Foundry ಒಳನಿರೀಕ್ಷಣೆ, ಮೌಲ್ಯಮಾಪನ ಮತ್ತು ಭದ್ರತಾ ಪರೀಕ್ಷೆಗಳನ್ನು ಒದಗಿಸುತ್ತದೆ

---

## 1. ನೀವು ಸಾಧಿಸಿದದ್ದು

ಅಭಿನಂದನೆಗಳು! ಈ ಕಾರ್ಯಾಗಾರದಲ್ಲಿ, ನೀವು ಯಶಸ್ವಿಯಾಗಿ:

| Module | Accomplishment |
|:---|:---|
| **Module 1** | Azure Developer CLI ಅನ್ನು ಕಂಡುಹಿಡಿದು AI ಟೆಂಪ್ಲೇಟ್ನನ್ನು ಆಯ್ಕೆ ಮಾಡಿದರು |
| **Module 2** | ಸಂಪೂರ್ಣ AI ಏಜೆಂಟ್ ಪರಿಹಾರವನ್ನು ನಿಯೋಜಿಸಿ ಮತ್ತು ಪರಿಶೀಲಿಸಿದರು |
| **Module 3** | ಟೆಂಪ್ಲೇಟನ್ನು ವಿಶ್ಲೇಷಿಸಿ ಅದರ ವಾಸ್ತುರಚನೆಯನ್ನು ಅರ್ಥಮಾಡಿಕೊಂಡರು |
| **Module 4** | `azure.yaml` ಸಂರಚನೆ ಮತ್ತು ಜೀವನಚಕ್ರ ಹುಕ್‌ಗಳನ್ನು ಅನ್ವೇಷಿಸಿದರು |
| **Module 5** | ಟೆಂಪ್ಲೇಟನ್ನು ನಿಮ್ಮ ಸ್ವಂತ ಪರಿಸ್ಥಿತಿಗಾಗಿ ಕಸ್ಟಮೈಸ್ ಮಾಡಿದರು |
| **Module 6** | ಭದ್ರವಾಗಿ ಮೂಲಸೌಕರ್ಯವನ್ನು ತೆರವುಗೊಳಿಸಿ ಮತ್ತು ಸಂಪನ್ಮೂಲಗಳನ್ನು ನಿರ್ವಹಿಸಿದರು |

---

## 2. ನೀವು ಪರಿಣತಿ ಪಡೆದ ಪ್ರಮುಖ ತತ್ವಗಳು

### Azure Developer CLI (azd)
- `azd init` - ಟೆಂಪ್ಲೇಟಿನಿಂದ ಪ್ರಾಜೆಕ್ಟ್‌ಗಳನ್ನು ಪ್ರಾರಂಭಿಸಿ
- `azd up` - ಒಂದೇ ಆದೇಶದಲ್ಲಿ ಪ್ರೊವಿಷನ್ ಮಾಡಿ ಮತ್ತು ನಿಯೋಜಿಸಿ
- `azd env` - ಪರಿಸರ ಚರಗಳನ್ನು ನಿರ್ವಹಿಸಿ
- `azd down` - ಸಂಪನ್ಮೂಲಗಳನ್ನು ಸುರಕ್ಷಿತವಾಗಿ ತೆರವುಗೊಳಿಸಿ

### AZD Template Structure
- `azure.yaml` - ಸಂರಚನೆ ಮತ್ತು ನಿಯೋಜನೆ ಹೂಕ್‌ಗಳು
- `infra/` - Bicep ಮೂಲಕ ಮೂಲಸೌಕರ್ಯ-ಆಸ್-ಕೋಡ್
- `src/` - ಅಪ್ಲಿಕೇಶನ್ ಮೂಲ ಕೋಡ್
- `scripts/` - ಸ್ವಯಂಚಾಲಿತ ಮತ್ತು ಸೆಟ್‌ಅಪ್ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು

### Microsoft Foundry Capabilities
- ಬುದ್ಧಿಮಾನ್ ಸಹಾಯಕರಿಗಾಗಿ AI ಏಜೆಂಟ್ ಸೇವೆ
- ಜ್ಞಾನ ಪಡೆಯಲು File Search ಮತ್ತು Azure AI Search
- ಒಳಗೊಂಡಿರುವ ಟ್ರೇಸಿಂಗ್, ನಿರೀಕ್ಷಣೆ ಮತ್ತು ಮೌಲ್ಯಮಾಪನ
- AI ಭದ್ರತಾ ಪ್ರಮಾಣೀಕರಣಕ್ಕಾಗಿ ರೆಡ್-ಟೀಮಿಂಗ್

---

## 3. ನಿಮ್ಮ ಅಧ್ಯಯನ ಪ್ರಯಾಣವನ್ನು ಮುಂದುವರೆಸಿ

### ಶಿಫಾರಸು ಮಾಡಿದ ಮುಂದಿನ ಹಂತಗಳು

| Path | Resource | Time |
|:---|:---|:---|
| **Complete Course** | [AZD for Beginners Curriculum](../../README.md) | 8-12 ಗಂಟೆಗಳು |
| **Try Another Template** | [Microsoft Foundry Templates](https://ai.azure.com/templates) | 1-2 ಗಂಟೆಗಳು |
| **Deep Dive** | [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | ನಿರಂತರ |
| **Community** | [Azure Discord](https://aka.ms/foundry/discord) | ಇಂದು ಸೇರಿ! |

### Suggested Templates to Try Next

1. **[Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)** - ನಿಮ್ಮ ಡೇಟಾದೊಂದಿಗೆ ಅಡಿಪಾಯ ಚಾಟ್
2. **[Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** - ಪ್ರಗತ RAG ಮಾದರಿಗಳು
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - ಎಂಟರ್ಪ್ರೈಸ್ ರೀಟೇಲ್ ದೃಶ್ಯಗಳು

---

## 4. ಕಾರ್ಯಾಗಾರ ಸವಾಲು

ನಿಮ್ಮ ಕೌಶಲ್ಯಗಳನ್ನು ಪರೀಕ್ಷಿಸಲು ಸಿದ್ದರಾ? ಈ ಸವಾಲುಗಳನ್ನು ಪ್ರಯತ್ನಿಸಿ:

| Challenge | Description | Difficulty |
|:---|:---|:---|
| **1. Multi-Agent Scenario** | ವಿಭಿನ್ನ ಉದ್ಯಮಕ್ಕಾಗಿ ನಿಯೋಜಿಸಿ ಮತ್ತು ಕಸ್ಟಮೈಸ್ ಮಾಡಿ (ಉದಾ., ಆರೋಗ್ಯ, ಹಣಕಾಸು) | ⭐⭐ |
| **2. Custom Knowledge Base** | ನಿಮ್ಮ ಸ್ವಂತ ಡೇಟಾ ಫೈಲ್‌ಗಳನ್ನು ಸೇರಿಸಿ ಮತ್ತು ಕಸ್ಟಮ್ ಸರ್ಚ್ ಸೂಚ್ಯಂಕವನ್ನು ರಚಿಸಿ | ⭐⭐⭐ |
| **3. Production Deployment** | `azd pipeline config` ಬಳಸಿ GitHub Actions ಸಹಿತ CI/CD ಅನ್ನು ಸಂಯೋಜಿಸಿ | ⭐⭐⭐⭐ |

---

## 5. ನಿಮ್ಮ ಪ್ರತಿಕ್ರಿಯೆಯನ್ನು ಹಂಚಿಕೊಳ್ಳಿ

ನಿಮ್ಮ ಪ್ರತಿಕ್ರಿಯೆ ಈ ಕಾರ್ಯಾಗಾರವನ್ನು ಉತ್ತಮಗೊಳಿಸಲು ಸಹಾಯ ಮಾಡುತ್ತದೆ!

- **GitHub Issues**: [Post feedback](https://github.com/microsoft/azd-for-beginners/issues) - tag with `Workshop`
- **Discord**: ಸೇರಿ [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - `#get-help` ನಲ್ಲಿ ಪೋಸ್ಟ್ ಮಾಡಿ
- **Contributions**: ಪುಲ್ ರಿಕ್ವೆಸ್ಟ್‌ಗಳನ್ನು ಸಲ್ಲಿಸುವ ಮೂಲಕ ಕಾರ್ಯಾಗಾರವನ್ನು ಸುಧಾರಿಸಲು ಸಹಾಯ ಮಾಡಿ!

---

## ಧನ್ಯವಾದಗಳು! 🎉

AZD for AI Developers ಕಾರ್ಯಾಗಾರವನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದ್ದಕ್ಕಾಗಿ ಧನ್ಯವಾದಗಳು. ಈ ಅನುಭವವು ನಿಮಗೆ Azure‌ನಲ್ಲಿ AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿರ್ಮಿಸಿ ಮತ್ತು ನಿಯೋಜಿಸಲು ಬೇಕಾದ ಕೌಶಲ್ಯಗಳು ಮತ್ತು ಆತ್ಮವಿಶ್ವಾಸವನ್ನು ಒದಗಿಸಿದೆ ಎಂಬ ನಿರೀಕ್ಷೆ ಇದೆ.

**ನಿರಂತರವಾಗಿ ನಿರ್ಮಿಸಿರಿ, ನಿರಂತರವಾಗಿ ಕಲಿಯಿರಿ, ಮತ್ತು Azure AI ಡೆವಲಪರ್ ಸಮುದಾಯಕ್ಕೆ ಸ್ವಾಗತ!**

---

| | |
|:---|:---|
| **📚 ಕೋರ್ಸ್ ಮನೆ** | [AZD For Beginners](../../README.md) |
| **📖 ಡಾಕ್ಯುಮೆಂಟೇಶನ್** | [Azure Developer CLI Docs](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI ಟೆಂಪ್ಲೇಟ್ಗಳು** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
| **💬 ಸಮುದಾಯ** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ನಿರಾಕರಣೆ:
ಈ ದಸ್ತಾವೇಜನ್ನು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ಶುದ್ಧತೆಗೆ ಪ್ರಯತ್ನಿಸಿದರೂ ಸಹ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸ್ಪಷ್ಟತೆಗಳು ಇರಬಹುದೆಂದು ದಯವಿಟ್ಟು ಗಮನಿಸಿ. ಮೂಲ ಭಾಷೆಯಲ್ಲಿನ ಮೂಲ ದಸ್ತಾವೇಜನ್ನು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸದರಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳು ಅಥವಾ ತಪ್ಪಾದ ವ್ಯಾಖ್ಯಾನಗಳಿಗಾಗಿ ನಾವು ಜವಾಬ್ದಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->