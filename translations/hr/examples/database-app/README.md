# Implementacija Microsoft SQL baze podataka i web aplikacije s AZD-om

⏱️ **Procijenjeno vrijeme**: 20-30 minuta | 💰 **Procijenjeni trošak**: ~15-25 USD/mjesečno | ⭐ **Složenost**: Srednja

Ovaj **potpuni, funkcionalni primjer** pokazuje kako koristiti [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) za implementaciju Python Flask web aplikacije s Microsoft SQL bazom podataka na Azure. Sav kod je uključen i testiran—nema vanjskih ovisnosti.

## Što ćete naučiti

Dovršavanjem ovog primjera naučit ćete:
- Implementirati višeslojnu aplikaciju (web aplikacija + baza podataka) koristeći infrastrukturu kao kod
- Konfigurirati sigurne veze s bazom podataka bez hardkodiranja tajni
- Pratiti zdravlje aplikacije pomoću Application Insights
- Učinkovito upravljati Azure resursima pomoću AZD CLI-ja
- Slijediti najbolje prakse za sigurnost, optimizaciju troškova i praćenje na Azureu

## Pregled scenarija
- **Web aplikacija**: Python Flask REST API s povezivanjem na bazu podataka
- **Baza podataka**: Azure SQL baza podataka s uzorcima podataka
- **Infrastruktura**: Implementirana pomoću Bicep-a (modularni, višekratni predlošci)
- **Implementacija**: Potpuno automatizirana pomoću `azd` naredbi
- **Praćenje**: Application Insights za logove i telemetriju

## Preduvjeti

### Potrebni alati

Prije početka, provjerite imate li instalirane sljedeće alate:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (verzija 2.50.0 ili novija)
   ```sh
   az --version
   # Očekivani izlaz: azure-cli 2.50.0 ili noviji
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (verzija 1.0.0 ili novija)
   ```sh
   azd version
   # Očekivani izlaz: azd verzija 1.0.0 ili novija
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (za lokalni razvoj)
   ```sh
   python --version
   # Očekivani izlaz: Python 3.8 ili noviji
   ```

4. **[Docker](https://www.docker.com/get-started)** (opcionalno, za lokalni razvoj u kontejnerima)
   ```sh
   docker --version
   # Očekivani rezultat: Docker verzija 20.10 ili novija
   ```

### Zahtjevi za Azure

- Aktivna **Azure pretplata** ([kreirajte besplatni račun](https://azure.microsoft.com/free/))
- Dozvole za kreiranje resursa u vašoj pretplati
- **Vlasnik** ili **Suradnik** u pretplati ili grupi resursa

### Preduvjeti znanja

Ovo je primjer **srednje razine složenosti**. Trebali biste biti upoznati s:
- Osnovnim operacijama na naredbenom retku
- Osnovnim konceptima oblaka (resursi, grupe resursa)
- Osnovnim razumijevanjem web aplikacija i baza podataka

**Novi u AZD-u?** Započnite s [Vodičem za početnike](../../docs/getting-started/azd-basics.md).

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
- **Grupa resursa**: Kontejner za sve resurse
- **Plan usluga aplikacije**: Hosting na Linuxu (B1 razina za ekonomičnost)
- **Web aplikacija**: Python 3.11 runtime s Flask aplikacijom
- **SQL poslužitelj**: Upravljani poslužitelj baze podataka s minimalnim TLS 1.2
- **SQL baza podataka**: Osnovna razina (2GB, pogodna za razvoj/testiranje)
- **Application Insights**: Praćenje i logiranje
- **Log Analytics radni prostor**: Centralizirano spremanje logova

**Analogija**: Zamislite ovo kao restoran (web aplikacija) s hladnjačom (baza podataka). Kupci naručuju s jelovnika (API krajnje točke), a kuhinja (Flask aplikacija) preuzima sastojke (podatke) iz hladnjače. Menadžer restorana (Application Insights) prati sve što se događa.

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
- **azure.yaml**: Govori AZD-u što implementirati i gdje
- **infra/main.bicep**: Orkestrira sve Azure resurse
- **infra/resources/*.bicep**: Pojedinačne definicije resursa (modularne za ponovnu upotrebu)
- **src/web/app.py**: Flask aplikacija s logikom baze podataka
- **requirements.txt**: Python ovisnosti
- **Dockerfile**: Upute za kontejnerizaciju za implementaciju

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

### Korak 2: Autentifikacija s Azureom

```sh
azd auth login
```

Ovo otvara vaš preglednik za autentifikaciju na Azure. Prijavite se sa svojim Azure vjerodajnicama.

**✓ Provjera uspjeha**: Trebali biste vidjeti:
```
Logged in to Azure.
```

### Korak 3: Inicijalizirajte okruženje

```sh
azd init
```

**Što se događa**: AZD kreira lokalnu konfiguraciju za vašu implementaciju.

**Upiti koje ćete vidjeti**:
- **Naziv okruženja**: Unesite kratki naziv (npr. `dev`, `myapp`)
- **Azure pretplata**: Odaberite svoju pretplatu s popisa
- **Azure lokacija**: Odaberite regiju (npr. `eastus`, `westeurope`)

**✓ Provjera uspjeha**: Trebali biste vidjeti:
```
SUCCESS: New project initialized!
```

### Korak 4: Provisioniranje Azure resursa

```sh
azd provision
```

**Što se događa**: AZD implementira svu infrastrukturu (traje 5-8 minuta):
1. Kreira grupu resursa
2. Kreira SQL poslužitelj i bazu podataka
3. Kreira plan usluga aplikacije
4. Kreira web aplikaciju
5. Kreira Application Insights
6. Konfigurira mrežu i sigurnost

**Bit ćete upitani za**:
- **SQL admin korisničko ime**: Unesite korisničko ime (npr. `sqladmin`)
- **SQL admin lozinka**: Unesite jaku lozinku (sačuvajte je!)

**✓ Provjera uspjeha**: Trebali biste vidjeti:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Vrijeme**: 5-8 minuta

### Korak 5: Implementacija aplikacije

```sh
azd deploy
```

**Što se događa**: AZD gradi i implementira vašu Flask aplikaciju:
1. Pakira Python aplikaciju
2. Gradi Docker kontejner
3. Prenosi na Azure Web App
4. Inicijalizira bazu podataka s uzorcima podataka
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

Ovo otvara vašu implementiranu web aplikaciju u pregledniku na `https://app-<jedinstveni-id>.azurewebsites.net`

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

### Korak 7: Testirajte API krajnje točke

**Provjera zdravlja** (provjerite vezu s bazom podataka):
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

**Dohvat pojedinog proizvoda**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Provjera uspjeha**: Sve krajnje točke vraćaju JSON podatke bez grešaka.

---

**🎉 Čestitamo!** Uspješno ste implementirali web aplikaciju s bazom podataka na Azure koristeći AZD.

## Detaljna konfiguracija

### Varijable okruženja

Tajne se sigurno upravljaju putem konfiguracije Azure App Service-a—**nikada se ne hardkodiraju u izvorni kod**.

**Automatski konfigurirano od strane AZD-a**:
- `SQL_CONNECTION_STRING`: Veza s bazom podataka s enkriptiranim vjerodajnicama
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Telemetrijska krajnja točka za praćenje
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Omogućuje automatsku instalaciju ovisnosti

**Gdje se tajne pohranjuju**:
1. Tijekom `azd provision`, unosite SQL vjerodajnice putem sigurnih upita
2. AZD ih pohranjuje u lokalnu `.azure/<env-name>/.env` datoteku (ignorira se u Gitu)
3. AZD ih ubrizgava u konfiguraciju Azure App Service-a (enkriptirano u mirovanju)
4. Aplikacija ih čita putem `os.getenv()` tijekom izvođenja

### Lokalni razvoj

Za lokalno testiranje, kreirajte `.env` datoteku iz uzorka:

```sh
cp .env.sample .env
# Uredite .env s vašom lokalnom vezom na bazu podataka
```

**Radni tijek lokalnog razvoja**:
```sh
# Instaliraj ovisnosti
cd src/web
pip install -r requirements.txt

# Postavi varijable okruženja
export SQL_CONNECTION_STRING="your-local-connection-string"

# Pokreni aplikaciju
python app.py
```

**Testirajte lokalno**:
```sh
curl http://localhost:8000/health
# Očekivano: {"status": "zdrav", "baza podataka": "povezana"}
```

### Infrastruktura kao kod

Svi Azure resursi definirani su u **Bicep predlošcima** (mapa `infra/`):

- **Modularni dizajn**: Svaka vrsta resursa ima vlastitu datoteku za ponovnu upotrebu
- **Parametrizirano**: Prilagodite SKU-ove, regije, konvencije imenovanja
- **Najbolje prakse**: Slijedi Azure standarde imenovanja i sigurnosne zadane postavke
- **Praćenje verzija**: Promjene infrastrukture prate se u Gitu

**Primjer prilagodbe**:
Za promjenu razine baze podataka, uredite `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Najbolje prakse za sigurnost

Ovaj primjer slijedi najbolje prakse za sigurnost na Azureu:

### 1. **Nema tajni u izvornom kodu**
- ✅ Vjerodajnice pohranjene u konfiguraciji Azure App Service-a (enkriptirano)
- ✅ `.env` datoteke isključene iz Gita putem `.gitignore`
- ✅ Tajne se prenose putem sigurnih parametara tijekom provisioniranja

### 2. **Enkriptirane veze**
- ✅ Minimalno TLS 1.2 za SQL poslužitelj
- ✅ HTTPS samo za Web App
- ✅ Veze s bazom podataka koriste enkriptirane kanale

### 3. **Sigurnost mreže**
- ✅ SQL poslužiteljski firewall konfiguriran da dopušta samo Azure usluge
- ✅ Javni mrežni pristup ograničen (može se dodatno zaključati privatnim krajnjim točkama)
- ✅ FTPS onemogućen na Web App

### 4. **Autentifikacija i autorizacija**
- ⚠️ **Trenutno**: SQL autentifikacija (korisničko ime/lozinka)
- ✅ **Preporuka za produkciju**: Koristite Azure Managed Identity za autentifikaciju bez lozinke

**Za nadogradnju na Managed Identity** (za produkciju):
1. Omogućite managed identity na Web App
2. Dodijelite identitetu SQL dozvole
3. Ažurirajte string veze za korištenje managed identity
4. Uklonite autentifikaciju temeljenu na lozinki

### 5. **Revizija i usklađenost**
- ✅ Application Insights bilježi sve zahtjeve i pogreške
- ✅ SQL baza podataka ima omogućenu reviziju (može se konfigurirati za usklađenost)
- ✅ Svi resursi označeni za upravljanje

**Sigurnosna kontrolna lista prije produkcije**:
- [ ] Omogućite Azure Defender za SQL
- [ ] Konfigurirajte privatne krajnje točke za SQL bazu podataka
- [ ] Omogućite Web Application Firewall (WAF)
- [ ] Implementirajte Azure Key Vault za rotaciju tajni
- [ ] Konfigurirajte Azure AD autentifikaciju
- [ ] Omogućite dijagnostičko logiranje za sve resurse

## Optimizacija troškova

**Procijenjeni mjesečni troškovi** (od studenog 2025.):

| Resurs | SKU/Razina | Procijenjeni trošak |
|--------|------------|---------------------|
| Plan usluga aplikacije | B1 (Osnovni) | ~13 USD/mjesečno |
| SQL baza podataka | Osnovna (2GB) | ~5 USD/mjesečno |
| Application Insights | Plaćanje po korištenju | ~2 USD/mjesečno (niski promet) |
| **Ukupno** | | **~20 USD/mjesečno** |

**💡 Savjeti za uštedu troškova**:

1. **Koristite besplatnu razinu za učenje**:
   - App Service: F1 razina (besplatno, ograničeni sati)
   - SQL baza podataka: Koristite Azure SQL Database serverless
   - Application Insights: 5GB/mjesečno besplatno unosa

2. **Zaustavite resurse kada ih ne koristite**:
   ```sh
   # Zaustavi web aplikaciju (baza podataka i dalje naplaćuje)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Ponovno pokreni kada je potrebno
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Izbrišite sve nakon testiranja**:
   ```sh
   azd down
   ```
 Ovo uklanja SVE resurse i zaustavlja troškove.

4. **Razvojni vs. produkcijski SKU-ovi**:
   - **Razvoj**: Osnovna razina (korištena u ovom primjeru)
   - **Produkcija**: Standardna/Premium razina s redundancijom

**Praćenje troškova**:
- Pregledajte troškove u [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Postavite upozorenja o troškovima kako biste izbjegli iznenađenja
- Označite sve resurse s `azd-env-name` za praćenje

**Alternativa besplatnoj razini**:
Za potrebe učenja, možete izmijeniti `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Napomena**: Besplatna razina ima ograničenja (60 min/dan CPU, nema always-on).

## Praćenje i preglednost

### Integracija Application Insights

Ovaj primjer uključuje **Application Insights** za sveobuhvatno praćenje:

**Što se prati**:
- ✅ HTTP zahtjevi (kašnjenje, statusni kodovi, krajnje točke)
- ✅ Pogreške i iznimke aplikacije
- ✅ Prilagođeno logiranje iz Flask aplikacije
- ✅ Zdravlje veze s bazom podataka
- ✅ Performanse (CPU, memorija)

**Pristup Application Insights**:
1. Otvorite [Azure Portal](https://portal.azure.com)
2. Navigirajte do svoje grupe resursa (`rg-<env-name>`)
3. Kliknite na Application Insights resurs (`appi-<jedinstveni-id>`)

**Korisni upiti** (Application Insights → Logovi):

**Pregled svih zahtjeva**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Pronađite pogreške**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Provjerite krajnju točku zdravlja**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### Revizija SQL baze podataka

**Revizija SQL baze podataka je omogućena** za praćenje:
- Obrasci pristupa bazi podataka
- Neuspjeli pokušaji prijave
- Promjene u shemi
- Pristup podacima (za usklađenost)

**Pristup revizijskim logovima**:
1. Azure Portal → SQL baza podataka → Revizija
2. Pregledajte logove u Log Analytics radnom prostoru

### Praćenje u stvarnom vremenu

**Pregledajte metrike uživo**:
1. Application Insights → Live Metrics
2. Pogledajte zahtjeve, pogreške i performanse u stvarnom vremenu

**Postavite upozorenja**:
Kreirajte upozorenja za kritične događaje:
- HTTP 500 pogreške > 5 u 5 minuta
- Neuspjele veze s bazom podataka
- Visoko vrijeme odziva (>2 sekunde)

**Primjer kreiranja upozorenja**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Rješavanje problema

### Uobičajeni problemi i rješenja

#### 1. `azd provision` ne uspijeva s porukom "Lokacija nije dostupna"

**Simptom**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Rješenje**:
Odaberite drugu Azure regiju ili registrirajte pružatelja resursa:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. SQL veza ne uspijeva tijekom implementacije

**Simptom**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Rješenje**:
- Provjerite da li SQL Server firewall dopušta Azure usluge (automatski konfigurirano)
- Provjerite je li SQL administratorska lozinka ispravno unesena tijekom `azd provision`
- Osigurajte da je SQL Server potpuno implementiran (može potrajati 2-3 minute)

**Provjera veze**:
```sh
# Iz Azure Portala, idite na SQL Bazu podataka → Uređivač upita
# Pokušajte se povezati sa svojim vjerodajnicama
```

#### 3. Web aplikacija prikazuje "Greška aplikacije"

**Simptom**:
Preglednik prikazuje generičnu stranicu s greškom.

**Rješenje**:
Provjerite logove aplikacije:
```sh
# Pregledaj nedavne zapise
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Uobičajeni uzroci**:
- Nedostaju varijable okruženja (provjerite App Service → Konfiguracija)
- Instalacija Python paketa nije uspjela (provjerite logove implementacije)
- Greška u inicijalizaciji baze podataka (provjerite SQL povezanost)

#### 4. `azd deploy` ne uspijeva s porukom "Greška u izgradnji"

**Simptom**:
```
Error: Failed to build project
```

**Rješenje**:
- Provjerite da `requirements.txt` nema sintaktičkih grešaka
- Provjerite je li Python 3.11 specificiran u `infra/resources/web-app.bicep`
- Provjerite da Dockerfile ima ispravnu osnovnu sliku

**Debug lokalno**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Neovlašteno" prilikom pokretanja AZD naredbi

**Simptom**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Rješenje**:
Ponovno se autentificirajte s Azure:
```sh
azd auth login
az login
```

Provjerite imate li ispravne dozvole (Contributor uloga) na pretplati.

#### 6. Visoki troškovi baze podataka

**Simptom**:
Neočekivani Azure račun.

**Rješenje**:
- Provjerite jeste li zaboravili pokrenuti `azd down` nakon testiranja
- Provjerite koristi li SQL baza podataka Basic tier (ne Premium)
- Pregledajte troškove u Azure Cost Management
- Postavite upozorenja o troškovima

### Dobivanje pomoći

**Pregled svih AZD varijabli okruženja**:
```sh
azd env get-values
```

**Provjera statusa implementacije**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Pristup logovima aplikacije**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Trebate više pomoći?**
- [AZD vodič za rješavanje problema](../../docs/troubleshooting/common-issues.md)
- [Azure App Service rješavanje problema](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL rješavanje problema](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Praktične vježbe

### Vježba 1: Provjera vaše implementacije (Početnik)

**Cilj**: Potvrdite da su svi resursi implementirani i da aplikacija radi.

**Koraci**:
1. Popis svih resursa u vašoj grupi resursa:
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
   **Očekivano**: Sve vraćaju valjani JSON bez grešaka

3. Provjerite Application Insights:
   - Idite na Application Insights u Azure Portalu
   - Idite na "Live Metrics"
   - Osvježite preglednik na web aplikaciji
   **Očekivano**: Vidite zahtjeve u stvarnom vremenu

**Kriterij uspjeha**: Svi resursi postoje, sve krajnje točke vraćaju podatke, Live Metrics pokazuje aktivnost.

---

### Vježba 2: Dodavanje nove API krajnje točke (Srednje)

**Cilj**: Proširite Flask aplikaciju s novom krajnjom točkom.

**Početni kod**: Trenutne krajnje točke u `src/web/app.py`

**Koraci**:
1. Uredite `src/web/app.py` i dodajte novu krajnju točku nakon funkcije `get_product()`:
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

3. Testirajte novu krajnju točku:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Očekivano**: Vraća proizvode koji odgovaraju "laptop"

**Kriterij uspjeha**: Nova krajnja točka radi, vraća filtrirane rezultate, pojavljuje se u logovima Application Insights.

---

### Vježba 3: Dodavanje praćenja i upozorenja (Napredno)

**Cilj**: Postavite proaktivno praćenje s upozorenjima.

**Koraci**:
1. Kreirajte upozorenje za HTTP 500 greške:
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

2. Aktivirajte upozorenje uzrokovanjem grešaka:
   ```sh
   # Zatraži nepostojeći proizvod
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Provjerite je li upozorenje aktivirano:
   - Azure Portal → Alerts → Alert Rules
   - Provjerite svoj email (ako je konfiguriran)

**Kriterij uspjeha**: Pravilo upozorenja je kreirano, aktivira se na greškama, primljene su obavijesti.

---

### Vježba 4: Promjene sheme baze podataka (Napredno)

**Cilj**: Dodajte novu tablicu i izmijenite aplikaciju da je koristi.

**Koraci**:
1. Povežite se s SQL bazom podataka putem Azure Portala Query Editor

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

3. Ažurirajte `src/web/app.py` da uključuje informacije o kategorijama u odgovore

4. Implementirajte i testirajte

**Kriterij uspjeha**: Nova tablica postoji, proizvodi prikazuju informacije o kategorijama, aplikacija i dalje radi.

---

### Vježba 5: Implementacija keširanja (Ekspert)

**Cilj**: Dodajte Azure Redis Cache za poboljšanje performansi.

**Koraci**:
1. Dodajte Redis Cache u `infra/main.bicep`
2. Ažurirajte `src/web/app.py` za keširanje upita proizvoda
3. Izmjerite poboljšanje performansi s Application Insights
4. Usporedite vrijeme odziva prije/poslije keširanja

**Kriterij uspjeha**: Redis je implementiran, keširanje radi, vrijeme odziva poboljšano za >50%.

**Savjet**: Započnite s [Azure Cache for Redis dokumentacijom](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Čišćenje

Kako biste izbjegli stalne troškove, izbrišite sve resurse nakon završetka:

```sh
azd down
```

**Potvrda**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Upišite `y` za potvrdu.

**✓ Provjera uspjeha**: 
- Svi resursi su izbrisani iz Azure Portala
- Nema stalnih troškova
- Lokalna `.azure/<env-name>` mapa može se izbrisati

**Alternativa** (zadržite infrastrukturu, izbrišite podatke):
```sh
# Izbriši samo grupu resursa (zadrži AZD konfiguraciju)
az group delete --name rg-<env-name> --yes
```
## Saznajte više

### Povezana dokumentacija
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database dokumentacija](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service dokumentacija](https://learn.microsoft.com/azure/app-service/)
- [Application Insights dokumentacija](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep jezična referenca](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Sljedeći koraci u ovom tečaju
- **[Primjer aplikacija u kontejnerima](../../../../examples/container-app)**: Implementirajte mikroservise s Azure Container Apps
- **[Vodič za AI integraciju](../../../../docs/ai-foundry)**: Dodajte AI mogućnosti svojoj aplikaciji
- **[Najbolje prakse implementacije](../../docs/deployment/deployment-guide.md)**: Obrasci implementacije za produkciju

### Napredne teme
- **Upravljani identitet**: Uklonite lozinke i koristite Azure AD autentifikaciju
- **Privatne krajnje točke**: Osigurajte veze s bazom podataka unutar virtualne mreže
- **CI/CD integracija**: Automatizirajte implementacije s GitHub Actions ili Azure DevOps
- **Više okruženja**: Postavite razvojna, testna i produkcijska okruženja
- **Migracije baza podataka**: Koristite Alembic ili Entity Framework za verzioniranje sheme

### Usporedba s drugim pristupima

**AZD vs. ARM Templates**:
- ✅ AZD: Viša razina apstrakcije, jednostavnije naredbe
- ⚠️ ARM: Više detalja, granularna kontrola

**AZD vs. Terraform**:
- ✅ AZD: Azure-nativno, integrirano s Azure uslugama
- ⚠️ Terraform: Podrška za više oblaka, veći ekosustav

**AZD vs. Azure Portal**:
- ✅ AZD: Ponovljivo, kontrolirano verzijama, automatizirano
- ⚠️ Portal: Ručni klikovi, teško za reprodukciju

**Razmislite o AZD-u kao**: Docker Compose za Azure—pojednostavljena konfiguracija za složene implementacije.

---

## Često postavljana pitanja

**P: Mogu li koristiti drugi programski jezik?**  
O: Da! Zamijenite `src/web/` s Node.js, C#, Go ili bilo kojim jezikom. Ažurirajte `azure.yaml` i Bicep prema potrebi.

**P: Kako dodati više baza podataka?**  
O: Dodajte još jedan SQL Database modul u `infra/main.bicep` ili koristite PostgreSQL/MySQL iz Azure Database usluga.

**P: Mogu li ovo koristiti za produkciju?**  
O: Ovo je početna točka. Za produkciju dodajte: upravljani identitet, privatne krajnje točke, redundanciju, strategiju sigurnosne kopije, WAF i poboljšano praćenje.

**P: Što ako želim koristiti kontejnere umjesto implementacije koda?**  
O: Pogledajte [Primjer aplikacija u kontejnerima](../../../../examples/container-app) koji koristi Docker kontejnere.

**P: Kako se povezati s bazom podataka s lokalnog računala?**  
O: Dodajte svoj IP u SQL Server firewall:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**P: Mogu li koristiti postojeću bazu podataka umjesto kreiranja nove?**  
O: Da, izmijenite `infra/main.bicep` da referencira postojeći SQL Server i ažurirajte parametre veze.

---

> **Napomena:** Ovaj primjer prikazuje najbolje prakse za implementaciju web aplikacije s bazom podataka koristeći AZD. Uključuje radni kod, sveobuhvatnu dokumentaciju i praktične vježbe za jačanje znanja. Za produkcijske implementacije, pregledajte sigurnosne, skalabilne, usklađenosti i troškovne zahtjeve specifične za vašu organizaciju.

**📚 Navigacija tečajem:**
- ← Prethodno: [Primjer aplikacija u kontejnerima](../../../../examples/container-app)
- → Sljedeće: [Vodič za AI integraciju](../../../../docs/ai-foundry)
- 🏠 [Početna stranica tečaja](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane čovjeka. Ne odgovaramo za nesporazume ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->