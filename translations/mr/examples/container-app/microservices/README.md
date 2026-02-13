# मायक्रोसर्व्हिसेस आर्किटेक्चर - कंटेनर अ‍ॅप उदाहरण

⏱️ **अनुमानित वेळ**: 25-35 मिनिटे | 💰 **अनुमानित खर्च**: ~$50-100/महिना | ⭐ **कठीणपणा**: प्रगत

AZD CLI वापरून Azure कंटेनर अ‍ॅप्सवर तैनात केलेले **सोपे पण कार्यक्षम** मायक्रोसर्व्हिसेस आर्किटेक्चर. हा उदाहरण सेवा ते सेवा संवाद, कंटेनर ऑर्केस्ट्रेशन आणि मॉनिटरिंगसह 2-सेवा सेटअप वापरून दाखवतो.

> **📚 शिकण्याचा दृष्टिकोन**: हे उदाहरण किमान 2-सेवा आर्किटेक्चर (API गेटवे + बॅकएंड सेवा) पासून सुरू होते जे आपण प्रत्यक्षात तैनात करून शिकू शकता. हा पाया आत्मसात केल्यानंतर, आम्ही संपूर्ण मायक्रोसर्व्हिसेस परिसंस्थेसाठी मार्गदर्शन देतो.

## आपण काय शिकाल

हे उदाहरण पूर्ण केल्यावर, आपण:
- अनेक कंटेनर Azure कंटेनर अ‍ॅप्सवर तैनात कराल
- अंतर्गत नेटवर्किंगसह सेवा ते सेवा संवाद कार्यान्वित कराल
- पर्यावरण-आधारित स्केलिंग आणि आरोग्य तपासणी कॉन्फिगर कराल
- Application Insights सह वितरित अनुप्रयोगांचे निरीक्षण कराल
- मायक्रोसर्व्हिसेस तैनात करण्याचे नमुने आणि सर्वोत्तम पद्धती समजून घ्याल
- सोप्या पासून क्लिष्ट आर्किटेक्चरसाठी प्रगतीशील विस्तार शिकाल

## आर्किटेक्चर

### टप्पा 1: आपण काय तयार करत आहोत (या उदाहरणात समाविष्ट)

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

**सोप्या पासून का सुरूवात करावी?**
- ✅ लवकर लागू करा आणि समजून घ्या (25-35 मिनिटे)
- ✅ क्लिष्टता न घेता मुख्य मायक्रोसर्व्हिसेस नमुने शिका
- ✅ कार्यरत कोड ज्यात आपण बदल आणि प्रयोग करू शकता
- ✅ शिकण्यासाठी कमी खर्च (~$50-100/महिना विरुद्ध $300-1400/महिना)
- ✅ डेटाबेस आणि संदेश रांगा जोडण्यापूर्वी आत्मविश्वास निर्माण करा

**उपमा**: हे ड्रायव्हिंग शिकण्यासारखे आहे. आपण रिकाम्या पार्किंग लॉटपासून (2 सेवा) सुरू करता, मूलभूत गोष्टी आत्मसात करता, नंतर शहरातील ट्राफिकच्या दिशेने प्रगती करता (5+ सेवा डेटाबेससह).

### टप्पा 2: भविष्यातील विस्तार (संदर्भ आर्किटेक्चर)

एकदा 2-सेवा आर्किटेक्चर आत्मसात केल्यावर, आपण पुढीलप्रमाणे विस्तार करू शकता:

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

टप्प्याटप्प्याने सूचना मिळवण्यासाठी अंतिम "Expansion Guide" विभाग पहा.

## समाविष्ट वैशिष्ट्ये

✅ **सेवा शोध**: कंटेनर दरम्यान स्वयंचलित DNS-आधारित शोध  
✅ **लोड बॅलन्सिंग**: रेप्लिका दरम्यान अंगभूत लोड बॅलन्सिंग  
✅ **स्वतः स्केलिंग**: HTTP विनंत्यांवर आधारित स्वतंत्र स्केलिंग  
✅ **आरोग्य निरीक्षण**: दोन्ही सेवांसाठी जीवनसत्त्व आणि तयारी तपासण्या  
✅ **वितरित लॉगिंग**: Application Insights सह केंद्रीकृत लॉगिंग  
✅ **आंतरंग नेटवर्किंग**: सुरक्षित सेवा-ते-सेवा संवाद  
✅ **कंटेनर ऑर्केस्ट्रेशन**: स्वयंचलित तैनाती आणि स्केलिंग  
✅ **झिरो-डाउनटाइम अपडेट्स**: पुनरावलोकन व्यवस्थापनासह रोलिंग अपडेट्स  

## आवश्यक गोष्टी

### आवश्यक साधने

सुरू करण्यापूर्वी, हे साधने स्थापित असल्याची खात्री करा:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (आवृत्ती 1.0.0 किंवा त्याहून अधिक)
   ```bash
   azd version
   # अपेक्षित आउटपुट: azd आवृत्ती 1.0.0 किंवा त्याहून अधिक
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (आवृत्ती 2.50.0 किंवा त्याहून अधिक)
   ```bash
   az --version
   # अपेक्षित परिणाम: azure-cli 2.50.0 किंवा त्यापेक्षा अधिक
   ```

3. **[Docker](https://www.docker.com/get-started)** (स्थानिक विकास/चाचणीसाठी - ऐच्छिक)
   ```bash
   docker --version
   # अपेक्षित आउटपुट: Docker आवृत्ती 20.10 किंवा त्याहून अधिक
   ```

### Azure आवश्यकता

- सक्रिय **Azure सदस्यता** ([मोफत खाते तयार करा](https://azure.microsoft.com/free/))
- आपल्या सदस्यतेत संसाधने तयार करण्याची परवानगी
- सदस्यता किंवा संसाधन समूहावर **Contributor** भूमिका

### ज्ञान आवश्यकताः

हे एक **प्रगत-स्तरीय** उदाहरण आहे. आपल्याला:
- [सोप्या Flask API उदाहरण](../../../../../examples/container-app/simple-flask-api) पूर्ण केलेले असावे
- मायक्रोसर्व्हिसेस आर्किटेक्चरचे मूलतत्त्व समजण्याची गरज
- REST API आणि HTTP ची ओळख असावी
- कंटेनर संकल्पनांची समज असावी

**Container Apps मध्ये नवीन आहात?** प्राथमिक गोष्टी शिकण्यासाठी प्रथम [सोप्या Flask API उदाहरण](../../../../../examples/container-app/simple-flask-api) वापरा.

## झटपट सुरूवात (टप्प्याटप्प्याने)

### टप्पा 1: क्लोन करा आणि नेव्हिगेट करा

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ यश तपासणी**: `azure.yaml` दिसते का ते तपासा:
```bash
ls
# अपेक्षित: README.md, azure.yaml, infra/, src/
```

### टप्पा 2: Azure सह प्रमाणीकरण करा

```bash
azd auth login
```

हे Azure प्रमाणीकरणासाठी ब्राउझर उघडते. आपल्या Azure क्रेडेन्शियल्ससह साइन इन करा.

**✓ यश तपासणी**: आपल्याला हे दिसेल:
```
Logged in to Azure.
```

### टप्पा 3: पर्यावरण प्रारंभ करा

```bash
azd init
```

**आपल्याला दिसणारे संवाद**:
- **पर्यावरण नाव**: एक लहान नाव द्या (उदा., `microservices-dev`)
- **Azure सदस्यता**: आपली सदस्यता निवडा
- **Azure स्थान**: प्रदेश निवडा (उदा. `eastus`, `westeurope`)

**✓ यश तपासणी**: आपल्याला हे दिसेल:
```
SUCCESS: New project initialized!
```

### टप्पा 4: इन्फ्रास्ट्रक्चर आणि सेवा तैनात करा

```bash
azd up
```

**काय होते** (8-12 मिनिटे लागतात):
1. कंटेनर अॅप्स पर्यावरण तयार करते
2. मॉनिटरिंगसाठी Application Insights तयार करते
3. API गेटवे कंटेनर तयार करते (Node.js)
4. प्रॉडक्ट सेवा कंटेनर तयार करते (Python)
5. दोन्ही कंटेनर Azure वर तैनात करते
6. नेटवर्किंग आणि आरोग्य तपासणी कॉन्फिगर करते
7. मॉनिटरिंग आणि लॉगिंग सेटअप करते

**✓ यश तपासणी**: आपल्याला हे दिसेल:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ वेळ**: 8-12 मिनिटे

### टप्पा 5: तैनात केलेली सेवा तपासा

```bash
# गेटवे एंडपॉइंट मिळवा
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# API गेटवे आरोग्य तपासा
curl $GATEWAY_URL/health

# अपेक्षित आउटपुट:
# {"स्थिती":"तंदुरुस्त","सेवा":"api-gateway","टाइमस्टँप":"2025-11-19T10:30:00Z"}
```

**गेटवेद्वारे प्रॉडक्ट सेवा चाचणी करा**:
```bash
# उत्पादने यादी करा
curl $GATEWAY_URL/api/products

# अपेक्षित आउटपुट:
# [
#   {"id":1,"name":"लॅपटॉप","price":999.99,"stock":50},
#   {"id":2,"name":"माऊस","price":29.99,"stock":200},
#   {"id":3,"name":"कीबोर्ड","price":79.99,"stock":150}
# ]
```

**✓ यश तपासणी**: दोन्ही एंडपॉइंट JSON डेटा त्रुटीशिवाय परत करतात.

---

**🎉 अभिनंदन!** आपण Azure वर मायक्रोसर्व्हिसेस आर्किटेक्चर तैनात केले आहे!

## प्रकल्प रचना

सर्व अंमलबजावणी फायली समाविष्ट आहेत - हे पूर्ण, कार्यरत उदाहरण आहे:

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

**प्रत्येक घटक काय करतो:**

**इन्फ्रास्ट्रक्चर (infra/)**:
- `main.bicep`: सर्व Azure संसाधने आणि त्यांच्या अवलंबनांचे समन्वय साधते
- `core/container-apps-environment.bicep`: कंटेनर अ‍ॅप्स पर्यावरण आणि Azure कंटेनर रजिस्ट्री तयार करते
- `core/monitor.bicep`: Application Insights सेटअप करते वितरित लॉगिंगसाठी
- `app/*.bicep`: स्वतंत्र कंटेनर अ‍ॅप परिभाषा स्केलिंग आणि आरोग्य तपासण्यांसह

**API गेटवे (src/api-gateway/)**:
- सार्वजनिक सेवा जी विनंत्या बॅकएंड सेवांकडे मार्गदर्शित करते
- लॉगिंग, त्रुटी हाताळणी, विनंती पुढे पाठवणे कार्यान्वित करते
- सेवा ते सेवा HTTP संवाद दाखवते

**प्रॉडक्ट सेवा (src/product-service/)**:
- अंतर्गत सेवा ज्यात प्रॉडक्ट कॅटलॉग (सोपेपणासाठी इन-मेमरी)
- REST API आरोग्य तपासण्यांसह
- बॅकएंड मायक्रोसर्व्हिस नमुना उदाहरण

## सेवा सारांश

### API गेटवे (Node.js/Express)

**पोर्ट**: 8080  
**प्रवेश**: सार्वजनिक (बाह्य इनग्रेझ)  
**उद्दिष्ट**: येणाऱ्या विनंत्यांना योग्य बॅकएंड सेवांकडे मार्गदर्शन करणे  

**एंडपॉइंट्स**:
- `GET /` - सेवा माहिती
- `GET /health` - आरोग्य तपासणी एंडपॉइंट
- `GET /api/products` - प्रॉडक्ट सेवा कडे पुढे पाठवा (सर्व यादी करा)
- `GET /api/products/:id` - प्रॉडक्ट सेवा कडे पुढे पाठवा (आयडी नुसार मिळवा)

**महत्वाचे वैशिष्ट्ये**:
- विनंती राउटिंग axios सह
- केंद्रीकृत लॉगिंग
- त्रुटी हाताळणी आणि टाइमआउट व्यवस्थापन
- पर्यावरण चलांद्वारे सेवा शोध
- Application Insights एकत्रीकरण

**कोड उच्चार** (`src/api-gateway/app.js`):
```javascript
// अंतर्गत सेवा संवाद
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### प्रॉडक्ट सेवा (Python/Flask)

**पोर्ट**: 8000  
**प्रवेश**: केवळ अंतर्गत (बाह्य इनग्रेझ नाही)  
**उद्दिष्ट**: इन-मेमरी डेटा सह प्रॉडक्ट कॅटलॉग व्यवस्थापित करणे  

**एंडपॉइंट्स**:
- `GET /` - सेवा माहिती
- `GET /health` - आरोग्य तपासणी एंडपॉइंट
- `GET /products` - सर्व प्रॉडक्ट्स यादी करा
- `GET /products/<id>` - आयडी नुसार प्रॉडक्ट मिळवा

**महत्वाचे वैशिष्ट्ये**:
- Flask सह RESTful API
- इन-मेमरी प्रॉडक्ट स्टोअर (सोपे, डेटाबेसची आवश्यकता नाही)
- स्वास्थ्य तपासण्यांसह मॉनिटरिंग
- संरचित लॉगिंग
- Application Insights समाकलन

**डेटा मॉडेल**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**केवळ अंतर्गत का?**
प्रॉडक्ट सेवा सार्वजनिकपणे प्रकट होत नाही. सर्व विनंत्या API गेटवे मार्फत जाव्यात, जे प्रदान करते:
- सुरक्षा: नियंत्रित प्रवेश बिंदू
- लवचीकता: बॅकएंड बदलता येतो, क्लायंटवर परिणाम होत नाही
- निरीक्षण: केंद्रीकृत विनंती लॉगिंग

## सेवा संवाद समजून घेणे

### सेवा एकमेकांशी कशा बोलतात

या उदाहरणात, API गेटवे प्रॉडक्ट सेवेबरोबर **अंतर्गत HTTP कॉल्स** वापरून संवाद साधतो:

```javascript
// API गेटवे (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// अंतर्गत HTTP विनंती करा
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**महत्वाचे मुद्दे**:

1. **DNS-आधारित शोध**: कंटेनर अ‍ॅप्स स्वयंचलितपणे अंतर्गत सेवांसाठी DNS पुरवतो
   - प्रॉडक्ट सेवा FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - सोप्या भाषेत: `http://product-service` (कंटेनर अ‍ॅप्स ते सोडवते)

2. **कोणताही सार्वजनिक प्रवेश नाही**: प्रॉडक्ट सेवेचा Bicep मध्ये `external: false` आहे
   - फक्त कंटेनर अ‍ॅप्स पर्यावरणात प्रवेशयोग्य
   - इंटरनेटवरून पोहोचता येत नाही

3. **पर्यावरण चल**: सेवेच्या URL तैनाती वेळी इंजेक्ट केले जातात
   - Bicep अंतर्गत FQDN गेटवे कडे पाठवतो
   - अनुप्रयोग कोडमध्ये हार्डकोडेड URL नाहीत

**उपमा**: हे ऑफिसच्या खोल्यांसारखे आहे. API गेटवे ही स्वागत कक्ष (सार्वजनिक), आणि प्रॉडक्ट सेवा एक कार्यालयाची खोली (केवळ अंतर्गत). अभ्यागतांना कोणत्याही कार्यालयात जाण्यासाठी स्वागत कक्षातून जावे लागते.

## तैनाती पर्याय

### पूर्ण तैनाती (शिफारस केलेली)

```bash
# इन्फ्रास्ट्रक्चर आणि दोन्ही सेवांचा तैनात करा
azd up
```

यामुळे तैनात होतात:
1. कंटेनर अ‍ॅप्स पर्यावरण
2. Application Insights
3. कंटेनर रजिस्ट्री
4. API गेटवे कंटेनर
5. प्रॉडक्ट सेवा कंटेनर

**वेळ**: 8-12 मिनिटे

### स्वतंत्र सेवा तैनात करा

```bash
# फक्त एक सेवा तैनात करा (प्राथमिक azd up नंतर)
azd deploy api-gateway

# किंवा उत्पादन सेवा तैनात करा
azd deploy product-service
```

**वापर प्रकरण**: जेव्हा आपण एका सेवेत कोड अपडेट केला असतो आणि फक्त ती सेवा पुन्हा तैनात करू इच्छिता.

### कॉन्फिगरेशन अपडेट करा

```bash
# स्केलिंग पॅरामीटर्स बदला
azd env set GATEWAY_MAX_REPLICAS 30

# नवीन कॉन्फिगरेशनसह पुन्हा तैनात करा
azd up
```

## कॉन्फिगरेशन

### स्केलिंग कॉन्फिगरेशन

दोन्ही सेवा त्यांच्या Bicep फायलींमध्ये HTTP-आधारित ऑटोस्केलिंगसह कॉन्फिगर आहेत:

**API गेटवे**:
- किमान रेप्लिका: 2 (उपलब्धतेसाठी नेहमी किमान 2)
- कमाल रेप्लिका: 20
- स्केल ट्रिगर: प्रति रेप्लिका 50 समांतर विनंत्या

**प्रॉडक्ट सेवा**:
- किमान रेप्लिका: 1 (गरज असल्यास शून्यावर देखील स्केल करू शकतो)
- कमाल रेप्लिका: 10
- स्केल ट्रिगर: प्रति रेप्लिका 100 समांतर विनंत्या

**स्केलिंग सानुकूलित करा** ( `infra/app/*.bicep` मध्ये):
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

### संसाधन वाटप

**API गेटवे**:
- CPU: 1.0 vCPU
- मेमरी: 2 GiB
- कारण: सर्व बाह्य ट्रॅफिक हाताळते

**प्रॉडक्ट सेवा**:
- CPU: 0.5 vCPU
- मेमरी: 1 GiB
- कारण: हलका इन-मेमरी ऑपरेशन्स

### आरोग्य तपासण्या

दोन्ही सेवांमध्ये लिव्हनेस आणि रेडीनेस प्रॉब्स आहेत:

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

**याचा अर्थ**:
- **लिव्हनेस**: आरोग्य तपासणी अयशस्वी झाल्यास, कंटेनर अ‍ॅप्स कंटेनर रीस्टार्ट करते
- **रेडीनेस**: तयारी नसल्यास, कंटेनर अ‍ॅप्स त्या रेप्लिकाकडे ट्रॅफिक राऊट करणे थांबवते

## निरीक्षण आणि पाहणी

### सेवा लॉग पहा

```bash
# azd monitor वापरून लॉग पहा
azd monitor --logs

# किंवा विशिष्ट कंटेनर अ‍ॅपसाठी Azure CLI वापरा:
# API Gateway कडून लॉग प्रवाहित करा
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# अलीकडील उत्पादन सेवा लॉग पहा
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**अपेक्षित आउटपुट**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights क्वेरीज

Azure Portal मध्ये Application Insights प्रवेश करा, नंतर या क्वेरीज चालवा:

**हळूहळू विनंत्या शोधा**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**सेवा-ते-सेवा कॉल्स ट्रॅक करा**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**सेवा नुसार त्रुटी दर**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**वेळेत विनंतीचे प्रमाण**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### निरीक्षण डॅशबोर्डमध्ये प्रवेश

```bash
# अॅप्लिकेशन इनसाइट्स तपशील मिळवा
azd env get-values | grep APPLICATIONINSIGHTS

# Azure पोर्टल मॉनिटरिंग उघडा
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### लाइव्ह मेट्रिक्स

1. Azure Portal मध्ये Application Insights कडे जा  
2. "Live Metrics" वर क्लिक करा  
3. रिअल-टाइम विनंत्या, अपयश आणि कार्यक्षमता पहा  
4. हे चालवून तपासणी करा: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## व्यावहारिक सराव

[टीप: तपशीलवार टप्प्याटप्प्याने तैनातीची पुष्टीकरण, डेटा बदल, ऑटोस्केलिंग चाचण्या, त्रुटी हाताळणी, आणि तिसरी सेवा जोडणे यांसह पूर्ण सराव "Practical Exercises" विभागात आहे.]

## खर्च विश्लेषण

### मासिक अंदाजे खर्च (या 2-सेवा उदाहरणासाठी)

| संसाधन | कॉन्फिगरेशन | अंदाजित खर्च |
|----------|--------------|----------------|
| API गेटवे | 2-20 रेप्लिका, 1 vCPU, 2GB RAM | $30-150 |
| प्रॉडक्ट सेवा | 1-10 रेप्लिका, 0.5 vCPU, 1GB RAM | $15-75 |
| कंटेनर रजिस्ट्री | मूलभूत स्तर | $5 |
| Application Insights | 1-2 GB प्रति महिना | $5-10 |
| लॉग अ‍ॅनालिटिक्स | 1 GB प्रति महिना | $3 |
| **एकूण** | | **$58-243/महिना** |

**वापरानुसार खर्च विभागणी**:
- **हलका ट्रॅफिक** (चाचणी/शिकणे): ~$60/महिना
- **मध्यम ट्रॅफिक** (लहान उत्पादन): ~$120/महिना
- **जास्त ट्रॅफिक** (गडबड काळ): ~$240/महिना

### खर्च कमी करण्याच्या टिप्स

1. **विकासासाठी शून्यावर स्केल करा**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Cosmos DB साठी Consumption Plan वापरा** (जो आपण जोडाल तेव्हा):
   - केवळ वापरलेल्या प्रमाणे पैसे द्या
   - किमान शुल्क नाही

3. **Application Insights सॅमपलिंग सेट करा**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // विनंत्यांपैकी ५०% चा नमुना घ्या
   ```

4. **आवश्यक नसल्यास स्वच्छता करा**:
   ```bash
   azd down
   ```

### मोफत टियर पर्याय
शिकण्याचा/चाचणी करण्याचा विचार करा:
- Azure मोफत क्रेडिट वापरा (पहिले 30 दिवस)
- कमाल प्रतिकृती ठेवा
- चाचणी नंतर हटवा (कोणतेही चालू शुल्क नाही)

---

## साफसफाई

चालू शुल्क टाळण्यासाठी, सर्व संसाधने हटवा:

```bash
azd down --force --purge
```

**पुष्टीकरण संकेत**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

पुष्टी करण्यासाठी `y` टाइप करा.

**काय हटवले जाईल**:
- कंटेनर अ‍ॅप्स पर्यावरण
- दोन्ही कंटेनर अ‍ॅप्स (गेटवे & उत्पादन सेवा)
- कंटेनर रजिस्ट्री
- अ‍ॅप्लिकेशन इनसाइट्स
- लॉग अ‍ॅनालिटिक्स वर्कस्पेस
- रिसोर्स ग्रुप

**✓ साफसफाई तपासा**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

रिकामे परत करावे.

---

## विस्तार मार्गदर्शन: 2 पासून 5+ सेवांपर्यंत

तुम्ही 2-सेवा आर्किटेक्चरमध्ये पारंगत झाल्यावर, विस्तार कसा करायचा ते येथे आहे:

### टप्पा 1: डेटाबेस कायमस्वरूपी जोडणे (पुढील पाऊल)

**उत्पादन सेवेकरिता Cosmos DB जोडा**:

1. `infra/core/cosmos.bicep` तयार करा:
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

2. उत्पादक सेवा आता इन-मेमरी डेटाऐवजी Cosmos DB वापरावी यासाठी अद्यतन करा

3. अंदाजित अतिरिक्त खर्च: ~$25/महिना (सर्व्हरलेस)

### टप्पा 2: तिसरी सेवा जोडा (ऑर्डर व्यवस्थापन)

**ऑर्डर सेवा तयार करा**:

1. नवीन फोल्डर: `src/order-service/` (Python/Node.js/C#)
2. नवीन Bicep: `infra/app/order-service.bicep`
3. API गेटवे `/api/orders` रूटसाठी अपडेट करा
4. ऑर्डर कायमस्वरूपी ठेवण्यासाठी Azure SQL डेटाबेस जोडा

**आर्किटेक्चर होते**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### टप्पा 3: असिंक्रोनस संवाद जोडा (सेवा बस)

**इव्हेंट-ड्रिव्हन आर्किटेक्चर लागू करा**:

1. Azure Service Bus जोडा: `infra/core/servicebus.bicep`
2. उत्पादन सेवा "ProductCreated" इव्हेंट्स प्रकाशित करते
3. ऑर्डर सेवा उत्पादन इव्हेंट्सवर सदस्य आहे
4. इव्हेंट्स प्रक्रिया करण्यासाठी नोटिफिकेशन सेवा जोडा

**पॅटर्न**: विनंती/प्रत्यास्थ (HTTP) + इव्हेंट-ड्रिव्हन (सेवा बस)

### टप्पा 4: वापरकर्ता प्रमाणीकरण जोडा

**वापरकर्ता सेवा अंमलात आणा**:

1. `src/user-service/` तयार करा (Go/Node.js)
2. Azure AD B2C किंवा कस्टम JWT प्रमाणीकरण जोडा
3. API गेटवे टोकन तपासते
4. सेवा वापरकर्ता परवाने तपासतात

### टप्पा 5: उत्पादन सज्जता

**हे घटक जोडा**:
- Azure Front Door (जागतिक लोड बॅलेंसिंग)
- Azure Key Vault (गुप्त व्यवस्थापन)
- Azure Monitor Workbooks (सानुकूल डॅशबोर्ड)
- CI/CD पाईपलाईन (GitHub Actions)
- ब्लू-ग्रीन तैनाती
- सर्व सेवांसाठी व्यवस्थापित ओळख

**पूर्ण उत्पादन आर्किटेक्चर खर्च**: ~$300-1,400/महिना

---

## अधिक जाणून घ्या

### संबंधित दस्तऐवज
- [Azure Container Apps Documentation](https://learn.microsoft.com/azure/container-apps/)
- [Microservices Architecture Guide](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights for Distributed Tracing](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### या कोर्समधील पुढील पावले
- ← मागील: [सिंपल Flask API](../../../../../examples/container-app/simple-flask-api) - प्रांरभिक एकल-कंटेनर उदाहरण
- → पुढील: [एआय समाकलन मार्गदर्शक](../../../../../examples/docs/ai-foundry) - AI क्षमता जोडा
- 🏠 [कोर्स मुख्यपृष्ठ](../../README.md)

### तुलना: कधी कोणता वापरायचा

**एकल कंटेनर अ‍ॅप** (सिंपल Flask API उदाहरण):
- ✅ सोप्या अनुप्रयोगांसाठी
- ✅ एकत्रित आर्किटेक्चर
- ✅ जलद तैनाती
- ❌ मर्यादित स्केलेबिलिटी
- **खर्च**: ~$15-50/महिना

**मायक्रोसर्व्हिसेस** (हे उदाहरण):
- ✅ गुंतागुंतीचे अनुप्रयोग
- ✅ सेवेप्रमाणे स्वतंत्र स्केलिंग
- ✅ टीम स्वायत्तता (वेगवेगळ्या सेवा, वेगवेगळ्या टीम)
- ❌ व्यवस्थापनासाठी अधिक गुंतागुंत
- **खर्च**: ~$60-250/महिना

**कुबेरनेट्स (AKS)**:
- ✅ जास्तीत जास्त नियंत्रण आणि लवचिकता
- ✅ मल्टि-क्लाउड पोर्टेबिलिटी
- ✅ प्रगत नेटवर्किंग
- ❌ कुबेरनेट्स तज्ज्ञतेची गरज
- **खर्च**: ~$150-500/महिना किमान

**शिफारस**: कंटेनर अ‍ॅप्सपासून (हे उदाहरण), फक्त कुबेरनेट्स-स्पेसिफिक वैशिष्ट्यांसाठी AKS कडे जा.

---

## वारंवार विचरले जाणारे प्रश्न

**प्र: का फक्त 2 सेवा आणि नाहक 5+ नाही?**  
उ: शैक्षणिक प्रगतीसाठी. सेवा संवाद, निरीक्षण, स्केलिंग यांसारखे मूलतत्त्वे साध्या उदाहरणासह आधी समजून घ्या. येथे शिकलेल्या पॅटर्न्स 100-सेवा आर्किटेक्चरवर लागू होतात.

**प्र: मी स्वतः आणखी सेवा जोडू शकतो का?**  
उ: नक्कीच! वरील विस्तार मार्गदर्शन पाळा. प्रत्येक नवीन सेवा त्याच पॅटर्नवर चालते: src फोल्डर तयार करा, Bicep फाइल तयार करा, azure.yaml अपडेट करा, तैनात करा.

**प्र: हे उत्पादनासाठी तयार आहे का?**  
उ: हे एक ठोस पाया आहे. उत्पादनासाठी: व्यवस्थापित ओळख, Key Vault, कायमस्वरूपी डेटाबेस, CI/CD पाईपलाइन, निरीक्षण अलर्ट, आणि बॅकअप धोरण जोडा.

**प्र: Dapr किंवा इतर सेवा मेश का वापरू नये?**  
उ: शिकण्यासाठी सोपे ठेवा. एकदा कंटेनर अ‍ॅप्सची नेटवर्किंग समजली की, पुढे प्रगत परिस्थितीसाठी Dapr वापरू शकता.

**प्र: मी स्थानिकरीत्या डिबग कसा करू?**  
उ: सेवास Docker सह स्थानिक चालवा:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**प्र: वेगवेगळ्या प्रोग्रामिंग भाषा वापरू शकतो का?**  
उ: होय! हे उदाहरण Node.js (गेटवे) + Python (उत्पादन सेवा) दाखवते. तुम्ही कंटेनरमध्ये चालणाऱ्या कोणत्याही भाषांचा वापर करू शकता.

**प्र: माझ्याकडे Azure क्रेडिट्स नसतील तर?**  
उ: Azure मोफत स्तर वापरा (नवीन खात्यांसाठी पहिले 30 दिवस) किंवा अल्प चाचणीसाठी तैनात करा आणि लगेच हटवा.

---

> **🎓 शिकण्याचा मार्ग सारांश**: तुम्ही मल्टी-सेवा आर्किटेक्चर डिप्लॉय करायची, स्वयंसिड्या स्केलिंग, आंतरिक नेटवर्किंग, केंद्रीकृत निरीक्षण आणि उत्पादनासाठी तयार पॅटर्न्स शिकले आहेत. हा पाया गुंतागुंतीच्या वितरित प्रणाली आणि एंटरप्राइझ मायक्रोसर्व्हिसेस आर्किटेक्चर्ससाठी तयारी करतो.

**📚 कोर्स नेव्हिगेशन:**
- ← मागील: [सिंपल Flask API](../../../../../examples/container-app/simple-flask-api)
- → पुढील: [डेटाबेस समाकलन उदाहरण](../../../../../examples/database-app)
- 🏠 [कोर्स मुख्यपृष्ठ](../../../README.md)
- 📖 [कंटेनर अ‍ॅप्स उत्तम पद्धती](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून भाषांतरित केला आहे. आम्ही अचूकतेसाठी प्रयत्नशील आहोत, तरी कृपया लक्षात ठेवा की स्वयंचलित भाषांतरात चुका किंवा अचूकतेच्या त्रुटी असू शकतात. मूळ दस्तऐवज त्याच्या स्थानिक भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी भाषांतर शिफारसीय आहे. या भाषांतराच्या वापरामुळे उद्भवलेल्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थसंग्रहासाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->