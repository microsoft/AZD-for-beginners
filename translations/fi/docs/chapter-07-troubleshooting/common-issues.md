# Yleisiä ongelmia ja ratkaisuja

**Luku Navigointi:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 7 - Vianmääritys ja virheiden korjaus
- **⬅️ Edellinen luku**: [Luku 6: Ennen lentoonlähtöä tarkistukset](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Seuraava**: [Vianmäärityksen opas](debugging.md)
- **🚀 Seuraava luku**: [Luku 8: Tuotantoympäristön ja yrityskäytännöt](../chapter-08-production/production-ai-practices.md)

## Johdanto

Tämä kattava vianmääritysohje kattaa useimmin esiintyvät ongelmat Azure Developer CLI:n käytössä. Opit diagnosoimaan, vianmääräämään ja ratkaisemaan yleisiä ongelmia todennusongelmissa, käyttöönotossa, infrastruktuurin provisioinnissa ja sovelluksen konfiguraatiossa. Jokaisen ongelman yhteydessä on yksityiskohtaiset oireet, juurisyyt ja vaiheittaiset ratkaisutoimenpiteet.

## Oppimistavoitteet

Tämän oppaan suorittamalla:
- Hallitset Azure Developer CLI -ongelmien diagnosointitekniikat
- Ymmärrät yleiset todennus- ja käyttöoikeusongelmat ja niiden ratkaisut
- Ratkaiset käyttöönottovirheet, infrastruktuurin provisiointivirheet ja konfiguraatio-ongelmat
- Toteutat ennakoivia valvonta- ja vianmääritysstrategioita
- Käytät systemaattisia vianmääritysmenetelmiä monimutkaisiin ongelmiin
- Konfiguroit asianmukaisen kirjaamisen ja valvonnan tulevien ongelmien välttämiseksi

## Oppimistulokset

Suoritettuasi oppaan pystyt:
- Diagnosoimaan Azure Developer CLI -ongelmia sisäänrakennettujen diagnostiikkatyökalujen avulla
- Ratkaisemaan todennus-, tilaus- ja käyttöoikeuksiin liittyvät ongelmat itsenäisesti
- Vianmääräämään käyttöönottovirheitä ja infrastruktuurin provisiointivirheitä tehokkaasti
- Virheenkorjaamaan sovelluksen konfiguraatio-ongelmia ja ympäristökohtaisia ongelmia
- Toteuttamaan valvontaa ja hälytyksiä mahdollisten ongelmien ennakoimiseksi
- Soveltamaan parhaita käytäntöjä kirjaamisessa, virheenkorjauksessa ja ongelmanratkaisuprosesseissa

## Pikadiagnostiikka

> Korvaa esimerkkinimet/ID:t oman ympäristösi arvoilla. Bash, Bicep, JavaScript ja parametrien tiedostokatkelmat on merkitty erikseen alla; ne eivät ole yksi suoritettava skripti. Tarkista tuhoisat toiminnot ja sensuroi salaisuudet ennen diagnostiikan jakamista. `azd monitor --logs` avaa selaimen; se ei suoratoista terminaalin lokitietoja.

Ennen kuin sukellat erityisiin ongelmiin, suorita nämä komennot kerätäksesi diagnostiikkatiedot:

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

## Todennusongelmat

### Ongelma: "Failed to get access token" (Epäonnistui pääsytunnuksen saannissa)
**Oireet:**
- `azd up` epäonnistuu todennusvirheisiin
- Komennot palauttavat "luvattua" tai "pääsy evätty"

**Ratkaisut:**
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

### Ongelma: "Insufficient privileges" (Riittämättömät oikeudet) käyttöönoton aikana
**Oireet:**
- Käyttöönotto epäonnistuu käyttöoikeusvirheisiin
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

### Ongelma: Monivuokraaja-todennusongelmat
**Ratkaisut:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Infrastruktuurin provisiointivirheet

### Ongelma: Resurssin nimi ristiriidassa
**Oireet:**
- "Resurssin nimi on jo olemassa" -virheitä
- Käyttöönotto epäonnistuu resurssin luonnin aikana

**Ratkaisut:**
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

### Ongelma: Sijaintia/Aluetta ei ole saatavilla
**Oireet:**
- "Sijaintia 'xyz' ei ole saatavilla resurstyyppiin" -viesti
- Tietyt SKU:t eivät ole saatavilla valitussa alueessa

**Ratkaisut:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Sijaintimuuttujan vaihtaminen ei siirrä olemassa olevia resursseja. Olemassa oleva resurssiryhmä tai resurssi saattaa hylätä sijainnin muutoksen; käytä erillistä ympäristöä alueelliseen uudelleenasennukseen.

### Ongelma: Kiintiön ylittyminen (Quota exceeded)
**Oireet:**
- "Kiintiö ylittynyt resurssityypille"
- "Maksimimäärä resursseja saavutettu"

**Ratkaisut:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

Kehitystä varten valitse tuettu pienempi SKU `infra/main.parameters.json`:

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

### Ongelma: Bicep-mallivirheet
**Oireet:**
- Mallin validointivirheitä
- Syntaksivirheitä Bicep-tiedostoissa

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

## 🚀 Käyttöönottovirheet

### Ongelma: Rakennusvirheet
**Oireet:**
- Sovellus epäonnistuu käännettäessä käyttöönoton aikana
- Pakettien asennusvirheitä

**Ratkaisut:**
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

### Ongelma: Konttikäyttöönoton virheet
**Oireet:**
- Konttisovellukset eivät käynnisty
- Kuvan noutovirheitä

**Ratkaisut:**
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

### Ongelma: Tietokantayhteyksien epäonnistuminen
**Oireet:**
- Sovellus ei pääse tietokantaan
- Yhteyden aikakatkaisuvirheitä

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

## 🔧 Konfiguraatio-ongelmat

### Ongelma: Ympäristömuuttujat eivät toimi
**Oireet:**
- Sovellus ei lue konfiguraatioarvoja
- Ympäristömuuttujat näyttävät tyhjiltä

**Ratkaisut:**
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

### Ongelma: SSL/TLS-sertifikaattiongelmat
**Oireet:**
- HTTPS ei toimi
- Sertifikaatin validointivirheitä

**Ratkaisut:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Ongelma: CORS-konfiguraatio-ongelmat
**Oireet:**
- Frontend ei voi kutsua API:a
- Cross-origin-pyyntö estetty

**Ratkaisut:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. Päivitä olemassa oleva Express-sovelluksesi (johon `cors` on tuotu):

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

## 🌍 Ympäristön hallintaongelmat

### Ongelma: Ympäristön vaihtamisongelmat
**Oireet:**
- Käytetään väärää ympäristöä
- Konfiguraatio ei vaihdu oikein

**Ratkaisut:**
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

### Ongelma: Ympäristön vioittuminen
**Oireet:**
- Ympäristö näyttää virhetilaa
- Resurssit eivät vastaa konfiguraatiota

**Ratkaisut:**
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

## 🔍 Suorituskykyongelmat

### Ongelma: Hitautta käyttöönotossa
**Oireet:**
- Käyttöönottoprosessit kestävät liian kauan
- Aikakatkaisuja käytön aikana

**Ratkaisut:**
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

### Ongelma: Sovelluksen suorituskykyongelmat
**Oireet:**
- Hitaat vasteajat
- Korkea resurssien käyttö

**Ratkaisut:**
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

## 🛠️ Vianmääritystyökalut ja komennot

### Virheenkorjauskomennot
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

### Lokien analyysi
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

### Resurssien tutkiminen
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Lisäavun hankkiminen

### Milloin eskaloida
- Todennusongelmat jatkuvat kaikkien ratkaisuyritysten jälkeen
- Infrastruktuuriongelmat Azure-palveluissa
- Laskutus- tai tilausongelmat
- Turvallisuushuomiot tai -tapaukset

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
Ennen tukipalveluun ottamista yhteyttä, kerää:
- `azd version` tuloste
- `azd config show` tuloste
- `azd show` tuloste (käyttöönottotilanne)
- Virheilmoitukset (täydellinen teksti)
- Vaiheet ongelman toistamiseksi
- Sensuroidut ympäristötiedot (älä koskaan jaa raakaa `azd env get-values`, joka voi sisältää salaisuuksia)
- Aikajana ongelman alkamisajankohdalle

### Lokien keräysskripti
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

## 📊 Ongelmien ennaltaehkäisy

### Ennen käyttöönottoa tarkistuslista
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

### Valvonnan asetus
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

### Säännöllinen ylläpito
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## Liittyvät resurssit

- [Vianmäärityksen opas](debugging.md) - Edistyneet vianmääritystekniikat
- [Resurssien provisiointi](../chapter-04-infrastructure/provisioning.md) - Infrastruktuurin vianmääritys
- [Kapasiteetin suunnittelu](../chapter-06-pre-deployment/capacity-planning.md) - Resurssien suunnittelun ohjeet
- [SKU:n valinta](../chapter-06-pre-deployment/sku-selection.md) - Palvelutason suositukset

---

**Vinkki**: Pidä tämä opas kirjanmerkkinä ja käytä sitä aina, kun kohtaat ongelmia. Useimmat ongelmat ovat jo käyneet läpi ja niihin on olemassa vakiintuneet ratkaisut!

---

**Navigointi**
- **Edellinen oppitunti**: [Resurssien provisiointi](../chapter-04-infrastructure/provisioning.md)
- **Seuraava oppitunti**: [Vianmäärityksen opas](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->