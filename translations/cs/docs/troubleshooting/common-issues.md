<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9788ca3a01099b5a07db01554f915e27",
  "translation_date": "2025-09-10T06:26:44+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "cs"
}
-->
# Běžné problémy a jejich řešení

## Úvod

Tento komplexní průvodce řešením problémů pokrývá nejčastější potíže při používání Azure Developer CLI. Naučte se diagnostikovat, řešit a odstraňovat běžné problémy s autentizací, nasazením, zajišťováním infrastruktury a konfigurací aplikací. Každý problém obsahuje podrobné příznaky, příčiny a postupy krok za krokem pro jeho vyřešení.

## Cíle učení

Po dokončení tohoto průvodce budete:
- Ovládat diagnostické techniky pro problémy s Azure Developer CLI
- Rozumět běžným problémům s autentizací a oprávněními a jejich řešením
- Řešit chyby při nasazení, problémy se zajišťováním infrastruktury a konfigurací
- Implementovat proaktivní strategie monitorování a ladění
- Aplikovat systematické metodiky řešení složitých problémů
- Nastavit správné logování a monitorování, aby se předešlo budoucím problémům

## Výsledky učení

Po dokončení budete schopni:
- Diagnostikovat problémy s Azure Developer CLI pomocí vestavěných diagnostických nástrojů
- Samostatně řešit problémy s autentizací, předplatným a oprávněními
- Efektivně odstraňovat chyby při nasazení a problémy se zajišťováním infrastruktury
- Ladit problémy s konfigurací aplikací a problémy specifické pro prostředí
- Implementovat monitorování a upozornění pro proaktivní identifikaci potenciálních problémů
- Aplikovat osvědčené postupy pro logování, ladění a pracovní postupy při řešení problémů

## Rychlá diagnostika

Než se pustíte do konkrétních problémů, spusťte tyto příkazy pro shromáždění diagnostických informací:

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

## Problémy s autentizací

### Problém: "Nepodařilo se získat přístupový token"
**Příznaky:**
- `azd up` selhává s chybami autentizace
- Příkazy vracejí "neautorizováno" nebo "přístup odepřen"

**Řešení:**
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

### Problém: "Nedostatečná oprávnění" během nasazení
**Příznaky:**
- Nasazení selhává s chybami oprávnění
- Nelze vytvořit určité Azure zdroje

**Řešení:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Problém: Problémy s autentizací v multi-tenant prostředí
**Řešení:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Chyby při zajišťování infrastruktury

### Problém: Konflikty názvů zdrojů
**Příznaky:**
- Chyby "Název zdroje již existuje"
- Nasazení selhává během vytváření zdrojů

**Řešení:**
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

### Problém: Nedostupnost lokace/regionu
**Příznaky:**
- "Lokace 'xyz' není dostupná pro daný typ zdroje"
- Určité SKU nejsou dostupné ve vybraném regionu

**Řešení:**
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

### Problém: Překročení kvóty
**Příznaky:**
- "Překročena kvóta pro daný typ zdroje"
- "Byl dosažen maximální počet zdrojů"

**Řešení:**
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

### Problém: Chyby v šablonách Bicep
**Příznaky:**
- Selhání validace šablon
- Syntaktické chyby v souborech Bicep

**Řešení:**
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

## 🚀 Selhání nasazení

### Problém: Chyby při sestavování
**Příznaky:**
- Aplikaci se nepodaří sestavit během nasazení
- Chyby při instalaci balíčků

**Řešení:**
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

### Problém: Selhání nasazení kontejnerů
**Příznaky:**
- Kontejnerové aplikace se nespustí
- Chyby při stahování image

**Řešení:**
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

### Problém: Chyby připojení k databázi
**Příznaky:**
- Aplikace se nemůže připojit k databázi
- Chyby časového limitu připojení

**Řešení:**
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

## 🔧 Problémy s konfigurací

### Problém: Nefunkční proměnné prostředí
**Příznaky:**
- Aplikace nemůže číst konfigurační hodnoty
- Proměnné prostředí se zdají prázdné

**Řešení:**
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

### Problém: Problémy s SSL/TLS certifikáty
**Příznaky:**
- HTTPS nefunguje
- Chyby při validaci certifikátů

**Řešení:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problém: Problémy s konfigurací CORS
**Příznaky:**
- Frontend nemůže volat API
- Blokování požadavků mezi doménami

**Řešení:**
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

## 🌍 Problémy s řízením prostředí

### Problém: Problémy s přepínáním prostředí
**Příznaky:**
- Používá se nesprávné prostředí
- Konfigurace se nepřepíná správně

**Řešení:**
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

### Problém: Poškození prostředí
**Příznaky:**
- Prostředí vykazuje neplatný stav
- Zdroje neodpovídají konfiguraci

**Řešení:**
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

## 🔍 Problémy s výkonem

### Problém: Pomalé časy nasazení
**Příznaky:**
- Nasazení trvá příliš dlouho
- Časové limity během nasazení

**Řešení:**
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

### Problém: Problémy s výkonem aplikace
**Příznaky:**
- Pomalé odezvy
- Vysoké využití zdrojů

**Řešení:**
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

## 🛠️ Nástroje a příkazy pro řešení problémů

### Ladicí příkazy
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

### Analýza logů
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Vyšetřování zdrojů
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Získání další pomoci

### Kdy eskalovat
- Problémy s autentizací přetrvávají i po vyzkoušení všech řešení
- Problémy s infrastrukturou u služeb Azure
- Problémy s fakturací nebo předplatným
- Bezpečnostní obavy nebo incidenty

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

### Informace ke shromáždění
Před kontaktováním podpory shromážděte:
- Výstup `azd version`
- Výstup `azd info`
- Chybové zprávy (plný text)
- Kroky k reprodukci problému
- Detaily prostředí (`azd env show`)
- Časovou osu, kdy problém začal

### Skript pro sběr logů
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

## 📊 Prevence problémů

### Kontrolní seznam před nasazením
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

### Nastavení monitorování
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

## Související zdroje

- [Průvodce laděním](debugging.md) - Pokročilé techniky ladění
- [Zajišťování zdrojů](../deployment/provisioning.md) - Řešení problémů s infrastrukturou
- [Plánování kapacity](../pre-deployment/capacity-planning.md) - Pokyny pro plánování zdrojů
- [Výběr SKU](../pre-deployment/sku-selection.md) - Doporučení pro výběr úrovní služeb

---

**Tip**: Uložte si tento průvodce do záložek a odkazujte na něj, kdykoli narazíte na problémy. Většina problémů již byla zaznamenána a má zavedená řešení!

---

**Navigace**
- **Předchozí lekce**: [Zajišťování zdrojů](../deployment/provisioning.md)
- **Další lekce**: [Průvodce laděním](debugging.md)

---

**Prohlášení**:  
Tento dokument byl přeložen pomocí služby pro automatický překlad [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoli se snažíme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.