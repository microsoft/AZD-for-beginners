# 7. Wrap-Up & Next Steps

!!! tip "ప్రధాన సారాంశ సూచనలు"

    - [ ] AZD templates accelerate AI application development from days to hours
    - [ ] The Discovery → Deployment → Customization methodology provides a structured learning path
    - [ ] GitHub Copilot with MCP servers enables natural language exploration of complex codebases
    - [ ] Microsoft Foundry provides built-in observability, evaluation, and security testing

---

## 1. మీరు సాధించిన విషయాలు

అభినందనలు! ఈ వర్క్‌షాప్‌లో, మీరు విజయవంతంగా:

| మాడ్యూల్ | సాధించిన విషయం |
|:---|:---|
| **Module 1** | ఆజ్యూర్ డెవలపర్ CLI తెలుసుకొని AI టెంప్లేట్‌ను ఎంపిక చేసుకున్నారు |
| **Module 2** | పూర్తి AI ఏజెంట్స్ పరిష్కారాన్ని డిప్లాయ్ చేసి ధృవీకరించారు |
| **Module 3** | టెంప్లేట్ నిర్మాణాన్ని అర్థం చేసుకునేందుకు విచ్ఛింద్రీకరణ చేశారు |
| **Module 4** | `azure.yaml` కాన్ఫిగరేషన్ మరియు లైఫ్‌సైకిల్ హూక్‌లను అన్వేషించారు |
| **Module 5** | మీ సొంత సన్నివేశానికి టెంప్లేట్‌ను అనుకూలీకరించారు |
| **Module 6** | సురక్షితంగా ఇన్ఫ్రాస్ట్రక్చర్‌ను నా తీసివేసి వనరులను నిర్వహించారు |

---

## 2. ప్రధాన సంఘటకాలు నేర్చుకున్నవి

### ఆజ్యూర్ డెవలపర్ CLI (azd)
- `azd init` - టెంప్లేట్‌ నుంచి ప్రాజెక్ట్‌లు ఇనిషియలైజ్ చేయడం
- `azd up` - ఒకే క‌మాండ్‌లో ప్రావిజన్ మరియు డిప్లాయ్
- `azd env` - వాతావరణ మార్పిడులను నిర్వహించడం
- `azd down` - వనరులను సురక్షితంగా శుభ్రపరచడం

### AZD టెంప్లేట్ నిర్మాణం
- `azure.yaml` - కాన్ఫిగరేషన్ మరియు డిప్లాయ్‌మెంట్ హూక్‌లు
- `infra/` - Bicep ఇన్ఫ్రాస్ట్రక్చర్-ఎ-కోడ్
- `src/` - అనువర్తన మూల కోడ్
- `scripts/` - ఆటోమేషన్ మరియు సెటప్ స్క్రిప్ట్‌లు

### మైక్రోసాఫ్ట్ ఫౌండ్రీ సామర్ధ్యాలు
- తెలివైన సహాయకుల కోసం AI ఏజెంట్ సర్వీస్
- జ్ఞాన సాధన కోసం ఫైల్ సెర్చ్ మరియు ఆజ్యూర్ AI సెర్చ్
- బిల్ట్-ఇన్ ట్రేసింగ్, మానిటరింగ్ మరియు మూల్యాంకనం
- AI భద్రత ధ్రువీకరణకి రెడ్ టీమింగ్

---

## 3. మీ అభ్యాసాన్ని కొనసాగించండి

### సిఫారసు చేసిన తదుపరి దశలు

| మార్గం | వనరు | సమయం |
|:---|:---|:---|
| **పూర్తి కోర్సు** | [AZD for Beginners Curriculum](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) | స్వీయ-గతిమానం |
| **ఇంకొక టెంప్లేట్ ప్రయత్నించండి** | [Microsoft Foundry Templates](https://ai.azure.com/templates) | 1-2 గంటలు |
| **గాఢంగా అధ్యయనం** | [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | నిరంతరం |
| **సముదాయం** | [Azure Discord](https://aka.ms/foundry/discord) | ఇప్పుడే చేరండి! |

### తదుపరి ప్రయత్నించవలసిన టెంప్లేట్లు

1. **[AI చాట్‌తో ప్రారంభించండి](https://github.com/Azure-Samples/get-started-with-ai-chat)** - మీ డేటాతో ప్రాథమిక చాట్
2. **[Azure Search OpenAI డెమో](https://github.com/Azure-Samples/azure-search-openai-demo)** - అభివృద్ధి یافته RAG నమూనాలు
3. **[కాంటోसो చాట్](https://github.com/Azure-Samples/contoso-chat)** - సంస్థ రీట్‌యిల్ సన్నివేశాలు

---

## 4. వర్క్‌షాప్ సవాలు

మీ నైపుణ్యాలను పరీక్షించడానికి సిద్ధంగా ఉన్నారా? ఈ సవాలు ప్రయత్నించండి:

| సవాలు | వివరణ | కష్టతనం |
|:---|:---|:---|
| **1. మల్టీ-Agent సన్నివేశం** | వేరే పరిశ్రమ కోసం డిప్లాయ్ చేసి అనుకూలీకరించండి (ఉదా: ఆరోగ్యం, ఆర్థికం) | ⭐⭐ |
| **2. అనుకూల జ్ఞాన ఆధారం** | మీ సొంత డేటా ఫైళ్లను జోడించి అనుకూల సెర్చ్ సూచిక సృష్టించండి | ⭐⭐⭐ |
| **3. ఉత్పత్తి డిప్లాయ్‌మెంట్** | GitHub Actions తో CI/CD సెటప్ చేయండి `azd pipeline config` ఉపయోగించి | ⭐⭐⭐⭐ |

---

## 5. మీ అభిప్రాయాన్ని పంచుకోండి

మీ అభిప్రాయం మాకు ఈ వర్క్‌షాప్‌ను మెరుగుపరచడంలో సహాయపడుతుంది!

- **GitHub Issues**: [ప్రతిక్రియ పోస్ట్ చేయండి](https://github.com/microsoft/azd-for-beginners/issues) - సహితంగా ట్యాగ్ చేయండి `Workshop`
- **Discord**: [Microsoft Foundry Discord](https://aka.ms/foundry/discord) లో చేరండి - పోస్ట్ చెయ్యండి `#get-help`
- **కాంట్రిబ్యూషన్లు**: వర్క్షాప్ మెరుగుపరిచేందుకు పుల్ రిక్వెస్టులను సమర్పించండి!

---

## ధన్యవాదాలు! 🎉

AZD for AI Developers వర్క్షాప్ పూర్తి చేసినందుకు ధన్యవాదాలు. ఈ అనుభవం మీకు Azureపై AI అప్లికేషన్లు నిర్మించి ప్రయోగించేందుకు కావలసిన నైపుణ్యాలు మరియు ఆత్మవిశ్వాసాన్ని ఇచ్చిందని ఆశిస్తున్నాము.

**నిర్మించటం కొనసాగించండి, నేర్చుకోవడం కొనసాగించండి, మరియు Azure AI డెవలపర్ కమ్యూనిటీకి స్వాగతం!**

---

| | |
|:---|:---|
| **📚 కోర్సు హోమ్** | [AZD For Beginners](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) |
| **📖 డాక్యుమెంటేషన్** | [Azure Developer CLI Docs](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI టెంప్లేట్లు** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
| **💬 కమ్యూనిటీ** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->