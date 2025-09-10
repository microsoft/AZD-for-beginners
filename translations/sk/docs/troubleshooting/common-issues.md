<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9788ca3a01099b5a07db01554f915e27",
  "translation_date": "2025-09-10T06:27:09+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "sk"
}
-->
# Bežné problémy a riešenia

## Úvod

Tento komplexný sprievodca riešením problémov pokrýva najčastejšie problémy pri používaní Azure Developer CLI. Naučte sa diagnostikovať, riešiť a odstraňovať bežné problémy s autentifikáciou, nasadzovaním, poskytovaním infraštruktúry a konfiguráciou aplikácií. Každý problém obsahuje podrobné príznaky, hlavné príčiny a postupy krok za krokom na jeho vyriešenie.

## Ciele učenia

Po dokončení tohto sprievodcu budete:
- Ovládať diagnostické techniky pre problémy s Azure Developer CLI
- Rozumieť bežným problémom s autentifikáciou a oprávneniami a ich riešeniam
- Riešiť zlyhania nasadzovania, chyby pri poskytovaní infraštruktúry a problémy s konfiguráciou
- Implementovať proaktívne stratégie monitorovania a ladenia
- Používať systematické metodológie riešenia problémov pri zložitých situáciách
- Nastaviť správne logovanie a monitorovanie na prevenciu budúcich problémov

## Výsledky učenia

Po dokončení budete schopní:
- Diagnostikovať problémy s Azure Developer CLI pomocou vstavaných diagnostických nástrojov
- Samostatne riešiť problémy s autentifikáciou, predplatným a oprávneniami
- Efektívne riešiť zlyhania nasadzovania a chyby pri poskytovaní infraštruktúry
- Ladenie problémov s konfiguráciou aplikácií a problémov špecifických pre prostredie
- Implementovať monitorovanie a upozornenia na proaktívne identifikovanie potenciálnych problémov
- Používať osvedčené postupy pre logovanie, ladenie a pracovné postupy riešenia problémov

## Rýchla diagnostika

Predtým, než sa pustíte do konkrétnych problémov, spustite tieto príkazy na zhromaždenie diagnostických informácií:

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

## Problémy s autentifikáciou

### Problém: "Nepodarilo sa získať prístupový token"
**Príznaky:**
- `azd up` zlyháva s chybami autentifikácie
- Príkazy vracajú "neautorizované" alebo "prístup zamietnutý"

**Riešenia:**
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

### Problém: "Nedostatočné oprávnenia" počas nasadzovania
**Príznaky:**
- Nasadzovanie zlyháva s chybami oprávnení
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

### Problém: Problémy s autentifikáciou v multi-tenant prostredí
**Riešenia:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Chyby pri poskytovaní infraštruktúry

### Problém: Konflikty názvov zdrojov
**Príznaky:**
- Chyby "Názov zdroja už existuje"
- Nasadzovanie zlyháva počas vytvárania zdrojov

**Riešenia:**
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

### Problém: Nedostupná lokalita/oblasť
**Príznaky:**
- "Lokalita 'xyz' nie je dostupná pre daný typ zdroja"
- Niektoré SKUs nie sú dostupné vo vybranej oblasti

**Riešenia:**
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

### Problém: Prekročené kvóty
**Príznaky:**
- "Kvóta prekročená pre daný typ zdroja"
- "Dosiahnutý maximálny počet zdrojov"

**Riešenia:**
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

### Problém: Chyby v Bicep šablónach
**Príznaky:**
- Zlyhanie validácie šablón
- Syntaktické chyby v Bicep súboroch

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

## 🚀 Zlyhania nasadzovania

### Problém: Zlyhania zostavenia
**Príznaky:**
- Aplikácia zlyháva pri zostavovaní počas nasadzovania
- Chyby pri inštalácii balíkov

**Riešenia:**
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

### Problém: Zlyhania nasadzovania kontajnerov
**Príznaky:**
- Kontajnerové aplikácie sa nespustia
- Chyby pri sťahovaní obrazu

**Riešenia:**
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

### Problém: Chyby pripojenia k databáze
**Príznaky:**
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

### Problém: Nefunkčné environmentálne premenné
**Príznaky:**
- Aplikácia nemôže čítať konfiguračné hodnoty
- Environmentálne premenné sa zobrazujú ako prázdne

**Riešenia:**
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

### Problém: Problémy s SSL/TLS certifikátmi
**Príznaky:**
- HTTPS nefunguje
- Chyby validácie certifikátov

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
**Príznaky:**
- Frontend nemôže volať API
- Blokované požiadavky z iného pôvodu

**Riešenia:**
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

## 🌍 Problémy s manažmentom prostredia

### Problém: Problémy s prepínaním prostredí
**Príznaky:**
- Používa sa nesprávne prostredie
- Konfigurácia sa správne neprepína

**Riešenia:**
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

### Problém: Poškodenie prostredia
**Príznaky:**
- Prostredie vykazuje neplatný stav
- Zdroje nezodpovedajú konfigurácii

**Riešenia:**
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

## 🔍 Problémy s výkonom

### Problém: Pomalé časy nasadzovania
**Príznaky:**
- Nasadzovanie trvá príliš dlho
- Časové limity počas nasadzovania

**Riešenia:**
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

### Problém: Problémy s výkonom aplikácie
**Príznaky:**
- Pomalé časy odozvy
- Vysoké využitie zdrojov

**Riešenia:**
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

## 🛠️ Nástroje a príkazy na riešenie problémov

### Debugovacie príkazy
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

### Analýza logov
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Vyšetrenie zdrojov
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
- Problémy súvisiace s fakturáciou alebo predplatným
- Bezpečnostné obavy alebo incidenty

### Kanály podpory
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
- Výstup `azd info`
- Chybové hlásenia (celý text)
- Kroky na reprodukciu problému
- Detaily prostredia (`azd env show`)
- Časovú os, kedy problém začal

### Skript na zhromaždenie logov
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

### Pravidelná údržba
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## Súvisiace zdroje

- [Sprievodca ladením](debugging.md) - Pokročilé techniky ladenia
- [Poskytovanie zdrojov](../deployment/provisioning.md) - Riešenie problémov s infraštruktúrou
- [Plánovanie kapacity](../pre-deployment/capacity-planning.md) - Usmernenia pre plánovanie zdrojov
- [Výber SKU](../pre-deployment/sku-selection.md) - Odporúčania pre úrovne služieb

---

**Tip**: Uložte si tento sprievodca do záložiek a odkazujte naň vždy, keď narazíte na problémy. Väčšina problémov už bola zaznamenaná a má stanovené riešenia!

---

**Navigácia**
- **Predchádzajúca lekcia**: [Poskytovanie zdrojov](../deployment/provisioning.md)
- **Nasledujúca lekcia**: [Sprievodca ladením](debugging.md)

---

**Upozornenie**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nenesieme zodpovednosť za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.