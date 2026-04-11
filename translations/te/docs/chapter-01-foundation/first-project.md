# మీ మొదటి ప్రాజెక్ట్ - ప్రాక్టికల్ ట్యుటోరియల్

**అధ్యాయ నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభికులకి](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 1 - స్థాపన & శీఘ్ర ప్రారంభం
- **⬅️ మునుపటి**: [ఇన్‌స్టాలేషన్ & సెటప్](installation.md)
- **➡️ తదుపరి**: [కాన్ఫిగరేషన్](configuration.md)
- **🚀 తదుపరి అధ్యాయం**: [అధ్యాయం 2: AI-మొదటి అభివృద్ధి](../chapter-02-ai-development/microsoft-foundry-integration.md)

## పరిచయం

మీ మొదటి Azure Developer CLI ప్రాజెక్టుకు స్వాగతం! azd ని ఉపయోగించి Azureపై పూర్తి-స్టాక్ అప్లికేషన్ సృష్టించడం, డిప్లోయ్ చేయడం మరియు నిర్వహించడం గురించి ఈ సమగ్ర ప్రాక్టికల్ ట్యుటోరియల్ పూర్తి మార్గదర్శకాన్ని అందిస్తుంది. మీరు React ఫ్రంట్‌ఎండ్, Node.js API బ్యాక్‌ఎండ్, మరియు MongoDB డేటాబేస్ కలిగిన వాస్తవ todo అప్లికేషన్‌పై పని చేస్తారు.

## నేర్చుకోవాల్సిన లక్ష్యాలు

ఈ ట్యుటోరియల్ పూర్తి చేసిన తర్వాత, మీరు:
- టెంప్లేట్‌లను ఉపయోగించి azd ప్రాజెక్ట్ ప్రారంభకరణ వర్క్‌ఫ్లోలో నైపుణ్యం పొందుతారు
- Azure Developer CLI ప్రాజెక్ట్ నిర్మాణం మరియు కాన్ఫిగరేషన్ ఫైల్స్ అవగాహన చేసుకుంటారు
- ఇన్ఫ్రాస్ట్రక్చర్ ప్రొవిజనింగ్‌తో సహా Azureకి అప్లికేషన్ పూర్తిగా డిప్లోయ్ చేయగలుగుతారు
- అప్లికేషన్ అప్‌డేట్లు మరియు పునరుద్దరణ వ్యూహాలను అమలులో పెట్టగలుగుతారు
- డెవలప్‌మెంట్ మరియు స్టేజింగ్ కోసం బహు పర్యావరణాలను నిర్వహించగలుగుతారు
- వనరు శుభ్రపరచడం మరియు ఖర్చు నిర్వహణ పద్ధతుల్ని అన్వయించగలుగుతారు

## నేర్చిన ఫలితాలు

పూర్తి చేసిన తర్వాత, మీరు చేయగలరు:
- టెంప్లేట్‌ల నుంచి స్వతంత్రంగా azd ప్రాజెక్టుల్ని ప్రారంభించి కాన్ఫిగర్ చేయండి
- azd ప్రాజెక్ట్ నిర్మాణాలను సమర్థవంతంగా నావిగేట్ చేసి సవరించండి
- ఒకే ఆజ్ఞలతో Azureకి పూర్తి-స్టాక్ అప్లికేషన్లను డిప్లోయ్ చేయండి
- సాధారణ డిప్లోయ్ సమస్యలు మరియు ప్రామాణీకరణ సమస్యలను పరిష్కరించండి
- వేర్వేరు డిప్లోయ్ స్టేజీల కోసం బహు Azure పర్యావరణాలను నిర్వహించండి
- అప్లికేషన్ అప్‌డేట్స్ కోసం నిరంతర డిప్లోయ్ వర్క్‌ఫ్లోలను అమలు చేయండి

## ప్రారంభించుకోవడం

### ముందస్తు అవసరాల జాబితా
- ✅ Azure Developer CLI ఇన్స్టాల్ చేయబడింది ([Installation Guide](installation.md))
- ✅ `azd auth login` తో AZD ధృవీకరణ పూర్తి చేయబడింది
- ✅ మీ సిస్టమ్‌లో Git ఇన్స్టాల్ చేయబడింది
- ✅ Node.js 16+ (ఈ ట్యుటోరియల్ కోసం)
- ✅ Visual Studio Code (భలే సూచించబడుతుంది)

మీరు కొనసాగించే ముందు, రిపోజిటరీ రూట్ నుండి సెటప్ వెరిఫైయర్ నడపండి:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### మీ సెటప్‌ను ధృవీకరించండి
```bash
# azd ఇన్‌స్టాలేషన్‌ను తనిఖీ చేయండి
azd version

# AZD ప్రామాణీకరణను తనిఖీ చేయండి
azd auth login --check-status
```

### ఐచ్ఛిక Azure CLI ప్రామాణీకరణను ధృవీకరించండి

```bash
az account show
```

### Node.js సంస్కరణను తనిఖీ చేయండి
```bash
node --version
```

## దశ 1: ఒక టెంప్లేట్ను ఎంచుకొని ప్రారంభించండి

React ఫ్రంట్‌ఎండ్ మరియు Node.js API బ్యాక్‌ఎండ్ కలిగిన ప్రసిద్ధ todo అప్లికేషన్ టెంప్లేట్ను ప్రారంభిద్దాం.

```bash
# అందుబాటులో ఉన్న టెంప్లేట్లను బ్రౌజ్ చేయండి
azd template list

# todo యాప్ టెంప్లేట్‌ను ప్రారంభించండి
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# సూచనలను అనుసరించండి:
# - ఎన్‌విరాన్‌మెంట్ పేరు నమోదు చేయండి: "dev"
# - ఒక సబ్‌స్క్రిప్షన్‌ను ఎంచుకోండి (మీకు బహుళ ఉంటే)
# - ఒక ప్రాంతాన్ని ఎంచుకోండి: "East US 2" (లేదా మీకు ఇష్టమైన ప్రాంతం)
```

### ఏమి జరిగింది?
- టెంప్లేట్ కోడ్‌ను మీ లోకల్ డైరెక్టరీకి డౌన్‌లోడ్ అయ్యింది
- సేవ నిర్వచనాలతో కూడిన `azure.yaml` ఫైల్ సృష్టించబడింది
- `infra/` డైరెక్టరీలో ఇన్ఫ్రాస్ట్రక్చర్ కోడ్ సెటప్ చేయబడింది
- ఒక పర్యావరణ కాన్ఫిగరేషన్ సృష్టించబడింది

## దశ 2: ప్రాజెక్ట్ నిర్మాణాన్ని పరిశీలించండి

azd మన కోసం ఏం సృష్టించిందో చూద్దాం:

```bash
# ప్రాజెక్ట్ నిర్మాణాన్ని చూడండి
tree /f   # విండోస్
# లేదా
find . -type f | head -20   # మ్యాక్‌ఓఎస్/లినక్స్
```

మీకు కనిపించాలి:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### తెలుసుకోవడానికి ముఖ్యమైన ఫైళ్లు

**azure.yaml** - మీ azd ప్రాజెక్ట్ యొక్క హృదయం:
```bash
# ప్రాజెక్ట్ కాన్ఫిగరేషన్‌ను వీక్షించండి
cat azure.yaml
```

**infra/main.bicep** - ఇన్ఫ్రాస్ట్రక్చర్ నిర్వచనం:
```bash
# ఇన్ఫ్రాస్ట్రక్చర్ కోడ్‌ను వీక్షించండి
head -30 infra/main.bicep
```

## దశ 3: మీ ప్రాజెక్ట్‌ను అనుకూలీకరించండి (ఐచ్ఛికం)

డిప్లోయ్ చేయేముందు, మీరు అప్లికేషన్‌ను అనుకూలీకరించవచ్చు:

### ఫరంటెండ్‌ను సవరించండి
```bash
# React యాప్ కంపోనెంట్‌ను తెరవండి
code src/web/src/App.tsx
```

సులభమైన మార్పు చేయండి:
```typescript
// శీర్షికను కనుగొని దాన్ని మార్చండి
<h1>My Awesome Todo App</h1>
```

### పర్యావరణ వేరియబుల్స్ కాన్ఫిగర్ చేయండి
```bash
# అనుకూల పర్యావరణ చరాలను సెట్ చేయండి
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# అన్ని పర్యావరణ చరాలను చూడండి
azd env get-values
```

## దశ 4: Azureకి డిప్లోయ్ చేయండి

ఇప్పుడు ఆసక్తికరమైన భాగం - అన్ని విషయాలను Azureపై డిప్లోయ్ చేయండి!

```bash
# ఇన్‌ఫ్రాస్ట్రక్చర్ మరియు అప్లికేషన్‌ను అమర్చడం
azd up

# ఈ కమాండ్ క్రింది పనులను చేయబోతుంది:
# 1. Azure వనరులను (App Service, Cosmos DB, మొదలైనవి) ప్రావిజన్ చేయడం
# 2. మీ అప్లికేషన్‌ను బిల్డ్ చేయడం
# 3. ప్రావిజన్ చేసిన వనరులకు అమర్చడం
# 4. అప్లికేషన్ URLను ప్రదర్శించడం
```

### డిప్లోయ్ చేస్తున్నప్పుడు ఏమి జరుగుతోంది?

`azd up` కమాండ్ ఈ దశలను నిర్వహిస్తుంది:
1. **Provision** (`azd provision`) - Azure వనరులను సృష్టిస్తుంది
2. **Package** - మీ అప్లికేషన్ కోడ్‌ను బిల్డ్ చేస్తుంది
3. **Deploy** (`azd deploy`) - కోడ్‌ను Azure వనరుల వద్ద డిప్లోయ్ చేస్తుంది

### నిరೀಕ್ಷిత అవుట్‌పుట్
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## దశ 5: మీ అప్లికేషన్‌ను పరీక్షించండి

### మీ అప్లికేషన్‌కి యాక్సెస్ చేయండి
డిప్లోయ్ అవుట్‌పుట్‌లో ఇచ్చిన URL పై క్లిక్ చేయండి, లేదా ఎప్పుడైనా అది పొందండి:
```bash
# అనువర్తన ఎండ్‌పాయింట్‌లను పొందండి
azd show

# మీ బ్రౌజర్‌లో అనువర్తనాన్ని తెరవండి
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo యాప్‌ను పరీక్షించండి
1. **ఒక todo అంశం జోడించండి** - "Add Todo" పై క్లిక్ చేసి ఒక టాస్క్ నమోదు చేయండి
2. **పూర్తయినట్లు గుర్తించండి** - పూర్తయ్యిన అంశాలను చెక్ చేయండి
3. **అంశాలను తొలగించండి** - మీకు ఇక అవసరం లేని todosని తొలగించండి

### మీ అప్లికేషన్‌ను పర్యవేక్షించండి
```bash
# మీ వనరుల కోసం Azure పోర్టల్ తెరవండి
azd monitor

# అప్లికేషన్ లాగ్‌లను చూడండి
azd monitor --logs

# ప్రత్యక్ష మెట్రిక్‌లు చూడండి
azd monitor --live
```

## దశ 6: మార్పులు చేయండి మరియు పునరుద్దరించండి

ఒక మార్పు చేసి అప్డేట్ చేయడం ఎంత సులభమో చూద్దాం:

### API ను సవరించండి
```bash
# API కోడ్ సవరించండి
code src/api/src/routes/lists.js
```

ఒక కస్టమ్ రెస్పాన్స్ హెడర్ జోడించండి:
```javascript
// ఒక రూట్ హ్యాండ్లర్‌ను కనుగొని జోడించండి:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### కేవలం కోడ్ మార్పులనే డిప్లోయ్ చేయండి
```bash
# కేవలం అప్లికేషన్ కోడ్‌ను మాత్రమే డిప్లాయ్ చేయండి (ఇన్‌ఫ్రాస్ట్రక్చర్‌ను వదిలేయండి)
azd deploy

# ఇది 'azd up' కన్నా చాలా వేగంగా ఉంటుంది, ఎందుకంటే ఇన్‌ఫ్రాస్ట్రక్చర్ ఇప్పటికే ఉంది
```

## దశ 7: బహు పర్యావరణాలను నిర్వహించండి

ప్రొడక్షన్ ముందు మార్పులను పరీక్షించడానికి ఒక స్టేజింగ్ పర్యావరణాన్ని సృష్టించండి:

```bash
# కొత్త స్టేజింగ్ పర్యావరణాన్ని సృష్టించండి
azd env new staging

# స్టేజింగ్‌కు డిప్లాయ్ చేయండి
azd up

# డెవ్ పర్యావరణానికి తిరిగి మారండి
azd env select dev

# అన్ని పర్యావరణాలను జాబితా చేయండి
azd env list
```

### పర్యావరణాల పోలిక
```bash
# డెవ్ పరిసరాన్ని చూడండి
azd env select dev
azd show

# స్టేజింగ్ పరిసరాన్ని చూడండి
azd env select staging
azd show
```

## దశ 8: వనరులను శుభ్రం చేయండి

పరీక్షలు పూర్తయిన తర్వాత, కొనసాగుతున్న ఛార్జీలను నివారించడానికి వనరులను శుభ్రపరచండి:

```bash
# ప్రస్తుత వాతావరణానికి సంబంధించిన అన్ని Azure వనరులను తొలగించండి
azd down

# నిర్ధారణ లేకుండానే బలవంతంగా తొలగించండి మరియు సాఫ్ట్-డిలీట్ చేయబడిన వనరులను శాశ్వతంగా తొలగించండి
azd down --force --purge

# నిర్దిష్ట వాతావరణాన్ని తొలగించండి
azd env select staging
azd down --force --purge
```

## క్లాసిక్ యాప్ vs AI-శక్తిగల యాప్: అదే వర్క్ఫ్లో

మీరు ఇప్పుడు సంప్రదాయ వెబ్ అప్లికేషన్‌ను డిప్లోయ్ చేశారు. కానీ మీరు బదులుగా Microsoft Foundry Models తో బ్యాక్ చేయబడిన ఒక చాట్ అప్లికేషన్ వంటి AI-శక్తిగల యాప్‌ను డిప్లోయ్ చేయాలనుకుంటే ఏమవుతుంది?

సుస్థిర వార్త: **వర్క్‌ఫ్లో ఇదే ఉంటుంది.**

| దశ | క్లాసిక్ టుడు యాప్ | AI చాట్ యాప్ |
|------|-----------------|-------------|
| ప్రారంభించండి | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| ప్రామాణీకరించండి | `azd auth login` | `azd auth login` |
| డిప్లోయ్ చేయండి | `azd up` | `azd up` |
| పర్యవేక్షించండి | `azd monitor` | `azd monitor` |
| శుభ్రం చేయండి | `azd down --force --purge` | `azd down --force --purge` |

唯一 వ్యత్యాసం మీరు మొదలు పెట్టే **టెంప్లేట్** మాత్రమే. AI టెంప్లేట్ అదనపు ఇన్ఫ్రాస్ట్రక్చర్ (ఉదాహరణకు Microsoft Foundry Models వనరు లేదా AI Search ఇండెక్స్ వంటి) అవసరంగా ఉండవచ్చు, కానీ azd మీ కోసం అందన్నింటినీ నిర్వహిస్తుంది. మీకు కొత్త ఆజ్ఞలు నేర్చుకోవాల్సిన అవసరం లేదు, వేరే టూల్ స్వీకరించాల్సిన అవసరం లేదు, లేదా డిప్లోయ్ గురించి మీ ఆలోచనలను మార్చాల్సిన అవసరం లేదు.

ఇది azd యొక్క మూల సిద్దాంతం: **ఒక వర్క్‌ఫ్లో, ఏ విధమైన పనిభారం అయినా.** మీరు ఈ ట్యుటోరియల్‌లో సాధించిన నైపుణ్యాలు — ప్రారంభించడం, డిప్లోయ్ చేయడం, పర్యవేక్షణ, పునరుద్ధరణ, మరియు శుభ్రపరచడం — AI అప్లికేషన్లు మరియు ఏజెంట్స్‌కు సమానంగా వర్తిస్తాయి.

---

## మీరు ఏమి నేర్చుకున్నారు

అభినందనలు! మీరు విజయవంతంగా:
- ✅ టెంప్లేట్ నుండి azd ప్రాజెక్ట్‌ను ప్రారంభించారు
- ✅ ప్రాజెక్ట్ నిర్మాణం మరియు ముఖ్య ఫైళ్లను పరిశీలించారు
- ✅ పూర్తి-స్టాక్ అప్లికేషన్‌ను Azureకి డిప్లోయ్ చేశారు
- ✅ కోడ్ మార్పులు చేసి మళ్లీ డిప్లోయర్ చేశారు
- ✅ బహు పర్యావరణాలను నిర్వహించారు
- ✅ వనరులను శుభ్రం చేశారు

## 🎯 నైపుణ్య నిర్ధారణ వ్యాయామాలు

### వ్యాయామం 1: ఇతర టెంప్లేట్ డిప్లోయ్ చేయండి (15 నిమిషాలు)
**లక్ష్యం**: azd init మరియు డిప్లోయ్ వర్క్‌ఫ్లోలో నైపుణ్యం ప్రదర్శించండి

```bash
# Python + MongoDB స్టాక్ ప్రయత్నించండి
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# డిప్లాయ్‌మెంట్‌ను నిర్ధారించండి
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# శుభ్రపరచండి
azd down --force --purge
```

**విజయ ప్రమాణాలు:**
- [ ] అప్లికేషన్ లో ఎర్రర్స్ లేకుండా డిప్లోయ్ అయ్యాలి
- [ ] బ్రౌజర్లో అప్లికేషన్ URL యాక్సెస్ చేయగలగాలి
- [ ] అప్లికేషన్ సరిగ్గా పనిచేయాలి (todo లు జోడించడం/తీసివేత)
- [ ] అన్ని వనరులను విజయవంతంగా శుభ్రం చేయడాన్ని ధృవీకరించండి

### వ్యాయామం 2: కాన్ఫిగరేషన్‌ను అనుకూలీకరించండి (20 నిమిషాలు)
**లక్ష్యం**: పర్యావరణ వేరియబుల్స్ కాన్ఫిగరేషన్ ಅಭ్యాసం

```bash
cd my-first-azd-app

# కస్టమ్ పర్యావరణాన్ని సృష్టించండి
azd env new custom-config

# కస్టమ్ వేరియబుల్స్‌ను సెట్ చేయండి
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# వేరియబుల్స్‌ను ధృవీకరించండి
azd env get-values | grep APP_TITLE

# కస్టమ్ కాన్ఫిగరేషన్‌తో డిప్లాయ్ చేయండి
azd up
```

**విజయ ప్రమాణాలు:**
- [ ] కస్టమ్ పర్యావరణం విజయవంతంగా సృష్టించబడింది
- [ ] పర్యావరణ వేరియబుల్స్ సెట్ చేసి తిరిగి పొందగలుగుతారు
- [ ] కస్టమ్ కాన్ఫిగరేషన్‌తో అప్లికేషన్ డిప్లోయ్ అయింది
- [ ] డిప్లాయ్ అయిన యాప్‌లో కస్టమ్ సెట్టింగ్స్‌ను ధృవీకరించగలరు

### వ్యాయామం 3: బహుళ పర్యావరణ వర్క్‌ఫ్లో (25 నిమిషాలు)
**లక్ష్యం**: పర్యావరణ నిర్వహణ మరియు డిప్లోయ్ వ్యూహాలలో నైపుణ్యం సంపాదించండి

```bash
# డెవ్ పరిసరాన్ని సృష్టించండి
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# డెవ్ URL ను గమనించండి
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# స్టేజింగ్ పరిసరాన్ని సృష్టించండి
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# స్టేజింగ్ URL ను గమనించండి
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# పరిసరాలను పోల్చండి
azd env list

# రెండు పరిసరాలను పరీక్షించండి
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# రెండు పరిసరాలను శుభ్రపరచండి
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**విజయ ప్రమాణాలు:**
- [ ] రెండు విభిన్న కాన్ఫిగరేషన్లతో రెండు పర్యావరణాలు సృష్టించబడ్డాయి
- [ ] రెండు పర్యావరణాలు విజయవంతంగా డిప్లోయ్ అయ్యాయి
- [ ] `azd env select` ఉపయోగించి పర్యావరణాల మధ్య మార్పు చేయగలగాలి
- [ ] పర్యావరణాల మధ్య వేరియబుల్స్ భిన్నంగా ఉన్నాయి
- [ ] రెండు పర్యావరణాలనూ విజయవంతంగా శుభ్రం చేశారు

## 📊 మీ పురోగతి

**పెట్టిన సమయం**: ~60-90 నిమిషాలు  
**సాధించిన నైపుణ్యాలు**:
- ✅ టెంప్లేట్ ఆధారిత ప్రాజెక్ట్ ప్రారంభకరణ
- ✅ Azure వనరుల ప్రొవిజనింగ్
- ✅ అప్లికేషన్ డిప్లోయ్ వర్క్‌ఫ్లోలు
- ✅ పర్యావరణ నిర్వహణ
- ✅ కాన్ఫిగరేషన్ నిర్వహణ
- ✅ వనరు శుభ్రపరచడం మరియు ఖర్చు నిర్వహణ

**తరువాతి స్థాయి**: మీరు అభ్యాసం కోసం [కాన్ఫిగరేషన్ గైడ్](configuration.md) కు సిద్ధంగా ఉన్నారు!

## సాధారణ సమస్యలను పరిష్కరించడం

### ప్రామాణీకరణ లోపాలు
```bash
# Azureతో మళ్లీ ప్రామాణీకరించండి
az login

# సబ్‌స్క్రిప్షన్ యాక్సెస్‌ను నిర్ధారించండి
az account show
```

### డిప్లోయ్ విఫలాలు
```bash
# డీబగ్ లాగింగ్‌ను సక్రియం చేయండి
export AZD_DEBUG=true
azd up --debug

# Azureలో అప్లికేషన్ లాగ్‌లను చూడండి
azd monitor --logs

# Container Apps కోసం Azure CLI ఉపయోగించండి:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### వనరు పేర్ల ఘర్షణలు
```bash
# ఒక అనన్య పర్యావరణ పేరును ఉపయోగించండి.
azd env new dev-$(whoami)-$(date +%s)
```

### పోర్ట్/నెట్‌వర్క్ సమస్యలు
```bash
# పోర్ట్‌లు అందుబాటులో ఉన్నాయో తనిఖీ చేయండి
netstat -an | grep :3000
netstat -an | grep :3100
```

## తదుపరి దశలు

ఇప్పుడు మీరు మీ మొదటి ప్రాజెక్ట్ పూర్తి చేసిన తరువాత, ఈ అభివృద్ధి అంశాలను అన్వేషించండి:

### 1. ఇన్ఫ్రాస్ట్రక్చర్‌ను అనుకూలీకరించండి
- [కోడ్ ద్వారా ఇన్ఫ్రాస్ట్రక్చర్](../chapter-04-infrastructure/provisioning.md)
- [డేటాబేస్‌లు, స్టోరేజ్, మరియు ఇతర సేవలను జోడించండి](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD సెటప్ చేయండి
- [డిప్లాయ్‌మెంట్ గైడ్](../chapter-04-infrastructure/deployment-guide.md) - పూర్తి CI/CD వర్క్‌ఫ్లోలు
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - పైప్లైన్ కాన్ఫిగరేషన్

### 3. ప్రొడక్షన్ ఉత్తమ పద్ధతులు
- [డిప్లాయ్‌మెంట్ గైడ్](../chapter-04-infrastructure/deployment-guide.md) - భద్రత, పనితీరు, మరియు పర్యవేక్షణ

### 4. మరిన్ని టెంప్లేట్స్ ను అన్వేషించండి
```bash
# వర్గం ప్రకారం టెంప్లేట్లను బ్రౌజ్ చేయండి
azd template list --filter web
azd template list --filter api
azd template list --filter database

# వేర్వేరు సాంకేతిక స్టాక్‌లను ప్రయత్నించండి
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## అదనపు వనరులు

### నేర్చుకోవడానికి సామగ్రి
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### కమ్యూనిటీ & మద్దతు
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### టెంప్లేట్లు & ఉదాహరణలు
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**మీ మొదటి azd ప్రాజెక్ట్ పూర్తి చేసుకోవడానికి అభినందనలు!** మీరు ఇప్పుడే Azureపై అద్భుతమైన అప్లికేషన్లను నమ్మకంతో నిర్మించి డిప్లోయ్ చేయడానికి సిద్ధంగా ఉంటారు.

---

**అధ్యాయ నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభికులకి](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 1 - స్థాపన & శీఘ్ర ప్రారంభం
- **⬅️ మునుపటి**: [ఇన్‌స్టాలేషన్ & సెటప్](installation.md)
- **➡️ తదుపరి**: [కాన్ఫిగరేషన్](configuration.md)
- **🚀 తదుపరి అధ్యాయం**: [అధ్యాయం 2: AI-మొదటి అభివృద్ధి](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **తదుపరి పాఠం**: [డిప్లోయ్‌మెంట్ గైడ్](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ఈ డాక్యుమెంట్‌ను AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీ, ఆటోమేటెడ్ అనువాదాల్లో తప్పులు లేదా అసంపూర్ణతలు ఉండవచ్చని దయచేసి గమనించండి. స్థానిక భాషలో ఉన్న మూల డాక్యుమెంట్‌ను అధికారిక మూలంగా పరిగణించాలి. కీలకమైన సమాచారానికి వృత్తిపరులైన మానవ అనువాదం చేయించుకోవాలని సిఫార్సు చేయబడింది. ఈ అనువాదం వాడకంతో ఏర్పడే ఏవైనా అపార్థాలు లేదా తప్పుదోవలకు మేము బాధ్యులు కాదు.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->