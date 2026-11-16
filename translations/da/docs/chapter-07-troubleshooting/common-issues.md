# Almindelige Problemer og Løsninger

**Kapitelnavigation:**
- **📚 Kursushjem**: [AZD For Beginners](../../README.md)
- **📖 Nuværende Kapitel**: Kapitel 7 - Fejlfinding & Debugging
- **⬅️ Forrige Kapitel**: [Kapitel 6: Pre-flight Checks](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Næste**: [Debugging Guide](debugging.md)
- **🚀 Næste Kapitel**: [Kapitel 8: Produktion & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)

## Introduktion

Denne omfattende fejlfinding guide dækker de mest hyppigt forekommende problemer ved brug af Azure Developer CLI. Lær at diagnosticere, fejlsøge og løse almindelige problemer med autentificering, deployment, infrastruktur provisionering og applikationskonfiguration. Hvert problem indeholder detaljerede symptomer, grundårsager og trin-for-trin løsningsprocedurer.

## Læringsmål

Ved at gennemføre denne guide vil du:
- Mestrer diagnostiske teknikker for Azure Developer CLI problemer
- Forstå almindelige autentificerings- og tilladelsesproblemer og deres løsninger
- Løse deploymentfejl, infrastruktur provisioneringsfejl og konfigurationsproblemer
- Implementere proaktive overvågnings- og debuggingstrategier
- Anvende systematiske fejlfindingmetodologier for komplekse problemer
- Konfigurere korrekt logging og overvågning for at forhindre fremtidige problemer

## Læringsudbytte

Når du har gennemført vil du være i stand til:
- Diagnosticere Azure Developer CLI problemer ved brug af indbyggede diagnostiske værktøjer
- Løse autentificerings-, abonnement- og tilladelsesrelaterede problemer selvstændigt
- Fejlsøge deploymentfejl og infrastruktur provisioneringsfejl effektivt
- Debugge applikationskonfigurationsproblemer og miljøspecifikke problemer
- Implementere overvågning og alarmering for proaktivt at identificere potentielle problemer
- Anvende best practices for logging, debugging og problemløsningsarbejdsgange

## Hurtig Diagnostik

> Erstat eksemplernavne/ID'er med dine miljøværdier. Bash, Bicep, JavaScript og parameterfilfragmenter er mærket separat nedenfor; de er ikke ét eksekverbart script. Gennemgå destruktive operationer og fjern hemmeligheder før deling af diagnostik. `azd monitor --logs` åbner en browser; den streamer ikke terminallogs.

Før du dykker ned i specifikke problemer, kør disse kommandoer for at indsamle diagnostiske oplysninger:

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

## Autentificeringsproblemer

### Problem: "Fejl ved hentning af adgangstoken"
**Symptomer:**
- `azd up` fejler med autentificeringsfejl
- Kommandoer returnerer "unauthorized" eller "access denied"

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

### Problem: "Utilstrækkelige privilegier" under deployment
**Symptomer:**
- Deployment fejler med tilladelsesfejl
- Kan ikke oprette visse Azure-ressourcer

**Løsninger:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Problem: Multi-tenant autentificeringsproblemer
**Løsninger:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Infrastruktur Provisioneringsfejl

### Problem: Ressourcenavn-konflikter
**Symptomer:**
- "Ressourcenavnet findes allerede" fejl
- Deployment fejler under oprettelse af ressourcer

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

### Problem: Lokation/region ikke tilgængelig
**Symptomer:**
- "Lokationen 'xyz' er ikke tilgængelig for ressource typen"
- Visse SKU'er ikke tilgængelige i den valgte region

**Løsninger:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Ændring af lokationsvariablen migrerer ikke eksisterende ressourcer. En eksisterende ressourcegruppe eller ressource kan afvise en lokationsændring; brug et separat miljø til regional nyudrulning.

### Problem: Quota overskridelsesfejl
**Symptomer:**
- "Quota overskredet for ressource typen"
- "Maksimalt antal ressourcer nået"

**Løsninger:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

Til udvikling, vælg en understøttet mindre SKU i `infra/main.parameters.json`:

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

### Problem: Bicep skabelonfejl
**Symptomer:**
- Skabelonvalideringsfejl
- Syntaksfejl i Bicep-filer

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

## 🚀 Deploymentfejl

### Problem: Build-fejl
**Symptomer:**
- Applikation fejler bygges under deployment
- Pakkeinstallationsfejl

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

### Problem: Container deployment fejl
**Symptomer:**
- Container apps starter ikke
- Image pull-fejl

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

### Problem: Databaseforbindelsesfejl
**Symptomer:**
- Applikation kan ikke oprette forbindelse til database
- Forbindelsestidsoverskridelse

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

## 🔧 Konfigurationsproblemer

### Problem: Miljøvariabler virker ikke
**Symptomer:**
- App kan ikke læse konfigurationsværdier
- Miljøvariabler ser tomme ud

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

### Problem: SSL/TLS certifikatproblemer
**Symptomer:**
- HTTPS virker ikke
- Certifikatvalideringsfejl

**Løsninger:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problem: CORS konfigurationsproblemer
**Symptomer:**
- Frontend kan ikke kalde API
- Cross-origin anmodning blokeret

**Løsninger:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. Opdater din eksisterende Express-applikation (med `cors` importeret):

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

## 🌍 Miljøstyringsproblemer

### Problem: Miljøskifteproblemer
**Symptomer:**
- Forkert miljø anvendes
- Konfiguration skifter ikke korrekt

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

### Problem: Miljøkorruption
**Symptomer:**
- Miljøet viser ugyldig tilstand
- Ressourcer matcher ikke konfiguration

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

## 🔍 Ydelsesproblemer

### Problem: Langsomme deploymenttider
**Symptomer:**
- Deployment tager for lang tid
- Tidsoverskridelser under deployment

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

### Problem: Applikationsydelsesproblemer
**Symptomer:**
- Langsomme svartider
- Høj ressourceforbrug

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

## 🛠️ Fejlfinding værktøjer og kommandoer

### Debug-kommandoer
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

### Loganalyse
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

### Ressourceundersøgelse
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Få yderligere hjælp

### Hvornår skal eskalere
- Autentificeringsproblemer fortsætter efter at have prøvet alle løsninger
- Infrastrukturproblemer med Azure-tjenester
- Fakturering- eller abonnementsrelaterede problemer
- Sikkerhedsbekymringer eller hændelser

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

### Oplysninger at indsamle
Før du kontakter support, indsamle:
- `azd version` output
- `azd config show` output
- `azd show` output (nuværende deploymentstatus)
- Fejlmeddelelser (fuld tekst)
- Trin til at gengive problemet
- Redigerede miljødatoer (del aldrig rå `azd env get-values`, som kan indeholde hemmeligheder)
- Tidslinje for hvornår problemet startede

### Logindsamlingsscript
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

## 📊 Forebyggelse af problemer

### Pre-deployment Checkliste
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

### Overvågningsopsætning
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

### Regelmæssig vedligeholdelse
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## Relaterede Ressourcer

- [Debugging Guide](debugging.md) - Avancerede debugging teknikker
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Infrastruktur fejlfinding
- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - Ressourceplanlægning vejledning
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Service niveau anbefalinger

---

**Tip**: Hold denne guide bogmærket og henvis til den, når du støder på problemer. De fleste problemer er tidligere set og har etablerede løsninger!

---

**Navigation**
- **Forrige Lektion**: [Provisioning Resources](../chapter-04-infrastructure/provisioning.md)
- **Næste Lektion**: [Debugging Guide](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->