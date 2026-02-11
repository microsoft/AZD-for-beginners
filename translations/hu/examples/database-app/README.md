# Microsoft SQL adatbázis és webalkalmazás telepítése az AZD használatával

⏱️ **Becsült idő**: 20–30 perc | 💰 **Becsült költség**: kb. 15–25 USD/hó | ⭐ **Összetettség**: Középhaladó

Ez a **teljes, működő példa** bemutatja, hogyan lehet a [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) segítségével egy Python Flask webalkalmazást Microsoft SQL adatbázissal együtt Azure-ba telepíteni. Az összes kód benne van és tesztelt—nem szükséges külső függőség.

## Amit megtanulsz

A példa elvégzésével lehetőséged nyílik:
- Többrétegű alkalmazás (webalkalmazás + adatbázis) telepítésére infrastruktúraként kóddal
- Biztonságos adatbázis-kapcsolatok konfigurálására titkosítás nélkül
- Az alkalmazás állapotának monitorozására Application Insights segítségével
- Hatékony Azure erőforrás-menedzsmentre az AZD CLI-vel
- Az Azure legjobb gyakorlatait követni biztonság, költséghatékonyság és megfigyelhetőség terén

## Forgatókönyv áttekintése
- **Webalkalmazás**: Python Flask REST API adatbázis-kapcsolattal
- **Adatbázis**: Azure SQL adatbázis mintával
- **Infrastruktúra**: Bicep használatával (moduláris, újrahasználható sablonok)
- **Telepítés**: Teljesen automatizált `azd` parancsokkal
- **Monitorozás**: Application Insights naplózásra és telemetriára

## Előfeltételek

### Szükséges eszközök

Kezdés előtt ellenőrizd, hogy a következő eszközök telepítve vannak:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (2.50.0 vagy újabb verzió)
   ```sh
   az --version
   # Várt kimenet: azure-cli 2.50.0 vagy magasabb
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (1.0.0 vagy újabb verzió)
   ```sh
   azd version
   # Várt kimenet: azd verzió 1.0.0 vagy újabb
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (helyi fejlesztéshez)
   ```sh
   python --version
   # Várt kimenet: Python 3.8 vagy újabb
   ```

4. **[Docker](https://www.docker.com/get-started)** (opcionális, konténer alapú helyi fejlesztéshez)
   ```sh
   docker --version
   # Várt kimenet: Docker verzió 20.10 vagy magasabb
   ```

### Azure követelmények

- Aktív **Azure előfizetés** ([ingyenes fiók létrehozása](https://azure.microsoft.com/free/))
- Engedélyek az erőforrások létrehozására az előfizetésedben
- **Tulajdonos** vagy **Közreműködő** szerepkör az előfizetésen vagy erőforráscsoporton belül

### Tudás előfeltételek

Ez egy **középhaladó szintű** példa. Ismerned kell:
- Parancssori alapműveleteket
- Alapvető felhő fogalmakat (erőforrások, erőforráscsoportok)
- Alapvető webalkalmazás és adatbázis ismereteket

**Új vagy az AZD-ben?** Kezdd az [Első lépések útmutatóval](../../docs/chapter-01-foundation/azd-basics.md).

## Architektúra

Ez a példa kétrétegű architektúrát telepít webalkalmazással és SQL adatbázissal:

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

**Erőforrás telepítés:**
- **Erőforráscsoport**: Minden erőforrás konténere
- **App Service Plan**: Linux-alapú hosztolás (B1 szint a költséghatékonyságért)
- **Webalkalmazás**: Python 3.11 futtatókörnyezet Flask appal
- **SQL szerver**: Kezelt adatbázis-szerver minimális TLS 1.2-vel
- **SQL adatbázis**: Alap szint (2 GB, fejlesztéshez/teszteléshez megfelelő)
- **Application Insights**: Monitorozás és naplózás
- **Log Analytics munkaterület**: Központosított napló tárolás

**Hasonlat**: Képzeld el egy éttermet (webapp) egy járóképes mélyhűtővel (adatbázis). A vendégek a menüből rendelnek (API végpontok), a konyha (Flask app) kiveszi az alapanyagokat (adatokat) a mélyhűtőből. Az étterem vezetője (Application Insights) mindent nyomon követ.

## Mappaszerkezet

Minden fájl benne van a példában — nincs szükség külső függőségekre:

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
- **azure.yaml**: Megmondja az AZD-nek mit és hova telepítsen
- **infra/main.bicep**: Összehangolja az összes Azure erőforrást
- **infra/resources/*.bicep**: Egyedi erőforrás definíciók (moduláris, újrahasználható)
- **src/web/app.py**: Flask alkalmazás adatbázis logikával
- **requirements.txt**: Python csomagfüggőségek
- **Dockerfile**: Konténerizációs utasítások telepítéshez

## Gyorsindító (lépésről lépésre)

### 1. lépés: Klónozás és navigáció

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Siker ellenőrzése**: Győződj meg róla, hogy látod az `azure.yaml` fájlt és az `infra/` mappát:
```sh
ls
# Várt: README.md, azure.yaml, infra/, src/
```

### 2. lépés: Azure azonosítás

```sh
azd auth login
```

Ez megnyitja a böngészőt az Azure azonosításhoz. Jelentkezz be Azure hitelesítő adataiddal.

**✓ Siker ellenőrzése**: A következőt kell látnod:
```
Logged in to Azure.
```

### 3. lépés: Környezet inicializálása

```sh
azd init
```

**Mi történik**: Az AZD létrehozza a helyi konfigurációdat a telepítéshez.

**Kérdések amiket kapsz**:
- **Környezet neve**: Add meg a rövid nevet (pl. `dev`, `myapp`)
- **Azure előfizetés**: Válaszd ki az előfizetésed a listából
- **Azure helyszín**: Válassz régiót (pl. `eastus`, `westeurope`)

**✓ Siker ellenőrzése**: Látni fogod:
```
SUCCESS: New project initialized!
```

### 4. lépés: Azure erőforrások biztosítása

```sh
azd provision
```

**Mi történik**: AZD telepíti az infrastruktúrát (5–8 percet vesz igénybe):
1. Erőforráscsoport létrehozása
2. SQL szerver és adatbázis létrehozása
3. App Service Plan létrehozása
4. Webalkalmazás létrehozása
5. Application Insights létrehozása
6. Hálózat és biztonság konfigurálása

**A következőkre kérdez rá**:
- **SQL admin felhasználónév**: Adj meg egy felhasználónevet (pl. `sqladmin`)
- **SQL admin jelszó**: Adj meg egy erős jelszót (mentsd el!)

**✓ Siker ellenőrzése**: Látni fogod:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Idő**: 5–8 perc

### 5. lépés: Alkalmazás telepítése

```sh
azd deploy
```

**Mi történik**: AZD felépíti és telepíti a Flask alkalmazásodat:
1. A Python alkalmazás csomagolása
2. Docker konténer készítése
3. Feltöltés az Azure Web App-ra
4. Az adatbázis inicializálása minta adatokkal
5. Az alkalmazás elindítása

**✓ Siker ellenőrzése**: Látni fogod:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Idő**: 3–5 perc

### 6. lépés: Alkalmazás böngészése

```sh
azd browse
```

Ez megnyitja a telepített webalkalmazásodat a böngészőben a `https://app-<unique-id>.azurewebsites.net` címen

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

**Termékek listázása** (minta adatokkal):
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

**Egy termék lekérése**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Siker ellenőrzése**: Minden végpont JSON adatot ad hiba nélkül.

---

**🎉 Gratulálunk!** Sikeresen telepítettél egy webalkalmazást adatbázissal Azure-ra AZD-vel.

## Konfiguráció részletek

### Környezeti változók

A titkokat biztonságosan Azure App Service konfiguráción keresztül kezeljük—**soha ne keménykódolj titkokat a forráskódban**.

**AZD automatikusan konfigurálja:**
- `SQL_CONNECTION_STRING`: Titkosított adatbázis-kapcsolat
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Monitorozási telemetria végpont
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Automatikus függőség telepítés engedélyezése

**Hol vannak tárolva a titkok**:
1. A `azd provision` parancs alatt a SQL hitelesítő adatokat biztonságos prompton keresztül adod meg
2. AZD tárolja ezeket a helyi `.azure/<env-name>/.env` fájlban (ez git-ignored)
3. AZD betölti ezeket az Azure App Service konfigurációba (titkosítva tárolva)
4. Az alkalmazás ezeket futás közben `os.getenv()` segítségével olvassa be

### Helyi fejlesztés

Helyi teszteléshez készíts `.env` fájlt a mintából:

```sh
cp .env.sample .env
# Szerkeszd a .env fájlt a helyi adatbázis-kapcsolatoddal
```

**Helyi fejlesztési munkafolyamat**:
```sh
# Függőségek telepítése
cd src/web
pip install -r requirements.txt

# Környezeti változók beállítása
export SQL_CONNECTION_STRING="your-local-connection-string"

# Az alkalmazás futtatása
python app.py
```

**Tesztelés helyben**:
```sh
curl http://localhost:8000/health
# Várt eredmény: {"status": "healthy", "database": "connected"}
```

### Infrastruktúra kódként

Az összes Azure erőforrás **Bicep sablonokban** van definiálva (`infra/` mappa):

- **Moduláris felépítés**: Minden erőforrás típusnak külön fájl újrahasználhatóság céljából
- **Paraméterezhető**: SKU-k, régiók, névkonvenciók testreszabása
- **Legjobb gyakorlatok**: Azure elnevezési standardokat és biztonsági alapbeállításokat követ
- **Verziókövetett**: Az infrastruktúra változások Git-ben követhetők

**Testreszabási példa**:
Az adatbázis szintjének módosításához szerkeszd az `infra/resources/sql-database.bicep` fájlt:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Biztonsági legjobb gyakorlatok

Ez a példa az Azure biztonsági legjobb gyakorlatait követi:

### 1. **Nincsenek titkok a forráskódban**
- ✅ Hitelesítő adatok Azure App Service konfigurációban vannak tárolva (titkosítva)
- ✅ `.env` fájlok kizárva a Git-ből `.gitignore` segítségével
- ✅ Titkok biztonságos paramétereken keresztül adva provisioning alatt

### 2. **Titkosított kapcsolatok**
- ✅ SQL szerver legalább TLS 1.2-vel
- ✅ HTTPS csak engedélyezve a Web App-on
- ✅ Adatbázis kapcsolatok titkosított csatornán

### 3. **Hálózat biztonság**
- ✅ SQL szerver tűzfala csak Azure szolgáltatások engedélyezésével
- ✅ Nyilvános hálózati hozzáférés korlátozott (Private Endpointtel tovább korlátozható)
- ✅ FTPS letiltva a Web App-on

### 4. **Hitelesítés és engedélyezés**
- ⚠️ **Jelenleg**: SQL hitelesítés (felhasználónév/jelszó)
- ✅ **Éles környezet ajánlás**: Használj Azure Managed Identity-t jelszó nélküli hitelesítéshez

**Managed Identity-re váltás éles környezetben**:
1. Engedélyezd a managed identity-t a Web App-on
2. Adj engedélyeket az identitásnak az SQL-hez
3. Frissítsd a kapcsolatot managed identity használatára
4. Távolítsd el a jelszavas hitelesítést

### 5. **Auditálás és megfelelőség**
- ✅ Application Insights naplózza az összes kérést és hibát
- ✅ SQL adatbázis auditálás engedélyezve (megfelelőség beállítható)
- ✅ Minden erőforráson tag-ek a governance miatt

**Biztonsági ellenőrző lista élesítés előtt**:
- [ ] Engedélyezd az Azure Defender az SQL-hez
- [ ] Konfiguráld a Private Endpointeket az SQL adatbázishoz
- [ ] Engedélyezd a Web Application Firewall-t (WAF)
- [ ] Használj Azure Key Vaultot titkok forgatásához
- [ ] Állítsd be az Azure AD hitelesítést
- [ ] Engedélyezd a diagnosztikai naplózást minden erőforráshoz

## Költség optimalizálás

**Becsült havi költségek** (2025. novemberi állapot):

| Erőforrás | SKU/Szint | Becsült költség |
|----------|----------|----------------|
| App Service Plan | B1 (Alap) | kb. 13 USD/hó |
| SQL adatbázis | Alap (2GB) | kb. 5 USD/hó |
| Application Insights | Fizess amennyit használsz | kb. 2 USD/hó (kevés forgalom) |
| **Összesen** | | **~20 USD/hó** |

**💡 Költségmegtakarítási tippek**:

1. **Használj ingyenes szintet tanuláshoz**:
   - App Service: F1 szint (ingyenes, korlátozott óraszám)
   - SQL adatbázis: Azure SQL Serverless mód
   - Application Insights: 5 GB/hó ingyenes adatfogadás

2. **Állítsd le az erőforrásokat ha nem használod**:
   ```sh
   # Állítsa le a webalkalmazást (az adatbázis továbbra is díjat számít fel)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Indítsa újra szükség esetén
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Törölj minden erőforrást teszt után**:
   ```sh
   azd down
   ```
   Ez eltávolít minden erőforrást és megszünteti a költségeket.

4. **Fejlesztési és éles környezet SKU-k**:
   - **Fejlesztési környezet**: Alap szint (ahogy ebben a példában)
   - **Éles környezet**: Standard/Premium szint redundanciával

**Költségfigyelés**:
- Költségeket nézd meg az [Azure Cost Management-ben](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Állíts be riasztásokat a váratlan költségek elkerülésére
- Minden erőforrást címkézz `azd-env-name` címkével a követéshez

**Ingyenes szint alternatíva**:
Tanuláshoz szerkeszd az `infra/resources/app-service-plan.bicep` fájlt:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Megjegyzés**: Az ingyenes szint korlátozott (60 perc CPU/nap, nincs always-on).

## Monitorozás és megfigyelhetőség

### Application Insights integráció

Ez a példa tartalmazza az **Application Insights**-t átfogó monitorozáshoz:

**Mi kerül monitorozásra**:
- ✅ HTTP kérések (késleltetés, státuszkódok, végpontok)
- ✅ Alkalmazási hibák és kivételek
- ✅ Egyedi naplózás Flask alkalmazásból
- ✅ Adatbázis kapcsolat állapota
- ✅ Teljesítmény-mutatók (CPU, memória)

**Application Insights elérése**:
1. Nyisd meg az [Azure Portált](https://portal.azure.com)
2. Navigálj az erőforráscsoportodhoz (`rg-<env-name>`)
3. Kattints az Application Insights erőforrásra (`appi-<unique-id>`)

**Hasznos lekérdezések** (Application Insights → Logs):

**Összes kérés megtekintése**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Hibák keresése**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Egészségügyi végpont ellenőrzése**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### SQL adatbázis auditálás

**SQL adatbázis auditálás engedélyezve van**, hogy kövesse:
- Adatbázis-hozzáférések mintázatait
- Sikertelen bejelentkezési kísérleteket
- Sémaváltozásokat
- Adathozzáférést (megfelelőség céljából)

**Audit naplók elérése**:
1. Azure Portal → SQL adatbázis → Auditálás
2. Naplók megtekintése a Log Analytics munkaterületen

### Valós idejű monitorozás

**Élő mérőszámok megtekintése**:
1. Application Insights → Live Metrics
2. Nézd meg a kéréseket, hibákat és teljesítményt valós időben

**Riasztások beállítása**:
Hozz létre riasztásokat kritikus eseményekre:
- HTTP 500 hibák > 5 az 5 perc alatt
- Adatbázis-kapcsolati hibák
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

#### 1. `azd provision` hiba "Location not available" üzenettel

**Tünet**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Megoldás**:
Válasszon egy másik Azure régiót vagy regisztrálja az erőforrás szolgáltatót:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. SQL Kapcsolódási hiba telepítés közben

**Tünet**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Megoldás**:
- Ellenőrizze, hogy az SQL Server tűzfala engedélyezi az Azure szolgáltatásokat (automatikusan beállítva)
- Ellenőrizze, hogy az SQL admin jelszót helyesen adta meg az `azd provision` futtatásakor
- Győződjön meg róla, hogy az SQL Server teljesen elő lett készítve (2-3 percet is igénybe vehet)

**Kapcsolat ellenőrzése**:
```sh
# Az Azure Portálon navigáljon az SQL adatbázishoz → Lekérdező szerkesztő
# Próbáljon meg a hitelesítő adataival csatlakozni
```

#### 3. Webalkalmazás „Application Error” üzenetet mutat

**Tünet**:
A böngésző általános hibás oldalt jelenít meg.

**Megoldás**:
Nézze meg az alkalmazás naplóit:
```sh
# Legutóbbi naplók megtekintése
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Gyakori okok**:
- Hiányzó környezeti változók (ellenőrizze az App Service → Konfigurációt)
- Python csomag telepítés sikertelen (ellenőrizze a telepítési naplókat)
- Adatbázis inicializálási hiba (ellenőrizze az SQL kapcsolódást)

#### 4. `azd deploy` hiba „Build Error” üzenettel

**Tünet**:
```
Error: Failed to build project
```

**Megoldás**:
- Győződjön meg róla, hogy a `requirements.txt` nem tartalmaz szintaktikai hibákat
- Ellenőrizze, hogy a Python 3.11 szerepel a `infra/resources/web-app.bicep` fájlban
- Ellenőrizze, hogy a Dockerfile helyes alapképet használ

**Hibakeresés helyben**:
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
Jelentkezzen be újra az Azure-ba:
```sh
azd auth login
az login
```

Ellenőrizze, hogy megvan a megfelelő jogosultsága (Közreműködő szerepkör) az előfizetésen.

#### 6. Magas adatbázis költségek

**Tünet**:
Váratlan Azure számla.

**Megoldás**:
- Ellenőrizze, hogy nem felejtette el futtatni az `azd down` parancsot tesztelés után
- Győződjön meg arról, hogy az SQL adatbázis Basic szintű, nem Premium
- Tekintse át a költségeket az Azure Cost Managementben
- Állítson be költség-riasztásokat

### Segítségkérés

**Az összes AZD környezeti változó megtekintése**:
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
- [AZD Hibakeresési Útmutató](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Azure App Service hibakeresés](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL hibakeresés](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Gyakorlati feladatok

### Feladat 1: Ellenőrizze a telepítését (Kezdő)

**Cél**: Ellenőrizze, hogy minden erőforrás telepítve van-e és az alkalmazás működik.

**Lépések**:
1. Listázza az összes erőforrást az erőforráscsoportban:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Elvárt**: 6-7 erőforrás (Web App, SQL Server, SQL adatbázis, App Service Plan, Application Insights, Log Analytics)

2. Tesztelje az összes API végpontot:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Elvárt**: Mindegyik érvényes JSON-t ad vissza hiba nélkül

3. Ellenőrizze az Application Insights szolgáltatást:
   - Navigáljon az Application Insights-hoz az Azure Portálon
   - Menjen a "Live Metrics" részhez
   - Frissítse a böngészőt a webalkalmazásnál
   **Elvárt**: Azonnal látható kérelmek jelennek meg

**Siker kritériumok**: Minden 6-7 erőforrás létezik, az összes végpont adatot szolgáltat, a Live Metrics mutat aktivitást.

---

### Feladat 2: Új API végpont hozzáadása (Középhaladó)

**Cél**: Bővítse a Flask alkalmazást egy új végponttal.

**Kezdőkód**: Jelenlegi végpontok a `src/web/app.py` fájlban

**Lépések**:
1. Szerkessze a `src/web/app.py` fájlt és adjon hozzá egy új végpontot a `get_product()` függvény után:
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

2. Telepítse az frissített alkalmazást:
   ```sh
   azd deploy
   ```

3. Tesztelje az új végpontot:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Elvárt**: Visszaadja a „laptop” egyező termékeket

**Siker kritériumok**: Az új végpont működik, szűrt eredményt ad, megjelenik az Application Insights naplóiban.

---

### Feladat 3: Monitorozás és riasztások hozzáadása (Haladó)

**Cél**: Állítson be proaktív monitorozást riasztásokkal.

**Lépések**:
1. Hozzon létre riasztást HTTP 500-as hibákra:
   ```sh
   # Application Insights erőforrásazonosító lekérése
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

2. Váltson ki hibákat a riasztás teszteléséhez:
   ```sh
   # Nem létező termék lekérése
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Ellenőrizze, hogy a riasztás aktiválódott-e:
   - Azure Portál → Alerts → Alert Rules
   - Ellenőrizze az e-mail értesítéseket (ha be van állítva)

**Siker kritériumok**: Riasztási szabály létrejött, hibák esetén aktiválódik, értesítések megérkeznek.

---

### Feladat 4: Adatbázis séma változások (Haladó)

**Cél**: Adjon hozzá új táblát, és módosítsa az alkalmazást, hogy használja azt.

**Lépések**:
1. Csatlakozzon az SQL adatbázishoz az Azure Portál Query Editorán keresztül

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

3. Frissítse a `src/web/app.py` fájlt, hogy a válaszok tartalmazzák a kategória információt

4. Telepítse a módosításokat és tesztelje

**Siker kritériumok**: Az új tábla létezik, a termékek kategóriainformációval jelennek meg, az alkalmazás működik.

---

### Feladat 5: Gyorsítótárazás megvalósítása (Szakértő)

**Cél**: Adjon hozzá Azure Redis Cache-t a teljesítmény javításához.

**Lépések**:
1. Adja hozzá a Redis Cache-t az `infra/main.bicep` fájlhoz
2. Frissítse a `src/web/app.py`-t a termék lekérdezések gyorsítótárazásához
3. Mérje a teljesítményjavulást az Application Insights segítségével
4. Hasonlítsa össze a válaszidőket gyorsítótárazás előtt és után

**Siker kritériumok**: A Redis telepítve, gyorsítótárazás működik, válaszidők több mint 50%-kal javulnak.

**Tipp**: Kezdje az [Azure Cache for Redis dokumentációval](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Takarítás

A folyamatos díjak elkerülése érdekében törölje az összes erőforrást a munka befejezése után:

```sh
azd down
```

**Megerősítő kérdés**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Írja be az `y` betűt a megerősítéshez.

**✓ Siker ellenőrzés**: 
- Minden erőforrás törölve az Azure Portálból
- Nincsenek folyamatban lévő költségek
- A helyi `.azure/<env-name>` mappa törölhető

**Alternatíva** (infrastruktúra megtartása, adat törlése):
```sh
# Csak az erőforráscsoport törlése (AZD konfiguráció megtartása)
az group delete --name rg-<env-name> --yes
```
## További információk

### Kapcsolódó dokumentáció
- [Azure Developer CLI dokumentáció](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL adatbázis dokumentáció](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service dokumentáció](https://learn.microsoft.com/azure/app-service/)
- [Application Insights dokumentáció](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep nyelv referenciája](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### További lépések ebben a tanfolyamban
- **[Container Apps példa](../../../../examples/container-app)**: Mikroszolgáltatások telepítése Azure Container Apps segítségével
- **[AI Integrációs útmutató](../../../../docs/ai-foundry)**: AI képességek hozzáadása az alkalmazáshoz
- **[Telepítési bevált gyakorlatok](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Gyártási telepítési minták

### Haladó témák
- **Managed Identity**: Jelszavak eltávolítása és Azure AD hitelesítés használata
- **Private Endpoints**: Biztonságos adatbázis kapcsolatok virtuális hálózaton belül
- **CI/CD integráció**: Telepítések automatizálása GitHub Actions-sel vagy Azure DevOps-szal
- **Több környezet**: Fejlesztői, teszt, és gyártási környezetek kialakítása
- **Adatbázis migrációk**: Alembic vagy Entity Framework használata séma verziókezeléshez

### Összehasonlítás más megközelítésekkel

**AZD vs. ARM sablonok**:
- ✅ AZD: Magasabb szintű absztrakció, egyszerűbb parancsok
- ⚠️ ARM: Részletesebb, granulárisabb vezérlés

**AZD vs. Terraform**:
- ✅ AZD: Azure natív, integrált az Azure szolgáltatásokkal
- ⚠️ Terraform: Többfelhős támogatás, nagyobb ökoszisztéma

**AZD vs. Azure Portal**:
- ✅ AZD: Ismételhető, verziókövetett, automatizálható
- ⚠️ Portal: Manuális kattintások, nehéz reprodukálni

**Gondoljon az AZD-re úgy, mint az Azure Docker Compose-ra—egyszerűsített konfiguráció összetett telepítésekhez.**

---

## Gyakran Ismételt Kérdések

**K: Használhatok más programozási nyelvet?**  
V: Igen! Cserélje le a `src/web/` könyvtárat Node.js-re, C#-ra, Go-ra vagy más nyelvre. Frissítse az `azure.yaml`-t és Bicep fájt ennek megfelelően.

**K: Hogyan adhatok több adatbázist?**  
V: Adjon hozzá egy új SQL adatbázis modult az `infra/main.bicep`-hez vagy használjon PostgreSQL/MySQL-t az Azure adatbázis szolgáltatásokból.

**K: Használhatom ezt éles környezetben?**  
V: Ez egy kiindulópont. Éles üzemhez adjon hozzá: managed identity-t, private endpointokat, redundanciát, mentési stratégiát, WAF-ot és továbbfejlesztett monitorozást.

**K: Mi van, ha konténereket akarok használni a kód telepítése helyett?**  
V: Nézze meg a [Container Apps példát](../../../../examples/container-app), amely végig Docker konténereket használ.

**K: Hogyan kapcsolódhatok az adatbázishoz helyi gépről?**  
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
V: Igen, módosítsa az `infra/main.bicep`-t, hogy egy meglévő SQL Server hivatkozást használjon, és frissítse a kapcsolat paramétereket.

---

> **Megjegyzés:** Ez a példa bemutatja a legjobb gyakorlatokat egy webalkalmazás és adatbázis AZD-vel történő telepítéséhez. Tartalmaz működő kódot, részletes dokumentációt és gyakorlati feladatokat a tanulás megerősítéséhez. Éles telepítés esetén vizsgálja meg a biztonságot, skálázást, megfelelőséget és a költségigényeket, amelyek szervezetére jellemzőek.

**📚 Tanfolyam navigáció:**  
- ← Előző: [Container Apps példa](../../../../examples/container-app)  
- → Következő: [AI Integrációs Útmutató](../../../../docs/ai-foundry)  
- 🏠 [Tanfolyam kezdőlap](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Nyilatkozat**:
Ezt a dokumentumot az AI fordítószolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével fordítottuk le. Míg a pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti, anyanyelvi dokumentum tekinthető hiteles forrásnak. Fontos információk esetén profi, emberi fordítást javaslunk. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy helytelen értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->