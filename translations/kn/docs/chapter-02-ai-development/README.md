# ಅಧ್ಯಾಯ 2: ಎಐ-ಪ್ರಥಮ ಅಭಿವೃದ್ಧಿ

**📚 Course**: [AZD ಪ್ರಾರಂಭಿಕರಿಗೆ](../../README.md) | **⏱️ Duration**: 1-2 ಗಂಟೆಗಳು | **⭐ Complexity**: ಮಧ್ಯಮ

---

## ಅವಲೋಕನ

ಈ ಅಧ್ಯಾಯವು Azure Developer CLI ಮತ್ತು Microsoft Foundry ಸೇವೆಗಳನ್ನು ಬಳಸಿಕೊಂಡು ಎಐ-ಸಾಮರ್ಥ್ಯಯಿರುವ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿಯೋಜಿಸುವುದನ್ನು ಒಳಗೊಂಡಿದೆ. ಸರಳ ಎಐ ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಂದ ಉಪಕರಣಗಳೊಂದಿಗೆ ಬುದ್ಧಿವಂತ ಏಜೆಂಟ್‌ಗಳವರೆಗೂ.

> **ಮಾನ್ಯತೆ ಟಿಪ್ಪಣಿ (2026-06-15):** ಈ ಅಧ್ಯಾಯದಲ್ಲಿನ ಕಮಾಂಡ್ ಫ್ಲೋ ಮತ್ತು ವಿಸ್ತರಣೆ ಮಾರ್ಗದರ್ಶನವನ್ನು `azd` `1.25.6` ಮತ್ತು ಪ್ರಸ್ತುತ ಪೂರ್ವದರ್ಶನ AI ಏಜೆಂಟ್ ವಿಸ್ತರಣೆ ಬಿಡುಗಡೆ `azure.ai.agents` `0.1.40-preview` ವಿರುದ್ಧ ಪರಿಶೀಲಿಸಲಾಗಿದೆ. ನೀವು ಹಳೆಯ AZD ಬಿಲ್ಡ್‌ನಲ್ಲಿ ಇದ್ದರೆ, ಮೊದಲು ಅಪ್‌ಡೇಟ್ ಮಾಡಿ ನಂತರ ಅಭ್ಯಾಸಗಳನ್ನು ಮುಂದುವರೆಸಿರಿ.

## ಕಲಿಕೆಯ ಉದ್ದೇಶಗಳು

ಈ ಅಧ್ಯಾಯವನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದಾಗ, ನೀವು:
- ಪೂರ್ವ-ನಿರ್ಮಿತ AZD ಟೆಂಪ್ಲೇಟ್ಗಳನ್ನು ಬಳಸಿ ಎಐ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿಯೋಜಿಸುವದು
- AZD ಜೊತೆಗೆ Microsoft Foundry ಏಕೀಕರಣವನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು
- ಉಪಕರಣಗಳೊಂದಿಗೆ ಎಐ ಏಜೆಂಟ್‌ಗಳನ್ನು ಸಂರಚಿಸಿ ಮತ್ತು ಕಸ್ಟಮೈಸ್ ಮಾಡುವುದು
- RAG (Retrieval-Augmented Generation) ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿಯೋಜಿಸುವದು

---

## 📚 ಪಾಠಗಳು

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | AZD ಅನ್ನು Foundry ಸೇವೆಗಳಿಗೆ ಸಂಪರ್ಕಿಸಿ | 30 ನಿಮಿಷ |
| 2 | [AI Agents Guide](agents.md) | ಉಪಕರಣಗಳೊಂದಿಗೆ ಬುದ್ಧಿವಂತ ಏಜೆಂಟ್‌ಗಳನ್ನು ನಿಯೋಜಿಸಿ | 45 ನಿಮಿಷ |
| 3 | [AI Model Deployment](ai-model-deployment.md) | ಎಐ ಮಾದರಿಗಳನ್ನು ನಿಯೋಜಿಸಿ ಮತ್ತು ಸಂರಚಿಸಿ | 30 ನಿಮಿಷ |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | ಪ್ರಾಯೋಗಿಕ: ನಿಮ್ಮ ಎಐ ಪರಿಹಾರವನ್ನು AZD-ಗಾಗಿ ಸಿದ್ಧಗೊಳಿಸಿ | 60 ನಿಮಿಷ |

---

## 🚀 ವೇಗದ ಪ್ರಾರಂಭ

```bash
# ಆಯ್ಕೆ 1: RAG ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್
azd init --template azure-search-openai-demo
azd up

# ಆಯ್ಕೆ 2: ಕೃತಕ ಬುದ್ಧಿಮತ್ತೆ ಏಜೆಂಟ್ಗಳು
azd init --template get-started-with-ai-agents
azd up

# ಆಯ್ಕೆ 3: ವೇಗದ ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 ಮುಖ್ಯ ಎಐ ಟೆಂಪ್ಲೇಟ್ಗಳು

| Template | Description | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ಉಲ್ಲೇಖಗಳೊಂದಿಗೆ RAG ಚಾಟ್ | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ಉಪಕರಣಗಳೊಂದಿಗೆ ಎಐ ಏಜೆಂಟ್ | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | ಮೂಲಭೂತ ಎಐ ಚಾಟ್ | OpenAI + Container Apps |

---

## 💰 ವೆಚ್ಚ ಅರಿವು

| Environment | Estimated Monthly Cost |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**ಟಿಪ್:** ಪರೀಕ್ಷೆ ನಂತರ ಶುಲ್ಕಗಳನ್ನು ತಪ್ಪಿಸಲು `azd down` ಅನ್ನು ಚಾಲನೆ ಮಾಡಿ.

---

## 🔗 ನ್ಯಾವಿಗೇಶನ್

| Direction | Chapter |
|-----------|---------|
| **Previous** | [ಅಧ್ಯಾಯ 1: ಅಡಿಪಾಯ](../chapter-01-foundation/README.md) |
| **Next** | [ಅಧ್ಯಾಯ 3: ಸಂರಚನೆ](../chapter-03-configuration/README.md) |
| **Skip to** | [ಅಧ್ಯಾಯ 8: Production Patterns](../chapter-08-production/README.md) |

---

## 📖 ಸಂಬಂಧಿತ ಸಂಪನ್ಮೂಲಗಳು

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕಾರ**:
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಡ್ಡೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->