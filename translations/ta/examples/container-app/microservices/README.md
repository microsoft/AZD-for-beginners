# மைக்ரோசேவைகள் கட்டமைப்பு - Container App உதாரணம்

⏱️ **கண்டறியப்படும் நேரம்**: 25-35 நிமிடங்கள் | 💰 **கண்டறியப்படும் செலவு**: ~$50-100/மாதம் | ⭐ **சிக்கலான நிலை**: மேம்பட்ட

AZD CLI பயன்படுத்தி Azure Container Apps-க்கு அமல்படுத்தப்பட்ட ஒரு **எளிமையாக்கப்பட்ட ஆனால் செயல்பாட்டுக்கான** மைக்ரோசேவைகள் கட்டமைப்பு. இந்த உதாரணம் சேவை-தூண்டு சேவை தொடர்பு, கண்டெய்னர் ஒர்கெஸ்ட்ரேஷன் மற்றும் கண்காணிப்பை வகுப்புணர்தலோடு 2-சேவை அமைப்புடன் காண்பிக்கிறது.

> **📚 கற்றல் அணுகுமுறை**: இந்த உதாரணம் நீங்கள் உண்மையில் அமல்படுத்தி கற்றுக்கொள்ளக் கூடிய குறைந்தது 2-சேவை கட்டமைப்பில் (API Gateway + Backend Service) தொடங்குகிறது. இந்த அடிப்படைத் தேர்ச்சி பெறப்பட்ட பின்னர், முழு மைக்ரோசேவைகள் சூழ்நிலையை விரிவுப்படுத்த வழிகாட்டுதல்கள் வழங்கப்படுகின்றன.

## நீங்கள் என்ன கற்றுக்கொள்வீர்கள்

இந்த உதாரணத்தை முடித்தவுடன், நீங்கள்:
- பல கண்டெய்னர்களை Azure Container Apps-க்கு அமல்படுத்துவது
- உள்ளக நெட்ஒரவுக்களுடன் சேவை-தூண்டு சேவை தொடர்பை செயல்படுத்துவது
- சூழல் அடிப்படையிலான ஸ்கேலிங் மற்றும் ஆரோக்கியச் சோதனைகளை அமைப்பது
- Application Insights மூலம் பிரிக்கப்பட்ட பயன்பாடுகளை கண்காணிப்பது
- மைக்ரோசேவைகள் அமல்படுத்தும் மாதிரிகள் மற்றும் சிறந்த நடைமுறைகளை புரிந்து கொள்வது
- எளிமையிலிருந்து சிக்கலாக தொடர்ச்சியாக விரிவுபடுத்த கற்றுக்கொள்வது

## கட்டமைப்பு

### கட்டம் 1: நாம் எதை உருவாக்குகிறோம் (இந்த உதாரணத்தில் சேர்க்கப்பட்டுள்ளது)

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

**எWhy Start Simple?** (எПочему простіти?)?  
- ✅ விரைவாக ஏற்கவும் புரிந்துகொள்ளவும் (25-35 நிமிடங்கள்)  
- ✅ சிக்கலின்றி முக்கிய மைக்ரோசேவைகள் மாதிரிகளை கற்று கொள்ளவும்  
- ✅ நீங்கள் மாற்றம் செய்து பரிசோதிக்கக்கூடிய வேலை செய்கிற குறியீடு  
- ✅ கற்றலுக்கான குறைந்த செலவு (~$50-100/மாதம் vs $300-1400/மாதம்)  
- ✅ தரவுத்தளங்கள் மற்றும் மெசேஜ் கியூகளைச் சேர்ப்பதற்கு முன் நம்பிக்கையை கட்டடுங்கள்

**உருவகம்**: இதை ஓர் வண்டித் பயிற்சி கற்றலாகக் கருதுங்கள். நீங்கள் காலியான பார்க்கிங் லாட்டில் (2 சேவைகள்) தொடங்கி அடிப்படைகளை அடக்கி, பிறகு நகர போக்குவரத்து (5+ சேவைகள் மற்றும் தரவுத்தளங்கள்) நோக்கி முன்னேறுவீர்கள்.

### கட்டம் 2: எதிர்கால விரிவாக்கம் (குறிப்பு கட்டமைப்பு)

ஒரு 2-சேவை கட்டமைப்பை நீங்கள் கையாளச்செய்த பின்னர், நீங்கள் விரிவுபடுத்தலாம்:

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

கட்டளைத் தொகுதிகள் குறுக்கீடு “Expansion Guide” பகுதிக்கு பகுதி இறுதியில் படிக்கவும்.

## சேர்க்கப்பட்ட அம்சங்கள்

✅ **சேவை கண்டுபிடிப்பு**: கண்டெய்னர்களுக்கு இடையில் தானாக DNS-உடைய கண்டுபிடிப்பு  
✅ **லோட் பாலன்சிங்**: ரெப்ளிகாக்களுக்கு இடையே கட்டமைக்கப்பட்ட லோட் பாலன்சிங்  
✅ **ஆட்டோ-ஸ்கேலிங்**: HTTP கோரிக்கைகள் அடிப்படையில் ஒவ்வொரு சேவைக்கும் தனித்தனியாக ஸ்கேலிங்  
✅ **ஆரோக்கிய கண்காணிப்பு**: இரு சேவைகளுக்கும் லைவ்நெஸ் மற்றும் ரெடினஸ்ஸு சோதனைகள்  
✅ **பிரிக்கப்பட்ட லாகிங்**: Application Insights உடன் மைய மற்றும் ஒருங்கிணைந்த பதிவு  
✅ **உள்ளக நெட்வொர்க்கிங்**: பாதுகாப்பான சேவை-தூண்டு சேவை தொடர்பு  
✅ **கண்டெய்னர் ஒர்கெஸ்ட்ரேஷன்**: தானாக அடுப்பது மற்றும் ஸ்கேலிங்  
✅ **சூனிய-இடைநீக்கம் இல்லாத புதுப்பிப்புகள்**: ரிவிஷன் மேலாண்மையுடன் ரோலிங் அப்டேட்கள்  

## முன் தேவைகள்

### தேவையான கருவிகள்

தொடங்குவதற்கு முன், இந்த கருவிகள் நிறுவப்பட்டுள்ளதா என சரிபார்க்கவும்:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (версія 1.0.0 அல்லது உயர்ந்தது)  
   ```bash
   azd version
   # எதிர்பார்க்கப்படும் வெளியீடு: azd பதிப்பு 1.0.0 அல்லது அதற்கு மேல்
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (версія 2.50.0 அல்லது உயர்ந்தது)  
   ```bash
   az --version
   # எதிர்பார்க்கப்படும் வெளியீடு: azure-cli 2.50.0 அல்லது அதற்கு மேல்
   ```

3. **[Docker](https://www.docker.com/get-started)** (உள்ளூர் வளர்ச்சி/சோதனைக்காக - விருப்பத்தேர்வு)  
   ```bash
   docker --version
   # எதிர்பார்க்கப்படும் வெளியீடு: Docker பதிப்பு 20.10 அல்லது அதற்கு மேல்
   ```

### Azure தேவைகள்

- செயலில் உள்ள **Azure subscription** ([create a free account](https://azure.microsoft.com/free/))  
- உங்கள் subscription இல் வளங்களை உருவாக்க அனுமதிகள்  
- subscription அல்லது resource group-இல் **Contributor** பங்கு

### அறிவு முன் நிபந்தனைகள்

இது ஒரு **மேம்பட்ட நிலை** உதாரணம். நீங்கள் கீழ்காணும் மேம்பாடுகளை ஏற்க வேண்டும்:
- [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) முடித்திருத்தல்  
- மைக்ரோசேவைகள் கட்டமைப்பின் அடிப்படை புரிதல்  
- REST APIs மற்றும் HTTP-ஐ அறிந்திருத்தல்  
- கண்டெய்னர் கருத்துக்களை புரிந்திருத்தல்

**Container Apps-இல் புதியவரா?** அடிப்படைகளை கற்றுக்கொள்ள முதலில் [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) தொடங்குங்கள்.

## விரைவு தொடங்கல் (படி-படி)

### படி 1: கிளோன் செய்து செல்லவும்

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ வெற்றிக் சரிபார்ப்பு**: `azure.yaml` காணப்படுகிறது என்று உறுதிசெய்துகொண்டு சரிபார்க்கவும்:
```bash
ls
# எதிர்பார்க்கப்படும்: README.md, azure.yaml, infra/, src/
```

### படி 2: Azure-இல் அங்கீகாரம் பெறுங்கள்

```bash
azd auth login
```

இது Azure அங்கீகாரத்திற்காக உங்கள் உலாவியை திறக்கிறது. உங்கள் Azure அங்கீகார விவரங்களுடன் உள்நுழைக.

**✓ வெற்றிக் சரிபார்ப்பு**: நீங்கள் இதைப் பார்க்க வேண்டும்:
```
Logged in to Azure.
```

### படி 3: சூழலை ஆரம்பிக்கவும்

```bash
azd init
```

**நீங்கள் காண்பீர்கள் என்ற_PROMPTS**:
- **Environment name**: குறுகிய பெயரை உள்ளிடவும் (எ.கா., `microservices-dev`)  
- **Azure subscription**: உங்கள் subscription-ஐ தேர்ந்தெடுக்கவும்  
- **Azure location**: ஒரு பிராந்தியத்தை தேர்வு செய்யவும் (எ.கா., `eastus`, `westeurope`)

**✓ வெற்றிக் சரிபார்ப்பு**: நீங்கள் இதைப் பார்க்க வேண்டும்:
```
SUCCESS: New project initialized!
```

### படி 4: அடிநிலையமைப்பு மற்றும் சேவைகளை அமல்படுத்தவும்

```bash
azd up
```

**என்ன நடக்கும்** (8-12 நிமிடங்கள் எடுக்கும்):
1. Container Apps சூழலை உருவாக்குகிறது  
2. கண்காணிப்புக்காக Application Insights உருவாக்குகிறது  
3. API Gateway கண்டெய்னரை கட்டுகிறது (Node.js)  
4. Product Service கண்டெய்னரை கட்டுகிறது (Python)  
5. இரு கண்டெய்னர்களையும் Azure-க்கு அமல்படுத்துகிறது  
6. நெட்வொர்க்கிங் மற்றும் ஆரோக்கியச் சோதனைகளை கட்டமைக்கிறது  
7. கண்காணிப்பு மற்றும் பதிவு அமைப்புகளை அமைக்கிறது

**✓ வெற்றிக் சரிபார்ப்பு**: நீங்கள் இதைப் பார்க்க வேண்டும்:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ நேரம்**: 8-12 நிமிடங்கள்

### படி 5: அமல்படுத்தலை சோதியுங்கள்

```bash
# கேட்வே எண்ட்பாயிண்டை பெறவும்
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# API கேட்வே நலத்தை சோதிக்கவும்
curl $GATEWAY_URL/health

# எதிர்பார்க்கப்படும் வெளியீடு:
# {"நிலை":"ஆரோக்கியம்","சேவை":"api-கேட்வே","காலமுத்திரை":"2025-11-19T10:30:00Z"}
```

**Gateway மூலமாக product service-ஐ சோதியுங்கள்**:
```bash
# பொருட்களை பட்டியலிடவும்
curl $GATEWAY_URL/api/products

# எதிர்பார்க்கப்படும் வெளியீடு:
# [
#   {"id":1,"name":"Laptop","price":999.99,"stock":50},
#   {"id":2,"name":"Mouse","price":29.99,"stock":200},
#   {"id":3,"name":"Keyboard","price":79.99,"stock":150}
# ]
```

**✓ வெற்றிக் சரிபார்ப்பு**: இரு endpoints-களும் பிழைகள் இல்லாமல் JSON தரவை திருப்புகின்றன.

---

**🎉 வாழ்த்துகள்!** நீங்கள் Azure-க்கு ஒரு மைக்ரோசேவைகள் கட்டமைப்பை அமல்படுத்திவிட்டீர்கள்!

## திட்ட அமைப்பு

அடிப்படை கோப்புகள் அனைத்தும் சேர்க்கப்பட்டுள்ளன—இது ஒரு முழுமையான, வேலை செய்கிற உதாரணம்:

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

**ஒவ்வொரு கூறும் என்ன செய்கிறது:**

**Infrastructure (infra/)**:
- `main.bicep`: அனைத்து Azure வளங்களையும் மற்றும் அவற்றின் சார்புகளை ஒருங்கிணைக்கிறது  
- `core/container-apps-environment.bicep`: Container Apps சூழலும் Azure Container Registry-ஐ உருவாக்குகிறது  
- `core/monitor.bicep`: பிரிக்கப்பட்ட பதிவு மற்றும் கண்காணிப்புக்காக Application Insights அமைக்கிறது  
- `app/*.bicep`: ஸ்கேலிங் மற்றும் ஆரோக்கியச் சோதனைகளுடன் தனித்தனி container app வரையறைகள்

**API Gateway (src/api-gateway/)**:
- வெளியிடப்படக்கூடிய சேவை, பின்தள சேவைகளுக்கு கோரிக்கைகளை வழிமறைக்கிறது  
- பதிவு, பிழை கையாளுதல் மற்றும் கோரிக்கை முன்னோக்கி அனுப்பலை செயல்படுத்துகிறது  
- சேவை-தூண்டு சேவை HTTP தொடர்பை எடுத்துக்காட்டு செய்கிறது

**Product Service (src/product-service/)**:
- உள்ளக சேவை, சாதாரணத்திற்காக நினைவகில் பொருட் каталாக்கை நிர்வகிக்கிறது  
- ஆரோக்கியச் சோதனைகளுடன் REST API  
- பின்னணி மைக்ரோசேவை மாதிரிக்கான எடுத்துக்காட்டு

## சேவைகள் கண்ணோட்டம்

### API Gateway (Node.js/Express)

**Port**: 8080  
**சேவையை அணுகுவது**: பொது (external ingress)  
**ப்ரயோஜனம்**: வரும் கோரிக்கைகளை பொருத்தமான பின்தள சேவைகளுக்கு வழிமாற்றுகிறது

**Endpoints**:
- `GET /` - சேவை தகவல்  
- `GET /health` - ஆரோக்கியச் சோதனை endpoint  
- `GET /api/products` - product service-க்கு முன்னோக்கி அனுப்பு (அனைத்தையும் பட்டியலிடு)  
- `GET /api/products/:id` - product service-க்கு முன்னோக்கி அனுப்பு (ID மூலம் பெறுதல்)

**முக்கிய அம்சங்கள்**:
- axios மூலம் கோரிக்கை வழிமாற்றல்  
- மையமாக்கப்பட்ட பதிவு  
- பிழை கையாளுதல் மற்றும் timeout மேலாண்மை  
- சூழல் மாறிலிகள் மூலம் சேவை கண்டுபிடிப்பு  
- Application Insights ஒருங்கிணைப்பு

**Code Highlight** (`src/api-gateway/app.js`):
```javascript
// உள்ளக சேவை தொடர்பு
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Port**: 8000  
**அணுகல்**: உள்ளக மட்டும் (பொதுப் பார்வைக்கு இல்லை)  
**ப்ரயோஜனம்**: நினைவகப் பொருள் தரவுத்தொகுப்பை நிர்வகிக்கிறது

**Endpoints**:
- `GET /` - சேவை தகவல்  
- `GET /health` - ஆரோக்கியச் சோதனை endpoint  
- `GET /products` - அனைத்து பொருட்களையும் பட்டியலிடு  
- `GET /products/<id>` - ID மூலம் பொருளை பெறுக

**முக்கிய அம்சங்கள்**:
- Flask உடன் RESTful API  
- நினைவகத்தில் பதிக்கப்பட்ட பொருள் கண்ணோட்டம் (எளிமை, தரவுத்தளம் தேவையில்லை)  
- probes மூலம் ஆரோக்கிய கண்காணிப்பு  
- கட்டமைக்கப்பட்ட பதிவு  
- Application Insights ஒருங்கிணைப்பு

**தரவு மாதிரி**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**உள்ளக மட்டும் ஏன்?**  
Product service பொது பார்வைக்கு வெளியிடப்படவில்லை. அனைத்து கோரிக்கைகளும் API Gateway மூலமாகவே செல்ல வேண்டும், இது வழங்குகிறது:
- பாதுகாப்பு: கட்டுப்படுத்தப்பட்ட அணுகல் புள்ளி  
- நெகிழ்வுத்தன்மை: கிளையன்ட்களை பாதிக்காமல் பின்தளத்தை மாற்றும் திறன்  
- கண்காணிப்பு: மையமாக்கப்பட்ட கோரிக்கை பதிவு

## சேவை தொடர்பை புரிதல்

### சேவைகள் ஒன்றுக்கு மற்றவையாக எப்படி பேசுகின்றன

இந்த உதாரணத்தில், API Gateway Product Service-யுடன் தொடர்பு கொண்டிருக்கிறது **உள்ளக HTTP அழைப்புகள்** மூலம்:

```javascript
// API கேட்வே (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// உள்ளக HTTP கோரிக்கையைச் செய்யவும்
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**முக்கிய புள்ளிகள்**:

1. **DNS-அடிப்படையிலான கண்டுபிடிப்பு**: Container Apps தானாகவே உள்ளக சேவைகளுக்கு DNS வழங்குகிறது  
   - Product Service FQDN: `product-service.internal.<environment>.azurecontainerapps.io`  
   - எளிமையாக்கப்பட்டதாக: `http://product-service` (Container Apps இதை தீர்மானிக்கிறது)

2. **பொதுவாக வெளிவருவதில்லை**: Product Service-க்கு Bicep-இல் `external: false` உள்ளது  
   - Container Apps சூழலில் உள்ளதே மட்டும் அணுகக்கூடியது  
   - இணையத்திலிருந்து அணுகப்படமுடியாது

3. **சூழல் மாறிலிகள்**: சேவை URL-கள் deployment நேரத்தில் इंजெக்ட் செய்யப்படுகின்றன  
   - Bicep internal FQDN-ஐ gateway-க்கு தந்து விடுகிறது  
   - பயன்பாட்டு குறியீட்டில் கடினமாக குறிக்கப்பட்ட URL-கள் இல்லை

**உருவகக் கோண விளக்கம்**: இதை அலுவலக அறைகளாகக் கவனியுங்கள். API Gateway என்பது வரவேற்பு மேசை (பொதுக்காணும்), மற்றும் Product Service என்பது ஒரு அலுவலக அறை (உள்ளக மட்டும்). வருகையாளர்கள் எந்த அலுவலகத்திற்கும் செல்ல வரவேற்பு வழியாகவே செல்ல வேண்டும்.

## அமல்படுத்தல் விருப்பிகள்

### முழு அமல்படுத்தல் (பரிந்துரைக்கப்பட்டது)

```bash
# அடித்தள கட்டமைப்பையும் இரு சேவைகளையும் நடைமுறைப்படுத்தவும்
azd up
```

இது அமல்படுத்துகிறது:
1. Container Apps சூழல்  
2. Application Insights  
3. Container Registry  
4. API Gateway கண்டெய்னர்  
5. Product Service கண்டெய்னர்

**நேரம்**: 8-12 நிமிடங்கள்

### தனித்தனி சேவையை அமல்படுத்தவும்

```bash
# ஒரே ஒரு சேவையை மட்டுமே நிறுவவும் (முதலில் azd up ஓட்டிய பின்னர்)
azd deploy api-gateway

# அல்லது தயாரிப்பு சேவையை நிறுவவும்
azd deploy product-service
```

**பயன்பாட்டு நோக்கம்**: ஒரு சேவையில் மட்டுமே குறியீட்டை புதுப்பித்து இருந்தால் அந்த சேவையை மட்டும் மீண்டும் அமல்படுத்த வேண்டிய போது.

### கட்டமைப்பை புதுப்பிக்கவும்

```bash
# ஸ்கேலிங் அளவுருக்களை மாற்றவும்
azd env set GATEWAY_MAX_REPLICAS 30

# புதிய கட்டமைப்புடன் மீண்டும் நிறுவவும்
azd up
```

## கட்டமைப்பு

### ஸ்கேலிங் கட்டமைப்பு

இரு சேவைகளும் தங்கள் Bicep கோப்புகளில் HTTP-அடிப்படையிலான ஆட்டோஸ்கேலிங்குடன் வரையறுக்கப்பட்டுள்ளன:

**API Gateway**:
- Min replicas: 2 (அணுக்கமாகக் குறைந்தது 2 இருக்க வேண்டும்)  
- Max replicas: 20  
- Scale trigger: ஒவ்வொரு ரெப்ளிகாவுக்கும் 50 ஒரே நேரத்தில் கோரிக்கைகள்

**Product Service**:
- Min replicas: 1 (தேவையானால் சுழற்சியில் 0-ஆகவும் ஸ்கேல் ஆகலாம்)  
- Max replicas: 10  
- Scale trigger: ஒவ்வொரு ரெப்ளிகாவுக்கும் 100 ஒரே நேரத்தில் கோரிக்கைகள்

**ஸ்கேலிங்கை தனிப்பயனாக்கவும்** (in `infra/app/*.bicep`):
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

### வள ஒதுக்கீடு

**API Gateway**:
- CPU: 1.0 vCPU  
- Memory: 2 GiB  
- காரணம்: அனைத்து வெளியுறவு போக்குவரத்தையும் கையாள்கிறது

**Product Service**:
- CPU: 0.5 vCPU  
- Memory: 1 GiB  
- காரணம்: நினைவக-கேந்திரமான எளிமையான செயலுகள்

### ஆரோக்கியச் சோதனைகள்

இரு சேவைகளும் லைவ்நெஸ் மற்றும் ரெடினஸ்ஸு probes-ஐ உள்ளடக்கியுள்ளன:

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

**இது என்ன அர்த்தம்**:
- **Liveness**: ஆரோக்கியச் சோதனை தோல்வியடையும்போது, Container Apps கண்டெய்னரை மறுதொடக்கம் செய்கிறது  
- **Readiness**: தயாரில்லை என்றால், Container Apps அந்த ரெப்ளிகாவுக்கு போக்குவரத்து வழிமாற்றுவதை நிறுத்துகிறது



## கண்காணிப்பு & பார்வைத்திறன்

### சேவை பதிவுகளை காண்க

```bash
# azd monitor மூலம் பதிவுகளைப் பார்க்கவும்
azd monitor --logs

# அல்லது குறிப்பிட்ட Container Apps-களுக்காக Azure CLI-யைப் பயன்படுத்தவும்:
# API Gateway-இலிருந்து பதிவுகளை ஒளிபரப்பவும்
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# சமீபத்திய தயாரிப்பு சேவை பதிவுகளைப் பார்க்கவும்
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**எதிர்பார்க்கப்படுகின்ற வெளியீடு**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights கேள்விகள்

Azure போர்டலில் Application Insights-ஐ அணுகி, பிறகு இந்தக் கேள்விகளை இயக்கு:

**மந்தமான கோரிக்கைகளை கண்டறி**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**சேவை-தூண்டு சேவை அழைப்புகளை பின்தொடரவும்**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**சேவை போல் பிழை விகிதம்**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**காலதாமத்தில் கோரிக்கை தொகை**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### கண்காணிப்பு டாஷ்போர்டை அணுகுதல்

```bash
# Application Insights விவரங்களைப் பெறவும்
azd env get-values | grep APPLICATIONINSIGHTS

# Azure போர்டல் கண்காணிப்பை திறக்கவும்
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### நேரடி மதிப்பீடுகள்

1. Azure போர்டலில் Application Insights-க்கு செல்லவும்  
2. "Live Metrics" என்பதை கிளிக் செய்யவும்  
3. நேரடி கோரிக்கைகள், தோல்விகள் மற்றும் செயல்திறன் காண்க  
4. சோதனை செய்ய: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## பயிற்சி பயிற்சிகள்

[குறிப்பு: முழு பயிற்சி பயிற்சிகளுக்கான படி-படி நடைமுறைகள், deployment சரிபார்ப்பு, தரவு மாற்றம், ஆட்டோஸ்கேலிங் சோதனைகள், பிழை கையாளுதல் மற்றும் மூன்றாவது சேவையைச் சேர்ப்பது போன்ற விவரங்கள் "Practical Exercises" பிரிவில் மேலே பார்க்கவும்.]

## செலவுக் கணக்கீடு

### மாதாந்திர கண்ணிடப்படும் செலவுகள் (இந்த 2-சேவை உதாரணத்துக்காக)

| Resource | Configuration | Estimated Cost |
|----------|--------------|----------------|
| API Gateway | 2-20 replicas, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replicas, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic tier | $5 |
| Application Insights | 1-2 GB/month | $5-10 |
| Log Analytics | 1 GB/month | $3 |
| **மொத்தம்** | | **$58-243/month** |

**பயன்பாட்டின் அடிப்படையில் செலவு விவரம்**:
- **குறைந்த போக்குவரத்து** (சோதனை/கற்றல்): ~$60/மாதம்  
- **இடைநிலை போக்குவரத்து** (சிறிய தயாரிப்பு): ~$120/மாதம்  
- **அதிக போக்குவரத்து** (பහුலமான காலங்கள்): ~$240/மாதம்

### செலவு முந்தைய குறிப்பு

1. **வளர்ச்சிக்காக Scale to Zero பயன்படுத்தவும்**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Cosmos DB-க்கு Consumption Plan பயன்படுத்தவும்** (நீங்கள் அதைச் சேர்க்கும்போது):  
   - நீங்கள் பயன்படுத்தும் அளவு மட்டுமே பணம் செலுத்துங்கள்  
   - குறைப்பதற்கான குறைந்தபட்ச கட்டணம் இல்லை

3. **Application Insights Sampling அமைக்கவும்**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // கோரிக்கைகளின் 50% ஐ மாதிரியாக எடு
   ```

4. **தேவையில்லாதபோது சுத்தம் செய்யவும்**:
   ```bash
   azd down
   ```

### இலவச அடுக்கு விருப்பங்கள்
For learning/testing, consider:
- Use Azure free credits (first 30 days)
- Keep to minimum replicas
- Delete after testing (no ongoing charges)

---

## Cleanup

To avoid ongoing charges, delete all resources:

```bash
azd down --force --purge
```

**Confirmation Prompt**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Type `y` to confirm.

**What Gets Deleted**:
- Container Apps Environment
- Both Container Apps (gateway & product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ Verify Cleanup**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Should return empty.

---

## Expansion Guide: From 2 to 5+ Services

Once you've mastered this 2-service architecture, here's how to expand:

### Phase 1: Add Database Persistence (Next Step)

**Add Cosmos DB for Product Service**:

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

2. Update product service to use Cosmos DB instead of in-memory data

3. Estimated additional cost: ~$25/month (serverless)

### Phase 2: Add Third Service (Order Management)

**Create Order Service**:

1. New folder: `src/order-service/` (Python/Node.js/C#)
2. New Bicep: `infra/app/order-service.bicep`
3. Update API Gateway to route `/api/orders`
4. Add Azure SQL Database for order persistence

**Architecture becomes**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Phase 3: Add Async Communication (Service Bus)

**Implement Event-Driven Architecture**:

1. Add Azure Service Bus: `infra/core/servicebus.bicep`
2. Product Service publishes "ProductCreated" events
3. Order Service subscribes to product events
4. Add Notification Service to process events

**Pattern**: Request/Response (HTTP) + Event-Driven (Service Bus)

### Phase 4: Add User Authentication

**Implement User Service**:

1. Create `src/user-service/` (Go/Node.js)
2. Add Azure AD B2C or custom JWT authentication
3. API Gateway validates tokens
4. Services check user permissions

### Phase 5: Production Readiness

**Add These Components**:
- Azure Front Door (global load balancing)
- Azure Key Vault (secret management)
- Azure Monitor Workbooks (custom dashboards)
- CI/CD Pipeline (GitHub Actions)
- Blue-Green Deployments
- Managed Identity for all services

**Full Production Architecture Cost**: ~$300-1,400/month

---

## Learn More

### Related Documentation
- [Azure Container Apps Documentation](https://learn.microsoft.com/azure/container-apps/)
- [Microservices Architecture Guide](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights for Distributed Tracing](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Next Steps in This Course
- ← Previous: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - Beginner single-container example
- → Next: [AI Integration Guide](../../../../../examples/docs/ai-foundry) - Add AI capabilities
- 🏠 [Course Home](../../README.md)

### Comparison: When to Use What

**Single Container App** (Simple Flask API example):
- ✅ Simple applications
- ✅ Monolithic architecture
- ✅ Fast to deploy
- ❌ Limited scalability
- **Cost**: ~$15-50/month

**Microservices** (This example):
- ✅ Complex applications
- ✅ Independent scaling per service
- ✅ Team autonomy (different services, different teams)
- ❌ More complex to manage
- **Cost**: ~$60-250/month

**Kubernetes (AKS)**:
- ✅ Maximum control and flexibility
- ✅ Multi-cloud portability
- ✅ Advanced networking
- ❌ Requires Kubernetes expertise
- **Cost**: ~$150-500/month minimum

**Recommendation**: Start with Container Apps (this example), move to AKS only if you need Kubernetes-specific features.

---

## Frequently Asked Questions

**Q: Why only 2 services instead of 5+?**  
A: Educational progression. Master the fundamentals (service communication, monitoring, scaling) with a simple example before adding complexity. The patterns you learn here apply to 100-service architectures.

**Q: Can I add more services myself?**  
A: Absolutely! Follow the expansion guide above. Each new service follows the same pattern: create src folder, create Bicep file, update azure.yaml, deploy.

**Q: Is this production-ready?**  
A: It's a solid foundation. For production, add: managed identity, Key Vault, persistent databases, CI/CD pipeline, monitoring alerts, and backup strategy.

**Q: Why not use Dapr or other service mesh?**  
A: Keep it simple for learning. Once you understand native Container Apps networking, you can layer on Dapr for advanced scenarios.

**Q: How do I debug locally?**  
A: Run services locally with Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: Can I use different programming languages?**  
A: Yes! This example shows Node.js (gateway) + Python (product service). You can mix any languages that run in containers.

**Q: What if I don't have Azure credits?**  
A: Use Azure free tier (first 30 days with new accounts) or deploy for short testing periods and delete immediately.

---

> **🎓 Learning Path Summary**: You've learned to deploy a multi-service architecture with automatic scaling, internal networking, centralized monitoring, and production-ready patterns. This foundation prepares you for complex distributed systems and enterprise microservices architectures.

**📚 Course Navigation:**
- ← Previous: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → Next: [Database Integration Example](../../../../../examples/database-app)
- 🏠 [Course Home](../../../README.md)
- 📖 [Container Apps Best Practices](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
தயவுசெய்து கவனிக்க:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவையாகும் Co‑op Translator (https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சித்தாலும், இயந்திர மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான விவரங்கள் இருக்கக்கூடும் என்பதை தயவுசெய்து கருத்தில் கொள்ளவும். ஆவணத்தின் மூலப் மொழியில் තිබும் ஆவணம் அதிகாரப்பூர்வமானதாகக் கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு தொழில்முறை மனித மொழிபெயர்ப்பை பெறுவது பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்பட்ட எந்தவொரு புரிதலிழப்பிற்கும் அல்லது தவறான விளக்கத்திற்கும் நாங்கள் பொறுப்பேற்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->