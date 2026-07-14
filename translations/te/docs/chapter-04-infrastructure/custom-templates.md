# మీ స్వంత azd టెంప్లేట్ రచించటం

**చాప్టర్ నావిగేషన్:**
- **📚 కోర్స్ హోమ్**: [AZD కోసం ప్రారంభికులకి](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 4 - మౌలికసదుపాయాలు కోడ్ & డిప్లాయ్‌మెంట్
- **⬅️ పూర్వం**: [డిప్లాయ్‌మెంట్ గైడ్](deployment-guide.md)
- **🚀 తదుపరి అధ్యాయం**: [అధ్యాయం 5: మల్టీ-ఏజెంట్ సొల్యూషన్స్](../chapter-05-multi-agent/README.md)

> జూలై 2026లో `azd 1.27.1` తో ధృవీకరించబడింది.

## పరిచయం

ఇప్పటి వరకు మీరు `azd init --template <name>` తో టెంప్లేట్లను *ఉపయోగిస్తున్నారు*. కానీ ఒక ప్రాజెక్ట్ అమరిక మీ జట్టు ఇష్టం అన్న సమయంలో—ఉదాహరణకు, ఒక కంటైనర్ యాప్, కోస్మోస్ డీబి, సరైన మానిటరింగ్‌తో—దాన్ని మీ స్వంత పునఃఉపయోగించదగిన టెంప్లేట్‌గా మార్చాలనుకుంటారు. టెంప్లేట్ అంటే azd చదవగలిగే ఒక ముందస్తుగా ఏర్పడిన నిర్మాణం కలిగిన గిట్ రిపొ. ఈ పాఠం మీకు ఒకటిని ప్రారంభం నుండి సృష్టించడం, పరీక్షించడం, మరియు (ఐచ్ఛికంగా) కమ్యూనిటీ గ్యాలరీకి ప్రచురించడం ఎలా చేయాలో చూపిస్తుంది.

## నేర్చుకునే లక్ష్యాలు

ఈ పాఠం ముగిసిన తర్వాత మీరు:
- ఒక ఫోల్డర్ "azd టెంప్లేట్" ఆగా ఏమి కావాలి అర్థం చేసుకోగలుగుతారు
- అవసరమైన ఫైళ్ళు మరియు ఫోల్డర్ ఏర్పాటు తెలుసుకుంటారు
- ఇతరులు పునః ఉపయోగించుకునేలా `azure.yaml` మరియు `infra/` చేర్చగలుగుతారు
- పంచుకోవడానికి ముందు మీ టెంప్లేట్‌ను స్థానికంగా పరీక్షించగలుగుతారు
- దానిని ప్రచురించి (ఐచ్ఛికంగా) Awesome AZDకి సమర్పించగలుగుతారు

## నేర్చుకున్న ఫలితాలు

ఈ పాఠం పూర్తి చేసిన తరువాత, మీరు చేయగలుగుతారు:
- కొత్త టెంప్లేట్ రిపొసిటరీని నిర్మించడం
- మౌలిక సదుపాయాలను ఏ సభ్యత్వంలోనైనా పని చేసేలా పారామితీకరించడం
- `azd init` మరియు `azd up`తో టెంప్లేట్‌ని ధృవీకరించడం
- కమ్యూనిటీ గ్యాలరీకు అవసరమైన మెటాడేటాను చేర్చడం

---

## టెంప్లేట్ అంటే ఏమిటి?

azd టెంప్లేట్ అనగా **ఒక Git రిపొసిటరీ** దీనిలో కనీసం ఉంటాయి:

| ఫైల్ / ఫోల్డర్ | ఉద్దేశ్యం | అవసరమా? |
|---------------|---------|-----------|
| `azure.yaml` | సర్వీసులు, హోస్టులు, మరియు ఇన్ఫ్రా ప్రొవైడర్ వివరిస్తుంది | ✅ అవును |
| `infra/` | బైస్ప్, టెర్రాఫార్మ్, లేదా పులుమి ద్వారా వనరులను కల్పిస్తుంది | ✅ అవును |
| `src/` (లేదా మీ కోడ్) | azd డిప్లాయ్ చేసే అప్లికేషన్ కోడ్ | ✅ అవును |
| `README.md` | టెంప్లేట్‌ను ఎలా ఉపయోగించాలో | ✅ బలంగా సిఫారసు చేయబడింది |
| `.azdo/` లేదా `.github/` | CI/CD పైప్లైన్ నిర్వచనలు | ఐచ్ఛికం |
| `.devcontainer/` | పునఃఉత్పత్తి చేయదగిన డెవ్ వాతావరణం | ఐచ్ఛికం |
| `azure.yaml` `metadata` | గ్యాలరీ + టెలిమెట్రీ సమాచారం | ఐచ్ఛికం (ప్రచురణకి అవసరం) |

ఇక్కడ ఏ విధమైన మాయాజాలం లేదు: మీరు `azd init --template you/your-repo` రన్ చేసినప్పుడు, azd రిపొను క్లోన్ చేసి `azure.yaml`ను చదువుతుంది.

---

## దశ 1: రిపొసిటరీని స్కాఫోల్డ్ చేయండి

ఫోల్డర్ నిర్మాణాన్ని చేతితో సృష్టించండి లేదా ఒక కనిష్ట టెంప్లేట్ నుండి ప్రారంభించి దాన్ని సవరించండి:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# ప్రమాణ లేఅవుట్‌ను సృష్టించండి
mkdir -p src infra
```

ఒక సాధారణ పూర్తయిన అమరిక ఇలా ఉండవచ్చు:

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

## దశ 2: `azure.yaml` రాయండి

ఇది టెంప్లేట్ హृదయం. ఇది azdకి ఏమి డిప్లాయ్ చేయాలో మరియు ఎలా చేయాలో చెప్తుంది:

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

> `metadata.template` ఫీల్డ్ గ్యాలరీ టెలిమెట్రీ ఉపయోగించి ఉపయోగాన్ని లెక్కిస్తుంది. `name@version` కన్వెన్షన్‌ని ఉపయోగించండి.

---

## దశ 3: మౌలికసదుపాయాన్ని పారామితీకరించండి

పునఃఉపయోగించదగిన టెంప్లేట్ కోసం అత్యంత ముఖ్యమైన నియమం: **పేరు, ప్రాంతాలు, లేదా సభ్యత్వ-స్పెసిఫిక్ విలువలను ఎప్పుడూ కఠినంగా లేదు**. పారామితులు మరియు వనరు టోకెన్ నమూనాను ఉపయోగించి అదే టెంప్లేట్ ఎవరి సభ్యత్వంలోనైనా పనిచేస్తుంది.

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

ఈ రెండు విషయాలు ఈ టెంప్లేట్‌కు అనుకూలంగా చేస్తాయి:

1. **`azd-env-name` ట్యాగ్** — azd దీన్ని వాతావరణాల ప్రకారం వనరులను ట్రాక్ మరియు శుభ్రపరచడానికి ఉపయోగిస్తుంది.
2. **`uniqueString(...)` వనరు టోకెన్** — పేర్లు తలప్రదేశ్ కాకుండా స్థిరమైన, ప్రపంచవ్యాప్తంగా ప్రత్యేకమైన సఫిక్స్‌ను ఉత్పత్తి చేస్తుంది.

వాతావరణం నుండి azd ఇంజెక్ట్ చేసే విలువలను చదువగల ఓ సరిపడని పారామితులు ఫైల్ ఇవ్వండి:

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

azd ప్రస్తుత వాతావరణం నుండి `${AZURE_ENV_NAME}` మరియు `${AZURE_LOCATION}` ను స్వయంచాలకంగా ప్రత్యామ్నాయంగా ఉపయోగిస్తుంది.

---

## దశ 4: మీ టెంప్లేట్‌ను స్థానికంగా పరీక్షించండి

పంచుకునే ముందు, టెంప్లేట్ శుభ్రమైన స్థితిలో పనిచేస్తుందనే నిరూపించండి.

**స్థానిక ఫోల్డర్ నుండి పరీక్షించండి** (గిట్ పుష్ అవసరం లేదు):

```bash
# ఖాళీ డైరెక్టరీ నుండి, మీ స్థానిక టెంప్లేట్ మార్గం ఉపయోగించి ప్రారంభించండి
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# ప్రోవిజన్ + ఎండ్ టు ఎండ్ డిప్లాయ్ చేయండి
azd auth login
azd up
```

**తర్వాత టియర్‌డౌన్ పరీక్షించండి**— మంచి టెంప్లేట్ పూర్తిగా శుభ్రపరుస్తుంది:

```bash
azd down --force --purge
```

`azd down` వనరులను మిగిల్చితే, మీరు వనరుపై `azd-env-name` ట్యాగ్ మర్చిపోయారు అని అనుకోవచ్చు.

> **సూచన:** ముందుగా `azd provision --preview` రన్ చేయండి. ఇది ఏ వనరు సృష్టించకముందే టెంప్లైట్ లోపాలను చూపిస్తుంది.

---

## దశ 5: టెంప్లేట్ ప్రచురణ

రిపొసిటరీని GitHubకి పుష్ చేయండి (ఇతరులు ఉపయోగించాలనుకుంటే పబ్లిక్):

```bash
gh repo create my-azd-template --public --source=. --push
```

ఇప్పుడు ఎవరికైనా ఉపయోగించుకోవచ్చు:

```bash
azd init --template your-github-username/my-azd-template
```

---

## దశ 6 (ఐచ్ఛికం): Awesome AZDకి సమర్పించండి

[Awesome AZD గ్యాలరీ](https://azure.github.io/awesome-azd/) సమాజ టెంప్లేట్లను జాబితా చేస్తుంది. జాబితాలోకి రావాలంటే మీ రిపొలో ఉండాలి:

- ✅ స్పష్టమైన `README.md` ప్రీరెక్విసిట్స్, ఆర్కిటెక్చర్ డయాగ్రామ్, మరియు ఖర్చు గమనికలతో
- ✅ పనిచేసే `azure.yaml` `metadata.template` తో
- ✅ కొత్త సభ్యత్వంలో శుభ్రంగా విధానం చేసే మౌలికసదుపాయాలు
- ✅ `LICENSE` ఫైల్
- ✅ (సిఫారసు చేయబడింది) ఒక-క్లిక్ కోడ్స్‌పేస్‌లు కోసం `.devcontainer/`

Awesome AZD రిపొలోని [కాంట్రిబ్యూషన్ గైడ్](https://github.com/Azure/awesome-azd) ను అనుసరించి మీ టెంప్లేట్‌ను గ్యాలరీ డేటా ఫైల్‌కు జోడించే పుల్ రిక్వెస్ట్ తెరవండి.

---

## సాధారణ లోపాలు

| లోపం | పరిష్కారం |
|---------|-----|
| కఠినంగా వనరు పేర్లు | `uniqueString()` వనరు టోకెన్ ఉపయోగించండి |
| `azd down` వనరులను మిగల్చింది | ప్రతి వనరును (లేదా వనరు గ్రూపును) `azd-env-name` తో ట్యాగ్ చేయండి |
| టెంప్లేట్ మీకు పనిచేస్తుంది, ఇతరులకు విఫలమవుతుంది | సభ్యత్వ IDలు, టెనెంట్ IDలు, మరియు ప్రాంత అనుమానాలను తీసివేయండి |
| అవుట్‌పుట్లు అప్లికేషన్‌కి కనెక్ట్ కాని | `SERVICE_<NAME>_ENDPOINT_URL` మరియు ఇతర `AZURE_*` అవుట్‌పుట్లను ఎగుమతి చేయండి |
| గ్యాలరీ సమర్పణ తిరస్కరించబడింది | `README.md`, `LICENSE`, మరియు `metadata.template` చేర్చండి |

---

## సారాంశం

- టెంప్లేట్ అంటే కేవలం ఒక Git రిపో, లో `azure.yaml`, `infra/`, మరియు మీ కోడ్ ఉంటుంది.
- ప్రతిదీ పారామితీకరించండి—పేర్లు, ప్రాంతాలు, మరియు IDs—అతను ఎక్కడైనా పని చేస్తుంది.
- దీన్ని ప్రతిసారీ `azd-env-name` ట్యాగ్‌తో వనరులను ట్యాగ్ చేయండి, ఎందుకంటే `azd down` పని చేయాలి.
- ప్రచురించే ముందు `azd init --template <local-path>` తో స్థానికంగా పరీక్షించండి.
- మెటాడేటా మరియు README జోడించి Awesome AZDకి సమర్పించండి.

---

## 🔗 నావిగేషన్

| దిశ | వనరు |
|-----------|----------|
| **పూర్వం** | [డిప్లాయ్‌మెంట్ గైడ్](deployment-guide.md) |
| **చాప్టర్ హోమ్** | [అధ్యాయం 4: మౌలికసదుపాయాలు కోడ్](README.md) |
| **తదుపరి అధ్యాయం** | [అధ్యాయం 5: మల్టీ-ఏజెంట్ సొల్యూషన్స్](../chapter-05-multi-agent/README.md) |

## 📖 సంబంధిత వనరులు

- [వనరుల ఏర్పాటు](provisioning.md)
- [Awesome AZD గ్యాలరీ](https://azure.github.io/awesome-azd/)
- [అధికారిక azd టెంప్లేట్ డాక్యుమెంటేషన్](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->