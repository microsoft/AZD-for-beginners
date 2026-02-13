<div align="center">
  <div style="background: linear-gradient(135deg, #0078d4, #106ebe); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(0, 120, 212, 0.3); border: 2px solid #005a9e;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🎯 AZD AI డెవలపర్ల కోసం వర్క్‌షాప్
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Azure Developer CLI తో AI అప్లికేషన్లు నిర్మించడానికి హ్యాండ్స్-ఆన్ వర్క్‌షాప్.</strong><br>
      AZD టెంప్లేట్స్ మరియు AI డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లోలలో నిపుణులు కావడానికి 7 మాడ్యూల్‌లు పూర్తి చేయండి.
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 చివరిగా నవీకరించబడింది: ఫిబ్రవరి 2026
      </span>
    </div>
  </div>
</div>

# AZD AI డెవలపర్ల కోసం వర్క్‌షాప్

Azure Developer CLI (AZD) నేర్చుకోవడానికి, ముఖ్యంగా AI అప్లికేషన్ డిప్లాయ్‌మెంట్‌పై దృష్టి సారించిన హ్యాండ్స్-ఆన్ వర్క్‌షాప్‌కు స్వాగతం. ఈ వర్క్‌షాప్ మీరు AZD టెంప్లేట్స్‌ను 3 దశల్లో అన్వయించుకునేందుకు సహాయపడుతుంది:

1. **అన్వేషణ** - మీకు సరిపోయే టెంప్లేట్‌ని కనుగొనండి.
1. **డిప్లాయ్‌మెంట్** - డిప్లాయ్ చేసి అది పనిచేస్తుందో ధృవీకరించండి
1. **అనుకూలీకరణ** - సవరణ చేసి మీ అవసరాలకు అనుగుణంగా మార్చండి!

ఈ వర్క్‌షాప్ వ్యవధిలో, మీరు కోర్ డెవలపర్ టూల్స్ మరియు వర్క్‌ఫ్లోల గురించి కూడా పరిచయం పొందుతారు, ఇది మీ ఎండ్-టు-ఎండ్ డెవలప్‌మెంట్ ప్రయాణాన్ని సరళీకృతం చేయడంలో సహాయపడుతుంది.

<br/>

## బ్రౌజర్-ఆధారిత గైడ్

వర్క్‌షాప్ పాఠాలు Markdown లో ఉన్నాయి. మీరు వాటిని నేరుగా GitHub లో అన్వేషించవచ్చు - లేదా స్క్రీన్‌షార్ట్‌లో చూపినట్టుగా బ్రౌజర్-ఆధారిత ప్రివ్యూ ప్రారంభించవచ్చు.

![వర్క్‌షాప్](../../../translated_images/te/workshop.75906f133e6f8ba0.webp)

ఈ ఆప్షన్ ఉపయోగించడానికి - రెపోని మీ ప్రొఫైల్‌కు fork చేయండి, మరియు GitHub Codespaces ప్రారంభించండి. ఒకసారి VS Code టెర్మినల్ సక్రియమయ్యాక, ఈ కమాండ్ టైప్ చేయండి:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

కొన్ని సెకన్లలో, మీకు ఒక pop-up డైలాగ్ కనిపిస్తుంది. `Open in browser` ఆప్షన్‌ని ఎంచుకోండి. వెబ్-ఆధారిత గైడ్ కొత్త బ్రౌజర్ ట్యాబ్‌లో తెరుస్తుంది. ఈ ప్రివ్యూ యొక్క కొన్ని ప్రయోజనాలు:

1. **అంతర్గత శోధన** - కీవర్డ్స్ లేదా పాఠాలను త్వరగా కనుగొనండి.
1. **కాపీ ఐకాన్** - కోడ్ బ్లాక్స్‌లపై హోవర్ చేసి ఈ ఆప్షన్ చూడండి
1. **థీమ్ టాగ్లో** - డార్క్ మరియు లైట్ థీమ్‌ల మధ్య切換 చేయండి
1. **సహాయం పొందండి** - ఫూటర్‌లో Discord ఐకాన్‌పై క్లిక్ చేసి జాయిన్ అవ్వండి!

<br/>

## వర్క్‌షాప్ అవలోకనం

**వ్యవధి:** 3-4 గంటలు  
**స్థాయి:** ప్రారంభం నుండి మధ్యస్థాయి  
**పూర్వావశ్యకతలు:** Azure, AI భావనలకు పరిచయం, VS Code & కమాండ్-లైన్ టూల్స్.

ఇది ఒక హ్యాండ్స్-ఆన్ వర్క్‌షాప్ — మీరు చేయడంతో నేర్చుకుంటారు. వ్యాయామాలను పూర్తి తరువాత, సెక్యూరిటీ మరియు ఉత్పాదకత ఉత్తమ ప్రాథమికాలపై మీ నేర్చుకుంటున్న ప్రయాణాన్ని కొనసాగించడానికి AZD For Beginners అవరోహణను సమీక్షించడానికి మేము సిఫార్సు చేస్తున్నాం.

| Time| Module  | Objective |
|:---|:---|:---|
| 15 mins | [Introduction](docs/instructions/0-Introduction.md) | మెట్టు ఏర్పాటు చేయండి, లక్ష్యాలను అర్థం చేసుకోండి |
| 30 mins | [Select AI Template](docs/instructions/1-Select-AI-Template.md) | ఎంపికలన్నింటిని అన్వేషించి స్టార్టర్ ఎంచుకోండి | 
| 30 mins | [Validate AI Template](docs/instructions/2-Validate-AI-Template.md) | డిఫాల్ట్ సొల్యూషన్‌ను Azureలో డిప్లాయ్ చేయండి |
| 30 mins | [Deconstruct AI Template](docs/instructions/3-Deconstruct-AI-Template.md) | నిర్మాణం మరియు కాన్ఫిగరేషన్‌ను అన్వేషించండి |
| 30 mins | [Configure AI Template](docs/instructions/4-Configure-AI-Template.md) | అందుబాటులో ఉన్న ఫీచర్‌లను సక్రియం చేసి ప్రయత్నించండి |
| 30 mins | [Customize AI Template](docs/instructions/5-Customize-AI-Template.md) | మీ అవసరాలకు అనుగుణంగా టెంప్లేట్‌ని అనుకూలీకరించండి |
| 30 mins | [Teardown Infrastructure](docs/instructions/6-Teardown-Infrastructure.md) | రీసోర్సుల్ని క్లీన్ అప్ చేసి విడుదల చేయండి |
| 15 mins | [Wrap-Up & Next Steps](docs/instructions/7-Wrap-up.md) | నేర్చుకునే వనరులు, వర్క్‌షాప్ ఛాలెంజ్ |

<br/>

## మీరు ఏమి నేర్చుకుంటారు

AZD టెంప్లేట్‌ను Microsoft Foundry మీద ఎన్డ్-టు-ఎండ్ డెవలప్‌మెంట్‌కు వివిధ సామర్ధ్యాలు మరియు టూల్స్ అన్వేషించడానికి ఒక లెర్నింగ్ సాండ్‌బాక్స్ అని భావించండి. ఈ వర్క్‌షాప్ ముగిసినప్పుడు, మీరు ఈ సందర్భంలో వివిధ టూల్స్ మరియు కాన్సెప్ట్లపై ఒక అంతరువాతి భావనగలవారిగా ఉండాలి.

| Concept  | Objective |
|:---|:---|
| **Azure Developer CLI** | టూల్ ఆదేశాలు మరియు వర్క్‌ఫ్లోలను అర్థం చేసుకోండి|
| **AZD Templates**| ప్రాజెక్ట్ నిర్మాణం మరియు కాన్ఫిగరేషన్‌ను అర్థం చేసుకోండి|
| **Azure AI Agent**| Microsoft Foundry ప్రాజెక్ట్‌ను Provision & deploy చేయండి  |
| **Azure AI Search**| ఏజెంట్లతో కాంటెక్స్ట్ ఇంజనీరీంగ్‌ను సక్రియం చేయండి |
| **Observability**| ట్రేసింగ్, మానిటరింగ్ మరియు మూల్యాంకనాలను అన్వేషించండి |
| **Red Teaming**| విరోధాత్మక పరీక్షలు మరియు ఉపశమనాలను అన్వేషించండి |

<br/>

## వర్క్‌షాప్ నిర్మాణం

వర్క్‌షాప్ మీని టెంప్లేట్ అన్వేషణ నుండి డిప్లాయ్‌మెంట్, డికన్స్ట్రక్షన్, మరియు అనుకూలీకరణ వరకు ఒక ప్రయాణంలో తీసుకెళ్తుంది - ఆధారంగా అధికారిక [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) స్టార్టర్ టెంప్లేట్‌ను ఉపయోగిస్తుంది.

### [Module 1: Select AI Template](docs/instructions/1-Select-AI-Template.md) (30 mins)

- AI టెంప్లేట్స్ అంటే ఏమిటి?
- AI టెంప్లేట్స్‌ని ఎక్కడ కనుగొనాలి?
- AI ఏజెంట్లను నిర్మించడం ఎలా మొదలుపెట్టాలి?
- **ప్రయోగం**: GitHub Codespacesతో క్విక్‌స్టార్ట్

### [Module 2: Validate AI Template](docs/instructions/2-Validate-AI-Template.md) (30 mins)

- AI టెంప్లేట్ ఆర్కిటెక్చర్ అంటే ఏమిటి?
- AZD డెవలప్‌మెంట్ వర్క్‌ఫ్లో అంటే ఏమిటి?
- AZD డెవలప్‌మెంట్‌లో సహాయం ఎలా పొందాలి?
- **ప్రయోగం**: Deploy & Validate AI Agents టెంప్లేట్

### [Module 3: Deconstruct AI Template](docs/instructions/3-Deconstruct-AI-Template.md) (30 mins)

- `.azure/` లో మీ ఎన్‌విరాన్‌మెంట్‌ను అన్వేషించండి 
- `infra/` లో మీ రీసోర్స్ సెటప్‌ని అన్వేషించండి 
- `azure.yaml`s లో మీ AZD కాన్ఫిగరేషన్‌ని అన్వేషించండి
- **ప్రయోగం**: ఎన్‌విరాన్‌మెంట్ వేరియబుల్స్ మార్చి మళ్ళీ డిప్లాయ్ చేయండి

### [Module 4: Configure AI Template](docs/instructions/4-Configure-AI-Template.md) (30 mins)
- అన్వేషించండి: Retrieval Augmented Generation
- అన్వేషించండి: ఏజెంట్ మూల్యాంకనం & రెడ్ టీమింగ్
- అన్వేషించండి: ట్రేసింగ్ & మానిటరింగ్
- **ప్రయోగం**: AI ఏజెంట్ + ఆబ్సర్వబిలిటీని అన్వేషించండి

### [Module 5: Customize AI Template](docs/instructions/5-Customize-AI-Template.md) (30 mins)
- నిర్వచించండి: సన్నివేశ అవసరాలతో PRD
- కాన్ఫిగర్ చేయండి: AZD కోసం ఎన్‌విరాన్‌మెంట్ వేరియబుల్స్
- అమలు చేయండి: అదనపు పనుల కోసం లైఫ్‌సైకిల్ హుక్స్
- **ప్రయోగం**: నా సన్నివేశానికి టెంప్లేట్ అనుకూలీకరించండి

### [Module 6: Teardown Infrastructure](docs/instructions/6-Teardown-Infrastructure.md) (30 mins)
- సంక్షిప్తంగా: AZD టెంప్లేట్స్ అంటే ఏమిటి?
- సంక్షిప్తంగా: Azure Developer CLI ఉపయోగించడం ఎందుకు?
- తదుపరి దశలు: వేరే టెంప్లేట్‌ను ప్రయత్నించి చూడండి!
- **ప్రయోగం**: ఇన్ఫ్రాస్ట్రక్చర్‌ను డీప్రోవిజన్ చేసి క్లీన్‌అప్ చేయండి

<br/>

## వర్క్‌షాప్ ఛాలెంజ్

మరింత పాటించడానికి మీకు ఛాలెంజ్ కావాలా? ఇక్కడ కొన్ని ప్రాజెక్ట్ సూచనలు ఉన్నాయి - లేదా మీ ఆలోచనలను మాతో పంచుకోండి!!

| Project | Description |
|:---|:---|
|1. **Deconstruct A Complex AI Template** | మనం వివరించిన వర్క్‌ఫ్లో మరియు టూల్స్ ఉపయోగించి మీరు వేరే AI సొల్యూషన్ టెంప్లేట్‌ను డిప్లాయ్, వీధీకరించడం, మరియు అనుకూలీకరించగలరా అని చూడండి. _మీరు ఏమి నేర్చుకున్నారు?_|
|2. **Customize With Your Scenario**  | వేరే సన్నివేశానికి PRD (Product Requirements Document) వ్రాయడానికి ప్రయత్నించండి. తరువాత మీ టెంప్లేట్ రెపోలో Agent Model లో GitHub Copilot ఉపయోగించి - ఇది మీకు ఒక అనుకూలీకరణ వర్క్‌ఫ్లో తయారుచేయమని అడగండి. _మీరు ఏమి నేర్చుకున్నారు? ఈ సూచనలను మీరు ఎలా మెరుగుపరుచుకోవచ్చు?_|
| | |

## అభిప్రాయం ఉందా?

1. ఈ రెపోలో ఒక ఇష్యూను పోస్ట్ చేయండి - సౌకర్యార్థం దీన్ని `Workshop` అని ట్యాగ్ చేయండి.
1. Microsoft Foundry Discord‌లో చేరండి - మీ సహచరులతో కనెక్ట్ అవ్వండి!


| | | 
|:---|:---|
| **📚 Course Home**| [AZD For Beginners](../README.md)|
| **📖 Documentation** | [Get started with AI templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI Templates** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
|**🚀 Next Steps** | [Begin Workshop](../../../workshop) |
| | |

<br/>

---

**Navigation:** [Main Course](../README.md) | [Introduction](docs/instructions/0-Introduction.md) | [Module 1: Select Template](docs/instructions/1-Select-AI-Template.md)

**Ready to start building AI applications with AZD?**

[Begin Workshop: Introduction →](docs/instructions/0-Introduction.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
నిరాకరణ:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీ, స్వయంచాలక అనువాదాల్లో తప్పులు లేదా లోపాలు ఉండవచ్చని దయచేసి గమనించండి. అసలు పత్రాన్ని దాని మూల భాషలో ఉన్నదే అధికారిక మూలంగా పరిగణించాలి. ముఖ్యమైన సమాచారం కోసం వృత్తిపరమైన మానవ అనువాదాన్ని సూచించబడుతుంది. ఈ అనువాదం వాడకంవల్ల ఏర్పడే ఏవైనా అపార్థాలు లేదా దుర్వ్యాఖ్యలపై మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->