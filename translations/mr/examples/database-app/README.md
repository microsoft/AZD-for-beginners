# AZD सह Microsoft SQL डेटाबेस आणि वेब अ‍ॅप तैनात करणे

⏱️ **अंदाजे वेळ**: 20-30 मिनिटे | 💰 **अंदाजे खर्च**: ~$15-25/महिना | ⭐ **तपशीलवारपणा**: मध्यम

हा **पूर्ण, कार्यरत उदाहरण** दाखवतो की [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) कसा वापरून Python Flask वेब अनुप्रयोग Microsoft SQL डेटाबेससह Azure मध्ये तैनात करता येतो. सर्व कोड समाविष्ट आणि चाचणी केलेले आहे—कोणत्याही बाह्य अवलंबनांशिवाय.

## तुम्हाला काय शिकायला मिळेल

हे उदाहरण पूर्ण केल्यावर तुम्ही:
- एक बहु-स्तरीय अनुप्रयोग (वेब अ‍ॅप + डेटाबेस) इन्फ्रास्ट्रक्चर-एज-कोड वापरून तैनात करू शकाल
- कनेक्शन सुरक्षितपणे सानुकूलित करू शकाल, गुप्त माहिती हार्डकोड न करता
- Application Insights वापरून अनुप्रयोग आरोग्याचे निरीक्षण करू शकाल
- AZD CLI सह Azure संसाधने प्रभावीपणे व्यवस्थापित करू शकाल
- Azure च्या सुरक्षा, खर्च ऑप्टिमायझेशन, आणि निरीक्षणासाठी सर्वोत्तम पद्धतींचे पालन कराल

## घटनेचे सारांश
- **वेब अ‍ॅप**: डेटाबेस कनेक्टिव्हिटीसह Python Flask REST API
- **डेटाबेस**: नमुना डेटासह Azure SQL डेटाबेस
- **इन्फ्रास्ट्रक्चर**: Bicep वापरून तयार (मॉड्युलर, पुनर्वापरयोग्य टेम्पलेट्स)
- **तैनाती**: `azd` आदेशांद्वारे पूर्णपणे स्वयंचलित
- **निरीक्षण**: लॉग आणि टेलीमेट्रीसाठी Application Insights

## पूर्वअटी

### आवश्यक साधने

सुरुवात करण्यापूर्वी, तुम्ही ह्या साधना स्थापित केल्या आहेत का ते तपासा:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (आवृत्ती 2.50.0 किंवा त्यापेक्षा उच्च)
   ```sh
   az --version
   # अपेक्षित आउटपुट: azure-cli 2.50.0 किंवा उच्च	Version
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (आवृत्ती 1.0.0 किंवा त्यापेक्षा उच्च)
   ```sh
   azd version
   # अपेक्षित आउटपुट: azd आवृत्ती 1.0.0 किंवा त्यापेक्षा उच्चतर
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (स्थानिक विकासासाठी)
   ```sh
   python --version
   # अपेक्षित आउटपुट: Python 3.8 किंवा त्याहून नवीन आवृत्ती
   ```

4. **[Docker](https://www.docker.com/get-started)** (पर्यायी, कंटेनरायझ्ड स्थानिक विकासासाठी)
   ```sh
   docker --version
   # अपेक्षित उत्पादन: Docker आवृत्ती 20.10 किंवा त्याहून अधिक
   ```

### Azure आवश्यकताः

- सक्रिय **Azure सदस्यत्व** ([फ्री अकाउंट तयार करा](https://azure.microsoft.com/free/))
- सदस्यत्वात संसाधने तयार करण्याची परवानगी
- सदस्यत्व किंवा संसाधन गटावर **मालक** किंवा **योगदानकर्ता** भूमिका

### ज्ञान पूर्वअटी

हे उदाहरण **मध्यम स्तराचे** आहे. तुम्हाला खालील गोष्टी माहित असणे आवश्यक आहे:
- मूलभूत कमांड-लाइन ऑपरेशन्स
- क्लाउड मूलभूत संकल्पना (संसाधने, संसाधन गट)
- वेब अनुप्रयोग आणि डेटाबेसची मूलभूत समज

**AZD नवखे?** आधी [Getting Started guide](../../docs/chapter-01-foundation/azd-basics.md) वाचा.

## आर्किटेक्चर

हा उदाहरण दोन-स्तरीय आर्किटेक्चर वेब अनुप्रयोग आणि SQL डेटाबेससह तैनात करतो:

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

**संसाधन तैनात करणे:**
- **संसाधन गट**: सर्व संसाधनांसाठी कंटेनर
- **अ‍ॅप सर्व्हिस प्लॅन**: Linux आधारीत होस्टिंग (B1 टिअर खर्च बचतीसाठी)
- **वेब अ‍ॅप**: Python 3.11 रनटाइमसह Flask अ‍ॅप्लिकेशन
- **SQL सर्व्हर**: TLS 1.2 किमान असलेला व्यवस्थापित डेटाबेस सर्व्हर
- **SQL डेटाबेस**: बेसिक टिअर (2GB, विकास/चाचणीसाठी योग्य)
- **Application Insights**: निरीक्षण आणि लॉगिंग
- **लॉग अॅनालिटिक्स वर्कस्पेस**: केंद्रीकृत लॉग संग्रहण

**सादृश्य**: हे अशा रेस्टॉरंटसारखे आहे (वेब अ‍ॅप) जिथे एक वॉक-इन फ्रीजर (डेटाबेस) आहे. ग्राहक मेनूमधून (API एंडपॉइंट) ऑर्डर करतात, आणि स्वयंपाकघर (Flask अ‍ॅप) फ्रीजरमधून साहित्य (डेटा) आणतो. रेस्टॉरंट व्यवस्थापक (Application Insights) सर्व क्रियाकलापांवर लक्ष ठेवतो.

## फोल्डर रचना

सर्व फायली या उदाहरणात समाविष्ट आहेत—कोणतेही बाह्य अवलंबन आवश्यक नाही:

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

**प्रत्येक फाइल काय करते:**
- **azure.yaml**: AZD ला काय आणि कुठे तैनात करायचं ते सांगतो
- **infra/main.bicep**: सर्व Azure संसाधने एकत्र करते
- **infra/resources/*.bicep**: स्वतंत्र संसाधन व्याख्या (पुनर्वापरासाठी मॉड्युलर)
- **src/web/app.py**: डेटाबेस लॉजिकसह Flask अ‍ॅप्लिकेशन
- **requirements.txt**: Python पॅकेज अवलंबन
- **Dockerfile**: कंटेनरायझेशन सूचना तैनातीसाठी

## क्विकस्टार्ट (टप्प्याटप्प्याने)

### टप्पा 1: क्लोन करा आणि नेव्हिगेट करा

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ यशाची तपासणी**: `azure.yaml` आणि `infra/` फोल्डर दिसतात का तपासा:
```sh
ls
# अपेक्षित: README.md, azure.yaml, infra/, src/
```

### टप्पा 2: Azure सह प्रमाणीकरण करा

```sh
azd auth login
```

हा तुमचा वेब ब्राउझर उघडून Azure प्रमाणीकरणासाठी विनंती करतो. तुमचे Azure क्रेडेन्शियल्स वापरून लॉग इन करा.

**✓ यशाची तपासणी**: हे पाहायला मिळेल:
```
Logged in to Azure.
```

### टप्पा 3: वातावरण आरंभ करा

```sh
azd init
```

**घटते काय**: AZD तुमच्या तैनातीसाठी स्थानिक कॉन्फिगरेशन तयार करतो.

**तुम्हाला विचारण्यात येणारी माहिती**:
- **वातावरण नाव**: लहान नाव द्या (उदा. `dev`, `myapp`)
- **Azure सदस्यत्व**: सूचीतील तुमचे सदस्यत्व निवडा
- **Azure स्थान**: क्षेत्र निवडा (उदा. `eastus`, `westeurope`)

**✓ यशाची तपासणी**: हे पाहायला मिळेल:
```
SUCCESS: New project initialized!
```

### टप्पा 4: Azure संसाधने तयार करा

```sh
azd provision
```

**घटते काय**: AZD सर्व इन्फ्रास्ट्रक्चर तैनात करतो (5-8 मिनिटे लागतात):
1. संसाधन गट तयार करतो
2. SQL सर्व्हर आणि डेटाबेस तयार करतो
3. अ‍ॅप सर्व्हिस प्लॅन तयार करतो
4. वेब अ‍ॅप तयार करतो
5. Application Insights तयार करतो
6. नेटवर्किंग आणि सुरक्षा कॉन्फिगर करतो

**तुम्हाला विचारले जाईल**:
- **SQL अ‍ॅडमिन वापरकर्तानाव**: वापरकर्तानाव द्या (उदा. `sqladmin`)
- **SQL अ‍ॅडमिन पासवर्ड**: मजबूत पासवर्ड द्या (हे जतन करा!)

**✓ यशाची तपासणी**: हे पाहायला मिळेल:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ वेळ**: 5-8 मिनिटे

### टप्पा 5: अ‍ॅप्लिकेशन तैनात करा

```sh
azd deploy
```

**घटते काय**: AZD तुमचा Flask अनुप्रयोग तयार करतो आणि तैनात करतो:
1. Python अ‍ॅप्लिकेशन पॅकेजिंग
2. Docker कंटेनर बांधणी
3. Azure वेब अ‍ॅपवर अग्रेषित करणे
4. डेटाबेसमध्ये नमुना डेटा प्रारंभ करणे
5. अनुप्रयोग सुरू करणे

**✓ यशाची तपासणी**: हे पाहायला मिळेल:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ वेळ**: 3-5 मिनिटे

### टप्पा 6: अनुप्रयोग ब्राउझ करा

```sh
azd browse
```

हा तुमचा तैनात वेब अ‍ॅप ब्राउझरमध्ये उघडतो, URL: `https://app-<unique-id>.azurewebsites.net`

**✓ यशाची तपासणी**: JSON आउटपुट दिसेल:
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

### टप्पा 7: API एंडपॉइंट्सची चाचणी करा

**आरोग्य तपासणी** (डेटाबेस कनेक्शन सत्यापित करा):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**अपेक्षित प्रतिसाद**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**उत्पादने यादी करा** (नमुना डेटा):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**अपेक्षित प्रतिसाद**:
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

**एकल उत्पादन मिळवा**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ यशाची तपासणी**: सर्व एंडपॉइंट्स त्रुटीशिवाय JSON डेटा परत करतात.

---

**🎉 अभिनंदन!** AZD वापरून तुम्ही यशस्वीपणे डेटाबेससह वेब अनुप्रयोग Azure मध्ये तैनात केला आहे.

## कॉन्फिगरेशन सविस्तर

### पर्यावरण चल

गुपिते Azure App Service कॉन्फिगरेशनद्वारे सुरक्षितपणे व्यवस्थापित केली जातात—**कोडमध्ये कधीही हार्डकोड न करता**.

**AZD कडून स्वयंचलित कॉन्फिगर केलेले:**
- `SQL_CONNECTION_STRING`: एन्क्रिप्ट केलेले प्रमाणपत्रांसह डेटाबेस कनेक्शन स्ट्रिंग
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: निरीक्षण टेलीमेट्रीसाठी एंडपॉइंट
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: स्वयंचलित अवलंबन स्थापना सक्षम करतो

**गुपिते कुठे साठवली जातात:**
1. `azd provision` दरम्यान SQL क्रेडेन्शियल्स सुरक्षित प्रमाणीकरणाद्वारे दिले जातात
2. AZD ही स्थानिक `.azure/<env-name>/.env` फाइलमध्ये साठवतो (git-ignored)
3. AZD हे Azure App Service कॉन्फिगरेशनमध्ये इंजेक्ट करतो (रेस्ट मध्ये एनक्रिप्ट केलेले)
4. अनुप्रयोग रनटाइममध्ये `os.getenv()` द्वारे वाचतो

### स्थानिक विकास

स्थानिक चाचणीसाठी, नमुना `.env` फाइल तयार करा:

```sh
cp .env.sample .env
# तुमच्या स्थानिक डेटाबेस कनेक्शनसह .env संपादित करा
```

**स्थानिक विकास कार्यप्रवाह**:
```sh
# अवलंबित्व स्थापित करा
cd src/web
pip install -r requirements.txt

# पर्यावरण चल सेट करा
export SQL_CONNECTION_STRING="your-local-connection-string"

# अनुप्रयोग चालवा
python app.py
```

**स्थानिक चाचणी**:
```sh
curl http://localhost:8000/health
# अपेक्षित: {"status": "healthy", "database": "connected"}
```

### इन्फ्रास्ट्रक्चर एज कोड

सर्व Azure संसाधने **Bicep टेम्पलेट्स** (`infra/` फोल्डर) मध्ये परिभाषित:

- **मॉड्युलर डिझाइन**: प्रत्येक संसाधन प्रकारासाठी स्वतंत्र फायली पुनर्वापरासाठी
- **पॅरामेटराइज्ड**: SKU, क्षेत्रे, नामकरण परंपरा सानुकूल करा
- **सर्वोत्तम पद्धती**: Azure नामकरण मानके आणि सुरक्षा डीफॉल्टचे पालन
- **आकृतीमध्ये नियंत्रण**: इन्फ्रास्ट्रक्चर बदल Git मध्ये ट्रॅक केले जातात

**सानुकूलन उदाहरण**:
डेटाबेस टिअर बदलण्यासाठी `infra/resources/sql-database.bicep` संपादित करा:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## सुरक्षा सर्वोत्तम पद्धती

हे उदाहरण Azure सुरक्षा सर्वोत्तम पद्धतींचे पालन करते:

### 1. **कोडमध्ये गुपित नाही**
- ✅ Azure App Service कॉन्फिगरेशनमध्ये क्रेडेन्शियल सुरक्षितपणे साठवलेले (एनक्रिप्टेड)
- ✅ `.env` फाइल Git मध्ये समाविष्ट नाही (`.gitignore`)
- ✅ प्रावधानामुळे सुरक्षित पॅरामीटर्सद्वारे गुपिते दिली जातात

### 2. **एन्क्रिप्टेड कनेक्शन**
- ✅ SQL सर्व्हरसाठी किमान TLS 1.2
- ✅ वेब अ‍ॅपसाठी फक्त HTTPS सक्ती
- ✅ डेटाबेस कनेक्शन्ससाठी एन्क्रिप्टेड चॅनेल्स

### 3. **नेटवर्क सुरक्षा**
- ✅ SQL सर्व्हर फायरवॉल फक्त Azure सेवा परवानगी देतो
- ✅ सार्वजनिक नेटवर्क प्रवेश प्रतिबंधित (प्रायव्हेट एंडपॉइंटसह अधिक सुरक्षित करता येते)
- ✅ वेब अ‍ॅपवर FTPS निष्क्रिय

### 4. **प्रमाणीकरण आणि अधिकृतता**
- ⚠️ **सध्याचे**: SQL प्रमाणीकरण (वापरकर्तानाव/पासवर्ड)
- ✅ **उत्पादन सल्ला**: पासवर्डशिवाय प्रमाणीकरणासाठी Azure Managed Identity वापरा

**Managed Identity वर अपग्रेड करण्यासाठी** (उत्पादनासाठी):
1. वेब अ‍ॅपवर व्यवस्थापित ओळख सक्षम करा
2. ओळखीला SQL परवानगी द्या
3. कनेक्शन स्ट्रिंग अपडेट करा जो व्यवस्थापित ओळख वापरतो
4. पासवर्ड-आधारित प्रमाणीकरण काढून टाका

### 5. **ऑडिटिंग आणि अनुपालन**
- ✅ Application Insights सर्व विनंत्या आणि त्रुटी नोंदवते
- ✅ SQL डेटाबेस ऑडिटिंग सक्षम (अनुपालनासाठी कॉन्फिगर करता येते)
- ✅ सर्व संसाधने गव्हर्नन्ससाठी टॅग केलेली

**उत्पादनापूर्वी सुरक्षा चेकलिस्ट**:
- [ ] SQL साठी Azure Defender सक्षम करा
- [ ] SQL डेटाबेससाठी प्रायव्हेट एंडपॉइंट कॉन्फिगर करा
- [ ] वेब अनुप्रयोग फायरवॉल (WAF) सक्षम करा
- [ ] गुपित रोटेशनसाठी Azure Key Vault वापरा
- [ ] Azure AD प्रमाणीकरण कॉन्फिगर करा
- [ ] सर्व संसाधनांसाठी डायग्नोस्टिक लॉगिंग सक्षम करा

## खर्च ऑप्टिमायझेशन

**अंदाजे मासिक खर्च** (नोव्हेंबर 2025 पर्यंत):

| संसाधन | SKU/टिअर | अंदाजे खर्च |
|----------|----------|----------------|
| अ‍ॅप सर्व्हिस प्लॅन | B1 (बेसिक) | ~$13/महिना |
| SQL डेटाबेस | बेसिक (2GB) | ~$5/महिना |
| Application Insights | पे-एज-यू-गो | ~$2/महिना (कमी ट्रॅफिक) |
| **एकूण** | | **~$20/महिना** |

**💡 खर्च बचतीचे उपाय**:

1. **शिकण्यासाठी फ्री टिअर वापरा**:
   - अ‍ॅप सर्व्हिस: F1 टिअर (फ्री, मर्यादित तास)
   - SQL डेटाबेस: Azure SQL डेटाबेस सर्व्हरलेस वापरा
   - Application Insights: 5GB/महिना फ्री इनजेशन

2. **वापरात नसताना संसाधने थांबवा**:
   ```sh
   # वेब अ‍ॅप थांबवा (डेटाबेस अजूनही चार्ज होते)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # आवश्यक तेव्हा पुन्हा सुरू करा
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **चाचणी नंतर सगळे हटवा**:
   ```sh
   azd down
   ```
   हे सर्व संसाधने काढून टाकते आणि शुल्क थांबवते.

4. **विकास विरुद्ध उत्पादन SKU**:
   - **विकास**: बेसिक टिअर (या उदाहरणात वापरलेले)
   - **उत्पादन**: स्टँडर्ड/प्रीमियम टिअर रेडंडन्सीसह

**खर्च निरीक्षण**:
- [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement) मध्ये खर्च पहा
- अनपेक्षित बाबी टाळण्यासाठी खर्च अलर्ट सेट करा
- ट्रॅकिंगसाठी सर्व संसाधने `azd-env-name` टॅग करा

**फ्री टिअर पर्याय**:
शिकण्यासाठी, `infra/resources/app-service-plan.bicep` मध्ये बदल करा:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**टीप**: फ्री टिअर मर्यादा आहेत (60 मिनिट CPU रोज, ऑलवेज-ऑन नाही).

## निरीक्षण आणि परीक्षण

### Application Insights एकत्रीकरण

हे उदाहरण **Application Insights** चे पूर्णपणे निरीक्षणासाठी समावेश करतो:

**काय निरीक्षण केले जाते:**
- ✅ HTTP विनंत्या (प्रतिसाद वेळ, स्थिती कोड, एंडपॉइंट्स)
- ✅ अनुप्रयोग त्रुटी आणि अपवाद
- ✅ Flask अ‍ॅप कडून कस्टम लॉगिंग
- ✅ डेटाबेस कनेक्शन हेल्थ
- ✅ कामगिरीचे मेट्रिक्स (CPU, मेमरी)

**Application Insights प्रवेश:**
1. [Azure Portal](https://portal.azure.com) उघडा
2. तुमच्या संसाधन गटाकडे जा (`rg-<env-name>`)
3. Application Insights संसाधनावर क्लिक करा (`appi-<unique-id>`)

**उपयुक्त चौकशी** (Application Insights → लॉग्स):

**सर्व विनंत्या पहा**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**त्रुटी शोधा**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**हेल्थ एंडपॉइंट तपासा**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### SQL डेटाबेस ऑडिटिंग

**SQL डेटाबेस ऑडिटिंग सक्षम** आहे, जे ट्रॅक करते:
- डेटाबेस प्रवेश नमुने
- अयशस्वी लॉगिन प्रयत्न
- स्कीमा बदल
- डेटा प्रवेश (अनुपालनासाठी)

**ऑडिट लॉग प्रवेश:**
1. Azure Portal → SQL डेटाबेस → ऑडिटिंग
2. लॉग अॅनालिटिक्स वर्कस्पेसमध्ये नोंदी पाहा

### रिअल-टाइम निरीक्षण

**लाइव्ह मेट्रिक्स पहा**:
1. Application Insights → Live Metrics
2. रिअल-टाइम विनंत्या, अपयश, कामगिरी पाहा

**अलर्ट सेट करा**:
महत्वाच्या घटनांसाठी अलर्ट तयार करा:
- HTTP 500 त्रुटी > 5 पाच मिनिटांत
- उच्च प्रतिसाद वेळ (>2 सेकंद)

**उदाहरण अलर्ट निर्मिती**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## समस्या निवारण

### सामान्य समस्या आणि उपाय

#### 1. `azd provision` "Location not available" या त्रुटीसह अयशस्वी होतो

**लक्षण**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**उपाय**:
भिन्न Azure प्रदेश निवडा किंवा रिसोर्स प्रोव्हायडर नोंदणी करा:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. SQL कनेक्शन तैनाती दरम्यान अयशस्वी

**लक्षण**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**उपाय**:
- SQL Server फायरवॉलने Azure सेवा परवानगी दिली असल्याची खात्री करा (स्वयंचलितरित्या कॉन्फिगर)
- `azd provision` दरम्यान SQL प्रशासकाचा पासवर्ड बरोबर दिला असल्याची तपासणी करा
- SQL Server पूर्णपणे प्रोव्हिजन केला आहे याची खात्री करा (२-३ मिनिटे लागू शकतात)

**कनेक्शन तपासा**:
```sh
# Azure Portal वरून, SQL Database → Query editor येथे जा
# तुमच्या प्रमाणीकरणासह कनेक्ट करण्याचा प्रयत्न करा
```

#### 3. वेब अ‍ॅप "Application Error" दर्शवते

**लक्षण**:
ब्राउझर सामान्य त्रुटी पान दर्शविते.

**उपाय**:
अ‍ॅप्लिकेशन लॉग्स तपासा:
```sh
# अलीकडील नोंदी पहा
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**सामान्य कारणे**:
- पर्यावरणातील व्हेरिएबल्स गायब (App Service → Configuration तपासा)
- Python पॅकेज स्थापित होण्यात अयशस्वी (तैनाती लॉग्स तपासा)
- डेटाबेस इनिशियलायझेशन त्रुटी (SQL कनेक्टिव्हिटी तपासा)

#### 4. `azd deploy` "Build Error" सह अयशस्वी

**लक्षण**:
```
Error: Failed to build project
```

**उपाय**:
- `requirements.txt` मध्ये कोणतीही साकरण त्रुटी नाही याची खात्री करा
- `infra/resources/web-app.bicep` मध्ये Python 3.11 दिला आहे की नाही ते तपासा
- Dockerfile मध्ये योग्य बेस इमेज वापरली आहे का ते सत्यापित करा

**स्थानिक डिबग करा**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. AZD कमांड चालवताना "Unauthorized" त्रुटी

**लक्षण**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**उपाय**:
Azure मध्ये पुन्हा प्रमाणीकरण करा:
```sh
azd auth login
az login
```

सदस्यत्वावर योग्य परवानग्या (Contributor भूमिका) आहेत का ते तपासा.

#### 6. उच्च डेटाबेस खर्च

**लक्षण**:
अनपेक्षित Azure बिल आला आहे.

**उपाय**:
- चाचणी नंतर `azd down` चालवायला विसरला आहे का तपासा
- SQL Database बेसिक टियर वापरत आहे की नाही ते तपासा (प्रिमियम नाही)
- Azure Cost Management मध्ये खर्च तपासा
- खर्च सूचना सेट करा

### मदत मिळविणे

**सर्व AZD पर्यावरण व्हेरिएबल्स पहा**:
```sh
azd env get-values
```

**तैनाती स्थिती तपासा**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**अ‍ॅप्लिकेशन लॉग्स प्रवेश करा**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**अधिक मदत हवी आहे?**
- [AZD समस्या निवारण मार्गदर्शक](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Azure App Service समस्या निवारण](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL समस्या निवारण](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## व्यावहारिक व्यायाम

### व्यायाम 1: तुमच्या तैनातीची पुष्टी करा (सुरुवातीचे)

**उद्दिष्ट**: सर्व संसाधने तैनात झाली आहेत आणि अ‍ॅप्लिकेशन कार्यरत आहे याची पुष्टी करा.

**पायऱ्या**:
1. तुमच्या रिसोर्स ग्रुपमधील सर्व संसाधने सूचीबद्ध करा:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **अपेक्षित**: 6-7 संसाधने (वेब अ‍ॅप, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. सर्व API एंडपॉइंट्सची चाचणी करा:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **अपेक्षित**: सर्व वैध JSON परत करतात त्रुटीशिवाय

3. Application Insights तपासा:
   - Azure पोर्टल मध्ये Application Insights वर जा
   - "Live Metrics" वर जा
   - वेब अ‍ॅपवर तुमचा ब्राउझर रीफ्रेश करा
   **अपेक्षित**: वेळोवेळी विनंत्या दिसतात

**यश निकष**: सर्व 6-7 संसाधने अस्तित्वात आहेत, सर्व एंडपॉइंट्स डेटा परत करतात, Live Metrics मध्ये क्रियाशीलता दिसते.

---

### व्यायाम 2: नवीन API एंडपॉइंट जोडा (मध्यम)

**उद्दिष्ट**: Flask अ‍ॅप्लिकेशनमध्ये नवीन एंडपॉइंट जोडा.

**प्रारंभिक कोड**: s`rc/web/app.py` मधील वर्तमान एंडपॉइंट्स

**पायऱ्या**:
1. `src/web/app.py` संपादित करा आणि `get_product()` फंक्शन नंतर नवीन एंडपॉइंट जोडा:
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

2. अपडेट केलेले अ‍ॅप्लिकेशन तैनात करा:
   ```sh
   azd deploy
   ```

3. नवीन एंडपॉइंटची चाचणी करा:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **अपेक्षित**: "laptop" शी संबंधित उत्पादने परत करतो

**यश निकष**: नवीन एंडपॉइंट कार्यरत आहे, फिल्टर केलेले परिणाम परत करतो, Application Insights लॉग्समध्ये दिसतो.

---

### व्यायाम 3: मॉनिटरिंग आणि अलर्ट कॉन्फिगर करा (प्रगत)

**उद्दिष्ट**: सक्रिय मॉनिटरिंगसाठी अलर्ट सेट करा.

**पायऱ्या**:
1. HTTP 500 त्रुटी साठी अलर्ट तयार करा:
   ```sh
   # अॅप्लिकेशन इन्साईट्स रिसोर्स आयडी मिळवा
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # अलर्ट तयार करा
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. त्रुटी निर्माण करून अलर्ट ट्रिगर करा:
   ```sh
   # अस्तित्वात नसलेला उत्पादन मागणी करा
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. अलर्ट सुरू झाला आहे का ते तपासा:
   - Azure पोर्टल → Alerts → Alert Rules
   - तुमचा ईमेल तपासा (कॉन्फिगर केल्यास)

**यश निकष**: अलर्ट नियम तयार झाला, त्रुटींवर ट्रिगर होतो, सूचना प्राप्त होतात.

---

### व्यायाम 4: डेटाबेस स्कीमा बदल (प्रगत)

**उद्दिष्ट**: नवीन टेबल जोडा आणि अ‍ॅप्लिकेशनमध्ये त्याचा वापर करा.

**पायऱ्या**:
1. Azure पोर्टल Query Editor द्वारे SQL Database शी कनेक्ट करा

2. नवीन `categories` टेबल तयार करा:
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

3. प्रतिसादांमध्ये श्रेणी माहिती समाविष्ट करण्यासाठी `src/web/app.py` अपडेट करा

4. तैनात करा आणि चाचणी करा

**यश निकष**: नवीन टेबल अस्तित्वात आहे, उत्पादने श्रेणी माहिती दर्शवितात, अ‍ॅप्लिकेशन कार्यरत आहे.

---

### व्यायाम 5: कॅशिंग अमलात आणा (तज्ञ स्तर)

**उद्दिष्ट**: कार्यक्षमता सुधारण्यासाठी Azure Redis Cache जोडा.

**पायऱ्या**:
1. `infra/main.bicep` मध्ये Redis Cache जोडा
2. `src/web/app.py` मध्ये उत्पादन क्वेरी कॅश करण्यासाठी अपडेट करा
3. Application Insights वापरून कार्यक्षमता सुधारणे मोजा
4. कॅशिंग आधी/नंतर प्रतिसाद वेळेची तुलना करा

**यश निकष**: Redis तैनात केला आहे, कॅशिंग कार्यरत आहे, प्रतिसाद वेळेत ५०% पेक्षा जास्त सुधारणा झाली आहे.

**सूचना**: [Azure Cache for Redis documentation](https://learn.microsoft.com/azure/azure-cache-for-redis/) वापरून सुरुवात करा.

---

## साफसफाई

चालू शुल्क टाळण्यासाठी पूर्ण झाल्यानंतर सर्व संसाधने हटवा:

```sh
azd down
```

**पुष्टीकरण सूचना**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

`y` टाइप करा पुष्टी करण्यासाठी.

**✓ यशस्वी तपासणी**: 
- Azure पोर्टलमधून सर्व संसाधने हटवली गेली आहेत
- कोणतेही चालू शुल्क नाहीत
- स्थानिक `.azure/<env-name>` फोल्डर हटवू शकता

**पर्यायी** (इंफ्रास्ट्रक्चर ठेवा, डेटा हटवा):
```sh
# फक्त रिसोर्स ग्रुप हटवा (AZD कॉन्फिग जतन ठेवा)
az group delete --name rg-<env-name> --yes
```
## अधिक जाणून घ्या

### संबंधित दस्तऐवज
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database Documentation](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service Documentation](https://learn.microsoft.com/azure/app-service/)
- [Application Insights Documentation](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep Language Reference](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### या कोर्समधील पुढील पावले
- **[Container Apps Example](../../../../examples/container-app)**: Azure Container Apps सह मायक्रोसर्व्हिसेस तैनात करा
- **[AI Integration Guide](../../../../docs/ai-foundry)**: तुमच्या अ‍ॅपमध्ये AI क्षमता जोडा
- **[Deployment Best Practices](../../docs/chapter-04-infrastructure/deployment-guide.md)**: उत्पादन तैनातीच्या सर्वोत्तम पद्धती

### प्रगत विषय
- **Managed Identity**: पासवर्ड काढा आणि Azure AD प्रमाणीकरण वापरा
- **Private Endpoints**: व्हर्च्युअल नेटवर्कमध्ये डेटाबेस कनेक्शन सुरक्षित करा
- **CI/CD Integration**: GitHub Actions किंवा Azure DevOps सह तैनाती स्वयंचलित करा
- **Multi-Environment**: dev, staging, आणि production वातावरण सेट करा
- **Database Migrations**: Alembic किंवा Entity Framework वापरून स्कीमा आवृत्तीकरण करा

### इतर दृष्टिकोनांची तुलना

**AZD विरुद्ध ARM टेम्पलेट्स**:
- ✅ AZD: उच्च पातळीवरचे विहंगावलोकन, सोपे आदेश
- ⚠️ ARM: जास्त तपशीलवार, सूक्ष्म नियंत्रण

**AZD विरुद्ध Terraform**:
- ✅ AZD: Azure-स्वदेशी, Azure सेवांसोबत समाकलित
- ⚠️ Terraform: मल्टी-क्लाउड समर्थन, मोठा इकोसिस्टम

**AZD विरुद्ध Azure पोर्टल**:
- ✅ AZD: पुनरावृत्त करता येणारे, आवृत्ती-नियंत्रित, स्वयंचलित
- ⚠️ पोर्टल: मॅन्युअल क्लिक, पुनरुत्पादन कठीण

**AZD ला विचार करा**: Azure साठी Docker Compose—कॉम्प्लेक्स तैनातीसाठी सोपी कॉन्फिगरेशन.

---

## वारंवार विचारले जाणारे प्रश्न

**प्रश्न: मी दुसरी प्रोग्रामिंग भाषा वापरू शकतो का?**  
उत्तर: होय! `src/web/` मध्ये Node.js, C#, Go किंवा कोणतीही भाषा वापरा. `azure.yaml` आणि Bicep नुसार अपडेट करा.

**प्रश्न: मला आणखी डेटाबेस कसे जोडायचे?**  
उत्तर: `infra/main.bicep` मध्ये दुसरे SQL Database मॉड्यूल जोडा किंवा Azure Database सेवा मधील PostgreSQL/MySQL वापरा.

**प्रश्न: मी याचा वापर उत्पादनासाठी करू शकतो का?**  
उत्तर: हे सुरुवातीसाठी आहे. उत्पादनासाठी: managed identity, private endpoints, redundancy, बॅकअप धोरण, WAF, आणि वाढलेली मॉनिटरिंग जोडा.

**प्रश्न: मला कोड तैनातीऐवजी कंटेनर वापरायचे असल्यास काय?**  
उत्तर: [Container Apps Example](../../../../examples/container-app) पहा जे Dockers कंटेनरची संपूर्ण वापर करते.

**प्रश्न: मी माझ्या स्थानिक मशीनवरून डेटाबेसशी कसा कनेक्ट करेन?**  
उत्तर: तुमचा IP SQL Server फायरवॉलमध्ये जोडा:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**प्रश्न: नवीन डेटाबेस तयार न करता विद्यमान डेटाबेस वापरू शकतो का?**  
उत्तर: होय, विद्यमान SQL Server संदर्भित करण्यासाठी `infra/main.bicep` सुधारणा करा आणि कनेक्शन स्ट्रिंग पॅरामीटर्स अपडेट करा.

---

> **टीप:** हे उदाहरण AZD वापरून डेटाबेससह वेब अ‍ॅप तैनात करण्याच्या सर्वोत्तम पद्धती दर्शविते. यामध्ये कार्यरत कोड, व्यापक दस्तऐवज, आणि शिकण्यासाठी व्यावहारिक व्यायाम आहेत. उत्पादन तैनातीसाठी, तुमच्या संस्थेच्या सुरक्षितता, स्केलिंग, अनुपालन, आणि खर्चाच्या गरजा पुनरावलोकन करा.

**📚 कोर्स नेव्हिगेशन:**
- ← मागील: [Container Apps Example](../../../../examples/container-app)
- → पुढील: [AI Integration Guide](../../../../docs/ai-foundry)
- 🏠 [कोर्स मुख्य पृष्ठ](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**सर्जनशीलता सूचना**:  
हा दस्तऐवज एआय अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित केला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असतो, मात्र कृपया लक्षात घ्या की स्वयंचलित भाषांतरात चुका किंवा असत्यता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्त्रोत म्हणून मानला जावा. महत्त्वाच्या माहितीसाठी, व्यावसायिक मानवी अनुवादाची शिफारस केली जाते. यामुळे कोणत्याही गैरसमजात किंवा चुकीच्या अर्थ लावण्यात आमची जबाबदारी नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->