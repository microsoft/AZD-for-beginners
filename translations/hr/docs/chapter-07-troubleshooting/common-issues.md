# Česti problemi i rješenja

**Navigacija poglavljima:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 7 - Otklanjanje pogrešaka i ispravljanje
- **⬅️ Prethodno poglavlje**: [Poglavlje 6: Provjere prije leta](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Sljedeće**: [Vodič za otklanjanje pogrešaka](debugging.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 8: Produkcijski i Enterprise obrasci](../chapter-08-production/production-ai-practices.md)

## Uvod

Ovaj sveobuhvatni vodič za otklanjanje problema pokriva najčešće susretane poteškoće pri korištenju Azure Developer CLI. Naučite dijagnosticirati, otklanjati i rješavati uobičajene probleme s autentifikacijom, implementacijom, pružanjem infrastrukture i konfiguracijom aplikacija. Svaki problem sadrži detaljne simptome, uzroke i postupke korak-po-korak za rješavanje.

## Ciljevi učenja

Nakon završetka ovog vodiča, moći ćete:
- Ovladati tehnikama dijagnostike problema Azure Developer CLI-ja
- Razumjeti česte probleme s autentifikacijom i dozvolama te njihova rješenja
- Riješiti neuspjehe implementacije, greške u pružanju infrastrukture i probleme s konfiguracijom
- Primijeniti proaktivne strategije praćenja i ispravljanja pogrešaka
- Koristiti sustavno otklanjanje problema za složene zadatke
- Konfigurirati ispravno logiranje i praćenje da biste spriječili buduće probleme

## Ishodi učenja

Po završetku bit ćete u stanju:
- Dijagnosticirati probleme Azure Developer CLI-ja korištenjem ugrađenih alata za dijagnostiku
- Samostalno riješiti probleme vezane uz autentifikaciju, pretplate i dozvole
- Učinkovito otklanjati probleme neuspjele implementacije i pogreške u pružanju infrastrukture
- Otklanjati probleme konfiguracije aplikacija i specifične probleme okoline
- Implementirati praćenje i upozorenja za pravovremenu identifikaciju potencijalnih problema
- Primijeniti najbolje prakse za logiranje, otklanjanje pogrešaka i radne tokove rješavanja problema

## Brza dijagnostika

> Zamijenite primjer naziva/ID-a vrijednostima iz vašeg okruženja. Fragmenti za Bash, Bicep, JavaScript i datoteke parametara su zasebni isječci, nisu jedan izvršni skript. Pregledajte destruktivne operacije i uklonite tajne prije dijeljenja dijagnostike. `azd monitor --logs` otvara preglednik; ne emitira zapisnike terminala.

Prije nego što započnete s pojedinačnim problemima, pokrenite ove naredbe radi prikupljanja dijagnostičkih podataka:

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

## Problemi s autentifikacijom

### Problem: "Neuspjelo dohvaćanje pristupnog tokena"
**Simptomi:**
- `azd up` ne uspijeva s greškama autentifikacije
- Naredbe vraćaju "neovlašteno" ili "pristup odbijen"

**Rješenja:**
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

### Problem: "Nedovoljne privilegije" tijekom implementacije
**Simptomi:**
- Implementacija ne uspijeva s greškama dozvola
- Ne mogu se stvarati određeni Azure resursi

**Rješenja:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Problem: Problemi s višeteretnom autentifikacijom
**Rješenja:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Pogreške u pružanju infrastrukture

### Problem: Sukobi naziva resursa
**Simptomi:**
- Greške "Naziv resursa već postoji"
- Implementacija se prekida tijekom stvaranja resursa

**Rješenja:**
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

### Problem: Lokacija/regija nije dostupna
**Simptomi:**
- "Lokacija 'xyz' nije dostupna za tip resursa"
- Odabrani SKU-ovi nisu dostupni u odabranoj regiji

**Rješenja:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Promjena varijable lokacije ne premješta postojeće resurse. Postojeća skupina resursa ili resurs može odbiti promjenu lokacije; koristite zasebno okruženje za regionalnu ponovnu implementaciju.

### Problem: Greške zbog prekoračenja kvota
**Simptomi:**
- "Prekoračenje kvote za tip resursa"
- "Dosegnut maksimalan broj resursa"

**Rješenja:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

Za razvoj odaberite podržani manji SKU u `infra/main.parameters.json`:

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

### Problem: Pogreške u Bicep predlošcima
**Simptomi:**
- Neuspjeh validacije predloška
- Sintaksne pogreške u Bicep datotekama

**Rješenja:**
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

## 🚀 Neuspjesi implementacije

### Problem: Neuspjesi izgradnje
**Simptomi:**
- Aplikacija ne uspijeva izgraditi se tijekom implementacije
- Greške prilikom instalacije paketa

**Rješenja:**
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

### Problem: Neuspjesi implementacije kontejnera
**Simptomi:**
- Kontejnerske aplikacije ne uspijevaju pokrenuti se
- Greške prilikom preuzimanja slike

**Rješenja:**
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

### Problem: Neuspjeh spajanja na bazu podataka
**Simptomi:**
- Aplikacija se ne može spojiti na bazu podataka
- Greške vremenskog ograničenja veze

**Rješenja:**
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

## 🔧 Problemi s konfiguracijom

### Problem: Varijable okoline ne rade
**Simptomi:**
- Aplikacija ne može pročitati konfiguracijske vrijednosti
- Varijable okoline izgledaju prazno

**Rješenja:**
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

### Problem: Problemi s SSL/TLS certifikatima
**Simptomi:**
- HTTPS ne radi
- Greške pri validaciji certifikata

**Rješenja:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problem: Problemi s CORS konfiguracijom
**Simptomi:**
- Frontend ne može pozvati API
- Zahtjev s druge domene blokiran

**Rješenja:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. Ažurirajte postojeću Express aplikaciju (s uključenim `cors`):

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

## 🌍 Problemi upravljanja okolinom

### Problem: Problemi sa prebacivanjem okoline
**Simptomi:**
- Koristi se pogrešna okolina
- Konfiguracija se ne prebacuje ispravno

**Rješenja:**
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

### Problem: Kvar okoline
**Simptomi:**
- Okolina pokazuje neispravno stanje
- Resursi se ne podudaraju s konfiguracijom

**Rješenja:**
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

## 🔍 Problemi s performansama

### Problem: Sporo vrijeme implementacije
**Simptomi:**
- Implementacije traju predugo
- Vremenska ograničenja tijekom implementacije

**Rješenja:**
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

### Problem: Problemi s performansama aplikacije
**Simptomi:**
- Sporo vrijeme odziva
- Visoka iskorištenost resursa

**Rješenja:**
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

## 🛠️ Alati i naredbe za otklanjanje problema

### Naredbe za ispravljanje pogrešaka
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

### Analiza zapisnika
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

### Istraživanje resursa
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Dobivanje dodatne pomoći

### Kada eskalirati
- Problemi s autentifikacijom traju i nakon svih rješenja
- Problemi s infrastrukturom Azure usluga
- Problemi vezani uz naplatu ili pretplate
- Sigurnosne zabrinutosti ili incidenti

### Kanali podrške
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

### Informacije za prikupiti
Prije kontaktiranja podrške prikupite:
- Izlaz `azd version`
- Izlaz `azd config show`
- Izlaz `azd show` (trenutni status implementacije)
- Poruke o greškama (potpuni tekst)
- Korake za reprodukciju problema
- Detalje o okolini s uklonjenim osjetljivim informacijama (nikada nemojte dijeliti sirovi `azd env get-values` koji može sadržavati tajne)
- Vremenski okvir početka problema

### Skripta za prikupljanje zapisnika
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

## 📊 Sprječavanje problema

### Kontrolni popis prije implementacije
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

### Postavljanje nadzora
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

### Redovno održavanje
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## Povezani izvori

- [Vodič za otklanjanje pogrešaka](debugging.md) - Napredne tehnike otklanjanja pogrešaka
- [Pružanje resursa](../chapter-04-infrastructure/provisioning.md) - Otklanjanje problema u infrastrukturi
- [Planiranje kapaciteta](../chapter-06-pre-deployment/capacity-planning.md) - Smjernice za planiranje resursa
- [Odabir SKU](../chapter-06-pre-deployment/sku-selection.md) - Preporuke za sloj usluge

---

**Savjet**: Ovaj vodič spremite među favorite i koristite ga kad god naiđete na probleme. Većina problema je već viđena i ima utvrđena rješenja!

---

**Navigacija**
- **Prethodna lekcija**: [Pružanje resursa](../chapter-04-infrastructure/provisioning.md)
- **Sljedeća lekcija**: [Vodič za otklanjanje pogrešaka](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->