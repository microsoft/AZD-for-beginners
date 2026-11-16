# Dažnos problemos ir sprendimai

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD Pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 7 skyrius - Problemų sprendimas ir derinimas
- **⬅️ Ankstesnis skyrius**: [6 skyrius: Priešskrydžio patikros](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Kitas**: [Derinimo vadovas](debugging.md)
- **🚀 Kitas skyrius**: [8 skyrius: Gamybiniai ir įmonių modeliai](../chapter-08-production/production-ai-practices.md)

## Įvadas

Šis išsamus problemų sprendimo vadovas apima dažniausiai pasitaikančias problemas, naudojant Azure Developer CLI. Išmokite diagnozuoti, spręsti ir pašalinti įprastas autentifikavimo, diegimo, infrastruktūros diegimo ir programų konfigūravimo problemas. Kiekviena problema apima detalius simptomus, pagrindines priežastis ir žingsnis po žingsnio sprendimo procedūras.

## Mokymosi tikslai

Užbaigus šį vadovą, jūs:
- Įvaldysite diagnostikos metodus Azure Developer CLI problemoms
- Suprasite dažniausias autentifikavimo ir leidimų problemas bei jų sprendimus
- Spręsite diegimo nesėkmes, infrastruktūros diegimo klaidas ir konfigūracijos problemas
- Įgyvendinsite proaktyvias stebėjimo ir derinimo strategijas
- Taikysite sistemingus problemų sprendimo metodus sudėtingoms problemoms
- Konfigūruosite tinkamą registravimą ir stebėseną, kad išvengtumėte ateities problemų

## Mokymosi rezultatai

Užbaigus mokymus, galėsite:
- Diagnozuoti Azure Developer CLI problemas naudodami įmontuotus diagnostikos įrankius
- Savarankiškai spręsti autentifikavimo, prenumeratos ir leidimų problemas
- Efektyviai spręsti diegimo klaidas ir infrastruktūros diegimo problemas
- Derinti programų konfigūracijos problemas ir aplinkos specifines problemas
- Įdiegti stebėjimą ir įspėjimus, kad proaktyviai nustatytumėte galimas problemas
- Taikyti geriausias praktikas registravimo, derinimo ir problemų sprendimo procesuose

## Greita diagnostika

> Pakeiskite pavyzdinius pavadinimus/ID į jūsų aplinkos reikšmes. Bash, Bicep, JavaScript ir parametrų failų fragmentai žymimi atskirai žemiau; tai nėra vienas vykdomas scenarijus. Peržiūrėkite destruktyvias operacijas ir ištrinkite slaptus duomenis prieš dalinantis diagnostika. `azd monitor --logs` atidaro naršyklę; jis nesiunčia terminalo žurnalų srautu.

Prieš pradėdami nagrinėti konkrečias problemas, paleiskite šias komandas, kad surinktumėte diagnostinę informaciją:

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

## Autentifikavimo problemos

### Problema: "Nepavyko gauti prieigos ženklo"
**Skaidrumai:**
- `azd up` nepavyksta dėl autentifikavimo klaidų
- Komandos grąžina "neautorizuota" arba "prieiga uždrausta"

**Sprendimai:**
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

### Problema: "Nepakanka teisių" diegimo metu
**Skaidrumai:**
- Diegimas nepavyksta dėl leidimų klaidų
- Negalite sukurti tam tikrų Azure išteklių

**Sprendimai:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Problema: Daugiau nuomininkų autentifikavimo problemos
**Sprendimai:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Infrastruktūros diegimo klaidos

### Problema: Išteklių pavadinimų konfliktai
**Skaidrumai:**
- "Išteklių pavadinimas jau egzistuoja" klaidos
- Diegimas nepavyksta kuriant išteklius

**Sprendimai:**
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

### Problema: Vieta/regionas nėra pasiekiamas
**Skaidrumai:**
- "Vieta 'xyz' negalima tokiam išteklių tipui"
- Kai kurie SKU neprieinami pasirinktoje srityje

**Sprendimai:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Vietos kintamojo keitimas nepersikelia esamų išteklių. Esama išteklių grupė ar išteklius gali atmesti vietos pakeitimą; naudokite atskirą aplinką regioninei perskirstymui.

### Problema: Kvotos viršijimo klaidos
**Skaidrumai:**
- "Viršyta kvota išteklių tipui"
- "Pasiektas maksimalus išteklių kiekis"

**Sprendimai:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

Kūrimo metu pasirinkite palaikomą mažesnį SKU su `infra/main.parameters.json`:

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

### Problema: Bicep šablono klaidos
**Skaidrumai:**
- Šablono tikrinimo nesėkmės
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

## 🚀 Diegimo nesėkmės

### Problema: Kūrimo klaidos
**Skaidrumai:**
- Programa nesukuriama diegimo metu
- Paketų diegimo klaidos

**Sprendimai:**
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

### Problema: Konteinerių diegimo nesėkmės
**Skaidrumai:**
- Konteinerių programos nepavyksta paleisti
- Klaidos traukiant atvaizdą

**Sprendimai:**
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

### Problema: Duomenų bazės prisijungimo problemos
**Skaidrumai:**
- Programa negali prisijungti prie duomenų bazės
- Prisijungimo laiko viršijimo klaidos

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
**Skaidrumai:**
- Programa negali nuskaityti konfigūracijos reikšmių
- Aplinkos kintamieji atrodo tušti

**Sprendimai:**
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

### Problema: SSL/TLS sertifikato problemos
**Skaidrumai:**
- HTTPS neveikia
- Sertifikato patikros klaidos

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
**Skaidrumai:**
- Frontendas negali paskambinti į API
- Kryžminės kilmės užklausa užblokuota

**Sprendimai:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. Atnaujinkite savo esamą Express programą (su importuotu `cors`):

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

## 🌍 Aplinkos valdymo problemos

### Problema: Problemos perjungiant aplinkas
**Skaidrumai:**
- Naudojama neteisinga aplinka
- Konfigūracija keičiasi neteisingai

**Sprendimai:**
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

### Problema: Aplinkos sugadinimas
**Skaidrumai:**
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

# 3. azd env refresh reads outputs of a previous deployment; it does not
# import arbitrary existing resources or reconcile template drift.
# To adopt resources, use the template's documented existing-resource parameters.
```

## 🔍 Veikimo problemos

### Problema: Lėtas diegimo laikas
**Skaidrumai:**
- Diegimai užtrunka per ilgai
- Laiko viršijimo klaidos diegimo metu

**Sprendimai:**
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

### Problema: Programos našumo problemos
**Skaidrumai:**
- Lėtai atsako
- Didelis išteklių naudojimas

**Sprendimai:**
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

## 🛠️ Problemų sprendimo įrankiai ir komandos

### Derinimo komandos
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

### Žurnalų analizė
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

### Išteklių tyrimas
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Kur gauti papildomos pagalbos

### Kada eskaluoti
- Autentifikavimo problemos išlieka po visų sprendimų bandymų
- Infrastruktūros problemos su Azure paslaugomis
- Atsiskaitomybės ar prenumeratos problemos
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
Prieš kreipiantis dėl pagalbos, surinkite:
- `azd version` išvestį
- `azd config show` išvestį
- `azd show` išvestį (dabartinė diegimo būklė)
- Klaidų pranešimus (pilnas tekstas)
- Veiksmai, kaip atkurti problemą
- Ištrinta aplinkos informacija (niekada nesidalykite žaliu `azd env get-values`, kuris gali turėti slaptų duomenų)
- Laiko juosta, kada problema prasidėjo

### Žurnalų rinkimo scenarijus
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

## 📊 Problemų prevencija

### Priešdiegimo kontrolinis sąrašas
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

### Stebėjimo nustatymai
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

### Reguliari priežiūra
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## Susiję ištekliai

- [Derinimo vadovas](debugging.md) - Pažangios derinimo technikos
- [Infrastruktūros diegimas](../chapter-04-infrastructure/provisioning.md) - Infrastruktūros problemų sprendimas
- [Talpos planavimas](../chapter-06-pre-deployment/capacity-planning.md) - Išteklių planavimo gaires
- [SKU pasirinkimas](../chapter-06-pre-deployment/sku-selection.md) - Paslaugų lygio rekomendacijos

---

**Patarimas**: Laikykite šį vadovą pažymėtą ir kreipkitės į jį kaskart, kai susiduriate su problemomis. Dauguma problemų jau buvo matytos anksčiau ir turi nustatytus sprendimus!

---

**Navigacija**
- **Ankstesnė pamoka**: [Infrastruktūros diegimas](../chapter-04-infrastructure/provisioning.md)
- **Kita pamoka**: [Derinimo vadovas](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->