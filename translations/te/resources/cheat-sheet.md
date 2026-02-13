# కమాండ్ చీట్‌షీట్ - ముఖ్య AZD కమాండ్లు

**అన్ని అధ్యాయాల కోసం త్వరిత సూచిక**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభికులకు](../README.md)
- **📖 త్వరిత ప్రారంభం**: [అధ్యాయం 1: స్థాపన & త్వరిత ప్రారంభం](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI కమాండ్లు**: [అధ్యాయం 2: AI-ముఖ్య అభివృద్ధి](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 అత్యాధునిక**: [అధ్యాయం 4: ఇన్‌ఫ్రాస్ట్రక్చర్‌ను కోడ్‌గా](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## పరిచయం

ఈ సమగ్ర చీట్‌షీట్ అత్యంత తరచుగా ఉపయోగించే Azure Developer CLI కమాండ్ల కోసం వర్గీకరణతో పాటు ప్రాక్టికల్ ఉదాహరణలతో కూడిన త్వరిత సూచికను అందిస్తుంది. azd ప్రాజెక్టులతో అభివృద్ధి, ట్రబుల్‌షూటింగ్, మరియు దైనందిన కార్యాచరణ సమయంలో త్వరితంగా చూడటానికి ఇది పర్ఫెక్ట్.

## నేర్చుకోవాల్సిన లక్ష్యాలు

By using this cheat sheet, you will:
- ముఖ్య Azure Developer CLI కమాండ్లు మరియు వాటి సింటాక్స్‌కు తక్షణ ప్రాప్తి కలిగి ఉండండి
- ఫంక్షనల్ వర్గాలుగా మరియు ఉపయోగ కేసుల ద్వారా కమాండ్ల నిర్వహణను అర్థం చేసుకోండి
- సాధారణ అభివృద్ధి మరియు డిప్లాయ్‌మెంట్ సన్నివేశాల కోసం ప్రాక్టికల్ ఉదాహరణలను సూచనగా పొందండి
- త్వరిత సమస్య పరిష్కారానికి ట్రబుల్‌షూటింగ్ కమాండ్లకు ప్రాప్తి పొందండి
- ఆధునిక కాన్ఫిగరేషన్ మరియు కస్టమైజేషన్ ఎంపికలను సమర్థవంతంగా కనుగొనండి
- ఎన్విరాన్‌మెంట్ నిర్వహణ మరియు బహుళ ఎన్విరాన్‌మెంట్ వర్క్‌ఫ్లో కమాండ్లను గుర్తించండి

## నేర్చుకున్న ఫలితాలు

With regular reference to this cheat sheet, you will be able to:
- సంపూర్ణ డాక్యుమెంటేషన్ చూడకుండా azd కమాండ్లను ధైర్యంగా అమలు చేయగలరు
- తగిన డయాగ్నస్టిక్ కమాండ్లను ఉపయోగించి సాధారణ సమస్యలను త్వరగా పరిష్కరించగలరు
- బహుళ ఎన్విరాన్‌మెంట్స్ మరియు డిప్లాయ్‌మెంట్ సన్నివేశాలను సమర్థవంతంగా నిర్వహించగలరు
- అవసరమైనవేళ azd యొక్క అధునాతన ఫీచర్లు మరియు కాన్ఫిగరేషన్ ఎంపికలను వర్తింపజేయగలరు
- వ్యవస్థాత్మక కమాండ్ సీక్వెన్స్‌లతో డిప్లాయ్‌మెంట్ సమస్యలను ట్రబుల్‌షూట్ చేయగలరు
- azd షార్ట్‌కట్స్ మరియు ఎంపికలను సమర్థవంతంగా ఉపయోగించి వర్క్‌ఫ్లోలను ఆప్టిమైజ్ చేయగలరు

## ప్రారంభ కమాండ్లు

### ప్రమాణీకరణ
```bash
# AZD ద్వారా Azure లో లాగిన్ అవ్వండి
azd auth login

# Azure CLI లో లాగిన్ అవ్వండి (AZD దీన్ని అంతర్గతంగా ఉపయోగిస్తుంది)
az login

# ప్రస్తుత ఖాతాను తనిఖీ చేయండి
az account show

# డిఫాల్ట్ సబ్స్క్రిప్షన్‌ను సెట్ చేయండి
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD నుండి లాగౌట్ అవ్వండి
azd auth logout

# Azure CLI నుండి లాగౌట్ అవ్వండి
az logout
```

### ప్రాజెక్ట్ ప్రారంభికరణ
```bash
# అందుబాటులో ఉన్న టెంప్లేట్లను పరిశీలించండి
azd template list

# టెంప్లేట్ నుంచి ప్రారంభించండి
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# ప్రస్తుత డైరెక్టరీలో ప్రారంభించండి
azd init .

# అనుకూల పేరుతో ప్రారంభించండి
azd init --template todo-nodejs-mongo my-awesome-app
```

## ప్రాథమిక డిప్లాయ్‌మెంట్ కమాండ్లు

### సంపూర్ణ డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లో
```bash
# అన్నింటినీ డిప్లాయ్ చేయండి (ప్రొవిజన్ + డిప్లాయ్)
azd up

# నిర్ధారణ ప్రాంప్ట్‌లను నిలిపివేసి డిప్లాయ్ చేయండి
azd up --confirm-with-no-prompt

# నిర్దిష్ట పర్యావరణానికి డిప్లాయ్ చేయండి
azd up --environment production

# అనుకూల పరామితులతో డిప్లాయ్ చేయండి
azd up --parameter location=westus2
```

### ఇన్‌ఫ్రాస్ట్రక్చర్ మాత్రమే
```bash
# Azure వనరులను ప్రొవిజన్ చేయండి
azd provision

# 🧪 మౌలిక సదనాల మార్పులను ముందుగా చూడండి
azd provision --preview
# ఏ వనరులు సృష్టించబడతాయో/మార్పు చేయబడతాయో/తొలగించబడతాయో అనే డ్రై-రన్ వీక్షణను చూపిస్తుంది
# Similar to 'terraform plan' or 'bicep what-if' - రన్ చేయడానికి సురక్షితం, ఎలాంటి మార్పులు వర్తించవు
```

### అప్లికేషన్ మాత్రమే
```bash
# అప్లికేషన్ కోడ్‌ను అమర్చండి
azd deploy

# నిర్దిష్ట సేవను అమర్చండి
azd deploy --service web
azd deploy --service api

# అన్ని సేవలను అమర్చండి
azd deploy --all
```

### బిల్డ్ మరియు ప్యాకేజింగ్
```bash
# అనువర్తనాలు నిర్మించండి
azd package

# నిర్దిష్ట సేవను నిర్మించండి
azd package --service api
```

## 🌍 ఎన్విరాన్‌మెంట్ నిర్వహణ

### ఎన్విరాన్‌మెంట్ కార్యకలాపాలు
```bash
# అన్ని పర్యావరణాలను జాబితా చేయండి
azd env list

# కొత్త పర్యావరణాన్ని సృష్టించండి
azd env new development
azd env new staging --location westus2

# పర్యావరణాన్ని ఎంచుకోండి
azd env select production

# ప్రస్తుత పర్యావరణాన్ని చూపించండి
azd env show

# పర్యావరణ స్థితిని నవీకరించండి
azd env refresh
```

### ఎన్విరాన్‌మెంట్ వేరియబుల్స్
```bash
# పర్యావరణ చరాన్ని సెట్ చేయండి
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# పర్యావరణ చరాన్ని పొందండి
azd env get API_KEY

# అన్ని పర్యావరణ చరాలను జాబితా చేయండి
azd env get-values

# పర్యావరణ చరాన్ని తొలగించండి
azd env unset DEBUG
```

## ⚙️ కాన్ఫిగరేషన్ కమాండ్లు

### గ్లోబల్ కాన్ఫిగరేషన్
```bash
# అన్ని కాన్ఫిగరేషన్లను జాబితా చేయండి
azd config list

# గ్లోబల్ డిఫాల్టులను సెట్ చేయండి
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# కాన్ఫిగరేషన్‌ను తొలగించండి
azd config unset defaults.location

# అన్ని కాన్ఫిగరేషన్లను రీసెట్ చేయండి
azd config reset
```

### ప్రాజెక్ట్ కాన్ఫిగరేషన్
```bash
# azure.yaml ను ధృవీకరించండి
azd config validate

# ప్రాజెక్ట్ సమాచారాన్ని చూపించండి
azd show

# సేవా ఎండ్‌పాయింట్‌లను పొందండి
azd show --output json
```

## 📊 మానిటరింగ్ మరియు డయాగ్నోస్టిక్స్

### మానిటరింగ్ డ్యాష్‌బోర్డ్
```bash
# Azure పోర్టల్ పర్యవేక్షణ డ్యాష్‌బోర్డ్ తెరవండి
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
# Azure CLI ద్వారా లాగ్‌లను చూడండి (Container Apps కోసం)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# రియల్‌టైమ్‌లో లాగ్‌లను అనుసరించండి
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure పోర్టల్ నుండి లాగ్‌లను చూడండి
azd monitor --logs
```

### లాగ్ అనలిటిక్స్ క్వెరీలు
```bash
# Azure పోర్టల్ ద్వారా Log Analytics‌ను యాక్సెస్ చేయండి
azd monitor --logs

# Azure CLI ఉపయోగించి లాగ్‌లను క్వెరీ చేయండి
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ నిర్వహణ కమాండ్లు

### శుభ్రపరచడం
```bash
# అన్ని Azure వనరులను తొలగించు
azd down

# నిర్థారణ లేకుండానే బలవంతంగా తొలగించు
azd down --force

# సాఫ్ట్-డిలీట్ అయిన వనరులను శాశ్వతంగా తొలగించు
azd down --purge

# సంపూర్ణ శుభ్రీకరణ
azd down --force --purge
```

### నవీకరణలు
```bash
# azd నవీకరణల కోసం తనిఖీ చేయండి
azd version

# ప్రస్తుత వెర్షన్ పొందండి
azd version

# ప్రస్తుత కాన్ఫిగరేషన్ వీక్షించండి
azd config list
```

## 🔧 అధునాతన కమాండ్లు

### పైప్‌లైన్ మరియు CI/CD
```bash
# GitHub Actions‌ను అమర్చండి
azd pipeline config

# Azure DevOps‌ను అమర్చండి
azd pipeline config --provider azdo

# పైప్‌లైన్ కాన్ఫిగరేషన్‌ను చూపించండి
azd pipeline show
```

### ఇన్‌ఫ్రాస్ట్రక్చర్ నిర్వహణ
```bash
# ఇన్‌ఫ్రాస్ట్రక్చర్ టెంప్లేట్లు రూపొందించండి
azd infra generate

# 🧪 ఇన్‌ఫ్రాస్ట్రక్చర్ ముందస్తు అవలోకనం మరియు ప్రణాళిక
azd provision --preview
# ఎటువంటి డిప్లాయ్ చేయకుండా ఇన్‌ఫ్రాస్ట్రక్చర్ ప్రొవిజనింగ్‌ను అనుకరిస్తుంది
# Bicep/Terraform టెంప్లేట్లను విశ్లేషించి ఇలా చూపిస్తుంది:
# - జోడించవలసిన వనరులు (ఆకుపచ్చ +)
# - మార్చవలసిన వనరులు (పసుపు ~)
# - తొలగించవలసిన వనరులు (ఎర్ర -)
# నడపడానికి సురక్షితం - Azure వాతావరణంలో ఎటువంటి వాస్తవ మార్పులు జరగవు

# azure.yaml నుండి ఇన్‌ఫ్రాస్ట్రక్చర్‌ను సృష్టించండి
azd infra synth
```

### ప్రాజెక్ట్ సమాచారం
```bash
# ప్రాజెక్ట్ స్థితి మరియు ఎండ్పాయింట్లను చూపించండి
azd show

# వివరమైన ప్రాజెక్ట్ సమాచారాన్ని JSONగా చూపించండి
azd show --output json

# సేవ ఎండ్పాయింట్లను పొందండి
azd show --output json | jq '.services'
```

## 🎯 త్వరిత వర్క్‌ఫ్లోలు

### అభివృద్ధి వర్క్‌ఫ్లో
```bash
# కొత్త ప్రాజెక్ట్ ప్రారంభించండి
azd init --template todo-nodejs-mongo
cd my-project

# డెవలప్‌మెంట్‌కు డిప్లాయ్ చేయండి
azd env new dev
azd up

# మార్పులు చేసి మళ్లీ డిప్లాయ్ చేయండి
azd deploy

# మానిటరింగ్ డ్యాష్‌బోర్డ్‌ను తెరవండి
azd monitor --live
```

### బహుళ ఎన్విరాన్‌మెంట్ వర్క్‌ఫ్లో
```bash
# పర్యావరణాలను ఏర్పాటు చేయండి
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

### ట్రబుల్‌షూటింగ్ వర్క్‌ఫ్లో
```bash
# డీబగ్ మోడ్‌ను ప్రారంభించండి
export AZD_DEBUG=true

# డిప్లాయ్‌మెంట్ స్థితిని తనిఖీ చేయండి
azd show

# విన్యాసాన్ని ధృవీకరించండి
azd config list

# లాగ్‌ల కోసం మానిటరింగ్ డాష్‌బోర్డును తెరవండి
azd monitor --logs

# వనరుల స్థితిని తనిఖీ చేయండి
azd show --output json
```

## 🔍 డీబగ్గింగ్ కమాండ్లు

### డీబగ్గ్ సమాచారం
```bash
# డీబగ్ అవుట్పుట్‌ను ఎనేబుల్ చేయండి
export AZD_DEBUG=true
azd <command> --debug

# శుభమైన అవుట్పుట్ కోసం టెలిమెట్రీని నిలిపివేయండి
export AZD_DISABLE_TELEMETRY=true

# ప్రస్తుత కాన్ఫిగరేషన్‌ను తనిఖీ చేయండి
azd config list

# ప్రామాణీకరణ స్థితిని తనిఖీ చేయండి
az account show
```

### టెంప్లెట్ డీబగ్గింగ్
```bash
# వివరాలతో అందుబాటులో ఉన్న టెంప్లేట్లను జాబితా చేయండి
azd template list --output json

# టెంప్లేట్ సమాచారం చూపండి
azd template show <template-name>

# init చేయడానికి ముందు టెంప్లేట‌ను ధృవీకరించండి
azd template validate <template-name>
```

## 📁 ఫైల్ మరియు డైరెక్టరీ కమాండ్లు

### ప్రాజెక్ట్ నిర్మాణం
```bash
# ప్రస్తుత డైరెక్టరీ నిర్మాణాన్ని చూపించండి
tree /f  # విండోస్
find . -type f  # లినక్స్/మ్యాక్‌ఒఎస్

# azd ప్రాజెక్ట్ రూట్‌కు నావిగేట్ చేయండి
cd $(azd root)

# azd కాన్ఫిగరేషన్ డైరెక్టరీ చూపించండి
echo $AZD_CONFIG_DIR  # సాధారణంగా ~/.azd
```

## 🎨 అవుట్‌పుట్ ఫార్మాటింగ్

### JSON అవుట్పుట్
```bash
# స్క్రిప్టింగ్ కోసం JSON అవుట్పుట్ పొందండి
azd show --output json
azd env list --output json
azd config list --output json

# jq తో పార్స్ చేయండి
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### టేబుల్ అవుట్పుట్
```bash
# సారిణీగా ఫార్మాట్ చేయండి
azd env list --output table

# డిప్లాయ్ చేయబడిన సేవలను చూడండి
azd show --output json | jq '.services | keys'
```

## 🔧 సాధారణ కమాండ్ కలయికలు

### హెల్త్ చెక్ స్క్రిప్ట్
```bash
#!/bin/bash
# త్వరిత ఆరోగ్య తనిఖీ
azd show
azd env show
azd monitor --logs
```

### డిప్లాయ్‌మెంట్ ధ్రువీకరణ
```bash
#!/bin/bash
# డిప్లాయ్‌మెంట్‌కు ముందే ధృవీకరణ
azd show
azd provision --preview  # డిప్లాయ్ చేయడానికి ముందు మార్పులను పరిశీలించండి
az account show
```

### ఎన్విరాన్‌మెంట్ పోలిక
```bash
#!/bin/bash
# పరిసరాలను పోల్చండి
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### వనరుల శుభ్రపరచే స్క్రిప్ట్
```bash
#!/bin/bash
# పాత ఎన్విరాన్‌మెంట్లను శుభ్రం చేయండి
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 ఎన్విరాన్‌మెంట్ వేరియబుల్స్

### సాధారణ ఎన్విరాన్‌మెంట్ వేరియబుల్స్
```bash
# Azure కాన్ఫిగరేషన్
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD కాన్ఫిగరేషన్
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# అనువర్తన కాన్ఫిగరేషన్
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 అత్యవసర కమాండ్లు

### త్వరిత పరిష్కారాలు
```bash
# ప్రామాణీకరణను రీసెట్ చేయండి
az account clear
az login

# ఎన్విరాన్‌మెంట్‌ను బలవంతంగా నవీకరించండి
azd env refresh

# అన్ని సేవలను మళ్లీ అమలులో పెట్టండి
azd deploy

# డిప్లాయ్‌మెంట్ స్థితిని తనిఖీ చేయండి
azd show --output json
```

### పునరుద్ధరణ కమాండ్లు
```bash
# విఫలమైన డిప్లాయ్‌మెంట్ నుంచి కోలుకోవడం - శుభ్రం చేసి మళ్లీ డిప్లాయ్ చేయండి
azd down --force --purge
azd up

# కేవలం ఇన్ఫ్రాస్ట్రక్చర్‌ను మళ్లీ ప్రావిజన్ చేయండి
azd provision

# కేవలం అప్లికేషన్‌ను మళ్లీ డిప్లాయ్ చేయండి
azd deploy
```

## 💡 ప్రో సూచనలు

### వేగవంతమైన వర్క్‌ఫ్లో కోసం అలియాస్లు
```bash
# మీ .bashrc లేదా .zshrc ఫైల్‌లో చేర్చండి
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### ఫంక్షన్ షార్ట్‌కట్స్
```bash
# పర్యావరణాన్ని త్వరగా మార్చడం
azd-env() {
    azd env select $1 && azd show
}

# మానిటరింగ్‌తో త్వరగా డిప్లాయ్ చేయడం
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# పర్యావరణ స్థితి
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

# కమాండ్-సంబంధిత సహాయం
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

# టెంప్లేట్ డాక్యుమెంటేషన్ చూపించండి
azd template show <template-name> --docs
```

---

**సూచన**: ఈ చీట్‌షీట్‌ను బుక్మార్క్ చేయండి మరియు మీరు అవసరమైన కమాండ్లను త్వరగా కనిపెట్టడానికి `Ctrl+F` ఉపయోగించండి!

---

**నావిగేషన్**
- **మునుపటి పాఠం**: [ప్రీఫ్లైట్ తనిఖీలు](../docs/pre-deployment/preflight-checks.md)
- **తర్వాతి పాఠం**: [పదకోశం](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
నిరాకరణ:
ఈ పత్రాన్ని AI అనువాద సేవ అయిన [Co-op Translator](https://github.com/Azure/co-op-translator) ద్వారా అనువదించారు. మేము ఖచ్చితత్వానికి శ్రద్ధ వహించినప్పటికీ, ఆటోమేటెడ్ అనువాదాల్లో తప్పులు లేదా అసమర్థతలు ఉండవచ్చు అని దయచేసి గమనించండి. మూల భాషలో ఉన్న పత్రాన్ని అధికారిక మూలంగా పరిగణించాలి. కీలకమైన సమాచారానికి వృత్తిపరమైన మానవ అనువాదం సూచించబడుతుంది. ఈ అనువాదాన్ని ఉపయోగించడంతో ఏర్పడిన ఏవైనా అపార్థాలు లేదా తప్పుడు అర్థాల కోసం మేము బాధ్యులు కాదని తెలియజేస్తున్నాం.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->