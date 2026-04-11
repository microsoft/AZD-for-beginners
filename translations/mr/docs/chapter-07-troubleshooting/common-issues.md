# सामान्य समस्या आणि उपाय

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD नवशिक्यांसाठी](../../README.md)
- **📖 सध्याचा अध्याय**: अध्याय 7 - समस्या निवारण आणि डीबगिंग
- **⬅️ मागील अध्याय**: [अध्याय 6: प्री-फ्लाइट तपासण्या](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ पुढचे**: [डीबगिंग मार्गदर्शक](debugging.md)
- **🚀 पुढचा अध्याय**: [अध्याय 8: उत्पादन आणि एंटरप्राइझ पॅटर्न्स](../chapter-08-production/production-ai-practices.md)

## परिचय

हा सर्वसमावेशक समस्या निवारण मार्गदर्शक Azure Developer CLI वापरताना सहसा येणाऱ्या समस्यांवर आधारित आहे. प्रमाणीकरण, तैनाती, इन्फ्रास्ट्रक्चर प्रोविजनिंग आणि अनुप्रयोग कॉन्फिगरेशनसंबंधी सामान्य समस्या कशा ओळखाव्यात, त्यांचे निदान कसे करायचे आणि त्यांचे निराकरण कसे करायचे हे शिका. प्रत्येक समस्येत तपशीलवार लक्षणे, मूळ कारणे आणि टप्प्याटप्प्याने निराकरण प्रक्रिया दिल्या आहेत.

## शिकण्याचे उद्दिष्टे

हा मार्गदर्शक पूर्ण केल्यावर, आपण:
- Azure Developer CLI समस्या निदान करण्याच्या तंत्रांमध्ये प्राविण्य मिळवाल
- सामान्य प्रमाणीकरण आणि परवानगी-संबंधी समस्या व त्यांच्या उपायांचा अभ्यास कराल
- तैनाती अपयश, इन्फ्रास्ट्रक्चर प्रोविजनिंग त्रुटी आणि कॉन्फिगरेशन समस्या सोडवू शकाल
- सक्रिय मॉनिटरिंग आणि डीबगिंग धोरणे अमलात आणाल
- जटिल समस्यांसाठी प्रणालीबद्ध समस्या निवारण पद्धती लागू कराल
- भविष्यातील समस्यांपासून बचावासाठी योग्य लॉगिंग आणि मॉनिटरिंग कॉन्फिगर कराल

## शिक्षणाचे परिणाम

पूर्ण केल्यावर, आपण सक्षम असाल:
- अंगभूत निदान साधने वापरून Azure Developer CLI समस्या ओळखणे
- प्रमाणीकरण, सबस्क्रिप्शन आणि परवानगी-संबंधी समस्या स्वतंत्रपणे निराकरण करणे
- तैनाती अपयश आणि इन्फ्रास्ट्रक्चर प्रोविजनिंग त्रुटी प्रभावीपणे तपासणे आणि सोडवणे
- अनुप्रयोग कॉन्फिगरेशन समस्या व वातावरण-विशिष्ट समस्या डीबग करणे
- संभाव्य समस्यांचे पूर्वसूचक ओळखण्यासाठी मॉनिटरिंग आणि अलर्टिंग अमलात आणणे
- लॉगिंग, डीबगिंग आणि समस्या निराकरणाच्या सर्वोत्तम पद्धती लागू करणे

## जलद निदान

विशिष्ट समस्यांमध्ये जाण्यापूर्वी, निदान माहिती गोळा करण्यासाठी हे आदेश चालवा:

```bash
# azd आवृत्ती आणि स्थिती तपासा
azd version
azd config show

# Azure प्रमाणीकरण सत्यापित करा
az account show
az account list

# सध्याचे वातावरण तपासा
azd env list
azd env get-values

# डिबग लॉगिंग सक्षम करा
export AZD_DEBUG=true
azd <command> --debug
```

## प्रमाणीकरण संबंधी समस्या

### समस्या: "Failed to get access token"
**लक्षणे:**
- `azd up` प्रमाणीकरण त्रुटींसह अयशस्वी होते
- आदेश "unauthorized" किंवा "access denied" परत करतात

**उपाय:**
```bash
# 1. Azure CLI सह पुन्हा प्रमाणीकरण करा
az login
az account show

# 2. कॅश केलेली क्रेडेन्शियल्स साफ करा
az account clear
az login

# 3. डिव्हाइस कोड प्रवाह वापरा (हेडलॅस सिस्टमसाठी)
az login --use-device-code

# 4. विशिष्ट सदस्यता सेट करा
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### समस्या: "Insufficient privileges" दरम्यान तैनाती
**लक्षणे:**
- परवानगी त्रुटींसह तैनाती अयशस्वी होते
- काही Azure संसाधने तयार करता येत नाहीत

**उपाय:**
```bash
# 1. Azure मधील आपल्या भूमिका नियुक्त्या तपासा
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. खात्री करा की आपल्याकडे आवश्यक भूमिका आहेत
# - Contributor (संसाधन निर्मितीसाठी)
# - User Access Administrator (भूमिका नियुक्तीसाठी)

# 3. योग्य परवानग्यांसाठी आपल्या Azure प्रशासकाशी संपर्क साधा
```

### समस्या: मल्टी-टेनंट प्रमाणीकरण समस्या
**उपाय:**
```bash
# 1. विशिष्ट टेनंटसह लॉगिन करा
az login --tenant "your-tenant-id"

# 2. कॉन्फिगरेशनमध्ये टेनंट सेट करा
azd config set auth.tenantId "your-tenant-id"

# 3. टेनंट बदलताना टेनंट कॅश साफ करा
az account clear
```

## 🏗️ इन्फ्रास्ट्रक्चर प्रोविजनिंग त्रुटी

### समस्या: संसाधन नावांचे संघर्ष
**लक्षणे:**
- "The resource name already exists" त्रुटी
- संसाधन तयार करताना तैनाती अयशस्वी होते

**उपाय:**
```bash
# 1. टोकन्ससह अद्वितीय संसाधन नावे वापरा
# तुमच्या Bicep टेम्पलेटमध्ये:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. पर्यावरणाचे नाव बदला
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. विद्यमान संसाधने साफ करा
azd down --force --purge
```

### समस्या: लोकेशन/रीजन उपलब्ध नाही
**लक्षणे:**
- "The location 'xyz' is not available for resource type"
- निवडलेल्या प्रदेशात काही SKUs उपलब्ध नाहीत

**उपाय:**
```bash
# 1. संसाधन प्रकारांसाठी उपलब्ध ठिकाणे तपासा
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. सामान्यपणे उपलब्ध क्षेत्रे वापरा
azd config set defaults.location eastus2
# किंवा
azd env set AZURE_LOCATION eastus2

# 3. क्षेत्रानुसार सेवा उपलब्धता तपासा
# भेट द्या: https://azure.microsoft.com/global-infrastructure/services/
```

### समस्या: कोटा ओलांडले गेले आहे
**लक्षणे:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**उपाय:**
```bash
# 1. सध्याचा कोटा वापर तपासा
az vm list-usage --location eastus2 -o table

# 2. Azure पोर्टलद्वारे कोटा वाढीची विनंती करा
# या ठिकाणी जा: Subscriptions > Usage + quotas

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
- टेम्पलेट व्हॅलिडेशन अयशस्वी
- Bicep फाइल्समधील सिंटॅक्स त्रुटी

**उपाय:**
```bash
# 1. Bicep वाक्यरचना सत्यापित करा
az bicep build --file infra/main.bicep

# 2. Bicep लिंटर वापरा
az bicep lint --file infra/main.bicep

# 3. पॅरामीटर फाइलची वाक्यरचना तपासा
cat infra/main.parameters.json | jq '.'

# 4. तैनातीतील बदलांचे पूर्वावलोकन करा
azd provision --preview
```

## 🚀 तैनाती अपयश

### समस्या: बिल्ड अपयश
**लक्षणे:**
- तैनाती दरम्यान अनुप्रयोग बिल्ड करण्यात अयशस्वी
- पॅकेज इंस्टॉलेशन त्रुटी

**उपाय:**
```bash
# 1. डिबग फ्लॅगसह बिल्ड आउटपुट तपासा
azd deploy --service web --debug

# 2. तैनात केलेल्या सेवेची स्थिती पहा
azd show

# 3. बिल्ड स्थानिकपणे चाचणी करा
cd src/web
npm install
npm run build

# 3. Node.js/Python आवृत्ती सुसंगतता तपासा
node --version  # Should match azure.yaml settings
python --version

# 4. बिल्ड कॅशे साफ करा
rm -rf node_modules package-lock.json
npm install

# 5. कंटेनर वापरत असल्यास Dockerfile तपासा
docker build -t test-image .
docker run --rm test-image
```

### समस्या: कंटेनर तैनाती अपयश
**लक्षणे:**
- कंटेनर ऍप्स सुरू होण्यात अयशस्वी
- इमेज पुल त्रुटी

**उपाय:**
```bash
# 1. Docker बिल्ड स्थानिकपणे चाचणी करा
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Azure CLI वापरून कंटेनर लॉग तपासा
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. azd द्वारे अनुप्रयोगाचे निरीक्षण करा
azd monitor --logs

# 3. कंटेनर रजिस्ट्री प्रवेशाची पडताळणी करा
az acr login --name myregistry

# 4. कंटेनर अॅपचे कॉन्फिगरेशन तपासा
az containerapp show --name my-app --resource-group my-rg
```

### समस्या: डेटाबेस कनेक्शन अयशस्वी
**लक्षणे:**
- अ‍ॅप डेटाबेसशी कनेक्ट करू शकत नाही
- कनेक्शन टाईमआउट त्रुटी

**उपाय:**
```bash
# 1. डेटाबेस फायरवॉल नियम तपासा
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. अनुप्रयोगातून कनेक्टिव्हिटी तपासा
# आपल्या अॅपमध्ये तात्पुरते जोडा:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. कनेक्शन स्ट्रिंगचे स्वरूप सत्यापित करा
azd env get-values | grep DATABASE

# 4. डेटाबेस सर्व्हरची स्थिती तपासा
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 कॉन्फिगरेशन समस्या

### समस्या: पर्यावरण चल कार्य करत नाहीत
**लक्षणे:**
- अ‍ॅप कॉन्फिगरेशन मूल्ये वाचू शकत नाही
- पर्यावरण चल रिक्त दिसत आहेत

**उपाय:**
```bash
# 1. पर्यावरण चल सेट झाले आहेत का ते तपासा
azd env get-values
azd env get DATABASE_URL

# 2. azure.yaml मध्ये असलेल्या चलांची नावे तपासा
cat azure.yaml | grep -A 5 env:

# 3. अनुप्रयोग पुन्हा सुरू करा
azd deploy --service web

# 4. अॅप सर्व्हिसचे कॉन्फिगरेशन तपासा
az webapp config appsettings list --name myapp --resource-group myrg
```

### समस्या: SSL/TLS प्रमाणपत्र समस्या
**लक्षणे:**
- HTTPS कार्य करत नाही
- प्रमाणपत्र व्हॅलिडेशन त्रुटी

**उपाय:**
```bash
# 1. SSL प्रमाणपत्राची स्थिती तपासा
az webapp config ssl list --resource-group myrg

# 2. केवळ HTTPS सक्षम करा
az webapp update --name myapp --resource-group myrg --https-only true

# 3. सानुकूल डोमेन जोडा (आवश्यक असल्यास)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### समस्या: CORS कॉन्फिगरेशन समस्या
**लक्षणे:**
- फ्रंटएंड API कॉल करू शकत नाही
- Cross-origin request blocked

**उपाय:**
```bash
# 1. App Service साठी CORS कॉन्फिगर करा
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. CORS हाताळण्यासाठी API अद्यतनित करा
# Express.js मध्ये:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. योग्य URL वर चालत आहे का ते तपासा
azd show
```

## 🌍 वातावरण व्यवस्थापन समस्या

### समस्या: पर्यावरण बदलण्यास समस्या
**लक्षणे:**
- चुकीचे पर्यावरण वापरले जात आहे
- कॉन्फिगरेशन योग्यप्रकारे बदलत नाही

**उपाय:**
```bash
# 1. सर्व पर्यावरणांची यादी करा
azd env list

# 2. पर्यावरण स्पष्टपणे निवडा
azd env select production

# 3. सध्याचे पर्यावरण सत्यापित करा
azd env list

# 4. दूषित असल्यास नवीन पर्यावरण तयार करा
azd env new production-new
azd env select production-new
```

### समस्या: पर्यावरण भ्रष्टावस्था
**लक्षणे:**
- पर्यावरण अमान्य स्थिती दर्शवते
- संसाधने कॉन्फिगरेशनशी जुळत नाहीत

**उपाय:**
```bash
# 1. पर्यावरण स्थिती ताजे करा
azd env refresh

# 2. पर्यावरण कॉन्फिगरेशन रीसेट करा
azd env new production-reset
# आवश्यक पर्यावरण व्हेरिएबल्स कॉपी करा
azd env set DATABASE_URL "your-value"

# 3. विद्यमान संसाधने आयात करा (जर शक्य असेल तर)
# हाताने .azure/production/config.json मध्ये संसाधन आयडींसह अद्यतन करा
```

## 🔍 कार्यक्षमता समस्या

### समस्या: हळू तैनाती वेळ
**लक्षणे:**
- तैनाती खूप वेळ घेत आहेत
- तैनाती दरम्यान टाइमआउट्स

**उपाय:**
```bash
# 1. जलद पुनरावृत्ती साठी विशिष्ट सेवा तैनात करा
azd deploy --service web
azd deploy --service api

# 2. पायाभूत सुविधांमध्ये बदल नसल्यास फक्त कोड तैनात करा
azd deploy  # azd up पेक्षा जलद

# 3. बिल्ड प्रक्रियेचे अनुकूलन करा
# package.json मध्ये:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. संसाधन स्थान तपासा (एकाच प्रदेशाचा वापर करा)
azd config set defaults.location eastus2
```

### समस्या: अनुप्रयोग कार्यक्षमता समस्या
**लक्षणे:**
- प्रतिसाद वेळ हळू आहे
- उच्च संसाधन वापर

**उपाय:**
```bash
# 1. संसाधने वाढवा
# main.parameters.json मध्ये SKU अद्यतनित करा:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Application Insights चे मॉनिटरिंग सक्षम करा
azd monitor --overview

# 3. Azure मध्ये अनुप्रयोगाचे लॉग तपासा
az webapp log tail --name myapp --resource-group myrg
# किंवा कंटेनर अनुप्रयोगांसाठी:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. कॅशिंग लागू करा
# Redis कॅश आपल्या पायाभूत संरचनेत जोडा
```

## 🛠️ समस्या निवारण साधने आणि आदेश

### डीबग आदेश
```bash
# व्यापक डीबगिंग
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# azd आवृत्ती तपासा
azd version

# सध्याचे कॉन्फिगरेशन पाहा
azd config show

# कनेक्टिव्हिटी तपासा
curl -v https://myapp.azurewebsites.net/health
```

### लॉग विश्लेषण
```bash
# Azure CLI मार्फत अनुप्रयोग लॉग
az webapp log tail --name myapp --resource-group myrg

# azd वापरून अनुप्रयोगाचे निरीक्षण
azd monitor --logs
azd monitor --live

# Azure संसाधन लॉग
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# कंटेनर लॉग (Container Apps साठी)
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

## 🆘 अतिरिक्त मदत मिळविणे

### कधी एस्कॅलेट करावे
- सर्व उपाय केल्यानंतरही प्रमाणीकरण समस्या कायम असल्यास
- Azure सेवांशी संबंधित इन्फ्रास्ट्रक्चर समस्या असल्यास
- बिलिंग किंवा सबस्क्रिप्शन-संबंधी समस्या असल्यास
- सुरक्षा विचार किंवा घटना असल्यास

### समर्थन चॅनेल
```bash
# 1. Azure Service Health तपासा
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Azure समर्थन तिकिट तयार करा
# या लिंकवर जा: https://portal.azure.com -> मदत + समर्थन

# 3. समुदाय संसाधने
# - Stack Overflow: azure-developer-cli टॅग
# - GitHub इश्यूज: https://github.com/Azure/azure-dev/issues
# - Microsoft प्रश्नोत्तर: https://learn.microsoft.com/en-us/answers/
```

### संकलित करण्याची माहिती
समर्थनाशी संपर्क करण्यापूर्वी, खालील गोष्टी गोळा करा:
- `azd version` आउटपुट
- `azd config show` आउटपुट
- `azd show` आउटपुट (सध्याच्या तैनातीची स्थिती)
- त्रुटी संदेश (पूर्ण मजकूर)
- समस्या पुनरुत्पादन करण्यासाठी पावले
- पर्यावरण तपशील (`azd env get-values`)
- समस्या कधी सुरू झाली याची टाइमलाइन

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
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 समस्या प्रतिबंध

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

# मासिक खर्चाचे पुनरावलोकन
az consumption usage list --billing-period-name 202401

# त्रैमासिक सुरक्षा पुनरावलोकन
az security assessment list --resource-group myrg
```

## संबंधित संसाधने

- [डीबगिंग मार्गदर्शक](debugging.md) - प्रगत डीबगिंग तंत्रे
- [संसाधने प्रोविजनिंग](../chapter-04-infrastructure/provisioning.md) - इन्फ्रास्ट्रक्चर समस्या निवारण
- [क्षमता नियोजन](../chapter-06-pre-deployment/capacity-planning.md) - संसाधन नियोजन मार्गदर्शन
- [SKU निवड](../chapter-06-pre-deployment/sku-selection.md) - सेवा टियर शिफारसी

---

**टीप**: हा मार्गदर्शक बुकमार्क करून ठेवा आणि समस्या आढळल्यास त्याचा संदर्भ घ्या. बहुतेक समस्या आधीही पाहिल्या गेल्या आहेत आणि त्यांना स्थापित उपाय आहेत!

---

**नेव्हिगेशन**
- **मागील धडा**: [संसाधने प्रोविजनिंग](../chapter-04-infrastructure/provisioning.md)
- **पुढील धडा**: [डीबगिंग मार्गदर्शक](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करत असलो तरी, कृपया लक्षात घ्या की स्वयंचलित अनुवादांमध्ये चुका किंवा अशुद्धता असू शकतात. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी अनुवादाची शिफारस केली जाते. या अनुवादाच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमजुती किंवा चुकीच्या अर्थनिर्वचनांसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->