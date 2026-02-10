# Yleiset ongelmat ja ratkaisut

**Luvun navigointi:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 7 - Vianmääritys ja virheenkorjaus
- **⬅️ Edellinen luku**: [Luku 6: Esilennon tarkistukset](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Seuraava**: [Virheenkorjausopas](debugging.md)
- **🚀 Seuraava luku**: [Luku 8: Tuotanto- ja yritysmallit](../chapter-08-production/production-ai-practices.md)

## Johdanto

Tämä kattava vianmääritysopas käsittelee yleisimmin esiintyviä ongelmia Azure Developer CLI:n käytössä. Opettele diagnosoimaan, vianmääräämään ja ratkaisemaan yleisiä ongelmia todennuksessa, käyttöönotossa, infrastruktuurin provisioinnissa ja sovelluksen konfiguroinnissa. Jokaisen ongelman kohdalla on yksityiskohtaiset oireet, juurisyyt ja vaiheittaiset korjausohjeet.

## Oppimistavoitteet

Tämän oppaan suorittamisen jälkeen:
- Hallita Azure Developer CLI:n ongelmien diagnostiikkatekniikat
- Ymmärtää yleiset todennus- ja käyttöoikeusongelmat sekä niiden ratkaisut
- Ratkaista käyttöönoton epäonnistumiset, infrastruktuurin provisiointivirheet ja konfiguraatio-ongelmat
- Ottaa käyttöön ennakoivat valvonta- ja virheenkorjausstrategiat
- Soveltaa systemaattisia vianmääritysmenetelmiä monimutkaisiin ongelmiin
- Konfiguroida asianmukainen lokitus ja valvonta estämään tulevia ongelmia

## Oppimistulokset

Suoritettuasi tämän oppaan osaat:
- Diagnosoida Azure Developer CLI -ongelmia sisäänrakennetuilla diagnostiikkatyökaluilla
- Ratkaista todennus-, tilaus- ja käyttöoikeuksiin liittyvät ongelmat itsenäisesti
- Vianmäärittää käyttöönoton epäonnistumisia ja infrastruktuurin provisiointivirheitä tehokkaasti
- Virheenkorjata sovelluksen konfiguraatio-ongelmia ja ympäristökohtaisia ongelmia
- Ottaa käyttöön valvonta ja hälytykset potentiaalisten ongelmien ennakoivaan havaitsemiseen
- Soveltaa parhaita käytäntöjä lokitukseen, virheenkorjaukseen ja ongelmanratkaisuprosesseihin

## Nopeat diagnoosit

Ennen kuin siirryt tiettyihin ongelmiin, suorita nämä komennot kerätäksesi diagnostiikkatietoja:

```bash
# Tarkista azd:n versio ja kunto
azd version
azd config list

# Varmista Azure-autentikointi
az account show
az account list

# Tarkista nykyinen ympäristö
azd env show
azd env get-values

# Ota debug-lokitus käyttöön
export AZD_DEBUG=true
azd <command> --debug
```

## Todennusongelmat

### Ongelma: "Käyttöoikeustunnuksen hakeminen epäonnistui"
**Oireet:**
- `azd up` epäonnistuu todennusvirheiden vuoksi
- Virheilmoitukset näyttävät "valtuuttamaton" tai "pääsy estetty"

**Ratkaisut:**
```bash
# Kirjaudu uudelleen Azure CLI:llä
az login
az account show

# Tyhjennä välimuistiin tallennetut tunnistetiedot
az account clear
az login

# Käytä laitekoodivirtausta (päätteettömiin järjestelmiin)
az login --use-device-code

# Aseta nimenomainen tilaus
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Ongelma: "Riittämättömät käyttöoikeudet" käyttöönoton aikana
**Oireet:**
- Käyttöönotto epäonnistuu käyttöoikeusvirheiden takia
- Ei voi luoda tiettyjä Azure-resursseja

**Ratkaisut:**
```bash
# 1. Tarkista Azure-roolisi ja niiden määritykset
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Varmista, että sinulla on vaaditut roolit
# - Contributor (resurssien luomista varten)
# - User Access Administrator (roolimäärityksiä varten)

# 3. Ota yhteyttä Azure-järjestelmänvalvojaasi saadaksesi tarvittavat oikeudet
```

### Ongelma: Monivuokralaisautentikoinnin ongelmat
**Ratkaisut:**
```bash
# 1. Kirjaudu sisään tietyn vuokralaisen kanssa
az login --tenant "your-tenant-id"

# 2. Aseta vuokralainen asetuksiin
azd config set auth.tenantId "your-tenant-id"

# 3. Tyhjennä vuokralaisen välimuisti, jos vaihdetaan vuokralaisia
az account clear
```

## 🏗️ Infrastruktuurin provisiointivirheet

### Ongelma: Resurssin nimen ristiriidat
**Oireet:**
- "Resurssin nimi on jo olemassa" -virheet
- Käyttöönotto epäonnistuu resurssia luotaessa

**Ratkaisut:**
```bash
# 1. Käytä ainutlaatuisia resurssinimiä tunnisteiden avulla
# Bicep-mallissasi:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Vaihda ympäristön nimi
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Siivoa olemassa olevat resurssit
azd down --force --purge
```

### Ongelma: Sijainti/Alue ei ole saatavilla
**Oireet:**
- "Sijainti 'xyz' ei ole saatavilla kyseiselle resurssityypille"
- Tietyt SKU:t eivät ole saatavilla valitulla alueella

**Ratkaisut:**
```bash
# 1. Tarkista resurssityyppien saatavilla olevat sijainnit
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Käytä yleisesti saatavilla olevia alueita
azd config set defaults.location eastus2
# tai
azd env set AZURE_LOCATION eastus2

# 3. Tarkista palveluiden saatavuus alueittain
# Käy osoitteessa: https://azure.microsoft.com/global-infrastructure/services/
```

### Ongelma: Kiintiöiden ylittymisvirheet
**Oireet:**
- "Kiintiö ylittyi resurssityypille"
- "Suurin sallittu resurssien määrä saavutettu"

**Ratkaisut:**
```bash
# 1. Tarkista nykyinen kvotan käyttö
az vm list-usage --location eastus2 -o table

# 2. Pyydä kvotan korotusta Azure-portaalin kautta
# Siirry kohtaan: Tilaukset > Käyttö + kvotat

# 3. Käytä kehityksessä pienempiä SKU:ja
# Tiedostossa main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Siivoa käyttämättömät resurssit
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Ongelma: Bicep-mallin virheet
**Oireet:**
- Mallin validointivirheet
- Syntaksivirheitä Bicep-tiedostoissa

**Ratkaisut:**
```bash
# 1. Tarkista Bicep-syntaksi
az bicep build --file infra/main.bicep

# 2. Käytä Bicep-linteriä
az bicep lint --file infra/main.bicep

# 3. Tarkista parametritiedoston syntaksi
cat infra/main.parameters.json | jq '.'

# 4. Esikatsele käyttöönoton muutokset
azd provision --preview
```

## 🚀 Käyttöönoton epäonnistumiset

### Ongelma: Käännösvirheet
**Oireet:**
- Sovelluksen kääntäminen epäonnistuu käyttöönoton aikana
- Pakettien asennusvirheet

**Ratkaisut:**
```bash
# 1. Tarkista buildin tuloste debug-lipulla
azd deploy --service web --debug

# 2. Tarkastele käyttöönotetun palvelun tilaa
azd show

# 3. Testaa build paikallisesti
cd src/web
npm install
npm run build

# 3. Tarkista Node.js:n ja Pythonin versioiden yhteensopivuus
node --version  # Should match azure.yaml settings
python --version

# 4. Tyhjennä buildin välimuisti
rm -rf node_modules package-lock.json
npm install

# 5. Tarkista Dockerfile, jos käytät kontteja
docker build -t test-image .
docker run --rm test-image
```

### Ongelma: Säiliöjen käyttöönoton epäonnistumiset
**Oireet:**
- Säiliösovellukset eivät käynnisty
- Virheitä säiliökuvan hakemisessa

**Ratkaisut:**
```bash
# 1. Testaa Docker-kuvan rakentaminen paikallisesti
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Tarkista konttien lokit Azure CLI:llä
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Seuraa sovellusta azd:n kautta
azd monitor --logs

# 3. Varmista pääsy konttirekisteriin
az acr login --name myregistry

# 4. Tarkista Container App -sovelluksen asetukset
az containerapp show --name my-app --resource-group my-rg
```

### Ongelma: Tietokantayhteyksien epäonnistumiset
**Oireet:**
- Sovellus ei pysty yhdistämään tietokantaan
- Yhteyden aikakatkaisut

**Ratkaisut:**
```bash
# 1. Tarkista tietokannan palomuurisäännöt
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Testaa yhteyttä sovelluksesta
# Lisää sovellukseesi väliaikaisesti:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Varmista yhteysmerkkijonon muoto
azd env get-values | grep DATABASE

# 4. Tarkista tietokantapalvelimen tila
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Konfiguraatio-ongelmat

### Ongelma: Ympäristömuuttujat eivät toimi
**Oireet:**
- Sovellus ei pysty lukemaan konfiguraatioarvoja
- Ympäristömuuttujat näyttävät tyhjiltä

**Ratkaisut:**
```bash
# 1. Varmista, että ympäristömuuttujat on asetettu
azd env get-values
azd env get DATABASE_URL

# 2. Tarkista muuttujien nimet tiedostossa azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Käynnistä sovellus uudelleen
azd deploy --service web

# 4. Tarkista App Service -palvelun asetukset
az webapp config appsettings list --name myapp --resource-group myrg
```

### Ongelma: SSL/TLS-sertifikaattiongelmat
**Oireet:**
- HTTPS ei toimi
- Sertifikaatin validointivirheet

**Ratkaisut:**
```bash
# 1. Tarkista SSL-sertifikaatin tila
az webapp config ssl list --resource-group myrg

# 2. Salli vain HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Lisää mukautettu verkkotunnus (tarvittaessa)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Ongelma: CORS-konfiguraatio-ongelmat
**Oireet:**
- Frontend ei pysty kutsumaan APIa
- Ristiin alkuperän (CORS) pyyntö estetty

**Ratkaisut:**
```bash
# 1. Määritä CORS App Service -palvelulle
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Päivitä API käsittelemään CORS-pyyntöjä
# Express.js-ympäristössä:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Tarkista, ajetaanko oikeilla URL-osoitteilla
azd show
```

## 🌍 Ympäristön hallinnan ongelmat

### Ongelma: Ympäristön vaihtamisongelmat
**Oireet:**
- Käytössä on väärä ympäristö
- Konfiguraatio ei vaihdu oikein

**Ratkaisut:**
```bash
# 1. Listaa kaikki ympäristöt
azd env list

# 2. Valitse ympäristö nimenomaisesti
azd env select production

# 3. Tarkista nykyinen ympäristö
azd env show

# 4. Luo uusi ympäristö, jos se on vioittunut
azd env new production-new
azd env select production-new
```

### Ongelma: Ympäristön korruptoituminen
**Oireet:**
- Ympäristö näyttää virhetilassa
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
# Päivitä manuaalisesti .azure/production/config.json resurssien ID:illä
```

## 🔍 Suorituskykyongelmat

### Ongelma: Hitaat käyttöönottoajat
**Oireet:**
- Käyttöönotot vievät liian kauan
- Aikakatkaisuja käyttöönoton aikana

**Ratkaisut:**
```bash
# 1. Ota käyttöön tietyt palvelut nopeampaa iterointia varten
azd deploy --service web
azd deploy --service api

# 2. Käytä pelkkää koodin käyttöönottoa, kun infrastruktuuri ei muutu
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
- Korkea resurssien käyttö

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
# tai Container Apps -sovelluksille:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Ota välimuisti käyttöön
# Lisää Redis-välimuisti infrastruktuuriisi
```

## 🛠️ Vianmääritystyökalut ja komennot

### Virheenkorjauskomennot
```bash
# Kattava virheenkorjaus
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Tarkista azd-versio
azd version

# Näytä nykyinen konfiguraatio
azd config list

# Testaa yhteys
curl -v https://myapp.azurewebsites.net/health
```

### Lokien analyysi
```bash
# Sovelluksen lokit Azure CLI:n kautta
az webapp log tail --name myapp --resource-group myrg

# Valvo sovellusta azd:llä
azd monitor --logs
azd monitor --live

# Azuren resurssilokit
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Konttien lokit (Container Apps -sovelluksille)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Resurssien tutkiminen
```bash
# Listaa kaikki resurssit
az resource list --resource-group myrg -o table

# Tarkista resurssin tila
az webapp show --name myapp --resource-group myrg --query state

# Verkon diagnostiikka
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Lisäavun saaminen

### Milloin eskaloida
- Todennusongelmat jatkuvat kaikkien ratkaisujen kokeilemisen jälkeen
- Infrastruktuuriin liittyvät ongelmat Azure-palveluissa
- Laskutukseen tai tilaukseen liittyvät ongelmat
- Tietoturvahuolet tai -tapaukset

### Tukikanavat
```bash
# 1. Tarkista Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Luo Azure-tukipyyntö
# Siirry osoitteeseen: https://portal.azure.com -> Ohje ja tuki

# 3. Yhteisön resurssit
# - Stack Overflow: tunniste azure-developer-cli
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Kerättävät tiedot
Ennen tukipyynnön tekemistä, kerää:
- `azd version` -komennon tuloste
- `azd config list` -komennon tuloste
- `azd show` -komennon tuloste (nykyisen käyttöönoton tila)
- Virheilmoitukset (koko teksti)
- Vaiheet ongelman toistamiseksi
- Ympäristötiedot (`azd env show`)
- Aikajana, milloin ongelma alkoi

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
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Ongelmien ennaltaehkäisy

### Ennen käyttöönottoa - tarkistuslista
```bash
# 1. Varmista todennus
az account show

# 2. Tarkista kiintiöt ja rajoitukset
az vm list-usage --location eastus2

# 3. Tarkista mallipohjat
az bicep build --file infra/main.bicep

# 4. Testaa ensin paikallisesti
npm run build
npm run test

# 5. Käytä kuivaharjoituskäyttöönottoja
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

## Asiaan liittyvät resurssit

- [Virheenkorjausopas](debugging.md) - Edistyneet virheenkorjaustekniikat
- [Resurssien provisiointi](../chapter-04-infrastructure/provisioning.md) - Infrastruktuurin vianmääritys
- [Kapasiteettisuunnittelu](../chapter-06-pre-deployment/capacity-planning.md) - Resurssien suunnittelun ohjeet
- [SKU-valinta](../chapter-06-pre-deployment/sku-selection.md) - Palvelutason suositukset

---

**Vinkki**: Pidä tämä opas kirjanmerkissä ja palaa siihen aina kohdatessasi ongelmia. Suurin osa ongelmista on jo nähty aiemmin ja niille on olemassa vakiintuneita ratkaisuja!

---

**Navigointi**
- **Edellinen oppitunti**: [Resurssien provisiointi](../chapter-04-infrastructure/provisioning.md)
- **Seuraava oppitunti**: [Virheenkorjausopas](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastuuvapauslauseke:
Tämä asiakirja on käännetty tekoälypohjaisella käännöspalvelulla Co-op Translator (https://github.com/Azure/co-op-translator). Vaikka pyrimme täsmällisyyteen, huomioithan, että automatisoiduissa käännöksissä voi esiintyä virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäiskielellä tulee pitää virallisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa mahdollisista väärinkäsityksistä tai virheellisistä tulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->