# Levinumad probleemid ja lahendused

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Aktuaalne peatükk**: Peatükk 7 - Probleemide lahendamine ja silumine
- **⬅️ Eelmine peatükk**: [Peatükk 6: Lennueelsed kontrollid](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Järgmine**: [Silumise juhend](debugging.md)
- **🚀 Järgmine peatükk**: [Peatükk 8: Tootmise ja ettevõtte mustrid](../chapter-08-production/production-ai-practices.md)

## Sissejuhatus

See põhjalik probleemide lahendamise juhend käsitleb kõige sagedamini Azure Developer CLI kasutamisel ette tulevaid probleeme. Õpi diagnoosima, tõrkeotsingut tegema ja lahendama tavalisi probleeme autentimise, juurutamise, infrastruktuuri loomise ja rakenduse konfigureerimisega. Iga probleem sisaldab üksikasjalikke sümptomeid, aluseid ja samm-sammulisi lahenduskäike.

## Õpieesmärgid

Selle juhendi läbimisega sa:
- Omandad diagnostikatehnikad Azure Developer CLI probleemide jaoks
- Mõistad tavalisi autentimise ja õigustega seotud probleeme ja nende lahendusi
- Lahendad juurutamise ebaõnnestumised, infrastruktuuri loomise vead ja konfiguratsiooniprobleemid
- Saad rakendada ennetava monitooringu ja silumise strateegiaid
- Kasutad keeruliste probleemide süsteemset tõrkeotsingu metoodikat
- Seadistad korrektselt logimise ja monitooringu tulevaste probleemide vältimiseks

## Õpiväljundid

Pärast juhendi lõpetamist saad:
- Diagnostiseerida Azure Developer CLI probleeme sisseehitatud diagnostikavahenditega
- Lahendada autentimise, tellimuste ja õigustega seotud probleeme iseseisvalt
- Efektiivselt tõrkeotsingut teha juurutamise ebaõnnestumiste ja infrastruktuuri loomise vigade puhul
- Siluda rakenduse konfiguratsiooniprobleeme ja keskkonnaspetsiifilisi vigu
- Rakendada monitooringut ja häiringute seadistust võimalike probleemide varajaseks avastamiseks
- Järgida parimaid tavasid logimise, silumise ja probleemide lahendamise töövoogude jaoks

## Kiire diagnostika

> Asenda näite nimed/IDd oma keskkonna väärtustega. Bash, Bicep, JavaScript ja parameetrifaili fragmendid on allpool eraldi märgistatud; need ei ole üks täidetav skript. Kontrolli hävitavaid toiminguid ja peida saladused enne diagnostika jagamist. `azd monitor --logs` avab brauseri; see ei voogesita terminali logisid.

Enne konkreetsete probleemide lahkamist jooksuta need käsud diagnostika info kogumiseks:

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

## Autentimisprobleemid

### Probleem: "Ei saanud juurdepääsuluba"
**Sümptomid:**
- `azd up` ebaõnnestub autentimisvigadega
- Käsud tagastavad "luba keelatud" või "järgi luba puudub"

**Lahendused:**
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

### Probleem: "Piisavad õigused puuduvad" juurutamise ajal
**Sümptomid:**
- Juurutamine ebaõnnestub õiguste vigade tõttu
- Ei saa luua teatud Azure ressursse

**Lahendused:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Probleem: Mitme üürniku autentimisprobleemid
**Lahendused:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Infrastruktuuri loomise vead

### Probleem: Ressursside nimekonfliktid
**Sümptomid:**
- "Resurssi nimi on juba olemas" veateated
- Juurutamine ebaõnnestub ressursi loomisel

**Lahendused:**
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

### Probleem: Asukoht/piirkond pole saadaval
**Sümptomid:**
- "Asukoht 'xyz' pole selle ressursitüübi jaoks saadaval"
- Teatud SKU-d pole valitud regioonis kättesaadavad

**Lahendused:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Muutuja location väärtuse muutmine ei migreeri olemasolevaid ressursse. Olemasolev ressursigrupp või ressurss võib asukoha muutmise tagasi lükata; piirkondliku ümberjuurutamise jaoks kasuta eraldi keskkonda.

### Probleem: Kvota ületamise vead
**Sümptomid:**
- "Kvota selle ressursitüübi jaoks on ületatud"
- "Maksimaalne ressursside arv on täis"

**Lahendused:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

Arenduseks vali toetatud väiksem SKU `infra/main.parameters.json`:

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

### Probleem: Bicep mallivigade vead
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

## 🚀 Juurutuse ebaõnnestumised

### Probleem: Kogumise vead
**Sümptomid:**
- Rakendus ei ehitu juurutamise ajal
- Pakendi paigaldamise vead

**Lahendused:**
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

### Probleem: Konteineri juurutamise vead
**Sümptomid:**
- Konteinerirakendused ei käivitu
- Pildi tõmbamise vead

**Lahendused:**
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

### Probleem: Andmebaasiühenduse vead
**Sümptomid:**
- Rakendus ei saa andmebaasiga ühendust
- Ühenduse ajal ületatakse ooteaeg

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
- Rakendus ei loe konfiguratsiooniväärtusi
- Keskkonnamuutujad tunduvad olevat tühjad

**Lahendused:**
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

### Probleem: CORS konfiguratsiooni vead
**Sümptomid:**
- Esirakendus ei saa API-d kutsuda
- Päritolupiiranguga päringu blokeerimine

**Lahendused:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. Uuenda olemasolevat Express rakendust (koos `cors` importimisega):

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

## 🌍 Keskkonna haldamise probleemid

### Probleem: Keskkonna vahetamise probleemid
**Sümptomid:**
- Kasutatakse vale keskkonda
- Konfiguratsioon ei vaheta korrektselt

**Lahendused:**
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

### Probleem: Keskkonna riknemine
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

# 3. azd env refresh reads outputs of a previous deployment; it does not
# import arbitrary existing resources or reconcile template drift.
# To adopt resources, use the template's documented existing-resource parameters.
```

## 🔍 Jõudlusprobleemid

### Probleem: Juurutuse aeg on pikk
**Sümptomid:**
- Juurutused võtavad liiga kaua aega
- Juurutamise ajal aegumised

**Lahendused:**
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

### Probleem: Rakenduse jõudluse probleemid
**Sümptomid:**
- Aeglane reageerimine
- Kõrge ressursikasutus

**Lahendused:**
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

## 🛠️ Tõrkeotsingu tööriistad ja käsud

### Silumiskäsud
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

### Logide analüüs
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

### Ressursside kontroll
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
- Autentimisprobleemid jätkuvad pärast kõigi lahenduste proovimist
- Infrastruktuuriprobleemid Azure teenustega
- Arveldus- või tellimusega seotud probleemid
- Julgeoleku mured või intsidendite juhtumid

### Toetuse kanalid
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

### Kogutav info
Enne toe poole pöördumist kogu kokku:
- `azd version` väljund
- `azd config show` väljund
- `azd show` väljund (praegune juurutuse staatus)
- Veateated (täistekst)
- Sammud probleemi taasesitamiseks
- Peidetud keskkonnaandmed (ära jaga kunagi puhtalt `azd env get-values`, mis võib sisaldada saladusi)
- Ajajoon, millal probleem algas

### Logikogumise skript
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

## 📊 Probleemide ennetamine

### Enne juurutamist kontrollnimekiri
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

### Monitooringu seadistus
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

### Regulaarne hooldus
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## Seotud ressursid

- [Silumise juhend](debugging.md) - Täiustatud silumistehnikad
- [Ressursside loomine](../chapter-04-infrastructure/provisioning.md) - Infrastruktuuri tõrkeotsing
- [Mahukavandamine](../chapter-06-pre-deployment/capacity-planning.md) - Ressursside planeerimise juhised
- [SKU valik](../chapter-06-pre-deployment/sku-selection.md) - Teenuse taseme soovitused

---

**Vihje**: Hoia see juhend järjehoidjas ja kasuta seda alati probleemide ilmnemisel. Enamik probleeme on varem nähtud ja neile on leitud lahendused!

---

**Navigeerimine**
- **Eelmine õppetükk**: [Ressursside loomine](../chapter-04-infrastructure/provisioning.md)
- **Järgmine õppetükk**: [Silumise juhend](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->