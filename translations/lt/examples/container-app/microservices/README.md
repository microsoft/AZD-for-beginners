# Mikroservisų architektūra - Konteinerių programų pavyzdys

⏱️ **Numatomas laikas**: 25-35 minutės | 💰 **Numatoma kaina**: ~$50-100/mėn. | ⭐ **Sudėtingumas**: Pažengęs

**Supaprastinta, bet funkcionali** mikroservisų architektūra, diegiama Azure Container Apps naudojant AZD CLI. Šis pavyzdys demonstruoja paslaugų tarpusavio komunikaciją, konteinerių orkestraciją ir stebėjimą su praktiniu 2 paslaugų sąrankos pavyzdžiu.

> **📚 Mokymosi metodas**: Šis pavyzdys prasideda nuo minimalios 2 paslaugų architektūros (API Gateway + Backend Service), kurią galite iš tikrųjų įdiegti ir išmokti. Įvaldę šį pagrindą, pateikiame gaires, kaip plėsti iki pilnos mikroservisų ekosistemos.

## Ko išmoksite

Baigę šį pavyzdį, jūs:
- Įdiegsite kelis konteinerius į Azure Container Apps
- Įgyvendinsite paslaugų tarpusavio komunikaciją su vidiniu tinklu
- Konfigūruosite aplinkos pagrindu veikiančią skalę ir sveikatos patikrinimus
- Stebėsite paskirstytas programas naudodami Application Insights
- Suprasite mikroservisų diegimo modelius ir geriausią praktiką
- Išmoksite palaipsniui plėsti nuo paprastos iki sudėtingos architektūros

## Architektūra

### 1 etapas: Ką kuriame (įtraukta į šį pavyzdį)

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
- ✅ Greitai įdiegti ir suprasti (25-35 minutės)
- ✅ Išmokti pagrindinius mikroservisų modelius be sudėtingumo
- ✅ Veikiantis kodas, kurį galite modifikuoti ir eksperimentuoti
- ✅ Mažesnės mokymosi išlaidos (~$50-100/mėn. prieš $300-1400/mėn.)
- ✅ Pasitikėjimo ugdymas prieš pridedant duomenų bazes ir pranešimų eilutes

**Analogija**: Tai kaip mokytis vairuoti. Pradėkite nuo tuščios stovėjimo aikštelės (2 paslaugos), įvaldykite pagrindus, tada pereikite prie miesto eismo (5+ paslaugos su duomenų bazėmis).

### 2 etapas: Ateities plėtra (nuorodų architektūra)

Kai įvaldysite 2 paslaugų architektūrą, galite plėsti:

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

Žr. skyrių „Plėtros vadovas“ pabaigoje, kad gautumėte žingsnis po žingsnio instrukcijas.

## Įtrauktos funkcijos

✅ **Paslaugų atradimas**: Automatinis DNS pagrindu veikiantis atradimas tarp konteinerių  
✅ **Krovos balansavimas**: Įmontuotas krovos balansavimas tarp replikų  
✅ **Automatinis skalavimas**: Nepriklausomas skalavimas kiekvienai paslaugai pagal HTTP užklausas  
✅ **Sveikatos stebėjimas**: Gyvybingumo ir pasirengimo zondai abiem paslaugoms  
✅ **Paskirstytas žurnalavimas**: Centralizuotas žurnalavimas su Application Insights  
✅ **Vidinis tinklas**: Saugus paslaugų tarpusavio ryšys  
✅ **Konteinerių orkestracija**: Automatinis diegimas ir skalavimas  
✅ **Atnaujinimai be prastovų**: Palaipsniui atnaujinimai su versijų valdymu  

## Būtinos sąlygos

### Reikalingi įrankiai

Prieš pradėdami, įsitikinkite, kad turite šiuos įrankius:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (1.0.0 ar naujesnė versija)
   ```bash
   azd version
   # Tikėtinas rezultatas: azd versija 1.0.0 arba naujesnė
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (2.50.0 ar naujesnė versija)
   ```bash
   az --version
   # Tikėtinas rezultatas: azure-cli 2.50.0 arba naujesnė
   ```

3. **[Docker](https://www.docker.com/get-started)** (vietiniam kūrimui/testavimui - neprivaloma)
   ```bash
   docker --version
   # Tikėtinas rezultatas: Docker versija 20.10 arba naujesnė
   ```

### Azure reikalavimai

- Aktyvi **Azure prenumerata** ([sukurkite nemokamą paskyrą](https://azure.microsoft.com/free/))
- Leidimai kurti išteklius jūsų prenumeratoje
- **Contributor** rolė prenumeratoje arba išteklių grupėje

### Žinių reikalavimai

Tai yra **pažengusio lygio** pavyzdys. Turėtumėte:
- Baigti [Paprasto Flask API pavyzdį](../../../../../examples/container-app/simple-flask-api) 
- Turėti pagrindinį mikroservisų architektūros supratimą
- Susipažinti su REST API ir HTTP
- Suprasti konteinerių koncepcijas

**Naujokas Container Apps?** Pradėkite nuo [Paprasto Flask API pavyzdžio](../../../../../examples/container-app/simple-flask-api), kad išmoktumėte pagrindus.

## Greitas startas (žingsnis po žingsnio)

### 1 žingsnis: Klonuokite ir pereikite

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Sėkmės patikrinimas**: Įsitikinkite, kad matote `azure.yaml`:
```bash
ls
# Tikimasi: README.md, azure.yaml, infra/, src/
```

### 2 žingsnis: Autentifikuokitės su Azure

```bash
azd auth login
```

Tai atidaro jūsų naršyklę Azure autentifikacijai. Prisijunkite su savo Azure kredencialais.

**✓ Sėkmės patikrinimas**: Turėtumėte matyti:
```
Logged in to Azure.
```

### 3 žingsnis: Inicializuokite aplinką

```bash
azd init
```

**Klausimai, kuriuos matysite**:
- **Aplinkos pavadinimas**: Įveskite trumpą pavadinimą (pvz., `microservices-dev`)
- **Azure prenumerata**: Pasirinkite savo prenumeratą
- **Azure vieta**: Pasirinkite regioną (pvz., `eastus`, `westeurope`)

**✓ Sėkmės patikrinimas**: Turėtumėte matyti:
```
SUCCESS: New project initialized!
```

### 4 žingsnis: Įdiekite infrastruktūrą ir paslaugas

```bash
azd up
```

**Kas vyksta** (trunka 8-12 minučių):
1. Sukuriama Container Apps aplinka
2. Sukuriama Application Insights stebėjimui
3. Sukuriamas API Gateway konteineris (Node.js)
4. Sukuriamas Product Service konteineris (Python)
5. Abu konteineriai diegiami į Azure
6. Konfigūruojamas tinklas ir sveikatos patikrinimai
7. Nustatomas stebėjimas ir žurnalavimas

**✓ Sėkmės patikrinimas**: Turėtumėte matyti:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Laikas**: 8-12 minučių

### 5 žingsnis: Išbandykite diegimą

```bash
# Gauti šliuzo galinį tašką
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Patikrinti API šliuzo būklę
curl $GATEWAY_URL/health

# Tikėtinas rezultatas:
# {"status":"sveikas","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Išbandykite produktų paslaugą per gateway**:
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

**✓ Sėkmės patikrinimas**: Abu galiniai taškai grąžina JSON duomenis be klaidų.

---

**🎉 Sveikiname!** Jūs įdiegėte mikroservisų architektūrą į Azure!

## Projekto struktūra

Visi įgyvendinimo failai yra įtraukti—tai yra pilnas, veikiantis pavyzdys:

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

**Ką daro kiekvienas komponentas:**

**Infrastruktūra (infra/)**:
- `main.bicep`: Orkestruoja visus Azure išteklius ir jų priklausomybes
- `core/container-apps-environment.bicep`: Sukuria Container Apps aplinką ir Azure Container Registry
- `core/monitor.bicep`: Nustato Application Insights paskirstytam žurnalavimui
- `app/*.bicep`: Individualių konteinerių programų apibrėžimai su skalavimu ir sveikatos patikrinimais

**API Gateway (src/api-gateway/)**:
- Viešai prieinama paslauga, nukreipianti užklausas į galines paslaugas
- Įgyvendina žurnalavimą, klaidų tvarkymą ir užklausų persiuntimą
- Demonstruoja paslaugų tarpusavio HTTP komunikaciją

**Product Service (src/product-service/)**:
- Vidinė paslauga su produktų katalogu (paprasta, be duomenų bazės)
- REST API su sveikatos patikrinimais
- Galinės mikroservisų paslaugos modelio pavyzdys

## Paslaugų apžvalga

### API Gateway (Node.js/Express)

**Portas**: 8080  
**Prieiga**: Vieša (išorinis įėjimas)  
**Tikslas**: Nukreipia gaunamas užklausas į tinkamas galines paslaugas  

**Galiniai taškai**:
- `GET /` - Paslaugos informacija
- `GET /health` - Sveikatos patikrinimo galinis taškas
- `GET /api/products` - Persiuntimas į produktų paslaugą (visų sąrašas)
- `GET /api/products/:id` - Persiuntimas į produktų paslaugą (pagal ID)

**Pagrindinės funkcijos**:
- Užklausų nukreipimas su axios
- Centralizuotas žurnalavimas
- Klaidų tvarkymas ir laiko valdymas
- Paslaugų atradimas per aplinkos kintamuosius
- Application Insights integracija

**Kodo akcentas** (`src/api-gateway/app.js`):
```javascript
// Vidinė paslaugų komunikacija
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Portas**: 8000  
**Prieiga**: Tik vidinė (be išorinio įėjimo)  
**Tikslas**: Valdo produktų katalogą su paprastais duomenimis  

**Galiniai taškai**:
- `GET /` - Paslaugos informacija
- `GET /health` - Sveikatos patikrinimo galinis taškas
- `GET /products` - Visų produktų sąrašas
- `GET /products/<id>` - Gauti produktą pagal ID

**Pagrindinės funkcijos**:
- RESTful API su Flask
- Paprastas produktų saugojimas (be duomenų bazės)
- Sveikatos stebėjimas su zondais
- Struktūrizuotas žurnalavimas
- Application Insights integracija

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

**Kodėl tik vidinė prieiga?**
Produktų paslauga nėra viešai prieinama. Visos užklausos turi eiti per API Gateway, kuris užtikrina:
- Saugumą: Kontroliuojamas prieigos taškas
- Lankstumą: Galima keisti galinę dalį nepaveikiant klientų
- Stebėjimą: Centralizuotas užklausų žurnalavimas

## Paslaugų komunikacijos supratimas

### Kaip paslaugos bendrauja tarpusavyje

Šiame pavyzdyje API Gateway bendrauja su Product Service naudodamas **vidinius HTTP skambučius**:

```javascript
// API Gateway (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Atlikti vidinį HTTP užklausą
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Pagrindiniai punktai**:

1. **DNS pagrindu veikiantis atradimas**: Container Apps automatiškai suteikia DNS vidinėms paslaugoms
   - Product Service FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - Supaprastinta kaip: `http://product-service` (Container Apps tai išsprendžia)

2. **Be viešos prieigos**: Product Service turi `external: false` Bicep faile
   - Prieinama tik Container Apps aplinkoje
   - Negalima pasiekti iš interneto

3. **Aplinkos kintamieji**: Paslaugų URL įterpiami diegimo metu
   - Bicep perduoda vidinį FQDN į gateway
   - Nėra kietai užkoduotų URL programos kode

**Analogija**: Tai kaip biuro kambariai. API Gateway yra registratūra (viešai prieinama), o Product Service yra biuro kambarys (tik vidinis). Lankytojai turi eiti per registratūrą, kad pasiektų bet kurį kambarį.

## Diegimo parinktys

### Pilnas diegimas (rekomenduojama)

```bash
# Įdiegti infrastruktūrą ir abi paslaugas
azd up
```

Tai įdiegia:
1. Container Apps aplinką
2. Application Insights
3. Container Registry
4. API Gateway konteinerį
5. Product Service konteinerį

**Laikas**: 8-12 minučių

### Diegti atskirą paslaugą

```bash
# Įdiegti tik vieną paslaugą (po pradinio azd up)
azd deploy api-gateway

# Arba įdiegti produkto paslaugą
azd deploy product-service
```

**Naudojimo atvejis**: Kai atnaujinote kodą vienoje paslaugoje ir norite iš naujo įdiegti tik tą paslaugą.

### Konfigūracijos atnaujinimas

```bash
# Pakeisti mastelio parametrus
azd env set GATEWAY_MAX_REPLICAS 30

# Perdiegti su nauja konfigūracija
azd up
```

## Konfigūracija

### Skalavimo konfigūracija

Abi paslaugos yra konfigūruotos su HTTP pagrindu veikiančiu automatinio skalavimo mechanizmu jų Bicep failuose:

**API Gateway**:
- Minimali replikų skaičius: 2 (visada bent 2 dėl prieinamumo)
- Maksimali replikų skaičius: 20
- Skalavimo trigeris: 50 vienu metu vykdomų užklausų per repliką

**Product Service**:
- Minimali replikų skaičius: 1 (gali skalauti iki nulio, jei reikia)
- Maksimali replikų skaičius: 10
- Skalavimo trigeris: 100 vienu metu vykdomų užklausų per repliką

**Skalavimo pritaikymas** (faile `infra/app/*.bicep`):
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

**API Gateway**:
- CPU: 1.0 vCPU
- Atmintis: 2 GiB
- Priežastis: Tvarko visą išorinį srautą

**Product Service**:
- CPU: 0.5 vCPU
- Atmintis: 1 GiB
- Priežastis: Lengvi operacijos su paprastais duomenimis

### Sveikatos patikrinimai

Abi paslaugos apima gyvybingumo ir pasirengimo zondus:

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
- **Gyvybingumas**: Jei sveikatos patikrinimas nepavyksta, Container Apps iš naujo paleidžia konteinerį
- **Pasirengimas**: Jei nepasirengęs, Container Apps sustabdo srauto nukreipimą į tą repliką

## Stebėjimas ir stebėjimo galimybės

### Peržiūrėti paslaugų žurnalus

```bash
# Transliuoti žurnalus iš API Gateway
azd logs api-gateway --follow

# Peržiūrėti naujausius produktų paslaugos žurnalus
azd logs product-service --tail 100

# Peržiūrėti visus abiejų paslaugų žurnalus
azd logs --follow
```

**Tikėtinas rezultatas**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights užklausos

Prisijunkite prie Application Insights Azure portale, tada vykdykite šias užklausas:

**Rasti lėtas užklausas**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Sekti paslaugų tarpusavio skambučius**:
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

**Užklausų apimtis laikui bėgant**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Prieiga prie stebėjimo skydelio

```bash
# Gauti „Application Insights“ informaciją
azd env get-values | grep APPLICATIONINSIGHTS

# Atidaryti „Azure Portal“ stebėjimą
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Tiesioginiai metrikos duomenys

1. Eikite į Application Insights Azure portale
2. Spustelėkite „Live Metrics“
3. Matykite realaus laiko užklausas, klaidas ir našumą
4. Testuokite vykdydami: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Praktiniai pratimai

[Pastaba: Žr. visus pratimus aukščiau skyriuje „Praktiniai pratimai“, kad gautumėte išsamius žingsnis po žingsnio pratimus, įskaitant diegimo patikrinimą, duomenų modifikavimą, automatinio skalavimo testus, klaidų tvarkymą ir trečios paslaugos pridėjimą.]

## Kainų analizė

### Numatomos mėnesinės išlaidos (šiam 2 paslaugų pavyzdžiui)

| Išteklius | Konfigūracija | Numatomos išlaidos |
|----------|--------------|----------------|
| API Gateway | 2-20 replikų, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replikų, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Pagrind
Mokymuisi/testavimui apsvarstykite:
- Naudokite nemokamus „Azure“ kreditus (pirmas 30 dienų)
- Laikykitės minimalaus replikų skaičiaus
- Ištrinkite po testavimo (kad nebūtų nuolatinių išlaidų)

---

## Valymas

Kad išvengtumėte nuolatinių išlaidų, ištrinkite visus resursus:

```bash
azd down --force --purge
```

**Patvirtinimo užklausa**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Įveskite `y`, kad patvirtintumėte.

**Kas bus ištrinta**:
- „Container Apps“ aplinka
- Abi „Container Apps“ (gateway ir produktų paslauga)
- „Container Registry“
- „Application Insights“
- „Log Analytics Workspace“
- Resursų grupė

**✓ Patikrinkite valymą**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Turėtų grąžinti tuščią rezultatą.

---

## Plėtros vadovas: nuo 2 iki 5+ paslaugų

Kai įvaldysite šią 2 paslaugų architektūrą, štai kaip ją išplėsti:

### 1 etapas: Pridėkite duomenų bazės išsaugojimą (kitas žingsnis)

**Pridėkite „Cosmos DB“ produktų paslaugai**:

1. Sukurkite `infra/core/cosmos.bicep`:
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

2. Atnaujinkite produktų paslaugą, kad naudotų „Cosmos DB“ vietoj atminties duomenų

3. Numatoma papildoma kaina: ~25 USD/mėn. (serverless)

### 2 etapas: Pridėkite trečią paslaugą (užsakymų valdymas)

**Sukurkite užsakymų paslaugą**:

1. Naujas aplankas: `src/order-service/` (Python/Node.js/C#)
2. Naujas „Bicep“ failas: `infra/app/order-service.bicep`
3. Atnaujinkite API Gateway, kad nukreiptų `/api/orders`
4. Pridėkite „Azure SQL Database“ užsakymų išsaugojimui

**Architektūra tampa**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### 3 etapas: Pridėkite asinchroninį ryšį (Service Bus)

**Įgyvendinkite įvykių valdomą architektūrą**:

1. Pridėkite „Azure Service Bus“: `infra/core/servicebus.bicep`
2. Produktų paslauga skelbia „ProductCreated“ įvykius
3. Užsakymų paslauga prenumeruoja produktų įvykius
4. Pridėkite pranešimų paslaugą įvykiams apdoroti

**Modelis**: Užklausa/atsakymas (HTTP) + įvykių valdymas (Service Bus)

### 4 etapas: Pridėkite vartotojų autentifikavimą

**Įgyvendinkite vartotojų paslaugą**:

1. Sukurkite `src/user-service/` (Go/Node.js)
2. Pridėkite „Azure AD B2C“ arba pasirinktą JWT autentifikavimą
3. API Gateway tikrina tokenus
4. Paslaugos tikrina vartotojų teises

### 5 etapas: Paruošimas gamybai

**Pridėkite šiuos komponentus**:
- „Azure Front Door“ (globalus apkrovos balansavimas)
- „Azure Key Vault“ (slaptų duomenų valdymas)
- „Azure Monitor Workbooks“ (individualūs prietaisų skydeliai)
- CI/CD pipeline (GitHub Actions)
- Blue-Green diegimai
- Valdomos tapatybės visoms paslaugoms

**Pilnos gamybos architektūros kaina**: ~300–1,400 USD/mėn.

---

## Sužinokite daugiau

### Susijusi dokumentacija
- [Azure Container Apps dokumentacija](https://learn.microsoft.com/azure/container-apps/)
- [Mikropaslaugų architektūros vadovas](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights paskirstytam sekimui](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Kiti šio kurso žingsniai
- ← Ankstesnis: [Paprastas Flask API](../../../../../examples/container-app/simple-flask-api) - Pradedančiųjų vieno konteinerio pavyzdys
- → Kitas: [AI integracijos vadovas](../../../../../examples/docs/ai-foundry) - Pridėkite AI galimybes
- 🏠 [Kurso pradžia](../../README.md)

### Palyginimas: kada naudoti ką

**Vieno konteinerio programa** (Paprasto Flask API pavyzdys):
- ✅ Paprastos programos
- ✅ Monolitinė architektūra
- ✅ Greitas diegimas
- ❌ Ribotas mastelio keitimas
- **Kaina**: ~15–50 USD/mėn.

**Mikropaslaugos** (Šis pavyzdys):
- ✅ Sudėtingos programos
- ✅ Nepriklausomas paslaugų mastelio keitimas
- ✅ Komandų autonomija (skirtingos paslaugos, skirtingos komandos)
- ❌ Sudėtingesnis valdymas
- **Kaina**: ~60–250 USD/mėn.

**Kubernetes (AKS)**:
- ✅ Maksimalus valdymas ir lankstumas
- ✅ Multi-cloud perkeliamumas
- ✅ Pažangus tinklų kūrimas
- ❌ Reikalingos Kubernetes žinios
- **Kaina**: ~150–500 USD/mėn. minimaliai

**Rekomendacija**: Pradėkite nuo „Container Apps“ (šis pavyzdys), pereikite prie AKS tik tada, jei jums reikia specifinių Kubernetes funkcijų.

---

## Dažniausiai užduodami klausimai

**K: Kodėl tik 2 paslaugos, o ne 5+?**  
A: Mokymosi progresija. Įvaldykite pagrindus (paslaugų komunikacija, stebėjimas, mastelio keitimas) su paprastu pavyzdžiu prieš pridėdami sudėtingumą. Šioje pamokoje išmokti modeliai taikomi ir 100 paslaugų architektūroms.

**K: Ar galiu pats pridėti daugiau paslaugų?**  
A: Žinoma! Sekite aukščiau pateiktą plėtros vadovą. Kiekviena nauja paslauga seka tą patį modelį: sukurkite src aplanką, sukurkite Bicep failą, atnaujinkite azure.yaml, diekite.

**K: Ar tai paruošta gamybai?**  
A: Tai tvirta bazė. Gamybai pridėkite: valdomą tapatybę, Key Vault, nuolatines duomenų bazes, CI/CD pipeline, stebėjimo įspėjimus ir atsarginių kopijų strategiją.

**K: Kodėl nenaudoti Dapr ar kitų paslaugų tinklų?**  
A: Supaprastinkite mokymuisi. Kai suprasite natūralų „Container Apps“ tinklų kūrimą, galėsite pridėti Dapr sudėtingesniems scenarijams.

**K: Kaip derinti lokaliai?**  
A: Paleiskite paslaugas lokaliai su Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**K: Ar galiu naudoti skirtingas programavimo kalbas?**  
A: Taip! Šiame pavyzdyje parodyta Node.js (gateway) + Python (produktų paslauga). Galite maišyti bet kokias kalbas, kurios veikia konteineriuose.

**K: Ką daryti, jei neturiu „Azure“ kreditų?**  
A: Naudokite „Azure“ nemokamą planą (pirmas 30 dienų su naujomis paskyromis) arba diekite trumpiems testavimo laikotarpiams ir ištrinkite iškart.

---

> **🎓 Mokymosi kelio santrauka**: Išmokote diegti kelių paslaugų architektūrą su automatiniu mastelio keitimu, vidiniu tinklų kūrimu, centralizuotu stebėjimu ir gamybai paruoštais modeliais. Ši bazė paruošia jus sudėtingoms paskirstytoms sistemoms ir įmonių mikropaslaugų architektūroms.

**📚 Kurso navigacija:**
- ← Ankstesnis: [Paprastas Flask API](../../../../../examples/container-app/simple-flask-api)
- → Kitas: [Duomenų bazės integracijos pavyzdys](../../../../../examples/database-app)
- 🏠 [Kurso pradžia](../../README.md)
- 📖 [Container Apps geriausios praktikos](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama naudoti profesionalų žmogaus vertimą. Mes neprisiimame atsakomybės už nesusipratimus ar neteisingus interpretavimus, atsiradusius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->