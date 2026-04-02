# 1. టెంప్లేట్ ఎంచుకోండి

!!! tip "ఈ మాడ్యూల్ ముగియే సమయానికి మీరు చేయగలుగుతారు"

    - [ ] AZD టెంప్లేట్స్ అంటే ఏమిటో వివరించండి
    - [ ] AI కోసం AZD టెంప్లేట్స్ కనుగొని ఉపయోగించండి
    - [ ] AI Agents టెంప్లేట్‌తో ప్రారంభించండి
    - [ ] **ల్యాబ్ 1:** Codespaces లేదా dev కంటైనర్‌లో AZD క్విక్‌స్టార్ట్

---

## 1. ఒక బిల్డర్ ఉపమానం

మొడర్న్ ఎంటర్‌ప్రైజ్-సిద్ధమైన AI అప్లికేషన్‌ను _ప్రారంభం నుంచి_ నిర్మించడం భయంకరంగా అనిపించవచ్చు. ఇది మీ కొత్త ఇల్లు ఒక్కొక్క ఇటుక పెడుతూ తానే నిర్మించడం లాంటిది. అవును, చేయొచ్చు! కానీ ఇది కావలసిన చివరి ఫలితాన్ని పొందడానికి అత్యంత సమర్థవంతమైన మార్గం కాదు!

దగ్గరగా, మనం ఎక్కువగా ఒక ఉన్న డిజైన్ బ్లూప్రింట్‌తో ప్రారంభించి, ఒక ఆర్కిటెక్ట్‌తో కలిసి దానిని మన అవసరాలకు 맞게 అనుకూలత చేయిస్తాం. ఇది తెలివైన అప్లికేషన్లను నిర్మించేటప్పుడు తీసుకోవలసిన దృక్పథమే. প্রথমে, మీ సమస్య పరిధికి తగిన ఒక మంచి డిజైన్ ఆర్కిటెక్చర్‌ను కనుగొనండి. ఆ తర్వాత మీ ప్రత్యేక సందర్భానికి సొల్యూషన్ ఆర్కిటెక్ట్‌తో కలిసి సొల్యూషన్‌ను అనుకూలీకరించి అభివృద్ధి చేయండి.

కానీ ఈ డిజైన్ బ్లూప్రింట్లు మనం ఎక్కడ నుంచి పొందగలము? మరియు మనకు ఈ బ్లూప్రింట్లను ఎలా అనుకూలీకరించాలో, డిప్లాయ్ చేయాలో బోధించగల ఆర్కిటెక్ట్ ను ఎలా కనుగొనాలి? ఈ వర్క్‌షాప్‌లో, మేము ఈ ప్రశ్నలకు సమాధానమిచ్చే మూడు సాంకేతికతలను పరిచయం చేస్తాం:

1. [Azure Developer CLI](https://aka.ms/azd) - ఓపెన్-సోర్స్ టూల్, స్థానిక అభివృద్ధి (build) నుంచి క్లౌడ్ డిప్లాయ్‌మెంట్ (ship) వరకు డెవలపర్ ప్రయాణాన్ని వేగవంతం చేస్తుంది.
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) - AI సొల్యూషన్ ఆర్కిటెక్చర్‌ను డిప్లాయ్ చేయడానికి అవసరమయ్యే శాంపిల్ కోడ్, ఇన్‌ఫ్రాస్ట్రక్చర్ మరియు కాన్ఫిగరేషన్ ఫైళ్లను కలిగిన స్టాండర్డైజ్డ్ ఓపెన్-సోర్స్ రిపోజిటరీస్.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - Azure జ్ఞానంతో గ్రౌండెడ్ అయిన కోడింగ్ ఏజెంట్, ఇది సహజ భాష ఉపయోగించి కోడ్‌బేస్‌ను నావిగేట్ చేయడంలో మరియు మార్పులను చేయడంలో మనకు మార్గనిర్దేశం చేయగలదు.

ఈ పరికరాలు మీ చేతిలో ఉన్నప్పుడు, సరైన టెంప్లేట్‌ను _స్వీకరించి_, దాన్ని డిప్లాయ్ చేసి అది పనిచేస్తుందో ధృవీకరించవచ్చు, మరియు మీ ప్రత్యేక సందర్భాలకు అనుగుణంగా దాన్ని _అనుకూలీకరించవచ్చు_. ఇప్పుడు వీటి పనిచేసే విధానాన్ని తెలియజుకుందాం.

---

## 2. Azure Developer CLI

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (or `azd`) ఒక ఓపెన్-సోర్స్ కమాండ్‌లైన్ టూల్, ఇది IDE (development) మరియు CI/CD (devops) వాతావరణాల మధ్య సబంధితంగా పని చేసే డెవలపర్-ఫ్రెండ్లీ కమాండ్లు కలిగి ఉండటంతో మీ కోడ్-టు-క్లౌడ్ యాత్రను వేగవంతం చేయగలదు.

`azd` తో, మీ డిప్లాయ్‌మెంట్ ప్రయాణం ఈ క్రింది విధంగా సులభతరంగా ఉండొచ్చు:

- `azd init` - ఒక ఇప్పటికే ఉన్న AZD టెంప్లేట్ నుండి కొత్త AI ప్రాజెక్ట్‌ను ఆరంభిస్తుంది.
- `azd up` - ఒక దశలో ఇన్‌ఫ్రాస్ట్రక్చర్‌ను ప్రొవిజన్ చేసి మీ అప్లికేషన్‌ను డిప్లాయ్ చేస్తుంది.
- `azd monitor` - మీ డిప్లాయ్ చేసిన అప్లికేషన్ కోసం రియల్-టైమ్ మానిటరింగ్ మరియు డయాగ్నოსტిక్స్ పొందండి.
- `azd pipeline config` - Azure కి ఆటోమేటెడ్ డిప్లాయ్‌మెంట్ కోసం CI/CD పైప్లైన్లను సెటప్ చేయండి.

**🎯 | అభ్యాసం**: <br/> మీ ప్రస్తుత వర్క్‌షాప్ వాతావరణంలో `azd` కమాండ్‌లైన్ టూల్‌ను అన్వేషించండి. ఇది GitHub Codespaces, dev కంటైనర్, లేదా అవసరమైన పూర్వాపై ఏర్పాటు చేయబడిన స్థానిక క్లోన్ కావచ్చు. టూల్ ఏమి చేయగలదో చూడటానికి ఈ కమాండ్ టైప్ చేయడం ద్వారా ప్రారంభించండి:

```bash title="" linenums="0"
azd help
```

![ప్రవాహం](../../../../../translated_images/te/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. AZD టెంప్లేట్

`azd` ఇది సాధించడానికి, అది ఏ ఇన్‌ఫ్రాస్ట్రక్చర్‌ను ప్రొవిజన్ చేయాలో, అమలు చేయవలసిన కాన్ఫిగరేషన్ సెట్టింగ్స్ ఏవో, మరియు ఏ అప్లికేషన్‌ను డిప్లాయ్ చేయాలో తెలుసుకోవాలి. ఇక్కడే [AZD templates](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp) మార్చబడతాయి.

AZD టెంప్లేట్స్ శాంపిల్ కోడ్‌ను ఇన్‌ఫ్రాస్ట్రక్చర్ మరియు డిప్లాయ్‌మెంట్‌కు అవసరమైన కాన్ఫిగరేషన్ ఫైళ్లతో కలిపిన ఓపెన్-సోర్స్ రిపోజిటరీస్. ఒక _Infrastructure-as-Code_ (IaC) దృష్టికోణాన్ని ఉపయోగిస్తూ, అవి టెంప్లేట్ రిసోర్స్ నిర్వచనాలు మరియు కాన్ఫిగరేషన్ సెట్టింగ్స్‌ను వెర్షన్-కంట్రోల్‌లో (యాపోన్ సోర్స్ కోడ్ లాగా) ఉంచడానికి అనుమతిస్తాయి - ప్రాజెక్టు వినియోగదారుల మధ్య పునఃఉపయోగపరమైన మరియు సुसమతుల workflows ను సృష్టించడం.

మీ సందర్భానికి AZD టెంప్లేట్‌ను సృష్టించేటప్పుడు లేదా పునఃఉపయోగించినప్పుడు ఈ ప్రశ్నలను పరిగణనలోకి తీసుకోండి:

1. మీరు ఏమి నిర్మిస్తున్నారో? → ఆ సందర్భానికి స్టార్టర్ కోడ్ ఉన్న టెంప్లేట్ ఉందా?
1. మీ సొల్యూషన్ ఎలా ఆర్కిటెక్ట్ చేయబడింది? → అవసరమైన రిసోర్సులతో టెంప్లేట్ ఉందా?
1. మీ సొల్యూషన్ ఎలా డిప్లాయ్ చేయబడుతుంది? → `azd deploy` పరిధిలో ప్రీ/పోస్ట్-ప్రాసెసింగ్ హుక్‌ల గురించి మనస్ఫూర్తిగా ఆలోచించండి!
1. దీన్ని మరింత ఎలా ఆప్టిమైజ్ చేయవచ్చు? → బిల్ట్-ఇన్ మానిటరింగ్ మరియు ఆటోమేషన్ పైప్లైన్లను పరిగణనలోకి తీసుకోండి!

**🎯 | అభ్యాసం**: <br/> 
[Awesome AZD](https://azure.github.io/awesome-azd/) గ్యాలరీను సందర్శించి, ప్రస్తుతం అందుబాటులో ఉన్న 250+ టెంప్లేట్స్‌ను ఫిల్టర్లు ఉపయోగించి పరిశీలించండి. మీ పరిస్థితి అవసరాలకు తగిన టెంప్లేట్ కనుగొనగలిగేలా చూడండి.

![కోడ్](../../../../../translated_images/te/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. AI యాప్ టెంప్లేట్స్

AI-చాలన యాప్‌ల కోసం, Microsoft ప్రత్యేక టెంప్లేట్స్ ను అందిస్తుంది, ఇవి **Microsoft Foundry** మరియు **Foundry Agents** ని ఆసక్తికరంగా వినియోగిస్తాయి. ఈ టెంప్లేట్స్ తెలివైన, ప్రొడక్షన్-సిద్ధమైన అప్లికేషన్లు నిర్మించడానికి మీ దారిని వేగవంతం చేస్తాయి.

### Microsoft Foundry & Foundry Agents టెంప్లేట్స్

డిప్లాయ్ చేయడానికి దిగువ టెంప్లేట్ను ఎంచుకోండి. ప్రతి టెంప్లేట్ [Awesome AZD](https://azure.github.io/awesome-azd/) లో అందుబాటులో ఉంది మరియు ఒకే ఒక కమాండుతో ఆరంభించవచ్చు.

| Template | Description | Deploy Command |
|----------|-------------|----------------|
| **[AI Chat with RAG](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | Microsoft Foundry ఉపయోగించి Retrieval Augmented Generation కలిగిన చాట్ అప్లికేషన్ | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent Service Starter](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Foundry Agents ఉపయోగించి స్వయం-సంచాలకమైన టాస్క్ అమలు కోసం AI ఏజెంట్లను నిర్మించండి | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[Multi-Agent Orchestration](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | సంక్లిష్ట వర్క్‌ఫ్లోల కోసం బహు Foundry Agents ను సమన్వయం చేయండి | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI Document Intelligence](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | Microsoft Foundry మోడల్స్ ఉపయోగించి డాక్యుమెంట్లను ఎక్స్‌ట్రాక్ట్ చేసి విశ్లేషించండి | `azd init -t azure-samples/ai-document-processing` |
| **[Conversational AI Bot](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | Microsoft Foundry ఇంటిగ్రేషన్‌తో తెలివైన చాట్‌బాట్‌లను నిర్మించండి | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI Image Generation](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | Microsoft Foundry ద్వారా DALL-E ఉపయోగించి చిత్రాలను రూపొందించండి | `azd init -t azure-samples/ai-image-generation` |
| **[Semantic Kernel Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | Foundry Agents తో Semantic Kernel ఉపయోగించి AI ఏజెంట్లు | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen Multi-Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | AutoGen ఫ్రేమ్‌వర్క్ ఉపయోగించే బహుళ-ఏజెంట్ సిస్టమ్‌లు | `azd init -t azure-samples/autogen-multi-agent` |

### తక్షణ ప్రారంభం

1. **టెంప్లేట్స్ బ్రౌజ్ చేయండి**: [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) ను సందర్శించి `AI`, `Agents`, లేదా `Microsoft Foundry` ద్వారా ఫిల్టర్ చేయండి
2. **మీ టెంప్లేట్ ఎంచుకోండి**: మీ వినియోగదారికి సరిపోయే ఒకదాన్ని ఎంచుకోండి
3. **ఇనిషియలైజ్ చేయండి**: మీరు ఎంచుకున్న టెంప్లేట్ కోసం `azd init` కమాండ్‌ను రన్ చేయండి
4. **డిప్లాయ్ చేయండి**: ప్రొవిజన్ చేసి డిప్లాయ్ చేయడానికి `azd up` రన్ చేయండి

**🎯 | అభ్యాసం**: <br/>
మీ సందర్భాన్ని ఆధారంగా పై టెంప్లేట్స్‌లో ఒకటిని ఎంచుకోండి:

- **చాట్‌బాట్ నిర్మిస్తున్నారా?** → **AI Chat with RAG** లేదా **Conversational AI Bot** తో ప్రారంభించండి
- **స్వయం-సంచాలక ఏజెంట్లు కావాలా?** → **Foundry Agent Service Starter** లేదా **Multi-Agent Orchestration** ప్రయత్నించండి
- **డాక్యుమెంట్లను ప్రాసెస్ చేయాల్సిందేనా?** → **AI Document Intelligence** ఉపయోగించండి
- **AI కోడింగ్ సహాయం కావాలా?** → **Semantic Kernel Agent** లేదా **AutoGen Multi-Agent** అన్వేషించండి

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "ఇంకా టెంప్లేట్స్ వెదకండి"
    The [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) contains 250+ templates. Use the filters to find templates matching your specific requirements for language, framework, and Azure services.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ఈ పత్రాన్ని AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించారు. మేము ఖచ్చితత్వానికి యత్నించినప్పటికీ, ఆటోమేటెడ్ అనువాదాల్లో పొరపాట్లు లేదా లోపాలు ఉండవచ్చు అని దయచేసి గమనించండి. మూల పత్రాన్ని దాని స్థానిక భాషలోని అసలు వర్షన్‌ను అధికారిక మూలంగా పరిగణించాలి. కీలకమైన సమాచారానికి ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫార్సు చేయబడుతుంది. ఈ అనువాదం వాడకంలో ఏర్పడిన ఏవైనా అపార్థాలు లేదా తప్పుగా అర్థం చేసుకోవడాల కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->