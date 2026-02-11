# Mikroszolgáltatás Architektúra – Container App Példa

⏱️ **Becsült idő**: 25-35 perc | 💰 **Becsült költség**: kb. 50-100 USD/hó | ⭐ **Bonyolultság**: Haladó

Egy **egyszerűsített, de működőképes** mikroszolgáltatás architektúra, amely az Azure Container Apps-re van telepítve az AZD CLI használatával. Ez a példa szolgáltatás-szolgáltatás közti kommunikációt, konténer orkestrációt és megfigyelést mutat be egy gyakorlati két-szolgáltatásos környezetben.

> **📚 Tanulási megközelítés:** Ez a példa egy minimális 2-szolgáltatásos architektúrával kezdődik (API Gateway + Backend Szolgáltatás), amit ténylegesen telepíthetsz és tanulhatsz belőle. A megértés után útmutatást adunk a teljes mikroszolgáltatás ökoszisztéma bővítéséhez.

## Amit Megtanulsz

A példa elvégzésével:
- Több konténert telepítesz az Azure Container Apps-re
- Megvalósítod a szolgáltatás-közti kommunikációt belső hálózaton keresztül
- Konfigurálod a környezet-alapú skálázást és egészségügyi ellenőrzéseket
- Megfigyeled az elosztott alkalmazásokat az Application Insights használatával
- Megérted a mikroszolgáltatások telepítési mintáit és bevált gyakorlatait
- Tanulsz a fokozatos bővítésről az egyszerűtől a komplexig

## Architektúra

### 1. Fázis: Amit Építünk (Ebben a példában)

```
                    ┌─────────────────────────────┐
                    │         Internet            │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTPS
                                   │
                    ┌──────────────▼──────────────┐
                    │      API Gateway            │
                    │   (Node.js Container)       │
                    │   - Routes requests         │
                    │   - Health checks           │
                    │   - Request logging         │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTP (internal)
                                   │
                    ┌──────────────▼──────────────┐
                    │    Product Service          │
                    │   (Python Container)        │
                    │   - Product CRUD            │
                    │   - In-memory data store    │
                    │   - REST API                │
                    └──────────────┬──────────────┘
                                   │
                    ┌──────────────▼──────────────┐
                    │   Application Insights      │
                    │   (Monitoring & Logs)       │
                    └─────────────────────────────┘
```

**Miért Kezdjünk Egyszerűen?**
- ✅ Gyors telepítés és megértés (25-35 perc)
- ✅ Megtanulhatod az alap mikroszolgáltatás mintákat bonyolultság nélkül
- ✅ Működő kód, amit módosíthatsz és tesztelhetsz
- ✅ Alacsonyabb költség a tanuláshoz (kb. 50-100 USD/hó vs 300-1400 USD/hó)
- ✅ Magabiztosság építése adatbázisok és üzenetsorok előtt

**Analógia**: Olyan, mintha vezetést tanulnál. Először egy üres parkolóban (2 szolgáltatás) gyakorolsz, megtanulod az alapokat, majd tovább lépsz a városi forgalomba (5+ szolgáltatás adatbázisokkal).

### 2. Fázis: Jövőbeli Bővítés (Referencia Architektúra)

Miután elsajátítod a 2-szolgáltatásos architektúrát, az alábbiakra bővíthetsz:

```
Full Architecture (Not Included - For Reference)
├── API Gateway (✅ Included)
├── Product Service (✅ Included)
├── Order Service (🔜 Add next)
├── User Service (🔜 Add next)
├── Notification Service (🔜 Add last)
├── Azure Service Bus (🔜 For async communication)
├── Cosmos DB (🔜 For product persistence)
├── Azure SQL (🔜 For order management)
└── Azure Storage (🔜 For file storage)
```

A lépésről lépésre útmutató a „Bővítési útmutató” résznél található a dokumentum végén.

## Tartalmazott Funkciók

✅ **Szolgáltatás-felderítés**: Automatikus DNS-alapú felderítés a konténerek között  
✅ **Teherelosztás**: Beépített teherelosztás a replikák között  
✅ **Automatikus skálázás**: Szolgáltatásonkénti skálázás HTTP kérések alapján  
✅ **Egészségfigyelés**: Életképességi és készenléti ellenőrzések mindkét szolgáltatásra  
✅ **Elosztott naplózás**: Központosított naplózás Application Insights-szal  
✅ **Belső hálózat**: Biztonságos szolgáltatás-közti kommunikáció  
✅ **Konténer orkestráció**: Automatikus telepítés és skálázás  
✅ **Zéró leállású frissítések**: Lassan gördülő frissítések revíziókezeléssel  

## Előfeltételek

### Szükséges Eszközök

Kezdés előtt győződj meg róla, hogy telepítve vannak ezek az eszközök:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (1.0.0 vagy újabb verzió)
   ```bash
   azd version
   # Várt kimenet: azd verzió 1.0.0 vagy újabb
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (2.50.0 vagy újabb verzió)
   ```bash
   az --version
   # Várt kimenet: azure-cli 2.50.0 vagy újabb
   ```

3. **[Docker](https://www.docker.com/get-started)** (helyi fejlesztéshez/teszteléshez – opcionális)
   ```bash
   docker --version
   # Elvárt kimenet: Docker verzió 20.10 vagy újabb
   ```

### Azure Követelmények

- Aktív **Azure előfizetés** ([ingyenes fiók létrehozása](https://azure.microsoft.com/free/))
- Jogosultságok az erőforrások létrehozásához az előfizetésedben
- **Contributor** szerepkör az előfizetésen vagy erőforráscsoporton belül

### Tudás Előfeltételek

Ez egy **haladó szintű** példa. Ajánlott tudás:
- Elvégezted a [Egyszerű Flask API példát](../../../../../examples/container-app/simple-flask-api) 
- Alap mikroszolgáltatás architektúra ismeret
- Alap REST API és HTTP ismeretek
- Konténer koncepciók ismerete

**Új vagy a Container Apps-ben?** Először kezd az [Egyszerű Flask API példa](../../../../../examples/container-app/simple-flask-api) megértésével.

## Gyors Kezdés (Lépésről lépésre)

### 1. lépés: Klónozás és Navigálás

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Sikertes ellenőrzés**: Győződj meg róla, hogy látod az `azure.yaml` fájlt:
```bash
ls
# Várt: README.md, azure.yaml, infra/, src/
```

### 2. lépés: Bejelentkezés Azure-ba

```bash
azd auth login
```

Megnyílik a böngésződ az Azure hitelesítéshez. Jelentkezz be Azure fiókoddal.

**✓ Sikertes ellenőrzés**: Látnod kell a következőt:
```
Logged in to Azure.
```

### 3. lépés: Környezet Inicializálása

```bash
azd init
```

**Kérdések, amiket látsz**:
- **Környezet neve**: Adj meg egy rövid nevet (pl. `microservices-dev`)
- **Azure előfizetés**: Válaszd ki az előfizetésedet
- **Azure helyszín**: Válassz régiót (pl. `eastus`, `westeurope`)

**✓ Sikertes ellenőrzés**: Meg kell jelennie:
```
SUCCESS: New project initialized!
```

### 4. lépés: Infrastruktúra és Szolgáltatások Telepítése

```bash
azd up
```

**Mi történik** (kb. 8-12 percet vesz igénybe):
1. Container Apps környezet létrehozása
2. Application Insights létrehozása megfigyeléshez
3. API Gateway konténer felépítése (Node.js)
4. Product Service konténer felépítése (Python)
5. Mindkét konténer telepítése Azure-re
6. Hálózati és egészségügyi ellenőrzések konfigurálása
7. Megfigyelés és naplózás beállítása

**✓ Sikertes ellenőrzés**: Ennek kell megjelennie:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Idő**: 8-12 perc

### 5. lépés: Telepítés Tesztelése

```bash
# Szerezze be a gateway végpontot
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Tesztelje az API Gateway egészségi állapotát
curl $GATEWAY_URL/health

# Várt kimenet:
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Teszteld a termékszolgáltatást a gateway-n keresztül**:
```bash
# Termékek listázása
curl $GATEWAY_URL/api/products

# Várt kimenet:
# [
#   {"id":1,"name":"Laptop","price":999.99,"stock":50},
#   {"id":2,"name":"Egér","price":29.99,"stock":200},
#   {"id":3,"name":"Billentyűzet","price":79.99,"stock":150}
# ]
```

**✓ Sikertes ellenőrzés**: Mindkét végpont JSON adatot ad vissza hibák nélkül.

---

**🎉 Gratulálunk!** Telepítettél egy mikroszolgáltatás architektúrát az Azure-ra!

## Projekt Felépítés

Minden megvalósítási fájl megtalálható – teljes, működő példa:

```
microservices/
│
├── README.md                         # This file
├── azure.yaml                        # AZD configuration
├── .gitignore                        # Git ignore patterns
│
├── infra/                           # Infrastructure as Code (Bicep)
│   ├── main.bicep                   # Main orchestration
│   ├── abbreviations.json           # Naming conventions
│   ├── core/                        # Shared infrastructure
│   │   ├── container-apps-environment.bicep  # Container environment + registry
│   │   └── monitor.bicep            # Application Insights + Log Analytics
│   └── app/                         # Service definitions
│       ├── api-gateway.bicep        # API Gateway container app
│       └── product-service.bicep    # Product Service container app
│
└── src/                             # Application source code
    ├── api-gateway/                 # Node.js API Gateway
    │   ├── app.js                   # Express server with routing
    │   ├── package.json             # Node dependencies
    │   └── Dockerfile               # Container definition
    └── product-service/             # Python Product Service
        ├── main.py                  # Flask API with product data
        ├── requirements.txt         # Python dependencies
        └── Dockerfile               # Container definition
```

**Mi Mit Csinál:**

**Infrastruktúra (infra/)**:
- `main.bicep`: Az összes Azure erőforrást és az összefüggéseket kezeli
- `core/container-apps-environment.bicep`: Létrehozza a Container Apps környezetet és Azure Container Registry-t
- `core/monitor.bicep`: Application Insights beállítása az elosztott naplózáshoz
- `app/*.bicep`: Egyedi konténer app definíciók skálázással és egészségi ellenőrzésekkel

**API Gateway (src/api-gateway/)**:
- Nyilvános szolgáltatás, ami a kéréseket a backend szolgáltatásokhoz irányítja
- Naplózás, hibakezelés és kérés továbbítás megvalósítása
- Szolgáltatás-közti HTTP kommunikáció bemutatása

**Product Service (src/product-service/)**:
- Belső szolgáltatás termékkatalógussal (memória alapú egyszerűség kedvéért)
- REST API egészségügyi ellenőrzésekkel
- Backend mikroszolgáltatás minta

## Szolgáltatások Áttekintése

### API Gateway (Node.js/Express)

**Port**: 8080  
**Hozzáférés**: Nyilvános (külső bejárat)  
**Cél**: Bejövő kérések irányítása a megfelelő backend szolgáltatáshoz  

**Végpontok**:
- `GET /` - Szolgáltatás információ
- `GET /health` - Egészségügyi ellenőrzés
- `GET /api/products` - Termékek listázása a product service-ből
- `GET /api/products/:id` - Termék lekérdezése ID alapján a product service-ből

**Főbb jellemzők**:
- Kérésirányítás axios-szal
- Központosított naplózás
- Hibakezelés és időkorlát menedzsment
- Szolgáltatás-felderítés környezeti változók alapján
- Application Insights integráció

**Kódrészlet** (`src/api-gateway/app.js`):
```javascript
// Belső szolgáltatás közötti kommunikáció
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Port**: 8000  
**Hozzáférés**: Csak belső (nincs külső bejárat)  
**Cél**: Termékkatalógus kezelése memóriaalapon  

**Végpontok**:
- `GET /` - Szolgáltatás információ
- `GET /health` - Egészségügyi ellenőrzés
- `GET /products` - Összes termék listázása
- `GET /products/<id>` - Termék lekérdezése ID alapján

**Főbb jellemzők**:
- Flask alapú REST API
- Memóriában tárolt termékek (egyszerű, adatbázis nem szükséges)
- Egészségügyi ellenőrzések probe-okkal
- Strukturált naplózás
- Application Insights integráció

**Adatmodell**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**Miért Csak Belső?**
A termékszolgáltatás nincs nyilvánosan elérhetővé téve. Minden kérés az API Gateway-en keresztül megy, amely biztosítja:
- Biztonság: Ellenőrzött hozzáférési pont
- Rugalmasság: Lehetőség backend cserére anélkül, hogy az ügyfelek érintve lennének
- Megfigyelés: Központosított kérés naplózás

## Szolgáltatás Kommunikáció Megértése

### Hogyan Kommunikálnak a Szolgáltatások

Ebben a példában az API Gateway a Product Service-szel **belső HTTP hívásokon** keresztül kommunikál:

```javascript
// API átjáró (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Belső HTTP kérés készítése
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Fő pontok**:

1. **DNS alapú felderítés**: A Container Apps automatikusan biztosít DNS nevet a belső szolgáltatásoknak
   - Product Service FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - Egyszerűsítve: `http://product-service` (a Container Apps oldja fel)

2. **Nincs nyilvános elérés**: A Product Service Bicep fájlban `external: false`
   - Csak a Container Apps környezeten belül érhető el
   - Az internet felől nem hozzáférhető

3. **Környezeti változók**: A szolgáltatás URL-ek telepítéskor vannak injektálva
   - A Bicep átadja a belső FQDN-t a gateway-nek
   - Az alkalmazás kódban nincs keménykódolt URL

**Analógia**: Olyan, mint egy irodaépület: az API Gateway az információs pult (nyilvános), a Product Service egy iroda (csak belső). A látogatóknak először az információn át kell menniük, hogy bármelyik irodába bejussanak.

## Telepítési Opciók

### Teljes Telepítés (Ajánlott)

```bash
# Telepítse az infrastruktúrát és mindkét szolgáltatást
azd up
```

Ez telepíti:
1. Container Apps környezet
2. Application Insights
3. Container Registry-t
4. API Gateway konténert
5. Product Service konténert

**Idő**: 8-12 perc

### Egyedi Szolgáltatás Telepítése

```bash
# Csak egy szolgáltatás telepítése (az első azd up után)
azd deploy api-gateway

# Vagy a termék szolgáltatás telepítése
azd deploy product-service
```

**Használati eset**: Ha egy szolgáltatásban módosítottál kódot és csak azt szeretnéd újratelepíteni.

### Konfiguráció Frissítése

```bash
# Változtassa meg a méretezési paramétereket
azd env set GATEWAY_MAX_REPLICAS 30

# Telepítse újra az új konfigurációval
azd up
```

## Konfiguráció

### Skálázási Beállítások

Mindkét szolgáltatás Bicep fájlja HTTP alapú automatikus skálázást tartalmaz:

**API Gateway**:
- Minimum replikák: 2 (mindig legalább 2 az elérhetőség miatt)
- Maximum replikák: 20
- Skálázási trigger: 50 egyidejű kérés replikánként

**Product Service**:
- Minimum replikák: 1 (szükség esetén nullára is skálázható)
- Maximum replikák: 10
- Skálázási trigger: 100 egyidejű kérés replikánként

**Skálázás testreszabása** (`infra/app/*.bicep`):
```bicep
scale: {
  minReplicas: 1
  maxReplicas: 10
  rules: [
    {
      name: 'http-scale-rule'
      http: {
        metadata: {
          concurrentRequests: '100'  // Adjust this
        }
      }
    }
  ]
}
```

### Erőforrás Allokáció

**API Gateway**:
- CPU: 1.0 vCPU
- Memória: 2 GiB
- Indok: Minden külső forgalmat kezeli

**Product Service**:
- CPU: 0.5 vCPU
- Memória: 1 GiB
- Indok: Könnyű memória-alapú műveletek

### Egészségügyi Ellenőrzések

Mindkét szolgáltatás tartalmaz életképességi és készenléti probe-okat:

```bicep
probes: [
  {
    type: 'Liveness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 10
    periodSeconds: 30
  }
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 5
    periodSeconds: 10
  }
]
```

**Mit Jelentenek?**
- **Életképesség (liveness)**: Ha a vizsgálat sikertelen, a Container Apps újraindítja a konténert
- **Készenlét (readiness)**: Ha nem kész, a Container Apps nem irányít forgalmat arra a replikára



## Megfigyelés és Megfigyelhetőség

### Szolgáltatás Naplók Megtekintése

```bash
# Naplók megtekintése az azd monitor használatával
azd monitor --logs

# Vagy használja az Azure CLI-t adott Container Apps esetén:
# Naplók folyamatos közvetítése az API Gateway-ből
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# A legutóbbi termék szolgáltatás naplók megtekintése
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**Várt eredmény**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights Lekérdezések

Az Azure Portalon keresztül az Application Insights-hoz navigálva futtasd ezeket a lekérdezéseket:

**Lassú kérések keresése**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Szolgáltatás-közi hívások követése**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Hibaarány szolgáltatásonként**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Kérések mennyisége időben**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Megfigyelő Műszerfal Elérése

```bash
# Alkalmazás Insights részleteinek lekérése
azd env get-values | grep APPLICATIONINSIGHTS

# Azure Portal megnyitása a monitorozáshoz
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Élő Metrikák

1. Nyisd meg az Application Insights-ot az Azure Portalon
2. Kattints az "Élő metrikák" elemre
3. Lásd valós idejű kéréseket, hibákat és teljesítményt
4. Teszt: futtasd a következőt: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Gyakorlati Feladatok

[Megjegyzés: Részletes, lépésenkénti gyakorlatokat lásd a fentebb a "Gyakorlati Feladatok" szekcióban telepítés ellenőrzésével, adat módosítással, automatikus skálázás teszttel, hibakezeléssel és harmadik szolgáltatás hozzáadásával.]

## Költségelemzés

### Becsült havi költségek (Ehhez a 2-szolgáltatásos példához)

| Erőforrás | Konfiguráció | Becsült költség |
|----------|--------------|----------------|
| API Gateway | 2-20 replikák, 1 vCPU, 2GB RAM | 30-150 USD |
| Product Service | 1-10 replikák, 0.5 vCPU, 1GB RAM | 15-75 USD |
| Container Registry | Alap szint | 5 USD |
| Application Insights | 1-2 GB/hónap | 5-10 USD |
| Log Analytics | 1 GB/hónap | 3 USD |
| **Összesen** | | **58-243 USD/hó** |

**Használati költség megoszlás**:
- **Kis forgalom** (teszt/tanulás): kb. 60 USD/hó
- **Mérsékelt forgalom** (kis éles környezet): kb. 120 USD/hó
- **Nagy forgalom** (forgalmas időszakok): kb. 240 USD/hó

### Költségoptimalizálási Tippek

1. **Skálázás nullára fejlesztéshez**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Használd a Cosmos DB fogyasztás alapú tervét** (ha hozzáadod):
   - Csak a tényleges használatért fizetsz
   - Nincs minimális díj

3. **Állítsd be az Application Insights mintavételezést**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // A kérések 50%-ának mintavétele
   ```

4. **Takarítsd ki, ha nincs szükség**:
   ```bash
   azd down
   ```

### Ingyenes Szint Opciók
Tanuláshoz/teszteléshez vegye figyelembe:
- Használja az Azure ingyenes jóváírásait (az első 30 napban)
- Legyen a replikák száma minimális
- Törölje a tesztelés után (nincsenek folyamatban lévő díjak)

---

## Takarítás

A folyamatban lévő díjak elkerülése érdekében törölje az összes erőforrást:

```bash
azd down --force --purge
```

**Megerősítő kérdés**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Írja be az `y` betűt a megerősítéshez.

**Mi törlődik**:
- Container Apps környezet
- Mindkét Container App (gateway és termék szolgáltatás)
- Container Registry
- Application Insights
- Log Analytics munkaterület
- Erőforráscsoport

**✓ Takarítás ellenőrzése**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Üres eredményt kell adjon.

---

## Bővítési útmutató: 2-ről 5+ szolgáltatásra

Miután elsajátította ezt a 2-szolgáltatásos architektúrát, így bővíthet:

### 1. fázis: Adatbázis-perzisztencia hozzáadása (következő lépés)

**Cosmos DB hozzáadása a termék szolgáltatáshoz**:

1. Hozza létre az `infra/core/cosmos.bicep` fájlt:
   ```bicep
   resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
     name: name
     location: location
     kind: 'GlobalDocumentDB'
     properties: {
       databaseAccountOfferType: 'Standard'
       locations: [{ locationName: location, failoverPriority: 0 }]
     }
   }
   ```

2. Frissítse a termék szolgáltatást, hogy ahelyett, hogy memóriában tárolná az adatokat, Cosmos DB-t használjon

3. Becsült további költség: kb. 25 USD/hónap (serverless)

### 2. fázis: Harmadik szolgáltatás hozzáadása (megrendeléskezelés)

**Megrendelés szolgáltatás létrehozása**:

1. Új mappa: `src/order-service/` (Python/Node.js/C#)
2. Új Bicep fájl: `infra/app/order-service.bicep`
3. Frissítse az API Gateway-t, hogy a `/api/orders` útvonalra irányítson
4. Adjon hozzá Azure SQL adatbázist a megrendelések perzisztenciájához

**Az architektúra így alakul**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### 3. fázis: Aszinkron kommunikáció hozzáadása (Service Bus)

**Eseményvezérelt architektúra megvalósítása**:

1. Adjon hozzá Azure Service Bus-t: `infra/core/servicebus.bicep`
2. A termék szolgáltatás közzéteszi a "ProductCreated" eseményeket
3. A megrendelés szolgáltatás előfizet a termék eseményekre
4. Adjon hozzá Értesítési szolgáltatást az események feldolgozásához

**Minta**: Kérés/Válasz (HTTP) + Eseményvezérelt (Service Bus)

### 4. fázis: Felhasználói hitelesítés hozzáadása

**Felhasználói szolgáltatás megvalósítása**:

1. Hozza létre a `src/user-service/` mappát (Go/Node.js)
2. Adjon hozzá Azure AD B2C vagy egyedi JWT hitelesítést
3. Az API Gateway ellenőrzi a tokeneket
4. A szolgáltatások vizsgálják a felhasználói jogosultságokat

### 5. fázis: Éles üzemre való felkészülés

**Ezek az összetevők kerüljenek hozzáadásra**:
- Azure Front Door (globális terheléselosztás)
- Azure Key Vault (titkok kezelése)
- Azure Monitor Workbooks (egyedi irányítópultok)
- CI/CD Pipeline (GitHub Actions)
- Blue-Green telepítések
- Kezelt identitás minden szolgáltatás számára

**Teljes éles architektúra költsége**: kb. 300-1,400 USD/hónap

---

## További tudnivalók

### Kapcsolódó dokumentáció
- [Azure Container Apps dokumentáció](https://learn.microsoft.com/azure/container-apps/)
- [Mikroszolgáltatások architektúra útmutató](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights elosztott követéshez](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI dokumentáció](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### A tanfolyam következő lépései
- ← Előző: [Egyszerű Flask API](../../../../../examples/container-app/simple-flask-api) - Kezdő egydobozos példa
- → Következő: [AI integrációs útmutató](../../../../../examples/docs/ai-foundry) - AI képességek hozzáadása
- 🏠 [Tanfolyam kezdőoldal](../../README.md)

### Összehasonlítás: Mikor melyiket használjuk

**Egydobozos Container App** (Egyszerű Flask API példa):
- ✅ Egyszerű alkalmazások
- ✅ Monolitikus architektúra
- ✅ Gyors telepítés
- ❌ Korlátozott skálázhatóság
- **Költség**: kb. 15-50 USD/hónap

**Mikroszolgáltatások** (Ez a példa):
- ✅ Összetett alkalmazások
- ✅ Szolgáltatásonként külön skálázás
- ✅ Csapat autonómia (különböző szolgáltatások, különböző csapatok)
- ❌ Bonyolultabb menedzsment
- **Költség**: kb. 60-250 USD/hónap

**Kubernetes (AKS)**:
- ✅ Maximális kontroll és rugalmasság
- ✅ Többfelhős hordozhatóság
- ✅ Fejlett hálózatkezelés
- ❌ Kubernetes szakértelmet igényel
- **Költség**: legalább kb. 150-500 USD/hónap

**Ajánlás**: Kezdje Container Apps-szel (ez a példa), AKS-re csak akkor váltson, ha Kubernetes-specifikus funkciókra van szüksége.

---

## Gyakran Ismételt Kérdések

**K: Miért csak 2 szolgáltatás és nem 5+?**  
V: Oktatási fokozatosság. Először sajátítsa el az alapokat (szolgáltatás kommunikáció, monitorozás, skálázás) egy egyszerű példán keresztül, mielőtt bonyolultabb lesz. Az itt tanult minták 100 szolgáltatásos architektúrára is alkalmazhatók.

**K: Magam is hozzáadhatok több szolgáltatást?**  
V: Természetesen! Kövesse a fenti bővítési útmutatót. Minden új szolgáltatás ugyanazt a mintát követi: hozzon létre src mappát, Bicep fájlt, frissítse az azure.yaml-t, telepítse.

**K: Ez éles környezetre kész?**  
V: Jó alap. Éles környezethez adjon hozzá: kezelt identitást, Key Vault-ot, perzisztens adatbázisokat, CI/CD pipeline-t, monitorozási riasztásokat és mentési stratégiát.

**K: Miért nem használjuk a Dapr-t vagy más service mesh-t?**  
V: Maradjunk egyszerűek a tanuláshoz. Ha megérti a natív Container Apps hálózatot, később rétegezheti Daprt a fejlettebb esetekhez.

**K: Hogyan hibakereshetek helyileg?**  
V: Futtassa a szolgáltatásokat helyileg Dockerrel:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**K: Használhatok más programozási nyelveket?**  
V: Igen! Ez a példa Node.js-t (gateway) és Pythont (termék szolgáltatás) mutat be. Bármilyen konténerben futtatható nyelvet használhat.

**K: Mi van, ha nincs Azure jóváírásom?**  
V: Használja az Azure ingyenes szintjét (az első 30 nap új fiókkal), vagy telepítsen rövid tesztidőszakra és törölje azonnal.

---

> **🎓 Tanulási út összefoglaló**: Megtanulta, hogyan telepítsen többszolgáltatásos architektúrát automatikus skálázással, belső hálózatkezeléssel, központosított monitorozással és éles környezetre kész mintákkal. Ez az alap felkészíti összetett elosztott rendszerek és vállalati mikroszolgáltatások architektúrájára.

**📚 Tanfolyam navigáció:**
- ← Előző: [Egyszerű Flask API](../../../../../examples/container-app/simple-flask-api)
- → Következő: [Adatbázis integrációs példa](../../../../../examples/database-app)
- 🏠 [Tanfolyam kezdőoldal](../../../README.md)
- 📖 [Container Apps legjobb gyakorlatok](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősség kizárása**:  
Ezt a dokumentumot az AI fordító szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével fordítottuk. Habár a pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hivatalos forrásnak. Fontos információk esetén szakmai emberi fordítást javaslunk. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->