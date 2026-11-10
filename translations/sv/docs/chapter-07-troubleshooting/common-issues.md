# Vanliga problem och lösningar

**Kapitelnavigering:**
- **📚 Kursstart**: [AZD För nybörjare](../../README.md)
- **📖 Nuvarande kapitel**: Kapitel 7 - Felsökning och Debugging
- **⬅️ Föregående kapitel**: [Kapitel 6: Förkontroller](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Nästa**: [Debuggingguide](debugging.md)
- **🚀 Nästa kapitel**: [Kapitel 8: Produktion och företagsmönster](../chapter-08-production/production-ai-practices.md)

## Introduktion

Denna omfattande felsökningsguide täcker de mest frekvent förekommande problemen vid användning av Azure Developer CLI. Lär dig diagnostisera, felsöka och lösa vanliga problem med autentisering, distribution, infrastrukturförsörjning och applikationskonfiguration. Varje problem inkluderar detaljerade symtom, grundorsaker och steg-för-steg lösningsprocedurer.

## Inlärningsmål

Genom att slutföra denna guide kommer du att:
- Bemästra diagnosmetoder för Azure Developer CLI-problem
- Förstå vanliga problem med autentisering och behörigheter samt deras lösningar
- Lösa distributionsfel, provisioningfel för infrastruktur och konfigurationsproblem
- Implementera proaktiva övervaknings- och felsökningsstrategier
- Använda systematiska felsökningmetodiker för komplexa problem
- Konfigurera korrekt loggning och övervakning för att förhindra framtida problem

## Inlärningsresultat

Efter avslutad guide kommer du att kunna:
- Diagnostisera Azure Developer CLI-problem med inbyggda diagnostikverktyg
- Självständigt lösa autentiserings-, prenumerations- och behörighetsrelaterade problem
- Effektivt felsöka distributionsfel och provisioningproblem för infrastruktur
- Debugga applikationskonfigurationsproblem och miljöspecifika problem
- Implementera övervakning och larm för att proaktivt identifiera potentiella problem
- Använda bästa praxis för loggning, debugging och problemhanteringsarbetsflöden

## Snabbdiagnostik

> Byt ut exempel på namn/ID:n med dina miljövärden. Bash-, Bicep-, JavaScript- och parameterfilfragment är märkta separat nedan; de är inte ett exekverbart skript. Granska destruktiva operationer och radera hemligheter innan diagnostik delas. `azd monitor --logs` öppnar en webbläsare; den strömmar inte terminalloggar.

Innan du dyker in i specifika problem, kör dessa kommandon för att samla diagnostikinformation:

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

## Autentiseringsproblem

### Problem: "Misslyckades att hämta åtkomsttoken"
**Symtom:**
- `azd up` misslyckas med autentiseringsfel
- Kommandon returnerar "ej auktoriserad" eller "åtkomst nekad"

**Lösningar:**
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

### Problem: "Otillräckliga privilegier" under distribution
**Symtom:**
- Distributionen misslyckas med behörighetsfel
- Kan inte skapa vissa Azure-resurser

**Lösningar:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Problem: Multi-tenant autentiseringsproblem
**Lösningar:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Infrastrukturförsörjningsfel

### Problem: Resursnamnskonflikter
**Symtom:**
- Felmeddelanden "Resursnamnet finns redan"
- Distribution misslyckas under resursuppbyggnad

**Lösningar:**
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

### Problem: Plats/Region ej tillgänglig
**Symtom:**
- "Platsen 'xyz' är inte tillgänglig för resurstyp"
- Vissa SKU:er är inte tillgängliga i vald region

**Lösningar:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Att ändra platsvariabeln migrerar inte befintliga resurser. En befintlig resursgrupp eller resurs kan avvisa en platsändring; använd en separat miljö för regional omdistribuering.

### Problem: Kvot överskriden-fel
**Symtom:**
- "Kvot överskriden för resurstyp"
- "Maximalt antal resurser nått"

**Lösningar:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

För utveckling, välj en stödjad mindre SKU i `infra/main.parameters.json`:

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

### Problem: Bicep-mallfel
**Symtom:**
- Mallvalideringsfel
- Syntaxfel i Bicep-filer

**Lösningar:**
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

## 🚀 Distributionsfel

### Problem: Byggfel
**Symtom:**
- Applikationen misslyckas att bygga under distribution
- Paketinstallationsfel

**Lösningar:**
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

### Problem: Containerdistributionsfel
**Symtom:**
- Containerappar startar inte
- Fel vid hämtning av bild

**Lösningar:**
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

### Problem: Databasanslutningsfel
**Symtom:**
- Applikationen kan inte ansluta till databasen
- Timeout-fel vid anslutning

**Lösningar:**
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

## 🔧 Konfigurationsproblem

### Problem: Miljövariabler fungerar inte
**Symtom:**
- Appen kan inte läsa konfigurationsvärden
- Miljövariabler verkar vara tomma

**Lösningar:**
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

### Problem: SSL/TLS-certifikatproblem
**Symtom:**
- HTTPS fungerar inte
- Certifikatvalideringsfel

**Lösningar:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problem: CORS-konfigurationsproblem
**Symtom:**
- Frontend kan inte anropa API
- Cross-origin begäran blockerad

**Lösningar:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. Uppdatera din befintliga Express-applikation (med `cors` importerad):

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

## 🌍 Miljöhanteringsproblem

### Problem: Problem med att växla miljö
**Symtom:**
- Fel miljö används
- Konfiguration växlar inte korrekt

**Lösningar:**
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

### Problem: Miljökorruption
**Symtom:**
- Miljön visar ogiltigt tillstånd
- Resurser stämmer inte överens med konfiguration

**Lösningar:**
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

## 🔍 Prestandaproblem

### Problem: Långsamma distributionstider
**Symtom:**
- Distributioner tar för lång tid
- Timeout vid distribution

**Lösningar:**
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

### Problem: Applikationsprestandaproblem
**Symtom:**
- Långsamma svarstider
- Hög resursanvändning

**Lösningar:**
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

## 🛠️ Felsökningsverktyg och kommandon

### Debug-kommandon
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

### Logganalys
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

### Resursundersökning
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Få ytterligare hjälp

### När man ska eskalera
- Autentiseringsproblem kvarstår efter att ha försökt alla lösningar
- Infrastrukturproblem med Azure-tjänster
- Fakturering eller prenumerationsrelaterade problem
- Säkerhetsbekymmer eller incidenter

### Supportkanaler
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

### Information att samla in
Innan du kontaktar support, samla in:
- `azd version` utdata
- `azd config show` utdata
- `azd show` utdata (nuvarande distributionsstatus)
- Felmeddelanden (fullständig text)
- Steg för att återskapa problemet
- Raderade miljödokument (dela aldrig rå `azd env get-values`, som kan innehålla hemligheter)
- Tidslinje för när problemet startade

### Loggsamlingsskript
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

## 📊 Förebyggande av problem

### Checklista före distribution
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

### Övervakningsinställning
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

### Regelbundet underhåll
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## Relaterade resurser

- [Debuggingguide](debugging.md) - Avancerade debuggingtekniker
- [Provisioning av resurser](../chapter-04-infrastructure/provisioning.md) - Felsökning av infrastruktur
- [Kapacitetsplanering](../chapter-06-pre-deployment/capacity-planning.md) - Vägledning för resursplanering
- [Val av SKU](../chapter-06-pre-deployment/sku-selection.md) - Rekommendationer för servicelager

---

**Tips**: Bokmärk denna guide och referera till den när du stöter på problem. De flesta problem har setts tidigare och har etablerade lösningar!

---

**Navigering**
- **Föregående lektion**: [Provisioning av resurser](../chapter-04-infrastructure/provisioning.md)
- **Nästa lektion**: [Debuggingguide](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->