# సాధారణ సమస్యలు మరియు పరిష్కారాలు

**చాప్టర్ నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభికుల కోసం](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 7 - సమస్య పరిష్కారం & డీబగ్గింగ్
- **⬅️ గత అధ్యాయం**: [అధ్యాయం 6: ముందస్తు తనిఖీలు](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ తదుపరి**: [డీబగ్గింగ్ గైడ్](debugging.md)
- **🚀 తర్వాతి అధ్యాయం**: [అధ్యాయం 8: ఉత్పత్తి & సంస్థా నమూనాలు](../chapter-08-production/production-ai-practices.md)

## పరిచయం

ఈ విస్తృతమైన సమస్య పరిష్కార గైడ్ Azure Developer CLI ఉపయోగించినప్పుడు తరచుగా ఎదురయ్యే సమస్యలను కవర్ చేస్తుంది. ప్రామాణీకరణ, డిప్లాయ్‌మెంట్, ఇన్‌ఫ్రాస్ట్రక్చర్ ప్రొవిజనింగ్, మరియు అప్లికేషన్ కాన్ఫిగరేషన్ సంబంధిత సాధారణ సమస్యలను నిర్ధారించుకోవడం, ట్రబుల్‌షూట్ చేయడం, మరియు పరిష్కరించడం నేర్చుకోండి. ప్రతి సమస్యకు లక్షణాలు, మూల కారణాలు మరియు క్రమబద్ధ పరిష్కార ప్రక్రియలు ఇవ్వబడ్డాయి.

## అభ్యాస లక్ష్యాలు

ఈ గైడ్ పూర్తి చేసిన తర్వాత మీరు:
- Azure Developer CLI సమస్యల diagnostics తెక్నిక్స్‌లో నైపుణ్యం పొందతారు
- సాధారణ ప్రామాణీకరణ మరియు అనుమతి సమస్యలు మరియు వాటి పరిష్కారాలను అర్థం చేసుకుంటారు
- డిప్లాయ్‌మెంట్ వైఫల్యాలు, ఇన్‌ఫ్రాస్ట్రక్చర్ ప్రొవిజనింగ్ లోపాలు, మరియు కాన్ఫిగరేషన్ సమస్యలను పరిష్కరిస్తారు
- ప్రో-యాక్టివ్ మానిటరింగ్ మరియు డీబగ్గింగ్ వ్యూహాలను అమలు చేస్తారు
- సంక్లిష్ట సమస్యల కోసం సిస్టమెటిక్ ట్రబుల్‌షూటింగ్ పద్ధతులను ప్రయోగిస్తారు
- భవిష్యత్లో సమస్యలను తగ్గించడానికి సరికొత్త లాగింగ్ మరియు మానిటరింగ్ కాన్ఫిగరేషన్లను అమలు చేస్తారు

## అభ్యాస ఫలితాలు

పూర్తి చేసిన తరువాత, మీరు చేయగలరు:
- బిల్ట్-ఇన్ diagnostics టూల్స్ ఉపయోగించి Azure Developer CLI సమస్యలను నిర్ధారించగలుగుతారు
- స్వతంత్రంగా ప్రామాణీకరణ, సబ్‌స్క్రిప్షన్, మరియు అనుమతి సంబంధిత సమస్యలను పరిష్కరిస్తారు
- డిప్లాయ్‌మెంట్ విఫలతలు మరియు ఇన్‌ఫ్రాస్ట్రక్చర్ ప్రొవిజనింగ్ లోపాలను సమర్థవంతంగా ట్రబుల్‌షూట్ చేస్తారు
- అప్లికేషన్ కాన్ఫిగరేషన్ సమస్యలు మరియు వాతావరణ-నిర్ధిష్ట సమస్యలను డీబగ్ చేస్తారు
- సంభావ్య సమస్యలను ముందే గుర్తించడానికి మానిటరింగ్ మరియు అలర్టింగ్ అమలు చేస్తారు
- లాగింగ్, డీబగ్గింగ్, మరియు సమస్య పరిష్కార వర్క్‌ఫ్లోల सर्वोత్తమ ఆచరణలను అనుసరించగలుగుతారు

## వేగవంతమైన నిర్ధారణలు

కొత్త సమస్యలకు దిగేము ముందే ఈ ఆదేశాలను అమలు చేసి డయాగ్నోస్టిక్ సమాచారం సేకరించండి:

```bash
# azd వెర్షన్ మరియు ఆరోగ్య స్థితిని తనిఖీ చేయండి
azd version
azd config show

# Azure ప్రమాణీకరణను ధృవీకరించండి
az account show
az account list

# ప్రస్తుత పర్యావరణాన్ని తనిఖీ చేయండి
azd env list
azd env get-values

# డీబగ్ లాగింగ్‌ను సక్రియం చేయండి
export AZD_DEBUG=true
azd <command> --debug
```

## ప్రామాణీకరణ సమస్యలు

### సమస్య: "Failed to get access token"
**లక్షణాలు:**
- `azd up` అథెంటికేషన్ లోపాలతో విఫలమవుతుంది
- కమాండ్లు "unauthorized" లేదా "access denied" తిరిగి ఇస్తాయి

**పరిష్కారాలు:**
```bash
# 1. Azure CLIతో మళ్లీ ప్రామాణీకరణ చేయండి
az login
az account show

# 2. క్యాష్ చేయబడిన ప్రమాణ పత్రాలను తొలగించండి
az account clear
az login

# 3. డివైస్ కోడ్ ఫ్లో ఉపయోగించండి (హెడ్లెస్ సిస్టమ్‌ల కోసం)
az login --use-device-code

# 4. నిర్దిష్ట సబ్‌స్క్రిప్షన్‌ను సెట్ చేయండి
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### సమస్య: డిప్లాయ్‌మెంట్ సమయంలో "Insufficient privileges"
**లక్షణాలు:**
- అనుమతి లోపాలతో డిప్లాయ్‌మెంట్ విఫలమవుతుంది
- కొన్ని Azure వనరులను సృష్టించలేరు

**పరిష్కారాలు:**
```bash
# 1. మీ Azure పాత్ర కేటాయింపులను తనిఖీ చేయండి
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. తగిన పాత్రలు మీకు ఉన్నాయో నిర్ధారించుకోండి
# - Contributor (వనరులు సృష్టించడానికి)
# - User Access Administrator (పాత్ర కేటాయింపుల కోసం)

# 3. సరైన అనుమతుల కోసం మీ Azure నిర్వాహకుడిని సంప్రదించండి
```

### సమస్య: మల్టీ-టెనెంట్ ఆథెంటికేషన్ సమస్యలు
**పరిషణాలు:**
```bash
# 1. నిర్దిష్ట టెనెంట్‌తో లాగిన్ చేయండి
az login --tenant "your-tenant-id"

# 2. కాన్ఫిగరేషన్‌లో టెనెంట్‌ను సెట్ చేయండి
azd config set auth.tenantId "your-tenant-id"

# 3. టెనెంట్లు మారుతున్నప్పుడు టెనెంట్ క్యాష్‌ను క్లియర్ చేయండి
az account clear
```

## 🏗️ ఇన్‌ఫ్రాస్ట్రక్చర్ ప్రొవిజనింగ్ లోపాలు

### సమస్య: వనరు పేరు సంకర్షణలు
**లక్షణాలు:**
- "The resource name already exists" లోపాలు
- వనరు సృష్టి సమయంలో డిప్లాయ్‌మెంట్ విఫలమవుతుంది

**పరిష్కారాలు:**
```bash
# 1. టోకెన్లతో ప్రత్యేకమైన రిసోర్సుల పేర్లను ఉపయోగించండి
# మీ Bicep టెంప్లేట్‌లో:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. పర్యావరణం పేరును మార్చండి
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. ఇప్పటికే ఉన్న రిసోర్సులను శుభ్రం చేయండి
azd down --force --purge
```

### సమస్య: స్థానం/ప్రాంతం అందుబాటులో లేదు
**లక్షణాలు:**
- "The location 'xyz' is not available for resource type"
- ఎంపికచేసిన ప్రాంగణంలో కొన్ని SKUs అందుబాటులో లేవు

**పరిష్కారాలు:**
```bash
# 1. వనరుల రకాల కోసం అందుబాటులో ఉన్న ప్రాంతాలు తనిఖీ చేయండి
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. సాధారణంగా అందుబాటులో ఉన్న ప్రాంతాలను ఉపయోగించండి
azd config set defaults.location eastus2
# లేదా
azd env set AZURE_LOCATION eastus2

# 3. ప్రాంతాల వారీగా సేవల అందుబాటును తనిఖీ చేయండి
# సందర్శించండి: https://azure.microsoft.com/global-infrastructure/services/
```

### సమస్య: క్వోటా అధిగమించబడిన లోపాలు
**లక్షణాలు:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**పరిష్కారాలు:**
```bash
# 1. ప్రస్తుత కోటా వినియోగాన్ని తనిఖీ చేయండి
az vm list-usage --location eastus2 -o table

# 2. Azure పోర్టల్ ద్వారా కోటా పెంచాలని అభ్యర్థించండి
# వెళ్ళండి: సబ్‌స్క్రిప్షన్లు > వినియోగం + కోటాలు

# 3. డెవలప్‌మెంట్ కోసం చిన్న SKUలను ఉపయోగించండి
# main.parameters.json లో:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. వినియోగంలో లేని వనరులను తొలగించండి
az resource list --query "[?contains(name, 'unused')]" -o table
```

### సమస్య: Bicep టెంప్లేట్ లోపాలు
**లక్షణాలు:**
- టెంప్లేట్ ధృవీకరణ విఫలమవుతుంది
- Bicep ఫైళ్లలో వాక్య రీతిలో లోపాలు

**పరిష్కారాలు:**
```bash
# 1. Bicep సింటాక్స్‌ను ధృవీకరించండి
az bicep build --file infra/main.bicep

# 2. Bicep లింటర్‌ను ఉపయోగించండి
az bicep lint --file infra/main.bicep

# 3. పరామితి ఫైల్ సింటాక్స్‌ను తనిఖీ చేయండి
cat infra/main.parameters.json | jq '.'

# 4. డిప్లాయ్‌మెంట్ మార్పులను ముందుగా చూడండి
azd provision --preview
```

## 🚀 డిప్లాయ్‌మెంట్ విఫలతలు

### సమస్య: బిల్డ్ విఫలతలు
**లక్షణాలు:**
- డిప్లాయ్‌మెంట్ సమయంలో అప్లికేషన్ బిల్డ్ అవ్వడం లేదు
- ప్యాకేజీ ఇన్‌స్టాలేషన్ లోపాలు

**పరిష్కారాలు:**
```bash
# 1. డీబగ్ ఫ్లాగ్‌తో బిల్డ్ అవుట్‌పుట్‌ను తనిఖీ చేయండి
azd deploy --service web --debug

# 2. డిప్లాయ్ చేయబడిన సేవ యొక్క స్థితిని చూడండి
azd show

# 3. బిల్డ్‌ను స్థానికంగా పరీక్షించండి
cd src/web
npm install
npm run build

# 3. Node.js/Python వర్షన్ అనుకూలతను తనిఖీ చేయండి
node --version  # azure.yaml సెట్టింగ్‌లకు సరిపోవాలి
python --version

# 4. బిల్డ్ క్యాష్‌ను క్లియర్ చేయండి
rm -rf node_modules package-lock.json
npm install

# 5. కంటైనర్లు ఉపయోగిస్తే Dockerfile‌ను తనిఖీ చేయండి
docker build -t test-image .
docker run --rm test-image
```

### సమస్య: కంటైనర్ డిప్లాయ్‌మెంట్ విఫలతలు
**లక్షణాలు:**
- కంటైనర్ యాప్స్ ప్రారంభం కావట్లేదు
- ఇమేజ్ పుల్ లోపాలు

**పరిష్కారాలు:**
```bash
# 1. Docker బిల్డ్‌ను స్థానికంగా పరీక్షించండి
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Azure CLI ఉపయోగించి కంటెయినర్ లాగ్‌లను తనిఖీ చేయండి
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. azd ద్వారా అప్లికేషన్‌ను పర్యవేక్షించండి
azd monitor --logs

# 3. కంటెయినర్ రిజిస్ట్రీ యాక్సెస్‌ను ధృవీకరించండి
az acr login --name myregistry

# 4. కంటెయినర్ యాప్ కాన్ఫిగరేషన్‌ను తనిఖీ చేయండి
az containerapp show --name my-app --resource-group my-rg
```

### సమస్య: డేటాబేస్ కనెక్షన్ విఫలతలు
**లక్షణాలు:**
- అప్లికేషన్ డేటాబేస్‌కు కనెక్ట్ చేయలేకపోతోంది
- కనెక్షన్ టైమ్‌అవుట్ లోపాలు

**పరిష్కారాలు:**
```bash
# 1. డేటాబేస్ ఫైర్వాల్ నియమాలు తనిఖీ చేయండి
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. అప్లికేషన్ నుండి కనెక్టివిటీని పరీక్షించండి
# తాత్కాలికంగా మీ యాప్‌లో చేర్చండి:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. కనెక్షన్ స్ట్రింగ్ ఫార్మాట్‌ను ధృవీకరించండి
azd env get-values | grep DATABASE

# 4. డేటాబేస్ సర్వర్ స్థితిని తనిఖీ చేయండి
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 కాన్ఫిగరేషన్ సమస్యలు

### సమస్య: పర్యావరణ వేరియబుల్స్ పని చేయడం లేదు
**లక్షణాలు:**
- యాప్ కాన్ఫిగరేషన్ విలువలను చదవలేకపోతోంది
- పర్యావరణ వేరియబుల్స్ ఖాళీగా కనిపిస్తూనే ఉంటాయి

**పరిష్కారాలు:**
```bash
# 1. పర్యావరణ చరాలు సెట్ చేయబడ్డాయని నిర్ధారించండి
azd env get-values
azd env get DATABASE_URL

# 2. azure.yamlలో వేరియబుల్ పేర్లను తనిఖీ చేయండి
cat azure.yaml | grep -A 5 env:

# 3. అనువర్తనాన్ని పునరారంభించండి
azd deploy --service web

# 4. యాప్ సర్వీస్ కాన్ఫిగరేషన్‌ను తనిఖీ చేయండి
az webapp config appsettings list --name myapp --resource-group myrg
```

### సమస్య: SSL/TLS సర్టిఫికెట్ సమస్యలు
**లక్షణాలు:**
- HTTPS పని చేయడం లేదు
- సర్టిఫికెట్ ధృవీకరణలో లోపాలు

**పరిష్కారాలు:**
```bash
# 1. SSL సర్టిఫికేట్ స్థితిని తనిఖీ చేయండి
az webapp config ssl list --resource-group myrg

# 2. కేవలం HTTPSని సక్రియం చేయండి
az webapp update --name myapp --resource-group myrg --https-only true

# 3. అవసరమైతే కస్టమ్ డొమైన్ జోడించండి
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### సమస్య: CORS కాన్ఫిగరేషన్ సమస్యలు
**లక్షణాలు:**
- ఫ్రంట్‌ఎండ్ API కాల్ చేయలేకపోతుంది
- క్రాస్-ఒరిజిన్ రిక్వెస్ట్ బ్లాక్ అవుతుంది

**పరిష్కారాలు:**
```bash
# 1. App Service కోసం CORS‌ను కాన్ఫిగర్ చేయండి
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. CORS ను నిర్వహించేలా API ను నవీకరించండి
# Express.jsలో:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. సరైన URL లపై నడుస్తున్నదో లేదో తనిఖీ చేయండి
azd show
```

## 🌍 పరిసర నిర్వహణ సమస్యలు

### సమస్య: పరిసర మార్పిడి సమస్యలు
**లక్షణాలు:**
- తప్పైన పరిసరాన్ని ఉపయోగిస్తోంది
- కాన్ఫిగరేషన్ సరైనంగా మార్చడం కాదు

**పరిష్కారాలు:**
```bash
# 1. అన్ని ఎన్విరాన్‌మెంట్‌లను జాబితా చేయండి
azd env list

# 2. స్పష్టంగా ఎన్విరాన్‌మెంట్‌ను ఎంచుకోండి
azd env select production

# 3. ప్రస్తుత ఎన్విరాన్‌మెంట్‌ను ధృవీకరించండి
azd env list

# 4. ఖరాబైనట్లయితే కొత్త ఎన్విరాన్‌మెంట్‌ను సృష్టించండి
azd env new production-new
azd env select production-new
```

### సమస్య: పరిసర కరప్షన్
**లక్షణాలు:**
- పరిసరంలో చెల్లనిది స్థితి చూపిస్తుంది
- వనరులు కాన్ఫిగరేషన్‌కు సరిపోవు

**పరిష్కారాలు:**
```bash
# 1. పరిసర స్థితిని నవీకరించండి
azd env refresh

# 2. పరిసర కాన్ఫిగరేషన్‌ను రీసెట్ చేయండి
azd env new production-reset
# అవసరమైన వాతావరణ చరాలను కాపీ చేయండి
azd env set DATABASE_URL "your-value"

# 3. ఉన్న వనరులను దిగుమతి చేయండి (సాధ్యమైతే)
# వనరు IDలతో .azure/production/config.jsonని మాన్యువల్‌గా నవీకరించండి
```

## 🔍 పనితీరు సమస్యలు

### సమస్య: డిప్లాయ్‌మెంట్ స్లో టైమ్స్
**లక్షణాలు:**
- డిప్లాయ్‌మెంట్‌లు చాలా సమయం తీసుకుంటున్నాయి
- డిప్లాయ్‌మెంట్ సమయంలో టైమ్‌అవుట్లు

**పరిష్కారాలు:**
```bash
# 1. వేగవంతమైన పునరావృతాల కోసం నిర్దిష్ట సేవలను డిప్లాయ్ చేయండి
azd deploy --service web
azd deploy --service api

# 2. ఇన్‌ఫ్రాస్ట్రక్చర్ మారనప్పుడు కోడ్-మాత్రమే డిప్లాయ్ చేయండి
azd deploy  # azd up కంటే వేగంగా

# 3. బిల్డ్ ప్రక్రియను మెరుగుపరచండి
# package.json లో:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. రీసోర్సుల ప్రాంతాలను తనిఖీ చేయండి (ఒకే రీజియన్‌ను ఉపయోగించండి)
azd config set defaults.location eastus2
```

### సమస్య: అప్లికేషన్ పనితీరు సమస్యలు
**లక్షణాలు:**
- స్పందనా వేగం మెల్లగా ఉంది
- అధిక వనరుల ఉపయోగం

**పరిష్కారాలు:**
```bash
# 1. వనరులను పెంచండి
# main.parameters.jsonలో SKUని నవీకరించండి:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Application Insights పర్యవేక్షణను ప్రారంభించండి
azd monitor --overview

# 3. Azureలో అప్లికేషన్ లాగ్‌లను తనిఖీ చేయండి
az webapp log tail --name myapp --resource-group myrg
# లేదా Container Apps కోసం:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. క్యాషింగ్‌ను అమలు చేయండి
# మీ ఇన్‌ఫ్రాస్ట్రక్చర్‌లో Redis క్యాష్‌ను జోడించండి
```

## 🛠️ ట్రబుల్‌షూటింగ్ టూల్స్ మరియు కమాండ్లు

### డీబగ్ కమాండ్లు
```bash
# సమగ్ర డీబగ్గింగ్
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# azd వెర్షన్‌ను తనిఖీ చేయండి
azd version

# ప్రస్తుత కాన్ఫిగరేషన్‌ను వీక్షించండి
azd config show

# కనెక్టివిటీని పరీక్షించండి
curl -v https://myapp.azurewebsites.net/health
```

### లాగ్ విశ్లేషణ
```bash
# Azure CLI ద్వారా అనువర్తన లాగ్‌లు
az webapp log tail --name myapp --resource-group myrg

# azd తో అనువర్తనాన్ని పర్యవేక్షించండి
azd monitor --logs
azd monitor --live

# Azure వనరుల లాగ్‌లు
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# కంటైనర్ లాగ్‌లు (Container Apps కోసం)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### వనరు పరిశోధన
```bash
# అన్ని వనరులను జాబితా చేయండి
az resource list --resource-group myrg -o table

# వనరు స్థితిని తనిఖీ చేయండి
az webapp show --name myapp --resource-group myrg --query state

# నెట్‌వర్క్ డయాగ్నొస్టిక్స్
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 అదనపు సహాయం పొందడం

### ఎప్పుడు ఎస్కలేట్ చేయాలి
- అన్ని పరిష్కారాలు ప్రయత్నించిన తర్వాత ప్రామాణీకరణ సమస్యలు కొనసాగితే
- Azure సేవలతో సంబందించిన ఇన్‌ఫ్రాస్ట్రక్చర్ సమస్యలు ఉన్నప్పుడు
- బిల్లింగ్ లేదా సబ్‌స్క్రిప్షన్ సంబంధించిన సమస్యలు ఉన్నప్పుడు
- భద్రతా ఆందోళనలు లేదా ఘటనలు ఉన్నప్పుడు

### సపోర్ట్ ఛానెల్స్
```bash
# 1. Azure సేవా ఆరోగ్యాన్ని తనిఖీ చేయండి
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Azure మద్దతు టికెట్ సృష్టించండి
# కి వెళ్ళండి: https://portal.azure.com -> సహాయం + మద్దతు

# 3. కమ్యూనిటీ వనరులు
# - Stack Overflow: azure-developer-cli ట్యాగ్
# - GitHub ఇష్యూస్: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### సేకరించాల్సిన సమాచారం
సపోర్ట్‌ను సంప్రదించే ముందు ఈ సమాచారాన్ని సేకరించండి:
- `azd version` ఔట్‌పుట్
- `azd config show` ఔట్‌పుట్
- `azd show` ఔట్‌పుట్ (ప్రస్తుత డిప్లాయ్‌మెంట్ స్థితి)
- లోప సందేశాలు (పూర్తి టెక్స్ట్)
- సమస్యను పునరుత్పత్తి చేసే స్టెప్స్
- పరిసర వివరాలు (`azd env get-values`)
- సమస్య ప్రారంభమైన టైమ్లైన్

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
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 సమస్య నివారణ

### ప్రీ-డిప్లాయ్‌మెంట్ చెక్లిస్ట్
```bash
# 1. ప్రామాణీకరణను నిర్ధారించండి
az account show

# 2. కోటాలు మరియు పరిమితులను తనిఖీ చేయండి
az vm list-usage --location eastus2

# 3. టెంప్లేట్లను ధృవీకరించండి
az bicep build --file infra/main.bicep

# 4. ముందుగా స్థానికంగా పరీక్షించండి
npm run build
npm run test

# 5. పరీక్షాత్మక అమలులను ఉపయోగించండి
azd provision --preview
```

### మానిటరింగ్ సెటప్
```bash
# Application Insightsని సక్రియం చేయండి
# main.bicepలో జోడించండి:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# అలర్ట్‌లను ఏర్పాటు చేయండి
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### రొటీన్ మెయింటెనెన్స్
```bash
# సాప్తాహిక ఆరోగ్య తనిఖీలు
./scripts/health-check.sh

# మాసిక వ్యయ సమీక్ష
az consumption usage list --billing-period-name 202401

# త్రైమాసిక భద్రతా సమీక్ష
az security assessment list --resource-group myrg
```

## సంబంధిత వనరులు

- [డీబగ్గింగ్ గైడ్](debugging.md) - అధునాతన డీబగ్గింగ్ పద్ధతులు
- [వనరుల ప్రొవిజనింగ్](../chapter-04-infrastructure/provisioning.md) - ఇన్‌ఫ్రాస్ట్రక్చర్ సమస్య పరిష్కారం
- [సామర్థ్య ప్రణాళిక](../chapter-06-pre-deployment/capacity-planning.md) - వనరుల ప్లానింగ్ మార్గదర్శకం
- [SKU ఎంపిక](../chapter-06-pre-deployment/sku-selection.md) - సర్వీస్ స్థాయి సిఫార్సులు

---

**సూక్ష్మ సూచన**: ఈ గైడ్‌ను బుక్‌మార్క్ చేసి సమస్యలు ఎదురైనప్పుడు తిరిగి చూడండి. చాలా సమస్యలు ఇప్పటికే చూస్తూ గుర్తించబడినవి మరియు పరిష్కారాలు అమలు చేయబడ్డాయి!

---

**నావిగేషన్**
- **గత పాఠం**: [వనరుల ప్రొవిజనింగ్](../chapter-04-infrastructure/provisioning.md)
- **తదుపరి పాఠం**: [డీబగ్గింగ్ గైడ్](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**డిస్క్లెయిమర్**:
ఈ పత్రాన్ని AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి శ్రమిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలలో పొరపాట్లు లేదా అస్వస్థతలు ఉండవచ్చని దయచేసి గమనించండి. మూల పత్రాన్ని దాని స్థానిక భాషలోనే అధికారిక మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, వృత్తిపరమైన మానవ అనువాదం సిఫార్సు చేయబడుతుంది. ఈ అనువాదం ఉపయోగం వల్ల ఏర్పడే ఏవైనా అపార్థాలు లేదా తప్పుగా అర్థం చేసుకోవడాలకు మేము బాధ్యులు కాదు.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->