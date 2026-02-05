# Arhitektura mikroservisa - Primjer aplikacije u kontejnerima

⏱️ **Procijenjeno vrijeme**: 25-35 minuta | 💰 **Procijenjeni trošak**: ~$50-100/mjesečno | ⭐ **Složenost**: Napredno

**Pojednostavljena, ali funkcionalna** arhitektura mikroservisa implementirana na Azure Container Apps pomoću AZD CLI. Ovaj primjer demonstrira komunikaciju između servisa, orkestraciju kontejnera i praćenje s praktičnim postavom od 2 servisa.

> **📚 Pristup učenju**: Ovaj primjer započinje s minimalnom arhitekturom od 2 servisa (API Gateway + Backend Service) koju možete implementirati i učiti iz nje. Nakon što savladate ovu osnovu, pružamo smjernice za proširenje na puni ekosustav mikroservisa.

## Što ćete naučiti

Dovršavanjem ovog primjera, naučit ćete:
- Implementirati više kontejnera na Azure Container Apps
- Provoditi komunikaciju između servisa putem interne mreže
- Konfigurirati skaliranje i provjere zdravlja temeljene na okruženju
- Pratiti distribuirane aplikacije pomoću Application Insights
- Razumjeti obrasce implementacije mikroservisa i najbolje prakse
- Naučiti progresivno proširenje od jednostavnih do složenih arhitektura

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
- ✅ Brza implementacija i razumijevanje (25-35 minuta)
- ✅ Učenje osnovnih obrazaca mikroservisa bez složenosti
- ✅ Funkcionalan kod koji možete prilagoditi i eksperimentirati s njim
- ✅ Niži troškovi za učenje (~$50-100/mjesečno naspram $300-1400/mjesečno)
- ✅ Stjecanje samopouzdanja prije dodavanja baza podataka i redova poruka

**Analogija**: Zamislite ovo kao učenje vožnje. Počinjete na praznom parkiralištu (2 servisa), savladate osnove, a zatim prelazite na gradski promet (5+ servisa s bazama podataka).

### Faza 2: Buduće proširenje (referentna arhitektura)

Nakon što savladate arhitekturu s 2 servisa, možete je proširiti na:

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

Pogledajte odjeljak "Vodič za proširenje" na kraju za detaljne upute.

## Uključene značajke

✅ **Otkrivanje servisa**: Automatsko otkrivanje putem DNS-a između kontejnera  
✅ **Ravnoteža opterećenja**: Ugrađena ravnoteža opterećenja između replika  
✅ **Automatsko skaliranje**: Neovisno skaliranje po servisu na temelju HTTP zahtjeva  
✅ **Praćenje zdravlja**: Provjere liveness i readiness za oba servisa  
✅ **Distribuirano logiranje**: Centralizirano logiranje pomoću Application Insights  
✅ **Interna mreža**: Sigurna komunikacija između servisa  
✅ **Orkestracija kontejnera**: Automatska implementacija i skaliranje  
✅ **Ažuriranja bez zastoja**: Postupna ažuriranja s upravljanjem revizijama  

## Preduvjeti

### Potrebni alati

Prije početka, provjerite imate li instalirane sljedeće alate:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (verzija 1.0.0 ili novija)
   ```bash
   azd version
   # Očekivani izlaz: azd verzija 1.0.0 ili novija
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (verzija 2.50.0 ili novija)
   ```bash
   az --version
   # Očekivani izlaz: azure-cli 2.50.0 ili noviji
   ```

3. **[Docker](https://www.docker.com/get-started)** (za lokalni razvoj/testiranje - opcionalno)
   ```bash
   docker --version
   # Očekivani rezultat: Docker verzija 20.10 ili novija
   ```

### Azure zahtjevi

- Aktivna **Azure pretplata** ([kreirajte besplatan račun](https://azure.microsoft.com/free/))
- Dozvole za kreiranje resursa u vašoj pretplati
- **Contributor** uloga na pretplati ili resursnoj grupi

### Preduvjeti znanja

Ovo je primjer **napredne razine**. Trebali biste imati:
- Završili [jednostavan primjer Flask API-ja](../../../../../examples/container-app/simple-flask-api) 
- Osnovno razumijevanje arhitekture mikroservisa
- Poznavanje REST API-ja i HTTP-a
- Razumijevanje koncepata kontejnera

**Novi ste u Container Apps?** Počnite s [jednostavnim primjerom Flask API-ja](../../../../../examples/container-app/simple-flask-api) kako biste naučili osnove.

## Brzi početak (korak po korak)

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

Ovo otvara vaš preglednik za autentifikaciju na Azure. Prijavite se sa svojim Azure vjerodajnicama.

**✓ Provjera uspjeha**: Trebali biste vidjeti:
```
Logged in to Azure.
```

### Korak 3: Inicijalizirajte okruženje

```bash
azd init
```

**Upiti koje ćete vidjeti**:
- **Naziv okruženja**: Unesite kratko ime (npr. `microservices-dev`)
- **Azure pretplata**: Odaberite svoju pretplatu
- **Azure lokacija**: Odaberite regiju (npr. `eastus`, `westeurope`)

**✓ Provjera uspjeha**: Trebali biste vidjeti:
```
SUCCESS: New project initialized!
```

### Korak 4: Implementirajte infrastrukturu i servise

```bash
azd up
```

**Što se događa** (traje 8-12 minuta):
1. Kreira se okruženje za Container Apps
2. Kreira se Application Insights za praćenje
3. Gradi se API Gateway kontejner (Node.js)
4. Gradi se Product Service kontejner (Python)
5. Oba kontejnera se implementiraju na Azure
6. Konfigurira se mreža i provjere zdravlja
7. Postavlja se praćenje i logiranje

**✓ Provjera uspjeha**: Trebali biste vidjeti:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Vrijeme**: 8-12 minuta

### Korak 5: Testirajte implementaciju

```bash
# Dohvati krajnju točku pristupnika
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Testiraj zdravlje API pristupnika
curl $GATEWAY_URL/health

# Očekivani izlaz:
# {"status":"zdrav","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Testirajte Product Service putem gatewaya**:
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

**✓ Provjera uspjeha**: Oba krajnja točka vraćaju JSON podatke bez grešaka.

---

**🎉 Čestitamo!** Uspješno ste implementirali arhitekturu mikroservisa na Azure!

## Struktura projekta

Svi implementacijski fajlovi su uključeni—ovo je kompletan, funkcionalan primjer:

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

**Što svaki komponent radi:**

**Infrastruktura (infra/)**:
- `main.bicep`: Orkestrira sve Azure resurse i njihove ovisnosti
- `core/container-apps-environment.bicep`: Kreira okruženje za Container Apps i Azure Container Registry
- `core/monitor.bicep`: Postavlja Application Insights za distribuirano logiranje
- `app/*.bicep`: Pojedinačne definicije aplikacija u kontejnerima sa skaliranjem i provjerama zdravlja

**API Gateway (src/api-gateway/)**:
- Servis koji je javno dostupan i usmjerava zahtjeve prema backend servisima
- Implementira logiranje, rukovanje greškama i prosljeđivanje zahtjeva
- Demonstrira HTTP komunikaciju između servisa

**Product Service (src/product-service/)**:
- Interni servis s katalogom proizvoda (u memoriji radi jednostavnosti)
- REST API s provjerama zdravlja
- Primjer obrasca backend mikroservisa

## Pregled servisa

### API Gateway (Node.js/Express)

**Port**: 8080  
**Pristup**: Javni (vanjski ulaz)  
**Svrha**: Usmjerava dolazne zahtjeve prema odgovarajućim backend servisima  

**Krajnje točke**:
- `GET /` - Informacije o servisu
- `GET /health` - Krajnja točka za provjeru zdravlja
- `GET /api/products` - Prosljeđuje prema Product Service (popis svih)
- `GET /api/products/:id` - Prosljeđuje prema Product Service (prema ID-u)

**Ključne značajke**:
- Usmjeravanje zahtjeva s axiosom
- Centralizirano logiranje
- Rukovanje greškama i upravljanje timeout-om
- Otkrivanje servisa putem varijabli okruženja
- Integracija s Application Insights

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
**Pristup**: Samo interno (nema vanjskog ulaza)  
**Svrha**: Upravljanje katalogom proizvoda s podacima u memoriji  

**Krajnje točke**:
- `GET /` - Informacije o servisu
- `GET /health` - Krajnja točka za provjeru zdravlja
- `GET /products` - Popis svih proizvoda
- `GET /products/<id>` - Dohvaćanje proizvoda prema ID-u

**Ključne značajke**:
- RESTful API s Flaskom
- Pohrana proizvoda u memoriji (jednostavno, bez baze podataka)
- Praćenje zdravlja s probama
- Strukturirano logiranje
- Integracija s Application Insights

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

**Zašto samo interno?**
Product Service nije javno dostupan. Svi zahtjevi moraju proći kroz API Gateway, koji pruža:
- Sigurnost: Kontrolirana pristupna točka
- Fleksibilnost: Mogućnost promjene backend-a bez utjecaja na klijente
- Praćenje: Centralizirano logiranje zahtjeva

## Razumijevanje komunikacije između servisa

### Kako servisi međusobno komuniciraju

U ovom primjeru, API Gateway komunicira s Product Service koristeći **interne HTTP pozive**:

```javascript
// API Gateway (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Napravi internu HTTP zahtjev
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Ključne točke**:

1. **Otkrivanje putem DNS-a**: Container Apps automatski osigurava DNS za interne servise
   - FQDN za Product Service: `product-service.internal.<environment>.azurecontainerapps.io`
   - Pojednostavljeno kao: `http://product-service` (Container Apps to rješava)

2. **Nema javne izloženosti**: Product Service ima `external: false` u Bicepu
   - Dostupan samo unutar okruženja Container Apps
   - Nije dostupan s interneta

3. **Varijable okruženja**: URL-ovi servisa se ubrizgavaju tijekom implementacije
   - Bicep prosljeđuje interni FQDN gatewayu
   - Nema hardkodiranih URL-ova u kodu aplikacije

**Analogija**: Zamislite ovo kao uredske prostorije. API Gateway je recepcija (javno dostupna), a Product Service je uredska prostorija (samo interno). Posjetitelji moraju proći kroz recepciju da bi došli do bilo koje prostorije.

## Opcije implementacije

### Potpuna implementacija (preporučeno)

```bash
# Implementiraj infrastrukturu i obje usluge
azd up
```

Ovo implementira:
1. Okruženje za Container Apps
2. Application Insights
3. Container Registry
4. API Gateway kontejner
5. Product Service kontejner

**Vrijeme**: 8-12 minuta

### Implementacija pojedinačnog servisa

```bash
# Implementirajte samo jednu uslugu (nakon početnog azd up)
azd deploy api-gateway

# Ili implementirajte uslugu proizvoda
azd deploy product-service
```

**Upotreba**: Kada ste ažurirali kod u jednom servisu i želite ponovno implementirati samo taj servis.

### Ažuriranje konfiguracije

```bash
# Promijenite parametre skaliranja
azd env set GATEWAY_MAX_REPLICAS 30

# Ponovno implementirajte s novom konfiguracijom
azd up
```

## Konfiguracija

### Konfiguracija skaliranja

Oba servisa su konfigurirana za automatsko skaliranje temeljeno na HTTP zahtjevima u njihovim Bicep datotekama:

**API Gateway**:
- Minimalne replike: 2 (uvijek barem 2 za dostupnost)
- Maksimalne replike: 20
- Okidač skaliranja: 50 istovremenih zahtjeva po replici

**Product Service**:
- Minimalne replike: 1 (može se skalirati na nulu ako je potrebno)
- Maksimalne replike: 10
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

### Alokacija resursa

**API Gateway**:
- CPU: 1.0 vCPU
- Memorija: 2 GiB
- Razlog: Obrada svih vanjskih zahtjeva

**Product Service**:
- CPU: 0.5 vCPU
- Memorija: 1 GiB
- Razlog: Lagane operacije u memoriji

### Provjere zdravlja

Oba servisa uključuju liveness i readiness probe:

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
- **Liveness**: Ako provjera zdravlja ne uspije, Container Apps ponovno pokreće kontejner
- **Readiness**: Ako nije spreman, Container Apps prestaje usmjeravati promet prema toj replici

## Praćenje i preglednost

### Pregled logova servisa

```bash
# Prijenos zapisnika iz API Gatewaya
azd logs api-gateway --follow

# Pregledajte nedavne zapisnike usluge proizvoda
azd logs product-service --tail 100

# Pregledajte sve zapisnike iz obje usluge
azd logs --follow
```

**Očekivani izlaz**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Upiti za Application Insights

Pristupite Application Insights u Azure Portalu, zatim pokrenite ove upite:

**Pronađite spore zahtjeve**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Pratite pozive između servisa**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Stopa grešaka po servisu**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Volumen zahtjeva tijekom vremena**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Pristup nadzornoj ploči za praćenje

```bash
# Dohvati detalje Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Otvori praćenje na Azure Portalu
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Živa metrika

1. Navigirajte do Application Insights u Azure Portalu
2. Kliknite "Live Metrics"
3. Pogledajte zahtjeve u stvarnom vremenu, greške i performanse
4. Testirajte pokretanjem: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Praktične vježbe

[Napomena: Pogledajte potpune vježbe iznad u odjeljku "Praktične vježbe" za detaljne korake uključujući provjeru implementacije, izmjenu podataka, testove automatskog skaliranja, rukovanje greškama i dodavanje trećeg servisa.]

## Analiza troškova

### Procijenjeni mjesečni troškovi (za ovaj primjer s 2 servisa)

| Resurs | Konfiguracija | Procijenjeni trošak |
|--------|---------------|---------------------|
| API Gateway | 2-20 replika, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replika, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Osnovni nivo | $5 |
| Application Insights | 1-2 GB/mjesečno | $5-10 |
| Log Analytics | 1 GB/mjesečno | $3 |
| **Ukupno** | | **$58-243/mjesečno** |

**Razrada troškova prema upotrebi**:
- **Lagani promet** (testiranje/učenje): ~$60/mjesečno
- **Umjereni promet** (mala produkcija): ~$120/mjesečno
- **Visoki promet** (intenzivna razdoblja): ~$240/mjesečno

### Savjeti za optimizaciju troškova

1. **Skalirajte na nulu za razvoj**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Koristite Consumption Plan za Cosmos DB** (kada ga dodate):
   - Plaćate samo za ono što koristite
   - Nema minimalne naknade

3. **Postavite uzorkovanje za Application Insights**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Uzorak 50% zahtjeva
   ```

4. **Očistite kada nije potrebno**:
   ```bash
   azd down
   ```

### Opcije besplatnog nivoa
Za učenje/testiranje, razmotrite:
- Koristite besplatne Azure kredite (prvih 30 dana)
- Ograničite broj replika na minimum
- Obrišite nakon testiranja (bez stalnih troškova)

---

## Čišćenje

Kako biste izbjegli stalne troškove, obrišite sve resurse:

```bash
azd down --force --purge
```

**Potvrda**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Upišite `y` za potvrdu.

**Što se briše**:
- Okruženje za Container Apps
- Oba Container Appsa (gateway i product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ Provjera čišćenja**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Treba vratiti prazno.

---

## Vodič za proširenje: Od 2 do 5+ servisa

Kad savladate arhitekturu s 2 servisa, evo kako je proširiti:

### Faza 1: Dodavanje baze podataka (sljedeći korak)

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

2. Ažurirajte product service da koristi Cosmos DB umjesto podatka u memoriji

3. Procijenjeni dodatni trošak: ~25 USD/mjesečno (serverless)

### Faza 2: Dodavanje trećeg servisa (upravljanje narudžbama)

**Kreirajte Order Service**:

1. Novi folder: `src/order-service/` (Python/Node.js/C#)
2. Novi Bicep: `infra/app/order-service.bicep`
3. Ažurirajte API Gateway za rutiranje `/api/orders`
4. Dodajte Azure SQL Database za pohranu narudžbi

**Arhitektura postaje**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Faza 3: Dodavanje asinkrone komunikacije (Service Bus)

**Implementirajte arhitekturu temeljenu na događajima**:

1. Dodajte Azure Service Bus: `infra/core/servicebus.bicep`
2. Product Service objavljuje događaje "ProductCreated"
3. Order Service se pretplaćuje na događaje proizvoda
4. Dodajte Notification Service za obradu događaja

**Uzorak**: Zahtjev/odgovor (HTTP) + temeljeno na događajima (Service Bus)

### Faza 4: Dodavanje autentifikacije korisnika

**Implementirajte User Service**:

1. Kreirajte `src/user-service/` (Go/Node.js)
2. Dodajte Azure AD B2C ili prilagođenu JWT autentifikaciju
3. API Gateway provjerava tokene
4. Servisi provjeravaju korisničke dozvole

### Faza 5: Spremnost za produkciju

**Dodajte ove komponente**:
- Azure Front Door (globalno balansiranje opterećenja)
- Azure Key Vault (upravljanje tajnama)
- Azure Monitor Workbooks (prilagođene nadzorne ploče)
- CI/CD pipeline (GitHub Actions)
- Blue-Green Deployments
- Managed Identity za sve servise

**Trošak pune produkcijske arhitekture**: ~300-1.400 USD/mjesečno

---

## Saznajte više

### Povezana dokumentacija
- [Azure Container Apps Dokumentacija](https://learn.microsoft.com/azure/container-apps/)
- [Vodič za arhitekturu mikroservisa](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights za distribuirano praćenje](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI Dokumentacija](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Sljedeći koraci u ovom tečaju
- ← Prethodno: [Jednostavni Flask API](../../../../../examples/container-app/simple-flask-api) - Primjer jednostavnog kontejnera za početnike
- → Sljedeće: [Vodič za AI integraciju](../../../../../examples/docs/ai-foundry) - Dodavanje AI mogućnosti
- 🏠 [Početna stranica tečaja](../../README.md)

### Usporedba: Kada koristiti što

**Jedan Container App** (Primjer jednostavnog Flask API-ja):
- ✅ Jednostavne aplikacije
- ✅ Monolitna arhitektura
- ✅ Brzo za implementaciju
- ❌ Ograničena skalabilnost
- **Trošak**: ~15-50 USD/mjesečno

**Mikroservisi** (Ovaj primjer):
- ✅ Kompleksne aplikacije
- ✅ Neovisno skaliranje po servisu
- ✅ Autonomija timova (različiti servisi, različiti timovi)
- ❌ Složenije za upravljanje
- **Trošak**: ~60-250 USD/mjesečno

**Kubernetes (AKS)**:
- ✅ Maksimalna kontrola i fleksibilnost
- ✅ Prijenosivost između oblaka
- ✅ Napredno umrežavanje
- ❌ Zahtijeva stručnost u Kubernetesu
- **Trošak**: ~150-500 USD/mjesečno minimalno

**Preporuka**: Započnite s Container Apps (ovaj primjer), pređite na AKS samo ako trebate specifične značajke Kubernetesa.

---

## Često postavljana pitanja

**P: Zašto samo 2 servisa umjesto 5+?**  
O: Edukacijski napredak. Savladajte osnove (komunikacija servisa, praćenje, skaliranje) s jednostavnim primjerom prije dodavanja složenosti. Uzorci koje ovdje naučite primjenjuju se na arhitekture s 100 servisa.

**P: Mogu li sam dodati više servisa?**  
O: Naravno! Slijedite vodič za proširenje iznad. Svaki novi servis slijedi isti uzorak: kreirajte src folder, kreirajte Bicep datoteku, ažurirajte azure.yaml, implementirajte.

**P: Je li ovo spremno za produkciju?**  
O: Ovo je solidna osnova. Za produkciju dodajte: managed identity, Key Vault, trajne baze podataka, CI/CD pipeline, upozorenja za praćenje i strategiju sigurnosne kopije.

**P: Zašto ne koristiti Dapr ili drugi service mesh?**  
O: Zadržite jednostavnost za učenje. Kad razumijete nativno umrežavanje Container Appsa, možete dodati Dapr za napredne scenarije.

**P: Kako lokalno otkloniti pogreške?**  
O: Pokrenite servise lokalno s Dockerom:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**P: Mogu li koristiti različite programske jezike?**  
O: Da! Ovaj primjer prikazuje Node.js (gateway) + Python (product service). Možete kombinirati bilo koje jezike koji rade u kontejnerima.

**P: Što ako nemam Azure kredite?**  
O: Koristite besplatni Azure tier (prvih 30 dana s novim računima) ili implementirajte za kratka testiranja i odmah obrišite.

---

> **🎓 Sažetak edukacijskog puta**: Naučili ste implementirati arhitekturu s više servisa s automatskim skaliranjem, internim umrežavanjem, centraliziranim praćenjem i uzorcima spremnim za produkciju. Ova osnova priprema vas za složene distribuirane sustave i arhitekture mikroservisa za poduzeća.

**📚 Navigacija tečajem:**
- ← Prethodno: [Jednostavni Flask API](../../../../../examples/container-app/simple-flask-api)
- → Sljedeće: [Primjer integracije baze podataka](../../../../../examples/database-app)
- 🏠 [Početna stranica tečaja](../../README.md)
- 📖 [Najbolje prakse za Container Apps](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane čovjeka. Ne preuzimamo odgovornost za nesporazume ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->