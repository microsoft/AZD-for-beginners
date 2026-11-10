# Masuala ya Kawaida na Suluhisho

**Uratibu wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura 7 - Utatuzi wa Matatizo & Ugunduzi wa Hitilafu
- **⬅️ Sura Iliyopita**: [Sura 6: Ukaguzi wa Kabla ya Kuendesha](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Inayofuata**: [Mwongozo wa Ugunduzi](debugging.md)
- **🚀 Sura Inayofuata**: [Sura 8: Mifumo ya Uzalishaji & Biashara](../chapter-08-production/production-ai-practices.md)

## Utangulizi

Mwongozo huu wa kina wa utatuzi wa matatizo unahusu masuala yanayokumbukwa mara kwa mara wakati wa kutumia Azure Developer CLI. Jifunze kutambua, kutatua, na kusuluhisha matatizo ya kawaida yanayohusiana na uthibitishaji, uenezaji, utoaji wa miundombinu, na usanidi wa programu. Kila tatizo lina dalili za kina, sababu kuu, na taratibu za hatua kwa hatua za suluhisho.

## Malengo ya Kujifunza

Kwa kumaliza mwongozo huu, utakuwa na uwezo wa:
- Kuimarisha mbinu za uchunguzi kwa matatizo ya Azure Developer CLI
- Kuelewa matatizo ya kawaida ya uthibitishaji na ruhusa pamoja na suluhisho zao
- Kusuluhisha kushindwa kwa uenezaji, makosa ya utoaji miundombinu, na matatizo ya usanidi
- Kutekeleza mikakati ya ukaguzi wa tahadhari na ugunduzi wa hitilafu
- Kutumia mbinu za kikamilifu za utatuzi kwa matatizo magumu
- Kusanidi uandikishaji sahihi na ufuatiliaji ili kuzuia matatizo yajayo

## Matokeo ya Kujifunza

Baada ya kumaliza, utaweza:
- Kugundua matatizo ya Azure Developer CLI kwa kutumia zana za uchunguzi zilizojengwa ndani
- Kusuluhisha matatizo yanayohusiana na uthibitishaji, usajili, na ruhusa kwa kujitegemea
- Kutatua matatizo ya kushindwa kwa uenezaji na makosa ya utoaji miundombinu kwa ufanisi
- Kugundua hitilafu za usanidi wa programu na matatizo maalum ya mazingira
- Kutekeleza ukaguzi na tahadhari ili kutambua matatizo yanayoweza kutokea mapema
- Kutumia mbinu bora za uandikishaji, ugunduzi, na taratibu za suluhisho la tatizo

## Uchunguzi wa Haraka

> Badilisha majina/ID za mifano na thamani za mazingira yako. Vipande vya Bash, Bicep, JavaScript, na faili za parameter vimewekwa lebo tofauti hapa chini; sio hati moja inayotekelezwa. Pitia operesheni zinazoweza kuharibu na fiche siri kabla ya kushiriki uchunguzi. `azd monitor --logs` hufungua kivinjari; haiambatani moja kwa moja kumbukumbu za terminal.

Kabla ya kuingia kwenye masuala maalum, endesha amri hizi kukusanya taarifa za uchunguzi:

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

## Masuala ya Uthibitishaji

### Tatizo: "Imeshindwa kupata tokeni ya kuingia"
**Dalili:**
- `azd up` inashindwa na makosa ya uthibitishaji
- Amri zinarejea "hauruhusiwi" au "ruksa imetolewa"

**Suluhisho:**
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

### Tatizo: "Ruhusa haitoshi" wakati wa uenezaji
**Dalili:**
- Uenezaji unashindwa kwa sababu ya makosa ya ruhusa
- Haiwezi kuunda rasilimali fulani za Azure

**Suluhisho:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Tatizo: Matatizo ya uthibitishaji wa multi-tenant
**Suluhisho:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Makosa ya Utoaji Miundombinu

### Tatizo: Migongano ya majina ya rasilimali
**Dalili:**
- Makosa "Jina la rasilimali tayari lipo"
- Uenezaji unashindwa wakati wa kuunda rasilimali

**Suluhisho:**
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

### Tatizo: Eneo/Mkoa haupatikani
**Dalili:**
- "Eneo 'xyz' halipatikani kwa aina ya rasilimali"
- SKU fulani hazipatikani katika mkoa ulioteuliwa

**Suluhisho:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Kubadilisha mabadiliko ya eneo halihamishi rasilimali zilizopo. Kundi la rasilimali zilizopo au rasilimali inaweza kukataa mabadiliko ya eneo; tumia mazingira tofauti kwa uenezaji upya wa kikanda.

### Tatizo: Makosa ya kuzidi kikomo cha rasilimali
**Dalili:**
- "Kikomo kimezidiwa kwa aina ya rasilimali"
- "Idadi kubwa ya rasilimali imefikiwa"

**Suluhisho:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

Kwa ajili ya maendeleo, chagua SKU ndogo inayoungwa mkono katika `infra/main.parameters.json`:

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

### Tatizo: Makosa ya templeti ya Bicep
**Dalili:**
- Kushindwa kuthibitisha templeti
- Makosa ya sarufi katika faili za Bicep

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

## 🚀 Kushindwa kwa Uenezaji

### Tatizo: Kushindwa kwa ujenzi
**Dalili:**
- Programu kushindwa kujengwa wakati wa uenezaji
- Makosa ya ufungaji wa kifurushi

**Suluhisho:**
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

### Tatizo: Kushindwa kwa uenezaji wa kontena
**Dalili:**
- Programu za kontena kushindwa kuanzisha
- Makosa ya kuvuta picha

**Suluhisho:**
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

### Tatizo: Kushindwa kuunganishwa kwa database
**Dalili:**
- Programu hawezi kuunganishwa na database
- Makosa ya muda wa kuunganishwa

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

### Tatizo: Mabadiliko ya mazingira hayafanyi kazi
**Dalili:**
- Programu haiwezi kusoma thamani za usanidi
- Mabadiliko ya mazingira yanaonekana kuwa tupu

**Suluhisho:**
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

### Tatizo: Matatizo ya cheti cha SSL/TLS
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

### Tatizo: Matatizo ya usanidi wa CORS
**Dalili:**
- Sehemu ya mbele haiwezi kuita API
- Ombi la mdomo wa kuanzia limezuiwa

**Suluhisho:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. Sasisha programu yako ya Express iliyopo (ikiwa `cors` imesanidiwa):

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

## 🌍 Masuala ya Usimamizi wa Mazingira

### Tatizo: Matatizo ya kubadilisha mazingira
**Dalili:**
- Mazingira yasiyo sahihi yanatumika
- Usanidi haubadiliki ipasavyo

**Suluhisho:**
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

### Tatizo: Uharibifu wa mazingira
**Dalili:**
- Mazingira yanaonyesha hali isiyo sahihi
- Rasilimali hazilingani na usanidi

**Suluhisho:**
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

## 🔍 Masuala ya Utendaji

### Tatizo: Muda mrefu wa uenezaji
**Dalili:**
- Uenezaji huchukua muda mrefu sana
- Muda wa kusubiri wa uenezaji

**Suluhisho:**
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

### Tatizo: Matatizo ya utendaji wa programu
**Dalili:**
- Muda wa majibu polepole
- Matumizi makubwa ya rasilimali

**Suluhisho:**
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

## 🛠️ Zana na Amri za Utatuzi wa Matatizo

### Amri za Ugunduzi
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

### Uchambuzi wa Kumbukumbu
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

### Uchunguzi wa Rasilimali
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Kupata Msaada Zaidi

### Wakati wa Kuongeza Kiwango cha Msaada
- Masuala ya uthibitishaji yanaendelea baada ya kujaribu suluhisho zote
- Matatizo ya miundombinu na huduma za Azure
- Masuala yanayohusiana na bili au usajili
- Masuala ya usalama au matukio

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
- Zot la `azd version`
- Zot la `azd config show`
- Zot la `azd show` (hali ya uenezaji wa sasa)
- Ujumbe wa makosa (maandishi kamili)
- Hatua za kuiga tatizo
- Maelezo ya mazingira yaliyofichwa (usishirikishe moja kwa moja `azd env get-values`, ambayo inaweza kuwa na siri)
- Ratiba ya mwanzo wa tatizo

### Hati ya Kukusanya Kumbukumbu
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

## 📊 Kuzuia Matatizo

### Orodha ya Ukaguzi Kabla ya Uenezaji
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

### Matengenezo ya Mara kwa Mara
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## Rasilimali Zinazohusiana

- [Mwongozo wa Ugunduzi](debugging.md) - Mbinu za hali ya juu za ugunduzi
- [Utoaji wa Rasilimali](../chapter-04-infrastructure/provisioning.md) - Utatuzi wa miundombinu
- [Mipango ya Uwezo](../chapter-06-pre-deployment/capacity-planning.md) - Mwongozo wa upangaji rasilimali
- [Uchaguzi wa SKU](../chapter-06-pre-deployment/sku-selection.md) - Mapendekezo ya ngazi za huduma

---

**Kidokezo**: Hifadhi mwongozo huu kwenye vionjo na urudi kwao unaporatibu matatizo. Matatizo mengi yameonekana hapo awali na yana suluhisho zilizotangazwa!

---

**Uratibu**
- **Zoezi lililopita**: [Utoaji wa Rasilimali](../chapter-04-infrastructure/provisioning.md)
- **Zoezi linalofuata**: [Mwongozo wa Ugunduzi](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->