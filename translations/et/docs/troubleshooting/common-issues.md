<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e3b1c94a2da4a497e880ebe7b89c2bb1",
  "translation_date": "2025-10-11T16:00:45+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "et"
}
-->
# Levinumad probleemid ja lahendused

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 7 - Tõrkeotsing ja silumine
- **⬅️ Eelmine peatükk**: [Peatükk 6: Kontroll enne juurutamist](../pre-deployment/preflight-checks.md)
- **➡️ Järgmine**: [Silumise juhend](debugging.md)
- **🚀 Järgmine peatükk**: [Peatükk 8: Tootmise ja ettevõtte mustrid](../ai-foundry/production-ai-practices.md)

## Sissejuhatus

See põhjalik tõrkeotsingu juhend käsitleb kõige sagedamini esinevaid probleeme Azure Developer CLI kasutamisel. Õpi tuvastama, lahendama ja parandama levinud probleeme, mis on seotud autentimise, juurutamise, infrastruktuuri loomise ja rakenduse konfiguratsiooniga. Iga probleem sisaldab üksikasjalikke sümptomeid, põhjuseid ja samm-sammult lahendusi.

## Õpieesmärgid

Selle juhendi läbimisega:
- Omandad diagnostikatehnikad Azure Developer CLI probleemide lahendamiseks
- Mõistad levinud autentimise ja õiguste probleeme ning nende lahendusi
- Lahendad juurutamise tõrkeid, infrastruktuuri loomise vigu ja konfiguratsiooniprobleeme
- Rakendad ennetavat jälgimist ja silumistehnikaid
- Kasutad süsteemset tõrkeotsingu metoodikat keeruliste probleemide lahendamiseks
- Konfigureerid korrektse logimise ja jälgimise, et vältida tulevasi probleeme

## Õpitulemused

Pärast juhendi läbimist suudad:
- Tuvastada Azure Developer CLI probleeme sisseehitatud diagnostikavahendite abil
- Lahendada iseseisvalt autentimise, tellimuse ja õigustega seotud probleeme
- Tõrkeotsingut teha juurutamise ja infrastruktuuri loomise vigade korral
- Siluda rakenduse konfiguratsiooniprobleeme ja keskkonnaspetsiifilisi vigu
- Rakendada jälgimist ja hoiatusi, et ennetavalt tuvastada võimalikke probleeme
- Kasutada parimaid praktikaid logimise, silumise ja probleemide lahendamise töövoogude jaoks

## Kiirdiagnostika

Enne konkreetsete probleemide lahendamist käivita need käsud diagnostilise teabe kogumiseks:

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

## Autentimise probleemid

### Probleem: "Ei õnnestunud hankida juurdepääsuluba"
**Sümptomid:**
- `azd up` ebaõnnestub autentimisvigadega
- Käskude tulemuseks on "volitamata" või "juurdepääs keelatud"

**Lahendused:**
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

### Probleem: "Ebapiisavad õigused" juurutamise ajal
**Sümptomid:**
- Juurutamine ebaõnnestub õiguste vigadega
- Ei saa luua teatud Azure'i ressursse

**Lahendused:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Probleem: Multi-tenant autentimise probleemid
**Lahendused:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Infrastruktuuri loomise vead

### Probleem: Ressursi nime konfliktid
**Sümptomid:**
- "Ressursi nimi juba eksisteerib" vead
- Juurutamine ebaõnnestub ressursside loomise ajal

**Lahendused:**
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

### Probleem: Asukoht/piirkond pole saadaval
**Sümptomid:**
- "Asukoht 'xyz' pole ressursitüübi jaoks saadaval"
- Teatud SKU-d pole valitud piirkonnas saadaval

**Lahendused:**
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

### Probleem: Kvoot ületatud
**Sümptomid:**
- "Ressursitüübi kvoot ületatud"
- "Ressursside maksimaalne arv saavutatud"

**Lahendused:**
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

### Probleem: Bicep mallide vead
**Sümptomid:**
- Malli valideerimise ebaõnnestumised
- Süntaksivead Bicep failides

**Lahendused:**
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

## 🚀 Juurutamise tõrked

### Probleem: Ehituse vead
**Sümptomid:**
- Rakenduse ehitamine ebaõnnestub juurutamise ajal
- Pakettide installimise vead

**Lahendused:**
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

### Probleem: Konteineri juurutamise vead
**Sümptomid:**
- Konteinerirakendused ei käivitu
- Kujutise tõmbamise vead

**Lahendused:**
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

### Probleem: Andmebaasi ühenduse vead
**Sümptomid:**
- Rakendus ei saa andmebaasiga ühendust
- Ühenduse ajalõpu vead

**Lahendused:**
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

## 🔧 Konfiguratsiooniprobleemid

### Probleem: Keskkonnamuutujad ei tööta
**Sümptomid:**
- Rakendus ei saa konfiguratsiooniväärtusi lugeda
- Keskkonnamuutujad tunduvad tühjad

**Lahendused:**
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

### Probleem: SSL/TLS sertifikaadi probleemid
**Sümptomid:**
- HTTPS ei tööta
- Sertifikaadi valideerimise vead

**Lahendused:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Probleem: CORS konfiguratsiooni probleemid
**Sümptomid:**
- Frontend ei saa API-d kutsuda
- Ristpäringu taotlus blokeeritud

**Lahendused:**
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

## 🌍 Keskkonna haldamise probleemid

### Probleem: Keskkonna vahetamise probleemid
**Sümptomid:**
- Kasutatakse valet keskkonda
- Konfiguratsioon ei vahetu korralikult

**Lahendused:**
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

### Probleem: Keskkonna rikutus
**Sümptomid:**
- Keskkond näitab kehtetut olekut
- Ressursid ei vasta konfiguratsioonile

**Lahendused:**
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

## 🔍 Jõudlusprobleemid

### Probleem: Aeglased juurutamisajad
**Sümptomid:**
- Juurutamine võtab liiga kaua aega
- Ajalõpud juurutamise ajal

**Lahendused:**
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

### Probleem: Rakenduse jõudlusprobleemid
**Sümptomid:**
- Aeglased vastuseajad
- Kõrge ressursikasutus

**Lahendused:**
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

## 🛠️ Tõrkeotsingu tööriistad ja käsud

### Silumise käsud
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

### Logide analüüs
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Ressursside uurimine
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Täiendava abi saamine

### Millal eskaleerida
- Autentimise probleemid püsivad pärast kõigi lahenduste proovimist
- Infrastruktuuri probleemid Azure'i teenustega
- Arveldus- või tellimusega seotud probleemid
- Turvalisuse probleemid või intsidendid

### Tugikanalid
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

### Kogutav teave
Enne toe poole pöördumist kogu:
- `azd version` väljund
- `azd info` väljund
- Veateated (täistekst)
- Sammud probleemi taastamiseks
- Keskkonna üksikasjad (`azd env show`)
- Ajajoon, millal probleem algas

### Logide kogumise skript
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

## 📊 Probleemide ennetamine

### Kontrollnimekiri enne juurutamist
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

### Jälgimise seadistamine
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

### Regulaarne hooldus
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## Seotud ressursid

- [Silumise juhend](debugging.md) - Täiustatud silumistehnikad
- [Ressursside loomine](../deployment/provisioning.md) - Infrastruktuuri tõrkeotsing
- [Mahutavuse planeerimine](../pre-deployment/capacity-planning.md) - Ressursside planeerimise juhend
- [SKU valik](../pre-deployment/sku-selection.md) - Teenuse taseme soovitused

---

**Nõuanne**: Hoia see juhend järjehoidjates ja kasuta seda alati, kui probleemid tekivad. Enamik probleeme on varem esinenud ja neil on olemas lahendused!

---

**Navigeerimine**
- **Eelmine õppetund**: [Ressursside loomine](../deployment/provisioning.md)
- **Järgmine õppetund**: [Silumise juhend](debugging.md)

---

**Lahtiütlus**:  
See dokument on tõlgitud, kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi püüame tagada täpsust, palun arvestage, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algkeeles tuleks lugeda autoriteetseks allikaks. Olulise teabe puhul on soovitatav kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.