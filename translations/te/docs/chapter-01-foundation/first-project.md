# మీ మొదటి ప్రాజెక్ట్ -Hands-On ట్యుటోరియల్

**చాప్టర్ నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD For Beginners](../../README.md)
- **📖 ప్రస్తుత చాప్టర్**: Chapter 1 - Foundation & Quick Start
- **⬅️ గతం**: [Installation & Setup](installation.md)
- **➡️ తదుపరి**: [Configuration](configuration.md)
- **🚀 తర్వాతి చాప్టర్**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## పరిచయం

మీ మొదటి Azure Developer CLI ప్రాజెక్టుకు స్వాగతం! ఈ సమగ్ర హ్యాన్‍స్-ఆన్ ట్యుటోరియల్ azd ఉపయోగించి Azureపై పూర్తి-స్టాక్ అప్లికేషన్‌ను సృష్టించడం, డిప్లాయ్ చేయడం మరియు నిర్వహించడం గురించి పూర్తి వాక్‌థ్రూ అందిస్తుంది. మీరు React ఫ్రంట్‌ఎండ్, Node.js API బ్యాకెండ్, మరియు MongoDB డేటాబేస్‌ను కలిగిన ఒక వాస్తవ todo అప్లికేషన్‌తో పని చేస్తారు.

## నేర్చుకునే లక్ష్యాలు

ఈ ట్యుటోరియల్ పూర్తయిన తర్వాత, మీరు:
- టెంప్లేట్‌లను ఉపయోగించి azd ప్రాజెక్ట్ ప్రారంభ වర్క్‌ఫ్లోను నిపుణంగా掌握 చేయగలరని
- Azure Developer CLI ప్రాజెక్ట్ నిర్మాణం మరియు కాన్ఫిగరేషన్ ఫైళ్లను అర్థం చేసుకోగలరని
- ఇన్‌ఫ్రాస్ట్రక్చర్ ప్రావిజనింగ్‌తో Azureకి పూర్తి అప్లికేషన్ డిప్లాయ్ చేయగలరని
- అప్లికేషన్ నవీకరణలు మరియు మళ్లీ డిప్లాయ్ చేయడానికి వ్యూహాలను అమలు చేయగలరని
- అభివృద్ధి మరియు స్టేజింగ్ కోసం బహుళ ఎన్విరాన్‌మెంట్లను నిర్వహించగలరని
- వనరుల శుభ్రత మరియు ఖర్చు నిర్వహణ పద్ధతులను వర్తింపజేయగలరని

## నేర్చుకున్న ఫలితాలు

పాఠం పూర్తయిన తర్వాత, మీరు చేయగలరు:
- టెంప్లేట్‌ల నుండి azd ప్రాజెక్ట్‌లను స్వతంత్రంగా ప్రారంభించి కాన్ఫిగర్ చేయుట
- azd ప్రాజెక్ట్ నిర్మాణాలను ఫలప్రదంగా నావిగేట్ చేసి మార్చుకోవడం
- ఏకైక కమాండ్లతో Azureకి పూర్తి-స్టాక్ అప్లికేషన్లను డిప్లాయ్ చేయడం
- సాధారణ డిప్లాయ్ సమస్యలు మరియు ఆథెంటికేషన్ సమస్యలను ట్రబుల్షూట్ చేయడం
- వివిధ డిప్లాయ్ దశల కోసం బహుళ Azure ఎన్విరాన్‌మెంట్లను నిర్వహించడం
- అప్లికేషన్ నవీకరణల కోసం కంటిన్యూయస్ డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లోలను అమలు చేయడం

## ప్రారంభం

### ముందు అవసరాల జాబితా
- ✅ Azure Developer CLI ఇన్‌స్టాల్ చేయబడినది ([Installation Guide](installation.md))
- ✅ Azure CLI ఇన్‌స్టాల్ చేసి ఆథెంటికేట్ చేయబడింది
- ✅ మీ సిస్టమ్‌లో Git ఇన్‌స్టాల్ చేయబడింది
- ✅ Node.js 16+ (ఈ ట్యుటోరియల్ కోసం)
- ✅ Visual Studio Code (సిఫార్సు చేయబడింది)

### మీ సేతప్ ను ధృవీకరించండి
```bash
# azd ఇన్‌స్టాలేషన్‌ను తనిఖీ చేయండి
azd version
```
### Azure ప్రమాణీకరణను ధృవీకరించండి

```bash
az account show
```

### Node.js సంస్కరణను తనిఖీ చేయండి
```bash
node --version
```

## దశ 1: ఒక టెంప్లేట్ ఎంపిక చేసి ప్రారంభించండి

React ఫ్రంట్‌ఎండ్ మరియు Node.js API బ్యాకెండ్‌ను కలిగిన ప్రజాస్వామ్య todo అప్లికేషన్ టెంప్లేట్‌తో ప్రారంభిద్దాం.

```bash
# అందుబాటులో ఉన్న టెంప్లేట్లను బ్రౌజ్ చేయండి
azd template list

# todo యాప్ టెంప్లేట్ను ప్రారంభించండి
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# ప్రాంప్ట్‌లను అనుసరించండి:
# - ఒక ఎన్విరాన్‌మెంట్ పేరును నమోదు చేయండి: "dev"
# - ఒక సబ్‌స్క్రిప్షన్‌ను ఎంచుకోండి (మీకు అనేక ఉంటే)
# - ఒక ప్రాంతాన్ని ఎంచుకోండి: "East US 2" (లేదా మీ ఇష్టమైన ప్రాంతం)
```

### ఏమి జరిగింది?
- టెంప్లేట్ కోడ్‌ను మీ స్థానిక డైరెక్టరీకి డౌన్లోడ్ అయ్యింది
- సేవ నిర్వచనాలతో `azure.yaml` ఫైల్ సృష్టించడం జరిగింది
- `infra/` డైరెక్టరీలో ఇన్‌ఫ్రాస్ట్రక్చర్ కోడ్ సెటప్ చేయబడింది
- ఒక ఎన్విరాన్‌మెంట్ కాన్ఫిగరేషన్ సృష్టించబడింది

## దశ 2: ప్రాజెక్ట్ నిర్మాణం పరిశీలించండి

azd మన కోసం ఏమి సృష్టించిందో పరిశీలしましょう:

```bash
# ప్రాజెక్ట్ నిర్మాణం చూడండి
tree /f   # విండోస్
# లేదా
find . -type f | head -20   # macOS/లినక్స్
```

మీరు చూడగలరు:
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

### అర్థం చేసుకోవాల్సిన కీలక ఫైళ్ళు

**azure.yaml** - మీ azd ప్రాజెక్ట్ యొక్క హృదయం:
```bash
# ప్రాజెక్ట్ కాన్ఫిగరేషన్‌ను చూడండి
cat azure.yaml
```

**infra/main.bicep** - ఇన్‌ఫ్రాస్ట్రక్చర్ నిర్వచనం:
```bash
# ఇన్‌ఫ్రాస్ట్రక్చర్ కోడ్‌ను వీక్షించండి
head -30 infra/main.bicep
```

## దశ 3: మీ ప్రాజెక్టును అనుకూలీకరించండి (ఐచ్ఛికం)

డిప్లాయ్ చేయకముందు, మీరు అప్లికేషన్‌ను అనుకూలీకరించవచ్చు:

### ఫ్రంట్‌ఎండ్‌ను సవరించండి
```bash
# React యాప్ కంపోనెంట్‌ను తెరవండి
code src/web/src/App.tsx
```

సరళమైన మార్పు చేయండి:
```typescript
// శీర్షికను కనుగొని దాన్ని మార్చండి
<h1>My Awesome Todo App</h1>
```

### ఎన్విరాన్‌మెంట్ వేరియబుల్స్‌ను అమర్చండి
```bash
# కస్టమ్ పర్యావరణ చరాలు సెట్ చేయండి
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# అన్ని పర్యావరణ చరాలను చూడండి
azd env get-values
```

## దశ 4: Azureలో డిప్లాయ్ చేయండి

ఇప్పుడైతే ఆసక్తికరమైన భాగం - అన్నింటినీ Azureకు డిప్లాయ్ చేయండి!

```bash
# ఇన్ఫ్రాస్ట్రక్చర్ మరియు అప్లికేషన్‌ను అమలు చేయండి
azd up

# ఈ కమాండ్ చేయబోతుంది:
# 1. Azure వనరులను (App Service, Cosmos DB, మొదలైనవి) ఏర్పాటు చేయండి
# 2. మీ అప్లికేషన్‌ను నిర్మించండి
# 3. ఏర్పాటు చేసిన వనరులకు అప్లికేషన్‌ను డిప్లాయ్ చేయండి
# 4. అప్లికేషన్ URLను ప్రదర్శించండి
```

### డిప్లాయ్ సమయంలో ఏమి జరుగుతుంది?

`azd up` కమాండ్ ఈ చర్యలను నిర్వహిస్తుంది:
1. **Provision** (`azd provision`) - Azure రిసోర్సులను సృష్టిస్తుంది
2. **Package** - మీ అప్లికేషన్ కోడ్‌ను బిల్డ్ చేస్తుంది
3. **Deploy** (`azd deploy`) - కోడ్‌ను Azure రిసోర్సులకు డిప్లాయ్ చేస్తుంది

### అంచనా ఫలితం
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
డిప్లాయ్ అవుట్‌పుట్‌లో ఇవ్వబడిన URL పై క్లిక్ చేయండి, లేదా ఎప్పుడైనా తీసుకోండి:
```bash
# అప్లికేషన్ ఎండ్పాయింట్లను పొందండి
azd show

# మీ బ్రౌజర్‌లో అప్లికేషన్‌ను తెరవండి
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo యాప్‌ను పరీక్షించండి
1. **Add a todo item** - "Add Todo" పై క్లిక్ చేసి ఒక టాస్క్ నమోదు చేయండి
2. **Mark as complete** - పూర్తైన అంశాలను మూసివేయండి
3. **Delete items** - మీరు ఇక కావాల్సిన Todos తొలగించండి

### మీ అప్లికేషన్‌ను మానిటర్ చేయండి
```bash
# మీ వనరుల కోసం Azure పోర్టల్ తెరవండి
azd monitor

# అప్లికేషన్ లాగ్‌లను వీక్షించండి
azd monitor --logs

# లైవ్ మెట్రిక్స్‌ను వీక్షించండి
azd monitor --live
```

## దశ 6: మార్పులు చేసి మళ్లీ డిప్లాయ్ చేయండి

ముందుకు వెళ్లి ఒక మార్పు చేసి అది ఎంత సులభంగా అప్డేట్ అవుతుండో చూద్దాం:

### APIని సవరించండి
```bash
# API కోడ్‌ను సవరించండి
code src/api/src/routes/lists.js
```

ఒక కస్టమ్ రిస్పాన్స్ హెడ్డర్‌ను జోడించండి:
```javascript
// ఒక రూట్ హ్యాండ్లర్‌ను కనుగొని జోడించండి:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### కేవలం కోడ్ మార్పులను మాత్రమే డిప్లాయ్ చేయండి
```bash
# కేవలం అప్లికేషన్ కోడ్‌ను మాత్రమే డిప్లాయ్ చేయండి (ఇన్‌ఫ్రాస్ట్రక్చర్‌ను స్కిప్ చేయండి)
azd deploy

# ఇన్‌ఫ్రాస్ట్రక్చర్ արդեն ఉంది కాబట్టి ఇది 'azd up' కంటే చాలా వేగంగా ఉంటుంది
```

## దశ 7: బహుళ ఎన్విరాన్‌మెంట్‌లను నిర్వహించండి

ప్రొడక్షన్‌కు ముందు మార్పులను పరీక్షించడానికి ఒక స్టేజింగ్ ఎన్విరాన్‌మెంట్ సృష్టించండి:

```bash
# కొత్త స్టేజింగ్ వాతావరణాన్ని సృష్టించండి
azd env new staging

# స్టేజింగ్‌కు డిప్లాయ్ చేయండి
azd up

# డెవ్ వాతావరణానికి తిరిగి మారండి
azd env select dev

# అన్ని వాతావరణాలను జాబితా చేయండి
azd env list
```

### ఎన్విరాన్‌మెంట్ పోలిక
```bash
# డెవలప్‌మెంట్ పర్యావరణాన్ని చూడండి
azd env select dev
azd show

# స్టేజింగ్ పర్యావరణాన్ని చూడండి
azd env select staging
azd show
```

## దశ 8: వనరులను శుభ్రం చేయండి

పరীক্ষణ ముగిసిన తర్వాత, కొనసాగించే ఛార్జీలను నివారించడానికి వనరులను శుభ్రం చేయండి:

```bash
# ప్రస్తుత పర్యావరణానికి సంబంధించిన అన్ని Azure వనరులను తొలగించండి
azd down

# నిర్ధారణ లేకుండా బలవంతంగా తొలగించండి మరియు సాఫ్ట్-డిలీట్ అయిన వనరులను శుద్ధి చేయండి
azd down --force --purge

# నిర్దిష్ట పర్యావరణాన్ని తొలగించండి
azd env select staging
azd down --force --purge
```

## మీరు ఏమి నేర్చుకున్నారు

అభినందనలు! మీరు విజయవంతంగా:
- ✅ టెంప్లేట్ నుండి ఒక azd ప్రాజెక్ట్‌ను ప్రారంభించారు
- ✅ ప్రాజెక్ట్ నిర్మాణం మరియు కీలక ఫైళ్లను పరిశీలించారు
- ✅ Azureలో ఒక పూర్తి-స్టాక్ అప్లికేషన్‌ను డిప్లాయ్ చేశారు
- ✅ కోడ్ మార్పులు చేసి మళ్లీ డిప్లాయ్ చేయగలిగారు
- ✅ బహుళ ఎన్విరాన్‌మెంట్‌లను నిర్వహించారు
- ✅ వనరులను శుభ్రం చేశారు

## 🎯 నైపుణ్య నిర్ధారణ వ్యాయామాలు

### వ్యాయామం 1: వేరే టెంప్లేట్ డిప్లాయ్ చేయండి (15 నిమిషాలు)
**లక్ష్యం**: azd init మరియు డిప్లాయ్ వర్క్‌ఫ్లోలో నైపుణ్యాన్ని ప్రదర్శించండి

```bash
# Python + MongoDB స్టాక్ ప్రయత్నించండి
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# డిప్లాయ్‌మెంట్‌ను ధృవీకరించండి
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# శుభ్రపరచండి
azd down --force --purge
```

**సక్సెస్ క్రైటీరియా:**
- [ ] అప్లికేషన్ పొరపాట్ల లేకుండా డిప్లాయ్ అవుతుంది
- [ ] బ్రౌజర్‌లో అప్లికేషన్ URLకు యాక్సెస్ చేయగలగాలి
- [ ] అప్లికేషన్ సరైనంగా పనిచేస్తోంది (todoలు జోడించు/తొలగించు)
- [ ] అన్ని వనరులను విజయవంతంగా శుభ్రం చేశారు

### వ్యాయామం 2: కాన్ఫిగరేషన్ అనుకూలీకరించండి (20 నిమిషాలు)
**లక్ష్యం**: ఎన్విరాన్‌మెంట్ వేరియబుల్ కాన్ఫిగరేషన్ ప్రాక్టీస్ చేయండి

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

**సక్సెస్ క్రైటీరియా:**
- [ ] కస్టమ్ ఎన్విరాన్‌మెంట్ విజయవంతంగా సృష్టించబడింది
- [ ] ఎన్విరాన్‌మెంట్ వేరియబుల్స్ అమర్చబడ్డాయి మరియు పొందగలుగుతారు
- [ ] కస్టమ్ కాన్ఫిగరేషన్‌తో అప్లికేషన్ డిప్లాయ్ అయింది
- [ ] డిప్లాయ్ చేసిన యాప్‌లో కస్టమ్ సెట్టింగ్స్‌ని నిర్ధారించగలరు

### వ్యాయామం 3: బహుళఎన్విరాన్‌మెంట్ వర్క్‌ఫ్లో (25 నిమిషాలు)
**లక్ష్యం**: ఎన్విరాన్‌మెంట్ నిర్వహణ మరియు డిప్లాయ్ వ్యూహాల్లో నైపుణ్యం సాధించండి

```bash
# డెవ్ వాతావరణాన్ని సృష్టించండి
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# డెవ్ URL ను గమనించండి
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# స్టేజింగ్ వాతావరణాన్ని సృష్టించండి
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

# రెండు వాతావరణాలను శుభ్రం చేయండి
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**సక్సెస్ క్రైటీరియా:**
- [ ] రెండు ఎన్విరాన్‌మెంట్‌లు వేరే కాన్ఫిగరేషన్లతో సృష్టించబడ్డాయి
- [ ] రెండు ఎన్విరాన్‌మెంట్‌లు విజయవంతంగా డిప్లాయ్ అయ్యాయి
- [ ] `azd env select` ఉపయోగించి ఎన్విరాన్‌మెంట్‌ల మధ్య మారవచ్చు
- [ ] ఎన్విరాన్‌మెంట్‌ల మధ్య వేరియబుల్స్ భిన్నంగా ఉంటాయి
- [ ] రెండు ఎన్విరాన్‌మెంట్‌లను విజయవంతంగా శుభ్రం చేశారు

## 📊 మీ పురోగతి

**చెల్లించిన సమయం**: ~60-90 నిమిషాలు  
**అర్జించిన నైపుణ్యాలు**:
- ✅ టెంప్లేట్-ఆధారిత ప్రాజెక్ట్ ప్రారంభం
- ✅ Azure రిసోర్స్ ప్రావిజనింగ్
- ✅ అప్లికేషన్ డిప్లాయ్ వర్క్‌ఫ్లోలు
- ✅ ఎన్విరాన్‌మెంట్ నిర్వహణ
- ✅ కాన్ఫిగరేషన్ నిర్వహణ
- ✅ వనరు శుభ్రత మరియు ఖర్చు నిర్వహణ

**తరువాతి నైవల్**: మీరు [కాన్ఫిగరేషన్ గైడ్](configuration.md) కోసం సిద్ధం అయ్యారు, ఇందులో అధునాతన కాన్ఫిగరేషన్ ప్యాటర్న్స్ నేర్చుకోండి!

## సాధారణ సమస్యల పరిష్కారం

### ఆథెంటికేషన్ లోపాలు
```bash
# Azure తో మళ్లీ ప్రమాణీకరించండి
az login

# సబ్‌స్క్రిప్షన్ యాక్సెస్‌ను నిర్ధారించండి
az account show
```

### డిప్లాయ్ వైఫల్యాలు
```bash
# డీబగ్ లాగింగ్‌ను సక్రియం చేయండి
export AZD_DEBUG=true
azd up --debug

# Azureలో అప్లికేషన్ లాగ్‌లను వీక్షించండి
azd monitor --logs

# Container Apps కోసం Azure CLI ఉపయోగించండి:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### రీసోర్స్ పేరు ఘర్షణలు
```bash
# ఒక ఏకైక ఎన్విరాన్‌మెంట్ పేరును ఉపయోగించండి
azd env new dev-$(whoami)-$(date +%s)
```

### పోర్ట్/నెట్‌వర్క్ సమస్యలు
```bash
# పోర్ట్లు అందుబాటులో ఉన్నాయో లేదో తనిఖీ చేయండి
netstat -an | grep :3000
netstat -an | grep :3100
```

## తదుపరి దశలు

ఇప్పుడు మీరు మీ మొదటి ప్రాజెక్ట్ పూర్తి చేశారనుకుంటే, ఈ అధునాతన అంశాలను అన్వేషించండి:

### 1. ఇన్‌ఫ్రాస్ట్రక్చర్‌ను అనుకూలీకరించండి
- [కోడ్ ద్వారా ఇన్‌ఫ్రాస్ట్రక్చర్](../chapter-04-infrastructure/provisioning.md)
- [డేటాబేస్‌లు, స్టోరేజ్, మరియు ఇతర సేవల్ని జోడించడం](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD సెటప్ చేయండి
- [డిప్లాయ్‌మెంట్ గైడ్](../chapter-04-infrastructure/deployment-guide.md) - పూర్తి CI/CD వర్క్‌ఫ్లోలు
- [Azure Developer CLI డాక్యుమెంటేషన్](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - పైప్‌లైన్ కాన్ఫిగరేషన్

### 3. ప్రొడక్షన్ ఉత్తమ పద్ధతులు
- [డిప్లాయ్‌మెంట్ గైడ్](../chapter-04-infrastructure/deployment-guide.md) - భద్రత, పనితీరు, మరియు మానిటరింగ్

### 4. ఇంకా టెంప్లేట్లను అన్వేషించండి
```bash
# వర్గం ప్రకారం టెంప్లేట్లు బ్రౌజ్ చేయండి
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
- [Azure Developer CLI డాక్యుమెంటేషన్](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### కమ్యూనిటీ & సపోర్ట్
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### టెంప్లేట్లు & ఉదాహరణలు
- [అధికారిక టెంప్లేట్ గ్యాలరీ](https://azure.github.io/awesome-azd/)
- [కమ్యూనిటీ టెంప్లేట్లు](https://github.com/Azure-Samples/azd-templates)
- [ఎంటర్‌ప్రైజ్ ప్యాటర్న్స్](https://github.com/Azure/azure-dev/tree/main/templates)

---

**మీ మొదటి azd ప్రాజెక్ట్ పూర్తి చేసినందుకు అభినందనలు!** ఇప్పుడు మీరు Azureపై అద్భుతమైన అప్లికేషన్లను ఆత్మవిశ్వాసంతో నిర్మించి డిప్లాయ్ చేయడానికి సిద్ధంగా ఉన్నారు.

---

**చాప్టర్ నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD For Beginners](../../README.md)
- **📖 ప్రస్తుత చాప్టర్**: Chapter 1 - Foundation & Quick Start
- **⬅️ గతం**: [Installation & Setup](installation.md)
- **➡️ తదుపరి**: [Configuration](configuration.md)
- **🚀 తర్వాతి చాప్టర్**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **తరువాతి లెసన్**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
బాధ్యత మినహాయింపు:
ఈ పత్రాన్ని AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి శ్రమించినప్పటికీ, ఆటోమేటెడ్ అనువాదాలలో తప్పులు లేదా లోపాలు ఉండవచ్చు అని దయచేసి గమనించండి. ముఖ్యమైన సమాచారానికి, మూల పత్రాన్ని దాని అసలు (మూల) భాషలోని పాఠాన్ని అధికారిక మూలంగా పరిగణించాలి మరియు వృత్తిపరులైన మానవ అనువాదాన్ని సిఫార్సు చేస్తున్నాము. ఈ అనువాదాన్ని ఉపయోగించడం వల్ల ఏర్పడిన ఏవైనా అపార్థాలు లేదా తప్పు భావనల కోసం మేము బాధ్యులు కాదు.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->