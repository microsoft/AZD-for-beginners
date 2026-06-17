# అధ్యాయం 2: AI-ఫస్ట్ అభివృద్ధి

**📚 Course**: [AZD ప్రారంభికులకు](../../README.md) | **⏱️ Duration**: 1-2 గంటలు | **⭐ Complexity**: మధ్యస్థ

---

## అవలోకనం

ఈ అధ్యాయం Azure Developer CLI మరియు Microsoft Foundry సేవలను ఉపయోగించి AI-శక్తితో నడిచే అప్లికేషన్లను డిప్లాయ్ చేయడంపై կենտրոնిస్తుంది. సాదారణ AI చాట్ యాప్స్ నుండి సాధనాలతో కూడిన మేధోసం కలిగిన ఏజెంట్ల వరకు.

> **ధృవీకరణ గమనిక (2026-06-15):** ఈ అధ్యాయంలో ఉన్న ఆజ్ఞా ప్రవాహం మరియు విస్తరణ మార్గదర్శకాలను `azd` `1.25.6` మరియు ప్రస్తుత ప్రివ్యూ AI ఏజెంట్ విస్తరణ విడుదల `azure.ai.agents` `0.1.40-preview` ఆధారంగా సమీక్షించబడింది. మీరు పాత AZD బిల్డ్‌లో ఉన్నట్లయితే, ముందుగా అప్‌డేట్ చేసి తరువాత వ్యాయామాలతో కొనసాగండి.

## నేర్చుకోవాల్సిన లక్ష్యాలు

ఈ అధ్యాయాన్ని పూర్తి చేయడం ద్వారా, మీరు:
- పూర్తిగా తయారైన AZD టెంప్లేట్స్ ఉపయోగించి AI అప్లికేషన్లను డిప్లాయ్ చేయగలరు
- Microsoft Foundry యొక్క AZD తో ఏకీకరణను అర్థం చేసుకుంటారు
- సాధనాలతో AI ఏజెంట్లను కాన్ఫిగర్ చేసి అనుకూలీకరించగలరు
- RAG (Retrieval-Augmented Generation) అప్లికేషన్లను డిప్లాయ్ చేయగలరు

---

## 📚 పాఠాలు

| # | పాఠం | వివరణ | సమయం |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry ఏకీకరణ](microsoft-foundry-integration.md) | AZD ను Foundry సేవలతో కనెక్ట్ చేయడం | 30 నిమిషాలు |
| 2 | [AI Agents Guide](agents.md) | సాధనాలతో బుద్ధిశక్తి కలిగిన ఏజెంట్లను డిప్లాయ్ చేయడం | 45 నిమిషాలు |
| 3 | [AI Model Deployment](ai-model-deployment.md) | AI మోడళ్లను డిప్లాయ్ చేసి కాన్ఫిగర్ చేయడం | 30 నిమిషాలు |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | ప్రాయోగికం: మీ AI పరిష్కారాన్ని AZD-కి సిద్ధం చేయడం | 60 నిమిషాలు |

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

## 🤖 ప్రముఖ AI టెంప్లేట్లు

| Template | వివరణ | సేవలు |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ఉల్లేఖనాలతో RAG చాట్ | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | సాధనాలతో AI ఏజెంట్ | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | మూలభూత AI చాట్ | OpenAI + Container Apps |

---

## 💰 ఖర్చుల అవగాహన

| పరిసరము | అంచనా నెలవారీ ఖర్చు |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**సలహా:** పరీక్షించాక ఛార్జీలు నివారించాలనుకుంటే `azd down` ను నడపండి.

---

## 🔗 నావిగేషన్

| దిశ | అధ్యాయం |
|-----------|---------|
| **మునుపటి** | [అధ్యాయం 1: ఆధారం](../chapter-01-foundation/README.md) |
| **తరువాత** | [అధ్యాయం 3: కాన్ఫిగరేషన్](../chapter-03-configuration/README.md) |
| **దాటివెళ్ళండి** | [అధ్యాయం 8: ప్రొడక్షన్ నమూనాలు](../chapter-08-production/README.md) |

---

## 📖 సంబంధిత వనరులు

- [AI సమస్య పరిష్కరణ](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [ఉత్పత్తి AI అభ్యాసాలు](../chapter-08-production/production-ai-practices.md)
- [అప్లికేషన్ ఇన్సైట్స్](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->