<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "10bf998e2d70c35d713fbe6905841b95",
  "translation_date": "2025-11-21T18:12:08+00:00",
  "source_file": "examples/database-app/README.md",
  "language_code": "fi"
}
-->
# Microsoft SQL -tietokannan ja Web-sovelluksen käyttöönotto AZD:llä

⏱️ **Arvioitu aika**: 20-30 minuuttia | 💰 **Arvioidut kustannukset**: ~15-25 €/kk | ⭐ **Vaikeustaso**: Keskitaso

Tämä **täydellinen, toimiva esimerkki** näyttää, kuinka voit käyttää [Azure Developer CLI:tä (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) Python Flask -verkkosovelluksen ja Microsoft SQL -tietokannan käyttöönottoon Azuren pilvipalvelussa. Kaikki koodi sisältyy ja on testattu—ei ulkoisia riippuvuuksia.

## Mitä opit

Tämän esimerkin avulla opit:
- Ottamaan käyttöön monitasoisen sovelluksen (verkkosovellus + tietokanta) infrastruktuuri koodina -lähestymistavalla
- Konfiguroimaan turvalliset tietokantayhteydet ilman salaisuuksien kovakoodausta
- Seuraamaan sovelluksen tilaa Application Insightsin avulla
- Hallitsemaan Azure-resursseja tehokkaasti AZD CLI:llä
- Noudattamaan Azuren parhaita käytäntöjä turvallisuuden, kustannusten optimoinnin ja valvonnan osalta

## Tilannekuvaus
- **Verkkosovellus**: Python Flask REST API tietokantayhteydellä
- **Tietokanta**: Azure SQL Database esimerkkidatalla
- **Infrastruktuuri**: Toteutettu Bicepillä (modulaariset, uudelleenkäytettävät mallit)
- **Käyttöönotto**: Täysin automatisoitu `azd`-komennoilla
- **Valvonta**: Application Insights lokien ja telemetrian seurantaan

## Esivaatimukset

### Tarvittavat työkalut

Varmista ennen aloittamista, että sinulla on seuraavat työkalut asennettuna:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versio 2.50.0 tai uudempi)
   ```sh
   az --version
   # Odotettu tulos: azure-cli 2.50.0 tai uudempi
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versio 1.0.0 tai uudempi)
   ```sh
   azd version
   # Odotettu tulos: azd versio 1.0.0 tai uudempi
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (paikalliseen kehitykseen)
   ```sh
   python --version
   # Odotettu tulos: Python 3.8 tai uudempi
   ```

4. **[Docker](https://www.docker.com/get-started)** (valinnainen, paikalliseen konttikehitykseen)
   ```sh
   docker --version
   # Odotettu tulos: Docker-versio 20.10 tai uudempi
   ```

### Azure-vaatimukset

- Aktiivinen **Azure-tilaus** ([luo ilmainen tili](https://azure.microsoft.com/free/))
- Oikeudet resurssien luomiseen tilauksessasi
- **Omistaja**- tai **Avustaja**-rooli tilauksessa tai resurssiryhmässä

### Tietämyksen esivaatimukset

Tämä on **keskitasoinen** esimerkki. Sinun tulisi tuntea:
- Peruskomennot komentorivillä
- Pilvipalveluiden peruskäsitteet (resurssit, resurssiryhmät)
- Verkkosovellusten ja tietokantojen perusteet

**Uusi AZD:ssä?** Aloita [Aloitusoppaasta](../../docs/getting-started/azd-basics.md).

## Arkkitehtuuri

Tämä esimerkki ottaa käyttöön kaksitasoisen arkkitehtuurin verkkosovelluksella ja SQL-tietokannalla:

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
- **App Service Plan**: Linux-pohjainen hosting (B1-taso kustannustehokkuuden vuoksi)
- **Verkkosovellus**: Python 3.11 -ajoympäristö Flask-sovelluksella
- **SQL Server**: Hallittu tietokantapalvelin vähintään TLS 1.2 -salaustasolla
- **SQL Database**: Perustaso (2GB, sopii kehitykseen/testaukseen)
- **Application Insights**: Valvonta ja lokitus
- **Log Analytics Workspace**: Keskitetty lokien tallennus

**Vertauskuva**: Ajattele tätä kuin ravintolaa (verkkosovellus), jossa on kylmävarasto (tietokanta). Asiakkaat tilaavat ruokalistalta (API-päätepisteet), ja keittiö (Flask-sovellus) hakee ainekset (data) kylmävarastosta. Ravintolapäällikkö (Application Insights) seuraa kaikkea toimintaa.

## Kansiomalli

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
- **azure.yaml**: Määrittää, mitä AZD ottaa käyttöön ja minne
- **infra/main.bicep**: Orkestroi kaikki Azure-resurssit
- **infra/resources/*.bicep**: Yksittäisten resurssien määritelmät (modulaarisia uudelleenkäyttöä varten)
- **src/web/app.py**: Flask-sovellus tietokantalogiikalla
- **requirements.txt**: Python-pakettiriippuvuudet
- **Dockerfile**: Konttien käyttöönotto-ohjeet

## Pika-aloitus (vaiheittain)

### Vaihe 1: Kloonaa ja siirry kansioon

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Onnistumisen tarkistus**: Varmista, että näet `azure.yaml`-tiedoston ja `infra/`-kansion:
```sh
ls
# Odotettu: README.md, azure.yaml, infra/, src/
```

### Vaihe 2: Kirjaudu sisään Azureen

```sh
azd auth login
```

Tämä avaa selaimen Azure-todennusta varten. Kirjaudu sisään Azure-tunnuksillasi.

**✓ Onnistumisen tarkistus**: Sinun pitäisi nähdä:
```
Logged in to Azure.
```

### Vaihe 3: Alusta ympäristö

```sh
azd init
```

**Mitä tapahtuu**: AZD luo paikallisen konfiguraation käyttöönottoa varten.

**Näet seuraavat kehotteet**:
- **Ympäristön nimi**: Anna lyhyt nimi (esim. `dev`, `myapp`)
- **Azure-tilaus**: Valitse tilauksesi listasta
- **Azure-sijainti**: Valitse alue (esim. `eastus`, `westeurope`)

**✓ Onnistumisen tarkistus**: Sinun pitäisi nähdä:
```
SUCCESS: New project initialized!
```

### Vaihe 4: Azure-resurssien käyttöönotto

```sh
azd provision
```

**Mitä tapahtuu**: AZD ottaa käyttöön kaiken infrastruktuurin (kestää 5-8 minuuttia):
1. Luo resurssiryhmän
2. Luo SQL Serverin ja tietokannan
3. Luo App Service Planin
4. Luo verkkosovelluksen
5. Luo Application Insightsin
6. Konfiguroi verkot ja turvallisuus

**Sinulta kysytään**:
- **SQL-pääkäyttäjän käyttäjänimi**: Anna käyttäjänimi (esim. `sqladmin`)
- **SQL-pääkäyttäjän salasana**: Anna vahva salasana (tallenna tämä!)

**✓ Onnistumisen tarkistus**: Sinun pitäisi nähdä:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Aika**: 5-8 minuuttia

### Vaihe 5: Sovelluksen käyttöönotto

```sh
azd deploy
```

**Mitä tapahtuu**: AZD rakentaa ja ottaa käyttöön Flask-sovelluksesi:
1. Pakkaa Python-sovelluksen
2. Rakentaa Docker-kontin
3. Työntää Azure Web Appiin
4. Alustaa tietokannan esimerkkidatalla
5. Käynnistää sovelluksen

**✓ Onnistumisen tarkistus**: Sinun pitäisi nähdä:
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

Tämä avaa käyttöönotetun verkkosovelluksesi selaimessa osoitteessa `https://app-<uniikki-id>.azurewebsites.net`

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

### Vaihe 7: Testaa API-päätepisteitä

**Terveystarkistus** (tarkista tietokantayhteys):
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

**Listaa tuotteet** (esimerkkidata):
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

**✓ Onnistumisen tarkistus**: Kaikki päätepisteet palauttavat JSON-dataa ilman virheitä.

---

**🎉 Onnittelut!** Olet onnistuneesti ottanut käyttöön verkkosovelluksen ja tietokannan Azuren pilvipalvelussa käyttäen AZD:tä.

## Konfiguraation syväluotaus

### Ympäristömuuttujat

Salaisuudet hallitaan turvallisesti Azure App Servicen konfiguraation kautta—**ei koskaan kovakoodattu lähdekoodiin**.

**AZD konfiguroi automaattisesti**:
- `SQL_CONNECTION_STRING`: Tietokantayhteys salatuilla tunnuksilla
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Telemetriapisteen osoite
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Mahdollistaa riippuvuuksien automaattisen asennuksen

**Missä salaisuudet tallennetaan**:
1. `azd provision` -vaiheessa annat SQL-tunnukset turvallisten kehotteiden kautta
2. AZD tallentaa nämä paikalliseen `.azure/<ympäristön-nimi>/.env`-tiedostoon (git-ignorattu)
3. AZD injektoi ne Azure App Servicen konfiguraatioon (salattu levossa)
4. Sovellus lukee ne `os.getenv()`-kutsun kautta ajonaikaisesti

### Paikallinen kehitys

Paikallista testausta varten luo `.env`-tiedosto mallista:

```sh
cp .env.sample .env
# Muokkaa .env tiedostoa paikallisen tietokantayhteyden mukaan
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
# Odotettu: {"status": "terve", "database": "yhdistetty"}
```

### Infrastruktuuri koodina

Kaikki Azure-resurssit on määritelty **Bicep-malleissa** (`infra/`-kansio):

- **Modulaarinen suunnittelu**: Jokaisella resurssityypillä oma tiedosto uudelleenkäytettävyyden vuoksi
- **Parametrisoitu**: Mukauta SKU:t, alueet, nimeämiskäytännöt
- **Parhaat käytännöt**: Noudattaa Azuren nimeämisstandardeja ja turvallisuusasetuksia
- **Versiohallittu**: Infrastruktuurimuutokset seurataan Gitissä

**Mukautusesimerkki**:
Muuta tietokannan tasoa muokkaamalla `infra/resources/sql-database.bicep`-tiedostoa:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

- Korkeat vasteajat (>2 sekuntia)

**Esimerkki hälytyksen luomisesta**:
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

#### 1. `azd provision` epäonnistuu viestillä "Sijainti ei ole käytettävissä"

**Oire**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Ratkaisu**:
Valitse toinen Azure-alue tai rekisteröi resurssipalveluntarjoaja:
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
- Tarkista, että SQL-järjestelmänvalvojan salasana on syötetty oikein `azd provision` -komennon aikana
- Varmista, että SQL Server on täysin käyttöönotettu (voi kestää 2-3 minuuttia)

**Tarkista yhteys**:
```sh
# Azure-portaalista siirry SQL-tietokantaan → Kyselyeditori
# Yritä yhdistää tunnuksillasi
```

#### 3. Verkkosovellus näyttää "Sovellusvirhe"

**Oire**:
Selaimessa näkyy yleinen virhesivu.

**Ratkaisu**:
Tarkista sovelluksen lokit:
```sh
# Näytä viimeisimmät lokit
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Yleiset syyt**:
- Puuttuvat ympäristömuuttujat (tarkista App Service → Configuration)
- Python-pakettien asennus epäonnistui (tarkista käyttöönoton lokit)
- Tietokannan alustamisvirhe (tarkista SQL-yhteys)

#### 4. `azd deploy` epäonnistuu viestillä "Build Error"

**Oire**:
```
Error: Failed to build project
```

**Ratkaisu**:
- Varmista, että `requirements.txt` ei sisällä syntaksivirheitä
- Tarkista, että Python 3.11 on määritetty `infra/resources/web-app.bicep` -tiedostossa
- Varmista, että Dockerfile sisältää oikean peruskuvan

**Vianetsintä paikallisesti**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Unauthorized" AZD-komentojen suorittamisen yhteydessä

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
- Varmista, että SQL-tietokanta käyttää Basic-tasoa (ei Premium)
- Tarkista kustannukset Azure Cost Management -työkalussa
- Aseta kustannushälytykset

### Apua ongelmatilanteissa

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
- [AZD Vianetsintäopas](../../docs/troubleshooting/common-issues.md)
- [Azure App Service Vianetsintä](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL Vianetsintä](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Käytännön harjoitukset

### Harjoitus 1: Varmista käyttöönotto (Aloittelija)

**Tavoite**: Varmista, että kaikki resurssit on otettu käyttöön ja sovellus toimii.

**Vaiheet**:
1. Listaa kaikki resurssit resurssiryhmässäsi:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Odotettu tulos**: 6-7 resurssia (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Testaa kaikki API-päätepisteet:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Odotettu tulos**: Kaikki palauttavat kelvollista JSON-dataa ilman virheitä

3. Tarkista Application Insights:
   - Siirry Application Insightsiin Azure-portaalissa
   - Mene "Live Metrics" -osioon
   - Päivitä verkkosovelluksen selain
   **Odotettu tulos**: Näet pyynnöt reaaliajassa

**Onnistumisen kriteerit**: Kaikki 6-7 resurssia ovat olemassa, kaikki päätepisteet palauttavat dataa, Live Metrics näyttää aktiivisuutta.

---

### Harjoitus 2: Lisää uusi API-päätepiste (Keskitaso)

**Tavoite**: Laajenna Flask-sovellusta uudella päätepisteellä.

**Alkukoodi**: Nykyiset päätepisteet `src/web/app.py` -tiedostossa

**Vaiheet**:
1. Muokkaa `src/web/app.py` -tiedostoa ja lisää uusi päätepiste `get_product()`-funktion jälkeen:
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
   **Odotettu tulos**: Palauttaa tuotteet, jotka vastaavat "laptop"

**Onnistumisen kriteerit**: Uusi päätepiste toimii, palauttaa suodatetut tulokset, näkyy Application Insights -lokitiedoissa.

---

### Harjoitus 3: Lisää valvonta ja hälytykset (Edistynyt)

**Tavoite**: Aseta ennakoiva valvonta hälytysten avulla.

**Vaiheet**:
1. Luo hälytys HTTP 500 -virheille:
   ```sh
   # Hanki Application Insights -resurssin tunnus
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
   - Tarkista sähköpostisi (jos määritetty)

**Onnistumisen kriteerit**: Hälytyssääntö on luotu, laukaisee virheistä, ilmoitukset vastaanotetaan.

---

### Harjoitus 4: Tietokannan kaavamuutokset (Edistynyt)

**Tavoite**: Lisää uusi taulu ja muokkaa sovellusta käyttämään sitä.

**Vaiheet**:
1. Yhdistä SQL-tietokantaan Azure-portaalin kyselyeditorin kautta

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

### Harjoitus 5: Välimuistin toteuttaminen (Asiantuntija)

**Tavoite**: Lisää Azure Redis Cache parantaaksesi suorituskykyä.

**Vaiheet**:
1. Lisää Redis Cache `infra/main.bicep` -tiedostoon
2. Päivitä `src/web/app.py` välimuistittamaan tuotekyselyt
3. Mittaa suorituskyvyn parannus Application Insightsin avulla
4. Vertaa vasteaikoja ennen/jälkeen välimuistin käyttöönottoa

**Onnistumisen kriteerit**: Redis on otettu käyttöön, välimuisti toimii, vasteajat paranevat yli 50 %.

**Vinkki**: Aloita [Azure Cache for Redis -dokumentaatiosta](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Siivous

Välttääksesi jatkuvat kustannukset, poista kaikki resurssit, kun olet valmis:

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
- Paikallinen `.azure/<env-name>`-kansio voidaan poistaa

**Vaihtoehto** (säilytä infrastruktuuri, poista data):
```sh
# Poista vain resurssiryhmä (pidä AZD-konfiguraatio)
az group delete --name rg-<env-name> --yes
```
## Lisätietoja

### Liittyvä dokumentaatio
- [Azure Developer CLI Dokumentaatio](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database Dokumentaatio](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service Dokumentaatio](https://learn.microsoft.com/azure/app-service/)
- [Application Insights Dokumentaatio](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep Language Reference](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Seuraavat askeleet tässä kurssissa
- **[Container Apps Esimerkki](../../../../examples/container-app)**: Ota mikropalvelut käyttöön Azure Container Appsilla
- **[AI Integraatio-opas](../../../../docs/ai-foundry)**: Lisää tekoälyominaisuuksia sovellukseesi
- **[Käyttöönoton parhaat käytännöt](../../docs/deployment/deployment-guide.md)**: Tuotantokäyttöönoton mallit

### Edistyneet aiheet
- **Hallittu identiteetti**: Poista salasanat ja käytä Azure AD -todennusta
- **Yksityiset päätepisteet**: Suojaa tietokantayhteydet virtuaaliverkossa
- **CI/CD-integraatio**: Automatisoi käyttöönotot GitHub Actionsilla tai Azure DevOpsilla
- **Moniympäristö**: Määritä kehitys-, testaus- ja tuotantoympäristöt
- **Tietokannan migraatiot**: Käytä Alembicia tai Entity Frameworkia kaavaversiointiin

### Vertailu muihin lähestymistapoihin

**AZD vs. ARM-mallit**:
- ✅ AZD: Korkeamman tason abstraktio, yksinkertaisemmat komennot
- ⚠️ ARM: Yksityiskohtaisempi, tarkempi hallinta

**AZD vs. Terraform**:
- ✅ AZD: Azure-natiivi, integroitu Azure-palveluihin
- ⚠️ Terraform: Monipilvituki, laajempi ekosysteemi

**AZD vs. Azure Portal**:
- ✅ AZD: Toistettava, versioitu, automatisoitava
- ⚠️ Portal: Manuaaliset klikkaukset, vaikea toistaa

**Ajattele AZD:tä kuin**: Docker Compose Azurelle—yksinkertaistettu konfiguraatio monimutkaisille käyttöönottoille.

---

## Usein kysytyt kysymykset

**K: Voinko käyttää eri ohjelmointikieltä?**  
V: Kyllä! Korvaa `src/web/` Node.js:llä, C#:llä, Go:lla tai millä tahansa kielellä. Päivitä `azure.yaml` ja Bicep vastaavasti.

**K: Miten lisään lisää tietokantoja?**  
V: Lisää toinen SQL-tietokantamoduuli `infra/main.bicep` -tiedostoon tai käytä Azure Database -palveluiden PostgreSQL/MySQL-tietokantoja.

**K: Voinko käyttää tätä tuotannossa?**  
V: Tämä on lähtökohta. Tuotantoa varten lisää: hallittu identiteetti, yksityiset päätepisteet, redundanssi, varmuuskopiointistrategia, WAF ja parannettu valvonta.

**K: Entä jos haluan käyttää kontteja koodin käyttöönoton sijaan?**  
V: Katso [Container Apps Esimerkki](../../../../examples/container-app), joka käyttää Docker-kontteja kauttaaltaan.

**K: Miten yhdistän tietokantaan paikalliselta koneeltani?**  
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

> **Huom:** Tämä esimerkki esittelee parhaat käytännöt verkkosovelluksen käyttöönottoon tietokannan kanssa AZD:llä. Se sisältää toimivan koodin, kattavan dokumentaation ja käytännön harjoituksia oppimisen vahvistamiseksi. Tuotantokäyttöönottoa varten tarkista organisaatiollesi spesifiset turvallisuus-, skaalautuvuus-, vaatimustenmukaisuus- ja kustannusvaatimukset.

**📚 Kurssin navigointi:**
- ← Edellinen: [Container Apps Esimerkki](../../../../examples/container-app)
- → Seuraava: [AI Integraatio-opas](../../../../docs/ai-foundry)
- 🏠 [Kurssin etusivu](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->