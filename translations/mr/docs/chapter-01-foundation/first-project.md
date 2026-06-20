# तुमचा पहिला प्रकल्प - हाताने शिकण्याचा ट्यूटोरियल

**प्रकरण नेव्हिगेशन:**  
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)  
- **📖 चालू प्रकरण**: प्रकरण 1 - मूलाधार & जलद प्रारंभ  
- **⬅️ मागील**: [इंस्टॉलेशन & सेटअप](installation.md)  
- **➡️ पुढील**: [कॉन्फिगरेशन](configuration.md)  
- **🚀 पुढील प्रकरण**: [प्रकरण 2: AI-फर्स्ट विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)  

## परिचय

तुमच्या पहिल्या Azure Developer CLI प्रकल्पात स्वागत आहे! हा सर्वांगिण हाताने शिकण्याचा ट्यूटोरियल azd वापरून Azure वर पूर्ण स्टॅक अनुप्रयोग तयार करणे, तैनात करणे आणि व्यवस्थापित करण्याची संपूर्ण मार्गदर्शिका देतो. तुम्ही एक वास्तविक todo अनुप्रयोगावर काम कराल ज्यात React फ्रंटएंड, Node.js API बॅकएंड आणि MongoDB डेटाबेस आहे.

## शिकण्याच्या उद्दिष्टे

हा ट्यूटोरियल पूर्ण करून तुम्ही:  
- टेम्प्लेट वापरून azd प्रकल्प प्रारंभ कार्यप्रवाह मास्टर कराल  
- Azure Developer CLI प्रकल्प रचना आणि कॉन्फिगरेशन फायली समजून घ्याल  
- पूर्ण एप्लिकेशन तैनातीसाठी Azure वर संपूर्ण कार्यप्रवाह पार पाडाल  
- अनुप्रयोग अद्यतने आणि पुन्हा तैनाती धोरणे अंमलात आणाल  
- विकास आणि स्टेजिंगसाठी अनेक पर्यावरणे व्यवस्थापित कराल  
- संसाधनांची साफसफाई आणि खर्च व्यवस्थापन पद्धती लागू कराल  

## शिकण्याचे परिणाम

पूर्ण झाल्यावर, तुम्ही सक्षम असाल:  
- टेम्प्लेट्समधून स्वातंत्र्याने azd प्रकल्प सुरू करणे आणि कॉन्फिगर करणे  
- azd प्रकल्प रचना प्रभावीपणे नेव्हिगेट आणि सुधारित करणे  
- एकाच आदेशाने Azure वर पूर्ण स्टॅक अनुप्रयोग तैनात करणे  
- सामान्य तैनात समस्या आणि प्रमाणीकरण समस्या निराकरण करणे  
- वेगवेगळी तैनाती चरणे साठी अनेक Azure पर्यावरणे व्यवस्थापित करणे  
- अनुप्रयोग अद्यतनांसाठी सातत्यपूर्ण तैनात कार्यप्रवाह अंमलबजावणी करणे  

## प्रारंभ करा

### आवश्यकतांची यादी  
- ✅ Azure Developer CLI इन्स्टॉल ([इंस्टॉलेशन मार्गदर्शक](installation.md))  
- ✅ `azd auth login` वापरून AZD प्रमाणीकरण पूर्ण केलेले  
- ✅ तुमच्या संगणकावर Git इन्स्टॉल केलेले  
- ✅ Node.js 16+ (या ट्यूटोरियलसाठी)  
- ✅ Visual Studio Code (शिफारस केली आहे)  

प्रक्रिया सुरू करण्यापूर्वी, रेपॉजिटरी मूळ ठिकाणाहून सेटअप चाचणी चालवा:  

**Windows:** `./validate-setup.ps1`  

**macOS / Linux:** `bash ./validate-setup.sh`  

### तुमचा सेटअप तपासा  
```bash
# azd स्थापना तपासा
azd version

# AZD प्रमाणीकरण तपासा
azd auth login --check-status
```
  
### ऐच्छिक Azure CLI प्रमाणीकरण तपासा  

```bash
az account show
```
  
### Node.js आवृत्ती तपासा  
```bash
node --version
```
  
## पाऊल 1: टेम्प्लेट निवडा आणि प्रारंभ करा

चला एक लोकप्रिय todo अनुप्रयोग टेम्प्लेटसह सुरुवात करूया ज्यात React फ्रंटएंड आणि Node.js API बॅकएंड आहे.

```bash
# उपलब्ध साचा पहा
azd template list

# टू-डू अॅप साचा प्रारंभ करा
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# सूचनांचे पालन करा:
# - एक पर्यावरण नाव टाका: "डेव्ह"
# - एक सदस्यता निवडा (जर तुमच्याकडे एकापेक्षा जास्त असतील तर)
# - एक प्रदेश निवडा: "ईस्ट यूएस 2" (किंवा तुमचा पसंतीचा प्रदेश)
```
  
### काय झाले?  
- टेम्प्लेट कोड तुमच्या स्थानिक निर्देशिकेत डाउनलोड झाला  
- सेवा व्याख्यांसह `azure.yaml` फाईल तयार केली  
- `infra/` निर्देशिकेमध्ये पायाभूत कोड सेट केला  
- पर्यावरण कॉन्फिगरेशन तयार केले  

## पाऊल 2: प्रकल्पाची रचना तपासा

azd ने आम्हांस काय तयार केले ते पाहूया:

```bash
# प्रकल्प संरचना पहा
tree /f   # विंडोज
# किंवा
find . -type f | head -20   # मॅकओएस/लिनक्स
```
  
तुम्हाला खालील दिसायला हवे:  
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```
  
### समजण्यासाठी महत्त्वाच्या फाइल्स  

**azure.yaml** - तुमच्या azd प्रकल्पाचा मुख्य भाग:  
```bash
# प्रकल्प संरचना पाहा
cat azure.yaml
```
  
**infra/main.bicep** - पायाभूत सुविधा व्याख्या:  
```bash
# पायाभूत सुविधा कोड पहा
head -30 infra/main.bicep
```
  
## पाऊल 3: तुमचा प्रकल्प सानुकूलित करा (ऐच्छिक)

तैनात करण्यापूर्वी, तुम्ही अनुप्रयोग सानुकूलित करू शकता:  

### फ्रंटएंड सुधारित करा  
```bash
# React अॅप कॉम्पोनंट उघडा
code src/web/src/App.tsx
```
  
सोप्या बदल करा:  
```typescript
// शीर्षक शोधा आणि ते बदला
<h1>My Awesome Todo App</h1>
```
  
### पर्यावरण चल कॉन्फिगर करा  
```bash
# कस्टम पर्यावरण चल सेट करा
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# सर्व पर्यावरण चल पहा
azd env get-values
```
  
## पाऊल 4: Azure वर तैनात करा

आता रोमहर्षक भाग - सगळं Azure वर तैनात करूया!

```bash
# इन्फ्रास्ट्रक्चर आणि अ‍ॅप्लिकेशन तैनात करा
azd up

# हा आदेश खालील गोष्टी करेल:
# 1. Azure संसाधने प्रदान करा (App Service, Cosmos DB, इत्यादी)
# 2. आपले अ‍ॅप्लिकेशन तयार करा
# 3. प्रदान केलेल्या संसाधनांवर तैनात करा
# 4. अ‍ॅप्लिकेशन URL दर्शवा
```
  
### तैनात करताना काय होते?  

`azd up` आदेश हे टप्पे पार पाडतो:  
1. **Provision** (`azd provision`) - Azure संसाधने तयार करतो  
2. **Package** - तुमचा अनुप्रयोग कोड बनवतो  
3. **Deploy** (`azd deploy`) - कोड Azure संसाधनांवर तैनात करतो  

### अपेक्षित आउटपुट  
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```
  
## पाऊल 5: तुमचा अनुप्रयोग तपासा

### अनुप्रयोग प्रवेश करा  
तैनात आउटपुटमध्ये दिलेल्या URL वर क्लिक करा, किंवा कधीही ते मिळवा:  
```bash
# अनुप्रयोग एंडपॉइंट मिळवा
azd show

# तुमच्या ब्राउझरमध्ये अनुप्रयोग उघडा
azd show --output json | jq -r '.services.web.endpoint'
```
  
### Todo अनुप्रयोग तपासा  
1. **नवीन todo आयटम जोडा** - "Add Todo" क्लिक करा आणि काम टाका  
2. **पूर्ण झाल्याचे चिन्हांकित करा** - पूर्ण केलेल्या आयटम्सवर टिचकी द्या  
3. **आयटमस हटवा** - ज्या todos ची गरज नाही ती काढा  

### तुमचा अनुप्रयोग निरीक्षण करा  
```bash
# आपल्या स्त्रोतांसाठी Azure पोर्टल उघडा
azd monitor

# अनुप्रयोग निर्देशांक पहा
azd monitor --logs

# थेट मेट्रिक्स पहा
azd monitor --live
```
  
### ✅ तुमच्या तैनातीची पुष्टी करा

पुढे जाण्यापूर्वी, हे जलद तपासणी यादी चालवा जेणेकरून सर्व काही खरंच कार्यरत आहे याची खात्री होईल — "tænatı safal" म्हणजे "app चालू आहे" असा समज ठेवू नका:  

```bash
# 1. एंडपॉइंट अस्तित्वात आहे आणि प्राप्त होऊ शकतो याची पुष्टी करा
azd show

# 2. एंडपॉइंटचे स्मोक-टेस्ट करा (HTTP 200 अपेक्षित)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. तुमच्या अॅपमध्ये सॉफ्टवेअर आरोग्य तपासण्याची सुविधा असल्यास आरोग्य एंडपॉइंट तपासा
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```
  
**तैनात पुष्टी म्हणजे:**  
- ✅ `azd show` पोहोचू शकणारा एंडपॉइंट URL दाखवतो  
- ✅ URL ब्राउझरमध्ये कोणतीही त्रुटी न करता उघडतो  
- ✅ मुख्य वैशिष्ट्ये काम करतात (todo जोडा/पूर्ण/काढा)  
- ✅ `azd monitor --logs` विनाकारण त्रुटीशिवाय विनंत्या दर्शवतो  

जर एखादा तपासणी नापास झाला, तर [प्रकरण 7: समस्या निवारण](../chapter-07-troubleshooting/README.md) पहा.  

## पाऊल 6: बदल करा आणि पुन्हा तैनात करा

चला एक बदल करू आणि पाहू कसे सहज अपडेट करता येतो:  

### API सुधारित करा  
```bash
# API कोड संपादित करा
code src/api/src/routes/lists.js
```
  
सानुकूल प्रतिसाद हेडर जोडा:  
```javascript
// एक मार्ग हाताळणारा शोधा आणि जोडा:
res.header('X-Powered-By', 'Azure Developer CLI');
```
  
### फक्त कोड बदल तैनात करा  
```bash
# फक्त अनुप्रयोग कोड तैनात करा (इन्फ्रास्ट्रक्चर वगळा)
azd deploy

# हे 'azd up' पेक्षा खूप वेगवान आहे कारण इन्फ्रास्ट्रक्चर आधीपासूनच अस्तित्वात आहे
```
  
## पाऊल 7: अनेक पर्यावरणे व्यवस्थापित करा

प्रॉडक्शनपूर्वी बदल तपासण्यासाठी स्टेजिंग पर्यावरण निर्माण करा:  

```bash
# नवीन स्टेजिंग पर्यावरण तयार करा
azd env new staging

# स्टेजिंगमध्ये डिप्लॉय करा
azd up

# डेव्ह पर्यावरणाकडे परत स्विच करा
azd env select dev

# सर्व पर्यावरणांची यादी करा
azd env list
```
  
### पर्यावरण तुलना  
```bash
# विकास वातावरण पहा
azd env select dev
azd show

# स्टेजिंग वातावरण पहा
azd env select staging
azd show
```
  
## पाऊल 8: संसाधने साफ करा

प्रयत्न पूर्ण केल्यानंतर, सतत शुल्क टाळण्यासाठी साफसफाई करा:  

```bash
# चालू वातावरणासाठी सर्व Azure संसाधने हटवा
azd down

# पुष्टीकरणाशिवाय बळजबरीने हटवा आणि सॉफ्ट-डिलीट केलेली संसाधने पूर्णपणे काढा
azd down --force --purge

# विशिष्ट वातावरण हटवा
azd env select staging
azd down --force --purge
```
  
## क्लासिक अॅप विरुद्ध AI-शक्तीने चालणारा अॅप: समान कार्यप्रवाह

तुम्ही फक्त पारंपरिक वेब अनुप्रयोग तैनात केला. पण जर तुम्हाला AI-शक्तीने चालणारा अनुप्रयोग तैनात करायचा असेल—उदा., Microsoft Foundry मॉडेल्सवर आधारित चॅट अनुप्रयोग?

चांगली बातमी: **कार्यप्रवाह सारखाच आहे.**

| पाऊल | क्लासिक Todo अॅप | AI चॅट अॅप |  
|------|-----------------|------------|  
| प्रारंभ करा | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |  
| प्रमाणीकरण | `azd auth login` | `azd auth login` |  
| तैनात करा | `azd up` | `azd up` |  
| देखरेख करा | `azd monitor` | `azd monitor` |  
| साफ करा | `azd down --force --purge` | `azd down --force --purge` |  

फक्त फरक तर तुम्ही ज्यापासून सुरू करता त्या **टेम्प्लेट मध्ये** आहे. AI टेम्प्लेटमध्ये अतिरिक्त पायाभूत सुविधा (जसे Microsoft Foundry Models संसाधन किंवा AI Search निर्देशांक) असतो, परंतु azd सर्व काही हाताळतो. नवीन आदेश शिकण्याची किंवा वेगळा टूल स्वीकारण्याची गरज नाही, किंवा तैनातीचे विचार कसे करायचे हे बदलण्याची गरज नाही.

हेच azd चे मूलभूत तत्व आहे: **एका कार्यप्रवाहात, कोणत्याही कामासाठी.** तुम्ही या ट्यूटोरियलमध्ये जो कौशल्याचा सराव केला — प्रारंभ करणे, तैनात करणे, देखरेख करणे, पुन्हा तैनात करणे, आणि साफसफाई — हे समान रीतीने AI अनुप्रयोग आणि एजंट्समध्ये लागू होते.

---

## तुम्ही काय शिकलात

अभिनंदन! तुम्ही यशस्वीरित्या:  
- ✅ टेम्प्लेटमधून azd प्रकल्प प्रारंभ केला  
- ✅ प्रकल्प रचना आणि महत्त्वाच्या फाइल्स एक्सप्लोर केल्या  
- ✅ पूर्ण स्टॅक अनुप्रयोग Azure वर तैनात केला  
- ✅ कोड बदल केले आणि पुन्हा तैनात केले  
- ✅ अनेक पर्यावरणे व्यवस्थापित केली  
- ✅ संसाधने साफ केली  

## 🎯 कौशल्य पुष्टीकरणाच्या सरावांसाठी

### सराव 1: वेगळा टेम्प्लेट तैनात करा (१५ मिनिटे)  
**उद्दिष्ट:** azd init आणि तैनात कार्यप्रवाहाचे प्रभुत्व दाखवा  

```bash
# Python + MongoDB स्टॅक वापरून पहा
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# तैनातीची पडताळणी करा
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# साफसफाई करा
azd down --force --purge
```
  
**यशस्वी निकष:**  
- [ ] अनुप्रयोग त्रुटीशिवाय तैनात होतो  
- [ ] अनुप्रयोग URL ब्राउझरमध्ये प्रवेशयोग्य आहे  
- [ ] अनुप्रयोग योग्यरीत्या कार्य करतो (todo जोडा/काढा)  
- [ ] सर्व संसाधने यशस्वीरीत्या साफ केल्या  

### सराव 2: कॉन्फिगरेशन सानुकूलित करा (२० मिनिटे)  
**उद्दिष्ट:** पर्यावरण चल कॉन्फिगरेशनचा सराव करा  

```bash
cd my-first-azd-app

# सानुकूल वातावरण तयार करा
azd env new custom-config

# सानुकूल चल सेट करा
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# चलांची पुष्टी करा
azd env get-values | grep APP_TITLE

# सानुकूल कॉन्फिगसह तैनात करा
azd up
```
  
**यशस्वी निकष:**  
- [ ] सानुकूल पर्यावरण यशस्वीरित्या तयार केले  
- [ ] पर्यावरण चल सेट केले गेले आणि प्राप्त करता येतात  
- [ ] सानुकूल कॉन्फिगरेशनसह अनुप्रयोग तैनात होतो  
- [ ] तैनात अॅप मध्ये सानुकूल सेटिंग्ज तपासता येतात  

### सराव 3: बहु-पर्यावरण कार्यप्रवाह (२५ मिनिटे)  
**उद्दिष्ट:** पर्यावरण व्यवस्थापन आणि तैनाती धोरणे मास्टर करा  

```bash
# विकास वातावरण तयार करा
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# विकास URL नोंदवा
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# स्टेजिंग वातावरण तयार करा
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# स्टेजिंग URL नोंदवा
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# वातावरणांची तुलना करा
azd env list

# दोन्ही वातावरणांची चाचणी करा
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# दोन्ही स्वच्छ करा
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```
  
**यशस्वी निकष:**  
- [ ] दोन पर्यावरण वेगवेगळ्या कॉन्फिगरेशनसह तयार केले  
- [ ] दोन्ही पर्यावरणे यशस्वीरीत्या तैनात केल्या  
- [ ] `azd env select` वापरून पर्यावरणांमधील स्विच करता येते  
- [ ] पर्यावरण चल वेगळे असतात  
- [ ] दोन्ही पर्यावरणांची साफसफाई यशस्वीरीत्या केली  

## 📊 तुमचा प्रगती

**कालावधी गुंतवणूक:** ~60-90 मिनिटे  
**शिकलेली कौशल्ये:**  
- ✅ टेम्प्लेट-आधारित प्रकल्प प्रारंभ  
- ✅ Azure संसाधन प्रोविजनींग  
- ✅ अनुप्रयोग तैनात कार्यप्रवाह  
- ✅ पर्यावरण व्यवस्थापन  
- ✅ कॉन्फिगरेशन व्यवस्थापन  
- ✅ संसाधन साफसफाई आणि खर्च व्यवस्थापन  

**पुढील पायरी:** तुम्ही [कॉन्फिगरेशन मार्गदर्शक](configuration.md) कडे पुढे जाण्यास तयार आहात जेथे प्रगत कॉन्फिगरेशन पॅटर्न शिकता येतील!

## सामान्य समस्या निराकरण

### प्रमाणीकरण त्रुटी  
```bash
# Azure सह पुन्हा प्रमाणीकरण करा
az login

# सदस्यता प्रवेश तपासा
az account show
```
  
### तैनात अयशस्वी  
```bash
# डिबग लॉगिंग सक्षम करा
export AZD_DEBUG=true
azd up --debug

# Azure मध्ये अ‍ॅप्लिकेशन लॉग्स पहा
azd monitor --logs

# कंटेनर अ‍ॅप्ससाठी, Azure CLI वापरा:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```
  
### संसाधन नाव टकराव  
```bash
# एक अद्वितीय पर्यावरण नाव वापरा
azd env new dev-$(whoami)-$(date +%s)
```
  
### पोर्ट/नेटवर्क समस्या  
```bash
# पोर्ट्स उपलब्ध आहेत का ते तपासा
netstat -an | grep :3000
netstat -an | grep :3100
```
  
## पुढील पावले

आता की तुम्ही तुमचा पहिला प्रकल्प पूर्ण केला आहे, या प्रगत विषयांचा अभ्यास करा:

### 1. पायाभूत सुविधा सानुकूलित करा  
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)  
- [डेटाबेस, संग्रहण, आणि इतर सेवा जोडा](../chapter-04-infrastructure/provisioning.md#adding-services)  

### 2. CI/CD सेट अप करा  
- [तैनात मार्गदर्शक](../chapter-04-infrastructure/deployment-guide.md) - संपूर्ण CI/CD कार्यप्रवाह  
- [Azure Developer CLI दस्तऐवज](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - पाईपलाइन कॉन्फिगरेशन  

### 3. उत्पादनाची उत्तम पद्धती  
- [तैनात मार्गदर्शक](../chapter-04-infrastructure/deployment-guide.md) - सुरक्षा, कार्यक्षमता, आणि देखरेख  

### 4. आणखी टेम्प्लेट एक्सप्लोर करा  
```bash
# कॅटेगिरीनुसार टेम्प्लेट ब्राउझ करा
azd template list --filter web
azd template list --filter api
azd template list --filter database

# वेगवेगळ्या तंत्रज्ञान स्टॅक्सची चाचणी करा
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```
  
## अतिरिक्त संसाधने

### शिकण्याची सामग्री  
- [Azure Developer CLI दस्तऐवज](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure आर्किटेक्चर सेंटर](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure वेल-आर्किटेक्टेड फ्रेमवर्क](https://learn.microsoft.com/en-us/azure/well-architected/)  

### समुदाय आणि समर्थन  
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)  
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)  
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)  

### टेम्प्लेट आणि उदाहरणे  
- [अधिकृत टेम्प्लेट गॅलरी](https://azure.github.io/awesome-azd/)  
- [समुदाय टेम्प्लेट](https://github.com/Azure-Samples/azd-templates)  
- [एंटरप्राइझ पॅटर्न्स](https://github.com/Azure/azure-dev/tree/main/templates)  

---

**तुमच्या पहिल्या azd प्रकल्पास अभिनंदन!** तुम्ही आता आत्मविश्वासाने Azure वर आश्चर्यकारक अनुप्रयोग तयार करण्यास आणि तैनात करण्यास तयार आहात.

---

**प्रकरण नेव्हिगेशन:**  
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)  
- **📖 चालू प्रकरण**: प्रकरण 1 - मूलाधार & जलद प्रारंभ  
- **⬅️ मागील**: [इंस्टॉलेशन & सेटअप](installation.md)  
- **➡️ पुढील**: [तुमचा स्वतःचा अॅप आणा](bring-your-own-app.md)  
- **🚀 पुढील प्रकरण**: [प्रकरण 2: AI-फर्स्ट विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->