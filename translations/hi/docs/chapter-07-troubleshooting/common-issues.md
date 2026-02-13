# सामान्य समस्याएँ और समाधान

**अध्याय नेविगेशन:**
- **📚 Course Home**: [AZD शुरुआती के लिए](../../README.md)
- **📖 Current Chapter**: अध्याय 7 - समस्या निवारण और डिबगिंग
- **⬅️ Previous Chapter**: [अध्याय 6: प्री-फ्लाइट जाँच](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Next**: [डिबगिंग गाइड](debugging.md)
- **🚀 Next Chapter**: [अध्याय 8: प्रोडक्शन और एंटरप्राइज़ पैटर्न](../chapter-08-production/production-ai-practices.md)

## परिचय

यह व्यापक ट्रबलशूटिंग गाइड Azure Developer CLI का उपयोग करते समय सबसे अधिक सामना की जाने वाली समस्याओं को कवर करती है। प्रमाणिकरण, डिप्लॉयमेंट, इन्फ्रास्ट्रक्चर प्रोविज़निंग, और एप्लिकेशन कॉन्फ़िगरेशन से संबंधित सामान्य समस्याओं का निदान, ट्रबलशूटिंग, और समाधान करना सीखें। प्रत्येक समस्या में विस्तृत लक्षण, मूल कारण, और चरण-दर-चरण समाधान प्रक्रियाएँ शामिल हैं।

## सीखने के लक्ष्य

इस गाइड को पूरा करके, आप:
- Azure Developer CLI समस्याओं के लिए निदान तकनीकों में महारत हासिल करेंगे
- सामान्य प्रमाणिकरण और अनुमति संबंधी समस्याओं तथा उनके समाधानों को समझेंगे
- डिप्लॉयमेंट विफलताओं, इन्फ्रास्ट्रक्चर प्रोविज़निंग त्रुटियों, और कॉन्फ़िगरेशन समस्याओं को हल करेंगे
- प्रोएक्टिव मॉनिटरिंग और डिबगिंग रणनीतियाँ लागू करेंगे
- जटिल समस्याओं के लिए व्यवस्थित ट्रबलशूटिंग पद्धतियाँ लागू करेंगे
- भविष्य की समस्याओं को रोकने के लिए उचित लॉगिंग और मॉनिटरिंग कॉन्फ़िगर करेंगे

## सीखने के परिणाम

समाप्ति पर, आप सक्षम होंगे:
- बिल्ट-इन डायग्नोस्टिक टूल्स का उपयोग करके Azure Developer CLI समस्याओं का निदान करने के लिए
- प्रमाणिकरण, सब्सक्रिप्शन, और अनुमति-संबंधी समस्याओं को स्वतंत्र रूप से हल करने के लिए
- डिप्लॉयमेंट विफलताओं और इन्फ्रास्ट्रक्चर प्रोविज़निंग त्रुटियों का प्रभावी ढंग से ट्रबलशूट करने के लिए
- एप्लिकेशन कॉन्फ़िगरेशन समस्याओं और पर्यावरण-विशिष्ट समस्याओं को डिबग करने के लिए
- संभावित मुद्दों की प्रोएक्टिव पहचान के लिए मॉनिटरिंग और अलर्टिंग लागू करने के लिए
- लॉगिंग, डिबगिंग, और समस्या समाधान वर्कफ़्लो के लिए सर्वोत्तम प्रथाओं को लागू करने के लिए

## त्वरित डायग्नोस्टिक्स

विशिष्ट समस्याओं में जाने से पहले, डायग्नोस्टिक जानकारी एकत्र करने के लिए ये कमांड चलाएँ:

```bash
# azd संस्करण और स्वास्थ्य की जाँच करें
azd version
azd config list

# Azure प्रमाणीकरण सत्यापित करें
az account show
az account list

# वर्तमान वातावरण जाँचें
azd env show
azd env get-values

# डिबग लॉगिंग सक्षम करें
export AZD_DEBUG=true
azd <command> --debug
```

## प्रमाणीकरण समस्याएँ

### समस्या: "एक्सेस टोकन प्राप्त करने में विफल"
**लक्षण:**
- `azd up` प्रमाणिकरण त्रुटियों के साथ असफल होता है
- कमांड्स "unauthorized" या "access denied" लौटाती हैं

**समाधान:**
```bash
# 1. Azure CLI के साथ फिर से प्रमाणीकृत करें
az login
az account show

# 2. कैश किए गए प्रमाण-पत्र हटाएँ
az account clear
az login

# 3. डिवाइस कोड फ्लो का उपयोग करें (हेडलैस सिस्टम्स के लिए)
az login --use-device-code

# 4. निर्दिष्ट सब्सक्रिप्शन सेट करें
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### समस्या: डिप्लॉयमेंट के दौरान "पर्याप्त विशेषाधिकार नहीं"
**लक्षण:**
- डिप्लॉयमेंट अनुमति त्रुटियों के साथ विफल होता है
- कुछ Azure संसाधन नहीं बनाए जा सकते

**समाधान:**
```bash
# 1. अपने Azure रोल असाइनमेंट की जाँच करें
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. सुनिश्चित करें कि आपके पास आवश्यक भूमिकाएँ हैं
# - Contributor (संसाधन बनाने के लिए)
# - User Access Administrator (रोल असाइनमेंट के लिए)

# 3. उचित अनुमतियों के लिए अपने Azure व्यवस्थापक से संपर्क करें
```

### समस्या: मल्टी-टेनेंट प्रमाणीकरण समस्याएँ
**समाधान:**
```bash
# 1. किसी विशेष टेनेंट के साथ लॉग इन करें
az login --tenant "your-tenant-id"

# 2. कॉन्फ़िगरेशन में टेनेंट सेट करें
azd config set auth.tenantId "your-tenant-id"

# 3. यदि टेनेंट बदल रहे हैं तो टेनेंट कैश साफ़ करें
az account clear
```

## 🏗️ इन्फ्रास्ट्रक्चर प्रोविज़निंग त्रुटियाँ

### समस्या: संसाधन नाम संघर्ष
**लक्षण:**
- "The resource name already exists" त्रुटियाँ
- संसाधन निर्माण के दौरान डिप्लॉयमेंट विफल होता है

**समाधान:**
```bash
# 1. टोकन के साथ अद्वितीय संसाधन नामों का उपयोग करें
# अपने Bicep टेम्पलेट में:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. पर्यावरण का नाम बदलें
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. मौजूदा संसाधनों की सफाई करें
azd down --force --purge
```

### समस्या: स्थान/क्षेत्र उपलब्ध नहीं है
**लक्षण:**
- "The location 'xyz' is not available for resource type"
- चुने गए क्षेत्र में कुछ SKUs उपलब्ध नहीं हैं

**समाधान:**
```bash
# 1. संसाधन प्रकारों के लिए उपलब्ध स्थानों की जाँच करें
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. आमतौर पर उपलब्ध क्षेत्रों का उपयोग करें
azd config set defaults.location eastus2
# या
azd env set AZURE_LOCATION eastus2

# 3. क्षेत्र के अनुसार सेवा उपलब्धता की जाँच करें
# देखें: https://azure.microsoft.com/global-infrastructure/services/
```

### समस्या: कोटा पार होने की त्रुटियाँ
**लक्षण:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**समाधान:**
```bash
# 1. वर्तमान कोटा उपयोग की जाँच करें
az vm list-usage --location eastus2 -o table

# 2. Azure पोर्टल के माध्यम से कोटा वृद्धि का अनुरोध करें
# पर जाएँ: Subscriptions > Usage + quotas

# 3. विकास के लिए छोटे SKUs का उपयोग करें
# main.parameters.json में:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. अप्रयुक्त संसाधनों को साफ़ करें
az resource list --query "[?contains(name, 'unused')]" -o table
```

### समस्या: Bicep टेम्पलेट त्रुटियाँ
**लक्षण:**
- टेम्पलेट सत्यापन विफलताएँ
- Bicep फ़ाइलों में सिंटैक्स त्रुटियाँ

**समाधान:**
```bash
# 1. Bicep वाक्यविन्यास को सत्यापित करें
az bicep build --file infra/main.bicep

# 2. Bicep लिंटर का उपयोग करें
az bicep lint --file infra/main.bicep

# 3. पैरामीटर फ़ाइल के वाक्यविन्यास की जाँच करें
cat infra/main.parameters.json | jq '.'

# 4. परिनियोजन परिवर्तनों का पूर्वावलोकन करें
azd provision --preview
```

## 🚀 डिप्लॉयमेंट विफलताएँ

### समस्या: बिल्ड विफलताएँ
**लक्षण:**
- डिप्लॉयमेंट के दौरान एप्लिकेशन बिल्ड नहीं होता
- पैकेज इंस्टॉलेशन त्रुटियाँ

**समाधान:**
```bash
# 1. डिबग फ़्लैग के साथ बिल्ड आउटपुट की जाँच करें
azd deploy --service web --debug

# 2. तैनात सेवा की स्थिति देखें
azd show

# 3. स्थानीय रूप से बिल्ड का परीक्षण करें
cd src/web
npm install
npm run build

# 3. Node.js और Python के संस्करणों की संगतता जांचें
node --version  # azure.yaml सेटिंग्स से मेल खानी चाहिए
python --version

# 4. बिल्ड कैश साफ़ करें
rm -rf node_modules package-lock.json
npm install

# 5. यदि कंटेनरों का उपयोग कर रहे हैं तो Dockerfile जांचें
docker build -t test-image .
docker run --rm test-image
```

### समस्या: कंटेनर डिप्लॉयमेंट विफलताएँ
**लक्षण:**
- कंटेनर एप्लिकेशन शुरू नहीं होते
- इमेज पुल त्रुटियाँ

**समाधान:**
```bash
# 1. स्थानीय रूप से Docker बिल्ड का परीक्षण करें
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Azure CLI का उपयोग करके कंटेनर लॉग्स जांचें
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. azd के माध्यम से एप्लिकेशन की निगरानी करें
azd monitor --logs

# 3. कंटेनर रजिस्ट्री तक पहुँच सत्यापित करें
az acr login --name myregistry

# 4. कंटेनर ऐप कॉन्फ़िगरेशन की जांच करें
az containerapp show --name my-app --resource-group my-rg
```

### समस्या: डेटाबेस कनेक्शन विफलताएँ
**लक्षण:**
- एप्लिकेशन डेटाबेस से कनेक्ट नहीं कर पाती
- कनेक्शन टाइमआउट त्रुटियाँ

**समाधान:**
```bash
# 1. डेटाबेस फ़ायरवॉल नियमों की जाँच करें
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. एप्लिकेशन से कनेक्टिविटी की जाँच करें
# अपने ऐप में अस्थायी रूप से जोड़ें:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. कनेक्शन स्ट्रिंग के प्रारूप की पुष्टि करें
azd env get-values | grep DATABASE

# 4. डेटाबेस सर्वर की स्थिति की जाँच करें
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 कॉन्फ़िगरेशन समस्याएँ

### समस्या: एनवायरनमेंट वेरिएबल काम नहीं कर रहे
**लक्षण:**
- ऐप कॉन्फ़िगरेशन मान पढ़ नहीं पाती
- एनवायरनमेंट वेरिएबल खाली दिखती हैं

**समाधान:**
```bash
# 1. सुनिश्चित करें कि पर्यावरण चर सेट हैं
azd env get-values
azd env get DATABASE_URL

# 2. azure.yaml में चर के नाम जांचें
cat azure.yaml | grep -A 5 env:

# 3. एप्लिकेशन को पुनरारंभ करें
azd deploy --service web

# 4. ऐप सर्विस कॉन्फ़िगरेशन जांचें
az webapp config appsettings list --name myapp --resource-group myrg
```

### समस्या: SSL/TLS प्रमाणपत्र समस्याएँ
**लक्षण:**
- HTTPS काम नहीं कर रहा
- प्रमाणपत्र सत्यापन त्रुटियाँ

**समाधान:**
```bash
# 1. SSL प्रमाणपत्र की स्थिति जांचें
az webapp config ssl list --resource-group myrg

# 2. केवल HTTPS सक्षम करें
az webapp update --name myapp --resource-group myrg --https-only true

# 3. कस्टम डोमेन जोड़ें (यदि आवश्यक हो)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### समस्या: CORS कॉन्फ़िगरेशन समस्याएँ
**लक्षण:**
- फ्रंटएंड API को कॉल नहीं कर पाता
- क्रॉस-ओरिजिन अनुरोध अवरुद्ध

**समाधान:**
```bash
# 1. App Service के लिए CORS कॉन्फ़िगर करें
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. CORS को संभालने के लिए API को अपडेट करें
# Express.js में:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. जांचें कि यह सही URL पर चल रहा है या नहीं
azd show
```

## 🌍 पर्यावरण प्रबंधन समस्याएँ

### समस्या: पर्यावरण स्विचिंग समस्याएँ
**लक्षण:**
- गलत एनवायरनमेंट उपयोग में है
- कॉन्फ़िगरेशन सही ढंग से स्विच नहीं हो रही

**समाधान:**
```bash
# 1. सभी वातावरणों की सूची बनाएं
azd env list

# 2. स्पष्ट रूप से वातावरण चुनें
azd env select production

# 3. वर्तमान वातावरण सत्यापित करें
azd env show

# 4. यदि दूषित हो तो नया वातावरण बनाएं
azd env new production-new
azd env select production-new
```

### समस्या: एनवायरनमेंट भ्रष्ट होना
**लक्षण:**
- एनवायरनमेंट अवैध स्थिति दिखाता है
- संसाधन कॉन्फ़िगरेशन से मेल नहीं खाते

**समाधान:**
```bash
# 1. पर्यावरण की स्थिति को ताज़ा करें
azd env refresh

# 2. पर्यावरण विन्यास को रीसेट करें
azd env new production-reset
# आवश्यक पर्यावरण चर कॉपी करें
azd env set DATABASE_URL "your-value"

# 3. मौजूदा संसाधनों को आयात करें (यदि संभव हो)
# संसाधन आईडी के साथ .azure/production/config.json को मैन्युअल रूप से अपडेट करें
```

## 🔍 प्रदर्शन समस्याएँ

### समस्या: डिप्लॉयमेंट समय धीमा होना
**लक्षण:**
- डिप्लॉयमेंट में बहुत समय लग रहा है
- डिप्लॉयमेंट के दौरान टाइमआउट्स

**समाधान:**
```bash
# 1. तेज़ पुनरावृत्ति के लिए विशिष्ट सेवाओं को तैनात करें
azd deploy --service web
azd deploy --service api

# 2. जब इन्फ्रास्ट्रक्चर अपरिवर्तित हो तो केवल कोड-आधारित तैनाती का उपयोग करें
azd deploy  # azd up से तेज़

# 3. बिल्ड प्रक्रिया को अनुकूलित करें
# package.json में:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. संसाधन स्थानों की जाँच करें (उसी क्षेत्र का उपयोग करें)
azd config set defaults.location eastus2
```

### समस्या: एप्लिकेशन प्रदर्शन समस्याएँ
**लक्षण:**
- धीमी प्रतिक्रिया समय
- उच्च संसाधन उपयोग

**समाधान:**
```bash
# 1. संसाधनों को बढ़ाएँ
# main.parameters.json में SKU अपडेट करें:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Application Insights निगरानी सक्षम करें
azd monitor --overview

# 3. Azure में एप्लिकेशन लॉग्स जांचें
az webapp log tail --name myapp --resource-group myrg
# या Container Apps के लिए:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. कैशिंग लागू करें
# अपनी इन्फ्रास्ट्रक्चर में Redis कैश जोड़ें
```

## 🛠️ ट्रबलशूटिंग टूल और कमांड्स

### डिबग कमांड्स
```bash
# व्यापक डिबगिंग
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# azd संस्करण जांचें
azd version

# वर्तमान कॉन्फ़िगरेशन देखें
azd config list

# कनेक्टिविटी का परीक्षण करें
curl -v https://myapp.azurewebsites.net/health
```

### लॉग विश्लेषण
```bash
# Azure CLI के माध्यम से एप्लिकेशन लॉग
az webapp log tail --name myapp --resource-group myrg

# azd के साथ एप्लिकेशन की निगरानी
azd monitor --logs
azd monitor --live

# Azure संसाधन लॉग
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# कंटेनर लॉग (Container Apps के लिए)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### संसाधन जांच
```bash
# सभी संसाधनों को सूचीबद्ध करें
az resource list --resource-group myrg -o table

# संसाधन की स्थिति जांचें
az webapp show --name myapp --resource-group myrg --query state

# नेटवर्क निदान
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 अतिरिक्त सहायता प्राप्त करना

### कब एस्केलेट करें
- सभी समाधानों को आजमाने के बाद भी प्रमाणीकरण संबंधी समस्याएँ बनी रहें
- Azure सेवाओं के साथ इन्फ्रास्ट्रक्चर समस्याएँ
- बिलिंग या सबस्क्रिप्शन-संबंधी समस्याएँ
- सुरक्षा चिंताएँ या घटनाएँ

### सपोर्ट चैनल
```bash
# 1. Azure Service Health की जाँच करें
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Azure समर्थन टिकट बनाएं
# पर जाएँ: https://portal.azure.com -> सहायता + समर्थन

# 3. सामुदायिक संसाधन
# - Stack Overflow: azure-developer-cli टैग
# - GitHub इश्यूज़: https://github.com/Azure/azure-dev/issues
# - Microsoft प्रश्नोत्तर: https://learn.microsoft.com/en-us/answers/
```

### एकत्र करने के लिये जानकारी
सपोर्ट से संपर्क करने से पहले, एकत्र करें:
- `azd version` आउटपुट
- `azd config list` आउटपुट
- `azd show` आउटपुट (वर्तमान डिप्लॉयमेंट स्थिति)
- त्रुटि संदेश (पूर्ण टेक्स्ट)
- समस्या को पुन: उत्पन्न करने के चरण
- एनवायरनमेंट विवरण (`azd env show`)
- समस्या कब शुरू हुई की समयरेखा

### लॉग संग्रह स्क्रिप्ट
```bash
#!/बिन/बाश
# डिबग-जानकारी-संग्रह.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 समस्या रोकथाम

### प्री-डिप्लॉयमेंट चेकलिस्ट
```bash
# 1. प्रमाणीकरण सत्यापित करें
az account show

# 2. कोटा और सीमाओं की जाँच करें
az vm list-usage --location eastus2

# 3. टेम्पलेट्स सत्यापित करें
az bicep build --file infra/main.bicep

# 4. पहले स्थानीय रूप से परीक्षण करें
npm run build
npm run test

# 5. ड्राई-रन तैनाती का उपयोग करें
azd provision --preview
```

### मॉनिटरिंग सेटअप
```bash
# Application Insights सक्षम करें
# main.bicep में जोड़ें:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# अलर्ट सेट करें
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### नियमित रखरखाव
```bash
# साप्ताहिक स्वास्थ्य जांचें
./scripts/health-check.sh

# मासिक लागत समीक्षा
az consumption usage list --billing-period-name 202401

# त्रैमासिक सुरक्षा समीक्षा
az security assessment list --resource-group myrg
```

## संबंधित संसाधन

- [डिबगिंग गाइड](debugging.md) - उन्नत डिबगिंग तकनीकें
- [संसाधन प्रोविज़निंग](../chapter-04-infrastructure/provisioning.md) - इन्फ्रास्ट्रक्चर समस्या निवारण
- [क्षमता नियोजन](../chapter-06-pre-deployment/capacity-planning.md) - संसाधन नियोजन मार्गदर्शन
- [SKU चयन](../chapter-06-pre-deployment/sku-selection.md) - सेवा स्तर अनुशंसाएँ

---

**टिप**: इस गाइड को बुकमार्क करके रखें और जब भी आपको समस्याएँ हों तो इसका संदर्भ लें। अधिकांश समस्याएँ पहले देखी जा चुकी हैं और उनके स्थापित समाधान मौजूद हैं!

---

**नेविगेशन**
- **Previous Lesson**: [संसाधन प्रोविज़निंग](../chapter-04-infrastructure/provisioning.md)
- **Next Lesson**: [डिबगिंग गाइड](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यह दस्तावेज़ एआई अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। हालाँकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ को उसकी मूल भाषा में आधिकारिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए पेशेवर मानव अनुवाद की सलाह दी जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->