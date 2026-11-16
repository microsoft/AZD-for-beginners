# Pogoste težave in rešitve

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 7 - Odpravljanje težav in razhroščevanje
- **⬅️ Prejšnje poglavje**: [Poglavje 6: Predhodni pregledi](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Naslednje**: [Vodnik za razhroščevanje](debugging.md)
- **🚀 Naslednje poglavje**: [Poglavje 8: Produkcijski in poslovni vzorci](../chapter-08-production/production-ai-practices.md)

## Uvod

Ta obsežen vodnik za odpravljanje težav pokriva najpogosteje pojavljajoče se težave pri uporabi Azure Developer CLI. Naučite se diagnosticirati, odpraviti in rešiti pogoste težave z overjanjem, nameščanjem, zagotavljanjem infrastrukture in konfiguracijo aplikacij. Vsaka težava vključuje podrobne simptome, korenske vzroke in postopke reševanja korak za korakom.

## Cilji učenja

Z dokončanjem tega vodnika boste:
- Obvladali diagnostične tehnike za težave Azure Developer CLI
- Razumeli pogoste težave z overjanjem in dovoljenji ter njihove rešitve
- Rešili neuspehe nameščanja, napake pri zagotavljanju infrastrukture in težave s konfiguracijo
- Uvedli proaktivne strategije spremljanja in razhroščevanja
- Uporabili sistematične metode odpravljanja težav za kompleksne probleme
- Konfigurirali ustrezno beleženje in spremljanje za preprečevanje prihodnjih težav

## Rezultati učenja

Po končanem boste lahko:
- Diagnostikovali težave Azure Developer CLI z vgrajenimi diagnostičnimi orodji
- Samostojno reševali težave z overjanjem, naročnino in dovoljenji
- Učinkovito odpravljali neuspehe nameščanja in napake pri zagotavljanju infrastrukture
- Ralhroščavali težave s konfiguracijo aplikacij in problemi, specifičnimi za okolje
- Uvedli spremljanje in opozarjanje za proaktivno prepoznavanje morebitnih težav
- Uporabili najboljše prakse za beleženje, razhroščevanje in delovne postopke reševanja težav

## Hitra diagnostika

> Zamenjajte primerna imena/ID-je z vrednostmi vašega okolja. Izrezki za Bash, Bicep, JavaScript in datoteke parametrov so ločeno označeni spodaj; niso enoten izvršljivi skript. Preglejte destruktivne operacije in pred deljenjem skrijte skrivnosti. `azd monitor --logs` odpre brskalnik; ne pretaka terminalskih dnevnikov.

Preden se lotite specifičnih težav, za zbiranje diagnostičnih podatkov zaženite naslednje ukaze:

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

## Težave z overjanjem

### Težava: "Neuspešno pridobivanje dostopnega žetona"
**Simptomi:**
- `azd up` vrne napake pri overjanju
- Ukazi vrnejo "nepooblaščeno" ali "dostop zavrnjen"

**Rešitve:**
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

### Težava: "Nezadostne privilegije" med nameščanjem
**Simptomi:**
- Nameščanje ne uspe zaradi napak s dovoljenji
- Ne more ustvariti določenih Azure virov

**Rešitve:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Težava: Težave z večnajemniškim overjanjem
**Rešitve:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Napake pri zagotavljanju infrastrukture

### Težava: Konflikti imen virov
**Simptomi:**
- Napake "Ime vira že obstaja"
- Nameščanje ne uspe med ustvarjanjem vira

**Rešitve:**
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

### Težava: Lokacija/regija ni na voljo
**Simptomi:**
- "Lokacija 'xyz' ni na voljo za tip vira"
- Nekateri SKU-ji niso na voljo v izbrani regiji

**Rešitve:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Sprememba spremenljivke lokacije ne migrira obstoječih virov. Obstoječa skupina virov ali vir lahko zavrne spremembo lokacije; uporabite ločeno okolje za regionalno ponovno nameščanje.

### Težava: Napake zaradi prekoračitve kvote
**Simptomi:**
- "Prekoračena kvota za tip vira"
- "Doseženo največje število virov"

**Rešitve:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

Za razvoj izberite podporni manjši SKU v `infra/main.parameters.json`:

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

### Težava: Napake predloge Bicep
**Simptomi:**
- Neuspehi preverjanja predloge
- Sintaktične napake v datotekah Bicep

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

## 🚀 Neuspehi nameščanja

### Težava: Neuspehi gradnje
**Simptomi:**
- Aplikacija med nameščanjem ne uspe zgraditi
- Napake pri nameščanju paketov

**Rešitve:**
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

### Težava: Neuspehi nameščanja kontejnerjev
**Simptomi:**
- Kontejnerske aplikacije se ne zaženejo
- Napake pri prenosu slike

**Rešitve:**
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

### Težava: Neuspehi povezave z bazo podatkov
**Simptomi:**
- Aplikacija se ne more povezati z bazo podatkov
- Napake časovne omejitve povezave

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

### Težava: Okoljske spremenljivke ne delujejo
**Simptomi:**
- Aplikacija ne bere vrednosti konfiguracije
- Okoljske spremenljivke so videti prazne

**Rešitve:**
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

### Težava: Težave s SSL/TLS certifikati
**Simptomi:**
- HTTPS ne deluje
- Napake pri preverjanju certifikata

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
- Frontend ne more poklicati API-ja
- Blokirane zahteve iz druge domene

**Rešitve:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. Posodobite vašo obstoječo Express aplikacijo (z uvoženim `cors`):

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

## 🌍 Težave z upravljanjem okolja

### Težava: Težave s preklapljanjem okolij
**Simptomi:**
- Uporablja se napačno okolje
- Konfiguracija se ne preklopi pravilno

**Rešitve:**
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

### Težava: Poškodba okolja
**Simptomi:**
- Okolje kaže neveljavno stanje
- Viri ne ustrezajo konfiguraciji

**Rešitve:**
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

## 🔍 Težave z zmogljivostjo

### Težava: Počasni časi nameščanja
**Simptomi:**
- Nameščanja trajajo predolgo
- Časovne omejitve med nameščanjem

**Rešitve:**
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

### Težava: Težave z zmogljivostjo aplikacije
**Simptomi:**
- Počasni odzivni časi
- Visoka poraba virov

**Rešitve:**
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

## 🛠️ Orodja in ukazi za odpravljanje težav

### Ukazi za razhroščevanje
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

### Analiza dnevnikov
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

### Preiskava virov
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Pridobivanje dodatne pomoči

### Kdaj eskalirati
- Težave z overjanjem vztrajajo po poizkusih vseh rešitev
- Težave z infrastrukturo pri Azure storitvah
- Težave povezane z obračunavanjem ali naročnino
- Varnostne skrbi ali incidenti

### Podporni kanali
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

### Podatki za zbiranje
Pred kontaktiranjem podpore zberite:
- Izhod `azd version`
- Izhod `azd config show`
- Izhod `azd show` (trenutni status nameščanja)
- Sporočila o napakah (celoten tekst)
- Koraki za reproduciranje težave
- Priznani podatki o okolju (nikoli ne delite surovih `azd env get-values`, ki lahko vsebujejo skrivnosti)
- Časovni potek, kdaj se je težava začela

### Skripta za zbiranje dnevnikov
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

## 📊 Preprečevanje težav

### Kontrolni seznam pred nameščanjem
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

### Redno vzdrževanje
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## Povezani viri

- [Vodnik za razhroščevanje](debugging.md) - Napredne tehnike razhroščevanja
- [Zagotavljanje virov](../chapter-04-infrastructure/provisioning.md) - Odpravljanje težav z infrastrukturo
- [Načrtovanje kapacitet](../chapter-06-pre-deployment/capacity-planning.md) - Napotki za načrtovanje virov
- [Izbira SKU](../chapter-06-pre-deployment/sku-selection.md) - Priporočila za raven storitev

---

**Namig**: Ta vodnik hranite med zaznamki in se nanj sklicujte vsakič, ko naletite na težave. Večina problemov je že bila opažena in imajo vzpostavljene rešitve!

---

**Navigacija**
- **Prejšnja lekcija**: [Zagotavljanje virov](../chapter-04-infrastructure/provisioning.md)
- **Naslednja lekcija**: [Vodnik za razhroščevanje](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->