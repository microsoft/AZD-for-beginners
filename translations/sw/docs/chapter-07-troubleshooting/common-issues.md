# Common Issues and Solutions

**Chapter Navigation:**
- **📚 Course Home**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Current Chapter**: Sura ya 7 - Utatuzi wa Matatizo na Urekebishaji
- **⬅️ Previous Chapter**: [Sura ya 6: Ukaguzi wa Kabla ya Uzinduzi](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Next**: [Mwongozo wa Urekebishaji](debugging.md)
- **🚀 Next Chapter**: [Sura ya 8: Mifano ya Uzalishaji na Biashara](../chapter-08-production/production-ai-practices.md)

## Introduction

Mwongozo huu kamili wa utatuzi wa matatizo unafunika matatizo yanayotokea mara kwa mara wakati wa kutumia Azure Developer CLI. Jifunze kutambua, kutatua, na kutatua matatizo ya kawaida yanayohusiana na uthibitishaji, utekelezaji, utoaji wa miundombinu, na usanidi wa programu. Kila tatizo lina dalili za kina, sababu za msingi, na taratibu za hatua kwa hatua za utoaji suluhisho.

## Learning Goals

Kwa kumaliza mwongozo huu, utapata:
- Kujua mbinu za uchunguzi kwa masuala ya Azure Developer CLI
- Kuelewa matatizo ya kawaida ya uthibitishaji na ruhusa na suluhisho zao
- Kutatua kushindikana kwa utekelezaji, makosa ya utoaji miundombinu, na matatizo ya usanidi
- Kutekeleza ufuatiliaji na mikakati ya urekebishaji
- Kutumia mbinu za kimfumo za utatuzi kwa matatizo changamano
- Kusanidi udhibiti wa kumbukumbu na ufuatiliaji ili kuzuia matatizo yajayo

## Learning Outcomes

Baada ya kumaliza, utaweza:
- Kuchunguza masuala ya Azure Developer CLI kwa kutumia zana za uchunguzi zilizojengwa ndani
- Kutatua matatizo yanayohusiana na uthibitishaji, usajili, na ruhusa kwa kujitegemea
- Kutatua kwa ufanisi kushindikana kwa utekelezaji na makosa ya utoaji miundombinu
- Kurekebisha matatizo ya usanidi wa programu na matatizo maalum ya mazingira
- Kutekeleza ufuatiliaji na arifa za kutambua kwa njia ya kujihakikishia matatizo yanayoweza kutokea
- Kutumia mbinu bora za kumbukumbu, urekebishaji, na utiririshaji wa utatuzi wa matatizo

## Quick Diagnostics

Kabla ya kuingia kwenye matatizo maalum, run amri hizi kukusanya taarifa za uchunguzi:

```bash
# Kagua toleo na afya ya azd
azd version
azd config list

# Thibitisha uthibitishaji wa Azure
az account show
az account list

# Kagua mazingira ya sasa
azd env show
azd env get-values

# Washa uandishi wa logi za urekebishaji
export AZD_DEBUG=true
azd <command> --debug
```

## Authentication Issues

### Issue: "Failed to get access token"
**Symptoms:**
- `azd up` fails with authentication errors
- Commands return "unauthorized" or "access denied"

**Solutions:**
```bash
# 1. Thibitisha upya kwa Azure CLI
az login
az account show

# 2. Futa vyeti vilivyohifadhiwa kwenye cache
az account clear
az login

# 3. Tumia mtiririko wa msimbo wa kifaa (kwa mifumo isiyo na kiolesura cha mtumiaji)
az login --use-device-code

# 4. Weka usajili ulioainishwa
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Issue: "Insufficient privileges" during deployment
**Symptoms:**
- Deployment fails with permission errors
- Can't create certain Azure resources

**Solutions:**
```bash
# 1. Angalia uteuzi wa majukumu yako wa Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Hakikisha una majukumu yanayohitajika
# - Contributor (kwa uundaji wa rasilimali)
# - User Access Administrator (kwa uteuzi wa majukumu)

# 3. Wasiliana na msimamizi wako wa Azure ili kupata ruhusa zinazofaa
```

### Issue: Multi-tenant authentication problems
**Solutions:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Infrastructure Provisioning Errors

### Issue: Resource name conflicts
**Symptoms:**
- "The resource name already exists" errors
- Deployment fails during resource creation

**Solutions:**
```bash
# 1. Tumia majina ya rasilimali ya kipekee yenye tokeni
# Katika kiolezo chako cha Bicep:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Badilisha jina la mazingira
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Safisha rasilimali zilizopo
azd down --force --purge
```

### Issue: Location/Region not available
**Symptoms:**
- "The location 'xyz' is not available for resource type"
- Certain SKUs not available in selected region

**Solutions:**
```bash
# 1. Angalia maeneo yanayopatikana kwa aina za rasilimali
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Tumia mikoa inayopatikana kwa kawaida
azd config set defaults.location eastus2
# au
azd env set AZURE_LOCATION eastus2

# 3. Angalia upatikanaji wa huduma kwa kila mkoa
# Tembelea: https://azure.microsoft.com/global-infrastructure/services/
```

### Issue: Quota exceeded errors
**Symptoms:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Solutions:**
```bash
# 1. Angalia matumizi ya kikomo ya sasa
az vm list-usage --location eastus2 -o table

# 2. Omba ongezeko la kikomo kupitia portal ya Azure
# Nenda kwenye: Usajili > Matumizi + Vikomo

# 3. Tumia SKUs ndogo kwa ajili ya maendeleo
# Katika main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Safisha rasilimali zisizotumika
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Issue: Bicep template errors
**Symptoms:**
- Template validation failures
- Syntax errors in Bicep files

**Solutions:**
```bash
# 1. Thibitisha sintaksia ya Bicep
az bicep build --file infra/main.bicep

# 2. Tumia linter ya Bicep
az bicep lint --file infra/main.bicep

# 3. Angalia sintaksia ya faili ya vigezo
cat infra/main.parameters.json | jq '.'

# 4. Tazama awali mabadiliko ya utekelezaji
azd provision --preview
```

## 🚀 Deployment Failures

### Issue: Build failures
**Symptoms:**
- Application fails to build during deployment
- Package installation errors

**Solutions:**
```bash
# 1. Angalia matokeo ya kujenga kwa bendera ya debug
azd deploy --service web --debug

# 2. Angalia hali ya huduma iliyowekwa
azd show

# 3. Jaribu kujenga kwa kompyuta ya ndani
cd src/web
npm install
npm run build

# 3. Angalia upatanisho wa matoleo ya Node.js na Python
node --version  # Inapaswa kuendana na mipangilio ya azure.yaml
python --version

# 4. Ondoa cache ya ujenzi
rm -rf node_modules package-lock.json
npm install

# 5. Angalia Dockerfile ikiwa unatumia makontena
docker build -t test-image .
docker run --rm test-image
```

### Issue: Container deployment failures
**Symptoms:**
- Container apps fail to start
- Image pull errors

**Solutions:**
```bash
# 1. Jaribu kujenga Docker kwa ndani
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Angalia logi za kontena kwa kutumia Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Fuatilia programu kupitia azd
azd monitor --logs

# 3. Thibitisha ufikiaji wa rejista ya kontena
az acr login --name myregistry

# 4. Angalia usanidi wa programu ya kontena
az containerapp show --name my-app --resource-group my-rg
```

### Issue: Database connection failures
**Symptoms:**
- Application can't connect to database
- Connection timeout errors

**Solutions:**
```bash
# 1. Angalia kanuni za firewall za hifadhidata
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Jaribu muunganisho kutoka kwa programu
# Ongeza kwenye programu yako kwa muda mfupi:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Thibitisha muundo wa mstari wa muunganisho
azd env get-values | grep DATABASE

# 4. Angalia hali ya seva ya hifadhidata
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Configuration Issues

### Issue: Environment variables not working
**Symptoms:**
- App can't read configuration values
- Environment variables appear empty

**Solutions:**
```bash
# 1. Thibitisha vigezo vya mazingira vimewekwa
azd env get-values
azd env get DATABASE_URL

# 2. Angalia majina ya vigezo katika azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Anzisha upya programu
azd deploy --service web

# 4. Kagua usanidi wa huduma ya programu
az webapp config appsettings list --name myapp --resource-group myrg
```

### Issue: SSL/TLS certificate problems
**Symptoms:**
- HTTPS not working
- Certificate validation errors

**Solutions:**
```bash
# 1. Angalia hali ya cheti cha SSL
az webapp config ssl list --resource-group myrg

# 2. Wezesha HTTPS pekee
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Ongeza kikoa maalum (ikiwa inahitajika)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Issue: CORS configuration problems
**Symptoms:**
- Frontend can't call API
- Cross-origin request blocked

**Solutions:**
```bash
# 1. Sanidi CORS kwa App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Sasisha API ili kushughulikia CORS
# Katika Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Angalia ikiwa inakimbia kwenye URL zinazofaa
azd show
```

## 🌍 Environment Management Issues

### Issue: Environment switching problems
**Symptoms:**
- Wrong environment being used
- Configuration not switching properly

**Solutions:**
```bash
# 1. Orodhesha mazingira yote
azd env list

# 2. Chagua mazingira kwa uwazi
azd env select production

# 3. Thibitisha mazingira ya sasa
azd env show

# 4. Unda mazingira mapya ikiwa yameharibika
azd env new production-new
azd env select production-new
```

### Issue: Environment corruption
**Symptoms:**
- Environment shows invalid state
- Resources don't match configuration

**Solutions:**
```bash
# 1. Sasisha hali ya mazingira
azd env refresh

# 2. Weka upya usanidi wa mazingira
azd env new production-reset
# Nakili vigezo vya mazingira vinavyohitajika
azd env set DATABASE_URL "your-value"

# 3. Ingiza rasilimali zilizopo (ikiwa inawezekana)
# Sasisha kwa mkono .azure/production/config.json na vitambulisho vya rasilimali
```

## 🔍 Performance Issues

### Issue: Slow deployment times
**Symptoms:**
- Deployments taking too long
- Timeouts during deployment

**Solutions:**
```bash
# 1. Peleka huduma maalum kwa mzunguko wa haraka
azd deploy --service web
azd deploy --service api

# 2. Tumia utoaji wa msimbo tu wakati miundombinu haijabadilika
azd deploy  # Haraka kuliko azd up

# 3. Boresha mchakato wa kujenga
# Katika package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Angalia maeneo ya rasilimali (tumia mkoa huo huo)
azd config set defaults.location eastus2
```

### Issue: Application performance problems
**Symptoms:**
- Slow response times
- High resource usage

**Solutions:**
```bash
# 1. Ongeza rasilimali
# Sasisha SKU katika main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Wezesha ufuatiliaji wa Application Insights
azd monitor --overview

# 3. Angalia logi za programu kwenye Azure
az webapp log tail --name myapp --resource-group myrg
# au kwa Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Tekeleza uhifadhi wa cache
# Ongeza cache ya Redis kwenye miundombinu yako
```

## 🛠️ Troubleshooting Tools and Commands

### Debug Commands
```bash
# Uchunguzi wa mdudu kwa kina
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Angalia toleo la azd
azd version

# Angalia usanidi wa sasa
azd config list

# Jaribu muunganisho
curl -v https://myapp.azurewebsites.net/health
```

### Log Analysis
```bash
# Logi za programu kupitia Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Fuatilia programu kwa kutumia azd
azd monitor --logs
azd monitor --live

# Logi za rasilimali za Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Logi za kontena (kwa Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Resource Investigation
```bash
# Orodhesha rasilimali zote
az resource list --resource-group myrg -o table

# Angalia hali ya rasilimali
az webapp show --name myapp --resource-group myrg --query state

# Uchunguzi wa mtandao
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Getting Additional Help

### When to Escalate
- Authentication issues persist after trying all solutions
- Infrastructure problems with Azure services
- Billing or subscription-related issues
- Security concerns or incidents

### Support Channels
```bash
# 1. Angalia Afya ya Huduma ya Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Unda tiketi ya msaada ya Azure
# Nenda kwa: https://portal.azure.com -> Msaada + usaidizi

# 3. Rasilimali za jamii
# - Stack Overflow: lebo ya azure-developer-cli
# - GitHub Masuala: https://github.com/Azure/azure-dev/issues
# - Microsoft Maswali na Majibu: https://learn.microsoft.com/en-us/answers/
```

### Information to Gather
Before contacting support, collect:
- `azd version` output
- `azd config list` output
- `azd show` output (current deployment status)
- Error messages (full text)
- Steps to reproduce the issue
- Environment details (`azd env show`)
- Timeline of when issue started

### Log Collection Script
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

## 📊 Issue Prevention

### Pre-deployment Checklist
```bash
# Thibitisha uthibitishaji
az account show

# Angalia vikwazo na mipaka
az vm list-usage --location eastus2

# Thibitisha violezo
az bicep build --file infra/main.bicep

# Fanya majaribio kwanza kwenye mazingira ya ndani
npm run build
npm run test

# Tumia utekelezaji wa jaribio usioathiri
azd provision --preview
```

### Monitoring Setup
```bash
# Wezesha Application Insights
# Ongeza kwenye main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Sanidi arifa
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Regular Maintenance
```bash
# Ukaguzi wa afya wa kila wiki
./scripts/health-check.sh

# Ukaguzi wa gharama wa kila mwezi
az consumption usage list --billing-period-name 202401

# Ukaguzi wa usalama wa kila robo mwaka
az security assessment list --resource-group myrg
```

## Related Resources

- [Mwongozo wa Urekebishaji](debugging.md) - Advanced debugging techniques
- [Utayarishaji wa Rasilimali](../chapter-04-infrastructure/provisioning.md) - Infrastructure troubleshooting
- [Mipango ya Uwezo](../chapter-06-pre-deployment/capacity-planning.md) - Resource planning guidance
- [Uchaguzi wa SKU](../chapter-06-pre-deployment/sku-selection.md) - Service tier recommendations

---

**Tip**: Weka mwongozo huu kwenye alama (bookmark) na rudi kwenyeo kila utakapotokea matatizo. Matatizo mengi yamewahi kutokea hapo awali na tayari yana suluhisho zilizothibitishwa!

---

**Navigation**
- **Previous Lesson**: [Utayarishaji wa Rasilimali](../chapter-04-infrastructure/provisioning.md)
- **Next Lesson**: [Mwongozo wa Urekebishaji](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Tamko la kutokuwajibika:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI Co-op Translator (https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuwa sahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Nyaraka ya asili katika lugha yake ya asili inapaswa kuchukuliwa kama chanzo cha kuaminika. Kwa taarifa muhimu, inapendekezwa kutumia huduma ya mtafsiri mtaalamu wa kibinadamu. Hatuwezi kuwajibika kwa kutokuelewana au tafsiri potofu zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->