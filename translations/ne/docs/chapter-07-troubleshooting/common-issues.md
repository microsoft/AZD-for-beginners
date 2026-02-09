# सामान्य समस्याहरू र समाधानहरू

**अध्याय नेभिगेशन:**
- **📚 कोर्स होम**: [आरम्भकर्ताका लागि AZD](../../README.md)
- **📖 हालको अध्याय**: अध्याय 7 - समस्या निवारण र डिबगिङ
- **⬅️ अघिल्लो अध्याय**: [अध्याय 6: पूर्व-डिप्लोयमेन्ट जाँचहरू](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ अर्को**: [डिबगिङ गाइड](debugging.md)
- **🚀 अर्को अध्याय**: [अध्याय 8: उत्पादन र एंटरप्राइज ढाँचाहरू](../chapter-08-production/production-ai-practices.md)

## परिचय

यो विस्तृत समस्या निवारण मार्गदर्शिकाले Azure Developer CLI प्रयोग गर्दा प्राय: सामना गरिने समस्याहरूलाई समेट्छ। प्रमाणीकरण, डिप्लोयमेन्ट, पूर्वाधार प्रावधान, र एप्लिकेसन कन्फिगरेसनसम्बन्धी सामान्य समस्याहरूलाई कसरी पत्ता लगाउने, समस्या निवारण गर्ने, र समाधान गर्ने भनेर सिक्नुहोस्। प्रत्येक समस्यामा विस्तृत लक्षणहरू, मूल कारणहरू, र चरण-द्वारा-चरण समाधान प्रक्रियाहरू समावेश छन्।

## सिकाइ लक्ष्यहरू

यस मार्गदर्शिका पूरा गरेपछि तपाईं:
- Azure Developer CLI समस्याहरूको निदान प्रविधिमा पारंगत हुनुहुनेछ
- सामान्य प्रमाणीकरण र अनुमति समस्याहरू र तिनीहरूको समाधानहरू बुझ्नुहुनेछ
- डिप्लोयमेन्ट असफलता, पूर्वाधार प्रावधान त्रुटिहरू, र कन्फिगरेसन समस्याहरू समाधान गर्न सक्नुहुनेछ
- सक्रिय निगरानी र डिबगिङ रणनीतिहरू कार्यान्वयन गर्नुहुनेछ
- जटिल समस्याहरूको लागि प्रणालीगत समस्या निवारण विधिहरू लागू गर्नुहुनेछ
- भविष्यका समस्याहरू रोक्न उपयुक्त लगिङ र निगरानी कन्फिगर गर्नुहुनेछ

## सिकाइ नतिजाहरू

पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
- इनबिल्ट निदान उपकरणहरू प्रयोग गरेर Azure Developer CLI समस्याहरू निदान गर्न
- स्वतन्त्र रूपमा प्रमाणीकरण, सदस्यता, र अनुमति सम्बन्धी समस्याहरू समाधान गर्न
- प्रभावकारी रूपमा डिप्लोयमेन्ट असफलता र पूर्वाधार प्रावधान त्रुटिहरू समस्या निवारण गर्न
- एप्लिकेसन कन्फिगरेसन समस्याहरू र वातावरण-विशिष्ट समस्याहरू डिबग गर्न
- सम्भावित समस्याहरू सक्रिय रूपमा पहिचान गर्न निगरानी र अलर्ट सेटअप गर्न
- लगिङ, डिबगिङ, र समस्या समाधान कार्यप्रवाहका लागि सर्वोत्तम अभ्यासहरू लागू गर्न

## छिटो निदान

विशेष समस्याहरूमा छिर्नु अगाडि, निदान जानकारी संकलन गर्न यी कमाण्डहरू चलाउनुहोस्:

```bash
# azd संस्करण र स्वास्थ्य जाँच गर्नुहोस्
azd version
azd config list

# Azure प्रमाणीकरण जाँच गर्नुहोस्
az account show
az account list

# हालको वातावरण जाँच गर्नुहोस्
azd env show
azd env get-values

# डिबग लगिङ सक्षम गर्नुहोस्
export AZD_DEBUG=true
azd <command> --debug
```

## प्रमाणीकरणसम्बन्धी समस्याहरू

### मुद्दा: "Failed to get access token"
**लक्षणहरू:**
- `azd up` प्रमाणीकरण त्रुटिहरूका साथ असफल हुन्छ
- आदेशहरूले "unauthorized" वा "access denied" फर्काउँछन्

**समाधानहरू:**
```bash
# 1. Azure CLI सँग पुन: प्रमाणीकरण गर्नुहोस्
az login
az account show

# 2. क्यास गरिएको प्रमाण-पत्रहरू मेटाउनुहोस्
az account clear
az login

# 3. डिभाइस कोड फ्लो प्रयोग गर्नुहोस् (हेडलेस प्रणालीहरूको लागि)
az login --use-device-code

# 4. स्पष्ट सदस्यता सेट गर्नुहोस्
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### मुद्दा: डिप्लोयमेन्टको समयमा "Insufficient privileges"
**लक्षणहरू:**
- अनुमति सम्बन्धी त्रुटिहरूका साथ डिप्लोयमेन्ट असफल हुन्छ
- केही Azure स्रोतहरू सिर्जना गर्न सकिँदैन

**समाधानहरू:**
```bash
# 1. आफ्नो Azure भूमिका असाइनमेन्टहरू जाँच गर्नुहोस्
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. सुनिश्चित गर्नुहोस् कि तपाईंसँग आवश्यक भूमिकाहरू छन्
# - Contributor (संसाधन सिर्जना गर्नका लागि)
# - User Access Administrator (भूमिका आवंटनको लागि)

# 3. उचित अनुमतिहरूका लागि आफ्नो Azure प्रशासकसँग सम्पर्क गर्नुहोस्
```

### मुद्दा: मल्टि-टेनेन्ट प्रमाणीकरण समस्याहरू
**समाधानहरू:**
```bash
# 1. विशिष्ट टेनेंटसँग लगइन गर्नुहोस्
az login --tenant "your-tenant-id"

# 2. कन्फिगरेसनमा टेनेंट सेट गर्नुहोस्
azd config set auth.tenantId "your-tenant-id"

# 3. यदि टेनेंट परिवर्तन गर्दै हुनुहुन्छ भने टेनेंट क्यास खाली गर्नुहोस्
az account clear
```

## 🏗️ पूर्वाधार प्रावधान त्रुटिहरू

### मुद्दा: स्रोत नाम द्वन्द्व
**लक्षणहरू:**
- "The resource name already exists" त्रुटिहरू
- स्रोत सिर्जनाको समयमा डिप्लोयमेन्ट असफल हुन्छ

**समाधानहरू:**
```bash
# 1. टोकनहरू सहित अद्वितीय स्रोत नामहरू प्रयोग गर्नुहोस्
# तपाईंको Bicep टेम्पलेटमा:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. वातावरणको नाम परिवर्तन गर्नुहोस्
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. विद्यमान स्रोतहरू सफा गर्नुहोस्
azd down --force --purge
```

### मुद्दा: स्थान/रीजन उपलब्ध छैन
**लक्षणहरू:**
- "The location 'xyz' is not available for resource type"
- चयन गरिएको रीजनमा केही SKU हरू उपलब्ध छैनन्

**समाधानहरू:**
```bash
# 1. स्रोत प्रकारका लागि उपलब्ध स्थानहरू जाँच गर्नुहोस्
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. सामान्यतया उपलब्ध क्षेत्रहरू प्रयोग गर्नुहोस्
azd config set defaults.location eastus2
# वा
azd env set AZURE_LOCATION eastus2

# 3. क्षेत्र अनुसार सेवाको उपलब्धता जाँच गर्नुहोस्
# भेट्नुहोस्: https://azure.microsoft.com/global-infrastructure/services/
```

### मुद्दा: कोटा अधिक भयो त्रुटिहरू
**लक्षणहरू:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**समाधानहरू:**
```bash
# 1. हालको कोटा प्रयोग जाँच गर्नुहोस्
az vm list-usage --location eastus2 -o table

# 2. Azure पोर्टल मार्फत कोटा वृद्धि अनुरोध गर्नुहोस्
# जानुहोस्: सदस्यताहरू > प्रयोग + कोटा

# 3. विकासका लागि साना SKUहरू प्रयोग गर्नुहोस्
# main.parameters.json मा:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. प्रयोग नभएका स्रोतहरू हटाउनुहोस्
az resource list --query "[?contains(name, 'unused')]" -o table
```

### मुद्दा: Bicep टेम्पलेट त्रुटिहरू
**लक्षणहरू:**
- टेम्पलेट मान्यकरण विफलताहरू
- Bicep फाइलहरूमा सिन्ट्याक्स त्रुटिहरू

**समाधानहरू:**
```bash
# 1. Bicep सिन्ट्याक्स मान्य गर्नुहोस्
az bicep build --file infra/main.bicep

# 2. Bicep लिन्टर प्रयोग गर्नुहोस्
az bicep lint --file infra/main.bicep

# 3. प्यारामिटर फाइलको सिन्ट्याक्स जाँच गर्नुहोस्
cat infra/main.parameters.json | jq '.'

# 4. परिनियोजन परिवर्तनहरूको पूर्वावलोकन गर्नुहोस्
azd provision --preview
```

## 🚀 डिप्लोयमेन्ट असफलताहरू

### मुद्दा: निर्माण असफलता
**लक्षणहरू:**
- डिप्लोयमेन्टको समयमा एप्लिकेसन निर्माण हुन नसक्ने
- प्याकेज इन्स्टलेशन त्रुटिहरू

**समाधानहरू:**
```bash
# 1. डिबग फ्ल्यागसहित बिल्ड आउटपुट जाँच गर्नुहोस्
azd deploy --service web --debug

# 2. डिप्लोय गरिएको सेवा स्थिति हेर्नुहोस्
azd show

# 3. बिल्ड स्थानीय रूपमा परीक्षण गर्नुहोस्
cd src/web
npm install
npm run build

# 3. Node.js/Python संस्करणहरूबीचको अनुकूलता जाँच गर्नुहोस्
node --version  # Should match azure.yaml settings
python --version

# 4. बिल्ड क्यास खाली गर्नुहोस्
rm -rf node_modules package-lock.json
npm install

# 5. यदि कन्टेनर प्रयोग गर्दै हुनुहुन्छ भने Dockerfile जाँच गर्नुहोस्
docker build -t test-image .
docker run --rm test-image
```

### मुद्दा: कन्टेनर डिप्लोयमेन्ट असफलताहरू
**लक्षणहरू:**
- कन्टेनर एपहरू सुरु हुन सक्दैनन्
- इमेज पुल त्रुटिहरू

**समाधानहरू:**
```bash
# 1. स्थानीय रूपमा Docker बिल्ड परीक्षण गर्नुहोस्
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Azure CLI प्रयोग गरेर कन्टेनर लगहरू जाँच गर्नुहोस्
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. azd मार्फत अनुप्रयोग अनुगमन गर्नुहोस्
azd monitor --logs

# 3. कन्टेनर रजिस्ट्री पहुँच सत्यापित गर्नुहोस्
az acr login --name myregistry

# 4. कन्टेनर एप्लिकेसन कन्फिगरेसन जाँच गर्नुहोस्
az containerapp show --name my-app --resource-group my-rg
```

### मुद्दा: डाटाबेस कनेक्सन असफलताहरू
**लक्षणहरू:**
- एप्लिकेसन डाटाबेसमा जडान हुन सक्दैन
- कनेक्सन टाइमआउट त्रुटिहरू

**समाधानहरू:**
```bash
# 1. डेटाबेस फायरवाल नियमहरू जाँच गर्नुहोस्
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. एप्लिकेशनबाट जडान परीक्षण गर्नुहोस्
# आफ्नो एपमा अस्थायी रूपमा थप्नुहोस्:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. कनेक्शन स्ट्रिङको ढाँचा पुष्टि गर्नुहोस्
azd env get-values | grep DATABASE

# 4. डेटाबेस सर्भरको स्थिति जाँच गर्नुहोस्
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 कन्फिगरेसन सम्बन्धी समस्याहरू

### मुद्दा: वातावरण भेरियेबलहरू काम नगर्नु
**लक्षणहरू:**
- एपले कन्फिगरेसन मानहरू पढ्न सक्दैन
- वातावरण भेरियेबलहरू खाली देखिन्छन्

**समाधानहरू:**
```bash
# 1. वातावरणीय चरहरू सेट गरिएको छ कि छैन जाँच गर्नुहोस्
azd env get-values
azd env get DATABASE_URL

# 2. azure.yaml फाइलमा चरका नामहरू जाँच गर्नुहोस्
cat azure.yaml | grep -A 5 env:

# 3. अनुप्रयोग पुनः सुरु गर्नुहोस्
azd deploy --service web

# 4. एप सेवा कन्फिगरेसन जाँच गर्नुहोस्
az webapp config appsettings list --name myapp --resource-group myrg
```

### मुद्दा: SSL/TLS प्रमाणपत्र समस्याहरू
**लक्षणहरू:**
- HTTPS काम नगर्नु
- प्रमाणपत्र मान्यकरण त्रुटिहरू

**समाधानहरू:**
```bash
# 1. SSL प्रमाणपत्रको स्थिति जाँच गर्नुहोस्
az webapp config ssl list --resource-group myrg

# 2. केवल HTTPS सक्षम गर्नुहोस्
az webapp update --name myapp --resource-group myrg --https-only true

# 3. आवश्यकता भएमा कस्टम डोमेन थप्नुहोस्
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### मुद्दा: CORS कन्फिगरेसन समस्याहरू
**लक्षणहरू:**
- फ्रन्टएण्डले API कल गर्न सक्दैन
- क्रस-अरिजिन अनुरोध अवरुद्ध

**समाधानहरू:**
```bash
# 1. App Service को लागि CORS कन्फिगर गर्नुहोस्
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. CORS सम्हाल्न API अपडेट गर्नुहोस्
# Express.js मा:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. सही URL हरूमा चलिरहेको छ कि छैन जाँच गर्नुहोस्
azd show
```

## 🌍 वातावरण व्यवस्थापनसम्बन्धी समस्याहरू

### मुद्दा: वातावरण स्विचिङ समस्याहरू
**लक्षणहरू:**
- गलत वातावरण प्रयोग भइरहेछ
- कन्फिगरेसन ठीकसँग स्विच हुँदैन्

**समाधानहरू:**
```bash
# 1. सबै वातावरणहरू सूचीबद्ध गर्नुहोस्
azd env list

# 2. वातावरणलाई स्पष्ट रूपमा चयन गर्नुहोस्
azd env select production

# 3. वर्तमान वातावरण जाँच गर्नुहोस्
azd env show

# 4. बिग्रिएको खण्डमा नयाँ वातावरण सिर्जना गर्नुहोस्
azd env new production-new
azd env select production-new
```

### मुद्दा: वातावरण भ्रष्ट भएको
**लक्षणहरू:**
- वातावरण अवैध अवस्थामा देखिन्छ
- स्रोतहरू कन्फिगरेसनसँग मेल खाँदैनन्

**समाधानहरू:**
```bash
# 1. वातावरणको अवस्था ताजा गर्नुहोस्
azd env refresh

# 2. वातावरणको विन्यास रिसेट गर्नुहोस्
azd env new production-reset
# आवश्यक वातावरण भेरिएबलहरू प्रतिलिपि गर्नुहोस्
azd env set DATABASE_URL "your-value"

# 3. अवस्थित स्रोतहरू आयात गर्नुहोस् (यदि सम्भव छ)
# हातैले .azure/production/config.json लाई स्रोत ID हरूले अद्यावधिक गर्नुहोस्
```

## 🔍 प्रदर्शनसम्बन्धी समस्याहरू

### मुद्दा: ढिला डिप्लोयमेन्ट समय
**लक्षणहरू:**
- डिप्लोयमेन्टहरू धेरै समय लिन्छन्
- डिप्लोयमेन्टको क्रममा टाइमआउटहरू

**समाधानहरू:**
```bash
# 1. छिटो पुनरावृत्तिको लागि विशिष्ट सेवाहरू तैनाथ गर्नुहोस्
azd deploy --service web
azd deploy --service api

# 2. पूर्वाधार अपरिवर्तित हुँदा केवल कोड-आधारित तैनाती प्रयोग गर्नुहोस्
azd deploy  # azd up भन्दा छिटो

# 3. निर्माण प्रक्रिया अनुकूलित गर्नुहोस्
# package.json मा:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. स्रोत स्थानहरू जाँच गर्नुहोस् (समान क्षेत्र प्रयोग गर्नुहोस्)
azd config set defaults.location eastus2
```

### मुद्दा: एप्लिकेसन प्रदर्शन समस्याहरू
**लक्षणहरू:**
- ढिलो प्रतिक्रिया समय
- उच्च स्रोत प्रयोग

**समाधानहरू:**
```bash
# 1. स्रोतहरू बढाउनुहोस्
# main.parameters.json मा SKU अद्यावधिक गर्नुहोस्:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Application Insights निगरानी सक्षम गर्नुहोस्
azd monitor --overview

# 3. Azure मा अनुप्रयोगका लगहरू जाँच गर्नुहोस्
az webapp log tail --name myapp --resource-group myrg
# वा Container Apps का लागि:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. क्यासिङ लागू गर्नुहोस्
# Redis क्यासलाई तपाईंको पूर्वाधारमा थप्नुहोस्
```

## 🛠️ समस्या निवारण उपकरण र कमाण्डहरू

### डिबग कमाण्डहरू
```bash
# व्यापक डिबगिङ
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# azd संस्करण जाँच गर्नुहोस्
azd version

# हालको कन्फिगरेसन हेर्नुहोस्
azd config list

# कनेक्टिविटी परीक्षण गर्नुहोस्
curl -v https://myapp.azurewebsites.net/health
```

### लग विश्लेषण
```bash
# Azure CLI मार्फत अनुप्रयोग लगहरू
az webapp log tail --name myapp --resource-group myrg

# azd प्रयोग गरेर अनुप्रयोग अनुगमन गर्नुहोस्
azd monitor --logs
azd monitor --live

# Azure संसाधन लगहरू
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# कन्टेनर लगहरू (Container Apps का लागि)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### स्रोत अनुसन्धान
```bash
# सबै स्रोतहरू सूचीबद्ध गर्नुहोस्
az resource list --resource-group myrg -o table

# स्रोतको स्थिति जाँच गर्नुहोस्
az webapp show --name myapp --resource-group myrg --query state

# नेटवर्क निदान
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 थप सहयोग प्राप्त गर्न

### कहिले एस्केलेट गर्ने
- सबै समाधान प्रयास गरेपछि पनि प्रमाणीकरण समस्याहरू कायम रह्यो भने
- Azure सेवाहरूसँग सम्बन्धित पूर्वाधार समस्याहरू हुँदा
- बिलिङ वा सदस्यता सम्बन्धी समस्याहरू हुँदा
- सुरक्षा सम्बन्धी चिन्ताहरू वा घटनाहरू हुँदा

### समर्थन च्यानलहरू
```bash
# 1. Azure सेवा स्वास्थ्य जाँच गर्नुहोस्
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Azure समर्थन टिकट सिर्जना गर्नुहोस्
# जानुहोस्: https://portal.azure.com -> सहायता + समर्थन

# 3. समुदाय स्रोतहरू
# - Stack Overflow: azure-developer-cli ट्याग
# - GitHub इश्यूहरू: https://github.com/Azure/azure-dev/issues
# - Microsoft प्रश्नोत्तर: https://learn.microsoft.com/en-us/answers/
```

### संकलन गर्नुपर्ने जानकारी
समर्थन सम्पर्क गर्नु अघि, संकलन गर्नुहोस्:
- `azd version` आउटपुट
- `azd config list` आउटपुट
- `azd show` आउटपुट (हालको डिप्लोयमेन्ट स्थिति)
- त्रुटि सन्देशहरू (पूर्ण टेक्स्ट)
- समस्यालाई पुन:उत्पादन गर्ने चरणहरू
- वातावरण विवरणहरू (`azd env show`)
- समस्याको सुरु भएको समयरेखा

### लग संकलन स्क्रिप्ट
```bash
#!/bin/bash
# collect-debug-info.sh

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

### पूर्व-डिप्लोयमेन्ट चेकलिस्ट
```bash
# 1. प्रमाणीकरण मान्य गर्नुहोस्
az account show

# 2. कोटा र सीमाहरू जाँच गर्नुहोस्
az vm list-usage --location eastus2

# 3. टेम्पलेटहरू मान्य गर्नुहोस्
az bicep build --file infra/main.bicep

# 4. पहिले स्थानीय रूपमा परीक्षण गर्नुहोस्
npm run build
npm run test

# 5. ड्राइ-रन तैनातीहरू प्रयोग गर्नुहोस्
azd provision --preview
```

### निगरानी सेटअप
```bash
# Application Insights सक्षम गर्नुहोस्
# main.bicep मा थप्नुहोस्:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# अलर्ट सेट गर्नुहोस्
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
- [स्रोतहरू प्रावधान](../chapter-04-infrastructure/provisioning.md) - पूर्वाधार समस्या निवारण
- [क्षमता योजना](../chapter-06-pre-deployment/capacity-planning.md) - स्रोत योजना मार्गदर्शन
- [SKU चयन](../chapter-06-pre-deployment/sku-selection.md) - सेवा तह सिफारिसहरू

---

**सुझाव**: जब पनि समस्याEncounter गर्ने बित्तिकै यो मार्गदर्शिकालाई बुकमार्कमा राख्नुहोस् र सन्दर्भ गर्नुहोस्। अधिकांश समस्याहरू पहिले नै देखिएका छन् र तिनीहरूको स्थापित समाधानहरू उपलब्ध छन्!

---

**नेभिगेसन**
- **पछिल्लो पाठ**: [स्रोतहरू प्रावधान](../chapter-04-infrastructure/provisioning.md)
- **अर्को पाठ**: [डिबगिङ गाइड](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो कागजात AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरी अनुवाद गरिएको हो। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया जानकारि राख्नुहोस कि स्वचालित अनुवादमा त्रुटि वा असावधानी हुन सक्छ। मूल कागजातलाई यसको मूल भाषामा नै आधिकारिक स्रोत मानिनु पर्छ। महत्त्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलतफहमी वा गलत व्याख्याका लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->