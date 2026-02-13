# సాధారణ సమస్యలు మరియు పరిష్కారాలు

**అధ్యాయ నావిగేషన్:**
- **📚 Course Home**: [AZD ప్రారంభుల కోసం](../../README.md)
- **📖 Current Chapter**: అధ్యాయం 7 - సమస్యల పరిష్కారం & డీబగ్గింగ్
- **⬅️ Previous Chapter**: [అధ్యాయం 6: ప్రీ-ఫ్లైట్ తనిఖీలు](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Next**: [డీబగ్గింగ్ గైడ్](debugging.md)
- **🚀 Next Chapter**: [అధ్యాయం 8: ప్రొడక్షన్ & ఎంటర్‌ప్రైజ్ నమూనాలు](../chapter-08-production/production-ai-practices.md)

## పరిచయం

ఈ సంపూర్ణ ట్రబుల్‌షూటింగ్ గైడ్ Azure Developer CLI ఉపయోగిస్తున్నప్పుడు తరచుగా ఎదురయ్యే సమస్యలను కవర్ చేస్తుంది. ప్రామాణీకరణ, డిప్లాయ్‌మెంట్, మౌలిక సదుపాయాల ప్రొవిజనింగ్, మరియు అప్లికేషన్ కాన్ఫిగరేషన్ సంబంధిత సాధారణ సమస్యలను గుర్తించడం, డయాగ్నోస్ చేయడం మరియు పరిష్కరించడం నేర్చుకోండి. ప్రతి సమస్యకు వివరణాత్మక లక్షణాలు, మూలకారణాలు మరియు దశల వారీ పరిష్కార విధానాలు ఉన్నాయి.

## నేర్చుకునే లక్ష్యాలు

By completing this guide, you will:
- Azure Developer CLI సమస్యలకు సంబంధించిన నిర్ధారణ సాంకేతికతలను నైపుణ్యంగా అలవాటు చేసుకోవడం
- సాధారణ ప్రామాణీకరణ మరియు అనుమతి సమస్యలు మరియు వాటి పరిష్కారాలను అర్థం చేసుకోవడం
- డిప్లాయ్‌మెంట్ విఫలతలు, ఇన్‌ఫ్రాస్ట్రక్చర్ ప్రొవిజనింగ్ లోపాలు మరియు కాన్ఫిగరేషన్ సమస్యలను పరిష్కరించడం
- ప్రొయాక్టివ్ మానిటరింగ్ మరియు డీబగ్గింగ్ వ్యూహాలను అమలు చేయడం
- సంక్లిష్ట సమస్యల కోసం వ్యవస్థాపక ట్రబుల్‌షూటింగ్ విధానాలను వర్తింపజేయడం
- భవిష్యత్ సమస్యలను నివారించేందుకు సరైన లాగింగ్ మరియు మానిటరింగ్‌ను కాన్ఫిగర్ చేయడం

## నేర్చిన ఫలితాలు

Upon completion, you will be able to:
- Azure Developer CLI సమస్యలను బిల్ట్-ఇన్ డయాగ్నోస్టిక్ టూల్స్ ఉపయోగించి డయాగ్నోసిస్ చేయగలగడం
- ప్రామాణీకరణ, సబ్స్క్రిప్షన్ మరియు అనుమతి సంబంధిత సమస్యలను స్వతంత్రంగా పరిష్కరించగలగడం
- డిప్లాయ్‌మెంట్ విఫలతలు మరియు ఇన్‌ఫ్రాస్ట్రక్చర్ ప్రొవిజనింగ్ లోపాలను సమర్థంగా ట్రబుల్‌షూట్ చేయగలగడం
- అప్లికేషన్ కాన్ఫిగరేషన్ సమస్యలు మరియు वातावरण-నిర్దిష్ట సమస్యలను డీబగ్గ్ చేయగలగడం
- సంభావ్య సమస్యలను ముందస్తుగా గుర్తించడానికి మానిటరింగ్ మరియు అలర్టింగ్ అమలు చేయగలగడం
- లాగింగ్, డీబగ్గింగ్ మరియు సమస్య పరిష్కారం వర్క్‌ఫ్లోల కోసం ఉత్తమ పద్ధతులను వర్తింపజేయగలగడం

## త్వరగా నిర్ధారణ

Before diving into specific issues, run these commands to gather diagnostic information:

```bash
# azd వెర్షన్ మరియు ఆరోగ్యం తనిఖీ చేయండి
azd version
azd config list

# Azure ప్రమాణీకరణను నిర్ధారించండి
az account show
az account list

# ప్రస్తుత పర్యావరణాన్ని తనిఖీ చేయండి
azd env show
azd env get-values

# డీబగ్ లాగింగ్‌ను ప్రారంభించండి
export AZD_DEBUG=true
azd <command> --debug
```

## ప్రామాణీకరణ సమస్యలు

### సమస్య: "Failed to get access token"
**లక్షణాలు:**
- `azd up` authentication లోపాల కారణంగా విఫలమవుతుంది
- కమాండ్లు "unauthorized" లేదా "access denied" ను తిరిగి ఇస్తాయి

**పరిష్కారాలు:**
```bash
# 1. Azure CLIతో మళ్లీ ప్రామాణీకరణ చేయండి
az login
az account show

# 2. క్యాష్ చేయబడిన గుర్తింపు వివరాలను క్లియర్ చేయండి
az account clear
az login

# 3. డివైస్ కోడ్ ఫ్లోను ఉపయోగించండి (హెడ్‌లెస్ సిస్టమ్‌ల కోసం)
az login --use-device-code

# 4. స్పష్టమైన సబ్స్క్రిప్షన్‌ను సెట్ చేయండి
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### సమస్య: డిప్లాయ్‌మెంట్ సమయంలో "Insufficient privileges"
**లక్షణాలు:**
- డిప్లాయ్‌మెంట్ అనుమతి పొరపాటు కారణంగా విఫలమవుతుంది
- కొన్ని Azure వనరులను సృష్టించలేరు

**పరిష్కారాలు:**
```bash
# 1. మీ Azure పాత్రల నియామకాలను తనిఖీ చేయండి
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. మీకు అవసరమైన పాత్రలు ఉన్నాయని నిర్ధారించుకోండి
# - Contributor (వనరుల సృష్టి కోసం)
# - User Access Administrator (పాత్రల నియామకాల కోసం)

# 3. సరైన అనుమతుల కోసం మీ Azure నిర్వాహకుడిని సంప్రదించండి
```

### సమస్య: బహుళ-టెనెంట్ ప్రామాణీకరణ సంబంధిత సమస్యలు
**పరిషణలు:**
```bash
# 1. నిర్దిష్ట టెనెంట్‌తో లాగిన్ అవ్వండి
az login --tenant "your-tenant-id"

# 2. కాన్ఫిగరేషన్‌లో టెనెంట్‌ను సెట్ చేయండి
azd config set auth.tenantId "your-tenant-id"

# 3. టెనెంట్లు మార్చినప్పుడు టెనెంట్ క్యాష్‌ను ఖాళీ చేయండి
az account clear
```

## 🏗️ ఇన్‌ఫ్రాస్ట్రక్చర్ ప్రొవిజనింగ్ లో లోపాలు

### సమస్య: వనరు పేరు ఘర్షణలు
**లక్షణాలు:**
- "The resource name already exists" లోపాలు
- వనరు సృష్టి సమయంలో డిప్లాయ్‌మెంట్ విఫలమవుతుంది

**పరిష్కారాలు:**
```bash
# 1. టోకెన్లతో ప్రత్యేకమైన రిసోర్స్ పేర్లు ఉపయోగించండి
# మీ Bicep టెంప్లేట్‌లో:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. ఎన్విరాన్‌మెంట్ పేరు మార్చండి
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. ఇప్పటికే ఉన్న వనరులను శుభ్రపరచండి
azd down --force --purge
```

### సమస్య: లొకేషన్/రీజియన్ అందుబాటులో లేదు
**లక్షణాలు:**
- "The location 'xyz' is not available for resource type"
- ఎంచిన రీజియన్‌లో కొన్ని SKUs అందుబాటులో ఉండవు

**పరిష్కారాలు:**
```bash
# 1. వనరు రకాల కోసం అందుబాటులో ఉన్న ప్రాంతాలను తనిఖీ చేయండి
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. సాధారణంగా అందుబాటులో ఉన్న ప్రాంతాలను ఉపయోగించండి
azd config set defaults.location eastus2
# లేదా
azd env set AZURE_LOCATION eastus2

# 3. ప్రాంతం వారీగా సేవల అందుబాటును తనిఖీ చేయండి
# సందర్శించండి: https://azure.microsoft.com/global-infrastructure/services/
```

### సమస్య: కోటా మించి గల లోపాలు
**లక్షణాలు:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**పరిష్కారాలు:**
```bash
# 1. ప్రస్తుత క్వోటా వినియోగాన్ని తనిఖీ చేయండి
az vm list-usage --location eastus2 -o table

# 2. Azure పోర్టల్ ద్వారా క్వోటా పెంపు కోసం అభ్యర్థించండి
# కి వెళ్ళండి: సబ్‌స్క్రిప్షన్లు > వినియోగం + క్వోటాలు

# 3. అభివృద్ధి కోసం చిన్న SKUలు ఉపయోగించండి
# main.parameters.json లో:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. ఉపయోగించని వనరులను తొలగించండి
az resource list --query "[?contains(name, 'unused')]" -o table
```

### సమస్య: Bicep టెంప్లేట్ లో లోపాలు
**లక్షణాలు:**
- టెంప్లేట్ ధృవీకరణ విఫలమవుతుంది
- Bicep ఫైళ్లలో సింటాక్స్ లోపాలు

**పరిష్కారాలు:**
```bash
# 1. Bicep సింటాక్స్‌ని ధృవీకరించండి
az bicep build --file infra/main.bicep

# 2. Bicep లింటర్‌ను ఉపయోగించండి
az bicep lint --file infra/main.bicep

# 3. పరామితి ఫైల్ సింటాక్స్‌ని తనిఖీ చేయండి
cat infra/main.parameters.json | jq '.'

# 4. డిప్లాయ్‌మెంట్ మార్పులను ముందస్తుగా అవలోకనం చేయండి
azd provision --preview
```

## 🚀 డిప్లాయ్‌మెంట్ విఫలతలు

### సమస్య: బిల్డ్ విఫలాలు
**లక్షణాలు:**
- డిప్లాయ్‌మెంట్ సమయంలో అప్లికేషన్ బిల్డ్ అవ్వడం విఫలమవుతుంది
- ప్యాకేజ్ ఇన్‌స్టాలేషన్ లోపాలు

**పరిష్కారాలు:**
```bash
# 1. డీబగ్ ఫ్లాగ్‌తో బిల్డ్ అవుట్‌పుట్‌ను తనిఖీ చేయండి
azd deploy --service web --debug

# 2. డిప్లాయ్ చేసిన సేవ యొక్క స్థితిని చూడండి
azd show

# 3. బిల్డ్‌ను స్థానికంగా పరీక్షించండి
cd src/web
npm install
npm run build

# 3. Node.js/Python వెర్షన్ అనుకూలతను తనిఖీ చేయండి
node --version  # azure.yaml సెట్టింగ్స్‌కు సరిపోవాలి
python --version

# 4. బిల్డ్ క్యాష్‌ను క్లియర్ చేయండి
rm -rf node_modules package-lock.json
npm install

# 5. కన్టైనర్లు ఉపయోగిస్తుంటే Dockerfileని తనిఖీ చేయండి
docker build -t test-image .
docker run --rm test-image
```

### సమస్య: కంటైనర్ డిప్లాయ్‌మెంట్ విఫలతలు
**లక్షణాలు:**
- కంటైనర్ యాప్స్ ప్రారంభమ కాకపోవడం
- ఇమేజ్ పుల్ లోపాలు

**పరిష్కారాలు:**
```bash
# 1. Docker బిల్డ్‌ను స్థానికంగా పరీక్షించండి
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Azure CLI ఉపయోగించి కంటైనర్ లాగ్‌లను తనిఖీ చేయండి
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. azd ద్వారా అప్లికేషన్‌ను పర్యవేక్షించండి
azd monitor --logs

# 3. కంటైనర్ రిజిస్ట్రీ యాక్సెస్‌ను ధృవీకరించండి
az acr login --name myregistry

# 4. కంటైనర్ యాప్ కాన్ఫిగరేషన్‌ను తనిఖీ చేయండి
az containerapp show --name my-app --resource-group my-rg
```

### సమస్య: డేటాబేస్ కనెక్షన్ విఫలతలు
**లక్షణాలు:**
- అప్లికేషన్ డేటాబేస్‌కు కనెక్ట్ అవ్వడం లేదు
- కనెక్షన్ టైమ్‌అవుట్ లోపాలు

**పరిష్కారాలు:**
```bash
# 1. డేటాబేస్ ఫైర్వాల్ నియమాలను తనిఖీ చేయండి
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. అప్లికేషన్ నుంచి కనెక్టివిటీని పరీక్షించండి
# తాత్కాలికంగా మీ యాప్‌లో జోడించండి:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. కనెక్షన్ స్ట్రింగ్ ఫార్మాట్‌ను ధృవీకరించండి
azd env get-values | grep DATABASE

# 4. డేటాబేస్ సర్వర్ స్థితిని తనిఖీ చేయండి
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 కాన్ఫిగరేషన్ సమస్యలు

### సమస్య: ఎన్విరాన్‌మెంట్ వేరియబుల్‌లు పనిచేయడం లేదు
**లక్షణాలు:**
- యాప్ కాన్ఫిగరేషన్ విలువలను చదవలేకపోతుంది
- ఎన్విరాన్‌మెంట్ వేరియబుల్స్ ఖాళీగా కనిపిస్తాయి

**పరిష్కారాలు:**
```bash
# 1. పర్యావరణ వేరియబుల్స్ సెట్ అయ్యాయా లేదా అని నిర్ధారించండి
azd env get-values
azd env get DATABASE_URL

# 2. azure.yaml లో వేరియబుల్ పేర్లను తనిఖీ చేయండి
cat azure.yaml | grep -A 5 env:

# 3. అప్లికేషన్‌ను పునఃప్రారంభించండి
azd deploy --service web

# 4. యాప్ సర్వీస్ కాన్ఫిగరేషన్‌ను తనిఖీ చేయండి
az webapp config appsettings list --name myapp --resource-group myrg
```

### సమస్య: SSL/TLS సర్టిఫికెట్ సమస్యలు
**లక్షణాలు:**
- HTTPS పని చేయడం లేదు
- సర్టిఫికెట్ ధృవీకరణ లోపాలు

**పరిష్కారాలు:**
```bash
# 1. SSL సర్టిఫికేట్ స్థితిని తనిఖీ చేయండి
az webapp config ssl list --resource-group myrg

# 2. కేవలం HTTPSని మాత్రమే అనుమతించండి
az webapp update --name myapp --resource-group myrg --https-only true

# 3. కస్టమ్ డొమైన్ జోడించండి (అవసరమైతే)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### సమస్య: CORS కాన్ఫిగరేషన్ సమస్యలు
**లక్షణాలు:**
- ఫ్రంట్‌ఎండ్ API ని కాల్ చేయలేకపోతుంది
- క్రాస్-ఒరిజిన్ అభ్యర్థన బ్లాక్ చేయబడింది

**పరిష్కారాలు:**
```bash
# 1. App Service కోసం CORS‌ను కాన్ఫిగర్ చేయండి
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. CORS‌ను నిర్వహించేందుకు APIని నవీకరించండి
# Express.jsలో:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. సరైన URLలపై నడుస్తున్నదో లేదో తనిఖీ చేయండి
azd show
```

## 🌍 ఎన్విరాన్‌మెంట్ నిర్వహణ సమస్యలు

### సమస్య: ఎన్విరాన్‌మెంట్ స్విచ్చింగ్ సంబంధిత సమస్యలు
**లక్షణాలు:**
- తప్పు ఎన్విరాన్‌మెంట్ ఉపయోగించబడుతోంది
- కాన్ఫిగరేషన్ సరిగా మారడం లేదు

**పరిష్కారాలు:**
```bash
# 1. అన్ని పర్యావరణాలను జాబితా చేయండి
azd env list

# 2. పర్యావరణాన్ని స్పష్టంగా ఎంచుకోండి
azd env select production

# 3. ప్రస్తుత పర్యావరణాన్ని ధృవీకరించండి
azd env show

# 4. పాడై ఉంటే కొత్త పర్యావరణాన్ని సృష్టించండి
azd env new production-new
azd env select production-new
```

### సమస్య: ఎన్విరాన్‌మెంట్ పాడవడం
**లక్షణాలు:**
- ఎన్విరాన్‌మెంట్ చెల్లని స్థితిని చూపిస్తుంది
- వనరులు కాన్ఫిగరేషన్‌కు సరిపోనివి

**పరిష్కారాలు:**
```bash
# 1. ఎన్‌విరాన్‌మెంట్ స్థితిని నవీకరించండి
azd env refresh

# 2. ఎన్‌విరాన్‌మెంట్ కాన్ఫిగరేషన్‌ను రీసెట్ చేయండి
azd env new production-reset
# అవసరమైన ఎన్‌విరాన్‌మెంట్ వేరియబుల్స్‌ను కాపీ చేయండి
azd env set DATABASE_URL "your-value"

# 3. ఉన్న వనరులను దిగుమతి చేయండి (సాధ్యమైనట్లయితే)
# .azure/production/config.json ను వనరు IDలతో మానవీయంగా నవీకరించండి
```

## 🔍 పనితీరు సంబంధిత సమస్యలు

### సమస్య: డిప్లాయ్‌మెంట్ ఆలస్యంగా జరుగుతోంది
**లక్షణాలు:**
- డిప్లాయ్‌మెంట్స్ చాలా కాలం తీసుకుంటున్నాయి
- డిప్లాయ్‌మెంట్ సమయంలో టైమ్‌అవుట్లు

**పరిష్కారాలు:**
```bash
# 1. వేగవంతమైన పునరావృతానికి నిర్దిష్ట సేవలను అమలు చేయండి
azd deploy --service web
azd deploy --service api

# 2. ఇన్ఫ్రాస్ట్రక్చర్ మారనప్పుడు కేవలం కోడ్‌ను డిప్లాయ్ చేయండి
azd deploy  # azd up కంటే వేగంగా

# 3. బిల్డ్ ప్రక్రియను ఆప్టిమైజ్ చేయండి
# package.json లో:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. వనరుల స్థానాలను తనిఖీ చేయండి (ఒకే ప్రాంతాన్ని ఉపయోగించండి)
azd config set defaults.location eastus2
```

### సమస్య: అప్లికేషన్ పనితీరు సమస్యలు
**లక్షణాలు:**
- స్పందన సమయాలు మెల్లగా ఉన్నాయి
- అధిక వనరు వినియోగం

**పరిష్కారాలు:**
```bash
# 1. వనరులను పెంచండి
# main.parameters.json ఫైల్‌లో SKU ను నవీకరించండి:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Application Insights మానిటరింగ్‌ను సక్రియం చేయండి
azd monitor --overview

# 3. Azure లో అప్లికేషన్ లాగ్స్‌ను తనిఖీ చేయండి
az webapp log tail --name myapp --resource-group myrg
# లేదా Container Apps కోసం:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. క్యాషింగ్ అమలు చేయండి
# మీ ఇన్‌ఫ్రాస్ట్రక్చర్‌లో Redis క్యాష్‌ను జోడించండి
```

## 🛠️ ట్రబుల్‌షూటింగ్ టూల్స్ మరియు కమాండ్లు

### డీబగ్గింగ్ కమాండ్లు
```bash
# సమగ్ర డీబగింగ్
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# azd వెర్షన్‌ను తనిఖీ చేయండి
azd version

# ప్రస్తుత కాన్ఫిగరేషన్‌ను వీక్షించండి
azd config list

# కనెక్టివిటీని పరీక్షించండి
curl -v https://myapp.azurewebsites.net/health
```

### లాగ్ విశ్లేషణ
```bash
# Azure CLI ద్వారా అప్లికేషన్ లాగ్‌లు
az webapp log tail --name myapp --resource-group myrg

# azd తో అప్లికేషన్‌ను పర్యవేక్షించండి
azd monitor --logs
azd monitor --live

# Azure వనరు లాగ్‌లు
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# కంటెయినర్ లాగ్‌లు (Container Apps కోసం)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### వనరు పరిశోధన
```bash
# అన్ని వనరులను జాబితా చేయండి
az resource list --resource-group myrg -o table

# వనరు స్థితిని తనిఖీ చేయండి
az webapp show --name myapp --resource-group myrg --query state

# నెట్‌వర్క్ నిర్ధారణలు
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 అదనపు సహాయం పొందుట

### ఎప్పుడెప్పుడు ఎస్కలేట్ చేయాలి
- ప్రామాణీకరణ సమస్యలు అన్ని పరిష్కారాలను ప్రయత్నించిన తర్వాత కూడా కొనసాగితే
- Azure సేవలతో సంబంధించిన ఇన్‌ఫ్రాస్ట్రక్చర్ సమస్యలు ఉన్నప్పుడు
- బిల్లింగ్ లేదా సబ్‌స్క్రిప్షన్ సంబంధిత సమస్యలు జరిగినప్పుడు
- సెక్యూరిటీ ఆందోళనలు లేదా సంఘటనలు ఉన్నప్పుడు

### మద్దతు ఛానెల్స్
```bash
# 1. Azure సేవల ఆరోగ్యాన్ని తనిఖీ చేయండి
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Azure సపోర్ట్ టికెట్ సృష్టించండి
# కు వెళ్ళండి: https://portal.azure.com -> సహాయం + మద్దతు

# 3. కమ్యూనిటీ వనరులు
# - Stack Overflow: azure-developer-cli ట్యాగ్
# - GitHub ఇష్యూస్: https://github.com/Azure/azure-dev/issues
# - Microsoft ప్రశ్నలు మరియు సమాధానాలు: https://learn.microsoft.com/en-us/answers/
```

### సేకరించవలసిన సమాచారం
సపోర్ట్‌ను సంప్రదించడానికి ముందు, ఈ సమాచారం సేకరించండి:
- `azd version` అవుట్‌పుట్
- `azd config list` అవుట్‌పుట్
- `azd show` అవుట్‌పుట్ (ప్రస్తుత డిప్లాయ్‌మెంట్ స్థితి)
- లోప సందేశాలు (పూర్తి వచనం)
- సమస్యను పునరుఉత్పత్తి చేసే దశలు
- ఎన్విరాన్‌మెంట్ వివరాలు (`azd env show`)
- సమస్య ప్రారంభమైన సమయంలో టైమ్‌లైన్

### లాగ్ సేకరణ స్క్రిప్ట్
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 సమస్య నివారణ

### ప్రీ-డిప్లాయ్‌మెెంట్ చెక్లిస్ట్
```bash
# 1. ప్రామాణీకరణను ధృవీకరించండి
az account show

# 2. క్వోటాలు మరియు పరిమితులను తనిఖీ చేయండి
az vm list-usage --location eastus2

# 3. మూసలను ధృవీకరించండి
az bicep build --file infra/main.bicep

# 4. మొదట స్థానికంగా పరీక్షించండి
npm run build
npm run test

# 5. డ్రై-రన్ డిప్లాయ్‌మెంట్లను ఉపయోగించండి
azd provision --preview
```

### మానిటరింగ్ సెటప్
```bash
# Application Insights‌ను సక్రియం చేయండి
# main.bicepలో జోడించండి:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# అలర్ట్‌లను ఏర్పరచండి
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### నియమిత నిర్వహణ
```bash
# సాప్తాహిక ఆరోగ్య తనిఖీలు
./scripts/health-check.sh

# మాసిక ఖర్చుల సమీక్ష
az consumption usage list --billing-period-name 202401

# త్రైమాసిక భద్రతా సమీక్ష
az security assessment list --resource-group myrg
```

## సంబంధిత వనరులు

- [డీబగ్గింగ్ గైడ్](debugging.md) - అధునాతన డీబగ్గింగ్ సాంకేతికతలు
- [వనరుల ప్రొవిజనింగ్](../chapter-04-infrastructure/provisioning.md) - ఇన్‌ఫ్రాస్ట్రక్చర్ సమస్యల పరిష్కారం
- [సామర్థ్య ప్రణాళిక](../chapter-06-pre-deployment/capacity-planning.md) - వనరుల ప్రణాళిక మార్గనిర్దేశം
- [SKU ఎంపిక](../chapter-06-pre-deployment/sku-selection.md) - సేవా స్థాయి సూచనలు

---

**సలహా**: ఈ గైడ్‌ను బుక్‌మార్క్‌లో ఉంచండి మరియు సమస్యలు ఎదురైనప్పుడు దీన్ని సూచించండి. ఎక్కువమంది సమస్యలు ముందే చూడబడ్డవయి మరియు వాటికి స్థిర పరిష్కారాలు ఉన్నాయి!

---

**నావిగేషన్**
- **మునుపటి పాఠం**: [వనరుల ప్రొవిజనింగ్](../chapter-04-infrastructure/provisioning.md)
- **తర్వాతి పాఠం**: [డీబగ్గింగ్ గైడ్](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
నిరాకరణ:
ఈ పత్రాన్ని AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ద్వారా అనువదించబడింది. మేము ఖచ్చితత్వానికి శ్రమిస్తూనే ఉన్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలలో తప్పులు లేదా అసమగ్రతలు ఉండవచ్చని దయచేసి గమనించండి. దాని మాతృభాషలోని అసలు పత్రాన్ని అధికారిక మూలంగా పరిగణించాలి. కీలకమైన సమాచారానికి వృత్తిపరమైన మానవ అనువాదాన్ని సూచిస్తాము. ఈ అనువాదాన్ని ఉపయోగించడాని వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుగా అర్థం చేసుకోవడాలకు మేము బాధ్యులు కాదు.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->