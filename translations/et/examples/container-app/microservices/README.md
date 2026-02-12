# Mikroteenuste arhitektuur - Container App näide

⏱️ **Eeldatav aeg**: 25-35 minutit | 💰 **Eeldatav kulu**: ~$50-100/kuus | ⭐ **Kompleksus**: Edasijõudnud

**Lihtsustatud, kuid funktsionaalne** mikroteenuste arhitektuur, mis on juurutatud Azure Container Appsi peale kasutades AZD CLI-t. See näide demonstreerib teenustevahelist suhtlust, konteinerite orkestreerimist ja jälgimist praktilise 2-teenusega seadistusega.

> **📚 Õppimisviis**: See näide algab minimaalse 2-teenusega arhitektuuriga (API Gateway + Backend Service), mida saad tõesti juurutada ja õppida. Pärast selle aluse valdamist anname juhiseid täisväärtusliku mikroteenuste ökosüsteemi laiendamiseks.

## Mida Sa Õpid

Selle näite läbimisel saad:
- Juurutada mitmeid konteinerid Azure Container Appsi peale
- Rakendada teenustevahelist suhtlust sisevõrgu abil
- Seadistada keskkonnapõhist skaleerimist ja tervisekontrolle
- Jälgida hajutatud rakendusi Application Insightsi abil
- Mõista mikroteenuste juurutamise mustreid ja parimaid tavasid
- Õppida progressiivset laiendamist lihtsast keerukamasse arhitektuuri

## Arhitektuur

### 1. faas: Mida ehitame (sisaldub selles näites)

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

**Miks alustada lihtsast?**
- ✅ Kiire juurutus ja mõistmine (25-35 minutit)
- ✅ Õpi põhiteadmisi mikroteenuste mustritest ilma keerukuseta
- ✅ Töötav kood, mida saad muuta ja katsetada
- ✅ Madalam õppemaksumus (~$50-100/kuus vs $300-1400/kuus)
- ✅ Ehita enesekindlust enne andmebaaside ja sõnumijadade lisamist

**Võrdlus**: Mõtle sellele nii nagu autojuhtimise õppimisele. Alustad tühjast parklast (2 teenust), õpid põhialused selgeks ja liigud edasi linna liiklusse (5+ teenust koos andmebaasidega).

### 2. faas: Tuleviku laiendamine (viitearhitektuur)

Kui oled 2-teenuse arhitektuuri läbi töötanud, saad laiendada:

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

Vaata lõpus olevat jaotist "Laiendamise juhend" samm-sammuliste juhiste jaoks.

## Sisaldatud funktsioonid

✅ **Teenuseavastus**: automaatne DNS-põhine avastus konteinerite vahel  
✅ **Koormuse tasakaalustamine**: sisse ehitatud koormuse jaotus replikate vahel  
✅ **Automaatne skaleerimine**: teenusepõhine sõltumatu skaleerimine HTTP päringute alusel  
✅ **Tervise jälgimine**: mõlema teenuse jaoks elavuse ja valmisoleku sondid  
✅ **Hajutatud logimine**: keskselt kogutud logid Application Insightsis  
✅ **Sisevõrk**: turvaline teenustevaheline suhtlus  
✅ **Konteinerite orkestreerimine**: automaatne juurutus ja skaleerimine  
✅ **Null-seiskamise uuendused**: järkjärgulised uuendused koos revisjonide haldusega  

## Eeltingimused

### Vajalikud tööriistad

Enne alustamist kontrolli, et sul on need tööriistad paigaldatud:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versioon 1.0.0 või uuem)  
   ```bash
   azd version
   # Oodatav väljund: azd versioon 1.0.0 või uuem
   ```
  
2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versioon 2.50.0 või uuem)  
   ```bash
   az --version
   # Oodatav väljund: azure-cli 2.50.0 või uuem
   ```
  
3. **[Docker](https://www.docker.com/get-started)** (kohalikuks arenduseks/testimiseks – vabatahtlik)  
   ```bash
   docker --version
   # Oodatud väljund: Docker versioon 20.10 või uuem
   ```
  
### Azure nõuded

- Aktiivne **Azure tellimus** ([loo tasuta konto](https://azure.microsoft.com/free/))
- Õigused ressursside loomiseks tellimuses
- **Contributor** roll tellimuse või ressursigrupi peal

### Teadmiste eeldused

See on **edasijõudnud tase**. Sa peaksid olema:
- Läbinud [Simple Flask API näite](../../../../../examples/container-app/simple-flask-api)  
- Mõistma mikroteenuste arhitektuuri põhialuseid
- Tutvunud REST API-de ja HTTP-ga
- Mõistma konteinerite mõisteid

**Uus konteinerirakendustega?** Alusta esmalt [Simple Flask API näitega](../../../../../examples/container-app/simple-flask-api), et õppida baasilisi asju.

## Kiire algus (samm-sammuline)

### 1. samm: klooni ja ava kaust

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```
  
**✓ Edukas kontroll**: Veendu, et näed `azure.yaml` faili:  
```bash
ls
# Oodatud: README.md, azure.yaml, infra/, src/
```
  
### 2. samm: Logi sisse Azuresse

```bash
azd auth login
```
  
See avab brauseri Azure autentimiseks. Logi sisse oma Azure kasutajaga.

**✓ Edukas kontroll**: Tulemus peaks olema:  
```
Logged in to Azure.
```
  
### 3. samm: Algatame keskkonna

```bash
azd init
```
  
**Näidatud küsimused**:
- **Keskkonna nimi**: Sisesta lühike nimi (nt `microservices-dev`)
- **Azure tellimus**: Vali oma tellimus
- **Azure asukoht**: Vali regioon (nt `eastus`, `westeurope`)

**✓ Edukas kontroll**: Näed järgmist:  
```
SUCCESS: New project initialized!
```
  
### 4. samm: Juuruta infrastruktuur ja teenused

```bash
azd up
```
  
**Protsess (8-12 minutit):**  
1. Luuakse Container Apps keskkond  
2. Luuakse Application Insights jälgimiseks  
3. Koostatakse API Gateway konteiner (Node.js)  
4. Koostatakse Product Service konteiner (Python)  
5. Juurutatakse mõlemad konteinerid Azuresse  
6. Seadistatakse võrgustik ja tervisekontrollid  
7. Seadistatakse jälgimine ja logimine

**✓ Edukas kontroll**: Näed järgmist:  
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```
  
**⏱️ Aeg**: 8-12 minutit

### 5. samm: Testi juurutust

```bash
# Saa värava lõpp-punkt
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Testi API Gateway tervist
curl $GATEWAY_URL/health

# Oodatav väljund:
# {"status":"tervislik","service":"api-urlukas","timestamp":"2025-11-19T10:30:00Z"}
```
  
**Testi product service’i gateway kaudu**:  
```bash
# Toodete nimekiri
curl $GATEWAY_URL/api/products

# Oodatav väljund:
# [
#   {"id":1,"name":"Sülearvuti","price":999.99,"stock":50},
#   {"id":2,"name":"Hiir","price":29.99,"stock":200},
#   {"id":3,"name":"Klaviatuur","price":79.99,"stock":150}
# ]
```
  
**✓ Edukas kontroll**: Mõlemad lõpp-punktid tagastavad JSON andmeid ilma vigadeta.

---

**🎉 Palju õnne!** Sa oled juurutanud mikroteenuste arhitektuuri Azures!

## Projekti struktuur

Kõik rakendusfailid on kaasas – tegemist on täieliku ja töökorras näitega:

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
  
**Komponentide ülevaade:**

**Infrastruktuur (infra/)**:  
- `main.bicep`: koordineerib kõiki Azure ressursse ja nende omavahelisi seoseid  
- `core/container-apps-environment.bicep`: loob Container Apps keskkonna ja Azure Container Registry  
- `core/monitor.bicep`: seadistab Application Insights hajutatud logimiseks  
- `app/*.bicep`: üksikute konteinerirakenduste definitsioonid koos skaleerimise ja tervisekontrollidega

**API Gateway (src/api-gateway/)**:  
- Avaliku ligipääsuga teenus, mis suunab päringud backend teenustele  
- Rakendab logimist, vigade haldamist ja päringute edastamist  
- Näitab teenustevahelist HTTP suhtlust

**Product Service (src/product-service/)**:  
- Sisemine teenus toodete kataloogiga (lihtsustatult mälus)  
- REST API koos tervisekontrollidega  
- Näide backend mikroteenuse mustrist

## Teenuste ülevaade

### API Gateway (Node.js/Express)

**Port**: 8080  
**Ligipääs**: Avalik (väline sissetulev liiklus)  
**Eesmärk**: Suunata sissetulevaid päringuid õigetele backend teenustele

**Lõpp-punktid**:  
- `GET /` - Teenuse info  
- `GET /health` - Tervise kontroll  
- `GET /api/products` - Edastab product service’ile (kuva kõik)  
- `GET /api/products/:id` - Edastab product service’ile (kuva kindel ID)  

**Olulised funktsioonid**:  
- Päringute suunamine using axios  
- Keskne logimine  
- Vigade haldamine ja aegumiste juhtimine  
- Teenuse avastus keskkonnamuutujate kaudu  
- Application Insights integreerimine

**Koodi näide** (`src/api-gateway/app.js`):  
```javascript
// Sise-teenuste suhtlus
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```
  
### Product Service (Python/Flask)

**Port**: 8000  
**Ligipääs**: Ainult sisemine (ei ole avatud väliselt)  
**Eesmärk**: Halda toodete kataloogi mäluandmetega

**Lõpp-punktid**:  
- `GET /` - Teenuse info  
- `GET /health` - Tervise kontroll  
- `GET /products` - Näita kõiki tooteid  
- `GET /products/<id>` - Näita toodet ID järgi  

**Olulised funktsioonid**:  
- RESTfull API Flaskiga  
- Mälus olevate toodete hoidla (lihtne, andmebaasi ei vaja)  
- Tervise jälgimine sondidega  
- Struktureeritud logimine  
- Application Insights integratsioon

**Andmemudel**:  
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```
  
**Miks ainult sisene?**  
Product service ei ole avalikult ligipääsetav. Kõik päringud peavad minema API Gateway kaudu, mis tagab:
- Turvalisuse: kontrollitud juurdepääs
- Paindlikkuse: backend’i saab muuta ilma klienti mõjutamata
- Jälgimise: keskne päringute logimine

## Teenuste vahelise suhtluse mõistmine

### Kuidas teenused omavahel suhtlevad

Selles näites suhtleb API Gateway Product Service’iga kasutades **siseid HTTP-päringuid**:

```javascript
// API värav (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Tee sisemine HTTP päring
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```
  
**Olulised punktid**:

1. **DNS-põhine avastus**: Container Apps pakub automaatselt DNS-i sisemistele teenustele  
   - Product Service’i FQDN: `product-service.internal.<environment>.azurecontainerapps.io`  
   - Lihtsustatud kujul: `http://product-service` (Container Apps lahendab selle)  

2. **Ei ole avalikult ligipääsetav**: Product Service’il on Biceps `external: false`  
   - Juurdepääs lubatud ainult Container Apps keskkonnas  
   - Internetist ei ole ligipääsu  

3. **Keskkonnamuutujad**: Teenuse URL-id süstitakse juurutuse ajal  
   - Bicep edastab sise-FQDN gateway’le  
   - Koodis ei ole kõvade URL-ide kasutamist  

**Võrdlus**: Mõtle sellele nagu kontoriruumid. API Gateway on vastuvõtulaud (avalik), Product Service on kontoriruum (ainult sisevõrk). Külalised peavad läbi vastuvõtu suurusega igasse kontorisse minema.

## Juurutamise valikud

### Täisjuurutus (soovitatav)

```bash
# Paigalda infrastruktuur ja mõlemad teenused
azd up
```
  
See juurutab:  
1. Container Apps keskkonna  
2. Application Insightsi  
3. Container Registry  
4. API Gateway konteineri  
5. Product Service konteineri

**Aeg**: 8-12 minutit

### Juuruta eraldi teenus

```bash
# Paigalda ainult üks teenus (pärast esmast azd up käivitamist)
azd deploy api-gateway

# Või paigalda toote teenus
azd deploy product-service
```
  
**Kasutusjuhtum**: Kui oled muutnud ühte teenust ja soovid ainult seda uuesti juurutada.

### Konfiguratsiooni uuendus

```bash
# Muuda skaleerimise parameetreid
azd env set GATEWAY_MAX_REPLICAS 30

# Käivita uuesti uue konfiguratsiooniga
azd up
```
  
## Konfiguratsioon

### Skaleerimise konfiguratsioon

Mõlemad teenused on seadistatud HTTP-põhise automaatse skaleerimisega oma Bicep failides:

**API Gateway**:  
- Minimaalselt replikasid: 2 (ainult olemasolevuse tagamiseks)  
- Maksimaalselt replikasid: 20  
- Skaleerimise künnis: 50 samaaegset päringut ühe replikaga  

**Product Service**:  
- Minimaalselt replikasid: 1 (vajadusel skaleerub nulli)  
- Maksimaalselt replikasid: 10  
- Skaleerimise künnis: 100 samaaegset päringut ühe replikaga  

**Kohanda skaleerimist** (failides `infra/app/*.bicep`):  
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
  
### Ressursside jaotus

**API Gateway**:  
- CPU: 1.0 vCPU  
- Mälu: 2 GiB  
- Põhjus: käsitleb kogu välist liiklust

**Product Service**:  
- CPU: 0.5 vCPU  
- Mälu: 1 GiB  
- Põhjus: kerged mälumahus tehtavad operatsioonid

### Tervisekontrollid

Mõlemas teenuses on liveness ja readiness sondid:

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
  
**Mida see tähendab**:  
- **Liveness**: kui tervisekontroll ebaõnnestub, Container Apps taaskäivitab konteineri  
- **Readiness**: kui teenus ei ole valmis, CE ei suuna sellele liiklust

## Jälgimine ja jälgitavus

### Vaata teenuste logisid

```bash
# Vaata logisid, kasutades azd monitori
azd monitor --logs

# Või kasuta Azure CLI-d konkreetsete konteinerirakenduste jaoks:
# Voogesita logisid API väravast
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# Vaata viimaseid tooteteenuse logisid
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```
  
**Oodatav väljund**:  
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```
  
### Application Insightsi päringud

Avades Azure Portalist Application Insightsi, kasuta neid päringuid:

**Leia aeglased päringud**:  
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```
  
**Jälgi teenustevahelisi kõnesid**:  
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```
  
**Eksimuste määr teenuste kaupa**:  
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```
  
**Päringute maht aja jooksul**:  
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```
  
### Ligipääs jälgimise dashboard’ile

```bash
# Hangi Application Insightsi üksikasjad
azd env get-values | grep APPLICATIONINSIGHTS

# Ava Azure Portaal jälgimiseks
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```
  
### Otse mõõdikud

1. Mine Azure Portalis Application Insightsi  
2. Vajuta "Live Metrics"  
3. Vaata reaalajas päringuid, ebaõnnestumisi ja jõudlust  
4. Testi käsklusega: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Praktilised harjutused

[Märkus: Vaata ülal "Praktilised harjutused" lõiku üksikasjalike samm-sammuliste harjutuste, sh juurutuse kontrollimise, andmete muutmise, automaatskaleerimise testide, vigade käsitlemise ja 3. teenuse lisamise kohta.]

## Kulu analüüs

### Eeldatavad kuu kulud (selle 2-teenuse näite puhul)

| Resurss | Konfiguratsioon | Eeldatav kulu |
|----------|--------------|----------------|
| API Gateway | 2-20 replikat, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replikat, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic tase | $5 |
| Application Insights | 1-2 GB/kuus | $5-10 |
| Log Analytics | 1 GB/kuus | $3 |
| **Kokku** | | **$58-243/kuus** |

**Kulu jaotus kasutuse järgi**:  
- **Vähene liiklus** (testimine/õppimine): ~$60/kuus  
- **Mõõdukas liiklus** (väike tootmine): ~$120/kuus  
- **Kõrge liiklus** (koormusperioodid): ~$240/kuus  

### Kuluoptimeerimise nipid

1. **Skaleeri arenduseks nulli**:  
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```
  
2. **Kasuta Cosmos DB tarbimisplaani** (kui see lisada):  
   - Maksad ainult kasutatud eest  
   - Miinimumtasud puuduvad  

3. **Seadista Application Insightsi proovivõtt**:  
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Võta prooviks 50% päringutest
   ```
  
4. **Korista üles, kui pole vaja**:  
   ```bash
   azd down
   ```
  
### Tasuta taseme võimalused
Õppimiseks/testimiseks kaalu:
- Kasuta Azure tasuta krediite (esimesed 30 päeva)
- Hoia koopiate arv minimaalsena
- Kustuta pärast testimist (ei teki jätkuvaid kulusid)

---

## Puhastamine

Jätkuvate kulude vältimiseks kustuta kõik ressursid:

```bash
azd down --force --purge
```

**Kinnituskäsk**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Kinnitamiseks trüki `y`.

**Mis kustutatakse**:
- Container Apps keskkond
- Mõlemad Container Apps (gateway ja toote teenus)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Ressursside grupp

**✓ Puhastamise kontroll**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Peab tagastama tühja tulemuse.

---

## Laiendamise juhend: 2-lt kuni 5+ teenuseni

Kui oled selle 2-teenuse arhitektuuri omandanud, siis siin on, kuidas laiendada:

### Faas 1: Lisa andmebaasi püsivus (järgmine samm)

**Lisa Cosmos DB toote teenuse jaoks**:

1. Loo `infra/core/cosmos.bicep`:
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

2. Uuenda toote teenus kasutama Cosmos DB-d mälu asendajana

3. Hinnanguline lisakulu: ~25$/kuus (serverless)

### Faas 2: Lisa kolmas teenus (tellimuste haldus)

**Loo tellimuste teenus**:

1. Uus kaust: `src/order-service/` (Python/Node.js/C#)
2. Uus Bicep: `infra/app/order-service.bicep`
3. Uuenda API Gateway-d routima `/api/orders`
4. Lisa Azure SQL Database tellimuste püsivuseks

**Arhitektuur muutub järgmiseks**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Faas 3: Lisa asünkroonne suhtlus (Service Bus)

**Rakenda sündmuspõhine arhitektuur**:

1. Lisa Azure Service Bus: `infra/core/servicebus.bicep`
2. Toote teenus avaldab "ProductCreated" sündmusi
3. Tellimuste teenus tellimuste sündmusi tellib
4. Lisa Notification Service sündmuste töötlemiseks

**Muster**: Taotlus/Vastus (HTTP) + Sündmuspõhine (Service Bus)

### Faas 4: Lisa kasutaja autentimine

**Rakenda Kasutaja teenus**:

1. Loo `src/user-service/` (Go/Node.js)
2. Lisa Azure AD B2C või kohandatud JWT autentimine
3. API Gateway kontrollib token'eid
4. Teenused kontrollivad kasutaja õigusi

### Faas 5: Toomisvalmidus

**Lisa need komponendid**:
- Azure Front Door (globaalne koormuse tasakaalustamine)
- Azure Key Vault (salajaste andmete haldus)
- Azure Monitor Workbooks (kohandatud armatuurlauad)
- CI/CD torujuhe (GitHub Actions)
- Sinine-Roheline juurutamine
- Haldusega identiteet kõigile teenustele

**Täieliku tootmisarhitektuuri kulu**: ~300-1,400$/kuus

---

## Rohkem infot

### Seotud dokumentatsioon
- [Azure Container Apps Dokumentatsioon](https://learn.microsoft.com/azure/container-apps/)
- [Mikroteenuste arhitektuuri juhend](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights hajutatud jälgimiseks](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Järgmised sammud selles kursuses
- ← Eelmine: [Lihtne Flask API](../../../../../examples/container-app/simple-flask-api) - algajale sobiv ühe konteineriga näide
- → Järgmine: [AI integreerimise juhend](../../../../../examples/docs/ai-foundry) - lisa AI võimekused
- 🏠 [Kursuse ava](../../README.md)

### Võrdlus: Millal kasutada mida

**Ühe konteineri rakendus** (Lihtne Flask API näide):
- ✅ Lihtsad rakendused
- ✅ Monoliitne arhitektuur
- ✅ Kiire juurutamine
- ❌ Piiratud skaleeritavus
- **Kulu**: ~15-50$/kuus

**Mikroteenused** (See näide):
- ✅ Komplekssed rakendused
- ✅ Teenusepõhine iseseisev skaleerimine
- ✅ Meeskondade autonoomia (erinevad teenused, erinevad meeskonnad)
- ❌ Halduse keerukus suurem
- **Kulu**: ~60-250$/kuus

**Kubernetes (AKS)**:
- ✅ Maksimaalne kontroll ja paindlikkus
- ✅ Multi-cloud kandepind
- ✅ Täiustatud võrgustik
- ❌ Vajab Kubernetes ekspertiisi
- **Kulu**: alates ~150-500$/kuus

**Soovitus**: Alusta Container Apps (see näide), liiguta AKS-i alles siis kui vajad Kubernetes-spetsiifilisi funktsioone.

---

## Korduma kippuvad küsimused

**K: Miks ainult 2 teenust, mitte 5+?**  
V: Hariduslik järjekord. Õpi esmalt põhitõed (teenuste suhtlus, jälgimine, skaleerimine) lihtsa näitega, enne keerukuse lisamist. Siinsed mustrid sobivad 100-teenuse arhitektuurile.

**K: Kas ise saan rohkem teenuseid lisada?**  
V: Absoluutselt! Järgi ülaltoodud laiendusjuhendit. Iga uus teenus järgib sama mustrit: loo src kaust, loo Bicep fail, uuenda azure.yaml, juuruta.

**K: Kas see on tootmisvalmis?**  
V: See on kindel alus. Tootmiseks lisa: haldusidentiteet, Key Vault, püsivad andmebaasid, CI/CD torujuhe, seire häired, varundamisstrateegia.

**K: Miks mitte kasutada Dapr-i või muud teenuste võrku?**  
V: Hoia õppimine lihtsana. Kui mõistad Container Apps natiivset võrgustamist, saad hiljem Dapr-i keerukamates stsenaariumites lisada.

**K: Kuidas kohalikult siluda?**  
V: Käivita teenused kohalikus Dockeris:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**K: Kas saan kasutada erinevaid programmeerimiskeeli?**  
V: Jah! See näide kasutab Node.js-i (gateway) + Pythoni (toote teenus). Võid kombineerida kõiki keeli, mis konteinerites töötavad.

**K: Mis saab, kui mul pole Azure krediite?**  
V: Kasuta Azure tasuta kihti (esimesed 30 päeva uutel kontodel) või juuruta lühiajaliseks testimiseks ning kustuta kohe.

---

> **🎓 Õppeteekonna kokkuvõte**: Oled õppinud juurutama mitme teenusega arhitektuuri automaatse skaleerimisega, sisevõrgu, tsentraalse seire ja tootmisvalmiduse mustritega. See alus valmistab sind ette keerukate hajutatud süsteemide ja ettevõtte mikroteenuste arhitektuuride jaoks.

**📚 Kursuse navigeerimine:**
- ← Eelmine: [Lihtne Flask API](../../../../../examples/container-app/simple-flask-api)
- → Järgmine: [Andmebaasi integreerimise näide](../../../../../examples/database-app)
- 🏠 [Kursuse ava](../../../README.md)
- 📖 [Container Appsi parimad praktikad](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:
See dokument on tõlgitud kasutades tehisintellektil põhinevat tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi püüame täpsust, palun arvestage, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument tema emakeeles tuleks pidada autoriteetseks allikaks. Tähtsa teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tingitud arusaamatuste või valesti mõistmiste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->