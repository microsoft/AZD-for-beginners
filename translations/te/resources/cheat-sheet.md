# కమాండ్ చీట్‌షీట్ - ముఖ్యమైన AZD కమాండ్లు

**అన్ని అధ్యాయాల కోసం శీఘ్ర సూచన**
- **📚 Course Home**: [AZD ప్రారంభీకులకు](../README.md)
- **📖 త్వరిత ప్రారంభం**: [అధ్యాయం 1: ఆధారం & త్వరిత ప్రారంభం](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI కమాండ్లు**: [అధ్యాయం 2: AI-ప్రధాన అభివృద్ధి](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 అధునాతన**: [అధ్యాయం 4: కోడ్ ద్వారా ఇన్ఫ్రాస్ట్రక్చర్](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## పరిచయం

ఈ సమగ్ర చీట్‌షీట్ సాధారణంగా ఉపయోగించే Azure Developer CLI కమాండ్లకు త్వరిత సూచికను అందిస్తుంది, వర్గాలవారిగా ప్రాక్టికల్ ఉదాహరణలతో క్రమబద్ధీకరించినది. azd ప్రాజెక్టుల అభివృద్ధి, సమస్య పరిష్కారం మరియు రోజువారీ ఆపరేషన్లలో త్వరితంగా సూచన కోసం ఇది చాలా ఉపయోగకరం.

## నేర్చుకునే లక్ష్యాలు

ఈ చీట్‌షీట్‌ను ఉపయోగించడం ద్వారా మీరు:
- ముఖ్యమైన Azure Developer CLI కమాండ్లు మరియు సింటాక్స్‌కు తక్షణ ప్రవేశం కలిగి ఉండడం
- కమాండ్లను ఫంక్షనల్ వర్గాలు మరియు వినియోగ కేసుల ప్రకారం ఎలా అమరిక చేయబడ్డాయో అర్థం చేసుకోవడం
- సాధారణ అభివృద్ధి మరియు డిప్లాయ్‌మెంట్ పరిస్థితుల కోసం ప్రాక్టికల్ ఉదాహరణలను సూచనగా కలిగి ఉండడం
- సమస్య పరిష్కారానికి అవసరమైన కమాండ్లను త్వరగా యాక్సెస్ చేయడం
- అధునాతన కాన్ఫిగరేషన్ మరియు కస్టమైజేషన్ ఎంపికలను సమర్థవంతంగా కనుగొనడం
- పరిసర నిర్వహణ మరియు బహుళ పరిసర వర్క్‌ఫ్లో కమాండ్లను కనుగొనడం

## నేర్చుకున్న ఫలితాలు

ఈ చీట్‌షీట్‌ను నిరంతరం సూచించినట్లయితే, మీరు చేయగలుగుతారు:
- పూర్తి డాక్యుమెంటేషన్ చూసే అవసరం లేకుండా azd కమాండ్లను నమ్మకంగా అమలు చేయడం
- సరైన డయాగ్నాస్టిక్ కమాండ్లను ఉపయోగించి సాధారణ సమస్యలను త్వరగా పరిష్కరించడం
- బహుళ పరిసరాలు మరియు డిప్లాయ్‌మెంట్ పరిస్థితులను సమర్థవంతంగా నిర్వహించడం
- అవసరానుసారంగా అధునాతన azd ఫీచర్లను మరియు కాన్ఫిగరేషన్ ఎంపికలను వర్తింపజేయడం
- వ్యవస్థాగత కమాండ్ వరుసలను ఉపయోగించి డిప్లాయ్‌మెంట్ సమస్యలను పరిష్కరించడం
- azd షార్ట్‌కట్లు మరియు ఎంపికలను సమర్థవంతంగా ఉపయోగించి వర్క్‌ఫ్లోలను ఆప్టిమైజ్ చేయడం

## ప్రారంభించడానికి కమాండ్లు

### ప్రమాణీకరణ
```bash
# AZD ద్వారా Azureలో లాగిన్ అవ్వండి
azd auth login

# Azure CLI కి లాగిన్ అవ్వండి (AZD దీన్ని అంతర్గతంగా ఉపయోగిస్తుంది)
az login

# ప్రస్తుత ఖాతాను తనిఖీ చేయండి
az account show

# డిఫాల్ట్ సబ్‌స్క్రిప్షన్‌ను సెట్ చేయండి
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD నుండి లాగౌట్ అవ్వండి
azd auth logout

# Azure CLI నుండి లాగౌట్ అవ్వండి
az logout
```

### ప్రాజెక్ట్ ప్రారంభం
```bash
# లభ్యమైన టెంప్లేటులను బ్రౌజ్ చేయండి
azd template list

# టెంప్లేట్ నుండి ప్రారంభించండి
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# ప్రస్తుత డైరెక్టరీలో ప్రారంభించండి
azd init .

# అనుకూల పేరుతో ప్రారంభించండి
azd init --template todo-nodejs-mongo my-awesome-app
```

## కోర్ డిప్లాయ్‌మెంట్ కమాండ్లు

### పూర్తిస్థాయి డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లో
```bash
# అన్నింటిని డిప్లాయ్ చేయండి (ప్రొవిజన్ + డిప్లాయ్)
azd up

# నిర్ధారణ ప్రాంప్ట్‌లు నిలిపివేసి డిప్లాయ్ చేయండి
azd up --confirm-with-no-prompt

# నిర్దిష్ట వాతావరణానికి డिप్లాయ్ చేయండి
azd up --environment production

# అనుకూల పరామితులతో డిప్లాయ్ చేయండి
azd up --parameter location=westus2
```

### కేవలం ఇన్ఫ్రాస్ట్రక్చర్
```bash
# Azure వనరులను ప్రొవిజన్ చేయండి
azd provision

# 🧪 ఇన్ఫ్రాస్ట్రక్చర్ మార్పులను ముందుగా వీక్షించండి
azd provision --preview
# ఏ వనరులు సృష్టించబడతాయో, మార్చబడతాయో లేదా తొలగించబడతాయో అనే డ్రై-రన్ దృశ్యాన్ని చూపిస్తుంది
# 'terraform plan' లేదా 'bicep what-if' లాంటిది — నడపడానికి సురక్షితం, ఎలాంటి మార్పులు అమలు చేయబడవు
```

### కేవలం అప్లికేషన్
```bash
# అప్లికేషన్ కోడ్‌ను పంపిణీ చేయండి
azd deploy

# నిర్దిష్ట సేవను పంపిణీ చేయండి
azd deploy --service web
azd deploy --service api

# అన్ని సేవలను పంపిణీ చేయండి
azd deploy --all
```

### బిల్డ్ మరియు ప్యాకేజ్
```bash
# అప్లికేషన్ అవలంబనలను పునరుద్ధరించు (డౌన్లోడ్ చేయండి)
azd restore

# ఒక నిర్దిష్ట సేవను పునరుద్ధరించు
azd restore --service api

# డిప్లోయ్ చేయగల ఆర్టిఫాక్ట్‌ను డిప్లోయ్ చేయకుండా నిర్మించు
azd package

# నిర్దిష్ట సేవను నిర్మించు
azd package --service api
```

> **`azd restore`** మీ యాప్ యొక్క డిపెండెన్సీలు (npm, pip, NuGet, Maven, మొదలైనవి) ను డౌన్‌లోడ్ చేస్తుంది. ఇది `azd package` మరియు `azd deploy` సమయంలో ఆటోమేటిక్‌గా నడుస్తుంది, కనుక మీరు దాన్ని నేరుగా అరుదుగా పిలుస్తారు—డిపెండెన్సీలను ముందుగానే పొందటానికీ (ఉదాహరణకు CI క్యాష్ ని వేడి చేయడానికి లేదా తరువాత ఆఫ్‌లైన్‌గా పనిచేసేందుకు) దాన్ని మానవీయంగా నడపండి.

> **`azd package`** డిప్లాయ్ చేయదగ్గ ఆర్టిఫాక్ట్ (కంటైనర్ ఇమేజ్ లేదా జిప్) ను Azure కు పుష్ చేయకుండా నిర్మిస్తుంది. బిల్డ్ విజయవంతమైందని నిర్ధారించుకోవడానికి, అవుట్‌పుట్ పరిశీలించడానికి లేదా వేరే ప్రాసెస్ తరువాత డిప్లాయ్ చేయడానికి ఆర్టిఫాక్ట్ ఉత్పత్తి చేయడానికి దీన్ని ఒంటరిగా ఉపయోగించండి. `azd deploy` స్వయంచాలకంగా ప్యాకేజ్ చేస్తుంది, కాబట్టి మీరు డిప్లాయ్ చేయకుండా ఆర్టిఫాక్ట్ కావాలనుకుంటే మాత్రమే `azd package` అవసరం.

## 🌍 పరిసర నిర్వహణ

### పరిసర కార్యకలాపాలు
```bash
# అన్ని ఎన్విరాన్‌మెంట్‌లను జాబితా చేయండి
azd env list

# కొత్త ఎన్విరాన్‌మెంట్‌ను సృష్టించండి
azd env new development
azd env new staging --location westus2

# ఎన్విరాన్‌మెంట్‌ను ఎంచుకోండి
azd env select production

# అందుబాటులో ఉన్న ఎన్విరాన్‌మెంట్‌లను చూపించండి
azd env list

# ఎన్విరాన్‌మెంట్ స్థితిని రిఫ్రెష్ చేయండి
azd env refresh
```

### పరిసర వేరియబుల్‌లు
```bash
# పర్యావరణ వేరియబుల్‌ను సెట్ చేయండి
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# పర్యావరణ వేరియబుల్‌ను పొందండి
azd env get API_KEY

# అన్ని పర్యావరణ వేరియబుల్‌లను జాబితా చేయండి
azd env get-values

# పర్యావరణ వేరియబుల్‌ను తొలగించండి
azd env unset DEBUG
```

## ⚙️ కాన్ఫిగరేషన్ కమాండ్లు

### గ్లోబల్ కాన్ఫిగరేషన్
```bash
# అన్ని కాన్ఫిగరేషన్లు జాబితా చేయండి
azd config show

# గ్లోబల్ డిఫాల్టులను సెట్ చేయండి
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# కాన్ఫిగరేషన్ తీసివేయండి
azd config unset defaults.location

# అన్ని కాన్ఫిగరేషన్లను రీసెట్ చేయండి
azd config reset
```

### ప్రాజెక్ట్ కాన్ఫిగరేషన్
```bash
# azure.yaml ని ధృవీకరించండి
azd config validate

# ప్రాజెక్ట్ సమాచారాన్ని చూపండి
azd show

# సేవ ఎండ్‌పాయింట్లను పొందండి
azd show --output json
```

## 📊 మానిటరింగ్ మరియు డయాగ్నోస్టిక్స్

### మానిటరింగ్ డ్యాష్‌బోర్డ్
```bash
# Azure పోర్టల్ మానిటరింగ్ డాష్‌బోర్డ్ తెరవండి
azd monitor

# Application Insights లైవ్ మెట్రిక్స్ తెరవండి
azd monitor --live

# Application Insights లాగ్స్ బ్లేడ్ తెరవండి
azd monitor --logs

# Application Insights అవలోకనం తెరవండి
azd monitor --overview
```

### కంటైనర్ లాగ్‌లను వీక్షించడం
```bash
# Azure CLI ద్వారా లాగ్‌లను చూడండి (కంటైనర్ యాప్స్ కోసం)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# లాగ్‌లను ప్రత్యక్షంగా అనుసరించండి
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure పోర్టల్ నుండి లాగ్‌లను చూడండి
azd monitor --logs
```

### లాగ్ అనలిటిక్స్ క్వెరీలు
```bash
# Azure పోర్టల్ ద్వారా Log Analytics ను యాక్సెస్ చేయండి
azd monitor --logs

# Azure CLI ఉపయోగించి లాగ్‌లను క్వెరీ చేయండి
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ నిర్వహణ కమాండ్లు

### శుభ్రపరచడం
```bash
# అన్ని Azure వనరులను తొలగించండి
azd down

# నిర్ధారణ లేకుండా బలవంతంగా తొలగించండి
azd down --force

# సాఫ్ట్-డిలీట్ చేయబడిన వనరులను శుద్ధి చేయండి
azd down --purge

# సంపూర్ణ శుభ్రపరచండి
azd down --force --purge
```

### నవీకరణలు
```bash
# azd నవీకరణల కోసం తనిఖీ చేయండి
azd version

# ప్రస్తుత వెర్షన్ పొందండి
azd version

# ప్రస్తుత కాన్ఫిగరేషన్ చూడండి
azd config show
```

## 🔧 అనేక అధునాతన కమాండ్లు

### పైప్‌లైన్ మరియు CI/CD
```bash
# GitHub Actionsను కాన్ఫిగర్ చేయండి
azd pipeline config

# Azure DevOpsను కాన్ఫిగర్ చేయండి
azd pipeline config --provider azdo

# పైప్‌లైన్ కాన్ఫిగరేషన్ చూపించండి
azd pipeline show
```

### ఇన్ఫ్రాస్ట్రక్చర్ నిర్వహణ
```bash
# ఇన్‌ఫ్రాస్ట్రక్చర్ టెంప్లేట్లు రూపొందించండి
azd infra generate

# 🧪 ఇన్‌ఫ్రాస్ట్రక్చర్ ముందస్తు అవలోకనం మరియు ప్రణాళిక
azd provision --preview
# డిప్లాయ్ చేయకుండా ఇన్‌ఫ్రాస్ట్రక్చర్ ప్రావిజనింగ్‌ను అనుకరిస్తుంది
# Bicep/Terraform టెంప్లేట్లు విశ్లేషించి చూపిస్తుంది:
# - జోడించాల్సిన వనరులు (ఆకుపచ్చ +)
# - మార్పు చేయబడాల్సిన వనరులు (పసుపు ~)
# - తొలగించాల్సిన వనరులు (ఎరుపు -)
# నడపడానికి సురక్షితం - Azure పర్యావరణంలో ఏ వాస్తవ మార్పులు జరుగవు

# azure.yaml నుండి ఇన్‌ఫ్రాస్ట్రక్చర్‌ను సంశ్లేషించండి
azd infra synth
```

### ప్రాజెక్ట్ సమాచారం
```bash
# ప్రాజెక్ట్ స్థితి మరియు ఎండ్‌పాయింట్లను చూపించండి
azd show

# వివరణాత్మక ప్రాజెక్ట్ సమాచారాన్ని JSON రూపంలో చూపించండి
azd show --output json

# సర్వీస్ ఎండ్‌పాయింట్లను పొందండి
azd show --output json | jq '.services'
```

## 🤖 AI మరియు ఎక్స్టెన్షన్స్ కమాండ్లు

### AZD ఎక్స్టెన్షన్లు
```bash
# అందుబాటులో ఉన్న అన్ని ఎక్స్‌టెన్షన్లను జాబితా చేయండి (AI సహా)
azd extension list

# Foundry ఏజెంట్స్ ఎక్స్‌టెన్షన్‌ను ఇన్‌స్టాల్ చేయండి
azd extension install azure.ai.agents

# ఏజెంట్ స్కిల్స్ ఎక్స్‌టెన్షన్‌ను ఇన్‌స్టాల్ చేయండి (ప్రివ్యూ)
azd extension install azure.ai.skills

# Foundry కనెక్షన్లు ఎక్స్‌టెన్షన్‌ను ఇన్‌స్టాల్ చేయండి (ప్రివ్యూ)
azd extension install azure.ai.connections

# ఫైన్-ట్యూనింగ్ ఎక్స్‌టెన్షన్‌ను ఇన్‌స్టాల్ చేయండి
azd extension install azure.ai.finetune

# కస్టమ్ మోడల్స్ ఎక్స్‌టెన్షన్‌ను ఇన్‌స్టాల్ చేయండి
azd extension install azure.ai.models

# ఇన్‌స్టాల్ చేసిన అన్ని ఎక్స్‌టెన్షన్లను అప్‌గ్రేడ్ చేయండి
azd extension upgrade --all
```

### AI ఏజెంట్ కమాండ్లు
```bash
# ఒక మానిఫెస్ట్ నుండి ఏజెంట్ ప్రాజెక్టును ప్రారంభించండి
azd ai agent init -m <manifest-path-or-uri>

# ఒక నిర్దిష్ట Foundry ప్రాజెక్టును లక్ష్యంగా ఎంచుకోండి
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ఏజెంట్ సోర్స్ డైరెక్టరీని పేర్కొనండి
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# హోస్టింగ్ లక్ష్యాన్ని ఎంచుకోండి
azd ai agent init -m agent-manifest.yaml --host containerapp

# డిప్లాయ్ చేసిన ఏజెంట్‌ను పరీక్షించండి (లేటెన్సీ + మొదటి బైట్‌కు చేరే సమయాన్ని ముద్రిస్తుంది)
azd ai agent invoke

# లైవ్ ఎండ్పాయింట్ కాన్ఫిగరేషన్‌ను చూపించండి
azd ai agent endpoint show

# మూల్యాంకన డేటాసెట్‌ను సృష్టించి, తర్వాత ఏజెంట్‌ను ఆప్టిమైజ్ చేయండి
azd ai agent eval generate
azd ai agent optimize

# కోడ్-ఆధారిత హోస్టెడ్ ఏజెంట్ యొక్క డిప్లాయ్ చేసిన సోర్స్‌ను డౌన్లోడ్ చేయండి
azd ai agent code download

# ఒక హోస్టెడ్ ఏజెంట్ మరియు దాని అన్ని వెర్షన్లను తొలగించండి (--force సక్రియ సెషన్లను ముగిస్తుంది)
azd ai agent delete --force
```

### MCP సర్వర్ (ఆల్ఫా)
```bash
# మీ ప్రాజెక్ట్ కోసం MCP సర్వర్‌ను ప్రారంభించండి
azd mcp start

# MCP ఆపరేషన్ల కోసం టూల్ అనుమతులను నిర్వహించండి
azd copilot consent list
```

### ఇన్ఫ్రాస్ట్రక్చర్ రూపొందించడం
```bash
# మీ ప్రాజెక్ట్ నిర్వచనాల నుండి IaC ఫైళ్లను ఉత్పత్తి చేయండి
azd infra generate

# azure.yaml నుండి ఇన్‌ఫ్రాస్ట్రక్చర్‌ను సింథసైజ్ చేయండి
azd infra synth
```

---

## 🎯 త్వరిత వర్క్‌ఫ్లోలు

### అభివృద్ధి వర్క్‌ఫ్లో
```bash
# కొత్త ప్రాజెక్ట్ ప్రారంభించండి
azd init --template todo-nodejs-mongo
cd my-project

# డెవలప్‌మెంట్‌కు డిప్లాయ్ చేయండి
azd env new dev
azd up

# మార్పులు చేయండి మరియు మళ్లీ డిప్లాయ్ చేయండి
azd deploy

# పర్యవేక్షణ డాష్‌బోర్డు తెరవండి
azd monitor --live
```

### బహుళ పరిసర వర్క్‌ఫ్లో
```bash
# పరిసరాలను ఏర్పాటు చేయండి
azd env new dev
azd env new staging  
azd env new production

# డెవ్‌కు అమర్చండి
azd env select dev
azd up

# పరీక్షించి స్టేజింగ్‌కు ప్రమోట్ చేయండి
azd env select staging
azd up

# ఉత్పత్తికి అమర్చండి
azd env select production
azd up
```

### సమస్య పరిష్కార వర్క్‌ఫ్లో
```bash
# డీబగ్ మోడ్‌ను ప్రారంభించండి
export AZD_DEBUG=true

# డిప్లాయ్‌మెంట్ స్థితిని తనిఖీ చేయండి
azd show

# కాన్ఫిగరేషన్‌ను ధృవీకరించండి
azd config show

# లాగ్‌ల కోసం మానిటరింగ్ డ్యాష్‌బోర్డ్‌ను తెరవండి
azd monitor --logs

# వనరుల స్థితిని తనిఖీ చేయండి
azd show --output json
```

## 🔍 డీబగ్గింగ్ కమాండ్లు

### డీబగ్ సమాచారం
```bash
# డీబగ్ అవుట్‌పుట్‌ను యాక్టివేట్ చేయండి
export AZD_DEBUG=true
azd <command> --debug

# శుభ్రమైన అవుట్‌పుట్ కోసం టెలిమెట్రీని నిలిపివేయండి
export AZD_DISABLE_TELEMETRY=true

# ప్రస్తుత కాన్ఫిగరేషన్‌ను తనిఖీ చేయండి
azd config show

# ప్రామాణీకరణ స్థితిని తనిఖీ చేయండి
az account show
```

### టెంప్లేట్ డీబగ్గింగ్
```bash
# వివరాలతో అందుబాటులో ఉన్న టెంప్లేట్‌లను జాబితా చేయండి
azd template list --output json

# టెంప్లేట్ సమాచారం చూపించండి
azd template show <template-name>

# init చేయడానికి ముందు టెంప్లేట్‌ను ధ్రువీకరించండి
azd template validate <template-name>
```

## 📁 ఫైల్ మరియు డైరెక్టరీ కమాండ్లు

### ప్రాజెక్ట్ నిర్మాణం
```bash
# ప్రస్తుత డైరెక్టరీ నిర్మాణాన్ని చూపించు
tree /f  # విండోస్
find . -type f  # లినక్స్/మాక్‌ఓఎస్

# azd ప్రాజెక్ట్ రూట్‌కు వెళ్లండి
cd $(azd root)

# azd కాన్ఫిగరేషన్ డైరెక్టరీని చూపించు
echo $AZD_CONFIG_DIR  # సాధారణంగా ~/.azd
```

## 🎨 అవుట్పుట్ ఫార్మాటింగ్

### JSON అవుట్పుట్
```bash
# స్క్రిప్టింగ్ కోసం JSON అవుట్పుట్ పొందండి
azd show --output json
azd env list --output json
azd config show --output json

# jq తో పార్స్ చేయండి
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### టేబుల్ అవుట్పుట్
```bash
# పట్టికగా ఫార్మాట్ చేయండి
azd env list --output table

# డిప్లాయ్ చేయబడిన సేవలను చూడండి
azd show --output json | jq '.services | keys'
```

## 🔧 సాధారణ కమాండ్ కాంబినేషన్స్

### హెల్త్ చెక్ స్క్రిప్ట్
```bash
#!/bin/bash
# త్వరిత ఆరోగ్య తనిఖీ
azd show
azd env get-values
azd monitor --logs
```

### డిప్లాయ్‌మెంట్ ధృవీకరణ
```bash
#!/bin/bash
# డిప్లాయ్‌మెంట్‌కు ముందు ధృవీకరణ
azd show
azd provision --preview  # డిప్లాయ్ చేయడానికి ముందు మార్పులను ముందుగా వీక్షించండి
az account show
```

### పరిసరాల సరిపోలింపు
```bash
#!/bin/bash
# పర్యావరణాలను పోల్చండి
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### రిసోర్స్ శుభ్రపరిచే స్క్రిప్ట్
```bash
#!/bin/bash
# పాత ఎన్విరాన్‌మెంట్‌లను శుభ్రం చేయండి
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 పరిసర వేరియబుల్‌లు

### సాధారణ పరిసర వేరియబుల్‌లు
```bash
# Azure కాన్ఫిగరేషన్
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD కాన్ఫిగరేషన్
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# అనువర్తనం కాన్ఫిగరేషన్
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 అత్యవసర కమాండ్లు

### త్వరిత పరిష్కారాలు
```bash
# ప్రామాణీకరణను రీసెట్ చేయండి
az account clear
az login

# పర్యావరణాన్ని బలవంతంగా తాజా చేయండి
azd env refresh

# అన్ని సేవలను మళ్లీ డిప్లాయ్ చేయండి
azd deploy

# డిప్లాయ్‌మెంట్ స్థితిని తనిఖీ చేయండి
azd show --output json
```

### రికవరీ కమాండ్లు
```bash
# విఫలమైన డిప్లాయ్‌మెంట్ నుండి కోలుకోవడం - శుభ్రపరచి మళ్లీ డిప్లాయ్ చేయడం
azd down --force --purge
azd up

# కేవలం ఇన్ఫ్రాస్ట్రక్చర్‌ను మళ్లీ ప్రోవిజన్ చేయడం
azd provision

# కేవలం అప్లికేషన్‌ను మళ్లీ డిప్లాయ్ చేయడం
azd deploy
```

## 💡 ప్రొ చిట్కాలు

### వేగవంతమైన వర్క్‌ఫ్లో కోసం అలియాస్లు
```bash
# మీ .bashrc లేదా .zshrcకి జోడించండి
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### ఫంక్షన్ షార్ట్‌కట్స్
```bash
# పరిసరాలను త్వరగా మార్చడం
azd-env() {
    azd env select $1 && azd show
}

# పర్యవేక్షణతో త్వరగా ప్రవేశపెట్టడం
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# పరిసర స్థితి
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 సహాయం మరియు డాక్యుమెంటేషన్

### సహాయం పొందడం
```bash
# సాధారణ సహాయం
azd --help
azd help

# కమాండ్-సంబంధమైన సహాయం
azd up --help
azd env --help
azd config --help

# వర్షన్ మరియు బిల్డ్ సమాచారం చూపించు
azd version
azd version --output json
```

### డాక్యుమెంటేషన్ లింకులు
```bash
# డాక్యుమెంటేషన్‌ను బ్రౌజర్‌లో తెరవండి
azd docs

# టెంప్లేట్ డాక్యుమెంటేషన్‌ను చూపించండి
azd template show <template-name> --docs
```

---

**టిప్**: ఈ చీట్ షీట్‌ను బుక్‌మార్క్ చేయండి మరియు మీరు అవసరమైన కమాండ్స్‌ను త్వరగా కనుగొనడానికి `Ctrl+F` ఉపయోగించండి!

---

**నావిగేషన్**
- **మునుపటి పాఠం**: [ప్రీఫ్లైట్ చెక్స్లు](../docs/pre-deployment/preflight-checks.md)
- **తరువాత పాఠం**: [పరిభాషా సూచిక](glossary.md)

---

> **💡 మీ ఎడిటర్‌లో Azure కమాండ్ సహాయం కావాలా?** `npx skills add microsoft/github-copilot-for-azure` ఉపయోగించి [Microsoft Azure ఏజెంట్ స్కిల్స్](https://skills.sh/microsoft/github-copilot-for-azure) ను ఇన్‌స్టాల్ చేయండి — AI, Foundry, డిప్లాయ్‌మెంట్, డయాగ్నోస్టిక్స్ మరియు మరిన్ని కోసం 37 స్కిల్స్.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->