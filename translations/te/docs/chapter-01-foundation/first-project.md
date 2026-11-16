# మీ మొదటి ప్రాజెక్ట్ - ప్రాయోగిక పాఠం

**అధ్యాయ నావిగేషన్:**
- **📚 కోర్స్ హోమ్**: [AZD For Beginners](../../README.md)
- **📖 ప్రస్తుత అధ్యాయము**: అధ్యాయము 1 - ఫౌండేషన్ & క్విక్ స్టార్టు
- **⬅️ ముందు**: [ఇన్‌స్టాలేషన్ & సెటప్](installation.md)
- **➡️ తదుపరి**: [మీ స్వంత యాప్‌ని తీసుకోండి](bring-your-own-app.md)
- **🚀 తదుపరి అధ్యాయం**: [అధ్యాయము 2: AI-ఫస్ట్ డెవలప్మెంట్](../chapter-02-ai-development/microsoft-foundry-integration.md)

## పరిచయం

మీ తొలి Azure డెవలపర్ CLI ప్రాజెక్ట్‌కు స్వాగతం! మీరు React ఫ్రంట్ ఎండ్, Node.js API, మరియు Azure Cosmos DB కలిగిన todo అప్లికేషన్‌ను డిప్లాయ్ చేయబోతున్నారు. టెంప్లేట్ పాత పేరు `todo-nodejs-mongo` ని కలిపి ఉంచుతుంది; ప్రస్తుత ఇన్‌ఫ్రాస్ట్రక్చర్ Cosmos DBని NoSQL కోసం ఉపయోగిస్తుంది, కాబట్టి డౌన్‌లోడ్ చేసిన README మరియు `infra/` ను పరిశీలించండి, పేరు ఆధారంగా డేటాబేస్ APIని ఊహించవద్దు.

> నవంబర్ 2026లో `azd 1.37.2` మరియు పబ్లిక్ టెంప్లేట్‌ను పునరావృతంగా సమీక్షించబడింది. కింది ఉదాహరణలు Bashని ఉపయోగిస్తాయి; JSON ఎగ్జ్‌ట్రాక్షన్‌కు కూడా `jq` అవసరం. Azure డిప్లాయ్‌మెంట్లు ఛార్జీలు కలిగిస్తాయి మరియు ఈ సమీక్ష సమయంలో క జరగలేదు.

## నేర్చుకునే లక్ష్యాలు

ఈ ట్యుటోరియల్‌ను పూర్తిచేసి, మీరు:
- టెంప్లేట్స్ ఉపయోగించి azd ప్రాజెక్ట్ ప్రారంభ ఫ్లోని అధిగమిస్తారు
- Azure డెవలపర్ CLI ప్రాజెక్ట్ శ్రుచి మరియు కాన్ఫిగరేషన్ ఫైళ్లను అర్థం చేసుకుంటారు
- ఇన్‌ఫ్రాస్ట్రక్చర్ ప్రొవిజనింగ్‌తో కూడిన పూర్తి అప్లికేషన్‌ను Azure లో డిప్లాయ్ చేస్తారు
- అప్లికేషన్ అప్‌డేట్‌లు మరియు పునఃడిప్లాయ్‌మెంట్ వ్యూహాలను అమలు చేస్తారు
- అభివృద్ధి మరియు స్టేజింగ్ కోసం బహుళ పరిసరాలను నిర్వహిస్తారు
- వనరుల శుభ్రత మరియు ఖర్చు నిర్వహణ ప్రాక్టీసులను వర్తింపజేస్తారు

## నేర్చిన ఫలితాలు

పూర్తిచేసిన తర్వాత, మీరు చేయగలుగుతారు:
- స్వతంత్రంగా టెంప్లేట్స్ నుంచి azd ప్రాజెక్టులను ప్రారంభించి కాన్ఫిగర్ చేయడం
- azd ప్రాజెక్ట్ నిర్మాణాన్ని సమర్థవంతంగా నావిగేట్ చేసి మార్పులు చేయడం
- ఏకైక క‌మాండ్‌ల‌ను ఉపయోగించి Azureకి ఫుల్-స్టాక్ అప్లికేషన్లను పంపిణీ చేయడం
- సాధారణ డిప్లాయ్‌మెంట్ సమస్యలు మరియు హెచ్చరిక సమస్యలు పరిష్కరించడం
- వివిధ డిప్లాయ్‌మెంట్ దశలు కోసం బహుళ Azure పరిసరాలను నిర్వహించడం
- అప్లికేషన్ అప్‌డేట్‌ల కోసం నిరంతర డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లోలను అమలు చేయడం

## ప్రారంభించటం

### అవసరమైన వస్తువుల జాబితా
- ✅ Azure డెవలపర్ CLI ఇన్‌స్టాల్ చేశారు ([ఇన్‌స్టాలేషన్ గైడ్](installation.md))
- ✅ AZD ప్రమాణపత్రం పూర్తి చేసి `azd auth login`ని ఉపయోగించారు
- ✅ మీ సిస్టమ్‌లో Git ఇన్‌స్టాల్ చేశారు
- ✅ Node.js 22 LTS (లేదా డౌన్‌లోడ్ చేసిన టెంప్లేట్ కోరుకున్న మద్దతు ఉన్న వెర్షన్)
- ✅ Visual Studio Code (సిఫారసు చేసినది)

ముందుకు ముందుకు పోవడానికి ముందు, రిపాజిటరీ రూట్ నుండి సెటప్ నిర్ధారకాన్ని నడపండి:

**విండోస్:** `./validate-setup.ps1`

**macOS / లినక్స్:** `bash ./validate-setup.sh`

### మీ సెటప్‌ను ధృవీకరించండి
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### ఐచ్ఛిక Azure CLI ప్రమాణపత్రాన్ని ధృవీకరించండి

```bash
az account show
```

### Node.js వెర్షన్‌ను తనిఖీ చేయండి
```bash
node --version
```

## దశ 1: ఒక టెంప్లేట్ ఎంచుకొని ప్రారంభించండి

React ఫ్రంట్ ఎండ్ మరియు Node.js API బ్యాక్ ఎండ్ కలిగిన ప్రాచుర్య పొందిన todo అప్లికేషన్ టెంప్లేట్‌తో ప్రారంభిద్దాం.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### ఏమి జరిగింది?
- టెంప్లేట్ కో드를 మీ స్థానిక డైరెక్టరీకు డౌన్‌లోడ్ చేశారు
- సర్వీస్ నిర్వచనాలతో ఒక `azure.yaml` ఫైల్ సృష్టించారు
- `infra/` డైరెక్టర్ లో ఇన్‌ఫ్రాస్ట్రక్చర్ కోడ్ సెట్‌అప్ చేశారు
- ఒక పరిసర కాన్ఫిగరేషన్ సృష్టించారు

## దశ 2: ప్రాజెక్ట్ నిర్మాణాన్ని పరిశీలించండి

azd మా కోసం ఏమి సృష్టించిందో చూద్దాం:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

మీరు చూడగలుగుతారు:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### అర్థం చేసుకోవాల్సిన ముఖ్యమైన ఫైళ్ళు

**azure.yaml** - మీ azd ప్రాజెక్ట్ గుండె:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - ఇన్‌ఫ్రాస్ట్రక్చర్ నిర్వచనం:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## దశ 3: మీ ప్రాజెక్ట్‌ను అనుకూలీకరించండి (ఐచ్చికం)

డిప్లాయ్‌మెంట్‌కి ముందు, మీరు అప్లికేషన్‌ను అనుకూలీకరించవచ్చు:

### ఫ్రంట్ ఎండ్‌ని మార్చండి
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

సులభమైన మార్పు చేయండి:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### పరిసర వేరియబుల్స్‌ను కాన్ఫిగర్ చేయండి
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

ఈ రెండు కస్టమ్ విలువలు స్థానిక నిల్వను మాత్రమే చూపిస్తాయి. స్టాక్ టెంప్లేట్ `WEBSITE_TITLE` లేదా `API_VERSION`ని ఉపయోగించదు, కాబట్టి అవి యాప్‌ను మార్చవు. పై స్పష్టమైన మూలం సవరింపు ప్రదర్శించబడిన శీర్షికను మార్చుతుంది.

## దశ 4: Azureకి డిప్లాయ్ చేయండి

ఇప్పుడు ఆసక్తికరమైన భాగం - అన్ని విషయాలను Azureకి డిప్లాయ్ చెయండి!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### డిప్లాయ్‌మెంట్ సమయంలో ఏమి జరుగుతోంది?

వర్క్‌ఫ్లో ఇన్‌ఫ్రాస్ట్రక్చర్‌ను ప్రొవైజన్ చేసి ప్యాకేజీ/డిప్లాయ్ చేస్తుంది. ఖచ్చితమైన సూచికలను `workflows.up` ద్వారా `azure.yaml` లో కస్టమైజ్ చేయవచ్చు; ఈ టెంప్లేట్ ప్రొవిజన్ తర్వాత డిప్లాయ్‌ను సూచిస్తుంది. ప్రతి టెంప్లేట్ కోసం ఒకే ఒక ఏకకాల దశ క్రమాన్ని ఆధారపడవద్దు.

### ఆశించిన అవుట్పుట్
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## దశ 5: మీ అప్లికేషన్‌ను పరీక్షించండి

### మీ అప్లికేషన్‌కి ప్రాప్తి పొందండి
డిప్లాయ్‌మెంట్ అవుట్పుట్‌లో ఇచ్చిన URL పై క్లిక్ చేయండి, లేదా ఎప్పుడైనా పొందండి:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Todo యాప్‌ను పరీక్షించండి
1. **Todo అంశం జోడించండి** - "Add Todo" నొక్కి ఒక టాస్క్ నమోదు చేయండి
2. **పూర్తయినట్లు గుర్తు చేయండి** - పూర్తయిన అంశాలను బ్రౌజ్ చేయండి
3. **అంశాలను తొలగించండి** - అవసరం లేని టోడోలు తొలగించండి

### మీ అప్లికేషన్‌ను పర్యవేక్షించండి
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ మీ డిప్లాయ్‌మెంట్‌ను ధృవీకరించండి

ముందుకుపోేము ముందు, ఈ తక్షణ జాబితా ద్వారా కలిగిన ప్రతిదీ సరిగ్గా పనిచేస్తుందో నిర్ధారించుకోండి — "డిప్లాయ్ సక్సెస్ అయ్యింది" అంటే "యాప్ బాగుంది" అన్నది కాదు:

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**డిప్లాయ్‌మెంట్ ధృవీకరణ:**
- ✅ `azd show` దాకా చేరుకునే ఎండ్‌పాయింట్ URLని చూపిస్తుంది
- ✅ URL మీ బ్రౌజర్‌లో లోపాలేకుండా తెరుస్తుంది
- ✅ ప్రధాన ఫీచర్లు పనిచేస్తున్నాయి (జోడించడం/పూర్తిచేయడం/తొలగించడం)
- ✅ `azd monitor --logs` అభ్యర్థనలు వస్తున్నాయని చూపిస్తుంది, అనూహ్య లోపాలు లేవు

ఏదైనా తనిఖీ విఫలమైతే, [అధ్యాయము 7: సమస్యలు పరిష్కారం](../chapter-07-troubleshooting/README.md) కి వెళ్లండి.

## దశ 6: మార్పులు చేసి మళ్లీ డిప్లాయ్ చేయండి

ఒక మార్పు చేసి ఎంత సులభంగా అప్‌డేట్ చేయవచ్చో చూద్దాం:

### APIని మార్చండి
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

కస్టమ్ స్పందన హెడ్డర్ జోడించండి:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### కేవలం కోడ్ మార్పులను మాత్రమే డిప్లాయ్ చేయండి
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## దశ 7: బహుళ పరిసరాలను నిర్వహించండి

ఉత్పత్తికి ముందు మార్పులను పరీక్షించడానికి స్టేజింగ్ పరిసరాన్ని సృష్టించండి:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### పరిసరాల పోలిక
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## దశ 8: వనరులను శుభ్రం చేయండి

మీరు ప్రయోగం పూర్తిచేసిన తర్వాత, కొనసాగుతున్న ఛార్జీలను తప్పించుకోవడానికి శుభ్రం చేయండి:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## క్లాసికల్ యాప్ vs. AI శక్తివంతమైన యాప్: సమాన వర్క్‌ఫ్లో

మీరు సాధారణ వెబ్ అప్లికేషన్‌ను డిప్లాయ్ చేసారు. కానీ మీరు Microsoft Foundry Models తో బ్యాక్ చేసిన చాట్ అప్లికేషన్ వంటి AI-పవర్డెడ్ యాప్‌ను డిప్లాయ్ చేయాలనుకుంటే?

మంచి వార్త: **వర్క్‌ఫ్లో ఒకటే.**

| దశ | క్లాసిక్ టోడో యాప్ | AI చాట్ యాప్ |
|------|-----------------|-------------|
| ప్రారంభం (ఖాళీ డైరెక్టరీ) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| ప్రమాణపత్రం | `azd auth login` | `azd auth login` |
| డిప్లాయ్ | `azd up` | `azd up` |
| పర్యవేక్షణ | `azd monitor` | `azd monitor` |
| శుభ్రం | `azd down --force --purge` | `azd down --force --purge` |

లైఫ్సైకిల్ కమాండ్‌లు ఒకటే కాని, అవసరాలు భిన్నంగా వుంటాయి. AI టెంప్లేట్ మోడల్ ప్రాప్యత, ప్రాంతీయ కోటా, డేటా ఇంజెస్టు, అదనపు కాన్ఫిగరేషన్ అవసరమవుతుంది. డిప్లాయ్‌మెంట్ ముందు READMEని చదవండి; `azd up` గాలి అనుమతులు లేదా కోటా అందజేయలేరు.

ఇది azd యొక్క ముఖ్య సూత్రం: **ఒక వర్క్‌ఫ్లో, ఎలాంటి వర్క్లోడ్.** ఈ ట్యుటోరియల్‌లో మీరు సాధించిన నైపుణ్యాలు — ప్రారంభపరచడం, డిప్లాయ్ చేయడం, పర్యవేక్షించడం, పునఃడిప్లాయ్ చేయడం, మరియు శుభ్రం చేయడం — AI అప్లికేషన్లు మరియు ఏజెంట్ల కొరకు కూడా వర్తిస్తాయి.

---

## మీరు నేర్చుకున్నది

అభినందనలు! మీరు విజయవంతంగా:
- ✅ టెంప్లేట్ నుండి azd ప్రాజెక్ట్‌ను ప్రారంభించారు
- ✅ ప్రాజెక్ట్ నిర్మాణం మరియు ముఖ్య ఫైళ్లను పరిశీలించారు
- ✅ Azureకు పూర్తి-స్టాక్ అప్లికేషన్‌ను డిప్లాయ్ చేశారు
- ✅ కోడ్ మార్పులు చేసి పునఃడిప్లాయ్ చేశారు
- ✅ బహుళ పరిసరాలను నిర్వహించారు
- ✅ వనరులను శుభ్రం చేశారు

## 🎯 నైపుణ్య ధృవీకరణ వ్యాయామాలు

### వ్యాయామం 1: వేరే టెంప్లేట్‌ను డిప్లాయ్ చేయండి (15 నిమిషాలు)
**లక్ష్యం**: azd init మరియు డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లో నైపుణ్యాన్ని ప్రదర్శించండి

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**విజయ ప్రమాణాలు:**
- [ ] అప్లికేషన్ లోపాలేకుండా డిప్లాయ్ అయింది
- [ ] బ్రౌజర్‌లో అప్లికేషన్ URL కి ప్రాప్తి ఉంది
- [ ] అప్లికేషన్ సరిగ్గా పనిచేస్తుంది (టోడోలు జోడించడం/తొలగించడం)
- [ ] విజయవంతంగా అన్ని వనరులను శుభ్రం చేశారు

### వ్యాయామం 2: కాన్ఫిగరేషన్‌ను అనుకూలీకరించండి (20 నిమిషాలు)
**లక్ష్యం**: రన్‌టైమ్ కాన్ఫిగరేషన్ తో భ్రమ పుట్టకుండా స్థానిక పరిసర విలువ సేకరణను సాధన చేయండి

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**విజయ ప్రమాణాలు:**
- [ ] కస్టమ్ పరిసరం విజయవంతంగా సృష్టించబడింది
- [ ] పరిసర వేరియబుల్స్ సెట్ అయి పొందగలవు
- [ ] `azd env get-value APP_TITLE` `My Custom Todo App` ని ప్రింట్ చేస్తుంది
- [ ] ఈ విలువలు స్టాక్ యాప్‌ను మార్చకపోవడానికి కారణం వివరణగా చెప్పగలగాలి  

### వ్యాయామం 3: బహుళ పరిసరాల వర్క్‌ఫ్లో (25 నిమిషాలు)
**లక్ష్యం**: పరిసర నిర్వహణ మరియు డిప్లాయ్‌మెంట్ వ్యూహాలను ఆధిపత్యం చేయండి

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**విజయ ప్రమాణాలు:**
- [ ] రెండు వేరే కాన్ఫిగరేషన్లతో పరిసరాలు సృష్టించబడ్డాయి
- [ ] రెండు పరిసరాలూ విజయవంతంగా డిప్లాయ్ అయ్యాయి
- [ ] `azd env select` ద్వారా పరిసరాల మధ్య మార్చుకోగలగాలి
- [ ] పరిసర వేరియబుల్స్ పరిసరాల మధ్య భిన్నంగా ఉన్నాయి
- [ ] రెండు పరిసరాలను విజయవంతంగా శుభ్రం చేశారు

## 📊 మీ పురోగతి

**కాలం పెట్టుబడి**: సుమారు 60-90 నిమిషాలు  
**నైపుణ్యాలు పొందినవి**:
- ✅ టెంప్లేట్ ఆధారిత ప్రాజెక్ట్ ప్రారంభం
- ✅ Azure వనరుల ప్రొవిజనింగ్
- ✅ అప్లికేషన్ డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లోలు
- ✅ పరిసరాల నిర్వహణ
- ✅ కాన్ఫిగరేషన్ నిర్వహణ
- ✅ వనరుల శుభ్రత మరియు ఖర్చుల నిర్వహణ

**తదుపరి స్థాయి**: మీరు [కాన్ఫిగరేషన్ గైడ్](../chapter-03-configuration/configuration.md) కొరకు సిద్ధంగా ఉన్నారు, అగ్రగామి కాన్ఫిగరేషన్ నమూనాలు నేర్చుకోండి!

## సాధారణ సమస్యలను పరిష్కరించడం

### ప్రమాణపత్ర లోపాలు
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### డిప్లాయ్‌మెంట్ విఫలతలు
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### వనరు పేరు సంగతులు
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### పోర్ట్/నెట్‌వర్క్ సమస్యలు
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## తదుపరి దశలు

ఇప్పుడు మీరు మీ మొదటి ప్రాజెక్ట్ పూర్తి చేసారు, ఈ అభివృద్ధి అంశాలను పరిశీలించండి:

### 1. ఇన్‌ఫ్రాస్ట్రక్చర్‌ను అనుకూలీకరించండి
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [డేటాబేస్ ఇన్‌ఫ్రాస్ట్రక్చర్‌ను జోడించండి](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. CI/CD సెట్ చేయండి
- [డిప్లాయ్‌మెంట్ గైడ్](../chapter-04-infrastructure/deployment-guide.md) - పూర్తి CI/CD వర్క్‌ఫ్లోలు
- [Azure Developer CLI డాక్యుమెంటేషన్](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - పైప్‌లైన్ కాన్ఫిగరేషన్

### 3. ఉత్పత్తి ఉత్తమ ప్రాక్టీసులు
- [డిప్లాయ్‌మెంట్ గైడ్](../chapter-04-infrastructure/deployment-guide.md) - భద్రత, పనితీరు, మరియు పర్యవేక్షణ

### 4. మరిన్ని టెంప్లేట్స్ పరిశీలించండి
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## అదనపు వనరులు

### నేర్చుకునే వస్తువులు
- [Azure Developer CLI డాక్యుమెంటేషన్](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure ఆర్కిటెక్చర్ సెంటర్](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure వెల్-ఆర్కిటెక్చర్డ్ ఫ్రేమ్‌వర్క్](https://learn.microsoft.com/en-us/azure/well-architected/)

### కమ్యూనిటీ & మద్దతు
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### టెంప్లేట్స్ & ఉదాహరణలు
- [అధికారిక టెంప్లేట్ గ్యాలరీ](https://azure.github.io/awesome-azd/)
- [కమ్యూనిటీ టెంప్లేట్ కాంట్రిబ్యూషన్స్](https://github.com/Azure/awesome-azd)
- [Todo టెంప్లేట్ సోర్స్](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**మీ మొదటి azd ప్రాజెక్ట్ పూర్తి చేసినందుకు అభినందనలు!** మీరు ఇప్పుడు ధైర్యంగా Azureపై అద్భుతమైన అప్లికేషన్లను సృష్టించి డిప్లాయ్ చేయడానికి సిద్ధంగా ఉన్నారు.

---

**అధ్యాయ నావిగేషన్:**
- **📚 కోర్స్ హోమ్**: [AZD For Beginners](../../README.md)
- **📖 ప్రస్తుత అధ్యాయము**: అధ్యాయము 1 - ఫౌండేషన్ & క్విక్ స్టార్టు
- **⬅️ ముందు**: [ఇన్‌స్టాలేషన్ & సెటప్](installation.md)
- **➡️ తదుపరి**: [మీ స్వంత యాప్‌ని తీసుకోండి](bring-your-own-app.md)
- **🚀 తదుపరి అధ్యాయం**: [అధ్యాయము 2: AI-ఫస్ట్ డెవలప్మెంట్](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->