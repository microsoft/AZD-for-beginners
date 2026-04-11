# అధ్యాయం 2: AI-ప్రధాన అభివృద్ధి

**📚 పాఠ్యక్రమం**: [AZD For Beginners](../../README.md) | **⏱️ వ్యవధి**: 1-2 గంటలు | **⭐ సంక్లిష్టత**: మధ్యస్థం

---

## అవలోకనం

ఈ అధ్యాయం Azure Developer CLI మరియు Microsoft Foundry సేవలను ఉపయోగించి AI శక్తితో నడిచే అనువర్తనాలను డిప్లాయ్ చేయడంపై దృష్టి సారిస్తుంది. సాదా AI చాట్ యాప్స్ నుండి టూల్స్ కలిగిన తెలివైన ఏజెంట్ల వరకు.

> **సమీక్షా గమనిక (2026-03-25):** ఈ అధ్యాయంలో కమాండ్ ఫ్లో మరియు విస్తరణ మార్గదర్శకాలను `azd` `1.23.12` మరియు ప్రస్తుత ప్రివ్యూ AI ఏజెంట్ విస్తరణ రీలీజ్ `azure.ai.agents` `0.1.18-preview` కు అనుగుణంగా సమీక్షించారు. మీరు పాత AZD బిల్డ్‌పై ఉంటే, మొదట అప్డేట్ చేయి మరియు ఆపై వ్యాయామాలను కొనసాగించండి.

## నేర్చుకోవాల్సిన లక్ష్యాలు

ఈ అధ్యాయం పూర్తి చేస్తే, మీరు:
- పూర్వనిర్మితం AZD టెంప్లేట్స్ ఉపయోగించి AI అనువర్తనాలను డిప్లాయ్ చేయడం
- AZDతో Microsoft Foundry ఇంటిగ్రేషన్‌ను అర్థం చేసుకోవడం
- టూల్స్ ఉపయోగించి AI ఏజెంటులను కాన్ఫిగర్ మరియు అనుకూలీకరించడం
- RAG (Retrieval-Augmented Generation) అనువర్తనాలను డిప్లాయ్ చేయడం

---

## 📚 పాఠాలు

| # | పాఠం | వివరణ | సమయం |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry ఇంటిగ్రేషన్](microsoft-foundry-integration.md) | AZDని Foundry సేవలతో కనెక్ట్ చేయడం | 30 min |
| 2 | [AI ఏజెంట్స్ గైడ్](agents.md) | టూల్స్‌తో తెలివైన ఏజెంట్లను డిప్లాయ్ చేయడం | 45 min |
| 3 | [AI మోడల్ డిప్లాయ్‌మెంట్](ai-model-deployment.md) | AI మోడల్స్‌ను డిప్లాయ్ చేయడం మరియు కాన్ఫిగర్ చేయడం | 30 min |
| 4 | [AI వర్క్షాప్ ల్యబ్](ai-workshop-lab.md) | హ్యాండ్స్-ఆన్: మీ AI పరిష్కారాన్ని AZD-కి సిద్ధం చేయండి | 60 min |

---

## 🚀 త్వరిత ప్రారంభం

```bash
# ఎంపిక 1: RAG చాట్ అప్లికేషన్
azd init --template azure-search-openai-demo
azd up

# ఎంపిక 2: ఏఐ ఏజెంట్లు
azd init --template get-started-with-ai-agents
azd up

# ఎంపిక 3: త్వరిత చాట్ యాప్
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 ప్రముఖ AI టెంప్లేట్స్

| టెంప్లేట్ | వివరణ | సేవలు |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ఉల్లేఖనాలతో RAG చాట్ | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | టూల్స్‌తో AI ఏజెంట్ | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | ప్రాథమిక AI చాట్ | OpenAI + Container Apps |

---

## 💰 ఖర్చుల అవగాహన

| పరిసరాలు | అంచనా నెలవారీ ఖర్చు |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**సూచన:** పరీక్షల తర్వాత ఖర్చులను నివారించేందుకు `azd down` ను నడపండి.

---

## 🔗 నావిగేషన్

| దిశ | అధ్యాయం |
|-----------|---------|
| **మునుపటి** | [అధ్యాయం 1: పునాది](../chapter-01-foundation/README.md) |
| **తరువాత** | [అధ్యాయం 3: కాన్ఫిగరేషన్](../chapter-03-configuration/README.md) |
| **దాటండి** | [అధ్యాయం 8: ఉత్పత్తి నమూనాలు](../chapter-08-production/README.md) |

---

## 📖 సంబంధిత వనరులు

- [AI సమస్య పరిష్కారం](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [ఉత్పత్తి AI విధానాలు](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**బాధ్యతా మినహాయింపు**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి శ్రమించినప్పటికీ, స్వయంచాలక అనువాదాల్లో పొరపాట్లు లేదా లోపాలు ఉండవచ్చు అని దయచేసి గమనించండి. మూల భాషలోని అసలు పత్రాన్ని అధికారిక వనరుగా పరిగణించాలి. ముఖ్యమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సూచించబడుతుంది. ఈ అనువాదం ఉపయోగించడంవల్ల ఏర్పడిన ఏవైనా అపార్థాలు లేదా తప్పుగా అర్థం చేసుకోవడాలపై మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->