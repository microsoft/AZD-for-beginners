<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9788ca3a01099b5a07db01554f915e27",
  "translation_date": "2025-09-10T06:29:02+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "hr"
}
-->
# Uobičajeni Problemi i Rješenja

## Uvod

Ovaj sveobuhvatni vodič za rješavanje problema pokriva najčešće probleme s kojima se susreću korisnici Azure Developer CLI-a. Naučite kako dijagnosticirati, riješiti i otkloniti uobičajene poteškoće vezane uz autentifikaciju, implementaciju, postavljanje infrastrukture i konfiguraciju aplikacija. Svaki problem uključuje detaljne simptome, uzroke i korake za rješavanje.

## Ciljevi učenja

Kroz ovaj vodič ćete:
- Ovladati tehnikama dijagnosticiranja problema s Azure Developer CLI-jem
- Razumjeti uobičajene probleme s autentifikacijom i dozvolama te njihova rješenja
- Riješiti neuspjehe implementacije, pogreške u postavljanju infrastrukture i probleme s konfiguracijom
- Primijeniti proaktivne strategije za praćenje i otklanjanje problema
- Koristiti sustavne metodologije za rješavanje složenih problema
- Postaviti pravilno logiranje i praćenje kako biste spriječili buduće probleme

## Ishodi učenja

Nakon završetka vodiča, moći ćete:
- Dijagnosticirati probleme s Azure Developer CLI-jem koristeći ugrađene alate za dijagnostiku
- Samostalno riješiti probleme vezane uz autentifikaciju, pretplate i dozvole
- Učinkovito otkloniti neuspjehe implementacije i pogreške u postavljanju infrastrukture
- Rješavati probleme s konfiguracijom aplikacija i specifične probleme vezane uz okruženje
- Postaviti praćenje i upozorenja kako biste proaktivno identificirali potencijalne probleme
- Primijeniti najbolje prakse za logiranje, otklanjanje grešaka i radne procese za rješavanje problema

## Brza Dijagnostika

Prije nego što se posvetite specifičnim problemima, pokrenite ove naredbe za prikupljanje dijagnostičkih informacija:

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

## Problemi s Autentifikacijom

### Problem: "Nije moguće dobiti pristupni token"
**Simptomi:**
- `azd up` ne uspijeva s greškama autentifikacije
- Naredbe vraćaju "neovlašteno" ili "pristup odbijen"

**Rješenja:**
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

### Problem: "Nedovoljne privilegije" tijekom implementacije
**Simptomi:**
- Implementacija ne uspijeva zbog grešaka s dozvolama
- Nije moguće kreirati određene Azure resurse

**Rješenja:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Problem: Problemi s autentifikacijom u više tenanata
**Rješenja:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Pogreške u Postavljanju Infrastrukture

### Problem: Sukobi u nazivima resursa
**Simptomi:**
- Greške "Naziv resursa već postoji"
- Implementacija ne uspijeva tijekom kreiranja resursa

**Rješenja:**
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

### Problem: Lokacija/Regija nije dostupna
**Simptomi:**
- "Lokacija 'xyz' nije dostupna za vrstu resursa"
- Određeni SKUs nisu dostupni u odabranoj regiji

**Rješenja:**
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

### Problem: Prekoračenje kvote
**Simptomi:**
- "Prekoračena kvota za vrstu resursa"
- "Dosegnut maksimalni broj resursa"

**Rješenja:**
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

### Problem: Pogreške u Bicep predlošcima
**Simptomi:**
- Neuspjeh validacije predloška
- Sintaktičke greške u Bicep datotekama

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

## 🚀 Neuspjesi Implementacije

### Problem: Neuspjesi u izgradnji
**Simptomi:**
- Aplikacija ne uspijeva izgraditi tijekom implementacije
- Greške pri instalaciji paketa

**Rješenja:**
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

### Problem: Neuspjesi implementacije kontejnera
**Simptomi:**
- Kontejnerske aplikacije ne uspijevaju pokrenuti
- Greške pri povlačenju slike

**Rješenja:**
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

### Problem: Problemi s povezivanjem baze podataka
**Simptomi:**
- Aplikacija se ne može povezati s bazom podataka
- Greške vremenskog isteka veze

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

## 🔧 Problemi s Konfiguracijom

### Problem: Okolinske varijable ne rade
**Simptomi:**
- Aplikacija ne može čitati vrijednosti konfiguracije
- Okolinske varijable se prikazuju kao prazne

**Rješenja:**
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

### Problem: Problemi s SSL/TLS certifikatima
**Simptomi:**
- HTTPS ne radi
- Greške validacije certifikata

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
- Blokirani zahtjevi između različitih izvora

**Rješenja:**
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

## 🌍 Problemi s Upravljanjem Okruženjem

### Problem: Problemi s prebacivanjem okruženja
**Simptomi:**
- Koristi se pogrešno okruženje
- Konfiguracija se ne prebacuje ispravno

**Rješenja:**
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

### Problem: Korupcija okruženja
**Simptomi:**
- Okruženje prikazuje nevažeće stanje
- Resursi ne odgovaraju konfiguraciji

**Rješenja:**
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

## 🔍 Problemi s Performansama

### Problem: Sporo vrijeme implementacije
**Simptomi:**
- Implementacije traju predugo
- Vremenska ograničenja tijekom implementacije

**Rješenja:**
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

### Problem: Problemi s performansama aplikacije
**Simptomi:**
- Sporo vrijeme odziva
- Visoka potrošnja resursa

**Rješenja:**
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

## 🛠️ Alati i Naredbe za Rješavanje Problema

### Naredbe za otklanjanje grešaka
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

### Analiza logova
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

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

## 🆘 Dobivanje Dodatne Pomoći

### Kada eskalirati
- Problemi s autentifikacijom traju nakon svih pokušaja rješavanja
- Problemi s infrastrukturom vezani uz Azure usluge
- Problemi s naplatom ili pretplatama
- Sigurnosni problemi ili incidenti

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

### Informacije koje treba prikupiti
Prije kontaktiranja podrške, prikupite:
- Izlaz `azd version`
- Izlaz `azd info`
- Poruke o greškama (cijeli tekst)
- Korake za reprodukciju problema
- Detalje o okruženju (`azd env show`)
- Vremenski okvir kada je problem započeo

### Skripta za prikupljanje logova
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

## 📊 Prevencija Problema

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

### Postavljanje praćenja
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

### Redovito održavanje
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## Povezani Resursi

- [Vodič za otklanjanje grešaka](debugging.md) - Napredne tehnike otklanjanja grešaka
- [Postavljanje resursa](../deployment/provisioning.md) - Rješavanje problema s infrastrukturom
- [Planiranje kapaciteta](../pre-deployment/capacity-planning.md) - Smjernice za planiranje resursa
- [Odabir SKU-a](../pre-deployment/sku-selection.md) - Preporuke za razine usluga

---

**Savjet**: Ovaj vodič držite pri ruci i koristite ga kad god naiđete na probleme. Većina problema već je poznata i ima utvrđena rješenja!

---

**Navigacija**
- **Prethodna lekcija**: [Postavljanje resursa](../deployment/provisioning.md)
- **Sljedeća lekcija**: [Vodič za otklanjanje grešaka](debugging.md)

---

**Odricanje od odgovornosti**:  
Ovaj dokument je preveden korištenjem AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati mjerodavnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane stručnjaka. Ne preuzimamo odgovornost za bilo kakva nesporazuma ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.