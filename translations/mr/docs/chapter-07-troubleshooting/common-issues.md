# सामान्य समस्या आणि उपाय

**Chapter Navigation:**
- **📚 Course Home**: [AZD प्रारंभकर्त्यांसाठी](../../README.md)
- **📖 Current Chapter**: अध्याय 7 - समस्या सोडवणे व डीबगिंग
- **⬅️ Previous Chapter**: [अध्याय 6: पूर्व-तपासणी](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Next**: [डीबगिंग मार्गदर्शक](debugging.md)
- **🚀 Next Chapter**: [अध्याय 8: उत्पादन व एंटरप्राइझ नमुने](../chapter-08-production/production-ai-practices.md)

## परिचय

हा सर्वसमावेशक त्रoubleshooting मार्गदर्शक Azure Developer CLI वापरताना उद्भवणाऱ्या सर्वात सामान्य समस्यांचा समावेश करतो. प्रमाणीकरण, तैनाती, इन्फ्रास्ट्रक्चर प्रोव्हिजनिंग आणि अनुप्रयोग कॉन्फिगरेशनशी संबंधित सामान्य समस्या कशा निदान, त्रुटी शोध आणि निराकरण करायच्या हे शिका. प्रत्येक समस्येमध्ये तपशीलवार लक्षणे, मूळ कारणे आणि टप्प्याटप्प्याने निराकरण प्रक्रियेचा समावेश आहे.

## शिकण्याची उद्दिष्टे

हा मार्गदर्शक पूर्ण केल्यानंतर आपण:
- Azure Developer CLI समस्या निदान करण्याच्या तंत्रांमध्ये प्रावीणता मिळवणार
- सामान्य प्रमाणीकरण आणि परवानगी समस्यांची ओळख व त्याची सोडवणूक समजून घेणार
- तैनाती अयशस्वी होणे, इन्फ्रास्ट्रक्चर प्रोव्हिजनिंग त्रुटी आणि कॉन्फिगरेशन समस्या सोडवणार
- सक्रिय मॉनिटरिंग आणि डीबगिंग धोरणे राबवणार
- गुंतागुंतीच्या समस्यांसाठी प्रणालीबद्ध त्रoubleshooting पद्धती लागू करणार
- भविष्यातील समस्या टाळण्यासाठी योग्य लॉगिंग आणि मॉनिटरिंग कॉन्फिगर करणार

## शिकण्याचे परिणाम

पूर्ण केल्यानंतर आपण सक्षम असाल:
- अंगभूत निदान साधने वापरून Azure Developer CLI समस्या निदान करण्यास
- प्रमाणीकरण, सबस्क्रिप्शन आणि परवानगी संबंधित समस्या स्वतंत्रपणे सोडविण्यास
- तैनाती अयशस्वी होणे आणि इन्फ्रास्ट्रक्चर प्रोव्हिजनिंग त्रुटी प्रभावीपणे ट्रबलशूट करण्यास
- अनुप्रयोग कॉन्फिगरेशन समस्या आणि एन्व्हायर्नमेंट-विशिष्ट समस्यांचा डीबग करण्यास
- संभाव्य समस्या सक्रियरीत्या ओळखण्यासाठी मॉनिटरिंग आणि अलर्टिंग अंमलात आणण्यास
- लॉगिंग, डीबगिंग आणि समस्या निराकरण कार्यप्रवाहांसाठी सर्वोत्तम सराव लागू करण्यास

## जलद निदान

विशिष्ट समस्यांकडे वळण्यापूर्वी खालील कमांड्स चालवून निदान माहिती गोळा करा:

```bash
# azd ची आवृत्ती आणि आरोग्य तपासा
azd version
azd config list

# Azure प्रमाणीकरणाची पडताळणी करा
az account show
az account list

# सध्याचे वातावरण तपासा
azd env show
azd env get-values

# डिबग लॉगिंग सक्षम करा
export AZD_DEBUG=true
azd <command> --debug
```

## प्रमाणीकरण समस्या

### समस्या: "Failed to get access token"
**लक्षणे:**
- `azd up` प्रमाणीकरण त्रुटींनी अयशस्वी होते
- कमांड्स "unauthorized" किंवा "access denied" परत करतात

**उपाय:**
```bash
# 1. Azure CLI सह पुन्हा प्रमाणीकरण करा
az login
az account show

# 2. कॅश केलेली क्रेडेन्शियल्स साफ करा
az account clear
az login

# 3. डिव्हाइस कोड फ्लो वापरा (हेडलॅस सिस्टमसाठी)
az login --use-device-code

# 4. स्पष्ट सदस्यता सेट करा
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### समस्या: तैनातीदरम्यान "Insufficient privileges"
**लक्षणे:**
- परवानगी त्रुटींमुळे तैनाती अयशस्वी होते
- काही Azure संसाधने तयार करता येत नाहीत

**उपाय:**
```bash
# 1. आपल्या Azure भूमिका नियुक्त्या तपासा
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. खात्री करा की आपल्याकडे आवश्यक भूमिका आहेत
# - Contributor (संसाधन निर्मितीसाठी)
# - User Access Administrator (भूमिका नियुक्त्यांसाठी)

# 3. योग्य परवानग्यांसाठी आपल्या Azure प्रशासकाशी संपर्क साधा
```

### समस्या: मल्टि-टेनेन्ट प्रमाणीकरण समस्या
**उपाय:**
```bash
# 1. विशिष्ट टेनेन्टसह लॉगिन करा
az login --tenant "your-tenant-id"

# 2. कॉन्फिगरेशनमध्ये टेनेन्ट सेट करा
azd config set auth.tenantId "your-tenant-id"

# 3. टेनेन्ट बदलत असल्यास टेनेन्ट कॅश साफ करा
az account clear
```

## 🏗️ इन्फ्रास्ट्रक्चर प्रोव्हिजनिंग त्रुटी

### समस्या: संसाधन नाव संघर्ष
**लक्षणे:**
- "The resource name already exists" त्रुटी
- संसाधन तयार करताना तैनाती अयशस्वी होते

**उपाय:**
```bash
# 1. टोकनांसह अद्वितीय रिसोर्स नावे वापरा
# आपल्या Bicep टेम्पलेटमध्ये:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. पर्यावरणाचे नाव बदला
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. मौजूदा रिसोर्सेस साफ करा
azd down --force --purge
```

### समस्या: स्थान/रीजन उपलब्ध नाही
**लक्षणे:**
- "The location 'xyz' is not available for resource type"
- निवडलेल्या प्रदेशात काही SKU उपलब्ध नसणे

**उपाय:**
```bash
# 1. संसाधन प्रकारांसाठी उपलब्ध ठिकाणे तपासा
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. सामान्यपणे उपलब्ध क्षेत्रे वापरा
azd config set defaults.location eastus2
# किंवा
azd env set AZURE_LOCATION eastus2

# 3. प्रदेशानुसार सेवा उपलब्धता तपासा
# भेट द्या: https://azure.microsoft.com/global-infrastructure/services/
```

### समस्या: कोटा ओलांडली गेली त्रुटी
**लक्षणे:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**उपाय:**
```bash
# 1. सध्याचा कोटा वापर तपासा
az vm list-usage --location eastus2 -o table

# 2. Azure पोर्टलद्वारे कोटा वाढीची विनंती करा
# या ठिकाणी जा: सदस्यता > वापर + कोटे

# 3. विकासासाठी लहान SKUs वापरा
# main.parameters.json मध्ये:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. न वापरलेल्या संसाधनांची साफसफाई करा
az resource list --query "[?contains(name, 'unused')]" -o table
```

### समस्या: Bicep टेम्पलेट त्रुटी
**लक्षणे:**
- टेम्पलेट सत्यापन अयशस्वी
- Bicep फाइल्समध्ये सिंटॅक्स त्रुटी

**उपाय:**
```bash
# 1. Bicep सिंटॅक्सची पडताळणी करा
az bicep build --file infra/main.bicep

# 2. Bicep लिंटर वापरा
az bicep lint --file infra/main.bicep

# 3. पॅरामीटर फाइलच्या सिंटॅक्सची पडताळणी करा
cat infra/main.parameters.json | jq '.'

# 4. तैनातीतील बदलांचे पूर्वावलोकन करा
azd provision --preview
```

## 🚀 तैनाती अयशस्व्यता

### समस्या: बिल्ड अयशस्व्य
**लक्षणे:**
- तैनाती दरम्यान अनुप्रयोग बिल्ड होत नाही
- पॅकेज इन्स्टॉलेशन त्रुटी

**उपाय:**
```bash
# 1. डिबग फ्लॅगसह बिल्ड आउटपुट तपासा
azd deploy --service web --debug

# 2. तैनात केलेल्या सेवांची स्थिती पहा
azd show

# 3. बिल्ड स्थानिकपणे चाचणी करा
cd src/web
npm install
npm run build

# 3. Node.js/Python आवृत्ती सुसंगतता तपासा
node --version  # azure.yaml मधील सेटिंग्जशी जुळले पाहिजेत
python --version

# 4. बिल्ड कॅशे साफ करा
rm -rf node_modules package-lock.json
npm install

# 5. कंटेनर वापरत असल्यास Dockerfile तपासा
docker build -t test-image .
docker run --rm test-image
```

### समस्या: कंटेनर तैनाती अयशस्व्य
**लक्षणे:**
- कंटेनर अॅप्स सुरू होत नाहीत
- इमेज पुल त्रुटी

**उपाय:**
```bash
# 1. Docker बिल्ड स्थानिकरीत्या तपासा
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Azure CLI वापरून कंटेनर लॉग तपासा
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. azd द्वारे अनुप्रयोगाचे निरीक्षण करा
azd monitor --logs

# 3. कंटेनर रजिस्ट्री प्रवेश सत्यापित करा
az acr login --name myregistry

# 4. कंटेनर अॅप कॉन्फिगरेशन तपासा
az containerapp show --name my-app --resource-group my-rg
```

### समस्या: डेटाबेस कनेक्शन अयशस्व्य
**लक्षणे:**
- अनुप्रयोग डेटाबेसशी कनेक्ट करू शकत नाही
- कनेक्शन टाइमआऊट त्रुटी

**उपाय:**
```bash
# 1. डेटाबेस फायरवॉल नियम तपासा
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. अनुप्रयोगातून कनेक्टिव्हिटी तपासा
# आपल्या अॅपमध्ये तात्पुरते जोडा:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. कनेक्शन स्ट्रिंगचे स्वरूप तपासा
azd env get-values | grep DATABASE

# 4. डेटाबेस सर्व्हरची स्थिती तपासा
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 कॉन्फिगरेशन समस्या

### समस्या: एन्व्हायर्नमेंट व्हेरिएबल काम करत नाहीत
**लक्षणे:**
- अॅप कॉन्फिगरेशन मूल्य वाचू शकत नाही
- एन्व्हायर्नमेंट व्हेरिएबल रिकामे दिसतात

**उपाय:**
```bash
# 1. पर्यावरणीय चल सेट केले आहेत का याची पडताळणी करा
azd env get-values
azd env get DATABASE_URL

# 2. azure.yaml मधील चलांची नावे तपासा
cat azure.yaml | grep -A 5 env:

# 3. अनुप्रयोग पुन्हा सुरू करा
azd deploy --service web

# 4. अॅप सेवा कॉन्फिगरेशन तपासा
az webapp config appsettings list --name myapp --resource-group myrg
```

### समस्या: SSL/TLS प्रमाणपत्र समस्या
**लक्षणे:**
- HTTPS कार्य करत नाही
- प्रमाणपत्र सत्यापन त्रुटी

**उपाय:**
```bash
# 1. SSL प्रमाणपत्राची स्थिती तपासा
az webapp config ssl list --resource-group myrg

# 2. फक्त HTTPS सक्षम करा
az webapp update --name myapp --resource-group myrg --https-only true

# 3. सानुकूल डोमेन जोडा (आवश्यक असल्यास)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### समस्या: CORS कॉन्फिगरेशन समस्या
**लक्षणे:**
- फ्रंटएंड API कॉल करू शकत नाही
- क्रॉस-ऑरिजन विनंती ब्लॉक केली गेली

**उपाय:**
```bash
# 1. App Service साठी CORS कॉन्फिगर करा
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. CORS हाताळण्यासाठी API अद्ययावत करा
# Express.js मध्ये:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. योग्य URLs वर चालत आहेत का ते तपासा
azd show
```

## 🌍 एन्व्हायर्नमेंट व्यवस्थापन समस्या

### समस्या: एन्व्हायर्नमेंट स्विचिंग समस्या
**लक्षणे:**
- चुकीचे एन्व्हायर्नमेंट वापरले जात आहे
- कॉन्फिगरेशन योग्यरित्या बदलत नाही

**उपाय:**
```bash
# 1. सर्व वातावरणांची यादी करा
azd env list

# 2. वातावरण स्पष्टपणे निवडा
azd env select production

# 3. सध्याचे वातावरण तपासा
azd env show

# 4. खराब झाल्यास नवीन वातावरण तयार करा
azd env new production-new
azd env select production-new
```

### समस्या: एन्व्हायर्नमेंट करप्शन
**लक्षणे:**
- एन्व्हायर्नमेंट अनवाझेज अवस्था दाखवते
- संसाधने कॉन्फिगरेशनशी जुळत नाहीत

**उपाय:**
```bash
# 1. पर्यावरणाची स्थिती रीफ्रेश करा
azd env refresh

# 2. पर्यावरण कॉन्फिगरेशन रीसेट करा
azd env new production-reset
# आवश्यक वातावरणीय चल कॉपी करा
azd env set DATABASE_URL "your-value"

# 3. अस्तित्वातील संसाधने आयात करा (जर शक्य असेल तर)
# हाताने .azure/production/config.json मध्ये संसाधन आयडीसह अद्यतन करा
```

## 🔍 कार्यक्षमता समस्या

### समस्या: तैनाती वेळ मंद
**लक्षणे:**
- तैनात्या खूप वेळ घेत आहेत
- तैनाती दरम्यान टाइमआऊट

**उपाय:**
```bash
# 1. जलद पुनरावृत्तीसाठी विशिष्ट सेवा तैनात करा
azd deploy --service web
azd deploy --service api

# 2. पायाभूत सुविधा न बदलल्यास फक्त कोड-आधारित तैनाती वापरा
azd deploy  # azd up पेक्षा जलद

# 3. बिल्ड प्रक्रिया अनुकूल करा
# package.json मध्ये:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. संसाधनांच्या स्थानांची तपासणी करा (समान प्रदेश वापरा)
azd config set defaults.location eastus2
```

### समस्या: अनुप्रयोग कार्यक्षमता समस्या
**लक्षणे:**
- प्रतिसाद वेळ मंद
- उच्च संसाधन वापर

**उपाय:**
```bash
# 1. संसाधने वाढवा
# main.parameters.json मध्ये SKU अद्यतनित करा:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Application Insights मॉनिटरिंग सक्षम करा
azd monitor --overview

# 3. Azure मध्ये अॅप्लिकेशन लॉग्स तपासा
az webapp log tail --name myapp --resource-group myrg
# किंवा Container Apps साठी:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. कॅशिंग लागू करा
# Redis कॅश आपल्या इन्फ्रास्ट्रक्चरमध्ये जोडा
```

## 🛠️ त्रoubleshooting साधने आणि कमांड्स

### डीबग कमांड्स
```bash
# सर्वसमावेशक डीबगिंग
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# azd आवृत्ती तपासा
azd version

# सध्याचे कॉन्फिगरेशन पहा
azd config list

# कनेक्टिव्हिटी तपासा
curl -v https://myapp.azurewebsites.net/health
```

### लॉग विश्लेषण
```bash
# Azure CLI द्वारे अनुप्रयोग नोंदी
az webapp log tail --name myapp --resource-group myrg

# azd वापरून अनुप्रयोगाचे निरीक्षण
azd monitor --logs
azd monitor --live

# Azure संसाधन नोंदी
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# कंटेनर नोंदी (Container Apps साठी)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### संसाधन तपासणी
```bash
# सर्व संसाधने यादी करा
az resource list --resource-group myrg -o table

# संसाधनाची स्थिती तपासा
az webapp show --name myapp --resource-group myrg --query state

# नेटवर्क निदान
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 अतिरिक्त मदत मिळवणे

### कधी एस्केलेट करावे
- सर्व उपाय करूनही प्रमाणीकरण समस्या कायम राहिल्यास
- Azure सेवांशी संबंधित इन्फ्रास्ट्रक्चर समस्या असल्यास
- बिलिंग किंवा सबस्क्रिप्शन संबंधित समस्या असल्यास
- सुरक्षा संबंधित चिंताग्रेस्त किंवा घटना झाल्यास

### सपोर्ट चॅनेल्स
```bash
# 1. Azure सेवा आरोग्य तपासा
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Azure समर्थन तिकीट तयार करा
# या पत्त्यावर जा: https://portal.azure.com -> मदत + समर्थन

# 3. समुदाय संसाधने
# - Stack Overflow: azure-developer-cli टॅग
# - GitHub इश्यूज: https://github.com/Azure/azure-dev/issues
# - Microsoft प्रश्नोत्तर: https://learn.microsoft.com/en-us/answers/
```

### गोळा करण्यासाठी माहिती
सपोर्टशी संपर्क करण्यापूर्वी खालील गोष्टी गोळा करा:
- `azd version` आउटपुट
- `azd config list` आउटपुट
- `azd show` आउटपुट (सद्य तैनाती स्थिती)
- त्रुटी संदेश (पूर्ण मजकूर)
- समस्या पुनरुत्पादन करण्याच्या पायऱ्या
- एन्व्हायर्नमेंट तपशील (`azd env show`)
- समस्येची सुरुवात कधी झाली याची टाइमलाइन

### लॉग संकलन स्क्रिप्ट
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

## 📊 समस्या प्रतिबंधन

### पूर्व-तैनाती तपासणी यादी
```bash
# 1. प्रमाणीकरण सत्यापित करा
az account show

# 2. कोटा आणि मर्यादा तपासा
az vm list-usage --location eastus2

# 3. टेम्पलेट्स सत्यापित करा
az bicep build --file infra/main.bicep

# 4. प्रथम स्थानिकपणे चाचणी करा
npm run build
npm run test

# 5. ड्राय-रन तैनाती वापरा
azd provision --preview
```

### मॉनिटरिंग सेटअप
```bash
# Application Insights सक्षम करा
# main.bicep मध्ये जोडा:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# अलर्ट सेट करा
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### नियमित देखभाल
```bash
# साप्ताहिक आरोग्य तपासण्या
./scripts/health-check.sh

# मासिक खर्च पुनरावलोकन
az consumption usage list --billing-period-name 202401

# त्रैमासिक सुरक्षा पुनरावलोकन
az security assessment list --resource-group myrg
```

## संबंधित संसाधने

- [डीबगिंग मार्गदर्शक](debugging.md) - प्रगत डीबगिंग तंत्र
- [संसाधन प्रोव्हिजनिंग](../chapter-04-infrastructure/provisioning.md) - इन्फ्रास्ट्रक्चर त्रoubleshooting
- [क्षमता नियोजन](../chapter-06-pre-deployment/capacity-planning.md) - संसाधन नियोजन मार्गदर्शन
- [SKU निवड](../chapter-06-pre-deployment/sku-selection.md) - सेवा स्तर शिफारसी

---

**Tip**: हा मार्गदर्शक ब्राउझरमध्ये किंवा बुकमार्कमध्ये ठेवा आणि प्रत्येक वेळी समस्या येताच पाहा. बहुतांश समस्या आधीच पाहिलेल्या असतात आणि त्यांचे स्थापित उपाय अस्तित्त्वात आहेत!

---

**Navigation**
- **Previous Lesson**: [संसाधन प्रोव्हिजनिंग](../chapter-04-infrastructure/provisioning.md)
- **Next Lesson**: [डीबगिंग मार्गदर्शक](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
हा दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित केला आहे. आम्ही अचूकतेसाठी प्रयत्न करतो, परंतु कृपया लक्षात घ्या की स्वयंचलित अनुवादांमध्ये चुका किंवा अचूकतेच्या त्रुटी असू शकतात. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत म्हणून मानला पाहिजे. महत्त्वाची माहिती असल्यास व्यावसायिक मानव अनुवादाचा सल्ला हवा. या अनुवादाच्या वापरामुळे उद्भवलेल्या कोणत्याही गैरसमजुतींबद्दल किंवा चुकीच्या अर्थ लावल्याबद्दल आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->