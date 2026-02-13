# Microservices arhitektura - Primjer Container App

⏱️ **Procijenjeno vrijeme**: 25-35 minuta | 💰 **Procijenjeni trošak**: ~$50-100/mjesečno | ⭐ **Složenost**: Napredno

**Pojednostavljena ali funkcionalna** mikroservisna arhitektura postavljena na Azure Container Apps koristeći AZD CLI. Ovaj primjer prikazuje komunikaciju između servisa, orkestraciju kontejnera i nadzor s praktičnim postavom od 2 servisa.

> **📚 Pristup učenju**: Ovaj primjer započinje minimalnom arhitekturom od 2 servisa (API Gateway + Backend servis) koju možete zapravo postaviti i iz koje možete učiti. Nakon savladavanja ove osnove, pružamo smjernice za širenje na potpunu mikroservisnu ekosustav.

## Što ćete naučiti

Dovršetkom ovog primjera, naučit ćete:
- Postaviti više kontejnera na Azure Container Apps
- Implementirati komunikaciju između servisa s internom mrežom
- Konfigurirati skaliranje temeljeno na okruženju i health checkove
- Nadzirati distribuirane aplikacije pomoću Application Insights
- Razumjeti obrasce i najbolje prakse za postavljanje mikroservisa
- Naučiti postupno širenje od jednostavnih do složenih arhitektura

## Arhitektura

### Faza 1: Što gradimo (uključeno u ovaj primjer)

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

**Zašto početi jednostavno?**
- ✅ Brza postava i razumijevanje (25-35 minuta)
- ✅ Naučite osnovne obrasce mikroservisa bez složenosti
- ✅ Funkcionalni kod koji možete mijenjati i eksperimentirati
- ✅ Niži trošak za učenje (~50-100 USD/mjesečno vs 300-1400 USD/mjesečno)
- ✅ Izgradnja samopouzdanja prije dodavanja baza podataka i redova poruka

**Analogiija**: Zamislite ovo kao učenje vožnje. Počinjete na praznom parkingu (2 servisa), savladate osnove, zatim prelazite na gradski promet (5+ servisa s bazama podataka).

### Faza 2: Buduće širenje (Referentna arhitektura)

Kad savladate arhitekturu s 2 servisa, možete proširiti na:

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

Pogledajte odjeljak "Vodič za širenje" na kraju za detaljne upute korak-po-korak.

## Uključene značajke

✅ **Otkriće servisa**: Automatsko DNS otkrivanje između kontejnera  
✅ **Ravnoteža opterećenja**: Ugrađeno balansiranje opterećenja preko replika  
✅ **Automatsko skaliranje**: Neovisno skaliranje po servisu temeljeno na HTTP zahtjevima  
✅ **Nadzor zdravlja**: Probe za aktivnost i spremnost za oba servisa  
✅ **Distribuirano evidentiranje**: Centralizirano evidentiranje uz Application Insights  
✅ **Interna mreža**: Sigurna komunikacija između servisa  
✅ **Orkestracija kontejnera**: Automatsko postavljanje i skaliranje  
✅ **Ažuriranja bez zastoja**: Rolling updates s upravljanjem revizijama  

## Preduvjeti

### Potrebni alati

Prije početka provjerite imate li instalirane ove alate:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (verzija 1.0.0 ili viša)  
   ```bash
   azd version
   # Očekivani izlaz: azd verzija 1.0.0 ili novija
   ```
  
2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (verzija 2.50.0 ili viša)  
   ```bash
   az --version
   # Očekivani izlaz: azure-cli 2.50.0 ili noviji
   ```
  
3. **[Docker](https://www.docker.com/get-started)** (za lokalni razvoj/testiranje - opcionalno)  
   ```bash
   docker --version
   # Očekivani izlaz: Docker verzija 20.10 ili novija
   ```

### Azure zahtjevi

- Aktivna **Azure pretplata** ([napravite besplatan račun](https://azure.microsoft.com/free/))
- Dozvole za kreiranje resursa u pretplati
- Uloga **Contributor** na pretplati ili grupi resursa

### Potrebno znanje

Ovo je **napredni** primjer. Trebali biste:
- Završiti [Jednostavan Flask API primjer](../../../../../examples/container-app/simple-flask-api)  
- Imati osnovno razumijevanje mikroservisne arhitekture
- Poznavati REST API-je i HTTP
- Razumjeti koncepte kontejnera

**Novi u Container Apps?** Počnite prvo s [Jednostavnim Flask API primjerom](../../../../../examples/container-app/simple-flask-api) za učenje osnova.

## Brzi početak (korak-po-korak)

### Korak 1: Klonirajte i navigirajte

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```
  
**✓ Provjera uspjeha**: Provjerite vidite li `azure.yaml`:  
```bash
ls
# Očekivano: README.md, azure.yaml, infra/, src/
```
  
### Korak 2: Autentifikacija s Azureom

```bash
azd auth login
```
  
Otvorit će se vaš preglednik za Azure autentifikaciju. Prijavite se s Azure vjerodajnicama.

**✓ Provjera uspjeha**: Trebali biste vidjeti:  
```
Logged in to Azure.
```
  
### Korak 3: Inicijalizirajte okruženje

```bash
azd init
```
  
**Upiti koje ćete vidjeti**:
- **Naziv okruženja**: Unesite kratki naziv (npr. `microservices-dev`)
- **Azure pretplata**: Odaberite svoju pretplatu
- **Azure lokacija**: Odaberite regiju (npr. `eastus`, `westeurope`)

**✓ Provjera uspjeha**: Trebali biste vidjeti:  
```
SUCCESS: New project initialized!
```
  
### Korak 4: Postavite infrastrukturu i servise

```bash
azd up
```
  
**Što se događa** (trajanje 8-12 minuta):
1. Kreira se Container Apps okruženje
2. Kreira se Application Insights za nadzor
3. Gradi se API Gateway kontejner (Node.js)
4. Gradi se Product Service kontejner (Python)
5. Postavljaju se oba kontejnera na Azure
6. Konfigurira se mreža i health checkovi
7. Postavlja se nadzor i evidencija

**✓ Provjera uspjeha**: Trebali biste vidjeti:  
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```
  
**⏱️ Vrijeme**: 8-12 minuta

### Korak 5: Testirajte postavljanje

```bash
# Dohvati krajnju točku gatewaya
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Testiraj zdravlje API Gatewaya
curl $GATEWAY_URL/health

# Očekivani izlaz:
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```
  
**Testirajte product servis preko gatewaya**:  
```bash
# Popis proizvoda
curl $GATEWAY_URL/api/products

# Očekivani izlaz:
# [
#   {"id":1,"name":"Laptop","price":999.99,"stock":50},
#   {"id":2,"name":"Miš","price":29.99,"stock":200},
#   {"id":3,"name":"Tipkovnica","price":79.99,"stock":150}
# ]
```
  
**✓ Provjera uspjeha**: Oba krajnja mjesta vraćaju JSON podatke bez pogrešaka.

---

**🎉 Čestitamo!** Postavili ste mikroservisnu arhitekturu na Azure!

## Struktura projekta

Svi implementacijski fajlovi su uključeni – ovo je kompletan, funkcionalan primjer:

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
  
**Što svaki komponenta radi:**

**Infrastruktura (infra/)**:  
- `main.bicep`: Orkestrira sve Azure resurse i njihove ovisnosti  
- `core/container-apps-environment.bicep`: Kreira Container Apps okruženje i Azure Container Registry  
- `core/monitor.bicep`: Postavlja Application Insights za distribuirano evidentiranje  
- `app/*.bicep`: Definicije pojedinačnih container appsa s konfiguracijama skaliranja i health checkova  

**API Gateway (src/api-gateway/)**:  
- Javni servis koji usmjerava zahtjeve na backend servise  
- Implementira logiranje, rukovanje pogreškama i prosljeđivanje zahtjeva  
- Demonstrira HTTP komunikaciju između servisa  

**Product Service (src/product-service/)**:  
- Interni servis s katalogom proizvoda (za jednostavnost u memoriji)  
- REST API s health checkovima  
- Primjer obrasca backend mikroservisa  

## Pregled servisa

### API Gateway (Node.js/Express)

**Port**: 8080  
**Pristup**: Javni (vanjski ulaz)  
**Svrha**: Usmjerava dolazne zahtjeve na odgovarajuće backend servise  

**Krajnje točke**:
- `GET /` - Informacije o servisu
- `GET /health` - Endpoint za health check
- `GET /api/products` - Prosljeđuje prema product servisu (popis svih)
- `GET /api/products/:id` - Prosljeđuje prema product servisu (dohvati po ID-u)

**Ključne značajke**:
- Usmjeravanje zahtjeva pomoću axiosa
- Centralizirano logiranje
- Rukovanje pogreškama i timeout upravljanje
- Otkriće servisa putem varijabli okoline
- Integracija Application Insights

**Istaknuti kod** (`src/api-gateway/app.js`):  
```javascript
// Interna komunikacija usluge
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```
  
### Product Service (Python/Flask)

**Port**: 8000  
**Pristup**: Interni samo (bez vanjskog ulaza)  
**Svrha**: Upravljanje katalogom proizvoda s podacima u memoriji  

**Krajnje točke**:
- `GET /` - Informacije o servisu
- `GET /health` - Endpoint za health check
- `GET /products` - Popis svih proizvoda
- `GET /products/<id>` - Dohvati proizvod po ID-u

**Ključne značajke**:
- RESTful API s Flaskom
- Pohrana proizvoda u memoriji (jednostavno, bez baze)
- Nadzor zdravlja pomoću health probeova
- Struktuirano logiranje
- Integracija Application Insights

**Model podataka**:  
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```
  
**Zašto samo interna?**  
Product servis nije dostupan javno. Svi zahtjevi moraju ići kroz API Gateway koji pruža:  
- Sigurnost: kontrolirana točka pristupa  
- Fleksibilnost: backend se može mijenjati bez utjecaja na klijente  
- Nadzor: centralizirano evidentiranje zahtjeva  

## Razumijevanje komunikacije servisa

### Kako servisi komuniciraju

U ovom primjeru API Gateway komunicira s Product servisom koristeći **internu HTTP komunikaciju**:

```javascript
// API Gateway (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Napravi interni HTTP zahtjev
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```
  
**Ključne točke**:

1. **DNS otkrivanje**: Container Apps automatski pruža DNS za interne servise  
   - Product Service FQDN: `product-service.internal.<environment>.azurecontainerapps.io`  
   - Jednostavnije: `http://product-service` (Container Apps to rješava)  

2. **Nema javne izloženosti**: Product Service ima `external: false` u Bicepu  
   - Dostupan samo unutar Container Apps okruženja  
   - Nije dostupan s interneta  

3. **Varijable okoline**: URL adrese servisa se ubacuju u vrijeme postavljanja  
   - Bicep prosljeđuje interne FQDN-ove gatewayu  
   - Nema hardkodiranih URL-ova u aplikacijskom kodu  

**Analogiija**: Zamislite ovo kao poslovne urede. API Gateway je recepcija (javni ulaz), a Product Service je ured (samo interni pristup). Posjetitelji moraju ići preko recepcije da bi došli do ureda.

## Opcije postavljanja

### Potpuno postavljanje (preporučeno)

```bash
# Implementirajte infrastrukturu i obje usluge
azd up
```
  
Ovo postavlja:  
1. Container Apps okruženje  
2. Application Insights  
3. Container Registry  
4. API Gateway kontejner  
5. Product Service kontejner  

**Vrijeme**: 8-12 minuta

### Postavljanje pojedinačnog servisa

```bash
# Postavite samo jednu uslugu (nakon početnog azd up)
azd deploy api-gateway

# Ili postavite uslugu proizvoda
azd deploy product-service
```
  
**Slučaj korištenja**: Kad ste promijenili kod jednog servisa i želite ponovno postaviti samo taj servis.

### Ažuriranje konfiguracije

```bash
# Promijeni parametre skaliranja
azd env set GATEWAY_MAX_REPLICAS 30

# Ponovno implementiraj s novom konfiguracijom
azd up
```
  
## Konfiguracija

### Konfiguracija skaliranja

Oba servisa su konfigurirana za HTTP bazirano automatsko skaliranje u njihovim Bicep datotekama:

**API Gateway**:
- Minimalno replika: 2 (uvijek barem 2 zbog dostupnosti)
- Maksimalno replika: 20
- Okidač skaliranja: 50 istovremenih zahtjeva po replici

**Product Service**:
- Minimalno replika: 1 (može skalirati na nulu ako je potrebno)
- Maksimalno replika: 10
- Okidač skaliranja: 100 istovremenih zahtjeva po replici

**Prilagodba skaliranja** (u `infra/app/*.bicep`):  
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
  
### Dodjela resursa

**API Gateway**:
- CPU: 1.0 vCPU
- Memorija: 2 GiB
- Razlog: Rukuje svime što dolazi izvana

**Product Service**:
- CPU: 0.5 vCPU
- Memorija: 1 GiB
- Razlog: Lagane operacije u memoriji

### Health checkovi

Oba servisa uključuju liveness i readiness probeove:

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
  
**Što to znači**:
- **Liveness**: Ako health check ne uspije, Container Apps ponovno pokreće kontejner  
- **Readiness**: Ako servis nije spreman, Container Apps prestaje usmjeravati promet toj replici  

## Nadzor i promatranje

### Pregledajte zapisnike servisa

```bash
# Pogledajte zapise pomoću azd monitor
azd monitor --logs

# Ili koristite Azure CLI za određene Container Apps:
# Prikaz prijenosa zapisa iz API Gateway
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# Pogledajte nedavne zapise usluge proizvoda
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```
  
**Očekivani izlaz**:  
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```
  
### Upiti za Application Insights

Pristupite Application Insights u Azure portalu, zatim pokrenite ove upite:

**Pronađi spore zahtjeve**:  
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```
  
**Praćenje poziva između servisa**:  
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```
  
**Stopa pogrešaka po servisu**:  
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```
  
**Obujam zahtjeva tijekom vremena**:  
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```
  
### Pristup nadzornoj ploči

```bash
# Dohvati detalje Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Otvori Azure Portal za praćenje
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```
  
### Live Metrics

1. Otvorite Application Insights u Azure portalu  
2. Kliknite "Live Metrics"  
3. Vidite zahtjeve u realnom vremenu, greške i performanse  
4. Testirajte pokretanjem: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Praktične vježbe

[Napomena: Detaljni korak-po-korak praktikum možete pronaći u odjeljku "Praktične vježbe" gore koji uključuje verifikaciju postavljanja, izmjenu podataka, testove automatskog skaliranja, rukovanje greškama i dodavanje trećeg servisa.]

## Analiza troškova

### Procijenjeni mjesečni troškovi (za ovaj primjer s 2 servisa)

| Resurs          | Konfiguracija                    | Procijenjeni trošak |
|-----------------|---------------------------------|---------------------|
| API Gateway     | 2-20 replika, 1 vCPU, 2 GB RAM  | $30-150             |
| Product Service | 1-10 replika, 0.5 vCPU, 1 GB RAM| $15-75              |
| Container Registry | Osnovni paket                 | $5                  |
| Application Insights | 1-2 GB/mjesečno             | $5-10               |
| Log Analytics    | 1 GB/mjesečno                   | $3                  |
| **Ukupno**      |                                 | **$58-243/mjesečno**|

**Razrada troškova po korištenju**:  
- **Lagani promet** (testiranje/učenje): ~60 USD/mjesečno  
- **Umjereni promet** (mala produkcija): ~120 USD/mjesečno  
- **Visoki promet** (zauzeti periodi): ~240 USD/mjesečno  

### Savjeti za optimizaciju troškova

1. **Skalirajte na nulu za razvoj**:  
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```
  
2. **Koristite Consumption Plan za Cosmos DB** (kad ga dodate):  
   - Plaćajte samo za ono što koristite  
   - Bez minimalne naknade  

3. **Postavite uzorkovanje u Application Insights**:  
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Uzmite uzorak 50% zahtjeva
   ```
  
4. **Očistite kad nije potrebno**:  
   ```bash
   azd down
   ```
  
### Opcije besplatnog sloja
Za učenje/testiranje, razmotrite:  
- Koristite Azure besplatne kredite (prvih 30 dana)  
- Držite se minimalnog broja replika  
- Izbrišite nakon testiranja (bez stalnih troškova)  

---

## Čišćenje

Kako biste izbjegli stalne troškove, izbrišite sve resurse:

```bash
azd down --force --purge
```
  
**Zahtjev za potvrdu**:  
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```
  
Upišite `y` za potvrdu.

**Što se briše**:  
- Container Apps Environment  
- Obje Container Apps (gateway i product service)  
- Container Registry  
- Application Insights  
- Log Analytics Workspace  
- Resource Group  

**✓ Provjera čišćenja**:  
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```
  
Trebao bi vratiti prazno.

---

## Vodič za proširenje: Od 2 do 5+ servisa

Kad savladate ovu arhitekturu s 2 servisa, evo kako proširiti:

### Faza 1: Dodajte pohranu baze podataka (sljedeći korak)

**Dodajte Cosmos DB za Product Service**:

1. Kreirajte `infra/core/cosmos.bicep`:  
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
  
2. Ažurirajte product service da koristi Cosmos DB umjesto podatke u memoriji

3. Procijenjeni dodatni trošak: ~25 USD/mjesečno (serverless)

### Faza 2: Dodajte treći servis (upravljanje narudžbama)

**Kreirajte Order Service**:

1. Nova mapa: `src/order-service/` (Python/Node.js/C#)  
2. Novi Bicep: `infra/app/order-service.bicep`  
3. Ažurirajte API Gateway za usmjeravanje na `/api/orders`  
4. Dodajte Azure SQL Database za pohranu narudžbi  

**Arhitektura postaje**:  
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```
  
### Faza 3: Dodajte asinhronu komunikaciju (Service Bus)

**Implementirajte event-driven arhitekturu**:

1. Dodajte Azure Service Bus: `infra/core/servicebus.bicep`  
2. Product Service objavljuje događaje "ProductCreated"  
3. Order Service se pretplaćuje na događaje produktów  
4. Dodajte Notification Service za obradu događaja  

**Uzorm**: Zahtjev/Odgovor (HTTP) + Event-Driven (Service Bus)

### Faza 4: Dodajte autentifikaciju korisnika

**Implementirajte User Service**:

1. Kreirajte `src/user-service/` (Go/Node.js)  
2. Dodajte Azure AD B2C ili prilagođenu JWT autentifikaciju  
3. API Gateway provjerava tokene  
4. Servisi provjeravaju korisnička dopuštenja  

### Faza 5: Priprema za produkciju

**Dodajte ove komponente**:  
- Azure Front Door (globalno balansiranje opterećenja)  
- Azure Key Vault (upravljanje tajnama)  
- Azure Monitor Workbooks (prilagođene nadzorne ploče)  
- CI/CD pipeline (GitHub Actions)  
- Blue-Green deploymente  
- Managed Identity za sve servise  

**Trošak pune produkcijske arhitekture**: ~300-1,400 USD/mjesec

---

## Saznajte više

### Povezana dokumentacija  
- [Azure Container Apps Documentation](https://learn.microsoft.com/azure/container-apps/)  
- [Microservices Architecture Guide](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)  
- [Application Insights for Distributed Tracing](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)  
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  

### Sljedeći koraci u ovom tečaju  
- ← Prethodni: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - Početnički primjer s jednim kontejnerom  
- → Sljedeći: [AI Integration Guide](../../../../../examples/docs/ai-foundry) - Dodavanje AI mogućnosti  
- 🏠 [Početna stranica tečaja](../../README.md)  

### Usporedba: Kada koristiti što

**Jedan Container App** (primjer Simple Flask API):  
- ✅ Jednostavne aplikacije  
- ✅ Monolitna arhitektura  
- ✅ Brza implementacija  
- ❌ Ograničena skalabilnost  
- **Trošak**: ~15-50 USD/mjesečno  

**Microservices** (ovaj primjer):  
- ✅ Složene aplikacije  
- ✅ Neovisno skaliranje po servisu  
- ✅ Autonomija timova (različiti servisi, različiti timovi)  
- ❌ Složenije za upravljanje  
- **Trošak**: ~60-250 USD/mjesečno  

**Kubernetes (AKS)**:  
- ✅ Maksimalna kontrola i fleksibilnost  
- ✅ Multicloud prenosivost  
- ✅ Napredne mrežne mogućnosti  
- ❌ Zahtijeva znanje Kubernetes-a  
- **Trošak**: minimalno ~150-500 USD/mjesečno  

**Preporuka**: Počnite s Container Apps (ovaj primjer), prijeđite na AKS samo ako trebate Kubernetes-specifične funkcionalnosti.

---

## Često postavljana pitanja

**P: Zašto samo 2 servisa, a ne 5+?**  
O: Edukacijski progres. Savladajte osnove (komunikacija servisa, nadzor, skaliranje) jednostavnim primjerom prije dodavanja složenosti. Obrasci koje ovdje naučite primjenjuju se i na arhitekture s 100 servisa.

**P: Mogu li samostalno dodati još servisa?**  
O: Naravno! Slijedite vodič za proširenje iznad. Svaki novi servis prati isti obrazac: kreirajte src mapu, kreirajte Bicep datoteku, ažurirajte azure.yaml, implementirajte.

**P: Je li ovo spremno za produkciju?**  
O: To je solidna osnova. Za produkciju dodajte: managed identity, Key Vault, trajne baze podataka, CI/CD pipeline, nadzorne alarme i strategiju backup-a.

**P: Zašto ne koristiti Dapr ili druge service mesh?**  
O: Držite jednostavno za učenje. Kad razumijete nativno Container Apps umrežavanje, možete dodati Dapr za napredne scenarije.

**P: Kako debugirati lokalno?**  
O: Pokrenite servise lokalno s Dockerom:  
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```
  
**P: Mogu li koristiti različite programske jezike?**  
O: Da! Ovaj primjer koristi Node.js (gateway) + Python (product service). Možete miješati bilo koje jezike koji rade u kontejnerima.

**P: Što ako nemam Azure kredite?**  
O: Koristite Azure besplatni sloj (prvih 30 dana za nove račune) ili implementirajte za kratka testiranja i odmah izbrišite.

---

> **🎓 Sažetak puta učenja**: Naučili ste kako implementirati arhitekturu s više servisa, automatskim skaliranjem, internom mrežom, centraliziranim nadzorom i produkcijskim obrascima. Ova osnova vas priprema za složene distribuirane sustave i enterprise microservices arhitekture.

**📚 Navigacija tečajem:**  
- ← Prethodni: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)  
- → Sljedeći: [Database Integration Example](../../../../../examples/database-app)  
- 🏠 [Početna stranica tečaja](../../../README.md)  
- 📖 [Najbolje prakse za Container Apps](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:
Ovaj dokument je preveden korištenjem AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo postići točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakve nesporazume ili pogrešna tumačenja proizašla iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->