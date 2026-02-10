# Microsoft SQL -tietokannan ja verkkosovelluksen käyttöönotto AZD:llä

⏱️ **Arvioitu aika**: 20-30 minuuttia | 💰 **Arvioidut kustannukset**: ~$15-25/kk | ⭐ **Vaativuus**: Keskitaso

Tämä **täydellinen, toimiva esimerkki** näyttää, miten käyttää [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) ottaaksesi Python Flask -verkkosovelluksen Microsoft SQL -tietokannan kanssa käyttöön Azureen. Kaikki koodi sisältyy ja on testattu—ei ulkoisia riippuvuuksia vaadittu.

## Mitä opit

Tästä esimerkistä opit:
- Ottamaan käyttöön monikerroksisen sovelluksen (verkkosovellus + tietokanta) infrastruktuurin koodina
- Konfiguroimaan turvalliset tietokantayhteydet ilman kovakoodattuja salaisuuksia
- Valvomaan sovelluksen tilaa Application Insightsin avulla
- Hallinnoimaan Azure-resursseja tehokkaasti AZD CLI:llä
- Noudattamaan Azuren parhaita käytäntöjä tietoturvan, kustannusten optimoinnin ja observabilityn osalta

## Skenaarion yleiskatsaus
- **Web App**: Python Flask -REST-API tietokantayhteydellä
- **Database**: Azure SQL Database esimerkkidatalla
- **Infrastructure**: Provisionoitu Bicepillä (modulaariset, uudelleenkäytettävät mallipohjat)
- **Deployment**: Täysin automatisoitu `azd`-komennoilla
- **Monitoring**: Application Insights lokitusta ja telemetriaa varten

## Esivaatimukset

### Tarvittavat työkalut

Ennen aloittamista varmista, että seuraavat työkalut ovat asennettuina:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versio 2.50.0 tai uudempi)
   ```sh
   az --version
   # Odotettu tulostus: azure-cli 2.50.0 tai uudempi
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versio 1.0.0 tai uudempi)
   ```sh
   azd version
   # Odotettu tulostus: azd versio 1.0.0 tai uudempi
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (paikallista kehitystä varten)
   ```sh
   python --version
   # Odotettu tuloste: Python 3.8 tai uudempi
   ```

4. **[Docker](https://www.docker.com/get-started)** (valinnainen, paikalliseen konttipohjaiseen kehitykseen)
   ```sh
   docker --version
   # Odotettu tuloste: Dockerin versio 20.10 tai uudempi
   ```

### Azure-vaatimukset

- Aktiivinen **Azure-tilaus** ([luo ilmainen tili](https://azure.microsoft.com/free/))
- Oikeudet luoda resursseja tilaukseesi
- **Owner** tai **Contributor** -rooli tilauksessa tai resurssiryhmässä

### Tietovaatimukset

Tämä on **keskitasoinen** esimerkki. Sinun tulisi olla perehtynyt:
- Perus komentorivitoimintoihin
- Peruskäsitteisiin pilvessä (resurssit, resurssiryhmät)
- Peruskäsitykseen verkkosovelluksista ja tietokannoista

**Uusi AZD?** Aloita ensin [Aloitusopas](../../docs/chapter-01-foundation/azd-basics.md).

## Arkkitehtuuri

Tämä esimerkki ottaa käyttöön kaksikerroksisen arkkitehtuurin, joka sisältää verkkosovelluksen ja SQL-tietokannan:

```
┌─────────────────┐        ┌──────────────────────┐
│  User Browser   │◄──────►│   Azure Web App      │
└─────────────────┘        │   (Flask API)        │
                           │   - /health          │
                           │   - /products        │
                           └──────────┬───────────┘
                                      │
                                      │ Secure Connection
                                      │ (Encrypted)
                                      │
                           ┌──────────▼───────────┐
                           │ Azure SQL Database   │
                           │   - Products table   │
                           │   - Sample data      │
                           └──────────────────────┘
```

**Resurssien käyttöönotto:**
- **Resurssiryhmä**: Kaikkien resurssien säiliö
- **App Service Plan**: Linux-pohjainen isännöinti (B1-taso kustannustehokkuuden vuoksi)
- **Web App**: Python 3.11 -ajoalusta ja Flask-sovellus
- **SQL Server**: Hallittu tietokantapalvelin, vähintään TLS 1.2
- **SQL Database**: Basic-taso (2GB, sopii kehitykseen/testaukseen)
- **Application Insights**: Valvonta ja lokitus
- **Log Analytics Workspace**: Keskitetty lokisäilytys

**Vertaus**: Ajattele tätä ravintolana (verkkosovellus) ja walk-in -pakastimena (tietokanta). Asiakkaat tilaavat menusta (API-päätepisteet), ja keittiö (Flask-sovellus) hakee ainekset (data) pakastimesta. Ravintolan johtaja (Application Insights) seuraa kaikkea tapahtuvaa.

## Hakemistorakenne

Kaikki tiedostot sisältyvät tähän esimerkkiin—ei ulkoisia riippuvuuksia vaadittu:

```
examples/database-app/
│
├── README.md                    # This file
├── azure.yaml                   # AZD configuration file
├── .env.sample                  # Sample environment variables
├── .gitignore                   # Git ignore patterns
│
├── infra/                       # Infrastructure as Code (Bicep)
│   ├── main.bicep              # Main orchestration template
│   ├── abbreviations.json      # Azure naming conventions
│   └── resources/              # Modular resource templates
│       ├── sql-server.bicep    # SQL Server configuration
│       ├── sql-database.bicep  # Database configuration
│       ├── app-service-plan.bicep  # Hosting plan
│       ├── app-insights.bicep  # Monitoring setup
│       └── web-app.bicep       # Web application
│
└── src/
    └── web/                    # Application source code
        ├── app.py              # Flask REST API
        ├── requirements.txt    # Python dependencies
        └── Dockerfile          # Container definition
```

**Mitä kukin tiedosto tekee:**
- **azure.yaml**: Ilmoittaa AZD:lle, mitä ottaa käyttöön ja mihin
- **infra/main.bicep**: Ohjaa kaikkien Azure-resurssien käyttöönottoa
- **infra/resources/*.bicep**: Yksittäiset resurssimääritykset (modulaarisia uudelleenkäyttöä varten)
- **src/web/app.py**: Flask-sovellus, jossa tietokantalogiikka
- **requirements.txt**: Python-pakettien riippuvuudet
- **Dockerfile**: Ohjeet konttien rakentamiseen ja käyttöönottoon

## Nopea aloitus (askel askeleelta)

### Vaihe 1: Kloonaa ja siirry hakemistoon

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Onnistumistarkistus**: Varmista, että näet `azure.yaml` ja `infra/`-kansion:
```sh
ls
# Odotetut: README.md, azure.yaml, infra/, src/
```

### Vaihe 2: Todennus Azureen

```sh
azd auth login
```

Tämä avaa selaimen Azure-todennusta varten. Kirjaudu Azure-tunnuksillasi.

**✓ Onnistumistarkistus**: Sinun pitäisi nähdä:
```
Logged in to Azure.
```

### Vaihe 3: Alusta ympäristö

```sh
azd init
```

**Mitä tapahtuu**: AZD luo paikallisen konfiguraation käyttöönotollesi.

**Näytettävät kehotteet**:
- **Ympäristön nimi**: Anna lyhyt nimi (esim. `dev`, `myapp`)
- **Azure-tilaus**: Valitse tilauksesi listalta
- **Azure-sijainti**: Valitse alue (esim. `eastus`, `westeurope`)

**✓ Onnistumistarkistus**: Näet:
```
SUCCESS: New project initialized!
```

### Vaihe 4: Ota Azure-resurssit käyttöön

```sh
azd provision
```

**Mitä tapahtuu**: AZD ottaa käyttöön kaiken infrastruktuurin (kestää 5–8 minuuttia):
1. Luo resurssiryhmän
2. Luo SQL-palvelimen ja tietokannan
3. Luo App Service Planin
4. Luo Web Appin
5. Luo Application Insightsin
6. Konfiguroi verkotus ja turvallisuus

**Sinulta kysytään**:
- **SQL-järjestelmänvalvojan käyttäjänimi**: Anna käyttäjänimi (esim. `sqladmin`)
- **SQL-järjestelmänvalvojan salasana**: Anna vahva salasana (tallenna tämä!)

**✓ Onnistumistarkistus**: Näet:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Aika**: 5-8 minuuttia

### Vaihe 5: Ota sovellus käyttöön

```sh
azd deploy
```

**Mitä tapahtuu**: AZD rakentaa ja ottaa käyttöön Flask-sovelluksesi:
1. Pakkaa Python-sovellus
2. Rakentaa Docker-kontin
3. Työntää Azure Web Appiin
4. Alustaa tietokannan esimerkkidatalla
5. Käynnistää sovelluksen

**✓ Onnistumistarkistus**: Näet:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Aika**: 3-5 minuuttia

### Vaihe 6: Selaa sovellusta

```sh
azd browse
```

Tämä avaa selainikkunan, jossa on käyttöön otettu web-sovelluksesi osoitteessa `https://app-<unique-id>.azurewebsites.net`

**✓ Onnistumistarkistus**: Näet JSON-tulosteen:
```json
{
  "message": "Welcome to the Database App API",
  "endpoints": {
    "/": "This help message",
    "/health": "Health check endpoint",
    "/products": "List all products",
    "/products/<id>": "Get product by ID"
  }
}
```

### Vaihe 7: Testaa API-päätepisteet

**Terveystarkistus** (varmista tietokantayhteys):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Odotettu vastaus**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**Tuotelista** (esimerkkidata):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Odotettu vastaus**:
```json
[
  {
    "id": 1,
    "name": "Laptop",
    "description": "High-performance laptop",
    "price": 1299.99,
    "created_at": "2025-11-19T10:30:00"
  },
  ...
]
```

**Hae yksittäinen tuote**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Onnistumistarkistus**: Kaikki päätepisteet palauttavat JSON-dataa ilman virheitä.

---

**🎉 Onneksi olkoon!** Olet onnistuneesti ottanut käyttöön web-sovelluksen ja tietokannan Azureen käyttäen AZD:ä.

## Konfiguraation syväluotaus

### Ympäristömuuttujat

Salaisuuksia hallitaan turvallisesti Azure App Servicen konfiguraation kautta—**ei koskaan kovakoodattu lähdekoodiin**.

**AZD konfiguroi automaattisesti**:
- `SQL_CONNECTION_STRING`: Tietokantayhteys salatuilla tunnistetiedoilla
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Monitoroinnin telemetriapäätepiste
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Mahdollistaa automaattisen riippuvuuksien asennuksen

**Missä salaisuuksia säilytetään**:
1. Kun suoritat `azd provision`, annat SQL-tunnistetiedot turvallisten kehotteiden kautta
2. AZD tallentaa nämä paikalliseen `.azure/<env-name>/.env` -tiedostoon (gitin ulkopuolella)
3. AZD lisää ne Azure App Service -konfiguraatioon (salattuna levossa)
4. Sovellus lukee ne ajonaikaisesti `os.getenv()`-kutsun kautta

### Paikallinen kehitys

Paikallista testausta varten luo `.env`-tiedosto mallista:

```sh
cp .env.sample .env
# Muokkaa .env-tiedostoa paikallisella tietokantayhteydelläsi
```

**Paikallisen kehityksen työnkulku**:
```sh
# Asenna riippuvuudet
cd src/web
pip install -r requirements.txt

# Aseta ympäristömuuttujat
export SQL_CONNECTION_STRING="your-local-connection-string"

# Käynnistä sovellus
python app.py
```

**Testaa paikallisesti**:
```sh
curl http://localhost:8000/health
# Odotettu: {"status": "healthy", "database": "connected"}
```

### Infrastruktuuri koodina

Kaikki Azure-resurssit määritellään **Bicep-malleissa** (`infra/`-kansio):

- **Modulaarinen rakenne**: Jokaisella resurssityypillä on oma tiedosto uudelleenkäyttöä varten
- **Parametroitavissa**: Mukauta SKUja, alueita, nimeämiskäytäntöjä
- **Parhaat käytännöt**: Noudata Azure-nimeämisstandardeja ja turvallisuusasetuksia
- **Versionhallittu**: Infrastruktuurimuutoksia seurataan Gitissä

**Muokkausesimerkki**:
Vaihdaaksesi tietokannan tasoa, muokkaa `infra/resources/sql-database.bicep`-tiedostoa:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Turvallisuuden parhaat käytännöt

Tämä esimerkki noudattaa Azure-tietoturvan parhaita käytäntöjä:

### 1. **Ei salaisuuksia lähdekoodissa**
- ✅ Tunnistetiedot tallennettu Azure App Service -konfiguraatioon (salattu)
- ✅ `.env`-tiedostot poissuljettu Gitistä `.gitignore`-tiedoston avulla
- ✅ Salaisuudet välitetään turvallisina parametreina provisoinnin aikana

### 2. **Salatut yhteydet**
- ✅ TLS 1.2 vähintään SQL-palvelimelle
- ✅ HTTPS vaaditaan Web-sovellukselle
- ✅ Tietokantayhteydet käyttävät salattuja kanavia

### 3. **Verkkoturvallisuus**
- ✅ SQL-palvelimen palomuuri on konfiguroitu sallimaan vain Azure-palvelut
- ✅ Julkinen verkkoyhteys rajoitettu (voidaan tiukentaa Private Endpoints -ratkaisuilla)
- ✅ FTPS poistettu käytöstä Web-sovelluksessa

### 4. **Todennus ja valtuutus**
- ⚠️ **Tällä hetkellä**: SQL-todennus (käyttäjänimi/salasana)
- ✅ **Suositus tuotantoon**: Käytä Azure Managed Identityä salasanattomaan todennukseen

**Päivittääksesi Managed Identityyn** (tuotantoa varten):
1. Ota hallittu identiteetti käyttöön Web-sovelluksessa
2. Myönnä identiteetille SQL-oikeudet
3. Päivitä yhteyden merkkijono käyttämään hallittua identiteettiä
4. Poista salasanaperusteinen todennus

### 5. **Tarkastus ja vaatimustenmukaisuus**
- ✅ Application Insights kirjaa kaikki pyynnöt ja virheet
- ✅ SQL-tietokannan tarkastus käytössä (voidaan konfiguroida vaatimustenmukaisuutta varten)
- ✅ Kaikki resurssit tunnisteistettu hallintaa varten

**Turvallisuustarkistuslista ennen tuotantoa**:
- [ ] Ota käyttöön Azure Defender for SQL
- [ ] Konfiguroi Private Endpoints SQL-tietokannalle
- [ ] Ota käyttöön Web Application Firewall (WAF)
- [ ] Ota käyttöön Azure Key Vault salaisuuksien kierrätykseen
- [ ] Määritä Azure AD -todennus
- [ ] Ota diagnostiikkaloki käyttöön kaikille resursseille

## Kustannusten optimointi

**Arvioidut kuukausikustannukset** (tilanne marraskuu 2025):

| Resurssi | SKU/Taso | Arvioidut kustannukset |
|----------|----------|------------------------|
| App Service Plan | B1 (Basic) | ~$13/kk |
| SQL Database | Basic (2GB) | ~$5/kk |
| Application Insights | Pay-as-you-go | ~$2/kk (vähäinen liikenne) |
| **Yhteensä** | | **~$20/kk** |

**💡 Kustannussäästövinkkejä**:

1. **Käytä ilmaista tasoa oppimiseen**:
   - App Service: F1-taso (ilmainen, rajatut tunnit)
   - SQL-tietokanta: Käytä Azure SQL Database serverless -vaihtoehtoa
   - Application Insights: 5GB/kk ilmaista sisäänottoa

2. **Pysäytä resurssit, kun niitä ei käytetä**:
   ```sh
   # Pysäytä verkkosovellus (tietokannasta veloitetaan edelleen)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Käynnistä uudelleen tarvittaessa
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Poista kaikki testauksen jälkeen**:
   ```sh
   azd down
   ```
   Tämä poistaa KAIKKI resurssit ja lopettaa veloitukset.

4. **Kehitys vs. Tuotannon SKU:t**:
   - **Kehitys**: Basic-taso (käytetty tässä esimerkissä)
   - **Tuotanto**: Standard-/Premium-tasot redundanssilla

**Kustannusten seuranta**:
- Tarkastele kustannuksia [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Aseta kustannushälytykset yllätyksien välttämiseksi
- Merkitse kaikki resurssit seurantaa varten tunnisteella `azd-env-name`

**Ilmaisen tason vaihtoehto**:
Oppimistarkoituksiin voit muokata `infra/resources/app-service-plan.bicep`-tiedostoa:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Huom**: Ilmaistason rajoituksia (60 min/pv CPU, ei aina-päällä).

## Valvonta ja havaittavuus

### Application Insights -integrointi

Tämä esimerkki sisältää **Application Insights**-integraation kattavaa valvontaa varten:

**Mitä valvotaan**:
- ✅ HTTP-pyynnöt (viiveet, tilakoodit, päätepisteet)
- ✅ Sovelluksen virheet ja poikkeukset
- ✅ Mukautetut lokit Flask-sovelluksesta
- ✅ Tietokantayhteyden tila
- ✅ Suorituskykymittarit (CPU, muisti)

**Pääsy Application Insightsiin**:
1. Avaa [Azure Portal](https://portal.azure.com)
2. Siirry resurssiryhmääsi (`rg-<env-name>`)
3. Klikkaa Application Insights -resurssia (`appi-<unique-id>`)

**Hyödylliset kyselyt** (Application Insights → Logs):

**Näytä kaikki pyynnöt**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Etsi virheitä**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Tarkista health-päätepiste**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### SQL-tietokannan tarkastus

**SQL-tietokannan tarkastus on käytössä** seuraavien seurantaan:
- Tietokantakäyttömallit
- Epäonnistuneet kirjautumisyritykset
- Skeeman muutokset
- Datan käyttö (vaatimustenmukaisuutta varten)

**Pääsy tarkastuslokitietoihin**:
1. Azure Portal → SQL Database → Auditing
2. Tarkastele lokitietoja Log Analytics -työtilassa

### Reaaliaikainen valvonta

**Näytä live-mittarit**:
1. Application Insights → Live Metrics
2. Näe pyynnöt, virheet ja suorituskyky reaaliajassa

**Määritä hälytykset**:
Luo hälytyksiä kriittisille tapahtumille:
- HTTP 500 -virheitä > 5 viidessä minuutissa
- Tietokantayhteyksien epäonnistumiset
- Korkeat vasteajat (>2 sekuntia)

**Esimerkkihälytyksen luominen**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Vianmääritys

### Yleiset ongelmat ja ratkaisut

#### 1. `azd provision` epäonnistuu virheellä "Location not available"

**Oire**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Ratkaisu**:
Valitse toinen Azure-alue tai rekisteröi resurssitoimittaja:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. SQL-yhteys epäonnistuu käyttöönoton aikana

**Oire**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Ratkaisu**:
- Varmista, että SQL Serverin palomuuri sallii Azure-palvelut (määritetään automaattisesti)
- Tarkista, että SQL-järjestelmänvalvojan salasana syötettiin oikein `azd provision` -komennon aikana
- Varmista, että SQL Server on täysin provisionoitu (voi kestää 2-3 minuuttia)

**Tarkista yhteys**:
```sh
# Azure-portaalista siirry SQL Database → Kyselyeditoriin
# Yritä muodostaa yhteys tunnuksillasi
```

#### 3. Web-sovellus näyttää "Application Error"

**Oire**:
Selain näyttää yleisen virhesivun.

**Ratkaisu**:
Tarkista sovelluksen lokit:
```sh
# Näytä viimeisimmät lokit
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Yleisiä syitä**:
- Puuttuvat ympäristömuuttujat (tarkista App Service → Asetukset)
- Python-pakettien asennus epäonnistui (tarkista käyttöönoton lokit)
- Tietokannan alustuksen virhe (tarkista SQL-yhteydet)

#### 4. `azd deploy` epäonnistuu virheellä "Build Error"

**Oire**:
```
Error: Failed to build project
```

**Ratkaisu**:
- Varmista, että `requirements.txt` ei sisällä syntaksivirheitä
- Tarkista, että Python 3.11 on määritelty tiedostossa `infra/resources/web-app.bicep`
- Varmista, että Dockerfile käyttää oikeaa pohjakuvaa

**Vianmääritys paikallisesti**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Unauthorized" AZD-komentojen suorittamisen aikana

**Oire**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Ratkaisu**:
Kirjaudu uudelleen Azureen:
```sh
azd auth login
az login
```

Varmista, että sinulla on oikeat käyttöoikeudet (Contributor-rooli) tilauksessa.

#### 6. Korkeat tietokantakustannukset

**Oire**:
Odottamaton Azure-lasku.

**Ratkaisu**:
- Tarkista, unohditko suorittaa `azd down` testauksen jälkeen
- Varmista, että SQL Database käyttää Basic-tasoa (ei Premiumia)
- Tarkista kustannukset Azure Cost Management -palvelussa
- Ota käyttöön kustannusilmoitukset

### Hanki apua

**Näytä kaikki AZD-ympäristömuuttujat**:
```sh
azd env get-values
```

**Tarkista käyttöönoton tila**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Avaa sovelluksen lokit**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Tarvitsetko lisäapua?**
- [AZD-vianmääritysohje](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Azure App Servicen vianmääritys](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL -vianmääritys](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Käytännön harjoitukset

### Harjoitus 1: Varmista käyttöönotto (Aloittelija)

**Tavoite**: Varmista, että kaikki resurssit on otettu käyttöön ja sovellus toimii.

**Vaiheet**:
1. Listaa kaikki resurssit resurssiryhmästäsi:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Odotettu**: 6-7 resources (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Testaa kaikki API-päätepisteet:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Odotettu**: Kaikki palauttavat kelvollista JSONia ilman virheitä

3. Tarkista Application Insights:
   - Siirry Application Insightsiin Azure-portaalissa
   - Siirry "Live Metrics" -kohtaan
   - Päivitä selaimesi web-sovelluksessa
   **Odotettu**: Näet pyyntöjen ilmestyvän reaaliaikaisesti

**Onnistumisen kriteerit**: Kaikki 6-7 resurssia ovat olemassa, kaikki päätepisteet palauttavat dataa, Live Metrics näyttää toimintaa.

---

### Harjoitus 2: Lisää uusi API-päätepiste (Keskitaso)

**Tavoite**: Laajenna Flask-sovellusta uudella päätepisteellä.

**Aloituskoodi**: Nykyiset päätepisteet tiedostossa `src/web/app.py`

**Vaiheet**:
1. Muokkaa `src/web/app.py`-tiedostoa ja lisää uusi päätepiste `get_product()`-funktion jälkeen:
   ```python
   @app.route('/products/search/<keyword>')
   def search_products(keyword):
       """Search products by name or description."""
       try:
           conn = get_db_connection()
           cursor = conn.cursor()
           cursor.execute(
               "SELECT id, name, description, price, created_at FROM products WHERE name LIKE ? OR description LIKE ?",
               (f'%{keyword}%', f'%{keyword}%')
           )
           
           products = []
           for row in cursor.fetchall():
               products.append({
                   'id': row[0],
                   'name': row[1],
                   'description': row[2],
                   'price': float(row[3]) if row[3] else None,
                   'created_at': row[4].isoformat() if row[4] else None
               })
           
           cursor.close()
           conn.close()
           
           logger.info(f"Search for '{keyword}' returned {len(products)} results")
           return jsonify(products), 200
           
       except Exception as e:
           logger.error(f"Error searching products: {str(e)}")
           return jsonify({'error': str(e)}), 500
   ```

2. Ota päivitetty sovellus käyttöön:
   ```sh
   azd deploy
   ```

3. Testaa uutta päätepistettä:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Odotettu**: Palauttaa tuotteet, jotka vastaavat hakua "laptop"

**Onnistumisen kriteerit**: Uusi päätepiste toimii, palauttaa suodatetut tulokset, näkyy Application Insights -lokissa.

---

### Harjoitus 3: Lisää monitorointi ja hälytykset (Edistynyt)

**Tavoite**: Ota käyttöön proaktiivinen monitorointi hälytyksineen.

**Vaiheet**:
1. Luo hälytys HTTP 500 -virheille:
   ```sh
   # Hae Application Insights -resurssin tunnus
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Luo hälytys
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Laukaise hälytys aiheuttamalla virheitä:
   ```sh
   # Pyydä olematonta tuotetta
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Tarkista, laukesiko hälytys:
   - Azure-portaali → Alerts → Alert Rules
   - Tarkista sähköpostisi (jos määritetty)

**Onnistumisen kriteerit**: Hälytyssääntö on luotu, se laukee virheissä, ilmoitukset vastaanotetaan.

---

### Harjoitus 4: Tietokannan skeeman muutokset (Edistynyt)

**Tavoite**: Lisää uusi taulu ja muokkaa sovellusta käyttämään sitä.

**Vaiheet**:
1. Yhdistä SQL-tietokantaan Azure-portaalin Query Editorin kautta

2. Luo uusi `categories`-taulu:
   ```sql
   CREATE TABLE categories (
       id INT PRIMARY KEY IDENTITY(1,1),
       name NVARCHAR(50) NOT NULL,
       description NVARCHAR(200)
   );
   
   INSERT INTO categories (name, description) VALUES
   ('Electronics', 'Electronic devices and accessories'),
   ('Office Supplies', 'Office equipment and supplies');
   
   -- Add category to products table
   ALTER TABLE products ADD category_id INT;
   UPDATE products SET category_id = 1; -- Set all to Electronics
   ```

3. Päivitä `src/web/app.py` sisällyttämään kategoriatiedot vastauksiin

4. Ota käyttöön ja testaa

**Onnistumisen kriteerit**: Uusi taulu on olemassa, tuotteet näyttävät kategoriatiedot, sovellus toimii edelleen.

---

### Harjoitus 5: Ota välimuisti käyttöön (Asiantuntija)

**Tavoite**: Lisää Azure Redis Cache suorituskyvyn parantamiseksi.

**Vaiheet**:
1. Lisää Redis Cache tiedostoon `infra/main.bicep`
2. Päivitä `src/web/app.py` välimuistittamaan tuotepyyntöjä
3. Mittaa suorituskyvyn parannus Application Insightsin avulla
4. Vertaa vasteaikoja ennen ja jälkeen välimuistittamisen

**Onnistumisen kriteerit**: Redis on otettu käyttöön, välimuisti toimii, vasteajat paranevat yli 50 %.

**Vinkki**: Aloita [Azure Cache for Redis -dokumentaatiosta](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Siivous

To avoid ongoing charges, delete all resources when done:

```sh
azd down
```

**Vahvistuskehotus**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Kirjoita `y` vahvistaaksesi.

**✓ Onnistumisen tarkistus**: 
- Kaikki resurssit on poistettu Azure-portaalista
- Ei jatkuvia kuluja
- Paikallinen `.azure/<env-name>`-kansio voidaan poistaa

**Vaihtoehto** (pidä infrastruktuuri, poista data):
```sh
# Poista vain resurssiryhmä (säilytä AZD-määritys)
az group delete --name rg-<env-name> --yes
```
## Lisätietoja

### Asiaankuuluva dokumentaatio
- [Azure Developer CLI -dokumentaatio](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database -dokumentaatio](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service -dokumentaatio](https://learn.microsoft.com/azure/app-service/)
- [Application Insights -dokumentaatio](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep-kielen viite](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Seuraavat askeleet tässä kurssissa
- **[Container Apps -esimerkki](../../../../examples/container-app)**: Ota käyttöön mikropalveluja Azure Container Appsin avulla
- **[AI-integraatio-opas](../../../../docs/ai-foundry)**: Lisää AI-ominaisuuksia sovellukseesi
- **[Käyttöönoton parhaat käytännöt](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Tuotantokäyttöönoton mallit

### Edistyneet aiheet
- **Hallinnoitu identiteetti**: Poista salasanat ja käytä Azure AD -todennusta
- **Yksityiset päätepisteet**: Turvaa tietokantayhteydet virtuaaliverkon sisällä
- **CI/CD-integraatio**: Automatisoi käyttöönotot GitHub Actionsilla tai Azure DevOpsilla
- **Moniympäristö**: Määritä kehitys-, esikatselu- ja tuotantoympäristöt
- **Tietokantasiirrot**: Käytä Alembicia tai Entity Frameworkia skeeman versionhallintaan

### Vertailu muihin lähestymistapoihin

**AZD vs. ARM-mallit**:
- ✅ AZD: Korkeamman tason abstraktio, yksinkertaisemmat komennot
- ⚠️ ARM: Monimutkaisempi, yksityiskohtaisempi hallinta

**AZD vs. Terraform**:
- ✅ AZD: Azure-spesifinen, integroituna Azure-palveluihin
- ⚠️ Terraform: Usean pilven tuki, laajempi ekosysteemi

**AZD vs. Azure Portal**:
- ✅ AZD: Toistettava, versionhallittu, automatisoitavissa
- ⚠️ Portal: Manuaaliset klikkaukset, vaikea toistaa

**Ajattele AZD:tä näin**: Docker Compose Azurelle—yksinkertaistettu konfigurointi monimutkaisille käyttöönotolle.

---

## Usein kysytyt kysymykset

**K: Voinko käyttää eri ohjelmointikieltä?**  
V: Kyllä! Korvaa `src/web/` Node.js:llä, C#:lla, Go:lla tai millä tahansa kielellä. Päivitä `azure.yaml` ja Bicep vastaavasti.

**K: Kuinka lisään lisää tietokantoja?**  
V: Lisää toinen SQL Database -moduuli tiedostoon `infra/main.bicep` tai käytä PostgreSQL/MySQL:ää Azure Database -palveluista.

**K: Voinko käyttää tätä tuotannossa?**  
V: Tämä on lähtökohta. Tuotantoon lisättävä: hallinnoitu identiteetti, yksityiset päätepisteet, redundanssi, varmistusstrategia, WAF ja laajennettu monitorointi.

**K: Entä jos haluan käyttää kontteja koodin käyttöönoton sijaan?**  
V: Katso [Container Apps -esimerkki](../../../../examples/container-app), joka käyttää Docker-kontteja koko sovelluksessa.

**K: Kuinka yhdistän tietokantaan paikalliselta koneeltani?**  
V: Lisää IP-osoitteesi SQL Serverin palomuuriin:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**K: Voinko käyttää olemassa olevaa tietokantaa uuden luomisen sijaan?**  
V: Kyllä, muokkaa `infra/main.bicep` viittaamaan olemassa olevaan SQL Serveriin ja päivitä yhteysmerkkijonon parametrit.

---

> **Huom:** Tämä esimerkki esittelee parhaat käytännöt web-sovelluksen käyttöönottoon tietokannan kanssa AZD:llä. Siihen sisältyy toimiva koodi, kattava dokumentaatio ja käytännön harjoituksia oppimisen vahvistamiseksi. Tuotantokäyttöönottoa varten tarkista organisaatiollesi spesifit turvallisuus-, skaalaus-, vaatimustenmukaisuus- ja kustannusvaatimukset.

**📚 Kurssin navigointi:**
- ← Edellinen: [Container Apps -esimerkki](../../../../examples/container-app)
- → Seuraava: [AI-integraatio-opas](../../../../docs/ai-foundry)
- 🏠 [Kurssin etusivu](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastuuvapauslauseke:
Tämä asiakirja on käännetty tekoälykäännöspalvelulla Co-op Translator (https://github.com/Azure/co-op-translator). Pyrimme tarkkuuteen, mutta huomioithan, että automaattikäännöksissä voi esiintyä virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulee pitää määräävänä lähteenä. Tärkeiden tietojen osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai virheellisistä tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->