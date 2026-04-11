# Yleisiä ongelmia ja ratkaisuja

**Chapter Navigation:**
- **📚 Kurssin etusivu**: [AZD For Beginners](../../README.md)
- **📖 Nykyinen luku**: Luku 7 - Vianmääritys ja virheenkorjaus
- **⬅️ Previous Chapter**: [Luku 6: Ennen käyttöönottoa tehtävät tarkastukset](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Next**: [Vianetsintäopas](debugging.md)
- **🚀 Next Chapter**: [Luku 8: Tuotanto- ja yritysmallit](../chapter-08-production/production-ai-practices.md)

## Johdanto

Tämä kattava vianmääritysohje kattaa yleisimmin esiintyvät ongelmat Azure Developer CLI:n käytössä. Opit diagnosoimaan, vianmääritykset ja ratkaisemaan yleisiä ongelmia todennuksen, käyttöönoton, infrastruktuurin provisioinnin ja sovelluskonfiguraation osalta. Jokaisessa ongelmassa on yksityiskohtaiset oireet, juurisyyt ja vaiheittaiset korjausohjeet.

## Oppimistavoitteet

Tämän oppaan suorittamisen jälkeen osaat:
- Hallita diagnostiikkatekniikoita Azure Developer CLI -ongelmien selvittämiseksi
- Ymmärtää yleisiä todennus- ja oikeusongelmia sekä niiden ratkaisuja
- Ratkaista käyttöönoton virheitä, infrastruktuurin provisiointivirheitä ja konfiguraatio-ongelmia
- Toteuttaa ennakoivia valvonta- ja debuggausstrategioita
- Soveltaa systemaattisia vianmääritysmenetelmiä monimutkaisten ongelmien ratkaisuun
- Konfiguroida asianmukaisen lokituksen ja valvonnan estääksesi tulevia ongelmia

## Oppimistulokset

Suoritettuasi oppaan osaat:
- Diagnoisoida Azure Developer CLI -ongelmia sisäänrakennetuilla diagnostiikkatyökaluilla
- Ratkaista todennus-, tilaus- ja käyttöoikeuksiin liittyvät ongelmat itsenäisesti
- Vianmäärityä käyttöönoton epäonnistumiset ja infrastruktuurin provisiointivirheet tehokkaasti
- Debugata sovelluskonfiguraatio-ongelmia ja ympäristökohtaisia virheitä
- Toteuttaa valvontaa ja hälytyksiä tunnistaaksesi mahdolliset ongelmat ennakolta
- Soveltaa parhaita käytäntöjä lokituksen, debuggaamisen ja ongelmanratkaisutyönkulkuihin

## Nopeat diagnostiikkotarkastukset

Ennen kuin sukellat tiettyihin ongelmiin, suorita nämä komennot kerätäksesi diagnostiikkatietoja:

```bash
# Tarkista azd:n versio ja kunto
azd version
azd config show

# Varmista Azure-autentikointi
az account show
az account list

# Tarkista nykyinen ympäristö
azd env list
azd env get-values

# Ota virheenkorjauslokitus käyttöön
export AZD_DEBUG=true
azd <command> --debug
```

## Todennusongelmat

### Ongelma: "Failed to get access token"
**Oireet:**
- `azd up` epäonnistuu todennusvirheiden vuoksi
- Komennot palauttavat "unauthorized" tai "access denied"

**Ratkaisut:**
```bash
# 1. Kirjaudu uudelleen Azure CLI:llä
az login
az account show

# 2. Tyhjennä välimuistiin tallennetut tunnistetiedot
az account clear
az login

# 3. Käytä laitekoodivirtausta (päätteettömille järjestelmille)
az login --use-device-code

# 4. Aseta nimenomainen tilaus
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Ongelma: "Insufficient privileges" during deployment
**Oireet:**
- Käyttöönotto epäonnistuu oikeusvirheiden vuoksi
- Et voi luoda tiettyjä Azure-resursseja

**Ratkaisut:**
```bash
# 1. Tarkista Azure-roolimäärityksesi
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Varmista, että sinulla on vaaditut roolit
# - Contributor (resurssien luomista varten)
# - User Access Administrator (roolimäärityksiä varten)

# 3. Ota yhteyttä Azure-järjestelmänvalvojaasi saadaksesi tarvittavat käyttöoikeudet
```

### Ongelma: Moni-tenanttien todennusongelmat
**Ratkaisut:**
```bash
# 1. Kirjaudu sisään tietylle vuokralaiselle
az login --tenant "your-tenant-id"

# 2. Aseta vuokralainen kokoonpanoon
azd config set auth.tenantId "your-tenant-id"

# 3. Tyhjennä vuokralaisen välimuisti, jos vaihdat vuokralaisesta toiseen
az account clear
```

## 🏗️ Infrastruktuurin provisiointivirheet

### Ongelma: Resurssin nimen ristiriidat
**Oireet:**
- "The resource name already exists" -virheitä
- Käyttöönotto epäonnistuu resurssin luomisen aikana

**Ratkaisut:**
```bash
# 1. Käytä ainutlaatuisia resurssinimiä tunnisteiden avulla
# Bicep-mallissasi:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Muuta ympäristön nimeä
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Siivoa olemassa olevat resurssit
azd down --force --purge
```

### Ongelma: Sijainti/alue ei saatavilla
**Oireet:**
- "The location 'xyz' is not available for resource type"
- Tietyt SKU:t eivät ole saatavilla valitussa alueessa

**Ratkaisut:**
```bash
# 1. Tarkista resurssityyppien saatavilla olevat sijainnit
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Käytä yleisesti saatavilla olevia alueita
azd config set defaults.location eastus2
# tai
azd env set AZURE_LOCATION eastus2

# 3. Tarkista palveluiden saatavuus alueittain
# Vieraile: https://azure.microsoft.com/global-infrastructure/services/
```

### Ongelma: Kiintiön ylitysvirheet
**Oireet:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Ratkaisut:**
```bash
# 1. Tarkista nykyinen kiintiön käyttö
az vm list-usage --location eastus2 -o table

# 2. Pyydä kiintiön korotusta Azure-portaalin kautta
# Siirry kohtaan: Tilaukset > Käyttö ja kiintiöt

# 3. Käytä kehitykseen pienempiä SKUja
# Tiedostossa main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Siivoa käyttämättömät resurssit
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Ongelma: Bicep-mallivirheet
**Oireet:**
- Mallin validointivirheitä
- Syntaksivirheitä Bicep-tiedostoissa

**Ratkaisut:**
```bash
# 1. Tarkista Bicep-syntaksi
az bicep build --file infra/main.bicep

# 2. Käytä Bicep-linteriä
az bicep lint --file infra/main.bicep

# 3. Tarkista parametritiedoston syntaksi
cat infra/main.parameters.json | jq '.'

# 4. Esikatsele käyttöönoton muutoksia
azd provision --preview
```

## 🚀 Käyttöönoton epäonnistumiset

### Ongelma: Build failures
**Oireet:**
- Sovellus ei käänny käyttöönoton aikana
- Paketoinnin asennusvirheitä

**Ratkaisut:**
```bash
# 1. Tarkista rakennuksen tuloste debug-lipulla
azd deploy --service web --debug

# 2. Tarkastele käyttöönotetun palvelun tilaa
azd show

# 3. Testaa rakennus paikallisesti
cd src/web
npm install
npm run build

# 3. Tarkista Node.js- ja Python-versioiden yhteensopivuus
node --version  # Pitäisi vastata azure.yaml-tiedoston asetuksia
python --version

# 4. Tyhjennä rakennuksen välimuisti
rm -rf node_modules package-lock.json
npm install

# 5. Tarkista Dockerfile, jos käytössä on kontteja
docker build -t test-image .
docker run --rm test-image
```

### Ongelma: Container deployment failures
**Oireet:**
- Konttisovellukset eivät käynnisty
- Image pull -virheitä

**Ratkaisut:**
```bash
# 1. Testaa Docker-kuvan rakentaminen paikallisesti
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Tarkista säilöjen lokit Azure CLI:llä
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Seuraa sovellusta azd:n kautta
azd monitor --logs

# 3. Varmista pääsy säilörekisteriin
az acr login --name myregistry

# 4. Tarkista Container App -sovelluksen asetukset
az containerapp show --name my-app --resource-group my-rg
```

### Ongelma: Database connection failures
**Oireet:**
- Sovellus ei saa yhteyttä tietokantaan
- Yhteyden aikakatkaisuvirheitä

**Ratkaisut:**
```bash
# 1. Tarkista tietokannan palomuurisäännöt
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Testaa yhteyden toimivuus sovelluksesta
# Lisää sovellukseesi väliaikaisesti:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Varmista yhteysmerkkijonon muoto
azd env get-values | grep DATABASE

# 4. Tarkista tietokantapalvelimen tila
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Konfiguraatio-ongelmat

### Ongelma: Environment variables not working
**Oireet:**
- Sovellus ei lue konfiguraatioarvoja
- Ympäristömuuttujat näyttävät tyhjiltä

**Ratkaisut:**
```bash
# 1. Varmista, että ympäristömuuttujat on asetettu
azd env get-values
azd env get DATABASE_URL

# 2. Tarkista muuttujien nimet tiedostosta azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Käynnistä sovellus uudelleen
azd deploy --service web

# 4. Tarkista App Service -konfiguraatio
az webapp config appsettings list --name myapp --resource-group myrg
```

### Ongelma: SSL/TLS-sertifikaatio-ongelmat
**Oireet:**
- HTTPS ei toimi
- Sertifikaatin validointivirheitä

**Ratkaisut:**
```bash
# 1. Tarkista SSL-varmenteen tila
az webapp config ssl list --resource-group myrg

# 2. Ota käyttöön vain HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Lisää mukautettu verkkotunnus (tarvittaessa)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Ongelma: CORS-konfiguraatio-ongelmat
**Oireet:**
- Frontend ei pysty kutsumaan APIa
- Cross-origin -pyyntö estetty

**Ratkaisut:**
```bash
# 1. Määritä CORS App Service -palvelulle
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Päivitä API käsittelemään CORS:ia
# Express.js:ssä:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Tarkista, ajetaanko oikeilla URL-osoitteilla
azd show
```

## 🌍 Ympäristöhallinnan ongelmat

### Ongelma: Ympäristön vaihtamiseen liittyvät ongelmat
**Oireet:**
- Väärä ympäristö käytössä
- Konfiguraatio ei vaihdu oikein

**Ratkaisut:**
```bash
# 1. Listaa kaikki ympäristöt
azd env list

# 2. Valitse ympäristö nimenomaisesti
azd env select production

# 3. Tarkista nykyinen ympäristö
azd env list

# 4. Luo uusi ympäristö, jos se on korruptoitunut
azd env new production-new
azd env select production-new
```

### Ongelma: Ympäristön korruptoituminen
**Oireet:**
- Ympäristö näyttää virhetilassa olevalta
- Resurssit eivät vastaa konfiguraatiota

**Ratkaisut:**
```bash
# 1. Päivitä ympäristön tila
azd env refresh

# 2. Nollaa ympäristön konfiguraatio
azd env new production-reset
# Kopioi tarvittavat ympäristömuuttujat
azd env set DATABASE_URL "your-value"

# 3. Tuo olemassa olevat resurssit (jos mahdollista)
# Päivitä .azure/production/config.json manuaalisesti resurssitunnuksilla
```

## 🔍 Suorituskykyongelmat

### Ongelma: Hitaat käyttöönottoajat
**Oireet:**
- Käyttöönotot kestävät liian kauan
- Aikakatkaisuja käyttöönoton aikana

**Ratkaisut:**
```bash
# 1. Ota käyttöön tietyt palvelut nopeampaa iterointia varten
azd deploy --service web
azd deploy --service api

# 2. Käytä vain koodin käyttöönottoa, kun infrastruktuuri ei muutu
azd deploy  # Nopeampi kuin azd up

# 3. Optimoi rakennusprosessi
# package.json-tiedostossa:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Tarkista resurssien sijainnit (käytä samaa aluetta)
azd config set defaults.location eastus2
```

### Ongelma: Sovelluksen suorituskykyongelmat
**Oireet:**
- Hitaat vasteajat
- Korkea resurssinkulutus

**Ratkaisut:**
```bash
# 1. Skaalaa resursseja
# Päivitä SKU tiedostossa main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Ota Application Insights -valvonta käyttöön
azd monitor --overview

# 3. Tarkista sovelluksen lokit Azuresta
az webapp log tail --name myapp --resource-group myrg
# tai Container Appsille:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Ota välimuisti käyttöön
# Lisää Redis-välimuisti infrastruktuuriisi
```

## 🛠️ Vianmääritystyökalut ja -komennot

### Virheenkorjauskomennot
```bash
# Kattava virheenkorjaus
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Tarkista azd-versio
azd version

# Näytä nykyinen kokoonpano
azd config show

# Testaa yhteys
curl -v https://myapp.azurewebsites.net/health
```

### Lokien analysointi
```bash
# Sovelluksen lokit Azure CLI:n kautta
az webapp log tail --name myapp --resource-group myrg

# Valvo sovellusta azd:llä
azd monitor --logs
azd monitor --live

# Azure-resurssien lokit
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Konttien lokit (Container Appsille)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Resurssien tutkinta
```bash
# Luettele kaikki resurssit
az resource list --resource-group myrg -o table

# Tarkista resurssin tila
az webapp show --name myapp --resource-group myrg --query state

# Verkon diagnostiikka
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Lisäapu

### Milloin eskaloida
- Todennusongelmat jatkuvat kaikkien ratkaisujen kokeilemisen jälkeen
- Infrastruktuuriongelmat Azure-palveluissa
- Laskutus- tai tilaukseen liittyvät ongelmat
- Turvallisuusongelmat tai -tapaukset

### Tukikanavat
```bash
# 1. Tarkista Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Luo Azure-tukipyyntö
# Siirry: https://portal.azure.com -> Ohje ja tuki

# 3. Yhteisön resurssit
# - Stack Overflow: azure-developer-cli tunniste
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Kerättävät tiedot
Ennen tukipyynnön lähettämistä kerää:
- `azd version` output
- `azd config show` output
- `azd show` output (käynnissä olevan käyttöönoton tila)
- Virheilmoitukset (kokonainen teksti)
- Vaiheet ongelman toistamiseksi
- Ympäristötiedot (`azd env get-values`)
- Aikajana siitä, milloin ongelma alkoi

### Lokien keruuskirjoitus
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
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Ongelmien ennaltaehkäisy

### Ennen käyttöönottoa - tarkistuslista
```bash
# 1. Vahvista todennus
az account show

# 2. Tarkista kiintiöt ja rajoitukset
az vm list-usage --location eastus2

# 3. Vahvista mallipohjat
az bicep build --file infra/main.bicep

# 4. Testaa ensin paikallisesti
npm run build
npm run test

# 5. Käytä simuloituja käyttöönottoja
azd provision --preview
```

### Valvonnan asetukset
```bash
# Ota Application Insights käyttöön
# Lisää main.bicep-tiedostoon:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Määritä hälytykset
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Säännöllinen ylläpito
```bash
# Viikoittaiset terveystarkastukset
./scripts/health-check.sh

# Kuukausittainen kustannuskatsaus
az consumption usage list --billing-period-name 202401

# Neljännesvuosittainen turvallisuuskatsaus
az security assessment list --resource-group myrg
```

## Aiheeseen liittyvät resurssit

- [Vianetsintäopas](debugging.md) - Edistyneet vianetsintätekniikat
- [Resurssien provisiointi](../chapter-04-infrastructure/provisioning.md) - Infrastruktuurin vianmääritys
- [Kapasiteettisuunnittelu](../chapter-06-pre-deployment/capacity-planning.md) - Resurssien suunnittelun ohjeet
- [SKU-valinta](../chapter-06-pre-deployment/sku-selection.md) - Palvelutaso-suositukset

---

**Vinkki**: Tallenna tämä opas kirjanmerkkeihin ja palaa siihen aina, kun kohtaat ongelmia. Useimmat ongelmat ovat tuttuja ja niille on olemassa vakiintuneita ratkaisuja!

---

**Navigointi**
- **Previous Lesson**: [Resurssien provisiointi](../chapter-04-infrastructure/provisioning.md)
- **Next Lesson**: [Vianetsintäopas](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:

Tämä asiakirja on käännetty tekoälypohjaisella käännöspalvelulla [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattikäännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäiskielellä tulisi pitää auktoriteettisena lähteenä. Tärkeiden tietojen osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa mahdollisista väärinymmärryksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->