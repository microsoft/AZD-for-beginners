# Usanifu wa Microservices - Mfano wa Programu ya Kontena

⏱️ **Muda Unaokadiriwa**: Dakika 25-35 | 💰 **Gharama Inayokadiriwa**: ~$50-100/mwezi | ⭐ **Ugumu**: Juu

Mfano wa usanifu wa **microservices rahisi lakini unaofanya kazi** uliowekwa kwenye Azure Container Apps kwa kutumia AZD CLI. Mfano huu unaonyesha mawasiliano kati ya huduma, upangaji wa kontena, na ufuatiliaji kwa mpangilio wa huduma mbili wa vitendo.

> **📚 Njia ya Kujifunza**: Mfano huu unaanza na usanifu wa huduma mbili wa kiwango cha chini (API Gateway + Huduma ya Nyuma) ambao unaweza kupeleka na kujifunza kutoka kwake. Baada ya kufahamu msingi huu, tunatoa mwongozo wa kupanua hadi mfumo kamili wa microservices.

## Utajifunza Nini

Kwa kukamilisha mfano huu, utajifunza:
- Kuweka kontena nyingi kwenye Azure Container Apps
- Kutekeleza mawasiliano kati ya huduma kwa kutumia mtandao wa ndani
- Kusimamia upanuzi kulingana na mazingira na ukaguzi wa afya
- Kufuatilia programu zilizogawanyika kwa kutumia Application Insights
- Kuelewa mifumo ya uwekaji wa microservices na mbinu bora
- Kujifunza upanuzi wa hatua kwa hatua kutoka usanifu rahisi hadi mgumu

## Usanifu

### Awamu ya 1: Tunachojenga (Kilichojumuishwa Katika Mfano Huu)

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

**Kwa Nini Kuanza Rahisi?**
- ✅ Kuweka na kuelewa haraka (Dakika 25-35)
- ✅ Kujifunza mifumo ya msingi ya microservices bila ugumu
- ✅ Msimbo unaofanya kazi ambao unaweza kurekebisha na kujaribu
- ✅ Gharama ya chini kwa kujifunza (~$50-100/mwezi dhidi ya $300-1400/mwezi)
- ✅ Kujenga kujiamini kabla ya kuongeza hifadhidata na foleni za ujumbe

**Mfano**: Fikiria kama kujifunza kuendesha gari. Unaanzia kwenye uwanja wa maegesho tupu (huduma 2), unajifunza misingi, kisha unaendelea kwenye trafiki ya mji (huduma 5+ na hifadhidata).

### Awamu ya 2: Upanuzi wa Baadaye (Usanifu wa Marejeleo)

Baada ya kufahamu usanifu wa huduma mbili, unaweza kupanua hadi:

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

Tazama sehemu ya "Mwongozo wa Upanuzi" mwishoni kwa maelekezo ya hatua kwa hatua.

## Vipengele Vilivyojumuishwa

✅ **Ugunduzi wa Huduma**: Ugunduzi wa DNS kiotomatiki kati ya kontena  
✅ **Usawazishaji wa Mizigo**: Usawazishaji wa mizigo uliojengwa ndani kwa nakala nyingi  
✅ **Upanuzi wa Kiotomatiki**: Upanuzi wa kujitegemea kwa kila huduma kulingana na maombi ya HTTP  
✅ **Ufuatiliaji wa Afya**: Ukaguzi wa liveness na readiness kwa huduma zote mbili  
✅ **Kumbukumbu Zilizogawanyika**: Kumbukumbu zilizojikita na Application Insights  
✅ **Mtandao wa Ndani**: Mawasiliano salama kati ya huduma  
✅ **Upangaji wa Kontena**: Uwekaji na upanuzi wa kiotomatiki  
✅ **Sasisho Bila Kusimamisha**: Sasisho za mzunguko na usimamizi wa marekebisho  

## Mahitaji

### Vifaa Vinavyohitajika

Kabla ya kuanza, hakikisha una vifaa hivi vilivyowekwa:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (toleo 1.0.0 au zaidi)
   ```bash
   azd version
   # Matokeo yanayotarajiwa: toleo la azd 1.0.0 au juu zaidi
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (toleo 2.50.0 au zaidi)
   ```bash
   az --version
   # Matokeo yanayotarajiwa: azure-cli 2.50.0 au zaidi
   ```

3. **[Docker](https://www.docker.com/get-started)** (kwa maendeleo/majaribio ya ndani - hiari)
   ```bash
   docker --version
   # Matokeo yanayotarajiwa: Toleo la Docker 20.10 au juu zaidi
   ```

### Mahitaji ya Azure

- Usajili wa **Azure** unaofanya kazi ([unda akaunti ya bure](https://azure.microsoft.com/free/))
- Ruhusa za kuunda rasilimali kwenye usajili wako
- Nafasi ya **Contributor** kwenye usajili au kikundi cha rasilimali

### Maarifa Yanayohitajika

Huu ni mfano wa **kiwango cha juu**. Unapaswa kuwa na:
- Umekamilisha [Mfano Rahisi wa Flask API](../../../../../examples/container-app/simple-flask-api) 
- Uelewa wa msingi wa usanifu wa microservices
- Uzoefu wa REST APIs na HTTP
- Uelewa wa dhana za kontena

**Mgeni kwa Container Apps?** Anza na [Mfano Rahisi wa Flask API](../../../../../examples/container-app/simple-flask-api) kwanza kujifunza misingi.

## Mwanzo wa Haraka (Hatua kwa Hatua)

### Hatua ya 1: Kloni na Elekea

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Ukaguzi wa Mafanikio**: Hakikisha unaona `azure.yaml`:
```bash
ls
# Inatarajiwa: README.md, azure.yaml, infra/, src/
```

### Hatua ya 2: Thibitisha na Azure

```bash
azd auth login
```

Hii inafungua kivinjari chako kwa uthibitishaji wa Azure. Ingia kwa kutumia maelezo yako ya Azure.

**✓ Ukaguzi wa Mafanikio**: Unapaswa kuona:
```
Logged in to Azure.
```

### Hatua ya 3: Anzisha Mazingira

```bash
azd init
```

**Maswali utakayoulizwa**:
- **Jina la Mazingira**: Weka jina fupi (mfano, `microservices-dev`)
- **Usajili wa Azure**: Chagua usajili wako
- **Eneo la Azure**: Chagua eneo (mfano, `eastus`, `westeurope`)

**✓ Ukaguzi wa Mafanikio**: Unapaswa kuona:
```
SUCCESS: New project initialized!
```

### Hatua ya 4: Weka Miundombinu na Huduma

```bash
azd up
```

**Kinachotokea** (huchukua dakika 8-12):
1. Huunda mazingira ya Container Apps
2. Huunda Application Insights kwa ufuatiliaji
3. Hujenga kontena la API Gateway (Node.js)
4. Hujenga kontena la Huduma ya Bidhaa (Python)
5. Hupeleka kontena zote mbili kwenye Azure
6. Husimamia mtandao na ukaguzi wa afya
7. Huanzisha ufuatiliaji na kumbukumbu

**✓ Ukaguzi wa Mafanikio**: Unapaswa kuona:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Muda**: Dakika 8-12

### Hatua ya 5: Jaribu Uwekaji

```bash
# Pata mwisho wa lango la gateway
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Jaribu afya ya API Gateway
curl $GATEWAY_URL/health

# Matokeo yanayotarajiwa:
# {"hali":"nzima","huduma":"api-gateway","muda":"2025-11-19T10:30:00Z"}
```

**Jaribu huduma ya bidhaa kupitia gateway**:
```bash
# Orodhesha bidhaa
curl $GATEWAY_URL/api/products

# Matokeo yanayotarajiwa:
# [
#   {"id":1,"name":"Kompyuta mpakato","price":999.99,"stock":50},
#   {"id":2,"name":"Panya","price":29.99,"stock":200},
#   {"id":3,"name":"Kibodi","price":79.99,"stock":150}
# ]
```

**✓ Ukaguzi wa Mafanikio**: Vituo vyote viwili vinarejesha data ya JSON bila makosa.

---

**🎉 Hongera!** Umeweka usanifu wa microservices kwenye Azure!

## Muundo wa Mradi

Faili zote za utekelezaji zimejumuishwa—huu ni mfano kamili, unaofanya kazi:

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

**Kila Sehemu Inafanya Nini:**

**Miundombinu (infra/)**:
- `main.bicep`: Husimamia rasilimali zote za Azure na utegemezi wake
- `core/container-apps-environment.bicep`: Huunda mazingira ya Container Apps na Azure Container Registry
- `core/monitor.bicep`: Huanzisha Application Insights kwa kumbukumbu zilizogawanyika
- `app/*.bicep`: Ufafanuzi wa programu za kontena binafsi na upanuzi na ukaguzi wa afya

**API Gateway (src/api-gateway/)**:
- Huduma inayokabiliana na umma inayopitisha maombi kwa huduma za nyuma
- Hutekeleza kumbukumbu, usimamizi wa makosa, na upitishaji wa maombi
- Huonyesha mawasiliano ya HTTP kati ya huduma

**Huduma ya Bidhaa (src/product-service/)**:
- Huduma ya ndani yenye orodha ya bidhaa (kwa kumbukumbu kwa urahisi)
- REST API yenye ukaguzi wa afya
- Mfano wa muundo wa huduma ya nyuma

## Muhtasari wa Huduma

### API Gateway (Node.js/Express)

**Bandari**: 8080  
**Ufikiaji**: Umma (ingress ya nje)  
**Madhumuni**: Kupitisha maombi yanayoingia kwa huduma za nyuma zinazofaa  

**Vituo**:
- `GET /` - Taarifa ya huduma
- `GET /health` - Kituo cha ukaguzi wa afya
- `GET /api/products` - Pitisha kwa huduma ya bidhaa (orodhesha zote)
- `GET /api/products/:id` - Pitisha kwa huduma ya bidhaa (pata kwa ID)

**Vipengele Muhimu**:
- Upitishaji wa maombi kwa axios
- Kumbukumbu zilizojikita
- Usimamizi wa makosa na muda wa kusubiri
- Ugunduzi wa huduma kupitia vigezo vya mazingira
- Ujumuishaji wa Application Insights

**Msimbo wa Msingi** (`src/api-gateway/app.js`):
```javascript
// Mawasiliano ya huduma ya ndani
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Huduma ya Bidhaa (Python/Flask)

**Bandari**: 8000  
**Ufikiaji**: Ndani tu (hakuna ingress ya nje)  
**Madhumuni**: Kusimamia orodha ya bidhaa kwa kumbukumbu ya ndani  

**Vituo**:
- `GET /` - Taarifa ya huduma
- `GET /health` - Kituo cha ukaguzi wa afya
- `GET /products` - Orodhesha bidhaa zote
- `GET /products/<id>` - Pata bidhaa kwa ID

**Vipengele Muhimu**:
- RESTful API na Flask
- Hifadhi ya bidhaa ya kumbukumbu (rahisi, hakuna hifadhidata inayohitajika)
- Ufuatiliaji wa afya kwa probes
- Kumbukumbu zilizopangiliwa
- Ujumuishaji wa Application Insights

**Mfano wa Data**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**Kwa Nini Ndani Tu?**
Huduma ya bidhaa haifikiwi moja kwa moja na umma. Maombi yote lazima yapitie API Gateway, ambayo hutoa:
- Usalama: Sehemu ya ufikiaji inayodhibitiwa
- Urahisi: Inaweza kubadilisha huduma ya nyuma bila kuathiri wateja
- Ufuatiliaji: Kumbukumbu za maombi zilizojikita

## Kuelewa Mawasiliano ya Huduma

### Jinsi Huduma Zinavyowasiliana

Katika mfano huu, API Gateway inawasiliana na Huduma ya Bidhaa kwa kutumia **maombi ya HTTP ya ndani**:

```javascript
// Lango la API (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Fanya ombi la ndani la HTTP
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Vidokezo Muhimu**:

1. **Ugunduzi wa DNS**: Container Apps hutoa DNS kiotomatiki kwa huduma za ndani
   - FQDN ya Huduma ya Bidhaa: `product-service.internal.<environment>.azurecontainerapps.io`
   - Imerahisishwa kama: `http://product-service` (Container Apps inatatua)

2. **Hakuna Ufikiaji wa Umma**: Huduma ya Bidhaa ina `external: false` kwenye Bicep
   - Inafikika tu ndani ya mazingira ya Container Apps
   - Haiwezi kufikiwa kutoka mtandaoni

3. **Vigezo vya Mazingira**: URL za huduma huingizwa wakati wa uwekaji
   - Bicep hupitisha FQDN ya ndani kwa gateway
   - Hakuna URL zilizowekwa moja kwa moja kwenye msimbo wa programu

**Mfano**: Fikiria kama vyumba vya ofisi. API Gateway ni dawati la mapokezi (inayokabiliana na umma), na Huduma ya Bidhaa ni chumba cha ofisi (ndani tu). Wageni lazima wapitie mapokezi kufikia chumba chochote.

## Chaguzi za Uwekaji

### Uwekaji Kamili (Inapendekezwa)

```bash
# Weka miundombinu na huduma zote mbili
azd up
```

Hii huweka:
1. Mazingira ya Container Apps
2. Application Insights
3. Container Registry
4. Kontena la API Gateway
5. Kontena la Huduma ya Bidhaa

**Muda**: Dakika 8-12

### Weka Huduma Binafsi

```bash
# Peleka huduma moja tu (baada ya azd up ya awali)
azd deploy api-gateway

# Au peleka huduma ya bidhaa
azd deploy product-service
```

**Matumizi**: Unapoboresha msimbo katika huduma moja na unataka kuweka upya huduma hiyo tu.

### Sasisha Usanidi

```bash
# Badilisha vigezo vya kupima
azd env set GATEWAY_MAX_REPLICAS 30

# Tumia upya na usanidi mpya
azd up
```

## Usanidi

### Usanidi wa Upanuzi

Huduma zote mbili zimeundwa na upanuzi wa kiotomatiki unaotegemea HTTP kwenye faili zao za Bicep:

**API Gateway**:
- Nakala za chini: 2 (angalau 2 kwa upatikanaji)
- Nakala za juu: 20
- Kichocheo cha upanuzi: Maombi 50 ya wakati mmoja kwa nakala

**Huduma ya Bidhaa**:
- Nakala za chini: 1 (inaweza kupungua hadi sifuri ikiwa inahitajika)
- Nakala za juu: 10
- Kichocheo cha upanuzi: Maombi 100 ya wakati mmoja kwa nakala

**Badilisha Upanuzi** (katika `infra/app/*.bicep`):
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

### Ugawaji wa Rasilimali

**API Gateway**:
- CPU: 1.0 vCPU
- Kumbukumbu: 2 GiB
- Sababu: Hushughulikia trafiki yote ya nje

**Huduma ya Bidhaa**:
- CPU: 0.5 vCPU
- Kumbukumbu: 1 GiB
- Sababu: Operesheni nyepesi za kumbukumbu

### Ukaguzi wa Afya

Huduma zote mbili zinajumuisha liveness na readiness probes:

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

**Hii Inamaanisha**:
- **Liveness**: Ikiwa ukaguzi wa afya utashindwa, Container Apps itaanza upya kontena
- **Readiness**: Ikiwa haiko tayari, Container Apps itaacha kuelekeza trafiki kwa nakala hiyo

## Ufuatiliaji na Uangalizi

### Tazama Kumbukumbu za Huduma

```bash
# Tazama kumbukumbu kutoka kwa API Gateway
azd logs api-gateway --follow

# Tazama kumbukumbu za huduma ya bidhaa za hivi karibuni
azd logs product-service --tail 100

# Tazama kumbukumbu zote kutoka kwa huduma zote mbili
azd logs --follow
```

**Matokeo Yanayotarajiwa**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Maswali ya Application Insights

Fikia Application Insights kwenye Azure Portal, kisha endesha maswali haya:

**Pata Maombi Polepole**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Fuatilia Mawasiliano ya Huduma kwa Huduma**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Kiwango cha Makosa kwa Huduma**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Kiasi cha Maombi kwa Wakati**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Fikia Dashibodi ya Ufuatiliaji

```bash
# Pata maelezo ya Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Fungua ufuatiliaji wa Azure Portal
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Metriki za Moja kwa Moja

1. Nenda kwenye Application Insights kwenye Azure Portal
2. Bonyeza "Live Metrics"
3. Tazama maombi ya wakati halisi, kushindwa, na utendaji
4. Jaribu kwa kuendesha: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Mazoezi ya Vitendo

[Kumbuka: Tazama mazoezi kamili hapo juu katika sehemu ya "Mazoezi ya Vitendo" kwa maelekezo ya hatua kwa hatua ikiwa ni pamoja na uthibitishaji wa uwekaji, marekebisho ya data, majaribio ya upanuzi wa kiotomatiki, usimamizi wa makosa, na kuongeza huduma ya tatu.]

## Uchambuzi wa Gharama

### Gharama Zinazokadiriwa kwa Mwezi (Kwa Mfano Huu wa Huduma Mbili)

| Rasilimali | Usanidi | Gharama Inayokadiriwa |
|------------|---------|-----------------------|
| API Gateway | Nakala 2-20, 1 vCPU, 2GB RAM | $30-150 |
| Huduma ya Bidhaa | Nakala 1-10, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Kiwango cha Msingi | $5 |
| Application Insights | 1-2 GB/mwezi | $5-10 |
| Log Analytics | 1 GB/mwezi | $3 |
| **Jumla** | | **$58-243/mwezi** |

**Mgawanyo wa Gharama kwa Matumizi**:
- **Trafiki Nyepesi** (majaribio/kujifunza): ~$60/mwezi
- **Trafiki ya Kati** (uzalishaji mdogo): ~$120/mwezi
- **Trafiki ya Juu** (vipindi vya shughuli nyingi): ~$240/mwezi

### Vidokezo vya Kupunguza Gharama

1. **Punguza hadi Sifuri kwa Maendeleo**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Tumia Mpango wa Matumizi kwa Cosmos DB** (unapoiweka):
   - Lipa tu kwa kile unachotumia
   - Hakuna malipo ya chini

3. **Weka Sampuli ya Application Insights**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Sampuli 50% ya maombi
   ```

4. **Safisha Unapomaliza**:
   ```bash
   azd down
   ```

### Chaguo za Kiwango cha Bure
Kwa kujifunza/kutest, zingatia:
- Tumia mikopo ya bure ya Azure (siku 30 za kwanza)
- Weka idadi ya replicas kuwa ndogo
- Futa baada ya kutest (hakuna gharama zinazoendelea)

---

## Usafishaji

Ili kuepuka gharama zinazoendelea, futa rasilimali zote:

```bash
azd down --force --purge
```

**Kidokezo cha Uthibitisho**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Andika `y` kuthibitisha.

**Kinachofutwa**:
- Mazingira ya Container Apps
- Container Apps zote mbili (gateway & huduma ya bidhaa)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ Thibitisha Usafishaji**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Inapaswa kurudisha tupu.

---

## Mwongozo wa Kupanua: Kutoka Huduma 2 hadi 5+

Ukishamudu usanifu wa huduma 2, hivi ndivyo unavyoweza kupanua:

### Awamu ya 1: Ongeza Uhifadhi wa Database (Hatua Inayofuata)

**Ongeza Cosmos DB kwa Huduma ya Bidhaa**:

1. Unda `infra/core/cosmos.bicep`:
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

2. Sasisha huduma ya bidhaa kutumia Cosmos DB badala ya data ya ndani ya kumbukumbu

3. Gharama ya ziada inayokadiriwa: ~$25/mwezi (serverless)

### Awamu ya 2: Ongeza Huduma ya Tatu (Usimamizi wa Oda)

**Unda Huduma ya Oda**:

1. Folda mpya: `src/order-service/` (Python/Node.js/C#)
2. Bicep mpya: `infra/app/order-service.bicep`
3. Sasisha API Gateway kuelekeza `/api/orders`
4. Ongeza Azure SQL Database kwa uhifadhi wa oda

**Usanifu unakuwa**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Awamu ya 3: Ongeza Mawasiliano ya Asynchronous (Service Bus)

**Tekeleza Usanifu wa Matukio**:

1. Ongeza Azure Service Bus: `infra/core/servicebus.bicep`
2. Huduma ya Bidhaa inachapisha matukio ya "ProductCreated"
3. Huduma ya Oda inajiandikisha kwa matukio ya bidhaa
4. Ongeza Huduma ya Arifa kushughulikia matukio

**Mfumo**: Ombi/Jibu (HTTP) + Matukio (Service Bus)

### Awamu ya 4: Ongeza Uthibitishaji wa Watumiaji

**Tekeleza Huduma ya Watumiaji**:

1. Unda `src/user-service/` (Go/Node.js)
2. Ongeza Azure AD B2C au uthibitishaji wa JWT wa kawaida
3. API Gateway inathibitisha tokeni
4. Huduma zinakagua ruhusa za watumiaji

### Awamu ya 5: Ukomavu wa Uzalishaji

**Ongeza Vipengele Hivi**:
- Azure Front Door (usawazishaji mzigo wa kimataifa)
- Azure Key Vault (usimamizi wa siri)
- Azure Monitor Workbooks (dashibodi maalum)
- CI/CD Pipeline (GitHub Actions)
- Blue-Green Deployments
- Managed Identity kwa huduma zote

**Gharama Kamili ya Usanifu wa Uzalishaji**: ~$300-1,400/mwezi

---

## Jifunze Zaidi

### Nyaraka Zinazohusiana
- [Nyaraka za Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Mwongozo wa Usanifu wa Microservices](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights kwa Ufuatiliaji wa Kusambazwa](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Nyaraka za Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Hatua Zifuatazo Katika Kozi Hii
- ← Awali: [API Rahisi ya Flask](../../../../../examples/container-app/simple-flask-api) - Mfano wa kontena moja kwa wanaoanza
- → Ifuatayo: [Mwongozo wa Ushirikiano wa AI](../../../../../examples/docs/ai-foundry) - Ongeza uwezo wa AI
- 🏠 [Nyumbani kwa Kozi](../../README.md)

### Ulinganisho: Wakati wa Kutumia Nini

**Container App Moja** (Mfano wa API Rahisi ya Flask):
- ✅ Programu rahisi
- ✅ Usanifu wa monolithic
- ✅ Haraka kupeleka
- ❌ Uwezo mdogo wa kupanuka
- **Gharama**: ~$15-50/mwezi

**Microservices** (Mfano huu):
- ✅ Programu ngumu
- ✅ Kupanuka kwa uhuru kwa kila huduma
- ✅ Uhuru wa timu (huduma tofauti, timu tofauti)
- ❌ Ngumu zaidi kusimamia
- **Gharama**: ~$60-250/mwezi

**Kubernetes (AKS)**:
- ✅ Udhibiti na kubadilika kwa kiwango cha juu
- ✅ Uwezo wa kutumia wingu tofauti
- ✅ Mitandao ya hali ya juu
- ❌ Inahitaji utaalamu wa Kubernetes
- **Gharama**: ~$150-500/mwezi angalau

**Pendekezo**: Anza na Container Apps (mfano huu), songa kwa AKS tu ikiwa unahitaji vipengele maalum vya Kubernetes.

---

## Maswali Yanayoulizwa Mara kwa Mara

**Q: Kwa nini huduma 2 tu badala ya 5+?**  
A: Maendeleo ya kielimu. Jifunze misingi (mawasiliano ya huduma, ufuatiliaji, kupanuka) kwa mfano rahisi kabla ya kuongeza ugumu. Mifumo unayojifunza hapa inatumika kwa usanifu wa huduma 100.

**Q: Je, naweza kuongeza huduma zaidi mwenyewe?**  
A: Kabisa! Fuata mwongozo wa upanuzi hapo juu. Kila huduma mpya inafuata mfumo huo huo: unda folda ya src, unda faili ya Bicep, sasisha azure.yaml, peleka.

**Q: Je, hii iko tayari kwa uzalishaji?**  
A: Ni msingi thabiti. Kwa uzalishaji, ongeza: managed identity, Key Vault, databases za kudumu, CI/CD pipeline, arifa za ufuatiliaji, na mkakati wa kuhifadhi nakala.

**Q: Kwa nini usitumie Dapr au service mesh nyingine?**  
A: Ifanye iwe rahisi kwa kujifunza. Ukishafahamu mtandao wa asili wa Container Apps, unaweza kuongeza Dapr kwa hali za juu.

**Q: Ninawezaje kufanyia kazi kwa ndani?**  
A: Endesha huduma kwa ndani ukitumia Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: Je, ninaweza kutumia lugha tofauti za programu?**  
A: Ndio! Mfano huu unaonyesha Node.js (gateway) + Python (huduma ya bidhaa). Unaweza kuchanganya lugha yoyote inayoweza kuendeshwa kwenye kontena.

**Q: Nifanye nini kama sina mikopo ya Azure?**  
A: Tumia kiwango cha bure cha Azure (siku 30 za kwanza kwa akaunti mpya) au peleka kwa vipindi vifupi vya majaribio na futa mara moja.

---

> **🎓 Muhtasari wa Njia ya Kujifunza**: Umejifunza jinsi ya kupeleka usanifu wa huduma nyingi na upanuzi wa kiotomatiki, mtandao wa ndani, ufuatiliaji wa kati, na mifumo ya uzalishaji. Msingi huu unakuandaa kwa mifumo ngumu ya kusambazwa na usanifu wa microservices wa kiwango cha biashara.

**📚 Uelekezaji wa Kozi**:
- ← Awali: [API Rahisi ya Flask](../../../../../examples/container-app/simple-flask-api)
- → Ifuatayo: [Mfano wa Ushirikiano wa Database](../../../../../examples/database-app)
- 🏠 [Nyumbani kwa Kozi](../../README.md)
- 📖 [Mbinu Bora za Container Apps](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kwa usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->