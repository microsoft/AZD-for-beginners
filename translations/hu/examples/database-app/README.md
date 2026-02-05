# Microsoft SQL adatbázis és webalkalmazás telepítése AZD-vel

⏱️ **Becsült idő**: 20-30 perc | 💰 **Becsült költség**: ~15-25 USD/hó | ⭐ **Komplexitás**: Középhaladó

Ez a **teljes, működő példa** bemutatja, hogyan használhatjuk az [Azure Developer CLI-t (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) egy Python Flask webalkalmazás és egy Microsoft SQL adatbázis Azure-ba történő telepítéséhez. Az összes kód mellékelve és tesztelve van – nincs szükség külső függőségekre.

## Amit megtanulsz

Ezen példa elvégzésével:
- Többrétegű alkalmazást telepítesz (webalkalmazás + adatbázis) infrastruktúra-kódként
- Biztonságos adatbázis-kapcsolatokat konfigurálsz anélkül, hogy titkokat kódolnál
- Az alkalmazás állapotát figyeled az Application Insights segítségével
- Hatékonyan kezeled az Azure erőforrásokat az AZD CLI-vel
- Követed az Azure legjobb gyakorlatait a biztonság, költségoptimalizálás és megfigyelhetőség terén

## Forgatókönyv áttekintése
- **Webalkalmazás**: Python Flask REST API adatbázis-kapcsolattal
- **Adatbázis**: Azure SQL adatbázis mintaadatokkal
- **Infrastruktúra**: Bicep segítségével létrehozva (moduláris, újrahasznosítható sablonok)
- **Telepítés**: Teljesen automatizált `azd` parancsokkal
- **Megfigyelés**: Application Insights naplókhoz és telemetriához

## Előfeltételek

### Szükséges eszközök

Mielőtt elkezdenéd, ellenőrizd, hogy ezek az eszközök telepítve vannak:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (2.50.0 vagy újabb verzió)
   ```sh
   az --version
   # Várt kimenet: azure-cli 2.50.0 vagy magasabb
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (1.0.0 vagy újabb verzió)
   ```sh
   azd version
   # Várt kimenet: azd verzió 1.0.0 vagy magasabb
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (helyi fejlesztéshez)
   ```sh
   python --version
   # Várt kimenet: Python 3.8 vagy magasabb
   ```

4. **[Docker](https://www.docker.com/get-started)** (opcionális, helyi konténeres fejlesztéshez)
   ```sh
   docker --version
   # Várt kimenet: Docker verzió 20.10 vagy magasabb
   ```

### Azure követelmények

- Aktív **Azure-előfizetés** ([hozz létre ingyenes fiókot](https://azure.microsoft.com/free/))
- Jogosultság erőforrások létrehozására az előfizetésedben
- **Tulajdonos** vagy **Hozzájáruló** szerepkör az előfizetésen vagy erőforráscsoporton

### Tudás előfeltételek

Ez egy **középhaladó szintű** példa. Ismerned kell:
- Alapvető parancssori műveletek
- Felhő alapfogalmak (erőforrások, erőforráscsoportok)
- Webalkalmazások és adatbázisok alapvető működése

**Új az AZD-ben?** Kezdd a [Kezdő útmutatóval](../../docs/getting-started/azd-basics.md).

## Architektúra

Ez a példa egy két rétegű architektúrát telepít egy webalkalmazással és SQL adatbázissal:

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

**Erőforrások telepítése:**
- **Erőforráscsoport**: Az összes erőforrás tárolója
- **App Service Plan**: Linux-alapú hoszting (B1 szint a költséghatékonyság érdekében)
- **Webalkalmazás**: Python 3.11 futtatókörnyezet Flask alkalmazással
- **SQL Server**: Kezelt adatbázis-szerver TLS 1.2 minimummal
- **SQL adatbázis**: Alapszint (2GB, fejlesztéshez/teszteléshez megfelelő)
- **Application Insights**: Megfigyelés és naplózás
- **Log Analytics Workspace**: Központosított naplótárolás

**Analógia**: Gondolj erre úgy, mint egy étteremre (webalkalmazás) egy hűtőkamrával (adatbázis). A vendégek rendelnek az étlapról (API végpontok), a konyha (Flask alkalmazás) pedig előveszi a hozzávalókat (adatokat) a hűtőből. Az étteremvezető (Application Insights) mindent nyomon követ, ami történik.

## Mappaszerkezet

Minden fájl mellékelve van ebben a példában – nincs szükség külső függőségekre:

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

**Mit csinál minden fájl:**
- **azure.yaml**: Meghatározza, mit és hova telepítsen az AZD
- **infra/main.bicep**: Az összes Azure erőforrás összehangolása
- **infra/resources/*.bicep**: Egyes erőforrás-definíciók (újrahasznosítható modulok)
- **src/web/app.py**: Flask alkalmazás adatbázis logikával
- **requirements.txt**: Python csomagfüggőségek
- **Dockerfile**: Konténerizálási utasítások a telepítéshez

## Gyorsindítás (Lépésről lépésre)

### 1. lépés: Klónozás és navigáció

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Siker ellenőrzése**: Ellenőrizd, hogy látod az `azure.yaml` és `infra/` mappát:
```sh
ls
# Várható: README.md, azure.yaml, infra/, src/
```

### 2. lépés: Hitelesítés az Azure-ban

```sh
azd auth login
```

Ez megnyitja a böngészőt az Azure hitelesítéshez. Jelentkezz be az Azure hitelesítő adataiddal.

**✓ Siker ellenőrzése**: Ezt kell látnod:
```
Logged in to Azure.
```

### 3. lépés: Környezet inicializálása

```sh
azd init
```

**Mi történik**: Az AZD létrehoz egy helyi konfigurációt a telepítéshez.

**Megjelenő kérdések**:
- **Környezet neve**: Adj meg egy rövid nevet (pl. `dev`, `myapp`)
- **Azure előfizetés**: Válaszd ki az előfizetésed a listából
- **Azure helyszín**: Válassz egy régiót (pl. `eastus`, `westeurope`)

**✓ Siker ellenőrzése**: Ezt kell látnod:
```
SUCCESS: New project initialized!
```

### 4. lépés: Azure erőforrások létrehozása

```sh
azd provision
```

**Mi történik**: Az AZD telepíti az összes infrastruktúrát (5-8 perc):
1. Erőforráscsoport létrehozása
2. SQL Server és adatbázis létrehozása
3. App Service Plan létrehozása
4. Webalkalmazás létrehozása
5. Application Insights létrehozása
6. Hálózat és biztonság konfigurálása

**Meg kell adnod**:
- **SQL admin felhasználónév**: Adj meg egy felhasználónevet (pl. `sqladmin`)
- **SQL admin jelszó**: Adj meg egy erős jelszót (jegyezd fel!)

**✓ Siker ellenőrzése**: Ezt kell látnod:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Idő**: 5-8 perc

### 5. lépés: Az alkalmazás telepítése

```sh
azd deploy
```

**Mi történik**: Az AZD felépíti és telepíti a Flask alkalmazást:
1. Csomagolja a Python alkalmazást
2. Felépíti a Docker konténert
3. Feltölti az Azure Web App-ba
4. Inicializálja az adatbázist mintaadatokkal
5. Elindítja az alkalmazást

**✓ Siker ellenőrzése**: Ezt kell látnod:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Idő**: 3-5 perc

### 6. lépés: Az alkalmazás megnyitása

```sh
azd browse
```

Ez megnyitja a telepített webalkalmazást a böngészőben a `https://app-<egyedi-azonosító>.azurewebsites.net` címen.

**✓ Siker ellenőrzése**: JSON kimenetet kell látnod:
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

### 7. lépés: API végpontok tesztelése

**Egészségügyi ellenőrzés** (adatbázis-kapcsolat ellenőrzése):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Várt válasz**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**Termékek listázása** (mintaadatok):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Várt válasz**:
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

**Egyetlen termék lekérése**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Siker ellenőrzése**: Minden végpont JSON adatokat ad vissza hibák nélkül.

---

**🎉 Gratulálunk!** Sikeresen telepítettél egy webalkalmazást adatbázissal az Azure-ba az AZD segítségével.
- Magas válaszidők (>2 másodperc)

**Példa riasztás létrehozása**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Hibakeresés

### Gyakori problémák és megoldások

#### 1. `azd provision` sikertelen "Location not available" hibaüzenettel

**Tünet**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Megoldás**:
Válasszon másik Azure régiót, vagy regisztrálja az erőforrás-szolgáltatót:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. SQL kapcsolat sikertelen a telepítés során

**Tünet**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Megoldás**:
- Ellenőrizze, hogy az SQL Server tűzfala engedélyezi-e az Azure szolgáltatásokat (automatikusan konfigurálva)
- Győződjön meg arról, hogy az SQL admin jelszót helyesen adta meg az `azd provision` során
- Biztosítsa, hogy az SQL Server teljesen telepítve van (ez 2-3 percet is igénybe vehet)

**Kapcsolat ellenőrzése**:
```sh
# Az Azure Portálon lépjen a SQL Database → Query editor részhez
# Próbáljon meg csatlakozni a hitelesítő adataival
```

#### 3. A webalkalmazás "Application Error" üzenetet jelenít meg

**Tünet**:
A böngésző általános hibaoldalt mutat.

**Megoldás**:
Ellenőrizze az alkalmazás naplóit:
```sh
# Tekintse meg a legutóbbi naplókat
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Gyakori okok**:
- Hiányzó környezeti változók (ellenőrizze az App Service → Konfigurációt)
- Python csomag telepítési hiba (ellenőrizze a telepítési naplókat)
- Adatbázis inicializálási hiba (ellenőrizze az SQL kapcsolatot)

#### 4. `azd deploy` sikertelen "Build Error" hibaüzenettel

**Tünet**:
```
Error: Failed to build project
```

**Megoldás**:
- Győződjön meg arról, hogy a `requirements.txt` fájlban nincs szintaktikai hiba
- Ellenőrizze, hogy a Python 3.11 meg van-e adva az `infra/resources/web-app.bicep` fájlban
- Ellenőrizze, hogy a Dockerfile helyes alapképet használ

**Helyi hibakeresés**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Unauthorized" hiba az AZD parancsok futtatásakor

**Tünet**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Megoldás**:
Hitelesítse újra magát az Azure-ban:
```sh
azd auth login
az login
```

Ellenőrizze, hogy rendelkezik-e megfelelő jogosultságokkal (Contributor szerepkör) az előfizetésen.

#### 6. Magas adatbázis költségek

**Tünet**:
Váratlan Azure számla.

**Megoldás**:
- Ellenőrizze, hogy nem felejtette-e el futtatni az `azd down` parancsot tesztelés után
- Győződjön meg arról, hogy az SQL adatbázis Basic szintet használ (nem Premium)
- Tekintse át a költségeket az Azure Cost Management-ben
- Állítson be költségriasztásokat

### Segítség kérése

**AZD környezeti változók megtekintése**:
```sh
azd env get-values
```

**Telepítési állapot ellenőrzése**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Alkalmazás naplók elérése**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**További segítségre van szüksége?**
- [AZD Hibakeresési Útmutató](../../docs/troubleshooting/common-issues.md)
- [Azure App Service Hibakeresés](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL Hibakeresés](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Gyakorlati feladatok

### Feladat 1: Telepítés ellenőrzése (Kezdő)

**Cél**: Győződjön meg arról, hogy minden erőforrás telepítve van, és az alkalmazás működik.

**Lépések**:
1. Listázza az összes erőforrást az erőforráscsoportban:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Várható eredmény**: 6-7 erőforrás (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Tesztelje az összes API végpontot:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Várható eredmény**: Mindegyik érvényes JSON-t ad vissza hiba nélkül

3. Ellenőrizze az Application Insights-t:
   - Nyissa meg az Application Insights-t az Azure Portálon
   - Menjen a "Live Metrics" részhez
   - Frissítse a böngészőt a webalkalmazásban
   **Várható eredmény**: Valós idejű kérések megjelenítése

**Siker kritériumok**: Mind a 6-7 erőforrás létezik, minden végpont adatot ad vissza, a Live Metrics aktivitást mutat.

---

### Feladat 2: Új API végpont hozzáadása (Középhaladó)

**Cél**: Bővítse a Flask alkalmazást egy új végponttal.

**Kezdő kód**: Jelenlegi végpontok a `src/web/app.py` fájlban

**Lépések**:
1. Szerkessze a `src/web/app.py` fájlt, és adjon hozzá egy új végpontot a `get_product()` függvény után:
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

2. Telepítse a frissített alkalmazást:
   ```sh
   azd deploy
   ```

3. Tesztelje az új végpontot:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Várható eredmény**: Laptopokra vonatkozó termékeket ad vissza

**Siker kritériumok**: Az új végpont működik, szűrt eredményeket ad vissza, megjelenik az Application Insights naplókban.

---

### Feladat 3: Monitoring és riasztások hozzáadása (Haladó)

**Cél**: Állítson be proaktív monitoringot riasztásokkal.

**Lépések**:
1. Hozzon létre riasztást HTTP 500 hibákra:
   ```sh
   # Szerezze be az Application Insights erőforrásazonosítóját
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Riasztás létrehozása
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Indítsa el a riasztást hibák okozásával:
   ```sh
   # Kérjen egy nem létező terméket
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Ellenőrizze, hogy a riasztás működött-e:
   - Azure Portál → Alerts → Alert Rules
   - Ellenőrizze az e-mailt (ha konfigurálva van)

**Siker kritériumok**: A riasztási szabály létrejött, hibákra aktiválódik, értesítések érkeznek.

---

### Feladat 4: Adatbázis séma módosítása (Haladó)

**Cél**: Hozzon létre egy új táblát, és módosítsa az alkalmazást annak használatára.

**Lépések**:
1. Csatlakozzon az SQL adatbázishoz az Azure Portál Query Editor segítségével

2. Hozzon létre egy új `categories` táblát:
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

3. Frissítse a `src/web/app.py` fájlt, hogy a válaszok tartalmazzák a kategória információkat

4. Telepítse és tesztelje

**Siker kritériumok**: Az új tábla létezik, a termékek kategória információt mutatnak, az alkalmazás továbbra is működik.

---

### Feladat 5: Gyorsítótárazás megvalósítása (Szakértő)

**Cél**: Adjon hozzá Azure Redis Cache-t a teljesítmény javítása érdekében.

**Lépések**:
1. Adja hozzá a Redis Cache-t az `infra/main.bicep` fájlhoz
2. Frissítse a `src/web/app.py` fájlt, hogy gyorsítótárazza a terméklekérdezéseket
3. Mérje a teljesítmény javulását az Application Insights segítségével
4. Hasonlítsa össze a válaszidőket a gyorsítótárazás előtt és után

**Siker kritériumok**: A Redis telepítve van, a gyorsítótárazás működik, a válaszidők >50%-kal javulnak.

**Tipp**: Kezdje az [Azure Cache for Redis dokumentációval](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Takarítás

A folyamatos költségek elkerülése érdekében törölje az összes erőforrást, amikor végzett:

```sh
azd down
```

**Megerősítő kérdés**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Írja be, hogy `y` a megerősítéshez.

**✓ Siker ellenőrzés**: 
- Az összes erőforrás törölve az Azure Portálról
- Nincsenek folyamatos költségek
- A helyi `.azure/<env-name>` mappa törölhető

**Alternatíva** (infrastruktúra megtartása, adatok törlése):
```sh
# Csak az erőforráscsoportot törölje (tartsa meg az AZD konfigurációt)
az group delete --name rg-<env-name> --yes
```
## További információ

### Kapcsolódó dokumentáció
- [Azure Developer CLI Dokumentáció](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database Dokumentáció](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service Dokumentáció](https://learn.microsoft.com/azure/app-service/)
- [Application Insights Dokumentáció](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep Nyelvi Referencia](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Következő lépések ebben a kurzusban
- **[Container Apps Példa](../../../../examples/container-app)**: Mikroszolgáltatások telepítése Azure Container Apps segítségével
- **[AI Integrációs Útmutató](../../../../docs/ai-foundry)**: AI képességek hozzáadása az alkalmazáshoz
- **[Telepítési Legjobb Gyakorlatok](../../docs/deployment/deployment-guide.md)**: Termelési telepítési minták

### Haladó témák
- **Managed Identity**: Jelszavak eltávolítása és Azure AD hitelesítés használata
- **Privát végpontok**: Adatbázis kapcsolatok biztonságossá tétele virtuális hálózaton belül
- **CI/CD Integráció**: Telepítések automatizálása GitHub Actions vagy Azure DevOps segítségével
- **Több környezet**: Fejlesztési, tesztelési és termelési környezetek beállítása
- **Adatbázis migrációk**: Alembic vagy Entity Framework használata séma verziókezeléshez

### Összehasonlítás más megközelítésekkel

**AZD vs. ARM Templates**:
- ✅ AZD: Magasabb szintű absztrakció, egyszerűbb parancsok
- ⚠️ ARM: Részletesebb, finomhangolható

**AZD vs. Terraform**:
- ✅ AZD: Azure-natív, integrált Azure szolgáltatásokkal
- ⚠️ Terraform: Többfelhős támogatás, nagyobb ökoszisztéma

**AZD vs. Azure Portál**:
- ✅ AZD: Ismételhető, verziókövetett, automatizálható
- ⚠️ Portál: Manuális kattintások, nehéz reprodukálni

**Gondoljon az AZD-re úgy, mint**: Docker Compose az Azure-hoz—egyszerűsített konfiguráció összetett telepítésekhez.

---

## Gyakran Ismételt Kérdések

**K: Használhatok más programozási nyelvet?**  
V: Igen! Cserélje le a `src/web/` mappát Node.js, C#, Go vagy bármely más nyelvre. Frissítse az `azure.yaml` és Bicep fájlokat ennek megfelelően.

**K: Hogyan adhatok hozzá több adatbázist?**  
V: Adjon hozzá egy másik SQL Database modult az `infra/main.bicep` fájlban, vagy használja az Azure Database szolgáltatások PostgreSQL/MySQL adatbázisait.

**K: Használhatom ezt termelésben?**  
V: Ez egy kiindulópont. Termeléshez adjon hozzá: managed identity, privát végpontok, redundancia, biztonsági mentési stratégia, WAF és fejlett monitoring.

**K: Mi van, ha konténereket szeretnék használni kódtelepítés helyett?**  
V: Nézze meg a [Container Apps Példát](../../../../examples/container-app), amely végig Docker konténereket használ.

**K: Hogyan csatlakozhatok az adatbázishoz a helyi gépemről?**  
V: Adja hozzá az IP-címét az SQL Server tűzfalához:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**K: Használhatok meglévő adatbázist új létrehozása helyett?**  
V: Igen, módosítsa az `infra/main.bicep` fájlt, hogy hivatkozzon egy meglévő SQL Serverre, és frissítse a kapcsolat karakterlánc paramétereit.

---

> **Megjegyzés:** Ez a példa a legjobb gyakorlatokat mutatja be egy webalkalmazás adatbázissal történő telepítéséhez az AZD segítségével. Tartalmaz működő kódot, átfogó dokumentációt és gyakorlati feladatokat a tanulás megerősítésére. Termelési telepítésekhez vizsgálja meg a biztonsági, skálázási, megfelelőségi és költségigényeket, amelyek az Ön szervezetére vonatkoznak.

**📚 Kurzus navigáció:**
- ← Előző: [Container Apps Példa](../../../../examples/container-app)
- → Következő: [AI Integrációs Útmutató](../../../../docs/ai-foundry)
- 🏠 [Kurzus Főoldal](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősség kizárása**:  
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordítási szolgáltatás segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Fontos információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->