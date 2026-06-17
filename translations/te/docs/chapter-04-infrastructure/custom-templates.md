# మీ స్వంత azd టెంప్లేట్ రూపొందించడం

**అధ్యాయం నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభికులు](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 4 - ఇన్ఫ్రాస్ట్రక్చర్ (Infrastructure as Code) మరియు డిప్లాయ్‌‌మెంట్
- **⬅️ మునుపటి**: [డిప్లాయ్‌మెంట్ గైడ్](deployment-guide.md)
- **🚀 తదుపరి అధ్యాయం**: [అధ్యాయం 5: బహుఏజెంట్ పరిష్కారాలు](../chapter-05-multi-agent/README.md)

> జూన్ 2026లో `azd 1.25.6` తో ధృవీకరించబడింది.

## పరిచయం

ఇప్పటివరకు మీరు *ఉపయోగించారు* `azd init --template <name>` తో టెంప్లేట్స్. కానీ ఒక ప్రాజెక్ట్ లేఅవుట్ మీ జట్టుకు నచ్చిన తర్వాత — ఉదాహరణకి, Cosmos DB మరియు సరైన మానిటరింగ్ ఉన్న Container App — మీరు దాన్ని మీ స్వంత పునర్వినియోగయోగ్య టెంప్లేట్గా మార్చాలనుకుంటారు. టెంప్లేట్ అనేది azd చదవగల ఒక నిర్దిష్ట నిర్మాణం కలిగిన Git రిపోజిటరీ మాత్రమే. ఈ పాఠం మీకు ఒకటి మొదలుండి నిర్మించటం, పరీక్షించటం, మరియు (ఐచ్ఛికంగా) కమ్యూనిటీ గ్యాలరీలో ప్రచురించడం ఎలా చేయాలో చూపిస్తుంది.

## అభ్యసన లక్ష్యాలు

ఈ పాఠం ముగిసినప్పుడు, మీరు:
- ఒక ఫోల్డర్‌ని "azd టెంప్లేట్" చేస్తే ఏది అనేది అర్థం చేసుకుంటారు
- అవసరమైన ఫైళ్ళు మరియు ఫోల్డర్ అమరికను తెలుసుకుంటారు
- ఇతరులు పునర్వినియోగం చేయగలిగే `azure.yaml` మరియు `infra/` జోడిస్తారు
- షేరింగ్ ముందు మీ టెంప్లేట్‌ను స్థానికంగా పరీక్షిస్తారు
- దాన్ని ప్రచురించి (ఐచ్ఛికంగా) Awesome AZD కి సమర్పిస్తారు

## నేర్చుకున్న ఫలితాలు

ఈ పాఠం పూర్తి చేసిన తర్వాత, మీరు చేయగలుగుతారు:
- ఒక కొత్త టెంప్లేట్ రిపోసిటరీని స్కాఫోల్డ్ చేయడం
- ఇన్ఫ్రాస్ట్రక్చర్‌ను పరామెటరైజ్ చేయడం ώστε ఇది ఏ సబ్‌స్క్రిప్షన్‌లోనైనా పని చేయగలుగుతుందో
- `azd init` మరియు `azd up` తో టెంప్లేట్‌ను ధృవీకరించటం
- కమ్యూనిటీ గ్యాలరీకి అవసరమైన మెటాడేటాను జోడించటం

---

## టెంప్లేట్ అంటే నిజంగా ఏమిటి?

An azd template అనేది **Git రిపోజిటరీ** మాత్రమే, ఇది కనీసం కలిగి ఉంటుంది:

| ఫైల్ / ఫోల్డర్ | ప్రయోజనం | అవసరమా? |
|---------------|---------|-----------|
| `azure.yaml` | సేవలు, హోస్ట్లు, మరియు ఇన్ఫ్రా ప్రొవైడర్‌ను వివరಿಸುತ್ತದೆ | ✅ అవును |
| `infra/` | వనరులను ప్రావిజన్ చేసే Bicep, Terraform, లేదా Pulumi | ✅ అవును |
| `src/` (లేదా మీ కోడ్) | azd డిప్లాయ్ చేసే అప్లికేషన్ కోడ్ | ✅ అవును |
| `README.md` | టెంప్లెట్‌ను ఎలా ఉపయోగించాలో | ✅ బలంగా సిఫార్సు చేయబడింది |
| `.azdo/` లేదా `.github/` | CI/CD పైప్‌లైన్ నిర్వచనలు | ఐచ్ఛికం |
| `.devcontainer/` | పునరుత్పాదక డెవలపర్ వాతావరణం | ఐచ్ఛికం |
| `azure.yaml` `metadata` | గ్యాలరీ + టెలిమెట్రీ సమాచారం | ఐచ్ఛికం (ప్రచురణకు అవసరం) |

ఇక్కడ ఏదైనా మాయాజాలం లేదు: మీరు `azd init --template you/your-repo` నడిపినపుడు, azd రిపోనని క్లోన్ చేస్తుంది మరియు `azure.yaml` ను చదువుతుంది.

---

## స్టెప్ 1: రిపోజిటరీని స్కాఫోల్డ్ చేయడం

ఫోల్డర్ నిర్మాణాన్ని చేతితో సృష్టించండి లేదా ఒక కనిష్ట టెంప్లేట్ నుంచి మొదలుపెట్టి మార్చండి:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# సాధారణ అమరికను సృష్టించండి
mkdir -p src infra
```

సాధారణంగా పూర్తయిన లేఅవుట్ ఇలా ఉంటుంది:

```
my-azd-template/
├── azure.yaml              # ← template definition
├── README.md               # ← how to use it
├── infra/
│   ├── main.bicep          # entry point
│   ├── main.parameters.json
│   └── modules/
│       └── web.bicep
├── src/
│   └── app/                # your application code
└── .github/
    └── workflows/
        └── azure-dev.yml   # optional CI/CD
```

---

## స్టెప్ 2: `azure.yaml` రాయండి

ఇది టెంప్లేట్ హార్ట్. ఇది azd కి ఏమి ఎలా డిప్లాయ్ చేయాలో చెబుతుంది:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # or "terraform" / "pulumi"
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> `metadata.template` ఫీల్డ్ గ్యాలరీ టెలిమెట్రీ వాడుకను లెక్కించడానికి ఉపయోగించబడుతుంది. `name@version` కన్వెన్షన్ ఉపయోగించండి.

---

## స్టెప్ 3: ఇన్ఫ్రాస్ట్రక్చర్‌ను పారామెటర్ చేయండి

ఒక *పునర్వినియోగయోగ్య* టెంప్లేట్ కోసం అత్యంత ముఖ్యమైన నియమం: **పేర్లు, ప్రాంతాలు, లేదా సబ్‌స్క్రిప్షన్-నిర్దిష్ట విలువలను ఎప్పుడూ హార్డ్‌కోడ్ చేయకండి.** పారామెటర్లు మరియు resource token ప్యాటర్న్‌ను ఉపయోగించండి ఇలా అయితే అదే టెంప్లేట్ ఎవరి సబ్‌స్క్రిప్షన్‌లోనైనా పని చేస్తుంది.

```bicep
// infra/main.bicep
targetScope = 'resourceGroup'

@minLength(1)
@description('Primary location for all resources')
param location string = resourceGroup().location

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

module web 'modules/web.bicep' = {
  name: 'web'
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

ఇదిని టెంప్లేట్-ఫ్రెండ్లీ చేయడానికి రెండు విషయాలు ఉన్నాయి:

1. **`azd-env-name` ట్యాగ్** — azd దీన్ని వాతావరణానికి అనుగుణంగా వనరులను ట్రాక్ చేసి క్లీనప్ చేయడానికి ఉపయోగిస్తుంది.
2. **`uniqueString(...)` resource token** — స్థిరమైన, గ్లోబల్లీ-యూనిక్ సఫిక్స్ ఉత్పత్తి చేస్తుంది కాబట్టి పేర్లు ఇరుపైలేని విధంగా ఉండవు.

పరస్పరమైన పారామితి ఫైల్‌ను అందించండి, అది azd వాతావరణం నుండి ఇంజెక్ట్ చేసే విలువలను చదువుతుంది:

```json
// infra/main.parameters.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd ప్రస్తుత వాతావరణం నుండి `${AZURE_ENV_NAME}` మరియు `${AZURE_LOCATION}` ను స్వయంచాలకంగా నిలుపుతుంది.

---

## స్టెప్ 4: స్థానికంగా మీ టెంప్లేట్‌ను పరీక్షించండి

షేరింగ్ చేయక ముందు, క్లిన్ స్టేట్ నుండి టెంప్లేట్ పనిచేస్తుందో కాదో నిరూపించండి.

**స్థానిక ఫోల్డర్ నుండి పరీక్షించండి** (Git push అవసరం లేదు):

```bash
# ఖాళీ డైరెక్టరీ నుంచి, మీ స్థానిక టెంప్లేట్ పథాన్ని ఉపయోగించి ప్రారంభించండి
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# ప్రావిజన్ చేసి ఎండ్-టు-ఎండ్ గా డిప్లాయ్ చేయండి
azd auth login
azd up
```

**తర్వాత teardown పరీక్షించండి**—ఒక మంచి టెంప్లేట్ పూర్తిగా క్లీనప్ చేస్తుంది:

```bash
azd down --force --purge
```

`azd down` వనరులను వెనక్కు వదిలెడితే, మీరు ఒక వనరుపై `azd-env-name` ట్యాగ్ దాటా నిర్లక్ష్యపరచారంలో ఉంటారు.

> **సూచన:** ముందు `azd provision --preview` నడపండి. ఇది ఒక what-if చేస్తుంది మరియు ఏవైనా వనరులు సృష్టించకుండానే టెంప్లేట్ లో పొరపాట్లు బయటిస్తుంది.

---

## స్టెప్ 5: టెంప్లేట్ ప్రచురించండి

రిపోసిటరిని GitHub కు push చేయండి (ఇంట్లో ఇతరులు కూడా ఉపయోగించాలంటే public గా):

```bash
gh repo create my-azd-template --public --source=. --push
```

ఇప్పుడు ఎవ్వరైనా దీన్ని ఉపయోగించుకోవచ్చు:

```bash
azd init --template your-github-username/my-azd-template
```

---

## స్టెప్ 6 (ఐచ్ఛికం): Awesome AZD కు సమర్పించండి

[Awesome AZD గ్యాలరీ](https://azure.github.io/awesome-azd/) కమ్యూనిటీ టెంప్లేట్లను జాబితా చేస్తుంది. జాబితాలో చేరడానికి మీ రిపోలో ఈవాటిని కలిగి ఉండాలి:

- ✅ స్పష్టమైన `README.md` — ముందస్తు అవసరాలు, ఆర్కిటెక్చర్ డయాగ్రామ్, మరియు ఖర్చు గమనికలతో
- ✅ `metadata.template` ఉన్న పని చేసే `azure.yaml`
- ✅ కొత్త సబ్‌స్క్రిప్షన్‌లో శుభ్రంగా ప్రావిజన్ అయ్యే ఇన్ఫ్రాస్ట్రక్చర్
- ✅ ఒక `LICENSE` ఫైల్
- ✅ (సిఫార్సు) ఒక-క్లిక్ Codespaces కోసం `.devcontainer/`

మీ టెంప్లేట్‌ను గ్యాలరీ డేటా ఫైల్‌లో జోడించే పుల్ రిక్వెస్ట్ ని کھୋలడం ద్వారా సమర్పించండి, [Awesome AZD రిపోజిటరీ](https://github.com/Azure/awesome-azd) లోని కాంట్రిబ్యూషన్ గైడ్‌ను అనుసరించండి.

---

## సాధారణ తప్పిదాలు

| తప్పు | పరిష్కారం |
|---------|-----|
| హార్డ్కోడ్ చేయబడ్డ వనరు పేర్లు | `uniqueString()` resource token ఉపయోగించండి |
| `azd down` వనరులను వదిలేస్తుంది | ప్రతి వనరును (లేదా రిసోర్సు గ్రూప్) `azd-env-name` తో ట్యాగ్ చేయండి |
| టెంప్లేట్ మీకోసం పనిచేస్తుంది, ఇతరుల కోసం విఫలమవుతుంది | సబ్‌స్క్రిప్షన్ IDలు, టెనెంట్ IDలు మరియు ప్రాంత అనుమానాలు తీసివేయండి |
| అవుట్‌పుట్స్ యాప్‌లో కనెక్ట్ చేయబడలేదు | `SERVICE_<NAME>_ENDPOINT_URL` మరియు ఇతర `AZURE_*` అవుట్‌పుట్‌లను ఎక్స్‌పోర్ట్ చేయండి |
| గ్యాలరీ సమర్పణ తిరస్కరించబడింది | `README.md`, `LICENSE`, మరియు `metadata.template` జోడించండి |

---

## సారాంశం

- ఒక టెంప్లేట్ అనేది కేవలం `azure.yaml`, `infra/`, మరియు మీ కోడ్ కలిగిన Git రిపో మాత్రమే.
- ప్రతిదాన్ని పారామెటరైజ్ చేయండి — పేర్లు, ప్రాంతాలు, మరియు IDలు — ताकि ఇది ఎక్కడైనా రన్ అవ్వేలా అవుతుందని నిర్ధారించండి.
- ఎప్పుడూ వనరులను `azd-env-name` తో ట్యాగ్ చేయండి ताकि `azd down` పని చేయగలుగుతుంది.
- ప్రచురణకు ముందు `azd init --template <local-path>` తో స్థానికంగా పరీక్షించండి.
- Awesome AZD కి సమర్పించడానికి మెటాడేటా మరియు README జోడించండి.

---

## 🔗 నావిగేషన్

| దిశ | వనరు |
|-----------|----------|
| **మునుపటి** | [డిప్లాయ్‌మెంట్ గైడ్](deployment-guide.md) |
| **అధ్యాయం హోమ్** | [అధ్యాయం 4: ఇన్ఫ్రాస్ట్రక్చర్ (Infrastructure as Code)](README.md) |
| **తదుపరి అధ్యాయం** | [అధ్యాయం 5: బహుఏజెంట్ పరిష్కారాలు](../chapter-05-multi-agent/README.md) |

## 📖 సంబంధిత వనరులు

- [వనరుల ప్రావిజనింగ్](provisioning.md)
- [Awesome AZD గ్యాలరీ](https://azure.github.io/awesome-azd/)
- [అధికృత azd టెంప్లేట్ డాక్యుమెంటేషన్](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->