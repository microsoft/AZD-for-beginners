<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e3b1c94a2da4a497e880ebe7b89c2bb1",
  "translation_date": "2025-09-18T06:17:44+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "no"
}
-->
# Vanlige Problemer og Løsninger

**Kapittelnavigasjon:**
- **📚 Kursoversikt**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 7 - Feilsøking og Debugging
- **⬅️ Forrige Kapittel**: [Kapittel 6: Sjekk før implementering](../pre-deployment/preflight-checks.md)
- **➡️ Neste**: [Debugging Guide](debugging.md)
- **🚀 Neste Kapittel**: [Kapittel 8: Produksjon og Enterprise-mønstre](../ai-foundry/production-ai-practices.md)

## Introduksjon

Denne omfattende feilsøkingsguiden dekker de mest vanlige problemene som oppstår ved bruk av Azure Developer CLI. Lær å diagnostisere, feilsøke og løse vanlige problemer knyttet til autentisering, implementering, infrastrukturprovisjonering og applikasjonskonfigurasjon. Hvert problem inkluderer detaljerte symptomer, årsaker og trinnvise løsninger.

## Læringsmål

Ved å fullføre denne guiden vil du:
- Mestre diagnostiske teknikker for problemer med Azure Developer CLI
- Forstå vanlige autentiserings- og tillatelsesproblemer og deres løsninger
- Løse implementeringsfeil, infrastrukturprovisjoneringsfeil og konfigurasjonsproblemer
- Implementere proaktiv overvåking og debugging-strategier
- Bruke systematiske feilsøkingsmetoder for komplekse problemer
- Konfigurere riktig logging og overvåking for å forhindre fremtidige problemer

## Læringsutbytte

Etter fullføring vil du kunne:
- Diagnostisere problemer med Azure Developer CLI ved hjelp av innebygde diagnostiske verktøy
- Løse autentiserings-, abonnement- og tillatelsesrelaterte problemer selvstendig
- Feilsøke implementeringsfeil og infrastrukturprovisjoneringsproblemer effektivt
- Debugge applikasjonskonfigurasjonsproblemer og miljøspesifikke utfordringer
- Implementere overvåking og varsling for å identifisere potensielle problemer proaktivt
- Bruke beste praksis for logging, debugging og problemløsningsarbeidsflyter

## Rask Diagnostikk

Før du går inn på spesifikke problemer, kjør disse kommandoene for å samle diagnostisk informasjon:

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

## Autentiseringsproblemer

### Problem: "Kunne ikke hente tilgangstoken"
**Symptomer:**
- `azd up` feiler med autentiseringsfeil
- Kommandoer returnerer "unauthorized" eller "access denied"

**Løsninger:**
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

### Problem: "Utilstrekkelige privilegier" under implementering
**Symptomer:**
- Implementering feiler med tillatelsesfeil
- Kan ikke opprette visse Azure-ressurser

**Løsninger:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Problem: Autentiseringsproblemer i multi-tenant miljøer
**Løsninger:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Infrastrukturprovisjoneringsfeil

### Problem: Konflikter med ressursnavn
**Symptomer:**
- Feil som "The resource name already exists"
- Implementering feiler under oppretting av ressurser

**Løsninger:**
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

### Problem: Lokasjon/region ikke tilgjengelig
**Symptomer:**
- Feil som "The location 'xyz' is not available for resource type"
- Enkelte SKUs er ikke tilgjengelige i valgt region

**Løsninger:**
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

### Problem: Kvotebegrensninger overskredet
**Symptomer:**
- Feil som "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Løsninger:**
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

### Problem: Feil i Bicep-maler
**Symptomer:**
- Valideringsfeil i maler
- Syntaksfeil i Bicep-filer

**Løsninger:**
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

## 🚀 Implementeringsfeil

### Problem: Byggefeil
**Symptomer:**
- Applikasjonen feiler under bygging i implementeringen
- Feil ved installasjon av pakker

**Løsninger:**
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

### Problem: Feil ved container-implementering
**Symptomer:**
- Container-applikasjoner starter ikke
- Feil ved henting av bilder

**Løsninger:**
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

### Problem: Feil ved databaseforbindelse
**Symptomer:**
- Applikasjonen kan ikke koble til databasen
- Tidsavbrudd ved tilkobling

**Løsninger:**
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

## 🔧 Konfigurasjonsproblemer

### Problem: Miljøvariabler fungerer ikke
**Symptomer:**
- Applikasjonen kan ikke lese konfigurasjonsverdier
- Miljøvariabler vises som tomme

**Løsninger:**
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

### Problem: SSL/TLS-sertifikatproblemer
**Symptomer:**
- HTTPS fungerer ikke
- Feil ved validering av sertifikater

**Løsninger:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problem: Problemer med CORS-konfigurasjon
**Symptomer:**
- Frontend kan ikke kalle API
- Cross-origin forespørsel blokkert

**Løsninger:**
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

## 🌍 Miljøhåndteringsproblemer

### Problem: Problemer med miljøbytte
**Symptomer:**
- Feil miljø blir brukt
- Konfigurasjonen bytter ikke riktig

**Løsninger:**
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

### Problem: Miljøkorrupsjon
**Symptomer:**
- Miljøet viser ugyldig tilstand
- Ressurser samsvarer ikke med konfigurasjonen

**Løsninger:**
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

## 🔍 Ytelsesproblemer

### Problem: Lang implementeringstid
**Symptomer:**
- Implementeringer tar for lang tid
- Tidsavbrudd under implementering

**Løsninger:**
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

### Problem: Applikasjonsytelsesproblemer
**Symptomer:**
- Lang responstid
- Høyt ressursforbruk

**Løsninger:**
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

## 🛠️ Feilsøkingsverktøy og kommandoer

### Debug-kommandoer
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

### Logganalyse
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Ressursundersøkelse
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Få Ekstra Hjelp

### Når du bør eskalere
- Autentiseringsproblemer vedvarer etter å ha prøvd alle løsninger
- Infrastrukturproblemer med Azure-tjenester
- Problemer relatert til fakturering eller abonnement
- Sikkerhetsbekymringer eller hendelser

### Støttekanaler
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

### Informasjon å samle inn
Før du kontakter støtte, samle inn:
- `azd version`-utdata
- `azd info`-utdata
- Feilmeldinger (full tekst)
- Trinn for å gjenskape problemet
- Miljødetaljer (`azd env show`)
- Tidslinje for når problemet startet

### Logginnsamlingsskript
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

## 📊 Forebygging av Problemer

### Sjekkliste før implementering
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

### Overvåkingsoppsett
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

### Regelmessig vedlikehold
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## Relaterte Ressurser

- [Debugging Guide](debugging.md) - Avanserte debugging-teknikker
- [Provisioning Resources](../deployment/provisioning.md) - Feilsøking av infrastruktur
- [Capacity Planning](../pre-deployment/capacity-planning.md) - Veiledning for ressursplanlegging
- [SKU Selection](../pre-deployment/sku-selection.md) - Anbefalinger for tjenestenivåer

---

**Tips**: Bokmerk denne guiden og bruk den når du støter på problemer. De fleste problemer har blitt sett før og har etablerte løsninger!

---

**Navigasjon**
- **Forrige Leksjon**: [Provisioning Resources](../deployment/provisioning.md)
- **Neste Leksjon**: [Debugging Guide](debugging.md)

---

**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.