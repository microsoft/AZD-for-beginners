# మైక్రోసర్వీసెస్ ఆర్కిటెక్చర్ - కంటెయినర్ యాప్ ఉదాహరణ

⏱️ **అంచనా సమయం**: 25-35 నిమిషాలు | 💰 **అంచనా ఖర్చు**: ~$50-100/నెల | ⭐ **సంక్లిష్టత**: అధునాతన

AZD CLI ఉపయోగించి Azure Container Appsకి అమ‌లు చేయబడిన ఒక **సరళీకృత కానీ కార్యకరమైన** మైక్రోసర్వీసెస్ ఆర్కిటెక్చర్. ఈ ఉదాహరణ సేవ-తో-సేవ కమ్యూనికేషన్, కంటెయినర్ ఆర్కెస్ట్రేషన్ మరియు మానిటరింగ్‌ను ఒక ప్రాక్టికల్ 2-సేవ సెటప్ తో ప్రదర్శిస్తోంది.

> **📚 నేర్చుకునే దృష్టికోణం**: ఈ ఉదాహరణ మీరు వాస్తవంగా డిప్లాయ్ చేసి నేర్చుకోవచ్చు అనే కనిష్ట 2-సేవ ఆర్కిటెక్చ‌ర్ (API Gateway + Backend Service) తో ప్రారంభమవుతుంది. ఈ బేస్‌ను అర్థం చేసుకున్న తరువాత, పూర్తి మైక్రోసర్వీసెస్ ఎకోసిస్టమ్‌కి విస్తరించే మార్గదర్శకత్వాన్ని మేము అందిస్తాము.

## మీరు ఏమి నేర్చుకుంటారు

ఈ ఉదాహరణ పూర్తిచేసిన తర్వాత, మీరు:
- Azure Container Appsకి బహుచిత్ర కంటెయినర్‌లు డిప్లాయ్ చేయడం
- అంతర్గత నెట్‌వర్కింగ్ తో సేవ-తొ-సేవ కమ్యూనికేషన్ అమలుపరచడం
- వాతావరణ ఆధారిత స్కేలింగ్ మరియు హెల్త్ చెక్స్ కాన్ఫిగర్ చేయడం
- Application Insights తో విస్తరించిన అప్లికేషన్లను మానిటర్ చేయడం
- మైక్రోసర్వీసెస్ డిప్లాయ్‌మెంట్ ప్యాటర్న్లు మరియు ఉత్తమ పద్ధతులను అర్థం చేసుకోవడం
- సులభమైన నుండి క్లిష్టమైన ఆర్కిటెక్చర్‌లకు అనుక్రమంగా విస్తరించడం నేర్చుకోవడం

## ఆర్కిటెక్చర్

### దశ 1: మనం నిర్మిస్తున్నది (ఈ ఉదాహరణలో చేర్చబడింది)

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

**ఎందుకు సులభంగా మొదలుపెట్టాలి?**
- ✅ త్వరగా డిప్లాయ్ చేసి అర్థం చేసుకోవచ్చు (25-35 నిమిషాలు)
- ✅ సంక్లిష్టత లేకుండా కోర్ మైక్రోసర్వీసెస్ ప్యాటర్న్లను నేర్చుకోవచ్చు
- ✅ మీరు సవరించగలిగే మరియు ప్రయోగించగల పనిచేసే కోడ్
- ✅ నేర్చుకోవడానికి తక్కువ ఖర్చు (~$50-100/నెల vs $300-1400/నెల)
- ✅ డేటాబేస్‌లు మరియు మెసేజ్ క్యూ లను జోడించడానికి ముందు ఆత్మవిశ్వాసం పొందండి

**ఉపమా**: ఇది డ్రైవింగ్ నేర్చుకోవట్లే భావించండి. మీరు ఖాళీ పార్కింగ్ లాట్ (2 సేవలు)తో ప్రారంభించి, బేసిక్స్‌ను అనుభవించాలి, తర్వాత నగర ట్రాఫిక్ (5+ సేవలు మరియు డేటాబేస్‌లతో) వైపు పెరుగుతారు.

### దశ 2: భావి విస్తరణ (రెఫరెన్స్ ఆర్కిటెక్చర్)

ఒకసారి మీరు 2-సేవ ఆర్కిటెక్చర్‌ను పరిపూర్ణంగా ఆవరించి అయితే, మీరు ఇలా విస్తరించవచ్చు:

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

దశల వారీ సూచనల కోసం చివరన ఉన్న "Expansion Guide" విభాగాన్ని చూడండి.

## కలిగిన ఫీచర్లు

✅ **సర్వీస్ డిస్కవరీ**: కంటెయినర్స్ మధ్య ఆటోమెటిక్గా DNS-ఆధారిత కనిపింపు  
✅ **లోడ్ బ్యాలెన్సింగ్**: రిప్లికాలపైన బిల్ట్-ఇన్ లోడ్ బ్యాలెన్సింగ్  
✅ **ఆటో-స్కేలింగ్**: HTTP అభ్యర్థనల ఆధారంగా ప్రతి సేవకు స్వతంత్ర స్కేలింగ్  
✅ **హెల్త్ మానిటరింగ్**: రెండు సేవలకీ లైవ్నెస్ మరియు రీడినెస్ probes  
✅ **విస్తరించిన లాగింగ్**: Application Insights తో కేంద్రీకృత లాగింగ్  
✅ **అంతర్గత నెట్వర్కింగ్**: సురక్షితంగా సేవ-తొ-సేవ కమ్యూనికేషన్  
✅ **కంటెయినర్ ఆర్కెస్ట్రేషన్**: ఆటోమేటిక్ డిప్లాయ్‌మెంట్ మరియు స్కేలింగ్  
✅ **జీరో-డౌన్‌టైమ్ అప్డేట్స్**: రొలింగ్ అప్డేట్స్ మరియు రివిజన్ నిర్వహణ  

## ముందస్తు అవసరాలు

### కావలసిన సాధనాలు

ప్రారంభించడానికి ముందుగా, ఈ సాధనాలు ఇన్‌స్టాల్ చేసినట్లు గుర్తించండి:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (version 1.0.0 or higher)
   ```bash
   azd version
   # అనుకోబడిన అవుట్‌పుట్: azd సంస్కరణ 1.0.0 లేదా అంతకంటే పైన
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (version 2.50.0 or higher)
   ```bash
   az --version
   # అనుకున్న అవుట్పుట్: azure-cli 2.50.0 లేదా అంతకంటే పై వెర్షన్
   ```

3. **[Docker](https://www.docker.com/get-started)** (స్థానిక అభివృద్ధి/పరీక్షల కోసం - ఐచ్ఛికం)
   ```bash
   docker --version
   # అపేక్షిత అవుట్‌పుట్: Docker వెర్షన్ 20.10 లేదా అంతకు పైగా
   ```

### Azure అవసరాలు

- ఒక యాక్టివ్ **Azure subscription** ([create a free account](https://azure.microsoft.com/free/))
- మీ సబ్స్క్రిప్షన్‌లో రిసోర్సులు సృష్టించే అనుమతులు
- సబ్స్క్రిప్షన్ లేదా రిసోర్స్ గ్రూప్‌పై **Contributor** పాత్ర

### అవగాహనా ప్రాథమికతలు

ఈదైన ఒక **అడ్వాన్స్‌డ్-స్థాయి** ఉదాహరణ. మీ వద్ద ఉండాలి:
- [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) పూర్తి చేసి ఉండాలి 
- మైక్రోసర్వీసెస్ ఆర్కిటెక్చర్ యొక్క ప్రాథమిక అర్థం
- REST APIs మరియు HTTP పట్ల పరిచయం
- కంటెయినర్ కాన్సెప్ట్స్ గురించి అవగాహన

**Container Apps కొత్తగా ఉందా?** ప్రాథమికాలు నేర్చుకోవడానికి ముందుగా [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) తో ప్రారంభించండి.

## క్యుయిక్ స్టార్ట్ (దశల వారీ)

### దశ 1: క్లోన్ చేసి నావిగేట్ చేయండి

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ విజయ పరీక్ష**: మీరు `azure.yaml` కనిపిస్తోంది అని నిర్ధారించుకోండి:
```bash
ls
# అనుకోబడింది: README.md, azure.yaml, infra/, src/
```

### దశ 2: Azureతో ప్రామాణీకరించండి

```bash
azd auth login
```

ఇది మీ బ్రౌజర్‌ను Azure ప్రామాణీకరణ కోసం ఓపెన్ చేస్తుంది. మీ Azure క్రెడెన్షియల్స్‌తో సైన్ ఇన్ చేసుకోండి.

**✓ విజయ పరీక్ష**: మీరు చూడాల్సినది:
```
Logged in to Azure.
```

### దశ 3: ఎన్విరాన్మెంట్‌ను ఆరంభించండి

```bash
azd init
```

**మీకు కనిపించే ప్రాంప్ట్స్**:
- **Environment name**: ఒక సంక్షిప్త పేరు నమోదు చేయండి (ఉదా., `microservices-dev`)
- **Azure subscription**: మీ సబ్స్క్రిప్షన్ ఎంచుకోండి
- **Azure location**: ఒక ప్రాంతాన్ని ఎంచుకోండి (ఉదా., `eastus`, `westeurope`)

**✓ విజయ పరీక్ష**: మీరు చూడాల్సినది:
```
SUCCESS: New project initialized!
```

### దశ 4: ఇన్ఫ్రాస్ట్రక్చర్ మరియు సేవలను డిప్లాయ్ చేయండి

```bash
azd up
```

**ఏం జరుగుతుంది** (8-12 నిమిషాలు పడుతుంది):
1. Container Apps ఎన్విరాన్మెంట్‌ను సృష్టిస్తుంది
2. మానిటరింగ్ కోసం Application Insights సృష్టిస్తుంది
3. API Gateway కంటెయినర్ (Node.js) ని బిల్డ్ చేస్తుంది
4. Product Service కంటెయినర్ (Python) ని బిల్డ్ చేస్తుంది
5. రెండింటినీ Azureకి డిప్లాయ్ చేస్తుంది
6. నెట్‌వర్కింగ్ మరియు హెల్త్ చెక్స్ కాన్ఫిగర్ చేస్తుంది
7. మానిటరింగ్ మరియు లాగింగ్ సెటప్ చేస్తుంది

**✓ విజయ పరీక్ష**: మీరు చూడాల్సినది:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ సమయం**: 8-12 నిమిషాలు

### దశ 5: డిప్లాయ్‌మెంట్‌ని పరీక్షించండి

```bash
# గేట్వే ఎండ్పాయింట్‌ను పొందండి
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# API గేట్వే ఆరోగ్యాన్ని పరీక్షించండి
curl $GATEWAY_URL/health

# ఆశించిన ఫలితం:
# {"status":"ఆరోగ్యంగా","service":"api-గేట్వే","timestamp":"2025-11-19T10:30:00Z"}
```

**గేట్వే ద్వారా ప్రొడక్ట్ సర్వీస్‌ను టెస్ట్ చేయండి**:
```bash
# ఉత్పత్తుల జాబితా
curl $GATEWAY_URL/api/products

# ఆశించిన అవుట్‌పుట్:
# [
#   {"id":1,"name":"ల్యాప్‌టాప్","price":999.99,"stock":50},
#   {"id":2,"name":"మౌస్","price":29.99,"stock":200},
#   {"id":3,"name":"కీబోర్డు","price":79.99,"stock":150}
# ]
```

**✓ విజయ పరీక్ష**: రెండూ ఎండ్పాయింట్లు తప్పులుకుతుండకుండా JSON డేటా రిటర్న్ చేయాలి.

---

**🎉 అభినందనలు!** మీరు Azureలో ఒక మైక్రోసర్వీసెస్ ఆర్కిటెక్చర్‌ను డిప్లాయ్ చేసారు!

## ప్రాజెక్టు నిర్మాణం

అన్ని అమలాత్మక ఫైళ్లు చేర్చబడ్డాయి—ఇది ఒక పూర్తి, పనిచేసే ఉదాహరణ:

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

**ప్రతి భాగం ఏమి చేస్తుంది:**

**Infrastructure (infra/)**:
- `main.bicep`: అన్ని Azure రిసోర్సులు మరియు వాటి డిపెండెన్సీలను సథ్యోరైజ్ చేస్తుంది
- `core/container-apps-environment.bicep`: Container Apps ఎన్విరాన్మెంట్ మరియు Azure Container Registry సృష్టిస్తుంది
- `core/monitor.bicep`: విస్తరించిన లాగింగ్ కోసం Application Insights సెటప్ చేస్తుంది
- `app/*.bicep`: స్కేలింగ్ మరియు హెల్త్ చెక్స్ తో వ్యక్తిగత కంటెయినర్ యాప్ నిర్వచనలు

**API Gateway (src/api-gateway/)**:
- వినియోగదారులకు ముఖంగా కనిపించే సేవ, బ్యాక్‌ఎండ్ సేవలకు రూట్ చేస్తుంది
- లాగింగ్, ఎర్రర్ హ్యాండ్లింగ్, మరియు రిక్వెస్ట్ ఫార్వార్డింగ్ అమలు చేస్తుంది
- సర్వీస్-తొ-సర్వీస్ HTTP కమ్యూనికేషన్‌ను ప్రదర్శిస్తుంది

**Product Service (src/product-service/)**:
- సారాంశంగా ఇన్-మెమరీ ప్రొడక్ట్ క్యాటలాగ్‌ను నిర్వహించే అంతర్గత సేవ
- హెల్త్ చెక్స్‌తో REST API
- బ్యాక్‌ఎండ్ మైక్రోసర్వీస్ ప్యాటర్న్ యొక్క ఉదాహరణ

## సేవల అవలోకనం

### API Gateway (Node.js/Express)

**Port**: 8080  
**Access**: Public (external ingress)  
**Purpose**: వచ్చే రిక్వెస్టులను తగిన బ్యాక్‌ఎండ్ సేవలకు రూట్ చేయటం  

**Endpoints**:
- `GET /` - సేవ సమాచారం
- `GET /health` - హెల్త్ చెక్ ఎండ్పాయింట్
- `GET /api/products` - product service కు ఫార్వర్డ్ చేయండి (అన్నీ జాబితా)
- `GET /api/products/:id` - product service కు ఫార్వర్డ్ చేయండి (ID ద్వారా పొందండి)

**ప్రధాన ఫీచర్లు**:
- axios తో రిక్వెస్ట్ రౌటింగ్
- కేంద్రీకృత లాగింగ్
- ఎర్రర్ హ్యాండ్లింగ్ మరియు టైమ్‌ఔట్ నిర్వహణ
- ఎన్విరాన్‌మెంట్ వేరియబుల్స్ ద్వారా సర్వీస్ డిస్కవరీ
- Application Insights ఇంటిగ్రేషన్

**Code Highlight** (`src/api-gateway/app.js`):
```javascript
// అంతర్గత సేవల మధ్య సమాచారం మార్పిడి
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Port**: 8000  
**Access**: Internal only (no external ingress)  
**Purpose**: ఇన్-మెమరీ డేటాతో ప్రొడక్ట్ క్యాటలాగ్‌ని నిర్వహిస్తుంది  

**Endpoints**:
- `GET /` - సేవ సమాచారం
- `GET /health` - హెల్త్ చెక్ ఎండ్పాయింట్
- `GET /products` - అన్ని ప్రొడక్ట్స్ జాబితా
- `GET /products/<id>` - ID ద్వారా ప్రొడక్ట్ పొందు

**ప్రధాన ఫీచర్లు**:
- Flaskతో RESTful API
- ఇన్-మెమరీ ప్రొడక్ట్ స్టోర్ (సరళతకు, డేటాబేస్ అవసరం లేదు)
- probes ద్వారా హెల్త్ మానిటరింగ్
- నిర్మాణాత్మక లాగింగ్
- Application Insights ఇంటిగ్రేషన్

**డేటా మోడల్**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**ఎందుకు అంతర్గతమే?**
ప్రొడక్ట్ సర్వీస్ పబ్లిక్‌గా ఎక్స్‌పోజ్ చేయబడదు. అన్ని అభ్యర్థనలు API Gateway ద్వారా మాత్రమే రావాలి, ఇది అందిస్తుంది:
- సెక్యూరిటీ: నియంత్రిత యాక్సెస్ పాయింట్
- వశ్యతలు: బ్యాక్‌ఎండ్ మార్చినా క్లయింట్లపై ప్రభావం ఉండదు
- మానిటరింగ్: కేంద్రీకృత రిక్వెస్ట్ లాగింగ్

## సేవ కమ్యూనికేషన్‌ను అర్థం చేసుకోవడం

### సేవలు ఒకరికి ఒకరే ఎలా చెప్పుకుంటాయి

ఈ ఉదాహరణలో, API Gateway Product Service తో **అంతర్గత HTTP కాల్‌లతో** కమ్యూనికేట్ చేస్తుంది:

```javascript
// API గేట్‌వే (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// అంతర్గత HTTP అభ్యర్థన చేయండి
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**ప్రధాన అంశాలు**:

1. **DNS-ఆధారిత డిస్కవరీ**: Container Apps ఆటోమేటిక్ గా అంతర్గత సేవలకు DNS అందిస్తుంది
   - Product Service FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - సౌకర్యవంతంగా: `http://product-service` (Container Apps దీన్ని రిజాల్వ్ చేస్తుంది)

2. **పబ్లిక్ ఎక్స్‌పోజర్ లేదు**: Bicepలో Product Service కి `external: false` ఉంది
   - కేవలం Container Apps ఎన్విరాన్మెంట్‌లోనే యాక్సెస్ చేయగలరు
   - ఇంటర్నెట్ ద్వారా చేరుకోలేడు

3. **ఎన్విరాన్‌మెంట్ వేరియబుల్స్**: సేవ URL‌లు డిప్లాయ్ సమయమున injected చేయబడతాయి
   - Bicep గేట్‌వేకు అంతర్గత FQDN‌ను పాస్ చేస్తుంది
   - యాప్లికేషన్ కోడ్‌లో హార్డ్‌కోడ్ చేసిన URL‌లు లేవు

**ఉపమా**: ఇది ఆఫీస్ గదుల లాగా. API Gateway రిసెప్షన్ డెస్క్ (పబ్లిక్-ఫేసింగ్) లాంటిదే, మరియు Product Service ఒక ఆఫీస్ గది (అంతర్గతం మాత్రమే). వస్తువులు ఏదైనా గదికి చేరుకోవడానికి రిసెప్షన్‌కు వెళ్లాలి.

## డిప్లాయ్‌మెంట్ ఎంపికలు

### పూర్తి డిప్లాయ్‌మెంట్ (సిఫార్సు)

```bash
# మౌలిక సదుపాయాలను మరియు రెండు సేవలను డిప్లాయ్ చేయండి
azd up
```

ఇది డిప్లాయ్ చేస్తుంది:
1. Container Apps ఎన్విరాన్మెంట్
2. Application Insights
3. Container Registry
4. API Gateway కంటెయినర్
5. Product Service కంటెయినర్

**సమయం**: 8-12 నిమిషాలు

### వ్యక్తిగత సేవను మాత్రమే డిప్లాయ్ చేయండి

```bash
# కేవలం ఒకే సేవను మాత్రమే డిప్లాయ్ చేయండి (ప్రారంభ azd up తర్వాత)
azd deploy api-gateway

# లేదా ఉత్పత్తి సేవను డిప్లాయ్ చేయండి
azd deploy product-service
```

**వినియోగ సందర్భం**: ఒక సేవలో కోడ్ புதచేసి ఆ సేవను మాత్రమే రీఢిప్లాయ్ చేయాలనుకుంటున్నప్పుడు.

### కాన్ఫిగరేషన్ అప్‌డేట్ చేయండి

```bash
# స్కేలింగ్ పరామితులను మార్చండి
azd env set GATEWAY_MAX_REPLICAS 30

# కొత్త కాన్ఫిగరేషన్‌తో మళ్లీ అమలు చేయండి
azd up
```

## కాన్ఫిగరేషన్

### స్కేలింగ్ కాన్ఫిగరేషన్

రెండు సేవలూ వాటి Bicep ఫైళ్లలో HTTP-ఆధారిత ఆటోస్కేలింగ్ తో కాన్ఫిగర్ చేయబడ్డాయి:

**API Gateway**:
- Min replicas: 2 (అవైలబిలిటీ కోసం కనీసం 2)
- Max replicas: 20
- Scale trigger: ప్రతి రిప్లికాకు 50 సమాంతర అభ్యర్థనలు

**Product Service**:
- Min replicas: 1 (అవసరమైతే జీరోకే స్కేల్ అవ్వొచ్చు)
- Max replicas: 10
- Scale trigger: ప్రతి రిప్లికాకు 100 సమాంతర అభ్యర్థనలు

**స్కేలింగ్‌ను అనుకూలీకరించండి** (in `infra/app/*.bicep`):
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

### రిసోర్స్ కేటాయింపు

**API Gateway**:
- CPU: 1.0 vCPU
- మెమరీ: 2 GiB
- కారణం: అన్ని బహిర్గత ట్రాఫిక్‌ను హ్యాండిల్ చేస్తుంది

**Product Service**:
- CPU: 0.5 vCPU
- మెమరీ: 1 GiB
- కారణం: లైట్‌వెయిట్ ఇన్-మెమరీ ఆపరేషన్లు

### హెల్త్ చెక్స్

రెండు సేవలూ లైవ్నెస్ మరియు రీడినెస్ probes కలిగి ఉంటాయి:

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

**ఇది ఏమిటి అర్థం**:
- **లైవ్నెస్**: హెల్త్ చెక్ విఫలమైతే, Container Apps కంటెయినర్‌ను రీస్టార్ట్ చేస్తుంది
- **రీడినెస్**: రెడీ కానప్పుడు, Container Apps ఆ రిప్లికాకు ట్రాఫిక్‌ను రూట్ చేయడం ఆపుతుంది



## మానిటరింగ్ & ఆబ్సర్వబిలిటీ

### సేవ లాగ్‌లను చూడండి

```bash
# azd monitor ఉపయోగించి లాగ్‌లను వీక్షించండి
azd monitor --logs

# లేదా నిర్దిష్ట Container Apps కోసం Azure CLI ఉపయోగించండి:
# API Gateway నుండి లాగ్‌లను స్ట్రీమ్ చేయండి
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# ఇటీవలి ఉత్పత్తి సేవల లాగ్‌లను వీక్షించండి
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**అంచనా అవుట్పుట్**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights క్వెరీలు

Azure పోర్టల్‌లో Application Insightsకి యాక్సెస్ చేసి, తర్వాత ఈ క్వెరీలను అమలు చేయండి:

**మందమైన రిక్వెస్టులను కనుగొనండి**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**సేవ-తొ-సేవ కాల్స్‌ను ట్రాక్ చేయండి**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**సేవవారీ ఎర్రర్ రేటు**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**కాలానుగుణంగా రిక్వెస్ట్ వాల్యూమ్**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### మానిటరింగ్ డ్యాష్‌బోర్డ్‌కి యాక్సెస్

```bash
# Application Insights వివరాలు పొందండి
azd env get-values | grep APPLICATIONINSIGHTS

# Azure Portal పర్యవేక్షణను తెరవండి
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### లైవ్ మెట్రిక్స్

1. Azure పోర్టల్‌లో Application Insights కి నావిగేట్ చేయండి
2. "Live Metrics" క్లిక్ చేయండి
3. రియల్-టైమ్ రిక్వెస్టులు, ఫెయిల్యూర్లు, మరియు పనితీరు చూడండి
4. ఈ కమాండ్‌తో టెస్ట్ చేయండి: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## ప్రాక్టికల్ ఎక్సర్సైజెస్

[Note: See full exercises above in the "Practical Exercises" section for detailed step-by-step exercises including deployment verification, data modification, autoscaling tests, error handling, and adding a third service.]

## ఖర్చు విశ్లేషణ

### అంచనా మాసిక ఖర్చులు (ఈ 2-సేవ ఉదాహరణకి)

| Resource | Configuration | Estimated Cost |
|----------|--------------|----------------|
| API Gateway | 2-20 replicas, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replicas, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic tier | $5 |
| Application Insights | 1-2 GB/month | $5-10 |
| Log Analytics | 1 GB/month | $3 |
| **Total** | | **$58-243/month** |

**వినియోగం ద్వారా ఖర్చు విభజన**:
- **తక్కువ ట్రాఫిక్** (పరీక్ష/అభ్యాసం): ~ $60/నెల
- **మోడ్‌రేట్ ట్రాఫిక్** (చిన్న ప్రొడక్షన్): ~ $120/నెల
- **అధిక ట్రాఫిక్** (బిజీ కాలాలు): ~ $240/నెల

### ఖర్చు ఆప్టిమైజేషన్ సూచనలు

1. **డెవలప్‌మెంట్ కోసం స్కేల్-టు-జీరో చేయండి**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Cosmos DB కోసం కన్సంప్షన్ ప్లాన్ వాడండి** (ఒకసారి మీరు దాన్ని జోడించినప్పుడు):
   - మీరు మాత్రమే వినియోగించే మేరకు చెల్లించండి
   - కనీస ఛార్జీ ఉండదు

3. **Application Insights సాంప్లింగ్ సెట్ చేయండి**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // అభ్యర్థనలలో 50% నమూనాను తీసుకోండి
   ```

4. **అవసరం ఉండకపోతే క్లీన్ అప్ చేయండి**:
   ```bash
   azd down
   ```

### ఫ్రీ టియర్ ఎంపికలు
For learning/testing, consider:
- Azure ఉచిత క్రెడిట్స్ ఉపయోగించండి (మొదటి 30 రోజులు)
- రిప్లికాలను కనీసానికి తగ్గించండి
- పరీక్షల అనంతరం తొలగించాలి (కొనసాగుతున్న ఛార్జీలు ఉండవు)

---

## శుభ్రపరచడం

కొనసాగుతున్న ఛార్జీలను నివారించడానికి, అన్ని వనరులను తొలగించండి:

```bash
azd down --force --purge
```

**నిర్ధారణ ప్రాంప్ట్**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

నిర్ధారించడానికి `y` టైప్ చేయండి.

**ఏవి తొలగించబడతాయి**:
- Container Apps Environment
- Both Container Apps (gateway & product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ శుభ్రపరచడం‌ను ధృవీకరించండి**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

ఖాళీగా రావాలి.

---

## విస్తరణ మార్గదర్శకం: 2 నుండి 5+ సేవల వరకు

మీరు ఈ 2-సేవల ఆర్కిటెక్చర్‌లో నైపుణ్యం పొందిన తర్వాత, దీన్ని ఎలా విస్తరించాలో ఇవే సూచనలు:

### దశ 1: డేటాబేస్ పర్సిస్టెన్స్ జోడించడం (తదుపరి దశ)

**Product Service కోసం Cosmos DB జోడించండి**:

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

2. in-memory డేటా బదులుగా Cosmos DB ఉపయోగించేలా product service ని అప్డేట్ చేయండి

3. అంచనావశాత్తుగా అదనపు ఖర్చు: సుమారు $25/నెల (serverless)

### దశ 2: మూడవ సేవ జోడించడం (ఆర్డర్ నిర్వహణ)

**Order Service సృష్టించండి**:

1. కొత్త ఫోల్డర్: `src/order-service/` (Python/Node.js/C#)
2. కొత్త Bicep: `infra/app/order-service.bicep`
3. API Gateway ని `/api/orders` కు రూట్ చేయడానికి అప్డేట్ చేయండి
4. ఆర్డర్ నిల్వ కోసం Azure SQL Database జోడించండి

**ఆర్కిటెక్చర్ అవుతుంది**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### దశ 3: అసింక్ కమ్యూనికేషన్ జోడించడం (Service Bus)

**ఈవెంట్-డ్రివన్ ఆర్కిటెక్చర్ అమలు చేయండి**:

1. Azure Service Bus జోడించండి: `infra/core/servicebus.bicep`
2. Product Service "ProductCreated" ఈవెంట్స్ ప్రచురిస్తుంది
3. Order Service ప్రొడక్ట్ ఈవెంట్స్‌కు సబ్స్క్రైబ్ అవుతుంది
4. ఈవెంట్స్‌ను ప్రాసెస్ చేయడానికి Notification Service జోడించండి

**ప్యాటర్న్**: Request/Response (HTTP) + Event-Driven (Service Bus)

### దశ 4: యూజర్ ప్రామాణీకరణ జోడించండి

**User Service అమలు చేయండి**:

1. Create `src/user-service/` (Go/Node.js)
2. Azure AD B2C లేదా కస్టమ్ JWT ప్రామాణీకరణ జోడించండి
3. API Gateway టోకెన్లను ధృవీకరిస్తుంది
4. సేవలు వినియోగదారుల అనుమతులను తనిఖీ చేస్తాయి

### దశ 5: ప్రొడక్షన్ సిద్ధత

**ఈ భాగాలు జోడించండి**:
- Azure Front Door (గ్లోబల్ లోడ్ బలాన్సింగ్)
- Azure Key Vault (రహస్య నిర్వహణ)
- Azure Monitor Workbooks (కస్టమ్ డాష్‌బోర్డ్స్)
- CI/CD పైప్‌లైన్ (GitHub Actions)
- Blue-Green Deployments
- అన్ని సేవల కోసం Managed Identity

**పూర్తి ప్రొడక్షన్ ఆర్కిటెక్చర్ ఖర్చు**: సుమారు $300-1,400/నెల

---

## మరింత తెలుసుకోండి

### సంబంధిత డాక్యుమెంటేషన్
- [Azure Container Apps డాక్యుమెంటేషన్](https://learn.microsoft.com/azure/container-apps/)
- [మైక్రోసర్వీసెస్ ఆర్కిటెక్చర్ గైడ్](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [డిస్ట్రిబ్యూటెడ్ ట్రేసింగ్ కోసం Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI డాక్యుమెంటేషన్](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### ఈ కోర్సులో తదుపరి దశలు
- ← Previous: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - ప్రారంభిక సింగిల్-కంటైనర్ ఉదాహరణ
- → Next: [AI Integration Guide](../../../../../examples/docs/ai-foundry) - AI సామర్థ్యాలు జోడించండి
- 🏠 [Course Home](../../README.md)

### పోలిక: ఎప్పుడు ఏది ఉపయోగించాలి

**Single Container App** (Simple Flask API ఉదాహరణ):
- ✅ సరళమైన అనువర్తనాలు
- ✅ మోనోలితో అల నిర్మాణం
- ✅ వేగంగా డిప్లోయ్ చేయగలదు
- ❌ పరిమిత స్కేలబిలిటీ
- **ఖర్చు**: సుమారు $15-50/నెల

**Microservices** (ఈ ఉదాహరణ):
- ✅ సంక్లిష్టమైన అనువర్తనాలు
- ✅ ప్రతి సేవకు స్వతంత్ర స్కేలింగ్
- ✅ బృంద స్వాయత్త (వివిధ సేవలు, వివిధ బృందాలు)
- ❌ నిర్వహణలో మరింత సంక్లిష్టత
- **ఖర్చు**: సుమారు $60-250/నెల

**Kubernetes (AKS)**:
- ✅ గరిష్ట నియంత్రణ మరియు ఫ్లెక్సిబిలిటీ
- ✅ మల్టీ-క్లౌడ్ పోర్టబిలిటీ
- ✅ అడ్వాన్స్డ్ నెట్వర్కింగ్
- ❌ Kubernetes నైపుణ్యం అవసరం
- **ఖర్చు**: సుమారు $150-500/నెల కనీసం

**సిఫార్సు**: ఈ ఉదాహరణలోని Container Apps తో ప్రారంభించండి, Kubernetes-స్పెసిఫిక్ ఫీచర్లు అవసరమైతే మాత్రమే AKS వైపు మారండి.

---

## తరచుగా అడిగే ప్రశ్నలు

**Q: 5+ సేవల బదులు ఎందుకు కేవలం 2 సేవలు?**  
A: విద్యా పరంపర. సింపుల్ ఉదాహరణతో ఫండమెంటల్స్ (సేవ కమ్యూనికేషన్, మానిటరింగ్, స్కేలింగ్) పై నైపుణ్యం పొందండి, ఆ తర్వాత క్లిష్టతను జోడించండి. మీరు ఇక్కడ నేర్పుకుంటున్న ప్యాటర్న్స్ 100-సేవల ఆర్కిటెక్చర్లకు వర్తిస్తాయి.

**Q: నేను స్వయంగా మరిన్ని సేవలు జోడించగలనా?**  
A: ఖచ్చితంగా! పై విస్తరణ మార్గదర్శకాన్ని అనుసరించండి. ప్రతి కొత్త సేవ ఈ కోవైపు అనుసరిస్తుంది: src ఫోల్డర్ సృష్టించండి, Bicep ఫైలు సృష్టించండి, azure.yaml అప్డేట్ చేయండి, డిప్లాయ్ చేయండి.

**Q: ఇది ప్రొడక్షన్-రెడీనా?**  
A: ఇది బలమైన బేస్‌లైన్. ప్రొడక్షన్ కోసం జోడించండి: Managed Identity, Key Vault, నిలకడైన డేటాబేసులు, CI/CD పైప్‌లైన్, మానిటరింగ్ అలెర్ట్స్, బ్యాకప్ వ్యూహం.

**Q: Dapr లేదా ఇతర సర్వీస్ మెష్ ఎందుకు ఉపయోగించరు?**  
A: అభ్యాసానికి సింపుల్‌గా ఉంచడానికి. Country Container Apps నేటివ్ నెట్వర్కింగ్‌ను మీరు అర్థం చేసుకున్న తర్వాత, ఆధునిక సాంకేతిక పరిసరాల కోసం Dapr లేయర్ చేయవచ్చు.

**Q: నేన_local_ గా ఎలా డీబగ్ చేయాలి?**  
A: Dockerతో సేవలను లోకల్‌గా నడపండి:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: నేను వేరే ప్రోగ్రామింగ్ భాషలు ఉపయోగించవచ్చా?**  
A: అవును! ఈ ఉదాహరణ Node.js (gateway) + Python (product service) చూపిస్తుంది. కంటైనర్లలో నడచే ఏ భాష అయినా మీకు వీలవుతుంది.

**Q: నాకు Azure క్రెడిట్స్ లేవనుకుంటే怎么办?**  
A: కొత్త ఖాతాల కోసం Azure ఉచిత టియర్ (మొదటి 30 రోజులు) లేదా చిన్న పరీక్షా వ్యవధుల కోసం డిప్లాయ్ చేయండి మరియు వెంటనే తొలగించండి.

---

> **🎓 Learning Path Summary**: మీరు ఆటోమేటిక్ స్కేలింగ్, ఇంటర్నల్ నెట్వర్కింగ్, కేంద్రీకృత మానిటరింగ్ మరియు ప్రొడక్షన్-రెడి ప్యాటర్న్స్‌తో మల్టీ-సర్వీస్ ఆర్కిటెక్చర్‌ను డిప్లాయ్ చేయడం నేర్చుకున్నారు. ఈ బేస్ మీను సంక్లిష్ట డిస్ట్రిబ్యూటెడ్ సిస్టమ్స్ మరియు ఎంటర్ప్రైజ్ మైక్రోసర్వీసెస్ ఆర్కిటెక్చర్‌లకు సిద్ధం చేస్తుంది.

**📚 కోర్సు నావిగేషన్:**
- ← Previous: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → Next: [Database Integration Example](../../../../../examples/database-app)
- 🏠 [Course Home](../../../README.md)
- 📖 [Container Apps Best Practices](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
డిస్క్లైమర్:
ఈ పత్రాన్ని AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ద్వారా అనువదించబడింది. మేము ఖచ్చితత్వానికి శ్రమిస్తామానండి, స్వయంచాలక అనువాదాలలో పొరపాట్లు లేదా అసత్యతలు ఉండొచ్చని దయచేసి గమనించండి. మూల పత్రాన్ని దాని స్థానిక భాషలోని పాఠ్యాన్ని అధికారిక మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం ప్రొఫెషనల్ మానవ అనువాదాన్ని సూచిస్తాము. ఈ అనువాదం వాడకంతో కలిగే ఏవైనా అపార్థాలు లేదా తప్పుగా అర్థం చేసుకోవడంపై మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->