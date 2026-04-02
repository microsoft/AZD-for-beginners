# కమాండ్ చీట్ షీట్ - అవసరమైన AZD కమాండ్లు

**అన్ని అధ్యాయాల కోసం త్వరిత సూచిక**
- **📚 కోర్స్ హోమ్**: [AZD ప్రారంభికులకు](../README.md)
- **📖 త్వరిత ప్రారంభం**: [అధ్యాయం 1: పునాది & త్వరిత ప్రారంభం](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI కమాండ్లు**: [అధ్యాయం 2: AI-ప్రథమ అభివృద్ధి](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 అడ్వాన్స్డ్**: [అధ్యాయం 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## పరిచయం

ఈ సమగ్ర చీట్ షీట్ సాధారణంగా ఉపయోగించే Azure Developer CLI కమాండ్లకు శీఘ్ర సూచికను వర్గీకరించిన ఉదాహరణలతో అందిస్తుంది. అభివృద్ధి, సమస్య పరిష్కారం, మరియు azd ప్రాజెక్టులతో రోజువారీ ఆపరేషన్ల సమయంలో త్వరితంగా చూడటానికి అనుకూలంగా ఉంది.

## నేర్చుకునే లక్ష్యాలు

ఈ చీట్ షీట్ ఉపయోగించడం ద్వార మీకు:
- అవసరమైన Azure Developer CLI కమాండ్లు మరియు సింటాక్స్కు తక్షణ ప్రవేశం ఉంటుంది
- కార్యాత్మక వర్గాలుచే కమాండ్లు ఎలా నిర్వహించబడతాయో అర్థం చేసుకుంటారు
- సాధారణ అభివృద్ధి మరియు డిప్లాయ్‌మెంట్ పరిస్థితుల కోసం ప్రాక్టికల్ ఉదాహరణలను సూచించవచ్చు
- సమస్య పరిష్కారానికి తక్షణ రూకత చర్యల కమాండ్లు కనుగొనవచ్చు
- ఉన్నత స్థాయి కాన్ఫిగరేషన్ మరియు అనుకూలీకరణ ఎంపికలను సమర్ధవంతంగా పొందవచ్చు
- పర్యావరణ నిర్వహణ మరియు బహు-పర్యావరణ వర్క్‌ఫ్లో కమాండ్లను గుర్తించవచ్చు

## నేర్చిన ఫలితాలు

ఇదిని తరచుగా సూచిస్తుంటే, మీరు చేయగలరు:
- పూర్తి డాక్యుమెంటేషన్ చూడకుండా azd కమాండ్లను आत्मవిశ్వాసంగా అమలు చేయగలరు
- సరైన డయాగ్నోస్టిక్ కమాండ్లను ఉపయోగించి సాధారణ సమస్యలను త్వరగా పరిష్కరించగలరు
- బహు వాతావరణాలను మరియు డిప్లాయ్‌మెంట్ పరిస్థితులను సమర్ధవంతంగా నిర్వహించగలరు
- అవసరమైతే ఉన్నత azd ఫీచర్స్ మరియు కాన్ఫిగరేషన్ ఎంపికలను వర్తింపజేయగలరు
- వ్యవస్థబద్ధ కమాండ్ సీక్వెన్సుల ద్వారా డిప్లాయ్‌మెంట్ సమస్యలను డీబగ్ చేయగలరు
- azd షార్ట్‌కట్స్ మరియు ఎంపికల సమర్థ వినియోగంతో వర్క్‌ఫ్లోలను గరిష్టం చేయగలరు

## ప్రారంభించడానికి కమాండ్లు

### ప్రామాణీకరణ
```bash
# AZD ద్వారా Azureలో లాగిన్ చేయండి
azd auth login

# Azure CLIలో లాగిన్ చేయండి (AZD దీన్ని నేపథ్యంలో ఉపయోగిస్తుంది)
az login

# ప్రస్తుత ఖాతాను తనిఖీ చేయండి
az account show

# డిఫాల్ట్ సబ్‌స్క్రిప్షన్‌ను సెట్ చేయండి
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD నుండి లాగ్ అవుట్ చేయండి
azd auth logout

# Azure CLI నుండి లాగ్ అవుట్ చేయండి
az logout
```

### ప్రాజెక్ట్ ప్రారంభం
```bash
# అందుబాటులో ఉన్న టెంప్లేట్లను బ్రౌజ్ చేయండి
azd template list

# టెంప్లేట్ నుండి ప్రారంభించండి
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# ప్రస్తుత డైరెక్టరీలో ప్రారంభించండి
azd init .

# కస్టమ్ పేరుతో ప్రారంభించండి
azd init --template todo-nodejs-mongo my-awesome-app
```

## ప్రాథమిక డిప్లాయ్‌మెంట్ కమాండ్లు

### పూర్తి డిప్లాయ్‌మెంట్ పని ప్రవాహం
```bash
# అన్నిటినీ అమలు చేయండి (వనరుల ఏర్పాటు + డిప్లాయ్)
azd up

# నిర్ధారణ ప్రాంప్ట్‌లు ఆపివేసి డిప్లాయ్ చేయండి
azd up --confirm-with-no-prompt

# నిర్దిష్ట పరిసరానికి డిప్లాయ్ చేయండి
azd up --environment production

# అనుకూల పరామితులతో డిప్లాయ్ చేయండి
azd up --parameter location=westus2
```

### ఇన్‌ఫ్రాస్ట్రక్చర్ మాత్రమే
```bash
# Azure వనరులను ఏర్పాటు చేయండి
azd provision

# 🧪 మౌలిక సదుపాయాల మార్పులను ముందుగా చూడండి
azd provision --preview
# ఏ వనరులు సృష్టించబడతాయో, సవరించబడతాయో లేదా తొలగించబడతాయో అనే డ్రై-రన్ దృశ్యాన్ని చూపిస్తుంది
# 'terraform plan' లేదా 'bicep what-if' లాంటిది - నడపడానికి సురక్షితం, ఎలాంటి మార్పులు వర్తించవు
```

### అప్లికేషన్ మాత్రమే
```bash
# అప్లికేషన్ కోడ్‌ను డిప్లాయ్ చేయండి
azd deploy

# నిర్దిష్ట సేవను డిప్లాయ్ చేయండి
azd deploy --service web
azd deploy --service api

# అన్ని సేవలను డిప్లాయ్ చేయండి
azd deploy --all
```

### బిల్డ్ మరియు ప్యాకేజ్
```bash
# అప్లికేషన్లను నిర్మించండి
azd package

# నిర్దిష్ట సేవను నిర్మించండి
azd package --service api
```

## 🌍 పర్యావరణ నిర్వహణ

### పర్యావరణ ఆపరేషన్లు
```bash
# అన్ని పరిసరాలను జాబితా చేయండి
azd env list

# కొత్త పరిసరాన్ని సృష్టించండి
azd env new development
azd env new staging --location westus2

# పరిసరాన్ని ఎంచుకోండి
azd env select production

# లభ్యమైన పరిసరాలను చూపించండి
azd env list

# పరిసర స్థితిని నవీకరించండి
azd env refresh
```

### పర్యావరణ వేరియబుల్స్
```bash
# ఎన్‌విరాన్‌మెంట్ వేరియబుల్‌ను సెట్ చేయండి
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# ఎన్‌విరాన్‌మెంట్ వేరియబుల్‌ను పొందండి
azd env get API_KEY

# అన్ని ఎన్‌విరాన్‌మెంట్ వేరియబుల్‌లను జాబితా చేయండి
azd env get-values

# ఎన్‌విరాన్‌మెంట్ వేరియబుల్‌ను తొలగించండి
azd env unset DEBUG
```

## ⚙️ కాన్ఫిగరేషన్ కమాండ్లు

### గ్లోబల్ కాన్ఫిగరేషన్
```bash
# అన్ని కాన్ఫిగరేషన్‌లను చూపించండి
azd config show

# గ్లోబల్ డిఫాల్ట్‌లను సెట్ చేయండి
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# కాన్ఫిగరేషన్ తీసివేయండి
azd config unset defaults.location

# అన్ని కాన్ఫిగరేషన్‌లను రీసెట్ చేయండి
azd config reset
```

### ప్రాజెక్ట్ కాన్ఫిగరేషన్
```bash
# azure.yaml ఫైల్‌ను ధృవీకరించండి
azd config validate

# ప్రాజెక్ట్ సమాచారాన్ని చూపించండి
azd show

# సేవా ఎండ్‌పాయింట్లను పొందండి
azd show --output json
```

## 📊 మానిటరింగ్ మరియు డయాగ్నోస్టిక్స్

### మానిటరింగ్ డాష్‌బోర్డ్
```bash
# Azure పోర్టల్ మానిటరింగ్ డాష్బోర్డ్‌ను తెరవండి
azd monitor

# Application Insights లైవ్ మెట్రిక్స్‌ను తెరవండి
azd monitor --live

# Application Insights లాగ్స్ బ్లేడ్‌ను తెరవండి
azd monitor --logs

# Application Insights అవలోకనం తెరవండి
azd monitor --overview
```

### కంటైనర్ లాగ్లు వీక్షించడం
```bash
# Azure CLI ద్వారా లాగ్‌లను చూడండి (Container Apps కోసం)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# లాగ్‌లను ప్రత్యక్షంగా అనుసరించండి
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure పోర్టల్ నుండి లాగ్‌లను చూడండి
azd monitor --logs
```

### లాగ్ అనలిటిక్స్ క్వెరీలు
```bash
# Azure పోర్టల్ ద్వారా లాగ్ అనలిటిక్స్‌ను యాక్సెస్ చేయండి
azd monitor --logs

# Azure CLI ఉపయోగించి లాగ్‌లను క్వెరీ చేయండి
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ మెయింటెనెన్స్ కమాండ్లు

### క్లీనప్
```bash
# అన్ని Azure వనరులను తొలగించండి
azd down

# ధృవీకరణ లేకుండా బలవంతంగా తొలగించండి
azd down --force

# సాఫ్ట్‌గా తొలగించిన వనరులను శాశ్వతంగా తొలగించండి
azd down --purge

# పూర్తిగా శుభ్రపరచండి
azd down --force --purge
```

### నవీకరణలు
```bash
# azd నవీకరణల కోసం తనిఖీ చేయండి
azd version

# ప్రస్తుత వెర్షన్‌ను పొందండి
azd version

# ప్రస్తుత కాన్ఫిగరేషన్‌ను చూడండి
azd config show
```

## 🔧 అడ్వాన్స్డ్ కమాండ్లు

### పైప్‌లైన్ మరియు CI/CD
```bash
# GitHub Actionsని కాన్ఫిగర్ చేయండి
azd pipeline config

# Azure DevOpsని కాన్ఫిగర్ చేయండి
azd pipeline config --provider azdo

# పైప్లైన్ కాన్ఫిగరేషన్ చూపించండి
azd pipeline show
```

### ఇన్‌ఫ్రాస్ట్రక్చర్ నిర్వహణ
```bash
# ఇన్‌ఫ్రాస్ట్రక్చర్ టెంప్లేట్లను ఉత్పత్తి చేయండి
azd infra generate

# 🧪 ఇన్‌ఫ్రాస్ట్రక్చర్ ముందుచూపు మరియు ప్రణాళిక
azd provision --preview
# డిప్లాయ్ చేయకుండా ఇన్‌ఫ్రాస్ట్రక్చర్ ప్రొవిజనింగ్‌ను అనుకరిస్తుంది
# Bicep/Terraform టెంప్లేట్లను విశ్లేషించి చూపిస్తుంది:
# - జోడించవలసిన వనరులు (ఆకుపచ్చ +)
# - మార్చవలసిన వనరులు (పసుపు ~)
# - తొలగించవలసిన వనరులు (ఎరుపు -)
# నడపడానికి భద్రం - Azure వాతావరణంలో ఏవైనా వాస్తవ మార్పులు చేయబడవు

# azure.yaml నుండి ఇన్‌ఫ్రాస్ట్రక్చర్‌ను సంకలనం చేయండి
azd infra synth
```

### ప్రాజెక్ట్ సమాచారం
```bash
# ప్రాజెక్ట్ స్థితి మరియు ఎండ్‌పాయింట్లను చూపించండి
azd show

# వివరమైన ప్రాజెక్ట్ సమాచారాన్ని JSON గా చూపించండి
azd show --output json

# సేవ ఎండ్‌పాయింట్లను పొందండి
azd show --output json | jq '.services'
```

## 🤖 AI & ఎక్స్‌టెన్షన్లు కమాండ్లు

### AZD ఎక్స్‌టెన్షన్లు
```bash
# అందుబాటులో ఉన్న అన్ని విస్తరణలను (AI సహితం) జాబితా చేయండి
azd extension list

# Foundry ఏజెంట్స్ విస్తరణను ఇన్‌స్టాల్ చేయండి
azd extension install azure.ai.agents

# ఫైన్-ట్యూనింగ్ విస్తరణను ఇన్‌స్టాల్ చేయండి
azd extension install azure.ai.finetune

# కస్టమ్ మోడల్స్ విస్తరణను ఇన్‌స్టాల్ చేయండి
azd extension install azure.ai.models

# ఇన్‌స్టాల్ చేసిన అన్ని విస్తరణలను అప్‌గ్రేడ్ చేయండి
azd extension upgrade --all
```

### AI ఏజెంట్ కమాండ్లు
```bash
# మానిఫెస్ట్ నుండి ఒక ఏజెంట్ ప్రాజెక్ట్‌ను ప్రారంభించండి
azd ai agent init -m <manifest-path-or-uri>

# ఒక నిర్దిష్ట Foundry ప్రాజెక్ట్‌ను లక్ష్యంగా నిర్దేశించండి
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ఏజెంట్ సోర్స్ డైరెక్టరీని పేర్కొనండి
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# హోస్టింగ్ లక్ష్యాన్ని ఎంచుకోండి
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP సర్వర్ (ఆల్ఫా)
```bash
# మీ ప్రాజెక్ట్ కోసం MCP సర్వర్‌ను ప్రారంభించండి
azd mcp start

# MCP ఆపరేషన్లు కోసం టూల్ అనుమతులను నిర్వహించండి
azd copilot consent list
```

### ఇన్‌ఫ్రాస్ట్రక్చర్ సృష్టి
```bash
# మీ ప్రాజెక్ట్ నిర్వచనంనుంచి IaC ఫైళ్లను ఉత్పత్తి చేయండి
azd infra generate

# azure.yaml నుంచి మౌలిక నిర్మాణాన్ని సృష్టించండి
azd infra synth
```

---

## 🎯 త్వరిత పని ప్రవాహాలు

### అభివృద్ధి పని ప్రవాహం
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

### బహు-పర్యావరణ పని ప్రవాహం
```bash
# పర్యావరణాలను ఏర్పాటు చేయండి
azd env new dev
azd env new staging  
azd env new production

# వికాస వాతావరణానికి పంపిణీ చేయండి
azd env select dev
azd up

# పరీక్షించి స్టేజింగ్ వాతావరణానికి కదిలించండి
azd env select staging
azd up

# ఉత్పత్తి వాతావరణానికి పంపిణీ చేయండి
azd env select production
azd up
```

### సమస్య పరిష్కార పని ప్రవాహం
```bash
# డీబగ్ మోడ్‌ను సక్రియం చేయండి
export AZD_DEBUG=true

# డిప్లాయ్‌మెంట్ స్థితిని తనిఖీ చేయండి
azd show

# కన్ఫిగరేషన్‌ను ధృవీకరించండి
azd config show

# లాగ్‌ల కోసం మానిటరింగ్ డ్యాష్‌బోర్డును తెరవండి
azd monitor --logs

# వనరు స్థితిని తనిఖీ చేయండి
azd show --output json
```

## 🔍 డీబగ్గింగ్ కమాండ్లు

### డీబగ్ సమాచారం
```bash
# డీబగ్ అవుట్పుట్‌ను సక్రియం చేయండి
export AZD_DEBUG=true
azd <command> --debug

# శుభ్రమైన అవుట్పుట్ కోసం టెలిమేట్రీని నిలిపివేయండి
export AZD_DISABLE_TELEMETRY=true

# ప్రస్తుత కాన్ఫిగరేషన్‌ను తనిఖీ చేయండి
azd config show

# ప్రామాణీకరణ స్థితిని తనిఖీ చేయండి
az account show
```

### టెంప్లేట్ డీబగ్గింగ్
```bash
# అందుబాటులో ఉన్న టెంప్లేట్లను వివరాలతో జాబితా చేయండి
azd template list --output json

# టెంప్లేట్ సమాచారాన్ని చూపించండి
azd template show <template-name>

# init చేయకముందు టెంప్లేట్‌ను ధృవీకరించండి
azd template validate <template-name>
```

## 📁 ఫైళ్ళు మరియు డైరెక్టరీ కమాండ్లు

### ప్రాజెక్ట్ నిర్మాణం
```bash
# ప్రస్తుత డైరెక్టరీ నిర్మాణాన్ని చూపించండి
tree /f  # విండోస్
find . -type f  # లినక్స్/macOS

# azd ప్రాజెక్ట్ రూట్‌కు నావిగేట్ చేయండి
cd $(azd root)

# azd కాన్ఫిగరేషన్ డైరెక్టరీని 보여ించండి
echo $AZD_CONFIG_DIR  # సాధారణంగా ~/.azd
```

## 🎨 ఔట్‌పుట్ ఫార్మాటింగ్

### JSON ఔట్‌పుట్
```bash
# స్క్రిప్టింగ్ కోసం JSON అవుట్పుట్ పొందండి
azd show --output json
azd env list --output json
azd config show --output json

# jq ఉపయోగించి పార్స్ చేయండి
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### టేబుల్ ఔట్‌పుట్
```bash
# టేబుల్‌గా ఫార్మాట్ చేయండి
azd env list --output table

# డిప్లాయ్ చేసిన సేవలను వీక్షించండి
azd show --output json | jq '.services | keys'
```

## 🔧 సాధారణ కమాండ్ కాంబినేషన్లు

### ఆరోగ్య తనిఖీ స్క్రిప్ట్
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
azd provision --preview  # డిప్లాయ్ చేయేముందు మార్పులను ముందుగా పరిశీలించండి
az account show
```

### పర్యావరణ పోలిక
```bash
#!/bin/bash
# పరిసరాలను పోల్చండి
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### రీసోర్స్ క్లీనప్ స్క్రిప్ట్
```bash
#!/bin/bash
# పాత ఎన్విరాన్‌మెంట్లను శుభ్రం చేయండి
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 పర్యావరణ వేరియబుల్స్

### సాధారణ పర్యావరణ వేరియబుల్స్
```bash
# ఆజ్యూర్ కాన్ఫిగరేషన్
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

# పర్యావరణాన్ని బలవంతంగా పునఃనవీకరించండి
azd env refresh

# అన్ని సేవలను మళ్లీ డిప్లాయ్ చేయండి
azd deploy

# డిప్లాయ్ స్థితిని తనిఖీ చేయండి
azd show --output json
```

### పునరుద్ధరణ కమాండ్లు
```bash
# విఫలమైన డిప్లాయ్‌మెంట్ నుంచి పునరుద్ధరించుకోండి - శుభ్రపరచి మళ్లీ అమలు చేయండి
azd down --force --purge
azd up

# కేవలం ఇన్‌ఫ్రాస్ట్రక్చర్‌ను మళ్లీ ప్రొవైజన్ చేయండి
azd provision

# కేవలం అప్లికేషన్‌ను మళ్లీ డిప్లాయ్ చేయండి
azd deploy
```

## 💡 ప్రొ టిప్స్

### వేగవంతమైన పని కోసం అలియాస్లు
```bash
# మీ .bashrc లేదా .zshrc లో జోడించండి
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### ఫంక్షన్ షార్ట్‌కట్లు
```bash
# ఎన్విరాన్‌మెంట్‌ను త్వరగా మార్చడం
azd-env() {
    azd env select $1 && azd show
}

# పర్యవేక్షణతో త్వరితమైన డిప్లాయ్‌మెంట్
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# ఎన్విరాన్‌మెంట్ స్థితి
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

# ఆజ్ఞా-నిర్దిష్ట సహాయం
azd up --help
azd env --help
azd config --help

# వర్షన్ మరియు బిల్డ్ సమాచారాన్ని చూపించండి
azd version
azd version --output json
```

### డాక్యుమెంటేషన్ లింక్లు
```bash
# బ్రౌజర్‌లో డాక్యుమెంటేషన్‌ను తెరవండి
azd docs

# టెంప్లేట్ డాక్యుమెంటేషన్‌ను చూపించండి
azd template show <template-name> --docs
```

---

**సూచన**: ఈ చీట్ షీట్‌ను బుక్‌ మార్క్ చేయండి మరియు మీకు కావలసిన కమాండ్లను త్వరగా కనుగొనడానికి `Ctrl+F` ఉపయోగించండి!

---

**నావిగేషన్**
- **మునుపటి పాఠం**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **తదుపరి పాఠం**: [పదసూచి](glossary.md)

---

> **💡 మీ ఎడిటర్‌లో Azure కమాండ్ సహాయం కావాలా?** Install [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) with `npx skills add microsoft/github-copilot-for-azure` — AI, Foundry, డిప్లాయ్‌మెంట్, డయాగ్నోస్టిక్స్ మరియు మరిన్ని కోసం 37 నైపుణ్యాలు.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ఈ పత్రాన్ని AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ద్వారా అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీ, ఆటోమేటెడ్ అనువాదాల్లో తప్పులు లేదా అసంపూర్ణతలు ఉండవచ్చని దయచేసి గమనించండి. స్థానిక భాషలోని అసలు పత్రాన్ని అధికారిక మూలంగా పరిగణించాలి. కీలకమైన సమాచారానికి వృత్తిపరమైన మానవ అనువాదాన్ని సిఫారసు చేయబడుతుంది. ఈ అనువాదం వాడకంతో కలిగే ఏవైనా అపార్థాలు లేదా తప్పుగా అర్థం చేసుకోవడాలకు మేము బాధ్యులు కాదు.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->