# సాధారణ సమస్యలు మరియు పరిష్కారాలు

**అధ్యాయం నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD ఫర్ బిగినర్స్](../../README.md)
- **📖 ప్రస్తుతం అధ్యాయం**: అధ్యాయం 7 - సమస్యం పరిష్కారం & డీబగ్గింగ్
- **⬅️ కొత్త అధ్యాయం**: [అధ్యాయం 6: ప్రీ-ఫ్లైట్ చెక్స్](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ తర్వాత**: [డీబగ్గింగ్ గైడ్](debugging.md)
- **🚀 తదుపరి అధ్యాయం**: [అధ్యాయం 8: ప్రొడక్షన్ & ఎంటర్‌ప్రైజ్ ప్యాటర్న్స్](../chapter-08-production/production-ai-practices.md)

## పరిచయం

ఈ సమగ్ర troubleshooting గైడ్ Azure Developer CLI ఉపయోగించినప్పుడు చాలా సార్లు ఎదురయ్యే సమస్యలను కవరిస్తుంది. ఆథెంటికేషన్, డిప్లాయ్‌మెంట్, ఇన్ఫ్రాస్ట్రక్చర్ ప్రొవిజనింగ్, మరియు అప్లికేషన్ కాన్ఫిగరేషన్ సమస్యలను ఎలా గుర్తించాలో, పరిష్కరించాలో తెలుసుకోండి. ప్రతి సమస్యకు విపులమైన లక్షణాలు, మూల కారణాలు, మరియు దశల వారీ పరిష్కారం సాధనాలు ఉంటాయి.

## నేర్చుకోబోయే లక్ష్యాలు

ఈ గైడ్ పూర్తి చేసి మీరు:
- Azure Developer CLI సమస్యల కోసం డయాగ్నోస్టిక్ టెక్నిక్స్‌లో నిపుణులవుతారు
- సాధారణ ఆథెంటికేషన్ మరియు అనుమతి సమస్యలు మరియు వాటి పరిష్కారాలను అర్థం చేసుకుంటారు
- డిప్లాయ్‌మెంట్ విఫలాలు, ఇన్ఫ్రాస్ట్రక్చర్ ప్రొవిజనింగ్ లోపాలు, మరియు కాన్ఫిగరేషన్ సమస్యలను పరిష్కరించగలుగుతారు
- పూర్వ‌క‌మ‌న మానిట‌రింగ్ మరియు డీబగ్గింగ్ వ్యూహాలు అమలు చేస్తారు
- క్లిష్ట సమస్యలకు విధానపూర్వక troubleshooting పద్ధతులు ఉపయోగిస్తారు
- భవిష్యత్తులో సమస్యలు రావడం నివారించడానికి సరైన లాగింగ్ మరియు మానిటరింగ్‌ను కాన్ఫిగర్ చేస్తారు

## నేర్చుకున్న ఫలితాలు

పూర్తి చేసిన తర్వాత, మీరు చేయగలరని:
- బిల్ట్-ఇన్ డయాగ్నోస్టిక్ టూల్స్ ఉపయోగించి Azure Developer CLI సమస్యలను గుర్తించగలరు
- ఆథెంటికేషన్, సబ్‌స్క్రిప్షన్, మరియు అనుమతి సంబంధిత సమస్యలను స్వతంత్రంగా పరిష్కరించగలరు
- డిప్లాయ్‌మెంట్ విఫలాలు మరియు ఇన్ఫ్రాస్ట్రక్చర్ ప్రొవిజనింగ్ లోపాలను సమర్థవంతంగా గుర్తించి పరిష్కరించగలరు
- అప్లికేషన్ కాన్ఫిగరేషన్ సమస్యల్ని మరియు ఎన్విరాన్మెంట్-స్పెసిఫిక్ సమస్యలను డీబగ్గింగ్ చేయగలరు
- ఉప మందుకొండ‌లు మరియు అలెర్టింగ్ సెటప్ చేసి సమస్యలను ముందుగానే గుర్తించగలరు
- లాగింగ్, డీబగ్గింగ్, సమస్య పరిష్కార పనులకి ఉత్తమ పద్ధతులను అనుసరిస్తారు

## త్వరిత డయాగ్నోస్టిక్స్

> ఉదాహరణ పేర్లు/ఐడీలను మీ ఎన్విరాన్మెంట్ విలువలతో మార్చండి. Bash, Bicep, JavaScript, మరియు ప్యారామీటర్-ఫైల్ భాగాలు వేరుగా లేబుల్ చేయబడ్డాయి; అవి ఒకే అమలు అయ్యే స్క్రిప్ట్ కాదని గమనించండి. నాశనాత్మక ఆపరేషన్లను సమీక్షించి రహస్యాలు షేర్ చేసే ముందు తొలగించండి. `azd monitor --logs` బ్రౌజర్ ఓపెన్ చేస్తుంది; ఇది టెర్మినల్ లాగ్స్‌ను స్ట్రీమ్ చేయదు.

ప్రత్యేక సమస్యలకుప్రేమీరు, డయాగ్నోస్టిక్ సమాచారాన్ని సేకరించడానికి ఈ కమాండ్లు నడిపించండి:

```bash
# Check azd version and health
azd version
azd config show

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env list
azd env get-values

# Enable debug logging for the command being investigated
azd <command> --debug
```

## ఆథెంటికేషన్ సమస్యలు

### సమస్య: "ప్రవేశ టోకెన్ పొందడంలో విఫలం"
**లక్షణాలు:**
- `azd up` ఆథెంటికేషన్ తప్పిదాలతో విఫలమవుతుంది
- కమాండ్లు "అనుమతి లేదు" లేదా "ప్రవేశం నిరాకరించబడింది" పరిసరిని చూపిస్తాయి

**పరిష్కారాలు:**
```bash
# 1. Authenticate azd separately (Azure CLI login alone may not authenticate azd)
azd auth login
azd auth login --check-status --output json

# 2. Authenticate Azure CLI when using az commands
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd env set AZURE_SUBSCRIPTION_ID "your-subscription-id"
```

### సమస్య: "డిప్లాయ్‌మెంట్లో అపరిపూర్ణ అనుమతులు"
**లక్షణాలు:**
- అనుమతుల లోపాల కారణంగా డిప్లాయ్‌మెంట్ విఫలమవుతుంది
- కొన్ని Azure వనరులను సృష్టించలేరు

**పరిష్కారాలు:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### సమస్య: మల్టీ-టెనెంట్ ఆథెంటికేషన్ సమస్యలు
**పరిష్కారాలు:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ ఇన్ఫ్రాస్ట్రక్చర్ ప్రొవిజనింగ్ లోపాలు

### సమస్య: వనరు పేరు సంకర్షణలు
**లక్షణాలు:**
- "ఉన్న వనరు పేరు ఇప్పటికే ఉంది" అనే తప్పిదాలు
- వనరు సృష్టించేటప్పుడు డిప్లాయ్‌మెంట్ విఫలమవుతుంది

**పరిష్కారాలు:**
```bicep
// 1. Fragment inside your Bicep template
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
// Inside a resource declaration:
name: '${applicationName}-${resourceToken}'
```

```bash
# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Delete ONLY a disposable environment after inspecting it and backing up data
azd down
```

### సమస్య: ప్రాంతం/రీజియన్ అందుబాటులో లేదు
**లక్షణాలు:**
- "xyz ప్రాంతం 'వనరు రకం' కు అందుబాటులో లేదు" సందేశాలు
- ఎంపిక చేసిన ప్రాంతంలో కొన్ని SKUలు లభ్యంకాలేవు

**పరిష్కారాలు:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

స్థానంలో మార్చడం మునుపటి వనరులను మారుస్తూ ఉండదు. ఒక ఉన్న వనరు గ్రూపు లేదా వనరు స్థాన మార్పును నిరాకరించవచ్చు; ప్రాంతీయ పునఃవ్యవస్థీకరణకు వేరొక ఎన్విరాన్మెంట్ ఉపయోగించండి.

### సమస్య: కోటా దాటిపోయిన లోపాలు
**లక్షణాలు:**
- "వనరు రకం కోసం కోటా దాటిపోయింది" సందేశాలు
- "గరిష్ఠ వనరు సంఖ్య చేరింది" సందేశాలు

**పరిష్కారాలు:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

అభివృద్ధి కోసం, `infra/main.parameters.json`లో మద్దతు లభించే చిన్న SKUను ఎంచుకోండి:

```json
{
  "appServiceSku": {
    "value": "B1"
  }
}
```

```bash
# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### సమస్య: Bicep టెంప్లేట్ లోపాలు
**లక్షణాలు:**
- టెంప్లేట్ చెల్లింపులు విఫలమవుతాయి
- Bicep ఫైళ్లలో సింటాక్స్ లోపాలు

**పరిష్కారాలు:**
```bash
# 1. Validate Bicep syntax
az bicep build --file infra/main.bicep

# 2. Use Bicep linter
az bicep lint --file infra/main.bicep

# 3. Check parameter file syntax
cat infra/main.parameters.json | jq '.'

# 4. Preview deployment changes
azd provision --preview
```

## 🚀 డిప్లాయ్‌మెంట్ విఫలమవుతాయి

### సమస్య: బిల్డ్ విఫలాలు
**లక్షణాలు:**
- అప్లికేషన్ డిప్లాయ్‌మెంట్ సమయంలో బిల్డ్ చెయ్యలేదు
- ప్యాకేజ్ ఇన్‌స్టాలేషన్ లో తప్పిదాలు

**పరిష్కారాలు:**
```bash
# 1. Check build output with debug flag
azd deploy web --debug

# 2. View deployed service status
azd show

# 3. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
# Preserve the committed dependency lock for reproducibility
npm ci

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### సమస్య: కంటైనర్ డిప్లాయ్‌మెంట్ విఫలాలు
**లక్షణాలు:**
- కంటైనర్ యాప్స్ స్టార్ట్ కాలేకపోవడం
- ఇమేజ్ పుల్ లోపాలు

**పరిష్కారాలు:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs using Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Monitor application through azd
azd monitor --logs

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### సమస్య: డేటాబేస్ కనెక్షన్ విఫలాలు
**లక్షణాలు:**
- అప్లికేషన్ డేటాబేస్‌కు కనెక్ట్ కాలేకపోవడం
- కనెక్షన్ టైమౌట్ లోపాలు

**పరిష్కారాలు:**
```bash
# 1. Check database firewall rules
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test connectivity from application
# Add to your app temporarily:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verify connection string format
azd env get-values | grep DATABASE

# 4. Check database server status
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 కాన్ఫిగరేషన్ సమస్యలు

### సమస్య: ఎన్విరాన్మెంట్ వేరియబుల్స్ పనిచేయడం లేదు
**లక్షణాలు:**
- యాప్ కాన్ఫిగరేషన్ విలువలను చదవడం కాదు
- ఎన్విరాన్మెంట్ వేరియబుల్స్ ఖాళీగా కనిపిస్తాయి

**పరిష్కారాలు:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get-value DATABASE_URL

# 2. Check how your Bicep/template maps values into the deployed app.
# azd env set updates local environment values; it does not directly update runtime settings.

# 3. Restart the application
azd deploy web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### సమస్య: SSL/TLS సర్టిఫికేట్ సమస్యలు
**లక్షణాలు:**
- HTTPS పనిచేయడం లేదు
- సర్టిఫికెట్ వాలిడేషన్ లోపాలు

**పరిష్కారాలు:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### సమస్య: CORS కాన్ఫిగరేషన్ సమస్యలు
**లక్షణాలు:**
- ఫ్రంట్‌ఎండ్ API కాల్ చేయలేకపోవడం
- క్రాస్-ఆరిజిన్ రిక్వెస్ట్ బ్లాక్ చేయబడింది

**పరిష్కారాలు:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. మీ ఉన్న ఎక్స్ప్రెస్ అప్లికేషన్ (తో `cors` దిగుమతి చేసుకున్నది) అప్డేట్ చేయండి:

```javascript
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));
```

```bash
# 3. Check if running on correct URLs
azd show
```

## 🌍 ఎన్విరాన్మెంట్ నిర్వహణ సమస్యలు

### సమస్య: ఎన్విరాన్మెంట్ మార్పు సమస్యలు
**లక్షణాలు:**
- తప్పు ఎన్విరాన్మెంట్ ఉపయోగించడం
- కాన్ఫిగరేషన్ సరైనట్లుగా మారడం లేదు

**పరిష్కారాలు:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env list

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### సమస్య: ఎన్విరాన్మెంట్ కంప్రేషన్
**లక్షణాలు:**
- ఎన్విరాన్మెంట్ చెల్లని స్థితిని చూపిస్తుంది
- వనరులు కాన్ఫిగరేషన్‌కు సరిపోకపోవడం

**పరిష్కారాలు:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. azd env refresh reads outputs of a previous deployment; it does not
# import arbitrary existing resources or reconcile template drift.
# To adopt resources, use the template's documented existing-resource parameters.
```

## 🔍 పనితీరు సమస్యలు

### సమస్య: నెమ్మదిగా డిప్లాయ్‌మెంట్ సమయాలు
**లక్షణాలు:**
- డిప్లాయ్‌మెంట్ చాలా సమయం తీసుకోవడం
- డిప్లాయ్‌మెంట్ సమయంలో టైమౌట్‌లు

**పరిష్కారాలు:**
```bash
# 1. Deploy specific services for faster iteration
azd deploy web
azd deploy api

# 2. Use code-only deployment when infrastructure unchanged
azd deploy  # Faster than azd up

# 3. Optimize the project's actual build script and image layers.

# 4. Check resource locations (use same region)
# Do not change AZURE_LOCATION to fix the latency of an existing deployment.
```

### సమస్య: అప్లికేషన్ పనితీరు సమస్యలు
**లక్షణాలు:**
- స్లో రెస్పాన్స్ టైమ్స్
- అధిక వనరు వినియోగం

**పరిష్కారాలు:**
```bash
# 1. Scale up resources
# Update the SKU parameter in infra/main.parameters.json, then review and
# provision infrastructure changes. azd deploy alone does not apply SKU changes.
azd provision --preview

# 2. Enable Application Insights monitoring
azd monitor --overview

# 3. Check application logs in Azure
az webapp log tail --name myapp --resource-group myrg
# or for Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ troubleshooting సాధనాలు మరియు కమాండ్లు

### డీబగ్ కమాండ్లు
```bash
# Comprehensive debugging
# Only rerun a mutating command when retrying is appropriate.
azd show --debug

# Check azd version
azd version

# View current configuration
azd config show

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### లాగ్ విశ్లేషణ
```bash
# Application logs via Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitor application with azd
azd monitor --logs
azd monitor --live

# Azure resource logs
az monitor activity-log list --resource-group myrg --offset 1h --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### వనరు అన్వేషణ
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 అదనపు సహాయం పొందడం

### ఎప్పుడు ఎస్కలేట్ చేయాలి
- అన్ని పరిష్కారాలు చేసిన తర్వాత కూడా ఆథెంటికేషన్ సమస్యలు కొనసాగుతున్నప్పుడు
- Azure సేవలతో ఇన్ఫ్రాస్ట్రక్చర్ సమస్యలు ఉన్నప్పుడు
- బిల్లింగ్ లేదా సబ్‌స్క్రిప్షన్ సంబంధిత సమస్యలు ఉన్నప్పుడు
- భద్రతా సందేహాలు లేదా సర్వసాధారణ సంఘటనలు ఉన్నప్పుడు

### సపోర్ట్ ఛానెల్స్
```bash
# 1. Check Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Create Azure support ticket
# Go to: https://portal.azure.com -> Help + support

# 3. Community resources
# - Stack Overflow: azure-developer-cli tag
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### సేకరించవలసిన సమాచారం
సపోర్ట్‌ను సంప్రదించే ముందు, ఈ సమాచారాన్ని సేకరించండి:
- `azd version` అవుట్పుట్
- `azd config show` అవుట్పుట్
- `azd show` అవుట్పుట్ (ప్రస్తుత డిప్లాయ్‌మెంట్ స్థితి)
- తప్పిద సందేశాలు (పూర్తి వచనం)
- సమస్యను పునరుత్పత్తి చేయడానికి తీసుకున్న దశలు
- రీకార్డింగ్ వాతావరణ వివరాలు (ఎప్పుడూ మిగిలిన `azd env get-values` షేర్ చేయవద్దు, అందులో రహస్యాలు ఉండవచ్చు)
- సమస్య ఎప్పుడు మొదలైంది Timeline

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
# Do not collect environment values automatically: they can contain credentials.

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 సమస్య నివారణ

### మునుపటి అమరిక చెక్‌లిస్ట్
```bash
# 1. Validate authentication
az account show

# 2. Check quotas and limits
az vm list-usage --location eastus2

# 3. Validate templates
az bicep build --file infra/main.bicep

# 4. Test locally first
npm run build
npm run test

# 5. Use dry-run deployments
azd provision --preview
```

### మానిటరింగ్ సెట్‌అప్
```bicep
// Illustrative fragment, not a complete resource definition:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}
```

```bash
# Example App Service PLAN CPU alert (not a site metric)
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/serverfarms/myplan \
  --condition "avg CpuPercentage > 80"
```

### నియమిత నిర్వహణ
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## సంబంధిత వనరులు

- [డీబగ్గింగ్ గైడ్](debugging.md) - అధునాతన డీబగ్గింగ్ సాంకేతికతలు
- [ప్రొవిజనింగ్ వనరులు](../chapter-04-infrastructure/provisioning.md) - మౌలిక వసతుల సమస్య పరిష్కారం
- [ధారితల ప్రణాళిక](../chapter-06-pre-deployment/capacity-planning.md) - వనరుల ప్రణాళిక మార్గదర్శకాలు
- [SKU ఎంపిక](../chapter-06-pre-deployment/sku-selection.md) - సేవా స్థాయి సిఫార్సులు

---

**సూచన**: ఈ గైడ్‌ను బుక్‌మార్క్ చేసి మీకు సమస్యలు వస్తే దీనిని సూచించండి. చాలా సమస్యలు ముందు చూసేవి మరియు పరిష్కారాలు ఉన్నాయి!

---

**నావిగేషన్**
- **ముందటి పాఠం**: [ప్రొవిజనింగ్ వనరులు](../chapter-04-infrastructure/provisioning.md)
- **తరువాత పాఠం**: [డీబగ్గింగ్ గైడ్](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->