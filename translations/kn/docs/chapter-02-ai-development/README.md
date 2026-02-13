# ಅಧ್ಯಾಯ 2: ಎಐ-ಪ್ರಥಮ ಅಭಿವೃದ್ಧಿ

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 1-2 hours | **⭐ Complexity**: Intermediate

---

## Overview

ಈ ಅಧ್ಯಾಯವು Azure Developer CLI ಮತ್ತು Microsoft Foundry ಸೇವೆಗಳನ್ನು ಬಳಸಿಕೊಂಡು ಎಐ-ಸಾಧಿತ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿಯೋಜಿಸುವುದಕ್ಕೆ ಗುರಿಯಾಗಿದ್ದು, ಸರಳ ಎಐ ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಂದ ಉಪಕರಣಗಳೊಂದಿಗೆ ಬುದ್ಧಿವಂತ ಏಜೆಂಟ್‌ಗಳವರೆಗೆ ಒಳಗೊಂಡಿರುತ್ತದೆ.

## Learning Objectives

ಈ ಅಧ್ಯಾಯ ಪೂರ್ಣಗೊಳಿಸಿದ ಮೇಲೆ, ನೀವು:
- ಮುನ್ನಿರಚಿಸಿದ AZD ಟೆಂಪ್ಲೇಟ್ಗಳನ್ನು ಬಳಸಿಕೊಂಡು ಎಐ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿಯೋಜಿಸಬಲ್ಲಿರಿ
- AZD ಜೊತೆಗೆ Microsoft Foundry ಏಕೀಕರಣವನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
- ಉಪಕರಣಗಳೊಂದಿಗೆ ಎಐ ಏಜೆಂಟ್‌ಗಳನ್ನು ಸಂರಚಿಸಿ ಮತ್ತು ಕಸ್ಟಮೈಸ್ ಮಾಡು
- RAG (Retrieval-Augmented Generation) ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿಯೋಜಿಸು

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | AZD ಮತ್ತು Foundry ಸೇವೆಗಳನ್ನು ಸಂಪರ್ಕಿಸಿ | 30 ನಿಮಿಷ |
| 2 | [AI Agents Guide](agents.md) | ಉಪಕರಣಗಳೊಂದಿಗೆ ಬುದ್ಧಿವಂತ ಏಜೆಂಟ್‌ಗಳನ್ನು ನಿಯೋಜಿಸಿ | 45 ನಿಮಿಷ |
| 3 | [AI Model Deployment](ai-model-deployment.md) | ಎಐ ಮಾದರಿಗಳನ್ನು ನಿಯೋಜಿಸಿ ಮತ್ತು ಸಂರಚಿಸಿ | 30 ನಿಮಿಷ |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | ಪ್ರಾಯೋಗಿಕ: ನಿಮ್ಮ ಎಐ ಪರಿಹಾರವನ್ನು AZD-ರೆಡಿ ಮಾಡಿ | 60 ನಿಮಿಷ |

---

## 🚀 Quick Start

```bash
# ಆಯ್ಕೆ 1: RAG ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್
azd init --template azure-search-openai-demo
azd up

# ಆಯ್ಕೆ 2: ಎಐ ಏಜೆಂಟುಗಳು
azd init --template get-started-with-ai-agents
azd up

# ಆಯ್ಕೆ 3: ತ್ವರಿತ ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Featured AI Templates

| Template | Description | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ಉಲ್ಲೇಖಗಳೊಂದಿಗೆ RAG ಚಾಟ್ | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ಉಪಕರಣಗಳೊಂದಿಗೆ ಎಐ ಏಜೆಂಟ್ | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | ಮೂಲಭೂತ ಎಐ ಚಾಟ್ | OpenAI + Container Apps |

---

## 💰 Cost Awareness

| Environment | Estimated Monthly Cost |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**ಸೂಚನೆ:** ಪರೀಕ್ಷೆ ಮಾಡಿದ ನಂತರ ಶುಲ್ಕಗಳನ್ನು ತಪ್ಪಿಸಲು `azd down` ನಡೆಸಿ.

---

## 🔗 Navigation

| Direction | Chapter |
|-----------|---------|
| **Previous** | [ಅಧ್ಯಾಯ 1: ಮೂಲಭೂತ](../chapter-01-foundation/README.md) |
| **Next** | [ಅಧ್ಯಾಯ 3: ಸಂರಚನೆ](../chapter-03-configuration/README.md) |
| **Skip to** | [ಅಧ್ಯಾಯ 8: ಉತ್ಪಾದನಾ ಮಾದರಿಗಳು](../chapter-08-production/README.md) |

---

## 📖 Related Resources

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ನಿರಾಕರಣೆ:
ಈ ದಸ್ತಾವೇಜನ್ನು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ನೀಡಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ ಸಹ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ತಪ್ಪುತೆಗಳು ಇರಬಹುದು ಎಂದು ದಯವಿಟ್ಟು ಗಮನಿಸಿರಿ. ಮೂಲ ಭಾಷೆಯಲ್ಲಿನ ಮೂಲ ದಸ್ತಾವೇಜನ್ನು ಅಧಿಕೃತ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಅತ್ಯಂತ ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪುಅರ್ಥಗರ್ಭತೆಗಳು ಅಥವಾ ದೋಷಗಳಿಗಾಗಿ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->