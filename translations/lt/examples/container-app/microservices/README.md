# Mikroservisų architektūra - Container App pavyzdys

⏱️ **Numatomas laikas**: 25–35 minučių | 💰 **Numatoma kaina**: ~$50-100/mėn. | ⭐ **Sudėtingumas**: Pažengęs

Supaprastinta, bet funkcinė mikroservisų architektūra, diegiama į Azure Container Apps naudojant AZD CLI. Šis pavyzdys demonstruoja paslaugų tarpusavio komunikaciją, konteinerių orkestravimą ir stebėjimą su praktišku 2 paslaugų rinkiniu.

> **📚 Mokymosi metodika**: Šis pavyzdys prasideda nuo minimalios 2 paslaugų architektūros (API vartai + Produktų paslauga), kurią galite iš tiesų išdiegti ir išmokti. Išmokę šiuos pagrindus, pateikiame gaires, kaip plėsti iki pilno mikroservisų ekosistemos.

## Ko išmoksite

Baigę šį pavyzdį, jūs:
- Išdiegsite kelis konteinerius į Azure Container Apps
- Įgyvendinsite paslaugų tarpusavio komunikaciją su vidiniu tinklų ryšiu
- Suconfiguruosite mastelį pagal aplinką ir sveikatos patikras
- Stebėsite paskirstytas programas su Application Insights
- Suprasite mikroservisų diegimo šablonus ir geriausias praktikas
- Išmoksite palaipsniui plėsti architektūrą nuo paprastos iki sudėtingos

## Architektūra

### 1 etapas: Ką kuriame (įtrauktas į šį pavyzdį)

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

**Kodėl pradėti paprastai?**
- ✅ Greitai išdiegti ir suprasti (25–35 minutės)
- ✅ Išmokti pagrindinius mikroservisų šablonus be sudėtingumo
- ✅ Veikiantis kodas, kurį galite keisti ir eksperimentuoti
- ✅ Mažesnės mokymosi sąnaudos (~$50-100/mėn. vs $300-1400/mėn.)
- ✅ Užauginti pasitikėjimą prieš pridedant duomenų bazes ir žinučių eiles

**Analogiška**: Galvokite apie tai kaip apie važiavimo mokymąsi. Pradedate nuo tuščio stovėjimo aikštelės (2 paslaugos), įvaldote pagrindus, tada pereinate į miesto eismą (5+ paslaugų su duomenų bazėmis).

### 2 etapas: Ateities plėtra (referencinė architektūra)

Kai įvaldysite 2 paslaugų architektūrą, galite išplėsti:

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

Žr. skirsnį "Expansion Guide" pabaigoje dėl žingsnis po žingsnio instrukcijų.

## Įtrauktos funkcijos

✅ **Paslaugų aptikimas**: Automatinis DNS pagrindu vykstantis aptikimas tarp konteinerių  
✅ **Load Balancing**: Įmontuotas apkrovos balansavimas tarp replikų  
✅ **Automatinis mastelio keitimas**: Nepriklausomas mastelio keitimas kiekvienai paslaugai pagal HTTP užklausas  
✅ **Sveikatos stebėjimas**: Liveness ir readiness patikros abiems paslaugoms  
✅ **Paskirstytas žurnalavimas**: Centralizuotas žurnalavimas su Application Insights  
✅ **Vidinis tinklų ryšys**: Saugus paslaugų tarpusavio bendravimas  
✅ **Konteinerių orkestravimas**: Automatinis diegimas ir mastelio keitimas  
✅ **Nulinis gedimų laikas atnaujinant**: Rolling atnaujinimai su revision valdymu  

## Reikalingos sąlygos

### Reikalingi įrankiai

Prieš pradėdami, įsitikinkite, kad turite įdiegtus šiuos įrankius:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versija 1.0.0 ar naujesnė)
   ```bash
   azd version
   # Tikėtina išvestis: azd versija 1.0.0 arba naujesnė
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versija 2.50.0 ar naujesnė)
   ```bash
   az --version
   # Tikėtina išvestis: azure-cli 2.50.0 arba naujesnė
   ```

3. **[Docker](https://www.docker.com/get-started)** (vietiniam vystymui/testavimui - neprivaloma)
   ```bash
   docker --version
   # Tikėtina išvestis: Docker versija 20.10 arba naujesnė
   ```

### Azure reikalavimai

- Aktyvi **Azure prenumerata** ([sukurkite nemokamą paskyrą](https://azure.microsoft.com/free/))
- Leidimai kurti išteklius jūsų prenumeratoje
- **Contributor** rolė prenumeratoje arba resursų grupėje

### Žinių prielaidos

Tai yra **pažengusio lygio** pavyzdys. Jums reikėtų:
- Baigti [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) 
- Pagrindinių žinių apie mikroservisų architektūrą
- Susipažinimo su REST API ir HTTP
- Supratimo apie konteinerių sąvokas

**Naujas Container Apps?** Pradėkite nuo [Simple Flask API example](../../../../../examples/container-app/simple-flask-api), kad išmoktumėte pagrindus.

## Greitas pradėjimas (žingsnis po žingsnio)

### 1 žingsnis: Nukopijuokite ir pereikite į katalogą

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Sėkmės patikra**: Patikrinkite, ar matote `azure.yaml`:
```bash
ls
# Tikimasi: README.md, azure.yaml, infra/, src/
```

### 2 žingsnis: Autentifikacija Azure

```bash
azd auth login
```

Atidarys jūsų naršyklę Azure autentifikacijai. Prisijunkite naudodami savo Azure paskyrą.

**✓ Sėkmės patikra**: Turėtumėte matyti:
```
Logged in to Azure.
```

### 3 žingsnis: Inicijuokite aplinką

```bash
azd init
```

Klausimai, kuriuos pamatysite:
- **Aplinkos pavadinimas**: Įveskite trumpą pavadinimą (pvz., `microservices-dev`)
- **Azure prenumerata**: Pasirinkite savo prenumeratą
- **Azure regionas**: Pasirinkite regioną (pvz., `eastus`, `westeurope`)

**✓ Sėkmės patikra**: Turėtumėte matyti:
```
SUCCESS: New project initialized!
```

### 4 žingsnis: Išdiekite infrastruktūrą ir paslaugas

```bash
azd up
```

**Kas vyksta** (užtrunka 8–12 minučių):
1. Sukuriama Container Apps aplinka
2. Sukuriamas Application Insights stebėjimui
3. Kuriamas API vartų konteineris (Node.js)
4. Kuriamas Produktų paslaugos konteineris (Python)
5. Abu konteineriai išdiegti į Azure
6. Suconfiguruojami tinklai ir sveikatos patikros
7. Nustatomas stebėjimas ir žurnalavimas

**✓ Sėkmės patikra**: Turėtumėte matyti:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Laikas**: 8–12 minučių

### 5 žingsnis: Išbandykite diegimą

```bash
# Gauti vartų galinį tašką
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Patikrinti API vartų būklę
curl $GATEWAY_URL/health

# Tikėtinas išvestis:
# {"status":"veikianti","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Išbandykite produktų paslaugą per vartus**:
```bash
# Išvardinti produktus
curl $GATEWAY_URL/api/products

# Tikėtinas rezultatas:
# [
#   {"id":1,"name":"Nešiojamas kompiuteris","price":999.99,"stock":50},
#   {"id":2,"name":"Pelė","price":29.99,"stock":200},
#   {"id":3,"name":"Klaviatūra","price":79.99,"stock":150}
# ]
```

**✓ Sėkmės patikra**: Abu galiniai taškai grąžina JSON duomenis be klaidų.

---

**🎉 Sveikiname!** Jūs išdiegėte mikroservisų architektūrą Azure!

## Projekto struktūra

Visi įgyvendinimo failai yra įtraukti—tai pilnas, veikiančios pavyzdys:

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

**Ką atlieka kiekvienas komponentas:**

**Infrastruktūra (infra/)**:
- `main.bicep`: Orkesruoja visus Azure išteklius ir jų priklausomybes
- `core/container-apps-environment.bicep`: Sukuria Container Apps aplinką ir Azure Container Registry
- `core/monitor.bicep`: Nustato Application Insights paskirstytam žurnalavimui
- `app/*.bicep`: Atskirų container app apibrėžimai su masteliu ir sveikatos patikromis

**API vartai (src/api-gateway/)**:
- Viešai prieinama paslauga, nukreipianti užklausas į galines paslaugas
- Įgyvendina žurnalavimą, klaidų tvarkymą ir užklausų persiuntimą
- Demonstruoja paslaugų tarpusavio HTTP komunikaciją

**Produktų paslauga (src/product-service/)**:
- Vidinė paslauga su produktų katalogu (atmintyje dėl paprastumo)
- REST API su sveikatos patikromis
- Pavyzdys backend mikroserviso šablono

## Paslaugų apžvalga

### API vartai (Node.js/Express)

**Portas**: 8080  
**Prieiga**: Vieša (išorinis ingress)  
**Paskirtis**: Nukreipia atvykusias užklausas į tinkamas galines paslaugas  

**Galiniai taškai**:
- `GET /` - Paslaugos informacija
- `GET /health` - Sveikatos patikros galinis taškas
- `GET /api/products` - Persiunčiama į produktų paslaugą (visų sąrašas)
- `GET /api/products/:id` - Persiunčiama į produktų paslaugą (gauti pagal ID)

**Pagrindinės savybės**:
- Užklausų maršrutizavimas su axios
- Centralizuotas žurnalavimas
- Klaidos tvarkymas ir timeout valdymas
- Paslaugų aptikimas per aplinkos kintamuosius
- Integracija su Application Insights

**Kodo ištrauka** (`src/api-gateway/app.js`):
```javascript
// Vidinė paslaugų komunikacija
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Produktų paslauga (Python/Flask)

**Portas**: 8000  
**Prieiga**: Tik vidinė (nereikia išorinio ingress)  
**Paskirtis**: Tvarko produktų katalogą atmintyje  

**Galiniai taškai**:
- `GET /` - Paslaugos informacija
- `GET /health` - Sveikatos patikros galinis taškas
- `GET /products` - Išvardina visus produktus
- `GET /products/<id>` - Gauti produktą pagal ID

**Pagrindinės savybės**:
- RESTful API su Flask
- Produktų saugykla atmintyje (paprasta, nereikia duomenų bazės)
- Sveikatos stebėjimas su probe'ais
- Struktūrizuotas žurnalavimas
- Integracija su Application Insights

**Duomenų modelis**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**Kodėl tik vidinė?**
Produktų paslauga nėra viešai prieinama. Visos užklausos turi eiti per API vartus, kurie suteikia:
- Saugumą: Kontroliuojamas prieigos taškas
- Lankstumą: Gali keisti backend be poveikio klientams
- Stebėjimą: Centralizuotas užklausų žurnalavimas

## Paslaugų komunikacijos supratimas

### Kaip paslaugos bendrauja tarpusavyje

Šiame pavyzdyje API vartai bendrauja su Produktų paslauga naudodami **vidines HTTP užklausas**:

```javascript
// API vartai (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Atlikti vidinę HTTP užklausą
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Pagrindiniai punktai**:

1. **DNS pagrindu aptikimas**: Container Apps automatiškai teikia DNS vidinėms paslaugoms
   - Produktų paslaugos FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - Supaprastinta kaip: `http://product-service` (Container Apps tai išsprendžia)

2. **Nėra viešo atvėrimo**: Produktų paslauga turi `external: false` Bicep faile
   - Prieinama tik Container Apps aplinkoje
   - Negalima pasiekti iš interneto

3. **Aplinkos kintamieji**: Paslaugų URL įdedami diegimo metu
   - Bicep perduoda vidinį FQDN į vartus
   - Programinėje įrangoje nėra įkoduotų URL

**Analogiška**: Galvokite apie tai kaip apie biuro kambarius. API vartai yra registratūra (viešas taškas), o Produktų paslauga yra biuro kambarys (tik vidinė). Apsilankytojai turi eiti per registratūrą, kad pasiektų bet kurį kambarį.

## Diegimo parinktys

### Pilnas diegimas (rekomenduojama)

```bash
# Diegti infrastruktūrą ir abi paslaugas
azd up
```

Tai diegia:
1. Container Apps aplinką
2. Application Insights
3. Container Registry
4. API vartų konteinerį
5. Produktų paslaugos konteinerį

**Laikas**: 8–12 minučių

### Išdiegti atskirą paslaugą

```bash
# Diegti tik vieną paslaugą (po pradinio azd up)
azd deploy api-gateway

# Arba diegti produktų paslaugą
azd deploy product-service
```

**Naudojimo atvejis**: Kai atnaujinote kodo vienoje paslaugoje ir norite perkrauti tik tą paslaugą.

### Atnaujinti konfigūraciją

```bash
# Pakeisti skalavimo parametrus
azd env set GATEWAY_MAX_REPLICAS 30

# Iš naujo įdiegti su nauja konfigūracija
azd up
```

## Konfigūracija

### Mastelio keitimo konfigūracija

Abi paslaugos yra sukonfiguruotos su HTTP pagrindu veikiančiu automatinio mastelio keitimo mechanizmu savo Bicep failuose:

**API vartai**:
- Min replikų: 2 (visada bent 2 dėl prieinamumo)
- Max replikų: 20
- Mastelio trigeris: 50 vienu metu veikiančių užklausų vienai replikai

**Produktų paslauga**:
- Min replikų: 1 (gali masteliuotis iki nulio, jei reikia)
- Max replikų: 10
- Mastelio trigeris: 100 vienu metu veikiančių užklausų vienai replikai

**Tinkinkite mastelį** (faile `infra/app/*.bicep`):
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

### Išteklių paskirstymas

**API vartai**:
- CPU: 1.0 vCPU
- Atmintis: 2 GiB
- Priežastis: Tvarko visą išorinį srautą

**Produktų paslauga**:
- CPU: 0.5 vCPU
- Atmintis: 1 GiB
- Priežastis: Lengvos atminties operacijos

### Sveikatos patikros

Abi paslaugos turi liveness ir readiness probe'us:

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

**Ką tai reiškia**:
- **Liveness**: Jei sveikatos patikra nepavyksta, Container Apps perkrauna konteinerį
- **Readiness**: Jei nėra paruošta, Container Apps nustoja nukreipti srautą į tą repliką



## Stebėjimas ir matomumas

### Peržiūrėti paslaugų žurnalus

```bash
# Peržiūrėkite žurnalus naudodami azd monitor
azd monitor --logs

# Arba naudokite Azure CLI konkrečioms Container Apps:
# Transliuokite žurnalus iš API Gateway
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# Peržiūrėkite naujausius produkto paslaugos žurnalus
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**Tikėtinas išvestis**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights užklausos

Atidarykite Application Insights Azure portale, tada paleiskite šias užklausas:

**Rasti lėtas užklausas**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Sezono paslaugų tarpusavio skambučius**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Klaidų dažnis pagal paslaugą**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Užklausų kiekis per laiką**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Prieiga prie stebėjimo informacijos skydelio

```bash
# Gauti Application Insights informaciją
azd env get-values | grep APPLICATIONINSIGHTS

# Atidaryti Azure Portal stebėjimą
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Gyvi metrika

1. Eikite į Application Insights Azure portale
2. Spustelėkite "Live Metrics"
3. Matykite realaus laiko užklausas, klaidas ir našumą
4. Išbandykite paleisdami: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Praktiniai užsiėmimai

[Pastaba: Žr. pilnus užsiėmimus aukščiau skiltyje "Practical Exercises" dėl detalių žingsnis po žingsnio pratimų, įskaitant diegimo patikrinimą, duomenų modifikavimą, automatinio mastelio testus, klaidų tvarkymą ir trečios paslaugos pridėjimą.]

## Sąnaudų analizė

### Apskaičiuotos mėnesinės sąnaudos (už šį 2 paslaugų pavyzdį)

| Resource | Configuration | Estimated Cost |
|----------|--------------|----------------|
| API Gateway | 2-20 replicas, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replicas, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic tier | $5 |
| Application Insights | 1-2 GB/month | $5-10 |
| Log Analytics | 1 GB/month | $3 |
| **Total** | | **$58-243/month** |

**Sąnaudų suskirstymas pagal naudojimą**:
- **Mažas srautas** (testavimui/mokymuisi): ~$60/mėn.
- **Vidutinis srautas** (mažai produkcijai): ~$120/mėn.
- **Didelis srautas** (turtingi periodai): ~$240/mėn.

### Patarimai optimizuoti kaštus

1. **Mastelį nustatykite iki nulio vystymuisi**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Naudokite Consumption plan`ą Cosmos DB** (kai jį pridėsite):
   - Mokėkite tik už tai, ką naudojate
   - Nėra minimalaus mokesčio

3. **Nustatykite Application Insights samplingą**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Atrinkti 50 % užklausų
   ```

4. **Išvalykite, kai nenaudojate**:
   ```bash
   azd down
   ```

### Nemokamos pakopos variantai
For learning/testing, consider:
- Use Azure free credits (first 30 days)
- Keep to minimum replicas
- Delete after testing (no ongoing charges)

---

## Cleanup

To avoid ongoing charges, delete all resources:

```bash
azd down --force --purge
```

**Confirmation Prompt**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Type `y` to confirm.

**What Gets Deleted**:
- Container Apps Environment
- Both Container Apps (gateway & product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ Verify Cleanup**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Should return empty.

---

## Expansion Guide: From 2 to 5+ Services

Once you've mastered this 2-service architecture, here's how to expand:

### Phase 1: Add Database Persistence (Next Step)

**Add Cosmos DB for Product Service**:

1. Create `infra/core/cosmos.bicep`:
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

2. Update product service to use Cosmos DB instead of in-memory data

3. Estimated additional cost: ~$25/month (serverless)

### Phase 2: Add Third Service (Order Management)

**Create Order Service**:

1. New folder: `src/order-service/` (Python/Node.js/C#)
2. New Bicep: `infra/app/order-service.bicep`
3. Update API Gateway to route `/api/orders`
4. Add Azure SQL Database for order persistence

**Architecture becomes**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Phase 3: Add Async Communication (Service Bus)

**Implement Event-Driven Architecture**:

1. Add Azure Service Bus: `infra/core/servicebus.bicep`
2. Product Service publishes "ProductCreated" events
3. Order Service subscribes to product events
4. Add Notification Service to process events

**Pattern**: Request/Response (HTTP) + Event-Driven (Service Bus)

### Phase 4: Add User Authentication

**Implement User Service**:

1. Create `src/user-service/` (Go/Node.js)
2. Add Azure AD B2C or custom JWT authentication
3. API Gateway validates tokens
4. Services check user permissions

### Phase 5: Production Readiness

**Add These Components**:
- Azure Front Door (global load balancing)
- Azure Key Vault (secret management)
- Azure Monitor Workbooks (custom dashboards)
- CI/CD Pipeline (GitHub Actions)
- Blue-Green Deployments
- Managed Identity for all services

**Full Production Architecture Cost**: ~$300-1,400/month

---

## Learn More

### Related Documentation
- [Azure Container Apps Documentation](https://learn.microsoft.com/azure/container-apps/)
- [Microservices Architecture Guide](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights for Distributed Tracing](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Next Steps in This Course
- ← Previous: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - Beginner single-container example
- → Next: [AI Integration Guide](../../../../../examples/docs/ai-foundry) - Add AI capabilities
- 🏠 [Course Home](../../README.md)

### Comparison: When to Use What

**Single Container App** (Simple Flask API example):
- ✅ Simple applications
- ✅ Monolithic architecture
- ✅ Fast to deploy
- ❌ Limited scalability
- **Cost**: ~$15-50/month

**Microservices** (This example):
- ✅ Complex applications
- ✅ Independent scaling per service
- ✅ Team autonomy (different services, different teams)
- ❌ More complex to manage
- **Cost**: ~$60-250/month

**Kubernetes (AKS)**:
- ✅ Maximum control and flexibility
- ✅ Multi-cloud portability
- ✅ Advanced networking
- ❌ Requires Kubernetes expertise
- **Cost**: ~$150-500/month minimum

**Recommendation**: Start with Container Apps (this example), move to AKS only if you need Kubernetes-specific features.

---

## Frequently Asked Questions

**Q: Why only 2 services instead of 5+?**  
A: Educational progression. Master the fundamentals (service communication, monitoring, scaling) with a simple example before adding complexity. The patterns you learn here apply to 100-service architectures.

**Q: Can I add more services myself?**  
A: Absolutely! Follow the expansion guide above. Each new service follows the same pattern: create src folder, create Bicep file, update azure.yaml, deploy.

**Q: Is this production-ready?**  
A: It's a solid foundation. For production, add: managed identity, Key Vault, persistent databases, CI/CD pipeline, monitoring alerts, and backup strategy.

**Q: Why not use Dapr or other service mesh?**  
A: Keep it simple for learning. Once you understand native Container Apps networking, you can layer on Dapr for advanced scenarios.

**Q: How do I debug locally?**  
A: Run services locally with Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: Can I use different programming languages?**  
A: Yes! This example shows Node.js (gateway) + Python (product service). You can mix any languages that run in containers.

**Q: What if I don't have Azure credits?**  
A: Use Azure free tier (first 30 days with new accounts) or deploy for short testing periods and delete immediately.

---

> **🎓 Learning Path Summary**: You've learned to deploy a multi-service architecture with automatic scaling, internal networking, centralized monitoring, and production-ready patterns. This foundation prepares you for complex distributed systems and enterprise microservices architectures.

**📚 Course Navigation:**
- ← Previous: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → Next: [Database Integration Example](../../../../../examples/database-app)
- 🏠 [Course Home](../../../README.md)
- 📖 [Container Apps Best Practices](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Atsakomybės apribojimas:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą Co-op Translator (https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipkite dėmesį, kad automatiniai vertimai gali turėti klaidų arba netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Svarbios informacijos atveju rekomenduojamas profesionalus žmogaus vertimas. Mes neatsakome už jokius nesusipratimus ar neteisingas interpretacijas, kylančias dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->