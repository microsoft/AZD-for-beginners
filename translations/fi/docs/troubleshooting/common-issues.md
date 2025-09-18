<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e3b1c94a2da4a497e880ebe7b89c2bb1",
  "translation_date": "2025-09-18T06:36:14+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "fi"
}
-->
# Yleiset ongelmat ja ratkaisut

**Luvun navigointi:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 7 - Vianetsintä ja virheenkorjaus
- **⬅️ Edellinen luku**: [Luku 6: Tarkistukset ennen käyttöönottoa](../pre-deployment/preflight-checks.md)
- **➡️ Seuraava**: [Virheenkorjausopas](debugging.md)
- **🚀 Seuraava luku**: [Luku 8: Tuotanto- ja yrityskäytännöt](../ai-foundry/production-ai-practices.md)

## Johdanto

Tämä kattava vianetsintäopas käsittelee yleisimpiä ongelmia Azure Developer CLI:n käytössä. Opit diagnosoimaan, korjaamaan ja ratkaisemaan yleisiä ongelmia, kuten autentikointia, käyttöönottoa, infrastruktuurin provisiointia ja sovelluksen konfigurointia. Jokainen ongelma sisältää yksityiskohtaiset oireet, juurisyyt ja vaiheittaiset ratkaisumenetelmät.

## Oppimistavoitteet

Tämän oppaan suorittamalla opit:
- Hallitsemaan diagnostisia tekniikoita Azure Developer CLI -ongelmien ratkaisemiseksi
- Ymmärtämään yleisiä autentikointi- ja käyttöoikeusongelmia sekä niiden ratkaisuja
- Korjaamaan käyttöönoton epäonnistumisia, infrastruktuurin provisiointivirheitä ja konfigurointiongelmia
- Toteuttamaan ennakoivia valvonta- ja virheenkorjausstrategioita
- Soveltamaan järjestelmällisiä vianetsintämenetelmiä monimutkaisiin ongelmiin
- Konfiguroimaan asianmukaisen lokituksen ja valvonnan tulevien ongelmien ehkäisemiseksi

## Oppimistulokset

Oppaan suorittamisen jälkeen osaat:
- Diagnosoida Azure Developer CLI -ongelmia sisäänrakennettujen diagnostisten työkalujen avulla
- Ratkaista autentikointi-, tilaus- ja käyttöoikeusongelmia itsenäisesti
- Vianetsintä käyttöönoton epäonnistumisissa ja infrastruktuurin provisiointivirheissä tehokkaasti
- Korjata sovelluksen konfigurointiongelmia ja ympäristökohtaisia haasteita
- Toteuttaa valvonta- ja hälytysjärjestelmiä potentiaalisten ongelmien ennakoimiseksi
- Soveltaa parhaita käytäntöjä lokituksessa, virheenkorjauksessa ja ongelmanratkaisussa

## Pikadiagnostiikka

Ennen kuin siirryt yksittäisiin ongelmiin, suorita nämä komennot diagnostiikkatietojen keräämiseksi:

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

## Autentikointiongelmat

### Ongelma: "Failed to get access token"
**Oireet:**
- `azd up` epäonnistuu autentikointivirheiden vuoksi
- Komennot palauttavat "unauthorized" tai "access denied"

**Ratkaisut:**
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

### Ongelma: "Insufficient privileges" käyttöönoton aikana
**Oireet:**
- Käyttöönotto epäonnistuu käyttöoikeusvirheiden vuoksi
- Tiettyjä Azure-resursseja ei voi luoda

**Ratkaisut:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Ongelma: Multi-tenant autentikointiongelmat
**Ratkaisut:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Infrastruktuurin provisiointivirheet

### Ongelma: Resurssinimien ristiriidat
**Oireet:**
- "The resource name already exists" -virheet
- Käyttöönotto epäonnistuu resurssin luomisen aikana

**Ratkaisut:**
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

### Ongelma: Sijainti/alue ei ole käytettävissä
**Oireet:**
- "The location 'xyz' is not available for resource type"
- Tietyt SKU:t eivät ole saatavilla valitussa alueessa

**Ratkaisut:**
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

### Ongelma: Kiintiö ylitetty -virheet
**Oireet:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Ratkaisut:**
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

### Ongelma: Bicep-mallivirheet
**Oireet:**
- Mallin validointivirheet
- Syntaksivirheet Bicep-tiedostoissa

**Ratkaisut:**
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

## 🚀 Käyttöönoton epäonnistumiset

### Ongelma: Build-virheet
**Oireet:**
- Sovellus epäonnistuu rakentamisessa käyttöönoton aikana
- Pakettien asennusvirheet

**Ratkaisut:**
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

### Ongelma: Kontin käyttöönoton epäonnistumiset
**Oireet:**
- Konttisovellukset eivät käynnisty
- Kuvan latausvirheet

**Ratkaisut:**
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

### Ongelma: Tietokantayhteysvirheet
**Oireet:**
- Sovellus ei voi muodostaa yhteyttä tietokantaan
- Yhteyden aikakatkaisuvirheet

**Ratkaisut:**
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

## 🔧 Konfigurointiongelmat

### Ongelma: Ympäristömuuttujat eivät toimi
**Oireet:**
- Sovellus ei voi lukea konfigurointiarvoja
- Ympäristömuuttujat näyttävät tyhjiltä

**Ratkaisut:**
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

### Ongelma: SSL/TLS-sertifikaattiongelmat
**Oireet:**
- HTTPS ei toimi
- Sertifikaatin validointivirheet

**Ratkaisut:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Ongelma: CORS-konfigurointiongelmat
**Oireet:**
- Frontend ei voi kutsua API:a
- Cross-origin-pyyntö estetty

**Ratkaisut:**
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

## 🌍 Ympäristön hallinnan ongelmat

### Ongelma: Ympäristön vaihtamisongelmat
**Oireet:**
- Väärä ympäristö käytössä
- Konfigurointi ei vaihdu oikein

**Ratkaisut:**
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

### Ongelma: Ympäristön korruptio
**Oireet:**
- Ympäristö näyttää virheellisen tilan
- Resurssit eivät vastaa konfiguraatiota

**Ratkaisut:**
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

## 🔍 Suorituskykyongelmat

### Ongelma: Hitaat käyttöönottoajat
**Oireet:**
- Käyttöönotot kestävät liian kauan
- Aikakatkaisuja käyttöönoton aikana

**Ratkaisut:**
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

### Ongelma: Sovelluksen suorituskykyongelmat
**Oireet:**
- Hitaat vasteajat
- Korkea resurssien käyttö

**Ratkaisut:**
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

## 🛠️ Vianetsintätyökalut ja -komennot

### Virheenkorjauskomennot
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

### Lokianalyysi
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Resurssien tutkiminen
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Lisäavun saaminen

### Milloin eskaloida
- Autentikointiongelmat jatkuvat kaikkien ratkaisujen kokeilun jälkeen
- Infrastruktuuriongelmat Azure-palveluissa
- Laskutus- tai tilausongelmat
- Turvallisuushuolenaiheet tai -tapaukset

### Tukikanavat
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

### Kerättävät tiedot
Ennen tuen ottamista yhteyttä, kerää:
- `azd version` -tuloste
- `azd info` -tuloste
- Virheilmoitukset (koko teksti)
- Vaiheet ongelman toistamiseksi
- Ympäristön tiedot (`azd env show`)
- Aikajana, milloin ongelma alkoi

### Lokien keräysskripti
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

## 📊 Ongelman ehkäisy

### Tarkistuslista ennen käyttöönottoa
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

### Valvonnan asennus
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

### Säännöllinen ylläpito
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## Liittyvät resurssit

- [Virheenkorjausopas](debugging.md) - Edistyneet virheenkorjaustekniikat
- [Resurssien provisiointi](../deployment/provisioning.md) - Infrastruktuurin vianetsintä
- [Kapasiteettisuunnittelu](../pre-deployment/capacity-planning.md) - Resurssisuunnittelun ohjeet
- [SKU-valinta](../pre-deployment/sku-selection.md) - Palvelutason suositukset

---

**Vinkki**: Pidä tämä opas kirjanmerkeissä ja viittaa siihen aina, kun kohtaat ongelmia. Useimmat ongelmat ovat tuttuja ja niihin on olemassa vakiintuneet ratkaisut!

---

**Navigointi**
- **Edellinen oppitunti**: [Resurssien provisiointi](../deployment/provisioning.md)
- **Seuraava oppitunti**: [Virheenkorjausopas](debugging.md)

---

**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.