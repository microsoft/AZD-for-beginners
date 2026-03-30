# మీ తొలి ప్రాజెక్ట్ - ప్రాక్టికల్ ట్యుటోరియల్

**చాప్టర్ నావిగేషన్:**
- **📚 కోర్స్ హోమ్**: [AZD ప్రారంభీకరించాలనుకుంటున్నవారికి](../../README.md)
- **📖 ప్రస్తుతం చాప్టర్**: Chapter 1 - Foundation & Quick Start
- **⬅️ గతం**: [Installation & Setup](installation.md)
- **➡️ తదుపరి**: [Configuration](configuration.md)
- **🚀 తదుపరి చాప్టర్**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## పరిచయం

మీ మొదటి Azure Developer CLI ప్రాజెక్టుకు స్వాగతం! azdను ఉపయోగించి Azureపై పూర్తి-స్టాక్ అనువర్తనం సృష్టించడం, నియమించడం మరియు నిర్వహించడం కోసం ఈ వివరణాత్మక ప్రాక్టికల్ ట్యుటోరియల్ పూర్తి ప్రయాణాన్ని అందిస్తుంది. మీరు ఒక నిజమైన todo అనువర్తనంతో పనిచేస్తారు, ఇది React ఫ్రంట్‌ఎండ్, Node.js API బ్యాకెండ్ మరియు MongoDB డేటాబేస్‌ను కలిగి ఉంటుంది.

## నేర్చుకునే లక్ష్యాలు

ఈ ట్యుటోరియల్ పూర్తి చేసినందున, మీరు:
- టెంప్లేట్లను ఉపయోగించి azd ప్రాజెక్ట్ ప్రారంభ పరివాహాన్ని నైపుణ్యంగా నేర్చుకోవడం
- Azure Developer CLI ప్రాజెక్ట్ స్ట్రక్చర్ మరియు కాన్ఫిగరేషన్ ఫైళ్లను అర్థం చేసుకోవడం
- ఇన్ఫ్రాస్ట్రక్చర్ ప్రొవిజనింగ్‌తో కూడిన పూర్తి అనువర్తనాన్ని Azureలో మోపడం
- అనువర్తన నవీకరణలు మరియు పునఃనిర్వహణ విధానాలను అమలు చేయడం
- అభివృద్ధి మరియు స్టేజింగ్ కోసం బహుభూసవించే వాతావరణాలు నిర్వహించడం
- వనరుల శుభ్రం చేయడం మరియు ఖర్చు నిర్వహణ ప్రతిపత్తులను వర్తింప చేయడం

## నేర్చుకున్న ఫలితాలు

పూర్తి చేసిన తర్వాత, మీరు చేయగలరు:
- స్వతంత్రంగా టెంప్లేట్ల నుండి azd ప్రాజెక్టులను ఆరంభించి సెట్టప్ చేయగలగడం
- azd ప్రాజెక్ట్ నిర్మాణాన్ని సమర్థవంతంగా నావిగేట్ చేసి మార్పు చేయగలగడం
- సింగిల్ కమాండ్లతో Azureలో పూర్తి-స్టాక్ అనువర్తనాలను నియమించగలగడం
- సాధారణ నియమింపు సమస్యలు మరియు పరిచర్య సమస్యలను డీబగ్ చేయగలగడం
- వివిధ నియమింపు దశల కోసం బహుళ Azure వాతావరణాలను నిర్వహించగలగడం
- అనువర్తన నవీకరణల కోసం నిరంతర నియమింపు వర్క్‌ఫ్లోలను అమలు చేయగలగడం

## ప్రారంభించడమని

### ముందస్తు అవసరాల చెక్లిస్ట్
- ✅ Azure Developer CLI ఇన్‌స్టాల్ అయింది ([Installation Guide](installation.md))
- ✅ Azure CLI ఇన్‌స్టాల్ చేసి authenticated అయ్యారు
- ✅ మీ సిస్టమ్లో Git ఇన్‌స్టాల్ అయ్యింది
- ✅ Node.js 16+ (ఈ ట్యుటోరియల్ కోసం)
- ✅ Visual Studio Code (సిఫార్సు చేయబడింది)

### మీ సెటప్‌ని పరిశీలించండి
```bash
# azd సంస్థాపనను తనిఖీ చేయండి
azd version
```
### Azure ధృవీకరణను తనిఖీ చేయండి

```bash
az account show
```

### Node.js వెర్షన్ తనిఖీ చేయండి
```bash
node --version
```

## దశ 1: ఒక టెంప్లేట్ ఎంపిక చేసి ఆరంభించండి

React ఫ్రంట్‌ఎండ్ మరియు Node.js API బ్యాకెండ్ ఉన్న ప్రముఖ todo అనువర్తన టెంప్లేట్‌తో ప్రారంభిద్దాం.

```bash
# లభ్యమయ్యే టెంప్లేట్‌లను బ్రౌజ్ చేయండి
azd template list

# టుడూ యాప్ టెంప్లేట్‌ను ప్రారంభించండి
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# ప్రాంప్ట్‌లను అనుసరించండి:
# - ఒక వాతావరణ పేరు నమోదు చేయండి: "dev"
# - ఒక సబ్స్క్రిప్షన్ ఎంచుకోండి (మీకు ఒకటి కన్నా ఎక్కువ ఉంటే)
# - ఒక ప్రాంతాన్ని ఎంచుకోండి: "East US 2" (లేదా మీ ఇష్టమైన ప్రాంతం)
```

### ఏమి జరిగింది?
- టెంప్లేట్ కోడ్‌ను మీ స్థానిక డైరెక్టరీకు డౌన్లోడ్ చేశారు
- సేవ నిర్వచనాలతో `azure.yaml` ఫైలు సృష్టించారు
- `infra/` డైరెక్టరీలో ఇన్ఫ్రాస్ట్రక్చర్ కోడ్‌ను సెటప్ చేశారు
- ఒక వాతావరణ కాన్ఫిగరేషన్‌ను సృష్టించారు

## దశ 2: ప్రాజెక్ట్ స్ట్రక్చర్‌ను పరిశీలించండి

azd మాకు ఏమి సృష్టించిందో చూద్దాం:

```bash
# ప్రాజెక్ట్ నిర్మాణాన్ని వీక్షించండి
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

### అర్థం చేసుకునే ముఖ్య ఫైళ్లు

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

విభజనకు ముందు, మీరు అనువర్తనాన్ని అనుకూలీకరించవచ్చు:

### ఫ్రంట్‌ఎండ్‌ను మార్చండి
```bash
# React యాప్ కంపోనెంట్‌ను తెరవండి
code src/web/src/App.tsx
```

సాధారణ మార్పు చేయండి:
```typescript
// శీర్షికను కనుగొని దాన్ని మార్చండి
<h1>My Awesome Todo App</h1>
```

### వాతావరణ వేరియబుల్‌లను కన్‌ఫిగర్ చేయండి
```bash
# కస్టమ్ పర్యావరణ వేరియబుల్స్ を సెట్ చేయండి
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# అన్ని పర్యావరణ వేరియబుల్స్ を చూడండి
azd env get-values
```

## దశ 4: Azureకు మోపండి

ఇప్పుడు ఆసక్తికర భాగం - అన్నింటినీ Azureకి మోపండి!

```bash
# ఇన్‌ఫ్రాస్ట్రక్చర్ మరియు అప్లికేషన్‌ను అమలు చేయండి
azd up

# ఈ కమాండ్ చేయబోతుంది:
# 1. Azure వనరులను ఏర్పాటు చేయడం (App Service, Cosmos DB, మొదలైనవి)
# 2. మీ అప్లికేషన్‌ను నిర్మించడం
# 3. ఏర్పాటు చేసిన వనరులపై అప్లికేషన్‌ను పంపిణీ చేయడం
# 4. అప్లికేషన్ URLని ప్రదర్శించడం
```

### మోపించే సమయంలో ఏమి జరుగుతుంది?

`azd up` కమాండ్ ఈ దశలను అమలు చేస్తుంది:
1. **Provision** (`azd provision`) - Azure వనరులను సృష్టిస్తుంది
2. **Package** - మీ అనువర్తన కోడ్‌ను బిల్డ్ చేస్తుంది
3. **Deploy** (`azd deploy`) - కోడ్‌ను Azure వనరులకు నియమిస్తుంది

### ఆశించిన అవుట్‌పుట్
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## దశ 5: మీ అనువర్తనాన్ని పరీక్షించండి

### మీ అనువర్తనాన్ని యాక్సెస్ చేయండి
నియమింపు అవుట్‌పుట్‌లో ఇచ్చిన URLపై క్లిక్ చేయండి, లేదా ఎప్పుడైనా పొందండి:
```bash
# అప్లికేషన్ ఎండ్పాయింట్లను పొందండి
azd show

# మీ బ్రౌజర్‌లో అప్లికేషన్‌ను తెరవండి
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo అనువర్తనాన్ని పరీక్షించండి
1. **ఒక todo ఐటమ్ జోడించండి** - "Add Todo"పై క్లిక్ చేసి ఒక టాస్క్ నమోదు చేయండి
2. **పూర్తిగా గుర్తించండి** - పూర్తయిన ఐటెంలను చెక్ చేయండి
3. **ఐటెంలను తొలగించండి** - మీకు అవసరం లేని todos ను తొలగించండి

### మీ అనువర్తనాన్ని మానిటర్ చేయండి
```bash
# మీ వనరుల కోసం Azure పోర్టల్‌ను తెరవండి
azd monitor

# అప్లికేషన్ లాగ్‌లను చూడండి
azd monitor --logs

# లైవ్ మెట్రిక్స్‌ను చూడండి
azd monitor --live
```

## దశ 6: మార్పులు చేసి పునర్వ్యవస్థాపించండి

ఒక మార్పు చేయి, అప్డేట్ చేయడం ఎంత సులభమో చూద్దాం:

### API ను మార్చండి
```bash
# API కోడ్‌ను సవరించండి
code src/api/src/routes/lists.js
```

కస్టమ్ రిస్పాన్స్ హెడ్డర్ జోడించండి:
```javascript
// ఒక రూట్ హ్యాండ్లర్ కనుగొని జోడించండి:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### కేవలం కోడ్ మార్పులను మాత్రమే డిప్లాయ్ చేయండి
```bash
# కేవలం అప్లికేషన్ కోడ్‌ను మాత్రమే డిప్లాయ్ చేయండి (ఇన్ఫ్రాస్ట్రక్చర్‌ను మినహాయించండి)
azd deploy

# ఇన్ఫ్రాస్ట్రక్చర్ ఇప్పటికే ఉన్నందున ఇది 'azd up' కంటే చాలా వేగంగా ఉంటుంది
```

## దశ 7: బహుళ వాతావరణాలను నిర్వహించండి

ఉత్పత్తికి ముందు మార్పులను పరీక్షించడానికి ఒక స్టేజింగ్ వాతావరణాన్ని సృష్టించండి:

```bash
# కొత్త స్టేజింగ్ వాతావరణాన్ని సృష్టించండి
azd env new staging

# స్టేజింగ్‌కు అమర్చండి
azd up

# డెవ్ వాతావరణానికి తిరిగి మార్చండి
azd env select dev

# అన్ని వాతావరణాలను జాబితా చేయండి
azd env list
```

### వాతావరణాల తులన
```bash
# డెవ్ ఎన్విరాన్‌మెంట్‌ను వీక్షించండి
azd env select dev
azd show

# స్టేజింగ్ ఎన్విరాన్‌మెంట్‌ను వీక్షించండి
azd env select staging
azd show
```

## దశ 8: వనరులను శుభ్రపరచండి

మీ ప్రయోగాలు শেষైన తర్వాత, కొనసాగించే చార్జీలను నివారించేలా శుభ్రపరచండి:

```bash
# ప్రస్తుత పరిసరానికి సంబంధించిన అన్ని Azure వనరులను తొలగించండి
azd down

# నిర్ధారణ లేకుండా బలవంతంగా తొలగించి సాఫ్ట్-డిలీట్ చేయబడిన వనరులను శుద్ధి చేయండి
azd down --force --purge

# నిర్దిష్ట పరిసరాన్ని తొలగించండి
azd env select staging
azd down --force --purge
```

## క్లాసిక్ యాప్ vs. AI-సామర్థ్యంతో ఉన్న యాప్: అదే వర్క్‌ఫ్లో

మీరు ఇప్పుడు ఒక సంప్రదాయ వెబ్ అనువర్తనాన్ని మోపించారు. కానీ మీరు బదులు Microsoft Foundry Models ద్వారా బ్యాకింగ్ చేయబడిన చాట్ అప్లికేషన్ వంటి AI-సామర్థ్యంతో ఒక యాప్ మోపాలనుకుంటే?

సంతోషంగా చెప్పడానికి: **వర్క్‌ఫ్లో అదే ఉంటుంది.**

| Step | Classic Todo App | AI Chat App |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

ఏకైక తేడా మీరు ప్రారంభించే **టెంప్లేట్** మాత్రమే. ఒక AI టెంప్లేట్ అదనపు ఇన్ఫ్రాస్ట్రక్చర్‌ను అందించవచ్చు (ఉదాహరణకు Microsoft Foundry Models వనరు లేదా ఒక AI Search సూచిక), కానీ azd అంతన్నింటినీ మీ కోసం హ్యాండిల్ చేస్తుంది. మీరు కొత్త కమాండ్లను నేర్చుకోవాల్సిన అవసరం లేదు, వేరే టూల్‌ను అవలంబించాల్సిన అవసరం లేదు, లేదా నియమింపును గురించి ఎలా ఆలోచిస్తారో మార్చాల్సిన అవసరం లేదు.

ఇది azd యొక్క ప్రాథమిక సిద్ధాంతం: **ఒక వర్క్‌ఫ్లో, ఏ విధమైన వర్క్లోడ్ అయినా.** మీరు ఈ ట్యుటోరియల్‌లో సాధించిన నైపుణ్యాలు—ప్రారంభించటం, నియమించడం, మానిటర్ చేయడం, పునఃనిర్వహణ, మరియు శుభ్రపరచడం—AI అనువర్తనాలకు మరియు ఏజెంట్లు కోసం సమానంగా వర్తిస్తాయి.

---

## మీరు నేర్చుకున్నది

అభినందనలు! మీరు విజయవంతంగా:
- ✅ టెంప్లేట్నుండి azd ప్రాజెక్ట్ ఆరంభించారు
- ✅ ప్రాజెక్ట్ నిర్మాణం మరియు ముఖ్య ఫైళ్లను పరిశీలించారు
- ✅ పూర్తి-స్టాక్ అనువర్తనాన్ని Azureలో నియమించారు
- ✅ కోడ్ మార్పులు చేసి పునర్వ్యవస్థాపించారు
- ✅ బహుళ వాతావరణాలను నిర్వహించారు
- ✅ వనరులను శుభ్రపరిచారు

## 🎯 నైపుణ్య ధృవీకరణ వ్యాయామాలు

### వ్యాయామం 1: భిన్నమైన టెంప్లేట్‌ను మోపండి (15 నిమిషాలు)
**లక్ష్యం**: azd init మరియు నియమింపు పరివాహంపై నైపుణ్యం ప్రదర్శించండి

```bash
# Python + MongoDB స్టాక్ ప్రయత్నించండి
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# డిప్లాయ్‌మెంట్‌ను ధృవీకరించండి
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# శుభ్రం చేయండి
azd down --force --purge
```

**సఫలం మేధావ్యం:**
- [ ] అనువర్తనంలో లోపాల్టరానీ నియమిస్తుంది
- [ ] బ్రౌజర్‌లో అనువర్తన URL కు యాక్సెస్ చేయగలగడం
- [ ] అనువర్తనం సరైనంగా పనిచేస్తుంది (todo జోడించడం/తొలగించడం)
- [ ] అన్ని వనరుల్ని విజయవంతంగా శుభ్రపరిచారు

### వ్యాయామం 2: కాన్ఫిగరేషన్‌ను అనుకూలీకరించండి (20 నిమిషాలు)
**లక్ష్యం**: వాతావరణ వేరియబుల్ కాన్ఫిగరేషన్ లో ప్రాక్టీస్

```bash
cd my-first-azd-app

# కస్టమ్ పరిసరాన్ని సృష్టించండి
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

**సఫలం మేధావ్యం:**
- [ ] కస్టమ్ వాతావరణం విజయవంతంగా సృష్టించబడింది
- [ ] వాతావరణ వేరియబుల్‌లు సెట్ చేసి పొందగలగడం
- [ ] అనువర్తనం కస్టమ్ కాన్ఫిగరేషన్ తో నియమించబడింది
- [ ] నియమింపెడ్డ అనువర్తనంలో కస్టమ్ సెట్టింగ్స్‌ను నిర్ధారించగలగడం

### వ్యాయామం 3: బహుళ-వాతావరణ వర్క్‌ఫ్లో (25 నిమిషాలు)
**లక్ష్యం**: వాతావరణ నిర్వహణ మరియు నియమింపు వ్యూహాలలో నైపుణ్యం పొందండి

```bash
# డెవ్ పర్యావరణాన్ని సృష్టించండి
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# డెవ్ URL ని గమనించండి
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# స్టేజింగ్ పర్యావరణాన్ని సృష్టించండి
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# స్టేజింగ్ URL ని గమనించండి
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# పర్యావరణాలను పోల్చండి
azd env list

# రెండు పర్యావరణాలను పరీక్షించండి
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# రెండు పర్యావరణాలను శుభ్రం చేయండి
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**సఫలం మేధావ్యం:**
- [ ] రెండు వాతావరణాలు వేరే కాన్ఫిగరేషన్‌లు తో సృష్టించబడ్డాయి
- [ ] రెండూ విజయవంతంగా నియమించబడ్డాయి
- [ ] `azd env select` ఉపయోగించి వాతావరణాల మధ్య స్విచ్ చేయగలగడం
- [ ] వాతావరణ వేరియబుల్స్ వాతావరణాల మధ్య భిన్నంగా ఉంటాయి
- [ ] రెండూ విజయవంతంగా శుభ్రపరిచారు

## 📊 మీ పురోగతి

** ఖర్చు చేసిన సమయం **: సుమారు 60-90 నిమిషాలు  
**అర్జితమైన నైపుణ్యాలు**:
- ✅ టెంప్లేట్-ఆధారిత ప్రాజెక్ట్ ప్రారంభం
- ✅ Azure వనరుల ప్రొవిజనింగ్
- ✅ అనువర్తన నియమింపు వర్క్‌ఫ్లోలు
- ✅ వాతావరణ నిర్వహణ
- ✅ కాన్ఫిగరేషన్ నిర్వహణ
- ✅ వనరుల శుభ్రపరచడం మరియు ఖర్చు నిర్వహణ

**తదుపరి స్థాయి**: మీరు [Configuration Guide](configuration.md) కు సిద్ధంగా ఉన్నారు, ఇక్కడ మీరు అధునాతన కాన్ఫిగరేషన్ నమూనాలను నేర్చుకుంటారు!

## సాధారణ సమస్యల తీర్మానం

### ధృవీకరణ లోపాలు
```bash
# Azureతో మళ్లీ ప్రామాణీకరణ చేయండి
az login

# సబ్‌స్క్రిప్షన్ యాక్సెస్‌ను ధృవీకరించండి
az account show
```

### నియమింపు విఫలమవడం
```bash
# డీబగ్ లాగింగ్ ప్రారంభించండి
export AZD_DEBUG=true
azd up --debug

# Azureలో అనువర్తనం లాగ్లను చూడండి
azd monitor --logs

# కంటైనర్ యాప్స్ కోసం Azure CLI ఉపయోగించండి:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### వనరు పేర్ల సంగ్రాహకతలు
```bash
# అనన్యమైన వాతావరణ పేరును ఉపయోగించండి
azd env new dev-$(whoami)-$(date +%s)
```

### పోర్టు/నెట్‌వర్క్ సమస్యలు
```bash
# పోర్టులు అందుబాటులో ఉన్నాయో తనిఖీ చేయండి
netstat -an | grep :3000
netstat -an | grep :3100
```

## తదుపరి దశలు

ఇప్పుడే మీరు మీ మొదటి ప్రాజెక్ట్ ను పూర్తి చేసారు, ఈ అధునాతన అంశాలను పరిశీలించండి:

### 1. ఇన్ఫ్రాస్ట్రక్చర్‌ను అనుకూలీకరించండి
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add databases, storage, and other services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD సెట్ చేయండి
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - పూర్తి CI/CD వర్క్‌ఫ్లోలు
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - పైప్‌లైన్ కాన్ఫిగరేషన్

### 3. ఉత్పత్తి ఉత్తమ ప్రాక్టీసులు
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - భద్రత, ప్రదర్శన, మరియు మానిటరింగ్

### 4. మరిన్ని టెంప్లేట్లను అన్వేషించండి
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

### నేర్చుకునే సామగ్రి
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### కమ్యూనిటీ & సపోర్ట్
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### టెంప్లేట్లు & ఉదాహరణలు
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**మీ మొదటి azd ప్రాజెక్ట్ పూర్తి చేసినందుకు అభినందనలు!** మీరు ఇప్పుడు ధైర్యంతో Azureపై అద్భుతమైన అనువర్తనాలు నిర్మించి డిప్లాయ్ చేయడానికి సిద్ధంగా ఉన్నారు.

---

**చాప్టర్ నావిగేషన్:**
- **📚 కోర్స్ హోమ్**: [AZD ప్రారంభీకరించాలనుకుంటున్నవారికి](../../README.md)
- **📖 ప్రస్తుతం చాప్టర్**: Chapter 1 - Foundation & Quick Start
- **⬅️ గతం**: [Installation & Setup](installation.md)
- **➡️ తదుపరి**: [Configuration](configuration.md)
- **🚀 తదుపరి చాప్టర్**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **తదుపరి పాఠం**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**బాధ్యతా మినహాయింపు**:
ఈ పత్రాన్ని AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి శ్రద్ధ పెట్టినప్పటికీ, స్వయంచాలక అనువాదాల్లో తప్పులు లేదా లోపాలు ఉండవచ్చు అని దయచేసి గమనించండి. మూల పత్రాన్ని దాని స్థానిక భాషలోని ప్రతిలేఖను అధికారిక మూలంగా పరిగణించాలి. ముఖ్యమైన సమాచారానికి, వృత్తిపరులైన మానవ అనువాదం సిఫార్సు చేయబడుతుంది. ఈ అనువాదాన్ని ఉపయోగించడం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుగా అర్థం చేసుకోవడాలకు మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->