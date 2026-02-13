# Razmestitev Microsoft SQL podatkovne baze in spletne aplikacije z AZD

⏱️ **Ocenjeni čas**: 20-30 minut | 💰 **Ocenjeni strošek**: ~$15-25/mesec | ⭐ **Kompleksnost**: Srednja

Ta **popoln, delujoč primer** prikazuje, kako uporabiti [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) za razmestitev spletne aplikacije Python Flask z Microsoft SQL bazo podatkov v Azure. Vsa koda je vključena in testirana—brez zunanjih odvisnosti.

## Kaj se boste naučili

Z dokončanjem tega primera boste:
- Razmestili večslojno aplikacijo (spletna aplikacija + baza) z uporabo infrastrukture kot kode
- Konfigurirali varne povezave z bazo brez vnašanja skrivnosti v kodo
- Nadzorovali zdravje aplikacije z Application Insights
- Učinkovito upravljali Azure vire z AZD CLI
- Sledili najboljšim praksam Azure za varnost, optimizacijo stroškov in opazljivost

## Pregled scenarija
- **Spletna aplikacija**: Python Flask REST API s povezavo na bazo
- **Podatkovna baza**: Azure SQL Database z vzorčnimi podatki
- **Infrastruktura**: Zagotovljena z Bicep (modularne, ponovno uporabne predloge)
- **Razmestitev**: Popolnoma avtomatizirano z ukazi `azd`
- **Nadzor**: Application Insights za dnevnike in telemetrijo

## Predpogoji

### Potrebna orodja

Pred začetkom preverite, da imate nameščena naslednja orodja:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (različica 2.50.0 ali novejša)
   ```sh
   az --version
   # Pričakovani izhod: azure-cli 2.50.0 ali novejša
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (različica 1.0.0 ali novejša)
   ```sh
   azd version
   # Pričakovan izhod: azd različica 1.0.0 ali novejša
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (za lokalni razvoj)
   ```sh
   python --version
   # Pričakovani izhod: Python 3.8 ali novejši
   ```

4. **[Docker](https://www.docker.com/get-started)** (neobvezno, za lokalni razvoj v vsebnikih)
   ```sh
   docker --version
   # Pričakovani izhod: različica Dockera 20.10 ali novejša
   ```

### Zahteve za Azure

- Aktivna **Azure naročnina** ([ustvarite brezplačen račun](https://azure.microsoft.com/free/))
- Pooblastila za ustvarjanje virov v vaši naročnini
- **Owner** ali **Contributor** vloga na naročnini ali v skupini virov

### Predznanje

To je primer **srednje zahtevnosti**. Poznati bi morali:
- Osnovne ukaze v ukazni vrstici
- Osnovne koncepte oblaka (viri, skupine virov)
- Osnovno razumevanje spletnih aplikacij in baz podatkov

**Ste novi pri AZD?** Oglejte si najprej [vodnik za začetek](../../docs/chapter-01-foundation/azd-basics.md).

## Arhitektura

Ta primer razmestitve vključuje dvonivojsko arhitekturo s spletno aplikacijo in SQL bazo podatkov:

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

**Razmestitev virov:**
- **Skupina virov**: Kontejner za vse vire
- **App Service Plan**: Gostovanje na Linuxu (B1 nivo zaradi stroškovne učinkovitosti)
- **Web App**: Python 3.11 runtime z aplikacijo Flask
- **SQL Server**: Upravljan strežnik baze podatkov z vsaj TLS 1.2
- **SQL Database**: Osnovni nivo (2GB, primeren za razvoj/testiranje)
- **Application Insights**: Nadzor in beleženje
- **Log Analytics Workspace**: Centralizirano shranjevanje dnevnikov

**Primer**: Predstavljajte si to kot restavracijo (spletna aplikacija) z večjim zamrzovalnikom (podatkovna baza). Stranke naročajo s menija (API končne točke), kuhinja (Flask aplikacija) pridobi sestavine (podatke) iz zamrzovalnika. Vodja restavracije (Application Insights) spremlja vse, kar se dogaja.

## Struktura map

Vse datoteke so vključene v ta primer—brez potrebnih zunanjih odvisnosti:

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

**Kaj dela vsaka datoteka:**
- **azure.yaml**: Pove AZD, kaj naj razmestiti in kam
- **infra/main.bicep**: Orkestrira vse Azure vire
- **infra/resources/*.bicep**: Posamezne definicije virov (modularno za ponovno uporabo)
- **src/web/app.py**: Flask aplikacija z logiko baze podatkov
- **requirements.txt**: Odvisnosti paketov Python
- **Dockerfile**: Navodila za kontejnerizacijo za razmestitev

## Hitri začetek (korak za korakom)

### Korak 1: Klonirajte in se premaknite

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Preverjanje uspeha**: Preverite, da vidite `azure.yaml` in mapo `infra/`:
```sh
ls
# Pričakovano: README.md, azure.yaml, infra/, src/
```

### Korak 2: Avtentikacija v Azure

```sh
azd auth login
```

To odpre vaš brskalnik za Azure avtentikacijo. Prijavite se z vašimi Azure poverilnicami.

**✓ Preverjanje uspeha**: Morali bi videti:
```
Logged in to Azure.
```

### Korak 3: Inicializirajte okolje

```sh
azd init
```

**Kaj se zgodi**: AZD ustvari lokalno konfiguracijo za vašo razmestitev.

**Pozivi, ki jih boste videli**:
- **Ime okolja**: Vnesite kratko ime (npr. `dev`, `myapp`)
- **Azure naročnina**: Izberite vašo naročnino s seznama
- **Lokacija Azure**: Izberite regijo (npr. `eastus`, `westeurope`)

**✓ Preverjanje uspeha**: Morali bi videti:
```
SUCCESS: New project initialized!
```

### Korak 4: Zagotovitev virov v Azure

```sh
azd provision
```

**Kaj se zgodi**: AZD razmestí vso infrastrukturo (traja 5–8 minut):
1. Ustvari skupino virov
2. Ustvari SQL Server in bazo
3. Ustvari App Service Plan
4. Ustvari Web App
5. Ustvari Application Insights
6. Konfigurira omrežje in varnost

**Boste pozvani za**:
- **Uporabniško ime SQL skrbnika**: Vnesite uporabniško ime (npr. `sqladmin`)
- **Geslo SQL skrbnika**: Vnesite močno geslo (shranite ga!)

**✓ Preverjanje uspeha**: Morali bi videti:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Čas**: 5–8 minut

### Korak 5: Razmestitev aplikacije

```sh
azd deploy
```

**Kaj se zgodi**: AZD zgradi in razmesti vašo Flask aplikacijo:
1. Pakira Python aplikacijo
2. Zgradi Docker kontejner
3. Potisne v Azure Web App
4. Inicializira bazo s primeri podatkov
5. Zažene aplikacijo

**✓ Preverjanje uspeha**: Morali bi videti:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Čas**: 3–5 minut

### Korak 6: Ogled aplikacije v brskalniku

```sh
azd browse
```

To odpre vašo razmestjeno spletno aplikacijo v brskalniku na `https://app-<unique-id>.azurewebsites.net`

**✓ Preverjanje uspeha**: Morali bi videti JSON izhod:
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

### Korak 7: Preizkusite API končne točke

**Preverjanje stanja** (preverite povezavo z bazo):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Pričakovani odgovor**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**Seznam izdelkov** (vzorčni podatki):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Pričakovani odgovor**:
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

**Pridobi posamezen izdelek**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Preverjanje uspeha**: Vse končne točke vrnejo JSON podatke brez napak.

---

**🎉 Čestitamo!** Uspešno ste razmestili spletno aplikacijo z bazo v Azure z uporabo AZD.

## Poglobljen pregled konfiguracije

### Spremenljivke okolja

Skrivnosti se varno upravljajo prek konfiguracije Azure App Service—**nikoli trdo zakodirane v izvorni kodi**.

**Samodejno konfigurirano z AZD**:
- `SQL_CONNECTION_STRING`: Povezava z bazo s šifriranimi poverilnicami
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Končna točka telemetrije za nadzor
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Omogoča samodejno namestitev odvisnosti

**Kje so skrivnosti shranjene**:
1. Med `azd provision` zagotovite SQL poverilnice prek varnih pozivov
2. AZD jih shrani v lokalno datoteko `.azure/<env-name>/.env` (izključeno iz Gita)
3. AZD jih injicira v konfiguracijo Azure App Service (šifrirano v mirovanju)
4. Aplikacija jih bere prek `os.getenv()` med izvajanjem

### Lokalni razvoj

Za lokalno testiranje ustvarite datoteko `.env` iz vzorca:

```sh
cp .env.sample .env
# Uredi datoteko .env z lokalno povezavo do baze podatkov
```

**Potek dela za lokalni razvoj**:
```sh
# Namestite odvisnosti
cd src/web
pip install -r requirements.txt

# Nastavite spremenljivke okolja
export SQL_CONNECTION_STRING="your-local-connection-string"

# Zaženite aplikacijo
python app.py
```

**Preizkusite lokalno**:
```sh
curl http://localhost:8000/health
# Pričakovano: {"stanje": "zdravo", "baza": "povezana"}
```

### Infrastruktura kot koda

Vsi Azure viri so definirani v **Bicep predlogah** (`infra/` mapa):

- **Modularna zasnova**: Vsaka vrsta vira ima svojo datoteko za ponovno uporabo
- **Parametrizirano**: Prilagodite SKU-je, regije, konvencije poimenovanja
- **Najboljše prakse**: Sledi Azure standardom poimenovanja in privzetim varnostnim nastavitvam
- **Nadzor različic**: Spremembe infrastrukture so sledene v Gitu

**Primer prilagoditve**:
Če želite spremeniti nivo baze, uredite `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Najboljše varnostne prakse

Ta primer sledi najboljšim varnostnim praksam Azure:

### 1. **Brez skrivnosti v izvorni kodi**
- ✅ Poverilnice shranjene v konfiguraciji Azure App Service (šifrirane)
- ✅ Datoteke `.env` izključene iz Gita prek `.gitignore`
- ✅ Skrivnosti posredovane prek varnih parametrov med zagotavljanjem

### 2. **Šifrirane povezave**
- ✅ Najmanj TLS 1.2 za SQL Server
- ✅ Zahtevano samo HTTPS za Web App
- ✅ Povezave z bazo uporabljajo šifrirane kanale

### 3. **Omrežna varnost**
- ✅ Firewall SQL Serverja nastavljen tako, da dovoli samo Azure storitve
- ✅ Javni dostop do omrežja omejen (lahko dodatno zavarovano s Private Endpoints)
- ✅ FTPS onemogočen na Web App

### 4. **Avtentikacija in avtorizacija**
- ⚠️ **Trenutno**: SQL avtentikacija (uporabniško ime/geslo)
- ✅ **Priporočilo za produkcijo**: Uporabite Azure Managed Identity za avtentikacijo brez gesla

**Za nadgradnjo na Managed Identity** (za produkcijo):
1. Omogočite managed identity na Web App
2. Dodelite identiteti dovoljenja v SQL
3. Posodobite connection string, da uporablja managed identity
4. Odstranite avtentikacijo na podlagi gesel

### 5. **Revizija in skladnost**
- ✅ Application Insights beleži vse zahteve in napake
- ✅ Revizija SQL baze omogočena (lahko je konfigurirana za skladnost)
- ✅ Vsi viri označeni za upravljanje

**Varnostni kontrolni seznam pred produkcijo**:
- [ ] Omogočite Azure Defender za SQL
- [ ] Konfigurirajte Private Endpoints za SQL bazo
- [ ] Omogočite Web Application Firewall (WAF)
- [ ] Uvedite Azure Key Vault za rotacijo skrivnosti
- [ ] Konfigurirajte Azure AD avtentikacijo
- [ ] Omogočite diagnostično beleženje za vse vire

## Optimizacija stroškov

**Ocenjeni mesečni stroški** (stanje november 2025):

| Vir | SKU/Nivo | Ocenjeni strošek |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13/month |
| SQL Database | Basic (2GB) | ~$5/month |
| Application Insights | Pay-as-you-go | ~$2/month (low traffic) |
| **Skupaj** | | **~$20/month** |

**💡 Nasveti za varčevanje stroškov**:

1. **Uporabite brezplačni nivo za učenje**:
   - App Service: F1 nivo (brezplačno, omejene ure)
   - SQL Database: Uporabite Azure SQL Database serverless
   - Application Insights: 5GB/month free ingestion

2. **Ustavite vire, ko niso v uporabi**:
   ```sh
   # Ustavi spletno aplikacijo (baza podatkov še vedno povzroča stroške)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Ponovno zaženi po potrebi
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Izbrišite vse po testiranju**:
   ```sh
   azd down
   ```
   To odstrani VSE vire in ustavi stroške.

4. **Razvojna in produkcijska SKU-ja**:
   - **Razvoj**: Osnovni nivo (uporabljen v tem primeru)
   - **Produkcija**: Standardni/Premium nivo z redundanco

**Nadzor stroškov**:
- Ogled stroškov v [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Nastavite opozorila o stroških, da se izognete nepričakovanim stroškom
- Označite vse vire z `azd-env-name` za sledenje

**Brezplačna alternativa**:
Za učenje lahko spremenite `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Opomba**: Brezplačni nivo ima omejitve (60 min/dan CPU, brez always-on).

## Nadzor in opazljivost

### Integracija Application Insights

Ta primer vključuje **Application Insights** za celovito spremljanje:

**Kaj se nadzira**:
- ✅ HTTP zahtevki (zakasnitev, statusne kode, končne točke)
- ✅ Napake in izjeme aplikacije
- ✅ Prilagojeno beleženje iz Flask aplikacije
- ✅ Zdravje povezave z bazo
- ✅ Merilniki zmogljivosti (CPU, pomnilnik)

**Dostop do Application Insights**:
1. Odprite [Azure Portal](https://portal.azure.com)
2. Pomaknite se v vašo skupino virov (`rg-<env-name>`)
3. Kliknite na Application Insights vir (`appi-<unique-id>`)

**Uporabne poizvedbe** (Application Insights → Logs):

**Poglej vse zahtevke**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Poišči napake**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Preverite health endpoint**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### Revizija SQL baze podatkov

**Revizija SQL baze je omogočena** za sledenje:
- Vzorcev dostopa do baze
- Poskusov neuspešne prijave
- Sprememb sheme
- Dostopa do podatkov (za skladnost)

**Dostop do revizijskih dnevnikov**:
1. Azure Portal → SQL Database → Auditing
2. Ogled dnevnikov v Log Analytics workspace

### Nadzor v realnem času

**Poglejte žive meritve**:
1. Application Insights → Live Metrics
2. Oglejte si zahtevke, napake in zmogljivost v realnem času

**Nastavite opozorila**:
Ustvarite opozorila za kritične dogodke:
- HTTP 500 napak > 5 v 5 minutah
- Napake povezave z bazo
- Visoki časi odziva (>2 sekund)

**Primer ustvarjanja opozorila**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Odpravljanje težav

### Pogoste težave in rešitve

#### 1. `azd provision` ne uspe z napako "Location not available"

**Simptom**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Rešitev**:
Izberite drugo regijo Azure ali registrirajte ponudnika virov:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Povezava s SQL ne uspe med nameščanjem

**Simptom**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Rešitev**:
- Preverite, ali požarni zid SQL strežnika dovoljuje storitve Azure (samodejno konfigurirano)
- Preverite, ali je bilo geslo skrbnika za SQL pravilno vneseno med `azd provision`
- Poskrbite, da je SQL Server popolnoma vzpostavljen (lahko traja 2-3 minute)

**Preverite povezavo**:
```sh
# V Azure portalu pojdite na SQL Database → Urejevalnik poizvedb
# Poskusite se povezati s svojimi prijavnimi podatki
```

#### 3. Spletna aplikacija prikazuje "Application Error"

**Simptom**:
Brskalnik prikaže splošno stran z napako.

**Rešitev**:
Preverite dnevnike aplikacije:
```sh
# Prikaži nedavne dnevnike
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Pogosti vzroki**:
- Manjkajoče spremenljivke okolja (preverite App Service → Konfiguracija)
- Namestitev Python paketov ni uspela (preverite dnevnike nameščanja)
- Napaka pri inicializaciji baze podatkov (preverite povezljivost s SQL)

#### 4. `azd deploy` ne uspe z "Build Error"

**Simptom**:
```
Error: Failed to build project
```

**Rešitev**:
- Prepričajte se, da `requirements.txt` nima sintaktičnih napak
- Preverite, da je Python 3.11 naveden v `infra/resources/web-app.bicep`
- Preverite, da Dockerfile uporablja pravilno osnovno sliko

**Odpravljanje napak lokalno**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Unauthorized" pri izvajanju AZD ukazov

**Simptom**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Rešitev**:
Ponovno se prijavite v Azure:
```sh
azd auth login
az login
```

Preverite, da imate pravilne pravice (vloga Contributor) na naročnino.

#### 6. Visoki stroški baze podatkov

**Simptom**:
Nepričakovani račun za Azure.

**Rešitev**:
- Preverite, ali ste po testiranju pozabili izvesti `azd down`
- Preverite, da SQL Database uporablja stopnjo Basic (ne Premium)
- Preglejte stroške v Azure Cost Management
- Nastavite opozorila za stroške

### Pridobivanje pomoči

**Prikaži vse AZD spremenljivke okolja**:
```sh
azd env get-values
```

**Preverite stanje nameščanja**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Dostop do dnevnikov aplikacije**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Potrebujete več pomoči?**
- [Vodnik za odpravljanje težav AZD](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Odpravljanje težav Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Odpravljanje težav z Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Praktične vaje

### Vaja 1: Preverite svojo namestitev (Začetnik)

**Cilj**: Potrdite, da so vsi viri nameščeni in da aplikacija deluje.

**Koraki**:
1. Prikažite vse vire v vaši skupini virov:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Pričakovano**: 6-7 resources (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Preizkusite vse API končne točke:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Pričakovano**: Vse vrnejo veljaven JSON brez napak

3. Preverite Application Insights:
   - Pojdite v Application Insights v Azure Portal
   - Pojdite na "Live Metrics"
   - Osvežite stran spletne aplikacije v brskalniku
   **Pričakovano**: Videti zahtevke v realnem času

**Kriteriji uspeha**: Vsi 6-7 viri obstajajo, vse končne točke vračajo podatke, Live Metrics prikazuje aktivnost.

---

### Vaja 2: Dodajte novo API končno točko (Srednje zahtevno)

**Cilj**: Razširite Flask aplikacijo z novo končno točko.

**Izhodiščna koda**: Trenutne končne točke v `src/web/app.py`

**Koraki**:
1. Uredite `src/web/app.py` in dodajte novo končno točko po funkciji `get_product()`:
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

2. Razmestite posodobljeno aplikacijo:
   ```sh
   azd deploy
   ```

3. Preizkusite novo končno točko:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Pričakovano**: Vrne izdelke, ki se ujemajo z "laptop"

**Kriteriji uspeha**: Nova končna točka deluje, vrača filtrirane rezultate, se prikaže v dnevnikih Application Insights.

---

### Vaja 3: Dodajte spremljanje in opozorila (Napredno)

**Cilj**: Nastavite proaktivno spremljanje z opozorili.

**Koraki**:
1. Ustvarite opozorilo za napake HTTP 500:
   ```sh
   # Pridobi ID vira Application Insights
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Ustvari opozorilo
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Sprožite opozorilo tako, da povzročite napake:
   ```sh
   # Zahteva za neobstoječ izdelek
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Preverite, ali je opozorilo sproženo:
   - Azure Portal → Alerts → Alert Rules
   - Preverite svoj e-poštni predal (če je konfigurirano)

**Kriteriji uspeha**: Pravilo opozorila je ustvarjeno, se sproži ob napakah, prejmete obvestila.

---

### Vaja 4: Spremembe sheme baze podatkov (Napredno)

**Cilj**: Dodajte novo tabelo in spremenite aplikacijo, da jo uporablja.

**Koraki**:
1. Povežite se z SQL Database prek Azure Portal Query Editor

2. Ustvarite novo tabelo `categories`:
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

3. Posodobite `src/web/app.py`, da v odzivih vključuje informacije o kategorijah

4. Razmestite in preizkusite

**Kriteriji uspeha**: Nova tabela obstaja, izdelki prikazujejo informacije o kategorijah, aplikacija še vedno deluje.

---

### Vaja 5: Implementirajte predpomnjenje (Strokovno)

**Cilj**: Dodajte Azure Redis Cache za izboljšanje zmogljivosti.

**Koraki**:
1. Dodajte Redis Cache v `infra/main.bicep`
2. Posodobite `src/web/app.py`, da predpomni poizvedbe po izdelkih
3. Izmerite izboljšanje zmogljivosti z Application Insights
4. Primerjajte čase odziva pred/po predpomnjenju

**Kriteriji uspeha**: Redis je razmeščen, predpomnjenje deluje, časi odziva so izboljšani za >50%.

**Namig**: Začnite z [Dokumentacija Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Čiščenje

Da se izognete nadaljnjim stroškom, izbrišite vse vire, ko končate:

```sh
azd down
```

**Poziv za potrditev**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Vnesite `y` za potrditev.

**✓ Preverjanje uspeha**: 
- Vsi viri so izbrisani iz Azure Portala
- Brez nadaljnjih stroškov
- Lokalno mapo `.azure/<env-name>` lahko izbrišete

**Alternativa** (obdržite infrastrukturo, izbrišite podatke):
```sh
# Izbriši samo skupino virov (ohrani konfiguracijo AZD)
az group delete --name rg-<env-name> --yes
```
## Več informacij

### Povezana dokumentacija
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentacija Azure SQL Database](https://learn.microsoft.com/azure/azure-sql/database/)
- [Dokumentacija Azure App Service](https://learn.microsoft.com/azure/app-service/)
- [Dokumentacija Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Referenca jezika Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Naslednji koraki v tem tečaju
- **[Primer Container Apps](../../../../examples/container-app)**: Razmestite mikroservise z Azure Container Apps
- **[Vodnik za integracijo AI](../../../../docs/ai-foundry)**: Dodajte AI zmožnosti svoji aplikaciji
- **[Najboljše prakse razmestitve](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Vzorci razmestitve v produkcijo

### Napredne teme
- **Upravljana identiteta**: Odstranite gesla in uporabite avtentikacijo Azure AD
- **Zasebne končne točke**: Zavarujte povezave do baze znotraj virtualnega omrežja
- **Integracija CI/CD**: Avtomatizirajte razmestitve z GitHub Actions ali Azure DevOps
- **Več okolij**: Nastavite razvojno, preizkusno in produkcijsko okolje
- **Migracije baze podatkov**: Uporabite Alembic ali Entity Framework za verzioniranje sheme

### Primerjava z drugimi pristopi

**AZD v primerjavi z ARM predlogami**:
- ✅ AZD: Višja abstrakcija, enostavnejši ukazi
- ⚠️ ARM: Bolj obsežno, podrobnejši nadzor

**AZD v primerjavi s Terraformom**:
- ✅ AZD: Nativno za Azure, integrirano s storitvami Azure
- ⚠️ Terraform: Podpora za več oblakov, večji ekosistem

**AZD v primerjavi z Azure Portal**:
- ✅ AZD: Ponovljivo, verzionirano, avtomatizirano
- ⚠️ Portal: Ročno klikkanje, težko reproducirati

**AZD si predstavljajte kot**: Docker Compose za Azure—poenostavljena konfiguracija za kompleksna razmestitve.

---

## Pogosta vprašanja

**Q: Ali lahko uporabim drug programski jezik?**  
A: Da! Zamenjajte `src/web/` z Node.js, C#, Go ali katerim koli drugim jezikom. Posodobite `azure.yaml` in Bicep ustrezno.

**Q: Kako dodam več baz podatkov?**  
A: Dodajte še en modul SQL Database v `infra/main.bicep` ali uporabite PostgreSQL/MySQL iz storitev Azure Database.

**Q: Ali lahko to uporabim v produkciji?**  
A: To je izhodišče. Za produkcijo dodajte: upravljano identiteto, zasebne končne točke, redundanco, strategijo varnostnih kopij, WAF in izboljšano spremljanje.

**Q: Kaj, če želim uporabiti kontejnerje namesto razmestitve kode?**  
A: Oglejte si [Primer Container Apps](../../../../examples/container-app), ki uporablja Docker kontejnerje povsod.

**Q: Kako se povežem z bazo iz lokalnega računalnika?**  
A: Dodajte svoj IP v požarni zid SQL Serverja:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Q: Ali lahko uporabim obstoječo bazo namesto ustvarjanja nove?**  
A: Da, prilagodite `infra/main.bicep`, da se sklicuje na obstoječi SQL Server in posodobite parametre niza za povezavo.

---

> **Opomba:** Ta primer prikazuje najboljše prakse za razmestitev spletne aplikacije z bazo podatkov z uporabo AZD. Vključuje delujočo kodo, obsežno dokumentacijo in praktične vaje za utrditev učenja. Za razmestitve v produkcijo preglejte varnostne, skalabilnostne, skladnostne in stroškovne zahteve, ki so značilne za vašo organizacijo.

**📚 Navigacija tečaja:**
- ← Prejšnja: [Primer Container Apps](../../../../examples/container-app)
- → Naslednja: [Vodnik za integracijo AI](../../../../docs/ai-foundry)
- 🏠 [Domača stran tečaja](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o omejitvi odgovornosti**:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku velja za avtoritativni vir. Za ključne informacije priporočamo strokovni človeški prevod. Ne odgovarjamo za morebitne nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->