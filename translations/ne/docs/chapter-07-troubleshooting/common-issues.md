# सामान्य समस्याहरू र समाधानहरू

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय ७ - समस्याको समाधान र डिबगिङ
- **⬅️ अघिल्लो अध्याय**: [अध्याय ६: प्रि-फ्लाइट परीक्षणहरू](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ अर्को**: [डिबगिङ गाइड](debugging.md)
- **🚀 अर्को अध्याय**: [अध्याय ८: उत्पादन र एंटरप्राइज ढाँचाहरू](../chapter-08-production/production-ai-practices.md)

## परिचय

यो व्यापक समस्याहरू समाधान गर्ने गाइड Azure Developer CLI प्रयोग गर्दा प्रायः देखिने समस्याहरू समेट्छ। प्रमाणीकरण, परिनियोजन, पूर्वाधार प्रावधान, र अनुप्रयोग कन्फिगरेसनसँग सम्बन्धित सामान्य समस्या पहिचान गर्ने, समाधान गर्ने र समाधान गर्ने सिक्नुहोस्। प्रत्येक समस्यामा विस्तृत लक्षणहरू, मूल कारणहरू, र चरण-दर-चरण समाधान प्रक्रिया समावेश छन्।

## सिकाइ लक्ष्यहरू

यो गाइड पूरा गरेर, तपाईले:
- Azure Developer CLI समस्याहरूको लागि डायग्नोस्टिक प्रविधिहरूमा विशेषज्ञता हासिल गर्नुहुनेछ
- सामान्य प्रमाणीकरण र अनुमति समस्याहरू र तिनीहरूको समाधानहरू बुझ्नुहोस्
- परिनियोजन असफलताहरू, पूर्वाधार प्रावधान त्रुटिहरू, र कन्फिगरेसन समस्याहरू समाधान गर्नुहोस्
- सक्रिय निगरानी र डिबगिङ रणनीतिहरू कार्यान्वयन गर्नुहोस्
- जटिल समस्याहरूको लागि व्यवस्थित समस्याहरू समाधान गर्ने विधिहरू लागू गर्नुहोस्
- भविष्यका समस्याहरू रोक्न उचित लगिङ र निगरानी कन्फिगर गर्नुहोस्

## सिकाइ नतिजाहरू

पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
- Azure Developer CLI समस्याहरूलाई निर्मित डायग्नोस्टिक उपकरणहरू प्रयोग गरी निदान गर्न
- प्रमाणीकरण, सदस्यता, र अनुमति सम्बन्धित समस्याहरू स्वतन्त्र रूपमा समाधान गर्न
- परिनियोजन असफलता र पूर्वाधार प्रावधान त्रुटिहरू प्रभावकारी रूपमा समाधान गर्न
- अनुप्रयोग कन्फिगरेसन समस्याहरू र वातावरण-विशिष्ट समस्याहरू डिबग गर्न
- संभावित समस्याहरू पहिचान गर्न सक्रिय रूपमा निगरानी र चेतावनी कार्यान्वयन गर्न
- लगिङ, डिबगिङ र समस्याको समाधान कार्यप्रवाहहरूको लागि उत्कृष्ट अभ्यासहरू लागू गर्न

## छिटो डायग्नोस्टिक्स

विशिष्ट समस्याहरूमा प्रवेश गर्नु अघि, डायग्नोस्टिक जानकारी सङ्कलन गर्न यी आदेशहरू चलाउनुहोस्:

```bash
# azd संस्करण र स्वास्थ्य जाँच गर्नुहोस्
azd version
azd config show

# Azure प्रमाणीकरण प्रमाणित गर्नुहोस्
az account show
az account list

# वर्तमान वातावरण जाँच गर्नुहोस्
azd env list
azd env get-values

# डिबग लगिङ सक्षम गर्नुहोस्
export AZD_DEBUG=true
azd <command> --debug
```

## प्रमाणीकरण समस्याहरू

### समस्या: "एक्सेस टोकन प्राप्त गर्न असफल"
**लक्षणहरू:**
- `azd up` प्रमाणीकरण त्रुटिहरूको साथ असफल हुन्छ
- आदेशहरूले "अधिकार छैन" वा "पहुँच त्यागिएको" फिर्ता गर्छन्

**समाधानहरू:**
```bash
# 1. Azure CLI सँग पुनः प्रमाणित गर्नुहोस्
az login
az account show

# 2. क्यास गरिएको प्रमाणपत्रहरू खाली गर्नुहोस्
az account clear
az login

# 3. डिभाइस कोड फ्लो प्रयोग गर्नुहोस् (हेडलस प्रणालीहरूको लागि)
az login --use-device-code

# 4. स्पष्ट सदस्यता सेट गर्नुहोस्
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### समस्या: परिनियोजनको क्रममा "अपर्याप्त अधिकार"
**लक्षणहरू:**
- अनुमति त्रुटिहरूका साथ परिनियोजन असफल हुन्छ
- केही Azure स्रोतहरू सिर्जना गर्न सकिदैन

**समाधानहरू:**
```bash
# 1. आफ्नो Azure रोल असाइनमेन्टहरू जाँच गर्नुहोस्
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. आवश्यक रोलहरू भए नभएको सुनिश्चित गर्नुहोस्
# - योगदानकर्ता (स्रोत सिर्जनाका लागि)
# - प्रयोगकर्ता पहुँच प्रशासक (रोल असाइनमेन्टका लागि)

# 3. उचित अनुमतिहरूका लागि आफ्नो Azure प्रशासकलाई सम्पर्क गर्नुहोस्
```

### समस्या: मल्टि-टेनेन्ट प्रमाणीकरण समस्या
**समाधानहरू:**
```bash
# 1. विशिष्ट भाडादारसँग लगइन गर्नुहोस्
az login --tenant "your-tenant-id"

# 2. कन्फिगरेसनमा भाडादार सेट गर्नुहोस्
azd config set auth.tenantId "your-tenant-id"

# 3. भाडादार परिवर्तन गर्दा भाडादार क्यास खाली गर्नुहोस्
az account clear
```

## 🏗️ पूर्वाधार प्रावधान त्रुटिहरू

### समस्या: स्रोत नाम द्वन्द्व
**लक्षणहरू:**
- "स्रोत नाम पहिले नै अवस्थित छ" त्रुटिहरू
- स्रोत सिर्जनाको क्रममा परिनियोजन असफल हुन्छ

**समाधानहरू:**
```bash
# 1. टोकनहरू सहित अनौठो स्रोत नामहरू प्रयोग गर्नुहोस्
# तपाईंको बाइसेप टेम्प्लेटमा:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. वातावरण नाम परिवर्तन गर्नुहोस्
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. अवस्थित स्रोतहरू सफा गर्नुहोस्
azd down --force --purge
```

### समस्या: स्थान/क्षेत्र उपलब्ध छैन
**लक्षणहरू:**
- "स्रोत प्रकारको लागि स्थान 'xyz' उपलब्ध छैन"
- चयन गरिएको क्षेत्रमा केही SKU उपलब्ध छैन

**समाधानहरू:**
```bash
# १. स्रोत प्रकारहरूको लागि उपलब्ध स्थानहरू जाँच गर्नुहोस्
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# २. सामान्यतया उपलब्ध क्षेत्रहरू प्रयोग गर्नुहोस्
azd config set defaults.location eastus2
# वा
azd env set AZURE_LOCATION eastus2

# ३. क्षेत्र अनुसार सेवा उपलब्धता जाँच गर्नुहोस्
# भ्रमण गर्नुहोस्: https://azure.microsoft.com/global-infrastructure/services/
```

### समस्या: कोटा बढी भएको त्रुटिहरू
**लक्षणहरू:**
- "स्रोत प्रकारको लागि कोटा बढेको छ"
- "स्रोतहरूको अधिकतम संख्या पुगेको छ"

**समाधानहरू:**
```bash
# 1. हालको कोटा प्रयोग जाँच गर्नुहोस्
az vm list-usage --location eastus2 -o table

# 2. Azure पोर्टलबाट कोटा वृद्धि अनुरोध गर्नुहोस्
# जानुहोस्: Subscriptions > Usage + quotas

# 3. विकासको लागि साना SKU हरू प्रयोग गर्नुहोस्
# main.parameters.json मा:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. प्रयोग नगरिएका स्रोतहरू सफा गर्नुहोस्
az resource list --query "[?contains(name, 'unused')]" -o table
```

### समस्या: बाइसप टेम्प्लेट त्रुटिहरू
**लक्षणहरू:**
- टेम्प्लेट प्रमाणीकरण असफल
- बाइसप फाइलहरूमा सिन्ट्याक्स त्रुटिहरू

**समाधानहरू:**
```bash
# १. Bicep सिन्ट्याक्स प्रमाणित गर्नुहोस्
az bicep build --file infra/main.bicep

# २. Bicep लिंटर प्रयोग गर्नुहोस्
az bicep lint --file infra/main.bicep

# ३. प्यारामिटर फाइल सिन्ट्याक्स जाँच गर्नुहोस्
cat infra/main.parameters.json | jq '.'

# ४. डेप्लोयमेन्ट परिवर्तनहरू पूर्वावलोकन गर्नुहोस्
azd provision --preview
```

## 🚀 परिनियोजन असफलताहरू

### समस्या: निर्मित असफलताहरू
**लक्षणहरू:**
- परिनियोजनको क्रममा अनुप्रयोग निर्मित हुन असफल हुन्छ
- प्याकेज स्थापना त्रुटिहरू

**समाधानहरू:**
```bash
# 1. डिबग फ्ल्यागसँग बिल्ड आउटपुट जाँच गर्नुहोस्
azd deploy --service web --debug

# 2. डिप्लोई गरिएको सेवा स्थिति हेर्नुहोस्
azd show

# 3. स्थानीय रूपमा बिल्ड परीक्षण गर्नुहोस्
cd src/web
npm install
npm run build

# 3. Node.js/Python संस्करण अनुकूलता जाँच गर्नुहोस्
node --version  # azure.yaml सेटिंग्ससँग मेल खानु पर्छ
python --version

# 4. बिल्ड क्यासे खाली गर्नुहोस्
rm -rf node_modules package-lock.json
npm install

# 5. कन्टेनरहरू प्रयोग गर्दा Dockerfile जाँच गर्नुहोस्
docker build -t test-image .
docker run --rm test-image
```

### समस्या: कन्टेनर परिनियोजन असफलताहरू
**लक्षणहरू:**
- कन्टेनर अनुप्रयोगहरू सुरु हुन सक्दैनन्
- इमेज पुल त्रुटिहरू

**समाधानहरू:**
```bash
# 1. स्थानीय रूपमा Docker निर्माण परीक्षण गर्नुहोस्
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Azure CLI प्रयोग गरी कन्टेनर लगहरू जाँच गर्नुहोस्
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. azd मार्फत अनुप्रयोग अनुगमन गर्नुहोस्
azd monitor --logs

# 3. कन्टेनर रजिस्ट्री पहुँच प्रमाणित गर्नुहोस्
az acr login --name myregistry

# 4. कन्टेनर अनुप्रयोग कन्फिगरेसन जाँच गर्नुहोस्
az containerapp show --name my-app --resource-group my-rg
```

### समस्या: डाटाबेस कनेक्शन असफलताहरू
**लक्षणहरू:**
- अनुप्रयोग डाटाबेससँग जडान गर्न सक्दैन
- जडान समय समाप्ति त्रुटिहरू

**समाधानहरू:**
```bash
# १. डाटाबेस फायरवाल नियमहरू जाँच गर्नुहोस्
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# २. अनुप्रयोगबाट जडान परीक्षण गर्नुहोस्
# तपाईंको अनुप्रयोगमा अस्थायी रूपमा थप्नुहोस्:
curl -v telnet://mydb.postgres.database.azure.com:5432

# ३. जडान स्ट्रिङ ढाँचा जाँच गर्नुहोस्
azd env get-values | grep DATABASE

# ४. डाटाबेस सर्भर स्थिति जाँच गर्नुहोस्
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 कन्फिगरेसन समस्याहरू

### समस्या: वातावरण चरहरू काम नगर्ने
**लक्षणहरू:**
- अनुप्रयोगले कन्फिगरेसन मानहरू पढ्न सक्दैन
- वातावरण चरहरू खाली देखिन्छ

**समाधानहरू:**
```bash
# १. वातावरण चरहरू सेट गरिएको छ कि छैन जाँच गर्नुहोस्
azd env get-values
azd env get DATABASE_URL

# २. azure.yaml मा चर नामहरू जाँच गर्नुहोस्
cat azure.yaml | grep -A 5 env:

# ३. अनुप्रयोग पुनः सुरु गर्नुहोस्
azd deploy --service web

# ४. अनुप्रयोग सेवा कन्फिगरेसन जाँच गर्नुहोस्
az webapp config appsettings list --name myapp --resource-group myrg
```

### समस्या: SSL/TLS प्रमाणपत्र समस्याहरू
**लक्षणहरू:**
- HTTPS काम नगर्ने
- प्रमाणपत्र प्रमाणीकरण त्रुटिहरू

**समाधानहरू:**
```bash
# १. SSL प्रमाणपत्र स्थिति जाँच गर्नुहोस्
az webapp config ssl list --resource-group myrg

# २. केवल HTTPS सक्षम गर्नुहोस्
az webapp update --name myapp --resource-group myrg --https-only true

# ३. अनुकूलित डोमेन थप्नुहोस् (यदि आवश्यक छ)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### समस्या: CORS कन्फिगरेसन समस्याहरू
**लक्षणहरू:**
- फ्रन्टएण्डले API कल गर्न सक्दैन
- क्रस-ओरिजिन अनुरोध अवरुद्ध

**समाधानहरू:**
```bash
# 1. App Service का लागि CORS कन्फिगर गर्नुहोस्
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. CORS सम्हाल्न API अपडेट गर्नुहोस्
# Express.js मा:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. सहि URL मा चलिरहेको छ कि छैन जाँच गर्नुहोस्
azd show
```

## 🌍 वातावरण व्यवस्थापन समस्याहरू

### समस्या: वातावरण स्विच गर्ने समस्या
**लक्षणहरू:**
- गलत वातावरण प्रयोग भइरहेको छ
- कन्फिगरेसन ठीकसँग स्विच हुदैन

**समाधानहरू:**
```bash
# 1. सबै वातावरणहरू सूचीबद्ध गर्नुहोस्
azd env list

# 2. स्पष्ट रूपमा वातावरण चयन गर्नुहोस्
azd env select production

# 3. वर्तमान वातावरण प्रमाणित गर्नुहोस्
azd env list

# 4. बिग्रेमा नयाँ वातावरण सिर्जना गर्नुहोस्
azd env new production-new
azd env select production-new
```

### समस्या: वातावरण भ्रष्टाचार
**लक्षणहरू:**
- वातावरण अमान्य स्थिति देखाउँछ
- स्रोतहरू कन्फिगरेसनसँग मेल खाँदैन

**समाधानहरू:**
```bash
# 1. वातावरण स्थिति पुनः ताजा गर्नुहोस्
azd env refresh

# 2. वातावरण कन्फिगरेसन रिसेट गर्नुहोस्
azd env new production-reset
# आवश्यक वातावरण चरहरू प्रतिलिपि गर्नुहोस्
azd env set DATABASE_URL "your-value"

# 3. अवस्थित स्रोतहरू आयात गर्नुहोस् (यदि सम्भव छ)
# स्रोत ID हरूको साथमा .azure/production/config.json म्यानुअली अपडेट गर्नुहोस्
```

## 🔍 प्रदर्शन समस्याहरू

### समस्या: सुस्त परिनियोजन समयहरू
**लक्षणहरू:**
- परिनियोजनहरू धेरै समय लिन्छन्
- परिनियोजनको क्रममा टाइमआउट

**समाधानहरू:**
```bash
# 1. छिटो पुनरावृत्तिका लागि विशिष्ट सेवाहरू परिनियोजन गर्नुहोस्
azd deploy --service web
azd deploy --service api

# 2. पूर्वाधार अपरिवर्तित हुँदा केवल कोड परिनियोजन प्रयोग गर्नुहोस्
azd deploy  # azd up भन्दा छिटो

# 3. निर्माण प्रक्रियालाई अनुकूलित गर्नुहोस्
# package.json मा:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. स्रोत स्थानहरू जाँच गर्नुहोस् (उही क्षेत्र प्रयोग गर्नुहोस्)
azd config set defaults.location eastus2
```

### समस्या: अनुप्रयोग प्रदर्शन समस्याहरू
**लक्षणहरू:**
- सुस्त प्रतिक्रिया समयहरू
- उच्च स्रोत प्रयोग

**समाधानहरू:**
```bash
# 1. स्रोतहरू बढाउनुहोस्
# मुख्य.parameters.json मा SKU अपडेट गर्नुहोस्:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Application Insights अनुगमन सक्षम गर्नुहोस्
azd monitor --overview

# 3. Azure मा अनुप्रयोग लगहरू जाँच्नुहोस्
az webapp log tail --name myapp --resource-group myrg
# वा Container Apps का लागि:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. क्यासिङ लागू गर्नुहोस्
# आफ्नो पूर्वाधारमा Redis क्यास थप्नुहोस्
```

## 🛠️ समस्याको समाधान गर्ने उपकरणहरू र आदेशहरू

### डिबग आदेशहरू
```bash
# व्यापक डिबगिङ
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# azd संस्करण जाँच्नुहोस्
azd version

# वर्तमान कन्फिगरेसन हेर्नुहोस्
azd config show

# जडान परीक्षण गर्नुहोस्
curl -v https://myapp.azurewebsites.net/health
```

### लग विश्लेषण
```bash
# Azure CLI मार्फत आवेदन लगहरू
az webapp log tail --name myapp --resource-group myrg

# azd सँग आवेदन अनुगमन गर्नुहोस्
azd monitor --logs
azd monitor --live

# Azure स्रोत लगहरू
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# कन्टेनर लगहरू (कन्टेनर एपहरूको लागि)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### स्रोत अनुसन्धान
```bash
# सबै स्रोतहरू सूचीबद्ध गर्नुहोस्
az resource list --resource-group myrg -o table

# स्रोत स्थिति जाँच गर्नुहोस्
az webapp show --name myapp --resource-group myrg --query state

# नेटवर्क डायग्नोस्टिक्स
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 थप सहयोग पाउने

### कहिले एस्केलेट गर्ने
- सबै समाधान प्रयास गरेपछि पनि प्रमाणीकरण समस्याहरू रहिरहने
- Azure सेवाहरूका पूर्वाधार समस्याहरू
- बिलिङ वा सदस्यता सम्बन्धित समस्याहरू
- सुरक्षा चिन्ताहरू वा घट्नाहरू

### समर्थन च्यानलहरू
```bash
# 1. एजर सेवा स्वास्थ्य जाँच गर्नुहोस्
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. एजर समर्थन टिकटका बनाउनूहोस्
# जानुहोस्: https://portal.azure.com -> मद्दत + समर्थन

# 3. समुदाय स्रोतहरू
# - स्ट्याक ओभरफ्लो: azure-developer-cli ट्याग
# - गिटहब मुद्दाहरू: https://github.com/Azure/azure-dev/issues
# - माइक्रोसफ्ट प्रश्नोत्तर: https://learn.microsoft.com/en-us/answers/
```

### सङ्कलन गर्ने जानकारी
समर्थनमा सम्पर्क गर्नु अघि सङ्कलन गर्नुहोस्:
- `azd version` आउटपुट
- `azd config show` आउटपुट
- `azd show` आउटपुट (हालको परिनियोजन स्थिति)
- त्रुटि सन्देशहरू (पूर्ण पाठ)
- समस्या पुनरुत्पादन गर्ने चरणहरू
- वातावरण विवरण (`azd env get-values`)
- समस्या सुरु भएको समयरेखा

### लग सङ्कलन स्क्रिप्ट
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

## 📊 समस्या रोकथाम

### प्रि-परिनियोजन चेकलिस्ट
```bash
# १. प्रमाणिकरण मान्य गर्नुहोस्
az account show

# २. कोटा र सीमाहरू जाँच गर्नुहोस्
az vm list-usage --location eastus2

# ३. टेम्प्लेटहरू मान्य गर्नुहोस्
az bicep build --file infra/main.bicep

# ४. पहिले स्थानीय रूपमा परीक्षण गर्नुहोस्
npm run build
npm run test

# ५. ड्राइ-रन तैनाथीहरू प्रयोग गर्नुहोस्
azd provision --preview
```

### निगरानी सेटअप
```bash
# अनुप्रयोग अन्तर्दृष्टिहरू सक्षम गर्नुहोस्
# main.bicep मा थप्नुहोस्:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# सुचनाहरू सेट अप गर्नुहोस्
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### नियमित मर्मत
```bash
# साप्ताहिक स्वास्थ्य जाँचहरू
./scripts/health-check.sh

# मासिक लागत समीक्षा
az consumption usage list --billing-period-name 202401

# त्रैमासिक सुरक्षा समीक्षा
az security assessment list --resource-group myrg
```

## सम्बन्धित स्रोतहरू

- [डिबगिङ गाइड](debugging.md) - उन्नत डिबगिङ प्रविधिहरू
- [स्रोत प्रावधान](../chapter-04-infrastructure/provisioning.md) - पूर्वाधार समस्या समाधान
- [क्षमता योजना](../chapter-06-pre-deployment/capacity-planning.md) - स्रोत योजना निर्देशन
- [SKU चयन](../chapter-06-pre-deployment/sku-selection.md) - सेवा तह सिफारिसहरू

---

**सूचना**: यो गाइडलाई बुकमार्कमा राख्नुहोस् र समस्या आएमा सन्दर्भ गर्नुहोस्। अधिकांश समस्याहरू पहिले पनि देखिएका छन् र समाधानहरू स्थापित छन्!

---

**नेभिगेसन**
- **अघिल्लो पाठ**: [स्रोत प्रावधान](../chapter-04-infrastructure/provisioning.md)
- **अर्को पाठ**: [डिबगिङ गाइड](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो कागजात [Co-op Translator](https://github.com/Azure/co-op-translator) नामक AI अनुवाद सेवा प्रयोग गरी अनुवाद गरिएको हो। हामी शुद्धताका लागि प्रयासरत छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटिहरू वा गलतता हुन सक्छ। मूल कागजात यसको मूल भाषामा शाश्वत स्रोत मानिनु पर्छ। महत्वपूर्ण जानकारीको लागि पेशेवर मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलतफहमी वा व्याख्याबाट हामी जिम्मेवार हुने छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->