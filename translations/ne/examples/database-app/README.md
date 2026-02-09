# AZD प्रयोग गरेर Microsoft SQL Database र वेब एप तैनाथ गर्नु

⏱️ **अनुमानित समय**: 20-30 मिनेट | 💰 **अनुमानित लागत**: ~$15-25/महिना | ⭐ **जटिलता**: मध्यम

यो **पूर्ण, कार्यरत उदाहरण** ले [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) कसरी प्रयोग गरी Python Flask वेब एप्लिकेसन र Microsoft SQL Database लाई Azure मा तैनाथ गर्ने देखाउँछ। सबै कोड समावेश गरिएको र परीक्षण गरिएको छ—कुनै बाह्य निर्भरता आवश्यक छैन।

## तपाईंले के सिक्नु हुनेछ

यो उदाहरण पूरा गरेर, तपाईं:
- इन्फ्रास्ट्रक्चर-ऐस-कोड प्रयोग गरी बहु-टियर आवेदन (वेब एप + डेटाबेस) तैनाथ गर्ने
- पासवर्डहरु हार्डकोड नगरी सुरक्षित डेटाबेस कनेक्शन कन्फिगर गर्ने
- Application Insights सँग अनुप्रयोग स्वास्थ्य अनुगमन गर्ने
- AZD CLI द्वारा Azure स्रोत व्यवस्थापन प्रभावकारी ढंगले गर्ने
- सुरक्षा, लागत अनुकूलन, र अवलोकनका लागि Azure का उत्तम अभ्यासहरू पालना गर्ने

## काल्पनिक परिदृश्य (Scenario Overview)
- **वेब एप**: डेटाबेस जडान सहितको Python Flask REST API
- **डेटाबेस**: नमूना डाटासँग Azure SQL Database
- **इन्फ्रास्ट्रक्चर**: Bicep प्रयोग गरी प्रदेय (मोडुलर, पुन: प्रयोगयोग्य टेम्पलेटहरू)
- **डिप्लोयमेन्ट**: `azd` कमाण्डहरूद्वारा पूर्ण रूपमा स्वचालित
- **अनुगमन**: लगहरू र टेलिमेट्रीका लागि Application Insights

## पूर्वआवश्यकताहरू

### आवश्यक उपकरणहरू

सुरु गर्नु अघि, यी उपकरणहरू स्थापना गरिएको छ कि छैन भनि जाँच गर्नुहोस्:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (संस्करण 2.50.0 वा माथि)
   ```sh
   az --version
   # अपेक्षित परिणाम: azure-cli 2.50.0 वा माथि
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (संस्करण 1.0.0 वा माथि)
   ```sh
   azd version
   # अपेक्षित आउटपुट: azd संस्करण 1.0.0 वा सोभन्दा माथि
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (स्थानीय विकासका लागि)
   ```sh
   python --version
   # अपेक्षित आउटपुट: Python 3.8 वा माथि
   ```

4. **[Docker](https://www.docker.com/get-started)** (वैकल्पिक, स्थानीय कन्टेनरीकृत विकासका लागि)
   ```sh
   docker --version
   # अपेक्षित आउटपुट: Docker संस्करण 20.10 वा सोभन्दा नयाँ
   ```

### Azure आवश्यकताहरू

- एक सक्रिय **Azure subscription** ([create a free account](https://azure.microsoft.com/free/))
- तपाईंको subscription मा स्रोतहरू सिर्जना गर्ने अनुमति
- subscription वा resource group मा **Owner** वा **Contributor** भूमिका

### ज्ञान सम्बन्धी पूर्वआवश्यकता

यो **मध्यम-स्तरको** उदाहरण हो। तपाईंलाई निम्नबारे परिचित हुनुपर्छ:
- आधारभूत कमाण्ड-लाइन अपरेसनहरू
- क्लाउडका आधारभूत अवधारणाहरू (resources, resource groups)
- वेब अनुप्रयोग र डेटाबेसको आधारभूत समझ

**AZD मा नयाँ?** सुरु गर्न [Getting Started guide](../../docs/chapter-01-foundation/azd-basics.md) बाट सुरु गर्नुहोस्।

## वास्तुकला

यस उदाहरणले वेब एप र SQL डेटाबेस भएको दुई-टियर वास्तुकला तैनाथ गर्छ:

```
┌─────────────────┐        ┌──────────────────────┐
│  User Browser   │◄──────►│   Azure Web App      │
└─────────────────┘        │   (Flask API)        │
                           │   - /health          │
                           │   - /products        │
                           └──────────┬───────────┘
                                      │
                                      │ Secure Connection
                                      │ (Encrypted)
                                      │
                           ┌──────────▼───────────┐
                           │ Azure SQL Database   │
                           │   - Products table   │
                           │   - Sample data      │
                           └──────────────────────┘
```

**स्रोत तैनाथीकरण:**
- **Resource Group**: सबै स्रोतहरूको लागि कन्टेनर
- **App Service Plan**: Linux-आधारित होस्टिङ (लागत-कुशलताका लागि B1 टियर)
- **Web App**: Flask एपसहित Python 3.11 runtime
- **SQL Server**: TLS 1.2 न्यूनतम सहित व्यवस्थापित डेटाबेस सर्भर
- **SQL Database**: Basic टियर (2GB, विकास/परीक्षणका लागि उपयुक्त)
- **Application Insights**: अनुगमन र लगिङ
- **Log Analytics Workspace**: केन्द्रित लग स्टोरेज

**उपमा**: यसलाई एउटा रेस्टुरेन्ट (वेब एप) र एउटा वाक-इन फ्रिजर (डेटाबेस) जस्तो सोच्नुहोस्। ग्राहकहरू मेनु (API endpoints) बाट अर्डर गर्छन्, र किचेन (Flask एप) फ्रिजरबाट सामग्री (डेटा) निकाल्छ। रेस्टुरेन्ट प्रबन्धक (Application Insights) सबै घटनाहरू ट्र्याक गर्छ।

## फोल्डर संरचना

यस उदाहरणमा सबै फाइलहरू समावेश छन्—कुनै बाह्य निर्भरता आवश्यक छैन:

```
examples/database-app/
│
├── README.md                    # This file
├── azure.yaml                   # AZD configuration file
├── .env.sample                  # Sample environment variables
├── .gitignore                   # Git ignore patterns
│
├── infra/                       # Infrastructure as Code (Bicep)
│   ├── main.bicep              # Main orchestration template
│   ├── abbreviations.json      # Azure naming conventions
│   └── resources/              # Modular resource templates
│       ├── sql-server.bicep    # SQL Server configuration
│       ├── sql-database.bicep  # Database configuration
│       ├── app-service-plan.bicep  # Hosting plan
│       ├── app-insights.bicep  # Monitoring setup
│       └── web-app.bicep       # Web application
│
└── src/
    └── web/                    # Application source code
        ├── app.py              # Flask REST API
        ├── requirements.txt    # Python dependencies
        └── Dockerfile          # Container definition
```

**हरेक फाइलले के गर्छ:**
- **azure.yaml**: AZD लाई के तैनाथ गर्ने र कहाँ भन्ने बताउँछ
- **infra/main.bicep**: सबै Azure स्रोतहरू संयोजन गर्छ
- **infra/resources/*.bicep**: व्यक्तिगत स्रोत परिभाषाहरू (पुन: प्रयोगयोग्य बनाउन मोडुलर)
- **src/web/app.py**: डेटाबेस लॉजिक सहितको Flask एप
- **requirements.txt**: Python प्याकेज निर्भरता
- **Dockerfile**: डिप्लोयमेन्टका लागि कन्टेनरीकरण निर्देशनहरू

## छिटो सुरु (स्टेप-बाइ-स्टेप)

### स्टेप 1: क्लोन र नेभिगेट गर्नुहोस्

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ सफलता जाँच**: तपाईले `azure.yaml` र `infra/` फोल्डर देख्नुहुन्छ कि छैन भनी जाँच गर्नुहोस्:
```sh
ls
# अपेक्षित: README.md, azure.yaml, infra/, src/
```

### स्टेप 2: Azure सँग प्रमाणिकरण गर्नुहोस्

```sh
azd auth login
```

यसले ब्राउजर खोल्छ Azure प्रमाणिकरणका लागि। आफ्नो Azure क्रेडेन्सियलहरू प्रयोग गरेर साइन इन गर्नुहोस्।

**✓ सफलता जाँच**: तपाईंले निम्न देख्नु पर्छ:
```
Logged in to Azure.
```

### स्टेप 3: वातावरण आरम्भ गर्नुहोस्

```sh
azd init
```

**के हुन्छ**: AZD ले तपाइँको तैनाथीसँग सम्बन्धित स्थानीय कन्फिगरेसन सिर्जना गर्दछ।

**प्रम्प्टहरू जुन तपाइँले देख्नुहुनेछ**:
- **Environment name**: छोटो नाम प्रविष्ट गर्नुहोस् (उदाहरण: `dev`, `myapp`)
- **Azure subscription**: सूचीबाट आफ्नो subscription छान्नुहोस्
- **Azure location**: एउटा क्षेत्र छान्नुहोस् (उदाहरण: `eastus`, `westeurope`)

**✓ सफलता जाँच**: तपाईंले निम्न देख्नु पर्छ:
```
SUCCESS: New project initialized!
```

### स्टेप 4: Azure स्रोतहरू प्राविजन गर्नुहोस्

```sh
azd provision
```

**के हुन्छ**: AZD ले सबै इन्फ्रास्ट्रक्चर तैनाथ गर्छ (5-8 मिनेट लाग्न सक्छ):
1. Resource group सिर्जना गर्छ
2. SQL Server र Database सिर्जना गर्छ
3. App Service Plan सिर्जना गर्छ
4. Web App सिर्जना गर्छ
5. Application Insights सिर्जना गर्छ
6. नेटवर्किङ र सुरक्षा कन्फिगर गर्छ

**तपाईंलाई सोधिनेछ**:
- **SQL admin username**: एउटा प्रयोगकर्ता नाम प्रविष्ट गर्नुहोस् (उदाहरण: `sqladmin`)
- **SQL admin password**: बलियो पासवर्ड प्रविष्ट गर्नुहोस् (यसलाई सुरक्षित राख्नुहोस्!)

**✓ सफलता जाँच**: तपाईंले निम्न देख्नु पर्छ:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ समय**: 5-8 मिनेट

### स्टेप 5: एप्लिकेसन डिप्लोय गर्नुहोस्

```sh
azd deploy
```

**के हुन्छ**: AZD ले तपाईंको Flask एप्लिकेसन बनाउछ र डिप्लोय गर्छ:
1. Python एप्लिकेसन प्याकेज गर्छ
2. Docker कन्टेनर बनाउँछ
3. Azure Web App मा पुश गर्छ
4. नमूना डाटासँग डेटाबेस इनीसियलाइज गर्छ
5. अनुप्रयोग सुरु गर्छ

**✓ सफलता जाँच**: तपाईंले निम्न देख्नु पर्छ:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ समय**: 3-5 मिनेट

### स्टेप 6: एप्लिकेसन ब्राउज गर्नुहोस्

```sh
azd browse
```

यसले तपाईंको तैनाथित वेब एप ब्राउजरमा खोल्छ ठेगाना `https://app-<unique-id>.azurewebsites.net`

**✓ सफलता जाँच**: तपाईंले JSON आउटपुट देख्नु पर्छ:
```json
{
  "message": "Welcome to the Database App API",
  "endpoints": {
    "/": "This help message",
    "/health": "Health check endpoint",
    "/products": "List all products",
    "/products/<id>": "Get product by ID"
  }
}
```

### स्टेप 7: API Endpoints परीक्षण गर्नुहोस्

**हेल्थ चेक** (डेटाबेस कनेक्शन प्रमाणित गर्नुहोस्):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**अपेक्षित प्रतिक्रया**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**प्रोडक्टहरू सूचीबद्ध गर्नुहोस्** (नमूना डाटा):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**अपेक्षित प्रतिक्रया**:
```json
[
  {
    "id": 1,
    "name": "Laptop",
    "description": "High-performance laptop",
    "price": 1299.99,
    "created_at": "2025-11-19T10:30:00"
  },
  ...
]
```

**एकल प्रोडक्ट प्राप्त गर्नुहोस्**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ सफलता जाँच**: सबै endpoints ले त्रुटि बिना JSON डाटा फर्काउँछन्।

---

**🎉 बधाई छ!** तपाईंले AZD प्रयोग गरी Azure मा डेटाबेस सहितको वेब एप सफलतापूर्वक तैनाथ गर्नुभयो।

## कन्फिगरेसन गहिराई-विश्लेषण

### वातावरण भेरिएबलहरू

सिक्युरिटीका लागि सिक्रेटहरू Azure App Service कन्फिगरेसन मार्फत सुरक्षित रूपमा व्यवस्थापन गरिन्छ—**स्रोत कोडमा कहिल्यै हार्डकोड नगर्नुहोस्**।

**AZD द्वारा स्वचालित रूपमा कन्फिगर गरिएका**:
- `SQL_CONNECTION_STRING`: एनक्रिप्ट गरिएको क्रेडेन्सियल सहितको डेटाबेस कनेक्शन
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: मोनिटरिंग टेलिमेट्री अन्तबिन्दु
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: स्वत: निर्भरता स्थापना सक्षम गर्दछ

**सिक्रेटहरू कहाँ भण्डारण हुन्छन्**:
1. `azd provision` गर्दा, तपाईंले SQL क्रेडेन्सियलहरू सुरक्षित प्रम्प्टमार्फत प्रदान गर्नुहुन्छ
2. AZD ले यी तपाईंको स्थानीय `.azure/<env-name>/.env` फाइलमा (git-ignored) भण्डारण गर्छ
3. AZD ले तिनीहरूलाई Azure App Service कन्फिगरेसनमा इन्जेक्ट गर्छ (at-rest मा एनक्रिप्ट गरिएको)
4. अनुप्रयोगले runtime मा `os.getenv()` मार्फत तिनीहरू पढ्छ

### स्थानीय विकास

स्थानीय परीक्षणका लागि, नमूनाबाट `.env` फाइल सिर्जना गर्नुहोस्:

```sh
cp .env.sample .env
# आफ्नो स्थानीय डेटाबेस कनेक्शनसँग .env सम्पादन गर्नुहोस्
```

**स्थानीय विकास कार्यप्रवाह**:
```sh
# निर्भरता स्थापना गर्नुहोस्
cd src/web
pip install -r requirements.txt

# पर्यावरण चरहरू सेट गर्नुहोस्
export SQL_CONNECTION_STRING="your-local-connection-string"

# एप्लिकेशन चलाउनुहोस्
python app.py
```

**स्थानीय रूपमा परीक्षण गर्नुहोस्**:
```sh
curl http://localhost:8000/health
# अपेक्षित: {"स्थिति": "स्वस्थ", "डाटाबेस": "जोडिएको"}
```

### इन्फ्रास्ट्रक्चर ऐस कोड (IaC)

सबै Azure स्रोतहरू Bicep टेम्पलेटहरूमा (`infra/` फोल्डर) परिभाषित छन्:

- **मोडुलर डिजाइन**: प्रत्येक स्रोत प्रकारको आफ्नै फाइल पुन: प्रयोगयोग्य बनाउन
- **प्यारामिटराइज्ड**: SKUs, क्षेत्रहरू, नामकरण परम्परा अनुकूलन गर्न सकिन्छ
- **उत्तम अभ्यासहरू**: Azure नामकरण मापदण्ड र सुरक्षा पूर्वनिर्धारणहरू पछ्याउँछ
- **भर्शन नियन्त्रण**: इन्फ्रास्ट्रक्चर परिवर्तनहरू Git मा ट्र्याक गरिन्छ

**कस्टमाइजेसन उदाहरण**:
डेटाबेस टियर परिवर्तन गर्न `infra/resources/sql-database.bicep` सम्पादन गर्नुहोस्:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## सुरक्षा उत्तम अभ्यासहरू

यो उदाहरणले Azure सुरक्षा उत्तम अभ्यासहरू अनुसरण गर्दछ:

### 1. **स्रोत कोडमा कुनै सिक्रेट छैन**
- ✅ क्रेडेन्सियलहरू Azure App Service कन्फिगरेसनमा भण्डार गरिन्छ (एनक्रिप्ट गरिएको)
- ✅ `.env` फाइलहरू Git बाट `.gitignore` मार्फत बहिष्कृत गरिन्छ
- ✅ प्राविजनिङको क्रममा सुरक्षित प्यारामिटरहरू मार्फत सिक्रेटहरू पास गरिन्छ

### 2. **एनक्रिप्ट गरिएको कनेक्शनहरू**
- ✅ SQL Server को लागि TLS 1.2 न्यूनतम
- ✅ Web App मा केवल HTTPS लागू गरिएको
- ✅ डेटाबेस कनेक्शनहरूले एनक्रिप्टेड च्यानल प्रयोग गर्छन्

### 3. **नेटवर्क सुरक्षा**
- ✅ SQL Server फायरवाल Azure सेवाहरूलाई मात्र अनुमति दिने गरी कन्फिगर गरिएको
- ✅ सार्वजनिक नेटवर्क पहुँच सीमित गरिएको छ (Private Endpoints प्रयोग गरेर थप कडा बनाउन सकिन्छ)
- ✅ Web App मा FTPS अक्षम गरिएको

### 4. **प्रमाणीकरण र प्राधिकरण**
- ⚠️ **हालको**: SQL प्रमाणीकरण (username/password)
- ✅ **उत्पादन सिफारिस**: पासवर्ड-रहित प्रमाणीकरणका लागि Azure Managed Identity प्रयोग गर्नुहोस्

**Managed Identity मा अपग्रेड गर्ने तरिका** (उत्पादनका लागि):
1. Web App मा managed identity सक्षम गर्नुहोस्
2. identity लाई SQL अनुमति प्रदान गर्नुहोस्
3. कनेक्शन स्ट्रिङ अपडेट गरेर managed identity प्रयोग गर्नुहोस्
4. पासवर्ड-आधारित प्रमाणीकरण हटाउनुहोस्

### 5. **अडिटिङ र अनुपालन**
- ✅ Application Insights ले सबै अनुरोध र त्रुटिहरू लग गर्छ
- ✅ SQL Database auditing सक्षम गरिएको (अनुपालनका लागि कन्फिगर गर्न सकिन्छ)
- ✅ सबै स्रोतहरू शासनका लागि ट्याग गरिएको

**उत्पादन अघि सुरक्षा जाँच सूची**:
- [ ] Azure Defender for SQL सक्षम गर्नुहोस्
- [ ] SQL Database का लागि Private Endpoints कन्फिगर गर्नुहोस्
- [ ] Web Application Firewall (WAF) सक्षम गर्नुहोस्
- [ ] सिक्रेट रोटेसनका लागि Azure Key Vault लागू गर्नुहोस्
- [ ] Azure AD प्रमाणीकरण कन्फिगर गर्नुहोस्
- [ ] सबै स्रोतहरूको लागि diagnostic logging सक्षम गर्नुहोस्

## लागत अनुकूलन

**अनुमानित मासिक लागत** (जुन 2025 सम्मको अनुमान):

| Resource | SKU/Tier | Estimated Cost |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13/month |
| SQL Database | Basic (2GB) | ~$5/month |
| Application Insights | Pay-as-you-go | ~$2/month (low traffic) |
| **Total** | | **~$20/month** |

**💡 लागत बचत सुझावहरू**:

1. **सिकाइका लागि Free Tier प्रयोग गर्नुहोस्**:
   - App Service: F1 टियर (निःशुल्क, सीमित घण्टा)
   - SQL Database: Azure SQL Database serverless प्रयोग गर्नुहोस्
   - Application Insights: 5GB/महिना नि:शुल्क इनगेस्टर

2. **निष्क्रिय हुँदा स्रोतहरू रोक्नुहोस्**:
   ```sh
   # वेब एप रोक्नुहोस् (डेटाबेसले अझै पनि शुल्क लाग्छ)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # आवश्यक परे पुनः सुरु गर्नुहोस्
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **परीक्षणपछि सबै हटाउनुहोस्**:
   ```sh
   azd down
   ```
   यसले सबै स्रोतहरू हटाउँछ र शुल्क रोकिन्छ।

4. **विकास vs उत्पादन SKUs**:
   - **विकास**: Basic टियर (यस उदाहरणमा प्रयोग गरिएको)
   - **उत्पादन**: redundancy सहित Standard/Premium टियर

**लागत अनुगमन**:
- [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement) मा खर्च हेर्नुहोस्
- अनपेक्षित शुल्कबाट बच्न लागत अलर्ट सेट गर्नुहोस्
- ट्र्याकिङका लागि सबै स्रोतहरूलाई `azd-env-name` ट्याग गर्नुहोस्

**Free Tier वैकल्पिक**:
सिकाइका लागि, `infra/resources/app-service-plan.bicep` लाई परिवर्तन गर्न सक्नुहुन्छ:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**नोट**: Free टियरमा सीमा छन् (60 मिनेट/दिन CPU, कुनै always-on छैन)।

## अनुगमन र अवलोकन

### Application Insights एकीकरण

यस उदाहरणले समग्र अनुगमनका लागि **Application Insights** समावेश गर्दछ:

**के कुराहरू अनुगमन गरिन्छ**:
- ✅ HTTP अनुरोधहरू (लेटेन्सी, स्टाटस कोडहरू, endpoints)
- ✅ अनुप्रयोग त्रुटिहरू र अपवादहरू
- ✅ Flask एपबाट कस्टम लगिङ
- ✅ डेटाबेस कनेक्शन स्वास्थ्य
- ✅ प्रदर्शन मेट्रिक्स (CPU, मेमोरी)

**Application Insights पहुँच गर्ने तरिका**:
1. [Azure Portal](https://portal.azure.com) खोल्नुहोस्
2. आफ्नो resource group (`rg-<env-name>`) मा जानुहोस्
3. Application Insights स्रोत (`appi-<unique-id>`) मा क्लिक गर्नुहोस्

**उपयोगी क्वेरीहरू** (Application Insights → Logs):

**सबै अनुरोधहरू हेर्नुहोस्**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**त्रुटिहरू फेला पार्नुहोस्**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**हेल्थ Endpoint जाँच गर्नुहोस्**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### SQL Database अडिटिङ

**SQL Database अडिटिङ सक्षम छ** जुन ट्र्याक गर्छ:
- डेटाबेस पहुँच ढाँचाहरू
- असफल लगिन प्रयासहरू
- स्किमा परिवर्तनहरू
- डेटा पहुँच (अनुपालनका लागि)

**अडिट लगहरू पहुँच गर्ने तरिका**:
1. Azure Portal → SQL Database → Auditing
2. Log Analytics workspace मा लगहरू हेर्नुहोस्

### वास्तविक-समय अनुगमन

**लाइभ मेट्रिक्स हेर्नुहोस्**:
1. Application Insights → Live Metrics
2. अनुरोधहरू, असफलता, र प्रदर्शन वास्तविक-समयमा हेर्नुहोस्

**अलर्ट सेट अप गर्नुहोस्**:
महत्त्वपूर्ण घटनाहरूका लागि अलर्टहरू सिर्जना गर्नुहोस्:
- HTTP 500 त्रुटि > 5 प्रति 5 मिनेट
- डेटाबेस कनेक्शन विफलताहरू
- उच्च प्रतिक्रिया समयहरू (>2 सेकेन्ड)

**उदाहरण अलर्ट सिर्जना**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## समस्या निवारण

### सामान्य समस्याहरू र समाधानहरू

#### 1. `azd provision` ले "Location not available" सँग असफल हुन्छ

**लक्षण**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**समाधान**:
अर्को Azure क्षेत्र छान्नुहोस् वा संसाधन प्रदायक दर्ता गर्नुहोस्:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. परिनियोजनको क्रममा SQL कनेक्सन असफल हुन्छ

**लक्षण**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**समाधान**:
- SQL Server फायरवालले Azure सेवाहरूलाई अनुमति दिन्छ कि छैन जाँच्नुहोस् (स्वचालित रूपमा कन्फिगर गरिएको)
- `azd provision` चलाउँदा SQL admin पासवर्ड सही ढंगले प्रविष्ट गरिएको छ कि छैन जाँच्नुहोस्
- SQL Server पूर्ण रूपमा प्रोभिजन गरिएको छ कि छैन सुनिश्चित गर्नुहोस् (2-3 मिनेट लाग्न सक्छ)

**कनेक्सन जाँच्नुहोस्**:
```sh
# Azure पोर्टलबाट SQL Database → Query सम्पादकमा जानुहोस्
# आफ्ना प्रमाण-पत्र प्रयोग गरेर जडान गर्न प्रयास गर्नुहोस्
```

#### 3. Web App ले "Application Error" देखाउँछ

**लक्षण**:
ब्राउजरले सामान्य त्रुटि पृष्ठ देखाउँछ।

**समाधान**:
एप्लिकेशन लगहरू जाँच्नुहोस्:
```sh
# हालका लगहरू हेर्नुहोस्
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**सामान्य कारणहरू**:
- वातावरणीय भेरिएबलहरू हराइरहेका छन् (App Service → Configuration जाँच्नुहोस्)
- Python प्याकेज इन्स्टलेशन असफल भयो (deployment logs जाँच्नुहोस्)
- डाटाबेस प्रारम्भिकरण त्रुटि (SQL कनेक्टिविटी जाँच्नुहोस्)

#### 4. `azd deploy` ले "Build Error" सँग असफल हुन्छ

**लक्षण**:
```
Error: Failed to build project
```

**समाधान**:
- `requirements.txt` मा कुनै सिन्ट्याक्स त्रुटि छैन भनेर सुनिश्चित गर्नुहोस्
- `infra/resources/web-app.bicep` मा Python 3.11 निर्दिष्ट गरिएको छ कि छैन जाँच्नुहोस्
- Dockerfile मा सही base image छ कि छैन पुष्टि गर्नुहोस्

**स्थानीय रूपमा डिबग गर्नुहोस्**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. AZD कमाण्डहरू चलाउँदा "Unauthorized"

**लक्षण**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**समाधान**:
Azure सँग पुन: प्रमाणीकरण गर्नुहोस्:
```sh
azd auth login
az login
```

सब्स्क्रिप्शनमा तपाईंसँग सही अनुमति (Contributor भूमिका) छ कि छैन जाँच्नुहोस्।

#### 6. उच्च डाटाबेस लागत

**लक्षण**:
अनअपेक्षित Azure बिल।

**समाधान**:
- परीक्षण पछि `azd down` चलाउन बिर्सिनुभयो कि छैन जाँच्नुहोस्
- SQL Database Basic tier प्रयोग गरिरहेको छ कि छैन पुष्टि गर्नुहोस् (Premium होइन)
- Azure Cost Management मा लागतहरू समीक्षा गर्नुहोस्
- लागत अलर्ट सेट अप गर्नुहोस्

### मदत पाउनुहोस्

**सबै AZD वातावरणीय भेरिएबलहरू हेर्नुहोस्**:
```sh
azd env get-values
```

**परिनियोजन स्थिति जाँच्नुहोस्**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**एप्लिकेशन लगहरू हेर्नुहोस्**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**थप मदत चाहिन्छ?**
- [AZD समस्या निवारण मार्गदर्शन](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Azure App Service समस्या निवारण](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL समस्या निवारण](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## व्यवहारिक अभ्यासहरू

### अभ्यास 1: आफ्नो परिनियोजन जाँच्नुहोस् (शुरुआती)

**उद्देश्य**: सबै स्रोतहरू परिनियोजित छन् र एप्लिकेशन काम गर्दैछ भनी पुष्टि गर्नुहोस्।

**कदमहरू**:
1. आफ्नो रिसोर्स समूहमा सबै स्रोतहरू सूची गर्नुहोस्:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **अपेक्षित**: 6-7 resources (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. सबै API endpoints परीक्षण गर्नुहोस्:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **अपेक्षित**: सबैले त्रुटि बिना मान्य JSON फिर्ता गर्छन्

3. Application Insights जाँच्नुहोस्:
   - Azure Portal मा Application Insights तिर जानुहोस्
   - "Live Metrics" मा जानुहोस्
   - वेब एप मा आफ्नो ब्राउजर रिफ्रेश गर्नुहोस्
   **अपेक्षित**: रियल-टाइममा अनुरोधहरू देखिन्छन्

**सफलता मापदण्ड**: सबै 6-7 स्रोतहरू अवस्थित छन्, सबै endpoints ले डाटा फर्काउँछन्, Live Metrics मा गतिविधि देखिन्छ।

---

### अभ्यास 2: नयाँ API Endpoint थप्नुहोस् (मध्यम)

**उद्देश्य**: Flask एप्लिकेशनमा नयाँ endpoint थप्नुहोस्।

**सुरुवाती कोड**: हालका endpoints `src/web/app.py` मा

**कदमहरू**:
1. `src/web/app.py` सम्पादन गर्नुहोस् र `get_product()` फङ्क्सनपछि नयाँ endpoint थप्नुहोस्:
   ```python
   @app.route('/products/search/<keyword>')
   def search_products(keyword):
       """Search products by name or description."""
       try:
           conn = get_db_connection()
           cursor = conn.cursor()
           cursor.execute(
               "SELECT id, name, description, price, created_at FROM products WHERE name LIKE ? OR description LIKE ?",
               (f'%{keyword}%', f'%{keyword}%')
           )
           
           products = []
           for row in cursor.fetchall():
               products.append({
                   'id': row[0],
                   'name': row[1],
                   'description': row[2],
                   'price': float(row[3]) if row[3] else None,
                   'created_at': row[4].isoformat() if row[4] else None
               })
           
           cursor.close()
           conn.close()
           
           logger.info(f"Search for '{keyword}' returned {len(products)} results")
           return jsonify(products), 200
           
       except Exception as e:
           logger.error(f"Error searching products: {str(e)}")
           return jsonify({'error': str(e)}), 500
   ```

2. अपडेट गरिएको एप्लिकेशन परिनियोजन गर्नुहोस्:
   ```sh
   azd deploy
   ```

3. नयाँ endpoint परीक्षण गर्नुहोस्:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **अपेक्षित**: "laptop" सँग मेल खाने उत्पादनहरू फिर्ता गर्छ

**सफलता मापदण्ड**: नयाँ endpoint काम गर्दछ, फिल्टर गरिएका नतिजाहरू फर्काउँछ, Application Insights लगहरूमा देखिन्छ।

---

### अभ्यास 3: मोनिटरिङ र अलर्टहरू थप्नुहोस् (उन्नत)

**उद्देश्य**: अलर्टहरूसहित सक्रिय मोनिटरिङ सेट अप गर्नुहोस्।

**कदमहरू**:
1. HTTP 500 त्रुटिहरूका लागि अलर्ट सिर्जना गर्नुहोस्:
   ```sh
   # Application Insights स्रोतको ID प्राप्त गर्नुहोस्
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # अलर्ट सिर्जना गर्नुहोस्
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. त्रुटिहरू उत्पन्न गरेर अलर्ट ट्रिगर गर्नुहोस्:
   ```sh
   # अस्तित्वमा नभएको उत्पादनको अनुरोध गर्नुहोस्
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. अलर्ट ट्रिगर भयो कि छैन जाँच्नुहोस्:
   - Azure Portal → Alerts → Alert Rules
   - आफ्नो इमेल जाँच्नुहोस् (यदि कन्फिगर गरिएको छ)

**सफलता मापदण्ड**: अलर्ट नियम सिर्जित गरिएको छ, त्रुटिमा ट्रिगर हुन्छ, सूचनाहरू प्राप्त हुन्छन्।

---

### अभ्यास 4: डाटाबेस स्कीमा परिवर्तनहरू (उन्नत)

**उद्देश्य**: नयाँ तालिका थप्नुहोस् र एप्लिकेशनलाई त्यसलाई प्रयोग गर्न परिवर्तन गर्नुहोस्।

**कदमहरू**:
1. Azure Portal Query Editor मार्फत SQL Database सँग जडान गर्नुहोस्

2. नयाँ `categories` तालिका सिर्जना गर्नुहोस्:
   ```sql
   CREATE TABLE categories (
       id INT PRIMARY KEY IDENTITY(1,1),
       name NVARCHAR(50) NOT NULL,
       description NVARCHAR(200)
   );
   
   INSERT INTO categories (name, description) VALUES
   ('Electronics', 'Electronic devices and accessories'),
   ('Office Supplies', 'Office equipment and supplies');
   
   -- Add category to products table
   ALTER TABLE products ADD category_id INT;
   UPDATE products SET category_id = 1; -- Set all to Electronics
   ```

3. प्रतिक्रियाहरूमा category जानकारी समावेश गर्न `src/web/app.py` अपडेट गर्नुहोस्

4. परिनियोजन र परीक्षण गर्नुहोस्

**सफलता मापदण्ड**: नयाँ तालिका अवस्थित छ, उत्पादनहरूमा category जानकारी देखिन्छ, एप्लिकेशन अझै काम गर्छ।

---

### अभ्यास 5: क्याचिंग लागू गर्नुहोस् (विशेषज्ञ)

**उद्देश्य**: प्रदर्शन सुधारका लागि Azure Redis Cache थप्नुहोस्।

**कदमहरू**:
1. `infra/main.bicep` मा Redis Cache थप्नुहोस्
2. उत्पादन क्वेरीहरू क्याच गर्न `src/web/app.py` अपडेट गर्नुहोस्
3. Application Insights प्रयोग गरी प्रदर्शन सुधार मापन गर्नुहोस्
4. क्याचिंग अघि/पछि प्रतिक्रिया समय तुलना गर्नुहोस्

**सफलता मापदण्ड**: Redis परिनियोजित छ, क्याचिंग काम गर्छ, प्रतिक्रिया समयहरू >50% ले सुधार हुन्छ।

**सुझाव**: सुरु गर्नुहोस् [Azure Cache for Redis कागजात](https://learn.microsoft.com/azure/azure-cache-for-redis/)।

---

## क्लीनअप

निरन्तर शुल्कहरूबाट बच्न, काम सकिएपछि सबै स्रोतहरू हटाउनुहोस्:

```sh
azd down
```

**पुष्टिकरण संकेत**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

पुष्टि गर्न `y` टाइप गर्नुहोस्।

**✓ सफलता जाँच**: 
- Azure Portal बाट सबै स्रोतहरू मेटिएका छन्
- कुनै जारी शुल्क छैन
- स्थानीय `.azure/<env-name>` फोल्डर मेटाउन सकिन्छ

**वैकल्पिक** (इनफ्रास्ट्रक्चर राख्नुहोस्, डाटा मेटाउनुहोस्):
```sh
# रिसोर्स समूह मात्र मेटाउनुहोस् (AZD कन्फिग राख्नुहोस्)
az group delete --name rg-<env-name> --yes
```
## थप जान्नुहोस्

### सम्बन्धित कागजात
- [Azure Developer CLI दस्तावेज](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database कागजात](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service कागजात](https://learn.microsoft.com/azure/app-service/)
- [Application Insights कागजात](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep भाषा सन्दर्भ](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### यस कोर्सका आगामी चरणहरू
- **[Container Apps Example](../../../../examples/container-app)**: Azure Container Apps सँग माइक्रोसर्भिसहरू परिनियोजन गर्नुहोस्
- **[AI Integration Guide](../../../../docs/ai-foundry)**: आफ्नो एपमा AI क्षमताहरू थप्नुहोस्
- **[Deployment Best Practices](../../docs/chapter-04-infrastructure/deployment-guide.md)**: उत्पादन परिनियोजन ढाँचाहरू

### उन्नत विषयहरू
- **Managed Identity**: पासवर्ड हटाउनुहोस् र Azure AD प्रमाणीकरण प्रयोग गर्नुहोस्
- **Private Endpoints**: भर्चुअल नेटवर्क भित्र डेटाबेस कनेक्शनहरू सुरक्षित गर्नुहोस्
- **CI/CD Integration**: GitHub Actions वा Azure DevOps सँग परिनियोजनहरू स्वचालित गर्नुहोस्
- **Multi-Environment**: dev, staging, र production वातावरणहरू सेट अप गर्नुहोस्
- **Database Migrations**: स्कीमा भर्सनिङका लागि Alembic वा Entity Framework प्रयोग गर्नुहोस्

### अन्य विधिहरूसँग तुलना

**AZD vs. ARM Templates**:
- ✅ AZD: उच्च-स्तरीय अमूर्तन, सरल कमाण्डहरू
- ⚠️ ARM: बढी विस्तृत, सूक्ष्म नियन्त्रण

**AZD vs. Terraform**:
- ✅ AZD: Azure-स्थानीय, Azure सेवासँग एकीकृत
- ⚠️ Terraform: बहु-क्लाउड समर्थन, ठूलो इकोसिस्टम

**AZD vs. Azure Portal**:
- ✅ AZD: दोहोर्याउन मिल्ने, भर्सन-नियन्त्रित, स्वचालित गर्न मिल्ने
- ⚠️ Portal: म्यानुअल क्लिकहरू, पुनरुत्पादन गर्न गाह्रो

**AZD लाई सोच्नुहोस्**: Azure का लागि Docker Compose—जटिल परिनियोजनहरूको लागि सरल गरिएको कन्फिगुरेसन।

---

## अक्सर सोधिने प्रश्नहरू

**प्रश्न: के म अलग प्रोग्रामिङ भाषा प्रयोग गर्न सक्छु?**  
उ: हो! `src/web/` लाई Node.js, C#, Go, वा कुनै पनि भाषाले प्रतिस्थापित गर्नुहोस्। `azure.yaml` र Bicep अनुसार अपडेट गर्नुहोस्।

**प्रश्न: म थप डेटाबेसहरू कसरी थपूँ?**  
उ: `infra/main.bicep` मा अर्को SQL Database मोड्युल थप्नुहोस् वा Azure Database सेवाबाट PostgreSQL/MySQL प्रयोग गर्नुहोस्।

**प्रश्न: के म यसलाई उत्पादनका लागि प्रयोग गर्न सक्छु?**  
उ: यो एक सुरुवातिक बिन्दु हो। उत्पादनका लागि: managed identity, private endpoints, redundancy, ब्याकअप रणनीति, WAF, र विस्तारित मोनिटरिङ थप्नुहोस्।

**प्रश्न: यदि म कोड परिनियोजनको सट्टामा कन्टेनरहरू प्रयोग गर्न चाहान्छु भने के गर्ने?**  
उ: [Container Apps Example](../../../../examples/container-app) हेर्नुहोस् जसले सबै ठाउँमा Docker कन्टेनरहरू प्रयोग गर्दछ।

**प्रश्न: मेरो स्थानीय मेसिनबाट डाटाबेस कसरी जडान गर्ने?**  
उ: आफ्नो IP लाई SQL Server फायरवालमा थप्नुहोस्:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**प्रश्न: नयाँ बनाएरको सट्टा म पहिलेबाट रहेको डेटाबेस प्रयोग गर्न सक्छु?**  
उ: हो, `infra/main.bicep` लाई परिवर्तन गरेर अवस्थित SQL Server लाई रेफरेन्स गर्नुहोस् र connection string का प्यारामिटरहरू अपडेट गर्नुहोस्।

---

> **नोट:** यो उदाहरण AZD प्रयोग गरेर डाटाबेस सहित वेब एप परिनियोजन गर्ने उत्तम अभ्यासहरू देखाउँछ। यसले काम गर्ने कोड, व्यापक दस्तावेजीकरण, र सिकाइ सुदृढ पार्ने व्यवहारिक अभ्यासहरू समावेश गर्छ। उत्पादन परिनियोजनका लागि, तपाईंको संस्थाका लागि विशिष्ट सुरक्षा, स्केलिङ, अनुपालन, र लागत आवश्यकताहरू समीक्षा गर्नुहोस्।

**📚 कोर्स नेभिगेसन:**
- ← अघिल्लो: [Container Apps Example](../../../../examples/container-app)
- → अर्को: [AI Integration Guide](../../../../docs/ai-foundry)
- 🏠 [कोर्स होम](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज AI अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) प्रयोग गरी अनुवाद गरिएको हो। हामी शुद्धता सुनिश्चित गर्न प्रयासरत भए तापनि, कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुन सक्छ। मूल भाषामा रहेको दस्तावेजलाई अधिकारिक स्रोतको रूपमा मान्नुपर्छ। महत्त्वपूर्ण जानकारीको लागि पेशेवर मानवीय अनुवाद सिफारिस गरिन्छ। यो अनुवाद प्रयोग गर्दा उत्पन्न हुने कुनै पनि गलत बुझाइ वा गलत व्याख्याको लागि हामी जिम्मेवार छैनौँ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->