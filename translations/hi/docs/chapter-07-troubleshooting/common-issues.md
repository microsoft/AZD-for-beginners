# सामान्य मुद्दे और समाधान

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 7 - समस्या निवारण और डीबगिंग
- **⬅️ पिछला अध्याय**: [अध्याय 6: प्री-फ्लाइट चेक्स](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ अगला**: [डीबगिंग गाइड](debugging.md)
- **🚀 अगला अध्याय**: [अध्याय 8: प्रोडक्शन और एंटरप्राइज पैटर्न](../chapter-08-production/production-ai-practices.md)

## परिचय

यह व्यापक समस्या निवारण गाइड Azure Developer CLI उपयोग करते समय सबसे सामान्य रूप से आने वाली समस्याओं को कवर करता है। प्रमाणीकरण, तैनाती, अवसंरचना प्रावधान, और एप्लिकेशन कॉन्फ़िगरेशन से जुड़ी सामान्य समस्याओं का निदान, समस्या निवारण, और समाधान करना सीखें। प्रत्येक समस्या में विस्तृत लक्षण, मूल कारण, और चरण-दर-चरण समाधान प्रक्रियाएँ शामिल हैं।

## सीखने के लक्ष्य

इस गाइड को पूरा करके, आप:
- Azure Developer CLI समस्याओं के लिए निदान तकनीकों में महारत हासिल करेंगे
- सामान्य प्रमाणीकरण और अनुमति समस्याओं और उनके समाधान को समझेंगे
- तैनाती की असफलताओं, अवसंरचना प्रावधान त्रुटियों, और कॉन्फ़िगरेशन समस्याओं को हल करेंगे
- सक्रिय निगरानी और डीबगिंग रणनीतियाँ लागू करेंगे
- जटिल समस्याओं के लिए व्यवस्थित समस्या निवारण विधियां अपनाएंगे
- भविष्य की समस्याओं को रोकने के लिए उचित लॉगिंग और निगरानी कॉन्फ़िगर करेंगे

## सीखने के परिणाम

पूरा करने पर, आप सक्षम होंगे:
- बिल्ट-इन निदान उपकरणों का उपयोग करके Azure Developer CLI समस्याओं का निदान करना
- प्रमाणीकरण, सदस्यता, और अनुमति-संबंधित समस्याओं को स्वतंत्र रूप से हल करना
- तैनाती की असफलताओं और अवसंरचना प्रावधान त्रुटियों का प्रभावी ढंग से समस्या निवारण करना
- एप्लिकेशन कॉन्फ़िगरेशन समस्याओं और पर्यावरण-विशिष्ट समस्याओं का डीबगिंग करना
- संभावित समस्याओं को सक्रिय रूप से पहचानने के लिए निगरानी और अलर्टिंग को लागू करना
- लॉगिंग, डीबगिंग, और समस्या समाधान कार्यप्रवाह के लिए सर्वोत्तम प्रथाओं को लागू करना

## त्वरित निदान

विशिष्ट समस्याओं में गोता लगाने से पहले, निदान जानकारी इकट्ठा करने के लिए ये कमांड चलाएँ:

```bash
# एज़ड संस्करण और स्वास्थ्य जांचें
azd version
azd config show

# Azure प्रमाणीकरण सत्यापित करें
az account show
az account list

# वर्तमान पर्यावरण जांचें
azd env list
azd env get-values

# डिबग लॉगिंग सक्षम करें
export AZD_DEBUG=true
azd <command> --debug
```

## प्रमाणीकरण समस्याएं

### समस्या: "एक्सेस टोकन प्राप्त करने में विफल"
**लक्षण:**
- `azd up` प्रमाणीकरण त्रुटियों के साथ विफल होता है
- कमांड "अधिकृत नहीं" या "पहुँच अस्वीकृत" लौटाते हैं

**समाधान:**
```bash
# 1. Azure CLI के साथ पुनः प्रमाणीकरण करें
az login
az account show

# 2. कैश किए गए क्रेडेंशियल्स साफ़ करें
az account clear
az login

# 3. डिवाइस कोड फ्लो का उपयोग करें (हेडलैस सिस्टम के लिए)
az login --use-device-code

# 4. स्पष्ट सदस्यता सेट करें
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### समस्या: तैनाती के दौरान "अपर्याप्त विशेषाधिकार"
**लक्षण:**
- अनुमति त्रुटियों के साथ तैनाती विफल होती है
- कुछ Azure संसाधन नहीं बनाए जा सकते

**समाधान:**
```bash
# 1. अपने Azure भूमिका असाइनमेंट जांचें
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. सुनिश्चित करें कि आपके पास आवश्यक भूमिकाएं हैं
# - योगदानकर्ता (संसाधन निर्माण के लिए)
# - उपयोगकर्ता पहुंच व्यवस्थापक (भूमिका असाइनमेंट के लिए)

# 3. उचित अनुमतियों के लिए अपने Azure प्रशासक से संपर्क करें
```

### समस्या: मल्टी-टेनेंट प्रमाणीकरण समस्याएं
**समाधान:**
```bash
# 1. विशिष्ट टेनेन्ट के साथ लॉगिन करें
az login --tenant "your-tenant-id"

# 2. कॉन्फ़िगरेशन में टेनेन्ट सेट करें
azd config set auth.tenantId "your-tenant-id"

# 3. यदि टेनेन्ट बदल रहे हैं तो टेनेन्ट कैश साफ़ करें
az account clear
```

## 🏗️ अवसंरचना प्रावधान त्रुटियाँ

### समस्या: संसाधन नाम संघर्ष
**लक्षण:**
- "संसाधन नाम पहले से मौजूद है" त्रुटियाँ
- संसाधन निर्माण के दौरान तैनाती विफल होती है

**समाधान:**
```bash
# 1. टोकन के साथ अद्वितीय संसाधन नामों का उपयोग करें
# अपने बाइसप टेम्पलेट में:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. पर्यावरण नाम बदलें
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. मौजूदा संसाधनों को साफ़ करें
azd down --force --purge
```

### समस्या: स्थान/क्षेत्र उपलब्ध नहीं
**लक्षण:**
- "संसाधन प्रकार के लिए स्थान 'xyz' उपलब्ध नहीं है"
- चयनित क्षेत्र में कुछ SKU उपलब्ध नहीं हैं

**समाधान:**
```bash
# 1. संसाधन प्रकारों के लिए उपलब्ध स्थानों की जांच करें
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. सामान्यतः उपलब्ध क्षेत्रों का उपयोग करें
azd config set defaults.location eastus2
# या
azd env set AZURE_LOCATION eastus2

# 3. क्षेत्र द्वारा सेवा उपलब्धता की जांच करें
# विज़िट करें: https://azure.microsoft.com/global-infrastructure/services/
```

### समस्या: कोटा समाप्त हो गया त्रुटियाँ
**लक्षण:**
- "संसाधन प्रकार के लिए कोटा समाप्त हो गया"
- "अधिकतम संसाधन संख्या पहुँच गई"

**समाधान:**
```bash
# 1. वर्तमान कोटा उपयोग जांचें
az vm list-usage --location eastus2 -o table

# 2. एज़्योर पोर्टल के माध्यम से कोटा वृद्धि का अनुरोध करें
# जाएं: सदस्यताएँ > उपयोग + कोटा

# 3. विकास के लिए छोटे SKUs का उपयोग करें
# main.parameters.json में:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. अप्रयुक्त संसाधनों को साफ करें
az resource list --query "[?contains(name, 'unused')]" -o table
```

### समस्या: Bicep टेम्प्लेट त्रुटियाँ
**लक्षण:**
- टेम्प्लेट सत्यापन विफलताएं
- Bicep फ़ाइलों में वाक्य रचना त्रुटियाँ

**समाधान:**
```bash
# 1. Bicep वाक्य रचना को सत्यापित करें
az bicep build --file infra/main.bicep

# 2. Bicep लिंटर का उपयोग करें
az bicep lint --file infra/main.bicep

# 3. पैरामीटर फ़ाइल वाक्य रचना जांचें
cat infra/main.parameters.json | jq '.'

# 4. तैनाती परिवर्तनों का पूर्वावलोकन करें
azd provision --preview
```

## 🚀 तैनाती असफलताएं

### समस्या: बिल्ड विफलताएं
**लक्षण:**
- तैनाती के दौरान एप्लिकेशन बिल्ड विफल होता है
- पैकेज इंस्टॉलेशन त्रुटियाँ

**समाधान:**
```bash
# 1. डिबग फ्लैग के साथ बिल्ड आउटपुट की जांच करें
azd deploy --service web --debug

# 2. डिप्लॉय किए गए सेवा की स्थिति देखें
azd show

# 3. स्थानीय रूप से बिल्ड का परीक्षण करें
cd src/web
npm install
npm run build

# 3. Node.js/Python संस्करण संगतता जांचें
node --version  # azure.yaml सेटिंग्स से मेल खाना चाहिए
python --version

# 4. बिल्ड कैश साफ़ करें
rm -rf node_modules package-lock.json
npm install

# 5. कंटेनर का उपयोग करने पर Dockerfile जांचें
docker build -t test-image .
docker run --rm test-image
```

### समस्या: कंटेनर तैनाती असफलताएं
**लक्षण:**
- कंटेनर एप्स शुरू नहीं हो पाते
- इमेज पुल त्रुटियाँ

**समाधान:**
```bash
# 1. लोकली Docker बिल्ड का परीक्षण करें
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Azure CLI का उपयोग करके कंटेनर लॉग्स जांचें
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. azd के माध्यम से एप्लिकेशन की निगरानी करें
azd monitor --logs

# 3. कंटेनर रजिस्ट्री एक्सेस सत्यापित करें
az acr login --name myregistry

# 4. कंटेनर ऐप कॉन्फ़िगरेशन जांचें
az containerapp show --name my-app --resource-group my-rg
```

### समस्या: डेटाबेस कनेक्शन विफलताएं
**लक्षण:**
- एप्लिकेशन डेटाबेस से कनेक्ट नहीं कर पाता
- कनेक्शन टाइमआउट त्रुटियाँ

**समाधान:**
```bash
# 1. डेटाबेस फ़ायरवॉल नियमों की जांच करें
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. एप्लिकेशन से कनेक्टिविटी का परीक्षण करें
# अपने ऐप में अस्थायी रूप से जोड़ें:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. कनेक्शन स्ट्रिंग स्वरूप सत्यापित करें
azd env get-values | grep DATABASE

# 4. डेटाबेस सर्वर की स्थिति जांचें
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 कॉन्फ़िगरेशन समस्याएं

### समस्या: पर्यावरण चर काम नहीं कर रहे
**लक्षण:**
- ऐप कॉन्फ़िगरेशन मान पढ़ नहीं पाता
- पर्यावरण चर खाली दिखते हैं

**समाधान:**
```bash
# 1. सुनिश्चित करें कि पर्यावरण चर सेट हैं
azd env get-values
azd env get DATABASE_URL

# 2. azure.yaml में चर नाम जांचें
cat azure.yaml | grep -A 5 env:

# 3. एप्लिकेशन को पुनरारंभ करें
azd deploy --service web

# 4. एप्लिकेशन सेवा विन्यास जांचें
az webapp config appsettings list --name myapp --resource-group myrg
```

### समस्या: SSL/TLS प्रमाणपत्र समस्याएं
**लक्षण:**
- HTTPS काम नहीं कर रहा
- प्रमाणपत्र प्रमाणीकरण त्रुटियाँ

**समाधान:**
```bash
# 1. SSL प्रमाणपत्र की स्थिति जांचें
az webapp config ssl list --resource-group myrg

# 2. केवल HTTPS सक्षम करें
az webapp update --name myapp --resource-group myrg --https-only true

# 3. कस्टम डोमेन जोड़ें (यदि आवश्यक हो)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### समस्या: CORS कॉन्फ़िगरेशन समस्याएं
**लक्षण:**
- फ्रंटेंड API कॉल नहीं कर पा रहा
- क्रॉस-ओरिजिन अनुरोध अवरुद्ध

**समाधान:**
```bash
# 1. ऐप सेवा के लिए CORS कॉन्फ़िगर करें
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. CORS को संभालने के लिए API अपडेट करें
# Express.js में:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. जांचें कि सही URL पर चल रहा है या नहीं
azd show
```

## 🌍 पर्यावरण प्रबंधन समस्याएं

### समस्या: पर्यावरण स्विचिंग समस्याएं
**लक्षण:**
- गलत पर्यावरण उपयोग हो रहा है
- कॉन्फ़िगरेशन सही ढंग से स्विच नहीं हो रहा

**समाधान:**
```bash
# 1. सभी परिवेश सूचीबद्ध करें
azd env list

# 2. स्पष्ट रूप से परिवेश चुनें
azd env select production

# 3. वर्तमान परिवेश सत्यापित करें
azd env list

# 4. यदि परिवेश भ्रष्ट हो तो नया परिवेश बनाएं
azd env new production-new
azd env select production-new
```

### समस्या: पर्यावरण भ्रष्टाचार
**लक्षण:**
- पर्यावरण अमान्य स्थिति दिखा रहा है
- संसाधन कॉन्फ़िगरेशन से मेल नहीं खाते

**समाधान:**
```bash
# 1. पर्यावरण स्थिति को रीफ्रेश करें
azd env refresh

# 2. पर्यावरण विन्यास रीसेट करें
azd env new production-reset
# आवश्यक पर्यावरण चर कॉपी करें
azd env set DATABASE_URL "your-value"

# 3. मौजूदा संसाधनों को आयात करें (यदि संभव हो)
# संसाधन आईडी के साथ .azure/production/config.json को मैनुअली अपडेट करें
```

## 🔍 प्रदर्शन समस्याएं

### समस्या: धीमे तैनाती समय
**लक्षण:**
- तैनाती बहुत समय ले रही है
- तैनाती के दौरान टाइमआउट

**समाधान:**
```bash
# 1. तेज पुनरावृत्ति के लिए विशिष्ट सेवाएं तैनात करें
azd deploy --service web
azd deploy --service api

# 2. जब आधारभूत संरचना अपरिवर्तित हो, तब केवल कोड तैनाती का उपयोग करें
azd deploy  # azd up से तेज

# 3. निर्माण प्रक्रिया का अनुकूलन करें
# package.json में:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. संसाधन स्थानों की जांच करें (एक ही क्षेत्र का उपयोग करें)
azd config set defaults.location eastus2
```

### समस्या: एप्लिकेशन प्रदर्शन समस्याएं
**लक्षण:**
- धीमा प्रतिक्रिया समय
- अधिक संसाधन उपयोग

**समाधान:**
```bash
# 1. संसाधनों का पैमाना बढ़ाएं
# main.parameters.json में SKU अपडेट करें:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. एप्लिकेशन इनसाइट्स निगरानी सक्षम करें
azd monitor --overview

# 3. Azure में एप्लिकेशन लॉग्स जांचें
az webapp log tail --name myapp --resource-group myrg
# या कंटेनर एप के लिए:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. कैशिंग लागू करें
# अपनी इन्फ्रास्ट्रक्चर में Redis कैश जोड़ें
```

## 🛠️ समस्या निवारण उपकरण और कमांड

### डीबग कमांड्स
```bash
# व्यापक डीबगिंग
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# azd संस्करण जांचें
azd version

# वर्तमान कॉन्फ़िगरेशन देखें
azd config show

# कनेक्टिविटी का परीक्षण करें
curl -v https://myapp.azurewebsites.net/health
```

### लॉग विश्लेषण
```bash
# Azure CLI के माध्यम से एप्लिकेशन लॉग्स
az webapp log tail --name myapp --resource-group myrg

# azd के साथ एप्लिकेशन की निगरानी करें
azd monitor --logs
azd monitor --live

# Azure संसाधन लॉग्स
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# कंटेनर लॉग्स (कंटेनर ऐप्स के लिए)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### संसाधन जांच
```bash
# सभी संसाधनों की सूची बनाएं
az resource list --resource-group myrg -o table

# संसाधन की स्थिति जांचें
az webapp show --name myapp --resource-group myrg --query state

# नेटवर्क निदान
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 अतिरिक्त सहायता प्राप्त करना

### कब प्रस्तावित करें
- सभी समाधानों को आजमाने के बाद भी प्रमाणीकरण समस्याएँ बनी रहें
- Azure सेवाओं के साथ अवसंरचना समस्याएं
- बिलिंग या सदस्यता-संबंधित मुद्दे
- सुरक्षा चिंताएं या घटनाएं

### समर्थन चैनल्स
```bash
# 1. Azure सेवा स्वास्थ्य जांचें
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Azure समर्थन टिकट बनाएं
# पर जाएँ: https://portal.azure.com -> सहायता + समर्थन

# 3. सामुदायिक संसाधन
# - स्टैक ओवरफ्लो: azure-developer-cli टैग
# - GitHub मुद्दे: https://github.com/Azure/azure-dev/issues
# - Microsoft प्रश्न और उत्तर: https://learn.microsoft.com/en-us/answers/
```

### एकत्र करने के लिए जानकारी
समर्थन से संपर्क करने से पहले, ये जानकारी इकट्ठा करें:
- `azd version` आउटपुट
- `azd config show` आउटपुट
- `azd show` आउटपुट (वर्तमान तैनाती स्थिति)
- त्रुटि संदेश (पूरा पाठ)
- समस्या पुन: उत्पन्न करने के चरण
- पर्यावरण विवरण (`azd env get-values`)
- समस्या शुरू होने का समयरेखा

### लॉग संग्राहक स्क्रिप्ट
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 समस्या निवारण

### प्री-डिप्लॉयमेंट चेकलिस्ट
```bash
# 1. प्रमाणीकरण सत्यापित करें
az account show

# 2. कोटा और सीमाओं की जांच करें
az vm list-usage --location eastus2

# 3. टेम्पलेट्स सत्यापित करें
az bicep build --file infra/main.bicep

# 4. पहले स्थानीय स्तर पर परीक्षण करें
npm run build
npm run test

# 5. ड्राई-रन डिप्लॉयमेंट का उपयोग करें
azd provision --preview
```

### निगरानी सेटअप
```bash
# एप्लिकेशन इनसाइट्स सक्षम करें
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
# साप्ताहिक स्वास्थ्य जांच
./scripts/health-check.sh

# मासिक लागत समीक्षा
az consumption usage list --billing-period-name 202401

# त्रैमासिक सुरक्षा समीक्षा
az security assessment list --resource-group myrg
```

## संबंधित संसाधन

- [डीबगिंग गाइड](debugging.md) - उन्नत डीबगिंग तकनीकें
- [प्रावधान संसाधन](../chapter-04-infrastructure/provisioning.md) - अवसंरचना समस्या निवारण
- [क्षमता योजना](../chapter-06-pre-deployment/capacity-planning.md) - संसाधन योजना मार्गदर्शन
- [SKU चयन](../chapter-06-pre-deployment/sku-selection.md) - सेवा स्तर सिफारिशें

---

**टिप**: इस गाइड को बुकमार्क करें और जब भी समस्याएँ आएं, इसे देखें। अधिकांश समस्याएँ पहले देखी गई हैं और स्थापित समाधान मौजूद हैं!

---

**नेविगेशन**
- **पिछला पाठ**: [प्रावधान संसाधन](../chapter-04-infrastructure/provisioning.md)
- **अगला पाठ**: [डीबगिंग गाइड](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयासरत हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या गलतियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मातृ भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सलाह दी जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम जिम्मेदार नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->