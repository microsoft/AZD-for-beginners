# Arhitektura mikroservisov - primer Container App

⏱️ **Ocenjeni čas**: 25–35 minut | 💰 **Ocenjeni strošek**: ~50–100 USD/mesec | ⭐ **Složenost**: Napredno

Poenostavljena, a funkcionalna arhitektura mikroservisov nameščena v Azure Container Apps z uporabo AZD CLI. Ta primer prikazuje medstoritveno komunikacijo, orkestracijo vsebnikov in spremljanje z uporabo praktične postavitve z 2 storitvama.

> **📚 Pristop k učenju**: Ta primer se začne z minimalno arhitekturo z 2 storitvoma (API Gateway + Backend Service), ki jo lahko dejansko razporedite in se iz nje učite. Ko obvladate to osnovo, vam ponudimo navodila za razširitev v poln ekosistem mikroservisov.

## Kaj se boste naučili

Z dokončanjem tega primera boste:
- Razporedili več vsebnikov v Azure Container Apps
- Uvedli medstoritveno komunikacijo z notranjim omrežjem
- Konfigurirali skaliranje in zdravstvene preglede glede na okolje
- Spremljali porazdeljene aplikacije z Application Insights
- Razumeli vzorce uvajanja mikroservisov in priporočene prakse
- Se naučili postopne razširitve od preproste do kompleksne arhitekture

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
- ✅ Hitro razporeditev in razumevanje (25–35 minut)
- ✅ Naučite se osnovnih vzorcev mikroservisov brez kompleksnosti
- ✅ Delujoča koda, ki jo lahko spreminjate in preizkušate
- ✅ Nižji stroški za učenje (~50–100 USD/mesec v primerjavi s 300–1400 USD/mesec)
- ✅ Pridobite zaupanje, preden dodate baze podatkov in vrste sporočil

**Analogonija**: To je kot učenje vožnje. Začnete na praznem parkirišču (2 storitvi), obvladate osnove, nato nadaljujete v mestni promet (5+ storitev z bazami podatkov).

### Faza 2: Prihodnja razširitev (referenčna arhitektura)

Ko obvladate arhitekturo z 2 storitvama, jo lahko razširite na:

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

Poglejte razdelek "Expansion Guide" na koncu za navodila korak za korakom.

## Vključene funkcije

✅ **Odkritje storitev**: Samodejno odkrivanje med vsebniki na osnovi DNS  
✅ **Uravnoteženje obremenitve**: Vgrajeno uravnoteženje obremenitve med replikami  
✅ **Samodejno skaliranje**: Neodvisno skaliranje za vsako storitev glede na HTTP zahtevke  
✅ **Spremljanje zdravja**: Liveness in readiness probe za obe storitvi  
✅ **Porazdeljeno beleženje**: Centralizirano beleženje z Application Insights  
✅ **Notranje omrežje**: Varnostna medstoritvena komunikacija  
✅ **Orkestracija vsebnikov**: Samodejna namestitev in skaliranje  
✅ **Posodobitve z ničelno nedelavnostjo**: Postopne posodobitve z upravljanjem revizij  

## Predpogoji

### Potrebna orodja

Preden začnete, preverite, da imate nameščena ta orodja:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (različica 1.0.0 ali novejša)
   ```bash
   azd version
   # Pričakovani izhod: azd različica 1.0.0 ali novejša
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (različica 2.50.0 ali novejša)
   ```bash
   az --version
   # Pričakovani izhod: azure-cli 2.50.0 ali novejša
   ```

3. **[Docker](https://www.docker.com/get-started)** (za lokalni razvoj/testiranje - neobvezno)
   ```bash
   docker --version
   # Pričakovan izhod: različica Dockera 20.10 ali novejša
   ```

### Zahteve za Azure

- Aktivna **Azure naročnina** ([ustvari brezplačen račun](https://azure.microsoft.com/free/))
- Pooblastila za ustvarjanje virov v vaši naročnini
- Vloga **Contributor** na naročnini ali skupini virov

### Predhodno znanje

To je primer na **napredni ravni**. Morali bi imeti:
- Dokončan [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) 
- Osnovno razumevanje arhitekture mikroservisov
- Znanje o REST API-jih in HTTP
- Razumevanje konceptov vsebnikov

**Nova pri Container Apps?** Najprej začnite s [Simple Flask API example](../../../../../examples/container-app/simple-flask-api), da se naučite osnov.

## Hiter začetek (korak za korakom)

### Korak 1: Kloniranje in navigacija

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Preverjanje uspeha**: Preverite, ali vidite `azure.yaml`:
```bash
ls
# Pričakovano: README.md, azure.yaml, infra/, src/
```

### Korak 2: Avtentikacija v Azure

```bash
azd auth login
```

To odpre vaš brskalnik za Azure avtentikacijo. Prijavite se s svojimi Azure poverilnicami.

**✓ Preverjanje uspeha**: Moral bi videti:
```
Logged in to Azure.
```

### Korak 3: Inicializacija okolja

```bash
azd init
```

**Pozivi, ki jih boste videli**:
- **Environment name**: Vnesite kratko ime (npr. `microservices-dev`)
- **Azure subscription**: Izberite svojo naročnino
- **Azure location**: Izberite regijo (npr. `eastus`, `westeurope`)

**✓ Preverjanje uspeha**: Moral bi videti:
```
SUCCESS: New project initialized!
```

### Korak 4: Namestitev infrastrukture in storitev

```bash
azd up
```

**Kaj se zgodi** (traja 8–12 minut):
1. Ustvari Container Apps okolje
2. Ustvari Application Insights za spremljanje
3. Zgradi API Gateway vsebnik (Node.js)
4. Zgradi Product Service vsebnik (Python)
5. Namesti oba vsebnika v Azure
6. Konfigurira omrežje in zdravstvene preglede
7. Nastavi spremljanje in beleženje

**✓ Preverjanje uspeha**: Moral bi videti:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Čas**: 8–12 minut

### Korak 5: Testiranje namestitve

```bash
# Pridobi končno točko prehoda
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Preizkusi stanje API prehoda
curl $GATEWAY_URL/health

# Pričakovani izhod:
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Testirajte Product Service preko gatewaya**:
```bash
# Seznam izdelkov
curl $GATEWAY_URL/api/products

# Pričakovan izhod:
# [
#   {"id":1,"name":"Prenosnik","price":999.99,"stock":50},
#   {"id":2,"name":"Miška","price":29.99,"stock":200},
#   {"id":3,"name":"Tipkovnica","price":79.99,"stock":150}
# ]
```

**✓ Preverjanje uspeha**: Obe končni točki vrneta JSON podatke brez napak.

---

**🎉 Čestitke!** Namestili ste arhitekturo mikroservisov v Azure!

## Struktura projekta

Vse datoteke implementacije so vključene—to je popoln, delujoč primer:

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

**Kaj počne vsaka komponenta:**

**Infrastructure (infra/)**:
- `main.bicep`: Orkestrira vse Azure vire in njihove odvisnosti
- `core/container-apps-environment.bicep`: Ustvari Container Apps okolje in Azure Container Registry
- `core/monitor.bicep`: Nastavi Application Insights za porazdeljeno beleženje
- `app/*.bicep`: Definicije posameznih container app z nastavitvami skaliranja in zdravstvenimi pregledi

**API Gateway (src/api-gateway/)**:
- Javno usmerjena storitev, ki usmerja zahteve na backend storitve
- Izvaja beleženje, obvladovanje napak in posredovanje zahtev
- Prikazuje medstoritveno HTTP komunikacijo

**Product Service (src/product-service/)**:
- Notranja storitev s katalogom izdelkov (v pomnilniku za preprostost)
- REST API z zdravstvenimi pregledi
- Primer vzorca backend mikroservisa

## Pregled storitev

### API Gateway (Node.js/Express)

**Vrata**: 8080  
**Dostop**: Javen (zunanji ingress)  
**Namen**: Usmerja dohodne zahteve na ustrezne backend storitve  

**Končne točke**:
- `GET /` - Informacije o storitvi
- `GET /health` - Zdravstveni pregled
- `GET /api/products` - Posreduje na product service (seznam vseh)
- `GET /api/products/:id` - Posreduje na product service (pridobi po ID)

**Ključne funkcije**:
- Usmerjanje zahtev z axios
- Centralizirano beleženje
- Obvladovanje napak in upravljanje časovnih omejitev
- Odkritje storitev preko spremenljivk okolja
- Integracija z Application Insights

**Poudarek kode** (`src/api-gateway/app.js`):
```javascript
// Notranja komunikacija med storitvami
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Vrata**: 8000  
**Dostop**: Le interno (brez zunanjega ingresa)  
**Namen**: Upravlja katalog izdelkov v pomnilniku  

**Končne točke**:
- `GET /` - Informacije o storitvi
- `GET /health` - Zdravstveni pregled
- `GET /products` - Seznam vseh izdelkov
- `GET /products/<id>` - Pridobi izdelek po ID

**Ključne funkcije**:
- RESTful API z Flaskom
- Shramba izdelkov v pomnilniku (preprosto, brez baze podatkov)
- Spremljanje zdravja z probes
- Strukturirano beleženje
- Integracija z Application Insights

**Podatkovni model**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**Zakaj le interno?**
Product Service ni javno izpostavljen. Vse zahteve morajo iti preko API Gatewaya, ki zagotavlja:
- Varnost: Nadzorovana izhodiščna točka
- Prilagodljivost: Spreminjanje backenda brez vpliva na odjemalce
- Spremljanje: Centralizirano beleženje zahtev

## Razumevanje storitvene komunikacije

### Kako storitve komunicirajo med seboj

V tem primeru API Gateway komunicira s Product Service preko **notranjih HTTP klicev**:

```javascript
// API prehod (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Izvedi notranji HTTP zahtevek
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Ključne točke**:

1. **Odkritje na osnovi DNS**: Container Apps samodejno zagotavlja DNS za notranje storitve
   - Product Service FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - Poenostavljeno kot: `http://product-service` (Container Apps to razreši)

2. **Brez javne izpostavljenosti**: Product Service ima v Bicep `external: false`
   - Dostopen le znotraj Container Apps okolja
   - Ni dosegljiv z interneta

3. **Spremenljivke okolja**: URL-ji storitev se vnašajo ob razmestitvi
   - Bicep posreduje interno FQDN gatewayu
   - V kodi aplikacije ni trdo kodiranih URL-jev

**Analogonija**: To je kot pisarne v stavbi. API Gateway je recepcija (javna), Product Service pa pisarna (samo interno). Obiskovalci morajo iti skozi recepcijo, da pridejo do pisarne.

## Možnosti namestitve

### Polna namestitev (priporočeno)

```bash
# Namesti infrastrukturo in obe storitve
azd up
```

To namesti:
1. Container Apps okolje
2. Application Insights
3. Container Registry
4. API Gateway vsebnik
5. Product Service vsebnik

**Čas**: 8–12 minut

### Namesti posamezno storitev

```bash
# Razporedi le eno storitev (po začetnem azd up)
azd deploy api-gateway

# Ali razporedi storitev product
azd deploy product-service
```

**Uporaba**: Ko ste posodobili kodo v eni storitvi in želite ponovno namestiti samo to storitev.

### Posodobi konfiguracijo

```bash
# Spremeni parametre skaliranja
azd env set GATEWAY_MAX_REPLICAS 30

# Ponovno razporedi z novo konfiguracijo
azd up
```

## Konfiguracija

### Nastavitve skaliranja

Obe storitvi sta konfigurirani z avtomatskim skaliranjem na osnovi HTTP v svojih Bicep datotekah:

**API Gateway**:
- Min replik: 2 (vedno vsaj 2 za razpoložljivost)
- Max replik: 20
- Sprožilec skaliranja: 50 sočasnih zahtev na repliko

**Product Service**:
- Min replik: 1 (lahko skalira na nič, če je potrebno)
- Max replik: 10
- Sprožilec skaliranja: 100 sočasnih zahtev na repliko

**Prilagajanje skaliranja** (v `infra/app/*.bicep`):
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
- Razlog: Obravnava ves zunanji promet

**Product Service**:
- CPU: 0.5 vCPU
- Pomnilnik: 1 GiB
- Razlog: Lahke operacije v pomnilniku

### Zdravstveni pregledi

Obe storitvi vključujeta liveness in readiness probe:

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
- **Liveness**: Če zdravstveni pregled ne uspe, Container Apps ponovno zažene vsebnik
- **Readiness**: Če ni pripravljen, Container Apps ne preusmerja prometa na to repliko



## Spremljanje in opazovanje

### Ogled dnevnikov storitev

```bash
# Ogled dnevnikov z ukazom azd monitor
azd monitor --logs

# Ali pa uporabite Azure CLI za določene Container Apps:
# Pretakanje dnevnikov iz API Gateway
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# Ogled nedavnih dnevnikov storitve izdelka
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**Pričakovani izhod**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Poizvedbe za Application Insights

Odprite Application Insights v Azure Portal in poženite te poizvedbe:

**Najdi počasne zahteve**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Sledi klicem med storitvami**:
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

### Dostop do nadzorne plošče za spremljanje

```bash
# Pridobi podrobnosti storitve Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Odpri spremljanje v Azure Portalu
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Metrične v živo

1. Odprite Application Insights v Azure Portal
2. Kliknite "Live Metrics"
3. Oglejte si zahteve v realnem času, napake in delovanje
4. Preizkusite z izvajanjem: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Praktične vaje

[Opomba: Oglejte si celotne vaje zgoraj v razdelku "Practical Exercises" za podrobna navodila po korakih, vključno s preverjanjem namestitve, spreminjanjem podatkov, testi samodejnega skaliranja, obvladovanjem napak in dodajanjem tretje storitve.]

## Analiza stroškov

### Ocenjeni mesečni stroški (za ta primer z 2 storitvama)

| Resource | Configuration | Estimated Cost |
|----------|--------------|----------------|
| API Gateway | 2-20 replicas, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replicas, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic tier | $5 |
| Application Insights | 1-2 GB/month | $5-10 |
| Log Analytics | 1 GB/month | $3 |
| **Skupaj** | | **$58-243/month** |

**Razčlenitev stroškov po rabi**:
- **Nizek promet** (testiranje/učenje): ~60 USD/mesec
- **Zmeren promet** (mala produkcija): ~120 USD/mesec
- **Visok promet** (zaseda obdobja): ~240 USD/mesec

### Nasveti za optimizacijo stroškov

1. **Skaliranje na nič za razvoj**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Uporabite Consumption plan za Cosmos DB** (ko ga dodate):
   - Plačajte samo za to, kar porabite
   - Brez minimalnih stroškov

3. **Nastavite vzorčenje v Application Insights**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Vzemi vzorec 50 % zahtev
   ```

4. **Počistite, ko ne potrebujete**:
   ```bash
   azd down
   ```

### Možnosti brezplačnega nivoja
For learning/testing, consider:
- Uporabite brezplačne kredite Azure (prvih 30 dni)
- Ohranite minimalno število replik
- Izbrišite po testiranju (brez nadaljnjih stroškov)

---

## Cleanup

Da se izognete nadaljnjim stroškom, izbrišite vse vire:

```bash
azd down --force --purge
```

**Poziv za potrditev**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Vnesite `y` za potrditev.

**Kaj se izbriše**:
- Container Apps Environment
- Obe Container Apps (gateway in storitev izdelkov)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ Preverite čiščenje**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Naj bi vrnilo prazno.

---

## Expansion Guide: From 2 to 5+ Services

Ko obvladate to arhitekturo z 2 storitvama, jo lahko razširite tako:

### Phase 1: Add Database Persistence (Next Step)

**Dodajte Cosmos DB za storitev izdelkov**:

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

2. Posodobite storitev izdelkov, da uporablja Cosmos DB namesto podatkov v pomnilniku

3. Ocenjeni dodatni strošek: ~$25/month (serverless)

### Phase 2: Add Third Service (Order Management)

**Ustvarite storitev naročil**:

1. New folder: `src/order-service/` (Python/Node.js/C#)
2. New Bicep: `infra/app/order-service.bicep`
3. Posodobite API Gateway, da usmerja `/api/orders`
4. Dodajte Azure SQL Database za trajno shranjevanje naročil

**Arhitektura postane**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Phase 3: Add Async Communication (Service Bus)

**Uvedite arhitekturo, vodeno z dogodki**:

1. Dodajte Azure Service Bus: `infra/core/servicebus.bicep`
2. Storitev izdelkov objavlja dogodke "ProductCreated"
3. Storitev naročil se naroči na dogodke izdelkov
4. Dodajte storitev obveščanja za obdelavo dogodkov

**Vzorec**: Zahteva/Odgovor (HTTP) + Dogodkovno usmerjeno (Service Bus)

### Phase 4: Add User Authentication

**Uvedite storitev uporabnikov**:

1. Create `src/user-service/` (Go/Node.js)
2. Dodajte Azure AD B2C ali prilagojeno JWT avtentikacijo
3. API Gateway preverja žetone
4. Storitev preverja uporabniške pravice

### Phase 5: Production Readiness

**Dodajte te komponente**:
- Azure Front Door (globalno uravnoteženje obremenitve)
- Azure Key Vault (upravljanje skrivnosti)
- Azure Monitor Workbooks (prilagojeni nadzorni paneli)
- CI/CD pipeline (GitHub Actions)
- Blue-Green uvajanja
- Managed Identity za vse storitve

**Celotni stroški produkcijske arhitekture**: ~$300-1,400/month

---

## Learn More

### Related Documentation
- [Azure Container Apps Documentation](https://learn.microsoft.com/azure/container-apps/)
- [Microservices Architecture Guide](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights for Distributed Tracing](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Next Steps in This Course
- ← Previous: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - Začetniški primer z enim kontejnerjem
- → Next: [AI Integration Guide](../../../../../examples/docs/ai-foundry) - Dodajte AI zmogljivosti
- 🏠 [Course Home](../../README.md)

### Comparison: When to Use What

**Single Container App** (Primer Simple Flask API):
- ✅ Preproste aplikacije
- ✅ Monolitna arhitektura
- ✅ Hitro uvajanje
- ❌ Omejena skalabilnost
- **Stroški**: ~$15-50/month

**Microservices** (Ta primer):
- ✅ Kompleksne aplikacije
- ✅ Neodvisno skaliranje po storitvah
- ✅ Avtonomija ekip (različne storitve, različne ekipe)
- ❌ Bolj zapleteno upravljanje
- **Stroški**: ~$60-250/month

**Kubernetes (AKS)**:
- ✅ Največji nadzor in prilagodljivost
- ✅ Večoblačna prenosljivost
- ✅ Napredno omrežje
- ❌ Zahteva strokovno znanje Kubernetes
- **Stroški**: ~$150-500/month minimum

**Priporočilo**: Začnite s Container Apps (ta primer), preklopite na AKS le, če potrebujete funkcije specifične za Kubernetes.

---

## Frequently Asked Questions

**Q: Zakaj le 2 storitve namesto 5+?**  
A: Izobraževalni napredek. Obvladujte osnovne pojme (komunikacija med storitvami, spremljanje, skaliranje) s preprostim primerom, preden dodate kompleksnost. Vzorce, ki se jih naučite tukaj, lahko uporabite v arhitekturah s 100 storitvami.

**Q: Lahko sam dodam več storitev?**  
A: Seveda! Sledite zgornjemu vodniku za razširitev. Vsaka nova storitev sledi istemu vzorcu: ustvarite mapo src, ustvarite Bicep datoteko, posodobite azure.yaml, razporedite.

**Q: Je to primerno za produkcijo?**  
A: To je trdna osnova. Za produkcijo dodajte: managed identity, Key Vault, trajne baze podatkov, CI/CD pipeline, opomnike za spremljanje in strategijo za varnostne kopije.

**Q: Zakaj ne uporabiti Dapr ali drugega service masha?**  
A: Zaradi enostavnosti pri učenju. Ko razumete izvorno mreženje Container Apps, lahko dodate Dapr za napredne scenarije.

**Q: Kako odpravljam napake lokalno?**  
A: Zaženite storitve lokalno z Dockerjem:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: Ali lahko uporabim različne programske jezike?**  
A: Da! Ta primer prikazuje Node.js (gateway) + Python (storitev izdelkov). Lahko kombinirate poljubne jezike, ki tečejo v kontejnerjih.

**Q: Kaj, če nimam Azure kreditov?**  
A: Uporabite Azure brezplačno plast (prvih 30 dni za nove račune) ali razporedite za kratko testno obdobje in takoj izbrišite.

---

> **🎓 Povzetek učne poti**: Naučili ste se razmestiti arhitekturo z več storitvami z avtomatskim skaliranjem, interno mreženje, centralizirano spremljanje in vzorce primere za produkcijo. Ta osnova vas pripravi na kompleksne distribuirane sisteme in podjetniške mikrostoritvene arhitekture.

**📚 Navigacija po tečaju:**
- ← Previous: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → Next: [Database Integration Example](../../../../../examples/database-app)
- 🏠 [Course Home](../../../README.md)
- 📖 [Container Apps Best Practices](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Izjava o omejitvi odgovornosti:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v izvirnem jeziku velja za avtoritativni vir. Za kritične informacije priporočamo strokovni človeški prevod. Ne odgovarjamo za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->