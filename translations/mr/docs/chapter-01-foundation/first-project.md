# आपला पहिला प्रकल्प - व्यावहारिक मार्गदर्शक

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 चालू अध्याय**: अध्याय 1 - मूलतत्त्वे आणि त्वरित प्रारंभ
- **⬅️ मागील**: [इंस्टॉलेशन आणि सेटअप](installation.md)
- **➡️ पुढील**: [कॉन्फिगरेशन](configuration.md)
- **🚀 पुढील अध्याय**: [अध्याय 2: AI-प्रथम विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)

## परिचय

आपल्या पहिल्या Azure Developer CLI प्रकल्पात आपले स्वागत आहे! हा संपूर्ण व्यावहारिक मार्गदर्शक azd वापरून Azure वर एक संपूर्ण स्टॅक अ‍ॅप्लिकेशन तयार करणे, तैनात करणे, आणि व्यवस्थापित करण्याचे पूर्ण मार्गदर्शन करतो. आपण React फ्रंटएंड, Node.js API बॅकएंड, आणि MongoDB डेटाबेस असलेले एक वास्तविक todo अनुप्रयोग वापरून काम कराल.

## शिकण्याचे लक्ष्य

हा ट्यूटोरियल पूर्ण केल्यानंतर आपण:
- टेम्प्लेट वापरून azd प्रकल्प प्रारंभ करण्याचा प्रवाह मास्टर करू शकता
- Azure Developer CLI प्रकल्प संरचना आणि कॉन्फिगरेशन फाइल्स समजू शकता
- इन्फ्रास्ट्रक्चर प्रोव्हिजनिंगसह Azure वर संपूर्ण अनुप्रयोगाची तैनाती करू शकता
- अनुप्रयोग अद्यतने आणि पुन:तैनात धोरणे अमलात आणू शकता
- विकास आणि स्टेजिंगसाठी अनेक वातावरणे व्यवस्थापित करु शकता
- संसाधन साफसफाई आणि खर्च व्यवस्थापन पद्धती लागू करू शकता

## शिकण्याचे निकाल

पूर्ण केल्यावर आपण सक्षम असाल:
- टेम्प्लेटमधून स्वयंपाकीपणे azd प्रकल्प प्रारंभ आणि कॉन्फिगर करणे
- azd प्रकल्प रचना प्रभावीपणे नेव्हिगेट आणि सुधारणा करणे
- एकाच आदेशाने Azure वर संपूर्ण स्टॅक अ‍ॅप्लिकेशन्स तैनात करणे
- सामान्य तैनाती समस्या आणि प्रमाणीकरण समस्या निराकरण करणे
- वेगवेगळ्या तैनाती टप्प्यांसाठी अनेक Azure वातावरणे व्यवस्थापित करणे
- अनुप्रयोग अद्यतने करण्यासाठी सतत तैनाती कार्यप्रवाह अमलात आणणे

## सुरुवात

### आवश्यक वस्तू यादी
- ✅ Azure Developer CLI स्थापित ([इंस्टॉलेशन मार्गदर्शक](installation.md))
- ✅ Azure CLI स्थापित आणि प्रमाणीकरण केलेले
- ✅ Git आपल्या प्रणालीवर स्थापित
- ✅ Node.js 16+ (या ट्यूटोरियलसाठी)
- ✅ Visual Studio Code (शिफारस केलेले)

### आपला सेटअप तपासा
```bash
# azd इंस्टॉलेशन तपासा
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

## टप्पा 1: टेम्प्लेट निवडा आणि प्रारंभ करा

चला एक लोकप्रिय todo अनुप्रयोग टेम्प्लेट वापरून सुरुवात करूया ज्यामध्ये React फ्रंटएंड आणि Node.js API बॅकएंड आहे.

```bash
# उपलब्ध टेम्पलेट्स ब्राउज करा
azd template list

# टूडू अॅप टेम्पलेट प्रारंभ करा
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# सूचनांचे अनुसरण करा:
# - एक पर्यावरण नाव प्रविष्ट करा: "dev"
# - सदस्यता निवडा (जर तुमच्याकडे अनेक असतील तर)
# - एक प्रदेश निवडा: "पूर्व US 2" (किंवा तुमचा पसंतीचा प्रदेश)
```

### काय घडले?
- टेम्प्लेट कोड आपल्या स्थानिक डिरेक्टरीमध्ये डाउनलोड केला
- `azure.yaml` फाइल सेवा व्याख्यांसह तयार केली
- `infra/` निर्देशिकेत इन्फ्रास्ट्रक्चर कोड सेटअप केला
- एक वातावरण कॉन्फिगरेशन तयार केले

## टप्पा 2: प्रकल्प रचना तपासा

आपण पाहूया azd ने आपल्यासाठी काय तयार केले आहे:

```bash
# प्रकल्प संरचना पहा
tree /f   # विंडोज
# किंवा
find . -type f | head -20   # मॅकओएस/लिनक्स
```

आपण पाहाल:
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

### समजून घ्यायच्या महत्त्वाच्या फाइल्स

**azure.yaml** - आपल्या azd प्रकल्पाचा हृदय:
```bash
# प्रकल्प संरचना पहा
cat azure.yaml
```

**infra/main.bicep** - इन्फ्रास्ट्रक्चर व्याख्या:
```bash
# पायाभूत संरचना कोड पहा
head -30 infra/main.bicep
```

## टप्पा 3: आपला प्रकल्प सानुकूलित करा (पर्यायी)

तैनात करण्यापूर्वी, आपण अनुप्रयोग सानुकूलित करू शकता:

### फ्रंटएंडमध्ये बदल करा
```bash
# React अॅप कॉम्पोनंट उघडा
code src/web/src/App.tsx
```

साधा बदल करा:
```typescript
// शीर्षक शोधा आणि ते बदला
<h1>My Awesome Todo App</h1>
```

### पर्यावरणीय चल कॉन्फिगर करा
```bash
# सानुकूल वातावरण चल सेट करा
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# सर्व वातावरण चल पहा
azd env get-values
```

## टप्पा 4: Azure वर तैनात करा

आता मनोरंजक भाग - सगळं Azure वर तैनात करा!

```bash
# पाया आणि अनुप्रयोग तैनात करा
azd up

# हा आदेश खालील कार्य करेल:
# 1. Azure संसाधने तैनात करा (App Service, Cosmos DB, इ.)
# 2. आपले अनुप्रयोग तयार करा
# 3. तैनात केलेल्या संसाधनांवर तैनात करा
# 4. अनुप्रयोग URL दर्शवा
```

### तैनाती दरम्यान काय होते?

`azd up` कमांड खालील पावले पार पडते:
1. **प्रोव्हिजन** (`azd provision`) - Azure संसाधने तयार करणे
2. **पॅकेज** - आपला अनुप्रयोग कोड तयार करणे
3. **तैनात करा** (`azd deploy`) - Azure संसाधनांवर कोड तैनात करणे

### अपेक्षित परिणाम
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## टप्पा 5: आपला अनुप्रयोग तपासा

### आपला अनुप्रयोग वापरा
तैनाती आउटपुटमध्ये दिलेला URL क्लिक करा किंवा कधीही मिळवा:
```bash
# अर्जाच्या अंतिम बिंदूंना मिळवा
azd show

# आपल्या ब्राउझरमध्ये अर्ज उघडा
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo अॅप चाचणी करा
1. **todo आयटम जोडा** - "Add Todo" क्लिक करून कार्य प्रविष्ट करा
2. **पूर्ण झाल्यास मार्क करा** - पूर्ण झालेले आयटम तपासा
3. **आयटम हटवा** - आवश्यकता नसलेले todo वगळा

### आपला अनुप्रयोग मॉनिटर करा
```bash
# आपल्या संसाधनांसाठी Azure पोर्टल उघडा
azd monitor

# अनुप्रयोग लॉग पहा
azd monitor --logs

# थेट मेट्रिक्स पहा
azd monitor --live
```

## टप्पा 6: बदल करा आणि पुन्हा तैनात करा

चला एक बदल करूया आणि पाहूया अपडेट करणे किती सोपे आहे:

### API मध्ये बदल करा
```bash
# API कोड संपादित करा
code src/api/src/routes/lists.js
```

कस्टम प्रतिसाद हेडर जोडा:
```javascript
// एक रूट हँडलर शोधा आणि जोडा:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### फक्त कोड बदल तैनात करा
```bash
# फक्त अनुप्रयोग कोड तैनात करा (इन्फ्रास्ट्रक्चर वगळा)
azd deploy

# हे 'azd up' पेक्षा खूप जलद आहे कारण इन्फ्रास्ट्रक्चर आधीच अस्तित्वात आहे
```

## टप्पा 7: अनेक वातावरण व्यवस्थापित करा

उत्पादनापूर्वी बदल तपासण्यासाठी स्टेजिंग वातावरण तयार करा:

```bash
# नवीन स्टेजिंग वातावरण तयार करा
azd env new staging

# स्टेजिंगवर तैनात करा
azd up

# परत डेव्ह वातावरणावर जा
azd env select dev

# सर्व वातावरणांची यादी करा
azd env list
```

### वातावरण तुलना
```bash
# विकास पर्यावरण पहा
azd env select dev
azd show

# साचणी पर्यावरण पहा
azd env select staging
azd show
```

## टप्पा 8: संसाधने साफ करा

प्रयोग पूर्ण झाल्यावर, सतत होणाऱ्या शुल्कांपासून वाचण्यासाठी साफसफाई करा:

```bash
# चालू पर्यावरणासाठी सर्व Azure संसाधने हटवा
azd down

# पुष्टीशिवाय जबरदस्तीने हटवा आणि मृदू हटवलेली संसाधने पुरी करा
azd down --force --purge

# विशिष्ट पर्यावरण हटवा
azd env select staging
azd down --force --purge
```

## पारंपारिक अॅप vs. AI-सक्षम अॅप: समान कार्यप्रवाह

आपण नुकताच पारंपारिक वेब अॅप्लिकेशन तैनात केले. पण आपण AI-सक्षम अॅप, जसे Microsoft Foundry Models द्वारे समर्थित चॅट अनुप्रयोग तैनात करू इच्छित असाल तर?

चांगली बातमी: **कार्यप्रवाह अगदी समान आहे.**

| टप्पा | पारंपारिक Todo अॅप | AI चॅट अॅप |
|------|---------------------|-------------|
| प्रारंभ करा | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| प्रमाणीकरण | `azd auth login` | `azd auth login` |
| तैनात करा | `azd up` | `azd up` |
| मॉनिटर करा | `azd monitor` | `azd monitor` |
| साफ करा | `azd down --force --purge` | `azd down --force --purge` |

फक्त फरक म्हणजे आपण कोणत्या **टेम्प्लेट** पासून सुरू करता. AI टेम्प्लेटमध्ये अतिरिक्त इन्फ्रास्ट्रक्चर असते (जसे Microsoft Foundry Models संसाधन किंवा AI Search निर्देशांक), पण azd हे सगळं आपल्यासाठी हाताळतो. नवीन आदेश शिकण्याची, वेगळे साधन स्वीकारण्याची किंवा तैनातीबाबत विचार करण्याची गरज नाही.

हे azd चे मुख्य तत्त्व आहे: **एक कार्यप्रवाह, कोणतीही कार्यभार.** या ट्यूटोरियलमध्ये आपण सराव केलेल्या कौशल्यांचा वापर - प्रारंभ करणे, तैनात करणे, मॉनिटर करणे, पुन:तैनात करणे, आणि साफसफाई करणे - AI अनुप्रयोगांनाही समान रीतीने लागू होतो.

---

## आपल्याला काय समजले

अभिनंदन! आपण यशस्वीपणे:
- ✅ टेम्प्लेटमधून azd प्रकल्प प्रारंभ केला
- ✅ प्रकल्प रचना आणि मुख्य फाइल्स तपासल्या
- ✅ Azure वर संपूर्ण स्टॅक अनुप्रयोग तैनात केला
- ✅ कोडमध्ये बदल केले आणि पुन:तैनात केले
- ✅ अनेक वातावरणे व्यवस्थापित केली
- ✅ संसाधने साफ केली

## 🎯 कौशल्य पडताळणी सराव

### सराव 1: वेगळा टेम्प्लेट तैनात करा (15 मिनिटे)
**लक्ष्य:** azd init आणि तैनाती कार्यप्रवाहाचा प्रभुत्व सिद्ध करा

```bash
# Python + MongoDB स्टॅक वापरून पहा
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# वितरणाची पडताळणी करा
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# साफसफाई करा
azd down --force --purge
```

**यशाची निकषे:**
- [ ] अनुप्रयोग त्रुटीशिवाय तैनात होतो
- [ ] ब्राउझरमध्ये अनुप्रयोग URL प्रवेश करता येतो
- [ ] अनुप्रयोग योग्य कार्य करतो (todo आयटम जोडा/काढा)
- [ ] सर्व संसाधने यशस्वीपणे साफ केली गेली

### सराव 2: कॉन्फिगरेशन सानुकूलित करा (20 मिनिटे)
**लक्ष्य:** पर्यावरण चल कॉन्फिगरेशनचा सराव करा

```bash
cd my-first-azd-app

# सानुकूल वातावरण तयार करा
azd env new custom-config

# सानुकूल चल मांडणे
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# चल तपासा
azd env get-values | grep APP_TITLE

# सानुकूल संरचनेसह तैनात करा
azd up
```

**यशाची निकषे:**
- [ ] कस्टम वातावरण यशस्वी तयार झाले
- [ ] वातावरणीय चल सेट आणि पुनःप्राप्त करता येतात
- [ ] अनुप्रयोग कस्टम कॉन्फिगरेशनसह तैनात केला
- [ ] तैनात अ‍ॅपमध्ये कस्टम सेटिंग्ज तपासू शकता

### सराव 3: बहु-वातावरण कार्यप्रवाह (25 मिनिटे)
**लक्ष्य:** वातावरण व्यवस्थापन आणि तैनाती धोरणे मास्टर करा

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

# दोन्ही साफ करा
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**यशाची निकषे:**
- [ ] भिन्न कॉन्फिगरेशनसह दोन वातावरणे तयार केले
- [ ] दोन्ही वातावरणे यशस्वीपणे तैनात केली
- [ ] `azd env select` वापरून वातावरणे बदलू शकता
- [ ] वातावरणीय चल वातावरणांनुसार वेगवेगळे आहेत
- [ ] दोन्ही वातावरणे यशस्वीपणे साफ केली

## 📊 आपली प्रगती

**गेल गेलेला वेळ**: ~60-90 मिनिटे  
**स्वीकृत कौशल्ये**:
- ✅ टेम्प्लेट-आधारित प्रकल्प प्रारंभ
- ✅ Azure संसाधन प्रोव्हिजनिंग
- ✅ अनुप्रयोग तैनाती कार्यप्रवाह
- ✅ वातावरण व्यवस्थापन
- ✅ कॉन्फिगरेशन व्यवस्थापन
- ✅ संसाधन साफसफाई आणि खर्च व्यवस्थापन

**पुढील पायरी**: आपण [कॉन्फिगरेशन मार्गदर्शक](configuration.md) यासाठी तयार आहात ज्याने प्रगत कॉन्फिगरेशन पॅटर्न शिकू शकता!

## सामान्य समस्या निराकरण

### प्रमाणीकरण त्रुटी
```bash
# Azure सह पुन्हा प्रमाणीकरण करा
az login

# सदस्यता प्रवेश सत्यापित करा
az account show
```

### तैनाती अपयश
```bash
# डीबग लॉगिंग सक्षम करा
export AZD_DEBUG=true
azd up --debug

# Azure मध्ये अनुप्रयोग लॉग पहा
azd monitor --logs

# कंटेनर अ‍ॅप्ससाठी, Azure CLI वापरा:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### संसाधन नाव संघर्ष
```bash
# एक अद्वितीय पर्यावरण नाव वापरा
azd env new dev-$(whoami)-$(date +%s)
```

### पोर्ट/नेटवर्क समस्या
```bash
# पोर्ट उपलब्ध आहेत का ते तपासा
netstat -an | grep :3000
netstat -an | grep :3100
```

## पुढील पावले

आपला पहिला प्रकल्प पूर्ण केल्यावर, या प्रगत विषयांचा अभ्यास करा:

### 1. इन्फ्रास्ट्रक्चर सानुकूलित करा
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [डेटाबेस, संग्रहण आणि इतर सेवा जोडा](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD सेट अप करा
- [तैनाती मार्गदर्शक](../chapter-04-infrastructure/deployment-guide.md) - संपूर्ण CI/CD कार्यप्रवाह
- [Azure Developer CLI दस्तऐवज](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - पाइपलाइन कॉन्फिगरेशन

### 3. उत्पादनासाठी सर्वोत्तम पद्धती
- [तैनाती मार्गदर्शक](../chapter-04-infrastructure/deployment-guide.md) - सुरक्षा, कार्यक्षमता, आणि मॉनिटरिंग

### 4. अधिक टेम्प्लेट्स शोधा
```bash
# श्रेणीनुसार साच्यांचा ब्राउझ करा
azd template list --filter web
azd template list --filter api
azd template list --filter database

# वेगवेगळ्या तंत्रज्ञान संचांचा प्रयत्न करा
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## अतिरिक्त संसाधने

### शिकण्याची सामग्री
- [Azure Developer CLI दस्तऐवज](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure आर्किटेक्चर सेंटर](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure वेल-आर्किटेक्चर्ड फ्रेमवर्क](https://learn.microsoft.com/en-us/azure/well-architected/)

### समुदाय व समर्थन
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer समुदाय](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### टेम्प्लेट्स आणि उदाहरणे
- [ऑफिशियल टेम्प्लेट गॅलरी](https://azure.github.io/awesome-azd/)
- [समुदाय टेम्प्लेट्स](https://github.com/Azure-Samples/azd-templates)
- [एंटरप्राइज पॅटर्न्स](https://github.com/Azure/azure-dev/tree/main/templates)

---

**आपला पहिला azd प्रकल्प पूर्ण केल्याबद्दल अभिनंदन!** आपण आता आत्मविश्वासाने Azure वर अद्भुत अनुप्रयोग तयार आणि तैनात करण्यासाठी तयार आहात.

---

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 चालू अध्याय**: अध्याय 1 - मूलतत्त्वे आणि त्वरित प्रारंभ
- **⬅️ मागील**: [इंस्टॉलेशन आणि सेटअप](installation.md)
- **➡️ पुढील**: [कॉन्फिगरेशन](configuration.md)
- **🚀 पुढील अध्याय**: [अध्याय 2: AI-प्रथम विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **पुढील धडा**: [तैनाती मार्गदर्शक](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
हा दस्तऐवज AI भाषांतर सेवेचा वापर करून भाषांतरित केला आहे [Co-op Translator](https://github.com/Azure/co-op-translator). आम्ही अचूकतेसाठी प्रयत्नशील असल्यासही, कृपया लक्षात घ्या की स्वयंचलित भाषांतरात त्रुटी किंवा चुका असू शकतात. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे निर्माण झालेल्या कोणत्याही गैरस्पष्टीकरण किंवा चुकीच्या समजुतींसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->