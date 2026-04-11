# AZD ప్రారంభికుల కోసం: నిర్మిత అభ్యాస ప్రయాణం

![AZD-ప్రారంభికులకు](../../translated_images/te/azdbeginners.5527441dd9f74068.webp) 

[![GitHub వాచ్‌లు](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub ఫార్క్‌లు](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub స్టార్‌లు](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure డిస్కార్డ్](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry డిస్కార్డ్](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### ఆటోమేటెడ్ అనువాదాలు (ఎప్పుడూ తాజా)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[అరబిక్](../ar/README.md) | [బెంగాలీ](../bn/README.md) | [బుల్గేరియన్](../bg/README.md) | [బర్మీస్ (మయన్మార్)](../my/README.md) | [చైనా (సరళీకృత)](../zh-CN/README.md) | [చైనా (సాంప్రదాయ, హాంకాంగ్)](../zh-HK/README.md) | [చైనా (సాంప్రదాయ, మకావో)](../zh-MO/README.md) | [చైనా (సాంప్రదాయ, తైవాన్)](../zh-TW/README.md) | [క్రోయేషియన్](../hr/README.md) | [చెక్](../cs/README.md) | [డానిష్](../da/README.md) | [డచ్](../nl/README.md) | [ఎస్టోనియన్](../et/README.md) | [ఫిన్నిష్](../fi/README.md) | [ఫ్రెంచ్](../fr/README.md) | [జర్మన్](../de/README.md) | [గ్రీక్](../el/README.md) | [హీబ్రూ](../he/README.md) | [హిందీ](../hi/README.md) | [హంగేరియన్](../hu/README.md) | [ఇండోనేషియన్](../id/README.md) | [ఇటాలియన్](../it/README.md) | [జపనీస్](../ja/README.md) | [కన్నడ](../kn/README.md) | [ఖ్మేర్](../km/README.md) | [కొరియన్](../ko/README.md) | [లిథువేనియన్](../lt/README.md) | [మలయ్](../ms/README.md) | [మలయాళం](../ml/README.md) | [మరాఠీ](../mr/README.md) | [నేపాలి](../ne/README.md) | [నైజీరియన్ పిడ్గిన్](../pcm/README.md) | [నార్వేజియన్](../no/README.md) | [పర్షియన్ (ఫార్సీ)](../fa/README.md) | [పోలిష్](../pl/README.md) | [పోర్చుగీస్ (బ్రెజిల్)](../pt-BR/README.md) | [పోర్చుగీస్ (పోర్చుగల్)](../pt-PT/README.md) | [పంజాబీ (గుర్ముఖి)](../pa/README.md) | [రోమానియన్](../ro/README.md) | [రష్యన్](../ru/README.md) | [సెర్బియన్ (సిరిలిక్)](../sr/README.md) | [స్లోవాక్](../sk/README.md) | [స్లోవేనియన్](../sl/README.md) | [స్పానిష్](../es/README.md) | [స్వాహిలి](../sw/README.md) | [స్వీడిష్](../sv/README.md) | [తగలోగ్ (ఫిలిపీనో)](../tl/README.md) | [తమిళ్](../ta/README.md) | [తెలుగు](./README.md) | [థాయ్](../th/README.md) | [టర్కిష్](../tr/README.md) | [ఉక్రేనియన్](../uk/README.md) | [ఉర్దూ](../ur/README.md) | [వియత్నామీస్](../vi/README.md)

> **స్థానికంగా క్లోన్ చేయాలనుకుంటున్నారా?**
>
> ఈ రిపోజిటరీలో 50+ భాషా అనువాదాలు ఉన్నాయి, ఇవి డౌన్లోడ్ పరిమాణం పెంచవచ్చు. అనువాదాలు లేకుండా క్లోన్ చేయడానికి sparse checkout ఉపయోగించండి:
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
> ఇది కోర్సు పూర్తిచేసేందుకు మీకు అవసరమైన ప్రతిదాన్ని తక్కువ డౌన్లోడ్‌తో ఇస్తుంది.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 azdలో నేడు有什么 కొత్తం

Azure Developer CLI సంప్రదాయ వెబ్ యాప్స్ మరియు APIs ని దాటి పెరిగింది. ఇప్పుడు, azd ఒక్కే టూల్ గానే ఉంది ఏదైనా అప్లికేషన్‌ను Azureకు desple చేయడానికి—AI-శక్తితో కూడిన అప్లికేషన్లు మరియు ఇంటెలిజెంట్ ఏజెంట్లతో సహా.

ఇదిగో మీ కోసం అంటే ఏమిటి:

- **AI ఏజెంట్లు ఇప్పుడు azdలో మొదటి స్థాయి వర్క్‌లోడ్‌లు.** మీరు ఇప్పటికే తెలుసుకున్న అదే `azd init` → `azd up` వర్క్‌ఫ్లోతో AI ఏజెంట్ ప్రాజెక్టులను ఆరంభించగలరు, desple చేయగలరు మరియు నిర్వహించగలరు.
- **Microsoft Foundry ఇంటిగ్రేషన్** మోడల్ desple, ఏజెంట్ హోస్టింగ్, మరియు AI సేవ కాన్ఫిగరేషన్‌ను నేరుగా azd టెంప్లేట్ ఎకోసిస్టంలోకి తీసుకువస్తుంది.
- **కోర్ వర్క్‌ఫ్లో మారలేదు.** మీరు todo యాప్, మైక్రోసర్వీస్, లేదా మల్టీ-ఏజెంట్ AI సొల్యూషన్ desple చేస్తున్నా, కమాండ్లు ఒకటే.

మీరు ముందుగా azd వాడి ఉంటే, AI మద్దతు సహజవికాసం—వేరొక టూల్ కాదు లేదా ప్రావీణ్యత ట్రాక్ కాదు. మీరు కొత్తగా మొదలెడితే, ఒక్క వర్క్‌ఫ్లో నేర్చుకుంటారు అది ప్రతిదీ కోసం పని చేస్తుంది.

---

## 🚀 Azure Developer CLI (azd) అంటే ఏమిటి?

**Azure Developer CLI (azd)** ఒక డెవలపర్-స్నేహపూర్వక కమాండ్-లైన్ టూల్, ఇది Azureకి అప్లికేషన్లను desple చేయడం సులభతరం చేస్తుంది. పద్దతిగా అనేక Azure వనరులను ידניתగా సృష్టించడం మరియు కనెక్ట్ చేయడం బదులు, మీరు ఒకే కమాండ్‌తో మొత్తం అప్లికేషన్లను desple చేయగలరు.

### `azd up` యొక్క మాంత్రికత

```bash
# ఈ సింగిల్ కమాండ్ అన్ని చేస్తుంది:
# ✅ అన్ని Azure వనరులను సృష్టిస్తుంది
# ✅ నెట్‌వర్కింగ్ మరియు సెక్యూరిటీని కింnఫిగర్ చేస్తుంది
# ✅ మీ అప్లికేషన్ కోడ్‌ను నిర్మిస్తుంది
# ✅ Azure కు డిప్లాయ్ చేస్తుంది
# ✅ మీకు పని చేసే URL ఇస్తుంది
azd up
```

**ఈ ఉన్నది!** Azure పోర్టల్‌పై క్లిక్ చేయాల్సిన అవసరం లేదు, క్లిష్టమైన ARM టెంప్లేట్లను ముందుగా నేర్చుకోవాల్సిన అవసరం లేదు, మాన్యువల్ కాన్ఫిగరేషన్ లేదు - కేవలం పని చేసే అప్లికేషన్లు Azureలో.

---

## ❓ Azure Developer CLI వర్సెస్ Azure CLI: తేడా ఏమిటి?

ఇది ప్రారంభికులు అడిగే అత్యంత సాధారణ ప్రశ్న. ఇక్కడ సులభమైన సమాధానం ఉంది:

| ఫీచర్ | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **ఉద్దేశ్యం** | వ్యక్తిగత Azure వనరులను నిర్వహించడానికి | పూర్తి అప్లికేషన్లను desple చేయడానికి |
| **మైండ్‌సెట్** | ఇన్ఫ్రాస్ట్రక్చర్-కేంద్రీకృతం | అప్లికేషన్-కేంద్రీకృతం |
| **ఉదాహరణ** | `az webapp create --name myapp...` | `azd up` |
| **అధ్యయన వక్రత** | Azure సేవలను తెలుసుకోవాలి | మీ యాప్‌ను మాత్రమే తెలుసుకోండి |
| **ఉత్తమంగా ఎవరికీ** | DevOps, ఇన్ఫ్రాస్ట్రక్చర్ | డెవలపర్లు, ప్రోటోటైపింగ్ |

### సులభమైన ఉపమానం

- **Azure CLI** కి సంబంధించినది ఇంటి నిర్మాణానికి అవసరమైన అన్ని సాధనాలను కలిగి ఉండటంలాంటిది — హామర్లు, పరికరాలు, నళ్లు. మీరు ఏదైనా నిర్మించవచ్చు, కానీ నిర్మాణం గురించి తెలుసుకోవాలి.
- **Azure Developer CLI** ఒక కాంట్రాక్టర్‌ను నియమించడం లాంటిది — మీరు మీరు కోరుకున్నదాన్ని వివరిస్తారు, వారు నిర్మాణాన్ని చూసుకుంటారు.

### ప్రతిదిని ఎప్పుడు ఉపయోగించాలి

| సన్నివేశం | ఇది ఉపయోగించండి |
|----------|----------|
| "నేను నా వెబ్ యాప్‌ను వేగంగా డిప్లాయ్ చేయాలనుకుంటున్నాను" | `azd up` |
| "నాకు కేవలం ఒక స్టోరేజ్ అకౌంట్ సృష్టించాల్సి ఉంది" | `az storage account create` |
| "నేను పూర్తి AI అప్లికేషన్ నిర్మిస్తున్నాను" | `azd init --template azure-search-openai-demo` |
| "నాకు ఒక నిర్దిష్ట Azure వనరును డీబగ్ చేయాలి" | `az resource show` |
| "నాకు నిమిషాల్లో ప్రొడక్షన్-సిద్ధంగా డిప్లాయ్ కావాలి" | `azd up --environment production` |

### అవి కలిసి పనిచేస్తాయి!

AZD క్రిందచూపున Azure CLI ని ఉపయోగిస్తుంది. మీరు రెండింటినీ ఉపయోగించవచ్చు:
```bash
# మీ యాప్‌ను AZD తో పంపిణీ చేయండి
azd up

# తరువాత Azure CLI తో నిర్దిష్ట వనరులను సరిగ్గా సర్దుబాటు చేయండి
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZDలో టెంప్లెట్‌లు కనుగొనండి

శూన్యంనుండి ప్రారంభించొద్దు! **Awesome AZD** మందలిలో సిద్ధంగా desple చేయడానికి టెంప్లెట్ల సమాహారం ఉంది:

| రీసోర్స్ | వివరణ |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | ఒక క్లిక్ డిప్లాయ్‌తో 200+ టెంప్లెట్లును బ్రౌజ్ చేయండి |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | మీ స్వంత టెంప్లేట్‌ను కమ్యూనిటికి కాంట్రిబ్యూట్ చేయండి |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | స్టార్ చేయండి మరియు సోర్స్‌ను ఎక్స్‌ప్లోర్ చేయండి |

### Awesome AZD నుండి ప్రజాదరణ ఉన్న AI టెంప్లెట్స్

```bash
# Microsoft Foundry మోడల్స్ + AI శోధనతో RAG చాట్
azd init --template azure-search-openai-demo

# త్వరిత AI చాట్ అనువర్తనం
azd init --template openai-chat-app-quickstart

# Foundry ఏజెంట్లతో AI ఏజెంట్లు
azd init --template get-started-with-ai-agents
```

---

## 🎯 3 స్టెప్స్‌లో ప్రారంభించండి

ముందుగా ప్రారంభించేముందు, మీరు desple చేయదలచిన టెంప్లేట్ కోసం మీ మెషీన్ రెడీగా ఉందా తెలుసుకోండి:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

ఏదైనా అవసరమైన చెక్ ఫెయిల్ అయితే, ముందుగా దాన్ని సరిచేసి ఆ తర్వాత తక్షణ ప్రారంభంతో కొనసాగండి.

### స్టెప్ 1: AZD ను ఇన్‌స్టాల్ చేయండి (2 నిమిషాలు)

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

### స్టెప్ 2: AZD కోసం ఆథెంటికేట్ చేయండి

```bash
# ఈ కోర్సులో నేరుగా Azure CLI ఆదేశాలను ఉపయోగించాలనుకుంటే ఐచ్ఛికం
az login

# AZD వర్క్‌ఫ్లోల కోసం అవసరం
azd auth login
```

మీకు ఏది అవసరమో అనిశ్చితి ఉంటే, [ఇన్‌స్టాలేషన్ & సెటప్](docs/chapter-01-foundation/installation.md#authentication-setup) లో పూర్తి సెటప్ ఫ్లోని అనుసరించండి.

### స్టెప్ 3: మీ మొదటి యాప్‌ను డిప్లాయ్ చేయండి

```bash
# ఒక టెంప్లేట్ నుండి ప్రారంభించండి
azd init --template todo-nodejs-mongo

# అజ్యూర్‌కు పర్యవేక్షించండి (అన్నింటిని సృష్టిస్తుంది!)
azd up
```

**🎉 అన్ని సిద్ధమైంది!** మీ యాప్ ఇప్పుడు Azureలో లైవ్ అయింది.

### శుభ్రపరచడం (మర్చిపోకండి!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 ఈ కోర్సును ఎలా ఉపయోగించాలి

ఈ కోర్స్ **ప్రోగ్రెసివ్ లెర్నింగ్** కోసం రూపొందించబడింది - మీరు సుఖంగా ఉన్న స్థానం నుండి ప్రారంభించి క్రమంగా ముందుకు పోవండి:

| మీ అనుభవం | ఇక్కడ ప్రారంభించండి |
|-----------------|------------|
| **Azureకి కొత్తవారు** | [అధ్యాయము 1: ఫౌండేషన్](#-chapter-1-foundation--quick-start) |
| **Azure తెలుసు, AZDకి కొత్త** | [అధ్యాయము 1: ఫౌండేషన్](#-chapter-1-foundation--quick-start) |
| **AI యాప్స్‌ను desple చేయాలనుకుంటున్నారు** | [అధ్యాయము 2: AI-ఫస్ట్ డెవలప్మెంట్](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **హ్యాండ్-ఓన్ అభ్యాసం కావాలి** | [🎓 ఇంటరాక్టివ్ వర్క్‌షాప్](workshop/README.md) - 3-4 గంటల గైడెడ్ ల్యాబ్ |
| **ప్రొడక్షన్ ప్యాటర్న్స్ అవసరం** | [అధ్యాయము 8: ప్రొడక్షన్ & ఎంటర్‌ప్రైజ్](#-chapter-8-production--enterprise-patterns) |

### తక్షణ సెటప్

1. **ఈ రిపోజిటరీని ఫోర్క్ చేయండి**: [![GitHub ఫార్క్‌లు](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **క్లోన్ చేయండి**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **సహాయం పొందండి**: [Azure డిస్కార్డ్ కమ్యూనిటీ](https://discord.com/invite/ByRwuEEgH4)

> **స్థానికంగా క్లోన్ చేయాలనుకుంటున్నారా?**
>
> ఈ రిపోజిటరీలో 50+ భాషా అనువాదాలు కలిగి ఉండటం డౌన్లోడ్ పరిమాణాన్ని గణనీయంగా పెంచుతుంది. అనువాదాలు లేకుండా క్లోన్ చేయడానికి sparse checkout ఉపయోగించండి:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> ఇది కోర్సు పూర్తిచేయడానికి మీకు అవసరమైన ప్రతిదాన్ని తక్కువ డౌన్లోడ్‌తో ఇస్తుంది.


## కోర్సు అవలోకనం

నిర్మిత అధ్యాయాల ద్వారా Azure Developer CLI (azd) ని ప్రావీణ్యం పొందండి. **Microsoft Foundry ఇంటిగ్రేషన్ ద్వారా AI అప్లికేషన్ desple పై ప్రత్యేక దృష్టి.**

### ఆధునిక డెవలపర్లకు ఈ కోర్స్ ఎందుకు అవసరం

Microsoft Foundry Discord కమ్యూనిటీ ఇన్సైట్స్ ఆధారంగా, **డెవలపర్లలో 45% AZDని AI పనులకు ఉపయోగించదలుచుకుంటున్నారు** కానీ వారిని బారిపోయే సవాళ్లు ఎదురవుతున్నాయి:
- క్లిష్టమైన బహు-సేవా AI ఆర్కిటెక్చర్లు
- ప్రొడక్షన్ AI desple బెస్టు ప్రాక్టీసులు  
- Azure AI సేవ ఇంటిగ్రేషన్ మరియు కాన్ఫిగరేషన్
- AI పనుల కోసం ఖర్చు ఆప్టిమైజేషన్
- AI-స్పెసిఫిక్ desple సమస్యల ట్రబుల్షూటింగ్

### అభ్యాస లక్ష్యాలు

ఈ నిర్మిత కోర్స్ పూర్తి చేసిన తర్వాత, మీరు:
- **AZD మౌలికాలను ఆహంపరచండి**: కోర్ కాన్సెప్ట్‌లు, ఇన్‌స్టాలేషన్, మరియు కాన్ఫిగరేషన్
- **AI అప్లికేషన్లను desple చేయండి**: AZD ను Microsoft Foundry సేవలతో ఉపయోగించండి
- **ఇన్ఫ్రాస్ట్రక్చర్ యజ్ కోడ్ గా అమలు చేయండి**: Bicep టెంప్లేట్స్ తో Azure వనరులను నిర్వహించండి
- **డిప్లాయ్‌మెంట్‌లను ట్రబుల్షూట్ చేయండి**: సాధారణ సమస్యలను పరిష్కరించండి మరియు బగ్‌లను డీబగ్ చేయండి
- **ప్రొడక్షన్ కోసం ఆప్టిమైజ్ చేయండి**: భద్రత, స్కేలింగ్, మానిటరింగ్, మరియు ఖర్చు నిర్వహణ
- **బహు-ఏజెంట్ సొల్యూషన్లు నిర్మించండి**: సంక్లిష్ట AI ఆర్కిటెక్చర్లను desple చేయండి

## ప్రారంభించేముందు: ఖాతాలు, యాక్సెస్, మరియు భావించవలసిన అంశాలు

చాప్టర్ 1 ప్రారంభించే ముందే, క్రిందివి మీ వద్ద ఉన్నాయో లేదో నిర్ధారించుకోండి. ఈ గైడ్‌లోని ఇన్‌స్టాలేషన్ దశలు ఈ ప్రాథమిక విషయాలు ఇప్పటికే నిర్వహించబడ్డాయని ఊహిస్తాయి.
- **ఒక Azure సబ్‌స్క్రిప్షన్**: మీరు పనిస్థలం లేదా మీ వ్యక్తిగత ఖాతాలో ఉన్న సబ్‌స్క్రిప్షన్‌ని ఉపయోగించవచ్చు, లేదా ప్రారంభానికి [ఉచిత ట్రయల్](https://aka.ms/azurefreetrial) సృష్టించండి.
- **Azure వనరులు సృష్టించే అనుమతి**: చాలా వ్యాయామాల కోసం, లక్ష్య సబ్‌స్క్రిప్షన్ లేదా రిసోర్స్ గ్రూప్‌పై కనీసం **Contributor** యాక్సెస్ ఉండాలి. కొన్ని అధ్యాయాలు మీరు రిసోర్స్ గ్రూప్‌లు, managed identities, మరియు RBAC అసైన్మెంట్లను సృష్టించగలరని కూడా ఊహించవచ్చు.
- [**GitHub ఖాతా**](https://github.com): రిపోజిటరీని ఫార్క్ చేయడానికి, మీ స్వంత మార్పులను ట్రాక్ చేయడానికి, మరియు వర్క్షాప్ కోసం GitHub Codespaces ఉపయోగించడానికి ఇది ఉపయోగకరం.
- **టెంప్లేట్ రన్‌టైమ్ ముందస్తు అవసరాలు**: కొన్ని టెంప్లేట్లు స్థానిక టూల్స్ (Node.js, Python, Java, లేదా Docker) ను అవసరం చేసుకుంటాయి. ప్రారంభించే ముందు setup validator ను నడపండి ताकि మీరు మిస్సింగ్ టూల్స్‌ను ముందే గుర్తించగలుగుతారు.
- **బేసిక్ టెర్మినల్ పరిచయం**: మీరు నిపుణుడు కావాల్సిన అవసరం లేదు, కానీ `git clone`, `azd auth login`, మరియు `azd up` వంటి కమాండ్లు నడపటంలో సౌకర్యంగా ఉండాలి.

> **ఎంటర్ప్రైజ్ సబ్‌స్క్రిప్షన్‌లో పనిచేస్తున్నారా?**
> మీ Azure పరిసరాలు ఒక అడ్మినిస్ట్రేటర్ చేత నిర్వహించబడుతున్నట్లయితే, మీరు ఉపయోగించబోయే సబ్‌స్క್ರిప్షన్ లేదా రిసోర్స్ గ్రూప్‌లో వనరులను డిప్లాయ్ చేయగలరని ముందుగా ధృవీకరించండి. చేయలేకపోతే, ప్రారంభించే ముందు ఒక సాండ్‌బాక్స్ సబ్‌స్క్రిప్షన్ లేదా Contributor యాక్సెస్ కోరండి.

> **Azure లో కొత్తవారా?**
> మీ స్వంత Azure ట్రయల్ లేదా pay-as-you-go సబ్‌స్క్రిప్షన్‌తో https://aka.ms/azurefreetrial ప్రారంభించండి, తద్వారా టెనెంట్ స్థాయి ఆమోదాల కోసం వేచి ఉండకుండా మీరు వ్యాయామాలు పూర్తిచేసుకోవచ్చు.

## 🗺️ కోర్సు మ్యాప్: అధ్యాయాల వారీగా త్వరిత నావిగేషన్

Each chapter has a dedicated README with learning objectives, quick starts, and exercises:

| అధ్యాయం | విషయం | పాఠాలు | కాలవ్యవధి | సంక్లిష్టత |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | ప్రారంభం | [AZD ప్రాథమికాంశాలు](docs/chapter-01-foundation/azd-basics.md) &#124; [ఇన్స్టాలేషన్](docs/chapter-01-foundation/installation.md) &#124; [మొదటి ప్రాజెక్ట్](docs/chapter-01-foundation/first-project.md) | 30-45 నిమిషాలు | ⭐ |
| **[Ch 2: AI Development](docs/chapter-02-ai-development/README.md)** | AI-ఫస్ట్ అనువర్తనాలు | [Foundry ఇంటిగ్రేషన్](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI ఏజెంట్లు](docs/chapter-02-ai-development/agents.md) &#124; [మోడల్ డిప్లాయ్‌మెంట్](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [వర్క్షాప్](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 గంటలు | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | ఆథ్ & భద్రత | [Configuration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 నిమిషాలు | ⭐⭐ |
| **[Ch 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC & డిప్లాయ్‌మెంట్ | [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 గంటలు | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI ఏజెంట్ పరిష్కారాలు | [Retail Scenario](examples/retail-scenario.md) &#124; [Coordination Patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 గంటలు | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | ప్లానింగ్ & ధృవీకరణ | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 గంట | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | డీబగ్ & ఫిక్స్ | [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 గంటలు | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | ఎంటర్ప్రైజ్ నమూనాలు | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 గంటలు | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | హ్యాండ్స్-ఆన్ ల్యాబ్ | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 గంటలు | ⭐⭐ |

**మొత్తం కోర్సు వ్యవధి:** ~10-14 గంటలు | **నైపుణ్య ప్రగతి:** Beginner → Production-Ready

---

## 📚 విద్యా అధ్యాయాలు

*అనుభవ స్థాయి మరియు లక్ష్యాల ఆధారంగా మీ వివిధ అధ్యయన మార్గాన్ని ఎంచుకోండి*

### 🚀 అధ్యాయం 1: ఫౌండేషన్ & త్వరిత ప్రారంభం
**ముందస్తు అవసరాలు**: Azure సబ్‌స్క్రిప్షన్, ప్రాథమిక కమాండ్ లైన్ పరిజ్ఞానం  
**కాలవ్యవధి**: 30-45 నిమిషాలు  
**సంక్లిష్టత**: ⭐

#### మీరు ఏమి నేర్చుకోగలరు
- Azure Developer CLI యొక్క ప్రాథమికాంశాలు అర్థం చేసుకోవడం
- మీ ప్లాట్‌ఫారమ్‌లో AZD ఇన్‌స్టాల్ చేయడం
- మీ మొదటి విజయవంతమైన డిప్లాయ్‌మెంట్

#### నేర్చుకునే వనరులు
- **🎯 ఇక్కడ ప్రారంభించండి**: [Azure Developer CLI అంటే ఏమిటి?](#what-is-azure-developer-cli)
- **📖 సిద్ధాంతం**: [AZD ప్రాథమికాంశాలు](docs/chapter-01-foundation/azd-basics.md) - ప్రధాన సూత్రాలు మరియు పదజాలం
- **⚙️ సెటప్**: [ఇన్స్టాలేషన్ & సెటప్](docs/chapter-01-foundation/installation.md) - ప్లాట్‌ఫారమ్-ప్రత్యేక గైడ్‌లు
- **🛠️ హ్యాండ్స్-ఆన్**: [మీ మొదటి ప్రాజెక్ట్](docs/chapter-01-foundation/first-project.md) - స్టెప్-బై-స్టెప్ ట్యుటోరియల్
- **📋 త్వరిత సూచిక**: [కమాండ్ చీట్ షీట్](resources/cheat-sheet.md)

#### ప్రాక్టికల్ వ్యాయామాలు
```bash
# త్వరిత సంస్థాపన తనిఖీ
azd version

# మీ మొదటి అప్లికేషన్‌ను డిప్లాయ్ చేయండి
azd init --template todo-nodejs-mongo
azd up
```

**💡 అధ్యాయం ఫలితం**: AZD ఉపయోగించి Azureలో ఒక సాదారణ వెబ్ అప్లికేషన్ విజయవంతంగా డిప్లాయ్ చేయగలగడం

**✅ విజయ నిర్ధారణ:**
```bash
# అధ్యాయం 1 పూర్తి చేసిన తర్వాత, మీరు చేయగలుగుతారు:
azd version              # ఇన్‌స్టాల్ చేయబడి ఉన్న సంస్కరణను చూపిస్తుంది
azd init --template todo-nodejs-mongo  # ప్రాజెక్టును ప్రారంభిస్తుంది
azd up                  # Azureకు డిప్లాయ్ చేస్తుంది
azd show                # నడుస్తున్న యాప్ యొక్క URLని చూపిస్తుంది
# అప్లికేషన్ బ్రౌజర్‌లో తెరుచుకుంటుంది మరియు పనిచేస్తుంది
azd down --force --purge  # వనరులను శుభ్రంగా తొలగిస్తుంది
```

**📊 సమయంతో పెట్టుబడి:** 30-45 నిమిషాలు  
**📈 నేర్పుకోలేని స్థాయి తర్వాత:** స్వతంత్రంగా ప్రాథమిక అప్లికేషన్లను డిప్లాయ్ చేయగలరు  
**📈 నేర్పుకోలేని స్థాయి తర్వాత:** స్వతంత్రంగా ప్రాథమిక అప్లికేషన్లను డిప్లాయ్ చేయగలరు

---

### 🤖 అధ్యాయం 2: AI-ఫస్ట్ అభివృద్ధి (AI డెవలపర్స్‌కు సూచించబడింది)
**ముందస్తు అవసరాలు**: అధ్యాయం 1 పూర్తి అయ్యి ఉండాలి  
**కాలవ్యవధి**: 1-2 గంటలు  
**సంక్లిష్టత**: ⭐⭐

#### మీరు ఏమి నేర్చుకోగలరు
- AZDతో Microsoft Foundry ఇన్‌టిగ్రేషన్
- AI శక్తివంతమైన అప్లికేషన్లను డిప్లాయ్ చేయడం
- AI సేవల కాన్ఫిగరేషన్స్ విశ్లేషించడం

#### నేర్చుకునే వనరులు
- **🎯 ఇక్కడ ప్రారంభించండి**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI ఏజెంట్లు**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - AZD తో ఇంటెలిజెంట్ ఏజెంట్లను డిప్లాయ్ చేయడం
- **📖 నమూనాలు**: [మోడల్ డిప్లాయ్‌మెంట్](docs/chapter-02-ai-development/ai-model-deployment.md) - AI మోడల్స్‌ను డిప్లాయ్ చేయడం మరియు నిర్వహించడం
- **🛠️ వర్క్షాప్**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - మీ AI పరిష్కారాలను AZD-కు రెడీ చేయండి
- **🎥 ఇంటరాక్టివ్ గైడ్**: [Workshop Materials](workshop/README.md) - బ్రౌజర్-ఆధారిత నేర్చుకోవడం MkDocs * DevContainer Environment
- **📋 టెంప్లేట్లు**: [Microsoft Foundry Templates](#వర్క్షాప్-వనరులు)
- **📝 ఉదాహరణలు**: [AZD Deployment Examples](examples/README.md)

#### ప్రాక్టికల్ వ్యాయామాలు
```bash
# మీ మొదటి AI అప్లికేషన్‌ను డిప్లాయ్ చేయండి
azd init --template azure-search-openai-demo
azd up

# అదనపు AI టెంప్లేట్లను ప్రయత్నించండి
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 అధ్యాయం ఫలితం**: RAG సామర్థ్యాలతో ఒక AI-శక్తి చాట్ అప్లికేషన్‌ను డిప్లాయ్ చేసి కాన్ఫిగర్ చేయగలగడం

**✅ విజయ నిర్ధారణ:**
```bash
# అధ్యాయం 2 తర్వాత, మీరు ఈ క్రింది పనులను చేయగలగాలి:
azd init --template azure-search-openai-demo
azd up
# AI చాట్ ఇంటర్‌ఫేస్‌ను పరీక్షించండి
# ప్రశ్నలు అడిగి, మూలాలతో AI ఆధారిత సమాధానాలు పొందండి
# శోధన ఇంటిగ్రేషన్ పనిచేస్తుందో నిర్ధారించండి
azd monitor  # Application Insights టెలిమెట్రీను చూపిస్తున్నదని తనిఖీ చేయండి
azd down --force --purge
```

**📊 సమయంతో పెట్టుబడి:** 1-2 గంటలు  
**📈 నేర్పుకోలేని స్థాయి తర్వాత:** ప్రొడక్షన్-రెడీ AI అప్లికేషన్లను డిప్లాయ్ చేసి కాన్ఫిగర్ చేయగలరు  
**💰 ఖర్చు అవగాహన:** డెవ్ ఖర్చులు $80-150/నెల, ప్రొడక్షన్ ఖర్చులు $300-3500/నెల మధ్యగా ఉండే అవకాశముంది

#### 💰 AI డిప్లాయ్‌మెంట్‌లకి సంబంధించి ఖర్చుల అవగాహన

**డెవలప్‌మెంట్ ఎన్విరాన్‌మెంట్ (అంచనా $80-150/నెల):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/నెల (టోకెన్ వినియోగంపై ఆధారపడి)
- AI Search (Basic tier): $75/నెల
- Container Apps (Consumption): $0-20/నెల
- Storage (Standard): $1-5/నెల

**ప్రొడక్షన్ ఎన్విరాన్‌మెంట్ (అంచనా $300-3,500+/నెల):**
- Microsoft Foundry Models (PTU కొరకు స్థిర పనితీరు): $3,000+/నెల లేదా అధిక వాల్యూమ్‌తో Pay-as-you-go
- AI Search (Standard tier): $250/నెల
- Container Apps (Dedicated): $50-100/నెల
- Application Insights: $5-50/నెల
- Storage (Premium): $10-50/నెల

**💡 ఖర్చు ఆప్టిమైజేషన్ సూచనలు:**
- నేర్చుకోవడానికి Microsoft Foundry Models యొక్క **ఫ్రీ టియర్** ను ఉపయోగించండి (Azure OpenAI 50,000 tokens/నెల ఇన్‌క్లూడెడ్)
- డెవలప్‌మెంట్ సమయంలో క్రియాశీలంగా లేకపోతే వనరులను డీఅలోకేట్ చేయడానికి `azd down` నడపండి
- ప్రొడక్షన్ కోసం మాత్రమే PTU కు అప్‌గ్రేడ్ చేయండి, మొదట consumption-ఆధారిత బిల్లింగ్‌తో ప్రారంభించండి
- డిప్లాయ్‌మెంట్ చేసే ముందు ఖర్చులను అంచనా వేయడానికి `azd provision --preview` ఉపయోగించండి
- ఆటో-స్కేలింగ్‌ను ఎనేబుల్ చేయండి: వాస్తవ ఉపయోగానికి మాత్రమే చెల్లించండి

**ఖర్చుల మానిటరింగ్:**
```bash
# అంచనా నెలవారి ఖర్చులను తనిఖీ చేయండి
azd provision --preview

# Azure పోర్టల్‌లో వాస్తవ ఖర్చులను పర్యవేక్షించండి
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ అధ్యాయం 3: కాన్ఫిగరేషన్ & ఆథెంటికేషన్
**ముందస్తు అవసరాలు**: అధ్యాయం 1 పూర్తి అయి ఉండాలి  
**కాలవ్యవధి**: 45-60 నిమిషాలు  
**సంక్లిష్టత**: ⭐⭐

#### మీరు ఏమి నేర్చుకోగలరు
- ఎన్విరాన్‌మెంట్ కాన్ఫిగరేషన్ మరియు నిర్వహణ
- ఆథెంటికేషన్ మరియు భద్రత ఉత్తమ అభ్యాసాలు
- రిసోర్స్ నేమింగ్ మరియు సంస్థీకరణ

#### నేర్చుకునే వనరులు
- **📖 కాన్ఫిగరేషన్**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - ఎన్విరాన్‌మెంట్ సెటప్
- **🔐 భద్రత**: [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - ఆథెంటికేషన్ ప్యాటర్న్స్
- **📝 ఉదాహరణలు**: [Database App Example](examples/database-app/README.md) - AZD డేటాబేస్ ఉదాహరణలు

#### ప్రాక్టికల్ వ్యాయామాలు
- బహు ఎన్‌విరాన్‌మెంట్‌లు (dev, staging, prod) కన్ఫిగర్ చేయండి
- managed identity ఆథెంటికేషన్ సెటప్ చేయండి
- ఎన్విరాన్‌మెంట్-స్పెసిఫిక్ కాన్ఫిగరేషన్లను అమలు చేయండి

**💡 అధ్యాయం ఫలితం**: సరైన ఆథెంటికేషన్ మరియు భద్రతతో బహు ఎన్విరాన్‌మెంట్‌లను నిర్వహించగలగడం

---

### 🏗️ అధ్యాయం 4: ఇన్ఫ్రాస్ట్రక్చర్ as కోడ్ & డిప్లాయ్‌మెంట్
**ముందస్తు అవసరాలు**: అధ్యాయాలు 1-3 పూర్తి అయి ఉండాలి  
**కాలవ్యవధి**: 1-1.5 గంటలు  
**సంక్లిష్టత**: ⭐⭐⭐

#### మీరు ఏమి నేర్చుకోగలరు
- అభివృద్ధి డిప్లాయ్‌మెంట్ ప్యాటర్న్స్
- Bicep తో Infrastructure as Code
- రిసోర్స్ ప్రోవిజనింగ్ వ్యూహాలు

#### నేర్చుకునే వనరులు
- **📖 డిప్లాయ్‌మెంట్**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - పూర్తి వర్క్‌ఫ్లోలు
- **🏗️ ప్రోవిజనింగ్**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Azure రిసోర్స్ నిర్వహణ
- **📝 ఉదాహరణలు**: [Container App Example](../../examples/container-app) - కంటైనరైజ్డ్ డిప్లాయ్‌మెంట్స్

#### ప్రాక్టికల్ వ్యాయామాలు
- కస్టమ్ Bicep టెంప్లేట్లు సృష్టించండి
- బహు-సర్వీస్ అప్లికేషన్లను డిప్లాయ్ చేయండి
- బ్లూ- గ్రీన్ డిప్లాయ్‌మెంట్ వ్యూహాలు అమలు చేయండి

**💡 అధ్యాయం ఫలితం**: కస్టమ్ ఇన్ఫ్రాస్ట్రక్చర్ టెంప్లేట్స్ ఉపయోగించి సంక్లిష్ట బహు-సర్వీస్ అప్లికేషన్లను డిప్లాయ్ చేయగలగడం

---

### 🎯 అధ్యాయం 5: బహు-ఏజెంట్ AI పరిష్కారాలు (అధిక స్థాయి)
**ముందస్తు అవసరాలు**: అధ్యాయాలు 1-2 పూర్తి అయి ఉండాలి  
**కాలవ్యవధి**: 2-3 గంటలు  
**సంక్లిష్టత**: ⭐⭐⭐⭐

#### మీరు ఏమి నేర్చుకోగలరు
- బహుళ ఏజెంట్ ఆర్కిటెక్చర్ ప్యాటర్న్స్
- ఏజెంట్ ఆర్కెస్ట్రేషన్ మరియు ఒకార్డినేషన్
- ప్రొడక్షన్-రెడీ AI డిప్లాయ్‌మెంట్లు

#### నేర్చుకునే వనరులు
- **🤖 ప్రత్యేక ప్రాజెక్ట్**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - పూర్తి అమలు
- **🛠️ ARM టెంప్లేట్లు**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - వన్-క్లిక్ డిప్లాయ్‌మెంట్
- **📖 ఆర్కిటెక్చర్**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - ప్యాటర్న్స్

#### ప్రాక్టికల్ వ్యాయామాలు
```bash
# పూర్తి రిటైల్ బహుళ-ఏజెంట్ పరిష్కారాన్ని అమలు చేయండి
cd examples/retail-multiagent-arm-template
./deploy.sh

# ఏజెంట్ కాన్ఫిగరేషన్లను అన్వేషించండి
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 అధ్యాయం ఫలితం**: Customer మరియు Inventory ఏజెంట్లతో ఒక ప్రొడక్షన్-రెడీ బహు-ఏజెంట్ AI పరిష్కారాన్ని డిప్లాయ్ చేసి నిర్వహించగలగడం

---

### 🔍 అధ్యాయం 6: ప్రీ-డిప్లాయ్‌మెంట్ ధృవీకరణ & ప్లానింగ్
**ముందస్తు అవసరాలు**: అధ్యాయం 4 పూర్తి అయ్యి ఉండాలి  
**కాలవ్యవధి**: 1 గంట  
**సంక్లిష్టత**: ⭐⭐
#### మీరు నేర్చుకునే విషయాలు
- సామర్థ్య ప్రణాళిక మరియు వనరుల ధృవీకరణ
- SKU ఎంపిక వ్యూహాలు
- ప్రీ-ఫ్లైట్ తనిఖీలు మరియు ఆటోమేషన్

#### అధ్యయన వనరులు
- **📊 ప్రణాళిక**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - వనరుల ధృవీకరణ
- **💰 ఎంపిక**: [SKU ఎంపిక](docs/chapter-06-pre-deployment/sku-selection.md) - ఖర్చు-సమర్థమైన ఎంపికలు
- **✅ ధృవీకరణ**: [ప్రీ-ఫ్లైట్ తనిఖీలు](docs/chapter-06-pre-deployment/preflight-checks.md) - స్వయంచాలక స్క్రిప్టులు

#### ప్రయోగాత్మక వ్యాయామాలు
- సామర్థ్య ధృవీకరణ స్క్రిప్ట్‌లు నడపండి
- ఖర్చు పరంగా SKU ఎంపికలను మెరుగుపరచండి
- డిప్లాయ్‌మెంట్‌కు ముందు ఆటోమేటెడ్ తనిఖీలను అమలు చేయండి

**💡 అధ్యాయం ఫలితం**: అమలు చేసే ముందు డిప్లాయ్‌మెంట్‌లను ధృవీకరించడం మరియు మెరుగుపరచడం

---

### 🚨 అధ్యాయం 7: సమస్యల పరిష్కారం & డీబగ్గింగ్
**పూర్వాపరాలు**: ఏదైనా డిప్లాయ్‌మెంట్ అధ్యాయం పూర్తి అయి ఉండాలి  
**కాలవ్యవధి**: 1-1.5 గంటలు  
**సంక్లిష్టత**: ⭐⭐

#### మీరు నేర్చుకునే విషయాలు
- వ్యవస్థాత్మక డీబగ్గింగ్ దృష్టికోణాలు
- సాధారణ సమస్యలు మరియు పరిష్కారాలు
- ఏఐ-విశిష్ట సమస్యల పరిష్కారం

#### అధ్యయన వనరులు
- **🔧 సాధారణ సమస్యలు**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - తరచుగా అడిచే ప్రశ్నలు మరియు పరిష్కారాలు
- **🕵️ డీబగ్గింగ్**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - దశల వారీ వ్యూహాలు
- **🤖 ఏఐ సమస్యలు**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - ఏఐ సేవల సమస్యలు

#### ప్రయోగాత్మక వ్యాయామాలు
- డిప్లాయ్‌మెంట్ వైఫల్యాలను నిర్ధారణ చేయండి
- అథెంటికేషన్ సమస్యలను పరిష్కరించండి
- ఏఐ సేవ కనెక్టివిటీ సమస్యలను డీబగ్గింగ్ చేయండి

**💡 అధ్యాయం ఫలితం**: స్వతంత్రంగా డిప్లాయ్‌మెంట్ సంబంధిత సాధారణ సమస్యలను గుర్తించి పరిష్కరించగలగడం

---

### 🏢 అధ్యాయం 8: ప్రొడక్షన్ & ఎంటర్‌ప్రైస్ నమూనాలు
**పూర్వాపరాలు**: అధ్యాయాలు 1-4 పూర్తి  
**కాలవ్యవధి**: 2-3 గంటలు  
**సంక్లిష్టత**: ⭐⭐⭐⭐

#### మీరు నేర్చుకునే విషయాలు
- ప్రొడక్షన్ డిప్లాయ్‌మెంట్ వ్యూహాలు
- ఎంటర్‌ప్రైస్ భద్రతా నమూనాలు
- మానిటరింగ్ మరియు ఖర్చు ఆప్టిమైజేషన్

#### అధ్యయన వనరులు
- **🏭 ఉత్పత్తి**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - ఎంటర్‌ప్రైస్ నమూనాలు
- **📝 ఉదాహరణలు**: [Microservices Example](../../examples/microservices) - సంక్లిష్ట ఆర్కిటెక్చర్లు
- **📊 మానిటరింగ్**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - మానిటరింగ్

#### ప్రయోగాత్మక వ్యాయామాలు
- ఎంటర్‌ప్రైస్ భద్రతా నమూనాలను అమలు చేయండి
- సమగ్ర మానిటరింగ్ ఏర్పాటు చేయండి
- సరైన పాలనతో ఉత్పత్తికి డిప్లాయ్ చేయండి

**💡 అధ్యాయం ఫలితం**: పూర్తి ఉత్పత్తి సామర్ధ్యాలతో ఎంటర్‌ప్రైస్-సిద్ధ అప్లికేషన్లను డిప్లాయ్ చేయగలగడం

---

## 🎓 వర్క్షాప్ అవలోకనం: హ్యాండ్స్-ఆన్ లెర్నింగ్ అనుభవం

> **⚠️ వర్క్షాప్ స్థితి: సక్రియ అభివృద్ధి**  
> వర్క్షాప్ మెటీరియల్స్ ప్రస్తుతం అభివృద్ధి మరియు మెరుగుదల చర్యలలో ఉన్నాయి. కోర్ మాడ్యూల్‌లు పనిచేస్తున్నప్పటికీ కొన్ని అధునాతన విభాగాలు ఇంకా పూర్తి కాలేదు. మేము అన్ని కంటెంట్ను పూర్తి చేయడానికి సక్రియంగా పని చేస్తున్నాము. [ప్రగతిని ట్రాక్ చేయండి →](workshop/README.md)

### ఇంటరాక్టివ్ వర్క్షాప్ మెటీరియల్స్
**బ్రౌజర్-ఆధారిత టూల్స్ మరియు మార్గనిర్దేశక వ్యాయామాలతో సమగ్ర హ్యాండ్స్-ఆన్ నేర్చుకోవడం**

మా వర్క్షాప్ మెటీరియల్స్ పై ఇచ్చిన అధ్యాయ-ఆధారిత పాఠ్యక్రమాన్ని అనుసరించే నిర్మాణబద్ధమైన, ఇంటరాక్టివ్ అభ్యసన అనుభవాన్ని అందిస్తాయి. వర్క్షాప్ స్వయం-గత అభ్యసన మరియు ఇన్స్ట్రక్టర్-నిర్దేశిత సెషన్లకూ రూపొందించబడింది.

#### 🛠️ వర్క్షాప్ ఫీచర్లు
- **బ్రౌజర్-ఆధారిత ఇంటర్‌ఫేస్**: పూర్తి MkDocs-ఆధారిత వర్క్షాప్ శోధన, కాపీ మరియు థీమ్ ఫీచర్లతో
- **GitHub Codespaces సమ్మేళనం**: ఒక-క్లిక్ డెవలప్‌మెంట్ ఎన్విరాన్మెంట్ సెటప్
- **క్రమబద్ధమైన అభ్యసన మార్గం**: 8-మాడ్యూల్ మార్గనిర్దేశక వ్యాయామాలు (మొత్తం 3-4 గంటలు)
- **ప్రోగ్రెసివ్ విధానశాస్త్రం**: పరిచయం → ఎంపిక → ధృవీకరణ → విభజన → కాన్ఫిగరేషన్ → అనుకూలీకరణ → తొలగింపు → సమాప్తి
- **ఇంటరాక్టివ్ DevContainer ఎన్విరాన్మెంట్**: ముందుగా కాన్ఫిగర్ చేయబడిన టూల్స్ మరియు డిపెండెన్సీలు

#### 📚 వర్క్షాప్ మాడ్యూల్ నిర్మాణం
వర్క్షాప్ ఒక **8-మాడ్యూల్ ప్రోగ్రెసివ్ విధానశాస్త్రం**ను అనుసరిస్తుంది, ఇది గుర్తింపునుండి డిప్లాయ్‌మెంట్ నైపుణ్యానికి తీసుకెళ్తుంది:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. పరిచయం** | Workshop Overview | అభ్యసన లక్ష్యాలు, ముందస్తు అవసరాలు, మరియు వర్క్షాప్ నిర్మాణం కోసం అర్థం చేసుకోండి | 15 నిమిషాలు |
| **1. ఎంపిక** | Template Discovery | AZD టెంప్లేట్లను పరిశీలించి మీ పరిస్థితికి సరిపోయే AI టెంప్లేట్‌ను ఎంచుకోండి | 20 నిమిషాలు |
| **2. ధృవీకరణ** | Deploy & Verify | టెంప్లేట్‌ని `azd up`తో డిప్లాయ్ చేసి ఇన్‌ఫ్రాస్ట్రక్చర్ పనిచేస్తుందో లేదో ధృవీకరించండి | 30 నిమిషాలు |
| **3. విభజన** | Understand Structure | GitHub Copilot ఉపయోగించి టెంప్లేట్ ఆర్కిటెక్చర్, Bicep ఫైళ్లు, మరియు కోడ్ ఆర్గనైజేషన్‌ను పరిశీలించండి | 30 నిమిషాలు |
| **4. కాన్ఫిగరేషన్** | azure.yaml లో లోతుగా అధ్యయనం | `azure.yaml` కాన్ఫిగరేషన్, లైఫ్సైకిల్ హుక్స్, మరియు ఎన్విరాన్‌మెంట్ వేరియబుల్స్‌లో నైపుణ్యం సంపాదించండి | 30 నిమిషాలు |
| **5. అనుకూలీకరణ** | Make It Yours | AI Search, ట్రేసింగ్, మూల్యాంకనం ఎనేబుల్ చేసి మీ సందర్భానికి అనుగుణంగా అనుకూలీకరించండి | 45 నిమిషాలు |
| **6. తొలగింపు** | Clean Up | వనరులను సురక్షితంగా డీప్రోవిజన్ చేయడానికి `azd down --purge` ఉపయోగించండి | 15 నిమిషాలు |
| **7. సమాప్తి** | Next Steps | సాధనలను, ముఖ్య సూత్రాలను సమీక్షించి మీ అభ్యసన ప్రయాణాన్ని కొనసాగించండి | 15 నిమిషాలు |

**Workshop Flow:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 వర్క్షాప్ ప్రారంభించడం
```bash
# Option 1: GitHub Codespaces (సిఫార్సు చేయబడింది)
# రిపాజిటరీలో "Code" → "Create codespace on main" పై క్లిక్ చేయండి

# Option 2: స్థానిక అభివృద్ధి
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md లోని సెటప్ సూచనలను అనుసరించండి
```

#### 🎯 వర్క్షాప్ అభ్యసన ఫలితాలు
వర్క్షాప్ పూర్తి చేయడం ద్వారా పాల్గొనేవారు సాధిస్తారు:
- **ఉత్పత్తి-స్థాయి AI అప్లికేషన్‌లను డిప్లాయ్ చేయగలగడం**: Microsoft Foundry సేవలతో AZD ఉపయోగించండి
- **బహు-ఏజెంట్ ఆర్కిటెక్చర్స్‌లో నైపుణ్యం**: సమన్వయ సమగ్ర AI ఏజెంట్ పరిష్కారాలు అమలు చేయండి
- **భద్రత ఉత్తమ ఆచరణలను అమలు చేయడం**: అథెంటికేషన్ మరియు యాక్సెస్ కంట్రోల్ కాన్ఫిగర్ చేయండి
- **స్కేలింగ్ కోసం ఆప్టిమైజ్ చేయడం**: ఖర్చు-సమర్థమైన, పనితీరు పరమైన డిప్లాయ్‌మెంట్లను డిజైన్ చేయండి
- **డిప్లాయ్‌మెంట్లను ట్రబుల్‌షూట్ చేయడం**: సాధారణ సమస్యలను స్వతంత్రంగా పరిష్కరించండి

#### 📖 వర్క్షాప్ వనరులు
- **🎥 ఇంటరాక్టివ్ గైడ్**: [Workshop Materials](workshop/README.md) - బ్రౌజర్-ఆధారిత అభ్యసన వాతావరణం
- **📋 మాడ్యూల్-వారీ సూచనలు**:
  - [0. పరిచయం](workshop/docs/instructions/0-Introduction.md) - వర్క్షాప్ అవలోకనం మరియు లక్ష్యాలు
  - [1. ఎంపిక](workshop/docs/instructions/1-Select-AI-Template.md) - AI టెంప్లేట్లను కనుగొని ఎంచుకోండి
  - [2. ధృవీకరణ](workshop/docs/instructions/2-Validate-AI-Template.md) - టెంప్లేట్లను డిప్లాయ్ చేసి ధృవీకరించండి
  - [3. విభజన](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - టెంప్లేట్ ఆర్కిటెక్చర్‌ను పరిశీలించండి
  - [4. కాన్ఫిగరేషన్](workshop/docs/instructions/4-Configure-AI-Template.md) - `azure.yaml` పై నైపుణ్యం పొందండి
  - [5. అనుకూలీకరణ](workshop/docs/instructions/5-Customize-AI-Template.md) - మీ సందర్భానికి అనుగుణంగా అనుకూలీకరించండి
  - [6. తొలగింపు](workshop/docs/instructions/6-Teardown-Infrastructure.md) - వనరులను శుభ్రపరచండి
  - [7. సమాప్తి](workshop/docs/instructions/7-Wrap-up.md) - సమీక్ష మరియు తదుపరి దశలు
- **🛠️ ఏఐ వర్క్షాప్ ల్యాబ్**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-కేంద్రిత వ్యాయామాలు
- **💡 క్విక్ స్టార్ట్**: [Workshop Setup Guide](workshop/README.md#quick-start) - పరిసరాల కాన్ఫిగరేషన్

**సరైనది**: కార్పొరేట్ శిక్షణ, విశ్వవిద్యాలయ కోర్సులు, స్వీయ-గత అభ్యాసం, మరియు డెవలపర్ బూట్‌క్యాంప్‌లకు.

---

## 📖 లోతైన అధ్యయనం: AZD సామర్థ్యాలు

ప్రాథమిక అంశాల్ని దాటించి, AZD ప్రొడక్షన్ డిప్లాయ్‌మెంట్స్ కోసం శక్తివంతమైన ఫీచర్లను అందిస్తుంది:

- **టెంప్లేట్-ఆధారిత డిప్లాయ్‌మెంట్లు** - సాధారణ అప్లికేషన్ నమూనాలకు ముందస్తుగా నిర్మించబడిన టెంప్లేట్లను ఉపయోగించండి
- **Infrastructure as Code** - Bicep లేదా Terraform ఉపయోగించి Azure వనరులను నిర్వహించండి  
- **ఇంటిగ్రేటెడ్ పనివిధానాలు** - నిరవస్తంగా ప్రావిజన్, డిప్లాయ్, మరియు మానిటర్ చేయండి
- **డెవలపర్-స్నేహపూర్వకంగా** - డెవలపర్ ఉత్పాదకత మరియు అనుభవానికి అనుకూలంగా ఆప్టిమైజ్ చేయబడింది

### **AZD + Microsoft Foundry: AI డిప్లాయ్‌మెంట్స్‌కు ఉత్తమం**

**ఎందుకు AZD అటువంటి AI పరిష్కారాలకు?** AZD AI డెవలపర్లు ఎదుర్కొనే ప్రధాన సవాళ్లను పరిష్కరిస్తుంది:

- **AI-సిద్ధ టెంప్లేట్లు** - Microsoft Foundry Models, Cognitive Services, మరియు ML వర్క్‌లోడ్స్ కోసం ముందుగా కాన్ఫిగర్ చేయబడిన టెంప్లేట్లు
- **భద్రమైన AI డిప్లాయ్‌మెంట్లు** - AI సేవలు, API కీలు, మరియు మోడల్ ఎండ్‌పాయింట్ల కోసం బిల్ట్-ఇన్ భద్రతా నమూనాలు  
- **ఉత్పత్తి AI నమూనాలు** - స్కేలబుల్, ఖర్చు-సమర్థమైన AI అప్లికేషన్ డిప్లాయ్‌మెంట్‌లకు ఉత్తమ ఆచరణలు
- **ఎండ్-టు-ఎండ్ AI పని ప్రవాహాలు** - మోడల్ అభివృద్ధి నుంచి ఉత్పత్తి డిప్లాయ్‌మెంట్ వరకు సరైన మానిటరింగ్‌తో
- **ఖర్చు ఆప్టిమైజేషన్** - AI వర్క్‌లోడ్‌ల కోసం తెలివైన వనరు కేటాయింపు మరియు స్కేలింగ్ వ్యూహాలు
- **Microsoft Foundry సమ్మేళనం** - Microsoft Foundry మోడల్ క్యాటలాగ్ మరియు ఎండ్‌పాయింట్లకు సజావుగా కనెక్ట్ అవుతుంది

---

## 🎯 టెంప్లేట్లు & ఉదాహరణల లైబ్రరీ

### ఫీచర్ చేయబడినవి: Microsoft Foundry టెంప్లేట్లు
**AI అప్లికేషన్లు డిప్లాయ్ చేయాలంటే ఇక్కడి నుండి ప్రారంభించండి!**

> **గమనిక:** ఈ టెంప్లేట్లు వివిధ AI నమూనాలను ప్రదర్శిస్తాయి. కొన్ని బాహ్య Azure Samples నుండి ఉన్నాయి, మరికొన్ని స్థానిక అమలుకలుగా ఉన్నవి.

| టెంప్లేట్ | అధ్యాయం | సంక్లిష్టత | సర్వీసులు | రకం |
|----------|---------|------------|----------|------|
| [**AI చాట్‌తో ప్రారంభించండి**](https://github.com/Azure-Samples/get-started-with-ai-chat) | అధ్యాయం 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | బాహ్య |
| [**AI ఏజెంట్లతో ప్రారంభించండి**](https://github.com/Azure-Samples/get-started-with-ai-agents) | అధ్యాయం 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| బాహ్య |
| [**Azure Search + OpenAI డెమో**](https://github.com/Azure-Samples/azure-search-openai-demo) | అధ్యాయం 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | బాహ్య |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | అధ్యాయం 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | బాహ్య |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | అధ్యాయం 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | బాహ్య |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | అధ్యాయం 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | బాహ్య |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | అధ్యాయం 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **లోకల్** |

### ఫీచర్: సంపూర్ణ అభ్యసన సన్నివేశాలు
**ఉత్పత్తి-సిద్ధ అప్లికేషన్ టెంప్లేట్లు, అవి అభ్యసన అధ్యాయాలకు మ్యాప్ చేయబడ్డాయి**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | అధ్యాయం 2 | ⭐ | ప్రాథమిక AI డిప్లాయ్‌మెంట్ నమూనాలు |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | అధ్యాయం 2 | ⭐⭐ | Azure AI Search తో RAG అమలు |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | అధ్యాయం 4 | ⭐⭐ | డాక్యుమెంట్ ఇంటెలిజెన్స్ సమగ్రత |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | అధ్యాయం 5 | ⭐⭐⭐ | ఏజెంట్ ఫ్రేమ్‌వర్క్ మరియు ఫంక్షన్ కాలింగ్ |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | అధ్యాయం 8 | ⭐⭐⭐ | ఎంటర్‌ప్రైస్ AI ఆర్కెస్ట్రేషన్ |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | అధ్యాయం 5 | ⭐⭐⭐⭐ | కస్టమర్ మరియు ఇన్వెంటరీ ఏజెంట్లు ఉన్న బహు-ఏజెంట్ ఆర్కిటెక్చర్ |

### ఉదాహరణ రకం ద్వారా నేర్చుకోవడం

> **📌 లోకల్ vs బాహ్య ఉదాహరణలు:**  
> **లోకల్ ఉదాహరణలు** (ఈ రిపోజిటరీలో) = వెంటనే ఉపయోగానికి సిద్ధం  
> **బాహ్య ఉదాహరణలు** (Azure Samples) = లింక్ చేయబడిన రిపోజిటరీల నుండి క్లోన్ చేయండి

#### లోకల్ ఉదాహరణలు (వినియోగానికి సిద్ధం)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARM టెంప్లేట్‌లతో పూర్తిగా ఉత్పత్తి-సిద్ధ అమలుక
  - బహుఏజెంట్ ఆర్కిటెక్చర్ (Customer + Inventory ఏజెంట్లు)
  - సమగ్ర మానిటరింగ్ మరియు మూల్యాంకనం
  - ARM టెంప్లేట్ ద్వారా ఒక-క్లిక్ డిప్లాయ్‌మెంట్

#### లోకల్ ఉదాహరణలు - కంటైనర్ అప్లికేషన్లు (అధ్యాయాలు 2-5)
**ఈ రిపోజిటరీలో సంపూర్ణ కంటైనర్ డిప్లాయ్‌మెంట్ ఉదాహరణలు:**
- [**Container App Examples**](examples/container-app/README.md) - కంటైనరైజ్డ్ డిప్లాయ్‌మెంట్లకు పూర్తి గైడ్
  - [సాదా Flask API](../../examples/container-app/simple-flask-api) - స్కేల్-టు-జీరోతో బేసిక్ REST API
  - [మైక్రోసర్వీసెస్ ఆర్కిటెక్చర్](../../examples/container-app/microservices) - ఉత్పత్తి-సిద్ధ బహు-సేవల డిప్లాయ్‌మెంట్
  - క్విక్ స్టార్ట్, ప్రొడక్షన్, మరియు అడ్వాన్స్‌డ్ డిప్లాయ్‌మెంట్ నమూనాలు
  - మానిటరింగ్, భద్రత, మరియు ఖర్చు ఆప్టిమైజేషన్ మార్గనిర్దేశం

#### బాహ్య ఉదాహరణలు - సాధారణ అప్లికేషన్లు (అధ్యాయాలు 1-2)
**ప్రారంభించడానికి ఈ Azure Samples రిపోజిటరీలను క్లోన్ చేయండి:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - ప్రాథమిక డిప్లాయ్‌మెంట్ నమూనాలు
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - స్థిర కంటెంట్ డిప్లాయ్‌మెంట్
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API డిప్లాయ్‌మెంట్

#### బాహ్య ఉదాహరణలు - డేటాబేస్ సమ్మేళనం (అధ్యాయాలు 3-4)
- [డేటాబేస్ యాప్ - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - డేటాబేస్ కనెక్టివిటీ నమూనాలు
- [ఫంక్షన్స్ + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - సర్వర్‌లెస్ డేటా వర్క్‌ఫ్లో

#### బాహ్య ఉదాహరణలు - అధునాతన నమూనాలు (అధ్యాయాలు 4-8)
- [జావా మైక్రోసర్వీసెస్](https://github.com/Azure-Samples/java-microservices-aca-lab) - బహుసర్వీస్ ఆర్కిటెక్చర్లు
- [కంటైనర్ యాప్స్ జాబ్స్](https://github.com/Azure-Samples/container-apps-jobs) - బ్యాక్‌గ్రౌండ్ ప్రాసెసింగ్  
- [ఎంటర్ప్రైజ్ ML పైప్‌లైన్](https://github.com/Azure-Samples/mlops-v2) - ఉత్పత్తి-సిద్ధ ML నమూనాలు

### బాహ్య టెంప్లేట్ సేకరణలు
- [**అధికారిక AZD టెంప్లేట్ గ్యాలరీ**](https://azure.github.io/awesome-azd/) - అధికారిక మరియు కమ్యూనిటీ టెంప్లేట్ల శ్రేణీకృత సేకరణ
- [**Azure Developer CLI టెంప్లేట్స్**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn టెంప్లేట్ డాక్యుమెంటేషన్
- [**ఉదాహరణల డైరెక్టరీ**](examples/README.md) - వివరణాత్మక వివరణలతో స్థానిక అభ్యాస ఉదాహరణలు

---

## 📚 అభ్యసన వనరులు & సూచనలు

### తక్షణ సూచికలు
- [**కమాండ్ చెట్ షీట్**](resources/cheat-sheet.md) - చాప్టర్ ప్రకారం క్రమబద్ధీకరించిన అవసరమైన azd కమాండ్లు
- [**పదసంచిక**](resources/glossary.md) - Azure మరియు azd పరిభాషకాలు  
- [**FAQ**](resources/faq.md) - చదివే అధ్యాయం ప్రకారం క్రమబద్ధీకరించిన సాధారణ ప్రశ్నలు
- [**స్టడీ గైడ్**](resources/study-guide.md) - విస్తృత అభ్యాస వ్యాయామాలు

### ప్రాయోగిక వర్క్‌షాప్స్
- [**AI వర్క్‌షాప్ ల్యాబ్**](docs/chapter-02-ai-development/ai-workshop-lab.md) - మీ AI పరిష్కారాలను AZD-డిప్లాయ్ చేయదగినట్టు చేయండి (2-3 గంటలు)
- [**ఇన్‌టరాక్టివ్ వర్క్‌షాప్**](workshop/README.md) - MkDocs మరియు GitHub Codespaces తో 8-మాడ్యూల్ మార్గదర్శక వ్యాయామాలు
  - అనుసరిస్తుంది: పరిచయం → ఎంపిక → నిర్ధారణ → విడగొట్టడం → అమరికలు → అనుకూలీకరణ → తొలగింపు → ముగింపు

### బాహ్య అభ్యాస వనరులు
- Azure Developer CLI Documentation: https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/
- Azure Architecture Center: https://learn.microsoft.com/en-us/azure/architecture/
- Azure Pricing Calculator: https://azure.microsoft.com/pricing/calculator/
- Azure Status: https://status.azure.com/

### మీ ఎడిటర్‌కు AI ఏజెంట్ నైపుణ్యాలు
- [**skills.sh లోని Microsoft Azure నైపుణ్యాలు**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI, Foundry, డిప్లాయ్‌మెంట్, డయాగ్నస్టిక్స్, ఖర్చు ఆప్టిమైజేషన్ మరియు మరెన్నో కోసం 37 ఓపెన్ ఏజెంట్ నైపుణ్యాలు. అవి GitHub Copilot, Cursor, Claude Code లేదా ఏదైనా మద్దతు కలిగిన ఏజెంట్‌లో ఇన్‌స్టాల్ చేయండి:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 త్వరిత సమస్య పరిష్కార మార్గదర్శి

**ఆరంభికులు ఎదుర్కొనే సాధారణ సమస్యలు మరియు తక్షణ పరిష్కారాలు:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# ముందుగా AZDని ఇన్‌స్టాల్ చేయండి
# విండోస్ (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# లినక్స్:
curl -fsSL https://aka.ms/install-azd.sh | bash

# ఇన్‌స్టాలేషన్‌ను ధృవీకరించండి
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# అందుబాటులో ఉన్న సబ్‌స్క్రిప్షన్లను జాబితా చేయండి
az account list --output table

# డిఫాల్ట్ సబ్‌స్క్రిప్షన్‌ను సెట్ చేయండి
az account set --subscription "<subscription-id-or-name>"

# AZD పర్యావరణం కోసం సెట్ చేయండి
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# ధృవీకరించండి
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# వేరే Azure ప్రాంతాన్ని ప్రయత్నించండి
azd env set AZURE_LOCATION "westus2"
azd up

# లేదా డెవలప్‌మెంట్‌లో చిన్న SKUs ఉపయోగించండి
# సవరించండి infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# వికల్పం 1: శుభ్రపరిచి మళ్లీ ప్రయత్నించండి
azd down --force --purge
azd up

# వికల్పం 2: కేవలం ఇన్‌ఫ్రాస్ట్రక్చర్‌ను సరిదిద్దండి
azd provision

# వికల్పం 3: వివరమైన స్థితిని తనిఖీ చేయండి
azd show

# వికల్పం 4: Azure Monitorలో లాగ్‌లను తనిఖీ చేయండి
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# AZD కోసం మళ్లీ ప్రామాణీకరించండి
azd auth logout
azd auth login

# ఐచ్ఛికం: మీరు az కమాండ్లు నడుపుతున్నట్లయితే Azure CLI ను కూడా తాజా చేయండి
az logout
az login

# ప్రామాణీకరణను నిర్ధారించండి
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD ప్రత్యేక పేర్లను రూపొందిస్తుంది, కానీ పేరులలో సంఘర్షణ ఉంటే:
azd down --force --purge

# అప్పుడే కొత్త పరిసరంతో మళ్లీ ప్రయత్నించండి
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**సాధారణ వేచి ఉండాల్సిన సమయాలు:**
- సింపల్ వెబ్ యాప్: 5-10 నిమిషాలు
- డేటాబేస్ ఉన్న యాప్: 10-15 నిమిషాలు
- AI అప్లికేషన్లు: 15-25 నిమిషాలు (OpenAI ప్రొవిజనింగ్ మెల్లగా జరుగుతుంది)

```bash
# ప్రగతిని తనిఖీ చేయండి
azd show

# 30 నిమిషాలకంటే ఎక్కువ అడ్డుకున్నట్లయితే, Azure పోర్టల్‌ను తనిఖీ చేయండి:
azd monitor --overview
# విఫలమైన డిప్లాయ్‌మెంట్‌లను చూడండి
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# మీ Azure పాత్రను తనిఖీ చేయండి
az role assignment list --assignee $(az account show --query user.name -o tsv)

# మీకు కనీసం "Contributor" పాత్ర అవసరం
# మీ Azure అడ్మిన్‌కు ఈ హక్కులు ఇవ్వమని అడగండి:
# - Contributor (వనరుల కోసం)
# - User Access Administrator (పాత్ర నియామకాల కోసం)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# అన్ని సేవా ఎండ్‌పాయింట్‌లను చూపించు
azd show

# లేదా Azure పోర్టల్‌ను తెరవండి
azd monitor

# నిర్దిష్ట సేవను తనిఖీ చేయండి
azd env get-values
# *_URL వేరియబుల్స్ కోసం చూడండి
```
</details>

### 📚 పూర్తి సమస్య పరిష్కార వనరులు

- **సాధారణ సమస్యల గైడ్:** [వివరమైన పరిష్కారాలు](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-స్పెసిఫిక్ సమస్యలు:** [AI సమస్య పరిష్కారం](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **డీబగ్గింగ్ గైడ్:** [దశల వారీ డీబగ్గింగ్](docs/chapter-07-troubleshooting/debugging.md)
- **సహాయం పొందండి:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 కోర్సు పూర్తి & సర్టిఫికేషన్

### పురోగతి ట్రాకింగ్
ప్రతి అధ్యాయాన్ని దాటి మీ అభ్యసన పురోగతిని ట్రాక్ చేయండి:

- [ ] **Chapter 1**: మూలాధారాలు & త్వరిత ప్రారంభం ✅
- [ ] **Chapter 2**: AI-ప్రథమ అభివృద్ధి ✅  
- [ ] **Chapter 3**: కాన్ఫిగరేషన్ & ప్రమాణీకరణ ✅
- [ ] **Chapter 4**: కోడ్ ద్వారా ఇన్ఫ్రాస్ట్రక్చర్ & డిప్లాయ్‌మెంట్ ✅
- [ ] **Chapter 5**: బహుఏజెంట్ AI పరిష్కారాలు ✅
- [ ] **Chapter 6**: ముందస్తు-డిప్లాయ్ నిర్ధారణ & ప్లానింగ్ ✅
- [ ] **Chapter 7**: సమస్య పరిష్కారం & డీబగ్గింగ్ ✅
- [ ] **Chapter 8**: ఉత్పత్తి & సంస్థా నమూనాలు ✅

### అభ్యసన నిర్ధారణ
ప్రతి అధ్యాయాన్ని పూర్తిచేసిన తర్వాత మీ జ్ఞానాన్ని నిర్ధారించండి:
1. **ప్రాయోగిక వ్యాయామం**: ఆ అధ్యాయంలోని హ్యాండ్స్-ఆన్ డిప్లాయ్‌మెంట్ పూర్తి చేయండి
2. **జ్ఞాన తనిఖీ**: మీ అధ్యాయానికి సంబంధించిన FAQ విభాగాన్ని సమీక్షించండి
3. **కమ్యూనిటీ చర్చ**: మీ అనుభవాన్ని Azure Discordలో పంచుకోండి
4. **తరువాతి అధ్యాయం**: తదుపరి క్లిష్టత స్థాయికి వెళ్లండి

### కోర్సు పూర్తి ప్రయోజనాలు
అన్ని అధ్యాయాలను పూర్తిచేసిన తర్వాత మీరు పొందగలిగేది:
- **ఉత్పత్తి అనుభవం**: నిజమైన AI అప్లికేషన్లను Azureలో డిప్లాయ్ చేయడం
- **ప్రొఫెషనల్ నైపుణ్యాలు**: ఎంటర్ప్రైజ్-సిద్ధ డిప్లాయ్‌మెంట్ సామర్ధ్యాలు  
- **కమ్యూనిటీ గుర్తింపు**: Azure డెవలపర్ కమ్యూనిటీలో సక్రియ సభ్యుడు
- **కరియర్ అభివృద్ధి**: డిమాండ్ ఉన్న AZD మరియు AI డిప్లాయ్‌మెంట్ నైపుణ్యాలు

---

## 🤝 కమ్యూనిటీ & మద్దత్తు

### సహాయం & మద్దతు పొందండి
- **టెక్నికల్ సమస్యలు:** [బగ్‌లు నివేదించండి మరియు ఫీచర్ అభ్యర్థించండి](https://github.com/microsoft/azd-for-beginners/issues)
- **అభ్యసన ప్రశ్నలు:** [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) మరియు [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-స్పెసిఫిక్ సహాయం:** చేరండి [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **డాక్యూమెంటేషన్:** [అధికారిక Azure Developer CLI డాక్యుమెంటేషన్](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord నుండి కమ్యూనిటీ అవగాహనలు

**#Azure చానెల్ నుండి ఇటీవల జరిగిన పోలింగ్ ఫలితాలు:**
- **45%** డెవలపర్లు AI పనిభారాల కోసం AZD ఉపయోగించాలని కోరుకుంటున్నారు
- **ప్రధాన సవాళ్ళు**: బహు-సర్వీస్ డిప్లాయ్‌మెంట్స్, క్రెడెన్షియల్ నిర్వహణ, ఉత్పత్తి సిద్ధత  
- **అత్యంత అభ్యర్థించబడింది**: AI-స్పెసిఫిక్ టెంప్లేట్లు, ట్రబుల్షూటింగ్ గైడ్స్, ఉత్తమ అభ్యాసాలు

**మన కమ్యూనిటీలో చేరి:**
- మీ AZD + AI అనుభవాలను పంచుకొని సహాయం పొందండి
- కొత్త AI టెంప్లేట్ల ప్రారంభ ప్రివ్యూ‌లకు ప్రవేశం పొందండి
- AI డిప్లాయ్‌మెంట్ ఉత్తమ ఆచరణలకు సహకరించండి
- భవిష్యత్తులో AI + AZD ఫీచర్ అభివృద్ధిపై ప్రభావం చూపండి

### కోర్సుకు సహకారం చేయడం
మేము תרומותను స్వాగతిస్తాము! వివరాల కొరకు దయచేసి మా [Contributing Guide](CONTRIBUTING.md) చదవండి:
- **కంటెంట్ మెరుగుదలలు**: ఉన్న అధ్యాయాలు మరియు ఉదాహరణలను మెరుగుపరచండి
- **కొత్త ఉదాహరణలు**: వాస్తవ ప్రపంచ సన్నివేశాలు మరియు టెంప్లేట్లు జోడించండి  
- **భాషా అనువాదం**: బహుభాషా మద్దతును నిర్వహించడంలో సహాయపడండి
- **బగ్ నివేదికలు**: ఖచ్చితత్వం మరియు స్పష్టతను మెరుగుపరచండి
- **కమ్యూనిటీ ప్రమాణాలు**: మా సమావేశక కమ్యూనిటీ మార్గదర్శకాలను పాటించండి

---

## 📄 కోర్సు సమాచారం

### లైసెన్స్
ఈ ప్రాజెక్ట్ MIT లైసెన్స్ కింద లైసెన్సు చేయబడి ఉంది - వివరాలకు [LICENSE](../../LICENSE) ఫైల్‌ను చూడండి.

### సంబంధిత Microsoft అభ్యసన వనరులు

మన టీమ్ ఇతర సమగ్ర అభ్యసన కోర్సులను ఉత్పత్తి చేస్తుంది:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j ప్రారంభికులకు](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js ప్రారంభికులకు](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain ప్రారంభికులకు](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD ప్రారంభికులకు](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI ప్రారంభికులకు](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP ప్రారంభికులకు](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI ఏజెంట్స్ ప్రారంభికులకు](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Generative AI ప్రారంభికులకు](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET) ప్రారంభికులకు](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java) ప్రారంభికులకు](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript) ప్రారంభికులకు](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Core Learning
[![ML ప్రారంభికులకు](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![ఆరంభుల కోసం డేటా సైన్స్](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![ఆరంభుల కోసం AI](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![ఆరంభుల కోసం సైబర్ భద్రత](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![ఆరంభుల కోసం వెబ్ డెవలప్‌మెంట్](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![ఆరంభుల కోసం IoT](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![ఆరంభుల కోసం XR అభివృద్ధి](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot సిరీస్
[![AI జంట ప్రోగ్రామింగ్ కోసం Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET కోసం Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot అడ్వెంచర్](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ కోర్సు నావిగేషన్

**🚀 ఇప్పుడే నేర్చుకోవడం ప్రారంభించడానికి సిద్ధమా?**

**ఆరంభులు**: ఇదితో ప్రారంభించండి [అధ్యాయం 1: ఆదారం & త్వరిత ప్రారంభం](#-chapter-1-foundation--quick-start)  
**AI డెవలపర్లు**: నేరుగా వెళ్లండి [అధ్యాయం 2: AI-ప్రథమ అభివృద్ధి](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**అనుభవం ఉన్న డెవలపర్లు**: ఇదితో ప్రారంభించండి [అధ్యాయం 3: కాన్ఫిగరేషన్ & ప్రమాణీకరణ](#️-chapter-3-configuration--authentication)

**తరువాతి దశలు**: [అధ్యాయం 1 ప్రారంభించండి - AZD బేసిక్స్](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**నిరాకరణ**:
ఈ పత్రాన్ని AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ద్వారా అనువదించడం జరిగింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాల్లో పొరపాట్లు లేదా తప్పులు ఉండవచ్చు అనేది దయచేసి గమనించండి. మూల పత్రాన్ని దాని స్థానిక భాషలోనే అధికారిక మూలంగా పరిగణించాలి. కీలకమైన సమాచారానికి వృత్తిపరమైన మానవ అనువాదాన్ని సిఫార్సు చేయబడును. ఈ అనువాదం వాడినందున కలిగే ఏవైనా అపార్థాలు లేదా తప్పైన అవగాహనల కోసం మేము బాధ్యులు కాదని తెలియజేస్తున్నాము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->