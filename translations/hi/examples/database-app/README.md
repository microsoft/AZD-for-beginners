# AZD के साथ Microsoft SQL डेटाबेस और वेब ऐप को तैनात करना

⏱️ **अनुमानित समय**: 20-30 मिनट | 💰 **अनुमानित लागत**: ~$15-25/महीना | ⭐ **जटिलता**: मध्यम

यह **पूर्ण, कार्यरत उदाहरण** दिखाता है कि कैसे [Azure डेवलपर CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) का उपयोग करके एक Python Flask वेब एप्लिकेशन को Microsoft SQL Database के साथ Azure पर तैनात किया जाए। सभी कोड शामिल और परखा गया है—कोई बाहरी निर्भरता आवश्यक नहीं है।

## आप क्या सीखेंगे

इस उदाहरण को पूरा करके, आप:
- इन्फ्रास्ट्रक्चर-एज़-कोड का उपयोग करके मल्टी-टियर एप्लिकेशन (वेब ऐप + डेटाबेस) तैनात करना सीखेंगे
- हार्डकोड किए बिना सुरक्षित डेटाबेस कनेक्शन कॉन्फ़िगर करना सीखेंगे
- Application Insights के साथ एप्लिकेशन स्वास्थ्य की निगरानी करना सीखेंगे
- AZD CLI के साथ Azure संसाधनों का कुशल प्रबंधन करना सीखेंगे
- सुरक्षा, लागत अनुकूलन, और ऑब्ज़र्वेबिलिटी के लिए Azure सर्वोत्तम प्रथाओं का पालन करना सीखेंगे

## परिदृश्य का अवलोकन
- **वेब ऐप**: डेटाबेस कनेक्टिविटी के साथ Python Flask REST API
- **डेटाबेस**: नमूना डेटा के साथ Azure SQL Database
- **इन्फ्रास्ट्रक्चर**: Bicep का उपयोग करके प्रोविजन (मॉड्यूलर, पुन: प्रयोज्य टेम्पलेट)
- **तैनाती**: `azd` कमांड्स के साथ पूरी तरह स्वचालित
- **निगरानी**: लॉग और टेलीमेट्री के लिए Application Insights

## पूर्वापेक्षाएँ

### आवश्यक उपकरण

शुरू करने से पहले, सुनिश्चित करें कि आपके पास ये उपकरण इंस्टॉल हैं:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (संस्करण 2.50.0 या उच्चतर)
   ```sh
   az --version
   # अपेक्षित आउटपुट: azure-cli 2.50.0 या उससे ऊपर
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (संस्करण 1.0.0 या उच्चतर)
   ```sh
   azd version
   # अपेक्षित आउटपुट: azd संस्करण 1.0.0 या उच्चतर
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (लोकल डेवलपमेंट के लिए)
   ```sh
   python --version
   # अपेक्षित आउटपुट: Python 3.8 या उससे ऊपर
   ```

4. **[Docker](https://www.docker.com/get-started)** (वैकल्पिक, स्थानीय कंटेनरीकृत विकास के लिए)
   ```sh
   docker --version
   # अपेक्षित आउटपुट: Docker संस्करण 20.10 या उससे ऊपर
   ```

### Azure आवश्यकताएँ

- एक सक्रिय **Azure सदस्यता** ([मुफ़्त खाता बनाएँ](https://azure.microsoft.com/free/))
- आपकी सदस्यता में संसाधन बनाने की अनुमति
- सदस्यता या रिसोर्स ग्रुप पर **Owner** या **Contributor** भूमिका

### ज्ञान पूर्वापेक्षाएँ

यह एक **मध्यम-स्तर** उदाहरण है। आपके पास होना चाहिए:
- बुनियादी कमांड-लाइन संचालन का ज्ञान
- क्लाउड के मूलभूत सिद्धांतों की समझ (संसाधन, रिसोर्स ग्रुप)
- वेब एप्लीकेशन्स और डेटाबेस की बुनियादी समझ

**AZD में नए हैं?** पहले [शुरू करने की मार्गदर्शिका](../../docs/chapter-01-foundation/azd-basics.md) से शुरू करें।

## आर्किटेक्चर

यह उदाहरण वेब एप्लिकेशन और SQL डेटाबेस के साथ एक दो-टियर आर्किटेक्चर तैनात करता है:

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

**संसाधन तैनाती:**
- **Resource Group**: सभी संसाधनों के लिए कंटेनर
- **App Service Plan**: Linux-आधारित होस्टिंग (लागत प्रभावशीलता के लिए B1 टियर)
- **Web App**: Flask एप्लिकेशन के साथ Python 3.11 रनटाइम
- **SQL Server**: TLS 1.2 न्यूनतम के साथ प्रबंधित डेटाबेस सर्वर
- **SQL Database**: बेसिक टियर (2GB, विकास/परीक्षण के लिए उपयुक्त)
- **Application Insights**: निगरानी और लॉगिंग
- **Log Analytics Workspace**: केंद्रीकृत लॉग स्टोरेज

**उपमा**: इसे एक रेस्तरां की तरह सोचें (वेब ऐप) जिसमें एक वॉक-इन फ्रीज़र (डेटाबेस) है। ग्राहक मेनू (API एंडपॉइंट्स) से ऑर्डर करते हैं, और किचन (Flask ऐप) फ्रीज़र से सामग्री (डेटा) निकालता है। रेस्तरां का प्रबंधक (Application Insights) हर गतिविधि को ट्रैक करता है।

## फ़ोल्डर संरचना

इस उदाहरण में सभी फाइलें शामिल हैं—कोई बाहरी निर्भरता आवश्यक नहीं है:

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

**प्रत्येक फ़ाइल क्या करती है:**
- **azure.yaml**: AZD को बताता है कि क्या तैनात करना है और कहाँ
- **infra/main.bicep**: सभी Azure संसाधनों का समन्वय करता है
- **infra/resources/*.bicep**: व्यक्तिगत संसाधन परिभाषाएँ (रीयूज़ के लिए मॉड्यूलर)
- **src/web/app.py**: डेटाबेस लॉजिक के साथ Flask एप्लिकेशन
- **requirements.txt**: Python पैकेज निर्भरताएँ
- **Dockerfile**: तैनाती के लिए कंटेनरीकरण निर्देश

## त्वरित-आरंभ (कदम-दर-कदम)

### चरण 1: क्लोन और नेविगेट करें

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ सफलता जांच**: सत्यापित करें कि आप `azure.yaml` और `infra/` फ़ोल्डर देख पा रहे हैं:
```sh
ls
# अपेक्षित: README.md, azure.yaml, infra/, src/
```

### चरण 2: Azure के साथ प्रमाणिकरण (Authenticate)

```sh
azd auth login
```

यह आपका ब्राउज़र Azure प्रमाणिकरण के लिए खोलता है। अपने Azure क्रेडेंशियल्स से साइन इन करें।

**✓ सफलता जांच**: आपको यह दिखाई देना चाहिए:
```
Logged in to Azure.
```

### चरण 3: एनवायरनमेंट आरंभ करें

```sh
azd init
```

**क्या होता है**: AZD आपके तैनाती के लिए एक स्थानीय कॉन्फ़िगरेशन बनाता है।

**प्रांप्ट जो आप देखेंगे**:
- **Environment name**: एक छोटा नाम दर्ज करें (उदा., `dev`, `myapp`)
- **Azure subscription**: सूची में से अपनी सदस्यता चुनें
- **Azure location**: एक क्षेत्र चुनें (उदा., `eastus`, `westeurope`)

**✓ सफलता जांच**: आपको यह दिखाई देना चाहिए:
```
SUCCESS: New project initialized!
```

### चरण 4: Azure संसाधनों को प्रोविजन करें

```sh
azd provision
```

**क्या होता है**: AZD सभी इन्फ्रास्ट्रक्चर को तैनात करता है (5-8 मिनट लेते हैं):
1. रिसोर्स ग्रुप बनाता है
2. SQL Server और Database बनाता है
3. App Service Plan बनाता है
4. Web App बनाता है
5. Application Insights बनाता है
6. नेटवर्किंग और सुरक्षा कॉन्फ़िगर करता है

**आपसे पूछा जाएगा**:
- **SQL admin username**: एक उपयोगकर्ता नाम दर्ज करें (उदा., `sqladmin`)
- **SQL admin password**: एक मजबूत पासवर्ड दर्ज करें (इसे सुरक्षित रखें!)

**✓ सफलता जांच**: आपको यह दिखाई देना चाहिए:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ समय**: 5-8 मिनट

### चरण 5: एप्लिकेशन तैनात करें

```sh
azd deploy
```

**क्या होता है**: AZD आपका Flask एप्लिकेशन बिल्ड और डिप्लॉय करता है:
1. Python एप्लिकेशन को पैकेज करता है
2. Docker कंटेनर बनाता है
3. Azure Web App पर पुश करता है
4. नमूना डेटा के साथ डेटाबेस इनिशियलाइज़ करता है
5. एप्लिकेशन शुरू करता है

**✓ सफलता जांच**: आपको यह दिखाई देना चाहिए:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ समय**: 3-5 मिनट

### चरण 6: एप्लिकेशन ब्राउज़ करें

```sh
azd browse
```

यह आपके तैनात किए गए वेब ऐप को ब्राउज़र में खोलता है: `https://app-<unique-id>.azurewebsites.net`

**✓ सफलता जांच**: आपको JSON आउटपुट दिखाई देना चाहिए:
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

### चरण 7: API एंडपॉइंट्स का परीक्षण करें

**Health Check** (डेटाबेस कनेक्शन सत्यापित करें):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**अपेक्षित प्रतिक्रिया**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**List Products** (नमूना डेटा):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**अपेक्षित प्रतिक्रिया**:
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

**Get Single Product**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ सफलता जांच**: सभी एंडपॉइंट्स त्रुटि-रहित JSON डेटा लौटाते हैं।

---

**🎉 बधाई हो!** आपने AZD का उपयोग करके Azure पर डेटाबेस के साथ एक वेब एप्लिकेशन सफलतापूर्वक तैनात कर लिया है।

## कॉन्फ़िगरेशन गहराई से

### एनवायरनमेंट वेरिएबल्स

सीक्रेट्स को Azure App Service कॉन्फ़िगरेशन के माध्यम से सुरक्षित रूप से प्रबंधित किया जाता है—**स्रोत कोड में कभी हार्डकोड न करें**।

**AZD द्वारा स्वतः कॉन्फ़िगर किए गए**:
- `SQL_CONNECTION_STRING`: एन्क्रिप्टेड क्रेडेंशियल्स के साथ डेटाबेस कनेक्शन
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: मॉनिटरिंग टेलीमेट्री एंडपॉइंट
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: स्वचालित निर्भरता इंस्टॉलेशन सक्षम करता है

**जहाँ सीक्रेट्स स्टोर होते हैं**:
1. `azd provision` के दौरान, आप सुरक्षित प्रांप्ट के माध्यम से SQL क्रेडेंशियल्स प्रदान करते हैं
2. AZD इन्हें आपके स्थानीय `.azure/<env-name>/.env` फ़ाइल में संग्रहित करता है (git-ignored)
3. AZD उन्हें Azure App Service कॉन्फ़िगरेशन में इंजेक्ट करता है (at rest एन्क्रिप्टेड)
4. एप्लिकेशन रUNTIME पर इन्हें `os.getenv()` के माध्यम से पढ़ता है

### स्थानीय विकास

स्थानीय परीक्षण के लिए, नमूना से एक `.env` फ़ाइल बनाएं:

```sh
cp .env.sample .env
# अपने स्थानीय डेटाबेस कनेक्शन के साथ .env को संपादित करें
```

**स्थानीय विकास वर्कफ़्लो**:
```sh
# निर्भरताएँ स्थापित करें
cd src/web
pip install -r requirements.txt

# पर्यावरण चर सेट करें
export SQL_CONNECTION_STRING="your-local-connection-string"

# एप्लिकेशन चलाएँ
python app.py
```

**स्थानीय रूप से परीक्षण करें**:
```sh
curl http://localhost:8000/health
# अपेक्षित: {"status": "healthy", "database": "connected"}
```

### इन्फ्रास्ट्रक्चर ऐज़ कोड

सभी Azure संसाधन **Bicep टेम्पलेट्स** (`infra/` फ़ोल्डर) में परिभाषित हैं:

- **मॉड्यूलर डिजाइन**: प्रत्येक संसाधन प्रकार के लिए अपना फ़ाइल है ताकि पुन: उपयोग संभव हो
- **पैरामीटराइज़्ड**: SKUs, क्षेत्र, नामकरण कन्वेंशन्स कस्टमाइज़ करें
- **सर्वोत्तम प्रथाएँ**: Azure नामकरण मानकों और सुरक्षा डिफ़ॉल्ट का पालन करता है
- **वर्ज़न कंट्रोल्ड**: इन्फ्रास्ट्रक्चर परिवर्तन Git में ट्रैक होते हैं

**कस्टमाइज़ेशन उदाहरण**:
डेटाबेस टियर बदलने के लिए `infra/resources/sql-database.bicep` संपादित करें:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## सुरक्षा सर्वोत्तम प्रथाएँ

यह उदाहरण Azure सुरक्षा सर्वोत्तम प्रथाओं का पालन करता है:

### 1. **स्रोत कोड में कोई सीक्रेट्स नहीं**
- ✅ क्रेडेंशियल्स Azure App Service कॉन्फ़िगरेशन में संग्रहित (एन्क्रिप्टेड)
- ✅ `.env` फ़ाइलें Git से `.gitignore` द्वारा बाहर रखी गईं
- ✅ प्रोविजनिंग के दौरान सुरक्षित पैरामीटर के माध्यम से सीक्रेट्स पास किए जाते हैं

### 2. **एन्क्रिप्टेड कनेक्शन्स**
- ✅ SQL Server के लिए TLS 1.2 न्यूनतम
- ✅ Web App के लिए केवल HTTPS लागू
- ✅ डेटाबेस कनेक्शन्स एन्क्रिप्टेड चैनलों का उपयोग करते हैं

### 3. **नेटवर्क सुरक्षा**
- ✅ SQL Server फ़ायरवॉल केवल Azure सेवाओं की अनुमति के लिए कॉन्फ़िगर
- ✅ सार्वजनिक नेटवर्क एक्सेस प्रतिबंधित (Private Endpoints के साथ और लॉकडाउन किया जा सकता है)
- ✅ Web App पर FTPS अक्षम

### 4. **प्रमाणीकरण और प्राधिकरण**
- ⚠️ **वर्तमान**: SQL प्रमाणीकरण (उपयोगकर्ता नाम/पासवर्ड)
- ✅ **प्रोडक्शन अनुशंसा**: पासवर्ड-रहित प्रमाणीकरण के लिए Azure Managed Identity का उपयोग करें

**Managed Identity पर अपग्रेड करने के लिए** (प्रोडक्शन के लिए):
1. Web App पर managed identity सक्षम करें
2. SQL अनुमति के लिए पहचान को ग्रांट करें
3. कनेक्शन स्ट्रिंग को managed identity का उपयोग करने के लिए अपडेट करें
4. पासवर्ड-आधारित प्रमाणीकरण हटाएं

### 5. **ऑडिटिंग और अनुपालन**
- ✅ Application Insights सभी अनुरोधों और त्रुटियों को लॉग करता है
- ✅ SQL Database ऑडिटिंग सक्षम है (अनुपालन के लिए कॉन्फ़िगर किया जा सकता है)
- ✅ सभी संसाधन गवर्नेंस के लिए टैग किए गए हैं

**प्रोडक्शन से पहले सुरक्षा चेकलिस्ट**:
- [ ] Azure Defender for SQL सक्षम करें
- [ ] SQL Database के लिए Private Endpoints कॉन्फ़िगर करें
- [ ] Web Application Firewall (WAF) सक्षम करें
- [ ] सीक्रेट रोटेशन के लिए Azure Key Vault लागू करें
- [ ] Azure AD प्रमाणीकरण कॉन्फ़िगर करें
- [ ] सभी संसाधनों के लिए डायग्नोस्टिक लॉगिंग सक्षम करें

## लागत अनुकूलन

**अनुमानित मासिक लागत** (नवंबर 2025 तक):

| Resource | SKU/Tier | Estimated Cost |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13/month |
| SQL Database | Basic (2GB) | ~$5/month |
| Application Insights | Pay-as-you-go | ~$2/month (low traffic) |
| **Total** | | **~$20/month** |

**💡 लागत-बचत सुझाव**:

1. **सीखने के लिए Free Tier का उपयोग करें**:
   - App Service: F1 टियर (मुफ्त, सीमित घंटे)
   - SQL Database: Azure SQL Database serverless का उपयोग करें
   - Application Insights: 5GB/महीना मुफ्त ingestion

2. **जब उपयोग में न हों तो संसाधनों को रोकें**:
   ```sh
   # वेब ऐप बंद करें (डेटाबेस पर शुल्क अभी भी लगेगा)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # आवश्यक होने पर पुनरारंभ करें
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **परीक्षण के बाद सब कुछ हटाएँ**:
   ```sh
   azd down
   ```
   यह सभी संसाधनों को हटाकर शुल्क रोक देता है।

4. **डेवलपमेंट बनाम प्रोडक्शन SKUs**:
   - **डेवलपमेंट**: बेसिक टियर (इस उदाहरण में उपयोग किया गया)
   - **प्रोडक्शन**: redundancy के साथ Standard/Premium टियर

**लागत निगरानी**:
- [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement) में लागत देखें
- आश्चर्य से बचने के लिए लागत अलर्ट सेट करें
- ट्रैकिंग के लिए सभी संसाधनों पर `azd-env-name` टैग लगाएँ

**Free Tier विकल्प**:
सीखने के उद्देश्यों के लिए, आप `infra/resources/app-service-plan.bicep` को संशोधित कर सकते हैं:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**नोट**: Free टियर की सीमाएँ हैं (60 मिन/दिन CPU, हमेशा-ऑन नहीं)।

## निगरानी और अवलोकनयोग्यता

### Application Insights एकीकरण

यह उदाहरण व्यापक निगरानी के लिए **Application Insights** शामिल करता है:

**क्या मॉनिटर किया जाता है**:
- ✅ HTTP अनुरोध (लेटेंसी, स्टेटस कोड, एंडपॉइंट्स)
- ✅ एप्लिकेशन त्रुटियाँ और अपवाद
- ✅ Flask ऐप से कस्टम लॉगिंग
- ✅ डेटाबेस कनेक्शन स्वास्थ्य
- ✅ प्रदर्शन मेट्रिक्स (CPU, मेमोरी)

**Application Insights तक पहुँच**:
1. [Azure Portal](https://portal.azure.com) खोलें
2. अपने रिसोर्स ग्रुप (`rg-<env-name>`) पर नेविगेट करें
3. Application Insights रिसोर्स (`appi-<unique-id>`) पर क्लिक करें

**उपयोगी क्वेरीज़** (Application Insights → Logs):

**सभी अनुरोध देखें**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**त्रुटियाँ खोजें**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Health Endpoint चेक करें**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### SQL Database ऑडिटिंग

**SQL Database ऑडिटिंग सक्षम है** ताकि ट्रैक किया जा सके:
- डेटाबेस एक्सेस पैटर्न
- असफल लॉगिन प्रयास
- स्कीमा परिवर्तन
- डेटा एक्सेस (अनुपालन के लिए)

**ऑडिट लॉग्स तक पहुँच**:
1. Azure Portal → SQL Database → Auditing
2. Log Analytics वर्कस्पेस में लॉग्स देखें

### रीयल-टाइम निगरानी

**लाइव मेट्रिक्स देखें**:
1. Application Insights → Live Metrics
2. रीयल-टाइम में अनुरोध, विफलताएँ, और प्रदर्शन देखें

**अलर्ट सेट करें**:
महत्वपूर्ण घटनाओं के लिए अलर्ट बनाएं:
- HTTP 500 त्रुटियाँ > 5 5 मिनट में
- डेटाबेस कनेक्शन विफलतियाँ
- उच्च प्रतिक्रिया समय (>2 seconds)

**अलर्ट बनाने का उदाहरण**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## समस्या निवारण

### सामान्य समस्याएँ और समाधान

#### 1. `azd provision` "Location not available" के साथ असफल होता है

**लक्षण**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**समाधान**:
एक अलग Azure क्षेत्र चुनें या रिसोर्स प्रोवाइडर को रजिस्टर करें:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. तैनाती के दौरान SQL कनेक्शन विफल होता है

**लक्षण**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**समाधान**:
- सुनिश्चित करें कि SQL Server फ़ायरवॉल Azure सेवाओं की अनुमति देता है (स्वचालित रूप से कॉन्फ़िगर किया गया)
- जाँचें कि SQL एडमिन पासवर्ड को `azd provision` के दौरान सही तरीके से दर्ज किया गया था
- सुनिश्चित करें कि SQL Server पूरी तरह से प्रोविजन हुआ है (2-3 मिनट लग सकते हैं)

**कनेक्शन सत्यापित करें**:
```sh
# Azure पोर्टल से, SQL डेटाबेस → क्वेरी एडिटर पर जाएँ
# अपने प्रमाण-पत्रों के साथ कनेक्ट करने का प्रयास करें
```

#### 3. Web App "Application Error" दिखाता है

**लक्षण**:
ब्राउज़र सामान्य त्रुटि पृष्ठ दिखाता है।

**समाधान**:
एप्लिकेशन लॉग्स जांचें:
```sh
# हाल के लॉग देखें
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**सामान्य कारण**:
- एनवायरनमेंट वेरिएबल ग़ायब (App Service → Configuration की जाँच करें)
- Python पैकेज इंस्टॉलेशन विफल हुआ (डिप्लॉयमेंट लॉग्स की जाँच करें)
- डेटाबेस इनिशियलाइज़ेशन त्रुटि (SQL कनेक्टिविटी की जाँच करें)

#### 4. `azd deploy` "Build Error" के साथ असफल होता है

**लक्षण**:
```
Error: Failed to build project
```

**समाधान**:
- सुनिश्चित करें कि `requirements.txt` में कोई सिंटैक्स त्रुटि नहीं है
- जाँचें कि `infra/resources/web-app.bicep` में Python 3.11 निर्दिष्ट है
- सत्यापित करें कि Dockerfile में सही बेस इमेज है

**लोकल रूप से डिबग करें**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. AZD कमांड चलाते समय "Unauthorized"

**लक्षण**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**समाधान**:
Azure के साथ पुनः प्रमाणीकरण करें:
```sh
azd auth login
az login
```

सुनिश्चित करें कि सब्सक्रिप्शन पर आपके पास सही अनुमतियाँ (Contributor रोल) हैं।

#### 6. डेटाबेस लागत अधिक होना

**लक्षण**:
अनपेक्षित Azure बिल।

**समाधान**:
- जाँचें कि क्या आपने टेस्टिंग के बाद `azd down` चलाना भूल गए थे
- सत्यापित करें कि SQL Database Basic टियर का उपयोग कर रहा है (Premium नहीं)
- Azure Cost Management में लागत की समीक्षा करें
- कॉस्ट अलर्ट सेट करें

### सहायता प्राप्त करें

**सभी AZD एनवायरनमेंट वेरिएबल देखें**:
```sh
azd env get-values
```

**डिप्लॉयमेंट स्थिति जांचें**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**एप्लिकेशन लॉग्स एक्सेस करें**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**क्या और मदद चाहिए?**
- [AZD समस्या निवारण गाइड](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Azure App Service समस्या निवारण](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL समस्या निवारण](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## व्यावहारिक अभ्यास

### अभ्यास 1: अपनी डिप्लॉयमेंट सत्यापित करें (शुरुआती)

**लक्ष्य**: पुष्टि करें कि सभी संसाधन डिप्लॉय किए गए हैं और एप्लिकेशन काम कर रहा है।

**कदम**:
1. अपने resource group में सभी संसाधन सूचीबद्ध करें:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **अपेक्षित**: 6-7 संसाधन (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. सभी API endpoints का परीक्षण करें:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **अपेक्षित**: सभी बिना त्रुटियों के वैध JSON लौटाएँ

3. Application Insights जांचें:
   - Azure पोर्टल में Application Insights पर जाएँ
   - "Live Metrics" पर जाएँ
   - वेब ऐप पर अपने ब्राउज़र को रिफ्रेश करें
   **अपेक्षित**: रीयल-टाइम में रिक्वेस्ट दिखाई दें

**सफलता मानदंड**: सभी 6-7 संसाधन मौजूद हैं, सभी endpoints डेटा लौटाते हैं, Live Metrics में गतिविधि दिखती है।

---

### अभ्यास 2: नया API Endpoint जोड़ें (मध्यम)

**लक्ष्य**: Flask एप्लिकेशन को एक नए endpoint के साथ विस्तारित करें।

**स्टार्टर कोड**: वर्तमान endpoints `src/web/app.py` में

**कदम**:
1. `src/web/app.py` संपादित करें और `get_product()` फ़ंक्शन के बाद एक नया endpoint जोड़ें:
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

2. अपडेट किया गया एप्लिकेशन डिप्लॉय करें:
   ```sh
   azd deploy
   ```

3. नए endpoint का परीक्षण करें:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **अपेक्षित**: "laptop" से मिलते-जुलते उत्पाद लौटाएँ

**सफलता मानदंड**: नया endpoint काम करता है, फ़िल्टर किए गए परिणाम लौटाता है, Application Insights लॉग्स में दिखता है।

---

### अभ्यास 3: मॉनिटरिंग और अलर्ट जोड़ें (उन्नत)

**लक्ष्य**: अलर्ट के साथ प्रोएक्टिव मॉनिटरिंग सेट अप करें।

**कदम**:
1. HTTP 500 त्रुटियों के लिए एक अलर्ट बनाएँ:
   ```sh
   # Application Insights संसाधन आईडी प्राप्त करें
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # अलर्ट बनाएं
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. त्रुटियाँ उत्पन्न करके अलर्ट ट्रिगर करें:
   ```sh
   # अस्तित्वहीन उत्पाद का अनुरोध
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. जाँचें कि अलर्ट फायर हुआ या नहीं:
   - Azure Portal → Alerts → Alert Rules
   - अपने ईमेल की जाँच करें (यदि कॉन्फ़िगर किया गया हो)

**सफलता मानदंड**: अलर्ट नियम बनाया गया है, त्रुटियों पर ट्रिगर होता है, सूचनाएँ प्राप्त होती हैं।

---

### अभ्यास 4: डेटाबेस स्कीमा परिवर्तन (उन्नत)

**लक्ष्य**: एक नया टेबल जोड़ें और एप्लिकेशन को इसे उपयोग करने के लिए संशोधित करें।

**कदम**:
1. Azure Portal Query Editor के माध्यम से SQL Database से कनेक्ट करें

2. एक नया `categories` टेबल बनाएं:
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

3. प्रतिक्रियाओं में श्रेणी जानकारी शामिल करने के लिए `src/web/app.py` अपडेट करें

4. डिप्लॉय और परीक्षण करें

**सफलता मानदंड**: नया टेबल मौजूद है, उत्पाद श्रेणी जानकारी दिखाते हैं, एप्लिकेशन अब भी काम करता है।

---

### अभ्यास 5: कैशिंग लागू करें (विशेषज्ञ)

**लक्ष्य**: प्रदर्शन सुधारने के लिए Azure Redis Cache जोड़ें।

**कदम**:
1. `infra/main.bicep` में Redis Cache जोड़ें
2. उत्पाद क्वेरीज को कैश करने के लिए `src/web/app.py` अपडेट करें
3. Application Insights के साथ प्रदर्शन सुधार मापें
4. कैशिंग से पहले/बाद प्रतिक्रिया समय की तुलना करें

**सफलता मानदंड**: Redis डिप्लॉय किया गया है, कैशिंग काम करती है, प्रतिक्रिया समय >50% सुधरता है।

**संकेत**: शुरुआत करें [Azure Cache for Redis प्रलेखन](https://learn.microsoft.com/azure/azure-cache-for-redis/)।

---

## क्लीनअप

लगातार शुल्क से बचने के लिए समाप्त होने पर सभी संसाधनों को हटा दें:

```sh
azd down
```

**पुष्टि संकेत**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

`y` टाइप करके पुष्टि करें।

**✓ सफलता जांच**: 
- Azure Portal से सभी संसाधन हटाए गए हैं
- कोई लगातार शुल्क नहीं हैं
- स्थानीय `.azure/<env-name>` फ़ोल्डर हटाया जा सकता है

**विकल्प** (इन्फ्रास्ट्रक्चर रखें, डेटा हटाएँ):
```sh
# केवल संसाधन समूह हटाएँ (AZD कॉन्फ़िग रखें)
az group delete --name rg-<env-name> --yes
```
## और जानें

### संबंधित दस्तावेज़
- [Azure Developer CLI प्रलेखन](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database प्रलेखन](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service प्रलेखन](https://learn.microsoft.com/azure/app-service/)
- [Application Insights प्रलेखन](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep भाषा संदर्भ](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### इस पाठ्यक्रम में अगले कदम
- **[Container Apps उदाहरण](../../../../examples/container-app)**: Azure Container Apps के साथ माइक्रोसर्विसेस डिप्लॉय करें
- **[AI एकीकरण गाइड](../../../../docs/ai-foundry)**: अपने ऐप में AI क्षमताएँ जोड़ें
- **[Deployment Best Practices](../../docs/chapter-04-infrastructure/deployment-guide.md)**: प्रोडक्शन डिप्लॉयमेंट पैटर्न

### उन्नत विषय
- **Managed Identity**: पासवर्ड हटाएँ और Azure AD प्रमाणीकरण का उपयोग करें
- **Private Endpoints**: वर्चुअल नेटवर्क के भीतर डेटाबेस कनेक्शन सुरक्षित करें
- **CI/CD एकीकरण**: GitHub Actions या Azure DevOps के साथ डिप्लॉयमेंट स्वचालित करें
- **मल्टी-एनवायरनमेंट**: dev, staging, और production एनवायरनमेंट सेट अप करें
- **Database Migrations**: स्कीमा वर्शनिंग के लिए Alembic या Entity Framework का उपयोग करें

### अन्य दृष्टिकोणों की तुलना

**AZD vs. ARM Templates**:
- ✅ AZD: उच्च-स्तरीय अमूर्तता, सरल कमांड
- ⚠️ ARM: अधिक विस्तृत, सूक्ष्म नियंत्रण

**AZD vs. Terraform**:
- ✅ AZD: Azure-नैटिव, Azure सेवाओं के साथ एकीकृत
- ⚠️ Terraform: मल्टी-क्लाउड समर्थन, बड़ा इकोसिस्टम

**AZD vs. Azure Portal**:
- ✅ AZD: पुनरावृत्त, संस्करण-नियंत्रित, स्वचालित किया जा सकता है
- ⚠️ Portal: मैन्युअल क्लिक, पुनरुत्पादन मुश्किल

AZD को सोचें जैसे: Azure के लिए Docker Compose—जटिल डिप्लॉयमेंट्स के लिए सरल कॉन्फ़िगरेशन।

---

## अक्सर पूछे जाने वाले प्रश्न

**प्रश्न: क्या मैं कोई अलग प्रोग्रामिंग भाषा उपयोग कर सकता हूँ?**  
उत्तर: हाँ! `src/web/` को Node.js, C#, Go, या किसी भी भाषा से बदलें। `azure.yaml` और Bicep को अनुरूप रूप से अपडेट करें।

**प्रश्न: मैं और डेटाबेस कैसे जोड़ूं?**  
उत्तर: `infra/main.bicep` में एक और SQL Database मॉड्यूल जोड़ें या Azure Database सेवाओं से PostgreSQL/MySQL का उपयोग करें।

**प्रश्न: क्या मैं इसे प्रोडक्शन के लिए उपयोग कर सकता/सकती हूँ?**  
उत्तर: यह एक प्रारम्भिक बिंदु है। प्रोडक्शन के लिए जोड़ें: managed identity, private endpoints, redundancy, बैकअप रणनीति, WAF, और उन्नत मॉनिटरिंग।

**प्रश्न: यदि मैं कोड डिप्लॉयमेंट के बजाय कंटेनर उपयोग करना चाहूँ तो?**  
उत्तर: देखें **[Container Apps उदाहरण](../../../../examples/container-app)** जो पूरे में Docker कंटेनरों का उपयोग करता है।

**प्रश्न: मैं अपने लोकल मशीन से डेटाबेस कैसे कनेक्ट करूँ?**  
उत्तर: अपना IP SQL Server फ़ायरवॉल में जोड़ें:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**प्रश्न: क्या मैं नया बनाने के बजाय मौजूदा डेटाबेस उपयोग कर सकता/सकती हूँ?**  
उत्तर: हाँ, `infra/main.bicep` को मौजूदा SQL Server को संदर्भित करने के लिए संशोधित करें और कनेक्शन स्ट्रिंग पैरामीटर अपडेट करें।

---

> **नोट:** यह उदाहरण AZD का उपयोग करके डेटाबेस के साथ एक वेब ऐप डिप्लॉय करने के सर्वोत्तम अभ्यास दर्शाता है। इसमें कार्यशील कोड, व्यापक दस्तावेज़ीकरण, और सीखने को सुदृढ़ करने के लिए व्यावहारिक अभ्यास शामिल हैं। प्रोडक्शन डिप्लॉयमेंट के लिए, आपकी संस्था के विशिष्ट सुरक्षा, स्केलिंग, अनुपालन, और लागत आवश्यकताओं की समीक्षा करें।

**📚 कोर्स नेविगेशन:**
- ← पिछला: [Container Apps उदाहरण](../../../../examples/container-app)
- → अगला: [AI एकीकरण गाइड](../../../../docs/ai-foundry)
- 🏠 [कोर्स होम](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यह दस्तावेज़ AI अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) का उपयोग करके अनूदित किया गया है। हम सटीकता के लिए प्रयास करते हैं, फिर भी कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या असंगतियाँ हो सकती हैं। मूल भाषा में उपलब्ध मूल दस्तावेज़ को प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम जिम्मेदार नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->