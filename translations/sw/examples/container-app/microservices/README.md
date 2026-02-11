# Mimarisha ya Microservices - Mfano wa Container App

⏱️ **Wakati Unaokadiriwa**: 25-35 dakika | 💰 **Gharama Inayokadiriwa**: ~$50-100/mwezi | ⭐ **Ugumu**: Ngumu

Mimarisha ya microservices **iliyorahisishwa lakini yenye utendaji** iliyowekwa kwenye Azure Container Apps kwa kutumia AZD CLI. Mfano huu unaonyesha mawasiliano kati ya huduma, uratibu wa makontena, na ufuatiliaji kwa usanifu wa vitendo wenye huduma 2.

> **📚 Mbinu ya Kujifunza**: Mfano huu huanza na usanifu mdogo wa huduma 2 (API Gateway + Huduma ya Backend) ambao unaweza kuutekeleza na kujifunza kutoka kwake. Baada ya kumudu msingi huu, tunatoa mwongozo wa kupanua hadi mfumo kamili wa microservices.

## Utakavyojifunza

Kwa kumaliza mfano huu, utaj:
- Zindua makontena mengi kwenye Azure Container Apps
- Tekeleza mawasiliano kati ya huduma kwa kutumia mtandao wa ndani
- Sanidi upanuzi kulingana na mazingira na ukaguzi wa afya
- Fuata programu zilizoenea kwa Application Insights
- Fahamu mifumo ya uenezaji wa microservices na mbinu bora
- Jifunze upanuzi wa hatua kwa hatua kutoka muundo rahisi hadi mgumu

## Architecture

### Phase 1: Hatua ya 1: Tunachojenga (Imejumuishwa Katika Mfano Huu)

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

**Kwa Nini Uanze kwa Rahisi?**
- ✅ Zindua na kuelewa haraka (25-35 dakika)
- ✅ Jifunze mifumo ya msingi ya microservices bila ugumu
- ✅ Msimbo unaofanya kazi ambao unaweza kuubadilisha na kujaribu
- ✅ Gharama ya chini kwa kujifunza (~$50-100/mwezi vs $300-1400/mwezi)
- ✅ Jenga ujasiri kabla ya kuongeza hifadhidata na foleni za ujumbe

**Mfano**: Fikiria hii kama kujifunza kuendesha gari. Unaanza na uwanja wa maegesho tupu (huduma 2), unatajiri msingi, kisha unaendelea kwa trafiki ya mji (huduma 5+ na hifadhidata).

### Phase 2: Hatua ya 2: Upanuzi wa Baadaye (Usanifu wa Marejeo)

Mara utakapo mstaafu usanifu wa huduma 2, unaweza kupanua hadi:

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

Tazama sehemu ya "Mwongozo wa Upanuzi" mwishoni kwa maelekezo hatua kwa hatua.

## Vipengele Vilivyojumuishwa

✅ **Kugundua Huduma**: Utafutaji wa DNS kiotomatiki kati ya makontena  
✅ **Kusawazisha Mzigo**: Kusawazisha mzigo kilichojengwa kwa nakala  
✅ **Upanuzi Kiotomatiki**: Upanuzi huru kwa kila huduma kulingana na ombi la HTTP  
✅ **Ufuatiliaji wa Afya**: Probes za liveness na readiness kwa huduma zote mbili  
✅ **Kulogingia Kusambazwa**: Kuingiza logi kwa pamoja na Application Insights  
✅ **Mtandao wa Ndani**: Mawasiliano salama kati ya huduma  
✅ **Uratibu wa Makontena**: Utekelezaji kiotomatiki na upanuzi  
✅ **Sasisho Bila Kukatwa Huduma**: Sasisho za mzunguko na usimamizi wa matoleo  

## Masharti ya Awali

### Vifaa Vinavyohitajika

Kabla ya kuanza, hakikisha umeweka zana hizi:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (toleo 1.0.0 au juu)
   ```bash
   azd version
   # Matokeo yanayotarajiwa: azd toleo 1.0.0 au la juu zaidi
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (toleo 2.50.0 au juu)
   ```bash
   az --version
   # Matokeo yanayotarajiwa: azure-cli 2.50.0 au toleo jipya zaidi
   ```

3. **[Docker](https://www.docker.com/get-started)** (kwa maendeleo/kujaribu kwa ndani - hiari)
   ```bash
   docker --version
   # Matokeo yanayotarajiwa: Docker toleo 20.10 au zaidi
   ```

### Mahitaji ya Azure

- Usajili wa Azure unaofanya kazi ([unda akaunti bure](https://azure.microsoft.com/free/))
- Ruhusa za kuunda rasilimali kwenye usajili wako
- Nafasi ya **Contributor** kwenye usajili au kikundi cha rasilimali

### Mahitaji ya Maarifa

Huu ni mfano wa **ngazi ya juu**. Unapaswa kuwa na:
- Umehitimisha [Mfano wa Simple Flask API](../../../../../examples/container-app/simple-flask-api) 
- Uelewa wa msingi wa usanifu wa microservices
- Uzoefu wa REST APIs na HTTP
- Uelewa wa dhana za makontena

**Je, mpya kwa Container Apps?** Anza na [Mfano wa Simple Flask API](../../../../../examples/container-app/simple-flask-api) kwanza kujifunza mambo ya msingi.

## Mwanzo wa Haraka (Hatua kwa Hatua)

### Hatua 1: Nakili (Clone) na Nenda

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Kagua Mafanikio**: Thibitisha unaona `azure.yaml`:
```bash
ls
# Inatarajiwa: README.md, azure.yaml, infra/, src/
```

### Hatua 2: Thibitisha kwa Azure

```bash
azd auth login
```

Hii itafungua kivinjari chako kwa ajili ya uthibitisho wa Azure. Ingia kwa kutumia taarifa zako za Azure.

**✓ Kagua Mafanikio**: Unapaswa kuona:
```
Logged in to Azure.
```

### Hatua 3: Anzisha Mazingira

```bash
azd init
```

**Vidokezo utakavyoona**:
- **Jina la mazingira**: Ingiza jina fupi (mfano, `microservices-dev`)
- **Azure subscription**: Chagua usajili wako
- **Azure location**: Chagua mkoa (mfano, `eastus`, `westeurope`)

**✓ Kagua Mafanikio**: Unapaswa kuona:
```
SUCCESS: New project initialized!
```

### Hatua 4: Zindua Miundombinu na Huduma

```bash
azd up
```

**Ambacho kinatokea** (kinachukua dakika 8-12):
1. Inaunda mazingira ya Container Apps
2. Inaunda Application Insights kwa ufuatiliaji
3. Inajenga kontena la API Gateway (Node.js)
4. Inajenga kontena la Product Service (Python)
5. Inaweka kontena zote mbili kwenye Azure
6. Inasanidi mtandao na ukaguzi wa afya
7. Inaweka ufuatiliaji na uingizaji wa logi

**✓ Kagua Mafanikio**: Unapaswa kuona:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Muda**: dakika 8-12

### Hatua 5: Jaribu Utekelezaji

```bash
# Pata kiunganishi cha lango
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Jaribu afya ya lango la API
curl $GATEWAY_URL/health

# Matokeo yanayotarajiwa:
# {"status":"yenye afya","service":"lango la API","timestamp":"2025-11-19T10:30:00Z"}
```

**Jaribu huduma ya bidhaa kupitia gateway**:
```bash
# Orodhesha bidhaa
curl $GATEWAY_URL/api/products

# Matokeo yanayotarajiwa:
# [
#   {"kitambulisho":1,"jina":"Kompyuta ya mkononi","bei":999.99,"hisa":50},
#   {"kitambulisho":2,"jina":"Panya wa kompyuta","bei":29.99,"hisa":200},
#   {"kitambulisho":3,"jina":"Kibodi ya kompyuta","bei":79.99,"hisa":150}
# ]
```

**✓ Kagua Mafanikio**: Vitambulisho vyote viwili vinarudisha data ya JSON bila makosa.

---

**🎉 Hongera!** Umezindua miundo ya microservices kwenye Azure!

## Muundo wa Mradi

Faili zote za utekelezaji zipo—huyu ni mfano kamili unaofanya kazi:

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

**Kila Kipengele Hufanya Nini:**

**Miundombinu (infra/)**:
- `main.bicep`: Inaratibu rasilimali zote za Azure na utegemezi wake
- `core/container-apps-environment.bicep`: Inaunda mazingira ya Container Apps na Azure Container Registry
- `core/monitor.bicep`: Inaunda Application Insights kwa kulogisha kwa kusambazwa
- `app/*.bicep`: Ufafanuzi wa kila container app pamoja na upanuzi na ukaguzi wa afya

**API Gateway (src/api-gateway/)**:
- Huduma inayoonekana kwa umma inayosafirisha maombi kwa huduma za backend
- Inatekeleza uingizaji wa logi, utunzaji wa makosa, na upeleka maombi
- Inaonyesha mawasiliano ya HTTP kati ya huduma

**Product Service (src/product-service/)**:
- Huduma ya ndani yenye katalogi ya bidhaa (kwa kumbukumbu kwa ajili ya urahisi)
- REST API yenye ukaguzi wa afya
- Mfano wa mtindo wa microservice wa backend

## Muhtasari wa Huduma

### Lango la API (API Gateway) (Node.js/Express)

**Port**: 8080  
**Ufikiaji**: Umma (external ingress)  
**Madhumuni**: Inapanga maombi yanayoingia kwa huduma za backend zinazofaa  

**Endpoints**:
- `GET /` - Taarifa za huduma
- `GET /health` - Endpoint ya ukaguzi wa afya
- `GET /api/products` - Pepeta kwa huduma ya bidhaa (orodha zote)
- `GET /api/products/:id` - Pepeta kwa huduma ya bidhaa (pata kwa ID)

**Vipengele Muhimu**:
- Usambazaji wa ombi kwa kutumia axios
- Kuloginga kwa pamoja
- Utunzaji wa makosa na usimamizi wa timeout
- Ugunduzi wa huduma kupitia vigezo vya mazingira
- Uunganisho wa Application Insights

**Code Highlight** (`src/api-gateway/app.js`):
```javascript
// Mawasiliano ya huduma za ndani
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Huduma ya Bidhaa (Product Service) (Python/Flask)

**Port**: 8000  
**Ufikiaji**: Ndani tu (hapana ingress ya nje)  
**Madhumuni**: Inasimamia katalogi ya bidhaa kwa kutumia data kwenye kumbukumbu ya ndani  

**Endpoints**:
- `GET /` - Taarifa za huduma
- `GET /health` - Endpoint ya ukaguzi wa afya
- `GET /products` - Orodha ya bidhaa zote
- `GET /products/<id>` - Pata bidhaa kwa ID

**Vipengele Muhimu**:
- RESTful API kwa Flask
- Hifadhi ya bidhaa kwenye kumbukumbu ya ndani (rahisi, hakuna hifadhidata)
- Ufuatiliaji wa afya kwa probes
- Kuloginga kwa muundo
- Uunganisho wa Application Insights

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

**Kwa Nini Ndani Pekee?**
Huduma ya bidhaa haifunuliwi kwa umma. Maombi yote lazima yapite kupitia Lango la API, ambalo linatoa:
- Usalama: Sehemu ya udhibiti wa ufikaji
- Uwezo wa kubadilika: Inaweza kubadilisha backend bila kuathiri wateja
- Ufuatiliaji: Kuloginga vya pamoja vya maombi

## Kuelewa Mawasiliano ya Huduma

### Jinsi Huduma Zinavyowasiliana

Katika mfano huu, Lango la API linawasiliana na Huduma ya Bidhaa kwa kutumia **vito vya HTTP vya ndani**:

```javascript
// Mlango wa API (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Tuma ombi la HTTP la ndani
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Mambo Muhimu**:

1. **Ugunduzi wa Kifaa wa DNS**: Container Apps huweka DNS kwa huduma za ndani kiotomatiki
   - Product Service FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - Ilarahisishwa kama: `http://product-service` (Container Apps inaitatua)

2. **Hakuna Kufunguliwa kwa Umma**: Huduma ya Bidhaa ina `external: false` katika Bicep
   - Inapatikana tu ndani ya mazingira ya Container Apps
   - Haiwezi kufikiwa kutoka kwenye intaneti

3. **Vigezo vya Mazingira**: URL za huduma zinaingizwa wakati wa utekelezaji
   - Bicep hupitisha FQDN ya ndani kwa gateway
   - Hakuna URL zilizowekwa moja kwa moja ndani ya msimbo wa programu

**Mfano**: Fikiria hii kama vyumba vya ofisi. Lango la API ni dawati la mapokezi (linaloonekana kwa umma), na Huduma ya Bidhaa ni chumba cha ofisi (ndani tu). Wageni lazima wapitie mapokezi ili kufika ofisini.

## Chaguzi za Utekelezaji

### Utekelezaji Kamili (Unaopendekezwa)

```bash
# Peleka miundombinu na huduma zote mbili
azd up
```

Hii inatekeleza:
1. Mazingira ya Container Apps
2. Application Insights
3. Container Registry
4. Kontena la API Gateway
5. Kontena la Product Service

**Muda**: dakika 8-12

### Zindua Huduma Binafsi

```bash
# Sambaza huduma moja tu (baada ya azd up ya awali)
azd deploy api-gateway

# Au sambaza huduma ya bidhaa
azd deploy product-service
```

**Matumizi**: Unapotengeneza msimbo katika huduma moja na unataka kuirejesha tu huduma hiyo.

### Sasisha Mipangilio

```bash
# Badilisha vigezo vya upanuzi
azd env set GATEWAY_MAX_REPLICAS 30

# Sambaza tena kwa usanidi mpya
azd up
```

## Mipangilio

### Mipangilio ya Upanuzi

Huduma zote zimewekwa na upanuzi unaotegemea HTTP katika mafaili yao ya Bicep:

**API Gateway**:
- Nakala za chini: 2 (daima angalau 2 kwa upatikanaji)
- Nakala za juu: 20
- Kichocheo cha upanuzi: mashinikizo 50 ya maombi yalayolindana kwa kila nakala

**Product Service**:
- Nakala za chini: 1 (inaweza kupungua hadi sifuri ikiwa inahitajika)
- Nakala za juu: 10
- Kichocheo cha upanuzi: mashinikizo 100 ya maombi yalayolindana kwa kila nakala

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
- Memory: 2 GiB
- Sababu: Inashughulikia trafiki yote ya nje

**Product Service**:
- CPU: 0.5 vCPU
- Memory: 1 GiB
- Sababu: Operesheni za kumbukumbu za ndani nyepesi

### Ukaguzi wa Afya

Huduma zote mbili zina probes za liveness na readiness:

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
- **Liveness**: Ikiwa ukaguzi wa afya unapoteza, Container Apps inarejesha kontena
- **Readiness**: Ikiwa haiko tayari, Container Apps inazuia kusafirisha trafiki kwa nakala hiyo



## Ufuatiliaji na Uwezo wa Kuonekana

### Tazama Logi za Huduma

```bash
# Tazama kumbukumbu za matukio kwa kutumia azd monitor
azd monitor --logs

# Au tumia Azure CLI kwa ajili ya Container Apps maalum:
# Pokea kumbukumbu kwa mtiririko kutoka API Gateway
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# Tazama kumbukumbu za hivi karibuni za huduma ya bidhaa
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**Matokeo Yanayotarajiwa**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Maswali ya Application Insights

Fikia Application Insights katika Azure Portal, kisha endesha maswali haya:

**Pata Maombi Yaliyo Polepole**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Fuata Majiwala ya Huduma kwa Huduma**:
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

**Kiasi cha Maombi Kwa Muda**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Pata Dashibodi ya Ufuatiliaji

```bash
# Pata maelezo ya Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Fungua ufuatiliaji wa Azure Portal
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Vipimo Moja kwa Moja (Live Metrics)

1. Nenda kwenye Application Insights katika Azure Portal
2. Bonyeza "Live Metrics"
3. Tazama maombi, kushindwa, na utendaji kwa wakati halisi
4. Jaribu kwa kuendesha: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Mazoezi ya Vitendo

[Kumbuka: Tazama mazoezi kamili hapo juu katika sehemu ya "Mazoezi ya Vitendo" kwa mazoezi ya kina hatua kwa hatua ikiwa ni pamoja na ukaguzi wa utekelezaji, mabadiliko ya data, majaribio ya upanuzi kiotomatiki, utunzaji wa makosa, na kuongeza huduma ya tatu.]

## Uchambuzi wa Gharama

### Gharama Zinazokadiriwa kwa Mwezi (kwa Mfano huu wa Huduma 2)

| Rasilimali | Mipangilio | Gharama Inayokadiriwa |
|----------|--------------|----------------|
| API Gateway | 2-20 replicas, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replicas, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic tier | $5 |
| Application Insights | 1-2 GB/month | $5-10 |
| Log Analytics | 1 GB/month | $3 |
| **Jumla** | | **$58-243/month** |

**Uchambuzi wa Gharama Kwa Matumizi**:
- **Trafiki nyepesi** (majaribio/kujifunza): ~$60/mwezi
- **Trafiki ya wastani** (uzalishaji mdogo): ~$120/mwezi
- **Trafiki kubwa** (nyakati za shughuli nyingi): ~$240/mwezi

### Vidokezo vya Kupunguza Gharama

1. **Punguza hadi Sifuri kwa Maendeleo**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Tumia Mpango wa Matumizi kwa Cosmos DB** (ukiongeza):
   - Lipa tu unachotumia
   - Hakuna malipo ya chini

3. **Weka Sampuli za Application Insights**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Chukua sampuli ya 50% ya maombi
   ```

4. **Safisha Wakati Hazi Hitajiki**:
   ```bash
   azd down
   ```

### Chaguzi za Ngazi ya Bure
Kwa ajili ya kujifunza/kujaribu, zingatia:
- Tumia mikopo ya bure ya Azure (siku 30 za mwanzo)
- Weka nakala kwa kiwango cha chini
- Futa baada ya majaribio (hakuna malipo yanayoendelea)

---

## Usafishaji

Ili kuepuka malipo yanayoendelea, futa rasilimali zote:

```bash
azd down --force --purge
```

**Kidokezo cha Uthibitisho**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Andika `y` kuthibitisha.

**Vinavyofutwa**:
- Mazingira ya Container Apps
- Container Apps zote mbili (gateway na huduma ya bidhaa)
- Rejistri ya Container
- Application Insights
- Eneo la Kazi la Log Analytics
- Kundi la Rasilimali

**✓ Thibitisha Usafishaji**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Inapaswa kurudisha tupu.

---

## Mwongozo wa Upanuzi: Kutoka huduma 2 hadi 5+

Mara utakaposhika vizuri usanifu huu wa huduma 2, hapa ni jinsi ya kupanua:

### Awamu ya 1: Ongeza Uhifadhi wa Hifadhidata (Hatua Ifuatayo)

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

2. Sasisha huduma ya bidhaa ili itumie Cosmos DB badala ya data iliyoko kwenye kumbukizi

3. Gharama ya ziada inayokadiriwa: ~$25/mwezi (serverless)

### Awamu ya 2: Ongeza Huduma ya Tatu (Usimamizi wa Oda)

**Unda Huduma ya Oda**:

1. Folda mpya: `src/order-service/` (Python/Node.js/C#)
2. Bicep mpya: `infra/app/order-service.bicep`
3. Sasisha API Gateway ili ipite `/api/orders`
4. Ongeza Azure SQL Database kwa ajili ya uhifadhi wa oda

**Usanifu unageuka kuwa**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Awamu ya 3: Ongeza Mawasiliano Asynchronous (Service Bus)

**Tekeleza Usanifu Unaotegemea Matukio**:

1. Ongeza Azure Service Bus: `infra/core/servicebus.bicep`
2. Huduma ya Bidhaa inachapisha matukio ya "ProductCreated"
3. Huduma ya Oda inasajiliwa kwa matukio ya bidhaa
4. Ongeza Huduma ya Arifa ili kushughulikia matukio

**Mfumo**: Request/Response (HTTP) + Inayotegemea Matukio (Service Bus)

### Awamu ya 4: Ongeza Uthibitishaji wa Mtumiaji

**Tekeleza Huduma ya Mtumiaji**:

1. Unda `src/user-service/` (Go/Node.js)
2. Ongeza Azure AD B2C au uthibitishaji wa JWT wa kawaida
3. API Gateway inathibitisha tokeni
4. Huduma zinakagua ruhusa za mtumiaji

### Awamu ya 5: Uwezo wa Uzalishaji

**Ongeza Vipengele Hivi**:
- Azure Front Door (mizani ya mzigo ya kimataifa)
- Azure Key Vault (usimamizi wa siri)
- Azure Monitor Workbooks (dashibodi zilizobinafsishwa)
- Mtiririko wa CI/CD (GitHub Actions)
- Utumaji wa Blue-Green
- Managed Identity kwa huduma zote

**Gharama ya Usanifu Kamili wa Uzalishaji**: ~$300-1,400/mwezi

---

## Jifunze Zaidi

### Nyaraka Zinazohusiana
- [Nyaraka za Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Mwongozo wa Usanifu wa Microservices](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights kwa Ufuatiliaji Uliosambazwa](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Nyaraka za Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Hatua Zifuatazo katika Kozi Hii
- ← Iliyotangulia: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - Mfano rahisi wa kontena moja kwa wanaoanza
- → Ifuatayo: [AI Integration Guide](../../../../../examples/docs/ai-foundry) - Ongeza uwezo wa AI
- 🏠 [Nyumbani ya Kozi](../../README.md)

### Ulinganisho: Unapotaka Kutumia Nini

**Programu ya Kontena Moja** (Mfano wa Simple Flask API):
- ✅ Programu rahisi
- ✅ Usanifu monolithic
- ✅ Rahisi kupeleka haraka
- ❌ Uwezo mdogo wa kupanuka
- **Gharama**: ~$15-50/mwezi

**Microservices** (Mfano huu):
- ✅ Programu tata
- ✅ Kupanuka kwa kujitegemea kwa kila huduma
- ✅ Uhuru wa timu (huduma tofauti, timu tofauti)
- ❌ Inazidi kuwa ngumu kusimamia
- **Gharama**: ~$60-250/mwezi

**Kubernetes (AKS)**:
- ✅ Udhibiti na urekebishaji wa juu kabisa
- ✅ Uwezo wa kuhamia kwenye wingu mbalimbali
- ✅ Mitandao ya hali ya juu
- ❌ Inahitaji ujuzi wa Kubernetes
- **Gharama**: ~$150-500/mwezi (chini kabisa)

**Mapendekezo**: Anza na Container Apps (mfano huu), hamia kwa AKS tu ikiwa unahitaji vipengele maalum vya Kubernetes.

---

## Maswali Yanayoulizwa Mara kwa Mara

**Q: Kwa nini huduma 2 tu badala ya 5+?**  
A: Mageuzi ya kielimu. Shika misingi (mawasiliano ya huduma, ufuatiliaji, upanaji) kwa mfano rahisi kabla ya kuongeza ugumu. Mifumo unayojifunza hapa inatumika kwa usanifu wa huduma 100.

**Q: Je, ninaweza kuongeza huduma zaidi mwenyewe?**  
A: Bila shaka! Fuata mwongozo wa upanuzi ulio hapo juu. Huduma mpya kila moja inafuata muundo ule ule: unda folda src, unda faili la Bicep, sasisha azure.yaml, peleka.

**Q: Je, huu uko tayari kwa uzalishaji?**  
A: Ni msingi thabiti. Kwa uzalishaji, ongeza: utambulisho unaosimamiwa (Managed Identity), Key Vault, hifadhidata za kudumu, mtiririko wa CI/CD, arifa za ufuatiliaji, na mkakati wa nakala rudufu.

**Q: Kwa nini tusitumie Dapr au service mesh nyingine?**  
A: Weka rahisi kwa ajili ya kujifunza. Ukielewa mtandao wa asili wa Container Apps, unaweza kuongeza Dapr kwa matukio ya juu.

**Q: Ninawezaje kufanya uchunguzi wa hitilafu kwa lokal?**  
A: Endesha huduma kwenye mashine yako kwa kutumia Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: Je, ninaweza kutumia lugha tofauti za programu?**  
A: Ndiyo! Mfano huu unaonyesha Node.js (gateway) + Python (huduma ya bidhaa). Unaweza kuchanganya lugha zozote zinazoweza kutekelezwa ndani ya container.

**Q: Nifanyaje ikiwa sina mikopo ya Azure?**  
A: Tumia kiwango cha bure cha Azure (siku 30 za mwanzo kwa akaunti mpya) au peleka kwa kipindi kifupi cha majaribio kisha futa mara moja.

---

> **🎓 Muhtasari wa Njia ya Kujifunza**: Umejifunza kupeleka usanifu wa huduma nyingi unaopata upanuaji wa moja kwa moja, mitandao ya ndani, ufuatiliaji uliokabidhiwa kati, na mifumo inayostahili uzalishaji. Msingi huu unakuandaa kwa mifumo tata iliyogawanywa na usanifu wa microservices ya kampuni.

**📚 Utaratibu wa Kozi:**
- ← Iliyotangulia: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → Ifuatayo: [Database Integration Example](../../../../../examples/database-app)
- 🏠 [Nyumbani ya Kozi](../../../README.md)
- 📖 [Mbinu Bora za Container Apps](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Taarifa ya kutokuwa na dhamana:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI Co-op Translator (https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kufikia usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokukamilika. Nyaraka ya asili kwa lugha yake ya asili inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatubeba wajibu kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->