# మీ మొదటి ప్రాజెక్ట్ - హ్యాండ్స్-ఆన్ ట్యుటోరియల్

**అధ్యాయ దిశనిర్దేశం:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - స్థాపన & త్వరిత ప్రారంభం
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## పరిచయం

మీ మొదటి Azure Developer CLI ప్రాజెక్టుకు స్వాగతం! ఈ సమగ్ర హ్యాండ్స్-ఆన్ ట్యుటోరియల్ azd ఉపయోగించి Azureపై ఫుల్-స్టాక్ అప్లికేషన్‌ని సృష్టించడం, డిప్లాయ్ చేయడం మరియు నిర్వహించడం ఎలా అనే దానిపై పూర్తి వివరణని అందిస్తుంది. మీరు React ఫ్రంట్‌ఎండ్, Node.js API బ్యాక్‌ఎండ్ మరియు MongoDB డేటాబేస్ కలిగిన ఒక నిజమైన todo అప్లికేషన్‌తో పని చేయబోతున్నారు.

## నేర్చుకునే లక్ష్యాలు

ఈ ట్యుటోరియల్ పూర్తి చేసిన తర్వాత, మీరు:
- టెంప్లేట్లను ఉపయోగించి azd ప్రాజెక్ట్ ఆరంభ కార్యప్రవాహాన్ని నైపుణ్యంగా నేర్చుకుంటారు
- Azure Developer CLI ప్రాజెక్ట్ నిర్మాణం మరియు కాన్ఫిగరేషన్ ఫైళ్లను అర్థం చేసుకుంటారు
- ఇన్‌ఫ్రాస్ట్రక్చర్ ప్రోవిజనింగ్‌తో పాటు అప్లికేషన్‌ను Azureకు పూర్తి స్థాయిలో డిప్లాయ్ చేయగలుగుతారు
- అప్లికేషన్ నవీకరణలు మరియు మళ్లీ డిప్లాయ్ చేసే విధానాలను అమలు చేయగలుగుతారు
- డెవలప్‌మెంట్ మరియు స్టేజింగ్ కోసం బహు ఎనివిరాన్‌మెంట్లను నిర్వహించగలుగుతారు
- వనరుల క్లీనప్ మరియు ఖర్చుల నిర్వహణ పద్ధతులను వర్తింపజేయగలుగుతారు

## నేర్చుకున్న తర్వాత సామర్థ్యాలు

పూర్తి అయిన తర్వాత, మీరు చేయగలుగుతారు:
- టెంప్లేట్స్ నుండి azd ప్రాజెక్ట్‌లను స్వతంత్రంగా ఇనిషియలైజ్ చేయడం మరియు కన్ఫిగర్ చేయడం
- azd ప్రాజెక్ట్ నిర్మాణాలను ప్రభావవంతంగా నావిగేట్ చేసి సవరించడం
- ఒకే కమాండ్‌లతో Azureకు ఫుల్-స్టాక్ అప్లికేషన్‌లను డిప్లాయ్ చేయడం
- సాధారణ డిప్లాయ్‌మెంట్ సమస్యలు మరియు authentication సమస్యలను ట్రబుల్‌షూట్ చేయడం
- వివిధ డిప్లాయ్‌మెంట్ దశల కోసం బహు Azure ఎనివిరాన్‌మెంట్‌లను నిర్వహించడం
- అప్లికేషన్ నవీకరణలకు నిరంతర డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లోలను అమలు చేయడం

## ప్రారంభించండి

### ముందస్తు అర్హతలు
- ✅ Azure Developer CLI ఇన్‌స్టాల్ చేయబడింది ([Installation Guide](installation.md))
- ✅ AZD authentication పూర్తి చేయబడింది `azd auth login`
- ✅ Git మీ సిస్టమ్‌లో ఇన్‌స్టాల్ చేయబడింది
- ✅ Node.js 16+ (ఈ ట్యుటోరియల్ కోసం)
- ✅ Visual Studio Code (సిఫార్సు చేయబడింది)

మీరు ముందుకు వెళ్లేముందు, రిపోజిటరీ రూట్ నుండి సెటప్ వెంటిలేటర్ రన్ చేయండి:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### మీ సెటప్‌ను ధృవీకరించండి
```bash
# azd సంస్థాపనను తనిఖీ చేయండి
azd version

# AZD ప్రామాణీకరణను తనిఖీ చేయండి
azd auth login --check-status
```

### ఐచ్ఛిక Azure CLI ప్రమాణీకరణని ధృవీకరించండి

```bash
az account show
```

### Node.js సంస్కరణను చెక్ చేయండి
```bash
node --version
```

## దశ 1: టెంప్లేట్‌ను ఎంచుకొని ప్రారంభించండి

ముందుగా React ఫ్రంట్‌ఎండ్ మరియు Node.js API బ్యాక్‌ఎండ్ కలిగిన ప్రాచుర్యమైన todo అప్లికేషన్ టెంప్లేట్‌తో మొదలుపెట్టుదాం.

```bash
# అందుబాటులో ఉన్న టెంప్లేట్లను బ్రౌజ్ చేయండి
azd template list

# టుడూ యాప్ టెంప్లేట్‌ను ప్రారంభించండి
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# ప్రాంప్ట్‌లను అనుసరించండి:
# - ఒక ఎన్విరాన్మెంట్ పేరు నమోదు చేయండి: "dev"
# - ఒక సబ్‌స్క్రిప్షన్ ఎంచుకోండి (మీకు అనేకం ఉన్నట్లయితే)
# - ఒక రీజియన్ ఎంచుకోండి: "East US 2" (లేదా మీరు ఇష్టపడే రీజియన్)
```

### ఇప్పుడు ఏమైంది?
- టెంప్లేట్ కోడ్‌ను మీ స్థానిక డైరెక్టరీకి డౌన్‌లోడ్ చేశారు
- సేవ నిర్వచనాలతో `azure.yaml` ఫైల్ సృష్టించబడింది
- `infra/` డైరెక్టరీలో ఇన్‌ఫ్రాస్ట్రక్చర్ కోడ్ సెటప్ చేయబడింది
- ఎన్విరాన్‌మెంట్ కాన్ఫిగరేషన్ సృష్టించబంది

## దశ 2: ప్రాజెక్ట్ నిర్మాణాన్ని పరిశీలించండి

azd మన కోసం ఏమి సృష్టించిందో చూసుకుందాం:

```bash
# ప్రాజెక్ట్ నిర్మాణాన్ని చూడండి
tree /f   # విండోస్
# లేదా
find . -type f | head -20   # macOS/లినక్స్
```

మీకు ఇది కనిపించాలి:
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

### అర్థం చేసుకోవాల్సిన ముఖ్య ఫైళ్ళు

**azure.yaml** - మీ azd ప్రాజెక్ట్ హృదయం:
```bash
# ప్రాజెక్ట్ కాన్ఫిగరేషన్‌ను వీక్షించండి
cat azure.yaml
```

**infra/main.bicep** - ఇన్‌ఫ్రాస్ట్రక్చర్ నిర్వచనం:
```bash
# ఇన్‌ఫ్రాస్ట్రక్చర్ కోడ్‌ను చూడండి
head -30 infra/main.bicep
```

## దశ 3: మీ ప్రాజెక్ట్‌ను అనుకూలీకరించండి (ఐచ్ఛికం)

డిప్లాయ్ చేయక ముందే, మీరు అప్లికేషన్‌ను అనుకూలీకరించవచ్చు:

### ఫ్రంట్‌ఎండ్‌ను మార్చండి
```bash
# React యాప్ కంపోనెంట్‌ను తెరవండి
code src/web/src/App.tsx
```

ఒక సులభ మార్పు చేయండి:
```typescript
// శీర్షికను గుర్తించి దాన్ని మార్చండి
<h1>My Awesome Todo App</h1>
```

### ఎన్విరాన్‌మెంట్ వేరియబుల్స్‌ను కంఫిగర్ చేయండి
```bash
# కస్టమ్ పర్యావరణ వేరియబుల్‌లను సెట్ చేయండి
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# అన్ని పర్యావరణ వేరియబుల్‌లను చూడండి
azd env get-values
```

## దశ 4: Azureకు డిప్లాయ్ చేయండి

ఇప్పుడు ఉత్సాహకరమైన భాగం - అన్నీ Azureకు డిప్లాయ్ చేయండి!

```bash
# ఇన్ఫ్రాస్ట్రక్చర్ మరియు అప్లికేషన్‌ను డిప్లాయ్ చేయండి
azd up

# ఈ కమాండ్ చేయబోతుంది:
# 1. Azure వనరులను ప్రావిజన్ చేయండి (App Service, Cosmos DB, మొదలైనవి)
# 2. మీ అప్లికేషన్‌ను నిర్మించండి
# 3. ప్రావిజన్ చేసిన వనరులకు డిప్లాయ్ చేయండి
# 4. అప్లికేషన్ URL ను ప్రదర్శించండి
```

### డిప్లాయ్ సమయంలో ఏమి జరుగుతుంది?

`azd up` కమాండ్ ఈ దశలను నిర్వర్తిస్తుంది:
1. **Provision** (`azd provision`) - Azure వనరులను సృష్టిస్తుంది
2. **Package** - మీ అప్లికేషన్ కోడ్‌ను బిల్డ్ చేస్తుంది
3. **Deploy** (`azd deploy`) - కోడ్‌ను Azure వనరులపై డిప్లాయ్ చేస్తుంది

### ఆశించిన అవుట్‌పుట్
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## దశ 5: మీ అప్లికేషన్‌ని పరీక్షించండి

### మీ అప్లికేషన్‌కి యాక్సెస్ చేయండి
డిప్లాయ్ అవుట్‌పుట్‌లో ఇచ్చిన URL‌ను క్లిక్ చేయండి, లేదా ఎప్పుడైనా పొందండి:
```bash
# అప్లికేషన్ ఎండ్‌పాయింట్‌లు పొందండి
azd show

# మీ బ్రౌజర్‌లో అప్లికేషన్ తెరవండి
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo యాప్‌ను పరీక్షించండి
1. **Add a todo item** - "Add Todo" క్లిక్ చేసి ఒక టాస్క్ నమోదు చేయండి
2. **Mark as complete** - పూర్తయిన అంశాలను గుర్తించండి
3. **Delete items** - మీకు అవసరం లేని todos ని తొలగించండి

### మీ అప్లికేషన్‌ను పర్యవేక్షించండి
```bash
# మీ వనరుల కోసం Azure పోర్టల్ తెరవండి
azd monitor

# అప్లికేషన్ లాగ్‌లను చూడండి
azd monitor --logs

# సజీవ మెట్రిక్స్‌ను చూడండి
azd monitor --live
```

### ✅ మీ డిప్లాయ్‌మెంట్‌ను ధృవీకరించండి

ముందుకు పోవడంముందు, అన్ని నిజంగా పనిచేస్తున్నాయో లేదో నిర్ధారించేందుకు ఈ తక్షణ చెక్లిస్ట్‌ని అమలు చేయండి — "deploy succeeded" అంటే "app works" అని అనుకోవద్దు:

```bash
# 1. ఎండ్‌పాయింట్ ఉన్నదీ, చేరుకునేందుకు అందుబాటులో ఉందో నిర్ధారించండి
azd show

# 2. ఎండ్‌పాయింట్‌ను స్మోక్-టెస్ట్ చేయండి (HTTP 200 వస్తుందని ఆశించబడుతుంది)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. మీ యాప్ ఒక హెల్త్ ఎండ్‌పాయింట్‌ను అందిస్తే దాన్ని తనిఖీ చేయండి
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**డిప్లాయ్‌మెంట్ ఈ పరిస్థితుల్లో ధృవీకరించబడుతుంది:**
- ✅ `azd show` ఒక చేరుకునే ఎండ్పాయింట్ URL ను జాబితా చేయాలి
- ✅ ఆ URL మీ బ్రౌజర్‌లో లోపాలేమీ లేకుండా తెరవాలి
- ✅ కోర్ ఫీచర్లు పనిచేయాలి (todo జోడించడం/పూర్తి చేయడం/తొలగించడం)
- ✅ `azd monitor --logs` అనుభూతులలో అనూహ్యమైన లోపాలేమీ లేకుండా రిక్వెస్ట్స్ వస్తున్నట్టు చూపించాలి

ఏ పరీక్షలోనైనా విఫలం అయితే, [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md)కి వెళ్లండి.

## దశ 6: మార్పులు చేసి మళ్లీ డిప్లాయ్ చేయండి

ఒక మార్పు చేసి అప్‌డేట్ చేయడం ఎంత సులభమో చూద్దాం:

### APIని మార్చండి
```bash
# API కోడ్‌ను సవరించండి
code src/api/src/routes/lists.js
```

కస్టమ్ రెస్పాన్స్ హెడ్డర్ జోడించండి:
```javascript
// ఒక రూట్ హ్యాండ్లర్‌ను కనుగొని జోడించండి:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### కోడ్ మార్పులని మాత్రమే డిప్లాయ్ చేయండి
```bash
# కేవలం అప్లికేషన్ కోడ్‌ను మాత్రమే డిప్లాయ్ చేయండి (ఇన్‌ఫ్రాస్ట్రక్చర్‌ను వదిలివేయండి)
azd deploy

# ఇన్‌ఫ్రాస్ట్రక్చర్ ఇప్పటికే ఉన్నందున ఇది 'azd up' కంటే చాలా వేగంగా ఉంటుంది
```

## దశ 7: బహు ఎన్విరాన్‌మెంట్లను నిర్వహించండి

ఉత్పత్తికి ముందుగా మార్పులను పరీక్షించేందుకు ఒక స్టేజింగ్ ఎన్విరాన్‌మెంట్ సృష్టించండి:

```bash
# కొత్త స్టేజింగ్ వాతావరణాన్ని సృష్టించండి
azd env new staging

# స్టేజింగ్‌కు అమర్చండి
azd up

# డెవ్ వాతావరణానికి తిరిగి మారండి
azd env select dev

# అన్ని వాతావరణాలను జాబితా చేయండి
azd env list
```

### ఎన్విరాన్‌మెంట్ తులన
```bash
# డెవ్ పరిసరాన్ని వీక్షించండి
azd env select dev
azd show

# స్టేజింగ్ పరిసరాన్ని వీక్షించండి
azd env select staging
azd show
```

## దశ 8: వనరులను క్లీన్ అప్ చేయండి

మీరు ప్రయోగించడం ముక్తమయ్యాక, కొనసాగుతున్న చార్జీలను నివారించేందుకు క్లీనప్ చేయండి:

```bash
# ప్రస్తుత ఎన్విరాన్‌మెంట్ కోసం అన్ని Azure వనరులను తొలగించండి
azd down

# నిర్ధారణ లేకుండా బలవంతంగా తొలగించి సాఫ్ట్-డిలీట్ అయిన వనరులను పూర్తిగా తొలగించండి
azd down --force --purge

# నిర్దిష్ట ఎన్విరాన్‌మెంట్‌ను తొలగించండి
azd env select staging
azd down --force --purge
```

## సంప్రదాయ అప్లికేషన్ vs. AI-పవర్డ్ అప్లికేషన్: అదే వర్క్‌ఫ్లో

మీరు ఇప్పుడు ఒక సంప్రదాయ వెబ్ అప్లికేషన్‌ను డిప్లాయ్ చేసారు. కానీ మీరు బదులుగా Microsoft Foundry Models ద్వారా బ్యాక్ చేయబడిన చాట్ అప్లికేషన్ వంటి AI-పవర్డ్ అప్లికేషన్‌ను డిప్లాయ్ చేయాలనుకుంటే?

చాలా మంచి వార్త: **వర్క్‌ఫ్లో ఒకే విధంగా ఉంటుంది.**

| Step | సంప్రదాయ Todo యాప్ | AI చాట్ యాప్ |
|------|---------------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

ఏ ఒక్క తేడా ఉంటే మీరు మొదలెట్టే **టెంప్లేట్** మాత్రమే. ఒక AI టెంప్లేట్ అదనపు ఇన్‌ఫ్రాస్ట్రక్చర్‌ను (ఉదాహరణకు Microsoft Foundry Models వనరు లేదా AI Search ఇండెక్స్) కలిగి ఉంటుందేమో, కానీ azd ఇవన్నింటినీ మీ కోసం హ్యాండిల్ చేస్తుంది. మీరు కొత్త కమాండ్స్ నేర్చుకోవాల్సిన అవసరం లేదు, వేరే పనిముట్లు స్వీకరించాల్సిన అవసరం లేదు, లేదా డిప్లాయ్‌మెంట్ గురించి మీ ఆలోచనని మార్చడానికి అవసరం లేదు.

ఇది azd యొక్క మూల సిద్దాంతమే: **ఒక వర్క్‌ఫ్లో, ఏదైనా వర్క్లోడ్.** మీరు ఈ ట్యుటోరియల్ లో సాధించుకన్న నైపుణ్యాలు — ఇనిషియలైజ్ చేయడం, డిప్లాయ్ చేయడం, మానిటర్ చేయడం, మళ్లీ డిప్లాయ్ చేయడం, మరియు క్లీనప్ చేయడం — AI అప్లికేషన్స్ మరియు ఏజెంట్స్‌కు సమానంగా వర్తిస్తాయి.

---

## మీరు ఏమి నేర్చుకున్నారు

అభినందనలు! మీరు విజయవంతంగా:
- ✅ టెంప్లేట్ నుండి azd ప్రాజెక్ట్‌ను ఇనిషియలైజ్ చేశారు
- ✅ ప్రాజెక్ట్ నిర్మాణం మరియు ముఖ్య ఫైళ్లను పరిశీలించారు
- ✅ ఫుల్-స్టాక్ అప్లికేషన్‌ను Azureకు డిప్లాయ్ చేశారు
- ✅ కోడ్ మార్పులు చేసి మళ్లీ డిప్లాయ్ చేశారు
- ✅ బహు ఎన్విరాన్‌మెంట్లను నిర్వహించారు
- ✅ వనరులను క్లీనప్ చేశారు

## 🎯 నైపుణ్య ధృవీకరణ వ్యాయామాలు

### వ్యాయామం 1: వేరే టెంప్లేట్ డిప్లాయ్ చేయండి (15 నిమిషాలు)
**లక్ష్యం**: azd init మరియు డిప్లాయ్‌మెంట్ workflowలో నైపుణ్యం చూపండి

```bash
# Python + MongoDB స్టాక్‌ను పరీక్షించండి
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# డిప్లాయ్‌మెంట్‌ను నిర్ధారించండి
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# శుభ్రపరచండి
azd down --force --purge
```

**సఫలత ప్రమాణాలు:**
- [ ] అప్లికేషన్ తప్పులిలేకుండా డిప్లాయ్ అవుతుంది
- [ ] బ్రౌజర్లో అప్లికేషన్ URL యాక్సెస్ చేయగలగాలి
- [ ] అప్లికేషన్ సక్రమంగా పనిచేస్తుంది (todoలు జోడించడం/తొలగించడం)
- [ ] అన్ని వనరులను విజయవంతంగా క్లీనప్ చేశారు

### వ్యాయామం 2: కాన్ఫిగరేషన్ అనుకూలీకరించండి (20 నిమిషాలు)
**లక్ష్యం**: ఎన్విరాన్‌మెంట్ వేరియబుల్స్ కాన్ఫిగరేషన్ ఆచరణ చేయండి

```bash
cd my-first-azd-app

# కస్టమ్ ఎన్‌విరాన్‌మెంట్‌ను సృష్టించండి
azd env new custom-config

# కస్టమ్ వేరియబుల్స్‌ను సెట్ చేయండి
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# వేరియబుల్స్‌ను నిర్ధారించండి
azd env get-values | grep APP_TITLE

# కస్టమ్ కాన్ఫిగరేషన్‌తో డిప్లాయ్ చేయండి
azd up
```

**సఫలత ప్రమాణాలు:**
- [ ] కస్టమ్ ఎన్విరాన్‌మెంట్ విజయవంతంగా సృష్టించబడింది
- [ ] ఎన్విరాన్‌మెంట్ వేరియబుల్స్ సెట్ చేయబడ్డాయి మరియు పొందగలుగుతారు
- [ ] అప్లికేషన్ కస్టమ్ కాన్ఫిగరేషన్‌తో డిప్లాయ్ అవుతుంది
- [ ] డిప్లాయ్ చేసిన అప్లికేషన్‌లో కస్టమ్ సెట్టింగ్స్ ని ధృవీకరించగలగాలి

### వ్యాయామం 3: బహుఎన్విరాన్‌మెంట్ workflow (25 నిమిషాలు)
**లక్ష్యం**: ఎన్విరాన్‌మెంట్ నిర్వహణ మరియు డిప్లాయ్‌మెంట్ వ్యూహాల్లో నైపుణ్యం సాధించండి

```bash
# డెవ్ వాతావరణం సృష్టించండి
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# డెవ్ URL ను గమనించండి
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# స్టేజింగ్ వాతావరణం సృష్టించండి
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# స్టేజింగ్ URL ను గమనించండి
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# వాతావరణాలను పోల్చండి
azd env list

# రెండు వాతావరణాలను పరీక్షించండి
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# రెండు వాతావరణాలను శుభ్రపరచండి
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**సఫలత ప్రమాణాలు:**
- [ ] రెండు ఎన్విరాన్‌మెంట్‌లు వేరుగా కాన్ఫిగరేషన్‌లతో సృష్టించబడ్డాయి
- [ ] రెండింటి ఎన్విరాన్‌మెంట్‌లు విజయవంతంగా డిప్లాయ్ అయ్యాయి
- [ ] `azd env select` ఉపయోగించి ఎన్విరాన్‌మెంట్‌ల మధ్య స్విచ్ చేయగలగాలి
- [ ] ఎన్విరాన్‌మెంట్‌ల మధ్య ఎన్విరాన్‌మెంట్ వేరియబుల్స్ వేరుగా ఉండాలి
- [ ] రెండు ఎన్విరాన్‌మెంట్‌లను విజయవంతంగా క్లీనప్ చేశారు

## 📊 మీ పురోగతి

**నివేశించిన సమయం**: ~60-90 నిమిషాలు  
**నైపుణ్యాలు పొందినవి**:
- ✅ టెంప్లేట్-ఆధారిత ప్రాజెక్ట్ ఇనిషియలైజేషన్
- ✅ Azure వనరుల ప్రొవిజనింగ్
- ✅ అప్లికేషన్ డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లోలు
- ✅ ఎన్విరాన్‌మెంట్ నిర్వహణ
- ✅ కాన్ఫిగరేషన్ నిర్వహణ
- ✅ వనరు క్లీనప్ మరియు ఖర్చుల నిర్వహణ

**తరువాతి స్థాయి**: మీరు ఆధునిక కాన్ఫిగరేషన్ నమూనాల గురించి నేర్చుకోడానికి [Configuration Guide](configuration.md) కోసం సిద్ధంగా ఉన్నారు!

## సాధారణ సమస్యలను పరిష్కరించడం

### ప్రమాణీకరణ లోపాలు
```bash
# Azureతో మళ్లీ ప్రామాణీకరించండి
az login

# సబ్‌స్క్రిప్షన్ యాక్సెస్‌ను ధృవీకరించండి
az account show
```

### డిప్లాయ్‌మెంట్ వైఫల్యాలు
```bash
# డీబగ్ లాగింగ్‌ను సక్రియం చేయండి
export AZD_DEBUG=true
azd up --debug

# Azureలో అప్లికేషన్ లాగ్‌లను చూడండి
azd monitor --logs

# Container Apps కోసం Azure CLIని ఉపయోగించండి:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### వనరు పేరుల ద్వంద్వాలు
```bash
# ఒక అద్వితీయ పర్యావరణం పేరు ఉపయోగించండి
azd env new dev-$(whoami)-$(date +%s)
```

### పోర్ట్/నెట్‌వర్క్ సమస్యలు
```bash
# పోర్టులు అందుబాటులో ఉన్నాయా అని తనిఖీ చేయండి
netstat -an | grep :3000
netstat -an | grep :3100
```

## తదుపరి దశలు

మీ మొదటి ప్రాజెక్ట్ పూర్తి చేసిన తర్వాత, ఈ అధునాతన విషయాలను అన్వేషించండి:

### 1. ఇన్‌ఫ్రాస్ట్రక్చర్‌ను అనుకూలీకరించండి
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add databases, storage, and other services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD సెటప్పు చేయండి
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - పూర్తి CI/CD వర్క్‌ఫ్లోలు
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - పైప్లైన్ కాన్ఫిగరేషన్

### 3. ఉత్పత్తి ఉత్తమ పద్ధతులు
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - భద్రత, పనితీరు, మరియు మానిటరింగ్

### 4. మరిన్ని టెంప్లేట్లను అన్వేషించండి
```bash
# వర్గం ప్రకారం టెంప్లేట్లను వీక్షించండి
azd template list --filter web
azd template list --filter api
azd template list --filter database

# వేర్వేరు సాంకేతిక స్టాక్‌లను ప్రయత్నించండి
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## అదనపు వనరులు

### పాఠ్య సామగ్రి
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

**మీ మొదటి azd ప్రాజెక్ట్ పూర్తి చేసినందుకు అభినందనలు!** మీరు ఇప్పుడు నమ్మకంతో Azureపై అద్భుతమైన అప్లికేషన్లను నిర్మించి డిప్లాయ్ చేయడానికి సిద్ధంగా ఉన్నారు.

---

**అధ్యాయ దిశనిర్దేశం:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - స్థాపన & త్వరిత ప్రారంభం
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->