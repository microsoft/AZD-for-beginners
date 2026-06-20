# AZD ప్రారంభికులకు: ఒక నిర్మితమైన నేర్చుకునే ప్రయాణం

![AZD-ప్రారంభికులకు](../../translated_images/te/azdbeginners.5527441dd9f74068.webp) 

[![GitHub వీక్షకులు](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub ఫోర్క్‌లు](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub స్టార్లు](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### ఆటోమేటెడ్ అనువాదాలు (ఎప్పుడూ అప్-టు-డేట్)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[అరబిక్](../ar/README.md) | [బెంగాలీ](../bn/README.md) | [బుల్గేరియన్](../bg/README.md) | [బర్మీస్ (మయన్మార్)](../my/README.md) | [చైనీస్ (సరళీకృత)](../zh-CN/README.md) | [చైనీస్ (సాంప్రదాయ, హాంకాంగ్)](../zh-HK/README.md) | [చైనీస్ (సాంప్రదాయ, మకావ్)](../zh-MO/README.md) | [చైనీస్ (సాంప్రదాయ, తైవాన్)](../zh-TW/README.md) | [క్రొయేషియన్](../hr/README.md) | [చెక్](../cs/README.md) | [డానిష్](../da/README.md) | [డచ్](../nl/README.md) | [ఎస్టోనియన్](../et/README.md) | [ఫిన్నిష్](../fi/README.md) | [ఫ్రెంచ్](../fr/README.md) | [జర్మన్](../de/README.md) | [గ్రీక్](../el/README.md) | [హెబ్రూ](../he/README.md) | [హిందీ](../hi/README.md) | [హంగేరియన్](../hu/README.md) | [ఇండోనేషియన్](../id/README.md) | [ఇటాలియన్](../it/README.md) | [జపనీస్](../ja/README.md) | [కన్నడ](../kn/README.md) | [ఖ్మేర్](../km/README.md) | [కొరియన్](../ko/README.md) | [లిథువేనియన్](../lt/README.md) | [మలయ్](../ms/README.md) | [మలయాళం](../ml/README.md) | [మరాఠీ](../mr/README.md) | [నేపాలి](../ne/README.md) | [నైజీరియన్ పిడ్గిన్](../pcm/README.md) | [నార్వేజియన్](../no/README.md) | [పర్షియన్ (ఫార్సీ)](../fa/README.md) | [పోలిష్](../pl/README.md) | [పోర్చుగీస్ (బ్రెజిల్)](../pt-BR/README.md) | [పోర్చుగీస్ (పోర్టుగల్)](../pt-PT/README.md) | [పంజాబీ (గుర్ముఖీ)](../pa/README.md) | [రోమేనియన్](../ro/README.md) | [రష్యన్](../ru/README.md) | [సర్బియన్ (సిరిలిక్)](../sr/README.md) | [స్లోవాక్](../sk/README.md) | [స్లోవేనియన్](../sl/README.md) | [స్పానిష్](../es/README.md) | [స్వాహిలి](../sw/README.md) | [స్వీడిష్](../sv/README.md) | [టాగలోగ్ (ఫిలిప్పీనో)](../tl/README.md) | [తమిళం](../ta/README.md) | [తెలుగు](./README.md) | [థాయ్](../th/README.md) | [టర్కిష్](../tr/README.md) | [ఉక్రేనియన్](../uk/README.md) | [ఉర్దూ](../ur/README.md) | [వియత్నామీస్](../vi/README.md)

> **లోకల్‌గా క్లోన్ చేయాలా?**
>
> ఈ రిపోజిటరీలో 50+ భాష అనువాదాలు ఉన్నాయి, ఇవి డౌన్‌లోడ్ పరిమాణాన్ని గణనీయంగా పెంచుతాయి. అనువాదాలు లేకుండా క్లోన్ చేయడానికి sparse checkout ఉపయోగించండి:
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
> ఇది కోర్సును పూర్తి చేయడానికి అవసరమైన అన్ని ఫైళ్ళను మీకు వేగంగా డౌన్‌లోడ్ చేయడానికి ఇస్తుంది.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 azd నేడు కొత్తగా ఏమి ఉంది

> 📌 ఈ కోర్సు **`azd 1.25.6`** (జూన్ 2026) ను ఆధారంగా పరీక్షించినది. మీ బిల్డ్ చెక్ చేయడానికి `azd version` నడపండి, తాజా వर्जన్ కోసం `azd upgrade` నడపండి.

Azure Developer CLI సంప్రదాయ వెబ్ యాప్స్ మరియు APIsకి మించి పెరిగివేసింది. ఈ రోజు, azd అనేది Azureకి ఏదైనా అప్లికేషన్‌ను డిప్లాయ్ చేయడానికి ఏకైక సాధనం — AI-శక్తితో పనిచేసే అప్లికేషన్లు మరియు ఇంటెలిజెంట్ ఏజెంట్లను కూడా చేర్చుకొని.

మీ కోసం దీని అర్థం ఇదే:

- **AI ఏజెంట్లు ఇప్పుడు azdలో ఫస్ట్-క్లాస్ వర్క్‌లోడ్స్.** మీరు ఇప్పటి వరకు తెలిసిన అదే `azd init` → `azd up` వర్క్ఫ్లో ఉపయోగించి AI ఏజెంట్ ప్రాజెక్టులను ప్రారంభించవచ్చు, డిప్లాయ్ చేయవచ్చు, మరియు నిర్వహించవచ్చు.
- **CLI ద్వారా పూర్తి ఏజెంట్ జీవనచక్రం.** `azure.ai.agents` ఎక్స్‌టెన్షన్ ఇప్పుడు మొత్తం ప్రయాణాన్ని కవర్ చేస్తుంది—`azd ai agent init` స్కాఫోల్డ్ చేయడానికి, `azd ai agent invoke` పరీక్షకు (స్పందన-సమయ అవుట్‌పుట్‌తో), `azd ai agent eval generate` మరియు `azd ai agent optimize` నాణ్యతను కొలవడానికి మరియు మెరుగుపరచడానికి, మరియు `azd ai agent delete` శుభ్రపరిచేందుకు.
- **ఇంకా ఎక్కువ AI నిర్మాణ బ్లాక్స్.** కొత్త ప్రివ్యూ ఎక్స్‌టెన్షన్లు—`azure.ai.skills` మరియు `azure.ai.connections`—మీకు పునర్వినియోగయోగ్య ఏజెంట్ స్కిల్స్ మరియు Foundry కనెక్షన్లను నేరుగా azd తో నిర్వహించడానికి అనుమతిస్తాయి.
- **Microsoft Foundry ఇంటిగ్రేషన్** మోడల్ డిప్లాయ్‌మెంట్, ఏజెంట్ హోస్టింగ్, మరియు AI సేవ కాన్ఫిగరేషన్‌ను azd టెంప్లేట్ ఎకోసిస్టమ్‌లో నేరుగా తీసుకువస్తుంది.
- **దైనందిన పనులు మెరుగ్గా.** ఇటీవల విడుదలలు `azd init` ను idempotent (మరల నడిపించుకోవడానికి సురక్షితం) చేశాయి, `azd auth login` చెడిపోయిన టోకెన్లను ఆటోమాటిక్‌గా క్లియర్ చేస్తుంది, మరియు స్నేహపూర్వకమైన `azd tool` మొదటి-రన్ సెటప్ ప్రాంప్ట్‌ను జోడించాయి.
- **కోర్ వర్క్‌ఫ్లో మారలేదు.** మీరు todo యాప్, మైక్రోసర్విస్ లేదా బహు-ఏజెంట్ AI పరిష్కారం ఏదైనా డిప్లాయ్ చేస్తున్నా, కమాండ్లు ఒకటే.

> **Aspire వినియోగదారులకి గమనిక:** Microsoft ఇప్పుడు ఉత్పత్తిని సరళంగా **Aspire** (మునుపటి ".NET Aspire") గా పిలుస్తుంది. azd యొక్క Aspire మద్దతు మారలేదు—కేవలం పేరు మాత్రమే నవీకరణ చేయబడింది.

ముందుగా azd ఉపయోగించినట్లయితే, AI మద్దతు సహజ విస్తరణనే—వేరు టూల్ లేదా అధునాతన ట్రాక్ కాదు. మీరు కొత్తగా ప్రారంభిస్తే, ఒకే వర్క్‌ఫ్లో నేర్చుకుంటారు అది ప్రతిదానికి పనిచేస్తుంది.

---

## 🚀 Azure Developer CLI (azd) అంటే ఏమిటి?

**Azure Developer CLI (azd)** అనేది డెవలపర్-అనుకూలమైన కమాండ్-లైన్ టూల్, ఇది అప్లికేషన్లను Azureకి డిప్లాయ్ చేయడాన్ని సులభం చేస్తుంది. దశలవారీగా Azure వనరులను మాన్యువల్‌గా సృష్టించడం మరియు కనెక్ట్ చేయడం బదులు, మీరు ఒకే కమాండ్‌తో మొత్తం అప్లికేషన్లను డిప్లాయ్ చేయవచ్చు.

### `azd up` యొక్క మ్యాజిక్

```bash
# ఈ ఒక్క ఆజ్ఞ అన్ని పనులు చేస్తుంది:
# ✅ అన్ని అజ్యూర్ వనరులను సృష్టిస్తుంది
# ✅ నెట్వర్కింగ్ మరియు భద్రతను స్థాపిస్తుంది
# ✅ మీ అప్లికేషన్ కో드를 రూపొందిస్తుంది
# ✅ అజ్యూర్ కు పంపిస్తుంది
# ✅ పనిచేసే URL ను మీకు అందిస్తుంది
azd up
```

**అంతే!** Azure పోర్టల్‌లో క్లిక్ చేయాల్సిన అవసరం లేదు, క్లిష్టమైన ARM టెంప్లేట్స్ ముందుగా నేర్చుకోవాల్సిన అవసరం లేదు, మాన్యువల్ కాన్ఫిగరేషన్ లేదు - కేవలం Azureపై పనిచేసే అప్లికేషన్లు పొందండి.

---

## ❓ Azure Developer CLI vs Azure CLI: ఏమిటి తేడా?

పూర్తిగా తొలి వినియోగదారులు అడిగే సాధారణ ప్రశ్న ఇది. సులభ సమాధానం ఇక్కడ ఉంది:

| ఫీచర్ | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **ఉద్దేశ్యం** | వ్యక్తిగత Azure వనరులను నిర్వహించడం | పూర్తి అప్లికేషన్లను డిప్లాయ్ చేయడం |
| **దృష్టికోణం** | ఇన్ఫ్రాస్ట్రక్చర్-కేంద్రితం | అప్లికేషన్-కేంద్రితం |
| **ఉదాహరణ** | `az webapp create --name myapp...` | `azd up` |
| **అభ్యసన వక్రత** | Azure సేవలను తెలుసుకోవాలి | మీ యాప్‌ను మాత్రమే తెలుసుకోండి |
| **అనుకూలమైనది** | DevOps, ఇన్ఫ్రాస్ట్రక్చర్ | డెవలపర్లు, ప్రోటోటైపింగ్ |

### సులభమైన ఉదాహరణ

- **Azure CLI** అనేది ఇల్లు నిర్మించడానికి అవసరమైన అన్ని టూల్స్ కలిగి ఉండడంలా—పడుతున్నాలు, రంధ్రకాలు, ఉక్కులు. మీరు ఏదైనా నిర్మించవచ్చు, కానీ నిర్మాణం తెలుసుకోవాలి.
- **Azure Developer CLI** అనేది ఒక కాంట్రాక్టర్ ని నియమించడం లాగానే ఉంది—మీరు మీరు ఏమి కావాలనుకుంటున్నారో చెప్తారు, వారు నిర్మాణాన్ని నిర్వహిస్తారు.

### ఎప్పుడు ఏది ఉపయోగించాలి

| పరిస్థితి | దీన్ని ఉపయోగించండి |
|----------|----------|
| "నేను నా వెబ్ యాప్‌ను త్వరగా డిప్లాయ్ చేయాలనుకుంటున్నాను" | `azd up` |
| "నేను కేవలం ఒక స్టోరేజ్ అకౌంట్ సృష్టించాలి" | `az storage account create` |
| "నేను పూర్తి AI అప్లికేషన్‌లను నిర్మించుతున్నాను" | `azd init --template azure-search-openai-demo` |
| "నేను ఒక నిర్దిష్ట Azure వనరును డీబగ్ చేయాలి" | `az resource show` |
| "నేను నిమిషాల్లో ప్రొడక్షన్-రెడీ డిప్లాయ్ చేయాలనుకుంటున్నాను" | `azd up --environment production` |

### ఇవి కలిసి పనిచేస్తాయి!

AZD లోపల Azure CLI ను ఉపయోగిస్తుంది. మీరు రెండింటినీ ఉపయోగించవచ్చు:
```bash
# AZD తో మీ యాప్‌ను డిప్లాయ్ చేయండి
azd up

# అప్పుడు Azure CLI తో నిర్దిష్ట వనరులను సర్దుబాటు చేయండి
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZDలో టెంప్లేట్లను కనుగొనండి

శూన్యంగా ప్రారంభించకండి! **Awesome AZD** అనేది కమ్యూనిటీ సేకరణ, రెడి-టు-డిప్లాయ్ టెంప్లేట్ల కలెక్షన్:

| సాధనం | వివరణ |
|----------|-------------|
| 🔗 [**Awesome AZD గ్యాలరీ**](https://azure.github.io/awesome-azd/) | ఒక క్లిక్ డిప్లాయ్‌తో 200+ టెంప్లేట్లను బ్రౌజ్ చేయండి |
| 🔗 [**టెంప్లేట్ సమర్పించండి**](https://github.com/Azure/awesome-azd/issues) | మీ స్వంత టెంప్లేట్‌ను కమ్యూనిటీకి Contribute చేయండి |
| 🔗 [**GitHub రిపోజిటరీ**](https://github.com/Azure/awesome-azd) | స్టార్ చేయండి మరియు మూలాన్ని అన్వేషించండి |

### Awesome AZD నుండి ప్రజాధాన్యమైన AI టెంప్లేట్లు

```bash
# మైక్రోసాఫ్ట్ ఫౌండ్‌రీ మోడల్స్ + AI సెర్చ్‌తో RAG చాట్
azd init --template azure-search-openai-demo

# వేగవంతమైన AI చాట్ అప్లికేషన్
azd init --template openai-chat-app-quickstart

# ఫౌండ్‌రీ ఏజెంట్స్‌తో AI ఏజెంట్స్
azd init --template get-started-with-ai-agents
```

---

## 🎯 3 దశలలో ప్రారంభించడం

మీరు డిప్లాయ్ చేయదలచుకున్న టెంప్లేట్‌కు మీ మెషీన్ సిద్ధమేనని నిర్ధారించుకోండి:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

ఏదైనా అవసరమైన చెక్ విఫలమైతే, ముందుగా దానిని సరి చేయండి మరియు ఆ తరువాత క్విక్ స్టార్ట్ కొనసాగించండి.

### దశ 1: AZD ఇన్స్టాల్ చేయండి (2 నిమిషాలు)

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

### దశ 2: AZD కోసం సత్యపరిచిక (Authenticate)

```bash
# ఈ కోర్సులో నేరుగా Azure CLI ఆజ్ఞలను ఉపయోగించాలనుకుంటే ఐచ్ఛికం
az login

# AZD పని ప్రవాహాలకు అవసరం
azd auth login
```

మీకు ఏది అవసరమో తెలియకపోతే, పూర్తి సెటప్ ఫ్లోను అనుసరించండి [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### దశ 3: మీ తొలిదైన యాప్ డిప్లాయ్ చేయండి

```bash
# టెంప్లేట్ నుండి ప్రారంభించండి
azd init --template todo-nodejs-mongo

# ఆజ్యూర్ కు పంపండి (అన్నీ సృష్టిస్తుంది!)
azd up
```

**🎉 అంతేగాక!** మీ యాప్ ఇప్పుడు Azure లో ప్రత్యక్షంగా ఉంది.

### శుభ్రపరచడం (మరచిపోకండి!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 ఈ కోర్సును ఎలా ఉపయోగించాలి

ఈ కోర్సు **ప్రగ్రెసివ్ లెర్నింగ్** కోసం రూపొందించబడింది - మీరు సౌకర్యంగా ఉన్న చోట నుంచి ప్రారంభించి మెట్లు ఈమేరకు కొనసాగండి:

| మీ అనుభవం | ఇక్కడ ప్రారంభించండి |
|-----------------|------------|
| **Azureకి పూర్తిగా కొత్త** | [అధ్యాయం 1: ఫౌండేషన్](#-chapter-1-foundation--quick-start) |
| **Azure తెలుసుకుంటున్నారు, AZD కొత్తగా ఉంది** | [అధ్యాయం 1: ఫౌండేషన్](#-chapter-1-foundation--quick-start) |
| **AI యాప్స్ డిప్లాయ్ చేయాలనుకుంటున్నారు** | [అధ్యాయం 2: AI-ప్రథమ అభివృద్ధి](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **ప్రాక్టికల్ హ్యాండ్స్-ఆన్ అనుభవం కావాలి** | [🎓 ఇంటరాక్టివ్ వర్క్‌షాప్](workshop/README.md) - 3-4 గంటల మార్గదర్శక ల్యాబ్ |
| ** ప్రొడక్షన్ ప్యాటర్న్‌లు కావాలి** | [అధ్యాయం 8: ప్రొడక్షన్ & ఎంటర్ప్రైజ్](#-chapter-8-production--enterprise-patterns) |

### త్వరిత సెటప్

1. **ఈ రిపోజిటరీని ఫోర్క్ చేయండి**: [![GitHub ఫోర్క్‌లు](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **క్లోన్ చేయండి**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **సహాయం పొందండి**: [Azure Discord కమ్యూనిటీ](https://discord.com/invite/ByRwuEEgH4)

> **లోకల్‌గా క్లోన్ చేయాలా?**

> ఈ రిపోజిటరీలో 50+ భాష అనువాదాలు ఉన్నాయి, ఇవి డౌన్‌లోడ్ పరిమాణాన్ని గణనీయంగా పెంచుతాయి. అనువాదాలు లేకుండా క్లోన్ చేయడానికి sparse checkout ఉపయోగించండి:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> ఇది కోర్సును పూర్తి చేయడానికి అవసరమైన అన్ని ఫైళ్ళను మీకు వేగంగా డౌన్‌లోడ్ చేయడానికి ఇస్తుంది.


## కోర్స్ అవలోకనం

స్ట్రక్చర్డ్ అధ్యాయాల ద్వారా Azure Developer CLI (azd) ను ప్రభుత్వించండి, ప్రగ్రెసివ్ లెర్నింగ్ కోసం రూపొందించినవి. **Microsoft Foundry ఇంటిగ్రేషన్‌తో AI అప్లికేషన్ డిప్లాయ్‌మెంట్‌పై ప్రత్యేక దృష్టి.**
### ఈ కోర్స్ ఆధునిక డెవలపర్లకు ఎందుకు అవసరం

Microsoft Foundry Discord సముదాయం నుండి సేకరించిన అవగాహనల ఆధారంగా, **డెవలపర్లలో 45% మంది AI పనులకు AZD ఉపయోగించాలనుకుంటున్నారు** కానీ ఈ సమస్యలను ఎదుర్కొంటున్నారు:
- కాంప్లెక్స్ బహు-సేవ AI ఆర్కిటెక్చర్లు
- ప్రొడక్షన్ AI డిప్లాయ్‌మెంట్ మంచిపద్ధతులు  
- Azure AI సేవలఇంటిగ్రేషన్ మరియు కాన్ఫిగరేషన్
- AI వర్క్లోడ్స్ కోసం ఖర్చు ఆప్టిమైజేషన్
- AI-సంబంధిత డిప్లాయ్‌మెంట్ సమస్యల నివారణ

### నేర్చుకునే లక్ష్యాలు

ఈ నిర్మిత కోర్సును పూర్తిచేయడం ద్వారా, మీరు:
- **AZD బేసిక్స్‌లో నైపుణ్యం సాధించాలి**: కోర్ కాన్సెప్ట్‌లు, ఇన్‌స్టాలేషన్, మరియు కాన్ఫిగరేషన్
- **AI అప్లికేషన్స్ డిప్లాయ్ చేయండి**: Microsoft Foundry సేవలతో AZD ఉపయోగించండి
- **Infrastructure as Code అమలు చేయండి**: Bicep టెంప్లేట్లతో Azure వనరులను నిర్వహించండి
- **డిప్లాయ్‌మెంట్‌లను ట్రబుల్‌షూట్ చేయండి**: సాధారణ సమస్యలను పరిష్కరించండి మరియు డీబగ్ చేయండి
- **ప్రొడక్షన్ కోసం ఆప్టిమైజ్ చేయండి**: భద్రత, స్కేలింగ్, మానిటరింగ్, మరియు ఖర్చు నిర్వహణ
- **బహుళ-ఏజెంట్ పరిష్కారాలు నిర్మించండి**: కాంప్లెక్స్ AI ఆర్కిటెక్చర్లు డిప్లాయ్ చేయండి

## ప్రారంభించే ముందు: ఖాతాలు, యాక్సెస్ మరియు ఊహాగానాలు

అధ్యాయం 1 ప్రారంభించడానికి ముందే, ఈ క్రింది విషయాలు మీ వద్ద ఉండాలి. ఈ మార్గదర్శకంలోని ఇన్‌స్టాలేషన్ దశలు తర్వాతి భాగాలు ఈ ప్రాథమిక వివరాలు ఇప్పటికే ఉన్నాయని అనుకుంటాయి.

- **An Azure subscription**: మీరు పని నుండి ఉన్న సబ్స్క్రిప్షన్ లేదా మీ స్వంత ఖాతా ఉపయోగించవచ్చు, లేక ప్రారంభించడానికి [free trial](https://aka.ms/azurefreetrial) సృష్టించవచ్చు.
- **Permission to create Azure resources**: చాలా వ్యాయామాల కోసం, మీరు లక్ష్య సబ్స్క్రిప్షన్ లేదా రిసోర్సు గ్రూప్‌లో కనీసం **Contributor** యాక్సెస్ కలిగి ఉండాలి. కొన్ని అధ్యాయాలు రిసోర్సు గ్రూపుల్ని, మేనేజ్డ్ ఐడెంటిటీలను, మరియు RBAC అసైన్‌మెంట్స్‌ను సృష్టించగలుగుతారు అని కూడా అనుకుంటాయి.
- [**A GitHub account**](https://github.com): ఇది రిపోను ఫోర్క్ చేయడానికి, మీ స్వంత మార్పులను ట్రాక్ చేయడానికి, మరియు వర్క్షాప్ కోసం GitHub Codespaces ఉపయోగించడానికి ఉపయోగకరం.
- **Template runtime prerequisites**: కొన్ని టెంప్లేట్లు స్థానిక టూల్స్ (Node.js, Python, Java, లేదా Docker వంటి) అవసరమవుతాయి. ప్రారంభించే ముందు setup validator నడిపి లేనటువంటి టూల్స్‌ను ముందుగానే గుర్తించండి.
- **Basic terminal familiarity**: మీరు ఎక్స్‌పర్ట్ కావాల్సిన అవసరం లేదు, కానీ `git clone`, `azd auth login`, మరియు `azd up` వంటి కమాండ్లను నడపటంలో సౌకర్యంగా ఉండాలి.

> **ఎంటర్‌ప్రైజ్ సబ్స్క్రిప్షన్‌లో పని చేస్తున్నారా?**
> మీ Azure ప్లాట్‌ఫారమ్ అడ్మినిస్ట్రేటర్ ద్వారా నిర్వహించబడుతుంటే, మీరు ఉపయోగించాలనుకొంటున్న సబ్స్క్రిప్షన్ లేదా రిసోర్సు గ్రూప్‌లో వనరులను డిప్లాయ్ చేయగలరని ముందుగా ధృవీకరించండి. చేయలేనట్లయితే, ప్రారంభించే ముందు sandbox subscription లేదా Contributor యాక్సెస్ కోరండి.

> **Azure కొత్తవారా?**
> మీ స్వంత Azure ట్రయల్ లేదా pay-as-you-go సబ్స్క్రిప్షన్‌ను https://aka.ms/azurefreetrial వద్ద ప్రారంభించండి ताकि మీరు వ్యాయామాలను పూర్తిగా పూర్తి చేయగలుగుతారు మరియు టెనెంట్-లెవల్ అనుమతుల కోసం వేచిచూడాల్సిన అవసరం ఉండదు.

## 🗺️ కోర్స్ మ్యాప్: అధ్యాయాల ద్వారా త్వరిత నావిగేషన్

ప్రతి అధ్యాయానికి లెర్నింగ్ ఒబ్జెక్టివ్స్, క్విక్ స్టార్ట్లు మరియు వ్యాయామాలతో ప్రత్యేక README ఉంటుంది:

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | Getting Started | [AZD Basics](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [First Project](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2: AI Development](docs/chapter-02-ai-development/README.md)** | AI-First Apps | [Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | Auth & Security | [Configuration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Ch 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC & Deployment | [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI Agent Solutions | [Retail Scenario](examples/retail-scenario.md) &#124; [Coordination Patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | Planning & Validation | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | Debug & Fix | [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | Enterprise Patterns | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Hands-On Lab | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**మొత్తం కోర్స్ వ్యవధి:** ~10-14 గంటలు | **నైపుణ్య పురోగతి:** Beginner → Production-Ready

---

## 📚 లెర్నింగ్ అధ్యాయకాలు

*అనుభవ స్థాయి మరియు లక్ష్యాల ఆధారంగా మీ లెర్నింగ్ పాథ్ ఎంచుకోండి*

### 🚀 అధ్యాయం 1: ఫౌండేషన్ & తక్షణ ప్రారంభం
**Prerequisites**: Azure subscription, basic command line knowledge  
**Duration**: 30-45 minutes  
**Complexity**: ⭐

#### మీరు ఏమి నేర్చుకుంటారు
- Azure Developer CLI బేసిక్ కాన్సెప్ట్‌లు అర్థం చేసుకోవడం
- మీ ప్లాట్ఫారమ్‌పై AZD ను ఇన్‌స్టాల్ చేయడం
- మీ మొట్టమొదటి విజయవంతమైన డిప్లాయ్‌మెంట్

#### లెర్నింగ్ రిసోర్సులు
- **🎯 ఇక్కడ ప్రారంభించండి**: [What is Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 సిద్ధాంతం**: [AZD Basics](docs/chapter-01-foundation/azd-basics.md) - కోర్ కాన్సెప్ట్‌లు మరియు పర్యాయపదాలు
- **⚙️ సెటప్**: [Installation & Setup](docs/chapter-01-foundation/installation.md) - ప్లాట్‌ఫారమ్-స్పెసిఫిక్ గైడ్స్
- **🛠️ హ్యాండ్స్-ఆన్**: [Your First Project](docs/chapter-01-foundation/first-project.md) - దశలవారీ ట్యూటోరియల్
- **📋 త్వరిత సూచిక**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### ప్రాక్టికల్ వ్యాయామాలు
```bash
# త్వరిత సంస్థాపన తనిఖీ
azd version

# మీ మొదటి అనువర్తనాన్ని డిప్లాయ్ చేయండి
azd init --template todo-nodejs-mongo
azd up
```

**💡 అధ్యాయ ఫలితం**: AZD ఉపయోగించి Azureలో ఒక సాదాసీదా వెబ్ అప్లికేషన్ విజయవంతంగా డిప్లాయ్ చేయడం

**✅ విజయ నిర్ధారణ:**
```bash
# అధ్యాయం 1 పూర్తి చేసిన తర్వాత, మీరు ఈ పనులు చేయగలుగుతారు:
azd version              # ఇన్‌స్టాల్ చేసిన వెర్షన్ చూపిస్తుంది
azd init --template todo-nodejs-mongo  # ప్రాజెక్ట్‌ను ప్రారంభిస్తుంది
azd up                  # Azureలో డిప్లాయ్ చేస్తుంది
azd show                # ప్రవర్తిస్తున్న యాప్ యొక్క URL ను చూపిస్తుంది
# అప్లికేషన్ బ్రౌజర్లో తెరుచుకొని పని చేస్తుంది
azd down --force --purge  # వనరులను శుభ్రం చేస్తుంది
```

**📊 సమయ పెట్టుబడి:** 30-45 నిమిషాలు  
**📈 పనివిధి తర్వాత స్థాయి:** బేసిక్ అప్లికేషన్లు స్వతంత్రంగా డిప్లాయ్ చేయగలరు
**📈 పనివిధి తర్వాత స్థాయి:** బేసిక్ అప్లికేషన్లు స్వతంత్రంగా డిప్లాయ్ చేయగలరు

---

### 🤖 అధ్యాయం 2: AI-ఫస్ట్ అభివృద్ధి (AI డెవలపర్లకు సిఫార్సు)
**Prerequisites**: Chapter 1 completed  
**Duration**: 1-2 hours  
**Complexity**: ⭐⭐

#### మీరు ఏమి నేర్చుకుంటారు
- AZD తో Microsoft Foundry ఇంటిగ్రేషన్
- AI-శక్తితో ఉన్న అప్లికేషన్లను డిప్లాయ్ చేయడం
- AI సేవలు కాన్ఫిగరేషన్లను అర్థం చేసుకోవడం

#### లెర్నింగ్ రిసోర్సులు
- **🎯 ఇక్కడ ప్రారంభించండి**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI ఏజెంట్స్**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - AZDతో ఇంటెలిజెంట్ ఏజెంట్స్‌ను డిప్లాయ్ చేయండి
- **📖 ప్యాటర్న్స్**: [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) - AI మోడల్స్‌ను డిప్లాయ్ చేయడం మరియు నిర్వహించడం
- **🛠️ వర్క్‌షాప్**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - మీ AI పరిష్కారాలను AZD-రెడీ చేయండి
- **🎥 ఇంటరాక్టివ్ గైడ్**: [Workshop Materials](workshop/README.md) - బ్రౌజర్-ఆధారిత అభ్యాసం MkDocs * DevContainer Environment
- **📋 టెంప్లేట్లు**: [Microsoft Foundry Templates](#workshop-resources)
- **📝 ఉదాహరణలు**: [AZD Deployment Examples](examples/README.md)

#### ప్రాక్టికల్ వ్యాయామాలు
```bash
# మీ మొదటి AI అనువర్తనాన్ని అమల్లో పెట్టండి
azd init --template azure-search-openai-demo
azd up

# అదనపు AI టెంప్లేట్లను ప్రయత్నించండి
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 అధ్యాయ ఫలితం**: RAG సామర్థ్యాలతో ఒక AI-పవర్డ్ చాట్ అప్లికేషన్‌ను డిప్లాయ్ చేసి కాన్ఫిగర్ చేయడం

**✅ విజయ నిర్ధారణ:**
```bash
# అధ్యాయం 2 తర్వాత, మీరు ఈ క్రింది పనులు చేయగలుగుతారు:
azd init --template azure-search-openai-demo
azd up
# AI చాట్ ఇంటర్‌ఫేస్‌ను పరీక్షించండి
# ప్రశ్నలు అడిగి, మూలాలతో పాటు AI ఆధారిత సమాధానాలు పొందండి
# శోధన సమగ్రీకరణ పనిచేస్తుందో ధృవీకరించండి
azd monitor  # Application Insights‌లో టెలిమెట్రీ కనిపిస్తుందో తనిఖీ చేయండి
azd down --force --purge
```

**📊 సమయ పెట్టుబడి:** 1-2 గంటలు  
**📈 పనివిధి తర్వాత స్థాయి:** ప్రొడక్షన్-రెడీ AI అప్లికేషన్లను డిప్లాయ్ చేసి కాన్ఫిగర్ చేయగలరు  
**💰 ఖర్చు అవగాహన:** డెవ్ ఖర్చులు $80-150/నెల, ప్రొడక్షన్ ఖర్చులు $300-3500/నెల వరకు ఉండొచ్చు

#### 💰 AI డిప్లాయ్‌మెంట్స్ కోసం ఖర్చు విచారణ

**Development Environment (Estimated $80-150/month):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/month (based on token usage)
- AI Search (Basic tier): $75/month
- Container Apps (Consumption): $0-20/month
- Storage (Standard): $1-5/month

**Production Environment (Estimated $300-3,500+/month):**
- Microsoft Foundry Models (PTU for consistent performance): $3,000+/month OR Pay-as-go with high volume
- AI Search (Standard tier): $250/month
- Container Apps (Dedicated): $50-100/month
- Application Insights: $5-50/month
- Storage (Premium): $10-50/month

**💡 ఖర్చు ఆప్టిమైజేషన్ సూచనలు:**
- నేర్చుకునే ప్రక్రియ కోసం **Free Tier** Microsoft Foundry Models ఉపయోగించండి (Azure OpenAI 50,000 tokens/నెలతో చేరిక)
- సક્રియంగా అభివృద్ధి చేయట్లేదంటే వనరులను విడుదల చేయడానికి `azd down` ను నడపండి
- ప్రొడక్షన్ కోసం మాత్రమే PTUకి అప్గ్రేడ్ చేయండి; మొదట consumption-based బిల్లింగ్ తో మొదలు పెట్టండి
- డిప్లాయ్‌మెంట్ నుండి ముందే ఖర్చులను అంచనా వేయడానికి `azd provision --preview` ఉపయోగించండి
- ఆటో-స్కేలింగ్‌ను ఎనేబుల్ చేయండి: వాస్తవ వినియోగానికి మాత్రమే చెల్లించండి

**Cost Monitoring:**
```bash
# అంచనా నెలవారీ ఖర్చులను తనిఖీ చేయండి
azd provision --preview

# Azure పోర్టల్‌లో వాస్తవ ఖర్చులను పర్యవేక్షించండి
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ అధ్యాయం 3: కాన్ఫిగరేషన్ & ఎథెంటికేషన్
**Prerequisites**: Chapter 1 completed  
**Duration**: 45-60 minutes  
**Complexity**: ⭐⭐

#### మీరు ఏమి నేర్చుకుంటారు
- ఎన్విరాన్మెంట్ కాన్ఫిగరేషన్ మరియు నిర్వహణ
- ఆథెంటికేషన్ మరియు భద్రత బెస్ట్ ప్రాక్టీసులు
- రిసోర్సు నేమింగ్ మరియు ఆర్గనైజేషన్

#### లెర్నింగ్ రిసోర్సులు
- **📖 కాన్ఫిగరేషన్**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - ఎన్విరాన్మెంట్ సెటప్
- **🔐 భద్రత**: [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - ఆథెంటికేషన్ ప్యాటర్న్స్
- **📝 ఉదాహరణలు**: [Database App Example](examples/database-app/README.md) - AZD డేటాబేస్ ఉదాహరణలు

#### ప్రాక్టికల్ వ్యాయామాలు
- dev, staging, prod వంటి బహు ఎన్విరాన్మెంట్లను కాన్ఫిగర్ చేయండి
- మేనేజ్డ్ ఐడెంటిటీ ఆథెంటికేషన్ సెటప్ చేయండి
- ఎన్విరాన్మెంట్-స్పెసిఫిక్ కాన్ఫిగరేషన్లు అమలు చేయండి

**💡 అధ్యాయ ఫలితం**: సరైన ఆథెంటికేషన్ మరియు భద్రతతో బహు ఎన్విరాన్మెంట్లను నిర్వహించగలగడం

---

### 🏗️ అధ్యాయం 4: Infrastructure as Code & Deployment
**Prerequisites**: Chapters 1-3 completed  
**Duration**: 1-1.5 hours  
**Complexity**: ⭐⭐⭐

#### మీరు ఏమి నేర్చుకుంటారు
- అడ్వాన్స్‌డ్ డిప్లాయ్‌మెంట్ ప్యాటర్న్స్
- Bicep తో Infrastructure as Code
- రిసోర్సు ప్రొవిజనింగ్ వ్యూహాలు

#### లెర్నింగ్ రిసోర్సులు
- **📖 డిప్లాయ్‌మెంట్**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - పూర్తి వర్క్‌ఫ్లోలు
- **🏗️ ప్రొవిజనింగ్**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Azure రిసోర్సు నిర్వహణ
- **📝 ఉదాహరణలు**: [Container App Example](../../examples/container-app) - కంటెయినర్ చేయబడిన డిప్లాయ్‌మెంట్‌లు

#### ప్రాక్టికల్ వ్యాయామాలు
- కస్టమ్ Bicep టెంప్లేట్లను సృష్టించండి
- బహు-సేవ అప్లికేషన్లను డిప్లాయ్ చేయండి
- బ్లూ-గ్రీన్ డిప్లాయ్‌మెంట్ వ్యూహాలను అమలు చేయండి

**💡 అధ్యాయ ఫలితం**: కస్టమ్ ఇన్‌ఫ్రాస్ట్రక్చర్ టెంప్లేట్లను ఉపయోగించి కాంప్లెక్స్ బహు-సేవ అప్లికేషన్లను డిప్లాయ్ చేయగలగడం
### 🎯 Chapter 5: Multi-Agent AI Solutions (Advanced)
**Prerequisites**: Chapters 1-2 completed  
**Duration**: 2-3 hours  
**Complexity**: ⭐⭐⭐⭐

#### What You'll Learn
- Multi-agent architecture patterns
- Agent orchestration and coordination
- Production-ready AI deployments

#### Learning Resources
- **🤖 Featured Project**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Complete implementation
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - One-click deployment
- **📖 Architecture**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - Patterns

#### Practical Exercises
```bash
# సంపూర్ణ రిటైల్ బహు-ఏజెంట్ పరిష్కారాన్ని అమలు చేయండి
cd examples/retail-multiagent-arm-template
./deploy.sh

# ఏజెంట్ కాన్ఫిగరేషన్లను అన్వేషించండి
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Chapter Outcome**: Deploy and manage a production-ready multi-agent AI solution with Customer and Inventory agents

---

### 🔍 Chapter 6: Pre-Deployment Validation & Planning
**Prerequisites**: Chapter 4 completed  
**Duration**: 1 hour  
**Complexity**: ⭐⭐

#### What You'll Learn
- Capacity planning and resource validation
- SKU selection strategies
- Pre-flight checks and automation

#### Learning Resources
- **📊 Planning**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Resource validation
- **💰 Selection**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Cost-effective choices
- **✅ Validation**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Automated scripts

#### Practical Exercises
- Run capacity validation scripts
- Optimize SKU selections for cost
- Implement automated pre-deployment checks

**💡 Chapter Outcome**: Validate and optimize deployments before execution

---

### 🚨 Chapter 7: Troubleshooting & Debugging
**Prerequisites**: Any deployment chapter completed  
**Duration**: 1-1.5 hours  
**Complexity**: ⭐⭐

#### What You'll Learn
- Systematic debugging approaches
- Common issues and solutions
- AI-specific troubleshooting

#### Learning Resources
- **🔧 Common Issues**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ and solutions
- **🕵️ Debugging**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Step-by-step strategies
- **🤖 AI Issues**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI service problems

#### Practical Exercises
- Diagnose deployment failures
- Resolve authentication issues
- Debug AI service connectivity

**💡 Chapter Outcome**: Independently diagnose and resolve common deployment issues

---

### 🏢 Chapter 8: Production & Enterprise Patterns
**Prerequisites**: Chapters 1-4 completed  
**Duration**: 2-3 hours  
**Complexity**: ⭐⭐⭐⭐

#### What You'll Learn
- Production deployment strategies
- Enterprise security patterns
- Monitoring and cost optimization

#### Learning Resources
- **🏭 Production**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Enterprise patterns
- **📝 Examples**: [Microservices Example](../../examples/microservices) - Complex architectures
- **📊 Monitoring**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Monitoring

#### Practical Exercises
- Implement enterprise security patterns
- Set up comprehensive monitoring
- Deploy to production with proper governance

**💡 Chapter Outcome**: Deploy enterprise-ready applications with full production capabilities

---

## 🎓 Workshop Overview: Hands-On Learning Experience

> **⚠️ WORKSHOP STATUS: Active Development**  
> The workshop materials are currently being developed and refined. Core modules are functional, but some advanced sections are incomplete. We're actively working to complete all content. [Track progress →](workshop/README.md)

### Interactive Workshop Materials
**Comprehensive hands-on learning with browser-based tools and guided exercises**

Our workshop materials provide a structured, interactive learning experience that complements the chapter-based curriculum above. The workshop is designed for both self-paced learning and instructor-led sessions.

#### 🛠️ Workshop Features
- **Browser-Based Interface**: Complete MkDocs-powered workshop with search, copy, and theme features
- **GitHub Codespaces Integration**: One-click development environment setup
- **Structured Learning Path**: 8-module guided exercises (3-4 hours total)
- **Progressive Methodology**: Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
- **Interactive DevContainer Environment**: Pre-configured tools and dependencies

#### 📚 Workshop Module Structure
The workshop follows an **8-module progressive methodology** that takes you from discovery to deployment mastery:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Introduction** | Workshop Overview | Understand learning objectives, prerequisites, and workshop structure | 15 min |
| **1. Selection** | Template Discovery | Explore AZD templates and select the right AI template for your scenario | 20 min |
| **2. Validation** | Deploy & Verify | Deploy the template with `azd up` and validate infrastructure works | 30 min |
| **3. Deconstruction** | Understand Structure | Use GitHub Copilot to explore template architecture, Bicep files, and code organization | 30 min |
| **4. Configuration** | azure.yaml Deep Dive | Master `azure.yaml` configuration, lifecycle hooks, and environment variables | 30 min |
| **5. Customization** | Make It Yours | Enable AI Search, tracing, evaluation, and customize for your scenario | 45 min |
| **6. Teardown** | Clean Up | Safely deprovision resources with `azd down --purge` | 15 min |
| **7. Wrap-up** | Next Steps | Review accomplishments, key concepts, and continue your learning journey | 15 min |

**Workshop Flow:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Getting Started with the Workshop
```bash
# వికల్పం 1: GitHub Codespaces (సిఫార్సు చేయబడింది)
# రిపోజిటరీలో "Code" → "Create codespace on main"పై క్లిక్ చేయండి

# వికల్పం 2: స్థానిక అభివృద్ధి
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md లోని సెటప్ సూచనలను అనుసరించండి
```

#### 🎯 Workshop Learning Outcomes
By completing the workshop, participants will:
- **Deploy Production AI Applications**: Use AZD with Microsoft Foundry services
- **Master Multi-Agent Architectures**: Implement coordinated AI agent solutions
- **Implement Security Best Practices**: Configure authentication and access control
- **Optimize for Scale**: Design cost-effective, performant deployments
- **Troubleshoot Deployments**: Resolve common issues independently

#### 📖 Workshop Resources
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Browser-based learning environment
- **📋 Module-by-Module Instructions**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - Workshop overview and objectives
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - Find and select AI templates
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - Deploy and verify templates
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explore template architecture
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - Master azure.yaml
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - Customize for your scenario
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Clean up resources
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - Review and next steps
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-focused exercises
- **💡 Quick Start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Environment configuration

**Perfect for**: Corporate training, university courses, self-paced learning, and developer bootcamps.

---

## 📖 Deep Dive: AZD Capabilities

Beyond the basics, AZD provides powerful features for production deployments:

- **Template-based deployments** - Use pre-built templates for common application patterns
- **Infrastructure as Code** - Manage Azure resources using Bicep or Terraform  
- **Integrated workflows** - Seamlessly provision, deploy, and monitor applications
- **Developer-friendly** - Optimized for developer productivity and experience

### **AZD + Microsoft Foundry: Perfect for AI Deployments**

**Why AZD for AI Solutions?** AZD addresses the top challenges AI developers face:

- **AI-Ready Templates** - Pre-configured templates for Microsoft Foundry Models, Azure AI Services, and ML workloads
- **Secure AI Deployments** - Built-in security patterns for AI services, API keys, and model endpoints  
- **Production AI Patterns** - Best practices for scalable, cost-effective AI application deployments
- **End-to-End AI Workflows** - From model development to production deployment with proper monitoring
- **Cost Optimization** - Smart resource allocation and scaling strategies for AI workloads
- **Microsoft Foundry Integration** - Seamless connection to Microsoft Foundry model catalog and endpoints

---

## 🎯 Templates & Examples Library

### Featured: Microsoft Foundry Templates
**Start here if you're deploying AI applications!**

> **Note:** These templates demonstrate various AI patterns. Some are external Azure Samples, others are local implementations.

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | External |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapter 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| External |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | External |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | External |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | External |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | External |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### Featured: Complete Learning Scenarios
**Production-ready application templates mapped to learning chapters**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | Basic AI deployment patterns |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | RAG implementation with Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapter 4 | ⭐⭐ | Document Intelligence integration |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | Agent framework and function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐ | Enterprise AI orchestration |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | Multi-agent architecture with Customer and Inventory agents |

### Learning by Example Type

> **📌 Local vs. External Examples:**  
> **Local Examples** (in this repo) = Ready to use immediately  
> **External Examples** (Azure Samples) = Clone from linked repositories

#### Local Examples (Ready to Use)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Complete production-ready implementation with ARM templates
  - Multi-agent architecture (Customer + Inventory agents)
  - Comprehensive monitoring and evaluation
  - One-click deployment via ARM template

#### Local Examples - Container Applications (Chapters 2-5)
**Comprehensive container deployment examples in this repository:**
- [**కంటెయినర్ యాప్ ఉదాహరణలు**](examples/container-app/README.md) - కంటెయినర్ చేయబడిన డిప్లాయ్‌మెంట్‌లకు పూర్తి మార్గదర్శకం
  - [సింపుల్ Flask API](../../examples/container-app/simple-flask-api) - స్కేల్-టు-జీరో తో మౌలిక REST API
  - [మైక్రోసర్వీసెస్ ఆర్కిటెక్చర్](../../examples/container-app/microservices) - ప్రొడక్షన్-సిద్దమైన బహు-సేవా డిప్లాయ్‌మెంట్
  - తొందరగా ప్రారంభం, ప్రొడక్షన్, మరియు అధునాతन డిప్లాయ్‌మెంట్ నమూనాలు
  - మానిటరింగ్, భద్రత, మరియు ఖర్చు ఆప్టిమైజేషన్ మార్గదర్శనం

#### బాహ్య ఉదాహరణలు - సరళమైన అనువర్తనాలు (అధ్యాయాలు 1-2)
**ప్రారంభించడానికి ఈ Azure నమూనా రిపాజిటరీలను క్లోన్ చేయండి:**
- [సరళమైన వెబ్ యాప్ - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - ప్రాథమిక డిప్లాయ్‌మెంట్ నమూనాలు
- [స్టాటిక్ వెబ్‌సైట్ - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - స్టాటిక్ కంటెంట్ డిప్లాయ్‌మెంట్
- [కంటెయినర్ యాప్ - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API డిప్లాయ్‌మెంట్

#### బాహ్య ఉదాహరణలు - డేటాబేస్ ఇంటిగ్రేషన్ (అధ్యాయము 3-4)  
- [డేటాబేస్ యాప్ - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - డేటాబేస్ కనెక్టివిటీ నమూనాలు
- [ఫంక్షన్స్ + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - సర్వర్లెస్ డేటా వర్క్‌ఫ్లో

#### బాహ్య ఉదాహరణలు - అధునాతన నమూనాలు (అధ్యాయాలు 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - బహు-సేవా ఆర్కిటెక్చర్‌లు
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - బ్యాక్‌గ్రౌండ్ ప్రాసెసింగ్  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - ప్రొడక్షన్-సిద్దమైన ML నమూనాలు

### బాహ్య టెంప్లేట్ సేకరణలు
- [**అధికారిక AZD టెంప్లేట్ గ్యాలరీ**](https://azure.github.io/awesome-azd/) - అధికారిక మరియు కమ్యూనిటీ టెంప్లేట్‌ల క్యూరేటెడ్ సేకరణ
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn టెంప్లేట్ డాక్యుమెంటేషన్
- [**Examples Directory**](examples/README.md) - వివరమైన వివరణలతో స్థానిక అభ్యాస ఉదాహరణలు

---

## 📚 అభ్యాస వనరులు & సూచనాలు

### సంక్షిప్త సూచనలు
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - అధ్యాయాల వారీగా ఏర్పాటు చేసిన అవసరమైన azd కమాండ్లు
- [**Glossary**](resources/glossary.md) - Azure మరియు azd పదసంపద  
- [**FAQ**](resources/faq.md) - అధ్యాయాల వారీగా ఏర్పాటు చేసిన సాధారణ ప్రశ్నలు
- [**Study Guide**](resources/study-guide.md) - వివరమైన ఆచరణ అభ్యాసాలు

### ప్రాక్టికల్ వర్క్‌షాప్లు
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - మీ AI పరిష్కారాలను AZD ద్వారా డిప్లాయ్ చేయదగినవిగా చేయండి (2-3 గంటలు)
- [**Interactive Workshop**](workshop/README.md) - MkDocs మరియు GitHub Codespaces సహా 8 మాడ్యూల్ మార్గదర్శక అభ్యాసాలు
  - అనుసరిస్తుంది: పరిచయం → ఎంపిక → ధ్రువీకరణ → విఘటన → కాన్ఫిగరేషన్ → అనుకూలీకరణ → టియర్-డౌన్ → సమాప్తి

### బాహ్య అభ్యాస వనరులు
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### మీ ఎడిటర్ కోసం AI ఏజెంట్ నైపుణ్యాలు
- [**skills.sh లో Microsoft Azure నైపుణ్యాలు**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI, Foundry, deployment, diagnostics, ఖర్చు ఆప్టిమైజేషన్ మరియు మరిన్ని కోసం 37 ఓపెన్ ఏజెంట్ నైపుణ్యాలు. వాటిని GitHub Copilot, Cursor, Claude Code, లేదా ఏనైనా మద్దతు పొందిన ఏజెంట్‌లో ఇన్‌స్టాల్ చేయండి:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 తక్షణ సమస్య పరిష్కారం గైడ్

**ప్రారంభికులు ఎదురుకొనే సాధారణ సమస్యలు మరియు తక్షణ పరిష్కారాలు:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# ముందుగా AZD ఇన్స్టాల్ చేయండి
# విండోస్ (పవర్‌షెల్):
winget install microsoft.azd

# మ్యాక్‌ఓఎస్:
brew tap azure/azd && brew install azd

# లినక్స్:
curl -fsSL https://aka.ms/install-azd.sh | bash

# ఇన్స్టాలేషన్‌ను ధృవీకరించండి
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

# లేదా అభివృద్ధిలో చిన్న SKUs ఉపయోగించండి
# infra/main.parameters.json ని సవరించండి:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# ఆప్షన్ 1: శుభ్రపరచి మళ్లీ ప్రయత్నించండి
azd down --force --purge
azd up

# ఆప్షన్ 2: కేవలం ఇన్‌ఫ్రాస్ట్రక్చర్‌ను సరిచేయండి
azd provision

# ఆప్షన్ 3: వివరమైన స్థితిని తనిఖీ చేయండి
azd show

# ఆప్షన్ 4: Azure Monitorలో లాగ్‌లను తనిఖీ చేయండి
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# AZD కోసం మళ్లీ ప్రామాణీకరించండి
azd auth logout
azd auth login

# ఐచ్ఛికం: మీరు az కమాండ్లు నడిపిస్తే Azure CLI ను కూడా తాజాకరించండి
az logout
az login

# ప్రామాణీకరణను ధృవీకరించండి
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD ప్రత్యేక పేర్లను సృష్టిస్తుంది, కానీ పేరుపోటు ఉన్నప్పుడు:
azd down --force --purge

# తర్వాత కొత్త పరిసరంతో మరోసారి ప్రయత్నించండి
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**సాధారణ వేచి ఉండే సమయాలు:**
- సరళమైన వెబ్ యాప్: 5-10 నిమిషాలు
- డేటాబేస్ తో ఉన్న యాప్: 10-15 నిమిషాలు
- AI అనువర్తనాలు: 15-25 నిమిషాలు (OpenAI ప్రొవిజనింగ్ మందగిస్తుంది)

```bash
# ప్రగతిని తనిఖీ చేయండి
azd show

# 30 నిమిషాలకు పైగా నిలిచిపోతే, Azure పోర్టల్‌ను తనిఖీ చేయండి:
azd monitor --overview
# విఫలమైన డిప్లాయ్‌మెంట్లను చూడండి
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# మీ Azure పాత్రను తనిఖీ చేయండి
az role assignment list --assignee $(az account show --query user.name -o tsv)

# మీకు కనీసం "Contributor" పాత్ర అవసరం
# మీ Azure అడ్మిన్‌కు అనుమతులు ఇవ్వమని అడగండి:
# - Contributor (వనరుల కోసం)
# - User Access Administrator (పాత్రల కేటాయింపుల కోసం)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# అన్ని సేవా ఎండ్పాయింట్లను చూపించండి
azd show

# లేదా Azure పోర్టల్‌ను తెరవండి
azd monitor

# నిర్దిష్ట సేవను తనిఖీ చేయండి
azd env get-values
# *_URL వేరియబుల్స్ కోసం వెతకండి
```
</details>

### 📚 పూర్తి సమస్య పరిష్కార వనరులు

- **సాధారణ సమస్యల గైడ్:** [వివరమైన పరిష్కారాలు](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-సంబంధిత సమస్యలు:** [AI సమస్య పరిష్కారం](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **డీబగ్గింగ్ గైడ్:** [దశలవారీ డీబగ్గింగ్](docs/chapter-07-troubleshooting/debugging.md)
- **సహాయం పొందండి:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 కోర్సు పూర్తి & సర్టిఫికేషన్

### పురోగతి ట్రాకింగ్
ప్రతి అధ్యాయం ద్వారా మీ అభ్యాస పురోగతిని ట్రాక్ చేయండి:

- [ ] **అధ్యాయం 1**: మూలకాంశాలు & త్వరిత ప్రారంభం ✅
- [ ] **అధ్యాయం 2**: AI-ప్రధాన అభివృద్ధి ✅  
- [ ] **అధ్యాయం 3**: కాన్ఫిగరేషన్ & ఆథెంటికేషన్ ✅
- [ ] **అధ్యాయం 4**: కోడ్ రూపంలో ఇన్ఫ్రాస్ట్రక్చర్ & డిప్లాయ్‌మెంట్ ✅
- [ ] **అధ్యాయం 5**: బహుఎజెంట్ AI పరిష్కారాలు ✅
- [ ] **అధ్యాయం 6**: ముందస్తు డిప్లాయ్‌మెంట్ ధృవీకరణ & ప్రణాళిక ✅
- [ ] **అధ్యాయం 7**: సమస్య పరిష్కారం & డీబగ్గింగ్ ✅
- [ ] **అధ్యాయం 8**: ప్రొడక్షన్ & ఎంటర్‌ప్రైజ్ నమూనాలు ✅

### అభ్యాస ధృవీకరణ
ప్రతి అధ్యాయాన్ని పూర్తిచేసాక, మీ జ్ఞానాన్ని ఈ విధంగా ధృవీకరించండి:
1. **ప్రాక్టికల్ ఎక్సర్సైజ్**: అధ్యాయపు హ్యాండ్‌స్ఓన్ డిప్లాయ్‌మెంట్ పూర్తిచేయండి
2. **జ్ఞాన తనిఖీ**: మీ అధ్యాయానికి సంబంధించిన FAQ విభాగాన్ని సమీక్షించండి
3. **సముదాయ చర్చ**: మీ అనుభవాన్ని Azure Discordలో పంచుకోండి
4. **తరువాతి అధ్యాయం**: తదుపరి క్లిష్టత స్థాయికి వెళ్లండి

### కోర్స్ పూర్తి ప్రయోజనాలు
అన్ని అధ్యాయాలను పూర్తిచేసిన తర్వాత, మీకు ఈ విషయాలు కలుగుతాయి:
- **ప్రొడాక్షన్ అనుభవం**: నిజమైన AI అనువర్తనాలను Azureలో డిప్లాయ్ చేయడం
- **వృత్తిపర నైపుణ్యాలు**: ఎంటర్‌ప్రైజ్-తయారైన డిప్లాయ్‌మెంట్ సామర్థ్యాలు  
- **సముదాయ గుర్తింపు**: Azure డెవలపర్ కమ్యూనిటీలో సక్రియ సభ్యుడు
- **ఉద్యోగ పురోగతి**: డిమాండ్ ఉన్న AZD మరియు AI డిప్లాయ్‌మెంట్ నైపుణ్యాలు

---

## 🤝 సముదాయం & మద్దతు

### సహాయం & మద్దతు పొందండి
- **సాంకేతిక సమస్యలు**: [బగ్స్ నివేదించండి మరియు ఫీచర్లను అభ్యర్థించండి](https://github.com/microsoft/azd-for-beginners/issues)
- **అభ్యాస ప్రశ్నలు**: [Microsoft Azure Discord సముదాయం](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-స్పెసిఫిక్ సహాయం**: చేరండి [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **డాక్యుమెంటేషన్**: [అధికారిక Azure Developer CLI డాక్యుమెంటేషన్](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord నుంచి సముదాయ అవగాహనలు

**#Azure ఛానల్ నుండి తాజా పోల రిజల్ట్‌లు:**
- **45%** డెవలపర్లు AZD ని AI వర్క్లోడ్స్ కోసం ఉపయోగించాలని కోరుకుంటున్నారు
- **ప్రధాన సవాళ్లు**: బహు-సేవా డిప్లాయ్‌మెంట్‌లు, క్రెడెన్షియల్ నిర్వహణ, ప్రొడక్షన్ సిద్ధత  
- **అత్యంత అభ్యర్థించినవి**: AI-స్పెసిఫిక్ టెంప్లేట్లు, ట్రబుల్షూటింగ్ గైడ్‌లు, ఉత్తమ ఆచారాలు

**మాకు చేరి మీరు:**
- మీ AZD + AI అనుభవాలు పంచుకోండి మరియు సహాయం పొందండి
- కొత్త AI టెంప్లేట్ల ప్రారంభ ప్రివ్యూలకు యాక్సెస్ పొందండి
- AI డిప్లాయ్‌మెంట్ ఉత్తమ ఆచారాలకు సహకారం చేయండి
- భవిష్యత్ AI + AZD ఫీచర్ అభివృద్ధిపై ప్రభావం చూపండి

### కోర్సుకు కాంట్రిబ్యూట్ చేయడం
మేము కాంట్రిబ్యూషన్లను స్వాగతిస్తాము! వివరాలకు దయచేసి మా [Contributing Guide](CONTRIBUTING.md) ను చదవండి:
- **కంటెంట్ మెరుగుదలలు**: ఉన్న అధ్యాయాలు మరియు ఉదాహరణలను మెరుగుపరుచండి
- **కొత్త ఉదాహరణలు**: వాస్తవ ప్రపంచ పరిస్థితులు మరియు టెంప్లేట్లు జోడించండి  
- **భాషా అనువాదం**: బహుభాషా మద్దతు నిర్వహించడంలో సహాయం చేయండి
- **బగ్ నివేదికలు**: ఖచ్చితత్వం మరియు స్పష్టతను మెరుగుపరుచండి
- **సముదాయ ప్రమాణాలు**: మా సమూహ అనుకూల మార్గదర్శకాలను అనుసరించండి

---

## 📄 కోర్సు సమాచారం

### లైసెన్స్
ఈ ప్రాజెక్ట్ MIT లైసెన్స్ క్రింద లైసెన్స్ చేయబడింది - వివరాలకు [LICENSE](../../LICENSE) ఫైల్ చూడండి.

### సంబంధిత Microsoft అభ్యాస వనరుల

మా బృందం ఇతర విస్తృత అభ్యాస కోర్సులను ఉత్పత్తి చేస్తుంది:

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
[![జెనరేటివ్ AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### ప్రధాన అభ్యాసం
[![ప్రారంభకులకు ML](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![ప్రారంభకులకు డేటా సైన్స్](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![ప్రారంభకులకు AI](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![ప్రారంభకులకు సైబర్ సెక్యూరిటీ](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![ప్రారంభకులకు వెబ్ అభివృద్ధి](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![ప్రారంభకులకు IoT](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![ప్రారంభకులకు XR అభివృద్ధి](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### కోపైలట్ సిరీస్
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Course Navigation

**🚀 నేర్చుకోవడం ప్రారంభించడానికి సిద్ధమా?**

**ప్రారంభకులు**: Start with [అధ్యాయం 1: ఆధారం & త్వరిత ప్రారంభం](#-chapter-1-foundation--quick-start)  
**AI డెవలపర్లు**: Jump to [అధ్యాయం 2: AI-ముఖ్య అభివృద్ధి](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**అనుభవజ్ఞులైన డెవలపర్లు**: Begin with [అధ్యాయం 3: కాన్ఫిగరేషన్ & ప్రమాణీకరణ](#️-chapter-3-configuration--authentication)

**తదుపరి దశలు**: [అధ్యాయం 1 ప్రారంభించండి - AZD Basics](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->