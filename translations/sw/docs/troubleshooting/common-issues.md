<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9788ca3a01099b5a07db01554f915e27",
  "translation_date": "2025-09-10T06:25:36+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "sw"
}
-->
# Masuala ya Kawaida na Suluhisho

## Utangulizi

Mwongozo huu wa kina wa utatuzi unashughulikia masuala yanayokumbwa mara kwa mara wakati wa kutumia Azure Developer CLI. Jifunze jinsi ya kugundua, kutatua, na kushughulikia matatizo ya kawaida yanayohusiana na uthibitishaji, uwekaji, utoaji wa miundombinu, na usanidi wa programu. Kila suala linaeleza dalili, sababu kuu, na hatua za hatua kwa hatua za kutatua.

## Malengo ya Kujifunza

Kwa kukamilisha mwongozo huu, utaweza:
- Kumudu mbinu za uchunguzi wa matatizo ya Azure Developer CLI
- Kuelewa matatizo ya kawaida ya uthibitishaji na ruhusa pamoja na suluhisho zake
- Kutatua matatizo ya uwekaji, makosa ya utoaji wa miundombinu, na matatizo ya usanidi
- Kutekeleza mikakati ya ufuatiliaji na urekebishaji wa matatizo kwa njia ya kujihadhari
- Kutumia mbinu za utatuzi wa matatizo kwa mifumo changamano
- Kusimamia ufuatiliaji na ukaguzi sahihi ili kuzuia matatizo ya baadaye

## Matokeo ya Kujifunza

Baada ya kukamilisha, utaweza:
- Kugundua matatizo ya Azure Developer CLI kwa kutumia zana za uchunguzi zilizojengwa ndani
- Kutatua matatizo yanayohusiana na uthibitishaji, usajili, na ruhusa kwa uhuru
- Kushughulikia matatizo ya uwekaji na makosa ya utoaji wa miundombinu kwa ufanisi
- Kurekebisha matatizo ya usanidi wa programu na matatizo maalum ya mazingira
- Kutekeleza ufuatiliaji na tahadhari ili kutambua matatizo yanayoweza kutokea mapema
- Kutumia mbinu bora za ukaguzi, urekebishaji, na mtiririko wa kazi wa kutatua matatizo

## Uchunguzi wa Haraka

Kabla ya kuingia kwenye masuala maalum, endesha amri hizi ili kukusanya taarifa za uchunguzi:

```bash
# Check azd version and health
azd version
azd config list

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env show
azd env get-values

# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug
```

## Masuala ya Uthibitishaji

### Suala: "Imeshindwa kupata tokeni ya ufikiaji"
**Dalili:**
- `azd up` inashindwa na makosa ya uthibitishaji
- Amri zinarudisha "haijaruhusiwa" au "ufikiaji umekataliwa"

**Suluhisho:**
```bash
# 1. Re-authenticate with Azure CLI
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Suala: "Ruhusa haitoshi" wakati wa uwekaji
**Dalili:**
- Uwekaji unashindwa na makosa ya ruhusa
- Huwezi kuunda rasilimali fulani za Azure

**Suluhisho:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Suala: Matatizo ya uthibitishaji wa wateja wengi
**Suluhisho:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Makosa ya Utoaji wa Miundombinu

### Suala: Migongano ya majina ya rasilimali
**Dalili:**
- Makosa ya "Jina la rasilimali tayari lipo"
- Uwekaji unashindwa wakati wa uundaji wa rasilimali

**Suluhisho:**
```bash
# 1. Use unique resource names with tokens
# In your Bicep template:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Clean up existing resources
azd down --force --purge
```

### Suala: Eneo/Ukanda haupatikani
**Dalili:**
- "Eneo 'xyz' halipatikani kwa aina ya rasilimali"
- SKUs fulani hazipatikani katika eneo lililochaguliwa

**Suluhisho:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Use commonly available regions
azd config set defaults.location eastus2
# or
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

### Suala: Makosa ya kikomo cha idadi
**Dalili:**
- "Kikomo cha idadi kimezidi kwa aina ya rasilimali"
- "Idadi ya juu ya rasilimali imefikiwa"

**Suluhisho:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

# 3. Use smaller SKUs for development
# In main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Suala: Makosa ya templeti ya Bicep
**Dalili:**
- Makosa ya uthibitishaji wa templeti
- Makosa ya sintaksia katika faili za Bicep

**Suluhisho:**
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

## 🚀 Kushindwa kwa Uwekaji

### Suala: Kushindwa kwa ujenzi
**Dalili:**
- Programu inashindwa kujengwa wakati wa uwekaji
- Makosa ya usakinishaji wa kifurushi

**Suluhisho:**
```bash
# 1. Check build logs
azd logs --service web
azd deploy --service web --debug

# 2. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
rm -rf node_modules package-lock.json
npm install

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### Suala: Kushindwa kwa uwekaji wa kontena
**Dalili:**
- Programu za kontena zinashindwa kuanza
- Makosa ya kuvuta picha

**Suluhisho:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs
azd logs --service api --follow

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### Suala: Kushindwa kwa muunganisho wa hifadhidata
**Dalili:**
- Programu haiwezi kuunganishwa na hifadhidata
- Makosa ya muda wa muunganisho

**Suluhisho:**
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

## 🔧 Masuala ya Usanidi

### Suala: Mabadiliko ya mazingira hayafanyi kazi
**Dalili:**
- Programu haiwezi kusoma maadili ya usanidi
- Mabadiliko ya mazingira yanaonekana tupu

**Suluhisho:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get DATABASE_URL

# 2. Check variable names in azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Restart the application
azd deploy --service web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### Suala: Matatizo ya cheti cha SSL/TLS
**Dalili:**
- HTTPS haifanyi kazi
- Makosa ya uthibitishaji wa cheti

**Suluhisho:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Suala: Matatizo ya usanidi wa CORS
**Dalili:**
- Sehemu ya mbele haiwezi kuita API
- Ombi la asili tofauti limezuiwa

**Suluhisho:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Update API to handle CORS
# In Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Check if running on correct URLs
azd show
```

## 🌍 Masuala ya Usimamizi wa Mazingira

### Suala: Matatizo ya kubadilisha mazingira
**Dalili:**
- Mazingira yasiyo sahihi yanatumika
- Usanidi hauendi sambamba na mabadiliko

**Suluhisho:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env show

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### Suala: Uharibifu wa mazingira
**Dalili:**
- Mazingira yanaonyesha hali isiyo sahihi
- Rasilimali haziendani na usanidi

**Suluhisho:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. Import existing resources (if possible)
# Manually update .azure/production/config.json with resource IDs
```

## 🔍 Masuala ya Utendaji

### Suala: Muda mrefu wa uwekaji
**Dalili:**
- Uwekaji unachukua muda mrefu sana
- Muda wa kusubiri unazidi wakati wa uwekaji

**Suluhisho:**
```bash
# 1. Enable parallel deployment
azd config set deploy.parallelism 5

# 2. Use incremental deployments
azd deploy --incremental

# 3. Optimize build process
# In package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Check resource locations (use same region)
azd config set defaults.location eastus2
```

### Suala: Matatizo ya utendaji wa programu
**Dalili:**
- Muda wa majibu ni mrefu
- Matumizi makubwa ya rasilimali

**Suluhisho:**
```bash
# 1. Scale up resources
# Update SKU in main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Enable Application Insights monitoring
azd monitor

# 3. Check application logs for bottlenecks
azd logs --service api --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ Zana na Amri za Utatuzi

### Amri za Urekebishaji
```bash
# Comprehensive debugging
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Check system info
azd info

# Validate configuration
azd config validate

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### Uchambuzi wa Magogo
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Uchunguzi wa Rasilimali
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Kupata Msaada wa Ziada

### Wakati wa Kupandisha Kesi
- Masuala ya uthibitishaji yanaendelea baada ya kujaribu suluhisho zote
- Matatizo ya miundombinu na huduma za Azure
- Masuala yanayohusiana na bili au usajili
- Wasiwasi wa usalama au matukio

### Njia za Msaada
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

### Taarifa za Kukusanya
Kabla ya kuwasiliana na msaada, kusanya:
- Matokeo ya `azd version`
- Matokeo ya `azd info`
- Ujumbe wa makosa (maandishi kamili)
- Hatua za kuzalisha tatizo
- Maelezo ya mazingira (`azd env show`)
- Muda wa kuanza kwa tatizo

### Script ya Kukusanya Magogo
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
azd info >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Recent logs:" > debug-logs/recent-logs.txt
azd logs --since 1h >> debug-logs/recent-logs.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Kuzuia Masuala

### Orodha ya Kukagua Kabla ya Uwekaji
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

### Usanidi wa Ufuatiliaji
```bash
# Enable Application Insights
# Add to main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Set up alerts
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Matengenezo ya Kawaida
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## Rasilimali Zinazohusiana

- [Mwongozo wa Urekebishaji](debugging.md) - Mbinu za hali ya juu za urekebishaji
- [Utoaji wa Rasilimali](../deployment/provisioning.md) - Utatuzi wa miundombinu
- [Mipango ya Uwezo](../pre-deployment/capacity-planning.md) - Mwongozo wa upangaji wa rasilimali
- [Uchaguzi wa SKU](../pre-deployment/sku-selection.md) - Mapendekezo ya viwango vya huduma

---

**Kidokezo**: Hifadhi mwongozo huu na rejea kila unapokutana na matatizo. Masuala mengi yamewahi kutokea na yana suluhisho zilizothibitishwa!

---

**Urambazaji**
- **Somo Lililopita**: [Utoaji wa Rasilimali](../deployment/provisioning.md)
- **Somo Linalofuata**: [Mwongozo wa Urekebishaji](debugging.md)

---

**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya kutafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.