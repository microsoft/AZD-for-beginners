# AZD ప్రారంభికులకు: ఒక నిర్మిత అభ్యాస ప్రయాణం

![AZD-ప్రారంభికుల](../../translated_images/te/azdbeginners.5527441dd9f74068.webp) 

[![GitHub వాచ్‌లు](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub ఫార్క్స్](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub స్టార్‌లు](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure డిస్కోర్డ్](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry డిస్కోర్డ్](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### ఆటోమేటెడ్ అనువాదాలు (ఎప్పుడూ తాజా)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[అరబిక్](../ar/README.md) | [బెంగాలీ](../bn/README.md) | [బల్గేరియన్](../bg/README.md) | [బర్మీస్ (మ్యాన్మార్)](../my/README.md) | [చైనీస్ (సరళీకృత)](../zh-CN/README.md) | [చైనీస్ (సాంప్రదాయ, హాంకాంగ్)](../zh-HK/README.md) | [చైనీస్ (సాంప్రదాయ, మకావు)](../zh-MO/README.md) | [చైనీస్ (సాంప్రదాయ, తైవాన్)](../zh-TW/README.md) | [క్రొయాటియన్](../hr/README.md) | [చెక్](../cs/README.md) | [డేనిష్](../da/README.md) | [డచ్](../nl/README.md) | [ఎస్టోనియన్](../et/README.md) | [ఫినిష్](../fi/README.md) | [ఫ్రెంచ్](../fr/README.md) | [జర్మన్](../de/README.md) | [గ్రీకు](../el/README.md) | [హీబ్రూ](../he/README.md) | [హిందీ](../hi/README.md) | [హంగేరియన్](../hu/README.md) | [ఇండోనేషియన్](../id/README.md) | [ఇటాలియన్](../it/README.md) | [జపనీస్](../ja/README.md) | [కన్నడ](../kn/README.md) | [కొరియన్](../ko/README.md) | [లిథువేనియాన్](../lt/README.md) | [మలయ్](../ms/README.md) | [మలయాళం](../ml/README.md) | [మరాఠీ](../mr/README.md) | [నేపாளీ](../ne/README.md) | [నైజీరియన్ పిడ్గిన్](../pcm/README.md) | [నార్వేసియన్](../no/README.md) | [పర్షియన్ (ఫార్సీ)](../fa/README.md) | [పోలిష్](../pl/README.md) | [పోర్చుగీస్ (బ్రెజిల్)](../pt-BR/README.md) | [పోర్చుగీస్ (పోర్చుగల్)](../pt-PT/README.md) | [పంజాబీ (గురుముఖీ)](../pa/README.md) | [రోమెనియన్](../ro/README.md) | [రష్యన్](../ru/README.md) | [సర్భియన్ (సిరిలిక్)](../sr/README.md) | [స్లోవాక్](../sk/README.md) | [స్లోవేనియన్](../sl/README.md) | [స్పానిష్](../es/README.md) | [స్వాహిలి](../sw/README.md) | [స్వీడిష్](../sv/README.md) | [టాగాలొగ్ (ఫిలిపీనో)](../tl/README.md) | [తమిళం](../ta/README.md) | [తెలుగు](./README.md) | [థాయ్](../th/README.md) | [టర్కిష్](../tr/README.md) | [ఉక్రేనియన్](../uk/README.md) | [ఉర్దూ](../ur/README.md) | [వియత్నామీస్](../vi/README.md)

> **ప్రాంతీయంగా క్లోన్ చేయాలనుకుంటున్నారా?**
>
> ఈ రిపోజిటరీలో 50+ భాషా అనువాదాలు ఉన్నాయి, ఇది డౌన్లోడ్ పరిమాణాన్ని గణనీయంగా పెంచుతుంది. అనువాదాల వలన కాకుండా క్లోన్ చేయాలనుకుంటే, sparse checkout ఉపయోగించండి:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> ఇది కోర్సు పూర్తి చేసేందుకు అవసరమైనన్నింటినీ అందిస్తుంది మరియు డౌన్లోడ్ చాలా వేగంగా ఉంటుంది.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Azure Developer CLI (azd) అంటే ఏమిటి?

**Azure Developer CLI (azd)** ఒక అభివృద్ధికరులకు అనుకూలమైన కమాండ్-లైన్ టూల్, ఇది Azureకు అప్లికేషన్లను డిప్లాయ్ చేయడాన్ని సులభతరం చేస్తుంది. చాలావరకు అనేక Azure వనరులను మానవీయంగా సృష్టించి కనెక్ట్ చేయాల్సిన బదులు, మీరు ఒకే కమాండ్‌తో మొత్తం అప్లికేషన్లను డిప్లాయ్ చేయవచ్చు.

### `azd up` యొక్క మాంత్రికత

```bash
# ఈ ఒక్క కమాండ్ అన్ని పనులు చేస్తుంది:
# ✅ అన్ని అజూర్ వనరులను సృష్టిస్తుంది
# ✅ నెట్‌వర్కింగ్ మరియు భద్రతను కాన్ఫిగర్ చేస్తుంది
# ✅ మీ అనువర్తన కోడ్‌ను నిర్మిస్తుంది
# ✅ అజూర్‌కు డిప్లాయ్ చేస్తుంది
# ✅ న Ihnen ఒక పనిచేసే URL ఇస్తుంది
azd up
```

**అంతే!** Azure పోర్టల్‌లో క్లిక్ చేయాల్సిన అవసరం లేదు, ముందుగా నేర్చుకోవాల్సిన క్లిష్టమైన ARM టెంప్లేట్‌లు లేవు, మాన్యువల్ కాన్ఫిగరేషన్ అవసరం లేదు - కేవలం Azureపై పనిచేస్తున్న అప్లికేషన్లు మాత్రమే.

---

## ❓ Azure Developer CLI vs Azure CLI: తేడా ఏమిటి?

ఇది ప్రారంభికులు సాధారణంగా అడిగే ప్రశ్న. దీని సరళమైన సమాధానం ఇక్కడ ఉంది:

| ఫీచర్ | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|--------|---------------------|--------------------------------|
| **ఉద్దేశ్యం** | ప్రత్యేక Azure వనరులను నిర్వహించడం | సంపూర్ణ అప్లికేషన్లను డిప్లాయ్ చేయడం |
| **దృక్పథం** | ఇన్ఫ్రాస్ట్రక్చర్-కేంద్రీకృతం | అప్లికేషన్-కేంద్రీకృతం |
| **ఉదాహరణ** | `az webapp create --name myapp...` | `azd up` |
| **అధ్యయన వక్రీకరణ** | Azure సేవలను తెలుసుకోవాలి | మీ అప్లికేషన్‌నునే తెలుసుకోండి |
| **వారికి ఉత్తమం** | DevOps, ఇన్ఫ్రాస్ట్రక్చర్ | డెవలపర్లు, ప్రోటోటైపింగ్ |

### సరళమైన ఉపమా

- **Azure CLI** ఒక ఇల్లు నిర్మించడానికి అన్ని సాధనాలు ఉన్నట్టుందిగా — హామర్లు, కత్తులు, నైల్స్. మీరు ఏదైనా నిర్మించగలరు, కానీ నిర్మాణంపై జ్ఞానం అవసరం.
- **Azure Developer CLI** ఒక కాంట్రాక్టర్‌ను నియమించుకోవడం లాంటిది — మీరు కావలసినది వివరించండి, వారు నిర్మాణాన్ని చూసుకుంటారు.

### ప్రతిదీ ఎప్పుడు ఉపయోగించాలో

| పరిస్థితి | ఉపయోగించవలసినది |
|----------|------------------|
| "నా వెబ్ యాప్‌ను త్వరగా డిప్లాయ్ చేయాలి" | `azd up` |
| "నాకు కేవలం ఒక స్టోరేజ్ అకౌంట్ సృష్టించాలి" | `az storage account create` |
| "నేను పూర్తి AI అప్లికేషన్ నిర్మిస్తున్నాను" | `azd init --template azure-search-openai-demo` |
| "నాకు ఒక నిర్దిష్ట Azure వనరును డీబగ్ చేయాల్సిన అవసరం ఉంది" | `az resource show` |
| "నాకు నిమిషాల్లో ప్రొడక్షన్-రెడీ డిప్లాయ్ కావాలి" | `azd up --environment production` |

### అవి కలిసి పనిచేస్తాయి!

AZD వెనుకకి Azure CLI ను ఉపయోగిస్తుంది. మీరు రెండింటినీ ఉపయోగించవచ్చు:
```bash
# మీ యాప్‌ను AZD తో డిప్లాయ్ చేయండి
azd up

# ఆపై Azure CLI తో నిర్దిష్ట వనరులను సవరించండి
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZDలో టెంప్లేట్స్ కనుగొనండి

శూన్య స్థానం నుండి ప్రారంభించవద్దు! **Awesome AZD** రెడీ-టు-డిప్లాయ్ టెంప్లేట్ల కమ్యూనిటీ సేకరణ:

| Resource | Description |
|----------|-------------|
| 🔗 [**Awesome AZD గ్యాలరీ**](https://azure.github.io/awesome-azd/) | ఒక క్లిక్ డిప్లాయ్‌తో 200+ టెంప్లేట్లను బ్రౌజ్ చేయండి |
| 🔗 [**టెంప్లేట్ సమర్పించండి**](https://github.com/Azure/awesome-azd/issues) | మీ స్వంత టెంప్లేట్‌ను కమ్యూనిటీకి జోడించండి |
| 🔗 [**GitHub రిపోజిటరీ**](https://github.com/Azure/awesome-azd) | స్టార్ చేయండి మరియు సోర్స్‌ను అన్వేషించండి |

### Awesome AZD నుండి ప్రజాదరణ పొందిన AI టెంప్లేట్స్

```bash
# ఆజ్యూర్ ఓపెన్‌ఎఐ + AI సెర్చ్‌తో RAG చాట్
azd init --template azure-search-openai-demo

# అతి వేగవంతమైన AI చాట్ అప్లికేషన్
azd init --template openai-chat-app-quickstart

# ఫౌండ్రీ ఏజెంట్స్‌తో AI ఏజెంట్స్
azd init --template get-started-with-ai-agents
```

---

## 🎯 3 దశలలో ప్రారంభం

### దశ 1: AZD ఇన్‌స్టాల్ చేయండి (2 నిమిషాలు)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### దశ 2: Azureలో లాగిన్ అవ్వండి

```bash
azd auth login
```

### దశ 3: మీ మొదటి అప్లికేషన్‌ని డిప్లాయ్ చేయండి

```bash
# టెంప్లేట్ నుండి ప్రారంభించండి
azd init --template todo-nodejs-mongo

# Azure కి పంపండి (ప్రతి దానిని సృష్టిస్తుంది!)
azd up
```

**🎉 అంతే!** మీ యాప్ ఇప్పుడు Azureలో లైవ్ అయింది.

### శుభ్రపరచడం (మర్చిపోకండి!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 ఈ కోర్సును ఎలా ఉపయోగించాలి

ఈ కోర్సు **క్రమబద్ధ అభ్యాసం** కోసం రూపొందించబడింది - మీరు మీకు సౌకర్యమైన స్థానం నుండి ప్రారంభించి మెరుగయ్యేలా ముందుకు వెళ్లండి:

| మీ అనుభవం | ఇక్కడ ప్రారంభించండి |
|-----------|---------------------|
| **Azureకి పూర్తి కొత్త** | [అధ్యాయం 1: పునాది](../..) |
| **Azure తెలుసు, AZDకి కొత్త** | [అధ్యాయం 1: పునాది](../..) |
| **AI యాప్స్ డిప్లాయ్ చేయాలనుకుంటున్నారు** | [అధ్యాయం 2: AI-ప్రధాన అభివృద్ధి](../..) |
| **ప్రయోగాత్మక అభ్యాసం కావాలి** | [🎓 ఇంటరాక్టివ్ వర్క్‌షాప్](workshop/README.md) - 3-4 గంటల మార్గదర్శక ప్రయోగశాల |
| **ప్రొడక్షన్ నమూనాలు కావాలి** | [అధ్యాయం 8: ప్రొడక్షన్ & ఎంటర్ప్రైజ్ నమూనాలు](../..) |

### తక్షణ సెట్‌అప్

1. **ఈ రిపోజిటరీని ఫోర్క్ చేయండి**: [![GitHub ఫార్క్స్](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **క్లోన్ చేయండి**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **సహాయం పొందండి**: [Azure డిస్కోర్డ్ కమ్యూనిటీ](https://discord.com/invite/ByRwuEEgH4)

> **ప్రాంతీయంగా క్లోన్ చేయాలనుకుంటున్నారా?**
>
> ఈ రిపోజిటరీలో 50+ భాషా అనువాదాలు ఉన్నాయి, ఇది డౌన్లోడ్ పరిమాణాన్ని గణనీయంగా పెంచుతుంది. అనువాదాల వలన కాకుండా క్లోన్ చేయాలనుకుంటే, sparse checkout ఉపయోగించండి:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> ఇది కోర్సు పూర్తి చేసేందుకు అవసరమైనన్నింటినీ అందిస్తుంది మరియు డౌన్లోడ్ చాలా వేగంగా ఉంటుంది.


## కోర్సు అవలోకనం

నిర్మిత అధ్యాయాల ద్వారా Azure Developer CLI (azd)లో ప్రావీణ్యం సాధించండి. **Microsoft Foundry ఇంటిగ్రేషన్‌తో AI అప్లికేషన్ డిప్లాయ్‌‌మెంట్‌పై ప్రత్యేక దృష్టి.**

### ఆధునిక డెవలపర్ల కొరకు ఈ కోర్సు ఎందుకు అవసరమైనది

Microsoft Foundry Discord కమ్యూనిటీ వివరాల ప్రకారం, **45% డెవలపర్లు AI వర్క్‌లాడ్స్ కోసం AZDని ఉపయోగించాలని కోరుకుంటున్నారు** కానీ ఈ క్రింది సమస్యలను ఎదుర్కొంటారు:
- సంక్లిష్ట బహు-సేవ AI ఆర్కిటెక్చర్లు
- ప్రొడక్షన్ AI డిప్లాయ్‌మెంట్ ఉత్తమ పద్ధతులు  
- Azure AI సేవల ఇంటిగ్రేషన్ మరియు కాన్ఫిగరేషన్
- AI వర్క్‌లోడ్‌ల కోసం ఖర్చు ఆప్టిమైజేషన్
- AI-స్పెసిఫిక్ డిప్లాయ్‌మెంట్ సమస్యలలో సమస్యలను పరిష్కరించడం

### అభ్యసన లక్ష్యాలు

ఈ నిర్మిత కోర్సును పూర్తి చేయగానే, మీరు:
- **AZD మౌలికాంశాలు లో ప్రావీణ్యం పొందండి**: కోర్ కాన్సెప్ట్‌లు, ఇన్‌స్టలేషన్, మరియు కాన్ఫిగరేషన్
- **AI అప్లికేషన్లు డిప్లాయ్ చేయండి**: Microsoft Foundry సేవలతో AZD ఉపయోగించడం
- **Infrastructure as Code అమలు చేయండి**: Bicep టెంప్లేట్లతో Azure వనరులను నిర్వహించు
- **డిప్లాయ్‌మెంట్‌లను ట్రబుల్షూట్ చేయండి**: సాధారణ సమస్యలను పరిష్కరించండి మరియు డీబగ్ చేయండి
- **ప్రొడక్షన్ కోసం ఆప్టిమైజ్ చేయండి**: భద్రత, స్కేలింగ్, మానిటరింగ్, మరియు ఖర్చు నిర్వహణ
- **బహుఏజెంట్ పరిష్కారాలు నిర్మించండి**: సంక్లిష్ట AI ఆర్కిటెక్చర్లను డిప్లాయ్ చేయండి

## 🗺️ కోర్సు మ్యాప్: అధ్యాయాల వారీగా వేగవంతమైన నావిగేషన్

ప్రతి అధ్యాయానికి README ఉంది, అందులో అభ్యాస లక్ష్యాలు, తక్షణ ప్రారంభాలు, మరియు వ్యాయామాలు ఉంటాయి:

| అధ్యాయం | విషయం | పాఠాలు | కాలం | సঙ্ক్లిష్టత |
|---------|-------|---------|----------|------------|
| **[అధ్యాయం 1: పునాది](docs/chapter-01-foundation/README.md)** | ప్రారంభం | [AZD మౌలికాంశాలు](docs/chapter-01-foundation/azd-basics.md) &#124; [ఇన్‌స్టలేషన్](docs/chapter-01-foundation/installation.md) &#124; [మొదటి ప్రాజెక్ట్](docs/chapter-01-foundation/first-project.md) | 30-45 నిమిషాలు | ⭐ |
| **[అధ్యాయం 2: AI అభివృద్ధి](docs/chapter-02-ai-development/README.md)** | AI-ప్రధాన అప్స్ | [Foundry ఇంటిగ్రేషన్](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI ఏజెంట్లు](docs/chapter-02-ai-development/agents.md) &#124; [మోడల్ డిప్లాయ్‌మెంట్](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [వర్క్‌షాప్](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 గంటలు | ⭐⭐ |
| **[అధ్యాయం 3: కాన్ఫిగరేషన్](docs/chapter-03-configuration/README.md)** | ఆథ్ &భద్రత | [కాన్ఫిగరేషన్](docs/chapter-03-configuration/configuration.md) &#124; [ఆథ్ & భద్రత](docs/chapter-03-configuration/authsecurity.md) | 45-60 నిమిషాలు | ⭐⭐ |
| **[Ch 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC & డిప్లాయ్‌మెంట్ | [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 గంటలు | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | ఏఐ ఏజంట్ పరిష్కారాలు | [Retail Scenario](examples/retail-scenario.md) &#124; [Coordination Patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 గంటలు | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | ప్లానింగ్ & ధృవీకరణ | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 గంట | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | డీబగ్ & పరిష్కారం | [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 గంటలు | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | ఎంటర్‌ప్రైజ్ నమూనాలు | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 గంటలు | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | హ్యాండ్-ఆన్ ల్యాబ్ | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 గంటలు | ⭐⭐ |

**మొత్తం కోర్సు వ్యవధి:** ~10-14 గంటలు | **నైపుణ్య ప్రగతి:** ప్రారంభ స్థాయి → ప్రొడక్షన్-సిద్ధం

---

## 📚 అభ్యాస అధ్యాయాలు

*మీ అనుభవ స్థాయి మరియు లక్ష్యాల ఆధారంగా మీ అభ్యాస మార్గాన్ని ఎంచుకోండి*

### 🚀 అధ్యాయ 1: పునాది మరియు త్వరిత ప్రారంభం
**ముందస్తు అర్హతలు**: Azure subscription, basic command line knowledge  
**వ్యవధి**: 30-45 నిమిషాలు  
**జటిలత**: ⭐

#### మీరు నేర్చుకునే అంశాలు
- Azure Developer CLI మౌలికాంశాల అవగాహన
- మీ ప్లాట్‌ఫారమ్‌పై AZD ను ఇన్‌స్టాల్ చేయడం
- మీ తొలి సఫలమైన డిప్లాయ్‌మెంట్

#### అభ్యాస వనరులు
- **🎯 ఇక్కడి నుంచి ప్రారంభించండి**: [Azure Developer CLI అంటే ఏమిటి?](../..)
- **📖 సిద్ధాంతం**: [AZD బేసిక్స్](docs/chapter-01-foundation/azd-basics.md) - ప్రాథమిక కాన్సెప్ట్‌లు మరియు పదావళి
- **⚙️ సెటప్**: [Installation & Setup](docs/chapter-01-foundation/installation.md) - ప్లాట్‌ఫార్మ్-నిర్దిష్ట గైడ్‌లు
- **🛠️ ప్రాక్టికల్**: [మీ తొలి ప్రాజెక్ట్](docs/chapter-01-foundation/first-project.md) - దశల వారీ ట్యూటోరియల్
- **📋 త్వరిత సూచిక**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### ప్రాక్టికల్ వ్యాయామాలు
```bash
# శీఘ్ర ఇన్‌స్టాలేషన్ తనిఖీ
azd version

# మీరు మీ మొదటి అనువర్తనాన్ని డిప్లాయ్ చేయండి
azd init --template todo-nodejs-mongo
azd up
```

**💡 అధ్యాయ ఫలితం**: AZD ఉపయోగించి ఒక సరళమైన వెబ్ అప్లికేషన్‌ను Azureలో సక్సెస్‌ఫుల్‌గా డిప్లాయ్ చేయడం

**✅ విజయ ధృవీకరణ:**
```bash
# అధ్యాయం 1 పూర్తి చేసిన తర్వాత, మీరు ఈ క్రిందివి చేయగలిగేలా ఉండాలి:
azd version              # స్థాపించబడిన వెర్షన్‌ను చూపిస్తుంది
azd init --template todo-nodejs-mongo  # ప్రాజెక్ట్‌ను ప్రారంభిస్తుంది
azd up                  # Azureకి డిప్లాయ్ చేస్తుంది
azd show                # చెలామణిలో ఉన్న యాప్ URL‌ను చూపిస్తుంది
# అప్లికేషన్ బ్రౌజర్‌లో తెరవబడుతుంది మరియు పనిచేస్తుంది
azd down --force --purge  # వనరులను శుభ్రపరుస్తుంది
```

**📊 సమయ పెట్టుబడి:** 30-45 నిమిషాలు  
**📈 తర్వాత నైపుణ్య స్థాయి:** సాధారణ అప్లికేషన్లను స్వతంత్రంగా డిప్లాయ్ చేయగలరు

**✅ విజయ ధృవీకరణ:**
```bash
# అధ్యాయం 1 పూర్తి అయిన తర్వాత, మీరు ఈ క్రింది పనులు చేయగలుగుతారు:
azd version              # ఇన్‌స్టాల్ చేసిన వెర్షన్ చూపిస్తుంది
azd init --template todo-nodejs-mongo  # ప్రాజెక్ట్‌ను ప్రారంభిస్తుంది
azd up                  # Azureకు డిప్లాయ్ చేస్తుంది
azd show                # పనిచేస్తున్న యాప్ యొక్క URL చూపిస్తుంది
# అప్లికేషన్ బ్రౌజర్‌లో తెరుచుకుని పని చేస్తుంది
azd down --force --purge  # వనరులను శుభ్రం చేస్తుంది
```

**📊 సమయ పెట్టుబడి:** 30-45 నిమిషాలు  
**📈 తర్వాత నైపుణ్య స్థాయి:** సాధారణ అప్లికేషన్లను స్వతంత్రంగా డిప్లాయ్ చేయగలరు

---

### 🤖 అధ్యాయ 2: ఏఐ-ఫస్ట్ డెవలప్‌మెంట్ (ఏఐ డెవలపర్లు కోసం సిఫార్సు)
**ముందస్తు అర్హతలు**: అధ్యాయ 1 పూర్తి  
**వ్యవధి**: 1-2 గంటలు  
**జటిలత**: ⭐⭐

#### మీరు నేర్చుకునే అంశాలు
- AZDతో Microsoft Foundry ఇంటిగ్రేషన్
- ఏఐతో శక్తివంతమైన అప్లికేషన్లను డిప్లాయ్ చేయడం
- ఏఐ సేవా కాన్ఫిగరేషన్ల అవగాహన

#### అభ్యాస వనరులు
- **🎯 ఇక్కడి నుంచి ప్రారంభించండి**: [Microsoft Foundry ఇంటిగ్రేషన్](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 ఏఐ ఏజెంట్లు**: [AI ఏజెంట్స్ గైడ్](docs/chapter-02-ai-development/agents.md) - AZDతో తెలివైన ఏజెంట్లను డిప్లాయ్ చేయండి
- **📖 నమూనాలు**: [AI మోడల్ డిప్లాయ్‌మెంట్](docs/chapter-02-ai-development/ai-model-deployment.md) - AI మోడెళ్లను డిప్లాయ్ చేసి నిర్వహించడం
- **🛠️ వర్క్‌షాప్**: [AI వర్క్‌షాప్ ల్యాబ్](docs/chapter-02-ai-development/ai-workshop-lab.md) - మీ ఏఐ పరిష్కారాలను AZD-కోసం సిద్ధం చేయండి
- **🎥 ఇంటరాక్టివ్ గైడ్**: [Workshop Materials](workshop/README.md) - బ్రౌజర్-ఆధారిత అభ్యాసం MkDocs * DevContainer పరిసరంతో
- **📋 టెంప్లేట్స్**: [Microsoft Foundry టెంప్లేట్స్](../..)
- **📝 ఉదాహరణలు**: [AZD డిప్లాయ్‌మెంట్ ఉదాహరణలు](examples/README.md)

#### ప్రాక్టికల్ వ్యాయామాలు
```bash
# మీ మొదటి AI అనువర్తనాన్ని డిప్లాయ్ చేయండి
azd init --template azure-search-openai-demo
azd up

# మరిన్ని AI టెంప్లేట్లను ప్రయత్నించండి
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 అధ్యాయ ఫలితం**: RAG సామర్థ్యాలతో ఏఐ-చలిత చాట్ అప్లికేషన్‌ను డిప్లాయ్ చేసి కాన్ఫిగర్ చేయటం

**✅ విజయ ధృవీకరణ:**
```bash
# అధ్యాయం 2 తర్వాత, మీరు చేయగలుగుతారు:
azd init --template azure-search-openai-demo
azd up
# AI చాట్ ఇంటర్‌ఫేస్‌ను పరీక్షించండి
# ప్రశ్నలు అడిగి, మూలాలతో AI ఆధారిత స్పందనలు పొందండి
# శోధన ఇంటిగ్రేషన్ సరిగా పనిచేస్తుందో నిర్ధారించండి
azd monitor  # Application Insights టెలిమెట్రీని చూపిస్తున్నదో తనిఖీ చేయండి
azd down --force --purge
```

**📊 సమయ పెట్టుబడి:** 1-2 గంటలు  
**📈 తర్వాత నైపుణ్య స్థాయి:** ప్రొడక్షన్-సిద్ధ ఏఐ అప్లికేషన్లను డిప్లాయ్ చేసి, కాన్ఫిగర్ చేయగలరు  
**💰 ఖర్చు అవగాహన:** అభివృద్ధి ఖర్చులు $80-150/నెల, ప్రొడక్షన్ ఖర్చులు $300-3500/నెల అని అర్థం చేసుకోండి

#### 💰 ఏఐ డిప్లాయ్‌మెంట్స్ కోసం ఖర్చు పరామర్శలు

**అభివృద్ధి పరిసరాలు (అంచనా $80-150/నెల):**
- Azure OpenAI (Pay-as-you-go): $0-50/నెల (టోకన్ వినియోగం ఆధారంగా)
- AI Search (Basic tier): $75/నెల
- Container Apps (Consumption): $0-20/నెల
- Storage (Standard): $1-5/నెల

**ప్రొడక్షన్ పరిసరాలు (అంచనా $300-3,500+/నెల):**
- Azure OpenAI (PTU కొరకు స్థిరంగా పనితీరు): $3,000+/నెల లేదా అధిక వాల్యూమ్ పట్ల Pay-as-you-go
- AI Search (Standard tier): $250/నెల
- Container Apps (Dedicated): $50-100/నెల
- Application Insights: $5-50/నెల
- Storage (Premium): $10-50/నెల

**💡 ఖర్చు అనుకూలన సూచనలు:**
- నేర్చుకోవడానికి Azure OpenAI కోసం **ఉచిత స్థాయి** ఉపయోగించండి (50,000 టోకన్లు/నెల చేర్చబడి ఉంటాయి)
- అభివృద్ధి కాకపోతే వనరులను డీలొకేట్ చేయడానికి `azd down` రన్ చేయండి
- ప్రారంభంలో consumption-ఆధారిత బిల్లింగ్‌తో ప్రారంభించి, ప్రొడక్షన్ కోసం మాత్రమే PTUకి అప్గ్రేడ్ చేయండి
- డిప్లాయ్‌మెంట్ ముందు ఖర్చులను అంచనా వేయడానికి `azd provision --preview` ఉపయోగించండి
- ఆటో-స్కేలింగ్ ఎనేబుల్ చేయండి: వాస్తవ వినియోగానికి మాత్రమే చెల్లించండి

**ఖర్చు పరిశీలన:**
```bash
# అంచనా వేసిన నెలవారీ ఖర్చులను తనిఖీ చేయండి
azd provision --preview

# Azure పోర్టల్‌లో నిజమైన ఖర్చులను పర్యవేక్షించండి
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ అధ్యాయ 3: కాన్ఫిగరేషన్ మరియు ప్రామాణీకరణ
**ముందస్తు అర్హతలు**: అధ్యాయ 1 పూర్తి  
**వ్యవధి**: 45-60 నిమిషాలు  
**జటిలత**: ⭐⭐

#### మీరు నేర్చుకునే అంశాలు
- పరిసరాలు, కాన్ఫిగరేషన్ మరియు నిర్వహణ
- ప్రామాణీకరణ మరియు భద్రత ఉత్తమ ఆచరణలు
- వనరుల పేరుదాక మరియు సంస్థీకరణ

#### అభ్యాస వనరులు
- **📖 కాన్ఫిగరేషన్**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - పరిసరాల సెటప్
- **🔐 భద్రత**: [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - ఆథెంటికేషన్ నమూనాలు మరియు నిర్వహించిన ఐడెంటిటీ
- **📝 ఉదాహరణలు**: [Database App Example](examples/database-app/README.md) - AZD డేటాబేస్ ఉదాహరణలు

#### ప్రాక్టికల్ వ్యాయామాలు
- బహుళ పరిసరాలను కాన్ఫిగర్ చేయండి (dev, staging, prod)
- నిర్వహించబడే ఐడెంటిటీ ప్రామాణీకరణను సెటప్ చేయండి
- పరిసర-నిర్దిష్ట కాన్ఫిగరేషన్లను అమలు చేయండి

**💡 అధ్యాయ ఫలితం**: సరైన ప్రామాణీకరణ మరియు భద్రతతో బహుళ పరిసరాలను నిర్వహించడం

---

### 🏗️ అధ్యాయ 4: ఇన్‌ఫ్రాస్ట్రక్చర్ కోడ్ ద్వారా & డిప్లాయ్‌మెంట్
**ముందస్తు అర్హతలు**: అధ్యాయాలు 1-3 పూర్తి  
**వ్యవధి**: 1-1.5 గంటలు  
**జటిలత**: ⭐⭐⭐

#### మీరు నేర్చుకునే అంశాలు
- అధునాతన డిప్లాయ్‌మెంట్ నమూనాలు
- Bicep ద్వారా Infrastructure as Code
- వనరు ప్రొవిజనింగ్ వ్యూహాలు

#### అభ్యాస వనరులు
- **📖 డిప్లాయ్‌మెంట్**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - పూర్తి వర్క్‌ఫ్లోస్
- **🏗️ ప్రొవిజనింగ్**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Azure వనరుల నిర్వహణ
- **📝 ఉదాహరణలు**: [Container App Example](../../examples/container-app) - కంటెయినరైజ్డ్ డిప్లాయ్‌మెంట్లు

#### ప్రాక్టికల్ వ్యాయామాలు
- కస్టమ్ Bicep టెంప్లేట్స్ సృష్టించండి
- బహుళ-సర్వీస్ అప్లికేషన్లను డిప్లాయ్ చేయండి
- బ్లూ-గ్రీన్ డిప్లాయ్‌మెంట్ వ్యూహాలను అమలు చేయండి

**💡 అధ్యాయ ఫలితం**: కస్టమ్ ఇన్‌ఫ్రాస్ట్రక్చర్ టెంప్లేట్స్ ఉపయోగించి సంక్లిష్ట బహుళ-సర్వీస్ అప్లికేషన్లను డిప్లాయ్ చేయగలగడం

---

### 🎯 అధ్యాయ 5: బహుళ-ఏజెంట్ ఏఐ పరిష్కారాలు (అగ్రస్థాయి)
**ముందస్తు అర్హతలు**: అధ్యాయాలు 1-2 పూర్తి  
**వ్యవధి**: 2-3 గంటలు  
**జటిలత**: ⭐⭐⭐⭐

#### మీరు నేర్చుకునే అంశాలు
- బహుళ-ఏజెంట్ ఆర్కిటెక్చర్ నమూనాలు
- ఏజెంట్ ఆర్కెస్ట్రేషన్ మరియు కోఆర్డినేషన్
- ప్రొడక్షన్-సిద్ధ ఏఐ డిప్లాయ్‌మెంట్లు

#### అభ్యాస వనరులు
- **🤖 ఫీచర్డ్ ప్రాజెక్ట్**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - పూర్తి అమలు
- **🛠️ ARM టెంప్లేట్లు**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - ఒక్క క్లిక్ డిప్లాయ్‌మెంట్
- **📖 ఆర్కిటెక్చర్**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - కోఆర్డినేషన్ నమూనాలు

#### ప్రాక్టికల్ వ్యాయామాలు
```bash
# సంపూర్ణ రిటైల్ బహుళ-ఏజెంట్ పరిష్కారాన్ని అమలు చేయండి
cd examples/retail-multiagent-arm-template
./deploy.sh

# ఏజెంట్ కాన్ఫిగరేషన్లను అన్వేషించండి
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 అధ్యాయ ఫలితం**: కస్టమర్ మరియు ఇన్వెంటరీ ఏజెంట్లతో ప్రొడక్షన్-సిద్ధ బహుళ-ఏజెంట్ ఏఐ పరిష్కారాన్ని డిప్లాయ్ చేసి నిర్వహించడం

---

### 🔍 అధ్యాయ 6: ప్రీ-డిప్లాయ్‌మెంట్ ధృవీకరణ & ప్లానింగ్
**ముందస్తు అర్హతలు**: అధ్యాయ 4 పూర్తి  
**వ్యవధి**: 1 గంట  
**జటిలత**: ⭐⭐

#### మీరు నేర్చుకునే అంశాలు
- సామర్థ్య ప్రణాళిక మరియు వనరు ధృవీకరణ
- SKU ఎంపిక వ్యూహాలు
- ప్రీ-ఫ్లైట్ తనిఖీలు మరియు ఆటోమేషన్

#### అభ్యాస వనరులు
- **📊 ప్లానింగ్**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - వనరు ధృవీకరణ
- **💰 ఎంపిక**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - ఖర్చు-ప్రభావిత ఎంపికలు
- **✅ ధృవీకరణ**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - ఆటోమేటెడ్ స్క్రిప్ట్‌లు

#### ప్రాక్టికల్ వ్యాయామాలు
- సామర్థ్య ధృవీకరణ స్క్రిప్ట్‌లు పరిపాలించండి
- ఖర్చు కోసం SKU ఎంపికలను ఆప్టిమైజ్ చేయండి
- ఆటోమేటెడ్ ప్రీ-డిప్లాయ్‌మెంట్ తనిఖీలు అమలు చేయండి

**💡 అధ్యాయ ఫలితం**: అమలు చేయడానికి ముందు డిప్లాయ్‌మెంట్లను ధృవీకరించి ఆప్టిమైజ్ చేయగలగడం

---

### 🚨 అధ్యాయ 7: ట్రబుల్షూటింగ్ & డీబగ్గింగ్
**ముందస్తు అర్హతలు**: ఏదైనా డిప్లాయ్‌మెంట్ అధ్యాయం పూర్తి అయి ఉండాలి  
**వ్యవధి**: 1-1.5 గంటలు  
**జటిలత**: ⭐⭐

#### మీరు నేర్చుకునే అంశాలు
- వ్యవస్థబద్ధమైన డీబగ్గింగ్ ప్రక్రియలు
- సాధారణ సమస్యలు మరియు పరిష్కారాలు
- ఏఐ-స్పెసిఫిక్ ట్రబుల్షూటింగ్

#### అభ్యాస వనరులు
- **🔧 సాధారణ సమస్యలు**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ మరియు పరిష్కారాలు
- **🕵️ డీబగ్గింగ్**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - దశల వారీ వ్యూహాలు
- **🤖 ఏఐ సమస్యలు**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - ఏఐ సేవా సమస్యలు

#### ప్రాక్టికల్ వ్యాయామాలు
- డిప్లాయ్‌మెంట్ వైఫల్యాలను గుర్తించండి
- ప్రామాణీకరణ సమస్యలను పరిష్కరించండి
- ఏఐ సర్వీస్ కనెక్టివిటీని డీబగ్ చేయండి

**💡 అధ్యాయ ఫలితం**: సాధారణ డిప్లాయ్‌మెంట్ సమస్యలను స్వతంత్రంగా గుర్తించి పరిష్కరించగలగడం

---

### 🏢 అధ్యాయ 8: ప్రొడక్షన్ & ఎంటర్‌ప్రైజ్ నమూనాలు
**ముందస్తు అర్హతలు**: అధ్యాయాలు 1-4 పూర్తి  
**వ్యవధి**: 2-3 గంటలు  
**జటిలత**: ⭐⭐⭐⭐

#### మీరు నేర్చుకునే అంశాలు
- ప్రొడక్షన్ డిప్లాయ్‌మెంట్ వ్యూహాలు
- ఎంటర్ప్రైజ్ భద్రత నమూనాలు
- మానిటరింగ్ మరియు ఖర్చు ఆప్టిమైజేషన్

#### అభ్యాస వనరులు
- **🏭 ప్రొడక్షన్**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - ఎంటర్‌ప్రైజ్ నమూనాలు
- **📝 ఉదాహరణలు**: [Microservices Example](../../examples/microservices) - సంక్లిష్ట ఆర్కిటెక్చర్లు
- **📊 మానిటరింగ్**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - మానిటరింగ్

#### ప్రాక్టికల్ వ్యాయామాలు
- ఎంటర్‌ప్రైజ్ భద్రత నమూనాలను అమలు చేయండి
- సమగ్ర మానిటరింగ్ సెటప్ చేయండి
- శ్రద్ధగల ప్రభుత్వంతో ప్రొడక్షన్‌కు డిప్లాయ్ చేయండి

**💡 అధ్యాయ ఫలితం**: పూర్తి ప్రొడక్షన్ సామర్ధ్యాలతో ఎంటర్‌ప్రైజ్-రెడి అప్లికేషన్లు డిప్లాయ్ చేయగలగడం

---

## 🎓 వర్క్‌షాప్ అవలోకనం: హ్యాండ్-ఆన్ అభ్యాస అనుభవం

> **⚠️ వర్క్‌షాప్ స్థితి: అభివృద్ధి క్రియాశీలంలో ఉంది**
> వర్క్‌షాప్ పదార్థాలు ప్రస్తుతం తయారు చేయబడుతూ, మెరుగుపరిచే ప్రక్రియలో ఉన్నాయి. కోర్ మాడ్యూల్స్ పనిచేస్తున్నప్పటికీ, కొన్ని అధునాతన విభాగాలు అసంపూర్ణంగా ఉన్నాయి. మేము అన్ని కంటెంట్‌ను పూర్తి చేయడానికి క్రియాశీలంగా పని చేస్తున్నాము. [ప్రగతిని ట్రాక్ చేయండి →](workshop/README.md)

### ఇంటరాక్టివ్ వర్క్‌షాప్ పదార్థాలు
**బ్రౌజర్-ఆధారిత సాధనాలు మరియు మార్గనిర్దేశిత వ్యాయామాలతో సమగ్ర ప్రాక్టికల్ నేర్చుకునే అనుభవం**

మా వర్క్‌షాప్ పదార్థాలు పై అధ్యాయంపై ఆధారమైన పాఠ్య ప్రణాళికకు అనుకూలంగా ఒక నిర్మిత, ఇంటరాక్టివ్ నేర్చుకునే అనుభవాన్ని అందిస్తాయి. వర్క్‌షాప్ స్వ-గతితో నేర్చుకోవడానికి మరియు ఇన్‌స్ట్రక్టర్ నేతృత్వంలోని సెషన్స్ కోసం రూపొందించబడి ఉంది.

#### 🛠️ వర్క్‌షాప్ ఫీచర్లు
- **Browser-Based Interface**: శోధన, కాపీ మరియు థీం ఫీచర్లతో పూర్తి MkDocs-చే నడిచే వర్క్‌షాప్
- **GitHub Codespaces Integration**: ఒక క్లిక్‌లో డెవలప్‌మెంట్ పరిసరాన్ని సెటప్ చేయడం
- **Structured Learning Path**: 8-మాడ్యూల్ మార్గనిర్దేశిత వ్యాయామాలు (మొత్తం 3-4 గంటలు)
- **Progressive Methodology**: పరిచయం → ఎంపిక → ధృవీకరణ → విభజన → కాన్ఫిగరేషన్ → అనుకూలీకరణ → తొలగింపు → సమీక్ష
- **Interactive DevContainer Environment**: ముందుగా కాన్ఫిగర్ చేయబడిన టూల్స్ మరియు డిపెండెన్సీలు

#### 📚 వర్క్‌షాప్ మాడ్యూల్ నిర్మాణం
వర్క్‌షాప్ మీను కనుగొనడం నుండి డిప్లాయ్‌మెంట్ నైపుణ్యానికి తీసుకెళ్తూ ఒక **8-మాడ్యూల్ ప్రగతిశీల విధానం**ను అనుసరిస్తుంది:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. పరిచయం** | వర్క్‌షాప్ అవలోకనం | పాఠ్య లక్ష్యాలు, ముందస్తు అవసరాలు మరియు వర్క్‌షాప్ నిర్మాణాన్ని అర్థం చేసుకోండి | 15 నిమిషాలు |
| **1. ఎంపిక** | టెంప్లేట్ అన్వేషణ | AZD టెంప్లేట్లను అన్వేషించి మీ దృశ్యానికి సరైన AI టెంప్లేట్‌ను ఎంచుకోండి | 20 నిమిషాలు |
| **2. ధృవీకరణ** | Deploy & Verify | `azd up` తో టెంప్లేట్‌ను డిప్లాయ్ చేసి ఇన్‌ఫ్రాస్ట్రక్చర్ సరిగ్గా పనిచేస్తుందో ధృవీకరించండి | 30 నిమిషాలు |
| **3. నిర్మాణాన్ని అర్థం చేసుకోండి** | Understand Structure | GitHub Copilot ఉపయోగించి టెంప్లేట్ ఆర్కిటెక్చర్, Bicep ఫైళ్ళు మరియు కోడ్ సంస్థాపనను అన్వేషించండి | 30 నిమిషాలు |
| **4. కాన్ఫిగరేషన్** | azure.yaml లో లోతైన అవగాహన | `azure.yaml` కాన్ఫిగరేషన్, లైఫ్‌సైకిల్ హుక్స్ మరియు ఎన్విరాన్‌మెంట్ వేరియబుల్స్‌లో నిపుణత్వం సాధించండి | 30 నిమిషాలు |
| **5. అనుకూలీకరణ** | మీదిగా మార్చండి | AI Search, ట్రేసింగ్, మూల్యాంకనం వెలికితీయండి మరియు మీ సందర్భానికి అనుగుణంగా అనుకూలీకరించండి | 45 నిమిషాలు |
| **6. Teardown** | శుభ్ర పరచడం | `azd down --purge` తో వనరులను సురక్షితంగా డీప్రోవిజన్ చేయండి | 15 నిమిషాలు |
| **7. Wrap-up** | తదుపరి చర్యలు | సాధించిన పనులను, కీలక సూత్రాలను సమీక్షించి మీ అధ్యయన యాత్రను కొనసాగించండి | 15 నిమిషాలు |

**Workshop Flow:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 వర్క్‌షాప్ ప్రారంభం ఎలా చేయాలి
```bash
# వికల్పం 1: GitHub Codespaces (సిఫార్సు చేయబడింది)
# రిపోజిటరీలో "Code" → "Create codespace on main" పై క్లిక్ చేయండి

# వికల్పం 2: స్థానిక అభివృద్ధి
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.mdలోని సెట్‌అప్ సూచనలను అనుసరించండి
```

#### 🎯 వర్క్‌షాప్ నేర్చుకునే ఫలితాలు
వర్క్‌షాప్ పూర్తి చేయడం ద్వారా, పాల్గొనేవారు:
- **ఉత్పత్తి AI అప్లికేషన్లను డిప్లాయ్ చేయగలరు**: AZD ను Microsoft Foundry సేవలతో ఉపయోగించడం
- **బహుళ-ఏజంట్ శిల్పకళలో నైపుణ్యాన్ని సాదించండి**: సమన్వయమైన AI ఏజెంట్ పరిష్కారాలను అమలు చేయండి
- **సెక్యూరిటీ ఉత్తమ పద్ధతులను అమలు చేయండి**: ప్రమाणीकरण మరియు యాక్సెస్ కంట్రోల్‌ను కాన్ఫిగర్ చేయండి
- **స్కేల్ కోసం ఆప్టిమైజ్ చేయండి**: ఖర్చు-సమర్థవంతమైన, పనితీరుతో కూడిన డిప్లాయ్‌మెంట్ డిజైన్ చేయండి
- **డిప్లాయ్‌మెంట్ సమస్యలను పరిష్కరించండి**: సాధారణ సమస్యలను స్వతంత్రంగా పరిష్కరించండి

#### 📖 వర్క్‌షాప్ వనరులు
- **🎥 ఇంటరాక్టివ్ గైడ్**: [వర్క్‌షాప్ పదార్థాలు](workshop/README.md) - బ్రౌజర్-ఆధారిత నేర్చుకునే పరిసరము
- **📋 మాడ్యూల్ వారీ సూచనలు**:
  - [0. పరిచయం](workshop/docs/instructions/0-Introduction.md) - వర్క్‌షాప్ అవలోకనం మరియు లక్ష్యాలు
  - [1. ఎంపిక](workshop/docs/instructions/1-Select-AI-Template.md) - AI టెంప్లేట్లను కనుగొనడం మరియు ఎంపిక చేయడం
  - [2. ధృవీకరణ](workshop/docs/instructions/2-Validate-AI-Template.md) - టెంప్లేట్లను డిప్లాయ్ చేసి ధృవీకరించండి
  - [3. నిర్మాణాన్ని విశ్లేషించండి](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - టెంప్లేట్ ఆర్కిటెక్చర్‌ను అన్వేషించండి
  - [4. కాన్ఫిగర్ చేయండి](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml లో నైపుణ్యం సాదించండి
  - [5. అనుకూలీకరించండి](workshop/docs/instructions/5-Customize-AI-Template.md) - మీ సందర్భానికి అనుగుణంగా అనుకూలీకరించండి
  - [6. శుభ్రపరచడం](workshop/docs/instructions/6-Teardown-Infrastructure.md) - వనరులను శుభ్రపరచండి
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - సమీక్ష మరియు తదుపరి చర్యలు
- **🛠️ AI వర్క్‌షాప్ ల్యాబ్**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-కేంద్రీకృత వ్యాయామాలు
- **💡 క్విక్ స్టార్ట్**: [Workshop Setup Guide](workshop/README.md#quick-start) - పరిసర సెట్టింగ్ సూచనలు

**సరైనవి:** కార్పొరేట్ శిక్షణ, విశ్వవిద్యాలయ కోర్సులు, స్వ-గతి నేర్చుకోవడం, మరియు డెవలపర్ బూట్‌క్యాంప్‌లు.

---

## 📖 లోతైన అవగాహన: AZD సామర్ధ్యాలు

మూల అంశాలను దాటించి, AZD ఉత్పత్తి డిప్లాయ్‌మెంట్ల కోసం శక్తివంతమైన ఫీచర్లను అందిస్తుంది:

- **టెంప్లేట్-ఆధారిత డిప్లాయ్‌మెంట్లు** - సాధారణ అప్లికేషన్ నమూనాల కోసం ముందుగా తయారుచేసిన టెంప్లేట్లను ఉపయోగించండి
- **Infrastructure as Code** - Bicep లేదా Terraform ఉపయోగించి Azure వనరులను నిర్వహించండి  
- **ఇంటిగ్రేటెడ్ వర్క్‌ఫ్లోస్** - అప్లికేషన్లను సజావుగా ప్రావిజన్, డిప్లాయ్ మరియు మానిటర్ చేయండి
- **డెవలపర్-ఫ్రెండ్లీ** - డెవలపర్ ఉత్పాదకత మరియు అనుభవం కోసం ఆప్టిమైజ్ చేయబడింది

### **AZD + Microsoft Foundry: AI డిప్లాయ్‌మెంట్స్‌కు సరైనది**

**AI పరిష్కారాల కోసం AZD ఎందుకు?** AZD AI డెవలపర్లు ఎదుర్కొనే ప్రధాన సవాళ్లను అధిగమిస్తుంది:

- **AI-సిద్ధమైన టెంప్లేట్లు** - Azure OpenAI, Cognitive Services, మరియు ML వర్క్‌లోడ్స్ కోసం ముందుగా కాన్ఫిగర్ చేయబడిన టెంప్లేట్లు
- **సురక్షిత AI డిప్లాయ్‌మెంట్‌లు** - AI సేవల కోసం బిల్ట్-ఇన్ సెక్యూరిటీ నమూనాలు, API కీలు మరియు మోడల్ ఎండ్‌పాయింట్లు  
- **ఉత్పత్తి AI ప్యాటర్న్స్** - స్కేలా బద్ధమైన, ఖర్చు-సమర్థవంతమైన AI అప్లికేషన్ డిప్లాయ్‌మెంట్ ఉత్తమ పద్ధతులు
- **ఎండ్-టు-ఎండ్ AI వర్క్‌ఫ్లోస్** - మోడల్ అభివృద్ధి నుండి ప్రొడక్షన్ డిప్లాయ్‌మెంట్ వరకు సరైన మానిటరింగ్‌తో
- **ఖర్చు ఆప్టిమైజేషన్** - AI వర్క్‌లోడ్స్ కోసం తెలివైన వనరుల కేటాయింపు మరియు స్కేలింగ్ వ్యూహాలు
- **Microsoft Foundry ఇంటిగ్రేషన్** - Microsoft Foundry మోడల్ క్యాటలాగ్ మరియు ఎండ్‌పాయింట్లకు సమరస్యమైన కనెక్షన్

---

## 🎯 టెంప్లేట్లు & ఉదాహరణల లైబ్రరీ

### ఫీచర్డ్: Microsoft Foundry టెంప్లేట్లు
**మీరు AI అప్లికేషన్లను డిప్లాయ్ చేస్తున్నట్లయితే ఇక్కడి నుంచి ప్రారంభించండి!**

> **సూచన:** ఈ టెంప్లేట్లు వివిధ AI ప్యాటర్న్‌లను చూపిస్తాయి. కొన్నింటి వారు బాహ్య Azure Samples నుండి ఉంటాయి, మరికొన్నీ స్థానిక అమలింపులుగా ఉంటాయి.

| టెంప్లేట్ | అధ్యాయం | క్లిష్టత | సేవలు | రకం |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | అధ్యాయం 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | బాహ్య |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | అధ్యాయం 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| బాహ్య |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | అధ్యాయం 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | బాహ్య |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | అధ్యాయం 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | బాహ్య |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | అధ్యాయం 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | బాహ్య |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | అధ్యాయం 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | బాహ్య |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | అధ్యాయం 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **స్థానికం** |

### ఫీచర్డ్: పూర్తి శిక్షణా సన్నివేశాలు
**ప్రొడక్షన్-రెడి అప్లికేషన్ టెంప్లేట్లు నేర్చుకునే అధ్యాయాలకు మ్యాపింగ్ చేయబడ్డాయి**

| టెంప్లేట్ | నేర్చుకునే అధ్యాయం | క్లిష్టత | కీలకంగా నేర్చుకునే విషయం |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | అధ్యాయం 2 | ⭐ | మూల AI డిప్లాయ్‌మెంట్ నమూనాలు |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | అధ్యాయం 2 | ⭐⭐ | Azure AI Search తో RAG అమలు |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | అధ్యాయం 4 | ⭐⭐ | Document Intelligence ఇంటిగ్రేషన్ |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | అధ్యాయం 5 | ⭐⭐⭐ | ఏజెంట్ ఫ్రేమ్‌వర్క్ మరియు ఫంక్షన్ కాలింగ్ |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | అధ్యాయం 8 | ⭐⭐⭐ | ఎంటరప్రైజ్ AI ఆర్కెస్ట్రేషన్ |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | అధ్యాయం 5 | ⭐⭐⭐⭐ | కస్టమర్ మరియు ఇన్వెంటరీ ఏజెంట్లతో బహుళ-ఏజెంట్ ఆర్కిటెక్చర్ |

### నమూనాల ద్వారా నేర్చుకోవడం

> **📌 స్థానిక vs. బాహ్య ఉదాహరణలు:**  
> **స్థానిక ఉదాహరణలు** (ఈ రిపోలో) = వెంటనే ఉపయోగించడానికి సిద్ధంగా ఉన్నవి  
> **బాహ్య ఉదాహరణలు** (Azure Samples) = లింకుల వారీగా ఉన్న రిపోలను క్లోన్ చేయండి

#### స్థానిక ఉదాహరణలు (తక్షణం ఉపయోగానికి సిద్ధం)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARM టెంప్లేట్లు తో పూర్తిగా ప్రొడక్షన్-రెడి అమలు
  - బహుళ-ఏజెంట్ ఆర్కిటెక్చర్ (Customer + Inventory ఏజెంట్లు)
  - సమగ్ర మానిటరింగ్ మరియు మూల్యాంకనం
  - ARM టెంప్లేట్ ద్వారా ఒక క్లిక్ డిప్లాయ్‌మెంట్

#### స్థానిక ఉదాహరణలు - కంటైనర్ అప్లికేషన్లు (అధ్యాయాలు 2-5)
**ఈ రిపోలో పూర్తి కంటైనర్ డిప్లాయ్‌మెంట్ ఉదాహరణలు:**
- [**Container App Examples**](examples/container-app/README.md) - కంటైనరైజ్డ్ డిప్లాయ్‌మెంట్లకు పూర్తి గైడ్
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - scale-to-zero తో బేసిక్ REST API
  - [Microservices Architecture](../../examples/container-app/microservices) - ప్రొడక్షన్-రెడి బహుళ-సేవల డిప్లాయ్‌మెంట్
  - క్విక్ స్టార్ట్, ప్రొడక్షన్ మరియు అడ్వాన్స్‌డ్ డిప్లాయ్‌మెంట్ ప్యాటర్న్లు
  - మానిటరింగ్, సెక్యూరిటీ మరియు ఖర్చు ఆప్టిమైజేషన్ మార్గదర్శనం

#### బాహ్య ఉదాహరణలు - సాదా అప్లికేషన్లు (అధ్యాయాలు 1-2)
**ప్రారంభించడానికి ఈ Azure Samples రిపోలను క్లోన్ చేయండి:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - బేసిక్ డిప్లాయ్‌మెంట్ ప్యాటర్న్లు
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - స్థిర విషయాల డిప్లాయ్‌మెంట్
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API డిప్లాయ్‌మెంట్

#### బాహ్య ఉదాహరణలు - డేటాబేస్ ఇంటిగ్రేషన్ (అధ్యాయాలు 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - డేటాబేస్ కనెక్టివిటీ ప్యాటర్న్లు
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - సర్వర్‌లెస్ డేటా వర్క్‌ఫ్లో

#### బాహ్య ఉదాహరణలు - అడ్వాన్స్‌డ్ ప్యాటర్న్లు (అధ్యాయాలు 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - బహుళ-సేవ ఆర్కిటెక్చర్లు
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - బ్యాక్గ్రౌండ్ ప్రాసెసింగ్  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - ప్రొడక్షన్-రెడి ML ప్యాటర్న్లు

### బాహ్య టెంప్లేట్ సేకరణలు
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - అధికారిక మరియు కమ్యూనిటీ టెంప్లేట్ల యొక్క శ్రేణి
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn టెంప్లేట్ డాక్యుమెంటేషన్
- [**Examples Directory**](examples/README.md) - స్థానిక నేర్చుకునే ఉదాహరణలు, విపుల వివరణలతో

---

## 📚 నేర్చుకునే వనరులు & సూచనలు

### సంక్షిప్త సూచనలు
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - అధ్యాయాల వారీగా ఏర్పాటు చేయబడిన అవసరమైన azd కమాండ్లు
- [**Glossary**](resources/glossary.md) - Azure మరియు azd పరిపాఠ్య పదజాలం  
- [**FAQ**](resources/faq.md) - తరచుగా అడిగే ప్రశ్నలు అధ్యాయాల వారీగా
- [**Study Guide**](resources/study-guide.md) - విస్తృత ప్రాక్టీస్ వ్యాయామాలు

### ప్రాక్టికల్ వర్క్‌షాపులు
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - మీ AI పరిష్కారాలను AZD-డిప్లాయబుల్ చేయండి (2-3 గంటలు)
- [**Interactive Workshop**](workshop/README.md) - MkDocs మరియు GitHub Codespaces తో 8-మాడ్యూల్ మార్గనిర్దేశిత వ్యాయామాలు
  - అనుసరిస్తుంది: పరిచయం → ఎంపిక → ధృవీకరణ → విభజన → కాన్ఫిగరేషన్ → అనుకూలీకరణ → తొలగింపు → సమీక్ష

### బాహ్య అధ్యయన వనరులు
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 త్వరిత సమస్య పరిష్కార మార్గదర్శకం

ప్రారంభకులు ఎదుర్కొనే సాధారణ సమస్యలు మరియు తక్షణ పరిష్కారాలు:

<details>
<summary><strong>❌ "azd: కమాండ్ కనుగొనబడలేదు"</strong></summary>

```bash
# ముందుగా AZD ని ఇన్‌స్టాల్ చేయండి
# Windows (పవర్‌షెల్):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# సంస్థాపనను ధృవీకరించండి
azd version
```
</details>

<details>
<summary><strong>❌ "Subscription లభించలేదు" లేదా "Subscription సెటైడ్ లేదు"</strong></summary>

```bash
# ఉపలభ్యమైన సబ్‌స్క్రిప్షన్లను జాబితా చేయండి
az account list --output table

# డిఫాల్ట్ సబ్‌స్క్రిప్షన్‌ను సెట్ చేయండి
az account set --subscription "<subscription-id-or-name>"

# AZD పర్యావరణం కోసం సెట్ చేయండి
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# నిర్ధారించండి
az account show
```
</details>
<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# వేరే Azure ప్రాంతాన్ని ప్రయత్నించండి
azd env set AZURE_LOCATION "westus2"
azd up

# లేదా డెవలప్‌మెంట్‌లో చిన్న SKUsను ఉపయోగించండి
# infra/main.parameters.jsonని సవరించండి:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" మధ్యలో విఫలమవుతుంది</strong></summary>

```bash
# ఎంపిక 1: శుభ్రం చేసి మళ్లీ ప్రయత్నించండి
azd down --force --purge
azd up

# ఎంపిక 2: కేవలం మౌలిక సదుపాయాలను సరి చేయండి
azd provision

# ఎంపిక 3: వివరమైన స్థితిని తనిఖీ చేయండి
azd show

# ఎంపిక 4: Azure Monitorలో లాగ్‌లను తనిఖీ చేయండి
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# మళ్లీ ధృవీకరించండి
az logout
az login

azd auth logout
azd auth login

# ప్రామాణీకరణను ధృవీకరించండి
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" లేదా పేరుల ఘర్షణలు</strong></summary>

```bash
# AZD ప్రత్యేకమైన పేర్లను సృష్టిస్తుంది, కానీ ఘర్షణ ఉన్నట్లయితే:
azd down --force --purge

# తర్వాత కొత్త పరిసరంతో మళ్లీ ప్రయత్నించండి
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ టెంప్లేట్ పంపిణీకి చాలా సమయం పడుకుపోతుంది</strong></summary>

**సాధారణ వేచి ఉండే సమయాలు:**
- సాదా వెబ్ యాప్: 5-10 నిమిషాలు
- డేటాబేస్‌తో కూడిన యాప్: 10-15 నిమిషాలు
- ఎఐ అప్లికేషన్లు: 15-25 నిమిషాలు (OpenAI ప్రొవిజనింగ్ నెమ్మదిగా ఉంటుంది)

```bash
# ప్రగతిని తనిఖీ చేయండి
azd show

# 30 నిమిషాలకంటే ఎక్కువ కాలం చిక్కిపోతే, Azure పోర్టల్‌ను తనిఖీ చేయండి:
azd monitor
# విఫలమైన డిప్లాయ్‌మెంట్లను చూడండి
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# మీ Azure పాత్రను తనిఖీ చేయండి
az role assignment list --assignee $(az account show --query user.name -o tsv)

# కనీసం "Contributor" పాత్ర అవసరం
# మీ Azure అడ్మిన్‌ను ఈ పాత్రలు ఇవ్వమని అడగండి:
# - Contributor (వనరుల కోసం)
# - User Access Administrator (పాత్ర కేటాయింపుల కోసం)
```
</details>

<details>
<summary><strong>❌ పంపిణీ చేసిన అప్లికేషన్ URL ను కనుగొనలేరు</strong></summary>

```bash
# అన్ని సర్వీస్ ఎండ్‌పాయింట్‌లను చూపించండి
azd show

# లేదా Azure పోర్టల్‌ను తెరవండి
azd monitor

# నిర్దిష్ట సర్వీస్‌ను తనిఖీ చేయండి
azd env get-values
# *_URL వేరియబుల్‌ల కోసం చూడండి
```
</details>

### 📚 పూర్తి సమస్య పరిష్కరణ వనరులు

- **సాధారణ సమస్యల గైడ్:** [వివరమైన పరిష్కారాలు](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-స్పెసిఫిక్ సమస్యలు:** [AI సమస్య పరిష్కారం](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **డీబగ్గింగ్ గైడ్:** [దశలవారీ డీబగ్గింగ్](docs/chapter-07-troubleshooting/debugging.md)
- **సహాయం పొందండి:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 కోర్సు పూర్తి & సర్టిఫికేషన్

### పురోగతి ట్రాకింగ్
ప్రతి అధ్యాయానుసారం మీ అభ్యాస పురోగతిని ట్రాక్ చేయండి:

- [ ] **Chapter 1**: ప్రాథమికాలు & త్వరిత ప్రారంభం ✅
- [ ] **Chapter 2**: AI-ముఖ్యమైన అభివృద్ధి ✅  
- [ ] **Chapter 3**: కాన్ఫిగరేషన్ & ప్రామాణీకరణ ✅
- [ ] **Chapter 4**: కోడ్‌గా ఇన్‌ఫ్రాస్ట్రక్చర్ & డిప్లాయ్‌మెంట్ ✅
- [ ] **Chapter 5**: బహుళ-ఏజెంట్ AI పరిష్కారాలు ✅
- [ ] **Chapter 6**: పూర్వ-డిప్లాయ్‌మెంట్ ధృవీకరణ & ప్రణాళిక ✅
- [ ] **Chapter 7**: సమస్య పరిష్కారం & డీబగ్గింగ్ ✅
- [ ] **Chapter 8**: ఉత్పత్తి & ఎంటర్ప్రైజ్ నమూనాలు ✅

### నేర్చినదిని ధృవీకరణ
ప్రతి అధ్యాయం పూర్తి చేసిన తర్వాత, మీ జ్ఞానాన్ని ఈ విధంగా ధృవీకరించండి:
1. **ప్రాక్టికల్ అభ్యాసం**: అధ్యాయం యొక్క హ్యాండ్స్-ఆన్ డిప్లాయ్‌మెంట్‌ను పూర్తి చేయండి
2. **జ్ఞాన పరీక్ష**: మీ అధ్యాయానికి సంబంధించిన FAQ విభాగాన్ని పరిశీలించండి
3. **కమ్యూనిటీ చర్చ**: మీ అనుభవాన్ని Azure Discordలో పంచుకోండి
4. **తరువాత అధ్యాయం**: తదుపరి సంక్లిష్టత స్థాయికి మారండి

### కోర్స్ పూర్తి చేసినపుడు లభించే ప్రయోజనాలు
అన్ని అధ్యాయాలను పూర్తిచేస్తే, మీకు ఇవి లభిస్తాయి:
- **ప్రొడక్షన్ అనుభవం**: వాస్తవ AI అప్లికేషన్లను Azureలో డిప్లాయ్ చేయడం
- **వృత్తిపరమైన నైపుణ్యాలు**: ఎంటర్‌ప్రైజ్-తయారైన డిప్లాయ్‌మెంట్ సామర్థ్యాలు  
- **కమ్యూనిటీ గుర్తింపు**: Azure డెవలపర్ కమ్యూనిటీలో చురుకైన సభ్యుడు
- **కారియర్ పురోగతి**: డిమాండ్ ఉన్న AZD మరియు AI డిప్లాయ్‌మెంట్ నైపుణ్యాలు

---

## 🤝 కమ్యూనిటీ & మద్దతు

### సహాయం & మద్దతు పొందండి
- **టెక్నికల్ సమస్యలు:** [బగ్స్ నివేదించండి మరియు ఫీచర్లు అభ్యర్థించండి](https://github.com/microsoft/azd-for-beginners/issues)
- **అభ్యాస ప్రశ్నలు:** [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-స్పెసిఫిక్ సహాయం:** Join the [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **డాక్యుమెంటేషన్:** [అధికారిక Azure Developer CLI డాక్యుమెంటేషన్](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord నుండి కమ్యూనిటీ అవగాహనలు

**#Azure చానెల్ నుంచి తాజా పోల్ల ఫలితాలు:**
- **45%** డెవలపర్లు AZDను AI వర్క్‌లోడ్స్ కోసం ఉపయోగించాలనుకుంటున్నారు
- **ప్రధాన సవాళ్లు:** బహు-సేవ డిప్లాయ్‌మెంట్లు, క్రెడెన్షియల్ నిర్వహణ, ఉత్పత్తి సిద్ధత  
- **అత్యధికంగా కోరినవి:** AI-స్పెసిఫిక్ టెంప్లేట్స్, సమస్య పరిష్కరణ గైడ్లు, ఉత్తమ చర్యలు

**మా కమ్యూనిటీకి చేరండి మరియు:**
- మీ AZD + AI అనుభవాలను పంచుకుని సహాయం పొందండి
- కొత్త AI టెంప్లేట్స్ యొక్క ప్రారంభ ప్రివ్యూలకు ప్రాప్తి పొందండి
- AI డిప్లాయ్‌మెంట్ ఉత్తమ పద్ధతులకు చొరవ చూపండి
- భవిష్యత్తు AI + AZD ఫీచర్ అభివృద్ధిపై ప్రభావం చూపండి

### కోర్సుకు సహకారం
మేము సహకారాలను స్వాగతిస్తాం! వివరాలకు దయచేసి మా [Contributing Guide](CONTRIBUTING.md) ను చదవండి:
- **కంటెంట్ మెరుగుదలలు:** ఉన్న అధ్యాయాలు మరియు ఉదాహరణలను మెరుగుపరచండి
- **కొత్త ఉదాహరణలు:** వాస్తవ ప్రపంచ పరిస్థితులు మరియు టెంప్లేట్స్ జోడించండి  
- **అనువాదం:** బహుభాషా మద్దతును నిర్వహించడంలో సహాయపడండి
- **బగ్ నివేదికలు:** ఖచ్చితత్వం మరియు స్పష్టతను మెరుగు పరచండి
- **కమ్యూనిటీ ప్రమాణాలు:** మా సమగ్ర కమ్యూనిటీ మార్గదర్శకాలను అనుసరించండి

---

## 📄 కోర్స్ సమాచారం

### లైసెన్స్
ఈ ప్రాజెక్ట్ MIT లైసెన్స్ లో లైసెన్స్ చేయబడింది - వివరాలకు [LICENSE](../../LICENSE) ఫైల్ చూడండి.

### సంబంధిత Microsoft నేర్చుకోవల్ వనరులు

మా టీమ్ ఇతర విస్తృత శిక్షణ కోర్సులను ఉత్పత్తి చేస్తుంది:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Core Learning
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Series
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ పాఠ్యక్రమ మార్గదర్శనం

**🚀 నేర్చుకోవడం ప్రారంభించడానికి సిద్ధంగా ఉన్నారా?**

**ప్రారంభికులు**: దీనితో ప్రారంభించండి [అధ్యాయం 1: మౌలికం & త్వరిత ప్రారంభం](../..)  
**AI అభివృద్ధిదారులు**: నేరుగా [అధ్యాయం 2: AI-ప్రధాన అభివృద్ధి](../..)  
**అనుభవం గల అభివృద్ధిదారులు**: దీనితో మొదలు పెట్టండి [అధ్యాయం 3: కాన్ఫిగరేషన్ & ఆథెంటికేషన్](../..)

**తరువాతి దశలు**: [అధ్యాయం 1 ప్రారంభించండి - AZD బేసిక్స్](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
బాధ్యతారహిత ప్రకటన:
ఈ పత్రాన్ని AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. ఖచ్చితత్వానికి మేము శ్రమించినప్పటికీ, ఆటోమేటెడ్ అనువాదాల్లో లోపాలు లేదా అపసమజ్ఞతలు ఉండే అవకాశం ఉందని దయచేసి గమనించండి. స్థానిక భాషలో ఉన్న మూల పత్రాన్ని అధికారిక మూలంగా పరిగణించాలి. కీలక సమాచారం కోసం వృత్తిపరమైన మనవ ప్రయోగ అనువాదకుని ద్వారా అనువాదం చేయించుకోవడం సూచించబడుతుంది. ఈ అనువాదం వాడిన ఫలితంగా ఏవైనా అవగాహనలో పొరపాట్లు లేదా తప్పుడు అర్థాలు వచ్చినట్లయితే మేము వాటికి బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->