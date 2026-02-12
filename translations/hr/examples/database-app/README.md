# Implementacija Microsoft SQL baze podataka i web aplikacije s AZD

⏱️ **Procijenjeno vrijeme**: 20-30 minuta | 💰 **Procijenjeni trošak**: ~$15-25/mjesečno | ⭐ **Složenost**: Srednja

Ovaj **potpuni, radni primjer** pokazuje kako koristiti [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) za implementaciju Python Flask web aplikacije s Microsoft SQL bazom podataka u Azure. Sav kod je uključen i testiran—nema potrebe za vanjskim ovisnostima.

## Što ćete naučiti

Dovršetkom ovog primjera ćete:
- Implementirati višeslojnu aplikaciju (web aplikacija + baza podataka) koristeći infrastrukturu kao kod
- Konfigurirati sigurne veze s bazom podataka bez tvrdog kodiranja tajni
- Pratiti zdravlje aplikacije pomoću Application Insights
- Učinkovito upravljati Azure resursima s AZD CLI-jem
- Pridržavati se Azure najboljih praksi za sigurnost, optimizaciju troškova i vidljivost

## Pregled scenarija
- **Web aplikacija**: Python Flask REST API s povezivanjem na bazu podataka
- **Baza podataka**: Azure SQL baza podataka sa uzorcima podataka
- **Infrastruktura**: Postavljena pomoću Bicep-a (modularni, višekratno upotrebljivi predlošci)
- **Implementacija**: Potpuno automatizirana s `azd` naredbama
- **Praćenje**: Application Insights za zapise i telemetriju

## Preduvjeti

### Potrebni alati

Prije početka provjerite imate li instalirane ove alate:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (verzija 2.50.0 ili novija)
   ```sh
   az --version
   # Očekivani rezultat: azure-cli 2.50.0 ili noviji
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (verzija 1.0.0 ili novija)
   ```sh
   azd version
   # Očekivani rezultat: azd verzija 1.0.0 ili novija
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (za lokalni razvoj)
   ```sh
   python --version
   # Očekivani rezultat: Python 3.8 ili noviji
   ```

4. **[Docker](https://www.docker.com/get-started)** (opcionalno, za lokalni razvoj u kontejneru)
   ```sh
   docker --version
   # Očekivani izlaz: Docker verzija 20.10 ili novija
   ```

### Azure zahtjevi

- Aktivna **Azure pretplata** ([kreirajte besplatan račun](https://azure.microsoft.com/free/))
- Dozvole za stvaranje resursa u vašoj pretplati
- Uloga **Owner** ili **Contributor** na pretplati ili grupi resursa

### Potrebno predznanje

Ovo je **primjer srednje razine**. Trebali biste biti upoznati s:
- Osnovnim radom s komandnom linijom
- Osnovnim konceptima clouda (resursi, grupe resursa)
- Osnovnim razumijevanjem web aplikacija i baza podataka

**Novi u AZD-u?** Najprije proučite [Uvodni vodič](../../docs/chapter-01-foundation/azd-basics.md).

## Arhitektura

Ovaj primjer implementira dvoslojnu arhitekturu s web aplikacijom i SQL bazom podataka:

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

**Implementacija resursa:**
- **Grupa resursa**: Spremnik za sve resurse
- **App Service Plan**: Linux hosting (B1 sloj za ekonomičnost)
- **Web aplikacija**: Python 3.11 runtime s Flask aplikacijom
- **SQL Server**: Upravljački poslužitelj s TLS 1.2 minimum
- **SQL baza podataka**: Osnovni sloj (2GB, prikladan za razvoj/testiranje)
- **Application Insights**: Praćenje i evidentiranje
- **Log Analytics Workspace**: Centralizirano spremište zapisa

**Analogija**: Zamislite ovo kao restoran (web aplikacija) s hladnim skladištem (baza podataka). Kupci naručuju s jelovnika (API endpointi), a kuhinja (Flask aplikacija) dohvaća sastojke (podatke) iz hladnjaka. Voditelj restorana (Application Insights) prati sve što se događa.

## Struktura mapa

Svi su datoteke uključene u ovaj primjer—nema vanjskih ovisnosti:

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

**Što svaka datoteka radi:**
- **azure.yaml**: Kaže AZD-u što se implementira i gdje
- **infra/main.bicep**: Orkestrira sve Azure resurse
- **infra/resources/*.bicep**: Pojedinačne definicije resursa (modularno za višekratnu upotrebu)
- **src/web/app.py**: Flask aplikacija s logikom za bazu podataka
- **requirements.txt**: Python paketne ovisnosti
- **Dockerfile**: Upute za kontejnerizaciju i implementaciju

## Brzi početak (korak po korak)

### Korak 1: Klonirajte i navigirajte

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Provjera uspjeha**: Provjerite vidite li `azure.yaml` i mapu `infra/`:
```sh
ls
# Očekivano: README.md, azure.yaml, infra/, src/
```

### Korak 2: Prijavite se u Azure

```sh
azd auth login
```

Ovo otvara vaš preglednik za Azure autentifikaciju. Prijavite se s Azure vjerodajnicama.

**✓ Provjera uspjeha**: Trebali biste vidjeti:
```
Logged in to Azure.
```

### Korak 3: Inicijalizirajte okruženje

```sh
azd init
```

**Što se događa**: AZD stvara lokalnu konfiguraciju za vašu implementaciju.

**Upiti koje ćete vidjeti**:
- **Ime okruženja**: Unesite kratko ime (npr. `dev`, `myapp`)
- **Azure pretplata**: Odaberite pretplatu s popisa
- **Lokacija Azure**: Odaberite regiju (npr. `eastus`, `westeurope`)

**✓ Provjera uspjeha**: Trebali biste vidjeti:
```
SUCCESS: New project initialized!
```

### Korak 4: Postavite Azure resurse

```sh
azd provision
```

**Što se događa**: AZD implementira svu infrastrukturu (traje 5-8 minuta):
1. Stvara grupu resursa
2. Stvara SQL Server i bazu podataka
3. Stvara App Service Plan
4. Stvara Web App
5. Stvara Application Insights
6. Konfigurira mrežu i sigurnost

**Od vas će se tražiti**:
- **SQL administratorsko korisničko ime**: Unesite korisničko ime (npr. `sqladmin`)
- **SQL administratorska lozinka**: Unesite jaku lozinku (spremite ovu!)

**✓ Provjera uspjeha**: Trebali biste vidjeti:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Vrijeme**: 5-8 minuta

### Korak 5: Implementirajte aplikaciju

```sh
azd deploy
```

**Što se događa**: AZD gradi i implementira vašu Flask aplikaciju:
1. Paketira Python aplikaciju
2. Gradi Docker kontejner
3. Push-a u Azure Web App
4. Inicijalizira bazu podataka uzorcima podataka
5. Pokreće aplikaciju

**✓ Provjera uspjeha**: Trebali biste vidjeti:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Vrijeme**: 3-5 minuta

### Korak 6: Pregledajte aplikaciju

```sh
azd browse
```

Ovo otvara vašu implementiranu web aplikaciju u pregledniku na `https://app-<unique-id>.azurewebsites.net`

**✓ Provjera uspjeha**: Trebali biste vidjeti JSON izlaz:
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

### Korak 7: Testirajte API endpoint-e

**Provjera zdravlja** (provjeri vezu s bazom):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Očekivani odgovor**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**Popis proizvoda** (uzorci podataka):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Očekivani odgovor**:
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

**Dobivanje pojedinačnog proizvoda**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Provjera uspjeha**: Svi endpoint-i vraćaju JSON podatke bez pogrešaka.

---

**🎉 Čestitamo!** Uspješno ste implementirali web aplikaciju s bazom podataka u Azure koristeći AZD.

## Dubinska konfiguracija

### Varijable okruženja

Tajne se sigurno upravljaju putem konfiguracije Azure App Service—**nikada se ne tvrdo kodiraju u izvorni kod**.

**Automatski konfigurirano od strane AZD-a**:
- `SQL_CONNECTION_STRING`: Veza s bazom podataka s enkriptiranim vjerodajnicama
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Krajnja točka telemetrije za praćenje
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Omogućava automatsku instalaciju ovisnosti

**Gdje se tajne pohranjuju**:
1. Tijekom `azd provision`, unosite SQL vjerodajnice putem sigurnih upita
2. AZD ih sprema u lokalnu `.azure/<env-name>/.env` datoteku (izuzetu iz Gita)
3. AZD ih ubrizgava u konfiguraciju Azure App Servicea (šifrirano u mirovanju)
4. Aplikacija ih čita putem `os.getenv()` u runtime-u

### Lokalni razvoj

Za lokalno testiranje kreirajte `.env` datoteku iz primjera:

```sh
cp .env.sample .env
# Uredite .env s vezom na vašu lokalnu bazu podataka
```

**Radni tok za lokalni razvoj**:
```sh
# Instalirajte ovisnosti
cd src/web
pip install -r requirements.txt

# Postavite varijable okoline
export SQL_CONNECTION_STRING="your-local-connection-string"

# Pokrenite aplikaciju
python app.py
```

**Testirajte lokalno**:
```sh
curl http://localhost:8000/health
# Očekivano: {"status": "zdravo", "baza podataka": "povezana"}
```

### Infrastruktura kao kod

Svi Azure resursi definirani su u **Bicep predlošcima** (`infra/` mapa):

- **Modularni dizajn**: Svaka vrsta resursa ima svoju datoteku za višekratnu upotrebu
- **Parametrizirano**: Prilagodite SKU-ove, regije, konvencije imenovanja
- **Najbolje prakse**: Pridržava se Azure standarda imenovanja i sigurnosnih zadanih postavki
- **Verzijsko upravljanje**: Infrastrukturne promjene se prate putem Git-a

**Primjer prilagodbe**:
Za promjenu sloja baze podataka, uredite `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Najbolje sigurnosne prakse

Ovaj primjer slijedi najbolje sigurnosne prakse Azurea:

### 1. **Nema tajni u izvoru koda**
- ✅ Vjerodajnice se pohranjuju u konfiguraciji Azure App Servicea (šifrirano)
- ✅ `.env` datoteke su izuzete iz Gita putem `.gitignore`
- ✅ Tajne se unose kao sigurni parametri tijekom postavljanja

### 2. **Šifrirane veze**
- ✅ TLS 1.2 minimum za SQL Server
- ✅ HTTPS-only primjenjeno za Web App
- ✅ Veza s bazom koristi šifrirane kanale

### 3. **Sigurnost mreže**
- ✅ Firewall SQL Servera konfiguriran da dopušta samo Azure usluge
- ✅ Pristup javnoj mreži ograničen (može se dodatno zaključati privatnim krajnjim točkama)
- ✅ FTPS onemogućen na Web Appu

### 4. **Autentikacija i autorizacija**
- ⚠️ **Trenutačno**: SQL autentikacija (korisničko ime/lozinka)
- ✅ **Preporuka za produkciju**: Koristite Azure Managed Identity za autentikaciju bez lozinke

**Za nadogradnju na Managed Identity** (za produkciju):
1. Omogućite managed identity na Web Appu
2. Dodijelite SQL dozvole identitetu
3. Ažurirajte connection string da koristi managed identity
4. Uklonite autentikaciju na temelju lozinke

### 5. **Revizija i usklađenost**
- ✅ Application Insights evidentira sve zahtjeve i pogreške
- ✅ SQL baza podataka ima omogućen audit (može se konfigurirati radi usklađenosti)
- ✅ Svi resursi su označeni za upravljanje

**Sigurnosna kontrolna lista prije produkcije**:
- [ ] Omogućiti Azure Defender za SQL
- [ ] Konfigurirati privatne krajnje točke za SQL bazu
- [ ] Omogućiti Web Application Firewall (WAF)
- [ ] Implementirati Azure Key Vault za rotaciju tajni
- [ ] Konfigurirati Azure AD autentikaciju
- [ ] Omogućiti dijagnostičko evidentiranje za sve resurse

## Optimizacija troškova

**Procijenjeni mjesečni troškovi** (stanje na studeni 2025.):

| Resurs | SKU/Sloj | Procijenjeni trošak |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13/mjesečno |
| SQL baza podataka | Basic (2GB) | ~$5/mjesečno |
| Application Insights | Plaćanje po korištenju | ~$2/mjesečno (mali promet) |
| **Ukupno** | | **~$20/mjesečno** |

**💡 Savjeti za uštedu troškova**:

1. **Koristite besplatni sloj za učenje**:
   - App Service: F1 sloj (besplatno, ograničeno na sate)
   - SQL baza podataka: Koristite Azure SQL serverless
   - Application Insights: 5GB/mjesečno besplatnog unosa

2. **Zaustavite resurse kada nisu u upotrebi**:
   ```sh
   # Zaustavite web aplikaciju (baza podataka se i dalje naplaćuje)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Ponovno pokrenite po potrebi
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Izbrišite sve nakon testiranja**:
   ```sh
   azd down
   ```
   Time se brišu SVI resursi i zaustavljaju naplate.

4. **Razlike u SKU za razvoj i produkciju**:
   - **Razvoj**: Basic sloj (korišten u ovom primjeru)
   - **Produkcija**: Standard/Premium sloj s redundantnošću

**Praćenje troškova**:
- Pratite troškove u [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Postavite upozorenja za troškove kako ne biste imali iznenađenja
- Oznake resursa s `azd-env-name` za praćenje

**Alternativa besplatnom sloju**:
Za potrebe učenja možete promijeniti `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Napomena**: Besplatni sloj ima ograničenja (60 minuta dnevno CPU, nema always-on).

## Praćenje i vidljivost

### Integracija s Application Insights

Ovaj primjer uključuje **Application Insights** za sveobuhvatno praćenje:

**Što se prati**:
- ✅ HTTP zahtjevi (latencija, status kodovi, endpointi)
- ✅ Pogreške i iznimke aplikacije
- ✅ Prilagođeno evidentiranje iz Flask aplikacije
- ✅ Zdravlje veze baze podataka
- ✅ Metrike performansi (CPU, memorija)

**Pristup Application Insights-u**:
1. Otvorite [Azure Portal](https://portal.azure.com)
2. Idite u grupu resursa (`rg-<env-name>`)
3. Kliknite na Application Insights resurs (`appi-<unique-id>`)

**Korisni upiti** (Application Insights → Logs):

**Pregled svih zahtjeva**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Pronađi pogreške**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Provjera health endpoint-a**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### Revizija SQL baze podataka

**Omogućena je revizija SQL baze podataka** za praćenje:
- Obrasci pristupa bazi
- Neuspjeli pokušaji prijave
- Promjene sheme
- Pristup podacima (za usklađenost)

**Pristup revizijskim zapisima**:
1. Azure Portal → SQL baza → Auditing
2. Pregled zapisa u Log Analytics radnom prostoru

### Praćenje u stvarnom vremenu

**Pregledajte live metrike**:
1. Application Insights → Live Metrics
2. Prikaz zahtjeva, neuspjeha i performansi u stvarnom vremenu

**Postavite upozorenja**:
Kreirajte upozorenja za kritične događaje:
- HTTP 500 pogreške > 5 unutar 5 minuta
- Neuspjesi veze s bazom podataka
- Visoka vremena odziva (>2 sekunde)

**Primjer stvaranja upozorenja**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Rješavanje problema

### Česti problemi i rješenja

#### 1. `azd provision` ne uspijeva s porukom "Location not available"

**Simptom**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Rješenje**:
Odaberite drugi Azure region ili registrirajte pružatelja resursa:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Povezivanje na SQL ne uspijeva tijekom implementacije

**Simptom**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Rješenje**:
- Provjerite dopušta li firewall SQL Servera Azure usluge (automatski se konfigurira)
- Provjerite je li lozinka SQL administratora točno unesena tijekom `azd provision`
- Provjerite je li SQL Server potpuno provisioniran (može potrajati 2-3 minute)

**Provjerite vezu**:
```sh
# Iz Azure Portala, idite na SQL bazu podataka → Uređivač upita
# Pokušajte se povezati sa svojim vjerodajnicama
```

#### 3. Web aplikacija prikazuje "Application Error"

**Simptom**:
Preglednik prikazuje generičku stranicu s Greškom.

**Rješenje**:
Provjerite zapise aplikacije:
```sh
# Pogledajte nedavne zapise
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Česti uzroci**:
- Nedostajuće varijable okoline (provjerite App Service → Configuration)
- Neuspjela instalacija Python paketa (provjerite zapise implementacije)
- Pogreška prilikom inicijalizacije baze podataka (provjerite SQL konektivnost)

#### 4. `azd deploy` ne uspijeva s porukom "Build Error"

**Simptom**:
```
Error: Failed to build project
```

**Rješenje**:
- Provjerite da `requirements.txt` nema sintaksnih pogrešaka
- Provjerite je li Python 3.11 specificiran u `infra/resources/web-app.bicep`
- Provjerite ima li Dockerfile ispravnu osnovnu sliku

**Debug lokalno**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Unauthorized" prilikom pokretanja AZD naredbi

**Simptom**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Rješenje**:
Ponovno se autentificirajte na Azure:
```sh
azd auth login
az login
```

Provjerite imate li odgovarajuće dozvole (Contributor ulogu) na pretplatu.

#### 6. Visoki troškovi baze podataka

**Simptom**:
Neočekivani račun za Azure.

**Rješenje**:
- Provjerite jeste li zaboravili pokrenuti `azd down` nakon testiranja
- Provjerite koristi li SQL Baza Podataka Basic razinu (a ne Premium)
- Pregledajte troškove u Azure Cost Management
- Postavite upozorenja za troškove

### Dobivanje pomoći

**Prikaži sve AZD varijable okoline**:
```sh
azd env get-values
```

**Provjeri status implementacije**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Pristupi logovima aplikacije**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Trebate dodatnu pomoć?**
- [AZD vodič za rješavanje problema](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Rješavanje problema Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Rješavanje problema Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Praktične vježbe

### Vježba 1: Provjerite svoju implementaciju (Početnik)

**Cilj**: Potvrditi da su svi resursi implementirani i da aplikacija radi.

**Koraci**:
1. Nabrojite sve resurse u svojoj grupi resursa:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Očekivano**: 6-7 resursa (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Testirajte sve API krajnje točke:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Očekivano**: Sve vraćaju valjani JSON bez pogrešaka

3. Provjerite Application Insights:
   - Idite u Application Insights u Azure portalu
   - Otvorite "Live Metrics"
   - Osvježite preglednik na web aplikaciji
   **Očekivano**: Prikazuju se zahtjevi u stvarnom vremenu

**Kriteriji uspjeha**: Postoji svih 6-7 resursa, sve krajnje točke vraćaju podatke, Live Metrics pokazuje aktivnost.

---

### Vježba 2: Dodajte novi API endpoint (Srednja razina)

**Cilj**: Proširite Flask aplikaciju novom krajnjom točkom.

**Početni kod**: Trenutne krajnje točke u `src/web/app.py`

**Koraci**:
1. Uredite `src/web/app.py` i dodajte novi endpoint nakon funkcije `get_product()`:
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

2. Implementirajte ažuriranu aplikaciju:
   ```sh
   azd deploy
   ```

3. Testirajte novi endpoint:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Očekivano**: Vraća proizvode koji odgovaraju "laptop"

**Kriteriji uspjeha**: Novi endpoint radi, vraća filtrirane rezultate, pojavljuje se u zapisima Application Insights.

---

### Vježba 3: Dodajte nadzor i upozorenja (Napredno)

**Cilj**: Postaviti proaktivni nadzor s upozorenjima.

**Koraci**:
1. Kreirajte upozorenje za HTTP 500 pogreške:
   ```sh
   # Dohvati ID resursa Application Insights
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Kreiraj upozorenje
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Pokrenite upozorenje uzrokujući pogreške:
   ```sh
   # Zahtjev za nepostojeći proizvod
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Provjerite je li upozorenje aktivirano:
   - Azure Portal → Upozorenja → Pravila upozorenja
   - Provjerite svoj email (ako je konfiguriran)

**Kriteriji uspjeha**: Pravilo upozorenja je kreirano, aktivira se na pogreške, obavijesti su primljene.

---

### Vježba 4: Promjene sheme baze podataka (Napredno)

**Cilj**: Dodati novu tablicu i prilagoditi aplikaciju za njenu upotrebu.

**Koraci**:
1. Povežite se na SQL bazu putem Azure Portala Query Editora

2. Kreirajte novu tablicu `categories`:
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

3. Ažurirajte `src/web/app.py` da uključuje informacije o kategoriji u odgovore

4. Implementirajte i testirajte

**Kriteriji uspjeha**: Nova tablica postoji, proizvodi prikazuju informacije o kategoriji, aplikacija radi ispravno.

---

### Vježba 5: Implementirajte Cacheiranje (Ekspert)

**Cilj**: Dodajte Azure Redis Cache za poboljšanje performansi.

**Koraci**:
1. Dodajte Redis Cache u `infra/main.bicep`
2. Ažurirajte `src/web/app.py` za caching upita proizvoda
3. Mjerite poboljšanje performansi s Application Insights
4. Usporedite vrijeme odziva prije i nakon cachiranja

**Kriteriji uspjeha**: Redis je implementiran, cacheiranje radi, vremena odziva se poboljšavaju za više od 50%.

**Savjet**: Počnite s [Azure Cache for Redis dokumentacijom](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Čišćenje

Da biste izbjegli stalne troškove, obrišite sve resurse kad završite:

```sh
azd down
```

**Upit za potvrdu**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Upišite `y` za potvrdu.

**✓ Provjera uspjeha**:
- Svi resursi su izbrisani iz Azure Portala
- Nema stalnih troškova
- Lokalna mapa `.azure/<env-name>` može se obrisati

**Alternativa** (sačuvajte infrastrukturu, izbrišite podatke):
```sh
# Izbrišite samo grupu resursa (zadržite AZD konfiguraciju)
az group delete --name rg-<env-name> --yes
```
## Saznajte više

### Povezana dokumentacija
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database dokumentacija](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service dokumentacija](https://learn.microsoft.com/azure/app-service/)
- [Application Insights dokumentacija](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep referenca jezika](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Sljedeći koraci u ovom tečaju
- **[Container Apps primjer](../../../../examples/container-app)**: Implementirajte mikroservise s Azure Container Apps
- **[Vodič za AI integraciju](../../../../docs/ai-foundry)**: Dodajte AI mogućnosti u vašu aplikaciju
- **[Preporuke za implementaciju](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Obrasci implementacije u produkciji

### Napredne teme
- **Managed Identity**: Uklonite lozinke i koristite Azure AD autentifikaciju
- **Privatni endpointi**: Osigurajte veze s bazom unutar virtualne mreže
- **CI/CD integracija**: Automatizirajte implementacije s GitHub Actions ili Azure DevOps
- **Multi-okruženja**: Postavite razvojno, testno i produkcijsko okruženje
- **Migracije baze podataka**: Koristite Alembic ili Entity Framework za verzioniranje sheme

### Usporedba s drugim pristupima

**AZD vs. ARM predlošci**:
- ✅ AZD: Apstrakcija višeg nivoa, jednostavnije naredbe
- ⚠️ ARM: Detaljnije, granularna kontrola

**AZD vs. Terraform**:
- ✅ AZD: Azure-native, integriran s Azure uslugama
- ⚠️ Terraform: Multi-cloud podrška, veći ekosustav

**AZD vs. Azure Portal**:
- ✅ AZD: Ponovljivo, verzionirano, automatizirano
- ⚠️ Portal: Ručno klikanje, teško reproducirati

**Zamislite AZD kao**: Docker Compose za Azure—pojednostavljena konfiguracija za složene implementacije.

---

## Često postavljana pitanja

**P: Mogu li koristiti drugi programski jezik?**  
O: Da! Zamijenite `src/web/` s Node.js, C#, Go ili bilo kojim jezikom. Ažurirajte `azure.yaml` i Bicep po potrebi.

**P: Kako dodati više baza podataka?**  
O: Dodajte još jedan SQL Database modul u `infra/main.bicep` ili koristite PostgreSQL/MySQL iz Azure Database usluga.

**P: Mogu li ovo koristiti u produkciji?**  
O: Ovo je početna točka. Za produkciju dodajte managed identity, privatne endpointove, redundanciju, strategiju sigurnosnih kopija, WAF i poboljšani nadzor.

**P: Što ako želim koristiti kontejnere umjesto implementacije koda?**  
O: Pogledajte [Container Apps primjer](../../../../examples/container-app), koji koristi Docker kontejnere kroz cijeli proces.

**P: Kako se povezati na bazu s lokalnog računala?**  
O: Dodajte svoju IP adresu u firewall SQL Servera:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**P: Mogu li koristiti postojeću bazu umjesto kreiranja nove?**  
O: Da, izmijenite `infra/main.bicep` da referencira postojeći SQL Server i ažurirajte parametre veze.

---

> **Napomena:** Ovaj primjer demonstrira najbolje prakse za implementaciju web aplikacije s bazom koristeći AZD. Uključuje radni kod, opširnu dokumentaciju i praktične vježbe za jačanje znanja. Za produkcijske implementacije pregledajte sigurnost, skaliranje, usklađenost i zahtjeve troškova specifične za vašu organizaciju.

**📚 Navigacija tečajem:**
- ← Prethodno: [Container Apps primjer](../../../../examples/container-app)
- → Sljedeće: [Vodič za AI integraciju](../../../../docs/ai-foundry)
- 🏠 [Početna stranica tečaja](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:  
Ovaj dokument preveden je pomoću AI prevoditeljske usluge [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo postići točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati službenim izvorom. Za važne informacije preporučuje se stručni ljudski prijevod. Ne odgovaramo za bilo kakve nesporazume ili netačne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->