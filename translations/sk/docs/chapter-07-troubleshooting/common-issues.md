# Bežné problémy a riešenia

**Navigácia v kapitole:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 7 - Riešenie problémov a ladenie
- **⬅️ Predchádzajúca kapitola**: [Kapitola 6: Predletové kontroly](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Ďalšia**: [Sprievodca ladením](debugging.md)
- **🚀 Ďalšia kapitola**: [Kapitola 8: Produkčné a podnikové vzory](../chapter-08-production/production-ai-practices.md)

## Úvod

Tento komplexný sprievodca riešením problémov pokrýva najčastejšie sa vyskytujúce problémy pri používaní Azure Developer CLI. Naučte sa diagnostikovať, riešiť a odstraňovať bežné problémy s autentifikáciou, nasadzovaním, provisionovaním infraštruktúry a konfiguráciou aplikácií. Každý problém obsahuje podrobné symptómy, hlavné príčiny a postupné návody na riešenie.

## Ciele učenia

Po dokončení tohto sprievodcu budete:
- Ovplyvniť diagnostické techniky problémov Azure Developer CLI
- Pochopiť bežné problémy s autentifikáciou a oprávneniami a ich riešenia
- Riešiť zlyhania nasadenia, chyby provisionovania infraštruktúry a problémy s konfiguráciou
- Implementovať proaktívne stratégie monitorovania a ladenia
- Používať systematické metódy riešenia problémov pre zložité otázky
- Konfigurovať správne protokolovanie a monitorovanie na prevenciu budúcich problémov

## Výsledky učenia

Po dokončení budete schopní:
- Diagnostikovať problémy Azure Developer CLI pomocou vstavaných diagnostických nástrojov
- Samostatne riešiť problémy s autentifikáciou, predplatným a oprávneniami
- Efektívne riešiť zlyhania nasadenia a chyby provisionovania infraštruktúry
- Odstraňovať problémy s konfiguráciou aplikácií a so špecifickými problémami prostredia
- Implementovať monitorovanie a upozorňovanie na proaktívnu identifikáciu potenciálnych problémov
- Používať osvedčené postupy pre protokolovanie, ladenie a procesy riešenia problémov

## Rýchla diagnostika

> Nahraďte príkladové mená/ID hodnotami vášho prostredia. Fragmencesty Bash, Bicep, JavaScriptu a parametrových súborov sú označené zvlášť nižšie; nie sú to jeden vykonateľný skript. Preverte deštruktívne operácie a pred zdieľaním diagnóz redigujte tajomstvá. `azd monitor --logs` otvorí prehliadač; neiniciuje stream terminálových logov.

Predtým, než sa ponoríte do konkrétnych problémov, spustite tieto príkazy na zhromaždenie diagnostických údajov:

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

## Problémy s autentifikáciou

### Problém: "Nepodarilo sa získať prístupový token"
**Symptómy:**
- `azd up` zlyháva s chybami autentifikácie
- Príkazy vracajú "neautorizované" alebo "prístup zamietnutý"

**Riešenia:**
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

### Problém: "Nedostatočné oprávnenia" počas nasadenia
**Symptómy:**
- Nasadenie zlyháva s chybami oprávnení
- Nie je možné vytvoriť určité Azure zdroje

**Riešenia:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Problém: Problémy s viacnásobnou autentifikáciou
**Riešenia:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Chyby pri provisionovaní infraštruktúry

### Problém: Konflikty názvov zdrojov
**Symptómy:**
- Chyby "Názov zdroja už existuje"
- Nasadenie zlyháva počas vytvárania zdrojov

**Riešenia:**
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

### Problém: Miesto/región nie je dostupný
**Symptómy:**
- "Miesto 'xyz' nie je dostupné pre typ zdroja"
- Niektoré SKU nie sú dostupné v zvolenom regióne

**Riešenia:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Zmena premennej lokality nepresunie existujúce zdroje. Existujúca skupina zdrojov alebo zdroj môže odmietnuť zmenu lokality; použite samostatné prostredie pre regionálne opätovné nasadenie.

### Problém: Prekročenie kvóty
**Symptómy:**
- "Prekročená kvóta pre typ zdroja"
- "Dosiahnutý maximálny počet zdrojov"

**Riešenia:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

Pre vývoj vyberte podporované menšie SKU v `infra/main.parameters.json`:

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

### Problém: Chyby v Bicep šablóne
**Symptómy:**
- Neúspešné overovanie šablóny
- Chyby syntaxe v Bicep súboroch

**Riešenia:**
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

## 🚀 Zlyhania nasadenia

### Problém: Zlyhania zostavenia
**Symptómy:**
- Aplikácia sa nepodarí zostaviť počas nasadenia
- Chyby inštalácie balíkov

**Riešenia:**
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

### Problém: Zlyhania nasadenia kontajnerov
**Symptómy:**
- Kontajnerové aplikácie sa nespustia
- Chyby pri sťahovaní image

**Riešenia:**
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

### Problém: Zlyhania pripojenia k databáze
**Symptómy:**
- Aplikácia sa nemôže pripojiť k databáze
- Chyby časového limitu pripojenia

**Riešenia:**
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

## 🔧 Problémy s konfiguráciou

### Problém: Premenné prostredia nefungujú
**Symptómy:**
- Aplikácia nedokáže čítať hodnoty konfigurácie
- Premenné prostredia sa javia ako prázdne

**Riešenia:**
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

### Problém: Problémy so SSL/TLS certifikátom
**Symptómy:**
- HTTPS nefunguje
- Chyby overovania certifikátu

**Riešenia:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problém: Problémy s konfiguráciou CORS
**Symptómy:**
- Frontend nedokáže volať API
- Medziorígionálna požiadavka zablokovaná

**Riešenia:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. Aktualizujte existujúcu Express aplikáciu (s importovaným `cors`):

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

## 🌍 Problémy so správou prostredia

### Problém: Problémy s prepínaním prostredia
**Symptómy:**
- Používa sa nesprávne prostredie
- Konfigurácia sa nesprávne prepína

**Riešenia:**
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

### Problém: Korupcia prostredia
**Symptómy:**
- Prostredie zobrazuje neplatný stav
- Zdroje nezodpovedajú konfigurácii

**Riešenia:**
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

## 🔍 Problémy s výkonom

### Problém: Pomalé časy nasadenia
**Symptómy:**
- Nasadenia trvajú príliš dlho
- Časové limity počas nasadenia

**Riešenia:**
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

### Problém: Výkonové problémy aplikácie
**Symptómy:**
- Pomalé reakčné časy
- Vysoké využitie zdrojov

**Riešenia:**
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

## 🛠️ Nástroje a príkazy na riešenie problémov

### Príkazy na ladenie
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

### Analýza logov
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

### Šetrenie zdrojov
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Získanie ďalšej pomoci

### Kedy eskalovať
- Problémy s autentifikáciou pretrvávajú po vyskúšaní všetkých riešení
- Problémy s infraštruktúrou Azure služieb
- Problémy s fakturáciou alebo predplatným
- Bezpečnostné obavy alebo incidenty

### Podporné kanály
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

### Informácie na zhromaždenie
Pred kontaktovaním podpory zhromaždite:
- Výstup `azd version`
- Výstup `azd config show`
- Výstup `azd show` (aktuálny stav nasadenia)
- Chybové hlásenia (plný text)
- Kroky na reprodukovanie problému
- Redigované detaily prostredia (nikdy nezdieľajte surový `azd env get-values`, ktorý môže obsahovať tajomstvá)
- Časová os začiatku problému

### Skript na zber logov
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

## 📊 Prevencia problémov

### Kontrolný zoznam pred nasadením
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

### Nastavenie monitorovania
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

### Pravidelná údržba
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## Súvisiace zdroje

- [Sprievodca ladením](debugging.md) - Pokročilé techniky ladenia
- [Provisioning zdrojov](../chapter-04-infrastructure/provisioning.md) - Riešenie problémov infraštruktúry
- [Plánovanie kapacity](../chapter-06-pre-deployment/capacity-planning.md) - Pokyny pre plánovanie zdrojov
- [Výber SKU](../chapter-06-pre-deployment/sku-selection.md) - Odporúčania pre úrovne služieb

---

**Tip**: Majte tento sprievodca označený ako záložku a obráťte sa naň vždy, keď narazíte na problémy. Väčšina problémov už bola viditeľná a má overené riešenia!

---

**Navigácia**
- **Predchádzajúca lekcia**: [Provisioning Resources](../chapter-04-infrastructure/provisioning.md)
- **Ďalšia lekcia**: [Sprievodca ladením](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->