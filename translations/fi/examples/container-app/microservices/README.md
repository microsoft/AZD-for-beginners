# Mikropalveluarkkitehtuuri - Container App -esimerkki

⏱️ **Arvioitu aika**: 25-35 minuuttia | 💰 **Arvioidut kustannukset**: ~$50-100/kuukausi | ⭐ **Vaikeustaso**: Edistynyt

A **yksinkertaistettu mutta toimiva** mikropalveluarkkitehtuuri, joka on otettu käyttöön Azure Container Apps -palvelussa käyttäen AZD CLI:tä. Tämä esimerkki demonstroi palveluiden välistä viestintää, konttien orkestrointia ja monitorointia käytännöllisellä 2-palvelun kokoonpanolla.

> **📚 Oppimistapa**: Tämä esimerkki alkaa pienellä 2-palvelun arkkitehtuurilla (API Gateway + Backend Service), jonka voit oikeasti ottaa käyttöön ja oppia. Kun olet hallinnut tämän perustan, annamme ohjeita laajentamiseen täydeksi mikropalveluekosysteemiksi.

## Mitä opit

Tämän esimerkin läpikäynnin jälkeen osaat:
- Ota useita kontteja käyttöön Azure Container Apps -palveluun
- Toteuttaa palveluiden välistä viestintää sisäverkon avulla
- Konfiguroida ympäristöön perustuvaa skaalausta ja terveystarkastuksia
- Monitoroida hajautettuja sovelluksia Application Insightsilla
- Ymmärtää mikropalvelujen käyttöönoton malleja ja parhaita käytäntöjä
- Oppia asteittainen laajentaminen yksinkertaisesta monimutkaiseen arkkitehtuuriin

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
- ✅ Ota käyttöön ja ymmärrä nopeasti (25-35 minuuttia)
- ✅ Opettele keskeiset mikropalvelumallit ilman monimutkaisuutta
- ✅ Toimiva koodi, jota voit muokata ja kokeilla
- ✅ Alhaisemmat oppimiskustannukset (~$50-100/kuukausi vs $300-1400/kuukausi)
- ✅ Rakenna luottamusta ennen tietokantojen ja viestijonojen lisäämistä

**Vertauskuva**: Ajattele tätä kuin ajokoulun oppimista. Aloitat tyhjältä parkkipaikalta (2 palvelua), hallitset perusteet ja siirryt sitten kaupunkiliikenteeseen (5+ palvelua tietokantoineen).

### Vaihe 2: Tuleva laajennus (viitearkkitehtuuri)

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

Katso lopusta "Laajennusopas" -osio vaiheittaisia ohjeita varten.

## Mukana olevat ominaisuudet

✅ **Palveluiden löytäminen**: Automaattinen DNS-pohjainen löytäminen konttien välillä  
✅ **Kuormantasapainotus**: Sisäänrakennettu kuormantasapainotus replikoiden välillä  
✅ **Automaattinen skaalaus**: Palvelukohtainen skaalaus HTTP-liikenteen perusteella  
✅ **Terveystarkkailu**: Liveness- ja readiness-probit molemmille palveluille  
✅ **Hajautettu lokitus**: Keskitetty lokitus Application Insightsilla  
✅ **Sisäinen verkotus**: Turvallinen palveluiden välinen viestintä  
✅ **Konttien orkestrointi**: Automaattinen käyttöönotto ja skaalaus  
✅ **Nolla-aikakatkokset päivityksissä**: Rolling updates revisiohallinnalla  

## Esivaatimukset

### Vaaditut työkalut

Ennen aloittamista varmista, että sinulla on nämä työkalut asennettuna:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versio 1.0.0 tai uudempi)
   ```bash
   azd version
   # Odotettu tuloste: azd-versio 1.0.0 tai uudempi
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versio 2.50.0 tai uudempi)
   ```bash
   az --version
   # Odotettu tulostus: azure-cli 2.50.0 tai uudempi
   ```

3. **[Docker](https://www.docker.com/get-started)** (paikalliseen kehitykseen/testaukseen - valinnainen)
   ```bash
   docker --version
   # Odotettu tuloste: Dockerin versio 20.10 tai uudempi
   ```

### Azure-vaatimukset

- Avoin **Azure-tilaus** ([luo ilmainen tili](https://azure.microsoft.com/free/))
- Oikeudet luoda resursseja tililläsi
- **Contributor**-rooli tilillä tai resurssiryhmällä

### Tarvittavat ennakkotiedot

Tämä on **edistynyt** esimerkki. Sinulla tulisi olla:
- Suoritettuna [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) 
- Perusymmärrys mikropalveluarkkitehtuurista
- Tuntemus REST-rajapinnoista ja HTTP:stä
- Ymmärrys konttiteknologioista

**Uusi Container Apps -palveluun?** Aloita ensin [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) -esimerkillä oppiaksesi perusteet.

## Pikakäynnistys (vaihe vaiheelta)

### Vaihe 1: Kloonaa ja siirry hakemistoon

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Onnistumistarkistus**: Varmista, että näet `azure.yaml`:
```bash
ls
# Odotettu: README.md, azure.yaml, infra/, src/
```

### Vaihe 2: Todennus Azureen

```bash
azd auth login
```

Tämä avaa selaimesi Azure-todennusta varten. Kirjaudu sisään Azure-tunnuksillasi.

**✓ Onnistumistarkistus**: Sinun pitäisi nähdä:
```
Logged in to Azure.
```

### Vaihe 3: Alusta ympäristö

```bash
azd init
```

**Kehotukset, jotka näet**:
- **Environment name**: Anna lyhyt nimi (esim. `microservices-dev`)
- **Azure subscription**: Valitse tilauksesi
- **Azure location**: Valitse alue (esim. `eastus`, `westeurope`)

**✓ Onnistumistarkistus**: Sinun pitäisi nähdä:
```
SUCCESS: New project initialized!
```

### Vaihe 4: Ota käyttöön infrastruktuuri ja palvelut

```bash
azd up
```

**Mitä tapahtuu** (kesto 8-12 minuuttia):
1. Luo Container Apps -ympäristön
2. Luo Application Insights monitorointia varten
3. Kokoa API Gateway -kontti (Node.js)
4. Kokoa Product Service -kontti (Python)
5. Ota molemmat kontit käyttöön Azureen
6. Konfiguroi verkotus ja terveystarkastukset
7. Ota käyttöön monitorointi ja lokitus

**✓ Onnistumistarkistus**: Sinun pitäisi nähdä:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Aika**: 8-12 minuuttia

### Vaihe 5: Testaa käyttöönotto

```bash
# Hae yhdyskäytävän päätepiste
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Testaa API-yhdyskäytävän kunto
curl $GATEWAY_URL/health

# Odotettu tuloste:
# {"tila":"terve","palvelu":"api-yhdyskäytävä","aikaleima":"2025-11-19T10:30:00Z"}
```

**Testaa tuotepalvelu gatewayn kautta**:
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

**✓ Onnistumistarkistus**: Molemmat päätepisteet palauttavat JSON-dataa ilman virheitä.

---

**🎉 Onnittelut!** Olet ottanut mikropalveluarkkitehtuurin käyttöön Azureen!

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

**Infrastructure (infra/)**:
- `main.bicep`: Orkestroi kaikki Azure-resurssit ja niiden riippuvuudet
- `core/container-apps-environment.bicep`: Luo Container Apps -ympäristön ja Azure Container Registryn
- `core/monitor.bicep`: Asettaa Application Insightsin hajautettuun lokitukseen
- `app/*.bicep`: Yksittäiset container app -määrittelyt skaalaus- ja terveystarkastusasetuksineen

**API Gateway (src/api-gateway/)**:
- Julkinen palvelu, joka reitittää pyynnöt backend-palveluille
- Toteuttaa lokituksen, virheenkäsittelyn ja pyynnön uudelleenohjauksen
- Demonstroi palveluiden välistä HTTP-viestintää

**Product Service (src/product-service/)**:
- Sisäinen palvelu, joka ylläpitää tuoteluetteloa muistissa yksinkertaisuuden vuoksi
- REST-rajapinta terveystarkastusreitteineen
- Esimerkki backend-mikropalvelumallista

## Palvelujen yleiskatsaus

### API Gateway (Node.js/Express)

**Portti**: 8080  
**Käyttöoikeus**: Julkinen (ulkoisen liikenteen sallittu)  
**Tarkoitus**: Reitittää saapuvat pyynnöt oikeisiin backend-palveluihin  

**Päätepisteet**:
- `GET /` - Tietoa palvelusta
- `GET /health` - Terveystarkastus
- `GET /api/products` - Uudelleenohjaa product-palveluun (listaa kaikki)
- `GET /api/products/:id` - Uudelleenohjaa product-palveluun (hae ID:llä)

**Keskeiset ominaisuudet**:
- Pyyntöjen reititys axiosilla
- Keskitetty lokitus
- Virheenkäsittely ja aikakatkaisut
- Palvelun löytäminen ympäristömuuttujien kautta
- Application Insights -integraatio

**Koodin kohokohta** (`src/api-gateway/app.js`):
```javascript
// Sisäinen palveluiden välinen viestintä
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Portti**: 8000  
**Käyttöoikeus**: Vain sisäinen (ei ulkoista ingressiä)  
**Tarkoitus**: Hallinnoi tuoteluetteloa muistissa  

**Päätepisteet**:
- `GET /` - Tietoa palvelusta
- `GET /health` - Terveystarkastus
- `GET /products` - Listaa kaikki tuotteet
- `GET /products/<id>` - Hae tuote ID:llä

**Keskeiset ominaisuudet**:
- RESTful-rajapinta Flaskilla
- Muistissa pidettävä tuotetietokanta (yksinkertainen, ei tarvetta tietokannalle)
- Terveystarkkailu probeilla
- Rakenteinen lokitus
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

**Miksi vain sisäinen?**
Product-palvelu ei ole julkisesti saatavilla. Kaikki pyynnöt on ohjattava API Gatewayn kautta, joka tarjoaa:
- Turvallisuus: Hallittu pääsypiste
- Joustavuus: Backendin voi vaihtaa vaikuttamatta asiakkaisiin
- Monitorointi: Keskitetty pyyntöjen lokitus

## Palveluiden välisen viestinnän ymmärtäminen

### Miten palvelut keskustelevat keskenään

Tässä esimerkissä API Gateway kommunikoi Product Service -palvelun kanssa käyttämällä **sisäisiä HTTP-kutsuja**:

```javascript
// API-väylä (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Tee sisäinen HTTP-pyyntö
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Keskeiset kohdat**:

1. **DNS-pohjainen löytäminen**: Container Apps tarjoaa automaattisesti DNS:n sisäisille palveluille
   - Product Service FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - Yksinkertaistettuna: `http://product-service` (Container Apps ratkaisee tämän)

2. **Ei julkista altistusta**: Product Service:ssa on Bicepissä `external: false`
   - Käytettävissä vain Container Apps -ympäristön sisällä
   - Ei saavutettavissa internetistä

3. **Ympäristömuuttujat**: Palvelu-URL:t injektoidaan käyttöönoton yhteydessä
   - Bicep välittää sisäisen FQDN:n gatewaylle
   - Ei kovakoodattuja URL-osoitteita sovelluskoodissa

**Vertauskuva**: Ajattele tätä kuin toimiston huoneita. API Gateway on vastaanottotiski (julkinen), ja Product Service on toimistohuone (vain sisäinen). Vierailijat joutuvat menemään vastaanoton kautta päästäkseen mihinkään huoneeseen.

## Käyttöönotto-optiot

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

**Kesto**: 8-12 minuuttia

### Ota käyttöön yksittäinen palvelu

```bash
# Ota käyttöön vain yksi palvelu (ensimmäisen azd up -suorituksen jälkeen)
azd deploy api-gateway

# Tai ota käyttöön tuotepalvelu
azd deploy product-service
```

**Käyttötapaus**: Kun olet päivittänyt koodia yhdessä palvelussa ja haluat ottaa vain sen palvelun uudelleen käyttöön.

### Päivitä konfiguraatio

```bash
# Muuta skaalausparametreja
azd env set GATEWAY_MAX_REPLICAS 30

# Ota uudelleen käyttöön uusi konfiguraatio
azd up
```

## Konfiguraatio

### Skaalausasetukset

Molemmat palvelut on konfiguroitu HTTP-pohjaiseen autoskaalaukseen Bicep-tiedostoissaan:

**API Gateway**:
- Minimi-instanssit: 2 (aina vähintään 2 saatavilla)
- Maksimi-instanssit: 20
- Skaalauksen laukaisin: 50 samanaikaista pyyntöä per instanssi

**Product Service**:
- Minimi-instanssit: 1 (voi skaalautua nollaan tarvittaessa)
- Maksimi-instanssit: 10
- Skaalauksen laukaisin: 100 samanaikaista pyyntöä per instanssi

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

### Resurssien kohdentaminen

**API Gateway**:
- CPU: 1.0 vCPU
- Muisti: 2 GiB
- Perustelu: Käsittelee kaiken ulkoisen liikenteen

**Product Service**:
- CPU: 0.5 vCPU
- Muisti: 1 GiB
- Perustelu: Kevyt muistipohjainen toiminta

### Terveystarkastukset

Molemmat palvelut sisältävät liveness- ja readiness-probit:

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
- **Elinkelpoisuus (liveness)**: Jos terveystarkastus epäonnistuu, Container Apps käynnistää kontin uudelleen
- **Valmius (readiness)**: Jos palvelu ei ole valmis, Container Apps lopettaa liikenteen ohjaamisen kyseiselle instanssille



## Monitorointi ja havaittavuus

### Palvelulokien tarkastelu

```bash
# Näytä lokit käyttämällä azd monitoria
azd monitor --logs

# Tai käytä Azure CLI:tä tiettyihin Container Apps -sovelluksiin:
# Suoratoista lokit API-gatewayista
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# Näytä tuotepalvelun viimeisimmät lokit
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
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

**Hidaspyyntöjen löytäminen**:
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

**Virheprosentti palvelukohtaisesti**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Pyyntöjen määrä ajan funktiona**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Pääsy monitorointipaneeliin

```bash
# Hae Application Insights -tiedot
azd env get-values | grep APPLICATIONINSIGHTS

# Avaa Azure-portaalin valvonta
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Reaaliaikaiset mittarit

1. Siirry Application Insightsiin Azure-portaalissa
2. Klikkaa "Live Metrics"
3. Näet reaaliaikaiset pyynnöt, virheet ja suorituskyvyn
4. Testaa suorittamalla: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Käytännön harjoitukset

[Huom: Katso täydelliset harjoitukset yllä olevasta "Käytännön harjoitukset" -osiosta yksityiskohtaisia vaiheittaisia harjoituksia varten, jotka sisältävät käyttöönoton tarkistuksen, datan muokkauksen, autoskaalauksen testit, virheenkäsittelyn ja kolmannen palvelun lisäämisen.]

## Kustannusanalyysi

### Arvioidut kuukausikustannukset (tälle 2-palveluesimerkillle)

| Resource | Configuration | Estimated Cost |
|----------|--------------|----------------|
| API Gateway | 2-20 replicas, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replicas, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic tier | $5 |
| Application Insights | 1-2 GB/month | $5-10 |
| Log Analytics | 1 GB/month | $3 |
| **Total** | | **$58-243/month** |

**Kustannusjako käytön mukaan**:
- **Kevyt liikenne** (testaus/oppiminen): ~$60/kuukausi
- **Kohtalainen liikenne** (pieni tuotanto): ~$120/kuukausi
- **Kova liikenne** (ruuhka-aika): ~$240/kuukausi

### Kustannusten optimointivinkkejä

1. **Skaalaa nollaan kehitystä varten**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Käytä Consumption Plania Cosmos DB:lle** (kun lisäät sen):
   - Maksa vain käyttämästäsi
   - Ei minimimaksua

3. **Aseta Application Insightsin näytteistys (sampling)**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Näytteenotto 50 % pyynnöistä
   ```

4. **Siivoa resurssit, kun et tarvitse niitä**:
   ```bash
   azd down
   ```

### Ilmaiset vaihtoehdot
For learning/testing, consider:
- Use Azure free credits (first 30 days)
- Keep to minimum replicas
- Delete after testing (no ongoing charges)

---

## Siivous

Jatkuvien maksujen välttämiseksi poista kaikki resurssit:

```bash
azd down --force --purge
```

**Vahvistuskehotus**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Kirjoita `y` vahvistaaksesi.

**Mitä poistetaan**:
- Container Apps Environment
- Both Container Apps (gateway & product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ Vahvista siivous**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Tämän pitäisi palauttaa tyhjä.

---

## Laajennusopas: 2 palvelusta 5+ palveluun

Kun olet hallinnut tämän 2-palvelun arkkitehtuurin, näin voit laajentaa:

### Vaihe 1: Lisää tietokantapysyvyys (seuraava askel)

**Lisää Cosmos DB Product-palvelulle**:

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

2. Päivitä product service käyttämään Cosmos DB:tä muistissa olevan datan sijaan

3. Arvioitu lisäkustannus: ~$25/kk (serverless)

### Vaihe 2: Lisää kolmas palvelu (tilausten hallinta)

**Luo Order-palvelu**:

1. Uusi kansio: `src/order-service/` (Python/Node.js/C#)
2. Uusi Bicep: `infra/app/order-service.bicep`
3. Päivitä API Gateway reitittämään `/api/orders`
4. Lisää Azure SQL Database tilausten pysyvyyttä varten

**Arkkitehtuuri muuttuu**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Vaihe 3: Lisää asynkroninen viestintä (Service Bus)

**Ota käyttöön tapahtumapohjainen arkkitehtuuri**:

1. Lisää Azure Service Bus: `infra/core/servicebus.bicep`
2. Product Service julkaisee "ProductCreated" -tapahtumia
3. Order Service tilaa product-tapahtumia
4. Lisää Notification Service käsittelemään tapahtumia

**Malli**: Pyyntö/Vastaus (HTTP) + Tapahtumapohjainen (Service Bus)

### Vaihe 4: Lisää käyttäjän todennus

**Toteuta User-palvelu**:

1. Luo `src/user-service/` (Go/Node.js)
2. Lisää Azure AD B2C tai mukautettu JWT-todennus
3. API Gateway validoi tokenit
4. Palvelut tarkistavat käyttäjän oikeudet

### Vaihe 5: Valmius tuotantoon

**Lisää nämä komponentit**:
- Azure Front Door (global load balancing)
- Azure Key Vault (secret management)
- Azure Monitor Workbooks (custom dashboards)
- CI/CD Pipeline (GitHub Actions)
- Blue-Green Deployments
- Managed Identity for all services

**Koko tuotantoarkkitehtuurin kustannus**: ~$300-1,400/kk

---

## Lisätietoja

### Aiheeseen liittyvä dokumentaatio
- [Azure Container Apps -dokumentaatio](https://learn.microsoft.com/azure/container-apps/)
- [Mikropalveluarkkitehtuurin opas](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights hajautettuun jäljitykseen](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI -dokumentaatio](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Seuraavat askeleet tässä kurssissa
- ← Edellinen: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - Aloittelijan yksisäiliöesimerkki
- → Seuraava: [AI Integration Guide](../../../../../examples/docs/ai-foundry) - Lisää tekoälyominaisuuksia
- 🏠 [Kurssin etusivu](../../README.md)

### Vertailu: Milloin käyttää mitä

**Yksittäinen Container App** (Simple Flask API -esimerkki):
- ✅ Yksinkertaiset sovellukset
- ✅ Monoliittinen arkkitehtuuri
- ✅ Nopea ottaa käyttöön
- ❌ Rajoitettu skaalautuvuus
- **Kustannus**: ~$15-50/kk

**Mikropalvelut** (Tässä esimerkissä):
- ✅ Monimutkaiset sovellukset
- ✅ Palvelukohtainen itsenäinen skaalaus
- ✅ Tiimien autonomia (eri palvelut, eri tiimit)
- ❌ Hallittavuus monimutkaistuu
- **Kustannus**: ~$60-250/kk

**Kubernetes (AKS)**:
- ✅ Maksimaalinen hallinta ja joustavuus
- ✅ Monipilvisovellusten siirrettävyys
- ✅ Edistynyt verkotus
- ❌ Edellyttää Kubernetes-osaamista
- **Kustannus**: ~$150-500/kk vähintään

**Suositus**: Aloita Container Appsilla (tämä esimerkki), siirry AKS:ään vain jos tarvitset Kubernetes-spesifisiä ominaisuuksia.

---

## Usein kysytyt kysymykset

**Q: Miksi vain 2 palvelua 5+:n sijaan?**  
A: Koulutuksellinen eteneminen. Hallitse perusteet (palvelujen välinen viestintä, valvonta, skaalaus) yksinkertaisella esimerkillä ennen monimutkaisuuden lisäämistä. Tässä opitut mallit pätevät myös 100-palvelun arkkitehtuureihin.

**Q: Voinko lisätä lisää palveluja itse?**  
A: Ehdottomasti! Seuraa yllä olevaa laajennusopasta. Jokainen uusi palvelu noudattaa samaa kaavaa: luo src-kansio, luo Bicep-tiedosto, päivitä azure.yaml, ota käyttöön.

**Q: Onko tämä tuotantovalmiina?**  
A: Se on hyvä perusta. Tuotantoon lisää: hallittu identiteetti, Key Vault, pysyvät tietokannat, CI/CD-putki, valvontailmoitukset ja varmuuskopiointistrategia.

**Q: Miksi ei käytetä Dapr:ia tai muuta service mesh -ratkaisua?**  
A: Pidä asiat yksinkertaisina oppimista varten. Kun ymmärrät Container Appsin natiiviverkottumisen, voit lisätä Dapr:in edistyneempiin skenaarioihin.

**Q: Miten debuggaan paikallisesti?**  
A: Aja palvelut paikallisesti Dockerilla:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: Voinko käyttää eri ohjelmointikieliä?**  
A: Kyllä! Tämä esimerkki näyttää Node.js (gateway) + Python (product service). Voit yhdistellä mitä tahansa säiliöissä ajettavia kieliä.

**Q: Entä jos minulla ei ole Azure-krediittejä?**  
A: Käytä Azuren ilmaista tasoa (ensimmäiset 30 päivää uusille tilille) tai ota käyttöönotto vain lyhyeksi testiajaksi ja poista välittömästi.

---

> **🎓 Oppimispolun yhteenveto**: Olet oppinut ottamaan käyttöön monipalveluarkkitehtuurin, jossa on automaattinen skaalaus, sisäinen verkottuminen, keskitetty valvonta ja tuotantovalmiit mallit. Tämä perusta valmistaa sinut monimutkaisiin hajautettuihin järjestelmiin ja yritystason mikropalveluarkkitehtuureihin.

**📚 Kurssin navigointi:**
- ← Edellinen: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → Seuraava: [Tietokanta-integraatioesimerkki](../../../../../examples/database-app)
- 🏠 [Kurssin etusivu](../../../README.md)
- 📖 [Container Apps -parhaat käytännöt](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattisissa käännöksissä saattaa esiintyä virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäiskielellä tulee pitää virallisena lähteenä. Tärkeiden tietojen osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa mistään tästä käännöksestä johtuvista väärinymmärryksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->