<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e3b1c94a2da4a497e880ebe7b89c2bb1",
  "translation_date": "2025-09-18T13:03:30+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "sl"
}
-->
# Pogoste težave in rešitve

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 7 - Odpravljanje težav in razhroščevanje
- **⬅️ Prejšnje poglavje**: [Poglavje 6: Predhodni pregledi](../pre-deployment/preflight-checks.md)
- **➡️ Naslednje**: [Vodnik za razhroščevanje](debugging.md)
- **🚀 Naslednje poglavje**: [Poglavje 8: Vzorce za produkcijo in podjetja](../ai-foundry/production-ai-practices.md)

## Uvod

Ta obsežen vodnik za odpravljanje težav zajema najpogostejše težave, s katerimi se srečujete pri uporabi Azure Developer CLI. Naučite se diagnosticirati, odpravljati in reševati pogoste težave, povezane z avtentikacijo, uvajanjem, zagotavljanjem infrastrukture in konfiguracijo aplikacij. Vsaka težava vključuje podrobne simptome, osnovne vzroke in postopke za rešitev korak za korakom.

## Cilji učenja

Z dokončanjem tega vodnika boste:
- Obvladali diagnostične tehnike za težave z Azure Developer CLI
- Razumeli pogoste težave z avtentikacijo in dovoljenji ter njihove rešitve
- Odpravili napake pri uvajanju, težave pri zagotavljanju infrastrukture in konfiguracijske težave
- Uvedli proaktivne strategije za spremljanje in razhroščevanje
- Uporabili sistematične metodologije za odpravljanje kompleksnih težav
- Konfigurirali ustrezno beleženje in spremljanje za preprečevanje prihodnjih težav

## Rezultati učenja

Po zaključku boste sposobni:
- Diagnosticirati težave z Azure Developer CLI z uporabo vgrajenih diagnostičnih orodij
- Samostojno reševati težave, povezane z avtentikacijo, naročninami in dovoljenji
- Učinkovito odpravljati napake pri uvajanju in težave pri zagotavljanju infrastrukture
- Razhroščevati težave s konfiguracijo aplikacij in težave, specifične za okolje
- Uvesti spremljanje in opozarjanje za proaktivno prepoznavanje morebitnih težav
- Uporabiti najboljše prakse za beleženje, razhroščevanje in delovne tokove za reševanje težav

## Hitri diagnostični postopki

Preden se lotite specifičnih težav, za zbiranje diagnostičnih informacij zaženite naslednje ukaze:

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

## Težave z avtentikacijo

### Težava: "Ni uspelo pridobiti dostopnega žetona"
**Simptomi:**
- `azd up` ne uspe z napakami pri avtentikaciji
- Ukazi vračajo "neavtorizirano" ali "dostop zavrnjen"

**Rešitve:**
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

### Težava: "Nezadostna dovoljenja" med uvajanjem
**Simptomi:**
- Uvajanje ne uspe zaradi napak pri dovoljenjih
- Ni mogoče ustvariti določenih Azure virov

**Rešitve:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Težava: Težave z avtentikacijo v večnajemniškem okolju
**Rešitve:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Napake pri zagotavljanju infrastrukture

### Težava: Konflikti imen virov
**Simptomi:**
- Napake "Ime vira že obstaja"
- Uvajanje ne uspe med ustvarjanjem virov

**Rešitve:**
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

### Težava: Lokacija/regija ni na voljo
**Simptomi:**
- "Lokacija 'xyz' ni na voljo za vrsto vira"
- Določeni SKU-ji niso na voljo v izbrani regiji

**Rešitve:**
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

### Težava: Napake zaradi preseženih kvot
**Simptomi:**
- "Presežena kvota za vrsto vira"
- "Doseženo največje število virov"

**Rešitve:**
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

### Težava: Napake v Bicep predlogah
**Simptomi:**
- Napake pri preverjanju veljavnosti predloge
- Sintaktične napake v Bicep datotekah

**Rešitve:**
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

## 🚀 Napake pri uvajanju

### Težava: Napake pri gradnji
**Simptomi:**
- Aplikacija ne uspe zgraditi med uvajanjem
- Napake pri nameščanju paketov

**Rešitve:**
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

### Težava: Napake pri uvajanju kontejnerjev
**Simptomi:**
- Kontejnerske aplikacije se ne zaženejo
- Napake pri pridobivanju slik

**Rešitve:**
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

### Težava: Napake pri povezavi z bazo podatkov
**Simptomi:**
- Aplikacija se ne more povezati z bazo podatkov
- Napake pri časovnem izteku povezave

**Rešitve:**
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

## 🔧 Težave s konfiguracijo

### Težava: Spremenljivke okolja ne delujejo
**Simptomi:**
- Aplikacija ne more prebrati konfiguracijskih vrednosti
- Spremenljivke okolja so prazne

**Rešitve:**
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

### Težava: Težave s SSL/TLS certifikati
**Simptomi:**
- HTTPS ne deluje
- Napake pri preverjanju veljavnosti certifikata

**Rešitve:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Težava: Težave s konfiguracijo CORS
**Simptomi:**
- Sprednji del ne more klicati API-ja
- Blokirana zahteva zaradi navzkrižnega izvora

**Rešitve:**
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

## 🌍 Težave pri upravljanju okolja

### Težava: Težave pri preklapljanju okolij
**Simptomi:**
- Uporablja se napačno okolje
- Konfiguracija se ne preklaplja pravilno

**Rešitve:**
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

### Težava: Poškodba okolja
**Simptomi:**
- Okolje prikazuje neveljavno stanje
- Viri se ne ujemajo s konfiguracijo

**Rešitve:**
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

## 🔍 Težave z zmogljivostjo

### Težava: Počasni časi uvajanja
**Simptomi:**
- Uvajanja trajajo predolgo
- Časovne omejitve med uvajanjem

**Rešitve:**
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

### Težava: Težave z zmogljivostjo aplikacije
**Simptomi:**
- Počasni odzivni časi
- Visoka poraba virov

**Rešitve:**
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

## 🛠️ Orodja in ukazi za odpravljanje težav

### Ukazi za razhroščevanje
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

### Analiza dnevnikov
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Preiskava virov
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Dodatna pomoč

### Kdaj eskalirati
- Težave z avtentikacijo vztrajajo kljub vsem rešitvam
- Težave z infrastrukturo pri Azure storitvah
- Težave, povezane z obračunavanjem ali naročninami
- Varnostni pomisleki ali incidenti

### Kanali za podporo
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

### Informacije, ki jih je treba zbrati
Preden kontaktirate podporo, zberite:
- Izhod `azd version`
- Izhod `azd info`
- Sporočila o napakah (celotno besedilo)
- Korake za reprodukcijo težave
- Podrobnosti o okolju (`azd env show`)
- Časovnico, kdaj se je težava začela

### Skripta za zbiranje dnevnikov
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

## 📊 Preprečevanje težav

### Kontrolni seznam pred uvajanjem
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

### Nastavitev spremljanja
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

### Redno vzdrževanje
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## Povezani viri

- [Vodnik za razhroščevanje](debugging.md) - Napredne tehnike razhroščevanja
- [Zagotavljanje virov](../deployment/provisioning.md) - Odpravljanje težav z infrastrukturo
- [Načrtovanje zmogljivosti](../pre-deployment/capacity-planning.md) - Smernice za načrtovanje virov
- [Izbira SKU](../pre-deployment/sku-selection.md) - Priporočila za izbiro storitvenih nivojev

---

**Nasvet**: Shranite ta vodnik med zaznamke in se nanj obrnite, kadar naletite na težave. Večina težav je že bila opažena in ima preverjene rešitve!

---

**Navigacija**
- **Prejšnja lekcija**: [Zagotavljanje virov](../deployment/provisioning.md)
- **Naslednja lekcija**: [Vodnik za razhroščevanje](debugging.md)

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne prevzemamo odgovornosti za morebitna nesporazumevanja ali napačne razlage, ki bi nastale zaradi uporabe tega prevoda.