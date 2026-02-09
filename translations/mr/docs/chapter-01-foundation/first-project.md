# आपला पहिला प्रकल्प - हँड्स-ऑन ट्यूटोरियल

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स मुख्यपृष्ठ**: [AZD नवीनांसाठी](../../README.md)
- **📖 सध्याचा अध्याय**: अध्याय 1 - पाया आणि जलद सुरूवात
- **⬅️ मागील**: [स्थापना व सेटअप](installation.md)
- **➡️ पुढे**: [कॉन्फिगरेशन](configuration.md)
- **🚀 पुढचा अध्याय**: [अध्याय 2: AI-प्रथम विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)

## परिचय

आपल्या पहिल्या Azure Developer CLI प्रकल्पात आपले स्वागत आहे! हा सर्वसमावेशक हँड्स-ऑन ट्यूटोरियल azd वापरून Azure वर एक पूर्ण-स्टॅक अनुप्रयोग तयार करणे, तैनात करणे आणि व्यवस्थापित करण्याची संपूर्ण मार्गदर्शिका प्रदान करतो. आपण एक वास्तविक todo अनुप्रयोगावर काम कराल ज्यामध्ये React फ्रंटएंड, Node.js API बॅकएंड आणि MongoDB डेटाबेस यांचा समावेश आहे.

## शिकण्याची उद्दिष्टे

या ट्यूटोरियल पूर्ण केल्यावर आपण:
- टेम्पलेट्स वापरून azd प्रकल्प आरंभीकरण कार्यप्रवाहात पारंगत व्हाल
- Azure Developer CLI प्रकल्प रचना आणि कॉन्फिगरेशन फायली समजून घ्याल
- इन्फ्रास्ट्रक्चर प्रोव्हिजनिंगसह Azure वर पूर्ण अनुप्रयोग तैनात कराल
- अनुप्रयोग अपडेट्स आणि पुन्हा-तैनात करण्याच्या धोरणांची अंमलबजावणी कराल
- विकास आणि स्टेजिंगसाठी एकाधिक वातावरणांचे व्यवस्थापन कराल
- संसाधन क्लीनअप आणि खर्च व्यवस्थापन पद्धती लागू कराल

## शिकण्याचे परिणाम

पूर्ण झाल्यानंतर, आपण सक्षम असाल:
- स्वतंत्रपणे टेम्पलेटमधून azd प्रकल्प आरंभीकरण आणि कॉन्फिगर करणे
- azd प्रकल्प संरचना प्रभावीपणे नेव्हिगेट व बदल करणे
- एकाच आदेशाने Azure वर पूर्ण-स्टॅक अनुप्रयोग तैनात करणे
- सामान्य तैनाती समस्या आणि प्रमाणीकरण समस्या शोधण्यात तांत्रिकदृष्ट्या काम करण्यास सक्षम असणे
- विविध तैनाती टप्प्यांसाठी एकाधिक Azure वातावरण व्यवस्थापित करणे
- अनुप्रयोग अपडेट्ससाठी सतत तैनाती कार्यप्रवाहांची अंमलबजावणी करणे

## सुरूवात

### पूर्व-आवश्यकता तपासणी यादी
- ✅ Azure Developer CLI स्थापित आहे ([स्थापना मार्गदर्शक](installation.md))
- ✅ Azure CLI स्थापित आणि प्रमाणीकृत आहे
- ✅ Git आपल्या सिस्टमवर स्थापित आहे
- ✅ Node.js 16+ (या ट्यूटोरियलसाठी)
- ✅ Visual Studio Code (शिफारसीय)

### आपली सेटअप तपासा
```bash
# azd स्थापना तपासा
azd version
```
### Azure प्रमाणीकरण तपासा

```bash
az account show
```

### Node.js आवृत्ती तपासा
```bash
node --version
```

## पाऊल 1: टेम्पलेट निवडा आणि प्रारंभ करा

React फ्रंटएंड आणि Node.js API बॅकएंड असलेला एक लोकप्रिय todo अनुप्रयोग टेम्पलेट वापरून सुरुवात करूया.

```bash
# उपलब्ध टेम्पलेट्स ब्राउझ करा
azd template list

# todo अॅप टेम्पलेट प्रारंभ करा
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# प्रॉम्प्ट्सचे पालन करा:
# - एक पर्यावरणाचे नाव प्रविष्ट करा: "dev"
# - एक सदस्यता निवडा (जर तुमच्याकडे एकाधिक असतील)
# - एक क्षेत्र निवडा: "East US 2" (किंवा तुमच्या पसंतीचे क्षेत्र)
```

### काय झाले?
- टेम्पलेट कोड आपल्या स्थानिक डिरेक्टरीमध्ये डाउनलोड झाला
- सेवा परिभाषांसह `azure.yaml` फाइल तयार केली
- `infra/` डिरेक्टरीमध्ये इन्फ्रास्ट्रक्चर कोड सेटअप केला
- एक वातावरण कॉन्फिगरेशन तयार केले

## पाऊल 2: प्रकल्प रचना तपासा

azd ने आपल्या साठी काय तयार केले आहे ते पाहूया:

```bash
# प्रकल्प संरचना पहा
tree /f   # विंडोज
# किंवा
find . -type f | head -20   # मॅकओएस/लिनक्स
```

आपल्याला हे दिसले पाहिजे:
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

### समजून घेण्यासारख्या मुख्य फायली

**azure.yaml** - आपल्या azd प्रकल्पाचे हृदय:
```bash
# प्रकल्प कॉन्फिगरेशन पहा
cat azure.yaml
```

**infra/main.bicep** - इन्फ्रास्ट्रक्चर व्याख्या:
```bash
# पायाभूत संरचनेचा कोड बघा
head -30 infra/main.bicep
```

## पाऊल 3: आपला प्रकल्प सानुकूल करा (पर्यायी)

तैनात करण्यापूर्वी, आपण अनुप्रयोग सानुकूल करू शकता:

### फ्रंटएंड बदल करा
```bash
# React अॅप घटक उघडा
code src/web/src/App.tsx
```

एक साधा बदल करा:
```typescript
// शीर्षक शोधा आणि ते बदला
<h1>My Awesome Todo App</h1>
```

### वातावरण चल कॉन्फिगर करा
```bash
# सानुकूल पर्यावरण चल सेट करा
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# सर्व पर्यावरण चल पहा
azd env get-values
```

## पाऊल 4: Azure वर तैनात करा

आता मजेदार भाग — सर्व काही Azure वर तैनात करा!

```bash
# इन्फ्रास्ट्रक्चर आणि अनुप्रयोग तैनात करा
azd up

# ही कमांड हे करेल:
# 1. Azure संसाधने तयार करा (App Service, Cosmos DB, इत्यादी)
# 2. आपले अनुप्रयोग तयार करा
# 3. तयार केलेल्या संसाधनांवर तैनात करा
# 4. अनुप्रयोगाचा URL दाखवा
```

### तैनाती दरम्यान काय घडते?

`azd up` आदेश हे चरण पार पाडतो:
1. **Provision** (`azd provision`) - Azure संसाधने तयार करतो
2. **Package** - आपल्या अनुप्रयोग कोडचे बिल्ड करतो
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

## पाऊल 5: आपला अनुप्रयोग तपासा

### आपल्या अनुप्रयोगात प्रवेश करा
तैनाती आउटपुटमध्ये दिलेल्या URL वर क्लिक करा, किंवा ते कधीही मिळवा:
```bash
# अॅप्लिकेशनचे एंडपॉइंट मिळवा
azd show

# तुमच्या ब्राउझरमध्ये अॅप्लिकेशन उघडा
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo अॅप तपासा
1. **todo आयटम जोडा** - "Add Todo" वर क्लिक करा आणि एक कार्य प्रविष्ट करा
2. **पूर्ण म्हणून चिन्हांकित करा** - पूर्ण झालेल्या आयटम्सवर तपास करा
3. **आयटम्स हटवा** - जे todo तुम्हाला नको असतील ते काढा

### आपल्या अनुप्रयोगाचे निरीक्षण करा
```bash
# आपल्या संसाधनांसाठी Azure पोर्टल उघडा
azd monitor

# अॅप्लिकेशन लॉग पहा
azd monitor --logs

# लाइव्ह मेट्रिक्स पहा
azd monitor --live
```

## पाऊल 6: बदल करा आणि पुन्हा तैनात करा

चला एक बदल करू आणि पाहूया अपडेट करणे किती सोपे आहे:

### API बदला
```bash
# API कोड संपादित करा
code src/api/src/routes/lists.js
```

कस्टम प्रतिसाद हेडर जोडा:
```javascript
// रूट हँडलर शोधा आणि जोडा:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### फक्त कोड बदल तैनात करा
```bash
# फक्त अनुप्रयोगाचा कोड तैनात करा (इन्फ्रास्ट्रक्चर वगळा)
azd deploy

# इन्फ्रास्ट्रक्चर आधीच अस्तित्वात असल्यामुळे हे 'azd up' पेक्षा खूप जलद आहे
```

## पाऊल 7: एकाधिक वातावरणांचे व्यवस्थापन करा

उत्पादनापूर्वी बदल तपासण्यासाठी स्टेजिंग वातावरण तयार करा:

```bash
# नवीन स्टेजिंग वातावरण तयार करा
azd env new staging

# स्टेजिंगवर तैनात करा
azd up

# डेव्हलपमेंट वातावरणाकडे परत बदला
azd env select dev

# सर्व वातावरणांची यादी करा
azd env list
```

### वातावरण तुलना
```bash
# विकास पर्यावरण पहा
azd env select dev
azd show

# स्टेजिंग पर्यावरण पहा
azd env select staging
azd show
```

## पाऊल 8: संसाधने साफ करा

प्रयोग पूर्ण झाल्यावर, चालू शुल्क टाळण्यासाठी संसाधने साफ करा:

```bash
# सध्याच्या वातावरणासाठी सर्व Azure संसाधने हटवा
azd down

# पुष्टीशिवाय जबरदस्तीने हटवा आणि सॉफ्ट-डिलीट केलेली संसाधने कायमचे नष्ट करा
azd down --force --purge

# विशिष्ट वातावरण हटवा
azd env select staging
azd down --force --purge
```

## आपण काय शिकलात

अभिनंदन! आपण यशस्वीरित्या:
- ✅ टेम्पलेटमधून azd प्रकल्प आरंभीकरण केले
- ✅ प्रकल्प रचना आणि प्रमुख फाइल्स तपासल्या
- ✅ पूर्ण-स्टॅक अनुप्रयोग Azure वर तैनात केला
- ✅ कोड बदल केले आणि पुन्हा तैनात केले
- ✅ एकाधिक वातावरणे व्यवस्थापित केली
- ✅ संसाधने साफ केली

## 🎯 कौशल्य पडताळणी सराव

### व्यायाम 1: वेगळा टेम्पलेट तैनात करा (15 मिनिटे)
**लक्ष्य**: azd init आणि तैनाती कार्यप्रवाहात कौशल्य दाखवा

```bash
# Python + MongoDB स्टॅक वापरून पहा
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# डिप्लॉयमेंटची पडताळणी करा
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# साफ करा
azd down --force --purge
```

**यश निकष:**
- [ ] अनुप्रयोग त्रुटीशिवाय तैनात होतो
- [ ] ब्राउझरमध्ये अनुप्रयोग URL मध्ये प्रवेश करता येतो
- [ ] अनुप्रयोग व्यवस्थित कार्य करतो (todo जोडणे/काढणे)
- [ ] सर्व संसाधने यशस्वीरीत्या साफ केली गेली

### व्यायाम 2: कॉन्फिगरेशन सानुकूल करा (20 मिनिटे)
**लक्ष्य**: वातावरण चल कॉन्फिगरेशनचा सराव करा

```bash
cd my-first-azd-app

# सानुकूल वातावरण तयार करा
azd env new custom-config

# सानुकूल चल सेट करा
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# चलांची पडताळणी करा
azd env get-values | grep APP_TITLE

# सानुकूल कॉन्फिगसह तैनात करा
azd up
```

**यश निकष:**
- [ ] कस्टम वातावरण यशस्वीरित्या तयार झाले
- [ ] वातावरण चल सेट आणि पुनर्प्राप्त करता येतात
- [ ] अनुप्रयोग कस्टम कॉन्फिगरेशनसह तैनात होतो
- [ ] तैनात अनुप्रयोगात कस्टम सेटिंग्ज सत्यापित करता येतात

### व्यायाम 3: बहु-पर्यावरण कार्यप्रवाह (25 मिनिटे)
**लक्ष्य**: वातावरण व्यवस्थापन आणि तैनाती धोरणांमध्ये पारंगत व्हा

```bash
# डेव्हलपमेंट वातावरण तयार करा
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# डेव्हलपमेंट URL नोंद करा
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# स्टेजिंग वातावरण तयार करा
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# स्टेजिंग URL नोंद करा
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# वातावरणांची तुलना करा
azd env list

# दोन्ही वातावरणांची चाचणी करा
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# दोन्ही साफ करा
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**यश निकष:**
- [ ] वेगवेगळ्या कॉन्फिगरेशनसह दोन वातावरण तयार केली गेली
- [ ] दोन्ही वातावरण यशस्वीपणे तैनात केली गेली
- [ ] `azd env select` वापरून वातावरणांमध्ये स्विच करता येते
- [ ] वातावरणांमध्ये वातावरण चल वेगळे आहेत
- [ ] दोन्ही वातावरण यशस्वीरीत्या साफ केली गेली

## 📊 आपली प्रगती

**लागलेला वेळ**: ~60-90 मिनिटे  
**प्राप्त कौशल्ये**:
- ✅ टेम्पलेट-आधारित प्रकल्प आरंभीकरण
- ✅ Azure संसाधन प्रोव्हिजनिंग
- ✅ अनुप्रयोग तैनाती कार्यप्रवाह
- ✅ वातावरण व्यवस्थापन
- ✅ कॉन्फिगरेशन व्यवस्थापन
- ✅ संसाधन क्लीनअप आणि खर्च व्यवस्थापन

**पुढील पायरी**: प्रगत कॉन्फिगरेशन पॅटर्न शिकण्यासाठी आपण [कॉन्फिगरेशन मार्गदर्शक](configuration.md) साठी तयार आहात!

## सामान्य समस्या निवारण

### प्रमाणीकरण त्रुटी
```bash
# Azure सह पुन्हा प्रमाणीकरण करा
az login

# सदस्यता प्रवेश सत्यापित करा
az account show
```

### तैनाती अयशस्वी
```bash
# डीबग लॉगिंग सक्षम करा
export AZD_DEBUG=true
azd up --debug

# Azure मध्ये अनुप्रयोग लॉग पहा
azd monitor --logs

# Container Apps साठी, Azure CLI वापरा:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### संसाधन नाव संघर्ष
```bash
# एक अद्वितीय एन्व्हायर्नमेंटचे नाव वापरा
azd env new dev-$(whoami)-$(date +%s)
```

### पोर्ट/नेटवर्क समस्या
```bash
# पोर्ट्स उपलब्ध आहेत का तपासा
netstat -an | grep :3000
netstat -an | grep :3100
```

## पुढील पावले

आता आपण आपला पहिला प्रकल्प पूर्ण केल्यामुळे, हे प्रगत विषय तपासा:

### 1. इन्फ्रास्ट्रक्चर सानुकूल करा
- [कोड म्हणून इन्फ्रास्ट्रक्चर](../chapter-04-infrastructure/provisioning.md)
- [डेटाबेस, स्टोरेज, आणि इतर सेवांचा समावेश करा](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD सेट करा
- [तैनाती मार्गदर्शक](../chapter-04-infrastructure/deployment-guide.md) - पूर्ण CI/CD कार्यप्रवाह
- [Azure Developer CLI दस्तऐवजीकरण](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - पाइपलाइन कॉन्फिगरेशन

### 3. उत्पादनासाठी उत्तम पद्धती
- [तैनाती मार्गदर्शक](../chapter-04-infrastructure/deployment-guide.md) - सुरक्षा, कार्यक्षमता आणि मॉनिटरिंग

### 4. अधिक टेम्पलेट्स शोधा
```bash
# वर्गानुसार साच्यांमधून ब्राउझ करा
azd template list --filter web
azd template list --filter api
azd template list --filter database

# विविध तंत्रज्ञान स्टॅक वापरून पहा
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## अतिरिक्त संसाधने

### अभ्यास सामग्री
- [Azure Developer CLI दस्तऐवजीकरण](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure आर्किटेक्चर केंद्र](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure वेल-आर्किटेक्टेड फ्रेमवर्क](https://learn.microsoft.com/en-us/azure/well-architected/)

### समुदाय व समर्थन
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer समुदाय](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### टेम्पलेट्स व उदाहरणे
- [अधिकृत टेम्पलेट गॅलरी](https://azure.github.io/awesome-azd/)
- [समुदाय टेम्पलेट्स](https://github.com/Azure-Samples/azd-templates)
- [एंटरप्राइझ पॅटर्न्स](https://github.com/Azure/azure-dev/tree/main/templates)

---

**आपला पहिला azd प्रकल्प पूर्ण केल्याबद्दल अभिनंदन!** आपण आता आत्मविश्वासाने Azure वर अद्भुत अनुप्रयोग तयार आणि तैनात करण्यासाठी तयार आहात.

---

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स मुख्यपृष्ठ**: [AZD नवीनांसाठी](../../README.md)
- **📖 सध्याचा अध्याय**: अध्याय 1 - पाया आणि जलद सुरूवात
- **⬅️ मागील**: [स्थापना व सेटअप](installation.md)
- **➡️ पुढे**: [कॉन्फिगरेशन](configuration.md)
- **🚀 पुढचा अध्याय**: [अध्याय 2: AI-प्रथम विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **पुढील धडा**: [तैनाती मार्गदर्शक](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
हा दस्तऐवज AI अनुवाद सेवा Co‑op Translator (https://github.com/Azure/co-op-translator) वापरून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात ठेवा की स्वयंचलित अनुवादांमध्ये त्रुटी किंवा अचूकतेचा अभाव असू शकतो. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत म्हणून मानला जावा. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी अनुवाद शिफारसीय आहे. या अनुवादाच्या वापरामुळे उद्भवलेल्या कोणत्याही गैरसमजुतींबद्दल किंवा चुकीच्या अर्थाबद्दल आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->