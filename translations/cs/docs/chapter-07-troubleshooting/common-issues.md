# Běžné problémy a řešení

**Navigace kapitolou:**
- **📚 Domovská stránka kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 7 - Řešení problémů a ladění
- **⬅️ Předchozí kapitola**: [Kapitola 6: Předletové kontroly](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Další**: [Průvodce laděním](debugging.md)
- **🚀 Další kapitola**: [Kapitola 8: Produkční & podnikové vzory](../chapter-08-production/production-ai-practices.md)

## Úvod

Tento komplexní průvodce řešením problémů zahrnuje nejčastější potíže při používání Azure Developer CLI. Naučte se diagnostikovat, řešit a odstranit běžné problémy s autentizací, nasazením, provisioningem infrastruktury a konfigurací aplikací. Každý problém obsahuje podrobné příznaky, příčiny a postupy řešení krok za krokem.

## Cíle učení

Po dokončení tohoto průvodce budete:
- Ovládat diagnostické techniky pro problémy Azure Developer CLI
- Rozumět běžným problémům s autentizací a oprávněními a jejich řešením
- Řešit selhání nasazení, chyby provisioningu infrastruktury a konfigurační problémy
- Implementovat proaktivní strategie monitorování a ladění
- Používat systematické metodiky řešení složitých problémů
- Nastavit správné protokolování a monitorování pro prevenci budoucích potíží

## Výsledky učení

Po dokončení budete schopni:
- Diagnostikovat problémy Azure Developer CLI pomocí vestavěných diagnostických nástrojů
- Samostatně řešit problémy s autentizací, předplatným a oprávněními
- Efektivně řešit selhání nasazení a chyby provisioningu infrastruktury
- Ladit problémy konfigurace aplikací a specifické problémy prostředí
- Implementovat monitorování a upozornění pro proaktivní identifikaci potenciálních problémů
- Uplatnit osvědčené postupy protokolování, ladění a pracovních postupů řešení problémů

## Rychlá diagnostika

> Nahraďte příklady jmen/ID hodnotami z vašeho prostředí. Fragmenty Bash, Bicep, JavaScriptu a souborů s parametry jsou níže označeny samostatně; nejde o jeden spustitelný skript. Před sdílením diagnostiky si zkontrolujte destruktivní operace a smažte tajné údaje. `azd monitor --logs` otevře prohlížeč; nezobrazuje terminálové logy.

Než se vrhnete na konkrétní problémy, spusťte tyto příkazy pro získání diagnostických údajů:

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

## Problémy s autentizací

### Problém: "Nepodařilo se získat access token"
**Příznaky:**
- `azd up` končí chybami autentizace
- Příkazy vrací „neautorizováno“ nebo „přístup odepřen“

**Řešení:**
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

### Problém: „Nedostatečná oprávnění“ během nasazení
**Příznaky:**
- Nasazení selhává kvůli chybám oprávnění
- Nelze vytvořit některé Azure zdroje

**Řešení:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Problém: Problémy s multi-tenant autentizací
**Řešení:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Chyby při provisioningu infrastruktury

### Problém: Konflikty názvů zdrojů
**Příznaky:**
- Chyby „Jméno zdroje již existuje“
- Nasazení selhává při vytváření zdroje

**Řešení:**
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

### Problém: Poloha/region není dostupný
**Příznaky:**
- „Poloha 'xyz' není dostupná pro typ zdroje“
- Některé SKU nejsou v daném regionu dostupné

**Řešení:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Změna proměnné polohy neprovádí migraci existujících zdrojů. Existující resource group nebo zdroj může změnu polohy odmítnout; použijte samostatné prostředí pro regionální nové nasazení.

### Problém: Chyby kvóty překročeny
**Příznaky:**
- „Kvóta překročena pro typ zdroje“
- „Maximální počet zdrojů dosažen“

**Řešení:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

Pro vývoj zvolte podporovanou menší SKU v `infra/main.parameters.json`:

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

### Problém: Chyby šablony Bicep
**Příznaky:**
- Selhání validace šablony
- Syntaxní chyby v Bicep souborech

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

### Problém: Selhání sestavení
**Příznaky:**
- Aplikace během nasazení nesestaví
- Chyby při instalaci balíčků

**Řešení:**
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

### Problém: Selhání nasazení kontejneru
**Příznaky:**
- Kontejnerové aplikace se nespustí
- Chyby při stahování obrazu

**Řešení:**
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

### Problém: Selhání připojení k databázi
**Příznaky:**
- Aplikace se nemůže připojit k databázi
- Chyby timeoutu připojení

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

## 🔧 Konfigurační problémy

### Problém: Proměnné prostředí nefungují
**Příznaky:**
- Aplikace nedokáže načíst konfigurační hodnoty
- Proměnné prostředí se jeví jako prázdné

**Řešení:**
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

### Problém: Problémy s certifikáty SSL/TLS
**Příznaky:**
- HTTPS nefunguje
- Chyby ověření certifikátu

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
- Cross-origin request zablokován

**Řešení:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. Aktualizujte vaši existující Express aplikaci (s importem `cors`):

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
azd env list

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

# 3. azd env refresh reads outputs of a previous deployment; it does not
# import arbitrary existing resources or reconcile template drift.
# To adopt resources, use the template's documented existing-resource parameters.
```

## 🔍 Výkonové problémy

### Problém: Pomalé doby nasazení
**Příznaky:**
- Nasazení trvá příliš dlouho
- Timeouty během nasazení

**Řešení:**
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

### Problém: Problémy s výkonem aplikace
**Příznaky:**
- Pomalu reaguje
- Vysoká spotřeba zdrojů

**Řešení:**
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

## 🛠️ Nástroje a příkazy pro řešení problémů

### Ladící příkazy
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

### Analýza logů
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
- Problémy s infrastrukturou Azure služeb
- Problémy s fakturací nebo předplatným
- Bezpečnostní obavy nebo incidenty

### Podpůrné kanály
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

### Informace k shromáždění
Před kontaktováním podpory shromážděte:
- Výstup `azd version`
- Výstup `azd config show`
- Výstup `azd show` (aktuální stav nasazení)
- Chybové zprávy (celý text)
- Kroky vedoucí k reprodukci problému
- Očistěné údaje o prostředí (nikdy nesdílejte holý `azd env get-values`, který může obsahovat tajné informace)
- Časová osa, kdy problém začal

### Skript pro sběr logů
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

## Související zdroje

- [Průvodce laděním](debugging.md) - Pokročilé techniky ladění
- [Provisioning zdrojů](../chapter-04-infrastructure/provisioning.md) - Řešení problémů infrastruktury
- [Plánování kapacity](../chapter-06-pre-deployment/capacity-planning.md) - Pokyny pro plánování zdrojů
- [Výběr SKU](../chapter-06-pre-deployment/sku-selection.md) - Doporučení úrovně služeb

---

**Tip**: Tento průvodce si uložte do záložek a odkazujte se na něj vždy, když narazíte na problémy. Většina problémů již byla zaznamenána a mají zavedená řešení!

---

**Navigace**
- **Předchozí lekce**: [Provisioning zdrojů](../chapter-04-infrastructure/provisioning.md)
- **Další lekce**: [Průvodce laděním](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->