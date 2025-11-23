<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22ea3f5148517a6012d3e2771584ef87",
  "translation_date": "2025-11-23T12:07:54+00:00",
  "source_file": "examples/container-app/microservices/README.md",
  "language_code": "hu"
}
-->
# Mikroszolgáltatások architektúra - Konténeralkalmazás példa

⏱️ **Becsült idő**: 25-35 perc | 💰 **Becsült költség**: ~50-100 USD/hó | ⭐ **Bonyolultság**: Haladó

Egy **egyszerűsített, de működőképes** mikroszolgáltatási architektúra, amelyet az Azure Container Apps segítségével telepítettek az AZD CLI használatával. Ez a példa bemutatja a szolgáltatások közötti kommunikációt, a konténer-orchestrationt és a monitorozást egy gyakorlati, 2 szolgáltatásból álló beállítással.

> **📚 Tanulási megközelítés**: Ez a példa egy minimális, 2 szolgáltatásból álló architektúrával (API Gateway + Backend Service) indul, amelyet ténylegesen telepíthet és tanulhat belőle. Miután elsajátította ezt az alapot, útmutatást nyújtunk a teljes mikroszolgáltatási ökoszisztéma kibővítéséhez.

## Amit megtanulhat

A példa elvégzésével:
- Több konténert telepíthet az Azure Container Apps-re
- Megvalósíthatja a szolgáltatások közötti kommunikációt belső hálózaton keresztül
- Konfigurálhatja a környezetalapú skálázást és az állapotellenőrzéseket
- Monitorozhatja az elosztott alkalmazásokat az Application Insights segítségével
- Megértheti a mikroszolgáltatások telepítési mintáit és legjobb gyakorlatait
- Megtanulhatja, hogyan bővítheti fokozatosan az egyszerű architektúrát bonyolultabbá

## Architektúra

### 1. fázis: Amit építünk (ebben a példában szerepel)

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

**Miért kezdjünk egyszerűen?**
- ✅ Gyorsan telepíthető és érthető (25-35 perc)
- ✅ Megtanulhatja az alapvető mikroszolgáltatási mintákat bonyolultság nélkül
- ✅ Működő kód, amelyet módosíthat és kísérletezhet vele
- ✅ Alacsonyabb tanulási költség (~50-100 USD/hó szemben a 300-1400 USD/hó költséggel)
- ✅ Magabiztosságot szerezhet, mielőtt adatbázisokat és üzenetküldő sorokat adna hozzá

**Analógia**: Gondoljon erre úgy, mint az autóvezetés tanulására. Egy üres parkolóval kezd (2 szolgáltatás), elsajátítja az alapokat, majd halad a városi forgalom felé (5+ szolgáltatás adatbázisokkal).

### 2. fázis: Jövőbeli bővítés (referenciaarchitektúra)

Miután elsajátította a 2-szolgáltatásos architektúrát, bővítheti:

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

Lásd a "Bővítési útmutató" szekciót a végén a lépésről lépésre történő útmutatásért.

## Tartalmazott funkciók

✅ **Szolgáltatásfelfedezés**: Automatikus DNS-alapú felfedezés a konténerek között  
✅ **Terheléselosztás**: Beépített terheléselosztás a replikák között  
✅ **Automatikus skálázás**: Független skálázás szolgáltatásonként a HTTP kérések alapján  
✅ **Állapotfigyelés**: Életképességi és készenléti ellenőrzések mindkét szolgáltatáshoz  
✅ **Elosztott naplózás**: Központosított naplózás az Application Insights segítségével  
✅ **Belső hálózat**: Biztonságos szolgáltatások közötti kommunikáció  
✅ **Konténer-orchestration**: Automatikus telepítés és skálázás  
✅ **Zéró leállási idő frissítések**: Fokozatos frissítések verziókezeléssel  

## Előfeltételek

### Szükséges eszközök

Mielőtt elkezdené, ellenőrizze, hogy az alábbi eszközök telepítve vannak-e:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (1.0.0 vagy újabb verzió)
   ```bash
   azd version
   # Várt kimenet: azd verzió 1.0.0 vagy magasabb
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (2.50.0 vagy újabb verzió)
   ```bash
   az --version
   # Várt kimenet: azure-cli 2.50.0 vagy magasabb
   ```

3. **[Docker](https://www.docker.com/get-started)** (helyi fejlesztéshez/teszteléshez - opcionális)
   ```bash
   docker --version
   # Várt kimenet: Docker verzió 20.10 vagy magasabb
   ```

### Azure követelmények

- Aktív **Azure előfizetés** ([hozzon létre ingyenes fiókot](https://azure.microsoft.com/free/))
- Jogosultság az erőforrások létrehozására az előfizetésében
- **Hozzájáruló** szerepkör az előfizetésen vagy az erőforráscsoporton

### Tudás előfeltételek

Ez egy **haladó szintű** példa. Ismernie kell:
- A [Simple Flask API példa](../../../../../examples/container-app/simple-flask-api) elvégzése
- Alapvető ismeretek a mikroszolgáltatási architektúráról
- REST API-k és HTTP ismerete
- Konténer fogalmak megértése

**Új a Container Apps-ben?** Kezdje a [Simple Flask API példával](../../../../../examples/container-app/simple-flask-api), hogy elsajátítsa az alapokat.

## Gyors kezdés (lépésről lépésre)

### 1. lépés: Klónozás és navigáció

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Siker ellenőrzés**: Ellenőrizze, hogy látja-e az `azure.yaml` fájlt:
```bash
ls
# Várható: README.md, azure.yaml, infra/, src/
```

### 2. lépés: Hitelesítés az Azure-ban

```bash
azd auth login
```

Ez megnyitja a böngészőt az Azure hitelesítéshez. Jelentkezzen be Azure hitelesítő adataival.

**✓ Siker ellenőrzés**: Ezt kell látnia:
```
Logged in to Azure.
```

### 3. lépés: Környezet inicializálása

```bash
azd init
```

**Megjelenő kérdések**:
- **Környezet neve**: Adjon meg egy rövid nevet (pl. `microservices-dev`)
- **Azure előfizetés**: Válassza ki az előfizetését
- **Azure helyszín**: Válasszon egy régiót (pl. `eastus`, `westeurope`)

**✓ Siker ellenőrzés**: Ezt kell látnia:
```
SUCCESS: New project initialized!
```

### 4. lépés: Infrastruktúra és szolgáltatások telepítése

```bash
azd up
```

**Mi történik** (8-12 percig tart):
1. Létrehozza a Container Apps környezetet
2. Létrehozza az Application Insights-t a monitorozáshoz
3. Felépíti az API Gateway konténert (Node.js)
4. Felépíti a Product Service konténert (Python)
5. Mindkét konténert telepíti az Azure-ba
6. Konfigurálja a hálózatot és az állapotellenőrzéseket
7. Beállítja a monitorozást és a naplózást

**✓ Siker ellenőrzés**: Ezt kell látnia:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Idő**: 8-12 perc

### 5. lépés: A telepítés tesztelése

```bash
# Szerezze meg az átjáró végpontját
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Tesztelje az API Gateway állapotát
curl $GATEWAY_URL/health

# Várható kimenet:
# {"status":"egészséges","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Tesztelje a termékszolgáltatást a gateway-en keresztül**:
```bash
# Termékek listázása
curl $GATEWAY_URL/api/products

# Várható kimenet:
# [
#   {"id":1,"name":"Laptop","price":999.99,"stock":50},
#   {"id":2,"name":"Egér","price":29.99,"stock":200},
#   {"id":3,"name":"Billentyűzet","price":79.99,"stock":150}
# ]
```

**✓ Siker ellenőrzés**: Mindkét végpont JSON adatot ad vissza hibák nélkül.

---

**🎉 Gratulálunk!** Mikroszolgáltatási architektúrát telepített az Azure-ra!

## Projektstruktúra

Minden implementációs fájl mellékelve van—ez egy teljes, működő példa:

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

**Mit csinál az egyes komponens:**

**Infrastruktúra (infra/)**:
- `main.bicep`: Az összes Azure erőforrás és azok függőségeinek orchestrationje
- `core/container-apps-environment.bicep`: Létrehozza a Container Apps környezetet és az Azure Container Registry-t
- `core/monitor.bicep`: Beállítja az Application Insights-t az elosztott naplózáshoz
- `app/*.bicep`: Egyedi konténeralkalmazás-definíciók skálázással és állapotellenőrzésekkel

**API Gateway (src/api-gateway/)**:
- Nyilvános szolgáltatás, amely a kéréseket a háttérszolgáltatásokhoz irányítja
- Naplózást, hibakezelést és kérés továbbítást valósít meg
- Bemutatja a szolgáltatások közötti HTTP kommunikációt

**Product Service (src/product-service/)**:
- Belső szolgáltatás termékkatalógussal (egyszerűség kedvéért memóriában)
- REST API állapotellenőrzésekkel
- Példa egy háttér mikroszolgáltatási mintára

## Szolgáltatások áttekintése

### API Gateway (Node.js/Express)

**Port**: 8080  
**Hozzáférés**: Nyilvános (külső bejárat)  
**Cél**: A bejövő kérések irányítása a megfelelő háttérszolgáltatásokhoz  

**Végpontok**:
- `GET /` - Szolgáltatás információ
- `GET /health` - Állapotellenőrzési végpont
- `GET /api/products` - Továbbítás a termékszolgáltatáshoz (összes listázása)
- `GET /api/products/:id` - Továbbítás a termékszolgáltatáshoz (azonosító alapján)

**Főbb jellemzők**:
- Kérésirányítás axios-szal
- Központosított naplózás
- Hibakezelés és időtúllépés kezelése
- Szolgáltatásfelfedezés környezeti változókon keresztül
- Application Insights integráció

**Kódrészlet** (`src/api-gateway/app.js`):
```javascript
// Belső szolgáltatás kommunikáció
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Port**: 8000  
**Hozzáférés**: Csak belső (nincs külső bejárat)  
**Cél**: Termékkatalógus kezelése memóriában tárolt adatokkal  

**Végpontok**:
- `GET /` - Szolgáltatás információ
- `GET /health` - Állapotellenőrzési végpont
- `GET /products` - Összes termék listázása
- `GET /products/<id>` - Termék lekérése azonosító alapján

**Főbb jellemzők**:
- RESTful API Flask-kel
- Memóriában tárolt termékadatok (egyszerű, nincs szükség adatbázisra)
- Állapotfigyelés próbákkal
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

**Miért csak belső?**
A termékszolgáltatás nem nyilvánosan elérhető. Minden kérésnek az API Gateway-en kell keresztülmennie, amely biztosítja:
- Biztonság: Ellenőrzött hozzáférési pont
- Rugalmasság: A háttér megváltoztatható anélkül, hogy a klienseket érintené
- Monitorozás: Központosított kérésnaplózás

## Szolgáltatások közötti kommunikáció megértése

### Hogyan kommunikálnak a szolgáltatások egymással

Ebben a példában az API Gateway belső HTTP hívásokkal kommunikál a Product Service-szel:

```javascript
// API Gateway (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Belső HTTP kérést indít
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Főbb pontok**:

1. **DNS-alapú felfedezés**: A Container Apps automatikusan biztosít DNS-t a belső szolgáltatásokhoz
   - Product Service FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - Egyszerűsítve: `http://product-service` (a Container Apps ezt feloldja)

2. **Nincs nyilvános kitettség**: A Product Service `external: false` a Bicep-ben
   - Csak a Container Apps környezeten belül érhető el
   - Az internetről nem érhető el

3. **Környezeti változók**: A szolgáltatás URL-ek telepítéskor kerülnek beállításra
   - A Bicep átadja a belső FQDN-t a gateway-nek
   - Nincsenek hardkódolt URL-ek az alkalmazáskódban

**Analógia**: Gondoljon erre úgy, mint egy irodaházra. Az API Gateway a recepció (nyilvános), a Product Service pedig egy irodahelyiség (csak belső). A látogatóknak a recepción keresztül kell eljutniuk bármelyik irodába.

## Telepítési lehetőségek

### Teljes telepítés (Ajánlott)

```bash
# Telepítse az infrastruktúrát és mindkét szolgáltatást
azd up
```

Ez telepíti:
1. Container Apps környezet
2. Application Insights
3. Container Registry
4. API Gateway konténer
5. Product Service konténer

**Idő**: 8-12 perc

### Egyedi szolgáltatás telepítése

```bash
# Csak egy szolgáltatást telepítsen (az első azd up után)
azd deploy api-gateway

# Vagy telepítse a termék szolgáltatást
azd deploy product-service
```

**Használati eset**: Ha frissítette az egyik szolgáltatás kódját, és csak azt szeretné újratelepíteni.

### Konfiguráció frissítése

```bash
# Módosítsa a skálázási paramétereket
azd env set GATEWAY_MAX_REPLICAS 30

# Telepítse újra az új konfigurációval
azd up
```

## Konfiguráció

### Skálázási konfiguráció

Mindkét szolgáltatás HTTP-alapú automatikus skálázással van konfigurálva a Bicep fájlokban:

**API Gateway**:
- Min. replikák: 2 (mindig legalább 2 az elérhetőség érdekében)
- Max. replikák: 20
- Skálázási trigger: 50 egyidejű kérés replikánként

**Product Service**:
- Min. replikák: 1 (szükség esetén nullára skálázható)
- Max. replikák: 10
- Skálázási trigger: 100 egyidejű kérés replikánként

**Skálázás testreszabása** (az `infra/app/*.bicep` fájlban):
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

### Erőforrás allokáció

**API Gateway**:
- CPU: 1.0 vCPU
- Memória: 2 GiB
- Indok: Minden külső forgalmat kezel

**Product Service**:
- CPU: 0.5 vCPU
- Memória: 1 GiB
- Indok: Könnyű memóriában végzett műveletek

### Állapotellenőrzések

Mindkét szolgáltatás tartalmaz életképességi és készenléti próbákat:

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

**Mit jelent ez**:
- **Életképesség**: Ha az állapotellenőrzés sikertelen, a Container Apps újraindítja a konténert
- **Készenlét**: Ha nem kész, a Container Apps leállítja a forgalom irányítását az adott replikára

## Monitorozás és megfigyelhetőség

### Szolgáltatásnaplók megtekintése

```bash
# Naplófolyam az API Gateway-ből
azd logs api-gateway --follow

# Tekintse meg a legutóbbi termékszolgáltatási naplókat
azd logs product-service --tail 100

# Tekintse meg az összes naplót mindkét szolgáltatásból
azd logs --follow
```

**Várható kimenet**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights lekérdezések

Nyissa meg az Application Insights-t az Azure Portálon, majd futtassa ezeket a lekérdezéseket:

**Lassú kérések keresése**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Szolgáltatások közötti hívások nyomon követése**:
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

**Kérések volumene időben**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Monitorozási irányítópult elérése

```bash
# Szerezze be az Application Insights részleteit
azd env get-values | grep APPLICATIONINSIGHTS

# Nyissa meg az Azure Portal monitorozást
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Élő metrikák

1. Navigáljon az Application Insights-hoz az Azure Portálon
2. Kattintson az "Élő metrikák" lehetőségre
3. Tekintse meg a valós idejű kéréseket, hibákat és teljesítményt
4. Tesztelje a következő futtatásával: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

##
Tanuláshoz/teszteléshez fontolja meg:
- Használja az Azure ingyenes krediteket (első 30 nap)
- Tartsa a replikák számát minimális szinten
- Tesztelés után törölje (nincs folyamatos költség)

---

## Tisztítás

A folyamatos költségek elkerülése érdekében törölje az összes erőforrást:

```bash
azd down --force --purge
```

**Megerősítő kérdés**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Írja be, hogy `y` a megerősítéshez.

**Mi kerül törlésre**:
- Container Apps környezet
- Mindkét Container App (gateway és product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ Tisztítás ellenőrzése**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Üresnek kell lennie.

---

## Bővítési útmutató: 2-től 5+ szolgáltatásig

Miután elsajátította ezt a 2-szolgáltatásos architektúrát, így bővítheti:

### 1. fázis: Adatbázis-perzisztencia hozzáadása (következő lépés)

**Cosmos DB hozzáadása a Product Service-hez**:

1. Hozzon létre egy `infra/core/cosmos.bicep` fájlt:
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

2. Frissítse a Product Service-t, hogy a Cosmos DB-t használja a memória helyett

3. Becsült további költség: ~25 USD/hónap (serverless)

### 2. fázis: Harmadik szolgáltatás hozzáadása (Rendeléskezelés)

**Order Service létrehozása**:

1. Új mappa: `src/order-service/` (Python/Node.js/C#)
2. Új Bicep fájl: `infra/app/order-service.bicep`
3. Frissítse az API Gateway-t, hogy irányítsa a `/api/orders` útvonalat
4. Adjon hozzá Azure SQL adatbázist a rendelés perzisztenciához

**Az architektúra így néz ki**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### 3. fázis: Aszinkron kommunikáció hozzáadása (Service Bus)

**Eseményvezérelt architektúra megvalósítása**:

1. Adjon hozzá Azure Service Bus-t: `infra/core/servicebus.bicep`
2. A Product Service "ProductCreated" eseményeket publikál
3. Az Order Service feliratkozik a termék eseményekre
4. Adjon hozzá Notification Service-t az események feldolgozásához

**Minta**: Kérés/válasz (HTTP) + eseményvezérelt (Service Bus)

### 4. fázis: Felhasználói hitelesítés hozzáadása

**User Service megvalósítása**:

1. Hozzon létre egy `src/user-service/` mappát (Go/Node.js)
2. Adjon hozzá Azure AD B2C-t vagy egyedi JWT hitelesítést
3. Az API Gateway ellenőrzi a tokeneket
4. A szolgáltatások ellenőrzik a felhasználói jogosultságokat

### 5. fázis: Production-készség

**Adja hozzá ezeket az összetevőket**:
- Azure Front Door (globális terheléselosztás)
- Azure Key Vault (titokkezelés)
- Azure Monitor Workbooks (egyedi irányítópultok)
- CI/CD Pipeline (GitHub Actions)
- Blue-Green telepítések
- Managed Identity az összes szolgáltatáshoz

**Teljes Production architektúra költsége**: ~300-1,400 USD/hónap

---

## További információk

### Kapcsolódó dokumentáció
- [Azure Container Apps Dokumentáció](https://learn.microsoft.com/azure/container-apps/)
- [Mikroszolgáltatások architektúra útmutató](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights a disztribuált nyomkövetéshez](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI Dokumentáció](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Következő lépések ebben a kurzusban
- ← Előző: [Egyszerű Flask API](../../../../../examples/container-app/simple-flask-api) - Kezdő egykonténeres példa
- → Következő: [AI Integrációs útmutató](../../../../../examples/docs/ai-foundry) - AI képességek hozzáadása
- 🏠 [Kurzus kezdőlapja](../../README.md)

### Összehasonlítás: Mikor mit használjunk

**Egyetlen Container App** (Egyszerű Flask API példa):
- ✅ Egyszerű alkalmazások
- ✅ Monolitikus architektúra
- ✅ Gyors telepítés
- ❌ Korlátozott skálázhatóság
- **Költség**: ~15-50 USD/hónap

**Mikroszolgáltatások** (Ez a példa):
- ✅ Összetett alkalmazások
- ✅ Független skálázás szolgáltatásonként
- ✅ Csapat autonómia (különböző szolgáltatások, különböző csapatok)
- ❌ Bonyolultabb kezelés
- **Költség**: ~60-250 USD/hónap

**Kubernetes (AKS)**:
- ✅ Maximális kontroll és rugalmasság
- ✅ Multi-cloud hordozhatóság
- ✅ Fejlett hálózatkezelés
- ❌ Kubernetes szakértelmet igényel
- **Költség**: ~150-500 USD/hónap minimum

**Ajánlás**: Kezdje Container Apps-szal (ez a példa), váltson AKS-re csak akkor, ha Kubernetes-specifikus funkciókra van szüksége.

---

## Gyakran Ismételt Kérdések

**K: Miért csak 2 szolgáltatás, nem 5+?**  
V: Oktatási előrehaladás. Elsajátítsa az alapokat (szolgáltatás kommunikáció, monitorozás, skálázás) egy egyszerű példával, mielőtt bonyolítaná. Az itt tanult minták alkalmazhatók 100-szolgáltatásos architektúrákra is.

**K: Hozzáadhatok több szolgáltatást magam?**  
V: Természetesen! Kövesse a fenti bővítési útmutatót. Minden új szolgáltatás ugyanazt a mintát követi: src mappa létrehozása, Bicep fájl létrehozása, azure.yaml frissítése, telepítés.

**K: Ez már production-kész?**  
V: Ez egy szilárd alap. Production célra adjon hozzá: managed identity, Key Vault, perzisztens adatbázisok, CI/CD pipeline, monitorozási riasztások és biztonsági mentési stratégiát.

**K: Miért nem használunk Dapr-t vagy más service mesh-t?**  
V: Egyszerűség kedvéért. Miután megértette a natív Container Apps hálózatkezelést, rétegezheti a Dapr-t fejlettebb forgatókönyvekhez.

**K: Hogyan tudok helyben hibakeresni?**  
V: Futtassa a szolgáltatásokat helyben Dockerrel:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**K: Használhatok különböző programozási nyelveket?**  
V: Igen! Ez a példa Node.js-t (gateway) és Python-t (product service) mutat be. Bármilyen konténerben futó nyelvet keverhet.

**K: Mi van, ha nincs Azure kreditem?**  
V: Használja az Azure ingyenes szintjét (első 30 nap új fiókokkal) vagy telepítse rövid tesztelési időszakokra, majd azonnal törölje.

---

> **🎓 Tanulási útvonal összefoglaló**: Megtanulta, hogyan telepítsen egy több szolgáltatásos architektúrát automatikus skálázással, belső hálózatkezeléssel, központosított monitorozással és production-kész mintákkal. Ez az alap felkészíti Önt összetett elosztott rendszerekre és vállalati mikroszolgáltatásos architektúrákra.

**📚 Kurzus navigáció**:
- ← Előző: [Egyszerű Flask API](../../../../../examples/container-app/simple-flask-api)
- → Következő: [Adatbázis integrációs példa](../../../../../examples/database-app)
- 🏠 [Kurzus kezdőlapja](../../README.md)
- 📖 [Container Apps legjobb gyakorlatok](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősség kizárása**:  
Ez a dokumentum az AI fordítási szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->