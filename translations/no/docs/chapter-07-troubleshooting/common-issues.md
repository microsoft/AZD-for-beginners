# Vanlige problemer og løsninger

**Kapittelnavigasjon:**
- **📚 Kurs Hjem**: [AZD for Nybegynnere](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 7 - Feilsøking og feildiagnostisering
- **⬅️ Forrige kapittel**: [Kapittel 6: Forhåndssjekker](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Neste**: [Feilsøkingsguide](debugging.md)
- **🚀 Neste kapittel**: [Kapittel 8: Produksjons- og bedriftsmønstre](../chapter-08-production/production-ai-practices.md)

## Introduksjon

Denne omfattende feilsøkingsguiden dekker de mest vanlige problemene ved bruk av Azure Developer CLI. Lær å diagnostisere, feilsøke og løse vanlige problemer med autentisering, distribusjon, infrastrukturprovisjonering og applikasjonskonfigurasjon. Hvert problem inneholder detaljerte symptomer, rotårsaker og trinnvise løsningsprosedyrer.

## Læringsmål

Etter å ha fullført denne guiden vil du:
- Mestre diagnostiske teknikker for Azure Developer CLI-problemer
- Forstå vanlige autentiserings- og tillatelsesproblemer og deres løsninger
- Løse distribusjonsfeil, infrastrukturprovisjonsfeil og konfigurasjonsproblemer
- Implementere proaktive overvåknings- og feilsøkingsstrategier
- Bruke systematiske feilsøkingsmetoder for komplekse problemer
- Konfigurere riktig logging og overvåkning for å forhindre fremtidige problemer

## Læringsutbytte

Når du er ferdig, vil du kunne:
- Diagnostisere Azure Developer CLI-problemer ved hjelp av innebygde diagnostiske verktøy
- Løse autentiserings-, abonnement- og tillatelsesrelaterte problemer på egen hånd
- Feilsøke distribusjonsfeil og infrastrukturprovisjonsfeil effektivt
- Feildiagnostisere applikasjonskonfigurasjonsproblemer og miljøspesifikke problemer
- Implementere overvåkning og varsling for å oppdage potensielle problemer proaktivt
- Anvende beste praksis for logging, feilsøking og problemløsningsprosesser

## Rask diagnostikk

> Erstatt eksemplarnavn/IDer med dine miljøverdier. Bash, Bicep, JavaScript og parameterfilfragmenter er merket separat nedenfor; de er ikke ett kjørbart skript. Gå gjennom destruktive operasjoner og sensurer hemmeligheter før du deler diagnostikk. `azd monitor --logs` åpner en nettleser; den streamer ikke terminallogger.

Før du går inn på spesifikke problemer, kjør disse kommandoene for å samle diagnostisk informasjon:

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

## Autentiseringsproblemer

### Problem: "Kunne ikke hente tilgangstoken"
**Symptomer:**
- `azd up` feiler med autentiseringsfeil
- Kommandoer returnerer "ikke autorisert" eller "tilgang nektet"

**Løsninger:**
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

### Problem: "Utilstrekkelige rettigheter" under distribusjon
**Symptomer:**
- Distribusjon feiler med tillatelsesfeil
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

### Problem: Multi-tenant autentiseringsproblemer
**Løsninger:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Infrastrukturprovisjonsfeil

### Problem: Ressursnavnkonflikter
**Symptomer:**
- "Ressursnavnet finnes allerede" feil
- Distribusjon feiler under oppretting av ressurs

**Løsninger:**
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

### Problem: Lokasjon/region ikke tilgjengelig
**Symptomer:**
- "Lokasjonen 'xyz' er ikke tilgjengelig for ressurstype"
- Enkelte SKUer ikke tilgjengelig i valgt region

**Løsninger:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Å endre lokasjonsvariabelen migrerer ikke eksisterende ressurser. En eksisterende ressursgruppe eller ressurs kan avvise lokasjonsendring; bruk et eget miljø for regional re-distribusjon.

### Problem: Kvotefeil
**Symptomer:**
- "Kvota overstiger for ressurstype"
- "Maksimalt antall ressurser nådd"

**Løsninger:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

For utvikling, velg en mindre støttet SKU i `infra/main.parameters.json`:

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

### Problem: Bicep-malfeil
**Symptomer:**
- Malvalideringsfeil
- Syntaxfeil i Bicep-filer

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

## 🚀 Distribusjonsfeil

### Problem: Byggefeil
**Symptomer:**
- Applikasjonen feiler under bygging ved distribusjon
- Pakkeinstallasjonsfeil

**Løsninger:**
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

### Problem: Containerdistribusjonsfeil
**Symptomer:**
- Containerapper starter ikke
- Feil ved henting av bilde

**Løsninger:**
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

### Problem: Database-tilkoblingsfeil
**Symptomer:**
- Applikasjonen kan ikke koble til databasen
- Tidsavbruddsfeil ved tilkobling

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
- Appen kan ikke lese konfigurasjonsverdier
- Miljøvariabler virker tomme

**Løsninger:**
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

### Problem: SSL/TLS-sertifikatproblemer
**Symptomer:**
- HTTPS fungerer ikke
- Sertifikatvalideringsfeil

**Løsninger:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problem: CORS-konfigurasjonsproblemer
**Symptomer:**
- Frontend kan ikke kalle API
- Cross-origin-forespørsel blokkert

**Løsninger:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. Oppdater din eksisterende Express-applikasjon (med `cors` importert):

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

## 🌍 Miljøadministrasjonsproblemer

### Problem: Problemer med miljøbytte
**Symptomer:**
- Feil miljø brukes
- Konfigurasjon bytter ikke riktig

**Løsninger:**
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

### Problem: Miljøkorrupsjon
**Symptomer:**
- Miljø viser ugyldig tilstand
- Ressurser stemmer ikke med konfigurasjonen

**Løsninger:**
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

## 🔍 Ytelsesproblemer

### Problem: Trege distribusjonstider
**Symptomer:**
- Distribusjoner tar for lang tid
- Tidsavbrudd under distribusjon

**Løsninger:**
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

### Problem: Applikasjonsytelsesproblemer
**Symptomer:**
- Treg responstid
- Høy ressursbruk

**Løsninger:**
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

## 🛠️ Feilsøkingsverktøy og kommandoer

### Feilsøkingskommandoer
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

### Logganalyse
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

### Ressursundersøkelser
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Få ekstra hjelp

### Når eskalere
- Autentiseringsproblemer vedvarer etter å ha prøvd alle løsninger
- Infrastrukturproblemer med Azure-tjenester
- Fakturerings- eller abonnementsrelaterte problemer
- Sikkerhetsbekymringer eller hendelser

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

### Informasjon å samle
Før du kontakter support, samle:
- `azd version` utdata
- `azd config show` utdata
- `azd show` utdata (nåværende distribusjonsstatus)
- Feilmeldinger (full tekst)
- Trinn for å reprodusere problemet
- Sensurerte miljødetaljer (del aldri rå `azd env get-values`, som kan inneholde hemmeligheter)
- Tidslinje for når problemet startet

### Script for loggsamling
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

## 📊 Forebygging av problemer

### Sjekkliste før distribusjon
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

### Oppsett av overvåkning
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

### Regelmessig vedlikehold
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## Relaterte ressurser

- [Feilsøkingsguide](debugging.md) - Avanserte feilsøkingsteknikker
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Infrastrukturfeilsøking
- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - Veiledning for ressursplanlegging
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Anbefalinger for servicenivå

---

**Tips**: Ha denne guiden bokmerket og referer til den når du støter på problemer. De fleste problemer har vært sett før og har etablerte løsninger!

---

**Navigasjon**
- **Forrige leksjon**: [Provisioning Resources](../chapter-04-infrastructure/provisioning.md)
- **Neste leksjon**: [Feilsøkingsguide](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->