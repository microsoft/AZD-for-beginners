<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94de06ce1e81ee964b067f118211612f",
  "translation_date": "2025-11-21T15:49:50+00:00",
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
- **🚀 Seuraava luku**: [Luku 8: Tuotanto- ja yrityskäytännöt](../microsoft-foundry/production-ai-practices.md)

## Johdanto

Tämä kattava vianetsintäopas käsittelee yleisimpiä ongelmia Azure Developer CLI:n käytössä. Opit diagnosoimaan, ratkaisemaan ja korjaamaan yleisiä ongelmia, kuten autentikointia, käyttöönottoa, infrastruktuurin provisiointia ja sovelluksen konfigurointia. Jokainen ongelma sisältää yksityiskohtaiset oireet, juurisyyt ja vaiheittaiset ratkaisumenetelmät.

## Oppimistavoitteet

Tämän oppaan suorittamalla opit:
- Hallitsemaan diagnostisia tekniikoita Azure Developer CLI -ongelmien ratkaisemiseksi
- Ymmärtämään yleisiä autentikointi- ja käyttöoikeusongelmia sekä niiden ratkaisuja
- Korjaamaan käyttöönoton epäonnistumisia, infrastruktuurin provisiointivirheitä ja konfigurointiongelmia
- Toteuttamaan ennakoivaa seurantaa ja virheenkorjausstrategioita
- Soveltamaan systemaattisia vianetsintämenetelmiä monimutkaisten ongelmien ratkaisemiseksi
- Konfiguroimaan asianmukaisen lokituksen ja seurannan tulevien ongelmien ehkäisemiseksi

## Oppimistulokset

Oppaan suorittamisen jälkeen pystyt:
- Diagnosoimaan Azure Developer CLI -ongelmia sisäänrakennettujen diagnostisten työkalujen avulla
- Ratkaisemaan autentikointi-, tilaus- ja käyttöoikeusongelmat itsenäisesti
- Vianetsimään käyttöönoton epäonnistumisia ja infrastruktuurin provisiointivirheitä tehokkaasti
- Korjaamaan sovelluksen konfigurointiongelmia ja ympäristökohtaisia haasteita
- Toteuttamaan seurantaa ja hälytyksiä potentiaalisten ongelmien ennakoivaan tunnistamiseen
- Soveltamaan parhaita käytäntöjä lokitukseen, virheenkorjaukseen ja ongelmanratkaisutyönkulkuihin

## Nopea diagnostiikka

Ennen kuin siirryt yksittäisiin ongelmiin, suorita nämä komennot diagnostiikkatietojen keräämiseksi:

```bash
# Tarkista azd-versio ja tila
azd version
azd config list

# Vahvista Azure-todennus
az account show
az account list

# Tarkista nykyinen ympäristö
azd env show
azd env get-values

# Ota käyttöön virheenkorjauslokitus
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
# 1. Uudelleenkirjaudu Azure CLI:llä
az login
az account show

# 2. Tyhjennä välimuistissa olevat tunnistetiedot
az account clear
az login

# 3. Käytä laitekoodivirtausta (päättömille järjestelmille)
az login --use-device-code

# 4. Aseta eksplisiittinen tilaus
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Ongelma: "Insufficient privileges" käyttöönoton aikana
**Oireet:**
- Käyttöönotto epäonnistuu käyttöoikeusvirheiden vuoksi
- Tiettyjä Azure-resursseja ei voi luoda

**Ratkaisut:**
```bash
# 1. Tarkista Azure-roolisi määritykset
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Varmista, että sinulla on vaaditut roolit
# - Avustaja (resurssien luomiseen)
# - Käyttäjän pääsynvalvoja (roolimäärittelyihin)

# 3. Ota yhteyttä Azure-järjestelmänvalvojaasi saadaksesi oikeat käyttöoikeudet
```

### Ongelma: Multi-tenant autentikointiongelmat
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

### Ongelma: Resurssinimien ristiriidat
**Oireet:**
- "The resource name already exists" -virheet
- Käyttöönotto epäonnistuu resurssin luomisen aikana

**Ratkaisut:**
```bash
# 1. Käytä ainutlaatuisia resurssinimiä tunnisteiden kanssa
# Bicep-mallissasi:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Vaihda ympäristön nimi
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Poista olemassa olevat resurssit
azd down --force --purge
```

### Ongelma: Sijainti/alue ei ole käytettävissä
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

# 3. Tarkista palvelun saatavuus alueittain
# Käy: https://azure.microsoft.com/global-infrastructure/services/
```

### Ongelma: Kiintiö ylitetty -virheet
**Oireet:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Ratkaisut:**
```bash
# 1. Tarkista nykyinen kiintiön käyttö
az vm list-usage --location eastus2 -o table

# 2. Pyydä kiintiön korotusta Azure-portaalin kautta
# Siirry: Tilaukset > Käyttö + kiintiöt

# 3. Käytä pienempiä SKU:ita kehitykseen
# Tiedostossa main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Poista käyttämättömät resurssit
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Ongelma: Bicep-mallivirheet
**Oireet:**
- Mallin validointivirheet
- Syntaksivirheet Bicep-tiedostoissa

**Ratkaisut:**
```bash
# 1. Vahvista Bicep-syntaksi
az bicep build --file infra/main.bicep

# 2. Käytä Bicep-linteriä
az bicep lint --file infra/main.bicep

# 3. Tarkista parametrin tiedoston syntaksi
cat infra/main.parameters.json | jq '.'

# 4. Esikatsele käyttöönoton muutokset
azd provision --preview
```

## 🚀 Käyttöönoton epäonnistumiset

### Ongelma: Build-virheet
**Oireet:**
- Sovellus epäonnistuu rakentamisessa käyttöönoton aikana
- Pakettien asennusvirheet

**Ratkaisut:**
```bash
# 1. Tarkista rakennuslokit
azd logs --service web
azd deploy --service web --debug

# 2. Testaa rakennus paikallisesti
cd src/web
npm install
npm run build

# 3. Tarkista Node.js/Python-versioiden yhteensopivuus
node --version  # Pitäisi vastata azure.yaml-asetuksia
python --version

# 4. Tyhjennä rakennusvälimuisti
rm -rf node_modules package-lock.json
npm install

# 5. Tarkista Dockerfile, jos käytät kontteja
docker build -t test-image .
docker run --rm test-image
```

### Ongelma: Kontin käyttöönoton epäonnistumiset
**Oireet:**
- Konttisovellukset eivät käynnisty
- Kuvan latausvirheet

**Ratkaisut:**
```bash
# 1. Testaa Docker-rakennetta paikallisesti
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Tarkista säiliön lokit
azd logs --service api --follow

# 3. Varmista säiliörekisterin käyttöoikeus
az acr login --name myregistry

# 4. Tarkista säiliösovelluksen kokoonpano
az containerapp show --name my-app --resource-group my-rg
```

### Ongelma: Tietokantayhteyden epäonnistumiset
**Oireet:**
- Sovellus ei voi muodostaa yhteyttä tietokantaan
- Yhteyden aikakatkaisuvirheet

**Ratkaisut:**
```bash
# 1. Tarkista tietokannan palomuurisäännöt
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Testaa yhteys sovelluksesta
# Lisää sovellukseesi väliaikaisesti:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Varmista yhteysmerkkijonon muoto
azd env get-values | grep DATABASE

# 4. Tarkista tietokantapalvelimen tila
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Konfigurointiongelmat

### Ongelma: Ympäristömuuttujat eivät toimi
**Oireet:**
- Sovellus ei voi lukea konfigurointiarvoja
- Ympäristömuuttujat näyttävät tyhjiltä

**Ratkaisut:**
```bash
# 1. Varmista, että ympäristömuuttujat on asetettu
azd env get-values
azd env get DATABASE_URL

# 2. Tarkista muuttujien nimet azure.yaml-tiedostossa
cat azure.yaml | grep -A 5 env:

# 3. Käynnistä sovellus uudelleen
azd deploy --service web

# 4. Tarkista sovelluspalvelun kokoonpano
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

# 2. Ota käyttöön vain HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Lisää mukautettu verkkotunnus (tarvittaessa)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Ongelma: CORS-konfigurointiongelmat
**Oireet:**
- Frontend ei voi kutsua API:a
- Cross-origin-pyyntö estetty

**Ratkaisut:**
```bash
# 1. Määritä CORS App Serviceä varten
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Päivitä API käsittelemään CORS
# Express.js:ssä:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Tarkista, että suoritetaan oikeilla URL-osoitteilla
azd show
```

## 🌍 Ympäristön hallinnan ongelmat

### Ongelma: Ympäristön vaihtamisen ongelmat
**Oireet:**
- Väärä ympäristö käytössä
- Konfigurointi ei vaihdu oikein

**Ratkaisut:**
```bash
# 1. Luettele kaikki ympäristöt
azd env list

# 2. Valitse ympäristö nimenomaisesti
azd env select production

# 3. Vahvista nykyinen ympäristö
azd env show

# 4. Luo uusi ympäristö, jos se on vioittunut
azd env new production-new
azd env select production-new
```

### Ongelma: Ympäristön korruptio
**Oireet:**
- Ympäristö näyttää virheellisen tilan
- Resurssit eivät vastaa konfiguraatiota

**Ratkaisut:**
```bash
# 1. Päivitä ympäristön tila
azd env refresh

# 2. Nollaa ympäristön asetukset
azd env new production-reset
# Kopioi tarvittavat ympäristömuuttujat
azd env set DATABASE_URL "your-value"

# 3. Tuo olemassa olevat resurssit (jos mahdollista)
# Päivitä käsin .azure/production/config.json resurssitunnuksilla
```

## 🔍 Suorituskykyongelmat

### Ongelma: Hitaat käyttöönottoajat
**Oireet:**
- Käyttöönotot kestävät liian kauan
- Aikakatkaisuja käyttöönoton aikana

**Ratkaisut:**
```bash
# 1. Ota käyttöön rinnakkaiset käyttöönotot
azd config set deploy.parallelism 5

# 2. Käytä inkrementaalisia käyttöönottoja
azd deploy --incremental

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

# 2. Ota käyttöön Application Insights -seuranta
azd monitor

# 3. Tarkista sovelluslokit pullonkaulojen varalta
azd logs --service api --follow

# 4. Toteuta välimuisti
# Lisää Redis-välimuisti infrastruktuuriisi
```

## 🛠️ Vianetsintätyökalut ja -komennot

### Virheenkorjauskomennot
```bash
# Kattava virheenkorjaus
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Tarkista järjestelmän tiedot
azd info

# Vahvista kokoonpano
azd config validate

# Testaa yhteys
curl -v https://myapp.azurewebsites.net/health
```

### Lokianalyysi
```bash
# Sovelluksen lokit
azd logs --service web --follow
azd logs --service api --since 1h

# Azure-resurssien lokit
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Konttilokit (Container Appsille)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Resurssien tutkiminen
```bash
# Luettele kaikki resurssit
az resource list --resource-group myrg -o table

# Tarkista resurssin tila
az webapp show --name myapp --resource-group myrg --query state

# Verkkodiagnostiikka
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Lisäavun saaminen

### Milloin eskaloida
- Autentikointiongelmat jatkuvat kaikkien ratkaisujen kokeilun jälkeen
- Infrastruktuuriongelmat Azure-palveluiden kanssa
- Laskutus- tai tilausongelmat
- Turvallisuuteen liittyvät huolenaiheet tai tapahtumat

### Tukikanavat
```bash
# 1. Tarkista Azure-palvelun tila
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Luo Azure-tukipyyntö
# Siirry: https://portal.azure.com -> Ohje + tuki

# 3. Yhteisön resurssit
# - Stack Overflow: azure-developer-cli tunniste
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
# kerää-debug-tiedot.sh

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
# 1. Vahvista todennus
az account show

# 2. Tarkista kiintiöt ja rajat
az vm list-usage --location eastus2

# 3. Vahvista mallipohjat
az bicep build --file infra/main.bicep

# 4. Testaa ensin paikallisesti
npm run build
npm run test

# 5. Käytä kuivakäynnistysasennuksia
azd provision --preview
```

### Seurannan asennus
```bash
# Ota käyttöön Application Insights
# Lisää main.bicep-tiedostoon:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Aseta hälytykset
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

## Liittyvät resurssit

- [Virheenkorjausopas](debugging.md) - Edistyneet virheenkorjaustekniikat
- [Resurssien provisiointi](../deployment/provisioning.md) - Infrastruktuurin vianetsintä
- [Kapasiteettisuunnittelu](../pre-deployment/capacity-planning.md) - Resurssisuunnittelun ohjeet
- [SKU-valinta](../pre-deployment/sku-selection.md) - Palvelutason suositukset

---

**Vinkki**: Pidä tämä opas kirjanmerkeissä ja viittaa siihen aina, kun kohtaat ongelmia. Useimmat ongelmat ovat tuttuja ja niille on olemassa vakiintuneet ratkaisut!

---

**Navigointi**
- **Edellinen oppitunti**: [Resurssien provisiointi](../deployment/provisioning.md)
- **Seuraava oppitunti**: [Virheenkorjausopas](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->