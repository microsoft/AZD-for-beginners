# Deploying a Microsoft SQL Database and Web App with AZD

⏱️ **Arvioitu aika**: 20–30 minuuttia | 💰 **Arvioidut kustannukset**: ~15–25 $/kk | ⭐ **Monimutkaisuus**: Keskitaso

Tämä **täydellinen, toimiva esimerkki** näyttää, miten käyttää [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) -työkalua Python Flask -web-sovelluksen ja Microsoft SQL -tietokannan julkaisuun Azureen. Kaikki koodi on mukana ja testattu—ei ulkoisia riippuvuuksia.

## Mitä opit

Tämän esimerkin suorittamalla:
- Julkaiset monikerroksisen sovelluksen (web-sovellus + tietokanta) infrastruktuurina-koodina
- Määrität turvalliset tietokantayhteydet ilman kovakoodattuja salaisuuksia
- Seuraat sovelluksen terveyttä Application Insightsin avulla
- Hallitset Azuren resursseja tehokkaasti azd CLI:llä
- Seuraat Azuren parhaita käytäntöjä turvallisuudessa, kustannusoptimoinnissa ja observabilityssä

## Tapausseloste
- **Web-sovellus**: Python Flask REST API tietokantayhteydellä
- **Tietokanta**: Azure SQL Database esimerkkidatalla
- **Infrastruktuuri**: Provisionoidaan Bicepillä (modulaariset, uudelleenkäytettävät template:t)
- **Julkaisu**: Täysin automatisoitu `azd`-komennoilla
- **Monitoring**: Application Insights lokitukseen ja telemetriaan

## Esivaatimukset

### Vaaditut työkalut

Ennen aloittamista varmista, että sinulla on asennettuna nämä työkalut:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versio 2.50.0 tai uudempi)
   ```sh
   az --version
   # Odotettu tulostus: azure-cli 2.50.0 tai uudempi
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versio 1.0.0 tai uudempi)
   ```sh
   azd version
   # Odotettu tuloste: azd-versio 1.0.0 tai uudempi
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (paikalliseen kehitykseen)
   ```sh
   python --version
   # Odotettu tuloste: Python 3.8 tai uudempi
   ```

4. **[Docker](https://www.docker.com/get-started)** (valinnainen, paikalliseen konttikehitykseen)
   ```sh
   docker --version
   # Odotettu tulostus: Docker-versio 20.10 tai uudempi
   ```

### Azure-vaatimukset

- Aktiivinen **Azure-tilaus** ([luo ilmainen tili](https://azure.microsoft.com/free/))
- Oikeudet luoda resursseja tililläsi
- **Owner** tai **Contributor** -rooli tilauksessa tai resurssiryhmässä

### Tietopohja

Tämä on **keskitasoinen** esimerkki. Sinun tulisi tuntea:
- Peruskäyttö komentorivillä
- Pilvipalvelun peruskäsitteet (resurssit, resurssiryhmät)
- Peruskäsitys web-sovelluksista ja tietokannoista

**Uusi AZD:lle?** Aloita [Getting Started guide](../../docs/chapter-01-foundation/azd-basics.md) -oppaasta ensin.

## Arkkitehtuuri

Tämä esimerkki julkaisee kaksikerroksisen arkkitehtuurin web-sovelluksella ja SQL-tietokannalla:

```mermaid
graph TD
    Browser[Käyttäjän selain] <--> WebApp[Azure Web App<br/>Flask API<br/>/health<br/>/products]
    WebApp -- Suojattu yhteys<br/>Salattu --> SQL[Azure SQL -tietokanta<br/>Tuotteet-taulu<br/>Esimerkkidata]
```
**Resurssien käyttöönotto:**
- **Resource Group**: Kaikkien resurssien säilö
- **App Service Plan**: Linux-pohjainen hosting (B1-taso kustannustehokkuuden vuoksi)
- **Web App**: Python 3.11 runtime Flask-sovelluksella
- **SQL Server**: Hallittu tietokantapalvelin, TLS 1.2 vähintään
- **SQL Database**: Basic-taso (2GB, sopii kehitykseen/testaukseen)
- **Application Insights**: Monitorointi ja lokitus
- **Log Analytics Workspace**: Keskitetty lokisäilytys

**Analogia**: Ajattele tätä ravintolana (web-sovellus) ja walk-in -pakastimena (tietokanta). Asiakkaat tilaavat ruokalistalta (API-päätepisteet), ja keittiö (Flask-sovellus) hakee ainesosia (dataa) pakastimesta. Ravintolan johtaja (Application Insights) seuraa kaikkea mitä tapahtuu.

## Kansiorakenne

Kaikki tiedostot sisältyvät tähän esimerkkiin—ei ulkoisia riippuvuuksia:

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
- **azure.yaml**: Kertoo AZD:lle mitä julkaista ja mihin
- **infra/main.bicep**: Orkestroi kaikki Azure-resurssit
- **infra/resources/*.bicep**: Yksittäiset resurssimäärittelyt (modulaarisia uudelleenkäyttöön)
- **src/web/app.py**: Flask-sovellus tietokantalogikalla
- **requirements.txt**: Python-riippuvuudet
- **Dockerfile**: Kontitusohjeet julkaisuun

## Pikakäynnistys (vaihe vaiheelta)

### Vaihe 1: Kloonaa ja siirry kansioon

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Onnistumisen tarkistus**: Varmista, että näet `azure.yaml` ja `infra/`-kansion:
```sh
ls
# Odotetaan: README.md, azure.yaml, infra/, src/
```

### Vaihe 2: Kirjaudu Azureen

```sh
azd auth login
```

Tämä avaa selaimen Azuren todennusta varten. Kirjaudu sisään Azure-tunnuksillasi.

**✓ Onnistumisen tarkistus**: Sinun pitäisi nähdä:
```
Logged in to Azure.
```

### Vaihe 3: Alusta ympäristö

```sh
azd init
```

**Mitä tapahtuu**: AZD luo paikallisen konfiguraation julkaisuasi varten.

**Kehoteet joita näet**:
- **Environment name**: Anna lyhyt nimi (esim. `dev`, `myapp`)
- **Azure subscription**: Valitse tilauksesi listasta
- **Azure location**: Valitse alue (esim. `eastus`, `westeurope`)

**✓ Onnistumisen tarkistus**: Sinun pitäisi nähdä:
```
SUCCESS: New project initialized!
```

### Vaihe 4: Provisionoi Azure-resurssit

```sh
azd provision
```

**Mitä tapahtuu**: AZD ottaa käyttöön kaikki infrastruktuurit (kesto 5–8 minuuttia):
1. Luo resurssiryhmän
2. Luo SQL Serverin ja tietokannan
3. Luo App Service Planin
4. Luo Web Appin
5. Luo Application Insightsin
6. Konfiguroi verkotus ja turvallisuus

**Sinulta saatetaan kysyä**:
- **SQL admin username**: Anna käyttäjänimi (esim. `sqladmin`)
- **SQL admin password**: Anna vahva salasana (tallenna tämä!)

**✓ Onnistumisen tarkistus**: Sinun pitäisi nähdä:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Aika**: 5–8 minuuttia

### Vaihe 5: Julkaise sovellus

```sh
azd deploy
```

**Mitä tapahtuu**: AZD rakentaa ja julkaisee Flask-sovelluksesi:
1. Pakkaa Python-sovellus
2. Rakentaa Docker-kontin
3. Työntää sen Azure Web Appiin
4. Alustaa tietokannan esimerkkidatalla
5. Käynnistää sovelluksen

**✓ Onnistumisen tarkistus**: Sinun pitäisi nähdä:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Aika**: 3–5 minuuttia

### Vaihe 6: Selaa sovellusta

```sh
azd browse
```

Tämä avaa julkaistun web-sovelluksesi selaimeen osoitteeseen `https://app-<unique-id>.azurewebsites.net`

**✓ Onnistumisen tarkistus**: Sinun pitäisi nähdä JSON-tuloste:
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

**Health Check** (vahvista tietokantayhteys):
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

**List Products** (esimerkkidata):
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

**Get Single Product**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Onnistumisen tarkistus**: Kaikki päätepisteet palauttavat JSON-dataa ilman virheitä.

---

**🎉 Onnittelut!** Olet onnistuneesti ottanut web-sovelluksen ja tietokannan käyttöön Azureen käyttäen AZD:tä.

## Konfiguraation syväluotaus

### Ympäristömuuttujat

Salaisuuksia hallitaan turvallisesti Azure App Servicen konfiguraation kautta—**älä koskaan kovakoodaa lähdekoodiin**.

**Automaattisesti AZD:n toimesta konfiguroitavat**:
- `SQL_CONNECTION_STRING`: Tietokantayhteys salatuilla tunnistetiedoilla
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Monitoroinnin telemetriapäätepiste
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Mahdollistaa riippuvuuksien automaattisen asennuksen

**Missä salaisuudet tallennetaan**:
1. `azd provision`-komennon aikana annat SQL-tilitiedot turvakyselyllä
2. AZD tallentaa nämä paikalliseen `.azure/<env-name>/.env`-tiedostoon (git-ignored)
3. AZD injektoi ne Azure App Service -konfiguraatioon (salattuna at rest)
4. Sovellus lukee ne `os.getenv()`-kutsulla suoritusaikana

### Paikallinen kehitys

Paikallista testausta varten luo `.env`-tiedosto mallista:

```sh
cp .env.sample .env
# Muokkaa .env-tiedostoa paikallista tietokantayhteyttäsi varten.
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

Kaikki Azure-resurssit määritellään **Bicep-templateissä** (`infra/`-kansio):

- **Modulaarinen rakenne**: Jokaisella resurssityypillä oma tiedosto uudelleenkäyttöä varten
- **Parametrisoitu**: Mukauta SKUja, alueita, nimeämiskäytäntöjä
- **Parhaat käytännöt**: Noudattaa Azuren nimeämis- ja turvallisuusasetuksia
- **Versiohallittu**: Infrastruktuurin muutokset seurataan Gitissä

**Esimerkki muokkaamisesta**:
Tietokantatason muuttamiseksi muokkaa `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Turvallisuuden parhaat käytännöt

Tämä esimerkki noudattaa Azuren turvallisuuden parhaita käytäntöjä:

### 1. **Ei salaisuuksia lähdekoodissa**
- ✅ Tunnukset tallennetaan Azure App Service -konfiguraatioon (salattuna)
- ✅ `.env`-tiedostot jätetty Gitin ulkopuolelle `.gitignore`-tiedoston avulla
- ✅ Salaisuudet välitetään turvallisina parametreina provisioinnin aikana

### 2. **Salatut yhteydet**
- ✅ TLS 1.2 vähintään SQL Serverille
- ✅ HTTPS-only pakotettu Web Appille
- ✅ Tietokantayhteydet käyttävät salattuja kanavia

### 3. **Verkkoturvallisuus**
- ✅ SQL Serverin palomuuri konfiguroitu sallimaan vain Azure-palvelut
- ✅ Julkinen verkkoyhteys rajoitettu (voidaan tiukentaa Private Endpointeilla)
- ✅ FTPS poistettu käytöstä Web Appilla

### 4. **Todennus & valtuutus**
- ⚠️ **Tällä hetkellä**: SQL-todennus (käyttäjätunnus/salasana)
- ✅ **Tuotantosuositus**: Käytä Azure Managed Identitya salasanattomaan todennukseen

**Managed Identityyn päivitys** (tuotantoon):
1. Ota Managed Identity käyttöön Web Appilla
2. Myönnä identiteetille SQL-oikeudet
3. Päivitä connection string käyttämään managed identitya
4. Poista salasanaan perustuva todennus

### 5. **Auditointi & vaatimustenmukaisuus**
- ✅ Application Insights kirjaa kaikki pyynnöt ja virheet
- ✅ SQL Database -auditointi käytössä (säädettävissä vaatimustenmukaisuuteen)
- ✅ Kaikki resurssit tagattu hallintaa varten

**Turvallisuustarkistuslista ennen tuotantoa**:
- [ ] Ota Azure Defender for SQL käyttöön
- [ ] Konfiguroi Private Endpoints SQL-tietokannalle
- [ ] Ota Web Application Firewall (WAF) käyttöön
- [ ] Implementoi Azure Key Vault salaisuuksien kierrätykseen
- [ ] Konfiguroi Azure AD -todennus
- [ ] Ota diagnostiikkalokit käyttöön kaikille resursseille

## Kustannusoptimointi

**Arvioidut kuukausikustannukset** (tilanne marraskuu 2025):

| Resource | SKU/Tier | Estimated Cost |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13/month |
| SQL Database | Basic (2GB) | ~$5/month |
| Application Insights | Pay-as-you-go | ~$2/month (low traffic) |
| **Total** | | **~$20/month** |

**💡 Säästövinkkejä**:

1. **Käytä ilmaista tasoa oppimiseen**:
   - App Service: F1-taso (ilmainen, rajoitetusti tunteja)
   - SQL Database: Käytä Azure SQL Database serverless -vaihtoehtoa
   - Application Insights: 5GB/kk ilmainen ingestiö

2. **Pysäytä resurssit kun et käytä niitä**:
   ```sh
   # Pysäytä web-sovellus (tietokannasta veloitetaan edelleen)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Käynnistä uudelleen tarvittaessa
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Poista kaikki testauksen jälkeen**:
   ```sh
   azd down
   ```
   Tämä poistaa KAIKKI resurssit ja lopettaa veloitukset.

4. **Kehitys vs. tuotanto SKUt**:
   - **Kehitys**: Basic-taso (käytetty tässä esimerkissä)
   - **Tuotanto**: Standard/Premium-taso redundanssilla

**Kustannusten seuranta**:
- Tarkastele kustannuksia [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Aseta kustannushälytyksiä välttääksesi yllätykset
- Merkitse kaikki resurssit `azd-env-name`-tagilla seurattavuuden vuoksi

**Ilmainen vaihtoehto oppimiseen**:
Oppimista varten voit muokata `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Huom**: Ilmaistasolla on rajoituksia (60 min/vrk CPU, ei always-on).

## Monitorointi & observability

### Application Insights -integrointi

Tämä esimerkki sisältää **Application Insightsin** kattavaan monitorointiin:

**Mitä seurataan**:
- ✅ HTTP-pyynnöt (latenssi, tilakoodit, päätepisteet)
- ✅ Sovellusvirheet ja poikkeukset
- ✅ Mukautettu lokitus Flask-sovelluksesta
- ✅ Tietokantayhteyden terveys
- ✅ Suorituskykymittarit (CPU, muisti)

**Pääsy Application Insightsiin**:
1. Avaa [Azure Portal](https://portal.azure.com)
2. Siirry resurssiryhmääsi (`rg-<env-name>`)
3. Klikkaa Application Insights -resurssia (`appi-<unique-id>`)

**Hyödyllisiä kyselyjä** (Application Insights → Logs):

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

### SQL-tietokannan auditointi

**SQL-tietokannan auditointi on käytössä** seuraamaan:
- Tietokannan käyttökuvioita
- Epäonnistuneita kirjautumisyrityksiä
- Skeeman muutoksia
- Datakäyttöä (vaatimustenmukaisuutta varten)

**Pääsy audit-lokeihin**:
1. Azure Portal → SQL Database → Auditing
2. Katso lokit Log Analytics -työtilassa

### Reaaliaikainen monitorointi

**Näytä Live Metrics**:
1. Application Insights → Live Metrics
2. Näet pyynnöt, virheet ja suorituskyvyn reaaliajassa

**Aseta hälytyksiä**:
Luo hälytyksiä kriittisille tapahtumille:
- HTTP 500 -virheitä > 5 viidessä minuutissa
- Tietokantayhteyden epäonnistumiset
- Korkeat vasteajat (>2 sekuntia)

**Esimerkkihälytyksen luonti**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Vianetsintä
### Yleiset ongelmat ja ratkaisut

#### 1. `azd provision` epäonnistuu virheellä "Location not available"

**Oire**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Ratkaisu**:
Valitse eri Azure-alue tai rekisteröi resurssitarjoaja:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. SQL-yhteys epäonnistuu käyttöönoton aikana

**Oire**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Ratkaisu**:
- Varmista, että SQL Serverin palomuuri sallii Azure-palvelut (konfiguroidaan automaattisesti)
- Tarkista, että SQL-ylläpitäjän salasana syötettiin oikein suorittaessasi `azd provision`
- Varmista, että SQL Server on täysin provisioitu (voi kestää 2–3 minuuttia)

**Varmista yhteys**:
```sh
# Azure-portaalissa siirry kohtaan SQL Database → Query editor
# Yritä muodostaa yhteys tunnistetiedoillasi
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

**Yleiset syyt**:
- Puuttuvat ympäristömuuttujat (tarkista App Service → Configuration)
- Python-pakettien asennus epäonnistui (tarkista deployment-lokit)
- Tietokannan alustusvirhe (tarkista SQL-yhteydet)

#### 4. `azd deploy` epäonnistuu virheellä "Build Error"

**Oire**:
```
Error: Failed to build project
```

**Ratkaisu**:
- Varmista, että `requirements.txt` ei sisällä syntaksivirheitä
- Tarkista, että Python 3.11 on määritetty tiedostossa `infra/resources/web-app.bicep`
- Varmista, että Dockerfile käyttää oikeaa peruskuvaa

**Vianmääritys paikallisesti**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Unauthorized" AZD-komentojen ajon yhteydessä

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

Varmista, että sinulla on oikeat oikeudet (Contributor-rooli) tilaukseen.

#### 6. Korkeat tietokantakulut

**Oire**:
Yllättävä Azure-lasku.

**Ratkaisu**:
- Tarkista, ettet unohtanut ajaa `azd down` testauksen jälkeen
- Varmista, että SQL Database käyttää Basic-tasoa (ei Premium)
- Tarkastele kustannuksia Azure Cost Managementissa
- Ota käyttöön kustannushälytykset

### Apua

**Näytä kaikki AZD-ympäristömuuttujat**:
```sh
azd env get-values
```

**Tarkista käyttöönoton tila**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Pääsy sovelluksen lokitietoihin**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Tarvitsetko lisää apua?**
- [AZD Troubleshooting Guide](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Azure App Service Troubleshooting](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL Troubleshooting](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Käytännön harjoitukset

### Harjoitus 1: Vahvista käyttöönotto (Aloittelija)

**Tavoite**: Vahvista, että kaikki resurssit on otettu käyttöön ja sovellus toimii.

**Vaiheet**:
1. Listaa kaikki resurssit resurssiryhmässäsi:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Odotettu**: 6–7 resurssia (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Testaa kaikki API-päätepisteet:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Odotettu**: Kaikki palauttavat kelvollista JSONia ilman virheitä

3. Tarkista Application Insights:
   - Siirry Application Insights -kohteeseen Azure-portaalissa
   - Mene "Live Metrics" -näkymään
   - Päivitä selaimesi web-sovellossa
   **Odotettu**: Näet pyynnöt ilmestyvän reaaliajassa

**Onnistumisen kriteerit**: Kaikki 6–7 resurssia ovat olemassa, kaikki päätepisteet palauttavat dataa, Live Metrics näyttää aktiivisuutta.

---

### Harjoitus 2: Lisää uusi API-päätepiste (Keskitaso)

**Tavoite**: Laajenna Flask-sovellusta uudella päätepisteellä.

**Aloituskoodi**: Nykyiset päätepisteet tiedostossa `src/web/app.py`

**Vaiheet**:
1. Muokkaa `src/web/app.py` ja lisää uusi päätepiste `get_product()`-funktion jälkeen:
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

3. Testaa uusi päätepiste:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Odotettu**: Palauttaa tuotteet, jotka vastaavat hakusanaa "laptop"

**Onnistumisen kriteerit**: Uusi päätepiste toimii, palauttaa suodatettuja tuloksia ja näkyy Application Insights -lokeissa.

---

### Harjoitus 3: Lisää valvonta ja hälytyksiä (Edistynyt)

**Tavoite**: Ota käyttöön proaktiivinen valvonta hälytyksineen.

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

3. Tarkista, laukaistiinko hälytys:
   - Azure Portal → Alerts → Alert Rules
   - Tarkista sähköpostisi (jos konfiguroitu)

**Onnistumisen kriteerit**: Hälytys sääntö luotu, laukeaa virheiden yhteydessä, ilmoitukset vastaanotetaan.

---

### Harjoitus 4: Tietokantakaavion muutokset (Edistynyt)

**Tavoite**: Lisää uusi taulu ja muokkaa sovellusta käyttämään sitä.

**Vaiheet**:
1. Yhdistä SQL Databaseen Azure-portaalin Query Editorin kautta

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

3. Päivitä `src/web/app.py` sisällyttämään kategorioiden tiedot vastauksiin

4. Ota käyttöön ja testaa

**Onnistumisen kriteerit**: Uusi taulu on olemassa, tuotteet näyttävät kategoria-tiedot, sovellus toimii edelleen.

---

### Harjoitus 5: Ota välimuisti käyttöön (Asiantuntija)

**Tavoite**: Lisää Azure Redis Cache suorituskyvyn parantamiseksi.

**Vaiheet**:
1. Lisää Redis Cache tiedostoon `infra/main.bicep`
2. Päivitä `src/web/app.py` välimuistittamaan tuotetietokyselyjä
3. Mittaa suorituskyvyn parannus Application Insightsilla
4. Vertaa vasteaikoja ennen ja jälkeen välimuistin

**Onnistumisen kriteerit**: Redis on otettu käyttöön, välimuisti toimii, vasteajat paranevat yli 50 %.

**Vinkki**: Aloita [Azure Cache for Redis -dokumentaatiosta](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Siivous

Välttääksesi jatkuvia kustannuksia, poista kaikki resurssit käytön jälkeen:

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
- Ei jatkuvia kustannuksia
- Paikallinen kansio `.azure/<env-name>` voidaan poistaa

**Vaihtoehto** (pidä infrastruktuuri, poista data):
```sh
# Poista vain resurssiryhmä (säilytä AZD-konfiguraatio)
az group delete --name rg-<env-name> --yes
```
## Lue lisää

### Asiaankuuluva dokumentaatio
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database Documentation](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service Documentation](https://learn.microsoft.com/azure/app-service/)
- [Application Insights Documentation](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep Language Reference](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Seuraavat askeleet tässä kurssissa
- **[Container Apps Example](../../../../examples/container-app)**: Ota käyttöön mikropalveluita Azure Container Appsilla
- **[AI Integration Guide](../../../../docs/ai-foundry)**: Lisää AI-ominaisuuksia sovellukseesi
- **[Deployment Best Practices](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Tuotantokäyttöönoton mallit

### Edistyneet aiheet
- **Managed Identity**: Poista salasanat käytöstä ja käytä Azure AD -todennusta
- **Private Endpoints**: Suojaa tietokantayhteydet virtuaaliverkon sisällä
- **CI/CD Integration**: Automatisoi julkaisut GitHub Actionsilla tai Azure DevOpsilla
- **Multi-Environment**: Ota käyttöön kehitys-, staging- ja tuotantoympäristöt
- **Database Migrations**: Käytä Alembicia tai Entity Frameworkia skeeman versiointiin

### Vertailu muihin lähestymistapoihin

**AZD vs. ARM Templates**:
- ✅ AZD: Korkeamman tason abstraktio, yksinkertaisemmat komennot
- ⚠️ ARM: Monisanaisempi, tarjoaa yksityiskohtaisempaa hallintaa

**AZD vs. Terraform**:
- ✅ AZD: Azure-native, integroitu Azure-palveluihin
- ⚠️ Terraform: Monipilvituki, laajempi ekosysteemi

**AZD vs. Azure Portal**:
- ✅ AZD: Toistettavissa, versionhallittu, automatisoitavissa
- ⚠️ Portaalin käyttö: Manuaalisia klikkauksia, vaikea toistaa

**Ajattele AZD:ta**: Docker Compose Azuren kohdalla — yksinkertaistettu konfigurointi monimutkaisille käyttöönottoihin.

---

## Usein kysytyt kysymykset

**K: Voinko käyttää eri ohjelmointikieltä?**  
V: Kyllä! Korvaa `src/web/` Node.js:llä, C#:lla, Go:lla tai millä tahansa kielellä. Päivitä `azure.yaml` ja Bicep vastaavasti.

**K: Kuinka lisään lisää tietokantoja?**  
V: Lisää toinen SQL Database -moduuli tiedostoon `infra/main.bicep` tai käytä PostgreSQL/MySQL:tä Azure Database -palveluista.

**K: Voinko käyttää tätä tuotannossa?**  
V: Tämä on lähtökohta. Tuotantoon lisää: managed identity, private endpoints, redundanssi, varmistusstrategia, WAF ja parannettu valvonta.

**K: Entä jos haluan käyttää kontteja koodijakelun sijaan?**  
V: Tutustu [Container Apps Example](../../../../examples/container-app), joka käyttää Docker-kontteja läpi koko prosessin.

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

> **Huom:** Tämä esimerkki demonstroi parhaita käytäntöjä web-sovelluksen ja tietokannan käyttöönotossa AZD:llä. Se sisältää toimivan koodin, kattavan dokumentaation ja käytännön harjoituksia oppimisen vahvistamiseksi. Tuotantokäyttöönottoja varten tarkista organisaatiosi vaatimukset turvallisuudesta, skaalaamisesta, vaatimustenmukaisuudesta ja kustannuksista.

**📚 Kurssin navigointi:**
- ← Edellinen: [Container Apps Example](../../../../examples/container-app)
- → Seuraava: [AI Integration Guide](../../../../docs/ai-foundry)
- 🏠 [Kurssin etusivu](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty tekoälykäännöspalvelulla [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäiskielellä tulee pitää auktoritatiivisena lähteenä. Kriittisten tietojen osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa mistään tästä käännöksestä johtuvista väärinymmärryksistä tai virheellisistä tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->