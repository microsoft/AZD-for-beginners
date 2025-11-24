<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "10bf998e2d70c35d713fbe6905841b95",
  "translation_date": "2025-11-23T23:21:07+00:00",
  "source_file": "examples/database-app/README.md",
  "language_code": "sl"
}
-->
# Uvajanje Microsoft SQL baze podatkov in spletne aplikacije z AZD

⏱️ **Ocenjeni čas**: 20-30 minut | 💰 **Ocenjeni stroški**: ~15-25 €/mesec | ⭐ **Kompleksnost**: Srednja

Ta **popoln, delujoč primer** prikazuje, kako uporabiti [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) za uvajanje spletne aplikacije Python Flask z Microsoft SQL bazo podatkov v Azure. Vsa koda je vključena in testirana—brez zunanjih odvisnosti.

## Kaj se boste naučili

Z dokončanjem tega primera boste:
- Uvedli večnivojsko aplikacijo (spletna aplikacija + baza podatkov) z infrastrukturo kot kodo
- Konfigurirali varne povezave z bazo podatkov brez trdega kodiranja gesel
- Spremljali zdravje aplikacije z Application Insights
- Učinkovito upravljali Azure vire z AZD CLI
- Sledili najboljšim praksam Azure za varnost, optimizacijo stroškov in opazovanje

## Pregled scenarija
- **Spletna aplikacija**: Python Flask REST API s povezavo z bazo podatkov
- **Baza podatkov**: Azure SQL baza podatkov z vzorčnimi podatki
- **Infrastruktura**: Ustvarjena z Bicep (modularne, ponovno uporabne predloge)
- **Uvajanje**: Popolnoma avtomatizirano z ukazi `azd`
- **Spremljanje**: Application Insights za dnevnike in telemetrijo

## Predpogoji

### Potrebna orodja

Pred začetkom preverite, ali imate nameščena naslednja orodja:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (različica 2.50.0 ali novejša)
   ```sh
   az --version
   # Pričakovani rezultat: azure-cli 2.50.0 ali višji
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (različica 1.0.0 ali novejša)
   ```sh
   azd version
   # Pričakovani izhod: azd različica 1.0.0 ali višja
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (za lokalni razvoj)
   ```sh
   python --version
   # Pričakovani rezultat: Python 3.8 ali novejši
   ```

4. **[Docker](https://www.docker.com/get-started)** (neobvezno, za lokalni razvoj v kontejnerjih)
   ```sh
   docker --version
   # Pričakovani rezultat: Docker različica 20.10 ali višja
   ```

### Zahteve za Azure

- Aktivna **Azure naročnina** ([ustvarite brezplačen račun](https://azure.microsoft.com/free/))
- Dovoljenja za ustvarjanje virov v vaši naročnini
- **Lastnik** ali **Sodelavec** v naročnini ali skupini virov

### Zahteve glede znanja

To je primer **srednje zahtevnosti**. Poznati morate:
- Osnovne operacije ukazne vrstice
- Temeljne koncepte oblaka (viri, skupine virov)
- Osnovno razumevanje spletnih aplikacij in baz podatkov

**Nov v AZD?** Najprej začnite z [vodnikom za začetek](../../docs/getting-started/azd-basics.md).

## Arhitektura

Ta primer uvaja dvonivojsko arhitekturo s spletno aplikacijo in SQL bazo podatkov:

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

**Uvajanje virov:**
- **Skupina virov**: Posoda za vse vire
- **Načrt storitve aplikacij**: Gostovanje na Linuxu (B1 nivo za stroškovno učinkovitost)
- **Spletna aplikacija**: Python 3.11 z Flask aplikacijo
- **SQL strežnik**: Upravljan strežnik baze podatkov z najmanj TLS 1.2
- **SQL baza podatkov**: Osnovni nivo (2GB, primeren za razvoj/testiranje)
- **Application Insights**: Spremljanje in beleženje
- **Delovni prostor za analitiko dnevnikov**: Centralizirano shranjevanje dnevnikov

**Primerjava**: To je kot restavracija (spletna aplikacija) s hladilnico (baza podatkov). Stranke naročajo z menija (API končne točke), kuhinja (Flask aplikacija) pa pridobiva sestavine (podatke) iz hladilnice. Vodja restavracije (Application Insights) spremlja vse, kar se dogaja.

## Struktura map

Vse datoteke so vključene v ta primer—brez zunanjih odvisnosti:

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

**Kaj počne vsaka datoteka:**
- **azure.yaml**: Pove AZD, kaj naj uvede in kje
- **infra/main.bicep**: Orkestrira vse Azure vire
- **infra/resources/*.bicep**: Posamezne definicije virov (modularne za ponovno uporabo)
- **src/web/app.py**: Flask aplikacija z logiko baze podatkov
- **requirements.txt**: Odvisnosti Python paketov
- **Dockerfile**: Navodila za kontejnerizacijo za uvajanje

## Hitri začetek (korak za korakom)

### Korak 1: Klonirajte in se premaknite

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Preverjanje uspešnosti**: Preverite, ali vidite `azure.yaml` in mapo `infra/`:
```sh
ls
# Pričakovano: README.md, azure.yaml, infra/, src/
```

### Korak 2: Prijavite se v Azure

```sh
azd auth login
```

To odpre vaš brskalnik za prijavo v Azure. Prijavite se s svojimi Azure poverilnicami.

**✓ Preverjanje uspešnosti**: Videti bi morali:
```
Logged in to Azure.
```

### Korak 3: Inicializirajte okolje

```sh
azd init
```

**Kaj se zgodi**: AZD ustvari lokalno konfiguracijo za vaše uvajanje.

**Pozivi, ki jih boste videli**:
- **Ime okolja**: Vnesite kratko ime (npr. `dev`, `myapp`)
- **Azure naročnina**: Izberite svojo naročnino s seznama
- **Azure lokacija**: Izberite regijo (npr. `eastus`, `westeurope`)

**✓ Preverjanje uspešnosti**: Videti bi morali:
```
SUCCESS: New project initialized!
```

### Korak 4: Uvedite Azure vire

```sh
azd provision
```

**Kaj se zgodi**: AZD uvede vso infrastrukturo (traja 5-8 minut):
1. Ustvari skupino virov
2. Ustvari SQL strežnik in bazo podatkov
3. Ustvari načrt storitve aplikacij
4. Ustvari spletno aplikacijo
5. Ustvari Application Insights
6. Konfigurira omrežje in varnost

**Pozvani boste za**:
- **Uporabniško ime SQL skrbnika**: Vnesite uporabniško ime (npr. `sqladmin`)
- **Geslo SQL skrbnika**: Vnesite močno geslo (shranite ga!)

**✓ Preverjanje uspešnosti**: Videti bi morali:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Čas**: 5-8 minut

### Korak 5: Uvedite aplikacijo

```sh
azd deploy
```

**Kaj se zgodi**: AZD zgradi in uvede vašo Flask aplikacijo:
1. Pakira Python aplikacijo
2. Zgradi Docker kontejner
3. Potisne v Azure spletno aplikacijo
4. Inicializira bazo podatkov z vzorčnimi podatki
5. Zažene aplikacijo

**✓ Preverjanje uspešnosti**: Videti bi morali:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Čas**: 3-5 minut

### Korak 6: Oglejte si aplikacijo

```sh
azd browse
```

To odpre vašo uvedeno spletno aplikacijo v brskalniku na `https://app-<unique-id>.azurewebsites.net`

**✓ Preverjanje uspešnosti**: Videti bi morali JSON izhod:
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

### Korak 7: Testirajte API končne točke

**Preverjanje zdravja** (preverite povezavo z bazo podatkov):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Pričakovani odziv**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**Seznam izdelkov** (vzorec podatkov):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Pričakovani odziv**:
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

**Pridobite posamezen izdelek**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Preverjanje uspešnosti**: Vse končne točke vrnejo JSON podatke brez napak.

---

**🎉 Čestitke!** Uspešno ste uvedli spletno aplikacijo z bazo podatkov v Azure z uporabo AZD.

## Podrobna konfiguracija

### Spremenljivke okolja

Gesla so varno upravljana prek konfiguracije Azure App Service—**nikoli trdo kodirana v izvorni kodi**.

**Samodejno konfigurirano z AZD**:
- `SQL_CONNECTION_STRING`: Povezava z bazo podatkov z šifriranimi poverilnicami
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Telemetrijska končna točka za spremljanje
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Omogoča samodejno namestitev odvisnosti

**Kje so gesla shranjena**:
1. Med `azd provision` vnesete SQL poverilnice prek varnih pozivov
2. AZD jih shrani v lokalno datoteko `.azure/<env-name>/.env` (izključeno iz Git-a)
3. AZD jih vključi v konfiguracijo Azure App Service (šifrirano v mirovanju)
4. Aplikacija jih bere prek `os.getenv()` med izvajanjem

### Lokalni razvoj

Za lokalno testiranje ustvarite `.env` datoteko iz vzorca:

```sh
cp .env.sample .env
# Uredite .env z vašo lokalno povezavo do baze podatkov
```

**Delovni tok lokalnega razvoja**:
```sh
# Namestite odvisnosti
cd src/web
pip install -r requirements.txt

# Nastavite okoljske spremenljivke
export SQL_CONNECTION_STRING="your-local-connection-string"

# Zaženite aplikacijo
python app.py
```

**Testirajte lokalno**:
```sh
curl http://localhost:8000/health
# Pričakovano: {"status": "zdravo", "database": "povezan"}
```

### Infrastruktura kot koda

Vsi Azure viri so definirani v **Bicep predlogah** (mapa `infra/`):

- **Modularna zasnova**: Vsaka vrsta vira ima svojo datoteko za ponovno uporabo
- **Parametrizirano**: Prilagodite nivoje, regije, poimenovalne konvencije
- **Najboljše prakse**: Sledi standardom poimenovanja Azure in privzetim varnostnim nastavitvam
- **Sledljivo**: Spremembe infrastrukture so sledene v Git-u

**Primer prilagoditve**:
Za spremembo nivoja baze podatkov uredite `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Najboljše prakse za varnost

Ta primer sledi najboljšim praksam za varnost v Azure:

### 1. **Brez gesel v izvorni kodi**
- ✅ Poverilnice shranjene v konfiguraciji Azure App Service (šifrirano)
- ✅ `.env` datoteke izključene iz Git-a prek `.gitignore`
- ✅ Gesla posredovana prek varnih parametrov med uvajanjem

### 2. **Šifrirane povezave**
- ✅ Najmanj TLS 1.2 za SQL strežnik
- ✅ Obvezno HTTPS za spletno aplikacijo
- ✅ Povezave z bazo podatkov uporabljajo šifrirane kanale

### 3. **Omrežna varnost**
- ✅ SQL strežniški požarni zid konfiguriran za dovoljenje samo Azure storitvam
- ✅ Dostop do javnega omrežja omejen (lahko se dodatno zaklene z zasebnimi končnimi točkami)
- ✅ FTPS onemogočen na spletni aplikaciji

### 4. **Avtentikacija in avtorizacija**
- ⚠️ **Trenutno**: SQL avtentikacija (uporabniško ime/geslo)
- ✅ **Priporočilo za produkcijo**: Uporabite Azure Managed Identity za avtentikacijo brez gesla

**Za nadgradnjo na Managed Identity** (za produkcijo):
1. Omogočite upravljano identiteto na spletni aplikaciji
2. Dodelite identiteti SQL dovoljenja
3. Posodobite povezovalni niz za uporabo upravljane identitete
4. Odstranite avtentikacijo na podlagi gesla

### 5. **Revizija in skladnost**
- ✅ Application Insights beleži vse zahteve in napake
- ✅ SQL baza podatkov omogoča revizijo (lahko se konfigurira za skladnost)
- ✅ Vsi viri označeni za upravljanje

**Varnostni kontrolni seznam pred produkcijo**:
- [ ] Omogočite Azure Defender za SQL
- [ ] Konfigurirajte zasebne končne točke za SQL bazo podatkov
- [ ] Omogočite požarni zid spletne aplikacije (WAF)
- [ ] Uvedite Azure Key Vault za rotacijo gesel
- [ ] Konfigurirajte avtentikacijo Azure AD
- [ ] Omogočite diagnostično beleženje za vse vire

## Optimizacija stroškov

**Ocenjeni mesečni stroški** (november 2025):

| Vir | SKU/Nivo | Ocenjeni strošek |
|-----|----------|------------------|
| Načrt storitve aplikacij | B1 (Osnovni) | ~13 €/mesec |
| SQL baza podatkov | Osnovni (2GB) | ~5 €/mesec |
| Application Insights | Plačilo po porabi | ~2 €/mesec (nizek promet) |
| **Skupaj** | | **~20 €/mesec** |

**💡 Nasveti za varčevanje**:

1. **Uporabite brezplačni nivo za učenje**:
   - Načrt storitve aplikacij: F1 nivo (brezplačno, omejene ure)
   - SQL baza podatkov: Uporabite strežnik Azure SQL Database serverless
   - Application Insights: 5GB/mesec brezplačnega vnosa

2. **Ustavite vire, ko jih ne uporabljate**:
   ```sh
   # Ustavite spletno aplikacijo (baza podatkov še vedno zaračunava)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Znova zaženite, ko je potrebno
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Izbrišite vse po testiranju**:
   ```sh
   azd down
   ```
   To odstrani VSE vire in ustavi stroške.

4. **Razvojni vs. produkcijski nivoji**:
   - **Razvoj**: Osnovni nivo (uporabljen v tem primeru)
   - **Produkcija**: Standardni/Premium nivo z redundanco

**Spremljanje stroškov**:
- Oglejte si stroške v [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Nastavite opozorila o stroških, da se izognete presenečenjem
- Označite vse vire z `azd-env-name` za sledenje

**Alternativa brezplačnemu nivoju**:
Za učne namene lahko spremenite `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Opomba**: Brezplačni nivo ima omejitve (60 min/dan CPU, brez vedno vklopljenega).

## Spremljanje in opazovanje

### Integracija Application Insights

Ta primer vključuje **Application Insights** za celovito spremljanje:

**Kaj se spremlja**:
- ✅ HTTP zahteve (zakasnitve, statusne kode, končne točke)
- ✅ Napake in izjeme aplikacije
- ✅ Prilagojeno beleženje iz Flask aplikacije
- ✅ Zdravje povezave z bazo podatkov
- ✅ Meritve zmogljivosti (CPU, pomnilnik)

**Dostop do Application Insights**:
1. Odprite [Azure Portal](https://portal.azure.com)
2. Pojdite v svojo skupino virov (`rg-<env-name>`)
3. Kliknite na Application Insights vir (`appi-<unique-id>`)

**Uporabne poizvedbe** (Application Insights → Dnevniki):

**Prikaži vse zahteve**:
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

**Preveri končno točko zdravja**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### Revizija SQL baze podatkov

**Revizija SQL baze podatkov je omogočena** za sledenje:
- Vzorcev dostopa do baze podatkov
- Neuspelih poskusov prijave
- Sprememb sheme
- Dostopa do podatkov (za skladnost)

**Dostop do revizijskih dnevnikov**:
1. Azure Portal → SQL baza podatkov → Revizija
2. Oglejte si dnevnike v delovnem prostoru Log Analytics

### Spremljanje v realnem času

**Ogled živih metrik**:
1. Application Insights → Žive metrike
2. Oglejte si zahteve, napake in zmogljivost v realnem času

**Nastavite opozorila**:
Ustvarite opozorila za kritične dogodke:
- HTTP 500 napake > 5 v 5 minutah
- Neuspešne povezave z bazo podatkov
- Dolgi odzivni časi (>2 sekundi)

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

#### 1. `azd provision` ne uspe z "Lokacija ni na voljo"

**Simptom**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Rešitev**:
Izberite drugo regijo Azure ali registrirajte ponudnika virov:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Povezava s SQL ne uspe med uvajanjem

**Simptom**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Rešitev**:
- Preverite, ali požarni zid SQL strežnika omogoča storitve Azure (samodejno konfigurirano)
- Preverite, ali je geslo za SQL administratorja pravilno vneseno med `azd provision`
- Prepričajte se, da je SQL strežnik popolnoma vzpostavljen (lahko traja 2-3 minute)

**Preverite povezavo**:
```sh
# Iz Azure Portal pojdite na SQL Database → Urejevalnik poizvedb
# Poskusite se povezati s svojimi poverilnicami
```

#### 3. Spletna aplikacija prikazuje "Napaka aplikacije"

**Simptom**:
Brskalnik prikazuje generično stran z napako.

**Rešitev**:
Preverite dnevniške zapise aplikacije:
```sh
# Ogled nedavnih dnevnikov
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Pogosti vzroki**:
- Manjkajoče okoljske spremenljivke (preverite App Service → Konfiguracija)
- Neuspešna namestitev Python paketov (preverite dnevnike uvajanja)
- Napaka pri inicializaciji baze podatkov (preverite povezljivost SQL)

#### 4. `azd deploy` ne uspe z "Napaka pri gradnji"

**Simptom**:
```
Error: Failed to build project
```

**Rešitev**:
- Prepričajte se, da `requirements.txt` nima sintaktičnih napak
- Preverite, ali je Python 3.11 določen v `infra/resources/web-app.bicep`
- Preverite, ali ima Dockerfile pravilno osnovno sliko

**Odpravljanje težav lokalno**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Neavtorizirano" pri izvajanju ukazov AZD

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

Preverite, ali imate ustrezne pravice (vloga Contributor) na naročnini.

#### 6. Visoki stroški baze podatkov

**Simptom**:
Nepričakovan račun Azure.

**Rešitev**:
- Preverite, ali ste pozabili zagnati `azd down` po testiranju
- Preverite, ali SQL baza podatkov uporablja osnovni nivo (ne Premium)
- Preglejte stroške v Azure Cost Management
- Nastavite opozorila o stroških

### Pridobivanje pomoči

**Prikaži vse okoljske spremenljivke AZD**:
```sh
azd env get-values
```

**Preverite stanje uvajanja**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Dostop do dnevniških zapisov aplikacije**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Potrebujete več pomoči?**
- [AZD Vodnik za odpravljanje težav](../../docs/troubleshooting/common-issues.md)
- [Azure App Service Odpravljanje težav](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL Odpravljanje težav](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Praktične vaje

### Naloga 1: Preverite svoje uvajanje (Začetnik)

**Cilj**: Preverite, ali so vsi viri uvedeni in aplikacija deluje.

**Koraki**:
1. Naštejte vse vire v svoji skupini virov:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Pričakovano**: 6-7 virov (Spletna aplikacija, SQL strežnik, SQL baza podatkov, načrt storitve App Service, Application Insights, Log Analytics)

2. Testirajte vse API končne točke:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Pričakovano**: Vse vrnejo veljaven JSON brez napak

3. Preverite Application Insights:
   - Pojdite na Application Insights v Azure Portal
   - Odprite "Live Metrics"
   - Osvežite brskalnik na spletni aplikaciji
   **Pričakovano**: Vidite zahteve v realnem času

**Merila uspeha**: Vsi 6-7 virov obstajajo, vse končne točke vračajo podatke, Live Metrics prikazuje aktivnost.

---

### Naloga 2: Dodajte novo API končno točko (Srednje zahtevno)

**Cilj**: Razširite Flask aplikacijo z novo končno točko.

**Začetna koda**: Trenutne končne točke v `src/web/app.py`

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

2. Uvedite posodobljeno aplikacijo:
   ```sh
   azd deploy
   ```

3. Testirajte novo končno točko:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Pričakovano**: Vrne izdelke, ki ustrezajo "laptop"

**Merila uspeha**: Nova končna točka deluje, vrača filtrirane rezultate, se pojavi v dnevnikih Application Insights.

---

### Naloga 3: Dodajte spremljanje in opozorila (Napredno)

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

2. Sprožite opozorilo z povzročanjem napak:
   ```sh
   # Zahtevajte neobstoječ izdelek
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Preverite, ali se je opozorilo sprožilo:
   - Azure Portal → Alerts → Alert Rules
   - Preverite svoj e-poštni naslov (če je konfiguriran)

**Merila uspeha**: Pravilo opozorila je ustvarjeno, se sproži ob napakah, obvestila so prejeta.

---

### Naloga 4: Spremembe sheme baze podatkov (Napredno)

**Cilj**: Dodajte novo tabelo in spremenite aplikacijo, da jo uporablja.

**Koraki**:
1. Povežite se z SQL bazo podatkov prek Azure Portal Query Editor

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

3. Posodobite `src/web/app.py`, da vključuje informacije o kategorijah v odgovore

4. Uvedite in testirajte

**Merila uspeha**: Nova tabela obstaja, izdelki prikazujejo informacije o kategorijah, aplikacija še vedno deluje.

---

### Naloga 5: Uvedite predpomnjenje (Strokovno)

**Cilj**: Dodajte Azure Redis Cache za izboljšanje zmogljivosti.

**Koraki**:
1. Dodajte Redis Cache v `infra/main.bicep`
2. Posodobite `src/web/app.py`, da predpomni poizvedbe izdelkov
3. Izmerite izboljšanje zmogljivosti z Application Insights
4. Primerjajte odzivne čase pred/po predpomnjenju

**Merila uspeha**: Redis je uveden, predpomnjenje deluje, odzivni časi se izboljšajo za >50%.

**Namig**: Začnite z [dokumentacijo Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Čiščenje

Da se izognete stalnim stroškom, izbrišite vse vire po končanem delu:

```sh
azd down
```

**Potrditev**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Vnesite `y` za potrditev.

**✓ Preverjanje uspeha**: 
- Vsi viri so izbrisani iz Azure Portal
- Ni stalnih stroškov
- Lokalna mapa `.azure/<env-name>` se lahko izbriše

**Alternativa** (obdržite infrastrukturo, izbrišite podatke):
```sh
# Izbriši samo skupino virov (ohrani AZD konfiguracijo)
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
- **[Primer aplikacij s kontejnerji](../../../../examples/container-app)**: Uvedite mikrostoritve z Azure Container Apps
- **[Vodnik za integracijo AI](../../../../docs/ai-foundry)**: Dodajte AI zmogljivosti svoji aplikaciji
- **[Najboljše prakse uvajanja](../../docs/deployment/deployment-guide.md)**: Vzorci uvajanja v produkcijo

### Napredne teme
- **Upravljana identiteta**: Odstranite gesla in uporabite avtentikacijo Azure AD
- **Zasebne končne točke**: Zavarujte povezave z bazo podatkov znotraj virtualnega omrežja
- **Integracija CI/CD**: Avtomatizirajte uvajanja z GitHub Actions ali Azure DevOps
- **Več okolij**: Nastavite razvojna, testna in produkcijska okolja
- **Migracije baze podatkov**: Uporabite Alembic ali Entity Framework za različice sheme

### Primerjava z drugimi pristopi

**AZD vs. ARM predloge**:
- ✅ AZD: Višja raven abstrakcije, enostavnejši ukazi
- ⚠️ ARM: Bolj obsežno, podrobnejši nadzor

**AZD vs. Terraform**:
- ✅ AZD: Azure-native, integrirano z Azure storitvami
- ⚠️ Terraform: Podpora za več oblakov, večji ekosistem

**AZD vs. Azure Portal**:
- ✅ AZD: Ponovljivo, pod nadzorom različic, avtomatizirano
- ⚠️ Portal: Ročni kliki, težko reproducirati

**Pomislite na AZD kot**: Docker Compose za Azure—poenostavljena konfiguracija za kompleksna uvajanja.

---

## Pogosta vprašanja

**V: Ali lahko uporabim drug programski jezik?**  
O: Seveda! Zamenjajte `src/web/` z Node.js, C#, Go ali katerim koli jezikom. Posodobite `azure.yaml` in Bicep ustrezno.

**V: Kako dodam več baz podatkov?**  
O: Dodajte še en modul SQL baze podatkov v `infra/main.bicep` ali uporabite PostgreSQL/MySQL iz storitev Azure Database.

**V: Ali lahko to uporabim za produkcijo?**  
O: To je izhodišče. Za produkcijo dodajte: upravljano identiteto, zasebne končne točke, redundanco, strategijo varnostnih kopij, WAF in izboljšano spremljanje.

**V: Kaj če želim uporabiti kontejnerje namesto uvajanja kode?**  
O: Oglejte si [Primer aplikacij s kontejnerji](../../../../examples/container-app), ki uporablja Docker kontejnerje povsod.

**V: Kako se povežem z bazo podatkov iz svojega lokalnega računalnika?**  
O: Dodajte svoj IP v požarni zid SQL strežnika:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**V: Ali lahko uporabim obstoječo bazo podatkov namesto ustvarjanja nove?**  
O: Da, spremenite `infra/main.bicep`, da se sklicuje na obstoječi SQL strežnik, in posodobite parametre povezovalnega niza.

---

> **Opomba:** Ta primer prikazuje najboljše prakse za uvajanje spletne aplikacije z bazo podatkov z uporabo AZD. Vključuje delujočo kodo, obsežno dokumentacijo in praktične vaje za utrjevanje znanja. Za produkcijska uvajanja preglejte varnostne, skalabilne, skladnostne in stroškovne zahteve, specifične za vašo organizacijo.

**📚 Navigacija po tečaju:**
- ← Prejšnje: [Primer aplikacij s kontejnerji](../../../../examples/container-app)
- → Naslednje: [Vodnik za integracijo AI](../../../../docs/ai-foundry)
- 🏠 [Domača stran tečaja](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatski prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku naj se šteje za avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne odgovarjamo za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->