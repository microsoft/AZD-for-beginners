# కమాండ్ చీట్‌షీట్ - ముఖ్యమైన AZD కమాండ్లు

**అన్ని అధ్యాయాల కోసం త్వరిత సూచన**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభికులకు](../README.md)
- **📖 త్వరిత ప్రారంభం**: [అధ్యాయం 1: పునాది & త్వరిత ప్రారంభం](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI కమాండ్లు**: [అధ్యాయం 2: AI-ప్రధాన అభివృద్ధి](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 అధునాతన**: [అధ్యాయం 4: ఇన్ఫ్రాస్ట్రక్చర్‌ను కోడ్‌గా](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## పరిచయం

ఈ పూర్తి చీట్‌షీట్ అత్యంత సాధారణంగా ఉపయోగించే Azure Developer CLI కమాండ్లకు త్వరిత సూచన అందిస్తుంది, వర్గాలవారీగా మరియు ప్రాక్టికల్ ఉదాహరణలతో ఏర్పాటు చేయబడింది. azd ప్రాజెక్టులలో అభివృద్ధి, సమస్య పరిష్కారం, మరియు దినచర్య ఆపరేషన్ల సమయంలో త్వరితంగా చూడటానికి ఇది అనుకూలంగా ఉంటుంది.

## నేర్చుకునే లక్ష్యాలు

ఈ చీట్‌షీట్‌ను ఉపయోగించడం ద్వారా, మీరు:
- ముఖ్యమైన Azure Developer CLI కమాండ్లు మరియు వాటి సింటాక్స్‌కు తక్షణ యాక్సెస్ పొందగలుగుతారు
- కమాండ్లను ఫంక్షనల్ వర్గాలు మరియు ఉపయోగకేసుల ఆధారంగా ఎలా ఏర్పాటు చేయబడ్డాయో అర్థం చేసుకుంటారు
- సాధారణ అభివృద్ధి మరియు డిప్లాయ్‌మెంట్ పరిస్ధితుల కోసం ప్రాక్టికల్ ఉదాహరణలు చూడవచ్చు
- సమస్యలను త్వరగా పరిష్కరించడానికి ట్రబుల్‌షూటింగ్ కమాండ్లను యాక్సెస్ చేయగలుగుతారు
- అధునాతన కాన్ఫిగరేషన్ మరియు కస్టమైజేషన్ ఎంపికలను సమర్థవంతంగా కనుగొనగలుగుతారు
- ఎన్‌విరాన్‌మెంట్ నిర్వహణ మరియు బహుళ-ఎన్‌విరాన్‌మెంట్ వర్క్‌ఫ్లో కమాండ్లను కనుగొనగలుగుతారు

## నేర్చుకున్న ఫలితాలు

నియమితంగా ఈ చీట్‌షీట్‌ను చూడడం ద్వారా, మీరు చేయగలుగుతారు:
- పూర్తి డాక్యుమెంటేషన్‌ను చూడకుండా azd కమాండ్లను నమ్మకంగా అమలు చేయగలుగుతారు
- సరైన డయాగ్నోస్టిక్ కమాండ్లను ఉపయోగించి సాధారణ సమస్యలను త్వరగా పరిష్కరించగలుగుతారు
- బహుళ ఎన్‌విరాన్‌మెంట్‌లు మరియు డిప్లాయ్‌మెంట్ పరిస్ధితులను సమర్థవంతంగా నిర్వహించగలుగుతారు
- అవసరంగా అధునత azd ఫీచర్లు మరియు కాన్ఫిగరేషన్ ఎంపికలను వర్తింపజేయగలుగుతారు
- వ్యవస్థాపక కమాండ్ వరుసలను ఉపయోగించి డిప్లాయ్‌మెంట్ సమస్యలను ట్రబుల్‌షూట్ చేయగలుగుతారు
- azd షార్ట్‌కట్లు మరియు ఆప్షన్ల సమర్థ వినియోగం ద్వారా వర్క్‌ఫ్లోలను ఆప్టిమైజ్ చేయగలుగుతారు

## ప్రారంభించే కమాండ్లు

### ప్రామాణీకరణ
```bash
# AZD ద్వారా Azureలో లాగిన్ చేయండి
azd auth login

# Azure CLIలో లాగ్న్ చేయండి (AZD ఇది అంతర్గతంగా ఉపయోగిస్తుంది)
az login

# ప్రస్తుత ఖాతాని తనిఖీ చేయండి
az account show

# డిఫాల్ట్ సబ్స్క్రిప్షన్‌ను సెట్ చేయండి
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD నుంచి లాగ్ అవుట్ చేయండి
azd auth logout

# Azure CLI నుండి లాగ్ అవుట్ చేయండి
az logout
```

### ప్రాజెక్ట్ ప్రారంభం
```bash
# అందుబాటులో ఉన్న టెంప్లేట్లను బ్రౌజ్ చేయండి
azd template list

# టెంప్లేటు నుండి ప్రారంభించండి
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# ప్రస్తుత డైరెక్టరీలో ప్రారంభించండి
azd init .

# అనుకూల పేరుతో ప్రారంభించండి
azd init --template todo-nodejs-mongo my-awesome-app
```

## కోర్ డిప్లాయ్‌మెంట్ కమాండ్లు

### పూర్తి డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లో
```bash
# అన్నింటినీ డిప్లాయ్ చేయండి (ప్రొవిజన్ + డిప్లాయ్)
azd up

# ధృవీకరణ ప్రాంప్ట్‌లు డిసేబుల్ చేసి డిప్లాయ్ చేయండి
azd up --confirm-with-no-prompt

# నిర్దిష్ట వాతావరణానికి డిప్లాయ్ చేయండి
azd up --environment production

# అనుకూల పరామితులతో డిప్లాయ్ చేయండి
azd up --parameter location=westus2
```

### కేవలం ఇన్ఫ్రాస్ట్రక్చర్
```bash
# Azure వనరులను ఏర్పాటు చేయండి
azd provision

# 🧪 మౌలిక వ్యవస్థ మార్పులను ముందుగా వీక్షించండి
azd provision --preview
# ఏ వనరులు సృష్టించబడతాయో/మార్పు చేయబడతాయో/తొలగించబడతాయో ఒక డ్రై-రన్ దృశ్యాన్ని చూపిస్తుంది
# సారూప్యంగా 'terraform plan' లేదా 'bicep what-if' - నడపడానికి భద్రం, ఎటువంటి మార్పులు వర్తించవు
```

### కేవలం అప్లికేషన్
```bash
# అప్లికేషన్ కోడ్‌ను అమర్చండి
azd deploy

# నిర్దిష్ట సేవను అమర్చండి
azd deploy --service web
azd deploy --service api

# అన్ని సేవలను అమర్చండి
azd deploy --all
```

### బిల్డ్ మరియు ప్యాకేజ్
```bash
# అప్లికేషన్లు నిర్మించండి
azd package

# నిర్దిష్ట సేవను నిర్మించండి
azd package --service api
```

## 🌍 ఎన్‌విరాన్మెంట్ నిర్వహణ

### ఎన్‌విరాన్‌మెంట్ ఆపరేషన్లు
```bash
# అన్ని పరిసరాలను జాబితా చేయండి
azd env list

# కొత్త పరిసరాన్ని సృష్టించండి
azd env new development
azd env new staging --location westus2

# పరిసరాన్ని ఎంచుకోండి
azd env select production

# ప్రస్తుత పరిసరాన్ని చూపించండి
azd env show

# పరిసర స్థితిని తాజా చేయండి
azd env refresh
```

### ఎన్‌విరాన్‌మెంట్ వేరియబుల్స్
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
# అన్ని కాన్ఫిగరేషన్లను జాబితా చేయండి
azd config list

# గ్లోబల్ డిఫాల్ట్‌లను సెట్ చేయండి
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# కాన్ఫిగరేషన్‌ను తీసివేయండి
azd config unset defaults.location

# అన్ని కాన్ఫిగరేషన్లను రీసెట్ చేయండి
azd config reset
```

### ప్రాజెక్ట్ కాన్ఫిగరేషన్
```bash
# azure.yamlని ధృవీకరించండి
azd config validate

# ప్రాజెక్ట్ సమాచారాన్ని చూపించండి
azd show

# సర్వీస్ ఎండ్‌పాయింట్లను పొందండి
azd show --output json
```

## 📊 మానిటరింగ్ మరియు డయాగ్నోస్టిక్స్

### మానిటరింగ్ డ్యాష్‌బోర్డు
```bash
# Azure పోర్టల్ మానిటరింగ్ డ్యాష్‌బోర్డ్‌ను తెరవండి
azd monitor

# Application Insights లైవ్ మెట్రిక్స్‌ను తెరవండి
azd monitor --live

# Application Insights లాగ్స్ బ్లేడ్‌ను తెరవండి
azd monitor --logs

# Application Insights అవలోకనాన్ని తెరవండి
azd monitor --overview
```

### కంటెయినర్ లాగ్‌లు వీక్షించడం
```bash
# Azure CLI ద్వారా లాగ్‌లను వీక్షించండి (Container Apps కోసం)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# రియల్-టైమ్‌లో లాగ్‌లను అనుసరించండి
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure Portal నుండి లాగ్‌లను వీక్షించండి
azd monitor --logs
```

### లాగ్ అనలిటిక్స్ క్వెరీలు
```bash
# Azure పోర్టల్ ద్వారా లాగ్ అనలిటిక్స్‌కి ప్రవేశించండి
azd monitor --logs

# Azure CLI ఉపయోగించి లాగ్‌లను క్యూరీ చేయండి
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

# సాఫ్ట్-డిలీట్ చేయబడ్డ వనరులను పూర్తిగా తొలగించండి
azd down --purge

# పూర్తి శుభ్రపరచండి
azd down --force --purge
```

### నవీకరణలు
```bash
# azd నవీకరణల కోసం తనిఖీ చేయండి
azd version

# ప్రస్తుత సంస్కరణను పొందండి
azd version

# ప్రస్తుత కాన్ఫిగరేషన్‌ను వీక్షించండి
azd config list
```

## 🔧 అధునాతన కమాండ్లు

### పైప్‌లైన్ మరియు CI/CD
```bash
# GitHub Actions ను కాన్ఫిగర్ చేయండి
azd pipeline config

# Azure DevOps ను కాన్ఫిగర్ చేయండి
azd pipeline config --provider azdo

# పైప్‌లైన్ కాన్ఫిగరేషన్‌ను చూపించండి
azd pipeline show
```

### ఇన్ఫ్రాస్ట్రక్చర్ నిర్వహణ
```bash
# ఇన్‌ఫ్రాస్ట్రక్చర్ టెంప్లేట్లను రూపొందించండి
azd infra generate

# 🧪 ఇన్‌ఫ్రాస్ట్రక్చర్ ప్రివ్యూ & ప్రణాళిక
azd provision --preview
# డిప్లాయ్ చేయకుండా ఇన్‌ఫ్రాస్ట్రక్చర్ ప్రొవిజనింగ్‌ను అనుకరిస్తుంది
# Bicep/Terraform టెంప్లేట్లను విశ్లేషించి చూపిస్తుంది:
# - జోడించవలసిన వనరులు (ఆకుపచ్చ +)
# - మార్చవలసిన వనరులు (పసుపు ~)
# - తొలగించవలసిన వనరులు (ఎరుపు -)
# నడపడానికి సురక్షితం - Azure వాతావరణంలో ఏవైనా వాస్తవ మార్పులు చేయబడవు

# azure.yaml నుండి ఇన్‌ఫ్రాస్ట్రక్చర్‌ను సంశ్లేషించండి
azd infra synth
```

### ప్రాజెక్ట్ సమాచారం
```bash
# ప్రాజెక్ట్ స్థితి మరియు ఎండ్పాయింట్లను చూపించండి
azd show

# వివరమైన ప్రాజెక్ట్ సమాచారాన్ని JSON గా చూపించండి
azd show --output json

# సర్వీస్ ఎండ్పాయింట్లను పొందండి
azd show --output json | jq '.services'
```

## 🤖 AI & ఎక్స్‌టెన్షన్స్ కమాండ్లు

### AZD ఎక్స్‌టెన్షన్లు
```bash
# అందుబాటులో ఉన్న అన్ని విస్తరణలను (AI సహా) జాబితా చేయండి
azd extension list

# Foundry agents విస్తరణను ఇన్‌స్టాల్ చేయండి
azd extension install azure.ai.agents

# fine-tuning విస్తరణను ఇన్‌స్టాల్ చేయండి
azd extension install azure.ai.finetune

# custom models విస్తరణను ఇన్‌స్టాల్ చేయండి
azd extension install azure.ai.models

# ఇన్‌స్టాల్ చేసిన అన్ని విస్తరణలను నవీకరించండి
azd extension upgrade --all
```

### AI ఏజెంట్ కమాండ్లు
```bash
# ఒక మానిఫెస్ట్నుంచి ఏజెంట్ ప్రాజెక్టును ప్రారంభించండి
azd ai agent init -m <manifest-path-or-uri>

# ఒక నిర్దిష్ట Foundry ప్రాజెక్టును లక్ష్యంగా నిర్దేశించండి
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ఏజెంట్ సోర్స్ డైరెక్టరీని నిర్దేశించండి
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# హోస్టింగ్ లక్ష్యాన్ని ఎంచుకోండి
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP సర్వర్ (ఆల్ఫా)
```bash
# మీ ప్రాజెక్ట్ కోసం MCP సర్వర్ ప్రారంభించండి
azd mcp start

# MCP ఆపరేషన్ల కోసం టూల్ అనుమతులను నిర్వహించండి
azd mcp consent
```

### ఇన్ఫ్రాస్ట్రక్చర్ జనరేషన్
```bash
# మీ ప్రాజెక్ట్ నిర్వచనంతో IaC ఫైళ్లను సృష్టించండి
azd infra generate

# azure.yaml నుండి ఇన్‌ఫ్రాస్ట్రక్చర్‌ను సంశ్లేషించండి
azd infra synth
```

---

## 🎯 త్వరిత వర్క్‌ఫ్లోలు

### డెవలప్‌మెంట్ వర్క్‌ఫ్లో
```bash
# కొత్త ప్రాజెక్ట్‌ను ప్రారంభించండి
azd init --template todo-nodejs-mongo
cd my-project

# డెవలప్‌మెంట్‌కు డిప్లాయ్ చేయండి
azd env new dev
azd up

# మార్పులు చేసి మళ్లీ డిప్లాయ్ చేయండి
azd deploy

# మానిటరింగ్ డ్యాష్‌బోర్డు తెరవండి
azd monitor --live
```

### బహుళ ఎన్‌విరాన్‌మెంట్ వర్క్‌ఫ్లో
```bash
# పర్యావరణాలను ఏర్పాటు చేయండి
azd env new dev
azd env new staging  
azd env new production

# డెవ్‌కు డిప్లాయ్ చేయండి
azd env select dev
azd up

# పరీక్షించి స్టేజింగ్‌కు ప్రమోట్ చేయండి
azd env select staging
azd up

# ప్రొడక్షన్‌కు డిప్లాయ్ చేయండి
azd env select production
azd up
```

### ట్రబల్‌షూటింగ్ వర్క్‌ఫ్లో
```bash
# డీబగ్ మోడ్‌ను ప్రారంభించండి
export AZD_DEBUG=true

# డిప్లాయ్‌మెంట్ స్థితిని తనిఖీ చేయండి
azd show

# కాన్ఫిగరేషన్‌ను ధృవీకరించండి
azd config list

# లాగుల కోసం మానిటరింగ్ డ్యాష్‌బోర్డ్ను తెరవండి
azd monitor --logs

# వనరుల స్థితిని తనిఖీ చేయండి
azd show --output json
```

## 🔍 డీబగ్గింగ్ కమాండ్లు

### డీబగ్గ్ సమాచారం
```bash
# డీబగ్ అవుట్‌పుట్‌ను సక్రియం చేయండి
export AZD_DEBUG=true
azd <command> --debug

# శుభ్రమైన అవుట్‌పుట్ కోసం టెలిమెట్రీని నిలిపివేయండి
export AZD_DISABLE_TELEMETRY=true

# ప్రస్తుత కాన్ఫిగరేషన్‌ను తనిఖీ చేయండి
azd config list

# ప్రామాణీకరణ స్థితిని తనిఖీ చేయండి
az account show
```

### టెంప్లేట్ డీబగ్గింగ్
```bash
# వివరాలతో అందుబాటులో ఉన్న టెంప్లేట్లను జాబితా చేయండి
azd template list --output json

# టెంప్లేట్ సమాచారాన్ని చూపండి
azd template show <template-name>

# init ముందు టెంప్లేట్‌ను తనిఖీ చేయండి
azd template validate <template-name>
```

## 📁 ఫైల్ మరియు డైరెక్టరీ కమాండ్లు

### ప్రాజెక్ట్ నిర్మాణం
```bash
# ప్రస్తుత డైరెక్టరీ నిర్మాణాన్ని చూపించండి
tree /f  # విండోస్
find . -type f  # లినక్స్/మ్యాక్‌ఒఎస్

# azd ప్రాజెక్ట్ రూట్‌కి వెళ్లండి
cd $(azd root)

# azd కాన్ఫిగరేషన్ డైరెక్టరీని చూపించండి
echo $AZD_CONFIG_DIR  # సాధారణంగా ~/.azd
```

## 🎨 ఔట్‌పుట్ ఫార్మాటింగ్

### JSON ఔట్‌పుట్
```bash
# స్క్రిప్టింగ్ కోసం JSON అవుట్‌పుట్ పొందండి
azd show --output json
azd env list --output json
azd config list --output json

# jq ఉపయోగించి విశ్లేషించండి
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### టేబుల్ ఔట్‌పుట్
```bash
# పట్టికగా ఫార్మాట్ చేయండి
azd env list --output table

# డిప్లాయ్ చేయబడిన సేవలను వీక్షించండి
azd show --output json | jq '.services | keys'
```

## 🔧 సాధారణ కమాండ్ కలయికలు

### హెల్త్ చెక్ స్క్రిప్టు
```bash
#!/bin/bash
# త్వరిత ఆరోగ్య తనిఖీ
azd show
azd env show
azd monitor --logs
```

### డిప్లాయ్‌మెంట్ సత్యాపనం
```bash
#!/bin/bash
# డిప్లాయ్‌మెంట్‌కు ముందు ధృవీకరణ
azd show
azd provision --preview  # డిప్లాయ్‌ చేయడానికి ముందు మార్పులను చూసుకోండి
az account show
```

### ఎన్‌విరాన్‌మెంట్ పోలిక
```bash
#!/bin/bash
# పర్యావరణాలను పోల్చండి
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### వనరు శుభ్రపరచే స్క్రిప్టు
```bash
#!/bin/bash
# పాత ఎన్విరాన్‌మెంట్లను శుభ్రం చేయండి
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 ఎన్‌విరాన్‌మెంట్ వేరియబుల్స్

### సాధారణ ఎన్‌విరాన్‌మెంట్ వేరియబుల్స్
```bash
# Azure కాన్ఫిగరేషన్
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD కాన్ఫిగరేషన్
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# అప్లికేషన్ కాన్ఫిగరేషన్
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 అత్యవసర కమాండ్లు

### తక్షణ పరిష్కారాలు
```bash
# ప్రామాణీకరణను రీసెట్ చేయండి
az account clear
az login

# పరిసరాన్ని బలవంతంగా రిఫ్రెష్ చేయండి
azd env refresh

# అన్ని సేవలను మళ్లీ డిప్లాయ్ చేయండి
azd deploy

# డిప్లాయ్‌మెంట్ స్థితిని తనిఖీ చేయండి
azd show --output json
```

### పునరుద్ధరణ కమాండ్లు
```bash
# విఫలమైన డిప్లాయ్‌మెంట్ నుండి పునరుద్ధరించండి - శుభ్రం చేసి మళ్లీ డిప్లాయ్ చేయండి
azd down --force --purge
azd up

# కేవలం ఇన్‌ఫ్రాస్ట్రక్చర్‌ను మాత్రమే పునఃప్రావిజన్ చేయండి
azd provision

# కేవలం అప్లికేషన్‌ను మాత్రమే మళ్లీ డిప్లాయ్ చేయండి
azd deploy
```

## 💡 ప్రొ చిట్కాలు

### వేగవంతమైన వర్క్‌ఫ్లో కోసం అలియాసులు
```bash
# మీ .bashrc లేదా .zshrc ఫైల్‌కి జోడించండి
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### ఫంక్షన్ షార్ట్‌కట్లు
```bash
# ఎన్‌విరాన్‌మెంట్‌ను శీఘ్రంగా మార్చడం
azd-env() {
    azd env select $1 && azd show
}

# పర్యవేక్షణతో వేగవంతమైన పంపిణీ
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# పరిసర స్థితి
azd-status() {
    echo "Current environment:"
    azd env show
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

# కమాండ్-నిర్దిష్ట సహాయం
azd up --help
azd env --help
azd config --help

# సంస్కరణ మరియు బిల్డ్ సమాచారం చూపించు
azd version
azd version --output json
```

### డాక్యుమెంటేషన్ లింకులు
```bash
# డాక్యుమెంటేషన్‌ను బ్రౌజర్‌లో తెరవండి
azd docs

# టెంప్లేట్ డాక్యుమెంటేషన్ చూపించండి
azd template show <template-name> --docs
```

---

**చిట్కా**: ఈ చీట్‌షీట్‌ను బుక్‌మార్క్ చేయండి మరియు మీరు అవసరమైన కమాండ్లను త్వరగా కనుగొనడానికి `Ctrl+F` ఉపయోగించండి!

---

**నావిగేషన్**
- **మునుపటి పాఠం**: [ప్రీఫ్లైట్ చెక్స్](../docs/pre-deployment/preflight-checks.md)
- **తరువాతి పాఠం**: [పదసంచిక](glossary.md)

---

> **💡 మీ ఎడిటర్‌లో Azure కమాండ్ సహాయం కావాలా?** Install [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) with `npx skills add microsoft/github-copilot-for-azure` — AI, Foundry, డిప్లాయ్‌మెంట్, డయాగ్నోస్టిక్స్ మరియు మరిన్ని కోసం 37 నైపుణ్యాలు.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**స్పష్టీకరణ**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, స్వయంచాలక అనువాదాలలో తప్పులు లేదా అసత్యతలు ఉండవచ్చును అని దయచేసి గమనించండి. మూల పత్రాన్ని దాని మాతృభాషలో అధికారిక మూలంగా పరిగణించాలి. కీలక సమాచారానికి, వృత్తిపరులైన మానవ అనువాదం సిఫార్సు చేయబడుతుంది. ఈ అనువాదం ఉపయోగం వల్ల ఏర్పడే ఏవైనా అవగాహనా లోపాలు లేదా తప్పు వ్యాఖ్యానాల కోసం మేము బాధ్యులు కాదం.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->