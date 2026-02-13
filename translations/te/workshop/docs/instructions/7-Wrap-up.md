# 7. ముగింపు మరియు తదుపరి దశలు

!!! tip "ప్రధాన గ్రహించవలసిన విషయాలు"

    - [ ] AZD టెంప్లేట్లు AI అప్లికేషన్ అభివృద్ధిని రోజుల్లోనుండి గంటల్లోకి వేగవంతం చేస్తాయి
    - [ ] Discovery → Deployment → Customization విధానం ఒక నిర్మితమైన నేర్చుకునే మార్గాన్ని అందిస్తుంది
    - [ ] GitHub Copilot MCP సర్వర్లతో సంక్లిష్ట కోడ్‌బేస్‌లను సహజ భాషలో అన్వేషించడానికి అవకాశం కల్పిస్తుంది
    - [ ] Microsoft Foundry బిల్ట్-ఇన్ పరిశీలన, మూల్యాంకనం మరియు భద్రతా పరీక్షలను అందిస్తుంది

---

## 1. మీరు సాధించినవి

అభినందనలు! ఈ వర్క్‌షాప్లో, మీరు విజయవంతంగా పూర్తి చేసినవి:

| Module | Accomplishment |
|:---|:---|
| **Module 1** | Azure Developer CLIని కనుగొన్నారు మరియు ఒక AI టెంప్లేట్‌ను ఎంచుకున్నారు |
| **Module 2** | పూర్తి AI ఏజెంట్స్ పరిష్కారాన్ని డిప్లాయ్ చేసి ధృవీకరించారు |
| **Module 3** | టెంప్లేట్‌ను విభజించి దాని నిర్మాణాన్ని అర్థం చేసుకున్నారు |
| **Module 4** | `azure.yaml` కాన్ఫిగరేషన్ మరియు లైఫ్‌సైకిల్ హుక్స్‌ను పరిశీలించారు |
| **Module 5** | టెంప్లేట్‌ను మీ సొంత సందర్భానికి అనుకూలీకరించారు |
| **Module 6** | ఇన్ఫ్రాస్ట్రక్చర్‌ను సురక్షితంగా తొలగించి వనరులను నిర్వహించారు |

---

## 2. ప్రధాన అంశాలు నేర్చుకున్నవి

### Azure Developer CLI (azd)
- `azd init` - టెంప్లేట్స్ నుండి ప్రాజెక్టులను ప్రారంభించడానికి
- `azd up` - ఒకే కమాండ్తో ప్రొవిజన్ చేసి డిప్లాయ్ చేయడానికి
- `azd env` - పర్యావరణ వేరియబుల్స్‌ను నిర్వహించడానికి
- `azd down` - వనరులను సురక్షితంగా శుభ్రపరచడానికి

### AZD Template Structure
- `azure.yaml` - కాన్ఫిగరేషన్ మరియు డిప్లాయ్‌మెంట్ హుక్స్
- `infra/` - Bicep ఆధారిత ఇన్ఫ్రాస్ట్రక్చర్-ఎజ్-కోడ్
- `src/` - అప్లికేషన్ సోర్స్ కోడ్
- `scripts/` - ఆటోమేషన్ మరియు సెటప్ స్క్రిప్టులు

### Microsoft Foundry Capabilities
- బుద్ధివంతమైన అసిస్టెంట్ల కోసం AI ఏజెంట్ సర్వీస్
- జ్ఞానం పొందడానికి File Search మరియు Azure AI Search
- బిల్ట్-ఇన్ ట్రేసింగ్, మానిటరింగ్ మరియు మూల్యాంకనం
- AI భద్రతా నిర్ధారణ కోసం రెడ్ టీమింగ్

---

## 3. మీ నేర్చుకునే ప్రయాణాన్ని కొనసాగించండి

### సూచించబడిన తదుపరి చర్యలు

| Path | Resource | Time |
|:---|:---|:---|
| **Complete Course** | [AZD ప్రారంభికుల కోర్సు](../../README.md) | 8-12 గంటలు |
| **Try Another Template** | [Microsoft Foundry టెంప్లేట్లు](https://ai.azure.com/templates) | 1-2 గంటలు |
| **Deep Dive** | [Azure Developer CLI డాక్యుమెంటేషన్](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | నిరంతరం |
| **Community** | [Azure Discord](https://aka.ms/foundry/discord) | ఈరోజే చేరండి! |

### తర్వాత ప్రయత్నించవలసిన సూచించిన టెంప్లేట్లు

1. **[Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)** - మీ డేటాతో ప్రాథమిక చాట్
2. **[Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** - అధునాతన RAG ప్యాటర్న్స్
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - ఎంటర్ప్రైజ్ రిటైల్ సన్నివేశాలు

---

## 4. వర్క్‌షాప్ సవాలు

మీ నైపుణ్యాలను పరీక్షించడానికి సిద్ధమా? ఈ సవాళ్లను ప్రయత్నించండి:

| Challenge | Description | Difficulty |
|:---|:---|:---|
| **1. Multi-Agent Scenario** | విభిన్న పరిశ్రమ కోసం డిప్లాయ్ చేసి అనుకూలీకరించండి (ఉదాహరణకు, ఆరోగ్య సంరక్షణ, ఫైనాన్స్) | ⭐⭐ |
| **2. Custom Knowledge Base** | మీ స్వంత డేటా ఫైళ్లను జత చేసి ఒక కస్టమ్ శోధన సూచికను సృష్టించండి | ⭐⭐⭐ |
| **3. Production Deployment** | GitHub Actions ఉపయోగించి `azd pipeline config` ద్వారా CI/CD సెటప్ చేయండి | ⭐⭐⭐⭐ |

---

## 5. మీ అభిప్రాయాన్ని పంచుకోండి

మీ అభిప్రాయం ఈ వర్క్‌షాప్‌ను మెరుగుపరచడానికి సహాయపడుతుంది!

- **GitHub Issues**: [అభిప్రాయాన్ని పోస్ట్ చేయండి](https://github.com/microsoft/azd-for-beginners/issues) - `Workshop` తో ట్యాగ్ చేయండి
- **Discord**: [Microsoft Foundry Discord](https://aka.ms/foundry/discord)కు చేరండి - `#get-help` లో పోస్ట్ చేయండి
- **Contributions**: పుల్ రిక్వెస్ట్‌లు సమర్పించడం ద్వారా వర్క్‌షాప్‌ను మెరుగుపరచడంలో సహాయపడండి!

---

## ధన్యవాదాలు! 🎉

AZD for AI Developers వర్క్‌షాప్ పూర్తి చేసినందుకు 감사합니다. (Note: retained non-translated term "감사합니다" appears accidentally) We hope this experience has equipped you with the skills and confidence to build and deploy AI applications on Azure.

**నిర్మించడం కొనసాగించండి, నేర్చుకుంటూ ఉండండి, మరియు Azure AI డెవలపర్ కమ్యూనిటీకి స్వాగతం!**

---

| | |
|:---|:---|
| **📚 Course Home** | [AZD For Beginners](../../README.md) |
| **📖 Documentation** | [Azure Developer CLI Docs](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI Templates** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
| **💬 Community** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
నిరాకరణ:
ఈ పత్రాన్ని AI అనువాద సేవ Co-op Translator (https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీ, స్వయంచాలి (ఆటోమెటిక్) అనువాదాల్లో తప్పులు లేదా అసత్యతలు ఉండవచ్చు. స్థానిక భాషలో ఉన్న మూల పత్రాన్ని అధికారిక మార్గదర్శకంగా పరిగణించాలి. కీలకమైన సమాచారంకోసం వృత్తిపరులైన మానవ అనువాదాన్ని ఉపయోగించడం ఉత్తమం. ఈ అనువాదాన్ని ఉపయోగించడంతో ఏర్పడిన ఏవైనా అపార్థాలు లేదా తప్పులకి మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->