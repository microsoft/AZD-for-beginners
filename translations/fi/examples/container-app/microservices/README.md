# Mikropalveluarkkitehtuuri - Esimerkki konttisovelluksesta

⏱️ **Arvioitu aika**: 25-35 minuuttia | 💰 **Arvioidut kustannukset**: ~50-100 $/kk | ⭐ **Vaikeustaso**: Edistynyt

**Yksinkertaistettu mutta toimiva** mikropalveluarkkitehtuuri, joka otetaan käyttöön Azure Container Apps -ympäristössä AZD CLI:n avulla. Tämä esimerkki havainnollistaa palveluiden välistä viestintää, konttien orkestrointia ja valvontaa käytännön 2-palvelun kokoonpanolla.

> **📚 Oppimislähestymistapa**: Tämä esimerkki alkaa minimaalisella 2-palvelun arkkitehtuurilla (API Gateway + Backend Service), jonka voit oikeasti ottaa käyttöön ja oppia siitä. Kun hallitset tämän perustan, tarjoamme ohjeita laajentamiseen täyteen mikropalveluekosysteemiin.

## Mitä opit

Tämän esimerkin suorittamalla opit:
- Ottamaan käyttöön useita kontteja Azure Container Apps -ympäristössä
- Toteuttamaan palveluiden välistä viestintää sisäisellä verkolla
- Määrittämään ympäristöön perustuvan skaalauksen ja terveystarkistukset
- Valvomaan hajautettuja sovelluksia Application Insightsin avulla
- Ymmärtämään mikropalveluiden käyttöönoton malleja ja parhaita käytäntöjä
- Laajentamaan arkkitehtuuria yksinkertaisesta monimutkaiseksi vaiheittain

## Arkkitehtuuri

### Vaihe 1: Mitä rakennamme (sisältyy tähän esimerkkiin)

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

**Miksi aloittaa yksinkertaisesti?**
- ✅ Nopea käyttöönotto ja ymmärrys (25-35 minuuttia)
- ✅ Opit mikropalveluiden perusmallit ilman monimutkaisuutta
- ✅ Toimiva koodi, jota voit muokata ja kokeilla
- ✅ Alhaisemmat oppimiskustannukset (~50-100 $/kk vs. 300-1400 $/kk)
- ✅ Rakennat itseluottamusta ennen tietokantojen ja viestijonojen lisäämistä

**Vertauskuva**: Ajattele tätä kuin ajamaan oppimista. Aloitat tyhjältä parkkipaikalta (2 palvelua), hallitset perusteet ja siirryt sitten kaupunkiliikenteeseen (5+ palvelua tietokantojen kanssa).

### Vaihe 2: Tulevaisuuden laajennus (viitearkkitehtuuri)

Kun hallitset 2-palvelun arkkitehtuurin, voit laajentaa sen:

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

Katso "Laajennusopas"-osio lopusta vaiheittaisia ohjeita varten.

## Mukana olevat ominaisuudet

✅ **Palveluiden löytäminen**: Automaattinen DNS-pohjainen löytö konttien välillä  
✅ **Kuormantasaus**: Sisäänrakennettu kuormantasaus replikoiden välillä  
✅ **Automaattinen skaalaus**: Palvelukohtainen itsenäinen skaalaus HTTP-pyyntöjen perusteella  
✅ **Terveysvalvonta**: Liveness- ja readiness-tarkistukset molemmille palveluille  
✅ **Hajautettu lokitus**: Keskitetty lokitus Application Insightsin avulla  
✅ **Sisäinen verkko**: Turvallinen palveluiden välinen viestintä  
✅ **Konttien orkestrointi**: Automaattinen käyttöönotto ja skaalaus  
✅ **Keskeytyksettömät päivitykset**: Rolling-päivitykset ja versioiden hallinta  

## Esivaatimukset

### Tarvittavat työkalut

Ennen aloittamista varmista, että sinulla on seuraavat työkalut asennettuna:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versio 1.0.0 tai uudempi)
   ```bash
   azd version
   # Odotettu tulos: azd versio 1.0.0 tai uudempi
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versio 2.50.0 tai uudempi)
   ```bash
   az --version
   # Odotettu tulos: azure-cli 2.50.0 tai uudempi
   ```

3. **[Docker](https://www.docker.com/get-started)** (paikalliseen kehitykseen/testaukseen - valinnainen)
   ```bash
   docker --version
   # Odotettu tulos: Docker-versio 20.10 tai uudempi
   ```

### Azure-vaatimukset

- Aktiivinen **Azure-tilaus** ([luo ilmainen tili](https://azure.microsoft.com/free/))
- Oikeudet resurssien luomiseen tilauksessasi
- **Contributor**-rooli tilauksessa tai resurssiryhmässä

### Tietämyksen esivaatimukset

Tämä on **edistyneen tason** esimerkki. Sinun tulisi:
- Olla suorittanut [Simple Flask API -esimerkki](../../../../../examples/container-app/simple-flask-api) 
- Ymmärtää mikropalveluarkkitehtuurin perusteet
- Tuntea REST API:t ja HTTP
- Ymmärtää konttien peruskäsitteet

**Uusi Container Apps -ympäristössä?** Aloita [Simple Flask API -esimerkistä](../../../../../examples/container-app/simple-flask-api) oppiaksesi perusteet.

## Pika-aloitus (vaiheittain)

### Vaihe 1: Kloonaa ja siirry

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Onnistumisen tarkistus**: Varmista, että näet `azure.yaml`-tiedoston:
```bash
ls
# Odotettu: README.md, azure.yaml, infra/, src/
```

### Vaihe 2: Todennus Azureen

```bash
azd auth login
```

Tämä avaa selaimen Azure-todennusta varten. Kirjaudu sisään Azure-tunnuksillasi.

**✓ Onnistumisen tarkistus**: Sinun pitäisi nähdä:
```
Logged in to Azure.
```

### Vaihe 3: Ympäristön alustaminen

```bash
azd init
```

**Näet seuraavat kehotteet**:
- **Ympäristön nimi**: Anna lyhyt nimi (esim. `microservices-dev`)
- **Azure-tilaus**: Valitse tilauksesi
- **Azure-sijainti**: Valitse alue (esim. `eastus`, `westeurope`)

**✓ Onnistumisen tarkistus**: Sinun pitäisi nähdä:
```
SUCCESS: New project initialized!
```

### Vaihe 4: Infrastruktuurin ja palveluiden käyttöönotto

```bash
azd up
```

**Mitä tapahtuu** (kestää 8-12 minuuttia):
1. Luo Container Apps -ympäristön
2. Luo Application Insights valvontaa varten
3. Rakentaa API Gateway -kontin (Node.js)
4. Rakentaa Product Service -kontin (Python)
5. Ottaa molemmat kontit käyttöön Azuren ympäristössä
6. Määrittää verkon ja terveystarkistukset
7. Asettaa valvonnan ja lokituksen

**✓ Onnistumisen tarkistus**: Sinun pitäisi nähdä:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Aika**: 8-12 minuuttia

### Vaihe 5: Käyttöönoton testaaminen

```bash
# Hae yhdyskäytävän päätepiste
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Testaa API Gatewayn terveys
curl $GATEWAY_URL/health

# Odotettu tulos:
# {"status":"terve","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Testaa tuotepalvelua portin kautta**:
```bash
# Listaa tuotteet
curl $GATEWAY_URL/api/products

# Odotettu tulos:
# [
#   {"id":1,"name":"Kannettava tietokone","price":999.99,"stock":50},
#   {"id":2,"name":"Hiiri","price":29.99,"stock":200},
#   {"id":3,"name":"Näppäimistö","price":79.99,"stock":150}
# ]
```

**✓ Onnistumisen tarkistus**: Molemmat päätepisteet palauttavat JSON-dataa ilman virheitä.

---

**🎉 Onnittelut!** Olet ottanut mikropalveluarkkitehtuurin käyttöön Azuren ympäristössä!

## Projektin rakenne

Kaikki toteutustiedostot sisältyvät—tämä on täydellinen, toimiva esimerkki:

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

**Mitä kukin komponentti tekee:**

**Infrastruktuuri (infra/)**:
- `main.bicep`: Orkestroi kaikki Azure-resurssit ja niiden riippuvuudet
- `core/container-apps-environment.bicep`: Luo Container Apps -ympäristön ja Azure Container Registryn
- `core/monitor.bicep`: Asettaa Application Insightsin hajautettua lokitusta varten
- `app/*.bicep`: Yksittäisten konttisovellusten määritelmät skaalaus- ja terveystarkistuksilla

**API Gateway (src/api-gateway/)**:
- Julkinen palvelu, joka reitittää pyynnöt taustapalveluille
- Toteuttaa lokituksen, virheenkäsittelyn ja pyyntöjen välittämisen
- Havainnollistaa palveluiden välistä HTTP-viestintää

**Product Service (src/product-service/)**:
- Sisäinen palvelu, jossa on tuoteluettelo (yksinkertaisuuden vuoksi muistissa)
- REST API terveystarkistuksilla
- Esimerkki taustapalvelun mikropalvelumallista

## Palveluiden yleiskatsaus

### API Gateway (Node.js/Express)

**Portti**: 8080  
**Pääsy**: Julkinen (ulkoinen ingress)  
**Tarkoitus**: Reitittää saapuvat pyynnöt oikeille taustapalveluille  

**Päätepisteet**:
- `GET /` - Palvelutiedot
- `GET /health` - Terveystarkistuspäätepiste
- `GET /api/products` - Välittää tuotepalveluun (listaa kaikki)
- `GET /api/products/:id` - Välittää tuotepalveluun (hakee ID:n perusteella)

**Keskeiset ominaisuudet**:
- Pyyntöjen reititys axiosin avulla
- Keskitetty lokitus
- Virheenkäsittely ja aikakatkaisujen hallinta
- Palveluiden löytäminen ympäristömuuttujien avulla
- Application Insights -integraatio

**Koodin kohokohta** (`src/api-gateway/app.js`):
```javascript
// Sisäinen palveluviestintä
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Portti**: 8000  
**Pääsy**: Vain sisäinen (ei ulkoista ingressiä)  
**Tarkoitus**: Hallinnoi tuoteluetteloa muistissa olevilla tiedoilla  

**Päätepisteet**:
- `GET /` - Palvelutiedot
- `GET /health` - Terveystarkistuspäätepiste
- `GET /products` - Listaa kaikki tuotteet
- `GET /products/<id>` - Hakee tuotteen ID:n perusteella

**Keskeiset ominaisuudet**:
- RESTful API Flaskilla
- Muistissa oleva tuotetietovarasto (yksinkertainen, ei tietokantaa)
- Terveysvalvonta probeilla
- Rakenteellinen lokitus
- Application Insights -integraatio

**Tietomalli**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**Miksi vain sisäinen pääsy?**
Tuotepalvelua ei altisteta julkisesti. Kaikki pyynnöt kulkevat API Gatewayn kautta, mikä tarjoaa:
- Turvallisuuden: Hallittu pääsypiste
- Joustavuuden: Taustajärjestelmän voi vaihtaa vaikuttamatta asiakkaisiin
- Valvonnan: Keskitetty pyyntölokitus

## Palveluiden välinen viestintä

### Miten palvelut keskustelevat keskenään

Tässä esimerkissä API Gateway kommunikoi Product Servicen kanssa **sisäisten HTTP-kutsujen** avulla:

```javascript
// API-yhdyskäytävä (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Tee sisäinen HTTP-pyyntö
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Keskeiset kohdat**:

1. **DNS-pohjainen löytö**: Container Apps tarjoaa automaattisesti DNS:n sisäisille palveluille
   - Product Servicen FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - Yksinkertaistettuna: `http://product-service` (Container Apps ratkaisee sen)

2. **Ei julkista altistusta**: Product Servicellä on `external: false` Bicepissä
   - Vain Container Apps -ympäristön sisällä saavutettavissa
   - Ei pääsyä internetistä

3. **Ympäristömuuttujat**: Palvelu-URL:t injektoidaan käyttöönoton aikana
   - Bicep välittää sisäisen FQDN:n portille
   - Ei kovakoodattuja URL-osoitteita sovelluskoodissa

**Vertauskuva**: Ajattele tätä kuin toimistohuoneita. API Gateway on vastaanottotiski (julkinen), ja Product Service on toimistohuone (vain sisäinen). Vierailijoiden on mentävä vastaanoton kautta päästäkseen toimistoon.

## Käyttöönoton vaihtoehdot

### Täysi käyttöönotto (suositeltu)

```bash
# Ota käyttöön infrastruktuuri ja molemmat palvelut
azd up
```

Tämä ottaa käyttöön:
1. Container Apps -ympäristön
2. Application Insightsin
3. Container Registryn
4. API Gateway -kontin
5. Product Service -kontin

**Aika**: 8-12 minuuttia

### Yksittäisen palvelun käyttöönotto

```bash
# Ota käyttöön vain yksi palvelu (ensimmäisen azd up -komennon jälkeen)
azd deploy api-gateway

# Tai ota käyttöön tuotepalvelu
azd deploy product-service
```

**Käyttötapaus**: Kun olet päivittänyt yhden palvelun koodia ja haluat ottaa käyttöön vain kyseisen palvelun.

### Määrittelyn päivitys

```bash
# Muuta skaalausparametreja
azd env set GATEWAY_MAX_REPLICAS 30

# Ota käyttöön uudelleen uudella kokoonpanolla
azd up
```

## Määrittely

### Skaalausasetukset

Molemmat palvelut on määritetty HTTP-pohjaisella automaattisella skaalauksella niiden Bicep-tiedostoissa:

**API Gateway**:
- Minimi replikat: 2 (vähintään 2 saatavuutta varten)
- Maksimi replikat: 20
- Skaalauslaukaisin: 50 samanaikaista pyyntöä per replika

**Product Service**:
- Minimi replikat: 1 (voi skaalautua nollaan tarvittaessa)
- Maksimi replikat: 10
- Skaalauslaukaisin: 100 samanaikaista pyyntöä per replika

**Mukauta skaalausta** (tiedostossa `infra/app/*.bicep`):
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

### Resurssien allokointi

**API Gateway**:
- CPU: 1.0 vCPU
- Muisti: 2 GiB
- Syy: Käsittelee kaiken ulkoisen liikenteen

**Product Service**:
- CPU: 0.5 vCPU
- Muisti: 1 GiB
- Syy: Kevyet muistissa olevat toiminnot

### Terveystarkistukset

Molemmat palvelut sisältävät liveness- ja readiness-probet:

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

**Mitä tämä tarkoittaa**:
- **Liveness**: Jos terveystarkistus epäonnistuu, Container Apps käynnistää kontin uudelleen
- **Readiness**: Jos ei ole valmis, Container Apps lopettaa liikenteen ohjaamisen kyseiselle replikalle

## Valvonta ja näkyvyys

### Palvelulokit

```bash
# Suoratoista lokit API Gatewaysta
azd logs api-gateway --follow

# Näytä viimeaikaiset tuotepalvelun lokit
azd logs product-service --tail 100

# Näytä kaikki lokit molemmista palveluista
azd logs --follow
```

**Odotettu tulos**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights -kyselyt

Avaa Application Insights Azure-portaalissa ja suorita nämä kyselyt:

**Etsi hitaat pyynnöt**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Seuraa palveluiden välisiä kutsuja**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Virheprosentti palveluittain**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Pyyntöjen määrä ajan myötä**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Pääsy valvontapaneeliin

```bash
# Hanki Application Insights -tiedot
azd env get-values | grep APPLICATIONINSIGHTS

# Avaa Azure Portalin valvonta
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Reaaliaikaiset mittarit

1. Siirry Application Insightsiin Azure-portaalissa
2. Klikkaa "Live Metrics"
3. Näe reaaliaikaiset pyynnöt, virheet ja suorituskyky
4. Testaa suorittamalla: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Käytännön harjoitukset

[Huom: Katso täydelliset harjoitukset yllä olevasta "Käytännön harjoitukset" -osiosta, jossa on yksityiskohtaiset vaiheittaiset ohjeet, mukaan lukien käyttöönoton tarkistus, datan muokkaus, automaattisen skaalauksen testit, virheenkäsittely ja kolmannen palvelun lisääminen.]

## Kustannusanalyysi

### Arvioidut kuukausikustannukset (tälle 2-palvelun esimerkille)

| Resurssi | Määritys | Arvioidut kustannukset |
|----------|----------|------------------------|
| API Gateway | 2-20 replikaa, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replikaa, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic-taso | $5 |
| Application Insights | 1-2 GB/kk | $5-10 |
| Log Analytics | 1 GB/kk | $3 |
| **Yhteensä** | | **$58-243/kk** |

**Kustannusten jakautuminen käytön mukaan**:
- **Kevyt liikenne** (testaus/oppiminen): ~60 $/kk
- **Kohtalainen liikenne** (pieni tuotanto): ~120 $/kk
- **Korkea liikenne** (kiireiset ajat): ~240 $/kk

### Kustannusten optimointivinkit

1. **Skaalaa nollaan kehitystä varten**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Käytä Cosmos DB:n kulutussuunnitelmaa** (kun lisäät sen):
   - Maksat vain käytöstä
   - Ei minimimaksua

3. **Aseta
Oppimista/testausta varten harkitse:
- Käytä Azuren ilmaisia krediittejä (ensimmäiset 30 päivää)
- Pidä replikoiden määrä minimissä
- Poista testauksen jälkeen (ei jatkuvia kuluja)

---

## Siivous

Välttääksesi jatkuvat kulut, poista kaikki resurssit:

```bash
azd down --force --purge
```

**Vahvistuskehotus**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Kirjoita `y` vahvistaaksesi.

**Mitä poistetaan**:
- Container Apps -ympäristö
- Molemmat Container Apps (gateway & product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ Vahvista siivous**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Tulos pitäisi olla tyhjä.

---

## Laajennusopas: 2 palvelusta 5+ palveluun

Kun olet hallinnut tämän 2-palveluarkkitehtuurin, tässä ohjeet laajentamiseen:

### Vaihe 1: Lisää tietokantapersistenssi (Seuraava askel)

**Lisää Cosmos DB Product Serviceen**:

1. Luo `infra/core/cosmos.bicep`:
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

2. Päivitä product service käyttämään Cosmos DB:tä in-memory-datan sijaan

3. Arvioitu lisäkustannus: ~25 $/kuukausi (serverless)

### Vaihe 2: Lisää kolmas palvelu (Order Management)

**Luo Order Service**:

1. Uusi kansio: `src/order-service/` (Python/Node.js/C#)
2. Uusi Bicep: `infra/app/order-service.bicep`
3. Päivitä API Gateway reitittämään `/api/orders`
4. Lisää Azure SQL Database tilausten tallentamiseen

**Arkkitehtuuri muuttuu**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Vaihe 3: Lisää asynkroninen viestintä (Service Bus)

**Toteuta tapahtumapohjainen arkkitehtuuri**:

1. Lisää Azure Service Bus: `infra/core/servicebus.bicep`
2. Product Service julkaisee "ProductCreated"-tapahtumia
3. Order Service tilaa tuotetapahtumat
4. Lisää Notification Service käsittelemään tapahtumia

**Malli**: Pyyntö/vastaus (HTTP) + tapahtumapohjainen (Service Bus)

### Vaihe 4: Lisää käyttäjätunnistus

**Toteuta User Service**:

1. Luo `src/user-service/` (Go/Node.js)
2. Lisää Azure AD B2C tai mukautettu JWT-tunnistus
3. API Gateway tarkistaa tunnukset
4. Palvelut tarkistavat käyttäjän oikeudet

### Vaihe 5: Valmius tuotantoon

**Lisää nämä komponentit**:
- Azure Front Door (globaalin kuormituksen tasapainotus)
- Azure Key Vault (salaisuuksien hallinta)
- Azure Monitor Workbooks (mukautetut koontinäytöt)
- CI/CD-putki (GitHub Actions)
- Blue-Green-julkaisut
- Hallittu identiteetti kaikille palveluille

**Täydellisen tuotantoarkkitehtuurin kustannus**: ~300-1 400 $/kuukausi

---

## Lisätietoja

### Aiheeseen liittyvä dokumentaatio
- [Azure Container Apps Documentation](https://learn.microsoft.com/azure/container-apps/)
- [Microservices Architecture Guide](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights for Distributed Tracing](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Seuraavat askeleet tässä kurssissa
- ← Edellinen: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - Aloittelijan yksinkertainen konttiesimerkki
- → Seuraava: [AI Integration Guide](../../../../../examples/docs/ai-foundry) - Lisää tekoälyominaisuuksia
- 🏠 [Kurssin kotisivu](../../README.md)

### Vertailu: Milloin käyttää mitä

**Yksi Container App** (Simple Flask API -esimerkki):
- ✅ Yksinkertaiset sovellukset
- ✅ Monoliittinen arkkitehtuuri
- ✅ Nopea käyttöönotto
- ❌ Rajoitettu skaalautuvuus
- **Kustannus**: ~15-50 $/kuukausi

**Mikropalvelut** (Tämä esimerkki):
- ✅ Monimutkaiset sovellukset
- ✅ Itsenäinen skaalautuvuus per palvelu
- ✅ Tiimien autonomia (eri palvelut, eri tiimit)
- ❌ Monimutkaisempi hallita
- **Kustannus**: ~60-250 $/kuukausi

**Kubernetes (AKS)**:
- ✅ Maksimaalinen hallinta ja joustavuus
- ✅ Monipilviportabiliteetti
- ✅ Edistynyt verkottuminen
- ❌ Vaatii Kubernetes-osaamista
- **Kustannus**: ~150-500 $/kuukausi vähintään

**Suositus**: Aloita Container Appsilla (tämä esimerkki), siirry AKS:ään vain, jos tarvitset Kubernetes-spesifisiä ominaisuuksia.

---

## Usein kysytyt kysymykset

**K: Miksi vain 2 palvelua eikä 5+?**  
V: Opetuksellinen eteneminen. Hallitse perusteet (palveluiden välinen viestintä, monitorointi, skaalautuvuus) yksinkertaisella esimerkillä ennen monimutkaisuuden lisäämistä. Tässä opitut mallit pätevät myös 100-palveluarkkitehtuureihin.

**K: Voinko lisätä itse enemmän palveluita?**  
V: Ehdottomasti! Seuraa yllä olevaa laajennusopasta. Jokainen uusi palvelu noudattaa samaa kaavaa: luo src-kansio, luo Bicep-tiedosto, päivitä azure.yaml, ota käyttöön.

**K: Onko tämä tuotantovalmis?**  
V: Tämä on vahva perusta. Tuotantoa varten lisää: hallittu identiteetti, Key Vault, pysyvät tietokannat, CI/CD-putki, monitorointihälytykset ja varmuuskopiointistrategia.

**K: Miksi ei käytetä Dapr tai muuta palveluverkkoa?**  
V: Pidä oppiminen yksinkertaisena. Kun ymmärrät Container Apps -verkottamisen, voit lisätä Dapr:n edistyneisiin skenaarioihin.

**K: Miten debuggaan paikallisesti?**  
V: Aja palvelut paikallisesti Dockerilla:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**K: Voinko käyttää eri ohjelmointikieliä?**  
V: Kyllä! Tämä esimerkki näyttää Node.js:n (gateway) + Pythonin (product service). Voit yhdistää mitä tahansa kontteihin sopivia kieliä.

**K: Entä jos minulla ei ole Azure-krediittejä?**  
V: Käytä Azuren ilmaista tasoa (ensimmäiset 30 päivää uusilla tileillä) tai ota käyttöön lyhyitä testijaksoja ja poista välittömästi.

---

> **🎓 Oppimispolun yhteenveto**: Olet oppinut ottamaan käyttöön monipalveluarkkitehtuurin, jossa on automaattinen skaalautuvuus, sisäinen verkottuminen, keskitetty monitorointi ja tuotantovalmiit mallit. Tämä perusta valmistaa sinut monimutkaisiin hajautettuihin järjestelmiin ja yritysten mikropalveluarkkitehtuureihin.

**📚 Kurssin navigointi:**
- ← Edellinen: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → Seuraava: [Database Integration Example](../../../../../examples/database-app)
- 🏠 [Kurssin kotisivu](../../README.md)
- 📖 [Container Apps Best Practices](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->