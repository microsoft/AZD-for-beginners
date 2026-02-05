# Mikroteenuste arhitektuur - konteinerirakenduse näide

⏱️ **Hinnanguline aeg**: 25-35 minutit | 💰 **Hinnanguline kulu**: ~$50-100/kuus | ⭐ **Keerukus**: Edasijõudnud

**Lihtsustatud, kuid funktsionaalne** mikroteenuste arhitektuur, mis on juurutatud Azure Container Apps abil, kasutades AZD CLI-d. See näide demonstreerib teenustevahelist suhtlust, konteinerite orkestreerimist ja monitooringut praktilise kahe teenuse seadistusega.

> **📚 Õppimisviis**: See näide algab minimaalse kahe teenuse arhitektuuriga (API Gateway + Backend Service), mida saate tegelikult juurutada ja õppida. Pärast selle aluse omandamist pakume juhiseid, kuidas laiendada täisväärtuslikuks mikroteenuste ökosüsteemiks.

## Mida õpite

Selle näite läbimisega saate:
- Juurutada mitu konteinerit Azure Container Apps keskkonda
- Rakendada teenustevahelist suhtlust sisemise võrgustiku abil
- Konfigureerida keskkonnapõhist skaleerimist ja tervisekontrolle
- Monitoorida hajutatud rakendusi Application Insights abil
- Mõista mikroteenuste juurutusmustreid ja parimaid tavasid
- Õppida, kuidas liikuda lihtsast keerukama arhitektuurini

## Arhitektuur

### 1. etapp: Mida me ehitame (sisaldub selles näites)

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
- ✅ Juurutamine ja mõistmine kiiresti (25-35 minutit)
- ✅ Õppida mikroteenuste põhialuseid ilma keerukuseta
- ✅ Töötav kood, mida saate muuta ja katsetada
- ✅ Madalamad õppimiskulud (~$50-100/kuus vs $300-1400/kuus)
- ✅ Enesekindluse suurendamine enne andmebaaside ja sõnumijärjekordade lisamist

**Võrdlus**: Mõelge sellele nagu autoga sõitma õppimisele. Alustate tühjast parklast (2 teenust), omandate põhioskused ja liigute seejärel linnaliiklusesse (5+ teenust koos andmebaasidega).

### 2. etapp: Tulevane laiendus (viitearhitektuur)

Kui olete kahe teenuse arhitektuuri omandanud, saate seda laiendada:

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

Vaadake jaotist "Laiendusjuhend" lõpus samm-sammuliste juhiste jaoks.

## Sisaldatud funktsioonid

✅ **Teenuste avastamine**: Automaatne DNS-põhine avastamine konteinerite vahel  
✅ **Koormuse tasakaalustamine**: Sisseehitatud koormuse tasakaalustamine replikate vahel  
✅ **Automaatne skaleerimine**: Iga teenuse sõltumatu skaleerimine HTTP-päringute alusel  
✅ **Tervise monitooring**: Elususe ja valmisoleku kontrollid mõlemale teenusele  
✅ **Hajutatud logimine**: Keskne logimine Application Insights abil  
✅ **Sisemine võrgustik**: Turvaline teenustevaheline suhtlus  
✅ **Konteinerite orkestreerimine**: Automaatne juurutamine ja skaleerimine  
✅ **Katkestusteta uuendused**: Järk-järgulised uuendused koos versioonihaldusega  

## Eeltingimused

### Vajalikud tööriistad

Enne alustamist veenduge, et teil on need tööriistad installitud:

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

3. **[Docker](https://www.docker.com/get-started)** (kohalikuks arenduseks/testimiseks - valikuline)
   ```bash
   docker --version
   # Oodatav väljund: Dockeri versioon 20.10 või uuem
   ```

### Azure'i nõuded

- Aktiivne **Azure'i tellimus** ([loo tasuta konto](https://azure.microsoft.com/free/))
- Õigused ressursside loomiseks oma tellimuses
- **Kaastöötaja** roll tellimuses või ressursigrupis

### Teadmiste eeltingimused

See on **edasijõudnud taseme** näide. Teil peaks olema:
- Läbitud [Lihtsa Flask API näide](../../../../../examples/container-app/simple-flask-api) 
- Mikroteenuste arhitektuuri põhialuste mõistmine
- REST API-de ja HTTP tundmine
- Konteinerite kontseptsioonide mõistmine

**Uus konteinerirakenduste kasutaja?** Alustage esmalt [Lihtsa Flask API näitest](../../../../../examples/container-app/simple-flask-api), et õppida põhitõdesid.

## Kiirstart (samm-sammuline juhend)

### Samm 1: Klooni ja liigu kausta

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Edu kontroll**: Veenduge, et näete faili `azure.yaml`:
```bash
ls
# Oodatud: README.md, azure.yaml, infra/, src/
```

### Samm 2: Autendi Azure'iga

```bash
azd auth login
```

See avab teie brauseris Azure'i autentimise. Logige sisse oma Azure'i mandaatidega.

**✓ Edu kontroll**: Peaksite nägema:
```
Logged in to Azure.
```

### Samm 3: Algseadistuse loomine

```bash
azd init
```

**Küsimused, mida näete**:
- **Keskkonna nimi**: Sisestage lühike nimi (nt `microservices-dev`)
- **Azure'i tellimus**: Valige oma tellimus
- **Azure'i asukoht**: Valige piirkond (nt `eastus`, `westeurope`)

**✓ Edu kontroll**: Peaksite nägema:
```
SUCCESS: New project initialized!
```

### Samm 4: Infrastruktuuri ja teenuste juurutamine

```bash
azd up
```

**Mis juhtub** (võtab 8-12 minutit):
1. Luuakse Container Apps keskkond
2. Luuakse Application Insights monitooringuks
3. Ehitab API Gateway konteineri (Node.js)
4. Ehitab Product Service konteineri (Python)
5. Juurutab mõlemad konteinerid Azure'i
6. Konfigureerib võrgustiku ja tervisekontrollid
7. Seadistab monitooringu ja logimise

**✓ Edu kontroll**: Peaksite nägema:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Aeg**: 8-12 minutit

### Samm 5: Juurutuse testimine

```bash
# Hankige lüüsipunkt
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Testige API Gateway tervist
curl $GATEWAY_URL/health

# Oodatav väljund:
# {"status":"terve","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Testige toote teenust läbi värava**:
```bash
# Loetle tooted
curl $GATEWAY_URL/api/products

# Oodatav väljund:
# [
#   {"id":1,"name":"Sülearvuti","price":999.99,"stock":50},
#   {"id":2,"name":"Hiir","price":29.99,"stock":200},
#   {"id":3,"name":"Klaviatuur","price":79.99,"stock":150}
# ]
```

**✓ Edu kontroll**: Mõlemad lõpp-punktid tagastavad JSON-andmeid ilma vigadeta.

---

**🎉 Palju õnne!** Olete juurutanud mikroteenuste arhitektuuri Azure'i!

## Projekti struktuur

Kõik rakenduse failid on kaasas—see on täielik ja töötav näide:

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

**Mida iga komponent teeb:**

**Infrastruktuur (infra/)**:
- `main.bicep`: Orkestreerib kõik Azure'i ressursid ja nende sõltuvused
- `core/container-apps-environment.bicep`: Luuakse Container Apps keskkond ja Azure Container Registry
- `core/monitor.bicep`: Seadistab Application Insights hajutatud logimiseks
- `app/*.bicep`: Individuaalsed konteinerirakenduste definitsioonid koos skaleerimise ja tervisekontrollidega

**API Gateway (src/api-gateway/)**:
- Avalik teenus, mis suunab päringud taustateenustele
- Rakendab logimist, veakäsitlust ja päringute edastamist
- Näitab teenustevahelist HTTP suhtlust

**Product Service (src/product-service/)**:
- Sisemine teenus tootekataloogiga (lihtsuse huvides mälus)
- REST API tervisekontrollidega
- Näide taustateenuse mustrist

## Teenuste ülevaade

### API Gateway (Node.js/Express)

**Port**: 8080  
**Ligipääs**: Avalik (väline juurdepääs)  
**Eesmärk**: Suunab sissetulevad päringud sobivatele taustateenustele  

**Lõpp-punktid**:
- `GET /` - Teenuse info
- `GET /health` - Tervisekontrolli lõpp-punkt
- `GET /api/products` - Suunab toote teenusele (kõikide loetelu)
- `GET /api/products/:id` - Suunab toote teenusele (ID järgi)

**Peamised omadused**:
- Päringute suunamine axios'iga
- Keskne logimine
- Veakäsitlus ja ajahaldus
- Teenuste avastamine keskkonnamuutujate kaudu
- Application Insights integratsioon

**Koodi esiletõst** (`src/api-gateway/app.js`):
```javascript
// Sisemine teenustevaheline suhtlus
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Port**: 8000  
**Ligipääs**: Ainult sisemine (pole välist juurdepääsu)  
**Eesmärk**: Haldab tootekataloogi mälus andmetega  

**Lõpp-punktid**:
- `GET /` - Teenuse info
- `GET /health` - Tervisekontrolli lõpp-punkt
- `GET /products` - Kõikide toodete loetelu
- `GET /products/<id>` - Toote saamine ID järgi

**Peamised omadused**:
- RESTful API Flaskiga
- Mälus tootehoidla (lihtne, ilma andmebaasita)
- Tervise monitooring proovidega
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

**Miks ainult sisemine?**
Toote teenus pole avalikult kättesaadav. Kõik päringud peavad läbima API Gateway, mis pakub:
- Turvalisus: Kontrollitud juurdepääsupunkt
- Paindlikkus: Saab muuta taustateenust ilma klientide mõjutamiseta
- Monitooring: Keskne päringute logimine

## Teenustevahelise suhtluse mõistmine

### Kuidas teenused omavahel suhtlevad

Selles näites suhtleb API Gateway Product Service'iga **sisemiste HTTP-kõnede** abil:

```javascript
// API Gateway (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Tee sisemine HTTP-päring
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Peamised punktid**:

1. **DNS-põhine avastamine**: Container Apps pakub automaatselt DNS-i sisemistele teenustele
   - Product Service FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - Lihtsustatud kujul: `http://product-service` (Container Apps lahendab selle)

2. **Pole avalikku juurdepääsu**: Product Service'il on `external: false` Bicep-failis
   - Ligipääsetav ainult Container Apps keskkonnas
   - Internetist ei saa sellele ligi

3. **Keskkonnamuutujad**: Teenuse URL-id lisatakse juurutamise ajal
   - Bicep edastab sisemise FQDN-i väravale
   - Rakenduse koodis pole kõvakodeeritud URL-e

**Võrdlus**: Mõelge sellele nagu kontoriruumidele. API Gateway on vastuvõtulaud (avalik), ja Product Service on kontoriruum (ainult sisemine). Külastajad peavad vastuvõtust läbi minema, et jõuda kontorisse.
Õppimiseks/testimiseks kaalu:
- Kasuta Azure'i tasuta krediiti (esimesed 30 päeva)
- Hoia minimaalne replikate arv
- Kustuta pärast testimist (väldi pidevaid kulusid)

---

## Puhastamine

Pidevate kulude vältimiseks kustuta kõik ressursid:

```bash
azd down --force --purge
```

**Kinnituse küsimine**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Sisesta `y`, et kinnitada.

**Mis kustutatakse**:
- Container Apps Environment
- Mõlemad Container Apps (gateway ja product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ Kontrolli puhastamist**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Tulemus peaks olema tühi.

---

## Laiendamise juhend: 2 teenusest 5+ teenuseni

Kui oled 2-teenuse arhitektuuri omandanud, siis siin on, kuidas edasi liikuda:

### Faas 1: Lisa andmebaasi püsivus (järgmine samm)

**Lisa Cosmos DB Product Service'ile**:

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

2. Uuenda product service'i, et kasutada Cosmos DB-d in-memory andmete asemel

3. Hinnanguline lisakulu: ~25 $/kuus (serverless)

### Faas 2: Lisa kolmas teenus (Order Management)

**Loo Order Service**:

1. Uus kaust: `src/order-service/` (Python/Node.js/C#)
2. Uus Bicep: `infra/app/order-service.bicep`
3. Uuenda API Gateway, et suunata `/api/orders`
4. Lisa Azure SQL Database tellimuste püsivuseks

**Arhitektuur muutub**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Faas 3: Lisa asünkroonne suhtlus (Service Bus)

**Rakenda sündmuspõhine arhitektuur**:

1. Lisa Azure Service Bus: `infra/core/servicebus.bicep`
2. Product Service avaldab "ProductCreated" sündmusi
3. Order Service tellib toote sündmusi
4. Lisa Notification Service sündmuste töötlemiseks

**Muster**: Request/Response (HTTP) + Event-Driven (Service Bus)

### Faas 4: Lisa kasutaja autentimine

**Rakenda User Service**:

1. Loo `src/user-service/` (Go/Node.js)
2. Lisa Azure AD B2C või kohandatud JWT autentimine
3. API Gateway valideerib tokenid
4. Teenused kontrollivad kasutaja õigusi

### Faas 5: Valmisolek tootmiseks

**Lisa järgmised komponendid**:
- Azure Front Door (globaalne koormuse tasakaalustamine)
- Azure Key Vault (saladuste haldamine)
- Azure Monitor Workbooks (kohandatud armatuurlauad)
- CI/CD Pipeline (GitHub Actions)
- Blue-Green Deployments
- Managed Identity kõigile teenustele

**Täieliku tootmisarhitektuuri kulu**: ~300-1,400 $/kuus

---

## Lisainfo

### Seotud dokumentatsioon
- [Azure Container Apps Documentation](https://learn.microsoft.com/azure/container-apps/)
- [Microservices Architecture Guide](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights for Distributed Tracing](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Järgmised sammud selles kursuses
- ← Eelmine: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - Algajate ühe konteineri näide
- → Järgmine: [AI Integration Guide](../../../../../examples/docs/ai-foundry) - Lisa AI võimekused
- 🏠 [Kursuse avaleht](../../README.md)

### Võrdlus: Millal mida kasutada

**Üksik Container App** (Simple Flask API näide):
- ✅ Lihtsad rakendused
- ✅ Monoliitne arhitektuur
- ✅ Kiire juurutamine
- ❌ Piiratud skaleeritavus
- **Kulu**: ~15-50 $/kuus

**Mikroteenused** (See näide):
- ✅ Komplekssemad rakendused
- ✅ Sõltumatu skaleerimine iga teenuse jaoks
- ✅ Meeskonna autonoomia (erinevad teenused, erinevad meeskonnad)
- ❌ Keerulisem hallata
- **Kulu**: ~60-250 $/kuus

**Kubernetes (AKS)**:
- ✅ Maksimaalne kontroll ja paindlikkus
- ✅ Multi-cloud portatiivsus
- ✅ Täiustatud võrgustik
- ❌ Vajab Kubernetes'i ekspertiisi
- **Kulu**: ~150-500 $/kuus minimaalselt

**Soovitus**: Alusta Container Apps'iga (see näide), liigu AKS-i ainult siis, kui vajad Kubernetes-spetsiifilisi funktsioone.

---

## Korduma kippuvad küsimused

**K: Miks ainult 2 teenust, mitte 5+?**  
V: Hariduslik progress. Õpi põhitõed (teenuste suhtlus, monitooring, skaleerimine) lihtsa näitega enne keerukuse lisamist. Siin õpitud mustrid kehtivad ka 100-teenuse arhitektuurides.

**K: Kas ma saan ise rohkem teenuseid lisada?**  
V: Absoluutselt! Järgi ülaltoodud laiendamise juhendit. Iga uus teenus järgib sama mustrit: loo src kaust, loo Bicep fail, uuenda azure.yaml, juuruta.

**K: Kas see on tootmisvalmis?**  
V: See on tugev alus. Tootmiseks lisa: managed identity, Key Vault, püsivad andmebaasid, CI/CD pipeline, monitooringu teavitused ja varundusstrateegia.

**K: Miks mitte kasutada Dapr'i või muud service mesh'i?**  
V: Hoia õppimine lihtne. Kui mõistad Container Apps'i loomulikku võrgustikku, saad hiljem lisada Dapr'i keerukamate stsenaariumide jaoks.

**K: Kuidas ma saan lokaalselt debug'ida?**  
V: Käivita teenused lokaalselt Dockeriga:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**K: Kas ma saan kasutada erinevaid programmeerimiskeeli?**  
V: Jah! Näites on Node.js (gateway) + Python (product service). Võid segada mis tahes keeli, mis töötavad konteinerites.

**K: Mis siis, kui mul pole Azure'i krediiti?**  
V: Kasuta Azure'i tasuta taset (esimesed 30 päeva uute kontodega) või juuruta lühikesteks testimisperioodideks ja kustuta kohe.

---

> **🎓 Õppimise teekonna kokkuvõte**: Oled õppinud juurutama mitme teenuse arhitektuuri automaatse skaleerimise, sisemise võrgustiku, tsentraliseeritud monitooringu ja tootmisvalmis mustritega. See alus valmistab sind ette keerukate hajutatud süsteemide ja ettevõtte mikroteenuste arhitektuuride jaoks.

**📚 Kursuse navigeerimine:**
- ← Eelmine: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → Järgmine: [Database Integration Example](../../../../../examples/database-app)
- 🏠 [Kursuse avaleht](../../README.md)
- 📖 [Container Apps Best Practices](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta arusaamatuste või valesti tõlgenduste eest, mis võivad tekkida selle tõlke kasutamise tõttu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->