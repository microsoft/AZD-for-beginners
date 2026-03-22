# Deploying a Microsoft SQL Database and Web App with AZD

⏱️ **Ocenjeni čas**: 20–30 minut | 💰 **Ocenjeni strošek**: ~$15–25/mesec | ⭐ **Zapletenost**: Srednje zahtevno

Ta **popoln, delujoč primer** prikazuje, kako uporabiti [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) za razmestitev spletne aplikacije Python Flask z Microsoft SQL podatkovno bazo v Azure. Vsa koda je vključena in preizkušena—ni potrebnih zunanjih odvisnosti.

## Kaj se boste naučili

Z dokončanjem tega primera boste:
- Razmestili večslojno aplikacijo (spletna aplikacija + baza) z uporabo infrastrukture kot kode
- Konfigurirali varne povezave do baze brez trdno kodiranih skrivnosti
- Spremljali zdravje aplikacije z Application Insights
- Učinkovito upravljali Azure vire z AZD CLI
- Sledili najboljšim praksam Azura za varnost, optimizacijo stroškov in opazljivost

## Pregled scenarija
- **Spletna aplikacija**: Python Flask REST API s povezljivostjo z bazo
- **Baza**: Azure SQL Database s primeri podatkov
- **Infrastruktura**: Zagotovljena z Bicep (modularne, ponovno uporabne predloge)
- **Razmestitev**: Popolnoma avtomatizirano z ukazi `azd`
- **Nadzor**: Application Insights za dnevnike in telemetrijo

## Zahteve

### Potrebna orodja

Pred začetkom preverite, da imate nameščena ta orodja:

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
   # Pričakovan izhod: Python 3.8 ali novejši
   ```

4. **[Docker](https://www.docker.com/get-started)** (neobvezno, za lokalni razvoj v vsebniku)
   ```sh
   docker --version
   # Pričakovan izhod: različica Dockera 20.10 ali novejša
   ```

### Zahteve za Azure

- Aktivno **Azure naročnino** ([ustvarite brezplačen račun](https://azure.microsoft.com/free/))
- Pooblastila za ustvarjanje virov v vaši naročnini
- Vloga **Owner** ali **Contributor** v naročnini ali skupini virov

### Predznanje

To je primer na **srednji ravni**. Priporočeno je, da poznate:
- Osnovno delo v ukazni vrstici
- Temeljne koncepte oblaka (viri, skupine virov)
- Osnovno razumevanje spletnih aplikacij in podatkovnih baz

**Novo pri AZD?** Najprej začnite z [Getting Started guide](../../docs/chapter-01-foundation/azd-basics.md).

## Arhitektura

Ta primer razmestitve uporablja dvonivojsko arhitekturo s spletno aplikacijo in SQL bazo:

```mermaid
graph TD
    Browser[Uporabnikov brskalnik] <--> WebApp[Azure spletna aplikacija<br/>Flask API<br/>/health<br/>/products]
    WebApp -- Varna povezava<br/>Šifrirano --> SQL[Azure SQL baza podatkov<br/>tabela Products<br/>vzorečni podatki]
```
**Razmestitev virov:**
- **Resource Group**: Posoda za vse vire
- **App Service Plan**: Gostovanje na Linuxu (B1 raven za ekonomičnost)
- **Web App**: Python 3.11 runtime s Flask aplikacijo
- **SQL Server**: Upravljan strežnik baze s TLS 1.2 ali višjim
- **SQL Database**: Basic raven (2GB, primerna za razvoj/testiranje)
- **Application Insights**: Nadzor in beleženje
- **Log Analytics Workspace**: Centralizirano shranjevanje dnevnikov

**Analogia**: Predstavljajte si to kot restavracijo (spletna aplikacija) z industrijskim hladilnikom (baza). Stranke naročajo iz menija (API končne točke), kuhinja (Flask aplikacija) pa pridobiva sestavine (podatke) iz hladilnika. Vodja restavracije (Application Insights) spremlja vse, kar se dogaja.

## Struktura mape

Vsi datoteki so vključeni v ta primer—ni potrebnih zunanjih odvisnosti:

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

**Kaj posamezna datoteka počne:**
- **azure.yaml**: Pove AZD, kaj razmestiti in kam
- **infra/main.bicep**: Orkestrira vse Azure vire
- **infra/resources/*.bicep**: Posamezne definicije virov (modularno za ponovno uporabo)
- **src/web/app.py**: Flask aplikacija z logiko baze
- **requirements.txt**: Odvisnosti Python paketov
- **Dockerfile**: Navodila za kontejnerizacijo za razmestitev

## Hitri začetek (korak za korakom)

### Korak 1: Klonirajte in pojdite v mapo

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Preverjanje uspeha**: Preverite, ali vidite `azure.yaml` in mapo `infra/`:
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
- **Environment name**: Vnesite kratek naziv (npr. `dev`, `myapp`)
- **Azure subscription**: Izberite vašo naročnino s seznama
- **Azure location**: Izberite regijo (npr. `eastus`, `westeurope`)

**✓ Preverjanje uspeha**: Morali bi videti:
```
SUCCESS: New project initialized!
```

### Korak 4: Zagotovite Azure vire

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

**Prosili vas bodo za**:
- **SQL admin username**: Vnesite uporabniško ime (npr. `sqladmin`)
- **SQL admin password**: Vnesite močno geslo (shranite ga!)

**✓ Preverjanje uspeha**: Morali bi videti:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Čas**: 5–8 minut

### Korak 5: Razmestite aplikacijo

```sh
azd deploy
```

**Kaj se zgodi**: AZD zgradi in razmestí vašo Flask aplikacijo:
1. Pakira Python aplikacijo
2. Zgradi Docker vsebnik
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

### Korak 6: Brskajte po aplikaciji

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

**Preverjanje zdravja** (preverite povezavo z bazo):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Pričakovan odgovor**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**Seznam izdelkov** (primeri podatkov):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Pričakovan odgovor**:
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

**Pridobi en izdelek**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Preverjanje uspeha**: Vse končne točke vrnejo JSON podatke brez napak.

---

**🎉 Čestitamo!** Uspešno ste razmestili spletno aplikacijo z bazo v Azure z uporabo AZD.

## Poglobljena konfiguracija

### Spremenljivke okolja

Skrivnosti so varno upravljane prek konfiguracije Azure App Service—**nikoli ne trdo kodirajte v izvorni kodi**.

**Samodejno konfigurirano z AZD**:
- `SQL_CONNECTION_STRING`: Povezava do baze z enkriptiranimi poverilnicami
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Endpoint telemetrije za nadzor
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Omogoča samodejno nameščanje odvisnosti

**Kje so skrivnosti shranjene**:
1. Med `azd provision` vnesete SQL poverilnice prek varnih pozivov
2. AZD jih shrani v vašo lokalno datoteko `.azure/<env-name>/.env` (izključeno iz gita)
3. AZD jih injicira v konfiguracijo Azure App Service (šifrirano v mirovanju)
4. Aplikacija jih bere prek `os.getenv()` ob času izvajanja

### Lokalni razvoj

Za lokalno testiranje ustvarite `.env` datoteko iz vzorca:

```sh
cp .env.sample .env
# Uredite .env z lokalno povezavo do baze podatkov
```

**Lokalni razvojni potek**:
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
# Pričakovano: {"status": "healthy", "database": "connected"}
```

### Infrastruktura kot koda

Vsi Azure viri so definirani v **Bicep predlogah** (mapa `infra/`):

- **Modularna zasnova**: Vsaka vrsta vira ima svojo datoteko za ponovno uporabo
- **Parametrizirano**: Prilagodite SKU-je, regije, konvencije poimenovanja
- **Najboljše prakse**: Sledi Azure standardom za poimenovanje in varnostnim privzetim nastavitvam
- **Vodenje različic**: Spremembe infrastrukture se sledijo v Gitu

**Primer prilagoditve**:
Če želite spremeniti raven baze, uredite `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Varnostne najboljše prakse

Ta primer sledi Azure varnostnim najboljšim praksam:

### 1. **Brez skrivnosti v izvorni kodi**
- ✅ Poverilnice shranjene v konfiguraciji Azure App Service (šifrirano)
- ✅ `.env` datoteke izključene iz Gita prek `.gitignore`
- ✅ Skrivnosti posredovane kot varni parametri med zagotavljanjem

### 2. **Šifrirane povezave**
- ✅ TLS 1.2 ali višje za SQL Server
- ✅ Za spletno aplikacijo je obvezno HTTPS
- ✅ Povezave do baze uporabljajo šifrirane kanale

### 3. **Omrežna varnost**
- ✅ SQL Server požarno pravilo konfigurirano za dovoljenje samo Azure storitvam
- ✅ Dostop preko javnega omrežja omejen (lahko se dodatno zapre s Private Endpoints)
- ✅ FTPS onemogočen na Web App

### 4. **Avtentikacija in avtorizacija**
- ⚠️ **Trenutno**: SQL avtentikacija (uporabniško ime/geslo)
- ✅ **Priporočilo za produkcijo**: Uporabite Azure Managed Identity za avtentikacijo brez gesel

**Za nadgradnjo na Managed Identity** (za produkcijo):
1. Omogočite managed identity na Web App
2. Dodelite identiteti pravice v SQL
3. Posodobite connection string za uporabo managed identity
4. Odstranite avtentikacijo z geslom

### 5. **Revizija in skladnost**
- ✅ Application Insights beleži vse zahteve in napake
- ✅ Revizija SQL baze vključena (lahko se konfigurira za skladnost)
- ✅ Vsi viri označeni za upravljanje

**Kontrolni seznam za varnost pred produkcijo**:
- [ ] Omogočite Azure Defender za SQL
- [ ] Konfigurirajte Private Endpoints za SQL Database
- [ ] Omogočite Web Application Firewall (WAF)
- [ ] Uvedite Azure Key Vault za rotacijo skrivnosti
- [ ] Konfigurirajte Azure AD avtentikacijo
- [ ] Omogočite diagnostično beleženje za vse vire

## Optimizacija stroškov

**Ocenjeni mesečni stroški** (stanje november 2025):

| Resource | SKU/Tier | Estimated Cost |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13/month |
| SQL Database | Basic (2GB) | ~$5/month |
| Application Insights | Pay-as-you-go | ~$2/month (nizek promet) |
| **Total** | | **~$20/month** |

**💡 Nasveti za varčevanje**:

1. **Uporabite brezplačno plast za učenje**:
   - App Service: F1 raven (brezplačno, omejene ure)
   - SQL Database: Uporabite Azure SQL Database serverless
   - Application Insights: 5GB/mesec brezplačen vnos

2. **Ustavite vire, ko jih ne uporabljate**:
   ```sh
   # Ustavi spletno aplikacijo (baza podatkov še vedno obračunava stroške)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Ponovno zaženi po potrebi
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Izbrišite vse po testiranju**:
   ```sh
   azd down
   ```
   To odstrani VSE vire in ustavi stroške.

4. **Razvojni proti produkcijskim SKUjem**:
   - **Razvoj**: Basic raven (uporabljeno v tem primeru)
   - **Produkcija**: Standard/Premium raven z redundanco

**Spremljanje stroškov**:
- Ogled stroškov v [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Nastavite opozorila za stroške, da se izognete presenečenjem
- Označite vse vire z `azd-env-name` za sledenje

**Brezplačna alternativa**:
Za učenje lahko spremenite `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Opomba**: Brezplačna plast ima omejitve (60 min/dan CPU, brez vedno vklopljeno).

## Nadzor in opazljivost

### Integracija Application Insights

Ta primer vključuje **Application Insights** za obsežen nadzor:

**Kaj se nadzira**:
- ✅ HTTP zahteve (zakasnitev, statusne kode, končne točke)
- ✅ Napake in izjeme aplikacije
- ✅ Lastno beleženje iz Flask aplikacije
- ✅ Zdravje povezave do baze
- ✅ Metrični podatki o zmogljivosti (CPU, pomnilnik)

**Dostop do Application Insights**:
1. Odprite [Azure Portal](https://portal.azure.com)
2. Pojdite v vašo skupino virov (`rg-<env-name>`)
3. Kliknite na Application Insights vir (`appi-<unique-id>`)

**Uporabne poizvedbe** (Application Insights → Logs):

**Prikaži vse zahteve**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Najdi napake**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Preveri health endpoint**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### Revizija SQL baze

**Revizija SQL baze je omogočena** za sledenje:
- Vzorcev dostopa do baze
- Neuspelih poskusov prijave
- Sprememb sheme
- Dosto pa do podatkov (za skladnost)

**Dostop do revizijskih zapisov**:
1. Azure Portal → SQL Database → Auditing
2. Preglejte zapise v Log Analytics workspace

### Spremljanje v realnem času

**Prikaži Live Metrics**:
1. Application Insights → Live Metrics
2. Oglejte si zahteve, napake in zmogljivost v realnem času

**Nastavite opozorila**:
Ustvarite opozorila za kritične dogodke:
- HTTP 500 napake > 5 v 5 minutah
- Napake povezave do baze
- Visoki časi odziva (>2 sekundi)

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

#### 2. Povezava SQL ne uspe med uvajanjem

**Simptom**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Rešitev**:
- Preverite, da požarni zid SQL Serverja dovoljuje storitve Azure (nastavljeno samodejno)
- Preverite, da je skrbniško geslo za SQL pravilno vneseno med `azd provision`
- Prepričajte se, da je SQL Server popolnoma vzpostavljen (lahko traja 2-3 minute)

**Preveri povezavo**:
```sh
# V portalu Azure pojdite na SQL Database → Query editor
# Poskusite se povezati s svojimi poverilnicami
```

#### 3. Web App prikaže "Application Error"

**Simptom**:
Brskalnik prikaže splošno stran z napako.

**Rešitev**:
Preverite dnevnike aplikacije:
```sh
# Prikaži nedavne dnevnike
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Pogosti vzroki**:
- Manjkajoče spremenljivke okolja (preverite App Service → Configuration)
- Namestitev Python paketov ni uspela (preverite dnevniške zapise uvajanja)
- Napaka pri inicializaciji baze podatkov (preverite povezljivost do SQL)

#### 4. `azd deploy` ne uspe z napako "Build Error"

**Simptom**:
```
Error: Failed to build project
```

**Rešitev**:
- Prepričajte se, da datoteka `requirements.txt` nima sintaktičnih napak
- Preverite, da je Python 3.11 naveden v `infra/resources/web-app.bicep`
- Preverite, da ima Dockerfile pravilno osnovno sliko

**Odpravljanje napak lokalno**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Unauthorized" pri izvajanju ukazov AZD

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

Preverite, da imate ustrezna dovoljenja (vloga Contributor) za naročnino.

#### 6. Visoki stroški baze podatkov

**Simptom**:
Nepričakovan račun za Azure.

**Rešitev**:
- Preverite, ali ste pozabili zagnati `azd down` po testiranju
- Preverite, da SQL Database uporablja Basic stopnjo (ne Premium)
- Preglejte stroške v Azure Cost Management
- Nastavite opozorila za stroške

### Pridobivanje pomoči

**Prikaži vse AZD spremenljivke okolja**:
```sh
azd env get-values
```

**Preverite stanje uvajanja**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Dostop do dnevnikov aplikacije**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Potrebujete več pomoči?**
- [Vodnik za odpravljanje težav z AZD](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Odpravljanje težav z Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Odpravljanje težav z Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Praktične vaje

### Vaja 1: Preverite svoje uvajanje (Začetnik)

**Cilj**: Potrdite, da so vsi viri nameščeni in da aplikacija deluje.

**Koraki**:
1. Naštejte vse vire v vaši skupini virov:
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
   - Pojdite v Application Insights v Azure Portalu
   - Pojdite na "Live Metrics"
   - Osvežite brskalnik pri spletni aplikaciji
   **Pričakovano**: Vidite zahteve, ki se prikazujejo v realnem času

**Kriteriji uspeha**: Vsi 6-7 virov obstajajo, vse končne točke vračajo podatke, Live Metrics prikazuje aktivnost.

---

### Vaja 2: Dodajte novo API končno točko (Srednje zahtevno)

**Cilj**: Razširite Flask aplikacijo z novo končno točko.

**Začetna koda**: Trenutne končne točke v `src/web/app.py`

**Koraki**:
1. Uredite `src/web/app.py` in dodajte novo končno točko za funkcijo `get_product()`:
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

2. Uvedite posodobljeno aplikacijo:
   ```sh
   azd deploy
   ```

3. Preizkusite novo končno točko:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Pričakovano**: Vrne izdelke, ki se ujemajo z "laptop"

**Kriteriji uspeha**: Nova končna točka deluje, vrača filtrirane rezultate, se prikaže v zapisnikih Application Insights.

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

2. Sprožite opozorilo s povzročanjem napak:
   ```sh
   # Zahtevaj neobstoječi izdelek
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Preverite, ali je opozorilo sproženo:
   - Azure Portal → Alerts → Alert Rules
   - Preverite svoj e-poštni predal (če je konfigurirano)

**Kriteriji uspeha**: Pravilo opozorila je ustvarjeno, sproži se ob napakah, prejeta so obvestila.

---

### Vaja 4: Spremembe sheme baze podatkov (Napredno)

**Cilj**: Dodajte novo tabelo in prilagodite aplikacijo, da jo uporablja.

**Koraki**:
1. Povežite se z SQL Database prek Query Editor v Azure Portalu

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

3. Posodobite `src/web/app.py`, da vključuje informacije o kategorijah v odgovorih

4. Uvedite in preizkusite

**Kriteriji uspeha**: Nova tabela obstaja, izdelki prikazujejo informacije o kategoriji, aplikacija še vedno deluje.

---

### Vaja 5: Implementirajte predpomnjenje (Strokovno)

**Cilj**: Dodajte Azure Redis Cache za izboljšanje zmogljivosti.

**Koraki**:
1. Dodajte Redis Cache v `infra/main.bicep`
2. Posodobite `src/web/app.py` za predpomnjenje poizvedb izdelkov
3. Izmerite izboljšanje zmogljivosti z Application Insights
4. Primerjajte čase odziva pred in po predpomnjenju

**Kriteriji uspeha**: Redis je razmestjen, predpomnjenje deluje, časi odziva se izboljšajo za >50%.

**Namig**: Začnite z [dokumentacijo Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

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
- Ni nadaljnjih stroškov
- Lokalno mapo `.azure/<env-name>` je mogoče izbrisati

**Alternativa** (ohranite infrastrukturo, izbrišite podatke):
```sh
# Izbriši samo skupino virov (obdrži konfiguracijo AZD)
az group delete --name rg-<env-name> --yes
```
## Izvedi več

### Povezana dokumentacija
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentacija Azure SQL Database](https://learn.microsoft.com/azure/azure-sql/database/)
- [Dokumentacija Azure App Service](https://learn.microsoft.com/azure/app-service/)
- [Dokumentacija Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Reference jezika Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Naslednji koraki v tem tečaju
- **[Primer Container Apps](../../../../examples/container-app)**: Razmestite mikroservise z Azure Container Apps
- **[Vodnik za AI integracijo](../../../../docs/ai-foundry)**: Dodajte AI zmogljivosti v vašo aplikacijo
- **[Najboljše prakse uvajanja](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Vzorce uvajanja za produkcijo

### Napredne teme
- **Managed Identity**: Odstranite gesla in uporabite avtentikacijo Azure AD
- **Private Endpoints**: Zavarujte povezave do baze podatkov znotraj virtualnega omrežja
- **CI/CD integracija**: Avtomatizirajte uvajanja z GitHub Actions ali Azure DevOps
- **Več okolij**: Nastavite razvojno, testno in produkcijsko okolje
- **Migracije baze podatkov**: Uporabite Alembic ali Entity Framework za verzioniranje sheme

### Primerjava z drugimi pristopi

**AZD v primerjavi z ARM predlogami**:
- ✅ AZD: Višja abstrakcija, preprostejši ukazi
- ⚠️ ARM predloge: Bolj obsežne, bolj granuliran nadzor

**AZD v primerjavi s Terraformom**:
- ✅ AZD: Nativno za Azure, integrirano s storitvami Azure
- ⚠️ Terraform: Podpora za več oblakov, večji ekosistem

**AZD v primerjavi z Azure Portalom**:
- ✅ AZD: Ponovljivo, nadzor različic, avtomatizirano
- ⚠️ Portal: Ročni kliki, težko reproducirati

**AZD si predstavljajte kot**: Docker Compose za Azure — poenostavljena konfiguracija za kompleksna uvajanja.

---

## Pogosto zastavljena vprašanja

**V: Ali lahko uporabim drug programski jezik?**  
O: Da! Zamenjajte `src/web/` z Node.js, C#, Go ali katerimkoli drugim jezikom. Posodobite `azure.yaml` in Bicep ustrezno.

**V: Kako dodam več baz podatkov?**  
O: Dodajte še en modul SQL Database v `infra/main.bicep` ali uporabite PostgreSQL/MySQL iz storitev Azure Database.

**V: Ali lahko to uporabim v produkciji?**  
O: To je izhodišče. Za produkcijo dodajte: managed identity, private endpoints, redundanco, strategijo varnostnega kopiranja, WAF in izboljšano spremljanje.

**V: Kaj pa, če želim uporabiti kontejnarje namesto uvajanja kode?**  
O: Oglejte si [Primer Container Apps](../../../../examples/container-app), ki uporablja Docker kontejnarje povsod.

**V: Kako se povežem z bazo podatkov iz svojega lokalnega računalnika?**  
O: Dodajte svoj IP v požarni zid SQL Serverja:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**V: Lahko uporabim obstoječo bazo namesto ustvarjanja nove?**  
O: Da, spremenite `infra/main.bicep`, da referencira obstoječ SQL Server in posodobite parametre connection stringa.

---

> **Opomba:** Ta primer prikazuje najboljše prakse za uvajanje spletne aplikacije z bazo podatkov z uporabo AZD. Vsebuje delujočo kodo, obsežno dokumentacijo in praktične vaje za utrjevanje znanja. Za produkcijsko uvajanje preglejte varnostne zahteve, skaliranje, skladnost in zahteve glede stroškov, specifične za vašo organizacijo.

**📚 Navigacija tečaja:**
- ← Prejšnje: [Primer Container Apps](../../../../examples/container-app)
- → Naslednje: [Vodnik za AI integracijo](../../../../docs/ai-foundry)
- 🏠 [Domača stran tečaja](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Ta dokument je bil preveden s pomočjo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku naj se šteje za avtoritativni vir. Za kritične informacije priporočamo strokovni človeški prevod. Ne odgovarjamo za morebitne nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->