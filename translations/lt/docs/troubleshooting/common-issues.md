<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e3b1c94a2da4a497e880ebe7b89c2bb1",
  "translation_date": "2025-09-18T14:08:43+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "lt"
}
-->
# Dažniausios problemos ir sprendimai

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 7 skyrius - Trikčių šalinimas ir derinimas
- **⬅️ Ankstesnis skyrius**: [6 skyrius: Priešskrydžio patikrinimai](../pre-deployment/preflight-checks.md)
- **➡️ Toliau**: [Derinimo vadovas](debugging.md)
- **🚀 Kitas skyrius**: [8 skyrius: Produkcija ir įmonių modeliai](../ai-foundry/production-ai-practices.md)

## Įvadas

Šis išsamus trikčių šalinimo vadovas apima dažniausiai pasitaikančias problemas, susijusias su Azure Developer CLI naudojimu. Sužinokite, kaip diagnozuoti, šalinti ir spręsti problemas, susijusias su autentifikacija, diegimu, infrastruktūros kūrimu ir programų konfigūracija. Kiekviena problema apima išsamius simptomus, pagrindines priežastis ir žingsnis po žingsnio sprendimo procedūras.

## Mokymosi tikslai

Baigę šį vadovą, jūs:
- Įvaldysite diagnostikos metodus, skirtus Azure Developer CLI problemoms spręsti
- Suprasite dažniausias autentifikacijos ir leidimų problemas bei jų sprendimus
- Išmoksite spręsti diegimo klaidas, infrastruktūros kūrimo klaidas ir konfigūracijos problemas
- Įgyvendinsite proaktyvias stebėjimo ir derinimo strategijas
- Taikysite sistemingus trikčių šalinimo metodus sudėtingoms problemoms spręsti
- Konfigūruosite tinkamą registravimą ir stebėjimą, kad išvengtumėte būsimų problemų

## Mokymosi rezultatai

Baigę, galėsite:
- Diagnozuoti Azure Developer CLI problemas naudojant integruotus diagnostikos įrankius
- Savarankiškai spręsti autentifikacijos, prenumeratos ir leidimų problemas
- Efektyviai šalinti diegimo klaidas ir infrastruktūros kūrimo problemas
- Derinti programų konfigūracijos problemas ir aplinkos specifines problemas
- Įgyvendinti stebėjimą ir įspėjimus, kad proaktyviai nustatytumėte galimas problemas
- Taikyti geriausią praktiką registravimo, derinimo ir problemų sprendimo darbo eigoms

## Greita diagnostika

Prieš gilindamiesi į konkrečias problemas, paleiskite šias komandas, kad surinktumėte diagnostinę informaciją:

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

## Autentifikacijos problemos

### Problema: „Nepavyko gauti prieigos žetono“
**Simptomai:**
- `azd up` nepavyksta dėl autentifikacijos klaidų
- Komandos grąžina „neautorizuota“ arba „prieiga uždrausta“

**Sprendimai:**
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

### Problema: „Nepakankamos privilegijos“ diegimo metu
**Simptomai:**
- Diegimas nepavyksta dėl leidimų klaidų
- Nepavyksta sukurti tam tikrų Azure išteklių

**Sprendimai:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Problema: Autentifikacijos problemos kelių nuomininkų aplinkoje
**Sprendimai:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Infrastruktūros kūrimo klaidos

### Problema: Išteklių pavadinimų konfliktai
**Simptomai:**
- Klaidos „Išteklių pavadinimas jau egzistuoja“
- Diegimas nepavyksta kuriant išteklius

**Sprendimai:**
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

### Problema: Vietovė/regionas nepasiekiamas
**Simptomai:**
- Klaida „Vietovė 'xyz' nepasiekiama šio tipo ištekliams“
- Tam tikri SKU nepasiekiami pasirinktoje vietovėje

**Sprendimai:**
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

### Problema: Viršytos kvotos klaidos
**Simptomai:**
- Klaida „Viršyta kvota šio tipo ištekliams“
- „Pasiektas maksimalus išteklių skaičius“

**Sprendimai:**
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

### Problema: Bicep šablonų klaidos
**Simptomai:**
- Šablono validacijos klaidos
- Sintaksės klaidos Bicep failuose

**Sprendimai:**
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

## 🚀 Diegimo klaidos

### Problema: Kūrimo klaidos
**Simptomai:**
- Programa nepavyksta sukurti diegimo metu
- Paketų diegimo klaidos

**Sprendimai:**
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

### Problema: Konteinerių diegimo klaidos
**Simptomai:**
- Konteinerių programos nepavyksta paleisti
- Klaidos traukiant vaizdus

**Sprendimai:**
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

### Problema: Duomenų bazės prisijungimo klaidos
**Simptomai:**
- Programa negali prisijungti prie duomenų bazės
- Prisijungimo laiko limitas viršytas

**Sprendimai:**
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

## 🔧 Konfigūracijos problemos

### Problema: Aplinkos kintamieji neveikia
**Simptomai:**
- Programa negali nuskaityti konfigūracijos reikšmių
- Aplinkos kintamieji atrodo tušti

**Sprendimai:**
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

### Problema: SSL/TLS sertifikato problemos
**Simptomai:**
- HTTPS neveikia
- Sertifikato validacijos klaidos

**Sprendimai:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problema: CORS konfigūracijos problemos
**Simptomai:**
- Frontend negali pasiekti API
- Užblokuoti kryžminio domeno užklausos

**Sprendimai:**
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

## 🌍 Aplinkos valdymo problemos

### Problema: Aplinkos perjungimo problemos
**Simptomai:**
- Naudojama neteisinga aplinka
- Konfigūracija netinkamai persijungia

**Sprendimai:**
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

### Problema: Aplinkos sugadinimas
**Simptomai:**
- Aplinka rodo neteisingą būseną
- Ištekliai neatitinka konfigūracijos

**Sprendimai:**
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

## 🔍 Našumo problemos

### Problema: Lėtas diegimo laikas
**Simptomai:**
- Diegimas užtrunka per ilgai
- Diegimo metu viršijami laiko limitai

**Sprendimai:**
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

### Problema: Programos našumo problemos
**Simptomai:**
- Lėtas atsako laikas
- Didelis išteklių naudojimas

**Sprendimai:**
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

## 🛠️ Trikčių šalinimo įrankiai ir komandos

### Derinimo komandos
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

### Žurnalų analizė
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Išteklių tyrimas
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Papildomos pagalbos gavimas

### Kada eskaluoti
- Autentifikacijos problemos išlieka po visų sprendimų išbandymo
- Infrastruktūros problemos su Azure paslaugomis
- Sąskaitų ar prenumeratos susijusios problemos
- Saugumo klausimai ar incidentai

### Pagalbos kanalai
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

### Informacija, kurią reikia surinkti
Prieš kreipdamiesi į pagalbą, surinkite:
- `azd version` išvestį
- `azd info` išvestį
- Klaidos pranešimus (pilną tekstą)
- Žingsnius, kaip atkurti problemą
- Aplinkos detales (`azd env show`)
- Laiko juostą, kada problema prasidėjo

### Žurnalų surinkimo scenarijus
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

## 📊 Problemų prevencija

### Prieš diegimą kontrolinis sąrašas
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

### Stebėjimo nustatymas
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

### Reguliari priežiūra
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## Susiję ištekliai

- [Derinimo vadovas](debugging.md) - Išplėstiniai derinimo metodai
- [Išteklių kūrimas](../deployment/provisioning.md) - Infrastruktūros trikčių šalinimas
- [Talpos planavimas](../pre-deployment/capacity-planning.md) - Išteklių planavimo gairės
- [SKU pasirinkimas](../pre-deployment/sku-selection.md) - Paslaugų lygio rekomendacijos

---

**Patarimas**: Išsaugokite šį vadovą ir naudokitės juo, kai susiduriate su problemomis. Dauguma problemų jau buvo pastebėtos anksčiau ir turi nustatytus sprendimus!

---

**Navigacija**
- **Ankstesnė pamoka**: [Išteklių kūrimas](../deployment/provisioning.md)
- **Kita pamoka**: [Derinimo vadovas](debugging.md)

---

**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama naudoti profesionalų žmogaus vertimą. Mes neprisiimame atsakomybės už nesusipratimus ar klaidingus interpretavimus, atsiradusius dėl šio vertimo naudojimo.