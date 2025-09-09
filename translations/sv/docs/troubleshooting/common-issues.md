<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9788ca3a01099b5a07db01554f915e27",
  "translation_date": "2025-09-09T21:46:02+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "sv"
}
-->
# Vanliga problem och lösningar

## Introduktion

Denna omfattande felsökningsguide täcker de vanligaste problemen som uppstår vid användning av Azure Developer CLI. Lär dig att diagnostisera, felsöka och lösa vanliga problem med autentisering, distribution, infrastrukturprovisionering och applikationskonfiguration. Varje problem inkluderar detaljerade symtom, rotorsaker och steg-för-steg-lösningar.

## Lärandemål

Genom att slutföra denna guide kommer du att:
- Bemästra diagnostiska tekniker för problem med Azure Developer CLI
- Förstå vanliga autentiserings- och behörighetsproblem samt deras lösningar
- Lösa distributionsfel, infrastrukturprovisioneringsproblem och konfigurationsproblem
- Implementera proaktiv övervakning och felsökningsstrategier
- Använda systematiska felsökningsmetoder för komplexa problem
- Konfigurera korrekt loggning och övervakning för att förhindra framtida problem

## Läranderesultat

Efter att ha slutfört guiden kommer du att kunna:
- Diagnostisera problem med Azure Developer CLI med hjälp av inbyggda diagnostikverktyg
- Självständigt lösa autentiserings-, abonnemangs- och behörighetsrelaterade problem
- Felsöka distributionsfel och infrastrukturprovisioneringsproblem effektivt
- Debugga applikationskonfigurationsproblem och miljöspecifika problem
- Implementera övervakning och varningar för att proaktivt identifiera potentiella problem
- Använda bästa praxis för loggning, felsökning och problemlösningsarbetsflöden

## Snabb diagnostik

Innan du dyker in i specifika problem, kör dessa kommandon för att samla diagnostisk information:

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

## Autentiseringsproblem

### Problem: "Misslyckades med att hämta åtkomsttoken"
**Symtom:**
- `azd up` misslyckas med autentiseringsfel
- Kommandon returnerar "obehörig" eller "åtkomst nekad"

**Lösningar:**
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

### Problem: "Otillräckliga privilegier" under distribution
**Symtom:**
- Distribution misslyckas med behörighetsfel
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

### Problem: Autentiseringsproblem i flera klientorganisationer
**Lösningar:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Fel vid infrastrukturprovisionering

### Problem: Konflikter med resursnamn
**Symtom:**
- Felmeddelanden om att "resursnamnet redan finns"
- Distribution misslyckas under resurskapande

**Lösningar:**
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

### Problem: Plats/region inte tillgänglig
**Symtom:**
- Felmeddelanden om att "Platsen 'xyz' är inte tillgänglig för resurstypen"
- Vissa SKUs är inte tillgängliga i vald region

**Lösningar:**
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

### Problem: Kvotöverskridande fel
**Symtom:**
- "Kvoten överskriden för resurstypen"
- "Maximalt antal resurser uppnått"

**Lösningar:**
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

### Problem: Fel i Bicep-mallar
**Symtom:**
- Valideringsfel i mallar
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
- Applikationen misslyckas med att byggas under distribution
- Fel vid installation av paket

**Lösningar:**
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

### Problem: Fel vid containerdistribution
**Symtom:**
- Container-appar misslyckas med att starta
- Fel vid hämtning av bilder

**Lösningar:**
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

### Problem: Fel vid databasanslutning
**Symtom:**
- Applikationen kan inte ansluta till databasen
- Felmeddelanden om anslutningstidsgräns

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
- Applikationen kan inte läsa konfigurationsvärden
- Miljövariabler verkar tomma

**Lösningar:**
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

### Problem: Problem med SSL/TLS-certifikat
**Symtom:**
- HTTPS fungerar inte
- Fel vid certifikatvalidering

**Lösningar:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problem: Problem med CORS-konfiguration
**Symtom:**
- Frontend kan inte anropa API
- Cross-origin-förfrågan blockerad

**Lösningar:**
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

## 🌍 Problem med miljöhantering

### Problem: Problem med miljöväxling
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
azd env show

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### Problem: Korruption i miljön
**Symtom:**
- Miljön visar ogiltigt tillstånd
- Resurser matchar inte konfigurationen

**Lösningar:**
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

## 🔍 Prestandaproblem

### Problem: Långsamma distributionstider
**Symtom:**
- Distributioner tar för lång tid
- Tidsgränser under distribution

**Lösningar:**
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

### Problem: Applikationsprestandaproblem
**Symtom:**
- Långsamma svarstider
- Hög resursanvändning

**Lösningar:**
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

## 🛠️ Felsökningsverktyg och kommandon

### Debug-kommandon
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

### Logganalys
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

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

### När ska man eskalera
- Autentiseringsproblem kvarstår efter att ha provat alla lösningar
- Infrastrukturproblem med Azure-tjänster
- Problem relaterade till fakturering eller abonnemang
- Säkerhetsproblem eller incidenter

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
- Utdata från `azd version`
- Utdata från `azd info`
- Felmeddelanden (fullständig text)
- Steg för att reproducera problemet
- Miljödetaljer (`azd env show`)
- Tidslinje för när problemet började

### Skript för logginsamling
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

### Regelbundet underhåll
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## Relaterade resurser

- [Felsökningsguide](debugging.md) - Avancerade felsökningstekniker
- [Provisionering av resurser](../deployment/provisioning.md) - Felsökning av infrastruktur
- [Kapacitetsplanering](../pre-deployment/capacity-planning.md) - Vägledning för resursplanering
- [Val av SKU](../pre-deployment/sku-selection.md) - Rekommendationer för tjänstenivåer

---

**Tips**: Spara denna guide som bokmärke och hänvisa till den när du stöter på problem. De flesta problem har redan identifierats och har etablerade lösningar!

---

**Navigering**
- **Föregående lektion**: [Provisionering av resurser](../deployment/provisioning.md)
- **Nästa lektion**: [Felsökningsguide](debugging.md)

---

**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör du vara medveten om att automatiserade översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess ursprungliga språk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.