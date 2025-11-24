<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22ea3f5148517a6012d3e2771584ef87",
  "translation_date": "2025-11-23T23:09:32+00:00",
  "source_file": "examples/container-app/microservices/README.md",
  "language_code": "sl"
}
-->
# Arhitektura mikrostoritev - Primer aplikacije v kontejnerju

⏱️ **Ocenjeni čas**: 25-35 minut | 💰 **Ocenjeni stroški**: ~$50-100/mesec | ⭐ **Kompleksnost**: Napredno

**Poenostavljena, a funkcionalna** arhitektura mikrostoritev, nameščena v Azure Container Apps z uporabo AZD CLI. Ta primer prikazuje komunikacijo med storitvami, orkestracijo kontejnerjev in spremljanje z dvostoritveno postavitvijo.

> **📚 Pristop k učenju**: Ta primer se začne z minimalno arhitekturo dveh storitev (API Gateway + Backend Service), ki jo lahko dejansko namestite in se iz nje učite. Ko obvladate to osnovo, vam ponujamo smernice za širitev v celoten ekosistem mikrostoritev.

## Kaj se boste naučili

Z dokončanjem tega primera boste:
- Namestili več kontejnerjev v Azure Container Apps
- Izvedli komunikacijo med storitvami z notranjim omrežjem
- Konfigurirali skaliranje na podlagi okolja in preverjanje zdravja
- Spremljali porazdeljene aplikacije z Application Insights
- Razumeli vzorce namestitve mikrostoritev in najboljše prakse
- Naučili se postopne širitve od preproste do kompleksne arhitekture

## Arhitektura

### Faza 1: Kaj gradimo (vključeno v ta primer)

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

**Zakaj začeti preprosto?**
- ✅ Hitro namestite in razumite (25-35 minut)
- ✅ Naučite se osnovnih vzorcev mikrostoritev brez zapletenosti
- ✅ Delujoča koda, ki jo lahko spreminjate in preizkušate
- ✅ Nižji stroški za učenje (~$50-100/mesec v primerjavi z $300-1400/mesec)
- ✅ Pridobite samozavest pred dodajanjem baz podatkov in vrst sporočil

**Primerjava**: To je kot učenje vožnje. Začnete na praznem parkirišču (2 storitvi), obvladate osnove, nato pa napredujete v mestni promet (5+ storitev z bazami podatkov).

### Faza 2: Prihodnja širitev (referenčna arhitektura)

Ko obvladate arhitekturo z dvema storitvama, jo lahko razširite na:

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

Oglejte si razdelek "Vodnik za širitev" na koncu za navodila po korakih.

## Vključene funkcije

✅ **Odkritje storitev**: Samodejno odkritje na podlagi DNS med kontejnerji  
✅ **Uravnavanje obremenitve**: Vgrajeno uravnavanje obremenitve med replikami  
✅ **Samodejno skaliranje**: Neodvisno skaliranje za vsako storitev na podlagi HTTP zahtev  
✅ **Spremljanje zdravja**: Preverjanje živosti in pripravljenosti za obe storitvi  
✅ **Porazdeljeno beleženje**: Centralizirano beleženje z Application Insights  
✅ **Notranje omrežje**: Varna komunikacija med storitvami  
✅ **Orkestracija kontejnerjev**: Samodejna namestitev in skaliranje  
✅ **Posodobitve brez izpadov**: Postopne posodobitve z upravljanjem revizij  

## Predpogoji

### Potrebna orodja

Pred začetkom preverite, ali imate nameščena naslednja orodja:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (različica 1.0.0 ali novejša)
   ```bash
   azd version
   # Pričakovani izhod: azd različica 1.0.0 ali višja
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (različica 2.50.0 ali novejša)
   ```bash
   az --version
   # Pričakovani rezultat: azure-cli 2.50.0 ali višje
   ```

3. **[Docker](https://www.docker.com/get-started)** (za lokalni razvoj/testiranje - opcijsko)
   ```bash
   docker --version
   # Pričakovani rezultat: Docker različica 20.10 ali višja
   ```

### Zahteve za Azure

- Aktivna **Azure naročnina** ([ustvarite brezplačen račun](https://azure.microsoft.com/free/))
- Dovoljenja za ustvarjanje virov v vaši naročnini
- **Vloga sodelavca** na naročnini ali skupini virov

### Zahteve glede znanja

To je **primer na napredni ravni**. Morali bi:
- Dokončati [preprost primer Flask API](../../../../../examples/container-app/simple-flask-api) 
- Osnovno razumeti arhitekturo mikrostoritev
- Poznati REST API-je in HTTP
- Razumeti koncepte kontejnerjev

**Nov v Container Apps?** Začnite s [preprostim primerom Flask API](../../../../../examples/container-app/simple-flask-api) za učenje osnov.

## Hiter začetek (korak za korakom)

### Korak 1: Klonirajte in navigirajte

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Preverjanje uspešnosti**: Preverite, ali vidite `azure.yaml`:
```bash
ls
# Pričakovano: README.md, azure.yaml, infra/, src/
```

### Korak 2: Avtentikacija z Azure

```bash
azd auth login
```

To odpre vaš brskalnik za avtentikacijo v Azure. Prijavite se s svojimi Azure poverilnicami.

**✓ Preverjanje uspešnosti**: Videti bi morali:
```
Logged in to Azure.
```

### Korak 3: Inicializacija okolja

```bash
azd init
```

**Pozivi, ki jih boste videli**:
- **Ime okolja**: Vnesite kratko ime (npr. `microservices-dev`)
- **Azure naročnina**: Izberite svojo naročnino
- **Azure lokacija**: Izberite regijo (npr. `eastus`, `westeurope`)

**✓ Preverjanje uspešnosti**: Videti bi morali:
```
SUCCESS: New project initialized!
```

### Korak 4: Namestitev infrastrukture in storitev

```bash
azd up
```

**Kaj se zgodi** (traja 8-12 minut):
1. Ustvari okolje Container Apps
2. Ustvari Application Insights za spremljanje
3. Zgradi API Gateway kontejner (Node.js)
4. Zgradi Product Service kontejner (Python)
5. Namesti oba kontejnerja v Azure
6. Konfigurira omrežje in preverjanje zdravja
7. Nastavi spremljanje in beleženje

**✓ Preverjanje uspešnosti**: Videti bi morali:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Čas**: 8-12 minut

### Korak 5: Preizkusite namestitev

```bash
# Pridobi končno točko prehoda
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Preveri zdravje API prehoda
curl $GATEWAY_URL/health

# Pričakovani izhod:
# {"status":"zdravo","storitev":"api-prehod","časovni žig":"2025-11-19T10:30:00Z"}
```

**Preizkusite storitev izdelkov prek prehoda**:
```bash
# Seznam izdelkov
curl $GATEWAY_URL/api/products

# Pričakovani izhod:
# [
#   {"id":1,"name":"Prenosnik","price":999.99,"stock":50},
#   {"id":2,"name":"Miška","price":29.99,"stock":200},
#   {"id":3,"name":"Tipkovnica","price":79.99,"stock":150}
# ]
```

**✓ Preverjanje uspešnosti**: Oba končna točka vrneta JSON podatke brez napak.

---

**🎉 Čestitke!** Namestili ste arhitekturo mikrostoritev v Azure!

## Struktura projekta

Vključene so vse implementacijske datoteke—to je popoln, delujoč primer:

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

**Kaj počne vsak komponent:**

**Infrastruktura (infra/)**:
- `main.bicep`: Orkestrira vse Azure vire in njihove odvisnosti
- `core/container-apps-environment.bicep`: Ustvari okolje Container Apps in Azure Container Registry
- `core/monitor.bicep`: Nastavi Application Insights za porazdeljeno beleženje
- `app/*.bicep`: Posamezne definicije aplikacij kontejnerjev s skaliranjem in preverjanjem zdravja

**API Gateway (src/api-gateway/)**:
- Storitev, ki je usmerjena javnosti in preusmerja zahteve na storitve v ozadju
- Implementira beleženje, obravnavo napak in preusmerjanje zahtev
- Prikazuje komunikacijo med storitvami prek HTTP

**Product Service (src/product-service/)**:
- Notranja storitev s katalogom izdelkov (za enostavnost v pomnilniku)
- REST API s preverjanjem zdravja
- Primer vzorca mikrostoritve v ozadju

## Pregled storitev

### API Gateway (Node.js/Express)

**Vrata**: 8080  
**Dostop**: Javno (zunanji dostop)  
**Namen**: Usmerja dohodne zahteve na ustrezne storitve v ozadju  

**Končne točke**:
- `GET /` - Informacije o storitvi
- `GET /health` - Končna točka za preverjanje zdravja
- `GET /api/products` - Preusmeri na storitev izdelkov (prikaži vse)
- `GET /api/products/:id` - Preusmeri na storitev izdelkov (pridobi po ID-ju)

**Ključne funkcije**:
- Usmerjanje zahtev z axios
- Centralizirano beleženje
- Obravnava napak in upravljanje časovnih omejitev
- Odkritje storitev prek spremenljivk okolja
- Integracija z Application Insights

**Poudarek kode** (`src/api-gateway/app.js`):
```javascript
// Komunikacija med internimi storitvami
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Vrata**: 8000  
**Dostop**: Samo interno (brez zunanjega dostopa)  
**Namen**: Upravljanje kataloga izdelkov z podatki v pomnilniku  

**Končne točke**:
- `GET /` - Informacije o storitvi
- `GET /health` - Končna točka za preverjanje zdravja
- `GET /products` - Prikaži vse izdelke
- `GET /products/<id>` - Pridobi izdelek po ID-ju

**Ključne funkcije**:
- RESTful API z Flask
- Katalog izdelkov v pomnilniku (preprosto, brez potrebne baze podatkov)
- Spremljanje zdravja s sondami
- Strukturirano beleženje
- Integracija z Application Insights

**Model podatkov**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**Zakaj samo interno?**
Storitev izdelkov ni javno dostopna. Vse zahteve morajo iti prek API Gateway, ki zagotavlja:
- Varnost: Nadzorovana dostopna točka
- Prilagodljivost: Možnost spremembe ozadja brez vpliva na stranke
- Spremljanje: Centralizirano beleženje zahtev

## Razumevanje komunikacije med storitvami

### Kako storitve komunicirajo med seboj

V tem primeru API Gateway komunicira s storitvijo izdelkov z **notranjimi HTTP klici**:

```javascript
// API prehod (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Izvedi interno HTTP zahtevo
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Ključne točke**:

1. **Odkritje na podlagi DNS**: Container Apps samodejno zagotavlja DNS za notranje storitve
   - FQDN storitve izdelkov: `product-service.internal.<environment>.azurecontainerapps.io`
   - Poenostavljeno kot: `http://product-service` (Container Apps to razreši)

2. **Brez javne izpostavljenosti**: Storitev izdelkov ima `external: false` v Bicep
   - Dostopna samo znotraj okolja Container Apps
   - Ni dosegljiva z interneta

3. **Spremenljivke okolja**: URL-ji storitev se vstavijo ob namestitvi
   - Bicep posreduje notranji FQDN prehodu
   - Brez trdo kodiranih URL-jev v kodi aplikacije

**Primerjava**: To je kot pisarniške sobe. API Gateway je recepcija (usmerjena javnosti), storitev izdelkov pa je pisarniška soba (samo interno). Obiskovalci morajo iti skozi recepcijo, da dosežejo katero koli pisarno.

## Možnosti namestitve

### Polna namestitev (priporočeno)

```bash
# Namestite infrastrukturo in obe storitvi
azd up
```

To namesti:
1. Okolje Container Apps
2. Application Insights
3. Container Registry
4. Kontejner API Gateway
5. Kontejner Product Service

**Čas**: 8-12 minut

### Namestitev posamezne storitve

```bash
# Namestite samo eno storitev (po začetnem azd up)
azd deploy api-gateway

# Ali namestite storitev izdelka
azd deploy product-service
```

**Uporaba**: Ko ste posodobili kodo v eni storitvi in želite ponovno namestiti samo to storitev.

### Posodobitev konfiguracije

```bash
# Spremenite parametre skaliranja
azd env set GATEWAY_MAX_REPLICAS 30

# Znova uvedite z novo konfiguracijo
azd up
```

## Konfiguracija

### Konfiguracija skaliranja

Obe storitvi sta konfigurirani s samodejnim skaliranjem na podlagi HTTP v svojih Bicep datotekah:

**API Gateway**:
- Minimalne replike: 2 (vedno vsaj 2 za razpoložljivost)
- Maksimalne replike: 20
- Sprožilec skaliranja: 50 sočasnih zahtev na repliko

**Product Service**:
- Minimalne replike: 1 (lahko se skalira na nič, če je potrebno)
- Maksimalne replike: 10
- Sprožilec skaliranja: 100 sočasnih zahtev na repliko

**Prilagodite skaliranje** (v `infra/app/*.bicep`):
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

### Dodelitev virov

**API Gateway**:
- CPU: 1.0 vCPU
- Pomnilnik: 2 GiB
- Razlog: Obdeluje ves zunanji promet

**Product Service**:
- CPU: 0.5 vCPU
- Pomnilnik: 1 GiB
- Razlog: Lahke operacije v pomnilniku

### Preverjanje zdravja

Obe storitvi vključujeta preverjanje živosti in pripravljenosti:

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

**Kaj to pomeni**:
- **Živost**: Če preverjanje zdravja ne uspe, Container Apps ponovno zažene kontejner
- **Pripravljenost**: Če ni pripravljeno, Container Apps preneha usmerjati promet na to repliko

## Spremljanje in opazovanje

### Ogled dnevnikov storitev

```bash
# Pretok dnevnikov iz API Gateway
azd logs api-gateway --follow

# Ogled nedavnih dnevnikov storitve izdelkov
azd logs product-service --tail 100

# Ogled vseh dnevnikov iz obeh storitev
azd logs --follow
```

**Pričakovani izhod**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Poizvedbe v Application Insights

Dostopajte do Application Insights v Azure Portal, nato zaženite te poizvedbe:

**Poiščite počasne zahteve**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Sledite klicem med storitvami**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Stopnja napak po storitvi**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Obseg zahtev skozi čas**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Dostop do nadzorne plošče spremljanja

```bash
# Pridobite podrobnosti o Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Odprite spremljanje v Azure Portalu
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Žive meritve

1. Pojdite na Application Insights v Azure Portal
2. Kliknite "Live Metrics"
3. Oglejte si zahteve v realnem času, napake in zmogljivost
4. Preizkusite z zagonom: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Praktične vaje

[Opomba: Oglejte si celotne vaje zgoraj v razdelku "Praktične vaje" za podrobne korake, vključno s preverjanjem namestitve, spreminjanjem podatkov, testiranjem samodejnega skaliranja, obravnavo napak in dodajanjem tretje storitve.]

## Analiza stroškov

### Ocenjeni mesečni stroški (za ta primer z dvema storitvama)

| Vir | Konfiguracija | Ocenjeni stroški |
|-----|--------------|------------------|
| API Gateway | 2-20 replik, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replik, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Osnovni nivo | $5 |
| Application Insights | 1-2 GB/mesec | $5-10 |
| Log Analytics | 1 GB/mesec | $3 |
| **Skupaj** | | **$58-243/mesec** |

**Razčlenitev stroškov glede na uporabo**:
- **Lahek promet** (testiranje/učenje): ~$60/mesec
- **Zmeren promet** (majhna produkcija): ~$120/mesec
- **Visok promet** (zasedena obdobja): ~$240/mesec

### Nasveti za optimizacijo stroškov

1. **Skalirajte na nič za razvoj**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Uporabite načrt porabe za Cosmos DB** (ko ga dodate):
   - Plačajte samo za uporabo
   - Brez minimalnih stroškov

3. **Nastavite vzorčenje v Application Insights**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Vzorec 50% zahtev
   ```

4. **Počistite, ko ni potrebno**:
   ```bash
   azd down
   ```

### Možnosti brezplačnega nivoja
Za učenje/testiranje upoštevajte:
- Uporabite brezplačne Azure kredite (prvih 30 dni)
- Ohranite minimalno število replik
- Po testiranju izbrišite (brez stalnih stroškov)

---

## Čiščenje

Da se izognete stalnim stroškom, izbrišite vse vire:

```bash
azd down --force --purge
```

**Potrditev**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Vnesite `y` za potrditev.

**Kaj se izbriše**:
- Okolje za Container Apps
- Obe Container Apps (gateway in storitev izdelkov)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ Preverite čiščenje**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Rezultat mora biti prazen.

---

## Vodnik za razširitev: Od 2 do 5+ storitev

Ko obvladate arhitekturo z 2 storitvama, tukaj je, kako jo razširiti:

### Faza 1: Dodajte podatkovno bazo (Naslednji korak)

**Dodajte Cosmos DB za storitev izdelkov**:

1. Ustvarite `infra/core/cosmos.bicep`:
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

2. Posodobite storitev izdelkov, da uporablja Cosmos DB namesto podatkov v pomnilniku

3. Ocenjeni dodatni stroški: ~25 $/mesec (serverless)

### Faza 2: Dodajte tretjo storitev (Upravljanje naročil)

**Ustvarite storitev naročil**:

1. Nova mapa: `src/order-service/` (Python/Node.js/C#)
2. Nov Bicep: `infra/app/order-service.bicep`
3. Posodobite API Gateway za usmerjanje `/api/orders`
4. Dodajte Azure SQL Database za shranjevanje naročil

**Arhitektura postane**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Faza 3: Dodajte asinhrono komunikacijo (Service Bus)

**Implementirajte arhitekturo, ki temelji na dogodkih**:

1. Dodajte Azure Service Bus: `infra/core/servicebus.bicep`
2. Storitev izdelkov objavlja dogodke "ProductCreated"
3. Storitev naročil se naroči na dogodke izdelkov
4. Dodajte storitev obveščanja za obdelavo dogodkov

**Vzorec**: Zahteva/Odziv (HTTP) + Arhitektura, ki temelji na dogodkih (Service Bus)

### Faza 4: Dodajte avtentikacijo uporabnikov

**Implementirajte storitev uporabnikov**:

1. Ustvarite `src/user-service/` (Go/Node.js)
2. Dodajte Azure AD B2C ali prilagojeno avtentikacijo JWT
3. API Gateway preverja žetone
4. Storitve preverjajo dovoljenja uporabnikov

### Faza 5: Pripravljenost za produkcijo

**Dodajte te komponente**:
- Azure Front Door (globalno uravnavanje obremenitve)
- Azure Key Vault (upravljanje skrivnosti)
- Azure Monitor Workbooks (prilagojene nadzorne plošče)
- CI/CD Pipeline (GitHub Actions)
- Blue-Green Deployments
- Upravljana identiteta za vse storitve

**Celotni stroški produkcijske arhitekture**: ~300-1.400 $/mesec

---

## Več informacij

### Povezana dokumentacija
- [Dokumentacija za Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Vodnik za arhitekturo mikro storitev](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights za porazdeljeno sledenje](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Dokumentacija za Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Naslednji koraki v tem tečaju
- ← Prejšnje: [Preprost Flask API](../../../../../examples/container-app/simple-flask-api) - Začetni primer z enim kontejnerjem
- → Naslednje: [Vodnik za integracijo AI](../../../../../examples/docs/ai-foundry) - Dodajte AI zmogljivosti
- 🏠 [Domača stran tečaja](../../README.md)

### Primerjava: Kdaj uporabiti kaj

**Enojna Container App** (primer preprostega Flask API):
- ✅ Preproste aplikacije
- ✅ Monolitna arhitektura
- ✅ Hitro za namestitev
- ❌ Omejena razširljivost
- **Stroški**: ~15-50 $/mesec

**Mikro storitve** (ta primer):
- ✅ Kompleksne aplikacije
- ✅ Neodvisno skaliranje za vsako storitev
- ✅ Avtonomija ekip (različne storitve, različne ekipe)
- ❌ Bolj zapleteno za upravljanje
- **Stroški**: ~60-250 $/mesec

**Kubernetes (AKS)**:
- ✅ Maksimalen nadzor in prilagodljivost
- ✅ Prenosljivost med oblaki
- ✅ Napredno omrežje
- ❌ Zahteva strokovno znanje o Kubernetesu
- **Stroški**: ~150-500 $/mesec minimalno

**Priporočilo**: Začnite z Container Apps (ta primer), preklopite na AKS le, če potrebujete funkcije specifične za Kubernetes.

---

## Pogosta vprašanja

**V: Zakaj samo 2 storitvi namesto 5+?**  
O: Izobraževalni napredek. Obvladujte osnove (komunikacija med storitvami, spremljanje, skaliranje) s preprostim primerom, preden dodate kompleksnost. Vzorci, ki se jih naučite tukaj, veljajo za arhitekture s 100 storitvami.

**V: Ali lahko sam dodam več storitev?**  
O: Seveda! Sledite zgornjemu vodniku za razširitev. Vsaka nova storitev sledi istemu vzorcu: ustvarite mapo src, ustvarite Bicep datoteko, posodobite azure.yaml, namestite.

**V: Ali je to pripravljeno za produkcijo?**  
O: To je dobra osnova. Za produkcijo dodajte: upravljano identiteto, Key Vault, trajne podatkovne baze, CI/CD pipeline, opozorila za spremljanje in strategijo varnostnega kopiranja.

**V: Zakaj ne uporabiti Dapr ali drugega service mesh?**  
O: Naj bo preprosto za učenje. Ko razumete omrežno povezovanje v Container Apps, lahko dodate Dapr za napredne scenarije.

**V: Kako lokalno odpravljam napake?**  
O: Zaženite storitve lokalno z Dockerjem:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**V: Ali lahko uporabim različne programske jezike?**  
O: Da! Ta primer prikazuje Node.js (gateway) + Python (storitev izdelkov). Lahko kombinirate katerikoli jezik, ki deluje v kontejnerjih.

**V: Kaj če nimam Azure kreditov?**  
O: Uporabite brezplačno Azure stopnjo (prvih 30 dni z novimi računi) ali namestite za kratka testna obdobja in takoj izbrišite.

---

> **🎓 Povzetek učne poti**: Naučili ste se namestiti arhitekturo z več storitvami z avtomatskim skaliranjem, notranjim omrežjem, centraliziranim spremljanjem in vzorci, pripravljenimi za produkcijo. Ta osnova vas pripravi na kompleksne porazdeljene sisteme in arhitekture mikro storitev za podjetja.

**📚 Navigacija po tečaju:**
- ← Prejšnje: [Preprost Flask API](../../../../../examples/container-app/simple-flask-api)
- → Naslednje: [Primer integracije podatkovne baze](../../../../../examples/database-app)
- 🏠 [Domača stran tečaja](../../README.md)
- 📖 [Najboljše prakse za Container Apps](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje AI [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku naj se šteje za avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne odgovarjamo za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->