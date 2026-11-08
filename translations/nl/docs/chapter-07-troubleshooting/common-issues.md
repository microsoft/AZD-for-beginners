# Veelvoorkomende Problemen en Oplossingen

**Hoofdstuk Navigatie:**
- **📚 Cursus Startpagina**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 7 - Problemen oplossen & Debuggen
- **⬅️ Vorig Hoofdstuk**: [Hoofdstuk 6: Pre-flight Controles](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Volgend**: [Debugging Gids](debugging.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 8: Productie- & Enterprise Patronen](../chapter-08-production/production-ai-practices.md)

## Introductie

Deze uitgebreide troubleshooting-gids behandelt de meest voorkomende problemen bij het gebruik van Azure Developer CLI. Leer hoe je problemen met authenticatie, implementatie, infrastructuurvoorziening en applicatieconfiguratie kunt diagnosticeren, oplossen en verhelpen. Elk probleem bevat gedetailleerde symptomen, oorzaken en stapsgewijze oplossingen.

## Leerdoelen

Door deze gids te voltooien, zul je:
- Diagnostische technieken voor Azure Developer CLI-problemen beheersen
- Veelvoorkomende problemen met authenticatie en machtigingen en hun oplossingen begrijpen
- Implementatiefouten, fouten bij infrastructuurvoorziening en configuratieproblemen oplossen
- Proactieve monitoring- en debugstrategieën toepassen
- Systematische probleemoplossingsmethodologieën voor complexe problemen toepassen
- Juiste logging en monitoring configureren om toekomstige problemen te voorkomen

## Leerresultaten

Na voltooiing kun je:
- Azure Developer CLI-problemen diagnosticeren met ingebouwde diagnostische tools
- Problemen met authenticatie, abonnementen en machtigingen zelfstandig oplossen
- Effectief fouten bij implementaties en infrastructuurvoorziening oplossen
- Problemen met applicatieconfiguratie en omgevingsspecifieke fouten debuggen
- Monitoring en waarschuwingen implementeren om potentiële problemen proactief te detecteren
- Best practices toepassen voor logging, debugging en probleemoplossingsworkflows

## Snelle Diagnostiek

> Vervang voorbeeldnamen/IDs door de waarden van je omgeving. Bash-, Bicep-, JavaScript- en parameterbestandfragmenten zijn hieronder afzonderlijk gelabeld; dit is geen uitvoerbaar script. Controleer destructieve acties en verwijder geheimen voordat je diagnostiek deelt. `azd monitor --logs` opent een browser; het streamt geen terminallogs.

Voer voordat je specifieke problemen gaat onderzoeken deze opdrachten uit om diagnostische informatie te verzamelen:

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

## Authenticatieproblemen

### Probleem: "Toegangstoken ophalen mislukt"
**Symptomen:**
- `azd up` faalt met authenticatiefouten
- Opdrachten geven "unauthorized" of "access denied" terug

**Oplossingen:**
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

### Probleem: "Onvoldoende machtigingen" tijdens implementatie
**Symptomen:**
- Implementatie faalt met machtigingsfouten
- Kan bepaalde Azure-resources niet aanmaken

**Oplossingen:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Probleem: Multi-tenant authenticatieproblemen
**Oplossingen:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Fouten bij infrastructuurvoorziening

### Probleem: Naamconflicten bij resources
**Symptomen:**
- Fouten "De resource-naam bestaat al"
- Implementatie mislukt tijdens resource-aanmaak

**Oplossingen:**
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

### Probleem: Locatie/Regio niet beschikbaar
**Symptomen:**
- "De locatie 'xyz' is niet beschikbaar voor resourcetype"
- Bepaalde SKU's niet beschikbaar in geselecteerde regio

**Oplossingen:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Het wijzigen van de locatievariabele migreert bestaande resources niet. Een bestaande resourcegroep of resource kan een locatiewijziging weigeren; gebruik een aparte omgeving voor een regionale herimplementatie.

### Probleem: Quota overschrijdingsfouten
**Symptomen:**
- "Quota overschreden voor resourcetype"
- "Maximum aantal resources bereikt"

**Oplossingen:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

Voor ontwikkeling kies je een ondersteunde kleinere SKU in `infra/main.parameters.json`:

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

### Probleem: Fouten in Bicep-sjablonen
**Symptomen:**
- Fouten bij template-validatie
- Syntaxfouten in Bicep-bestanden

**Oplossingen:**
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

## 🚀 Implementatiefouten

### Probleem: Build-fouten
**Symptomen:**
- Applicatie bouwt niet tijdens implementatie
- Fouten bij pakketinstallatie

**Oplossingen:**
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

### Probleem: Container implementatiefouten
**Symptomen:**
- Container-apps starten niet
- Fouten bij ophalen van images

**Oplossingen:**
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

### Probleem: Fouten bij databaseverbinding
**Symptomen:**
- Applicatie kan geen verbinding maken met database
- Verbindings-timeouts

**Oplossingen:**
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

## 🔧 Configuratieproblemen

### Probleem: Omgevingsvariabelen werken niet
**Symptomen:**
- App kan configuratiewaarden niet lezen
- Omgevingsvariabelen lijken leeg

**Oplossingen:**
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

### Probleem: SSL/TLS certificaatproblemen
**Symptomen:**
- HTTPS werkt niet
- Fouten bij certificaatvalidatie

**Oplossingen:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Probleem: CORS-configuratieproblemen
**Symptomen:**
- Frontend kan API niet aanroepen
- Cross-origin verzoek geblokkeerd

**Oplossingen:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. Werk je bestaande Express-applicatie bij (met `cors` geïmporteerd):

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

## 🌍 Problemen met Omgevingsbeheer

### Probleem: Problemen met het wisselen van omgeving
**Symptomen:**
- Verkeerde omgeving wordt gebruikt
- Configuratie schakelt niet correct

**Oplossingen:**
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

### Probleem: Omgevingscorruptie
**Symptomen:**
- Omgeving toont ongeldige status
- Resources komen niet overeen met configuratie

**Oplossingen:**
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

## 🔍 Prestatieproblemen

### Probleem: Trage implementatietijden
**Symptomen:**
- Implementaties duren te lang
- Time-outs tijdens implementatie

**Oplossingen:**
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

### Probleem: Prestatieproblemen van de applicatie
**Symptomen:**
- Trage reactietijden
- Hoog gebruik van resources

**Oplossingen:**
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

## 🛠️ Hulpmiddelen en Opdrachten voor Probleemoplossing

### Debug-opdrachten
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

### Resource-onderzoek
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Extra Hulp Krijgen

### Wanneer opschalen
- Authenticatieproblemen blijven bestaan na alle oplossingen geprobeerd te hebben
- Infrastructuurproblemen met Azure-diensten
- Problemen met facturering of abonnement
- Beveiligingsproblemen of incidenten

### Ondersteuningskanalen
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

### Informatie om te verzamelen
Neem voordat je contact opneemt met support het volgende mee:
- Uitvoer van `azd version`
- Uitvoer van `azd config show`
- Uitvoer van `azd show` (huidige implementatiestatus)
- Foutmeldingen (volledige tekst)
- Stappen om het probleem te reproduceren
- Geanonimiseerde omgevingsgegevens (deel nooit ruwe `azd env get-values`, deze kunnen geheimen bevatten)
- Tijdlijn van wanneer het probleem begon

### Script voor logverzameling
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

## 📊 Probleempreventie

### Checklist voor pre-implementatie
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

### Monitoringconfiguratie
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

### Regelmatig onderhoud
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## Gerelateerde Bronnen

- [Debugging Gids](debugging.md) - Geavanceerde debuggingtechnieken
- [Resources Provisioning](../chapter-04-infrastructure/provisioning.md) - Infrastructuur troubleshooting
- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - Richtlijnen voor resourceplanning
- [SKU Selectie](../chapter-06-pre-deployment/sku-selection.md) - Aanbevelingen voor servicetiers

---

**Tip**: Bewaar deze gids als bladwijzer en raadpleeg deze telkens wanneer je problemen tegenkomt. De meeste problemen zijn eerder gezien en er bestaan beproefde oplossingen!

---

**Navigatie**
- **Vorig Lessen**: [Resources Provisioning](../chapter-04-infrastructure/provisioning.md)
- **Volgende Lessen**: [Debugging Gids](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->