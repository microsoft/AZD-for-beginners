# అధ్యాయం 2: AI-కేంద్రిత అభివృద్ధి

**📚 కోర్సు**: [AZD For Beginners](../../README.md) | **⏱️ వ్యవధి**: 1-2 గంటలు | **⭐ క్లిష్టత**: మధ్యస్థ

---

## అవలోకనం

ఈ అధ్యాయం Azure Developer CLI మరియు Microsoft Foundry సేవలను ఉపయోగించి AI-శక్తిగల అప్లికేషన్లు డిప్లాయ్ చేయడంపై దృష్టి పెట్టింది. సాధారణ AI చాట్ యాప్స్ నుంచి టూల్స్ కలిగిన తెలివైన ఏజెంట్ల వరకు.

## నేర్చుకునే లక్ష్యాలు

ఈ అధ్యాయం పూర్తి చేస్తే, మీరు:
- ప్రీ-బిల్ట్ AZD టెంప్లేట్స్ ఉపయోగించి AI అప్లికేషన్లను డిప్లాయ్ చేయడం
- AZD తో Microsoft Foundry ఇంటిగ్రేషన్‌ను అర్థం చేసుకోవడం
- టూల్స్‌తో AI ఏజెంట్లను కాన్ఫిగర్ చేసి అనుకూలీకరించడం
- RAG (Retrieval-Augmented Generation) అప్లికేషన్లను డిప్లాయ్ చేయడం

---

## 📚 పాఠాలు

| # | పాఠం | వివరణ | సమయం |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | AZD ను Foundry సేవలతో కనెక్ట్ చేయడం | 30 నిమిషాలు |
| 2 | [AI Agents Guide](agents.md) | టూల్స్‌తో తెలివైన ఏజెంట్లను డిప్లాయ్ చేయడం | 45 నిమిషాలు |
| 3 | [AI Model Deployment](ai-model-deployment.md) | AI మోడల్స్‌ను డిప్లాయ్ చేసి కాన్ఫిగర్ చేయడం | 30 నిమిషాలు |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | ప్రాక్టికల్: మీ AI పరిష్కారాన్ని AZD-కు సిద్ధం చేయడం | 60 నిమిషాలు |

---

## 🚀 త్వరిత ప్రారంభం

```bash
# వికల్పం 1: RAG చాట్ అనువర్తనం
azd init --template azure-search-openai-demo
azd up

# వికల్పం 2: ఏఐ ఏజెంట్లు
azd init --template get-started-with-ai-agents
azd up

# వికల్పం 3: త్వరిత చాట్ అనువర్తనం
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 ప్రత్యేక AI టెంప్లేట్స్

| Template | Description | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | సైటేషన్లతో RAG చాట్ | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | టూల్స్ ఉన్న AI ఏజెంట్ | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | ప్రాథమిక AI చాట్ | OpenAI + Container Apps |

---

## 💰 ఖర్చు అవగాహన

| Environment | Estimated Monthly Cost |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**సూచన:** పరీక్షించిన తర్వాత ఖర్చులు రాకుండా ఉండటానికి `azd down` ను నడపండి.

---

## 🔗 నావిగేషన్

| దిశ | అధ్యాయం |
|-----------|---------|
| **Previous** | [అధ్యాయం 1: ఫౌండేషన్](../chapter-01-foundation/README.md) |
| **Next** | [అధ్యాయం 3: కాన్ఫిగరేషన్](../chapter-03-configuration/README.md) |
| **దాటివెళ్ళండి** | [అధ్యాయం 8: ఉత్పత్తి నమూనాలు](../chapter-08-production/README.md) |

---

## 📖 సంబంధించిన వనరులు

- [AI సమస్యల పరిష్కారం](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [ఉత్పత్తि AI పద్ధతులు](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
అస్పష్టీకరణ:
ఈ పత్రాన్ని AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ద్వారా అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీ, స్వయంచాలక అనువాదాల్లో తప్పులు లేదా అస్పష్టతలు ఉండొచ్చు అని దయచేసి గమనించండి. స్థానిక భాషలోని అసలు పత్రాన్ని అధికారిక మూలంగా పరిగణించాలి. ముఖ్యమైన సమాచారానికి వృత్తిపరమైన మానవ అనువాదాన్ని సూచిస్తాము. ఈ అనువాదాన్ని ఉపయోగించడంతో ఏర్పడిన ఏవైనా అవగాహనా లోపాలు లేదా తప్పుదారులకు మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->