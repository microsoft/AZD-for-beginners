# Diegimas Microsoft SQL Duomenų Bazės ir Tinklalapio su AZD

⏱️ **Numatomas laikas**: 20-30 minučių | 💰 **Numatomos išlaidos**: ~15-25 €/mėn. | ⭐ **Sudėtingumas**: Vidutinis

Šis **pilnas, veikiantis pavyzdys** parodo, kaip naudoti [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) diegiant Python Flask tinklalapį su Microsoft SQL duomenų baze į Azure. Visi kodai yra įtraukti ir išbandyti – nereikia jokių išorinių priklausomybių.

## Ko išmoksite

Baigę šį pavyzdį, jūs:
- Diegsite daugiasluoksnę programą (tinklalapis + duomenų bazė) naudodami infrastruktūrą kaip kodą
- Konfigūruosite saugius duomenų bazės ryšius be slaptažodžių kodo viduje
- Stebėsite programos būklę naudodami Application Insights
- Efektyviai valdysite Azure išteklius su AZD CLI
- Laikysitės Azure geriausių praktikų saugumo, kaštų optimizavimo ir stebėjimo srityse

## Scenarijaus apžvalga
- **Tinklalapis**: Python Flask REST API su duomenų bazės ryšiu
- **Duomenų bazė**: Azure SQL duomenų bazė su pavyzdiniais duomenimis
- **Infrastruktūra**: Sukurta naudojant Bicep (moduliniai, pakartotinai naudojami šablonai)
- **Diegimas**: Visiškai automatizuotas naudojant `azd` komandas
- **Stebėjimas**: Application Insights žurnalams ir telemetrijai

## Reikalavimai

### Reikalingi įrankiai

Prieš pradėdami, įsitikinkite, kad turite šiuos įrankius:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (2.50.0 ar naujesnė versija)
   ```sh
   az --version
   # Tikėtinas rezultatas: azure-cli 2.50.0 arba naujesnė
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (1.0.0 ar naujesnė versija)
   ```sh
   azd version
   # Tikėtinas rezultatas: azd versija 1.0.0 arba aukštesnė
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (vietinei plėtrai)
   ```sh
   python --version
   # Tikėtinas rezultatas: Python 3.8 arba naujesnė
   ```

4. **[Docker](https://www.docker.com/get-started)** (neprivaloma, vietinei konteinerizuotai plėtrai)
   ```sh
   docker --version
   # Tikėtinas rezultatas: Docker versija 20.10 arba naujesnė
   ```

### Azure reikalavimai

- Aktyvi **Azure prenumerata** ([sukurkite nemokamą paskyrą](https://azure.microsoft.com/free/))
- Leidimai kurti išteklius jūsų prenumeratoje
- **Savininko** arba **Bendradarbio** vaidmuo prenumeratoje ar išteklių grupėje

### Žinių reikalavimai

Tai yra **vidutinio lygio** pavyzdys. Turėtumėte būti susipažinę su:
- Pagrindinėmis komandinės eilutės operacijomis
- Pagrindinėmis debesų kompiuterijos sąvokomis (ištekliai, išteklių grupės)
- Pagrindiniu supratimu apie tinklalapius ir duomenų bazes

**Naujokas AZD?** Pradėkite nuo [Pradžios vadovo](../../docs/getting-started/azd-basics.md).

## Architektūra

Šis pavyzdys diegia dviejų sluoksnių architektūrą su tinklalapiu ir SQL duomenų baze:

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

**Išteklių diegimas:**
- **Išteklių grupė**: Visų išteklių konteineris
- **App Service Plan**: Linux pagrindu veikiantis talpinimas (B1 lygis, ekonomiškas)
- **Tinklalapis**: Python 3.11 su Flask programa
- **SQL serveris**: Valdomas duomenų bazės serveris su TLS 1.2 minimalia versija
- **SQL duomenų bazė**: Bazinis lygis (2GB, tinkamas plėtrai/testavimui)
- **Application Insights**: Stebėjimas ir žurnalai
- **Log Analytics Workspace**: Centralizuota žurnalų saugykla

**Analogiškai**: Įsivaizduokite tai kaip restoraną (tinklalapis) su šaldytuvu (duomenų baze). Klientai užsako iš meniu (API galiniai taškai), o virtuvė (Flask programa) paima ingredientus (duomenis) iš šaldytuvo. Restorano vadovas (Application Insights) stebi viską, kas vyksta.

## Aplanko struktūra

Visi failai yra įtraukti į šį pavyzdį – nereikia jokių išorinių priklausomybių:

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

**Ką daro kiekvienas failas:**
- **azure.yaml**: Nurodo AZD, ką ir kur diegti
- **infra/main.bicep**: Orkestruoja visus Azure išteklius
- **infra/resources/*.bicep**: Atskirų išteklių apibrėžimai (moduliniai, pakartotinai naudojami)
- **src/web/app.py**: Flask programa su duomenų bazės logika
- **requirements.txt**: Python paketų priklausomybės
- **Dockerfile**: Konteinerizacijos instrukcijos diegimui

## Greitas startas (žingsnis po žingsnio)

### 1 žingsnis: Klonuokite ir pereikite

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Sėkmės patikrinimas**: Įsitikinkite, kad matote `azure.yaml` ir `infra/` aplanką:
```sh
ls
# Tikimasi: README.md, azure.yaml, infra/, src/
```

### 2 žingsnis: Autentifikuokitės su Azure

```sh
azd auth login
```

Tai atidarys jūsų naršyklę Azure autentifikacijai. Prisijunkite naudodami savo Azure kredencialus.

**✓ Sėkmės patikrinimas**: Turėtumėte matyti:
```
Logged in to Azure.
```

### 3 žingsnis: Inicializuokite aplinką

```sh
azd init
```

**Kas vyksta**: AZD sukuria vietinę konfigūraciją jūsų diegimui.

**Klausimai, kuriuos matysite**:
- **Aplinkos pavadinimas**: Įveskite trumpą pavadinimą (pvz., `dev`, `myapp`)
- **Azure prenumerata**: Pasirinkite savo prenumeratą iš sąrašo
- **Azure vieta**: Pasirinkite regioną (pvz., `eastus`, `westeurope`)

**✓ Sėkmės patikrinimas**: Turėtumėte matyti:
```
SUCCESS: New project initialized!
```

### 4 žingsnis: Azure išteklių paruošimas

```sh
azd provision
```

**Kas vyksta**: AZD diegia visą infrastruktūrą (trunka 5-8 minutes):
1. Sukuria išteklių grupę
2. Sukuria SQL serverį ir duomenų bazę
3. Sukuria App Service Plan
4. Sukuria tinklalapį
5. Sukuria Application Insights
6. Konfigūruoja tinklus ir saugumą

**Būsite paprašyti**:
- **SQL administratoriaus vartotojo vardas**: Įveskite vartotojo vardą (pvz., `sqladmin`)
- **SQL administratoriaus slaptažodis**: Įveskite stiprų slaptažodį (išsaugokite jį!)

**✓ Sėkmės patikrinimas**: Turėtumėte matyti:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Laikas**: 5-8 minutės

### 5 žingsnis: Programos diegimas

```sh
azd deploy
```

**Kas vyksta**: AZD sukuria ir diegia jūsų Flask programą:
1. Supakuoja Python programą
2. Sukuria Docker konteinerį
3. Įkelia į Azure Web App
4. Inicializuoja duomenų bazę su pavyzdiniais duomenimis
5. Paleidžia programą

**✓ Sėkmės patikrinimas**: Turėtumėte matyti:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Laikas**: 3-5 minutės

### 6 žingsnis: Naršykite programą

```sh
azd browse
```

Tai atidarys jūsų diegtą tinklalapį naršyklėje adresu `https://app-<unikalus-id>.azurewebsites.net`

**✓ Sėkmės patikrinimas**: Turėtumėte matyti JSON išvestį:
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

### 7 žingsnis: Testuokite API galinius taškus

**Sveikatos patikrinimas** (patikrinkite duomenų bazės ryšį):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Tikėtinas atsakymas**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**Produktų sąrašas** (pavyzdiniai duomenys):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Tikėtinas atsakymas**:
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

**Vieno produkto gavimas**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Sėkmės patikrinimas**: Visi galiniai taškai grąžina JSON duomenis be klaidų.

---

**🎉 Sveikiname!** Jūs sėkmingai įdiegėte tinklalapį su duomenų baze į Azure naudodami AZD.
- Ilgi atsako laikai (>2 sekundės)

**Pavyzdys, kaip sukurti įspėjimą**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Trikčių šalinimas

### Dažniausios problemos ir sprendimai

#### 1. `azd provision` nepavyksta su klaida "Location not available"

**Simptomas**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Sprendimas**:
Pasirinkite kitą Azure regioną arba užregistruokite resursų teikėją:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. SQL ryšys nepavyksta diegimo metu

**Simptomas**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Sprendimas**:
- Patikrinkite, ar SQL Server ugniasienė leidžia Azure paslaugas (nustatoma automatiškai)
- Įsitikinkite, kad SQL administratoriaus slaptažodis buvo teisingai įvestas vykdant `azd provision`
- Patikrinkite, ar SQL Server yra visiškai paruoštas (gali užtrukti 2-3 minutes)

**Patikrinkite ryšį**:
```sh
# Iš Azure Portal eikite į SQL Database → Query editor
# Pabandykite prisijungti naudodami savo prisijungimo duomenis
```

#### 3. Tinklalapis rodo "Application Error"

**Simptomas**:
Naršyklėje rodoma bendroji klaidos puslapio žinutė.

**Sprendimas**:
Patikrinkite programos žurnalus:
```sh
# Peržiūrėti naujausius žurnalus
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Dažnos priežastys**:
- Trūksta aplinkos kintamųjų (patikrinkite App Service → Configuration)
- Nepavyko įdiegti Python paketų (patikrinkite diegimo žurnalus)
- Duomenų bazės inicializavimo klaida (patikrinkite SQL ryšį)

#### 4. `azd deploy` nepavyksta su klaida "Build Error"

**Simptomas**:
```
Error: Failed to build project
```

**Sprendimas**:
- Įsitikinkite, kad `requirements.txt` neturi sintaksės klaidų
- Patikrinkite, ar `infra/resources/web-app.bicep` nurodytas Python 3.11
- Patikrinkite, ar Dockerfile turi tinkamą bazinį vaizdą

**Derinkite lokaliai**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Unauthorized" vykdant AZD komandas

**Simptomas**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Sprendimas**:
Autentifikuokitės iš naujo su Azure:
```sh
azd auth login
az login
```

Patikrinkite, ar turite tinkamus leidimus (Contributor rolę) prenumeratoje.

#### 6. Didelės duomenų bazės išlaidos

**Simptomas**:
Netikėta Azure sąskaita.

**Sprendimas**:
- Patikrinkite, ar nepamiršote paleisti `azd down` po testavimo
- Įsitikinkite, kad SQL duomenų bazė naudoja Basic planą (ne Premium)
- Peržiūrėkite išlaidas Azure Cost Management
- Nustatykite išlaidų įspėjimus

### Pagalbos gavimas

**Peržiūrėkite visus AZD aplinkos kintamuosius**:
```sh
azd env get-values
```

**Patikrinkite diegimo būseną**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Pasiekite programos žurnalus**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Reikia daugiau pagalbos?**
- [AZD trikčių šalinimo vadovas](../../docs/troubleshooting/common-issues.md)
- [Azure App Service trikčių šalinimas](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL trikčių šalinimas](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Praktiniai pratimai

### Pratimas 1: Patikrinkite savo diegimą (Pradedantiesiems)

**Tikslas**: Įsitikinkite, kad visi resursai yra įdiegti ir programa veikia.

**Žingsniai**:
1. Išvardinkite visus resursus savo resursų grupėje:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Tikimasi**: 6-7 resursai (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Patikrinkite visus API galinius taškus:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Tikimasi**: Visi grąžina galiojantį JSON be klaidų

3. Patikrinkite Application Insights:
   - Eikite į Application Insights Azure portale
   - Pasirinkite "Live Metrics"
   - Atnaujinkite naršyklę tinklalapyje
   **Tikimasi**: Matysite realaus laiko užklausas

**Sėkmės kriterijai**: Visi 6-7 resursai egzistuoja, visi galiniai taškai grąžina duomenis, Live Metrics rodo aktyvumą.

---

### Pratimas 2: Pridėkite naują API galinį tašką (Vidutinis)

**Tikslas**: Išplėskite Flask programą nauju galiniu tašku.

**Pradinis kodas**: Dabartiniai galiniai taškai `src/web/app.py`

**Žingsniai**:
1. Redaguokite `src/web/app.py` ir pridėkite naują galinį tašką po `get_product()` funkcijos:
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

2. Įdiekite atnaujintą programą:
   ```sh
   azd deploy
   ```

3. Patikrinkite naują galinį tašką:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Tikimasi**: Grąžina produktus, atitinkančius "laptop"

**Sėkmės kriterijai**: Naujas galinis taškas veikia, grąžina filtruotus rezultatus, rodomas Application Insights žurnaluose.

---

### Pratimas 3: Pridėkite stebėjimą ir įspėjimus (Pažengęs)

**Tikslas**: Sukurkite proaktyvų stebėjimą su įspėjimais.

**Žingsniai**:
1. Sukurkite įspėjimą HTTP 500 klaidoms:
   ```sh
   # Gauti „Application Insights“ išteklių ID
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Sukurti įspėjimą
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Sukelkite įspėjimą sukeldami klaidas:
   ```sh
   # Paprašyti neegzistuojančio produkto
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Patikrinkite, ar įspėjimas suveikė:
   - Azure Portal → Alerts → Alert Rules
   - Patikrinkite savo el. paštą (jei sukonfigūruota)

**Sėkmės kriterijai**: Įspėjimo taisyklė sukurta, suveikia klaidų atveju, gaunami pranešimai.

---

### Pratimas 4: Duomenų bazės schemos pakeitimai (Pažengęs)

**Tikslas**: Pridėkite naują lentelę ir modifikuokite programą, kad ji ją naudotų.

**Žingsniai**:
1. Prisijunkite prie SQL duomenų bazės per Azure Portal Query Editor

2. Sukurkite naują `categories` lentelę:
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

3. Atnaujinkite `src/web/app.py`, kad atsakymai apimtų kategorijų informaciją

4. Įdiekite ir patikrinkite

**Sėkmės kriterijai**: Nauja lentelė egzistuoja, produktai rodo kategorijų informaciją, programa vis dar veikia.

---

### Pratimas 5: Įgyvendinkite talpyklą (Ekspertas)

**Tikslas**: Pridėkite Azure Redis Cache, kad pagerintumėte našumą.

**Žingsniai**:
1. Pridėkite Redis Cache į `infra/main.bicep`
2. Atnaujinkite `src/web/app.py`, kad talpintų produktų užklausas
3. Išmatuokite našumo pagerėjimą su Application Insights
4. Palyginkite atsako laikus prieš/po talpyklos įdiegimo

**Sėkmės kriterijai**: Redis įdiegtas, talpykla veikia, atsako laikai pagerėja >50%.

**Patarimas**: Pradėkite nuo [Azure Cache for Redis dokumentacijos](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Valymas

Kad išvengtumėte nuolatinių išlaidų, ištrinkite visus resursus, kai baigsite:

```sh
azd down
```

**Patvirtinimo užklausa**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Įveskite `y`, kad patvirtintumėte.

**✓ Sėkmės patikrinimas**: 
- Visi resursai ištrinti iš Azure portalo
- Nėra nuolatinių išlaidų
- Vietinį `.azure/<env-name>` aplanką galima ištrinti

**Alternatyva** (palikite infrastruktūrą, ištrinkite duomenis):
```sh
# Ištrinti tik išteklių grupę (palikti AZD konfigūraciją)
az group delete --name rg-<env-name> --yes
```
## Sužinokite daugiau

### Susijusi dokumentacija
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database dokumentacija](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service dokumentacija](https://learn.microsoft.com/azure/app-service/)
- [Application Insights dokumentacija](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep kalbos nuoroda](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Kiti žingsniai šiame kurse
- **[Container Apps pavyzdys](../../../../examples/container-app)**: Diegti mikroservisus su Azure Container Apps
- **[AI integracijos vadovas](../../../../docs/ai-foundry)**: Pridėti AI galimybes savo programai
- **[Diegimo geriausios praktikos](../../docs/deployment/deployment-guide.md)**: Produkcijos diegimo modeliai

### Pažangios temos
- **Valdomas identitetas**: Atsisakykite slaptažodžių ir naudokite Azure AD autentifikaciją
- **Privatūs galiniai taškai**: Užtikrinkite duomenų bazės ryšius virtualiame tinkle
- **CI/CD integracija**: Automatizuokite diegimus su GitHub Actions arba Azure DevOps
- **Daugiaplinkė aplinka**: Sukurkite kūrimo, testavimo ir produkcijos aplinkas
- **Duomenų bazės migracijos**: Naudokite Alembic arba Entity Framework schemos versijavimui

### Palyginimas su kitais metodais

**AZD vs. ARM šablonai**:
- ✅ AZD: Aukštesnio lygio abstrakcija, paprastesnės komandos
- ⚠️ ARM: Daugiau detalių, smulkesnė kontrolė

**AZD vs. Terraform**:
- ✅ AZD: Azure gimtasis, integruotas su Azure paslaugomis
- ⚠️ Terraform: Multi-cloud palaikymas, didesnė ekosistema

**AZD vs. Azure Portal**:
- ✅ AZD: Kartotinas, versijomis valdomas, automatizuojamas
- ⚠️ Portalas: Rankiniai paspaudimai, sunku atkurti

**Galvokite apie AZD kaip**: Docker Compose Azure – supaprastinta konfigūracija sudėtingiems diegimams.

---

## Dažniausiai užduodami klausimai

**K: Ar galiu naudoti kitą programavimo kalbą?**  
A: Taip! Pakeiskite `src/web/` į Node.js, C#, Go ar bet kurią kitą kalbą. Atnaujinkite `azure.yaml` ir Bicep atitinkamai.

**K: Kaip pridėti daugiau duomenų bazių?**  
A: Pridėkite kitą SQL Database modulį `infra/main.bicep` arba naudokite PostgreSQL/MySQL iš Azure Database paslaugų.

**K: Ar galiu naudoti tai produkcijai?**  
A: Tai yra pradinis taškas. Produkcijai pridėkite: valdomą identitetą, privačius galinius taškus, atsargines kopijas, WAF ir išplėstinį stebėjimą.

**K: Ką daryti, jei noriu naudoti konteinerius vietoj kodo diegimo?**  
A: Peržiūrėkite [Container Apps pavyzdį](../../../../examples/container-app), kuris naudoja Docker konteinerius.

**K: Kaip prisijungti prie duomenų bazės iš savo vietinio kompiuterio?**  
A: Pridėkite savo IP į SQL Server ugniasienę:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**K: Ar galiu naudoti esamą duomenų bazę vietoj naujos kūrimo?**  
A: Taip, modifikuokite `infra/main.bicep`, kad nurodytumėte esamą SQL Server ir atnaujinkite prisijungimo parametrus.

---

> **Pastaba:** Šis pavyzdys demonstruoja geriausias praktikas, kaip diegti tinklalapį su duomenų baze naudojant AZD. Jame yra veikiantis kodas, išsami dokumentacija ir praktiniai pratimai, skirti mokymuisi sustiprinti. Produkcijos diegimams peržiūrėkite saugumo, mastelio, atitikties ir išlaidų reikalavimus, specifinius jūsų organizacijai.

**📚 Kurso navigacija:**
- ← Ankstesnis: [Container Apps pavyzdys](../../../../examples/container-app)
- → Kitas: [AI integracijos vadovas](../../../../docs/ai-foundry)
- 🏠 [Kurso pradžia](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Dėl svarbios informacijos rekomenduojama profesionali žmogaus vertimo paslauga. Mes neprisiimame atsakomybės už nesusipratimus ar neteisingus aiškinimus, atsiradusius naudojant šį vertimą.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->